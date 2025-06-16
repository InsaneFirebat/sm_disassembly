
org $828000


;;; $8000: Game state 6/1Fh/28h (loading game data / set up new game / load demo game data) ;;;
GameState_6_1F_28_LoadingGameData_SetupNewGame_LoadDemoData:
    PHP
    REP #$30
    LDA.W GameState : CMP.W #$0028 : BNE .notDemo
    JSR InialiseIORegistersForGameplay
    JSR Load_StandardBG3Tiles_SpriteTiles_ClearTilemaps
    JSR LoadInitialPalette
    JSL InitializeSamus
    JSR LoadDemoRoomData
    BRA .gameplay

  .notDemo:
    LDA.L SRAMMirror_LoadingGameState : CMP.W #$0005 : BEQ .onZebes
    CMP.W #$001F : BEQ .ceres
    CMP.W #$0022 : BEQ .zebesLanding
    BRA .onZebes

  .zebesLanding:
    STZ.W AreaIndex
    LDA.W #$0012 : STA.W LoadStationIndex
    JSL LoadMirrorOfCurrentAreasMapExplored
    BRA .onZebes

  .ceres:
    LDA.W #$0006 : STA.W AreaIndex : STZ.W LoadStationIndex
    JSL ClearTimerRAM

  .onZebes:
    JSR InialiseIORegistersForGameplay
    JSR Load_StandardBG3Tiles_SpriteTiles_ClearTilemaps
    JSR LoadInitialPalette
    JSL InitializeSamus
    JSL LoadFromLoadStation

  .gameplay:
    JSL StartGameplay
    JSL InitialiseHUD_GameLoading
    JSL RTL_A09784
    PHP
    REP #$30
    LDY.W #$0020
    LDX.W #$0000

  .loopTargetSamusPalette:
    LDA.L Palettes_SpriteP4C0,X : STA.L TargetPalettes_SpriteP4,X
    INX #2
    DEY #2 : BNE .loopTargetSamusPalette
    PLP
    LDA.W #$0001 : STA.W ScreenFadeDelay : STA.W ScreenFadeCounter
    JSL EnableNMI
    JSL Enable_Enemy_Projectiles
    JSL Enable_PLMs
    JSL Enable_PaletteFXObjects
    JSL Enable_HDMAObjects
    JSL Enable_AnimatedTilesObjects
    JSL SetLiquidPhysicsType
    LDA.W GameState : CMP.W #$0028 : BNE +
    JMP .demo

+   LDA.L SRAMMirror_LoadingGameState : CMP.W #$0022 : BNE .notZebesLanding
    LDA.W #$0005
    JSL QueueMusicDataOrTrack_8FrameDelay
    LDA.W #$000F : STA.W EnemyTilesTransferLoopCounter

  .loopAlpha:
    JSL TransferEnemyTilesToVRAM_InitialiseEnemies
    JSL WaitForNMI
    DEC.W EnemyTilesTransferLoopCounter : BPL .loopAlpha
    INC.W GameState
    PHP
    REP #$30
    LDY.W #$0200
    LDX.W #$0000

  .loopAlphaPalettes:
    LDA.L TargetPalettes_BGP0,X : STA.L Palettes,X
    INX #2
    DEY #2 : BNE .loopAlphaPalettes
    PLP : PLP
    RTS

  .notZebesLanding:
    LDA.W #$0006 : STA.W EnemyTilesTransferLoopCounter

  .loopBeta:
    JSL TransferEnemyTilesToVRAM_InitialiseEnemies
    JSL WaitForNMI
    DEC.W EnemyTilesTransferLoopCounter : BPL .loopBeta
    LDA.W #$0007 : STA.W GameState
    PHP
    REP #$30
    LDY.W #$0200
    LDX.W #$0000

  .loopBetaPalettes:
    LDA.L TargetPalettes_BGP0,X : STA.L Palettes,X
    INX #2
    DEY #2 : BNE .loopBetaPalettes
    PLP
    LDA.L SRAMMirror_LoadingGameState : CMP.W #$001F : BNE .runSamusCmd
    LDA.W #$0000 : STA.L Palettes_SpriteP5+$1E
    LDA.W #$0008
    JSL Run_Samus_Command
    PLP
    RTS

  .runSamusCmd:
    LDA.W #$0009
    JSL Run_Samus_Command
    PLP
    RTS

  .demo:
    LDA.W #$0006 : STA.W EnemyTilesTransferLoopCounter

  .transferVRAM:
    JSL TransferEnemyTilesToVRAM_InitialiseEnemies
    JSL WaitForNMI
    DEC.W EnemyTilesTransferLoopCounter : BPL .transferVRAM
    LDA.W DemoScene : DEC : STA.B DP_Temp12
    ASL #3 : ADC.B DP_Temp12 : ASL : STA.B DP_Temp12
    LDA.W DemoSet : ASL : TAX
    LDA.W DemoRoomData_pointers,X : CLC : ADC.B DP_Temp12 : TAX
    LDA.W $0010,X : STA.B DP_Temp12
    LDX.W #$0000
    JSR.W (DP_Temp12,X)
    INC.W GameState
    PHP
    REP #$30
    LDY.W #$0200
    LDX.W #$0000

  .loopDemoPalettes:
    LDA.L TargetPalettes_BGP0,X : STA.L Palettes,X
    INX #2
    DEY #2 : BNE .loopDemoPalettes
    PLP : PLP
    RTS


;;; $819B: Initialise IO registers for gameplay ;;;
InialiseIORegistersForGameplay:
    PHP
    JSR InitialiseCPURegistersForGameplay
    JSR SetupPPUForGameplay
    PLP
    RTS


;;; $81A4: Initialise CPU registers for gameplay ;;;
InitialiseCPURegistersForGameplay:
    PHP
    SEP #$30
    LDA.B #$01 : STA.W $4200 : STA.B DP_IRQAutoJoy
    STZ.W $4201 : STZ.W $4202 : STZ.W $4203 : STZ.W $4204
    STZ.W $4205 : STZ.W $4206 : STZ.W $4207 : STZ.W $4208
    STZ.W $4209 : STZ.W $420A : STZ.W $420B : STZ.W $420C
    STZ.B DP_HDMAEnable
    LDA.B #$01 : STA.W $420D : STA.B DP_ROMAccessSpeed
    PLP
    RTS


;;; $81DD: Set up PPU for gameplay ;;;
SetupPPUForGameplay:
    PHP
    SEP #$30
    LDA.B #$80 : STA.W $2100 : STA.B DP_Brightness
    LDA.B #$03 : STA.W $2101 : STA.B DP_SpriteSizeAddr
    STZ.W $2102 : STZ.B DP_OAMAddrPrio
    LDA.B #$80 : STA.W $2103 : STA.B DP_OAMAddrPrio+1
    STZ.W $2104 : STZ.W $2104
    LDA.B #$09 : STA.W $2105 : STA.B DP_BGModeSize
    STZ.W $2106 : STZ.B DP_Mosaic
    STZ.B DP_BGTilesAddr : STZ.W $210B
    LDA.B #$04 : STA.B DP_BGTilesAddr+1 : STA.W $210C
    LDA.B #$51 : STA.B DP_BG1TilemapAddrSize : STA.W $2107
    LDA.B #$49 : STA.B DP_BG2TilemapAddrSize : STA.W $2108
    LDA.B #$5A : STA.B DP_BG3TilemapAddrSize : STA.W $2109
    LDA.B #$00 : STA.B DP_BG4TilemapAddrSize : STA.W $210A
    STZ.W $2115 : STZ.W $2123
    STZ.B DP_WindowMaskBG12 : STZ.W $2123
    STZ.B DP_WindowMaskBG12 : STZ.W $2124
    STZ.B DP_WindowMaskBG34 : STZ.W $2125
    STZ.B DP_WindowMaskSprite : STZ.W $2126
    STZ.B DP_Window1Left : STZ.W $2127
    STZ.B DP_Window1Right : STZ.W $2128
    STZ.B DP_Window2Left : STZ.W $2129
    STZ.B DP_Window2Right : STZ.W $212A
    STZ.B DP_Window12BGMaskLogic : STZ.W $212B
    STZ.B DP_Window12SpriteMaskLogic
    LDA.B #$17 : STA.W $212C : STA.B DP_MainScreenLayers
    STZ.W $212E : STZ.B DP_WindowAreaMainScreen
    LDA.B #$00 : STA.W $212D : STA.B DP_SubScreenLayers
    STZ.W $212F : STZ.B DP_WindowAreaSubScreen
    STZ.W $2130 : STZ.B DP_NextGameplayColorMathA
    STZ.W $2131 : STZ.B DP_NextGameplayColorMathB
    LDA.B #$E0 : STA.W $2132
    LDA.B #$00 : STA.W $2133 : STA.B DP_DisplayResolution
    REP #$30
    STZ.W OAMStack
    LDA.W #$0000
    LDX.W #$3000
    LDY.W #$07FE
    JSL WriteYBytesOfATo_7E0000_X_16bit
    LDA.W #$006F
    LDX.W #$4000
    LDY.W #$07FE
    JSL WriteYBytesOfATo_7E0000_X_16bit
    LDA.W #$2C0F
    LDX.W #$4000
    LDY.W #$00FE
    JSL WriteYBytesOfATo_7E0000_X_16bit
    PLP
    RTS


;;; $82C5: Load initial palette ;;;
LoadInitialPalette:
; Palette loaded when loading a save or demo.
; Nothing is displayed during this time, so it's unclear why this palette is loaded at all
    PHP
    SEP #$30
    PHP ; >.<
    REP #$30
    LDY.W #$0200
    LDX.W #$0000

  .loop:
    LDA.L Initial_Palette_BGPalette0,X : STA.L Palettes,X
    INX #2
    DEY #2 : BNE .loop
    PLP : PLP
    RTS


;;; $82E2: Load standard BG3 tiles and sprite tiles, clear tilemaps ;;;
Load_StandardBG3Tiles_SpriteTiles_ClearTilemaps:
    PHP
    SEP #$30
    LDA.B #$00 : STA.W $2116
    LDA.B #$40 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl Tiles_Standard_BG3
    dw $2000
    LDA.B #$02 : STA.W $420B
    LDA.B #$00 : STA.W $2116
    LDA.B #$60 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl Tiles_Standard_Sprite_0
    dw $4000
    LDA.B #$02 : STA.W $420B
    LDA.B #$00 : STA.W $2116
    LDA.B #$50 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl BG2Tilemap
    dw $1000
    LDA.B #$02 : STA.W $420B
    LDA.B #$00 : STA.W $2116
    LDA.B #$58 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl BG2Tilemap
    dw $0800
    LDA.B #$02 : STA.W $420B
    PLP
    RTS


;;; $8367: Game state 20h (made it to Ceres elevator) ;;;
GameState_20_MadeItToCeresElevator:
    PHP
    REP #$30
    LDA.W TimerStatus : BEQ +
    JSL DrawTimer

+   JSR GameState_8_MainGameplay
    DEC.W CeresElevatorFadeTimer : BEQ +
    BPL .return

+   INC.W GameState
    STZ.W ScreenFadeDelay : STZ.W ScreenFadeCounter

  .return:
    PLP
    RTS


;;; $8388: Game state 21h (blackout from Ceres) ;;;
GameState_21_BlackoutFromCeres:
    PHP
    REP #$30
    LDA.W TimerStatus : BEQ +
    JSL DrawTimer

+   JSR GameState_8_MainGameplay
    JSL HandleFadingOut
    SEP #$20
    LDA.B DP_Brightness : CMP.B #$80 : BEQ +
    REP #$20
    PLP
    RTS

+   JSL EnableNMI
    REP #$20
    JSL Wait_End_VBlank_Clear_HDMA
    JSL DisableHVCounterInterrupts
    STZ.W LayerBlending_DefaultConfig
    STZ.B DP_IRQCmd
    SEP #$20
    STZ.B DP_NextGameplayColorMathA : STZ.B DP_NextGameplayColorMathB
    LDA.B #$10 : STA.B DP_MainScreenLayers
    STZ.B DP_SubScreenLayers : STZ.B DP_WindowAreaMainScreen : STZ.B DP_WindowAreaSubScreen
    LDA.B #$09 : STA.B DP_BGModeSize
    REP #$20
    STZ.W ScreenFadeDelay : STZ.W ScreenFadeCounter
    LDA.W #$0022 : STA.L SRAMMirror_LoadingGameState : STA.W GameState
    LDA.W SaveSlotSelected
    JSL SaveToSRAM
    LDA.W #CinematicFunction_CeresGoesBoom_Initial : STA.W CinematicFunction
    STZ.W CeresStatus : STZ.W TimerStatus
    LDA.W #$0000
    JSL QueueMusicDataOrTrack_8FrameDelay
    LDA.W #$0002
    JSL QueueSound
    LDA.W #$0071
    JSL QueueSound_Lib2_Max15
    LDA.W #$0001
    JSL QueueSound_Lib3_Max15
    PLP
    RTS


;;; $8411: Game state 23h (time up) ;;;
GameState_23_TimeUp:
    PHP
    REP #$30
    JSR GameState_8_MainGameplay
    LDA.W #$0008 : STA.L PaletteChangeDenominator
    JSR Advance_GradualColorChange_ofAllPalettes
    BCC .return
    LDA.W #$0024 : STA.W GameState
    STZ.W ScreenFadeDelay : STZ.W ScreenFadeCounter

  .return:
    PLP
    RTS


;;; $8431: Game state 24h (whiting out from time up) ;;;
GameState_24_WhitingOutFromTimeUp:
    PHP
    REP #$30
    JSL HandleFadingOut
    SEP #$20
    LDA.B DP_Brightness : CMP.B #$80 : BEQ +
    REP #$20 ; >.<
    PLP
    RTS

+   JSL EnableNMI
    REP #$20
    JSL Wait_End_VBlank_Clear_HDMA
    JSL DisableHVCounterInterrupts
    STZ.W LayerBlending_DefaultConfig
    STZ.B DP_IRQCmd
    SEP #$20
    STZ.B DP_NextGameplayColorMathA : STZ.B DP_NextGameplayColorMathB
    LDA.B #$10 : STA.B DP_MainScreenLayers
    STZ.B DP_SubScreenLayers : STZ.B DP_WindowAreaMainScreen : STZ.B DP_WindowAreaSubScreen
    LDA.B #$09 : STA.B DP_BGModeSize
    REP #$20
    STZ.W ScreenFadeDelay : STZ.W ScreenFadeCounter
    STZ.W CeresStatus : STZ.W TimerStatus
    LDA.W #$0002
    JSL QueueSound
    LDA.W #$0071
    JSL QueueSound_Lib2_Max15
    LDA.W #$0001
    JSL QueueSound_Lib3_Max15
    LDA.W #$000E
    JSL CheckIfEvent_inA_HasHappened
    BCC .notZebesTimebomb
    STZ.W GameOptionsMenuIndex : STZ.W PauseMenu_MenuIndex
    LDX.W #$00FE

  .loop:
    STZ.W $1A8D,X ; >.< possibly a pre-release address range for menu RAM
    DEX #2 : BPL .loop
    LDA.W #$0019 : STA.W GameState
    PLP
    RTS

  .notZebesTimebomb:
    LDA.W #$0025 : STA.W GameState
    LDA.W #CinematicFunction_CeresGoesBoom_Initial : STA.W CinematicFunction
    PLP
    RTS


;;; $84BD: Game state 26h (Samus escapes from Zebes) ;;;
GameState_26_SamusEscapesFromZebes:
    PHP
    REP #$30
    JSR GameState_8_MainGameplay
    JSL HandleFadingOut
    SEP #$20
    LDA.B DP_Brightness : CMP.B #$80 : BEQ +
    REP #$20
    PLP
    RTS


+   JSL EnableNMI
    REP #$20
    JSL Wait_End_VBlank_Clear_HDMA
    JSL DisableHVCounterInterrupts
    STZ.W LayerBlending_DefaultConfig
    SEP #$20
    STZ.B DP_NextGameplayColorMathA : STZ.B DP_NextGameplayColorMathB
    LDA.B #$10 : STA.B DP_MainScreenLayers
    STZ.B DP_SubScreenLayers : STZ.B DP_WindowAreaMainScreen : STZ.B DP_WindowAreaSubScreen
    LDA.B #$09 : STA.B DP_BGModeSize
    REP #$20
    STZ.W ScreenFadeDelay : STZ.W ScreenFadeCounter
    LDA.W #$0027 : STA.W GameState
    LDA.W #CinematicFunction_Ending_Setup : STA.W CinematicFunction
    STZ.W TimerStatus
    LDA.W #$0000
    JSL QueueMusicDataOrTrack_8FrameDelay
    LDA.W #$0002
    JSL QueueSound
    LDA.W #$0071
    JSL QueueSound_Lib2_Max15
    LDA.W #$0001
    JSL QueueSound_Lib3_Max15
    PLP
    RTS


;;; $852D: Game state 29h (transition to demo) ;;;
GameState_29_TransitionToDemo:
    PHP
    REP #$30
    JSR GameState_8_MainGameplay
    JSL WaitForNMI
    JSL HDMAObjectHandler_HandleMusicQueue
    INC.W GameState
    SEP #$20
    LDA.B #$0F : STA.B DP_Brightness
    REP #$20
    PLP
    RTS


;;; $8548: Game state 2Ah (playing demo) ;;;
GameState_2A_PlayingDemo:
    PHP
    REP #$30
    JSR GameState_8_MainGameplay
    LDA.B DP_Controller1New : BEQ .decDemoTimer
    LDA.W #$0001 : STA.W DemoControlFlags
    BRA .endDemos

  .decDemoTimer:
    DEC.W DemoTimer : BEQ +
    BPL .return

+   STZ.W DemoControlFlags
    LDX.W #$005A

  .loop:
    JSL WaitForNMI
    LDA.B DP_Controller1New : BNE .pressedInput
    DEX : BNE .loop
    BRA .endDemos

  .pressedInput:
    LDA.W #$0001 : STA.W DemoControlFlags

  .endDemos:
    INC.W GameState
    STZ.W DisableSounds
    SEP #$20
    LDA.B #$80 : STA.B DP_Brightness
    REP #$20
    LDA.W #$0001 : STA.W ScreenFadeDelay : STA.W ScreenFadeCounter

  .return:
    PLP
    RTS


;;; $8593: Game state 2Bh (unload game data) ;;;
GameState_2B_UnloadGameData:
    PHP
    REP #$30
    LDA.W DemoControlFlags : CMP.W #$0001 : BEQ +
    JSR CheckForNextDemo

+   JSL EnableNMI
    INC.W GameState
    STZ.W ScreenFadeDelay : STZ.W ScreenFadeCounter
    JSL Wait_End_VBlank_Clear_HDMA
    JSL DisableHVCounterInterrupts
    STZ.W LayerBlending_DefaultConfig
    STZ.B DP_IRQCmd : STZ.B DP_NextIRQCmd
    JSL Disable_PaletteFXObjects
    JSL Clear_PaletteFXObjects
    LDA.W #MessageBoxIndex : DEC #2 : SEC : SBC.W #TitleMenu_SelectionMissileAnimTimer : TAX

  .clearNonGameplayRAM:
    STZ.W TitleMenu_SelectionMissileAnimTimer,X
    DEX #2 : BPL .clearNonGameplayRAM
    LDA.W #GameState : DEC #2 : SEC : SBC.W #PauseMenu_End : TAX

  .clearGameplayRAM:
    STZ.W PauseMenu_End,X
    DEX #2 : BPL .clearGameplayRAM
    SEP #$20
    STZ.B DP_NextGameplayColorMathA : STZ.B DP_NextGameplayColorMathB
    LDA.B #$10 : STA.B DP_MainScreenLayers
    STZ.B DP_SubScreenLayers : STZ.B DP_WindowAreaMainScreen : STZ.B DP_WindowAreaSubScreen
    REP #$20
    PLP
    RTS


;;; $85FB: Game state 2Ch (transition from demo) ;;;
GameState_2C_TransitionFromDemo:
    PHP
    REP #$30
    LDA.W #$0001 : STA.W GameState
    LDA.W DemoControlFlags : BMI .nextDemoScene
    BNE .titleSequence
    LDA.W #$0000
    JSL QueueMusicDataOrTrack_8FrameDelay
    STZ.W DisableSounds
    LDA.W #CinematicFunction_LoadTitleSequence : STA.W CinematicFunction
    PLP
    RTS

  .titleSequence:
    JSL Load_Title_Sequence_Graphics
    LDA.W #$0002 : STA.W SkipToTitleScreenIndex
    LDA.W #RTS_8B9A47 : STA.W CinematicFunction
    PLP
    RTS

  .nextDemoScene:
    LDA.W #$0028 : STA.W GameState
    PLP
    RTS


;;; $8637: Check for next demo ;;;
CheckForNextDemo:
    PHP
    REP #$30
    LDA.W DemoScene : ASL #3 : ADC.W DemoScene : ASL : STA.B DP_Temp12
    LDA.W DemoSet : ASL : TAX
    LDA.W DemoRoomData_pointers,X : CLC : ADC.B DP_Temp12 : TAX
    LDA.W $0000,X : CMP.W #$FFFF : BNE .nextDemoScene
    STZ.W DemoControlFlags
    LDA.W DemoSet : INC : CMP.W NumberOfDemoSets : BCC +
    LDA.W #$0000

+   STA.W DemoSet
    STZ.W DemoScene
    PLP
    RTS

  .nextDemoScene:
    LDA.W #$8000 : STA.W DemoControlFlags
    PLP
    RTS


;;; $8679: Load demo room data ;;;
LoadDemoRoomData:
    PHP
    REP #$30
    STZ.W DoorPointer
    LDA.W DemoScene : ASL #3 : ADC.W DemoScene : ASL : STA.B DP_Temp12
    LDA.W DemoSet : ASL : TAX
    LDA.W DemoRoomData_pointers,X : CLC : ADC.B DP_Temp12 : TAX
    LDA.W $0000,X : STA.W RoomPointer
    LDA.W $0002,X : STA.W DoorPointer
    LDA.W $0004,X : STA.W DoorBTS
    LDA.W $0006,X : STA.W Layer1XPosition : STA.W BG1XOffset
    LDA.W $0008,X : STA.W Layer1YPosition : STA.W BG1YOffset
    LDA.W $000A,X : CLC : ADC.W Layer1YPosition : STA.W SamusYPosition : STA.W SamusPreviousYPosition
    LDA.W Layer1XPosition : CLC : ADC.W #$0080 : CLC : ADC.W $000C,X : STA.W SamusXPosition : STA.W SamusPreviousXPosition
    LDA.W $000E,X : STA.W DemoTimer
    PHB
    SEP #$20
    LDA.B #$8F : PHA : PLB
    LDX.W RoomPointer
    LDA.W $0001,X : STA.W AreaIndex
    REP #$20
    PLB
    STZ.B DP_BG1XScroll : STZ.B DP_BG1YScroll
    INC.W DemoScene
    LDX.W #$0000

  .loopEvents:
    LDA.W #$FFFF
    STA.L SRAMMirror_ChozeBlockDestroyed,X : STA.L SRAMMirror_Items,X
    STA.L unusedD8F0,X : STA.L SRAMMirror_MapStations,X
    STA.L SRAMMirror_UsedSaveStationsElevators,X : STA.L SRAMMirror_UsedSaveStationsElevators+8,X
    LDA.W #$0000
    STA.L SRAMMirror_Doors,X : STA.L SRAMMirror_Event,X : STA.L SRAMMirror_Boss,X
    INX #2 : CPX.W #$0008 : BMI .loopEvents

  .loopItems:
    LDA.W #$FFFF : STA.L SRAMMirror_ChozeBlockDestroyed,X : STA.L SRAMMirror_Items,X
    LDA.W #$0000 : STA.L SRAMMirror_Doors,X
    INX #2 : CPX.W #$0040 : BMI .loopItems
    LDA.W #$0000
    LDX.W #$0000

  .loopMapData:
    STA.L ExploredMapTiles,X
    INX #2 : CPX.W #$0600 : BMI .loopMapData
    LDA.W #$0000
    STA.W MaxReserveEnergy : STA.W ReserveEnergy : STA.W ReserveTankMode
    STA.L SRAMMirror_LoadingGameState
    STA.W DisableMinimap
    PLP
    RTS


;;; $876C: Demo room data ;;;
DemoRoomData:
  .pointers:
; Pointers to demo room data
    dw DemoRoomData_set0
    dw DemoRoomData_set1
    dw DemoRoomData_set2
    dw DemoRoomData_set3

;        _______________________________________ Room pointer
;        _______________________________________ Door pointer
;        _______________________________________ Door slot
;       |      _________________________________ Screen X position
;       |     |      ___________________________ Screen Y position
;       |     |     |      _____________________ Samus Y offset from top of screen
;       |     |     |     |      _______________ Samus X offset from center of screen
;       |     |     |     |     |      _________ Length of demo
;       |     |     |     |     |     |
;        _______________________________________ Pointer to code
  .set0:
; Landing site
    dw RoomHeader_LandingSite
    dw Door_Parlor_1
    dw $0001,$0400,$0400,$0040,$0001,$04D3
    dw DemoRoomCode_LandingSite_BG2Tilemap

; Missile door
    dw RoomHeader_ConstructionZone
    dw Door_MorphBall_1
    dw $0001,$0000,$0000,$006B,$FFD2,$0151
    dw RTS_828924

; Pre Spore Spawn hall
    dw RoomHeader_SporeSpawnKihunters
    dw Door_BigPink_0
    dw $0000,$0100,$0000,$00BB,$FFE0,$017A
    dw RTS_828924

; Speed booster
    dw RoomHeader_FrogSpeedway
    dw Door_UpperNorfairFarming_0
    dw $0000,$0700,$0000,$008B,$0048,$01A4
    dw RTS_828924

; Grapple beam
    dw RoomHeader_SpikyAcidSnakesTunnel
    dw Door_UpperNorfairRefill_1
    dw $0001,$0000,$0000,$008B,$FFC2,$01BC
    dw RTS_828924

; Pseudo screw attack
    dw RoomHeader_BigPink
    dw Door_GreenHillZone_0
    dw $0000,$0200,$0600,$0099,$0027,$0265
    dw DemoRoomCode_ChargeBeamRoom_Scroll21hRed

    dw $FFFF

  .set1:
; Ice beam
    dw RoomHeader_BelowSpazer
    dw Door_WestTunnel_1
    dw $0000,$0100,$0100,$008B,$0056,$01FD
    dw RTS_828924

; Fireflea room
    dw RoomHeader_GreenBrinstarFirefleas
    dw Door_GreenBrinstarMainShaft_3
    dw $0003,$0200,$0000,$008B,$0049,$019A
    dw RTS_828924

; Brinstar diagonal room
    dw RoomHeader_GreenHillZone
    dw Door_BigPink_3
    dw $0003,$0500,$0300,$00AB,$FFE2,$0117
    dw RTS_828924

; Lower Norfair entrance
    dw RoomHeader_LavaDive
    dw Door_KronicBoost_2
    dw $0002,$0300,$0000,$008B,$004B,$03CA
    dw RTS_828924

; Screw attack
    dw RoomHeader_Flyway
    dw Door_Parlor_3
    dw $0003,$0000,$0000,$00BB,$FFF1,$00D5
    dw RTS_828924

; Dachora
    dw RoomHeader_Dachora
    dw Door_BigPink_1
    dw $0001,$0400,$0200,$0080,$0005,$0317
    dw RTS_828924

    dw $FFFF

  .set2:
; Pre Phantoon hall
    dw RoomHeader_Basement
    dw Door_WreckedShipMainShaft_3
    dw $0003,$0200,$0000,$0060,$0004,$02EF
    dw RTS_828924

; Shinespark
    dw RoomHeader_LandingSite
    dw Door_Parlor_1
    dw $0001,$0300,$0400,$00B0,$0000,$00C7
    dw DemoRoomCode_LandingSite_BG2Tilemap

; Eye door
    dw RoomHeader_KraidEyeDoor
    dw Door_MiniKraid_1
    dw $0001,$0000,$0100,$008B,$FFD2,$02D3
    dw RTS_828924

; Red Brinstar -> Crateria elevator
    dw RoomHeader_Caterpillar
    dw Door_AlphaPowerBomb_0
    dw $0000,$0000,$0700,$008B,$FFAA,$0164
    dw RTS_828924

; Kraid
    dw RoomHeader_Kraid
    dw Door_KraidEyeDoor_1
    dw $0001,$0000,$0100,$008B,$FFBF,$013F
    dw DemoRoomCode_Kraid_KraidFunctionTimer

; Tourian entrance
    dw RoomHeader_Statues
    dw Door_StatuesHallway_1
    dw $0001,$0000,$0000,$008B,$FFB1,$0197
    dw DemoRoomCode_TourianEntrance_KraidIsDead

    dw $FFFF

  .set3:
; Gauntlet entrance
    dw RoomHeader_LandingSite
    dw Door_DemoSet3_0_2_4
    dw $0000,$0600,$0200,$0080,$0030,$0100
    dw DemoRoomCode_LandingSite_BG2Tilemap

; Advanced grapple beam
    dw RoomHeader_MtEverest
    dw Door_RedFish_0
    dw $0000,$0200,$0000,$00AB,$0000,$0332
    dw RTS_828924

; IBJ
    dw RoomHeader_LandingSite
    dw Door_DemoSet3_0_2_4
    dw $0000,$0600,$0200,$007B,$0020,$0185
    dw DemoRoomCode_LandingSite_BG2Tilemap

; SBA
    dw RoomHeader_GreenBrinstarMainShaft
    dw Door_BrinstarPreMap_1
    dw $0001,$0000,$0400,$008B,$FFB7,$018A
    dw RTS_828924

; Crystal flash
    dw RoomHeader_LandingSite
    dw Door_DemoSet3_0_2_4
    dw $0000,$0600,$0200,$008B,$0004,$0200
    dw DemoRoomCode_LandingSite_BG2Tilemap

    dw $FFFF


;;; $891A: Demo room code - charge beam room: scroll 21h = red ;;;
DemoRoomCode_ChargeBeamRoom_Scroll21hRed:
    SEP #$20
    LDA.B #$00 : STA.L Scrolls+$21
    REP #$20
; fallthrough to RTS_828924


RTS_828924:
    RTS


;;; $8925: Demo room code - landing site: BG2 tilemap size = 32x64 ;;;
DemoRoomCode_LandingSite_BG2Tilemap:
    LDA.W #$004A : STA.B DP_BG2TilemapAddrSize
    RTS


;;; $892B: Demo room code - Kraid - Kraid function timer = 60 ;;;
DemoRoomCode_Kraid_KraidFunctionTimer:
    LDA.W #$003C : STA.W Enemy.var5
    RTS


;;; $8932: Demo room code - Tourian entrance - Brinstar boss bits = Kraid is dead ;;;
DemoRoomCode_TourianEntrance_KraidIsDead:
    SEP #$20
    LDA.B #$01 : STA.L SRAMMirror_BossBrinstar
    REP #$20
    RTS


;;; $893D: Main game loop ;;;
MainGameLoop:
    PHK
    PLB
    REP #$20
    STZ.W GameState : STZ.W DebugSpareCPUDisplayFlag
    CLI

  .loop:
    PHP
    REP #$30
    JSL HDMAObjectHandler_HandleMusicQueue
    JSL GenerateRandomNumber
    JSL ClearHighOAM
    STZ.W OAMStack
    STZ.W SamusTiles_TopHalfFlag : STZ.W SamusTiles_TopHalfTilesDef : STZ.W SamusTiles_BottomHalfTilesDef
    LDA.W GameState : AND.W #$00FF : ASL : TAX
    JSR.W (.gamemodes,X)
    JSL HandleSounds
    JSL Finalise_OAM
    JSL ShowSpareCPUDebug_UpdatePrevCtrl1Input
    JSL WaitForNMI
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


;;; $89DB: Game state 1Dh (debug game over menu) ;;;
GameState_1D_DebugGameOverMenu:
    JSL Debug_GameOverMenu
    RTS


;;; $89E0: Game state 1Ah (game over screen) ;;;
GameState_1A_GameOverScreen:
    JSL GameOverMenu
    RTS


;;; $89E5: Game state 4 (file select menus) ;;;
GameState_4_FileSelectMenus:
    JSL FileSelectMenu
    RTS


;;; $89EA: Game state 5 (file select map) ;;;
GameState_5_FileSelectMap:
    JSL FileSelectMap
    RTS


;;; $89EF: Handle sounds ;;;
HandleSounds:
    PHP
    SEP #$30
    LDA.W APU_SoundHandlerDowntime : DEC : BPL .downtime
    LDY.B #$00

  .loop:
    PHY
    LDA.W APU_SoundStateLib1,Y : ASL : TAX
    JSR.W (.pointers,X)
    PLY : INY : CPY.B #$03 : BCC .loop
    PLP
    RTL

  .downtime:
    STA.W APU_SoundHandlerDowntime
    STZ.W $2141 : STZ.W APU_CurrentSoundLib1
    STZ.W $2142 : STZ.W APU_CurrentSoundLib2
    STZ.W $2143 : STZ.W APU_CurrentSoundLib3
    PLP
    RTL

  .pointers:
    dw SoundState_0_SendAPUSoundRequestFromQueue
    dw SoundState_1_WaitForAPUSoundRequestAcknowledgement
    dw SoundState_2_ClearSoundRequest
    dw SoudnState_3_WaitForAPUClearRequestAcknowledgement
    dw SoundState_4_ResetSoundState


;;; $8A2C: Sound state 0 - send APU sound request from queue ;;;
SoundState_0_SendAPUSoundRequestFromQueue:
;; Parameter:
;;     Y: Sound library index to process queue of
    TYX
    LDA.W APU_SoundQueueStartIndexLib1,X : CMP.W APU_SoundQueueNextIndexLib1,X : BEQ .return
    LDA.L .data,X : CLC : ADC.W APU_SoundQueueStartIndexLib1,X : TAY
    LDA.W APU_SoundQueueLib1,Y : STA.W $2141,X : STA.W APU_CurrentSoundLib1,X
    INY
    TYA : AND.B #$0F : STA.W APU_SoundQueueStartIndexLib1,X
    INC.W APU_SoundStateLib1,X

  .return:
    RTS

  .data:
    db $00,$10,$20


;;; $8A55: Sound state 1 - wait for APU sound request acknowledgement ;;;
SoundState_1_WaitForAPUSoundRequestAcknowledgement:
;; Parameter:
;;     Y: Sound library index to process queue of
    TYX
    LDA.W APU_CurrentSoundLib1,X : CMP.W $2141,X : BEQ .incState
    STA.W $2141,X
    BRA .return

  .incState:
    INC.W APU_SoundStateLib1,X
    LDA.B #$02 : STA.W APU_ClearSoundDelayLib1,X

  .return:
    RTS


;;; $8A6C: Sound state 2 - clear sound request ;;;
SoundState_2_ClearSoundRequest:
;; Parameter:
;;     Y: Sound library index to process queue of

; This delay is needed, but I have no idea why, screws up door transition though otherwise
    TYX
    DEC.W APU_ClearSoundDelayLib1,X : BNE .return
    STZ.W $2141,X : STZ.W APU_CurrentSoundLib1,X
    INC.W APU_SoundStateLib1,X

  .return:
    RTS


;;; $8A7C: Sound state 3 - wait for APU clear request acknowledgement ;;;
SoudnState_3_WaitForAPUClearRequestAcknowledgement:
;; Parameter:
;;     Y: Sound library index to process queue of
    TYX
    LDA.W APU_CurrentSoundLib1,X : CMP.W $2141,X : BEQ .state0
    STA.W $2141,X
    BRA .return

  .state0:
    STZ.W APU_SoundStateLib1,X
    BRA SoundState_0_SendAPUSoundRequestFromQueue

  .return:
    RTS


;;; $8A90: Sound state 4 - reset sound state ;;;
SoundState_4_ResetSoundState:
;; Parameter:
;;     Y: Sound library index to process queue of
    TYX
    DEC.W APU_ClearSoundDelayLib1,X : BNE .return
    STZ.W APU_SoundStateLib1,X

  .return:
    RTS


;;; $8A9A: Reset sound queues ;;;
ResetSoundQueues:
; Clear sound queue start/next indices and sound states
    PHP
    REP #$20
    STZ.W APU_SoundQueueStartIndexLib1 : STZ.W APU_SoundQueueStartIndexLib3
    STZ.W APU_SoundQueueNextIndexLib2 : STZ.W APU_SoundStateLib1
    SEP #$20
    STZ.W APU_SoundStateLib3
    PLP
    RTL


;;; $8AB0: Show spare CPU (debug) and update previous controller 1 input ;;;
ShowSpareCPUDebug_UpdatePrevCtrl1Input:
; Lowers the brightness to show remaining v-draw time graphically
    PHP
    REP #$30
    LDA.W Debug_InputL : AND.W #$4000 : BEQ +
    LDA.W DebugSpareCPUDisplayFlag : BNE .clearFlag
    LDA.W #$0001 : STA.W DebugSpareCPUDisplayFlag
    BRA +

  .clearFlag:
    STZ.W DebugSpareCPUDisplayFlag

+   LDA.W DebugSpareCPUDisplayFlag : BEQ .return
    SEP #$20
    LDA.B DP_Brightness : AND.B #$F0 : ORA.B #$05 : STA.W $2100
    REP #$20

  .return:
    LDA.B DP_Controller1Input : STA.W PreviousController1InputDrawing
    PLP
    RTL


;;; $8AE4: Game state 0 (reset/start) ;;;
GameState_0_ResetStart:
    STZ.W unknown0DF8 : STZ.W neverRead0DFA : STZ.W neverRead0DFC
    LDA.W #CinematicFunction_LoadTitleSequence : STA.W CinematicFunction
    STZ.W DemoSet
    LDA.W NumberOfDemoSets : CMP.W #$0004 : BNE .return
    LDA.W #$0003 : STA.W DemoSet

  .return:
    INC.W GameState
    RTS


;;; $8B08: Game state 1 (title sequence) ;;;
GameState_1_TitleSequence:
    JSL GameState1_TitleSequence
    RTS


;;; $8B0D: RTS. Game state 3 (nothing) ;;;
GameState_3_Nothing:
    RTS


;;; $8B0E: Game state 1Eh/22h/25h (intro / Ceres goes boom, Samus goes to Zebes / Ceres goes boom with Samus) ;;;
GameState_1E_22_25_Intro_CeresGoesBoom_SamusGoesToZebes:
    JSL GameState_1E_22_25_Intro_CeresGoesBoom_SamusGoesToZebes_8B
    RTS


;;; $8B13: Game state 27h (ending and credits) ;;;
GameState_27_EndingAndCredits:
    JSL GameState27_EndingAndCredits
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $8B18: Unused. Increment game state ;;;
UNUSED_IncrementGameState_828B18:
    PHP
    REP #$30
    INC.W GameState
    PLP
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8B20: Game state 7 (main gameplay fading in) ;;;
GameState_7_MainGameplayFadingIn:
    PHP
    REP #$30
    JSR GameState_8_MainGameplay
    JSL HandleFadingIn
    SEP #$20
    LDA.B DP_Brightness : CMP.B #$0F : BNE .return
    REP #$20
    STZ.W ScreenFadeDelay : STZ.W ScreenFadeCounter
    INC.W GameState

  .return:
    PLP
    RTS


;;; $8B3F: Game state 1Ch (unused) ;;;
UNUSED_GameState_1C_828B3F:
    JSL UNUSED_GameState1C_91D4DA
    RTS


;;; $8B44: Game state 8 (main gameplay) ;;;
GameState_8_MainGameplay:
    PHP
    REP #$30
    JSL Determine_Which_Enemies_to_Process
    JSL DebugHandler
    AND.W #$FFFF : BNE .skipProcessing
    JSL PaletteFXObject_Handler
    JSL SamusCurrentStateHandler
    LDA.W DebugDisableSpriteInteractions : BNE +
    JSL Samus_Projectiles_Interaction_Handling

+   JSL Main_Enemy_Routine
    JSL SamusNewStateHandler
    JSL Enemy_Projectile_Handler
    JSL PLM_Handler
    JSL AnimatedTilesObject_Handler
    LDA.W DebugDisableSpriteInteractions : BNE +
    JSL EnemyProjectile_Samus_Collision_Handling
    JSL Projectile_vs_Projectile_Collision_Handling
    JSL Process_Enemy_PowerBomb_Interaction

+   JSL Main_Scrolling_Routine
    LDA.L DebugConst_DebugScrolling : BEQ +
    JSL Debug_Layer1Position_Saving_Loading

+   JSL Draw_Samus_Projectiles_Enemies_and_Enemy_Projectiles
    JSL Handle_Queuing_Enemy_BG2_Tilemap_VRAM_Transfer

  .skipProcessing:
    JSL HandleHUDTilemap_PausedAndRunning
    JSL Calc_Layer2Position_BGScrolls_UpdateBGGraphics_WhenScrolling
    JSL Execute_Room_Main_ASM
    JSR HandleSamusRunningOutOfEnergy_and_IncrementGameTime
    JSL Handle_Room_Shaking
    JSL DecrementSamusHurtTimers_ClearActiveEnemyIndicesLists
    PLP
    RTS


;;; $8BB9: Delete game options menu objects ;;;
Delete_GameOptionsMenu_Objects:
    PHP
    REP #$30
    LDX.W #$000E

  .loop:
    STZ.W GameOptionsMenuObject_SpritemapPointers,X : STZ.W GameOptionsMenuObject_InstListPointers,X
    DEX #2 : BPL .loop
    PLP
    RTS


;;; $8BCB: Spawn game options menu object ;;;
Spawn_GameOptionsMenu_Object:
;; Parameters:
;;     A: Game options menu object initialisation parameter
;;     Y: Game options menu object ID
;; Returns:
;;     Carry: Set if enemy projectile could not be spawned
    PHP
    REP #$30
    PHX
    STA.W GameOptionsMenuObject_InitParam
    TYX
    LDY.W #$000E

  .loop:
    LDA.W GameOptionsMenuObject_InstListPointers,Y : BEQ .instruction
    DEY #2 : BPL .loop
    PLX : PLP
    SEC
    RTS

  .instruction:
    REP #$30
    LDA.W $0002,X : STA.W GameOptionsMenuObject_PreInstructions,Y
    LDA.W $0004,X : STA.W GameOptionsMenuObject_InstListPointers,Y
    LDA.W #$0001 : STA.W GameOptionsMenuObject_InstructionTimers,Y
    LDA.W #$0000 : STA.W GameOptionsMenuObject_SpritemapPointers,Y
    LDA.W #$0000 : STA.W GameOptionsMenuObject_Timers,Y
    STA.W neverRead1ADD,Y : STA.W neverRead1AED,Y
    JSR.W ($0000,X)
    PLX : PLP
    CLC
    RTS


;;; $8C10: RTS ;;;
RTS_828C10:
    RTS


;;; $8C11: Game options menu object handler ;;;
GameOptionsMenu_ObjectHandler:
    PHP
    REP #$30
    LDX.W #$000E

  .loop:
    STX.W GameOptionsMenuObject_Index
    LDA.W GameOptionsMenuObject_InstListPointers,X : BEQ .next
    JSR Process_GameOptionsMenu_Object
    LDX.W GameOptionsMenuObject_Index

  .next:
    DEX #2 : BPL .loop
    PLP
    RTS


;;; $8C2B: Process game options menu object ;;;
Process_GameOptionsMenu_Object:
;; Parameter:
;;     X: Game options menu object index

; Some instructions (e.g. sleep) pop the return address pushed to the stack by $8C42 to return out of *this* routine
; (marked "terminate processing game options menu object" (in the bank logs))
    JSR.W (GameOptionsMenuObject_PreInstructions,X)
    LDX.W GameOptionsMenuObject_Index
    DEC.W GameOptionsMenuObject_InstructionTimers,X : BNE .return
    LDY.W GameOptionsMenuObject_InstListPointers,X

  .returnPEA:
    LDA.W $0000,Y : BPL .instruction
    STA.B DP_Temp12
    INY #2
    PEA .returnPEA-1
    JMP.W (DP_Temp12)

  .instruction:
    STA.W GameOptionsMenuObject_InstructionTimers,X
    LDA.W $0002,Y : STA.W GameOptionsMenuObject_SpritemapPointers,X
    TYA : CLC : ADC.W #$0004 : STA.W GameOptionsMenuObject_InstListPointers,X

  .return:
    RTS


;;; $8C5A: Instruction - delete ;;;
Instruction_GameOptionsMenu_Delete:
;; Parameters:
;;     X: Game options menu object index
    REP #$30
    STZ.W GameOptionsMenuObject_SpritemapPointers,X : STZ.W GameOptionsMenuObject_InstListPointers,X
    PLA
    RTS


;;; $8C64: Instruction - sleep ;;;
Instruction_GameOptionsMenu_Sleep:
;; Parameters:
;;     X: Game options menu object index
;;     Y: Pointer to instruction arguments
    REP #$30
    DEY #2
    TYA : STA.W GameOptionsMenuObject_InstListPointers,X
    PLA
    RTS


;;; $8C6E: Instruction - pre-instruction = [[Y]] ;;;
Instruction_GameOptionsMenu_PreInstruction_inY:
;; Parameters:
;;     X: Game options menu object index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    REP #$30
    LDA.W $0000,Y : STA.W GameOptionsMenuObject_PreInstructions,X
    INY #2
    RTS


;;; $8C79: Instruction - clear pre-instruction ;;;
Instruction_GameOptionsMenu_ClearPreInstruction:
;; Parameters:
;;     X: Game options menu object index
    REP #$30
    LDA.W #.RTS : STA.W GameOptionsMenuObject_PreInstructions,X

  .RTS:
    RTS


;;; $8C82: Instruction - go to [[Y]] ;;;
Instruction_GameOptionsMenu_GotoY:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    REP #$30
    LDA.W $0000,Y : TAY
    RTS


;;; $8C89: Instruction - decrement timer and go to [[Y]] if non-zero ;;;
Instruction_GameOptionsMenu_DecTimer_and_GotoY_if_NonZero:
;; Parameters:
;;     X: Game options menu object index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    REP #$30
    DEC.W GameOptionsMenuObject_Timers,X : BNE Instruction_GameOptionsMenu_GotoY
    INY #2
    RTS


;;; $8C93: Instruction - timer = [[Y]] ;;;
Instruction_GameOptionsMenu_TimerInY:
;; Parameters:
;;     X: Game options menu object index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    REP #$30
    LDA.W $0000,Y : STA.W GameOptionsMenuObject_Timers,X
    INY #2
    RTS


;;; $8C9E: RTS ;;;
REP30RTS_828C9E:
    REP #$30
    RTS


;;; $8CA1: Draw game options menu spritemaps ;;;
Draw_GameOptionsMenu_Spritemaps:
    PHP
    REP #$30
    PHB
    LDX.W #$000E

  .loop:
    LDA.W GameOptionsMenuObject_SpritemapPointers,X : BEQ .next
    PEA $8200 : PLB : PLB
    LDY.W GameOptionsMenuObject_SpritemapPointers,X
    LDA.W GameOptionsMenuObject_PaletteIndices,X : STA.B DP_Temp16
    LDA.W GameOptionsMenuObject_XPositions,X : STA.B DP_Temp14
    LDA.W GameOptionsMenuObject_YPositions,X : STA.B DP_Temp12
    JSL AddSpritemapToOAM

  .next:
    DEX #2 : BPL .loop
    PLB : PLP
    RTS


;;; $8CCF: Game state Ch (pausing, normal gameplay but darkening) ;;;
GameState_C_Pausing_NormalGameplayDarkening:
    PHP
    REP #$30
    JSR GameState_8_MainGameplay
    JSL HandleFadingOut
    LDA.B DP_Brightness : AND.W #$000F : BNE .return
    JSL EnableNMI
    STZ.W ScreenFadeDelay : STZ.W ScreenFadeCounter
    INC.W GameState

  .return:
    PLP
    RTS


;;; $8CEF: Game state Dh (pausing, loading pause menu) ;;;
GameState_D_Pausing_LoadingPauseScreen:
    PHP
    REP #$30
    PHB
    PHK : PLB
    JSL Disable_HDMAObjects
    SEP #$20
    LDA.B #$00 : STA.B DP_HDMAEnable : STA.W $420C
    REP #$20
    JSL Disable_AnimatedTilesObjects
    JSR Backup_BG2Tilemap_for_PauseMenu
    PHP
    PHB : PHK
    PEA .returnPEA-1
    JML.W [PauseHook_Pause]

  .returnPEA:
    PLB : PLP
    JSL Cancel_Sound_Effects
    JSR Backup_SomeGraphicsState_for_PauseScreen
    JSL LoadPauseMenuTiles_ClearBG2Tilemap
    JSL LoadPauseScreen_BaseTilemaps
    JSL Load_PauseMenuMapTilemap_and_AreaLabel
    JSR BackupGameplayPalettes_LoadPauseScreenPalettes
    JSR ContinueInitializingPauseMenu
    LDA.W #$0001 : STA.W ScreenFadeDelay : STA.W ScreenFadeCounter
    STZ.W PauseMenu_MapScrollLeftArrowAnimationFrame
    LDA.W #$0001 : STA.W PauseMenu_PaletteAnimationTimer
    STZ.W MapScrolling_Direction : STZ.W MapScrolling_SpeedIndex
    JSL QueueClearingOfFXTilemap
    INC.W GameState
    PLB : PLP
    RTS


;;; $8D51: Back up BG2 tilemap for pause menu ;;;
Backup_BG2Tilemap_for_PauseMenu:
; Due to the prefetch glitch, the value read from VRAM after setting the VRAM address is returned twice by $2139 (after which VRAM is read in sequence correctly)
; The usual workaround is to issue a dummy read from $2139 before doing a read DMA
; This routine is instead setting the source address to be +1 what it should be, meaning the first read VRAM word is wrong, but the rest of VRAM is read correctly
; tl;dr: $7E:DF5C is just a copy of $7E:DF5E
    PHP
    SEP #$20
    LDA.B #$01 : STA.W $2116
    LDA.B DP_BG2TilemapAddrSize : AND.B #$FC : STA.W $2117
    LDA.B #$81 : STA.W $4310
    LDA.B #$39 : STA.W $4311
    LDA.B #DP_BG4TilemapAddrSize : STA.W $4312
    LDA.B #$DF : STA.W $4313
    LDA.B #$7E : STA.W $4314
    LDA.B #$00 : STA.W $4315
    LDA.B #$10 : STA.W $4316
    STZ.W $4317 : STZ.W $4318
    STZ.W $4319 : STZ.W $431A
    LDA.B #$02 : STA.W $420B
    PLP
    RTS


;;; $8D96: Restore BG2 tilemap from pause menu ;;;
Restore_BG2Tilemap_from_PauseMenu:
    PHP
    SEP #$20
    LDA.B #$00 : STA.W $2116
    LDA.B DP_BG2TilemapAddrSize : AND.B #$FC : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl BackupBG2TilemapPauseMenu
    dw $1000
    LDA.B #$02 : STA.W $420B
    PLP
    RTS


;;; $8DBD: Back up some graphics state for pause menu ;;;
Backup_SomeGraphicsState_for_PauseScreen:
    PHP
    SEP #$20
    LDA.B DP_BG1TilemapAddrSize : STA.W PauseMenu_Backup0058
    LDA.B DP_BG2TilemapAddrSize : STA.W PauseMenu_Backup0059
    LDA.B DP_BG3TilemapAddrSize : STA.W PauseMenu_Backup005A
    LDA.B DP_BGTilesAddr : STA.W PauseMenu_Backup005D
    LDA.B DP_BGTilesAddr+1 : STA.W PauseMenu_Backup005D+1
    LDA.B DP_SpriteSizeAddr : STA.W PauseMenu_Backup0052
    LDA.B DP_BG1XScroll : STA.W PauseMenu_Backup00B1
    LDA.B DP_BG2XScroll : STA.W PauseMenu_Backup00B5
    LDA.B DP_BG3XScroll : STA.W PauseMenu_Backup00B9
    LDA.B DP_BG1YScroll : STA.W PauseMenu_Backup00B3
    LDA.B DP_BG2YScroll : STA.W PauseMenu_Backup00B7
    LDA.B DP_BG3YScroll : STA.W PauseMenu_Backup00BB
    LDA.B DP_BGModeSize : STA.W PauseMenu_Backup0055
    LDA.W Layer2ScrollX : STA.W PauseMenu_Backup091B
    LDA.W Layer2ScrollY : STA.W PauseMenu_Backup091C
    LDA.B DP_Mosaic : STA.W PauseMenu_Backup0057
    LDA.B DP_NextGameplayColorMathB : STA.W PauseMenu_Backup0071
    PLP
    RTS


;;; $8E19: Restore some graphics state from pause menu ;;;
Restore_SomeGraphicsState_from_PauseScreen:
    PHP
    SEP #$20
    LDA.W PauseMenu_Backup091B : STA.W Layer2ScrollX
    LDA.W PauseMenu_Backup091C : STA.W Layer2ScrollY
    LDA.W PauseMenu_Backup0055 : STA.B DP_BGModeSize
    LDA.W PauseMenu_Backup00BB : STA.B DP_BG3YScroll
    LDA.W PauseMenu_Backup00B7 : STA.B DP_BG2YScroll
    LDA.W PauseMenu_Backup00B3 : STA.B DP_BG1YScroll
    LDA.W PauseMenu_Backup00B9 : STA.B DP_BG3XScroll
    LDA.W PauseMenu_Backup00B5 : STA.B DP_BG2XScroll
    LDA.W PauseMenu_Backup00B1 : STA.B DP_BG1XScroll
    LDA.W PauseMenu_Backup0052 : STA.B DP_SpriteSizeAddr
    LDA.W PauseMenu_Backup005D+1 : STA.B DP_BGTilesAddr+1
    LDA.W PauseMenu_Backup005D : STA.B DP_BGTilesAddr
    LDA.W PauseMenu_Backup005A : STA.B DP_BG3TilemapAddrSize
    LDA.W PauseMenu_Backup0059 : STA.B DP_BG2TilemapAddrSize
    LDA.W PauseMenu_Backup0058 : STA.B DP_BG1TilemapAddrSize
    LDA.W PauseMenu_Backup0057 : STA.B DP_Mosaic
    LDA.W PauseMenu_Backup0071 : STA.B DP_NextGameplayColorMathB
    PLP
    RTS


;;; $8E75: Load pause menu tiles and clear BG2 tilemap ;;;
LoadPauseMenuTiles_ClearBG2Tilemap:
; VRAM $4800..4FFF isn't actually used for anything in the pause menu,
; so backing it up to $7E:DF5C, clearing it here, and restoring it later is a complete waste of time and memory.
; I think this backing up + restoring of BG2 miiight have been a workaround for "bug" whereby this VRAM is cleared in $8E75
    PHP
    SEP #$30
    LDA.B #$00 : STA.W $2116
    LDA.B #$00 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl Tiles_PauseScreen_BG1_BG2
    dw $4000
    LDA.B #$02 : STA.W $420B
    LDA.B #$00 : STA.W $2116
    LDA.B #$20 : STA.W $2117
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
    dl Tiles_Standard_BG3
    dw $2000
    LDA.B #$02 : STA.W $420B
    PLP
    RTL


;;; $8EDA: Load pause menu base tilemaps ;;;
LoadPauseScreen_BaseTilemaps:
; Note that $B20C loads the actual Samus wireframe tilemap to the $7E:3800 area,
; unsure why this routine loads the dummy tilemap to the $7E:3000 area, possibly a typo during development
    PHP
    SEP #$30
    LDA.B #$00 : STA.W $2116
    LDA.B #$38 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl Tilemap_BG2PauseScreen_BG2RoomSelectMap_0
    dw $0800
    LDA.B #$02 : STA.W $420B
    LDA.B #$00 : STA.W $2181
    LDA.B #$34 : STA.W $2182
    LDA.B #$7E : STA.W $2183
    JSL SetupHDMATransfer
    db $01,$00,$80
    dl Tilemap_BG2PauseScreen_BG2RoomSelectMap_1
    dw $0400
    LDA.B #$02 : STA.W $420B
    LDA.B #$00 : STA.W $2181
    LDA.B #$38 : STA.W $2182
    LDA.B #$7E : STA.W $2183
    JSL SetupHDMATransfer
    db $01,$00,$80
    dl Tilemap_EquipmentScreen
    dw $0800
    LDA.B #$02 : STA.W $420B
    REP #$30
    LDY.W #Dummy_Samus_Wireframe_Tilemap
    LDX.W #$01D8
    LDA.W #$0011 : STA.B DP_Temp14

  .loopRows:
    LDA.W #$0008 : STA.B DP_Temp12

  .loopColumns:
    LDA.W $0000,Y : STA.L GameOptionsMenuTilemap,X
    INX #2
    INY #2
    DEC.B DP_Temp12 : BNE .loopColumns
    TXA : CLC : ADC.W #$0010 : TAX
    DEC.B DP_Temp14 : BNE .loopRows
    JSR EquipmentScreen_WriteSamusWireframeTilemap
    JSR Load_EquipmentScreen_ReserveHealth_Tilemap
    PLP
    RTL


;;; $8F70: Load equipment screen reserve health tilemap ;;;
Load_EquipmentScreen_ReserveHealth_Tilemap:
    PHP
    REP #$30
    LDA.W MaxReserveEnergy : BEQ .return
    LDA.W ReserveEnergy : STA.W $4204
    SEP #$20
    LDA.B #$64 : STA.W $4206
    NOP #9 ; >.<
    LDA.W $4214 : STA.B DP_Temp2A
    LDA.W $4215 : STA.B DP_Temp2B
    LDA.W $4216 : STA.W $4204
    LDA.W $4217 : STA.W $4205
    LDA.B #$0A : STA.W $4206
    REP #$20
    NOP #7 ; >.<
    LDA.W $4216 : CLC : ADC.W #$0804 : STA.L EquipmentScreenBG1Tilemap+$314
    LDA.W $4214 : CLC : ADC.W #$0804 : STA.L EquipmentScreenBG1Tilemap+$312
    LDA.B DP_Temp2A : CLC : ADC.W #$0804 : STA.L EquipmentScreenBG1Tilemap+$310

  .return:
    PLP
    RTS


;;; $8FD4: Backup gameplay palettes and load pause menu palettes ;;;
BackupGameplayPalettes_LoadPauseScreenPalettes:
    PHP
    SEP #$30
    PHP
    REP #$30
    LDY.W #$0200
    LDX.W #$0000

  .loopBackupGameplay:
    LDA.L Palettes,X : STA.L BackupOfPalettesDuringMenu,X
    INX #2
    DEY #2 : BNE .loopBackupGameplay
    PLP : PHP
    REP #$30
    LDY.W #$0200
    LDX.W #$0000

  .loopLoadPause:
    LDA.L Palettes_PauseScreen,X
    STA.L Palettes,X
    INX #2
    DEY #2 : BNE .loopLoadPause
    PLP : PLP
    RTS


;;; $9009: Continue initialising pause menu ;;;
ContinueInitializingPauseMenu:
; I don't know why this is a subroutine and not a part of GameState_D_Pausing_LoadingPauseScreen, hence the awkward name
    PHP : PHB
    PHK : PLB
    JSR SetupPPUForPauseMenu
    JSR ResetPauseMenuAnimations
    JSR Load_EquipmentScreen_EquipmentTilemaps
    JSR Set_PauseScreen_ButtonLabelPalettes_MapScreen
    JSR Update_PauseMenu_L_R_Start_VRAMTilemap
    JSR DetermineMapScrollLimits
    LDA.W #$0080
    JSR SetupMapScrollingForPauseMenu
    PLB : PLP
    RTS


;;; $9028: Set up map scrolling for file select map ;;;
Setup_MapScrolling_for_FileSelectMap:
; This is just SetupMapScrollingForPauseMenu with the A parameter hardcoded to 80h (which is the only parameter it's ever called with anyway)
    JSR ResetPauseMenuAnimations
    JSR DetermineMapScrollLimits
    LDA.W MapScroll_MaxX : SEC : SBC.W MapScroll_MinX : LSR
    CLC : ADC.W MapScroll_MinX
    SEC : SBC.W #$0080 : STA.B DP_BG1XScroll
    LDA.W SamusXPosition : AND.W #$FF00 : XBA
    CLC : ADC.W RoomMapX
    ASL #3
    SEC : SBC.B DP_BG1XScroll : STA.B DP_Temp12
    LDA.W #$00E0 : SEC : SBC.B DP_Temp12 : BPL .Xscroll
    STA.B DP_Temp12
    LDA.B DP_BG1XScroll : SEC : SBC.B DP_Temp12 : STA.B DP_BG1XScroll
    BRA .Yscroll

  .Xscroll:
    LDA.W #$0020 : SEC : SBC.B DP_Temp12 : STA.B DP_Temp12 : BMI .Yscroll
    LDA.B DP_BG1XScroll : SEC : SBC.B DP_Temp12 : STA.B DP_BG1XScroll

  .Yscroll:
    LDA.W MapScroll_MaxY : SEC : SBC.W MapScroll_MinY : LSR
    CLC : ADC.W #$0010
    CLC : ADC.W MapScroll_MinY : STA.B DP_Temp12
    LDA.W #$0070 : SEC : SBC.B DP_Temp12 : AND.W #$FFF8
    EOR.W #$FFFF : INC : STA.B DP_BG1YScroll
    LDA.W SamusYPosition : XBA : AND.W #$00FF : CLC : ADC.W RoomMapY
    INC : ASL #3
    SEC : SBC.B DP_BG1YScroll : STA.B DP_Temp12
    LDA.W #$0040 : SEC : SBC.B DP_Temp12 : BMI .return
    STA.B DP_Temp12
    LDA.B DP_BG1YScroll : SEC : SBC.B DP_Temp12 : STA.B DP_BG1YScroll
    CMP.W #$FFD8 : BPL .return
    LDA.W #$FFD8 : STA.B DP_BG1YScroll

  .return:
    RTL


;;; $90C8: Game state Eh (paused, loading pause menu) ;;;
GameState_E_Paused_LoadingPauseScreen:
    PHP
    REP #$30
    JSL Draw_PauseMenu_during_FadeIn
    JSL HandleFadingIn
    SEP #$20
    LDA.B DP_Brightness : CMP.B #$0F : BNE .return
    REP #$20
    STZ.W ScreenFadeDelay : STZ.W ScreenFadeCounter
    INC.W GameState

  .return:
    PLP
    RTS


;;; $90E8: Game state Fh (paused, map and item screens) ;;;
GameState_F_Paused_MapAndItemScreens:
    PHB
    PHK : PLB
    LDA.W #$0003
    JSL UpdateHeldInput
    JSL MainPauseRoutine
    JSL HandleHUDTilemap_PausedAndRunning
    JSR Handle_PauseScreen_PaletteAnimation
    PLB
    RTS


;;; $90FF: Main pause routine ;;;
MainPauseRoutine:
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W PauseMenu_MenuIndex : ASL : TAX
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


;;; $9120: Pause menu - index 0: map screen ;;;
PauseMenu_0_MapScreen:
    REP #$30
    JSR Handle_PauseScreen_L_R
    JSR Handle_PauseScreen_StartButton
    JSL Handle_MapScrollArrows
    JSL MapScrolling
    JSR MapScreen_DrawSamusPositionIndicator
    JSL Draw_Map_Icons
    JSL Display_Map_Elevator_Destinations
    LDA.W #$0000 : STA.W PauseMenu_MenuMode
    RTS


;;; $9142: Pause menu - index 1: equipment screen ;;;
PauseScreen_1_EquipmentScreen:
    STZ.B DP_BG1XScroll : STZ.B DP_BG1YScroll
    JSR EquipmentScreen_Main
    JSR Handle_PauseScreen_L_R
    JSR Handle_PauseScreen_StartButton
    LDA.W #$0001 : STA.W PauseMenu_MenuMode
    RTS


;;; $9156: Pause menu - index 2: map screen to equipment screen - fading out ;;;
PauseMenu_2_MapScreenToEquipmentScreen_FadingOut:
    JSL Display_Map_Elevator_Destinations
    JSR MapScreen_DrawSamusPositionIndicator
    JSL Draw_Map_Icons
    JSR Handle_PauseMenu_L_R_PressedHighlight
    LDA.W #$0000 : STA.W PauseMenu_MenuMode
    JSL HandleFadingOut
    SEP #$20
    LDA.B DP_Brightness : CMP.B #$80 : BNE .return
    JSL EnableNMI
    REP #$20
    STZ.W ScreenFadeDelay : STZ.W ScreenFadeCounter
    INC.W PauseMenu_MenuIndex

  .return:
    RTS


;;; $9186: Pause menu - index 5: equipment screen to map screen - fading out ;;;
PauseMenu_5_EquipmentScreenToMapScreen_FadingOut:
    JSR EquipmentScreen_DrawItemSelector
    JSR EquipmentScreen_DisplayReserveTankAmount_shell
    JSR Handle_PauseMenu_L_R_PressedHighlight
    JSL HandleFadingOut
    SEP #$20
    LDA.B DP_Brightness : CMP.B #$80 : BNE .return
    JSL EnableNMI
    REP #$20
    STZ.W ScreenFadeDelay : STZ.W ScreenFadeCounter
    INC.W PauseMenu_MenuIndex

  .return:
    RTS


;;; $91AB: Pause menu - index 3: map screen to equipment screen - load equipment screen ;;;
PauseMenu_3_MapScreenToEquipmentScreen_LoadEquipmentScreen:
    REP #$30
    JSL Display_Map_Elevator_Destinations
    JSR EquipmentScreen_SetupReserveMode_and_DetermineInitialSelect
    JSL EquipmentScreen_TransferBG1Tilemap
    LDA.W #$0001 : STA.W PauseMenu_MenuMode
    JSR Set_PauseScreen_ButtonLabelPalettes
    STZ.W PauseMenu_HighlightAnimationFrame
    LDA.W L_R_HighlightAnimationData_PauseScreenPaletteAnimationDelays : STA.W PauseMenu_HighlightAnimationTimer
    LDA.W #$0001 : STA.W ScreenFadeDelay : STA.W ScreenFadeCounter
    INC.W PauseMenu_MenuIndex
    RTS


;;; $91D7: Pause menu - index 6: equipment screen to map screen - load map screen ;;;
PauseMenu_6_EquipmentScreenToMapScreen_LoadMapScreen:
    REP #$30
    JSL Display_Map_Elevator_Destinations
    JSL Load_PauseMenuMapTilemap_and_AreaLabel
    JSR Set_PauseScreen_ButtonLabelPalettes
    STZ.W PauseMenu_HighlightAnimationFrame
    LDA.W L_R_HighlightAnimationData_PauseScreenPaletteAnimationDelays : STA.W PauseMenu_HighlightAnimationTimer
    LDA.W #$0001 : STA.W ScreenFadeDelay : STA.W ScreenFadeCounter
    LDA.W #$0000 : STA.W PauseMenu_MenuMode
    INC.W PauseMenu_MenuIndex
    RTS


;;; $9200: Pause menu - index 7: equipment screen to map screen - fading in ;;;
PauseMenu_7_EquipmentScreenToMapScreen_FadingIn:
    JSR MapScreen_DrawSamusPositionIndicator
    JSL Draw_Map_Icons
    JSL Display_Map_Elevator_Destinations
    LDA.W #$0000 : STA.W PauseMenu_MenuMode
    JSL HandleFadingIn
    SEP #$20
    LDA.B DP_Brightness : CMP.B #$0F : BNE .return
    REP #$20
    STZ.W ScreenFadeDelay : STZ.W ScreenFadeCounter
    LDA.W PauseMenu_ButtonLabelMode : BEQ +
    LDA.W #$0001

+   STA.W PauseMenu_MenuIndex

  .return:
    RTS


;;; $9231: Pause menu - index 4: map screen to equipment screen - fading in ;;;
PauseMenu_4_MapScreenToEquipmentScreen_FadingIn:
    JSR EquipmentScreen_DrawItemSelector
    JSR EquipmentScreen_DisplayReserveTankAmount_shell
    LDA.W #$0001 : STA.W PauseMenu_MenuMode
    JSL HandleFadingIn
    SEP #$20
    LDA.B DP_Brightness : CMP.B #$0F : BNE .return
    REP #$20
    STZ.W ScreenFadeDelay : STZ.W ScreenFadeCounter
    LDA.W PauseMenu_ButtonLabelMode : BEQ +
    LDA.W #$0001

+   STA.W PauseMenu_MenuIndex

  .return:
    RTS


;;; $925D: Map scrolling ;;;
MapScrolling:
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W MapScrolling_Direction : ASL : TAX
    JSR.W (.pointers,X)
    PLB : PLP
    RTL

  .pointers:
    dw MapScrolling_None
    dw MapScrolling_Left
    dw MapScrolling_Right
    dw MapScrolling_Up
    dw MapScrolling_Down


;;; $9278: Map scrolling - none ;;;
MapScrolling_None:
    LDA.W #$0004 : STA.W MapScrolling_GearSwitchTimer
    RTS


;;; $927F: X = map scroll speed index ;;;
GetMapScrollSpeedIndexInX:
    LDX.W MapScrolling_SpeedIndex
    LDA.W MapScrolling_GearSwitchTimer : BNE .return
    TXA : CLC : ADC.W #$0020 : TAX

  .return:
    RTS


;;; $928E: Map scrolling - left ;;;
MapScrolling_Left:
    JSR GetMapScrollSpeedIndexInX
    LDA.B DP_BG1XScroll : SEC : SBC.W MapScrolling_SpeedTable,X : STA.B DP_BG1XScroll


;;; $9299: Map scrolling - common ;;;
MapScrolling_Common:
    INC.W MapScrolling_SpeedIndex : INC.W MapScrolling_SpeedIndex
    LDA.W MapScrolling_SpeedIndex : AND.W #$000F : BNE .return
    LDA.W #$0036
    JSL QueueSound_Lib1_Max6
    STZ.W MapScrolling_Direction : STZ.W MapScrolling_SpeedIndex
    LDA.W MapScrolling_GearSwitchTimer : BEQ .return
    DEC.W MapScrolling_GearSwitchTimer

  .return:
    RTS


;;; $92BD: Map scrolling - right ;;;
MapScrolling_Right:
    JSR GetMapScrollSpeedIndexInX
    LDA.W MapScrolling_SpeedTable,X : CLC : ADC.B DP_BG1XScroll : STA.B DP_BG1XScroll
    BRA MapScrolling_Common


;;; $92CA: Map scrolling - up ;;;
MapScrolling_Up:
    JSR GetMapScrollSpeedIndexInX
    LDA.B DP_BG1YScroll : SEC : SBC.W MapScrolling_SpeedTable,X : STA.B DP_BG1YScroll
    BRA MapScrolling_Common


;;; $92D7: Map scrolling - down ;;;
MapScrolling_Down:
    JSR GetMapScrollSpeedIndexInX
    LDA.W MapScrolling_SpeedTable,X : CLC : ADC.B DP_BG1YScroll : STA.B DP_BG1YScroll
    BRA MapScrolling_Common


;;; $92E4: Map scrolling speed table ;;;
MapScrolling_SpeedTable:
; Some (very uninteresting) map scrolling data
    dw $0000,$0000,$0000,$0008,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0008,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000


;;; $9324: Game state 10h (unpausing, loading normal gameplay) ;;;
GameState_10_Unpausing_LoadingNormalGameplay:
    PHP
    REP #$30
    JSL Handle_PauseMenu_StartPressedHighlight
    JSR Draw_PauseMenu_During_FadeOut
    JSL HandleFadingOut
    SEP #$20
    LDA.B DP_Brightness : CMP.B #$80 : BNE .return
    JSL EnableNMI
    REP #$20
    STZ.W ScreenFadeDelay : STZ.W ScreenFadeCounter
    INC.W GameState

  .return:
    PLP
    RTS


;;; $934B: Draw pause menu during fade out ;;;
Draw_PauseMenu_During_FadeOut:
    LDA.W PauseMenu_MenuMode : CMP.W #$0001 : BEQ .equipScreen
    JSL Display_Map_Elevator_Destinations
    JSL Draw_Map_Icons
    JMP MapScreen_DrawSamusPositionIndicator

  .equipScreen:
    JSR EquipmentScreen_DrawItemSelector
    JSR EquipmentScreen_DisplayReserveTankAmount_shell
    JMP Handle_PauseMenu_L_R_PressedHighlight


;;; $9367: Game state 11h (unpausing, loading normal gameplay) ;;;
GameState_11_Unpausing_LoadingNormalGameplay:
    PHP
    REP #$30
    JSR Clear_Samus_Beam_Tiles
    JSR ContinueInitialising_GameplayResume
    JSL ResumeGameplay
    JSR Restore_SomeGraphicsState_from_PauseScreen
    JSR Restore_BG2Tilemap_from_PauseMenu
    REP #$30
    LDA.W #$0001 : STA.W ScreenFadeDelay : STA.W ScreenFadeCounter
    PHP : PHB
    PHK : PEA .returnPEA-1
    JML.W [PauseHook_Unpause]

  .returnPEA:
    JSL Enable_HDMAObjects
    JSL Enable_AnimatedTilesObjects
    JSL Queue_Samus_Movement_SoundEffects
    PLB : PLP
    INC.W GameState
    PLP
    RTS


;;; $93A1: Game state 12h (unpausing, normal gameplay but brightening) ;;;
GameState_12_Unpausing_NormalGameplayBrightening:
    PHP
    REP #$30
    JSR GameState_8_MainGameplay
    JSL HandleFadingIn
    SEP #$20
    LDA.B DP_Brightness : CMP.B #$0F : BNE .return
    REP #$20
    STZ.W ScreenFadeDelay : STZ.W ScreenFadeCounter
    LDA.W #$0008 : STA.W GameState

  .return:
    PLP
    RTS


;;; $93C3: Load pause menu map tilemap and area label ;;;
Load_PauseMenuMapTilemap_and_AreaLabel:
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.B DP_BG4XScroll : STA.B DP_BG1XScroll
    LDA.B DP_BG4YScroll : STA.B DP_BG1YScroll
    SEP #$30
    LDA.B #$00 : STA.W $2116
    LDA.B #$30 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSR LoadPauseMenuMapTilemap
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl BG2Tilemap
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
    LDA.W AreaIndex : CMP.W #$0007 : BMI +
    LDA.W #$0000

+   ASL : TAX
    LDA.W AreaLabelTilemaps_pointers,X : STA.W $4312
    SEP #$20
    LDA.B #$82 : STA.W $4314
    LDA.B #$02 : STA.W $420B
    PLB : PLP
    RTL


;;; $943D: Load pause menu map tilemap ;;;
LoadPauseMenuMapTilemap:
    PHP
    REP #$30
    LDA.W AreaIndex : CMP.W #$0007 : BMI +
    LDA.W #$0000

+   STA.B DP_Temp12
    ASL : CLC : ADC.B DP_Temp12 : TAX
    LDA.W AreaMapPointers,X : STA.B DP_Temp00
    LDA.W AreaMapPointers+2,X : STA.B DP_Temp02
    LDA.W #BG2RoomSelectMapTilemap : STA.B DP_Temp03
    LDA.W #BG2RoomSelectMapTilemap>>16 : STA.B DP_Temp05
    LDA.B DP_Temp12 : ASL : TAX
    LDA.W #MapData_pointers>>16 : STA.B DP_Temp08
    LDA.L MapData_pointers,X : STA.B DP_Temp06
    LDX.W AreaIndex
    LDA.L SRAMMirror_MapStations,X : AND.W #$00FF : BNE .mapCollected
    SEP #$20
    LDY.W #$0000
    LDX.W #$0000
    STZ.B DP_Temp12
    CLC

  .loopWithoutMapData:
    ROL.W MapTilesExplored,X : BCS .exploredMapTile
    REP #$20
    LDA.W #$001F : STA.B [DP_Temp03],Y

  .nextWithoutMapData:
    SEP #$20
    INY #2
    INC.B DP_Temp12
    LDA.B DP_Temp12 : CMP.B #$08 : BMI .loopWithoutMapData
    STZ.B DP_Temp12
    INX : CPX.W #$0100 : BMI .loopWithoutMapData
    PLP
    RTS

  .exploredMapTile:
    INC.W MapTilesExplored,X
    REP #$30
    LDA.B [DP_Temp00],Y : AND.W #$FBFF : STA.B [DP_Temp03],Y
    BRA .nextWithoutMapData

  .mapCollected:
    REP #$30
    LDA.B [DP_Temp06] : XBA : STA.B DP_Temp26
    INC.B DP_Temp06 : INC.B DP_Temp06
    LDA.W #$0000 : STA.B DP_Temp0B
    LDA.W #MapTilesExplored : STA.B DP_Temp09
    LDA.B [DP_Temp09] : XBA : STA.B DP_Temp28
    INC.B DP_Temp09 : INC.B DP_Temp09
    LDY.W #$0000
    LDX.W #$0010

  .loopWithMapData:
    LDA.B [DP_Temp00],Y
    ASL.B DP_Temp28 : BCC +
    AND.W #$FBFF
    ASL.B DP_Temp26
    BRA .decX

+   ASL.B DP_Temp26 : BCS .decX
    LDA.W #$001F

  .decX:
    STA.B [DP_Temp03],Y
    DEX : BNE .next
    LDX.W #$0010
    LDA.B [DP_Temp06] : XBA : STA.B DP_Temp26
    INC.B DP_Temp06 : INC.B DP_Temp06
    LDA.B [DP_Temp09] : XBA : STA.B DP_Temp28
    INC.B DP_Temp09 : INC.B DP_Temp09

  .next:
    INY #2 : CPY.W #$1000 : BMI .loopWithMapData
    PLP
    RTS


;;; $9517: Draw room select map ;;;
DrawRoomSelectMap:
; Similar to LoadPauseMenuMapTilemap, but different WRAM tilemap and some extra code
    SEP #$30
    LDA.B #$33 : STA.B DP_BGTilesAddr
    LDA.B #$13 : STA.B DP_MainScreenLayers
    LDA.B #$D8 : STA.B DP_BG1YScroll
    LDA.B #$FF : STA.B DP_BG1YScroll+1
    REP #$30
    PHK : PLB
    LDA.W AreaIndex : CMP.W #$0007 : BMI +
    LDA.W #$0000

+   STA.B DP_Temp12
    ASL : CLC : ADC.B DP_Temp12 : TAX
    LDA.W AreaMapPointers,X : STA.B DP_Temp00
    LDA.W AreaMapPointers+2,X : STA.B DP_Temp02
    LDA.W #PauseMenuMapTilemap : STA.B DP_Temp03
    LDA.W #PauseMenuMapTilemap>>16 : STA.B DP_Temp05
    LDA.B DP_Temp12 : ASL : TAX
    LDA.W #MapData_pointers>>16 : STA.B DP_Temp08
    LDA.L MapData_pointers,X : STA.B DP_Temp06
    LDX.W AreaIndex
    LDA.L SRAMMirror_MapStations,X : AND.W #$00FF : BNE .mapCollected
    SEP #$20
    LDY.W #$0000
    LDX.W #$0000
    STZ.B DP_Temp12
    CLC

  .loopWithoutMapData:
    ROL.W MapTilesExplored,X : BCS .exploredMapTile
    REP #$20
    LDA.W #$000F : STA.B [DP_Temp03],Y

  .nextWithoutMapData:
    SEP #$20
    INY #2
    INC.B DP_Temp12
    LDA.B DP_Temp12 : CMP.B #$08 : BMI .loopWithoutMapData
    STZ.B DP_Temp12
    INX : CPX.W #$0100 : BMI .loopWithoutMapData
    JMP .return

  .exploredMapTile:
    INC.W MapTilesExplored,X
    REP #$30
    LDA.B [DP_Temp00],Y : AND.W #$FBFF : STA.B [DP_Temp03],Y
    BRA .nextWithoutMapData

  .mapCollected:
    REP #$30
    LDA.B [DP_Temp06] : XBA : STA.B DP_Temp26
    INC.B DP_Temp06 : INC.B DP_Temp06
    LDA.W #$0000 : STA.B DP_Temp0B
    LDA.W #MapTilesExplored : STA.B DP_Temp09
    LDA.B [DP_Temp09] : XBA : STA.B DP_Temp28
    INC.B DP_Temp09 : INC.B DP_Temp09
    LDY.W #$0000
    LDX.W #$0010

  .loopWithMapData:
    LDA.B [DP_Temp00],Y
    ASL.B DP_Temp28 : BCC +
    AND.W #$FBFF
    ASL.B DP_Temp26
    BRA .decX

+   ASL.B DP_Temp26 : BCS .decX
    LDA.W #$001F

  .decX:
    STA.B [DP_Temp03],Y
    DEX : BNE .next
    LDX.W #$0010
    LDA.B [DP_Temp06] : XBA : STA.B DP_Temp26
    INC.B DP_Temp06 : INC.B DP_Temp06
    LDA.B [DP_Temp09] : XBA : STA.B DP_Temp28
    INC.B DP_Temp09 : INC.B DP_Temp09

  .next:
    INY #2 : CPY.W #$1000 : BMI .loopWithMapData

  .return:
    REP #$30
    LDX.W VRAMWriteStack
    LDA.W #$1000 : STA.B VRAMWrite.size,X
    LDA.W #PauseMenuMapTilemap : STA.B VRAMWrite.src,X
    LDA.W #PauseMenuMapTilemap>>16 : STA.B VRAMWrite.src+2,X
    LDA.B DP_BG1TilemapAddrSize : AND.W #$00FC : XBA : STA.B VRAMWrite.dest,X
    TXA : CLC : ADC.W #$0007 : STA.W VRAMWriteStack
    RTL


;;; $9628: Draw room select map area label ;;;
DrawRoomSelectMap_AreaLabel:
;; Parameters:
;;     $00: Long pointer to tilemap
    PHB
    PHK : PLB
    LDA.W AreaIndex : ASL : TAX
    LDA.W AreaLabelTilemaps_pointers,X : TAX
    LDY.W #$0000

  .loop:
    LDA.W $0000,X : AND.W #$EFFF : STA.B [DP_Temp00],Y
    INX #2
    INY #2 : CPY.W #$0018 : BMI .loop
    PLB
    RTL


;;; $964A: Pointers to area maps ;;;
AreaMapPointers:
; Indexed by area, debug uses Crateria
    dl MapTilemaps_crateria
    dl MapTilemaps_brinstar
    dl MapTilemaps_norfair
    dl MapTilemaps_wreckedShip
    dl MapTilemaps_maridia
    dl MapTilemaps_tourian
    dl UNUSED_MapTilemaps_ceres_B5E000


;;; $965F: Area label tilemaps ;;;
AreaLabelTilemaps:
  .pointers:
    dw AreaLabelTilemaps_crateria
    dw AreaLabelTilemaps_brinstar
    dw AreaLabelTilemaps_norfair
    dw AreaLabelTilemaps_wreckedShip
    dw AreaLabelTilemaps_maridia
    dw AreaLabelTilemaps_tourianDebug
    dw AreaLabelTilemaps_ceres
    dw AreaLabelTilemaps_tourianDebug

  .crateria:
    dw $2801,$2801,$3832,$3841,$3830,$3843,$3834,$3841,$3838,$2830,$2801,$2801

  .brinstar:
    dw $2801,$2801,$3831,$3841,$3838,$383D,$3842,$3843,$3830,$3841,$2801,$2801

  .norfair:
    dw $2801,$2801,$383D,$383E,$3841,$3835,$3830,$3838,$3841,$2801,$2801,$2801

  .wreckedShip:
    dw $3846,$3841,$3834,$3832,$383A,$3834,$3833,$2801,$3842,$3837,$3838,$383F

  .maridia:
    dw $2801,$2801,$383C,$3830,$3841,$3838,$3833,$3838,$3830,$2801,$2801,$2801

  .tourianDebug:
    dw $2801,$2801,$3843,$383E,$3844,$3841,$3838,$3830,$383D,$2801,$2801,$2801

  .ceres:
    dw $2801,$2801,$2801,$3832,$383E,$383B,$383E,$383D,$3848,$2801,$2801,$2801


; Laid out like in RAM
; From RAM map, MapTilesExplored $07F7..08F6:
;     Map tiles explored (for current area). One bit per room.
;     Laid out like a 64x32 1bpp VRAM tilemap:
;         2x1 pages of 32x32 map tiles (80h bytes per page, 4 bytes per row, 1 bit per tile),
;         each byte is 8 map tiles where the most significant bit is the leftmost tile.


;;; $9717: Map data pointers ;;;
MapData:
  .pointers:
    dw MapData_crateria
    dw MapData_brinstar
    dw MapData_norfair
    dw MapData_wreckedShip
    dw MapData_maridia
    dw MapData_tourianDebug
    dw MapData_ceres
    dw MapData_tourianDebug

;;; $9727: Crateria ;;;
  .crateria:
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

;;; $9827: Brinstar ;;;
  .brinstar:
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

;;; $9927: Norfair ;;;
  .norfair:
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

;;; $9A27: Wrecked Ship ;;;
  .wreckedShip:
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

;;; $9B27: Maridia ;;;
  .maridia:
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

;;; $9C27: Tourian / debug ;;;
  .tourianDebug:
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

;;; $9D27: Ceres ;;;
  .ceres:
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


;;; $9E27: Set up map scrolling for pause menu ;;;
SetupMapScrollingForPauseMenu:
;; Parameters:
;;     A: Always 80h. Y position to show center of centered map scroll

; M = midpoint([map min X scroll], [map max X scroll])
; P = ([room X co-ordinate] + [Samus X position] / 100h) * 8

; If M - 60h < P <= M + 60h:
;     Ideal case, centered map scroll shows room position
;     X = M - 80h

; If P > M + 60h:
;     Room is too far right to center map around, display room with 20h pixel margin from the right
;     X = P - E0h

; If P <= M - 60h:
;     Room is too far left to center map around, display room with 20h pixel margin from the left
;     X = P - 20h

; M = midpoint([map min Y scroll], [map max Y scroll])
; P = ([room Y co-ordinate] + [Samus Y position] / 100h) * 8

; If M - 38h < P:
;     Ideal case, centered map scroll shows room position
;     Y = M - 70h

; If P <= M - 38h:
;     Room is too far up, display room with 38h pixel margin from top (8 of those pixels are for the fake top row of the map)
;     Y = P - 38h
;     Y = max(Y, -28h)
    REP #$30
    STA.B DP_Temp14
    LDA.W MapScroll_MaxX : SEC : SBC.W MapScroll_MinX : LSR
    CLC : ADC.W MapScroll_MinX
    SEC : SBC.W #$0080 : STA.B DP_BG1XScroll
    LDA.W SamusXPosition : AND.W #$FF00 : XBA
    CLC : ADC.W RoomMapX : ASL #3
    SEC : SBC.B DP_BG1XScroll : STA.B DP_Temp12
    LDA.W #$00E0 : SEC : SBC.B DP_Temp12 : BPL .Xscroll
    STA.B DP_Temp12
    LDA.B DP_BG1XScroll : SEC : SBC.B DP_Temp12 : STA.B DP_BG1XScroll
    BRA .Yscroll

  .Xscroll:
    LDA.W #$0020 : SEC : SBC.B DP_Temp12 : STA.B DP_Temp12 : BMI .Yscroll
    LDA.B DP_BG1XScroll : SEC : SBC.B DP_Temp12 : STA.B DP_BG1XScroll

  .Yscroll:
    LDA.W MapScroll_MaxY : SEC : SBC.W MapScroll_MinY : LSR
    CLC : ADC.W #$0010
    CLC : ADC.W MapScroll_MinY : STA.B DP_Temp12
    LDA.B DP_Temp14 : SEC : SBC.B DP_Temp12 : AND.W #$FFF8
    EOR.W #$FFFF : INC : STA.B DP_BG1YScroll
    LDA.W SamusYPosition : XBA : AND.W #$00FF
    CLC : ADC.W RoomMapY
    INC : ASL #3
    SEC : SBC.B DP_BG1YScroll : STA.B DP_Temp12
    LDA.W #$0040 : SEC : SBC.B DP_Temp12 : BMI .return
    STA.B DP_Temp12
    LDA.B DP_BG1YScroll : SEC : SBC.B DP_Temp12 : STA.B DP_BG1YScroll
    CMP.W #$FFD8 : BPL .return
    LDA.W #$FFD8 : STA.B DP_BG1YScroll

  .return:
    RTS


;;; $9EC4: Determine map scroll limits ;;;
DetermineMapScrollLimits:
    PHP : PHB
    LDA.W CurrentAreaMapCollectedFlag : BEQ .areaMapNotCollected
    LDA.W #MapData_pointers>>16 : STA.B DP_Temp08
    LDA.W #MapData_pointers : STA.B DP_Temp06
    LDA.W AreaIndex : ASL : TAY
    LDA.B [DP_Temp06],Y : STA.B DP_Temp06
    BRA +

  .areaMapNotCollected:
    LDA.W #$0000 : STA.B DP_Temp08
    LDA.W #MapTilesExplored : STA.B DP_Temp06

+   PHK : PLB
    SEP #$20
    LDA.B DP_Temp08 : STA.B DP_Temp02
    REP #$20
    LDA.B DP_Temp06 : STA.B DP_Temp00
    JSR DetermineLeftmostMapColumn
    JSR A_equals_X_times_8
    STA.W MapScroll_MinX
    LDA.W AreaIndex : CMP.W #$0004 : BNE +
    LDA.W MapScroll_MinX : SEC : SBC.W #$0018 : STA.W MapScroll_MinX

+   LDA.B DP_Temp06 : CLC : ADC.W #$0083 : STA.B DP_Temp00
    JSR DetermineRightmostMapColumn
    JSR A_equals_X_times_8
    STA.W MapScroll_MaxX
    LDA.B DP_Temp06 : STA.B DP_Temp00
    JSR DetermineTopmostMapRow
    JSR A_equals_X_times_8
    STA.W MapScroll_MinY
    LDA.B DP_Temp06 : CLC : ADC.W #$007C : STA.B DP_Temp00
    JSR DetermineLeftmostMapRow
    JSR A_equals_X_times_8
    STA.W MapScroll_MaxY
    PLB : PLP
    RTS


;;; $9F45: A = [X] * 8 ;;;
A_equals_X_times_8:
    TXA : ASL #3
    RTS


;;; $9F4A: Determine leftmost map column ;;;
DetermineLeftmostMapColumn:
;; Parameters:
;;     $00: Long pointer to map data
;; Returns:
;;     X: Leftmost map column (or 1Ah if map is empty)
    PHP
    SEP #$20
    LDA.B #$00 : XBA : LDA.B #$00
    LDX.W #$0000

  .loopColumns:
    TXA : AND.B #$07 : TAY
    LDA.W .bits,Y : STA.B DP_Temp12
    LDY.W #$0000

  .loopRows:
    LDA.B [DP_Temp00],Y : BIT.B DP_Temp12 : BNE .return
    INY #4 : CPY.W #$0080 : BMI .loopRows
    INX : CPX.W #$0040 : BPL .emptyMap
    TXA : AND.B #$07 : BNE +
    LDA.B DP_Temp00 : CLC : ADC.B #$01 : STA.B DP_Temp00
    LDA.B DP_Temp01 : ADC.B #$00 : STA.B DP_Temp01

+   CPX.W #$0020 : BNE .loopColumns
    LDA.B DP_Temp00 : CLC : ADC.B #$7B : STA.B DP_Temp00
    LDA.B DP_Temp01 : ADC.B #$00 : STA.B DP_Temp01
    BRA .loopColumns


  .emptyMap:
    LDX.W #$001A

  .return:
    PLP
    RTS

  .bits:
    db $80,$40,$20,$10,$08,$04,$02,$01


;;; $9FA9: Determine rightmost map column ;;;
DetermineRightmostMapColumn:
;; Parameters:
;;     $00: Long pointer to map data + 83h (byte index of rightmost map column of top row)
;; Returns:
;;     X: Rightmost map column (or 1Ch if map is empty)
    PHP
    SEP #$20
    LDA.B #$00 : XBA : LDA.B #$00
    LDX.W #$003F

  .loopColumns:
    TXA : AND.B #$07 : TAY
    LDA.W .bits,Y : STA.B DP_Temp12
    LDY.W #$0000

  .loopRows:
    LDA.B [DP_Temp00],Y : BIT.B DP_Temp12 : BNE .return
    INY #4 : CPY.W #$0080 : BMI .loopRows
    DEX : BMI .emptyMap
    TXA : AND.B #$07 : CMP.B #$07 : BNE +
    LDA.B DP_Temp00 : SEC : SBC.B #$01 : STA.B DP_Temp00
    LDA.B DP_Temp01 : SBC.B #$00 : STA.B DP_Temp01

+   CPX.W #$001F : BNE .loopColumns
    REP #$20
    LDA.B DP_Temp00 : SEC : SBC.W #$007C : STA.B DP_Temp00
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


;;; $A009: Determine topmost map row ;;;
DetermineTopmostMapRow:
;; Parameters:
;;     $00: Long pointer to map data
;; Returns:
;;     X: Topmost map row (or 1 if map is empty)
    PHP
    REP #$20
    LDA.B DP_Temp00 : CLC : ADC.W #$0080 : STA.B DP_Temp03
    LDA.W #$0000
    SEP #$20
    LDA.B DP_Temp02 : STA.B DP_Temp05
    LDX.W #$0000
    LDY.W #$0000

  .loop:
    LDA.B [DP_Temp00],Y : BNE .return
    LDA.B [DP_Temp03],Y : BNE .return
    INY : CPY.W #$0004 : BMI .loop
    LDY.W #$0000
    REP #$20
    LDA.B DP_Temp00 : CLC : ADC.W #$0004 : STA.B DP_Temp00
    LDA.B DP_Temp03 : CLC : ADC.W #$0004 : STA.B DP_Temp03
    SEP #$20
    INX : CPX.W #$001F : BMI .loop
    LDX.W #$0001

  .return:
    PLP
    RTS


;;; $A053: Determine bottommost map row ;;;
DetermineLeftmostMapRow:
;; Parameters:
;;     $00: Long pointer to map data + 7Ch (byte index of leftmost map column of bottom row)
;; Returns:
;;     X: Bottommost map row (or Bh if map is empty)
    PHP
    REP #$20
    LDA.B DP_Temp00 : CLC : ADC.W #$0080 : STA.B DP_Temp03
    LDA.W #$0000
    SEP #$20
    LDA.B DP_Temp02 : STA.B DP_Temp05
    LDX.W #$001F
    LDY.W #$0000

  .loop:
    LDA.B [DP_Temp00],Y : BNE .return
    LDA.B [DP_Temp03],Y : BNE .return
    INY : CPY.W #$0004 : BMI .loop
    LDY.W #$0000
    REP #$20
    LDA.B DP_Temp00 : SEC : SBC.W #$0004 : STA.B DP_Temp00
    LDA.B DP_Temp03 : SEC : SBC.W #$0004 : STA.B DP_Temp03
    SEP #$20
    DEX : BNE .loop
    LDX.W #$000B

  .return:
    PLP
    RTS


;;; $A09A: Set up PPU for pause menu ;;;
SetupPPUForPauseMenu:
    SEP #$30
    LDA.B #$01 : STA.W $2101 : STA.B DP_SpriteSizeAddr
    LDA.B #$09 : STA.W $2105 : STA.B DP_BGModeSize
    STZ.B DP_BGTilesAddr : STZ.W $210B
    LDA.B #$04 : STA.B DP_BGTilesAddr+1 : STA.W $210C
    LDA.B #$31 : STA.B DP_BG1TilemapAddrSize : STA.W $2107
    LDA.B #$38 : STA.B DP_BG2TilemapAddrSize : STA.W $2108
    LDA.B #$58 : STA.B DP_BG3TilemapAddrSize : STA.W $2109
    LDA.B #$00 : STA.B DP_BG4TilemapAddrSize : STA.W $210A
    LDA.B #$17 : STA.W $212C : STA.B DP_MainScreenLayers
    LDA.B #$00 : STA.W $2106 : STA.B DP_Mosaic
    LDA.B DP_ColorMathSubScreenBackdropColor0 : AND.B #$E0 : STA.B DP_ColorMathSubScreenBackdropColor0
    LDA.B DP_ColorMathSubScreenBackdropColor1 : AND.B #$E0 : STA.B DP_ColorMathSubScreenBackdropColor1
    LDA.B DP_ColorMathSubScreenBackdropColor2 : AND.B #$E0 : STA.B DP_ColorMathSubScreenBackdropColor2
    LDA.B #$00 : STA.B DP_NextGameplayColorMathB
    RTS


;;; $A0F7: Reset pause menu animations ;;;
ResetPauseMenuAnimations:
    REP #$30
    STZ.W PauseMenu_ReserveTankSoundDelayCounter
    STZ.B DP_BG1XScroll : STZ.B DP_BG2XScroll : STZ.B DP_BG3XScroll
    STZ.B DP_BG2YScroll : STZ.B DP_BG3YScroll
    STZ.W PauseMenu_ButtonLabelMode : STZ.W PauseMenu_HighlightAnimationFrame
    STZ.W PauseMenu_UnusedAnimationFrame : STZ.W PauseMenu_SamusPositionIndicatorAnimFrame
    STZ.W PauseMenu_SamusPositionIndicatorAnimTimer : STZ.W PauseMenu_SamusPositionIndicatorAnimLoopCount
    LDA.W L_R_HighlightAnimationData_PauseScreenPaletteAnimationDelays : STA.W PauseMenu_HighlightAnimationTimer
    LDA.W #$0001 : STA.W PauseMenu_PaletteAnimationTimer
    LDA.W #$0000 : STA.W PauseMenu_PaletteAnimationFrame
    RTS


;;; $A12B: Load equipment screen equipment tilemaps ;;;
Load_EquipmentScreen_EquipmentTilemaps:
    REP #$30
    LDA.W MaxReserveEnergy : BEQ +
    LDY.W #$0000
    LDA.W #EquipmentScreenData_RAMTilemapOffsets_tanks : STA.B DP_Temp03
    LDA.W #EquipmentScreenData_RAMTilemapOffsets_tanks>>16 : STA.B DP_Temp05
    LDA.B [DP_Temp03],Y : STA.B DP_Temp00
    LDX.W EquipmentScreenData_PointersEquipmentTIlemaps_tanks
    LDA.W #$000E : STA.B DP_Temp16
    JSR Copy_Bytes_from_X_to_7ERAM
    LDY.W #$0002
    LDA.W #EquipmentScreenData_RAMTilemapOffsets_tanks : STA.B DP_Temp03
    LDA.W #EquipmentScreenData_RAMTilemapOffsets_tanks>>16 : STA.B DP_Temp05
    LDA.B [DP_Temp03],Y : STA.B DP_Temp00
    LDX.W EquipmentScreenData_PointersEquipmentTIlemaps_tanksReserve
    LDA.W #$000E : STA.B DP_Temp16
    JSR Copy_Bytes_from_X_to_7ERAM

+   LDY.W #$0000
    LDA.W #EquipmentScreenData_RAMTilemapOffsets_weapons : STA.B DP_Temp03
    LDA.W #EquipmentScreenData_RAMTilemapOffsets_weapons>>16 : STA.B DP_Temp05
    LDA.B [DP_Temp03],Y : STA.B DP_Temp00
    LDA.W HyperBeam : BNE .hyperBeam

  .loopWeapons:
    LDA.W EquipmentScreenData_EquipmentBitmasks_weapons,Y : BIT.W CollectedBeams : BNE +
    LDX.W #EquipmentScreenTilemaps_blankPlaceholder
    LDA.W #$000A : STA.B DP_Temp16
    JSR Copy_Bytes_from_X_to_7ERAM
    BRA .nextWeapon

+   LDX.W EquipmentScreenData_PointersEquipmentTIlemaps_weapons,Y
    LDA.W #$000A : STA.B DP_Temp16
    JSR Copy_Bytes_from_X_to_7ERAM
    LDA.W EquipmentScreenData_EquipmentBitmasks_weapons,Y : BIT.W EquippedBeams : BNE .nextWeapon
    LDA.W #$0C00 : STA.B DP_Temp12
    LDA.W #$000A : STA.B DP_Temp16
    JSR Copy_Bytes_of_Palette_from_7E_to_12

  .nextWeapon:
    INY #2
    LDA.B [DP_Temp03],Y : STA.B DP_Temp00
    CPY.W #$000C : BMI .loopWeapons
    BRA .merge

  .hyperBeam:
    LDY.W #$0000

  .loopHyperBeamWeapons:
    LDX.W HyperBeamTilemaps,Y
    LDA.W #$000A : STA.B DP_Temp16
    JSR Copy_Bytes_from_X_to_7ERAM
    INY #2
    LDA.B [DP_Temp03],Y : STA.B DP_Temp00
    CPY.W #$000C : BMI .loopHyperBeamWeapons

  .merge:
    LDY.W #$0000
    LDA.W #EquipmentScreenData_RAMTilemapOffsets_suitsMisc : STA.B DP_Temp03
    LDA.W #EquipmentScreenData_RAMTilemapOffsets_suitsMisc>>16 : STA.B DP_Temp05
    LDA.B [DP_Temp03],Y : STA.B DP_Temp00

  .loopSuitMisc:
    LDA.W EquipmentScreenData_EquipmentBitmasks_suitsMisc,Y : BIT.W CollectedItems : BNE +
    LDX.W #EquipmentScreenTilemaps_blankPlaceholder
    LDA.W #$0012 : STA.B DP_Temp16
    JSR Copy_Bytes_from_X_to_7ERAM
    BRA .nextSuitMisc

+   LDX.W EquipmentScreenData_PointersEquipmentTIlemaps_suitsMisc,Y
    LDA.W #$0012 : STA.B DP_Temp16
    JSR Copy_Bytes_from_X_to_7ERAM
    LDA.W EquipmentScreenData_EquipmentBitmasks_suitsMisc,Y : BIT.W EquippedItems : BNE .nextSuitMisc
    LDA.W #$0C00 : STA.B DP_Temp12
    LDA.W #$0012 : STA.B DP_Temp16
    JSR Copy_Bytes_of_Palette_from_7E_to_12

  .nextSuitMisc:
    INY #2
    LDA.B [DP_Temp03],Y : STA.B DP_Temp00
    CPY.W #$000C : BMI .loopSuitMisc
    LDY.W #$0000
    LDA.W #EquipmentScreenData_RAMTilemapOffsets_boots : STA.B DP_Temp03
    LDA.W #EquipmentScreenData_RAMTilemapOffsets_boots>>16 : STA.B DP_Temp05
    LDA.B [DP_Temp03],Y : STA.B DP_Temp00

  .loopBoots:
    LDA.W EquipmentScreenData_EquipmentBitmasks_boots,Y : BIT.W CollectedItems : BNE +
    LDX.W #EquipmentScreenTilemaps_blankPlaceholder
    LDA.W #$0012 : STA.B DP_Temp16
    JSR Copy_Bytes_from_X_to_7ERAM
    BRA .nextBoots

+   LDA.W #$0012 : STA.B DP_Temp16
    LDX.W EquipmentScreenData_PointersEquipmentTIlemaps_boots,Y
    JSR Copy_Bytes_from_X_to_7ERAM
    LDA.W EquipmentScreenData_EquipmentBitmasks_boots,Y : BIT.W EquippedItems : BNE .nextBoots
    LDA.W #$0C00 : STA.B DP_Temp12
    LDA.W #$0012 : STA.B DP_Temp16
    JSR Copy_Bytes_of_Palette_from_7E_to_12

  .nextBoots:
    INY #2
    LDA.B [DP_Temp03],Y : STA.B DP_Temp00
    CPY.W #$0006 : BMI .loopBoots
    RTS


;;; $A27E: Copy [$16] bytes from [X] to $7E:[$00] ;;;
Copy_Bytes_from_X_to_7ERAM:
;; Parameters:
;;     DB:X: Source address
;;     $00: Destination address
;;     $16: Number of bytes
    PHP : PHY
    SEP #$20
    LDA.B #$7E : STA.B DP_Temp02
    REP #$30
    LDY.W #$0000

  .loop:
    LDA.W $0000,X : STA.B [$00],Y
    INX #2
    INY #2
    DEC.B DP_Temp16 : DEC.B DP_Temp16 : BNE .loop
    PLY : PLP
    RTS


;;; $A29D: Set tile palettes of [$16] bytes of $7E:[$00] to [$12] ;;;
Copy_Bytes_of_Palette_from_7E_to_12:
;; Parameters:
;;     $00: Tilemap address
;;     $12: Palette index (multiple of 400h)
;;     $16: Size (multiple of 2)
    PHP : PHY
    SEP #$20
    LDA.B #$7E : STA.B DP_Temp02
    REP #$30
    LDY.W #$0000

  .loop:
    LDA.B [DP_Temp00],Y : AND.W #$E3FF : ORA.B DP_Temp12 : STA.B [DP_Temp00],Y
    INY #2
    DEC.B DP_Temp16 : DEC.B DP_Temp16 : BNE .loop
    PLY : PLP
    RTS


;;; $A2BE: Clear Samus/beam tiles ;;;
Clear_Samus_Beam_Tiles:
; Reloads the first quarter of the standard sprite tiles
    PHP
    SEP #$30
    LDA.B #$00 : STA.W $2116
    LDA.B #$60 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl Tiles_Standard_Sprite_0
    dw $1000
    LDA.B #$02 : STA.W $420B
    PLP
    RTS


;;; $A2E3: Continue initialising gameplay resume ;;;
ContinueInitialising_GameplayResume:
; Like $9009, I don't know why this is a subroutine and not a part of GameState_11_Unpausing_LoadingNormalGameplay
    SEP #$30
    PHP
    REP #$30
    LDY.W #$0200
    LDX.W #$0000

  .loop:
    LDA.L BackupOfPalettesDuringMenu,X : STA.L Palettes,X
    INX #2
    DEY #2 : BNE .loop
    PLP
    JSR Setup_PPU_for_GameplayResume
    JSR Calculate_BG_Scrolls_bank82
    JSR JSL_to_Update_BeamTiles_and_Palette
    JSR Clear_PauseMenu_Data
    REP #$30
    LDA.W #$000C
    JSL Run_Samus_Command
    RTS


;;; $A313: Set up PPU for gameplay resume ;;;
Setup_PPU_for_GameplayResume:
    PHP
    SEP #$30
    LDA.B #$03 : STA.W $2101 : STA.B DP_SpriteSizeAddr
    LDA.B #$09 : STA.W $2105 : STA.B DP_BGModeSize
    STZ.B DP_BGTilesAddr : STZ.W $210B
    LDA.B #$04 : STA.B DP_BGTilesAddr+1 : STA.W $210C
    LDA.B #$51 : STA.B DP_BG1TilemapAddrSize : STA.W $2107
    LDA.B #$49 : STA.B DP_BG2TilemapAddrSize : STA.W $2108
    LDA.B #$5A : STA.B DP_BG3TilemapAddrSize : STA.W $2109
    LDA.B #$00 : STA.B DP_BG4TilemapAddrSize : STA.W $210A
    PLP
    RTS


;;; $A34E: Calculate BG scrolls ;;;
Calculate_BG_Scrolls_bank82:
; Called during unpausing
    PHP
    REP #$30
    LDA.W Layer1XPosition : CLC : ADC.W BG1XOffset : STA.B DP_BG1XScroll
    LDA.W Layer1YPosition : CLC : ADC.W BG1YOffset : STA.B DP_BG1YScroll
    LDA.W Layer2XPosition : CLC : ADC.W BG2XOffset : STA.B DP_BG2XScroll
    LDA.W Layer2YPosition : CLC : ADC.W BG2YOffset : STA.B DP_BG2YScroll
    PLP
    RTS


;;; $A377: Update beam tiles and palette ;;;
JSL_to_Update_BeamTiles_and_Palette:
    PHP
    REP #$30
    JSL Update_Beam_Tiles_and_Palette
    PLP
    RTS


;;; $A380: Clear pause menu data ;;;
Clear_PauseMenu_Data:
    PHP
    REP #$30
    STZ.W PauseMenu_MenuIndex
    STZ.W PauseMenu_ButtonPressedHighlightTimer
    STZ.W PauseMenu_HighlightAnimationTimer
    STZ.W PauseMenu_ItemSelectorAnimationTimer
    STZ.W PauseMenu_ReserveTankAnimationTimer
    STZ.W PauseMenu_UnusedAnimationTimer0731
    STZ.W PauseMenu_MapScrollUpArrowAnimationTimer
    STZ.W PauseMenu_MapScrollDownArrowAnimationTimer
    STZ.W PauseMenu_MapScrollRightArrowAnimationTimer
    STZ.W PauseMenu_MapScrollLeftArrowAnimationTimer
    STZ.W PauseMenu_UnusedAnimationTimer073D
    STZ.W PauseMenu_HighlightAnimationFrame
    STZ.W PauseMenu_ItemSelectorAnimationFrame
    STZ.W PauseMenu_ReserveTankAnimationFrame
    STZ.W PauseMenu_UnusedAnimationFrame
    STZ.W PauseMenu_MapScrollUpArrowAnimationFrame
    STZ.W PauseMenu_MapScrollDownArrowAnimationFrame
    STZ.W PauseMenu_MapScrollRightArrowAnimationFrame
    STZ.W PauseMenu_MapScrollLeftArrowAnimationFrame
    STZ.W PauseMenu_ShoulderButtonPressedHighlight
    STZ.W PauseMenu_ButtonLabelMode
    STZ.W PauseMenu_EquipmentScreenCategoryIndex
    STZ.W PauseMenu_ReserveTankSoundDelayCounter
    STZ.W PauseMenu_UnusedAnimationMode
    STZ.W PauseMenu_MapScrollUpArrowAnimationMode
    STZ.W PauseMenu_MapScrollDownArrowAnimationMode
    STZ.W PauseMenu_MapScrollRightArrowAnimationMode
    STZ.W PauseMenu_MapScrollLeftArrowAnimationMode
    PLP
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $A3D9: Unused. Change pose due to equipment change ;;;
UNUSED_Change_Pose_Due_to_Equipment_Change:
; Looks like maybe it was a hook on leaving the equipment screen if liquid physics apply
; Possibly a proto version of what became $91:E633
    PHP
    REP #$30
    LDA.W MovementType : AND.W #$00FF : ASL : TAX
    JSR.W (.pointers,X)
    JSL LoadSamusSuitPalette
    PLP
    RTS

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
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $A425: RTS ;;;
RTS_82A425:
    PHP
    REP #$30
    PLP
    RTS


;;; $A42A: Change pose due to equipment change - spin jumping ;;;
ChangePose_DueTo_EquipmentChange_SpinJumping:
    PHP
    REP #$30
    LDA.W Pose : CMP.W #$0081 : BEQ .screwAttack
    CMP.W #$0082 : BEQ .screwAttack
    CMP.W #$001B : BEQ .spaceJump
    CMP.W #$001C : BEQ .spaceJump
    BRA .return

  .spaceJump:
    LDA.W EquippedItems : BIT.W #$0020 : BNE .return
    BRA .merge

  .screwAttack:
    LDA.W EquippedItems : BIT.W #$0008 : BNE .return

  .merge:
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.W #$0019 : STA.W Pose
    BRA .initialisePose

  .facingLeft:
    LDA.W #$001A : STA.W Pose

  .initialisePose:
    JSL InitializeSamusPose_1
    JSL Set_Samus_AnimationFrame_if_PoseChanged

  .return:
    PLP
    RTS


;;; $A47B: Change pose due to equipment change - movement types 7/9 ;;;
Change_Pose_due_to_Equipment_Change_MovementTypes_7_9:
; Unused movement types
    PHP
    REP #$30
    LDA.W EquippedItems : BIT.W #$0004 : BNE .return
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.W #$001D : STA.W Pose
    BRA .initialisePose

  .facingLeft:
    LDA.W #$0041 : STA.W Pose

  .initialisePose:
    JSL InitializeSamusPose_1
    JSL Set_Samus_AnimationFrame_if_PoseChanged

  .return:
    PLP
    RTS


;;; $A4A9: Change pose due to equipment change - morph ball ;;;
ChangePose_DueTo_EquipmentChange_MorphBall:
    PHP
    REP #$30
    LDA.W EquippedItems : BIT.W #$0002 : BEQ .return
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.W #$0079 : STA.W Pose
    BRA .initialisePose

  .facingLeft:
    LDA.W #$007A : STA.W Pose

  .initialisePose:
    JSL InitializeSamusPose_1
    JSL Set_Samus_AnimationFrame_if_PoseChanged

  .return:
    PLP
    RTS


;;; $A4D7: Change pose due to equipment change - spring ball ;;;
ChangePose_DueTo_EquipmentChange_SpringBall:
    PHP
    REP #$30
    LDA.W EquippedItems : BIT.W #$0002 : BNE .return
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.W #$001D : STA.W Pose
    BRA .initialisePose

  .facingLeft:
    LDA.W #$0041 : STA.W Pose

  .initialisePose:
    JSL InitializeSamusPose_1
    JSL Set_Samus_AnimationFrame_if_PoseChanged

  .return:
    PLP
    RTS


;;; $A505: Handle pause menu L/R ;;;
Handle_PauseScreen_L_R:
    JSR Handle_PauseScreen_L_R_Input
    JSR EquipmentScreen_Draw_L_R_Highlight
    RTS


;;; $A50C: Handle pause menu L/R input ;;;
Handle_PauseScreen_L_R_Input:
    PHP
    REP #$30
    LDA.W Input_TimedHeldNew : BIT.W #$0020 : BNE .L
    BIT.W #$0010 : BNE .R
    BRA .return

    LDA.W PauseMenu_ButtonLabelMode : BNE .highlightL
    BRA .highlightR

  .R:
    LDA.W PauseMenu_ButtonLabelMode : CMP.W #$0002 : BEQ .return
    LDA.W Duration_Of_L_R_Button_Pressed_Highlight : STA.W PauseMenu_ButtonPressedHighlightTimer
    LDA.W #$0002 : STA.W PauseMenu_MenuIndex

  .highlightR:
    LDA.W #$0002 : STA.W PauseMenu_ShoulderButtonPressedHighlight : STA.W PauseMenu_ButtonLabelMode
    JSR Set_PauseScreen_ButtonLabelPalettes
    BRA .merge

  .L:
    LDA.W PauseMenu_ButtonLabelMode : BEQ .return
    LDA.W Duration_Of_L_R_Button_Pressed_Highlight : STA.W PauseMenu_ButtonPressedHighlightTimer
    LDA.W #$0005 : STA.W PauseMenu_MenuIndex

  .highlightL:
    LDA.W #$0001 : STA.W PauseMenu_ShoulderButtonPressedHighlight
    STZ.W PauseMenu_ButtonLabelMode
    JSR Set_PauseScreen_ButtonLabelPalettes

  .merge:
    LDA.W #$0038
    JSL QueueSound_Lib1_Max6

  .return:
    PLP
    RTS


;;; $A56D: Handle pause menu L/R pressed highlight ;;;
Handle_PauseMenu_L_R_PressedHighlight:
    PHP
    REP #$30
    LDA.W PauseMenu_ButtonPressedHighlightTimer : BEQ .return
    DEC : STA.W PauseMenu_ButtonPressedHighlightTimer
    LDA.W PauseMenu_ShoulderButtonPressedHighlight : BEQ .return
    DEC : ASL : TAX
    LDA.W #$0000 : STA.B DP_Temp03
    LDA.W L_R_ButtonPressed_HighlightTable_spritemapID,X : PHA
    LDA.W L_R_ButtonPressed_HighlightTable_YposPlus1,X : TAY
    DEY
    LDA.W L_R_ButtonPressed_HighlightTable_Xpos,X : TAX
    PLA
    JSL AddSpritemapFrom_82C569_TableToOAM

  .return:
    PLP
    RTS


;;; $A59A: Equipment screen - draw L/R highlight ;;;
EquipmentScreen_Draw_L_R_Highlight:
    PHP
    REP #$30
    LDY.W #$00D0
    LDX.W #$0018
    LDA.W #$0002
    JSR Draw_PauseScreen_SpriteAnimation
    LDY.W #$00D0
    LDX.W #$00E8
    LDA.W #$0002
    JSR Draw_PauseScreen_SpriteAnimation
    PLP
    RTS


;;; $A5B7: Handle pause menu start button ;;;
Handle_PauseScreen_StartButton:
    PHP
    REP #$30
    LDA.W Input_TimedHeldNew : BIT.W #$1000 : BEQ +
    LDA.W #$0038
    JSL QueueSound_Lib1_Max6
    LDA.W #$0001 : STA.W ScreenFadeDelay : STA.W ScreenFadeCounter
    LDA.W PauseMenu_ButtonLabelMode : PHA
    LDA.W #$0001 : STA.W PauseMenu_ButtonLabelMode
    JSR Set_PauseScreen_ButtonLabelPalettes
    PLA : STA.W PauseMenu_ButtonLabelMode
    LDA.W #$000B : STA.W PauseMenu_ButtonPressedHighlightTimer
    INC.W GameState

+   JSR Update_PauseMenu_L_R_Start_VRAMTilemap
    PLP
    RTS


;;; $A5F1: Handle pause menu start pressed highlight ;;;
Handle_PauseMenu_StartPressedHighlight:
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W PauseMenu_ButtonPressedHighlightTimer : BEQ .return
    DEC : STA.W PauseMenu_ButtonPressedHighlightTimer
    LDA.W #$0000 : STA.B DP_Temp03
    LDX.W #$0090
    LDY.W #$00D0
    LDA.W #$002B
    JSL AddSpritemapFrom_82C569_TableToOAM

  .return:
    PLB : PLP
    RTL


;;; $A615: Set pause menu button label palettes ;;;
Set_PauseScreen_ButtonLabelPalettes:
    PHP
    REP #$30
    LDA.W PauseMenu_ButtonLabelMode : ASL : TAX
    JSR.W (.pointers,X)
    PLP
    RTS

  .pointers:
    dw Set_PauseScreen_ButtonLabelPalettes_MapScreen
    dw Set_PauseScreen_ButtonLabelPalettes_Unpausing
    dw Set_PauseScreen_ButtonLabelPalettes_EquipmentScreen


;;; $A628: Set pause menu button label palettes - equipment screen ;;;
Set_PauseScreen_ButtonLabelPalettes_EquipmentScreen:
; Someone liked pushing and pulling operations >_>
    REP #$30
    PHP
    REP #$30
    LDY.W #$000A
    LDX.W #$0000

  .loopTopMAP:
    LDA.L PauseMenuMapTilemap+$64A,X : AND.W #$E3FF : ORA.W #$0800 : STA.L PauseMenuMapTilemap+$64A,X
    INX #2
    DEY #2 : BNE .loopTopMAP
    PLP : PHP
    REP #$30
    LDY.W #$000A
    LDX.W #$0000

  .loopBottomMAP:
    LDA.L PauseMenuMapTilemap+$68A,X : AND.W #$E3FF : ORA.W #$0800 : STA.L PauseMenuMapTilemap+$68A,X
    INX #2
    DEY #2 : BNE .loopBottomMAP
    PLP : PHP
    REP #$30
    LDY.W #$0008
    LDX.W #$0000

  .loopTopEXIT:
    LDA.L PauseMenuMapTilemap+$658,X : AND.W #$E3FF : ORA.W #$0800 : STA.L PauseMenuMapTilemap+$658,X
    INX #2
    DEY #2 : BNE .loopTopEXIT
    PLP : PHP
    REP #$30
    LDY.W #$0008
    LDX.W #$0000

  .loopBottomEXIT:
    LDA.L PauseMenuMapTilemap+$698,X : AND.W #$E3FF : ORA.W #$0800 : STA.L PauseMenuMapTilemap+$698,X
    INX #2
    DEY #2 : BNE .loopBottomEXIT
    PLP : PHP
    REP #$30
    LDY.W #$000A
    LDX.W #$0000

  .loopTopSAMUS:
    LDA.L PauseMenuMapTilemap+$66C,X : AND.W #$E3FF : ORA.W #$1400 : STA.L PauseMenuMapTilemap+$66C,X
    INX #2
    DEY #2 : BNE .loopTopSAMUS
    PLP : PHP
    REP #$30
    LDY.W #$000A
    LDX.W #$0000

  .loopBottomSAMUS:
    LDA.L PauseMenuMapTilemap+$6AC,X : AND.W #$E3FF : ORA.W #$1400 : STA.L PauseMenuMapTilemap+$6AC,X
    INX #2
    DEY #2 : BNE .loopBottomSAMUS
    PLP
    RTS


;;; $A6DF: Set pause menu button label palettes - unpausing ;;;
Set_PauseScreen_ButtonLabelPalettes_Unpausing:
    REP #$30
    PHP
    REP #$30
    LDY.W #$0008
    LDX.W #$0000

  .loopTopEXIT:
    LDA.L PauseMenuMapTilemap+$658,X : AND.W #$E3FF : ORA.W #$0800 : STA.L PauseMenuMapTilemap+$658,X
    INX #2
    DEY #2 : BNE .loopTopEXIT
    PLP : PHP
    REP #$30
    LDY.W #$0008
    LDX.W #$0000

  .loopBottomEXIT:
    LDA.L PauseMenuMapTilemap+$698,X : AND.W #$E3FF : ORA.W #$0800 : STA.L PauseMenuMapTilemap+$698,X
    INX #2
    DEY #2 : BNE .loopBottomEXIT
    PLP : PHP
    REP #$30
    LDY.W #$000A
    LDX.W #$0000

  .loopTopMAP:
    LDA.L PauseMenuMapTilemap+$64A,X : AND.W #$E3FF : ORA.W #$1400 : STA.L PauseMenuMapTilemap+$64A,X
    INX #2
    DEY #2 : BNE .loopTopMAP
    PLP : PHP
    REP #$30
    LDY.W #$000A
    LDX.W #$0000

  .loopBottomMAP:
    LDA.L PauseMenuMapTilemap+$68A,X : AND.W #$E3FF : ORA.W #$1400 : STA.L PauseMenuMapTilemap+$68A,X
    INX #2
    DEY #2 : BNE .loopBottomMAP
    PLP : PHP
    REP #$30
    LDY.W #$000A
    LDX.W #$0000

  .loopTopSAMUS:
    LDA.L PauseMenuMapTilemap+$66C,X : AND.W #$E3FF : ORA.W #$1400 : STA.L PauseMenuMapTilemap+$66C,X
    INX #2
    DEY #2 : BNE .loopTopSAMUS
    PLP : PHP
    REP #$30
    LDY.W #$000A
    LDX.W #$0000

  .loopBottomSAMUS:
    LDA.L PauseMenuMapTilemap+$6AC,X : AND.W #$E3FF : ORA.W #$1400 : STA.L PauseMenuMapTilemap+$6AC,X
    INX #2
    DEY #2 : BNE .loopBottomSAMUS
    PLP
    RTS


;;; $A796: Set pause menu button label palettes - map screen ;;;
Set_PauseScreen_ButtonLabelPalettes_MapScreen:
    REP #$30
    PHP
    REP #$30
    LDY.W #$000A
    LDX.W #$0000

  .loopTopSAMUS:
    LDA.L PauseMenuMapTilemap+$66C,X : AND.W #$E3FF : ORA.W #$0800 : STA.L PauseMenuMapTilemap+$66C,X
    INX #2
    DEY #2 : BNE .loopTopSAMUS
    PLP : PHP
    REP #$30
    LDY.W #$000A
    LDX.W #$0000

  .loopBottomSAMUS:
    LDA.L PauseMenuMapTilemap+$6AC,X : AND.W #$E3FF : ORA.W #$0800 : STA.L PauseMenuMapTilemap+$6AC,X
    INX #2
    DEY #2 : BNE .loopBottomSAMUS
    PLP : PHP
    REP #$30
    LDY.W #$0008
    LDX.W #$0000

  .loopTopEXIT:
    LDA.L PauseMenuMapTilemap+$658,X : AND.W #$E3FF : ORA.W #$0800 : STA.L PauseMenuMapTilemap+$658,X
    INX #2
    DEY #2 : BNE .loopTopEXIT
    PLP : PHP
    REP #$30
    LDY.W #$0008
    LDX.W #$0000

  .loopBottomEXIT:
    LDA.L PauseMenuMapTilemap+$698,X : AND.W #$E3FF : ORA.W #$0800 : STA.L PauseMenuMapTilemap+$698,X
    INX #2
    DEY #2 : BNE .loopBottomEXIT
    PLP : PHP
    REP #$30
    LDY.W #$000A
    LDX.W #$0000

  .loopTopMAP:
    LDA.L PauseMenuMapTilemap+$64A,X : AND.W #$E3FF : ORA.W #$1400 : STA.L PauseMenuMapTilemap+$64A,X
    INX #2
    DEY #2 : BNE .loopTopMAP
    PLP : PHP
    REP #$30
    LDY.W #$000A
    LDX.W #$0000

  .loopBottomMAP:
    LDA.L PauseMenuMapTilemap+$68A,X : AND.W #$E3FF : ORA.W #$1400 : STA.L PauseMenuMapTilemap+$68A,X
    INX #2
    DEY #2 : BNE .loopBottomMAP
    PLP
    RTS


;;; $A84D: Update pause menu L/R/start VRAM tilemap ;;;
Update_PauseMenu_L_R_Start_VRAMTilemap:
    PHP
    REP #$30
    LDX.W VRAMWriteStack
    LDA.W #$0080 : STA.B VRAMWrite.size,X
    INX #2
    LDA.W #PauseMenuMapTilemap+$640 : STA.B VRAMWrite.size,X
    INX #2
    SEP #$20
    LDA.B #PauseMenuMapTilemap>>16 : STA.B VRAMWrite.size,X
    REP #$20
    INX
    LDA.B DP_BG2TilemapAddrSize : AND.W #$00FC : XBA
    CLC : ADC.W #$0320 : STA.B VRAMWrite.size,X
    INX #2 : STX.W VRAMWriteStack
    PLP
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $A87D: Unused. External draw equipment screen spritemap ;;;
UNUSED_Draw_PauseScreen_SpriteAnimation_long:
;; Parameters:
;;     A: Animation ID + 1
;;     X: X position
;;     Y: Y position + 1
    JSR Draw_PauseScreen_SpriteAnimation
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $A881: Draw pause menu sprite animation ;;;
Draw_PauseScreen_SpriteAnimation:
;; Parameters:
;;     A: Animation ID + 1
;;     X: X position
;;     Y: Y position + 1

; Used for L/R highlight ($A59A), item selector ($B267), and map scroll arrow ($B90A)

; [$C0B2 + (animation ID) * 2]: Animation timer pointer (in RAM, $0729..3A)
; [$C0C4 + (animation ID) * 2]: Animation frame pointer (in RAM, $073D..4E), indexes animation data
; [$C0D6 + (animation ID) * 2]: Animation mode pointer (in RAM, $0751..62)
; [$C0E8 + (animation ID) * 2]: Animation data pointer (in bank $82). Timers and spritemap IDs indices (always zero?)
; [$C1E4 + (animation ID) * 2]: Animation spritemap base IDs pointer (in bank $82)
    PHP : PHX
    REP #$30
    STX.B DP_Temp12
    STY.B DP_Temp14
    DEC : ASL : TAX
    LDA.W PauseScreen_SpriteAnimationData_timer,X : TAY
    LDA.W $0000,Y : DEC : STA.W $0000,Y : BEQ +
    BPL .nonZero

+   STY.B DP_Temp18
    LDA.W PauseScreen_SpriteAnimationData_frame,X : TAY
    LDA.W $0000,Y : INC : STA.W $0000,Y
    ASL : CLC : ADC.W $0000,Y : STA.B DP_Temp16
    LDA.W PauseScreen_SpriteAnimationData_data,X : CLC : ADC.B DP_Temp16 : TAY
    LDA.W $0000,Y : AND.W #$00FF : CMP.W #$00FF : BNE +
    LDA.W PauseScreen_SpriteAnimationData_frame,X : TAY
    LDA.W #$0000 : STA.W $0000,Y
    LDA.W PauseScreen_SpriteAnimationData_data,X : TAY
    LDA.W $0000,Y : AND.W #$00FF

+   LDY.B DP_Temp18
    STA.W $0000,Y

  .nonZero:
    LDA.W PauseScreen_SpriteAnimationData_frame,X : TAY
    LDA.W $0000,Y : ASL : CLC : ADC.W $0000,Y : STA.B DP_Temp18
    LDA.W PauseScreen_SpriteAnimationData_data,X : CLC : ADC.B DP_Temp18 : INC
    TAY : PHY
    LDA.W #$0003 : ASL : TAY
    LDA.W SpritePalette_IndexValues,Y : STA.B DP_Temp03
    PLY : INY
    LDA.W $0000,Y : AND.W #$00FF : STA.B DP_Temp18
    LDA.W PauseScreen_SpriteAnimationData_mode,X : TAY
    LDA.W $0000,Y : AND.W #$00FF : ASL : STA.B DP_Temp1A
    LDA.W AnimationSpritemapBaseIDPointers,X : CLC : ADC.B DP_Temp1A : TAY
    LDA.W $0000,Y : CLC : ADC.B DP_Temp18
    LDX.B DP_Temp12
    LDY.B DP_Temp14 : DEY
    JSL AddSpritemapFrom_82C569_TableToOAM
    PLX : PLP
    RTS


;;; $A92B: Handle pause menu palette animation ;;;
Handle_PauseScreen_PaletteAnimation:
; Map arrows, status selection box, etc.
    PHP
    SEP #$20
    LDA.B #$00 : XBA : LDA.B #$00
    LDA.W PauseMenu_PaletteAnimationTimer : BEQ .return
    DEC : STA.W PauseMenu_PaletteAnimationTimer : BNE .return
    LDA.W PauseMenu_PaletteAnimationFrame : INC

  .loop:
    STA.W PauseMenu_PaletteAnimationFrame
    ASL : CLC : ADC.W PauseMenu_PaletteAnimationFrame : TAX
    LDA.W L_R_HighlightAnimationData_PauseScreenPaletteAnimationDelays,X : CMP.B #$FF : BNE +
    REP #$30
    LDA.W #$002A
    JSL QueueSound_Lib3_Max6
    SEP #$20 ; >.<
    LDA.B #$00 : XBA : LDA.B #$00
    BRA .loop

+   STA.W PauseMenu_PaletteAnimationTimer
    LDA.W PauseMenu_PaletteAnimationFrame
    REP #$30
    XBA : LSR #3
    CLC : ADC.W #$001E : TAY
    LDX.W #$001E

  .loopAnimationTimer:
    LDA.W .paletteData,Y : STA.L Palettes_SpriteP3,X
    DEY #2
    DEX #2 : BPL .loopAnimationTimer

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


;;; $AB47: Equipment screen - set up reserve mode and determine initial selection ;;;
EquipmentScreen_SetupReserveMode_and_DetermineInitialSelect:
    PHP
    REP #$30
    LDA.B DP_BG1XScroll : STA.B DP_BG4XScroll
    LDA.B DP_BG1YScroll : STA.B DP_BG4YScroll
    STZ.B DP_BG1XScroll : STZ.B DP_BG1YScroll
    LDA.W MaxReserveEnergy : BEQ .noReserves
    LDA.W ReserveTankMode : BEQ .noReserves
    LDX.W #EquipmentScreenTilemaps_auto
    LDY.W #EquipmentScreenTilemaps_auto>>16
    CMP.W #$0001 : BEQ +
    LDX.W #EquipmentScreenTilemaps_manual
    LDY.W #EquipmentScreenTilemaps_manual>>16

+   STY.B DP_Temp02
    STX.B DP_Temp00
    LDA.W #$0004 : STA.B DP_Temp12
    LDX.W #$0000
    LDY.W #$0000

  .loopTilemap:
    LDA.L PauseMenuMapTilemap+$A8E,X : AND.W #$FC00 : ORA.B [DP_Temp00],Y : STA.L PauseMenuMapTilemap+$A8E,X
    INY #2
    INX #2
    DEC.B DP_Temp12 : BNE .loopTilemap

  .noReserves:
    STZ.W PauseMenu_ItemSelectorAnimationFrame
    LDA.W L_R_HighlightAnimationData_PauseScreenPaletteAnimationDelays : AND.W #$00FF : STA.W PauseMenu_ItemSelectorAnimationTimer
    STZ.W PauseMenu_ReserveTankAnimationFrame
    LDA.W ReserveTank_AnimationData : AND.W #$00FF : STA.W PauseMenu_ReserveTankAnimationTimer
    LDA.W MaxReserveEnergy : BEQ +
    LDA.W #$0000 : STA.W PauseMenu_EquipmentScreenCategoryIndex
    BRA .return

+   LDA.W HyperBeam : BNE .noBeams
    LDA.W CollectedBeams
    LDX.W #$0000

  .loopBeams:
    BIT.W EquipmentScreenData_EquipmentBitmasks_weapons,X : BNE +
    INX #2 : CPX.W #$000A : BMI .loopBeams
    BRA .noBeams

+   TXA : LSR : XBA : ORA.W #$0001 : STA.W PauseMenu_EquipmentScreenCategoryIndex
    BRA .return

  .noBeams:
    LDA.W CollectedItems
    LDX.W #$0000

  .loopSuitMisc:
    BIT.W EquipmentScreenData_EquipmentBitmasks_suitsMisc,X : BNE +
    INX #2 : CPX.W #$000C : BMI .loopSuitMisc
    BRA .noSuitMisc

+   TXA : LSR : XBA : ORA.W #$0002 : STA.W PauseMenu_EquipmentScreenCategoryIndex
    BRA .return

  .noSuitMisc:
    LDX.W #$0000

  .loopNoSuitMisc:
    BIT.W EquipmentScreenData_EquipmentBitmasks_boots,X
    INX #2 : CPX.W #$0006 : BMI .loopNoSuitMisc
    BRA .return

    ; dead code
    TXA : LSR : XBA : ORA.W #$0003 : STA.W PauseMenu_EquipmentScreenCategoryIndex

  .return:
    LDA.W ReserveEnergy : BEQ +
    JSR EquipmentScreen_GlowingArrow_Solid_On
    JSR EquipmentScreen_WriteSamusWireframeTilemap_and_BG1ToVRAM

+   PLP
    RTS


;;; $AC22: Equipment screen - transfer BG1 tilemap ;;;
EquipmentScreen_TransferBG1Tilemap:
    PHP : PHB
    PHK : PLB
    SEP #$30
    LDA.B #$00 : STA.W $2116
    LDA.B #$30 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl $7E3800
    dw $0800
    LDA.B #$02 : STA.W $420B
    STZ.B DP_BG1YScroll : STZ.B DP_BG1YScroll+1
    PLB : PLP
    RTL


;;; $AC4F: Equipment screen - main ;;;
EquipmentScreen_Main:
    PHP
    REP #$30
    LDA.W PauseMenu_EquipmentScreenCategoryIndex : AND.W #$00FF : ASL : TAX
    JSR.W (.pointers,X)
    JSR EquipmentScreen_DrawItemSelector
    JSR EquipmentScreen_DisplayReserveTankAmount_shell
    JSR EquipmentScreen_WriteSamusWireframeTilemap_and_BG1ToVRAM
    PLP
    RTS

  .pointers:
    dw EquipmentScreen_Main_Tanks
    dw EquipmentScreen_Main_Weapons
    dw EquipmentScreen_Main_SuitsMisc
    dw EquipmentScreen_Main_Boots


;;; $AC70: Equipment screen - main - tanks ;;;
EquipmentScreen_Main_Tanks:
    PHP
    REP #$30
    LDA.W PauseMenu_EquipmentScreenCategoryIndex : XBA : AND.W #$00FF : ASL : TAX
    JSR.W (.pointers,X)
    JSR EquipmentScreen_Main_Tanks_DPadResponse
    JSR EquipmentScreen_Main_Tanks_GlowingArrow
    PLP
    RTS

  .pointers:
    dw EquipmentScreen_Main_Tanks_Mode
    dw EquipmentScreen_Main_Tanks_ReserveTank


;;; $AC8B: Equipment screen - main - tanks - d-pad response ;;;
EquipmentScreen_Main_Tanks_DPadResponse:
; If this routine successfully moves the cursor,
; it should really clear PauseMenu_ReserveTankSoundDelayCounter to stop the manual reserve tank refill if one happens to be active
; The consequence of not doing this is that: starting a manual refill, moving the cursor away,
; and moving the cursor back to reserve tank again; causes the refill to automatically continue without needing to press A
    PHP
    REP #$30
    LDA.W PauseMenu_EquipmentScreenCategoryIndex : STA.B DP_Temp12
    LDA.B DP_Controller1New : BIT.W #$0100 : BEQ .notRight
    BIT.W #$0400 : BNE .moveToBoots
    LDX.W #$0000
    JSR EquipmentScreen_MoveLowerOnSuitsMisc
    CMP.W #$FFFF : BNE .exit

  .moveToBoots:
    LDX.W #$0000
    JSR EquipmentScreen_MoveLowerOnBoots

  .exit:
    PLP
    RTS

  .notRight:
    BIT.W #$0800 : BNE .up
    BIT.W #$0400 : BEQ .exit
    LDA.W PauseMenu_EquipmentScreenCategoryIndex : AND.W #$FF00 : CMP.W #$0100 : BEQ .moveToBeams
    LDA.W ReserveTankMode : CMP.W #$0001 : BEQ .moveToBeams
    LDA.W PauseMenu_EquipmentScreenCategoryIndex : CLC : ADC.W #$0100 : STA.W PauseMenu_EquipmentScreenCategoryIndex
    LDA.W ReserveEnergy : BEQ .moveToBeams
    LDA.W #$0037
    JSL QueueSound_Lib1_Max6
    BRA .return

  .moveToBeams:
    LDX.W #$0000
    JSR EquipmentScreen_MoveLowerOnBeams
    BRA .return

  .up:
    LDA.W PauseMenu_EquipmentScreenCategoryIndex : AND.W #$FF00 : BEQ .return
    LDA.W #$0037
    JSL QueueSound_Lib1_Max6
    LDA.W PauseMenu_EquipmentScreenCategoryIndex : SEC : SBC.W #$0100 : STA.W PauseMenu_EquipmentScreenCategoryIndex

  .return:
    PLP
    RTS


;;; $AD0A: Equipment screen - main - tanks - glowing arrow ;;;
EquipmentScreen_Main_Tanks_GlowingArrow:
    PHP
    REP #$30
    LDA.W PauseMenu_EquipmentScreenCategoryIndex : BIT.W #$00FF : BNE .solidOff
    XBA : AND.W #$00FF : ASL : TAX
    JSR.W (.pointers,X)
    PLP
    RTS

  .solidOff:
    JSR EquipmentScreen_GlowingArrow_Solid_Off
    PLP
    RTS

  .pointers:
    dw EquipmentScreen_GlowingArrow_Animated
    dw EquipmentScreen_GlowingArrow_Solid_On


;;; $AD29: Equipment screen - glowing arrow - animated ;;;
EquipmentScreen_GlowingArrow_Animated:
    LDA.W ReserveTankMode : CMP.W #$0001 : BNE .disableGlow
    LDA.W NMI_8bitFrameCounter : AND.W #$001F : ASL : TAX
    LDA.W .palette6,X : STA.L Palettes_BG12P6+$C
    LDA.W .paletteB,X : STA.L Palettes_BG12P6+$16
    JSR EquipmentScreen_Enable_EnergyArrowGlow
    RTS

  .disableGlow:
    LDA.W #$039E : STA.L Palettes_BG12P6+$16
    LDA.W #$0156 : STA.L Palettes_BG12P6+$C
    JSR EquipmentScreen_Disable_EnergyArrowGlow
    RTS

  .palette6:
    dw $039E,$077D,$0B5C,$0F5B,$133A,$171A,$1F19,$22F8,$26D7,$2AD6,$2EB6,$3695,$3A94,$3E73,$4253,$4A52
    dw $4A52,$4253,$3E73,$3A94,$3695,$2EB6,$2AD6,$26D7,$22F8,$1F19,$171A,$133A,$0F5B,$0B5C,$077D,$039E

  .paletteB:
    dw $0156,$0155,$0554,$0954,$0D53,$0D52,$1152,$1551,$1970,$1D70,$1D6F,$216E,$256E,$296D,$296C,$318C
    dw $318C,$296C,$296D,$256E,$216E,$1D6F,$1D70,$1970,$1551,$1152,$0D52,$0D53,$0954,$0554,$0155,$0156


;;; $ADDD: Equipment screen - glowing arrow - solid - on ;;;
EquipmentScreen_GlowingArrow_Solid_On:
    LDA.W #$039E : STA.L Palettes_BG12P6+$16
    LDA.W #$0156 : STA.L Palettes_BG12P6+$C
    JSR EquipmentScreen_Enable_EnergyArrowGlow
    RTS


;;; $ADEF: Equipment screen - glowing arrow - solid - off ;;;
EquipmentScreen_GlowingArrow_Solid_Off:
    LDA.W #$039E : STA.L Palettes_BG12P6+$16
    LDA.W #$0156 : STA.L Palettes_BG12P6+$C
    JSR EquipmentScreen_Disable_EnergyArrowGlow
    RTS


;;; $AE01: Equipment screen - enable energy arrow glow ;;;
EquipmentScreen_Enable_EnergyArrowGlow:
    PHP
    REP #$30
    PHP
    REP #$30
    LDY.W #$0010
    LDX.W #$0000

  .loopVertical:
    LDA.L EquipmentScreenBG1Tilemap+$102,X : AND.W #$E3FF : ORA.W #$1800 : STA.L EquipmentScreenBG1Tilemap+$102,X
    TXA : CLC : ADC.W #$0040 : TAX
    DEY #2 : BNE .loopVertical
    PLP : PHP ; >.<
    REP #$30
    LDY.W #$0004
    LDX.W #$0000

  .loopHorizontal:
    LDA.L EquipmentScreenBG1Tilemap+$302,X : AND.W #$E3FF : ORA.W #$1800 : STA.L EquipmentScreenBG1Tilemap+$302,X
    INX #2
    DEY #2 : BNE .loopHorizontal
    PLP : PLP
    RTS


;;; $AE46: Equipment screen - disable energy arrow glow ;;;
EquipmentScreen_Disable_EnergyArrowGlow:
    PHP
    REP #$30
    PHP
    REP #$30
    LDY.W #$0010
    LDX.W #$0000

  .loopVertical:
    LDA.L EquipmentScreenBG1Tilemap+$102,X : AND.W #$E3FF : ORA.W #$1C00 : STA.L EquipmentScreenBG1Tilemap+$102,X
    TXA : CLC : ADC.W #$0040 : TAX
    DEY #2 : BNE .loopVertical
    PLP : PHP
    REP #$30
    LDY.W #$0004
    LDX.W #$0000

  .loopHorizontal:
    LDA.L EquipmentScreenBG1Tilemap+$302,X : AND.W #$E3FF : ORA.W #$1C00 : STA.L EquipmentScreenBG1Tilemap+$302,X
    INX #2
    DEY #2 : BNE .loopHorizontal
    PLP : PLP
    RTS


;;; $AE8B: Equipment screen - main - tanks - mode ;;;
EquipmentScreen_Main_Tanks_Mode:
    PHP
    REP #$30
    LDA.B DP_Controller1New : BIT.W #$0080 : BEQ .return
    LDA.W MaxReserveEnergy : BEQ .return
    LDA.W #$0037
    JSL QueueSound_Lib1_Max6
    LDA.W ReserveTankMode : CMP.W #$0001 : BNE .manual
    LDA.W #$0002 : STA.W ReserveTankMode
    JSR EquipmentScreen_ClearHUDReserveAUTOTilemap
    PHP
    REP #$30
    LDY.W #$0008
    LDX.W #$0000

  .loopAuto:
    LDA.L EquipmentScreenBG1Tilemap+$28E,X : AND.W #$FC00 : ORA.L EquipmentScreenTilemaps_manual,X : STA.L EquipmentScreenBG1Tilemap+$28E,X
    INX #2
    DEY #2 : BNE .loopAuto
    PLP
    BRA .return

  .manual:
    LDA.W #$0001 : STA.W ReserveTankMode
    JSR EquipmentScreen_SetHUDReserveAUTOTilemap
    PHP
    REP #$30
    LDY.W #$0008
    LDX.W #$0000

  .loopManual:
    LDA.L EquipmentScreenBG1Tilemap+$28E,X : AND.W #$FC00 : ORA.L EquipmentScreenTilemaps_auto,X : STA.L EquipmentScreenBG1Tilemap+$28E,X
    INX #2
    DEY #2 : BNE .loopManual
    PLP

  .return:
    PLP
    RTS


;;; $AEFD: Equipment screen - set HUD reserve AUTO tilemap ;;;
EquipmentScreen_SetHUDReserveAUTOTilemap:
; BUG: DB isn't set to $80 (where $998B/$9997 are HUD tilemaps),
; so this loads garbage that is immediately overwritten by the HUD update routine ($80:9B44).
; In short, this routine is useless
    LDY.W #Tilemap_HUD_autoReserve
    LDA.W ReserveEnergy : BNE +
    LDY.W #Tilemap_HUD_emptyAutoReserve

+   LDA.W $0000,Y : STA.L HUDTilemap_Row1AutoReserve
    LDA.W $0002,Y : STA.L HUDTilemap_Row1AutoReserve+2
    LDA.W $0004,Y : STA.L HUDTilemap_Row2AutoReserve
    LDA.W $0006,Y : STA.L HUDTilemap_Row2AutoReserve+2
    LDA.W $0008,Y : STA.L HUDTilemap_Row3AutoReserve
    LDA.W $000A,Y : STA.L HUDTilemap_Row3AutoReserve+2
    RTS


;;; $AF33: Equipment screen - clear HUD reserve AUTO tilemap ;;;
EquipmentScreen_ClearHUDReserveAUTOTilemap:
    LDA.W #$2C0F
    STA.L HUDTilemap_Row1AutoReserve : STA.L HUDTilemap_Row1AutoReserve+2
    STA.L HUDTilemap_Row2AutoReserve : STA.L HUDTilemap_Row2AutoReserve+2
    STA.L HUDTilemap_Row3AutoReserve : STA.L HUDTilemap_Row3AutoReserve+2
    RTS


;;; $AF4F: Equipment screen - main - tanks - reserve tank ;;;
EquipmentScreen_Main_Tanks_ReserveTank:
; This routine contains the code the exhausts reserve health if Samus reaches max health
; The section at .emptyReserve is executed when reserve health <= 0,
; it sets reserve health to zero just in case her reserve health became negative
; (which is a reasonable thing to do if you don't assume that [$BF04] is 1)
; The thing is, when Samus' health is fully replenished, the branch at $AF96 is taken to this same code,
; which IMO is a mistake, I think that branch should go $AFB3 instead, merely stopping the refill
    PHP
    REP #$30
    LDA.W PauseMenu_ReserveTankSoundDelayCounter : BNE .soundTimer
    LDA.B DP_Controller1New : BIT.W #$0080 : BEQ .return
    LDA.W ReserveEnergy : CLC : ADC.W #$0007 : AND.W #$FFF8 : STA.W PauseMenu_ReserveTankSoundDelayCounter

  .soundTimer:
    LDA.W PauseMenu_ReserveTankSoundDelayCounter : DEC : STA.W PauseMenu_ReserveTankSoundDelayCounter
    AND.W #$0007 : CMP.W #$0007 : BNE .incrementEnergy
    LDA.W #$002D
    JSL QueueSound_Lib3_Max6

  .incrementEnergy:
    LDA.W Energy : CLC : ADC.W ReserveTank_TransferEnergyPerFrame : STA.W Energy
    CMP.W MaxEnergy : BMI .decrementReserve
    LDA.W MaxEnergy : STA.W Energy
    BRA .emptyReserve

  .decrementReserve:
    LDA.W ReserveEnergy : SEC : SBC.W ReserveTank_TransferEnergyPerFrame : STA.W ReserveEnergy : BEQ .emptyReserve
    BPL .return
    LDA.W Energy : CLC : ADC.W ReserveEnergy : STA.W Energy

  .emptyReserve:
    STZ.W ReserveEnergy
    STZ.W PauseMenu_ReserveTankSoundDelayCounter
    JSR EquipmentScreen_Disable_EnergyArrowGlow
    STZ.W PauseMenu_EquipmentScreenCategoryIndex

  .return:
    PLP
    RTS


;;; $AFBE: Equipment screen - main - weapons ;;;
EquipmentScreen_Main_Weapons:
    PHP
    REP #$30
    JSR EquipmentScreen_Main_Weapons_MoveResponse
    LDA.W EquippedBeams : STA.B DP_Temp24
    LDA.W CollectedBeams : BEQ .return
    LDA.W #$000A : STA.B DP_Temp18
    JSR EquipmentScreen_Main_ButtonResponse
    JSR EquipmentScreen_Main_Weapons_PlasmaSpazerCheck

  .return:
    PLP
    RTS


;;; $AFDB: Equipment screen - main - weapons - move response ;;;
EquipmentScreen_Main_Weapons_MoveResponse:
    PHP
    REP #$30
    LDA.W PauseMenu_EquipmentScreenCategoryIndex : STA.B DP_Temp12
    LDA.B DP_Controller1New : BIT.W #$0100 : BEQ .rightEnd
    BIT.W #$0800 : BNE .top
    LDX.W #$0004
    JSR EquipmentScreen_MoveLowerOnSuitsMisc
    CMP.W #$0000 : BEQ .return
    LDX.W #$0000
    JSR EquipmentScreen_MoveLowerOnBoots
    BRA .return

  .top:
    LDX.W #$0000
    JSR EquipmentScreen_MoveLowerOnSuitsMisc
    BRA .return

  .rightEnd:
    BIT.W #$0400 : BNE .down
    BIT.W #$0800 : BEQ .return
    LDA.W PauseMenu_EquipmentScreenCategoryIndex : AND.W #$FF00 : BEQ .moveToReserve
    LDA.W PauseMenu_EquipmentScreenCategoryIndex : SEC : SBC.W #$0100 : STA.W PauseMenu_EquipmentScreenCategoryIndex
    XBA : AND.W #$00FF : ASL : TAX
    JSR EquipmentScreen_MoveHigherOnBeams
    CMP.W #$FFFF : BNE .return

  .moveToReserve:
    LDX.W #$0000
    JSR EquipmentScreen_MoveToReserveTanks
    CMP.W #$0000 : BNE .return
    LDA.B DP_Temp12 : STA.W PauseMenu_EquipmentScreenCategoryIndex
    BRA .return

  .down:
    LDA.W HyperBeam : BNE .return
    LDA.W PauseMenu_EquipmentScreenCategoryIndex : CMP.W #$0401 : BEQ .return
    LDA.W PauseMenu_EquipmentScreenCategoryIndex : CLC : ADC.W #$0100 : STA.W PauseMenu_EquipmentScreenCategoryIndex
    XBA : AND.W #$00FF : ASL : TAX
    JSR EquipmentScreen_MoveLowerOnBeams

  .return:
    PLP
    RTS


;;; $B068: Equipment screen - main - weapons - plasma-spazer check ;;;
EquipmentScreen_Main_Weapons_PlasmaSpazerCheck:
;; Parameters:
;;     $24: Previously equipped beams
    PHP
    REP #$30
    LDA.B DP_Temp24 : EOR.W #$FFFF : AND.W EquippedBeams : BIT.W #$0004 : BNE .spazerToggled
    BIT.W #$0008 : BEQ .return
    LDA.B DP_Temp24 : BIT.W #$0008 : BNE .return
    LDA.W EquippedBeams : BIT.W #$0004 : BEQ .return
    AND.W #$FFFB : STA.W EquippedBeams
    LDA.W EquipmentScreenData_RAMTilemapOffsets_weapons_spazer : STA.B DP_Temp00
    BRA .merge

  .spazerToggled:
    LDA.B DP_Temp24 : BIT.W #$0004 : BNE .return
    LDA.W EquippedBeams : BIT.W #$0008 : BEQ .return
    AND.W #$FFF7 : STA.W EquippedBeams
    LDA.W EquipmentScreenData_RAMTilemapOffsets_weapons_plasma : STA.B DP_Temp00

  .merge:
    LDA.W #$0C00 : STA.B DP_Temp12
    LDA.W #$000A : STA.B DP_Temp16
    JSR Copy_Bytes_of_Palette_from_7E_to_12

  .return:
    PLP
    RTS


;;; $B0C2: Equipment screen - main - suit/misc. ;;;
EquipmentScreen_Main_SuitsMisc:
    PHP
    REP #$30
    JSR EquipmentScreen_SuitsMisc_MoveResponse
    LDA.W #$0012 : STA.B DP_Temp18
    JSR EquipmentScreen_Main_ButtonResponse
    PLP
    RTS


;;; $B0D2: Equipment screen - suit/misc. - move response ;;;
EquipmentScreen_SuitsMisc_MoveResponse:
    PHP
    REP #$30
    LDA.W PauseMenu_EquipmentScreenCategoryIndex : STA.B DP_Temp12
    LDA.B DP_Controller1New : BIT.W #$0200 : BEQ .leftEnd
    BIT.W #$0400 : BNE .topOfBeams
    LDX.W #$0000
    JSR EquipmentScreen_MoveToReserveTanks
    CMP.W #$0000 : BNE .return
    LDA.B DP_Temp12 : STA.W PauseMenu_EquipmentScreenCategoryIndex

  .topOfBeams:
    LDX.W #$0000
    JSR EquipmentScreen_MoveLowerOnBeams
    BRA .return

  .leftEnd:
    BIT.W #$0800 : BNE .up
    BIT.W #$0400 : BEQ .return
    LDA.W PauseMenu_EquipmentScreenCategoryIndex : AND.W #$FF00 : CMP.W #$0500 : BEQ .moveToBoots
    LDA.W PauseMenu_EquipmentScreenCategoryIndex : CLC : ADC.W #$0100 : STA.W PauseMenu_EquipmentScreenCategoryIndex
    XBA : AND.W #$00FF : ASL : TAX
    JSR EquipmentScreen_MoveLowerOnSuitsMisc
    CMP.W #$FFFF : BNE .return

  .moveToBoots:
    LDX.W #$0000
    JSR EquipmentScreen_MoveLowerOnBoots
    BRA .return

  .up:
    LDA.W PauseMenu_EquipmentScreenCategoryIndex : AND.W #$FF00 : BEQ .return
    LDA.W PauseMenu_EquipmentScreenCategoryIndex : SEC : SBC.W #$0100 : STA.W PauseMenu_EquipmentScreenCategoryIndex
    XBA : AND.W #$00FF : ASL : TAX
    JSR EquipmentScreen_MoveHigherOnSuitsMisc

  .return:
    PLP
    RTS


;;; $B150: Equipment screen - main - boots ;;;
EquipmentScreen_Main_Boots:
    PHP
    REP #$30
    JSR EquipmentScreen_Main_Boots_MoveResponse
    LDA.W #$0012 : STA.B DP_Temp18
    JSR EquipmentScreen_Main_ButtonResponse
    PLP
    RTS


;;; $B160: Equipment screen - main - boots - move response ;;;
EquipmentScreen_Main_Boots_MoveResponse:
    PHP
    REP #$30
    LDA.W PauseMenu_EquipmentScreenCategoryIndex : STA.B DP_Temp12
    LDA.B DP_Controller1New : BIT.W #$0200 : BEQ .leftEnd
    BIT.W #$0800 : BNE .moveToReserve
    LDX.W #$0008
    JSR EquipmentScreen_MoveHigherOnBeams
    CMP.W #$FFFF : BNE .return

  .moveToReserve:
    LDX.W #$0000
    JSR EquipmentScreen_MoveToReserveTanks
    CMP.W #$0000 : BNE .return
    LDA.B DP_Temp12 : STA.W PauseMenu_EquipmentScreenCategoryIndex
    BRA .return

  .leftEnd:
    BIT.W #$0400 : BNE .down
    BIT.W #$0800 : BEQ .return
    LDA.W PauseMenu_EquipmentScreenCategoryIndex : AND.W #$FF00 : BEQ .moveToSuitsMisc
    LDA.W PauseMenu_EquipmentScreenCategoryIndex : SEC : SBC.W #$0100 : STA.W PauseMenu_EquipmentScreenCategoryIndex
    XBA : AND.W #$00FF : ASL : TAX
    JSR EquipmentScreen_MoveHigherOnBoots
    CMP.W #$FFFF : BNE .return

  .moveToSuitsMisc:
    LDX.W #$000A
    JSR EquipmentScreen_MoveHigherOnSuitsMisc
    BRA .return

  .down:
    LDA.W PauseMenu_EquipmentScreenCategoryIndex : CMP.W #$0203 : BEQ .return
    LDA.W PauseMenu_EquipmentScreenCategoryIndex : CLC : ADC.W #$0100 : STA.W PauseMenu_EquipmentScreenCategoryIndex
    XBA : AND.W #$00FF : ASL : TAX
    JSR EquipmentScreen_MoveLowerOnBoots

  .return:
    PLP
    RTS


;;; $B1E0: Equipment screen - write Samus wireframe tilemap and queue transfer of BG1 to VRAM ;;;
EquipmentScreen_WriteSamusWireframeTilemap_and_BG1ToVRAM:
    PHP
    REP #$30
    JSR EquipmentScreen_WriteSamusWireframeTilemap
    LDX.W VRAMWriteStack
    LDA.W #$0500 : STA.B VRAMWrite.size,X
    INX #2
    LDA.W #EquipmentScreenBG1Tilemap+$100 : STA.B VRAMWrite.size,X
    INX #2
    SEP #$20
    LDA.B #EquipmentScreenBG1Tilemap>>16 : STA.B VRAMWrite.size,X
    REP #$20
    INX
    LDA.W #$3080 : STA.B VRAMWrite.size,X
    INX #2 : STX.W VRAMWriteStack
    PLP
    RTS


;;; $B20C: Equipment screen - write Samus wireframe tilemap ;;;
EquipmentScreen_WriteSamusWireframeTilemap:
    PHP
    REP #$30
    LDA.W EquippedItems : AND.W #$0101
    LDX.W #$0000

  .loopSuit:
    CMP.W .bitmaps,X : BEQ +
    INX #2
    BRA .loopSuit

+   LDA.W .addresses,X : STA.B DP_Temp00
    LDA.W #Samus_Wireframe_Tilemaps>>16 : STA.B DP_Temp02
    LDA.W #$0011 : STA.B DP_Temp14
    LDY.W #$0000
    LDX.W #$01D8

  .loopRow:
    PHX
    LDA.W #$0008 : STA.B DP_Temp12

  .loop:
    LDA.B [DP_Temp00],Y : STA.L EquipmentScreenBG1Tilemap,X
    INX #2
    INY #2
    DEC.B DP_Temp12 : BNE .loop
    PLX : TXA : CLC : ADC.W #$0040 : TAX
    DEC.B DP_Temp14 : BNE .loopRow
    PLP
    RTS

  .bitmaps:
;        _____________________ Power suit
;       |      _______________ Hi-jump boots
;       |     |      _________ Varia suit
;       |     |     |      ___ Hi-jump boots + varia suit
;       |     |     |     |
    dw $0000,$0100,$0001,$0101

  .addresses:
    dw Samus_Wireframe_Tilemaps_powerSuit
    dw Samus_Wireframe_Tilemaps_hiJumpBoots
    dw Samus_Wireframe_Tilemaps_variaSuit
    dw Samus_Wireframe_Tilemaps_hiJumpBootsVariaSuit


;;; $B267: Equipment screen - draw item selector ;;;
EquipmentScreen_DrawItemSelector:
    PHP
    REP #$30
    LDA.W CollectedBeams : ORA.W CollectedItems : ORA.W MaxReserveEnergy : BEQ .return
    LDA.W PauseMenu_EquipmentScreenCategoryIndex : AND.W #$00FF : ASL : TAX
    LDA.W EquipmentScreen_ItemSelectorPositions_pointers,X : STA.B DP_Temp12
    LDA.W PauseMenu_EquipmentScreenCategoryIndex : XBA
    AND.W #$00FF : ASL #2 : CLC : ADC.B DP_Temp12 : TAY
    LDA.W $0000,Y : TAX
    DEX
    INY #2
    LDA.W $0000,Y : TAY
    LDA.W #$0003
    JSR Draw_PauseScreen_SpriteAnimation

  .return:
    PLP
    RTS


;;; $B2A2: Equipment screen - display reserve tank amount ;;;
EquipmentScreen_DisplayReserveTankAmount_shell:
    PHP
    REP #$30
    JSR EquipmentScreen_DisplayReserveTankAmount
    PLP
    RTS


;;; $B2AA: Equipment screen - display reserve tank amount ;;;
EquipmentScreen_DisplayReserveTankAmount:
    PHP
    REP #$30
    STZ.B DP_Temp03
    JSR EquipmentScreen_Main_DisplayReserves_PaletteSetup
    STZ.B DP_Temp34
    LDA.W MaxReserveEnergy : BNE +
    PLP
    RTS

+   STA.W $4204
    SEP #$20
    LDA.B #$64 : STA.W $4206
    REP #$20
    NOP #7
    LDA.W $4214 : STA.B DP_Temp2C
    LDA.W ReserveEnergy : STA.W $4204
    SEP #$20
    LDA.B #$64 : STA.W $4206
    REP #$20
    NOP #7
    LDA.W $4216 : STA.B DP_Temp32
    LDA.W $4214 : STA.B DP_Temp2A : STA.B DP_Temp30 : STA.B DP_Temp2E : BEQ .empty
    LDY.W #$0000

  .loopFullTanks:
    PHY
    LDA.W EquipmentScreen_ReserveTank_Xpositions,Y : TAX
    LDY.W EquipmentScreen_ReserveTank_Yposition : DEY
    LDA.W #$001B
    JSL AddSpritemapFrom_82C569_TableToOAM
    PLY : INY #2
    DEC.B DP_Temp2E : BNE .loopFullTanks
    STY.B DP_Temp34

  .empty:
    LDA.W $4216 : BEQ .loopEmptyTanks
    STA.W $4204
    SEP #$20
    LDA.B #$0E : STA.W $4206
    REP #$20
    NOP #7
    LDA.W $4214 : ASL : TAX
    CMP.W #$0007 : BPL +
    LDA.W $4216 : BEQ +
    LDA.W NMI_8bitFrameCounter : BIT.W #$0004 : BNE +
    INX #2

+   LDA.W ReserveEnergy : CMP.W #$0064 : BMI +
    TXA : CLC : ADC.W #$0010 : TAX

+   LDA.W .spritemapIDs,X : PHA
    LDX.B DP_Temp34
    LDA.W EquipmentScreen_ReserveTank_Xpositions,X : TAX
    LDY.W EquipmentScreen_ReserveTank_Yposition : DEY
    PLA
    JSL AddSpritemapFrom_82C569_TableToOAM
    INC.B DP_Temp30
    INC.B DP_Temp34 : INC.B DP_Temp34

  .loopEmptyTanks:
    LDX.B DP_Temp34
    LDA.B DP_Temp30 : CMP.B DP_Temp2C : BPL +
    LDA.W EquipmentScreen_ReserveTank_Xpositions,X : TAX
    LDY.W EquipmentScreen_ReserveTank_Yposition : DEY
    LDA.W #$0020
    JSL AddSpritemapFrom_82C569_TableToOAM
    INC.B DP_Temp34 : INC.B DP_Temp34
    INC.B DP_Temp30
    BRA .loopEmptyTanks

+   LDX.B DP_Temp34
    LDA.W EquipmentScreen_ReserveTank_Xpositions,X : TAX
    LDY.W EquipmentScreen_ReserveTank_Yposition : DEY
    LDA.W #$001F
    JSL AddSpritemapFrom_82C569_TableToOAM
    SEP #$20
    LDA.B DP_Temp32 : STA.W $4204
    LDA.B DP_Temp33 : STA.W $4205
    LDA.B #$0A : STA.W $4206
    REP #$20
    NOP #7
    LDA.W $4216 : CLC : ADC.W #$0804 : STA.L EquipmentScreenBG1Tilemap+$314
    LDA.W $4214 : CLC : ADC.W #$0804 : STA.L EquipmentScreenBG1Tilemap+$312
    LDA.B DP_Temp2A : CLC : ADC.W #$0804 : STA.L EquipmentScreenBG1Tilemap+$310
    PLP
    RTS

  .spritemapIDs:
; Partial reserve tank spritemap IDs (for $82:C569 table)
    dw $0020,$0021,$0022,$0023,$0024,$0025,$0026,$0027 ; [Samus reserve health] < 100
    dw $0020,$0021,$0022,$0023,$0024,$0025,$0026,$0027 ; [Samus reserve health] >= 100


;;; $B3F9: Equipment screen - main - display reserves - palette setup ;;;
EquipmentScreen_Main_DisplayReserves_PaletteSetup:
; Sets $03 in preparation for a later call to $81:891F. Looks like the animation was unfinished/removed, so this always sets palette 3
    PHP
    REP #$30
    LDA.W #$0600 : STA.B DP_Temp03
    LDA.W ReserveEnergy : BEQ .return
    DEC.W PauseMenu_ReserveTankAnimationTimer : BEQ .incrementAnimationFrame
    BPL .positive

  .incrementAnimationFrame:
    LDA.W PauseMenu_ReserveTankAnimationFrame : INC : STA.W PauseMenu_ReserveTankAnimationFrame
    ASL : TAX
    LDA.W ReserveTank_AnimationData,X : AND.W #$00FF : CMP.W #$00FF : BNE .animationTimer
    STZ.W PauseMenu_ReserveTankAnimationFrame
    LDA.W ReserveTank_AnimationData : AND.W #$00FF

  .animationTimer:
    STA.W PauseMenu_ReserveTankAnimationTimer

  .positive:
    LDA.W PauseMenu_ReserveTankAnimationFrame : ASL : INC : TAX
    LDA.W #$0003 : ASL : TAX
    LDA.W SpritePalette_IndexValues,X : STA.B DP_Temp03

  .return:
    PLP
    RTS


;;; $B43F: Equipment screen - move to reserve tanks ;;;
EquipmentScreen_MoveToReserveTanks:
;; Returns:
;;     A: 1 if moved cursor, 0 otherwise
    PHP
    REP #$30
    LDA.W MaxReserveEnergy : BEQ .return
    STZ.W PauseMenu_EquipmentScreenCategoryIndex
    LDA.W #$0037
    JSL QueueSound_Lib1_Max6
    LDA.W #$0001

  .return:
    PLP
    RTS


;;; $B456: Equipment screen - move lower on beams ;;;
EquipmentScreen_MoveLowerOnBeams:
;; Parameters:
;;     X: Equipment screen item index to start search from
;;     $12: Equipment screen indices
    PHP
    REP #$30
    LDA.W HyperBeam : BNE .cancel

  .loop:
    LDA.W CollectedBeams : BIT.W EquipmentScreenData_EquipmentBitmasks_weapons,X : BNE .found
    INX #2 : CPX.W #$000A : BMI .loop

  .cancel:
    LDA.B DP_Temp12 : STA.W PauseMenu_EquipmentScreenCategoryIndex
    BRA .return

  .found:
    TXA : LSR : XBA : AND.W #$FF00 : ORA.W #$0001 : STA.W PauseMenu_EquipmentScreenCategoryIndex
    LDA.W #$0037
    JSL QueueSound_Lib1_Max6

  .return:
    PLP
    RTS


;;; $B489: Equipment screen - move higher on beams ;;;
EquipmentScreen_MoveHigherOnBeams:
;; Parameters:
;;     X: Equipment screen item index to start search from
;; Returns:
;;     A: FFFFh if not moved cursor
    PHP
    REP #$30
    LDA.W HyperBeam : BNE .cancel

  .loop:
    LDA.W CollectedBeams : BIT.W EquipmentScreenData_EquipmentBitmasks_weapons,X : BNE .found
    DEX #2 : BPL .loop

  .cancel:
    LDA.W #$FFFF : BRA .return

  .found:
    LDA.W #$0037
    JSL QueueSound_Lib1_Max6
    TXA : LSR : XBA : AND.W #$FF00 : ORA.W #$0001 : STA.W PauseMenu_EquipmentScreenCategoryIndex

  .return:
    PLP
    RTS


;;; $B4B7: Equipment screen - move lower on suits/misc. ;;;
EquipmentScreen_MoveLowerOnSuitsMisc:
;; Parameters:
;;     X: Equipment screen item index to start search from
;; Returns:
;;     A: 0 if moved cursor, FFFFh otherwise

; Bug: $B4C4 should be CPX #$000C. Can't access Screw Attack without Spring Ball or Boots
    PHP
    REP #$30

  .loop:
    LDA.W CollectedItems : BIT.W EquipmentScreenData_EquipmentBitmasks_suitsMisc,X : BNE +
    ; Bug: should be CPX #$000C. Can't access Screw Attack without Spring Ball or Boots
    INX #2 : CPX.W #$000A : BMI .loop
    LDA.W #$FFFF
    BRA .return

+   LDA.W #$0037
    JSL QueueSound_Lib1_Max6
    TXA : LSR : XBA : AND.W #$FF00 : ORA.W #$0002 : STA.W PauseMenu_EquipmentScreenCategoryIndex
    LDA.W #$0000

  .return:
    PLP
    RTS


;;; $B4E6: Equipment screen - move higher on suits/misc. ;;;
EquipmentScreen_MoveHigherOnSuitsMisc:
;; Parameters:
;;     X: Equipment screen item index to start search from
;;     $12: Equipment screen indices
    PHP
    REP #$30

  .loop:
    LDA.W CollectedItems : BIT.W EquipmentScreenData_EquipmentBitmasks_suitsMisc,X : BNE +
    DEX #2 : BPL .loop
    LDA.B DP_Temp12 : STA.W PauseMenu_EquipmentScreenCategoryIndex
    BRA .return

+   LDA.W #$0037
    JSL QueueSound_Lib1_Max6
    TXA : LSR : XBA
    AND.W #$FF00 : ORA.W #$0002 : STA.W PauseMenu_EquipmentScreenCategoryIndex

  .return:
    PLP
    RTS


;;; $B511: Equipment screen - move lower on boots ;;;
EquipmentScreen_MoveLowerOnBoots:
;; Parameters:
;;     X: Equipment screen item index to start search from
;;     $12: Equipment screen indices
    PHP
    REP #$30

  .loop:
    LDA.W CollectedItems : BIT.W EquipmentScreenData_EquipmentBitmasks_boots,X : BNE +
    INX #2 : CPX.W #$0006 : BMI .loop
    LDA.B DP_Temp12 : STA.W PauseMenu_EquipmentScreenCategoryIndex
    BRA .return

+   LDA.W #$0037
    JSL QueueSound_Lib1_Max6
    TXA : LSR : XBA
    AND.W #$FF00 : ORA.W #$0003 : STA.W PauseMenu_EquipmentScreenCategoryIndex

  .return:
    PLP
    RTS


;;; $B53F: Equipment screen - move higher on boots ;;;
EquipmentScreen_MoveHigherOnBoots:
;; Parameters:
;;     X: Equipment screen item index to start search from
;; Returns:
;;     A: FFFFh if not moved cursor
    PHP
    REP #$30

  .loop:
    LDA.W CollectedItems : BIT.W EquipmentScreenData_EquipmentBitmasks_boots,X : BNE +
    DEX #2 : BPL .loop
    LDA.W #$FFFF
    BRA .return

+   LDA.W #$0037
    JSL QueueSound_Lib1_Max6
    TXA : LSR : XBA
    AND.W #$FF00 : ORA.W #$0003 : STA.W PauseMenu_EquipmentScreenCategoryIndex

  .return:
    PLP
    RTS


;;; $B568: Equipment screen - main - button response ;;;
EquipmentScreen_Main_ButtonResponse:
;; Parameters:
;;     $18: Tilemap size in bytes
    PHP
    REP #$30
    LDA.B DP_Controller1New : BIT.W #$0080 : BNE +
    PLP
    RTS

+   LDA.W #$0038
    JSL QueueSound_Lib1_Max6
    LDA.W PauseMenu_EquipmentScreenCategoryIndex : AND.W #$00FF : ASL : TAX
    STA.B DP_Temp1A
    LDA.W PauseMenu_EquipmentScreenCategoryIndex : XBA : AND.W #$00FF : ASL : STA.B DP_Temp12
    LDA.W EquipmentScreenDataPointers_tilemapOffsets,X : CLC : ADC.B DP_Temp12 : TAY
    LDA.W $0000,Y : STA.B DP_Temp00
    LDA.W EquipmentScreenDataPointers_equipmentBitmasks,X : TAY
    LDA.W EquipmentScreenDataPointers_listsEquipmentBitmasks,X : CLC : ADC.B DP_Temp12 : TAX
    LDA.W $0000,Y : BIT.W $0000,X : BNE +
    ORA.W $0000,X : STA.W $0000,Y
    LDA.B DP_Temp18 : STA.B DP_Temp16
    LDX.B DP_Temp1A
    LDA.W EquipmentScreenDataPointers_listsPointsToEquipmentTilemaps,X : CLC : ADC.B DP_Temp12 : TAY
    LDA.W $0000,Y : TAX
    JSR Copy_Bytes_from_X_to_7ERAM
    BRA .return

+   LDA.W $0000,X : EOR.W #$FFFF : STA.B DP_Temp12
    LDA.W $0000,Y : AND.B DP_Temp12 : STA.W $0000,Y
    LDA.W #$0C00 : STA.B DP_Temp12
    LDA.B DP_Temp18 : STA.B DP_Temp16
    JSR Copy_Bytes_of_Palette_from_7E_to_12

  .return:
    PLP
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $B5E8: Unused. Convert [A] to three decimal digits ;;;
UNUSED_ConvertAToThreeDecimalDigits:
;; Parameters:
;;     A: Value
;; Returns:
;;     $12: Units digit
;;     $14: Tens digit
;;     $16: Hundreds digit

; Does slow division... please avoid
    PHP
    REP #$30
    STA.B DP_Temp18 : STZ.B DP_Temp12
    STZ.B DP_Temp14 : STZ.B DP_Temp16

-   LDA.B DP_Temp18 : SEC : SBC.W #$0064 : STA.B DP_Temp18 : BMI +
    INC.B DP_Temp16
    BRA -

+   CLC : ADC.W #$0064 : STA.B DP_Temp18

-   LDA.B DP_Temp18 : SEC : SBC.W #$000A : STA.B DP_Temp18 : BMI +
    INC.B DP_Temp14
    BRA -

+   CLC : ADC.W #$000A : STA.B DP_Temp18

-   LDA.B DP_Temp18 : SEC : SBC.W #$0001 : STA.B DP_Temp18 : BMI .return
    INC.B DP_Temp12
    BRA -

  .return:
    PLP
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $B62B: Draw pause menu during fade in ;;;
Draw_PauseMenu_during_FadeIn:
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W PauseMenu_ButtonLabelMode ; >.<
    LDA.W PauseMenu_MenuIndex : BEQ .mapScreen
    JSR EquipmentScreen_DrawItemSelector
    JSR EquipmentScreen_DisplayReserveTankAmount_shell
    PLB : PLP
    RTL

  .mapScreen:
    JSR MapScreen_DrawSamusPositionIndicator
    JSL Draw_Map_Icons
    JSL Display_Map_Elevator_Destinations
    PLB : PLP
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $B650: Unused ;;;
UNUSED_82B650:
; Almost clone of Draw_PauseMenu_during_FadeIn
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W PauseMenu_ButtonLabelMode : BNE +
    JSR EquipmentScreen_DrawItemSelector
    JSR EquipmentScreen_DisplayReserveTankAmount_shell
    PLB : PLP
    RTL

+   JSL Display_Map_Elevator_Destinations
    JSR MapScreen_DrawSamusPositionIndicator
    JSL Draw_Map_Icons
    PLB : PLP
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $B672: Draw map icons ;;;
Draw_Map_Icons:
    PHB
    REP #$30
    PHK : PLB
    LDX.W #MapIcon_PositionTablePointers_bossIcons
    LDA.W #$0009
    JSR Display_Map_Boss_Icons
    LDA.W #$0E00 : STA.B DP_Temp03
    LDX.W #MapIcon_PositionTablePointers_missileStations
    LDA.W #$000B
    JSR Draw_Simple_MapIcons
    LDX.W #MapIcon_PositionTablePointers_energyStations
    LDA.W #$000A
    JSR Draw_Simple_MapIcons
    LDX.W #MapIcon_PositionTablePointers_mapStations
    LDA.W #$004E
    JSR Draw_Simple_MapIcons
    LDA.W #$0400 : STA.B DP_Temp03
    LDX.W #MapIcon_PositionTablePointers_savePoints
    LDA.W #$0008
    JSR Draw_SaveStation_MapIcons
    LDA.W Debug_Enable : BEQ +
    LDX.W #MapIcon_PositionTablePointers_debugSavePoints
    LDA.W #$0008
    JSR Draw_Simple_MapIcons

+   LDA.W AreaIndex : BNE .return
    LDA.W #$0E00 : STA.B DP_Temp03
    LDA.W Crateria_MapIconPositions_savePoints2 : SEC : SBC.B DP_BG1YScroll : TAY
    LDA.W Crateria_MapIconPositions_savePoints : SEC : SBC.B DP_BG1XScroll : TAX
    LDA.W #$0063
    JSL AddSpritemapFrom_82C569_TableToOAM

  .return:
    PLB
    RTL


;;; $B6DD: Draw file select map icons ;;;
Draw_FileSelectMap_Icons:
    PHB
    REP #$30
    PHK : PLB
    JSR Handle_PauseScreen_PaletteAnimation
    LDX.W #MapIcon_PositionTablePointers_bossIcons
    LDA.W #$0009
    JSR Display_Map_Boss_Icons
    LDA.W #$0E00 : STA.B DP_Temp03
    LDX.W #MapIcon_PositionTablePointers_missileStations
    LDA.W #$000B
    JSR Draw_Simple_MapIcons
    LDX.W #MapIcon_PositionTablePointers_energyStations
    LDA.W #$000A
    JSR Draw_Simple_MapIcons
    LDX.W #MapIcon_PositionTablePointers_mapStations
    LDA.W #$004E
    JSR Draw_Simple_MapIcons
    LDA.W #$0E00 : STA.B DP_Temp03
    JSR Update_Samus_Position_Indicator_Animation
    PHA
    LDA.W #MapIcon_PositionTablePointers_savePoints>>16 : STA.B DP_Temp02
    LDA.W AreaIndex : ASL : TAX
    LDA.W MapIcon_PositionTablePointers_savePoints,X : STA.B DP_Temp00
    LDA.W LoadStationIndex : ASL #2 : TAY
    LDA.B [DP_Temp00],Y : SEC : SBC.B DP_BG1XScroll : TAX
    PHX
    INY #2
    LDA.B [DP_Temp00],Y : SEC : SBC.B DP_BG1YScroll : TAY
    PHY
    LDA.W PauseMenu_SamusPositionIndicatorAnimLoopCount : BIT.W #$0001 : BNE +
    LDA.W #$0012
    JSL AddSpritemapFrom_82C569_TableToOAM

+   PLY : PLX : PLA
    JSL AddSpritemapFrom_82C569_TableToOAM
    LDA.W Debug_Enable : BEQ +
    LDA.W #$0600 : STA.B DP_Temp03
    LDX.W #MapIcon_PositionTablePointers_savePoints
    LDA.W #$000C
    JSR Draw_Debug_Save_MapIcons
    LDX.W #MapIcon_PositionTablePointers_debugElevatorMarkers
    LDA.W #$0017
    JSR Draw_Debug_Elevator_Map_Icons
    LDX.W #MapIcon_PositionTablePointers_debugSavePoints
    LDA.W #$000C
    JSR Draw_Simple_MapIcons

+   LDA.W AreaIndex : BNE .return
    LDA.W #$0E00 : STA.B DP_Temp03
    LDA.W Crateria_MapIconPositions_savePoints2 : SEC : SBC.B DP_BG1YScroll : TAY
    LDA.W Crateria_MapIconPositions_savePoints : SEC : SBC.B DP_BG1XScroll : TAX
    LDA.W #$0063
    JSL AddSpritemapFrom_82C569_TableToOAM

  .return:
    PLB
    RTL


;;; $B798: Draw save station map icon ;;;
Draw_SaveStation_MapIcons:
;; Parameters:
;;     A: Save icon spritemap ID (always 8)
;;     X: Pointer to save icon data pointers (always $C80B)
;;     $03: Sprite palette bits
    STX.B DP_Temp20
    STA.B DP_Temp22
    LDA.W AreaIndex : CMP.L SRAMMirror_AreaIndex : BNE .return
    ASL : TAX
    LDA.L SRAMMirror_UsedSaveStationsElevators,X : STA.B DP_Temp24
    SEP #$20
    LDX.W LoadStationIndex
    LDA.W .bits,X : AND.B DP_Temp24 : STA.B DP_Temp24
    REP #$20
    LDA.W AreaIndex : ASL : CLC : ADC.B DP_Temp20 : TAX
    LDA.W $0000,X : BNE Draw_MapIcons_ofGivenType

  .return:
    RTS

  .bits:
    db $01,$02,$04,$08,$10,$20,$40,$80


;;; $B7D1: Draw debug save map icons ;;;
Draw_Debug_Save_MapIcons:
;; Parameters:
;;     A: Debug save icon spritemap ID (always Ch)
;;     X: Pointer to save icon data pointers (always $C80B)
;;     $03: Sprite palette bits
    STX.B DP_Temp20
    STA.B DP_Temp22
    LDA.W AreaIndex : ASL : TAX
    LDA.L SRAMMirror_UsedSaveStationsElevators,X : STA.B DP_Temp24
    TXA : CLC : ADC.B DP_Temp20 : TAX
    LDA.W $0000,X : BNE Draw_MapIcons_ofGivenType
    RTS


;;; $B7EB: Draw debug elevator map icons ;;;
Draw_Debug_Elevator_Map_Icons:
;; Parameters:
;;     A: Debug elevator icon spritemap ID (always 17h)
;;     X: Pointer to debug elevator icon data pointers (always $C81B)
;;     $03: Sprite palette bits
    STX.B DP_Temp20
    STA.B DP_Temp22
    LDA.W AreaIndex : ASL : TAX
    LDA.L SRAMMirror_UsedSaveStationsElevators+1,X : STA.B DP_Temp24
    TXA : CLC : ADC.B DP_Temp20 : TAX
    LDA.W $0000,X : BNE Draw_MapIcons_ofGivenType
    RTS


;;; $B805: Draw simple map icons ;;;
Draw_Simple_MapIcons:
;; Parameters:
;;     A: Spritemap ID
;;     X: Pointer to icon data pointers
;;     $03: Sprite palette bits
    STX.B DP_Temp20
    STA.B DP_Temp22
    LDA.W #$FFFF : STA.B DP_Temp24
    LDA.W AreaIndex : ASL : CLC : ADC.B DP_Temp20 : TAX
    LDA.W $0000,X : BNE Draw_MapIcons_ofGivenType
    RTS


;;; $B81C: Draw map icons of given type ;;;
Draw_MapIcons_ofGivenType:
;; Parameters:
;;     A: Area icon data pointer
;;     $03: Sprite palette bits
;;     $22: Spritemap ID
;;     $24: Bitmask of icon data entries to check
    TAX

  .loop:
    LDA.W $0000,X : BIT.W #$8000 : BNE .return
    LSR.B DP_Temp24 : BCC .next
    PHX
    LDA.W $0002,X : TAY
    LDA.W $0000,X : TAX
    JSR Check_if_MapPosition_isExplored
    BEQ .restoreX
    PLX : PHX
    LDA.W $0002,X : SEC : SBC.B DP_BG1YScroll : TAY
    LDA.W $0000,X : SEC : SBC.B DP_BG1XScroll : TAX
    LDA.B DP_Temp22
    JSL AddSpritemapFrom_82C569_TableToOAM

  .restoreX:
    PLX

  .next:
    INX #4
    BRA .loop

  .return:
    RTS


;;; $B855: Check if map position is explored ;;;
Check_if_MapPosition_isExplored:
;; Parameters:
;;     X: X position on map (in pixels)
;;     Y: Y position on map (in pixels)
;; Returns:
;;     Zero: Clear if map square is explored, else set
    TXA : AND.W #$FF00 : LSR : STA.B DP_Temp12
    TXA : AND.W #$00FF : LSR #6
    CLC : ADC.B DP_Temp12 : STA.B DP_Temp12
    TYA : AND.W #$FFF8 : LSR : CLC : ADC.B DP_Temp12 : STA.B DP_Temp12
    TXA : LSR #3 : AND.W #$0007 : TAX
    LDY.B DP_Temp12
    SEP #$20
    LDA.W MapTilesExplored,Y : BIT.W .bits,X
    REP #$20
    RTS

  .bits:
    db $80,$40,$20,$10,$08,$04,$02,$01


;;; $B892: Display map boss icons ;;;
Display_Map_Boss_Icons:
;; Parameters:
;;     A: Boss icon spritemap ID (always 9)
;;     X: Pointer to boss icon data pointers (always MapIcon_PositionTablePointers)
    STX.B DP_Temp20
    STA.B DP_Temp22
    LDX.W AreaIndex
    LDA.L SRAMMirror_Boss,X : AND.W #$00FF : STA.B DP_Temp24
    LDA.W AreaIndex : ASL : CLC : ADC.B DP_Temp20 : TAX
    LDA.W $0000,X : BEQ .return
    TAX

  .bossIcons:
    LDA.W $0000,X : CMP.W #$FFFF : BEQ .return
    CMP.W #$FFFE : BEQ .skip
    LDA.W #$0E00 : STA.B DP_Temp03
    LSR.B DP_Temp24 : BCS .bossDead
    LDA.W CurrentAreaMapCollectedFlag : BEQ .skip

  .drawBossIcon:
    PHX
    LDA.W $0002,X : SEC : SBC.B DP_BG1YScroll : TAY
    LDA.W $0000,X : SEC : SBC.B DP_BG1XScroll : TAX
    LDA.B DP_Temp22
    JSL AddSpritemapFrom_82C569_TableToOAM
    PLX

  .next:
    INX #4
    BRA .bossIcons

  .return:
    RTS

  .skip:
    LSR.B DP_Temp24
    BRA .next

  .bossDead:
    PHX
    LDA.W $0002,X : SEC : SBC.B DP_BG1YScroll : TAY
    LDA.W $0000,X : SEC : SBC.B DP_BG1XScroll : TAX
    LDA.W #$0062
    JSL AddSpritemapFrom_82C569_TableToOAM
    PLX
    LDA.W #$0C00 : STA.B DP_Temp03
    BRA .drawBossIcon


;;; $B90A: Draw map scroll arrow and check to scroll in that direction ;;;
Draw_MapScrollArrow_and_Check_Scroll_in_that_Direction:
;; Parameters:
;;     X: Pointer to map scroll arrow data
    PHX
    LDA.W $0000,X : PHA
    LDA.W $0002,X : TAY
    LDA.W $0004,X
    PLX : PHB
    PHK : PLB
    JSR Draw_PauseScreen_SpriteAnimation
    PLB : PLX
    LDA.W $0006,X : BIT.B DP_Controller1Input : BEQ .return
    LDA.W MapScrolling_Direction : BNE .return
    LDA.W $0008,X : STA.W MapScrolling_Direction

  .return:
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $B932: Unused. REP #$30 ;;;
UNUSED_REP30_82B932:
    REP #$30
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $B934: Handle map scroll arrows ;;;
Handle_MapScrollArrows:
    PHP : PHB
    SEP #$20
    LDA.B #MapScrollArrows>>16 : PHA : PLB
    REP #$20
    LDA.W MapScroll_MinX : SEC : SBC.W #$0018 : CMP.B DP_BG1XScroll : BPL +
    LDX.W #MapScrollArrows_left
    JSL Draw_MapScrollArrow_and_Check_Scroll_in_that_Direction

+   LDA.W MapScroll_MaxX : CLC : ADC.W #$0018
    SEC : SBC.W #$0100 : CMP.B DP_BG1XScroll : BMI +
    LDX.W #MapScrollArrows_right
    JSL Draw_MapScrollArrow_and_Check_Scroll_in_that_Direction

+   LDA.W MapScroll_MinY : SEC : SBC.W #$0038 : CMP.B DP_BG1YScroll : BPL +
    LDX.W #MapScrollArrows_up
    JSL Draw_MapScrollArrow_and_Check_Scroll_in_that_Direction

+   LDA.W MapScroll_MaxY : SEC : SBC.W #$00B1 : CMP.B DP_BG1YScroll : BMI .cancelScrollDown
    LDX.W #MapScrollArrows_down
    JSL Draw_MapScrollArrow_and_Check_Scroll_in_that_Direction

  .return:
    PLB : PLP
    RTL

  .cancelScrollDown:
; I have no idea what this check is for
; As far as I can tell, [map scrolling direction] can't possibly down at this point
    LDA.W MapScrolling_Direction : CMP.W MapScrollArrows_downDirection : BNE .return
    STZ.W MapScrolling_GearSwitchTimer : STZ.W MapScrolling_Direction : STZ.W MapScrolling_SpeedIndex
    BRA .return


MapScrollArrows:
;        ___________________________ X position
;       |      _____________________ Y position
;       |     |      _______________ Pause menu animation ID
;       |     |     |      _________ Necessary input
;       |     |     |     |      ___ Map scrolling direction
;       |     |     |     |     |
  .left:
    dw $0010,$0078,$0009,$0200,$0001
  .right:
    dw $00F0,$0078,$0008,$0100,$0002
  .up:
    dw $0080,$0038,$0006,$0800,$0003
  .down:
    dw $0080,$00B8,$0007,$0400
  .downDirection:
    dw                         $0004


;;; $B9C8: Map screen - draw Samus position indicator ;;;
MapScreen_DrawSamusPositionIndicator:
    LDA.W #$0E00 : STA.B DP_Temp03
    JSR Update_Samus_Position_Indicator_Animation
    PHA
    LDA.W SamusXPosition : XBA : AND.W #$00FF
    CLC : ADC.W RoomMapX : ASL #3
    SEC : SBC.B DP_BG1XScroll : TAX
    LDA.W SamusYPosition : XBA : AND.W #$00FF
    CLC : ADC.W RoomMapY
    INC : ASL #3
    SEC : SBC.B DP_BG1YScroll : TAY
    PLA
    JSL AddSpritemapFrom_82C569_TableToOAM
    RTS


;;; $B9FC: Update Samus position indicator animation ;;;
Update_Samus_Position_Indicator_Animation:
;; Returns:
;;     A: Samus position indicator spritemap ID
    LDA.W PauseMenu_SamusPositionIndicatorAnimTimer : BNE .nonZero
    LDX.W PauseMenu_SamusPositionIndicatorAnimFrame
    INX #2 : CPX.W #$0008 : BMI +
    INC.W PauseMenu_SamusPositionIndicatorAnimLoopCount
    LDX.W #$0000

+   STX.W PauseMenu_SamusPositionIndicatorAnimFrame
    LDA.W .delays,X : STA.W PauseMenu_SamusPositionIndicatorAnimTimer

  .nonZero:
    DEC : STA.W PauseMenu_SamusPositionIndicatorAnimTimer
    LDX.W PauseMenu_SamusPositionIndicatorAnimFrame
    LDA.W .spritemapIDs,X
    RTS

  .delays:
    db $08,$00,$04,$00,$08,$00,$04,$00

  .spritemapIDs:
    db $5F,$00,$60,$00,$61,$00,$60,$00 ; (into $82:C569 table)


;;; $BA35: Draw border around SAMUS DATA ;;;
Draw_Border_Around_SAMUS_DATA:
    LDA.W #$0E00 : STA.B DP_Temp03
    LDX.W #$0080
    LDY.W #$0010
    LDA.W #$0048
    JSL AddSpritemapFrom_82C569_TableToOAM
    RTL


;;; $BA48: Draw border around DATA COPY MODE ;;;
Draw_Border_Around_DATA_COPY_MODE:
    LDA.W #$0E00 : STA.B DP_Temp03
    LDX.W #$0080
    LDY.W #$0010
    LDA.W #$0049
    JSL AddSpritemapFrom_82C569_TableToOAM
    RTL


;;; $BA5B: Draw border around DATA CLEAR MODE ;;;
Draw_Border_Around_DATA_CLEAR_MODE:
    LDA.W #$0E00 : STA.B DP_Temp03
    LDX.W #$007C
    LDY.W #$0010
    LDA.W #$004A
    JSL AddSpritemapFrom_82C569_TableToOAM
    RTL


;;; $BA6E: Draw menu selection missile ;;;
Draw_Menu_Selection_Missile:
    PHB
    PHK : PLB
    LDA.W TitleMenu_SelectionMissileAnimTimer : BEQ +
    DEC : STA.W TitleMenu_SelectionMissileAnimTimer : BNE +
    LDA.W TitleMenu_SelectionMissileAnimFrame : INC : AND.W #$0003 : STA.W TitleMenu_SelectionMissileAnimFrame
    ASL : TAY
    LDA.W .animTimer,Y : STA.W TitleMenu_SelectionMissileAnimTimer

+   LDA.W #$0E00 : STA.B DP_Temp03
    LDA.W TitleMenu_SelectionMissileAnimFrame : ASL : TAY
    LDA.W .spritemapIDs,Y : PHA
    LDA.W TitleMenu_SelectionMissileYPosition : TAY
    LDA.W TitleMenu_SelectionMissileXPosition : TAX
    PLA : PLB
    JML AddSpritemapFrom_82C569_TableToOAM

  .animTimer:
    dw $0008,$0008,$0008,$0008

  .spritemapIDs:
    dw $0037,$0036,$0035,$0034


;;; $BABA: Draw file copy arrow ;;;
Draw_FileCopy_Arrow:
    PHB
    PHK : PLB
    LDA.W TitleMenu_FileCopySrcFileClearSlot : SEC : SBC.W TitleMenu_FileCopyDestSlot : BPL .upwards
    EOR.W #$FFFF : INC
    LDX.W #$0000
    CMP.W #$0002 : BPL .spawnSprite
    LDX.W #$0006
    LDA.W TitleMenu_FileCopySrcFileClearSlot : BEQ +
    LDX.W #$000C

+   BRA .spawnSprite

  .upwards:
    LDX.W #$0012
    CMP.W #$0002 : BPL .spawnSprite
    LDX.W #$0018
    LDA.W TitleMenu_FileCopySrcFileClearSlot : CMP.W #$0001 : BEQ .spawnSprite
    LDX.W #$001E

  .spawnSprite:
    LDA.W #$0200 : STA.B DP_Temp03
    LDA.W .tableIndex,X : PHA
    LDA.W .tableYpos,X : TAY
    LDA.W .tableXpos,X : TAX
    PLA : PLB
    JML AddSpritemapFrom_82C569_TableToOAM

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


;;; $BB30: Display map elevator destinations ;;;
Display_Map_Elevator_Destinations:
    REP #$30
    PHB
    PHK : PLB
    LDA.W #$0000 : STA.B DP_Temp03
    LDX.W AreaIndex
    LDA.L SRAMMirror_MapStations,X : AND.W #$00FF : BEQ .return
    LDA.W AreaIndex : ASL : TAX
    LDA.W Map_Elevator_Destinations,X : TAX

  .loop:
    LDA.W $0000,X : CMP.W #$FFFF : BEQ .return
    PHX
    SEC : SBC.B DP_BG1XScroll : PHA
    LDA.W $0002,X : SEC : SBC.B DP_BG1YScroll : TAY
    LDA.W $0004,X
    PLX
    JSL AddSpritemapFrom_82C569_TableToOAM
    PLA : CLC : ADC.W #$0006 : TAX
    BRA .loop

  .return:
    PLB
    RTL


;;; $BB75: Handle game over baby metroid ;;;
Handle_GameOver_BabyMetroid:
    PHB
    REP #$30
    PHK : PLB
    LDA.W Enemy.instTimer : BEQ Restart_GameOver_BabyMetroid_InstructionList
; fallthrought to Process_GameOver_BabyMetroid_InstructionList


;;; $BB7F: Process game over baby metroid instruction list ;;;
Process_GameOver_BabyMetroid_InstructionList:
;; Parameters:
;;     A: [Enemy 0 instruction timer]

; Expects a pushed DB
    LDX.W Enemy.instList
    DEC : STA.W Enemy.instTimer : BNE Draw_GameOver_BabyMetroid
    LDA.W $0006,X : CMP.W #$FFFF : BEQ Restart_GameOver_BabyMetroid_InstructionList
    BMI Goto_A
    STA.W Enemy.instTimer
    TXA : CLC : ADC.W #$0006 : STA.W Enemy.instList
    TAX
; fallthrough to Draw_GameOver_BabyMetroid


;;; $BB9E: Draw game over baby metroid ;;;
Draw_GameOver_BabyMetroid:
;; Parameters:
;;     X: Instruction list pointer

; Expects a pushed DB
    PHX
    LDA.W $0004,X : TAY
    LDX.W #$0000

  .loop:
    LDA.W $0000,Y : STA.L Palettes_SpriteP4C0,X
    INY #2
    INX #2 : CPX.W #$0020 : BMI .loop
    PLX
    LDA.W #$0800 : STA.B DP_Temp03
    LDA.W $0002,X
    LDX.W #$007C
    LDY.W #$0050
    JSL AddSpritemapFrom_82C569_TableToOAM
    LDA.W #$0A00 : STA.B DP_Temp03
    LDA.W #$0064
    LDX.W #$007C
    LDY.W #$0050
    JSL AddSpritemapFrom_82C569_TableToOAM
    PLB
    RTL


;;; $BBDD: Restart game over baby metroid instruction list ;;;
Restart_GameOver_BabyMetroid_InstructionList:
; Expects a pushed DB
    LDA.W #GameOver_BabyMetroid_InstructionList : STA.W Enemy.instList
    LDA.W #$000A : STA.W Enemy.instTimer
    BRA Process_GameOver_BabyMetroid_InstructionList


;;; $BBEB: Go to [A] ;;;
Goto_A:
    STA.B DP_Temp12
    JMP.W (DP_Temp12)


;;; $BBF0: Finish processing game over baby metroid ASM instruction ;;;
FinishProcessing_GameOver_BabyMetroid_ASMInstruction:
; Like Process_GameOver_BabyMetroid_InstructionList, but accounting for the two byte ASM instruction pointer
    LDX.W Enemy.instList
    LDA.W $0008,X : STA.W Enemy.instTimer
    TXA : CLC : ADC.W #$0008 : STA.W Enemy.instList : TAX
    LDA.W $0000,X : CMP.W #$FFFF : BEQ Restart_GameOver_BabyMetroid_InstructionList
    BRA Draw_GameOver_BabyMetroid


;;; $BC0C: Instruction - queue baby metroid cry 1 sound effect ;;;
Instruction_Queue_BabyMetroid_Cry1_SoundEffect:
    LDA.W #$0023
    JSL QueueSound_Lib3_Max6
    BRA FinishProcessing_GameOver_BabyMetroid_ASMInstruction


;;; $BC15: Instruction - queue baby metroid cry 2 sound effect ;;;
Instruction_Queue_BabyMetroid_Cry2_SoundEffect:
    LDA.W #$0026
    JSL QueueSound_Lib3_Max6
    BRA FinishProcessing_GameOver_BabyMetroid_ASMInstruction


;;; $BC1E: Instruction - queue baby metroid cry 3 sound effect ;;;
Instruction_Queue_BabyMetroid_Cry3_SoundEffect:
    LDA.W #$0027
    JSL QueueSound_Lib3_Max6
    BRA FinishProcessing_GameOver_BabyMetroid_ASMInstruction


;;; $BC27: Game over baby metroid instruction list ;;;
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


;;; $BD97: Game over baby metroid palettes ;;;
GameOver_BabyMetroid_Palettes:
; Title baby metroid palettes are at $8B:A2B7
  .0:
    dw $3800,$7F50,$2E40,$2DA0,$2D00,$725A,$2C3A,$240F,$1C05,$1800,$639A,$52D3,$420D,$7F66,$7FFA,$7240
  .1:
    dw $3800,$6BF5,$06E1,$0641,$05A1,$5E5F,$183F,$1014,$080A,$0404,$4F9F,$3ED8,$2E12,$6F70,$7FFF,$5EE0
  .2:
    dw $3800,$77F8,$1344,$12A4,$1204,$6ABF,$249F,$1C77,$146D,$1067,$5BFF,$4B38,$3A72,$7BD3,$7FFF,$6B43
  .3:
    dw $3800,$7FFB,$1FA7,$1F07,$1E67,$771F,$30FF,$28DA,$20D0,$1CCA,$67FF,$579B,$46D5,$7BD6,$7FFF,$77A6


;;; $BE17: Cancel sound effects ;;;
Cancel_Sound_Effects:
    REP #$30
    LDA.W #$0002
    JSL QueueSound_Lib1_Max6
    LDA.W #$0071
    JSL QueueSound_Lib2_Max6
    LDA.W #$0001
    JSL QueueSound_Lib3_Max6
    RTL


;;; $BE2F: Queue Samus movement sound effects ;;;
Queue_Samus_Movement_SoundEffects:
; Called by message boxes and unpausing
    REP #$30
    LDA.W SamusBoostTimer : AND.W #$FF00 : CMP.W #$0400 : BNE +
    LDA.W #$002B
    JSL QueueSound_Lib3_Max6

+   LDA.W SamusProjectile_FlareCounter : CMP.W #$0010 : BMI +
    LDA.W #$0041
    JSL QueueSound_Lib1_Max6

+   LDA.W #$0014
    JSL Run_Samus_Command
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $BE5A: Unused. Mark entire map as explored and crash ;;;
UNUSED_MarkEntireMapExplored_Crash_82BE5A:
    REP #$30
    LDA.W AreaIndex : STA.B DP_Temp12
    ASL : CLC : ADC.B DP_Temp12 : TAX
    LDA.W AreaMapPointers,X : STA.B DP_Temp00
    LDA.W AreaMapPointers+2,X : STA.B DP_Temp02
    LDY.W #$0000

  .clear12:
    STZ.B DP_Temp12

  .loop:
    LDA.B [DP_Temp00],Y : AND.W #$03FF : CMP.W #$001F : BEQ .clc
    SEC
    BRA +

  .clc:
    CLC

+   ROL.B DP_Temp12
    INY #2
    TYA : AND.W #$000F : BNE .loop
    CPY.W #$1000

  .crash:
    BPL .crash
    ; dead code
    TYA : LSR #4 : TAX
    SEP #$20
    LDA.B DP_Temp12 : STA.W MusicTrackIndex+1,X
    REP #$20
    BRA .clear12


;;; $BEA3: Unused. Count rooms and crash ;;;
UNUSED_CountRooms_Crash_82BEA3:
; So... this routine does some stuff and then crashes as well? Great!

; This loops through data at $BF04 that no longer exists, 100h bytes per area for 7 areas
; $7E:3000 + [area index] * 100h is populated with indices of non-zero bytes in the $BF04 for that area
; $7E:4000 + [area index] is populated with count of non-zero bytes in the $BF04 for that area
    REP #$30
    LDX.W #$0600
    LDA.W #$0000

  .loop:
    STA.L GameOptionsMenuTilemap,X : STA.L BG2RoomSelectMapTilemap,X
    DEX #2 : BPL .loop
    STA.L BG2RoomSelectMapTilemap : STA.L BG2RoomSelectMapTilemap+2 : STA.L BG2RoomSelectMapTilemap+4
    STZ.W AreaIndex

  .biggerLoop:
    REP #$20
    LDA.W AreaIndex : XBA : TAY
    TAX
    SEP #$20
    LDA.B #$FF : STA.B DP_Temp12

  .middleLoop:
    LDA.W ReserveTank_TransferEnergyPerFrame,Y : BEQ +
    TYA : STA.L GameOptionsMenuTilemap,X
    INX : PHX
    LDX.W AreaIndex
    LDA.L BG2RoomSelectMapTilemap,X : INC : STA.L BG2RoomSelectMapTilemap,X
    PLX

+   INY
    LDA.B DP_Temp12 : DEC : STA.B DP_Temp12
    CMP.B #$FF : BNE .middleLoop
    LDA.W AreaIndex : INC : STA.W AreaIndex
    CMP.B #$07 : BMI .biggerLoop

  .crash:
    BRA .crash
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $BF04: Reserve tank transfer energy per frame ;;;
ReserveTank_TransferEnergyPerFrame:
    dw $0001


;;; $BF06: Equipment screen tilemaps ;;;
EquipmentScreenTilemaps:
  .modeManual:
; MODE[MANUAL]
    dw $2519,$251A,$251B,$3D46,$3D47,$3D48,$3D49

  .reserveTank:
; RESERVE TANK
    dw $3C80,$3C81,$3C82,$3C83,$3C84,$3C85,$3C86

  .manual:
; [MANUAL]
    dw $3D46,$3D47,$3D48,$3D49

  .auto:
; [ AUTO ]
    dw $3D56,$3D57,$3D58,$3D59

  .charge:
; oCHARGE
    dw $08FF,$08D8,$08D9,$08DA,$08E7

  .ice:
; oICE
    dw $08FF,$08DB,$08DC,$08D4,$08D4

  .wave:
; oWAVE
    dw $08FF,$08DD,$08DE,$08DF,$08D4

  .spazer:
; oSPAZER
    dw $08FF,$08E8,$08E9,$08EA,$08EB

  .plasma:
; oPLASMA
    dw $08FF,$08EC,$08ED,$08EE,$08EF

  .variaSuit:
; oVARIA SUIT
    dw $08FF,$0900,$0901,$0902,$0903,$0904,$0905,$08D4,$08D4

  .gravitySuit:
; oGRAVITY SUIT
    dw $08FF,$08D0,$08D1,$08D2,$08D3,$0903,$0904,$0905,$08D4

  .morphingBall:
; oMORPHING BALL
    dw $08FF,$0920,$0921,$0922,$0923,$0917,$0918,$090F,$091F

  .bombs:
; oBOMBS
    dw $08FF,$08D5,$08D6,$08D7,$08D4,$08D4,$08D4,$08D4,$08D4

  .springBall:
; oSPRING BALL
    dw $08FF,$0910,$0911,$0912,$0913,$0914,$0915,$0916,$08D4

if !FEATURE_KEEP_UNREFERENCED
  .UNUSED:
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED

  .screwAttack:
; oSCREW ATTACK
    dw $08FF,$08E0,$08E1,$08E2,$08E3,$08E4,$08E5,$08E6,$08D4

  .hiJumpBoots:
; oHI-JUMP BOOTS
    dw $08FF,$0930,$0931,$0932,$0933,$0934,$0935,$0936,$08D4

  .spaceJump:
; oSPACE JUMP
    dw $08FF,$08F0,$08F1,$08F2,$08F3,$08F4,$08F5,$08D4,$08D4

  .speedBooster:
; oSPEED BOOSTER
    dw $08FF,$0924,$0925,$0926,$0927,$0928,$0929,$092A,$092B

  .hyper:
; oHYPER
    dw $08FF,$0937,$0938,$0939,$092F,$08D4,$08D4,$08D4,$08D4

  .blankPlaceholder:
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000


;;; $C02C: Equipment screen data ;;;
EquipmentScreenDataPointers:
; These pointers aren't always used, they're hardcoded in various places e.g. $82:A12B
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
    dw $0000
    dw EquippedBeams
    dw EquippedItems
    dw EquippedItems

  .listsPointsToEquipmentTilemaps:
    dw $0000
    dw EquipmentScreenData_PointersEquipmentTIlemaps_weapons
    dw EquipmentScreenData_PointersEquipmentTIlemaps_suitsMisc
    dw EquipmentScreenData_PointersEquipmentTIlemaps_boots


EquipmentScreenData:
  .EquipmentBitmasks:
  ..weapons:
    dw $1000 ; Weapons - charge
    dw $0002 ; Weapons - ice
    dw $0001 ; Weapons - wave
    dw $0004 ; Weapons - spazer
    dw $0008 ; Weapons - plasma

  ..suitsMisc:
    dw $0001 ; Suit/misc - varia suit
    dw $0020 ; Suit/misc - gravity suit
    dw $0004 ; Suit/misc - morph ball
    dw $1000 ; Suit/misc - bombs
    dw $0002 ; Suit/misc - spring ball
    dw $0008 ; Suit/misc - screw attack

  ..boots:
    dw $0100 ; Boots - hi-jump boots
    dw $0200 ; Boots - space jump
    dw $2000 ; Boots - speed booster

  .RAMTilemapOffsets:
  ..tanks:
    dw $3A88 ; Tanks - mode
    dw $3AC8 ; Tanks - reserve tank

  ..weapons:
    dw $3C08 ; Weapons - char
    dw $3C48 ; Weapons - ice
    dw $3C88 ; Weapons - wave
  ...spazer:
    dw $3CC8 ; Weapons - spazer
  ...plasma:
    dw $3D08 ; Weapons - plasma

  ..suitsMisc:
    dw $3A6A ; Suit/misc - varia suit
    dw $3AAA ; Suit/misc - gravity suit
    dw $3B6A ; Suit/misc - morph ball
    dw $3BAA ; Suit/misc - bombs
    dw $3BEA ; Suit/misc - spring ball
    dw $3C2A ; Suit/misc - screw attack

  ..boots:
    dw $3CEA ; Boots - hi-jump boots
    dw $3D2A ; Boots - space jump
    dw $3D6A ; Boots - speed booster


EquipmentScreenData_PointersEquipmentTIlemaps:
; Pointers to equipment tilemaps
  .tanks:
    dw EquipmentScreenTilemaps_modeManual

  .tanksReserve:
    dw EquipmentScreenTilemaps_reserveTank

  .weapons:
    dw EquipmentScreenTilemaps_charge
    dw EquipmentScreenTilemaps_ice
    dw EquipmentScreenTilemaps_wave
    dw EquipmentScreenTilemaps_spazer
    dw EquipmentScreenTilemaps_plasma

  .suitsMisc:
    dw EquipmentScreenTilemaps_variaSuit
    dw EquipmentScreenTilemaps_gravitySuit
    dw EquipmentScreenTilemaps_morphingBall
    dw EquipmentScreenTilemaps_bombs
    dw EquipmentScreenTilemaps_springBall
    dw EquipmentScreenTilemaps_screwAttack

  .boots:
    dw EquipmentScreenTilemaps_hiJumpBoots
    dw EquipmentScreenTilemaps_spaceJump
    dw EquipmentScreenTilemaps_speedBooster


HyperBeamTilemaps:
; Hyper beam weapons tilemaps
    dw EquipmentScreenTilemaps_blankPlaceholder
    dw EquipmentScreenTilemaps_blankPlaceholder
    dw EquipmentScreenTilemaps_hyper
    dw EquipmentScreenTilemaps_blankPlaceholder
    dw EquipmentScreenTilemaps_blankPlaceholder


;;; $C0B2: Pause screen sprite animation data ;;;
PauseScreen_SpriteAnimationData:
  .timer:
; Pointers to use for animation timer
    dw PauseMenu_ButtonPressedHighlightTimer                             ; 1: Unused (used for start / L/R button pressed highlight elsewhere)
    dw PauseMenu_HighlightAnimationTimer                                 ; 2: L/R highlight
    dw PauseMenu_ItemSelectorAnimationTimer                              ; 3: Item selector
    dw PauseMenu_ReserveTankAnimationTimer                               ; 4: Unused (used for reserve tank animation elsewhere)
    dw PauseMenu_UnusedAnimationTimer0731                                ; 5: Unused
    dw PauseMenu_MapScrollUpArrowAnimationTimer                          ; 6: Map scroll arrow - up
    dw PauseMenu_MapScrollDownArrowAnimationTimer                        ; 7: Map scroll arrow - down
    dw PauseMenu_MapScrollRightArrowAnimationTimer                       ; 8: Map scroll arrow - right
    dw PauseMenu_MapScrollLeftArrowAnimationTimer                        ; 9: Map scroll arrow - left

  .frame:
; Pointers to use for animation frame, indexes animation data
    dw PauseMenu_UnusedAnimationTimer073D                                ; 1: Unused (used for start / L/R button pressed highlight elsewhere)
    dw PauseMenu_HighlightAnimationFrame                                 ; 2: L/R highlight
    dw PauseMenu_ItemSelectorAnimationFrame                              ; 3: Item selector
    dw PauseMenu_ReserveTankAnimationFrame                               ; 4: Unused (used for reserve tank animation elsewhere)
    dw PauseMenu_UnusedAnimationFrame                                    ; 5: Unused
    dw PauseMenu_MapScrollUpArrowAnimationFrame                          ; 6: Map scroll arrow - up
    dw PauseMenu_MapScrollDownArrowAnimationFrame                        ; 7: Map scroll arrow - down
    dw PauseMenu_MapScrollRightArrowAnimationFrame                       ; 8: Map scroll arrow - right
    dw PauseMenu_MapScrollLeftArrowAnimationFrame                        ; 9: Map scroll arrow - left

  .mode:
; Pointers to use for animation mode, indexes [$C1E4 + (animation ID) * 2]
    dw PauseMenu_ShoulderButtonPressedHighlight                          ; 1: Unused (used for start / L/R button pressed highlight elsewhere)
    dw PauseMenu_ButtonLabelMode                                         ; 2: L/R highlight
    dw PauseMenu_EquipmentScreenCategoryIndex                            ; 3: Item selector
    dw PauseMenu_ReserveTankSoundDelayCounter                            ; 4: Unused (used for reserve tank animation elsewhere)
    dw PauseMenu_UnusedAnimationMode                                     ; 5: Unused
    dw PauseMenu_MapScrollUpArrowAnimationMode                           ; 6: Map scroll arrow - up
    dw PauseMenu_MapScrollDownArrowAnimationMode                         ; 7: Map scroll arrow - down
    dw PauseMenu_MapScrollRightArrowAnimationMode                        ; 8: Map scroll arrow - right
    dw PauseMenu_MapScrollLeftArrowAnimationMode                         ; 9: Map scroll arrow - left

  .data:
; Pointers to animation data
    dw Duration_Of_L_R_Button_Pressed_Highlight                          ; 1: Unused (used for start / L/R button pressed highlight elsewhere)
    dw L_R_HighlightAnimationData_PauseScreenPaletteAnimationDelays      ; 2: L/R highlight
    dw ItemSelector_and_MapScrollArrows                                  ; 3: Item selector
    dw UNUSED_Animation_4_82C162                                         ; 4: Unused (used for reserve tank animation elsewhere)
    dw ItemSelector_and_MapScrollArrows                                  ; 5: Unused
    dw ItemSelector_and_MapScrollArrows                                  ; 6: Map scroll arrow - up
    dw ItemSelector_and_MapScrollArrows                                  ; 7: Map scroll arrow - down
    dw ItemSelector_and_MapScrollArrows                                  ; 8: Map scroll arrow - right
    dw ItemSelector_and_MapScrollArrows                                  ; 9: Map scroll arrow - left


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
  .spritemapID:
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
  .pointers:
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

  .weapons:
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
  .Xpositions:
; Equipment screen reserve tank X positions
    dw $0018,$0020,$0028,$0030,$0038,$0040

  .Yposition:
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

  .UNUSED_Anim4:
    dw $002C

  .UNUSED_Anim5:
    dw $0013

  .upScrollArrow:
    dw $0006

  .downScrollArrow:
    dw $0007

  .rightScrollArrow:
    dw $0004

  .leftScrollArrow:
    dw $0005


;;; $C216: Pause menu spritemaps ;;;
MenuSpritemap_2:
; See $81:8A5F for spritemap format
; Spritemap 2: unused
    dw $0001
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $95)

MenuSpritemap_3:
; Spritemap 3: unused
    dw $0001
    %spritemapEntry(0, $00, $00, 1, 0, 3, 0, $95)

MenuSpritemap_1:
; Spritemap 1: unused
    dw $0001
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $94)

MenuSpritemap_0:
; Spritemap 0: unused
    dw $0001
    %spritemapEntry(0, $00, $00, 0, 1, 3, 0, $94)

MenuSpritemap_6_MapScrollingArrow_Up:
; Spritemap 6: map scrolling arrow - up
    dw $0002
    %spritemapEntry(0, $1FF, $FC, 1, 1, 3, 2, $9D)
    %spritemapEntry(0, $1F8, $FC, 1, 0, 3, 2, $9D)

MenuSpritemap_7_MapScrollingArrow_Down:
; Spritemap 7: map scrolling arrow - down
    dw $0002
    %spritemapEntry(0, $1FF, $FC, 0, 1, 3, 2, $9D)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 2, $9D)

MenuSpritemap_5_MapScrollingArrow_Left:
; Spritemap 5: map scrolling arrow - left
    dw $0002
    %spritemapEntry(0, $1FC, $00, 1, 1, 3, 2, $9E)
    %spritemapEntry(0, $1FC, $F9, 0, 1, 3, 2, $9E)

MenuSpritemap_4_MapScrollingArrow_Right:
; Spritemap 4: map scrolling arrow - right
    dw $0002
    %spritemapEntry(0, $1FC, $00, 1, 0, 3, 2, $9E)
    %spritemapEntry(0, $1FC, $F9, 0, 0, 3, 2, $9E)

MenuSpritemap_10:
; Spritemap 10h: unused
    dw $0005
    %spritemapEntry(0, $1FC, $04, 0, 0, 3, 0, $97)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 3, 0, $86)
    %spritemapEntry(0, $04, $FC, 0, 0, 3, 0, $88)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 3, 0, $77)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $87)

MenuSpritemap_11:
; Spritemap 11h: unused
    dw $0005
    %spritemapEntry(0, $04, $FC, 0, 0, 3, 0, $8B)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 3, 0, $89)
    %spritemapEntry(0, $1FC, $04, 0, 0, 3, 0, $9A)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $8A)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 3, 0, $7A)

MenuSpritemap_12_FileSelectMapSamusIcon:
; Spritemap 12h: file select map Samus icon
    dw $0001
    %spritemapEntry(0, $01, $00, 0, 0, 2, 7, $89)

MenuSpritemap_14_EquipmentScreenItemSelector_Tanks:
; Spritemap 14h: equipment screen item selector - tanks
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 3, $46)

MenuSpritemap_19:
; Spritemap 19h: unused
    dw $0003
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $63)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 0, $B9)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 0, $B8)

MenuSpritemap_15_EquipmentScreenItemSelector_Weapons:
; Spritemap 15h: equipment screen item selector - weapons
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
; Spritemap 16h: equipment screen item selector - suit/misc/boots
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
; Spritemap 1Bh: full equipment screen reserve tank
    dw $0001
    %spritemapEntry(0, $00, $00, 0, 0, 3, 2, $4E)

MenuSpritemap_1C:
; Spritemap 1Ch: unused. Clone of MenuSpritemap_20_EmptyEquipmentScreenReserveTank
    dw $0001
    %spritemapEntry(0, $00, $00, 0, 0, 3, 2, $4D)

MenuSpritemap_1A_1F_EndOfEquipmentScreenReserveHealthBar:
; Spritemap 1Ah/1Fh: end of equipment screen reserve health bar
    dw $0001
    %spritemapEntry(0, $00, $00, 0, 0, 3, 2, $4F)

MenuSpritemap_1D_FullEquipmentScreenReserveHealthBar:
; Spritemap 1Dh: unused. Clone of $C35B (full equipment screen reserve tank)
    dw $0001
    %spritemapEntry(0, $00, $00, 0, 0, 3, 2, $4E)

MenuSpritemap_1E:
; Spritemap 1Eh: unused. Empty equipment screen reserve tank with a different palette
    dw $0001
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $4D)

MenuSpritemap_13:
; Spritemap 13h: unused
    dw $0001
    %spritemapEntry(0, $1FD, $FC, 0, 0, 3, 7, $1F0)

MenuSpritemap_8_SaveIcon:
; Spritemap 8: save icon
    dw $0001
    %spritemapEntry(0, $01, $00, 0, 0, 2, 0, $8D)

MenuSpritemap_9_BossIcon:
; Spritemap 9: boss icon
    dw $0001
    %spritemapEntry(0, $01, $00, 0, 0, 2, 0, $8A)

MenuSpritemap_A_EnergyStationIcon:
; Spritemap Ah: energy station icon
    dw $0001
    %spritemapEntry(0, $01, $00, 0, 0, 2, 0, $8C)

MenuSpritemap_B_MissileStationIcon:
; Spritemap Bh: missile station icon
    dw $0001
    %spritemapEntry(0, $01, $00, 0, 0, 2, 0, $8B)

MenuSpritemap_4E_MapStationIcon:
; Spritemap 4Eh: map station icon
    dw $0001
    %spritemapEntry(0, $01, $00, 0, 0, 2, 0, $8E)

MenuSpritemap_17_DebugElevatorIcon:
; Spritemap 17h: debug elevator icon
    dw $0001
    %spritemapEntry(0, $01, $00, 0, 0, 2, 0, $8F)

MenuSpritemap_C_DebugSaveIcon:
; Spritemap Ch: debug save icon
    dw $0001
    %spritemapEntry(0, $01, $00, 0, 0, 2, 0, $1F4)

MenuSpritemap_D:
; Spritemap Dh: unused
    dw $0001
    %spritemapEntry(0, $01, $00, 0, 0, 2, 0, $1F1)

MenuSpritemap_E:
; Spritemap Eh: unused
    dw $0001
    %spritemapEntry(0, $01, $00, 0, 0, 2, 0, $1F3)

MenuSpritemap_F:
; Spritemap Fh: unused
    dw $0001
    %spritemapEntry(0, $01, $00, 0, 0, 2, 0, $1F2)

MenuSpritemap_18:
; Spritemap 18h: unused
    dw $0001
    %spritemapEntry(0, $01, $00, 0, 0, 2, 0, $1F6)

MenuSpritemap_Unknown_82C3D2:
; Unused
    dw $0001
    %spritemapEntry(0, $01, $00, 0, 0, 2, 0, $1F5)

MenuSpritemap_20_EmptyEquipmentScreenReserveTank:
; Spritemap 20h: empty equipment screen reserve tank
    dw $0001
    %spritemapEntry(0, $00, $00, 0, 0, 3, 2, $4D)

MenuSpritemap_21_EquipmentScreen_1_7_ReserveTank:
; Spritemap 21h: equipment screen 1/7 reserve tank
    dw $0001
    %spritemapEntry(0, $00, $00, 0, 0, 3, 2, $47)

MenuSpritemap_22_EquipmentScreen_2_7_ReserveTank:
; Spritemap 22h: equipment screen 2/7 reserve tank
    dw $0001
    %spritemapEntry(0, $00, $00, 0, 0, 3, 2, $48)

MenuSpritemap_23_EquipmentScreen_3_7_ReserveTank:
; Spritemap 23h: equipment screen 3/7 reserve tank
    dw $0001
    %spritemapEntry(0, $00, $00, 0, 0, 3, 2, $49)

MenuSpritemap_24_EquipmentScreen_4_7_ReserveTank:
; Spritemap 24h: equipment screen 4/7 reserve tank
    dw $0001
    %spritemapEntry(0, $00, $00, 0, 0, 3, 2, $4A)

MenuSpritemap_25_EquipmentScreen_5_7_ReserveTank:
; Spritemap 25h: equipment screen 5/7 reserve tank
    dw $0001
    %spritemapEntry(0, $00, $00, 0, 0, 3, 2, $4B)

MenuSpritemap_26_EquipmentScreen_6_7_ReserveTank:
; Spritemap 26h: equipment screen 6/7 reserve tank
    dw $0001
    %spritemapEntry(0, $00, $00, 0, 0, 3, 2, $4C)

MenuSpritemap_27_EquipmentScreen_7_7_ReserveTank:
; Spritemap 27h: equipment screen 7/7 reserve tank
    dw $0001
    %spritemapEntry(0, $00, $00, 0, 0, 3, 2, $4E)

MenuSpritemap_4F:
; Spritemap 4Fh: unused
    dw $0001
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $64)

MenuSpritemap_50:
; Spritemap 50h: unused
    dw $0001
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $65)

MenuSpritemap_51:
; Spritemap 51h: unused
    dw $0001
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $66)

MenuSpritemap_52:
; Spritemap 52h: unused
    dw $0001
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $67)

MenuSpritemap_53:
; Spritemap 53h: unused
    dw $0001
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $68)

MenuSpritemap_54:
; Spritemap 54h: unused
    dw $0001
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $69)

MenuSpritemap_55:
; Spritemap 55h: unused
    dw $0001
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $6A)

MenuSpritemap_56:
; Spritemap 56h: unused
    dw $0001
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $6B)

MenuSpritemap_57:
; Spritemap 57h: unused
    dw $0001
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $6C)

MenuSpritemap_58:
; Spritemap 58h: unused
    dw $0001
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $6D)

MenuSpritemap_Unknown_82C457:
; Unused
    dw $0001
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $6E)

MenuSpritemap_Unknown_82C45E:
; Unused
    dw $0001
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $6F)

MenuSpritemap_2A_L_R_Highlight:
; Spritemap 2Ah: L/R highlight
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
; Spritemap 28h: L button pressed highlight
    dw $0003
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 2, $29)
    %spritemapEntry(0, $04, $FC, 0, 0, 3, 2, $2A)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 3, 2, $28)

MenuSpritemap_29_RButtonPressedHighlight:
; Spritemap 29h: R button pressed highlight
    dw $0003
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 2, $2E)
    %spritemapEntry(0, $04, $FC, 0, 0, 3, 2, $2A)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 3, 2, $28)

MenuSpritemap_2B_StartButtonPressedHighlight:
; Spritemap 2Bh: start button pressed highlight
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
; Spritemap 59h: elevator destination - Crateria
    dw $0004
    %spritemapEntry(0, $10, $F8, 0, 0, 2, 0, $03)
    %spritemapEntry(0, $08, $F8, 0, 0, 2, 0, $02)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $01)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $00)

MenuSpritemap_5A_ElevatorDestination_Brinstar:
; Spritemap 5Ah: elevator destination - Brinstar
    dw $0004
    %spritemapEntry(0, $10, $F8, 0, 0, 2, 0, $07)
    %spritemapEntry(0, $08, $F8, 0, 0, 2, 0, $06)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $05)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $04)

MenuSpritemap_5B_ElevatorDestination_Norfair:
; Spritemap 5Bh: elevator destination - Norfair
    dw $0004
    %spritemapEntry(0, $10, $F8, 0, 0, 2, 0, $14)
    %spritemapEntry(0, $08, $F8, 0, 0, 2, 0, $13)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $12)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $10)

MenuSpritemap_5E_ElevatorDestination_Tourian:
; Spritemap 5Eh: elevator destination - Tourian
    dw $0004
    %spritemapEntry(0, $10, $F8, 0, 0, 2, 0, $32)
    %spritemapEntry(0, $08, $F8, 0, 0, 2, 0, $20)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $09)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $08)

MenuSpritemap_5D_ElevatorDestination_Maridia:
; Spritemap 5Dh: elevator destination - Maridia
    dw $0004
    %spritemapEntry(0, $10, $F8, 0, 0, 2, 0, $19)
    %spritemapEntry(0, $08, $F8, 0, 0, 2, 0, $18)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $16)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $15)

MenuSpritemap_5C_ElevatorDestination_WreckedShip:
; Spritemap 5Ch: elevator destination - Wrecked Ship
    dw $0006
    %spritemapEntry(0, $04, $00, 0, 0, 2, 0, $45)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 0, $44)
    %spritemapEntry(0, $0C, $F8, 0, 0, 2, 0, $56)
    %spritemapEntry(0, $04, $F8, 0, 0, 2, 0, $55)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 0, $54)
    %spritemapEntry(0, $1F4, $F8, 0, 0, 2, 0, $53)


;;; $C569: Menu / pause menu spritemap pointers ;;;
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
    dw MenuSpritemap_13
    dw MenuSpritemap_14_EquipmentScreenItemSelector_Tanks
    dw MenuSpritemap_15_EquipmentScreenItemSelector_Weapons
    dw MenuSpritemap_16_EquipmentScreenItemSelector_SuitMiscBoots
    dw MenuSpritemap_17_DebugElevatorIcon
    dw MenuSpritemap_18
    dw MenuSpritemap_19
    dw MenuSpritemap_1A_1F_EndOfEquipmentScreenReserveHealthBar
    dw MenuSpritemap_1B_FullEquipmentScreenReserveTank
    dw MenuSpritemap_1C
    dw MenuSpritemap_1D_FullEquipmentScreenReserveHealthBar
    dw MenuSpritemap_1E
    dw MenuSpritemap_1A_1F_EndOfEquipmentScreenReserveHealthBar
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
    dw UNUSED_TitleMenuSpritemaps_3F_82CD67
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


;;; $C639: Dummy Samus wireframe tilemap ;;;
Dummy_Samus_Wireframe_Tilemap:
; Doubt this is needed
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


;;; $C749: Area select spritemap base index ;;;
AreaSelect_SpritemapBaseIndex:
    dw $0038


if !FEATURE_KEEP_UNREFERENCED
;;; $C74B: Unused. D-pad icon spritemap index? ;;;
UNUSED_DPadIcon_SpritemapIndex:
    dw $0044
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C74D: Map elevator destinations ;;;
Map_Elevator_Destinations:
; Spritemap indices:
;     $59: Crateria
;     $5A: Brinstar
;     $5B: Norfair
;     $5C: Wrecked Ship
;     $5D: Maridia
;     $5E: Tourian (unused)
    dw Map_Elevator_Destinations_crateria
    dw Map_Elevator_Destinations_brinstar
    dw Map_Elevator_Destinations_norfair
    dw Map_Elevator_Destinations_wreckedShip
    dw Map_Elevator_Destinations_maridia
    dw Map_Elevator_Destinations_tourian

;        _______________ X position
;       |      _________ Y position
;       |     |      ___ Spritemap index
;       |     |     |
  .crateria:
    dw $0030,$0070,$005A
    dw $00B8,$00B8,$005A
    dw $0110,$0068,$005A
    dw $0178,$0020,$005C
    dw $01A0,$0080,$005D
    dw $FFFF
  .brinstar:
    dw $0048,$0008,$0059
    dw $00D0,$0040,$0059
    dw $0128,$0020,$0059
    dw $0140,$0090,$005D
    dw $0148,$00C0,$005B
    dw $FFFF
  .norfair:
    dw $0050,$0008,$005A
    dw $FFFF
  .wreckedShip:
    dw $0040,$0080,$0059
    dw $00C0,$0080,$0059
    dw $FFFF
  .maridia:
    dw $0108,$0008,$0059
    dw $0030,$00A0,$005A
    dw $0078,$00A0,$005A
    dw $FFFF
  .tourian:
    dw $0098,$0048,$0059
    dw $FFFF


;;; $C7CB: Map icon positions table ;;;
MapIcon_PositionTablePointers:
  .bossIcons:
    dw Crateria_MapIconPositions_bossIcons                               ; Crateria
    dw Brinstar_MapIconPositions_bossIcons                               ; Brinstar
    dw Norfair_MapIconPositions_bossIcons                                ; Norfair
    dw WreckedShip_MapIconPositions_bossIcons                            ; Wrecked Ship
    dw Maridia_MapIconPositions_bossIcons                                ; Maridia
    dw $0000                                                             ; Tourian
    dw Ceres_MapIconPositions_bossIcons                                  ; Ceres
    dw $0000                                                             ; Debug

  .missileStations:
    dw $0000                                                             ; Crateria
    dw Brinstar_MapIconPositions_missileStations                         ; Brinstar
    dw $0000                                                             ; Norfair
    dw $0000                                                             ; Wrecked Ship
    dw Maridia_MapIconPositions_missileStations                          ; Maridia
    dw $0000                                                             ; Tourian
    dw $0000                                                             ; Ceres
    dw $0000                                                             ; Debug

  .energyStations:
    dw $0000                                                             ; Crateria
    dw Brinstar_MapIconPositions_energyStations                          ; Brinstar
    dw Norfair_MapIconPositions_energyStations                           ; Norfair
    dw $0000                                                             ; Wrecked Ship
    dw Maridia_MapIconPositions_energyStations                           ; Maridia
    dw Tourian_MapIconPositions_energyStations                           ; Tourian
    dw $0000                                                             ; Ceres
    dw $0000                                                             ; Debug

  .mapStations:
    dw Crateria_MapIconPositions_mapStations                             ; Crateria
    dw Brinstar_MapIconPositions_mapStations                             ; Brinstar
    dw Norfair_MapIconPositions_mapStations                              ; Norfair
    dw WreckedShip_MapIconPositions_mapStations                          ; Wrecked Ship
    dw Maridia_MapIconPositions_mapStations                              ; Maridia
    dw Tourian_MapIconPositions_mapStations                              ; Tourian
    dw $0000                                                             ; Ceres
    dw $0000                                                             ; Debug

  .savePoints:
    dw Crateria_MapIconPositions_savePoints                              ; Crateria
    dw Brinstar_MapIconPositions_savePoints                              ; Brinstar
    dw Norfair_MapIconPositions_savePoints                               ; Norfair
    dw WreckedShip_MapIconPositions_savePoints                           ; Wrecked Ship
    dw Maridia_MapIconPositions_savePoints                               ; Maridia
    dw Tourian_MapIconPositions_savePoints                               ; Tourian
    dw $0000                                                             ; Ceres
    dw $0000                                                             ; Debug

  .debugElevatorMarkers:
    dw Crateria_MapIconPositions_debugElevatorMarkers                    ; Crateria
    dw Brinstar_MapIconPositions_debugElevatorMarkers                    ; Brinstar
    dw Norfair_MapIconPositions_debugElevatorMarkers                     ; Norfair
    dw WreckedShip_MapIconPositions_debugElevatorMarkers                 ; Wrecked Ship
    dw Maridia_MapIconPositions_debugElevatorMarkers                     ; Maridia
    dw Tourian_MapIconPositions_debugElevatorMarkers                     ; Tourian
    dw $0000                                                             ; Ceres
    dw $0000                                                             ; Debug

  .debugSavePoints:
    dw Crateria_MapIconPositions_debugSavePoints                         ; Crateria
    dw Brinstar_MapIconPositions_debugSaveStations                       ; Brinstar
    dw Norfair_MapIconPositions_debugSavePoints                          ; Norfair
    dw WreckedShip_MapIconPositions_debugSavePoints                      ; Wrecked Ship
    dw Maridia_MapIconPositions_debugSavePoints                          ; Maridia
    dw Tourian_MapIconPositions_debugSavePoints                          ; Tourian
    dw $0000                                                             ; Ceres
    dw $0000                                                             ; Debug


;;; $C83B: Crateria map icon positions ;;;
Crateria_MapIconPositions:
  .bossIcons:
    dw $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE, $FFFF
  .missileStations:
    dw $FFFF
  .energyStations:
    dw $FFFF
  .mapStations:
    dw $00B8,$0040, $FFFF
  .savePoints:
    dw $00D8
  .savePoints2:
    dw $0028,$0090, $0038,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE
    dw $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE
  .debugElevatorMarkers:
    dw $01A0,$0058, $0110,$0040, $00B8,$0090, $0030,$0048
    dw $0088,$0050, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE
  .debugSavePoints:
    dw $00D8,$0028, $0188,$0028, $FFFF


;;; $C89D: Brinstar map icon positions ;;;
Brinstar_MapIconPositions:
  .bossIcons:
    dw $01BC,$009C, $FFFF
  .missileStations:
    dw $0028,$0040, $FFFF
  .energyStations:
    dw $0048,$0068, $0100,$0098, $01B0,$0098, $FFFF
  .mapStations:
    dw $0028,$0028, $FFFF
  .savePoints:
    dw $0078,$0028, $0040,$0030, $0028,$0060, $0188,$0098
    dw $0130,$0048, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE
  .debugElevatorMarkers:
    dw $0048,$0018, $00D0,$0058, $0128,$0038, $0148,$0098
    dw $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE
  .debugSaveStations:
    dw $0048,$0018, $01B8,$00A0, $0090,$0020, $FFFF


;;; $C90B: Norfair map icon positions ;;;
Norfair_MapIconPositions:
  .bossIcons:
    dw $00B8,$0090, $FFFF
  .missileStations:
    dw $FFFF
  .energyStations:
    dw $00A0,$0050, $00A8,$0080,$FFFF
  .mapStations:
    dw $0048,$0028, $FFFF
  .savePoints:
    dw $0060,$0060, $00A8,$0020, $0058,$0030, $0080,$0048
    dw $00A0,$0058, $0120,$0068, $FFFE,$FFFE, $FFFE,$FFFE
  .debugElevatorMarkers:
    dw $0050,$0018, $00A8,$0058, $00A8,$0070, $FFFE,$FFFE
    dw $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE
  .debugSavePoints:
    dw $0050,$0010, $0078,$0050, $00B0,$0088, $0050,$0058
    dw $00A8,$0070, $00A0,$0080, $0010,$0008, $FFFF


;;; $C981: Wrecked Ship map icon positions ;;;
WreckedShip_MapIconPositions:
  .bossIcons:
    dw $0098,$00A0, $FFFF
  .missileStations:
    dw $FFFF
  .energyStations:
    dw $FFFF
  .mapStations:
    dw $0068,$00A0, $FFFF
  .savePoints:
    dw $0088,$0078, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE
    dw $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE
  .debugElevatorMarkers:
    dw $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE
    dw $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE
  .debugSavePoints:
    dw $0050,$0078, $0090,$00A0, $FFFF


;;; $C9DB: Maridia map icon positions ;;;
Maridia_MapIconPositions:
  .bossIcons:
    dw $013C,$0054, $FFFF
  .missileStations:
    dw $0130,$0048, $FFFF
  .energyStations:
    dw $0150,$0038, $FFFF
  .mapStations:
    dw $0088,$0090, $FFFF
  .savePoints:
    dw $0060,$00A0, $0118,$0028, $0098,$0060, $0148,$0038
    dw $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE
  .debugElevatorMarkers:
    dw $0110,$0018, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE
    dw $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE
  .debugSavePoints:
    dw $0090,$0028, $0148,$0050, $00B8,$0048, $00B0,$0088
    dw $FFFF


;;; $CA45: Tourian map icon positions ;;;
Tourian_MapIconPositions:
  .bossIcons:
    dw $FFFF
  .missileStations:
    dw $FFFF
  .energyStations:
    dw $0058,$0088, $FFFF
  .mapStations:
    dw $FFFF
  .savePoints:
    dw $0080,$0090, $00A8,$0068, $FFFE,$FFFE, $FFFE,$FFFE
    dw $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE
  .debugElevatorMarkers:
    dw $00A0,$0060, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE
    dw $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE
  .debugSavePoints:
    dw $0088,$0050, $0068,$00C0, $FFFF


;;; $CA9B: Ceres map icon positions ;;;
Ceres_MapIconPositions:
  .bossIcons:
    dw $00A0,$0088, $FFFF
  .missileStations:
    dw $FFFF
  .energyStations:
    dw $FFFF
  .mapStations:
    dw $FFFF
  .savePoints:
    dw $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE
    dw $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE
  .debugElevatorMarkers:
    dw $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE
    dw $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE
  .debugSavePoints:
    dw $FFFF


;;; $CAE9: Menu spritemaps ;;;
TitleMenuSpritemaps_2C_FileSelectMenu_SamusHelmet_0:
; See $81:8A5F for spritemap format
; Spritemap 2Ch: file select menu Samus helmet (frame 0)
    dw $0004
    %spritemapEntry(1, $43FC, $F4, 0, 0, 3, 7, $D1)
    %spritemapEntry(1, $43FC, $FC, 0, 0, 3, 7, $E1)
    %spritemapEntry(1, $43F4, $FC, 0, 0, 3, 7, $E0)
    %spritemapEntry(1, $43F4, $F4, 0, 0, 3, 7, $D0)

TitleMenuSpritemaps_2D_FileSelectMenu_SamusHelmet_1:
; Spritemap 2Dh: file select menu Samus helmet (frame 1)
    dw $0004
    %spritemapEntry(1, $43F4, $FC, 0, 0, 3, 7, $E3)
    %spritemapEntry(1, $43F4, $F4, 0, 0, 3, 7, $D3)
    %spritemapEntry(1, $43FC, $F4, 0, 0, 3, 7, $D4)
    %spritemapEntry(1, $43FC, $FC, 0, 0, 3, 7, $E4)

TitleMenuSpritemaps_2E_FileSelectMenu_SamusHelmet_2:
; Spritemap 2Eh: file select menu Samus helmet (frame 2)
    dw $0004
    %spritemapEntry(1, $43FC, $F4, 0, 0, 3, 7, $D7)
    %spritemapEntry(1, $43F4, $F4, 0, 0, 3, 7, $D6)
    %spritemapEntry(1, $43F4, $FC, 0, 0, 3, 7, $E6)
    %spritemapEntry(1, $43FC, $FC, 0, 0, 3, 7, $E7)

TitleMenuSpritemaps_2F_FileSelectMenu_SamusHelmet_3:
; Spritemap 2Fh: file select menu Samus helmet (frame 3)
    dw $0006
    %spritemapEntry(0, $00, $FE, 0, 0, 3, 7, $DA)
    %spritemapEntry(0, $1F8, $FE, 0, 0, 3, 7, $D9)
    %spritemapEntry(1, $43FC, $F4, 0, 0, 3, 7, $D7)
    %spritemapEntry(1, $43F4, $F4, 0, 0, 3, 7, $D6)
    %spritemapEntry(1, $43F4, $FC, 0, 0, 3, 7, $E6)
    %spritemapEntry(1, $43FC, $FC, 0, 0, 3, 7, $E7)

TitleMenuSpritemaps_30_FileSelectMenu_SamusHelmet_4:
; Spritemap 30h: file select menu Samus helmet (frame 4)
    dw $0006
    %spritemapEntry(0, $00, $FE, 0, 0, 3, 7, $DC)
    %spritemapEntry(0, $1F8, $FE, 0, 0, 3, 7, $DB)
    %spritemapEntry(1, $43FC, $F4, 0, 0, 3, 7, $D7)
    %spritemapEntry(1, $43F4, $F4, 0, 0, 3, 7, $D6)
    %spritemapEntry(1, $43F4, $FC, 0, 0, 3, 7, $E6)
    %spritemapEntry(1, $43FC, $FC, 0, 0, 3, 7, $E7)

TitleMenuSpritemaps_31_FileSelectMenu_SamusHelmet_5:
; Spritemap 31h: file select menu Samus helmet (frame 5)
    dw $0006
    %spritemapEntry(0, $00, $FE, 0, 0, 3, 7, $DE)
    %spritemapEntry(0, $1F8, $FE, 0, 0, 3, 7, $DD)
    %spritemapEntry(1, $43FC, $F4, 0, 0, 3, 7, $D7)
    %spritemapEntry(1, $43F4, $F4, 0, 0, 3, 7, $D6)
    %spritemapEntry(1, $43F4, $FC, 0, 0, 3, 7, $E6)
    %spritemapEntry(1, $43FC, $FC, 0, 0, 3, 7, $E7)

TitleMenuSpritemaps_32_FileSelectMenu_SamusHelmet_6:
; Spritemap 32h: file select menu Samus helmet (frame 6)
    dw $0006
    %spritemapEntry(0, $00, $FE, 0, 0, 3, 7, $EA)
    %spritemapEntry(0, $1F8, $FE, 0, 0, 3, 7, $E9)
    %spritemapEntry(1, $43FC, $F4, 0, 0, 3, 7, $D7)
    %spritemapEntry(1, $43F4, $F4, 0, 0, 3, 7, $D6)
    %spritemapEntry(1, $43F4, $FC, 0, 0, 3, 7, $E6)
    %spritemapEntry(1, $43FC, $FC, 0, 0, 3, 7, $E7)

TitleMenuSpritemaps_33_FileSelectMenu_SamusHelmet_7:
; Spritemap 33h: file select menu Samus helmet (frame 7)
    dw $0006
    %spritemapEntry(0, $00, $FE, 0, 0, 3, 7, $EC)
    %spritemapEntry(0, $1F8, $FE, 0, 0, 3, 7, $EB)
    %spritemapEntry(1, $43FC, $F4, 0, 0, 3, 7, $D7)
    %spritemapEntry(1, $43F4, $F4, 0, 0, 3, 7, $D6)
    %spritemapEntry(1, $43F4, $FC, 0, 0, 3, 7, $E6)
    %spritemapEntry(1, $43FC, $FC, 0, 0, 3, 7, $E7)

TitleMenuSpritemaps_34_MenuSelectionMissile_0:
; Spritemap 34h: menu selection missile (frame 0)
    dw $0002
    %spritemapEntry(0, $00, $FC, 0, 0, 3, 7, $EF)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 7, $DF)

TitleMenuSpritemaps_35_MenuSelectionMissile_1:
; Spritemap 35h: menu selection missile (frame 1)
    dw $0002
    %spritemapEntry(0, $00, $FC, 0, 0, 3, 7, $FF)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 7, $EE)

TitleMenuSpritemaps_36_MenuSelectionMissile_2:
; Spritemap 36h: menu selection missile (frame 2)
    dw $0002
    %spritemapEntry(0, $00, $FC, 0, 0, 3, 7, $CC)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 7, $FE)

TitleMenuSpritemaps_37_MenuSelectionMissile_3:
; Spritemap 37h: menu selection missile (frame 3)
    dw $0002
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 7, $C8)
    %spritemapEntry(0, $00, $FC, 0, 0, 3, 7, $FF)

TitleMenuSpritemaps_38_AreaSelect_PlanetZebes:
; Spritemap 38h: area select - planet Zebes
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
; Spritemap 39h: area select - Crateria
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
; Spritemap 3Ah: area select - Brinstar
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
; Spritemap 3Bh: area select - Norfair
    dw $0007
    %spritemapEntry(0, $14, $FC, 0, 0, 3, 0, $7B)
    %spritemapEntry(0, $0C, $FC, 0, 0, 3, 0, $72)
    %spritemapEntry(0, $05, $FC, 0, 0, 3, 0, $6A)
    %spritemapEntry(0, $1FD, $FC, 0, 0, 3, 0, $6F)
    %spritemapEntry(0, $1F5, $FC, 0, 0, 3, 0, $7B)
    %spritemapEntry(0, $1ED, $FC, 0, 0, 3, 0, $78)
    %spritemapEntry(0, $1E5, $FC, 0, 0, 3, 0, $77)

TitleMenuSpritemaps_3E_AreaSelect_Tourian:
; Spritemap 3Eh: area select - Tourian
    dw $0007
    %spritemapEntry(0, $13, $FC, 0, 0, 3, 0, $77)
    %spritemapEntry(0, $0A, $FC, 0, 0, 3, 0, $6A)
    %spritemapEntry(0, $03, $FC, 0, 0, 3, 0, $72)
    %spritemapEntry(0, $1FD, $FC, 0, 0, 3, 0, $7B)
    %spritemapEntry(0, $1F5, $FC, 0, 0, 3, 0, $7E)
    %spritemapEntry(0, $1ED, $FC, 0, 0, 3, 0, $78)
    %spritemapEntry(0, $1E6, $FC, 0, 0, 3, 0, $7D)

TitleMenuSpritemaps_3D_AreaSelect_Maridia:
; Spritemap 3Dh: area select - Maridia
    dw $0007
    %spritemapEntry(0, $13, $FC, 0, 0, 3, 0, $6A)
    %spritemapEntry(0, $0B, $FC, 0, 0, 3, 0, $72)
    %spritemapEntry(0, $04, $FC, 0, 0, 3, 0, $6D)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $72)
    %spritemapEntry(0, $1F6, $FC, 0, 0, 3, 0, $7B)
    %spritemapEntry(0, $1EE, $FC, 0, 0, 3, 0, $6A)
    %spritemapEntry(0, $1E6, $FC, 0, 0, 3, 0, $76)

TitleMenuSpritemaps_3C_AreaSelect_WreckedShip:
; Spritemap 3Ch: area select - Wrecked Ship
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

UNUSED_TitleMenuSpritemaps_3F_82CD67:
; Spritemap 3Fh: unused. Border for four character text
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
; Spritemap 40h: file copy arrow - one slot down
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
; Spritemap 41h: file copy arrow - one slot up
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
; Spritemap 42h: file copy arrow - two slots down
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
; Spritemap 43h: file copy arrow - two slots up
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
; Spritemap 44h: unused. D-pad (according to $B6:C000 tiles)
    dw $0004
    %spritemapEntry(0, $1FF, $FF, 1, 1, 3, 0, $B3)
    %spritemapEntry(0, $1F8, $FF, 1, 0, 3, 0, $B3)
    %spritemapEntry(0, $1FF, $F8, 0, 1, 3, 0, $B3)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $B3)

TitleMenuSpritemaps_45:
; Spritemap 45h: unused. Select button (according to $B6:C000 tiles)
    dw $0002
    %spritemapEntry(1, $43F4, $F8, 0, 0, 3, 0, $95)
    %spritemapEntry(1, $43FC, $F8, 0, 0, 3, 0, $96)

TitleMenuSpritemaps_46:
; Spritemap 46h: unused
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $91)

TitleMenuSpritemaps_47:
; Spritemap 47h: unused
    dw $0004
    %spritemapEntry(0, $00, $00, 0, 1, 3, 0, $A0)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 0, $90)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 0, $A0)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $90)

TitleMenuSpritemaps_5F_SamusPositionIndicator_0:
; Spritemap 5Fh: Samus position indicator (frame 0)
    dw $0004
    %spritemapEntry(0, $04, $04, 1, 1, 2, 7, $AF)
    %spritemapEntry(0, $1FC, $04, 1, 0, 2, 7, $AF)
    %spritemapEntry(0, $04, $FC, 0, 1, 2, 7, $AF)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 7, $AF)

TitleMenuSpritemaps_5F_SamusPositionIndicator_1:
; Spritemap 60h: Samus position indicator (frame 1)
    dw $0004
    %spritemapEntry(0, $05, $05, 1, 1, 2, 7, $AF)
    %spritemapEntry(0, $1FB, $05, 1, 0, 2, 7, $AF)
    %spritemapEntry(0, $05, $FB, 0, 1, 2, 7, $AF)
    %spritemapEntry(0, $1FB, $FB, 0, 0, 2, 7, $AF)

TitleMenuSpritemaps_5F_SamusPositionIndicator_2:
; Spritemap 61h: Samus position indicator (frame 2)
    dw $0004
    %spritemapEntry(0, $06, $06, 1, 1, 2, 7, $AF)
    %spritemapEntry(0, $1FA, $06, 1, 0, 2, 7, $AF)
    %spritemapEntry(0, $06, $FA, 0, 1, 2, 7, $AF)
    %spritemapEntry(0, $1FA, $FA, 0, 0, 2, 7, $AF)

TitleMenuSpritemaps_62_BossCrossOutIcon:
; Spritemap 62h: boss cross-out icon
    dw $0004
    %spritemapEntry(0, $03, $04, 1, 1, 2, 7, $9F)
    %spritemapEntry(0, $03, $FC, 0, 1, 2, 7, $9F)
    %spritemapEntry(0, $1FC, $04, 1, 0, 2, 7, $9F)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 7, $9F)

TitleMenuSpritemaps_63_GunshipIcon:
; Spritemap 63h: gunship icon
    dw $0002
    %spritemapEntry(0, $04, $FE, 0, 1, 2, 7, $8F)
    %spritemapEntry(0, $1FC, $FE, 0, 0, 2, 7, $8F)

TitleMenuSpritemaps_64_GameOverBabyMetroidContainer:
; Spritemap 64h: game over baby metroid container
    dw $0004
    %spritemapEntry(0, $00, $08, 1, 1, 3, 5, $9A)
    %spritemapEntry(0, $1F8, $08, 1, 0, 3, 5, $9A)
    %spritemapEntry(0, $00, $F0, 0, 1, 3, 5, $9A)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 3, 5, $9A)

TitleMenuSpritemaps_65_GameOverBabyMetroid_0:
; Spritemap 65h: game over baby metroid (frame 0)
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 4, $90)

TitleMenuSpritemaps_66_GameOverBabyMetroid_1:
; Spritemap 66h: game over baby metroid (frame 1)
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 4, $92)

TitleMenuSpritemaps_67_GameOverBabyMetroid_2:
; Spritemap 67h: game over baby metroid (frame 2)
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 4, $9B)

TitleMenuSpritemaps_48_BorderAround_SAMUS_DATA:
; Spritemap 48h: border around SAMUS DATA
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
; Spritemap 49h: border around DATA COPY MODE
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
; Spritemap 4Ah: border around DATA CLEAR MODE
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
; Spritemap 4Bh: border around OPTION MODE
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
; Spritemap 4Ch: border around CONTROLLER SETTING MODE
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
; Spritemap 4Dh: border around SPECIAL SETTING MODE
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


;;; $D521: Power suit ;;;
Samus_Wireframe_Tilemaps:
  .powerSuit:
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


;;; $D631: Hi-jump boots ;;;
  .hiJumpBoots:
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


;;; $D741: Varia suit ;;;
  .variaSuit:
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


;;; $D851: Hi-jump boots + varia suit ;;;
  .hiJumpBootsVariaSuit:
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


;;; $D961: Advance gradual colour change of all palettes - denominator = Ch ;;;
Advance_GradualColorChange_ofAllPalettes_Denominator_C:
;; Returns:
;;     Carry: Set if reached target colour, clear otherwise
    LDA.W #$000C : STA.L PaletteChangeDenominator
    JSR Advance_GradualColorChange_ofAllPalettes
    RTS


;;; $D96C: Advance gradual colour change of BG palette 6 ;;;
Advance_GradualColorChange_ofBGPalette6:
;; Returns:
;;     Carry: Set if reached target colour, clear otherwise

; Called by Kraid when fading in the background
    REP #$30
    LDA.W #$000C : STA.L PaletteChangeDenominator
    INC : CMP.L PaletteChangeNumerator : BCS .advance
    LDA.W #$0000 : STA.L PaletteChangeNumerator
    SEC
    RTL

  .advance:
    PHB
    PEA $7E7E : PLB : PLB
    LDX.W #$00C0

  .loop:
    PHX
    LDA.L TargetPalettes_BGP0,X : TAY
    LDA.L Palettes,X : TAX
    LDA.L PaletteChangeNumerator
    JSR CalculateTheAth_TransitionalColor_fromXtoY
    PLX
    STA.L Palettes,X
    INX #2 : CPX.W #$00E0 : BCC .loop
    PLB
    LDA.L PaletteChangeNumerator : INC : STA.L PaletteChangeNumerator
    CLC
    RTL


;;; $D9B8: Advance gradual colour change of palette RAM [X]..[Y]-1 ;;;
Advance_GradualColorChange_ofPaletteRAM:
;; Returns:
;;     Carry: Set if reached target colour, clear otherwise
    REP #$30
    LDA.W #$000F : STA.L PaletteChangeDenominator : CMP.L PaletteChangeNumerator : BPL .advance
    LDA.W #$0000 : STA.L PaletteChangeNumerator
    SEC
    RTL

  .advance:
    STY.B DP_Temp22
    PHB
    PEA $7E7E : PLB : PLB

  .loop:
    PHX
    LDA.L TargetPalettes_BGP0,X : TAY
    LDA.L Palettes,X : TAX
    LDA.L PaletteChangeNumerator : INC
    JSR CalculateTheAth_TransitionalColor_fromXtoY
    PLX
    STA.L Palettes,X
    INX #2 : CPX.B DP_Temp22 : BCC .loop
    PLB
    LDA.L PaletteChangeNumerator : INC : STA.L PaletteChangeNumerator
    CLC
    RTL


;;; $DA02: Advance gradual colour change of all palettes ;;;
Advance_GradualColorChange_ofAllPalettes:
;; Returns:
;;     Carry: Set if reached target colour, clear otherwise
    REP #$30
    LDA.L PaletteChangeDenominator : INC : CMP.L PaletteChangeNumerator : BCS .advance
    LDA.W #$0000 : STA.L PaletteChangeNumerator
    SEC
    RTS

  .advance:
    PHB
    PEA $7E7E : PLB : PLB
    LDX.W #$0000

  .loop:
    STX.W ColorIndexInPaletteChangeRoutines
    LDA.W TargetPalettes_BGP0,X : CMP.W Palettes,X : BEQ .next
    TAY
    LDA.W Palettes,X : TAX
    LDA.W PaletteChangeNumerator
    JSR CalculateTheAth_TransitionalColor_fromXtoY
    LDX.W ColorIndexInPaletteChangeRoutines
    STA.W Palettes,X

  .next:
    INX #2 : CPX.W #$0200 : BCC .loop
    INC.W PaletteChangeNumerator
    PLB
    CLC
    RTS


;;; $DA4A: Calculate the [A]th transitional colour from [X] to [Y] ;;;
CalculateTheAth_TransitionalColor_fromXtoY:
;; Parameters:
;;     A: Palette change numerator
;;     X: Current transitional colour
;;     Y: Target colour
;; Returns:
;;     A: Next transitional colour

; After pushes, we have:
;     $01 + [S]: Target colour
;     $03 + [S]: Current transitional colour
;     $05 + [S]: Palette change numerator
;     $07 + [S]: Next transitional colour
    PHA : PHA : PHX : PHY
    LDA.B $01,S : AND.W #$001F : TAY
    LDA.B $03,S : AND.W #$001F : TAX
    LDA.B $05,S
    JSR CalculateTheAth_TransitionalColorComponent_fromXtoY
    STA.B $07,S
    LDA.B $01,S : ASL #3 : XBA : AND.W #$001F : TAY
    LDA.B $03,S : ASL #3 : XBA : AND.W #$001F : TAX
    LDA.B $05,S
    JSR CalculateTheAth_TransitionalColorComponent_fromXtoY
    ASL #5 : ORA.B $07,S : STA.B $07,S
    LDA.B $01,S : LSR #2 : XBA : AND.W #$001F : TAY
    LDA.B $03,S : LSR #2 : XBA : AND.W #$001F : TAX
    LDA.B $05,S
    JSR CalculateTheAth_TransitionalColorComponent_fromXtoY
    ASL #2 : XBA : ORA.B $07,S : STA.B $07,S
    PLY : PLX : PLA : PLA
    RTS


;;; $DAA6: Calculate the [A]th transitional colour component from [X] to [Y] ;;;
CalculateTheAth_TransitionalColorComponent_fromXtoY:
;; Parameters:
;;     A: Palette change numerator
;;     X: Current transitional colour component
;;     Y: Target colour component
;; Returns:
;;     A: Next transitional colour component

; If [A] = 0:
;     A = [X]
; If [A] = [palette change denominator] + 1:
;     A = [Y]
; Otherwise:
;     A = [X] + ([Y] - [X]) / ([palette change denominator] + 1 - [A])

; This routine is designed to be called iteratively with X = (last return value) and incrementing A.
; The resulting equation can be expressed as:
;      c_{t+1} = c_t + (c_{d+1} - c_t) / (d + 1 - t)
; where
;      t = [A]
;      c = [X]
;      c_{d+1} = [Y]
;      d = [palette change denominator]
; Solving this recurrence relation actually gives you:
;     c_t = c_0 + t (c_{d+1} - c_0) / (d + 1)
; which is linear interpolation
    CMP.W #$0000 : BNE .AisNonZero
    TXA
    RTS

  .AisNonZero:
    DEC : CMP.W PaletteChangeDenominator : BNE +
    TYA
    RTS

+   PHX
    INC : STA.B DP_Temp14
    TYA : SEC : SBC.B $01,S : STA.B DP_Temp12 : BPL +
    EOR.W #$FFFF : INC

+   XBA : AND.W #$FF00 : STA.L $004204
    SEP #$21 ; carry set
    LDA.W PaletteChangeDenominator : SBC.B DP_Temp14 : INC : STA.L $004206
    REP #$20
    XBA : XBA : NOP #2
    LDA.L $004214 : BIT.B DP_Temp12 : BPL +
    EOR.W #$FFFF : INC

+   STA.B DP_Temp12
    PLA
    XBA : CLC : ADC.B DP_Temp12 : XBA : AND.W #$00FF
    RTS


;;; $DAF7: Advance gradual colour change of palettes in [A] - denominator = Ch ;;;
Advance_GradualColorChange_ofPalettesInA_Denominator_C:
;; Parameters:
;;     A: Bitset of palettes to advance
;;         {
;;         1: BG palette 0
;;         2: BG palette 1
;;         4: BG palette 2
;;         8: BG palette 3
;;         10h: BG palette 4
;;         20h: BG palette 5
;;         40h: BG palette 6
;;         80h: BG palette 7
;;         100h: Sprite palette 0
;;         200h: Sprite palette 1
;;         400h: Sprite palette 2
;;         800h: Sprite palette 3
;;         1000h: Sprite palette 4
;;         2000h: Sprite palette 5
;;         4000h: Sprite palette 6
;;         8000h: Sprite palette 7
;;         }
;; Returns:
;;     Carry: Set if reached target colour, clear otherwise

; Used by Torizo with sprite palettes 1 and 2
    PHX : PHY : PHB
    PEA $7E7E : PLB : PLB
    LDX.W #$000C : STX.W PaletteChangeDenominator
    JSR Advance_GradualColorChange_ofPalettesInA
    PLB : PLY : PLX
    RTL


;;; $DB0C: Advance gradual colour change of palettes in [A] ;;;
Advance_GradualColorChange_ofPalettesInA:
;; Parameters:
;;     A: Bitset of palettes to advance
       {
;;         1: BG palette 0
;;         2: BG palette 1
;;         4: BG palette 2
;;         8: BG palette 3
;;         10h: BG palette 4
;;         20h: BG palette 5
;;         40h: BG palette 6
;;         80h: BG palette 7
;;         100h: Sprite palette 0
;;         200h: Sprite palette 1
;;         400h: Sprite palette 2
;;         800h: Sprite palette 3
;;         1000h: Sprite palette 4
;;         2000h: Sprite palette 5
;;         4000h: Sprite palette 6
;;         8000h: Sprite palette 7
       }
;; Returns:
;;     Carry: Set if reached target colour, clear otherwise

; DB must be set to $7E
    REP #$30
    PHA
    LDA.W PaletteChangeDenominator : INC : CMP.W PaletteChangeNumerator : BCS +
    LDA.W #$0000 : STA.W PaletteChangeNumerator
    PLA
    SEC
    RTS

+   STZ.W ColorIndexInPaletteChangeRoutines

  .loop:
    PLA : BEQ +
    LSR : PHA : BCS .advance
    LDA.W ColorIndexInPaletteChangeRoutines : ADC.W #$0020 : STA.W ColorIndexInPaletteChangeRoutines
    BRA .loop

  .advance:
    JSR Advance_GradualColorChange_ofPaletteX_DividedBy_20
    BRA .loop

    PLA                                                                  ; dead code (just the PLA)

+   INC.W PaletteChangeNumerator
    CLC
    RTS


;;; $DB41: Advance gradual colour change of palette at colour index ;;;
Advance_GradualColorChange_ofPaletteX_DividedBy_20:
    LDX.W ColorIndexInPaletteChangeRoutines

  .loop:
    LDA.W TargetPalettes_BGP0,X : CMP.W Palettes,X : BEQ .next
    TAY
    LDA.W Palettes,X : TAX
    LDA.W PaletteChangeNumerator
    JSR CalculateTheAth_TransitionalColor_fromXtoY
    LDX.W ColorIndexInPaletteChangeRoutines
    STA.W Palettes,X

  .next:
    INX #2 : STX.W ColorIndexInPaletteChangeRoutines
    TXA : AND.W #$001F : BNE .loop
    RTS


;;; $DB69: Handle Samus running out of health and increment game time ;;;
HandleSamusRunningOutOfEnergy_and_IncrementGameTime:
; The check at .noAutoReserve is the cause of Samus not dying when spamming pause
    PHP
    REP #$30
    LDA.W Energy : BEQ .zeroEnergy
    BPL .tickGameTime

  .zeroEnergy:
    LDA.W ReserveTankMode : BIT.W #$0001 : BEQ .noAutoReserve
    LDA.W ReserveEnergy : BEQ .noAutoReserve
    LDA.W #$8000 : STA.W TimeIsFrozenFlag
    LDA.W #$001B : STA.W GameState
    LDA.W #$001B
    JSL Run_Samus_Command
    BRA .tickGameTime

  .noAutoReserve:
    LDA.W GameState : CMP.W #$0008 : BEQ .normalGameplay
    PLP
    RTS

  .normalGameplay:
    LDA.W #$8000 : STA.W TimeIsFrozenFlag
    LDA.W #$0011
    JSL Run_Samus_Command
    LDA.W #$0013 : STA.W GameState

  .tickGameTime:
    LDA.W IGTFrames : CLC : ADC.W #$0001 : STA.W IGTFrames
    CMP.W #$003C : BMI .checkGameTime
    STZ.W IGTFrames
    LDA.W IGTSeconds : CLC : ADC.W #$0001 : STA.W IGTSeconds
    CMP.W #$003C : BMI .checkGameTime
    STZ.W IGTSeconds
    LDA.W IGTMinutes : CLC : ADC.W #$0001 : STA.W IGTMinutes
    CMP.W #$003C : BMI .checkGameTime
    STZ.W IGTMinutes
    LDA.W IGTHours : CLC : ADC.W #$0001 : STA.W IGTHours

  .checkGameTime:
    LDA.W IGTHours : CMP.W #$0064 : BPL .capGameTime
    PLP
    RTS

  .capGameTime:
    LDA.W #$003B
    STA.W IGTFrames : STA.W IGTSeconds : STA.W IGTMinutes
    LDA.W #$0063 : STA.W IGTHours
    PLP
    RTS


;;; $DC10: Game state 1Bh (reserve tank auto) ;;;
GameState_1B_ReserveTankAuto:
    PHP
    REP #$30
    JSR Reserve_Tank_Auto_Refill
    BCC +
    STZ.W TimeIsFrozenFlag
    LDA.W #$0008 : STA.W GameState
    LDA.W #$0010
    JSL Run_Samus_Command

+   JSR GameState_8_MainGameplay
    JSL Low_Health_Check_external
    PLP
    RTS


;;; $DC31: Reserve tank auto refill ;;;
Reserve_Tank_Auto_Refill:
;; Returns:
;;     Carry: Set if finished refill (i.e. reserve health has been depleted)
    LDA.W ReserveEnergy : BEQ .return
    LDA.W NMI_FrameCounter : BIT.W #$0007 : BNE +
    LDA.W #$002D
    JSL QueueSound_Lib3_Max3

+   LDA.W Energy : CLC : ADC.W #$0001 : STA.W Energy
    CMP.W MaxEnergy : BMI +
    LDA.W MaxEnergy : STA.W Energy
    BRA .zeroReserve

+   LDA.W ReserveEnergy : SEC : SBC.W #$0001 : STA.W ReserveEnergy : BEQ .zeroReserve
    BPL .return
    LDA.W Energy : CLC : ADC.W ReserveEnergy : STA.W Energy

  .zeroReserve:
    STZ.W ReserveEnergy

  .return:
    LDA.W ReserveEnergy : BNE .notDoneRefilling
    SEC
    RTS

  .notDoneRefilling:
    CLC
    RTS


;;; $DC80: Game state 13h (death sequence, start) ;;;
GameState_13_DeathSequence_Start:
    PHP
    REP #$30
    JSR GameState_8_MainGameplay
    LDX.W #$01FE

-   LDA.L Palettes,X : STA.L BackupOfPalettesDuringMenu,X
    DEX #2 : BPL -
    LDX.W #$017E
    LDA.W #$0000

-   STA.L TargetPalettes_BGP0,X
    DEX #2 : BPL -
    LDX.W #$005E
    LDA.W #$0000

-   STA.L TargetPalettes_SpriteP5,X
    DEX #2 : BPL -
    LDX.W #$001E

-   LDA.L Palettes_SpriteP4C0,X : STA.L TargetPalettes_SpriteP4,X
    DEX #2 : BPL -
    LDA.W #$0003 : STA.W DeathAnimation_Timer
    STZ.W DeathAnimation_Index : STZ.W DeathAnimation_Counter : STZ.W DeathAnimation_PreFlashingTimer
    STZ.W SelectedHUDItem : STZ.W AutoCancelHUDItemIndex
    STZ.W SamusInvincibilityTimer : STZ.W SamusKnockbackTimer
    INC.W GameState
    PLP
    RTS


;;; $DCE0: Game state 14h (death sequence, black out surroundings) ;;;
GameState_14_DeathSequence_BlackOutSurroundings:
    PHP
    REP #$30
    JSR GameState_8_MainGameplay
    LDA.W #$0006 : STA.L PaletteChangeDenominator
    JSR Advance_GradualColorChange_ofAllPalettes
    BCS +
    PLP
    RTS

+   JSL Wait_End_VBlank_Clear_HDMA
    JSL DisableHVCounterInterrupts
    STZ.W LayerBlending_DefaultConfig
    STZ.B DP_IRQCmd
    SEP #$20
    STZ.B DP_NextGameplayColorMathA : STZ.B DP_NextGameplayColorMathB
    LDA.B #$10 : STA.B DP_MainScreenLayers
    STZ.B DP_SubScreenLayers : STZ.B DP_WindowAreaMainScreen : STZ.B DP_WindowAreaSubScreen
    LDA.B #$09 : STA.B DP_BGModeSize
    REP #$20
    STZ.W DeathAnimation_Timer : STZ.W ScreenFadeDelay : STZ.W ScreenFadeCounter
    LDX.W #$00FE

-   STZ.W $1A8D,X ; >.< possibly a pre-release address range for menu RAM
    DEX #2 : BPL -
    LDA.W #$0010 : STA.W DeathAnimation_PreFlashingTimer
    LDA.W #$0003 : STA.W DeathAnimation_Timer
    STZ.W DeathAnimation_Index : STZ.W DeathAnimation_Counter
    INC.W GameState
    STZ.W PowerBombExplosionStatus
    LDA.W #$0002
    JSL QueueSound
    LDA.W #$0071
    JSL QueueSound_Lib2_Max15
    LDA.W #$0001
    JSL QueueSound_Lib3_Max15
    LDA.W #$0000
    JSL QueueMusicDataOrTrack_8FrameDelay
    LDA.W #$FF39
    JSL QueueMusicDataOrTrack_8FrameDelay
    LDA.W #$0005
    LDY.W #$000E
    JSL QueueMusicDataOrTrack_YFrameDelay
    PLP
    RTS


;;; $DD71: Game state 15h (death sequence, wait for music) ;;;
GameState_15_DeathSequence_WaitForMusic:
    PHP
    REP #$30
    JSL Draw_Inanimate_Samus
    JSL CheckIfMusicIsQueued
    BCS .reutrn
    JSL SetSamusDeathSequencePose
    INC.W GameState

  .reutrn:
    PLP
    RTS


;;; $DD87: Game state 16h (death sequence, pre-flashing) ;;;
GameState_16_DeathSequence_PreFlashing:
; Death animation pre-flashing timer is initialised to 10h by GameState_14_DeathSequence_BlackOutSurroundings
    PHP
    REP #$30
    JSL Draw_Samus_Starting_Death_Animation_JSL
    DEC.W DeathAnimation_PreFlashingTimer : BEQ +
    BPL .return

+   INC.W GameState

  .return:
    PLP
    RTS


;;; $DD9A: Game state 17h (death sequence, flashing) ;;;
GameState_17_DeathSequence_Flashing:
    PHP
    REP #$30
    JSL Handle_Death_Animation_Flashing
    TAX : BEQ .flashingEnded
    INC.W GameState
    BRA .return

  .flashingEnded:
    JSL Draw_Samus_During_Death_Animation

  .return:
    PLP
    RTS


;;; $DDAF: Game state 18h (death sequence, explosion white out) ;;;
GameState_18_DeathSequence_ExplosionWhiteOut:
    PHP
    REP #$30
    JSL Handle_DeathSequence_SuitExplosionWhiteOut
    TAX : BEQ .return
    LDA.W #$0001 : STA.W ScreenFadeDelay : STA.W ScreenFadeCounter
    INC.W GameState

  .return:
    PLP
    RTS


;;; $DDC7: Game state 19h (death sequence, black out) ;;;
GameState_19_DeathSequence_BlackOut:
; Also cut to by timeup death
    PHP
    REP #$30
    JSL HandleFadingOut
    SEP #$20
    LDA.B DP_Brightness : CMP.B #$80 : BNE .return
    JSL EnableNMI
    REP #$20
    STZ.W ScreenFadeDelay : STZ.W ScreenFadeCounter
    INC.W GameState
    STZ.W PauseMenu_MenuIndex
    STZ.W DisableSounds
    PLP
    RTS

  .return:
    REP #$20
    PLP
    RTS


;;; $DDF1: Load destination room CRE bitset ;;;
Load_Destination_RoomCRE_Bitset:
    PHB : PHX
    PEA.W RoomHeaders>>8 : PLB : PLB
    LDX.W DoorPointer
    LDA.L DoorHeaders_destRoomHeader,X : TAX
    LDA.W CREBitset : STA.W PreviousCREBitset
    LDA.W $0008,X : AND.W #$00FF : STA.W CREBitset
    PLX : PLB
    RTS


;;; $DE12: Load door header ;;;
Load_Door_Header:
; Regarding door transition speed.
; For speed s, the distance Samus is moved is 40h * s and 38h * s pixels total for horizontal and vertical transitions respectively
; With the default speeds of 0.C8h and 1.80h, that's 32h and 54h pixels distance respectively
    PEA.W DoorHeaders>>8 : PLB : PLB
    LDX.W DoorPointer
    LDA.W $0000,X : STA.W RoomPointer
    LDA.W $0002,X : STA.W ElevatorDoorProperties
    AND.W #$0080 : STA.W ElevatorProperties
    LDA.W $0003,X : AND.W #$00FF : STA.W DoorDirection
    LDA.W $0006,X : AND.W #$00FF : XBA : STA.W DoorDestinationXPosition
    LDA.W $0007,X : AND.W #$00FF : XBA : STA.W DoorDestinationYPosition
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W $0008,X : BPL .positive
    LDA.W DoorDirection : BIT.W #$0002 : BNE .vertical
    LDA.W #$00C8
    BRA .positive

  .vertical:
    LDA.W #$0180

  .positive:
    STA.B DP_Temp13
    LDA.B DP_Temp12 : STA.W SamusSubSpeedDuringDoorTransition
    LDA.B DP_Temp14 : STA.W SamusSpeedDuringDoorTransition
    RTS


;;; $DE6F: Load room header ;;;
Load_Room_Header:
    PEA.W RoomHeader_LandingSite>>8&$FF00 : PLB : PLB
    LDX.W RoomPointer
    LDA.W $0000,X : AND.W #$00FF : STA.W RoomIndex
    LDA.W $0001,X : AND.W #$00FF : STA.W AreaIndex
    LDA.W $0002,X : AND.W #$00FF : STA.W RoomMapX
    LDA.W $0003,X : AND.W #$00FF : STA.W RoomMapY
    LDA.W $0004,X : AND.W #$00FF : STA.W RoomWidthScrolls
    ASL #4 : STA.W RoomWidthBlocks
    LDA.W $0005,X : AND.W #$00FF : STA.W RoomHeightScrolls
    ASL #4 : STA.W RoomHeightBlocks
    LDA.W $0006,X : AND.W #$00FF : STA.W UpScroller
    LDA.W $0007,X : AND.W #$00FF : STA.W DownScroller
    LDA.W $0009,X : STA.W DoorListPointer
    JSL Room_State_Checking_Handler
    SEP #$20
    LDA.W RoomWidthBlocks : STA.W $4202
    LDA.W RoomHeightBlocks : STA.W $4203
    REP #$20
    NOP #3
    LDA.W $4216 : ASL : STA.W LevelDataSize
    RTS


;;; $DEF2: Load state header ;;;
Load_State_Header:
    PEA.W RoomStates>>8&$FF00 : PLB : PLB
    LDX.W RoomStatePointer
    LDA.W $0003,X : AND.W #$00FF : ASL : TAY
    LDX.W Tileset_Pointers,Y
    LDA.W $0001,X : STA.W TilesetTileTablePointer+1
    LDA.W $0000,X : STA.W TilesetTileTablePointer
    LDA.W $0004,X : STA.W TilesetTilesPointer+1
    LDA.W $0003,X : STA.W TilesetTilesPointer
    LDA.W $0007,X : STA.W TilesetPalettePointer+1
    LDA.W $0006,X : STA.W TilesetPalettePointer
    LDX.W RoomStatePointer
    LDA.W $0001,X : STA.W LevelDataPointer+1
    LDA.W $0000,X : STA.W LevelDataPointer
    LDA.W $0004,X : AND.W #$00FF : STA.W RoomMusicDataIndex
    LDA.W $0005,X : AND.W #$00FF : STA.W RoomMusicTrackIndex
    LDA.W $0006,X : STA.W FXPointer
    LDA.W $0008,X : STA.W EnemyPopulationPointer
    LDA.W $000A,X : STA.W EnemySetPointer
    LDA.W $000C,X : STA.W Layer2ScrollX
    LDA.W $0012,X : STA.W RoomMainASMPointer
    RTS


;;; $DF69: Wait until the end of a v-blank and enable h/v-counter interrupts ;;;
WaitUntilTheEndOfAVBlank_and_Enable_H_V_CounterInterrupts:
    PHP
    SEP #$20
    JSL WaitUntilTheEndOfAVBlank
    LDA.B DP_IRQAutoJoy : AND.B #$30 : CMP.B #$30 : BEQ .return
    JSL EnableHVCounterInterruptsNow

  .return:
    REP #$20
    PLP
    RTS


;;; $DF80: Much ado about nothing ;;;
Much_ado_about_nothing:
; This code is painfully redundant.
; It first checks whether the first byte of the function $80:982A is the same as the first byte of this function.
; These two bytes are both `PHP`, so the branch is always taken; even if the branch wasn't taken,
; it's completely pointless to disable h/v-counter interrupts only to enable them straight after.
; And of course there's a `REP #$20` just before a `PLP`
    PHP
    SEP #$20
    LDA.L EnableHVCounterInterrupts : CMP.L Much_ado_about_nothing : BEQ .return ; >.<
    JSL DisableHVCounterInterrupts
    JSL EnableHVCounterInterrupts

  .return:
    REP #$20 ; >.<
    PLP
    RTS


;;; $DF99: Save map explored if elevator ;;;
Save_Map_Explored_If_Elevator:
    LDA.W ElevatorDoorProperties : AND.W #$000F : BEQ +
    JSL SetDebugElevatorAsUsed

+   LDX.W DoorPointer
    LDA.L DoorHeaders_elevatorProperties,X : BIT.W #$0040 : BEQ .return
    JSL MirrorCurrentAreasMapExplored

  .return:
    RTS


;;; $DFB6: Load map explored if elevator ;;;
Load_Map_Explored_If_Elevator:
    LDX.W DoorPointer
    LDA.L DoorHeaders_elevatorProperties,X : BIT.W #$0040 : BEQ .return
    JSL LoadMirrorOfCurrentAreasMapExplored

  .return:
    RTS


;;; $DFC7: Draw inanimate Samus ;;;
Draw_Inanimate_Samus_Bank82:
; Elevator drawing of Samus is done by $90:EC14
    LDA.W ElevatorProperties : BNE .return
    JSL Draw_Inanimate_Samus

  .return:
    RTS


;;; $DFD1: Load enemy GFX to VRAM ;;;
Load_EnemyGFX_to_VRAM:
    LDA.W #$7000 : STA.B DP_Temp12
    LDX.W EnemySetPointer : BEQ .return
    TXY

  .loop:
    LDA.L EnemySets_ID,X : CMP.W #$FFFF : BEQ .return
    TAX
    LDA.L EnemyHeaders_tileData,X : STA.W DoorTransitionVRAM_Src
    LDA.L EnemyHeaders_tileData+1,X : STA.W DoorTransitionVRAM_Src+1
    LDA.L EnemyHeaders_tileDataSize,X : BMI +
    STA.W DoorTransitionVRAM_Size
    LDA.B DP_Temp12 : STA.W DoorTransitionVRAM_Dest
    LDA.L EnemyHeaders_tileDataSize,X : LSR : CLC : ADC.B DP_Temp12 : STA.B DP_Temp12
    BRA .doorFlag

+   AND.W #$7FFF : STA.W DoorTransitionVRAM_Size
    TYX
    LDA.L EnemySets_palette,X : AND.W #$F000 : LSR #4 : ORA.W #$6000 : STA.W DoorTransitionVRAM_Dest

  .doorFlag:
    LDA.W #$8000 : TSB.W DoorTransitionVRAM_Flag

  .wait:
    LDA.W DoorTransitionVRAM_Flag : BMI .wait
    INY #4
    TYX
    BRA .loop

  .return:
    RTS


;;; $E039: Perform door transition VRAM update ;;;
Perform_Door_Transition_VRAM_Update:
;; Parameters:
;;     [[S] + 1] + 1: Source address (24-bit)
;;     [[S] + 1] + 4: VRAM address
;;     [[S] + 1] + 6: Size (in bytes)
    LDA.B $01,S : INC : STA.B DP_ReturnAddrRelativeParam
    PHB
    PHK : PLB
    LDA.B (DP_ReturnAddrRelativeParam) : STA.W DoorTransitionVRAM_Src
    INC.B DP_ReturnAddrRelativeParam
    LDA.B (DP_ReturnAddrRelativeParam) : STA.W DoorTransitionVRAM_Src+1
    INC.B DP_ReturnAddrRelativeParam : INC.B DP_ReturnAddrRelativeParam
    LDA.B (DP_ReturnAddrRelativeParam) : STA.W DoorTransitionVRAM_Dest
    INC.B DP_ReturnAddrRelativeParam : INC.B DP_ReturnAddrRelativeParam
    LDA.B (DP_ReturnAddrRelativeParam) : STA.W DoorTransitionVRAM_Size
    PLB
    LDA.B DP_ReturnAddrRelativeParam : INC : STA.B $01,S
    LDA.W #$8000 : TSB.W DoorTransitionVRAM_Flag

  .wait:
    LDA.W DoorTransitionVRAM_Flag : BMI .wait
    RTS


;;; $E071: Queue room music data ;;;
Queue_Room_Music_Data:
    PHP : PHB
    REP #$30
    LDA.W GameState : CMP.W #$0028 : BCS .return
    LDA.W RoomMusicDataIndex : BEQ .return
    CMP.W MusicDataIndex : BEQ .return
    LDA.W #$0000
    JSL QueueMusicDataOrTrack_8FrameDelay
    LDA.W RoomMusicDataIndex : ORA.W #$FF00
    JSL QueueMusicDataOrTrack_8FrameDelay

  .return:
    PLB : PLP
    RTL


;;; $E09B: Update music track index ;;;
Update_Music_Track_Index:
; $E0AC..CB can be omitted >_<;
; Called only by $80:A07B (start gameplay) to set the music track to play when Samus fanfare finishes
    PHP : PHB
    REP #$30
    LDA.W GameState : CMP.W #$0028 : BCS .return
    LDA.W RoomMusicTrackIndex : BEQ .return
    LDA.W RoomMusicTrackIndex+1 : AND.W #$FF00 : STA.B DP_Temp12
    LDA.W RoomMusicTrackIndex : TSB.B DP_Temp12
    LDA.W MusicDataIndex-1 : AND.W #$FF00 : STA.B DP_Temp14
    LDA.W MusicTrackIndex : TSB.B DP_Temp14
    LDA.B DP_Temp12 : CMP.B DP_Temp14 : BEQ .return
    LDA.W RoomMusicTrackIndex : STA.W MusicTrackIndex

  .return:
    PLB : PLP
    RTL


;;; $E0D5: Load new music track if changed ;;;
Load_New_Music_Track_If_Changed:
    PHP : PHB
    REP #$30
    LDA.W GameState : CMP.W #$0028 : BCS .return
    LDA.W RoomMusicTrackIndex : BEQ .return
    LDA.W RoomMusicTrackIndex+1 : AND.W #$FF00 : STA.B DP_Temp12
    LDA.W RoomMusicTrackIndex : TSB.B DP_Temp12
    LDA.W MusicDataIndex-1 : AND.W #$FF00 : STA.B DP_Temp14
    LDA.W MusicTrackIndex : TSB.B DP_Temp14
    LDA.B DP_Temp12 : CMP.B DP_Temp14 : BEQ .return
    LDY.W #$0006
    LDA.W RoomMusicTrackIndex
    JSL QueueMusicDataOrTrack_YFrameDelay

  .return:
    PLB : PLP
    RTL


;;; $E113: RTL ;;;
RTL_82E113:
    PHP
    REP #$20
    PLP
    RTL


;;; $E118: Play room music track after [A] frames ;;;
Play_Room_Music_Track_After_A_Frames:
;; Parameters:
;;     A: Delay. Called with 6 seconds for Samus/item fanfare
    PHP : PHB
    REP #$30
    PHY
    TAY
    LDA.W GameState : CMP.W #$0028 : BCS .return
    LDA.W #$0000
    JSL QueueMusicDataOrTrack_YFrameDelay
    LDA.W MusicTrackIndex
    JSL QueueMusicDataOrTrack_8FrameDelay

  .return:
    PLY : PLB : PLP
    RTL


;;; $E138: RTL ;;;
RTL_82E138:
    RTL


;;; $E139: Load target colours for common sprites, beams and flashing enemies ;;;
Load_Target_Colors_for_Common_SpritesBeamsFlashingEnemies:
    REP #$30
    LDX.W #$001E

-   LDA.L Initial_Palette_spritePalette5,X : STA.L TargetPalettes_SpriteP5,X
    DEX #2 : BPL -
    LDX.W #$001E

-   LDA.L Palettes_SpriteP6,X : STA.L TargetPalettes_SpriteP6,X
    DEX #2 : BPL -
    LDX.W #$001E

-   LDA.L Standard_Target_Sprite_Palette_Line0,X : STA.L TargetPalettes_SpriteP0,X
    DEX #2 : BPL -
    RTL


;;; $E169: Game state 9 (hit a door block) ;;;
GameState_9_HitADoorBlock:
    PHP
    REP #$30
    PEA .manualReturn-1
    JMP.W (DoorTransitionFunction)

  .manualReturn:
    BCS .gameStateA
    PLP
    RTS

  .gameStateA:
    INC.W GameState
    PLP
    JMP GameState_A_LoadingNextRoom


;;; $E17D: Door transition function - handle elevator ;;;
DoorTransitionFunction_HandleElevator:
;; Returns:
;;     Carry: Set if finished delay, clear otherwise
    LDA.W ElevatorProperties : BEQ .return
    LDA.W #$0000
    JSL Run_Samus_Command
    LDA.W ElevatorDirection : BMI .return
    LDA.W #$0030 : STA.W DownwardsElevatorDelayTimer
    LDA.W #DoorTransitionFunction_Wait48FramesForDownElevator : STA.W DoorTransitionFunction
    JMP DoorTransitionFunction_Wait48FramesForDownElevator

  .return:
    SEC
    RTS


;;; $E19F: Door transition function - wait 48 frames for down elevator ;;;
DoorTransitionFunction_Wait48FramesForDownElevator:
;; Returns:
;;     Carry: Set if finished delay, clear otherwise
    DEC.W DownwardsElevatorDelayTimer : BMI .return
    JSL Determine_Which_Enemies_to_Process
    JSL Main_Enemy_Routine
    JSL Draw_Samus_Projectiles_Enemies_and_Enemy_Projectiles
    JSR Draw_Inanimate_Samus_Bank82
    CLC
    RTS

  .return:
    SEC
    RTS


;;; $E1B7: Game state Ah (loading next room) ;;;
GameState_A_LoadingNextRoom:
    PHP : PHB
    REP #$30
    LDA.W #$0001 : STA.W DoorTransitionFlagEnemiesPause : STA.W DoorTransitionFlagElevatorsZebetites
    STZ.W DisableMinimap : STZ.W SaveStationLockoutFlag
    JSL Determine_Which_Enemies_to_Process
    JSL Main_Enemy_Routine
    JSL Draw_Samus_Projectiles_Enemies_and_Enemy_Projectiles
    JSR Draw_Inanimate_Samus_Bank82
    JSR Load_Destination_RoomCRE_Bitset
    PEA.W TargetPalettes_BGP0>>8&$FF00 : PLB : PLB
    LDX.W #$00FE
    LDA.W #$0000

-   STA.W TargetPalettes_BGP0,X : STA.W TargetPalettes_SpriteP0,X
    DEX #2 : BPL -
    LDA.W Palettes_BG3P2MinimapExplored : STA.W TargetPalettes_BGP0+$12
    LDA.W Palettes_BG3P2MinimapExploredFeature : STA.W TargetPalettes_BGP0+$14
    LDA.W Palettes_BG3P3MinimapUnexplored : STA.W TargetPalettes_BGP0+$1A
    LDA.W Palettes_BG3P3MinimapUnexploredFeature : STA.W TargetPalettes_BGP0+$1C
    LDA.W Palettes_BG3P4HighlightedHUDItemBackgroundOutline : STA.W TargetPalettes_BGP1+2
    LDA.W Palettes_BG3P4HighlightedHUDItemBackground : STA.W TargetPalettes_BGP1+4
    LDA.W Palettes_BG3P4HighlightedHUDItemOutline : STA.W TargetPalettes_BGP1+6
    LDA.W Palettes_BG3P7MinimapRoomHighlight : STA.W TargetPalettes_BGP1+$1A
    LDA.W CREBitset : ORA.W PreviousCREBitset : BIT.W #$0001 : BNE .clearSounds
    LDA.W Palettes_BG3P5 : STA.W TargetPalettes_BGP1+8
    LDA.W Palettes_BG3P5HUDItemBackgroundOutline : STA.W TargetPalettes_BGP1+$A
    LDA.W Palettes_BG3P5HUDItemBackground : STA.W TargetPalettes_BGP1+$C
    LDA.W Palettes_BG3P5HUDItemOutline : STA.W TargetPalettes_BGP1+$E
    LDA.W Palettes_BG3P7 : STA.W TargetPalettes_BGP1+$18
    LDA.W TimerStatus : BEQ .clearSounds
    LDA.W Palettes_SpriteP5+2 : STA.W TargetPalettes_SpriteP5+2
    LDA.W Palettes_SpriteP5+4 : STA.W TargetPalettes_SpriteP5+4
    LDA.W Palettes_SpriteP5+8 : STA.W TargetPalettes_SpriteP5+8
    LDA.W Palettes_SpriteP5+$1A : STA.W TargetPalettes_SpriteP5+$1A
    JSL DrawTimer

  .clearSounds:
    JSL Clear_Sounds_When_Going_Through_Door
    LDA.W #$0071
    JSL QueueSound_Lib2_Max15
    LDA.W #$FFFF : STA.W DisableSounds
    LDA.W #DoorTransitionFunction_WaitForSoundsToFinish : STA.W DoorTransitionFunction
    INC.W GameState
    PLB : PLP
    RTS


;;; $E288: Game state Bh (loading next room) ;;;
GameState_B_LoadingNextRoom:
    PHP : PHB
    REP #$30
    PEA .manualReturn-1
    JMP.W (DoorTransitionFunction)

  .manualReturn:
    LDA.W TimerStatus : BEQ .return
    JSL DrawTimer

  .return:
    PLB : PLP
    RTS


;;; $E29E: Door transition function - wait for sounds to finish ;;;
DoorTransitionFunction_WaitForSoundsToFinish:
    PHP
    JSL Determine_Which_Enemies_to_Process
    JSL Main_Enemy_Routine
    JSL Draw_Samus_Projectiles_Enemies_and_Enemy_Projectiles
    JSR Draw_Inanimate_Samus_Bank82
    SEP #$20
    LDA.W APU_SoundQueueNextIndexLib1 : SEC : SBC.W APU_SoundQueueStartIndexLib1 : AND.B #$0F : BNE .return
    LDA.W APU_SoundQueueNextIndexLib2 : SEC : SBC.W APU_SoundQueueStartIndexLib2 : AND.B #$0F : BNE .return
    LDA.W APU_SoundQueueNextIndexLib3 : SEC : SBC.W APU_SoundQueueStartIndexLib3 : AND.B #$0F : BNE .return
    REP #$20
    LDA.W #DoorTransitionFunction_FadeOutTheScreen : STA.W DoorTransitionFunction

  .return:
    PLP
    RTS


;;; $E2DB: Door transition function - fade out the screen ;;;
DoorTransitionFunction_FadeOutTheScreen:
    JSR Advance_GradualColorChange_ofAllPalettes_Denominator_C
    BCS +
    JSL Determine_Which_Enemies_to_Process
    JSL Main_Enemy_Routine
    JSL Draw_Samus_Projectiles_Enemies_and_Enemy_Projectiles
    JSR Draw_Inanimate_Samus_Bank82
    RTS

+   LDA.W #DoorTransitionFunction_LoadDoorHeader_DeleteHDMAObjects_IRQ : STA.W DoorTransitionFunction
    RTS


;;; $E2F7: Door transition function - load door header, delete HDMA objects, and set interrupt command ;;;
DoorTransitionFunction_LoadDoorHeader_DeleteHDMAObjects_IRQ:
    JSR Load_Door_Header
    JSL Delete_HDMAObjects
    LDA.W #$8000 : TRB.W HDMAObject_Enable
    LDA.W #$0008 : STA.B DP_NextIRQCmd
    LDA.W #DoorTransitionFunction_ScrollScreenToAlignment : STA.W DoorTransitionFunction
    RTS


;;; $E310: Door transition function - scroll screen to alignment ;;;
DoorTransitionFunction_ScrollScreenToAlignment:
    PEA $8F00 : PLB : PLB
    LDA.W DoorDirection : BIT.W #$0002 : BNE .vertical
    LDA.W Layer1YSubPosition+1 : BIT.W #$FF00 : BEQ .done
    BMI +
    DEC.W Layer1YPosition
    BRA .return

+   INC.W Layer1YPosition
    BRA .return

  .vertical:
    LDA.W Layer1XSubPosition+1 : BIT.W #$FF00 : BEQ .done
    BMI +
    DEC.W Layer1XPosition
    BRA .return

+   INC.W Layer1XPosition

  .return:
    JSL Calc_Layer2Position_BGScrolls_UpdateBGGraphics_WhenScrolling
    RTS

  .done:
    JSL Calc_Layer2Position_BGScrolls_UpdateBGGraphics_WhenScrolling
    LDA.W #DoorTransitionFunction_FixDoorsMovingUp : STA.W DoorTransitionFunction
    RTS


;;; $E353: Door transition function - fix doors moving up ;;;
DoorTransitionFunction_FixDoorsMovingUp:
; See DoorTransitionScrolling_Up
    PEA $8F00 : PLB : PLB
    LDA.W DoorDirection : AND.W #$0003 : CMP.W #$0003 : BNE +
    JSL DrawTopRowOfScreenForUpwardsDoorTransition

+   LDA.W #DoorTransitionFunction_LoadRoomHeader_SetupMap_Decompress : STA.W DoorTransitionFunction
    RTS


;;; $E36E: Door transition function - load room header; set up map; decompress level, scroll, and CRE data ;;;
DoorTransitionFunction_LoadRoomHeader_SetupMap_Decompress:
    PEA $8F00 : PLB : PLB
    JSR Save_Map_Explored_If_Elevator
    JSR Load_Room_Header
    JSR Load_State_Header
    JSR Load_Map_Explored_If_Elevator
    JSL Initialise_Special_Effects_for_New_Room
    JSL Load_Level_Scroll_and_CRE_Data
    LDA.W #DoorTransitionFunction_SetupScrolling : STA.W DoorTransitionFunction
    RTS


;;; $E38E: Door transition function - set up scrolling ;;;
DoorTransitionFunction_SetupScrolling:
    PEA $8F00 : PLB : PLB
    STZ.B DP_BG2XScroll : STZ.B DP_BG2YScroll
    STZ.W ScrollingSkyFinishedHook
    LDA.W DoorDirection : AND.W #$0003 : CMP.W #$0002 : BNE +
    INC.B DP_BG1YScroll

+   LDA.W DoorDirection : AND.W #$0003 : CMP.W #$0003 : BEQ +
    STZ.W DoorTransitionFrameCounter

+   JSL DoorTransitionScrollingSetup
    LDA.W #DoorTransitionFunction_PlaceSamus_LoadTiles : STA.W DoorTransitionFunction
    RTS


;;; $E3C0: Door transition function - place Samus, load tiles ;;;
DoorTransitionFunction_PlaceSamus_LoadTiles:
    PEA $8F00 : PLB : PLB
    LDA.W SamusXPosition : AND.W #$00FF : CLC : ADC.W Layer1XPosition
    STA.W SamusXPosition : STA.W SamusPreviousXPosition
    LDA.W SamusYPosition : AND.W #$00FF : CLC : ADC.W Layer1YPosition
    STA.W SamusYPosition : STA.W SamusPreviousYPosition
    STZ.W DoorTransitionFinishScrolling : STZ.W DoorTransitionVRAM_Flag
    LDA.W DoorDirection : AND.W #$0003 : CMP.W #$0002 : BNE .horizontal
    LDA.W #$0010
    BRA .vertical

  .horizontal:
    LDA.W #$0016

  .vertical:
    STA.B DP_NextIRQCmd
    JSR WaitUntilTheEndOfAVBlank_and_Enable_H_V_CounterInterrupts
    LDA.W CREBitset : BIT.W #$0002 : BEQ .decompress
    LDA.W DoorPointer : CMP.W #Door_PostCrocShaft_0 : BEQ .decompress
    LDA.W #CRE_Tiles_Compressed>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #CRE_Tiles_Compressed : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl CRETiles

  .decompress:
    LDA.W TilesetTilesPointer+1 : STA.B DP_DecompSrc+1
    LDA.W TilesetTilesPointer : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl RoomTiles
    LDA.W TilesetPalettePointer+1 : STA.B DP_DecompSrc+1
    LDA.W TilesetPalettePointer : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl TargetPalettes_BGP0
    JSR Perform_Door_Transition_VRAM_Update
    dl RoomTiles
    dw $0000,$2000
    JSR Perform_Door_Transition_VRAM_Update
    dl RoomTiles+$2000
    dw $1000,$2000
    JSR Perform_Door_Transition_VRAM_Update
    dl RoomTiles+$4000
    dw $2000,$1000
    LDA.W CREBitset : BIT.W #$0006 : BEQ .checkUp
    LDA.W DoorPointer : CMP.W #Door_PostCrocShaft_0 : BEQ .checkUp
    JSR Perform_Door_Transition_VRAM_Update
    dl CRETiles
    dw $2800,$1000
    JSR Perform_Door_Transition_VRAM_Update
    dl CRETiles+$1000
    dw $3000,$2000
    JSR Perform_Door_Transition_VRAM_Update
    dl Tiles_Standard_BG3
    dw $4000,$1000

  .checkUp:
    LDA.W DoorDirection : AND.W #$0003 : CMP.W #$0003 : BNE +
    LDA.W #$0010 : STA.B DP_NextIRQCmd

+   LDA.W #DoorTransitionFunction_LoadSpritesBGPLMsAudio_RunDoorRoomASM : STA.W DoorTransitionFunction
    RTS


;;; $E4A9: Door transition function - load sprites, background, PLMs, audio; execute custom door and room ASM; and wait for scrolling to end ;;;
DoorTransitionFunction_LoadSpritesBGPLMsAudio_RunDoorRoomASM:
; In this routine, after all of the loading is done, we sit on this busy loop at $E526 waiting for door transition scrolling to finish
; During this busy loop, door transition scrolling updates are happening due to the IRQ handler ($80:979B),
; which will eventually set DoorTransitionFinishScrolling when scrolling has finished, freeing us from the busy loop
; On the frame of the last door transition scrolling update, this routine decides to run the PLM handler before waiting for the next frame
; Because scrolling updates take precedence over PLM draw updates, and because the scrolling updates were carried out prior to any PLM level data modifications,
; PLM draw updates that affect the top row of (the visible part of) the room for upwards doors or the bottom row of the room for downwards doors aren't visible
; This is the cause of the "red and green doors appear blue in the Crateria -> Red Brinstar room" bug
    PHP
    JSR Load_EnemyGFX_to_VRAM
    JSL Queue_Room_Music_Data
    JSL Clear_Enemy_Projectiles
    JSL Clear_AnimatedTilesObjects
    JSL Clear_PaletteFXObjects
    JSL Clear_PLMs
    JSL CreatePLMs_ExecuteDoorASM_RoomSetupASM_SetElevatorStatus
    JSL Load_FX_Header
    JSR Spawn_Door_Closing_PLM
    JSL Update_Beam_Tiles_and_Palette
    JSL Load_Target_Colors_for_Common_SpritesBeamsFlashingEnemies
    JSL Load_Enemies
    JSL Initialise_Enemies
    JSL Reset_Projectile_Data
    JSL LoadSamusSuitTargetPalette
    PLP
    PEA $8F00 : PLB : PLB
    JSR Clear_FX_Tilemap
    LDA.W #FXTilemaps>>8&$FF00 : STA.W DoorTransitionVRAM_Src+1
    LDA.W FX_TilemapPointer : BEQ +
    STA.W DoorTransitionVRAM_Src
    LDA.W #$5BE0 : STA.W DoorTransitionVRAM_Dest
    LDA.W #$0840 : STA.W DoorTransitionVRAM_Size
    LDA.W #$8000 : TSB.W DoorTransitionVRAM_Flag

  .waitVRAM:
    BIT.W DoorTransitionVRAM_Flag : BMI .waitVRAM

+   LDX.W RoomStatePointer
    LDY.W $0016,X : BPL .noLibraryBackground

  .loop:
    LDX.W $0000,Y
    INY #2
    JSR.W (Library_Background_Function_Pointers,X)
    BCC .loop

  .noLibraryBackground:
    REP #$30

  .waitDoor:
    LDA.W DoorTransitionFinishScrolling : BPL .waitDoor
    LDA.W #$3BE0 : STA.L Palettes_SpriteP4C4
    JSL Spawn_BG3_Scroll_HDMA_Object
    LDA.W #$8000 : TSB.W HDMAObject_Enable
    JSL PLM_Handler
    JSL WaitForNMI
    LDA.W DoorDirection : BIT.W #$0002 : BNE .return
    AND.W #$0003 : BEQ .right
    LDA.W #$0007 : TRB.W SamusXPosition
    BRA .return

  .right:
    LDA.W #$0007 : TSB.W SamusXPosition

  .return:
    LDA.W #DoorTransitionFunction_HandleAnimatedTiles : STA.W DoorTransitionFunction
    RTS


;;; $E566: Clear FX tilemap ;;;
Clear_FX_Tilemap:
    LDX.W #$077E
    LDA.W #$184E

  .loop:
    STA.L ClearingFXTilemap,X : STA.L ClearingFXTilemap+$780,X
    DEX #2 : BPL .loop
    JSR Perform_Door_Transition_VRAM_Update
    dl ClearingFXTilemap
    dw $5880,$0F00
    RTS


;;; $E583: Clear BG2 tilemap ;;;
Clear_BG2_Tilemap:
    LDX.W #$07FE
    LDA.W #$0338

  .loop:
    STA.L BG2Tilemap,X : STA.L BG2Tilemap+$800,X
    DEX #2 : BPL .loop
    JSR Perform_Door_Transition_VRAM_Update
    dl BG2Tilemap
    dw $4800,$1000
    RTS


;;; $E5A0: Clear Kraid's BG2 tilemap ;;;
Clear_Kraids_BG2_Tilemap:
    LDX.W #$07FE
    LDA.W #$0338

  .loop:
    STA.L BG2Tilemap,X : STA.L BG2Tilemap+$800,X
    DEX #2 : BPL .loop
    JSR Perform_Door_Transition_VRAM_Update
    dl BG2Tilemap
    dw $4000,$1000
    JSR Perform_Door_Transition_VRAM_Update
    dl BG2Tilemap
    dw $4800,$1000
    RTS


;;; $E5C7: Library background function pointers ;;;
Library_Background_Function_Pointers:
    dw LoadLibraryBackground_0_Terminator
    dw LoadLibraryBackground_2_TransferToVRAM
    dw LoadLibraryBackground_4_Decompression
    dw LoadLibraryBackground_6_ClearFXTilemap
    dw LoadLibraryBackground_8_TransferToVRAM_SetBG3TilesBaseAddr
    dw LoadLibraryBackground_A_ClearBG2Tilemap
    dw LoadLibraryBackground_C_ClearKraidsLayer2
    dw LoadLibraryBackground_E_DoorDependentTransferToVRAM


;;; $E5D7: Load library background - command 0: terminator ;;;
LoadLibraryBackground_0_Terminator:
;; Returns:
;;     Carry: Set. Finished list
    SEC
    RTS


;;; $E5D9: Load library background - command Eh: door dependent transfer to VRAM ;;;
LoadLibraryBackground_E_DoorDependentTransferToVRAM:
;; Parameters:
;;     Y: Pointer to parameters
;; Returns:
;;     Carry: Clear. Not finished list
;;     Y: Pointer to next command

; Command Eh is only used by landing site, WS entrance and WS back door
    LDA.W DoorPointer : CMP.W $0000,Y : BEQ +
    TYA : CLC : ADC.W #$0009 : TAY
    CLC
    RTS

+   INY #2
; fallthrough to LoadLibraryBackground_2_TransferToVRAM


;;; $E5EB: Load library background - command 2: transfer to VRAM ;;;
LoadLibraryBackground_2_TransferToVRAM:
;; Parameters:
;;     Y: Pointer to command parameters
;; Returns:
;;     Carry: Clear. Not finished list
;;     Y: Pointer to next command
    LDA.W $0003,Y : STA.W DoorTransitionVRAM_Dest
    LDA.W $0000,Y : STA.W DoorTransitionVRAM_Src
    LDA.W $0001,Y : STA.W DoorTransitionVRAM_Src+1
    LDA.W $0005,Y : STA.W DoorTransitionVRAM_Size
    LDA.W #$8000 : TSB.W DoorTransitionVRAM_Flag

  .wait:
    BIT.W DoorTransitionVRAM_Flag : BMI .wait
    TYA : CLC : ADC.W #$0007 : TAY
    CLC
    RTS


;;; $E616: Load library background - command 4: decompression ;;;
LoadLibraryBackground_4_Decompression:
;; Parameters:
;;     Y: Pointer to command parameters
;; Returns:
;;     Carry: Clear. Not finished list
;;     Y: Pointer to next command
    PHY
    LDA.W $0000,Y : STA.B DP_DecompSrc
    LDA.W $0001,Y : STA.B DP_DecompSrc+1
    LDA.W #$7E00 : STA.B DP_DecompDest+1
    LDA.W $0003,Y : STA.B DP_DecompDest
    JSL Decompression_VariableDestination
    PLA : CLC : ADC.W #$0005 : TAY
    CLC
    RTS


;;; $E637: Load library background - command 6: clear FX tilemap ;;;
LoadLibraryBackground_6_ClearFXTilemap:
;; Returns:
;;     Carry: Clear. Not finished list

; Command 6 is unused
    PHY
    JSR Clear_FX_Tilemap
    PLY
    CLC
    RTS


;;; $E63E: Load library background - command 8: transfer to VRAM and set BG3 tiles base address = $2000 ;;;
LoadLibraryBackground_8_TransferToVRAM_SetBG3TilesBaseAddr:
;; Parameters:
;;     Y: Pointer to command parameters
;; Returns:
;;     Carry: Clear. Not finished list
;;     Y: Pointer to next command

; Command 8 is only used by Kraid's room
    JSR LoadLibraryBackground_2_TransferToVRAM
    SEP #$20
    LDA.B #$02 : STA.B DP_BGTilesAddr+1
    REP #$20
    CLC
    RTS


;;; $E64B: Load library background - command Ah: clear BG2 tilemap ;;;
LoadLibraryBackground_A_ClearBG2Tilemap:
;; Returns:
;;     Carry: Clear. Not finished list

; Command Ah is only used by:
;     Room $CD13, state $CD3F: Phantoon's room, Phantoon is dead
;     Room $DA60, state $DA8C: Draygon's room, Drayon is dead
;     Room $DF45: Ceres elevator
    PHY
    JSR Clear_BG2_Tilemap
    PLY
    CLC
    RTS


;;; $E652: Load library background - command Ch: clear Kraid's layer 2 ;;;
LoadLibraryBackground_C_ClearKraidsLayer2:
;; Returns:
;;     Carry: Clear. Not finished list

; Command Ch is only used by:
;     Room $A59F, state $A5CB: Kraid's room, Kraid is dead
    PHY
    JSR Clear_Kraids_BG2_Tilemap
    PLY
    CLC
    RTS


;;; $E659: Door transition function - handle animated tiles ;;;
DoorTransitionFunction_HandleAnimatedTiles:
    JSL AnimatedTilesObject_Handler
    LDA.W #DoorTransitionFunction_WaitForMusicQueueClear_and_LoadMusic : STA.W DoorTransitionFunction
    RTS


;;; $E664: Door transition function - wait for music queue to clear and possibly load new music ;;;
DoorTransitionFunction_WaitForMusicQueueClear_and_LoadMusic:
    JSL CheckIfMusicIsQueued
    BCS .return
    LDA.W #DoorTransitionFunction_NudgeSamusIfInterceptingTheDoor : STA.W DoorTransitionFunction
    JSL Load_New_Music_Track_If_Changed

  .return:
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $E675: Unused. Door transition function ;;;
UNUSED_DoorTransitionFunction:
; The fact that it sets the door transition function to $E6A2 would indicate that this would have been executed on the emerging side of the door transition
; There's a call to the music queue handler here, which is normally called by the NMI routine,
; indicating that NMI is expected to be disabled (unlikely IMO due to the scrolling), or this code is quite old in its abandonment (more likely)
; DownwardsElevatorDelayTimer may not be the "downwards elevator" delay timer in this code,
; a fun guess would be that this function was used for the scrolling part of a NEStroid-esque door transition where enemies are still active throughout
; A more boring guess would be that this was an old version of $E19F (wait 48 frames for down elevator) before it got moved to game state 9
; and the door transition function is simply set wrong
; Yet another guess is that there was an expedited version of an elevator door transition used for elevators that don't actually change room
    JSL HandleMusicQueue
    JSL Determine_Which_Enemies_to_Process
    STZ.W DoorTransitionFlagElevatorsZebetites
    JSL Main_Enemy_Routine
    INC.W DoorTransitionFlagElevatorsZebetites
    JSL Draw_Samus_Projectiles_Enemies_and_Enemy_Projectiles
    JSL Main_Scrolling_Routine
    JSR Draw_Inanimate_Samus_Bank82
    JSL Calc_Layer2Position_BGScrolls_UpdateBGGraphics_WhenScrolling
    DEC.W DownwardsElevatorDelayTimer : BPL .return
    LDA.W #DoorTransitionFunction_NudgeSamusIfInterceptingTheDoor : STA.W DoorTransitionFunction

  .return:
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E6A2: Door transition function - nudge Samus if she's intercepting the door ;;;
DoorTransitionFunction_NudgeSamusIfInterceptingTheDoor:
; Positions Samus to avoid collision with the door (not enough to prevent door clip though) and enables normal IRQ command
; Neither of the calls to $90:F084 are needed (they've both already been done elsewhere, and there's no reason to do only one of the two anyway...)
; tldr, ignore the elevator specific code.
; The clearing of $7E:9C00..9FFF I don't think is needed, that RAM AFAIK is only used for HDMA tables (other RAM is used for HDMA tables too...)
    LDA.W SamusXPosition : AND.W #$00F0 : CMP.W #$0010 : BNE .X
    LDA.W SamusXPosition : ORA.W #$000F : CLC : ADC.W #$0008 : STA.W SamusXPosition
    BRA .Y

  .X:
    CMP.W #$00E0 : BNE .Y
    LDA.W SamusXPosition : AND.W #$FFF0 : SEC : SBC.W #$0008 : STA.W SamusXPosition

  .Y:
    LDA.W SamusYPosition : AND.W #$00F0 : CMP.W #$0010 : BNE .what
    LDA.W SamusYPosition : ORA.W #$000F : CLC : ADC.W #$0008 : STA.W SamusYPosition
    BRA +

  .what:
    CMP.W #$00E0

+   PHB
    PEA.W ExpandingContractingEffectBG2YScrollIndirectHDMATable>>8&$FF00 : PLB : PLB
    LDX.W #$01FE

  .loop:
    STZ.W ExpandingContractingEffectBG2YScrollIndirectHDMADataTable,X
    STZ.W ExpandingContractingEffectBG2YScrollIndirectHDMATable,X
    DEX #2 : BPL .loop
    PLB
    LDA.B DP_RoomLoadIRQCmd : BNE +
    LDA.W #$0004

+   STA.B DP_NextIRQCmd
    JSR Much_ado_about_nothing
    LDA.W ElevatorProperties : BEQ .notElevator
    BIT.W ElevatorDirection : BPL .samusCmd
    LDA.W #$0000
    JSL Run_Samus_Command
    BRA .notElevator

  .samusCmd:
    LDA.W #$0007
    JSL Run_Samus_Command

  .notElevator:
    JSL SetLiquidPhysicsType
    LDA.W #DoorTransitionFunction_FadeInTheScreen_and_RunEnemies_Finish : STA.W DoorTransitionFunction
    LDA.B DP_Brightness : ORA.W #$001F : STA.B DP_Brightness
    RTS


;;; $E737: Door transition function - fade in the screen and run enemies; finish door transition ;;;
DoorTransitionFunction_FadeInTheScreen_and_RunEnemies_Finish:
    JSL AnimatedTilesObject_Handler
    JSL Determine_Which_Enemies_to_Process
    JSL Main_Enemy_Routine
    JSL Enemy_Projectile_Handler
    JSL Draw_Samus_Projectiles_Enemies_and_Enemy_Projectiles
    JSR Draw_Inanimate_Samus_Bank82
    JSL Handle_Queuing_Enemy_BG2_Tilemap_VRAM_Transfer
    JSR Advance_GradualColorChange_ofAllPalettes_Denominator_C
    BCC .return
    STZ.W DisableSounds
    JSL Play_SpinJumpSound_if_SpinJumping
    STZ.W DoorTransitionFlagElevatorsZebetites : STZ.W DoorTransitionFlagEnemiesPause
    LDA.W #$0008 : STA.W GameState

  .return:
    RTS


;;; $E76B: Load destination room CRE bitset, door/room/state headers, CRE tiles, tileset tiles and tileset palette ;;;
Load_Destination_Room:
    PHP : PHB
    REP #$30
    PEA.W RoomHeaders>>8 : PLB : PLB
    JSR Load_Destination_RoomCRE_Bitset
    JSR Load_Door_Header
    JSR Load_Room_Header
    JSR Load_State_Header
    JMP Load_CRETiles_TilesetTiles_and_TilesetPalette


;;; $E783: Load CRE tiles, tileset tiles and tileset palette ;;;
Load_CRETiles_TilesetTiles_and_TilesetPalette_DB_8F:
    PHP : PHB
    REP #$30
    PEA $8F00 : PLB : PLB
; fallthrough to Load_CRETiles_TilesetTiles_and_TilesetPalette


;;; $E78C: Load CRE tiles, tileset tiles and tileset palette ;;;
Load_CRETiles_TilesetTiles_and_TilesetPalette:
    STZ.W ElevatorProperties
    LDA.W #$0080 : STA.W $2115
    LDA.W #CRE_Tiles_Compressed>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #CRE_Tiles_Compressed : STA.B DP_DecompSrc
    LDA.W #$5000 : STA.B DP_DecompDest
    LSR : STA.W $2116
    JSL DecompressionToVRAM
    LDA.W TilesetTilesPointer+1 : STA.B DP_DecompSrc+1
    LDA.W TilesetTilesPointer : STA.B DP_DecompSrc
    STZ.W $2116 : STZ.B DP_DecompDest
    JSL DecompressionToVRAM
    LDA.W TilesetPalettePointer+1 : STA.B DP_DecompSrc+1
    LDY.W TilesetPalettePointer
    STY.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl TargetPalettes_BGP0
    PLB : PLP
    RTL


;;; $E7D3: Load level data, CRE, tile table, scroll data, create PLMs and execute door ASM and room setup ASM ;;;
LoadLevelData_CRE_TileTable_ScrollData_PLMs_DoorASM_RoomASM:
; This routine is almost the same as gluing Load_Level_Scroll_and_CRE_Data and CreatePLMs_ExecuteDoorASM_RoomSetupASM_SetElevatorStatus together,
; the only difference being that this routine doesn't bother checking the CRE bitset to reload the CRE

; 'Level data' as pointed to by LevelDataPointer is a compressed block of data containing the actual level data, BTS data, and optionally custom layer 2 background data.
; It is decompressed to $7F:0000 where the first word gives the number of bytes of level data,
; followed by the level data (which is decompressed into the right location),
; followed by BTS data (which needs to be copied over to $7F:6402,
; optionally followed by custom layer 2 data (which is copied over to $7F:9602).

; As BTS data is half the size of level data, you get the following (slightly awkward) addresses for the begin and end of each data:
;     Level data: $7F:0002                      to $7F:0002 + [$7F:0000]
;     BTS:        $7F:0002 + [$7F:0000]         to $7F:0002 + [$7F:0000] / 2 * 3
;     Background: $7F:0002 + [$7F:0000] / 2 * 3 to $7F:0002 + [$7F:0000] / 2 * 5
    PHP : PHB
    REP #$30
    PEA $8F00 : PLB : PLB
    LDX.W #$63FE
    LDA.W #$8000

  .loopA:
    STA.L LevelData,X
    DEX #2 : BPL .loopA
    LDA.W LevelDataPointer+1 : STA.B DP_DecompSrc+1
    LDA.W LevelDataPointer : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl LevelData-2
    PHB
    PEA.W LevelData>>8&$FF00 : PLB : PLB
    LDA.W $0000 : TAX
    LSR : ADC.W $0000 : ADC.W $0000 : TAY
    BRA +

  .loopB:
    LDA.W $0002,Y : STA.W CustomBackground,X

+   DEY #2
    DEX #2 : BPL .loopB
    LDA.W $0000 : LSR : TAX
    ADC.W $0000 : TAY
    BRA +

  .loopC:
    LDA.W $0002,Y : STA.W BTS,X

+   DEY #2
    DEX #2 : BPL .loopC
    PLB
    LDA.W AreaIndex : CMP.W #$0006 : BEQ .skipCRE
    LDA.W #CRE_TileTable_Compressed>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #CRE_TileTable_Compressed : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl DecompressedCRE
    LDA.W TilesetTileTablePointer+1 : STA.B DP_DecompSrc+1
    LDA.W TilesetTileTablePointer : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl DecompressedSCE
    BRA .scrolls

  .skipCRE:
    LDA.W TilesetTileTablePointer+1 : STA.B DP_DecompSrc+1
    LDA.W TilesetTileTablePointer : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl DecompressedCRE

  .scrolls:
    LDX.W RoomStatePointer
    LDY.W $000E,X : BPL .presetScrolls
    LDX.W #$0000

  .loopD:
    LDA.W $0000,Y : STA.L Scrolls,X
    INY #2
    INX #2 : CPX.W #$0032 : BNE .loopD
    BRA .scrollsEnd

  .presetScrolls:
    STY.B DP_Temp12
    SEP #$30
    LDA.W RoomHeightScrolls : DEC : STA.B DP_Temp14
    LDA.B #$02
    LDX.B #$00
    LDY.B #$00

  .loop:
    CPY.B DP_Temp14 : BNE +
    LDA.B DP_Temp12 : INC

+   PHY
    LDY.B #$00

  .loopE:
    STA.L Scrolls,X
    INX
    INY : CPY.W RoomWidthScrolls : BNE .loopE
    PLY : INY : CPY.W RoomHeightScrolls : BNE .loop

  .scrollsEnd:
    REP #$30
    LDX.W RoomStatePointer
    LDA.W $0014,X : BEQ +
    TAX

  .loopF:
    LDA.W $0000,X : BEQ +
    JSL Spawn_Room_PLM
    TXA : CLC : ADC.W #$0006 : TAX
    BRA .loopF

+   JSL Execute_Door_ASM
    JSL Execute_Room_Setup_ASM
    LDA.W ElevatorProperties : BEQ .return
    LDA.W #$0002 : STA.W ElevatorStatus

  .return:
    PLB : PLP
    RTL


;;; $E8EB: Spawn door closing PLM ;;;
Spawn_Door_Closing_PLM:
; If no coloured doorcap is present, spawns:
;     0 <= [door direction] < 4: Nothing
;     4 <= [door direction] < 8: Blue door closing
;     8 <= [door direction] < Ch: Gate that closes during escape in room after Mother Brain
    PHP : PHB
    REP #$30
    PEA $8F00 : PLB : PLB
    JSR CheckIfColoredDoorcapWasSpawned_SwitchDoorPLMInstruction
    BCS .return
    LDA.W DoorDirection : ASL : CLC : ADC.W #Door_Closing_PLMs : TAX
    LDA.W $0000,X : BEQ .return
    STA.B DP_Temp12
    LDX.W DoorPointer
    LDA.L DoorHeaders_doorcapXBlocks,X : STA.B DP_Temp14
    LDX.W #$0012
    JSL Spawn_Room_PLM

  .return:
    PLB : PLP
    RTS


;;; $E91C: Set closing PLM instruction list if coloured doorcap is present ;;;
CheckIfColoredDoorcapWasSpawned_SwitchDoorPLMInstruction:
;; Returns:
;;     Carry: Set if coloured doorcap is present, clear otherwise

; Disables IRQ during multiplication calculation, which is good practice seeing as interrupt handler can write to those registers,
; although this is the only piece of code in the game that does that
    LDX.W DoorPointer
    SEI
    SEP #$20
    LDA.L DoorHeaders_doorcapYBlocks,X : STA.W $4202
    LDA.W RoomWidthBlocks : STA.W $4203
    LDA.L DoorHeaders_doorcapXBlocks,X
    REP #$20
    AND.W #$00FF : CLC : ADC.W $4216 : ASL
    CLI
    LDX.W #$004E

  .loop:
    CMP.W PLM_BlockIndices,X : BEQ .found
    DEX #2 : BPL .loop

  .noColoredDoor:
    CLC
    RTS

  .found:
    LDA.W PLM_IDs,X : BEQ .noColoredDoor
    LDA.W PLM_RoomArgs,X : BMI +
    PHX
    JSL BitIndexToByteIndexAndBitmask
    LDA.L SRAMMirror_Doors,X
    PLX
    AND.W Bitmask : BNE .noColoredDoor

+   LDA.W #$0001 : STA.L PLMExtra_InstructionTimers,X
    TXY
    LDA.W PLM_IDs,X : BEQ .noColoredDoor
    TAX
    LDA.L PLMEntries_instList2,X : STA.W PLM_InstListPointers,Y
    SEC
    RTS


;;; $E97C: Load library background ;;;
LoadLibraryBackground_LoadingPausing:
; Called when loading game or unpausing. For door transitions, see $E512
; Note that when unpausing, $8D96 (restore BG2 tilemap from pause menu) gets executed,
; overwriting any changes made to the BG2 tilemap here
    PHP : PHB
    REP #$30
    JSL ClearFXTilemap
    LDA.W FX_TilemapPointer : BEQ +
    STA.W $4312
    LDA.W #$5BE0 : STA.W $2116
    LDA.W #$1801 : STA.W $4310
    LDA.W #$008A : STA.W $4314
    LDA.W #$0840 : STA.W $4315
    SEP #$20
    LDA.B #$80 : STA.W $2115
    LDA.B #$02 : STA.W $420B
    REP #$20
    TYA : CLC : ADC.W #$0007 : TAY
    CLC

+   PEA $8F00 : PLB : PLB
    REP #$20
    LDX.W RoomStatePointer
    LDY.W $0016,X : BPL .return

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


;;; $E9E5: Load library background - command 0: terminator ;;;
LoadLibraryBackgroundLP_0_Terminator:
;; Returns:
;;     Carry: Set. Finished list
    SEC
    RTS


;;; $E9E7: Load library background - command Eh: door dependent transfer to VRAM ;;;
LoadLibraryBackgroundLP_E_DoorDependentTransferToVRAM:
;; Parameters:
;;     Y: Pointer to parameters
;; Returns:
;;     Carry: Clear. Not finished list
;;     Y: Pointer to next command

; Command Eh is only used by landing site, WS entrance and WS back door
    LDA.W DoorPointer : CMP.W $0000,Y : BEQ +
    TYA : CLC : ADC.W #$0009 : TAY
    CLC
    RTS

+   INY #2
; fallthrough to LoadLibraryBackgroundLP_2_TransferToVRAM


;;; $E9F9: Load library background - command 2: transfer to VRAM ;;;
LoadLibraryBackgroundLP_2_TransferToVRAM:
;; Parameters:
;;     Y: Pointer to command parameters
;; Returns:
;;     Carry: Clear. Not finished list
;;     Y: Pointer to next command
    LDA.W $0003,Y : STA.W $2116
    LDA.W #$1801 : STA.W $4310
    LDA.W $0000,Y : STA.W $4312
    LDA.W $0002,Y : STA.W $4314
    LDA.W $0005,Y : STA.W $4315
    SEP #$20
    LDA.B #$80 : STA.W $2115
    LDA.B #$02 : STA.W $420B
    REP #$20
    TYA : CLC : ADC.W #$0007 : TAY
    CLC
    RTS


;;; $EA2D: Load library background - command 4: decompression ;;;
LoadLibraryBackgroundLP_4_Decompression:
;; Parameters:
;;     Y: Pointer to command parameters
;; Returns:
;;     Carry: Clear. Not finished list
;;     Y: Pointer to next command
    PHY
    LDA.W $0000,Y : STA.B DP_DecompSrc
    LDA.W $0001,Y : STA.B DP_DecompSrc+1
    LDA.W #$7E00 : STA.B DP_DecompDest+1
    LDA.W $0003,Y : STA.B DP_DecompDest
    JSL Decompression_VariableDestination
    PLA : CLC : ADC.W #$0005 : TAY
    CLC
    RTS


;;; $EA4E: Load library background - command 6: clear FX tilemap ;;;
LoadLibraryBackgroundLP_6_ClearFXTilemap:
;; Returns:
;;     Carry: Clear. Not finished list

; Command 6 is unused
    PHY
    JSL ClearFXTilemap
    PLY
    CLC
    RTS


;;; $EA56: Load library background - command Ah: clear BG2 tilemap ;;;
LoadLibraryBackgroundLP_A_ClearBG2Tilemap:
;; Returns:
;;     Carry: Clear. Not finished list

; Command Ah is only used by:
;     Phantoon's room and Draygon's room (which aren't load station rooms)
;     Ceres elevator shaft (which doesn't display BG2)

; So this routine has no observable effect (and hence the bug in ClearBG2Tilemap doesn't show)
    PHY
    JSL ClearBG2Tilemap
    PLY
    CLC
    RTS


;;; $EA5E: Load library background - command Ch: clear Kraid's layer 2 ;;;
LoadLibraryBackgroundLP_C_ClearKraidsLayer2:
;; Returns:
;;     Carry: Clear. Not finished list

; Identical to $EA56
; Command Ch is only used by Kraid's room (which isn't a load station room),
; so this routine has no observable effect (and hence the bug in ClearBG2Tilemap doesn't show)
    PHY
    JSL ClearBG2Tilemap
    PLY
    CLC
    RTS


;;; $EA66: Load library background - command 8: transfer to VRAM and set BG3 tiles base address = $2000 ;;;
LoadLibraryBackgroundLP_8_TransferVRAM_and_SetBG3TilesAddr:
;; Parameters:
;;     Y: Pointer to command parameters
;; Returns:
;;     Carry: Clear. Not finished list
;;     Y: Pointer to next command

; Command 8 is only used by Kraid's room
    JSR LoadLibraryBackgroundLP_2_TransferToVRAM
    SEP #$20
    LDA.B #$02 : STA.B DP_BGTilesAddr+1
    REP #$20
    CLC
    RTS


;;; $EA73: Load level, scroll and CRE data ;;;
Load_Level_Scroll_and_CRE_Data:
; 'Level data' as pointed to by LevelDataPointer is a compressed block of data containing the actual level data, BTS data, and optionally custom layer 2 background data.
; It is decompressed to $7F:0000 where the first word gives the number of bytes of level data,
; followed by the level data (which is decompressed into the right location),
; followed by BTS data (which needs to be copied over to $7F:6402,
; optionally followed by custom layer 2 data (which is copied over to $7F:9602).

; As BTS data is half the size of level data, you get the following (slightly awkward) addresses for the begin and end of each data:
;     Level data: $7F:0002                      to $7F:0002 + [$7F:0000]
;     BTS:        $7F:0002 + [$7F:0000]         to $7F:0002 + [$7F:0000] / 2 * 3
;     Background: $7F:0002 + [$7F:0000] / 2 * 3 to $7F:0002 + [$7F:0000] / 2 * 5
    PEA $8F00 : PLB : PLB
    LDX.W #$18FE
    LDA.W #$8000

-   STA.L LevelData,X : STA.L LevelData+$1900,X
    STA.L LevelData+$3200,X : STA.L LevelData+$4B00,X
    DEX #2 : BPL -
    LDA.W LevelDataPointer+1 : STA.B DP_DecompSrc+1
    LDA.W LevelDataPointer : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl LevelData-2
    PHB
    PEA.W LevelData>>8&$FF00 : PLB : PLB
    LDA.W $0000 : TAX
    LSR : ADC.W $0000 : ADC.W $0000 : TAY
    BRA +

-   LDA.W $0002,Y : STA.W CustomBackground,X

+   DEY #2
    DEX #2 : BPL -
    LDA.W $0000 : LSR : TAX
    ADC.W $0000 : TAY
    BRA +

-   LDA.W $0002,Y : STA.W BTS,X

+   DEY #2
    DEX #2 : BPL -
    PLB
    LDA.W AreaIndex : CMP.W #$0006 : BEQ .inCeres
    LDA.W CREBitset : BIT.W #$0002 : BEQ +
    LDA.W #CRE_TileTable_Compressed>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #CRE_TileTable_Compressed : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl DecompressedCRE

+   LDA.W TilesetTileTablePointer+1 : STA.B DP_DecompSrc+1
    LDA.W TilesetTileTablePointer : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl DecompressedSCE
    BRA +

  .inCeres:
    LDA.W TilesetTileTablePointer+1 : STA.B DP_DecompSrc+1
    LDA.W TilesetTileTablePointer : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl DecompressedCRE

+   LDX.W RoomStatePointer
    LDY.W $000E,X : BPL .presetScrolls
    LDX.W #$0000

-   LDA.W $0000,Y : STA.L Scrolls,X
    INY #2
    INX #2 : CPX.W #$0032 : BNE -
    BRA .return

  .presetScrolls:
    STY.B DP_Temp12
    SEP #$30
    LDA.W RoomHeightScrolls : DEC : STA.B DP_Temp14
    LDA.B #$02
    LDX.B #$00
    LDY.B #$00

  .loop:
    CPY.B DP_Temp14 : BNE +
    LDA.B DP_Temp12 : INC

+   PHY
    LDY.B #$00

-   STA.L Scrolls,X
    INX
    INY : CPY.W RoomWidthScrolls : BNE -
    PLY : INY : CPY.W RoomHeightScrolls : BNE .loop

  .return:
    REP #$30
    RTL


;;; $EB6C: Create PLMs, execute door ASM, room setup ASM and set elevator status ;;;
CreatePLMs_ExecuteDoorASM_RoomSetupASM_SetElevatorStatus:
    PEA $8F00 : PLB : PLB
    LDX.W RoomStatePointer
    LDA.W $0014,X : BEQ .noPLMs
    TAX

  .loop:
    LDA.W $0000,X : BEQ .noPLMs
    JSL Spawn_Room_PLM
    TXA : CLC : ADC.W #$0006 : TAX
    BRA .loop

  .noPLMs:
    JSL Execute_Door_ASM
    JSL Execute_Room_Setup_ASM
    LDA.W ElevatorProperties : BEQ .return
    LDA.W #$0002 : STA.W ElevatorStatus

  .return:
    RTL


;;; $EB9F: Game state 2 (game options menu) ;;;
GameState_2_GameOptionsMenu:
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W GameOptionsMenuIndex : ASL : TAX
    JSR.W (.pointers,X)
    JSR GameOptionsMenu_ObjectHandler
    JSR Draw_GameOptionsMenu_Spritemaps
    LDA.W GameOptionsMenuIndex : CMP.W #$0002 : BMI .return
    JSR Draw_GameOptionsMenu_BG1

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


;;; $EBDB: Game options menu - [menu index] = 0 (finish fading out) ;;;
GameOptionsMenu_0_FinishFadingOut:
    JSL HandleFadingOut
    SEP #$20
    LDA.B DP_Brightness : CMP.B #$80 : BNE +
    JSL EnableNMI
    REP #$20
    STZ.W ScreenFadeDelay : STZ.W ScreenFadeCounter
    INC.W GameOptionsMenuIndex
    RTS

+   SEP #$20
    LDA.B DP_Brightness : CMP.B #$0E : BNE .return
    LDA.B DP_SubScreenLayers : BIT.B #$04 : BNE .return
    REP #$20
    LDY.W #GameOptionsMenu_Objects_SAMUS_DATA_Border
    JSR Spawn_GameOptionsMenu_Object ; Spawn border around SAMUS DATA
    RTS

  .return:
    REP #$20
    RTS


;;; $EC11: Game options menu - [menu index] = 1 (loading options menu) ;;;
GameOptionsMenu_1_LoadingOptionsMenu:
; Assumes forced blank
    PHP
    SEP #$30
    LDA.B #$00 : STA.B DP_BGTilesAddr
    LDA.B #$13 : STA.B DP_MainScreenLayers
    STZ.B DP_SubScreenLayers : STZ.B DP_WindowAreaMainScreen : STZ.B DP_WindowAreaSubScreen
    STZ.B DP_NextGameplayColorMathA : STZ.B DP_NextGameplayColorMathB
    STZ.B DP_ColorMathA : STZ.B DP_ColorMathB
    LDA.B #$00 : STA.W $2116
    LDA.B #$58 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl Zebes_and_Stars_Tilemap
    dw $0800
    LDA.B #$02 : STA.W $420B
    REP #$30
    STZ.B DP_BG1XScroll : STZ.B DP_BG1YScroll
    STZ.B DP_BG2XScroll : STZ.B DP_BG2YScroll
    STZ.W DebugInvincibility
    LDX.W #$01FE

-   LDA.L Menu_Palettes,X : STA.L Palettes,X
    DEX #2 : BPL -
    LDA.W #GameOptionsMenu_OptionsScreen_Tilemap>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #GameOptionsMenu_OptionsScreen_Tilemap : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl GameOptionsTilemap_Options
    LDA.W #GameOptionsMenu_ControllerSettings_English_Tilemap>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #GameOptionsMenu_ControllerSettings_English_Tilemap : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl GameOptionsTilemap_EnglishControllerSettings
    LDA.W #GameOptionsMenu_ControllerSettings_Japanese_Tilemap>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #GameOptionsMenu_ControllerSettings_Japanese_Tilemap : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl GameOptionsTilemap_JapanControllerSettings
    LDA.W #GameOptionsMenu_SpecialSettings_English_Tilemap>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #GameOptionsMenu_SpecialSettings_English_Tilemap : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl GameOptionsTilemap_EnglishSpecialSettings
    LDA.W #GameOptionsMenu_SpecialSettings_Japanese_Tilemap>>8&$FF00 : STA.B DP_DecompSrc+1
    LDA.W #GameOptionsMenu_SpecialSettings_Japanese_Tilemap : STA.B DP_DecompSrc
    JSL Decompression_HardcodedDestination
    dl GameOptionsTilemap_JapanSpecialSettings
    LDX.W #$07FE

-   LDA.L GameOptionsTilemap_Options,X : STA.L GameOptionsMenuTilemap,X
    DEX #2 : BPL -
    STZ.W MenuOptionIndex
    JSR Delete_GameOptionsMenu_Objects
    LDY.W #GameOptionsMenu_Objects_MenuSelectionMissile_setup
    JSR Spawn_GameOptionsMenu_Object
    LDY.W #GameOptionsMenu_Objects_OPTION_MODE_Border
    JSR Spawn_GameOptionsMenu_Object
    INC.W GameOptionsMenuIndex
    JSR Set_Language_Text_Option_Highlight
    PLP
    RTS


;;; $ECE4: Game options menu - [menu index] = 2 (fading in options menu) ;;;
GameOptionsMenu_2_FadingInOptionsMenu:
    JSL HandleFadingIn
    SEP #$20
    LDA.B DP_Brightness : CMP.B #$0F : BNE .return
    REP #$20
    STZ.W ScreenFadeDelay : STZ.W ScreenFadeCounter
    INC.W GameOptionsMenuIndex
    RTS

  .return:
    REP #$20
    RTS


;;; $ECFF: Draw game options menu BG1 ;;;
Draw_GameOptionsMenu_BG1:
; Queue transfer of $7E:3000..37FF to VRAM $5000..53FF
    PHP
    REP #$30
    LDX.W VRAMWriteStack
    LDA.W #$0800 : STA.B VRAMWrite.size,X
    INX #2
    LDA.W #GameOptionsMenuTilemap : STA.B VRAMWrite.size,X
    INX #2
    SEP #$20
    LDA.B #GameOptionsMenuTilemap>>16 : STA.B VRAMWrite.size,X
    REP #$20
    INX
    LDA.W #$5000 : STA.B VRAMWrite.size,X
    INX #2 : STX.W VRAMWriteStack
    PLP
    RTS


;;; $ED28: Set game options menu tile palettes ;;;
Set_GameOptionsMenu_TilePalettes:
;; Parameters:
;;     A: Palette index (multiple of 400h)
;;     X: Tilemap index (multiple of 2)
;;     Y: Size (multiple of 2)
    PHP
    REP #$30
    STA.B DP_Temp12

  .loop:
    LDA.L GameOptionsMenuTilemap,X : AND.W #$E3FF : ORA.B DP_Temp12 : STA.L GameOptionsMenuTilemap,X
    INX #2
    DEY #2 : BNE .loop
    PLP
    RTS


;;; $ED42: Game options menu - [menu index] = 3 (options menu) ;;;
GameOptionsMenu_3_OptionsMenu:
    PHP
    REP #$30
    LDA.B DP_Controller1New : AND.W #$0800 : BEQ .checkDown
    LDA.W #$0037
    JSL QueueSound_Lib1_Max6
    DEC.W MenuOptionIndex : BPL .checkB
    LDA.W #$0004 : STA.W MenuOptionIndex
    BRA .checkB

  .checkDown:
    LDA.B DP_Controller1New : AND.W #$0400 : BEQ .checkB
    LDA.W #$0037
    JSL QueueSound_Lib1_Max6
    LDA.W MenuOptionIndex : INC : STA.W MenuOptionIndex
    CMP.W #$0005 : BNE .checkB
    STZ.W MenuOptionIndex

  .checkB:
    LDA.B DP_Controller1New : BIT.W #$8000 : BNE .cancel
    BIT.W #$0080 : BNE .actiate
    BIT.W #$1000 : BEQ .return

  .actiate:
    LDA.W #$0038
    JSL QueueSound_Lib1_Max6
    LDA.W MenuOptionIndex : ASL : TAX
    JSR.W (.pointers,X)

  .return:
    PLP
    RTS

  .cancel:
    LDA.W #$000B : STA.W GameOptionsMenuIndex
    PLP
    RTS

  .pointers:
    dw GameOptionsMenu_StartGame                      ; Start game
    dw GameOptionsMenu_OptionsMenu_ToggleLanguageText ; English text
    dw GameOptionsMenu_OptionsMenu_ToggleLanguageText ; Japanese Text
    dw Start_GameOptionsMenu_DissolveTransition       ; Controller setting mode
    dw Start_GameOptionsMenu_DissolveTransition       ; Special setting mode


;;; $EDB1: Game options menu - options menu - start game ;;;
GameOptionsMenu_StartGame:
    LDA.W Debug_Enable : BEQ .debug
    LDA.B DP_Controller1Input : BIT.W #$0020 : BEQ .startGame

  .debug:
    LDA.L SRAMMirror_LoadingGameState : CMP.W #$0005 : BNE .fadeScreen

  .startGame:
    LDA.W #$0004 : STA.W GameOptionsMenuIndex
    RTS

  .fadeScreen:
    STZ.W ScreenFadeDelay : STZ.W ScreenFadeCounter
    LDA.W #$000C : STA.W GameOptionsMenuIndex
    RTS


;;; $EDDA: Game options menu - options menu - toggle language text ;;;
GameOptionsMenu_OptionsMenu_ToggleLanguageText:
    STZ.W MenuOptionIndex
    LDA.W JapanText : BEQ .japaneseText
    STZ.W JapanText
    BRA Set_Language_Text_Option_Highlight

  .japaneseText:
    LDA.W #$0001 : STA.W JapanText
; fallthrough to Set_Language_Text_Option_Highlight


;;; $EDED: Set language text option highlight ;;;
Set_Language_Text_Option_Highlight:
    LDA.W JapanText : BNE .japaneseText
    LDX.W #$0288
    LDY.W #$0018
    LDA.W #$0000
    JSR Set_GameOptionsMenu_TilePalettes
    LDX.W #$02C8
    LDY.W #$0018
    LDA.W #$0000
    JSR Set_GameOptionsMenu_TilePalettes
    LDX.W #$0348
    LDY.W #$0032
    LDA.W #$0400
    JSR Set_GameOptionsMenu_TilePalettes
    LDX.W #$0388
    LDY.W #$0032
    LDA.W #$0400
    JSR Set_GameOptionsMenu_TilePalettes
    BRA .return

  .japaneseText:
    LDX.W #$0288
    LDY.W #$0018
    LDA.W #$0400
    JSR Set_GameOptionsMenu_TilePalettes
    LDX.W #$02C8
    LDY.W #$0018
    LDA.W #$0400
    JSR Set_GameOptionsMenu_TilePalettes
    LDX.W #$0348
    LDY.W #$0032
    LDA.W #$0000
    JSR Set_GameOptionsMenu_TilePalettes
    LDX.W #$0388
    LDY.W #$0032
    LDA.W #$0000
    JSR Set_GameOptionsMenu_TilePalettes

  .return:
    RTS


;;; $EE55: Start game options menu dissolve transition ;;;
Start_GameOptionsMenu_DissolveTransition:
    SEP #$20
    LDA.B #$03 : STA.B DP_Mosaic
    REP #$20
    STZ.W ScreenFadeDelay : STZ.W ScreenFadeCounter
    LDA.W #$0005 : STA.W GameOptionsMenuIndex
    RTS


;;; $EE6A: Game options menu - [menu index] = Bh (transition back to file select) ;;;
GameOptionsMenu_B_TransitionBackToFileSelect:
    JSL HandleFadingOut
    SEP #$20
    LDA.B DP_Brightness : CMP.B #$80 : BNE .return
    JSL EnableNMI
    REP #$20
    STZ.W ScreenFadeDelay : STZ.W ScreenFadeCounter
    LDA.W #$0004 : STA.W GameState
    STZ.W PauseMenu_MenuIndex : STZ.W GameOptionsMenuIndex
    RTS

  .return:
    REP #$20
    RTS


;;; $EE92: Game options menu - [menu index] = Ch (fading out options menu to start game) ;;;
GameOptionsMenu_C_FadingOutOptionsMenuToStartGame:
    JSL HandleFadingOut
    SEP #$20
    LDA.B DP_Brightness : CMP.B #$80 : BNE .return
    JSL EnableNMI
    REP #$20
    STZ.W ScreenFadeDelay : STZ.W ScreenFadeCounter
    LDA.W #$0004 : STA.W GameOptionsMenuIndex
    RTS

  .return:
    REP #$20
    RTS


;;; $EEB4: Game options menu - [menu index] = 4 (start game) ;;;
GameOptionsMenu_4_StartGame:
    STZ.W GameOptionsMenuIndex
    LDA.W Debug_Enable : BEQ .checkLoadingState
    LDA.B DP_Controller1Input : BIT.W #$0020 : BEQ .debug

  .checkLoadingState:
    LDA.L SRAMMirror_LoadingGameState : BEQ .intro
    STA.W GameState
    CMP.W #$0022 : BNE .cutscene
    LDA.W #CinematicFunction_CeresGoesBoom_Initial : STA.W CinematicFunction
    BRA .cutscene

  .intro:
    LDA.W #$001E : STA.W GameState
    LDA.W #CinematicFunction_Intro_Initial : STA.W CinematicFunction
    STZ.W MenuOptionIndex
    STZ.W ScreenFadeDelay : STZ.W ScreenFadeCounter
    RTS

  .cutscene:
    STZ.W MenuOptionIndex : STZ.W GameOptionsMenuIndex
    RTS

  .debug:
    LDA.L SRAMMirror_LoadingGameState : CMP.W #$0005 : BEQ .fileSelectMap
    LDA.W #$0005 : STA.W GameState : STA.L SRAMMirror_LoadingGameState
    LDA.W SaveSlotSelected
    JSL SaveToSRAM
    RTS

  .fileSelectMap:
    LDA.W #$0005 : STA.W GameState
    RTS


;;; $EF18: Game options menu - [menu index] = 5 (dissolve out screen) ;;;
GameOptionsMenu_5_DissolveOutScreen:
    JSL HandleFadingOut
    SEP #$20
    LDA.B DP_Mosaic : CMP.B #$F3 : BEQ .notFinishedFadingOut
    CLC : ADC.B #$10 : STA.B DP_Mosaic

  .notFinishedFadingOut:
    LDA.B DP_Brightness : CMP.B #$80 : BEQ .finishedFadingOut
    REP #$20
    RTS

  .finishedFadingOut:
    JSL EnableNMI
    REP #$20
    STZ.W ScreenFadeDelay : STZ.W ScreenFadeCounter
    STZ.B DP_BG1YScroll
    INC.W GameOptionsMenuIndex
    LDA.W MenuOptionIndex : BEQ .gotoOptionsMenu
    BIT.W #$0004 : BNE .specialSubmenu
    LDA.W JapanText : BNE .japaneseControllerSettings
    LDX.W #$07FE

  .englishCtrlLoop:
    LDA.L GameOptionsTilemap_EnglishControllerSettings,X : STA.L GameOptionsMenuTilemap,X
    DEX #2 : BPL .englishCtrlLoop
    BRA .continueControllerSettingsSettings

  .japaneseControllerSettings:
    LDX.W #$07FE

  .japaneseCtrlLoop:
    LDA.L GameOptionsTilemap_JapanControllerSettings,X : STA.L GameOptionsMenuTilemap,X
    DEX #2 : BPL .japaneseCtrlLoop

  .continueControllerSettingsSettings:
    LDY.W #GameOptionsMenu_Objects_CONTROLLER_SETTING_MODE_Border
    JSR Spawn_GameOptionsMenu_Object
    JSR GameOptionsMenu_ControllerBindings
    JSR Draw_GameOptionsMenu_ControllerBindings
    RTS

  .gotoOptionsMenu:
    BRA .optionsMenu

  .specialSubmenu:
    LDA.W JapanText : BNE .japaneseSettings
    LDX.W #$07FE

  .englishSettingsLoop:
    LDA.L GameOptionsTilemap_EnglishSpecialSettings,X : STA.L GameOptionsMenuTilemap,X
    DEX #2 : BPL .englishSettingsLoop
    BRA .continueSpecial

  .japaneseSettings:
    LDX.W #$07FE

  .japaneseSettingsLoop:
    LDA.L GameOptionsTilemap_JapanSpecialSettings,X : STA.L GameOptionsMenuTilemap,X
    DEX #2 : BPL .japaneseSettingsLoop

  .continueSpecial:
    STZ.W MenuOptionIndex
    JSR Set_SpecialSetting_Highlights
    LDA.W #$0001 : STA.W MenuOptionIndex
    JSR Set_SpecialSetting_Highlights
    LDA.W #$0004 : STA.W MenuOptionIndex
    LDY.W #GameOptionsMenu_Objects_SPECIAL_SETTING_MODE_Border
    JSR Spawn_GameOptionsMenu_Object
    RTS

  .optionsMenu:
    LDX.W #$07FE

  .optionsMenuLoop:
    LDA.L GameOptionsTilemap_Options,X : STA.L GameOptionsMenuTilemap,X
    DEX #2 : BPL .optionsMenuLoop
    JSR Set_Language_Text_Option_Highlight
    LDY.W #GameOptionsMenu_Objects_OPTION_MODE_Border
    JSR Spawn_GameOptionsMenu_Object
    RTS


;;; $EFDB: Game options menu - [menu index] = 6 (dissolve in screen) ;;;
GameOptionsMenu_6_DissolveInScreen:
    JSL HandleFadingIn
    SEP #$20
    LDA.B DP_Mosaic : CMP.B #$03 : BEQ .brightness
    SEC : SBC.B #$10 : STA.B DP_Mosaic

  .brightness:
    LDA.B DP_Brightness : CMP.B #$0F : BNE .return
    STZ.B DP_Mosaic
    REP #$20
    STZ.W ScreenFadeDelay : STZ.W ScreenFadeCounter
    LDA.W MenuOptionIndex : BEQ .OptionsMenu
    BIT.W #$0004 : BNE .specialSubmenu
    LDA.W #$0007 : STA.W GameOptionsMenuIndex
    STZ.W MenuOptionIndex
    RTS

  .specialSubmenu:
    LDA.W #$0008 : STA.W GameOptionsMenuIndex
    STZ.W MenuOptionIndex
    RTS

  .OptionsMenu:
    LDA.W #$0003 : STA.W GameOptionsMenuIndex
    RTS

  .return:
    REP #$20
    RTS


;;; $F024: Game options menu - [menu index] = 8 (special settings) ;;;
GameOptionsMenu_8_SpecialSettings:
    LDA.B DP_Controller1New : AND.W #$0800 : BEQ .checkDown
    LDA.W #$0037
    JSL QueueSound_Lib1_Max6
    DEC.W MenuOptionIndex : BPL .checkB
    LDA.W #$0002 : STA.W MenuOptionIndex
    BRA .checkB

  .checkDown:
    LDA.B DP_Controller1New : AND.W #$0400 : BEQ .checkB
    LDA.W #$0037
    JSL QueueSound_Lib1_Max6
    LDA.W MenuOptionIndex : INC : STA.W MenuOptionIndex
    CMP.W #$0003 : BNE .checkB
    STZ.W MenuOptionIndex

  .checkB:
    LDA.B DP_Controller1New : BIT.W #$8000 : BEQ .checkActivate
    LDA.W #$0038
    JSL QueueSound_Lib1_Max6
    STZ.W MenuOptionIndex
    JSR Start_GameOptionsMenu_DissolveTransition
    RTS

  .checkActivate:
    LDA.B DP_Controller1New : BIT.W #$1380 : BEQ .return
    LDA.W #$0038
    JSL QueueSound_Lib1_Max6
    LDA.W MenuOptionIndex : ASL : TAX
    JSR.W (.pointers,X)

  .return:
    RTS

  .pointers:
    dw GameOptions_SpecialSettings_ToggleSetting
    dw GameOptions_SpecialSettings_ToggleSetting
    dw GameOptions_SpecialSettings_End


;;; $F08E: Game options - special settings - toggle setting ;;;
GameOptions_SpecialSettings_ToggleSetting:
    LDA.W MenuOptionIndex : ASL : TAX
    LDA.W SpecialSettingRAMAddresses,X : TAX
    LDA.W $0000,X : BEQ .toggleOn
    ; toggle off
    LDA.W #$0000 : STA.W $0000,X
    BRA .highlight

  .toggleOn:
    LDA.W #$0001 : STA.W $0000,X

  .highlight:
    JSR Set_SpecialSetting_Highlights
    RTS


;;; $F0AE: Special setting RAM addresses ;;;
SpecialSettingRAMAddresses:
    dw $09EA ; Icon cancel flag
    dw $09E4 ; Moonwalk flag


;;; $F0B2: Game options - special settings - end ;;;
GameOptions_SpecialSettings_End:
    STZ.W MenuOptionIndex
    JSR Start_GameOptionsMenu_DissolveTransition
    RTS


;;; $F0B9: Set special setting highlights ;;;
Set_SpecialSetting_Highlights:
    LDA.W MenuOptionIndex : ASL : TAX
    LDA.W SpecialSettingRAMAddresses,X : TAX
    LDA.W $0000,X : BNE .settingIsOn
    LDA.W MenuOptionIndex : ASL #2 : TAX
    PHX
    LDA.W .iconCancelManualRow0,X : TAX
    LDY.W #$000C
    LDA.W #$0400
    JSR Set_GameOptionsMenu_TilePalettes
    PLX : PHX
    LDA.W .iconCancelManualRow1,X : TAX
    LDY.W #$000C
    LDA.W #$0400
    JSR Set_GameOptionsMenu_TilePalettes
    PLX : PHX
    LDA.W .iconCancelAutoRow0,X : TAX
    LDY.W #$000C
    LDA.W #$0000
    JSR Set_GameOptionsMenu_TilePalettes
    PLX
    LDA.W .iconCancelAutoRow1,X : TAX
    LDY.W #$000C
    LDA.W #$0000
    JSR Set_GameOptionsMenu_TilePalettes
    RTS

  .settingIsOn:
    LDA.W MenuOptionIndex : ASL #2 : TAX
    PHX
    LDA.W .iconCancelManualRow0,X : TAX
    LDY.W #$000C
    LDA.W #$0000
    JSR Set_GameOptionsMenu_TilePalettes
    PLX : PHX
    LDA.W .iconCancelManualRow1,X : TAX
    LDY.W #$000C
    LDA.W #$0000
    JSR Set_GameOptionsMenu_TilePalettes
    PLX : PHX
    LDA.W .iconCancelAutoRow0,X : TAX
    LDY.W #$000C
    LDA.W #$0400
    JSR Set_GameOptionsMenu_TilePalettes
    PLX
    LDA.W .iconCancelAutoRow1,X : TAX
    LDY.W #$000C
    LDA.W #$0400
    JSR Set_GameOptionsMenu_TilePalettes
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


;;; $F159: Game options menu - [menu index] = 7 (controller settings) ;;;
GameOptionsMenu_7_ControllerSettings:
; There's some quirky code at $F1DB that enables debug invincibility going to "reset to default" in the controller settings and pressing L L L L R R R on controller 2
; But it has no effect, due to the code in Samus initialisation that disables it ($91:E156)
; Instead, it can be enabled by controller 2 holding L + R and pressing A whilst Samus is facing forward ($90:F5E4)
    LDA.B DP_Controller1New : AND.W #$0800 : BEQ .upEnd
    LDA.W #$0037
    JSL QueueSound_Lib1_Max6
    LDA.W MenuOptionIndex : DEC : STA.W MenuOptionIndex : BMI .gotoScrollDown
    CMP.W #$0006 : BEQ .scrollUp
    RTS

  .gotoScrollDown:
    LDA.W #$0008 : STA.W MenuOptionIndex
    BRA .scrollDown

  .return:
    RTS

  .upEnd:
    LDA.B DP_Controller1New : AND.W #$0400 : BEQ .downEnd
    LDA.W #$0037
    JSL QueueSound_Lib1_Max6
    LDA.W MenuOptionIndex : INC : STA.W MenuOptionIndex
    CMP.W #$0007 : BEQ .scrollDown
    CMP.W #$0009 : BNE .return
    STZ.W MenuOptionIndex
    BRA .scrollUp

  .scrollDown:
    LDA.W #$0009 : STA.W GameOptionsMenuIndex
    RTS

  .scrollUp:
    LDA.W #$000A : STA.W GameOptionsMenuIndex
    RTS

  .downEnd:
    LDA.B DP_Controller1New : BEQ .misplacedCode
    LDA.W #$0038
    JSL QueueSound_Lib1_Max6
    LDA.W MenuOptionIndex : ASL : TAX
    JSR.W (.pointers,X)
    RTS

  .misplacedCode:
    LDA.B DP_Controller2New
    BRA .backOnTrack

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
    TAY : BEQ .otherReturn
    LDA.W MenuOptionIndex
    CMP.W #$0008 : BNE .otherReturn
    LDA.W DebugInvincibility : CMP.W #$0010 : BPL .otherReturn
    LDA.W DebugInvincibility : ASL : TAX
    TYA : AND.W .inputs,X : CMP.W .inputs,X : BNE .debugInvulOff
    INC.W DebugInvincibility
    RTS

  .debugInvulOff:
    STZ.W DebugInvincibility

  .otherReturn:
    RTS

  .inputs:
    dw $0020,$0020,$0020,$0020 ; L
    dw $0010,$0010,$0010,$0010,$0010,$0010 ; R
    dw $4000 ; Y
    dw $0040,$0040 ; X
    dw $0080,$0080,$0080 ; A


;;; $F224: Game options - controller settings - reset to default ;;;
GameOptions_ControllerSettings_ResetToDefault:
    LDA.B DP_Controller1New : BIT.W #$1080 : BNE .reset
    RTS

  .reset:
    LDA.W #$0040 : STA.W ShotBinding
    LDA.W #$0080 : STA.W JumpBinding
    LDA.W #$8000 : STA.W DashBinding
    LDA.W #$4000 : STA.W ItemCancelBinding
    LDA.W #$2000 : STA.W ItemSelectBinding
    LDA.W #$0010 : STA.W AimUpBinding
    LDA.W #$0020 : STA.W AimDownBinding
    JSR GameOptionsMenu_ControllerBindings
    JSR Draw_GameOptionsMenu_ControllerBindings
    RTS


;;; $F25D: Game options - controller settings - end ;;;
GameOptions_ControllerSettings_End:
    LDA.B DP_Controller1New : BIT.W #$1080 : BNE .end
    RTS

  .end:
    JSR Save_GameOptionsMenu_ControllerBindings
    BCS .return
    STZ.W MenuOptionIndex
    JSR Start_GameOptionsMenu_DissolveTransition

  .return:
    RTS


;;; $F271: Game options menu - [menu index] = 9 (scroll controller settings down) ;;;
GameOptionsMenu_9_ScrollControllerSettingsDown:
    LDA.B DP_BG1YScroll : CLC : ADC.W #$0002 : STA.B DP_BG1YScroll
    CMP.W #$0020 : BNE .return
    LDA.W #$0007 : STA.W GameOptionsMenuIndex

  .return:
    RTS


;;; $F285: Game options menu - [menu index] = Ah (scroll controller settings up) ;;;
GameOptionsMenu_A_ScrollControllerSettingsUp:
    LDA.B DP_BG1YScroll : SEC : SBC.W #$0002 : STA.B DP_BG1YScroll : BNE .return
    LDA.W #$0007 : STA.W GameOptionsMenuIndex

  .return:
    RTS


;;; $F296: Setup - menu selection missile ;;;
Setup_MenuSelectionMissile:
;; Parameters:
;;     Y: Game options menu object index
    LDA.W #$0018 : STA.W GameOptionsMenuObject_XPositions,Y
    LDA.W #$0038 : STA.W GameOptionsMenuObject_YPositions,Y
    LDA.W #$0E00 : STA.W GameOptionsMenuObject_PaletteIndices,Y
    RTS


;;; $F2A9: Pre-instruction - menu selection missile ;;;
PreInstruction_MenuSelectionMissile:
;; Parameters:
;;     X: Game options menu object index
    LDA.W GameState : CMP.W #$0002 : BEQ +
    LDA.W #$0001 : STA.W GameOptionsMenuObject_InstructionTimers,X
    LDA.W #InstList_GameOptionsMenu_Delete : STA.W GameOptionsMenuObject_InstListPointers,X
    RTS

+   LDA.W GameOptionsMenuIndex : ASL : TAY
    LDA.W .pointers,Y : BEQ +
    STA.B DP_Temp12
    LDA.W MenuOptionIndex : ASL #2 : CLC : ADC.B DP_Temp12 : TAY
    LDA.W $0000,Y : STA.W GameOptionsMenuObject_XPositions,X
    LDA.W $0002,Y : STA.W GameOptionsMenuObject_YPositions,X
    RTS

+   LDA.W #$0180 : STA.W GameOptionsMenuObject_XPositions,X
    LDA.W #$0010 : STA.W GameOptionsMenuObject_YPositions,X
    RTS

  .pointers:
    dw $0000,$0000           ; 0 - Finish fading out
    dw .OptionsMenu_X        ; 2 - Fading in options menu
    dw .OptionsMenu_X        ; 3 - Options menu
    dw $0000,$0000,$0000     ; 4 - Start game
    dw .ControllerSettings_X ; 7 - Controller settings
    dw .SpecialSettings_X    ; 8 - Special settings
    dw $0000,$0000           ; 9 - Scroll controller settings down
    dw .OptionsMenu_X        ; B - Transition back to file selection
    dw $0000                 ; C - Fading out options menu to start game

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


;;; $F34B: Setup - border around OPTION MODE ;;;
Setup_BorderAround_OPTION_MODE:
;; Parameters:
;;     Y: Game options menu object index
    LDA.W #$007C : STA.W GameOptionsMenuObject_XPositions,Y
    BRA Common_Border_Setup


;;; $F353: Setup - border around CONTROLLER SETTING MODE ;;;
Setup_BorderAround_CONTRLLER_SETTING_MODE:
;; Parameters:
;;     Y: Game options menu object index
    LDA.W #$0084 : STA.W GameOptionsMenuObject_XPositions,Y
    BRA Common_Border_Setup


;;; $F35B: Setup - border around SPECIAL SETTING MODE ;;;
Setup_BorderAround_SPECIAL_SETTING_MODE:
;; Parameters:
;;     Y: Game options menu object index
    LDA.W #$0080 : STA.W GameOptionsMenuObject_XPositions,Y
    BRA Common_Border_Setup


;;; $F363: Setup - border around SAMUS DATA ;;;
Setup_BorderAround_SAMUS_DATA:
;; Parameters:
;;     Y: Game options menu object index
    LDA.W #$0080 : STA.W GameOptionsMenuObject_XPositions,Y
; fallthrough to Common_Border_Setup


;;; $F369: Common border setup ;;;
Common_Border_Setup:
;; Parameters:
;;     Y: Game options menu object index
    LDA.W #$0010 : STA.W GameOptionsMenuObject_YPositions,Y
    LDA.W #$0E00 : STA.W GameOptionsMenuObject_PaletteIndices,Y
    RTS


;;; $F376: Pre-instruction - border around OPTION MODE ;;;
PreInstruction_BorderAround_OPTIONS_MODE:
;; Parameters:
;;     X: Game options menu object index
    LDA.W GameState : CMP.W #$0002 : BNE .delete
    LDA.W GameOptionsMenuIndex : CMP.W #$0006 : BNE .return
    SEP #$20
    LDA.B DP_Brightness : CMP.B #$80 : BEQ .delete
    REP #$20
    RTS

  .delete:
    REP #$20
    LDA.W #$0001 : STA.W GameOptionsMenuObject_InstructionTimers,X
    LDA.W #InstList_GameOptionsMenu_Delete : STA.W GameOptionsMenuObject_InstListPointers,X

  .return:
    RTS


;;; $F3A0: Pre-instruction - border around CONTROLLER SETTING MODE ;;;
PreInstruction_BorderAround_CONTRLLER_SETTING_MODE:
;; Parameters:
;;     X: Game options menu object index
    LDA.W GameOptionsMenuIndex : CMP.W #$0006 : BNE .dissolveInEnd
    SEP #$20
    LDA.B DP_Brightness : CMP.B #$80 : BEQ .delete
    REP #$20
    RTS

  .delete:
    REP #$20
    LDA.W #$0001 : STA.W GameOptionsMenuObject_InstructionTimers,X
    LDA.W #InstList_GameOptionsMenu_Delete : STA.W GameOptionsMenuObject_InstListPointers,X
    RTS

  .dissolveInEnd:
    CMP.W #$0009 : BNE .checkScrollingUp
    LDA.W GameOptionsMenuObject_YPositions,X : SEC : SBC.W #$0002 : STA.W GameOptionsMenuObject_YPositions,X
    RTS

  .checkScrollingUp:
    CMP.W #$000A : BNE .return
    LDA.W GameOptionsMenuObject_YPositions,X : CLC : ADC.W #$0002 : STA.W GameOptionsMenuObject_YPositions,X

  .return:
    RTS


;;; $F3E2: Pre-instruction - border around SPECIAL SETTING MODE ;;;
PreInstruction_BorderAround_SPECIAL_SETTING_MODE:
;; Parameters:
;;     X: Game options menu object index
    LDA.W GameOptionsMenuIndex : CMP.W #$0006 : BNE .return
    SEP #$20
    LDA.B DP_Brightness : CMP.B #$80 : BEQ .startedFadingIn
    REP #$20
    RTS

  .startedFadingIn:
    REP #$20
    LDA.W #$0001 : STA.W GameOptionsMenuObject_InstructionTimers,X
    LDA.W #InstList_GameOptionsMenu_Delete : STA.W GameOptionsMenuObject_InstListPointers,X

  .return:
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $F404: Unused. Pre-instruction ;;;
UNUSED_PreInstruction_82F404:
;; Parameters:
;;     X: Game options menu object index
    LDA.W GameOptionsMenuIndex : CMP.W #$0001 : BNE .return
    LDA.W #$0001 : STA.W GameOptionsMenuObject_InstructionTimers,X
    LDA.W #InstList_GameOptionsMenu_Delete : STA.W GameOptionsMenuObject_InstListPointers,X

  .return:
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $F419: Setup - file select menu Samus helmet ;;;
Setup_FileSelectMenu_SamusHelmet:
;; Parameters:
;;     Y: Game options menu object index
    LDA.W #$00D8 : STA.W GameOptionsMenuObject_XPositions,Y
    LDA.W #$0010 : STA.W GameOptionsMenuObject_YPositions,Y
    LDA.W #$0E00 : STA.W GameOptionsMenuObject_PaletteIndices,Y
    RTS


;;; $F42C: Pre-instruction - file select menu Samus helmet ;;;
PreInstruction_FileSelectMenu_SamusHelmet:
;; Parameters:
;;     X: Game options menu object index
    LDA.W GameState : CMP.W #$0002 : BEQ .extraRTS
    LDA.W #$0001 : STA.W GameOptionsMenuObject_InstructionTimers,X
    LDA.W #InstList_GameOptionsMenu_Delete : STA.W GameOptionsMenuObject_InstListPointers,X
    RTS

  .extraRTS:
    RTS


;;; $F442: Instruction list - menu selection missile ;;;
InstList_GameOptionsMenu_MenuSelectionMissile:
    dw $0008,TitleMenuSpritemaps_34_MenuSelectionMissile_0
    dw $0008,TitleMenuSpritemaps_35_MenuSelectionMissile_1
    dw $0008,TitleMenuSpritemaps_36_MenuSelectionMissile_2
    dw $0008,TitleMenuSpritemaps_37_MenuSelectionMissile_3
    dw Instruction_GameOptionsMenu_GotoY
    dw InstList_GameOptionsMenu_MenuSelectionMissile


;;; $F456: Instruction list - file select menu Samus helmet ;;;
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


;;; $F47E: Instruction list - border around OPTION MODE ;;;
InstList_GameOptionsMenu_BorderAround_OPTIONS_MODE_0:
    dw $0002,TitleMenuSpritemaps_4B_BorderAround_OPTIONS_MODE
    dw Instruction_GameOptionsMenu_PreInstruction_inY
    dw PreInstruction_BorderAround_OPTIONS_MODE

InstList_GameOptionsMenu_BorderAround_OPTIONS_MODE_1:
    dw $0090,TitleMenuSpritemaps_4B_BorderAround_OPTIONS_MODE
    dw Instruction_GameOptionsMenu_GotoY
    dw InstList_GameOptionsMenu_BorderAround_OPTIONS_MODE_1


;;; $F48E: Instruction list - border around CONTROLLER SETTING MODE ;;;
InstList_GameOptionsMenu_BorderAround_CTRL_SETTING_MODE_0:
    dw $0002,TitleMenuSpritemaps_49_BorderAround_CONTROLLER_SETTING_MODE
    dw Instruction_GameOptionsMenu_PreInstruction_inY
    dw PreInstruction_BorderAround_CONTRLLER_SETTING_MODE

InstList_GameOptionsMenu_BorderAround_CTRL_SETTING_MODE_1:
    dw $0090,TitleMenuSpritemaps_49_BorderAround_CONTROLLER_SETTING_MODE
    dw Instruction_GameOptionsMenu_GotoY
    dw InstList_GameOptionsMenu_BorderAround_CTRL_SETTING_MODE_1


;;; $F49E: Instruction list - border around SPECIAL SETTING MODE ;;;
InstList_GameOptionsMenu_BorderAround_SPECIAL_SETTING_MODE_0:
    dw $0002,TitleMenuSpritemaps_4D_BorderAround_SPECIAL_SETTING_MODE
    dw Instruction_GameOptionsMenu_PreInstruction_inY
    dw PreInstruction_BorderAround_SPECIAL_SETTING_MODE

InstList_GameOptionsMenu_BorderAround_SPECIAL_SETTING_MODE_1:
    dw $0090,TitleMenuSpritemaps_4D_BorderAround_SPECIAL_SETTING_MODE
    dw Instruction_GameOptionsMenu_GotoY
    dw InstList_GameOptionsMenu_BorderAround_SPECIAL_SETTING_MODE_1


;;; $F4AE: Instruction list - border around SAMUS DATA ;;;
InstList_GameOptionsMenu_BorderAround_SAMUS_DATA:
    dw $0090,TitleMenuSpritemaps_48_BorderAround_SAMUS_DATA
    dw Instruction_GameOptionsMenu_GotoY
    dw InstList_GameOptionsMenu_BorderAround_SAMUS_DATA


;;; $F4B6: Instruction list - delete ;;;
InstList_GameOptionsMenu_Delete:
    dw Instruction_GameOptionsMenu_Delete


;;; $F4B8: Game options menu objects ;;;
GameOptionsMenu_Objects_MenuSelectionMissile:
  .setup:
    dw Setup_MenuSelectionMissile
  .preInstruction:
    dw PreInstruction_MenuSelectionMissile
  .instructionList:
    dw InstList_GameOptionsMenu_MenuSelectionMissile

if !FEATURE_KEEP_UNREFERENCED
UNUSED_GameOptionsMenu_Objects_FileSelectMenuSamusHelmet_82F4BE:
    dw Setup_FileSelectMenu_SamusHelmet                                  ; Setup
    dw PreInstruction_FileSelectMenu_SamusHelmet                         ; Pre-instruction
    dw InstList_GameOptionsMenu_FileSelectMenu_SamusHelmet               ; Instruction list
endif ; !FEATURE_KEEP_UNREFERENCED

GameOptionsMenu_Objects_OPTION_MODE_Border:
    dw Setup_BorderAround_OPTION_MODE                                    ; Setup
    dw RTS_828C10                                                        ; Pre-instruction
    dw InstList_GameOptionsMenu_BorderAround_OPTIONS_MODE_0              ; Instruction list

GameOptionsMenu_Objects_CONTROLLER_SETTING_MODE_Border:
    dw Setup_BorderAround_CONTRLLER_SETTING_MODE                         ; Setup
    dw RTS_828C10                                                        ; Pre-instruction
    dw InstList_GameOptionsMenu_BorderAround_CTRL_SETTING_MODE_0         ; Instruction list

GameOptionsMenu_Objects_SPECIAL_SETTING_MODE_Border:
    dw Setup_BorderAround_SPECIAL_SETTING_MODE                           ; Setup
    dw RTS_828C10                                                        ; Pre-instruction
    dw InstList_GameOptionsMenu_BorderAround_SPECIAL_SETTING_MODE_0      ; Instruction list

GameOptionsMenu_Objects_SAMUS_DATA_Border:
    dw Setup_BorderAround_SAMUS_DATA                                     ; Setup
    dw RTS_828C10                                                        ; Pre-instruction
    dw InstList_GameOptionsMenu_BorderAround_SAMUS_DATA                  ; Instruction list


;;; $F4DC: Load game options menu controller bindings ;;;
GameOptionsMenu_ControllerBindings:
    LDX.W #$0000

  .loop:
    LDA.W Configurable_Controller_Binding_RAM_Addresses,X : TAY
    LDA.W $0000,Y : BIT.W #$0040 : BNE .X
    BIT.W #$0080 : BNE .A
    BIT.W #$8000 : BNE .B
    BIT.W #$2000 : BNE .Select
    BIT.W #$4000 : BNE .Y
    BIT.W #$0020 : BNE .L
    BIT.W #$0010 : BNE .R

  .X:
    LDA.W #$0000 : STA.W GameOptionsMenuObject_ControllerBindings,X
    BRA .next

  .A:
    LDA.W #$0001 : STA.W GameOptionsMenuObject_ControllerBindings,X
    BRA .next

  .B:
    LDA.W #$0002 : STA.W GameOptionsMenuObject_ControllerBindings,X
    BRA .next

  .Select:
    LDA.W #$0003 : STA.W GameOptionsMenuObject_ControllerBindings,X
    BRA .next

  .Y:
    LDA.W #$0004 : STA.W GameOptionsMenuObject_ControllerBindings,X
    BRA .next

  .L:
    LDA.W #$0005 : STA.W GameOptionsMenuObject_ControllerBindings,X
    BRA .next

  .R:
    LDA.W #$0006 : STA.W GameOptionsMenuObject_ControllerBindings,X

  .next:
    INX #2 : CPX.W #$000E : BPL .return
    JMP .loop

  .return:
    RTS


;;; $F54A: Configurable controller binding RAM addresses ;;;
Configurable_Controller_Binding_RAM_Addresses:
    dw ShotBinding
    dw JumpBinding
    dw DashBinding
    dw ItemSelectBinding
    dw ItemCancelBinding
    dw AimUpBinding
    dw AimDownBinding


;;; $F558: Save game options menu controller bindings ;;;
Save_GameOptionsMenu_ControllerBindings:
    LDX.W #$0000

  .loop:
    PHX
    LDA.W Configurable_Controller_Binding_RAM_Addresses,X : TAY
    LDA.W GameOptionsMenuObject_ControllerBindings,X : ASL : TAX
    LDA.W Controller_Input_Bitmasks,X : STA.W $0000,Y
    PLX : INX #2 : CPX.W #$000E : BMI .loop
    CLC
    RTS


;;; $F575: Controller input bitmasks ;;;
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


;;; $F587: Draw game options menu controller bindings ;;;
Draw_GameOptionsMenu_ControllerBindings:
; $91:81F4 has the evil code that physically disallows aiming to not be L and R, this code just sets the OFF tilemap
    LDX.W #$0000

  .loop:
    PHX
    LDA.W GameOptionsMenuObject_ControllerBindings,X : ASL : TAY
    LDA.W GameOptionsMenu_TilemapOffsets,X : TAX
    LDA.W ControllerButton_TilemapPointers,Y : TAY
    LDA.W $0000,Y : STA.L GameOptionsMenuTilemap,X
    LDA.W $0002,Y : STA.L GameOptionsMenuTilemap+2,X
    LDA.W $0004,Y : STA.L GameOptionsMenuTilemap+4,X
    LDA.W $0006,Y : STA.L GameOptionsMenuTilemap+$40,X
    LDA.W $0008,Y : STA.L GameOptionsMenuTilemap+$42,X
    LDA.W $000A,Y : STA.L GameOptionsMenuTilemap+$44,X
    PLX : INX #2 : CPX.W #$000E : BMI .loop
    LDA.W GameOptionsMenuObject_ControllerBindings+$A : CMP.W #$0005 : BEQ .shoulderButton
    CMP.W #$0006 : BEQ .shoulderButton
    LDA.W ButtonTilemaps_OFF : STA.L GameOptionsMenuTilemap+$52E
    LDA.W ButtonTilemaps_OFF+$2 : STA.L GameOptionsMenuTilemap+$530
    LDA.W ButtonTilemaps_OFF+$4 : STA.L GameOptionsMenuTilemap+$532
    LDA.W ButtonTilemaps_OFF+$6 : STA.L GameOptionsMenuTilemap+$56E
    LDA.W ButtonTilemaps_OFF+$8 : STA.L GameOptionsMenuTilemap+$570
    LDA.W ButtonTilemaps_OFF+$A : STA.L GameOptionsMenuTilemap+$572

  .shoulderButton:
    LDA.W GameOptionsMenuObject_ControllerBindings+$C : CMP.W #$0005 : BEQ .return
    CMP.W #$0006 : BEQ .return
    LDA.W ButtonTilemaps_OFF : STA.L GameOptionsMenuTilemap+$5EE
    LDA.W ButtonTilemaps_OFF+$2 : STA.L GameOptionsMenuTilemap+$5F0
    LDA.W ButtonTilemaps_OFF+$4 : STA.L GameOptionsMenuTilemap+$5F2
    LDA.W ButtonTilemaps_OFF+$6 : STA.L GameOptionsMenuTilemap+$62E
    LDA.W ButtonTilemaps_OFF+$8 : STA.L GameOptionsMenuTilemap+$630
    LDA.W ButtonTilemaps_OFF+$A : STA.L GameOptionsMenuTilemap+$632

  .return:
    RTS


GameOptionsMenu_TilemapOffsets:
; Game options menu tilemap offsets
    dw $016E,$022E,$02EE,$03AE,$046E,$052E,$05EE

ControllerButton_TilemapPointers:
; Controller button tilemap pointers
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
; X button tilemap
    dw $0093,$C0A3,$000F
    dw $00A3,$C093,$000F

ButtonTilemaps_A:
; A button tilemap
    dw $0090,$4090,$000F
    dw $00A0,$40A0,$000F

ButtonTilemaps_B:
; B button tilemap
    dw $0091,$0092,$000F
    dw $00A1,$00A2,$000F

ButtonTilemaps_Select:
; Select button tilemap
    dw $0095,$0096,$0097
    dw $00A5,$00A6,$00A7

ButtonTilemaps_Y:
; Y button tilemap
    dw $0094,$4094,$000F
    dw $00A4,$40A4,$000F

ButtonTilemaps_L:
; L button tilemap
    dw $009A,$009B,$409A
    dw $809A,$00AB,$C09A

ButtonTilemaps_R:
; R button tilemap
    dw $009A,$009C,$409A
    dw $809A,$00AC,$C09A

ButtonTilemaps_OFF:
; OFF tilemap
    dw $0000,$000E,$000E
    dw $0010,$001F,$001F


;;; $F6B9: Game options - controller settings - set binding ;;;
GameOptions_ControllerSettings_SetBinding:
    LDX.W #$000C
    LDA.B DP_Controller1New

  .loopInput:
    BIT.W Controller_Input_Bitmasks,X : BNE +
    DEX #2 : BPL .loopInput
    RTS

+   TXA : LSR : STA.B DP_Temp12
    LDA.W MenuOptionIndex : ASL : CLC : ADC.W #$0002
    CMP.W #$000E : BMI +
    LDA.W #$0000

+   TAY
    LDX.W #$0005

  .loopFindExisting:
    LDA.W GameOptionsMenuObject_ControllerBindings,Y : CMP.B DP_Temp12 : BEQ .found
    INY #2 : CPY.W #$000E : BMI .next
    LDY.W #$0000

  .next:
    DEX : BPL .loopFindExisting

  .found:
    PHY
    LDA.W MenuOptionIndex : ASL : TAY
    LDA.W GameOptionsMenuObject_ControllerBindings,Y : STA.B DP_Temp14
    LDA.B DP_Temp12 : STA.W GameOptionsMenuObject_ControllerBindings,Y
    PLY
    LDA.B DP_Temp14 : STA.W GameOptionsMenuObject_ControllerBindings,Y
    JSR Draw_GameOptionsMenu_ControllerBindings
    RTS


;;; $F70E: RTL ;;;
RTL_82F70E:
    RTL


Freespace_Bank82_F70F:
; $8F1 bytes
