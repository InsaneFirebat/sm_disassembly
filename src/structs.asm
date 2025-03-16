
; https://patrickjohnston.org/ASM/Lists/Super%20Metroid/RAM%20map.asm


; WRAM $0000..1FFF

org $00
DP_Temp00: skip 1 ; $00
DP_Temp01: skip 1 ; $01
DP_Temp02: skip 1 ; $02
DP_Temp03: skip 1 ; $03
DP_Temp04: skip 1 ; $04
DP_Temp05: skip 1 ; $05
DP_Temp06: skip 2 ; $06
DP_Temp08: skip 1 ; $08
DP_Temp09: skip 2 ; $09
DP_Temp0B: skip 1 ; $0B
DP_Temp0C: skip 2 ; $0C
DP_Unused0E: skip 1 ; $0E
DP_Temp0F: skip 2 ; $0F
DP_Unused11: skip 1 ; $11
DP_Temp12: skip 1 ; $12
DP_Temp13: skip 1 ; $13
DP_Temp14: skip 1 ; $14
DP_Temp15: skip 1 ; $15
DP_Temp16: skip 1 ; $16
DP_Temp17: skip 1 ; $17
DP_Temp18: skip 1 ; $18
DP_Temp19: skip 1 ; $19
DP_Temp1A: skip 1 ; $1A
DP_Temp1B: skip 1 ; $1B
DP_Temp1C: skip 1 ; $1C
DP_Temp1D: skip 1 ; $1D
DP_Temp1E: skip 1 ; $1E
DP_Temp1F: skip 1 ; $1F
DP_Temp20: skip 2 ; $20
DP_Temp22: skip 2 ; $22
DP_Temp24: skip 2 ; $24
DP_Temp26: skip 1 ; $26
DP_Temp27: skip 1 ; $27
DP_Temp28: skip 1 ; $28
DP_Temp29: skip 1 ; $29
DP_Temp2A: skip 1 ; $2A
DP_Temp2B: skip 1 ; $2B
DP_Temp2C: skip 1 ; $2C
DP_Temp2D: skip 1 ; $2D
DP_Temp2E: skip 1 ; $2E
DP_Temp2F: skip 1 ; $2F
DP_Temp30: skip 1 ; $30
DP_Temp31: skip 1 ; $31
DP_Temp32: skip 2 ; $32
DP_Temp34: skip 2 ; $34
DP_BlocksToUpdate: skip 3 ; $36
DP_Unused39: skip 3 ; $39..3B
DP_SamusTilesDefinition: skip 1 ; $3C
DP_Unused3E: skip 7 ; $3E..43
DP_ReturnParam: skip 3 ; $44
DP_DecompSrc: skip 3 ; $47
DP_DecompVar: skip 2 ; $4A
DP_DecompDest: skip 3 ; $4C
DP_DecompDictCopyBit: skip 2 ; $4F

DP_Brightness: skip 1 ; $51
DP_SpriteSizeAddr: skip 1 ; $52
DP_OAMAddrPrio: skip 2 ; $53
DP_BGModeSize: skip 1 ; $55
DP_FakeBGModeSize: skip 1 ; $56
DP_Mosaic: skip 1 ; $57
DP_BG1TilemapAddrSize: skip 1 ; $58
DP_BG2TilemapAddrSize: skip 1 ; $59
DP_BG3TilemapAddrSize: skip 1 ; $5A
DP_GameplayBG1TilemapAddrSize: skip 1 ; $5B
DP_BG4TilemapAddrSize: skip 1 ; $5C
DP_BGTilesAddr: skip 2 ; $5D
DP_Mode7Settings: skip 1 ; $5F
DP_WindowMaskBG12: skip 1 ; $60
DP_WindowMaskBG34: skip 1 ; $61
DP_WindowMaskSprite: skip 1 ; $62
DP_Window1Left: skip 1 ; $63
DP_Window1Right: skip 1 ; $64
DP_Window2Left: skip 1 ; $65
DP_Window2Right: skip 1 ; $66
DP_Window12BGMaskLogic: skip 1 ; $67
DP_Window12SpriteMaskLogic: skip 1 ; $68
DP_MainScreenLayers: skip 1 ; $69
DP_GameplayMainScreenLayers: skip 1 ; $6A
DP_SubScreenLayers: skip 1 ; $6B
DP_WindowAreaMainScreen: skip 1 ; $6C
DP_WindowAreaSubScreen: skip 1 ; $6D
DP_NextGameplayColorMathA: skip 1 ; $6E
DP_ColorMathA: skip 1 ; $6F
DP_GameplayColorMathA: skip 1 ; $70
DP_NextGameplayColorMathB: skip 1 ; $71
DP_ColorMathB: skip 1 ; $72
DP_GameplayColorMathB: skip 1 ; $73
DP_ColorMathSubScreenBackdropColor0: skip 1 ; $74
DP_ColorMathSubScreenBackdropColor1: skip 1 ; $75
DP_ColorMathSubScreenBackdropColor2: skip 1 ; $76
DP_DisplayResolution: skip 1 ; $77
DP_Mode7TransMatrixA: skip 2 ; $78
DP_Mode7TransMatrixB: skip 2 ; $7A
DP_Mode7TransMatrixC: skip 2 ; $7C
DP_Mode7TransMatrixD: skip 2 ; $7E
DP_Mode7TransOriginX: skip 2 ; $80
DP_Mode7TransOriginY: skip 2 ; $82
DP_IRQAutoJoy: skip 1 ; $84
DP_HDMAEnable: skip 1 ; $85
DP_ROMAccessSpeed: skip 1 ; $86

DP_AutoPressInitialDelay: skip 2 ; $87
DP_AutoPressSubsequentDelay: skip 2 ; $89
DP_Controller1Input: skip 2 ; $8B
DP_Controller2Input: skip 2 ; $8D
DP_Controller1New: skip 2 ; $8F
DP_Controller2New: skip 2 ; $91
DP_FakeController1New: skip 2 ; $93
DP_FakeController2New: skip 2 ; $95
DP_Controller1Prev: skip 2 ; $97
DP_Controller2Prev: skip 2 ; $99
DP_Unused9B: skip 8 ; $9B
DP_Controller1AutoPressTimer: skip 2 ; $A3
DP_Controller2AutoPressTimer: skip 2 ; $A5
DP_NextIRQCmd: skip 2 ; $A7
DP_RoomLoadIRQCmd: skip 2 ; $A9
DP_IRQCmd: skip 2 ; $AB
DP_ReturnAddrRelativeParam: skip 2 ; $AD
DP_CurrentAreaFXAnimTilesObjTable: skip 2 ; $AF
DP_BG1XScroll: skip 2 ; $B1
DP_BG1YScroll: skip 2 ; $B3
DP_BG2XScroll: skip 2 ; $B5
DP_BG2YScroll: skip 2 ; $B7
DP_BG3XScroll: skip 2 ; $B9
DP_BG3YScroll: skip 2 ; $BB
DP_BG4XScroll: skip 2 ; $BD
DP_BG4YScroll: skip 2 ; $BF
DP_UnusedC1: skip 15 ; $C1

struct VRAMWrite $D0 ; $D0..02CF
  .size: skip 2 ; $D0
  .src: skip 3 ; $D2
  .dest: skip 2 ; $D5
endstruct

struct Mode7Transfer $2D0
  .control: skip 1 ; $02D0
  .src: skip 3 ; $02D1
  .size: skip 2 ; $02D4
  .dest: skip 2 ; $02D6
  .inc: skip 1 ; $02D8
  .term: skip 1 ; $02D9
endstruct

org $0330
VRAMWriteStack: skip 2 ; $0330
skip 2 ; Unused
Mode7Stack: skip 2 ; $0334
skip 10 ; Unused

struct VRAMRead $0340
  .src: skip 2 ; $0340
  .control: skip 1 ; $0342
  .target: skip 1 ; $0343
  .dest: skip 3 ; $0344
  .size: skip 2 ; $0347
endstruct

org $0360
VRAMReadStack: skip 2 ; $0360
skip 14 ; Unused

OAMLow: skip $200 ; $0370
OAMHigh: skip $20 ; $0570
OAMStack: skip 2 ; $0590

PowerBombExplosionStatus: skip 2 ; $0592
skip 2 ; Unused
BG3XScrollHDMADataTableSize: skip 2 ; $0596
YPositionOnScreenFX22: skip 2 ; $0598
NeverRead059A: skip 2 ; $059A
NeverRead059C: skip 2 ; $059C
HUDBG2XPositionScrollingSky: skip 2 ; $059E
ContractingFlag: skip 2 ; $05A0

org $05A2
MessageBoxAnim_YRadius: skip 2 ; $05A2
MessageBoxAnim_BottomHalfPlusRadius: skip 2 ; $05A4
MessageBoxAnim_BottomHalf: skip 2 ; $05A6
MessageBoxAnim_TopHalfPlusRadius: skip 2 ; $05A8
MessageBoxAnim_TopHalf: skip 2 ; $05AA

org $05A2
ExpandContract_ExpansionFactor: skip 2 ; $05A2
ExpandContract_DestTop: skip 2 ; $05A4
ExpandContract_SrcTop: skip 2 ; $05A6
ExpandContract_DestBottom: skip 2 ; $05A8
ExpandContract_SrcBottom: skip 2 ; $05AA

org $05A6
CrocomireMelting_SrcYOffset: skip 2 ; $05A6

org $05AC
MapScroll_MinX: skip 2 ; $05AC
MapScroll_MaxX: skip 2 ; $05AE
MapScroll_MinY: skip 2 ; $05B0
MapScroll_MaxY: skip 2 ; $05B2

NMI_Request: skip 1 ; $05B4
NMI_8bitFrameCounter: skip 1 ; $05B5
NMI_FrameCounter: skip 2 ; $05B6
NMI_Counter: skip 2 ; $05B8
NMI_LagCounter: skip 1 ; $05BA
NMI_MaximumLag: skip 1 ; $05BB

DoorTransitionVRAM_Flag: skip 2 ; $05BC
DoorTransitionVRAM_Dest: skip 2 ; $05BE
DoorTransitionVRAM_Src: skip 3 ; $05C0
DoorTransitionVRAM_Size: skip 2 ; $05C3

Debug_InputL: skip 2 ; $05C5
Debug_InputR: skip 2 ; $05C7
Debug_MissileSwap: skip 2 ; $05C9
Debug_SuperMissileSwap: skip 2 ; $05CB
Debug_PowerBombSwap: skip 2 ; $05CD
Debug_Options: skip 2 ; $05CF
Debug_Enable: skip 2 ; $05D1
Debug_Layer1PositionFlag: skip 2 ; $05D3
Debug_Layer1X: skip 2 ; $05D5
Debug_Layer1Y: skip 2 ; $05D7

Input_HeldPrev: skip 2 ; $05D9
Input_TimedHeldTimer: skip 2 ; $05DB
Input_TimedHeldReset: skip 2 ; $05DD
Input_TimedHeldInput: skip 2 ; $05DF
Input_TimedHeldNew: skip 2 ; $05E1
Input_TimedHeldPrev: skip 2 ; $05E3

RandomNumberSeed: skip 2 ; $05E5
Bitmask: skip 2 ; $05E7
Multiplier16bitA: skip 2 ; $05E9
Multiplier16bitB: skip 2 ; $05EB
skip 4 ; Unused
MultiplicationResult: skip 4 ; $05F1
DisableSounds: skip 2 ; $05F5
DisableMinimap: skip 2 ; $05F7
SaveConfirmationSelection: skip 2 ; $05F9

MapScrolling_GearSwitchTimer: skip 2 ; $05FB
MapScrolling_Direction: skip 2 ; $05FD
MapScrolling_SpeedIndex: skip 2 ; $05FF

PauseHook_Pause: skip 3 ; $0601
PauseHook_Unpause: skip 3 ; $0604

EarthquakeSFX_Index: skip 2 ; $0607
EarthquakeSFX_Timer: skip 2 ; $0609

RemainingEnemySpritemapEntries: ; $060B
LoopCounterEnemyDeath: ; $060B
BotwoonSpitAngleParam: ; $060B
skip 2
RemainingEnemyHitboxEntries: ; $060D
NumberOfExtendedTilemapTiles: ; $060D
BotwoonSpitLoopCounter: ; $060D
skip 2
ProjectileCounterMirror: skip 2 ; $060F
skip 6 ; Unused

APU_UploadingFlag: skip 2 ; $0617
APU_MusicQueueEntries: skip $10 ; $0619
APU_MusicQueueTimers: skip $10 ; $0629
APU_MusicQueueNextIndex: skip 2 ; $0639
APU_MusicQueueStartIndex: skip 2 ; $063B
APU_MusicEntry: skip 2 ; $063D
APU_MusicTimer: skip 2 ; $063F
APU_RemainingPollAttempts: skip 2 ; $0641
APU_SoundQueueStartIndexLib1: skip 1 ; $0643
APU_SoundQueueStartIndexLib2: skip 1 ; $0644
APU_SoundQueueStartIndexLib3: skip 1 ; $0645
APU_SoundQueueNextIndexLib1: skip 1 ; $0646
APU_SoundQueueNextIndexLib2: skip 1 ; $0647
APU_SoundQueueNextIndexLib3: skip 1 ; $0648
APU_SoundStateLib1: skip 1 ; $0649
APU_SoundStateLib2: skip 1 ; $064A
APU_SoundStateLib3: skip 1 ; $064B
APU_CurrentMusicTrack: skip 1 ; $064C
APU_CurrentSoundLib1: skip 1 ; $064D
APU_CurrentSoundLib2: skip 1 ; $064E
APU_CurrentSoundLib3: skip 1 ; $064F
APU_ClearSoundDelayLib1: skip 1 ; $0650
APU_ClearSoundDelayLib2: skip 1 ; $0651
APU_ClearSoundDelayLib3: skip 1 ; $0652
APU_MaxQueuedSoundsAllowedLib1: skip 1 ; $0653
APU_MaxQueuedSoundsAllowedLib2: skip 1 ; $0654
APU_MaxQueuedSoundsAllowedLib3: skip 1 ; $0655
APU_SoundQueueLib1: skip $10 ; $0656
APU_SoundQueueLib2: skip $10 ; $0666
APU_SoundQueueLib3: skip $10 ; $0676
APU_SoundHandlerDowntime: skip 2 ; $0686

CrocomireMelting_SkeletonLoadingIndex: skip 2 ; $0688
CrocomireMelting_TilesLoadingTable: skip 2 ; $068A
CrocomireMelting_PixelsToErasePerColumn: skip 2 ; $068C
CrocomireMelting_WordsToLoad: skip 2 ; $068E
CrocomireMelting_XOffsetTableIndex: skip 2 ; $0690
CrocomireMelting_DisplacementCoefficient: skip 2 ; $0692
CrocomireMelting_InitialAdjustedDestYOffset: skip 2 ; $0694
CrocomireMelting_NeverRead0696: skip 2 ; $0696
CrocomireMelting_MaxAdjustedDestYOffset: skip 2 ; $0698
CrocomireMelting_TilesLoadingTableIndex: skip 2 ; $069A
CrocomireMelting_YOffsets: skip $80 ; $069C

BlockFramesTimer: skip 1 ; $071C
SamusTiles_TopHalfFlag: skip 1 ; $071D
SamusTiles_BottomHalfFlag: skip 1 ; $071E
SamusTiles_TopHalfTilesDef: skip 2 ; $071F
SamusTiles_BottomHalfTilesDef: skip 2 ; $0721

ScreenFadeDelay: skip 2 ; $0723
ScreenFadeCounter: skip 2 ; $0725

PauseMenu_MenuIndex: skip 2 ; $0727
PauseMenu_ButtonPressedHighlightTimer: skip 2 ; $0729
PauseMenu_HighlightAnimationTimer: skip 2 ; $072B
PauseMenu_ItemSelectorAnimationTimer: skip 2 ; $072D
PauseMenu_ReserveTankAnimationTimer: skip 2 ; $072F
PauseMenu_UnusedAnimationTimer0731: skip 2 ; $0731
PauseMenu_MapScrollUpArrowAnimationTimer: skip 2 ; $0733
PauseMenu_MapScrollDownArrowAnimationTimer: skip 2 ; $0735
PauseMenu_MapScrollRightArrowAnimationTimer: skip 2 ; $0737
PauseMenu_MapScrollLeftArrowAnimationTimer: skip 2 ; $0739
PauseMenu_PaletteAnimationTimer: skip 2 ; $073B
PauseMenu_UnusedAnimationTimer073D: skip 2 ; $073D
PauseMenu_HighlightAnimationFrame: skip 2 ; $073F
PauseMenu_ItemSelectorAnimationFrame: skip 2 ; $0741
PauseMenu_ReserveTankAnimationFrame: skip 2 ; $0743
PauseMenu_UnusedAnimationFrame: skip 2 ; $0745
PauseMenu_MapScrollUpArrowAnimationFrame: skip 2 ; $0747
PauseMenu_MapScrollDownArrowAnimationFrame: skip 2 ; $0749
PauseMenu_MapScrollRightArrowAnimationFrame: skip 2 ; $074B
PauseMenu_MapScrollLeftArrowAnimationFrame: skip 2 ; $074D
PauseMenu_PaletteAnimationFrame: skip 2 ; $074F
PauseMenu_ShoulderButtonPressedHighlight: skip 2 ; $0751
PauseMenu_ButtonLabelMode: skip 2 ; $0753
PauseMenu_EquipmentScreenCategoryIndex: skip 1 ; $0755
PauseMenu_EquipmentScreenItemIndex: skip 1 ; $0756
PauseMenu_ReserveTankSoundDelayCounter: skip 2 ; $0757
PauseMenu_UnusedAnimationMode: skip 2 ; $0759
PauseMenu_MapScrollUpArrowAnimationMode: skip 2 ; $075B
PauseMenu_MapScrollDownArrowAnimationMode: skip 2 ; $075D
PauseMenu_MapScrollRightArrowAnimationMode: skip 2 ; $075F
PauseMenu_MapScrollLeftArrowAnimationMode: skip 2 ; $0761
PauseMenu_MenuMode: skip 2 ; $0763
PauseMenu_Backup0058: skip 1 ; $0765
PauseMenu_Backup0059: skip 1 ; $0766
PauseMenu_Backup005A: skip 1 ; $0767
PauseMenu_Backup005D: skip 2 ; $0768
PauseMenu_Backup0052: skip 1 ; $076A
PauseMenu_Backup00B1: skip 1 ; $076B
PauseMenu_Backup00B5: skip 1 ; $076C
PauseMenu_Backup00B9: skip 1 ; $076D
PauseMenu_Backup00B3: skip 1 ; $076E
PauseMenu_Backup00B7: skip 1 ; $076F
PauseMenu_Backup00BB: skip 1 ; $0770
PauseMenu_Backup0055: skip 1 ; $0771
PauseMenu_Backup091B: skip 1 ; $0772
PauseMenu_Backup091C: skip 1 ; $0773
PauseMenu_Backup0057: skip 1 ; $0774
PauseMenu_Backup0071: skip 1 ; $0775
PauseMenu_SamusPositionIndicatorAnimFrame: skip 2 ; $0776
PauseMenu_SamusPositionIndicatorAnimTimer: skip 2 ; $0778
PauseMenu_SamusPositionIndicatorAnimLoopCount: skip 2 ; $077A

HUDItemTilemapPaletteBits: skip 2 ; $077C
skip 5 ; $077C..82
Mode7Flag: skip 2 ; $0783
UnusedMode7RotationAngle: skip 2 ; $0785
NeverRead0787: skip 2 ; $0787
CurrentAreaMapCollectedFlag: skip 2 ; $0789
LoadStationIndex: skip 2 ; $078B
DoorPointer: skip 2 ; $078D
DoorBTS: skip 2 ; $078F
DoorDirection: skip 2 ; $0791
ElevatorDoorProperties: skip 2 ; $0793
DoorTransitionFlagElevatorsZebetites: skip 2 ; $0795
DoorTransitionFlagEnemiesPause: skip 2 ; $0797
ElevatorDirection: skip 2 ; $0799
RoomPointer: skip 2 ; $079B
RoomIndex: skip 2 ; $079D
AreaIndex: skip 2 ; $079F
RoomMapX: skip 2 ; $07A1
RoomMapY: skip 2 ; $07A3
RoomWidthBlocks: skip 2 ; $07A5
RoomHeightBlocks: skip 2 ; $07A7
RoomWidthScrolls: skip 2 ; $07A9
RoomHeightScrolls: skip 2 ; $07AB
UpScroller: skip 2 ; $07AD
DownScroller: skip 2 ; $07AF
PreviousCREBitset: skip 2 ; $07B1
CREBitset: skip 2 ; $07B3
DoorListPointer: skip 2 ; $07B5
EventPointer: skip 2 ; $07B7
LevelDataSize: skip 2 ; $07B9
RoomStatePointer: skip 2 ; $07BB
LevelDataPointer: skip 3 ; $07BD
TilesetTileTablePointer: skip 3 ; $07C0
TilesetTilesPointer: skip 3 ; $07C3
TilesetPalettePointer: skip 3 ; $07C6
RoomMusicTrackIndex: skip 2 ; $07C9
RoomMusicDataIndex: skip 2 ; $07CB
FXPointer: skip 2 ; $07CD
EnemyPopulationPointer: skip 2 ; $07CF
EnemySetPointer: skip 2 ; $07D1
Unused07D3: skip 12 ; $07D3..DE
RoomMainASMPointer: skip 2 ; $07DF
RoomMainASMVar1: skip 2 ; $07E1
RoomMainASMVar2: skip 2 ; $07E3
RoomMainASMVar3: skip 2 ; $07E5
RoomMainASMVar4: skip 2 ; $07E7
ScrollingSkyFinishedHook: skip 2 ; $07E9
CeresMode7HDMATables: skip 2 ; $07EB
Unused07ED: skip 6 ; $07ED..F2
MusicDataIndex: skip 2 ; $07F3
MusicTrackIndex: skip 2 ; $07F5
MapTilesExplored: skip $100 ; $07F7..08F6
Layer1XBlock: skip 2 ; $08F7
Layer1YBlock: skip 2 ; $08F9
Layer2XBlock: skip 2 ; $08FB
Layer2YBlock: skip 2 ; $08FD
PreviousLayer1XBlock: skip 2 ; $08FF
PreviousLayer1YBlock: skip 2 ; $0901
PreviousLayer2XBlock: skip 2 ; $0903
PreviousLayer2YBlock: skip 2 ; $0905
BG1XBlock: skip 2 ; $0907
BG1YBlock: skip 2 ; $0909
BG2XBlock: skip 2 ; $090B
BG2YBlock: skip 2 ; $090D
Layer1XSubPosition: skip 2 ; $090F
Layer1XPosition: skip 2 ; $0911
Layer1YSubPosition: skip 2 ; $0913
Layer1YPosition: skip 2 ; $0915
Layer2XPosition: skip 2 ; $0917
Layer2YPosition: skip 2 ; $0919
Layer2ScrollX: skip 1 ; $091B
Layer2ScrollY: skip 1 ; $091C
BG1XOffset: skip 2 ; $091D
BG1YOffset: skip 2 ; $091F
BG2XOffset: skip 2 ; $0921
BG2YOffset: skip 2 ; $0923
DoorTransitionFrameCounter: skip 2 ; $0925
DoorDestinationXPosition: skip 2 ; $0927
DoorDestinationYPosition: skip 2 ; $0929
SamusSubSpeedDuringDoorTransition: skip 2 ; $092B
SamusSpeedDuringDoorTransition: skip 2 ; $092D
DownwardsElevatorDelayTimer: skip 2 ; $092F
DoorTransitionFinishScrolling: skip 2 ; $0931
PositionOfScrollBoundary: skip 0 ; $0933
VRAMOffsetBlocksToUpdate: skip 0 ; $0933
VRAMBlocksToUpdateXBlock0993: skip 2 ; $0933
XBlockOfVRAMBlocksToUpdate: skip 2 ; $0935
UpperScrollPosition: skip 0 ; $0937
RoomHeightInPixels: skip 0 ; $0937
VRAMTilemapScreenBaseAddr: skip 0 ; $0937
VRAMTilemapSourceDataIndex: skip 0 ; $0937
WrappedVRAMTilemapScreenBaseAddr: skip 2 ; $0937
ProposedScrolledLayer1XPosition: skip 0 ; $0939
ProposedScrolledLayer1YPosition: skip 0 ; $0939
BackgroundDataLoopCounter: skip 2 ; $0939
BackgroundBlockToUpdate: skip 2 ; $093B
Unused093D: skip 2 ; $093D
CeresStatus: skip 2 ; $093F
CameraDistanceIndex: skip 2 ; $0941
TimerStatus: skip 2 ; $0943
TimerCentiseconds: skip 1 ; $0945
TimerSeconds: skip 1 ; $0946
TimerMinutes: skip 1 ; $0947
TimerXSubPosition: skip 1 ; $0948
TimerXPosition: skip 1 ; $0949
TimerYSubPosition: skip 1 ; $094A
TimerYPosition: skip 1 ; $094B
Unused094C: skip 4 ; $094C
FileSelectMapAreaIndex: skip 0 ; $0950
GameOverMenuSelectionIndex: skip 2 ; $0950
SaveSlotSelected: skip 0 ; $0952
FileSelectMenuSelection: skip 2 ; $0952
NonEmptySaveSlots: skip 2 ; $0954
BG1Col_unwrappedTilemapVRAMUpdateSize: skip 2 ; $0956
BG1Col_wrappedTilemapVRAMUpdateSize: skip 2 ; $0958
BG1Col_unwrappedTilemapVRAMUpdateDest: skip 2 ; $095A
BG1Col_wrappedTilemapVRAMUpdateDest: skip 2 ; $095C
BG1Col_wrappedTilemapVRAMUpdateLeftHalvesSrc: skip 2 ; $095E
BG1Col_wrappedTilemapVRAMUpdateRightHalvesSrc: skip 2 ; $0960
BG1Col_updateVRAMTilemapFlag: skip 2 ; $0962
BG1Row_unwrappedTilemapVRAMUpdateSize: skip 2 ; $0964
BG1Row_wrappedTilemapVRAMUpdateSize: skip 2 ; $0966
BG1Row_unwrappedTilemapVRAMUpdateDest: skip 2 ; $0968
BG1Row_wrappedTilemapVRAMUpdateDest: skip 2 ; $096A
BG1Row_wrappedTilemapVRAMUpdateLeftHalvesSrc: skip 2 ; $096C
BG1Row_wrappedTilemapVRAMUpdateRightHalvesSrc: skip 2 ; $096E
BG1Row_updateVRAMTilemapFlag: skip 2 ; $0970
BG2Col_unwrappedTilemapVRAMUpdateSize: skip 2 ; $0972
BG2Col_wrappedTilemapVRAMUpdateSize: skip 2 ; $0974
BG2Col_unwrappedTilemapVRAMUpdateDest: skip 2 ; $0976
BG2Col_wrappedTilemapVRAMUpdateDest: skip 2 ; $0978
BG2Col_wrappedTilemapVRAMUpdateLeftHalvesSrc: skip 2 ; $097A
BG2Col_wrappedTilemapVRAMUpdateRightHalvesSrc: skip 2 ; $097C
BG2Col_updateVRAMTilemapFlag: skip 2 ; $097E
BG2Row_unwrappedTilemapVRAMUpdateSize: skip 2 ; $0980
BG2Row_wrappedTilemapVRAMUpdateSize: skip 2 ; $0982
BG2Row_unwrappedTilemapVRAMUpdateDest: skip 2 ; $0984
BG2Row_wrappedTilemapVRAMUpdateDest: skip 2 ; $0986
BG2Row_wrappedTilemapVRAMUpdateLeftHalvesSrc: skip 2 ; $0988
BG2Row_wrappedTilemapVRAMUpdateRighttHalvesSrc: skip 2 ; $098A
BG2Row_updateVRAMTilemapFlag: skip 2 ; $098C
SizeOfBG2: skip 2 ; $098E
BlocksToUpdateXBlock: skip 2 ; $0990
BlocksToUpdateYBlock: skip 2 ; $0992
VRAMBlocksToUpdateXBlock: skip 2 ; $0994
VRAMBlocksToUpdateYBlock: skip 2 ; $0996
GameState: skip 2 ; $0998
Unused099A: skip 2 ; $099A
DoorTransitionFunction: skip 2 ; $099C
MenuOptionIndex: skip 2 ; $099E
Unused09A0: skip 2 ; $09A0

EquippedItems: skip 2 ; $09A2
CollectedItems: skip 2 ; $09A4
EquippedBeams: skip 2 ; $09A6
CollectedBeams: skip 2 ; $09A8
UpBinding: skip 2 ; $09AA
DownBinding: skip 2 ; $09AC
LeftBinding: skip 2 ; $09AE
RightBinding: skip 2 ; $09B0
ShotBinding: skip 2 ; $09B2
JumpBinding: skip 2 ; $09B4
DashBinding: skip 2 ; $09B6
ItemCancelBinding: skip 2 ; $09B8
ItemSelectBinding: skip 2 ; $09BA
AimDownBinding: skip 2 ; $09BC
AimUpBinding: skip 2 ; $09BE
ReserveTankMode: skip 2 ; $09C0
Energy: skip 2 ; $09C2
MaxEnergy: skip 2 ; $09C4
Missiles: skip 2 ; $09C6
MaxMissiles: skip 2 ; $09C8
SuperMissiles: skip 2 ; $09CA
MaxSuperMissiles: skip 2 ; $09CC
PowerBombs: skip 2 ; $09CE
MaxPowerBombs: skip 2 ; $09D0
SelectedHUDItem: skip 2 ; $09D2
MaxReserveEnergy: skip 2 ; $09D4
ReserveEnergy: skip 2 ; $09D6
ReserveMissiles: skip 2 ; $09D8
IGTFrames: skip 2 ; $09DA
IGTSeconds: skip 2 ; $09DC
IGTMinutes: skip 2 ; $09DE
IGTHours: skip 2 ; $09E0
JapanText: skip 2 ; $09E2
Moonwalk: skip 2 ; $09E4
SamusPlacementMode: skip 2 ; $09E6
NeverRead09E8: skip 2 ; $09E8
IconCancel: skip 2 ; $09EA
Unused09EC: skip $16 ; $09EC..0A01

Unused0A02: skip 2 ; $0A02
AutoCancelHUDItemIndex: skip 2 ; $0A04
PreviousEnergy: skip 2 ; $0A06
PreviousMissiles: skip 2 ; $0A08
PreviousSuperMissiles: skip 2 ; $0A0A
PreviousPowerBombs: skip 2 ; $0A0C
PreviousHUDItemIndex: skip 2 ; $0A0E
NeverRead0A10: skip 1 ; $0A10
PreviousMovementTypeXray: skip 1 ; $0A11
PreviousEnergyHurtCheck: skip 2 ; $0A12
BackupController1InputDemo: skip 2 ; $0A14
BackupController1NewDemo: skip 2 ; $0A16
NeverRead0A18: skip 2 ; $0A18
Unused0A1A: skip 2 ; $0A1A
Pose: skip 2 ; $0A1C
PoseXDirection: skip 1 ; $0A1E
MovementType: skip 1 ; $0A1F
PreviousPose: skip 2 ; $0A20
PreviousPoseXDirection: skip 1 ; $0A22
PreviousMovementType: skip 1 ; $0A23
LastDifferentPose: skip 2 ; $0A24
LastDifferentPoseXDirection: skip 1 ; $0A26
LastDifferentPoseMovementType: skip 1 ; $0A27
ProspectivePose: skip 2 ; $0A28
SpecialProspectivePose: skip 2 ; $0A2A
SuperSpecialProspectivePose: skip 2 ; $0A2C
ProspectivePoseChangeCommand: skip 2 ; $0A2E
SpecialProspectivePoseChangeCommand: skip 2 ; $0A30
SuperSpecialProspectivePoseChangeCommand: skip 2 ; $0A32
SolidEnemyCollisionFlags: skip 2 ; $0A34
BlockCollisionFlags: skip 2 ; $0A36
SpaceToMoveUpBlock: skip 2 ; $0A38
YRadiusDifference: skip 2 ; $0A3A
SpaceToMoveDownBlock: skip 2 ; $0A3C
SpaceToMoveUpEnemy: skip 2 ; $0A3E
SpaceToMoveDownEnemy: skip 2 ; $0A40
CurrentStateHandler: skip 2 ; $0A42
NewStateHandler: skip 2 ; $0A44
HorizontalSlopeCollision: skip 2 ; $0A46
HurtFlashCounter: skip 2 ; $0A48
SuperSpecialPaletteFlags: skip 2 ; $0A4A
SubUnitEnergy: skip 2 ; $0A4C
PeriodicSubDamage: skip 2 ; $0A4E
PeriodicDamage: skip 2 ; $0A50
KnockbackDirection: skip 2 ; $0A52
KnockbackXDirection: skip 2 ; $0A54
BombJumpDirection: skip 2 ; $0A56
MovementHandler: skip 2 ; $0A58
HackHandler: skip 2 ; $0A5A
DrawingHandler: skip 2 ; $0A5C
DebugCommandPointer: skip 2 ; $0A5E
PoseInputHandler: skip 2 ; $0A60
PushDirection: skip 2 ; $0A62
GrappleConnectedFlags: skip 2 ; $0A64
XSpeedDivisor: skip 2 ; $0A66
SpecialPaletteTimer: skip 2 ; $0A68
CriticalEnergyWarning: skip 2 ; $0A6A
XSpeedTablePointer: skip 2 ; $0A6C
ContactDamageIndex: skip 2 ; $0A6E
Unused0A70: skip 2 ; $0A70
VisorPaletteTimer: skip 1 ; $0A72
VisorPaletteIndex: skip 1 ; $0A73
SuitPaletteIndex: skip 2 ; $0A74
HyperBeam: skip 2 ; $0A76
TimeIsFrozenFlag: skip 2 ; $0A78

Xray_State: skip 2 ; $0A7A
Xray_AngularWidthDelta: skip 2 ; $0A7C
Xray_AngularSubWidthDelta: skip 2 ; $0A7E
Xray_BeamSizeFlag: skip 2 ; $0A80
Xray_Angle: skip 2 ; $0A82
Xray_AngularWidth: skip 2 ; $0A84
Xray_AngularSubWidth: skip 2 ; $0A86
Xray_IndirectHDMATable: skip 11 ; $0A88..92

org $0A7A
DemoInput_PreInstruction: skip 2 ; $0A7A
DemoInput_InstructionTimer: skip 2 ; $0A7C
DemoInput_InstListPointer: skip 2 ; $0A7E
DemoInput_Timer: skip 2 ; $0A80
DemoInput_InitParam: skip 2 ; $0A82
DemoInput_Input: skip 2 ; $0A84
DemoInput_New: skip 2 ; $0A86
DemoInput_Enable: skip 2 ; $0A88
DemoInput_RecordedDuration: skip 2 ; $0A8A
DemoInput_PreviousInput: skip 2 ; $0A8C
DemoInput_PreviousNew: skip 2 ; $0A8E
DemoInput_BackupController1Input: skip 2 ; $0A90
DemoInput_BackupController1New: skip 2 ; $0A92

org $0A88
SuitPickupIndirectHDMATable: skip 11 ; $0A88..92
skip 1
SamusAnimationFrameTimer: skip 2 ; $0A94
SamusAnimationFrame: skip 2 ; $0A96
skip 2 ; $0A98
NewPoseSamusAnimationFrame: skip 2 ; $0A9A
SamusAnimationFrameBuffer: skip 2 ; $0A9C
GrappleWalljumpTimer: skip 2 ; $0A9E
CeresElevatorFadeTimer: skip 2 ; $0AA0
ShinesparkWindupCrashTimer: skip 2 ; $0AA2
skip 2 ; $0AA4
ArmCannonOpenFlag: skip 1 ; $0AA6
ArmCannonCloseFlag: skip 1 ; $0AA7
ArmCannonFrame: skip 2 ; $0AA8
ArmCannonToggleFlag: skip 2 ; $0AAA
ArmCannonDrawingMode: skip 2 ; $0AAC

SpeedEcho_Index: skip 2 ; $0AAE
SpeedEcho_XPosition0: skip 2 ; $0AB0
SpeedEcho_XPosition1: skip 2 ; $0AB2
SpeedEcho_XPosition2: skip 2 ; $0AB4
SpeedEcho_XPosition3: skip 2 ; $0AB6
SpeedEcho_YPosition0: skip 2 ; $0AB8
SpeedEcho_YPosition1: skip 2 ; $0ABA
SpeedEcho_YPosition2: skip 2 ; $0ABC
SpeedEcho_YPosition3: skip 2 ; $0ABE
SpeedEcho_XSpeed0: skip 2 ; $0AC0
SpeedEcho_XSpeed1: skip 2 ; $0AC2
SpeedEcho_DrawFlag2: skip 2 ; $0AC4
SpeedEcho_DrawFlag3: skip 2 ; $0AC6
SpeedEcho_SamusTopHalfSpritemapIndex: skip 2 ; $0AC8
SpeedEcho_SamusBottomHalfSpritemapIndex: skip 2 ; $0ACA

org $0AAE
CrashEcho_DistanceFromSamus: skip 1 ; $0AAE
CrashEcho_Phase: skip 1 ; $0AAF
CrashEcho_XPosition0: skip 2 ; $0AB0
CrashEcho_XPosition1: skip 2 ; $0AB2
CrashEcho_AngleDelta: skip 2 ; $0AB4
skip 2 ; $0AB6
CrashEcho_YPosition0: skip 2 ; $0AB8
CrashEcho_YPosition1: skip 2 ; $0ABA
CrashEcho_CircleTimer: skip 2 ; $0ABC
skip 2 ; $0ABE
CrashEcho_Angle0: skip 2 ; $0AC0
CrashEcho_Angle1: skip 2 ; $0AC2

org $0ACC
SpecialSamusPaletteType: skip 2 ; $0ACC
SpecialSamusPaletteFrame: skip 2 ; $0ACE
CommonPaletteTimer: skip 2 ; $0AD0
LiquidPhysicsType: skip 2 ; $0AD2
AtmosphericGraphicsAnimationTimers: skip 8 ; $0AD4..DB
AtmosphericGraphicsXPositions: skip 8 ; $0ADC..E3
AtmosphericGraphicsYPositions: skip 8 ; $0AE4..EB
AtmosphericGraphicsAnimFramesGraphicsTypes: skip 8 ; $0AEC..F3
AutoJumpTimer: skip 2 ; $0AF4
SamusXPosition: skip 2 ; $0AF6
SamusXSubPosition: skip 2 ; $0AF8
SamusYPosition: skip 2 ; $0AFA
SamusYSubPosition: skip 2 ; $0AFC
SamusXRadius: skip 2 ; $0AFE
SamusYRadius: skip 2 ; $0B00
CollisionMovementDirection: skip 2 ; $0B02
SamusSpritemapXPosition: skip 2 ; $0B04
SamusSpritemapYPosition: skip 2 ; $0B06
Unused0B08: skip 2 ; $0B08
IdealLayer1XPosition: skip 2 ; $0B0A
Unused0B0C: skip 2 ; $0B0C
IdealLayer1YPosition: skip 2 ; $0B0E
SamusPreviousXPosition: skip 2 ; $0B10
SamusPreviousXSubPosition: skip 2 ; $0B12
SamusPreviousYPosition: skip 2 ; $0B14
SamusPreviousYSubPosition: skip 2 ; $0B16
ChargedShotGlowTimer: skip 2 ; $0B18
NeverRead0B1A: skip 2 ; $0B1A
Unused0B1C: skip 4 ; $0B1C
MorphBallBounceState: skip 2 ; $0B20
SamusIsFallingFlag: skip 2 ; $0B22
Temp0B24: skip 2 ; $0B24
Temp0B26: skip 2 ; $0B26
Unused0B28: skip 2 ; $0B28
NeverRead0B2A: skip 2 ; $0B2A
SamusYSubSpeed: skip 2 ; $0B2C
SamusYSpeed: skip 2 ; $0B2E
Unused0B30: skip 2 ; $0B30
SamusYSubAcceleration: skip 2 ; $0B32
SamusYAcceleration: skip 2 ; $0B34
SamusYDirection: skip 2 ; $0B36
NeverRead0B38: skip 2 ; $0B38
Unused0B3A: skip 2 ; $0B3A
SamusRunningMomentumFlag: skip 2 ; $0B3C
SamusBoostTimer: skip 1 ; $0B3E
SamusBoostCounter: skip 1 ; $0B3F
SamusEchoesSFXFlag: skip 2 ; $0B40
SamusXExtraRunSpeed: skip 2 ; $0B42
SamusXExtraRunSubSpeed: skip 2 ; $0B44
SamusXBaseSpeed: skip 2 ; $0B46
SamusXBaseSubSpeed: skip 2 ; $0B48
SamusXAccelerationMode: skip 2 ; $0B4A
SamusXDecelerationMultiplier: skip 2 ; $0B4C
Unused0B4E: skip 8 ; $0B4E..55
ExtraSamusXSubDisplacement: skip 2 ; $0B56
ExtraSamusXDisplacement: skip 2 ; $0B58
ExtraSamusYSubDisplacement: skip 2 ; $0B5A
ExtraSamusYDisplacement: skip 2 ; $0B5C
PoseTransitionShotDirection: skip 2 ; $0B5E
SBAAngleDelta: skip 2 ; $0B60
SamusChargePaletteIndex: skip 2 ; $0B62

SamusProjectile_XPositions: skip !MaxSamusProjectiles*2 ; $0B64..77
SamusProjectile_YPositions: skip !MaxSamusProjectiles*2 ; $0B78..8B
SamusProjectile_XSubPositions: skip !MaxSamusProjectiles*2 ; $0B8C..9F
SamusProjectile_YSubPositions: skip !MaxSamusProjectiles*2 ; $0BA0..B3
SamusProjectile_XRadii: skip !MaxSamusProjectiles*2 ; $0BB4..C7
SamusProjectile_YRadii: skip !MaxSamusProjectiles*2 ; $0BC8..DB
SamusProjectile_XVelocities: skip !MaxSamusProjectiles*2 ; $0BDC..EF
SamusProjectile_YVelocities: skip !MaxSamusProjectiles*2 ; $0BF0..0C03
SamusProjectile_Directions: skip !MaxSamusProjectiles*2 ; $0C04..17
SamusProjectile_Types: skip !MaxSamusProjectiles*2 ; $0C18..2B
SamusProjectile_Damages: skip !MaxSamusProjectiles*2 ; $0C2C..3F
SamusProjectile_InstructionPointers: skip !MaxSamusProjectiles*2 ; $0C40..53
SamusProjectile_InstructionTimers: skip !MaxSamusProjectiles*2 ; $0C54..67
SamusProjectile_PreInstructions: skip !MaxSamusProjectiles*2 ; $0C68..7B
SamusProjectile_Variables: skip !MaxSamusProjectiles*2 ; $0C7C..8F
SamusProjectile_TrailTimers:
SamusProjectile_BombYSubVelocities: skip !MaxSamusProjectiles*2 ; $0C90..A3
SamusProjectile_Variables2: skip !MaxSamusProjectiles*2 ; $0CA4..B7
SamusProjectile_SpritemapPointers: skip !MaxSamusProjectiles*2 ; $0CB8..CB
SamusProjectile_CooldownTimer: skip 2 ; $0CCC
SamusProjectile_ProjectileCounter: skip 2 ; $0CCE
SamusProjectile_FlareCounter: skip 2 ; $0CD0
SamusProjectile_BombCounter: skip 2 ; $0CD2
SamusProjectile_BombSpreadChargeTimeoutCounter: skip 2 ; $0CD4
SamusProjectile_FlareAnimationFrame: skip 2 ; $0CD6
SamusProjectile_FlareSlowSparksAnimationFrame0CD8: skip 2 ; $0CD8
SamusProjectile_FlareFastSparksAnimationFrame0CDA: skip 2 ; $0CDA
SamusProjectile_FlareAnimationTimer: skip 2 ; $0CDC
SamusProjectile_FlareSlowSparksAnimationFrame0CDE: skip 2 ; $0CDE
SamusProjectile_FlareFastSparksAnimationFrame0CE0: skip 2 ; $0CE0
SamusProjectile_PowerBombExplosionXPosition: skip 2 ; $0CE2
SamusProjectile_PowerBombExplosionYPosition: skip 2 ; $0CE4
SamusProjectile_PowerBombPositionOnScreen: skip 2 ; $0CE6
SamusProjectile_PowerBombExplosionHDMATableIndex: skip 2 ; $0CE8
SamusProjectile_PowerBombExplosionRadius: skip 2 ; $0CEA
SamusProjectile_PowerBombPreExplosionFlashRadius: skip 2 ; $0CEC
SamusProjectile_PowerBombFlag: skip 2 ; $0CEE
SamusProjectile_PowerBombPreExplosionRadiusSpeed: skip 2 ; $0CF0
SamusProjectile_PreScaledPowerBombExplosionShapeDefPointer: skip 2 ; $0CF2

GrappleBeam_Flags: skip 2 ; $0CF4
GrappleBeam_PoseChangeAutoFireTimer: skip 2 ; $0CF6
GrappleBeam_SlowScrollingFlag: skip 2 ; $0CF8
GrappleBeam_EndAngle: skip 2 ; $0CFA
GrappleBeam_EndAngleMirror: skip 2 ; $0CFC
GrappleBeam_Length: skip 2 ; $0CFE
GrappleBeam_LengthDelta: skip 2 ; $0D00
GrappleBeam_OriginXOffset: skip 2 ; $0D02
GrappleBeam_OriginTOffset: skip 2 ; $0D04
GrappleBeam_EndXSubPosition: skip 2 ; $0D06
GrappleBeam_EndXPosition: skip 2 ; $0D08
GrappleBeam_EndYSubPosition: skip 2 ; $0D0A
GrappleBeam_EndYPosition: skip 2 ; $0D0C
GrappleBeam_EndXSubOffset: skip 2 ; $0D0E
GrappleBeam_EndXOffset: skip 2 ; $0D10
GrappleBeam_EndYSubOffset: skip 2 ; $0D12
GrappleBeam_EndYOffset: skip 2 ; $0D14
GrappleBeam_StartXPosition: skip 2 ; $0D16
GrappleBeam_StartYPosition: skip 2 ; $0D18
GrappleBeam_FlareXPosition: skip 2 ; $0D1A
GrappleBeam_FlareYPosition: skip 2 ; $0D1C
GrappleBeam_NeverRead0D1E: skip 2 ; $0D1E
GrappleBeam_NeverRead0D20: skip 2 ; $0D20
GrappleBeam_ExtensionXSubVelocity: skip 1 ; $0D22
GrappleBeam_ExtensionXVelocity: skip 1 ; $0D23
GrappleBeam_ExtensionYSubVelocity: skip 1 ; $0D24
GrappleBeam_ExtensionYVelocity: skip 1 ; $0D25
GrappleBeam_SwingAngularVelocity: skip 2 ; $0D26
GrappleBeam_SwingAngularAccelerationDueToAngleOfSwing: skip 2 ; $0D28
GrappleBeam_SwingAngularAccelerationDueToButtonInput: skip 2 ; $0D2A
GrappleBeam_SwingAngularDeceleration: skip 2 ; $0D2C
GrappleBeam_ExtraSwingAngularVelocity: skip 2 ; $0D2E
GrappleBeam_KickCooldownTimer: skip 2 ; $0D30
GrappleBeam_Function: skip 2 ; $0D32
GrappleBeam_DirectionFired: skip 2 ; $0D34
GrappleBeam_SpecialAngleHandlingFlag: skip 2 ; $0D36
GrappleBeam_FailedSwingMovementCounter: skip 2 ; $0D38
GrappleBeam_NeverRead0D3A: skip 2 ; $0D3A
GrappleBeam_NeverRead0D3C: skip 2 ; $0D3C
GrappleBeam_StartAnimationTimer: skip 2 ; $0D3E
GrappleBeam_StartAnimationTilePointer: skip 2 ; $0D40
GrappleBeam_SegmentAnimationInstructionTimers: skip $20 ; $0D42..61
GrappleBeam_SegmentAnimationInstructionListPointers: skip $20 ; $0D62..81

GrappleCollision_XQuarterSubVelocity: skip 0 ; $0D82
GrappleCollision_JumpAddress: skip 0 ; $0D82
GrappleCollision_EndAngleParam: skip 2 ; $0D82
GrappleCollision_XQuarterVelocity: skip 0 ; $0D84
GrappleCollision_DistanceFromEndParam: skip 2 ; $0D84
GrappleCollision_YQuarterSubVelocity: skip 0 ; $0D86
GrappleCollision_NewEndAngle: skip 2 ; $0D86
GrappleCollision_YQuarterVelocity: skip 0 ; $0D88
GrappleCollision_TargetEndAngle: skip 2 ; $0D88
GrappleCollision_LoopCounter: skip 0 ; $0D8A
GrappleCollision_NewBeamLength: skip 2 ; $0D8A

org $0D82
WavySamusBG3XScrollIndirectHDMATable: ; $0D82..8F
BackupControllerBindingsDemo: ; $0D82..8F
BackupSamusXPosition: skip 2 ; $0D82
BackupSamusYPosition: skip 2 ; $0D84
skip $16 ; 0D86..9C

WavySamus_Enable: skip 2 ; $0D9C
WavySamus_Amplitude: skip 2 ; $0D9E
WavySamus_PhaseDelta: skip 2 ; $0DA0

org $0DA0
EnemyTilesTransferLoopCounter: skip 2 ; $0DA0
CameraXSpeed: skip 2 ; $0DA2
CameraXSubSpeed: skip 2 ; $0DA4
CameraYSpeed: skip 2 ; $0DA6
CameraYSubSpeed: skip 2 ; $0DA8
ProjSpeed_DistanceSamusMovedLeft: skip 2 ; $0DAA
ProjSpeed_SubDistanceSamusMovedLeft: skip 2 ; $0DAC
ProjSpeed_DistanceSamusMovedRight: skip 2 ; $0DAE
ProjSpeed_SubDistanceSamusMovedRight: skip 2 ; $0DB0
ProjSpeed_DistanceSamusMovedUp: skip 2 ; $0DB2
ProjSpeed_SubDistanceSamusMovedUp: skip 2 ; $0DB4
ProjSpeed_DistanceSamusMovedDown: skip 2 ; $0DB6
neverRead0DB8: skip 2 ; $0DB8
SamusPositionAdjustedBySlopeFlag: skip 2 ; $0DBA
TotalSamusXSpeed: skip 2 ; $0DBC
TotalSamusXSubSpeed: skip 2 ; $0DBE
ResumeChargingBeamSFXFlag: skip 2 ; $0DC0
PreviousBeamChargeCounter: skip 2 ; $0DC2
CurrentBlockIndex: skip 2 ; $0DC4
SamusSolidVerticalCollisionResult: skip 1 ; $0DC6
SamusDownwardsMovementSolidCollisionResult: skip 1 ; $0DC7
unused0DC8: skip 2 ; $0DC8..CD
SamusXSpeedKilledDueToCollisionFlag: skip 2 ; $0DCE
SamusSolidCollisionFlag: skip 2 ; $0DD0
ProjectileProtoType: skip 2 ; $0DD2
SolidSlopeDefinitionTableBaseIndex: skip 0 ; $0DD4
SamusLeftRightXOffset: skip 0 ; $0DD4
SamusBottomTopYOffset: skip 0 ; $0DD4
TargetBottomTopYOffset: skip 0 ; $0DD4
YDistanceIntoSlope: skip 0 ; $0DD4
CollisionMultiplicationCounter: skip 0 ; $0DD4
CollisionProjectileYOffset: skip 2 ; $0DD4
SlopeCollisionFlipFlags: skip 0 ; $0DD6
SlopeCOllisionDefinitionTableBaseIndex: skip 2 ; $0DD6
unused0DD8: skip 4 ; $0DD8
SuitPickupLightBeamWideningSpeed: skip 0 ; $0DDC
ProjectileIndex: skip 0 ; $0DDE
DebugInvincibility: skip 2 ; $0DE0

DeathAnimation_Timer: skip 2 ; $0DE2
DeathAnimation_Index: skip 2 ; $0DE4
DeathAnimation_Counter: skip 2 ; $0DE6
DeathAnimation_PreFlashingTimer: skip 2 ; $0DE8

org $0DE2
GameOptionsMenuIndex: skip 2 ; $0DE2
skip 6
CrystalFlashAmmoDecrementingIndex: skip 2 ; $0DEA

EndingClearTime_HoursTens: skip 2 ; $0DEC
EndingClearTime_HoursUnits: skip 2 ; $0DEE
EndingClearTime_MinutesTens: skip 2 ; $0DF0
EndingClearTime_MinutesUnits: skip 2 ; $0DF2

org $0DEC
SuitPickup_Stage: skip 2 ; $0DEC
SuitPickup_LightBeamHeight: skip 2 ; $0DEE
SuitPickup_LightBeamLeftRightPositions: skip 2 ; $0DEE
SuitPickup_LightBeamTopPosition: skip 2 ; $0DEE
SuitPickup_ColorMathRed: skip 1 ; $0DF0
SuitPickup_ColorMathGreen: skip 1 ; $0DF1
SuitPickup_ColorMathBlue: skip 1 ; $0DF2
SuitPickup_PaletteTransitionColor: skip 1 ; $0DF3

org $0DEC
CrystalFlash_AmmoDecrementingTimer: skip 2 ; $0DEC
CrystalFlash_Unused0DEE: skip 2 ; $0DEE
CrystalFlash_SamusYPosition: skip 2 ; $0DF0
CrystalFlash_PaletteTimer: skip 2 ; $0DF2

org $0DEC
ShinesparkYAcceleration: skip 0 ; $0DEC
DraygonEscapeButtonCounter: skip 0 ; $0DEC
SamusAppearsFanfareTimer: skip 0 ; $0DEC
DebugDeathAnimationFlag: skip 0 ; $0DEC
DemoControlFlags: skip 2 ; $0DEC
ShinesparkYSubAcceleration: skip 0 ; $0DEE
DraygonEscapePreviousDpadInput: skip 2 ; $0DEE
skip 4
DebugSpareCPUDisplayFlag: skip 2 ; $0DF4
DebugSamusTileViewerFlag: skip 2 ; $0DF6
Unknown0DF8: skip 2 ; $0DF8
NeverRead0DFA: skip 2 ; $0DFA
NeverRead0DFC: skip 2 ; $0DFC
PreviousController1InputDrawing: skip 2 ; $0DFE
PreviousController1NewDrawing: skip 2 ; $0E00
SamusBottomBoundaryPosition: skip 2 ; $0E02
DistanceToEjectSamusLeftDueToPostGrappleCollision: skip 2 ; $0E04
DistanceToEjectSamusRightDueToPostGrappleCollision: skip 2 ; $0E06
DistanceToEjectSamusUpDueToPostGrappleCollision: skip 2 ; $0E08
DistanceToEjectSamusDownDueToPostGrappleCollision: skip 2 ; $0E0A

ShootingStars_StarIndex: skip 2 ; $0E0C
ShootingStars_AnimationFrame: skip 2 ; $0E0D
ShootingStars_XPosition: skip 2 ; $0E0E
ShootingStars_XSubPosition: skip 2 ; $0E10
ShootingStars_YPosition: skip 2 ; $0E12
ShootingStars_YSubPosition: skip 2 ; $0E14
ShootingStars_AnimationTimer: skip 2 ; $0E16
ShootingStars_XVelocity: skip 2 ; $0E18
ShootingStars_YVelocity: skip 2 ; $0E1A

org $0E0C
skip 6 ; unused $0E0C..11
DebugDisableSpriteInteractions: skip 2 ; $0E12
unused0E14: skip 2 ; $0E14
ElevatorProperties: skip 2 ; $0E16
ElevatorStatus: skip 2 ; $0E18
CriticalEnergyFlag: skip 2 ; $0E1A
EnemyIndexToShake: skip 2 ; $0E1C
RequestEnemyBG2TilemapTransferFlag: skip 2 ; $0E1E

Temp_DemoRecorderFrameCounterXPosition: skip 0 ; $0E20
Temp_ProjectilePositionOnScreen: skip 0 ; $0E20
Temp_ProjectileXRadius: skip 0 ; $0E20
Temp_Bank: skip 0 ; $0E20
Temp_PopulationDataPointer: skip 0 ; $0E20
Temp_YPositionOnScreen: skip 0 ; $0E20
Temp_DeathExplosionType: skip 0 ; $0E20
Temp_AbsoluteXDistanceFromEnemyToSamus: skip 0 ; $0E20
Temp_Threshold: skip 0 ; $0E20
Temp_AngleToMove: skip 0 ; $0E20
Temp_DebuggerHexValueXPosition: skip 2 ; $0E20
Temp_DemoRecorderFrameCounterYPosition: skip 0 ; $0E22
Temp_ProjectileYRadius: skip 0 ; $0E22
Temp_SpawnEnemyLoopCounter: skip 0 ; $0E22
Temp_XPositionOnScreen: skip 0 ; $0E22
Temp_AbsoluteYDistanceFromEnemyToSamus: skip 0 ; $0E22
Temp_SwoopYSpeed: skip 0 ; $0E22
Temp_DebuggerHexValueYPosition: skip 2 ; $0E22
Temp_DemoRecorderFrameCounter: skip 0 ; $0E24
Temp_EnemyHeaderPointer: skip 0 ; $0E24
Temp_AngleFromEnemyToSamusReflectedDownRight: skip 0 ; $0E24
Temp_XSpeed: skip 0 ; $0E24
Temp_XVelocity: skip 0 ; $0E24
Temp_SwoopYPosition: skip 0 ; $0E24
Temp_ErroneousXVelocity: skip 0 ; $0E24
Temp_DebuggerHexValue: skip 2 ; $0E24
Temp_NumberOfEnemyPartsToSpawn: skip 0 ; $0E26
Temp_XSquaredDividedByRadius: skip 0 ; $0E26
Temp_XSubSpeed: skip 0 ; $0E26
Temp_SwoopYPositionIndex: skip 0 ; $0E26
Temp_EnemySetEntryPointer: skip 2 ; $0E26
Temp_NeverRead0E28: skip 0 ; $0E28
Temp_YSpeed: skip 2 ; $0E28
Temp_YSubSpeed: skip 0 ; $0E2A
Temp_NeverRead0E2A: skip 0 ; $0E2A
Temp_MetareeParticleVRAMTilesIndex: skip 0 ; $0E2A
Temp_RowYPosition: skip 2 ; $0E2A
Temp_MetareeParticlePaletteIndex: skip 0 ; $0E2C
Temp_RowsOfVRAM: skip 2 ; $0E2C
Temp_ShotAIHitFlag: skip 0 ; $0E2E
Temp_EnemySetLoopCounter: skip 2 ; $0E2E
skip 2 ; unused $0E30
Temp_Layer: skip 0 ; $0E32
Temp_DamageMultiplier: skip 0 ; $0E32
Temp_RightBottomBoundaryPosition: skip 0 ; $0E32
Temp_XPosition: skip 0 ; $0E32
Temp_Operand: skip 0 ; $0E32
Temp_AbsoluteValue: skip 0 ; $0E32
Temp_Magnitude: skip 0 ; $0E32
Temp_UnknownIndex: skip 0 ; $0E32
Temp_TargetYPosition: skip 0 ; $0E32
Temp_Unknown0E32: skip 0 ; $0E32
Temp_SpitProjectileSpeed: skip 2 ; $0E32
Temp_DrawingQueueIndex0E34: skip 0 ; $0E34
Temp_YPosition: skip 0 ; $0E34
Temp_AbsoluteDifference: skip 0 ; $0E34
Temp_Angle: skip 2 ; $0E34
Temp_DrawingQueueSizeBackup: skip 0 ; $0E36
Temp_SamusXPosition: skip 0 ; $0E36
Temp_SineProduct: skip 0 ; $0E36
Temp_TargetPosition: skip 2 ; $0E36
Temp_DrawingQueueIndex0E38: skip 0 ; $0E38
Temp_SamusYPosition: skip 0 ; $0E38
Temp_SineProductFractionalPart: skip 2 ; $0E38
Temp_DrawingQueueAddr: skip 0 ; $0E3A
Temp_AngleFromEnemyToSamus: skip 2 ; $0E3A
Temp_XDistanceFromEnemyToSamus: skip 2 ; $0E3C
Temp_YDistanceFromEnemyToSamus: skip 2 ; $0E3E
Temp_BeamVulnerability: skip 0 ; $0E40
Temp_ContactVulnerability: skip 2 ; $0E40

Unused0E42: skip 2 ; $0E42
NumberOfTimesMainEnemyRoutineExecuted: skip 2 ; $0E44
NeverRead0E46: skip 2 ; $0E46
NeverRead0E48: skip 2 ; $0E48
NewEnemyIndex: skip 2 ; $0E4A
FirstFreeEnemyIndex: skip 2 ; $0E4C
NeverRead0E4E: skip 2 ; $0E4E
NumberOfEnemiesKilled: skip 2 ; $0E50
NumberOfEnemiesRequiredToKill: skip 2 ; $0E52
EnemyIndex: skip 2 ; $0E54
BackupEnemyIndex: skip 2 ; $0E56
EnemyDataPointer: skip 2 ; $0E58

EnemyTileData_Size: skip 2 ; $0E5A
EnemyTileData_Pointer: skip 3 ; $0E5C
EnemyTileData_Offset: skip 2 ; $0E5F
skip $15 ; unused $0E61..75
Unused0E76: skip 4 ; $0E76
EnemyTileData_StackPointer: skip 2 ; $0E7A
EnemyTileData_SrcAddr: skip 2 ; $0E7C
EnemyTileData_DestAddr: skip 2 ; $0E7E
Unused0E80: skip 4 ; $0E80..83

EnemyDrawingQueues_Layer0: skip $20 ; $0E84..A3
EnemyDrawingQueues_Layer1: skip 2 ; $0EA4
EnemyDrawingQueues_Layer2: skip $20 ; $0EA6..C5
EnemyDrawingQueues_Layer3: skip 2 ; $0EC6
EnemyDrawingQueues_Layer4: skip $20 ; $0EC8..E7
EnemyDrawingQueues_Layer5: skip $44 ; $0EE4..0F27
EnemyDrawingQueues_Layer6: skip $20 ; $0F28..47
EnemyDrawingQueues_Layer7: skip $20 ; $0F48..67
EnemyDrawingQueues_Sizes: skip $10 ; $0F68..77

struct Enemy $0F78
  .ID: skip 2 ; $0F78
  .XPosition: skip 2 ; $0F7A
  .XSubPosition: skip 2 ; $0F7C
  .YPosition: skip 2 ; $0F7E
  .YSubPosition: skip 2 ; $0F80
  .XHitboxRadius: skip 2 ; $0F82
  .YHitboxRadius: skip 2 ; $0F84
  .properties: skip 2 ; $0F86
  .properties2: skip 2 ; $0F88
  .AI: skip 2 ; $0F8A
  .health: skip 2 ; $0F8C
  .spritemap: skip 2 ; $0F8E
  .loopCounter: skip 2 ; $0F90
  .instList: skip 2 ; $0F92
  .instTimer: skip 2 ; $0F94
  .palette: skip 2 ; $0F96
  .GFXOffset: skip 2 ; $0F98
  .layer: skip 2 ; $0F9A
  .flashTimer: skip 2 ; $0F9C
  .freezeTimer: skip 2 ; $0F9E
  .invincibilityTimer: skip 2 ; $0FA0
  .shakeTimer: skip 2 ; $0FA2
  .frameCounter: skip 2 ; $0FA4
  .bank: skip 2 ; $0FA6
  .var0: skip 2 ; $0FA8
  .var1: skip 2 ; $0FAA
  .var2: skip 2 ; $0FAC
  .var3: skip 2 ; $0FAE
  .var4: skip 2 ; $0FB0
  .var5: skip 2 ; $0FB2
  .init0: skip 2 ; $0FB4
  .init1: skip 2 ; $0FB6
endstruct

org $1778
FirefleaFlashing_Timer: skip 2 ; $1778
FirefleaFlashing_Index: skip 2 ; $177A
Unused177E: skip 2 ; $177C
FirefleaFlashing_DarknessLevel: skip 2 ; $177E
Unused1780: skip 2 ; $1780
Unused1782: skip 2 ; $1782

EnemyAIPointer: skip 4 ; $1784
BackupEnemyAIPointer: skip 4 ; $1788
EnemyGraphicsDrawnHook: skip 4 ; $178C
Unused1790: skip 4 ; $1790

EnemyPaletteCycle_PaletteIndex: skip 2 ; $1794
EnemyPaletteCycle_ColorSetIndex: skip 2 ; $1796
EnemyPaletteCycle_Timer: skip 2 ; $1798

EnemyBG2TilemapSize: skip 2 ; $179A
BossID: skip 2 ; $179C
Unused179E: skip 2 ; $179E
Unused17A0: skip 2 ; $17A0
DisableDrawingOfEnemies: skip 2 ; $17A2
ActiveEnemyIndicesStackPointer: skip 2 ; $17A4
InteractiveEnemyIndicesStackPointer: skip 2 ; $17A6
ActiveEnemyIndicesIndex: skip 2 ; $17A8
InteractiveEnemyIndicesIndex: skip 2 ; $17AA
ActiveEnemyIndices: skip $40 ; $17AC..EB
InteractiveEnemyIndices: skip $40 ; $17EC..182B
EnemyIndexSamusCollidesLeft: skip 2 ; $182C
EnemyIndexSamusCollidesRight: skip 2 ; $182E
EnemyIndexSamusCollidesUp: skip 2 ; $1830
EnemyIndexSamusCollidesDown: skip 2 ; $1832
NeverRead1834: skip 2 ; $1834
NeverRead1836: skip 2 ; $1836
NeverRead1838: skip 2 ; $1838
NeverRead183A: skip 2 ; $183A
GlobalOffScreenEnemyProcessingFlag: skip 2 ; $183C
EarthquakeType: skip 2 ; $183E
EarthquakeTimer: skip 2 ; $1840
NumberOfTimesRoomShakingExecuted: skip 2 ; $1842
SpriteObjectIndex: skip 2 ; $1844
DebugEnemyIndex: skip 2 ; $1846
LogIndex: skip 2 ; $1848
NeverRead184A: skip 2 ; $184A
NeverRead184C: skip 2 ; $184C
NeverRead184E: skip 2 ; $184E
NeverRead1850: skip 2 ; $1850
NeverRead1852: skip 2 ; $1852
NeverRead1854: skip 2 ; $1854
NeverRead1856: skip 2 ; $1856
NeverRead1858: skip 2 ; $1858
NeverRead185A: skip 2 ; $185A
DebugIndex: skip 2 ; $185C
DebugTimeIsFrozenForEnemies: skip 2 ; $185E
DebugTextCursorXPosition: skip 2 ; $1860
DebugTextCursorYPosition: skip 2 ; $1862
DebugEnemySetEntryIndex: skip 2 ; $1864
DebugEnemyPopulationPointer: skip 0 ; $1866
DebugPreviousController2InputCrocomire: skip 2 ; $1866
DebugEnemySpawnXPosition: skip 2 ; $1868
DebugEnemySpawnYPosition: skip 2 ; $186A
Unused186C: skip 2 ; $186C
EnemySpritemapEntryPointerDuringCollision: skip 2 ; $186E
EnemyLeftBoundaryForEnemyVsProjectileCollisions: skip 2 ; $1870
EnemyBottomBoundaryForEnemyVsProjectileCollisions: skip 2 ; $1872
EnemyRightBoundaryForEnemyVsProjectileCollisions: skip 2 ; $1874
EnemyTopBoundaryForEnemyVsProjectileCollisions: skip 2 ; $1876
EnemyHitboxEntryPointerDuringCollision: skip 2 ; $1878
EnemySpritemapEntryXPositionDuringCollision: skip 2 ; $187A
EnemySpritemapEntryYPositionDuringCollision: skip 2 ; $187C
SamusRightBoundaryForEnemyVsSamusCollisions: skip 2 ; $187E
SamusLeftBoundaryForEnemyVsSamusCollisions: skip 2 ; $1880
SamusBottomBoundaryForEnemyVsSamusCollisions: skip 2 ; $1882
SamusTopBoundaryForEnemyVsSamusCollisions: skip 2 ; $1884
Unused1886: skip $14 ; $1886..99
SamusTargetXPosition: skip 2 ; $189A
SamusTargetXSubPosition: skip 2 ; $189C
SamusTargetYPosition: skip 2 ; $189E
SamusTargetYSubPosition: skip 2 ; $18A0
SamusXRadiusMirror: skip 2 ; $18A2
SamusYRadiusMirror: skip 2 ; $18A4
CollisionIndex: skip 2 ; $18A6
SamusInvincibilityTimer: skip 2 ; $18A8
SamusKnockbackTimer: skip 2 ; $18AA
ProjectileInvincibilityTImer: skip 2 ; $18AC
DisableSamusVsProjectileInteraction: skip 2 ; $18AE

HDMAObject_Enable: skip 2 ; $18B0
HDMAObject_Index: skip 2 ; $18B2
HDMAObject_ChannelBitflags: skip 12 ; $18B4..BF
HDMAObject_ChannelIndicesBanks: skip 12 ; $18C0..CB
HDMAObject_InstListPointers: skip 12 ; $18CC..D7
HDMAObject_TablePointers: skip 12 ; $18D8..E3
HDMAObject_InstructionTimers: skip 12 ; $18E4..EF
HDMAObject_PreInstructions: skip 12 ; $18F0..FB
HDMAObject_PreInstructionBanks: skip 12 ; $18FC..1907
HDMAObject_Timers: skip 12 ; $1908..13
HDMAObject_Var0: skip 12 ; $1914..1F
HDMAObject_Var1: skip 12 ; $1920..2B
HDMAObject_Var2: skip 12 ; $192C..37
HDMAObject_Var3: skip 12 ; $1938..43
HDMAObject_Var4: skip 12 ; $1944..4F
HDMAObject_Var5: skip 12 ; $1950..5B

FX_YSubPosition: skip 2 ; $195C
FX_YPosition: skip 2 ; $195E
FX_LavaAcidYSubPosition: skip 2 ; $1960
FX_LavaAcidYPosition: skip 2 ; $1962
FX_TilemapPointer: skip 2 ; $1964
FX_CurrentEntryPointer: skip 2 ; $1966
FX_CurrentEntryOffset: skip 2 ; $1968
FX_CurrentPaletteAnimatedTilesBitset: skip 2 ; $196A
FX_RisingFunction: skip 2 ; $196C
FX_Type: skip 2 ; $196E
FX_YSubOffset: skip 2 ; $1970
FX_YOffset: skip 2 ; $1972
FX_TidePhase: skip 2 ; $1974
FX_BaseYSubPosition: skip 2 ; $1976
FX_BaseYPosition: skip 2 ; $1978
FX_TargetYPosition: skip 2 ; $197A
FX_YSubVelocity: skip 1 ; $197C
FX_YVelocity: skip 1 ; $197D
FX_LiquidOptions: skip 2 ; $197E
FX_Timer: skip 2 ; $1980

LayerBlending_DefaultConfig: skip 2 ; $1982
LayerBlending_Layer3Config: skip 2 ; $1984
LayerBlending_Config: skip 1 ; $1986
LayerBlending_Window2Config: skip 1 ; $1987
LayerBlending_PhantoonSemiTransparencyFlag: skip 2 ; $1988
Unused198A: skip 3 ; $198A..8C

EnemyProjectile_Enable: skip 4 ; $198D
EnemyProjectile_Index: skip 2 ; $1991
EnemyProjectile_InitParam0: skip 2 ; $1993
EnemyProjectile_InitParam1: skip 2 ; $1995
EnemyProjectile_ID: skip $24 ; $1997..BA
EnemyProjectile_GraphicsIndices: skip $24 ; $19BB..DE
EnemyProjectile_Timers: skip $24 ; $19DF..1A02
EnemyProjectile_PreInstructions: skip $24 ; $1A03..26
EnemyProjectile_XSubPositions: skip $24 ; $1A27..4A
EnemyProjectile_XPositions: skip $24 ; $1A4B..6E
EnemyProjectile_YSubPositions: skip $24 ; $1A6F..92
EnemyProjectile_YPositions: skip $24 ; $1A93..B6
EnemyProjectile_XVelocity: skip $24 ; $1AB7..DA
EnemyProjectile_YVelocity: skip $24 ; $1ADB..FE
EnemyProjectile_Var0: skip $24 ; $1AFF..1B22
EnemyProjectile_Var1: skip $24 ; $1B23..46
EnemyProjectile_InstListPointers: skip $24 ; $1B47..6A
EnemyProjectile_SpritemapPointers: skip $24 ; $1B6B..8E
EnemyProjectile_InstructionTimers: skip $24 ; $1B8F..B2
EnemyProjectile_Radii: skip $24 ; $1BB3..D6
EnemyProjectile_Properties: skip $24 ; $1BD7..FA
EnemyProjectile_CollidedProjectileType: skip $24 ; $1BFB..1C1E

org $198D
Mode7TransformationAngle: skip 2 ; $198D
Mode7TransformationZoomLevel: skip 2 ; $198F

CinematicBG1_XSubPosition: skip 2 ; $1991
CinematicBG1_XPosition: skip 2 ; $1993
CinematicBG1_YSubPosition: skip 2 ; $1995
CinematicBG1_YPosition: skip 2 ; $1997
CinematicBG1_XSubSpeed: skip 2 ; $1999
CinematicBG1_XSpeed: skip 2 ; $199B
CinematicBG1_YSubSpeed: skip 2 ; $199D
CinematicBG1_YSpeed: skip 2 ; $199F

Mode7Object_InstListPointers: skip 4 ; $19A1..A4
Mode7Object_PreInstructions: skip 4 ; $19A5..A8
Mode7Object_InstructionTimers: skip 4 ; $19A9..AC
Mode7Object_Timers: skip 4 ; $19AD..B0
Mode7Object_Index: skip 2 ; $19B1
NeverRead19B3: skip 2 ; $19B3

CinematicBGObject_IndirectInstructionPointers: skip 8 ; $19B5..BC
CinematicBGObject_Index: skip 2 ; $19BD
skip 14
CinematicBGObject_InstListPointers: skip 8 ; $19CD..D4
CinematicBGObject_PreInstructions: skip 8 ; $19D5..DC
CinematicBGObject_InstructionTimers: skip 8 ; $19DD..E4
CinematicBGObject_Timers: skip 8 ; $19E5..EC
skip 4
CinematicBGObject_Enable: skip 2 ; $19F1
CinematicBGObject_TilemapUpdateFlag: skip 2 ; $19F3
CinematicBGObject_VRAMAddr: skip 2 ; $19F5

TextGlowObject_IndirectInstructionPointers: skip $10 ; $19F7..1A06
TextGlowObject_Timers: skip $10 ; $1A07..16
TextGlowObject_XPositions: skip $10 ; $1A17..26
TextGlowObject_YPositions: skip $10 ; $1A27..36
TextGlowObject_PaletteIndices: skip $10 ; $1A37..46
TextGlowObject_Index: skip 8 ; $1A47

org $198D
TitleMenu_SelectionMissileAnimTimer: skip 2 ; $198D
TitleMenu_FileCopyArrowPaletteTimer: skip 2 ; $198F
TitleMenu_SlotAHelmetAnimationTimer: skip 2 ; $1991
TitleMenu_SlotBHelmetAnimationTimer: skip 2 ; $1993
TitleMenu_SlotCHelmetAnimationTimer: skip 2 ; $1995
TitleMenu_SelectionMissileAnimFrame: skip 2 ; $1997
NeverRead1999: skip 2 ; $1999
TitleMenu_SlotAHelmetAnimationFrame: skip 2 ; $199B
TitleMenu_SlotBHelmetAnimationFrame: skip 2 ; $199D
TitleMenu_SlotCHelmetAnimationFrame: skip 2 ; $199F
TitleMenu_SelectionMissileXPosition: skip 2 ; $19A1
NeverRead19A3: skip 2 ; $19A3
TitleMenu_SlotAHelmetXPosition: skip 2 ; $19A5
TitleMenu_SlotBHelmetXPosition: skip 2 ; $19A7
TitleMenu_SlotCHelmetXPosition: skip 2 ; $19A9
TitleMenu_SelectionMissileYPosition: skip 2 ; $19AB
NeverRead19AD: skip 2 ; $19AD
TitleMenu_SlotAHelmetYPosition: skip 2 ; $19AF
TitleMenu_SlotBHelmetYPosition: skip 2 ; $19B1
TitleMenu_SlotCHelmetYPosition: skip 2 ; $19B3
TitleMenu_FileCopyClearMenuSelection: skip 2 ; $19B5
TitleMenu_FileCopySrcFileClearSlot: skip 2 ; $19B7
TitleMenu_FileCopyDestSlot: skip 2 ; $19B9

org $19F7
CreditsObject_InstListPointer: skip 2 ; $19F7
CreditsObject_InstructionTimer: skip 2 ; $19F9
CreditsObject_Timer: skip 2 ; $19FB
CreditsObject_PreInstruction: skip 2 ; $19FD
CreditsObject_Enable: skip 2 ; $19FF
CreditsObject_CinematicBGTilemapRowIndex: skip 2 ; $1A01
CreditsObject_LastCreditsUpdateYPosition: skip 2 ; $1A03
CreditsObject_ShootingStarsEnable: skip 2 ; $1A05

org $1A49
CinematicFunctionTimer: skip 2 ; $1A49
IntroCrossFadeTimer: skip 0 ; $1A4B
CeresExplosion2OffsetIndex: skip 0 ; $1A4B
ZebesExplosionAfterglowTimer: skip 0 ; $1A4B
EndingShipXVelocity: skip 0 ; $1A4B
PostCreditsSamusBeamVRAMTransferIndex: skip 2 ; $1A4B
IntroBabyMetroidXVelocity: skip 0 ; $1A4D
IntroBabyMetroidIdleTimer: skip 0 ; $1A4D
EndingShipShakeIndex: skip 0 ; $1A4D
EndingShipXSubVelocity: skip 0 ; $1A4D
PostCreditsStarsFadeTimer: skip 0 ; $1A4D
PostCreditsSMIconVRAMTransferIndex: skip 2 ; $1A4D
IntroBabyMetroidYVelocity: skip 0 ; $1A4F
PostCreditsSamusFadeTimer: skip 2 ; $1A4F
CinematicFrameCounter: skip 2 ; $1A51
SkipToTitleScreenIndex: skip 2 ; $1A53
skip 2
IntroSamusDisplayFlag: skip 2 ; $1A57

CinematicSpriteObject_Index: skip 2 ; $1A59
CinematicSpriteObject_SpritemapPointers: skip $20 ; $1A5D..7C
CinematicSpriteObject_XPositions: skip $20 ; $1A7D..9C
CinematicSpriteObject_YPositions: skip $20 ; $1A9D..BC
CinematicSpriteObject_PaletteIndices: skip $20 ; $1ABD..DC
CinematicSpriteObject_XSubPosition: skip $20 ; $1ADD..FC
CinematicSpriteObject_YSubPosition: skip $20 ; $1AFD..1C
CinematicSpriteObject_InstListPointers: skip $20 ; $1B1B..3C
CinematicSpriteObject_PreInstructions: skip $20 ; $1B3D..5C
CinematicSpriteObject_InstructionTimers: skip $20 ; $1B5D..7C
CinematicSpriteObject_Timers: skip $20 ; $1B7D..9C
CinematicSpriteObject_InitParam: skip 2 ; $1B9D
CinematicSpriteObject_FrameCounter: skip 2 ; $1B9F
CinematicSpriteObject_IntroTextClickFlag: skip 2 ; $1BA1
CinematicSpriteObject_IntroJapanTextTimer: skip 2 ; $1BA3

org $1A8F
GameOptionsMenuObject_Index: skip 2 ; $1A8F
skip 2
GameOptionsMenuObject_InitParam: skip 2 ; $1A93
GameOptionsMenuObject_SpritemapPointers: skip $10 ; $1A9D..AC
GameOptionsMenuObject_XPositions: skip $10 ; $1AAD..BC
GameOptionsMenuObject_YPositions: skip $10 ; $1ABD..CC
GameOptionsMenuObject_PaletteIndices: skip $10 ; $1ACD..DC
NeverRead1ADD: skip $10 ; $1ADD..EC
NeverRead1AED: skip $10 ; $1AED..FC
GameOptionsMenuObject_InstListPointers: skip $10 ; $1AFD..1B0C
GameOptionsMenuObject_PreInstructions: skip $10 ; $1B0D..1C
GameOptionsMenuObject_InstructionTimers: skip $10 ; $1B1D..2C
GameOptionsMenuObject_Timers: skip $10 ; $1B2D..3C
GameOptionsMenuObject_ControllerBindings: skip $10 ; $1B3D..4C

org $1C1F
MessageBoxIndex: skip 2 ; $1C1F
skip 2 ; Unused

PLM_Flag: skip 2 ; $1C23
PLM_DrawTilemapIndex: skip 2 ; $1C25
PLM_Index: skip 2 ; $1C27
PLM_XBlock: skip 2 ; $1C29
PLM_YBlock: skip 2 ; $1C2B
PLM_ItemGFXIndex: skip 2 ; $1C2D
PLM_ItemGFXPointers: skip 8 ; $1C2F..36
PLM_IDs: skip $50 ; $1C37..86
PLM_BlockIndices: skip $50 ; $1C87..D6
PLM_PreInstructions: skip $50 ; $1CD7..1D26
PLM_InstListPointers: skip $50 ; $1D27..76
PLM_Timers: skip $50 ; $1D77..C6
PLM_RoomArgs: skip $50 ; $1DC7..1E16
PLM_Vars: skip $50 ; $1E17..66

CustomDrawInst_NumberOfBlocks: skip 2 ; $1E67
CustomDrawInst_PLMBlock: skip 2 ; $1E69
CustomDrawInst_Terminator: skip 2 ; $1E6B

org $1E6D
TourianStatueFinishedProcessing: skip 2 ; $1E6D
TourianStatueAnimationState: skip 2 ; $1E6F
SamusInQuicksand: skip 2 ; $1E71
InsideBlockReactionSamusPoint: skip 2 ; $1E73
SaveStationLockoutFlag: skip 2 ; $1E75
CurrentSlopeBTS: skip 2 ; $1E77

PaletteFXObject_Enable: skip 2 ; $1E79
PaletteFXObject_Index: skip 2 ; $1E7B
PaletteFXObject_IDs: skip $10 ; $1E7D..8C
PaletteFXObject_ColorIndices: skip $10 ; $1E8D..9C
PaletteFXObject_Vars: skip $10 ; $1E9D..AC
PaletteFXObject_PreInstructions: skip $10 ; $1EAD..BC
PaletteFXObject_InstListPointers: skip $10 ; $1EBD..CC
PaletteFXObject_InstructionTimers: skip $10 ; $1ECD..DC
PaletteFXObject_Timers: skip $10 ; $1EDD..EC
PaletteFXObject_SamusInHeatIndex: skip 2 ; $1EED
PaletteFXObject_PreviousSamusInHeatIndex: skip 2 ; $1EEF

AnimatedTilesObject_Enable: skip 2 ; $1EF1
AnimatedTilesObject_Index: skip 2 ; $1EF3
AnimatedTilesObject_IDs: skip 12 ; $1EF5..1F00
AnimatedTilesObject_Timers: skip 12 ; $1F01..0C
AnimatedTilesObject_InstListPointers: skip 12 ; $1F0D..18
AnimatedTilesObject_InstructionTimers: skip 12 ; $1F19..24
AnimatedTilesObject_SrcAddr: skip 12 ; $1F25..30
AnimatedTilesObject_Sizes: skip 12 ; $1F31..3C
AnimatedTilesObject_VRAMAddr: skip 12 ; $1F3D..48
AnimatedTilesObject_Instruction: skip 2 ; $1F49
skip 6

CinematicFunction: skip 2 ; $1F51

DemoTimer: skip 2 ; $1F53
DemoSet: skip 2 ; $1F55
DemoScene: skip 2 ; $1F57
NumberOfDemoSets: skip 2 ; $1F59


; $7E0000..FFFF

org $7E2000
FadingPalettes: skip $200 ; $7E2000..21FF
FadingPalettes_Initial: skip $200 ; $7E2200..23FF
FadingPalettes_Red: skip $200 ; $7E2400..25FF
FadingPalettes_Green: skip $200 ; $7E2600..27FF
FadingPalettes_Blue: skip $200 ; $7E2800..29FF
FadingPalettes_DeltaRed: skip $200 ; $7E2A00..2BFF
FadingPalettes_DeltaGreen: skip $200 ; $7E2C00..2DFF
FadingPalettes_DeltaBlue: skip $200 ; $7E2E00..2FFF

org $7E2000
CorpseRottingGFX_Torizo: skip 0 ; $7E2000..2EFF
CorpseRottingGFX_Sidehopper0: skip $320 ; $7E2000..231F
CorpseRottingGFX_Sidehopper2: skip $320 ; $7E2320..263F
CorpseRottingGFX_Skree0: skip $100 ; $7E2640..273F
CorpseRottingGFX_Skree2: skip $100 ; $7E2740..283F
CorpseRottingGFX_Skree4: skip $100 ; $7E2840..293F
CorpseRottingGFX_Zoomer0: skip $C0 ; $7E2940..29FF
CorpseRottingGFX_Zoomer2: skip $C0 ; $7E2A00..2ABF
CorpseRottingGFX_Zoomer4: skip $C0 ; $7E2AC0..2B7F
CorpseRottingGFX_Ripper0: skip $C0 ; $7E2B80..2C3F
CorpseRottingGFX_Ripper2: skip $C0 ; $7E2C40..2CFF

org $7E2000
RoomTiles: ; $7E2000..9FFF
GreyCloudsDuringZebesExplosionTilemap: ; $7E2000..5FFF
EnemyBG2Tilemap: ; $7E2000..2FFF

org $7E3000
CinematicBGTilemap_TopMarginInitialJapanText: skip $100 ; $7E3000..FF
CinematicBGTilemap_EnglishTextRegion: skip $500 ; $7E3100..35FF
CinematicBGTilemap_JapanTextRegion: skip $100 ; $7E3600..FF
CinematicBGTilemap_BottomMargin: skip $100 ; $7E3700..FF

org $7E3000
GameOptionsMenuTilemap: ; $7E3000..37FF
PauseMenuMapTilemap: ; $7E3000..37FF

MessageBoxBG3YScrollHDMADataTable: ; $7E3000..31DF
skip $1D8
DummySamusWireframeTilemap: ; $7E31D8..33E7
skip $28
MessageBoxTilemap: skip $180 ; $7E3200..337F
MessageBoxBG3YScrollIndirectHDMATable: ; $7E3380..86

org $7E3300
BackupOfPalettesDuringMenu: ; $7E3300..34FF
skip $EA
BackupOfHDMAChannelsDuringMessageBoxes: skip 1 ; $7E33EA
BackupOfBG3TilemapBaseAddrSizeDuringMessageBoxes: skip 1 ; $7E33EB
skip $14
LowerHalfOfPauseMenuMapBG2Tilemap: ; $7E3400..37FF
skip $100
BackupOfRegularIORegistersDuringGameOverMenu: ; $7E3500
skip $100
MenuTilemap: ; $7E3600..3DFF
skip $200
CinematicBGTilemap: ; $7E3800..3FFF
RoomSelectMapBG1Tilemap: ; $7E3800..3FFF
EquipmentScreenBG1Tilemap: ; $7E3800..3FFF
DebugGameOverMenuTilemap: ; $7E3800..3FFF
ClearedMessageBoxBG3Tilemap:  ; $7E3800..3EFF

org $7E4000
XrayTilemaps_BG2: skip $1000 ; $7E4000..4FFF
XrayTilemaps_BackupBG2: skip $1000 ; $7E5000..5FFF
XrayTilemaps_BackupBG1: skip $1000 ; $7E6000..6FFF

org $7E4000
BG2Tilemap: ; $7E4000..4FFF
CrocomireMeltingBG2Tiles: ; $7E4000..4FFF
ClearingFXTilemap: ; $7E4000..4EFF
DecompressionBufferForKraidTopHalfBG2Tilemap: ; $7E4000..47FF
BG2RoomSelectMapTilemap: ; $7E4000..47FF
IntroBG3JapanTextTiles: ; $7E4000..45FF
skip $100
BackupOfVRAMDuringMessageBoxes: ; $7E4100..47FF
skip $E00
CopyOfVRAMDuringPauseMenuKraidRoom: ; $7E5000..53FF
skip $1000
BigZebesDuringZebesExplosionTilemap: ; $7E6000..9FFF

org $7E6000
PostCreditsSuperMetroidIcon_Tiles: skip $2000 ; $7E6000..7FFF
PostCreditsSuperMetroidIcon_Tilemap: skip $800 ; $7E8000..87FF

org $7E7000
EnemyTileData: ; $7E7000..97FF

Unused7000: skip 2 ; $7E7000
NeverRead7002: skip 2 ; $7E7002
skip 2
EnemySpawnData_VRAMTilesIndex: skip 2 ; $7E7006
EnemySpawnData_PaletteIndex: skip 2 ; $7E7008
EnemySpawnData_GraphicalXOffset: skip 2 ; $7E7010
EnemySpawnData_GraphicalYOffset: skip 2 ; $7E7012
skip 8
EnemySpawnData_ID: skip 2 ; $7E701E
EnemySpawnData_XPosition: skip 2 ; $7E7020
EnemySpawnData_YPosition: skip 2 ; $7E7022
EnemySpawnData_InitParam: skip 2 ; $7E7024
EnemySpawnData_Properties: skip 2 ; $7E7026
EnemySpawnData_ExtraProperties: skip 2 ; $7E7028
EnemySpawnData_Param1: skip 2 ; $7E702A
EnemySpawnData_Param2: skip 2 ; $7E702C
EnemySpawnData_Name: skip 12 ; $7E702E..39

; see "ENEMY RAM" section below for extra enemy RAM ($7800, $8000, $8800)

org $7E9000
MotherBrainCorpseRottingGFX: ; $7E9000..953F
BotwoonPositionHistory: ; $7E9000..93FF
WavyPhantoonBG2XScrollIndirectHDMATable: ; $7E9000..19
EyeBeamWindow1IndirectHDMATable: ; $7E9000..0A
KraidDeathSequenceQuakeSoundTimer: skip 2 ; $7E9000
DisableSporeSpawnSporeGeneration: ; $7E9000
DraygonSwoopYPositions: ; $7E9002..97FF

CrocomireDeath_PreBridgeBlockDustCloudSpawnedFlag: skip 2 ; $7E9000
CrocomireDeath_BridgePart1CrumbledFlag: skip 2 ; $7E9002
skip 2
CrocomireDeath_BridgePart2CrumbledFlag: skip 2 ; $7E9006
skip 2
NeverRead900A: skip 2 ; $7E900A
skip 10
CrocomireDeath_CrumblingBridgeIndex: skip 2 ; $7E9016
CrocomireDeath_AcidDamageSmokeTimer: skip 2 ; $7E9018

org $7E9032
PhantoonMaterializationSFXIndex: ; $7E9032

org $7E9080
EyeBeamAngularWidthDelta: ; $7E9080
EyeBeamAngularSubWidthDelta: ; $7E9082
skip 14
EyeBeamColorIndex: ; $7E9090
skip $70
EyeBeamWindow1HDMADataTable: ; $7E9100..92FF
WavyPhantoonBG2XScrollHDMADataTable: ; $7E9100..FF
skip $600
MotherBrainCorpseRottingRotTable: ; $7E9700..BF
skip $DC
EnemyProjectileAngles: ; $7E97DC..FF

org $7E9800
XrayWindow2HDMADataTable: ; $7E9800..99FF
SuitPickupWindow1HDMADataTable: ; $7E9800..99FF
WavySamusBG3XScrollHDMADataTable: ; $7E9800..FF
TitleScreenGradientColorMathSubScreenBackdropColorHDMATable: ; $7E9800..41
skip $400
ExpandingContractingEffectBG2YScrollIndirectHDMADataTable: ; $7E9C00..9DBF
FXType22BG3YScrollHDMATable: ; $7E9C00..2B
MotherBrainRainbowBeamWindow1IndirectHDMATable: ; $7E9C00..0D
LavaAcidBG3YScrollHDMADataTable: ; $7E9C00..03
AboveSurfaceWaterBG3XScrollHDMADataEntry: ; $7E9C00
skip 4
WaterBG3XScrollHDMADataTable: ; $7E9C04..23
skip $42
LavaAcidBG2YScrollHDMADataTable: ; $7E9C46..65
skip 2
WaterBG2XScrollHDMADataTable: ; $7E9C48..67

org $7E9D00
MotherBrainRainbowBeamWindow1HDMADataTable: ; $7E9D00..??
HazeColorMathSubscreenBackdropColorHDMADataTable: ; $7E9D00..0F
skip $100
ExpandingSquareTransitionWindow1LeftIndirectHDMATable: ; $7E9E00..0B
ExpandingContractingEffectBG2YScrollIndirectHDMATable: ; $7E9E00..07
TourianStatueBG2YScroll: skip 2 ; $7E9E00
FXType22BG3XScrollIndirectHDMATable: ; $7E9E02..??

org $7E9E10
ExpandingSquare_TransitionWindow1RightIndirectHDMATable: skip $10 ; $7E9E10..1B
ExpandingSquare_TopBottomMarginRightPosition: skip 2 ; $7E9E20
ExpandingSquare_TopBottomMarginLeftPosition: skip 2 ; $7E9E22
skip 12
ExpandingSquare_LeftSubPosition: skip 2 ; $7E9E30
ExpandingSquare_LeftPosition: skip 2 ; $7E9E32
ExpandingSquare_RightSubPosition: skip 2 ; $7E9E34
ExpandingSquare_RightPosition: skip 2 ; $7E9E36
ExpandingSquare_TopSubPosition: skip 2 ; $7E9E38
ExpandingSquare_TopPosition: skip 2 ; $7E9E3A
ExpandingSquare_BottomSubPosition: skip 2 ; $7E9E3C
ExpandingSquare_BottomPosition: skip 2 ; $7E9E3E
ExpandingSquare_LeftPositionSubVelocity: skip 2 ; $7E9E40
ExpandingSquare_LeftPositionVelocity: skip 2 ; $7E9E42
ExpandingSquare_RightSubVelocity: skip 2 ; $7E9E44
ExpandingSquare_RightVelocity: skip 2 ; $7E9E46
ExpandingSquare_TopSubVelocity: skip 2 ; $7E9E48
ExpandingSquare_TopVelocity: skip 2 ; $7E9E4A
ExpandingSquare_BottomSubVelocity: skip 2 ; $7E9E4C
ExpandingSquare_BottomVelocity: skip 2 ; $7E9E4E
ExpandingSquare_Timer: skip 2 ; $7E9E50

org $7E9E80
FXType22BG3XScrollHDMADataTable: ; $7E9E80..??
skip $80
ScrollingSkyBG2XScrollIndirectHDMATable: skip 2 ; $7E9F00..7F
FXType22BG1XScrollIndirectHDMADataTable: skip $7E ; $7E9F02..??
ScrollingSkyBG2XScrollHDMADataTable: ; $7E9F80..DB

org $7EA000
TileTable_TopLeft: skip 2 ; $7EA000
TileTable_TopRight: skip 2 ; $7EA002
TileTable_BottomLeft: skip 2 ; $7EA004
TileTable_BottomRight: skip 2 ; $7EA006

org $7EA000
DecompressedCRE: ; $7EA000..A7FF
EndingFont3Tiles: ; $7EA000..AFFF
skip $800
DecompressedSCE: ; $7EA800..BFFF

org $7EC000
Palettes: skip 0 ; $7EC000
Palettes_MainBackdrop: skip 2 ; $7EC000
Palettes_BG3P0AcidHighlight: skip 2 ; $7EC002
Palettes_BG3P0AcidBubbles: skip 2 ; $7EC004
Palettes_BG3P0AcidBackground: skip 2 ; $7EC006
Palettes_BG3P1: skip 8 ; $7EC008..0F
Palettes_BG3P2: skip 2 ; $7EC010
Palettes_BG3P2MinimapExplored: skip 0 ; $7EC012
Palettes_BG3P2NonEmptyEtank: skip 0 ; $7EC012
Palettes_BG3P2MessageBoxHeaderText: skip 0 ; $7EC012
Palettes_BG3P2MessageBoxAButton: skip 2 ; $7EC012
Palettes_BG3P2MinimapExploredFeature: skip 0 ; $7EC014
Palettes_BG3P2NonEmptyEtankOutline: skip 0 ; $7EC014
Palettes_BG3P2MinimapMessageBoxBodyText: skip 2 ; $7EC014
Palettes_BG3P2MinimapExploredBackground: skip 0 ; $7EC016
Palettes_BG3P2NonEmptyEtankBackground: skip 0 ; $7EC016
Palettes_BG3P2MessageBoxBackground: skip 2 ; $7EC016
Palettes_BG3P3: skip 2 ; $7EC018
Palettes_BG3P3MinimapUnexplored: skip 0 ; $7EC01A
Palettes_BG3P3HUDTextOutline: skip 0 ; $7EC01A
Palettes_BG3P3EmptyReserveAutoIcon: skip 0 ; $7EC01A
Palettes_BG3P3MessageBoxXButton: skip 0 ; $7EC01A
Palettes_BG3P3UnselectedSaveDialog: skip 2 ; $7EC01A
Palettes_BG3P3MinimapUnexploredFeature: skip 0 ; $7EC01C
Palettes_BG3P3HUDText: skip 0 ; $7EC01C
Palettes_BG3P3MinimapGrid: skip 2 ; $7EC01C
Palettes_BG3P3MinimapUnexploredBackground: skip 0 ; $7EC01E
Palettes_BG3P3HUDBackground: skip 2 ; $7EC01E
Palettes_BG3P4: skip 2 ; $7EC020
Palettes_BG3P4HighlightedHUDItemBackgroundOutline: skip 2 ; $7EC022
Palettes_BG3P4HighlightedHUDItemBackground: skip 2 ; $7EC024
Palettes_BG3P4HighlightedHUDItemOutline: skip 2 ; $7EC026
Palettes_BG3P5: skip 2 ; $7EC028
Palettes_BG3P5HUDItemBackgroundOutline: skip 2 ; $7EC02A
Palettes_BG3P5HUDItemBackground: skip 2 ; $7EC02C
Palettes_BG3P5HUDItemOutline: skip 2 ; $7EC02E
Palettes_BG3P6: skip 2 ; $7EC030
Palettes_BG3P6FXPrimary: skip 2 ; $7EC032
Palettes_BG3P6FXSecondary: skip 2 ; $7EC034
Palettes_BG3P6FXBackground: skip 2 ; $7EC036
Palettes_BG3P7: skip 2 ; $7EC038
Palettes_BG3P7MinimapRoomHighlight: skip 0 ; $7EC03A
Palettes_BG3P7NonEmptyReserveAutoIcon: skip 0 ; $7EC03A
Palettes_BG3P7SaveDialogText: skip 0 ; $7EC03A
Palettes_BG3P7MessageBoxBButton: skip 0 ; $7EC03A
Palettes_BG3P7MessageBoxSamusSuit: skip 2 ; $7EC03A
Palettes_BG3P7MinimapRoomFeatureHighlight: skip 0 ; $7EC03C
Palettes_BG3P7MessageBoxSamusSuitShading: skip 2 ; $7EC03C
Palettes_BG3P7MinimapBackground: skip 0 ; $7EC03E
Palettes_BG3P7NonEmptyReserveAutoIconBackground: skip 0 ; $7EC03E
Palettes_BG3P7SaveDialogBackgrond: skip 0 ; $7EC03E
Palettes_BG3P7MessageBoxSamusBackground: skip 2 ; $7EC03E
Palettes_BG12P2: skip $20 ; $7EC040..5F
Palettes_BG12P3: skip $20 ; $7EC060..7F
Palettes_BG12P4: skip $20 ; $7EC080..9F
Palettes_BG12P5: skip $20 ; $7EC0A0..BF
Palettes_BG12P6: skip $20 ; $7EC0C0..DF
Palettes_BG12P7: skip $20 ; $7EC0E0..FF
Palettes_SpriteP0: skip $20 ; $7EC100..1F
Palettes_SpriteP1: skip $20 ; $7EC120..3F
Palettes_SpriteP2: skip $20 ; $7EC140..5F
Palettes_SpriteP3: skip $20 ; $7EC160..7F
Palettes_SpriteP4C0: skip 2 ; $7EC180
Palettes_SpriteP4C1: skip 2 ; $7EC182
Palettes_SpriteP4C2: skip 2 ; $7EC184
Palettes_SpriteP4C3: skip 2 ; $7EC186
Palettes_SpriteP4C4: skip 2 ; $7EC188
Palettes_SpriteP4C5: skip 2 ; $7EC18A
Palettes_SpriteP4C6: skip 2 ; $7EC18C
Palettes_SpriteP4C7: skip 2 ; $7EC18E
Palettes_SpriteP4C8: skip 2 ; $7EC190
Palettes_SpriteP4C9: skip 2 ; $7EC192
Palettes_SpriteP4CA: skip 2 ; $7EC194
Palettes_SpriteP4CB: skip 2 ; $7EC196
Palettes_SpriteP4CC: skip 2 ; $7EC198
Palettes_SpriteP4CD: skip 2 ; $7EC19A
Palettes_SpriteP4CE: skip 2 ; $7EC19C
Palettes_SpriteP4CF: skip 2 ; $7EC19E
Palettes_SpriteP5: skip $20 ; $7EC1A0..BF
Palettes_SpriteP6: skip $20 ; $7EC1C0..DF
Palettes_SpriteP7: skip $20 ; $7EC1E0..FF

TargetPalettes_BGP0: skip $20 ; $7EC200..1F
TargetPalettes_BGP1: skip $20 ; $7EC220..3F
TargetPalettes_BGP2: skip $20 ; $7EC240..5F
TargetPalettes_BGP3: skip $20 ; $7EC260..7F
TargetPalettes_BGP4: skip $20 ; $7EC280..9F
TargetPalettes_BGP5: skip $20 ; $7EC2A0..BF
TargetPalettes_BGP6: skip $20 ; $7EC2C0..DF
TargetPalettes_BGP7: skip $20 ; $7EC2E0..FF
TargetPalettes_SpriteP0: skip $20 ; $7EC300..1F
TargetPalettes_SpriteP1: skip $20 ; $7EC320..3F
TargetPalettes_SpriteP2: skip $20 ; $7EC340..5F
TargetPalettes_SpriteP3: skip $20 ; $7EC360..7F
TargetPalettes_SpriteP4: skip $20 ; $7EC380..9F
TargetPalettes_SpriteP5: skip $20 ; $7EC3A0..BF
TargetPalettes_SpriteP6: skip $20 ; $7EC3C0..DF
TargetPalettes_SpriteP7: skip $20 ; $7EC3E0..FF

PaletteChangeNumerator: skip 2 ; $7EC400
PaletteChangeDenominator: skip 2 ; $7EC402
ColorIndexInPaletteChangeRoutines: skip 2 ; $7EC404

PowerBombExplosionWindow2LeftHDMADataTable: skip $C0 ; $7EC406..C5
skip $40
PowerBombExplosionWindow2RightHDMADataTable: skip $C0 ; $7EC506..C5
skip $40
OffScreenPowerBombExplosionWindow2LeftHDMADataTable: skip 1 ; $7EC606
OffScreenPowerBombExplosionWindow2RightHDMADataTable: skip 1 ; $7EC607

HUDTilemap: skip 2 ; $7EC608
HUDTilemap_Row1EnergyTanks: skip 14 ; $7EC60A..17
HUDTilemap_Row1AutoReserve: skip 4 ; $7EC618..1B
HUDTilemap_Row1Missiles: skip 6 ; $7EC61C..21
skip 2
HUDTilemap_Row1SuperMissiles: skip 4 ; $7EC624..27
skip 2
HUDTilemap_Row1PowerBombs: skip 4 ; $7EC62A..2D
skip 2
HUDTilemap_Row1Grapple: skip 4 ; $7EC630..33
skip 2
HUDTilemap_Row1Xray: skip 4 ; $7EC636..39
skip 2
HUDTilemap_Row1Minimap: skip 10 ; $7EC63C..45
skip 2
HUDTilemap_Row2: skip 2 ; $7EC648
HUDTilemap_Row2EnergyTanks: skip 14 ; $7EC64A..57
HUDTilemap_Row2AutoReserve: skip 4 ; $7EC658..5B
HUDTilemap_Row2Missiles: skip 6 ; $7EC65C..61
skip 2
HUDTilemap_Row2SuperMissiles: skip 4 ; $7EC664..67
skip 2
HUDTilemap_Row2PowerBombs: skip 4 ; $7EC66A..6D
skip 2
HUDTilemap_Row2Grapple: skip 4 ; $7EC670..73
skip 2
HUDTilemap_Row2Xray: skip 4 ; $7EC676..79
skip 2
HUDTilemap_Row2Minimap: skip 4 ; $7EC67C..85
HUDTilemap_SamusMinimapPosition: skip 2 ; $7EC680
skip $12
HUDTilemap_Row3EnergyCount: skip 4 ; $7EC694..97
HUDTilemap_Row3AutoReserve: skip 4 ; $7EC698..9B
HUDTilemap_Row3MissileCount: skip 6 ; $7EC69C..A1
HUDTilemap_Row3SuperMissileCount: skip 4 ; $7EC6A4..A7
HUDTilemap_Row3DebugExtraDigit: skip 2 ; $7EC6A8
HUDTilemap_Row3PowerBombCount: skip 2 ; $7EC6AA..AD
HUDTilemap_Row3Minimap: skip 10 ; $7EC6BC..C5

org $7EC6C8
PLMDrawTilemap: skip $200 ; $7EC6C8..C8C7
BG1ColumnUpdateTilemapLeftHalves: skip $40 ; $7EC8C8..C907
BG1ColumnUpdateTilemapRightHalves: skip $40 ; $7EC908..47
BG1RowUpdateTilemapTopHalves: skip $44 ; $7EC948..8B
BG1RowUpdateTilemapBottomHalves: skip $44 ; $7EC98C..CF
BG2ColumnUpdateTilemapLeftHalves: skip $40 ; $7EC9D0..CA0F
BG2ColumnUpdateTilemapRightHalves: skip $40 ; $7ECA10..4F
BG2RowUpdateTilemapTopHalves: skip $44 ; $7ECA50..93
BG2RowUpdateTilemapBottomHalves: skip $44 ; $7ECA94..D7
HUDBG3XPosition: skip 2 ; $7ECAD8
HUDBG3YPosition: skip 2 ; $7ECADA
BG3XPosition: skip 2 ; $7ECADC
BG3YPosition: skip 2 ; $7ECADE
CrocomireBG2YScrollIndirectHDMATable: skip 8 ; $7ECAE0..E7
skip 8
CrocomireBG2YScrollHDMADataTable: skip $210 ; $7ECAF0..CCEF
skip $20
Scrolls: skip $32 ; $7ECD20..51

ExploredMapTiles: skip 0 ; $7ECD52
ExploredMapTiles_Crateria: skip $100 ; $7ECD52..CE51
ExploredMapTiles_Brinstar: skip $100 ; $7ECE52..CF51
ExploredMapTiles_Norfair: skip $100 ; $7ECF52..D051
ExploredMapTiles_WreckedShip: skip $100 ; $7ED052..D151
ExploredMapTiles_Maridia: skip $100 ; $7ED152..D251
ExploredMapTiles_Tourian: skip $100 ; $7ED252..D351
ExploredMapTiles_Ceres: skip $100 ; $7ED352..D451
ExploredMapTiles_Debug: skip $100 ; $7ED452..D551

EnemySetName: skip 7 ; $7ED552..58
EnemySetData_Name: skip 10 ; $7ED559
EnemySetData_PaletteIndex: skip 2 ; $7ED563

org $7ED652
RobotPaletteAnimationPaletteIndex: skip 2 ; $7ED652
RobotPaletteAnimationTimer: skip 2 ; $7ED654
RobotPaletteAnimationTableIndex: skip 2 ; $7ED656

ProjectileTrail_LeftInstructionTimer: skip $24 ; $7ED658..7B
ProjectileTrail_RightInstructionTImer: skip $24 ; $7ED67C..9F
ProjectileTrail_LeftInstListPointer: skip $24 ; $7ED6A0..C3
ProjectileTrail_RightInstListPointer: skip $24 ; $7ED6C4..E7
ProjectileTrail_LeftTileNumberAttributes: skip $24 ; $7ED6E8..D70B
ProjectileTrail_RightTileNumberAttributes: skip $24 ; $7ED70C..2F
ProjectileTrail_LeftXPosition: skip $24 ; $7ED730..53
ProjectileTrail_RightXPosition: skip $24 ; $7ED754..77
ProjectileTrail_LeftYPosition: skip $24 ; $7ED778..9B
ProjectileTrail_RightYPosition: skip $24 ; $7ED79C..BF

SRAMMirror_Equipment: skip $60 ; $7ED7C0..D81F
SRAMMirror_Event: skip 0 ; $7ED820
SRAMMirror_Event0: skip 1 ; $7ED820
SRAMMirror_Event1: skip 1 ; $7ED821
SRAMMirror_Event2: skip 1 ; $7ED822
skip 5
SRAMMirror_Boss: skip 0 ; $7ED828
SRAMMirror_BossCrateria: skip 1 ; $7ED828
SRAMMirror_BossBrinstar: skip 1 ; $7ED829
SRAMMirror_BossNorfair: skip 1 ; $7ED82A
SRAMMirror_BossWreckedShip: skip 1 ; $7ED82B
SRAMMirror_BossMaridia: skip 1 ; $7ED82C
SRAMMirror_BossTourian: skip 1 ; $7ED82D
SRAMMirror_BossCeres: skip 1 ; $7ED82E
SRAMMirror_BossDebug: skip 1 ; $7ED82F
SRAMMirror_ChozeBlockDestroyed: skip $40 ; $7ED830..6F
SRAMMirror_Items: skip $40 ; $7ED870..AF
SRAMMirror_Doors: skip $40 ; $7ED8B0..EF
UnusedD8F0: skip 8 ; $7ED8F0..F7
SRAMMirror_UsedSaveStationsElevators: skip $10 ; $7ED8F8..D907
SRAMMirror_MapStations: skip 8 ; $7ED908..0F
UnusedD910: skip 4 ; $7ED910..13
SRAMMirror_LoadingGameState: skip 2 ; $7ED914
SRAMMirror_SaveStationIndex: skip 2 ; $7ED916
SRAMMirror_AreaIndex: skip 2 ; $7ED918
SRAMMirror_GlobalNumberOfItemsLoadedCounter: skip 2 ; $7ED91A
SRAMMirror_MapDataCrateria: skip $4A ; $7ED91C..65
SRAMMirror_MapDataBrinstar: skip $48 ; $7ED966..AD
SRAMMirror_MapDataNorfair: skip $4C ; $7ED9AE..F9
SRAMMirror_MapDataWreckedShip: skip $12 ; $7ED9FA..DA0B
SRAMMirror_MapDataMaridia: skip $42 ; $7EDA0C..4D
SRAMMirror_MapDataTourian: skip $15 ; $7EDA4E..62
skip $3B8
SRAMMirror_End: ; $7EDE1B

org $7EDE1C
PLMExtra_InstructionTimers: skip $50 ; $7EDE1C..6B
PLMExtra_DrawInstructionPointers: skip $50 ; $7EDE6C..BB
PLMExtra_LinkInstructions: skip $50 ; $7EDEBC..DF0B
PLMExtra_Vars: skip $50 ; $7EDF0C..5B

BackupBG2TilemapPauseMenu: skip $1000 ; $7EDF5C..EF5B

EnemyGFXData_IDs: skip 8 ; $7EEF5C..63
EnemyGFXData_TilesIndex: skip 8 ; $7EDE64..6B
EnemyGFXData_PaletteIndices: skip 8 ; $7EDE6C..73
EnemyGFXData_StackPointer: skip 2 ; $7EDE74
EnemyGFXData_NexttilesIndex: skip 2 ; $7EDE76

SpriteObjects_InstListPointers: skip $40 ; $7EEF78..F7
SpriteObjects_Instructions: skip 0 ; $7EEFF8..F077
SpriteObjects_Timers: skip $40 ; $7EEFF8..F077
SpriteObjects_Palettes: skip 0 ; $7EF078..F7
SpriteObjects_VRAMIndices: skip $80 ; $7EF078..F7
SpriteObjects_XPositions: skip $80 ; $7EF0F8..F177
SpriteObjects_XSubPositions: skip $80 ; $7EF178..F7
SpriteObjects_YPositions: skip $80 ; $7EF1F8..F277
SpriteObjects_YSubPositions: skip $80 ; $7EF278..F7
SpriteObjects_DisableFlags: skip $80 ; $7EF2F8..F377

EnemyProcessingStage: skip 2 ; $7EF378
neverReadF37A: skip 2 ; $7EF37A
neverReadF37C: skip 2 ; $7EF37C
neverReadF37E: skip 2 ; $7EF37E

EnemyProjectileData_CollisionOptions: skip $24 ; $7EF380..A3
skip $24
EnemyProjectileData_EnemyHeaderPointer: skip $24 ; $7EF3C8..EB
skip $24
EnemyProjectileData_KilledEnemyIndex: skip $24 ; $7EF410..33
EnemyProjectileData_SpecialDeathItemDropXOriginPosition: skip 2 ; $7EF434
EnemyProjectileData_SpecialDeathItemDropYOriginPosition: skip 2 ; $7EF436


; $7F0000..FFFF

org $7F0000
SizeOfLevelData: skip 2 ; $7F0000
LevelData: skip $6400 ; $7F0002..6401
BTS: skip $3200 ; $7F6402..9601
CustomBackground: skip $6400 ; $7F9602..FA01

org $7F0000
EndingShipTiles: ; $7F0000..3FFF
CreditsTilemap: ; $7F0000..1FFF
skip $4000
PostCreditsSamusBeamInterleavedTilesTilemap: ; $7F4000.BFFF
EndingShipTIlemap: ; $7F4000..7FFF
CeresCutsceneTilemap_ShipFront: ; $7F4000..42FF
skip $300
CeresCutsceneTilemap_ShipBack: skip $300 ; $7F4300..45FF
CeresCutsceneTilemap_Ceres: skip $600 ; $7F4600..4BFF
CeresCutsceneTilemap_ClearTilemap: skip $3400 ; $7F4C00..42FF
ZebesExplosionTiles: ; $7F8000..DFFF
IntroFont1Tiles: ; $7F8000..88FF
skip $1000
TitleBabyMetroidTiles: skip $1000 ; $7F9000..93FF
IntroFont2Tiles: skip $2000 ; $7FA000..B1FF
CreditsFont3: ; $7FC000..D7FF
GameOptionsTilemap_Options: skip $800 ; $7FC000..C7FF
GameOptionsTilemap_EnglishControllerSettings: skip $800 ; $7FC800..CFFF
ItemPercentageJapanText: ; $7FD000..D3FF
GameOptionsTilemap_JapanControllerSettings: skip $800 ; $7FD000..D7FF
GameOptionsTilemap_EnglishSpecialSettings: skip $800 ; $7FD800..DFFF
GameOptionsTilemap_JapanSpecialSettings: ; $7FE000..E7FF
WidePartOfZebesExplosionTilemap: ; $7EE000..E7FF
skip $800
ConcentricWidePartOfZebesExplosionTilemap: skip $800 ; $7FE800..EFFF
EclipseOfZebesDuringExplosionTilemap: skip $800 ; $7FF000..F7FF
EndingBlankTilemap: skip $800 ; $7FF800..FFFF


; https://github.com/pjboy/lua/blob/master/enemy%20data.txt
; ENEMY RAM

check bankcross off

struct Boyon $0FA8
  .speedMultiplier: skip 2 ; $0FA8
  .speed: skip 2 ; $0FAA
  .jumpHeight: skip 2 ; $0FAC
  .distanceAccumulator: skip 2 ; $0FAE
  .speedTableIndex: skip 2 ; $0FB0
  .bouncingIndex: skip 2 ; $0FB2
skip $7DE84C
  .initialBounceSpeedTableIndex: skip 2 ; $7E7800
  .bounceMovementIndex: skip 2 ; $7E7802
  .bounceDisableFlag: skip 2 ; $7E7804
  .speedMultiplierMirror: skip 2 ; $7E7806
  .idleDisableFlag: skip 2 ; $7E7808
  .bounceSpeedCalculatedFlag: skip 2 ; $7E780A
endstruct

struct Stoke $0FA8
  .rightSubVelocity: skip 2 ; $0FA8
  .rightVelocity: skip 2 ; $0FAA
  .leftSubVelocity: skip 2 ; $0FAC
  .leftVelocity: skip 2 ; $0FAE
  .direction: skip 2 ; $0FB0
  .function: skip 2 ; $0FB2
endstruct

struct MamaTurtle $0FA8
  .function: skip 2 ; $0FA8
skip 6
  .XVelocity: skip 2 ; $0FB0
  .asleepFlag: skip 2 ; $0FB2
skip $7DE84C
  .functionTimer: skip 2 ; $7E7800
  .XSubAcceleration: skip 2 ; $7E7802
  .XAcceleration: skip 2 ; $7E7804
  .XSubVelocity: skip 2 ; $7E7806
  .YVelocity: skip 2 ; $7E7808
skip 4
  .YSubVelocity: skip 2 ; $7E780E
endstruct

struct BabyTurtle $0FA8
  .function: skip 2 ; $0FA8
  .turtleIndex: skip 2 ; $0FAA
  .spawnXPosition: skip 2 ; $0FAC
  .spawnTopBoundary: skip 2 ; $0FAE
  .XVelocity: skip 2 ; $0FB0
skip $7DE856
  .YVelocity skip 2 ; $7E7808
  .notCarryingSamusReactionTimer skip 2 ; $7E780A
endstruct

struct Puyo $0FAA
  .YSpeedTableIndex: skip 2 ; $0FAA
  .hopCooldownTimer: skip 2 ; $0FAC
  .function: skip 2 ; $0FAE
  .airborneFunction: skip 2 ; $0FB0
  .hopTableIndex: skip 2 ; $0FB2
skip $7DE84C
  .hopType: skip 2 ; $7E7800
  .hoppingAnimationFlag: skip 2 ; $7E7802
  .direction: skip 2 ; $7E7804
  .fallingFlag: skip 2 ; $7E7806
  .invertDirectionFlag: skip 2 ; $7E7808
  .invertedDirection: skip 2 ; $7E780A
  .initialYSpeedTableIndex_3_4: skip 2 ; $7E780C
  .initialYSpeedTableIndex_1_2: skip 2 ; $7E780E
endstruct

struct Cacatac $0FA8
  .rightSubVelocity: skip 2 ; $0FA8
  .rightVelocity: skip 2 ; $0FAA
  .leftSubVelocity: skip 2 ; $0FAC
  .leftVelocity: skip 2 ; $0FAE
  .direction: skip 2 ; $0FB0
  .function: skip 2 ; $0FB2
skip $7DE84C
  .minimumXPosition: skip 2 ; $7E7800
  .maximumXPosition: skip 2 ; $7E7802
endstruct

struct Owtch $0FA8
  .rightSubVelocity: skip 2 ; $0FA8
  .rightVelocity: skip 2 ; $0FAA
  .leftSubVelocity: skip 2 ; $0FAC
  .leftVelocity: skip 2 ; $0FAE
  .direction: skip 2 ; $0FB0
  .sinkYOffset: skip 2 ; $0FB2
skip $7DE84C
  .undergroundTimer: skip 2 ; $7E7800
  .minimumXPosition: skip 2 ; $7E7802
  .maximumXPosition: skip 2 ; $7E7804
endstruct

struct ShipTop $0FA8
  .functionTimer: skip 2 ; $0FA8
skip 2
  .hoverIndex: skip 2 ; $0FAC
  .hoverTimer: skip 2 ; $0FAE
  .fixedYPosition: skip 0 ; $0FB0
  .brakesTimer: skip 2 ; $0FB0
  .function: skip 2 ; $0FB2
endstruct

struct ShipBottomEntrance $0FAE
  .hoverSFXTimer: skip 2 ; $0FAE
  .liftoffTimer: skip 2 ; $0FB0
  .YVelocity: skip 2 ; $0FB2
endstruct

struct Flies $0FA8
  .retreatTimer: skip 2 ; $0FA8
  .XVelocity: skip 2 ; $0FAA
  .YVelocity: skip 2 ; $0FAC
  .targetYPosition: skip 2 ; $0FAE
  .angle: skip 2 ; $0FB0
  .function: skip 2 ; $0FB2
endstruct

struct Multiviola $0FAC
  .XVelocity: skip 2 ; $0FAC
  .XSubVelocity: skip 2 ; $0FAE
  .YVelocity: skip 2 ; $0FB0
  .YSubVelocity: skip 2 ; $0FB2
  .angle: skip 2 ; $0FB4
endstruct

struct Polyp $0FA8
  .function: skip 2 ; $0FA8
  .cooldownTimer: skip 2 ; $0FAA
endstruct

struct Rinka $0FA8
  .function: skip 2 ; $0FA8
  .XVelocity: skip 2 ; $0FAA
  .YVelocity: skip 2 ; $0FAC
  .spawnPointAvailabilityTableIndex: skip 2 ; $0FAE
skip 2
  .functionTimer: skip 2 ; $0FB2
endstruct

struct Rio $0FA8
  .backupSwoopXVelocity: skip 2 ; $0FA8
  .function: skip 2 ; $0FAA
  .YVelocity: skip 2 ; $0FAC
  .XVelocity: skip 2 ; $0FAE
  .animationFinishedFlag: skip 2 ; $0FB0
  .instList: skip 2 ; $0FB2
endstruct

struct Squeept $0FAC
  .YVelocity: skip 2 ; $0FAC
  .spawnXPosition: skip 2 ; $0FAE
  .spawnYPosition: skip 2 ; $0FB0
  .function: skip 2 ; $0FB2
skip $7DE84C
  .animationFinishedFlag: skip 2 ; $7E7800
  .instList: skip 2 ; $7E7802
endstruct

struct Geruta $0FA8
  .YVelocity: skip 2 ; $0FA8
  .XVelocity: skip 2 ; $0FAA
skip 6
  .function: skip 2 ; $0FB2
  .part: skip 2 ; $0FB4
skip $7DE84A
  .instList: skip 2 ; $7E7800
  .finishedSwoopStartAnimationFlag: skip 2 ; $7E7802
  .flamesYOffset: skip 2 ; $7E7804
endstruct

struct Holtz $0FAC
  .YVelocity: skip 2 ; $0FAC
  .XVelocity: skip 2 ; $0FAE
skip 2
  .function: skip 2 ; $0FB2
skip $7DE84C
  .instList: skip 2 ; $7E7800
  .animationFinishedFlag: skip 2 ; $7E7802
  .flamesVisibleFlag: skip 2 ; $7E7804
endstruct

struct Oum $0FA8
  .function: skip 2 ; $0FA8
  .YSpeedTableIndex: skip 2 ; $0FAA
  .timeUntilAttackIsAllowed: skip 2 ; $0FAC
  .movementDirection: skip 2 ; $0FAE
  .bounceCounter: skip 2 ; $0FB0
  .bounceFunction: skip 2 ; $0FB2
skip $7DE84C
  .newInstListIndex: skip 2 ; $7E7800
  .instListIndex: skip 2 ; $7E7802
  .animationFinishedFlag: skip 2 ; $7E7804
  .attackAllowingRotationFlag: skip 2 ; $7E7806
  .touchingSamusFlag: skip 2 ; $7E7808
  .directionToSamus: skip 2 ; $7E780A
  .previousXPosition: skip 2 ; $7E780C
skip 2
  .previousYPosition: skip 2 ; $7E7810
skip 4
  .stopFlag: skip 2 ; $7E7816
endstruct

struct Choot $0FA8
  .function: skip 2 ; $0FA8
  .YSpeedTableIndex: skip 2 ; $0FAA
  .fallingPatternIndex: skip 2 ; $0FAC
  .fallingPatternLoopCounter: skip 2 ; $0FAE
  .fallingPatternPointer: skip 2 ; $0FB0
  .fallingPatternYDistance: skip 2 ; $0FB2
skip $7DE84C
  .spawnXPosition: skip 2 ; $7E7800
  .spawnYPosition: skip 2 ; $7E7802
  .initialFallingXPosition: skip 2 ; $7E7804
  .initialFallingYPosition: skip 2 ; $7E7806
  .fallingXOrigin: skip 2 ; $7E7808
  .fallingYOrigin: skip 2 ; $7E780A
  .initialYSpeedTableIndex: skip 2 ; $7E780C
  .jumpDelayTimer: skip 2 ; $7E780E
endstruct

struct GRipper $0FA8
  .minimumXPosition: skip 2 ; $0FA8
  .maximumXPosition: skip 2 ; $0FAA
endstruct

struct Ripper $0FAC
  .XSubVelocity: skip 2 ; $0FAC
  .XVelocity: skip 2 ; $0FAE
  .XSpeedTableIndex: skip 2 ; $0FB0
endstruct

struct Dragon $0FAE
  .functionTimer: skip 0 ; $0FAE
  .attackCounter: skip 2 ; $0FAE
skip 2
  .function: skip 2 ; $0FB2
skip $7DE84C
  .newInstListIndex: skip 2 ; $7E7800
  .instListIndex: skip 2 ; $7E7802
  .animationFinishedFlag: skip 2 ; $7E7804
endstruct

struct ShutterGrowing $0FA8
  .function: skip 2 ; $0FA8
  .growthLevel0YPosition: skip 2 ; $0FAA
  .growthLevel1YPosition: skip 2 ; $0FAC
  .growthLevel2YPosition: skip 2 ; $0FAE
  .growthLevel3YPosition: skip 2 ; $0FB0
  .growthLevel: skip 2 ; $0FB2
skip $7DE84C
  .YSpeed: skip 2 ; $7E7800
  .YSubSpeed: skip 2 ; $7E7802
skip $FFC
  .previousYPosition: skip 2 ; $7E8800
endstruct

struct Shutters $0FA8
  .function: skip 2 ; $0FA8
  .functionTimer: skip 2 ; $0FAA
  .downSubVelocity: skip 2 ; $0FAC
  .downVelocity: skip 2 ; $0FAE
  .upSubVelocity: skip 2 ; $0FB0
  .upVelocity: skip 2 ; $0FB2
skip $7DE84C
  .YSpeedTableIndex: skip 2 ; $7E7800
  .primaryDirection: skip 2 ; $7E7802
  .movedUpRestTimerParam: skip 2 ; $7E7804
  .movedDownRestTimeParam: skip 2 ; $7E7806
  .triggerMode: skip 2 ; $7E7808
  .YDistance: skip 2 ; $7E780A
  .XProximityWaitTime: skip 2 ; $7E780C
  .initialFunctionIndex: skip 2 ; $7E780E
  .movedUpRestTime: skip 2 ; $7E7810
  .movedDownRestTime: skip 2 ; $7E7812
  .movingSamusFlag: skip 2 ; $7E7814
skip 2
  .shotActivatedFlag: skip 2 ; $7E7818
skip 2
  .previousYPosition: skip 2 ; $7E781C
  .minimumYPosition: skip 2 ; $7E781E
  .maximumYPosition: skip 2 ; $7E7820
skip $7DE
  .reactionDirection: skip 2 ; $7E8000
endstruct

struct ShutterHorizShootable $0FA8
  .function: skip 2 ; $0FA8
  .functionTimer: skip 2 ; $0FAA
  .rightSubVelocity: skip 2 ; $0FAC
  .rightVelocity: skip 2 ; $0FAE
  .leftSubVelocity: skip 2 ; $0FB0
  .leftVelocity: skip 2 ; $0FB2
skip $7DE84C
  .YSpeedTableIndex: skip 2 ; $7E7800
  .primaryDirection: skip 2 ; $7E7802
  .movedLeftRestTimerParam: skip 2 ; $7E7804
  .movedRightRestTimeParam: skip 2 ; $7E7806
  .triggerMode: skip 2 ; $7E7808
  .YDistance: skip 2 ; $7E780A
  .XProximityWaitTime: skip 2 ; $7E780C
  .initialFunctionIndex: skip 2 ; $7E780E
  .movedLeftRestTime: skip 2 ; $7E7810
  .movedRightRestTime: skip 2 ; $7E7812
skip 4
  .shotActivatedFlag: skip 2 ; $7E7818
  .previousXPosition: skip 2 ; $7E781A
skip 6
  .minimumXPosition: skip 2 ; $7E7822
  .maximumXPosition: skip 2 ; $7E7824
  .movingSamusFlag: skip 2 ; $7E7826
skip $7D8
  .reactionDirection: skip 2 ; $7E8000
endstruct

struct Waver $0FA8
  .XSubVelocity: skip 2 ; $0FA8
  .XVelocity: skip 2 ; $0FAA
  .instListIndex: skip 2 ; $0FAC
  .angle: skip 2 ; $0FAE
  .spinFinishedFlag: skip 2 ; $0FB0
  .newInstListIndex: skip 2 ; $0FB2
endstruct

struct Metaree $0FA8
  .burrowTimer: skip 2 ; $0FA8
  .function: skip 2 ; $0FAA
  .newInstListIndex: skip 2 ; $0FAC
  .instListIndex: skip 2 ; $0FAE
  .attackReadyFlag: skip 2 ; $0FB0
  .YVelocity: skip 2 ; $0FB2
endstruct

struct Fireflea $0FA8
  .subAngleDelta: skip 2 ; $0FA8
  .angleDelta: skip 2 ; $0FAA
  .radius: skip 2 ; $0FAC
  .angle: skip 2 ; $0FAE
  .XCenter: skip 2 ; $0FB0
  .YCenter: skip 2 ; $0FB2
skip $7DE84C
  .minimumYPosition: skip 2 ; $7E7800
  .maximumYPosition: skip 2 ; $7E7802
  .speedTableIndex: skip 2 ; $7E7804
endstruct

struct Skulltera $0FA8
  .function: skip 2 ; $0FA8
  .rightSubVelocity: skip 2 ; $0FAA
  .rightVelocity: skip 2 ; $0FAC
  .leftSubVelocity: skip 2 ; $0FAE
  .leftVelocity: skip 2 ; $0FB0
  .angle: skip 2 ; $0FB2
skip $7DE84C
  .radius: skip 2 ; $7E7800
  .turnFinishedFlag: skip 2 ; $7E7802
  .angleDelta: skip 2 ; $7E7804
  .previousYOffset: skip 2 ; $7E7806
  .YOffset: skip 2 ; $7E7808
endstruct

struct Elevator $0FA8
  .targetYPosition: skip 2 ; $0FA8
endstruct

struct Crawler $0FA8
  .XVelocity: skip 2 ; $0FA8
  .YVelocity: skip 2 ; $0FAA
skip 6
  .function: skip 2 ; $0FB2
skip $7DE84E
  .fallingYSubVelocity: skip 2 ; $7E7802
  .fallingYVelocity: skip 2 ; $7E7804
  .nonFallingFunction: skip 2 ; $7E7806
  .consecutiveTurnCounter: skip 2 ; $7E7808
endstruct

struct Platform $0FA8
  .targetYPosition: skip 2 ; $0FA8
  .rightSubVelocity: skip 2 ; $0FAA
  .rightVelocity: skip 2 ; $0FAC
  .leftSubVelocity: skip 2 ; $0FAE
  .leftVelocity: skip 2 ; $0FB0
  .YSpeedTableIndex: skip 2 ; $0FB2
skip $7DE84C
  .YMovementFunctionIndex: skip 2 ; $7E7800
  .previousPosition: skip 2 ; $7E7802
  .XMovementFunctionIndex: skip 2 ; $7E7804
  .verticallyMovingFlag: skip 2 ; $7E7806
  .verticallyStillFlag: skip 2 ; $7E7808
  .maximumYSpeedTableIndex: skip 2 ; $7E780A
  .previousYMovementFunctionIndex: skip 2 ; $7E780C
skip $30
  .suspensorPlatformFlag: skip 2 ; $7E783E
endstruct

struct Sbug $0FA8
  .straightMovementTimer: skip 2 ; $0FA8
  .function: skip 2 ; $0FAA
  .customAngle: skip 2 ; $0FAC
skip 4
  .movementTimer: skip 2 ; $0FB2
skip $7DE84C
  .movingForwardXSubSpeed: skip 2 ; $7E7800
  .movingForwardXSpeed: skip 2 ; $7E7802
  .movingForwardYSubSpeed: skip 2 ; $7E7804
  .movingForwardYSpeed: skip 2 ; $7E7806
  .movingLeftXSubVelocity: skip 2 ; $7E7808
  .movingLeftXVelocity: skip 2 ; $7E780A
  .movingLeftYSubVelocity: skip 2 ; $7E780C
  .movingLeftYVelocity: skip 2 ; $7E780E
  .movingRightXSubVelocity: skip 2 ; $7E7810
  .movingRightXVelocity: skip 2 ; $7E7812
  .movingRightYSubVelocity: skip 2 ; $7E7814
  .movingRightYVelocity: skip 2 ; $7E7816
  .customXSubVelocity: skip 2 ; $7E7818
  .customXVelocity: skip 2 ; $7E781A
  .customYSubVelocity: skip 2 ; $7E781C
  .customYVelocity: skip 2 ; $7E781E
skip $7E0
  .movingForwardInstListIndex: skip 2 ; $7E8000
  .movingLeftInstListIndex: skip 2 ; $7E8002
  .movingRightInstListIndex: skip 2 ; $7E8004
  .customInstListIndex: skip 2 ; $7E8006
  .newInstList: skip 2 ; $7E8008
  .instList: skip 2 ; $7E800A
endstruct

struct Mochtroid $0FA8
  .XSubVelocity: skip 2 ; $0FA8
  .XVelocity: skip 2 ; $0FAA
  .YSubVelocity: skip 2 ; $0FAC
  .YVelocity: skip 2 ; $0FAE
  .shakeTimer: skip 2 ; $0FB0
  .functionIndex: skip 2 ; $0FB2
skip $7DE84E
  .movingForwardXSpeed: skip 2 ; $7E7802
skip $7FC
  .damageTimer: skip 2 ; $7E8000
endstruct

struct Hopper $0FAA
  .function: skip 2 ; $0FAA
  .YSpeedTableIndex: skip 2 ; $0FAC
  .XVelocity: skip 2 ; $0FAE
  .XSpeedTableIndexDelta: skip 2 ; $0FB0
skip $7DE84E
  .instList: skip 2 ; $7E7800
  .smallHopInitialYSpeedTableIndex: skip 2 ; $7E7802
  .bigHopInitialYSpeedTableIndex: skip 2 ; $7E7804
  .fallingFlag: skip 2 ; $7E7806
  .readyToHopFlag: skip 2 ; $7E7808
  .hopTableIndex: skip 2 ; $7E780A
  .variantIndex: skip 2 ; $7E780C
endstruct

struct Zoa $0FAA
  .spawnXPosition: skip 2 ; $0FAA
  .spawnYPosition: skip 2 ; $0FAC
  .instListTableIndex: skip 2 ; $0FAE
  .previousInstListTableIndex: skip 2 ; $0FB0
skip 2
  .function: skip 2 ; $0FB4
skip $7DE84A
  .XSpeedTableIndex: skip 2 ; $7E7800
endstruct

struct Bang $0FAA
  .idlePaletteIndex: skip 2 ; $0FAA
skip 4
  .damage: skip 2 ; $0FB0
  .movementFunction: skip 2 ; $0FB2
skip $7DE84C
  .movementDelayTimer: skip 2 ; $7E7800
  .angle: skip 2 ; $7E7802
  .angleToSamus: skip 2 ; $7E7804
skip 8
  .movingLeftFlag: skip 2 ; $7E780E
  .movingUpFlag: skip 2 ; $7E7810
  .acceleration: skip 2 ; $7E7812
  .speed: skip 2 ; $7E7814
  .maxSpeed: skip 2 ; $7E7816
  .accelerationIntervalTimer: skip 2 ; $7E7818
  .accelerationIntervalTimerResetValue: skip 2 ; $7E781A
  .decelerationIntervalTimerResetValue: skip 2 ; $7E781C
skip $7E2
  .newInstListIndex: skip 2 ; $7E8000
  .instListIndex: skip 2 ; $7E8002
  .finishedGrowingFlag: skip 2 ; $7E8004
endstruct

struct Skree $0FA8
  .burrowTimer: skip 2 ; $0FA8
  .function: skip 2 ; $0FAA
  .newInstListIndex: skip 2 ; $0FAC
  .instListIndex: skip 2 ; $0FAE
  .attackReadyFlag: skip 2 ; $0FB0
  .YVelocity: skip 2 ; $0FB2
endstruct

struct Yard $0FA8
  .crawlingXVelocity: skip 2 ; $0FA8
  .crawlingYVelocity: skip 2 ; $0FAA
  .airborneFacingDirection: skip 2 ; $0FAC
  .hidingInstList: skip 2 ; $0FAE
  .consequtiveTurnCounter: skip 2 ; $0FB0
  .movementFunction: skip 2 ; $0FB2
  .crawlingSpeedTableIndex: skip 2 ; $0FB4
skip $7DE84A
  .airborneYSubVelocity: skip 2 ; $7E7800
  .airborneYVelocity: skip 2 ; $7E7802
  .airborneXSubVelocity: skip 2 ; $7E7804
  .airborneXVelocity: skip 2 ; $7E7806
  .turnTransitionDisableCounter: skip 2 ; $7E7808
  .turnTransitionDisableFlag: skip 2 ; $7E780A
  .idleCrawlingSpeedTableIndex: skip 2 ; $7E780C
  .direction: skip 2 ; $7E780E
  .behavior: skip 2 ; $7E7810
endstruct

struct Reflect $0FB6
  .reflectionAxis: skip 2 ; $0FB6
endstruct

struct Metroid $0FA8
  .XSubVelocity: skip 2 ; $0FA8
  .XVelocity: skip 2 ; $0FAA
  .YSubVelocity: skip 2 ; $0FAC
  .YVelocity: skip 2 ; $0FAE
  .bombedOffSamusCooldownTimer: skip 2 ; $0FB0
  .functionIndex: skip 2 ; $0FB2
skip 2
  .freezeHealthThreshold: skip 2 ; $0FB6
skip $7DE848
  .electricitySpriteObjectIndex: skip 2 ; $7E7800
  .shellSpriteObjectIndex: skip 2 ; $7E7802
  .SamusSubEnergy: skip 2 ; $7E7804
endstruct

struct Crocomire $0FA8
  .deathSequenceIndex: skip 2 ; $0FA8
  .fightFlags: skip 2 ; $0FAA
  .fightFunctionIndex: skip 2 ; $0FAC
  .timer: skip 0 ; $0FAE
  .stepCounter: skip 0 ; $0FAE
  .rumbleIndex: skip 0 ; $0FAE
  .YAcceleration: skip 2 ; $0FAE
  .YVelocity: skip 2 ; $0FB0
  .projectileCounter: skip 2 ; $0FB2
skip $3A
  .rumblingYOffset: skip 2 ; $0FEE
skip $3E
  .timer102E: skip 2 ; $102E
skip $3E
  .rumblingYOffsetDelta: skip 2 ; $106E
skip $7DE7CE
  .meltingHDMAObjectIndex: skip 2 ; $7E783E
; see also "CrocomireDeathSequence"
endstruct

struct CrocomireTongue $0FA8
  .XOffsetFromCrocomire: skip 2 ; $0FA8
endstruct

struct DraygonBody $0FA8
  .function: skip 2 ; $0FA8
  .functionTimer: skip 0 ; $0FAA
  .swoopYPositionIndex: skip 2 ; $0FAA
  .swoopDuration: skip 2 ; $0FAC
  .XSpeed: skip 2 ; $0FAE
  .XSubSpeed: skip 2 ; $0FB0
skip $7DE84E
  .leftSideResetXPosition: skip 2 ; $7E7800
  .resetYPosition: skip 2 ; $7E7802
  .rightSideResetXPosition: skip 2 ; $7E7804
  .goopCounter: skip 2 ; $7E7806
skip 2
  .spiralXRadius: skip 2 ; $7E780A
  .spiralXPosition: skip 2 ; $7E780C
  .spiralYPosition: skip 2 ; $7E780E
  .spiralAngle: skip 2 ; $7E7810
  .spiralXSubRadius: skip 2 ; $7E7812
  .spiralYSubPosition: skip 2 ; $7E7814
  .spiralAngleDelta: skip 2 ; $7E7816
  .tailWhipTimer: skip 2 ; $7E7818
  .goopYOscillationAngle: skip 2 ; $7E781A
  .healthBasedPaletteTableIndex: skip 2 ; $7E781C
  .swoopYAcceleration: skip 2 ; $7E781E
skip $7E0
  .facingDirection: skip 2 ; $7E8000
skip $80A
  .fightIntroDanceIndex: skip 2 ; $7E880C
skip $2E
  .bodyGraphicsXDisplacement: skip 2 ; $7E883C
  .bodyGraphicsYDisplacement: skip 2 ; $7E883E
endstruct

struct DraygonEye $0FE8
  .function: skip 2 ; $0FE8
skip 8
  .angleToSamus: skip 2 ; $0FF2
endstruct

struct SporeSpawn $0FA8
  .function: skip 2 ; $0FA8
skip 2
  .XOrigin: skip 2 ; $0FAC
  .YOrigin: skip 2 ; $0FAE
skip $7DE858
  .stalkXOrigin: skip 2 ; $7E7808
  .stalkYOrigin: skip 2 ; $7E780A
skip 8
  .angle: skip 2 ; $7E7814
  .maxXRadius: skip 2 ; $7E7816
  .angleDelta: skip 2 ; $7E7818
skip $7E6
  .stalkSegment2XPosition: skip 2 ; $7E8000
  .stalkSegment1XPosition: skip 2 ; $7E8002
  .stalkSegment0XPosition: skip 2 ; $7E8004
  .stalkSegment2YPosition: skip 2 ; $7E8006
  .stalkSegment1YPosition: skip 2 ; $7E8008
  .stalkSegment0YPosition: skip 2 ; $7E800A
skip 6
  .deathDriftXSpeed: skip 2 ; $7E8012
  .deathDriftYSpeed: skip 2 ; $7E8014
skip 8
  .damagedFlag: skip 2 ; $7E801E
skip $7E0
  .previousHealth: skip 2 ; $7E8800
skip 4
  .deathDriftAngle: skip 2 ; $7E8806
skip $7F8
  .sporeGenerationFlag: skip 2 ; $7E9000
endstruct

struct Boulder $0FA8
  .function: skip 2 ; $0FA8
  .XSpeedTableIndex: skip 2 ; $0FAA
  .YSpeedTableIndex: skip 2 ; $0FAC
  .bounceIndex: skip 2 ; $0FAE
  .direction: skip 2 ; $0FB0
skip $7DE84E
  .XProximity: skip 2 ; $7E7800
  .minimumDistanceFromGround: skip 2 ; $7E7802
  .previousEnemyYSubPosition: skip 2 ; $7E7804
  .previousEnemyYPosition: skip 2 ; $7E7806
  .spawnXPosition: skip 2 ; $7E7808
  .fallingTargetYPosition: skip 2 ; $7E780A
  .YProximity: skip 2 ; $7E780C
  .type: skip 2 ; $7E780E
endstruct

struct KzanTop $0FA8
  .function: skip 2 ; $0FA8
  .fallWaitTimer: skip 2 ; $0FAA
  .risingTargetYPosition: skip 2 ; $0FAC
  .fallingTargetYPosition: skip 2 ; $0FAE
  .initialFallingYSubSpeed: skip 2 ; $0FB0
  .initialFallingYSpeed: skip 2 ; $0FB2
skip $7DE84C
  .fallWaitTimerResetValue: skip 2 ; $7E7800
  .previousYPosition: skip 2 ; $7E7802
  .fallingYSpeedTableIndex: skip 2 ; $7E7804
  .riseWaitTimer: skip 2 ; $7E7806
endstruct

struct Hibashi $0FA8
  .function: skip 2 ; $0FA8
  .inactiveTimer: skip 2 ; $0FAA
  .finishedActivityFlag: skip 2 ; $0FAC
  .spawnYPosition: skip 2 ; $0FAE
skip 4
  .inactiveTimerResetValue: skip 2 ; $0FB4
  .part: skip 2 ; $0FB6
endstruct

struct Puromi $0FA8
  .function: skip 2 ; $0FA8
  .inactiveTimer: skip 2 ; $0FAA
  .speedTableIndex: skip 2 ; $0FAC
  .arcRadius: skip 2 ; $0FAE
  .direction: skip 2 ; $0FB0
  .inactiveTimerResetValue: skip 2 ; $0FB2
skip $7DE84C
  .projectileIndex0: skip 2 ; $7E7800
  .projectileIndex1: skip 2 ; $7E7802
  .projectileIndex2: skip 2 ; $7E7804
  .projectileIndex3: skip 2 ; $7E7806
  .projectileIndex4: skip 2 ; $7E7808
skip 6
  .projectile0ExplosionReason: skip 2 ; $7E7810
  .projectile1ExplosionReason: skip 2 ; $7E7812
  .projectile2ExplosionReason: skip 2 ; $7E7814
  .projectile3ExplosionReason: skip 2 ; $7E7816
  .projectile4ExplosionReason: skip 2 ; $7E7818
skip 6
  .spriteObjectIndex0: skip 2 ; $7E7820
  .spriteObjectIndex1: skip 2 ; $7E7822
  .spriteObjectIndex2: skip 2 ; $7E7824
  .spriteObjectIndex3: skip 2 ; $7E7826
skip 8
  .spriteObject0ExplosionReason: skip 2 ; $7E7830
  .spriteObject1ExplosionReason: skip 2 ; $7E7832
  .spriteObject2ExplosionReason: skip 2 ; $7E7834
  .spriteObject3ExplosionReason: skip 2 ; $7E7836
skip $7CA
  .subAngle: skip 2 ; $7E8000
  .angle: skip 2 ; $7E8002
  .startAngle: skip 2 ; $7E8006
  .subAngleDelta: skip 2 ; $7E8008
  .angleDelta: skip 2 ; $7E800A
  .arcOriginXPosition: skip 2 ; $7E800C
  .arcOriginYPosition: skip 2 ; $7E800E
  .bodyPartSpawnXPosition: skip 2 ; $7E8010
  .bodyPartSpawnYPosition: skip 2 ; $7E8012
  .bodyIndex: skip 2 ; $7E8014
  .angleBetweenBodyPartsTimes2: skip 2 ; $7E8016
  .angleBetweenBodyParts: skip 2 ; $7E8018
skip 2
  .finishAngle: skip 2 ; $7E801C
  .fallingExplosionAngle: skip 2 ; $7E801E
  .risingExplosionAngle: skip 2 ; $7E8020
skip 4
  .headExplosionReason: skip 2 ; $7E8026
  .graphicsIndices: skip 2 ; $7E8028
endstruct

struct MiniKraid $0FAA
  .XVelocity: skip 2 ; $0FAA
  .direction: skip 2 ; $0FAC
  .stepCounter: skip 2 ; $0FAE
  .spitTimer: skip 2 ; $0FB0
skip $7DE84E
  .spitXVelocity: skip 2 ; $7E7800
  .spitYVelocity: skip 2 ; $7E7802
  .spitXOffset: skip 2 ; $7E7804
  .topSpikeTimer: skip 2 ; $7E7806
  .middleSpikeTimer: skip 2 ; $7E7808
  .bottomSpikeTimer: skip 2 ; $7E780A
  .spikeIndex: skip 2 ; $7E780C
  .spikeTimerIndex: skip 2 ; $7E780E
endstruct

struct RidleyCeres $0FAA
  .XSpeed: skip 2 ; $0FAA
  .YSpeed: skip 2 ; $0FAC
skip $7D9052
  .liftoffFlag: skip 2 ; $7E2000
  .tailFlingSyncFlag: skip 2 ; $7E2002
  .tailFlingTrigger: skip 2 ; $7E2004
skip 6
  .unknown200C: skip 2 ; $7E200C
  .YAcceleration: skip 2 ; $7E200E
skip 14
  .tailSwingDelay: skip 2 ; $7E201E
skip $57E0
  .counter: skip 0 ; $7E7800
  .timer: skip 2 ; $7E7800
  .status: skip 2 ; $7E7802
  .activeFlag: skip 2 ; $7E7804
  .BabyMetroidInstList: skip 2 ; $7E7806
  .unknownCounter7808: skip 2 ; $7E7808
  .ribsAnimationIndex: skip 2 ; $7E780A
  .ribsAnimationTimer: skip 2 ; $7E780C
  .wingFlapAnimationFrame: skip 2 ; $7E780E
  .unknown7810: skip 2 ; $7E7810
  .unknown7812: skip 2 ; $7E7812
skip 2
  .USwoopSpeed: skip 2 ; $7E7816
  .paletteIndex: skip 2 ; $7E7818
  .hitCounter: skip 2 ; $7E781A
  .maxTailSpeedCounter: skip 2 ; $7E781C
  .roarSFXFlag: skip 2 ; $7E781E
  .facingDirection: skip 2 ; $7E7820
skip 2
  .speedup: skip 2 ; $7E7824
skip 2
  .XDisplacementWhileHoldingSamus: skip 2 ; $7E7828
  .YDisplacementWhileHoldingSamus: skip 2 ; $7E782A
skip 2
  .targetXPositionWhileHOldingSamus: skip 2 ; $7E782E
  .targetYPositionWhileHOldingSamus: skip 2 ; $7E7830
skip 4
  .holdingInClawsFlag: skip 2 ; $7E7836
  .contactDamage: skip 2 ; $7E7838
  .index: skip 2 ; $7E783A
  .grabCooldownTimer: skip 2 ; $7E783C
skip $7C2
  .topBoundary: skip 2 ; $7E8000
  .bottomBoundary: skip 2 ; $7E8002
  .leftBoundary: skip 2 ; $7E8004
  .rightBoundary: skip 2 ; $7E8006
  .relatedToHurtAI: skip 2 ; $7E8008
skip 2
  .tailBounceCounter: skip 2 ; $7E800C
  .deathExplosionTimer: skip 2 ; $7E800E
  .deathExplosionCounter: skip 2 ; $7E8010
skip 14
  .tablePointer: skip 2 ; $7E8020
skip 2
  .getawayCompletedFlag: skip 2 ; $7E8024
  .getawayFlightDataIndex: skip 2 ; $7E8026
  .getawayXVelocity: skip 2 ; $7E8028
  .getawayYVelocity: skip 2 ; $7E802A
  .BabyMetroidAnimationIndex: skip 2 ; $7E802C
  .wingANimationIndex: skip 2 ; $7E802E
  .paletteTableIndex: skip 2 ; $7E8030
  .unused7E8032: skip 2 ; $7E8032
  .typewriterTileToBeWrittenToTilemap: skip 2 ; $7E8034
skip 2
  .typewriterVRAMTilemapAddr: skip 2 ; $7E8038
  .typewriterInstructionTimer: skip 2 ; $7E803A
  .typewriterInstructionTimerResetValue: skip 2 ; $7E803C
  .typewriterStrokeTimer: skip 2 ; $7E803E
skip $7C0
  .BabyMetroidFunction: skip 2 ; $7E8800
skip 2
  .BabyMetroidXPosition: skip 2 ; $7E8804
skip 2
  .BabyMetroidYPosition: skip 2 ; $7E8808
  .neverRead880A: skip 2 ; $7E880A
  .BabyMetroidCrySFXFlag: skip 2 ; $7E880C
endstruct

struct Ridley $0FAA
  .XSpeed: skip 2 ; $0FAA
  .YSpeed: skip 2 ; $0FAC
skip $7D9052
  .tailAIIndex: skip 2 ; $7E2000
  .tailRotationSpeed: skip 2 ; $7E2002
  .tailFlingTrigger: skip 2 ; $7E2004
skip 4
  .tailHalfRevolutions: skip 2 ; $7E200A
skip 4
  .tailMovementTimer: skip 2 ; $7E2010
  .tailExtensionSpeed: skip 2 ; $7E2012
  .tailAngularSpeed: skip 2 ; $7E2014
  .tailMinimumAngle: skip 2 ; $7E2016
  .tailMaximumAngle: skip 2 ; $7E2018
  .optionalClockwiseTarget: skip 2 ; $7E201A
  .optionalCounterClockwiseTarget: skip 2 ; $7E201C
  .movementThreshold: skip 2 ; $7E201E
  .tail1MovingRotatingFlag: skip 2 ; $7E2020
  .tail1RotationDelayTimer: skip 2 ; $7E2022
  .tail1RotationDirection: skip 2 ; $7E2024
  .tail1DistanceToRidley: skip 2 ; $7E2026
  .tail1TargetDistanceToRidley: skip 2 ; $7E2028
  .tail1Angle: skip 2 ; $7E202A
  .tail1XPosition: skip 2 ; $7E202C
  .tail1YPosition: skip 2 ; $7E202E
  .tail1XDistanceFromRidley: skip 2 ; $7E2030
  .tail1YDistanceFromRidley: skip 2 ; $7E2032
  .tail2MovingRotatingFlag: skip 2 ; $7E2034
  .tail2RotationDelayTimer: skip 2 ; $7E2036
  .tail2RotationDirection: skip 2 ; $7E2038
  .tail2DistanceToRidley: skip 2 ; $7E203A
  .tail2TargetDistanceToRidley: skip 2 ; $7E203C
  .tail2Angle: skip 2 ; $7E203E
  .tail2XPosition: skip 2 ; $7E2040
  .tail2YPosition: skip 2 ; $7E2042
  .tail2XDistanceFromTail1: skip 2 ; $7E2044
  .tail2YDistanceFromTail1: skip 2 ; $7E2046
  .tail3MovingRotatingFlag: skip 2 ; $7E2048
  .tail3RotationDelayTimer: skip 2 ; $7E204A
  .tail3RotationDirection: skip 2 ; $7E204C
  .tail3DistanceToRidley: skip 2 ; $7E204E
  .tail3TargetDistanceToRidley: skip 2 ; $7E2050
  .tail3Angle: skip 2 ; $7E2052
  .tail3XPosition: skip 2 ; $7E2054
  .tail3YPosition: skip 2 ; $7E2056
  .tail3XDistanceFromTail2: skip 2 ; $7E2058
  .tail3YDistanceFromTail2: skip 2 ; $7E205A
  .tail4MovingRotatingFlag: skip 2 ; $7E205C
  .tail4RotationDelayTimer: skip 2 ; $7E205E
  .tail4RotationDirection: skip 2 ; $7E2060
  .tail4DistanceToRidley: skip 2 ; $7E2062
  .tail4TargetDistanceToRidley: skip 2 ; $7E2064
  .tail4Angle: skip 2 ; $7E2066
  .tail4XPosition: skip 2 ; $7E2068
  .tail4YPosition: skip 2 ; $7E206A
  .tail4XDistanceFromTail3: skip 2 ; $7E206C
  .tail4YDistanceFromTail3: skip 2 ; $7E206E
  .tail5MovingRotatingFlag: skip 2 ; $7E2070
  .tail5RotationDelayTimer: skip 2 ; $7E2072
  .tail5RotationDirection: skip 2 ; $7E2074
  .tail5DistanceToRidley: skip 2 ; $7E2076
  .tail5TargetDistanceToRidley: skip 2 ; $7E2078
  .tail5Angle: skip 2 ; $7E207A
  .tail5XPosition: skip 2 ; $7E207C
  .tail5YPosition: skip 2 ; $7E207E
  .tail5XDistanceFromTail4: skip 2 ; $7E2080
  .tail5YDistanceFromTail4: skip 2 ; $7E2082
  .tail6MovingRotatingFlag: skip 2 ; $7E2084
  .tail6RotationDelayTimer: skip 2 ; $7E2086
  .tail6RotationDirection: skip 2 ; $7E2088
  .tail6DistanceToRidley: skip 2 ; $7E208A
  .tail6TargetDistanceToRidley: skip 2 ; $7E208C
  .tail6Angle: skip 2 ; $7E208E
  .tail6XPosition: skip 2 ; $7E2090
  .tail6YPosition: skip 2 ; $7E2092
  .tail6XDistanceFromTail5: skip 2 ; $7E2094
  .tail6YDistanceFromTail5: skip 2 ; $7E2096
  .tailTipMovingRotatingFlag: skip 2 ; $7E2098
  .tailTipRotationDelayTimer: skip 2 ; $7E209A
  .tailTipRotationDirection: skip 2 ; $7E209C
  .tailTipDistanceToRidley: skip 2 ; $7E209E
  .tailTipTargetDistanceToRidley: skip 2 ; $7E20A0
  .tailTipAngle: skip 2 ; $7E20A2
  .tailTipXPosition: skip 2 ; $7E20A4
  .tailTipYPosition: skip 2 ; $7E20A6
  .tailTipXDistanceFromTail6: skip 2 ; $7E20A8
  .tailTipYDistanceFromTail6: skip 2 ; $7E20AA
skip $5754
  .timer: skip 2 ; $7E7800
  .status: skip 2 ; $7E7802
  .activeFlag: skip 2 ; $7E7804
skip 4
  .ribsAnimationIndex: skip 2 ; $7E780A
  .ribsAnimationTimer: skip 2 ; $7E780C
  .wingFlapFrame: skip 2 ; $7E780E
  .wingFlapSpeed: skip 2 ; $7E7810
  .wingFlapCounter: skip 2 ; $7E7812
  .currentAngleOfMotion: skip 2 ; $7E7814
  .USwoopSpeed: skip 2 ; $7E7816
  .wingTailPalette: skip 2 ; $7E7818
skip 2
  .maxTailSpeedCounter: skip 2 ; $7E781C
  .roarSFXFlag: skip 2 ; $7E781E
  .facingDirection: skip 2 ; $7E7820
skip 2
  .speed: skip 2 ; $7E7824
skip 8
  .targetXLocationWhenHoldingSamus: skip 2 ; $7E782E
  .targetYLocationWhenHoldingSamus: skip 2 ; $7E7830
  .fireballXComponentOfSpeed: skip 2 ; $7E7832
  .fireballYComponentOfSpeed: skip 2 ; $7E7834
  .holdingSamusFlag: skip 2 ; $7E7836
  .tailTipDamage: skip 2 ; $7E7838
  .YDisplacementTableIndex: skip 2 ; $7E783A
  .grabCooldownTimer: skip 2 ; $7E783C
  .collisionDirection: skip 2 ; $7E783E
skip $7C0
  .topBoundary: skip 2 ; $7E8000
  .bottomBoundary: skip 2 ; $7E8002
  .leftBoundary: skip 2 ; $7E8004
  .rightBoundary: skip 2 ; $7E8006
  .unknown8008: skip 2 ; $7E8008
  .finalGrabAttemptCounter: skip 2 ; $7E800A
  .tailBounceCounter: skip 2 ; $7E800C
  .deathExplosionTimer: skip 2 ; $7E800E
  .deathExplosionIndex: skip 2 ; $7E8010
endstruct

struct RidleyExplosion $0FAA
  .XVelocity: skip 2 ; $0FAA
  .YVelocity: skip 2 ; $0FAC
skip 4
  .lifeTimer: skip 2 ; $0FB2
endstruct

struct Steam $0FA8
  .function: skip 2 ; $0FA8
skip 4
  .activationTimer: skip 2 ; $0FAE
endstruct

struct CeresDoor $0FA8
  .function: skip 2 ; $0FA8
  .drawnByRidleyFlag: skip 2 ; $0FAA
skip 2
  .rumblingTimer: skip 2 ; $0FAE
  .CeresDoorRumbleTimer: skip 2 ; $0FB0
  .CeresDoorRumbleIndex: skip 2 ; $0FB2
endstruct

struct Zebetite $0FA8
  .function: skip 2 ; $0FA8
skip 4
  .destroyedCounter: skip 2 ; $0FAE
skip 2
  .multiPartFlag: skip 2 ; $0FB2
  .otherPartEnemyIndex: skip 2 ; $0FB6
endstruct

struct Kraid $0FA8
  .function: skip 2 ; $0FA8
  .instListPointer: skip 2 ; $0FAA
  .instructionTimer: skip 2 ; $0FAC
skip 4
  .functionTimer: skip 2 ; $0FB2
skip 2
  .ceilingBreakIndex: skip 2 ; $0FB6
skip $7DE84C
  .nextFunction: skip 2 ; $7E7800
skip 4
  .thinkingTimer: skip 2 ; $7E7806
  .minimumSamusEjectionYPosition: skip 2 ; $7E7808
  .mouthReopenFlags: skip 1 ; $7E780A
  .mouthReopenCounter: skip 1 ; $7E780B
  .maxHealth_1_8: skip 2 ; $7E780C
  .maxHealth_2_8: skip 2 ; $7E780E
  .maxHealth_3_8: skip 2 ; $7E7810
  .maxHealth_4_8: skip 2 ; $7E7812
  .maxHealth_5_8: skip 2 ; $7E7814
  .maxHealth_6_8: skip 2 ; $7E7816
  .maxHealth_7_8: skip 2 ; $7E7818
  .maxHealth_8_8: skip 2 ; $7E781A
skip 2
  .targetXPosition: skip 2 ; $7E781E
  .maxHealth_1_4: skip 2 ; $7E7820
  .maxHealth_2_4: skip 2 ; $7E7822
  .maxHealth_3_4: skip 2 ; $7E7824
  .maxHealth_4_4: skip 2 ; $7E7826
skip 2
  .hurtFrame: skip 2 ; $7E782A
  .hurtFrameTimer: skip 2 ; $7E782C
endstruct

struct KraidPart $0FA8
  .function: skip 2 ; $0FA8
  .spawningXSpeed: skip 2 ; $0FAA
  .XAdditionalSpawningVelocity: skip 2 ; $0FAC
skip 4
  .functionTimer: skip 2 ; $0FB2
skip $7DE84C
  .nextFunction: skip 2 ; $7E7800
endstruct

struct KraidNail $0FA8
  .function: skip 2 ; $0FA8
  .XSubVelocity: skip 2 ; $0FAA
  .XVelocity: skip 2 ; $0FAC
  .YSubVelocity: skip 2 ; $0FAE
  .YVelocity: skip 2 ; $0FB0
  .functionTimer: skip 2 ; $0FB2
skip $7DE84C
  .nextFunction: skip 0 ; $7E7800
skip 12
  .orientation: skip 2 ; $7E780E
endstruct

struct PhantoonBody $0FA8
  .flameCounter: skip 0 ; $0FA8
  .movementIndex: skip 0 ; $0FA8
  .explosionLoopCounter: skip 2 ; $0FA8
  .startingFlamesActivationFlag: skip 0 ; $0FAA
  .subSpeed: skip 2 ; $0FAA
  .speed: skip 2 ; $0FAC
  .movementFlags: skip 2 ; $0FAE
  .functionTimer: skip 2 ; $0FB0
  .function: skip 2 ; $0FB2
skip 2
  .flameRainTriggeredFlag: skip 2 ; $0FB6
  .eyeTimer: skip 2 ; $0FB8
skip $32
  .reversedMovementFlag: skip 0 ; $0FEC
  .fadeCounter: skip 0 ; $0FEC
  .mosaicOptions: skip 2 ; $0FEC
  .paletteChangeDenominator: skip 2 ; $0FEE
  .paletteChangeNumerator: skip 2 ; $0FF0
  .fadeCompleteFlag: skip 0 ; $0FF2
  .rageRoundCounter: skip 2 ; $0FF2
  .wavyPhantoonMode: skip 2 ; $0FF4
skip $32
  .swoopingTriggeredFlag: skip 2 ; $1028
  .roundDamage: skip 2 ; $102A
  .swoopingXVelocity: skip 2 ; $102C
  .swoopingYVelocity: skip 2 ; $102E
  .swoopingTargetXPosition: skip 2 ; $1030
  .explosionIndex: skip 2 ; $1032
  .nextWavyPhantoonMode: skip 2 ; $1034
skip 1
  .hurtFlashPaletteLoadedFlag: skip 2 ; $1037
skip $2F
  .casualFlamePattern: skip 2 ; $1068
  .casualFlameTimer: skip 2 ; $106A
  .casualFlamePatternIndex: skip 2 ; $106C
  .wavyPhantoonPhaseAmplitude: skip 2 ; $106E
  .wavyPhantoonPhaseDeltaDirection: skip 2 ; $1070
  .wavyPhantoonPhaseDelta: skip 2 ; $1072
  .semiTransparencyHDMAObjectControl: skip 2 ; $1074
endstruct

struct Etecoon $0FA8
  .XVelocity: skip 2 ; $0FA8
  .XSubVelocity: skip 2 ; $0FAA
  .YVelocity: skip 2 ; $0FAC
  .YSubVelocity: skip 2 ; $0FAE
  .functionTimer: skip 2 ; $0FB0
  .function: skip 2 ; $0FB2
  .direction: skip 1 ; $0FB4
  .hopCounter: skip 1 ; $0FB5
  .ID: skip 1 ; $0FB6
  .freezeTimer: skip 1 ; $0FB7
endstruct

struct Dachora $0FA8
  .speed: skip 0 ; $0FA8
  .functionTimer: skip 0 ; $0FA8
  .positionUpdateTimer: skip 2 ; $0FA8
  .subSpeed: skip 2 ; $0FAA
  .YAcceleration: skip 2 ; $0FAC
  .YSubAcceleration: skip 0 ; $0FAE
  .visibilityTimer: skip 2 ; $0FAE
  .paletteAnimationTimer: skip 1 ; $0FB0
  .paletteAnimationIndex: skip 1 ; $0FB1
  .function: skip 2 ; $0FB2
  .direction: skip 2 ; $0FB4
endstruct

struct Evir $0FAA
  .facingDirection: skip 2 ; $0FAA
  .function: skip 2 ; $0FAC
skip 2
  .movementTimer: skip 2 ; $0FB0
  .regenerationXOffset: skip 2 ; $0FB2
skip $7DE84C
  .movementDirection: skip 2 ; $7E7800
  .instList: skip 2 ; $7E7802
  .newInstList: skip 2 ; $7E7804
  .downSubVelocity: skip 2 ; $7E7806
  .downVelocity: skip 2 ; $7E7808
  .upSubVelocity: skip 2 ; $7E780A
  .upVelocity: skip 2 ; $7E780C
  .XVelocity: skip 2 ; $7E780E
  .XSubVelocity: skip 2 ; $7E7810
  .YVelocity: skip 2 ; $7E7812
  .YSubVelocity: skip 2 ; $7E7814
  .movingFlag: skip 2 ; $7E7816
  .regenerationFlag: skip 2 ; $7E7818
endstruct

struct Eye $0FAC
  .activatedFlag: skip 2 ; $0FAC
  .angle: skip 2 ; $0FAE
  .functionTimer: skip 2 ; $0FB0
  .function: skip 2 ; $0FB2
endstruct

struct FuneNamihe $0FA8
  .instListPointersPointer: skip 2 ; $0FA8
  .function: skip 2 ; $0FAA
  .YProximity: skip 2 ; $0FAC
  .variantIndex: skip 2 ; $0FAE
  .cooldownTimer: skip 2 ; $0FB0
  .cooldownTime: skip 2 ; $0FB2
endstruct

struct Coven $0FA8
  .function: skip 2 ; $0FA8
  .functionTimer: skip 2 ; $0FAA
  .paletteTransitionDelayIndex: skip 2 ; $0FAC
skip $7DE852
  .hoverCenterYPosition: skip 2 ; $7E7800
  .YSubVelocity: skip 2 ; $7E7802
  .YVelocity: skip 2 ; $7E7804
skip 4
  .previousSamusXMovementDirection: skip 2 ; $7E780A
  .previousSamusXPosition: skip 2 ; $7E780C
  .zoneLeftPosition: skip 2 ; $7E780E
  .zoneRightPosition: skip 2 ; $7E7810
  .previousSamusYMovementDirection: skip 2 ; $7E7812
  .previousSamusYPosition: skip 2 ; $7E7814
  .zoneTopPosition: skip 2 ; $7E7816
  .zoneBottomPosition: skip 2 ; $7E7818
  .lockOnTimer: skip 2 ; $7E781A
  .directedMovementTimer: skip 2 ; $7E781C
endstruct

struct YappingMaw $0FA8
  .function: skip 2 ; $0FA8
  .angle: skip 2 ; $0FAA
  .subAngle: skip 2 ; $0FAC
  .angularSpeedTableIndex: skip 2 ; $0FAE
skip 2
  .proximity: skip 2 ; $0FB2
skip $7DE84C
  .bodySegment1XOffset: skip 2 ; $7E7800
  .bodySegment1YOffset: skip 2 ; $7E7802
  .bodySegment2XOffset: skip 2 ; $7E7804
  .bodySegment2YOffset: skip 2 ; $7E7806
  .bodySegment3XOffset: skip 2 ; $7E7808
  .bodySegment3YOffset: skip 2 ; $7E780A
  .headSegmentXOffset: skip 2 ; $7E780C
  .headSegmentYOffset: skip 2 ; $7E780E
  .targetLength: skip 2 ; $7E7810
  .length: skip 2 ; $7E7812
  .targetAngleSMConvention: skip 2 ; $7E7814
  .targetAngleMathsConvention: skip 2 ; $7E7816
  .bodySegmentBaseXPosition: skip 2 ; $7E7818
  .bodySegmentBaseYPosition: skip 2 ; $7E781A
  .originXPosition: skip 2 ; $7E781C
  .originYPosition: skip 2 ; $7E781E
skip $7E2
  .bodySegment1Angle: skip 2 ; $7E8002
  .bodySegment2Angle: skip 2 ; $7E8004
  .bodySegment3Angle: skip 2 ; $7E8006
  .bodySegmentAngle: skip 2 ; $7E8008
skip 4
  .bodySegment1XVelocity: skip 2 ; $7E800E
  .bodySegment1YVelocity: skip 2 ; $7E8010
  .bodySegment2XVelocity: skip 2 ; $7E8012
  .bodySegment2YVelocity: skip 2 ; $7E8014
  .bodySegment3XVelocity: skip 2 ; $7E8016
  .bodySegment3YVelocity: skip 2 ; $7E8018
  .headSegmentXVelocity: skip 2 ; $7E801A
  .headSegmentYVelocity: skip 2 ; $7E801C
  .aimingDownFlag: skip 2 ; $7E801E
  .grabbingSamusFlag: skip 2 ; $7E8020
skip 2
  .SamusXOffset: skip 2 ; $7E8024
  .SamusYOffset: skip 2 ; $7E8026
  .instListTableIndex: skip 2 ; $7E8028
  .intangibilityTimer: skip 2 ; $7E802A
skip $7D4
  .bodySegment0ProjectileIndex: skip 2 ; $7E8800
  .bodySegment1ProjectileIndex: skip 2 ; $7E8802
  .bodySegment2ProjectileIndex: skip 2 ; $7E8804
  .bodySegment3ProjectileIndex: skip 2 ; $7E8806
  .bodySegmentIndex: skip 2 ; $7E8808
  .initialPaletteIndex: skip 2 ; $7E880A
  .baseSpriteObjectIndex: skip 2 ; $7E880C
endstruct

struct Kago $0FA8
  .function: skip 2 ; $0FA8
  .fastAnimationFlag: skip 2 ; $0FAA
skip $7DE85C
  .hitCounter: skip 2 ; $7E7808
endstruct

struct Magdollite $0FAA
  .armGrowthTableIndex: skip 0 ; $0FAA
  .handDirection: skip 2 ; $0FAA
  .instList: skip 2 ; $0FAC
  .newInstList: skip 2 ; $0FAE
  .negativeArmHeight: skip 2 ; $0FB0
  .function: skip 2 ; $0FB2
skip $7DE84C
  .headDirection: skip 2 ; $7E7800
  .animationActiveFlag: skip 2 ; $7E7802
  .emergeNotReadyFlag: skip 2 ; $7E7804
  .YSpawnPosition: skip 2 ; $7E7806
  .cooldownTimer: skip 2 ; $7E7808
skip 4
  .downSubVelocity: skip 2 ; $7E780E
  .downVelocity: skip 2 ; $7E7810
  .upSubVelocity: skip 2 ; $7E7812
  .upVelocity: skip 2 ; $7E7814
skip 2
  .finishedGrowingFlag: skip 2 ; $7E7818
  .notEmergedFlag: skip 2 ; $7E781A
skip 8
  .throwXPosition: skip 2 ; $7E7824
  .throwYPosition: skip 2 ; $7E7826
endstruct

struct Beetom $0FAA
  .YSpeedTableIndex: skip 2 ; $0FAA
  .function: skip 2 ; $0FAC
  .functionTimer: skip 2 ; $0FAE
  .buttonCounter: skip 2 ; $0FB0
  .previousController1Input: skip 2 ; $0FB2
skip $7DE84C
  .instList: skip 2 ; $7E7800
skip 2
  .initialShortLeapYSpeedIndex: skip 2 ; $7E7804
  .initialLongLeapYSpeedIndex: skip 2 ; $7E7806
  .initialLungeYSpeedIndex: skip 2 ; $7E7808
  .fallingFlag: skip 2 ; $7E780A
skip 4
  .attachedToSamusFlag: skip 2 ; $7E7810
  .direction: skip 2 ; $7E7812
endstruct

struct Powamp $0FA8
  .YVelocity: skip 0 ; $0FA8
  .balloonSpawnXPosition: skip 2 ; $0FA8
  .YSubVelocity: skip 0 ; $0FAA
  .balloonSpawnYPosition: skip 2 ; $0FAA
  .wiggleIndex: skip 2 ; $0FAC
  .wiggleTimer: skip 0 ; $0FAE
  .balloonGrappleTravelDistance: skip 2 ; $0FAE
  .functionTimer: skip 2 ; $0FB0
  .function: skip 2 ; $0FB2
endstruct

struct Robot $0FA8
  .laserXVelocity: skip 2 ; $0FA8
  .laserCooldown: skip 2 ; $0FAA
  .backupXPosition: skip 2 ; $0FAC
  .backupYPosition: skip 2 ; $0FAE
  .YSubVelocity: skip 2 ; $0FB0
  .YVelocity: skip 2 ; $0FB2
endstruct

struct Bull $0FA8
  .function: skip 2 ; $0FA8
  .acceleration: skip 2 ; $0FAA
  .accelerationDelta: skip 2 ; $0FAC
  .speed: skip 2 ; $0FAE
  .activationTimer: skip 2 ; $0FB0
  .accelerationIntervalTimer: skip 2 ; $0FB2
skip $7DE84C
  .maxSpeed: skip 2 ; $7E7800
  .angleToSamus: skip 2 ; $7E7802
  .angle: skip 2 ; $7E7804
  .shotReactionDisableFlag: skip 2 ; $7E7806
skip 2
  .accelerationIntervalTimerResetValue: skip 2 ; $7E780A
  .decelerationIntervalTimerResetValue: skip 2 ; $7E780C
  .shotReactionDisableTimer: skip 2 ; $7E780E
skip $FF0
  .previousHealth: skip 2 ; $7E8800
endstruct

struct Alcoon $0FA8
  .function: skip 2 ; $0FA8
  .YVelocity: skip 2 ; $0FAA
  .YSubVelocity: skip 2 ; $0FAC
  .XVelocity: skip 2 ; $0FAE
skip 2
  .spawnYPosition: skip 2 ; $0FB2
skip $7DE84C
  .YAcceleration: skip 2 ; $7E7800
  .YSubAcceleration: skip 2 ; $7E7802
  .spawnXPosition: skip 2 ; $7E7804
  .landingYPosition: skip 2 ; $7E7806
  .stepCounter: skip 2 ; $7E7808
endstruct

struct Atomic $0FA8
  .XMovementFunction: skip 2 ; $0FA8
  .YMovementFunction: skip 2 ; $0FAA
skip $7DE854
  .subSpeed: skip 2 ; $7E7800
  .speed: skip 2 ; $7E7802
  .negativeSubSpeed: skip 2 ; $7E7804
  .negativeSpeed: skip 2 ; $7E7806
endstruct

struct Spark $0FAA
  .function: skip 2 ; $0FAA
skip 4
  .baseFunctionTime: skip 2 ; $0FB0
  .functionTimer: skip 2 ; $0FB2
endstruct

struct FaceBlock $0FA8
  .activatedFlag: skip 2 ; $0FA8
  .directionToSamus: skip 2 ; $0FAA
skip 10
  .directionToNotTurn: skip 2 ; $0FB6
endstruct

struct Kihunter $0FA8
  .function: skip 2 ; $0FA8
  .arcCenterXPosition: skip 2 ; $0FAA
  .arcCenterYPosition: skip 2 ; $0FAC
skip 4
  .arcAngle: skip 2 ; $0FB2
skip $7DE84C
  .arcAngularVelocityCap: skip 2 ; $7E7800
skip 2
  .arcAngularVelocity: skip 2 ; $7E7804
  .arcAngularSubVelocity: skip 2 ; $7E7806
  .arcAngularAcceleration: skip 2 ; $7E7808
  .arcAngularSubAcceleration: skip 2 ; $7E780A
  .XSubVelocity: skip 2 ; $7E780C
  .XVelocity: skip 2 ; $7E780E
  .YSubVelocity: skip 2 ; $7E7810
  .YVelocity: skip 2 ; $7E7812
  .idleZoneTopPosition: skip 2 ; $7E7814
  .idleZoneBottomPosition: skip 2 ; $7E7816
  .spawnXPosition: skip 2 ; $7E7818
  .spawnYPosition: skip 2 ; $7E781A
  .swipeTriggerAngle: skip 2 ; $7E781C
  .thinkingTimer: skip 2 ; $7E781E
  .swoopSwipeFlag: skip 2 ; $7E7820
  .arcXRadius: skip 2 ; $7E7822
  .arcYRadius: skip 2 ; $7E7824
skip 2
  .winglessFlag: skip 2 ; $7E7828
endstruct

struct KihunterWings $0FA8
  .function: skip 2 ; $0FA8
  .speedTableIndex: skip 2 ; $0FAA
skip 2
  .angleAccumulator: skip 2 ; $0FAE
skip 2
  .arcAngle: skip 2 ; $0FB2
skip $7DE84C
  .fallingFunction: skip 2 ; $7E7800
  .rightArcCenterXOffset: skip 2 ; $7E7802
  .rightArcCenterYOffset: skip 2 ; $7E7804
  .leftArcCenterXOffset: skip 2 ; $7E7806
  .leftArcCenterYOffset: skip 2 ; $7E7808
  .arcStartXPosition: skip 2 ; $7E780A
  .arcStartYPosition: skip 2 ; $7E780C
  .fallStartXPosition: skip 2 ; $7E780E
  .fallStartYPosition: skip 2 ; $7E7810
skip 2
  .speedTableResetValue: skip 2 ; $7E7814
endstruct

struct MotherBrainBody $0FA8
  .function: skip 2 ; $0FA8
skip 2
  .ZebetitesPaletteAnimationIndex: skip 2 ; $0FAC
  .brainPaletteCounter: skip 1 ; $0FAE
  .brainPaletteTimer: skip 1 ; $0FAF
  .brainPaletteTimerResetValue: skip 1 ; $0FB0
  .brainPaletteSet: skip 1 ; $0FB1
  .functionTimer: skip 0 ; $0FB2
  .bodyTargetXPosition: skip 2 ; $0FB2
  .attackCooldown: skip 0 ; $0FB4
  .rainbowBeamExplosionIndex: skip 0 ; $0FB4
  .customSamusXVelocity: skip 2 ; $0FB4
  .rainbowBeamExplosionTimer: skip 0 ; $0FB6
  .customSamusYVelocity: skip 2 ; $0FB6
skip $30
  .brainFunction: skip 2 ; $0FE8
skip 6
  .subFunction: skip 0 ; $0FF0
  .deathExplosionIntervalTimer: skip 2 ; $0FF0
  .bodySubFunctionTimer: skip 0 ; $0FF2
  .deathExplosionIndex: skip 0 ; $0FF2
  .escapeDoorIndex: skip 2 ; $0FF2
skip $7DE80C
  .form: skip 2 ; $7E7800
skip 2
  .pose: skip 2 ; $7E7804
skip 2
  .hitboxesEnabled: skip 2 ; $7E7808
skip 2
  .disableAttacks: skip 2 ; $7E780C
  .walkCounter: skip 2 ; $7E780E
skip 2
  .HDMAObjectIndex: skip 2 ; $7E7812
  .XPosition: skip 2 ; $7E7814
  .YPosition: skip 2 ; $7E7816
  .neckPalleteIndex: skip 2 ; $7E7818
  .brainPalleteIndex: skip 2 ; $7E781A
  .roomPaletteInstListPointer: skip 2 ; $7E781C
  .roomPaletteInstructionTimer: skip 2 ; $7E781E
skip 6
  .BabyMetroidAttackCounter: skip 2 ; $7E7826
  .playBabyMetroidCryFlag: skip 2 ; $7E7828
  .numberOfTimesToQueueRainbowBeamSFX: skip 2 ; $7E782A
  .rainbowBeamSFXIsPlayingFlag: skip 2 ; $7E782C
  .deathBeamAttackPhase: skip 2 ; $7E782E
  .attackPhase: skip 2 ; $7E7830
skip 2
  .onionRingsTargetAngle: skip 2 ; $7E7834
skip 4
  .deleteTurretsRinkasFlag: skip 2 ; $7E783A
  .RinkaCounter: skip 2 ; $7E783C
  .phase2CorpseState: skip 2 ; $7E783E
  .brainMainShakeTimer: skip 2 ; $7E7840
  .rainbowBeamPaletteAnimationIndex: skip 2 ; $7E7842
  .enableUnpauseHookFlag: skip 2 ; $7E7844
skip 4
  .bombCounter: skip 2 ; $7E784A
  .painfulWalkingStage: skip 2 ; $7E784C
  .painfulWalkingAnimationDelay: skip 2 ; $7E784E
  .painfulWalkingFunction: skip 2 ; $7E7850
  .painfulWalkingFunctionTimer: skip 2 ; $7E7852
  .BabyMetroidEnemyIndex: skip 2 ; $7E7854
skip 10
  .enableBrainPaletteHandlingFlag: skip 2 ; $7E7860
  .enableHealthBasedPaletteHandlingFlag: skip 2 ; $7E7862
  .enableDroolGenerationFlag: skip 2 ; $7E7864
  .droolProjectileParam: skip 2 ; $7E7866
  .smallPurpleBreathGenerationEnabledFlag: skip 2 ; $7E7868
  .smallPurpleBreathActiveFlag: skip 2 ; $7E786A
  .SamusRainbowPaletteFunction: skip 2 ; $7E786C
skip 2
  .neckFunction: skip 2 ; $7E7870
  .neckFunctionTimer: skip 2 ; $7E7872
  .walkingFunction: skip 2 ; $7E7874
  .targetXPosition: skip 2 ; $7E7876
  .crouchTimer: skip 2 ; $7E7878
  .SamusRainbowPaletteAnimationCounter: skip 2 ; $7E787A
skip $784
  .brainInstructionTimer: skip 2 ; $7E8000
  .brainInstListPointer: skip 2 ; $7E8002
  .spriteTilesTransferEntryPointer: skip 2 ; $7E8004
  .deathBeamNextXSubPosition: skip 2 ; $7E8006
  .deathBeamNextXPosition: skip 2 ; $7E8008
  .deathBeamNextYSubPosition: skip 2 ; $7E800A
  .deathBeamNextYPosition: skip 2 ; $7E800C
  .deathBeamNextXVelocity: skip 2 ; $7E800E
  .deathBeamNextYVelocity: skip 2 ; $7E8010
  .deathBeamNextAngle: skip 2 ; $7E8012
skip 14
  .rainbowBeamAngle: skip 2 ; $7E8022
skip 2
  .rainbowBeamAngularWidth: skip 2 ; $7E8026
skip 6
  .greyTransitionCounter: skip 0 ; $7E802E
  .roomLightsTransitionCounter: skip 2 ; $7E802E
  .fakeDeathExplosionTimer: skip 2 ; $7E8030
  .fakeDeathExplosionIndex: skip 2 ; $7E8032
  .rainbowBeamRightEdgeAngle: skip 2 ; $7E8034
  .rainbowBeamLeftEdgeAngle: skip 2 ; $7E8036
  .rainbowBeamRightEdgeOriginXPosition: skip 2 ; $7E8038
  .rainbowBeamOriginYPosition: skip 2 ; $7E803A
  .rainbowBeamLeftEdgeOriginXPosition: skip 2 ; $7E803C
  .rainbowBeamOriginYPositionDuplicate: skip 2 ; $7E803E
  .lowerNeckAngle: skip 2 ; $7E8040
  .upperNeckAngle: skip 2 ; $7E8042
  .neckSegment0XPosition: skip 2 ; $7E8044
  .neckSegment0YPosition: skip 2 ; $7E8046
  .neckSegment0Distance: skip 2 ; $7E8048
  .neckSegment1XPosition: skip 2 ; $7E804A
  .neckSegment1YPosition: skip 2 ; $7E804C
  .neckSegment1Distance: skip 2 ; $7E804E
  .neckSegment2XPosition: skip 2 ; $7E8050
  .neckSegment2YPosition: skip 2 ; $7E8052
  .neckSegment2Distance: skip 2 ; $7E8054
  .neckSegment3XPosition: skip 2 ; $7E8056
  .neckSegment3YPosition: skip 2 ; $7E8058
  .neckSegment3Distance: skip 2 ; $7E805A
  .neckSegment4XPosition: skip 2 ; $7E805C
  .neckSegment4YPosition: skip 2 ; $7E805E
  .neckSegment4Distance: skip 2 ; $7E8060
  .enableNeckMovementFlag: skip 2 ; $7E8062
  .lowerNeckMovementIndex: skip 2 ; $7E8064
  .upperNeckMovementIndex: skip 2 ; $7E8066
  .neckAngleDelta: skip 2 ; $7E8068
skip $7BA
  .corpseRottingRotTablePointer: skip 2 ; $7E8824
  .corpseRottingVRAMTransfersPointer: skip 2 ; $7E8826
  .corpseRottingRotEntryCopyFunction: skip 2 ; $7E8828
  .corpseRottingRotEntryMoveFunction: skip 2 ; $7E882A
  .corpseRottingTileDataRowOffsetsPointer: skip 2 ; $7E882C
  .corpseRottingSpriteHeight: skip 2 ; $7E882E
  .corpseRottingSpriteHeightMinus1: skip 2 ; $7E8830
  .corpseRottingSpriteHeightMinus2: skip 2 ; $7E8832
  .corpseRottingInterTileDataOffset: skip 2 ; $7E8834
  .corpseRottingRotEntryFinishedHook: skip 2 ; $7E8836
endstruct

struct BabyMetroidCutscene $0FA8
  .function: skip 2 ; $0FA8
  .XVelocity: skip 2 ; $0FAA
  .YVelocity: skip 2 ; $0FAC
  .paletteFrameTimer: skip 1 ; $0FAE
  .paletteHandlerTimer: skip 1 ; $0FAF
  .paletteHandlerDelay: skip 2 ; $0FB0
  .functionTimer: skip 2 ; $0FB2
skip $7DE854
  .crySFXFlag: skip 2 ; $7E7808
  .crySFXTimer: skip 2 ; $7E780A
  .flashTimer: skip 2 ; $7E780C
  .deathExplosionIndex: skip 2 ; $7E780E
  .deathExplosionTimer: skip 2 ; $7E7810
  .healthBasedPaletteFlag: skip 2 ; $7E7812
  .angle: skip 2 ; $7E7814
  .speed: skip 2 ; $7E7816
  .fadeToBlackPaletteTimer: skip 2 ; $7E7818
  .fadeToBlackPaletteIndex: skip 2 ; $7E781A
  .movementTablePointer: skip 2 ; $7E781C
  .paletteFunction: skip 2 ; $7E781E
  .shakingOriginXPosition: skip 2 ; $7E7820
  .shakingOriginYPosition: skip 2 ; $7E7822
endstruct

struct MotherBrainTubes $0FA8
  .function: skip 2 ; $0FA8
  .YPositionThreshold: skip 2 ; $0FAA
  .YVelocity: skip 2 ; $0FAC
  .smokeTimer: skip 2 ; $0FAE
  .smokeCounter: skip 2 ; $0FB0
skip 2
  .tubeType: skip 2 ; $0FB4
  .fallDelayTimer: skip 2 ; $0FB6
endstruct

struct CorpseTorizo $0FA8
  .function: skip 2 ; $0FA8
  .XVelocity: skip 2 ; $0FAA
  .YVelocity: skip 2 ; $0FAC
skip $7DE856
  .sandHeapYPixelRowToCopy: skip 2 ; $7E7804
  .sandHeapFormationTimer: skip 2 ; $7E7806
  .preRotDelayTimer: skip 2 ; $7E7808
skip $101A
  .rotTablePointer: skip 2 ; $7E8824
  .VRAMTransfersPointer: skip 2 ; $7E8826
  .rotEntryCopyFunction: skip 2 ; $7E8828
  .rotEntryMoveFunction: skip 2 ; $7E882A
  .tileDataRowOffsetsPointer: skip 2 ; $7E882C
  .spriteHeight: skip 2 ; $7E882E
  .spriteHeightMinus1: skip 2 ; $7E8830
  .spriteHeightMinus2: skip 2 ; $7E8832
  .interTileDataOffset: skip 2 ; $7E8834
  .rotEntryFinishedHook: skip 2 ; $7E8836
endstruct

struct CorpseSidehopper $0FA8
  .function: skip 2 ; $0FA8
  .preRotDelayTimer: skip 2 ; $0FAA
skip 6
  .functionTimer: skip 2 ; $0FB2
skip $7DE858
  .hopIndex: skip 2 ; $7E780C
  .drainedPaletteTimer: skip 2 ; $7E780E
  .drainedPaletteIndex: skip 2 ; $7E7810
skip 2
  .XVelocity: skip 2 ; $7E7814
  .YVelocity: skip 2 ; $7E7816
skip $100C
  .rotTablePointer: skip 2 ; $7E8824
  .VRAMTransfersPointer: skip 2 ; $7E8826
  .rotEntryCopyFunction: skip 2 ; $7E8828
  .rotEntryMoveFunction: skip 2 ; $7E882A
  .tileDataRowOffsetsPointer: skip 2 ; $7E882C
  .spriteHeight: skip 2 ; $7E882E
  .spriteHeightMinus1: skip 2 ; $7E8830
  .spriteHeightMinus2: skip 2 ; $7E8832
  .interTileDataOffset: skip 2 ; $7E8834
  .rotEntryFinishedHook: skip 2 ; $7E8836
endstruct

struct Corpse $0FA8
  .function: skip 2 ; $0FA8
  .preRotDelayTimer: skip 2 ; $0FAA
skip $7DF878
  .rotTablePointer: skip 2 ; $7E8824
  .VRAMTransfersPointer: skip 2 ; $7E8826
  .rotEntryCopyFunction: skip 2 ; $7E8828
  .rotEntryMoveFunction: skip 2 ; $7E882A
  .tileDataRowOffsetsPointer: skip 2 ; $7E882C
  .spriteHeight: skip 2 ; $7E882E
  .spriteHeightMinus1: skip 2 ; $7E8830
  .spriteHeightMinus2: skip 2 ; $7E8832
  .interTileDataOffset: skip 2 ; $7E8834
  .rotEntryFinishedHook: skip 2 ; $7E8836
endstruct

struct BabyMetroid $0FA8
  .function: skip 2 ; $0FA8
  .XVelocity: skip 2 ; $0FAA
  .YVelocity: skip 2 ; $0FAC
  .paletteFrameTimer: skip 1 ; $0FAE
  .paletteHandlerTimer: skip 1 ; $0FAE
  .paletteHandlerDelay: skip 2 ; $0FB0
  .functionTimer: skip 2 ; $0FB2
skip 2
  .contactReactionFlag: skip 2 ; $0FB6
skip $7DE84A
  .aggroTimer: skip 2 ; $7E7802
  .stareDownContactTimer: skip 2 ; $7E7804
skip 2
  .crySFXFlag: skip 2 ; $7E7808
  .crySFXTimer: skip 2 ; $7E780A
endstruct

struct Torizo $0FA8
  .XVelocity: skip 2 ; $0FA8
  .YVelocity: skip 2 ; $0FAA
  .YAcceleration: skip 2 ; $0FAC
skip 2
  .function: skip 2 ; $0FB0
  .movementFunction: skip 2 ; $0FB2
  .graphicalProperties: skip 2 ; $0FB4
  .behavioralProperties: skip 2 ; $0FB6
skip $7DE848
  .linkInstruction: skip 2 ; $7E7800
  .gutExplosionLinkInstruction: skip 2 ; $7E7802
skip 2
  .turnAroundTimer: skip 2 ; $7E7806
  .animationLockFlag: skip 2 ; $7E7808
skip 4
  .spaceJumpCounter: skip 2 ; $7E780E
skip 2
  .stepCounter: skip 2 ; $7E7812
endstruct

struct Shaktool $0FA8
  .facingAngle: skip 2 ; $0FA8
  .neighborAngle: skip 2 ; $0FAA
  .neighborAngleDelta: skip 2 ; $0FAC
  .headDirection: skip 0 ; $0FAE
  .finalPieceAngleCurled: skip 1 ; $0FAE
  .flipFlag: skip 1 ; $0FAF
  .primaryPieceEnemyIndex: skip 2 ; $0FB0
  .function: skip 2 ; $0FB2
  .movementOptions: skip 2 ; $0FB4
endstruct

struct Chozo $0FAC
  .movementIndex: skip 2 ; $0FAC
skip 4
  .function: skip 2 ; $0FB2
  .activationFlag: skip 2 ; $0FB4
endstruct

struct Zeb $0FA8
  .direction: skip 2 ; $0FA8
  .spawnXPosition: skip 2 ; $0FAA
  .spawnYPosition: skip 2 ; $0FAC
  .spawnDelayTimer: skip 2 ; $0FAE
  .instListTableIndex: skip 2 ; $0FB0
  .function: skip 2 ; $0FB2
skip $7DE84C
  .targetYPosition: skip 2 ; $7E7800
  .previousInstListTableIndex: skip 2 ; $7E7802
endstruct

struct Gamet $0FA8
  .function: skip 2 ; $0FA8
  .XSpeedTableIndex: skip 2 ; $0FAA
  .shootDelayTimer: skip 2 ; $0FAC
  .spawnXPosition: skip 2 ; $0FAE
  .spawnYPosition: skip 2 ; $0FB0
  .formationFunction: skip 2 ; $0FB2
skip $7DE84E
  .formationCenterYPosition: skip 2 ; $7E7802
  .shootDelay: skip 2 ; $7E7804
endstruct

struct Geega $0FA8
  .function: skip 2 ; $0FA8
skip 2
  .XSubPosition: skip 2 ; $0FAC
  .YSubPosition: skip 2 ; $0FAE
  .YSpeedTableIndex: skip 2 ; $0FB0
  .dipDirection: skip 2 ; $0FB2
skip $7DE84C
  .rightSubVelocity: skip 2 ; $7E7800
  .rightVelocity: skip 2 ; $7E7802
  .leftSubVelocity: skip 2 ; $7E7804
  .leftVelocity: skip 2 ; $7E7806
skip 4
  .dipDisableFlag: skip 2 ; $7E780C
  .spawnXPosition: skip 2 ; $7E780E
  .spawnYPosition: skip 2 ; $7E7810
skip $7EE
  .shootDelayTimer: skip 2 ; $7E8000
endstruct

struct Botwoon $0FA8
  .bodyProjectileIndex: skip 2 ; $0FA8
  .positionHistoryIndex: skip 2 ; $0FAA
  .bodyTravelTime: skip 2 ; $0FAC
  .function: skip 2 ; $0FAE
  .movementFunction: skip 2 ; $0FB0
  .headFunction: skip 2 ; $0FB2
skip $7DF04C
  .initTimer: skip 2 ; $7E8000
  .spitTimer: skip 2 ; $7E8002
  .preDeathCounter: skip 2 ; $7E8004
  .deathCounter: skip 2 ; $7E8006
  .largeWallExplosionTimer: skip 2 ; $7E8008
  .wallSmokeTimer: skip 2 ; $7E800A
skip 4
  .fallingYSpeedTableIndex: skip 2 ; $7E8010
skip 12
  .deathFlag: skip 2 ; $7E801E
  .bodyDeathFlag: skip 2 ; $7E8020
skip 4
  .headHiddenFlag: skip 2 ; $7E8026
  .previousHeadHiddenFlag: skip 2 ; $7E8028
  .holeCollisionDisabledFlag: skip 2 ; $7E802A
  .targetPositionHistoryIndex: skip 2 ; $7E802C
  .targetHoleIndex: skip 2 ; $7E802E
  .speed: skip 2 ; $7E8030
skip 2
  .targetHoleAngle: skip 2 ; $7E8034
  .instList: skip 2 ; $7E8036
  .goingThroughHoleFlag: skip 2 ; $7E8038
  .spitAngle: skip 2 ; $7E803A
  .tailShowingFlag: skip 2 ; $7E803C
  .speedTableIndex: skip 2 ; $7E803E
skip $7C0
  .movementTableIndex: skip 2 ; $7E8800
skip 2
  .movementDataPointer: skip 2 ; $7E8804
skip 2
  .movementDirection: skip 2 ; $7E8808
skip 14
  .previousHealth: skip 2 ; $7E8818
skip 2
  .paletteDataOffset: skip 2 ; $7E881C
  .healthBasedPaletteIndex: skip 2 ; $7E881E
  .XPosition1FrameAgo: skip 2 ; $7E8820
  .YPosition1FrameAgo: skip 2 ; $7E8822
  .XPosition2FramesAgo: skip 2 ; $7E8824
  .YPosition2FramesAgo: skip 2 ; $7E8826
  .XPosition3FramesAgo: skip 2 ; $7E8828
  .YPosition3FramesAgo: skip 2 ; $7E882A
  .XPosition4FramesAgo: skip 2 ; $7E882C
  .YPosition4FramesAgo: skip 2 ; $7E882E
skip 2
  .initialLeaveHoleActionFlag: skip 2 ; $7E8832
  .spittingFlag: skip 2 ; $7E8834
  .maxHealth: skip 2 ; $7E8836
  .maxHealth_1_2: skip 2 ; $7E8838
  .maxHealth_1_4: skip 2 ; $7E883A
skip 2
  .bodyDeathFlag2: skip 2 ; $7E883E
endstruct

struct EtecoonEscape $0FA8
  .XVelocity: skip 2 ; $0FA8
skip 8
  .function: skip 2 ; $0FB2
endstruct

struct PirateWall $0FA8
  .function: skip 2 ; $0FA8
skip 2
  .direction: skip 2 ; $0FAC
  .wallJumpArcCenterXPosition: skip 2 ; $0FAE
  .wallJumpArcCenterYPosition: skip 2 ; $0FB0
  .wallJumpArcAngle: skip 2 ; $0FB2
skip $7DF04C
  .wallJumpArcRightTargetAngle: skip 2 ; $7E8000
  .wallJumpArcLeftTargetAngle: skip 2 ; $7E8002
  .wallJumpArcAngleDelta: skip 2 ; $7E8004
endstruct

struct PirateNinja $0FA8
  .function: skip 2 ; $0FA8
skip 4
  .postsMidpointXPosition: skip 2 ; $0FAE
  .leftPostXPosition: skip 2 ; $0FB0
  .rightPostXPosition: skip 2 ; $0FB2
skip $7DE84C
  .speed: skip 2 ; $7E7800
skip 14
  .spawnYPosition: skip 2 ; $7E7810
endstruct

struct PirateWalking $0FA8
  .function: skip 2 ; $0FA8
skip 6
  .leftPostXPosition: skip 2 ; $0FB0
  .rightPostXPosition: skip 2 ; $0FB2
skip $7DE84C
  .backupXPosition: skip 2 ; $7E7800
endstruct

check bankcross on


; SRAM $700000..2000

org $700000
SRAM_Slot0Checksum0: skip 2 ; $700000
SRAM_Slot1Checksum0: skip 2 ; $700002
SRAM_Slot2Checksum0: skip 2 ; $700004
skip 2 ; Unused
SRAM_Slot0Complement0: skip 2 ; $700008
SRAM_Slot1Complement0: skip 2 ; $70000A
SRAM_Slot2Complement0: skip 2 ; $70000C
skip 2
SRAM_Slot0: skip $065C ; $700010..066B
SRAM_Slot1: skip $065C ; $70066C..0CC7
SRAM_Slot2: skip $065C ; $700CC8..1323

org $701FE0
SRAM_GameCompletionFlag: skip 12 ; $701FE0..EB
SRAM_SaveSlotSelected: skip 2 ; $701FEC
SRAM_SaveSlotSelectedComplement: skip 2 ; $701FEE
SRAM_Slot0Checksum1: skip 2 ; $701FF0
SRAM_Slot1Checksum1: skip 2 ; $701FF2
SRAM_Slot2Checksum1: skip 2 ; $701FF4
skip 2
SRAM_Slot0Complement1: skip 2 ; $701FF8
SRAM_Slot1Complement1: skip 2 ; $701FFA
SRAM_Slot2Complement1: skip 2 ; $701FFC
