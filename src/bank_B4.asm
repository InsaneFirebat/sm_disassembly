
org $B48000


EnemySets_Draygon_1_MotherBrain_2:
    dw $FFFF 
    db "SF1_10 " 

EnemySets_EastOcean:
    dw EnemyHeaders_Choot 
    dw $0001 
    dw EnemyHeaders_Skultera 
    dw $0002 
    dw EnemyHeaders_Kamer2 
    dw $0003,$FFFF 
    db $00 
    db "sf1_04 " 

EnemySets_CrateriaPowerBombs:
    dw EnemyHeaders_Alcoon 
    dw $0001 
    dw EnemyHeaders_Zero 
    dw $0001,$FFFF 
    db $00 
    db "sf2_06 " 

EnemySets_Terminator:
    dw EnemyHeaders_Waver 
    dw $0001 
    dw EnemyHeaders_Zoomer 
    dw $0002,$FFFF 
    db $00 
    db "SF2_12a" 

EnemySets_FinalMissileBombway_1:
    dw EnemyHeaders_FaceBlock 
    dw $0007 
    dw EnemyHeaders_Stoke 
    dw $0007,$FFFF 
    db $00 
    db "SF2_12 " 

EnemySets_FinalMissileBombway_0:
    dw EnemyHeaders_FaceBlock 
    dw $0007 
    dw EnemyHeaders_Stoke 
    dw $0007,$FFFF 
    db $00 
    db "sf1_02A" 

EnemySets_Parlor_1:
    dw EnemyHeaders_Zoomer 
    dw $0001 
    dw EnemyHeaders_Skree 
    dw $0002 
    dw EnemyHeaders_Ripper 
    dw $0003,$FFFF 
    db $00 
    db "sf2_04 " 

EnemySets_Flyway_0_1:
    dw EnemyHeaders_Waver 
    dw $0001 
    dw EnemyHeaders_Mellow 
    dw $0002,$FFFF 
    db $00 
    db "sf2_01A" 

EnemySets_Pit_1:
    dw EnemyHeaders_PirateGreyWalking 
    dw $0001 
    dw EnemyHeaders_PirateGreyWall 
    dw $0002,$FFFF 
    db $00 
    db "sf1_01 " 

EnemySets_GauntletEntrance:
    dw EnemyHeaders_YappingMaw 
    dw $0001 
    dw EnemyHeaders_Waver 
    dw $0002,$FFFF 
    db $00 
    db "sf2_03 " 

EnemySets_BombTorizo_0_1:
    dw EnemyHeaders_BombTorizo 
    dw $0001,$FFFF 
    db $00 
    db "sf2_10 " 

EnemySets_GreenPiratesShaft:
    dw EnemyHeaders_PirateGreenWalking 
    dw $0001 
    dw EnemyHeaders_Beetom 
    dw $0002,$FFFF 
    db $00 
    db "sf2_07 " 

EnemySets_GreenBrinstarElev:
    dw $FFFF 
    db $00 
    db "SF2_13 " 

EnemySets_FinalMissile_0:
    dw EnemyHeaders_Eye 
    dw $0001,$FFFF 
    db $00 
    db "sf2_09 " 

EnemySets_CrateriaMap:
    dw EnemyHeaders_BombTorizo 
    dw $0001,$FFFF 
    db $00 
    db "SF2_14 " 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemySets_B480F9:
    dw EnemyHeaders_FaceBlock 
    dw $0001,$FFFF 
    db $00 
    db "SF2_13a" 
endif ; !FEATURE_KEEP_UNREFERENCED

EnemySets_FinalMissile_1:
    dw $FFFF 
    db $00 
    db "sf2_00 " 

EnemySets_Climb_2:
    dw EnemyHeaders_PirateSilverNinja 
    dw $0002,$FFFF 
    db $00 
    db "sf1_03 " 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemySets_B4811F:
    dw $FFFF 
    db $00 
    db "SF1_05 " 
endif ; !FEATURE_KEEP_UNREFERENCED

EnemySets_CrateriaSave:
    dw $FFFF 
    db $00 
    db "SF1_13 " 

EnemySets_ForgottenHighwayElbow:
    dw EnemyHeaders_FaceBlock 
    dw $0001,$FFFF 
    db $00 
    db "SF1_15 " 

EnemySets_Moat:
    dw EnemyHeaders_FaceBlock 
    dw $0001,$FFFF 
    db $00 
    db "sf2_00 " 

EnemySets_Climb_0:
    dw EnemyHeaders_Sbug 
    dw $0007 
    dw EnemyHeaders_FaceBlock 
    dw $0007,$FFFF 
    db $00 
    db "SF1_06 " 

EnemySets_WestOcean:
    dw EnemyHeaders_Skultera 
    dw $0001 
    dw EnemyHeaders_Zeb 
    dw $0002 
    dw EnemyHeaders_GRipper 
    dw $0003 
    dw EnemyHeaders_Tripper 
    dw $0007,$FFFF 
    db $00 
    db "SF1_20 " 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemySets_B4817B:
    dw $FFFF 
    db $00 
    db "sf1_02 " 
endif ; !FEATURE_KEEP_UNREFERENCED

EnemySets_Parlor_0:
    dw EnemyHeaders_Sbug 
    dw $0007,$FFFF 
    db $00 
    db "sf1_00 " 

EnemySets_LandingSite_0_1_2:
    dw EnemyHeaders_ShipTop 
    dw $0002 
    dw EnemyHeaders_ShipBottomEntrance 
    dw $0007,$FFFF 
    db $00 
    db "SF2_11 " 

EnemySets_CrateriaSuper:
    dw EnemyHeaders_Boyon 
    dw $0001 
    dw EnemyHeaders_YappingMaw 
    dw $0002,$FFFF 
    db $00 
    db "SF1_19 " 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemySets_B481B7:
    dw $FFFF 
    db $00 
    db "SF1_18 " 
endif ; !FEATURE_KEEP_UNREFERENCED

EnemySets_PreBowling:
    dw EnemyHeaders_HZoomer 
    dw $0001 
    dw EnemyHeaders_Sova 
    dw $0001,$FFFF 
    db $00 
    db "sf2_00A" 

EnemySets_Climb_1:
    dw EnemyHeaders_PirateGreyWall 
    dw $0001,$FFFF 
    db $00 
    db "SF1_07 " 

EnemySets_BowlingAlleyPath:
    dw EnemyHeaders_Waver 
    dw $0001 
    dw EnemyHeaders_Choot 
    dw $0007,$FFFF 
    db $00 
    db "SF1_16 " 

EnemySets_RedBinstarElev:
    dw $FFFF 
    db $00 
    db "SF1_17 " 

EnemySets_GauntletETank:
    dw EnemyHeaders_YappingMaw 
    dw $0001 
    dw EnemyHeaders_Zebbo 
    dw $0002,$FFFF 
    db $00 
    db "sf2_01 " 

EnemySets_Pit_0:
    dw EnemyHeaders_Sbug 
    dw $0007 
    dw EnemyHeaders_FaceBlock 
    dw $0007,$FFFF 
    db $00 
    db "SF1_12 " 

EnemySets_CrabMaze:
    dw EnemyHeaders_Sciser 
    dw $0007 
    dw EnemyHeaders_Puyo 
    dw $0007,$FFFF 
    db $00 
    db "SF1_14 " 

EnemySets_CrateriaTube:
    dw $FFFF 
    db $00 
    db "SF1_11 " 

EnemySets_ForgottenHighwayKagos:
    dw EnemyHeaders_Kago 
    dw $0001,$FFFF 
    db $00 
    db "sf2_02 " 

EnemySets_ElevToBlueBrinstar:
    dw $FFFF 
    db $00 
    db "SF1_09 " 

EnemySets_ForgottenHighwayElev:
    dw $FFFF 
    db $00 
    db "sf2_05 " 

EnemySets_PreMapFlyway:
    dw EnemyHeaders_Mellow 
    dw $0001 
    dw EnemyHeaders_Rio 
    dw $0002,$FFFF 
    db $00 
    db "sf2_08 " 

EnemySets_LowerMushrooms:
    dw EnemyHeaders_Kago 
    dw $0002 
    dw EnemyHeaders_MZoomer 
    dw $0003,$FFFF 
    db $00 
    db "sf1_00 " 

EnemySets_LandingSite_3:
    dw EnemyHeaders_ShipTop 
    dw $0002 
    dw EnemyHeaders_ShipBottomEntrance 
    dw $0007,$FFFF 
    db $00 
    db "sf1_02 " 

EnemySets_Parlor_2:
    dw EnemyHeaders_Sbug 
    dw $0007,$FFFF 
    db $00 
    db "sf2_03 " 

EnemySets_BombTorizo_2:
    dw EnemyHeaders_EtecoonEscape 
    dw $0001 
    dw EnemyHeaders_DachoraEscape 
    dw $0007,$FFFF 
    db $00 
    db "sf2_04 " 

EnemySets_Flyway_2:
    dw $FFFF 
    db $00 
    db "SF1_08 " 

EnemySets_CrateriaKihunter:
    dw EnemyHeaders_KihunterGreen 
    dw $0001 
    dw EnemyHeaders_Sciser 
    dw $0002 
    dw EnemyHeaders_Zero 
    dw $0002,$FFFF 
    db $00 
    db "bl1_02 " 

EnemySets_BrinstarPreMap:
    dw EnemyHeaders_Sidehopper 
    dw $0001 
    dw EnemyHeaders_Zeela 
    dw $0002,$FFFF 
    db $00 
    db "bl1_05 " 

EnemySets_GreenBrinstarMap:
    dw $FFFF 
    db $00 
    db "bl1_07 " 

EnemySets_GreenBrinstarMissileRefill:
    dw $FFFF 
    db $00 
    db "BL1_10 " 

EnemySets_SporeSpawnKihunters:
    dw EnemyHeaders_KihunterGreen 
    dw $0007,$FFFF 
    db $00 
    db "BL1_20 " 

EnemySets_EtecoonSuper:
    dw $FFFF 
    db $00 
    db "BL1_21 " 

EnemySets_DachoraEnergyRefill:
    dw EnemyHeaders_FaceBlock 
    dw $0001,$FFFF 
    db $00 
    db "BL1_22 " 

EnemySets_SporeSpawnFarming:
    dw EnemyHeaders_Zeb 
    dw $0001 
    dw EnemyHeaders_Zeela 
    dw $0002,$FFFF 
    db $00 
    db "BL2_19 " 

EnemySets_Statues:
    dw EnemyHeaders_TourianStatue 
    dw $0001 
    dw EnemyHeaders_TourianStatueGhost 
    dw $D003,$FFFF 
    db $00 
    db "BL1_26 " 

EnemySets_HopperETank:
    dw $FFFF 
    db $00 
    db "BL2_05 " 

EnemySets_BetaPowerBomb:
    dw EnemyHeaders_YappingMaw 
    dw $0001 
    dw EnemyHeaders_SidehopperLarge 
    dw $0002,$FFFF 
    db $00 
    db "BL1_23 " 

EnemySets_WaterwayETank:
    dw EnemyHeaders_Skultera 
    dw $0001 
    dw EnemyHeaders_Puyo 
    dw $0002 
    dw EnemyHeaders_Zero 
    dw $0003,$FFFF 
    db $00 
    db "BL1_15A" 

EnemySets_ConstructionZone_1:
    dw EnemyHeaders_Zoomer 
    dw $0001 
    dw EnemyHeaders_FaceBlock 
    dw $0002,$FFFF 
    db $00 
    db "BL1_16A" 

EnemySets_BlueBrinstarETank_1:
    dw EnemyHeaders_FaceBlock 
    dw $0001 
    dw EnemyHeaders_Zoomer 
    dw $0002 
    dw EnemyHeaders_Skree 
    dw $0003 
    dw EnemyHeaders_Rio 
    dw $0007,$FFFF 
    db $00 
    db "BL1_17 " 

EnemySets_NoobBridge:
    dw EnemyHeaders_Cacatac 
    dw $0001 
    dw EnemyHeaders_Zeela 
    dw $0002,$FFFF 
    db $00 
    db "BL1_14A" 

EnemySets_MorphBall_1:
    dw EnemyHeaders_SidehopperLarge 
    dw $0002 
    dw EnemyHeaders_FaceBlock 
    dw $0007,$FFFF 
    db $00 
    db "BL2_22 " 

EnemySets_WarehouseSave:
    dw $FFFF 
    db $00 
    db "BL1_14 " 

EnemySets_MorphBall_0:
    dw EnemyHeaders_Eye 
    dw $0007 
    dw EnemyHeaders_FaceBlock 
    dw $0007,$FFFF 
    db $00 
    db "BL2_10 " 

EnemySets_WarehouseZeela:
    dw EnemyHeaders_Zeela 
    dw $0001,$FFFF 
    db $00 
    db "BL2_00 " 

EnemySets_RedTower:
    dw EnemyHeaders_Ripper 
    dw $0001 
    dw EnemyHeaders_Beetom 
    dw $0002 
    dw EnemyHeaders_Geega 
    dw $0003,$FFFF 
    db $00 
    db "bl1_28 " 

EnemySets_BlueBrinstarBoulders:
    dw EnemyHeaders_Boulder 
    dw $0001,$FFFF 
    db $00 
    db "bl1_29 " 

EnemySets_BillyMays:
    dw $FFFF 
    db $00 
    db "bl1_27 " 

EnemySets_BigPinkSaveRoom:
    dw $FFFF 
    db $00 
    db "BL1_09 " 

EnemySets_BigPink:
    dw EnemyHeaders_Rio 
    dw $0001 
    dw EnemyHeaders_Sidehopper 
    dw $0002 
    dw EnemyHeaders_Zeb 
    dw $0003,$FFFF 
    db $00 
    db "bl1_31 " 

EnemySets_EtecoonSave:
    dw $FFFF 
    db $00 
    db "BL2_08 " 

EnemySets_BelowSpazer:
    dw EnemyHeaders_YappingMaw 
    dw $0001 
    dw EnemyHeaders_Cacatac 
    dw $0002,$FFFF 
    db $00 
    db "bl1_30 " 

EnemySets_GreenBrinstarSave:
    dw $FFFF 
    db $00 
    db "BL2_09 " 

EnemySets_Spazer:
    dw $FFFF 
    db $00 
    db "BL1_12 " 

EnemySets_PinkBrinstarPowerBombs:
    dw EnemyHeaders_ShutterShootable 
    dw $0001 
    dw EnemyHeaders_Metaree 
    dw $0001 
    dw EnemyHeaders_SidehopperLarge 
    dw $0002,$FFFF 
    db $00 
    db "BL2_17 " 

EnemySets_RedTowerRefill:
    dw $FFFF 
    db $00 
    db "BL2_18 " 

EnemySets_KraidRefill:
    dw $FFFF 
    db $00 
    db "BL2_21 " 

EnemySets_VariaSuit:
    dw $FFFF 
    db $00 
    db "BL2_23 " 

EnemySets_RedBrinstarSave:
    dw $FFFF 
    db $00 
    db "BL1_24a" 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemySets_B484AD:
    dw $FFFF 
    db $00 
    db "BL1_16 " 
endif ; !FEATURE_KEEP_UNREFERENCED

EnemySets_BlueBrinstarETank_0:
    dw EnemyHeaders_Eye 
    dw $0007 
    dw EnemyHeaders_FaceBlock 
    dw $0007,$FFFF 
    db $00 
    db "bl1_06 " 

EnemySets_GreenBrinstarFirefleas:
    dw EnemyHeaders_Fireflea 
    dw $0002,$FFFF 
    db $00 
    db "BL1_18 " 

EnemySets_GreenBrinstarBeetoms:
    dw EnemyHeaders_Beetom 
    dw $0001,$FFFF 
    db $00 
    db "BL1_19 " 

EnemySets_EtecoonETank:
    dw EnemyHeaders_Zebbo 
    dw $0001 
    dw EnemyHeaders_Beetom 
    dw $0002,$FFFF 
    db $00 
    db "BL1_25 " 

EnemySets_PinkBrinstarHoppers:
    dw EnemyHeaders_SidehopperLarge 
    dw $0001 
    dw EnemyHeaders_Sidehopper 
    dw $0002 
    dw EnemyHeaders_ShutterShootable 
    dw $0003,$FFFF 
    db $00 
    db "BL2_11 " 

EnemySets_WarehouseETank:
    dw EnemyHeaders_Reflec 
    dw $0001 
    dw EnemyHeaders_Beetom 
    dw $0002,$FFFF 
    db $00 
    db "BL2_20a" 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemySets_B4851F:
    dw $FFFF 
    db $00 
    db "BL2_20 " 
endif ; !FEATURE_KEEP_UNREFERENCED

EnemySets_WarehouseEntrance:
    dw $FFFF 
    db $00 
    db "BL2_12 " 

EnemySets_WarehouseKihunter:
    dw EnemyHeaders_KihunterGreen 
    dw $0001,$FFFF 
    db $00 
    db "bl1_00 " 

EnemySets_GreenBrinstarMainShaft:
    dw EnemyHeaders_Etecoon 
    dw $0001 
    dw EnemyHeaders_Zeela 
    dw $0002 
    dw EnemyHeaders_Ripper2 
    dw $0003,$FFFF 
    db $00 
    db "bl1_01 " 

EnemySets_SporeSpawnSuper:
    dw EnemyHeaders_Zeb 
    dw $0001,$FFFF 
    db $00 
    db "bl1_03 " 

EnemySets_EarlySupers:
    dw EnemyHeaders_Sidehopper 
    dw $0001 
    dw EnemyHeaders_ShutterGrowing 
    dw $0002 
    dw EnemyHeaders_Waver 
    dw $0003 
    dw EnemyHeaders_Zeb 
    dw $0007,$FFFF 
    db $00 
    db "BL2_01 " 

EnemySets_RedBrinstarFirefleas:
    dw EnemyHeaders_Fireflea 
    dw $0001 
    dw EnemyHeaders_Waver 
    dw $0002 
    dw EnemyHeaders_YappingMaw 
    dw $0003,$FFFF 
    db $00 
    db "BL1_15 " 

EnemySets_ConstructionZone_0:
    dw EnemyHeaders_Sbug 
    dw $0007 
    dw EnemyHeaders_FaceBlock 
    dw $0007,$FFFF 
    db $00 
    db "BL1_13 " 

EnemySets_GreenHillZone:
    dw EnemyHeaders_Sidehopper 
    dw $0001 
    dw EnemyHeaders_Geega 
    dw $0002,$FFFF 
    db $00 
    db "BL1_08 " 

EnemySets_Dachora:
    dw EnemyHeaders_Zeela 
    dw $0001 
    dw EnemyHeaders_Metaree 
    dw $0002 
    dw EnemyHeaders_Rio 
    dw $0003 
    dw EnemyHeaders_Dachora 
    dw $0007,$FFFF 
    db $00 
    db "BL2_03 " 

EnemySets_Hellway:
    dw EnemyHeaders_Zeela 
    dw $0001 
    dw EnemyHeaders_Zebbo 
    dw $0002,$FFFF 
    db $00 
    db "BL1_24 " 

EnemySets_FirstMissile:
    dw $FFFF 
    db $00 
    db "BL2_15 " 

EnemySets_Kraid:
    dw EnemyHeaders_Kraid 
    dw $0007,$FFFF 
    db $00 
    db "bl1_04 " 

EnemySets_BrinstarReserveTank:
    dw $FFFF 
    db $00 
    db "BL2_02 " 

EnemySets_XrayScope:
    dw EnemyHeaders_ShutterShootable 
    dw $0001,$FFFF 
    db $00 
    db "BL2_16 " 

EnemySets_StatuesHallway:
    dw $FFFF 
    db $00 
    db "BL2_06 " 

EnemySets_AlphaPowerBomb:
    dw EnemyHeaders_Boyon 
    dw $0001,$FFFF 
    db $00 
    db "BL2_14 " 

EnemySets_KraidEyeDoor:
    dw EnemyHeaders_Zeb 
    dw $0001 
    dw EnemyHeaders_Sbug 
    dw $0002,$FFFF 
    db $00 
    db "BL2_04 " 

EnemySets_Caterpillar:
    dw EnemyHeaders_Zero 
    dw $0002 
    dw EnemyHeaders_Cacatac 
    dw $0003,$FFFF 
    db $00 
    db "BL2_13 " 

EnemySets_MiniKraid:
    dw EnemyHeaders_PirateGreenWalking 
    dw $0001 
    dw EnemyHeaders_MiniKraid 
    dw $0003,$FFFF 
    db $00 
    db "BL1_11 " 

EnemySets_SporeSpawn:
    dw EnemyHeaders_SporeSpawn 
    dw $0001,$FFFF 
    db $00 
    db "BL2_07 " 

EnemySets_SkreeBoost:
    dw EnemyHeaders_Skree 
    dw $0001 
    dw EnemyHeaders_Boyon 
    dw $0007,$FFFF 
    db $00 
    db "NO1_19 " 

EnemySets_GrappleTutorial3:
    dw EnemyHeaders_Gamet 
    dw $0001 
    dw EnemyHeaders_Puyo 
    dw $0002,$FFFF 
    db $00 
    db "NO1_17 " 

EnemySets_PostCrocShaft:
    dw EnemyHeaders_Viola 
    dw $0001,$FFFF 
    db $00 
    db "NO2_18 " 

EnemySets_MetalPirates:
    dw EnemyHeaders_PirateGoldNinja 
    dw $0001,$FFFF 
    db $00 
    db "NO2_00 " 

EnemySets_AcidStatue:
    dw EnemyHeaders_Chozo 
    dw $0001 
    dw EnemyHeaders_Magdollite 
    dw $0003 
    dw EnemyHeaders_Holtz 
    dw $0007,$FFFF 
    db $00 
    db "NO1_44 " 

EnemySets_PurpleFarming:
    dw EnemyHeaders_Gamet 
    dw $0001,$FFFF 
    db $00 
    db "NO1_04 " 

EnemySets_IceBeamGate:
    dw EnemyHeaders_ShutterGrowing 
    dw $0001 
    dw EnemyHeaders_Desgeega 
    dw $0002 
    dw EnemyHeaders_Mella 
    dw $0003 
    dw EnemyHeaders_Sova 
    dw $0007,$FFFF 
    db $00 
    db "NO1_42 " 

EnemySets_SpikyAcidSnakesTunnel:
    dw EnemyHeaders_YappingMaw 
    dw $0001,$FFFF 
    db $00 
    db "NO2_16 " 

EnemySets_RedKihunterShaft:
    dw EnemyHeaders_KihunterRed 
    dw $0001 
    dw EnemyHeaders_Reflec 
    dw $0002,$FFFF 
    db $00 
    db "NO2_03 " 

EnemySets_FastRipper:
    dw EnemyHeaders_Ripper2 
    dw $0001,$FFFF 
    db $00 
    db "NO1_31 " 

EnemySets_WaveBeam:
    dw $FFFF 
    db $00 
    db "NO2_07 " 

EnemySets_FastPillarsSetup:
    dw EnemyHeaders_PirateGoldWall 
    dw $0001 
    dw EnemyHeaders_PirateGoldWalking 
    dw $0002 
    dw EnemyHeaders_Viola 
    dw $0003,$FFFF 
    db $00 
    db "NO1_38 " 

EnemySets_LowerNorfairElev:
    dw $FFFF 
    db $00 
    db "NO2_23 " 

EnemySets_LNSave:
    dw $FFFF 
    db $00 
    db "NO1_43 " 

EnemySets_UpperNorfairRefill:
    dw $FFFF 
    db $00 
    db "NO1_46 " 

EnemySets_NorfairMap:
    dw $FFFF 
    db $00 
    db "NO2_09 " 

EnemySets_MickeyMouse:
    dw EnemyHeaders_DesgeegaLarge 
    dw $0001 
    dw EnemyHeaders_Multiviola 
    dw $0002,$FFFF 
    db $00 
    db "NO2_04 " 

EnemySets_GTEnergyRefill:
    dw $FFFF 
    db $00 
    db "NO2_05 " 

EnemySets_Ridley:
    dw EnemyHeaders_Ridley 
    dw $0001 
    dw EnemyHeaders_RidleyExplosion 
    dw $E001,$FFFF 
    db $00 
    db "NO1_16 " 

EnemySets_PostCrocPowerBombs:
    dw $FFFF 
    db $00 
    db "NO1_06 " 

EnemySets_IceBeam:
    dw $FFFF 
    db $00 
    db "NO1_11 " 

EnemySets_HiJumpBoots:
    dw $FFFF 
    db $00 
    db "NO1_15 " 

EnemySets_PostCrocSave:
    dw $FFFF 
    db $00 
    db "NO1_48 " 

EnemySets_FrogSpeedway:
    dw EnemyHeaders_Beetom 
    dw $0001,$FFFF 
    db $00 
    db "NO1_40 " 

EnemySets_RisingTide:
    dw EnemyHeaders_Squeept 
    dw $0001 
    dw EnemyHeaders_Sova 
    dw $0002 
    dw EnemyHeaders_Dragon 
    dw $0003,$FFFF 
    db $00 
    db "NO1_14 " 

EnemySets_PostCrocFarming:
    dw EnemyHeaders_Gamet 
    dw $0001 
    dw EnemyHeaders_GRipper 
    dw $0002 
    dw EnemyHeaders_Kamer2 
    dw $0003,$FFFF 
    db $00 
    db "NO2_12 " 

EnemySets_WorstRoomInTheGame:
    dw EnemyHeaders_Namihe 
    dw $0001 
    dw EnemyHeaders_PirateGoldWall 
    dw $0002 
    dw EnemyHeaders_PirateGoldWalking 
    dw $0003,$FFFF 
    db $00 
    db "NO1_30 " 

EnemySets_DoubleChamber:
    dw EnemyHeaders_Fune 
    dw $0001 
    dw EnemyHeaders_Kamer 
    dw $0002 
    dw EnemyHeaders_Kago 
    dw $0003 
    dw EnemyHeaders_GRipper 
    dw $0007,$FFFF 
    db $00 
    db "NO1_23 " 

EnemySets_GrappleBeam:
    dw EnemyHeaders_Multiviola 
    dw $0001,$FFFF 
    db $00 
    db "NO1_49 " 

EnemySets_RedPirateShaft:
    dw EnemyHeaders_PirateRedWalking 
    dw $0001 
    dw EnemyHeaders_MZoomer 
    dw $0003,$FFFF 
    db $00 
    db "NO1_09 " 

EnemySets_CrocomireSpeedway:
    dw EnemyHeaders_PirateRedWalking 
    dw $0001 
    dw EnemyHeaders_Multiviola 
    dw $0002 
    dw EnemyHeaders_Cacatac 
    dw $0003 
    dw EnemyHeaders_Sova 
    dw $0003,$FFFF 
    db $00 
    db "NO2_11 " 

EnemySets_Plowerhouse:
    dw EnemyHeaders_Zebbo 
    dw $0001 
    dw EnemyHeaders_Holtz 
    dw $0007,$FFFF 
    db $00 
    db "NO2_22 " 

EnemySets_LNFireflea:
    dw EnemyHeaders_Fireflea 
    dw $0001 
    dw EnemyHeaders_Boulder 
    dw $0002 
    dw EnemyHeaders_Fune 
    dw $0003,$FFFF 
    db $00 
    db "NO1_35 " 

EnemySets_MagdolliteTunnel:
    dw EnemyHeaders_Multiviola 
    dw $0001 
    dw EnemyHeaders_Magdollite 
    dw $0007,$FFFF 
    db $00 
    db "NO2_08 " 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemySets_State8FB3EE_B48899:
    dw $FFFF 
    db $00 
    db "NO1_37 " 
endif ; !FEATURE_KEEP_UNREFERENCED

EnemySets_LavaDive:
    dw EnemyHeaders_Namihe 
    dw $0001,$FFFF 
    db $00 
    db "NO2_10 " 

EnemySets_Pillar:
    dw EnemyHeaders_Puromi 
    dw $0007,$FFFF 
    db $00 
    db "NO1_12 " 

EnemySets_CrocomireEscape:
    dw EnemyHeaders_Dragon 
    dw $0001 
    dw EnemyHeaders_Geruta 
    dw $0002,$FFFF 
    db $00 
    db "NO2_14 " 

EnemySets_LNSpringBallMaze:
    dw EnemyHeaders_Alcoon 
    dw $0001,$FFFF 
    db $00 
    db "NO2_15 " 

EnemySets_LNEscapePowerBombs:
    dw $FFFF 
    db $00 
    db "NO1_36 " 

EnemySets_PurpleShaft:
    dw $FFFF 
    db $00 
    db "NO2_20 " 

EnemySets_RidleyETank:
    dw $FFFF 
    db $00 
    db "NO2_21 " 

EnemySets_ScrewAttack:
    dw $FFFF 
    db $00 
    db "NO1_25 " 

EnemySets_GreenBubblesMissiles:
    dw EnemyHeaders_ShutterShootable 
    dw $0007 
    dw EnemyHeaders_Sova 
    dw $0002 
    dw EnemyHeaders_Geruta 
    dw $0003,$FFFF 
    db $00 
    db "NO2_13 " 

EnemySets_Amphitheatre:
    dw EnemyHeaders_PirateGoldWalking 
    dw $0007,$FFFF 
    db $00 
    db "NO1_02 " 

EnemySets_CathedralEntrance:
    dw EnemyHeaders_Sova 
    dw $0001 
    dw EnemyHeaders_Desgeega 
    dw $0002,$FFFF 
    db $00 
    db "NO2_01 " 

EnemySets_MainHall:
    dw EnemyHeaders_Hibashi 
    dw $0001 
    dw EnemyHeaders_Dragon 
    dw $0007 
    dw EnemyHeaders_Gamet 
    dw $0007,$FFFF 
    db $00 
    db "NO1_20 " 

EnemySets_PostCrocJump:
    dw EnemyHeaders_Mella 
    dw $0001 
    dw EnemyHeaders_GRipper 
    dw $0002 
    dw EnemyHeaders_Kamer2 
    dw $0003,$FFFF 
    db $00 
    db "NO1_50 " 

EnemySets_FrogSave:
    dw $FFFF 
    db $00 
    db "NO1_51 " 

EnemySets_CrocomireSave:
    dw $FFFF 
    db $00 
    db "NO1_08 " 

EnemySets_CrumbleShaft:
    dw EnemyHeaders_Sova 
    dw $0001,$FFFF 
    db $00 
    db "NO2_17 " 

EnemySets_Wasteland:
    dw EnemyHeaders_Hibashi 
    dw $0001 
    dw EnemyHeaders_DesgeegaLarge 
    dw $0002 
    dw EnemyHeaders_ShutterShootable 
    dw $0003 
    dw EnemyHeaders_KzanTop 
    dw $0007,$FFFF 
    db $00 
    db "NO1_41 " 

EnemySets_AcidSnakesTunnel:
    dw EnemyHeaders_Dragon 
    dw $0001 
    dw EnemyHeaders_Gamet 
    dw $0002,$FFFF 
    db $00 
    db "NO1_22 " 

EnemySets_GrappleTutorial1:
    dw $FFFF 
    db $00 
    db "NO1_47 " 

EnemySets_BubbleMountainSave:
    dw $FFFF 
    db $00 
    db "NO1_13 " 

EnemySets_HiJumpETank:
    dw EnemyHeaders_Sova 
    dw $0001,$FFFF 
    db $00 
    db "NO1_26 " 

EnemySets_BubbleMountain:
    dw EnemyHeaders_Waver 
    dw $0001 
    dw EnemyHeaders_Ripper2 
    dw $0001 
    dw EnemyHeaders_Cacatac 
    dw $0002 
    dw EnemyHeaders_Sova 
    dw $0002,$FFFF 
    db $00 
    db "NO1_00 " 

EnemySets_IceBeamAcid:
    dw EnemyHeaders_Tripper 
    dw $0007,$FFFF 
    db $00 
    db "NO1_05 " 

EnemySets_IceBeamTutorial:
    dw EnemyHeaders_Boyon 
    dw $0001 
    dw EnemyHeaders_Ripper2 
    dw $0002,$FFFF 
    db $00 
    db "NO1_18 " 

EnemySets_PostCrocMissile:
    dw EnemyHeaders_Metaree 
    dw $0001 
    dw EnemyHeaders_Gamet 
    dw $0002,$FFFF 
    db $00 
    db "NO1_01 " 

EnemySets_Cathedral:
    dw EnemyHeaders_Sova 
    dw $0001 
    dw EnemyHeaders_Geruta 
    dw $0002,$FFFF 
    db $00 
    db "NO1_24 " 

EnemySets_NorfairReserveTank:
    dw EnemyHeaders_Dragon 
    dw $0001 
    dw EnemyHeaders_Sova 
    dw $0002,$FFFF 
    db $00 
    db "NO1_21 " 

EnemySets_GrappleTutorial2:
    dw EnemyHeaders_Fune 
    dw $0001 
    dw EnemyHeaders_Multiviola 
    dw $0002,$FFFF 
    db $00 
    db "NO1_07 " 

EnemySets_IceBeamSnake:
    dw EnemyHeaders_Sova 
    dw $0001 
    dw EnemyHeaders_Fune 
    dw $0002,$FFFF 
    db $00 
    db "NO2_02 " 

EnemySets_GoldenTorizo:
    dw EnemyHeaders_GoldenTorizo 
    dw $0001,$FFFF 
    db $00 
    db "NO1_32 " 

EnemySets_SpikyPlatformsTunnel:
    dw EnemyHeaders_Tripper 
    dw $0007 
    dw EnemyHeaders_ShutterShootable 
    dw $0002,$FFFF 
    db $00 
    db "NO1_28 " 

EnemySets_SpeedBooster:
    dw $FFFF 
    db $00 
    db "NO2_06 " 

EnemySets_LNFarming:
    dw EnemyHeaders_Viola 
    dw $0001 
    dw EnemyHeaders_Zebbo 
    dw $0007,$FFFF 
    db $00 
    db "NO1_29 " 

EnemySets_SingleChamber:
    dw EnemyHeaders_Multiviola 
    dw $0001 
    dw EnemyHeaders_Alcoon 
    dw $0002,$FFFF 
    db $00 
    db "NO1_27 " 

EnemySets_SpeedBoosterHall:
    dw EnemyHeaders_Geruta 
    dw $0001 
    dw EnemyHeaders_Metaree 
    dw $0002,$FFFF 
    db $00 
    db "NO1_45 " 

EnemySets_BatCave:
    dw EnemyHeaders_Gamet 
    dw $0001 
    dw EnemyHeaders_Skree 
    dw $0002,$FFFF 
    db $00 
    db "NO1_34 " 

EnemySets_KronicBoost:
    dw EnemyHeaders_Viola 
    dw $0001,$FFFF 
    db $00 
    db "NO1_03 " 

EnemySets_BusinessCenter:
    dw EnemyHeaders_Sova 
    dw $0002,$FFFF 
    db $00 
    db "NO2_19 " 

EnemySets_ThreeMusketeers:
    dw EnemyHeaders_Hibashi 
    dw $0001 
    dw EnemyHeaders_KihunterRed 
    dw $0002 
    dw EnemyHeaders_ShutterShootable 
    dw $0003,$FFFF 
    db $00 
    db "NO1_10 " 

EnemySets_Crocomire:
    dw EnemyHeaders_Crocomire 
    dw $D007,$FFFF 
    db $00 
    db "NO1_52 " 

EnemySets_LNElevSave:
    dw $FFFF 
    db $00 
    db "NO1_33 " 

EnemySets_Volcano:
    dw EnemyHeaders_Fune 
    dw $0001 
    dw EnemyHeaders_LavaRocks 
    dw $0002,$FFFF 
    db $00 
    db "NO1_39 " 

EnemySets_UpperNorfairFarming:
    dw EnemyHeaders_Fune 
    dw $0001 
    dw EnemyHeaders_Gamet 
    dw $0002,$FFFF 
    db $00 
    db "NP1_11a" 

EnemySets_SpongeBath_1:
    dw EnemyHeaders_Bull 
    dw $0001,$FFFF 
    db $00 
    db "NP1_07a" 

EnemySets_WreckedShipETank_1:
    dw EnemyHeaders_Kamer2 
    dw $0001 
    dw EnemyHeaders_Skultera 
    dw $0002,$FFFF 
    db $00 
    db "NP1_04 " 

EnemySets_WreckedShipMainShaft_0:
    dw EnemyHeaders_Coven 
    dw $0001 
    dw EnemyHeaders_KzanTop 
    dw $0002 
    dw EnemyHeaders_Atomic 
    dw $0003 
    dw EnemyHeaders_Sbug 
    dw $0003,$FFFF 
    db $00 
    db "NP1_00 " 

EnemySets_BowlingAlley_0:
    dw EnemyHeaders_Chozo 
    dw $0001 
    dw EnemyHeaders_Sbug 
    dw $0007,$FFFF 
    db $00 
    db "NP1_02a" 

EnemySets_Attic_1:
    dw EnemyHeaders_KihunterYellow 
    dw $0001 
    dw EnemyHeaders_Atomic 
    dw $0002 
    dw EnemyHeaders_Spark 
    dw $0003,$FFFF 
    db $00 
    db "NP1_08a" 

EnemySets_Basement_1:
    dw EnemyHeaders_Robot 
    dw $0001 
    dw EnemyHeaders_Atomic 
    dw $0002 
    dw EnemyHeaders_Spark 
    dw $0003,$FFFF 
    db $00 
    db "NP1_09a" 

EnemySets_WreckedShipMap_1:
    dw $FFFF 
    db $00 
    db "NP1_12 " 

EnemySets_WSWestSuper_0:
    dw $FFFF 
    db $00 
    db "NP1_05 " 

EnemySets_SpikyDeath_0:
    dw $FFFF 
    db $00 
    db "NP1_11 " 

EnemySets_SpongeBath_0:
    dw $FFFF 
    db $00 
    db "NP1_01a" 

EnemySets_WreckedShipEntrance_1:
    dw $FFFF 
    db $00 
    db "NP1_06 " 

EnemySets_ElectricDeath_0:
    dw $FFFF 
    db $00 
    db "NP1_00a" 

EnemySets_BowlingAlley_1:
    dw EnemyHeaders_Chozo 
    dw $0001 
    dw EnemyHeaders_Robot 
    dw $0003,$FFFF 
    db $00 
    db "NP1_03 " 

EnemySets_AssemblyLine_0:
    dw $FFFF 
    db $00 
    db "NP1_10a" 

EnemySets_Phantoon_1:
    dw $FFFF 
    db $00 
    db "NP1_07 " 

EnemySets_WreckedShipETank_0:
    dw $FFFF 
    db $00 
    db "NP1_14 " 

EnemySets_GravitySuit_0:
    dw $FFFF 
    db $00 
    db "NP1_09 " 

EnemySets_WreckedShipMap_0:
    dw EnemyHeaders_Coven 
    dw $0001 
    dw EnemyHeaders_Sbug 
    dw $0007 
    dw EnemyHeaders_Bull 
    dw $0007,$FFFF 
    db $00 
    db "NP1_14a" 

EnemySets_GravitySuit_1:
    dw $FFFF 
    db $00 
    db "NP1_08 " 

EnemySets_Basement_0:
    dw EnemyHeaders_RobotNoPower 
    dw $0007 
    dw EnemyHeaders_Sbug 
    dw $0007,$FFFF 
    db $00 
    db "NP1_01 " 

EnemySets_WreckedShipEntrance_0:
    dw EnemyHeaders_Sbug 
    dw $0001,$FFFF 
    db $00 
    db "NP1_03a" 

EnemySets_AssemblyLine_1:
    dw EnemyHeaders_Spark 
    dw $0001 
    dw EnemyHeaders_Puyo 
    dw $0002 
    dw EnemyHeaders_Robot 
    dw $0003,$FFFF 
    db $00 
    db "NP1_15a" 

EnemySets_WreckedShipSave_1:
    dw $FFFF 
    db $00 
    db "NP1_12a" 

EnemySets_WSWestSuper_1:
    dw EnemyHeaders_Spark 
    dw $0001,$FFFF 
    db $00 
    db "NP1_02 " 

EnemySets_Attic_0:
    dw EnemyHeaders_Coven 
    dw $0001 
    dw EnemyHeaders_Atomic 
    dw $0002 
    dw EnemyHeaders_Sbug 
    dw $0002,$FFFF 
    db $00 
    db "NP1_13 " 

EnemySets_WSEastSuper_0:
    dw EnemyHeaders_Coven 
    dw $0001 
    dw EnemyHeaders_Atomic 
    dw $0002 
    dw EnemyHeaders_Sbug 
    dw $0002 
    dw EnemyHeaders_RobotNoPower 
    dw $0007,$FFFF 
    db $00 
    db "NP1_15 " 

EnemySets_WreckedShipSave_0:
    dw EnemyHeaders_Coven 
    dw $0001 
    dw EnemyHeaders_Sbug 
    dw $0002,$FFFF 
    db $00 
    db "NP1_06a" 

EnemySets_ElectricDeath_1:
    dw EnemyHeaders_Spark 
    dw $0001,$FFFF 
    db $00 
    db "NP1_05a" 

EnemySets_SpikyDeath_1:
    dw EnemyHeaders_KzanTop 
    dw $0007,$FFFF 
    db $00 
    db "NP1_13a" 

EnemySets_WSEastSuper_1:
    dw EnemyHeaders_Robot 
    dw $0001 
    dw EnemyHeaders_Bull 
    dw $0002 
    dw EnemyHeaders_Spark 
    dw $0003,$FFFF 
    db $00 
    db "NP1_10 " 

EnemySets_Phantoon_0:
    dw EnemyHeaders_PhantoonBody 
    dw $0007,$FFFF 
    db $00 
    db "NP1_04a" 

EnemySets_WreckedShipMainShaft_1:
    dw EnemyHeaders_Spark 
    dw $0001 
    dw EnemyHeaders_Atomic 
    dw $0002 
    dw EnemyHeaders_KzanTop 
    dw $0003,$FFFF 
    db $00 
    db "ML1_08 " 

EnemySets_MtEverest:
    dw EnemyHeaders_Powamp 
    dw $0001 
    dw EnemyHeaders_Sciser 
    dw $0003,$FFFF 
    db $00 
    db "ML2_25 " 

EnemySets_HalfieClimb:
    dw EnemyHeaders_Oum 
    dw $0001 
    dw EnemyHeaders_Mochtroid 
    dw $0002,$FFFF 
    db $00 
    db "ML1_10 " 

EnemySets_WateringHole:
    dw EnemyHeaders_Choot 
    dw $0001 
    dw EnemyHeaders_Zeb 
    dw $0002,$FFFF 
    db $00 
    db "ML1_12 " 

EnemySets_CrabShaft:
    dw EnemyHeaders_Sciser 
    dw $0001,$FFFF 
    db $00 
    db "ML1_19 " 

EnemySets_MaridiaElev:
    dw EnemyHeaders_Ripper 
    dw $0003 
    dw EnemyHeaders_Owtch 
    dw $0007,$FFFF 
    db $00 
    db "ML2_16 " 

EnemySets_Colosseum:
    dw EnemyHeaders_Mochtroid 
    dw $0001,$FFFF 
    db $00 
    db "ML2_17 " 

EnemySets_AqueductSave:
    dw $FFFF 
    db $00 
    db "ML2_18 " 

EnemySets_ThePrecious:
    dw $FFFF 
    db $00 
    db "ML2_19 " 

EnemySets_BotwoonETank:
    dw EnemyHeaders_Puyo 
    dw $0001 
    dw EnemyHeaders_Sciser 
    dw $0001 
    dw EnemyHeaders_Zoa 
    dw $0002,$FFFF 
    db $00 
    db "ML2_20 " 

EnemySets_DraygonSave:
    dw $FFFF 
    db $00 
    db "ML2_21 " 

EnemySets_MaridiaMissileRefill:
    dw $FFFF 
    db $00 
    db "ML2_22 " 

EnemySets_PlasmaBeachQuicksand:
    dw EnemyHeaders_Bull 
    dw $0001,$FFFF 
    db $00 
    db "ML2_23 " 

EnemySets_BotwoonQuicksand:
    dw EnemyHeaders_Bull 
    dw $0001,$FFFF 
    db $00 
    db "ML2_24 " 

EnemySets_Shaktool:
    dw EnemyHeaders_Shaktool 
    dw $0001 
    dw EnemyHeaders_Yard 
    dw $0002,$FFFF 
    db $00 
    db "MLB_00" 

EnemySets_Draygon_0:
    dw EnemyHeaders_DraygonBody 
    dw $0007,$FFFF 
    db $00 
    db "ML2_09 " 

EnemySets_Aqueduct:
    dw EnemyHeaders_Yard 
    dw $0001,$FFFF 
    db $00 
    db "ML1_09 " 

EnemySets_RedFish:
    dw EnemyHeaders_Skultera 
    dw $0001 
    dw EnemyHeaders_Sciser 
    dw $0001 
    dw EnemyHeaders_Zebbo 
    dw $0002,$FFFF 
    db $00 
    db "ML1_17 " 

EnemySets_Plasma:
    dw EnemyHeaders_PirateMagentaWalking 
    dw $0001 
    dw EnemyHeaders_PirateMagentaWall 
    dw $0002,$FFFF 
    db $00 
    db "ML2_27 " 

EnemySets_SpaceJump:
    dw $FFFF 
    db $00 
    db "ML2_12 " 

EnemySets_Pants:
    dw EnemyHeaders_Menu 
    dw $0001 
    dw EnemyHeaders_Puyo 
    dw $0002 
    dw EnemyHeaders_Tripper 
    dw $0002,$FFFF 
    db $00 
    db "ML1_00 " 

EnemySets_GlassTunnelSave:
    dw $FFFF 
    db $00 
    db "ML1_01 " 

EnemySets_GlassTunnel:
    dw EnemyHeaders_NoobTubeCrack 
    dw $0007,$FFFF 
    db $00 
    db "ML1_02 " 

EnemySets_WestTunnel:
    dw $FFFF 
    db $00 
    db "ML1_03 " 

EnemySets_EastTunnel:
    dw EnemyHeaders_Boyon 
    dw $0001 
    dw EnemyHeaders_Zebbo 
    dw $0002,$FFFF 
    db $00 
    db "ML1_06 " 

EnemySets_MamaTurtle:
    dw EnemyHeaders_MamaTurtle 
    dw $0001,$FFFF 
    db $00 
    db "ML1_07 " 

EnemySets_CrabTunnel:
    dw EnemyHeaders_Sciser 
    dw $0001,$FFFF 
    db $00 
    db "ML1_11 " 

EnemySets_NWestMaridiaBug:
    dw EnemyHeaders_Owtch 
    dw $0001 
    dw EnemyHeaders_Menu 
    dw $0002,$FFFF 
    db $00 
    db "ML1_13 " 

EnemySets_PseudoPlasmaSpark:
    dw EnemyHeaders_Owtch 
    dw $0001 
    dw EnemyHeaders_Choot 
    dw $0002 
    dw EnemyHeaders_Skultera 
    dw $0003,$FFFF 
    db $00 
    db "ML1_15 " 

EnemySets_WestSandHallTunnel:
    dw EnemyHeaders_Sciser 
    dw $0001,$FFFF 
    db $00 
    db "ML1_16 " 

EnemySets_PlasmaTutorial:
    dw EnemyHeaders_Puyo 
    dw $0001 
    dw EnemyHeaders_MZoomer 
    dw $0001,$FFFF 
    db $00 
    db "ML1_18 " 

EnemySets_ThreadTheNeedle:
    dw EnemyHeaders_Puyo 
    dw $0001 
    dw EnemyHeaders_Boyon 
    dw $0001 
    dw EnemyHeaders_Choot 
    dw $0002,$FFFF 
    db $00 
    db "ML1_20 " 

EnemySets_PlasmaSpark:
    dw EnemyHeaders_Owtch 
    dw $0001 
    dw EnemyHeaders_Choot 
    dw $0002 
    dw EnemyHeaders_Skultera 
    dw $0003,$FFFF 
    db $00 
    db "ML2_00 " 

EnemySets_Toilet:
    dw EnemyHeaders_Mochtroid 
    dw $0001 
    dw EnemyHeaders_Puyo 
    dw $0002 
    dw EnemyHeaders_Sciser 
    dw $0002 
    dw EnemyHeaders_Yard 
    dw $0003,$FFFF 
    db $00 
    db "ML2_02 " 

EnemySets_WestSandHall:
    dw EnemyHeaders_Evir 
    dw $0001,$FFFF 
    db $00 
    db "ML2_03 " 

EnemySets_Oasis:
    dw $FFFF 
    db $00 
    db "ML2_04 " 

EnemySets_EastSandHall:
    dw EnemyHeaders_Evir 
    dw $0001,$FFFF 
    db $00 
    db "ML2_07 " 

EnemySets_WestAqueductQuicksand:
    dw EnemyHeaders_Bull 
    dw $0001,$FFFF 
    db $00 
    db "ML2_08 " 

EnemySets_EastAqueductQuicksand:
    dw EnemyHeaders_Bull 
    dw $0001,$FFFF 
    db $00 
    db "ML2_10 " 

EnemySets_Butterfly:
    dw EnemyHeaders_Zoa 
    dw $0001,$FFFF 
    db $00 
    db "ML2_11 " 

EnemySets_BotwoonHallway:
    dw EnemyHeaders_Mochtroid 
    dw $0001 
    dw EnemyHeaders_Puyo 
    dw $0002 
    dw EnemyHeaders_Sciser 
    dw $0002,$FFFF 
    db $00 
    db "ML2_13 " 

EnemySets_EastPants:
    dw EnemyHeaders_Puyo 
    dw $0001 
    dw EnemyHeaders_Tripper 
    dw $0001,$FFFF 
    db $00 
    db "ML2_14 " 

EnemySets_Springball:
    dw $FFFF 
    db $00 
    db "ML2_15 " 

EnemySets_BelowBotwoonETank:
    dw EnemyHeaders_Zoa 
    dw $0001 
    dw EnemyHeaders_Owtch 
    dw $0002,$FFFF 
    db $00 
    db "ML1_21 " 

EnemySets_Kassiuz:
    dw EnemyHeaders_Choot 
    dw $0001 
    dw EnemyHeaders_Puyo 
    dw $0002 
    dw EnemyHeaders_Boyon 
    dw $0002,$FFFF 
    db $00 
    db "ML1_23 " 

EnemySets_ForgottenHighwaySave:
    dw $FFFF 
    db $00 
    db "ML2_28 " 

EnemySets_MaridiaEnergyRefill:
    dw $FFFF 
    db $00 
    db "ML1_22 " 

EnemySets_MaridiaMap:
    dw $FFFF 
    db $00 
    db "ML1_14 " 

EnemySets_CrabHole:
    dw EnemyHeaders_Sciser 
    dw $0001,$FFFF 
    db $00 
    db "ML2_26 " 

EnemySets_Botwoon:
    dw EnemyHeaders_Owtch 
    dw $0001 
    dw EnemyHeaders_Botwoon 
    dw $0007,$FFFF 
    db $00 
    db "ML1_04 " 

EnemySets_MainStreet:
    dw EnemyHeaders_Skultera 
    dw $0001 
    dw EnemyHeaders_Sciser 
    dw $0002,$FFFF 
    db $00 
    db "ML2_01 " 

EnemySets_BugSandHole:
    dw EnemyHeaders_YappingMaw 
    dw $0001 
    dw EnemyHeaders_Zoa 
    dw $0007,$FFFF 
    db $00 
    db "ML2_06 " 

EnemySets_EastSandHole:
    dw EnemyHeaders_Boulder 
    dw $0001,$FFFF 
    db $00 
    db "ML2_05 " 

EnemySets_WestSandHole:
    dw EnemyHeaders_Boulder 
    dw $0001,$FFFF 
    db $00 
    db "ML2_29 " 

EnemySets_WestCactusAlley:
    dw EnemyHeaders_Cacatac 
    dw $0007 
    dw EnemyHeaders_Zoa 
    dw $0007,$FFFF 
    db $00 
    db "ML2_30 " 

EnemySets_EastCactusAlley:
    dw EnemyHeaders_Cacatac 
    dw $0001 
    dw EnemyHeaders_Zoa 
    dw $0001,$FFFF 
    db $00 
    db "ML1_05 " 

EnemySets_FishTank:
    dw EnemyHeaders_Skultera 
    dw $0001 
    dw EnemyHeaders_PirateMagentaWalking 
    dw $0002,$FFFF 
    db $00 
    db "TS1_17 " 

EnemySets_TourianEscape4:
    dw EnemyHeaders_PirateSilverWall 
    dw $0001 
    dw EnemyHeaders_PirateSilverWalking 
    dw $0002,$FFFF 
    db $00 
    db "TS1_13 " 

EnemySets_MotherBrainSave:
    dw $FFFF 
    db $00 
    db "TS1_01 " 

EnemySets_Metroids1_0:
    dw EnemyHeaders_Metroid 
    dw $0001 
    dw EnemyHeaders_Rinka 
    dw $0002,$FFFF 
    db $00 
    db "TS1_06 " 

EnemySets_DustTorizo:
    dw EnemyHeaders_CorpseTorizo 
    dw $0001,$FFFF 
    db $00 
    db "TS1_07 " 

EnemySets_BigBoy:
    dw EnemyHeaders_CorpseSidehopper 
    dw $0001 
    dw EnemyHeaders_CorpseSidehopper2 
    dw $0001 
    dw EnemyHeaders_BabyMetroid 
    dw $0001,$FFFF 
    db $00 
    db "TS1_10 " 

EnemySets_MotherBrain_0_1:
    dw EnemyHeaders_MotherBrainHead 
    dw $0001 
    dw EnemyHeaders_Rinka 
    dw $0002 
    dw EnemyHeaders_MotherBrainBody 
    dw $D001,$FFFF 
    db $00 
    db "TS1_11 " 

EnemySets_TourianEyeDoor:
    dw $FFFF 
    db $00 
    db "TS1_05 " 

EnemySets_BlueHopper:
    dw EnemyHeaders_SidehopperTourian 
    dw $0001,$FFFF 
    db $00 
    db "TS1_14 " 

EnemySets_TourianEscape1:
    dw EnemyHeaders_ShutterDestroyable 
    dw $0001,$FFFF 
    db $00 
    db "TS1_00 " 

EnemySets_TourianFirst:
    dw $FFFF 
    db $00 
    db "TS1_02 " 

EnemySets_Metroids2_0:
    dw EnemyHeaders_Metroid 
    dw $0001 
    dw EnemyHeaders_Rinka 
    dw $0002,$FFFF 
    db $00 
    db "TS1_04 " 

EnemySets_Metroids4_0:
    dw EnemyHeaders_Metroid 
    dw $0001 
    dw EnemyHeaders_Rinka 
    dw $0002,$FFFF 
    db $00 
    db "TS1_01 " 

EnemySets_Metroids1_1:
    dw EnemyHeaders_Rinka 
    dw $0002,$FFFF 
    db $00 
    db "TS1_02 " 

EnemySets_Metroids2_1:
    dw EnemyHeaders_Rinka 
    dw $0002,$FFFF 
    db $00 
    db "TS1_15 " 

EnemySets_TourianEscape2:
    dw EnemyHeaders_PirateSilverWall 
    dw $0001,$FFFF 
    db $00 
    db "TS1_03 " 

EnemySets_Metroids3_1:
    dw EnemyHeaders_Rinka 
    dw $0002,$FFFF 
    db $00 
    db "TS1_04 " 

EnemySets_Metroids4_1:
    dw EnemyHeaders_Rinka 
    dw $0002,$FFFF 
    db $00 
    db "TS1_16 " 

EnemySets_TourianEscape3:
    dw EnemyHeaders_PirateSilverWalking 
    dw $0001 
    dw EnemyHeaders_ShutterGrowing 
    dw $0002,$FFFF 
    db $00 
    db "TS1_08 " 

EnemySets_Seaweed:
    dw $FFFF 
    db $00 
    db "TS1_09 " 

EnemySets_TourianRecharge:
    dw $FFFF 
    db $00 
    db "TS1_07 " 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemySets_B491D8:
    dw EnemyHeaders_CorpseSidehopper 
    dw $0001 
    dw EnemyHeaders_CorpseSidehopper2 
    dw $0001 
    dw EnemyHeaders_BabyMetroid 
    dw $0001,$FFFF 
    db $00 
    db "TS1_18 " 
endif ; !FEATURE_KEEP_UNREFERENCED

EnemySets_UpperTourianSave:
    dw $FFFF 
    db $00 
    db "TS1_03 " 

EnemySets_Metroids3_0:
    dw EnemyHeaders_Metroid 
    dw $0001 
    dw EnemyHeaders_Rinka 
    dw $0002,$FFFF 
    db $00 
    db "TS1_12 " 

EnemySets_RinkaShaft:
    dw EnemyHeaders_Rinka 
    dw $0002,$FFFF 
    db $00 
    db "cl1_00 " 

EnemySets_CeresElev_0:
    dw EnemyHeaders_CeresDoor 
    dw $D002,$FFFF 
    db $00 
    db "cl1_01 " 

EnemySets_FallingTile_0:
    dw EnemyHeaders_CeresDoor 
    dw $D002,$FFFF 
    db $00 
    db "cl1_02 " 

EnemySets_MagnetStairs_0:
    dw EnemyHeaders_CeresDoor 
    dw $D002,$FFFF 
    db $00 
    db "cl1_03 " 

EnemySets_DeadScientist_0:
    dw EnemyHeaders_CeresDoor 
    dw $D002,$FFFF 
    db $00 
    db "cl1_04 " 

EnemySets_58Escape_0:
    dw EnemyHeaders_CeresDoor 
    dw $D002,$FFFF 
    db $00 
    db "cl1_05 " 

EnemySets_CeresRidley_0:
    dw EnemyHeaders_RidleyCeres 
    dw $0001 
    dw EnemyHeaders_CeresDoor 
    dw $D002,$FFFF 
    db $00 
    db "cl1_00 " 

EnemySets_CeresElev_1:
    dw EnemyHeaders_CeresDoor 
    dw $D002,$FFFF 
    db $00 
    db "cl1_01 " 

EnemySets_FallingTile_1:
    dw EnemyHeaders_CeresDoor 
    dw $D002,$FFFF 
    db $00 
    db "cl1_02 " 

EnemySets_MagnetStairs_1:
    dw EnemyHeaders_CeresDoor 
    dw $D002,$FFFF 
    db $00 
    db "cl1_03 " 

EnemySets_DeadScientist_1:
    dw EnemyHeaders_CeresDoor 
    dw $D002,$FFFF 
    db $00 
    db "cl1_04 " 

EnemySets_58Escape_1:
    dw EnemyHeaders_CeresDoor 
    dw $D002,$FFFF 
    db $00 
    db "cl1_05 " 

EnemySets_CeresRidley_1:
    dw EnemyHeaders_CeresDoor 
    dw $D002,$FFFF 
    db $00 
    db "TT_00 " 

EnemySets_Debug:
    dw $FFFF 
    db $00 

DebugHandler_7_EnemyDebugger_EnemySpawnDataEditor:
    JSR.W Debug_HandleCursorMovement 
    JSR.W Debug_HandleDigitModification 
    LDA.W #$0800 : STA.B $26 
    LDA.W $1860 : STA.B $14 
    LDA.W $1862 : STA.B $12 
    LDA.W #$001C 
    JSL.L Add_Debug_Spritemap_to_OAM 
    LDA.W #$0A00 : STA.B $26 
    LDA.W #$00B0 : STA.B $14 
    LDA.W #$0048 : STA.B $12 
    LDA.W #$002F 
    JSL.L Add_Debug_Spritemap_to_OAM 
    LDA.W #$0A00 : STA.B $26 
    LDA.W #$00B0 : STA.B $14 
    LDA.W #$0048 : STA.B $12 
    LDX.W $1846 
    LDA.W $0F78,X 
    TAX 
    LDA.L $A0003E,X 
    BNE .nonZeroName 
    LDA.W #$0030 
    BRA .draw 


.nonZeroName:
    TAX 
    LDA.L $B4000C,X : CLC : ADC.W #$0030 

.draw:
    JSL.L Add_Debug_Spritemap_to_OAM 
    JSR.W Draw_Debug_Enemy_Spawn_Values 
    LDA.B $91 
    BIT.W #$0010 
    BEQ .checkSelect 
    STZ.W $185C 
    LDA.W #$0001 
    RTS 


.checkSelect:
    LDA.B $91 
    BIT.W #$2000 
    BEQ .checkA 
    INC.W $185C 
    STZ.W $185E 

.checkA:
    LDA.B $91 
    BIT.W #$0080 
    BEQ .checkL 
    LDX.W $1846 
    LDA.W $0F7A,X : STA.L $7E7020,X 
    LDA.W $0F7E,X : STA.L $7E7022,X 

.checkL:
    LDA.B $91 
    BIT.W #$0020 
    BEQ .return 
    INC.W $185C 
    INC.W $185C 

.return:
    LDA.W #$0001 
    RTS 


Draw_Debug_Enemy_Spawn_Values:
    LDX.W $1846 
    LDA.L $7E7020,X : STA.W $0E24 
    LDA.W #$00C8 : STA.W $0E20 
    LDA.W #$0038 : STA.W $0E22 
    JSR.W Draw4DigitHexValue 
    LDX.W $1846 
    LDA.L $7E7022,X : STA.W $0E24 
    LDA.W #$00C8 : STA.W $0E20 
    LDA.W #$0040 : STA.W $0E22 
    JSR.W Draw4DigitHexValue 
    LDX.W $1846 
    LDA.L $7E7024,X : STA.W $0E24 
    LDA.W #$00C8 : STA.W $0E20 
    LDA.W #$0048 : STA.W $0E22 
    JSR.W Draw4DigitHexValue 
    LDX.W $1846 
    LDA.L $7E7026,X : STA.W $0E24 
    LDA.W #$00C8 : STA.W $0E20 
    LDA.W #$0050 : STA.W $0E22 
    JSR.W Draw4DigitHexValue 
    LDX.W $1846 
    LDA.L $7E7028,X : STA.W $0E24 
    LDA.W #$00C8 : STA.W $0E20 
    LDA.W #$0058 : STA.W $0E22 
    JSR.W Draw4DigitHexValue 
    LDX.W $1846 
    LDA.L $7E702A,X : STA.W $0E24 
    LDA.W #$00C8 : STA.W $0E20 
    LDA.W #$0060 : STA.W $0E22 
    JSR.W Draw4DigitHexValue 
    LDX.W $1846 
    LDA.L $7E702C,X : STA.W $0E24 
    LDA.W #$00C8 : STA.W $0E20 
    LDA.W #$0068 : STA.W $0E22 
    JSR.W Draw4DigitHexValue 
    RTS 


Debug_Draw_Enemy_Set_Name:
    PHX 
    LDA.W #$0A00 : STA.B $26 
    LDA.W #$00B0 : STA.B $14 
    LDA.W #$0058 : STA.B $12 
    LDA.W $079F : CLC : ADC.W #$0014 : JSL.L Add_Debug_Spritemap_to_OAM 
    LDA.W $07D1 : SEC : SBC.W #$0007 : TAX 
    LDA.L $B40002,X 
    AND.W #$00FF 
    SEC : SBC.W #$002C : STA.B $16 
    LDA.W #$0A00 : STA.B $26 
    LDA.W #$00A8 : STA.B $14 
    LDA.W #$0058 : STA.B $12 
    LDA.B $16 
    JSL.L Add_Debug_Spritemap_to_OAM 
    LDA.W $07D1 : SEC : SBC.W #$0007 : TAX 
    LDA.L $B40004,X 
    AND.W #$00FF 
    SEC : SBC.W #$002C : STA.B $16 
    LDA.W #$0A00 : STA.B $26 
    LDA.W #$00B8 : STA.B $14 
    LDA.W #$0058 : STA.B $12 
    LDA.B $16 
    JSL.L Add_Debug_Spritemap_to_OAM 
    LDA.W $07D1 : SEC : SBC.W #$0007 : TAX 
    LDA.L $B40005,X 
    AND.W #$00FF 
    SEC : SBC.W #$002C : STA.B $16 
    LDA.W #$0A00 : STA.B $26 
    LDA.W #$00C0 : STA.B $14 
    LDA.W #$0058 : STA.B $12 
    LDA.B $16 
    JSL.L Add_Debug_Spritemap_to_OAM 
    PLX 
    RTS 


DebugHandler_8_EnemyDebugger_RespawnEnemy:
    PHB 
    PEA.W $7E7E 
    PLB 
    PLB 
    LDA.W #$701E : CLC : ADC.W $1846 : TAX 
    LDY.W $1846 
    JSL.L Debug_SpawnEnemy_ToEnemyIndex_inY 
    PLB 
    STZ.W $185C 
    LDA.W #$0001 
    RTS 


DebugHandler_9_EnemyDebugger_EnemySpawner:
    LDA.W $07D1 
    TAX 
    STA.W $0E26 
    LDX.W $0E26 
    LDA.W #$0038 : STA.W $0E2A 

.loop:
    LDX.W $0E26 
    LDA.L $B40000,X 
    CMP.W #$FFFF 
    BEQ .endLoop 
    TAX 
    LDA.L $A0003E,X 
    TAX 
    LDA.L $B4000C,X : CLC : ADC.W #$0030 : STA.B $16 
    LDA.W #$0A00 : STA.B $26 
    LDA.W #$00A8 : STA.B $14 
    LDA.W $0E2A : CLC : ADC.W #$0018 : STA.B $12 
    LDA.B $16 
    AND.W #$00FF 
    JSL.L Add_Debug_Spritemap_to_OAM 
    LDX.W $0E26 
    LDA.L $B40002,X : STA.W $0E24 
    LDA.W #$00D8 : STA.W $0E20 
    LDA.W $0E2A : STA.W $0E22 
    JSR.W Draw4DigitHexValue 
    LDA.W $0E2A : CLC : ADC.W #$0008 : STA.W $0E2A 
    LDA.W $0E26 : CLC : ADC.W #$0004 : STA.W $0E26 
    BRA .loop 


.endLoop:
    LDA.W #$0A00 : STA.B $26 
    LDA.W #$00B0 : STA.B $14 
    LDA.W #$0048 : STA.B $12 
    LDX.W $1846 
    LDA.L $7E701E,X 
    BNE .hasSpawnID 
    LDA.W #$0030 
    BRA .resolvedName 


.hasSpawnID:
    TAX 
    LDA.L $A0003E,X 
    BNE + 
    LDA.W #$0030 
    BRA .resolvedName 


  + TAX 
    LDA.L $B4000C,X : CLC : ADC.W #$0030 

.resolvedName:
    JSL.L Add_Debug_Spritemap_to_OAM 
    LDA.B $91 
    BIT.W #$0400 
    BEQ .checkTerminator 
    LDA.W $1864 : CLC : ADC.W #$0004 : CMP.W #$0010 
    BNE + 
    LDA.W #$0000 

  + STA.W $1864 

.checkTerminator:
    LDA.W $07D1 : CLC : ADC.W $1864 : TAX 
    LDA.L $B40000,X 
    CMP.W #$FFFF 
    BNE + 
    STZ.W $1864 
    LDX.W $07D1 
    LDA.L $B40000,X 

  + STA.B $12 
    TAX 
    LDA.L $A0003E,X 
    TAX 
    LDA.L $B4000A,X 
    TAX 
    STX.W $1866 
    LDX.W $1846 
    LDA.B $12 : STA.L $7E701E,X 
    LDA.B $91 
    BIT.W #$0010 
    BEQ .checkL 
    STZ.W $185C 
    LDA.W #$0001 
    RTS 


.checkL:
    LDA.B $91 
    BIT.W #$0020 
    BNE .checkB 
    LDA.W #$0001 
    RTS 


.checkB:
    LDX.W $1866 
    CMP.W #$8000 
    BMI + 
    LDA.L $B40000,X 
    TAX 
    LDA.L $A0003E,X 
    TAX 
    LDA.L $B4000C,X 
    BNE + 
    STZ.W $185C 
    LDA.W #$0001 
    RTS 


  + LDY.W $1846 
    LDA.W $0F7A,Y : STA.W $1868 
    LDA.W $0F7E,Y : STA.W $186A 
    PHB 
    PEA.W $B4B4 
    PLB 
    PLB 
    LDY.W $1846 
    LDX.W $1866 
    JSL.L Debug_SpawnEnemy_ToEnemyIndex_inY 
    PLB 
    LDY.W $1846 
    LDA.W $1868 : STA.W $0F7A,Y 
    LDA.W $186A : STA.W $0F7E,Y 
    PHX 
    PHY 
    TYX 
    JSL.L Record_EnemySpawnData 
    PLY 
    PLX 
    STZ.W $185C 
    LDA.W #$0001 
    RTS 


Debug_HandleCursorMovement:
    LDA.B $91 
    BIT.W #$0100 
    BEQ .noRight 
    LDA.W $1860 : CLC : ADC.W #$0008 : CMP.W #$00E0 
    BNE + 
    LDA.W #$00C0 

  + STA.W $1860 
    BRA .return 


.noRight:
    BIT.W #$0200 
    BEQ .noLeft 
    LDA.W $1860 : SEC : SBC.W #$0008 : CMP.W #$00B8 
    BNE + 
    LDA.W #$00D8 

  + STA.W $1860 
    BRA .return 


.noLeft:
    BIT.W #$0400 
    BEQ .noDown 
    LDA.W $1862 : CLC : ADC.W #$0008 : CMP.W #$0068 
    BNE + 
    LDA.W #$0030 

  + STA.W $1862 
    BRA .return 


.noDown:
    BIT.W #$0800 
    BEQ .return 
    LDA.W $1862 : SEC : SBC.W #$0008 : CMP.W #$0028 
    BNE .setCursorY 
    LDA.W #$0060 

.setCursorY:
    STA.W $1862 

.return:
    RTS 


Debug_HandleDigitModification:
    LDX.W $1846 
    LDA.L $7E7020,X : STA.B $12 
    LDA.L $7E7022,X : STA.B $14 
    LDA.L $7E7024,X : STA.B $16 
    LDA.L $7E7026,X : STA.B $18 
    LDA.L $7E7028,X : STA.B $1A 
    LDA.L $7E702A,X : STA.B $1C 
    LDA.L $7E702C,X : STA.B $1E 
    LDA.B $91 
    BIT.W #$0040 
    BEQ .notNewlyPressedX 
    LDA.W $1860 : SEC : SBC.W #$00C0 : LSR #2
    TAX 
    LDA.W $1862 : SEC : SBC.W #$0030 : LSR #2
    TAY 
    LDA.W $0012,Y : CLC : ADC.W .data,X : STA.W $0012,Y 
    BRA + 


.notNewlyPressedX:
    BIT.W #$8000 
    BEQ + 
    LDA.W $1860 : SEC : SBC.W #$00C0 : LSR #2
    TAX 
    LDA.W $1862 : SEC : SBC.W #$0030 : LSR #2
    TAY 
    LDA.W $0012,Y : SEC : SBC.W .data,X : STA.W $0012,Y 

  + LDX.W $1846 
    LDA.B $12 : STA.L $7E7020,X 
    LDA.B $14 : STA.L $7E7022,X 
    LDA.B $16 : STA.L $7E7024,X 
    LDA.B $18 : STA.L $7E7026,X 
    LDA.B $1A : STA.L $7E7028,X 
    LDA.B $1C : STA.L $7E702A,X 
    LDA.B $1E : STA.L $7E702C,X 
    RTS 


.data:
    dw $1000,$0100,$0010,$0001 

DebugHandler_10_EnemyDebugger_EnemyAllocationViewer:
    LDA.B $91 
    BIT.W #$2000 
    BEQ .notNewlyPressedSelect 
    STZ.W $185C 
    LDA.W #$0000 
    RTS 


.notNewlyPressedSelect:
    LDA.W $07D1 
    TAX 
    STA.W $0E26 
    LDX.W $0E26 
    LDA.W #$0038 : STA.W $0E2A 
    STZ.W $0E2C 

.loop:
    LDX.W $0E26 
    LDA.L $B40000,X 
    CMP.W #$FFFF 
    BEQ .terminated 
    TAX 
    LDA.L $A00000,X 
    XBA 
    AND.W #$00FF 
    LSR A 
    CLC : ADC.W $0E2C : STA.W $0E2C 
    LDA.L $A0003E,X 
    TAX 
    LDA.L $B4000C,X : CLC : ADC.W #$0030 : STA.B $16 
    LDA.W #$0A00 : STA.B $26 
    LDA.W #$00A8 : STA.B $14 
    LDA.W $0E2A : CLC : ADC.W #$0018 : STA.B $12 
    LDA.B $16 
    AND.W #$00FF 
    JSL.L Add_Debug_Spritemap_to_OAM 
    LDX.W $0E26 
    LDA.L $B40002,X : STA.W $0E24 
    LDA.W #$00D8 : STA.W $0E20 
    LDA.W $0E2A : STA.W $0E22 
    JSR.W Draw4DigitHexValue 
    LDA.W $0E2A : CLC : ADC.W #$0008 : STA.W $0E2A 
    LDA.W $0E26 : CLC : ADC.W #$0004 : STA.W $0E26 
    BRA .loop 


.terminated:
    LDA.W $0E2C : STA.W $0E24 
    LDA.W #$00A8 : STA.W $0E20 
    LDA.W $0E2A : STA.W $0E22 
    JSR.W Draw4DigitHexValue 
    LDA.W #$0000 
    RTS 


DebugHandler:
    PHB 
    SEP #$20 
    LDA.B #$B4 
    PHA 
    PLB 
    REP #$30 
    LDA.W $185C 
    AND.W #$00FF 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    PLB 
    RTL 


.pointers:
    dw DebugHandler_0_Default 
    dw DebugHandler_1_PaletteViewer_SpritePalettes 
    dw DebugHandler_2_PaletteViewer_BGPalettes 
    dw DebugHandler_3_SpriteTilesViewer_SecondHalf 
    dw DebugHandler_4_SpriteTilesViewer_FirstHalf 
    dw DebugHandler_5_EnemyDebugger_Initialize 
    dw DebugHandler_6_EnemyDebugger_EnemyMover 
    dw DebugHandler_7_EnemyDebugger_EnemySpawnDataEditor 
    dw DebugHandler_8_EnemyDebugger_RespawnEnemy 
    dw DebugHandler_9_EnemyDebugger_EnemySpawner 
    dw DebugHandler_A_EnemyDebugger_RAMViewer_0 
    dw DebugHandler_B_EnemyDebugger_RAMViewer_1 
    dw DebugHandler_C_EnemyDebugger_RAMViewer_2 
    dw DebugHandler_D_EnemyDebugger_RAMViewer_3 
    dw DebugHandler_E_EnemyDebugger_RAMViewer_4 
    dw DebugHandler_F_EnemyDebugger_RAMViewer_5 
    dw DebugHandler_10_EnemyDebugger_EnemyAllocationViewer 

DebugHandler_4_SpriteTilesViewer_FirstHalf:
    LDA.W #$0A00 : STA.B $26 
    LDA.W #$0080 : STA.B $14 
    LDA.W #$0080 : STA.B $12 
    LDA.W #$0003 
    JSL.L Add_Debug_Spritemap_to_OAM 
    LDA.W $05C5 
    BIT.W #$0040 
    BNE .resetIndex 
    LDA.W #$0001 
    RTS 


.resetIndex:
    STZ.W $185C 
    LDA.W #$0001 
    RTS 


DebugHandler_3_SpriteTilesViewer_SecondHalf:
    LDA.W $05C5 
    BIT.W #$0080 
    BEQ .noChange 
    LDA.W $185A 
    CMP.W #$0000 
    BNE + 
    LDA.W #$0200 : STA.W $185A 
    BRA .merge 


  + CMP.W #$0200 
    BNE + 
    LDA.W #$0400 : STA.W $185A 
    BRA .merge 


  + CMP.W #$0400 
    BNE + 
    LDA.W #$0600 : STA.W $185A 
    BRA .merge 


  + CMP.W #$0600 
    BNE + 
    LDA.W #$0E00 : STA.W $185A 
    BRA .merge 


  + LDA.W #$0000 : STA.W $185A 
    BRA .merge 


.noChange:
    LDA.W $185A 

.merge:
    STA.B $26 
    LDA.W #$0080 : STA.B $14 
    LDA.W #$0080 : STA.B $12 
    LDA.W #$0002 
    JSL.L Add_Debug_Spritemap_to_OAM 
    LDA.W $05C5 
    BIT.W #$0040 
    BNE .incIndex 
    LDA.W #$0001 
    RTS 


.incIndex:
    INC.W $185C 
    LDA.W #$0001 
    RTS 


DebugHandler_1_PaletteViewer_SpritePalettes:
    LDA.W #$0000 : STA.B $26 
    LDA.W #$0060 : STA.B $14 
    STA.B $12 
    LDA.W #$0000 
    JSL.L Add_Debug_Spritemap_to_OAM 
    LDA.W #$0000 : STA.B $26 
    LDA.W #$00A0 : STA.B $14 
    LDA.W #$0060 : STA.B $12 
    LDA.W #$0001 
    JSL.L Add_Debug_Spritemap_to_OAM 
    LDA.W $05C5 
    BIT.W #$0080 
    BNE .setupLoop 
    LDA.W #$0001 
    RTS 


.setupLoop:
    LDX.W #$00FE 

.loop:
    LDA.L $7EC000,X : STA.L $7EC100,X 
    DEX #2
    BNE .loop 
    INC.W $185C 
    LDA.W #$0001 
    RTS 


DebugHandler_2_PaletteViewer_BGPalettes:
    LDA.W #$0000 : STA.B $26 
    LDA.W #$0060 : STA.B $14 
    STA.B $12 
    LDA.W #$0000 
    JSL.L Add_Debug_Spritemap_to_OAM 
    LDA.W #$0000 : STA.B $26 
    LDA.W #$00A0 : STA.B $14 
    LDA.W #$0060 : STA.B $12 
    LDA.W #$0001 
    JSL.L Add_Debug_Spritemap_to_OAM 
    LDA.W $05C5 
    BIT.W #$0080 
    BNE .resetIndex 
    LDA.W #$0001 
    RTS 


.resetIndex:
    STZ.W $185C 
    LDA.W #$0001 
    RTS 


DebugHandler_0_Default:
    LDA.B $91 
    BIT.W #$1000 
    BEQ .checkL 
    LDX.W #$001D 
    STX.W $0998 
    STZ.W $0727 

.checkL:
    LDA.B $91 
    BIT.W #$0020 
    BEQ .notNewlyPressedStartL 
    LDA.W $185E : EOR.W #$0001 : STA.W $185E 

.notNewlyPressedStartL:
    LDA.W $05C5 
    BIT.W #$0080 
    BNE .SelectLA 
    LDA.W $05C5 
    BIT.W #$0040 
    BNE .SelectLX 
    LDA.B $91 
    AND.W #$0010 
    BNE .R 
    LDA.B $91 
    BIT.W #$2000 
    BNE .Select 
    LDA.B $91 
    BIT.W #$0080 
    BNE .A 
    STZ.W $185C 
    LDA.W #$0000 
    RTS 


.A:
    LDY.W #$0001 
    LDA.W $0E12 
    BEQ .toggle 
    LDY.W #$0000 

.toggle:
    TYA 
    STA.W $0E12 
    LDA.W #$0000 
    RTS 


.Select:
    LDA.W #$0010 : STA.W $185C 
    LDA.W #$0000 
    RTS 


.SelectLX:
    INC.W $185C 
    INC.W $185C 
    INC.W $185C 
    LDA.W #$0001 
    RTS 


.R:
    INC.W $185C 
    INC.W $185C 
    INC.W $185C 
    INC.W $185C 
    INC.W $185C 
    LDA.W #$0000 
    RTS 


.SelectLA:
    SEP #$20 
    LDA.B #$80 : STA.W $2100 
    LDA.B #$00 : STA.W $2116 
    LDA.B #$70 : STA.W $2117 
    LDA.B #$80 : STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl Tiles_Debug_PaletteViewer 
    dw $1000 
    LDA.B #$02 : STA.W $420B 
    STZ.W $2100 
    REP #$20 
    INC.W $185C 
    LDA.W #$0001 
    RTS 


DebugHandler_5_EnemyDebugger_Initialize:
    SEP #$20 
    LDA.B #$80 : STA.W $2100 
    LDA.B #$00 : STA.W $2116 
    LDA.B #$6B : STA.W $2117 
    LDA.B #$80 : STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl Tiles_DebuggerFont 
    dw $0A00 
    LDA.B #$02 : STA.W $420B 
    STZ.W $2100 
    REP #$20 
    LDA.W #$00C0 : STA.W $1860 
    LDA.W #$0030 : STA.W $1862 
    INC.W $185C 
    RTS 


DebugHandler_6_EnemyDebugger_EnemyMover:
    LDA.B $91 
    BIT.W #$0010 
    BEQ .checkSelect 
    INC.W $185C 
    LDA.W #$0000 
    RTS 


.checkSelect:
    LDA.B $91 
    BIT.W #$2000 
    BEQ .checkA 
    LDA.B $8D 
    BIT.W #$8000 
    BNE .pressingB 
    LDA.W $1846 : CLC : ADC.W #$0040 : CMP.W #$0800 
    BMI + 
    LDA.W #$0000 

  + STA.W $1846 
    BRA .checkA 


.pressingB:
    LDA.W $1846 : SEC : SBC.W #$0040 : BNE + 
    LDA.W #$07C0 

  + STA.W $1846 

.checkA:
    LDA.B $91 
    BIT.W #$0080 
    BEQ .checkX 
    LDX.W $1846 
    LDA.W $0AF6 : CLC : ADC.W #$0020 : STA.W $0F7A,X 
    LDA.W $0AFA : STA.W $0F7E,X 

.checkX:
    LDX.W $1846 
    LDA.B $8D 
    BIT.W #$0040 
    BEQ .moveWithDpad 
    JSL.L Debug_MoveEnemyWithDpad_4PixelsPerFrame 
    BRA + 


.moveWithDpad:
    JSL.L Debug_MoveEnemyWithDpad_QuarterPixelPerFrame 

  + LDX.W $1846 
    LDA.W $0F7A,X 
    CMP.W $0911 
    BMI + 
    LDA.W $0911 : CLC : ADC.W #$0100 : CMP.W $0F7A,X 
    BMI + 
    LDA.W $0F7E,X 
    CMP.W $0915 
    BMI + 
    LDA.W $0915 : CLC : ADC.W #$0100 : CMP.W $0F7E,X 
    BMI + 
    LDX.W $1846 
    LDA.W $0F7A,X : SEC : SBC.W $0911 : STA.B $14 
    STA.W $0E22 
    LDA.W $0F7E,X : SEC : SBC.W $0915 : STA.B $12 
    STA.W $0E20 
    LDA.W $0E22 : CLC : ADC.W #$0020 : STA.B $14 
    LDA.W $0E20 : CLC : ADC.W #$0004 : STA.B $12 
    LDA.W #$0A00 : STA.B $26 
    LDA.W #$0025 
    JSL.L Add_Debug_Spritemap_to_OAM 

  + LDA.W #$00B0 : STA.B $14 
    LDA.W #$0050 : STA.B $12 
    LDA.W #$0A00 : STA.B $26 
    LDA.W #$0027 
    JSL.L Add_Debug_Spritemap_to_OAM 
    LDX.W $1846 
    LDA.W $0F7A,X : STA.W $0E24 
    LDA.W #$00E0 : STA.W $0E20 
    LDA.W #$0038 : STA.W $0E22 
    JSR.W Draw4DigitHexValue 
    LDX.W $1846 
    LDA.W $0F7E,X : STA.W $0E24 
    LDA.W #$00E0 : STA.W $0E20 
    LDA.W #$0040 : STA.W $0E22 
    JSR.W Draw4DigitHexValue 
    LDX.W $1846 
    LDA.W $0F8C,X : STA.W $0E24 
    LDA.W #$00E0 : STA.W $0E20 
    LDA.W #$0048 : STA.W $0E22 
    JSR.W Draw4DigitHexValue 
    LDA.W $1846 : STA.W $0E24 
    LDA.W #$00E0 : STA.W $0E20 
    LDA.W #$0050 : STA.W $0E22 
    JSR.W Draw4DigitHexValue 
    LDA.W #$0A00 : STA.B $26 
    LDA.W #$00B0 : STA.B $14 
    LDA.W #$0048 : STA.B $12 
    LDX.W $1846 
    LDA.W $0F78,X 
    TAX 
    LDA.L $A0003E,X 
    BNE .debugName 
    LDA.W #$0030 
    BRA .draw 


.debugName:
    TAX 
    LDA.L $B4000C,X : CLC : ADC.W #$0030 

.draw:
    JSL.L Add_Debug_Spritemap_to_OAM 
    JSR.W Debug_Draw_Enemy_Set_Name 
    STZ.W $1864 
    LDA.W #$0000 
    RTS 


DebugHandler_A_EnemyDebugger_RAMViewer_0:
    LDA.B $91 
    BIT.W #$0010 
    BEQ + 
    INC.W $185C 
    LDA.W #$0000 
    RTS 


  + LDA.W #$00B0 : STA.B $14 
    LDA.W #$0050 : STA.B $12 
    LDA.W #$0A00 : STA.B $26 
    LDA.W #$0029 
    JSL.L Add_Debug_Spritemap_to_OAM 
    LDX.W $1846 
    LDA.W $0FA4,X : STA.W $0E24 
    LDA.W #$00E0 : STA.W $0E20 
    LDA.W #$0038 : STA.W $0E22 
    JSR.W Draw4DigitHexValue 
    LDX.W $1846 
    LDA.W $0F8A,X : STA.W $0E24 
    LDA.W #$00E0 : STA.W $0E20 
    LDA.W #$0040 : STA.W $0E22 
    JSR.W Draw4DigitHexValue 
    LDX.W $1846 
    LDA.W $0F78,X : STA.W $0E24 
    LDA.W #$00E0 : STA.W $0E20 
    LDA.W #$0048 : STA.W $0E22 
    JSR.W Draw4DigitHexValue 
    LDX.W $1846 
    LDA.W $0FA6,X : STA.W $0E24 
    LDA.W #$00E0 : STA.W $0E20 
    LDA.W #$0050 : STA.W $0E22 
    JSR.W Draw4DigitHexValue 
    LDA.W #$0000 
    RTS 


DebugHandler_B_EnemyDebugger_RAMViewer_1:
    LDA.B $91 
    BIT.W #$0010 
    BEQ + 
    INC.W $185C 
    LDA.W #$0000 
    RTS 


  + LDA.W #$00B0 : STA.B $14 
    LDA.W #$0050 : STA.B $12 
    LDA.W #$0A00 : STA.B $26 
    LDA.W #$002A 
    JSL.L Add_Debug_Spritemap_to_OAM 
    LDX.W $1846 
    LDA.W $0F86,X : STA.W $0E24 
    LDA.W #$00E0 : STA.W $0E20 
    LDA.W #$0038 : STA.W $0E22 
    JSR.W Draw4DigitHexValue 
    LDX.W $1846 
    LDA.W $0F88,X : STA.W $0E24 
    LDA.W #$00E0 : STA.W $0E20 
    LDA.W #$0040 : STA.W $0E22 
    JSR.W Draw4DigitHexValue 
    LDX.W $1846 
    LDA.W $0F96,X : STA.W $0E24 
    LDA.W #$00E0 : STA.W $0E20 
    LDA.W #$0048 : STA.W $0E22 
    JSR.W Draw4DigitHexValue 
    LDX.W $1846 
    LDA.W $0F98,X : STA.W $0E24 
    LDA.W #$00E0 : STA.W $0E20 
    LDA.W #$0050 : STA.W $0E22 
    JSR.W Draw4DigitHexValue 
    LDA.W #$0000 
    RTS 


DebugHandler_C_EnemyDebugger_RAMViewer_2:
    LDA.B $91 
    BIT.W #$0010 
    BEQ + 
    INC.W $185C 
    LDA.W #$0000 
    RTS 


  + LDA.W #$00B0 : STA.B $14 
    LDA.W #$0050 : STA.B $12 
    LDA.W #$0A00 : STA.B $26 
    LDA.W #$002B 
    JSL.L Add_Debug_Spritemap_to_OAM 
    LDX.W $1846 
    LDA.W $0F92,X : STA.W $0E24 
    LDA.W #$00E0 : STA.W $0E20 
    LDA.W #$0038 : STA.W $0E22 
    JSR.W Draw4DigitHexValue 
    LDX.W $1846 
    LDA.W $0F94,X : STA.W $0E24 
    LDA.W #$00E0 : STA.W $0E20 
    LDA.W #$0040 : STA.W $0E22 
    JSR.W Draw4DigitHexValue 
    LDX.W $1846 
    LDA.W $0F90,X : STA.W $0E24 
    LDA.W #$00E0 : STA.W $0E20 
    LDA.W #$0048 : STA.W $0E22 
    JSR.W Draw4DigitHexValue 
    LDX.W $1846 
    LDA.W $0F8E,X : STA.W $0E24 
    LDA.W #$00E0 : STA.W $0E20 
    LDA.W #$0050 : STA.W $0E22 
    JSR.W Draw4DigitHexValue 
    LDA.W #$0000 
    RTS 


DebugHandler_D_EnemyDebugger_RAMViewer_3:
    LDA.B $91 
    BIT.W #$0010 
    BEQ + 
    INC.W $185C 
    LDA.W #$0000 
    RTS 


  + LDA.W #$00B0 : STA.B $14 
    LDA.W #$0050 : STA.B $12 
    LDA.W #$0A00 : STA.B $26 
    LDA.W #$002C 
    JSL.L Add_Debug_Spritemap_to_OAM 
    LDX.W $1846 
    LDA.W $0F9C,X : STA.W $0E24 
    LDA.W #$00E0 : STA.W $0E20 
    LDA.W #$0038 : STA.W $0E22 
    JSR.W Draw4DigitHexValue 
    LDX.W $1846 
    LDA.W $0F9E,X : STA.W $0E24 
    LDA.W #$00E0 : STA.W $0E20 
    LDA.W #$0040 : STA.W $0E22 
    JSR.W Draw4DigitHexValue 
    LDX.W $1846 
    LDA.W $0FA0,X : STA.W $0E24 
    LDA.W #$00E0 : STA.W $0E20 
    LDA.W #$0048 : STA.W $0E22 
    JSR.W Draw4DigitHexValue 
    LDX.W $1846 
    LDA.W $0FA2,X : STA.W $0E24 
    LDA.W #$00E0 : STA.W $0E20 
    LDA.W #$0050 : STA.W $0E22 
    JSR.W Draw4DigitHexValue 
    LDA.W #$0000 
    RTS 


DebugHandler_E_EnemyDebugger_RAMViewer_4:
    LDA.B $91 
    BIT.W #$0010 
    BEQ + 
    INC.W $185C 
    LDA.W #$0000 
    RTS 


  + LDA.W #$00B0 : STA.B $14 
    LDA.W #$0050 : STA.B $12 
    LDA.W #$0A00 : STA.B $26 
    LDA.W #$002D 
    JSL.L Add_Debug_Spritemap_to_OAM 
    LDX.W $1846 
    LDA.W $0FA8,X : STA.W $0E24 
    LDA.W #$00E0 : STA.W $0E20 
    LDA.W #$0038 : STA.W $0E22 
    JSR.W Draw4DigitHexValue 
    LDX.W $1846 
    LDA.W $0FAA,X : STA.W $0E24 
    LDA.W #$00E0 : STA.W $0E20 
    LDA.W #$0040 : STA.W $0E22 
    JSR.W Draw4DigitHexValue 
    LDX.W $1846 
    LDA.W $0FAC,X : STA.W $0E24 
    LDA.W #$00E0 : STA.W $0E20 
    LDA.W #$0048 : STA.W $0E22 
    JSR.W Draw4DigitHexValue 
    LDX.W $1846 
    LDA.W $0FAE,X : STA.W $0E24 
    LDA.W #$00E0 : STA.W $0E20 
    LDA.W #$0050 : STA.W $0E22 
    JSR.W Draw4DigitHexValue 
    LDA.W #$0000 
    RTS 


DebugHandler_F_EnemyDebugger_RAMViewer_5:
    LDA.B $91 
    BIT.W #$0010 
    BEQ + 
    INC.W $185C 
    LDA.W #$0000 
    RTS 


  + LDA.W #$00B0 : STA.B $14 
    LDA.W #$0050 : STA.B $12 
    LDA.W #$0A00 : STA.B $26 
    LDA.W #$002E 
    JSL.L Add_Debug_Spritemap_to_OAM 
    LDX.W $1846 
    LDA.W $0FB0,X : STA.W $0E24 
    LDA.W #$00E0 : STA.W $0E20 
    LDA.W #$0038 : STA.W $0E22 
    JSR.W Draw4DigitHexValue 
    LDX.W $1846 
    LDA.W $0FB2,X : STA.W $0E24 
    LDA.W #$00E0 : STA.W $0E20 
    LDA.W #$0040 : STA.W $0E22 
    JSR.W Draw4DigitHexValue 
    LDX.W $1846 
    LDA.W $0FB4,X : STA.W $0E24 
    LDA.W #$00E0 : STA.W $0E20 
    LDA.W #$0048 : STA.W $0E22 
    JSR.W Draw4DigitHexValue 
    LDX.W $1846 
    LDA.W $0FB6,X : STA.W $0E24 
    LDA.W #$00E0 : STA.W $0E20 
    LDA.W #$0050 : STA.W $0E22 
    JSR.W Draw4DigitHexValue 
    LDA.W #$0000 
    RTS 


Debug_MoveEnemyWithDpad_QuarterPixelPerFrame:
    LDA.W $05B6 
    AND.W #$0003 
    BNE .return 
    LDA.B $8D 
    BIT.W #$0200 
    BEQ .notPressingLeft 
    DEC.W $0F7A,X 
    BRA .checkUp 


.notPressingLeft:
    BIT.W #$0100 
    BEQ .checkUp 
    INC.W $0F7A,X 

.checkUp:
    LDA.B $8D 
    BIT.W #$0800 
    BEQ .notPressingUp 
    DEC.W $0F7E,X 
    BRA .return 


.notPressingUp:
    BIT.W #$0400 
    BEQ .return 
    INC.W $0F7E,X 

.return:
    RTL 


Debug_MoveEnemyWithDpad_4PixelsPerFrame:
    LDA.B $8D 
    BIT.W #$0200 
    BEQ .notPressingLeft 
    LDA.W $0F7A,X : SEC : SBC.W #$0004 : STA.W $0F7A,X 
    BRA .checkUp 


.notPressingLeft:
    BIT.W #$0100 
    BEQ .checkUp 
    LDA.W $0F7A,X : CLC : ADC.W #$0004 : STA.W $0F7A,X 

.checkUp:
    LDA.B $8D 
    BIT.W #$0800 
    BEQ .notPressingUp 
    LDA.W $0F7E,X : SEC : SBC.W #$0004 : STA.W $0F7E,X 
    BRA .return 


.notPressingUp:
    BIT.W #$0400 
    BEQ .return 
    INC.W $0F7E,X 
    LDA.W $0F7E,X : CLC : ADC.W #$0004 : STA.W $0F7E,X 

.return:
    RTL 


Draw4DigitHexValue:
    LDA.W $0E20 : CLC : ADC.W #$0000 : STA.B $14 
    LDA.W $0E22 : CLC : ADC.W #$0000 : STA.B $12 
    LDA.W #$0A00 : STA.B $26 
    LDA.W $0E24 
    AND.W #$F000 
    XBA 
    LSR #4
    CLC : ADC.W #$0004 : JSL.L Add_Debug_Spritemap_to_OAM 
    LDA.W $0E20 : CLC : ADC.W #$0008 : STA.B $14 
    LDA.W $0E22 : CLC : ADC.W #$0000 : STA.B $12 
    LDA.W #$0A00 : STA.B $26 
    LDA.W $0E24 
    AND.W #$0F00 
    XBA 
    CLC : ADC.W #$0004 : JSL.L Add_Debug_Spritemap_to_OAM 
    LDA.W $0E20 : CLC : ADC.W #$0010 : STA.B $14 
    LDA.W $0E22 : CLC : ADC.W #$0000 : STA.B $12 
    LDA.W #$0A00 : STA.B $26 
    LDA.W $0E24 
    AND.W #$00F0 
    LSR #4
    CLC : ADC.W #$0004 : JSL.L Add_Debug_Spritemap_to_OAM 
    LDA.W $0E20 : CLC : ADC.W #$0018 : STA.B $14 
    LDA.W #$0A00 : STA.B $26 
    LDA.W $0E22 : CLC : ADC.W #$0000 : STA.B $12 
    LDA.W $0E24 
    AND.W #$000F 
    CLC : ADC.W #$0004 : JSL.L Add_Debug_Spritemap_to_OAM 
    RTS 


Add_Debug_Spritemap_to_OAM:
    PHP 
    SEP #$20 
    PHB 
    PHK 
    PLB 
    REP #$30 
    ASL A 
    TAX 
    LDA.W Debug_Spritemap_Addresses,X 
    TAY 
    LDA.W $0000,Y 
    INY #2
    STA.B $18 
    LDX.W $0590 

.loop:
    LDA.W $0000,Y : STA.B $1A 
    AND.W #$01FF 
    INY #2
    CLC : ADC.B $14 : STA.W $0370,X 
    INX 
    LDA.B $1B 
    AND.W #$0002 
    BEQ + 
    TXA 
    STA.B $1C 
    LSR A 
    PHY 
    TAY 
    AND.W #$000E 
    TAX 
    LDA.W .indices,Y 
    TAY 
    LDA.W .size,X : ORA.W $0570,Y : STA.W $0570,Y 
    PLY 
    LDX.B $1C 

  + LDA.W $0370,X 
    AND.W #$0001 
    BEQ + 
    TXA 
    STA.B $1C 
    LSR A 
    PHY 
    TAY 
    AND.W #$000E 
    TAX 
    LDA.W .indices,Y 
    TAY 
    LDA.W .XPosition,X : ORA.W $0570,Y : STA.W $0570,Y 
    PLY 
    LDX.B $1C 

  + SEP #$20 
    LDA.W $0000,Y 
    BMI + 
    CLC : ADC.B $12 : BCS .F0 
    CMP.B #$F0 
    BCC .store 
    BRA .F0 


  + CLC : ADC.B $12 : BCS .checkMax 
    CMP.B #$F0 
    BCS .store 
    BRA .F0 


.checkMax:
    CMP.B #$F0 
    BCC .store 

.F0:
    LDA.B #$F0 

.store:
    STA.W $0370,X 
    REP #$20 
    INX 

.unknown:
    INY 
    LDA.B $26 
    BEQ .useSpritemapEntryPalette 
    LDA.W $0000,Y 
    AND.W #$F1FF 
    ORA.B $26 
    BRA .next 


.useSpritemapEntryPalette:
    LDA.W $0000,Y 

.next:
    STA.W $0370,X 
    INY #2
    INX #2
    CPX.W #$01FF 
    BPL .return 
    DEC.B $18 
    BEQ .return 
    JMP.W .loop 


.return:
    STX.W $0590 
    SEP #$20 
    PLB 
    REP #$20 
    PLP 
    RTL 


.size:
    dw $0002,$0008,$0020,$0080,$0200,$0800,$2000,$8000 

.XPosition:
    dw $0001,$0004,$0010,$0040,$0100,$0400,$1000,$4000 

.indices:
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000 
    dw $0002,$0002,$0002,$0002,$0002,$0002,$0002,$0002 
    dw $0004,$0004,$0004,$0004,$0004,$0004,$0004,$0004 
    dw $0006,$0006,$0006,$0006,$0006,$0006,$0006,$0006 
    dw $0008,$0008,$0008,$0008,$0008,$0008,$0008,$0008 
    dw $000A,$000A,$000A,$000A,$000A,$000A,$000A,$000A 
    dw $000C,$000C,$000C,$000C,$000C,$000C,$000C,$000C 
    dw $000E,$000E,$000E,$000E,$000E,$000E,$000E,$000E 
    dw $0010,$0010,$0010,$0010,$0010,$0010,$0010,$0010 
    dw $0012,$0012,$0012,$0012,$0012,$0012,$0012,$0012 
    dw $0014,$0014,$0014,$0014,$0014,$0014,$0014,$0014 
    dw $0016,$0016,$0016,$0016,$0016,$0016,$0016,$0016 
    dw $0018,$0018,$0018,$0018,$0018,$0018,$0018,$0018 
    dw $001A,$001A,$001A,$001A,$001A,$001A,$001A,$001A 
    dw $001C,$001C,$001C,$001C,$001C,$001C,$001C,$001C 
    dw $001E,$001E,$001E,$001E,$001E,$001E,$001E,$001E 

Debug_Spritemap_Addresses:
    dw DebugSpritemaps_0_PaletteViewer_LeftHalf 
    dw DebugSpritemaps_1_PaletteViewer_RightHalf 
    dw DebugSpritemaps_2_SpriteTilesViewer_2ndHalf 
    dw DebugSpritemaps_3_SpriteTilesViewer_1stHalf 
    dw DebugSpritemaps_4_0 
    dw DebugSpritemaps_5_1 
    dw DebugSpritemaps_6_2 
    dw DebugSpritemaps_7_3 
    dw DebugSpritemaps_8_4 
    dw DebugSpritemaps_9_5 
    dw DebugSpritemaps_A_6 
    dw DebugSpritemaps_B_7 
    dw DebugSpritemaps_C_8 
    dw DebugSpritemaps_D_9 
    dw DebugSpritemaps_E_A 
    dw DebugSpritemaps_F_B 
    dw DebugSpritemaps_10_C 
    dw DebugSpritemaps_11_D 
    dw DebugSpritemaps_12_E 
    dw DebugSpritemaps_13_F 
    dw DebugSpritemaps_14_AreaNames_SF_Crateria 
    dw DebugSpritemaps_15_AreaNames_BL_Brinstar 
    dw DebugSpritemaps_16_AreaNames_NO_Norfair 
    dw DebugSpritemaps_17_AreaNames_NP_WreckedShip 
    dw DebugSpritemaps_18_AreaNames_ML_Maridia 
    dw DebugSpritemaps_19_AreaNames_TS_Tourian 
    dw DebugSpritemaps_1A_AreaNames_CO_Ceres 
    dw DebugSpritemaps_1B_AreaNames_TT_Debug 
    dw DebugSpritemaps_1C_TextCursor 
    dw DebugSpritemaps_1D_j 
    dw DebugSpritemaps_1E_k 
    dw DebugSpritemaps_1F_l 
    dw DebugSpritemaps_20_m 
    dw DebugSpritemaps_21_n 
    dw DebugSpritemaps_22_o 
    dw DebugSpritemaps_23_p 
    dw UNUSED_DebugSpritemaps_24_P_UPTM_POSE_OPT0_OPT1_B4A90F 
    dw DebugSpritemaps_25_EnemyDebuggerEnemyIndicator 
    dw UNUSED_DebugSpritemaps_26_PP_X_PYo_itros_neTosKH_B4A90F 
    dw DebugSpritemaps_27_EnemyDebuggerText_PosX_PosY_HP_Pointer 
    dw UNUSED_DebugSpritemaps_28_EnemyIndicator_B4AB9E 
    dw DebugSpritemaps_29_UPTM_Stat_Num_Bank 
    dw DebugSpritemaps_2A_Switch_Switch2_ColorPa_CharaOf 
    dw DebugSpritemaps_2B_PoseAdr_WaitTim_LpCnt_Patern 
    dw DebugSpritemaps_2C_FlashCo_IceCoun_HitCoun_PlplCou 
    dw DebugSpritemaps_2D_Pwork0_Pwork1_Pwork2_Pwork3 
    dw DebugSpritemaps_2E_Pwork4_Pwork5_InitOP0_InitOP1 
    dw DebugSpritemaps_2F_EnemySpawnDataEditorText 
    dw DebugSpritemaps_30_EnemyNames_NoDebug 
    dw DebugSpritemaps_31_EnemyNames_ATOMIC 
    dw DebugSpritemaps_32_EnemyNames_BANG 
    dw DebugSpritemaps_33_EnemyNames_BATTA1 
    dw DebugSpritemaps_34_EnemyNames_BATTA2 
    dw DebugSpritemaps_35_EnemyNames_BATTA3 
    dw DebugSpritemaps_36_EnemyNames_BOTOON 
    dw DebugSpritemaps_37_EnemyNames_BOYON 
    dw DebugSpritemaps_38_EnemyNames_DESSGEEG 
    dw DebugSpritemaps_39_EnemyNames_DORI 
    dw DebugSpritemaps_3A_EnemyNames_DRAGON 
    dw DebugSpritemaps_3B_EnemyNames_EBI 
    dw DebugSpritemaps_3C_EnemyNames_EYE 
    dw DebugSpritemaps_3D_EnemyNames_NAMIHE 
    dw DebugSpritemaps_3E_EnemyNames_FISH 
    dw DebugSpritemaps_3F_EnemyNames_GAI 
    dw DebugSpritemaps_40_EnemyNames_GAMET 
    dw DebugSpritemaps_41_EnemyNames_GEEGA 
    dw DebugSpritemaps_42_EnemyNames_GERUDA 
    dw DebugSpritemaps_43_EnemyNames_GRAVY 
    dw DebugSpritemaps_44_EnemyNames_HATCHI1 
    dw DebugSpritemaps_45_EnemyNames_HAND 
    dw DebugSpritemaps_46_EnemyNames_HIBASHI 
    dw DebugSpritemaps_47_EnemyNames_HIRU 
    dw DebugSpritemaps_48_EnemyNames_HOLTZ 
    dw DebugSpritemaps_49_EnemyNames_HOTARY 
    dw DebugSpritemaps_4A_EnemyNames_HZOOMER 
    dw DebugSpritemaps_4B_EnemyNames_KAGO 
    dw DebugSpritemaps_4C_EnemyNames_KAME 
    dw DebugSpritemaps_4D_EnemyNames_KAMER 
    dw DebugSpritemaps_4E_EnemyNames_KANI 
    dw DebugSpritemaps_4F_EnemyNames_KOMA 
    dw DebugSpritemaps_50_EnemyNames_KZAN 
    dw DebugSpritemaps_51_EnemyNames_LAVAMAN 
    dw DebugSpritemaps_52_EnemyNames_MELLA 
    dw DebugSpritemaps_53_EnemyNames_MEMU 
    dw DebugSpritemaps_54_EnemyNames_MERO 
    dw DebugSpritemaps_55_EnemyNames_METALEE 
    dw DebugSpritemaps_56_EnemyNames_METMOD 
    dw DebugSpritemaps_57_EnemyNames_METROID 
    dw DebugSpritemaps_58_EnemyNames_MULTI 
    dw DebugSpritemaps_59_EnemyNames_MZOOMER 
    dw DebugSpritemaps_5A_EnemyNames_NDRA 
    dw DebugSpritemaps_5B_EnemyNames_NOMI 
    dw DebugSpritemaps_5C_EnemyNames_NOVA 
    dw DebugSpritemaps_5D_EnemyNames_OUM 
    dw DebugSpritemaps_5E_EnemyNames_OUMU 
    dw DebugSpritemaps_5F_EnemyNames_PIPE 
    dw DebugSpritemaps_60_EnemyNames_POLYP 
    dw DebugSpritemaps_61_EnemyNames_PUROMI 
    dw DebugSpritemaps_62_EnemyNames_PUU 
    dw DebugSpritemaps_63_EnemyNames_PUYO 
    dw DebugSpritemaps_64_EnemyNames_REFLEC 
    dw DebugSpritemaps_65_EnemyNames_RINKA 
    dw DebugSpritemaps_66_EnemyNames_RIO 
    dw DebugSpritemaps_67_EnemyNames_RIPPER1 
    dw DebugSpritemaps_68_EnemyNames_RIPPER2 
    dw DebugSpritemaps_69_EnemyNames_ROBO 
    dw DebugSpritemaps_6A_EnemyNames_RSTONE 
    dw DebugSpritemaps_6B_EnemyNames_SABOTEN 
    dw DebugSpritemaps_6C_EnemyNames_SBUG 
    dw DebugSpritemaps_6D_EnemyNames_SCLAYD 
    dw DebugSpritemaps_6E_EnemyNames_SDEATH 
    dw DebugSpritemaps_6F_EnemyNames_SHUTTER1 
    dw DebugSpritemaps_70_EnemyNames_SHUTTER2 
    dw DebugSpritemaps_71_EnemyNames_SIDE 
    dw DebugSpritemaps_72_EnemyNames_SKREE 
    dw DebugSpritemaps_73_EnemyNames_SPA 
    dw DebugSpritemaps_74_EnemyNames_SQUEEWPT 
    dw DebugSpritemaps_75_EnemyNames_SSIDE 
    dw DebugSpritemaps_76_EnemyNames_STOKE 
    dw DebugSpritemaps_77_EnemyNames_TOGE 
    dw DebugSpritemaps_78_EnemyNames_VIOLA 
    dw DebugSpritemaps_79_EnemyNames_WAVER 
    dw DebugSpritemaps_7A_EnemyNames_YARD 
    dw DebugSpritemaps_7B_EnemyNames_ZEB 
    dw DebugSpritemaps_7C_EnemyNames_ZEBBO 
    dw DebugSpritemaps_7D_EnemyNames_ZEELA 
    dw DebugSpritemaps_7E_EnemyNames_ZOA 
    dw DebugSpritemaps_7F_EnemyNames_ZOOMER 
    dw DebugSpritemaps_80_EnemyNames_BATTA1br 
    dw DebugSpritemaps_81_EnemyNames_BATTA1NO 
    dw DebugSpritemaps_82_EnemyNames_BATTA1np 
    dw DebugSpritemaps_8_EnemyNames_BATTA1ml 
    dw DebugSpritemaps_84_EnemyNames_BATTA1ts 
    dw DebugSpritemaps_85_EnemyNames_BATTA2br 
    dw DebugSpritemaps_86_EnemyNames_BATTA2no 
    dw DebugSpritemaps_87_EnemyNames_BATTA2np 
    dw DebugSpritemaps_88_EnemyNames_BATTA2ml 
    dw DebugSpritemaps_89_EnemyNames_BATTA2ts 
    dw DebugSpritemaps_8A_EnemyNames_BATTA3br 
    dw DebugSpritemaps_8B_EnemyNames_BATTA3no 
    dw DebugSpritemaps_8C_EnemyNames_BATTA3np 
    dw DebugSpritemaps_8D_EnemyNames_BATTA3ml 
    dw DebugSpritemaps_8E_EnemyNames_BATTA3ts 
    dw DebugSpritemaps_8F_EnemyNames_FUNE 
    dw DebugSpritemaps_90_EnemyNames_HATCHI2 
    dw DebugSpritemaps_91_EnemyNames_HATCHI3 
    dw DebugSpritemaps_92_EnemyNames_ROBO2 

DebugSpritemaps_0_PaletteViewer_LeftHalf:
    dw $0040,$0018 
    db $18 
    dw $3F77,$0010 
    db $18 
    dw $3F76,$0008 
    db $18 
    dw $3F75,$0000 
    db $18 
    dw $3F74,$01F8 
    db $18 
    dw $3F73,$01F0 
    db $18 
    dw $3F72,$01E8 
    db $18 
    dw $3F71,$01E0 
    db $18 
    dw $3F70,$0018 
    db $10 
    dw $3D67,$0010 
    db $10 
    dw $3D66,$0008 
    db $10 
    dw $3D65,$0000 
    db $10 
    dw $3D64,$01F8 
    db $10 
    dw $3D63,$01F0 
    db $10 
    dw $3D62,$01E8 
    db $10 
    dw $3D61,$01E0 
    db $10 
    dw $3D60,$0018 
    db $08 
    dw $3B57,$0010 
    db $08 
    dw $3B56,$0008 
    db $08 
    dw $3B55,$0000 
    db $08 
    dw $3B54,$01F8 
    db $08 
    dw $3B53,$01F0 
    db $08 
    dw $3B52,$01E8 
    db $08 
    dw $3B51,$01E0 
    db $08 
    dw $3B50,$0018 
    db $00 
    dw $3947,$0010 
    db $00 
    dw $3946,$0008 
    db $00 
    dw $3945,$0000 
    db $00 
    dw $3944,$01F8 
    db $00 
    dw $3943,$01F0 
    db $00 
    dw $3942,$01E8 
    db $00 
    dw $3941,$01E0 
    db $00 
    dw $3940,$0018 
    db $F8 
    dw $3737,$0010 
    db $F8 
    dw $3736,$0008 
    db $F8 
    dw $3735,$0000 
    db $F8 
    dw $3734,$01F8 
    db $F8 
    dw $3733,$01F0 
    db $F8 
    dw $3732,$01E8 
    db $F8 
    dw $3731,$01E0 
    db $F8 
    dw $3730,$0018 
    db $F0 
    dw $3527,$0010 
    db $F0 
    dw $3526,$0008 
    db $F0 
    dw $3525,$0000 
    db $F0 
    dw $3524,$01F8 
    db $F0 
    dw $3523,$01F0 
    db $F0 
    dw $3522,$01E8 
    db $F0 
    dw $3521,$01E0 
    db $F0 
    dw $3520,$0018 
    db $E8 
    dw $3317,$0010 
    db $E8 
    dw $3316,$0008 
    db $E8 
    dw $3315,$0000 
    db $E8 
    dw $3314,$01F8 
    db $E8 
    dw $3313,$01F0 
    db $E8 
    dw $3312,$01E8 
    db $E8 
    dw $3311,$01E0 
    db $E8 
    dw $3310,$0018 
    db $E0 
    dw $3107,$0010 
    db $E0 
    dw $3106,$0008 
    db $E0 
    dw $3105,$0000 
    db $E0 
    dw $3104,$01F8 
    db $E0 
    dw $3103,$01F0 
    db $E0 
    dw $3102,$01E8 
    db $E0 
    dw $3101,$01E0 
    db $E0 
    dw $3300 

DebugSpritemaps_1_PaletteViewer_RightHalf:
    dw $0040,$0018 
    db $18 
    dw $3F7F,$0010 
    db $18 
    dw $3F7E,$0008 
    db $18 
    dw $3F7D,$0000 
    db $18 
    dw $3F7C,$01F8 
    db $18 
    dw $3F7B,$01F0 
    db $18 
    dw $3F7A,$01E8 
    db $18 
    dw $3F79,$01E0 
    db $18 
    dw $3F78,$0018 
    db $10 
    dw $3D6F,$0010 
    db $10 
    dw $3D6E,$0008 
    db $10 
    dw $3D6D,$0000 
    db $10 
    dw $3D6C,$01F8 
    db $10 
    dw $3D6B,$01F0 
    db $10 
    dw $3D6A,$01E8 
    db $10 
    dw $3D69,$01E0 
    db $10 
    dw $3D68,$0018 
    db $08 
    dw $3B5F,$0010 
    db $08 
    dw $3B5E,$0008 
    db $08 
    dw $3B5D,$0000 
    db $08 
    dw $3B5C,$01F8 
    db $08 
    dw $3B5B,$01F0 
    db $08 
    dw $3B5A,$01E8 
    db $08 
    dw $3B59,$01E0 
    db $08 
    dw $3B58,$0018 
    db $00 
    dw $394F,$0010 
    db $00 
    dw $394E,$0008 
    db $00 
    dw $394D,$0000 
    db $00 
    dw $394C,$01F8 
    db $00 
    dw $394B,$01F0 
    db $00 
    dw $394A,$01E8 
    db $00 
    dw $3949,$01E0 
    db $00 
    dw $3948,$0018 
    db $F8 
    dw $373F,$0010 
    db $F8 
    dw $373E,$0008 
    db $F8 
    dw $373D,$0000 
    db $F8 
    dw $373C,$01F8 
    db $F8 
    dw $373B,$01F0 
    db $F8 
    dw $373A,$01E8 
    db $F8 
    dw $3739,$01E0 
    db $F8 
    dw $3738,$0018 
    db $F0 
    dw $352F,$0010 
    db $F0 
    dw $352E,$0008 
    db $F0 
    dw $352D,$0000 
    db $F0 
    dw $352C,$01F8 
    db $F0 
    dw $352B,$01F0 
    db $F0 
    dw $352A,$01E8 
    db $F0 
    dw $3529,$01E0 
    db $F0 
    dw $3528,$0018 
    db $E8 
    dw $331F,$0010 
    db $E8 
    dw $331E,$0008 
    db $E8 
    dw $331D,$0000 
    db $E8 
    dw $331C,$01F8 
    db $E8 
    dw $331B,$01F0 
    db $E8 
    dw $331A,$01E8 
    db $E8 
    dw $3319,$01E0 
    db $E8 
    dw $3318,$0018 
    db $E0 
    dw $310F,$0010 
    db $E0 
    dw $310E,$0008 
    db $E0 
    dw $310D,$0000 
    db $E0 
    dw $310C,$01F8 
    db $E0 
    dw $310B,$01F0 
    db $E0 
    dw $310A,$01E8 
    db $E0 
    dw $3109,$01E0 
    db $E0 
    dw $3108 

DebugSpritemaps_2_SpriteTilesViewer_2ndHalf:
    dw $0040,$C230 
    db $30 
    dw $33EE,$C220 
    db $30 
    dw $33EC,$C210 
    db $30 
    dw $33EA,$C200 
    db $30 
    dw $33E8,$C3F0 
    db $30 
    dw $33E6,$C3E0 
    db $30 
    dw $33E4,$C3D0 
    db $30 
    dw $33E2,$C3C0 
    db $30 
    dw $33E0,$C230 
    db $20 
    dw $33CE,$C220 
    db $20 
    dw $33CC,$C210 
    db $20 
    dw $33CA,$C200 
    db $20 
    dw $33C8,$C3F0 
    db $20 
    dw $33C6,$C3E0 
    db $20 
    dw $33C4,$C3D0 
    db $20 
    dw $33C2,$C3C0 
    db $20 
    dw $33C0,$C230 
    db $10 
    dw $33AE,$C220 
    db $10 
    dw $33AC,$C210 
    db $10 
    dw $33AA,$C200 
    db $10 
    dw $33A8,$C3F0 
    db $10 
    dw $33A6,$C3E0 
    db $10 
    dw $33A4,$C3D0 
    db $10 
    dw $33A2,$C3C0 
    db $10 
    dw $33A0,$C230 
    db $00 
    dw $338E,$C220 
    db $00 
    dw $338C,$C210 
    db $00 
    dw $338A,$C200 
    db $00 
    dw $3388,$C3F0 
    db $00 
    dw $3386,$C3E0 
    db $00 
    dw $3384,$C3D0 
    db $00 
    dw $3382,$C3C0 
    db $00 
    dw $3380,$C230 
    db $F0 
    dw $336E,$C220 
    db $F0 
    dw $336C,$C210 
    db $F0 
    dw $336A,$C200 
    db $F0 
    dw $3368,$C3F0 
    db $F0 
    dw $3366,$C3E0 
    db $F0 
    dw $3364,$C3D0 
    db $F0 
    dw $3362,$C3C0 
    db $F0 
    dw $3360,$C230 
    db $E0 
    dw $334E,$C220 
    db $E0 
    dw $334C,$C210 
    db $E0 
    dw $334A,$C200 
    db $E0 
    dw $3348,$C3F0 
    db $E0 
    dw $3346,$C3E0 
    db $E0 
    dw $3344,$C3D0 
    db $E0 
    dw $3342,$C3C0 
    db $E0 
    dw $3340,$C230 
    db $D0 
    dw $332E,$C220 
    db $D0 
    dw $332C,$C210 
    db $D0 
    dw $332A,$C200 
    db $D0 
    dw $3328,$C3F0 
    db $D0 
    dw $3326,$C3E0 
    db $D0 
    dw $3324,$C3D0 
    db $D0 
    dw $3322,$C3C0 
    db $D0 
    dw $3320,$C230 
    db $C0 
    dw $330E,$C220 
    db $C0 
    dw $330C,$C210 
    db $C0 
    dw $330A,$C200 
    db $C0 
    dw $3308,$C3F0 
    db $C0 
    dw $3306,$C3E0 
    db $C0 
    dw $3304,$C3D0 
    db $C0 
    dw $3302,$C3C0 
    db $C0 
    dw $3300 

DebugSpritemaps_3_SpriteTilesViewer_1stHalf:
    dw $0040,$C230 
    db $30 
    dw $30EE,$C220 
    db $30 
    dw $30EC,$C210 
    db $30 
    dw $30EA,$C200 
    db $30 
    dw $30E8,$C3F0 
    db $30 
    dw $30E6,$C3E0 
    db $30 
    dw $30E4,$C3D0 
    db $30 
    dw $30E2,$C3C0 
    db $30 
    dw $30E0,$C230 
    db $20 
    dw $30CE,$C220 
    db $20 
    dw $30CC,$C210 
    db $20 
    dw $30CA,$C200 
    db $20 
    dw $30C8,$C3F0 
    db $20 
    dw $30C6,$C3E0 
    db $20 
    dw $30C4,$C3D0 
    db $20 
    dw $30C2,$C3C0 
    db $20 
    dw $30C0,$C230 
    db $10 
    dw $3AAE,$C220 
    db $10 
    dw $3AAC,$C210 
    db $10 
    dw $3AAA,$C200 
    db $10 
    dw $3AA8,$C3F0 
    db $10 
    dw $3AA6,$C3E0 
    db $10 
    dw $3AA4,$C3D0 
    db $10 
    dw $3AA2,$C3C0 
    db $10 
    dw $3AA0,$C230 
    db $00 
    dw $3A8E,$C220 
    db $00 
    dw $3A8C,$C210 
    db $00 
    dw $3A8A,$C200 
    db $00 
    dw $3A88,$C3F0 
    db $00 
    dw $3A86,$C3E0 
    db $00 
    dw $3A84,$C3D0 
    db $00 
    dw $3A82,$C3C0 
    db $00 
    dw $3A80,$C230 
    db $F0 
    dw $3A6E,$C220 
    db $F0 
    dw $3A6C,$C210 
    db $F0 
    dw $3A6A,$C200 
    db $F0 
    dw $3A68,$C3F0 
    db $F0 
    dw $3A66,$C3E0 
    db $F0 
    dw $3A64,$C3D0 
    db $F0 
    dw $3A62,$C3C0 
    db $F0 
    dw $3A60,$C230 
    db $E0 
    dw $3A4E,$C220 
    db $E0 
    dw $3A4C,$C210 
    db $E0 
    dw $3A4A,$C200 
    db $E0 
    dw $3A48,$C3F0 
    db $E0 
    dw $3A46,$C3E0 
    db $E0 
    dw $3A44,$C3D0 
    db $E0 
    dw $3A42,$C3C0 
    db $E0 
    dw $3A40,$C230 
    db $D0 
    dw $3A2E,$C220 
    db $D0 
    dw $3A2C,$C210 
    db $D0 
    dw $3A2A,$C200 
    db $D0 
    dw $3A28,$C3F0 
    db $D0 
    dw $3A26,$C3E0 
    db $D0 
    dw $3A24,$C3D0 
    db $D0 
    dw $3A22,$C3C0 
    db $D0 
    dw $3A20,$C230 
    db $C0 
    dw $380E,$C220 
    db $C0 
    dw $380C,$C210 
    db $C0 
    dw $380A,$C200 
    db $C0 
    dw $3808,$C3F0 
    db $C0 
    dw $3806,$C3E0 
    db $C0 
    dw $3804,$C3D0 
    db $C0 
    dw $3802,$C3C0 
    db $C0 
    dw $3800 

DebugSpritemaps_4_0:
    dw $0001,$01F8 
    db $F8 
    dw $30D0 

DebugSpritemaps_5_1:
    dw $0001,$01F8 
    db $F8 
    dw $30D1 

DebugSpritemaps_6_2:
    dw $0001,$01F8 
    db $F8 
    dw $30D2 

DebugSpritemaps_7_3:
    dw $0001,$01F8 
    db $F8 
    dw $30D3 

DebugSpritemaps_8_4:
    dw $0001,$01F8 
    db $F8 
    dw $30D4 

DebugSpritemaps_9_5:
    dw $0001,$01F8 
    db $F8 
    dw $30D5 

DebugSpritemaps_A_6:
    dw $0001,$01F8 
    db $F8 
    dw $30D6 

DebugSpritemaps_B_7:
    dw $0001,$01F8 
    db $F8 
    dw $30D7 

DebugSpritemaps_C_8:
    dw $0001,$01F8 
    db $F8 
    dw $30D8 

DebugSpritemaps_D_9:
    dw $0001,$01F8 
    db $F8 
    dw $30D9 

DebugSpritemaps_E_A:
    dw $0001,$01F8 
    db $F8 
    dw $30DA 

DebugSpritemaps_F_B:
    dw $0001,$01F8 
    db $F8 
    dw $30DB 

DebugSpritemaps_10_C:
    dw $0001,$01F8 
    db $F8 
    dw $30DC 

DebugSpritemaps_11_D:
    dw $0001,$01F8 
    db $F8 
    dw $30DD 

DebugSpritemaps_12_E:
    dw $0001,$01F8 
    db $F8 
    dw $30DE 

DebugSpritemaps_13_F:
    dw $0001,$01F8 
    db $F8 
    dw $30DF 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_DebugSpritemaps_a_B4A89F:
    dw $0001,$01F8 
    db $F8 
    dw $30E0 

UNUSED_DebugSpritemaps_b_B4A8A6:
    dw $0001,$01F8 
    db $F8 
    dw $30E1 

UNUSED_DebugSpritemaps_c_B4A8AD:
    dw $0001,$01F8 
    db $F8 
    dw $30E2 

UNUSED_DebugSpritemaps_d_B4A8B4:
    dw $0001,$01F8 
    db $F8 
    dw $30E3 

UNUSED_DebugSpritemaps_e_B4A8BB:
    dw $0001,$01F8 
    db $F8 
    dw $30E4 

UNUSED_DebugSpritemaps_f_B4A8C2:
    dw $0001,$01F8 
    db $F8 
    dw $30E5 

UNUSED_DebugSpritemaps_g_B4A8C9:
    dw $0001,$01F8 
    db $F8 
    dw $30E6 

UNUSED_DebugSpritemaps_h_B4A8D0:
    dw $0001,$01F8 
    db $F8 
    dw $30E7 

UNUSED_DebugSpritemaps_i_B4A8D7:
    dw $0001,$01F8 
    db $F8 
    dw $30E8 
endif ; !FEATURE_KEEP_UNREFERENCED

DebugSpritemaps_1D_j:
    dw $0001,$01F8 
    db $F8 
    dw $30E9 

DebugSpritemaps_1E_k:
    dw $0001,$01F8 
    db $F8 
    dw $30EA 

DebugSpritemaps_1F_l:
    dw $0001,$01F8 
    db $F8 
    dw $30EB 

DebugSpritemaps_20_m:
    dw $0001,$01F8 
    db $F8 
    dw $30EC 

DebugSpritemaps_21_n:
    dw $0001,$01F8 
    db $F8 
    dw $30ED 

DebugSpritemaps_22_o:
    dw $0001,$01F8 
    db $F8 
    dw $30EE 

DebugSpritemaps_23_p:
    dw $0001,$01F8 
    db $F8 
    dw $30EF 

UNUSED_DebugSpritemaps_24_P_UPTM_POSE_OPT0_OPT1_B4A90F:
    dw $001F,$0018 
    db $18 
    dw $30CC,$0018 
    db $10 
    dw $30CC,$0010 
    db $18 
    dw $30D1,$0010 
    db $10 
    dw $30D0,$0008 
    db $18 
    dw $30C5,$0008 
    db $10 
    dw $30C5,$01F0 
    db $18 
    dw $30FD,$01F8 
    db $18 
    dw $30C0,$0000 
    db $18 
    dw $30C1,$0000 
    db $10 
    dw $30C1,$01F8 
    db $10 
    dw $30C0,$01F0 
    db $10 
    dw $30FD,$01E8 
    db $18 
    dw $30BA,$01E8 
    db $10 
    dw $30BA,$01E0 
    db $18 
    dw $30C5,$01E0 
    db $10 
    dw $30C5,$0008 
    db $08 
    dw $30C4,$0010 
    db $08 
    dw $30B4,$0000 
    db $08 
    dw $30C0,$01F8 
    db $08 
    dw $30C1,$01F0 
    db $08 
    dw $30FD,$01E8 
    db $08 
    dw $30BA,$01E0 
    db $08 
    dw $30C5,$0018 
    db $08 
    dw $30CC,$0018 
    db $00 
    dw $30CC,$0018 
    db $F8 
    dw $30CC,$0010 
    db $00 
    dw $30BC,$0008 
    db $00 
    dw $30C5,$0000 
    db $00 
    dw $30C1,$01F8 
    db $00 
    dw $30C6,$0000 
    db $F8 
    dw $30C1 

UNUSED_DebugSpritemaps_26_PP_X_PYo_itros_neTosKH_B4A90F:
    dw $001F,$0018 
    db $18 
    dw $30B7,$0018 
    db $10 
    dw $30FD,$0010 
    db $18 
    dw $30FD,$0010 
    db $10 
    dw $30BA,$0008 
    db $18 
    dw $30BA,$0008 
    db $10 
    dw $30C5,$01F0 
    db $18 
    dw $30C5,$01F8 
    db $18 
    dw $30EE,$0000 
    db $18 
    dw $30F2,$0000 
    db $10 
    dw $30F2,$01F8 
    db $10 
    dw $30EE,$01F0 
    db $10 
    dw $30F1,$01E8 
    db $18 
    dw $30E4,$01E8 
    db $10 
    dw $30F3,$01E0 
    db $18 
    dw $30ED,$01E0 
    db $10 
    dw $30E8,$0008 
    db $08 
    dw $30EE,$0010 
    db $08 
    dw $30CC,$0000 
    db $08 
    dw $30CA,$01F8 
    db $08 
    dw $30C1,$01F0 
    db $08 
    dw $30FD,$01E8 
    db $08 
    dw $30BA,$01E0 
    db $08 
    dw $30C5,$0018 
    db $08 
    dw $30CC,$0018 
    db $00 
    dw $30C9,$0018 
    db $F8 
    dw $30C1,$0010 
    db $00 
    dw $30FD,$0008 
    db $00 
    dw $30BA,$0000 
    db $00 
    dw $30C5,$01F8 
    db $00 
    dw $30CC,$0000 
    db $F8 
    dw $30C1 

DebugSpritemaps_25_EnemyDebuggerEnemyIndicator:
    dw $0007,$0010 
    db $F8 
    dw $30E4,$0008 
    db $F8 
    dw $30F5,$0000 
    db $F8 
    dw $30EE,$01F8 
    db $F8 
    dw $30BC,$01F0 
    db $F8 
    dw $30CC,$01E8 
    db $F8 
    dw $30FB,$01E0 
    db $F8 
    dw $30FA 

DebugSpritemaps_27_EnemyDebuggerText_PosX_PosY_HP_Pointer:
    dw $001E,$0010 
    db $F8 
    dw $30F1,$0008 
    db $F8 
    dw $30E4,$0000 
    db $F8 
    dw $30F3,$01F8 
    db $F8 
    dw $30ED,$01F0 
    db $F8 
    dw $30E8,$01E8 
    db $F8 
    dw $30EE,$0018 
    db $F8 
    dw $30CC,$01E0 
    db $F8 
    dw $30C1,$0018 
    db $F0 
    dw $30CC,$0000 
    db $F0 
    dw $30C1,$01F8 
    db $F0 
    dw $30B7,$01F0 
    db $F0 
    dw $30FD,$01E8 
    db $F0 
    dw $30BA,$01E0 
    db $F0 
    dw $30C5,$0000 
    db $E8 
    dw $30EE,$0008 
    db $E8 
    dw $30F2,$0008 
    db $E0 
    dw $30F2,$0000 
    db $E0 
    dw $30EE,$0018 
    db $E8 
    dw $30CC,$0010 
    db $E8 
    dw $30CA,$01F8 
    db $E8 
    dw $30C1,$01F0 
    db $E8 
    dw $30FD,$01E8 
    db $E8 
    dw $30BA,$01E0 
    db $E8 
    dw $30C5,$0018 
    db $E0 
    dw $30CC,$0010 
    db $E0 
    dw $30C9,$01F8 
    db $E0 
    dw $30C1,$01F0 
    db $E0 
    dw $30FD,$01E8 
    db $E0 
    dw $30BA,$01E0 
    db $E0 
    dw $30C5 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_DebugSpritemaps_PosX_PosY_HP_B4AB06:
    dw $001E,$0018 
    db $F8 
    dw $30CC,$0000 
    db $F8 
    dw $30C1,$01F8 
    db $F8 
    dw $30B7,$01F0 
    db $F8 
    dw $30FD,$01E8 
    db $F8 
    dw $30BA,$01E0 
    db $F8 
    dw $30C5,$0000 
    db $F0 
    dw $30EE,$0008 
    db $F0 
    dw $30F2,$0008 
    db $E8 
    dw $30F2,$0000 
    db $E8 
    dw $30EE,$0010 
    db $E0 
    dw $30F1,$0008 
    db $E0 
    dw $30E4,$0000 
    db $E0 
    dw $30F3,$01F8 
    db $E0 
    dw $30ED,$01F0 
    db $E0 
    dw $30E8,$01E8 
    db $E0 
    dw $30EE,$0018 
    db $F0 
    dw $30CC,$0010 
    db $F0 
    dw $30CA,$01F8 
    db $F0 
    dw $30C1,$01F0 
    db $F0 
    dw $30FD,$01E8 
    db $F0 
    dw $30BA,$01E0 
    db $F0 
    dw $30C5,$0018 
    db $E8 
    dw $30CC,$0010 
    db $E8 
    dw $30C9,$01F8 
    db $E8 
    dw $30C1,$01F0 
    db $E8 
    dw $30FD,$01E8 
    db $E8 
    dw $30BA,$01E0 
    db $E8 
    dw $30C5,$0018 
    db $E0 
    dw $30CC,$01E0 
    db $E0 
    dw $30C1 
endif ; !FEATURE_KEEP_UNREFERENCED

UNUSED_DebugSpritemaps_28_EnemyIndicator_B4AB9E:
    dw $0008,$0018 
    db $F8 
    dw $30CC,$0010 
    db $F8 
    dw $30E4,$0008 
    db $F8 
    dw $30F5,$0000 
    db $F8 
    dw $30EE,$01F8 
    db $F8 
    dw $30BC,$01F0 
    db $F8 
    dw $30CC,$01E8 
    db $F8 
    dw $30FB,$01E0 
    db $F8 
    dw $30FA 

DebugSpritemaps_29_UPTM_Stat_Num_Bank:
    dw $001F,$0010 
    db $F8 
    dw $30EA,$0008 
    db $F8 
    dw $30ED,$0000 
    db $F8 
    dw $30E0,$01F8 
    db $F8 
    dw $30B1,$0000 
    db $F0 
    dw $30F4,$0008 
    db $F0 
    dw $30EC,$01F8 
    db $F0 
    dw $30BD,$0010 
    db $E8 
    dw $30F3,$0008 
    db $E8 
    dw $30E0,$0000 
    db $E8 
    dw $30F3,$01F8 
    db $E8 
    dw $30C4,$0018 
    db $F8 
    dw $30CC,$0018 
    db $F0 
    dw $30CC,$01F0 
    db $F8 
    dw $30FD,$01F0 
    db $F0 
    dw $30FD,$01E8 
    db $F8 
    dw $30BA,$01E8 
    db $F0 
    dw $30BA,$01E0 
    db $F8 
    dw $30C5,$01E0 
    db $F0 
    dw $30C5,$01F0 
    db $E8 
    dw $30FD,$01E8 
    db $E8 
    dw $30BA,$01E0 
    db $E8 
    dw $30C5,$0018 
    db $E8 
    dw $30CC,$0018 
    db $E0 
    dw $30CC,$0010 
    db $E0 
    dw $30BC,$0008 
    db $E0 
    dw $30C5,$0000 
    db $E0 
    dw $30C1,$01F8 
    db $E0 
    dw $30C6,$01F0 
    db $E0 
    dw $30FD,$01E8 
    db $E0 
    dw $30BA,$01E0 
    db $E0 
    dw $30C5 

DebugSpritemaps_2A_Switch_Switch2_ColorPa_CharaOf:
    dw $001F,$0010 
    db $F8 
    dw $30E5,$0008 
    db $F8 
    dw $30C0,$0000 
    db $F8 
    dw $30E0,$01F8 
    db $F8 
    dw $30F1,$01F0 
    db $F8 
    dw $30E0,$01E8 
    db $F8 
    dw $30E7,$01E0 
    db $F8 
    dw $30B2,$0018 
    db $F8 
    dw $30CC,$0018 
    db $F0 
    dw $30CC,$0010 
    db $F0 
    dw $30E0,$0008 
    db $F0 
    dw $30C1,$0000 
    db $F0 
    dw $30F1,$01F8 
    db $F0 
    dw $30EE,$01F0 
    db $F0 
    dw $30EB,$01E8 
    db $F0 
    dw $30EE,$01E0 
    db $F0 
    dw $30B2,$01E8 
    db $E8 
    dw $30F6,$01E0 
    db $E8 
    dw $30C4,$0018 
    db $E8 
    dw $30CC,$0018 
    db $E0 
    dw $30CC,$0010 
    db $E8 
    dw $30D2,$0008 
    db $E8 
    dw $30E7,$0008 
    db $E0 
    dw $30E7,$0000 
    db $E8 
    dw $30E2,$0000 
    db $E0 
    dw $30E2,$01F8 
    db $E8 
    dw $30F3,$01F8 
    db $E0 
    dw $30F3,$01F0 
    db $E8 
    dw $30E8,$01F0 
    db $E0 
    dw $30E8,$01E8 
    db $E0 
    dw $30F6,$01E0 
    db $E0 
    dw $30C4 

DebugSpritemaps_2B_PoseAdr_WaitTim_LpCnt_Patern:
    dw $001D,$01F8 
    db $F0 
    dw $30ED,$0000 
    db $F0 
    dw $30F3,$01F0 
    db $F0 
    dw $30B2,$01E8 
    db $F0 
    dw $30EF,$01E0 
    db $F0 
    dw $30BB,$0010 
    db $E8 
    dw $30EC,$0008 
    db $E8 
    dw $30E8,$0000 
    db $E8 
    dw $30C5,$01F8 
    db $E8 
    dw $30F3,$01F0 
    db $E8 
    dw $30E8,$01E8 
    db $E8 
    dw $30E0,$01E0 
    db $E8 
    dw $30C8,$0018 
    db $F0 
    dw $30CC,$0018 
    db $F8 
    dw $30CC,$0018 
    db $E8 
    dw $30CC,$0018 
    db $E0 
    dw $30CC,$0010 
    db $E0 
    dw $30F1,$0008 
    db $E0 
    dw $30E3,$0000 
    db $E0 
    dw $30B0,$01F8 
    db $E0 
    dw $30E4,$01F0 
    db $E0 
    dw $30F2,$01E8 
    db $E0 
    dw $30EE,$0008 
    db $F8 
    dw $30ED,$0000 
    db $F8 
    dw $30F1,$01F8 
    db $F8 
    dw $30E4,$01F0 
    db $F8 
    dw $30F3,$01E8 
    db $F8 
    dw $30E0,$01E0 
    db $F8 
    dw $30C1,$01E0 
    db $E0 
    dw $30C1 

DebugSpritemaps_2C_FlashCo_IceCoun_HitCoun_PlplCou:
    dw $0020,$0010 
    db $F8 
    dw $30F4,$0008 
    db $F8 
    dw $30EE,$0000 
    db $F8 
    dw $30B2,$01F0 
    db $F8 
    dw $30EF,$01F8 
    db $F8 
    dw $30EB,$01E8 
    db $F8 
    dw $30EB,$01E0 
    db $F8 
    dw $30C1,$0010 
    db $F0 
    dw $30ED,$0008 
    db $F0 
    dw $30F4,$0000 
    db $F0 
    dw $30EE,$01F8 
    db $F0 
    dw $30B2,$01F0 
    db $F0 
    dw $30F3,$01E8 
    db $F0 
    dw $30E8,$01E0 
    db $F0 
    dw $30B7,$0010 
    db $E8 
    dw $30ED,$0008 
    db $E8 
    dw $30F4,$0000 
    db $E8 
    dw $30EE,$01F8 
    db $E8 
    dw $30B2,$01F0 
    db $E8 
    dw $30E4,$01E8 
    db $E8 
    dw $30E2,$01E0 
    db $E8 
    dw $30B8,$0010 
    db $E0 
    dw $30EE,$0008 
    db $E0 
    dw $30B2,$0000 
    db $E0 
    dw $30E7,$01F8 
    db $E0 
    dw $30F2,$01F0 
    db $E0 
    dw $30E0,$01E8 
    db $E0 
    dw $30EB,$01E0 
    db $E0 
    dw $30B5,$0018 
    db $F8 
    dw $30CC,$0018 
    db $F0 
    dw $30CC,$0018 
    db $E8 
    dw $30CC,$0018 
    db $E0 
    dw $30CC 

DebugSpritemaps_2D_Pwork0_Pwork1_Pwork2_Pwork3:
    dw $001C,$0018 
    db $F8 
    dw $30CC,$0018 
    db $F0 
    dw $30CC,$0018 
    db $E8 
    dw $30CC,$0018 
    db $E0 
    dw $30CC,$0008 
    db $F8 
    dw $30D3,$0008 
    db $F0 
    dw $30D2,$0008 
    db $E8 
    dw $30D1,$0008 
    db $E0 
    dw $30D0,$0000 
    db $F8 
    dw $30EA,$01F8 
    db $F8 
    dw $30F1,$01F0 
    db $F8 
    dw $30EE,$01E8 
    db $F8 
    dw $30F6,$01E0 
    db $F8 
    dw $30C1,$0000 
    db $F0 
    dw $30EA,$01F8 
    db $F0 
    dw $30F1,$01F0 
    db $F0 
    dw $30EE,$01E8 
    db $F0 
    dw $30F6,$01E0 
    db $F0 
    dw $30C1,$0000 
    db $E8 
    dw $30EA,$01F8 
    db $E8 
    dw $30F1,$01F0 
    db $E8 
    dw $30EE,$01E8 
    db $E8 
    dw $30F6,$01E0 
    db $E8 
    dw $30C1,$0000 
    db $E0 
    dw $30EA,$01F8 
    db $E0 
    dw $30F1,$01F0 
    db $E0 
    dw $30EE,$01E8 
    db $E0 
    dw $30F6,$01E0 
    db $E0 
    dw $30C1 

DebugSpritemaps_2E_Pwork4_Pwork5_InitOP0_InitOP1:
    dw $001E,$0010 
    db $F8 
    dw $30D1,$0008 
    db $F8 
    dw $30C1,$0000 
    db $F8 
    dw $30C0,$01F8 
    db $F8 
    dw $30F3,$01F0 
    db $F8 
    dw $30E8,$01E8 
    db $F8 
    dw $30ED,$01E0 
    db $F8 
    dw $30B8,$0010 
    db $F0 
    dw $30D0,$0008 
    db $F0 
    dw $30C1,$0000 
    db $F0 
    dw $30C0,$01F8 
    db $F0 
    dw $30F3,$01F0 
    db $F0 
    dw $30E8,$01E8 
    db $F0 
    dw $30ED,$01E0 
    db $F0 
    dw $30B8,$0008 
    db $E8 
    dw $30D5,$0008 
    db $E0 
    dw $30D4,$0018 
    db $F8 
    dw $30CC,$0018 
    db $F0 
    dw $30CC,$0018 
    db $E8 
    dw $30CC,$0018 
    db $E0 
    dw $30CC,$0000 
    db $E8 
    dw $30EA,$01F8 
    db $E8 
    dw $30F1,$01F0 
    db $E8 
    dw $30EE,$01E8 
    db $E8 
    dw $30F6,$01E0 
    db $E8 
    dw $30C1,$0000 
    db $E0 
    dw $30EA,$01F8 
    db $E0 
    dw $30F1,$01F0 
    db $E0 
    dw $30EE,$01E8 
    db $E0 
    dw $30F6,$01E0 
    db $E0 
    dw $30C1 

DebugSpritemaps_2F_EnemySpawnDataEditorText:
    dw $0023,$0000 
    db $18 
    dw $30CC,$0000 
    db $10 
    dw $30CC,$0000 
    db $00 
    dw $30CC,$0000 
    db $08 
    dw $30CC,$0000 
    db $F8 
    dw $30CC,$0000 
    db $F0 
    dw $30CC,$0000 
    db $E8 
    dw $30CC,$01F8 
    db $00 
    dw $30D1,$01F8 
    db $18 
    dw $30D1,$01F8 
    db $10 
    dw $30D0,$01F0 
    db $F0 
    dw $30F2,$01F0 
    db $E8 
    dw $30F2,$01E8 
    db $F0 
    dw $30EE,$01E8 
    db $E8 
    dw $30EE,$01E0 
    db $F0 
    dw $30C1,$01E0 
    db $E8 
    dw $30C1,$01F8 
    db $F0 
    dw $30CA,$01F8 
    db $E8 
    dw $30C9,$01E0 
    db $F8 
    dw $30C1,$01F0 
    db $18 
    dw $30F3,$01E8 
    db $18 
    dw $30EF,$01E0 
    db $18 
    dw $30C0,$01F0 
    db $10 
    dw $30F3,$01E8 
    db $10 
    dw $30EF,$01E0 
    db $10 
    dw $30C0,$01F8 
    db $08 
    dw $30D2,$01F0 
    db $08 
    dw $30F3,$01F0 
    db $00 
    dw $30F3,$01E8 
    db $08 
    dw $30F6,$01E0 
    db $08 
    dw $30C4,$01E8 
    db $00 
    dw $30F6,$01E0 
    db $00 
    dw $30C4,$01F8 
    db $F8 
    dw $30E4,$01F0 
    db $F8 
    dw $30F2,$01E8 
    db $F8 
    dw $30EE 

DebugSpritemaps_31_EnemyNames_ATOMIC:
    dw $0006,$0008 
    db $E0 
    dw $30B2,$0000 
    db $E0 
    dw $30B8,$01F8 
    db $E0 
    dw $30BC,$01F0 
    db $E0 
    dw $30C0,$01E8 
    db $E0 
    dw $30C5,$01E0 
    db $E0 
    dw $30B0 

DebugSpritemaps_32_EnemyNames_BANG:
    dw $0004,$01F8 
    db $E0 
    dw $30B6,$01F0 
    db $E0 
    dw $30BD,$01E8 
    db $E0 
    dw $30B0,$01E0 
    db $E0 
    dw $30B1 

DebugSpritemaps_33_EnemyNames_BATTA1:
    dw $0006,$0008 
    db $E0 
    dw $30D1,$0000 
    db $E0 
    dw $30B0,$01F8 
    db $E0 
    dw $30C5,$01F0 
    db $E0 
    dw $30C5,$01E8 
    db $E0 
    dw $30B0,$01E0 
    db $E0 
    dw $30B1 

DebugSpritemaps_34_EnemyNames_BATTA2:
    dw $0006,$0008 
    db $E0 
    dw $30D2,$0000 
    db $E0 
    dw $30B0,$01F8 
    db $E0 
    dw $30C5,$01F0 
    db $E0 
    dw $30C5,$01E8 
    db $E0 
    dw $30B0,$01E0 
    db $E0 
    dw $30B1 

DebugSpritemaps_35_EnemyNames_BATTA3:
    dw $0006,$0008 
    db $E0 
    dw $30D3,$0000 
    db $E0 
    dw $30B0,$01F8 
    db $E0 
    dw $30C5,$01F0 
    db $E0 
    dw $30C5,$01E8 
    db $E0 
    dw $30B0,$01E0 
    db $E0 
    dw $30B1 

DebugSpritemaps_36_EnemyNames_BOTOON:
    dw $0006,$0008 
    db $E0 
    dw $30BD,$01F0 
    db $E0 
    dw $30C5,$0000 
    db $E0 
    dw $30C0,$01F8 
    db $E0 
    dw $30C0,$01E8 
    db $E0 
    dw $30C0,$01E0 
    db $E0 
    dw $30B1 

DebugSpritemaps_37_EnemyNames_BOYON:
    dw $0005,$0000 
    db $E0 
    dw $30BD,$01F8 
    db $E0 
    dw $30C0,$01F0 
    db $E0 
    dw $30CA,$01E8 
    db $E0 
    dw $30C0,$01E0 
    db $E0 
    dw $30B1 

DebugSpritemaps_38_EnemyNames_DESSGEEG:
    dw $0008,$0018 
    db $E0 
    dw $30B6,$0010 
    db $E0 
    dw $30B4,$0008 
    db $E0 
    dw $30B4,$0000 
    db $E0 
    dw $30B6,$01F8 
    db $E0 
    dw $30C4,$01F0 
    db $E0 
    dw $30C4,$01E8 
    db $E0 
    dw $30B4,$01E0 
    db $E0 
    dw $30B3 

DebugSpritemaps_39_EnemyNames_DORI:
    dw $0004,$01F8 
    db $E0 
    dw $30B8,$01F0 
    db $E0 
    dw $30C3,$01E8 
    db $E0 
    dw $30C0,$01E0 
    db $E0 
    dw $30B3 

DebugSpritemaps_3A_EnemyNames_DRAGON:
    dw $0006,$0008 
    db $E0 
    dw $30BD,$0000 
    db $E0 
    dw $30C0,$01F8 
    db $E0 
    dw $30B6,$01F0 
    db $E0 
    dw $30B0,$01E8 
    db $E0 
    dw $30C3,$01E0 
    db $E0 
    dw $30B3 

DebugSpritemaps_3B_EnemyNames_EBI:
    dw $0003,$01F0 
    db $E0 
    dw $30B8,$01E8 
    db $E0 
    dw $30B1,$01E0 
    db $E0 
    dw $30B4 

DebugSpritemaps_3C_EnemyNames_EYE:
    dw $0003,$01F0 
    db $E0 
    dw $30B4,$01E8 
    db $E0 
    dw $30CA,$01E0 
    db $E0 
    dw $30B4 

DebugSpritemaps_3D_EnemyNames_NAMIHE:
    dw $0007,$0000 
    db $E0 
    dw $30B7,$0010 
    db $E0 
    dw $30B8,$0008 
    db $E0 
    dw $30B4,$01F8 
    db $E0 
    dw $30B8,$01F0 
    db $E0 
    dw $30BC,$01E8 
    db $E0 
    dw $30B0,$01E0 
    db $E0 
    dw $30BD 

DebugSpritemaps_3E_EnemyNames_FISH:
    dw $0004,$01F8 
    db $E0 
    dw $30B7,$01F0 
    db $E0 
    dw $30C4,$01E8 
    db $E0 
    dw $30B8,$01E0 
    db $E0 
    dw $30B5 

DebugSpritemaps_3F_EnemyNames_GAI:
    dw $0003,$01F0 
    db $E0 
    dw $30B8,$01E8 
    db $E0 
    dw $30B0,$01E0 
    db $E0 
    dw $30B6 

DebugSpritemaps_40_EnemyNames_GAMET:
    dw $0005,$0000 
    db $E0 
    dw $30C5,$01F8 
    db $E0 
    dw $30B4,$01F0 
    db $E0 
    dw $30BC,$01E8 
    db $E0 
    dw $30B0,$01E0 
    db $E0 
    dw $30B6 

DebugSpritemaps_41_EnemyNames_GEEGA:
    dw $0005,$01F0 
    db $E0 
    dw $30B4,$0000 
    db $E0 
    dw $30B0,$01F8 
    db $E0 
    dw $30B6,$01E8 
    db $E0 
    dw $30B4,$01E0 
    db $E0 
    dw $30B6 

DebugSpritemaps_42_EnemyNames_GERUDA:
    dw $0006,$0008 
    db $E0 
    dw $30B0,$0000 
    db $E0 
    dw $30B3,$01F8 
    db $E0 
    dw $30C6,$01F0 
    db $E0 
    dw $30C3,$01E8 
    db $E0 
    dw $30B4,$01E0 
    db $E0 
    dw $30B6 

DebugSpritemaps_43_EnemyNames_GRAVY:
    dw $0005,$0000 
    db $E0 
    dw $30CA,$01F8 
    db $E0 
    dw $30C7,$01F0 
    db $E0 
    dw $30B0,$01E8 
    db $E0 
    dw $30C3,$01E0 
    db $E0 
    dw $30B6 

DebugSpritemaps_44_EnemyNames_HATCHI1:
    dw $0006,$0008 
    db $E0 
    dw $30D1,$0000 
    db $E0 
    dw $30B8,$01F8 
    db $E0 
    dw $30B7,$01F0 
    db $E0 
    dw $30B2,$01E8 
    db $E0 
    dw $30B0,$01E0 
    db $E0 
    dw $30B7 

DebugSpritemaps_45_EnemyNames_HAND:
    dw $0004,$01F8 
    db $E0 
    dw $30B3,$01F0 
    db $E0 
    dw $30BD,$01E8 
    db $E0 
    dw $30B0,$01E0 
    db $E0 
    dw $30B7 

DebugSpritemaps_46_EnemyNames_HIBASHI:
    dw $0007,$0010 
    db $E0 
    dw $30B8,$0008 
    db $E0 
    dw $30B7,$0000 
    db $E0 
    dw $30C4,$01F8 
    db $E0 
    dw $30B0,$01F0 
    db $E0 
    dw $30B1,$01E8 
    db $E0 
    dw $30B8,$01E0 
    db $E0 
    dw $30B7 

DebugSpritemaps_47_EnemyNames_HIRU:
    dw $0004,$01F8 
    db $E0 
    dw $30C6,$01F0 
    db $E0 
    dw $30C3,$01E8 
    db $E0 
    dw $30B8,$01E0 
    db $E0 
    dw $30B7 

DebugSpritemaps_48_EnemyNames_HOLTZ:
    dw $0005,$0000 
    db $E0 
    dw $30CB,$01F8 
    db $E0 
    dw $30C5,$01F0 
    db $E0 
    dw $30BB,$01E8 
    db $E0 
    dw $30C0,$01E0 
    db $E0 
    dw $30B7 

DebugSpritemaps_49_EnemyNames_HOTARY:
    dw $0006,$0008 
    db $E0 
    dw $30CA,$0000 
    db $E0 
    dw $30C3,$01F8 
    db $E0 
    dw $30B0,$01F0 
    db $E0 
    dw $30C5,$01E8 
    db $E0 
    dw $30C0,$01E0 
    db $E0 
    dw $30B7 

DebugSpritemaps_4A_EnemyNames_HZOOMER:
    dw $0007,$0010 
    db $E0 
    dw $30C3,$0008 
    db $E0 
    dw $30B4,$0000 
    db $E0 
    dw $30BC,$01F8 
    db $E0 
    dw $30C0,$01F0 
    db $E0 
    dw $30C0,$01E8 
    db $E0 
    dw $30CB,$01E0 
    db $E0 
    dw $30B7 

DebugSpritemaps_4B_EnemyNames_KAGO:
    dw $0004,$01F8 
    db $E0 
    dw $30C0,$01F0 
    db $E0 
    dw $30B6,$01E8 
    db $E0 
    dw $30B0,$01E0 
    db $E0 
    dw $30BA 

DebugSpritemaps_4C_EnemyNames_KAME:
    dw $0004,$01F8 
    db $E0 
    dw $30B4,$01F0 
    db $E0 
    dw $30BC,$01E8 
    db $E0 
    dw $30B0,$01E0 
    db $E0 
    dw $30BA 

DebugSpritemaps_4D_EnemyNames_KAMER:
    dw $0005,$0000 
    db $E0 
    dw $30C3,$01F8 
    db $E0 
    dw $30B4,$01F0 
    db $E0 
    dw $30BC,$01E8 
    db $E0 
    dw $30B0,$01E0 
    db $E0 
    dw $30BA 

DebugSpritemaps_4E_EnemyNames_KANI:
    dw $0004,$01F8 
    db $E0 
    dw $30B8,$01F0 
    db $E0 
    dw $30BD,$01E8 
    db $E0 
    dw $30B0,$01E0 
    db $E0 
    dw $30BA 

DebugSpritemaps_4F_EnemyNames_KOMA:
    dw $0004,$01F8 
    db $E0 
    dw $30B0,$01F0 
    db $E0 
    dw $30BC,$01E8 
    db $E0 
    dw $30C0,$01E0 
    db $E0 
    dw $30BA 

DebugSpritemaps_50_EnemyNames_KZAN:
    dw $0004,$01F8 
    db $E0 
    dw $30BD,$01F0 
    db $E0 
    dw $30B0,$01E8 
    db $E0 
    dw $30CB,$01E0 
    db $E0 
    dw $30BA 

DebugSpritemaps_51_EnemyNames_LAVAMAN:
    dw $0007,$0010 
    db $E0 
    dw $30BD,$0008 
    db $E0 
    dw $30B0,$0000 
    db $E0 
    dw $30BC,$01F8 
    db $E0 
    dw $30B0,$01F0 
    db $E0 
    dw $30C7,$01E0 
    db $E0 
    dw $30BB,$01E8 
    db $E0 
    dw $30B0 

DebugSpritemaps_52_EnemyNames_MELLA:
    dw $0005,$0000 
    db $E0 
    dw $30B0,$01F8 
    db $E0 
    dw $30BB,$01F0 
    db $E0 
    dw $30BB,$01E8 
    db $E0 
    dw $30B4,$01E0 
    db $E0 
    dw $30BC 

DebugSpritemaps_53_EnemyNames_MEMU:
    dw $0004,$01F8 
    db $E0 
    dw $30C6,$01E8 
    db $E0 
    dw $30B4,$01E0 
    db $E0 
    dw $30BC,$01F0 
    db $E0 
    dw $30BC 

DebugSpritemaps_54_EnemyNames_MERO:
    dw $0004,$01F8 
    db $E0 
    dw $30C0,$01F0 
    db $E0 
    dw $30C3,$01E8 
    db $E0 
    dw $30B4,$01E0 
    db $E0 
    dw $30BC 

DebugSpritemaps_55_EnemyNames_METALEE:
    dw $0007,$0010 
    db $E0 
    dw $30B4,$0008 
    db $E0 
    dw $30B4,$0000 
    db $E0 
    dw $30BB,$01F8 
    db $E0 
    dw $30B0,$01F0 
    db $E0 
    dw $30C5,$01E8 
    db $E0 
    dw $30B4,$01E0 
    db $E0 
    dw $30BC 

DebugSpritemaps_56_EnemyNames_METMOD:
    dw $0006,$0008 
    db $E0 
    dw $30B3,$0000 
    db $E0 
    dw $30C0,$01F8 
    db $E0 
    dw $30BC,$01F0 
    db $E0 
    dw $30C5,$01E8 
    db $E0 
    dw $30B4,$01E0 
    db $E0 
    dw $30BC 

DebugSpritemaps_57_EnemyNames_METROID:
    dw $0007,$0010 
    db $E0 
    dw $30B3,$0008 
    db $E0 
    dw $30B8,$01F8 
    db $E0 
    dw $30C3,$0000 
    db $E0 
    dw $30C0,$01F0 
    db $E0 
    dw $30C5,$01E8 
    db $E0 
    dw $30B4,$01E0 
    db $E0 
    dw $30BC 

DebugSpritemaps_58_EnemyNames_MULTI:
    dw $0005,$0000 
    db $E0 
    dw $30B8,$01F8 
    db $E0 
    dw $30C5,$01F0 
    db $E0 
    dw $30BB,$01E8 
    db $E0 
    dw $30C6,$01E0 
    db $E0 
    dw $30BC 

DebugSpritemaps_59_EnemyNames_MZOOMER:
    dw $0007,$01F8 
    db $E0 
    dw $30C0,$01F0 
    db $E0 
    dw $30C0,$01E8 
    db $E0 
    dw $30CB,$0010 
    db $E0 
    dw $30C3,$0008 
    db $E0 
    dw $30B4,$0000 
    db $E0 
    dw $30BC,$01E0 
    db $E0 
    dw $30BC 

DebugSpritemaps_5A_EnemyNames_NDRA:
    dw $0004,$01F8 
    db $E0 
    dw $30B0,$01F0 
    db $E0 
    dw $30C3,$01E8 
    db $E0 
    dw $30B3,$01E0 
    db $E0 
    dw $30BD 

DebugSpritemaps_5B_EnemyNames_NOMI:
    dw $0004,$01F8 
    db $E0 
    dw $30B8,$01F0 
    db $E0 
    dw $30BC,$01E8 
    db $E0 
    dw $30C0,$01E0 
    db $E0 
    dw $30BD 

DebugSpritemaps_5C_EnemyNames_NOVA:
    dw $0004,$01F8 
    db $E0 
    dw $30B0,$01F0 
    db $E0 
    dw $30C7,$01E8 
    db $E0 
    dw $30C0,$01E0 
    db $E0 
    dw $30BD 

DebugSpritemaps_5D_EnemyNames_OUM:
    dw $0003,$01F0 
    db $E0 
    dw $30BC,$01E8 
    db $E0 
    dw $30C6,$01E0 
    db $E0 
    dw $30C0 

DebugSpritemaps_5E_EnemyNames_OUMU:
    dw $0004,$01F8 
    db $E0 
    dw $30C6,$01F0 
    db $E0 
    dw $30BC,$01E8 
    db $E0 
    dw $30C6,$01E0 
    db $E0 
    dw $30C0 

DebugSpritemaps_5F_EnemyNames_PIPE:
    dw $0004,$01F8 
    db $E0 
    dw $30B4,$01F0 
    db $E0 
    dw $30C1,$01E8 
    db $E0 
    dw $30B8,$01E0 
    db $E0 
    dw $30C1 

DebugSpritemaps_60_EnemyNames_POLYP:
    dw $0005,$0000 
    db $E0 
    dw $30C1,$01F0 
    db $E0 
    dw $30BB,$01F8 
    db $E0 
    dw $30CA,$01E8 
    db $E0 
    dw $30C0,$01E0 
    db $E0 
    dw $30C1 

DebugSpritemaps_61_EnemyNames_PUROMI:
    dw $0006,$0008 
    db $E0 
    dw $30B8,$0000 
    db $E0 
    dw $30BC,$01F8 
    db $E0 
    dw $30C0,$01F0 
    db $E0 
    dw $30C3,$01E8 
    db $E0 
    dw $30C6,$01E0 
    db $E0 
    dw $30C1 

DebugSpritemaps_62_EnemyNames_PUU:
    dw $0003,$01F0 
    db $E0 
    dw $30C6,$01E8 
    db $E0 
    dw $30C6,$01E0 
    db $E0 
    dw $30C1 

DebugSpritemaps_63_EnemyNames_PUYO:
    dw $0004,$01F8 
    db $E0 
    dw $30C0,$01F0 
    db $E0 
    dw $30CA,$01E8 
    db $E0 
    dw $30C6,$01E0 
    db $E0 
    dw $30C1 

DebugSpritemaps_64_EnemyNames_REFLEC:
    dw $0006,$0008 
    db $E0 
    dw $30B2,$0000 
    db $E0 
    dw $30B4,$01F8 
    db $E0 
    dw $30BB,$01F0 
    db $E0 
    dw $30B5,$01E8 
    db $E0 
    dw $30B4,$01E0 
    db $E0 
    dw $30C3 

DebugSpritemaps_65_EnemyNames_RINKA:
    dw $0005,$0000 
    db $E0 
    dw $30B0,$01F8 
    db $E0 
    dw $30BA,$01F0 
    db $E0 
    dw $30BD,$01E8 
    db $E0 
    dw $30B8,$01E0 
    db $E0 
    dw $30C3 

DebugSpritemaps_66_EnemyNames_RIO:
    dw $0003,$01F0 
    db $E0 
    dw $30C0,$01E8 
    db $E0 
    dw $30B8,$01E0 
    db $E0 
    dw $30C3 

DebugSpritemaps_67_EnemyNames_RIPPER1:
    dw $0007,$0010 
    db $E0 
    dw $30D1,$0000 
    db $E0 
    dw $30B4,$01F8 
    db $E0 
    dw $30C1,$01F0 
    db $E0 
    dw $30C1,$01E8 
    db $E0 
    dw $30B8,$0008 
    db $E0 
    dw $30C3,$01E0 
    db $E0 
    dw $30C3 

DebugSpritemaps_68_EnemyNames_RIPPER2:
    dw $0007,$0010 
    db $E0 
    dw $30D2,$0000 
    db $E0 
    dw $30B4,$01F8 
    db $E0 
    dw $30C1,$01F0 
    db $E0 
    dw $30C1,$01E8 
    db $E0 
    dw $30B8,$0008 
    db $E0 
    dw $30C3,$01E0 
    db $E0 
    dw $30C3 

DebugSpritemaps_69_EnemyNames_ROBO:
    dw $0004,$01F8 
    db $E0 
    dw $30C0,$01F0 
    db $E0 
    dw $30B1,$01E8 
    db $E0 
    dw $30C0,$01E0 
    db $E0 
    dw $30C3 

DebugSpritemaps_6A_EnemyNames_RSTONE:
    dw $0006,$0008 
    db $E0 
    dw $30B4,$0000 
    db $E0 
    dw $30BD,$01F8 
    db $E0 
    dw $30C0,$01F0 
    db $E0 
    dw $30C5,$01E8 
    db $E0 
    dw $30C4,$01E0 
    db $E0 
    dw $30C3 

DebugSpritemaps_6B_EnemyNames_SABOTEN:
    dw $0007,$0010 
    db $E0 
    dw $30BD,$0008 
    db $E0 
    dw $30B4,$0000 
    db $E0 
    dw $30C5,$01F8 
    db $E0 
    dw $30C0,$01F0 
    db $E0 
    dw $30B1,$01E8 
    db $E0 
    dw $30B0,$01E0 
    db $E0 
    dw $30C4 

DebugSpritemaps_6C_EnemyNames_SBUG:
    dw $0004,$01F8 
    db $E0 
    dw $30B6,$01F0 
    db $E0 
    dw $30C6,$01E8 
    db $E0 
    dw $30B1,$01E0 
    db $E0 
    dw $30C4 

DebugSpritemaps_6D_EnemyNames_SCLAYD:
    dw $0006,$0008 
    db $E0 
    dw $30B3,$0000 
    db $E0 
    dw $30CA,$01F8 
    db $E0 
    dw $30B0,$01F0 
    db $E0 
    dw $30BB,$01E8 
    db $E0 
    dw $30B2,$01E0 
    db $E0 
    dw $30C4 

DebugSpritemaps_6E_EnemyNames_SDEATH:
    dw $0006,$0008 
    db $E0 
    dw $30B7,$0000 
    db $E0 
    dw $30C5,$01F8 
    db $E0 
    dw $30B0,$01F0 
    db $E0 
    dw $30B4,$01E8 
    db $E0 
    dw $30B3,$01E0 
    db $E0 
    dw $30C4 

DebugSpritemaps_6F_EnemyNames_SHUTTER1:
    dw $0008,$0018 
    db $E0 
    dw $30D1,$0010 
    db $E0 
    dw $30C3,$0008 
    db $E0 
    dw $30B4,$0000 
    db $E0 
    dw $30C5,$01F8 
    db $E0 
    dw $30C5,$01F0 
    db $E0 
    dw $30C6,$01E8 
    db $E0 
    dw $30B7,$01E0 
    db $E0 
    dw $30C4 

DebugSpritemaps_70_EnemyNames_SHUTTER2:
    dw $0008,$0018 
    db $E0 
    dw $30D2,$0010 
    db $E0 
    dw $30C3,$0008 
    db $E0 
    dw $30B4,$0000 
    db $E0 
    dw $30C5,$01F8 
    db $E0 
    dw $30C5,$01F0 
    db $E0 
    dw $30C6,$01E8 
    db $E0 
    dw $30B7,$01E0 
    db $E0 
    dw $30C4 

DebugSpritemaps_71_EnemyNames_SIDE:
    dw $0004,$01F8 
    db $E0 
    dw $30B4,$01F0 
    db $E0 
    dw $30B3,$01E8 
    db $E0 
    dw $30B8,$01E0 
    db $E0 
    dw $30C4 

DebugSpritemaps_72_EnemyNames_SKREE:
    dw $0005,$0000 
    db $E0 
    dw $30B4,$01F8 
    db $E0 
    dw $30B4,$01F0 
    db $E0 
    dw $30C3,$01E8 
    db $E0 
    dw $30BA,$01E0 
    db $E0 
    dw $30C4 

DebugSpritemaps_73_EnemyNames_SPA:
    dw $0003,$01F0 
    db $E0 
    dw $30B0,$01E8 
    db $E0 
    dw $30C1,$01E0 
    db $E0 
    dw $30C4 

DebugSpritemaps_74_EnemyNames_SQUEEWPT:
    dw $0008,$0018 
    db $E0 
    dw $30C5,$0010 
    db $E0 
    dw $30C1,$0008 
    db $E0 
    dw $30C8,$0000 
    db $E0 
    dw $30B4,$01F8 
    db $E0 
    dw $30B4,$01F0 
    db $E0 
    dw $30C6,$01E8 
    db $E0 
    dw $30C2,$01E0 
    db $E0 
    dw $30C4 

DebugSpritemaps_75_EnemyNames_SSIDE:
    dw $0005,$0000 
    db $E0 
    dw $30B4,$01F8 
    db $E0 
    dw $30B3,$01F0 
    db $E0 
    dw $30B8,$01E8 
    db $E0 
    dw $30C4,$01E0 
    db $E0 
    dw $30C4 

DebugSpritemaps_76_EnemyNames_STOKE:
    dw $0005,$0000 
    db $E0 
    dw $30B4,$01F8 
    db $E0 
    dw $30BA,$01F0 
    db $E0 
    dw $30C0,$01E8 
    db $E0 
    dw $30C5,$01E0 
    db $E0 
    dw $30C4 

DebugSpritemaps_77_EnemyNames_TOGE:
    dw $0004,$01E0 
    db $E0 
    dw $30C5,$01F8 
    db $E0 
    dw $30B4,$01F0 
    db $E0 
    dw $30B6,$01E8 
    db $E0 
    dw $30C0 

DebugSpritemaps_78_EnemyNames_VIOLA:
    dw $0005,$01F8 
    db $E0 
    dw $30BB,$0000 
    db $E0 
    dw $30B0,$01F0 
    db $E0 
    dw $30C0,$01E8 
    db $E0 
    dw $30B8,$01E0 
    db $E0 
    dw $30C7 

DebugSpritemaps_79_EnemyNames_WAVER:
    dw $0005,$0000 
    db $E0 
    dw $30C3,$01F8 
    db $E0 
    dw $30B4,$01F0 
    db $E0 
    dw $30C7,$01E8 
    db $E0 
    dw $30B0,$01E0 
    db $E0 
    dw $30C8 

DebugSpritemaps_7A_EnemyNames_YARD:
    dw $0004,$01F8 
    db $E0 
    dw $30B3,$01F0 
    db $E0 
    dw $30C3,$01E8 
    db $E0 
    dw $30B0,$01E0 
    db $E0 
    dw $30CA 

DebugSpritemaps_7B_EnemyNames_ZEB:
    dw $0003,$01F0 
    db $E0 
    dw $30B1,$01E8 
    db $E0 
    dw $30B4,$01E0 
    db $E0 
    dw $30CB 

DebugSpritemaps_7C_EnemyNames_ZEBBO:
    dw $0005,$0000 
    db $E0 
    dw $30C0,$01F8 
    db $E0 
    dw $30B1,$01F0 
    db $E0 
    dw $30B1,$01E8 
    db $E0 
    dw $30B4,$01E0 
    db $E0 
    dw $30CB 

DebugSpritemaps_7D_EnemyNames_ZEELA:
    dw $0005,$0000 
    db $E0 
    dw $30B0,$01F8 
    db $E0 
    dw $30BB,$01F0 
    db $E0 
    dw $30B4,$01E8 
    db $E0 
    dw $30B4,$01E0 
    db $E0 
    dw $30CB 

DebugSpritemaps_7E_EnemyNames_ZOA:
    dw $0003,$01F0 
    db $E0 
    dw $30B0,$01E8 
    db $E0 
    dw $30C0,$01E0 
    db $E0 
    dw $30CB 

DebugSpritemaps_7F_EnemyNames_ZOOMER:
    dw $0006,$0008 
    db $E0 
    dw $30C3,$0000 
    db $E0 
    dw $30B4,$01F8 
    db $E0 
    dw $30BC,$01F0 
    db $E0 
    dw $30C0,$01E8 
    db $E0 
    dw $30C0,$01E0 
    db $E0 
    dw $30CB 

DebugSpritemaps_1C_TextCursor:
    dw $0001,$0000 
    db $00 
    dw $303E 

DebugSpritemaps_30_EnemyNames_NoDebug:
    dw $0008,$0018 
    db $E0 
    dw $30CD,$0010 
    db $E0 
    dw $30E6,$0008 
    db $E0 
    dw $30F4,$0000 
    db $E0 
    dw $30E1,$01F8 
    db $E0 
    dw $30E4,$01F0 
    db $E0 
    dw $30B3,$01E8 
    db $E0 
    dw $30EE,$01E0 
    db $E0 
    dw $30BD 

DebugSpritemaps_80_EnemyNames_BATTA1br:
    dw $0008,$0018 
    db $E0 
    dw $30F1,$0010 
    db $E0 
    dw $30E1,$0008 
    db $E0 
    dw $30D1,$0000 
    db $E0 
    dw $30B0,$01F8 
    db $E0 
    dw $30C5,$01F0 
    db $E0 
    dw $30C5,$01E8 
    db $E0 
    dw $30B0,$01E0 
    db $E0 
    dw $30B1 

DebugSpritemaps_81_EnemyNames_BATTA1NO:
    dw $0008,$0018 
    db $E0 
    dw $30EE,$0010 
    db $E0 
    dw $30ED,$0008 
    db $E0 
    dw $30D1,$0000 
    db $E0 
    dw $30B0,$01F8 
    db $E0 
    dw $30C5,$01F0 
    db $E0 
    dw $30C5,$01E8 
    db $E0 
    dw $30B0,$01E0 
    db $E0 
    dw $30B1 

DebugSpritemaps_82_EnemyNames_BATTA1np:
    dw $0008,$0018 
    db $E0 
    dw $30EF,$0010 
    db $E0 
    dw $30ED,$0008 
    db $E0 
    dw $30D1,$0000 
    db $E0 
    dw $30B0,$01F8 
    db $E0 
    dw $30C5,$01F0 
    db $E0 
    dw $30C5,$01E8 
    db $E0 
    dw $30B0,$01E0 
    db $E0 
    dw $30B1 

DebugSpritemaps_8_EnemyNames_BATTA1ml:
    dw $0008,$0018 
    db $E0 
    dw $30EB,$0010 
    db $E0 
    dw $30EC,$0008 
    db $E0 
    dw $30D1,$0000 
    db $E0 
    dw $30B0,$01F8 
    db $E0 
    dw $30C5,$01F0 
    db $E0 
    dw $30C5,$01E8 
    db $E0 
    dw $30B0,$01E0 
    db $E0 
    dw $30B1 

DebugSpritemaps_84_EnemyNames_BATTA1ts:
    dw $0008,$0018 
    db $E0 
    dw $30F2,$0010 
    db $E0 
    dw $30F3,$0008 
    db $E0 
    dw $30D1,$0000 
    db $E0 
    dw $30B0,$01F8 
    db $E0 
    dw $30C5,$01F0 
    db $E0 
    dw $30C5,$01E8 
    db $E0 
    dw $30B0,$01E0 
    db $E0 
    dw $30B1 

DebugSpritemaps_85_EnemyNames_BATTA2br:
    dw $0008,$0018 
    db $E0 
    dw $30F1,$0010 
    db $E0 
    dw $30E1,$0008 
    db $E0 
    dw $30D2,$0000 
    db $E0 
    dw $30B0,$01F8 
    db $E0 
    dw $30C5,$01F0 
    db $E0 
    dw $30C5,$01E8 
    db $E0 
    dw $30B0,$01E0 
    db $E0 
    dw $30B1 

DebugSpritemaps_86_EnemyNames_BATTA2no:
    dw $0008,$0008 
    db $E0 
    dw $30D2,$0018 
    db $E0 
    dw $30EE,$0010 
    db $E0 
    dw $30ED,$0000 
    db $E0 
    dw $30B0,$01F8 
    db $E0 
    dw $30C5,$01F0 
    db $E0 
    dw $30C5,$01E8 
    db $E0 
    dw $30B0,$01E0 
    db $E0 
    dw $30B1 

DebugSpritemaps_87_EnemyNames_BATTA2np:
    dw $0008,$0018 
    db $E0 
    dw $30EF,$0008 
    db $E0 
    dw $30D2,$0010 
    db $E0 
    dw $30ED,$0000 
    db $E0 
    dw $30B0,$01F8 
    db $E0 
    dw $30C5,$01F0 
    db $E0 
    dw $30C5,$01E8 
    db $E0 
    dw $30B0,$01E0 
    db $E0 
    dw $30B1 

DebugSpritemaps_88_EnemyNames_BATTA2ml:
    dw $0008,$0018 
    db $E0 
    dw $30EB,$0010 
    db $E0 
    dw $30EC,$0008 
    db $E0 
    dw $30D2,$0000 
    db $E0 
    dw $30B0,$01F8 
    db $E0 
    dw $30C5,$01F0 
    db $E0 
    dw $30C5,$01E8 
    db $E0 
    dw $30B0,$01E0 
    db $E0 
    dw $30B1 

DebugSpritemaps_89_EnemyNames_BATTA2ts:
    dw $0008,$0018 
    db $E0 
    dw $30F2,$0010 
    db $E0 
    dw $30F3,$0008 
    db $E0 
    dw $30D2,$0000 
    db $E0 
    dw $30B0,$01F8 
    db $E0 
    dw $30C5,$01F0 
    db $E0 
    dw $30C5,$01E8 
    db $E0 
    dw $30B0,$01E0 
    db $E0 
    dw $30B1 

DebugSpritemaps_8A_EnemyNames_BATTA3br:
    dw $0008,$0018 
    db $E0 
    dw $30F1,$0010 
    db $E0 
    dw $30E1,$0008 
    db $E0 
    dw $30D3,$0000 
    db $E0 
    dw $30B0,$01F8 
    db $E0 
    dw $30C5,$01F0 
    db $E0 
    dw $30C5,$01E8 
    db $E0 
    dw $30B0,$01E0 
    db $E0 
    dw $30B1 

DebugSpritemaps_8B_EnemyNames_BATTA3no:
    dw $0008,$0018 
    db $E0 
    dw $30EE,$0010 
    db $E0 
    dw $30ED,$0008 
    db $E0 
    dw $30D3,$0000 
    db $E0 
    dw $30B0,$01F8 
    db $E0 
    dw $30C5,$01F0 
    db $E0 
    dw $30C5,$01E8 
    db $E0 
    dw $30B0,$01E0 
    db $E0 
    dw $30B1 

DebugSpritemaps_8C_EnemyNames_BATTA3np:
    dw $0008,$0018 
    db $E0 
    dw $30EF,$0010 
    db $E0 
    dw $30ED,$0008 
    db $E0 
    dw $30D3,$0000 
    db $E0 
    dw $30B0,$01F8 
    db $E0 
    dw $30C5,$01F0 
    db $E0 
    dw $30C5,$01E8 
    db $E0 
    dw $30B0,$01E0 
    db $E0 
    dw $30B1 

DebugSpritemaps_8D_EnemyNames_BATTA3ml:
    dw $0008,$0018 
    db $E0 
    dw $30EB,$0010 
    db $E0 
    dw $30EC,$0008 
    db $E0 
    dw $30D3,$0000 
    db $E0 
    dw $30B0,$01F8 
    db $E0 
    dw $30C5,$01F0 
    db $E0 
    dw $30C5,$01E8 
    db $E0 
    dw $30B0,$01E0 
    db $E0 
    dw $30B1 

DebugSpritemaps_8E_EnemyNames_BATTA3ts:
    dw $0008,$0018 
    db $E0 
    dw $30F2,$0010 
    db $E0 
    dw $30F3,$0008 
    db $E0 
    dw $30D3,$0000 
    db $E0 
    dw $30B0,$01F8 
    db $E0 
    dw $30C5,$01F0 
    db $E0 
    dw $30C5,$01E8 
    db $E0 
    dw $30B0,$01E0 
    db $E0 
    dw $30B1 

DebugSpritemaps_14_AreaNames_SF_Crateria:
    dw $0003,$01E8 
    db $F8 
    dw $30B5,$01E0 
    db $F8 
    dw $30C4,$01F8 
    db $F8 
    dw $30FD 

DebugSpritemaps_15_AreaNames_BL_Brinstar:
    dw $0003,$01E8 
    db $F8 
    dw $30BB,$01E0 
    db $F8 
    dw $30B1,$01F8 
    db $F8 
    dw $30FD 

DebugSpritemaps_16_AreaNames_NO_Norfair:
    dw $0003,$01E8 
    db $F8 
    dw $30C0,$01E0 
    db $F8 
    dw $30BD,$01F8 
    db $F8 
    dw $30FD 

DebugSpritemaps_17_AreaNames_NP_WreckedShip:
    dw $0003,$01E8 
    db $F8 
    dw $30C1,$01E0 
    db $F8 
    dw $30BD,$01F8 
    db $F8 
    dw $30FD 

DebugSpritemaps_18_AreaNames_ML_Maridia:
    dw $0003,$01E8 
    db $F8 
    dw $30BB,$01E0 
    db $F8 
    dw $30BC,$01F8 
    db $F8 
    dw $30FD 

DebugSpritemaps_19_AreaNames_TS_Tourian:
    dw $0003,$01E8 
    db $F8 
    dw $30C4,$01E0 
    db $F8 
    dw $30C5,$01F8 
    db $F8 
    dw $30FD 

DebugSpritemaps_1A_AreaNames_CO_Ceres:
    dw $0003,$01E8 
    db $F8 
    dw $30C0,$01E0 
    db $F8 
    dw $30B2,$01F8 
    db $F8 
    dw $30FD 

DebugSpritemaps_1B_AreaNames_TT_Debug:
    dw $0003,$01E8 
    db $F8 
    dw $30C5,$01E0 
    db $F8 
    dw $30C5,$01F8 
    db $F8 
    dw $30FD 

DebugSpritemaps_8F_EnemyNames_FUNE:
    dw $0004,$01F8 
    db $E0 
    dw $30B4,$01F0 
    db $E0 
    dw $30BD,$01E8 
    db $E0 
    dw $30C6,$01E0 
    db $E0 
    dw $30B5 

DebugSpritemaps_90_EnemyNames_HATCHI2:
    dw $0006,$0008 
    db $E0 
    dw $30D2,$0000 
    db $E0 
    dw $30B8,$01F8 
    db $E0 
    dw $30B7,$01F0 
    db $E0 
    dw $30B2,$01E8 
    db $E0 
    dw $30B0,$01E0 
    db $E0 
    dw $30B7 

DebugSpritemaps_91_EnemyNames_HATCHI3:
    dw $0006,$0008 
    db $E0 
    dw $30D3,$0000 
    db $E0 
    dw $30B8,$01F8 
    db $E0 
    dw $30B7,$01F0 
    db $E0 
    dw $30B2,$01E8 
    db $E0 
    dw $30B0,$01E0 
    db $E0 
    dw $30B7 

DebugSpritemaps_92_EnemyNames_ROBO2:
    dw $0005,$0000 
    db $E0 
    dw $30D2,$01F8 
    db $E0 
    dw $30C0,$01F0 
    db $E0 
    dw $30B1,$01E8 
    db $E0 
    dw $30C0,$01E0 
    db $E0 
    dw $30C3 

Create_Sprite_Object:
    PHX 
    PHY 
    PHP 
    PHB 
    PEA.W $B400 
    PLB 
    PLB 
    REP #$30 
    LDX.W #$003E 

.loop:
    LDA.L $7EEF78,X 
    BEQ .found 
    DEX #2
    BPL .loop 
    BRA .return 


.found:
    LDA.W #$0000 : STA.L $7EF078,X 
    STA.L $7EF178,X 
    STA.L $7EF278,X 
    STA.L $7EF2F8,X 
    LDA.B $12 : STA.L $7EF0F8,X 
    LDA.B $14 : STA.L $7EF1F8,X 
    LDA.B $18 : STA.L $7EF078,X 
    LDA.B $16 
    ASL A 
    TAY 
    LDA.W SpriteObject_DrawInst_Pointers,Y : STA.L $7EEF78,X 
    PHX 
    TAX 
    LDA.L $B40000,X 
    PLX 
    STA.L $7EEFF8,X 
    STX.B $12 

.return:
    PLB 
    PLP 
    PLY 
    PLX 
    RTL 


HandleSpriteObjects:
    PHX 
    PHY 
    PHP 
    PHB 
    PEA.W $B400 
    PLB 
    PLB 
    REP #$30 
    LDA.W $0A78 
    ORA.W $185E 
    BNE .return 
    LDX.W #$003E 
    STX.W $1844 

.loop:
    LDX.W $1844 
    LDA.L $7EEF78,X 
    BEQ .next 
    LDA.L $7EF2F8,X 
    BIT.W #$0001 
    BNE .next 
    LDA.L $7EEFF8,X 
    BMI .ASMInstruction 
    DEC A 
    STA.L $7EEFF8,X 
    BNE .next 
    LDA.L $7EEF78,X 
    INC #4
    STA.L $7EEF78,X 
    TAX 
    LDA.L $B40000,X 
    CMP.W #$8000 
    BPL .ASMInstruction 
    LDX.W $1844 
    STA.L $7EEFF8,X 

.next:
    LDA.W $1844 
    DEC #2
    STA.W $1844 
    BPL .loop 
    BRA .return 


.ASMInstruction:
    STA.B $12 
    PEA.W .next-1 
    JMP.W ($0012) 


.return:
    PLB 
    PLP 
    PLY 
    PLX 
    RTL 


Instruction_SpriteObject_GoBack4Bytes:
    LDX.W $1844 
    LDA.L $7EEF78,X 
    DEC #4
    STA.L $7EEF78,X 
    LDA.W #$7FFF : STA.L $7EEFF8,X 
    RTS 


Instruction_SpriteObject_Delete:
    LDX.W $1844 
    LDA.W #$0000 : STA.L $7EEF78,X 
    RTS 


Instruction_SpriteObject_GotoParameter:
    LDX.W $1844 
    LDA.L $7EEF78,X 
    TAX 
    LDA.L $B40002,X 
    LDX.W $1844 
    STA.L $7EEF78,X 
    TAX 
    LDA.L $B40000,X 
    LDX.W $1844 
    STA.L $7EEFF8,X 
    RTS 


DrawSpriteObjects:
    PHX 
    PHY 
    PHP 
    PHB 
    PEA.W $B400 
    PLB 
    PLB 
    REP #$30 
    LDX.W #$003E 

.loop:
    LDA.L $7EEF78,X 
    BEQ .next 
    LDA.L $7EF0F8,X : SEC : SBC.W $0911 : STA.B $14 
    CLC : ADC.W #$0010 : BMI .next 
    CMP.W #$0120 
    BPL .next 
    LDA.L $7EF1F8,X : SEC : SBC.W $0915 : STA.B $12 
    BMI .next 
    CMP.W #$0110 
    BPL .next 
    LDA.L $7EF078,X : AND.W #$0E00 : STA.B $03 
    LDA.L $7EF078,X : AND.W #$01FF : STA.B $00 
    PHX 
    LDA.L $7EEF78,X 
    TAX 
    LDA.L $B40002,X 
    TAY 
    JSL.L AddSpritemapToOAM_WithBaseTileNumber_8AB8 
    PLX 

.next:
    DEX #2
    BPL .loop 
    PLB 
    PLP 
    PLY 
    PLX 
    RTL 


ClearSpriteObjects:
    LDX.W #$03FE 
    LDA.W #$0000 

.loop:
    STA.L $7EEF78,X 
    DEX #2
    BNE .loop 
    RTL 


SpriteObject_DrawInst_Empty:
    dw $0000 

SpriteObject_DrawInst_Pointers:
    dw UNUSED_InstList_SpriteObject_0_BeamCharge_B4BE5A 
    dw UNUSED_InstList_SpriteObject_1_MBElbowChargeParticles_B4BE6C 
    dw UNSUED_InstList_SpriteObject_2_MBElbowChargeEnergy_B4BE86 
    dw InstList_SpriteObject_3_SmallExplosion 
    dw UNUSED_InstList_SpriteObject_4_BombExplosion_B4BEBE 
    dw UNUSED_InstList_SpriteObject_5_BeamTrail_B4BED4 
    dw InstList_SpriteObject_6_DudShot 
    dw UNUSED_InstList_SpriteObject_7_PowerBomb_B4BF04 
    dw UNUSED_InstList_SpriteObject_8_ElevatorPad_B4BF12 
    dw InstList_SpriteObject_9_SmallDudShot 
    dw InstList_SpriteObject_A_SpacePirateLandingDustCloud 
    dw UNUSED_InstList_SpriteObject_B_EyeDoorSweatDrop_B4BF44 
    dw InstList_SpriteObject_C_Smoke 
    dw UNUSED_InstList_SpriteObject_D_SmallEnergyDrop_B4BF8E 
    dw UNUSED_InstList_SpriteObject_E_BigEnergyDrop_B4BFA0 
    dw UNUSED_InstList_SpriteObject_F_Bomb_B4BFB2 
    dw UNUSED_InstList_SpriteObject_10_WeirdSmallEnergyDrop_B4BFC4 
    dw UNUSED_InstList_SpriteObject_11_RockParticles_B4BFD2 
    dw InstList_SpriteObject_12_ShortBigDustCloud 
    dw UNUSED_InstList_SpriteObject_13_ShortBigDustCloudBeam_B4C026 
    dw UNUSED_InstList_SpriteObject_14_ShortBigDustCloudBeam_B4C040 
    dw InstList_SpriteObject_15_BigDustCloud 
    dw UNUSED_InstList_SpriteObject_16_WeirdLongBeam_B4C080 
    dw UNUSED_InstList_SpriteObject_17_WeirdLongFlickerBeam_B4C0FE 
    dw InstList_SpriteObject_18_ShortDraygonBreathBubbles 
    dw UNSUED_InstList_SpriteObject_19_SaveStationElectricity 
    dw UNUSED_InstList_SpriteObject_1A_ExpandingVerticalGate_B4C154 
    dw UNUSED_InstList_SpriteObject_1B_ContractingVerticalGate 
    dw UNUSED_InstList_SpriteObject_1C_ElevatorPad_B4BF68 
    dw InstList_SpriteObject_1D_BigExplosion 
    dw UNUSED_InstList_SpriteObject_1E_B4C198 
    dw UNUSED_InstList_SpriteObject_1F_B4C1AC 
    dw UNUSED_InstList_SpriteObject_20_B4C1C0 
    dw UNUSED_InstList_SpriteObject_21_B4C1D4 
    dw UNUSED_InstList_SpriteObject_22_B4C1E8 
    dw UNUSED_InstList_SpriteObject_23_B4C1FC 
    dw UNUSED_InstList_SpriteObject_24_B4C210 
    dw UNUSED_InstList_SpriteObject_25_B4C224 
    dw UNUSED_InstList_SpriteObject_26_B4C238 
    dw UNUSED_InstList_SpriteObject_27_B4C258 
    dw UNUSED_InstList_SpriteObject_28_B4C2A0 
    dw UNUSED_InstList_SpriteObject_29_B4C2BC 
    dw UNUSED_InstList_SpriteObject_2A_B4C304 
    dw InstList_SpriteObject_2B_PuromiBody 
    dw InstList_SpriteObject_2C_PuromiRightExplosion 
    dw InstList_SpriteObject_2D_PuromiLeftExplosion 
    dw InstList_SpriteObject_2E_PuromiSplash 
    dw UNUSED_InstList_SpriteObject_2F_B4BE54 
    dw InstList_SpriteObject_30_FallingSparkTrail 
    dw UNSUED_InstList_SpriteObject_31_MetroidInsides_B4C3A2 
    dw InstList_SpriteObject_32_MetroidElectricity 
    dw UNUSED_InstList_SpriteObject_33_B4C436 
    dw InstList_SpriteObject_34_MetroidShell 
    dw UNUSED_InstList_SpriteObject_35_B4C536 
    dw UNUSED_InstList_SpriteObject_36_B4C5B2 
    dw InstList_SpriteObject_37_EnemyShot 
    dw InstList_SpriteObject_38_YappingMawBaseFacingDown 
    dw InstList_SpriteObject_39_YappingMawBaseFacingUp 
    dw UNUSED_InstList_SpriteObject_3A_B4C5E4 
    dw InstList_SpriteObject_3B_EvirFacingLeft 
    dw InstList_SpriteObject_3C_EvirFacingRight 
    dw InstList_SpriteObject_3D_DraygonFoamingAtTheMouth 

InstList_SpriteObject_3D_DraygonFoamingAtTheMouth:
    dw $0006 
    dw SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_0 
    dw $0006 
    dw SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_1 
    dw $0007 
    dw SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_2 
    dw $0007 
    dw SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_3 
    dw $0008 
    dw SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_4 
    dw $0008 
    dw SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_5 
    dw $0009 
    dw SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_6 
    dw $0009 
    dw SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_7 
    dw Instruction_SpriteObject_Delete 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_SpriteObject_B4BE46:
    dw $0005 
    dw UNUSED_SpriteObjectSpritemaps_B4DD3C 
    dw $0005 
    dw UNUSED_SpriteObjectSpritemaps_B4DD43 
    dw $0005 
    dw UNUSED_SpriteObjectSpritemaps_B4DD4A 
    dw Instruction_SpriteObject_Delete 
endif ; !FEATURE_KEEP_UNREFERENCED

UNUSED_InstList_SpriteObject_2F_B4BE54:
    dw $0001 
    dw UNUSED_SpriteObjectSpritemaps_2F_B4D594 
    dw Instruction_SpriteObject_GoBack4Bytes 

UNUSED_InstList_SpriteObject_0_BeamCharge_B4BE5A:
    dw $0003 
    dw UNUSED_SpriteObjectSpritemaps_0_BeamCharge_0_B4CAC9 
    dw $0003 
    dw UNUSED_SpriteObjectSpritemaps_0_BeamCharge_1_B4CAD0 
    dw $0003 
    dw UNUSED_SpriteObjectSpritemaps_0_BeamCharge_2_B4CAD7 
    dw $0003 
    dw UNUSED_SpriteObjectSpritemaps_0_BeamCharge_3_B4CADE 
    dw Instruction_SpriteObject_Delete 

UNUSED_InstList_SpriteObject_1_MBElbowChargeParticles_B4BE6C:
    dw $0005 
    dw UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_0_B4CAF4 
    dw $0004 
    dw UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_1_B4CB05 
    dw $0003 
    dw UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_2_B4CB16 
    dw $0003 
    dw UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_3_B4CB27 
    dw $0003 
    dw UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_4_B4CB38 
    dw $0003 
    dw UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_5_B4CB49 
    dw Instruction_SpriteObject_Delete 

UNSUED_InstList_SpriteObject_2_MBElbowChargeEnergy_B4BE86:
    dw $0004 
    dw UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_0_B4CB5A 
    dw $0003 
    dw UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_1_B4CB6B 
    dw $0002 
    dw UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_2_B4CB7C 
    dw $0002 
    dw UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_3_B4CB8D 
    dw $0002 
    dw UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_4_B4CB9E 
    dw $0002 
    dw UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_5_B4CBAF 
    dw $000C 
    dw SpriteObjectSpritemaps_3_SmallExplosion_0 
    dw Instruction_SpriteObject_Delete 

InstList_SpriteObject_3_SmallExplosion:
    dw $0004 
    dw SpriteObjectSpritemaps_3_SmallExplosion_0 
    dw $0006 
    dw SpriteObjectSpritemaps_3_SmallExplosion_1 
    dw $0005 
    dw SpriteObjectSpritemaps_3_SmallExplosion_2 
    dw $0005 
    dw SpriteObjectSpritemaps_3_SmallExplosion_3 
    dw $0005 
    dw SpriteObjectSpritemaps_3_SmallExplosion_4 
    dw $0006 
    dw SpriteObjectSpritemaps_3_SmallExplosion_5 
    dw Instruction_SpriteObject_Delete 

UNUSED_InstList_SpriteObject_4_BombExplosion_B4BEBE:
    dw $0003 
    dw UNSUED_SpriteObjectSpritemaps_4_BombExplosion_0_B4CC35 
    dw $0003 
    dw UNSUED_SpriteObjectSpritemaps_4_BombExplosion_1_B4CC4B 
    dw $0004 
    dw UNSUED_SpriteObjectSpritemaps_4_BombExplosion_2_B4CC61 
    dw $0004 
    dw UNSUED_SpriteObjectSpritemaps_4_BombExplosion_3_B4CC77 
    dw $0004 
    dw UNSUED_SpriteObjectSpritemaps_4_BombExplosion_4_B4CC8D 
    dw Instruction_SpriteObject_Delete 

UNUSED_InstList_SpriteObject_5_BeamTrail_B4BED4:
    dw $0008 
    dw UNSUED_SpriteObjectSpritemaps_5_BeamTrail_0_B4CCB9 
    dw $0008 
    dw UNSUED_SpriteObjectSpritemaps_5_BeamTrail_1_B4CCC0 
    dw $0008 
    dw UNSUED_SpriteObjectSpritemaps_5_BeamTrail_2_B4CCC7 
    dw $0008 
    dw UNSUED_SpriteObjectSpritemaps_5_BeamTrail_3_B4CCCE 
    dw $0018 
    dw UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_3_B4CB8D 
    dw Instruction_SpriteObject_Delete 

InstList_SpriteObject_6_DudShot:
    dw $0004 
    dw SpriteObjectSpritemaps_6_DudShot_0 
    dw $0004 
    dw SpriteObjectSpritemaps_6_DudShot_1 
    dw $0004 
    dw SpriteObjectSpritemaps_6_DudShot_2 
    dw $0004 
    dw SpriteObjectSpritemaps_6_DudShot_3 
    dw $0004 
    dw SpriteObjectSpritemaps_6_DudShot_4 
    dw $0004 
    dw SpriteObjectSpritemaps_6_DudShot_5 
    dw Instruction_SpriteObject_Delete 

UNUSED_InstList_SpriteObject_7_PowerBomb_B4BF04:
    dw $0005 
    dw UNSUED_SpriteObjectSpritemaps_7_PowerBomb_0_B4CCD5 
    dw $0005 
    dw UNSUED_SpriteObjectSpritemaps_7_PowerBomb_1_B4CCDC 
    dw $0005 
    dw UNSUED_SpriteObjectSpritemaps_7_PowerBomb_2_B4CCE3 
    dw Instruction_SpriteObject_Delete 

UNUSED_InstList_SpriteObject_8_ElevatorPad_B4BF12:
    dw $0001 
    dw UNSUED_SpriteObjectSpritemaps_8_1C_ElevatorPad_0_B4CD57 
    dw $0001 
    dw UNSUED_SpriteObjectSpritemaps_8_1C_ElevatorPad_1_B4CD6D 
    dw Instruction_SpriteObject_Delete 

InstList_SpriteObject_9_SmallDudShot:
    dw $0005 
    dw SpriteObjectSpritemaps_A_PirateLandingDustCloud_0 
    dw $0005 
    dw SpriteObjectSpritemaps_9_SmallDustCloud_0 
    dw $0005 
    dw SpriteObjectSpritemaps_9_SmallDustCloud_1 
    dw $0005 
    dw SpriteObjectSpritemaps_9_SmallDustCloud_2 
    dw $0005 
    dw SpriteObjectSpritemaps_9_SmallDustCloud_3 
    dw Instruction_SpriteObject_Delete 

InstList_SpriteObject_A_SpacePirateLandingDustCloud:
    dw $0003 
    dw SpriteObjectSpritemaps_A_PirateLandingDustCloud_0 
    dw $0003 
    dw SpriteObjectSpritemaps_A_PirateLandingDustCloud_1 
    dw $0003 
    dw SpriteObjectSpritemaps_A_PirateLandingDustCloud_2 
    dw $0003 
    dw SpriteObjectSpritemaps_A_PirateLandingDustCloud_3 
    dw Instruction_SpriteObject_Delete 

UNUSED_InstList_SpriteObject_B_EyeDoorSweatDrop_B4BF44:
    dw $0005 
    dw UNSUED_SpriteObjectSpritemaps_B_EyeDoorSweatDrop_0_B4CDD1 
    dw $0005 
    dw UNSUED_SpriteObjectSpritemaps_B_EyeDoorSweatDrop_1_B4CDD8 
    dw $0005 
    dw UNSUED_SpriteObjectSpritemaps_B_EyeDoorSweatDrop_2_B4CDDF 
    dw $0005 
    dw UNSUED_SpriteObjectSpritemaps_B_EyeDoorSweatDrop_3_B4CDE6 
    dw Instruction_SpriteObject_Delete 

InstList_SpriteObject_C_Smoke:
    dw $0008 
    dw SpriteObjectSpritemaps_C_Smoke_0 
    dw $0008 
    dw SpriteObjectSpritemaps_C_Smoke_1 
    dw $0008 
    dw SpriteObjectSpritemaps_C_Smoke_2 
    dw $0008 
    dw SpriteObjectSpritemaps_C_Smoke_3 
    dw Instruction_SpriteObject_Delete 

UNUSED_InstList_SpriteObject_1C_ElevatorPad_B4BF68:
    dw $0001 
    dw UNSUED_SpriteObjectSpritemaps_8_1C_ElevatorPad_0_B4CD57 
    dw $0001 
    dw UNSUED_SpriteObjectSpritemaps_8_1C_ElevatorPad_1_B4CD6D 
    dw Instruction_SpriteObject_GotoParameter 
    dw UNUSED_InstList_SpriteObject_1C_ElevatorPad_B4BF68 

InstList_SpriteObject_1D_BigExplosion:
    dw $0005 
    dw SpriteObjectSpritemaps_1D_BigExplosion_0 
    dw $0005 
    dw SpriteObjectSpritemaps_1D_BigExplosion_1 
    dw $0005 
    dw SpriteObjectSpritemaps_1D_BigExplosion_2 
    dw $0005 
    dw SpriteObjectSpritemaps_1D_BigExplosion_3 
    dw $0005 
    dw SpriteObjectSpritemaps_1D_BigExplosion_4 
    dw $0005 
    dw SpriteObjectSpritemaps_1D_BigExplosion_5 
    dw Instruction_SpriteObject_Delete 

UNUSED_InstList_SpriteObject_D_SmallEnergyDrop_B4BF8E:
    dw $0008 
    dw UNUSED_SpriteObjectSpritemaps_D_SmallEnergyDrop_0_B4CE1E 
    dw $0008 
    dw UNUSED_SpriteObjectSpritemaps_D_SmallEnergyDrop_1_B4CE25 
    dw $0008 
    dw UNUSED_SpriteObjectSpritemaps_D_SmallEnergyDrop_2_B4CE2C 
    dw $0008 
    dw UNUSED_SpriteObjectSpritemaps_D_SmallEnergyDrop_3_B4CE33 
    dw Instruction_SpriteObject_Delete 

UNUSED_InstList_SpriteObject_E_BigEnergyDrop_B4BFA0:
    dw $0008 
    dw UNUSED_SpriteObjectSpritemaps_E_BigEnergyDrop_0_B4CE3A 
    dw $0008 
    dw UNUSED_SpriteObjectSpritemaps_E_BigEnergyDrop_1_B4CE50 
    dw $0008 
    dw UNUSED_SpriteObjectSpritemaps_E_BigEnergyDrop_2_B4CE66 
    dw $0008 
    dw UNUSED_SpriteObjectSpritemaps_E_BigEnergyDrop_3_B4CE7C 
    dw Instruction_SpriteObject_Delete 

UNUSED_InstList_SpriteObject_F_Bomb_B4BFB2:
    dw $0005 
    dw UNUSED_SpriteObjectSpritemaps_F_Bomb_0_B4CE83 
    dw $0005 
    dw UNUSED_SpriteObjectSpritemaps_F_Bomb_1_B4CE8A 
    dw $0005 
    dw UNUSED_SpriteObjectSpritemaps_F_Bomb_2_B4CE91 
    dw $0005 
    dw UNUSED_SpriteObjectSpritemaps_F_Bomb_3_B4CE98 
    dw Instruction_SpriteObject_Delete 

UNUSED_InstList_SpriteObject_10_WeirdSmallEnergyDrop_B4BFC4:
    dw $0010 
    dw UNUSED_SpriteObjectSpritemaps_10_SmallEnergyDrop_0_B4CF87 
    dw $0010 
    dw UNUSED_SpriteObjectSpritemaps_10_SmallEnergyDrop_1_B4CF8E 
    dw $0010 
    dw UNUSED_SpriteObjectSpritemaps_10_SmallEnergyDrop_2_B4CF95 
    dw Instruction_SpriteObject_Delete 

UNUSED_InstList_SpriteObject_11_RockParticles_B4BFD2:
    dw $0002 
    dw UNUSED_SpriteObjectSpritemaps_11_RockParticles_0_B4C6D8 
    dw $0002 
    dw UNUSED_SpriteObjectSpritemaps_11_RockParticles_1_B4C6EE 
    dw $0002 
    dw UNUSED_SpriteObjectSpritemaps_11_RockParticles_2_B4C704 
    dw $0002 
    dw UNUSED_SpriteObjectSpritemaps_11_RockParticles_3_B4C71A 
    dw $0002 
    dw UNUSED_SpriteObjectSpritemaps_11_RockParticles_4_B4C730 
    dw $0002 
    dw UNUSED_SpriteObjectSpritemaps_11_RockParticles_5_B4C746 
    dw $0002 
    dw UNUSED_SpriteObjectSpritemaps_11_RockParticles_6_B4C75C 
    dw $0002 
    dw UNUSED_SpriteObjectSpritemaps_11_RockParticles_7_B4C772 
    dw $0002 
    dw UNUSED_SpriteObjectSpritemaps_11_RockParticles_8_B4C788 
    dw $0002 
    dw UNUSED_SpriteObjectSpritemaps_11_RockParticles_9_B4C79E 
    dw $0002 
    dw UNUSED_SpriteObjectSpritemaps_11_RockParticles_A_B4C7B4 
    dw $0002 
    dw UNUSED_SpriteObjectSpritemaps_11_RockParticles_B_B4C7CA 
    dw $0002 
    dw UNUSED_SpriteObjectSpritemaps_11_RockParticles_C_B4C7E0 
    dw $0002 
    dw UNUSED_SpriteObjectSpritemaps_11_RockParticles_D_B4C7F6 
    dw $0002 
    dw UNUSED_SpriteObjectSpritemaps_11_RockParticles_E_B4C80C 
    dw $0002 
    dw UNUSED_SpriteObjectSpritemaps_11_RockParticles_F_B4C822 
    dw Instruction_SpriteObject_Delete 

InstList_SpriteObject_12_ShortBigDustCloud:
    dw $0002 
    dw SpriteObjectSpritemaps_12_15_BigDustCloud_0 
    dw $0002 
    dw SpriteObjectSpritemaps_12_15_BigDustCloud_1 
    dw $0002 
    dw SpriteObjectSpritemaps_12_15_BigDustCloud_2 
    dw $0002 
    dw SpriteObjectSpritemaps_12_15_BigDustCloud_3 
    dw Instruction_SpriteObject_Delete 

UNUSED_InstList_SpriteObject_13_ShortBigDustCloudBeam_B4C026:
    dw $0003 
    dw SpriteObjectSpritemaps_13_14_15_BigDustCloud_4 
    dw $0003 
    dw SpriteObjectSpritemaps_13_14_15_BigDustCloud_5 
    dw $0003 
    dw SpriteObjectSpritemaps_13_14_15_BigDustCloud_6 
    dw $0003 
    dw SpriteObjectSpritemaps_13_14_15_BigDustCloud_7 
    dw $0003 
    dw UNUSED_SpriteObjectSpritemaps_13_14_16_DustCloud_Beam_B4C8AC 
    dw $0005 
    dw UNUSED_SpriteObjectSpritemaps_13_14_16_DustCloud_Beam_B4C8B3 
    dw Instruction_SpriteObject_Delete 

UNUSED_InstList_SpriteObject_14_ShortBigDustCloudBeam_B4C040:
    dw $0003 
    dw SpriteObjectSpritemaps_13_14_15_BigDustCloud_4 
    dw $0003 
    dw SpriteObjectSpritemaps_13_14_15_BigDustCloud_5 
    dw $0003 
    dw SpriteObjectSpritemaps_13_14_15_BigDustCloud_6 
    dw $0003 
    dw SpriteObjectSpritemaps_13_14_15_BigDustCloud_7 
    dw $0003 
    dw UNUSED_SpriteObjectSpritemaps_13_14_16_DustCloud_Beam_B4C8AC 
    dw $0003 
    dw UNUSED_SpriteObjectSpritemaps_13_14_16_DustCloud_Beam_B4C8B3 
    dw $0003 
    dw UNUSED_SpriteObjectSpritemaps_14_16_DustCloud_Beam_B4C8BA 
    dw Instruction_SpriteObject_Delete 

InstList_SpriteObject_15_BigDustCloud:
    dw $0005 
    dw SpriteObjectSpritemaps_12_15_BigDustCloud_0 
    dw $0005 
    dw SpriteObjectSpritemaps_12_15_BigDustCloud_1 
    dw $0005 
    dw SpriteObjectSpritemaps_12_15_BigDustCloud_2 
    dw $0005 
    dw SpriteObjectSpritemaps_12_15_BigDustCloud_3 
    dw $0005 
    dw SpriteObjectSpritemaps_13_14_15_BigDustCloud_4 
    dw $0005 
    dw SpriteObjectSpritemaps_13_14_15_BigDustCloud_5 
    dw $0005 
    dw SpriteObjectSpritemaps_13_14_15_BigDustCloud_6 
    dw $0005 
    dw SpriteObjectSpritemaps_13_14_15_BigDustCloud_7 
    dw Instruction_SpriteObject_Delete 

UNUSED_InstList_SpriteObject_16_WeirdLongBeam_B4C080:
    dw $0001 
    dw UNUSED_SpriteObjectSpritemaps_13_14_16_DustCloud_Beam_B4C8AC 
    dw $0001 
    dw UNUSED_SpriteObjectSpritemaps_13_14_16_DustCloud_Beam_B4C8B3 
    dw $0001 
    dw UNUSED_SpriteObjectSpritemaps_14_16_DustCloud_Beam_B4C8BA 
    dw $0001 
    dw UNUSED_SpriteObjectSpritemaps_16_DustCloud_Beam_B4C8C6 
    dw $0001 
    dw UNUSED_SpriteObjectSpritemaps_16_DustCloud_Beam_B4C8D2 
    dw $0001 
    dw UNUSED_SpriteObjectSpritemaps_16_DustCloud_Beam_B4C8E2 
    dw $0001 
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4 
    dw $0001 
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A 
    dw $0001 
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4 
    dw $0001 
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A 
    dw $0001 
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4 
    dw $0001 
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A 
    dw $0001 
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4 
    dw $0001 
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A 
    dw $0001 
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4 
    dw $0001 
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A 
    dw $0001 
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4 
    dw $0001 
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A 
    dw $0001 
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4 
    dw $0001 
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A 
    dw $0001 
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4 
    dw $0001 
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A 
    dw $0001 
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4 
    dw $0001 
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A 
    dw $0001 
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4 
    dw $0001 
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A 
    dw $0001 
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4 
    dw $0001 
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A 
    dw $0001 
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4 
    dw $0001 
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A 
    dw $0001 
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4 
    dw Instruction_SpriteObject_Delete 

UNUSED_InstList_SpriteObject_17_WeirdLongFlickerBeam_B4C0FE:
    dw $0001 
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4 
    dw $0001 
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A 
    dw $0001 
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4 
    dw Instruction_SpriteObject_Delete 

InstList_SpriteObject_18_ShortDraygonBreathBubbles:
    dw $0003 
    dw SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_0 
    dw $0003 
    dw SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_1 
    dw $0003 
    dw SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_2 
    dw $0003 
    dw SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_3 
    dw $0003 
    dw SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_4 
    dw $0003 
    dw SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_5 
    dw $0003 
    dw SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_6 
    dw $0003 
    dw SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_7 
    dw $0003 
    dw SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_8 
    dw Instruction_SpriteObject_Delete 

UNSUED_InstList_SpriteObject_19_SaveStationElectricity:
    dw $0001 
    dw UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_0_B4C9A0 
    dw $0001 
    dw UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_1_B4C9B6 
    dw $0001 
    dw UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_2_B4C9CC 
    dw $0001 
    dw UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_3_B4C9E2 
    dw $0001 
    dw UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_4_B4C9F8 
    dw $0001 
    dw UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_5_B4CA0E 
    dw $0001 
    dw UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_6_B4CA24 
    dw $0001 
    dw UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_7_B4CA3A 
    dw Instruction_SpriteObject_Delete 

UNUSED_InstList_SpriteObject_1A_ExpandingVerticalGate_B4C154:
    dw $0010 
    dw UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_0_B4CA50 
    dw $0010 
    dw UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_1_B4CA5C 
    dw $0010 
    dw UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_2_B4CA63 
    dw $0010 
    dw UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_3_B4CA6F 
    dw $0010 
    dw UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_4_B4CA7B 
    dw $0010 
    dw UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_5_B4CA8C 
    dw $0010 
    dw UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_6_B4CA9D 
    dw $0010 
    dw UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_7_B4CAB3 
    dw Instruction_SpriteObject_Delete 

UNUSED_InstList_SpriteObject_1B_ContractingVerticalGate:
    dw $0004 
    dw UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_7_B4CAB3 
    dw $0004 
    dw UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_6_B4CA9D 
    dw $0004 
    dw UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_5_B4CA8C 
    dw $0004 
    dw UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_4_B4CA7B 
    dw $0004 
    dw UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_3_B4CA6F 
    dw $0004 
    dw UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_2_B4CA63 
    dw $0004 
    dw UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_1_B4CA5C 
    dw $0004 
    dw UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_0_B4CA50 
    dw Instruction_SpriteObject_Delete 

UNUSED_InstList_SpriteObject_1E_B4C198:
    dw $0005 
    dw UNUSED_SpriteObjectSpritemaps_1E_0_B4C630 
    dw $0005 
    dw UNUSED_SpriteObjectSpritemaps_1E_1_B4C637 
    dw $0005 
    dw UNUSED_SpriteObjectSpritemaps_1E_0_B4C630 
    dw $0005 
    dw UNUSED_SpriteObjectSpritemaps_1E_2_B4C63E 
    dw Instruction_SpriteObject_GotoParameter 
    dw UNUSED_InstList_SpriteObject_1E_B4C198 

UNUSED_InstList_SpriteObject_1F_B4C1AC:
    dw $0005 
    dw UNUSED_SpriteObjectSpritemaps_1F_0_B4C645 
    dw $0005 
    dw UNUSED_SpriteObjectSpritemaps_1F_1_B4C645 
    dw $0005 
    dw UNUSED_SpriteObjectSpritemaps_1F_0_B4C645 
    dw $0005 
    dw UNUSED_SpriteObjectSpritemaps_1F_2_B4C653 
    dw Instruction_SpriteObject_GotoParameter 
    dw UNUSED_InstList_SpriteObject_1F_B4C1AC 

UNUSED_InstList_SpriteObject_20_B4C1C0:
    dw $0005 
    dw UNUSED_SpriteObjectSpritemaps_20_0_B4C65A 
    dw $0005 
    dw UNUSED_SpriteObjectSpritemaps_20_1_B4C661 
    dw $0005 
    dw UNUSED_SpriteObjectSpritemaps_20_0_B4C65A 
    dw $0005 
    dw UNUSED_SpriteObjectSpritemaps_20_2_B4C668 
    dw Instruction_SpriteObject_GotoParameter 
    dw UNUSED_InstList_SpriteObject_20_B4C1C0 

UNUSED_InstList_SpriteObject_21_B4C1D4:
    dw $0005 
    dw UNUSED_SpriteObjectSpritemaps_21_0_B4C66F 
    dw $0005 
    dw UNUSED_SpriteObjectSpritemaps_21_1_B4C676 
    dw $0005 
    dw UNUSED_SpriteObjectSpritemaps_21_0_B4C66F 
    dw $0005 
    dw UNUSED_SpriteObjectSpritemaps_21_2_B4C67D 
    dw Instruction_SpriteObject_GotoParameter 
    dw UNUSED_InstList_SpriteObject_21_B4C1D4 

UNUSED_InstList_SpriteObject_22_B4C1E8:
    dw $0005 
    dw UNUSED_SpriteObjectSpritemaps_22_0_B4C684 
    dw $0005 
    dw UNUSED_SpriteObjectSpritemaps_22_1_B4C68B 
    dw $0005 
    dw UNUSED_SpriteObjectSpritemaps_22_0_B4C684 
    dw $0005 
    dw UNUSED_SpriteObjectSpritemaps_22_2_B4C692 
    dw Instruction_SpriteObject_GotoParameter 
    dw UNUSED_InstList_SpriteObject_22_B4C1E8 

UNUSED_InstList_SpriteObject_23_B4C1FC:
    dw $0005 
    dw UNUSED_SpriteObjectSpritemaps_23_0_B4C699 
    dw $0005 
    dw UNUSED_SpriteObjectSpritemaps_23_1_B4C6A0 
    dw $0005 
    dw UNUSED_SpriteObjectSpritemaps_23_0_B4C699 
    dw $0005 
    dw UNUSED_SpriteObjectSpritemaps_23_2_B4C6A7 
    dw Instruction_SpriteObject_GotoParameter 
    dw UNUSED_InstList_SpriteObject_23_B4C1FC 

UNUSED_InstList_SpriteObject_24_B4C210:
    dw $0005 
    dw UNUSED_SpriteObjectSpritemaps_24_0_B4C6AE 
    dw $0005 
    dw UNUSED_SpriteObjectSpritemaps_24_1_B4C6B5 
    dw $0005 
    dw UNUSED_SpriteObjectSpritemaps_24_0_B4C6AE 
    dw $0005 
    dw UNUSED_SpriteObjectSpritemaps_24_2_B4C6BC 
    dw Instruction_SpriteObject_GotoParameter 
    dw UNUSED_InstList_SpriteObject_24_B4C210 

UNUSED_InstList_SpriteObject_25_B4C224:
    dw $0005 
    dw UNUSED_SpriteObjectSpritemaps_25_0_B4C6C3 
    dw $0005 
    dw UNUSED_SpriteObjectSpritemaps_25_1_B4C6CA 
    dw $0005 
    dw UNUSED_SpriteObjectSpritemaps_25_0_B4C6C3 
    dw $0005 
    dw UNUSED_SpriteObjectSpritemaps_25_2_B4C6D1 
    dw Instruction_SpriteObject_GotoParameter 
    dw UNUSED_InstList_SpriteObject_25_B4C224 

UNUSED_InstList_SpriteObject_26_B4C238:
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_26_0_B4D08B 
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_26_0_B4D08B 
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_26_1_B4D0BA 
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_26_2_B4D0E9 
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_26_3_B4D118 
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_26_4_B4D147 
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_26_5_B4D176 
    dw Instruction_SpriteObject_GotoParameter 
    dw UNUSED_InstList_SpriteObject_26_B4C238 

UNUSED_InstList_SpriteObject_27_B4C258:
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_27_0_B4D1D4 
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_27_1_B4D1EF 
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_27_2_B4D20A 
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_27_3_B4D225 
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_27_0_B4D1D4 
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_27_1_B4D1EF 
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_27_2_B4D20A 
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_27_3_B4D225 
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_27_0_B4D1D4 
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_27_1_B4D1EF 
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_27_2_B4D20A 
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_27_3_B4D225 
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_27_0_B4D1D4 
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_27_1_B4D1EF 
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_27_2_B4D20A 
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_27_3_B4D225 
    dw $0030 
    dw UNUSED_SpriteObjectSpritemaps_27_4_B4D245 
    dw Instruction_SpriteObject_GotoParameter 
    dw UNUSED_InstList_SpriteObject_27_B4C258 

UNUSED_InstList_SpriteObject_28_B4C2A0:
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_28_0_B4D2B3 
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_28_1_B4D2E2 
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_28_2_B4D311 
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_28_3_B4D340 
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_28_4_B4D36F 
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_28_5_B4D39E 
    dw Instruction_SpriteObject_GotoParameter 
    dw UNUSED_InstList_SpriteObject_28_B4C2A0 

UNUSED_InstList_SpriteObject_29_B4C2BC:
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_29_0_B4D3FC 
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_29_1_B4D417 
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_29_2_B4D432 
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_29_3_B4D44D 
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_29_0_B4D3FC 
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_29_1_B4D417 
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_29_2_B4D432 
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_29_3_B4D44D 
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_29_0_B4D3FC 
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_29_1_B4D417 
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_29_2_B4D432 
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_29_3_B4D44D 
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_29_0_B4D3FC 
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_29_1_B4D417 
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_29_2_B4D432 
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_29_3_B4D44D 
    dw $0030 
    dw UNUSED_SpriteObjectSpritemaps_29_4_B4D46D 
    dw Instruction_SpriteObject_GotoParameter 
    dw UNUSED_InstList_SpriteObject_29_B4C2BC 

UNUSED_InstList_SpriteObject_2A_B4C304:
    dw $0001 
    dw UNUSED_SpriteObjectSpritemaps_2A_B4D2AC 
    dw Instruction_SpriteObject_GoBack4Bytes 

InstList_SpriteObject_2B_PuromiBody:
    dw $0003 
    dw SpriteObjectSpritemaps_2B_Puromi_0 
    dw $0003 
    dw SpriteObjectSpritemaps_2B_Puromi_1 
    dw $0003 
    dw SpriteObjectSpritemaps_2B_Puromi_4 
    dw $0003 
    dw SpriteObjectSpritemaps_2B_Puromi_2 
    dw $0003 
    dw SpriteObjectSpritemaps_2B_Puromi_3 
    dw $0003 
    dw SpriteObjectSpritemaps_2B_Puromi_5 
    dw $0003 
    dw SpriteObjectSpritemaps_2B_Puromi_0 
    dw $0003 
    dw SpriteObjectSpritemaps_2B_Puromi_1 
    dw $0003 
    dw SpriteObjectSpritemaps_2B_Puromi_6 
    dw $0003 
    dw SpriteObjectSpritemaps_2B_Puromi_2 
    dw $0003 
    dw SpriteObjectSpritemaps_2B_Puromi_3 
    dw $0003 
    dw SpriteObjectSpritemaps_2B_Puromi_7 
    dw Instruction_SpriteObject_GotoParameter 
    dw InstList_SpriteObject_2B_PuromiBody 

InstList_SpriteObject_2C_PuromiRightExplosion:
    dw $0002 
    dw SpriteObjectSpritemaps_2C_PuromiRightExplosion_0 
    dw $0002 
    dw SpriteObjectSpritemaps_2C_PuromiRightExplosion_1 
    dw $0002 
    dw SpriteObjectSpritemaps_2C_PuromiRightExplosion_2 
    dw $0002 
    dw SpriteObjectSpritemaps_2C_PuromiRightExplosion_3 
    dw $0002 
    dw SpriteObjectSpritemaps_2C_PuromiRightExplosion_4 
    dw $0002 
    dw SpriteObjectSpritemaps_2C_PuromiRightExplosion_5 
    dw $0002 
    dw SpriteObjectSpritemaps_2C_PuromiRightExplosion_6 
    dw Instruction_SpriteObject_Delete 

InstList_SpriteObject_2D_PuromiLeftExplosion:
    dw $0002 
    dw SpriteObjectSpritemaps_2D_PuromiLeftExplosion_0 
    dw $0002 
    dw SpriteObjectSpritemaps_2D_PuromiLeftExplosion_1 
    dw $0002 
    dw SpriteObjectSpritemaps_2D_PuromiLeftExplosion_2 
    dw $0002 
    dw SpriteObjectSpritemaps_2D_PuromiLeftExplosion_3 
    dw $0002 
    dw SpriteObjectSpritemaps_2D_PuromiLeftExplosion_4 
    dw $0002 
    dw SpriteObjectSpritemaps_2D_PuromiLeftExplosion_5 
    dw $0002 
    dw SpriteObjectSpritemaps_2D_PuromiLeftExplosion_6 
    dw Instruction_SpriteObject_Delete 

InstList_SpriteObject_2E_PuromiSplash:
    dw $0002 
    dw SpriteObjectSpritemaps_2E_PuromiSplash_0 
    dw $0002 
    dw SpriteObjectSpritemaps_2E_PuromiSplash_0 
    dw $0002 
    dw SpriteObjectSpritemaps_2E_PuromiSplash_1 
    dw $0002 
    dw SpriteObjectSpritemaps_2E_PuromiSplash_2 
    dw $0002 
    dw SpriteObjectSpritemaps_2E_PuromiSplash_4 
    dw Instruction_SpriteObject_Delete 

InstList_SpriteObject_30_FallingSparkTrail:
    dw $0003 
    dw SpriteObjectSpritemaps_30_FallingSparkTrail_0 
    dw $0003 
    dw SpriteObjectSpritemaps_30_FallingSparkTrail_1 
    dw $0003 
    dw SpriteObjectSpritemaps_30_FallingSparkTrail_2 
    dw $0003 
    dw SpriteObjectSpritemaps_30_FallingSparkTrail_3 
    dw Instruction_SpriteObject_Delete 

UNSUED_InstList_SpriteObject_31_MetroidInsides_B4C3A2:
    dw $0010 
    dw UNUSED_SpriteObjectSpritemaps_31_MetroidInsides_0_B4D653 
    dw $0010 
    dw UNUSED_SpriteObjectSpritemaps_31_MetroidInsides_1_B4D67D 
    dw $0006 
    dw UNUSED_SpriteObjectSpritemaps_31_MetroidInsides_2_B4D69D 
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_31_MetroidInsides_3_B4D6C7 
    dw $0010 
    dw UNUSED_SpriteObjectSpritemaps_31_MetroidInsides_1_B4D67D 
    dw Instruction_SpriteObject_GotoParameter 
    dw UNSUED_InstList_SpriteObject_31_MetroidInsides_B4C3A2 

InstList_SpriteObject_32_MetroidElectricity:
    dw $0002 
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_0 
    dw $0003 
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_1 
    dw $0002 
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_2 
    dw $0001 
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_0 
    dw $0003 
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_2 
    dw $0004 
    dw SpriteObject_DrawInst_Empty 
    dw $0004 
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_3 
    dw $0005 
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_4 
    dw $0002 
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_5 
    dw $0001 
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_4 
    dw $0004 
    dw SpriteObject_DrawInst_Empty 
    dw $0002 
    dw SpriteObjectSpritemaps_32_MetroidElectricity_C 
    dw $0003 
    dw SpriteObjectSpritemaps_32_MetroidElectricity_D 
    dw $0004 
    dw SpriteObjectSpritemaps_32_MetroidElectricity_E 
    dw $0007 
    dw SpriteObject_DrawInst_Empty 
    dw $0003 
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_9 
    dw $0002 
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_A 
    dw $0001 
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_B 
    dw $0002 
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_A 
    dw $0003 
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_B 
    dw $0004 
    dw SpriteObject_DrawInst_Empty 
    dw $0004 
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_F 
    dw $0002 
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_10 
    dw $0002 
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_11 
    dw $0003 
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_F 
    dw $0001 
    dw SpriteObject_DrawInst_Empty 
    dw $0004 
    dw SpriteObjectSpritemaps_32_MetroidElectricity_12 
    dw $0003 
    dw SpriteObjectSpritemaps_32_MetroidElectricity_13 
    dw $0003 
    dw SpriteObjectSpritemaps_32_MetroidElectricity_14 
    dw $0002 
    dw SpriteObjectSpritemaps_32_MetroidElectricity_13 
    dw $0007 
    dw SpriteObject_DrawInst_Empty 

UNUSED_InstList_SpriteObject_33_B4C436:
    dw $0002 
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_6 
    dw $0003 
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_7 
    dw $0004 
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_8 
    dw $0002 
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_6 
    dw $0001 
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_8 
    dw $0003 
    dw SpriteObject_DrawInst_Empty 
    dw $0002 
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_15 
    dw $0003 
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_16 
    dw $0004 
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_17 
    dw $0001 
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_15 
    dw $0003 
    dw SpriteObject_DrawInst_Empty 
    dw $0003 
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_6 
    dw $0004 
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_8 
    dw $0020 
    dw SpriteObject_DrawInst_Empty 
    dw $0002 
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_0 
    dw $0001 
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_1 
    dw $0002 
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_2 
    dw $0001 
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_0 
    dw $0004 
    dw SpriteObject_DrawInst_Empty 
    dw $0003 
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_F 
    dw $0004 
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_10 
    dw $0005 
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_11 
    dw $0004 
    dw SpriteObject_DrawInst_Empty 
    dw $0002 
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_9 
    dw $0001 
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_A 
    dw $0003 
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_B 
    dw $0001 
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_9 
    dw $0006 
    dw SpriteObject_DrawInst_Empty 
    dw $0003 
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_3 
    dw $0004 
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_4 
    dw $0002 
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_5 
    dw Instruction_SpriteObject_GotoParameter 
    dw UNUSED_InstList_SpriteObject_33_B4C436 

InstList_SpriteObject_34_MetroidShell:
    dw $0001 
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_0 
    dw $0001 
    dw SpriteObject_DrawInst_Empty 
    dw $0001 
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_0 
    dw $0001 
    dw SpriteObject_DrawInst_Empty 
    dw $0001 
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_0 
    dw $0001 
    dw SpriteObject_DrawInst_Empty 
    dw $0001 
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_0 
    dw $0001 
    dw SpriteObject_DrawInst_Empty 
    dw $0001 
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_0 
    dw $0001 
    dw SpriteObject_DrawInst_Empty 
    dw $0001 
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_0 
    dw $0001 
    dw SpriteObject_DrawInst_Empty 
    dw $0001 
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_0 
    dw $0001 
    dw SpriteObject_DrawInst_Empty 
    dw $0001 
    dw SpriteObjectSpritemaps_34_36_MetroidShell_1 
    dw $0001 
    dw SpriteObject_DrawInst_Empty 
    dw $0001 
    dw SpriteObjectSpritemaps_34_36_MetroidShell_1 
    dw $0001 
    dw SpriteObject_DrawInst_Empty 
    dw $0001 
    dw SpriteObjectSpritemaps_34_36_MetroidShell_1 
    dw $0001 
    dw SpriteObject_DrawInst_Empty 
    dw $0001 
    dw SpriteObjectSpritemaps_34_36_MetroidShell_1 
    dw $0001 
    dw SpriteObject_DrawInst_Empty 
    dw $0001 
    dw SpriteObjectSpritemaps_34_36_MetroidShell_1 
    dw $0001 
    dw SpriteObject_DrawInst_Empty 
    dw $0001 
    dw SpriteObjectSpritemaps_34_36_MetroidShell_1 
    dw $0001 
    dw SpriteObject_DrawInst_Empty 
    dw $0001 
    dw SpriteObjectSpritemaps_34_36_MetroidShell_1 
    dw $0001 
    dw SpriteObject_DrawInst_Empty 
    dw $0001 
    dw SpriteObjectSpritemaps_34_36_MetroidShell_1 
    dw $0001 
    dw SpriteObject_DrawInst_Empty 
    dw $0001 
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_0 
    dw $0001 
    dw SpriteObject_DrawInst_Empty 

UNUSED_InstList_SpriteObject_35_B4C536:
    dw $0001 
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_0 
    dw $0001 
    dw SpriteObject_DrawInst_Empty 
    dw $0001 
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_0 
    dw $0001 
    dw SpriteObject_DrawInst_Empty 
    dw $0001 
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_0 
    dw $0001 
    dw SpriteObject_DrawInst_Empty 
    dw $0001 
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_0 
    dw $0001 
    dw SpriteObject_DrawInst_Empty 
    dw $0001 
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_0 
    dw $0001 
    dw SpriteObject_DrawInst_Empty 
    dw $0001 
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_0 
    dw $0001 
    dw SpriteObject_DrawInst_Empty 
    dw $0001 
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_2 
    dw $0001 
    dw SpriteObject_DrawInst_Empty 
    dw $0001 
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_2 
    dw $0001 
    dw SpriteObject_DrawInst_Empty 
    dw $0001 
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_2 
    dw $0001 
    dw SpriteObject_DrawInst_Empty 
    dw $0001 
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_2 
    dw $0001 
    dw SpriteObject_DrawInst_Empty 
    dw $0001 
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_2 
    dw $0001 
    dw SpriteObject_DrawInst_Empty 
    dw $0001 
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_2 
    dw $0001 
    dw SpriteObject_DrawInst_Empty 
    dw $0001 
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_2 
    dw $0001 
    dw SpriteObject_DrawInst_Empty 
    dw $0001 
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_2 
    dw $0001 
    dw SpriteObject_DrawInst_Empty 
    dw $0001 
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_2 
    dw $0001 
    dw SpriteObject_DrawInst_Empty 
    dw Instruction_SpriteObject_GotoParameter 
    dw UNUSED_InstList_SpriteObject_35_B4C536 

UNUSED_InstList_SpriteObject_36_B4C5B2:
    dw $0010 
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_0 
    dw $0010 
    dw SpriteObjectSpritemaps_34_36_MetroidShell_1 
    dw $0010 
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_0 
    dw $0010 
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_2 
    dw Instruction_SpriteObject_GotoParameter 
    dw UNUSED_InstList_SpriteObject_36_B4C5B2 

InstList_SpriteObject_37_EnemyShot:
    dw $0002 
    dw SpriteObjectSpritemaps_37_EnemyShot_0 
    dw $0002 
    dw SpriteObjectSpritemaps_37_EnemyShot_1 
    dw $0002 
    dw SpriteObjectSpritemaps_37_EnemyShot_2 
    dw $0002 
    dw SpriteObjectSpritemaps_37_EnemyShot_3 
    dw Instruction_SpriteObject_Delete 

InstList_SpriteObject_38_YappingMawBaseFacingDown:
    dw $0001 
    dw SpriteObjectSpritemaps_38_YappingMawBaseFacingDown 
    dw Instruction_SpriteObject_GoBack4Bytes 

InstList_SpriteObject_39_YappingMawBaseFacingUp:
    dw $0001 
    dw SpriteObjectSpritemaps_39_YappingMawBaseFacingUp 
    dw Instruction_SpriteObject_GoBack4Bytes 

UNUSED_InstList_SpriteObject_3A_B4C5E4:
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_3A_0_B4D8BD 
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_3A_1_B4D905 
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_3A_2_B4D957 
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_3A_3_B4D9A9 
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_3A_4_B4D9FB 
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_3A_5_B4DA48 
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_3A_6_B4DA90 
    dw $000A 
    dw UNUSED_SpriteObjectSpritemaps_3A_7_B4DAD8 
    dw Instruction_SpriteObject_GotoParameter 
    dw UNUSED_InstList_SpriteObject_3A_B4C5E4 

InstList_SpriteObject_3B_EvirFacingLeft:
    dw $000A 
    dw SpriteObjectSpritemaps_3B_EvirFacingLeft_0 
    dw $000A 
    dw SpriteObjectSpritemaps_3B_EvirFacingLeft_1 
    dw $000A 
    dw SpriteObjectSpritemaps_3B_EvirFacingLeft_2 
    dw $000A 
    dw SpriteObjectSpritemaps_3B_EvirFacingLeft_3 
    dw Instruction_SpriteObject_GotoParameter 
    dw InstList_SpriteObject_3B_EvirFacingLeft 

InstList_SpriteObject_3C_EvirFacingRight:
    dw $000A 
    dw SpriteObjectSpritemaps_3C_EvirFacingRight_0 
    dw $000A 
    dw SpriteObjectSpritemaps_3C_EvirFacingRight_1 
    dw $000A 
    dw SpriteObjectSpritemaps_3C_EvirFacingRight_2 
    dw $000A 
    dw SpriteObjectSpritemaps_3C_EvirFacingRight_3 
    dw Instruction_SpriteObject_GotoParameter 
    dw InstList_SpriteObject_3C_EvirFacingRight 

UNUSED_SpriteObjectSpritemaps_1E_0_B4C630:
    dw $0001,$01FC 
    db $FC 
    dw $0100 

UNUSED_SpriteObjectSpritemaps_1E_1_B4C637:
    dw $0001,$01FC 
    db $FC 
    dw $0101 

UNUSED_SpriteObjectSpritemaps_1E_2_B4C63E:
    dw $0001,$01FC 
    db $FC 
    dw $0102 

UNUSED_SpriteObjectSpritemaps_1F_0_B4C645:
    dw $0001,$01FC 
    db $FC 
    dw $0103 

UNUSED_SpriteObjectSpritemaps_1F_1_B4C645:
    dw $0001,$01FC 
    db $FC 
    dw $0104 

UNUSED_SpriteObjectSpritemaps_1F_2_B4C653:
    dw $0001,$01FC 
    db $FC 
    dw $0105 

UNUSED_SpriteObjectSpritemaps_20_0_B4C65A:
    dw $0001,$01FC 
    db $FC 
    dw $0106 

UNUSED_SpriteObjectSpritemaps_20_1_B4C661:
    dw $0001,$01FC 
    db $FC 
    dw $0107 

UNUSED_SpriteObjectSpritemaps_20_2_B4C668:
    dw $0001,$01FC 
    db $FC 
    dw $0108 

UNUSED_SpriteObjectSpritemaps_21_0_B4C66F:
    dw $0001,$01FC 
    db $FC 
    dw $8103 

UNUSED_SpriteObjectSpritemaps_21_1_B4C676:
    dw $0001,$01FC 
    db $FC 
    dw $8104 

UNUSED_SpriteObjectSpritemaps_21_2_B4C67D:
    dw $0001,$01FC 
    db $FC 
    dw $8105 

UNUSED_SpriteObjectSpritemaps_22_0_B4C684:
    dw $0001,$01FC 
    db $FC 
    dw $8100 

UNUSED_SpriteObjectSpritemaps_22_1_B4C68B:
    dw $0001,$01FC 
    db $FC 
    dw $8101 

UNUSED_SpriteObjectSpritemaps_22_2_B4C692:
    dw $0001,$01FC 
    db $FC 
    dw $8102 

UNUSED_SpriteObjectSpritemaps_23_0_B4C699:
    dw $0001,$01FC 
    db $FC 
    dw $C103 

UNUSED_SpriteObjectSpritemaps_23_1_B4C6A0:
    dw $0001,$01FC 
    db $FC 
    dw $C104 

UNUSED_SpriteObjectSpritemaps_23_2_B4C6A7:
    dw $0001,$01FC 
    db $FC 
    dw $C105 

UNUSED_SpriteObjectSpritemaps_24_0_B4C6AE:
    dw $0001,$01FC 
    db $FC 
    dw $4106 

UNUSED_SpriteObjectSpritemaps_24_1_B4C6B5:
    dw $0001,$01FC 
    db $FC 
    dw $4107 

UNUSED_SpriteObjectSpritemaps_24_2_B4C6BC:
    dw $0001,$01FC 
    db $FC 
    dw $4108 

UNUSED_SpriteObjectSpritemaps_25_0_B4C6C3:
    dw $0001,$01FC 
    db $FC 
    dw $4103 

UNUSED_SpriteObjectSpritemaps_25_1_B4C6CA:
    dw $0001,$01FC 
    db $FC 
    dw $4104 

UNUSED_SpriteObjectSpritemaps_25_2_B4C6D1:
    dw $0001,$01FC 
    db $FC 
    dw $4105 

UNUSED_SpriteObjectSpritemaps_11_RockParticles_0_B4C6D8:
    dw $0004,$0000 
    db $F8 
    dw $7A2B,$0000 
    db $00 
    dw $7A2B,$01F8 
    db $00 
    dw $3A2B,$01F8 
    db $F8 
    dw $3A2B 

UNUSED_SpriteObjectSpritemaps_11_RockParticles_1_B4C6EE:
    dw $0004,$0002 
    db $F3 
    dw $7A2B,$0001 
    db $FF 
    dw $7A2B,$01F7 
    db $FF 
    dw $3A2B,$01F6 
    db $F3 
    dw $3A2B 

UNUSED_SpriteObjectSpritemaps_11_RockParticles_2_B4C704:
    dw $0004,$0005 
    db $EE 
    dw $7A2B,$0003 
    db $FD 
    dw $7A2B,$01F5 
    db $FD 
    dw $3A2B,$01F3 
    db $EE 
    dw $3A2B 

UNUSED_SpriteObjectSpritemaps_11_RockParticles_3_B4C71A:
    dw $0004,$0007 
    db $EC 
    dw $7A2B,$0005 
    db $FB 
    dw $7A2B,$01F3 
    db $FB 
    dw $3A2B,$01F1 
    db $EC 
    dw $3A2B 

UNUSED_SpriteObjectSpritemaps_11_RockParticles_4_B4C730:
    dw $0004,$0009 
    db $EA 
    dw $7A2B,$0007 
    db $FA 
    dw $7A2B,$01F1 
    db $FA 
    dw $3A2B,$01EF 
    db $EA 
    dw $3A2B 

UNUSED_SpriteObjectSpritemaps_11_RockParticles_5_B4C746:
    dw $0004,$000A 
    db $EA 
    dw $7A2B,$0008 
    db $F9 
    dw $7A2B,$01F0 
    db $F9 
    dw $3A2B,$01EE 
    db $EA 
    dw $3A2B 

UNUSED_SpriteObjectSpritemaps_11_RockParticles_6_B4C75C:
    dw $0004,$000C 
    db $EB 
    dw $7A2A,$0009 
    db $FA 
    dw $7A2A,$01EF 
    db $FA 
    dw $3A2A,$01EC 
    db $EB 
    dw $3A2A 

UNUSED_SpriteObjectSpritemaps_11_RockParticles_7_B4C772:
    dw $0004,$000E 
    db $EC 
    dw $7A2A,$000A 
    db $FC 
    dw $7A2A,$01EE 
    db $FC 
    dw $3A2A,$01EA 
    db $EC 
    dw $3A2A 

UNUSED_SpriteObjectSpritemaps_11_RockParticles_8_B4C788:
    dw $0004,$0010 
    db $ED 
    dw $7A29,$000B 
    db $FE 
    dw $7A29,$01ED 
    db $FE 
    dw $3A29,$01E8 
    db $ED 
    dw $3A29 

UNUSED_SpriteObjectSpritemaps_11_RockParticles_9_B4C79E:
    dw $0004,$0012 
    db $EE 
    dw $7A29,$000C 
    db $00 
    dw $7A29,$01EC 
    db $00 
    dw $3A29,$01E6 
    db $EE 
    dw $3A29 

UNUSED_SpriteObjectSpritemaps_11_RockParticles_A_B4C7B4:
    dw $0004,$0013 
    db $F0 
    dw $7A28,$000D 
    db $02 
    dw $7A28,$01E5 
    db $F0 
    dw $3A28,$01EB 
    db $02 
    dw $3A28 

UNUSED_SpriteObjectSpritemaps_11_RockParticles_B_B4C7CA:
    dw $0004,$0014 
    db $F2 
    dw $7A28,$000E 
    db $04 
    dw $7A28,$01E4 
    db $F2 
    dw $3A28,$01EA 
    db $04 
    dw $3A28 

UNUSED_SpriteObjectSpritemaps_11_RockParticles_C_B4C7E0:
    dw $0004,$0015 
    db $F5 
    dw $7A28,$000F 
    db $07 
    dw $7A28,$01E3 
    db $F5 
    dw $3A28,$01E9 
    db $07 
    dw $3A28 

UNUSED_SpriteObjectSpritemaps_11_RockParticles_D_B4C7F6:
    dw $0004,$0016 
    db $F9 
    dw $7A28,$0010 
    db $0B 
    dw $7A28,$01E2 
    db $F9 
    dw $3A28,$01E8 
    db $0B 
    dw $3A28 

UNUSED_SpriteObjectSpritemaps_11_RockParticles_E_B4C80C:
    dw $0004,$0017 
    db $03 
    dw $7A28,$0011 
    db $11 
    dw $7A28,$01E1 
    db $03 
    dw $3A28,$01E7 
    db $11 
    dw $3A28 

UNUSED_SpriteObjectSpritemaps_11_RockParticles_F_B4C822:
    dw $0004,$0018 
    db $0A 
    dw $7A28,$0012 
    db $18 
    dw $7A28,$01E0 
    db $0A 
    dw $3A28,$01E6 
    db $18 
    dw $3A28 

SpriteObjectSpritemaps_12_15_BigDustCloud_0:
    dw $0001,$01F7 
    db $F7 
    dw $3A48 

SpriteObjectSpritemaps_12_15_BigDustCloud_1:
    dw $0002,$0001 
    db $01 
    dw $3A48,$81F3 
    db $F3 
    dw $3A7C 

SpriteObjectSpritemaps_12_15_BigDustCloud_2:
    dw $0003,$81FD 
    db $FD 
    dw $3A7C,$01F7 
    db $01 
    dw $3A48,$81F3 
    db $F3 
    dw $3A7E 

SpriteObjectSpritemaps_12_15_BigDustCloud_3:
    dw $0004,$0001 
    db $F7 
    dw $3A48,$81FD 
    db $FD 
    dw $3A7E,$81F3 
    db $FD 
    dw $3A7C,$81F3 
    db $F3 
    dw $3A9A 

SpriteObjectSpritemaps_13_14_15_BigDustCloud_4:
    dw $0004,$81FD 
    db $F3 
    dw $3A7C,$81FD 
    db $FD 
    dw $3A9A,$81F3 
    db $FD 
    dw $3A7E,$81F3 
    db $F3 
    dw $3A9C 

SpriteObjectSpritemaps_13_14_15_BigDustCloud_5:
    dw $0003,$81FD 
    db $F3 
    dw $3A7E,$81FD 
    db $FD 
    dw $3A9C,$81F3 
    db $FD 
    dw $3A9A 

SpriteObjectSpritemaps_13_14_15_BigDustCloud_6:
    dw $0002,$81FD 
    db $F3 
    dw $3A9A,$81F3 
    db $FD 
    dw $3A9C 

SpriteObjectSpritemaps_13_14_15_BigDustCloud_7:
    dw $0001,$81FD 
    db $F3 
    dw $3A9C 

UNUSED_SpriteObjectSpritemaps_13_14_16_DustCloud_Beam_B4C8AC:
    dw $0001,$01FC 
    db $FC 
    dw $3A6B 

UNUSED_SpriteObjectSpritemaps_13_14_16_DustCloud_Beam_B4C8B3:
    dw $0001,$01FC 
    db $FC 
    dw $3A6C 

UNUSED_SpriteObjectSpritemaps_14_16_DustCloud_Beam_B4C8BA:
    dw $0002,$01F8 
    db $FC 
    dw $3A6B,$0000 
    db $FC 
    dw $3A6B 

UNUSED_SpriteObjectSpritemaps_16_DustCloud_Beam_B4C8C6:
    dw $0002,$01F8 
    db $FC 
    dw $3A6C,$0000 
    db $FC 
    dw $3A6C 

UNUSED_SpriteObjectSpritemaps_16_DustCloud_Beam_B4C8D2:
    dw $0003,$01F4 
    db $FC 
    dw $3A6C,$0004 
    db $FC 
    dw $3A6C,$01FC 
    db $FC 
    dw $3A6C 

UNUSED_SpriteObjectSpritemaps_16_DustCloud_Beam_B4C8E2:
    dw $0003,$0004 
    db $FC 
    dw $3A6B,$01F4 
    db $FC 
    dw $3A6B,$01FC 
    db $FC 
    dw $3A6B 

UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4:
    dw $0004,$0008 
    db $FC 
    dw $3A6C,$0000 
    db $FC 
    dw $3A6C,$01F8 
    db $FC 
    dw $3A6C,$01F0 
    db $FC 
    dw $3A6C 

UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A:
    dw $0004,$0008 
    db $FC 
    dw $3A6B,$0000 
    db $FC 
    dw $3A6B,$01F8 
    db $FC 
    dw $3A6B,$01F0 
    db $FC 
    dw $3A6B 

SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_0:
    dw $0001,$01FC 
    db $FC 
    dw $3A25 

SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_1:
    dw $0003,$0000 
    db $F8 
    dw $3A25,$01FA 
    db $F6 
    dw $3A25,$01FC 
    db $FB 
    dw $3A25 

SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_2:
    dw $0003,$0001 
    db $F7 
    dw $3A25,$01F9 
    db $F4 
    dw $3A25,$01FB 
    db $FA 
    dw $3A25 

SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_3:
    dw $0003,$0001 
    db $F5 
    dw $3A43,$01FC 
    db $F8 
    dw $3A43,$01FA 
    db $F1 
    dw $3A43 

SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_4:
    dw $0003,$0001 
    db $F3 
    dw $3A43,$01FC 
    db $F5 
    dw $3A43,$01FA 
    db $EE 
    dw $3A43 

SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_5:
    dw $0003,$0000 
    db $F0 
    dw $3A40,$01FC 
    db $F4 
    dw $3A40,$01FA 
    db $ED 
    dw $3A40 

SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_6:
    dw $0003,$0000 
    db $EE 
    dw $3A40,$01FC 
    db $F2 
    dw $3A40,$01FA 
    db $EC 
    dw $3A40 

SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_7:
    dw $0002,$0000 
    db $EC 
    dw $3A40,$01FC 
    db $F0 
    dw $3A40 

SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_8:
    dw $0001,$01FC 
    db $EE 
    dw $3A40 

UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_0_B4C9A0:
    dw $0004,$0008 
    db $E0 
    dw $3A6F,$0000 
    db $E0 
    dw $3A6F,$01F8 
    db $E0 
    dw $3A6F,$01F0 
    db $E0 
    dw $3A6F 

UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_1_B4C9B6:
    dw $0004,$0008 
    db $E8 
    dw $3A6F,$0000 
    db $E8 
    dw $3A6F,$01F8 
    db $E8 
    dw $3A6F,$01F0 
    db $E8 
    dw $3A6F 

UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_2_B4C9CC:
    dw $0004,$0008 
    db $F0 
    dw $3A6F,$0000 
    db $F0 
    dw $3A6F,$01F8 
    db $F0 
    dw $3A6F,$01F0 
    db $F0 
    dw $3A6F 

UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_3_B4C9E2:
    dw $0004,$0008 
    db $F8 
    dw $3A6F,$0000 
    db $F8 
    dw $3A6F,$01F8 
    db $F8 
    dw $3A6F,$01F0 
    db $F8 
    dw $3A6F 

UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_4_B4C9F8:
    dw $0004,$0008 
    db $00 
    dw $3A6F,$0000 
    db $00 
    dw $3A6F,$01F8 
    db $00 
    dw $3A6F,$01F0 
    db $00 
    dw $3A6F 

UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_5_B4CA0E:
    dw $0004,$0008 
    db $08 
    dw $3A6F,$0000 
    db $08 
    dw $3A6F,$01F8 
    db $08 
    dw $3A6F,$01F0 
    db $08 
    dw $3A6F 

UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_6_B4CA24:
    dw $0004,$0008 
    db $10 
    dw $3A6F,$0000 
    db $10 
    dw $3A6F,$01F8 
    db $10 
    dw $3A6F,$01F0 
    db $10 
    dw $3A6F 

UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_7_B4CA3A:
    dw $0004,$0008 
    db $18 
    dw $3A6F,$0000 
    db $18 
    dw $3A6F,$01F8 
    db $18 
    dw $3A6F,$01F0 
    db $18 
    dw $3A6F 

UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_0_B4CA50:
    dw $0002,$0000 
    db $FC 
    dw $3ABF,$01F8 
    db $FC 
    dw $3ABE 

UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_1_B4CA5C:
    dw $0001,$81F8 
    db $F8 
    dw $3ABE 

UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_2_B4CA63:
    dw $0002,$81F8 
    db $FC 
    dw $3ABE,$81F8 
    db $F4 
    dw $3ABE 

UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_3_B4CA6F:
    dw $0002,$81F8 
    db $00 
    dw $3ABE,$81F8 
    db $F0 
    dw $3ABE 

UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_4_B4CA7B:
    dw $0003,$81F8 
    db $04 
    dw $3ABE,$81F8 
    db $F8 
    dw $3ABE,$81F8 
    db $EC 
    dw $3ABE 

UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_5_B4CA8C:
    dw $0003,$81F8 
    db $08 
    dw $3ABE,$81F8 
    db $F8 
    dw $3ABE,$81F8 
    db $E8 
    dw $3ABE 

UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_6_B4CA9D:
    dw $0004,$81F8 
    db $0C 
    dw $3ABE,$81F8 
    db $00 
    dw $3ABE,$81F8 
    db $F0 
    dw $3ABE,$81F8 
    db $E4 
    dw $3ABE 

UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_7_B4CAB3:
    dw $0004,$81F8 
    db $10 
    dw $3ABE,$81F8 
    db $00 
    dw $3ABE,$81F8 
    db $F0 
    dw $3ABE,$81F8 
    db $E0 
    dw $3ABE 

UNUSED_SpriteObjectSpritemaps_0_BeamCharge_0_B4CAC9:
    dw $0001,$01FC 
    db $FC 
    dw $3C53 

UNUSED_SpriteObjectSpritemaps_0_BeamCharge_1_B4CAD0:
    dw $0001,$01FC 
    db $FC 
    dw $3C52 

UNUSED_SpriteObjectSpritemaps_0_BeamCharge_2_B4CAD7:
    dw $0001,$01FC 
    db $FC 
    dw $3C51 

UNUSED_SpriteObjectSpritemaps_0_BeamCharge_3_B4CADE:
    dw $0004,$01F8 
    db $00 
    dw $BC50,$0000 
    db $00 
    dw $FC50,$0000 
    db $F8 
    dw $7C50,$01F8 
    db $F8 
    dw $3C50 

UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_0_B4CAF4:
    dw $0003,$0000 
    db $0C 
    dw $3A5B,$0008 
    db $EC 
    dw $3A5B,$01F0 
    db $F4 
    dw $3A5B 

UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_1_B4CB05:
    dw $0003,$01FD 
    db $0A 
    dw $3A5C,$0006 
    db $EE 
    dw $3A5C,$01F2 
    db $F6 
    dw $3A5C 

UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_2_B4CB16:
    dw $0003,$01FC 
    db $08 
    dw $3A5C,$0004 
    db $F0 
    dw $3A5C,$01F4 
    db $F8 
    dw $3A5C 

UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_3_B4CB27:
    dw $0003,$0002 
    db $F2 
    dw $3A5D,$01FB 
    db $06 
    dw $3A5D,$01F6 
    db $FA 
    dw $3A5D 

UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_4_B4CB38:
    dw $0003,$01FB 
    db $04 
    dw $3A5D,$01F8 
    db $FB 
    dw $3A5D,$0000 
    db $F4 
    dw $3A5D 

UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_5_B4CB49:
    dw $0003,$01FB 
    db $02 
    dw $3A5D,$01FA 
    db $FA 
    dw $3A5D,$0000 
    db $F6 
    dw $3A5D 

UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_0_B4CB5A:
    dw $0003,$0000 
    db $EC 
    dw $BA5B,$0008 
    db $0C 
    dw $BA5B,$01F0 
    db $04 
    dw $BA5B 

UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_1_B4CB6B:
    dw $0003,$01FE 
    db $EE 
    dw $BA5C,$0006 
    db $0A 
    dw $BA5C,$01F2 
    db $02 
    dw $BA5C 

UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_2_B4CB7C:
    dw $0003,$0004 
    db $08 
    dw $BA5C,$01F4 
    db $00 
    dw $BA5C,$01FD 
    db $F0 
    dw $BA5C 

UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_3_B4CB8D:
    dw $0003,$0002 
    db $06 
    dw $BA5D,$01FC 
    db $F2 
    dw $BA5D,$01F6 
    db $FE 
    dw $BA5D 

UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_4_B4CB9E:
    dw $0003,$01FC 
    db $F4 
    dw $BA5D,$01F8 
    db $FC 
    dw $BA5D,$0000 
    db $04 
    dw $BA5D 

UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_5_B4CBAF:
    dw $0003,$01FC 
    db $F6 
    dw $BA5D,$01FA 
    db $FD 
    dw $BA5D,$0000 
    db $02 
    dw $BA5D 

SpriteObjectSpritemaps_3_SmallExplosion_0:
    dw $0001,$01FC 
    db $FC 
    dw $3A5F 

SpriteObjectSpritemaps_3_SmallExplosion_1:
    dw $0004,$0000 
    db $00 
    dw $FA8A,$01F8 
    db $00 
    dw $BA8A,$0000 
    db $F8 
    dw $7A8A,$01F8 
    db $F8 
    dw $3A8A 

SpriteObjectSpritemaps_3_SmallExplosion_2:
    dw $0004,$8000 
    db $00 
    dw $FA90,$81F0 
    db $00 
    dw $BA90,$8000 
    db $F0 
    dw $7A90,$81F0 
    db $F0 
    dw $3A90 

SpriteObjectSpritemaps_3_SmallExplosion_3:
    dw $0004,$8000 
    db $00 
    dw $FA92,$81F0 
    db $00 
    dw $BA92,$8000 
    db $F0 
    dw $7A92,$81F0 
    db $F0 
    dw $3A92 

SpriteObjectSpritemaps_3_SmallExplosion_4:
    dw $0004,$8000 
    db $00 
    dw $FA94,$81F0 
    db $00 
    dw $BA94,$8000 
    db $F0 
    dw $7A94,$81F0 
    db $F0 
    dw $3A94 

SpriteObjectSpritemaps_3_SmallExplosion_5:
    dw $0004,$8000 
    db $00 
    dw $FA96,$81F0 
    db $00 
    dw $BA96,$8000 
    db $F0 
    dw $7A96,$81F0 
    db $F0 
    dw $3A96 

UNSUED_SpriteObjectSpritemaps_4_BombExplosion_0_B4CC35:
    dw $0004,$0000 
    db $00 
    dw $FA8B,$01F8 
    db $00 
    dw $BA8B,$0000 
    db $F8 
    dw $7A8B,$01F8 
    db $F8 
    dw $3A8B 

UNSUED_SpriteObjectSpritemaps_4_BombExplosion_1_B4CC4B:
    dw $0004,$0000 
    db $00 
    dw $FA7A,$01F8 
    db $00 
    dw $BA7A,$0000 
    db $F8 
    dw $7A7A,$01F8 
    db $F8 
    dw $3A7A 

UNSUED_SpriteObjectSpritemaps_4_BombExplosion_2_B4CC61:
    dw $0004,$8000 
    db $00 
    dw $FA70,$81F0 
    db $00 
    dw $BA70,$8000 
    db $F0 
    dw $7A70,$81F0 
    db $F0 
    dw $3A70 

UNSUED_SpriteObjectSpritemaps_4_BombExplosion_3_B4CC77:
    dw $0004,$8000 
    db $00 
    dw $FA72,$81F0 
    db $00 
    dw $BA72,$8000 
    db $F0 
    dw $7A72,$81F0 
    db $F0 
    dw $3A72 

UNSUED_SpriteObjectSpritemaps_4_BombExplosion_4_B4CC8D:
    dw $0004,$8000 
    db $00 
    dw $FA74,$81F0 
    db $00 
    dw $BA74,$8000 
    db $F0 
    dw $7A74,$81F0 
    db $F0 
    dw $3A74 

UNSUED_SpriteObjectSpritemaps__B4CCA3:
    dw $0004,$01F8 
    db $00 
    dw $3A5E,$0000 
    db $00 
    dw $3A5E,$0000 
    db $F8 
    dw $3A5E,$01F8 
    db $F8 
    dw $3A5E 

UNSUED_SpriteObjectSpritemaps_5_BeamTrail_0_B4CCB9:
    dw $0001,$01FC 
    db $FC 
    dw $3C38 

UNSUED_SpriteObjectSpritemaps_5_BeamTrail_1_B4CCC0:
    dw $0001,$01FC 
    db $FC 
    dw $3C39 

UNSUED_SpriteObjectSpritemaps_5_BeamTrail_2_B4CCC7:
    dw $0001,$01FC 
    db $FC 
    dw $3C3A 

UNSUED_SpriteObjectSpritemaps_5_BeamTrail_3_B4CCCE:
    dw $0001,$01FC 
    db $FC 
    dw $3C3B 

UNSUED_SpriteObjectSpritemaps_7_PowerBomb_0_B4CCD5:
    dw $0001,$01FC 
    db $FC 
    dw $3A26 

UNSUED_SpriteObjectSpritemaps_7_PowerBomb_1_B4CCDC:
    dw $0001,$01FC 
    db $FC 
    dw $3A27 

UNSUED_SpriteObjectSpritemaps_7_PowerBomb_2_B4CCE3:
    dw $0001,$01FC 
    db $FC 
    dw $3A7B 

UNSUED_SpriteObjectSpritemaps_B4CCEA:
    dw $0001,$01FC 
    db $FC 
    dw $3A5F 

SpriteObjectSpritemaps_6_DudShot_0:
    dw $0001,$01FC 
    db $FC 
    dw $3A53 

SpriteObjectSpritemaps_6_DudShot_1:
    dw $0001,$01FC 
    db $FC 
    dw $3A51 

SpriteObjectSpritemaps_6_DudShot_2:
    dw $0004,$0000 
    db $00 
    dw $FA60,$0000 
    db $F8 
    dw $7A60,$01F8 
    db $00 
    dw $BA60,$01F8 
    db $F8 
    dw $3A60 

SpriteObjectSpritemaps_6_DudShot_3:
    dw $0004,$0000 
    db $00 
    dw $FA61,$0000 
    db $F8 
    dw $7A61,$01F8 
    db $00 
    dw $BA61,$01F8 
    db $F8 
    dw $3A61 

SpriteObjectSpritemaps_6_DudShot_4:
    dw $0004,$0000 
    db $00 
    dw $FA62,$0000 
    db $F8 
    dw $7A62,$01F8 
    db $00 
    dw $BA62,$01F8 
    db $F8 
    dw $3A62 

SpriteObjectSpritemaps_6_DudShot_5:
    dw $0004,$0000 
    db $00 
    dw $FA63,$0000 
    db $F8 
    dw $7A63,$01F8 
    db $00 
    dw $BA63,$01F8 
    db $F8 
    dw $3A63 

UNSUED_SpriteObjectSpritemaps_8_1C_ElevatorPad_0_B4CD57:
    dw $0004,$01F2 
    db $FC 
    dw $7A6C,$0006 
    db $FC 
    dw $7A6C,$0000 
    db $FC 
    dw $7A6C,$01F8 
    db $FC 
    dw $3A6C 

UNSUED_SpriteObjectSpritemaps_8_1C_ElevatorPad_1_B4CD6D:
    dw $0004,$0000 
    db $FC 
    dw $7A6E,$0008 
    db $FC 
    dw $7A6D,$01F8 
    db $FC 
    dw $3A6E,$01F0 
    db $FC 
    dw $3A6D 

UNSUED_SpriteObjectSpritemaps_B4CD83:
    dw $0004,$01F0 
    db $FE 
    dw $3A6F,$0008 
    db $FE 
    dw $3A6F,$0000 
    db $FE 
    dw $3A6F,$01F8 
    db $FE 
    dw $3A6F 

SpriteObjectSpritemaps_9_SmallDustCloud_0:
    dw $0001,$81F8 
    db $F8 
    dw $3A7C 

SpriteObjectSpritemaps_9_SmallDustCloud_1:
    dw $0001,$81F8 
    db $F6 
    dw $3A7E 

SpriteObjectSpritemaps_9_SmallDustCloud_2:
    dw $0001,$81F8 
    db $F4 
    dw $3A9A 

SpriteObjectSpritemaps_9_SmallDustCloud_3:
    dw $0001,$81F8 
    db $F2 
    dw $3A9C 

SpriteObjectSpritemaps_A_PirateLandingDustCloud_0:
    dw $0001,$01FC 
    db $FC 
    dw $3A48 

SpriteObjectSpritemaps_A_PirateLandingDustCloud_1:
    dw $0001,$01FC 
    db $FA 
    dw $3A49 

SpriteObjectSpritemaps_A_PirateLandingDustCloud_2:
    dw $0001,$01FC 
    db $F8 
    dw $3A4A 

SpriteObjectSpritemaps_A_PirateLandingDustCloud_3:
    dw $0001,$01FC 
    db $F6 
    dw $3A4B 

UNSUED_SpriteObjectSpritemaps_B_EyeDoorSweatDrop_0_B4CDD1:
    dw $0001,$01FC 
    db $FC 
    dw $3A2C 

UNSUED_SpriteObjectSpritemaps_B_EyeDoorSweatDrop_1_B4CDD8:
    dw $0001,$01FC 
    db $FC 
    dw $3A2D 

UNSUED_SpriteObjectSpritemaps_B_EyeDoorSweatDrop_2_B4CDDF:
    dw $0001,$01FC 
    db $FC 
    dw $3A2E 

UNSUED_SpriteObjectSpritemaps_B_EyeDoorSweatDrop_3_B4CDE6:
    dw $0001,$01FC 
    db $FC 
    dw $3A2F 

SpriteObjectSpritemaps_C_Smoke_0:
    dw $0001,$81F8 
    db $F6 
    dw $3A76 

SpriteObjectSpritemaps_C_Smoke_1:
    dw $0001,$81F8 
    db $F4 
    dw $3A78 

SpriteObjectSpritemaps_C_Smoke_2:
    dw $0001,$81F8 
    db $F2 
    dw $3A98 

SpriteObjectSpritemaps_C_Smoke_3:
    dw $0001,$81F8 
    db $F0 
    dw $3A9E 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SpriteObjectSpritemaps_B4CE09:
    dw $0001,$01FC 
    db $FC 
    dw $3A25 

UNUSED_SpriteObjectSpritemaps_B4CE10:
    dw $0001,$01FC 
    db $FC 
    dw $3A43 

UNUSED_SpriteObjectSpritemaps_B4CE17:
    dw $0001,$01FC 
    db $FC 
    dw $3A40 
endif ; !FEATURE_KEEP_UNREFERENCED

UNUSED_SpriteObjectSpritemaps_D_SmallEnergyDrop_0_B4CE1E:
    dw $0001,$01FC 
    db $FC 
    dw $3A3E 

UNUSED_SpriteObjectSpritemaps_D_SmallEnergyDrop_1_B4CE25:
    dw $0001,$01FC 
    db $FC 
    dw $3A3D 

UNUSED_SpriteObjectSpritemaps_D_SmallEnergyDrop_2_B4CE2C:
    dw $0001,$01FC 
    db $FC 
    dw $3A41 

UNUSED_SpriteObjectSpritemaps_D_SmallEnergyDrop_3_B4CE33:
    dw $0001,$01FC 
    db $FC 
    dw $3A42 

UNUSED_SpriteObjectSpritemaps_E_BigEnergyDrop_0_B4CE3A:
    dw $0004,$0000 
    db $00 
    dw $FA44,$01F8 
    db $00 
    dw $BA44,$0000 
    db $F8 
    dw $7A44,$01F8 
    db $F8 
    dw $3A44 

UNUSED_SpriteObjectSpritemaps_E_BigEnergyDrop_1_B4CE50:
    dw $0004,$0000 
    db $00 
    dw $FA45,$0000 
    db $F8 
    dw $7A45,$01F8 
    db $00 
    dw $BA45,$01F8 
    db $F8 
    dw $3A45 

UNUSED_SpriteObjectSpritemaps_E_BigEnergyDrop_2_B4CE66:
    dw $0004,$01F8 
    db $00 
    dw $BA46,$0000 
    db $00 
    dw $FA46,$0000 
    db $F8 
    dw $7A46,$01F8 
    db $F8 
    dw $3A46 

UNUSED_SpriteObjectSpritemaps_E_BigEnergyDrop_3_B4CE7C:
    dw $0001,$01FC 
    db $FC 
    dw $3A42 

UNUSED_SpriteObjectSpritemaps_F_Bomb_0_B4CE83:
    dw $0001,$01FC 
    db $FC 
    dw $3A4C 

UNUSED_SpriteObjectSpritemaps_F_Bomb_1_B4CE8A:
    dw $0001,$01FC 
    db $FC 
    dw $3A4D 

UNUSED_SpriteObjectSpritemaps_F_Bomb_2_B4CE91:
    dw $0001,$01FC 
    db $FC 
    dw $3A4E 

UNUSED_SpriteObjectSpritemaps_F_Bomb_3_B4CE98:
    dw $0001,$01FC 
    db $FC 
    dw $3A4F 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SpriteObjectSpritemaps_B4CE9F:
    dw $0002,$01FF 
    db $FC 
    dw $3A55,$01F7 
    db $FC 
    dw $3A54 

UNUSED_SpriteObjectSpritemaps_B4CEAB:
    dw $0003,$01FA 
    db $F5 
    dw $3A56,$0002 
    db $FD 
    dw $3A58,$01FA 
    db $FD 
    dw $3A57 

UNUSED_SpriteObjectSpritemaps_B4CEBC:
    dw $0002,$01FD 
    db $F7 
    dw $3A59,$01FD 
    db $FF 
    dw $3A5A 

UNUSED_SpriteObjectSpritemaps_B4CEC8:
    dw $0003,$01FE 
    db $F5 
    dw $7A56,$01F6 
    db $FD 
    dw $7A58,$01FE 
    db $FD 
    dw $7A57 

UNUSED_SpriteObjectSpritemaps_B4CED9:
    dw $0002,$01F9 
    db $FC 
    dw $7A55,$0001 
    db $FC 
    dw $7A54 

UNUSED_SpriteObjectSpritemaps_B4CEE5:
    dw $0003,$01FE 
    db $03 
    dw $FA56,$01F6 
    db $FB 
    dw $FA58,$01FE 
    db $FB 
    dw $FA57 

UNUSED_SpriteObjectSpritemaps_B4CEF6:
    dw $0002,$01FD 
    db $01 
    dw $BA59,$01FD 
    db $F9 
    dw $BA5A 

UNUSED_SpriteObjectSpritemaps_B4CF02:
    dw $0003,$01FA 
    db $03 
    dw $BA56,$0002 
    db $FB 
    dw $BA58,$01FA 
    db $FB 
    dw $BA57 

UNUSED_SpriteObjectSpritemaps_B4CF13:
    dw $0002,$0000 
    db $FC 
    dw $3A65,$01F8 
    db $FC 
    dw $3A64 

UNUSED_SpriteObjectSpritemaps_B4CF1F:
    dw $0003,$0002 
    db $FE 
    dw $3A68,$01FA 
    db $FE 
    dw $3A67,$01FA 
    db $F6 
    dw $3A66 

UNUSED_SpriteObjectSpritemaps_B4CF30:
    dw $0002,$01FC 
    db $F8 
    dw $3A69,$01FC 
    db $00 
    dw $3A6A 

UNUSED_SpriteObjectSpritemaps_B4CF3C:
    dw $0003,$01F6 
    db $FE 
    dw $7A68,$01FE 
    db $FE 
    dw $7A67,$01FE 
    db $F6 
    dw $7A66 

UNUSED_SpriteObjectSpritemaps_B4CF4D:
    dw $0002,$01F8 
    db $FC 
    dw $7A65,$0000 
    db $FC 
    dw $7A64 

UNUSED_SpriteObjectSpritemaps_B4CF59:
    dw $0003,$01F6 
    db $FA 
    dw $FA68,$01FE 
    db $FA 
    dw $FA67,$01FE 
    db $02 
    dw $FA66 

UNUSED_SpriteObjectSpritemaps_B4CF6A:
    dw $0002,$01FC 
    db $00 
    dw $BA69,$01FC 
    db $F8 
    dw $BA6A 

UNUSED_SpriteObjectSpritemaps_B4CF76:
    dw $0003,$0002 
    db $FA 
    dw $BA68,$01FA 
    db $FA 
    dw $BA67,$01FA 
    db $02 
    dw $BA66 
endif ; !FEATURE_KEEP_UNREFERENCED

UNUSED_SpriteObjectSpritemaps_10_SmallEnergyDrop_0_B4CF87:
    dw $0001,$01FC 
    db $FC 
    dw $3A3C 

UNUSED_SpriteObjectSpritemaps_10_SmallEnergyDrop_1_B4CF8E:
    dw $0001,$01FC 
    db $FC 
    dw $3A3D 

UNUSED_SpriteObjectSpritemaps_10_SmallEnergyDrop_2_B4CF95:
    dw $0001,$01FC 
    db $FC 
    dw $3A3E 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SpriteObjectSpritemaps_B4CF9C:
    dw $0001,$01FC 
    db $FC 
    dw $3A3F 
endif ; !FEATURE_KEEP_UNREFERENCED

SpriteObjectSpritemaps_1D_BigExplosion_0:
    dw $0004,$0000 
    db $00 
    dw $FA8A,$01F8 
    db $00 
    dw $BA8A,$0000 
    db $F8 
    dw $7A8A,$01F8 
    db $F8 
    dw $3A8A 

SpriteObjectSpritemaps_1D_BigExplosion_1:
    dw $0004,$C200 
    db $00 
    dw $FA90,$C200 
    db $F0 
    dw $7A90,$C3F0 
    db $00 
    dw $BA90,$C3F0 
    db $F0 
    dw $3A90 

SpriteObjectSpritemaps_1D_BigExplosion_2:
    dw $0004,$C200 
    db $00 
    dw $FA92,$C3F0 
    db $00 
    dw $BA92,$C200 
    db $F0 
    dw $7A92,$C3F0 
    db $F0 
    dw $3A92 

SpriteObjectSpritemaps_1D_BigExplosion_3:
    dw $000C,$0010 
    db $00 
    dw $FAC2,$0010 
    db $F8 
    dw $7AC2,$0000 
    db $10 
    dw $FAB2,$01F8 
    db $10 
    dw $BAB2,$01E8 
    db $00 
    dw $BAC2,$01E8 
    db $F8 
    dw $3AC2,$0000 
    db $E8 
    dw $7AB2,$01F8 
    db $E8 
    dw $3AB2,$C200 
    db $00 
    dw $FAB0,$C200 
    db $F0 
    dw $7AB0,$C3F0 
    db $00 
    dw $BAB0,$C3F0 
    db $F0 
    dw $3AB0 

SpriteObjectSpritemaps_1D_BigExplosion_4:
    dw $0008,$C208 
    db $00 
    dw $FAB5,$C200 
    db $08 
    dw $FAB3,$C3E8 
    db $00 
    dw $BAB5,$C3F0 
    db $08 
    dw $BAB3,$C208 
    db $F0 
    dw $7AB5,$C200 
    db $E8 
    dw $7AB3,$C3E8 
    db $F0 
    dw $3AB5,$C3F0 
    db $E8 
    dw $3AB3 

SpriteObjectSpritemaps_1D_BigExplosion_5:
    dw $000C,$0000 
    db $10 
    dw $FABB,$01F8 
    db $10 
    dw $BABB,$0000 
    db $E8 
    dw $7ABB,$01F8 
    db $E8 
    dw $3ABB,$0010 
    db $00 
    dw $FAB7,$0010 
    db $F8 
    dw $7AB7,$01E8 
    db $00 
    dw $BAB7,$01E8 
    db $F8 
    dw $3AB7,$C208 
    db $08 
    dw $FAB8,$C3E8 
    db $08 
    dw $BAB8,$C208 
    db $E8 
    dw $7AB8,$C3E8 
    db $E8 
    dw $3AB8 

UNUSED_SpriteObjectSpritemaps_26_0_B4D08B:
    dw $0009,$81FE 
    db $FB 
    dw $20D6,$81EE 
    db $FB 
    dw $20D4,$81FE 
    db $EB 
    dw $20D2,$81EE 
    db $EB 
    dw $20D0,$8002 
    db $FB 
    dw $20D8,$8001 
    db $01 
    dw $20D8,$81FF 
    db $07 
    dw $20DC,$01FE 
    db $10 
    dw $20F6,$01FE 
    db $08 
    dw $20F5 

UNUSED_SpriteObjectSpritemaps_26_1_B4D0BA:
    dw $0009,$81FE 
    db $FB 
    dw $20D6,$81EE 
    db $FB 
    dw $20D4,$81FE 
    db $EB 
    dw $20D2,$81EE 
    db $EB 
    dw $20D0,$8002 
    db $FC 
    dw $20D8,$8001 
    db $02 
    dw $20D8,$81FF 
    db $07 
    dw $20DC,$01FE 
    db $10 
    dw $20F6,$01FE 
    db $08 
    dw $20F5 

UNUSED_SpriteObjectSpritemaps_26_2_B4D0E9:
    dw $0009,$81FE 
    db $FB 
    dw $20D6,$81EE 
    db $FB 
    dw $20D4,$81FE 
    db $EB 
    dw $20D2,$81EE 
    db $EB 
    dw $20D0,$8002 
    db $FD 
    dw $20D8,$8001 
    db $03 
    dw $20D8,$81FF 
    db $08 
    dw $20DC,$01FE 
    db $11 
    dw $20F6,$01FE 
    db $09 
    dw $20F5 

UNUSED_SpriteObjectSpritemaps_26_3_B4D118:
    dw $0009,$81FE 
    db $FB 
    dw $20D6,$81EE 
    db $FB 
    dw $20D4,$81FE 
    db $EB 
    dw $20D2,$81EE 
    db $EB 
    dw $20D0,$8002 
    db $FD 
    dw $20D8,$8001 
    db $04 
    dw $20D8,$81FF 
    db $09 
    dw $20DC,$01FE 
    db $12 
    dw $20F6,$01FE 
    db $0A 
    dw $20F5 

UNUSED_SpriteObjectSpritemaps_26_4_B4D147:
    dw $0009,$81FE 
    db $FB 
    dw $20D6,$81EE 
    db $FB 
    dw $20D4,$81FE 
    db $EB 
    dw $20D2,$81EE 
    db $EB 
    dw $20D0,$8002 
    db $FD 
    dw $20D8,$8001 
    db $04 
    dw $20D8,$81FF 
    db $0A 
    dw $20DC,$01FE 
    db $11 
    dw $20F6,$01FE 
    db $09 
    dw $20F5 

UNUSED_SpriteObjectSpritemaps_26_5_B4D176:
    dw $0009,$81FE 
    db $FB 
    dw $20D6,$81EE 
    db $FB 
    dw $20D4,$81FE 
    db $EB 
    dw $20D2,$81EE 
    db $EB 
    dw $20D0,$8002 
    db $FC 
    dw $20D8,$8001 
    db $03 
    dw $20D8,$81FF 
    db $09 
    dw $20DC,$01FE 
    db $10 
    dw $20F6,$01FE 
    db $08 
    dw $20F5 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SpriteObjectSpritemaps_B4D1A5:
    dw $0009,$81FE 
    db $FB 
    dw $20D6,$81EE 
    db $FB 
    dw $20D4,$81FE 
    db $EB 
    dw $20D2,$81EE 
    db $EB 
    dw $20D0,$8002 
    db $FB 
    dw $20D8,$8001 
    db $01 
    dw $20D8,$81FF 
    db $07 
    dw $20DC,$01FE 
    db $10 
    dw $20F6,$01FE 
    db $08 
    dw $20F5 
endif ; !FEATURE_KEEP_UNREFERENCED

UNUSED_SpriteObjectSpritemaps_27_0_B4D1D4:
    dw $0005,$0000 
    db $F8 
    dw $20F3,$01F8 
    db $F8 
    dw $20F2,$0002 
    db $FC 
    dw $20F4,$01FE 
    db $F4 
    dw $20F1,$01F6 
    db $F4 
    dw $20F0 

UNUSED_SpriteObjectSpritemaps_27_1_B4D1EF:
    dw $0005,$01FE 
    db $F4 
    dw $20F3,$01F6 
    db $F4 
    dw $20F2,$0000 
    db $F8 
    dw $20F4,$0002 
    db $FC 
    dw $20F3,$01FA 
    db $FC 
    dw $20F2 

UNUSED_SpriteObjectSpritemaps_27_2_B4D20A:
    dw $0005,$01FE 
    db $F4 
    dw $20F4,$01F8 
    db $F8 
    dw $20F2,$0000 
    db $F8 
    dw $20F3,$0002 
    db $FC 
    dw $20F1,$01FA 
    db $FC 
    dw $20F0 

UNUSED_SpriteObjectSpritemaps_27_3_B4D225:
    dw $0006,$01FE 
    db $F4 
    dw $20F3,$01F6 
    db $F4 
    dw $20F2,$01F8 
    db $F8 
    dw $20F0,$0000 
    db $F8 
    dw $20F1,$0002 
    db $FC 
    dw $20F3,$01FA 
    db $FC 
    dw $20F2 

UNUSED_SpriteObjectSpritemaps_27_4_B4D245:
    dw $0003,$01FE 
    db $F4 
    dw $20F4,$0000 
    db $F8 
    dw $20F4,$0002 
    db $FC 
    dw $20F4 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SpriteObjectSpritemaps_B4D256:
    dw $0006,$01FE 
    db $F4 
    dw $20F3,$01F6 
    db $F4 
    dw $20F2,$01F8 
    db $F8 
    dw $20F2,$0000 
    db $F8 
    dw $20F3,$0002 
    db $FC 
    dw $20F3,$01FA 
    db $FC 
    dw $20F2 

UNUSED_SpriteObjectSpritemaps_B4D276:
    dw $0006,$01FE 
    db $F4 
    dw $20F1,$01F6 
    db $F4 
    dw $20F0,$0000 
    db $F8 
    dw $20F1,$01F8 
    db $F8 
    dw $20F0,$0002 
    db $FC 
    dw $20F1,$01FA 
    db $FC 
    dw $20F0 

UNUSED_SpriteObjectSpritemaps_B4D296:
    dw $0004,$0000 
    db $00 
    dw $A0F8,$01F8 
    db $00 
    dw $A0F7,$0000 
    db $F8 
    dw $20F8,$01F8 
    db $F8 
    dw $20F7 
endif ; !FEATURE_KEEP_UNREFERENCED

UNUSED_SpriteObjectSpritemaps_2A_B4D2AC:
    dw $0001,$81F8 
    db $F8 
    dw $20DE 

UNUSED_SpriteObjectSpritemaps_28_0_B4D2B3:
    dw $0009,$81F2 
    db $FB 
    dw $60D6,$8002 
    db $FB 
    dw $60D4,$81F2 
    db $EB 
    dw $60D2,$8002 
    db $EB 
    dw $60D0,$81EE 
    db $FB 
    dw $60D8,$81EF 
    db $01 
    dw $60D8,$81F1 
    db $07 
    dw $60DC,$01FA 
    db $10 
    dw $60F6,$01FA 
    db $08 
    dw $60F5 

UNUSED_SpriteObjectSpritemaps_28_1_B4D2E2:
    dw $0009,$81F2 
    db $FB 
    dw $60D6,$8002 
    db $FB 
    dw $60D4,$81F2 
    db $EB 
    dw $60D2,$8002 
    db $EB 
    dw $60D0,$81EE 
    db $FC 
    dw $60D8,$81EF 
    db $02 
    dw $60D8,$81F1 
    db $07 
    dw $60DC,$01FA 
    db $10 
    dw $60F6,$01FA 
    db $08 
    dw $60F5 

UNUSED_SpriteObjectSpritemaps_28_2_B4D311:
    dw $0009,$81F2 
    db $FB 
    dw $60D6,$8002 
    db $FB 
    dw $60D4,$81F2 
    db $EB 
    dw $60D2,$8002 
    db $EB 
    dw $60D0,$81EE 
    db $FD 
    dw $60D8,$81EF 
    db $03 
    dw $60D8,$81F1 
    db $08 
    dw $60DC,$01FA 
    db $11 
    dw $60F6,$01FA 
    db $09 
    dw $60F5 

UNUSED_SpriteObjectSpritemaps_28_3_B4D340:
    dw $0009,$81F2 
    db $FB 
    dw $60D6,$8002 
    db $FB 
    dw $60D4,$81F2 
    db $EB 
    dw $60D2,$8002 
    db $EB 
    dw $60D0,$81EE 
    db $FD 
    dw $60D8,$81EF 
    db $04 
    dw $60D8,$81F1 
    db $09 
    dw $60DC,$01FA 
    db $12 
    dw $60F6,$01FA 
    db $0A 
    dw $60F5 

UNUSED_SpriteObjectSpritemaps_28_4_B4D36F:
    dw $0009,$81F2 
    db $FB 
    dw $60D6,$8002 
    db $FB 
    dw $60D4,$81F2 
    db $EB 
    dw $60D2,$8002 
    db $EB 
    dw $60D0,$81EE 
    db $FD 
    dw $60D8,$81EF 
    db $04 
    dw $60D8,$81F1 
    db $0A 
    dw $60DC,$01FA 
    db $11 
    dw $60F6,$01FA 
    db $09 
    dw $60F5 

UNUSED_SpriteObjectSpritemaps_28_5_B4D39E:
    dw $0009,$81F2 
    db $FB 
    dw $60D6,$8002 
    db $FB 
    dw $60D4,$81F2 
    db $EB 
    dw $60D2,$8002 
    db $EB 
    dw $60D0,$81EE 
    db $FC 
    dw $60D8,$81EF 
    db $03 
    dw $60D8,$81F1 
    db $09 
    dw $60DC,$01FA 
    db $10 
    dw $60F6,$01FA 
    db $08 
    dw $60F5 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SpriteObjectSpritemaps_B4D3CD:
    dw $0009,$81F2 
    db $FB 
    dw $60D6,$8002 
    db $FB 
    dw $60D4,$81F2 
    db $EB 
    dw $60D2,$8002 
    db $EB 
    dw $60D0,$81EE 
    db $FB 
    dw $60D8,$81EF 
    db $01 
    dw $60D8,$81F1 
    db $07 
    dw $60DC,$01FA 
    db $10 
    dw $60F6,$01FA 
    db $08 
    dw $60F5 
endif ; !FEATURE_KEEP_UNREFERENCED

UNUSED_SpriteObjectSpritemaps_29_0_B4D3FC:
    dw $0005,$01F8 
    db $F8 
    dw $60F3,$0000 
    db $F8 
    dw $60F2,$01FA 
    db $F4 
    dw $60F1,$0002 
    db $F4 
    dw $60F0,$01F6 
    db $FC 
    dw $60F4 

UNUSED_SpriteObjectSpritemaps_29_1_B4D417:
    dw $0005,$01FA 
    db $F4 
    dw $60F3,$0002 
    db $F4 
    dw $60F2,$01F8 
    db $F8 
    dw $60F4,$01F6 
    db $FC 
    dw $60F3,$01FE 
    db $FC 
    dw $60F2 

UNUSED_SpriteObjectSpritemaps_29_2_B4D432:
    dw $0005,$01FA 
    db $F4 
    dw $60F4,$01F8 
    db $F8 
    dw $60F3,$0000 
    db $F8 
    dw $60F2,$01F6 
    db $FC 
    dw $60F1,$01FE 
    db $FC 
    dw $60F0 

UNUSED_SpriteObjectSpritemaps_29_3_B4D44D:
    dw $0006,$01FA 
    db $F4 
    dw $60F3,$0002 
    db $F4 
    dw $60F2,$0000 
    db $F8 
    dw $60F0,$01F8 
    db $F8 
    dw $60F1,$01F6 
    db $FC 
    dw $60F3,$01FE 
    db $FC 
    dw $60F2 

UNUSED_SpriteObjectSpritemaps_29_4_B4D46D:
    dw $0003,$01F6 
    db $FC 
    dw $60F4,$01F8 
    db $F8 
    dw $60F4,$01FA 
    db $F4 
    dw $60F4 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SpriteObjectSpritemaps_B4D47E:
    dw $0006,$01FA 
    db $F4 
    dw $60F3,$0002 
    db $F4 
    dw $60F2,$01F8 
    db $F8 
    dw $60F3,$0000 
    db $F8 
    dw $60F2,$01F6 
    db $FC 
    dw $60F3,$01FE 
    db $FC 
    dw $60F2 

UNUSED_SpriteObjectSpritemaps_B4D49E:
    dw $0006,$01FA 
    db $F4 
    dw $60F1,$0002 
    db $F4 
    dw $60F0,$0000 
    db $F8 
    dw $60F0,$01F8 
    db $F8 
    dw $60F1,$01F6 
    db $FC 
    dw $60F1,$01FE 
    db $FC 
    dw $60F0 
endif ; !FEATURE_KEEP_UNREFERENCED

SpriteObjectSpritemaps_2B_Puromi_0:
    dw $0001,$81F9 
    db $F8 
    dw $230A 

SpriteObjectSpritemaps_2B_Puromi_1:
    dw $0001,$81F9 
    db $F8 
    dw $2308 

SpriteObjectSpritemaps_2B_Puromi_2:
    dw $0001,$81F8 
    db $F8 
    dw $E30A 

SpriteObjectSpritemaps_2B_Puromi_3:
    dw $0001,$81F8 
    db $F8 
    dw $E308 

SpriteObjectSpritemaps_2B_Puromi_4:
    dw $0001,$81F9 
    db $F8 
    dw $2306 

SpriteObjectSpritemaps_2B_Puromi_5:
    dw $0001,$81F9 
    db $F8 
    dw $2322 

SpriteObjectSpritemaps_2B_Puromi_6:
    dw $0001,$81F8 
    db $F8 
    dw $E306 

SpriteObjectSpritemaps_2B_Puromi_7:
    dw $0001,$81F8 
    db $F8 
    dw $E322 

SpriteObjectSpritemaps_2C_PuromiRightExplosion_0:
    dw $0001,$81F9 
    db $F9 
    dw $230E 

SpriteObjectSpritemaps_2C_PuromiRightExplosion_1:
    dw $0001,$81FD 
    db $F5 
    dw $2320 

SpriteObjectSpritemaps_2C_PuromiRightExplosion_2:
    dw $0001,$8003 
    db $EE 
    dw $2304 

SpriteObjectSpritemaps_2C_PuromiRightExplosion_3:
    dw $0001,$8005 
    db $EC 
    dw $2308 

SpriteObjectSpritemaps_2C_PuromiRightExplosion_4:
    dw $0001,$8005 
    db $EC 
    dw $230C 

SpriteObjectSpritemaps_2C_PuromiRightExplosion_5:
    dw $0001,$8005 
    db $EC 
    dw $2326 

SpriteObjectSpritemaps_2C_PuromiRightExplosion_6:
    dw $0001,$8005 
    db $EC 
    dw $232E 

SpriteObjectSpritemaps_2D_PuromiLeftExplosion_0:
    dw $0001,$81F8 
    db $F9 
    dw $630E 

SpriteObjectSpritemaps_2D_PuromiLeftExplosion_1:
    dw $0001,$81F4 
    db $F5 
    dw $6320 

SpriteObjectSpritemaps_2D_PuromiLeftExplosion_2:
    dw $0001,$81EE 
    db $EE 
    dw $6304 

SpriteObjectSpritemaps_2D_PuromiLeftExplosion_3:
    dw $0001,$81EC 
    db $EC 
    dw $6308 

SpriteObjectSpritemaps_2D_PuromiLeftExplosion_4:
    dw $0001,$81EC 
    db $EC 
    dw $630C 

SpriteObjectSpritemaps_2D_PuromiLeftExplosion_5:
    dw $0001,$81EC 
    db $EC 
    dw $6326 

SpriteObjectSpritemaps_2D_PuromiLeftExplosion_6:
    dw $0001,$81EB 
    db $EC 
    dw $232E 

SpriteObjectSpritemaps_2E_PuromiSplash_0:
    dw $0002,$01F1 
    db $F8 
    dw $6334,$0008 
    db $F8 
    dw $2334 

SpriteObjectSpritemaps_2E_PuromiSplash_1:
    dw $0002,$01F1 
    db $F8 
    dw $6324,$0008 
    db $F8 
    dw $2324 

SpriteObjectSpritemaps_2E_PuromiSplash_2:
    dw $0002,$81E9 
    db $F0 
    dw $6328,$8008 
    db $F0 
    dw $2328 

SpriteObjectSpritemaps_2E_PuromiSplash_3:
    dw $0002,$81E9 
    db $F0 
    dw $632C,$8008 
    db $F0 
    dw $232C 

SpriteObjectSpritemaps_2E_PuromiSplash_4:
    dw $0002,$81E8 
    db $F0 
    dw $632A,$8009 
    db $F0 
    dw $232A 

UNUSED_SpriteObjectSpritemaps_2F_B4D594:
    dw $0001,$81F8 
    db $F8 
    dw $3340 

SpriteObjectSpritemaps_30_FallingSparkTrail_0:
    dw $0001,$01FC 
    db $FC 
    dw $2107 

SpriteObjectSpritemaps_30_FallingSparkTrail_1:
    dw $0001,$01FC 
    db $FC 
    dw $2108 

SpriteObjectSpritemaps_30_FallingSparkTrail_2:
    dw $0001,$01FC 
    db $FC 
    dw $2109 

SpriteObjectSpritemaps_30_FallingSparkTrail_3:
    dw $0001,$01FC 
    db $FC 
    dw $210A 

SpriteObjectSpritemaps_34_35_36_MetroidShell_0:
    dw $000A,$0010 
    db $04 
    dw $6130,$0010 
    db $FC 
    dw $6120,$0010 
    db $F4 
    dw $6110,$01E8 
    db $04 
    dw $2130,$01E8 
    db $FC 
    dw $2120,$01E8 
    db $F4 
    dw $2110,$8000 
    db $FC 
    dw $6121,$8000 
    db $EC 
    dw $2103,$81F0 
    db $FC 
    dw $2121,$81F0 
    db $EC 
    dw $2101 

SpriteObjectSpritemaps_34_36_MetroidShell_1:
    dw $000A,$0010 
    db $FC 
    dw $612A,$0010 
    db $04 
    dw $613A,$0010 
    db $F4 
    dw $211F,$01E8 
    db $04 
    dw $213A,$01E8 
    db $FC 
    dw $212A,$01E8 
    db $F4 
    dw $211A,$8000 
    db $EC 
    dw $210D,$8000 
    db $FC 
    dw $612B,$81F0 
    db $FC 
    dw $212B,$81F0 
    db $EC 
    dw $210B 

SpriteObjectSpritemaps_34_35_36_MetroidShell_2:
    dw $000A,$01E8 
    db $FC 
    dw $2125,$0010 
    db $04 
    dw $6135,$0010 
    db $FC 
    dw $6125,$0010 
    db $F4 
    dw $6115,$01E8 
    db $04 
    dw $2135,$01E8 
    db $F4 
    dw $2115,$8000 
    db $FC 
    dw $6126,$8000 
    db $EC 
    dw $2108,$81F0 
    db $FC 
    dw $2126,$81F0 
    db $EC 
    dw $2106 

UNUSED_SpriteObjectSpritemaps_31_MetroidInsides_0_B4D653:
    dw $0008,$0010 
    db $00 
    dw $6160,$0010 
    db $F8 
    dw $6150,$01E8 
    db $00 
    dw $2160,$01E8 
    db $F8 
    dw $2150,$8000 
    db $00 
    dw $6161,$8000 
    db $F0 
    dw $6141,$81F0 
    db $00 
    dw $2161,$81F0 
    db $F0 
    dw $2141 

UNUSED_SpriteObjectSpritemaps_31_MetroidInsides_1_B4D67D:
    dw $0006,$0010 
    db $00 
    dw $6163,$01E8 
    db $00 
    dw $2163,$8000 
    db $00 
    dw $6164,$8000 
    db $F0 
    dw $6144,$81F0 
    db $00 
    dw $2164,$81F0 
    db $F0 
    dw $2144 

UNUSED_SpriteObjectSpritemaps_31_MetroidInsides_2_B4D69D:
    dw $0008,$0010 
    db $00 
    dw $6166,$0010 
    db $F8 
    dw $6156,$01E8 
    db $00 
    dw $2166,$01E8 
    db $F8 
    dw $2156,$8000 
    db $00 
    dw $6167,$8000 
    db $F0 
    dw $6147,$81F0 
    db $00 
    dw $2167,$81F0 
    db $F0 
    dw $2147 

UNUSED_SpriteObjectSpritemaps_31_MetroidInsides_3_B4D6C7:
    dw $0008,$0010 
    db $00 
    dw $6169,$0010 
    db $F8 
    dw $6159,$01E8 
    db $00 
    dw $2169,$01E8 
    db $F8 
    dw $2159,$8000 
    db $00 
    dw $616A,$8000 
    db $F0 
    dw $614A,$81F0 
    db $00 
    dw $216A,$81F0 
    db $F0 
    dw $214A 

SpriteObjectSpritemaps_32_33_MetroidElectricity_0:
    dw $0003,$0000 
    db $EC 
    dw $217C,$01F8 
    db $FC 
    dw $214D,$01F0 
    db $FC 
    dw $214C 

SpriteObjectSpritemaps_32_33_MetroidElectricity_1:
    dw $0003,$0000 
    db $EC 
    dw $217D,$01F8 
    db $FC 
    dw $215D,$01F0 
    db $FC 
    dw $215C 

SpriteObjectSpritemaps_32_33_MetroidElectricity_2:
    dw $0003,$0000 
    db $EC 
    dw $217E,$01F8 
    db $FC 
    dw $216D,$01F0 
    db $FC 
    dw $216C 

SpriteObjectSpritemaps_32_33_MetroidElectricity_3:
    dw $0004,$0008 
    db $FC 
    dw $214F,$0000 
    db $FC 
    dw $214E,$01F8 
    db $F4 
    dw $213D,$01F8 
    db $EC 
    dw $212D 

SpriteObjectSpritemaps_32_33_MetroidElectricity_4:
    dw $0004,$0008 
    db $FC 
    dw $215F,$0000 
    db $FC 
    dw $215E,$01F8 
    db $F4 
    dw $213E,$01F8 
    db $EC 
    dw $212E 

SpriteObjectSpritemaps_32_33_MetroidElectricity_5:
    dw $0004,$0008 
    db $FC 
    dw $216F,$0000 
    db $FC 
    dw $216E,$01F8 
    db $F4 
    dw $213F,$01F8 
    db $EC 
    dw $212F 

SpriteObjectSpritemaps_32_33_MetroidElectricity_6:
    dw $0003,$0008 
    db $FC 
    dw $214D,$0000 
    db $FC 
    dw $214C,$01F8 
    db $EC 
    dw $617C 

SpriteObjectSpritemaps_32_33_MetroidElectricity_7:
    dw $0003,$0008 
    db $FC 
    dw $215D,$0000 
    db $FC 
    dw $215C,$01F8 
    db $EC 
    dw $617D 

SpriteObjectSpritemaps_32_33_MetroidElectricity_8:
    dw $0003,$0008 
    db $FC 
    dw $216D,$0000 
    db $FC 
    dw $216C,$01F8 
    db $EC 
    dw $617E 

SpriteObjectSpritemaps_32_33_MetroidElectricity_9:
    dw $0004,$01F8 
    db $FC 
    dw $214F,$01F0 
    db $FC 
    dw $214E,$0000 
    db $F4 
    dw $613D,$0000 
    db $EC 
    dw $612D 

SpriteObjectSpritemaps_32_33_MetroidElectricity_A:
    dw $0004,$01F8 
    db $FC 
    dw $216F,$01F0 
    db $FC 
    dw $216E,$0000 
    db $F4 
    dw $613E,$0000 
    db $EC 
    dw $612E 

SpriteObjectSpritemaps_32_33_MetroidElectricity_B:
    dw $0004,$01F8 
    db $FC 
    dw $215F,$01F0 
    db $FC 
    dw $215E,$0000 
    db $F4 
    dw $613F,$0000 
    db $EC 
    dw $612F 

SpriteObjectSpritemaps_32_MetroidElectricity_C:
    dw $0002,$01F8 
    db $FC 
    dw $214D,$01F0 
    db $FC 
    dw $214C 

SpriteObjectSpritemaps_32_MetroidElectricity_D:
    dw $0001,$01F0 
    db $FC 
    dw $215C 

SpriteObjectSpritemaps_32_MetroidElectricity_E:
    dw $0002,$01F8 
    db $FC 
    dw $216D,$01F0 
    db $FC 
    dw $216C 

SpriteObjectSpritemaps_32_33_MetroidElectricity_F:
    dw $0002,$01F8 
    db $F4 
    dw $213D,$01F8 
    db $EC 
    dw $212D 

SpriteObjectSpritemaps_32_33_MetroidElectricity_10:
    dw $0002,$01F8 
    db $F4 
    dw $213E,$01F8 
    db $EC 
    dw $212E 

SpriteObjectSpritemaps_32_33_MetroidElectricity_11:
    dw $0002,$01F8 
    db $F4 
    dw $213F,$01F8 
    db $EC 
    dw $212F 

SpriteObjectSpritemaps_32_MetroidElectricity_12:
    dw $0002,$0008 
    db $FC 
    dw $214D,$0000 
    db $FC 
    dw $214C 

SpriteObjectSpritemaps_32_MetroidElectricity_13:
    dw $0002,$0008 
    db $FC 
    dw $215D,$0000 
    db $FC 
    dw $215C 

SpriteObjectSpritemaps_32_MetroidElectricity_14:
    dw $0002,$0008 
    db $FC 
    dw $216D,$0000 
    db $FC 
    dw $216C 

SpriteObjectSpritemaps_32_33_MetroidElectricity_15:
    dw $0001,$0000 
    db $EC 
    dw $217C 

SpriteObjectSpritemaps_32_33_MetroidElectricity_16:
    dw $0001,$0000 
    db $EC 
    dw $217D 

SpriteObjectSpritemaps_32_33_MetroidElectricity_17:
    dw $0001,$0000 
    db $EC 
    dw $217E 

SpriteObjectSpritemaps_37_EnemyShot_0:
    dw $0004,$0002 
    db $02 
    dw $ECBC,$01F6 
    db $02 
    dw $ACBC,$0002 
    db $F6 
    dw $6CBC,$01F6 
    db $F6 
    dw $2CBC 

SpriteObjectSpritemaps_37_EnemyShot_1:
    dw $0004,$0004 
    db $04 
    dw $ECBD,$01F4 
    db $04 
    dw $ACBD,$0004 
    db $F4 
    dw $6CBD,$01F4 
    db $F4 
    dw $2CBD 

SpriteObjectSpritemaps_37_EnemyShot_2:
    dw $0004,$0007 
    db $07 
    dw $ECCB,$0007 
    db $F1 
    dw $6CCB,$01F1 
    db $07 
    dw $ACCB,$01F1 
    db $F1 
    dw $2CCB 

SpriteObjectSpritemaps_37_EnemyShot_3:
    dw $0004,$000B 
    db $0B 
    dw $ECCC,$01ED 
    db $0B 
    dw $ACCC,$000B 
    db $ED 
    dw $6CCC,$01ED 
    db $ED 
    dw $2CCC 

SpriteObjectSpritemaps_38_YappingMawBaseFacingDown:
    dw $0001,$81F8 
    db $F8 
    dw $210A 

SpriteObjectSpritemaps_39_YappingMawBaseFacingUp:
    dw $0001,$81F8 
    db $F8 
    dw $A10A 

UNUSED_SpriteObjectSpritemaps_3A_0_B4D8BD:
    dw $000E,$01FB 
    db $00 
    dw $20F3,$01F3 
    db $00 
    dw $20F2,$01FD 
    db $04 
    dw $20F4,$01F9 
    db $FD 
    dw $20F1,$01F1 
    db $FD 
    dw $20F0,$81FE 
    db $FB 
    dw $20D6,$81EE 
    db $FB 
    dw $20D4,$81FE 
    db $EB 
    dw $20D2,$81EE 
    db $EB 
    dw $20D0,$8002 
    db $FB 
    dw $20D8,$8001 
    db $01 
    dw $20DA,$81FF 
    db $07 
    dw $20DC,$01FE 
    db $10 
    dw $20F6,$01FE 
    db $08 
    dw $20F5 

UNUSED_SpriteObjectSpritemaps_3A_1_B4D905:
    dw $0010,$01F9 
    db $FC 
    dw $20F3,$01F1 
    db $FC 
    dw $20F2,$01FB 
    db $00 
    dw $20F4,$01FD 
    db $04 
    dw $20F3,$01F5 
    db $04 
    dw $20F2,$01EE 
    db $FB 
    dw $20F9,$01F6 
    db $F3 
    dw $20FC,$81FE 
    db $FB 
    dw $20D6,$81EE 
    db $FB 
    dw $20D4,$81FE 
    db $EB 
    dw $20D2,$81EE 
    db $EB 
    dw $20D0,$8002 
    db $FC 
    dw $20D8,$8001 
    db $02 
    dw $20DA,$81FF 
    db $07 
    dw $20DC,$01FE 
    db $11 
    dw $20F6,$01FE 
    db $09 
    dw $20F5 

UNUSED_SpriteObjectSpritemaps_3A_2_B4D957:
    dw $0010,$01FC 
    db $04 
    dw $20F1,$01FC 
    db $00 
    dw $20F3,$01F4 
    db $04 
    dw $20F0,$01F4 
    db $00 
    dw $20F2,$01F8 
    db $FC 
    dw $20F4,$01EE 
    db $FB 
    dw $20FA,$01F6 
    db $F3 
    dw $20FB,$81FE 
    db $FB 
    dw $20D6,$81EE 
    db $FB 
    dw $20D4,$81FE 
    db $EB 
    dw $20D2,$81EE 
    db $EB 
    dw $20D0,$8002 
    db $FD 
    dw $20D8,$8001 
    db $03 
    dw $20DA,$81FF 
    db $08 
    dw $20DC,$01FE 
    db $12 
    dw $20F6,$01FE 
    db $0A 
    dw $20F5 

UNUSED_SpriteObjectSpritemaps_3A_3_B4D9A9:
    dw $0010,$01FE 
    db $04 
    dw $20F3,$01F6 
    db $04 
    dw $20F2,$01F4 
    db $01 
    dw $20F0,$01FC 
    db $01 
    dw $20F1,$01FB 
    db $FC 
    dw $20F3,$01F3 
    db $FC 
    dw $20F2,$01EE 
    db $FB 
    dw $20F9,$81FE 
    db $FB 
    dw $20D6,$81EE 
    db $FB 
    dw $20D4,$81FE 
    db $EB 
    dw $20D2,$81EE 
    db $EB 
    dw $20D0,$8002 
    db $FD 
    dw $20D8,$8001 
    db $04 
    dw $20DA,$81FF 
    db $09 
    dw $20DC,$01FE 
    db $12 
    dw $20F6,$01FE 
    db $0A 
    dw $20F5 

UNUSED_SpriteObjectSpritemaps_3A_4_B4D9FB:
    dw $000F,$01FC 
    db $00 
    dw $20F3,$01F4 
    db $00 
    dw $20F2,$01FE 
    db $04 
    dw $20F4,$01FA 
    db $FD 
    dw $20F1,$01F2 
    db $FD 
    dw $20F0,$01EE 
    db $FB 
    dw $20F9,$81FE 
    db $FB 
    dw $20D6,$81EE 
    db $FB 
    dw $20D4,$81FE 
    db $EB 
    dw $20D2,$81EE 
    db $EB 
    dw $20D0,$8002 
    db $FD 
    dw $20D8,$8001 
    db $04 
    dw $20DA,$81FF 
    db $0A 
    dw $20DC,$01FE 
    db $12 
    dw $20F6,$01FE 
    db $0A 
    dw $20F5 

UNUSED_SpriteObjectSpritemaps_3A_5_B4DA48:
    dw $000E,$01FC 
    db $00 
    dw $20F4,$01FE 
    db $04 
    dw $20F3,$01FA 
    db $FB 
    dw $20F3,$01F2 
    db $FB 
    dw $20F2,$01F6 
    db $04 
    dw $20F2,$81FE 
    db $FB 
    dw $20D6,$81EE 
    db $FB 
    dw $20D4,$81FE 
    db $EB 
    dw $20D2,$81EE 
    db $EB 
    dw $20D0,$8002 
    db $FC 
    dw $20D8,$8001 
    db $03 
    dw $20DA,$81FF 
    db $0A 
    dw $20DC,$01FE 
    db $11 
    dw $20F6,$01FE 
    db $09 
    dw $20F5 

UNUSED_SpriteObjectSpritemaps_3A_6_B4DA90:
    dw $000E,$01FE 
    db $04 
    dw $20F1,$01F6 
    db $04 
    dw $20F0,$01FA 
    db $FC 
    dw $20F4,$01F4 
    db $00 
    dw $20F2,$01FC 
    db $00 
    dw $20F3,$81FE 
    db $FB 
    dw $20D6,$81EE 
    db $FB 
    dw $20D4,$81FE 
    db $EB 
    dw $20D2,$81EE 
    db $EB 
    dw $20D0,$8002 
    db $FB 
    dw $20D8,$8001 
    db $01 
    dw $20DA,$81FF 
    db $08 
    dw $20DC,$01FE 
    db $10 
    dw $20F6,$01FE 
    db $08 
    dw $20F5 

UNUSED_SpriteObjectSpritemaps_3A_7_B4DAD8:
    dw $000F,$01FE 
    db $04 
    dw $20F3,$01F6 
    db $04 
    dw $20F2,$01FC 
    db $01 
    dw $20F1,$01F4 
    db $01 
    dw $20F0,$01FA 
    db $FC 
    dw $20F3,$01F2 
    db $FC 
    dw $20F2,$81FE 
    db $FB 
    dw $20D6,$81EE 
    db $FB 
    dw $20D4,$81FE 
    db $EB 
    dw $20D2,$81EE 
    db $EB 
    dw $20D0,$8002 
    db $FB 
    dw $20D8,$8001 
    db $01 
    dw $20DA,$81FF 
    db $07 
    dw $20DC,$01FE 
    db $0F 
    dw $20F6,$01FE 
    db $07 
    dw $20F5 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SpriteObjectSpritemaps_B4FB25:
    dw $0004,$0000 
    db $00 
    dw $A0F8,$01F8 
    db $00 
    dw $A0F7,$0000 
    db $F8 
    dw $20F8,$01F8 
    db $F8 
    dw $20F7 

UNUSED_SpriteObjectSpritemaps_B4FB3B:
    dw $0001,$81F8 
    db $F8 
    dw $20DE 
endif ; !FEATURE_KEEP_UNREFERENCED

SpriteObjectSpritemaps_3B_EvirFacingLeft_0:
    dw $000C,$0000 
    db $02 
    dw $20F3,$01F8 
    db $02 
    dw $20F2,$01FC 
    db $FC 
    dw $20F1,$01F4 
    db $FC 
    dw $20F0,$8000 
    db $FC 
    dw $20D6,$81F0 
    db $FC 
    dw $20D4,$8000 
    db $EC 
    dw $20D2,$81F0 
    db $EC 
    dw $20D0,$8004 
    db $FB 
    dw $20D8,$8002 
    db $02 
    dw $20DC,$0000 
    db $0F 
    dw $20F6,$0000 
    db $07 
    dw $20F5 

SpriteObjectSpritemaps_3B_EvirFacingLeft_1:
    dw $000C,$01F8 
    db $F4 
    dw $20FC,$0000 
    db $02 
    dw $20F4,$01FC 
    db $FC 
    dw $20F3,$01F4 
    db $FC 
    dw $20F2,$8000 
    db $FC 
    dw $20D6,$81F0 
    db $FC 
    dw $20D4,$8000 
    db $EC 
    dw $20D2,$81F0 
    db $EC 
    dw $20D0,$8004 
    db $FC 
    dw $20D8,$8002 
    db $03 
    dw $20DC,$0000 
    db $0E 
    dw $20F6,$0000 
    db $06 
    dw $20F5 

SpriteObjectSpritemaps_3B_EvirFacingLeft_2:
    dw $000C,$01F8 
    db $F4 
    dw $20FB,$0000 
    db $02 
    dw $20F3,$01F8 
    db $02 
    dw $20F2,$01FA 
    db $FC 
    dw $20F4,$8000 
    db $FC 
    dw $20D6,$81F0 
    db $FC 
    dw $20D4,$8000 
    db $EC 
    dw $20D2,$81F0 
    db $EC 
    dw $20D0,$8004 
    db $FD 
    dw $20D8,$8002 
    db $03 
    dw $20DC,$0000 
    db $0D 
    dw $20F6,$0000 
    db $05 
    dw $20F5 

SpriteObjectSpritemaps_3B_EvirFacingLeft_3:
    dw $000D,$01FC 
    db $FC 
    dw $20F3,$01F4 
    db $FC 
    dw $20F2,$01F0 
    db $FC 
    dw $20F9,$0000 
    db $02 
    dw $20F1,$01F8 
    db $02 
    dw $20F0,$8000 
    db $FC 
    dw $20D6,$81F0 
    db $FC 
    dw $20D4,$8000 
    db $EC 
    dw $20D2,$81F0 
    db $EC 
    dw $20D0,$8004 
    db $FD 
    dw $20D8,$8002 
    db $04 
    dw $20DC,$0000 
    db $0E 
    dw $20F6,$0000 
    db $06 
    dw $20F5 

SpriteObjectSpritemaps_3C_EvirFacingRight_0:
    dw $000C,$01F8 
    db $02 
    dw $60F3,$0000 
    db $02 
    dw $60F2,$01FC 
    db $FC 
    dw $60F1,$0004 
    db $FC 
    dw $60F0,$81F0 
    db $FC 
    dw $60D6,$8000 
    db $FC 
    dw $60D4,$81F0 
    db $EC 
    dw $60D2,$8000 
    db $EC 
    dw $60D0,$81EC 
    db $FB 
    dw $60D8,$81EE 
    db $02 
    dw $60DC,$01F8 
    db $0F 
    dw $60F6,$01F8 
    db $07 
    dw $60F5 

SpriteObjectSpritemaps_3C_EvirFacingRight_1:
    dw $000C,$0000 
    db $F4 
    dw $60FC,$01F8 
    db $02 
    dw $60F4,$01FC 
    db $FC 
    dw $60F3,$0004 
    db $FC 
    dw $60F2,$81F0 
    db $FC 
    dw $60D6,$8000 
    db $FC 
    dw $60D4,$81F0 
    db $EC 
    dw $60D2,$8000 
    db $EC 
    dw $60D0,$81EC 
    db $FC 
    dw $60D8,$81EE 
    db $03 
    dw $60DC,$01F8 
    db $0E 
    dw $60F6,$01F8 
    db $06 
    dw $60F5 

SpriteObjectSpritemaps_3C_EvirFacingRight_2:
    dw $000C,$0000 
    db $F4 
    dw $60FB,$01F8 
    db $02 
    dw $60F3,$0000 
    db $02 
    dw $60F2,$01FE 
    db $FC 
    dw $60F4,$81F0 
    db $FC 
    dw $60D6,$8000 
    db $FC 
    dw $60D4,$81F0 
    db $EC 
    dw $60D2,$8000 
    db $EC 
    dw $60D0,$81EC 
    db $FD 
    dw $60D8,$81EE 
    db $03 
    dw $60DC,$01F8 
    db $0D 
    dw $60F6,$01F8 
    db $05 
    dw $60F5 

SpriteObjectSpritemaps_3C_EvirFacingRight_3:
    dw $000D,$01FC 
    db $FC 
    dw $60F3,$0004 
    db $FC 
    dw $60F2,$0008 
    db $FC 
    dw $60F9,$01F8 
    db $02 
    dw $60F1,$0000 
    db $02 
    dw $60F0,$81F0 
    db $FC 
    dw $60D6,$8000 
    db $FC 
    dw $60D4,$81F0 
    db $EC 
    dw $60D2,$8000 
    db $EC 
    dw $60D0,$81EC 
    db $FD 
    dw $60D8,$81EE 
    db $04 
    dw $60DC,$01F8 
    db $0E 
    dw $60F6,$01F8 
    db $06 
    dw $60F5 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SpriteObjectSpritemaps_B4DD3C:
    dw $0001,$81F8 
    db $F8 
    dw $3BCA 

UNUSED_SpriteObjectSpritemaps_B4DD43:
    dw $0001,$81F8 
    db $F8 
    dw $3BCC 

UNUSED_SpriteObjectSpritemaps_B4DD4A:
    dw $0001,$81F8 
    db $F8 
    dw $3BCE 
endif ; !FEATURE_KEEP_UNREFERENCED

SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_0:
    dw $0001,$81F8 
    db $F8 
    dw $35E0 

SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_1:
    dw $0001,$81F8 
    db $F4 
    dw $35E2 

SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_2:
    dw $0001,$81F8 
    db $F0 
    dw $35E4 

SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_3:
    dw $0001,$81F8 
    db $EC 
    dw $35E6 

SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_4:
    dw $0001,$81F8 
    db $E8 
    dw $35E8 

SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_5:
    dw $0001,$81F8 
    db $E4 
    dw $35EA 

SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_6:
    dw $0001,$81F8 
    db $E0 
    dw $35EC 

SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_7:
    dw $0001,$81F8 
    db $DC 
    dw $35EE 

EnemyName_NoData:
    db "NODATA    " 
    dw DebugEnemyPopulationData_NoName 
    dw $0000 

EnemyName_Atomic:
    db "ATOMIC    " 
    dw DebugEnemyPopulationData_Atomic 
    dw $0001 

EnemyName_Bang:
    db "BANG      " 
    dw DebugEnemyPopulationData_Bang 
    dw $0002 

EnemyName_PirateGreyWall:
    db "BATTA1    " 
    dw DebugEnemyPopulationData_PirateGreyWall 
    dw $0003 

EnemyName_PirateGreyNinja:
    db "BATTA2    " 
    dw DebugEnemyPopulationData_PirateGreyNinja 
    dw $0004 

EnemyName_PirateGreyWalking:
    db "BATTA3    " 
    dw DebugEnemyPopulationData_PirateGreyWalking 
    dw $0005 

EnemyName_Botwoon:
    db "BOTOON    " 
    dw DebugEnemyPopulationData_Botwoon 
    dw $0006 

EnemyName_Boyon:
    db "BOYON     " 
    dw DebugEnemyPopulationData_Boyon 
    dw $0007 

EnemyName_DesgeegaLarge:
    db "DESSGEEGA " 
    dw DebugEnemyPopulationData_DesgeegaLarge 
    dw $0008 

EnemyName_GoldenTorizo:
    db "DORI      " 
    dw DebugEnemyPopulationData_Shaktool 
    dw $0009 

EnemyName_Dragon:
    db "DRAGON    " 
    dw DebugEnemyPopulationData_Dragon 
    dw $000A 

EnemyName_Evir:
    db "EBI       " 
    dw DebugEnemyPopulationData_Evir 
    dw $000B 

EnemyName_Eye:
    db "EYE       " 
    dw DebugEnemyPopulationData_Eye 
    dw $000C 

EnemyName_Namihe:
    db "NAMI      " 
    dw DebugEnemyPopulationData_Namihe 
    dw $000D 

EnemyName_Skultera:
    db "FISH      " 
    dw DebugEnemyPopulationData_Skultera 
    dw $000E 

EnemyName_Coven:
    db "GAI       " 
    dw DebugEnemyPopulationData_Coven 
    dw $000F 

EnemyName_Gamet:
    db "GAMET     " 
    dw DebugEnemyPopulationData_Gamet 
    dw $0010 

EnemyName_Geega:
    db "GEEGA     " 
    dw DebugEnemyPopulationData_Geega 
    dw $0011 

EnemyName_Geruta:
    db "GERUDA    " 
    dw DebugEnemyPopulationData_Geruta 
    dw $0012 

EnemyName_UnknownGRAVY_B4DE93:
    db "GRAVY     " 
    dw UNUSED_DebugEnemyPopulationData_GRAVY_B4E55C 
    dw $0013 

EnemyName_KihunterGreen:
    db "HACHI1    " 
    dw DebugEnemyPopulationData_KihunterGreen 
    dw $0014 

EnemyName_YappingMaw:
    db "HAND      " 
    dw DebugEnemyPopulationData_YappingMaw 
    dw $0015 

EnemyName_Hibashi:
    db "HIBASHI   " 
    dw DebugEnemyPopulationData_Hibashi 
    dw $0016 

EnemyName_Choot:
    db "HIRU      " 
    dw DebugEnemyPopulationData_Choot 
    dw $0017 

EnemyName_Holtz:
    db "HOLTZ     " 
    dw DebugEnemyPopulationData_Holtz 
    dw $0018 

EnemyName_Fireflea:
    db "HOTARY    " 
    dw DebugEnemyPopulationData_Fireflea 
    dw $0019 

EnemyName_HZoomer:
    db "HZOOMER   " 
    dw DebugEnemyPopulationData_HZoomer 
    dw $001A 

EnemyName_Kago:
    db "KAGO      " 
    dw DebugEnemyPopulationData_Kago 
    dw $001B 

EnemyName_MamaTurtle:
    db "KAME      " 
    dw DebugEnemyPopulationData_MamaTurtle 
    dw $001C 

EnemyName_Tripper:
    db "KAMER     " 
    dw DebugEnemyPopulationData_Tripper_Kamer2 
    dw $001D 

EnemyName_Sciser:
    db "KANI      " 
    dw DebugEnemyPopulationData_Sciser 
    dw $001E 

EnemyName_FaceBlock:
    db "KOMA      " 
    dw DebugEnemyPopulationData_FaceBlock 
    dw $001F 

EnemyName_KzanTop:
    db "KZAN      " 
    dw DebugEnemyPopulationData_KzanTop 
    dw $0020 

EnemyName_Magdollite:
    db "LAVAMAN   " 
    dw DebugEnemyPopulationData_Magdollite 
    dw $0021 

EnemyName_Mella:
    db "MELLA     " 
    dw DebugEnemyPopulationData_Mella 
    dw $0022 

EnemyName_Menu:
    db "MEMU      " 
    dw DebugEnemyPopulationData_Menu 
    dw $0023 

EnemyName_Mellow:
    db "MERO      " 
    dw DebugEnemyPopulationData_Mellow 
    dw $0024 

EnemyName_Metaree:
    db "METALEE   " 
    dw DebugEnemyPopulationData_Metaree 
    dw $0025 

EnemyName_Mochtroid:
    db "METMOD    " 
    dw DebugEnemyPopulationData_Mochtroid 
    dw $0026 

EnemyName_Metroid:
    db "METROID   " 
    dw DebugEnemyPopulationData_Metroid 
    dw $0027 

EnemyName_Multiviola:
    db "MULTI     " 
    dw DebugEnemyPopulationData_Multiviola 
    dw $0028 

EnemyName_MZoomer:
    db "MZOOMER   " 
    dw DebugEnemyPopulationData_MZoomer 
    dw $0029 

EnemyName_Alcoon:
    db "NDRA      " 
    dw DebugEnemyPopulationData_Alcoon 
    dw $002A 

EnemyName_Beetom:
    db "NOMI      " 
    dw DebugEnemyPopulationData_Beetom 
    dw $002B 

EnemyName_Sova:
    db "NOVA      " 
    dw DebugEnemyPopulationData_Sova 
    dw $002C 

EnemyName_Oum:
    db "OUM       " 
    dw DebugEnemyPopulationData_Oum 
    dw $002D 

EnemyName_Zero:
    db "OUMU      " 
    dw DebugEnemyPopulationData_Zero 
    dw $002E 

EnemyName_Bull:
    db "PIPE      " 
    dw DebugEnemyPopulationData_Bull 
    dw $002F 

EnemyName_Polyp:
    db "POLYP     " 
    dw DebugEnemyPopulationData_Polyp 
    dw $0030 

EnemyName_Puromi:
    db "PUROMI    " 
    dw DebugEnemyPopulationData_Puromi 
    dw $0031 

EnemyName_Powamp:
    db "PUU       " 
    dw DebugEnemyPopulationData_Powamp 
    dw $0032 

EnemyName_Puyo:
    db "PUYO      " 
    dw DebugEnemyPopulationData_Puyo 
    dw $0033 

EnemyName_Reflec:
    db "REFLEC    " 
    dw DebugEnemyPopulationData_Reflec 
    dw $0034 

EnemyName_Rinka:
    db "RINKA     " 
    dw DebugEnemyPopulationData_Rinka 
    dw $0035 

EnemyName_Rio:
    db "RIO       " 
    dw DebugEnemyPopulationData_Rio 
    dw $0036 

EnemyName_Ripper:
    db "RIPPER    " 
    dw DebugEnemyPopulationData_Ripper 
    dw $0037 

EnemyName_GRipper_Ripper2:
    db "RIPPER2   " 
    dw DebugEnemyPopulationData_GRipper_Ripper2 
    dw $0038 

EnemyName_Robot:
    db "ROBO      " 
    dw DebugEnemyPopulationData_Robot 
    dw $0039 

EnemyName_Boulder:
    db "RSTONE    " 
    dw DebugEnemyPopulationData_Boulder 
    dw $003A 

EnemyName_Cacatac:
    db "SABOTEN   " 
    dw DebugEnemyPopulationData_Cacatac 
    dw $003B 

EnemyName_Sbug:
    db "SBUG      " 
    dw DebugEnemyPopulationData_Sbug_Sbug2 
    dw $003C 

EnemyName_MiniKraid:
    db "SCLAYD    " 
    dw DebugEnemyPopulationData_MiniKraid 
    dw $003D 

EnemyName_Desgeega:
    db "SDEATH    " 
    dw DebugEnemyPopulationData_Desgeega 
    dw $003E 

EnemyName_ShutterGrowing:
    db "SHUTTER   " 
    dw DebugEnemyPopulationData_ShutterGrowing 
    dw $003F 

EnemyName_Shutter2_Kamer:
    db "SHUTTER2  " 
    dw DebugEnemyPopulationData_Shutters_Kamer 
    dw $0040 

EnemyName_SidehopperLarge_SidehopperTourian:
    db "SIDE      " 
    dw DebugEnemyPopulationData_SidehopperLarge_SidehopperTourian 
    dw $0041 

EnemyName_Skree:
    db "SKREE     " 
    dw DebugEnemyPopulationData_Skree 
    dw $0042 

EnemyName_Spark:
    db "SPA       " 
    dw DebugEnemyPopulationData_Spark 
    dw $0043 

EnemyName_Squeept:
    db "SQUEEWPT  " 
    dw DebugEnemyPopulationData_Squeept 
    dw $0044 

EnemyName_Sidehopper:
    db "SSIDE     " 
    dw DebugEnemyPopulationData_Sidehopper 
    dw $0045 

EnemyName_Stoke:
    db "STOKE     " 
    dw DebugEnemyPopulationData_Stoke 
    dw $0046 

EnemyName_Owtch:
    db "TOGE      " 
    dw DebugEnemyPopulationData_Owtch 
    dw $0047 

EnemyName_Viola:
    db "VIOLA     " 
    dw DebugEnemyPopulationData_Viola 
    dw $0048 

EnemyName_Waver:
    db "WAVER     " 
    dw DebugEnemyPopulationData_Waver 
    dw $0049 

EnemyName_Yard:
    db "YARD      " 
    dw DebugEnemyPopulationData_Yard 
    dw $004A 

EnemyName_Zeb:
    db "ZEB       " 
    dw DebugEnemyPopulationData_Zeb 
    dw $004B 

EnemyName_Zebbo:
    db "ZEBBO     " 
    dw DebugEnemyPopulationData_Zebbo 
    dw $004C 

EnemyName_Zeela:
    db "ZEELA     " 
    dw DebugEnemyPopulationData_Zeela 
    dw $004D 

EnemyName_Zoa:
    db "ZOA       " 
    dw DebugEnemyPopulationData_Zoa 
    dw $004E 

EnemyName_Zoomer:
    db "ZOOMER    " 
    dw DebugEnemyPopulationData_Zoomer 
    dw $004F 

EnemyName_PirateGreenWall:
    db "BATTA1Br  " 
    dw DebugEnemyPopulationData_PirateGreenWall 
    dw $0050 

EnemyName_PirateRedWall:
    db "BATTA1No  " 
    dw DebugEnemyPopulationData_PirateRedWall 
    dw $0051 

EnemyName_PirateGoldWall:
    db "BATTA1Na  " 
    dw DebugEnemyPopulationData_PirateGoldWall 
    dw $0052 

EnemyName_PirateMagentaWall:
    db "BATTA1Ma  " 
    dw DebugEnemyPopulationData_PirateMagentaWall 
    dw $0053 

EnemyName_PirateSilverWall:
    db "BATTA1Tu  " 
    dw DebugEnemyPopulationData_PirateSilverWall 
    dw $0054 

EnemyName_PirateGreenNinja:
    db "BATTA2Br  " 
    dw DebugEnemyPopulationData_PirateGreenNinja 
    dw $0055 

EnemyName_PirateRedNinja:
    db "BATTA2No  " 
    dw DebugEnemyPopulationData_PirateRedNinja 
    dw $0056 

EnemyName_PirateGoldNinja:
    db "BATTA2Na  " 
    dw DebugEnemyPopulationData_PirateGoldNinja 
    dw $0057 

EnemyName_PirateMagentaNinja:
    db "BATTA2Ma  " 
    dw DebugEnemyPopulationData_PirateMagentaNinja 
    dw $0058 

EnemyName_PirateSilverNinja:
    db "BATTA2Tu  " 
    dw DebugEnemyPopulationData_PirateSilverNinja 
    dw $0059 

EnemyName_PirateGreenWalking:
    db "BATTA3Br  " 
    dw DebugEnemyPopulationData_PirateGreenWalking 
    dw $005A 

EnemyName_PirateRedWalking:
    db "BATTA3No  " 
    dw DebugEnemyPopulationData_PirateRedWalking 
    dw $005B 

EnemyName_PirateGoldWalking:
    db "BATTA3Na  " 
    dw DebugEnemyPopulationData_PirateGoldWalking 
    dw $005C 

EnemyName_PirateMagentaWalking:
    db "BATTA3Ma  " 
    dw DebugEnemyPopulationData_PirateMagentaWalking 
    dw $005D 

EnemyName_PirateSilverWalking:
    db "BATTA3Tu  " 
    dw DebugEnemyPopulationData_PirateSilverWalking 
    dw $005E 

EnemyName_Fune:
    db "FUNE      " 
    dw DebugEnemyPopulationData_Fune 
    dw $005F 

EnemyName_KihunterYellow:
    db "HACHI2    " 
    dw DebugEnemyPopulationData_KihunterYellow 
    dw $0060 

EnemyName_KihunterRed:
    db "HACHI3    " 
    dw DebugEnemyPopulationData_KihunterRed 
    dw $0061 

EnemyName_RobotNoPower:
    db "ROBO2     " 
    dw DebugEnemyPopulationData_RobotNoPower 
    dw $0062 

DebugEnemyPopulationData_NoName:
    dw $FFFF 
    db $00 

DebugEnemyPopulationData_Atomic:
    dw EnemyHeaders_Atomic 
    dw $0100,$0100,$0000,$2000,$0000,$0001,$0001,$FFFF 
    db $01 

DebugEnemyPopulationData_Bang:
    dw EnemyHeaders_Bang 
    dw $0100,$0100,$0000,$2800,$0000,$BB2B,$0000 
    dw EnemyHeaders_Bang 
    dw $0100,$0100,$0000,$2800,$0000,$BB66,$0101 
    dw EnemyHeaders_Bang 
    dw $0100,$0100,$0000,$2800,$0000,$BB4A,$0000,$FFFF 
    db $01 

DebugEnemyPopulationData_PirateGreyWall:
    dw EnemyHeaders_PirateGreyWall 
    dw $002D,$01B8,$0000,$2000,$0004,$0000,$00A0,$FFFF 
    db $01 

DebugEnemyPopulationData_PirateGreyNinja:
    dw EnemyHeaders_PirateGreyNinja 
    dw $0270,$00A0,$0000,$2800,$0004,$0001,$0030,$FFFF 
    db $01 

DebugEnemyPopulationData_PirateGreyWalking:
    dw EnemyHeaders_PirateGreyWalking 
    dw $00D9,$00A0,$0000,$2000,$0004,$0000,$0050,$FFFF 
    db $01 

DebugEnemyPopulationData_Botwoon:
    dw EnemyHeaders_Botwoon 
    dw $0100,$0100,$0000,$2800,$0000,$0000,$0000,$FFFF 
    db $01 

DebugEnemyPopulationData_Boyon:
    dw EnemyHeaders_Boyon 
    dw $00E8,$00A8,$0000,$2000,$0000,$0103,$0020,$FFFF 
    db $00 

DebugEnemyPopulationData_DesgeegaLarge:
    dw EnemyHeaders_DesgeegaLarge 
    dw $0100,$0100,$0000,$2000,$0000,$8000,$0000,$FFFF 
    db $01 

DebugEnemyPopulationData_Shaktool:
    dw EnemyHeaders_Shaktool 
    dw $0110,$035C,$0000,$2000,$0000,$8000,$0000 
    dw EnemyHeaders_Shaktool 
    dw $0110,$035C,$0000,$2000,$0000,$8000,$0002 
    dw EnemyHeaders_Shaktool 
    dw $0110,$035C,$0000,$2000,$0000,$8000,$0004 
    dw EnemyHeaders_Shaktool 
    dw $0110,$035C,$0000,$2000,$0000,$8000,$0006 
    dw EnemyHeaders_Shaktool 
    dw $0110,$035C,$0000,$2000,$0000,$8000,$0008 
    dw EnemyHeaders_Shaktool 
    dw $0110,$035C,$0000,$2000,$0000,$8000,$000A 
    dw EnemyHeaders_Shaktool 
    dw $0110,$035C,$0000,$2000,$0000,$8000,$000C,$FFFF 
    db $01 

DebugEnemyPopulationData_Dragon:
    dw EnemyHeaders_Dragon 
    dw $0100,$0100,$0000,$2000,$0000,$0000,$0000 
    dw EnemyHeaders_Dragon 
    dw $0100,$0100,$0002,$2400,$0000,$0001,$0000,$FFFF 
    db $01 

DebugEnemyPopulationData_Evir:
    dw EnemyHeaders_Evir 
    dw $0100,$0100,$0000,$2000,$0000,$0000,$1010 
    dw EnemyHeaders_Evir 
    dw $0100,$0100,$0000,$2400,$0000,$0001,$0000 
    dw EnemyHeaders_EvirProjectile 
    dw $0100,$0100,$0000,$2800,$0000,$0002,$0000,$FFFF 
    db $01 

DebugEnemyPopulationData_Eye:
    dw EnemyHeaders_Eye 
    dw $0228,$0048,$0000,$2C00,$0000,$0000,$8001 
    dw EnemyHeaders_Eye 
    dw $0228,$0048,$0000,$2C00,$0000,$0000,$0000,$FFFF 
    db $00 

DebugEnemyPopulationData_Namihe:
    dw EnemyHeaders_Namihe 
    dw $00F0,$04E0,$0000,$A000,$0000,$0111,$0F05,$FFFF 
    db $01 

DebugEnemyPopulationData_Skultera:
    dw EnemyHeaders_Skultera 
    dw $0090,$00A0,$0000,$2000,$0000,$0102,$0420,$FFFF 
    db $01 

DebugEnemyPopulationData_Coven:
    dw EnemyHeaders_Coven 
    dw $0100,$0100,$0000,$6800,$0000,$0000,$0000,$FFFF 
    db $01 

DebugEnemyPopulationData_Gamet:
    dw EnemyHeaders_Gamet 
    dw $0100,$00E0,$0000,$6800,$0000,$0000,$4030 
    dw EnemyHeaders_Gamet 
    dw $0100,$00E0,$0000,$6800,$0000,$0000,$4000 
    dw EnemyHeaders_Gamet 
    dw $0100,$00E0,$0000,$6800,$0000,$0000,$4000 
    dw EnemyHeaders_Gamet 
    dw $0100,$00E0,$0000,$6800,$0000,$0000,$4000 
    dw EnemyHeaders_Gamet 
    dw $0100,$00E0,$0000,$6800,$0000,$0000,$4000,$FFFF 
    db $01 

DebugEnemyPopulationData_Geega:
    dw EnemyHeaders_Geega 
    dw $0100,$0100,$0000,$6100,$0000,$0001,$0010,$FFFF 
    db $01 

DebugEnemyPopulationData_Geruta:
    dw EnemyHeaders_Geruta 
    dw $0048,$0080,$0000,$2000,$0000,$0000,$0000 
    dw EnemyHeaders_Geruta 
    dw $0048,$0080,$0005,$2400,$0000,$8000,$0000,$FFFF 
    db $01 

UNUSED_DebugEnemyPopulationData_GRAVY_B4E55C:
    dw $FFFF 
    db $00 

DebugEnemyPopulationData_KihunterGreen:
    dw EnemyHeaders_KihunterGreen 
    dw $0100,$0100,$0000,$2800,$0000,$0001,$0000 
    dw EnemyHeaders_KihunterGreenWings 
    dw $0100,$0100,$0000,$2C00,$0000,$0020,$0000,$FFFF 
    db $01 

DebugEnemyPopulationData_YappingMaw:
    dw EnemyHeaders_YappingMaw 
    dw $0100,$0100,$0000,$2000,$0000,$0010,$0001,$FFFF 
    db $00 

DebugEnemyPopulationData_Hibashi:
    dw EnemyHeaders_Hibashi 
    dw $0100,$0100,$0000,$2500,$0000,$0025,$0000 
    dw EnemyHeaders_Hibashi 
    dw $0100,$0100,$0000,$2100,$0000,$0000,$0001,$FFFF 
    db $00 

DebugEnemyPopulationData_Choot:
    dw EnemyHeaders_Choot 
    dw $0100,$0100,$0000,$2000,$0000,$0204,$0030,$FFFF 
    db $01 

DebugEnemyPopulationData_Holtz:
    dw EnemyHeaders_Holtz 
    dw $0100,$0100,$0000,$2000,$0000,$0000,$0000 
    dw EnemyHeaders_Holtz 
    dw $0100,$0100,$0006,$2400,$0000,$8000,$0000,$FFFF 
    db $01 

DebugEnemyPopulationData_Fireflea:
    dw EnemyHeaders_Fireflea 
    dw $0600,$0060,$0000,$2000,$0000,$0001,$0108,$FFFF 
    db $01 

DebugEnemyPopulationData_HZoomer:
    dw EnemyHeaders_HZoomer 
    dw $0360,$0098,$0003,$2001,$0000,$0002,$0000,$FFFF 
    db $01 

DebugEnemyPopulationData_Kago:
    dw EnemyHeaders_Kago 
    dw $0168,$0090,$0000,$A000,$0000,$0020,$0000,$FFFF 
    db $01 

DebugEnemyPopulationData_MamaTurtle:
    dw EnemyHeaders_MamaTurtle 
    dw $0100,$0100,$0000,$A800,$0000,$0000,$0000 
    dw EnemyHeaders_BabyTurtle 
    dw $00D8,$0100,$0000,$A800,$0000,$FFFF,$0000 
    dw EnemyHeaders_BabyTurtle 
    dw $0100,$0100,$0000,$A800,$0000,$FFFF,$0000 
    dw EnemyHeaders_BabyTurtle 
    dw $0110,$0100,$0000,$A800,$0000,$0001,$0000 
    dw EnemyHeaders_BabyTurtle 
    dw $0140,$0100,$0000,$A800,$0000,$0001,$0000,$FFFF 
    db $01 

DebugEnemyPopulationData_Tripper_Kamer2:
    dw EnemyHeaders_Tripper 
    dw $0868,$00C8,$0000,$A000,$0000,$0000,$2020,$FFFF 
    db $01 

DebugEnemyPopulationData_Sciser:
    dw EnemyHeaders_Sciser 
    dw $01C0,$0098,$0003,$2000,$0000,$0001,$0000,$FFFF 
    db $01 

DebugEnemyPopulationData_FaceBlock:
    dw EnemyHeaders_FaceBlock 
    dw $0100,$0100,$0000,$A000,$0000,$0025,$0000,$FFFF 
    db $00 

DebugEnemyPopulationData_KzanTop:
    dw EnemyHeaders_KzanTop 
    dw $0480,$0400,$0000,$A000,$0000,$0030,$A070 
    dw EnemyHeaders_KzanBottom 
    dw $0480,$0408,$0000,$0100,$0000,$0000,$0000,$FFFF 
    db $00 

DebugEnemyPopulationData_Magdollite:
    dw EnemyHeaders_Magdollite 
    dw $0248,$00B0,$0000,$2800,$0000,$0000,$3A60 
    dw EnemyHeaders_Magdollite 
    dw $0248,$00B0,$0000,$2C00,$0000,$0001,$0000 
    dw EnemyHeaders_Magdollite 
    dw $0248,$00B0,$0000,$2C00,$0000,$0002,$0000,$FFFF 
    db $01 

DebugEnemyPopulationData_Mella:
    dw EnemyHeaders_Mella 
    dw $0100,$0100,$0000,$2000,$0000,$0000,$0000,$FFFF 
    db $00 

DebugEnemyPopulationData_Menu:
    dw EnemyHeaders_Menu 
    dw $0100,$0100,$0000,$2000,$0000,$0000,$0000,$FFFF 
    db $00 

DebugEnemyPopulationData_Mellow:
    dw EnemyHeaders_Mellow 
    dw $0100,$0100,$0000,$2000,$0000,$0000,$0000,$FFFF 
    db $00 

DebugEnemyPopulationData_Metaree:
    dw EnemyHeaders_Metaree 
    dw $0100,$0100,$0000,$2000,$0000,$0000,$0000,$FFFF 
    db $01 

DebugEnemyPopulationData_Mochtroid:
    dw EnemyHeaders_Mochtroid 
    dw $0100,$0100,$0000,$2000,$0000,$0000,$0000,$FFFF 
    db $01 

DebugEnemyPopulationData_Metroid:
    dw EnemyHeaders_Metroid 
    dw $0100,$0100,$0000,$2000,$0000,$0000,$0005,$FFFF 
    db $01 

DebugEnemyPopulationData_Multiviola:
    dw EnemyHeaders_Multiviola 
    dw $0078,$0058,$0000,$2000,$0000,$0060,$0001,$FFFF 
    db $00 

DebugEnemyPopulationData_MZoomer:
    dw EnemyHeaders_MZoomer 
    dw $0188,$0198,$0003,$2800,$0000,$0001,$0000,$FFFF 
    db $01 

DebugEnemyPopulationData_Alcoon:
    dw EnemyHeaders_Alcoon 
    dw $0100,$0100,$0000,$2800,$0000,$0000,$0000,$FFFF 
    db $01 

DebugEnemyPopulationData_Beetom:
    dw EnemyHeaders_Beetom 
    dw $0100,$0100,$0000,$2000,$0000,$0000,$0000,$FFFF 
    db $01 

DebugEnemyPopulationData_Sova:
    dw EnemyHeaders_Sova 
    dw $0880,$02A8,$0003,$2000,$0000,$0001,$0004,$FFFF 
    db $01 

DebugEnemyPopulationData_Oum:
    dw EnemyHeaders_Oum 
    dw $0100,$0100,$0000,$A000,$0004,$0000,$0000,$FFFF 
    db $01 

DebugEnemyPopulationData_Zero:
    dw EnemyHeaders_Zero 
    dw $00A0,$0040,$0002,$2000,$0000,$0001,$0000,$FFFF 
    db $01 

DebugEnemyPopulationData_Bull:
    dw EnemyHeaders_Bull 
    dw $0200,$0060,$0000,$2800,$0000,$0008,$0000,$FFFF 
    db $01 

DebugEnemyPopulationData_Polyp:
    dw EnemyHeaders_LavaRocks 
    dw $0100,$0100,$0000,$2500,$0000,$0000,$0000,$FFFF 
    db $01 

DebugEnemyPopulationData_Puromi:
    dw EnemyHeaders_Puromi 
    dw $0100,$0100,$0000,$2000,$0000,$1010,$2001,$FFFF 
    db $00 

DebugEnemyPopulationData_Powamp:
    dw EnemyHeaders_Powamp 
    dw $0100,$0100,$0000,$2C00,$0000,$0001,$0000 
    dw EnemyHeaders_Powamp 
    dw $0100,$0100,$0000,$2800,$0000,$0000,$0000,$FFFF 
    db $01 

DebugEnemyPopulationData_Puyo:
    dw EnemyHeaders_Puyo 
    dw $033D,$00CC,$0000,$2000,$0000,$0003,$000A,$FFFF 
    db $01 

DebugEnemyPopulationData_Reflec:
    dw EnemyHeaders_Reflec 
    dw $0168,$0048,$0000,$2000,$0000,$0000,$0000,$FFFF 
    db $00 

DebugEnemyPopulationData_Rinka:
    dw EnemyHeaders_Rinka 
    dw $0100,$0100,$0000,$6000,$0000,$0000,$0000,$FFFF 
    db $00 

DebugEnemyPopulationData_Rio:
    dw EnemyHeaders_Rio 
    dw $0100,$0100,$0000,$2000,$0000,$0000,$0000,$FFFF 
    db $01 

DebugEnemyPopulationData_Ripper:
    dw EnemyHeaders_Ripper 
    dw $0068,$01A0,$0000,$2000,$0000,$0010,$0001,$FFFF 
    db $01 

DebugEnemyPopulationData_GRipper_Ripper2:
    dw EnemyHeaders_Ripper2 
    dw $0040,$06A0,$0000,$2800,$0000,$0020,$0001,$FFFF 
    db $01 

DebugEnemyPopulationData_Robot:
    dw EnemyHeaders_Robot 
    dw $0050,$00B0,$0000,$2800,$0000,$0001,$0000,$FFFF 
    db $01 

DebugEnemyPopulationData_Boulder:
    dw EnemyHeaders_Boulder 
    dw $0400,$01B5,$0060,$2000,$0000,$0101,$20A0,$FFFF 
    db $00 

DebugEnemyPopulationData_Cacatac:
    dw EnemyHeaders_Cacatac 
    dw $03D0,$00B3,$0000,$2000,$0000,$0100,$0F01,$FFFF 
    db $01 

DebugEnemyPopulationData_Sbug_Sbug2:
    dw EnemyHeaders_Sbug 
    dw $01AD,$04E8,$0000,$2400,$0000,$E804,$0020,$FFFF 
    db $00 

DebugEnemyPopulationData_MiniKraid:
    dw EnemyHeaders_MiniKraid 
    dw $0100,$0100,$0000,$2800,$0000,$0000,$0000,$FFFF 
    db $01 

DebugEnemyPopulationData_Desgeega:
    dw EnemyHeaders_Desgeega 
    dw $0100,$0100,$0000,$2000,$0000,$0001,$0000,$FFFF 
    db $01 

DebugEnemyPopulationData_ShutterGrowing:
    dw EnemyHeaders_ShutterGrowing 
    dw $0300,$0088,$0000,$A800,$0000,$004C,$0008,$FFFF 
    db $00 

DebugEnemyPopulationData_Shutters_Kamer:
    dw EnemyHeaders_ShutterShootable 
    dw $0100,$0100,$0020,$A800,$0A0A,$2003,$0000,$FFFF 
    db $00 

DebugEnemyPopulationData_SidehopperLarge_SidehopperTourian:
    dw EnemyHeaders_SidehopperLarge 
    dw $0100,$0100,$0000,$2000,$0000,$0000,$0000,$FFFF 
    db $01 

DebugEnemyPopulationData_Skree:
    dw EnemyHeaders_Skree 
    dw $0100,$0100,$0000,$2000,$0000,$0000,$0000,$FFFF 
    db $01 

DebugEnemyPopulationData_Spark:
    dw EnemyHeaders_Spark 
    dw $0100,$0100,$0000,$2000,$0000,$0000,$0000,$FFFF 
    db $00 

DebugEnemyPopulationData_Squeept:
    dw EnemyHeaders_Squeept 
    dw $0060,$00D8,$0000,$2000,$0000,$0000,$0000 
    dw EnemyHeaders_Squeept 
    dw $0060,$00D8,$0002,$2400,$0000,$8000,$0000,$FFFF 
    db $01 

DebugEnemyPopulationData_Sidehopper:
    dw EnemyHeaders_Sidehopper 
    dw $0100,$0100,$0000,$2000,$0000,$0001,$0000,$FFFF 
    db $01 

DebugEnemyPopulationData_Stoke:
    dw EnemyHeaders_Stoke 
    dw $0C30,$01F8,$0000,$2000,$0000,$0000,$0001,$FFFF 
    db $01 

DebugEnemyPopulationData_Owtch:
    dw EnemyHeaders_Owtch 
    dw $0060,$01C8,$0000,$2000,$0000,$0301,$0002,$FFFF 
    db $01 

DebugEnemyPopulationData_Viola:
    dw EnemyHeaders_Viola 
    dw $00D8,$008A,$0003,$2001,$0000,$0002,$0006,$FFFF 
    db $01 

DebugEnemyPopulationData_Waver:
    dw EnemyHeaders_Waver 
    dw $00C9,$005C,$0000,$2000,$0000,$0001,$0000,$FFFF 
    db $01 

DebugEnemyPopulationData_Yard:
    dw EnemyHeaders_Yard 
    dw $01D0,$0098,$0003,$A004,$0000,$0001,$0000,$FFFF 
    db $01 

DebugEnemyPopulationData_Zeb:
    dw EnemyHeaders_Zeb 
    dw $0100,$0100,$0000,$6900,$0000,$0000,$0000,$FFFF 
    db $01 

DebugEnemyPopulationData_Zebbo:
    dw EnemyHeaders_Zebbo 
    dw $0100,$0100,$0000,$6900,$0000,$0002,$0000,$FFFF 
    db $01 

DebugEnemyPopulationData_Zeela:
    dw EnemyHeaders_Zeela 
    dw $0180,$008C,$0003,$2000,$0000,$0002,$0002,$FFFF 
    db $01 

DebugEnemyPopulationData_Zoa:
    dw EnemyHeaders_Zoa 
    dw $0100,$0100,$0000,$6100,$0000,$0000,$0000,$FFFF 
    db $01 

DebugEnemyPopulationData_Zoomer:
    dw EnemyHeaders_Zoomer 
    dw $00D8,$00C8,$0003,$2000,$0000,$0002,$0000,$FFFF 
    db $01 

DebugEnemyPopulationData_PirateGreenWall:
    dw EnemyHeaders_PirateGreenWall 
    dw $0100,$0100,$0000,$2000,$0004,$0001,$0030,$FFFF 
    db $01 

DebugEnemyPopulationData_PirateRedWall:
    dw EnemyHeaders_PirateRedWall 
    dw $0100,$0100,$0000,$2000,$0004,$0001,$0030,$FFFF 
    db $01 

DebugEnemyPopulationData_PirateGoldWall:
    dw EnemyHeaders_PirateGoldWall 
    dw $0100,$0100,$0000,$2000,$0004,$0001,$0030,$FFFF 
    db $01 

DebugEnemyPopulationData_PirateMagentaWall:
    dw EnemyHeaders_PirateMagentaWall 
    dw $0100,$0100,$0000,$2000,$0004,$0001,$0030,$FFFF 
    db $01 

DebugEnemyPopulationData_PirateSilverWall:
    dw EnemyHeaders_PirateSilverWall 
    dw $0100,$0100,$0000,$2000,$0004,$0001,$0030,$FFFF 
    db $01 

DebugEnemyPopulationData_PirateGreenNinja:
    dw EnemyHeaders_PirateGreenNinja 
    dw $0100,$0100,$0000,$2800,$0004,$0001,$0030,$FFFF 
    db $01 

DebugEnemyPopulationData_PirateRedNinja:
    dw EnemyHeaders_PirateRedNinja 
    dw $0100,$0100,$0000,$2800,$0004,$0001,$0030,$FFFF 
    db $01 

DebugEnemyPopulationData_PirateGoldNinja:
    dw EnemyHeaders_PirateGoldNinja 
    dw $0100,$0100,$0000,$2800,$0004,$0001,$0030,$FFFF 
    db $01 

DebugEnemyPopulationData_PirateMagentaNinja:
    dw EnemyHeaders_PirateMagentaNinja 
    dw $0100,$0100,$0000,$2800,$0004,$0001,$0030,$FFFF 
    db $01 

DebugEnemyPopulationData_PirateSilverNinja:
    dw EnemyHeaders_PirateSilverNinja 
    dw $0100,$0100,$0000,$2800,$0004,$0001,$0030,$FFFF 
    db $01 

DebugEnemyPopulationData_PirateGreenWalking:
    dw EnemyHeaders_PirateGreenWalking 
    dw $0100,$0100,$0000,$2000,$0004,$0001,$0030,$FFFF 
    db $01 

DebugEnemyPopulationData_PirateRedWalking:
    dw EnemyHeaders_PirateRedWalking 
    dw $0100,$0100,$0000,$2000,$0004,$0001,$0030,$FFFF 
    db $01 

DebugEnemyPopulationData_PirateGoldWalking:
    dw EnemyHeaders_PirateGoldWalking 
    dw $0100,$0100,$0000,$2000,$0004,$0001,$0030,$FFFF 
    db $01 

DebugEnemyPopulationData_PirateMagentaWalking:
    dw EnemyHeaders_PirateMagentaWalking 
    dw $0100,$0100,$0000,$2000,$0004,$0001,$0030,$FFFF 
    db $01 

DebugEnemyPopulationData_PirateSilverWalking:
    dw EnemyHeaders_PirateSilverWalking 
    dw $0100,$0100,$0000,$2000,$0004,$0001,$0030,$FFFF 
    db $01 

DebugEnemyPopulationData_Fune:
    dw EnemyHeaders_Fune 
    dw $00F0,$04E0,$0000,$A000,$0000,$0110,$0F05,$FFFF 
    db $01 

DebugEnemyPopulationData_KihunterYellow:
    dw EnemyHeaders_KihunterYellow 
    dw $0100,$0100,$0000,$2800,$0000,$0001,$0000 
    dw EnemyHeaders_KihunterYellowWings 
    dw $0100,$0100,$0000,$2C00,$0000,$0020,$0000,$FFFF 
    db $01 

DebugEnemyPopulationData_KihunterRed:
    dw EnemyHeaders_KihunterRed 
    dw $0100,$0100,$0000,$2800,$0000,$0001,$0000 
    dw EnemyHeaders_KihunterRedWings 
    dw $0100,$0100,$0000,$2C00,$0000,$0020,$0000,$FFFF 
    db $01 

DebugEnemyPopulationData_RobotNoPower:
    dw EnemyHeaders_RobotNoPower 
    dw $0050,$00B0,$0000,$A800,$0000,$0001,$0000,$FFFF 
    db $01 


EnemyVulnerabilities:
EnemyVulnerabilities_Default:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02 
    db $02,$02,$02,$02,$02,$02 

EnemyVulnerabilities_DesgeegaLarge:
    db $00,$00,$00,$00,$01,$01,$01,$01,$02,$02,$02,$02,$02,$02,$02,$02 
    db $02,$02,$02,$02,$02,$02 

EnemyVulnerabilities_Viola_Yard_HZoomer_Zeela_Sova_Zoomer:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$04,$04 
    db $02,$02,$02,$02,$02,$02 

EnemyVulnerabilities_PirateNinja_Grey_Green_Red_Magenta:
    db $82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$02,$02,$00,$02 
    db $02,$02,$02,$02,$80,$00 

EnemyVulnerabilities_PirateGoldNinja:
    db $80,$80,$80,$80,$81,$81,$81,$81,$82,$82,$82,$82,$02,$04,$00,$00 
    db $00,$00,$00,$02,$80,$00 

EnemyVulnerabilities_PirateSilverWall_PirateSilverWalking:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$04,$04,$00,$02 
    db $02,$02,$02,$02,$02,$02 

EnemyVulnerabilities_PirateSilverNinja:
    db $84,$84,$84,$84,$84,$84,$84,$84,$84,$84,$84,$84,$84,$84,$84,$84 
    db $84,$84,$84,$04,$84,$84 

EnemyVulnerabilities_PirateRedWall:
    db $00,$02,$04,$04,$02,$02,$04,$04,$02,$02,$04,$04,$04,$04,$02,$02 
    db $02,$02,$02,$02,$02,$02 

EnemyVulnerabilities_PirateGreyWall:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$04,$04,$00,$02 
    db $02,$02,$02,$02,$02,$02 

EnemyVulnerabilities_PirateMagentaWall:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$04,$04,$00,$02 
    db $02,$02,$02,$02,$02,$02 

EnemyVulnerabilities_PirateGreyWalking:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$04,$04,$00,$02 
    db $02,$02,$02,$02,$02,$02 

EnemyVulnerabilities_PirateGreenWalking:
    db $00,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$04,$04,$04,$02 
    db $02,$02,$02,$02,$02,$02 

EnemyVulnerabilities_PirateRedWalking:
    db $00,$02,$04,$04,$02,$02,$04,$04,$02,$02,$04,$04,$04,$04,$00,$02 
    db $02,$02,$02,$02,$02,$02 

EnemyVulnerabilities_PirateMagentaWalking:
    db $00,$00,$00,$00,$00,$00,$00,$00,$02,$02,$02,$02,$00,$00,$00,$00 
    db $02,$02,$02,$00,$02,$02 

EnemyVulnerabilities_PirateGoldWall_PirateGoldWalking:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$02,$02,$02,$02 
    db $02,$02,$02,$02,$02,$02 

EnemyVulnerabilities_KihunterGreen_KihunterGreenWings:
    db $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$04,$04,$00,$02 
    db $02,$02,$02,$02,$02,$02 

EnemyVulnerabilities_KihunterYellow_KihunterYellowWings:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$00,$02 
    db $02,$02,$02,$02,$02,$02 

EnemyVulnerabilities_KihunterRed_KihunterRedWings:
    db $00,$00,$81,$81,$81,$82,$82,$82,$82,$82,$82,$82,$00,$02,$00,$00 
    db $02,$02,$04,$82,$00,$02 

EnemyVulnerabilities_Boyon:
    db $00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$02,$02,$02 
    db $00,$00,$00,$00,$02,$02 

EnemyVulnerabilities_Metaree:
    db $00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$02,$02,$02 
    db $00,$00,$02,$00,$02,$02 

EnemyVulnerabilities_MZoomer:
    db $00,$00,$00,$00,$00,$00,$00,$00,$02,$02,$02,$02,$00,$00,$02,$02 
    db $00,$00,$02,$00,$00,$00 

EnemyVulnerabilities_Squeept_Ripper2_Ripper_Tripper:
    db $00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$02,$00,$02 
    db $00,$00,$02,$00,$00,$02 

EnemyVulnerabilities_Mella:
    db $02,$02,$04,$04,$02,$02,$04,$04,$02,$02,$04,$04,$02,$02,$02,$02 
    db $02,$02,$02,$02,$02,$02 

EnemyVulnerabilities_Dragon:
    db $00,$00,$FF,$FF,$00,$00,$FF,$FF,$02,$02,$02,$02,$02,$02,$02,$02 
    db $02,$02,$02,$02,$02,$02 

EnemyVulnerabilities_Alcoon:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$04,$04,$02,$02 
    db $02,$02,$02,$02,$02,$02 

EnemyVulnerabilities_Geruta:
    db $02,$02,$04,$04,$02,$02,$04,$04,$02,$02,$04,$04,$02,$02,$00,$02 
    db $02,$02,$02,$02,$02,$02 

EnemyVulnerabilities_Holtz:
    db $02,$02,$04,$04,$02,$02,$04,$04,$02,$02,$04,$04,$00,$02,$00,$02 
    db $02,$02,$02,$02,$02,$02 

EnemyVulnerabilities_Multiviola:
    db $02,$02,$04,$04,$02,$02,$04,$04,$02,$02,$04,$04,$02,$02,$02,$02 
    db $02,$02,$02,$02,$02,$02 

EnemyVulnerabilities_Owtch:
    db $00,$00,$00,$00,$00,$00,$00,$00,$02,$02,$02,$02,$00,$02,$00,$02 
    db $02,$02,$02,$02,$02,$02 

EnemyVulnerabilities_YappingMaw:
    db $00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$02,$00,$00 
    db $02,$02,$00,$00,$00,$02 

EnemyVulnerabilities_Fune_Magdollite:
    db $00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$02,$00,$02 
    db $02,$02,$00,$00,$00,$02 

EnemyVulnerabilities_Indestructible:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00 

EnemyVulnerabilities_Boulder:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$02,$00,$00 
    db $00,$00,$00,$00,$02,$02 

EnemyVulnerabilities_Namihe:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FF,$FF,$00,$00,$00,$00 
    db $00,$00,$02,$00,$02,$02 

EnemyVulnerabilities_NonDestructibleShutter:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$82 
    db $00,$00,$00,$00,$00,$00 

EnemyVulnerabilities_Shaktool:
    db $82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$00 
    db $00,$00,$00,$00,$00,$00 

EnemyVulnerabilities_Powamp:
    db $82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82 
    db $82,$82,$82,$02,$82,$82 

EnemyVulnerabilities_GRipper:
    db $00,$00,$00,$00,$00,$00,$80,$00,$00,$00,$00,$00,$02,$02,$00,$02 
    db $00,$02,$02,$00,$00,$02 

EnemyVulnerabilities_Metroid:
    db $00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$02,$04,$00,$01 
    db $02,$02,$02,$00,$02,$02 

EnemyVulnerabilities_Sciser_Zero:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$04,$04 
    db $02,$02,$02,$02,$02,$02 

EnemyVulnerabilities_Beetom:
    db $00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$02,$02,$04,$04 
    db $02,$02,$02,$00,$00,$02 

EnemyVulnerabilities_Bull:
    db $80,$80,$80,$80,$80,$80,$80,$80,$02,$02,$82,$82,$02,$02,$02,$02 
    db $02,$02,$02,$02,$02,$02 

EnemyVulnerabilities_ShutterDestroyable:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$82,$82,$00,$00,$00,$00 
    db $00,$00,$00,$02,$00,$00 

EnemyVulnerabilities_Evir:
    db $02,$02,$FF,$FF,$02,$02,$FF,$FF,$02,$02,$82,$82,$02,$02,$02,$02 
    db $02,$02,$02,$02,$02,$02 

EnemyVulnerabilities_EvirProjectile:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00 

EnemyVulnerabilities_MiniKraid:
    db $82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$84,$84,$82,$82 
    db $82,$82,$82,$02,$80,$80 

EnemyVulnerabilities_Bang:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$00,$00,$00,$00 
    db $00,$00,$00,$02,$00,$00 

EnemyVulnerabilities_Kago:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$02 
    db $00,$00,$00,$00,$00,$00 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyVulnerabilities_B4F03C:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$02 
    db $00,$00,$00,$02,$00,$00 

UNUSED_EnemyVulnerabilities_B4F052:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$04 
    db $00,$00,$00,$02,$00,$00 
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyVulnerabilities_Zebetite:
    db $80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$82,$82,$80,$80 
    db $80,$80,$80,$00,$80,$80 

EnemyVulnerabilities_SidehopperTourian:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$02,$00,$00 
    db $00,$00,$00,$00,$00,$00 

EnemyVulnerabilities_SporeSpawn:
    db $80,$82,$82,$82,$80,$82,$82,$82,$82,$82,$82,$82,$82,$82,$80,$80 
    db $80,$80,$80,$04,$80,$80 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyVulnerabilities_B4F0AA:
    db $82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82 
    db $82,$82,$82,$02,$82,$82 
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyVulnerabilities_BombTorizo_BombTorizoOrb:
    db $02,$02,$82,$82,$02,$02,$82,$82,$02,$02,$82,$82,$02,$04,$00,$00 
    db $00,$00,$00,$02,$00,$00 

EnemyVulnerabilities_GoldenTorizo_GoldenTorizoOrb:
    db $80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$82,$84,$80,$00 
    db $00,$00,$00,$02,$02,$00 

EnemyVulnerabilities_Phantoon_Body_Eye_Tentacles_Mouth:
    db $80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$82,$84,$00,$00 
    db $00,$00,$00,$02,$80,$80 

EnemyVulnerabilities_Crocomire_CrocomireTongue:
    db $80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$82 
    db $80,$80,$80,$00,$80,$80 

EnemyVulnerabilities_Botwoon:
    db $80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$82,$82,$80,$80 
    db $80,$80,$80,$02,$80,$80 

EnemyVulnerabilities_Corpse_BabyMetroid:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00 

EnemyVulnerabilities_Draygon_Body_Eye_Tail_Arms:
    db $80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$82,$82,$80,$80 
    db $80,$81,$80,$82,$82,$80 

EnemyVulnerabilities_Kraid:
    db $82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$80,$80 
    db $80,$80,$80,$02,$80,$80 

EnemyVulnerabilities_KraidArm_KraidFoot:
    db $80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80 
    db $80,$80,$80,$00,$80,$80 

EnemyVulnerabilities_Kraid_LintTop_LintMiddle_LintBottom:
    db $80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80 
    db $80,$80,$80,$00,$80,$80 

EnemyVulnerabilities_KraidNail_KraidNailBad:
    db $82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82 
    db $82,$00,$82,$02,$82,$82 

EnemyVulnerabilities_Ridley_RidleyCeres:
    db $80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$82,$84,$80,$82 
    db $80,$80,$80,$82,$80,$80 

EnemyVulnerabilities_MotherBrainHead:
    db $80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$82,$82,$80,$80 
    db $80,$80,$80,$02,$80,$80 

EnemyVulnerabilities_MotherBrainBody:
    db $80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80 
    db $80,$80,$80,$00,$80,$80 


EnemyDropChances_Geruta:
EnemyDropChances:
  .smallEnergy:
    db $3C 

  .bigEnergy:
    db $3C 

  .missiles:
    db $3C 

  .nothing:
    db $05 

  .superMissiles:
    db $3C 

  .powerBombs:
    db $0A 

EnemyDropChances_Rio:
    db $1E,$50,$55,$28,$0A,$0A 

EnemyDropChances_Waver:
    db $3C,$3C,$3C,$05,$3C,$0A 

EnemyDropChances_Skree:
    db $14,$03,$55,$89,$05,$05 

EnemyDropChances_Puyo:
    db $3C,$3C,$3C,$05,$0A,$3C 

EnemyDropChances_Atomic:
    db $00,$A5,$50,$00,$05,$05 

EnemyDropChances_Mochtroid:
    db $3C,$3C,$3C,$05,$3C,$0A 

EnemyDropChances_Choot:
    db $3C,$3C,$3C,$05,$3C,$0A 

EnemyDropChances_Zoomer:
    db $37,$19,$AA,$00,$05,$00 

EnemyDropChances_Zeela:
    db $37,$19,$7D,$00,$32,$00 

EnemyDropChances_Sova:
    db $50,$46,$1E,$19,$32,$00 

EnemyDropChances_Mellow:
    db $1E,$46,$50,$46,$05,$00 

EnemyDropChances_Mella:
    db $46,$1E,$50,$46,$05,$00 

EnemyDropChances_Menu:
    db $46,$14,$50,$50,$05,$00 

EnemyDropChances_Zeb:
    db $3C,$3C,$3C,$05,$3C,$0A 

EnemyDropChances_Geega:
    db $3C,$3C,$3C,$05,$3C,$0A 

EnemyDropChances_Zebbo:
    db $00,$8C,$0A,$00,$64,$05 

EnemyDropChances_Gamet:
    db $3C,$3C,$3C,$05,$3C,$0A 

EnemyDropChances_Zoa:
    db $00,$64,$46,$05,$46,$0A 

EnemyDropChances_Coven:
    db $32,$5F,$46,$00,$14,$14 

EnemyDropChances_Kago:
    db $32,$5A,$46,$05,$14,$14 

EnemyDropChances_KihunterGreen_KihunterGreenWings:
    db $32,$1E,$50,$4B,$0A,$0A 

EnemyDropChances_KihunterYellow_KihunterYellowWings:
    db $37,$50,$0A,$28,$3C,$0A 

EnemyDropChances_KihunterRed_KihunterRedWings:
    db $23,$78,$0A,$14,$3C,$0A 

EnemyDropChances_PirateGoldNinja:
    db $00,$96,$05,$00,$64,$00 

EnemyDropChances_DesgeegaLarge:
    db $50,$14,$32,$5F,$05,$05 

EnemyDropChances_PirateRedWall:
    db $0A,$14,$14,$C3,$05,$05 

EnemyDropChances_PirateRedNinja:
    db $0A,$14,$14,$C3,$05,$05 

EnemyDropChances_PirateRedWalking:
    db $0A,$14,$14,$C3,$05,$05 

EnemyDropChances_PirateGoldWall:
    db $0A,$14,$14,$C3,$05,$05 

EnemyDropChances_PirateGreyWall:
    db $0A,$2D,$C5,$01,$01,$01 

EnemyDropChances_PirateGreenWall:
    db $05,$1E,$78,$00,$64,$00 

EnemyDropChances_Powamp:
    db $01,$00,$00,$00,$FE,$00 

EnemyDropChances_Cacatac:
    db $00,$01,$00,$00,$FE,$00 

EnemyDropChances_MiniKraid:
    db $00,$01,$00,$00,$FE,$00 

EnemyDropChances_GRipper_Ripper2:
    db $00,$01,$00,$00,$FE,$00 

EnemyDropChances_Viola:
    db $01,$00,$00,$00,$00,$FE 

EnemyDropChances_Bull:
    db $00,$05,$00,$00,$00,$FA 

EnemyDropChances_Sciser:
    db $01,$64,$00,$00,$00,$9A 

EnemyDropChances_Desgeega:
    db $01,$00,$00,$00,$00,$FE 

EnemyDropChances_Fireflea:
    db $00,$01,$00,$00,$00,$FE 

EnemyDropChances_Alcoon:
    db $01,$00,$00,$00,$00,$FE 

EnemyDropChances_Zero:
    db $01,$00,$00,$00,$00,$FE 

EnemyDropChances_Beetom:
    db $01,$00,$00,$00,$00,$FE 

EnemyDropChances_HZoomer:
    db $82,$14,$00,$64,$00,$05 

EnemyDropChances_MZoomer:
    db $82,$14,$00,$64,$00,$05 

EnemyDropChances_Ripper:
    db $50,$14,$50,$41,$05,$05 

EnemyDropChances_Tripper_Kamer2:
    db $50,$50,$50,$05,$05,$05 

EnemyDropChances_Metaree:
    db $50,$19,$50,$3C,$05,$05 

EnemyDropChances_Reflec:
    db $3C,$3C,$3C,$3C,$0F,$00 

EnemyDropChances_Boyon:
    db $14,$0A,$55,$82,$05,$05 

EnemyDropChances_Sidehopper:
    db $14,$28,$55,$64,$05,$05 

EnemyDropChances_SidehopperLarge_SidehopperTourian:
    db $14,$14,$37,$64,$37,$05 

EnemyDropChances_Skultera:
    db $50,$1E,$46,$46,$05,$00 

EnemyDropChances_Oum:
    db $46,$1E,$46,$4B,$05,$05 

EnemyDropChances_Yard:
    db $55,$50,$00,$50,$00,$0A 

EnemyDropChances_Botwoon:
    db $00,$82,$3C,$05,$1E,$1E 

EnemyDropChances_Owtch:
    db $50,$50,$50,$05,$05,$05 

EnemyDropChances_Evir_EvirProjectile:
    db $50,$50,$50,$05,$05,$05 

EnemyDropChances_Holtz:
    db $00,$78,$32,$00,$32,$23 

EnemyDropChances_Squeept:
    db $32,$32,$32,$05,$32,$32 

EnemyDropChances_Multiviola:
    db $46,$1E,$4B,$46,$05,$05 

EnemyDropChances_Dragon:
    db $32,$32,$46,$4B,$05,$05 

EnemyDropChances_Metroid:
    db $19,$32,$5A,$0A,$32,$1E 

EnemyDropChances_Rinka:
    db $00,$00,$00,$FF,$00,$00 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyDropChances_B4F37A:
    db $00,$82,$3C,$05,$1E,$1E 
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyDropChances_Bang:
    db $2D,$50,$50,$1E,$0A,$0A 

EnemyDropChances_PirateGreyNinja:
    db $32,$78,$50,$00,$05,$00 

EnemyDropChances_PirateGreyWalking:
    db $32,$78,$50,$00,$05,$00 

EnemyDropChances_PirateGreenNinja:
    db $32,$19,$00,$19,$9B,$00 

EnemyDropChances_PirateGreenWalking:
    db $32,$1E,$64,$2D,$14,$0A 

EnemyDropChances_PirateGoldWalking:
    db $32,$78,$50,$00,$05,$00 

EnemyDropChances_PirateMagentaWall:
    db $1E,$46,$50,$46,$05,$00 

EnemyDropChances_PirateMagentaNinja:
    db $32,$78,$50,$00,$05,$00 

EnemyDropChances_PirateMagentaWalking:
    db $32,$78,$50,$00,$05,$00 

EnemyDropChances_Stoke:
    db $50,$50,$50,$05,$05,$05 

EnemyDropChances_MamaTurtle_BabyTurtle:
    db $50,$50,$50,$05,$05,$05 

EnemyDropChances_ShipTop_ShipBottomEntrance:
    db $00,$00,$00,$FF,$00,$00 

EnemyDropChances_Shaktool:
    db $50,$50,$50,$05,$05,$05 

EnemyDropChances_Eye:
    db $50,$50,$50,$05,$05,$05 

EnemyDropChances_Fune:
    db $50,$50,$50,$05,$05,$05 

EnemyDropChances_Namihe:
    db $50,$50,$50,$05,$05,$05 

EnemyDropChances_YappingMaw:
    db $50,$50,$50,$05,$05,$05 

EnemyDropChances_Magdollite:
    db $50,$50,$50,$05,$05,$05 

EnemyDropChances_Robot:
    db $50,$50,$50,$05,$05,$05 

EnemyDropChances_RobotNoPower:
    db $50,$50,$50,$05,$05,$05 

EnemyDropChances_MotherBrainBody_BombTorizo:
    db $32,$32,$32,$00,$32,$37 

EnemyDropChances_BombTorizoOrb:
    db $74,$14,$41,$36,$00,$00 

EnemyDropChances_GoldenTorizo:
    db $32,$32,$32,$00,$32,$37 

EnemyDropChances_GoldenTorizoOrb:
    db $1E,$1E,$32,$3C,$55,$00 

EnemyDropChances_SporeSpawn:
    db $32,$32,$32,$00,$32,$37 

EnemyDropChances_SporeSpawnStalk:
    db $0A,$14,$C8,$19,$00,$00 

EnemyDropChances_Kraid:
    db $32,$32,$32,$00,$32,$37 

EnemyDropChances_KraidNail_KraidFoot:
    db $0A,$23,$C8,$00,$0A,$00 

EnemyDropChances_CrocomireTongue:
    db $00,$0A,$DC,$05,$14,$00 

EnemyDropChances_Crocomire:
    db $00,$78,$64,$05,$14,$0A 

EnemyDropChances_Phantoon_Body_Tentacles_Mouth:
    db $32,$32,$32,$00,$32,$37 

EnemyDropChances_PhantoonEye:
    db $14,$14,$64,$69,$0A,$00 

EnemyDropChances_DraygonBody_DraygonTail_DraygonArms:
    db $32,$32,$32,$00,$32,$37 

EnemyDropChances_DraygonEye:
    db $05,$1E,$6E,$64,$05,$05 

EnemyDropChances_Ridley_RidleyCeres:
    db $32,$32,$32,$00,$32,$37 

EnemyDropChances_NoobTubeCrack_Chozo:
    db $00,$00,$00,$FF,$00,$00 

EnemyDropChances_Spark:
    db $00,$00,$00,$FF,$00,$00 

EnemyDropChances_FaceBlock:
    db $00,$00,$00,$FF,$00,$00 

EnemyDropChances_Puromi:
    db $00,$00,$00,$FF,$00,$00 

EnemyDropChances_Boulder:
    db $00,$00,$00,$FF,$00,$00 

EnemyDropChances_KzanTop_KzanBottom:
    db $00,$00,$00,$FF,$00,$00 

EnemyDropChances_Hibashi:
    db $00,$00,$00,$FF,$00,$00 

EnemyDropChances_Sbug_Sbug2:
    db $00,$00,$00,$FF,$00,$00 

EnemyDropChances_Etecoon_EtecoonEscape:
    db $00,$00,$00,$FF,$00,$00 

EnemyDropChances_Steam_Dachora_DachoraEscape:
    db $00,$00,$00,$FF,$00,$00 

EnemyDropChances_Polyp:
    db $00,$00,$00,$FF,$00,$00 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyDropChances_B4F494:
    db $00,$00,$00,$FF,$00,$00 
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyDropChances_MotherBrainHead:
    db $00,$00,$00,$FF,$00,$00 

EnemyDropChances_Shutter_Kamer_BabyMetroidCutscene:
    db $00,$00,$00,$FF,$00,$00 

EnemyDropChances_PirateSilverWall:
    db $00,$00,$00,$FF,$00,$00 

EnemyDropChances_PirateSilverNinja:
    db $00,$00,$00,$FF,$00,$00 

EnemyDropChances_PirateSilverWalking:
    db $00,$00,$00,$FF,$00,$00 

Freespace_BankB4_F4B8: 
; $B48 bytes
