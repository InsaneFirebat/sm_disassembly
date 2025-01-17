
org $838000

; FX format
;        _____________________________ 0: Door pointer
;       |      _______________________ 2: Base Y position
;       |     |      _________________ 4: Target Y position
;       |     |     |      ___________ 6: Y velocity
;       |     |     |     |
;       dddd, bbbb, tttt, vvvv
;        _____________________________ 8: Timer
;       |    _________________________ 9: Type (foreground layer 3)
;       |   |    _____________________ Ah: Default layer blending configuration (FX A)
;       |   |   |    _________________ Bh: FX layer 3 layer blending configuration (FX B)
;       |   |   |   |    _____________ Ch: FX liquid options (FX C)
;       |   |   |   |   |    _________ Dh: Palette FX bitset
;       |   |   |   |   |   |    _____ Eh: Animated tiles bitset
;       |   |   |   |   |   |   |    _ Fh: Palette blend
;       |   |   |   |   |   |   |   |
;       tt, ff, AA, BB, CC, pp, aa, bb
FXHeader_LandingSite_State3:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$06,$00,$00 

FXHeader_Parlor_State2:
    dw $0000,$04E8,$0010,$FF98 
    db $00,$00,$02,$02,$00,$42,$00,$00 

FXHeader_Climb_State2:
    dw $0000,$08E8,$0010,$FF98 
    db $28,$04,$02,$1E,$01,$38,$00,$00 

FXHeader_BombTorizo_State2:
    dw $0000,$00F0,$00B8,$FFF0 
    db $30,$04,$02,$1E,$00,$00,$00,$00 

FXHeader_Flyway_State2:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$00,$00,$00 

FXHeader_Parlor_State1:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$00,$00,$00 

FXHeader_Climb_State1:
    dw Door_TourianEscape4_1 
    dw $0908,$0000,$FF80 
    db $20,$02,$02,$1E,$0B,$1F,$01,$02 
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$00,$00,$00 

FXHeader_Pit_State1:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$00,$00,$00 

FXHeader_ElevToBlueBrinstar_State1:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$00,$00,$00 

FXHeader_FinalMissileBombway_State1:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$00,$00,$00 

FXHeader_FinalMissile_State1:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$00,$00,$00 

FXHeader_LandingSite_State0_1:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$0A,$02,$0E,$00,$01,$00,$22 

FXHeader_LandingSite_State2:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$00,$00,$00 

FXHeader_GauntletEntrance_State0_1:
    dw $0000,$00C8,$FFFF,$0000 
    db $00,$04,$02,$1E,$42,$00,$00,$00 

FXHeader_Parlor_State0:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$28,$02,$00,$00,$00,$62 

FXHeader_CrateriaPowerBombs:
    dw $0000,$00C0,$FFFF,$0000 
    db $00,$04,$02,$1E,$42,$00,$02,$48 

FXHeader_CrateriaSave:
    dw $FFFF 

FXHeader_WestOcean:
    dw $0000,$04F0,$FFFF,$0000 
    db $00,$06,$02,$18,$01,$00,$06,$48 

FXHeader_BowlingAlleyPath:
    dw $0000,$00B0,$FFFF,$0000 
    db $00,$06,$02,$18,$83,$00,$00,$48 

FXHeader_CrateriaKihunters:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$00,$00,$00 

FXHeader_ForgottenHighwayElev:
    dw $FFFF 

FXHeader_EastOcean:
    dw $0000,$04F0,$FFFF,$0000 
    db $00,$06,$02,$18,$01,$00,$04,$48 

FXHeader_ForgottenHighwayKagos:
    dw $FFFF 

FXHeader_CrabMaze:
    dw $0000,$01B0,$FFFF,$0000 
    db $00,$06,$02,$18,$03,$00,$00,$48 

FXHeader_ForgottenHighwayElbow:
    dw $FFFF 

FXHeader_CrateriaTube:
    dw $FFFF 

FXHeader_Moat:
    dw $0000,$00B0,$FFFF,$0000 
    db $00,$06,$02,$18,$01,$00,$06,$48 

FXHeader_RedBrinstarElev:
    dw $FFFF 

FXHeader_GauntletETank:
    dw $0000,$00C8,$FFFF,$0000 
    db $00,$04,$02,$1E,$42,$00,$02,$00 

FXHeader_PreBowling:
    dw $FFFF 

FXHeader_Climb_State0:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$0C,$02,$30,$00,$00,$00,$62 

FXHeader_Pit_State0:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$0C,$02,$30,$00,$00,$00,$62 

FXHeader_ElevToBlueBrinstar_State0:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$2A,$02,$00,$00,$00,$00 

FXHeader_BombTorizo_State0_1:
    dw $FFFF 

FXHeader_Flyway_State0_1:
    dw $FFFF 

FXHeader_VariousRooms_8381C2:
    dw $FFFF 

FXHeader_CrateriaSuper:
    dw $0000,$07E0,$FFFF,$0000 
    db $00,$04,$02,$1E,$40,$00,$02,$48 

FXHeader_FinalMissileBombway_State0:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$28,$02,$00,$00,$00,$62 

FXHeader_FinalMissile_State0:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$28,$02,$00,$00,$00,$62 

FXHeader_VariousRooms_8381F4:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$00,$00,$00 

FXHeader_GreenBrinstarMainShaft:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$01,$00,$00 

FXHeader_SporeSpawnSuper:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$08,$02,$0A,$00,$00,$00,$00 

FXHeader_BrinstarPreMap:
    dw $FFFF 

FXHeader_EarlySupers:
    dw $FFFF 

FXHeader_BrinstarReserveTank:
    dw $FFFF 

FXHeader_GreenBrinstarMap:
    dw $FFFF 

FXHeader_GreenBrinstarFirefleas:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$24,$02,$02,$00,$00,$00,$00 

FXHeader_GreenBrinstarMissileRefill:
    dw $FFFF 

FXHeader_Dachora:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$08,$02,$0A,$00,$00,$00,$00 

FXHeader_BigPink:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$08,$02,$0A,$00,$00,$01,$00 

FXHeader_SporeSpawnKihunters:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$01,$00,$00 

FXHeader_SporeSpawn_State0_1:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$08,$00,$00 

FXHeader_PinkBrinstarPowerBombs:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$00,$02,$00 

FXHeader_GreenHillZone:
    dw $FFFF 

FXHeader_MorphBall_State0:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$2A,$02,$00,$00,$00,$00 

FXHeader_ConstructionZone_State0:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$2A,$02,$00,$00,$00,$00 

FXHeader_BlueBrinstarETank_State0:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$2A,$02,$00,$00,$00,$00 

FXHeader_NoobBridge:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$01,$02,$00 

FXHeader_GreenBrinstarBeetoms:
    dw $FFFF 

FXHeader_EtecoonETank:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$01,$00,$00 

FXHeader_EtecoonSuper:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$01,$00,$00 

FXHeader_DachoraEnergyRefill:
    dw $FFFF 

FXHeader_SporeSpawnFarming:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$08,$02,$0A,$00,$00,$00,$00 

FXHeader_WaterwayETank:
    dw $0000,$00A8,$FFFF,$0000 
    db $00,$06,$02,$18,$03,$00,$00,$48 

FXHeader_FirstMissile:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$00,$00,$00 

FXHeader_PinkBrinstarHoppers:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$01,$03,$00 

FXHeader_HopperETank:
    dw $FFFF 

FXHeader_BigPinkSaveRoom:
    dw $FFFF 

FXHeader_BlueBrinstarBoulders:
    dw $0000,$00B0,$FFFF,$0000 
    db $00,$06,$02,$18,$83,$00,$02,$48 

FXHeader_BillyMays:
    dw $FFFF 

FXHeader_GreenBrinstarSave:
    dw $FFFF 

FXHeader_EtecoonSave:
    dw $FFFF 

FXHeader_RedTower:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$06,$03,$00 

FXHeader_RedBrinstarFirefleas:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$24,$02,$02,$00,$00,$02,$00 

FXHeader_XrayScope:
    dw $FFFF 

FXHeader_Hellway:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$02,$04,$00 

FXHeader_Caterpillar:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$06,$00,$00 

FXHeader_BetaPowerBomb:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$00,$04,$00 

FXHeader_AlphaPowerBomb:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$00,$04,$00 

FXHeader_SkreeBoost:
    dw $0000,$00BE,$FFFF,$0000 
    db $00,$06,$02,$18,$03,$00,$00,$48 

FXHeader_BelowSpazer:
    dw $0000,$01BE,$FFFF,$0000 
    db $00,$06,$02,$18,$03,$00,$01,$48 

FXHeader_Spazer:
    dw $FFFF 

FXHeader_VariousRooms_8383D2:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$04,$00,$00 

FXHeader_MiniKraid_State0_1:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$00,$02,$00 

FXHeader_KraidEyeDoor:
    dw $FFFF 

FXHeader_Kraid_State0:
    dw $FFFF 

FXHeader_Kraid_State1:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$0C,$02,$30,$00,$80,$00,$62 

FXHeader_RedTowerRefill:
    dw $FFFF 

FXHeader_KraidRefill:
    dw $FFFF 

FXHeader_Statues:
    dw $0000,$00B0,$01FF,$0000 
    db $00,$26,$02,$18,$01,$00,$00,$48 

FXHeader_WarehouseEntrance:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$2A,$02,$00,$00,$00,$00 

FXHeader_VariaSuit:
    dw $FFFF 

FXHeader_WarehouseSave:
    dw $FFFF 

FXHeader_RedBrinstarSave:
    dw $FFFF 

FXHeader_IceBeamAcid:
    dw $0000,$00B8,$FFFF,$0000 
    db $00,$02,$02,$1E,$0B,$1F,$02,$02 

FXHeader_Cathedral:
    dw $0000,$01B1,$FFFF,$0000 
    db $00,$02,$02,$1E,$0B,$1F,$00,$02 

FXHeader_CathedralEntrance:
    dw $0000,$01D0,$FFFF,$0000 
    db $00,$02,$02,$1E,$0B,$1F,$03,$02 

FXHeader_BusinessCenter:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$02,$02,$1E,$00,$00,$00,$02 

FXHeader_IceBeamGate:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$00,$00,$00 

FXHeader_IceBeamTutorial:
    dw $0000,$00B2,$FFFF,$0000 
    db $00,$02,$02,$1E,$0B,$1F,$00,$02 

FXHeader_IceBeam:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$02,$02,$1E,$00,$00,$00,$02 

FXHeader_IceBeamSnake:
    dw $0000,$02B8,$FFFF,$0000 
    db $00,$02,$02,$1E,$03,$1F,$03,$02 

FXHeader_CrumbleShaft:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$02,$02,$1E,$03,$1F,$00,$02 

FXHeader_CrocomireSpeedway:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$02,$02,$1E,$0B,$1F,$02,$02 

FXHeader_Crocomire_State0_1:
    dw $0000,$00C6,$FFFF,$0000 
    db $00,$04,$02,$1E,$81,$00,$01,$02 

FXHeader_HiJumpBoots:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$02,$02,$1E,$01,$00,$00,$02 

FXHeader_CrocomireEscape:
    dw $0000,$01B8,$FFFF,$0000 
    db $00,$02,$02,$1E,$0B,$1F,$00,$02 

FXHeader_HiJumpETank:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$02,$02,$1E,$01,$00,$00,$02 

FXHeader_PostCrocFarming:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$03,$00,$00,$02 

FXHeader_PostCrocSave:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$02,$02,$1E,$01,$00,$00,$02 

FXHeader_PostCrocPowerBombs:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$02,$02,$1E,$03,$1F,$00,$02 

FXHeader_PostCrocShaft:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$00,$00,$00 

FXHeader_PostCrocMissile:
    dw $0000,$00C8,$FFFF,$0000 
    db $00,$04,$02,$1E,$41,$00,$02,$00 

FXHeader_GrappleTutorial3:
    dw $0000,$00B8,$FFFF,$0000 
    db $00,$06,$02,$18,$83,$00,$00,$48 

FXHeader_PostCrocJump:
    dw $0000,$02B4,$FFFF,$0000 
    db $00,$04,$02,$1E,$80,$00,$00,$00 

FXHeader_GrappleTutorial2:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$00,$00,$00 

FXHeader_GrappleTutorial1:
    dw $0000,$00C0,$FFFF,$0000 
    db $00,$06,$02,$18,$83,$00,$00,$48 

FXHeader_GrappleBeam:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$00,$03,$00 

FXHeader_NorfairReserveTank:
    dw $0000,$00C7,$FFFF,$0000 
    db $00,$02,$02,$1E,$0B,$1F,$00,$02 

FXHeader_GreenBubblesMissiles:
    dw $0000,$00C6,$FFFF,$0000 
    db $00,$02,$02,$1E,$0B,$1F,$00,$02 

FXHeader_BubbleMountain:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$02,$02,$1E,$03,$00,$02,$02 

FXHeader_SpeedBoosterHall:
    dw Door_SpeedBooster_0 
    dw $01DA,$00B0,$0000 
    db $F0,$02,$02,$1E,$0B,$1F,$02,$02 
    dw $0000,$01DA,$FFFF,$0000 
    db $00,$02,$02,$1E,$0B,$1F,$02,$02 

FXHeader_SpeedBooster:
    dw $0000,$00DA,$0000,$0000 
    db $20,$02,$02,$1E,$0B,$1F,$00,$02 

FXHeader_SingleChamber:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$02,$02,$1E,$03,$1F,$02,$02 

FXHeader_DoubleChamber:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$02,$02,$1E,$03,$1F,$02,$02 

FXHeader_WaveBeam:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$02,$02,$1E,$01,$00,$00,$02 

FXHeader_SpikyPlatformsTunnel:
    dw $0000,$00C0,$FFFF,$0000 
    db $00,$02,$02,$1E,$03,$1F,$02,$02 

FXHeader_Volcano:
    dw $9672,$02E0,$0260,$FFF6 
    db $40,$02,$02,$1E,$0B,$1F,$00,$02 
    dw $0000,$0268,$FFFF,$0000 
    db $00,$02,$02,$1E,$01,$00,$00,$02 

FXHeader_KronicBoost:
    dw $0000,$02D4,$FFFF,$0000 
    db $00,$02,$02,$1E,$0B,$1F,$00,$02 

FXHeader_MagdolliteTunnel:
    dw $0000,$00BE,$FFFF,$0000 
    db $00,$02,$02,$1E,$0B,$1F,$00,$02 

FXHeader_PurpleShaft:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$02,$02,$1E,$03,$1F,$03,$02 

FXHeader_LavaDive:
    dw $0000,$00D0,$FFFF,$0000 
    db $00,$02,$02,$1E,$0B,$1F,$03,$02 

FXHeader_LowerNorfairElev:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$02,$02,$1E,$03,$1F,$00,$02 

FXHeader_UpperNorfairFarming:
    dw $0000,$01C0,$FFFF,$0000 
    db $00,$02,$02,$1E,$0B,$1F,$00,$02 

FXHeader_RisingTide:
    dw Door_Cathedral_1 
    dw $0108,$00C0,$FFE0 
    db $40,$02,$02,$1E,$0B,$1F,$00,$02 
    dw $0000,$00C8,$FFFF,$0000 
    db $00,$02,$02,$1E,$0B,$1F,$00,$02 

FXHeader_AcidSnakesTunnel:
    dw $0000,$00C5,$FFFF,$0000 
    db $00,$02,$02,$1E,$0B,$1F,$00,$02 

FXHeader_SpikyAcidSnakesTunnel:
    dw $0000,$00C6,$FFFF,$0000 
    db $00,$02,$02,$1E,$03,$1F,$02,$02 

FXHeader_UpperNorfairRefill:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$02,$02,$1E,$01,$00,$00,$02 

FXHeader_PurpleFarming:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$02,$02,$1E,$03,$1F,$00,$02 

FXHeader_BatCave:
    dw $0000,$01B4,$FFFF,$0000 
    db $00,$02,$02,$1E,$03,$1F,$00,$02 

FXHeader_NorfairMap:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$02,$02,$1E,$01,$00,$00,$02 

FXHeader_BubbleMountainSave:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$02,$02,$1E,$01,$00,$00,$02 

FXHeader_FrogSpeedway:
    dw $FFFF 

FXHeader_RedPirateShaft:
    dw $FFFF 

FXHeader_FrogSave:
    dw $FFFF 

FXHeader_CrocomireSave:
    dw $FFFF 

FXHeader_LNElevSave:
    dw $FFFF 

FXHeader_AcidStatue:
    dw $9876,$02D2,$FFFF,$0000 
    db $00,$04,$02,$1E,$82,$1F,$00,$00 
    dw $0000,$00C8,$02D2,$0000 
    db $00,$04,$02,$1E,$02,$1F,$00,$00 

FXHeader_MainHall:
    dw $0000,$02C1,$FFFF,$0000 
    db $00,$04,$02,$1E,$82,$1F,$00,$00 

FXHeader_GoldenTorizo_State0_1:
    dw $0000,$02C6,$FFFF,$0000 
    db $00,$04,$02,$1E,$82,$1F,$00,$00 

FXHeader_FastRipper:
    dw $0000,$00B8,$FFFF,$0000 
    db $00,$04,$02,$1E,$82,$1F,$00,$00 

FXHeader_GTEnergyRefill:
    dw $FFFF 

FXHeader_Ridley_State0_1:
    dw $0000,$0210,$01D0,$0000 
    db $00,$04,$02,$1E,$82,$1F,$00,$00 

FXHeader_LNFarming:
    dw $0000,$00D0,$FFFF,$0000 
    db $00,$04,$02,$1E,$82,$1F,$00,$00 

FXHeader_FastPillarsSetup:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$04,$02,$1E,$02,$1F,$00,$00 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_FXHeader_8387EC:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$04,$02,$1E,$02,$1F,$00,$00 
endif ; !FEATURE_KEEP_UNREFERENCED

FXHeader_MickeyMouse:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$04,$02,$1E,$02,$1F,$00,$00 

FXHeader_Pillar:
    dw $0000,$00E8,$0010,$FFE0 
    db $50,$04,$02,$1E,$82,$1F,$00,$00 

FXHeader_Plowerhouse:
    dw $0000,$00CD,$FFFF,$0000 
    db $00,$04,$02,$1E,$82,$1F,$00,$00 

FXHeader_WorstRoomInTheGame:
    dw $0000,$FFFF,$FFFF,$0000 
    db $20,$04,$02,$1E,$02,$1F,$02,$00 

FXHeader_Amphitheatre:
    dw $99F6,$00D0,$FFFF,$0000 
    db $00,$04,$02,$1E,$82,$1F,$00,$00 
    dw $0000,$04E8,$00D0,$FF80 
    db $60,$04,$02,$1E,$82,$1F,$02,$00 

FXHeader_LNSpringballMaze:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$04,$02,$1E,$02,$1F,$02,$00 

FXHeader_LNEscapePowerBombs:
    dw $0000,$00B3,$FFFF,$0000 
    db $00,$04,$02,$1E,$82,$1F,$00,$00 

FXHeader_RedKihunterShaft:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$04,$02,$1E,$02,$1F,$00,$00 

FXHeader_Wasteland:
    dw $0000,$02C0,$FFFF,$0000 
    db $00,$04,$02,$1E,$02,$1F,$03,$00 

FXHeader_MetalPirates:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$04,$02,$1E,$02,$1F,$00,$00 

FXHeader_ThreeMusketeers:
    dw $0000,$02D0,$FFFF,$0000 
    db $00,$04,$02,$1E,$42,$1F,$00,$00 

FXHeader_RidleyETank:
    dw $0000,$00DD,$FFFF,$0000 
    db $00,$04,$02,$1E,$82,$1F,$00,$00 

FXHeader_ScrewAttack:
    dw $0000,$02DD,$FFFF,$0000 
    db $00,$04,$02,$1E,$82,$1F,$00,$00 

FXHeader_LNFireflea:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$24,$02,$02,$00,$00,$02,$00 

FXHeader_LNSave:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$02,$02,$1E,$01,$00,$00,$02 


; Door header format
;        _____________________________ 0: Destination room header pointer (bank $8F)
;       |     ________________________ 2: Elevator properties
;       |    |   _____________________ 3: Direction
;       |    |  |   __________________ 4: Doorcap X position in blocks
;       |    |  |  |   _______________ 5: Doorcap Y position in blocks
;       |    |  |  |  |   ____________ 6: X screen
;       |    |  |  |  |  |   _________ 7: Y screen
;       |    |  |  |  |  |  |   ______ 8: Distance from door to spawn Samus
;       |    |  |  |  |  |  |  |     _ Ah: Custom door ASM to execute (bank $8F)
;       |    |  |  |  |  |  |  |    |
;       rrrr ee oo xx yy XX YY dddd aaaa
Door_VariousRooms_Elevator:
    db $00,$00 

Door_LandingSite_LandingCutscene:
    dw RoomHeader_LandingSite 
    db $00,$03,$00,$00,$04,$00 
    dw $8000,$0000 

Door_DemoSet3_0_2_4:
    dw RoomHeader_LandingSite 
    db $00,$03,$00,$00,$04,$02 
    dw $8000,$0000 

Door_LandingSite_0:
    dw RoomHeader_Parlor 
    db $00,$05,$4E,$06,$04,$00 
    dw $8000,$0000 

Door_LandingSite_1:
    dw RoomHeader_CrateriaTube 
    db $00,$00,$00,$00,$00,$00 
    dw $8000,$0000 

Door_LandingSite_2:
    dw RoomHeader_GauntletEntrance 
    db $00,$05,$4E,$06,$04,$00 
    dw $8000,$0000 

Door_LandingSite_3:
    dw RoomHeader_CrateriaPowerBombs 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_GauntletEntrance_0:
    dw RoomHeader_LandingSite 
    db $00,$04,$01,$26,$00,$02 
    dw $8000 
    dw DoorASM_Scroll_13_Blue 

Door_GauntletEntrance_1:
    dw RoomHeader_GauntletETank 
    db $00,$05,$5E,$06,$05,$00 
    dw $8000,$0000 

Door_Parlor_0:
    dw RoomHeader_Terminator 
    db $00,$05,$5E,$06,$05,$00 
    dw $8000,$0000 

Door_Parlor_1:
    dw RoomHeader_LandingSite 
    db $00,$04,$01,$46,$00,$04 
    dw $8000,$0000 

Door_Parlor_2:
    dw RoomHeader_PreMapFlyway 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_Parlor_3:
    dw RoomHeader_Flyway 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_Parlor_4:
    dw RoomHeader_Climb 
    db $00,$06,$16,$02,$01,$00 
    dw $8000,$0000 

Door_Parlor_5:
    dw RoomHeader_CrateriaSave 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_Parlor_6:
    dw RoomHeader_FinalMissileBombway 
    db $00,$05,$1E,$06,$01,$00 
    dw $8000,$0000 

Door_CrateriaPowerBombs_0:
    dw RoomHeader_LandingSite 
    db $00,$05,$8E,$16,$08,$01 
    dw $8000,$0000 

Door_CrateriaSave_0:
    dw RoomHeader_Parlor 
    db $00,$04,$11,$26,$01,$02 
    dw $8000 
    dw DoorASM_Scroll_6_Green 

Door_WestOcean_0:
    dw RoomHeader_Moat 
    db $00,$05,$1E,$06,$01,$00 
    dw $8000,$0000 

Door_WestOcean_1:
    dw RoomHeader_WreckedShipEntrance 
    db $50,$04,$01,$06,$00,$00 
    dw $8000 
    dw DoorASM_StartWreckedShipTreadmillWestEntrance 

Door_WestOcean_2:
    dw RoomHeader_BowlingAlleyPath 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_WestOcean_3:
    dw RoomHeader_Attic 
    db $40,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_WestOcean_4:
    dw RoomHeader_BowlingAlley 
    db $40,$04,$21,$06,$02,$00 
    dw $8000 
    dw DoorASM_Scroll_8_9_A_B_Red 

Door_WestOcean_5:
    dw RoomHeader_GravitySuit 
    db $40,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_BowlingAlleyPath_0:
    dw RoomHeader_WestOcean 
    db $00,$05,$2E,$26,$02,$02 
    dw $8000,$0000 

Door_BowlingAlleyPath_1:
    dw RoomHeader_PreBowling 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_CrateriaKihunter_0:
    dw RoomHeader_CrateriaTube 
    db $00,$01,$00,$00,$00,$00 
    dw $8000,$0000 

Door_CrateriaKihunter_1:
    dw RoomHeader_Moat 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_CrateriaKihunter_2:
    dw RoomHeader_RedBinstarElev 
    db $00,$06,$06,$02,$00,$00 
    dw $8000,$0000 

Door_ForgottenHighwayElev_0:
    dw RoomHeader_ForgottenHighwayElbow 
    db $00,$07,$06,$0D,$00,$00 
    dw $01C0,$0000 

Door_ForgottenHighwayElev_1:
    dw RoomHeader_MaridiaElev 
    db $D0,$02,$00,$00,$00,$00 
    dw $0000,$0000 

Door_EastOcean_0:
    dw RoomHeader_ElectricDeath 
    db $40,$05,$0E,$16,$00,$01 
    dw $8000,$0000 

Door_EastOcean_1:
    dw RoomHeader_ForgottenHighwayKagos 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_ForgottenHighwayKagos_0:
    dw RoomHeader_EastOcean 
    db $00,$05,$6E,$46,$06,$04 
    dw $8000,$0000 

Door_ForgottenHighwayKagos_1:
    dw RoomHeader_CrabMaze 
    db $00,$06,$36,$02,$03,$00 
    dw $8000,$0000 

Door_CrabMaze_0:
    dw RoomHeader_ForgottenHighwayKagos 
    db $00,$07,$06,$3D,$00,$03 
    dw $01C0,$0000 

Door_ForgottenHighwayElbow_0:
    dw RoomHeader_CrabMaze 
    db $00,$04,$01,$16,$00,$01 
    dw $8000,$0000 

Door_CrabMaze_1:
    dw RoomHeader_ForgottenHighwayElbow 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_ForgottenHighwayElbow_1:
    dw RoomHeader_ForgottenHighwayElev 
    db $00,$06,$06,$02,$00,$00 
    dw $8000,$0000 

Door_CrateriaTube_0:
    dw RoomHeader_LandingSite 
    db $00,$05,$8E,$46,$08,$04 
    dw $8000,$0000 

Door_CrateriaTube_1:
    dw RoomHeader_CrateriaKihunter 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_Moat_0:
    dw RoomHeader_CrateriaKihunter 
    db $00,$05,$2E,$06,$02,$00 
    dw $8000,$0000 

Door_Moat_1:
    dw RoomHeader_WestOcean 
    db $00,$04,$01,$46,$00,$04 
    dw $8000,$0000 

Door_RedBinstarElev_0:
    dw RoomHeader_CrateriaKihunter 
    db $00,$07,$16,$2D,$01,$02 
    dw $01C0 
    dw DoorASM_Scroll_1_4_Green 

Door_RedBinstarElev_1:
    dw RoomHeader_Caterpillar 
    db $E0,$02,$00,$00,$00,$00 
    dw $0000 
    dw DoorASM_Scroll_6_Green_duplicate 

Door_GauntletETank_0:
    dw RoomHeader_GauntletEntrance 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_GauntletETank_1:
    dw RoomHeader_GreenPiratesShaft 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000 
    dw DoorASM_Scroll_3_Green 

Door_PreBowling_0:
    dw RoomHeader_BowlingAlleyPath 
    db $00,$05,$1E,$06,$01,$00 
    dw $8000,$0000 

Door_PreBowling_1:
    dw RoomHeader_BowlingAlley 
    db $40,$04,$01,$16,$00,$01 
    dw $00A0 
    dw DoorASM_Scroll_2_3_4_5_B_C_D_11_Red 

Door_Climb_0:
    dw RoomHeader_Parlor 
    db $00,$07,$16,$4D,$01,$04 
    dw $01C0 
    dw DoorASM_Scroll_6_Green 

Door_Climb_1:
    dw RoomHeader_CrateriaSuper 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_Climb_2:
    dw RoomHeader_CrateriaSuper 
    db $00,$04,$01,$76,$00,$07 
    dw $8000,$0000 

Door_Climb_3:
    dw RoomHeader_Pit 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_Climb_4:
    dw RoomHeader_TourianEscape4 
    db $00,$05,$2E,$16,$02,$01 
    dw $8000,$0000 

Door_Pit_0:
    dw RoomHeader_Climb 
    db $00,$05,$1E,$86,$01,$08 
    dw $8000,$0000 

Door_Pit_1:
    dw RoomHeader_ElevToBlueBrinstar 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_ElevToBlueBrinstar_0:
    dw RoomHeader_Pit 
    db $00,$05,$2E,$06,$02,$00 
    dw $8000,$0000 

Door_ElevToBlueBrinstar_1:
    dw RoomHeader_MorphBall 
    db $F0,$02,$00,$00,$05,$00 
    dw $0000,$0000 

Door_BombTorizo_0:
    dw RoomHeader_Flyway 
    db $00,$05,$2E,$06,$02,$00 
    dw $8000,$0000 

Door_Flyway_0:
    dw RoomHeader_Parlor 
    db $00,$05,$3E,$26,$03,$02 
    dw $8000 
    dw DoorASM_Scroll_4_Red_8_Green 

Door_Flyway_1:
    dw RoomHeader_BombTorizo 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_PreMapFlyway_0:
    dw RoomHeader_Parlor 
    db $00,$05,$1E,$36,$01,$03 
    dw $8000 
    dw DoorASM_Scroll_6_Green 

Door_PreMapFlyway_1:
    dw RoomHeader_CrateriaMap 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_Terminator_0:
    dw RoomHeader_GreenPiratesShaft 
    db $00,$05,$0E,$46,$00,$04 
    dw $8000,$0000 

Door_Terminator_1:
    dw RoomHeader_Parlor 
    db $00,$04,$01,$06,$00,$00 
    dw $8000 
    dw DoorASM_Scroll_0_Blue 

Door_GreenBrinstarElev_:
    dw RoomHeader_LowerMushrooms 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_GreenBrinstarElev_1:
    dw RoomHeader_GreenBrinstarMainShaft 
    db $C0,$02,$00,$00,$00,$00 
    dw $0000 
    dw DoorASM_Scroll_1D_Blue 

Door_LowerMushrooms_0:
    dw RoomHeader_GreenPiratesShaft 
    db $00,$04,$01,$66,$00,$06 
    dw $8000,$0000 

Door_LowerMushrooms_1:
    dw RoomHeader_GreenBrinstarElev 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_CrateriaMap_0:
    dw RoomHeader_PreMapFlyway 
    db $00,$05,$2E,$06,$02,$00 
    dw $8000,$0000 

Door_GreenPiratesShaft_0:
    dw RoomHeader_Terminator 
    db $00,$04,$01,$26,$00,$02 
    dw $8000,$0000 

Door_GreenPiratesShaft_1:
    dw RoomHeader_LowerMushrooms 
    db $00,$05,$3E,$06,$03,$00 
    dw $8000,$0000 

Door_GreenPiratesShaft_2:
    dw RoomHeader_StatuesHallway 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_GreenPiratesShaft_3:
    dw RoomHeader_GauntletETank 
    db $00,$04,$01,$06,$00,$00 
    dw $8000 
    dw DoorASM_Scroll_4_Blue 

Door_CrateriaSuper_0:
    dw RoomHeader_Climb 
    db $00,$05,$2E,$06,$02,$00 
    dw $8000 
    dw DoorASM_Scroll_2_Blue 

Door_CrateriaSuper_1:
    dw RoomHeader_Climb 
    db $00,$05,$2E,$76,$02,$07 
    dw $8000 
    dw DoorASM_Scroll_17_Blue 

Door_FinalMissileBombway_0:
    dw RoomHeader_FinalMissile 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_FinalMissileBombway_1:
    dw RoomHeader_Parlor 
    db $00,$04,$11,$36,$01,$03 
    dw $8000 
    dw DoorASM_Scroll_6_Green 

Door_FinalMissile_0:
    dw RoomHeader_FinalMissileBombway 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_GreenBrinstarMainShaft_0:
    dw RoomHeader_GreenBrinstarElev 
    db $D0,$03,$00,$00,$00,$00 
    dw $0000 
    dw DoorASM_Scroll_2_Green 

Door_GreenBrinstarMainShaft_1:
    dw RoomHeader_BrinstarPreMap 
    db $00,$05,$2E,$06,$02,$00 
    dw $8000,$0000 

Door_GreenBrinstarMainShaft_2:
    dw RoomHeader_GreenBrinstarBeetoms 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_GreenBrinstarMainShaft_3:
    dw RoomHeader_GreenBrinstarFirefleas 
    db $00,$05,$2E,$06,$02,$00 
    dw $8000,$0000 

Door_GreenBrinstarMainShaft_4:
    dw RoomHeader_EarlySupers 
    db $00,$04,$01,$16,$00,$01 
    dw $8000,$0000 

Door_GreenBrinstarMainShaft_5:
    dw RoomHeader_Dachora 
    db $00,$04,$01,$06 
    dw $0000,$8000 
    dw DoorASM_Scroll_4_Red 

Door_GreenBrinstarMainShaft_6:
    dw RoomHeader_GreenBrinstarMainShaft 
    db $00,$04,$01,$76,$01,$07 
    dw $8000 
    dw DoorASM_Scroll_1D_Blue 

Door_GreenBrinstarMainShaft_7:
    dw RoomHeader_EtecoonETank 
    db $00,$05,$4E,$16,$04,$01 
    dw $8000 
    dw DoorASM_Scroll_5_6_Blue 

Door_GreenBrinstarMainShaft_8:
    dw RoomHeader_GreenBrinstarMainShaft 
    db $00,$05,$0E,$76,$00,$07 
    dw $8000 
    dw DoorASM_Scroll_18_1C_Green 

Door_GreenBrinstarMainShaft_A:
    dw RoomHeader_GreenBrinstarSave 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_SporeSpawnSuper_0:
    dw RoomHeader_SporeSpawnFarming 
    db $00,$05,$2E,$06,$02,$00 
    dw $8000,$0000 

Door_SporeSpawnSuper_1:
    dw RoomHeader_SporeSpawn 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_BrinstarPreMap_0:
    dw RoomHeader_GreenBrinstarMap 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_BrinstarPreMap_1:
    dw RoomHeader_GreenBrinstarMainShaft 
    db $00,$04,$01,$46,$00,$04 
    dw $8000,$0000 

Door_EarlySupers_0:
    dw RoomHeader_GreenBrinstarMainShaft 
    db $00,$05,$0E,$46,$00,$04 
    dw $8000,$0000 

Door_EarlySupers_1:
    dw RoomHeader_BrinstarReserveTank 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_BrinstarReserveTank_0:
    dw RoomHeader_EarlySupers 
    db $00,$05,$2E,$16,$02,$01 
    dw $8000,$0000 

Door_GreenBrinstarMap_0:
    dw RoomHeader_BrinstarPreMap 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_GreenBrinstarFirefleas_0:
    dw RoomHeader_GreenBrinstarMissileRefill 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_GreenBrinstarFirefleas_1:
    dw RoomHeader_GreenBrinstarMainShaft 
    db $00,$04,$01,$66,$00,$06 
    dw $8000,$0000 

Door_GreenBrinstarMissileRefill_0:
    dw RoomHeader_GreenBrinstarFirefleas 
    db $00,$04,$01,$16,$00,$01 
    dw $8000,$0000 

Door_Dachora_0:
    dw RoomHeader_GreenBrinstarMainShaft 
    db $00,$05,$0E,$66,$00,$06 
    dw $8000,$0000 

Door_Dachora_1:
    dw RoomHeader_BigPink 
    db $00,$04,$21,$26,$02,$02 
    dw $8000,$0000 

Door_Dachora_2:
    dw RoomHeader_DachoraEnergyRefill 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_BigPink_0:
    dw RoomHeader_SporeSpawnKihunters 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_BigPink_1:
    dw RoomHeader_Dachora 
    db $00,$05,$6E,$06,$06,$00 
    dw $8000,$0000 

Door_BigPink_2:
    dw RoomHeader_PinkBrinstarPowerBombs 
    db $00,$05,$1E,$16,$01,$01 
    dw $8000 
    dw DoorASM_Scroll_2_3_Green 

Door_BigPink_3:
    dw RoomHeader_GreenHillZone 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_BigPink_4:
    dw RoomHeader_BigPinkSaveRoom 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_BigPink_5:
    dw RoomHeader_PinkBrinstarPowerBombs 
    db $00,$01,$1E,$06,$01,$00 
    dw $8000,$0000 

Door_BigPink_6:
    dw RoomHeader_WaterwayETank 
    db $00,$05,$6E,$06,$06,$00 
    dw $8000,$0000 

Door_BigPink_7:
    dw RoomHeader_PinkBrinstarHoppers 
    db $00,$04,$01,$16,$00,$01 
    dw $8000,$0000 

Door_BigPink_8:
    dw RoomHeader_SporeSpawnFarming 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_SporeSpawnKihunters_0:
    dw RoomHeader_BigPink 
    db $00,$05,$3E,$06,$03,$00 
    dw $8000,$0000 

Door_SporeSpawnKihunters_1:
    dw RoomHeader_SporeSpawn 
    db $00,$07,$06,$2E,$00,$02 
    dw $8000,$0000 

Door_SporeSpawn_0:
    dw RoomHeader_SporeSpawnSuper 
    db $00,$04,$01,$06,$00,$00 
    dw $8000 
    dw DoorASM_Scroll_1_Blue_3_Red 

Door_SporeSpawn_1:
    dw RoomHeader_SporeSpawnKihunters 
    db $00,$06,$36,$03,$03,$00 
    dw $8000,$0000 

Door_PinkBrinstarPowerBombs_0:
    dw RoomHeader_BigPink 
    db $00,$00,$00,$00,$02,$03 
    dw $8000,$0000 

Door_PinkBrinstarPowerBombs_1:
    dw RoomHeader_BigPink 
    db $00,$04,$21,$46,$02,$04 
    dw $8000,$0000 

Door_GreenHillZone_0:
    dw RoomHeader_BigPink 
    db $00,$05,$3E,$66,$03,$06 
    dw $8000,$0000 

Door_GreenHillZone_1:
    dw RoomHeader_MorphBall 
    db $00,$04,$01,$26,$00,$02 
    dw $8000,$0000 

Door_GreenHillZone_2:
    dw RoomHeader_NoobBridge 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_MorphBall_0:
    dw RoomHeader_GreenHillZone 
    db $00,$05,$1E,$06,$01,$00 
    dw $8000,$0000 

Door_MorphBall_1:
    dw RoomHeader_ConstructionZone 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_MorphBall_2:
    dw RoomHeader_ElevToBlueBrinstar 
    db $E0,$03,$00,$00,$00,$00 
    dw $0000,$0000 

Door_ConstructionZone_0:
    dw RoomHeader_MorphBall 
    db $00,$05,$7E,$26,$07,$02 
    dw $8000,$0000 

Door_ConstructionZone_1:
    dw RoomHeader_BlueBrinstarETank 
    db $00,$04,$01,$26,$00,$02 
    dw $8000,$0000 

Door_ConstructionZone_2:
    dw RoomHeader_FirstMissile 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_BlueBrinstarETank_0:
    dw RoomHeader_ConstructionZone 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_BlueBrinstarETank_1:
    dw RoomHeader_BlueBrinstarBoulders 
    db $00,$05,$1E,$06,$01,$00 
    dw $8000,$0000 

Door_NoobBridge_0:
    dw RoomHeader_GreenHillZone 
    db $00,$05,$7E,$36,$07,$03 
    dw $8000,$0000 

Door_NoobBridge_1:
    dw RoomHeader_RedTower 
    db $00,$04,$01,$46,$00,$04 
    dw $8000,$0000 

Door_GreenBrinstarBeetoms_0:
    dw RoomHeader_GreenBrinstarMainShaft 
    db $00,$04,$01,$A6,$00,$0A 
    dw $8000 
    dw DoorASM_Scroll_18_1C_Green 

Door_GreenBrinstarBeetoms_1:
    dw RoomHeader_EtecoonETank 
    db $00,$05,$1E,$06,$01,$00 
    dw $8000,$0000 

Door_EtecoonETank_0:
    dw RoomHeader_GreenBrinstarBeetoms 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_EtecoonETank_1:
    dw RoomHeader_EtecoonSuper 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_EtecoonETank_2:
    dw RoomHeader_GreenBrinstarMainShaft 
    db $00,$04,$21,$B6,$02,$0B 
    dw $8000 
    dw DoorASM_Scroll_1D_Blue 

Door_EtecoonETank_3:
    dw RoomHeader_EtecoonSave 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_EtecoonSuper_0:
    dw RoomHeader_EtecoonETank 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_DachoraEnergyRefill_0:
    dw RoomHeader_Dachora 
    db $00,$04,$01,$66,$00,$06 
    dw $8000 
    dw DoorASM_Scroll_B_Green 

Door_SporeSpawnFarming_0:
    dw RoomHeader_SporeSpawnSuper 
    db $00,$04,$01,$86,$00,$08 
    dw $8000,$0000 

Door_SporeSpawnFarming_1:
    dw RoomHeader_BigPink 
    db $00,$05,$4E,$56,$04,$05 
    dw $8000 
    dw DoorASM_Scroll_Scroll_1C_Red_1D_Blue 

Door_WaterwayETank_0:
    dw RoomHeader_BigPink 
    db $00,$04,$01,$96,$00,$09 
    dw $8000 
    dw DoorASM_Scroll_20_24_25_Green 

Door_WaterwayETank_1:
    dw RoomHeader_KraidRefill 
    db $00,$06,$16,$03,$01,$00 
    dw $8000,$0000 

Door_FirstMissile_0:
    dw RoomHeader_ConstructionZone 
    db $00,$04,$01,$16 
    dw $0100,$8000 
    dw DoorASM_Scroll_0_Green_1_Blue 

Door_PinkBrinstarHoppers_0:
    dw RoomHeader_BigPink 
    db $00,$05,$3E,$46,$03,$04 
    dw $8000,$0000 

Door_PinkBrinstarHoppers_1:
    dw RoomHeader_HopperETank 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_HopperETank_0:
    dw RoomHeader_PinkBrinstarHoppers 
    db $00,$05,$1E,$16,$01,$01 
    dw $8000,$0000 

Door_BigPinkSaveRoom_0:
    dw RoomHeader_BigPink 
    db $00,$04,$11,$06,$01,$00 
    dw $8000 
    dw DoorASM_Scroll_1_Green 

Door_BlueBrinstarBoulders_0:
    dw RoomHeader_BlueBrinstarETank 
    db $00,$04,$21,$06,$02,$00 
    dw $8000 
    dw DoorASM_Scroll_2_Blue_duplicate 

Door_BlueBrinstarBoulders_1:
    dw RoomHeader_BillyMays 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_BillyMays_0:
    dw RoomHeader_BlueBrinstarBoulders 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_GreenBrinstarSave_0:
    dw RoomHeader_GreenBrinstarMainShaft 
    db $00,$04,$01,$56,$00,$05 
    dw $8000,$0000 

Door_EtecoonSave_0:
    dw RoomHeader_EtecoonETank 
    db $00,$04,$01,$16,$00,$01 
    dw $8000 
    dw DoorASM_Scroll_5_6_Blue 

Door_RedTower_0:
    dw RoomHeader_Hellway 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_RedTower_1:
    dw RoomHeader_NoobBridge 
    db $00,$05,$5E,$06,$05,$00 
    dw $8000,$0000 

Door_RedTower_2:
    dw RoomHeader_RedBrinstarFirefleas 
    db $00,$05,$7E,$06,$07,$00 
    dw $8000,$0000 

Door_RedTower_3:
    dw RoomHeader_SkreeBoost 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_RedTower_4:
    dw RoomHeader_RedTowerRefill 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_RedBrinstarFirefleas_0:
    dw RoomHeader_XrayScope 
    db $00,$05,$1E,$06,$01,$00 
    dw $8000,$0000 

Door_RedBrinstarFirefleas_1:
    dw RoomHeader_RedTower 
    db $00,$04,$01,$66,$00,$06 
    dw $8000,$0000 

Door_XrayScope_0:
    dw RoomHeader_RedBrinstarFirefleas 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_Hellway_0:
    dw RoomHeader_RedTower 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_Hellway_1:
    dw RoomHeader_Caterpillar 
    db $00,$04,$01,$56,$00,$05 
    dw $8000 
    dw DoorASM_Scroll_6_Green_duplicate_again 

Door_Caterpillar_0:
    dw RoomHeader_AlphaPowerBomb 
    db $00,$05,$2E,$06,$02,$00 
    dw $8000,$0000 

Door_Caterpillar_1:
    dw RoomHeader_BetaPowerBomb 
    db $00,$05,$1E,$06,$01,$00 
    dw $8000,$0000 

Door_Caterpillar_2:
    dw RoomHeader_Hellway 
    db $00,$05,$2E,$06,$02,$00 
    dw $8000,$0000 

Door_Caterpillar_3:
    dw RoomHeader_RedBinstarElev 
    db $F0,$03,$00,$00,$00,$00 
    dw $0000,$0000 

Door_Caterpillar_4:
    dw RoomHeader_RedFish 
    db $40,$04,$01,$06,$00,$00 
    dw $8000 
    dw DoorASM_Scroll_1_Blue_2_Red 

Door_Caterpillar_6:
    dw RoomHeader_RedBrinstarSave 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_BetaPowerBomb_0:
    dw RoomHeader_Caterpillar 
    db $00,$04,$01,$36,$00,$03 
    dw $8000,$0000 

Door_AlphaPowerBomb_0:
    dw RoomHeader_Caterpillar 
    db $00,$04,$01,$76,$00,$07 
    dw $8000 
    dw DoorASM_Scroll_F_12_Green 

Door_SkreeBoost_0:
    dw RoomHeader_RedTower 
    db $00,$05,$0E,$96,$00,$09 
    dw $8000 
    dw DoorASM_Scroll_6_7_Green 

Door_SkreeBoost_1:
    dw RoomHeader_BelowSpazer 
    db $00,$04,$01,$16,$00,$01 
    dw $8000,$0000 

Door_BelowSpazer_0:
    dw RoomHeader_SkreeBoost 
    db $00,$05,$1E,$06,$01,$00 
    dw $8000,$0000 

Door_BelowSpazer_1:
    dw RoomHeader_WestTunnel 
    db $40,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_BelowSpazer_2:
    dw RoomHeader_Spazer 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_Spazer_0:
    dw RoomHeader_BelowSpazer 
    db $00,$05,$1E,$06,$01,$00 
    dw $8000 
    dw DoorASM_Scroll_0_1_Green 

Door_WarehouseZeela_0:
    dw RoomHeader_WarehouseEntrance 
    db $00,$05,$2E,$06,$02,$00 
    dw $8000 
    dw DoorASM_Scroll_0_Red_1_Green 

Door_WarehouseZeela_1:
    dw RoomHeader_WarehouseETank 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_WarehouseZeela_2:
    dw RoomHeader_WarehouseKihunter 
    db $00,$07,$06,$0C,$00,$00 
    dw $0240,$0000 

Door_WarehouseETank_0:
    dw RoomHeader_WarehouseZeela 
    db $00,$04,$01,$16,$00,$01 
    dw $8000,$0000 

Door_WarehouseKihunter_0:
    dw RoomHeader_WarehouseZeela 
    db $00,$06,$16,$13,$01,$01 
    dw $01C0,$0000 

Door_WarehouseKihunter_1:
    dw RoomHeader_MiniKraid 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_WarehouseKihunter_2:
    dw RoomHeader_WarehouseSave 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_MiniKraid_0:
    dw RoomHeader_WarehouseKihunter 
    db $00,$05,$1E,$16,$01,$01 
    dw $8000,$0000 

Door_MiniKraid_1:
    dw RoomHeader_KraidEyeDoor 
    db $00,$04,$01,$16,$00,$01 
    dw $8000,$0000 

Door_KraidEyeDoor_0:
    dw RoomHeader_MiniKraid 
    db $00,$05,$5E,$06,$05,$00 
    dw $8000,$0000 

Door_KraidEyeDoor_1:
    dw RoomHeader_Kraid 
    db $00,$04,$01,$16,$00,$01 
    dw $8000,$0000 

Door_KraidEyeDoor_2:
    dw RoomHeader_KraidRefill 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_Kraid_0:
    dw RoomHeader_KraidEyeDoor 
    db $00,$05,$1E,$16,$01,$01 
    dw $8000,$0000 

Door_Kraid_1:
    dw RoomHeader_VariaSuit 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_StatuesHallway_0:
    dw RoomHeader_GreenPiratesShaft 
    db $00,$05,$0E,$66,$00,$06 
    dw $8000,$0000 

Door_StatuesHallway_1:
    dw RoomHeader_Statues 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_RedTowerRefill_0:
    dw RoomHeader_RedTower 
    db $00,$04,$01,$96,$00,$09 
    dw $8000 
    dw DoorASM_Scroll_6_7_Green 

Door_KraidRefill_0:
    dw RoomHeader_KraidEyeDoor 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000 
    dw DoorASM_Scroll_0_Green 

Door_Statues_0:
    dw RoomHeader_StatuesHallway 
    db $00,$05,$4E,$06,$04,$00 
    dw $8000,$0000 

Door_Statues_1:
    dw RoomHeader_TourianFirst 
    db $D0,$02,$00,$00,$00,$00 
    dw $0000,$0000 

Door_WarehouseEntrance_0:
    dw RoomHeader_EastTunnel 
    db $40,$05,$0E,$16,$00,$01 
    dw $8000 
    dw DoorASM_Scroll_0_Red_4_Blue 

Door_WarehouseEntrance_1:
    dw RoomHeader_WarehouseZeela 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_WarehouseEntrance_2:
    dw RoomHeader_BusinessCenter 
    db $C0,$02,$00,$00,$00,$00 
    dw $0000,$0000 

Door_VariaSuit_0:
    dw RoomHeader_Kraid 
    db $00,$05,$1E,$16,$01,$01 
    dw $8000,$0000 

Door_WarehouseSave_0:
    dw RoomHeader_WarehouseKihunter 
    db $00,$05,$3E,$06,$03,$00 
    dw $8000 
    dw DoorASM_Scroll_2_3_Blue 

Door_RedBrinstarSave_0:
    dw RoomHeader_Caterpillar 
    db $00,$05,$0E,$46,$00,$04 
    dw $8000,$0000 

Door_IceBeamAcid_0:
    dw RoomHeader_IceBeamGate 
    db $00,$04,$31,$26,$03,$02 
    dw $8000,$0000 

Door_IceBeamAcid_1:
    dw RoomHeader_IceBeamSnake 
    db $00,$05,$0E,$26,$00,$02 
    dw $8000,$0000 

Door_Cathedral_0:
    dw RoomHeader_CathedralEntrance 
    db $00,$05,$2E,$06,$02,$00 
    dw $8000,$0000 

Door_Cathedral_1:
    dw RoomHeader_RisingTide 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_CathedralEntrance_0:
    dw RoomHeader_BusinessCenter 
    db $00,$05,$0E,$36,$00,$03 
    dw $8000,$0000 

Door_CathedralEntrance_1:
    dw RoomHeader_Cathedral 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_BusinessCenter_0:
    dw RoomHeader_IceBeamGate 
    db $00,$05,$6E,$26,$06,$02 
    dw $8000,$0000 

Door_BusinessCenter_1:
    dw RoomHeader_CathedralEntrance 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_BusinessCenter_2:
    dw RoomHeader_HiJumpETank 
    db $00,$05,$1E,$06,$01,$00 
    dw $8000,$0000 

Door_BusinessCenter_3:
    dw RoomHeader_CrocomireEscape 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_BusinessCenter_4:
    dw RoomHeader_WarehouseEntrance 
    db $D0,$03,$00,$00,$00,$00 
    dw $0000,$0000 

Door_BusinessCenter_6:
    dw RoomHeader_FrogSave 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_BusinessCenter_7:
    dw RoomHeader_NorfairMap 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_IceBeamGate_0:
    dw RoomHeader_IceBeamTutorial 
    db $00,$05,$1E,$06,$01,$00 
    dw $8000,$0000 

Door_IceBeamGate_1:
    dw RoomHeader_IceBeamAcid 
    db $00,$05,$1E,$06,$01,$00 
    dw $8000,$0000 

Door_IceBeamGate_2:
    dw RoomHeader_BusinessCenter 
    db $00,$04,$01,$36,$00,$03 
    dw $8000,$0000 

Door_IceBeamGate_3:
    dw RoomHeader_CrumbleShaft 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_IceBeamTutorial_0:
    dw RoomHeader_IceBeamSnake 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_IceBeamTutorial_1:
    dw RoomHeader_IceBeamGate 
    db $00,$04,$31,$06,$03,$00 
    dw $8000 
    dw DoorASM_Scroll_A_Green 

Door_IceBeam_0:
    dw RoomHeader_IceBeamSnake 
    db $00,$05,$1E,$16,$01,$01 
    dw $8000 
    dw DoorASM_Scroll_2_Red_3_Blue 

Door_IceBeamSnake_0:
    dw RoomHeader_IceBeamAcid 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_IceBeamSnake_1:
    dw RoomHeader_IceBeamTutorial 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_IceBeamSnake_2:
    dw RoomHeader_IceBeam 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_CrumbleShaft_0:
    dw RoomHeader_IceBeamGate 
    db $00,$04,$01,$36,$00,$03 
    dw $8000 
    dw DoorASM_Scroll_18_Blue 

Door_CrumbleShaft_1:
    dw RoomHeader_CrocomireSpeedway 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_CrocomireSpeedway_0:
    dw RoomHeader_CrumbleShaft 
    db $00,$05,$0E,$36,$00,$03 
    dw $8000,$0000 

Door_CrocomireSpeedway_1:
    dw RoomHeader_CrocomireEscape 
    db $00,$05,$3E,$16,$03,$01 
    dw $8000,$0000 

Door_CrocomireSpeedway_2:
    dw RoomHeader_CrocomireSave 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_CrocomireSpeedway_3:
    dw RoomHeader_AcidSnakesTunnel 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_CrocomireSpeedway_4:
    dw RoomHeader_Crocomire 
    db $00,$06,$36,$02,$03,$00 
    dw $8000,$0000 

Door_Crocomire_0:
    dw RoomHeader_PostCrocFarming 
    db $00,$05,$1E,$06,$01,$00 
    dw $8000,$0000 

Door_Crocomire_1:
    dw RoomHeader_CrocomireSpeedway 
    db $00,$07,$C6,$2D,$0C,$02 
    dw $01C0,$0000 

Door_HiJumpBoots_0:
    dw RoomHeader_HiJumpETank 
    db $00,$04,$01,$16,$00,$01 
    dw $8000 
    dw DoorASM_Scroll_0_2_Green 

Door_CrocomireEscape_0:
    dw RoomHeader_BusinessCenter 
    db $00,$05,$0E,$66,$00,$06 
    dw $8000,$0000 

Door_CrocomireEscape_1:
    dw RoomHeader_CrocomireSpeedway 
    db $00,$04,$C1,$06,$0C,$00 
    dw $8000,$0000 

Door_HiJumpETank_0:
    dw RoomHeader_BusinessCenter 
    db $00,$04,$01,$56,$00,$05 
    dw $8000,$0000 

Door_HiJumpETank_1:
    dw RoomHeader_HiJumpBoots 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_PostCrocFarming_0:
    dw RoomHeader_Crocomire 
    db $00,$04,$01,$06,$00,$00 
    dw $8000 
    dw DoorASM_Scroll_0_1_Blue 

Door_PostCrocFarming_1:
    dw RoomHeader_PostCrocPowerBombs 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_PostCrocFarming_2:
    dw RoomHeader_PostCrocShaft 
    db $00,$06,$06,$02,$00,$00 
    dw $8000,$0000 

Door_PostCrocFarming_3:
    dw RoomHeader_PostCrocSave 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_PostCrocSave_0:
    dw RoomHeader_PostCrocFarming 
    db $00,$05,$1E,$16,$01,$01 
    dw $8000,$0000 

Door_PostCrocPowerBombs_0:
    dw RoomHeader_PostCrocFarming 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_PostCrocShaft_0:
    dw RoomHeader_PostCrocFarming 
    db $00,$07,$06,$1D,$00,$01 
    dw $01C0,$0000 

Door_PostCrocShaft_1:
    dw RoomHeader_GrappleTutorial3 
    db $00,$05,$2E,$06,$02,$00 
    dw $8000,$0000 

Door_PostCrocShaft_2:
    dw RoomHeader_PostCrocMissile 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_PostCrocShaft_3:
    dw RoomHeader_PostCrocJump 
    db $00,$06,$66,$22,$06,$02 
    dw $0140,$0000 

Door_PostCrocMissile_0:
    dw RoomHeader_PostCrocShaft 
    db $00,$05,$0E,$36,$00,$03 
    dw $8000,$0000 

Door_GrappleTutorial3_0:
    dw RoomHeader_GrappleTutorial2 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_GrappleTutorial3_1:
    dw RoomHeader_PostCrocShaft 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_PostCrocJump_0:
    dw RoomHeader_PostCrocShaft 
    db $00,$07,$06,$4D,$00,$04 
    dw $01C0,$0000 

Door_PostCrocJump_1:
    dw RoomHeader_GrappleBeam 
    db $00,$05,$0E,$26,$00,$02 
    dw $8000,$0000 

Door_GrappleTutorial2_0:
    dw RoomHeader_GrappleTutorial1 
    db $00,$05,$1E,$06,$01,$00 
    dw $8000,$0000 

Door_GrappleTutorial2_1:
    dw RoomHeader_GrappleTutorial3 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_GrappleTutorial1_0:
    dw RoomHeader_GrappleBeam 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_GrappleTutorial1_1:
    dw RoomHeader_GrappleTutorial2 
    db $00,$04,$01,$26,$00,$02 
    dw $8000,$0000 

Door_GrappleBeam_0:
    dw RoomHeader_PostCrocJump 
    db $00,$04,$01,$16,$00,$01 
    dw $8000,$0000 

Door_GrappleBeam_1:
    dw RoomHeader_GrappleTutorial1 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_NorfairReserveTank:
    dw RoomHeader_GreenBubblesMissiles 
    db $00,$04,$01,$06,$00,$00 
    dw $8000 
    dw DoorASM_Scroll_0_Blue_duplicate 

Door_GreenBubblesMissiles_0:
    dw RoomHeader_BubbleMountain 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_GreenBubblesMissiles_1:
    dw RoomHeader_NorfairReserveTank 
    db $00,$05,$1E,$06,$01,$00 
    dw $8000,$0000 

Door_BubbleMountain_0:
    dw RoomHeader_GreenBubblesMissiles 
    db $00,$05,$1E,$06,$01,$00 
    dw $8000,$0000 

Door_BubbleMountain_1:
    dw RoomHeader_RisingTide 
    db $00,$05,$4E,$06,$04,$00 
    dw $8000,$0000 

Door_BubbleMountain_2:
    dw RoomHeader_UpperNorfairFarming 
    db $00,$05,$1E,$06,$01,$00 
    dw $8000,$0000 

Door_BubbleMountain_3:
    dw RoomHeader_PurpleShaft 
    db $00,$06,$06,$02,$00,$00 
    dw $8000 
    dw DoorASM_Scroll_0_Blue_1_Red_duplicate 

Door_BubbleMountain_4:
    dw RoomHeader_SingleChamber 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_BubbleMountain_5:
    dw RoomHeader_BatCave 
    db $00,$04,$01,$16,$00,$01 
    dw $8000,$0000 

Door_BubbleMountain_6:
    dw RoomHeader_BubbleMountainSave 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_SpeedBoosterHall_0:
    dw RoomHeader_BatCave 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000 
    dw DoorASM_Scroll_0_Blue_1_Red 

Door_SpeedBoosterHall_1:
    dw RoomHeader_SpeedBooster 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_SpeedBooster_0:
    dw RoomHeader_SpeedBoosterHall 
    db $00,$05,$BE,$16,$0B,$01 
    dw $8000,$0000 

Door_SingleChamber_0:
    dw RoomHeader_BubbleMountain 
    db $00,$05,$1E,$16,$01,$01 
    dw $8000,$0000 

Door_SingleChamber_1:
    dw RoomHeader_DoubleChamber 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_SingleChamber_2:
    dw RoomHeader_DoubleChamber 
    db $00,$04,$01,$16,$00,$01 
    dw $8000,$0000 

Door_SingleChamber_3:
    dw RoomHeader_SpikyPlatformsTunnel 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_SingleChamber_4:
    dw RoomHeader_ThreeMusketeers 
    db $00,$04,$11,$06,$01,$00 
    dw $8000,$0000 

Door_DoubleChamber_0:
    dw RoomHeader_SingleChamber 
    db $00,$05,$0E,$16,$00,$01 
    dw $8000,$0000 

Door_DoubleChamber_1:
    dw RoomHeader_SingleChamber 
    db $00,$05,$0E,$26,$00,$02 
    dw $8000,$0000 

Door_DoubleChamber_2:
    dw RoomHeader_WaveBeam 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_WaveBeam_0:
    dw RoomHeader_DoubleChamber 
    db $00,$05,$3E,$06,$03,$00 
    dw $8000,$0000 

Door_SpikyPlatformsTunnel_0:
    dw RoomHeader_SingleChamber 
    db $00,$05,$0E,$36,$00,$03 
    dw $8000,$0000 

Door_SpikyPlatformsTunnel_1:
    dw RoomHeader_Volcano 
    db $00,$04,$21,$06,$02,$00 
    dw $8000,$0000 

Door_Volcano_0:
    dw RoomHeader_SpikyPlatformsTunnel 
    db $00,$05,$3E,$06,$03,$00 
    dw $8000,$0000 

Door_Volcano_1:
    dw RoomHeader_KronicBoost 
    db $00,$05,$1E,$06,$01,$00 
    dw $8000,$0000 

Door_KronicBoost_0:
    dw RoomHeader_MagdolliteTunnel 
    db $00,$05,$2E,$06,$02,$00 
    dw $8000,$0000 

Door_KronicBoost_1:
    dw RoomHeader_Volcano 
    db $00,$04,$01,$26,$00,$02 
    dw $8000 
    dw DoorASM_Scroll_6_7_Blue_8_Red 

Door_KronicBoost_2:
    dw RoomHeader_LavaDive 
    db $00,$05,$3E,$06,$03,$00 
    dw $8000,$0000 

Door_KronicBoost_3:
    dw RoomHeader_SpikyAcidSnakesTunnel 
    db $00,$05,$3E,$06,$03,$00 
    dw $8000,$0000 

Door_MagdolliteTunnel_0:
    dw RoomHeader_PurpleShaft 
    db $00,$05,$0E,$26,$00,$02 
    dw $8000,$0000 

Door_MagdolliteTunnel_1:
    dw RoomHeader_KronicBoost 
    db $00,$04,$11,$06,$01,$00 
    dw $8000,$0000 

Door_PurpleShaft_0:
    dw RoomHeader_BubbleMountain 
    db $00,$07,$06,$3D,$00,$03 
    dw $01C0,$0000 

Door_PurpleShaft_1:
    dw RoomHeader_MagdolliteTunnel 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_PurpleShaft_2:
    dw RoomHeader_PurpleFarming 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_LavaDive_0:
    dw RoomHeader_KronicBoost 
    db $00,$04,$11,$26,$01,$02 
    dw $8000,$0000 

Door_LavaDive_1:
    dw RoomHeader_LowerNorfairElev 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_LowerNorfairElev_0:
    dw RoomHeader_LavaDive 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_LowerNorfairElev_1:
    dw RoomHeader_MainHall 
    db $A0,$02,$00,$00,$04,$00 
    dw $0000,$0000 

Door_LowerNorfairElev_3:
    dw RoomHeader_LNElevSave 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_UpperNorfairFarming_0:
    dw RoomHeader_FrogSpeedway 
    db $00,$05,$7E,$06,$07,$00 
    dw $8000,$0000 

Door_UpperNorfairFarming_1:
    dw RoomHeader_BubbleMountain 
    db $00,$04,$01,$36,$00,$03 
    dw $8000,$0000 

Door_UpperNorfairFarming_2:
    dw RoomHeader_RedPirateShaft 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_RisingTide_0:
    dw RoomHeader_Cathedral 
    db $00,$05,$2E,$16,$02,$01 
    dw $8000,$0000 

Door_RisingTide_1:
    dw RoomHeader_BubbleMountain 
    db $00,$04,$01,$26,$00,$02 
    dw $8000,$0000 

Door_AcidSnakesTunnel_0:
    dw RoomHeader_CrocomireSpeedway 
    db $00,$05,$CE,$26,$0C,$02 
    dw $8000,$0000 

Door_AcidSnakesTunnel_1:
    dw RoomHeader_UpperNorfairRefill 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_AcidSnakesTunnel_2:
    dw RoomHeader_RedPirateShaft 
    db $00,$07,$06,$2D,$00,$02 
    dw $0200,$0000 

Door_SpikyAcidSnakesTunnel_0:
    dw RoomHeader_UpperNorfairRefill 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_SpikyAcidSnakesTunnel_1:
    dw RoomHeader_KronicBoost 
    db $00,$04,$01,$16,$00,$01 
    dw $8000 
    dw DoorASM_Scroll_2_Blue_3_Red 

Door_UpperNorfairRefill_0:
    dw RoomHeader_AcidSnakesTunnel 
    db $00,$05,$3E,$06,$03,$00 
    dw $8000,$0000 

Door_UpperNorfairRefill_1:
    dw RoomHeader_SpikyAcidSnakesTunnel 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_PurpleFarming_0:
    dw RoomHeader_PurpleShaft 
    db $00,$05,$0E,$16,$00,$01 
    dw $8000,$0000 

Door_BatCave_0:
    dw RoomHeader_BubbleMountain 
    db $00,$05,$1E,$06,$01,$00 
    dw $8000,$0000 

Door_BatCave_1:
    dw RoomHeader_SpeedBoosterHall 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_NorfairMap_0:
    dw RoomHeader_BusinessCenter 
    db $00,$04,$01,$46,$00,$04 
    dw $8000,$0000 

Door_BubbleMountainSave_0:
    dw RoomHeader_BubbleMountain 
    db $00,$04,$01,$16,$00,$01 
    dw $8000,$0000 

Door_FrogSpeedway_0:
    dw RoomHeader_FrogSave 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_FrogSpeedway_1:
    dw RoomHeader_UpperNorfairFarming 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_RedPirateShaft_0:
    dw RoomHeader_UpperNorfairFarming 
    db $00,$04,$01,$16,$00,$01 
    dw $8000,$0000 

Door_RedPirateShaft_1:
    dw RoomHeader_AcidSnakesTunnel 
    db $00,$06,$36,$02,$03,$00 
    dw $0140,$0000 

Door_FrogSave_0:
    dw RoomHeader_FrogSpeedway 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_FrogSave_1:
    dw RoomHeader_BusinessCenter 
    db $00,$05,$0E,$56,$00,$05 
    dw $8000,$0000 

Door_CrocomireSave_0:
    dw RoomHeader_CrocomireSpeedway 
    db $00,$05,$AE,$16,$0C,$01 
    dw $8000,$0000 

Door_LNElevSave_0:
    dw RoomHeader_LowerNorfairElev 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_AcidStatue_0:
    dw RoomHeader_GoldenTorizo 
    db $00,$04,$01,$06,$00,$00 
    dw $8000 
    dw DoorASM_Scroll_0_Blue_1_2_3_Red 

Door_AcidStatue_1:
    dw RoomHeader_MainHall 
    db $00,$04,$01,$26,$00,$02 
    dw $8000,$0000 

Door_MainHall_0:
    dw RoomHeader_AcidStatue 
    db $00,$05,$1E,$06,$01,$00 
    dw $8000,$0000 

Door_MainHall_1:
    dw RoomHeader_FastPillarsSetup 
    db $00,$04,$01,$16,$00,$01 
    dw $8000,$0000 

Door_MainHall_2:
    dw RoomHeader_LowerNorfairElev 
    db $B0,$03,$00,$00,$00,$00 
    dw $0000,$0000 

Door_GoldenTorizo_0:
    dw RoomHeader_AcidStatue 
    db $00,$05,$2E,$26,$02,$02 
    dw $8000 
    dw DoorASM_Scroll_3_4_Red_6_7_8_Blue 

Door_GoldenTorizo_1:
    dw RoomHeader_ScrewAttack 
    db $00,$04,$01,$26,$00,$02 
    dw $8000,$0000 

Door_FastRipper_0:
    dw RoomHeader_ScrewAttack 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_FastRipper_1:
    dw RoomHeader_FastPillarsSetup 
    db $00,$04,$01,$26,$00,$02 
    dw $8000 
    dw DoorASM_Scroll_1_Red_2_Blue 

Door_GTEnergyRefill_0:
    dw RoomHeader_ScrewAttack 
    db $00,$05,$0E,$16,$00,$01 
    dw $8000,$0000 

Door_Ridley_0:
    dw RoomHeader_RidleyETank 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_Ridley_1:
    dw RoomHeader_LNFarming 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_LNFarming_0:
    dw RoomHeader_Ridley 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_LNFarming_1:
    dw RoomHeader_Plowerhouse 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_FastPillarsSetup_0:
    dw RoomHeader_MainHall 
    db $00,$05,$7E,$26,$07,$02 
    dw $8000,$0000 

Door_FastPillarsSetup_1:
    dw RoomHeader_MickeyMouse 
    db $00,$04,$01,$36,$00,$03 
    dw $8000,$0000 

Door_FastPillarsSetup_2:
    dw RoomHeader_MainHall 
    db $00,$05,$7E,$26,$07,$02 
    dw $8000,$0000 

Door_FastPillarsSetup_3:
    dw RoomHeader_FastRipper 
    db $00,$05,$3E,$06,$03,$00 
    dw $8000,$0000 

Door_FastPillarsSetup_4:
    dw RoomHeader_Pillar 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Door_83991E:
    dw RoomHeader_FastPillarsSetup 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 
endif ; !FEATURE_KEEP_UNREFERENCED

Door_MickeyMouse_0:
    dw RoomHeader_FastPillarsSetup 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_MickeyMouse_1:
    dw RoomHeader_WorstRoomInTheGame 
    db $00,$04,$01,$06,$00,$00 
    dw $8000 
    dw DoorASM_Scroll_0_Green_duplicate 

Door_Pillar_0:
    dw RoomHeader_FastPillarsSetup 
    db $00,$05,$0E,$26,$00,$02 
    dw $8000 
    dw DoorASM_Scroll_1_Red_2_Blue 

Door_Pillar_1:
    dw RoomHeader_WorstRoomInTheGame 
    db $00,$04,$01,$56,$00,$05 
    dw $8000,$0000 

Door_Plowerhouse_0:
    dw RoomHeader_LNFarming 
    db $00,$05,$2E,$06,$02,$00 
    dw $8000,$0000 

Door_Plowerhouse_1:
    dw RoomHeader_MetalPirates 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_WorstRoomInTheGame_0:
    dw RoomHeader_MickeyMouse 
    db $00,$05,$3E,$06,$03,$00 
    dw $8000 
    dw DoorASM_Scroll_E_Red 

Door_WorstRoomInTheGame_1:
    dw RoomHeader_Amphitheatre 
    db $00,$04,$01,$16,$00,$01 
    dw $8000,$0000 

Door_WorstRoomInTheGame_2:
    dw RoomHeader_Pillar 
    db $00,$05,$3E,$06,$03,$00 
    dw $8000,$0000 

Door_Amphitheatre_0:
    dw RoomHeader_WorstRoomInTheGame 
    db $00,$05,$0E,$16,$00,$01 
    dw $8000,$0000 

Door_Amphitheatre_1:
    dw RoomHeader_RedKihunterShaft 
    db $00,$04,$01,$06,$00,$00 
    dw $8000 
    dw DoorASM_Scroll_0_Blue_3_Red 

Door_LNSpringBallMaze_0:
    dw RoomHeader_ThreeMusketeers 
    db $00,$05,$3E,$26,$03,$02 
    dw $8000,$0000 

Door_LNSpringBallMaze_1:
    dw RoomHeader_LNFireflea 
    db $00,$04,$01,$06,$00,$00 
    dw $8000 
    dw DoorASM_Scroll_0_1_Blue_4_Red 

Door_LNSpringBallMaze_2:
    dw RoomHeader_LNEscapePowerBombs 
    db $00,$06,$06,$02,$00,$00 
    dw $8000,$0000 

Door_LNEscapePowerBombs_0:
    dw RoomHeader_LNFireflea 
    db $00,$05,$1E,$06,$01,$00 
    dw $8000 
    dw DoorASM_Scroll_1_Blue_4_Red 

Door_LNEscapePowerBombs_1:
    dw RoomHeader_LNSpringBallMaze 
    db $00,$07,$46,$0D,$04,$00 
    dw $01C0 
    dw DoorASM_Scroll_1_2_3_Blue_4_Green_6_Red 

Door_RedKihunterShaft_0:
    dw RoomHeader_Wasteland 
    db $00,$06,$56,$02,$05,$00 
    dw $8000,$0000 

Door_RedKihunterShaft_1:
    dw RoomHeader_Amphitheatre 
    db $00,$05,$3E,$06,$03,$00 
    dw $8000,$0000 

Door_RedKihunterShaft_2:
    dw RoomHeader_LNFireflea 
    db $00,$04,$11,$36,$01,$03 
    dw $8000,$0000 

Door_RedKihunterShaft_3:
    dw RoomHeader_LNSave 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_Wasteland_0:
    dw RoomHeader_MetalPirates 
    db $00,$05,$2E,$06,$02,$00 
    dw $8000,$0000 

Door_Wasteland_1:
    dw RoomHeader_RedKihunterShaft 
    db $00,$07,$26,$4D,$02,$04 
    dw $0200,$0000 

Door_MetalPirates_0:
    dw RoomHeader_Plowerhouse 
    db $00,$05,$2E,$06,$02,$00 
    dw $8000,$0000 

Door_MetalPirates_1:
    dw RoomHeader_Wasteland 
    db $00,$04,$11,$26,$01,$02 
    dw $8000 
    dw DoorASM_Scroll_7_Green 

Door_ThreeMusketeers_0:
    dw RoomHeader_SingleChamber 
    db $00,$05,$5E,$06,$05,$00 
    dw $8000,$0000 

Door_ThreeMusketeers_1:
    dw RoomHeader_LNSpringBallMaze 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_RidleyETank_0:
    dw RoomHeader_Ridley 
    db $00,$04,$01,$16,$00,$01 
    dw $8000,$0000 

Door_ScrewAttack_0:
    dw RoomHeader_FastRipper 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_ScrewAttack_1:
    dw RoomHeader_GTEnergyRefill 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_ScrewAttack_2:
    dw RoomHeader_GoldenTorizo 
    db $00,$05,$1E,$16,$01,$01 
    dw $8000,$0000 

Door_LNFireflea_0:
    dw RoomHeader_LNSpringBallMaze 
    db $00,$05,$1E,$16,$01,$01 
    dw $8000,$0000 

Door_LNFireflea_1:
    dw RoomHeader_LNEscapePowerBombs 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_LNFireflea_2:
    dw RoomHeader_RedKihunterShaft 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000 
    dw DoorASM_Scroll_0_Blue_3_Red_duplicate 

Door_LNSave_0:
    dw RoomHeader_RedKihunterShaft 
    db $00,$05,$0E,$36,$00,$03 
    dw $8000,$0000 


; FX format
;        _____________________________ 0: Door pointer
;       |      _______________________ 2: Base Y position
;       |     |      _________________ 4: Target Y position
;       |     |     |      ___________ 6: Y velocity
;       |     |     |     |
;       dddd, bbbb, tttt, vvvv
;        _____________________________ 8: Timer
;       |    _________________________ 9: Type (foreground layer 3)
;       |   |    _____________________ Ah: Default layer blending configuration (FX A)
;       |   |   |    _________________ Bh: FX layer 3 layer blending configuration (FX B)
;       |   |   |   |    _____________ Ch: FX liquid options (FX C)
;       |   |   |   |   |    _________ Dh: Palette FX bitset
;       |   |   |   |   |   |    _____ Eh: Animated tiles bitset
;       |   |   |   |   |   |   |    _ Fh: Palette blend
;       |   |   |   |   |   |   |   |
;       tt, ff, AA, BB, CC, pp, aa, bb
FXHeader_BowlingAlley_State1:
    dw $0000,$01B0,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$01,$0B,$00 

FXHeader_WreckedShipEntrance_State1:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$01,$00,$00 

FXHeader_Attic_State1:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$01,$10,$00 

FXHeader_AssemblyLine_State1:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$01,$18,$00 

FXHeader_WreckedShipMainShaft_State1:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$01,$06,$00 

FXHeader_SpikyDeath_State1:
    dw $0000,$00A8,$FFFF,$0000 
    db $00,$06,$02,$18,$03,$01,$0A,$48 

FXHeader_ElectricDeath_State1:
    dw $0000,$02A8,$FFFF,$0000 
    db $00,$06,$02,$18,$03,$01,$02,$48 

FXHeader_WreckedShipETank_State1:
    dw $0000,$00B0,$FFFF,$0000 
    db $00,$06,$02,$18,$83,$01,$06,$48 

FXHeader_Basement_State1:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$01,$00,$00 

FXHeader_WreckedShipMap_State1:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$00,$00,$00 

FXHeader_Phantoon_State1:
    dw $FFFF 

FXHeader_SpongeBath_State1:
    dw $0000,$00A8,$FFFF,$0000 
    db $00,$06,$02,$18,$03,$00,$00,$48 

FXHeader_WSWestSuper_State1:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$01,$00,$00 

FXHeader_WSEastSuper_State1:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$01,$09,$00 

FXHeader_GravitySuit_State1_WreckedShipSave_State1:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$01,$00,$00 

FXHeader_BowlingAlley_State0:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$28,$02,$00,$00,$00,$00 

FXHeader_WreckedShipEntrance_State0:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$00,$00,$00 

FXHeader_Attic_State0:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$08,$02,$00,$00,$00,$00 

FXHeader_AssemblyLine_State0:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$00,$00,$00 

FXHeader_WreckedShipMainShaft_State0:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$08,$02,$00,$00,$00,$00 

FXHeader_SpikyDeath_State0:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$00,$00,$00 

FXHeader_ElectricDeath_State0:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$00,$00,$00 

FXHeader_WreckedShipETank_State0:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$00,$00,$00 

FXHeader_Basement_State0:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$28,$02,$00,$00,$00,$00 

FXHeader_WreckedShipMap_State0:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$08,$02,$00,$00,$00,$00 

FXHeader_Phantoon_State0:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$00,$00,$00 

FXHeader_SpongeBath_State0:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$00,$00,$00 

FXHeader_WSWestSuper_State0:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$00,$00,$00 

FXHeader_VariousRooms_State0_839C74:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$00,$00,$00 

FXHeader_GlassTunnelSave:
    dw $0000,$0010,$FFFF,$0000 
    db $00,$06,$02,$14,$82,$00,$00,$E2 

FXHeader_GlassTunnel_State0_1:
    dw $0000,$0010,$FFFF,$0000 
    db $00,$06,$02,$14,$84,$00,$00,$E2 

FXHeader_WestTunnel:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$2A,$02,$00,$00,$00,$00 

FXHeader_EastTunnel:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$2A,$02,$00,$00,$00,$00 

FXHeader_MainStreet:
    dw $0000,$0010,$FFFF,$0000 
    db $00,$06,$02,$14,$83,$00,$00,$E2 

FXHeader_FishTank:
    dw $0000,$0010,$FFFF,$0000 
    db $00,$06,$02,$14,$83,$00,$00,$E2 

FXHeader_MamaTurtle:
    dw $0000,$02BA,$FFFF,$0000 
    db $00,$06,$02,$14,$80,$00,$00,$E2 

FXHeader_CrabTunnel:
    dw $0000,$0010,$FFFF,$0000 
    db $00,$06,$02,$14,$80,$00,$00,$E2 

FXHeader_MtEverest:
    dw $0000,$0010,$FFFF,$0000 
    db $00,$06,$02,$14,$83,$00,$00,$E2 

FXHeader_RedFish:
    dw $0000,$0180,$FFFF,$0000 
    db $00,$06,$02,$14,$81,$00,$00,$E2 

FXHeader_WateringHole:
    dw $0000,$01B5,$FFFF,$0000 
    db $00,$06,$02,$14,$83,$00,$00,$42 

FXHeader_NWestMaridiaBug:
    dw $0000,$01B5,$FFFF,$0000 
    db $00,$06,$02,$14,$83,$00,$00,$42 

FXHeader_CrabShaft:
    dw $0000,$0010,$FFFF,$0000 
    db $00,$06,$02,$14,$81,$00,$00,$E2 

FXHeader_PseudoPlasmaSpark:
    dw $0000,$01B5,$FFFF,$0000 
    db $00,$06,$02,$14,$83,$00,$00,$42 

FXHeader_CrabHole:
    dw $0000,$0010,$FFFF,$0000 
    db $00,$06,$02,$14,$80,$00,$00,$E2 

FXHeader_WestSandHallTunnel:
    dw $0000,$0010,$FFFF,$0000 
    db $00,$06,$02,$14,$80,$00,$00,$E2 

FXHeader_PlasmaTutorial:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$28,$02,$00,$00,$00,$42 

FXHeader_Plasma:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$2A,$02,$00,$00,$00,$42 

FXHeader_ThreadTheNeedle:
    dw $0000,$00B5,$FFFF,$0000 
    db $00,$06,$02,$14,$83,$00,$00,$42 

FXHeader_MaridiaElev:
    dw $0000,$05B5,$FFFF,$0000 
    db $00,$06,$02,$14,$83,$00,$02,$42 

FXHeader_PlasmaSpark:
    dw $0000,$03B4,$FFFF,$0000 
    db $00,$06,$02,$14,$83,$00,$00,$42 

FXHeader_Kassiuz:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$28,$02,$00,$00,$00,$42 

FXHeader_MaridiaMap:
    dw $0000,$0010,$FFFF,$0000 
    db $00,$06,$02,$14,$82,$00,$00,$E2 

FXHeader_ForgottenHighwaySave:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$00,$00,$42 

FXHeader_Toilet:
    dw Door_PlasmaSpark_1 
    dw $0080,$FFFF,$0000 
    db $00,$06,$02,$14,$85,$00,$00,$E8 
    dw Door_Oasis_2 
    dw $0080,$FFFF,$0000 
    db $00,$06,$02,$14,$85,$00,$00,$E8 
    dw $0000,$0080,$FFFF,$0000 
    db $00,$06,$02,$14,$81,$00,$00,$E8 

FXHeader_BugSandHole:
    dw $0000,$00B5,$FFFF,$0000 
    db $00,$06,$02,$14,$83,$01,$00,$42 

FXHeader_WestSandHall:
    dw $0000,$0010,$FFFF,$0000 
    db $00,$06,$02,$14,$82,$01,$0C,$E8 

FXHeader_Oasis:
    dw $0000,$0010,$FFFF,$0000 
    db $00,$06,$02,$14,$82,$01,$00,$E8 

FXHeader_EastSandHall:
    dw $0000,$0010,$FFFF,$0000 
    db $00,$06,$02,$14,$82,$01,$0C,$E8 

FXHeader_WestSandHole:
    dw $0000,$00D6,$FFFF,$0000 
    db $00,$06,$02,$14,$03,$01,$0C,$EE 

FXHeader_EastSandHole:
    dw $0000,$00D6,$FFFF,$0000 
    db $00,$06,$02,$14,$03,$01,$0C,$EE 

FXHeader_EastAqueductQuicksand_WestAqueductQuicksand:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$2A,$02,$00,$02,$00,$00 

FXHeader_Aqueduct:
    dw $0000,$0010,$FFFF,$0000 
    db $00,$06,$02,$14,$83,$01,$00,$EE 

FXHeader_Butterfly:
    dw $0000,$0049,$FFFF,$0000 
    db $00,$06,$02,$14,$83,$01,$0C,$42 

FXHeader_BotwoonHallway:
    dw $0000,$0010,$FFFF,$0000 
    db $00,$06,$02,$14,$83,$00,$00,$EE 

FXHeader_Pants:
    dw $0000,$02B0,$FFFF,$0000 
    db $00,$06,$02,$14,$82,$01,$00,$E8 

FXHeader_EastPants:
    dw $0000,$00B0,$FFFF,$0000 
    db $00,$06,$02,$14,$82,$01,$00,$E8 

FXHeader_Springball:
    dw $0000,$00B0,$FFFF,$0000 
    db $00,$06,$02,$14,$82,$01,$00,$E8 

FXHeader_BelowBotwoonETank:
    dw $0000,$0048,$FFFF,$0000 
    db $00,$06,$02,$14,$03,$01,$0C,$EE 

FXHeader_Colosseum:
    dw $0000,$0117,$FFFF,$0000 
    db $00,$06,$02,$16,$01,$05,$02,$EE 

FXHeader_AqueductSave:
    dw $0000,$0010,$FFFF,$0000 
    db $00,$06,$02,$14,$82,$02,$00,$42 

FXHeader_ThePrecious_State0_1:
    dw $0000,$00BF,$FFFF,$0000 
    db $00,$06,$02,$14,$83,$00,$00,$EE 

FXHeader_BotwoonETank:
    dw $0000,$0010,$FFFF,$0000 
    db $00,$06,$02,$14,$83,$01,$00,$EE 

FXHeader_DraygonSave:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$00,$00,$EE 

FXHeader_MaridiaMissileRefill:
    dw $0000,$0000,$FFFF,$0000 
    db $00,$06,$02,$14,$03,$00,$00,$EE 

FXHeader_PlasmaBeachQuicksand_BotwoonQuicksand:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$2A,$02,$00,$02,$00,$00 

FXHeader_Shaktool_State0_1:
    dw $0000,$00B0,$FFFF,$0000 
    db $00,$06,$02,$14,$82,$00,$00,$E8 

FXHeader_HalfieClimb:
    dw $0000,$0135,$FFFF,$0000 
    db $00,$06,$02,$16,$03,$04,$02,$EE 

FXHeader_Botwoon_State0_1:
    dw $0000,$0010,$FFFF,$0000 
    db $00,$06,$02,$14,$83,$02,$00,$EE 

FXHeader_SpaceJump:
    dw $0000,$0010,$FFFF,$0000 
    db $00,$06,$02,$14,$83,$00,$00,$EE 

FXHeader_MaridiaEnergyRefill:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$00,$00,$EE 

FXHeader_WestCactusAlley:
    dw $0000,$00B9,$FFFF,$0000 
    db $00,$06,$02,$14,$83,$00,$00,$EE 

FXHeader_EastCactusAlley:
    dw $0000,$0135,$FFFF,$0000 
    db $00,$06,$02,$16,$01,$04,$02,$EE 

FXHeader_Draygon_State0_1:
    dw $0000,$0010,$FFFF,$0000 
    db $00,$06,$02,$14,$81,$00,$00,$42 

FXHeader_TourianFirst:
    dw $0000,$03BC,$FFFF,$0000 
    db $00,$04,$02,$1E,$01,$02,$00,$02 

FXHeader_Metroids1_State0_1:
    dw $0000,$00D0,$FFFF,$0000 
    db $10,$04,$02,$1E,$01,$02,$00,$02 

FXHeader_Metroids2_State0_1:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$02,$00,$00 

FXHeader_Metroids3_State0_1:
    dw $0000,$00D0,$FFFF,$0000 
    db $10,$04,$02,$1E,$01,$02,$00,$02 

FXHeader_Metroids4_State0_1:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$02,$00,$00 

FXHeader_BlueHopper_State0_1:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$02,$00,$00 

FXHeader_DustTorizo_State0_1:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$02,$00,$00 

FXHeader_BigBoy_State0_1:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$02,$00,$00 

FXHeader_Seaweed:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$02,$00,$00 

FXHeader_TourianRecharge:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$00,$00,$00 

FXHeader_MotherBrain_State0_1:
    dw $0000,$00E8,$FFFF,$0000 
    db $10,$04,$02,$1E,$01,$02,$00,$02 

FXHeader_SetByMotherBrain_0:
    dw $0000,$00E8,$00B8,$FFF0 
    db $10,$04,$02,$1E,$01,$02,$00,$02 

FXHeader_SetByMotherBrain_1:
    dw $0000,$00B8,$00E8,$0030 
    db $10,$04,$02,$1E,$01,$02,$00,$02 

FXHeader_TourianEyeDoor:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$02,$00,$00 

FXHeader_RinkaShaft:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$02,$00,$00 

FXHeader_MotherBrainSave:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$00,$00,$00 

FXHeader_TourianEscape1:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$78,$00,$00 

FXHeader_TourianEscape2:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$70,$00,$00 

FXHeader_TourianEscape3:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$00,$02,$02,$00,$70,$00,$00 

FXHeader_ToruianEscaper4:
    dw $0000,$05E0,$0010,$0000 
    db $40,$04,$02,$1E,$01,$70,$02,$00 

FXHeader_UpperTourianSave:
    dw $FFFF 

FXHeader_CeresElev_State0_1:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$2A,$02,$02,$00,$00,$00,$00 

FXHeader_FallingTile_State0:
    dw $FFFF 

FXHeader_MagnetStairs_State0:
    dw $FFFF 

FXHeader_DeadScientist_State0:
    dw $FFFF 

FXHeader_58Escape_State0:
    dw $FFFF 

FXHeader_CeresRidley_State0:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$28,$02,$02,$00,$00,$00,$00 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_FXHeader_83A16E:
    dw $0000,$FFFF,$FFFF,$0000 
    db $00,$2A,$02,$02,$00,$00,$00,$00 
endif ; !FEATURE_KEEP_UNREFERENCED

FXHeader_FallingTile_State1:
    dw $FFFF 

FXHeader_MagnetStairs_State1:
    dw $FFFF 

FXHeader_DeadScientist_State1:
    dw $FFFF 

FXHeader_58Escape_State1:
    dw $FFFF 

FXHeader_CeresRidley_State1:
    dw $FFFF 

FXHeader_Debug_MotherBrain_State2:
    dw $FFFF 

Door_MaridiaElev_3_TourianFirst_2:
    dw $0000 


; Door header format
;        _____________________________ 0: Destination room header pointer (bank $8F)
;       |     ________________________ 2: Elevator properties
;       |    |   _____________________ 3: Direction
;       |    |  |   __________________ 4: Doorcap X position in blocks
;       |    |  |  |   _______________ 5: Doorcap Y position in blocks
;       |    |  |  |  |   ____________ 6: X screen
;       |    |  |  |  |  |   _________ 7: Y screen
;       |    |  |  |  |  |  |   ______ 8: Distance from door to spawn Samus
;       |    |  |  |  |  |  |  |     _ Ah: Custom door ASM to execute (bank $8F)
;       |    |  |  |  |  |  |  |    |
;       rrrr ee oo xx yy XX YY dddd aaaa
Door_BowlingAlley_0:
    dw RoomHeader_WestOcean 
    db $40,$05,$7E,$16,$07,$01 
    dw $8000,$0000 

Door_BowlingAlley_1:
    dw RoomHeader_PreBowling 
    db $40,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_BowlingAlley_2:
    dw RoomHeader_GravitySuit 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_WreckedShipEntrance_0:
    dw RoomHeader_WestOcean 
    db $40,$05,$7E,$46,$07,$04 
    dw $8000,$0000 

Door_WreckedShipEntrance_1:
    dw RoomHeader_WreckedShipMainShaft 
    db $00,$04,$41,$36,$04,$03 
    dw $8000,$0000 

Door_Attic_0:
    dw RoomHeader_WreckedShipMainShaft 
    db $00,$06,$46,$02,$04,$00 
    dw $8000,$0000 

Door_Attic_1:
    dw RoomHeader_AssemblyLine 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_Attic_2:
    dw RoomHeader_WestOcean 
    db $40,$05,$7E,$06,$07,$00 
    dw $8000,$0000 

Door_AssemblyLine_0:
    dw RoomHeader_Attic 
    db $00,$05,$6E,$06,$06,$00 
    dw $8000,$0000 

Door_WreckedShipMainShaft_0:
    dw RoomHeader_WreckedShipEntrance 
    db $00,$05,$3E,$06,$03,$00 
    dw $8000 
    dw DoorASM_StartWreckedShipTreadmillEastEntrance 

Door_WreckedShipMainShaft_1:
    dw RoomHeader_SpongeBath 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_WreckedShipMainShaft_2:
    dw RoomHeader_WSWestSuper 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_WreckedShipMainShaft_3:
    dw RoomHeader_Basement 
    db $00,$06,$26,$02,$02,$00 
    dw $8000,$0000 

Door_WreckedShipMainShaft_4:
    dw RoomHeader_Attic 
    db $00,$07,$46,$0E,$04,$00 
    dw $01C0,$0000 

Door_WreckedShipMainShaft_5:
    dw RoomHeader_WSEastSuper 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_WreckedShipMainShaft_6:
    dw RoomHeader_WreckedShipSave 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_SpikyDeath_0:
    dw RoomHeader_SpongeBath 
    db $00,$05,$1E,$06,$01,$00 
    dw $8000 
    dw DoorASM_Scroll_1_Blue 

Door_SpikyDeath_1:
    dw RoomHeader_ElectricDeath 
    db $00,$04,$01,$26,$00,$02 
    dw $8000,$0000 

Door_ElectricDeath_0:
    dw RoomHeader_EastOcean 
    db $40,$04,$01,$46,$00,$04 
    dw $8000,$0000 

Door_ElectricDeath_1:
    dw RoomHeader_SpikyDeath 
    db $00,$05,$1E,$06,$01,$00 
    dw $8000,$0000 

Door_ElectricDeath_2:
    dw RoomHeader_WreckedShipETank 
    db $00,$05,$2E,$06,$02,$00 
    dw $8000,$0000 

Door_WreckedShipETank_0:
    dw RoomHeader_ElectricDeath 
    db $00,$04,$01,$06,$00,$00 
    dw $8000 
    dw DoorASM_Scroll_0_Green_duplicate_again 

Door_Basement_0:
    dw RoomHeader_WreckedShipMainShaft 
    db $00,$07,$46,$7D,$04,$07 
    dw $01C0 
    dw DoorASM_Scroll_28_2E_Green 

Door_Basement_1:
    dw RoomHeader_WreckedShipMap 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_Basement_2:
    dw RoomHeader_Phantoon 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_WreckedShipMap_0:
    dw RoomHeader_Basement 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_Phantoon_0:
    dw RoomHeader_Basement 
    db $00,$05,$4E,$06,$04,$00 
    dw $8000 
    dw DoorASM_Scroll_3_Red_4_Blue 

Door_SpongeBath_0:
    dw RoomHeader_WreckedShipMainShaft 
    db $00,$05,$4E,$46,$04,$04 
    dw $8000,$0000 

Door_SpongeBath_1:
    dw RoomHeader_SpikyDeath 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_WSWestSuper_0:
    dw RoomHeader_WreckedShipMainShaft 
    db $00,$04,$41,$66,$04,$06 
    dw $8000,$0000 

Door_WSEastSuper_0:
    dw RoomHeader_WreckedShipMainShaft 
    db $00,$05,$5E,$66,$05,$06 
    dw $8000 
    dw DoorASM_Scroll_29_Blue 

Door_GravitySuit_0:
    dw RoomHeader_WestOcean 
    db $40,$05,$5E,$36,$05,$03 
    dw $8000,$0000 

Door_GravitySuit_1:
    dw RoomHeader_BowlingAlley 
    db $00,$04,$11,$26,$01,$02 
    dw $8000 
    dw DoorASM_Scroll_6_7_8_9_A_B_Red 

Door_WreckedShipSave_0:
    dw RoomHeader_WreckedShipMainShaft 
    db $00,$05,$4E,$36,$04,$03 
    dw $8000,$0000 

Door_GlassTunnelSave_0:
    dw RoomHeader_GlassTunnel 
    db $00,$05,$0E,$26,$00,$02 
    dw $8000,$0000 

Door_GlassTunnel_0:
    dw RoomHeader_MainStreet 
    db $00,$07,$16,$7D,$01,$07 
    dw $0200,$0000 

Door_GlassTunnel_1:
    dw RoomHeader_WestTunnel 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_GlassTunnel_2:
    dw RoomHeader_EastTunnel 
    db $00,$04,$01,$16,$00,$01 
    dw $8000 
    dw DoorASM_Scroll_0_Red_4_Blue_duplicate 

Door_GlassTunnel_3:
    dw RoomHeader_GlassTunnelSave 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_WestTunnel_0:
    dw RoomHeader_GlassTunnel 
    db $00,$00,$00,$00,$00,$01 
    dw $8000 
    dw DoorASM_Scroll_0_2_Red_1_Blue 

Door_WestTunnel_1:
    dw RoomHeader_BelowSpazer 
    db $40,$05,$1E,$16,$01,$01 
    dw $8000,$0000 

Door_EastTunnel_0:
    dw RoomHeader_GlassTunnel 
    db $00,$01,$00,$00,$00,$01 
    dw $8000 
    dw DoorASM_Scroll_0_2_Red_1_Blue 

Door_EastTunnel_1:
    dw RoomHeader_WarehouseEntrance 
    db $40,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_EastTunnel_2:
    dw RoomHeader_CrabHole 
    db $00,$04,$01,$16,$00,$01 
    dw $8000 
    dw DoorASM_Scroll_0_Red_1_Blue 

Door_MainStreet_0:
    dw RoomHeader_GlassTunnel 
    db $00,$06,$06,$02,$00,$00 
    dw $0170,$0000 

Door_MainStreet_1:
    dw RoomHeader_CrabTunnel 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_MainStreet_2:
    dw RoomHeader_FishTank 
    db $00,$04,$01,$26,$00,$02 
    dw $8000,$0000 

Door_MainStreet_3:
    dw RoomHeader_MtEverest 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_MainStreet_4:
    dw RoomHeader_MtEverest 
    db $00,$00,$00,$00,$01,$02 
    dw $8000,$0000 

Door_FishTank_0:
    dw RoomHeader_MainStreet 
    db $00,$05,$2E,$66,$02,$06 
    dw $8000,$0000 

Door_FishTank_1:
    dw RoomHeader_MamaTurtle 
    db $00,$04,$01,$36,$00,$03 
    dw $8000,$0000 

Door_FishTank_2:
    dw RoomHeader_MtEverest 
    db $00,$07,$16,$3D,$01,$03 
    dw $01C0,$0000 

Door_FishTank_3:
    dw RoomHeader_MtEverest 
    db $00,$07,$46,$3D,$04,$03 
    dw $01C0,$0000 

Door_MamaTurtle_0:
    dw RoomHeader_FishTank 
    db $00,$05,$3E,$26,$03,$02 
    dw $8000,$0000 

Door_CrabTunnel_0:
    dw RoomHeader_MainStreet 
    db $00,$05,$1E,$76,$01,$07 
    dw $8000,$0000 

Door_CrabTunnel_1:
    dw RoomHeader_CrabHole 
    db $00,$00,$00,$00,$00,$00 
    dw $8000,$0000 

Door_MtEverest_0:
    dw RoomHeader_RedFish 
    db $00,$07,$26,$1D,$02,$01 
    dw $01C0,$0000 

Door_MtEverest_1:
    dw RoomHeader_MainStreet 
    db $00,$05,$1E,$06,$01,$00 
    dw $8000,$0000 

Door_MtEverest_2:
    dw RoomHeader_FishTank 
    db $00,$06,$06,$02,$00,$00 
    dw $8000,$0000 

Door_MtEverest_3:
    dw RoomHeader_FishTank 
    db $00,$06,$36,$02,$03,$00 
    dw $8000,$0000 

Door_MtEverest_4:
    dw RoomHeader_MainStreet 
    db $00,$01,$00,$00,$02,$02 
    dw $8000,$0000 

Door_MtEverest_5:
    dw RoomHeader_CrabShaft 
    db $00,$04,$01,$26,$00,$02 
    dw $8000,$0000 

Door_RedFish_0:
    dw RoomHeader_MtEverest 
    db $00,$06,$26,$02,$02,$00 
    dw $8000,$0000 

Door_RedFish_1:
    dw RoomHeader_Caterpillar 
    db $40,$05,$2E,$36,$02,$03 
    dw $8000 
    dw DoorASM_Scroll_9_Red_A_Blue 

Door_WateringHole_0:
    dw RoomHeader_NWestMaridiaBug 
    db $00,$04,$01,$06,$00,$00 
    dw $0140,$0000 

Door_NWestMaridiaBug_0:
    dw RoomHeader_WateringHole 
    db $00,$05,$1E,$06,$01,$00 
    dw $8000,$0000 

Door_NWestMaridiaBug_1:
    dw RoomHeader_PseudoPlasmaSpark 
    db $00,$04,$01,$16,$00,$01 
    dw $8000,$0000 

Door_CrabShaft_0:
    dw RoomHeader_MtEverest 
    db $00,$05,$5E,$06,$05,$00 
    dw $8000,$0000 

Door_CrabShaft_1:
    dw RoomHeader_PseudoPlasmaSpark 
    db $00,$07,$06,$2D,$00,$02 
    dw $01C0,$0000 

Door_CrabShaft_2:
    dw RoomHeader_Aqueduct 
    db $00,$04,$01,$16,$00,$01 
    dw $8000,$0000 

Door_PseudoPlasmaSpark_0:
    dw RoomHeader_NWestMaridiaBug 
    db $00,$05,$3E,$16,$03,$01 
    dw $8000,$0000 

Door_PseudoPlasmaSpark_1:
    dw RoomHeader_CrabShaft 
    db $00,$06,$06,$02,$00,$00 
    dw $8000,$0000 

Door_PseudoPlasmaSpark_2:
    dw RoomHeader_PlasmaSpark 
    db $00,$00,$00,$00,$00,$02 
    dw $8000,$0000 

Door_CrabHole_0:
    dw RoomHeader_CrabTunnel 
    db $00,$05,$3E,$06,$03,$00 
    dw $8000,$0000 

Door_CrabHole_1:
    dw RoomHeader_WestSandHallTunnel 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_CrabHole_2:
    dw RoomHeader_EastTunnel 
    db $00,$05,$3E,$06,$03,$00 
    dw $8000,$0000 

Door_CrabHole_3:
    dw RoomHeader_MaridiaMap 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_WestSandHallTunnel_0:
    dw RoomHeader_CrabHole 
    db $00,$01,$00,$00,$00,$00 
    dw $8000,$0000 

Door_WestSandHallTunnel_1:
    dw RoomHeader_WestSandHall 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_PlasmaTutorial_0:
    dw RoomHeader_Kassiuz 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_PlasmaTutorial_1:
    dw RoomHeader_Plasma 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_Plasma_0:
    dw RoomHeader_PlasmaTutorial 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_ThreadTheNeedle_0:
    dw RoomHeader_BugSandHole 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_ThreadTheNeedle_1:
    dw RoomHeader_MaridiaElev 
    db $00,$04,$01,$56,$00,$05 
    dw $8000,$0000 

Door_MaridiaElev_0:
    dw RoomHeader_ThreadTheNeedle 
    db $00,$05,$6E,$06,$06,$00 
    dw $8000,$0000 

Door_MaridiaElev_1:
    dw RoomHeader_ForgottenHighwaySave 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_MaridiaElev_2:
    dw RoomHeader_ForgottenHighwayElev 
    db $D0,$03,$00,$00,$00,$00 
    dw $0000,$0000 

Door_PlasmaSpark_0:
    dw RoomHeader_Butterfly 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_PlasmaSpark_1:
    dw RoomHeader_Toilet 
    db $00,$02,$00,$00,$00,$00 
    dw $8000 
    dw DoorASM_SetupElevatubeFromNorth 

Door_PlasmaSpark_2:
    dw RoomHeader_Kassiuz 
    db $00,$04,$01,$36,$00,$03 
    dw $8000,$0000 

Door_PlasmaSpark_3:
    dw RoomHeader_BugSandHole 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_Kassiuz_0:
    dw RoomHeader_PlasmaSpark 
    db $00,$05,$2E,$16,$02,$01 
    dw $8000,$0000 

Door_Kassiuz_1:
    dw RoomHeader_PlasmaTutorial 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_MaridiaMap_0:
    dw RoomHeader_CrabHole 
    db $00,$05,$0E,$16,$00,$01 
    dw $8000 
    dw DoorASM_Scroll_0_Red_1_Blue 

Door_ForgottenHighwaySave_0:
    dw RoomHeader_MaridiaElev 
    db $00,$05,$0E,$46,$00,$04 
    dw $8000,$0000 

Door_Toilet_0:
    dw RoomHeader_Oasis 
    db $00,$06,$06,$02,$00,$00 
    dw $8000 
    dw DoorASM_ResetElevatubeOnSouthExit 

Door_Toilet_1:
    dw RoomHeader_PlasmaSpark 
    db $00,$07,$06,$2D,$00,$02 
    dw $0200 
    dw DoorASM_ResetElevatubeOnNorthExit 

Door_BugSandHole_0:
    dw RoomHeader_ThreadTheNeedle 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_BugSandHole_1:
    dw RoomHeader_PlasmaBeachQuicksand 
    db $00,$02,$00,$00,$00,$00 
    dw $8000,$0000 

Door_BugSandHole_2:
    dw RoomHeader_PlasmaSpark 
    db $00,$05,$3E,$36,$03,$03 
    dw $8000,$0000 

Door_WestSandHall_0:
    dw RoomHeader_WestSandHallTunnel 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_WestSandHall_1:
    dw RoomHeader_Oasis 
    db $00,$04,$01,$16,$00,$01 
    dw $8000,$0000 

UNUSED_Door_WestSandHall_2_83A654:
    dw RoomHeader_WestSandHole 
    db $00,$03,$00,$00,$00,$01 
    dw $8000,$0000 

Door_Oasis_0:
    dw RoomHeader_WestSandHall 
    db $00,$05,$3E,$06,$03,$00 
    dw $8000,$0000 

Door_Oasis_1:
    dw RoomHeader_EastSandHall 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_Oasis_2:
    dw RoomHeader_Toilet 
    db $00,$03,$00,$00,$00,$09 
    dw $8000 
    dw DoorASM_SetupElevatubeFromSouth 

Door_EastSandHall_0:
    dw RoomHeader_Oasis 
    db $00,$05,$0E,$16,$00,$01 
    dw $8000,$0000 

Door_EastSandHall_1:
    dw RoomHeader_Pants 
    db $00,$04,$01,$36,$00,$03 
    dw $8000 
    dw DoorASM_Scroll_4_Red_duplicate 

UNUSED_Door_EastSandHall_2_83A69C:
    dw RoomHeader_EastSandHole 
    db $00,$03,$00,$00,$01,$01 
    dw $8000,$0000 

Door_WestSandHole_0:
    dw RoomHeader_WestAqueductQuicksand 
    db $00,$03,$00,$00,$00,$01 
    dw $8000,$0000 

Door_WestSandHole_1:
    dw RoomHeader_WestSandHall 
    db $00,$02,$00,$00,$02,$00 
    dw $8000,$0000 

Door_EastSandHole_0:
    dw RoomHeader_EastAqueductQuicksand 
    db $00,$03,$00,$00,$00,$01 
    dw $8000,$0000 

Door_EastSandHole_1:
    dw RoomHeader_EastSandHall 
    db $00,$02,$00,$00,$01,$00 
    dw $8000,$0000 

Door_WestAqueductQuicksand_0:
    dw RoomHeader_Aqueduct 
    db $00,$03,$00,$00,$01,$02 
    dw $8000,$0000 

Door_WestAqueductQuicksand_1:
    dw RoomHeader_WestSandHole 
    db $00,$02,$00,$00,$01,$00 
    dw $8000,$0000 

Door_EastAqueductQuicksand_0:
    dw RoomHeader_Aqueduct 
    db $00,$03,$00,$00,$03,$02 
    dw $8000,$0000 

Door_EastAqueductQuicksand_1:
    dw RoomHeader_EastSandHole 
    db $00,$02,$00,$00,$00,$00 
    dw $8000,$0000 

Door_Aqueduct_0:
    dw RoomHeader_CrabShaft 
    db $00,$05,$1E,$36,$01,$03 
    dw $8000 
    dw DoorASM_Scroll_6_Blue 

Door_Aqueduct_1:
    dw RoomHeader_WestAqueductQuicksand 
    db $00,$02,$00,$00,$00,$00 
    dw $8000,$0000 

Door_Aqueduct_2:
    dw RoomHeader_EastAqueductQuicksand 
    db $00,$02,$00,$00,$00,$00 
    dw $8000,$0000 

Door_Aqueduct_3:
    dw RoomHeader_BotwoonHallway 
    db $00,$07,$06,$0D,$00,$00 
    dw $01C0,$0000 

Door_Aqueduct_4:
    dw RoomHeader_BelowBotwoonETank 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_Aqueduct_5:
    dw RoomHeader_AqueductSave 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_Butterfly_0:
    dw RoomHeader_PlasmaSpark 
    db $00,$05,$3E,$56,$03,$05 
    dw $8000,$0000 

Door_Butterfly_1:
    dw RoomHeader_WestCactusAlley 
    db $00,$04,$01,$16,$00,$01 
    dw $8000,$0000 

Door_BotwoonHallway_0:
    dw RoomHeader_Aqueduct 
    db $00,$06,$06,$02,$00,$00 
    dw $8000,$0000 

Door_BotwoonHallway_1:
    dw RoomHeader_Botwoon 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_Pants_0:
    dw RoomHeader_EastSandHall 
    db $00,$05,$2E,$06,$02,$00 
    dw $8000,$0000 

Door_Pants_1:
    dw RoomHeader_EastPants 
    db $00,$04,$01,$26,$00,$02 
    dw $8000,$0000 

Door_Pants_2:
    dw RoomHeader_Shaktool 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_Pants_3:
    dw RoomHeader_Pants 
    db $00,$05,$0E,$36,$00,$03 
    dw $8000 
    dw DoorASM_Scroll_4_7_Red 

Door_EastPants_0:
    dw RoomHeader_Pants 
    db $00,$05,$0E,$36,$00,$03 
    dw $8000 
    dw DoorASM_Scroll_4_Red_duplicate 

Door_EastPants_1:
    dw RoomHeader_Shaktool 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_Springball_0:
    dw RoomHeader_Shaktool 
    db $00,$05,$3E,$06,$03,$00 
    dw $8000,$0000 

Door_BelowBotwoonETank_0:
    dw RoomHeader_Aqueduct 
    db $00,$05,$5E,$16,$05,$01 
    dw $8000,$0000 

Door_Colosseum_0:
    dw RoomHeader_HalfieClimb 
    db $00,$01,$00,$00,$00,$00 
    dw $8000,$0000 

Door_Colosseum_1:
    dw RoomHeader_DraygonSave 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_Colosseum_2:
    dw RoomHeader_ThePrecious 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Door_83A804:
    dw RoomHeader_HalfieClimb 
    db $00,$01,$00,$00,$00,$02 
    dw $8000,$0000 

UNUSED_Door_83A810:
    dw RoomHeader_MaridiaMissileRefill 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 
endif ; !FEATURE_KEEP_UNREFERENCED

Door_ThePrecious_MaridiaLoad11:
    dw RoomHeader_ThePrecious 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_AqueductSave_0:
    dw RoomHeader_Aqueduct 
    db $00,$04,$01,$26,$00,$02 
    dw $8000,$0000 

Door_ThePrecious_0:
    dw RoomHeader_Colosseum 
    db $00,$05,$6E,$16,$06,$01 
    dw $8000,$0000 

Door_ThePrecious_1:
    dw RoomHeader_Draygon 
    db $00,$05,$1E,$06,$01,$00 
    dw $8000,$0000 

Door_BotwoonETank_0:
    dw RoomHeader_Botwoon 
    db $00,$05,$1E,$06,$01,$00 
    dw $8000 
    dw DoorASM_Scroll_1_Blue_duplicate 

Door_BotwoonETank_1:
    dw RoomHeader_BotwoonQuicksand 
    db $00,$02,$00,$00,$01,$00 
    dw $8000,$0000 

Door_BotwoonETank_2:
    dw RoomHeader_BotwoonQuicksand 
    db $00,$02,$00,$00,$00,$00 
    dw $8000,$0000 

Door_BotwoonETank_3:
    dw RoomHeader_HalfieClimb 
    db $00,$04,$01,$26,$00,$02 
    dw $8000,$0000 

Door_DraygonSave_0:
    dw RoomHeader_MaridiaEnergyRefill 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_DraygonSave_1:
    dw RoomHeader_Colosseum 
    db $00,$05,$6E,$06,$06,$00 
    dw $8000,$0000 

Door_MaridiaMissileRefill_0:
    dw RoomHeader_HalfieClimb 
    db $00,$05,$4E,$26,$04,$02 
    dw $8000 
    dw DoorASM_Scroll_A_Red_B_Blue 

Door_PlasmaBeachQuicksand_0:
    dw RoomHeader_Butterfly 
    db $00,$02,$00,$00,$00,$00 
    dw $8000,$0000 

Door_BotwoonQuicksand_0:
    dw RoomHeader_BelowBotwoonETank 
    db $00,$02,$00,$00,$02,$00 
    dw $8000,$0000 

Door_BotwoonQuicksand_1:
    dw RoomHeader_BelowBotwoonETank 
    db $00,$02,$00,$00,$03,$00 
    dw $8000,$0000 

Door_Shaktool_0:
    dw RoomHeader_EastPants 
    db $00,$05,$0E,$16,$00,$01 
    dw $8000 
    dw DoorASM_Scroll_1_Blue_2_Red_duplicate 

Door_Shaktool_1:
    dw RoomHeader_Springball 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_HalfieClimb_0:
    dw RoomHeader_BotwoonETank 
    db $00,$05,$6E,$06,$06,$00 
    dw $8000,$0000 

Door_HalfieClimb_1:
    dw RoomHeader_Colosseum 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_HalfieClimb_2:
    dw RoomHeader_MaridiaMissileRefill 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_HalfieClimb_3:
    dw RoomHeader_EastCactusAlley 
    db $00,$05,$4E,$16,$04,$01 
    dw $8000,$0000 

Door_Botwoon_0:
    dw RoomHeader_BotwoonHallway 
    db $00,$05,$3E,$06,$03,$00 
    dw $8000,$0000 

Door_Botwoon_1:
    dw RoomHeader_BotwoonETank 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_SpaceJump_0:
    dw RoomHeader_Draygon 
    db $00,$04,$01,$16,$00,$01 
    dw $8000,$0000 

Door_MaridiaEnergyRefill_0:
    dw RoomHeader_DraygonSave 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_WestCactusAlley_0:
    dw RoomHeader_Butterfly 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_WestCactusAlley_1:
    dw RoomHeader_EastCactusAlley 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_EastCactusAlley_0:
    dw RoomHeader_WestCactusAlley 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_EastCactusAlley_1:
    dw RoomHeader_HalfieClimb 
    db $00,$04,$01,$16,$00,$01 
    dw $8000,$0000 

Door_Draygon_0:
    dw RoomHeader_ThePrecious 
    db $00,$04,$01,$26,$00,$02 
    dw $8000 
    dw DoorASM_Scroll_0_2_Green_duplicate 

Door_Draygon_1:
    dw RoomHeader_SpaceJump 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_TourianFirst_0:
    dw RoomHeader_Metroids1 
    db $00,$05,$5E,$06,$05,$00 
    dw $8000,$0000 

Door_TourianFirst_1:
    dw RoomHeader_Statues 
    db $D0,$03,$00,$00,$00,$01 
    dw $0000 
    dw DoorASM_Scroll_0_1_Green_duplicate 

Door_TourianFirst_3:
    dw RoomHeader_UpperTourianSave 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_Metroids1_0:
    dw RoomHeader_TourianFirst 
    db $00,$04,$01,$36,$00,$03 
    dw $8000,$0000 

Door_Metroids1_1:
    dw RoomHeader_Metroids2 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_Metroids2_0:
    dw RoomHeader_Metroids1 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_Metroids2_1:
    dw RoomHeader_Metroids3 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_Metroids3_0:
    dw RoomHeader_Metroids2 
    db $00,$05,$0E,$16,$00,$01 
    dw $8000,$0000 

Door_Metroids3_1:
    dw RoomHeader_Metroids4 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_Metroids4_0:
    dw RoomHeader_Metroids3 
    db $00,$05,$5E,$06,$05,$00 
    dw $8000,$0000 

Door_Metroids4_1:
    dw RoomHeader_BlueHopper 
    db $00,$06,$16,$03,$01,$00 
    dw $8000,$0000 

Door_BlueHopper_0:
    dw RoomHeader_Metroids4 
    db $00,$07,$06,$1E,$00,$01 
    dw $01C0,$0000 

Door_BlueHopper_1:
    dw RoomHeader_DustTorizo 
    db $00,$05,$1E,$06,$01,$00 
    dw $8000,$0000 

Door_DustTorizo_0:
    dw RoomHeader_BlueHopper 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_DustTorizo_1:
    dw RoomHeader_BigBoy 
    db $00,$05,$3E,$06,$03,$00 
    dw $8000,$0000 

Door_BigBoy_0:
    dw RoomHeader_DustTorizo 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_BigBoy_1:
    dw RoomHeader_Seaweed 
    db $00,$01,$00,$00,$00,$00 
    dw $8000,$0000 

Door_Seaweed_0:
    dw RoomHeader_BigBoy 
    db $00,$00,$00,$00,$00,$00 
    dw $8000,$0000 

Door_Seaweed_1:
    dw RoomHeader_TourianEyeDoor 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_Seaweed_2:
    dw RoomHeader_TourianRecharge 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_TourianRecharge_0:
    dw RoomHeader_Seaweed 
    db $00,$04,$01,$16,$00,$01 
    dw $8000,$0000 

Door_MotherBrain_0:
    dw RoomHeader_RinkaShaft 
    db $00,$04,$01,$26,$00,$02 
    dw $8000,$0000 

Door_MotherBrain_1:
    dw RoomHeader_TourianEscape1 
    db $00,$09,$1F,$06,$01,$00 
    dw $8000,$0000 

Door_TourianEyeDoor_0:
    dw RoomHeader_Seaweed 
    db $00,$05,$0E,$16,$00,$01 
    dw $8000,$0000 

Door_TourianEyeDoor_1:
    dw RoomHeader_RinkaShaft 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_RinkaShaft_0:
    dw RoomHeader_TourianEyeDoor 
    db $00,$05,$3E,$06,$03,$00 
    dw $8000,$0000 

Door_RinkaShaft_1:
    dw RoomHeader_MotherBrainSave 
    db $00,$05,$0E,$06,$00,$00 
    dw $8000,$0000 

Door_RinkaShaft_2:
    dw RoomHeader_MotherBrain 
    db $00,$05,$3E,$06,$03,$00 
    dw $8000,$0000 

Door_MotherBrainSave_0:
    dw RoomHeader_RinkaShaft 
    db $00,$04,$01,$16,$00,$01 
    dw $8000,$0000 

Door_TourianEscape1_0:
    dw RoomHeader_MotherBrain 
    db $00,$04,$01,$06,$00,$00 
    dw $8000,$0000 

Door_TourianEscape1_1:
    dw RoomHeader_TourianEscape2 
    db $00,$06,$06,$03,$00,$00 
    dw $8000,$0000 

Door_TourianEscape2_0:
    dw RoomHeader_TourianEscape1 
    db $00,$07,$06,$0C,$00,$00 
    dw $0200,$0000 

Door_TourianEscape2_1:
    dw RoomHeader_TourianEscape3 
    db $00,$04,$01,$16,$00,$01 
    dw $8000,$0000 

Door_TourianEscape3_0:
    dw RoomHeader_TourianEscape2 
    db $00,$05,$0E,$16,$00,$01 
    dw $8000,$0000 

Door_TourianEscape3_1:
    dw RoomHeader_TourianEscape4 
    db $00,$04,$01,$36,$00,$03 
    dw $8000,$0000 

Door_TourianEscape4_0:
    dw RoomHeader_TourianEscape3 
    db $00,$05,$5E,$06,$05,$00 
    dw $8000,$0000 

Door_TourianEscape4_1:
    dw RoomHeader_Climb 
    db $40,$04,$01,$86,$00,$08 
    dw $8000 
    dw DoorASM_Scroll_8_Blue_9_Red 

Door_UpperTourianSave_0:
    dw RoomHeader_TourianFirst 
    db $00,$05,$0E,$36,$00,$03 
    dw $8000,$0000 

Door_CeresElev_0:
    dw RoomHeader_FallingTile 
    db $00,$00,$00,$00,$00,$00 
    dw $8000 
    dw DoorASM_FromCeresElevatorShaft 

Door_FallingTile_0:
    dw RoomHeader_CeresElev 
    db $00,$01,$00,$00,$00,$02 
    dw $8000 
    dw DoorASM_ToCeresElevatorShaft 

Door_FallingTile_1:
    dw RoomHeader_MagnetStairs 
    db $00,$00,$00,$00,$00,$00 
    dw $8000,$0000 

Door_MagnetStairs_0:
    dw RoomHeader_FallingTile 
    db $00,$01,$00,$00,$01,$00 
    dw $8000,$0000 

Door_MagnetStairs_1:
    dw RoomHeader_DeadScientist 
    db $00,$00,$00,$00,$00,$00 
    dw $8000,$0000 

Door_DeadScientist_0:
    dw RoomHeader_MagnetStairs 
    db $00,$01,$00,$00,$00,$01 
    dw $8000,$0000 

Door_DeadScientist_1:
    dw RoomHeader_58Escape 
    db $00,$00,$00,$00,$00,$00 
    dw $8000,$0000 

Door_58Escape_0:
    dw RoomHeader_DeadScientist 
    db $00,$01,$00,$00,$01,$00 
    dw $8000,$0000 

Door_58Escape_1:
    dw RoomHeader_CeresRidley 
    db $00,$00,$00,$00,$00,$00 
    dw $8000,$0000 

Door_CeresRidley:
    dw RoomHeader_58Escape 
    db $00,$01,$00,$00,$01,$00 
    dw $8000,$0000 

UNUSED_Door_Debug_0_83ABC4:
    dw RoomHeader_Debug 
    db $05,$00,$00,$01,$00,$00,$01 
    dw $0000 

UNUSED_Door_Debug_1_83ABCF:
    dw RoomHeader_Debug 
    db $05,$00,$00,$01,$01,$00,$01 
    dw $0000 

UNUSED_Door_Debug_2_83ABDA:
    dw RoomHeader_Debug 
    db $04,$00,$00,$00,$00,$00,$01 
    dw $0000 

UNUSED_Door_Debug_3_83ABE5:
    dw RoomHeader_Debug 
    db $04,$00,$00,$00,$01,$00,$01 
    dw $0000 

FXType_Tilemap_Pointers:
; This table is too short, it's missing the entries for 28h/2Ah/2Ch (Ceres Ridley/elevator / haze)
; This is fine, because those rooms disabled layer 3 anyway, but it does mean garbage is loaded to VRAM from pointers in the following table
; In bank $8A
    dw $0000 ; 0: None
    dw FX_Layer3_Tilemaps_lava ; 2: Lava
    dw FX_Layer3_Tilemaps_acid ; 4: Acid
    dw FX_Layer3_Tilemaps_water ; 6: Water
    dw FX_Layer3_Tilemaps_spores ; 8: Spores
    dw FX_Layer3_Tilemaps_rain ; Ah: Rain
    dw FX_Layer3_Tilemaps_fog ; Ch: Fog
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000 
    dw $0000,$0000,$0000,$0000 
    dw FX_Layer3_Tilemaps_water ; 26h: Tourian entrance statue

FXType_Function_Pointers:
    dw RTL_88B278 ; ; 0: None
    dw FXType_2_Lava ; ; 2: Lava
    dw FXType_4_Acid ; ; 4: Acid
    dw FXType_6_Water ; ; 6: Water
    dw FXType_8_Spores ; ; 8: Spores
    dw FXType_A_Rain ; ; Ah: Rain
    dw FXType_C_Fog ; ; Ch: Fog
    dw RTL_88B278 
    dw RTL_88B278 
    dw RTL_88B278 
    dw RTL_88B278 
    dw RTL_88B278 
    dw RTL_88B278 
    dw RTL_88B278 
    dw RTL_88B278 
    dw RTL_88B278 
    dw FXType_20_ScrollingSky_RoomSetupASM_ScrollingSkyLand ; ; 20h: Scrolling sky
    dw FXType_20_22_ScrollingSky ; ; 22h: Unused
    dw FXType_24_Fireflea ; ; 24h: Fireflea
    dw FXType_26_TourianEntranceStatue ; ; 26h: Tourian entrance statue
    dw FXType_28_CeresRidley ; ; 28h: Ceres Ridley
    dw FXType_2A_CeresElevator ; ; 2Ah: Ceres elevator
    dw FXType_2C_CeresHaze ; ; 2Ch: Ceres haze

AreaSpecific_PaletteFXObjectList_Pointers:
; Loaded by $89:AB82
; Indexed by area index
    dw Crateria_PaletteFXObjectList 
    dw Brinstar_PaletteFXObjectList 
    dw Norfair_PaletteFXObjectList 
    dw WreckedShip_PaletteFXObjectList 
    dw Maridia_PaletteFXObjectList 
    dw Tourian_PaletteFXObjectList 
    dw Ceres_PaletteFXObjectList 
    dw Debug_PaletteFXObjectList 

AreaSpecific_AnimatedTilesObjectList_Pointers:
; Loaded by $89:AB82
; Indexed by area index
    dw Crateria_AnimatedTilesObjectList 
    dw Brinstar_AnimatedTilesObjectList 
    dw Norfair_AnimatedTilesObjectList 
    dw WreckedShip_AnimatedTilesObjectList 
    dw Maridia_AnimatedTilesObjectList 
    dw Tourian_AnimatedTilesObjectList 
    dw Ceres_AnimatedTilesObjectList 
    dw Debug_AnimatedTilesObjectList 

Crateria_PaletteFXObjectList:
    dw PaletteFXObjects_Crateria1_Lightning 
    dw PaletteFXObjects_Crateria2_UpperCrateriaRedFlashing 
    dw PaletteFXObjects_Crateria4_YellowLightning 
    dw PaletteFXObjects_Crateria8_OldTourianRedFlashing 
    dw PaletteFXObjects_Crateria10_OldTourianBGRailingsFlashYellow 
    dw PaletteFXObjects_Crateria20_OldTourianBGPanelsFlashYellow 
    dw PaletteFXObjects_Crateria40_SlightlyModifiesAPixelInCREBlock 
    dw PaletteFXObjects_Crateria80_Brinstar4_BeaconFlashing 

Crateria_AnimatedTilesObjectList:
    dw AnimatedTilesObjects_FX_horizontalSpikes 
    dw AnimatedTilesObjects_FX_verticalSpikes 
    dw AnimatedTilesObjects_FX_crateriaLake 
    dw UNUSED_AnimatedTilesObjects_FX_unusedCrateriaLava_0_878263 
    dw AnimatedTilesObjects_FX_nothing 
    dw AnimatedTilesObjects_FX_nothing 
    dw AnimatedTilesObjects_FX_nothing 
    dw AnimatedTilesObjects_FX_nothing 

Brinstar_PaletteFXObjectList:
    dw PaletteFXObjects_Brinstar1_BlueBackgroundSpores 
    dw PaletteFXObjects_Brinstar2_RedBackgroundGlow 
    dw PaletteFXObjects_Crateria80_Brinstar4_BeaconFlashing 
    dw PaletteFXObjects_Brinstar8_SporeSpawnBlueBackgroundSpores 
    dw PaletteFXObjects_Nothing 
    dw PaletteFXObjects_Nothing 
    dw PaletteFXObjects_Nothing 
    dw PaletteFXObjects_Nothing 

Brinstar_AnimatedTilesObjectList:
    dw AnimatedTilesObjects_FX_horizontalSpikes 
    dw AnimatedTilesObjects_FX_verticalSpikes 
    dw AnimatedTilesObjects_FX_brinstarMouth 
    dw AnimatedTilesObjects_FX_nothing 
    dw AnimatedTilesObjects_FX_nothing 
    dw AnimatedTilesObjects_FX_nothing 
    dw AnimatedTilesObjects_FX_nothing 
    dw AnimatedTilesObjects_FX_nothing 

Norfair_PaletteFXObjectList:
    dw PaletteFXObjects_Norfair1_Tourian1 
    dw PaletteFXObjects_Norfair2 
    dw PaletteFXObjects_Norfair4 
    dw PaletteFXObjects_Norfair8 
    dw PaletteFXObjects_Norfair10 
    dw PaletteFXObjects_Nothing 
    dw PaletteFXObjects_Nothing 
    dw PaletteFXObjects_Nothing 

Norfair_AnimatedTilesObjectList:
    dw AnimatedTilesObjects_FX_horizontalSpikes 
    dw AnimatedTilesObjects_FX_verticalSpikes 
    dw AnimatedTilesObjects_FX_nothing 
    dw AnimatedTilesObjects_FX_nothing 
    dw AnimatedTilesObjects_FX_nothing 
    dw AnimatedTilesObjects_FX_nothing 
    dw AnimatedTilesObjects_FX_nothing 
    dw AnimatedTilesObjects_FX_nothing 

WreckedShip_PaletteFXObjectList:
    dw PaletteFXObjects_WreckedShip1_GreenLights 
    dw PaletteFXObjects_Nothing 
    dw PaletteFXObjects_Nothing 
    dw PaletteFXObjects_Nothing 
    dw PaletteFXObjects_Nothing 
    dw PaletteFXObjects_Nothing 
    dw PaletteFXObjects_Nothing 
    dw PaletteFXObjects_Nothing 

WreckedShip_AnimatedTilesObjectList:
    dw AnimatedTilesObjects_FX_horizontalSpikes 
    dw AnimatedTilesObjects_FX_verticalSpikes 
    dw AnimatedTilesObjects_FX_wreckedShipTreadmillRightwards 
    dw AnimatedTilesObjects_FX_wreckedShipTreadmillLeftwards 
    dw AnimatedTilesObjects_FX_wreckedShipScreen 
    dw AnimatedTilesObjects_FX_nothing 
    dw AnimatedTilesObjects_FX_nothing 
    dw AnimatedTilesObjects_FX_nothing 

Maridia_PaletteFXObjectList:
    dw PaletteFXObjects_Maridia1_SandPits 
    dw PaletteFXObjects_Maridia2_SandFalls 
    dw PaletteFXObjects_Maridia4_BackgroundWaterfalls 
    dw PaletteFXObjects_Nothing 
    dw PaletteFXObjects_Nothing 
    dw PaletteFXObjects_Nothing 
    dw PaletteFXObjects_Nothing 
    dw PaletteFXObjects_Nothing 

Maridia_AnimatedTilesObjectList:
    dw AnimatedTilesObjects_FX_horizontalSpikes 
    dw AnimatedTilesObjects_FX_verticalSpikes 
    dw AnimatedTilesObjects_FX_maridiaSandCeiling 
    dw AnimatedTilesObjects_FX_maridiaSandFalling 
    dw AnimatedTilesObjects_FX_nothing 
    dw AnimatedTilesObjects_FX_nothing 
    dw AnimatedTilesObjects_FX_nothing 
    dw AnimatedTilesObjects_FX_nothing 

Tourian_PaletteFXObjectList:
    dw PaletteFXObjects_Norfair1_Tourian1 
    dw PaletteFXObjects_Tourian2_GlowingArkanoidBlocksAndRedOrbs 
    dw UNUSED_PaletteFXObjects_Tourian4_8DF7A5 
    dw PaletteFXObjects_Tourian8_ShutterRedFlashing 
    dw PaletteFXObjects_Tourian10_BackgroundRedFlashing 
    dw PaletteFXObjects_Tourian20_GeneralLevelRedFlashing 
    dw PaletteFXObjects_Tourian40_RedFlashingArkanoidBlocksRedOrbs 
    dw PaletteFXObjects_Nothing 

Tourian_AnimatedTilesObjectList:
    dw AnimatedTilesObjects_FX_horizontalSpikes 
    dw AnimatedTilesObjects_FX_verticalSpikes 
    dw AnimatedTilesObjects_FX_nothing 
    dw AnimatedTilesObjects_FX_nothing 
    dw AnimatedTilesObjects_FX_nothing 
    dw AnimatedTilesObjects_FX_nothing 
    dw AnimatedTilesObjects_FX_nothing 
    dw AnimatedTilesObjects_FX_nothing 

Ceres_PaletteFXObjectList:
    dw PaletteFXObjects_Nothing 
    dw PaletteFXObjects_Nothing 
    dw PaletteFXObjects_Nothing 
    dw PaletteFXObjects_Nothing 
    dw PaletteFXObjects_Nothing 
    dw PaletteFXObjects_Nothing 
    dw PaletteFXObjects_Nothing 
    dw PaletteFXObjects_Nothing 

Ceres_AnimatedTilesObjectList:
    dw AnimatedTilesObjects_FX_horizontalSpikes 
    dw AnimatedTilesObjects_FX_verticalSpikes 
    dw AnimatedTilesObjects_FX_nothing 
    dw AnimatedTilesObjects_FX_nothing 
    dw AnimatedTilesObjects_FX_nothing 
    dw AnimatedTilesObjects_FX_nothing 
    dw AnimatedTilesObjects_FX_nothing 
    dw AnimatedTilesObjects_FX_nothing 

Debug_PaletteFXObjectList:
    dw PaletteFXObjects_Nothing 
    dw PaletteFXObjects_Nothing 
    dw PaletteFXObjects_Nothing 
    dw PaletteFXObjects_Nothing 
    dw PaletteFXObjects_Nothing 
    dw PaletteFXObjects_Nothing 
    dw PaletteFXObjects_Nothing 
    dw PaletteFXObjects_Nothing 

Debug_AnimatedTilesObjectList:
    dw AnimatedTilesObjects_FX_horizontalSpikes 
    dw AnimatedTilesObjects_FX_verticalSpikes 
    dw AnimatedTilesObjects_FX_nothing 
    dw AnimatedTilesObjects_FX_nothing 
    dw AnimatedTilesObjects_FX_nothing 
    dw AnimatedTilesObjects_FX_nothing 
    dw AnimatedTilesObjects_FX_nothing 
    dw AnimatedTilesObjects_FX_nothing 

Freespace_Bank83_AD66: 
; $AD66 bytes
