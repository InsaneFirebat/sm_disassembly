
org $B48000


; see labels.asm for EnemySets:
;;; $8000: Enemy sets ;;;
EnemySets_Draygon_1_MotherBrain_2:
    dw $FFFF

EnemySetName_EastOcean:
    db "SF1_10 "

EnemySets_EastOcean:
    dw EnemyHeaders_Choot,$0001
    dw EnemyHeaders_Skultera,$0002
    dw EnemyHeaders_Kamer2,$0003
    dw $FFFF
    db $00

EnemySetName_CrateriaPowerBombs:
    db "sf1_04 "

EnemySets_CrateriaPowerBombs:
    dw EnemyHeaders_Alcoon,$0001
    dw EnemyHeaders_Zero,$0001
    dw $FFFF
    db $00

EnemySetName_Terminator:
    db "sf2_06 "

EnemySets_Terminator:
    dw EnemyHeaders_Waver,$0001
    dw EnemyHeaders_Zoomer,$0002
    dw $FFFF
    db $00

EnemySetName_FinalMissileBombway_1:
    db "SF2_12a"

EnemySets_FinalMissileBombway_1:
    dw EnemyHeaders_FaceBlock,$0007
    dw EnemyHeaders_Stoke,$0007
    dw $FFFF
    db $00

EnemySetName_FinalMissileBombway_0:
    db "SF2_12 "

EnemySets_FinalMissileBombway_0:
    dw EnemyHeaders_FaceBlock,$0007
    dw EnemyHeaders_Stoke,$0007
    dw $FFFF
    db $00

EnemySetName_Parlor_1:
    db "sf1_02A"

EnemySets_Parlor_1:
    dw EnemyHeaders_Zoomer,$0001
    dw EnemyHeaders_Skree,$0002
    dw EnemyHeaders_Ripper,$0003
    dw $FFFF
    db $00

EnemySetName_Flyway_0_1:
    db "sf2_04 "

EnemySets_Flyway_0_1:
    dw EnemyHeaders_Waver,$0001
    dw EnemyHeaders_Mellow,$0002
    dw $FFFF
    db $00

EnemySetName_Pit_1:
    db "sf2_01A"

EnemySets_Pit_1:
    dw EnemyHeaders_PirateGreyWalking,$0001
    dw EnemyHeaders_PirateGreyWall,$0002
    dw $FFFF
    db $00

EnemySetName_GauntletEntrance:
    db "sf1_01 "

EnemySets_GauntletEntrance:
    dw EnemyHeaders_YappingMaw,$0001
    dw EnemyHeaders_Waver,$0002
    dw $FFFF
    db $00

EnemySetName_BombTorizo_0_1:
    db "sf2_03 "

EnemySets_BombTorizo_0_1:
    dw EnemyHeaders_BombTorizo,$0001
    dw $FFFF
    db $00

EnemySetName_GreenPiratesShaft:
    db "sf2_10 "

EnemySets_GreenPiratesShaft:
    dw EnemyHeaders_PirateGreenWalking,$0001
    dw EnemyHeaders_Beetom,$0002
    dw $FFFF
    db $00

EnemySetName_GreenBrinstarElev:
    db "sf2_07 "

EnemySets_GreenBrinstarElev:
    dw $FFFF
    db $00

EnemySetName_FinalMissile_0:
    db "SF2_13 "

EnemySets_FinalMissile_0:
    dw EnemyHeaders_Eye,$0001
    dw $FFFF
    db $00

EnemySetName_CrateriaMap:
    db "sf2_09 "

EnemySets_CrateriaMap:
    dw EnemyHeaders_BombTorizo,$0001
    dw $FFFF
    db $00

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemySetName_B480F9:
    db "SF2_14 "

UNUSED_EnemySets_B480F9:
    dw EnemyHeaders_FaceBlock,$0001
    dw $FFFF
    db $00
endif ; !FEATURE_KEEP_UNREFERENCED

EnemySetName_FinalMissile_1:
    db "SF2_13a"

EnemySets_FinalMissile_1:
    dw $FFFF
    db $00

EnemySetName_Climb_2:
    db "sf2_00 "

EnemySets_Climb_2:
    dw EnemyHeaders_PirateSilverNinja,$0002
    dw $FFFF
    db $00

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemySetName_B4811F:
    db "sf1_03 "

UNUSED_EnemySets_B4811F:
    dw $FFFF
    db $00
endif ; !FEATURE_KEEP_UNREFERENCED

EnemySetName_CrateriaSave:
    db "SF1_05 "

EnemySets_CrateriaSave:
    dw $FFFF
    db $00

EnemySetName_ForgottenHighwayElbow:
    db "SF1_13 "

EnemySets_ForgottenHighwayElbow:
    dw EnemyHeaders_FaceBlock,$0001
    dw $FFFF
    db $00

EnemySetName_Moat:
    db "SF1_15 "

EnemySets_Moat:
    dw EnemyHeaders_FaceBlock,$0001
    dw $FFFF
    db $00

EnemySetName_Climb_0:
    db "sf2_00 "

EnemySets_Climb_0:
    dw EnemyHeaders_Sbug,$0007
    dw EnemyHeaders_FaceBlock,$0007
    dw $FFFF
    db $00

EnemySetName_WestOcean:
    db "SF1_06 "

EnemySets_WestOcean:
    dw EnemyHeaders_Skultera,$0001
    dw EnemyHeaders_Zeb,$0002
    dw EnemyHeaders_GRipper,$0003
    dw EnemyHeaders_Tripper,$0007
    dw $FFFF
    db $00

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemySetName_B4817B:
    db "SF1_20 "

UNUSED_EnemySets_B4817B:
    dw $FFFF
    db $00
endif ; !FEATURE_KEEP_UNREFERENCED

EnemySetName_Parlor_0:
    db "sf1_02 "

EnemySets_Parlor_0:
    dw EnemyHeaders_Sbug,$0007
    dw $FFFF
    db $00

EnemySetName_LandingSite_0_1_2:
    db "sf1_00 "

EnemySets_LandingSite_0_1_2:
    dw EnemyHeaders_ShipTop,$0002
    dw EnemyHeaders_ShipBottomEntrance,$0007
    dw $FFFF
    db $00

EnemySetName_CrateriaSuper:
    db "SF2_11 "

EnemySets_CrateriaSuper:
    dw EnemyHeaders_Boyon,$0001
    dw EnemyHeaders_YappingMaw,$0002
    dw $FFFF
    db $00

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemySetName_B481B7:
    db "SF1_19 "

UNUSED_EnemySets_B481B7:
    dw $FFFF
    db $00
endif ; !FEATURE_KEEP_UNREFERENCED

EnemySetName_PreBowling:
    db "SF1_18 "

EnemySets_PreBowling:
    dw EnemyHeaders_HZoomer,$0001
    dw EnemyHeaders_Sova,$0001
    dw $FFFF
    db $00

EnemySetName_Climb_1:
    db "sf2_00A"

EnemySets_Climb_1:
    dw EnemyHeaders_PirateGreyWall,$0001
    dw $FFFF
    db $00

EnemySetName_BowlingAlleyPath:
    db "SF1_07 "

EnemySets_BowlingAlleyPath:
    dw EnemyHeaders_Waver,$0001
    dw EnemyHeaders_Choot,$0007
    dw $FFFF
    db $00

EnemySetName_RedBinstarElev:
    db "SF1_16 "

EnemySets_RedBinstarElev:
    dw $FFFF
    db $00

EnemySetName_GauntletETank:
    db "SF1_17 "

EnemySets_GauntletETank:
    dw EnemyHeaders_YappingMaw,$0001
    dw EnemyHeaders_Zebbo,$0002
    dw $FFFF
    db $00

EnemySetName_Pit_0:
    db "sf2_01 "

EnemySets_Pit_0:
    dw EnemyHeaders_Sbug,$0007
    dw EnemyHeaders_FaceBlock,$0007
    dw $FFFF
    db $00

EnemySetName_CrabMaze:
    db "SF1_12 "

EnemySets_CrabMaze:
    dw EnemyHeaders_Sciser,$0007
    dw EnemyHeaders_Puyo,$0007
    dw $FFFF
    db $00

EnemySetName_CrateriaTube:
    db "SF1_14 "

EnemySets_CrateriaTube:
    dw $FFFF
    db $00

EnemySetName_ForgottenHighwayKagos:
    db "SF1_11 "

EnemySets_ForgottenHighwayKagos:
    dw EnemyHeaders_Kago,$0001
    dw $FFFF
    db $00

EnemySetName_ElevToBlueBrinstar:
    db "sf2_02 "

EnemySets_ElevToBlueBrinstar:
    dw $FFFF
    db $00

EnemySetName_ForgottenHighwayElev:
    db "SF1_09 "

EnemySets_ForgottenHighwayElev:
    dw $FFFF
    db $00

EnemySetName_PreMapFlyway:
    db "sf2_05 "

EnemySets_PreMapFlyway:
    dw EnemyHeaders_Mellow,$0001
    dw EnemyHeaders_Rio,$0002
    dw $FFFF
    db $00

EnemySetName_LowerMushrooms:
    db "sf2_08 "

EnemySets_LowerMushrooms:
    dw EnemyHeaders_Kago,$0002
    dw EnemyHeaders_MZoomer,$0003
    dw $FFFF
    db $00

EnemySetName_LandingSite_3:
    db "sf1_00 "

EnemySets_LandingSite_3:
    dw EnemyHeaders_ShipTop,$0002
    dw EnemyHeaders_ShipBottomEntrance,$0007
    dw $FFFF
    db $00

EnemySetName_Parlor_2:
    db "sf1_02 "

EnemySets_Parlor_2:
    dw EnemyHeaders_Sbug,$0007
    dw $FFFF
    db $00

EnemySetName_BombTorizo_2:
    db "sf2_03 "

EnemySets_BombTorizo_2:
    dw EnemyHeaders_EtecoonEscape,$0001
    dw EnemyHeaders_DachoraEscape,$0007
    dw $FFFF
    db $00

EnemySetName_Flyway_2:
    db "sf2_04 "

EnemySets_Flyway_2:
    dw $FFFF
    db $00

EnemySetName_CrateriaKihunter:
    db "SF1_08 "

EnemySets_CrateriaKihunter:
    dw EnemyHeaders_KihunterGreen,$0001
    dw EnemyHeaders_Sciser,$0002
    dw EnemyHeaders_Zero,$0002
    dw $FFFF
    db $00

EnemySetName_BrinstarPreMap:
    db "bl1_02 "

EnemySets_BrinstarPreMap:
    dw EnemyHeaders_Sidehopper,$0001
    dw EnemyHeaders_Zeela,$0002
    dw $FFFF
    db $00

EnemySetName_GreenBrinstarMap:
    db "bl1_05 "

EnemySets_GreenBrinstarMap:
    dw $FFFF
    db $00

EnemySetName_GreenBrinstarMissileRefill:
    db "bl1_07 "

EnemySets_GreenBrinstarMissileRefill:
    dw $FFFF
    db $00

EnemySetName_SporeSpawnKihunters:
    db "BL1_10 "

EnemySets_SporeSpawnKihunters:
    dw EnemyHeaders_KihunterGreen,$0007
    dw $FFFF
    db $00

EnemySetName_EtecoonSuper:
    db "BL1_20 "

EnemySets_EtecoonSuper:
    dw $FFFF
    db $00

EnemySetName_DachoraEnergyRefill:
    db "BL1_21 "

EnemySets_DachoraEnergyRefill:
    dw EnemyHeaders_FaceBlock,$0001
    dw $FFFF
    db $00

EnemySetName_SporeSpawnFarming:
    db "BL1_22 "

EnemySets_SporeSpawnFarming:
    dw EnemyHeaders_Zeb,$0001
    dw EnemyHeaders_Zeela,$0002
    dw $FFFF
    db $00

EnemySetName_Statues:
    db "BL2_19 "

EnemySets_Statues:
    dw EnemyHeaders_TourianStatue,$0001
    dw EnemyHeaders_TourianStatueGhost,$D003
    dw $FFFF
    db $00

EnemySetName_HopperETank:
    db "BL1_26 "

EnemySets_HopperETank:
    dw $FFFF
    db $00

EnemySetName_BetaPowerBomb:
    db "BL2_05 "

EnemySets_BetaPowerBomb:
    dw EnemyHeaders_YappingMaw,$0001
    dw EnemyHeaders_SidehopperLarge,$0002
    dw $FFFF
    db $00

EnemySetName_WaterwayETank:
    db "BL1_23 "

EnemySets_WaterwayETank:
    dw EnemyHeaders_Skultera,$0001
    dw EnemyHeaders_Puyo,$0002
    dw EnemyHeaders_Zero,$0003
    dw $FFFF
    db $00

EnemySetName_ConstructionZone_1:
    db "BL1_15A"

EnemySets_ConstructionZone_1:
    dw EnemyHeaders_Zoomer,$0001
    dw EnemyHeaders_FaceBlock,$0002
    dw $FFFF
    db $00

EnemySetName_BlueBrinstarETank_1:
    db "BL1_16A"

EnemySets_BlueBrinstarETank_1:
    dw EnemyHeaders_FaceBlock,$0001
    dw EnemyHeaders_Zoomer,$0002
    dw EnemyHeaders_Skree,$0003
    dw EnemyHeaders_Rio,$0007
    dw $FFFF
    db $00

EnemySetName_NoobBridge:
    db "BL1_17 "

EnemySets_NoobBridge:
    dw EnemyHeaders_Cacatac,$0001
    dw EnemyHeaders_Zeela,$0002
    dw $FFFF
    db $00

EnemySetName_MorphBall_1:
    db "BL1_14A"

EnemySets_MorphBall_1:
    dw EnemyHeaders_SidehopperLarge,$0002
    dw EnemyHeaders_FaceBlock,$0007
    dw $FFFF
    db $00

EnemySetName_WarehouseSave:
    db "BL2_22 "

EnemySets_WarehouseSave:
    dw $FFFF
    db $00

EnemySetName_MorphBall_0:
    db "BL1_14 "

EnemySets_MorphBall_0:
    dw EnemyHeaders_Eye,$0007
    dw EnemyHeaders_FaceBlock,$0007
    dw $FFFF
    db $00

EnemySetName_WarehouseZeela:
    db "BL2_10 "

EnemySets_WarehouseZeela:
    dw EnemyHeaders_Zeela,$0001
    dw $FFFF
    db $00

EnemySetName_RedTower:
    db "BL2_00 "

EnemySets_RedTower:
    dw EnemyHeaders_Ripper,$0001
    dw EnemyHeaders_Beetom,$0002
    dw EnemyHeaders_Geega,$0003
    dw $FFFF
    db $00

EnemySetName_BlueBrinstarBoulders:
    db "bl1_28 "

EnemySets_BlueBrinstarBoulders:
    dw EnemyHeaders_Boulder,$0001
    dw $FFFF
    db $00

EnemySetName_BillyMays:
    db "bl1_29 "

EnemySets_BillyMays:
    dw $FFFF
    db $00

EnemySetName_BigPinkSaveRoom:
    db "bl1_27 "

EnemySets_BigPinkSaveRoom:
    dw $FFFF
    db $00

EnemySetName_BigPink:
    db "BL1_09 "

EnemySets_BigPink:
    dw EnemyHeaders_Rio,$0001
    dw EnemyHeaders_Sidehopper,$0002
    dw EnemyHeaders_Zeb,$0003
    dw $FFFF
    db $00

EnemySetName_EtecoonSave:
    db "bl1_31 "

EnemySets_EtecoonSave:
    dw $FFFF
    db $00

EnemySetName_BelowSpazer:
    db "BL2_08 "

EnemySets_BelowSpazer:
    dw EnemyHeaders_YappingMaw,$0001
    dw EnemyHeaders_Cacatac,$0002
    dw $FFFF
    db $00

EnemySetName_GreenBrinstarSave:
    db "bl1_30 "

EnemySets_GreenBrinstarSave:
    dw $FFFF
    db $00

EnemySetName_Spazer:
    db "BL2_09 "

EnemySets_Spazer:
    dw $FFFF
    db $00

EnemySetName_PinkBrinstarPowerBombs:
    db "BL1_12 "

EnemySets_PinkBrinstarPowerBombs:
    dw EnemyHeaders_ShutterShootable,$0001
    dw EnemyHeaders_Metaree,$0001
    dw EnemyHeaders_SidehopperLarge,$0002
    dw $FFFF
    db $00

EnemySetName_RedTowerRefill:
    db "BL2_17 "

EnemySets_RedTowerRefill:
    dw $FFFF
    db $00

EnemySetName_KraidRefill:
    db "BL2_18 "

EnemySets_KraidRefill:
    dw $FFFF
    db $00

EnemySetName_VariaSuit:
    db "BL2_21 "

EnemySets_VariaSuit:
    dw $FFFF
    db $00

EnemySetName_RedBrinstarSave:
    db "BL2_23 "

EnemySets_RedBrinstarSave:
    dw $FFFF
    db $00

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemySetName_B484AD:
    db "BL1_24a"

UNUSED_EnemySets_B484AD:
    dw $FFFF
    db $00
endif ; !FEATURE_KEEP_UNREFERENCED

EnemySetName_BlueBrinstarETank_0:
    db "BL1_16 "

EnemySets_BlueBrinstarETank_0:
    dw EnemyHeaders_Eye,$0007
    dw EnemyHeaders_FaceBlock,$0007
    dw $FFFF
    db $00

EnemySetName_GreenBrinstarFirefleas:
    db "bl1_06 "

EnemySets_GreenBrinstarFirefleas:
    dw EnemyHeaders_Fireflea,$0002
    dw $FFFF
    db $00

EnemySetName_GreenBrinstarBeetoms:
    db "BL1_18 "

EnemySets_GreenBrinstarBeetoms:
    dw EnemyHeaders_Beetom,$0001
    dw $FFFF
    db $00

EnemySetName_EtecoonETank:
    db "BL1_19 "

EnemySets_EtecoonETank:
    dw EnemyHeaders_Zebbo,$0001
    dw EnemyHeaders_Beetom,$0002
    dw $FFFF
    db $00

EnemySetName_PinkBrinstarHoppers:
    db "BL1_25 "

EnemySets_PinkBrinstarHoppers:
    dw EnemyHeaders_SidehopperLarge,$0001
    dw EnemyHeaders_Sidehopper,$0002
    dw EnemyHeaders_ShutterShootable,$0003
    dw $FFFF
    db $00

EnemySetName_WarehouseETank:
    db "BL2_11 "

EnemySets_WarehouseETank:
    dw EnemyHeaders_Reflec,$0001
    dw EnemyHeaders_Beetom,$0002
    dw $FFFF
    db $00

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemySetName_B4851F:
    db "BL2_20a"

UNUSED_EnemySets_B4851F:
    dw $FFFF
    db $00
endif ; !FEATURE_KEEP_UNREFERENCED

EnemySetName_WarehouseEntrance:
    db "BL2_20 "

EnemySets_WarehouseEntrance:
    dw $FFFF
    db $00

EnemySetName_WarehouseKihunter:
    db "BL2_12 "

EnemySets_WarehouseKihunter:
    dw EnemyHeaders_KihunterGreen,$0001
    dw $FFFF
    db $00

EnemySetName_GreenBrinstarMainShaft:
    db "bl1_00 "

EnemySets_GreenBrinstarMainShaft:
    dw EnemyHeaders_Etecoon,$0001
    dw EnemyHeaders_Zeela,$0002
    dw EnemyHeaders_Ripper2,$0003
    dw $FFFF
    db $00

EnemySetName_SporeSpawnSuper:
    db "bl1_01 "

EnemySets_SporeSpawnSuper:
    dw EnemyHeaders_Zeb,$0001
    dw $FFFF
    db $00

EnemySetName_EarlySupers:
    db "bl1_03 "

EnemySets_EarlySupers:
    dw EnemyHeaders_Sidehopper,$0001
    dw EnemyHeaders_ShutterGrowing,$0002
    dw EnemyHeaders_Waver,$0003
    dw EnemyHeaders_Zeb,$0007
    dw $FFFF
    db $00

EnemySetName_RedBrinstarFirefleas:
    db "BL2_01 "

EnemySets_RedBrinstarFirefleas:
    dw EnemyHeaders_Fireflea,$0001
    dw EnemyHeaders_Waver,$0002
    dw EnemyHeaders_YappingMaw,$0003
    dw $FFFF
    db $00

EnemySetName_ConstructionZone_0:
    db "BL1_15 "

EnemySets_ConstructionZone_0:
    dw EnemyHeaders_Sbug,$0007
    dw EnemyHeaders_FaceBlock,$0007
    dw $FFFF
    db $00

EnemySetName_GreenHillZone:
    db "BL1_13 "

EnemySets_GreenHillZone:
    dw EnemyHeaders_Sidehopper,$0001
    dw EnemyHeaders_Geega,$0002
    dw $FFFF
    db $00

EnemySetName_Dachora:
    db "BL1_08 "

EnemySets_Dachora:
    dw EnemyHeaders_Zeela,$0001
    dw EnemyHeaders_Metaree,$0002
    dw EnemyHeaders_Rio,$0003
    dw EnemyHeaders_Dachora,$0007
    dw $FFFF
    db $00

EnemySetName_Hellway:
    db "BL2_03 "

EnemySets_Hellway:
    dw EnemyHeaders_Zeela,$0001
    dw EnemyHeaders_Zebbo,$0002
    dw $FFFF
    db $00

EnemySetName_FirstMissile:
    db "BL1_24 "

EnemySets_FirstMissile:
    dw $FFFF
    db $00

EnemySetName_Kraid:
    db "BL2_15 "

EnemySets_Kraid:
    dw EnemyHeaders_Kraid,$0007
    dw $FFFF
    db $00

EnemySetName_BrinstarReserveTank:
    db "bl1_04 "

EnemySets_BrinstarReserveTank:
    dw $FFFF
    db $00

EnemySetName_XrayScope:
    db "BL2_02 "

EnemySets_XrayScope:
    dw EnemyHeaders_ShutterShootable,$0001
    dw $FFFF
    db $00

EnemySetName_StatuesHallway:
    db "BL2_16 "

EnemySets_StatuesHallway:
    dw $FFFF
    db $00

EnemySetName_AlphaPowerBomb:
    db "BL2_06 "

EnemySets_AlphaPowerBomb:
    dw EnemyHeaders_Boyon,$0001
    dw $FFFF
    db $00

EnemySetName_KraidEyeDoor:
    db "BL2_14 "

EnemySets_KraidEyeDoor:
    dw EnemyHeaders_Zeb,$0001
    dw EnemyHeaders_Sbug,$0002
    dw $FFFF
    db $00

EnemySetName_Caterpillar:
    db "BL2_04 "

EnemySets_Caterpillar:
    dw EnemyHeaders_Zero,$0002
    dw EnemyHeaders_Cacatac,$0003
    dw $FFFF
    db $00

EnemySetName_MiniKraid:
    db "BL2_13 "

EnemySets_MiniKraid:
    dw EnemyHeaders_PirateGreenWalking,$0001
    dw EnemyHeaders_MiniKraid,$0003
    dw $FFFF
    db $00

EnemySetName_SporeSpawn:
    db "BL1_11 "

EnemySets_SporeSpawn:
    dw EnemyHeaders_SporeSpawn,$0001
    dw $FFFF
    db $00

EnemySetName_SkreeBoost:
    db "BL2_07 "

EnemySets_SkreeBoost:
    dw EnemyHeaders_Skree,$0001
    dw EnemyHeaders_Boyon,$0007
    dw $FFFF
    db $00

EnemySetName_GrappleTutorial3:
    db "NO1_19 "

EnemySets_GrappleTutorial3:
    dw EnemyHeaders_Gamet,$0001
    dw EnemyHeaders_Puyo,$0002
    dw $FFFF
    db $00

EnemySetName_PostCrocShaft:
    db "NO1_17 "

EnemySets_PostCrocShaft:
    dw EnemyHeaders_Viola,$0001
    dw $FFFF
    db $00

EnemySetName_MetalPirates:
    db "NO2_18 "

EnemySets_MetalPirates:
    dw EnemyHeaders_PirateGoldNinja,$0001
    dw $FFFF
    db $00

EnemySetName_AcidStatue:
    db "NO2_00 "

EnemySets_AcidStatue:
    dw EnemyHeaders_Chozo,$0001
    dw EnemyHeaders_Magdollite,$0003
    dw EnemyHeaders_Holtz,$0007
    dw $FFFF
    db $00

EnemySetName_PurpleFarming:
    db "NO1_44 "

EnemySets_PurpleFarming:
    dw EnemyHeaders_Gamet,$0001
    dw $FFFF
    db $00

EnemySetName_IceBeamGate:
    db "NO1_04 "

EnemySets_IceBeamGate:
    dw EnemyHeaders_ShutterGrowing,$0001
    dw EnemyHeaders_Dessgeega,$0002
    dw EnemyHeaders_Mella,$0003
    dw EnemyHeaders_Sova,$0007
    dw $FFFF
    db $00

EnemySetName_SpikyAcidSnakesTunnel:
    db "NO1_42 "

EnemySets_SpikyAcidSnakesTunnel:
    dw EnemyHeaders_YappingMaw,$0001
    dw $FFFF
    db $00

EnemySetName_RedKihunterShaft:
    db "NO2_16 "

EnemySets_RedKihunterShaft:
    dw EnemyHeaders_KihunterRed,$0001
    dw EnemyHeaders_Reflec,$0002
    dw $FFFF
    db $00

EnemySetName_FastRipper:
    db "NO2_03 "

EnemySets_FastRipper:
    dw EnemyHeaders_Ripper2,$0001
    dw $FFFF
    db $00

EnemySetName_WaveBeam:
    db "NO1_31 "

EnemySets_WaveBeam:
    dw $FFFF
    db $00

EnemySetName_FastPillarsSetup:
    db "NO2_07 "

EnemySets_FastPillarsSetup:
    dw EnemyHeaders_PirateGoldWall,$0001
    dw EnemyHeaders_PirateGoldWalking,$0002
    dw EnemyHeaders_Viola,$0003
    dw $FFFF
    db $00

EnemySetName_LowerNorfairElev:
    db "NO1_38 "

EnemySets_LowerNorfairElev:
    dw $FFFF
    db $00

EnemySetName_LNSave:
    db "NO2_23 "

EnemySets_LNSave:
    dw $FFFF
    db $00

EnemySetName_UpperNorfairRefill:
    db "NO1_43 "

EnemySets_UpperNorfairRefill:
    dw $FFFF
    db $00

EnemySetName_NorfairMap:
    db "NO1_46 "

EnemySets_NorfairMap:
    dw $FFFF
    db $00

EnemySetName_MickeyMouse:
    db "NO2_09 "

EnemySets_MickeyMouse:
    dw EnemyHeaders_DessgeegaLarge,$0001
    dw EnemyHeaders_Multiviola,$0002
    dw $FFFF
    db $00

EnemySetName_GTEnergyRefill:
    db "NO2_04 "

EnemySets_GTEnergyRefill:
    dw $FFFF
    db $00

EnemySetName_Ridley:
    db "NO2_05 "

EnemySets_Ridley:
    dw EnemyHeaders_Ridley,$0001
    dw EnemyHeaders_RidleyExplosion,$E001
    dw $FFFF
    db $00

EnemySetName_PostCrocPowerBombs:
    db "NO1_16 "

EnemySets_PostCrocPowerBombs:
    dw $FFFF
    db $00

EnemySetName_IceBeam:
    db "NO1_06 "

EnemySets_IceBeam:
    dw $FFFF
    db $00

EnemySetName_HiJumpBoots:
    db "NO1_11 "

EnemySets_HiJumpBoots:
    dw $FFFF
    db $00

EnemySetName_PostCrocSave:
    db "NO1_15 "

EnemySets_PostCrocSave:
    dw $FFFF
    db $00

EnemySetName_FrogSpeedway:
    db "NO1_48 "

EnemySets_FrogSpeedway:
    dw EnemyHeaders_Beetom,$0001
    dw $FFFF
    db $00

EnemySetName_RisingTide:
    db "NO1_40 "

EnemySets_RisingTide:
    dw EnemyHeaders_Squeept,$0001
    dw EnemyHeaders_Sova,$0002
    dw EnemyHeaders_Dragon,$0003
    dw $FFFF
    db $00

EnemySetName_PostCrocFarming:
    db "NO1_14 "

EnemySets_PostCrocFarming:
    dw EnemyHeaders_Gamet,$0001
    dw EnemyHeaders_GRipper,$0002
    dw EnemyHeaders_Kamer2,$0003
    dw $FFFF
    db $00

EnemySetName_WorstRoomInTheGame:
    db "NO2_12 "

EnemySets_WorstRoomInTheGame:
    dw EnemyHeaders_Namihe,$0001
    dw EnemyHeaders_PirateGoldWall,$0002
    dw EnemyHeaders_PirateGoldWalking,$0003
    dw $FFFF
    db $00

EnemySetName_DoubleChamber:
    db "NO1_30 "

EnemySets_DoubleChamber:
    dw EnemyHeaders_Fune,$0001
    dw EnemyHeaders_Kamer,$0002
    dw EnemyHeaders_Kago,$0003
    dw EnemyHeaders_GRipper,$0007
    dw $FFFF
    db $00

EnemySetName_GrappleBeam:
    db "NO1_23 "

EnemySets_GrappleBeam:
    dw EnemyHeaders_Multiviola,$0001
    dw $FFFF
    db $00

EnemySetName_RedPirateShaft:
    db "NO1_49 "

EnemySets_RedPirateShaft:
    dw EnemyHeaders_PirateRedWalking,$0001
    dw EnemyHeaders_MZoomer,$0003
    dw $FFFF
    db $00

EnemySetName_CrocomireSpeedway:
    db "NO1_09 "

EnemySets_CrocomireSpeedway:
    dw EnemyHeaders_PirateRedWalking,$0001
    dw EnemyHeaders_Multiviola,$0002
    dw EnemyHeaders_Cacatac,$0003
    dw EnemyHeaders_Sova,$0003
    dw $FFFF
    db $00

EnemySetName_Plowerhouse:
    db "NO2_11 "

EnemySets_Plowerhouse:
    dw EnemyHeaders_Zebbo,$0001
    dw EnemyHeaders_Holtz,$0007
    dw $FFFF
    db $00

EnemySetName_LNFireflea:
    db "NO2_22 "

EnemySets_LNFireflea:
    dw EnemyHeaders_Fireflea,$0001
    dw EnemyHeaders_Boulder,$0002
    dw EnemyHeaders_Fune,$0003
    dw $FFFF
    db $00

EnemySetName_MagdolliteTunnel:
    db "NO1_35 "

EnemySets_MagdolliteTunnel:
    dw EnemyHeaders_Multiviola,$0001
    dw EnemyHeaders_Magdollite,$0007
    dw $FFFF
    db $00

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemySetName_State8FB3EE_B48899:
    db "NO2_08 "

UNUSED_EnemySets_State8FB3EE_B48899:
    dw $FFFF
    db $00
endif ; !FEATURE_KEEP_UNREFERENCED

EnemySetName_LavaDive:
    db "NO1_37 "

EnemySets_LavaDive:
    dw EnemyHeaders_Namihe,$0001
    dw $FFFF
    db $00

EnemySetName_Pillar:
    db "NO2_10 "

EnemySets_Pillar:
    dw EnemyHeaders_Puromi,$0007
    dw $FFFF
    db $00

EnemySetName_CrocomireEscape:
    db "NO1_12 "

EnemySets_CrocomireEscape:
    dw EnemyHeaders_Dragon,$0001
    dw EnemyHeaders_Geruta,$0002
    dw $FFFF
    db $00

EnemySetName_LNSpringBallMaze:
    db "NO2_14 "

EnemySets_LNSpringBallMaze:
    dw EnemyHeaders_Alcoon,$0001
    dw $FFFF
    db $00

EnemySetName_LNEscapePowerBombs:
    db "NO2_15 "

EnemySets_LNEscapePowerBombs:
    dw $FFFF
    db $00

EnemySetName_PurpleShaft:
    db "NO1_36 "

EnemySets_PurpleShaft:
    dw $FFFF
    db $00

EnemySetName_RidleyETank:
    db "NO2_20 "

EnemySets_RidleyETank:
    dw $FFFF
    db $00

EnemySetName_ScrewAttack:
    db "NO2_21 "

EnemySets_ScrewAttack:
    dw $FFFF
    db $00

EnemySetName_GreenBubblesMissiles:
    db "NO1_25 "

EnemySets_GreenBubblesMissiles:
    dw EnemyHeaders_ShutterShootable,$0007
    dw EnemyHeaders_Sova,$0002
    dw EnemyHeaders_Geruta,$0003
    dw $FFFF
    db $00

EnemySetName_Amphitheatre:
    db "NO2_13 "

EnemySets_Amphitheatre:
    dw EnemyHeaders_PirateGoldWalking,$0007
    dw $FFFF
    db $00

EnemySetName_CathedralEntrance:
    db "NO1_02 "

EnemySets_CathedralEntrance:
    dw EnemyHeaders_Sova,$0001
    dw EnemyHeaders_Dessgeega,$0002
    dw $FFFF
    db $00

EnemySetName_MainHall:
    db "NO2_01 "

EnemySets_MainHall:
    dw EnemyHeaders_Hibashi,$0001
    dw EnemyHeaders_Dragon,$0007
    dw EnemyHeaders_Gamet,$0007
    dw $FFFF
    db $00

EnemySetName_PostCrocJump:
    db "NO1_20 "

EnemySets_PostCrocJump:
    dw EnemyHeaders_Mella,$0001
    dw EnemyHeaders_GRipper,$0002
    dw EnemyHeaders_Kamer2,$0003
    dw $FFFF
    db $00

EnemySetName_FrogSave:
    db "NO1_50 "

EnemySets_FrogSave:
    dw $FFFF
    db $00

EnemySetName_CrocomireSave:
    db "NO1_51 "

EnemySets_CrocomireSave:
    dw $FFFF
    db $00

EnemySetName_CrumbleShaft:
    db "NO1_08 "

EnemySets_CrumbleShaft:
    dw EnemyHeaders_Sova,$0001
    dw $FFFF
    db $00

EnemySetName_Wasteland:
    db "NO2_17 "

EnemySets_Wasteland:
    dw EnemyHeaders_Hibashi,$0001
    dw EnemyHeaders_DessgeegaLarge,$0002
    dw EnemyHeaders_ShutterShootable,$0003
    dw EnemyHeaders_KzanTop,$0007
    dw $FFFF
    db $00

EnemySetName_AcidSnakesTunnel:
    db "NO1_41 "

EnemySets_AcidSnakesTunnel:
    dw EnemyHeaders_Dragon,$0001
    dw EnemyHeaders_Gamet,$0002
    dw $FFFF
    db $00

EnemySetName_GrappleTutorial1:
    db "NO1_22 "

EnemySets_GrappleTutorial1:
    dw $FFFF
    db $00

EnemySetName_BubbleMountainSave:
    db "NO1_47 "

EnemySets_BubbleMountainSave:
    dw $FFFF
    db $00

EnemySetName_HiJumpETank:
    db "NO1_13 "

EnemySets_HiJumpETank:
    dw EnemyHeaders_Sova,$0001
    dw $FFFF
    db $00

EnemySetName_BubbleMountain:
    db "NO1_26 "

EnemySets_BubbleMountain:
    dw EnemyHeaders_Waver,$0001
    dw EnemyHeaders_Ripper2,$0001
    dw EnemyHeaders_Cacatac,$0002
    dw EnemyHeaders_Sova,$0002
    dw $FFFF
    db $00

EnemySetName_IceBeamAcid:
    db "NO1_00 "

EnemySets_IceBeamAcid:
    dw EnemyHeaders_Tripper,$0007
    dw $FFFF
    db $00

EnemySetName_IceBeamTutorial:
    db "NO1_05 "

EnemySets_IceBeamTutorial:
    dw EnemyHeaders_Boyon,$0001
    dw EnemyHeaders_Ripper2,$0002
    dw $FFFF
    db $00

EnemySetName_PostCrocMissile:
    db "NO1_18 "

EnemySets_PostCrocMissile:
    dw EnemyHeaders_Metaree,$0001
    dw EnemyHeaders_Gamet,$0002
    dw $FFFF
    db $00

EnemySetName_Cathedral:
    db "NO1_01 "

EnemySets_Cathedral:
    dw EnemyHeaders_Sova,$0001
    dw EnemyHeaders_Geruta,$0002
    dw $FFFF
    db $00

EnemySetName_NorfairReserveTank:
    db "NO1_24 "

EnemySets_NorfairReserveTank:
    dw EnemyHeaders_Dragon,$0001
    dw EnemyHeaders_Sova,$0002
    dw $FFFF
    db $00

EnemySetName_GrappleTutorial2:
    db "NO1_21 "

EnemySets_GrappleTutorial2:
    dw EnemyHeaders_Fune,$0001
    dw EnemyHeaders_Multiviola,$0002
    dw $FFFF
    db $00

EnemySetName_IceBeamSnake:
    db "NO1_07 "

EnemySets_IceBeamSnake:
    dw EnemyHeaders_Sova,$0001
    dw EnemyHeaders_Fune,$0002
    dw $FFFF
    db $00

EnemySetName_GoldenTorizo:
    db "NO2_02 "

EnemySets_GoldenTorizo:
    dw EnemyHeaders_GoldenTorizo,$0001
    dw $FFFF
    db $00

EnemySetName_SpikyPlatformsTunnel:
    db "NO1_32 "

EnemySets_SpikyPlatformsTunnel:
    dw EnemyHeaders_Tripper,$0007
    dw EnemyHeaders_ShutterShootable,$0002
    dw $FFFF
    db $00

EnemySetName_SpeedBooster:
    db "NO1_28 "

EnemySets_SpeedBooster:
    dw $FFFF
    db $00

EnemySetName_LNFarming:
    db "NO2_06 "

EnemySets_LNFarming:
    dw EnemyHeaders_Viola,$0001
    dw EnemyHeaders_Zebbo,$0007
    dw $FFFF
    db $00

EnemySetName_SingleChamber:
    db "NO1_29 "

EnemySets_SingleChamber:
    dw EnemyHeaders_Multiviola,$0001
    dw EnemyHeaders_Alcoon,$0002
    dw $FFFF
    db $00

EnemySetName_SpeedBoosterHall:
    db "NO1_27 "

EnemySets_SpeedBoosterHall:
    dw EnemyHeaders_Geruta,$0001
    dw EnemyHeaders_Metaree,$0002
    dw $FFFF
    db $00

EnemySetName_BatCave:
    db "NO1_45 "

EnemySets_BatCave:
    dw EnemyHeaders_Gamet,$0001
    dw EnemyHeaders_Skree,$0002
    dw $FFFF
    db $00

EnemySetName_KronicBoost:
    db "NO1_34 "

EnemySets_KronicBoost:
    dw EnemyHeaders_Viola,$0001
    dw $FFFF
    db $00

EnemySetName_BusinessCenter:
    db "NO1_03 "

EnemySets_BusinessCenter:
    dw EnemyHeaders_Sova,$0002
    dw $FFFF
    db $00

EnemySetName_ThreeMusketeers:
    db "NO2_19 "

EnemySets_ThreeMusketeers:
    dw EnemyHeaders_Hibashi,$0001
    dw EnemyHeaders_KihunterRed,$0002
    dw EnemyHeaders_ShutterShootable,$0003
    dw $FFFF
    db $00

EnemySetName_Crocomire:
    db "NO1_10 "

EnemySets_Crocomire:
    dw EnemyHeaders_Crocomire,$D007
    dw $FFFF
    db $00

EnemySetName_LNElevSave:
    db "NO1_52 "

EnemySets_LNElevSave:
    dw $FFFF
    db $00

EnemySetName_Volcano:
    db "NO1_33 "

EnemySets_Volcano:
    dw EnemyHeaders_Fune,$0001
    dw EnemyHeaders_LavaRocks,$0002
    dw $FFFF
    db $00

EnemySetName_UpperNorfairFarming:
    db "NO1_39 "

EnemySets_UpperNorfairFarming:
    dw EnemyHeaders_Fune,$0001
    dw EnemyHeaders_Gamet,$0002
    dw $FFFF
    db $00

EnemySetName_SpongeBath_1:
    db "NP1_11a"

EnemySets_SpongeBath_1:
    dw EnemyHeaders_Bull,$0001
    dw $FFFF
    db $00

EnemySetName_WreckedShipETank_1:
    db "NP1_07a"

EnemySets_WreckedShipETank_1:
    dw EnemyHeaders_Kamer2,$0001
    dw EnemyHeaders_Skultera,$0002
    dw $FFFF
    db $00

EnemySetName_WreckedShipMainShaft_0:
    db "NP1_04 "

EnemySets_WreckedShipMainShaft_0:
    dw EnemyHeaders_Coven,$0001
    dw EnemyHeaders_KzanTop,$0002
    dw EnemyHeaders_Atomic,$0003
    dw EnemyHeaders_Sbug,$0003
    dw $FFFF
    db $00

EnemySetName_BowlingAlley_0:
    db "NP1_00 "

EnemySets_BowlingAlley_0:
    dw EnemyHeaders_Chozo,$0001
    dw EnemyHeaders_Sbug,$0007
    dw $FFFF
    db $00

EnemySetName_Attic_1:
    db "NP1_02a"

EnemySets_Attic_1:
    dw EnemyHeaders_KihunterYellow,$0001
    dw EnemyHeaders_Atomic,$0002
    dw EnemyHeaders_Spark,$0003
    dw $FFFF
    db $00

EnemySetName_Basement_1:
    db "NP1_08a"

EnemySets_Basement_1:
    dw EnemyHeaders_Robot,$0001
    dw EnemyHeaders_Atomic,$0002
    dw EnemyHeaders_Spark,$0003
    dw $FFFF
    db $00

EnemySetName_WreckedShipMap_1:
    db "NP1_09a"

EnemySets_WreckedShipMap_1:
    dw $FFFF
    db $00

EnemySetName_WSWestSuper_0:
    db "NP1_12 "

EnemySets_WSWestSuper_0:
    dw $FFFF
    db $00

EnemySetName_SpikyDeath_0:
    db "NP1_05 "

EnemySets_SpikyDeath_0:
    dw $FFFF
    db $00

EnemySetName_SpongeBath_0:
    db "NP1_11 "

EnemySets_SpongeBath_0:
    dw $FFFF
    db $00

EnemySetName_WreckedShipEntrance_1:
    db "NP1_01a"

EnemySets_WreckedShipEntrance_1:
    dw $FFFF
    db $00

EnemySetName_ElectricDeath_0:
    db "NP1_06 "

EnemySets_ElectricDeath_0:
    dw $FFFF
    db $00

EnemySetName_BowlingAlley_1:
    db "NP1_00a"

EnemySets_BowlingAlley_1:
    dw EnemyHeaders_Chozo,$0001
    dw EnemyHeaders_Robot,$0003
    dw $FFFF
    db $00

EnemySetName_AssemblyLine_0:
    db "NP1_03 "

EnemySets_AssemblyLine_0:
    dw $FFFF
    db $00

EnemySetName_Phantoon_1:
    db "NP1_10a"

EnemySets_Phantoon_1:
    dw $FFFF
    db $00

EnemySetName_WreckedShipETank_0:
    db "NP1_07 "

EnemySets_WreckedShipETank_0:
    dw $FFFF
    db $00

EnemySetName_GravitySuit_0:
    db "NP1_14 "

EnemySets_GravitySuit_0:
    dw $FFFF
    db $00

EnemySetName_WreckedShipMap_0:
    db "NP1_09 "

EnemySets_WreckedShipMap_0:
    dw EnemyHeaders_Coven,$0001
    dw EnemyHeaders_Sbug,$0007
    dw EnemyHeaders_Bull,$0007
    dw $FFFF
    db $00

EnemySetName_GravitySuit_1:
    db "NP1_14a"

EnemySets_GravitySuit_1:
    dw $FFFF
    db $00

EnemySetName_Basement_0:
    db "NP1_08 "

EnemySets_Basement_0:
    dw EnemyHeaders_RobotNoPower,$0007
    dw EnemyHeaders_Sbug,$0007
    dw $FFFF
    db $00

EnemySetName_WreckedShipEntrance_0:
    db "NP1_01 "

EnemySets_WreckedShipEntrance_0:
    dw EnemyHeaders_Sbug,$0001
    dw $FFFF
    db $00

EnemySetName_AssemblyLine_1:
    db "NP1_03a"

EnemySets_AssemblyLine_1:
    dw EnemyHeaders_Spark,$0001
    dw EnemyHeaders_Puyo,$0002
    dw EnemyHeaders_Robot,$0003
    dw $FFFF
    db $00

EnemySetName_WreckedShipSave_1:
    db "NP1_15a"

EnemySets_WreckedShipSave_1:
    dw $FFFF
    db $00

EnemySetName_WSWestSuper_1:
    db "NP1_12a"

EnemySets_WSWestSuper_1:
    dw EnemyHeaders_Spark,$0001
    dw $FFFF
    db $00

EnemySetName_Attic_0:
    db "NP1_02 "

EnemySets_Attic_0:
    dw EnemyHeaders_Coven,$0001
    dw EnemyHeaders_Atomic,$0002
    dw EnemyHeaders_Sbug,$0002
    dw $FFFF
    db $00

EnemySetName_WSEastSuper_0:
    db "NP1_13 "

EnemySets_WSEastSuper_0:
    dw EnemyHeaders_Coven,$0001
    dw EnemyHeaders_Atomic,$0002
    dw EnemyHeaders_Sbug,$0002
    dw EnemyHeaders_RobotNoPower,$0007
    dw $FFFF
    db $00

EnemySetName_WreckedShipSave_0:
    db "NP1_15 "

EnemySets_WreckedShipSave_0:
    dw EnemyHeaders_Coven,$0001
    dw EnemyHeaders_Sbug,$0002
    dw $FFFF
    db $00

EnemySetName_ElectricDeath_1:
    db "NP1_06a"

EnemySets_ElectricDeath_1:
    dw EnemyHeaders_Spark,$0001
    dw $FFFF
    db $00

EnemySetName_SpikyDeath_1:
    db "NP1_05a"

EnemySets_SpikyDeath_1:
    dw EnemyHeaders_KzanTop,$0007
    dw $FFFF
    db $00

EnemySetName_WSEastSuper_1:
    db "NP1_13a"

EnemySets_WSEastSuper_1:
    dw EnemyHeaders_Robot,$0001
    dw EnemyHeaders_Bull,$0002
    dw EnemyHeaders_Spark,$0003
    dw $FFFF
    db $00

EnemySetName_Phantoon_0:
    db "NP1_10 "

EnemySets_Phantoon_0:
    dw EnemyHeaders_PhantoonBody,$0007
    dw $FFFF
    db $00

EnemySetName_WreckedShipMainShaft_1:
    db "NP1_04a"

EnemySets_WreckedShipMainShaft_1:
    dw EnemyHeaders_Spark,$0001
    dw EnemyHeaders_Atomic,$0002
    dw EnemyHeaders_KzanTop,$0003
    dw $FFFF
    db $00

EnemySetName_MtEverest:
    db "ML1_08 "

EnemySets_MtEverest:
    dw EnemyHeaders_Powamp,$0001
    dw EnemyHeaders_Sciser,$0003
    dw $FFFF
    db $00

EnemySetName_HalfieClimb:
    db "ML2_25 "

EnemySets_HalfieClimb:
    dw EnemyHeaders_Oum,$0001
    dw EnemyHeaders_Mochtroid,$0002
    dw $FFFF
    db $00

EnemySetName_WateringHole:
    db "ML1_10 "

EnemySets_WateringHole:
    dw EnemyHeaders_Choot,$0001
    dw EnemyHeaders_Zeb,$0002
    dw $FFFF
    db $00

EnemySetName_CrabShaft:
    db "ML1_12 "

EnemySets_CrabShaft:
    dw EnemyHeaders_Sciser,$0001
    dw $FFFF
    db $00

EnemySetName_MaridiaElev:
    db "ML1_19 "

EnemySets_MaridiaElev:
    dw EnemyHeaders_Ripper,$0003
    dw EnemyHeaders_Owtch,$0007
    dw $FFFF
    db $00

EnemySetName_Colosseum:
    db "ML2_16 "

EnemySets_Colosseum:
    dw EnemyHeaders_Mochtroid,$0001
    dw $FFFF
    db $00

EnemySetName_AqueductSave:
    db "ML2_17 "

EnemySets_AqueductSave:
    dw $FFFF
    db $00

EnemySetName_ThePrecious:
    db "ML2_18 "

EnemySets_ThePrecious:
    dw $FFFF
    db $00

EnemySetName_BotwoonETank:
    db "ML2_19 "

EnemySets_BotwoonETank:
    dw EnemyHeaders_Puyo,$0001
    dw EnemyHeaders_Sciser,$0001
    dw EnemyHeaders_Zoa,$0002
    dw $FFFF
    db $00

EnemySetName_DraygonSave:
    db "ML2_20 "

EnemySets_DraygonSave:
    dw $FFFF
    db $00

EnemySetName_MaridiaMissileRefill:
    db "ML2_21 "

EnemySets_MaridiaMissileRefill:
    dw $FFFF
    db $00

EnemySetName_PlasmaBeachQuicksand:
    db "ML2_22 "

EnemySets_PlasmaBeachQuicksand:
    dw EnemyHeaders_Bull,$0001
    dw $FFFF
    db $00

EnemySetName_BotwoonQuicksand:
    db "ML2_23 "

EnemySets_BotwoonQuicksand:
    dw EnemyHeaders_Bull,$0001
    dw $FFFF
    db $00

EnemySetName_Shaktool:
    db "ML2_24 "

EnemySets_Shaktool:
    dw EnemyHeaders_Shaktool,$0001
    dw EnemyHeaders_Yard,$0002
    dw $FFFF
    db $00

EnemySetName_Draygon_0:
    db "MLB_00"

EnemySets_Draygon_0:
    dw EnemyHeaders_DraygonBody,$0007
    dw $FFFF
    db $00

EnemySetName_Aqueduct:
    db "ML2_09 "

EnemySets_Aqueduct:
    dw EnemyHeaders_Yard,$0001
    dw $FFFF
    db $00

EnemySetName_RedFish:
    db "ML1_09 "

EnemySets_RedFish:
    dw EnemyHeaders_Skultera,$0001
    dw EnemyHeaders_Sciser,$0001
    dw EnemyHeaders_Zebbo,$0002
    dw $FFFF
    db $00

EnemySetName_Plasma:
    db "ML1_17 "

EnemySets_Plasma:
    dw EnemyHeaders_PirateMagentaWalking,$0001
    dw EnemyHeaders_PirateMagentaWall,$0002
    dw $FFFF
    db $00

EnemySetName_SpaceJump:
    db "ML2_27 "

EnemySets_SpaceJump:
    dw $FFFF
    db $00

EnemySetName_Pants:
    db "ML2_12 "

EnemySets_Pants:
    dw EnemyHeaders_Menu,$0001
    dw EnemyHeaders_Puyo,$0002
    dw EnemyHeaders_Tripper,$0002
    dw $FFFF
    db $00

EnemySetName_GlassTunnelSave:
    db "ML1_00 "

EnemySets_GlassTunnelSave:
    dw $FFFF
    db $00

EnemySetName_GlassTunnel:
    db "ML1_01 "

EnemySets_GlassTunnel:
    dw EnemyHeaders_NoobTubeCrack,$0007
    dw $FFFF
    db $00

EnemySetName_WestTunnel:
    db "ML1_02 "

EnemySets_WestTunnel:
    dw $FFFF
    db $00

EnemySetName_EastTunnel:
    db "ML1_03 "

EnemySets_EastTunnel:
    dw EnemyHeaders_Boyon,$0001
    dw EnemyHeaders_Zebbo,$0002
    dw $FFFF
    db $00

EnemySetName_MamaTurtle:
    db "ML1_06 "

EnemySets_MamaTurtle:
    dw EnemyHeaders_MamaTurtle,$0001
    dw $FFFF
    db $00

EnemySetName_CrabTunnel:
    db "ML1_07 "

EnemySets_CrabTunnel:
    dw EnemyHeaders_Sciser,$0001
    dw $FFFF
    db $00

EnemySetName_NWestMaridiaBug:
    db "ML1_11 "

EnemySets_NWestMaridiaBug:
    dw EnemyHeaders_Owtch,$0001
    dw EnemyHeaders_Menu,$0002
    dw $FFFF
    db $00

EnemySetName_PseudoPlasmaSpark:
    db "ML1_13 "

EnemySets_PseudoPlasmaSpark:
    dw EnemyHeaders_Owtch,$0001
    dw EnemyHeaders_Choot,$0002
    dw EnemyHeaders_Skultera,$0003
    dw $FFFF
    db $00

EnemySetName_WestSandHallTunnel:
    db "ML1_15 "

EnemySets_WestSandHallTunnel:
    dw EnemyHeaders_Sciser,$0001
    dw $FFFF
    db $00

EnemySetName_PlasmaTutorial:
    db "ML1_16 "

EnemySets_PlasmaTutorial:
    dw EnemyHeaders_Puyo,$0001
    dw EnemyHeaders_MZoomer,$0001
    dw $FFFF
    db $00

EnemySetName_ThreadTheNeedle:
    db "ML1_18 "

EnemySets_ThreadTheNeedle:
    dw EnemyHeaders_Puyo,$0001
    dw EnemyHeaders_Boyon,$0001
    dw EnemyHeaders_Choot,$0002
    dw $FFFF
    db $00

EnemySetName_PlasmaSpark:
    db "ML1_20 "

EnemySets_PlasmaSpark:
    dw EnemyHeaders_Owtch,$0001
    dw EnemyHeaders_Choot,$0002
    dw EnemyHeaders_Skultera,$0003
    dw $FFFF
    db $00

EnemySetName_Toilet:
    db "ML2_00 "

EnemySets_Toilet:
    dw EnemyHeaders_Mochtroid,$0001
    dw EnemyHeaders_Puyo,$0002
    dw EnemyHeaders_Sciser,$0002
    dw EnemyHeaders_Yard,$0003
    dw $FFFF
    db $00

EnemySetName_WestSandHall:
    db "ML2_02 "

EnemySets_WestSandHall:
    dw EnemyHeaders_Evir,$0001
    dw $FFFF
    db $00

EnemySetName_Oasis:
    db "ML2_03 "

EnemySets_Oasis:
    dw $FFFF
    db $00

EnemySetName_EastSandHall:
    db "ML2_04 "

EnemySets_EastSandHall:
    dw EnemyHeaders_Evir,$0001
    dw $FFFF
    db $00

EnemySetName_WestAqueductQuicksand:
    db "ML2_07 "

EnemySets_WestAqueductQuicksand:
    dw EnemyHeaders_Bull,$0001
    dw $FFFF
    db $00

EnemySetName_EastAqueductQuicksand:
    db "ML2_08 "

EnemySets_EastAqueductQuicksand:
    dw EnemyHeaders_Bull,$0001
    dw $FFFF
    db $00

EnemySetName_Butterfly:
    db "ML2_10 "

EnemySets_Butterfly:
    dw EnemyHeaders_Zoa,$0001
    dw $FFFF
    db $00

EnemySetName_BotwoonHallway:
    db "ML2_11 "

EnemySets_BotwoonHallway:
    dw EnemyHeaders_Mochtroid,$0001
    dw EnemyHeaders_Puyo,$0002
    dw EnemyHeaders_Sciser,$0002
    dw $FFFF
    db $00

EnemySetName_EastPants:
    db "ML2_13 "

EnemySets_EastPants:
    dw EnemyHeaders_Puyo,$0001
    dw EnemyHeaders_Tripper,$0001
    dw $FFFF
    db $00

EnemySetName_Springball:
    db "ML2_14 "

EnemySets_Springball:
    dw $FFFF
    db $00

EnemySetName_BelowBotwoonETank:
    db "ML2_15 "

EnemySets_BelowBotwoonETank:
    dw EnemyHeaders_Zoa,$0001
    dw EnemyHeaders_Owtch,$0002
    dw $FFFF
    db $00

EnemySetName_Kassiuz:
    db "ML1_21 "

EnemySets_Kassiuz:
    dw EnemyHeaders_Choot,$0001
    dw EnemyHeaders_Puyo,$0002
    dw EnemyHeaders_Boyon,$0002
    dw $FFFF
    db $00

EnemySetName_ForgottenHighwaySave:
    db "ML1_23 "

EnemySets_ForgottenHighwaySave:
    dw $FFFF
    db $00

EnemySetName_MaridiaEnergyRefill:
    db "ML2_28 "

EnemySets_MaridiaEnergyRefill:
    dw $FFFF
    db $00

EnemySetName_MaridiaMap:
    db "ML1_22 "

EnemySets_MaridiaMap:
    dw $FFFF
    db $00

EnemySetName_CrabHole:
    db "ML1_14 "

EnemySets_CrabHole:
    dw EnemyHeaders_Sciser,$0001
    dw $FFFF
    db $00

EnemySetName_Botwoon:
    db "ML2_26 "

EnemySets_Botwoon:
    dw EnemyHeaders_Owtch,$0001
    dw EnemyHeaders_Botwoon,$0007
    dw $FFFF
    db $00

EnemySetName_MainStreet:
    db "ML1_04 "

EnemySets_MainStreet:
    dw EnemyHeaders_Skultera,$0001
    dw EnemyHeaders_Sciser,$0002
    dw $FFFF
    db $00

EnemySetName_BugSandHole:
    db "ML2_01 "

EnemySets_BugSandHole:
    dw EnemyHeaders_YappingMaw,$0001
    dw EnemyHeaders_Zoa,$0007
    dw $FFFF
    db $00

EnemySetName_EastSandHole:
    db "ML2_06 "

EnemySets_EastSandHole:
    dw EnemyHeaders_Boulder,$0001
    dw $FFFF
    db $00

EnemySetName_WestSandHole:
    db "ML2_05 "

EnemySets_WestSandHole:
    dw EnemyHeaders_Boulder,$0001
    dw $FFFF
    db $00

EnemySetName_WestCactusAlley:
    db "ML2_29 "

EnemySets_WestCactusAlley:
    dw EnemyHeaders_Cacatac,$0007
    dw EnemyHeaders_Zoa,$0007
    dw $FFFF
    db $00

EnemySetName_EastCactusAlley:
    db "ML2_30 "

EnemySets_EastCactusAlley:
    dw EnemyHeaders_Cacatac,$0001
    dw EnemyHeaders_Zoa,$0001
    dw $FFFF
    db $00

EnemySetName_FishTank:
    db "ML1_05 "

EnemySets_FishTank:
    dw EnemyHeaders_Skultera,$0001
    dw EnemyHeaders_PirateMagentaWalking,$0002
    dw $FFFF
    db $00

EnemySetName_TourianEscape4:
    db "TS1_17 "

EnemySets_TourianEscape4:
    dw EnemyHeaders_PirateSilverWall,$0001
    dw EnemyHeaders_PirateSilverWalking,$0002
    dw $FFFF
    db $00

EnemySetName_MotherBrainSave:
    db "TS1_13 "

EnemySets_MotherBrainSave:
    dw $FFFF
    db $00

EnemySetName_Metroids1_0:
    db "TS1_01 "

EnemySets_Metroids1_0:
    dw EnemyHeaders_Metroid,$0001
    dw EnemyHeaders_Rinka,$0002
    dw $FFFF
    db $00

EnemySetName_DustTorizo:
    db "TS1_06 "

EnemySets_DustTorizo:
    dw EnemyHeaders_CorpseTorizo,$0001
    dw $FFFF
    db $00

EnemySetName_BigBoy:
    db "TS1_07 "

EnemySets_BigBoy:
    dw EnemyHeaders_CorpseSidehopper,$0001
    dw EnemyHeaders_CorpseSidehopper2,$0001
    dw EnemyHeaders_BabyMetroid,$0001
    dw $FFFF
    db $00

EnemySetName_MotherBrain_0_1:
    db "TS1_10 "

EnemySets_MotherBrain_0_1:
    dw EnemyHeaders_MotherBrainHead,$0001
    dw EnemyHeaders_Rinka,$0002
    dw EnemyHeaders_MotherBrainBody,$D001
    dw $FFFF
    db $00

EnemySetName_TourianEyeDoor:
    db "TS1_11 "

EnemySets_TourianEyeDoor:
    dw $FFFF
    db $00

EnemySetName_BlueHopper:
    db "TS1_05 "

EnemySets_BlueHopper:
    dw EnemyHeaders_SidehopperTourian,$0001
    dw $FFFF
    db $00

EnemySetName_TourianEscape1:
    db "TS1_14 "

EnemySets_TourianEscape1:
    dw EnemyHeaders_ShutterDestroyable,$0001
    dw $FFFF
    db $00

EnemySetName_TourianFirst:
    db "TS1_00 "

EnemySets_TourianFirst:
    dw $FFFF
    db $00

EnemySetName_Metroids2_0:
    db "TS1_02 "

EnemySets_Metroids2_0:
    dw EnemyHeaders_Metroid,$0001
    dw EnemyHeaders_Rinka,$0002
    dw $FFFF
    db $00

EnemySetName_Metroids4_0:
    db "TS1_04 "

EnemySets_Metroids4_0:
    dw EnemyHeaders_Metroid,$0001
    dw EnemyHeaders_Rinka,$0002
    dw $FFFF
    db $00

EnemySetName_Metroids1_1:
    db "TS1_01 "

EnemySets_Metroids1_1:
    dw EnemyHeaders_Rinka,$0002
    dw $FFFF
    db $00

EnemySetName_Metroids2_1:
    db "TS1_02 "

EnemySets_Metroids2_1:
    dw EnemyHeaders_Rinka,$0002
    dw $FFFF
    db $00

EnemySetName_TourianEscape2:
    db "TS1_15 "

EnemySets_TourianEscape2:
    dw EnemyHeaders_PirateSilverWall,$0001
    dw $FFFF
    db $00

EnemySetName_Metroids3_1:
    db "TS1_03 "

EnemySets_Metroids3_1:
    dw EnemyHeaders_Rinka,$0002
    dw $FFFF
    db $00

EnemySetName_Metroids4_1:
    db "TS1_04 "

EnemySets_Metroids4_1:
    dw EnemyHeaders_Rinka,$0002
    dw $FFFF
    db $00

EnemySetName_TourianEscape3:
    db "TS1_16 "

EnemySets_TourianEscape3:
    dw EnemyHeaders_PirateSilverWalking,$0001
    dw EnemyHeaders_ShutterGrowing,$0002
    dw $FFFF
    db $00

EnemySetName_Seaweed:
    db "TS1_08 "

EnemySets_Seaweed:
    dw $FFFF
    db $00

EnemySetName_TourianRecharge:
    db "TS1_09 "

EnemySets_TourianRecharge:
    dw $FFFF
    db $00

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemySetName_B491D1:
    db "TS1_07 "

UNUSED_EnemySets_B491D8:
    dw EnemyHeaders_CorpseSidehopper,$0001
    dw EnemyHeaders_CorpseSidehopper2,$0001
    dw EnemyHeaders_BabyMetroid,$0001
    dw $FFFF
    db $00
endif ; !FEATURE_KEEP_UNREFERENCED

EnemySetName_Metroids3_0:
    db "TS1_18 "

EnemySets_UpperTourianSave:
    dw $FFFF
    db $00
    db "TS1_03 "

EnemySets_Metroids3_0:
    dw EnemyHeaders_Metroid,$0001
    dw EnemyHeaders_Rinka,$0002
    dw $FFFF
    db $00

EnemySetName_RinkaShaft:
    db "TS1_12 "

EnemySets_RinkaShaft:
    dw EnemyHeaders_Rinka,$0002
    dw $FFFF
    db $00

EnemySetName_CeresElev_0:
    db "cl1_00 "

EnemySets_CeresElev_0:
    dw EnemyHeaders_CeresDoor,$D002
    dw $FFFF
    db $00

EnemySetName_FallingTile_0:
    db "cl1_01 "

EnemySets_FallingTile_0:
    dw EnemyHeaders_CeresDoor,$D002
    dw $FFFF
    db $00

EnemySetName_MagnetStairs_0:
    db "cl1_02 "

EnemySets_MagnetStairs_0:
    dw EnemyHeaders_CeresDoor,$D002
    dw $FFFF
    db $00

EnemySetName_DeadScientist_0:
    db "cl1_03 "

EnemySets_DeadScientist_0:
    dw EnemyHeaders_CeresDoor,$D002
    dw $FFFF
    db $00

EnemySetName_58Escape_0:
    db "cl1_04 "

EnemySets_58Escape_0:
    dw EnemyHeaders_CeresDoor,$D002
    dw $FFFF
    db $00

EnemySetName_CeresRidley_0:
    db "cl1_05 "

EnemySets_CeresRidley_0:
    dw EnemyHeaders_RidleyCeres,$0001
    dw EnemyHeaders_CeresDoor,$D002
    dw $FFFF
    db $00

EnemySetName_CeresElev_1:
    db "cl1_00 "

EnemySets_CeresElev_1:
    dw EnemyHeaders_CeresDoor,$D002
    dw $FFFF
    db $00

EnemySetName_FallingTile_1:
    db "cl1_01 "

EnemySets_FallingTile_1:
    dw EnemyHeaders_CeresDoor,$D002
    dw $FFFF
    db $00

EnemySetName_MagnetStairs_1:
    db "cl1_02 "

EnemySets_MagnetStairs_1:
    dw EnemyHeaders_CeresDoor,$D002
    dw $FFFF
    db $00

EnemySetName_DeadScientist_1:
    db "cl1_03 "

EnemySets_DeadScientist_1:
    dw EnemyHeaders_CeresDoor,$D002
    dw $FFFF
    db $00

EnemySetName_58Escape_1:
    db "cl1_04 "

EnemySets_58Escape_1:
    dw EnemyHeaders_CeresDoor,$D002
    dw $FFFF
    db $00

EnemySetName_CeresRidley_1:
    db "cl1_05 "

EnemySets_CeresRidley_1:
    dw EnemyHeaders_CeresDoor,$D002
    dw $FFFF
    db $00

EnemySetName_Debug:
    db "TT_00 "

EnemySets_Debug:
    dw $FFFF
    db $00


;;; $92C6: Debug handler - [debug index] = 7: enemy debugger - enemy spawn data editor ;;;
DebugHandler_7_EnemyDebugger_EnemySpawnDataEditor:
;; Returns:
;;     A: Non-zero to skip processing frame
    JSR Debug_HandleCursorMovement
    JSR Debug_HandleDigitModification
    LDA.W #$0800 : STA.B DP_Temp26
    LDA.W DebugTextCursorXPosition : STA.B DP_Temp14
    LDA.W DebugTextCursorYPosition : STA.B DP_Temp12
    LDA.W #$001C
    JSL Add_Debug_Spritemap_to_OAM
    LDA.W #$0A00 : STA.B DP_Temp26
    LDA.W #$00B0 : STA.B DP_Temp14
    LDA.W #$0048 : STA.B DP_Temp12
    LDA.W #$002F
    JSL Add_Debug_Spritemap_to_OAM
    LDA.W #$0A00 : STA.B DP_Temp26
    LDA.W #$00B0 : STA.B DP_Temp14
    LDA.W #$0048 : STA.B DP_Temp12
    LDX.W DebugEnemyIndex
    LDA.W Enemy.ID,X : TAX
    LDA.L EnemyHeaders_name,X : BNE .nonZeroName
    LDA.W #$0030
    BRA .draw

  .nonZeroName:
    TAX
    LDA.L EnemyNames_spritemap,X : CLC : ADC.W #$0030

  .draw:
    JSL Add_Debug_Spritemap_to_OAM
    JSR Draw_Debug_Enemy_Spawn_Values
    LDA.B DP_Controller2New : BIT.W #$0010 : BEQ .checkSelect
    STZ.W DebugIndex
    LDA.W #$0001
    RTS

  .checkSelect:
    LDA.B DP_Controller2New : BIT.W #$2000 : BEQ .checkA
    INC.W DebugIndex
    STZ.W DebugTimeIsFrozenForEnemies

  .checkA:
    LDA.B DP_Controller2New : BIT.W #$0080 : BEQ .checkL
    LDX.W DebugEnemyIndex
    LDA.W Enemy.XPosition,X : STA.L EnemySpawnData.XPosition,X
    LDA.W Enemy.YPosition,X : STA.L EnemySpawnData.YPosition,X

  .checkL:
    LDA.B DP_Controller2New : BIT.W #$0020 : BEQ .return
    INC.W DebugIndex : INC.W DebugIndex

  .return:
    LDA.W #$0001
    RTS


;;; $936D: Draw debug enemy spawn values ;;;
Draw_Debug_Enemy_Spawn_Values:
; When drawn with the text, result looks like:
;     PosX: [X position]
;     PosY: [Y position]
;     Pose: [initialisation parameter]
;     Swt1: [properties]
;     Swt2: [extra properties]
;     Opt0: [parameter 1]
;     Opt1: [parameter 2]
    LDX.W DebugEnemyIndex
    LDA.L EnemySpawnData.XPosition,X : STA.W Temp_DebuggerHexValue
    LDA.W #$00C8 : STA.W Temp_DebuggerHexValueXPosition
    LDA.W #$0038 : STA.W Temp_DebuggerHexValueYPosition
    JSR Draw4DigitHexValue
    LDX.W DebugEnemyIndex
    LDA.L EnemySpawnData.YPosition,X : STA.W Temp_DebuggerHexValue
    LDA.W #$00C8 : STA.W Temp_DebuggerHexValueXPosition
    LDA.W #$0040 : STA.W Temp_DebuggerHexValueYPosition
    JSR Draw4DigitHexValue
    LDX.W DebugEnemyIndex
    LDA.L EnemySpawnData.initParam,X : STA.W Temp_DebuggerHexValue
    LDA.W #$00C8 : STA.W Temp_DebuggerHexValueXPosition
    LDA.W #$0048 : STA.W Temp_DebuggerHexValueYPosition
    JSR Draw4DigitHexValue
    LDX.W DebugEnemyIndex
    LDA.L EnemySpawnData.properties,X : STA.W Temp_DebuggerHexValue
    LDA.W #$00C8 : STA.W Temp_DebuggerHexValueXPosition
    LDA.W #$0050 : STA.W Temp_DebuggerHexValueYPosition
    JSR Draw4DigitHexValue
    LDX.W DebugEnemyIndex
    LDA.L EnemySpawnData.extraProperties,X : STA.W Temp_DebuggerHexValue
    LDA.W #$00C8 : STA.W Temp_DebuggerHexValueXPosition
    LDA.W #$0058 : STA.W Temp_DebuggerHexValueYPosition
    JSR Draw4DigitHexValue
    LDX.W DebugEnemyIndex
    LDA.L EnemySpawnData.param1,X : STA.W Temp_DebuggerHexValue
    LDA.W #$00C8 : STA.W Temp_DebuggerHexValueXPosition
    LDA.W #$0060 : STA.W Temp_DebuggerHexValueYPosition
    JSR Draw4DigitHexValue
    LDX.W DebugEnemyIndex
    LDA.L EnemySpawnData.param2,X : STA.W Temp_DebuggerHexValue
    LDA.W #$00C8 : STA.W Temp_DebuggerHexValueXPosition
    LDA.W #$0068 : STA.W Temp_DebuggerHexValueYPosition
    JSR Draw4DigitHexValue
    RTS


;;; $941D: Debug. Draw enemy set name ;;;
Debug_Draw_Enemy_Set_Name:
    PHX
    LDA.W #$0A00 : STA.B DP_Temp26
    LDA.W #$00B0 : STA.B DP_Temp14
    LDA.W #$0058 : STA.B DP_Temp12
    LDA.W AreaIndex : CLC : ADC.W #$0014
    JSL Add_Debug_Spritemap_to_OAM
    LDA.W EnemySetPointer : SEC : SBC.W #$0007 : TAX
    LDA.L EnemyNames_name+2,X : AND.W #$00FF : SEC : SBC.W #$002C : STA.B DP_Temp16
    LDA.W #$0A00 : STA.B DP_Temp26
    LDA.W #$00A8 : STA.B DP_Temp14
    LDA.W #$0058 : STA.B DP_Temp12
    LDA.B DP_Temp16
    JSL Add_Debug_Spritemap_to_OAM
    LDA.W EnemySetPointer : SEC : SBC.W #$0007 : TAX
    LDA.L EnemyNames_name+4,X : AND.W #$00FF : SEC : SBC.W #$002C : STA.B DP_Temp16
    LDA.W #$0A00 : STA.B DP_Temp26
    LDA.W #$00B8 : STA.B DP_Temp14
    LDA.W #$0058 : STA.B DP_Temp12
    LDA.B DP_Temp16
    JSL Add_Debug_Spritemap_to_OAM
    LDA.W EnemySetPointer : SEC : SBC.W #$0007 : TAX
    LDA.L EnemyNames_name+5,X : AND.W #$00FF : SEC : SBC.W #$002C : STA.B DP_Temp16
    LDA.W #$0A00 : STA.B DP_Temp26
    LDA.W #$00C0 : STA.B DP_Temp14
    LDA.W #$0058 : STA.B DP_Temp12
    LDA.B DP_Temp16
    JSL Add_Debug_Spritemap_to_OAM
    PLX
    RTS


;;; $94B8: Debug handler - [debug index] = 8: enemy debugger - respawn enemy ;;;
DebugHandler_8_EnemyDebugger_RespawnEnemy:
;; Returns:
;;     A: Non-zero to skip processing frame

; Uses part of the enemy spawn data (recorded by $A0:88D0) as enemy population data for one enemy
; As the following RAM is garbage (the debug enemy name), respawning a multi-part enemy will crash
    PHB
    PEA $7E7E : PLB : PLB
    LDA.W #EnemySpawnData.ID : CLC : ADC.W DebugEnemyIndex : TAX
    LDY.W DebugEnemyIndex
    JSL Debug_SpawnEnemy_ToEnemyIndex_inY
    PLB
    STZ.W DebugIndex
    LDA.W #$0001
    RTS


;;; $94D5: Debug handler - [debug index] = 9: enemy debugger - enemy spawner ;;;
DebugHandler_9_EnemyDebugger_EnemySpawner:
;; Returns:
;;     A: Non-zero to skip processing frame
    LDA.W EnemySetPointer
    TAX ; >.<
    STA.W Temp_NumberOfEnemyPartsToSpawn
    LDX.W Temp_NumberOfEnemyPartsToSpawn ; >.<
    LDA.W #$0038 : STA.W Temp_RowYPosition

  .loop:
    LDX.W Temp_NumberOfEnemyPartsToSpawn
    LDA.L EnemySets_ID,X : CMP.W #$FFFF : BEQ .endLoop
    TAX
    LDA.L EnemyHeaders_name,X : TAX
    LDA.L EnemyNames_spritemap,X : CLC : ADC.W #$0030 : STA.B DP_Temp16
    LDA.W #$0A00 : STA.B DP_Temp26
    LDA.W #$00A8 : STA.B DP_Temp14
    LDA.W Temp_RowYPosition : CLC : ADC.W #$0018 : STA.B DP_Temp12
    LDA.B DP_Temp16 : AND.W #$00FF
    JSL Add_Debug_Spritemap_to_OAM
    LDX.W Temp_NumberOfEnemyPartsToSpawn
    LDA.L EnemySets_palette,X : STA.W Temp_DebuggerHexValue
    LDA.W #$00D8 : STA.W Temp_DebuggerHexValueXPosition
    LDA.W Temp_RowYPosition : STA.W Temp_DebuggerHexValueYPosition
    JSR Draw4DigitHexValue
    LDA.W Temp_RowYPosition : CLC : ADC.W #$0008 : STA.W Temp_RowYPosition
    LDA.W Temp_NumberOfEnemyPartsToSpawn : CLC : ADC.W #$0004 : STA.W Temp_NumberOfEnemyPartsToSpawn
    BRA .loop

  .endLoop:
    LDA.W #$0A00 : STA.B DP_Temp26
    LDA.W #$00B0 : STA.B DP_Temp14
    LDA.W #$0048 : STA.B DP_Temp12
    LDX.W DebugEnemyIndex
    LDA.L EnemySpawnData.ID,X : BNE .hasSpawnID
    LDA.W #$0030
    BRA .resolvedName

  .hasSpawnID:
    TAX
    LDA.L EnemyHeaders_name,X : BNE +
    LDA.W #$0030
    BRA .resolvedName

+   TAX
    LDA.L EnemyNames_spritemap,X : CLC : ADC.W #$0030

  .resolvedName:
    JSL Add_Debug_Spritemap_to_OAM
    LDA.B DP_Controller2New : BIT.W #$0400 : BEQ .checkTerminator
    LDA.W DebugEnemySetEntryIndex : CLC : ADC.W #$0004 : CMP.W #$0010 : BNE +
    LDA.W #$0000

+   STA.W DebugEnemySetEntryIndex

  .checkTerminator:
    LDA.W EnemySetPointer : CLC : ADC.W DebugEnemySetEntryIndex : TAX
    LDA.L EnemySets_ID,X : CMP.W #$FFFF : BNE +
    STZ.W DebugEnemySetEntryIndex
    LDX.W EnemySetPointer
    LDA.L EnemySets_ID,X

+   STA.B DP_Temp12
    TAX
    LDA.L EnemyHeaders_name,X : TAX
    LDA.L EnemyNames_population,X : TAX
    STX.W DebugEnemyPopulationPointer
    LDX.W DebugEnemyIndex
    LDA.B DP_Temp12 : STA.L EnemySpawnData.ID,X
    LDA.B DP_Controller2New : BIT.W #$0010 : BEQ .checkL
    STZ.W DebugIndex
    LDA.W #$0001
    RTS

  .checkL:
    LDA.B DP_Controller2New : BIT.W #$0020 : BNE .checkB
    LDA.W #$0001
    RTS

  .checkB:
    LDX.W DebugEnemyPopulationPointer
    CMP.W #$8000 : BMI +
    LDA.L EnemyNames_name,X : TAX
    LDA.L EnemyHeaders_name,X : TAX
    LDA.L EnemyNames_spritemap,X : BNE +
    STZ.W DebugIndex
    LDA.W #$0001
    RTS

+   LDY.W DebugEnemyIndex
    LDA.W Enemy.XPosition,Y : STA.W DebugEnemySpawnXPosition
    LDA.W Enemy.YPosition,Y : STA.W DebugEnemySpawnYPosition
    PHB
    PEA $B4B4 : PLB : PLB
    LDY.W DebugEnemyIndex
    LDX.W DebugEnemyPopulationPointer
    JSL Debug_SpawnEnemy_ToEnemyIndex_inY
    PLB
    LDY.W DebugEnemyIndex
    LDA.W DebugEnemySpawnXPosition : STA.W Enemy.XPosition,Y
    LDA.W DebugEnemySpawnYPosition : STA.W Enemy.YPosition,Y
    PHX : PHY
    TYX
    JSL Record_EnemySpawnData
    PLY : PLX
    STZ.W DebugIndex
    LDA.W #$0001
    RTS


;;; $9646: Debug. Handle cursor movement ;;;
Debug_HandleCursorMovement:
    LDA.B DP_Controller2New : BIT.W #$0100 : BEQ .noRight
    LDA.W DebugTextCursorXPosition : CLC : ADC.W #$0008 : CMP.W #$00E0 : BNE +
    LDA.W #$00C0

+   STA.W DebugTextCursorXPosition
    BRA .return

  .noRight:
    BIT.W #$0200 : BEQ .noLeft
    LDA.W DebugTextCursorXPosition : SEC : SBC.W #$0008 : CMP.W #$00B8 : BNE +
    LDA.W #$00D8

+   STA.W DebugTextCursorXPosition
    BRA .return

  .noLeft:
    BIT.W #$0400 : BEQ .noDown
    LDA.W DebugTextCursorYPosition : CLC : ADC.W #$0008 : CMP.W #$0068 : BNE +
    LDA.W #$0030

+   STA.W DebugTextCursorYPosition
    BRA .return

  .noDown:
    BIT.W #$0800 : BEQ .return
    LDA.W DebugTextCursorYPosition : SEC : SBC.W #$0008 : CMP.W #$0028 : BNE .setCursorY
    LDA.W #$0060

  .setCursorY:
    STA.W DebugTextCursorYPosition

  .return:
    RTS


;;; $96AB: Debug. Handle digit modification ;;;
Debug_HandleDigitModification:
    LDX.W DebugEnemyIndex
    LDA.L EnemySpawnData.XPosition,X : STA.B DP_Temp12
    LDA.L EnemySpawnData.YPosition,X : STA.B DP_Temp14
    LDA.L EnemySpawnData.initParam,X : STA.B DP_Temp16
    LDA.L EnemySpawnData.properties,X : STA.B DP_Temp18
    LDA.L EnemySpawnData.extraProperties,X : STA.B DP_Temp1A
    LDA.L EnemySpawnData.param1,X : STA.B DP_Temp1C
    LDA.L EnemySpawnData.param2,X : STA.B DP_Temp1E
    LDA.B DP_Controller2New : BIT.W #$0040 : BEQ .notNewlyPressedX
    LDA.W DebugTextCursorXPosition : SEC : SBC.W #$00C0 : LSR #2 : TAX
    LDA.W DebugTextCursorYPosition : SEC : SBC.W #$0030 : LSR #2 : TAY
    LDA.W $0012,Y : CLC : ADC.W .data,X : STA.W $0012,Y
    BRA +

  .notNewlyPressedX:
    BIT.W #$8000 : BEQ +
    LDA.W DebugTextCursorXPosition : SEC : SBC.W #$00C0 : LSR #2 : TAX
    LDA.W DebugTextCursorYPosition : SEC : SBC.W #$0030 : LSR #2 : TAY
    LDA.W $0012,Y : SEC : SBC.W .data,X : STA.W $0012,Y

+   LDX.W DebugEnemyIndex
    LDA.B DP_Temp12 : STA.L EnemySpawnData.XPosition,X
    LDA.B DP_Temp14 : STA.L EnemySpawnData.YPosition,X
    LDA.B DP_Temp16 : STA.L EnemySpawnData.initParam,X
    LDA.B DP_Temp18 : STA.L EnemySpawnData.properties,X
    LDA.B DP_Temp1A : STA.L EnemySpawnData.extraProperties,X
    LDA.B DP_Temp1C : STA.L EnemySpawnData.param1,X
    LDA.B DP_Temp1E : STA.L EnemySpawnData.param2,X
    RTS

  .data:
    dw $1000,$0100,$0010,$0001


;;; $9758: Debug handler - [debug index] = 10h: enemy debugger - enemy allocation viewer ;;;
DebugHandler_10_EnemyDebugger_EnemyAllocationViewer:
;; Returns:
;;     A: Non-zero to skip processing frame

; Shows the palette index of each enemy and total number of VRAM rows required for all enemies
    LDA.B DP_Controller2New : BIT.W #$2000 : BEQ .notNewlyPressedSelect
    STZ.W DebugIndex
    LDA.W #$0000
    RTS

  .notNewlyPressedSelect:
    LDA.W EnemySetPointer : TAX
    STA.W Temp_EnemySetEntryPointer
    LDX.W Temp_EnemySetEntryPointer
    LDA.W #$0038 : STA.W Temp_RowYPosition
    STZ.W Temp_RowsOfVRAM

  .loop:
    LDX.W Temp_EnemySetEntryPointer
    LDA.L EnemyNames_name,X : CMP.W #$FFFF : BEQ .terminated
    TAX
    LDA.L EnemyHeaders_tileDataSize,X : XBA : AND.W #$00FF : LSR
    CLC : ADC.W Temp_RowsOfVRAM : STA.W Temp_RowsOfVRAM
    LDA.L EnemyHeaders_name,X : TAX
    LDA.L EnemyNames_spritemap,X : CLC : ADC.W #$0030 : STA.B DP_Temp16
    LDA.W #$0A00 : STA.B DP_Temp26
    LDA.W #$00A8 : STA.B DP_Temp14
    LDA.W Temp_RowYPosition : CLC : ADC.W #$0018 : STA.B DP_Temp12
    LDA.B DP_Temp16 : AND.W #$00FF
    JSL Add_Debug_Spritemap_to_OAM
    LDX.W Temp_EnemySetEntryPointer
    LDA.L EnemySets_palette,X : STA.W Temp_DebuggerHexValue
    LDA.W #$00D8 : STA.W Temp_DebuggerHexValueXPosition
    LDA.W Temp_RowYPosition : STA.W Temp_DebuggerHexValueYPosition
    JSR Draw4DigitHexValue
    LDA.W Temp_RowYPosition : CLC : ADC.W #$0008 : STA.W Temp_RowYPosition
    LDA.W Temp_EnemySetEntryPointer : CLC : ADC.W #$0004 : STA.W Temp_EnemySetEntryPointer
    BRA .loop

  .terminated:
    LDA.W Temp_RowsOfVRAM : STA.W Temp_DebuggerHexValue
    LDA.W #$00A8 : STA.W Temp_DebuggerHexValueXPosition
    LDA.W Temp_RowYPosition : STA.W Temp_DebuggerHexValueYPosition
    JSR Draw4DigitHexValue
    LDA.W #$0000
    RTS


;;; $9809: Debug handler ;;;
DebugHandler:
;; Returns:
;;     A: Non-zero to skip processing frame
    PHB
    SEP #$20
    LDA.B #DebugHandler>>16 : PHA : PLB
    REP #$30
    LDA.W DebugIndex : AND.W #$00FF : ASL : TAX
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


;;; $9841: Debug handler - [debug index] = 4: sprite tiles viewer - 1st half ;;;
DebugHandler_4_SpriteTilesViewer_FirstHalf:
;; Returns:
;;     A: Non-zero to skip processing frame
    LDA.W #$0A00 : STA.B DP_Temp26
    LDA.W #$0080 : STA.B DP_Temp14
    LDA.W #$0080 : STA.B DP_Temp12
    LDA.W #$0003
    JSL Add_Debug_Spritemap_to_OAM
    LDA.W Debug_InputL : BIT.W #$0040 : BNE .resetIndex
    LDA.W #$0001
    RTS

  .resetIndex:
    STZ.W DebugIndex
    LDA.W #$0001
    RTS


;;; $986A: Debug handler - [debug index] = 3: sprite tiles viewer - 2nd half ;;;
DebugHandler_3_SpriteTilesViewer_SecondHalf:
    LDA.W Debug_InputL : BIT.W #$0080 : BEQ .noChange
    LDA.W neverRead185A : CMP.W #$0000 : BNE +
    LDA.W #$0200 : STA.W neverRead185A
    BRA .merge

+   CMP.W #$0200 : BNE +
    LDA.W #$0400 : STA.W neverRead185A
    BRA .merge

+   CMP.W #$0400 : BNE +
    LDA.W #$0600 : STA.W neverRead185A
    BRA .merge

+   CMP.W #$0600 : BNE +
    LDA.W #$0E00 : STA.W neverRead185A
    BRA .merge

+   LDA.W #$0000 : STA.W neverRead185A
    BRA .merge

  .noChange:
    LDA.W neverRead185A

  .merge:
    STA.B DP_Temp26
    LDA.W #$0080 : STA.B DP_Temp14
    LDA.W #$0080 : STA.B DP_Temp12
    LDA.W #$0002
    JSL Add_Debug_Spritemap_to_OAM
    LDA.W Debug_InputL : BIT.W #$0040 : BNE .incIndex
    LDA.W #$0001
    RTS

  .incIndex:
    INC.W DebugIndex
    LDA.W #$0001
    RTS


;;; $98DA: Debug handler - [debug index] = 1: palette viewer - sprite palettes ;;;
DebugHandler_1_PaletteViewer_SpritePalettes:
;; Returns:
;;     A: Non-zero to skip processing frame

; Note that this routine overwrites the sprite palettes with the BG palettes when switching over to the next debug index
    LDA.W #$0000 : STA.B DP_Temp26
    LDA.W #$0060 : STA.B DP_Temp14 : STA.B DP_Temp12
    LDA.W #$0000
    JSL Add_Debug_Spritemap_to_OAM
    LDA.W #$0000 : STA.B DP_Temp26
    LDA.W #$00A0 : STA.B DP_Temp14
    LDA.W #$0060 : STA.B DP_Temp12
    LDA.W #$0001
    JSL Add_Debug_Spritemap_to_OAM
    LDA.W Debug_InputL : BIT.W #$0080 : BNE .setupLoop
    LDA.W #$0001
    RTS

  .setupLoop:
    LDX.W #$00FE

  .loop:
    LDA.L Palettes,X : STA.L Palettes_SpriteP0,X
    DEX #2 : BNE .loop
    INC.W DebugIndex
    LDA.W #$0001
    RTS


;;; $9925: Debug handler - [debug index] = 2: palette viewer - BG palettes ;;;
DebugHandler_2_PaletteViewer_BGPalettes:
    LDA.W #$0000 : STA.B DP_Temp26
    LDA.W #$0060 : STA.B DP_Temp14 : STA.B DP_Temp12
    LDA.W #$0000
    JSL Add_Debug_Spritemap_to_OAM
    LDA.W #$0000 : STA.B DP_Temp26
    LDA.W #$00A0 : STA.B DP_Temp14
    LDA.W #$0060 : STA.B DP_Temp12
    LDA.W #$0001
    JSL Add_Debug_Spritemap_to_OAM
    LDA.W Debug_InputL : BIT.W #$0080 : BNE .resetIndex
    LDA.W #$0001
    RTS

  .resetIndex:
    STZ.W DebugIndex
    LDA.W #$0001
    RTS


;;; $9961: Debug handler - [debug index] = 0: default ;;;
DebugHandler_0_Default:
;; Returns:
;;     A: Non-zero to skip processing frame
    LDA.B DP_Controller2New : BIT.W #$1000 : BEQ .checkL
    LDX.W #$001D : STX.W GameState
    STZ.W PauseMenu_MenuIndex

  .checkL:
    LDA.B DP_Controller2New : BIT.W #$0020 : BEQ .notNewlyPressedStartL
    LDA.W DebugTimeIsFrozenForEnemies : EOR.W #$0001 : STA.W DebugTimeIsFrozenForEnemies

  .notNewlyPressedStartL:
    LDA.W Debug_InputL : BIT.W #$0080 : BNE .SelectLA
    LDA.W Debug_InputL : BIT.W #$0040 : BNE .SelectLX
    LDA.B DP_Controller2New : AND.W #$0010 : BNE .R
    LDA.B DP_Controller2New : BIT.W #$2000 : BNE .Select
    LDA.B DP_Controller2New : BIT.W #$0080 : BNE .A
    STZ.W DebugIndex
    LDA.W #$0000
    RTS

  .A:
    LDY.W #$0001
    LDA.W DebugDisableSpriteInteractions : BEQ .toggle
    LDY.W #$0000

  .toggle:
    TYA : STA.W DebugDisableSpriteInteractions
    LDA.W #$0000
    RTS

  .Select:
    LDA.W #$0010 : STA.W DebugIndex
    LDA.W #$0000
    RTS

  .SelectLX:
    INC.W DebugIndex : INC.W DebugIndex : INC.W DebugIndex
    LDA.W #$0001
    RTS

  .R:
    INC.W DebugIndex : INC.W DebugIndex : INC.W DebugIndex : INC.W DebugIndex : INC.W DebugIndex
    LDA.W #$0000
    RTS

  .SelectLA:
    SEP #$20
    LDA.B #$80 : STA.W $2100
    LDA.B #$00 : STA.W $2116
    LDA.B #$70 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl Tiles_Debug_PaletteViewer
    dw $1000
    LDA.B #$02 : STA.W $420B
    STZ.W $2100
    REP #$20
    INC.W DebugIndex
    LDA.W #$0001
    RTS


;;; $9A1D: Debug handler - [debug index] = 5: enemy debugger - initialise ;;;
DebugHandler_5_EnemyDebugger_Initialize:
;; Returns:
;;     A: Non-zero to skip processing frame
    SEP #$20
    LDA.B #$80 : STA.W $2100
    LDA.B #$00 : STA.W $2116
    LDA.B #$6B : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl Tiles_DebuggerFont
    dw $0A00
    LDA.B #$02 : STA.W $420B
    STZ.W $2100
    REP #$20
    LDA.W #$00C0 : STA.W DebugTextCursorXPosition
    LDA.W #$0030 : STA.W DebugTextCursorYPosition
    INC.W DebugIndex
    RTS


;;; $9A59: Debug handler - [debug index] = 6: enemy debugger - enemy mover ;;;
DebugHandler_6_EnemyDebugger_EnemyMover:
;; Returns:
;;     A: Non-zero to skip processing frame
    LDA.B DP_Controller2New : BIT.W #$0010 : BEQ .checkSelect
    INC.W DebugIndex
    LDA.W #$0000
    RTS

  .checkSelect:
    LDA.B DP_Controller2New : BIT.W #$2000 : BEQ .checkA
    LDA.B DP_Controller2Input : BIT.W #$8000 : BNE .pressingB
    LDA.W DebugEnemyIndex : CLC : ADC.W #$0040 : CMP.W #$0800 : BMI +
    LDA.W #$0000

+   STA.W DebugEnemyIndex
    BRA .checkA

  .pressingB:
    LDA.W DebugEnemyIndex : SEC : SBC.W #$0040 : BNE +
    LDA.W #$07C0

+   STA.W DebugEnemyIndex

  .checkA:
    LDA.B DP_Controller2New : BIT.W #$0080 : BEQ .checkX
    LDX.W DebugEnemyIndex
    LDA.W SamusXPosition : CLC : ADC.W #$0020 : STA.W Enemy.XPosition,X
    LDA.W SamusYPosition : STA.W Enemy.YPosition,X

  .checkX:
    LDX.W DebugEnemyIndex
    LDA.B DP_Controller2Input : BIT.W #$0040 : BEQ .moveWithDpad
    JSL Debug_MoveEnemyWithDpad_4PixelsPerFrame
    BRA +

  .moveWithDpad:
    JSL Debug_MoveEnemyWithDpad_QuarterPixelPerFrame

+   LDX.W DebugEnemyIndex
    LDA.W Enemy.XPosition,X : CMP.W Layer1XPosition : BMI +
    LDA.W Layer1XPosition : CLC : ADC.W #$0100 : CMP.W Enemy.XPosition,X : BMI +
    LDA.W Enemy.YPosition,X : CMP.W Layer1YPosition : BMI +
    LDA.W Layer1YPosition : CLC : ADC.W #$0100 : CMP.W Enemy.YPosition,X : BMI +
    LDX.W DebugEnemyIndex
    LDA.W Enemy.XPosition,X : SEC : SBC.W Layer1XPosition : STA.B DP_Temp14 : STA.W Temp_DebuggerHexValueYPosition
    LDA.W Enemy.YPosition,X : SEC : SBC.W Layer1YPosition : STA.B DP_Temp12 : STA.W Temp_DebuggerHexValueXPosition
    LDA.W Temp_DebuggerHexValueYPosition : CLC : ADC.W #$0020 : STA.B DP_Temp14
    LDA.W Temp_DebuggerHexValueXPosition : CLC : ADC.W #$0004 : STA.B DP_Temp12
    LDA.W #$0A00 : STA.B DP_Temp26
    LDA.W #$0025
    JSL Add_Debug_Spritemap_to_OAM

+   LDA.W #$00B0 : STA.B DP_Temp14
    LDA.W #$0050 : STA.B DP_Temp12
    LDA.W #$0A00 : STA.B DP_Temp26
    LDA.W #$0027
    JSL Add_Debug_Spritemap_to_OAM
    LDX.W DebugEnemyIndex
    LDA.W Enemy.XPosition,X : STA.W Temp_DebuggerHexValue
    LDA.W #$00E0 : STA.W Temp_DebuggerHexValueXPosition
    LDA.W #$0038 : STA.W Temp_DebuggerHexValueYPosition
    JSR Draw4DigitHexValue
    LDX.W DebugEnemyIndex
    LDA.W Enemy.YPosition,X : STA.W Temp_DebuggerHexValue
    LDA.W #$00E0 : STA.W Temp_DebuggerHexValueXPosition
    LDA.W #$0040 : STA.W Temp_DebuggerHexValueYPosition
    JSR Draw4DigitHexValue
    LDX.W DebugEnemyIndex
    LDA.W Enemy.health,X : STA.W Temp_DebuggerHexValue
    LDA.W #$00E0 : STA.W Temp_DebuggerHexValueXPosition
    LDA.W #$0048 : STA.W Temp_DebuggerHexValueYPosition
    JSR Draw4DigitHexValue
    LDA.W DebugEnemyIndex : STA.W Temp_DebuggerHexValue
    LDA.W #$00E0 : STA.W Temp_DebuggerHexValueXPosition
    LDA.W #$0050 : STA.W Temp_DebuggerHexValueYPosition
    JSR Draw4DigitHexValue
    LDA.W #$0A00 : STA.B DP_Temp26
    LDA.W #$00B0 : STA.B DP_Temp14
    LDA.W #$0048 : STA.B DP_Temp12
    LDX.W DebugEnemyIndex
    LDA.W Enemy.ID,X : TAX
    LDA.L EnemyHeaders_name,X : BNE .debugName
    LDA.W #$0030
    BRA .draw

  .debugName:
    TAX
    LDA.L EnemyNames_spritemap,X : CLC : ADC.W #$0030

  .draw:
    JSL Add_Debug_Spritemap_to_OAM
    JSR Debug_Draw_Enemy_Set_Name
    STZ.W DebugEnemySetEntryIndex
    LDA.W #$0000
    RTS


;;; $9BD5: Debug handler - [debug index] = Ah: enemy debugger - RAM viewer - page 0 ;;;
DebugHandler_A_EnemyDebugger_RAMViewer_0:
;; Returns:
;;     A: Non-zero to skip processing frame

; When drawn with the text, result looks like:
;     TK_UPTM: [frame counter]
;     TK_Stat: [AI handler]
;     TK_Num : [ID]
;     TK_Bank: [bank]
    LDA.B DP_Controller2New : BIT.W #$0010 : BEQ +
    INC.W DebugIndex
    LDA.W #$0000
    RTS

+   LDA.W #$00B0 : STA.B DP_Temp14
    LDA.W #$0050 : STA.B DP_Temp12
    LDA.W #$0A00 : STA.B DP_Temp26
    LDA.W #$0029
    JSL Add_Debug_Spritemap_to_OAM
    LDX.W DebugEnemyIndex
    LDA.W Enemy.frameCounter,X : STA.W Temp_DebuggerHexValue
    LDA.W #$00E0 : STA.W Temp_DebuggerHexValueXPosition
    LDA.W #$0038 : STA.W Temp_DebuggerHexValueYPosition
    JSR Draw4DigitHexValue
    LDX.W DebugEnemyIndex
    LDA.W Enemy.AI,X : STA.W Temp_DebuggerHexValue
    LDA.W #$00E0 : STA.W Temp_DebuggerHexValueXPosition
    LDA.W #$0040 : STA.W Temp_DebuggerHexValueYPosition
    JSR Draw4DigitHexValue
    LDX.W DebugEnemyIndex
    LDA.W Enemy.ID,X : STA.W Temp_DebuggerHexValue
    LDA.W #$00E0 : STA.W Temp_DebuggerHexValueXPosition
    LDA.W #$0048 : STA.W Temp_DebuggerHexValueYPosition
    JSR Draw4DigitHexValue
    LDX.W DebugEnemyIndex
    LDA.W Enemy.bank,X : STA.W Temp_DebuggerHexValue
    LDA.W #$00E0 : STA.W Temp_DebuggerHexValueXPosition
    LDA.W #$0050 : STA.W Temp_DebuggerHexValueYPosition
    JSR Draw4DigitHexValue
    LDA.W #$0000
    RTS


;;; $9C5D: Debug handler - [debug index] = Bh: enemy debugger - RAM viewer - page 1 ;;;
DebugHandler_B_EnemyDebugger_RAMViewer_1:
;; Returns:
;;     A: Non-zero to skip processing frame

; When drawn with the text, result looks like:
;     Switch : [properties]
;     Switch2: [extra properties]
;     ColorPa: [palette index]
;     CharaOf: [VRAM tiles index]
    LDA.B DP_Controller2New : BIT.W #$0010 : BEQ +
    INC.W DebugIndex
    LDA.W #$0000
    RTS

+   LDA.W #$00B0 : STA.B DP_Temp14
    LDA.W #$0050 : STA.B DP_Temp12
    LDA.W #$0A00 : STA.B DP_Temp26
    LDA.W #$002A
    JSL Add_Debug_Spritemap_to_OAM
    LDX.W DebugEnemyIndex
    LDA.W Enemy.properties,X : STA.W Temp_DebuggerHexValue
    LDA.W #$00E0 : STA.W Temp_DebuggerHexValueXPosition
    LDA.W #$0038 : STA.W Temp_DebuggerHexValueYPosition
    JSR Draw4DigitHexValue
    LDX.W DebugEnemyIndex
    LDA.W Enemy.properties2,X : STA.W Temp_DebuggerHexValue
    LDA.W #$00E0 : STA.W Temp_DebuggerHexValueXPosition
    LDA.W #$0040 : STA.W Temp_DebuggerHexValueYPosition
    JSR Draw4DigitHexValue
    LDX.W DebugEnemyIndex
    LDA.W Enemy.palette,X : STA.W Temp_DebuggerHexValue
    LDA.W #$00E0 : STA.W Temp_DebuggerHexValueXPosition
    LDA.W #$0048 : STA.W Temp_DebuggerHexValueYPosition
    JSR Draw4DigitHexValue
    LDX.W DebugEnemyIndex
    LDA.W Enemy.GFXOffset,X : STA.W Temp_DebuggerHexValue
    LDA.W #$00E0 : STA.W Temp_DebuggerHexValueXPosition
    LDA.W #$0050 : STA.W Temp_DebuggerHexValueYPosition
    JSR Draw4DigitHexValue
    LDA.W #$0000
    RTS


;;; $9CE5: Debug handler - [debug index] = Ch: enemy debugger - RAM viewer - page 2 ;;;
DebugHandler_C_EnemyDebugger_RAMViewer_2:
;; Returns:
;;     A: Non-zero to skip processing frame

; When drawn with the text, result looks like:
;     PoseAdr: [instruction list pointer]
;     WaitTim: [instruction timer]
;     LpCnt  : [timer]
;     Patern : [spritemap pointer]
    LDA.B DP_Controller2New : BIT.W #$0010 : BEQ +
    INC.W DebugIndex
    LDA.W #$0000
    RTS

+   LDA.W #$00B0 : STA.B DP_Temp14
    LDA.W #$0050 : STA.B DP_Temp12
    LDA.W #$0A00 : STA.B DP_Temp26
    LDA.W #$002B
    JSL Add_Debug_Spritemap_to_OAM
    LDX.W DebugEnemyIndex
    LDA.W Enemy.instList,X : STA.W Temp_DebuggerHexValue
    LDA.W #$00E0 : STA.W Temp_DebuggerHexValueXPosition
    LDA.W #$0038 : STA.W Temp_DebuggerHexValueYPosition
    JSR Draw4DigitHexValue
    LDX.W DebugEnemyIndex
    LDA.W Enemy.instTimer,X : STA.W Temp_DebuggerHexValue
    LDA.W #$00E0 : STA.W Temp_DebuggerHexValueXPosition
    LDA.W #$0040 : STA.W Temp_DebuggerHexValueYPosition
    JSR Draw4DigitHexValue
    LDX.W DebugEnemyIndex
    LDA.W Enemy.loopCounter,X : STA.W Temp_DebuggerHexValue
    LDA.W #$00E0 : STA.W Temp_DebuggerHexValueXPosition
    LDA.W #$0048 : STA.W Temp_DebuggerHexValueYPosition
    JSR Draw4DigitHexValue
    LDX.W DebugEnemyIndex
    LDA.W Enemy.spritemap,X : STA.W Temp_DebuggerHexValue
    LDA.W #$00E0 : STA.W Temp_DebuggerHexValueXPosition
    LDA.W #$0050 : STA.W Temp_DebuggerHexValueYPosition
    JSR Draw4DigitHexValue
    LDA.W #$0000
    RTS


;;; $9D6D: Debug handler - [debug index] = Dh: enemy debugger - RAM viewer - page 3 ;;;
DebugHandler_D_EnemyDebugger_RAMViewer_3:
;; Returns:
;;     A: Non-zero to skip processing frame

; When drawn with the text, result looks like:
;     FlashCo: [flash timer]
;     IceCoun: [frozen timer]
;     HitCoun: [invincibility timer]
;     PlplCou: [shake timer]
    LDA.B DP_Controller2New : BIT.W #$0010 : BEQ +
    INC.W DebugIndex
    LDA.W #$0000
    RTS

+   LDA.W #$00B0 : STA.B DP_Temp14
    LDA.W #$0050 : STA.B DP_Temp12
    LDA.W #$0A00 : STA.B DP_Temp26
    LDA.W #$002C
    JSL Add_Debug_Spritemap_to_OAM
    LDX.W DebugEnemyIndex
    LDA.W Enemy.flashTimer,X : STA.W Temp_DebuggerHexValue
    LDA.W #$00E0 : STA.W Temp_DebuggerHexValueXPosition
    LDA.W #$0038 : STA.W Temp_DebuggerHexValueYPosition
    JSR Draw4DigitHexValue
    LDX.W DebugEnemyIndex
    LDA.W Enemy.freezeTimer,X : STA.W Temp_DebuggerHexValue
    LDA.W #$00E0 : STA.W Temp_DebuggerHexValueXPosition
    LDA.W #$0040 : STA.W Temp_DebuggerHexValueYPosition
    JSR Draw4DigitHexValue
    LDX.W DebugEnemyIndex
    LDA.W Enemy.invincibilityTimer,X : STA.W Temp_DebuggerHexValue
    LDA.W #$00E0 : STA.W Temp_DebuggerHexValueXPosition
    LDA.W #$0048 : STA.W Temp_DebuggerHexValueYPosition
    JSR Draw4DigitHexValue
    LDX.W DebugEnemyIndex
    LDA.W Enemy.shakeTimer,X : STA.W Temp_DebuggerHexValue
    LDA.W #$00E0 : STA.W Temp_DebuggerHexValueXPosition
    LDA.W #$0050 : STA.W Temp_DebuggerHexValueYPosition
    JSR Draw4DigitHexValue
    LDA.W #$0000
    RTS


;;; $9DF5: Debug handler - [debug index] = Eh: enemy debugger - RAM viewer - page 4 ;;;
DebugHandler_E_EnemyDebugger_RAMViewer_4:
;; Returns:
;;     A: Non-zero to skip processing frame

; When drawn with the text, result looks like:
;     Pwork0 : Enemy.var0
;     Pwork1 : Enemy.var1
;     Pwork2 : Enemy.var2
;     Pwork3 : Enemy.var3
    LDA.B DP_Controller2New : BIT.W #$0010 : BEQ +
    INC.W DebugIndex
    LDA.W #$0000
    RTS

+   LDA.W #$00B0 : STA.B DP_Temp14
    LDA.W #$0050 : STA.B DP_Temp12
    LDA.W #$0A00 : STA.B DP_Temp26
    LDA.W #$002D
    JSL Add_Debug_Spritemap_to_OAM
    LDX.W DebugEnemyIndex
    LDA.W Enemy.var0,X : STA.W Temp_DebuggerHexValue
    LDA.W #$00E0 : STA.W Temp_DebuggerHexValueXPosition
    LDA.W #$0038 : STA.W Temp_DebuggerHexValueYPosition
    JSR Draw4DigitHexValue
    LDX.W DebugEnemyIndex
    LDA.W Enemy.var1,X : STA.W Temp_DebuggerHexValue
    LDA.W #$00E0 : STA.W Temp_DebuggerHexValueXPosition
    LDA.W #$0040 : STA.W Temp_DebuggerHexValueYPosition
    JSR Draw4DigitHexValue
    LDX.W DebugEnemyIndex
    LDA.W Enemy.var2,X : STA.W Temp_DebuggerHexValue
    LDA.W #$00E0 : STA.W Temp_DebuggerHexValueXPosition
    LDA.W #$0048 : STA.W Temp_DebuggerHexValueYPosition
    JSR Draw4DigitHexValue
    LDX.W DebugEnemyIndex
    LDA.W Enemy.var3,X : STA.W Temp_DebuggerHexValue
    LDA.W #$00E0 : STA.W Temp_DebuggerHexValueXPosition
    LDA.W #$0050 : STA.W Temp_DebuggerHexValueYPosition
    JSR Draw4DigitHexValue
    LDA.W #$0000
    RTS


;;; $9E7D: Debug handler - [debug index] = Fh: enemy debugger - RAM viewer - page 5 ;;;
DebugHandler_F_EnemyDebugger_RAMViewer_5:
;; Returns:
;;     A: Non-zero to skip processing frame

; When drawn with the text, result looks like:
;     Pwork4 : Enemy.var4
;     Pwork5 : Enemy.var5
;     InitOP0: Enemy.init0
;     InitOP1: Enemy.init1
    LDA.B DP_Controller2New : BIT.W #$0010 : BEQ +
    INC.W DebugIndex
    LDA.W #$0000
    RTS

+   LDA.W #$00B0 : STA.B DP_Temp14
    LDA.W #$0050 : STA.B DP_Temp12
    LDA.W #$0A00 : STA.B DP_Temp26
    LDA.W #$002E
    JSL Add_Debug_Spritemap_to_OAM
    LDX.W DebugEnemyIndex
    LDA.W Enemy.var4,X : STA.W Temp_DebuggerHexValue
    LDA.W #$00E0 : STA.W Temp_DebuggerHexValueXPosition
    LDA.W #$0038 : STA.W Temp_DebuggerHexValueYPosition
    JSR Draw4DigitHexValue
    LDX.W DebugEnemyIndex
    LDA.W Enemy.var5,X : STA.W Temp_DebuggerHexValue
    LDA.W #$00E0 : STA.W Temp_DebuggerHexValueXPosition
    LDA.W #$0040 : STA.W Temp_DebuggerHexValueYPosition
    JSR Draw4DigitHexValue
    LDX.W DebugEnemyIndex
    LDA.W Enemy.init0,X : STA.W Temp_DebuggerHexValue
    LDA.W #$00E0 : STA.W Temp_DebuggerHexValueXPosition
    LDA.W #$0048 : STA.W Temp_DebuggerHexValueYPosition
    JSR Draw4DigitHexValue
    LDX.W DebugEnemyIndex
    LDA.W Enemy.init1,X : STA.W Temp_DebuggerHexValue
    LDA.W #$00E0 : STA.W Temp_DebuggerHexValueXPosition
    LDA.W #$0050 : STA.W Temp_DebuggerHexValueYPosition
    JSR Draw4DigitHexValue
    LDA.W #$0000
    RTS


;;; $9F05: Debug. Move enemy with d-pad 1/4 px/frame ;;;
Debug_MoveEnemyWithDpad_QuarterPixelPerFrame:
;; Parameters:
;;     X: Debug enemy index
    LDA.W NMI_FrameCounter : AND.W #$0003 : BNE .return
    LDA.B DP_Controller2Input : BIT.W #$0200 : BEQ .notPressingLeft
    DEC.W Enemy.XPosition,X
    BRA .checkUp

  .notPressingLeft:
    BIT.W #$0100 : BEQ .checkUp
    INC.W Enemy.XPosition,X

  .checkUp:
    LDA.B DP_Controller2Input : BIT.W #$0800 : BEQ .notPressingUp
    DEC.W Enemy.YPosition,X
    BRA .return

  .notPressingUp:
    BIT.W #$0400 : BEQ .return
    INC.W Enemy.YPosition,X

  .return:
    RTL


;;; $9F36: Debug. Move enemy with d-pad 4 px/frame ;;;
Debug_MoveEnemyWithDpad_4PixelsPerFrame:
    LDA.B DP_Controller2Input : BIT.W #$0200 : BEQ .notPressingLeft
    LDA.W Enemy.XPosition,X : SEC : SBC.W #$0004 : STA.W Enemy.XPosition,X
    BRA .checkUp

  .notPressingLeft:
    BIT.W #$0100 : BEQ .checkUp
    LDA.W Enemy.XPosition,X : CLC : ADC.W #$0004 : STA.W Enemy.XPosition,X

  .checkUp:
    LDA.B DP_Controller2Input : BIT.W #$0800 : BEQ .notPressingUp
    LDA.W Enemy.YPosition,X : SEC : SBC.W #$0004 : STA.W Enemy.YPosition,X
    BRA .return

  .notPressingUp:
    BIT.W #$0400 : BEQ .return
    INC.W Enemy.YPosition,X
    LDA.W Enemy.YPosition,X : CLC : ADC.W #$0004 : STA.W Enemy.YPosition,X

  .return:
    RTL


;;; $9F7E: Draw 4 digit hex value ;;;
Draw4DigitHexValue:
;; Parameters:
;;     Temp_DebuggerHexValueXPosition: X position
;;     Temp_DebuggerHexValueYPosition: Y position
;;     Temp_DebuggerHexValue: Hex value
    LDA.W Temp_DebuggerHexValueXPosition : CLC : ADC.W #$0000 : STA.B DP_Temp14
    LDA.W Temp_DebuggerHexValueYPosition : CLC : ADC.W #$0000 : STA.B DP_Temp12
    LDA.W #$0A00 : STA.B DP_Temp26
    LDA.W Temp_DebuggerHexValue : AND.W #$F000 : XBA
    LSR #4 : CLC : ADC.W #$0004
    JSL Add_Debug_Spritemap_to_OAM
    LDA.W Temp_DebuggerHexValueXPosition : CLC : ADC.W #$0008 : STA.B DP_Temp14
    LDA.W Temp_DebuggerHexValueYPosition : CLC : ADC.W #$0000 : STA.B DP_Temp12
    LDA.W #$0A00 : STA.B DP_Temp26
    LDA.W Temp_DebuggerHexValue : AND.W #$0F00 : XBA : CLC : ADC.W #$0004
    JSL Add_Debug_Spritemap_to_OAM
    LDA.W Temp_DebuggerHexValueXPosition : CLC : ADC.W #$0010 : STA.B DP_Temp14
    LDA.W Temp_DebuggerHexValueYPosition : CLC : ADC.W #$0000 : STA.B DP_Temp12
    LDA.W #$0A00 : STA.B DP_Temp26
    LDA.W Temp_DebuggerHexValue : AND.W #$00F0
    LSR #4 : CLC : ADC.W #$0004
    JSL Add_Debug_Spritemap_to_OAM
    LDA.W Temp_DebuggerHexValueXPosition : CLC : ADC.W #$0018 : STA.B DP_Temp14
    LDA.W #$0A00 : STA.B DP_Temp26
    LDA.W Temp_DebuggerHexValueYPosition : CLC : ADC.W #$0000 : STA.B DP_Temp12
    LDA.W Temp_DebuggerHexValue : AND.W #$000F : CLC : ADC.W #$0004
    JSL Add_Debug_Spritemap_to_OAM
    RTS


;;; $A01D: Add debug spritemap to OAM ;;;
Add_Debug_Spritemap_to_OAM:
;; Parameters:
;;     A:   Index into $A201 table
;;     $12: Y position of spritemap centre
;;     $14: X position of spritemap centre
;;     $26: Palette bits of sprite. If zero, spritemap entry palette is used

; Spritemap format is roughly:
;     nnnn         ; Number of entries (2 bytes)
;     xxxx yy attt ; Entry 0 (5 bytes)
;     ...          ; Entry 1...
; Where:
;     n = number of entries
;     x = X offset of sprite from centre
;     y = Y offset of sprite from centre
;     a = attributes
;     t = tile number

; More specifically, a spritemap entry is:
;     00000s0xxxxxxxxx yyyyyyyy YXppPPPttttttttt
; Where:
;     s = size bit <-- This is different to the regular spritemap format
;     x = X offset of sprite from centre
;     y = Y offset of sprite from centre
;     Y = Y flip
;     X = X flip
;     P = palette
;     p = priority (relative to background)
;     t = tile number
    PHP
    SEP #$20 ; >.<
    PHB
    PHK : PLB
    REP #$30
    ASL : TAX
    LDA.W Debug_Spritemap_Addresses,X : TAY
    LDA.W $0000,Y
    INY #2
    STA.B DP_Temp18
    LDX.W OAMStack

  .loop:
    LDA.W $0000,Y : STA.B DP_Temp1A
    AND.W #$01FF
    INY #2
    CLC : ADC.B DP_Temp14 : STA.W OAMLow,X
    INX
    LDA.B DP_Temp1B : AND.W #$0002 : BEQ +
    TXA : STA.B DP_Temp1C
    LSR
    PHY
    TAY
    AND.W #$000E : TAX
    LDA.W .indices,Y : TAY
    LDA.W .size,X : ORA.W OAMHigh,Y : STA.W OAMHigh,Y
    PLY
    LDX.B DP_Temp1C

+   LDA.W OAMLow,X : AND.W #$0001 : BEQ +
    TXA : STA.B DP_Temp1C
    LSR
    PHY
    TAY
    AND.W #$000E : TAX
    LDA.W .indices,Y : TAY
    LDA.W .XPosition,X : ORA.W OAMHigh,Y : STA.W OAMHigh,Y
    PLY
    LDX.B DP_Temp1C

+   SEP #$20
    LDA.W $0000,Y : BMI +
    CLC : ADC.B DP_Temp12 : BCS .F0
    CMP.B #$F0 : BCC .store
    BRA .F0

+   CLC : ADC.B DP_Temp12 : BCS .checkMax
    CMP.B #$F0 : BCS .store
    BRA .F0

  .checkMax:
    CMP.B #$F0 : BCC .store

  .F0:
    LDA.B #$F0

  .store:
    STA.W OAMLow,X
    REP #$20
    INX

  .unknown:
    INY
    LDA.B DP_Temp26 : BEQ .useSpritemapEntryPalette
    LDA.W $0000,Y : AND.W #$F1FF : ORA.B DP_Temp26
    BRA .next

  .useSpritemapEntryPalette:
    LDA.W $0000,Y

  .next:
    STA.W OAMLow,X
    INY #2
    INX #2 : CPX.W #$01FF : BPL .return
    DEC.B DP_Temp18 : BEQ .return
    JMP .loop

  .return:
    STX.W OAMStack
    SEP #$20 ; >.<
    PLB
    REP #$20 ; >.<
    PLP
    RTL

  .size:
; OAM size bits
    dw $0002,$0008,$0020,$0080,$0200,$0800,$2000,$8000

  .XPosition:
; OAM X position high bits
    dw $0001,$0004,$0010,$0040,$0100,$0400,$1000,$4000

  .indices:
; High OAM indices (indexed by [(low) OAM index] / 2)
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


;;; $A201: Debug spritemap addresses ;;;
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


;;; $A327..BC25: Debug spritemaps ;;;
DebugSpritemaps_0_PaletteViewer_LeftHalf:
    dw $0040
    %spritemapEntry(0, $18, $18, 0, 0, 3, 7, $177)
    %spritemapEntry(0, $10, $18, 0, 0, 3, 7, $176)
    %spritemapEntry(0, $08, $18, 0, 0, 3, 7, $175)
    %spritemapEntry(0, $00, $18, 0, 0, 3, 7, $174)
    %spritemapEntry(0, $1F8, $18, 0, 0, 3, 7, $173)
    %spritemapEntry(0, $1F0, $18, 0, 0, 3, 7, $172)
    %spritemapEntry(0, $1E8, $18, 0, 0, 3, 7, $171)
    %spritemapEntry(0, $1E0, $18, 0, 0, 3, 7, $170)
    %spritemapEntry(0, $18, $10, 0, 0, 3, 6, $167)
    %spritemapEntry(0, $10, $10, 0, 0, 3, 6, $166)
    %spritemapEntry(0, $08, $10, 0, 0, 3, 6, $165)
    %spritemapEntry(0, $00, $10, 0, 0, 3, 6, $164)
    %spritemapEntry(0, $1F8, $10, 0, 0, 3, 6, $163)
    %spritemapEntry(0, $1F0, $10, 0, 0, 3, 6, $162)
    %spritemapEntry(0, $1E8, $10, 0, 0, 3, 6, $161)
    %spritemapEntry(0, $1E0, $10, 0, 0, 3, 6, $160)
    %spritemapEntry(0, $18, $08, 0, 0, 3, 5, $157)
    %spritemapEntry(0, $10, $08, 0, 0, 3, 5, $156)
    %spritemapEntry(0, $08, $08, 0, 0, 3, 5, $155)
    %spritemapEntry(0, $00, $08, 0, 0, 3, 5, $154)
    %spritemapEntry(0, $1F8, $08, 0, 0, 3, 5, $153)
    %spritemapEntry(0, $1F0, $08, 0, 0, 3, 5, $152)
    %spritemapEntry(0, $1E8, $08, 0, 0, 3, 5, $151)
    %spritemapEntry(0, $1E0, $08, 0, 0, 3, 5, $150)
    %spritemapEntry(0, $18, $00, 0, 0, 3, 4, $147)
    %spritemapEntry(0, $10, $00, 0, 0, 3, 4, $146)
    %spritemapEntry(0, $08, $00, 0, 0, 3, 4, $145)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 4, $144)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 4, $143)
    %spritemapEntry(0, $1F0, $00, 0, 0, 3, 4, $142)
    %spritemapEntry(0, $1E8, $00, 0, 0, 3, 4, $141)
    %spritemapEntry(0, $1E0, $00, 0, 0, 3, 4, $140)
    %spritemapEntry(0, $18, $F8, 0, 0, 3, 3, $137)
    %spritemapEntry(0, $10, $F8, 0, 0, 3, 3, $136)
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 3, $135)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 3, $134)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 3, $133)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 3, $132)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 3, $131)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 3, $130)
    %spritemapEntry(0, $18, $F0, 0, 0, 3, 2, $127)
    %spritemapEntry(0, $10, $F0, 0, 0, 3, 2, $126)
    %spritemapEntry(0, $08, $F0, 0, 0, 3, 2, $125)
    %spritemapEntry(0, $00, $F0, 0, 0, 3, 2, $124)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 3, 2, $123)
    %spritemapEntry(0, $1F0, $F0, 0, 0, 3, 2, $122)
    %spritemapEntry(0, $1E8, $F0, 0, 0, 3, 2, $121)
    %spritemapEntry(0, $1E0, $F0, 0, 0, 3, 2, $120)
    %spritemapEntry(0, $18, $E8, 0, 0, 3, 1, $117)
    %spritemapEntry(0, $10, $E8, 0, 0, 3, 1, $116)
    %spritemapEntry(0, $08, $E8, 0, 0, 3, 1, $115)
    %spritemapEntry(0, $00, $E8, 0, 0, 3, 1, $114)
    %spritemapEntry(0, $1F8, $E8, 0, 0, 3, 1, $113)
    %spritemapEntry(0, $1F0, $E8, 0, 0, 3, 1, $112)
    %spritemapEntry(0, $1E8, $E8, 0, 0, 3, 1, $111)
    %spritemapEntry(0, $1E0, $E8, 0, 0, 3, 1, $110)
    %spritemapEntry(0, $18, $E0, 0, 0, 3, 0, $107)
    %spritemapEntry(0, $10, $E0, 0, 0, 3, 0, $106)
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $105)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $104)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $103)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $102)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $101)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 1, $100)

DebugSpritemaps_1_PaletteViewer_RightHalf:
    dw $0040
    %spritemapEntry(0, $18, $18, 0, 0, 3, 7, $17F)
    %spritemapEntry(0, $10, $18, 0, 0, 3, 7, $17E)
    %spritemapEntry(0, $08, $18, 0, 0, 3, 7, $17D)
    %spritemapEntry(0, $00, $18, 0, 0, 3, 7, $17C)
    %spritemapEntry(0, $1F8, $18, 0, 0, 3, 7, $17B)
    %spritemapEntry(0, $1F0, $18, 0, 0, 3, 7, $17A)
    %spritemapEntry(0, $1E8, $18, 0, 0, 3, 7, $179)
    %spritemapEntry(0, $1E0, $18, 0, 0, 3, 7, $178)
    %spritemapEntry(0, $18, $10, 0, 0, 3, 6, $16F)
    %spritemapEntry(0, $10, $10, 0, 0, 3, 6, $16E)
    %spritemapEntry(0, $08, $10, 0, 0, 3, 6, $16D)
    %spritemapEntry(0, $00, $10, 0, 0, 3, 6, $16C)
    %spritemapEntry(0, $1F8, $10, 0, 0, 3, 6, $16B)
    %spritemapEntry(0, $1F0, $10, 0, 0, 3, 6, $16A)
    %spritemapEntry(0, $1E8, $10, 0, 0, 3, 6, $169)
    %spritemapEntry(0, $1E0, $10, 0, 0, 3, 6, $168)
    %spritemapEntry(0, $18, $08, 0, 0, 3, 5, $15F)
    %spritemapEntry(0, $10, $08, 0, 0, 3, 5, $15E)
    %spritemapEntry(0, $08, $08, 0, 0, 3, 5, $15D)
    %spritemapEntry(0, $00, $08, 0, 0, 3, 5, $15C)
    %spritemapEntry(0, $1F8, $08, 0, 0, 3, 5, $15B)
    %spritemapEntry(0, $1F0, $08, 0, 0, 3, 5, $15A)
    %spritemapEntry(0, $1E8, $08, 0, 0, 3, 5, $159)
    %spritemapEntry(0, $1E0, $08, 0, 0, 3, 5, $158)
    %spritemapEntry(0, $18, $00, 0, 0, 3, 4, $14F)
    %spritemapEntry(0, $10, $00, 0, 0, 3, 4, $14E)
    %spritemapEntry(0, $08, $00, 0, 0, 3, 4, $14D)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 4, $14C)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 4, $14B)
    %spritemapEntry(0, $1F0, $00, 0, 0, 3, 4, $14A)
    %spritemapEntry(0, $1E8, $00, 0, 0, 3, 4, $149)
    %spritemapEntry(0, $1E0, $00, 0, 0, 3, 4, $148)
    %spritemapEntry(0, $18, $F8, 0, 0, 3, 3, $13F)
    %spritemapEntry(0, $10, $F8, 0, 0, 3, 3, $13E)
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 3, $13D)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 3, $13C)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 3, $13B)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 3, $13A)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 3, $139)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 3, $138)
    %spritemapEntry(0, $18, $F0, 0, 0, 3, 2, $12F)
    %spritemapEntry(0, $10, $F0, 0, 0, 3, 2, $12E)
    %spritemapEntry(0, $08, $F0, 0, 0, 3, 2, $12D)
    %spritemapEntry(0, $00, $F0, 0, 0, 3, 2, $12C)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 3, 2, $12B)
    %spritemapEntry(0, $1F0, $F0, 0, 0, 3, 2, $12A)
    %spritemapEntry(0, $1E8, $F0, 0, 0, 3, 2, $129)
    %spritemapEntry(0, $1E0, $F0, 0, 0, 3, 2, $128)
    %spritemapEntry(0, $18, $E8, 0, 0, 3, 1, $11F)
    %spritemapEntry(0, $10, $E8, 0, 0, 3, 1, $11E)
    %spritemapEntry(0, $08, $E8, 0, 0, 3, 1, $11D)
    %spritemapEntry(0, $00, $E8, 0, 0, 3, 1, $11C)
    %spritemapEntry(0, $1F8, $E8, 0, 0, 3, 1, $11B)
    %spritemapEntry(0, $1F0, $E8, 0, 0, 3, 1, $11A)
    %spritemapEntry(0, $1E8, $E8, 0, 0, 3, 1, $119)
    %spritemapEntry(0, $1E0, $E8, 0, 0, 3, 1, $118)
    %spritemapEntry(0, $18, $E0, 0, 0, 3, 0, $10F)
    %spritemapEntry(0, $10, $E0, 0, 0, 3, 0, $10E)
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $10D)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $10C)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $10B)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $10A)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $109)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $108)

DebugSpritemaps_2_SpriteTilesViewer_2ndHalf:
    dw $0040
    %spritemapEntry(1, $4230, $30, 0, 0, 3, 1, $1EE)
    %spritemapEntry(1, $4220, $30, 0, 0, 3, 1, $1EC)
    %spritemapEntry(1, $4210, $30, 0, 0, 3, 1, $1EA)
    %spritemapEntry(1, $4200, $30, 0, 0, 3, 1, $1E8)
    %spritemapEntry(1, $43F0, $30, 0, 0, 3, 1, $1E6)
    %spritemapEntry(1, $43E0, $30, 0, 0, 3, 1, $1E4)
    %spritemapEntry(1, $43D0, $30, 0, 0, 3, 1, $1E2)
    %spritemapEntry(1, $43C0, $30, 0, 0, 3, 1, $1E0)
    %spritemapEntry(1, $4230, $20, 0, 0, 3, 1, $1CE)
    %spritemapEntry(1, $4220, $20, 0, 0, 3, 1, $1CC)
    %spritemapEntry(1, $4210, $20, 0, 0, 3, 1, $1CA)
    %spritemapEntry(1, $4200, $20, 0, 0, 3, 1, $1C8)
    %spritemapEntry(1, $43F0, $20, 0, 0, 3, 1, $1C6)
    %spritemapEntry(1, $43E0, $20, 0, 0, 3, 1, $1C4)
    %spritemapEntry(1, $43D0, $20, 0, 0, 3, 1, $1C2)
    %spritemapEntry(1, $43C0, $20, 0, 0, 3, 1, $1C0)
    %spritemapEntry(1, $4230, $10, 0, 0, 3, 1, $1AE)
    %spritemapEntry(1, $4220, $10, 0, 0, 3, 1, $1AC)
    %spritemapEntry(1, $4210, $10, 0, 0, 3, 1, $1AA)
    %spritemapEntry(1, $4200, $10, 0, 0, 3, 1, $1A8)
    %spritemapEntry(1, $43F0, $10, 0, 0, 3, 1, $1A6)
    %spritemapEntry(1, $43E0, $10, 0, 0, 3, 1, $1A4)
    %spritemapEntry(1, $43D0, $10, 0, 0, 3, 1, $1A2)
    %spritemapEntry(1, $43C0, $10, 0, 0, 3, 1, $1A0)
    %spritemapEntry(1, $4230, $00, 0, 0, 3, 1, $18E)
    %spritemapEntry(1, $4220, $00, 0, 0, 3, 1, $18C)
    %spritemapEntry(1, $4210, $00, 0, 0, 3, 1, $18A)
    %spritemapEntry(1, $4200, $00, 0, 0, 3, 1, $188)
    %spritemapEntry(1, $43F0, $00, 0, 0, 3, 1, $186)
    %spritemapEntry(1, $43E0, $00, 0, 0, 3, 1, $184)
    %spritemapEntry(1, $43D0, $00, 0, 0, 3, 1, $182)
    %spritemapEntry(1, $43C0, $00, 0, 0, 3, 1, $180)
    %spritemapEntry(1, $4230, $F0, 0, 0, 3, 1, $16E)
    %spritemapEntry(1, $4220, $F0, 0, 0, 3, 1, $16C)
    %spritemapEntry(1, $4210, $F0, 0, 0, 3, 1, $16A)
    %spritemapEntry(1, $4200, $F0, 0, 0, 3, 1, $168)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 1, $166)
    %spritemapEntry(1, $43E0, $F0, 0, 0, 3, 1, $164)
    %spritemapEntry(1, $43D0, $F0, 0, 0, 3, 1, $162)
    %spritemapEntry(1, $43C0, $F0, 0, 0, 3, 1, $160)
    %spritemapEntry(1, $4230, $E0, 0, 0, 3, 1, $14E)
    %spritemapEntry(1, $4220, $E0, 0, 0, 3, 1, $14C)
    %spritemapEntry(1, $4210, $E0, 0, 0, 3, 1, $14A)
    %spritemapEntry(1, $4200, $E0, 0, 0, 3, 1, $148)
    %spritemapEntry(1, $43F0, $E0, 0, 0, 3, 1, $146)
    %spritemapEntry(1, $43E0, $E0, 0, 0, 3, 1, $144)
    %spritemapEntry(1, $43D0, $E0, 0, 0, 3, 1, $142)
    %spritemapEntry(1, $43C0, $E0, 0, 0, 3, 1, $140)
    %spritemapEntry(1, $4230, $D0, 0, 0, 3, 1, $12E)
    %spritemapEntry(1, $4220, $D0, 0, 0, 3, 1, $12C)
    %spritemapEntry(1, $4210, $D0, 0, 0, 3, 1, $12A)
    %spritemapEntry(1, $4200, $D0, 0, 0, 3, 1, $128)
    %spritemapEntry(1, $43F0, $D0, 0, 0, 3, 1, $126)
    %spritemapEntry(1, $43E0, $D0, 0, 0, 3, 1, $124)
    %spritemapEntry(1, $43D0, $D0, 0, 0, 3, 1, $122)
    %spritemapEntry(1, $43C0, $D0, 0, 0, 3, 1, $120)
    %spritemapEntry(1, $4230, $C0, 0, 0, 3, 1, $10E)
    %spritemapEntry(1, $4220, $C0, 0, 0, 3, 1, $10C)
    %spritemapEntry(1, $4210, $C0, 0, 0, 3, 1, $10A)
    %spritemapEntry(1, $4200, $C0, 0, 0, 3, 1, $108)
    %spritemapEntry(1, $43F0, $C0, 0, 0, 3, 1, $106)
    %spritemapEntry(1, $43E0, $C0, 0, 0, 3, 1, $104)
    %spritemapEntry(1, $43D0, $C0, 0, 0, 3, 1, $102)
    %spritemapEntry(1, $43C0, $C0, 0, 0, 3, 1, $100)

DebugSpritemaps_3_SpriteTilesViewer_1stHalf:
    dw $0040
    %spritemapEntry(1, $4230, $30, 0, 0, 3, 0, $EE)
    %spritemapEntry(1, $4220, $30, 0, 0, 3, 0, $EC)
    %spritemapEntry(1, $4210, $30, 0, 0, 3, 0, $EA)
    %spritemapEntry(1, $4200, $30, 0, 0, 3, 0, $E8)
    %spritemapEntry(1, $43F0, $30, 0, 0, 3, 0, $E6)
    %spritemapEntry(1, $43E0, $30, 0, 0, 3, 0, $E4)
    %spritemapEntry(1, $43D0, $30, 0, 0, 3, 0, $E2)
    %spritemapEntry(1, $43C0, $30, 0, 0, 3, 0, $E0)
    %spritemapEntry(1, $4230, $20, 0, 0, 3, 0, $CE)
    %spritemapEntry(1, $4220, $20, 0, 0, 3, 0, $CC)
    %spritemapEntry(1, $4210, $20, 0, 0, 3, 0, $CA)
    %spritemapEntry(1, $4200, $20, 0, 0, 3, 0, $C8)
    %spritemapEntry(1, $43F0, $20, 0, 0, 3, 0, $C6)
    %spritemapEntry(1, $43E0, $20, 0, 0, 3, 0, $C4)
    %spritemapEntry(1, $43D0, $20, 0, 0, 3, 0, $C2)
    %spritemapEntry(1, $43C0, $20, 0, 0, 3, 0, $C0)
    %spritemapEntry(1, $4230, $10, 0, 0, 3, 5, $AE)
    %spritemapEntry(1, $4220, $10, 0, 0, 3, 5, $AC)
    %spritemapEntry(1, $4210, $10, 0, 0, 3, 5, $AA)
    %spritemapEntry(1, $4200, $10, 0, 0, 3, 5, $A8)
    %spritemapEntry(1, $43F0, $10, 0, 0, 3, 5, $A6)
    %spritemapEntry(1, $43E0, $10, 0, 0, 3, 5, $A4)
    %spritemapEntry(1, $43D0, $10, 0, 0, 3, 5, $A2)
    %spritemapEntry(1, $43C0, $10, 0, 0, 3, 5, $A0)
    %spritemapEntry(1, $4230, $00, 0, 0, 3, 5, $8E)
    %spritemapEntry(1, $4220, $00, 0, 0, 3, 5, $8C)
    %spritemapEntry(1, $4210, $00, 0, 0, 3, 5, $8A)
    %spritemapEntry(1, $4200, $00, 0, 0, 3, 5, $88)
    %spritemapEntry(1, $43F0, $00, 0, 0, 3, 5, $86)
    %spritemapEntry(1, $43E0, $00, 0, 0, 3, 5, $84)
    %spritemapEntry(1, $43D0, $00, 0, 0, 3, 5, $82)
    %spritemapEntry(1, $43C0, $00, 0, 0, 3, 5, $80)
    %spritemapEntry(1, $4230, $F0, 0, 0, 3, 5, $6E)
    %spritemapEntry(1, $4220, $F0, 0, 0, 3, 5, $6C)
    %spritemapEntry(1, $4210, $F0, 0, 0, 3, 5, $6A)
    %spritemapEntry(1, $4200, $F0, 0, 0, 3, 5, $68)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 5, $66)
    %spritemapEntry(1, $43E0, $F0, 0, 0, 3, 5, $64)
    %spritemapEntry(1, $43D0, $F0, 0, 0, 3, 5, $62)
    %spritemapEntry(1, $43C0, $F0, 0, 0, 3, 5, $60)
    %spritemapEntry(1, $4230, $E0, 0, 0, 3, 5, $4E)
    %spritemapEntry(1, $4220, $E0, 0, 0, 3, 5, $4C)
    %spritemapEntry(1, $4210, $E0, 0, 0, 3, 5, $4A)
    %spritemapEntry(1, $4200, $E0, 0, 0, 3, 5, $48)
    %spritemapEntry(1, $43F0, $E0, 0, 0, 3, 5, $46)
    %spritemapEntry(1, $43E0, $E0, 0, 0, 3, 5, $44)
    %spritemapEntry(1, $43D0, $E0, 0, 0, 3, 5, $42)
    %spritemapEntry(1, $43C0, $E0, 0, 0, 3, 5, $40)
    %spritemapEntry(1, $4230, $D0, 0, 0, 3, 5, $2E)
    %spritemapEntry(1, $4220, $D0, 0, 0, 3, 5, $2C)
    %spritemapEntry(1, $4210, $D0, 0, 0, 3, 5, $2A)
    %spritemapEntry(1, $4200, $D0, 0, 0, 3, 5, $28)
    %spritemapEntry(1, $43F0, $D0, 0, 0, 3, 5, $26)
    %spritemapEntry(1, $43E0, $D0, 0, 0, 3, 5, $24)
    %spritemapEntry(1, $43D0, $D0, 0, 0, 3, 5, $22)
    %spritemapEntry(1, $43C0, $D0, 0, 0, 3, 5, $20)
    %spritemapEntry(1, $4230, $C0, 0, 0, 3, 4, $0E)
    %spritemapEntry(1, $4220, $C0, 0, 0, 3, 4, $0C)
    %spritemapEntry(1, $4210, $C0, 0, 0, 3, 4, $0A)
    %spritemapEntry(1, $4200, $C0, 0, 0, 3, 4, $08)
    %spritemapEntry(1, $43F0, $C0, 0, 0, 3, 4, $06)
    %spritemapEntry(1, $43E0, $C0, 0, 0, 3, 4, $04)
    %spritemapEntry(1, $43D0, $C0, 0, 0, 3, 4, $02)
    %spritemapEntry(1, $43C0, $C0, 0, 0, 3, 4, $00)

DebugSpritemaps_4_0:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $D0)

DebugSpritemaps_5_1:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $D1)

DebugSpritemaps_6_2:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $D2)

DebugSpritemaps_7_3:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $D3)

DebugSpritemaps_8_4:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $D4)

DebugSpritemaps_9_5:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $D5)

DebugSpritemaps_A_6:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $D6)

DebugSpritemaps_B_7:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $D7)

DebugSpritemaps_C_8:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $D8)

DebugSpritemaps_D_9:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $D9)

DebugSpritemaps_E_A:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $DA)

DebugSpritemaps_F_B:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $DB)

DebugSpritemaps_10_C:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $DC)

DebugSpritemaps_11_D:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $DD)

DebugSpritemaps_12_E:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $DE)

DebugSpritemaps_13_F:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $DF)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_DebugSpritemaps_a_B4A89F:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $E0)

UNUSED_DebugSpritemaps_b_B4A8A6:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $E1)

UNUSED_DebugSpritemaps_c_B4A8AD:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $E2)

UNUSED_DebugSpritemaps_d_B4A8B4:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $E3)

UNUSED_DebugSpritemaps_e_B4A8BB:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $E4)

UNUSED_DebugSpritemaps_f_B4A8C2:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $E5)

UNUSED_DebugSpritemaps_g_B4A8C9:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $E6)

UNUSED_DebugSpritemaps_h_B4A8D0:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $E7)

UNUSED_DebugSpritemaps_i_B4A8D7:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $E8)
endif ; !FEATURE_KEEP_UNREFERENCED

DebugSpritemaps_1D_j:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $E9)

DebugSpritemaps_1E_k:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $EA)

DebugSpritemaps_1F_l:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $EB)

DebugSpritemaps_20_m:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $EC)

DebugSpritemaps_21_n:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $ED)

DebugSpritemaps_22_o:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $EE)

DebugSpritemaps_23_p:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $EF)

UNUSED_DebugSpritemaps_24_P_UPTM_POSE_OPT0_OPT1_B4A90F:
    dw $001F
    %spritemapEntry(0, $18, $18, 0, 0, 3, 0, $CC)
    %spritemapEntry(0, $18, $10, 0, 0, 3, 0, $CC)
    %spritemapEntry(0, $10, $18, 0, 0, 3, 0, $D1)
    %spritemapEntry(0, $10, $10, 0, 0, 3, 0, $D0)
    %spritemapEntry(0, $08, $18, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $08, $10, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1F0, $18, 0, 0, 3, 0, $FD)
    %spritemapEntry(0, $1F8, $18, 0, 0, 3, 0, $C0)
    %spritemapEntry(0, $00, $18, 0, 0, 3, 0, $C1)
    %spritemapEntry(0, $00, $10, 0, 0, 3, 0, $C1)
    %spritemapEntry(0, $1F8, $10, 0, 0, 3, 0, $C0)
    %spritemapEntry(0, $1F0, $10, 0, 0, 3, 0, $FD)
    %spritemapEntry(0, $1E8, $18, 0, 0, 3, 0, $BA)
    %spritemapEntry(0, $1E8, $10, 0, 0, 3, 0, $BA)
    %spritemapEntry(0, $1E0, $18, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1E0, $10, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $08, $08, 0, 0, 3, 0, $C4)
    %spritemapEntry(0, $10, $08, 0, 0, 3, 0, $B4)
    %spritemapEntry(0, $00, $08, 0, 0, 3, 0, $C0)
    %spritemapEntry(0, $1F8, $08, 0, 0, 3, 0, $C1)
    %spritemapEntry(0, $1F0, $08, 0, 0, 3, 0, $FD)
    %spritemapEntry(0, $1E8, $08, 0, 0, 3, 0, $BA)
    %spritemapEntry(0, $1E0, $08, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $18, $08, 0, 0, 3, 0, $CC)
    %spritemapEntry(0, $18, $00, 0, 0, 3, 0, $CC)
    %spritemapEntry(0, $18, $F8, 0, 0, 3, 0, $CC)
    %spritemapEntry(0, $10, $00, 0, 0, 3, 0, $BC)
    %spritemapEntry(0, $08, $00, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $C1)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 0, $C6)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $C1)

UNUSED_DebugSpritemaps_26_PP_X_PYo_itros_neTosKH_B4A90F:
    dw $001F
    %spritemapEntry(0, $18, $18, 0, 0, 3, 0, $B7)
    %spritemapEntry(0, $18, $10, 0, 0, 3, 0, $FD)
    %spritemapEntry(0, $10, $18, 0, 0, 3, 0, $FD)
    %spritemapEntry(0, $10, $10, 0, 0, 3, 0, $BA)
    %spritemapEntry(0, $08, $18, 0, 0, 3, 0, $BA)
    %spritemapEntry(0, $08, $10, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1F0, $18, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1F8, $18, 0, 0, 3, 0, $EE)
    %spritemapEntry(0, $00, $18, 0, 0, 3, 0, $F2)
    %spritemapEntry(0, $00, $10, 0, 0, 3, 0, $F2)
    %spritemapEntry(0, $1F8, $10, 0, 0, 3, 0, $EE)
    %spritemapEntry(0, $1F0, $10, 0, 0, 3, 0, $F1)
    %spritemapEntry(0, $1E8, $18, 0, 0, 3, 0, $E4)
    %spritemapEntry(0, $1E8, $10, 0, 0, 3, 0, $F3)
    %spritemapEntry(0, $1E0, $18, 0, 0, 3, 0, $ED)
    %spritemapEntry(0, $1E0, $10, 0, 0, 3, 0, $E8)
    %spritemapEntry(0, $08, $08, 0, 0, 3, 0, $EE)
    %spritemapEntry(0, $10, $08, 0, 0, 3, 0, $CC)
    %spritemapEntry(0, $00, $08, 0, 0, 3, 0, $CA)
    %spritemapEntry(0, $1F8, $08, 0, 0, 3, 0, $C1)
    %spritemapEntry(0, $1F0, $08, 0, 0, 3, 0, $FD)
    %spritemapEntry(0, $1E8, $08, 0, 0, 3, 0, $BA)
    %spritemapEntry(0, $1E0, $08, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $18, $08, 0, 0, 3, 0, $CC)
    %spritemapEntry(0, $18, $00, 0, 0, 3, 0, $C9)
    %spritemapEntry(0, $18, $F8, 0, 0, 3, 0, $C1)
    %spritemapEntry(0, $10, $00, 0, 0, 3, 0, $FD)
    %spritemapEntry(0, $08, $00, 0, 0, 3, 0, $BA)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 0, $CC)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $C1)

DebugSpritemaps_25_EnemyDebuggerEnemyIndicator:
    dw $0007
    %spritemapEntry(0, $10, $F8, 0, 0, 3, 0, $E4)
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 0, $F5)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $EE)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $BC)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 0, $CC)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 0, $FB)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 0, $FA)

DebugSpritemaps_27_EnemyDebuggerText_PosX_PosY_HP_Pointer:
    dw $001E
    %spritemapEntry(0, $10, $F8, 0, 0, 3, 0, $F1)
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 0, $E4)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $F3)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $ED)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 0, $E8)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 0, $EE)
    %spritemapEntry(0, $18, $F8, 0, 0, 3, 0, $CC)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 0, $C1)
    %spritemapEntry(0, $18, $F0, 0, 0, 3, 0, $CC)
    %spritemapEntry(0, $00, $F0, 0, 0, 3, 0, $C1)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 3, 0, $B7)
    %spritemapEntry(0, $1F0, $F0, 0, 0, 3, 0, $FD)
    %spritemapEntry(0, $1E8, $F0, 0, 0, 3, 0, $BA)
    %spritemapEntry(0, $1E0, $F0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $00, $E8, 0, 0, 3, 0, $EE)
    %spritemapEntry(0, $08, $E8, 0, 0, 3, 0, $F2)
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $F2)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $EE)
    %spritemapEntry(0, $18, $E8, 0, 0, 3, 0, $CC)
    %spritemapEntry(0, $10, $E8, 0, 0, 3, 0, $CA)
    %spritemapEntry(0, $1F8, $E8, 0, 0, 3, 0, $C1)
    %spritemapEntry(0, $1F0, $E8, 0, 0, 3, 0, $FD)
    %spritemapEntry(0, $1E8, $E8, 0, 0, 3, 0, $BA)
    %spritemapEntry(0, $1E0, $E8, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $18, $E0, 0, 0, 3, 0, $CC)
    %spritemapEntry(0, $10, $E0, 0, 0, 3, 0, $C9)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $C1)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $FD)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $BA)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $C5)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_DebugSpritemaps_PosX_PosY_HP_B4AB06:
    dw $001E
    %spritemapEntry(0, $18, $F8, 0, 0, 3, 0, $CC)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $C1)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $B7)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 0, $FD)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 0, $BA)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $00, $F0, 0, 0, 3, 0, $EE)
    %spritemapEntry(0, $08, $F0, 0, 0, 3, 0, $F2)
    %spritemapEntry(0, $08, $E8, 0, 0, 3, 0, $F2)
    %spritemapEntry(0, $00, $E8, 0, 0, 3, 0, $EE)
    %spritemapEntry(0, $10, $E0, 0, 0, 3, 0, $F1)
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $E4)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $F3)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $ED)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $E8)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $EE)
    %spritemapEntry(0, $18, $F0, 0, 0, 3, 0, $CC)
    %spritemapEntry(0, $10, $F0, 0, 0, 3, 0, $CA)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 3, 0, $C1)
    %spritemapEntry(0, $1F0, $F0, 0, 0, 3, 0, $FD)
    %spritemapEntry(0, $1E8, $F0, 0, 0, 3, 0, $BA)
    %spritemapEntry(0, $1E0, $F0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $18, $E8, 0, 0, 3, 0, $CC)
    %spritemapEntry(0, $10, $E8, 0, 0, 3, 0, $C9)
    %spritemapEntry(0, $1F8, $E8, 0, 0, 3, 0, $C1)
    %spritemapEntry(0, $1F0, $E8, 0, 0, 3, 0, $FD)
    %spritemapEntry(0, $1E8, $E8, 0, 0, 3, 0, $BA)
    %spritemapEntry(0, $1E0, $E8, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $18, $E0, 0, 0, 3, 0, $CC)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $C1)
endif ; !FEATURE_KEEP_UNREFERENCED

UNUSED_DebugSpritemaps_28_EnemyIndicator_B4AB9E:
    dw $0008
    %spritemapEntry(0, $18, $F8, 0, 0, 3, 0, $CC)
    %spritemapEntry(0, $10, $F8, 0, 0, 3, 0, $E4)
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 0, $F5)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $EE)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $BC)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 0, $CC)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 0, $FB)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 0, $FA)

DebugSpritemaps_29_UPTM_Stat_Num_Bank:
    dw $001F
    %spritemapEntry(0, $10, $F8, 0, 0, 3, 0, $EA)
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 0, $ED)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $E0)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $B1)
    %spritemapEntry(0, $00, $F0, 0, 0, 3, 0, $F4)
    %spritemapEntry(0, $08, $F0, 0, 0, 3, 0, $EC)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 3, 0, $BD)
    %spritemapEntry(0, $10, $E8, 0, 0, 3, 0, $F3)
    %spritemapEntry(0, $08, $E8, 0, 0, 3, 0, $E0)
    %spritemapEntry(0, $00, $E8, 0, 0, 3, 0, $F3)
    %spritemapEntry(0, $1F8, $E8, 0, 0, 3, 0, $C4)
    %spritemapEntry(0, $18, $F8, 0, 0, 3, 0, $CC)
    %spritemapEntry(0, $18, $F0, 0, 0, 3, 0, $CC)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 0, $FD)
    %spritemapEntry(0, $1F0, $F0, 0, 0, 3, 0, $FD)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 0, $BA)
    %spritemapEntry(0, $1E8, $F0, 0, 0, 3, 0, $BA)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1E0, $F0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1F0, $E8, 0, 0, 3, 0, $FD)
    %spritemapEntry(0, $1E8, $E8, 0, 0, 3, 0, $BA)
    %spritemapEntry(0, $1E0, $E8, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $18, $E8, 0, 0, 3, 0, $CC)
    %spritemapEntry(0, $18, $E0, 0, 0, 3, 0, $CC)
    %spritemapEntry(0, $10, $E0, 0, 0, 3, 0, $BC)
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $C1)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $C6)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $FD)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $BA)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $C5)

DebugSpritemaps_2A_Switch_Switch2_ColorPa_CharaOf:
    dw $001F
    %spritemapEntry(0, $10, $F8, 0, 0, 3, 0, $E5)
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 0, $C0)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $E0)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $F1)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 0, $E0)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 0, $E7)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 0, $B2)
    %spritemapEntry(0, $18, $F8, 0, 0, 3, 0, $CC)
    %spritemapEntry(0, $18, $F0, 0, 0, 3, 0, $CC)
    %spritemapEntry(0, $10, $F0, 0, 0, 3, 0, $E0)
    %spritemapEntry(0, $08, $F0, 0, 0, 3, 0, $C1)
    %spritemapEntry(0, $00, $F0, 0, 0, 3, 0, $F1)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 3, 0, $EE)
    %spritemapEntry(0, $1F0, $F0, 0, 0, 3, 0, $EB)
    %spritemapEntry(0, $1E8, $F0, 0, 0, 3, 0, $EE)
    %spritemapEntry(0, $1E0, $F0, 0, 0, 3, 0, $B2)
    %spritemapEntry(0, $1E8, $E8, 0, 0, 3, 0, $F6)
    %spritemapEntry(0, $1E0, $E8, 0, 0, 3, 0, $C4)
    %spritemapEntry(0, $18, $E8, 0, 0, 3, 0, $CC)
    %spritemapEntry(0, $18, $E0, 0, 0, 3, 0, $CC)
    %spritemapEntry(0, $10, $E8, 0, 0, 3, 0, $D2)
    %spritemapEntry(0, $08, $E8, 0, 0, 3, 0, $E7)
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $E7)
    %spritemapEntry(0, $00, $E8, 0, 0, 3, 0, $E2)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $E2)
    %spritemapEntry(0, $1F8, $E8, 0, 0, 3, 0, $F3)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $F3)
    %spritemapEntry(0, $1F0, $E8, 0, 0, 3, 0, $E8)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $E8)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $F6)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $C4)

DebugSpritemaps_2B_PoseAdr_WaitTim_LpCnt_Patern:
    dw $001D
    %spritemapEntry(0, $1F8, $F0, 0, 0, 3, 0, $ED)
    %spritemapEntry(0, $00, $F0, 0, 0, 3, 0, $F3)
    %spritemapEntry(0, $1F0, $F0, 0, 0, 3, 0, $B2)
    %spritemapEntry(0, $1E8, $F0, 0, 0, 3, 0, $EF)
    %spritemapEntry(0, $1E0, $F0, 0, 0, 3, 0, $BB)
    %spritemapEntry(0, $10, $E8, 0, 0, 3, 0, $EC)
    %spritemapEntry(0, $08, $E8, 0, 0, 3, 0, $E8)
    %spritemapEntry(0, $00, $E8, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1F8, $E8, 0, 0, 3, 0, $F3)
    %spritemapEntry(0, $1F0, $E8, 0, 0, 3, 0, $E8)
    %spritemapEntry(0, $1E8, $E8, 0, 0, 3, 0, $E0)
    %spritemapEntry(0, $1E0, $E8, 0, 0, 3, 0, $C8)
    %spritemapEntry(0, $18, $F0, 0, 0, 3, 0, $CC)
    %spritemapEntry(0, $18, $F8, 0, 0, 3, 0, $CC)
    %spritemapEntry(0, $18, $E8, 0, 0, 3, 0, $CC)
    %spritemapEntry(0, $18, $E0, 0, 0, 3, 0, $CC)
    %spritemapEntry(0, $10, $E0, 0, 0, 3, 0, $F1)
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $E3)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $E4)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $F2)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $EE)
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 0, $ED)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $F1)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $E4)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 0, $F3)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 0, $E0)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 0, $C1)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $C1)

DebugSpritemaps_2C_FlashCo_IceCoun_HitCoun_PlplCou:
    dw $0020
    %spritemapEntry(0, $10, $F8, 0, 0, 3, 0, $F4)
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 0, $EE)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $B2)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 0, $EF)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $EB)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 0, $EB)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 0, $C1)
    %spritemapEntry(0, $10, $F0, 0, 0, 3, 0, $ED)
    %spritemapEntry(0, $08, $F0, 0, 0, 3, 0, $F4)
    %spritemapEntry(0, $00, $F0, 0, 0, 3, 0, $EE)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 3, 0, $B2)
    %spritemapEntry(0, $1F0, $F0, 0, 0, 3, 0, $F3)
    %spritemapEntry(0, $1E8, $F0, 0, 0, 3, 0, $E8)
    %spritemapEntry(0, $1E0, $F0, 0, 0, 3, 0, $B7)
    %spritemapEntry(0, $10, $E8, 0, 0, 3, 0, $ED)
    %spritemapEntry(0, $08, $E8, 0, 0, 3, 0, $F4)
    %spritemapEntry(0, $00, $E8, 0, 0, 3, 0, $EE)
    %spritemapEntry(0, $1F8, $E8, 0, 0, 3, 0, $B2)
    %spritemapEntry(0, $1F0, $E8, 0, 0, 3, 0, $E4)
    %spritemapEntry(0, $1E8, $E8, 0, 0, 3, 0, $E2)
    %spritemapEntry(0, $1E0, $E8, 0, 0, 3, 0, $B8)
    %spritemapEntry(0, $10, $E0, 0, 0, 3, 0, $EE)
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $B2)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $E7)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $F2)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $E0)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $EB)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $B5)
    %spritemapEntry(0, $18, $F8, 0, 0, 3, 0, $CC)
    %spritemapEntry(0, $18, $F0, 0, 0, 3, 0, $CC)
    %spritemapEntry(0, $18, $E8, 0, 0, 3, 0, $CC)
    %spritemapEntry(0, $18, $E0, 0, 0, 3, 0, $CC)

DebugSpritemaps_2D_Pwork0_Pwork1_Pwork2_Pwork3:
    dw $001C
    %spritemapEntry(0, $18, $F8, 0, 0, 3, 0, $CC)
    %spritemapEntry(0, $18, $F0, 0, 0, 3, 0, $CC)
    %spritemapEntry(0, $18, $E8, 0, 0, 3, 0, $CC)
    %spritemapEntry(0, $18, $E0, 0, 0, 3, 0, $CC)
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 0, $D3)
    %spritemapEntry(0, $08, $F0, 0, 0, 3, 0, $D2)
    %spritemapEntry(0, $08, $E8, 0, 0, 3, 0, $D1)
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $D0)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $EA)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $F1)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 0, $EE)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 0, $F6)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 0, $C1)
    %spritemapEntry(0, $00, $F0, 0, 0, 3, 0, $EA)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 3, 0, $F1)
    %spritemapEntry(0, $1F0, $F0, 0, 0, 3, 0, $EE)
    %spritemapEntry(0, $1E8, $F0, 0, 0, 3, 0, $F6)
    %spritemapEntry(0, $1E0, $F0, 0, 0, 3, 0, $C1)
    %spritemapEntry(0, $00, $E8, 0, 0, 3, 0, $EA)
    %spritemapEntry(0, $1F8, $E8, 0, 0, 3, 0, $F1)
    %spritemapEntry(0, $1F0, $E8, 0, 0, 3, 0, $EE)
    %spritemapEntry(0, $1E8, $E8, 0, 0, 3, 0, $F6)
    %spritemapEntry(0, $1E0, $E8, 0, 0, 3, 0, $C1)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $EA)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $F1)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $EE)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $F6)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $C1)

DebugSpritemaps_2E_Pwork4_Pwork5_InitOP0_InitOP1:
    dw $001E
    %spritemapEntry(0, $10, $F8, 0, 0, 3, 0, $D1)
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 0, $C1)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $C0)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $F3)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 0, $E8)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 0, $ED)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 0, $B8)
    %spritemapEntry(0, $10, $F0, 0, 0, 3, 0, $D0)
    %spritemapEntry(0, $08, $F0, 0, 0, 3, 0, $C1)
    %spritemapEntry(0, $00, $F0, 0, 0, 3, 0, $C0)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 3, 0, $F3)
    %spritemapEntry(0, $1F0, $F0, 0, 0, 3, 0, $E8)
    %spritemapEntry(0, $1E8, $F0, 0, 0, 3, 0, $ED)
    %spritemapEntry(0, $1E0, $F0, 0, 0, 3, 0, $B8)
    %spritemapEntry(0, $08, $E8, 0, 0, 3, 0, $D5)
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $D4)
    %spritemapEntry(0, $18, $F8, 0, 0, 3, 0, $CC)
    %spritemapEntry(0, $18, $F0, 0, 0, 3, 0, $CC)
    %spritemapEntry(0, $18, $E8, 0, 0, 3, 0, $CC)
    %spritemapEntry(0, $18, $E0, 0, 0, 3, 0, $CC)
    %spritemapEntry(0, $00, $E8, 0, 0, 3, 0, $EA)
    %spritemapEntry(0, $1F8, $E8, 0, 0, 3, 0, $F1)
    %spritemapEntry(0, $1F0, $E8, 0, 0, 3, 0, $EE)
    %spritemapEntry(0, $1E8, $E8, 0, 0, 3, 0, $F6)
    %spritemapEntry(0, $1E0, $E8, 0, 0, 3, 0, $C1)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $EA)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $F1)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $EE)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $F6)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $C1)

DebugSpritemaps_2F_EnemySpawnDataEditorText:
    dw $0023
    %spritemapEntry(0, $00, $18, 0, 0, 3, 0, $CC)
    %spritemapEntry(0, $00, $10, 0, 0, 3, 0, $CC)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $CC)
    %spritemapEntry(0, $00, $08, 0, 0, 3, 0, $CC)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $CC)
    %spritemapEntry(0, $00, $F0, 0, 0, 3, 0, $CC)
    %spritemapEntry(0, $00, $E8, 0, 0, 3, 0, $CC)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 0, $D1)
    %spritemapEntry(0, $1F8, $18, 0, 0, 3, 0, $D1)
    %spritemapEntry(0, $1F8, $10, 0, 0, 3, 0, $D0)
    %spritemapEntry(0, $1F0, $F0, 0, 0, 3, 0, $F2)
    %spritemapEntry(0, $1F0, $E8, 0, 0, 3, 0, $F2)
    %spritemapEntry(0, $1E8, $F0, 0, 0, 3, 0, $EE)
    %spritemapEntry(0, $1E8, $E8, 0, 0, 3, 0, $EE)
    %spritemapEntry(0, $1E0, $F0, 0, 0, 3, 0, $C1)
    %spritemapEntry(0, $1E0, $E8, 0, 0, 3, 0, $C1)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 3, 0, $CA)
    %spritemapEntry(0, $1F8, $E8, 0, 0, 3, 0, $C9)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 0, $C1)
    %spritemapEntry(0, $1F0, $18, 0, 0, 3, 0, $F3)
    %spritemapEntry(0, $1E8, $18, 0, 0, 3, 0, $EF)
    %spritemapEntry(0, $1E0, $18, 0, 0, 3, 0, $C0)
    %spritemapEntry(0, $1F0, $10, 0, 0, 3, 0, $F3)
    %spritemapEntry(0, $1E8, $10, 0, 0, 3, 0, $EF)
    %spritemapEntry(0, $1E0, $10, 0, 0, 3, 0, $C0)
    %spritemapEntry(0, $1F8, $08, 0, 0, 3, 0, $D2)
    %spritemapEntry(0, $1F0, $08, 0, 0, 3, 0, $F3)
    %spritemapEntry(0, $1F0, $00, 0, 0, 3, 0, $F3)
    %spritemapEntry(0, $1E8, $08, 0, 0, 3, 0, $F6)
    %spritemapEntry(0, $1E0, $08, 0, 0, 3, 0, $C4)
    %spritemapEntry(0, $1E8, $00, 0, 0, 3, 0, $F6)
    %spritemapEntry(0, $1E0, $00, 0, 0, 3, 0, $C4)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $E4)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 0, $F2)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 0, $EE)


;;; $B00E: Enemy names ;;;
DebugSpritemaps_31_EnemyNames_ATOMIC:
    dw $0006
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $B2)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $B8)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $BC)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C0)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $B0)

DebugSpritemaps_32_EnemyNames_BANG:
    dw $0004
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $B6)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $BD)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $B1)

DebugSpritemaps_33_EnemyNames_BATTA1:
    dw $0006
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $D1)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $B1)

DebugSpritemaps_34_EnemyNames_BATTA2:
    dw $0006
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $D2)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $B1)

DebugSpritemaps_35_EnemyNames_BATTA3:
    dw $0006
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $D3)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $B1)

DebugSpritemaps_36_EnemyNames_BOTOON:
    dw $0006
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $BD)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $C0)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $C0)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $C0)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $B1)

DebugSpritemaps_37_EnemyNames_BOYON:
    dw $0005
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $BD)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $C0)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $CA)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $C0)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $B1)

DebugSpritemaps_38_EnemyNames_DESSGEEG:
    dw $0008
    %spritemapEntry(0, $18, $E0, 0, 0, 3, 0, $B6)
    %spritemapEntry(0, $10, $E0, 0, 0, 3, 0, $B4)
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $B4)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $B6)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $C4)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C4)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B4)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $B3)

DebugSpritemaps_39_EnemyNames_DORI:
    dw $0004
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $B8)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C3)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $C0)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $B3)

DebugSpritemaps_3A_EnemyNames_DRAGON:
    dw $0006
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $BD)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $C0)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $B6)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $C3)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $B3)

DebugSpritemaps_3B_EnemyNames_EBI:
    dw $0003
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $B8)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B1)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $B4)

DebugSpritemaps_3C_EnemyNames_EYE:
    dw $0003
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $B4)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $CA)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $B4)

DebugSpritemaps_3D_EnemyNames_NAMIHE:
    dw $0007
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $B7)
    %spritemapEntry(0, $10, $E0, 0, 0, 3, 0, $B8)
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $B4)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $B8)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $BC)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $BD)

DebugSpritemaps_3E_EnemyNames_FISH:
    dw $0004
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $B7)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C4)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B8)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $B5)

DebugSpritemaps_3F_EnemyNames_GAI:
    dw $0003
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $B8)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $B6)

DebugSpritemaps_40_EnemyNames_GAMET:
    dw $0005
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $B4)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $BC)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $B6)

DebugSpritemaps_41_EnemyNames_GEEGA:
    dw $0005
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $B4)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $B6)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B4)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $B6)

DebugSpritemaps_42_EnemyNames_GERUDA:
    dw $0006
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $B3)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $C6)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C3)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B4)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $B6)

DebugSpritemaps_43_EnemyNames_GRAVY:
    dw $0005
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $CA)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $C7)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $C3)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $B6)

DebugSpritemaps_44_EnemyNames_HATCHI1:
    dw $0006
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $D1)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $B8)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $B7)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $B2)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $B7)

DebugSpritemaps_45_EnemyNames_HAND:
    dw $0004
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $B3)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $BD)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $B7)

DebugSpritemaps_46_EnemyNames_HIBASHI:
    dw $0007
    %spritemapEntry(0, $10, $E0, 0, 0, 3, 0, $B8)
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $B7)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $C4)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $B1)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B8)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $B7)

DebugSpritemaps_47_EnemyNames_HIRU:
    dw $0004
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $C6)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C3)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B8)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $B7)

DebugSpritemaps_48_EnemyNames_HOLTZ:
    dw $0005
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $CB)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $BB)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $C0)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $B7)

DebugSpritemaps_49_EnemyNames_HOTARY:
    dw $0006
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $CA)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $C3)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $C0)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $B7)

DebugSpritemaps_4A_EnemyNames_HZOOMER:
    dw $0007
    %spritemapEntry(0, $10, $E0, 0, 0, 3, 0, $C3)
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $B4)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $BC)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $C0)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C0)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $CB)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $B7)

DebugSpritemaps_4B_EnemyNames_KAGO:
    dw $0004
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $C0)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $B6)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $BA)

DebugSpritemaps_4C_EnemyNames_KAME:
    dw $0004
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $B4)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $BC)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $BA)

DebugSpritemaps_4D_EnemyNames_KAMER:
    dw $0005
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $C3)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $B4)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $BC)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $BA)

DebugSpritemaps_4E_EnemyNames_KANI:
    dw $0004
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $B8)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $BD)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $BA)

DebugSpritemaps_4F_EnemyNames_KOMA:
    dw $0004
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $BC)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $C0)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $BA)

DebugSpritemaps_50_EnemyNames_KZAN:
    dw $0004
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $BD)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $CB)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $BA)

DebugSpritemaps_51_EnemyNames_LAVAMAN:
    dw $0007
    %spritemapEntry(0, $10, $E0, 0, 0, 3, 0, $BD)
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $BC)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C7)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $BB)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B0)

DebugSpritemaps_52_EnemyNames_MELLA:
    dw $0005
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $BB)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $BB)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B4)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $BC)

DebugSpritemaps_53_EnemyNames_MEMU:
    dw $0004
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $C6)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B4)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $BC)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $BC)

DebugSpritemaps_54_EnemyNames_MERO:
    dw $0004
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $C0)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C3)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B4)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $BC)

DebugSpritemaps_55_EnemyNames_METALEE:
    dw $0007
    %spritemapEntry(0, $10, $E0, 0, 0, 3, 0, $B4)
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $B4)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $BB)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B4)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $BC)

DebugSpritemaps_56_EnemyNames_METMOD:
    dw $0006
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $B3)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $C0)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $BC)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B4)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $BC)

DebugSpritemaps_57_EnemyNames_METROID:
    dw $0007
    %spritemapEntry(0, $10, $E0, 0, 0, 3, 0, $B3)
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $B8)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $C3)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $C0)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B4)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $BC)

DebugSpritemaps_58_EnemyNames_MULTI:
    dw $0005
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $B8)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $BB)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $C6)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $BC)

DebugSpritemaps_59_EnemyNames_MZOOMER:
    dw $0007
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $C0)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C0)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $CB)
    %spritemapEntry(0, $10, $E0, 0, 0, 3, 0, $C3)
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $B4)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $BC)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $BC)

DebugSpritemaps_5A_EnemyNames_NDRA:
    dw $0004
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C3)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B3)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $BD)

DebugSpritemaps_5B_EnemyNames_NOMI:
    dw $0004
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $B8)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $BC)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $C0)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $BD)

DebugSpritemaps_5C_EnemyNames_NOVA:
    dw $0004
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C7)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $C0)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $BD)

DebugSpritemaps_5D_EnemyNames_OUM:
    dw $0003
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $BC)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $C6)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $C0)

DebugSpritemaps_5E_EnemyNames_OUMU:
    dw $0004
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $C6)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $BC)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $C6)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $C0)

DebugSpritemaps_5F_EnemyNames_PIPE:
    dw $0004
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $B4)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C1)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B8)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $C1)

DebugSpritemaps_60_EnemyNames_POLYP:
    dw $0005
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $C1)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $BB)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $CA)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $C0)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $C1)

DebugSpritemaps_61_EnemyNames_PUROMI:
    dw $0006
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $B8)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $BC)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $C0)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C3)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $C6)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $C1)

DebugSpritemaps_62_EnemyNames_PUU:
    dw $0003
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C6)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $C6)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $C1)

DebugSpritemaps_63_EnemyNames_PUYO:
    dw $0004
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $C0)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $CA)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $C6)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $C1)

DebugSpritemaps_64_EnemyNames_REFLEC:
    dw $0006
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $B2)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $B4)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $BB)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $B5)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B4)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $C3)

DebugSpritemaps_65_EnemyNames_RINKA:
    dw $0005
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $BA)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $BD)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B8)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $C3)

DebugSpritemaps_66_EnemyNames_RIO:
    dw $0003
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C0)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B8)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $C3)

DebugSpritemaps_67_EnemyNames_RIPPER1:
    dw $0007
    %spritemapEntry(0, $10, $E0, 0, 0, 3, 0, $D1)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $B4)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $C1)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C1)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B8)
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $C3)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $C3)

DebugSpritemaps_68_EnemyNames_RIPPER2:
    dw $0007
    %spritemapEntry(0, $10, $E0, 0, 0, 3, 0, $D2)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $B4)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $C1)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C1)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B8)
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $C3)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $C3)

DebugSpritemaps_69_EnemyNames_ROBO:
    dw $0004
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $C0)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $B1)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $C0)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $C3)

DebugSpritemaps_6A_EnemyNames_RSTONE:
    dw $0006
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $B4)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $BD)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $C0)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $C4)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $C3)

DebugSpritemaps_6B_EnemyNames_SABOTEN:
    dw $0007
    %spritemapEntry(0, $10, $E0, 0, 0, 3, 0, $BD)
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $B4)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $C0)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $B1)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $C4)

DebugSpritemaps_6C_EnemyNames_SBUG:
    dw $0004
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $B6)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C6)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B1)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $C4)

DebugSpritemaps_6D_EnemyNames_SCLAYD:
    dw $0006
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $B3)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $CA)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $BB)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B2)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $C4)

DebugSpritemaps_6E_EnemyNames_SDEATH:
    dw $0006
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $B7)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $B4)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B3)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $C4)

DebugSpritemaps_6F_EnemyNames_SHUTTER1:
    dw $0008
    %spritemapEntry(0, $18, $E0, 0, 0, 3, 0, $D1)
    %spritemapEntry(0, $10, $E0, 0, 0, 3, 0, $C3)
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $B4)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C6)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B7)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $C4)

DebugSpritemaps_70_EnemyNames_SHUTTER2:
    dw $0008
    %spritemapEntry(0, $18, $E0, 0, 0, 3, 0, $D2)
    %spritemapEntry(0, $10, $E0, 0, 0, 3, 0, $C3)
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $B4)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C6)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B7)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $C4)

DebugSpritemaps_71_EnemyNames_SIDE:
    dw $0004
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $B4)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $B3)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B8)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $C4)

DebugSpritemaps_72_EnemyNames_SKREE:
    dw $0005
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $B4)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $B4)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C3)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $BA)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $C4)

DebugSpritemaps_73_EnemyNames_SPA:
    dw $0003
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $C1)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $C4)

DebugSpritemaps_74_EnemyNames_SQUEEWPT:
    dw $0008
    %spritemapEntry(0, $18, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $10, $E0, 0, 0, 3, 0, $C1)
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $C8)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $B4)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $B4)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C6)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $C2)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $C4)

DebugSpritemaps_75_EnemyNames_SSIDE:
    dw $0005
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $B4)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $B3)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $B8)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $C4)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $C4)

DebugSpritemaps_76_EnemyNames_STOKE:
    dw $0005
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $B4)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $BA)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C0)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $C4)

DebugSpritemaps_77_EnemyNames_TOGE:
    dw $0004
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $B4)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $B6)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $C0)

DebugSpritemaps_78_EnemyNames_VIOLA:
    dw $0005
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $BB)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C0)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B8)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $C7)

DebugSpritemaps_79_EnemyNames_WAVER:
    dw $0005
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $C3)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $B4)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C7)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $C8)

DebugSpritemaps_7A_EnemyNames_YARD:
    dw $0004
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $B3)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C3)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $CA)

DebugSpritemaps_7B_EnemyNames_ZEB:
    dw $0003
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $B1)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B4)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $CB)

DebugSpritemaps_7C_EnemyNames_ZEBBO:
    dw $0005
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $C0)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $B1)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $B1)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B4)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $CB)

DebugSpritemaps_7D_EnemyNames_ZEELA:
    dw $0005
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $BB)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $B4)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B4)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $CB)

DebugSpritemaps_7E_EnemyNames_ZOA:
    dw $0003
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $C0)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $CB)

DebugSpritemaps_7F_EnemyNames_ZOOMER:
    dw $0006
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $C3)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $B4)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $BC)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C0)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $C0)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $CB)

DebugSpritemaps_1C_TextCursor:
    dw $0001
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $3E)


;;; $B88D: Enemy names ;;;
DebugSpritemaps_30_EnemyNames_NoDebug:
    dw $0008
    %spritemapEntry(0, $18, $E0, 0, 0, 3, 0, $CD)
    %spritemapEntry(0, $10, $E0, 0, 0, 3, 0, $E6)
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $F4)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $E1)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $E4)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $B3)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $EE)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $BD)

DebugSpritemaps_80_EnemyNames_BATTA1br:
    dw $0008
    %spritemapEntry(0, $18, $E0, 0, 0, 3, 0, $F1)
    %spritemapEntry(0, $10, $E0, 0, 0, 3, 0, $E1)
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $D1)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $B1)

DebugSpritemaps_81_EnemyNames_BATTA1NO:
    dw $0008
    %spritemapEntry(0, $18, $E0, 0, 0, 3, 0, $EE)
    %spritemapEntry(0, $10, $E0, 0, 0, 3, 0, $ED)
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $D1)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $B1)

DebugSpritemaps_82_EnemyNames_BATTA1np:
    dw $0008
    %spritemapEntry(0, $18, $E0, 0, 0, 3, 0, $EF)
    %spritemapEntry(0, $10, $E0, 0, 0, 3, 0, $ED)
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $D1)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $B1)

DebugSpritemaps_8_EnemyNames_BATTA1ml:
    dw $0008
    %spritemapEntry(0, $18, $E0, 0, 0, 3, 0, $EB)
    %spritemapEntry(0, $10, $E0, 0, 0, 3, 0, $EC)
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $D1)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $B1)

DebugSpritemaps_84_EnemyNames_BATTA1ts:
    dw $0008
    %spritemapEntry(0, $18, $E0, 0, 0, 3, 0, $F2)
    %spritemapEntry(0, $10, $E0, 0, 0, 3, 0, $F3)
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $D1)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $B1)

DebugSpritemaps_85_EnemyNames_BATTA2br:
    dw $0008
    %spritemapEntry(0, $18, $E0, 0, 0, 3, 0, $F1)
    %spritemapEntry(0, $10, $E0, 0, 0, 3, 0, $E1)
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $D2)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $B1)

DebugSpritemaps_86_EnemyNames_BATTA2no:
    dw $0008
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $D2)
    %spritemapEntry(0, $18, $E0, 0, 0, 3, 0, $EE)
    %spritemapEntry(0, $10, $E0, 0, 0, 3, 0, $ED)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $B1)

DebugSpritemaps_87_EnemyNames_BATTA2np:
    dw $0008
    %spritemapEntry(0, $18, $E0, 0, 0, 3, 0, $EF)
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $D2)
    %spritemapEntry(0, $10, $E0, 0, 0, 3, 0, $ED)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $B1)

DebugSpritemaps_88_EnemyNames_BATTA2ml:
    dw $0008
    %spritemapEntry(0, $18, $E0, 0, 0, 3, 0, $EB)
    %spritemapEntry(0, $10, $E0, 0, 0, 3, 0, $EC)
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $D2)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $B1)

DebugSpritemaps_89_EnemyNames_BATTA2ts:
    dw $0008
    %spritemapEntry(0, $18, $E0, 0, 0, 3, 0, $F2)
    %spritemapEntry(0, $10, $E0, 0, 0, 3, 0, $F3)
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $D2)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $B1)

DebugSpritemaps_8A_EnemyNames_BATTA3br:
    dw $0008
    %spritemapEntry(0, $18, $E0, 0, 0, 3, 0, $F1)
    %spritemapEntry(0, $10, $E0, 0, 0, 3, 0, $E1)
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $D3)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $B1)

DebugSpritemaps_8B_EnemyNames_BATTA3no:
    dw $0008
    %spritemapEntry(0, $18, $E0, 0, 0, 3, 0, $EE)
    %spritemapEntry(0, $10, $E0, 0, 0, 3, 0, $ED)
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $D3)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $B1)

DebugSpritemaps_8C_EnemyNames_BATTA3np:
    dw $0008
    %spritemapEntry(0, $18, $E0, 0, 0, 3, 0, $EF)
    %spritemapEntry(0, $10, $E0, 0, 0, 3, 0, $ED)
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $D3)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $B1)

DebugSpritemaps_8D_EnemyNames_BATTA3ml:
    dw $0008
    %spritemapEntry(0, $18, $E0, 0, 0, 3, 0, $EB)
    %spritemapEntry(0, $10, $E0, 0, 0, 3, 0, $EC)
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $D3)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $B1)

DebugSpritemaps_8E_EnemyNames_BATTA3ts:
    dw $0008
    %spritemapEntry(0, $18, $E0, 0, 0, 3, 0, $F2)
    %spritemapEntry(0, $10, $E0, 0, 0, 3, 0, $F3)
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $D3)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $B1)


;;; $BB2D: Area names ;;;
DebugSpritemaps_14_AreaNames_SF_Crateria:
    dw $0003
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 0, $B5)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 0, $C4)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $FD)

DebugSpritemaps_15_AreaNames_BL_Brinstar:
    dw $0003
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 0, $BB)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 0, $B1)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $FD)

DebugSpritemaps_16_AreaNames_NO_Norfair:
    dw $0003
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 0, $C0)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 0, $BD)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $FD)

DebugSpritemaps_17_AreaNames_NP_WreckedShip:
    dw $0003
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 0, $C1)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 0, $BD)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $FD)

DebugSpritemaps_18_AreaNames_ML_Maridia:
    dw $0003
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 0, $BB)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 0, $BC)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $FD)

DebugSpritemaps_19_AreaNames_TS_Tourian:
    dw $0003
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 0, $C4)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $FD)

DebugSpritemaps_1A_AreaNames_CO_Ceres:
    dw $0003
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 0, $C0)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 0, $B2)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $FD)

DebugSpritemaps_1B_AreaNames_TT_Debug:
    dw $0003
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 0, $C5)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $FD)


;;; $BBB5: Enemy names ;;;
DebugSpritemaps_8F_EnemyNames_FUNE:
    dw $0004
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $B4)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $BD)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $C6)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $B5)

DebugSpritemaps_90_EnemyNames_HATCHI2:
    dw $0006
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $D2)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $B8)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $B7)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $B2)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $B7)

DebugSpritemaps_91_EnemyNames_HATCHI3:
    dw $0006
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 0, $D3)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $B8)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $B7)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $B2)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $B0)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $B7)

DebugSpritemaps_92_EnemyNames_ROBO2:
    dw $0005
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 0, $D2)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 0, $C0)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 0, $B1)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 0, $C0)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 0, $C3)


;;; $BC26: Create sprite object ;;;
Create_Sprite_Object:
;; Parameters:
;;     $12: X position
;;     $14: Y position
;;     $16: Sprite object ID. See "Sprite objects.asm"
;;     $18: Base tile number and palette bits
;; Returns:
;;     $12: Index of created sprite object if successful
    PHX : PHY : PHP : PHB
    PEA SpriteObject_DrawInst_Pointers>>8&$FF00 : PLB : PLB
    REP #$30
    LDX.W #$003E

  .loop:
    LDA.L SpriteObjects_InstListPointers,X : BEQ .found
    DEX #2 : BPL .loop
    BRA .return

  .found:
    LDA.W #$0000 : STA.L SpriteObjects_Palettes,X : STA.L SpriteObjects_XSubPositions,X
    STA.L SpriteObjects_YSubPositions,X : STA.L SpriteObjects_DisableFlags,X
    LDA.B DP_Temp12 : STA.L SpriteObjects_XPositions,X
    LDA.B DP_Temp14 : STA.L SpriteObjects_YPositions,X
    LDA.B DP_Temp18 : STA.L SpriteObjects_Palettes,X
    LDA.B DP_Temp16 : ASL : TAY
    LDA.W SpriteObject_DrawInst_Pointers,Y : STA.L SpriteObjects_InstListPointers,X
    PHX
    TAX
    LDA.L SpriteObjectInstLists,X
    PLX
    STA.L SpriteObjects_Instructions,X
    STX.B DP_Temp12

  .return:
    PLB : PLP : PLY : PLX
    RTL


;;; $BC82: Handle sprite objects ;;;
HandleSpriteObjects:
    PHX : PHY : PHP : PHB
    PEA HandleSpriteObjects>>8&$FF00 : PLB : PLB
    REP #$30
    LDA.W TimeIsFrozenFlag : ORA.W DebugTimeIsFrozenForEnemies : BNE .return
    LDX.W #$003E : STX.W SpriteObjectIndex

  .loop:
    LDX.W SpriteObjectIndex
    LDA.L SpriteObjects_InstListPointers,X : BEQ .next
    LDA.L SpriteObjects_DisableFlags,X : BIT.W #$0001 : BNE .next
    LDA.L SpriteObjects_Instructions,X : BMI .ASMInstruction
    DEC : STA.L SpriteObjects_Instructions,X : BNE .next
    LDA.L SpriteObjects_InstListPointers,X : INC #4 : STA.L SpriteObjects_InstListPointers,X
    TAX
    LDA.L SpriteObjectInstLists,X : CMP.W #$8000 : BPL .ASMInstruction
    LDX.W SpriteObjectIndex
    STA.L SpriteObjects_Instructions,X

  .next:
    LDA.W SpriteObjectIndex : DEC #2 : STA.W SpriteObjectIndex : BPL .loop
    BRA .return

  .ASMInstruction:
    STA.B DP_Temp12
    PEA .next-1
    JMP.W (DP_Temp12)

  .return:
    PLB : PLP : PLY : PLX
    RTL


;;; $BCF0: Sprite object instruction - go back 4 bytes ;;;
Instruction_SpriteObject_GoBack4Bytes:
    LDX.W SpriteObjectIndex
    LDA.L SpriteObjects_InstListPointers,X : DEC #4 : STA.L SpriteObjects_InstListPointers,X
    LDA.W #$7FFF : STA.L SpriteObjects_Instructions,X
    RTS


;;; $BD07: Sprite object instruction - delete ;;;
Instruction_SpriteObject_Delete:
    LDX.W SpriteObjectIndex
    LDA.W #$0000 : STA.L SpriteObjects_InstListPointers,X
    RTS


;;; $BD12: Sprite object instruction - go to parameter ;;;
Instruction_SpriteObject_GotoParameter:
    LDX.W SpriteObjectIndex
    LDA.L SpriteObjects_InstListPointers,X : TAX
    LDA.L SpriteObjectInstLists+2,X
    LDX.W SpriteObjectIndex
    STA.L SpriteObjects_InstListPointers,X
    TAX
    LDA.L SpriteObjectInstLists,X
    LDX.W SpriteObjectIndex
    STA.L SpriteObjects_Instructions,X
    RTS


;;; $BD32: Draw sprite objects ;;;
DrawSpriteObjects:
    PHX : PHY : PHP : PHB
    PEA SpriteObjectInstLists>>8 : PLB : PLB
    REP #$30
    LDX.W #$003E

  .loop:
    LDA.L SpriteObjects_InstListPointers,X : BEQ .next
    LDA.L SpriteObjects_XPositions,X : SEC : SBC.W Layer1XPosition : STA.B DP_Temp14
    CLC : ADC.W #$0010 : BMI .next
    CMP.W #$0120 : BPL .next
    LDA.L SpriteObjects_YPositions,X : SEC : SBC.W Layer1YPosition : STA.B DP_Temp12 : BMI .next
    CMP.W #$0110 : BPL .next
    LDA.L SpriteObjects_Palettes,X : AND.W #$0E00 : STA.B DP_Temp03
    LDA.L SpriteObjects_Palettes,X : AND.W #$01FF : STA.B DP_Temp00
    PHX
    LDA.L SpriteObjects_InstListPointers,X : TAX
    LDA.L SpriteObjectInstLists+2,X : TAY
    JSL AddSpritemapToOAM_WithBaseTileNumber_8AB8
    PLX

  .next:
    DEX #2 : BPL .loop
    PLB : PLP : PLY : PLX
    RTL


;;; $BD97: Clear sprite objects ;;;
ClearSpriteObjects:
; BUG: Doesn't clear $7E:EF78 due to wrong branch instruction,
; causes a crash during door transition if 32 sprite objects are created
    LDX.W #$03FE
    LDA.W #$0000

  .loop:
    STA.L SpriteObjects_InstListPointers,X
    DEX #2 : BNE .loop ; >_<
    RTL


;;; $BDA6: Empty draw instruction ;;;
SpriteObject_DrawInst_Empty:
    dw $0000


;;; $BDA8: Sprite objects ;;;
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


;;; $BE24: Instruction list - sprite object 3Dh (Draygon foaming at the mouth) ;;;
InstList_SpriteObject_3D_DraygonFoamingAtTheMouth:
    dw $0006,SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_0
    dw $0006,SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_1
    dw $0007,SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_2
    dw $0007,SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_3
    dw $0008,SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_4
    dw $0008,SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_5
    dw $0009,SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_6
    dw $0009,SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_7
    dw Instruction_SpriteObject_Delete


if !FEATURE_KEEP_UNREFERENCED
;;; $BE46: Unused. Instruction list ;;;
UNUSED_InstList_SpriteObject_B4BE46:
    dw $0005,UNUSED_SpriteObjectSpritemaps_B4DD3C
    dw $0005,UNUSED_SpriteObjectSpritemaps_B4DD43
    dw $0005,UNUSED_SpriteObjectSpritemaps_B4DD4A
    dw Instruction_SpriteObject_Delete
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $BE54: Instruction list - sprite object 2Fh (unused) ;;;
UNUSED_InstList_SpriteObject_2F_B4BE54:
    dw $0001,UNUSED_SpriteObjectSpritemaps_2F_B4D594
    dw Instruction_SpriteObject_GoBack4Bytes


;;; $BE5A: Instruction list - sprite object 0 (unused. Beam charge) ;;;
UNUSED_InstList_SpriteObject_0_BeamCharge_B4BE5A:
    dw $0003,UNUSED_SpriteObjectSpritemaps_0_BeamCharge_0_B4CAC9
    dw $0003,UNUSED_SpriteObjectSpritemaps_0_BeamCharge_1_B4CAD0
    dw $0003,UNUSED_SpriteObjectSpritemaps_0_BeamCharge_2_B4CAD7
    dw $0003,UNUSED_SpriteObjectSpritemaps_0_BeamCharge_3_B4CADE
    dw Instruction_SpriteObject_Delete


;;; $BE6C: Instruction list - sprite object 1 (unused. Mother Brain elbow charge particles) ;;;
UNUSED_InstList_SpriteObject_1_MBElbowChargeParticles_B4BE6C:
    dw $0005,UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_0_B4CAF4
    dw $0004,UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_1_B4CB05
    dw $0003,UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_2_B4CB16
    dw $0003,UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_3_B4CB27
    dw $0003,UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_4_B4CB38
    dw $0003,UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_5_B4CB49
    dw Instruction_SpriteObject_Delete


;;; $BE86: Instruction list - sprite object 2 (unused. Mother Brain elbow charge energy) ;;;
UNSUED_InstList_SpriteObject_2_MBElbowChargeEnergy_B4BE86:
    dw $0004,UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_0_B4CB5A
    dw $0003,UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_1_B4CB6B
    dw $0002,UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_2_B4CB7C
    dw $0002,UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_3_B4CB8D
    dw $0002,UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_4_B4CB9E
    dw $0002,UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_5_B4CBAF
    dw $000C,SpriteObjectSpritemaps_3_SmallExplosion_0
    dw Instruction_SpriteObject_Delete


;;; $BEA4: Instruction list - sprite object 3 (small explosion) ;;;
InstList_SpriteObject_3_SmallExplosion:
    dw $0004,SpriteObjectSpritemaps_3_SmallExplosion_0
    dw $0006,SpriteObjectSpritemaps_3_SmallExplosion_1
    dw $0005,SpriteObjectSpritemaps_3_SmallExplosion_2
    dw $0005,SpriteObjectSpritemaps_3_SmallExplosion_3
    dw $0005,SpriteObjectSpritemaps_3_SmallExplosion_4
    dw $0006,SpriteObjectSpritemaps_3_SmallExplosion_5
    dw Instruction_SpriteObject_Delete


;;; $BEBE: Instruction list - sprite object 4 (unused. Bomb explosion) ;;;
UNUSED_InstList_SpriteObject_4_BombExplosion_B4BEBE:
    dw $0003,UNSUED_SpriteObjectSpritemaps_4_BombExplosion_0_B4CC35
    dw $0003,UNSUED_SpriteObjectSpritemaps_4_BombExplosion_1_B4CC4B
    dw $0004,UNSUED_SpriteObjectSpritemaps_4_BombExplosion_2_B4CC61
    dw $0004,UNSUED_SpriteObjectSpritemaps_4_BombExplosion_3_B4CC77
    dw $0004,UNSUED_SpriteObjectSpritemaps_4_BombExplosion_4_B4CC8D
    dw Instruction_SpriteObject_Delete


;;; $BED4: Instruction list - sprite object 5 (unused. Beam trail) ;;;
UNUSED_InstList_SpriteObject_5_BeamTrail_B4BED4:
    dw $0008,UNSUED_SpriteObjectSpritemaps_5_BeamTrail_0_B4CCB9
    dw $0008,UNSUED_SpriteObjectSpritemaps_5_BeamTrail_1_B4CCC0
    dw $0008,UNSUED_SpriteObjectSpritemaps_5_BeamTrail_2_B4CCC7
    dw $0008,UNSUED_SpriteObjectSpritemaps_5_BeamTrail_3_B4CCCE
    dw $0018,UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_3_B4CB8D
    dw Instruction_SpriteObject_Delete


;;; $BEEA: Instruction list - sprite object 6 (dud shot) ;;;
InstList_SpriteObject_6_DudShot:
    dw $0004,SpriteObjectSpritemaps_6_DudShot_0
    dw $0004,SpriteObjectSpritemaps_6_DudShot_1
    dw $0004,SpriteObjectSpritemaps_6_DudShot_2
    dw $0004,SpriteObjectSpritemaps_6_DudShot_3
    dw $0004,SpriteObjectSpritemaps_6_DudShot_4
    dw $0004,SpriteObjectSpritemaps_6_DudShot_5
    dw Instruction_SpriteObject_Delete


;;; $BF04: Instruction list - sprite object 7 (unused. Power bomb) ;;;
UNUSED_InstList_SpriteObject_7_PowerBomb_B4BF04:
    dw $0005,UNSUED_SpriteObjectSpritemaps_7_PowerBomb_0_B4CCD5
    dw $0005,UNSUED_SpriteObjectSpritemaps_7_PowerBomb_1_B4CCDC
    dw $0005,UNSUED_SpriteObjectSpritemaps_7_PowerBomb_2_B4CCE3
    dw Instruction_SpriteObject_Delete


;;; $BF12: Instruction list - sprite object 8 (unused. Elevator pad) ;;;
UNUSED_InstList_SpriteObject_8_ElevatorPad_B4BF12:
    dw $0001,UNSUED_SpriteObjectSpritemaps_8_1C_ElevatorPad_0_B4CD57
    dw $0001,UNSUED_SpriteObjectSpritemaps_8_1C_ElevatorPad_1_B4CD6D
    dw Instruction_SpriteObject_Delete


;;; $BF1C: Instruction list - sprite object 9 (small dust cloud) ;;;
InstList_SpriteObject_9_SmallDudShot:
    dw $0005,SpriteObjectSpritemaps_A_PirateLandingDustCloud_0
    dw $0005,SpriteObjectSpritemaps_9_SmallDustCloud_0
    dw $0005,SpriteObjectSpritemaps_9_SmallDustCloud_1
    dw $0005,SpriteObjectSpritemaps_9_SmallDustCloud_2
    dw $0005,SpriteObjectSpritemaps_9_SmallDustCloud_3
    dw Instruction_SpriteObject_Delete


;;; $BF32: Instruction list - sprite object Ah (ninja space pirate landing dust cloud) ;;;
InstList_SpriteObject_A_SpacePirateLandingDustCloud:
    dw $0003,SpriteObjectSpritemaps_A_PirateLandingDustCloud_0
    dw $0003,SpriteObjectSpritemaps_A_PirateLandingDustCloud_1
    dw $0003,SpriteObjectSpritemaps_A_PirateLandingDustCloud_2
    dw $0003,SpriteObjectSpritemaps_A_PirateLandingDustCloud_3
    dw Instruction_SpriteObject_Delete


;;; $BF44: Instruction list - sprite object Bh (unused. Eye door sweat drop) ;;;
UNUSED_InstList_SpriteObject_B_EyeDoorSweatDrop_B4BF44:
    dw $0005,UNSUED_SpriteObjectSpritemaps_B_EyeDoorSweatDrop_0_B4CDD1
    dw $0005,UNSUED_SpriteObjectSpritemaps_B_EyeDoorSweatDrop_1_B4CDD8
    dw $0005,UNSUED_SpriteObjectSpritemaps_B_EyeDoorSweatDrop_2_B4CDDF
    dw $0005,UNSUED_SpriteObjectSpritemaps_B_EyeDoorSweatDrop_3_B4CDE6
    dw Instruction_SpriteObject_Delete


;;; $BF56: Instruction list - sprite object Ch (smoke) ;;;
InstList_SpriteObject_C_Smoke:
    dw $0008,SpriteObjectSpritemaps_C_Smoke_0
    dw $0008,SpriteObjectSpritemaps_C_Smoke_1
    dw $0008,SpriteObjectSpritemaps_C_Smoke_2
    dw $0008,SpriteObjectSpritemaps_C_Smoke_3
    dw Instruction_SpriteObject_Delete


;;; $BF68: Instruction list - sprite object 1Ch (unused. Elevator pad) ;;;
UNUSED_InstList_SpriteObject_1C_ElevatorPad_B4BF68:
    dw $0001,UNSUED_SpriteObjectSpritemaps_8_1C_ElevatorPad_0_B4CD57
    dw $0001,UNSUED_SpriteObjectSpritemaps_8_1C_ElevatorPad_1_B4CD6D
    dw Instruction_SpriteObject_GotoParameter
    dw UNUSED_InstList_SpriteObject_1C_ElevatorPad_B4BF68


;;; $BF74: Instruction list - sprite object 1Dh (big explosion) ;;;
InstList_SpriteObject_1D_BigExplosion:
    dw $0005,SpriteObjectSpritemaps_1D_BigExplosion_0
    dw $0005,SpriteObjectSpritemaps_1D_BigExplosion_1
    dw $0005,SpriteObjectSpritemaps_1D_BigExplosion_2
    dw $0005,SpriteObjectSpritemaps_1D_BigExplosion_3
    dw $0005,SpriteObjectSpritemaps_1D_BigExplosion_4
    dw $0005,SpriteObjectSpritemaps_1D_BigExplosion_5
    dw Instruction_SpriteObject_Delete


;;; $BF8E: Instruction list - sprite object Dh (unused. Small health drop) ;;;
UNUSED_InstList_SpriteObject_D_SmallEnergyDrop_B4BF8E:
    dw $0008,UNUSED_SpriteObjectSpritemaps_D_SmallEnergyDrop_0_B4CE1E
    dw $0008,UNUSED_SpriteObjectSpritemaps_D_SmallEnergyDrop_1_B4CE25
    dw $0008,UNUSED_SpriteObjectSpritemaps_D_SmallEnergyDrop_2_B4CE2C
    dw $0008,UNUSED_SpriteObjectSpritemaps_D_SmallEnergyDrop_3_B4CE33
    dw Instruction_SpriteObject_Delete


;;; $BFA0: Instruction list - sprite object Eh (unused. Big health drop) ;;;
UNUSED_InstList_SpriteObject_E_BigEnergyDrop_B4BFA0:
    dw $0008,UNUSED_SpriteObjectSpritemaps_E_BigEnergyDrop_0_B4CE3A
    dw $0008,UNUSED_SpriteObjectSpritemaps_E_BigEnergyDrop_1_B4CE50
    dw $0008,UNUSED_SpriteObjectSpritemaps_E_BigEnergyDrop_2_B4CE66
    dw $0008,UNUSED_SpriteObjectSpritemaps_E_BigEnergyDrop_3_B4CE7C
    dw Instruction_SpriteObject_Delete


;;; $BFB2: Instruction list - sprite object Fh (unused. Bomb) ;;;
UNUSED_InstList_SpriteObject_F_Bomb_B4BFB2:
    dw $0005,UNUSED_SpriteObjectSpritemaps_F_Bomb_0_B4CE83
    dw $0005,UNUSED_SpriteObjectSpritemaps_F_Bomb_1_B4CE8A
    dw $0005,UNUSED_SpriteObjectSpritemaps_F_Bomb_2_B4CE91
    dw $0005,UNUSED_SpriteObjectSpritemaps_F_Bomb_3_B4CE98
    dw Instruction_SpriteObject_Delete


;;; $BFC4: Instruction list - sprite object 10h (unused. Weird small health drop) ;;;
UNUSED_InstList_SpriteObject_10_WeirdSmallEnergyDrop_B4BFC4:
    dw $0010,UNUSED_SpriteObjectSpritemaps_10_SmallEnergyDrop_0_B4CF87
    dw $0010,UNUSED_SpriteObjectSpritemaps_10_SmallEnergyDrop_1_B4CF8E
    dw $0010,UNUSED_SpriteObjectSpritemaps_10_SmallEnergyDrop_2_B4CF95
    dw Instruction_SpriteObject_Delete


;;; $BFD2: Instruction list - sprite object 11h (unused. Rock particles) ;;;
UNUSED_InstList_SpriteObject_11_RockParticles_B4BFD2:
    dw $0002,UNUSED_SpriteObjectSpritemaps_11_RockParticles_0_B4C6D8
    dw $0002,UNUSED_SpriteObjectSpritemaps_11_RockParticles_1_B4C6EE
    dw $0002,UNUSED_SpriteObjectSpritemaps_11_RockParticles_2_B4C704
    dw $0002,UNUSED_SpriteObjectSpritemaps_11_RockParticles_3_B4C71A
    dw $0002,UNUSED_SpriteObjectSpritemaps_11_RockParticles_4_B4C730
    dw $0002,UNUSED_SpriteObjectSpritemaps_11_RockParticles_5_B4C746
    dw $0002,UNUSED_SpriteObjectSpritemaps_11_RockParticles_6_B4C75C
    dw $0002,UNUSED_SpriteObjectSpritemaps_11_RockParticles_7_B4C772
    dw $0002,UNUSED_SpriteObjectSpritemaps_11_RockParticles_8_B4C788
    dw $0002,UNUSED_SpriteObjectSpritemaps_11_RockParticles_9_B4C79E
    dw $0002,UNUSED_SpriteObjectSpritemaps_11_RockParticles_A_B4C7B4
    dw $0002,UNUSED_SpriteObjectSpritemaps_11_RockParticles_B_B4C7CA
    dw $0002,UNUSED_SpriteObjectSpritemaps_11_RockParticles_C_B4C7E0
    dw $0002,UNUSED_SpriteObjectSpritemaps_11_RockParticles_D_B4C7F6
    dw $0002,UNUSED_SpriteObjectSpritemaps_11_RockParticles_E_B4C80C
    dw $0002,UNUSED_SpriteObjectSpritemaps_11_RockParticles_F_B4C822
    dw Instruction_SpriteObject_Delete


;;; $C014: Instruction list - sprite object 12h (short big dust cloud) ;;;
InstList_SpriteObject_12_ShortBigDustCloud:
    dw $0002,SpriteObjectSpritemaps_12_15_BigDustCloud_0
    dw $0002,SpriteObjectSpritemaps_12_15_BigDustCloud_1
    dw $0002,SpriteObjectSpritemaps_12_15_BigDustCloud_2
    dw $0002,SpriteObjectSpritemaps_12_15_BigDustCloud_3
    dw Instruction_SpriteObject_Delete


;;; $C026: Instruction list - sprite object 13h (unused. Short big dust cloud with weird short beam) ;;;
UNUSED_InstList_SpriteObject_13_ShortBigDustCloudBeam_B4C026:
    dw $0003,SpriteObjectSpritemaps_13_14_15_BigDustCloud_4
    dw $0003,SpriteObjectSpritemaps_13_14_15_BigDustCloud_5
    dw $0003,SpriteObjectSpritemaps_13_14_15_BigDustCloud_6
    dw $0003,SpriteObjectSpritemaps_13_14_15_BigDustCloud_7
    dw $0003,UNUSED_SpriteObjectSpritemaps_13_14_16_DustCloud_Beam_B4C8AC
    dw $0005,UNUSED_SpriteObjectSpritemaps_13_14_16_DustCloud_Beam_B4C8B3
    dw Instruction_SpriteObject_Delete


;;; $C040: Instruction list - sprite object 14h (unused. Short big dust cloud with weird medium beam) ;;;
UNUSED_InstList_SpriteObject_14_ShortBigDustCloudBeam_B4C040:
    dw $0003,SpriteObjectSpritemaps_13_14_15_BigDustCloud_4
    dw $0003,SpriteObjectSpritemaps_13_14_15_BigDustCloud_5
    dw $0003,SpriteObjectSpritemaps_13_14_15_BigDustCloud_6
    dw $0003,SpriteObjectSpritemaps_13_14_15_BigDustCloud_7
    dw $0003,UNUSED_SpriteObjectSpritemaps_13_14_16_DustCloud_Beam_B4C8AC
    dw $0003,UNUSED_SpriteObjectSpritemaps_13_14_16_DustCloud_Beam_B4C8B3
    dw $0003,UNUSED_SpriteObjectSpritemaps_14_16_DustCloud_Beam_B4C8BA
    dw Instruction_SpriteObject_Delete


;;; $C05E: Instruction list - sprite object 15h (big dust cloud) ;;;
InstList_SpriteObject_15_BigDustCloud:
    dw $0005,SpriteObjectSpritemaps_12_15_BigDustCloud_0
    dw $0005,SpriteObjectSpritemaps_12_15_BigDustCloud_1
    dw $0005,SpriteObjectSpritemaps_12_15_BigDustCloud_2
    dw $0005,SpriteObjectSpritemaps_12_15_BigDustCloud_3
    dw $0005,SpriteObjectSpritemaps_13_14_15_BigDustCloud_4
    dw $0005,SpriteObjectSpritemaps_13_14_15_BigDustCloud_5
    dw $0005,SpriteObjectSpritemaps_13_14_15_BigDustCloud_6
    dw $0005,SpriteObjectSpritemaps_13_14_15_BigDustCloud_7
    dw Instruction_SpriteObject_Delete


;;; $C080: Instruction list - sprite object 16h (unused. Weird long beam) ;;;
UNUSED_InstList_SpriteObject_16_WeirdLongBeam_B4C080:
    dw $0001,UNUSED_SpriteObjectSpritemaps_13_14_16_DustCloud_Beam_B4C8AC
    dw $0001,UNUSED_SpriteObjectSpritemaps_13_14_16_DustCloud_Beam_B4C8B3
    dw $0001,UNUSED_SpriteObjectSpritemaps_14_16_DustCloud_Beam_B4C8BA
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_DustCloud_Beam_B4C8C6
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_DustCloud_Beam_B4C8D2
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_DustCloud_Beam_B4C8E2
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4
    dw Instruction_SpriteObject_Delete


;;; $C0FE: Instruction list - sprite object 17h (unused. Weird long flickering beam) ;;;
UNUSED_InstList_SpriteObject_17_WeirdLongFlickerBeam_B4C0FE:
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4
    dw Instruction_SpriteObject_Delete


;;; $C10C: Instruction list - sprite object 18h (short Draygon breath bubbles) ;;;
InstList_SpriteObject_18_ShortDraygonBreathBubbles:
    dw $0003,SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_0
    dw $0003,SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_1
    dw $0003,SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_2
    dw $0003,SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_3
    dw $0003,SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_4
    dw $0003,SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_5
    dw $0003,SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_6
    dw $0003,SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_7
    dw $0003,SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_8
    dw Instruction_SpriteObject_Delete


;;; $C132: Instruction list - sprite object 19h (unused. Save station electricity) ;;;
UNSUED_InstList_SpriteObject_19_SaveStationElectricity:
    dw $0001,UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_0_B4C9A0
    dw $0001,UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_1_B4C9B6
    dw $0001,UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_2_B4C9CC
    dw $0001,UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_3_B4C9E2
    dw $0001,UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_4_B4C9F8
    dw $0001,UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_5_B4CA0E
    dw $0001,UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_6_B4CA24
    dw $0001,UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_7_B4CA3A
    dw Instruction_SpriteObject_Delete


;;; $C154: Instruction list - sprite object 1Ah (unused. Expanding vertical gate) ;;;
UNUSED_InstList_SpriteObject_1A_ExpandingVerticalGate_B4C154:
    dw $0010,UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_0_B4CA50
    dw $0010,UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_1_B4CA5C
    dw $0010,UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_2_B4CA63
    dw $0010,UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_3_B4CA6F
    dw $0010,UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_4_B4CA7B
    dw $0010,UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_5_B4CA8C
    dw $0010,UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_6_B4CA9D
    dw $0010,UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_7_B4CAB3
    dw Instruction_SpriteObject_Delete


;;; $C176: Instruction list - sprite object 1Bh (unused. Contracting vertical gate) ;;;
UNUSED_InstList_SpriteObject_1B_ContractingVerticalGate:
    dw $0004,UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_7_B4CAB3
    dw $0004,UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_6_B4CA9D
    dw $0004,UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_5_B4CA8C
    dw $0004,UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_4_B4CA7B
    dw $0004,UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_3_B4CA6F
    dw $0004,UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_2_B4CA63
    dw $0004,UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_1_B4CA5C
    dw $0004,UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_0_B4CA50
    dw Instruction_SpriteObject_Delete


;;; $C198: Instruction list - sprite object 1Eh (unused) ;;;
UNUSED_InstList_SpriteObject_1E_B4C198:
    dw $0005,UNUSED_SpriteObjectSpritemaps_1E_0_B4C630
    dw $0005,UNUSED_SpriteObjectSpritemaps_1E_1_B4C637
    dw $0005,UNUSED_SpriteObjectSpritemaps_1E_0_B4C630
    dw $0005,UNUSED_SpriteObjectSpritemaps_1E_2_B4C63E
    dw Instruction_SpriteObject_GotoParameter
    dw UNUSED_InstList_SpriteObject_1E_B4C198


;;; $C1AC: Instruction list - sprite object 1Fh (unused) ;;;
UNUSED_InstList_SpriteObject_1F_B4C1AC:
    dw $0005,UNUSED_SpriteObjectSpritemaps_1F_0_B4C645
    dw $0005,UNUSED_SpriteObjectSpritemaps_1F_1_B4C645
    dw $0005,UNUSED_SpriteObjectSpritemaps_1F_0_B4C645
    dw $0005,UNUSED_SpriteObjectSpritemaps_1F_2_B4C653
    dw Instruction_SpriteObject_GotoParameter
    dw UNUSED_InstList_SpriteObject_1F_B4C1AC


;;; $C1C0: Instruction list - sprite object 20h (unused) ;;;
UNUSED_InstList_SpriteObject_20_B4C1C0:
    dw $0005,UNUSED_SpriteObjectSpritemaps_20_0_B4C65A
    dw $0005,UNUSED_SpriteObjectSpritemaps_20_1_B4C661
    dw $0005,UNUSED_SpriteObjectSpritemaps_20_0_B4C65A
    dw $0005,UNUSED_SpriteObjectSpritemaps_20_2_B4C668
    dw Instruction_SpriteObject_GotoParameter
    dw UNUSED_InstList_SpriteObject_20_B4C1C0


;;; $C1D4: Instruction list - sprite object 21h (unused) ;;;
UNUSED_InstList_SpriteObject_21_B4C1D4:
    dw $0005,UNUSED_SpriteObjectSpritemaps_21_0_B4C66F
    dw $0005,UNUSED_SpriteObjectSpritemaps_21_1_B4C676
    dw $0005,UNUSED_SpriteObjectSpritemaps_21_0_B4C66F
    dw $0005,UNUSED_SpriteObjectSpritemaps_21_2_B4C67D
    dw Instruction_SpriteObject_GotoParameter
    dw UNUSED_InstList_SpriteObject_21_B4C1D4


;;; $C1E8: Instruction list - sprite object 22h (unused) ;;;
UNUSED_InstList_SpriteObject_22_B4C1E8:
    dw $0005,UNUSED_SpriteObjectSpritemaps_22_0_B4C684
    dw $0005,UNUSED_SpriteObjectSpritemaps_22_1_B4C68B
    dw $0005,UNUSED_SpriteObjectSpritemaps_22_0_B4C684
    dw $0005,UNUSED_SpriteObjectSpritemaps_22_2_B4C692
    dw Instruction_SpriteObject_GotoParameter
    dw UNUSED_InstList_SpriteObject_22_B4C1E8


;;; $C1FC: Instruction list - sprite object 23h (unused) ;;;
UNUSED_InstList_SpriteObject_23_B4C1FC:
    dw $0005,UNUSED_SpriteObjectSpritemaps_23_0_B4C699
    dw $0005,UNUSED_SpriteObjectSpritemaps_23_1_B4C6A0
    dw $0005,UNUSED_SpriteObjectSpritemaps_23_0_B4C699
    dw $0005,UNUSED_SpriteObjectSpritemaps_23_2_B4C6A7
    dw Instruction_SpriteObject_GotoParameter
    dw UNUSED_InstList_SpriteObject_23_B4C1FC


;;; $C210: Instruction list - sprite object 24h (unused) ;;;
UNUSED_InstList_SpriteObject_24_B4C210:
    dw $0005,UNUSED_SpriteObjectSpritemaps_24_0_B4C6AE
    dw $0005,UNUSED_SpriteObjectSpritemaps_24_1_B4C6B5
    dw $0005,UNUSED_SpriteObjectSpritemaps_24_0_B4C6AE
    dw $0005,UNUSED_SpriteObjectSpritemaps_24_2_B4C6BC
    dw Instruction_SpriteObject_GotoParameter
    dw UNUSED_InstList_SpriteObject_24_B4C210


;;; $C224: Instruction list - sprite object 25h (unused) ;;;
UNUSED_InstList_SpriteObject_25_B4C224:
    dw $0005,UNUSED_SpriteObjectSpritemaps_25_0_B4C6C3
    dw $0005,UNUSED_SpriteObjectSpritemaps_25_1_B4C6CA
    dw $0005,UNUSED_SpriteObjectSpritemaps_25_0_B4C6C3
    dw $0005,UNUSED_SpriteObjectSpritemaps_25_2_B4C6D1
    dw Instruction_SpriteObject_GotoParameter
    dw UNUSED_InstList_SpriteObject_25_B4C224


;;; $C238: Instruction list - sprite object 26h (unused) ;;;
UNUSED_InstList_SpriteObject_26_B4C238:
    dw $000A,UNUSED_SpriteObjectSpritemaps_26_0_B4D08B
    dw $000A,UNUSED_SpriteObjectSpritemaps_26_0_B4D08B
    dw $000A,UNUSED_SpriteObjectSpritemaps_26_1_B4D0BA
    dw $000A,UNUSED_SpriteObjectSpritemaps_26_2_B4D0E9
    dw $000A,UNUSED_SpriteObjectSpritemaps_26_3_B4D118
    dw $000A,UNUSED_SpriteObjectSpritemaps_26_4_B4D147
    dw $000A,UNUSED_SpriteObjectSpritemaps_26_5_B4D176
    dw Instruction_SpriteObject_GotoParameter
    dw UNUSED_InstList_SpriteObject_26_B4C238


;;; $C258: Instruction list - sprite object 27h (unused) ;;;
UNUSED_InstList_SpriteObject_27_B4C258:
    dw $000A,UNUSED_SpriteObjectSpritemaps_27_0_B4D1D4
    dw $000A,UNUSED_SpriteObjectSpritemaps_27_1_B4D1EF
    dw $000A,UNUSED_SpriteObjectSpritemaps_27_2_B4D20A
    dw $000A,UNUSED_SpriteObjectSpritemaps_27_3_B4D225
    dw $000A,UNUSED_SpriteObjectSpritemaps_27_0_B4D1D4
    dw $000A,UNUSED_SpriteObjectSpritemaps_27_1_B4D1EF
    dw $000A,UNUSED_SpriteObjectSpritemaps_27_2_B4D20A
    dw $000A,UNUSED_SpriteObjectSpritemaps_27_3_B4D225
    dw $000A,UNUSED_SpriteObjectSpritemaps_27_0_B4D1D4
    dw $000A,UNUSED_SpriteObjectSpritemaps_27_1_B4D1EF
    dw $000A,UNUSED_SpriteObjectSpritemaps_27_2_B4D20A
    dw $000A,UNUSED_SpriteObjectSpritemaps_27_3_B4D225
    dw $000A,UNUSED_SpriteObjectSpritemaps_27_0_B4D1D4
    dw $000A,UNUSED_SpriteObjectSpritemaps_27_1_B4D1EF
    dw $000A,UNUSED_SpriteObjectSpritemaps_27_2_B4D20A
    dw $000A,UNUSED_SpriteObjectSpritemaps_27_3_B4D225
    dw $0030,UNUSED_SpriteObjectSpritemaps_27_4_B4D245
    dw Instruction_SpriteObject_GotoParameter
    dw UNUSED_InstList_SpriteObject_27_B4C258


;;; $C2A0: Instruction list - sprite object 28h (unused) ;;;
UNUSED_InstList_SpriteObject_28_B4C2A0:
    dw $000A,UNUSED_SpriteObjectSpritemaps_28_0_B4D2B3
    dw $000A,UNUSED_SpriteObjectSpritemaps_28_1_B4D2E2
    dw $000A,UNUSED_SpriteObjectSpritemaps_28_2_B4D311
    dw $000A,UNUSED_SpriteObjectSpritemaps_28_3_B4D340
    dw $000A,UNUSED_SpriteObjectSpritemaps_28_4_B4D36F
    dw $000A,UNUSED_SpriteObjectSpritemaps_28_5_B4D39E
    dw Instruction_SpriteObject_GotoParameter
    dw UNUSED_InstList_SpriteObject_28_B4C2A0


;;; $C2BC: Instruction list - sprite object 29h (unused) ;;;
UNUSED_InstList_SpriteObject_29_B4C2BC:
    dw $000A,UNUSED_SpriteObjectSpritemaps_29_0_B4D3FC
    dw $000A,UNUSED_SpriteObjectSpritemaps_29_1_B4D417
    dw $000A,UNUSED_SpriteObjectSpritemaps_29_2_B4D432
    dw $000A,UNUSED_SpriteObjectSpritemaps_29_3_B4D44D
    dw $000A,UNUSED_SpriteObjectSpritemaps_29_0_B4D3FC
    dw $000A,UNUSED_SpriteObjectSpritemaps_29_1_B4D417
    dw $000A,UNUSED_SpriteObjectSpritemaps_29_2_B4D432
    dw $000A,UNUSED_SpriteObjectSpritemaps_29_3_B4D44D
    dw $000A,UNUSED_SpriteObjectSpritemaps_29_0_B4D3FC
    dw $000A,UNUSED_SpriteObjectSpritemaps_29_1_B4D417
    dw $000A,UNUSED_SpriteObjectSpritemaps_29_2_B4D432
    dw $000A,UNUSED_SpriteObjectSpritemaps_29_3_B4D44D
    dw $000A,UNUSED_SpriteObjectSpritemaps_29_0_B4D3FC
    dw $000A,UNUSED_SpriteObjectSpritemaps_29_1_B4D417
    dw $000A,UNUSED_SpriteObjectSpritemaps_29_2_B4D432
    dw $000A,UNUSED_SpriteObjectSpritemaps_29_3_B4D44D
    dw $0030,UNUSED_SpriteObjectSpritemaps_29_4_B4D46D
    dw Instruction_SpriteObject_GotoParameter
    dw UNUSED_InstList_SpriteObject_29_B4C2BC


;;; $C304: Instruction list - sprite object 2Ah (unused) ;;;
UNUSED_InstList_SpriteObject_2A_B4C304:
    dw $0001,UNUSED_SpriteObjectSpritemaps_2A_B4D2AC
    dw Instruction_SpriteObject_GoBack4Bytes


;;; $C30A: Instruction list - sprite object 2Bh (fire arc body) ;;;
InstList_SpriteObject_2B_PuromiBody:
    dw $0003,SpriteObjectSpritemaps_2B_Puromi_0
    dw $0003,SpriteObjectSpritemaps_2B_Puromi_1
    dw $0003,SpriteObjectSpritemaps_2B_Puromi_4
    dw $0003,SpriteObjectSpritemaps_2B_Puromi_2
    dw $0003,SpriteObjectSpritemaps_2B_Puromi_3
    dw $0003,SpriteObjectSpritemaps_2B_Puromi_5
    dw $0003,SpriteObjectSpritemaps_2B_Puromi_0
    dw $0003,SpriteObjectSpritemaps_2B_Puromi_1
    dw $0003,SpriteObjectSpritemaps_2B_Puromi_6
    dw $0003,SpriteObjectSpritemaps_2B_Puromi_2
    dw $0003,SpriteObjectSpritemaps_2B_Puromi_3
    dw $0003,SpriteObjectSpritemaps_2B_Puromi_7
    dw Instruction_SpriteObject_GotoParameter
    dw InstList_SpriteObject_2B_PuromiBody


;;; $C33E: Instruction list - sprite object 2Ch (fire arc right explosion) ;;;
InstList_SpriteObject_2C_PuromiRightExplosion:
    dw $0002,SpriteObjectSpritemaps_2C_PuromiRightExplosion_0
    dw $0002,SpriteObjectSpritemaps_2C_PuromiRightExplosion_1
    dw $0002,SpriteObjectSpritemaps_2C_PuromiRightExplosion_2
    dw $0002,SpriteObjectSpritemaps_2C_PuromiRightExplosion_3
    dw $0002,SpriteObjectSpritemaps_2C_PuromiRightExplosion_4
    dw $0002,SpriteObjectSpritemaps_2C_PuromiRightExplosion_5
    dw $0002,SpriteObjectSpritemaps_2C_PuromiRightExplosion_6
    dw Instruction_SpriteObject_Delete


;;; $C35C: Instruction list - sprite object 2Dh (fire arc left explosion) ;;;
InstList_SpriteObject_2D_PuromiLeftExplosion:
    dw $0002,SpriteObjectSpritemaps_2D_PuromiLeftExplosion_0
    dw $0002,SpriteObjectSpritemaps_2D_PuromiLeftExplosion_1
    dw $0002,SpriteObjectSpritemaps_2D_PuromiLeftExplosion_2
    dw $0002,SpriteObjectSpritemaps_2D_PuromiLeftExplosion_3
    dw $0002,SpriteObjectSpritemaps_2D_PuromiLeftExplosion_4
    dw $0002,SpriteObjectSpritemaps_2D_PuromiLeftExplosion_5
    dw $0002,SpriteObjectSpritemaps_2D_PuromiLeftExplosion_6
    dw Instruction_SpriteObject_Delete


;;; $C37A: Instruction list - sprite object 2Eh (fire arc splash) ;;;
InstList_SpriteObject_2E_PuromiSplash:
    dw $0002,SpriteObjectSpritemaps_2E_PuromiSplash_0
    dw $0002,SpriteObjectSpritemaps_2E_PuromiSplash_0
    dw $0002,SpriteObjectSpritemaps_2E_PuromiSplash_1
    dw $0002,SpriteObjectSpritemaps_2E_PuromiSplash_2
    dw $0002,SpriteObjectSpritemaps_2E_PuromiSplash_4
    dw Instruction_SpriteObject_Delete


;;; $C390: Instruction list - sprite object 30h (falling spark trail) ;;;
InstList_SpriteObject_30_FallingSparkTrail:
    dw $0003,SpriteObjectSpritemaps_30_FallingSparkTrail_0
    dw $0003,SpriteObjectSpritemaps_30_FallingSparkTrail_1
    dw $0003,SpriteObjectSpritemaps_30_FallingSparkTrail_2
    dw $0003,SpriteObjectSpritemaps_30_FallingSparkTrail_3
    dw Instruction_SpriteObject_Delete


;;; $C3A2: Instruction list - sprite object 31h (unused. Metroid insides) ;;;
UNSUED_InstList_SpriteObject_31_MetroidInsides_B4C3A2:
    dw $0010,UNUSED_SpriteObjectSpritemaps_31_MetroidInsides_0_B4D653
    dw $0010,UNUSED_SpriteObjectSpritemaps_31_MetroidInsides_1_B4D67D
    dw $0006,UNUSED_SpriteObjectSpritemaps_31_MetroidInsides_2_B4D69D
    dw $000A,UNUSED_SpriteObjectSpritemaps_31_MetroidInsides_3_B4D6C7
    dw $0010,UNUSED_SpriteObjectSpritemaps_31_MetroidInsides_1_B4D67D
    dw Instruction_SpriteObject_GotoParameter
    dw UNSUED_InstList_SpriteObject_31_MetroidInsides_B4C3A2


;;; $C3BA: Instruction list - sprite object 32h (metroid electricity) ;;;
InstList_SpriteObject_32_MetroidElectricity:
    dw $0002,SpriteObjectSpritemaps_32_33_MetroidElectricity_0
    dw $0003,SpriteObjectSpritemaps_32_33_MetroidElectricity_1
    dw $0002,SpriteObjectSpritemaps_32_33_MetroidElectricity_2
    dw $0001,SpriteObjectSpritemaps_32_33_MetroidElectricity_0
    dw $0003,SpriteObjectSpritemaps_32_33_MetroidElectricity_2
    dw $0004,SpriteObject_DrawInst_Empty
    dw $0004,SpriteObjectSpritemaps_32_33_MetroidElectricity_3
    dw $0005,SpriteObjectSpritemaps_32_33_MetroidElectricity_4
    dw $0002,SpriteObjectSpritemaps_32_33_MetroidElectricity_5
    dw $0001,SpriteObjectSpritemaps_32_33_MetroidElectricity_4
    dw $0004,SpriteObject_DrawInst_Empty
    dw $0002,SpriteObjectSpritemaps_32_MetroidElectricity_C
    dw $0003,SpriteObjectSpritemaps_32_MetroidElectricity_D
    dw $0004,SpriteObjectSpritemaps_32_MetroidElectricity_E
    dw $0007,SpriteObject_DrawInst_Empty
    dw $0003,SpriteObjectSpritemaps_32_33_MetroidElectricity_9
    dw $0002,SpriteObjectSpritemaps_32_33_MetroidElectricity_A
    dw $0001,SpriteObjectSpritemaps_32_33_MetroidElectricity_B
    dw $0002,SpriteObjectSpritemaps_32_33_MetroidElectricity_A
    dw $0003,SpriteObjectSpritemaps_32_33_MetroidElectricity_B
    dw $0004,SpriteObject_DrawInst_Empty
    dw $0004,SpriteObjectSpritemaps_32_33_MetroidElectricity_F
    dw $0002,SpriteObjectSpritemaps_32_33_MetroidElectricity_10
    dw $0002,SpriteObjectSpritemaps_32_33_MetroidElectricity_11
    dw $0003,SpriteObjectSpritemaps_32_33_MetroidElectricity_F
    dw $0001,SpriteObject_DrawInst_Empty
    dw $0004,SpriteObjectSpritemaps_32_MetroidElectricity_12
    dw $0003,SpriteObjectSpritemaps_32_MetroidElectricity_13
    dw $0003,SpriteObjectSpritemaps_32_MetroidElectricity_14
    dw $0002,SpriteObjectSpritemaps_32_MetroidElectricity_13
    dw $0007,SpriteObject_DrawInst_Empty


;;; $C436: Instruction list - sprite object 33h (unused) ;;;
UNUSED_InstList_SpriteObject_33_B4C436:
    dw $0002,SpriteObjectSpritemaps_32_33_MetroidElectricity_6
    dw $0003,SpriteObjectSpritemaps_32_33_MetroidElectricity_7
    dw $0004,SpriteObjectSpritemaps_32_33_MetroidElectricity_8
    dw $0002,SpriteObjectSpritemaps_32_33_MetroidElectricity_6
    dw $0001,SpriteObjectSpritemaps_32_33_MetroidElectricity_8
    dw $0003,SpriteObject_DrawInst_Empty
    dw $0002,SpriteObjectSpritemaps_32_33_MetroidElectricity_15
    dw $0003,SpriteObjectSpritemaps_32_33_MetroidElectricity_16
    dw $0004,SpriteObjectSpritemaps_32_33_MetroidElectricity_17
    dw $0001,SpriteObjectSpritemaps_32_33_MetroidElectricity_15
    dw $0003,SpriteObject_DrawInst_Empty
    dw $0003,SpriteObjectSpritemaps_32_33_MetroidElectricity_6
    dw $0004,SpriteObjectSpritemaps_32_33_MetroidElectricity_8
    dw $0020,SpriteObject_DrawInst_Empty
    dw $0002,SpriteObjectSpritemaps_32_33_MetroidElectricity_0
    dw $0001,SpriteObjectSpritemaps_32_33_MetroidElectricity_1
    dw $0002,SpriteObjectSpritemaps_32_33_MetroidElectricity_2
    dw $0001,SpriteObjectSpritemaps_32_33_MetroidElectricity_0
    dw $0004,SpriteObject_DrawInst_Empty
    dw $0003,SpriteObjectSpritemaps_32_33_MetroidElectricity_F
    dw $0004,SpriteObjectSpritemaps_32_33_MetroidElectricity_10
    dw $0005,SpriteObjectSpritemaps_32_33_MetroidElectricity_11
    dw $0004,SpriteObject_DrawInst_Empty
    dw $0002,SpriteObjectSpritemaps_32_33_MetroidElectricity_9
    dw $0001,SpriteObjectSpritemaps_32_33_MetroidElectricity_A
    dw $0003,SpriteObjectSpritemaps_32_33_MetroidElectricity_B
    dw $0001,SpriteObjectSpritemaps_32_33_MetroidElectricity_9
    dw $0006,SpriteObject_DrawInst_Empty
    dw $0003,SpriteObjectSpritemaps_32_33_MetroidElectricity_3
    dw $0004,SpriteObjectSpritemaps_32_33_MetroidElectricity_4
    dw $0002,SpriteObjectSpritemaps_32_33_MetroidElectricity_5
    dw Instruction_SpriteObject_GotoParameter
    dw UNUSED_InstList_SpriteObject_33_B4C436


;;; $C4B6: Instruction list - sprite object 34h (metroid shell) ;;;
InstList_SpriteObject_34_MetroidShell:
    dw $0001,SpriteObjectSpritemaps_34_35_36_MetroidShell_0
    dw $0001,SpriteObject_DrawInst_Empty
    dw $0001,SpriteObjectSpritemaps_34_35_36_MetroidShell_0
    dw $0001,SpriteObject_DrawInst_Empty
    dw $0001,SpriteObjectSpritemaps_34_35_36_MetroidShell_0
    dw $0001,SpriteObject_DrawInst_Empty
    dw $0001,SpriteObjectSpritemaps_34_35_36_MetroidShell_0
    dw $0001,SpriteObject_DrawInst_Empty
    dw $0001,SpriteObjectSpritemaps_34_35_36_MetroidShell_0
    dw $0001,SpriteObject_DrawInst_Empty
    dw $0001,SpriteObjectSpritemaps_34_35_36_MetroidShell_0
    dw $0001,SpriteObject_DrawInst_Empty
    dw $0001,SpriteObjectSpritemaps_34_35_36_MetroidShell_0
    dw $0001,SpriteObject_DrawInst_Empty
    dw $0001,SpriteObjectSpritemaps_34_36_MetroidShell_1
    dw $0001,SpriteObject_DrawInst_Empty
    dw $0001,SpriteObjectSpritemaps_34_36_MetroidShell_1
    dw $0001,SpriteObject_DrawInst_Empty
    dw $0001,SpriteObjectSpritemaps_34_36_MetroidShell_1
    dw $0001,SpriteObject_DrawInst_Empty
    dw $0001,SpriteObjectSpritemaps_34_36_MetroidShell_1
    dw $0001,SpriteObject_DrawInst_Empty
    dw $0001,SpriteObjectSpritemaps_34_36_MetroidShell_1
    dw $0001,SpriteObject_DrawInst_Empty
    dw $0001,SpriteObjectSpritemaps_34_36_MetroidShell_1
    dw $0001,SpriteObject_DrawInst_Empty
    dw $0001,SpriteObjectSpritemaps_34_36_MetroidShell_1
    dw $0001,SpriteObject_DrawInst_Empty
    dw $0001,SpriteObjectSpritemaps_34_36_MetroidShell_1
    dw $0001,SpriteObject_DrawInst_Empty
    dw $0001,SpriteObjectSpritemaps_34_35_36_MetroidShell_0
    dw $0001,SpriteObject_DrawInst_Empty


;;; $C536: Instruction list - sprite object 35h (unused) ;;;
UNUSED_InstList_SpriteObject_35_B4C536:
    dw $0001,SpriteObjectSpritemaps_34_35_36_MetroidShell_0
    dw $0001,SpriteObject_DrawInst_Empty
    dw $0001,SpriteObjectSpritemaps_34_35_36_MetroidShell_0
    dw $0001,SpriteObject_DrawInst_Empty
    dw $0001,SpriteObjectSpritemaps_34_35_36_MetroidShell_0
    dw $0001,SpriteObject_DrawInst_Empty
    dw $0001,SpriteObjectSpritemaps_34_35_36_MetroidShell_0
    dw $0001,SpriteObject_DrawInst_Empty
    dw $0001,SpriteObjectSpritemaps_34_35_36_MetroidShell_0
    dw $0001,SpriteObject_DrawInst_Empty
    dw $0001,SpriteObjectSpritemaps_34_35_36_MetroidShell_0
    dw $0001,SpriteObject_DrawInst_Empty
    dw $0001,SpriteObjectSpritemaps_34_35_36_MetroidShell_2
    dw $0001,SpriteObject_DrawInst_Empty
    dw $0001,SpriteObjectSpritemaps_34_35_36_MetroidShell_2
    dw $0001,SpriteObject_DrawInst_Empty
    dw $0001,SpriteObjectSpritemaps_34_35_36_MetroidShell_2
    dw $0001,SpriteObject_DrawInst_Empty
    dw $0001,SpriteObjectSpritemaps_34_35_36_MetroidShell_2
    dw $0001,SpriteObject_DrawInst_Empty
    dw $0001,SpriteObjectSpritemaps_34_35_36_MetroidShell_2
    dw $0001,SpriteObject_DrawInst_Empty
    dw $0001,SpriteObjectSpritemaps_34_35_36_MetroidShell_2
    dw $0001,SpriteObject_DrawInst_Empty
    dw $0001,SpriteObjectSpritemaps_34_35_36_MetroidShell_2
    dw $0001,SpriteObject_DrawInst_Empty
    dw $0001,SpriteObjectSpritemaps_34_35_36_MetroidShell_2
    dw $0001,SpriteObject_DrawInst_Empty
    dw $0001,SpriteObjectSpritemaps_34_35_36_MetroidShell_2
    dw $0001,SpriteObject_DrawInst_Empty
    dw Instruction_SpriteObject_GotoParameter
    dw UNUSED_InstList_SpriteObject_35_B4C536


;;; $C5B2: Instruction list - sprite object 36h (unused) ;;;
UNUSED_InstList_SpriteObject_36_B4C5B2:
    dw $0010,SpriteObjectSpritemaps_34_35_36_MetroidShell_0
    dw $0010,SpriteObjectSpritemaps_34_36_MetroidShell_1
    dw $0010,SpriteObjectSpritemaps_34_35_36_MetroidShell_0
    dw $0010,SpriteObjectSpritemaps_34_35_36_MetroidShell_2
    dw Instruction_SpriteObject_GotoParameter
    dw UNUSED_InstList_SpriteObject_36_B4C5B2


;;; $C5C6: Instruction list - sprite object 37h (enemy shot) ;;;
InstList_SpriteObject_37_EnemyShot:
    dw $0002,SpriteObjectSpritemaps_37_EnemyShot_0
    dw $0002,SpriteObjectSpritemaps_37_EnemyShot_1
    dw $0002,SpriteObjectSpritemaps_37_EnemyShot_2
    dw $0002,SpriteObjectSpritemaps_37_EnemyShot_3
    dw Instruction_SpriteObject_Delete


;;; $C5D8: Instruction list - sprite object 38h (yapping maw base - facing down) ;;;
InstList_SpriteObject_38_YappingMawBaseFacingDown:
    dw $0001,SpriteObjectSpritemaps_38_YappingMawBaseFacingDown
    dw Instruction_SpriteObject_GoBack4Bytes


;;; $C5DE: Instruction list - sprite object 39h (yapping maw base - facing up) ;;;
InstList_SpriteObject_39_YappingMawBaseFacingUp:
    dw $0001,SpriteObjectSpritemaps_39_YappingMawBaseFacingUp
    dw Instruction_SpriteObject_GoBack4Bytes


;;; $C5E4: Instruction list - sprite object 3Ah (unused) ;;;
UNUSED_InstList_SpriteObject_3A_B4C5E4:
    dw $000A,UNUSED_SpriteObjectSpritemaps_3A_0_B4D8BD
    dw $000A,UNUSED_SpriteObjectSpritemaps_3A_1_B4D905
    dw $000A,UNUSED_SpriteObjectSpritemaps_3A_2_B4D957
    dw $000A,UNUSED_SpriteObjectSpritemaps_3A_3_B4D9A9
    dw $000A,UNUSED_SpriteObjectSpritemaps_3A_4_B4D9FB
    dw $000A,UNUSED_SpriteObjectSpritemaps_3A_5_B4DA48
    dw $000A,UNUSED_SpriteObjectSpritemaps_3A_6_B4DA90
    dw $000A,UNUSED_SpriteObjectSpritemaps_3A_7_B4DAD8
    dw Instruction_SpriteObject_GotoParameter
    dw UNUSED_InstList_SpriteObject_3A_B4C5E4


;;; $C608: Instruction list - sprite object 3Bh (evir facing left) ;;;
InstList_SpriteObject_3B_EvirFacingLeft:
    dw $000A,SpriteObjectSpritemaps_3B_EvirFacingLeft_0
    dw $000A,SpriteObjectSpritemaps_3B_EvirFacingLeft_1
    dw $000A,SpriteObjectSpritemaps_3B_EvirFacingLeft_2
    dw $000A,SpriteObjectSpritemaps_3B_EvirFacingLeft_3
    dw Instruction_SpriteObject_GotoParameter
    dw InstList_SpriteObject_3B_EvirFacingLeft


;;; $C61C: Instruction list - sprite object 3Ch (evir facing right) ;;;
InstList_SpriteObject_3C_EvirFacingRight:
    dw $000A,SpriteObjectSpritemaps_3C_EvirFacingRight_0
    dw $000A,SpriteObjectSpritemaps_3C_EvirFacingRight_1
    dw $000A,SpriteObjectSpritemaps_3C_EvirFacingRight_2
    dw $000A,SpriteObjectSpritemaps_3C_EvirFacingRight_3
    dw Instruction_SpriteObject_GotoParameter
    dw InstList_SpriteObject_3C_EvirFacingRight


;;; $C630: Sprite object spritemaps ;;;
UNUSED_SpriteObjectSpritemaps_1E_0_B4C630:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 0, 0, $100)

UNUSED_SpriteObjectSpritemaps_1E_1_B4C637:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 0, 0, $101)

UNUSED_SpriteObjectSpritemaps_1E_2_B4C63E:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 0, 0, $102)

UNUSED_SpriteObjectSpritemaps_1F_0_B4C645:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 0, 0, $103)

UNUSED_SpriteObjectSpritemaps_1F_1_B4C645:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 0, 0, $104)

UNUSED_SpriteObjectSpritemaps_1F_2_B4C653:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 0, 0, $105)

UNUSED_SpriteObjectSpritemaps_20_0_B4C65A:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 0, 0, $106)

UNUSED_SpriteObjectSpritemaps_20_1_B4C661:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 0, 0, $107)

UNUSED_SpriteObjectSpritemaps_20_2_B4C668:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 0, 0, $108)

UNUSED_SpriteObjectSpritemaps_21_0_B4C66F:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 0, 0, 0, $103)

UNUSED_SpriteObjectSpritemaps_21_1_B4C676:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 0, 0, 0, $104)

UNUSED_SpriteObjectSpritemaps_21_2_B4C67D:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 0, 0, 0, $105)

UNUSED_SpriteObjectSpritemaps_22_0_B4C684:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 0, 0, 0, $100)

UNUSED_SpriteObjectSpritemaps_22_1_B4C68B:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 0, 0, 0, $101)

UNUSED_SpriteObjectSpritemaps_22_2_B4C692:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 0, 0, 0, $102)

UNUSED_SpriteObjectSpritemaps_23_0_B4C699:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 1, 0, 0, $103)

UNUSED_SpriteObjectSpritemaps_23_1_B4C6A0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 1, 0, 0, $104)

UNUSED_SpriteObjectSpritemaps_23_2_B4C6A7:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 1, 0, 0, $105)

UNUSED_SpriteObjectSpritemaps_24_0_B4C6AE:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 0, 0, $106)

UNUSED_SpriteObjectSpritemaps_24_1_B4C6B5:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 0, 0, $107)

UNUSED_SpriteObjectSpritemaps_24_2_B4C6BC:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 0, 0, $108)

UNUSED_SpriteObjectSpritemaps_25_0_B4C6C3:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 0, 0, $103)

UNUSED_SpriteObjectSpritemaps_25_1_B4C6CA:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 0, 0, $104)

UNUSED_SpriteObjectSpritemaps_25_2_B4C6D1:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 0, 0, $105)

UNUSED_SpriteObjectSpritemaps_11_RockParticles_0_B4C6D8:
    dw $0004
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $00, $00, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 5, $2B)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $2B)

UNUSED_SpriteObjectSpritemaps_11_RockParticles_1_B4C6EE:
    dw $0004
    %spritemapEntry(0, $02, $F3, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $01, $FF, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $1F7, $FF, 0, 0, 3, 5, $2B)
    %spritemapEntry(0, $1F6, $F3, 0, 0, 3, 5, $2B)

UNUSED_SpriteObjectSpritemaps_11_RockParticles_2_B4C704:
    dw $0004
    %spritemapEntry(0, $05, $EE, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $03, $FD, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $1F5, $FD, 0, 0, 3, 5, $2B)
    %spritemapEntry(0, $1F3, $EE, 0, 0, 3, 5, $2B)

UNUSED_SpriteObjectSpritemaps_11_RockParticles_3_B4C71A:
    dw $0004
    %spritemapEntry(0, $07, $EC, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $05, $FB, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $1F3, $FB, 0, 0, 3, 5, $2B)
    %spritemapEntry(0, $1F1, $EC, 0, 0, 3, 5, $2B)

UNUSED_SpriteObjectSpritemaps_11_RockParticles_4_B4C730:
    dw $0004
    %spritemapEntry(0, $09, $EA, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $07, $FA, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $1F1, $FA, 0, 0, 3, 5, $2B)
    %spritemapEntry(0, $1EF, $EA, 0, 0, 3, 5, $2B)

UNUSED_SpriteObjectSpritemaps_11_RockParticles_5_B4C746:
    dw $0004
    %spritemapEntry(0, $0A, $EA, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $08, $F9, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $1F0, $F9, 0, 0, 3, 5, $2B)
    %spritemapEntry(0, $1EE, $EA, 0, 0, 3, 5, $2B)

UNUSED_SpriteObjectSpritemaps_11_RockParticles_6_B4C75C:
    dw $0004
    %spritemapEntry(0, $0C, $EB, 0, 1, 3, 5, $2A)
    %spritemapEntry(0, $09, $FA, 0, 1, 3, 5, $2A)
    %spritemapEntry(0, $1EF, $FA, 0, 0, 3, 5, $2A)
    %spritemapEntry(0, $1EC, $EB, 0, 0, 3, 5, $2A)

UNUSED_SpriteObjectSpritemaps_11_RockParticles_7_B4C772:
    dw $0004
    %spritemapEntry(0, $0E, $EC, 0, 1, 3, 5, $2A)
    %spritemapEntry(0, $0A, $FC, 0, 1, 3, 5, $2A)
    %spritemapEntry(0, $1EE, $FC, 0, 0, 3, 5, $2A)
    %spritemapEntry(0, $1EA, $EC, 0, 0, 3, 5, $2A)

UNUSED_SpriteObjectSpritemaps_11_RockParticles_8_B4C788:
    dw $0004
    %spritemapEntry(0, $10, $ED, 0, 1, 3, 5, $29)
    %spritemapEntry(0, $0B, $FE, 0, 1, 3, 5, $29)
    %spritemapEntry(0, $1ED, $FE, 0, 0, 3, 5, $29)
    %spritemapEntry(0, $1E8, $ED, 0, 0, 3, 5, $29)

UNUSED_SpriteObjectSpritemaps_11_RockParticles_9_B4C79E:
    dw $0004
    %spritemapEntry(0, $12, $EE, 0, 1, 3, 5, $29)
    %spritemapEntry(0, $0C, $00, 0, 1, 3, 5, $29)
    %spritemapEntry(0, $1EC, $00, 0, 0, 3, 5, $29)
    %spritemapEntry(0, $1E6, $EE, 0, 0, 3, 5, $29)

UNUSED_SpriteObjectSpritemaps_11_RockParticles_A_B4C7B4:
    dw $0004
    %spritemapEntry(0, $13, $F0, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $0D, $02, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $1E5, $F0, 0, 0, 3, 5, $28)
    %spritemapEntry(0, $1EB, $02, 0, 0, 3, 5, $28)

UNUSED_SpriteObjectSpritemaps_11_RockParticles_B_B4C7CA:
    dw $0004
    %spritemapEntry(0, $14, $F2, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $0E, $04, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $1E4, $F2, 0, 0, 3, 5, $28)
    %spritemapEntry(0, $1EA, $04, 0, 0, 3, 5, $28)

UNUSED_SpriteObjectSpritemaps_11_RockParticles_C_B4C7E0:
    dw $0004
    %spritemapEntry(0, $15, $F5, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $0F, $07, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $1E3, $F5, 0, 0, 3, 5, $28)
    %spritemapEntry(0, $1E9, $07, 0, 0, 3, 5, $28)

UNUSED_SpriteObjectSpritemaps_11_RockParticles_D_B4C7F6:
    dw $0004
    %spritemapEntry(0, $16, $F9, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $10, $0B, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $1E2, $F9, 0, 0, 3, 5, $28)
    %spritemapEntry(0, $1E8, $0B, 0, 0, 3, 5, $28)

UNUSED_SpriteObjectSpritemaps_11_RockParticles_E_B4C80C:
    dw $0004
    %spritemapEntry(0, $17, $03, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $11, $11, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $1E1, $03, 0, 0, 3, 5, $28)
    %spritemapEntry(0, $1E7, $11, 0, 0, 3, 5, $28)

UNUSED_SpriteObjectSpritemaps_11_RockParticles_F_B4C822:
    dw $0004
    %spritemapEntry(0, $18, $0A, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $12, $18, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $1E0, $0A, 0, 0, 3, 5, $28)
    %spritemapEntry(0, $1E6, $18, 0, 0, 3, 5, $28)

SpriteObjectSpritemaps_12_15_BigDustCloud_0:
    dw $0001
    %spritemapEntry(0, $1F7, $F7, 0, 0, 3, 5, $48)

SpriteObjectSpritemaps_12_15_BigDustCloud_1:
    dw $0002
    %spritemapEntry(0, $01, $01, 0, 0, 3, 5, $48)
    %spritemapEntry(1, $1F3, $F3, 0, 0, 3, 5, $7C)

SpriteObjectSpritemaps_12_15_BigDustCloud_2:
    dw $0003
    %spritemapEntry(1, $1FD, $FD, 0, 0, 3, 5, $7C)
    %spritemapEntry(0, $1F7, $01, 0, 0, 3, 5, $48)
    %spritemapEntry(1, $1F3, $F3, 0, 0, 3, 5, $7E)

SpriteObjectSpritemaps_12_15_BigDustCloud_3:
    dw $0004
    %spritemapEntry(0, $01, $F7, 0, 0, 3, 5, $48)
    %spritemapEntry(1, $1FD, $FD, 0, 0, 3, 5, $7E)
    %spritemapEntry(1, $1F3, $FD, 0, 0, 3, 5, $7C)
    %spritemapEntry(1, $1F3, $F3, 0, 0, 3, 5, $9A)

SpriteObjectSpritemaps_13_14_15_BigDustCloud_4:
    dw $0004
    %spritemapEntry(1, $1FD, $F3, 0, 0, 3, 5, $7C)
    %spritemapEntry(1, $1FD, $FD, 0, 0, 3, 5, $9A)
    %spritemapEntry(1, $1F3, $FD, 0, 0, 3, 5, $7E)
    %spritemapEntry(1, $1F3, $F3, 0, 0, 3, 5, $9C)

SpriteObjectSpritemaps_13_14_15_BigDustCloud_5:
    dw $0003
    %spritemapEntry(1, $1FD, $F3, 0, 0, 3, 5, $7E)
    %spritemapEntry(1, $1FD, $FD, 0, 0, 3, 5, $9C)
    %spritemapEntry(1, $1F3, $FD, 0, 0, 3, 5, $9A)

SpriteObjectSpritemaps_13_14_15_BigDustCloud_6:
    dw $0002
    %spritemapEntry(1, $1FD, $F3, 0, 0, 3, 5, $9A)
    %spritemapEntry(1, $1F3, $FD, 0, 0, 3, 5, $9C)

SpriteObjectSpritemaps_13_14_15_BigDustCloud_7:
    dw $0001
    %spritemapEntry(1, $1FD, $F3, 0, 0, 3, 5, $9C)

UNUSED_SpriteObjectSpritemaps_13_14_16_DustCloud_Beam_B4C8AC:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $6B)

UNUSED_SpriteObjectSpritemaps_13_14_16_DustCloud_Beam_B4C8B3:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $6C)

UNUSED_SpriteObjectSpritemaps_14_16_DustCloud_Beam_B4C8BA:
    dw $0002
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 5, $6B)
    %spritemapEntry(0, $00, $FC, 0, 0, 3, 5, $6B)

UNUSED_SpriteObjectSpritemaps_16_DustCloud_Beam_B4C8C6:
    dw $0002
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 5, $6C)
    %spritemapEntry(0, $00, $FC, 0, 0, 3, 5, $6C)

UNUSED_SpriteObjectSpritemaps_16_DustCloud_Beam_B4C8D2:
    dw $0003
    %spritemapEntry(0, $1F4, $FC, 0, 0, 3, 5, $6C)
    %spritemapEntry(0, $04, $FC, 0, 0, 3, 5, $6C)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $6C)

UNUSED_SpriteObjectSpritemaps_16_DustCloud_Beam_B4C8E2:
    dw $0003
    %spritemapEntry(0, $04, $FC, 0, 0, 3, 5, $6B)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 3, 5, $6B)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $6B)

UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4:
    dw $0004
    %spritemapEntry(0, $08, $FC, 0, 0, 3, 5, $6C)
    %spritemapEntry(0, $00, $FC, 0, 0, 3, 5, $6C)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 5, $6C)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 3, 5, $6C)

UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A:
    dw $0004
    %spritemapEntry(0, $08, $FC, 0, 0, 3, 5, $6B)
    %spritemapEntry(0, $00, $FC, 0, 0, 3, 5, $6B)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 5, $6B)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 3, 5, $6B)

SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $25)

SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_1:
    dw $0003
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 5, $25)
    %spritemapEntry(0, $1FA, $F6, 0, 0, 3, 5, $25)
    %spritemapEntry(0, $1FC, $FB, 0, 0, 3, 5, $25)

SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_2:
    dw $0003
    %spritemapEntry(0, $01, $F7, 0, 0, 3, 5, $25)
    %spritemapEntry(0, $1F9, $F4, 0, 0, 3, 5, $25)
    %spritemapEntry(0, $1FB, $FA, 0, 0, 3, 5, $25)

SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_3:
    dw $0003
    %spritemapEntry(0, $01, $F5, 0, 0, 3, 5, $43)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 5, $43)
    %spritemapEntry(0, $1FA, $F1, 0, 0, 3, 5, $43)

SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_4:
    dw $0003
    %spritemapEntry(0, $01, $F3, 0, 0, 3, 5, $43)
    %spritemapEntry(0, $1FC, $F5, 0, 0, 3, 5, $43)
    %spritemapEntry(0, $1FA, $EE, 0, 0, 3, 5, $43)

SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_5:
    dw $0003
    %spritemapEntry(0, $00, $F0, 0, 0, 3, 5, $40)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 3, 5, $40)
    %spritemapEntry(0, $1FA, $ED, 0, 0, 3, 5, $40)

SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_6:
    dw $0003
    %spritemapEntry(0, $00, $EE, 0, 0, 3, 5, $40)
    %spritemapEntry(0, $1FC, $F2, 0, 0, 3, 5, $40)
    %spritemapEntry(0, $1FA, $EC, 0, 0, 3, 5, $40)

SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_7:
    dw $0002
    %spritemapEntry(0, $00, $EC, 0, 0, 3, 5, $40)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 3, 5, $40)

SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_8:
    dw $0001
    %spritemapEntry(0, $1FC, $EE, 0, 0, 3, 5, $40)

UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_0_B4C9A0:
    dw $0004
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 5, $6F)

UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_1_B4C9B6:
    dw $0004
    %spritemapEntry(0, $08, $E8, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $00, $E8, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F8, $E8, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F0, $E8, 0, 0, 3, 5, $6F)

UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_2_B4C9CC:
    dw $0004
    %spritemapEntry(0, $08, $F0, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $00, $F0, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F0, $F0, 0, 0, 3, 5, $6F)

UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_3_B4C9E2:
    dw $0004
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 5, $6F)

UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_4_B4C9F8:
    dw $0004
    %spritemapEntry(0, $08, $00, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F0, $00, 0, 0, 3, 5, $6F)

UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_5_B4CA0E:
    dw $0004
    %spritemapEntry(0, $08, $08, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $00, $08, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F8, $08, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F0, $08, 0, 0, 3, 5, $6F)

UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_6_B4CA24:
    dw $0004
    %spritemapEntry(0, $08, $10, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $00, $10, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F8, $10, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F0, $10, 0, 0, 3, 5, $6F)

UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_7_B4CA3A:
    dw $0004
    %spritemapEntry(0, $08, $18, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $00, $18, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F8, $18, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F0, $18, 0, 0, 3, 5, $6F)

UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_0_B4CA50:
    dw $0002
    %spritemapEntry(0, $00, $FC, 0, 0, 3, 5, $BF)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 5, $BE)

UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_1_B4CA5C:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 5, $BE)

UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_2_B4CA63:
    dw $0002
    %spritemapEntry(1, $1F8, $FC, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $F4, 0, 0, 3, 5, $BE)

UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_3_B4CA6F:
    dw $0002
    %spritemapEntry(1, $1F8, $00, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 3, 5, $BE)

UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_4_B4CA7B:
    dw $0003
    %spritemapEntry(1, $1F8, $04, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $EC, 0, 0, 3, 5, $BE)

UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_5_B4CA8C:
    dw $0003
    %spritemapEntry(1, $1F8, $08, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $E8, 0, 0, 3, 5, $BE)

UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_6_B4CA9D:
    dw $0004
    %spritemapEntry(1, $1F8, $0C, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $00, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $E4, 0, 0, 3, 5, $BE)

UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_7_B4CAB3:
    dw $0004
    %spritemapEntry(1, $1F8, $10, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $00, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $E0, 0, 0, 3, 5, $BE)

UNUSED_SpriteObjectSpritemaps_0_BeamCharge_0_B4CAC9:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $53)

UNUSED_SpriteObjectSpritemaps_0_BeamCharge_1_B4CAD0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $52)

UNUSED_SpriteObjectSpritemaps_0_BeamCharge_2_B4CAD7:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $51)

UNUSED_SpriteObjectSpritemaps_0_BeamCharge_3_B4CADE:
    dw $0004
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 6, $50)
    %spritemapEntry(0, $00, $00, 1, 1, 3, 6, $50)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 6, $50)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 6, $50)

UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_0_B4CAF4:
    dw $0003
    %spritemapEntry(0, $00, $0C, 0, 0, 3, 5, $5B)
    %spritemapEntry(0, $08, $EC, 0, 0, 3, 5, $5B)
    %spritemapEntry(0, $1F0, $F4, 0, 0, 3, 5, $5B)

UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_1_B4CB05:
    dw $0003
    %spritemapEntry(0, $1FD, $0A, 0, 0, 3, 5, $5C)
    %spritemapEntry(0, $06, $EE, 0, 0, 3, 5, $5C)
    %spritemapEntry(0, $1F2, $F6, 0, 0, 3, 5, $5C)

UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_2_B4CB16:
    dw $0003
    %spritemapEntry(0, $1FC, $08, 0, 0, 3, 5, $5C)
    %spritemapEntry(0, $04, $F0, 0, 0, 3, 5, $5C)
    %spritemapEntry(0, $1F4, $F8, 0, 0, 3, 5, $5C)

UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_3_B4CB27:
    dw $0003
    %spritemapEntry(0, $02, $F2, 0, 0, 3, 5, $5D)
    %spritemapEntry(0, $1FB, $06, 0, 0, 3, 5, $5D)
    %spritemapEntry(0, $1F6, $FA, 0, 0, 3, 5, $5D)

UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_4_B4CB38:
    dw $0003
    %spritemapEntry(0, $1FB, $04, 0, 0, 3, 5, $5D)
    %spritemapEntry(0, $1F8, $FB, 0, 0, 3, 5, $5D)
    %spritemapEntry(0, $00, $F4, 0, 0, 3, 5, $5D)

UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_5_B4CB49:
    dw $0003
    %spritemapEntry(0, $1FB, $02, 0, 0, 3, 5, $5D)
    %spritemapEntry(0, $1FA, $FA, 0, 0, 3, 5, $5D)
    %spritemapEntry(0, $00, $F6, 0, 0, 3, 5, $5D)

UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_0_B4CB5A:
    dw $0003
    %spritemapEntry(0, $00, $EC, 1, 0, 3, 5, $5B)
    %spritemapEntry(0, $08, $0C, 1, 0, 3, 5, $5B)
    %spritemapEntry(0, $1F0, $04, 1, 0, 3, 5, $5B)

UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_1_B4CB6B:
    dw $0003
    %spritemapEntry(0, $1FE, $EE, 1, 0, 3, 5, $5C)
    %spritemapEntry(0, $06, $0A, 1, 0, 3, 5, $5C)
    %spritemapEntry(0, $1F2, $02, 1, 0, 3, 5, $5C)

UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_2_B4CB7C:
    dw $0003
    %spritemapEntry(0, $04, $08, 1, 0, 3, 5, $5C)
    %spritemapEntry(0, $1F4, $00, 1, 0, 3, 5, $5C)
    %spritemapEntry(0, $1FD, $F0, 1, 0, 3, 5, $5C)

UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_3_B4CB8D:
    dw $0003
    %spritemapEntry(0, $02, $06, 1, 0, 3, 5, $5D)
    %spritemapEntry(0, $1FC, $F2, 1, 0, 3, 5, $5D)
    %spritemapEntry(0, $1F6, $FE, 1, 0, 3, 5, $5D)

UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_4_B4CB9E:
    dw $0003
    %spritemapEntry(0, $1FC, $F4, 1, 0, 3, 5, $5D)
    %spritemapEntry(0, $1F8, $FC, 1, 0, 3, 5, $5D)
    %spritemapEntry(0, $00, $04, 1, 0, 3, 5, $5D)

UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_5_B4CBAF:
    dw $0003
    %spritemapEntry(0, $1FC, $F6, 1, 0, 3, 5, $5D)
    %spritemapEntry(0, $1FA, $FD, 1, 0, 3, 5, $5D)
    %spritemapEntry(0, $00, $02, 1, 0, 3, 5, $5D)

SpriteObjectSpritemaps_3_SmallExplosion_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $5F)

SpriteObjectSpritemaps_3_SmallExplosion_1:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $8A)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $8A)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $8A)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $8A)

SpriteObjectSpritemaps_3_SmallExplosion_2:
    dw $0004
    %spritemapEntry(1, $00, $00, 1, 1, 3, 5, $90)
    %spritemapEntry(1, $1F0, $00, 1, 0, 3, 5, $90)
    %spritemapEntry(1, $00, $F0, 0, 1, 3, 5, $90)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 5, $90)

SpriteObjectSpritemaps_3_SmallExplosion_3:
    dw $0004
    %spritemapEntry(1, $00, $00, 1, 1, 3, 5, $92)
    %spritemapEntry(1, $1F0, $00, 1, 0, 3, 5, $92)
    %spritemapEntry(1, $00, $F0, 0, 1, 3, 5, $92)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 5, $92)

SpriteObjectSpritemaps_3_SmallExplosion_4:
    dw $0004
    %spritemapEntry(1, $00, $00, 1, 1, 3, 5, $94)
    %spritemapEntry(1, $1F0, $00, 1, 0, 3, 5, $94)
    %spritemapEntry(1, $00, $F0, 0, 1, 3, 5, $94)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 5, $94)

SpriteObjectSpritemaps_3_SmallExplosion_5:
    dw $0004
    %spritemapEntry(1, $00, $00, 1, 1, 3, 5, $96)
    %spritemapEntry(1, $1F0, $00, 1, 0, 3, 5, $96)
    %spritemapEntry(1, $00, $F0, 0, 1, 3, 5, $96)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 5, $96)

UNSUED_SpriteObjectSpritemaps_4_BombExplosion_0_B4CC35:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $8B)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $8B)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $8B)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $8B)

UNSUED_SpriteObjectSpritemaps_4_BombExplosion_1_B4CC4B:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $7A)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $7A)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $7A)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $7A)

UNSUED_SpriteObjectSpritemaps_4_BombExplosion_2_B4CC61:
    dw $0004
    %spritemapEntry(1, $00, $00, 1, 1, 3, 5, $70)
    %spritemapEntry(1, $1F0, $00, 1, 0, 3, 5, $70)
    %spritemapEntry(1, $00, $F0, 0, 1, 3, 5, $70)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 5, $70)

UNSUED_SpriteObjectSpritemaps_4_BombExplosion_3_B4CC77:
    dw $0004
    %spritemapEntry(1, $00, $00, 1, 1, 3, 5, $72)
    %spritemapEntry(1, $1F0, $00, 1, 0, 3, 5, $72)
    %spritemapEntry(1, $00, $F0, 0, 1, 3, 5, $72)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 5, $72)

UNSUED_SpriteObjectSpritemaps_4_BombExplosion_4_B4CC8D:
    dw $0004
    %spritemapEntry(1, $00, $00, 1, 1, 3, 5, $74)
    %spritemapEntry(1, $1F0, $00, 1, 0, 3, 5, $74)
    %spritemapEntry(1, $00, $F0, 0, 1, 3, 5, $74)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 5, $74)

UNSUED_SpriteObjectSpritemaps__B4CCA3:
    dw $0004
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 5, $5E)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 5, $5E)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 5, $5E)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $5E)

UNSUED_SpriteObjectSpritemaps_5_BeamTrail_0_B4CCB9:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $38)

UNSUED_SpriteObjectSpritemaps_5_BeamTrail_1_B4CCC0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $39)

UNSUED_SpriteObjectSpritemaps_5_BeamTrail_2_B4CCC7:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $3A)

UNSUED_SpriteObjectSpritemaps_5_BeamTrail_3_B4CCCE:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $3B)

UNSUED_SpriteObjectSpritemaps_7_PowerBomb_0_B4CCD5:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $26)

UNSUED_SpriteObjectSpritemaps_7_PowerBomb_1_B4CCDC:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $27)

UNSUED_SpriteObjectSpritemaps_7_PowerBomb_2_B4CCE3:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $7B)

UNSUED_SpriteObjectSpritemaps_B4CCEA:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $5F)

SpriteObjectSpritemaps_6_DudShot_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $53)

SpriteObjectSpritemaps_6_DudShot_1:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $51)

SpriteObjectSpritemaps_6_DudShot_2:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $60)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $60)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $60)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $60)

SpriteObjectSpritemaps_6_DudShot_3:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $61)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $61)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $61)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $61)

SpriteObjectSpritemaps_6_DudShot_4:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $62)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $62)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $62)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $62)

SpriteObjectSpritemaps_6_DudShot_5:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $63)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $63)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $63)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $63)

UNSUED_SpriteObjectSpritemaps_8_1C_ElevatorPad_0_B4CD57:
    dw $0004
    %spritemapEntry(0, $1F2, $FC, 0, 1, 3, 5, $6C)
    %spritemapEntry(0, $06, $FC, 0, 1, 3, 5, $6C)
    %spritemapEntry(0, $00, $FC, 0, 1, 3, 5, $6C)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 5, $6C)

UNSUED_SpriteObjectSpritemaps_8_1C_ElevatorPad_1_B4CD6D:
    dw $0004
    %spritemapEntry(0, $00, $FC, 0, 1, 3, 5, $6E)
    %spritemapEntry(0, $08, $FC, 0, 1, 3, 5, $6D)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 5, $6E)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 3, 5, $6D)

UNSUED_SpriteObjectSpritemaps_B4CD83:
    dw $0004
    %spritemapEntry(0, $1F0, $FE, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $08, $FE, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $00, $FE, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F8, $FE, 0, 0, 3, 5, $6F)

SpriteObjectSpritemaps_9_SmallDustCloud_0:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 5, $7C)

SpriteObjectSpritemaps_9_SmallDustCloud_1:
    dw $0001
    %spritemapEntry(1, $1F8, $F6, 0, 0, 3, 5, $7E)

SpriteObjectSpritemaps_9_SmallDustCloud_2:
    dw $0001
    %spritemapEntry(1, $1F8, $F4, 0, 0, 3, 5, $9A)

SpriteObjectSpritemaps_9_SmallDustCloud_3:
    dw $0001
    %spritemapEntry(1, $1F8, $F2, 0, 0, 3, 5, $9C)

SpriteObjectSpritemaps_A_PirateLandingDustCloud_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $48)

SpriteObjectSpritemaps_A_PirateLandingDustCloud_1:
    dw $0001
    %spritemapEntry(0, $1FC, $FA, 0, 0, 3, 5, $49)

SpriteObjectSpritemaps_A_PirateLandingDustCloud_2:
    dw $0001
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 5, $4A)

SpriteObjectSpritemaps_A_PirateLandingDustCloud_3:
    dw $0001
    %spritemapEntry(0, $1FC, $F6, 0, 0, 3, 5, $4B)

UNSUED_SpriteObjectSpritemaps_B_EyeDoorSweatDrop_0_B4CDD1:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $2C)

UNSUED_SpriteObjectSpritemaps_B_EyeDoorSweatDrop_1_B4CDD8:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $2D)

UNSUED_SpriteObjectSpritemaps_B_EyeDoorSweatDrop_2_B4CDDF:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $2E)

UNSUED_SpriteObjectSpritemaps_B_EyeDoorSweatDrop_3_B4CDE6:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $2F)

SpriteObjectSpritemaps_C_Smoke_0:
    dw $0001
    %spritemapEntry(1, $1F8, $F6, 0, 0, 3, 5, $76)

SpriteObjectSpritemaps_C_Smoke_1:
    dw $0001
    %spritemapEntry(1, $1F8, $F4, 0, 0, 3, 5, $78)

SpriteObjectSpritemaps_C_Smoke_2:
    dw $0001
    %spritemapEntry(1, $1F8, $F2, 0, 0, 3, 5, $98)

SpriteObjectSpritemaps_C_Smoke_3:
    dw $0001
    %spritemapEntry(1, $1F8, $F0, 0, 0, 3, 5, $9E)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SpriteObjectSpritemaps_B4CE09:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $25)

UNUSED_SpriteObjectSpritemaps_B4CE10:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $43)

UNUSED_SpriteObjectSpritemaps_B4CE17:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $40)
endif ; !FEATURE_KEEP_UNREFERENCED

UNUSED_SpriteObjectSpritemaps_D_SmallEnergyDrop_0_B4CE1E:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $3E)

UNUSED_SpriteObjectSpritemaps_D_SmallEnergyDrop_1_B4CE25:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $3D)

UNUSED_SpriteObjectSpritemaps_D_SmallEnergyDrop_2_B4CE2C:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $41)

UNUSED_SpriteObjectSpritemaps_D_SmallEnergyDrop_3_B4CE33:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $42)

UNUSED_SpriteObjectSpritemaps_E_BigEnergyDrop_0_B4CE3A:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $44)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $44)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $44)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $44)

UNUSED_SpriteObjectSpritemaps_E_BigEnergyDrop_1_B4CE50:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $45)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $45)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $45)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $45)

UNUSED_SpriteObjectSpritemaps_E_BigEnergyDrop_2_B4CE66:
    dw $0004
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $46)
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $46)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $46)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $46)

UNUSED_SpriteObjectSpritemaps_E_BigEnergyDrop_3_B4CE7C:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $42)

UNUSED_SpriteObjectSpritemaps_F_Bomb_0_B4CE83:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $4C)

UNUSED_SpriteObjectSpritemaps_F_Bomb_1_B4CE8A:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $4D)

UNUSED_SpriteObjectSpritemaps_F_Bomb_2_B4CE91:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $4E)

UNUSED_SpriteObjectSpritemaps_F_Bomb_3_B4CE98:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $4F)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SpriteObjectSpritemaps_B4CE9F:
    dw $0002
    %spritemapEntry(0, $1FF, $FC, 0, 0, 3, 5, $55)
    %spritemapEntry(0, $1F7, $FC, 0, 0, 3, 5, $54)

UNUSED_SpriteObjectSpritemaps_B4CEAB:
    dw $0003
    %spritemapEntry(0, $1FA, $F5, 0, 0, 3, 5, $56)
    %spritemapEntry(0, $02, $FD, 0, 0, 3, 5, $58)
    %spritemapEntry(0, $1FA, $FD, 0, 0, 3, 5, $57)

UNUSED_SpriteObjectSpritemaps_B4CEBC:
    dw $0002
    %spritemapEntry(0, $1FD, $F7, 0, 0, 3, 5, $59)
    %spritemapEntry(0, $1FD, $FF, 0, 0, 3, 5, $5A)

UNUSED_SpriteObjectSpritemaps_B4CEC8:
    dw $0003
    %spritemapEntry(0, $1FE, $F5, 0, 1, 3, 5, $56)
    %spritemapEntry(0, $1F6, $FD, 0, 1, 3, 5, $58)
    %spritemapEntry(0, $1FE, $FD, 0, 1, 3, 5, $57)

UNUSED_SpriteObjectSpritemaps_B4CED9:
    dw $0002
    %spritemapEntry(0, $1F9, $FC, 0, 1, 3, 5, $55)
    %spritemapEntry(0, $01, $FC, 0, 1, 3, 5, $54)

UNUSED_SpriteObjectSpritemaps_B4CEE5:
    dw $0003
    %spritemapEntry(0, $1FE, $03, 1, 1, 3, 5, $56)
    %spritemapEntry(0, $1F6, $FB, 1, 1, 3, 5, $58)
    %spritemapEntry(0, $1FE, $FB, 1, 1, 3, 5, $57)

UNUSED_SpriteObjectSpritemaps_B4CEF6:
    dw $0002
    %spritemapEntry(0, $1FD, $01, 1, 0, 3, 5, $59)
    %spritemapEntry(0, $1FD, $F9, 1, 0, 3, 5, $5A)

UNUSED_SpriteObjectSpritemaps_B4CF02:
    dw $0003
    %spritemapEntry(0, $1FA, $03, 1, 0, 3, 5, $56)
    %spritemapEntry(0, $02, $FB, 1, 0, 3, 5, $58)
    %spritemapEntry(0, $1FA, $FB, 1, 0, 3, 5, $57)

UNUSED_SpriteObjectSpritemaps_B4CF13:
    dw $0002
    %spritemapEntry(0, $00, $FC, 0, 0, 3, 5, $65)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 5, $64)

UNUSED_SpriteObjectSpritemaps_B4CF1F:
    dw $0003
    %spritemapEntry(0, $02, $FE, 0, 0, 3, 5, $68)
    %spritemapEntry(0, $1FA, $FE, 0, 0, 3, 5, $67)
    %spritemapEntry(0, $1FA, $F6, 0, 0, 3, 5, $66)

UNUSED_SpriteObjectSpritemaps_B4CF30:
    dw $0002
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 5, $69)
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 5, $6A)

UNUSED_SpriteObjectSpritemaps_B4CF3C:
    dw $0003
    %spritemapEntry(0, $1F6, $FE, 0, 1, 3, 5, $68)
    %spritemapEntry(0, $1FE, $FE, 0, 1, 3, 5, $67)
    %spritemapEntry(0, $1FE, $F6, 0, 1, 3, 5, $66)

UNUSED_SpriteObjectSpritemaps_B4CF4D:
    dw $0002
    %spritemapEntry(0, $1F8, $FC, 0, 1, 3, 5, $65)
    %spritemapEntry(0, $00, $FC, 0, 1, 3, 5, $64)

UNUSED_SpriteObjectSpritemaps_B4CF59:
    dw $0003
    %spritemapEntry(0, $1F6, $FA, 1, 1, 3, 5, $68)
    %spritemapEntry(0, $1FE, $FA, 1, 1, 3, 5, $67)
    %spritemapEntry(0, $1FE, $02, 1, 1, 3, 5, $66)

UNUSED_SpriteObjectSpritemaps_B4CF6A:
    dw $0002
    %spritemapEntry(0, $1FC, $00, 1, 0, 3, 5, $69)
    %spritemapEntry(0, $1FC, $F8, 1, 0, 3, 5, $6A)

UNUSED_SpriteObjectSpritemaps_B4CF76:
    dw $0003
    %spritemapEntry(0, $02, $FA, 1, 0, 3, 5, $68)
    %spritemapEntry(0, $1FA, $FA, 1, 0, 3, 5, $67)
    %spritemapEntry(0, $1FA, $02, 1, 0, 3, 5, $66)
endif ; !FEATURE_KEEP_UNREFERENCED

UNUSED_SpriteObjectSpritemaps_10_SmallEnergyDrop_0_B4CF87:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $3C)

UNUSED_SpriteObjectSpritemaps_10_SmallEnergyDrop_1_B4CF8E:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $3D)

UNUSED_SpriteObjectSpritemaps_10_SmallEnergyDrop_2_B4CF95:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $3E)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SpriteObjectSpritemaps_B4CF9C:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $3F)
endif ; !FEATURE_KEEP_UNREFERENCED

SpriteObjectSpritemaps_1D_BigExplosion_0:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $8A)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $8A)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $8A)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $8A)

SpriteObjectSpritemaps_1D_BigExplosion_1:
    dw $0004
    %spritemapEntry(1, $4200, $00, 1, 1, 3, 5, $90)
    %spritemapEntry(1, $4200, $F0, 0, 1, 3, 5, $90)
    %spritemapEntry(1, $43F0, $00, 1, 0, 3, 5, $90)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 5, $90)

SpriteObjectSpritemaps_1D_BigExplosion_2:
    dw $0004
    %spritemapEntry(1, $4200, $00, 1, 1, 3, 5, $92)
    %spritemapEntry(1, $43F0, $00, 1, 0, 3, 5, $92)
    %spritemapEntry(1, $4200, $F0, 0, 1, 3, 5, $92)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 5, $92)

SpriteObjectSpritemaps_1D_BigExplosion_3:
    dw $000C
    %spritemapEntry(0, $10, $00, 1, 1, 3, 5, $C2)
    %spritemapEntry(0, $10, $F8, 0, 1, 3, 5, $C2)
    %spritemapEntry(0, $00, $10, 1, 1, 3, 5, $B2)
    %spritemapEntry(0, $1F8, $10, 1, 0, 3, 5, $B2)
    %spritemapEntry(0, $1E8, $00, 1, 0, 3, 5, $C2)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 5, $C2)
    %spritemapEntry(0, $00, $E8, 0, 1, 3, 5, $B2)
    %spritemapEntry(0, $1F8, $E8, 0, 0, 3, 5, $B2)
    %spritemapEntry(1, $4200, $00, 1, 1, 3, 5, $B0)
    %spritemapEntry(1, $4200, $F0, 0, 1, 3, 5, $B0)
    %spritemapEntry(1, $43F0, $00, 1, 0, 3, 5, $B0)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 5, $B0)

SpriteObjectSpritemaps_1D_BigExplosion_4:
    dw $0008
    %spritemapEntry(1, $4208, $00, 1, 1, 3, 5, $B5)
    %spritemapEntry(1, $4200, $08, 1, 1, 3, 5, $B3)
    %spritemapEntry(1, $43E8, $00, 1, 0, 3, 5, $B5)
    %spritemapEntry(1, $43F0, $08, 1, 0, 3, 5, $B3)
    %spritemapEntry(1, $4208, $F0, 0, 1, 3, 5, $B5)
    %spritemapEntry(1, $4200, $E8, 0, 1, 3, 5, $B3)
    %spritemapEntry(1, $43E8, $F0, 0, 0, 3, 5, $B5)
    %spritemapEntry(1, $43F0, $E8, 0, 0, 3, 5, $B3)

SpriteObjectSpritemaps_1D_BigExplosion_5:
    dw $000C
    %spritemapEntry(0, $00, $10, 1, 1, 3, 5, $BB)
    %spritemapEntry(0, $1F8, $10, 1, 0, 3, 5, $BB)
    %spritemapEntry(0, $00, $E8, 0, 1, 3, 5, $BB)
    %spritemapEntry(0, $1F8, $E8, 0, 0, 3, 5, $BB)
    %spritemapEntry(0, $10, $00, 1, 1, 3, 5, $B7)
    %spritemapEntry(0, $10, $F8, 0, 1, 3, 5, $B7)
    %spritemapEntry(0, $1E8, $00, 1, 0, 3, 5, $B7)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 5, $B7)
    %spritemapEntry(1, $4208, $08, 1, 1, 3, 5, $B8)
    %spritemapEntry(1, $43E8, $08, 1, 0, 3, 5, $B8)
    %spritemapEntry(1, $4208, $E8, 0, 1, 3, 5, $B8)
    %spritemapEntry(1, $43E8, $E8, 0, 0, 3, 5, $B8)

UNUSED_SpriteObjectSpritemaps_26_0_B4D08B:
    dw $0009
    %spritemapEntry(1, $1FE, $FB, 0, 0, 2, 0, $D6)
    %spritemapEntry(1, $1EE, $FB, 0, 0, 2, 0, $D4)
    %spritemapEntry(1, $1FE, $EB, 0, 0, 2, 0, $D2)
    %spritemapEntry(1, $1EE, $EB, 0, 0, 2, 0, $D0)
    %spritemapEntry(1, $02, $FB, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $01, $01, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $1FF, $07, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $1FE, $10, 0, 0, 2, 0, $F6)
    %spritemapEntry(0, $1FE, $08, 0, 0, 2, 0, $F5)

UNUSED_SpriteObjectSpritemaps_26_1_B4D0BA:
    dw $0009
    %spritemapEntry(1, $1FE, $FB, 0, 0, 2, 0, $D6)
    %spritemapEntry(1, $1EE, $FB, 0, 0, 2, 0, $D4)
    %spritemapEntry(1, $1FE, $EB, 0, 0, 2, 0, $D2)
    %spritemapEntry(1, $1EE, $EB, 0, 0, 2, 0, $D0)
    %spritemapEntry(1, $02, $FC, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $01, $02, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $1FF, $07, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $1FE, $10, 0, 0, 2, 0, $F6)
    %spritemapEntry(0, $1FE, $08, 0, 0, 2, 0, $F5)

UNUSED_SpriteObjectSpritemaps_26_2_B4D0E9:
    dw $0009
    %spritemapEntry(1, $1FE, $FB, 0, 0, 2, 0, $D6)
    %spritemapEntry(1, $1EE, $FB, 0, 0, 2, 0, $D4)
    %spritemapEntry(1, $1FE, $EB, 0, 0, 2, 0, $D2)
    %spritemapEntry(1, $1EE, $EB, 0, 0, 2, 0, $D0)
    %spritemapEntry(1, $02, $FD, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $01, $03, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $1FF, $08, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $1FE, $11, 0, 0, 2, 0, $F6)
    %spritemapEntry(0, $1FE, $09, 0, 0, 2, 0, $F5)

UNUSED_SpriteObjectSpritemaps_26_3_B4D118:
    dw $0009
    %spritemapEntry(1, $1FE, $FB, 0, 0, 2, 0, $D6)
    %spritemapEntry(1, $1EE, $FB, 0, 0, 2, 0, $D4)
    %spritemapEntry(1, $1FE, $EB, 0, 0, 2, 0, $D2)
    %spritemapEntry(1, $1EE, $EB, 0, 0, 2, 0, $D0)
    %spritemapEntry(1, $02, $FD, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $01, $04, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $1FF, $09, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $1FE, $12, 0, 0, 2, 0, $F6)
    %spritemapEntry(0, $1FE, $0A, 0, 0, 2, 0, $F5)

UNUSED_SpriteObjectSpritemaps_26_4_B4D147:
    dw $0009
    %spritemapEntry(1, $1FE, $FB, 0, 0, 2, 0, $D6)
    %spritemapEntry(1, $1EE, $FB, 0, 0, 2, 0, $D4)
    %spritemapEntry(1, $1FE, $EB, 0, 0, 2, 0, $D2)
    %spritemapEntry(1, $1EE, $EB, 0, 0, 2, 0, $D0)
    %spritemapEntry(1, $02, $FD, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $01, $04, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $1FF, $0A, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $1FE, $11, 0, 0, 2, 0, $F6)
    %spritemapEntry(0, $1FE, $09, 0, 0, 2, 0, $F5)

UNUSED_SpriteObjectSpritemaps_26_5_B4D176:
    dw $0009
    %spritemapEntry(1, $1FE, $FB, 0, 0, 2, 0, $D6)
    %spritemapEntry(1, $1EE, $FB, 0, 0, 2, 0, $D4)
    %spritemapEntry(1, $1FE, $EB, 0, 0, 2, 0, $D2)
    %spritemapEntry(1, $1EE, $EB, 0, 0, 2, 0, $D0)
    %spritemapEntry(1, $02, $FC, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $01, $03, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $1FF, $09, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $1FE, $10, 0, 0, 2, 0, $F6)
    %spritemapEntry(0, $1FE, $08, 0, 0, 2, 0, $F5)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SpriteObjectSpritemaps_B4D1A5:
    dw $0009
    %spritemapEntry(1, $1FE, $FB, 0, 0, 2, 0, $D6)
    %spritemapEntry(1, $1EE, $FB, 0, 0, 2, 0, $D4)
    %spritemapEntry(1, $1FE, $EB, 0, 0, 2, 0, $D2)
    %spritemapEntry(1, $1EE, $EB, 0, 0, 2, 0, $D0)
    %spritemapEntry(1, $02, $FB, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $01, $01, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $1FF, $07, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $1FE, $10, 0, 0, 2, 0, $F6)
    %spritemapEntry(0, $1FE, $08, 0, 0, 2, 0, $F5)
endif ; !FEATURE_KEEP_UNREFERENCED

UNUSED_SpriteObjectSpritemaps_27_0_B4D1D4:
    dw $0005
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 0, $F4)
    %spritemapEntry(0, $1FE, $F4, 0, 0, 2, 0, $F1)
    %spritemapEntry(0, $1F6, $F4, 0, 0, 2, 0, $F0)

UNUSED_SpriteObjectSpritemaps_27_1_B4D1EF:
    dw $0005
    %spritemapEntry(0, $1FE, $F4, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $1F6, $F4, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $F4)
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $1FA, $FC, 0, 0, 2, 0, $F2)

UNUSED_SpriteObjectSpritemaps_27_2_B4D20A:
    dw $0005
    %spritemapEntry(0, $1FE, $F4, 0, 0, 2, 0, $F4)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 0, $F1)
    %spritemapEntry(0, $1FA, $FC, 0, 0, 2, 0, $F0)

UNUSED_SpriteObjectSpritemaps_27_3_B4D225:
    dw $0006
    %spritemapEntry(0, $1FE, $F4, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $1F6, $F4, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $F0)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $F1)
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $1FA, $FC, 0, 0, 2, 0, $F2)

UNUSED_SpriteObjectSpritemaps_27_4_B4D245:
    dw $0003
    %spritemapEntry(0, $1FE, $F4, 0, 0, 2, 0, $F4)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $F4)
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 0, $F4)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SpriteObjectSpritemaps_B4D256:
    dw $0006
    %spritemapEntry(0, $1FE, $F4, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $1F6, $F4, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $1FA, $FC, 0, 0, 2, 0, $F2)

UNUSED_SpriteObjectSpritemaps_B4D276:
    dw $0006
    %spritemapEntry(0, $1FE, $F4, 0, 0, 2, 0, $F1)
    %spritemapEntry(0, $1F6, $F4, 0, 0, 2, 0, $F0)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $F1)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $F0)
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 0, $F1)
    %spritemapEntry(0, $1FA, $FC, 0, 0, 2, 0, $F0)

UNUSED_SpriteObjectSpritemaps_B4D296:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 0, 2, 0, $F8)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 0, $F7)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $F8)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $F7)
endif ; !FEATURE_KEEP_UNREFERENCED

UNUSED_SpriteObjectSpritemaps_2A_B4D2AC:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $DE)

UNUSED_SpriteObjectSpritemaps_28_0_B4D2B3:
    dw $0009
    %spritemapEntry(1, $1F2, $FB, 0, 1, 2, 0, $D6)
    %spritemapEntry(1, $02, $FB, 0, 1, 2, 0, $D4)
    %spritemapEntry(1, $1F2, $EB, 0, 1, 2, 0, $D2)
    %spritemapEntry(1, $02, $EB, 0, 1, 2, 0, $D0)
    %spritemapEntry(1, $1EE, $FB, 0, 1, 2, 0, $D8)
    %spritemapEntry(1, $1EF, $01, 0, 1, 2, 0, $D8)
    %spritemapEntry(1, $1F1, $07, 0, 1, 2, 0, $DC)
    %spritemapEntry(0, $1FA, $10, 0, 1, 2, 0, $F6)
    %spritemapEntry(0, $1FA, $08, 0, 1, 2, 0, $F5)

UNUSED_SpriteObjectSpritemaps_28_1_B4D2E2:
    dw $0009
    %spritemapEntry(1, $1F2, $FB, 0, 1, 2, 0, $D6)
    %spritemapEntry(1, $02, $FB, 0, 1, 2, 0, $D4)
    %spritemapEntry(1, $1F2, $EB, 0, 1, 2, 0, $D2)
    %spritemapEntry(1, $02, $EB, 0, 1, 2, 0, $D0)
    %spritemapEntry(1, $1EE, $FC, 0, 1, 2, 0, $D8)
    %spritemapEntry(1, $1EF, $02, 0, 1, 2, 0, $D8)
    %spritemapEntry(1, $1F1, $07, 0, 1, 2, 0, $DC)
    %spritemapEntry(0, $1FA, $10, 0, 1, 2, 0, $F6)
    %spritemapEntry(0, $1FA, $08, 0, 1, 2, 0, $F5)

UNUSED_SpriteObjectSpritemaps_28_2_B4D311:
    dw $0009
    %spritemapEntry(1, $1F2, $FB, 0, 1, 2, 0, $D6)
    %spritemapEntry(1, $02, $FB, 0, 1, 2, 0, $D4)
    %spritemapEntry(1, $1F2, $EB, 0, 1, 2, 0, $D2)
    %spritemapEntry(1, $02, $EB, 0, 1, 2, 0, $D0)
    %spritemapEntry(1, $1EE, $FD, 0, 1, 2, 0, $D8)
    %spritemapEntry(1, $1EF, $03, 0, 1, 2, 0, $D8)
    %spritemapEntry(1, $1F1, $08, 0, 1, 2, 0, $DC)
    %spritemapEntry(0, $1FA, $11, 0, 1, 2, 0, $F6)
    %spritemapEntry(0, $1FA, $09, 0, 1, 2, 0, $F5)

UNUSED_SpriteObjectSpritemaps_28_3_B4D340:
    dw $0009
    %spritemapEntry(1, $1F2, $FB, 0, 1, 2, 0, $D6)
    %spritemapEntry(1, $02, $FB, 0, 1, 2, 0, $D4)
    %spritemapEntry(1, $1F2, $EB, 0, 1, 2, 0, $D2)
    %spritemapEntry(1, $02, $EB, 0, 1, 2, 0, $D0)
    %spritemapEntry(1, $1EE, $FD, 0, 1, 2, 0, $D8)
    %spritemapEntry(1, $1EF, $04, 0, 1, 2, 0, $D8)
    %spritemapEntry(1, $1F1, $09, 0, 1, 2, 0, $DC)
    %spritemapEntry(0, $1FA, $12, 0, 1, 2, 0, $F6)
    %spritemapEntry(0, $1FA, $0A, 0, 1, 2, 0, $F5)

UNUSED_SpriteObjectSpritemaps_28_4_B4D36F:
    dw $0009
    %spritemapEntry(1, $1F2, $FB, 0, 1, 2, 0, $D6)
    %spritemapEntry(1, $02, $FB, 0, 1, 2, 0, $D4)
    %spritemapEntry(1, $1F2, $EB, 0, 1, 2, 0, $D2)
    %spritemapEntry(1, $02, $EB, 0, 1, 2, 0, $D0)
    %spritemapEntry(1, $1EE, $FD, 0, 1, 2, 0, $D8)
    %spritemapEntry(1, $1EF, $04, 0, 1, 2, 0, $D8)
    %spritemapEntry(1, $1F1, $0A, 0, 1, 2, 0, $DC)
    %spritemapEntry(0, $1FA, $11, 0, 1, 2, 0, $F6)
    %spritemapEntry(0, $1FA, $09, 0, 1, 2, 0, $F5)

UNUSED_SpriteObjectSpritemaps_28_5_B4D39E:
    dw $0009
    %spritemapEntry(1, $1F2, $FB, 0, 1, 2, 0, $D6)
    %spritemapEntry(1, $02, $FB, 0, 1, 2, 0, $D4)
    %spritemapEntry(1, $1F2, $EB, 0, 1, 2, 0, $D2)
    %spritemapEntry(1, $02, $EB, 0, 1, 2, 0, $D0)
    %spritemapEntry(1, $1EE, $FC, 0, 1, 2, 0, $D8)
    %spritemapEntry(1, $1EF, $03, 0, 1, 2, 0, $D8)
    %spritemapEntry(1, $1F1, $09, 0, 1, 2, 0, $DC)
    %spritemapEntry(0, $1FA, $10, 0, 1, 2, 0, $F6)
    %spritemapEntry(0, $1FA, $08, 0, 1, 2, 0, $F5)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SpriteObjectSpritemaps_B4D3CD:
    dw $0009
    %spritemapEntry(1, $1F2, $FB, 0, 1, 2, 0, $D6)
    %spritemapEntry(1, $02, $FB, 0, 1, 2, 0, $D4)
    %spritemapEntry(1, $1F2, $EB, 0, 1, 2, 0, $D2)
    %spritemapEntry(1, $02, $EB, 0, 1, 2, 0, $D0)
    %spritemapEntry(1, $1EE, $FB, 0, 1, 2, 0, $D8)
    %spritemapEntry(1, $1EF, $01, 0, 1, 2, 0, $D8)
    %spritemapEntry(1, $1F1, $07, 0, 1, 2, 0, $DC)
    %spritemapEntry(0, $1FA, $10, 0, 1, 2, 0, $F6)
    %spritemapEntry(0, $1FA, $08, 0, 1, 2, 0, $F5)
endif ; !FEATURE_KEEP_UNREFERENCED

UNUSED_SpriteObjectSpritemaps_29_0_B4D3FC:
    dw $0005
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $F3)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $F2)
    %spritemapEntry(0, $1FA, $F4, 0, 1, 2, 0, $F1)
    %spritemapEntry(0, $02, $F4, 0, 1, 2, 0, $F0)
    %spritemapEntry(0, $1F6, $FC, 0, 1, 2, 0, $F4)

UNUSED_SpriteObjectSpritemaps_29_1_B4D417:
    dw $0005
    %spritemapEntry(0, $1FA, $F4, 0, 1, 2, 0, $F3)
    %spritemapEntry(0, $02, $F4, 0, 1, 2, 0, $F2)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $F4)
    %spritemapEntry(0, $1F6, $FC, 0, 1, 2, 0, $F3)
    %spritemapEntry(0, $1FE, $FC, 0, 1, 2, 0, $F2)

UNUSED_SpriteObjectSpritemaps_29_2_B4D432:
    dw $0005
    %spritemapEntry(0, $1FA, $F4, 0, 1, 2, 0, $F4)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $F3)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $F2)
    %spritemapEntry(0, $1F6, $FC, 0, 1, 2, 0, $F1)
    %spritemapEntry(0, $1FE, $FC, 0, 1, 2, 0, $F0)

UNUSED_SpriteObjectSpritemaps_29_3_B4D44D:
    dw $0006
    %spritemapEntry(0, $1FA, $F4, 0, 1, 2, 0, $F3)
    %spritemapEntry(0, $02, $F4, 0, 1, 2, 0, $F2)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $F0)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $F1)
    %spritemapEntry(0, $1F6, $FC, 0, 1, 2, 0, $F3)
    %spritemapEntry(0, $1FE, $FC, 0, 1, 2, 0, $F2)

UNUSED_SpriteObjectSpritemaps_29_4_B4D46D:
    dw $0003
    %spritemapEntry(0, $1F6, $FC, 0, 1, 2, 0, $F4)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $F4)
    %spritemapEntry(0, $1FA, $F4, 0, 1, 2, 0, $F4)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SpriteObjectSpritemaps_B4D47E:
    dw $0006
    %spritemapEntry(0, $1FA, $F4, 0, 1, 2, 0, $F3)
    %spritemapEntry(0, $02, $F4, 0, 1, 2, 0, $F2)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $F3)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $F2)
    %spritemapEntry(0, $1F6, $FC, 0, 1, 2, 0, $F3)
    %spritemapEntry(0, $1FE, $FC, 0, 1, 2, 0, $F2)

UNUSED_SpriteObjectSpritemaps_B4D49E:
    dw $0006
    %spritemapEntry(0, $1FA, $F4, 0, 1, 2, 0, $F1)
    %spritemapEntry(0, $02, $F4, 0, 1, 2, 0, $F0)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $F0)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $F1)
    %spritemapEntry(0, $1F6, $FC, 0, 1, 2, 0, $F1)
    %spritemapEntry(0, $1FE, $FC, 0, 1, 2, 0, $F0)
endif ; !FEATURE_KEEP_UNREFERENCED

SpriteObjectSpritemaps_2B_Puromi_0:
    dw $0001
    %spritemapEntry(1, $1F9, $F8, 0, 0, 2, 1, $10A)

SpriteObjectSpritemaps_2B_Puromi_1:
    dw $0001
    %spritemapEntry(1, $1F9, $F8, 0, 0, 2, 1, $108)

SpriteObjectSpritemaps_2B_Puromi_2:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 1, 1, 2, 1, $10A)

SpriteObjectSpritemaps_2B_Puromi_3:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 1, 1, 2, 1, $108)

SpriteObjectSpritemaps_2B_Puromi_4:
    dw $0001
    %spritemapEntry(1, $1F9, $F8, 0, 0, 2, 1, $106)

SpriteObjectSpritemaps_2B_Puromi_5:
    dw $0001
    %spritemapEntry(1, $1F9, $F8, 0, 0, 2, 1, $122)

SpriteObjectSpritemaps_2B_Puromi_6:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 1, 1, 2, 1, $106)

SpriteObjectSpritemaps_2B_Puromi_7:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 1, 1, 2, 1, $122)

SpriteObjectSpritemaps_2C_PuromiRightExplosion_0:
    dw $0001
    %spritemapEntry(1, $1F9, $F9, 0, 0, 2, 1, $10E)

SpriteObjectSpritemaps_2C_PuromiRightExplosion_1:
    dw $0001
    %spritemapEntry(1, $1FD, $F5, 0, 0, 2, 1, $120)

SpriteObjectSpritemaps_2C_PuromiRightExplosion_2:
    dw $0001
    %spritemapEntry(1, $03, $EE, 0, 0, 2, 1, $104)

SpriteObjectSpritemaps_2C_PuromiRightExplosion_3:
    dw $0001
    %spritemapEntry(1, $05, $EC, 0, 0, 2, 1, $108)

SpriteObjectSpritemaps_2C_PuromiRightExplosion_4:
    dw $0001
    %spritemapEntry(1, $05, $EC, 0, 0, 2, 1, $10C)

SpriteObjectSpritemaps_2C_PuromiRightExplosion_5:
    dw $0001
    %spritemapEntry(1, $05, $EC, 0, 0, 2, 1, $126)

SpriteObjectSpritemaps_2C_PuromiRightExplosion_6:
    dw $0001
    %spritemapEntry(1, $05, $EC, 0, 0, 2, 1, $12E)

SpriteObjectSpritemaps_2D_PuromiLeftExplosion_0:
    dw $0001
    %spritemapEntry(1, $1F8, $F9, 0, 1, 2, 1, $10E)

SpriteObjectSpritemaps_2D_PuromiLeftExplosion_1:
    dw $0001
    %spritemapEntry(1, $1F4, $F5, 0, 1, 2, 1, $120)

SpriteObjectSpritemaps_2D_PuromiLeftExplosion_2:
    dw $0001
    %spritemapEntry(1, $1EE, $EE, 0, 1, 2, 1, $104)

SpriteObjectSpritemaps_2D_PuromiLeftExplosion_3:
    dw $0001
    %spritemapEntry(1, $1EC, $EC, 0, 1, 2, 1, $108)

SpriteObjectSpritemaps_2D_PuromiLeftExplosion_4:
    dw $0001
    %spritemapEntry(1, $1EC, $EC, 0, 1, 2, 1, $10C)

SpriteObjectSpritemaps_2D_PuromiLeftExplosion_5:
    dw $0001
    %spritemapEntry(1, $1EC, $EC, 0, 1, 2, 1, $126)

SpriteObjectSpritemaps_2D_PuromiLeftExplosion_6:
    dw $0001
    %spritemapEntry(1, $1EB, $EC, 0, 0, 2, 1, $12E)

SpriteObjectSpritemaps_2E_PuromiSplash_0:
    dw $0002
    %spritemapEntry(0, $1F1, $F8, 0, 1, 2, 1, $134)
    %spritemapEntry(0, $08, $F8, 0, 0, 2, 1, $134)

SpriteObjectSpritemaps_2E_PuromiSplash_1:
    dw $0002
    %spritemapEntry(0, $1F1, $F8, 0, 1, 2, 1, $124)
    %spritemapEntry(0, $08, $F8, 0, 0, 2, 1, $124)

SpriteObjectSpritemaps_2E_PuromiSplash_2:
    dw $0002
    %spritemapEntry(1, $1E9, $F0, 0, 1, 2, 1, $128)
    %spritemapEntry(1, $08, $F0, 0, 0, 2, 1, $128)

SpriteObjectSpritemaps_2E_PuromiSplash_3:
    dw $0002
    %spritemapEntry(1, $1E9, $F0, 0, 1, 2, 1, $12C)
    %spritemapEntry(1, $08, $F0, 0, 0, 2, 1, $12C)

SpriteObjectSpritemaps_2E_PuromiSplash_4:
    dw $0002
    %spritemapEntry(1, $1E8, $F0, 0, 1, 2, 1, $12A)
    %spritemapEntry(1, $09, $F0, 0, 0, 2, 1, $12A)

UNUSED_SpriteObjectSpritemaps_2F_B4D594:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 1, $140)

SpriteObjectSpritemaps_30_FallingSparkTrail_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $107)

SpriteObjectSpritemaps_30_FallingSparkTrail_1:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $108)

SpriteObjectSpritemaps_30_FallingSparkTrail_2:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $109)

SpriteObjectSpritemaps_30_FallingSparkTrail_3:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $10A)

SpriteObjectSpritemaps_34_35_36_MetroidShell_0:
    dw $000A
    %spritemapEntry(0, $10, $04, 0, 1, 2, 0, $130)
    %spritemapEntry(0, $10, $FC, 0, 1, 2, 0, $120)
    %spritemapEntry(0, $10, $F4, 0, 1, 2, 0, $110)
    %spritemapEntry(0, $1E8, $04, 0, 0, 2, 0, $130)
    %spritemapEntry(0, $1E8, $FC, 0, 0, 2, 0, $120)
    %spritemapEntry(0, $1E8, $F4, 0, 0, 2, 0, $110)
    %spritemapEntry(1, $00, $FC, 0, 1, 2, 0, $121)
    %spritemapEntry(1, $00, $EC, 0, 0, 2, 0, $103)
    %spritemapEntry(1, $1F0, $FC, 0, 0, 2, 0, $121)
    %spritemapEntry(1, $1F0, $EC, 0, 0, 2, 0, $101)

SpriteObjectSpritemaps_34_36_MetroidShell_1:
    dw $000A
    %spritemapEntry(0, $10, $FC, 0, 1, 2, 0, $12A)
    %spritemapEntry(0, $10, $04, 0, 1, 2, 0, $13A)
    %spritemapEntry(0, $10, $F4, 0, 0, 2, 0, $11F)
    %spritemapEntry(0, $1E8, $04, 0, 0, 2, 0, $13A)
    %spritemapEntry(0, $1E8, $FC, 0, 0, 2, 0, $12A)
    %spritemapEntry(0, $1E8, $F4, 0, 0, 2, 0, $11A)
    %spritemapEntry(1, $00, $EC, 0, 0, 2, 0, $10D)
    %spritemapEntry(1, $00, $FC, 0, 1, 2, 0, $12B)
    %spritemapEntry(1, $1F0, $FC, 0, 0, 2, 0, $12B)
    %spritemapEntry(1, $1F0, $EC, 0, 0, 2, 0, $10B)

SpriteObjectSpritemaps_34_35_36_MetroidShell_2:
    dw $000A
    %spritemapEntry(0, $1E8, $FC, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $10, $04, 0, 1, 2, 0, $135)
    %spritemapEntry(0, $10, $FC, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $10, $F4, 0, 1, 2, 0, $115)
    %spritemapEntry(0, $1E8, $04, 0, 0, 2, 0, $135)
    %spritemapEntry(0, $1E8, $F4, 0, 0, 2, 0, $115)
    %spritemapEntry(1, $00, $FC, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $00, $EC, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1F0, $FC, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1F0, $EC, 0, 0, 2, 0, $106)

UNUSED_SpriteObjectSpritemaps_31_MetroidInsides_0_B4D653:
    dw $0008
    %spritemapEntry(0, $10, $00, 0, 1, 2, 0, $160)
    %spritemapEntry(0, $10, $F8, 0, 1, 2, 0, $150)
    %spritemapEntry(0, $1E8, $00, 0, 0, 2, 0, $160)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 2, 0, $150)
    %spritemapEntry(1, $00, $00, 0, 1, 2, 0, $161)
    %spritemapEntry(1, $00, $F0, 0, 1, 2, 0, $141)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $161)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $141)

UNUSED_SpriteObjectSpritemaps_31_MetroidInsides_1_B4D67D:
    dw $0006
    %spritemapEntry(0, $10, $00, 0, 1, 2, 0, $163)
    %spritemapEntry(0, $1E8, $00, 0, 0, 2, 0, $163)
    %spritemapEntry(1, $00, $00, 0, 1, 2, 0, $164)
    %spritemapEntry(1, $00, $F0, 0, 1, 2, 0, $144)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $164)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $144)

UNUSED_SpriteObjectSpritemaps_31_MetroidInsides_2_B4D69D:
    dw $0008
    %spritemapEntry(0, $10, $00, 0, 1, 2, 0, $166)
    %spritemapEntry(0, $10, $F8, 0, 1, 2, 0, $156)
    %spritemapEntry(0, $1E8, $00, 0, 0, 2, 0, $166)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 2, 0, $156)
    %spritemapEntry(1, $00, $00, 0, 1, 2, 0, $167)
    %spritemapEntry(1, $00, $F0, 0, 1, 2, 0, $147)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $167)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $147)

UNUSED_SpriteObjectSpritemaps_31_MetroidInsides_3_B4D6C7:
    dw $0008
    %spritemapEntry(0, $10, $00, 0, 1, 2, 0, $169)
    %spritemapEntry(0, $10, $F8, 0, 1, 2, 0, $159)
    %spritemapEntry(0, $1E8, $00, 0, 0, 2, 0, $169)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 2, 0, $159)
    %spritemapEntry(1, $00, $00, 0, 1, 2, 0, $16A)
    %spritemapEntry(1, $00, $F0, 0, 1, 2, 0, $14A)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $16A)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $14A)

SpriteObjectSpritemaps_32_33_MetroidElectricity_0:
    dw $0003
    %spritemapEntry(0, $00, $EC, 0, 0, 2, 0, $17C)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $14C)

SpriteObjectSpritemaps_32_33_MetroidElectricity_1:
    dw $0003
    %spritemapEntry(0, $00, $EC, 0, 0, 2, 0, $17D)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $15D)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $15C)

SpriteObjectSpritemaps_32_33_MetroidElectricity_2:
    dw $0003
    %spritemapEntry(0, $00, $EC, 0, 0, 2, 0, $17E)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $16D)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $16C)

SpriteObjectSpritemaps_32_33_MetroidElectricity_3:
    dw $0004
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $14F)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $14E)
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1F8, $EC, 0, 0, 2, 0, $12D)

SpriteObjectSpritemaps_32_33_MetroidElectricity_4:
    dw $0004
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $15F)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $15E)
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 0, $13E)
    %spritemapEntry(0, $1F8, $EC, 0, 0, 2, 0, $12E)

SpriteObjectSpritemaps_32_33_MetroidElectricity_5:
    dw $0004
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $16F)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $16E)
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 0, $13F)
    %spritemapEntry(0, $1F8, $EC, 0, 0, 2, 0, $12F)

SpriteObjectSpritemaps_32_33_MetroidElectricity_6:
    dw $0003
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $14C)
    %spritemapEntry(0, $1F8, $EC, 0, 1, 2, 0, $17C)

SpriteObjectSpritemaps_32_33_MetroidElectricity_7:
    dw $0003
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $15D)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $15C)
    %spritemapEntry(0, $1F8, $EC, 0, 1, 2, 0, $17D)

SpriteObjectSpritemaps_32_33_MetroidElectricity_8:
    dw $0003
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $16D)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $16C)
    %spritemapEntry(0, $1F8, $EC, 0, 1, 2, 0, $17E)

SpriteObjectSpritemaps_32_33_MetroidElectricity_9:
    dw $0004
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $14F)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $14E)
    %spritemapEntry(0, $00, $F4, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $00, $EC, 0, 1, 2, 0, $12D)

SpriteObjectSpritemaps_32_33_MetroidElectricity_A:
    dw $0004
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $16F)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $16E)
    %spritemapEntry(0, $00, $F4, 0, 1, 2, 0, $13E)
    %spritemapEntry(0, $00, $EC, 0, 1, 2, 0, $12E)

SpriteObjectSpritemaps_32_33_MetroidElectricity_B:
    dw $0004
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $15F)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $15E)
    %spritemapEntry(0, $00, $F4, 0, 1, 2, 0, $13F)
    %spritemapEntry(0, $00, $EC, 0, 1, 2, 0, $12F)

SpriteObjectSpritemaps_32_MetroidElectricity_C:
    dw $0002
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $14C)

SpriteObjectSpritemaps_32_MetroidElectricity_D:
    dw $0001
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $15C)

SpriteObjectSpritemaps_32_MetroidElectricity_E:
    dw $0002
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $16D)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $16C)

SpriteObjectSpritemaps_32_33_MetroidElectricity_F:
    dw $0002
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1F8, $EC, 0, 0, 2, 0, $12D)

SpriteObjectSpritemaps_32_33_MetroidElectricity_10:
    dw $0002
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 0, $13E)
    %spritemapEntry(0, $1F8, $EC, 0, 0, 2, 0, $12E)

SpriteObjectSpritemaps_32_33_MetroidElectricity_11:
    dw $0002
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 0, $13F)
    %spritemapEntry(0, $1F8, $EC, 0, 0, 2, 0, $12F)

SpriteObjectSpritemaps_32_MetroidElectricity_12:
    dw $0002
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $14C)

SpriteObjectSpritemaps_32_MetroidElectricity_13:
    dw $0002
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $15D)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $15C)

SpriteObjectSpritemaps_32_MetroidElectricity_14:
    dw $0002
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $16D)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $16C)

SpriteObjectSpritemaps_32_33_MetroidElectricity_15:
    dw $0001
    %spritemapEntry(0, $00, $EC, 0, 0, 2, 0, $17C)

SpriteObjectSpritemaps_32_33_MetroidElectricity_16:
    dw $0001
    %spritemapEntry(0, $00, $EC, 0, 0, 2, 0, $17D)

SpriteObjectSpritemaps_32_33_MetroidElectricity_17:
    dw $0001
    %spritemapEntry(0, $00, $EC, 0, 0, 2, 0, $17E)

SpriteObjectSpritemaps_37_EnemyShot_0:
    dw $0004
    %spritemapEntry(0, $02, $02, 1, 1, 2, 6, $BC)
    %spritemapEntry(0, $1F6, $02, 1, 0, 2, 6, $BC)
    %spritemapEntry(0, $02, $F6, 0, 1, 2, 6, $BC)
    %spritemapEntry(0, $1F6, $F6, 0, 0, 2, 6, $BC)

SpriteObjectSpritemaps_37_EnemyShot_1:
    dw $0004
    %spritemapEntry(0, $04, $04, 1, 1, 2, 6, $BD)
    %spritemapEntry(0, $1F4, $04, 1, 0, 2, 6, $BD)
    %spritemapEntry(0, $04, $F4, 0, 1, 2, 6, $BD)
    %spritemapEntry(0, $1F4, $F4, 0, 0, 2, 6, $BD)

SpriteObjectSpritemaps_37_EnemyShot_2:
    dw $0004
    %spritemapEntry(0, $07, $07, 1, 1, 2, 6, $CB)
    %spritemapEntry(0, $07, $F1, 0, 1, 2, 6, $CB)
    %spritemapEntry(0, $1F1, $07, 1, 0, 2, 6, $CB)
    %spritemapEntry(0, $1F1, $F1, 0, 0, 2, 6, $CB)

SpriteObjectSpritemaps_37_EnemyShot_3:
    dw $0004
    %spritemapEntry(0, $0B, $0B, 1, 1, 2, 6, $CC)
    %spritemapEntry(0, $1ED, $0B, 1, 0, 2, 6, $CC)
    %spritemapEntry(0, $0B, $ED, 0, 1, 2, 6, $CC)
    %spritemapEntry(0, $1ED, $ED, 0, 0, 2, 6, $CC)

SpriteObjectSpritemaps_38_YappingMawBaseFacingDown:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10A)

SpriteObjectSpritemaps_39_YappingMawBaseFacingUp:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 1, 0, 2, 0, $10A)

UNUSED_SpriteObjectSpritemaps_3A_0_B4D8BD:
    dw $000E
    %spritemapEntry(0, $1FB, $00, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $1F3, $00, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $1FD, $04, 0, 0, 2, 0, $F4)
    %spritemapEntry(0, $1F9, $FD, 0, 0, 2, 0, $F1)
    %spritemapEntry(0, $1F1, $FD, 0, 0, 2, 0, $F0)
    %spritemapEntry(1, $1FE, $FB, 0, 0, 2, 0, $D6)
    %spritemapEntry(1, $1EE, $FB, 0, 0, 2, 0, $D4)
    %spritemapEntry(1, $1FE, $EB, 0, 0, 2, 0, $D2)
    %spritemapEntry(1, $1EE, $EB, 0, 0, 2, 0, $D0)
    %spritemapEntry(1, $02, $FB, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $01, $01, 0, 0, 2, 0, $DA)
    %spritemapEntry(1, $1FF, $07, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $1FE, $10, 0, 0, 2, 0, $F6)
    %spritemapEntry(0, $1FE, $08, 0, 0, 2, 0, $F5)

UNUSED_SpriteObjectSpritemaps_3A_1_B4D905:
    dw $0010
    %spritemapEntry(0, $1F9, $FC, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $1F1, $FC, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $1FB, $00, 0, 0, 2, 0, $F4)
    %spritemapEntry(0, $1FD, $04, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $1F5, $04, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $1EE, $FB, 0, 0, 2, 0, $F9)
    %spritemapEntry(0, $1F6, $F3, 0, 0, 2, 0, $FC)
    %spritemapEntry(1, $1FE, $FB, 0, 0, 2, 0, $D6)
    %spritemapEntry(1, $1EE, $FB, 0, 0, 2, 0, $D4)
    %spritemapEntry(1, $1FE, $EB, 0, 0, 2, 0, $D2)
    %spritemapEntry(1, $1EE, $EB, 0, 0, 2, 0, $D0)
    %spritemapEntry(1, $02, $FC, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $01, $02, 0, 0, 2, 0, $DA)
    %spritemapEntry(1, $1FF, $07, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $1FE, $11, 0, 0, 2, 0, $F6)
    %spritemapEntry(0, $1FE, $09, 0, 0, 2, 0, $F5)

UNUSED_SpriteObjectSpritemaps_3A_2_B4D957:
    dw $0010
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 0, $F1)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $1F4, $04, 0, 0, 2, 0, $F0)
    %spritemapEntry(0, $1F4, $00, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $F4)
    %spritemapEntry(0, $1EE, $FB, 0, 0, 2, 0, $FA)
    %spritemapEntry(0, $1F6, $F3, 0, 0, 2, 0, $FB)
    %spritemapEntry(1, $1FE, $FB, 0, 0, 2, 0, $D6)
    %spritemapEntry(1, $1EE, $FB, 0, 0, 2, 0, $D4)
    %spritemapEntry(1, $1FE, $EB, 0, 0, 2, 0, $D2)
    %spritemapEntry(1, $1EE, $EB, 0, 0, 2, 0, $D0)
    %spritemapEntry(1, $02, $FD, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $01, $03, 0, 0, 2, 0, $DA)
    %spritemapEntry(1, $1FF, $08, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $1FE, $12, 0, 0, 2, 0, $F6)
    %spritemapEntry(0, $1FE, $0A, 0, 0, 2, 0, $F5)

UNUSED_SpriteObjectSpritemaps_3A_3_B4D9A9:
    dw $0010
    %spritemapEntry(0, $1FE, $04, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $1F6, $04, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $1F4, $01, 0, 0, 2, 0, $F0)
    %spritemapEntry(0, $1FC, $01, 0, 0, 2, 0, $F1)
    %spritemapEntry(0, $1FB, $FC, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $1F3, $FC, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $1EE, $FB, 0, 0, 2, 0, $F9)
    %spritemapEntry(1, $1FE, $FB, 0, 0, 2, 0, $D6)
    %spritemapEntry(1, $1EE, $FB, 0, 0, 2, 0, $D4)
    %spritemapEntry(1, $1FE, $EB, 0, 0, 2, 0, $D2)
    %spritemapEntry(1, $1EE, $EB, 0, 0, 2, 0, $D0)
    %spritemapEntry(1, $02, $FD, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $01, $04, 0, 0, 2, 0, $DA)
    %spritemapEntry(1, $1FF, $09, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $1FE, $12, 0, 0, 2, 0, $F6)
    %spritemapEntry(0, $1FE, $0A, 0, 0, 2, 0, $F5)

UNUSED_SpriteObjectSpritemaps_3A_4_B4D9FB:
    dw $000F
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $1F4, $00, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $1FE, $04, 0, 0, 2, 0, $F4)
    %spritemapEntry(0, $1FA, $FD, 0, 0, 2, 0, $F1)
    %spritemapEntry(0, $1F2, $FD, 0, 0, 2, 0, $F0)
    %spritemapEntry(0, $1EE, $FB, 0, 0, 2, 0, $F9)
    %spritemapEntry(1, $1FE, $FB, 0, 0, 2, 0, $D6)
    %spritemapEntry(1, $1EE, $FB, 0, 0, 2, 0, $D4)
    %spritemapEntry(1, $1FE, $EB, 0, 0, 2, 0, $D2)
    %spritemapEntry(1, $1EE, $EB, 0, 0, 2, 0, $D0)
    %spritemapEntry(1, $02, $FD, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $01, $04, 0, 0, 2, 0, $DA)
    %spritemapEntry(1, $1FF, $0A, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $1FE, $12, 0, 0, 2, 0, $F6)
    %spritemapEntry(0, $1FE, $0A, 0, 0, 2, 0, $F5)

UNUSED_SpriteObjectSpritemaps_3A_5_B4DA48:
    dw $000E
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 0, $F4)
    %spritemapEntry(0, $1FE, $04, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $1FA, $FB, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $1F2, $FB, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $1F6, $04, 0, 0, 2, 0, $F2)
    %spritemapEntry(1, $1FE, $FB, 0, 0, 2, 0, $D6)
    %spritemapEntry(1, $1EE, $FB, 0, 0, 2, 0, $D4)
    %spritemapEntry(1, $1FE, $EB, 0, 0, 2, 0, $D2)
    %spritemapEntry(1, $1EE, $EB, 0, 0, 2, 0, $D0)
    %spritemapEntry(1, $02, $FC, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $01, $03, 0, 0, 2, 0, $DA)
    %spritemapEntry(1, $1FF, $0A, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $1FE, $11, 0, 0, 2, 0, $F6)
    %spritemapEntry(0, $1FE, $09, 0, 0, 2, 0, $F5)

UNUSED_SpriteObjectSpritemaps_3A_6_B4DA90:
    dw $000E
    %spritemapEntry(0, $1FE, $04, 0, 0, 2, 0, $F1)
    %spritemapEntry(0, $1F6, $04, 0, 0, 2, 0, $F0)
    %spritemapEntry(0, $1FA, $FC, 0, 0, 2, 0, $F4)
    %spritemapEntry(0, $1F4, $00, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 0, $F3)
    %spritemapEntry(1, $1FE, $FB, 0, 0, 2, 0, $D6)
    %spritemapEntry(1, $1EE, $FB, 0, 0, 2, 0, $D4)
    %spritemapEntry(1, $1FE, $EB, 0, 0, 2, 0, $D2)
    %spritemapEntry(1, $1EE, $EB, 0, 0, 2, 0, $D0)
    %spritemapEntry(1, $02, $FB, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $01, $01, 0, 0, 2, 0, $DA)
    %spritemapEntry(1, $1FF, $08, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $1FE, $10, 0, 0, 2, 0, $F6)
    %spritemapEntry(0, $1FE, $08, 0, 0, 2, 0, $F5)

UNUSED_SpriteObjectSpritemaps_3A_7_B4DAD8:
    dw $000F
    %spritemapEntry(0, $1FE, $04, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $1F6, $04, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $1FC, $01, 0, 0, 2, 0, $F1)
    %spritemapEntry(0, $1F4, $01, 0, 0, 2, 0, $F0)
    %spritemapEntry(0, $1FA, $FC, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $1F2, $FC, 0, 0, 2, 0, $F2)
    %spritemapEntry(1, $1FE, $FB, 0, 0, 2, 0, $D6)
    %spritemapEntry(1, $1EE, $FB, 0, 0, 2, 0, $D4)
    %spritemapEntry(1, $1FE, $EB, 0, 0, 2, 0, $D2)
    %spritemapEntry(1, $1EE, $EB, 0, 0, 2, 0, $D0)
    %spritemapEntry(1, $02, $FB, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $01, $01, 0, 0, 2, 0, $DA)
    %spritemapEntry(1, $1FF, $07, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $1FE, $0F, 0, 0, 2, 0, $F6)
    %spritemapEntry(0, $1FE, $07, 0, 0, 2, 0, $F5)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SpriteObjectSpritemaps_B4FB25:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 0, 2, 0, $F8)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 0, $F7)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $F8)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $F7)

UNUSED_SpriteObjectSpritemaps_B4FB3B:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $DE)
endif ; !FEATURE_KEEP_UNREFERENCED

SpriteObjectSpritemaps_3B_EvirFacingLeft_0:
    dw $000C
    %spritemapEntry(0, $00, $02, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $1F8, $02, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $F1)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 0, $F0)
    %spritemapEntry(1, $00, $FC, 0, 0, 2, 0, $D6)
    %spritemapEntry(1, $1F0, $FC, 0, 0, 2, 0, $D4)
    %spritemapEntry(1, $00, $EC, 0, 0, 2, 0, $D2)
    %spritemapEntry(1, $1F0, $EC, 0, 0, 2, 0, $D0)
    %spritemapEntry(1, $04, $FB, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $02, $02, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $00, $0F, 0, 0, 2, 0, $F6)
    %spritemapEntry(0, $00, $07, 0, 0, 2, 0, $F5)

SpriteObjectSpritemaps_3B_EvirFacingLeft_1:
    dw $000C
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 0, $FC)
    %spritemapEntry(0, $00, $02, 0, 0, 2, 0, $F4)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 0, $F2)
    %spritemapEntry(1, $00, $FC, 0, 0, 2, 0, $D6)
    %spritemapEntry(1, $1F0, $FC, 0, 0, 2, 0, $D4)
    %spritemapEntry(1, $00, $EC, 0, 0, 2, 0, $D2)
    %spritemapEntry(1, $1F0, $EC, 0, 0, 2, 0, $D0)
    %spritemapEntry(1, $04, $FC, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $02, $03, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $00, $0E, 0, 0, 2, 0, $F6)
    %spritemapEntry(0, $00, $06, 0, 0, 2, 0, $F5)

SpriteObjectSpritemaps_3B_EvirFacingLeft_2:
    dw $000C
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 0, $FB)
    %spritemapEntry(0, $00, $02, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $1F8, $02, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $1FA, $FC, 0, 0, 2, 0, $F4)
    %spritemapEntry(1, $00, $FC, 0, 0, 2, 0, $D6)
    %spritemapEntry(1, $1F0, $FC, 0, 0, 2, 0, $D4)
    %spritemapEntry(1, $00, $EC, 0, 0, 2, 0, $D2)
    %spritemapEntry(1, $1F0, $EC, 0, 0, 2, 0, $D0)
    %spritemapEntry(1, $04, $FD, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $02, $03, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $00, $0D, 0, 0, 2, 0, $F6)
    %spritemapEntry(0, $00, $05, 0, 0, 2, 0, $F5)

SpriteObjectSpritemaps_3B_EvirFacingLeft_3:
    dw $000D
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $F9)
    %spritemapEntry(0, $00, $02, 0, 0, 2, 0, $F1)
    %spritemapEntry(0, $1F8, $02, 0, 0, 2, 0, $F0)
    %spritemapEntry(1, $00, $FC, 0, 0, 2, 0, $D6)
    %spritemapEntry(1, $1F0, $FC, 0, 0, 2, 0, $D4)
    %spritemapEntry(1, $00, $EC, 0, 0, 2, 0, $D2)
    %spritemapEntry(1, $1F0, $EC, 0, 0, 2, 0, $D0)
    %spritemapEntry(1, $04, $FD, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $02, $04, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $00, $0E, 0, 0, 2, 0, $F6)
    %spritemapEntry(0, $00, $06, 0, 0, 2, 0, $F5)

SpriteObjectSpritemaps_3C_EvirFacingRight_0:
    dw $000C
    %spritemapEntry(0, $1F8, $02, 0, 1, 2, 0, $F3)
    %spritemapEntry(0, $00, $02, 0, 1, 2, 0, $F2)
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 0, $F1)
    %spritemapEntry(0, $04, $FC, 0, 1, 2, 0, $F0)
    %spritemapEntry(1, $1F0, $FC, 0, 1, 2, 0, $D6)
    %spritemapEntry(1, $00, $FC, 0, 1, 2, 0, $D4)
    %spritemapEntry(1, $1F0, $EC, 0, 1, 2, 0, $D2)
    %spritemapEntry(1, $00, $EC, 0, 1, 2, 0, $D0)
    %spritemapEntry(1, $1EC, $FB, 0, 1, 2, 0, $D8)
    %spritemapEntry(1, $1EE, $02, 0, 1, 2, 0, $DC)
    %spritemapEntry(0, $1F8, $0F, 0, 1, 2, 0, $F6)
    %spritemapEntry(0, $1F8, $07, 0, 1, 2, 0, $F5)

SpriteObjectSpritemaps_3C_EvirFacingRight_1:
    dw $000C
    %spritemapEntry(0, $00, $F4, 0, 1, 2, 0, $FC)
    %spritemapEntry(0, $1F8, $02, 0, 1, 2, 0, $F4)
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 0, $F3)
    %spritemapEntry(0, $04, $FC, 0, 1, 2, 0, $F2)
    %spritemapEntry(1, $1F0, $FC, 0, 1, 2, 0, $D6)
    %spritemapEntry(1, $00, $FC, 0, 1, 2, 0, $D4)
    %spritemapEntry(1, $1F0, $EC, 0, 1, 2, 0, $D2)
    %spritemapEntry(1, $00, $EC, 0, 1, 2, 0, $D0)
    %spritemapEntry(1, $1EC, $FC, 0, 1, 2, 0, $D8)
    %spritemapEntry(1, $1EE, $03, 0, 1, 2, 0, $DC)
    %spritemapEntry(0, $1F8, $0E, 0, 1, 2, 0, $F6)
    %spritemapEntry(0, $1F8, $06, 0, 1, 2, 0, $F5)

SpriteObjectSpritemaps_3C_EvirFacingRight_2:
    dw $000C
    %spritemapEntry(0, $00, $F4, 0, 1, 2, 0, $FB)
    %spritemapEntry(0, $1F8, $02, 0, 1, 2, 0, $F3)
    %spritemapEntry(0, $00, $02, 0, 1, 2, 0, $F2)
    %spritemapEntry(0, $1FE, $FC, 0, 1, 2, 0, $F4)
    %spritemapEntry(1, $1F0, $FC, 0, 1, 2, 0, $D6)
    %spritemapEntry(1, $00, $FC, 0, 1, 2, 0, $D4)
    %spritemapEntry(1, $1F0, $EC, 0, 1, 2, 0, $D2)
    %spritemapEntry(1, $00, $EC, 0, 1, 2, 0, $D0)
    %spritemapEntry(1, $1EC, $FD, 0, 1, 2, 0, $D8)
    %spritemapEntry(1, $1EE, $03, 0, 1, 2, 0, $DC)
    %spritemapEntry(0, $1F8, $0D, 0, 1, 2, 0, $F6)
    %spritemapEntry(0, $1F8, $05, 0, 1, 2, 0, $F5)

SpriteObjectSpritemaps_3C_EvirFacingRight_3:
    dw $000D
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 0, $F3)
    %spritemapEntry(0, $04, $FC, 0, 1, 2, 0, $F2)
    %spritemapEntry(0, $08, $FC, 0, 1, 2, 0, $F9)
    %spritemapEntry(0, $1F8, $02, 0, 1, 2, 0, $F1)
    %spritemapEntry(0, $00, $02, 0, 1, 2, 0, $F0)
    %spritemapEntry(1, $1F0, $FC, 0, 1, 2, 0, $D6)
    %spritemapEntry(1, $00, $FC, 0, 1, 2, 0, $D4)
    %spritemapEntry(1, $1F0, $EC, 0, 1, 2, 0, $D2)
    %spritemapEntry(1, $00, $EC, 0, 1, 2, 0, $D0)
    %spritemapEntry(1, $1EC, $FD, 0, 1, 2, 0, $D8)
    %spritemapEntry(1, $1EE, $04, 0, 1, 2, 0, $DC)
    %spritemapEntry(0, $1F8, $0E, 0, 1, 2, 0, $F6)
    %spritemapEntry(0, $1F8, $06, 0, 1, 2, 0, $F5)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SpriteObjectSpritemaps_B4DD3C:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 5, $1CA)

UNUSED_SpriteObjectSpritemaps_B4DD43:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 5, $1CC)

UNUSED_SpriteObjectSpritemaps_B4DD4A:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 5, $1CE)
endif ; !FEATURE_KEEP_UNREFERENCED

SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_0:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 2, $1E0)

SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_1:
    dw $0001
    %spritemapEntry(1, $1F8, $F4, 0, 0, 3, 2, $1E2)

SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_2:
    dw $0001
    %spritemapEntry(1, $1F8, $F0, 0, 0, 3, 2, $1E4)

SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_3:
    dw $0001
    %spritemapEntry(1, $1F8, $EC, 0, 0, 3, 2, $1E6)

SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_4:
    dw $0001
    %spritemapEntry(1, $1F8, $E8, 0, 0, 3, 2, $1E8)

SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_5:
    dw $0001
    %spritemapEntry(1, $1F8, $E4, 0, 0, 3, 2, $1EA)

SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_6:
    dw $0001
    %spritemapEntry(1, $1F8, $E0, 0, 0, 3, 2, $1EC)

SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_7:
    dw $0001
    %spritemapEntry(1, $1F8, $DC, 0, 0, 3, 2, $1EE)


;;; $DD89: Enemy names ;;;
; Enemy name in ASCII
; Enemy population pointer (for debug enemy spawner)
; Enemy name debug spritemap index (add 30h to index Debug_Spritemap_Addresses)
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

EnemyName_DessgeegaLarge:
    db "DESSGEEGA "
    dw DebugEnemyPopulationData_DessgeegaLarge
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
    db "NAMI      " ; debug spritemap name is "NAMIHEI"
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

EnemyName_Dessgeega:
    db "SDEATH    "
    dw DebugEnemyPopulationData_Dessgeega
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


;;; $E2F3: Debug enemy population data ;;;
;  ____________________________________ Enemy ID
; |     _______________________________ X position
; |    |     __________________________ Y position
; |    |    |     _____________________ Initialisation parameter
; |    |    |    |     ________________ Properties
; |    |    |    |    |     ___________ Extra properties
; |    |    |    |    |    |     ______ Parameter 1
; |    |    |    |    |    |    |     _ Parameter 2
; |    |    |    |    |    |    |    |
; iiii xxxx yyyy oooo pppp gggg aaaa bbbb

;  ______ Terminator
; |     _ Number of enemy deaths needed to clear current room
; |    |
; FFFF nn
DebugEnemyPopulationData_NoName:
    dw $FFFF : db $00

DebugEnemyPopulationData_Atomic:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Atomic),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2000),
    %extraProperties($0000),
    %speedParams(1, 1))
    dw $FFFF : db $01

DebugEnemyPopulationData_Bang:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Bang),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2800),
    %extraProperties($0000),
    %speedParams(BangAI_Electricity, 0))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Bang),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2800),
    %extraProperties($0000),
    %speedParams(BangAI_Core, $0101))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Bang),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2800),
    %extraProperties($0000),
    %speedParams(BangAI_Shell, 0))
    dw $FFFF : db $01

DebugEnemyPopulationData_PirateGreyWall:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGreyWall),
    %XPosition($002D),
    %YPosition($01B8),
    %initParam(0),
    %properties($2000),
    %extraProperties($0004),
    %speedParams(0, $00A0))
    dw $FFFF : db $01

DebugEnemyPopulationData_PirateGreyNinja:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGreyNinja),
    %XPosition($0270),
    %YPosition($00A0),
    %initParam(0),
    %properties($2800),
    %extraProperties($0004),
    %speedParams(1, $0030))
    dw $FFFF : db $01

DebugEnemyPopulationData_PirateGreyWalking:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGreyWalking),
    %XPosition($00D9),
    %YPosition($00A0),
    %initParam(0),
    %properties($2000),
    %extraProperties($0004),
    %speedParams(0, $0050))
    dw $FFFF : db $01

DebugEnemyPopulationData_Botwoon:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Botwoon),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $01

DebugEnemyPopulationData_Boyon:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Boyon),
    %XPosition($00E8),
    %YPosition($00A8),
    %initParam(0),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0103, $0020))
    dw $FFFF : db $00

DebugEnemyPopulationData_DessgeegaLarge:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_DessgeegaLarge),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($8000, $0000))
    dw $FFFF : db $01

DebugEnemyPopulationData_Shaktool:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Shaktool),
    %XPosition($0110),
    %YPosition($035C),
    %initParam(0),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($8000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Shaktool),
    %XPosition($0110),
    %YPosition($035C),
    %initParam(0),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($8000, $0002))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Shaktool),
    %XPosition($0110),
    %YPosition($035C),
    %initParam(0),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($8000, $0004))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Shaktool),
    %XPosition($0110),
    %YPosition($035C),
    %initParam(0),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($8000, $0006))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Shaktool),
    %XPosition($0110),
    %YPosition($035C),
    %initParam(0),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($8000, $0008))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Shaktool),
    %XPosition($0110),
    %YPosition($035C),
    %initParam(0),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($8000, $000A))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Shaktool),
    %XPosition($0110),
    %YPosition($035C),
    %initParam(0),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($8000, $000C))
    dw $FFFF : db $01

DebugEnemyPopulationData_Dragon:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dragon),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dragon),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(2),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($0001, $0000))
    dw $FFFF : db $01

DebugEnemyPopulationData_Evir:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Evir),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $1010))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Evir),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_EvirProjectile),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0002, $0000))
    dw $FFFF : db $01

DebugEnemyPopulationData_Eye:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Eye),
    %XPosition($0228),
    %YPosition($0048),
    %initParam(0),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0000, $8001))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Eye),
    %XPosition($0228),
    %YPosition($0048),
    %initParam(0),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $00

DebugEnemyPopulationData_Namihe:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Namihe),
    %XPosition($00F0),
    %YPosition($04E0),
    %initParam(0),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0111, $0F05))
    dw $FFFF : db $01

DebugEnemyPopulationData_Skultera:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Skultera),
    %XPosition($0090),
    %YPosition($00A0),
    %initParam(0),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0102, $0420))
    dw $FFFF : db $01

DebugEnemyPopulationData_Coven:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Coven),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($6800),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $01

DebugEnemyPopulationData_Gamet:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Gamet),
    %XPosition($0100),
    %YPosition($00E0),
    %initParam(0),
    %properties($6800),
    %extraProperties($0000),
    %speedParams($0000, $4030))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Gamet),
    %XPosition($0100),
    %YPosition($00E0),
    %initParam(0),
    %properties($6800),
    %extraProperties($0000),
    %speedParams($0000, $4000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Gamet),
    %XPosition($0100),
    %YPosition($00E0),
    %initParam(0),
    %properties($6800),
    %extraProperties($0000),
    %speedParams($0000, $4000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Gamet),
    %XPosition($0100),
    %YPosition($00E0),
    %initParam(0),
    %properties($6800),
    %extraProperties($0000),
    %speedParams($0000, $4000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Gamet),
    %XPosition($0100),
    %YPosition($00E0),
    %initParam(0),
    %properties($6800),
    %extraProperties($0000),
    %speedParams($0000, $4000))
    dw $FFFF : db $01

DebugEnemyPopulationData_Geega:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Geega),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($6100),
    %extraProperties($0000),
    %speedParams($0001, $0010))
    dw $FFFF : db $01

DebugEnemyPopulationData_Geruta:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Geruta),
    %XPosition($0048),
    %YPosition($0080),
    %initParam(0),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Geruta),
    %XPosition($0048),
    %YPosition($0080),
    %initParam(5),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($8000, $0000))
    dw $FFFF : db $01

UNUSED_DebugEnemyPopulationData_GRAVY_B4E55C:
    dw $FFFF : db $00

DebugEnemyPopulationData_KihunterGreen:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KihunterGreen),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KihunterGreenWings),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0020, $0000))
    dw $FFFF : db $01

DebugEnemyPopulationData_YappingMaw:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_YappingMaw),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0010, $0001))
    dw $FFFF : db $00

DebugEnemyPopulationData_Hibashi:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Hibashi),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2500),
    %extraProperties($0000),
    %speedParams($0025, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Hibashi),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2100),
    %extraProperties($0000),
    %speedParams($0000, $0001))
    dw $FFFF : db $00

DebugEnemyPopulationData_Choot:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Choot),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0204, $0030))
    dw $FFFF : db $01

DebugEnemyPopulationData_Holtz:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Holtz),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Holtz),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(6),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($8000, $0000))
    dw $FFFF : db $01

DebugEnemyPopulationData_Fireflea:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Fireflea),
    %XPosition($0600),
    %YPosition($0060),
    %initParam(0),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0108))
    dw $FFFF : db $01

DebugEnemyPopulationData_HZoomer:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_HZoomer),
    %XPosition($0360),
    %YPosition($0098),
    %initParam(3),
    %properties($2001),
    %extraProperties($0000),
    %speedParams($0002, $0000))
    dw $FFFF : db $01

DebugEnemyPopulationData_Kago:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Kago),
    %XPosition($0168),
    %YPosition($0090),
    %initParam(0),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0020, $0000))
    dw $FFFF : db $01

DebugEnemyPopulationData_MamaTurtle:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_MamaTurtle),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_BabyTurtle),
    %XPosition($00D8),
    %YPosition($0100),
    %initParam(0),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($FFFF, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_BabyTurtle),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($FFFF, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_BabyTurtle),
    %XPosition($0110),
    %YPosition($0100),
    %initParam(0),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_BabyTurtle),
    %XPosition($0140),
    %YPosition($0100),
    %initParam(0),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0001, $0000))
    dw $FFFF : db $01

DebugEnemyPopulationData_Tripper_Kamer2:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Tripper),
    %XPosition($0868),
    %YPosition($00C8),
    %initParam(0),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $2020))
    dw $FFFF : db $01

DebugEnemyPopulationData_Sciser:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sciser),
    %XPosition($01C0),
    %YPosition($0098),
    %initParam(3),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0000))
    dw $FFFF : db $01

DebugEnemyPopulationData_FaceBlock:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_FaceBlock),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0025, $0000))
    dw $FFFF : db $00

DebugEnemyPopulationData_KzanTop:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KzanTop),
    %XPosition($0480),
    %YPosition($0400),
    %initParam(0),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0030, $A070))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KzanBottom),
    %XPosition($0480),
    %YPosition($0408),
    %initParam(0),
    %properties($0100),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $00

DebugEnemyPopulationData_Magdollite:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Magdollite),
    %XPosition($0248),
    %YPosition($00B0),
    %initParam(0),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $3A60))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Magdollite),
    %XPosition($0248),
    %YPosition($00B0),
    %initParam(0),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Magdollite),
    %XPosition($0248),
    %YPosition($00B0),
    %initParam(0),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0002, $0000))
    dw $FFFF : db $01

DebugEnemyPopulationData_Mella:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Mella),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $00

DebugEnemyPopulationData_Menu:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Menu),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $00

DebugEnemyPopulationData_Mellow:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Mellow),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $00

DebugEnemyPopulationData_Metaree:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Metaree),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $01

DebugEnemyPopulationData_Mochtroid:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Mochtroid),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $01

DebugEnemyPopulationData_Metroid:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Metroid),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0005))
    dw $FFFF : db $01

DebugEnemyPopulationData_Multiviola:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Multiviola),
    %XPosition($0078),
    %YPosition($0058),
    %initParam(0),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0060, $0001))
    dw $FFFF : db $00

DebugEnemyPopulationData_MZoomer:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_MZoomer),
    %XPosition($0188),
    %YPosition($0198),
    %initParam(3),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0001, $0000))
    dw $FFFF : db $01

DebugEnemyPopulationData_Alcoon:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Alcoon),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $01

DebugEnemyPopulationData_Beetom:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Beetom),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $01

DebugEnemyPopulationData_Sova:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sova),
    %XPosition($0880),
    %YPosition($02A8),
    %initParam(3),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0004))
    dw $FFFF : db $01

DebugEnemyPopulationData_Oum:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Oum),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($A000),
    %extraProperties($0004),
    %speedParams($0000, $0000))
    dw $FFFF : db $01

DebugEnemyPopulationData_Zero:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zero),
    %XPosition($00A0),
    %YPosition($0040),
    %initParam(2),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0000))
    dw $FFFF : db $01

DebugEnemyPopulationData_Bull:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Bull),
    %XPosition($0200),
    %YPosition($0060),
    %initParam(0),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0008, $0000))
    dw $FFFF : db $01

DebugEnemyPopulationData_Polyp:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_LavaRocks),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2500),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $01

DebugEnemyPopulationData_Puromi:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Puromi),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($1010, $2001))
    dw $FFFF : db $00

DebugEnemyPopulationData_Powamp:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Powamp),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Powamp),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $01

DebugEnemyPopulationData_Puyo:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Puyo),
    %XPosition($033D),
    %YPosition($00CC),
    %initParam(0),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0003, $000A))
    dw $FFFF : db $01

DebugEnemyPopulationData_Reflec:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Reflec),
    %XPosition($0168),
    %YPosition($0048),
    %initParam(0),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $00

DebugEnemyPopulationData_Rinka:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rinka),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($6000),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $00

DebugEnemyPopulationData_Rio:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rio),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $01

DebugEnemyPopulationData_Ripper:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Ripper),
    %XPosition($0068),
    %YPosition($01A0),
    %initParam(0),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0010, $0001))
    dw $FFFF : db $01

DebugEnemyPopulationData_GRipper_Ripper2:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Ripper2),
    %XPosition($0040),
    %YPosition($06A0),
    %initParam(0),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0020, $0001))
    dw $FFFF : db $01

DebugEnemyPopulationData_Robot:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Robot),
    %XPosition($0050),
    %YPosition($00B0),
    %initParam(0),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0001, $0000))
    dw $FFFF : db $01

DebugEnemyPopulationData_Boulder:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Boulder),
    %XPosition($0400),
    %YPosition($01B5),
    %initParam($0060),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0101, $20A0))
    dw $FFFF : db $00

DebugEnemyPopulationData_Cacatac:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Cacatac),
    %XPosition($03D0),
    %YPosition($00B3),
    %initParam(0),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0100, $0F01))
    dw $FFFF : db $01

DebugEnemyPopulationData_Sbug_Sbug2:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($01AD),
    %YPosition($04E8),
    %initParam(0),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($E804, $0020))
    dw $FFFF : db $00

DebugEnemyPopulationData_MiniKraid:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_MiniKraid),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $01

DebugEnemyPopulationData_Dessgeega:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dessgeega),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0000))
    dw $FFFF : db $01

DebugEnemyPopulationData_ShutterGrowing:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_ShutterGrowing),
    %XPosition($0300),
    %YPosition($0088),
    %initParam(0),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($004C, $0008))
    dw $FFFF : db $00

DebugEnemyPopulationData_Shutters_Kamer:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_ShutterShootable),
    %XPosition($0100),
    %YPosition($0100),
    %initParam($0020),
    %properties($A800),
    %extraProperties($0A0A),
    %speedParams($2003, $0000))
    dw $FFFF : db $00

DebugEnemyPopulationData_SidehopperLarge_SidehopperTourian:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_SidehopperLarge),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $01

DebugEnemyPopulationData_Skree:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Skree),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $01

DebugEnemyPopulationData_Spark:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Spark),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $00

DebugEnemyPopulationData_Squeept:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Squeept),
    %XPosition($0060),
    %YPosition($00D8),
    %initParam(0),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Squeept),
    %XPosition($0060),
    %YPosition($00D8),
    %initParam(2),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($8000, $0000))
    dw $FFFF : db $01

DebugEnemyPopulationData_Sidehopper:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sidehopper),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0000))
    dw $FFFF : db $01

DebugEnemyPopulationData_Stoke:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Stoke),
    %XPosition($0C30),
    %YPosition($01F8),
    %initParam(0),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0001))
    dw $FFFF : db $01

DebugEnemyPopulationData_Owtch:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Owtch),
    %XPosition($0060),
    %YPosition($01C8),
    %initParam(0),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0301, $0002))
    dw $FFFF : db $01

DebugEnemyPopulationData_Viola:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Viola),
    %XPosition($00D8),
    %YPosition($008A),
    %initParam(3),
    %properties($2001),
    %extraProperties($0000),
    %speedParams($0002, $0006))
    dw $FFFF : db $01

DebugEnemyPopulationData_Waver:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Waver),
    %XPosition($00C9),
    %YPosition($005C),
    %initParam(0),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0000))
    dw $FFFF : db $01

DebugEnemyPopulationData_Yard:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Yard),
    %XPosition($01D0),
    %YPosition($0098),
    %initParam(3),
    %properties($A004),
    %extraProperties($0000),
    %speedParams($0001, $0000))
    dw $FFFF : db $01

DebugEnemyPopulationData_Zeb:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zeb),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($6900),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $01

DebugEnemyPopulationData_Zebbo:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zebbo),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($6900),
    %extraProperties($0000),
    %speedParams($0002, $0000))
    dw $FFFF : db $01

DebugEnemyPopulationData_Zeela:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zeela),
    %XPosition($0180),
    %YPosition($008C),
    %initParam(3),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0002))
    dw $FFFF : db $01

DebugEnemyPopulationData_Zoa:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zoa),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($6100),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $01

DebugEnemyPopulationData_Zoomer:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zoomer),
    %XPosition($00D8),
    %YPosition($00C8),
    %initParam(3),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0000))
    dw $FFFF : db $01

DebugEnemyPopulationData_PirateGreenWall:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGreenWall),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($0001, $0030))
    dw $FFFF : db $01

DebugEnemyPopulationData_PirateRedWall:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateRedWall),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($0001, $0030))
    dw $FFFF : db $01

DebugEnemyPopulationData_PirateGoldWall:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGoldWall),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($0001, $0030))
    dw $FFFF : db $01

DebugEnemyPopulationData_PirateMagentaWall:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateMagentaWall),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($0001, $0030))
    dw $FFFF : db $01

DebugEnemyPopulationData_PirateSilverWall:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateSilverWall),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($0001, $0030))
    dw $FFFF : db $01

DebugEnemyPopulationData_PirateGreenNinja:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGreenNinja),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2800),
    %extraProperties($0004),
    %speedParams($0001, $0030))
    dw $FFFF : db $01

DebugEnemyPopulationData_PirateRedNinja:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateRedNinja),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2800),
    %extraProperties($0004),
    %speedParams($0001, $0030))
    dw $FFFF : db $01

DebugEnemyPopulationData_PirateGoldNinja:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGoldNinja),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2800),
    %extraProperties($0004),
    %speedParams($0001, $0030))
    dw $FFFF : db $01

DebugEnemyPopulationData_PirateMagentaNinja:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateMagentaNinja),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2800),
    %extraProperties($0004),
    %speedParams($0001, $0030))
    dw $FFFF : db $01

DebugEnemyPopulationData_PirateSilverNinja:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateSilverNinja),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2800),
    %extraProperties($0004),
    %speedParams($0001, $0030))
    dw $FFFF : db $01

DebugEnemyPopulationData_PirateGreenWalking:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGreenWalking),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($0001, $0030))
    dw $FFFF : db $01

DebugEnemyPopulationData_PirateRedWalking:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateRedWalking),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($0001, $0030))
    dw $FFFF : db $01

DebugEnemyPopulationData_PirateGoldWalking:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGoldWalking),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($0001, $0030))
    dw $FFFF : db $01

DebugEnemyPopulationData_PirateMagentaWalking:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateMagentaWalking),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($0001, $0030))
    dw $FFFF : db $01

DebugEnemyPopulationData_PirateSilverWalking:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateSilverWalking),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($0001, $0030))
    dw $FFFF : db $01

DebugEnemyPopulationData_Fune:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Fune),
    %XPosition($00F0),
    %YPosition($04E0),
    %initParam(0),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0110, $0F05))
    dw $FFFF : db $01

DebugEnemyPopulationData_KihunterYellow:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KihunterYellow),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KihunterYellowWings),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0020, $0000))
    dw $FFFF : db $01

DebugEnemyPopulationData_KihunterRed:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KihunterRed),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KihunterRedWings),
    %XPosition($0100),
    %YPosition($0100),
    %initParam(0),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0020, $0000))
    dw $FFFF : db $01

DebugEnemyPopulationData_RobotNoPower:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_RobotNoPower),
    %XPosition($0050),
    %YPosition($00B0),
    %initParam(0),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0001, $0000))
    dw $FFFF : db $01


; see labels.asm for EnemyVulnerabilities:
;;; $EC1C: Enemy vulnerabilities ;;;
; Vulnerability format:
;     v = f000dddd
;     If v = FFh:
;         Freeze, no damage
;     Else:
;         d: Damage multiplier * 2
;         f: Does not freeze
;        ____________________________________________________________________________ 0: Power
;       |    ________________________________________________________________________ 1: Wave
;       |   |    ____________________________________________________________________ 2: Ice
;       |   |   |    ________________________________________________________________ 3: Ice + wave
;       |   |   |   |    ____________________________________________________________ 4: Spazer
;       |   |   |   |   |    ________________________________________________________ 5: Spazer + wave
;       |   |   |   |   |   |    ____________________________________________________ 6: Spazer + ice
;       |   |   |   |   |   |   |    ________________________________________________ 7: Spazer + ice + wave
;       |   |   |   |   |   |   |   |    ____________________________________________ 8: Plasma
;       |   |   |   |   |   |   |   |   |    ________________________________________ 9: Plasma + wave / shinespark echo
;       |   |   |   |   |   |   |   |   |   |    ____________________________________ Ah: Plasma + ice
;       |   |   |   |   |   |   |   |   |   |   |    ________________________________ Bh: Plasma + ice + wave
;       |   |   |   |   |   |   |   |   |   |   |   |
;       |   |   |   |   |   |   |   |   |   |   |   |
;       |   |   |   |   |   |   |   |   |   |   |   |
;       |   |   |   |   |   |   |   |   |   |   |   |
;       |   |   |   |   |   |   |   |   |   |   |   |
;       |   |   |   |   |   |   |   |   |   |   |   |
;       |   |   |   |   |   |   |   |   |   |   |   |
;       |   |   |   |   |   |   |   |   |   |   |   |
;       |   |   |   |   |   |   |   |   |   |   |   |
;       |   |   |   |   |   |   |   |   |   |   |   |
;       |   |   |   |   |   |   |   |   |   |   |   |
;       |   |   |   |   |   |   |   |   |   |   |   |

;        _____________________________________ Ch: Missile
;       |    _________________________________ Dh: Super missile
;       |   |    _____________________________ Eh: Bomb
;       |   |   |    _________________________ Fh: Power bomb
;       |   |   |   |    _____________________ 10h: Speed booster
;       |   |   |   |   |    _________________ 11h: Shinespark
;       |   |   |   |   |   |    _____________ 12h: Screw attack
;       |   |   |   |   |   |   |    _________ 13h: Charged beam (including SBA)
;       |   |   |   |   |   |   |   |    _____ 14h: Pseudo screw attack
;       |   |   |   |   |   |   |   |   |    _ 15h: Unused
;       |   |   |   |   |   |   |   |   |   |
EnemyVulnerabilities_Default:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02

EnemyVulnerabilities_DessgeegaLarge:
    db $00,$00,$00,$00,$01,$01,$01,$01,$02,$02,$02,$02
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02

EnemyVulnerabilities_Viola_Yard_HZoomer_Zeela_Sova_Zoomer:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
    db $02,$02,$04,$04,$02,$02,$02,$02,$02,$02

EnemyVulnerabilities_PirateNinja_Grey_Green_Red_Magenta:
    db $82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82
    db $02,$02,$00,$02,$02,$02,$02,$02,$80,$00

EnemyVulnerabilities_PirateGoldNinja:
    db $80,$80,$80,$80,$81,$81,$81,$81,$82,$82,$82,$82
    db $02,$04,$00,$00,$00,$00,$00,$02,$80,$00

EnemyVulnerabilities_PirateSilverWall_PirateSilverWalking:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
    db $04,$04,$00,$02,$02,$02,$02,$02,$02,$02

EnemyVulnerabilities_PirateSilverNinja:
    db $84,$84,$84,$84,$84,$84,$84,$84,$84,$84,$84,$84
    db $84,$84,$84,$84,$84,$84,$84,$04,$84,$84

EnemyVulnerabilities_PirateRedWall:
    db $00,$02,$04,$04,$02,$02,$04,$04,$02,$02,$04,$04
    db $04,$04,$02,$02,$02,$02,$02,$02,$02,$02

EnemyVulnerabilities_PirateGreyWall:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
    db $04,$04,$00,$02,$02,$02,$02,$02,$02,$02

EnemyVulnerabilities_PirateMagentaWall:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
    db $04,$04,$00,$02,$02,$02,$02,$02,$02,$02

EnemyVulnerabilities_PirateGreyWalking:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
    db $04,$04,$00,$02,$02,$02,$02,$02,$02,$02

EnemyVulnerabilities_PirateGreenWalking:
    db $00,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
    db $04,$04,$04,$02,$02,$02,$02,$02,$02,$02

EnemyVulnerabilities_PirateRedWalking:
    db $00,$02,$04,$04,$02,$02,$04,$04,$02,$02,$04,$04
    db $04,$04,$00,$02,$02,$02,$02,$02,$02,$02

EnemyVulnerabilities_PirateMagentaWalking:
    db $00,$00,$00,$00,$00,$00,$00,$00,$02,$02,$02,$02
    db $00,$00,$00,$00,$02,$02,$02,$00,$02,$02

EnemyVulnerabilities_PirateGoldWall_PirateGoldWalking:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02

EnemyVulnerabilities_KihunterGreen_KihunterGreenWings:
    db $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
    db $04,$04,$00,$02,$02,$02,$02,$02,$02,$02

EnemyVulnerabilities_KihunterYellow_KihunterYellowWings:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
    db $02,$02,$00,$02,$02,$02,$02,$02,$02,$02

EnemyVulnerabilities_KihunterRed_KihunterRedWings:
    db $00,$00,$81,$81,$81,$82,$82,$82,$82,$82,$82,$82
    db $00,$02,$00,$00,$02,$02,$04,$82,$00,$02

EnemyVulnerabilities_Boyon:
    db $00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF
    db $00,$02,$02,$02,$00,$00,$00,$00,$02,$02

EnemyVulnerabilities_Metaree:
    db $00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF
    db $00,$02,$02,$02,$00,$00,$02,$00,$02,$02

EnemyVulnerabilities_MZoomer:
    db $00,$00,$00,$00,$00,$00,$00,$00,$02,$02,$02,$02
    db $00,$00,$02,$02,$00,$00,$02,$00,$00,$00

EnemyVulnerabilities_Squeept_Ripper2_Ripper_Tripper:
    db $00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF
    db $00,$02,$00,$02,$00,$00,$02,$00,$00,$02

EnemyVulnerabilities_Mella:
    db $02,$02,$04,$04,$02,$02,$04,$04,$02,$02,$04,$04
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02

EnemyVulnerabilities_Dragon:
    db $00,$00,$FF,$FF,$00,$00,$FF,$FF,$02,$02,$02,$02
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02

EnemyVulnerabilities_Alcoon:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
    db $04,$04,$02,$02,$02,$02,$02,$02,$02,$02

EnemyVulnerabilities_Geruta:
    db $02,$02,$04,$04,$02,$02,$04,$04,$02,$02,$04,$04
    db $02,$02,$00,$02,$02,$02,$02,$02,$02,$02

EnemyVulnerabilities_Holtz:
    db $02,$02,$04,$04,$02,$02,$04,$04,$02,$02,$04,$04
    db $00,$02,$00,$02,$02,$02,$02,$02,$02,$02

EnemyVulnerabilities_Multiviola:
    db $02,$02,$04,$04,$02,$02,$04,$04,$02,$02,$04,$04
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02

EnemyVulnerabilities_Owtch:
    db $00,$00,$00,$00,$00,$00,$00,$00,$02,$02,$02,$02
    db $00,$02,$00,$02,$02,$02,$02,$02,$02,$02

EnemyVulnerabilities_YappingMaw:
    db $00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF
    db $00,$02,$00,$00,$02,$02,$00,$00,$00,$02

EnemyVulnerabilities_Fune_Magdollite:
    db $00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF
    db $00,$02,$00,$02,$02,$02,$00,$00,$00,$02

EnemyVulnerabilities_Indestructible:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00

EnemyVulnerabilities_Boulder:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$02,$00,$00,$00,$00,$00,$00,$02,$02

EnemyVulnerabilities_Namihe:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FF,$FF
    db $00,$00,$00,$00,$00,$00,$02,$00,$02,$02

EnemyVulnerabilities_NonDestructibleShutter:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$82,$00,$00,$00,$00,$00,$00

EnemyVulnerabilities_Shaktool:
    db $82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82
    db $82,$82,$82,$00,$00,$00,$00,$00,$00,$00

EnemyVulnerabilities_Powamp:
    db $82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82
    db $82,$82,$82,$82,$82,$82,$82,$02,$82,$82

EnemyVulnerabilities_GRipper:
    db $00,$00,$00,$00,$00,$00,$80,$00,$00,$00,$00,$00
    db $02,$02,$00,$02,$00,$02,$02,$00,$00,$02

EnemyVulnerabilities_Metroid:
    db $00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF
    db $02,$04,$00,$01,$02,$02,$02,$00,$02,$02

EnemyVulnerabilities_Sciser_Zero:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
    db $02,$02,$04,$04,$02,$02,$02,$02,$02,$02

EnemyVulnerabilities_Beetom:
    db $00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF
    db $02,$02,$04,$04,$02,$02,$02,$00,$00,$02

EnemyVulnerabilities_Bull:
    db $80,$80,$80,$80,$80,$80,$80,$80,$02,$02,$82,$82
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02

EnemyVulnerabilities_ShutterDestroyable:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$82,$82
    db $00,$00,$00,$00,$00,$00,$00,$02,$00,$00

EnemyVulnerabilities_Evir:
    db $02,$02,$FF,$FF,$02,$02,$FF,$FF,$02,$02,$82,$82
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02

EnemyVulnerabilities_EvirProjectile:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00

EnemyVulnerabilities_MiniKraid:
    db $82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82
    db $84,$84,$82,$82,$82,$82,$82,$02,$80,$80

EnemyVulnerabilities_Bang:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
    db $00,$00,$00,$00,$00,$00,$00,$02,$00,$00

EnemyVulnerabilities_Kago:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$02,$00,$00,$00,$00,$00,$00

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyVulnerabilities_B4F03C:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$02,$00,$00,$00,$02,$00,$00

UNUSED_EnemyVulnerabilities_B4F052:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$04,$00,$00,$00,$02,$00,$00
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyVulnerabilities_Zebetite:
    db $80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80
    db $82,$82,$80,$80,$80,$80,$80,$00,$80,$80

EnemyVulnerabilities_SidehopperTourian:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$02,$00,$00,$00,$00,$00,$00,$00,$00

EnemyVulnerabilities_SporeSpawn:
    db $80,$82,$82,$82,$80,$82,$82,$82,$82,$82,$82,$82
    db $82,$82,$80,$80,$80,$80,$80,$04,$80,$80

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyVulnerabilities_B4F0AA:
    db $82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82
    db $82,$82,$82,$82,$82,$82,$82,$02,$82,$82
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyVulnerabilities_BombTorizo_BombTorizoOrb:
    db $02,$02,$82,$82,$02,$02,$82,$82,$02,$02,$82,$82
    db $02,$04,$00,$00,$00,$00,$00,$02,$00,$00

EnemyVulnerabilities_GoldenTorizo_GoldenTorizoOrb:
    db $80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80
    db $82,$84,$80,$00,$00,$00,$00,$02,$02,$00

EnemyVulnerabilities_Phantoon_Body_Eye_Tentacles_Mouth:
    db $80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80
    db $82,$84,$00,$00,$00,$00,$00,$02,$80,$80

EnemyVulnerabilities_Crocomire_CrocomireTongue:
    db $80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80
    db $80,$80,$80,$82,$80,$80,$80,$00,$80,$80

EnemyVulnerabilities_Botwoon:
    db $80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80
    db $82,$82,$80,$80,$80,$80,$80,$02,$80,$80

EnemyVulnerabilities_Corpse_BabyMetroid:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00

EnemyVulnerabilities_Draygon_Body_Eye_Tail_Arms:
    db $80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80
    db $82,$82,$80,$80,$80,$81,$80,$82,$82,$80

EnemyVulnerabilities_Kraid:
    db $82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82
    db $82,$82,$80,$80,$80,$80,$80,$02,$80,$80

EnemyVulnerabilities_KraidArm_KraidFoot:
    db $80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80
    db $80,$80,$80,$80,$80,$80,$80,$00,$80,$80

EnemyVulnerabilities_Kraid_LintTop_LintMiddle_LintBottom:
    db $80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80
    db $80,$80,$80,$80,$80,$80,$80,$00,$80,$80

EnemyVulnerabilities_KraidNail_KraidNailBad:
    db $82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82
    db $82,$82,$82,$82,$82,$00,$82,$02,$82,$82

EnemyVulnerabilities_Ridley_RidleyCeres:
    db $80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80
    db $82,$84,$80,$82,$80,$80,$80,$82,$80,$80

EnemyVulnerabilities_MotherBrainHead:
    db $80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80
    db $82,$82,$80,$80,$80,$80,$80,$02,$80,$80

EnemyVulnerabilities_MotherBrainBody:
    db $80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80
    db $80,$80,$80,$80,$80,$80,$80,$00,$80,$80


; see labels.asm for EnemyDropChances:
;;; $F1F4: Enemy drop chances ;;;
;        _____________________ ; 0: Small health
;       |    _________________ ; 1: Big health
;       |   |    _____________ ; 2: Missiles
;       |   |   |    _________ ; 3: Nothing
;       |   |   |   |    _____ ; 4: Super missiles
;       |   |   |   |   |    _ ; 5: Power bombs
;       |   |   |   |   |   |
EnemyDropChances_Geruta:
    db $3C,$3C,$3C,$05,$3C,$0A ; 23.5%  23.5%  23.5%   2.0%  23.5%   3.9%

EnemyDropChances_Rio:
    db $1E,$50,$55,$28,$0A,$0A ; 11.8%  31.4%  33.3%  15.7%   3.9%   3.9%

EnemyDropChances_Waver:
    db $3C,$3C,$3C,$05,$3C,$0A ; 23.5%  23.5%  23.5%   2.0%  23.5%   3.9%

EnemyDropChances_Skree:
    db $14,$03,$55,$89,$05,$05 ;  7.8%   1.2%  33.3%  53.7%   2.0%   2.0%

EnemyDropChances_Puyo:
    db $3C,$3C,$3C,$05,$0A,$3C ; 23.5%  23.5%  23.5%   2.0%   3.9%  23.5%

EnemyDropChances_Atomic:
    db $00,$A5,$50,$00,$05,$05 ;        64.7%  31.4%          2.0%   2.0%

EnemyDropChances_Mochtroid:
    db $3C,$3C,$3C,$05,$3C,$0A ; 23.5%  23.5%  23.5%   2.0%  23.5%   3.9%

EnemyDropChances_Choot:
    db $3C,$3C,$3C,$05,$3C,$0A ; 23.5%  23.5%  23.5%   2.0%  23.5%   3.9%

EnemyDropChances_Zoomer:
    db $37,$19,$AA,$00,$05,$00 ; 21.6%   9.8%  66.7%          2.0%

EnemyDropChances_Zeela:
    db $37,$19,$7D,$00,$32,$00 ; 21.6%   9.8%  49.0%         19.6%

EnemyDropChances_Sova:
    db $50,$46,$1E,$19,$32,$00 ; 31.4%  27.5%  11.8%   9.8%  19.6%

EnemyDropChances_Mellow:
    db $1E,$46,$50,$46,$05,$00 ; 11.8%  27.5%  31.4%  27.5%   2.0%

EnemyDropChances_Mella:
    db $46,$1E,$50,$46,$05,$00 ; 27.5%  11.8%  31.4%  27.5%   2.0%

EnemyDropChances_Menu:
    db $46,$14,$50,$50,$05,$00 ; 27.5%   7.8%  31.4%  31.4%   2.0%

EnemyDropChances_Zeb:
    db $3C,$3C,$3C,$05,$3C,$0A ; 23.5%  23.5%  23.5%   2.0%  23.5%   3.9%

EnemyDropChances_Geega:
    db $3C,$3C,$3C,$05,$3C,$0A ; 23.5%  23.5%  23.5%   2.0%  23.5%   3.9%

EnemyDropChances_Zebbo:
    db $00,$8C,$0A,$00,$64,$05 ;        54.9%   3.9%         39.2%   2.0%

EnemyDropChances_Gamet:
    db $3C,$3C,$3C,$05,$3C,$0A ; 23.5%  23.5%  23.5%   2.0%  23.5%   3.9%

EnemyDropChances_Zoa:
    db $00,$64,$46,$05,$46,$0A ;        39.2%  27.5%   2.0%  27.5%   3.9%

EnemyDropChances_Coven:
    db $32,$5F,$46,$00,$14,$14 ; 19.6%  37.3%  27.5%          7.8%   7.8%

EnemyDropChances_Kago:
    db $32,$5A,$46,$05,$14,$14 ; 19.6%  35.3%  27.5%   2.0%   7.8%   7.8%

EnemyDropChances_KihunterGreen_KihunterGreenWings:
    db $32,$1E,$50,$4B,$0A,$0A ; 19.6%  11.8%  31.4%  29.4%   3.9%   3.9%

EnemyDropChances_KihunterYellow_KihunterYellowWings:
    db $37,$50,$0A,$28,$3C,$0A ; 21.6%  31.4%   3.9%  15.7%  23.5%   3.9%

EnemyDropChances_KihunterRed_KihunterRedWings:
    db $23,$78,$0A,$14,$3C,$0A ; 13.7%  47.1%   3.9%   7.8%  23.5%   3.9%

EnemyDropChances_PirateGoldNinja:
    db $00,$96,$05,$00,$64,$00 ;        58.8%   2.0%         39.2%

EnemyDropChances_DessgeegaLarge:
    db $50,$14,$32,$5F,$05,$05 ; 31.4%   7.8%  19.6%  37.3%   2.0%   2.0%

EnemyDropChances_PirateRedWall:
    db $0A,$14,$14,$C3,$05,$05 ;  3.9%   7.8%   7.8%  76.5%   2.0%   2.0%

EnemyDropChances_PirateRedNinja:
    db $0A,$14,$14,$C3,$05,$05 ;  3.9%   7.8%   7.8%  76.5%   2.0%   2.0%

EnemyDropChances_PirateRedWalking:
    db $0A,$14,$14,$C3,$05,$05 ;  3.9%   7.8%   7.8%  76.5%   2.0%   2.0%

EnemyDropChances_PirateGoldWall:
    db $0A,$14,$14,$C3,$05,$05 ;  3.9%   7.8%   7.8%  76.5%   2.0%   2.0%

EnemyDropChances_PirateGreyWall:
    db $0A,$2D,$C5,$01,$01,$01 ;  3.9%  17.6%  77.3%   0.4%   0.4%   0.4%

EnemyDropChances_PirateGreenWall:
    db $05,$1E,$78,$00,$64,$00 ;  2.0%  11.8%  47.1%         39.2%

EnemyDropChances_Powamp:
    db $01,$00,$00,$00,$FE,$00 ;  0.4%                       99.6%

EnemyDropChances_Cacatac:
    db $00,$01,$00,$00,$FE,$00 ;         0.4%                99.6%

EnemyDropChances_MiniKraid:
    db $00,$01,$00,$00,$FE,$00 ;         0.4%                99.6%

EnemyDropChances_GRipper_Ripper2:
    db $00,$01,$00,$00,$FE,$00 ;         0.4%                99.6%

EnemyDropChances_Viola:
    db $01,$00,$00,$00,$00,$FE ;  0.4%                              99.6%

EnemyDropChances_Bull:
    db $00,$05,$00,$00,$00,$FA ;         2.0%                       98.0%

EnemyDropChances_Sciser:
    db $01,$64,$00,$00,$00,$9A ;  0.4%  39.2%                       60.4%

EnemyDropChances_Dessgeega:
    db $01,$00,$00,$00,$00,$FE ;  0.4%                              99.6%

EnemyDropChances_Fireflea:
    db $00,$01,$00,$00,$00,$FE ;         0.4%                       99.6%

EnemyDropChances_Alcoon:
    db $01,$00,$00,$00,$00,$FE ;  0.4%                              99.6%

EnemyDropChances_Zero:
    db $01,$00,$00,$00,$00,$FE ;  0.4%                              99.6%

EnemyDropChances_Beetom:
    db $01,$00,$00,$00,$00,$FE ;  0.4%                              99.6%

EnemyDropChances_HZoomer:
    db $82,$14,$00,$64,$00,$05 ; 51.0%   7.8%         39.2%          2.0%

EnemyDropChances_MZoomer:
    db $82,$14,$00,$64,$00,$05 ; 51.0%   7.8%         39.2%          2.0%

EnemyDropChances_Ripper:
    db $50,$14,$50,$41,$05,$05 ; 31.4%   7.8%  31.4%  25.5%   2.0%   2.0%

EnemyDropChances_Tripper_Kamer2:
    db $50,$50,$50,$05,$05,$05 ; 31.4%  31.4%  31.4%   2.0%   2.0%   2.0%

EnemyDropChances_Metaree:
    db $50,$19,$50,$3C,$05,$05 ; 31.4%   9.8%  31.4%  23.5%   2.0%   2.0%

EnemyDropChances_Reflec:
    db $3C,$3C,$3C,$3C,$0F,$00 ; 23.5%  23.5%  23.5%  23.5%   5.9%

EnemyDropChances_Boyon:
    db $14,$0A,$55,$82,$05,$05 ;  7.8%   3.9%  33.3%  51.0%   2.0%   2.0%

EnemyDropChances_Sidehopper:
    db $14,$28,$55,$64,$05,$05 ;  7.8%  15.7%  33.3%  39.2%   2.0%   2.0%

EnemyDropChances_SidehopperLarge_SidehopperTourian:
    db $14,$14,$37,$64,$37,$05 ;  7.8%   7.8%  21.6%  39.2%  21.6%   2.0%

EnemyDropChances_Skultera:
    db $50,$1E,$46,$46,$05,$00 ; 31.4%  11.8%  27.5%  27.5%   2.0%

EnemyDropChances_Oum:
    db $46,$1E,$46,$4B,$05,$05 ; 27.5%  11.8%  27.5%  29.4%   2.0%   2.0%

EnemyDropChances_Yard:
    db $55,$50,$00,$50,$00,$0A ; 33.3%  31.4%         31.4%          3.9%

EnemyDropChances_Botwoon:
    db $00,$82,$3C,$05,$1E,$1E ;        51.0%  23.5%   2.0%  11.8%  11.8%

EnemyDropChances_Owtch:
    db $50,$50,$50,$05,$05,$05 ; 31.4%  31.4%  31.4%   2.0%   2.0%   2.0%

EnemyDropChances_Evir_EvirProjectile:
    db $50,$50,$50,$05,$05,$05 ; 31.4%  31.4%  31.4%   2.0%   2.0%   2.0%

EnemyDropChances_Holtz:
    db $00,$78,$32,$00,$32,$23 ;        47.1%  19.6%         19.6%  13.7%

EnemyDropChances_Squeept:
    db $32,$32,$32,$05,$32,$32 ; 19.6%  19.6%  19.6%   2.0%  19.6%  19.6%

EnemyDropChances_Multiviola:
    db $46,$1E,$4B,$46,$05,$05 ; 27.5%  11.8%  29.4%  27.5%   2.0%   2.0%

EnemyDropChances_Dragon:
    db $32,$32,$46,$4B,$05,$05 ; 19.6%  19.6%  27.5%  29.4%   2.0%   2.0%

EnemyDropChances_Metroid:
    db $19,$32,$5A,$0A,$32,$1E ;  9.8%  19.6%  35.3%   3.9%  19.6%  11.8%

EnemyDropChances_Rinka:
    db $00,$00,$00,$FF,$00,$00 ;                     100.0%

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyDropChances_B4F37A:
    db $00,$82,$3C,$05,$1E,$1E ;        51.0%  23.5%   2.0%  11.8%  11.8%
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyDropChances_Bang:
    db $2D,$50,$50,$1E,$0A,$0A ; 17.6%  31.4%  31.4%  11.8%   3.9%   3.9%

EnemyDropChances_PirateGreyNinja:
    db $32,$78,$50,$00,$05,$00 ; 19.6%  47.1%  31.4%          2.0%

EnemyDropChances_PirateGreyWalking:
    db $32,$78,$50,$00,$05,$00 ; 19.6%  47.1%  31.4%          2.0%

EnemyDropChances_PirateGreenNinja:
    db $32,$19,$00,$19,$9B,$00 ; 19.6%   9.8%          9.8%  60.8%

EnemyDropChances_PirateGreenWalking:
    db $32,$1E,$64,$2D,$14,$0A ; 19.6%  11.8%  39.2%  17.6%   7.8%   3.9%

EnemyDropChances_PirateGoldWalking:
    db $32,$78,$50,$00,$05,$00 ; 19.6%  47.1%  31.4%          2.0%

EnemyDropChances_PirateMagentaWall:
    db $1E,$46,$50,$46,$05,$00 ; 11.8%  27.5%  31.4%  27.5%   2.0%

EnemyDropChances_PirateMagentaNinja:
    db $32,$78,$50,$00,$05,$00 ; 19.6%  47.1%  31.4%          2.0%

EnemyDropChances_PirateMagentaWalking:
    db $32,$78,$50,$00,$05,$00 ; 19.6%  47.1%  31.4%          2.0%

EnemyDropChances_Stoke:
    db $50,$50,$50,$05,$05,$05 ; 31.4%  31.4%  31.4%   2.0%   2.0%   2.0%

EnemyDropChances_MamaTurtle_BabyTurtle:
    db $50,$50,$50,$05,$05,$05 ; 31.4%  31.4%  31.4%   2.0%   2.0%   2.0%

EnemyDropChances_ShipTop_ShipBottomEntrance:
    db $00,$00,$00,$FF,$00,$00 ;                     100.0%

EnemyDropChances_Shaktool:
    db $50,$50,$50,$05,$05,$05 ; 31.4%  31.4%  31.4%   2.0%   2.0%   2.0%

EnemyDropChances_Eye:
    db $50,$50,$50,$05,$05,$05 ; 31.4%  31.4%  31.4%   2.0%   2.0%   2.0%

EnemyDropChances_Fune:
    db $50,$50,$50,$05,$05,$05 ; 31.4%  31.4%  31.4%   2.0%   2.0%   2.0%

EnemyDropChances_Namihe:
    db $50,$50,$50,$05,$05,$05 ; 31.4%  31.4%  31.4%   2.0%   2.0%   2.0%

EnemyDropChances_YappingMaw:
    db $50,$50,$50,$05,$05,$05 ; 31.4%  31.4%  31.4%   2.0%   2.0%   2.0%

EnemyDropChances_Magdollite:
    db $50,$50,$50,$05,$05,$05 ; 31.4%  31.4%  31.4%   2.0%   2.0%   2.0%

EnemyDropChances_Robot:
    db $50,$50,$50,$05,$05,$05 ; 31.4%  31.4%  31.4%   2.0%   2.0%   2.0%

EnemyDropChances_RobotNoPower:
    db $50,$50,$50,$05,$05,$05 ; 31.4%  31.4%  31.4%   2.0%   2.0%   2.0%

EnemyDropChances_MotherBrainBody_BombTorizo:
    db $32,$32,$32,$00,$32,$37 ; 19.6%  19.6%  19.6%         19.6%  21.6%

EnemyDropChances_BombTorizoOrb:
    db $74,$14,$41,$36,$00,$00 ; 45.5%   7.8%  25.5%  21.2%

EnemyDropChances_GoldenTorizo:
    db $32,$32,$32,$00,$32,$37 ; 19.6%  19.6%  19.6%         19.6%  21.6%

EnemyDropChances_GoldenTorizoOrb:
    db $1E,$1E,$32,$3C,$55,$00 ; 11.8%  11.8%  19.6%  23.5%  33.3%

EnemyDropChances_SporeSpawn:
    db $32,$32,$32,$00,$32,$37 ; 19.6%  19.6%  19.6%         19.6%  21.6%

EnemyDropChances_SporeSpawnStalk:
    db $0A,$14,$C8,$19,$00,$00 ;  3.9%   7.8%  78.4%   9.8%

EnemyDropChances_Kraid:
    db $32,$32,$32,$00,$32,$37 ; 19.6%  19.6%  19.6%         19.6%  21.6%

EnemyDropChances_KraidNail_KraidFoot:
    db $0A,$23,$C8,$00,$0A,$00 ;  3.9%  13.7%  78.4%          3.9%

EnemyDropChances_CrocomireTongue:
    db $00,$0A,$DC,$05,$14,$00 ;         3.9%  86.3%   2.0%   7.8%

EnemyDropChances_Crocomire:
    db $00,$78,$64,$05,$14,$0A ;        47.1%  39.2%   2.0%   7.8%   3.9%

EnemyDropChances_Phantoon_Body_Tentacles_Mouth:
    db $32,$32,$32,$00,$32,$37 ; 19.6%  19.6%  19.6%         19.6%  21.6%

EnemyDropChances_PhantoonEye:
    db $14,$14,$64,$69,$0A,$00 ;  7.8%   7.8%  39.2%  41.2%   3.9%

EnemyDropChances_DraygonBody_DraygonTail_DraygonArms:
    db $32,$32,$32,$00,$32,$37 ; 19.6%  19.6%  19.6%         19.6%  21.6%

EnemyDropChances_DraygonEye:
    db $05,$1E,$6E,$64,$05,$05 ;  2.0%  11.8%  43.1%  39.2%   2.0%   2.0%

EnemyDropChances_Ridley_RidleyCeres:
    db $32,$32,$32,$00,$32,$37 ; 19.6%  19.6%  19.6%         19.6%  21.6%

EnemyDropChances_NoobTubeCrack_Chozo:
    db $00,$00,$00,$FF,$00,$00 ;                     100.0%

EnemyDropChances_Spark:
    db $00,$00,$00,$FF,$00,$00 ;                     100.0%

EnemyDropChances_FaceBlock:
    db $00,$00,$00,$FF,$00,$00 ;                     100.0%

EnemyDropChances_Puromi:
    db $00,$00,$00,$FF,$00,$00 ;                     100.0%

EnemyDropChances_Boulder:
    db $00,$00,$00,$FF,$00,$00 ;                     100.0%

EnemyDropChances_KzanTop_KzanBottom:
    db $00,$00,$00,$FF,$00,$00 ;                     100.0%

EnemyDropChances_Hibashi:
    db $00,$00,$00,$FF,$00,$00 ;                     100.0%

EnemyDropChances_Sbug_Sbug2:
    db $00,$00,$00,$FF,$00,$00 ;                     100.0%

EnemyDropChances_Etecoon_EtecoonEscape:
    db $00,$00,$00,$FF,$00,$00 ;                     100.0%

EnemyDropChances_Steam_Dachora_DachoraEscape:
    db $00,$00,$00,$FF,$00,$00 ;                     100.0%

EnemyDropChances_Polyp:
    db $00,$00,$00,$FF,$00,$00 ;                     100.0%

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyDropChances_B4F494:
    db $00,$00,$00,$FF,$00,$00 ;                     100.0%
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyDropChances_MotherBrainHead:
    db $00,$00,$00,$FF,$00,$00 ;                     100.0%

EnemyDropChances_Shutter_Kamer_BabyMetroidCutscene:
    db $00,$00,$00,$FF,$00,$00 ;                     100.0%

EnemyDropChances_PirateSilverWall:
    db $00,$00,$00,$FF,$00,$00 ;                     100.0%

EnemyDropChances_PirateSilverNinja:
    db $00,$00,$00,$FF,$00,$00 ;                     100.0%

EnemyDropChances_PirateSilverWalking:
    db $00,$00,$00,$FF,$00,$00 ;                     100.0%


Freespace_BankB4_F4B8:
; $B48 bytes
