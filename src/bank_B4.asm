
; Debug handling, enemy sets/vulnerabilities/drops, sprite objects

org $B48000


; see labels.asm for EnemySets:
;;; $8000: Enemy sets ;;;
EnemySets_Draygon_1_MotherBrain_2:
    dw $FFFF                                                             ;B48000;

EnemySetName_EastOcean:
    db "SF1_10 "                                                         ;B48002;

EnemySets_EastOcean:
    dw EnemyHeaders_Choot,$0001                                          ;B48009;
    dw EnemyHeaders_Skultera,$0002                                       ;B4800D;
    dw EnemyHeaders_Kamer2,$0003                                         ;B48011;
    dw $FFFF
    db $00                                                               ;B48017;

EnemySetName_CrateriaPowerBombs:
    db "sf1_04 "                                                         ;B48018;

EnemySets_CrateriaPowerBombs:
    dw EnemyHeaders_Alcoon,$0001                                         ;B4801F;
    dw EnemyHeaders_Zero,$0001                                           ;B48023;
    dw $FFFF
    db $00                                                               ;B48029;

EnemySetName_Terminator:
    db "sf2_06 "                                                         ;B4802A;

EnemySets_Terminator:
    dw EnemyHeaders_Waver,$0001                                          ;B48031;
    dw EnemyHeaders_Zoomer,$0002                                         ;B48035;
    dw $FFFF
    db $00                                                               ;B4803B;

EnemySetName_FinalMissileBombway_1:
    db "SF2_12a"                                                         ;B4803C;

EnemySets_FinalMissileBombway_1:
    dw EnemyHeaders_FaceBlock,$0007                                      ;B48043;
    dw $FFFF
    db $00                                                               ;B4804D;

EnemySetName_FinalMissileBombway_0:
    db "SF2_12 "                                                         ;B4804E;

EnemySets_FinalMissileBombway_0:
    dw EnemyHeaders_FaceBlock,$0007                                      ;B48055;
    dw $FFFF
    db $00                                                               ;B4805F;

EnemySetName_Parlor_1:
    db "sf1_02A"                                                         ;B48060;

EnemySets_Parlor_1:
    dw EnemyHeaders_Zoomer,$0001                                         ;B48067;
    dw EnemyHeaders_Skree,$0002                                          ;B4806B;
    dw EnemyHeaders_Ripper,$0003                                         ;B4806F;
    dw $FFFF
    db $00                                                               ;B48075;

EnemySetName_Flyway_0_1:
    db "sf2_04 "                                                         ;B48076;

EnemySets_Flyway_0_1:
    dw EnemyHeaders_Waver,$0001                                          ;B4807D;
    dw EnemyHeaders_Mellow,$0002                                         ;B48081;
    dw $FFFF
    db $00                                                               ;B48087;

EnemySetName_Pit_1:
    db "sf2_01A"                                                         ;B48088;

EnemySets_Pit_1:
    dw EnemyHeaders_PirateGreyWalking,$0001                              ;B4808F;
    dw EnemyHeaders_PirateGreyWall,$0002                                 ;B48093;
    dw $FFFF
    db $00                                                               ;B48099;

EnemySetName_GauntletEntrance:
    db "sf1_01 "                                                         ;B4809A;

EnemySets_GauntletEntrance:
    dw EnemyHeaders_YappingMaw,$0001                                     ;B480A1;
    dw EnemyHeaders_Waver,$0002                                          ;B480A5;
    dw $FFFF
    db $00                                                               ;B480AB;

EnemySetName_BombTorizo_0_1:
    db "sf2_03 "                                                         ;B480AC;

EnemySets_BombTorizo_0_1:
    dw EnemyHeaders_BombTorizo,$0001                                     ;B480B3;
    dw $FFFF
    db $00                                                               ;B480B9;

EnemySetName_GreenPiratesShaft:
    db "sf2_10 "                                                         ;B480BA;

EnemySets_GreenPiratesShaft:
    dw EnemyHeaders_PirateGreenWalking,$0001                             ;B480C1;
    dw EnemyHeaders_Beetom,$0002                                         ;B480C5;
    dw $FFFF
    db $00                                                               ;B480CB;

EnemySetName_GreenBrinstarElev:
    db "sf2_07 "                                                         ;B480CC;

EnemySets_GreenBrinstarElev:
    dw $FFFF                                                             ;B480D3;
    db $00                                                               ;B480D5;

EnemySetName_FinalMissile_0:
    db "SF2_13 "                                                         ;B480D6;

EnemySets_FinalMissile_0:
    dw EnemyHeaders_Eye,$0001                                            ;B480DD;
    dw $FFFF
    db $00                                                               ;B480E3;

EnemySetName_CrateriaMap:
    db "sf2_09 "                                                         ;B480E4;

EnemySets_CrateriaMap:
    dw EnemyHeaders_BombTorizo,$0001                                     ;B480EB;
    dw $FFFF
    db $00                                                               ;B480F1;
EnemySetName_FinalMissile_1:
    db "SF2_13a"                                                         ;B48100;

EnemySets_FinalMissile_1:
    dw $FFFF                                                             ;B48107;
    db $00                                                               ;B48109;

EnemySetName_Climb_2:
    db "sf2_00 "                                                         ;B4810A;

EnemySets_Climb_2:
    dw EnemyHeaders_PirateSilverNinja,$0002                              ;B48111;
    dw $FFFF
    db $00                                                               ;B48117;

EnemySetName_CrateriaSave:
    db "SF1_05 "                                                         ;B48122;

EnemySets_CrateriaSave:
    dw $FFFF                                                             ;B48129;
    db $00                                                               ;B4812B;

EnemySetName_ForgottenHighwayElbow:
    db "SF1_13 "                                                         ;B4812C;

EnemySets_ForgottenHighwayElbow:
    dw EnemyHeaders_FaceBlock,$0001                                      ;B48133;
    dw $FFFF
    db $00                                                               ;B48139;

EnemySetName_Moat:
    db "SF1_15 "                                                         ;B4813A;

EnemySets_Moat:
    dw EnemyHeaders_FaceBlock,$0001                                      ;B48141;
    dw $FFFF
    db $00                                                               ;B48147;

EnemySetName_Climb_0:
    db "sf2_00 "                                                         ;B48148;

EnemySets_Climb_0:
    dw EnemyHeaders_Sbug,$0007                                           ;B4814F;
    dw EnemyHeaders_FaceBlock,$0007                                      ;B48153;
    dw $FFFF
    db $00                                                               ;B48159;

EnemySetName_WestOcean:
    db "SF1_06 "                                                         ;B4815A;

EnemySets_WestOcean:
    dw EnemyHeaders_Skultera,$0001                                       ;B48161;
    dw EnemyHeaders_Zeb,$0002                                            ;B48165;
    dw EnemyHeaders_GRipper,$0003                                        ;B48169;
    dw EnemyHeaders_Tripper,$0007                                        ;B4816D;
    dw $FFFF
    db $00                                                               ;B48173;

EnemySetName_Parlor_0:
    db "sf1_02 "                                                         ;B4817E;

EnemySets_Parlor_0:
    dw EnemyHeaders_Sbug,$0007                                           ;B48185;
    dw $FFFF
    db $00                                                               ;B4818B;

EnemySetName_LandingSite_0_1_2:
    db "sf1_00 "                                                         ;B4818C;

EnemySets_LandingSite_0_1_2:
    dw EnemyHeaders_ShipTop,$0002                                        ;B48193;
    dw EnemyHeaders_ShipBottomEntrance,$0007                             ;B48197;
    dw $FFFF
    db $00                                                               ;B4819D;

EnemySetName_CrateriaSuper:
    db "SF2_11 "                                                         ;B4819E;

EnemySets_CrateriaSuper:
    dw EnemyHeaders_Boyon,$0001                                          ;B481A5;
    dw EnemyHeaders_YappingMaw,$0002                                     ;B481A9;
    dw $FFFF
    db $00                                                               ;B481AF;

EnemySetName_PreBowling:
    db "SF1_18 "                                                         ;B481BA;

EnemySets_PreBowling:
    dw EnemyHeaders_HZoomer,$0001                                        ;B481C1;
    dw EnemyHeaders_Sova,$0001                                           ;B481C5;
    dw $FFFF
    db $00                                                               ;B481CB;

EnemySetName_Climb_1:
    db "sf2_00A"                                                         ;B481CC;

EnemySets_Climb_1:
    dw EnemyHeaders_PirateGreyWall,$0001                                 ;B481D3;
    dw $FFFF
    db $00                                                               ;B481D9;

EnemySetName_BowlingAlleyPath:
    db "SF1_07 "                                                         ;B481DA;

EnemySets_BowlingAlleyPath:
    dw EnemyHeaders_Waver,$0001                                          ;B481E1;
    dw EnemyHeaders_Choot,$0007                                          ;B481E5;
    dw $FFFF
    db $00                                                               ;B481EB;

EnemySetName_RedBinstarElev:
    db "SF1_16 "                                                         ;B481EC;

EnemySets_RedBinstarElev:
    dw $FFFF                                                             ;B481F3;
    db $00                                                               ;B481F5;

EnemySetName_GauntletETank:
    db "SF1_17 "                                                         ;B481F6;

EnemySets_GauntletETank:
    dw EnemyHeaders_YappingMaw,$0001                                     ;B481FD;
    dw EnemyHeaders_Zebbo,$0002                                          ;B48201;
    dw $FFFF
    db $00                                                               ;B48207;

EnemySetName_Pit_0:
    db "sf2_01 "                                                         ;B48208;

EnemySets_Pit_0:
    dw EnemyHeaders_Sbug,$0007                                           ;B4820F;
    dw EnemyHeaders_FaceBlock,$0007                                      ;B48213;
    dw $FFFF
    db $00                                                               ;B48219;

EnemySetName_CrabMaze:
    db "SF1_12 "                                                         ;B4821A;

EnemySets_CrabMaze:
    dw EnemyHeaders_Sciser,$0007                                         ;B48221;
    dw EnemyHeaders_Puyo,$0007                                           ;B48225;
    dw $FFFF
    db $00                                                               ;B4822B;

EnemySetName_CrateriaTube:
    db "SF1_14 "                                                         ;B4822C;

EnemySets_CrateriaTube:
    dw $FFFF                                                             ;B48233;
    db $00                                                               ;B48235;

EnemySetName_ForgottenHighwayKagos:
    db "SF1_11 "                                                         ;B48236;

EnemySets_ForgottenHighwayKagos:
    dw EnemyHeaders_Kago,$0001                                           ;B4823D;
    dw $FFFF
    db $00                                                               ;B48243;

EnemySetName_ElevToBlueBrinstar:
    db "sf2_02 "                                                         ;B48244;

EnemySets_ElevToBlueBrinstar:
    dw $FFFF                                                             ;B4824B;
    db $00                                                               ;B4824D;

EnemySetName_ForgottenHighwayElev:
    db "SF1_09 "                                                         ;B4824E;

EnemySets_ForgottenHighwayElev:
    dw $FFFF                                                             ;B48255;
    db $00                                                               ;B48257;

EnemySetName_PreMapFlyway:
    db "sf2_05 "                                                         ;B48258;

EnemySets_PreMapFlyway:
    dw EnemyHeaders_Mellow,$0001                                         ;B4825F;
    dw EnemyHeaders_Rio,$0002                                            ;B48263;
    dw $FFFF
    db $00                                                               ;B48269;

EnemySetName_LowerMushrooms:
    db "sf2_08 "                                                         ;B4826A;

EnemySets_LowerMushrooms:
    dw EnemyHeaders_Kago,$0002                                           ;B48271;
    dw EnemyHeaders_MZoomer,$0003                                        ;B48275;
    dw $FFFF
    db $00                                                               ;B4827B;

EnemySetName_LandingSite_3:
    db "sf1_00 "                                                         ;B4827C;

EnemySets_LandingSite_3:
    dw EnemyHeaders_ShipTop,$0002                                        ;B48283;
    dw EnemyHeaders_ShipBottomEntrance,$0007                             ;B48287;
    dw $FFFF
    db $00                                                               ;B4828D;

EnemySetName_Parlor_2:
    db "sf1_02 "                                                         ;B4828E;

EnemySets_Parlor_2:
    dw EnemyHeaders_Sbug,$0007                                           ;B48295;
    dw $FFFF
    db $00                                                               ;B4829B;

EnemySetName_BombTorizo_2:
    db "sf2_03 "                                                         ;B4829C;

EnemySets_BombTorizo_2:
    dw EnemyHeaders_EtecoonEscape,$0001                                  ;B482A3;
    dw EnemyHeaders_DachoraEscape,$0007                                  ;B482A7;
    dw $FFFF
    db $00                                                               ;B482AD;

EnemySetName_Flyway_2:
    db "sf2_04 "                                                         ;B482AE;

EnemySets_Flyway_2:
    dw $FFFF                                                             ;B482B5;
    db $00                                                               ;B482B7;

EnemySetName_CrateriaKihunter:
    db "SF1_08 "                                                         ;B482B8;

EnemySets_CrateriaKihunter:
    dw EnemyHeaders_KihunterGreen,$0001                                  ;B482BF;
    dw EnemyHeaders_Sciser,$0002                                         ;B482C3;
    dw EnemyHeaders_Zero,$0002                                           ;B482C7;
    dw $FFFF
    db $00                                                               ;B482CD;

EnemySetName_BrinstarPreMap:
    db "bl1_02 "                                                         ;B482CE;

EnemySets_BrinstarPreMap:
    dw EnemyHeaders_Sidehopper,$0001                                     ;B482D5;
    dw EnemyHeaders_Zeela,$0002                                          ;B482D9;
    dw $FFFF
    db $00                                                               ;B482DF;

EnemySetName_GreenBrinstarMap:
    db "bl1_05 "                                                         ;B482E0;

EnemySets_GreenBrinstarMap:
    dw $FFFF                                                             ;B482E7;
    db $00                                                               ;B482E9;

EnemySetName_GreenBrinstarMissileRefill:
    db "bl1_07 "                                                         ;B482EA;

EnemySets_GreenBrinstarMissileRefill:
    dw $FFFF                                                             ;B482F1;
    db $00                                                               ;B482F3;

EnemySetName_SporeSpawnKihunters:
    db "BL1_10 "                                                         ;B482F4;

EnemySets_SporeSpawnKihunters:
    dw EnemyHeaders_KihunterGreen,$0007                                  ;B482FB;
    dw $FFFF
    db $00                                                               ;B48301;

EnemySetName_EtecoonSuper:
    db "BL1_20 "                                                         ;B48302;

EnemySets_EtecoonSuper:
    dw $FFFF                                                             ;B48309;
    db $00                                                               ;B4830B;

EnemySetName_DachoraEnergyRefill:
    db "BL1_21 "                                                         ;B4830C;

EnemySets_DachoraEnergyRefill:
    dw EnemyHeaders_FaceBlock,$0001                                      ;B48313;
    dw $FFFF
    db $00                                                               ;B48319;

EnemySetName_SporeSpawnFarming:
    db "BL1_22 "                                                         ;B4831A;

EnemySets_SporeSpawnFarming:
    dw EnemyHeaders_Zeb,$0001                                            ;B48321;
    dw EnemyHeaders_Zeela,$0002                                          ;B48325;
    dw $FFFF
    db $00                                                               ;B4832B;

EnemySetName_Statues:
    db "BL2_19 "                                                         ;B4832C;

EnemySets_Statues:
    dw EnemyHeaders_TourianStatue,$0001                                  ;B48333;
    dw EnemyHeaders_TourianStatueGhost,$D003                             ;B48337;
    dw $FFFF
    db $00                                                               ;B4833D;

EnemySetName_HopperETank:
    db "BL1_26 "                                                         ;B4833E;

EnemySets_HopperETank:
    dw $FFFF                                                             ;B48345;
    db $00                                                               ;B48347;

EnemySetName_BetaPowerBomb:
    db "BL2_05 "                                                         ;B48348;

EnemySets_BetaPowerBomb:
    dw EnemyHeaders_YappingMaw,$0001                                     ;B4834F;
    dw EnemyHeaders_SidehopperLarge,$0002                                ;B48353;
    dw $FFFF
    db $00                                                               ;B48359;

EnemySetName_WaterwayETank:
    db "BL1_23 "                                                         ;B4835A;

EnemySets_WaterwayETank:
    dw EnemyHeaders_Skultera,$0001                                       ;B48361;
    dw EnemyHeaders_Puyo,$0002                                           ;B48365;
    dw EnemyHeaders_Zero,$0003                                           ;B48369;
    dw $FFFF
    db $00                                                               ;B4836F;

EnemySetName_ConstructionZone_1:
    db "BL1_15A"                                                         ;B48370;

EnemySets_ConstructionZone_1:
    dw EnemyHeaders_Zoomer,$0001                                         ;B48377;
    dw EnemyHeaders_FaceBlock,$0002                                      ;B4837B;
    dw $FFFF
    db $00                                                               ;B48381;

EnemySetName_BlueBrinstarETank_1:
    db "BL1_16A"                                                         ;B48382;

EnemySets_BlueBrinstarETank_1:
    dw EnemyHeaders_FaceBlock,$0001                                      ;B48389;
    dw EnemyHeaders_Zoomer,$0002                                         ;B4838D;
    dw EnemyHeaders_Skree,$0003                                          ;B48391;
    dw EnemyHeaders_Rio,$0007                                            ;B48395;
    dw $FFFF
    db $00                                                               ;B4839B;

EnemySetName_NoobBridge:
    db "BL1_17 "                                                         ;B4839C;

EnemySets_NoobBridge:
    dw EnemyHeaders_Cacatac,$0001                                        ;B483A3;
    dw EnemyHeaders_Zeela,$0002                                          ;B483A7;
    dw $FFFF
    db $00                                                               ;B483AD;

EnemySetName_MorphBall_1:
    db "BL1_14A"                                                         ;B483AE;

EnemySets_MorphBall_1:
    dw EnemyHeaders_SidehopperLarge,$0002                                ;B483B5;
    dw EnemyHeaders_FaceBlock,$0007                                      ;B483B9;
    dw $FFFF
    db $00                                                               ;B483BF;

EnemySetName_WarehouseSave:
    db "BL2_22 "                                                         ;B483C0;

EnemySets_WarehouseSave:
    dw $FFFF                                                             ;B483C7;
    db $00                                                               ;B483C9;

EnemySetName_MorphBall_0:
    db "BL1_14 "                                                         ;B483CA;

EnemySets_MorphBall_0:
    dw EnemyHeaders_Eye,$0007                                            ;B483D1;
    dw EnemyHeaders_FaceBlock,$0007                                      ;B483D5;
    dw $FFFF
    db $00                                                               ;B483DB;

EnemySetName_WarehouseZeela:
    db "BL2_10 "                                                         ;B483DC;

EnemySets_WarehouseZeela:
    dw EnemyHeaders_Zeela,$0001                                          ;B483E3;
    dw $FFFF
    db $00                                                               ;B483E9;

EnemySetName_RedTower:
    db "BL2_00 "                                                         ;B483EA;

EnemySets_RedTower:
    dw EnemyHeaders_Ripper,$0001                                         ;B483F1;
    dw EnemyHeaders_Beetom,$0002                                         ;B483F5;
    dw EnemyHeaders_Geega,$0003                                          ;B483F9;
    dw $FFFF
    db $00                                                               ;B483FF;

EnemySetName_BlueBrinstarBoulders:
    db "bl1_28 "                                                         ;B48400;

EnemySets_BlueBrinstarBoulders:
    dw EnemyHeaders_Boulder,$0001                                        ;B48407;
    dw $FFFF
    db $00                                                               ;B4840D;

EnemySetName_BillyMays:
    db "bl1_29 "                                                         ;B4840E;

EnemySets_BillyMays:
    dw $FFFF                                                             ;B48415;
    db $00                                                               ;B48417;

EnemySetName_BigPinkSaveRoom:
    db "bl1_27 "                                                         ;B48418;

EnemySets_BigPinkSaveRoom:
    dw $FFFF                                                             ;B4841F;
    db $00                                                               ;B48421;

EnemySetName_BigPink:
    db "BL1_09 "                                                         ;B48422;

EnemySets_BigPink:
    dw EnemyHeaders_Rio,$0001                                            ;B48429;
    dw EnemyHeaders_Sidehopper,$0002                                     ;B4842D;
    dw EnemyHeaders_Zeb,$0003                                            ;B48431;
    dw $FFFF
    db $00                                                               ;B48437;

EnemySetName_EtecoonSave:
    db "bl1_31 "                                                         ;B48438;

EnemySets_EtecoonSave:
    dw $FFFF                                                             ;B4843F;
    db $00                                                               ;B48441;

EnemySetName_BelowSpazer:
    db "BL2_08 "                                                         ;B48442;

EnemySets_BelowSpazer:
    dw EnemyHeaders_YappingMaw,$0001                                     ;B48449;
    dw EnemyHeaders_Cacatac,$0002                                        ;B4844D;
    dw $FFFF
    db $00                                                               ;B48453;

EnemySetName_GreenBrinstarSave:
    db "bl1_30 "                                                         ;B48454;

EnemySets_GreenBrinstarSave:
    dw $FFFF                                                             ;B4845B;
    db $00                                                               ;B4845D;

EnemySetName_Spazer:
    db "BL2_09 "                                                         ;B4845E;

EnemySets_Spazer:
    dw $FFFF                                                             ;B48465;
    db $00                                                               ;B48467;

EnemySetName_PinkBrinstarPowerBombs:
    db "BL1_12 "                                                         ;B48468;

EnemySets_PinkBrinstarPowerBombs:
    dw EnemyHeaders_ShutterShootable,$0001                               ;B4846F;
    dw EnemyHeaders_Metaree,$0001                                        ;B48473;
    dw EnemyHeaders_SidehopperLarge,$0002                                ;B48477;
    dw $FFFF
    db $00                                                               ;B4847D;

EnemySetName_RedTowerRefill:
    db "BL2_17 "                                                         ;B4847E;

EnemySets_RedTowerRefill:
    dw $FFFF                                                             ;B48485;
    db $00                                                               ;B48487;

EnemySetName_KraidRefill:
    db "BL2_18 "                                                         ;B48488;

EnemySets_KraidRefill:
    dw $FFFF                                                             ;B4848F;
    db $00                                                               ;B48491;

EnemySetName_VariaSuit:
    db "BL2_21 "                                                         ;B48492;

EnemySets_VariaSuit:
    dw $FFFF                                                             ;B48499;
    db $00                                                               ;B4849B;

EnemySetName_RedBrinstarSave:
    db "BL2_23 "                                                         ;B4849C;

EnemySets_RedBrinstarSave:
    dw $FFFF                                                             ;B484A3;
    db $00                                                               ;B484A5;

EnemySetName_BlueBrinstarETank_0:
    db "BL1_16 "                                                         ;B484B0;

EnemySets_BlueBrinstarETank_0:
    dw EnemyHeaders_Eye,$0007                                            ;B484B7;
    dw EnemyHeaders_FaceBlock,$0007                                      ;B484BB;
    dw $FFFF
    db $00                                                               ;B484C1;

EnemySetName_GreenBrinstarFirefleas:
    db "bl1_06 "                                                         ;B484C2;

EnemySets_GreenBrinstarFirefleas:
    dw EnemyHeaders_Fireflea,$0002                                       ;B484C9;
    dw $FFFF
    db $00                                                               ;B484CF;

EnemySetName_GreenBrinstarBeetoms:
    db "BL1_18 "                                                         ;B484D0;

EnemySets_GreenBrinstarBeetoms:
    dw EnemyHeaders_Beetom,$0001                                         ;B484D7;
    dw $FFFF
    db $00                                                               ;B484DD;

EnemySetName_EtecoonETank:
    db "BL1_19 "                                                         ;B484DE;

EnemySets_EtecoonETank:
    dw EnemyHeaders_Zebbo,$0001                                          ;B484E5;
    dw EnemyHeaders_Beetom,$0002                                         ;B484E9;
    dw $FFFF
    db $00                                                               ;B484EF;

EnemySetName_PinkBrinstarHoppers:
    db "BL1_25 "                                                         ;B484F0;

EnemySets_PinkBrinstarHoppers:
    dw EnemyHeaders_SidehopperLarge,$0001                                ;B484F7;
    dw EnemyHeaders_Sidehopper,$0002                                     ;B484FB;
    dw EnemyHeaders_ShutterShootable,$0003                               ;B484FF;
    dw $FFFF
    db $00                                                               ;B48505;

EnemySetName_WarehouseETank:
    db "BL2_11 "                                                         ;B48506;

EnemySets_WarehouseETank:
    dw EnemyHeaders_Beetom,$0002                                         ;B48511;
    dw $FFFF
    db $00                                                               ;B48517;

EnemySetName_WarehouseEntrance:
    db "BL2_20 "                                                         ;B48522;

EnemySets_WarehouseEntrance:
    dw $FFFF                                                             ;B48529;
    db $00                                                               ;B4852B;

EnemySetName_WarehouseKihunter:
    db "BL2_12 "                                                         ;B4852C;

EnemySets_WarehouseKihunter:
    dw EnemyHeaders_KihunterGreen,$0001                                  ;B48533;
    dw $FFFF
    db $00                                                               ;B48539;

EnemySetName_GreenBrinstarMainShaft:
    db "bl1_00 "                                                         ;B4853A;

EnemySets_GreenBrinstarMainShaft:
    dw EnemyHeaders_Etecoon,$0001                                        ;B48541;
    dw EnemyHeaders_Zeela,$0002                                          ;B48545;
    dw EnemyHeaders_Ripper2,$0003                                        ;B48549;
    dw $FFFF
    db $00                                                               ;B4854F;

EnemySetName_SporeSpawnSuper:
    db "bl1_01 "                                                         ;B48550;

EnemySets_SporeSpawnSuper:
    dw EnemyHeaders_Zeb,$0001                                            ;B48557;
    dw $FFFF
    db $00                                                               ;B4855D;

EnemySetName_EarlySupers:
    db "bl1_03 "                                                         ;B4855E;

EnemySets_EarlySupers:
    dw EnemyHeaders_Sidehopper,$0001                                     ;B48565;
    dw EnemyHeaders_ShutterGrowing,$0002                                 ;B48569;
    dw EnemyHeaders_Waver,$0003                                          ;B4856D;
    dw EnemyHeaders_Zeb,$0007                                            ;B48571;
    dw $FFFF
    db $00                                                               ;B48577;

EnemySetName_RedBrinstarFirefleas:
    db "BL2_01 "                                                         ;B48578;

EnemySets_RedBrinstarFirefleas:
    dw EnemyHeaders_Fireflea,$0001                                       ;B4857F;
    dw EnemyHeaders_Waver,$0002                                          ;B48583;
    dw EnemyHeaders_YappingMaw,$0003                                     ;B48587;
    dw $FFFF
    db $00                                                               ;B4858D;

EnemySetName_ConstructionZone_0:
    db "BL1_15 "                                                         ;B4858E;

EnemySets_ConstructionZone_0:
    dw EnemyHeaders_Sbug,$0007                                           ;B48595;
    dw EnemyHeaders_FaceBlock,$0007                                      ;B48599;
    dw $FFFF
    db $00                                                               ;B4859F;

EnemySetName_GreenHillZone:
    db "BL1_13 "                                                         ;B485A0;

EnemySets_GreenHillZone:
    dw EnemyHeaders_Sidehopper,$0001                                     ;B485A7;
    dw EnemyHeaders_Geega,$0002                                          ;B485AB;
    dw $FFFF
    db $00                                                               ;B485B1;

EnemySetName_Dachora:
    db "BL1_08 "                                                         ;B485B2;

EnemySets_Dachora:
    dw EnemyHeaders_Zeela,$0001                                          ;B485B9;
    dw EnemyHeaders_Metaree,$0002                                        ;B485BD;
    dw EnemyHeaders_Rio,$0003                                            ;B485C1;
    dw EnemyHeaders_Dachora,$0007                                        ;B485C5;
    dw $FFFF
    db $00                                                               ;B485CB;

EnemySetName_Hellway:
    db "BL2_03 "                                                         ;B485CC;

EnemySets_Hellway:
    dw EnemyHeaders_Zeela,$0001                                          ;B485D3;
    dw EnemyHeaders_Zebbo,$0002                                          ;B485D7;
    dw $FFFF
    db $00                                                               ;B485DD;

EnemySetName_FirstMissile:
    db "BL1_24 "                                                         ;B485DE;

EnemySets_FirstMissile:
    dw $FFFF                                                             ;B485E5;
    db $00                                                               ;B485E7;

EnemySetName_Kraid:
    db "BL2_15 "                                                         ;B485E8;

EnemySets_Kraid:
    dw EnemyHeaders_Kraid,$0007                                          ;B485EF;
    dw $FFFF
    db $00                                                               ;B485F5;

EnemySetName_BrinstarReserveTank:
    db "bl1_04 "                                                         ;B485F6;

EnemySets_BrinstarReserveTank:
    dw $FFFF                                                             ;B485FD;
    db $00                                                               ;B485FF;

EnemySetName_XrayScope:
    db "BL2_02 "                                                         ;B48600;

EnemySets_XrayScope:
    dw EnemyHeaders_ShutterShootable,$0001                               ;B48607;
    dw $FFFF
    db $00                                                               ;B4860D;

EnemySetName_StatuesHallway:
    db "BL2_16 "                                                         ;B4860E;

EnemySets_StatuesHallway:
    dw $FFFF                                                             ;B48615;
    db $00                                                               ;B48617;

EnemySetName_AlphaPowerBomb:
    db "BL2_06 "                                                         ;B48618;

EnemySets_AlphaPowerBomb:
    dw EnemyHeaders_Boyon,$0001                                          ;B4861F;
    dw $FFFF
    db $00                                                               ;B48625;

EnemySetName_KraidEyeDoor:
    db "BL2_14 "                                                         ;B48626;

EnemySets_KraidEyeDoor:
    dw EnemyHeaders_Zeb,$0001                                            ;B4862D;
    dw EnemyHeaders_Sbug,$0002                                           ;B48631;
    dw $FFFF
    db $00                                                               ;B48637;

EnemySetName_Caterpillar:
    db "BL2_04 "                                                         ;B48638;

EnemySets_Caterpillar:
    dw EnemyHeaders_Zero,$0002                                           ;B4863F;
    dw EnemyHeaders_Cacatac,$0003                                        ;B48643;
    dw $FFFF
    db $00                                                               ;B48649;

EnemySetName_MiniKraid:
    db "BL2_13 "                                                         ;B4864A;

EnemySets_MiniKraid:
    dw EnemyHeaders_PirateGreenWalking,$0001                             ;B48651;
    dw EnemyHeaders_MiniKraid,$0003                                      ;B48655;
    dw $FFFF
    db $00                                                               ;B4865B;

EnemySetName_SporeSpawn:
    db "BL1_11 "                                                         ;B4865C;

EnemySets_SporeSpawn:
    dw EnemyHeaders_SporeSpawn,$0001                                     ;B48663;
    dw $FFFF
    db $00                                                               ;B48669;

EnemySetName_SkreeBoost:
    db "BL2_07 "                                                         ;B4866A;

EnemySets_SkreeBoost:
    dw EnemyHeaders_Skree,$0001                                          ;B48671;
    dw EnemyHeaders_Boyon,$0007                                          ;B48675;
    dw $FFFF
    db $00                                                               ;B4867B;

EnemySetName_GrappleTutorial3:
    db "NO1_19 "                                                         ;B4867C;

EnemySets_GrappleTutorial3:
    dw EnemyHeaders_Gamet,$0001                                          ;B48683;
    dw EnemyHeaders_Puyo,$0002                                           ;B48687;
    dw $FFFF
    db $00                                                               ;B4868D;

EnemySetName_PostCrocShaft:
    db "NO1_17 "                                                         ;B4868E;

EnemySets_PostCrocShaft:
    dw EnemyHeaders_Viola,$0001                                          ;B48695;
    dw $FFFF
    db $00                                                               ;B4869B;

EnemySetName_MetalPirates:
    db "NO2_18 "                                                         ;B4869C;

EnemySets_MetalPirates:
    dw EnemyHeaders_PirateGoldNinja,$0001                                ;B486A3;
    dw $FFFF
    db $00                                                               ;B486A9;

EnemySetName_AcidStatue:
    db "NO2_00 "                                                         ;B486AA;

EnemySets_AcidStatue:
    dw EnemyHeaders_Chozo,$0001                                          ;B486B1;
    dw EnemyHeaders_Magdollite,$0003                                     ;B486B5;
    dw EnemyHeaders_Holtz,$0007                                          ;B486B9;
    dw $FFFF
    db $00                                                               ;B486BF;

EnemySetName_PurpleFarming:
    db "NO1_44 "                                                         ;B486C0;

EnemySets_PurpleFarming:
    dw EnemyHeaders_Gamet,$0001                                          ;B486C7;
    dw $FFFF
    db $00                                                               ;B486CD;

EnemySetName_IceBeamGate:
    db "NO1_04 "                                                         ;B486CE;

EnemySets_IceBeamGate:
    dw EnemyHeaders_ShutterGrowing,$0001                                 ;B486D5;
    dw EnemyHeaders_Dessgeega,$0002                                      ;B486D9;
    dw EnemyHeaders_Mella,$0003                                          ;B486DD;
    dw EnemyHeaders_Sova,$0007                                           ;B486E1;
    dw $FFFF
    db $00                                                               ;B486E7;

EnemySetName_SpikyAcidSnakesTunnel:
    db "NO1_42 "                                                         ;B486E8;

EnemySets_SpikyAcidSnakesTunnel:
    dw EnemyHeaders_YappingMaw,$0001                                     ;B486EF;
    dw $FFFF
    db $00                                                               ;B486F5;

EnemySetName_RedKihunterShaft:
    db "NO2_16 "                                                         ;B486F6;

EnemySets_RedKihunterShaft:
    dw EnemyHeaders_KihunterRed,$0001                                    ;B486FD;
    dw $FFFF
    db $00                                                               ;B48707;

EnemySetName_FastRipper:
    db "NO2_03 "                                                         ;B48708;

EnemySets_FastRipper:
    dw EnemyHeaders_Ripper2,$0001                                        ;B4870F;
    dw $FFFF
    db $00                                                               ;B48715;

EnemySetName_WaveBeam:
    db "NO1_31 "                                                         ;B48716;

EnemySets_WaveBeam:
    dw $FFFF                                                             ;B4871D;
    db $00                                                               ;B4871F;

EnemySetName_FastPillarsSetup:
    db "NO2_07 "                                                         ;B48720;

EnemySets_FastPillarsSetup:
    dw EnemyHeaders_PirateGoldWall,$0001                                 ;B48727;
    dw EnemyHeaders_PirateGoldWalking,$0002                              ;B4872B;
    dw EnemyHeaders_Viola,$0003                                          ;B4872F;
    dw $FFFF
    db $00                                                               ;B48735;

EnemySetName_LowerNorfairElev:
    db "NO1_38 "                                                         ;B48736;

EnemySets_LowerNorfairElev:
    dw $FFFF                                                             ;B4873D;
    db $00                                                               ;B4873F;

EnemySetName_LNSave:
    db "NO2_23 "                                                         ;B48740;

EnemySets_LNSave:
    dw $FFFF                                                             ;B48747;
    db $00                                                               ;B48749;

EnemySetName_UpperNorfairRefill:
    db "NO1_43 "                                                         ;B4874A;

EnemySets_UpperNorfairRefill:
    dw $FFFF                                                             ;B48751;
    db $00                                                               ;B48753;

EnemySetName_NorfairMap:
    db "NO1_46 "                                                         ;B48754;

EnemySets_NorfairMap:
    dw $FFFF                                                             ;B4875B;
    db $00                                                               ;B4875D;

EnemySetName_MickeyMouse:
    db "NO2_09 "                                                         ;B4875E;

EnemySets_MickeyMouse:
    dw EnemyHeaders_DessgeegaLarge,$0001                                 ;B48765;
    dw EnemyHeaders_Multiviola,$0002                                     ;B48769;
    dw $FFFF
    db $00                                                               ;B4876F;

EnemySetName_GTEnergyRefill:
    db "NO2_04 "                                                         ;B48770;

EnemySets_GTEnergyRefill:
    dw $FFFF                                                             ;B48777;
    db $00                                                               ;B48779;

EnemySetName_Ridley:
    db "NO2_05 "                                                         ;B4877A;

EnemySets_Ridley:
    dw EnemyHeaders_Ridley,$0001                                         ;B48781;
    dw EnemyHeaders_RidleyExplosion,$E001                                ;B48785;
    dw $FFFF
    db $00                                                               ;B4878B;

EnemySetName_PostCrocPowerBombs:
    db "NO1_16 "                                                         ;B4878C;

EnemySets_PostCrocPowerBombs:
    dw $FFFF                                                             ;B48793;
    db $00                                                               ;B48795;

EnemySetName_IceBeam:
    db "NO1_06 "                                                         ;B48796;

EnemySets_IceBeam:
    dw $FFFF                                                             ;B4879D;
    db $00                                                               ;B4879F;

EnemySetName_HiJumpBoots:
    db "NO1_11 "                                                         ;B487A0;

EnemySets_HiJumpBoots:
    dw $FFFF                                                             ;B487A7;
    db $00                                                               ;B487A9;

EnemySetName_PostCrocSave:
    db "NO1_15 "                                                         ;B487AA;

EnemySets_PostCrocSave:
    dw $FFFF                                                             ;B487B1;
    db $00                                                               ;B487B3;

EnemySetName_FrogSpeedway:
    db "NO1_48 "                                                         ;B487B4;

EnemySets_FrogSpeedway:
    dw EnemyHeaders_Beetom,$0001                                         ;B487BB;
    dw $FFFF
    db $00                                                               ;B487C1;

EnemySetName_RisingTide:
    db "NO1_40 "                                                         ;B487C2;

EnemySets_RisingTide:
    dw EnemyHeaders_Squeept,$0001                                        ;B487C9;
    dw EnemyHeaders_Sova,$0002                                           ;B487CD;
    dw EnemyHeaders_Dragon,$0003                                         ;B487D1;
    dw $FFFF
    db $00                                                               ;B487D7;

EnemySetName_PostCrocFarming:
    db "NO1_14 "                                                         ;B487D8;

EnemySets_PostCrocFarming:
    dw EnemyHeaders_Gamet,$0001                                          ;B487DF;
    dw EnemyHeaders_GRipper,$0002                                        ;B487E3;
    dw EnemyHeaders_Kamer2,$0003                                         ;B487E7;
    dw $FFFF
    db $00                                                               ;B487ED;

EnemySetName_WorstRoomInTheGame:
    db "NO2_12 "                                                         ;B487EE;

EnemySets_WorstRoomInTheGame:
    dw EnemyHeaders_Namihe,$0001                                         ;B487F5;
    dw EnemyHeaders_PirateGoldWall,$0002                                 ;B487F9;
    dw EnemyHeaders_PirateGoldWalking,$0003                              ;B487FD;
    dw $FFFF
    db $00                                                               ;B48803;

EnemySetName_DoubleChamber:
    db "NO1_30 "                                                         ;B48804;

EnemySets_DoubleChamber:
    dw EnemyHeaders_Fune,$0001                                           ;B4880B;
    dw EnemyHeaders_Kamer,$0002                                          ;B4880F;
    dw EnemyHeaders_Kago,$0003                                           ;B48813;
    dw EnemyHeaders_GRipper,$0007                                        ;B48817;
    dw $FFFF
    db $00                                                               ;B4881D;

EnemySetName_GrappleBeam:
    db "NO1_23 "                                                         ;B4881E;

EnemySets_GrappleBeam:
    dw EnemyHeaders_Multiviola,$0001                                     ;B48825;
    dw $FFFF
    db $00                                                               ;B4882B;

EnemySetName_RedPirateShaft:
    db "NO1_49 "                                                         ;B4882C;

EnemySets_RedPirateShaft:
    dw EnemyHeaders_PirateRedWalking,$0001                               ;B48833;
    dw EnemyHeaders_MZoomer,$0003                                        ;B48837;
    dw $FFFF
    db $00                                                               ;B4883D;

EnemySetName_CrocomireSpeedway:
    db "NO1_09 "                                                         ;B4883E;

EnemySets_CrocomireSpeedway:
    dw EnemyHeaders_PirateRedWalking,$0001                               ;B48845;
    dw EnemyHeaders_Multiviola,$0002                                     ;B48849;
    dw EnemyHeaders_Cacatac,$0003                                        ;B4884D;
    dw EnemyHeaders_Sova,$0003                                           ;B48851;
    dw $FFFF
    db $00                                                               ;B48857;

EnemySetName_Plowerhouse:
    db "NO2_11 "                                                         ;B48858;

EnemySets_Plowerhouse:
    dw EnemyHeaders_Zebbo,$0001                                          ;B4885F;
    dw EnemyHeaders_Holtz,$0007                                          ;B48863;
    dw $FFFF
    db $00                                                               ;B48869;

EnemySetName_LNFireflea:
    db "NO2_22 "                                                         ;B4886A;

EnemySets_LNFireflea:
    dw EnemyHeaders_Fireflea,$0001                                       ;B48871;
    dw EnemyHeaders_Boulder,$0002                                        ;B48875;
    dw EnemyHeaders_Fune,$0003                                           ;B48879;
    dw $FFFF
    db $00                                                               ;B4887F;

EnemySetName_MagdolliteTunnel:
    db "NO1_35 "                                                         ;B48880;

EnemySets_MagdolliteTunnel:
    dw EnemyHeaders_Multiviola,$0001                                     ;B48887;
    dw EnemyHeaders_Magdollite,$0007                                     ;B4888B;
    dw $FFFF
    db $00                                                               ;B48891;

EnemySetName_LavaDive:
    db "NO1_37 "                                                         ;B4889C;

EnemySets_LavaDive:
    dw EnemyHeaders_Namihe,$0001                                         ;B488A3;
    dw $FFFF
    db $00                                                               ;B488A9;

EnemySetName_Pillar:
    db "NO2_10 "                                                         ;B488AA;

EnemySets_Pillar:
    dw EnemyHeaders_Puromi,$0007                                         ;B488B1;
    dw $FFFF
    db $00                                                               ;B488B7;

EnemySetName_CrocomireEscape:
    db "NO1_12 "                                                         ;B488B8;

EnemySets_CrocomireEscape:
    dw EnemyHeaders_Dragon,$0001                                         ;B488BF;
    dw EnemyHeaders_Geruta,$0002                                         ;B488C3;
    dw $FFFF
    db $00                                                               ;B488C9;

EnemySetName_LNSpringBallMaze:
    db "NO2_14 "                                                         ;B488CA;

EnemySets_LNSpringBallMaze:
    dw EnemyHeaders_Alcoon,$0001                                         ;B488D1;
    dw $FFFF
    db $00                                                               ;B488D7;

EnemySetName_LNEscapePowerBombs:
    db "NO2_15 "                                                         ;B488D8;

EnemySets_LNEscapePowerBombs:
    dw $FFFF                                                             ;B488DF;
    db $00                                                               ;B488E1;

EnemySetName_PurpleShaft:
    db "NO1_36 "                                                         ;B488E2;

EnemySets_PurpleShaft:
    dw $FFFF                                                             ;B488E9;
    db $00                                                               ;B488EB;

EnemySetName_RidleyETank:
    db "NO2_20 "                                                         ;B488EC;

EnemySets_RidleyETank:
    dw $FFFF                                                             ;B488F3;
    db $00                                                               ;B488F5;

EnemySetName_ScrewAttack:
    db "NO2_21 "                                                         ;B488F6;

EnemySets_ScrewAttack:
    dw $FFFF                                                             ;B488FD;
    db $00                                                               ;B488FF;

EnemySetName_GreenBubblesMissiles:
    db "NO1_25 "                                                         ;B48900;

EnemySets_GreenBubblesMissiles:
    dw EnemyHeaders_ShutterShootable,$0007                               ;B48907;
    dw EnemyHeaders_Sova,$0002                                           ;B4890B;
    dw EnemyHeaders_Geruta,$0003                                         ;B4890F;
    dw $FFFF
    db $00                                                               ;B48915;

EnemySetName_Amphitheatre:
    db "NO2_13 "                                                         ;B48916;

EnemySets_Amphitheatre:
    dw EnemyHeaders_PirateGoldWalking,$0007                              ;B4891D;
    dw $FFFF
    db $00                                                               ;B48923;

EnemySetName_CathedralEntrance:
    db "NO1_02 "                                                         ;B48924;

EnemySets_CathedralEntrance:
    dw EnemyHeaders_Sova,$0001                                           ;B4892B;
    dw EnemyHeaders_Dessgeega,$0002                                      ;B4892F;
    dw $FFFF
    db $00                                                               ;B48935;

EnemySetName_MainHall:
    db "NO2_01 "                                                         ;B48936;

EnemySets_MainHall:
    dw EnemyHeaders_Hibashi,$0001                                        ;B4893D;
    dw EnemyHeaders_Dragon,$0007                                         ;B48941;
    dw EnemyHeaders_Gamet,$0007                                          ;B48945;
    dw $FFFF
    db $00                                                               ;B4894B;

EnemySetName_PostCrocJump:
    db "NO1_20 "                                                         ;B4894C;

EnemySets_PostCrocJump:
    dw EnemyHeaders_Mella,$0001                                          ;B48953;
    dw EnemyHeaders_GRipper,$0002                                        ;B48957;
    dw EnemyHeaders_Kamer2,$0003                                         ;B4895B;
    dw $FFFF
    db $00                                                               ;B48961;

EnemySetName_FrogSave:
    db "NO1_50 "                                                         ;B48962;

EnemySets_FrogSave:
    dw $FFFF                                                             ;B48969;
    db $00                                                               ;B4896B;

EnemySetName_CrocomireSave:
    db "NO1_51 "                                                         ;B4896C;

EnemySets_CrocomireSave:
    dw $FFFF                                                             ;B48973;
    db $00                                                               ;B48975;

EnemySetName_CrumbleShaft:
    db "NO1_08 "                                                         ;B48976;

EnemySets_CrumbleShaft:
    dw EnemyHeaders_Sova,$0001                                           ;B4897D;
    dw $FFFF
    db $00                                                               ;B48983;

EnemySetName_Wasteland:
    db "NO2_17 "                                                         ;B48984;

EnemySets_Wasteland:
    dw EnemyHeaders_Hibashi,$0001                                        ;B4898B;
    dw EnemyHeaders_DessgeegaLarge,$0002                                 ;B4898F;
    dw EnemyHeaders_ShutterShootable,$0003                               ;B48993;
    dw EnemyHeaders_KzanTop,$0007                                        ;B48997;
    dw $FFFF
    db $00                                                               ;B4899D;

EnemySetName_AcidSnakesTunnel:
    db "NO1_41 "                                                         ;B4899E;

EnemySets_AcidSnakesTunnel:
    dw EnemyHeaders_Dragon,$0001                                         ;B489A5;
    dw EnemyHeaders_Gamet,$0002                                          ;B489A9;
    dw $FFFF
    db $00                                                               ;B489AF;

EnemySetName_GrappleTutorial1:
    db "NO1_22 "                                                         ;B489B0;

EnemySets_GrappleTutorial1:
    dw $FFFF                                                             ;B489B7;
    db $00                                                               ;B489B9;

EnemySetName_BubbleMountainSave:
    db "NO1_47 "                                                         ;B489BA;

EnemySets_BubbleMountainSave:
    dw $FFFF                                                             ;B489C1;
    db $00                                                               ;B489C3;

EnemySetName_HiJumpETank:
    db "NO1_13 "                                                         ;B489C4;

EnemySets_HiJumpETank:
    dw EnemyHeaders_Sova,$0001                                           ;B489CB;
    dw $FFFF
    db $00                                                               ;B489D1;

EnemySetName_BubbleMountain:
    db "NO1_26 "                                                         ;B489D2;

EnemySets_BubbleMountain:
    dw EnemyHeaders_Waver,$0001                                          ;B489D9;
    dw EnemyHeaders_Ripper2,$0001                                        ;B489DD;
    dw EnemyHeaders_Cacatac,$0002                                        ;B489E1;
    dw EnemyHeaders_Sova,$0002                                           ;B489E5;
    dw $FFFF
    db $00                                                               ;B489EB;

EnemySetName_IceBeamAcid:
    db "NO1_00 "                                                         ;B489EC;

EnemySets_IceBeamAcid:
    dw EnemyHeaders_Tripper,$0007                                        ;B489F3;
    dw $FFFF
    db $00                                                               ;B489F9;

EnemySetName_IceBeamTutorial:
    db "NO1_05 "                                                         ;B489FA;

EnemySets_IceBeamTutorial:
    dw EnemyHeaders_Boyon,$0001                                          ;B48A01;
    dw EnemyHeaders_Ripper2,$0002                                        ;B48A05;
    dw $FFFF
    db $00                                                               ;B48A0B;

EnemySetName_PostCrocMissile:
    db "NO1_18 "                                                         ;B48A0C;

EnemySets_PostCrocMissile:
    dw EnemyHeaders_Metaree,$0001                                        ;B48A13;
    dw EnemyHeaders_Gamet,$0002                                          ;B48A17;
    dw $FFFF
    db $00                                                               ;B48A1D;

EnemySetName_Cathedral:
    db "NO1_01 "                                                         ;B48A1E;

EnemySets_Cathedral:
    dw EnemyHeaders_Sova,$0001                                           ;B48A25;
    dw EnemyHeaders_Geruta,$0002                                         ;B48A29;
    dw $FFFF
    db $00                                                               ;B48A2F;

EnemySetName_NorfairReserveTank:
    db "NO1_24 "                                                         ;B48A30;

EnemySets_NorfairReserveTank:
    dw EnemyHeaders_Dragon,$0001                                         ;B48A37;
    dw EnemyHeaders_Sova,$0002                                           ;B48A3B;
    dw $FFFF
    db $00                                                               ;B48A41;

EnemySetName_GrappleTutorial2:
    db "NO1_21 "                                                         ;B48A42;

EnemySets_GrappleTutorial2:
    dw EnemyHeaders_Fune,$0001                                           ;B48A49;
    dw EnemyHeaders_Multiviola,$0002                                     ;B48A4D;
    dw $FFFF
    db $00                                                               ;B48A53;

EnemySetName_IceBeamSnake:
    db "NO1_07 "                                                         ;B48A54;

EnemySets_IceBeamSnake:
    dw EnemyHeaders_Sova,$0001                                           ;B48A5B;
    dw EnemyHeaders_Fune,$0002                                           ;B48A5F;
    dw $FFFF
    db $00                                                               ;B48A65;

EnemySetName_GoldenTorizo:
    db "NO2_02 "                                                         ;B48A66;

EnemySets_GoldenTorizo:
    dw EnemyHeaders_GoldenTorizo,$0001                                   ;B48A6D;
    dw $FFFF
    db $00                                                               ;B48A73;

EnemySetName_SpikyPlatformsTunnel:
    db "NO1_32 "                                                         ;B48A74;

EnemySets_SpikyPlatformsTunnel:
    dw EnemyHeaders_Tripper,$0007                                        ;B48A7B;
    dw EnemyHeaders_ShutterShootable,$0002                               ;B48A7F;
    dw $FFFF
    db $00                                                               ;B48A85;

EnemySetName_SpeedBooster:
    db "NO1_28 "                                                         ;B48A86;

EnemySets_SpeedBooster:
    dw $FFFF                                                             ;B48A8D;
    db $00                                                               ;B48A8F;

EnemySetName_LNFarming:
    db "NO2_06 "                                                         ;B48A90;

EnemySets_LNFarming:
    dw EnemyHeaders_Viola,$0001                                          ;B48A97;
    dw EnemyHeaders_Zebbo,$0007                                          ;B48A9B;
    dw $FFFF
    db $00                                                               ;B48AA1;

EnemySetName_SingleChamber:
    db "NO1_29 "                                                         ;B48AA2;

EnemySets_SingleChamber:
    dw EnemyHeaders_Multiviola,$0001                                     ;B48AA9;
    dw EnemyHeaders_Alcoon,$0002                                         ;B48AAD;
    dw $FFFF
    db $00                                                               ;B48AB3;

EnemySetName_SpeedBoosterHall:
    db "NO1_27 "                                                         ;B48AB4;

EnemySets_SpeedBoosterHall:
    dw EnemyHeaders_Geruta,$0001                                         ;B48ABB;
    dw EnemyHeaders_Metaree,$0002                                        ;B48ABF;
    dw $FFFF
    db $00                                                               ;B48AC5;

EnemySetName_BatCave:
    db "NO1_45 "                                                         ;B48AC6;

EnemySets_BatCave:
    dw EnemyHeaders_Gamet,$0001                                          ;B48ACD;
    dw EnemyHeaders_Skree,$0002                                          ;B48AD1;
    dw $FFFF
    db $00                                                               ;B48AD7;

EnemySetName_KronicBoost:
    db "NO1_34 "                                                         ;B48AD8;

EnemySets_KronicBoost:
    dw EnemyHeaders_Viola,$0001                                          ;B48ADF;
    dw $FFFF
    db $00                                                               ;B48AE5;

EnemySetName_BusinessCenter:
    db "NO1_03 "                                                         ;B48AE6;

EnemySets_BusinessCenter:
    dw EnemyHeaders_Sova,$0002                                           ;B48AED;
    dw $FFFF
    db $00                                                               ;B48AF3;

EnemySetName_ThreeMusketeers:
    db "NO2_19 "                                                         ;B48AF4;

EnemySets_ThreeMusketeers:
    dw EnemyHeaders_Hibashi,$0001                                        ;B48AFB;
    dw EnemyHeaders_KihunterRed,$0002                                    ;B48AFF;
    dw EnemyHeaders_ShutterShootable,$0003                               ;B48B03;
    dw $FFFF
    db $00                                                               ;B48B09;

EnemySetName_Crocomire:
    db "NO1_10 "                                                         ;B48B0A;

EnemySets_Crocomire:
    dw EnemyHeaders_Crocomire,$D007                                      ;B48B11;
    dw $FFFF
    db $00                                                               ;B48B17;

EnemySetName_LNElevSave:
    db "NO1_52 "                                                         ;B48B18;

EnemySets_LNElevSave:
    dw $FFFF                                                             ;B48B1F;
    db $00                                                               ;B48B21;

EnemySetName_Volcano:
    db "NO1_33 "                                                         ;B48B22;

EnemySets_Volcano:
    dw EnemyHeaders_Fune,$0001                                           ;B48B29;
    dw EnemyHeaders_LavaRocks,$0002                                      ;B48B2D;
    dw $FFFF
    db $00                                                               ;B48B33;

EnemySetName_UpperNorfairFarming:
    db "NO1_39 "                                                         ;B48B34;

EnemySets_UpperNorfairFarming:
    dw EnemyHeaders_Fune,$0001                                           ;B48B3B;
    dw EnemyHeaders_Gamet,$0002                                          ;B48B3F;
    dw $FFFF
    db $00                                                               ;B48B45;

EnemySetName_SpongeBath_1:
    db "NP1_11a"                                                         ;B48B46;

EnemySets_SpongeBath_1:
    dw EnemyHeaders_Bull,$0001                                           ;B48B4D;
    dw $FFFF
    db $00                                                               ;B48B53;

EnemySetName_WreckedShipETank_1:
    db "NP1_07a"                                                         ;B48B54;

EnemySets_WreckedShipETank_1:
    dw EnemyHeaders_Kamer2,$0001                                         ;B48B5B;
    dw EnemyHeaders_Skultera,$0002                                       ;B48B5F;
    dw $FFFF
    db $00                                                               ;B48B65;

EnemySetName_WreckedShipMainShaft_0:
    db "NP1_04 "                                                         ;B48B66;

EnemySets_WreckedShipMainShaft_0:
    dw EnemyHeaders_Coven,$0001                                          ;B48B6D;
    dw EnemyHeaders_KzanTop,$0002                                        ;B48B71;
    dw EnemyHeaders_Atomic,$0003                                         ;B48B75;
    dw EnemyHeaders_Sbug,$0003                                           ;B48B79;
    dw $FFFF
    db $00                                                               ;B48B7F;

EnemySetName_BowlingAlley_0:
    db "NP1_00 "                                                         ;B48B80;

EnemySets_BowlingAlley_0:
    dw EnemyHeaders_Chozo,$0001                                          ;B48B87;
    dw EnemyHeaders_Sbug,$0007                                           ;B48B8B;
    dw $FFFF
    db $00                                                               ;B48B91;

EnemySetName_Attic_1:
    db "NP1_02a"                                                         ;B48B92;

EnemySets_Attic_1:
    dw EnemyHeaders_KihunterYellow,$0001                                 ;B48B99;
    dw EnemyHeaders_Atomic,$0002                                         ;B48B9D;
    dw EnemyHeaders_Spark,$0003                                          ;B48BA1;
    dw $FFFF
    db $00                                                               ;B48BA7;

EnemySetName_Basement_1:
    db "NP1_08a"                                                         ;B48BA8;

EnemySets_Basement_1:
    dw EnemyHeaders_Robot,$0001                                          ;B48BAF;
    dw EnemyHeaders_Atomic,$0002                                         ;B48BB3;
    dw EnemyHeaders_Spark,$0003                                          ;B48BB7;
    dw $FFFF
    db $00                                                               ;B48BBD;

EnemySetName_WreckedShipMap_1:
    db "NP1_09a"                                                         ;B48BBE;

EnemySets_WreckedShipMap_1:
    dw $FFFF                                                             ;B48BC5;
    db $00                                                               ;B48BC7;

EnemySetName_WSWestSuper_0:
    db "NP1_12 "                                                         ;B48BC8;

EnemySets_WSWestSuper_0:
    dw $FFFF                                                             ;B48BCF;
    db $00                                                               ;B48BD1;

EnemySetName_SpikyDeath_0:
    db "NP1_05 "                                                         ;B48BD2;

EnemySets_SpikyDeath_0:
    dw $FFFF                                                             ;B48BD9;
    db $00                                                               ;B48BDB;

EnemySetName_SpongeBath_0:
    db "NP1_11 "                                                         ;B48BDC;

EnemySets_SpongeBath_0:
    dw $FFFF                                                             ;B48BE3;
    db $00                                                               ;B48BE5;

EnemySetName_WreckedShipEntrance_1:
    db "NP1_01a"                                                         ;B48BE6;

EnemySets_WreckedShipEntrance_1:
    dw $FFFF                                                             ;B48BED;
    db $00                                                               ;B48BEF;

EnemySetName_ElectricDeath_0:
    db "NP1_06 "                                                         ;B48BF0;

EnemySets_ElectricDeath_0:
    dw $FFFF                                                             ;B48BF7;
    db $00                                                               ;B48BF9;

EnemySetName_BowlingAlley_1:
    db "NP1_00a"                                                         ;B48BFA;

EnemySets_BowlingAlley_1:
    dw EnemyHeaders_Chozo,$0001                                          ;B48C01;
    dw EnemyHeaders_Robot,$0003                                          ;B48C05;
    dw $FFFF
    db $00                                                               ;B48C0B;

EnemySetName_AssemblyLine_0:
    db "NP1_03 "                                                         ;B48C0C;

EnemySets_AssemblyLine_0:
    dw $FFFF                                                             ;B48C13;
    db $00                                                               ;B48C15;

EnemySetName_Phantoon_1:
    db "NP1_10a"                                                         ;B48C16;

EnemySets_Phantoon_1:
    dw $FFFF                                                             ;B48C1D;
    db $00                                                               ;B48C1F;

EnemySetName_WreckedShipETank_0:
    db "NP1_07 "                                                         ;B48C20;

EnemySets_WreckedShipETank_0:
    dw $FFFF                                                             ;B48C27;
    db $00                                                               ;B48C29;

EnemySetName_GravitySuit_0:
    db "NP1_14 "                                                         ;B48C2A;

EnemySets_GravitySuit_0:
    dw $FFFF                                                             ;B48C31;
    db $00                                                               ;B48C33;

EnemySetName_WreckedShipMap_0:
    db "NP1_09 "                                                         ;B48C34;

EnemySets_WreckedShipMap_0:
    dw EnemyHeaders_Coven,$0001                                          ;B48C3B;
    dw EnemyHeaders_Sbug,$0007                                           ;B48C3F;
    dw EnemyHeaders_Bull,$0007                                           ;B48C43;
    dw $FFFF
    db $00                                                               ;B48C49;

EnemySetName_GravitySuit_1:
    db "NP1_14a"                                                         ;B48C4A;

EnemySets_GravitySuit_1:
    dw $FFFF                                                             ;B48C51;
    db $00                                                               ;B48C53;

EnemySetName_Basement_0:
    db "NP1_08 "                                                         ;B48C54;

EnemySets_Basement_0:
    dw EnemyHeaders_RobotNoPower,$0007                                   ;B48C5B;
    dw EnemyHeaders_Sbug,$0007                                           ;B48C5F;
    dw $FFFF
    db $00                                                               ;B48C65;

EnemySetName_WreckedShipEntrance_0:
    db "NP1_01 "                                                         ;B48C66;

EnemySets_WreckedShipEntrance_0:
    dw EnemyHeaders_Sbug,$0001                                           ;B48C6D;
    dw $FFFF
    db $00                                                               ;B48C73;

EnemySetName_AssemblyLine_1:
    db "NP1_03a"                                                         ;B48C74;

EnemySets_AssemblyLine_1:
    dw EnemyHeaders_Spark,$0001                                          ;B48C7B;
    dw EnemyHeaders_Puyo,$0002                                           ;B48C7F;
    dw EnemyHeaders_Robot,$0003                                          ;B48C83;
    dw $FFFF
    db $00                                                               ;B48C89;

EnemySetName_WreckedShipSave_1:
    db "NP1_15a"                                                         ;B48C8A;

EnemySets_WreckedShipSave_1:
    dw $FFFF                                                             ;B48C91;
    db $00                                                               ;B48C93;

EnemySetName_WSWestSuper_1:
    db "NP1_12a"                                                         ;B48C94;

EnemySets_WSWestSuper_1:
    dw EnemyHeaders_Spark,$0001                                          ;B48C9B;
    dw $FFFF
    db $00                                                               ;B48CA1;

EnemySetName_Attic_0:
    db "NP1_02 "                                                         ;B48CA2;

EnemySets_Attic_0:
    dw EnemyHeaders_Coven,$0001                                          ;B48CA9;
    dw EnemyHeaders_Atomic,$0002                                         ;B48CAD;
    dw EnemyHeaders_Sbug,$0002                                           ;B48CB1;
    dw $FFFF
    db $00                                                               ;B48CB7;

EnemySetName_WSEastSuper_0:
    db "NP1_13 "                                                         ;B48CB8;

EnemySets_WSEastSuper_0:
    dw EnemyHeaders_Coven,$0001                                          ;B48CBF;
    dw EnemyHeaders_Atomic,$0002                                         ;B48CC3;
    dw EnemyHeaders_Sbug,$0002                                           ;B48CC7;
    dw EnemyHeaders_RobotNoPower,$0007                                   ;B48CCB;
    dw $FFFF
    db $00                                                               ;B48CD1;

EnemySetName_WreckedShipSave_0:
    db "NP1_15 "                                                         ;B48CD2;

EnemySets_WreckedShipSave_0:
    dw EnemyHeaders_Coven,$0001                                          ;B48CD9;
    dw EnemyHeaders_Sbug,$0002                                           ;B48CDD;
    dw $FFFF
    db $00                                                               ;B48CE3;

EnemySetName_ElectricDeath_1:
    db "NP1_06a"                                                         ;B48CE4;

EnemySets_ElectricDeath_1:
    dw EnemyHeaders_Spark,$0001                                          ;B48CEB;
    dw $FFFF
    db $00                                                               ;B48CF1;

EnemySetName_SpikyDeath_1:
    db "NP1_05a"                                                         ;B48CF2;

EnemySets_SpikyDeath_1:
    dw EnemyHeaders_KzanTop,$0007                                        ;B48CF9;
    dw $FFFF
    db $00                                                               ;B48CFF;

EnemySetName_WSEastSuper_1:
    db "NP1_13a"                                                         ;B48D00;

EnemySets_WSEastSuper_1:
    dw EnemyHeaders_Robot,$0001                                          ;B48D07;
    dw EnemyHeaders_Bull,$0002                                           ;B48D0B;
    dw EnemyHeaders_Spark,$0003                                          ;B48D0F;
    dw $FFFF
    db $00                                                               ;B48D15;

EnemySetName_Phantoon_0:
    db "NP1_10 "                                                         ;B48D16;

EnemySets_Phantoon_0:
    dw EnemyHeaders_PhantoonBody,$0007                                   ;B48D1D;
    dw $FFFF
    db $00                                                               ;B48D23;

EnemySetName_WreckedShipMainShaft_1:
    db "NP1_04a"                                                         ;B48D24;

EnemySets_WreckedShipMainShaft_1:
    dw EnemyHeaders_Spark,$0001                                          ;B48D2B;
    dw EnemyHeaders_Atomic,$0002                                         ;B48D2F;
    dw EnemyHeaders_KzanTop,$0003                                        ;B48D33;
    dw $FFFF
    db $00                                                               ;B48D39;

EnemySetName_MtEverest:
    db "ML1_08 "                                                         ;B48D3A;

EnemySets_MtEverest:
    dw EnemyHeaders_Powamp,$0001                                         ;B48D41;
    dw EnemyHeaders_Sciser,$0003                                         ;B48D45;
    dw $FFFF
    db $00                                                               ;B48D4B;

EnemySetName_HalfieClimb:
    db "ML2_25 "                                                         ;B48D4C;

EnemySets_HalfieClimb:
    dw EnemyHeaders_Oum,$0001                                            ;B48D53;
    dw EnemyHeaders_Mochtroid,$0002                                      ;B48D57;
    dw $FFFF
    db $00                                                               ;B48D5D;

EnemySetName_WateringHole:
    db "ML1_10 "                                                         ;B48D5E;

EnemySets_WateringHole:
    dw EnemyHeaders_Choot,$0001                                          ;B48D65;
    dw EnemyHeaders_Zeb,$0002                                            ;B48D69;
    dw $FFFF
    db $00                                                               ;B48D6F;

EnemySetName_CrabShaft:
    db "ML1_12 "                                                         ;B48D70;

EnemySets_CrabShaft:
    dw EnemyHeaders_Sciser,$0001                                         ;B48D77;
    dw $FFFF
    db $00                                                               ;B48D7D;

EnemySetName_MaridiaElev:
    db "ML1_19 "                                                         ;B48D7E;

EnemySets_MaridiaElev:
    dw EnemyHeaders_Ripper,$0003                                         ;B48D85;
    dw EnemyHeaders_Owtch,$0007                                          ;B48D89;
    dw $FFFF
    db $00                                                               ;B48D8F;

EnemySetName_Colosseum:
    db "ML2_16 "                                                         ;B48D90;

EnemySets_Colosseum:
    dw EnemyHeaders_Mochtroid,$0001                                      ;B48D97;
    dw $FFFF
    db $00                                                               ;B48D9D;

EnemySetName_AqueductSave:
    db "ML2_17 "                                                         ;B48D9E;

EnemySets_AqueductSave:
    dw $FFFF                                                             ;B48DA5;
    db $00                                                               ;B48DA7;

EnemySetName_ThePrecious:
    db "ML2_18 "                                                         ;B48DA8;

EnemySets_ThePrecious:
    dw $FFFF                                                             ;B48DAF;
    db $00                                                               ;B48DB1;

EnemySetName_BotwoonETank:
    db "ML2_19 "                                                         ;B48DB2;

EnemySets_BotwoonETank:
    dw EnemyHeaders_Puyo,$0001                                           ;B48DB9;
    dw EnemyHeaders_Sciser,$0001                                         ;B48DBD;
    dw EnemyHeaders_Zoa,$0002                                            ;B48DC1;
    dw $FFFF
    db $00                                                               ;B48DC7;

EnemySetName_DraygonSave:
    db "ML2_20 "                                                         ;B48DC8;

EnemySets_DraygonSave:
    dw $FFFF                                                             ;B48DCF;
    db $00                                                               ;B48DD1;

EnemySetName_MaridiaMissileRefill:
    db "ML2_21 "                                                         ;B48DD2;

EnemySets_MaridiaMissileRefill:
    dw $FFFF                                                             ;B48DD9;
    db $00                                                               ;B48DDB;

EnemySetName_PlasmaBeachQuicksand:
    db "ML2_22 "                                                         ;B48DDC;

EnemySets_PlasmaBeachQuicksand:
    dw EnemyHeaders_Bull,$0001                                           ;B48DE3;
    dw $FFFF
    db $00                                                               ;B48DE9;

EnemySetName_BotwoonQuicksand:
    db "ML2_23 "                                                         ;B48DEA;

EnemySets_BotwoonQuicksand:
    dw EnemyHeaders_Bull,$0001                                           ;B48DF1;
    dw $FFFF
    db $00                                                               ;B48DF7;

EnemySetName_Shaktool:
    db "ML2_24 "                                                         ;B48DF8;

EnemySets_Shaktool:
    dw EnemyHeaders_Shaktool,$0001                                       ;B48DFF;
    dw EnemyHeaders_Yard,$0002                                           ;B48E03;
    dw $FFFF
    db $00                                                               ;B48E09;

EnemySetName_Draygon_0:
    db "MLB_00"                                                          ;B48E0A;

EnemySets_Draygon_0:
    dw EnemyHeaders_DraygonBody,$0007                                    ;B48E10;
    dw $FFFF
    db $00                                                               ;B48E16;

EnemySetName_Aqueduct:
    db "ML2_09 "                                                         ;B48E17;

EnemySets_Aqueduct:
    dw EnemyHeaders_Yard,$0001                                           ;B48E1E;
    dw $FFFF
    db $00                                                               ;B48E24;

EnemySetName_RedFish:
    db "ML1_09 "                                                         ;B48E25;

EnemySets_RedFish:
    dw EnemyHeaders_Skultera,$0001                                       ;B48E2C;
    dw EnemyHeaders_Sciser,$0001                                         ;B48E30;
    dw EnemyHeaders_Zebbo,$0002                                          ;B48E34;
    dw $FFFF
    db $00                                                               ;B48E3A;

EnemySetName_Plasma:
    db "ML1_17 "                                                         ;B48E3B;

EnemySets_Plasma:
    dw EnemyHeaders_PirateMagentaWalking,$0001                           ;B48E42;
    dw EnemyHeaders_PirateMagentaWall,$0002                              ;B48E46;
    dw $FFFF
    db $00                                                               ;B48E4C;

EnemySetName_SpaceJump:
    db "ML2_27 "                                                         ;B48E4D;

EnemySets_SpaceJump:
    dw $FFFF                                                             ;B48E54;
    db $00                                                               ;B48E56;

EnemySetName_Pants:
    db "ML2_12 "                                                         ;B48E57;

EnemySets_Pants:
    dw EnemyHeaders_Menu,$0001                                           ;B48E5E;
    dw EnemyHeaders_Puyo,$0002                                           ;B48E62;
    dw EnemyHeaders_Tripper,$0002                                        ;B48E66;
    dw $FFFF
    db $00                                                               ;B48E6C;

EnemySetName_GlassTunnelSave:
    db "ML1_00 "                                                         ;B48E6D;

EnemySets_GlassTunnelSave:
    dw $FFFF                                                             ;B48E74;
    db $00                                                               ;B48E76;

EnemySetName_GlassTunnel:
    db "ML1_01 "                                                         ;B48E77;

EnemySets_GlassTunnel:
    dw EnemyHeaders_NoobTubeCrack,$0007                                  ;B48E7E;
    dw $FFFF
    db $00                                                               ;B48E84;

EnemySetName_WestTunnel:
    db "ML1_02 "                                                         ;B48E85;

EnemySets_WestTunnel:
    dw $FFFF                                                             ;B48E8C;
    db $00                                                               ;B48E8E;

EnemySetName_EastTunnel:
    db "ML1_03 "                                                         ;B48E8F;

EnemySets_EastTunnel:
    dw EnemyHeaders_Boyon,$0001                                          ;B48E96;
    dw EnemyHeaders_Zebbo,$0002                                          ;B48E9A;
    dw $FFFF
    db $00                                                               ;B48EA0;

EnemySetName_MamaTurtle:
    db "ML1_06 "                                                         ;B48EA1;

EnemySets_MamaTurtle:
    dw EnemyHeaders_MamaTurtle,$0001                                     ;B48EA8;
    dw $FFFF
    db $00                                                               ;B48EAE;

EnemySetName_CrabTunnel:
    db "ML1_07 "                                                         ;B48EAF;

EnemySets_CrabTunnel:
    dw EnemyHeaders_Sciser,$0001                                         ;B48EB6;
    dw $FFFF
    db $00                                                               ;B48EBC;

EnemySetName_NWestMaridiaBug:
    db "ML1_11 "                                                         ;B48EBD;

EnemySets_NWestMaridiaBug:
    dw EnemyHeaders_Owtch,$0001                                          ;B48EC4;
    dw EnemyHeaders_Menu,$0002                                           ;B48EC8;
    dw $FFFF
    db $00                                                               ;B48ECE;

EnemySetName_PseudoPlasmaSpark:
    db "ML1_13 "                                                         ;B48ECF;

EnemySets_PseudoPlasmaSpark:
    dw EnemyHeaders_Owtch,$0001                                          ;B48ED6;
    dw EnemyHeaders_Choot,$0002                                          ;B48EDA;
    dw EnemyHeaders_Skultera,$0003                                       ;B48EDE;
    dw $FFFF
    db $00                                                               ;B48EE4;

EnemySetName_WestSandHallTunnel:
    db "ML1_15 "                                                         ;B48EE5;

EnemySets_WestSandHallTunnel:
    dw EnemyHeaders_Sciser,$0001                                         ;B48EEC;
    dw $FFFF
    db $00                                                               ;B48EF2;

EnemySetName_PlasmaTutorial:
    db "ML1_16 "                                                         ;B48EF3;

EnemySets_PlasmaTutorial:
    dw EnemyHeaders_Puyo,$0001                                           ;B48EFA;
    dw EnemyHeaders_MZoomer,$0001                                        ;B48EFE;
    dw $FFFF
    db $00                                                               ;B48F04;

EnemySetName_ThreadTheNeedle:
    db "ML1_18 "                                                         ;B48F05;

EnemySets_ThreadTheNeedle:
    dw EnemyHeaders_Puyo,$0001                                           ;B48F0C;
    dw EnemyHeaders_Boyon,$0001                                          ;B48F10;
    dw EnemyHeaders_Choot,$0002                                          ;B48F14;
    dw $FFFF
    db $00                                                               ;B48F1A;

EnemySetName_PlasmaSpark:
    db "ML1_20 "                                                         ;B48F1B;

EnemySets_PlasmaSpark:
    dw EnemyHeaders_Owtch,$0001                                          ;B48F22;
    dw EnemyHeaders_Choot,$0002                                          ;B48F26;
    dw EnemyHeaders_Skultera,$0003                                       ;B48F2A;
    dw $FFFF
    db $00                                                               ;B48F30;

EnemySetName_Toilet:
    db "ML2_00 "                                                         ;B48F31;

EnemySets_Toilet:
    dw EnemyHeaders_Mochtroid,$0001                                      ;B48F38;
    dw EnemyHeaders_Puyo,$0002                                           ;B48F3C;
    dw EnemyHeaders_Sciser,$0002                                         ;B48F40;
    dw EnemyHeaders_Yard,$0003                                           ;B48F44;
    dw $FFFF
    db $00                                                               ;B48F4A;

EnemySetName_WestSandHall:
    db "ML2_02 "                                                         ;B48F4B;

EnemySets_WestSandHall:
    dw EnemyHeaders_Evir,$0001                                           ;B48F52;
    dw $FFFF
    db $00                                                               ;B48F58;

EnemySetName_Oasis:
    db "ML2_03 "                                                         ;B48F59;

EnemySets_Oasis:
    dw $FFFF                                                             ;B48F60;
    db $00                                                               ;B48F62;

EnemySetName_EastSandHall:
    db "ML2_04 "                                                         ;B48F63;

EnemySets_EastSandHall:
    dw EnemyHeaders_Evir,$0001                                           ;B48F6A;
    dw $FFFF
    db $00                                                               ;B48F70;

EnemySetName_WestAqueductQuicksand:
    db "ML2_07 "                                                         ;B48F71;

EnemySets_WestAqueductQuicksand:
    dw EnemyHeaders_Bull,$0001                                           ;B48F78;
    dw $FFFF
    db $00                                                               ;B48F7E;

EnemySetName_EastAqueductQuicksand:
    db "ML2_08 "                                                         ;B48F7F;

EnemySets_EastAqueductQuicksand:
    dw EnemyHeaders_Bull,$0001                                           ;B48F86;
    dw $FFFF
    db $00                                                               ;B48F8C;

EnemySetName_Butterfly:
    db "ML2_10 "                                                         ;B48F8D;

EnemySets_Butterfly:
    dw EnemyHeaders_Zoa,$0001                                            ;B48F94;
    dw $FFFF
    db $00                                                               ;B48F9A;

EnemySetName_BotwoonHallway:
    db "ML2_11 "                                                         ;B48F9B;

EnemySets_BotwoonHallway:
    dw EnemyHeaders_Mochtroid,$0001                                      ;B48FA2;
    dw EnemyHeaders_Puyo,$0002                                           ;B48FA6;
    dw EnemyHeaders_Sciser,$0002                                         ;B48FAA;
    dw $FFFF
    db $00                                                               ;B48FB0;

EnemySetName_EastPants:
    db "ML2_13 "                                                         ;B48FB1;

EnemySets_EastPants:
    dw EnemyHeaders_Puyo,$0001                                           ;B48FB8;
    dw EnemyHeaders_Tripper,$0001                                        ;B48FBC;
    dw $FFFF
    db $00                                                               ;B48FC2;

EnemySetName_Springball:
    db "ML2_14 "                                                         ;B48FC3;

EnemySets_Springball:
    dw $FFFF                                                             ;B48FCA;
    db $00                                                               ;B48FCC;

EnemySetName_BelowBotwoonETank:
    db "ML2_15 "                                                         ;B48FCD;

EnemySets_BelowBotwoonETank:
    dw EnemyHeaders_Zoa,$0001                                            ;B48FD4;
    dw EnemyHeaders_Owtch,$0002                                          ;B48FD8;
    dw $FFFF
    db $00                                                               ;B48FDE;

EnemySetName_Kassiuz:
    db "ML1_21 "                                                         ;B48FDF;

EnemySets_Kassiuz:
    dw EnemyHeaders_Choot,$0001                                          ;B48FE6;
    dw EnemyHeaders_Puyo,$0002                                           ;B48FEA;
    dw EnemyHeaders_Boyon,$0002                                          ;B48FEE;
    dw $FFFF
    db $00                                                               ;B48FF4;

EnemySetName_ForgottenHighwaySave:
    db "ML1_23 "                                                         ;B48FF5;

EnemySets_ForgottenHighwaySave:
    dw $FFFF                                                             ;B48FFC;
    db $00                                                               ;B48FFE;

EnemySetName_MaridiaEnergyRefill:
    db "ML2_28 "                                                         ;B48FFF;

EnemySets_MaridiaEnergyRefill:
    dw $FFFF                                                             ;B49006;
    db $00                                                               ;B49008;

EnemySetName_MaridiaMap:
    db "ML1_22 "                                                         ;B49009;

EnemySets_MaridiaMap:
    dw $FFFF                                                             ;B49010;
    db $00                                                               ;B49012;

EnemySetName_CrabHole:
    db "ML1_14 "                                                         ;B49013;

EnemySets_CrabHole:
    dw EnemyHeaders_Sciser,$0001                                         ;B4901A;
    dw $FFFF
    db $00                                                               ;B49020;

EnemySetName_Botwoon:
    db "ML2_26 "                                                         ;B49021;

EnemySets_Botwoon:
    dw EnemyHeaders_Owtch,$0001                                          ;B49028;
    dw EnemyHeaders_Botwoon,$0007                                        ;B4902C;
    dw $FFFF
    db $00                                                               ;B49032;

EnemySetName_MainStreet:
    db "ML1_04 "                                                         ;B49033;

EnemySets_MainStreet:
    dw EnemyHeaders_Skultera,$0001                                       ;B4903A;
    dw EnemyHeaders_Sciser,$0002                                         ;B4903E;
    dw $FFFF
    db $00                                                               ;B49044;

EnemySetName_BugSandHole:
    db "ML2_01 "                                                         ;B49045;

EnemySets_BugSandHole:
    dw EnemyHeaders_YappingMaw,$0001                                     ;B4904C;
    dw EnemyHeaders_Zoa,$0007                                            ;B49050;
    dw $FFFF
    db $00                                                               ;B49056;

EnemySetName_EastSandHole:
    db "ML2_06 "                                                         ;B49057;

EnemySets_EastSandHole:
    dw EnemyHeaders_Boulder,$0001                                        ;B4905E;
    dw $FFFF
    db $00                                                               ;B49064;

EnemySetName_WestSandHole:
    db "ML2_05 "                                                         ;B49065;

EnemySets_WestSandHole:
    dw EnemyHeaders_Boulder,$0001                                        ;B4906C;
    dw $FFFF
    db $00                                                               ;B49072;

EnemySetName_WestCactusAlley:
    db "ML2_29 "                                                         ;B49073;

EnemySets_WestCactusAlley:
    dw EnemyHeaders_Cacatac,$0007                                        ;B4907A;
    dw EnemyHeaders_Zoa,$0007                                            ;B4907E;
    dw $FFFF
    db $00                                                               ;B49084;

EnemySetName_EastCactusAlley:
    db "ML2_30 "                                                         ;B49085;

EnemySets_EastCactusAlley:
    dw EnemyHeaders_Cacatac,$0001                                        ;B4908C;
    dw EnemyHeaders_Zoa,$0001                                            ;B49090;
    dw $FFFF
    db $00                                                               ;B49096;

EnemySetName_FishTank:
    db "ML1_05 "                                                         ;B49097;

EnemySets_FishTank:
    dw EnemyHeaders_Skultera,$0001                                       ;B4909E;
    dw EnemyHeaders_PirateMagentaWalking,$0002                           ;B490A2;
    dw $FFFF
    db $00                                                               ;B490A8;

EnemySetName_TourianEscape4:
    db "TS1_17 "                                                         ;B490A9;

EnemySets_TourianEscape4:
    dw EnemyHeaders_PirateSilverWall,$0001                               ;B490B0;
    dw EnemyHeaders_PirateSilverWalking,$0002                            ;B490B4;
    dw $FFFF
    db $00                                                               ;B490BA;

EnemySetName_MotherBrainSave:
    db "TS1_13 "                                                         ;B490BB;

EnemySets_MotherBrainSave:
    dw $FFFF                                                             ;B490C2;
    db $00                                                               ;B490C4;

EnemySetName_Metroids1_0:
    db "TS1_01 "                                                         ;B490C5;

EnemySets_Metroids1_0:
    dw EnemyHeaders_Metroid,$0001                                        ;B490CC;
    dw EnemyHeaders_Rinka,$0002                                          ;B490D0;
    dw $FFFF
    db $00                                                               ;B490D6;

EnemySetName_DustTorizo:
    db "TS1_06 "                                                         ;B490D7;

EnemySets_DustTorizo:
    dw EnemyHeaders_CorpseTorizo,$0001                                   ;B490DE;
    dw $FFFF
    db $00                                                               ;B490E4;

EnemySetName_BigBoy:
    db "TS1_07 "                                                         ;B490E5;

EnemySets_BigBoy:
    dw EnemyHeaders_CorpseSidehopper,$0001                               ;B490EC;
    dw EnemyHeaders_CorpseSidehopper2,$0001                              ;B490F0;
    dw EnemyHeaders_BabyMetroid,$0001                                    ;B490F4;
    dw $FFFF
    db $00                                                               ;B490FA;

EnemySetName_MotherBrain_0_1:
    db "TS1_10 "                                                         ;B490FB;

EnemySets_MotherBrain_0_1:
    dw EnemyHeaders_MotherBrainHead,$0001                                ;B49102;
    dw EnemyHeaders_Rinka,$0002                                          ;B49106;
    dw EnemyHeaders_MotherBrainBody,$D001                                ;B4910A;
    dw $FFFF
    db $00                                                               ;B49110;

EnemySetName_TourianEyeDoor:
    db "TS1_11 "                                                         ;B49111;

EnemySets_TourianEyeDoor:
    dw $FFFF                                                             ;B49118;
    db $00                                                               ;B4911A;

EnemySetName_BlueHopper:
    db "TS1_05 "                                                         ;B4911B;

EnemySets_BlueHopper:
    dw EnemyHeaders_SidehopperTourian,$0001                              ;B49122;
    dw $FFFF
    db $00                                                               ;B49128;

EnemySetName_TourianEscape1:
    db "TS1_14 "                                                         ;B49129;

EnemySets_TourianEscape1:
    dw EnemyHeaders_ShutterDestroyable,$0001                             ;B49130;
    dw $FFFF
    db $00                                                               ;B49136;

EnemySetName_TourianFirst:
    db "TS1_00 "                                                         ;B49137;

EnemySets_TourianFirst:
    dw $FFFF                                                             ;B4913E;
    db $00                                                               ;B49140;

EnemySetName_Metroids2_0:
    db "TS1_02 "                                                         ;B49141;

EnemySets_Metroids2_0:
    dw EnemyHeaders_Metroid,$0001                                        ;B49148;
    dw EnemyHeaders_Rinka,$0002                                          ;B4914C;
    dw $FFFF
    db $00                                                               ;B49152;

EnemySetName_Metroids4_0:
    db "TS1_04 "                                                         ;B49153;

EnemySets_Metroids4_0:
    dw EnemyHeaders_Metroid,$0001                                        ;B4915A;
    dw EnemyHeaders_Rinka,$0002                                          ;B4915E;
    dw $FFFF
    db $00                                                               ;B49164;

EnemySetName_Metroids1_1:
    db "TS1_01 "                                                         ;B49165;

EnemySets_Metroids1_1:
    dw EnemyHeaders_Rinka,$0002                                          ;B4916C;
    dw $FFFF
    db $00                                                               ;B49172;

EnemySetName_Metroids2_1:
    db "TS1_02 "                                                         ;B49173;

EnemySets_Metroids2_1:
    dw EnemyHeaders_Rinka,$0002                                          ;B4917A;
    dw $FFFF
    db $00                                                               ;B49180;

EnemySetName_TourianEscape2:
    db "TS1_15 "                                                         ;B49181;

EnemySets_TourianEscape2:
    dw EnemyHeaders_PirateSilverWall,$0001                               ;B49188;
    dw $FFFF
    db $00                                                               ;B4918E;

EnemySetName_Metroids3_1:
    db "TS1_03 "                                                         ;B4918F;

EnemySets_Metroids3_1:
    dw EnemyHeaders_Rinka,$0002                                          ;B49196;
    dw $FFFF
    db $00                                                               ;B4919C;

EnemySetName_Metroids4_1:
    db "TS1_04 "                                                         ;B4919D;

EnemySets_Metroids4_1:
    dw EnemyHeaders_Rinka,$0002                                          ;B491A4;
    dw $FFFF
    db $00                                                               ;B491AA;

EnemySetName_TourianEscape3:
    db "TS1_16 "                                                         ;B491AB;

EnemySets_TourianEscape3:
    dw EnemyHeaders_PirateSilverWalking,$0001                            ;B491B2;
    dw EnemyHeaders_ShutterGrowing,$0002                                 ;B491B6;
    dw $FFFF
    db $00                                                               ;B491BC;

EnemySetName_Seaweed:
    db "TS1_08 "                                                         ;B491BD;

EnemySets_Seaweed:
    dw $FFFF                                                             ;B491C4;
    db $00                                                               ;B491C6;

EnemySetName_TourianRecharge:
    db "TS1_09 "                                                         ;B491C7;

EnemySets_TourianRecharge:
    dw $FFFF                                                             ;B491CE;
    db $00                                                               ;B491D0;

EnemySetName_Metroids3_0:
    db "TS1_18 "                                                         ;B491E7;

EnemySets_UpperTourianSave:
    dw $FFFF                                                             ;B491EE;
    db $00                                                               ;B491F0;
    db "TS1_03 "                                                         ;B491F1;

EnemySets_Metroids3_0:
    dw EnemyHeaders_Metroid,$0001                                        ;B491F8;
    dw EnemyHeaders_Rinka,$0002                                          ;B491FC;
    dw $FFFF
    db $00                                                               ;B49202;

EnemySetName_RinkaShaft:
    db "TS1_12 "                                                         ;B49203;

EnemySets_RinkaShaft:
    dw EnemyHeaders_Rinka,$0002                                          ;B4920A;
    dw $FFFF
    db $00                                                               ;B49210;

EnemySetName_CeresElev_0:
    db "cl1_00 "                                                         ;B49211;

EnemySets_CeresElev_0:
    dw EnemyHeaders_CeresDoor,$D002                                      ;B49218;
    dw $FFFF
    db $00                                                               ;B4921E;

EnemySetName_FallingTile_0:
    db "cl1_01 "                                                         ;B4921F;

EnemySets_FallingTile_0:
    dw EnemyHeaders_CeresDoor,$D002                                      ;B49226;
    dw $FFFF
    db $00                                                               ;B4922C;

EnemySetName_MagnetStairs_0:
    db "cl1_02 "                                                         ;B4922D;

EnemySets_MagnetStairs_0:
    dw EnemyHeaders_CeresDoor,$D002                                      ;B49234;
    dw $FFFF
    db $00                                                               ;B4923A;

EnemySetName_DeadScientist_0:
    db "cl1_03 "                                                         ;B4923B;

EnemySets_DeadScientist_0:
    dw EnemyHeaders_CeresDoor,$D002                                      ;B49242;
    dw $FFFF
    db $00                                                               ;B49248;

EnemySetName_58Escape_0:
    db "cl1_04 "                                                         ;B49249;

EnemySets_58Escape_0:
    dw EnemyHeaders_CeresDoor,$D002                                      ;B49250;
    dw $FFFF
    db $00                                                               ;B49256;

EnemySetName_CeresRidley_0:
    db "cl1_05 "                                                         ;B49257;

EnemySets_CeresRidley_0:
    dw EnemyHeaders_RidleyCeres,$0001                                    ;B4925E;
    dw EnemyHeaders_CeresDoor,$D002                                      ;B49262;
    dw $FFFF
    db $00                                                               ;B49268;

EnemySetName_CeresElev_1:
    db "cl1_00 "                                                         ;B49269;

EnemySets_CeresElev_1:
    dw EnemyHeaders_CeresDoor,$D002                                      ;B49270;
    dw $FFFF
    db $00                                                               ;B49276;

EnemySetName_FallingTile_1:
    db "cl1_01 "                                                         ;B49277;

EnemySets_FallingTile_1:
    dw EnemyHeaders_CeresDoor,$D002                                      ;B4927E;
    dw $FFFF
    db $00                                                               ;B49284;

EnemySetName_MagnetStairs_1:
    db "cl1_02 "                                                         ;B49285;

EnemySets_MagnetStairs_1:
    dw EnemyHeaders_CeresDoor,$D002                                      ;B4928C;
    dw $FFFF
    db $00                                                               ;B49292;

EnemySetName_DeadScientist_1:
    db "cl1_03 "                                                         ;B49293;

EnemySets_DeadScientist_1:
    dw EnemyHeaders_CeresDoor,$D002                                      ;B4929A;
    dw $FFFF
    db $00                                                               ;B492A0;

EnemySetName_58Escape_1:
    db "cl1_04 "                                                         ;B492A1;

EnemySets_58Escape_1:
    dw EnemyHeaders_CeresDoor,$D002                                      ;B492A8;
    dw $FFFF
    db $00                                                               ;B492AE;

EnemySetName_CeresRidley_1:
    db "cl1_05 "                                                         ;B492AF;

EnemySets_CeresRidley_1:
    dw EnemyHeaders_CeresDoor,$D002                                      ;B492B6;
    dw $FFFF
    db $00                                                               ;B492BC;

EnemySetName_Debug:
    db "TT_00 "                                                          ;B492BD;

EnemySets_Debug:
    dw $FFFF                                                             ;B492C3;
    db $00                                                               ;B492C5;


;;; $BC26: Create sprite object ;;;
Create_Sprite_Object:
;; Parameters:
;;     $12: X position
;;     $14: Y position
;;     $16: Sprite object ID. See "Sprite objects.asm"
;;     $18: Base tile number and palette bits
;; Returns:
;;     $12: Index of created sprite object if successful
    PHX                                                                  ;B4BC26;
    PHY                                                                  ;B4BC27;
    PHB                                                                  ;B4BC29;
    PEA.W SpriteObjects_InstListPointers>>8&$FF00
    PLB                                                                  ;B4BC2D;
    PLB                                                                  ;B4BC2E;
    LDY.W #$003E

  .loop:
    LDA.W SpriteObjects_InstListPointers,Y
    BEQ .found                                                           ;B4BC38;
    DEY                                                                  ;B4BC3A;
    DEY                                                                  ;B4BC3B;
    BPL .loop                                                            ;B4BC3C;
    BRA .return                                                          ;B4BC3E;

  .found:
    STA.W SpriteObjects_Palettes,Y
    STA.W SpriteObjects_XSubPositions,Y
    STA.W SpriteObjects_YSubPositions,Y
    STA.W SpriteObjects_DisableFlags,Y
    LDA.B DP_Temp12                                                      ;B4BC53;
    STA.W SpriteObjects_XPositions,Y
    LDA.B DP_Temp14                                                      ;B4BC59;
    STA.W SpriteObjects_YPositions,Y
    LDA.B DP_Temp18                                                      ;B4BC5F;
    STA.W SpriteObjects_Palettes,Y
    LDA.B DP_Temp16                                                      ;B4BC65;
    ASL                                                                  ;B4BC67;
    TAX
    LDA.L SpriteObject_DrawInst_Pointers,X
    STA.W SpriteObjects_InstListPointers,Y
    TAX
    LDA.L SpriteObjectInstLists,X
    STA.W SpriteObjects_InstructionsTimers,Y

  .return:
    PLB                                                                  ;B4BC7D;
    PLY                                                                  ;B4BC7F;
    PLX                                                                  ;B4BC80;
    RTL                                                                  ;B4BC81;


;;; $BC82: Handle sprite objects ;;;
HandleSpriteObjects:
    LDA.W TimeIsFrozenFlag                                               ;B4BC8D;
    BNE .return                                                          ;B4BC93;
    LDX.W #$003E                                                         ;B4BC95;
    STX.B SpriteObjectIndex                                              ;B4BC98;

  .loop:
    LDA.L SpriteObjects_InstListPointers,X                               ;B4BC9E;
    BEQ .next                                                            ;B4BCA2;
    LDA.L SpriteObjects_DisableFlags,X                                   ;B4BCA4;
    BIT.W #$0001                                                         ;B4BCA8;
    BNE .next                                                            ;B4BCAB;
    LDA.L SpriteObjects_InstructionsTimers,X                             ;B4BCAD;
    BMI .ASMInstruction                                                  ;B4BCB1;
    DEC                                                                  ;B4BCB3;
    STA.L SpriteObjects_InstructionsTimers,X                             ;B4BCB4;
    BNE .next                                                            ;B4BCB8;
    LDA.L SpriteObjects_InstListPointers,X                               ;B4BCBA;
    CLC
    ADC.W #$0004
    STA.L SpriteObjects_InstListPointers,X                               ;B4BCC2;
    TAX                                                                  ;B4BCC6;
    LDA.L SpriteObjectInstLists,X                                        ;B4BCC7;
    BMI .ASMInstruction
    LDX.B SpriteObjectIndex                                              ;B4BCD0;
    STA.L SpriteObjects_InstructionsTimers,X                             ;B4BCD3;

  .next:
    LDA.B SpriteObjectIndex                                              ;B4BCD7;
    DEC                                                                  ;B4BCDA;
    DEC                                                                  ;B4BCDB;
    STA.B SpriteObjectIndex                                              ;B4BCDC;
    TAX
    BPL .loop                                                            ;B4BCDF;

  .return:
    RTL

  .ASMInstruction:
    STA.B DP_Temp12                                                      ;B4BCE3;
    PEA.W .next-1                                                        ;B4BCE5;
    JMP.W (DP_Temp12)                                                    ;B4BCE8;


;;; $BCF0: Sprite object instruction - go back 4 bytes ;;;
Instruction_SpriteObject_GoBack4Bytes:
    LDX.B SpriteObjectIndex                                              ;B4BCF0;
    LDA.L SpriteObjects_InstListPointers,X                               ;B4BCF3;
    SEC
    SBC.W #$0004
    STA.L SpriteObjects_InstListPointers,X                               ;B4BCFB;
    LDA.W #$7FFF                                                         ;B4BCFF;
    STA.L SpriteObjects_InstructionsTimers,X                             ;B4BD02;
    RTS                                                                  ;B4BD06;


;;; $BD07: Sprite object instruction - delete ;;;
Instruction_SpriteObject_Delete:
    LDX.B SpriteObjectIndex                                              ;B4BD07;
    LDA.W #$0000                                                         ;B4BD0A;
    STA.L SpriteObjects_InstListPointers,X                               ;B4BD0D;
    RTS                                                                  ;B4BD11;


;;; $BD12: Sprite object instruction - go to parameter ;;;
Instruction_SpriteObject_GotoParameter:
    LDX.B SpriteObjectIndex                                              ;B4BD12;
    LDA.L SpriteObjects_InstListPointers,X                               ;B4BD15;
    TAX                                                                  ;B4BD19;
    LDA.L SpriteObjectInstLists+2,X                                      ;B4BD1A;
    LDX.B SpriteObjectIndex                                              ;B4BD1E;
    STA.L SpriteObjects_InstListPointers,X                               ;B4BD21;
    TAX                                                                  ;B4BD25;
    LDA.L SpriteObjectInstLists,X                                        ;B4BD26;
    LDX.B SpriteObjectIndex                                              ;B4BD2A;
    STA.L SpriteObjects_InstructionsTimers,X                             ;B4BD2D;
    RTS                                                                  ;B4BD31;


;;; $BD32: Draw sprite objects ;;;
DrawSpriteObjects:
    PHB                                                                  ;B4BD35;
    PEA.W SpriteObjectInstLists>>8                                       ;B4BD36;
    PLB                                                                  ;B4BD39;
    PLB                                                                  ;B4BD3A;
    LDX.W #$003E                                                         ;B4BD3D;

  .loop:
    LDA.L SpriteObjects_InstListPointers,X                               ;B4BD40;
    BEQ .next                                                            ;B4BD44;
    LDA.L SpriteObjects_XPositions,X                                     ;B4BD46;
    SEC                                                                  ;B4BD4A;
    SBC.B Layer1XPosition                                                ;B4BD4B;
    STA.B DP_Temp14                                                      ;B4BD4E;
    CLC                                                                  ;B4BD50;
    ADC.W #$0010                                                         ;B4BD51;
    BMI .next                                                            ;B4BD54;
    CMP.W #$0120                                                         ;B4BD56;
    BPL .next                                                            ;B4BD59;
    LDA.L SpriteObjects_YPositions,X                                     ;B4BD5B;
    SEC                                                                  ;B4BD5F;
    SBC.B Layer1YPosition                                                ;B4BD60;
    STA.B DP_Temp12                                                      ;B4BD63;
    BMI .next                                                            ;B4BD65;
    CMP.W #$0110                                                         ;B4BD67;
    BPL .next                                                            ;B4BD6A;
    LDA.L SpriteObjects_Palettes,X                                       ;B4BD6C;
    AND.W #$0E00                                                         ;B4BD70;
    STA.B DP_Temp03                                                      ;B4BD73;
    LDA.L SpriteObjects_Palettes,X                                       ;B4BD75;
    AND.W #$01FF                                                         ;B4BD79;
    STA.B DP_Temp00                                                      ;B4BD7C;
    PHX                                                                  ;B4BD7E;
    LDA.L SpriteObjects_InstListPointers,X                               ;B4BD7F;
    TAX                                                                  ;B4BD83;
    LDA.L SpriteObjectInstLists+2,X                                      ;B4BD84;
    TAY                                                                  ;B4BD88;
    JSL.L AddSpritemapToOAM_WithBaseTileNumber_NoOffScreen               ;B4BD89;
    PLX                                                                  ;B4BD8D;

  .next:
    DEX                                                                  ;B4BD8E;
    DEX                                                                  ;B4BD8F;
    BPL .loop                                                            ;B4BD90;
    PLB                                                                  ;B4BD92;
    RTL                                                                  ;B4BD96;


;;; $BD97: Clear sprite objects ;;;
ClearSpriteObjects:
    LDX.W #$03FE                                                         ;B4BD97;
    LDA.W #$0000                                                         ;B4BD9A;

  .loop:
    STA.L SpriteObjects_InstListPointers,X                               ;B4BD9D;
    DEX                                                                  ;B4BDA1;
    DEX                                                                  ;B4BDA2;
    BPL .loop                                                            ;B4BDA3;
    RTL                                                                  ;B4BDA5;


;;; $BDA6: Empty draw instruction ;;;
SpriteObject_DrawInst_Empty:
    dw $0000                                                             ;B4BDA6;


;;; $BDA8: Sprite objects ;;;
SpriteObject_DrawInst_Pointers:
    dw UNUSED_InstList_SpriteObject_0_BeamCharge_B4BE5A                  ;B4BDA8;
    dw UNUSED_InstList_SpriteObject_1_MBElbowChargeParticles_B4BE6C      ;B4BDAA;
    dw UNSUED_InstList_SpriteObject_2_MBElbowChargeEnergy_B4BE86         ;B4BDAC;
    dw InstList_SpriteObject_3_SmallExplosion                            ;B4BDAE;
    dw UNUSED_InstList_SpriteObject_4_BombExplosion_B4BEBE               ;B4BDB0;
    dw UNUSED_InstList_SpriteObject_5_BeamTrail_B4BED4                   ;B4BDB2;
    dw InstList_SpriteObject_6_DudShot                                   ;B4BDB4;
    dw UNUSED_InstList_SpriteObject_7_PowerBomb_B4BF04                   ;B4BDB6;
    dw UNUSED_InstList_SpriteObject_8_ElevatorPad_B4BF12                 ;B4BDB8;
    dw InstList_SpriteObject_9_SmallDudShot                              ;B4BDBA;
    dw InstList_SpriteObject_A_SpacePirateLandingDustCloud               ;B4BDBC;
    dw UNUSED_InstList_SpriteObject_B_EyeDoorSweatDrop_B4BF44            ;B4BDBE;
    dw InstList_SpriteObject_C_Smoke                                     ;B4BDC0;
    dw UNUSED_InstList_SpriteObject_D_SmallEnergyDrop_B4BF8E             ;B4BDC2;
    dw UNUSED_InstList_SpriteObject_E_BigEnergyDrop_B4BFA0               ;B4BDC4;
    dw UNUSED_InstList_SpriteObject_F_Bomb_B4BFB2                        ;B4BDC6;
    dw UNUSED_InstList_SpriteObject_10_WeirdSmallEnergyDrop_B4BFC4       ;B4BDC8;
    dw UNUSED_InstList_SpriteObject_11_RockParticles_B4BFD2              ;B4BDCA;
    dw InstList_SpriteObject_12_ShortBigDustCloud                        ;B4BDCC;
    dw UNUSED_InstList_SpriteObject_13_ShortBigDustCloudBeam_B4C026      ;B4BDCE;
    dw UNUSED_InstList_SpriteObject_14_ShortBigDustCloudBeam_B4C040      ;B4BDD0;
    dw InstList_SpriteObject_15_BigDustCloud                             ;B4BDD2;
    dw UNUSED_InstList_SpriteObject_16_WeirdLongBeam_B4C080              ;B4BDD4;
    dw UNUSED_InstList_SpriteObject_17_WeirdLongFlickerBeam_B4C0FE       ;B4BDD6;
    dw InstList_SpriteObject_18_ShortDraygonBreathBubbles                ;B4BDD8;
    dw UNSUED_InstList_SpriteObject_19_SaveStationElectricity            ;B4BDDA;
    dw UNUSED_InstList_SpriteObject_1A_ExpandingVerticalGate_B4C154      ;B4BDDC;
    dw UNUSED_InstList_SpriteObject_1B_ContractingVerticalGate           ;B4BDDE;
    dw UNUSED_InstList_SpriteObject_1C_ElevatorPad_B4BF68                ;B4BDE0;
    dw InstList_SpriteObject_1D_BigExplosion                             ;B4BDE2;
    dw UNUSED_InstList_SpriteObject_1E_B4C198                            ;B4BDE4;
    dw UNUSED_InstList_SpriteObject_1F_B4C1AC                            ;B4BDE6;
    dw UNUSED_InstList_SpriteObject_20_B4C1C0                            ;B4BDE8;
    dw UNUSED_InstList_SpriteObject_21_B4C1D4                            ;B4BDEA;
    dw UNUSED_InstList_SpriteObject_22_B4C1E8                            ;B4BDEC;
    dw UNUSED_InstList_SpriteObject_23_B4C1FC                            ;B4BDEE;
    dw UNUSED_InstList_SpriteObject_24_B4C210                            ;B4BDF0;
    dw UNUSED_InstList_SpriteObject_25_B4C224                            ;B4BDF2;
    dw UNUSED_InstList_SpriteObject_26_B4C238                            ;B4BDF4;
    dw UNUSED_InstList_SpriteObject_27_B4C258                            ;B4BDF6;
    dw UNUSED_InstList_SpriteObject_28_B4C2A0                            ;B4BDF8;
    dw UNUSED_InstList_SpriteObject_29_B4C2BC                            ;B4BDFA;
    dw UNUSED_InstList_SpriteObject_2A_B4C304                            ;B4BDFC;
    dw InstList_SpriteObject_2B_PuromiBody                               ;B4BDFE;
    dw InstList_SpriteObject_2C_PuromiRightExplosion                     ;B4BE00;
    dw InstList_SpriteObject_2D_PuromiLeftExplosion                      ;B4BE02;
    dw InstList_SpriteObject_2E_PuromiSplash                             ;B4BE04;
    dw UNUSED_InstList_SpriteObject_2F_B4BE54                            ;B4BE06;
    dw InstList_SpriteObject_30_FallingSparkTrail                        ;B4BE08;
    dw UNSUED_InstList_SpriteObject_31_MetroidInsides_B4C3A2             ;B4BE0A;
    dw InstList_SpriteObject_32_MetroidElectricity                       ;B4BE0C;
    dw UNUSED_InstList_SpriteObject_33_B4C436                            ;B4BE0E;
    dw InstList_SpriteObject_34_MetroidShell                             ;B4BE10;
    dw UNUSED_InstList_SpriteObject_35_B4C536                            ;B4BE12;
    dw UNUSED_InstList_SpriteObject_36_B4C5B2                            ;B4BE14;
    dw InstList_SpriteObject_37_EnemyShot                                ;B4BE16;
    dw InstList_SpriteObject_38_YappingMawBaseFacingDown                 ;B4BE18;
    dw InstList_SpriteObject_39_YappingMawBaseFacingUp                   ;B4BE1A;
    dw UNUSED_InstList_SpriteObject_3A_B4C5E4                            ;B4BE1C;
    dw InstList_SpriteObject_3B_EvirFacingLeft                           ;B4BE1E;
    dw InstList_SpriteObject_3C_EvirFacingRight                          ;B4BE20;
    dw InstList_SpriteObject_3D_DraygonFoamingAtTheMouth                 ;B4BE22;


;;; $BE24: Instruction list - sprite object 3Dh (Draygon foaming at the mouth) ;;;
InstList_SpriteObject_3D_DraygonFoamingAtTheMouth:
    dw $0006,SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_0        ;B4BE24;
    dw $0006,SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_1        ;B4BE28;
    dw $0007,SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_2        ;B4BE2C;
    dw $0007,SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_3        ;B4BE30;
    dw $0008,SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_4        ;B4BE34;
    dw $0008,SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_5        ;B4BE38;
    dw $0009,SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_6        ;B4BE3C;
    dw $0009,SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_7        ;B4BE40;
    dw Instruction_SpriteObject_Delete                                   ;B4BE44;


;;; $BE54: Instruction list - sprite object 2Fh (unused) ;;;
UNUSED_InstList_SpriteObject_2F_B4BE54:
    dw $0001,UNUSED_SpriteObjectSpritemaps_2F_B4D594                     ;B4BE54;
    dw Instruction_SpriteObject_GoBack4Bytes                             ;B4BE58;


;;; $BE5A: Instruction list - sprite object 0 (unused. Beam charge) ;;;
UNUSED_InstList_SpriteObject_0_BeamCharge_B4BE5A:
    dw $0003,UNUSED_SpriteObjectSpritemaps_0_BeamCharge_0_B4CAC9         ;B4BE5A;
    dw $0003,UNUSED_SpriteObjectSpritemaps_0_BeamCharge_1_B4CAD0         ;B4BE5E;
    dw $0003,UNUSED_SpriteObjectSpritemaps_0_BeamCharge_2_B4CAD7         ;B4BE62;
    dw $0003,UNUSED_SpriteObjectSpritemaps_0_BeamCharge_3_B4CADE         ;B4BE66;
    dw Instruction_SpriteObject_Delete                                   ;B4BE6A;


;;; $BE6C: Instruction list - sprite object 1 (unused. Mother Brain elbow charge particles) ;;;
UNUSED_InstList_SpriteObject_1_MBElbowChargeParticles_B4BE6C:
    dw $0005,UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_0_B4CAF4    ;B4BE6C;
    dw $0004,UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_1_B4CB05    ;B4BE70;
    dw $0003,UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_2_B4CB16    ;B4BE74;
    dw $0003,UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_3_B4CB27    ;B4BE78;
    dw $0003,UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_4_B4CB38    ;B4BE7C;
    dw $0003,UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_5_B4CB49    ;B4BE80;
    dw Instruction_SpriteObject_Delete                                   ;B4BE84;


;;; $BE86: Instruction list - sprite object 2 (unused. Mother Brain elbow charge energy) ;;;
UNSUED_InstList_SpriteObject_2_MBElbowChargeEnergy_B4BE86:
    dw $0004,UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_0_B4CB5A      ;B4BE86;
    dw $0003,UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_1_B4CB6B      ;B4BE8A;
    dw $0002,UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_2_B4CB7C      ;B4BE8E;
    dw $0002,UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_3_B4CB8D      ;B4BE92;
    dw $0002,UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_4_B4CB9E      ;B4BE96;
    dw $0002,UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_5_B4CBAF      ;B4BE9A;
    dw $000C,SpriteObjectSpritemaps_3_SmallExplosion_0                   ;B4BE9E;
    dw Instruction_SpriteObject_Delete                                   ;B4BEA2;


;;; $BEA4: Instruction list - sprite object 3 (small explosion) ;;;
InstList_SpriteObject_3_SmallExplosion:
    dw $0004,SpriteObjectSpritemaps_3_SmallExplosion_0                   ;B4BEA4;
    dw $0006,SpriteObjectSpritemaps_3_SmallExplosion_1                   ;B4BEA8;
    dw $0005,SpriteObjectSpritemaps_3_SmallExplosion_2                   ;B4BEAC;
    dw $0005,SpriteObjectSpritemaps_3_SmallExplosion_3                   ;B4BEB0;
    dw $0005,SpriteObjectSpritemaps_3_SmallExplosion_4                   ;B4BEB4;
    dw $0006,SpriteObjectSpritemaps_3_SmallExplosion_5                   ;B4BEB8;
    dw Instruction_SpriteObject_Delete                                   ;B4BEBC;


;;; $BEBE: Instruction list - sprite object 4 (unused. Bomb explosion) ;;;
UNUSED_InstList_SpriteObject_4_BombExplosion_B4BEBE:
    dw $0003,UNSUED_SpriteObjectSpritemaps_4_BombExplosion_0_B4CC35      ;B4BEBE;
    dw $0003,UNSUED_SpriteObjectSpritemaps_4_BombExplosion_1_B4CC4B      ;B4BEC2;
    dw $0004,UNSUED_SpriteObjectSpritemaps_4_BombExplosion_2_B4CC61      ;B4BEC6;
    dw $0004,UNSUED_SpriteObjectSpritemaps_4_BombExplosion_3_B4CC77      ;B4BECA;
    dw $0004,UNSUED_SpriteObjectSpritemaps_4_BombExplosion_4_B4CC8D      ;B4BECE;
    dw Instruction_SpriteObject_Delete                                   ;B4BED2;


;;; $BED4: Instruction list - sprite object 5 (unused. Beam trail) ;;;
UNUSED_InstList_SpriteObject_5_BeamTrail_B4BED4:
    dw $0008,UNSUED_SpriteObjectSpritemaps_5_BeamTrail_0_B4CCB9          ;B4BED4;
    dw $0008,UNSUED_SpriteObjectSpritemaps_5_BeamTrail_1_B4CCC0          ;B4BED8;
    dw $0008,UNSUED_SpriteObjectSpritemaps_5_BeamTrail_2_B4CCC7          ;B4BEDC;
    dw $0008,UNSUED_SpriteObjectSpritemaps_5_BeamTrail_3_B4CCCE          ;B4BEE0;
    dw $0018,UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_3_B4CB8D      ;B4BEE4;
    dw Instruction_SpriteObject_Delete                                   ;B4BEE8;


;;; $BEEA: Instruction list - sprite object 6 (dud shot) ;;;
InstList_SpriteObject_6_DudShot:
    dw $0004,SpriteObjectSpritemaps_6_DudShot_0                          ;B4BEEA;
    dw $0004,SpriteObjectSpritemaps_6_DudShot_1                          ;B4BEEE;
    dw $0004,SpriteObjectSpritemaps_6_DudShot_2                          ;B4BEF2;
    dw $0004,SpriteObjectSpritemaps_6_DudShot_3                          ;B4BEF6;
    dw $0004,SpriteObjectSpritemaps_6_DudShot_4                          ;B4BEFA;
    dw $0004,SpriteObjectSpritemaps_6_DudShot_5                          ;B4BEFE;
    dw Instruction_SpriteObject_Delete                                   ;B4BF02;


;;; $BF04: Instruction list - sprite object 7 (unused. Power bomb) ;;;
UNUSED_InstList_SpriteObject_7_PowerBomb_B4BF04:
    dw $0005,UNSUED_SpriteObjectSpritemaps_7_PowerBomb_0_B4CCD5          ;B4BF04;
    dw $0005,UNSUED_SpriteObjectSpritemaps_7_PowerBomb_1_B4CCDC          ;B4BF08;
    dw $0005,UNSUED_SpriteObjectSpritemaps_7_PowerBomb_2_B4CCE3          ;B4BF0C;
    dw Instruction_SpriteObject_Delete                                   ;B4BF10;


;;; $BF12: Instruction list - sprite object 8 (unused. Elevator pad) ;;;
UNUSED_InstList_SpriteObject_8_ElevatorPad_B4BF12:
    dw $0001,UNSUED_SpriteObjectSpritemaps_8_1C_ElevatorPad_0_B4CD57     ;B4BF12;
    dw $0001,UNSUED_SpriteObjectSpritemaps_8_1C_ElevatorPad_1_B4CD6D     ;B4BF16;
    dw Instruction_SpriteObject_Delete                                   ;B4BF1A;


;;; $BF1C: Instruction list - sprite object 9 (small dust cloud) ;;;
InstList_SpriteObject_9_SmallDudShot:
    dw $0005,SpriteObjectSpritemaps_A_PirateLandingDustCloud_0           ;B4BF1C;
    dw $0005,SpriteObjectSpritemaps_9_SmallDustCloud_0                   ;B4BF20;
    dw $0005,SpriteObjectSpritemaps_9_SmallDustCloud_1                   ;B4BF24;
    dw $0005,SpriteObjectSpritemaps_9_SmallDustCloud_2                   ;B4BF28;
    dw $0005,SpriteObjectSpritemaps_9_SmallDustCloud_3                   ;B4BF2C;
    dw Instruction_SpriteObject_Delete                                   ;B4BF30;


;;; $BF32: Instruction list - sprite object Ah (ninja space pirate landing dust cloud) ;;;
InstList_SpriteObject_A_SpacePirateLandingDustCloud:
    dw $0003,SpriteObjectSpritemaps_A_PirateLandingDustCloud_0           ;B4BF32;
    dw $0003,SpriteObjectSpritemaps_A_PirateLandingDustCloud_1           ;B4BF36;
    dw $0003,SpriteObjectSpritemaps_A_PirateLandingDustCloud_2           ;B4BF3A;
    dw $0003,SpriteObjectSpritemaps_A_PirateLandingDustCloud_3           ;B4BF3E;
    dw Instruction_SpriteObject_Delete                                   ;B4BF42;


;;; $BF44: Instruction list - sprite object Bh (unused. Eye door sweat drop) ;;;
UNUSED_InstList_SpriteObject_B_EyeDoorSweatDrop_B4BF44:
    dw $0005,UNSUED_SpriteObjectSpritemaps_B_EyeDoorSweatDrop_0_B4CDD1   ;B4BF44;
    dw $0005,UNSUED_SpriteObjectSpritemaps_B_EyeDoorSweatDrop_1_B4CDD8   ;B4BF48;
    dw $0005,UNSUED_SpriteObjectSpritemaps_B_EyeDoorSweatDrop_2_B4CDDF   ;B4BF4C;
    dw $0005,UNSUED_SpriteObjectSpritemaps_B_EyeDoorSweatDrop_3_B4CDE6   ;B4BF50;
    dw Instruction_SpriteObject_Delete                                   ;B4BF54;


;;; $BF56: Instruction list - sprite object Ch (smoke) ;;;
InstList_SpriteObject_C_Smoke:
    dw $0008,SpriteObjectSpritemaps_C_Smoke_0                            ;B4BF56;
    dw $0008,SpriteObjectSpritemaps_C_Smoke_1                            ;B4BF5A;
    dw $0008,SpriteObjectSpritemaps_C_Smoke_2                            ;B4BF5E;
    dw $0008,SpriteObjectSpritemaps_C_Smoke_3                            ;B4BF62;
    dw Instruction_SpriteObject_Delete                                   ;B4BF66;


;;; $BF68: Instruction list - sprite object 1Ch (unused. Elevator pad) ;;;
UNUSED_InstList_SpriteObject_1C_ElevatorPad_B4BF68:
    dw $0001,UNSUED_SpriteObjectSpritemaps_8_1C_ElevatorPad_0_B4CD57     ;B4BF68;
    dw $0001,UNSUED_SpriteObjectSpritemaps_8_1C_ElevatorPad_1_B4CD6D     ;B4BF6C;
    dw Instruction_SpriteObject_GotoParameter                            ;B4BF70;
    dw UNUSED_InstList_SpriteObject_1C_ElevatorPad_B4BF68                ;B4BF72;


;;; $BF74: Instruction list - sprite object 1Dh (big explosion) ;;;
InstList_SpriteObject_1D_BigExplosion:
    dw $0005,SpriteObjectSpritemaps_1D_BigExplosion_0                    ;B4BF74;
    dw $0005,SpriteObjectSpritemaps_1D_BigExplosion_1                    ;B4BF78;
    dw $0005,SpriteObjectSpritemaps_1D_BigExplosion_2                    ;B4BF7C;
    dw $0005,SpriteObjectSpritemaps_1D_BigExplosion_3                    ;B4BF80;
    dw $0005,SpriteObjectSpritemaps_1D_BigExplosion_4                    ;B4BF84;
    dw $0005,SpriteObjectSpritemaps_1D_BigExplosion_5                    ;B4BF88;
    dw Instruction_SpriteObject_Delete                                   ;B4BF8C;


;;; $BF8E: Instruction list - sprite object Dh (unused. Small health drop) ;;;
UNUSED_InstList_SpriteObject_D_SmallEnergyDrop_B4BF8E:
    dw $0008,UNUSED_SpriteObjectSpritemaps_D_SmallEnergyDrop_0_B4CE1E    ;B4BF8E;
    dw $0008,UNUSED_SpriteObjectSpritemaps_D_SmallEnergyDrop_1_B4CE25    ;B4BF92;
    dw $0008,UNUSED_SpriteObjectSpritemaps_D_SmallEnergyDrop_2_B4CE2C    ;B4BF96;
    dw $0008,UNUSED_SpriteObjectSpritemaps_D_SmallEnergyDrop_3_B4CE33    ;B4BF9A;
    dw Instruction_SpriteObject_Delete                                   ;B4BF9E;


;;; $BFA0: Instruction list - sprite object Eh (unused. Big health drop) ;;;
UNUSED_InstList_SpriteObject_E_BigEnergyDrop_B4BFA0:
    dw $0008,UNUSED_SpriteObjectSpritemaps_E_BigEnergyDrop_0_B4CE3A      ;B4BFA0;
    dw $0008,UNUSED_SpriteObjectSpritemaps_E_BigEnergyDrop_1_B4CE50      ;B4BFA4;
    dw $0008,UNUSED_SpriteObjectSpritemaps_E_BigEnergyDrop_2_B4CE66      ;B4BFA8;
    dw $0008,UNUSED_SpriteObjectSpritemaps_E_BigEnergyDrop_3_B4CE7C      ;B4BFAC;
    dw Instruction_SpriteObject_Delete                                   ;B4BFB0;


;;; $BFB2: Instruction list - sprite object Fh (unused. Bomb) ;;;
UNUSED_InstList_SpriteObject_F_Bomb_B4BFB2:
    dw $0005,UNUSED_SpriteObjectSpritemaps_F_Bomb_0_B4CE83               ;B4BFB2;
    dw $0005,UNUSED_SpriteObjectSpritemaps_F_Bomb_1_B4CE8A               ;B4BFB6;
    dw $0005,UNUSED_SpriteObjectSpritemaps_F_Bomb_2_B4CE91               ;B4BFBA;
    dw $0005,UNUSED_SpriteObjectSpritemaps_F_Bomb_3_B4CE98               ;B4BFBE;
    dw Instruction_SpriteObject_Delete                                   ;B4BFC2;


;;; $BFC4: Instruction list - sprite object 10h (unused. Weird small health drop) ;;;
UNUSED_InstList_SpriteObject_10_WeirdSmallEnergyDrop_B4BFC4:
    dw $0010,UNUSED_SpriteObjectSpritemaps_10_SmallEnergyDrop_0_B4CF87   ;B4BFC4;
    dw $0010,UNUSED_SpriteObjectSpritemaps_10_SmallEnergyDrop_1_B4CF8E   ;B4BFC8;
    dw $0010,UNUSED_SpriteObjectSpritemaps_10_SmallEnergyDrop_2_B4CF95   ;B4BFCC;
    dw Instruction_SpriteObject_Delete                                   ;B4BFD0;


;;; $BFD2: Instruction list - sprite object 11h (unused. Rock particles) ;;;
UNUSED_InstList_SpriteObject_11_RockParticles_B4BFD2:
    dw $0002,UNUSED_SpriteObjectSpritemaps_11_RockParticles_0_B4C6D8     ;B4BFD2;
    dw $0002,UNUSED_SpriteObjectSpritemaps_11_RockParticles_1_B4C6EE     ;B4BFD6;
    dw $0002,UNUSED_SpriteObjectSpritemaps_11_RockParticles_2_B4C704     ;B4BFDA;
    dw $0002,UNUSED_SpriteObjectSpritemaps_11_RockParticles_3_B4C71A     ;B4BFDE;
    dw $0002,UNUSED_SpriteObjectSpritemaps_11_RockParticles_4_B4C730     ;B4BFE2;
    dw $0002,UNUSED_SpriteObjectSpritemaps_11_RockParticles_5_B4C746     ;B4BFE6;
    dw $0002,UNUSED_SpriteObjectSpritemaps_11_RockParticles_6_B4C75C     ;B4BFEA;
    dw $0002,UNUSED_SpriteObjectSpritemaps_11_RockParticles_7_B4C772     ;B4BFEE;
    dw $0002,UNUSED_SpriteObjectSpritemaps_11_RockParticles_8_B4C788     ;B4BFF2;
    dw $0002,UNUSED_SpriteObjectSpritemaps_11_RockParticles_9_B4C79E     ;B4BFF6;
    dw $0002,UNUSED_SpriteObjectSpritemaps_11_RockParticles_A_B4C7B4     ;B4BFFA;
    dw $0002,UNUSED_SpriteObjectSpritemaps_11_RockParticles_B_B4C7CA     ;B4BFFE;
    dw $0002,UNUSED_SpriteObjectSpritemaps_11_RockParticles_C_B4C7E0     ;B4C002;
    dw $0002,UNUSED_SpriteObjectSpritemaps_11_RockParticles_D_B4C7F6     ;B4C006;
    dw $0002,UNUSED_SpriteObjectSpritemaps_11_RockParticles_E_B4C80C     ;B4C00A;
    dw $0002,UNUSED_SpriteObjectSpritemaps_11_RockParticles_F_B4C822     ;B4C00E;
    dw Instruction_SpriteObject_Delete                                   ;B4C012;


;;; $C014: Instruction list - sprite object 12h (short big dust cloud) ;;;
InstList_SpriteObject_12_ShortBigDustCloud:
    dw $0002,SpriteObjectSpritemaps_12_15_BigDustCloud_0                 ;B4C014;
    dw $0002,SpriteObjectSpritemaps_12_15_BigDustCloud_1                 ;B4C018;
    dw $0002,SpriteObjectSpritemaps_12_15_BigDustCloud_2                 ;B4C01C;
    dw $0002,SpriteObjectSpritemaps_12_15_BigDustCloud_3                 ;B4C020;
    dw Instruction_SpriteObject_Delete                                   ;B4C024;


;;; $C026: Instruction list - sprite object 13h (unused. Short big dust cloud with weird short beam) ;;;
UNUSED_InstList_SpriteObject_13_ShortBigDustCloudBeam_B4C026:
    dw $0003,SpriteObjectSpritemaps_13_14_15_BigDustCloud_4              ;B4C026;
    dw $0003,SpriteObjectSpritemaps_13_14_15_BigDustCloud_5              ;B4C02A;
    dw $0003,SpriteObjectSpritemaps_13_14_15_BigDustCloud_6              ;B4C02E;
    dw $0003,SpriteObjectSpritemaps_13_14_15_BigDustCloud_7              ;B4C032;
    dw $0003,UNUSED_SpriteObjectSpritemaps_13_14_16_DustCloud_Beam_B4C8AC;B4C036;
    dw $0005,UNUSED_SpriteObjectSpritemaps_13_14_16_DustCloud_Beam_B4C8B3;B4C03A;
    dw Instruction_SpriteObject_Delete                                   ;B4C03E;


;;; $C040: Instruction list - sprite object 14h (unused. Short big dust cloud with weird medium beam) ;;;
UNUSED_InstList_SpriteObject_14_ShortBigDustCloudBeam_B4C040:
    dw $0003,SpriteObjectSpritemaps_13_14_15_BigDustCloud_4              ;B4C040;
    dw $0003,SpriteObjectSpritemaps_13_14_15_BigDustCloud_5              ;B4C044;
    dw $0003,SpriteObjectSpritemaps_13_14_15_BigDustCloud_6              ;B4C048;
    dw $0003,SpriteObjectSpritemaps_13_14_15_BigDustCloud_7              ;B4C04C;
    dw $0003,UNUSED_SpriteObjectSpritemaps_13_14_16_DustCloud_Beam_B4C8AC;B4C050;
    dw $0003,UNUSED_SpriteObjectSpritemaps_13_14_16_DustCloud_Beam_B4C8B3;B4C054;
    dw $0003,UNUSED_SpriteObjectSpritemaps_14_16_DustCloud_Beam_B4C8BA   ;B4C058;
    dw Instruction_SpriteObject_Delete                                   ;B4C05C;


;;; $C05E: Instruction list - sprite object 15h (big dust cloud) ;;;
InstList_SpriteObject_15_BigDustCloud:
    dw $0005,SpriteObjectSpritemaps_12_15_BigDustCloud_0                 ;B4C05E;
    dw $0005,SpriteObjectSpritemaps_12_15_BigDustCloud_1                 ;B4C062;
    dw $0005,SpriteObjectSpritemaps_12_15_BigDustCloud_2                 ;B4C066;
    dw $0005,SpriteObjectSpritemaps_12_15_BigDustCloud_3                 ;B4C06A;
    dw $0005,SpriteObjectSpritemaps_13_14_15_BigDustCloud_4              ;B4C06E;
    dw $0005,SpriteObjectSpritemaps_13_14_15_BigDustCloud_5              ;B4C072;
    dw $0005,SpriteObjectSpritemaps_13_14_15_BigDustCloud_6              ;B4C076;
    dw $0005,SpriteObjectSpritemaps_13_14_15_BigDustCloud_7              ;B4C07A;
    dw Instruction_SpriteObject_Delete                                   ;B4C07E;


;;; $C080: Instruction list - sprite object 16h (unused. Weird long beam) ;;;
UNUSED_InstList_SpriteObject_16_WeirdLongBeam_B4C080:
    dw $0001,UNUSED_SpriteObjectSpritemaps_13_14_16_DustCloud_Beam_B4C8AC;B4C080;
    dw $0001,UNUSED_SpriteObjectSpritemaps_13_14_16_DustCloud_Beam_B4C8B3;B4C084;
    dw $0001,UNUSED_SpriteObjectSpritemaps_14_16_DustCloud_Beam_B4C8BA   ;B4C088;
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_DustCloud_Beam_B4C8C6      ;B4C08C;
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_DustCloud_Beam_B4C8D2      ;B4C090;
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_DustCloud_Beam_B4C8E2      ;B4C094;
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4   ;B4C098;
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A   ;B4C09C;
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4   ;B4C0A0;
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A   ;B4C0A4;
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4   ;B4C0A8;
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A   ;B4C0AC;
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4   ;B4C0B0;
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A   ;B4C0B4;
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4   ;B4C0B8;
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A   ;B4C0BC;
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4   ;B4C0C0;
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A   ;B4C0C4;
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4   ;B4C0C8;
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A   ;B4C0CC;
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4   ;B4C0D0;
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A   ;B4C0D4;
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4   ;B4C0D8;
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A   ;B4C0DC;
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4   ;B4C0E0;
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A   ;B4C0E4;
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4   ;B4C0E8;
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A   ;B4C0EC;
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4   ;B4C0F0;
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A   ;B4C0F4;
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4   ;B4C0F8;
    dw Instruction_SpriteObject_Delete                                   ;B4C0FC;


;;; $C0FE: Instruction list - sprite object 17h (unused. Weird long flickering beam) ;;;
UNUSED_InstList_SpriteObject_17_WeirdLongFlickerBeam_B4C0FE:
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4   ;B4C0FE;
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A   ;B4C102;
    dw $0001,UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4   ;B4C106;
    dw Instruction_SpriteObject_Delete                                   ;B4C10A;


;;; $C10C: Instruction list - sprite object 18h (short Draygon breath bubbles) ;;;
InstList_SpriteObject_18_ShortDraygonBreathBubbles:
    dw $0003,SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_0       ;B4C10C;
    dw $0003,SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_1       ;B4C110;
    dw $0003,SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_2       ;B4C114;
    dw $0003,SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_3       ;B4C118;
    dw $0003,SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_4       ;B4C11C;
    dw $0003,SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_5       ;B4C120;
    dw $0003,SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_6       ;B4C124;
    dw $0003,SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_7       ;B4C128;
    dw $0003,SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_8       ;B4C12C;
    dw Instruction_SpriteObject_Delete                                   ;B4C130;


;;; $C132: Instruction list - sprite object 19h (unused. Save station laser) ;;;
UNSUED_InstList_SpriteObject_19_SaveStationElectricity:
    dw $0001,UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_0_B4C9A0  ;B4C132;
    dw $0001,UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_1_B4C9B6  ;B4C136;
    dw $0001,UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_2_B4C9CC  ;B4C13A;
    dw $0001,UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_3_B4C9E2  ;B4C13E;
    dw $0001,UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_4_B4C9F8  ;B4C142;
    dw $0001,UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_5_B4CA0E  ;B4C146;
    dw $0001,UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_6_B4CA24  ;B4C14A;
    dw $0001,UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_7_B4CA3A  ;B4C14E;
    dw Instruction_SpriteObject_Delete                                   ;B4C152;


;;; $C154: Instruction list - sprite object 1Ah (unused. Expanding vertical gate) ;;;
UNUSED_InstList_SpriteObject_1A_ExpandingVerticalGate_B4C154:
    dw $0010,UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_0_B4CA50   ;B4C154;
    dw $0010,UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_1_B4CA5C   ;B4C158;
    dw $0010,UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_2_B4CA63   ;B4C15C;
    dw $0010,UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_3_B4CA6F   ;B4C160;
    dw $0010,UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_4_B4CA7B   ;B4C164;
    dw $0010,UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_5_B4CA8C   ;B4C168;
    dw $0010,UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_6_B4CA9D   ;B4C16C;
    dw $0010,UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_7_B4CAB3   ;B4C170;
    dw Instruction_SpriteObject_Delete                                   ;B4C174;


;;; $C176: Instruction list - sprite object 1Bh (unused. Contracting vertical gate) ;;;
UNUSED_InstList_SpriteObject_1B_ContractingVerticalGate:
    dw $0004,UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_7_B4CAB3   ;B4C176;
    dw $0004,UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_6_B4CA9D   ;B4C17A;
    dw $0004,UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_5_B4CA8C   ;B4C17E;
    dw $0004,UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_4_B4CA7B   ;B4C182;
    dw $0004,UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_3_B4CA6F   ;B4C186;
    dw $0004,UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_2_B4CA63   ;B4C18A;
    dw $0004,UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_1_B4CA5C   ;B4C18E;
    dw $0004,UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_0_B4CA50   ;B4C192;
    dw Instruction_SpriteObject_Delete                                   ;B4C196;


;;; $C198: Instruction list - sprite object 1Eh (unused) ;;;
UNUSED_InstList_SpriteObject_1E_B4C198:
    dw $0005,UNUSED_SpriteObjectSpritemaps_1E_0_B4C630                   ;B4C198;
    dw $0005,UNUSED_SpriteObjectSpritemaps_1E_1_B4C637                   ;B4C19C;
    dw $0005,UNUSED_SpriteObjectSpritemaps_1E_0_B4C630                   ;B4C1A0;
    dw $0005,UNUSED_SpriteObjectSpritemaps_1E_2_B4C63E                   ;B4C1A4;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C1A8;
    dw UNUSED_InstList_SpriteObject_1E_B4C198                            ;B4C1AA;


;;; $C1AC: Instruction list - sprite object 1Fh (unused) ;;;
UNUSED_InstList_SpriteObject_1F_B4C1AC:
    dw $0005,UNUSED_SpriteObjectSpritemaps_1F_0_B4C645                   ;B4C1AC;
    dw $0005,UNUSED_SpriteObjectSpritemaps_1F_1_B4C645                   ;B4C1B0;
    dw $0005,UNUSED_SpriteObjectSpritemaps_1F_0_B4C645                   ;B4C1B4;
    dw $0005,UNUSED_SpriteObjectSpritemaps_1F_2_B4C653                   ;B4C1B8;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C1BC;
    dw UNUSED_InstList_SpriteObject_1F_B4C1AC                            ;B4C1BE;


;;; $C1C0: Instruction list - sprite object 20h (unused) ;;;
UNUSED_InstList_SpriteObject_20_B4C1C0:
    dw $0005,UNUSED_SpriteObjectSpritemaps_20_0_B4C65A                   ;B4C1C0;
    dw $0005,UNUSED_SpriteObjectSpritemaps_20_1_B4C661                   ;B4C1C4;
    dw $0005,UNUSED_SpriteObjectSpritemaps_20_0_B4C65A                   ;B4C1C8;
    dw $0005,UNUSED_SpriteObjectSpritemaps_20_2_B4C668                   ;B4C1CC;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C1D0;
    dw UNUSED_InstList_SpriteObject_20_B4C1C0                            ;B4C1D2;


;;; $C1D4: Instruction list - sprite object 21h (unused) ;;;
UNUSED_InstList_SpriteObject_21_B4C1D4:
    dw $0005,UNUSED_SpriteObjectSpritemaps_21_0_B4C66F                   ;B4C1D4;
    dw $0005,UNUSED_SpriteObjectSpritemaps_21_1_B4C676                   ;B4C1D8;
    dw $0005,UNUSED_SpriteObjectSpritemaps_21_0_B4C66F                   ;B4C1DC;
    dw $0005,UNUSED_SpriteObjectSpritemaps_21_2_B4C67D                   ;B4C1E0;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C1E4;
    dw UNUSED_InstList_SpriteObject_21_B4C1D4                            ;B4C1E6;


;;; $C1E8: Instruction list - sprite object 22h (unused) ;;;
UNUSED_InstList_SpriteObject_22_B4C1E8:
    dw $0005,UNUSED_SpriteObjectSpritemaps_22_0_B4C684                   ;B4C1E8;
    dw $0005,UNUSED_SpriteObjectSpritemaps_22_1_B4C68B                   ;B4C1EC;
    dw $0005,UNUSED_SpriteObjectSpritemaps_22_0_B4C684                   ;B4C1F0;
    dw $0005,UNUSED_SpriteObjectSpritemaps_22_2_B4C692                   ;B4C1F4;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C1F8;
    dw UNUSED_InstList_SpriteObject_22_B4C1E8                            ;B4C1FA;


;;; $C1FC: Instruction list - sprite object 23h (unused) ;;;
UNUSED_InstList_SpriteObject_23_B4C1FC:
    dw $0005,UNUSED_SpriteObjectSpritemaps_23_0_B4C699                   ;B4C1FC;
    dw $0005,UNUSED_SpriteObjectSpritemaps_23_1_B4C6A0                   ;B4C200;
    dw $0005,UNUSED_SpriteObjectSpritemaps_23_0_B4C699                   ;B4C204;
    dw $0005,UNUSED_SpriteObjectSpritemaps_23_2_B4C6A7                   ;B4C208;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C20C;
    dw UNUSED_InstList_SpriteObject_23_B4C1FC                            ;B4C20E;


;;; $C210: Instruction list - sprite object 24h (unused) ;;;
UNUSED_InstList_SpriteObject_24_B4C210:
    dw $0005,UNUSED_SpriteObjectSpritemaps_24_0_B4C6AE                   ;B4C210;
    dw $0005,UNUSED_SpriteObjectSpritemaps_24_1_B4C6B5                   ;B4C214;
    dw $0005,UNUSED_SpriteObjectSpritemaps_24_0_B4C6AE                   ;B4C218;
    dw $0005,UNUSED_SpriteObjectSpritemaps_24_2_B4C6BC                   ;B4C21C;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C220;
    dw UNUSED_InstList_SpriteObject_24_B4C210                            ;B4C222;


;;; $C224: Instruction list - sprite object 25h (unused) ;;;
UNUSED_InstList_SpriteObject_25_B4C224:
    dw $0005,UNUSED_SpriteObjectSpritemaps_25_0_B4C6C3                   ;B4C224;
    dw $0005,UNUSED_SpriteObjectSpritemaps_25_1_B4C6CA                   ;B4C228;
    dw $0005,UNUSED_SpriteObjectSpritemaps_25_0_B4C6C3                   ;B4C22C;
    dw $0005,UNUSED_SpriteObjectSpritemaps_25_2_B4C6D1                   ;B4C230;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C234;
    dw UNUSED_InstList_SpriteObject_25_B4C224                            ;B4C236;


;;; $C238: Instruction list - sprite object 26h (unused) ;;;
UNUSED_InstList_SpriteObject_26_B4C238:
    dw $000A,UNUSED_SpriteObjectSpritemaps_26_0_B4D08B                   ;B4C238;
    dw $000A,UNUSED_SpriteObjectSpritemaps_26_0_B4D08B                   ;B4C23C;
    dw $000A,UNUSED_SpriteObjectSpritemaps_26_1_B4D0BA                   ;B4C240;
    dw $000A,UNUSED_SpriteObjectSpritemaps_26_2_B4D0E9                   ;B4C244;
    dw $000A,UNUSED_SpriteObjectSpritemaps_26_3_B4D118                   ;B4C248;
    dw $000A,UNUSED_SpriteObjectSpritemaps_26_4_B4D147                   ;B4C24C;
    dw $000A,UNUSED_SpriteObjectSpritemaps_26_5_B4D176                   ;B4C250;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C254;
    dw UNUSED_InstList_SpriteObject_26_B4C238                            ;B4C256;


;;; $C258: Instruction list - sprite object 27h (unused) ;;;
UNUSED_InstList_SpriteObject_27_B4C258:
    dw $000A,UNUSED_SpriteObjectSpritemaps_27_0_B4D1D4                   ;B4C258;
    dw $000A,UNUSED_SpriteObjectSpritemaps_27_1_B4D1EF                   ;B4C25C;
    dw $000A,UNUSED_SpriteObjectSpritemaps_27_2_B4D20A                   ;B4C260;
    dw $000A,UNUSED_SpriteObjectSpritemaps_27_3_B4D225                   ;B4C264;
    dw $000A,UNUSED_SpriteObjectSpritemaps_27_0_B4D1D4                   ;B4C268;
    dw $000A,UNUSED_SpriteObjectSpritemaps_27_1_B4D1EF                   ;B4C26C;
    dw $000A,UNUSED_SpriteObjectSpritemaps_27_2_B4D20A                   ;B4C270;
    dw $000A,UNUSED_SpriteObjectSpritemaps_27_3_B4D225                   ;B4C274;
    dw $000A,UNUSED_SpriteObjectSpritemaps_27_0_B4D1D4                   ;B4C278;
    dw $000A,UNUSED_SpriteObjectSpritemaps_27_1_B4D1EF                   ;B4C27C;
    dw $000A,UNUSED_SpriteObjectSpritemaps_27_2_B4D20A                   ;B4C280;
    dw $000A,UNUSED_SpriteObjectSpritemaps_27_3_B4D225                   ;B4C284;
    dw $000A,UNUSED_SpriteObjectSpritemaps_27_0_B4D1D4                   ;B4C288;
    dw $000A,UNUSED_SpriteObjectSpritemaps_27_1_B4D1EF                   ;B4C28C;
    dw $000A,UNUSED_SpriteObjectSpritemaps_27_2_B4D20A                   ;B4C290;
    dw $000A,UNUSED_SpriteObjectSpritemaps_27_3_B4D225                   ;B4C294;
    dw $0030,UNUSED_SpriteObjectSpritemaps_27_4_B4D245                   ;B4C298;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C29C;
    dw UNUSED_InstList_SpriteObject_27_B4C258                            ;B4C29E;


;;; $C2A0: Instruction list - sprite object 28h (unused) ;;;
UNUSED_InstList_SpriteObject_28_B4C2A0:
    dw $000A,UNUSED_SpriteObjectSpritemaps_28_0_B4D2B3                   ;B4C2A0;
    dw $000A,UNUSED_SpriteObjectSpritemaps_28_1_B4D2E2                   ;B4C2A4;
    dw $000A,UNUSED_SpriteObjectSpritemaps_28_2_B4D311                   ;B4C2A8;
    dw $000A,UNUSED_SpriteObjectSpritemaps_28_3_B4D340                   ;B4C2AC;
    dw $000A,UNUSED_SpriteObjectSpritemaps_28_4_B4D36F                   ;B4C2B0;
    dw $000A,UNUSED_SpriteObjectSpritemaps_28_5_B4D39E                   ;B4C2B4;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C2B8;
    dw UNUSED_InstList_SpriteObject_28_B4C2A0                            ;B4C2BA;


;;; $C2BC: Instruction list - sprite object 29h (unused) ;;;
UNUSED_InstList_SpriteObject_29_B4C2BC:
    dw $000A,UNUSED_SpriteObjectSpritemaps_29_0_B4D3FC                   ;B4C2BC;
    dw $000A,UNUSED_SpriteObjectSpritemaps_29_1_B4D417                   ;B4C2C0;
    dw $000A,UNUSED_SpriteObjectSpritemaps_29_2_B4D432                   ;B4C2C4;
    dw $000A,UNUSED_SpriteObjectSpritemaps_29_3_B4D44D                   ;B4C2C8;
    dw $000A,UNUSED_SpriteObjectSpritemaps_29_0_B4D3FC                   ;B4C2CC;
    dw $000A,UNUSED_SpriteObjectSpritemaps_29_1_B4D417                   ;B4C2D0;
    dw $000A,UNUSED_SpriteObjectSpritemaps_29_2_B4D432                   ;B4C2D4;
    dw $000A,UNUSED_SpriteObjectSpritemaps_29_3_B4D44D                   ;B4C2D8;
    dw $000A,UNUSED_SpriteObjectSpritemaps_29_0_B4D3FC                   ;B4C2DC;
    dw $000A,UNUSED_SpriteObjectSpritemaps_29_1_B4D417                   ;B4C2E0;
    dw $000A,UNUSED_SpriteObjectSpritemaps_29_2_B4D432                   ;B4C2E4;
    dw $000A,UNUSED_SpriteObjectSpritemaps_29_3_B4D44D                   ;B4C2E8;
    dw $000A,UNUSED_SpriteObjectSpritemaps_29_0_B4D3FC                   ;B4C2EC;
    dw $000A,UNUSED_SpriteObjectSpritemaps_29_1_B4D417                   ;B4C2F0;
    dw $000A,UNUSED_SpriteObjectSpritemaps_29_2_B4D432                   ;B4C2F4;
    dw $000A,UNUSED_SpriteObjectSpritemaps_29_3_B4D44D                   ;B4C2F8;
    dw $0030,UNUSED_SpriteObjectSpritemaps_29_4_B4D46D                   ;B4C2FC;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C300;
    dw UNUSED_InstList_SpriteObject_29_B4C2BC                            ;B4C302;


;;; $C304: Instruction list - sprite object 2Ah (unused) ;;;
UNUSED_InstList_SpriteObject_2A_B4C304:
    dw $0001,UNUSED_SpriteObjectSpritemaps_2A_B4D2AC                     ;B4C304;
    dw Instruction_SpriteObject_GoBack4Bytes                             ;B4C308;


;;; $C30A: Instruction list - sprite object 2Bh (fire arc body) ;;;
InstList_SpriteObject_2B_PuromiBody:
    dw $0003,SpriteObjectSpritemaps_2B_Puromi_0                          ;B4C30A;
    dw $0003,SpriteObjectSpritemaps_2B_Puromi_1                          ;B4C30E;
    dw $0003,SpriteObjectSpritemaps_2B_Puromi_4                          ;B4C312;
    dw $0003,SpriteObjectSpritemaps_2B_Puromi_2                          ;B4C316;
    dw $0003,SpriteObjectSpritemaps_2B_Puromi_3                          ;B4C31A;
    dw $0003,SpriteObjectSpritemaps_2B_Puromi_5                          ;B4C31E;
    dw $0003,SpriteObjectSpritemaps_2B_Puromi_0                          ;B4C322;
    dw $0003,SpriteObjectSpritemaps_2B_Puromi_1                          ;B4C326;
    dw $0003,SpriteObjectSpritemaps_2B_Puromi_6                          ;B4C32A;
    dw $0003,SpriteObjectSpritemaps_2B_Puromi_2                          ;B4C32E;
    dw $0003,SpriteObjectSpritemaps_2B_Puromi_3                          ;B4C332;
    dw $0003,SpriteObjectSpritemaps_2B_Puromi_7                          ;B4C336;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C33A;
    dw InstList_SpriteObject_2B_PuromiBody                               ;B4C33C;


;;; $C33E: Instruction list - sprite object 2Ch (fire arc right explosion) ;;;
InstList_SpriteObject_2C_PuromiRightExplosion:
    dw $0002,SpriteObjectSpritemaps_2C_PuromiRightExplosion_0            ;B4C33E;
    dw $0002,SpriteObjectSpritemaps_2C_PuromiRightExplosion_1            ;B4C342;
    dw $0002,SpriteObjectSpritemaps_2C_PuromiRightExplosion_2            ;B4C346;
    dw $0002,SpriteObjectSpritemaps_2C_PuromiRightExplosion_3            ;B4C34A;
    dw $0002,SpriteObjectSpritemaps_2C_PuromiRightExplosion_4            ;B4C34E;
    dw $0002,SpriteObjectSpritemaps_2C_PuromiRightExplosion_5            ;B4C352;
    dw $0002,SpriteObjectSpritemaps_2C_PuromiRightExplosion_6            ;B4C356;
    dw Instruction_SpriteObject_Delete                                   ;B4C35A;


;;; $C35C: Instruction list - sprite object 2Dh (fire arc left explosion) ;;;
InstList_SpriteObject_2D_PuromiLeftExplosion:
    dw $0002,SpriteObjectSpritemaps_2D_PuromiLeftExplosion_0             ;B4C35C;
    dw $0002,SpriteObjectSpritemaps_2D_PuromiLeftExplosion_1             ;B4C360;
    dw $0002,SpriteObjectSpritemaps_2D_PuromiLeftExplosion_2             ;B4C364;
    dw $0002,SpriteObjectSpritemaps_2D_PuromiLeftExplosion_3             ;B4C368;
    dw $0002,SpriteObjectSpritemaps_2D_PuromiLeftExplosion_4             ;B4C36C;
    dw $0002,SpriteObjectSpritemaps_2D_PuromiLeftExplosion_5             ;B4C370;
    dw $0002,SpriteObjectSpritemaps_2D_PuromiLeftExplosion_6             ;B4C374;
    dw Instruction_SpriteObject_Delete                                   ;B4C378;


;;; $C37A: Instruction list - sprite object 2Eh (fire arc splash) ;;;
InstList_SpriteObject_2E_PuromiSplash:
    dw $0002,SpriteObjectSpritemaps_2E_PuromiSplash_0                    ;B4C37A;
    dw $0002,SpriteObjectSpritemaps_2E_PuromiSplash_0                    ;B4C37E;
    dw $0002,SpriteObjectSpritemaps_2E_PuromiSplash_1                    ;B4C382;
    dw $0002,SpriteObjectSpritemaps_2E_PuromiSplash_2                    ;B4C386;
    dw $0002,SpriteObjectSpritemaps_2E_PuromiSplash_4                    ;B4C38A;
    dw Instruction_SpriteObject_Delete                                   ;B4C38E;


;;; $C390: Instruction list - sprite object 30h (falling spark trail) ;;;
InstList_SpriteObject_30_FallingSparkTrail:
    dw $0003,SpriteObjectSpritemaps_30_FallingSparkTrail_0               ;B4C390;
    dw $0003,SpriteObjectSpritemaps_30_FallingSparkTrail_1               ;B4C394;
    dw $0003,SpriteObjectSpritemaps_30_FallingSparkTrail_2               ;B4C398;
    dw $0003,SpriteObjectSpritemaps_30_FallingSparkTrail_3               ;B4C39C;
    dw Instruction_SpriteObject_Delete                                   ;B4C3A0;


;;; $C3A2: Instruction list - sprite object 31h (unused. Metroid insides) ;;;
UNSUED_InstList_SpriteObject_31_MetroidInsides_B4C3A2:
    dw $0010,UNUSED_SpriteObjectSpritemaps_31_MetroidInsides_0_B4D653    ;B4C3A2;
    dw $0010,UNUSED_SpriteObjectSpritemaps_31_MetroidInsides_1_B4D67D    ;B4C3A6;
    dw $0006,UNUSED_SpriteObjectSpritemaps_31_MetroidInsides_2_B4D69D    ;B4C3AA;
    dw $000A,UNUSED_SpriteObjectSpritemaps_31_MetroidInsides_3_B4D6C7    ;B4C3AE;
    dw $0010,UNUSED_SpriteObjectSpritemaps_31_MetroidInsides_1_B4D67D    ;B4C3B2;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C3B6;
    dw UNSUED_InstList_SpriteObject_31_MetroidInsides_B4C3A2             ;B4C3B8;


;;; $C3BA: Instruction list - sprite object 32h (metroid electricity) ;;;
InstList_SpriteObject_32_MetroidElectricity:
    dw $0002,SpriteObjectSpritemaps_32_33_MetroidElectricity_0           ;B4C3BA;
    dw $0003,SpriteObjectSpritemaps_32_33_MetroidElectricity_1           ;B4C3BE;
    dw $0002,SpriteObjectSpritemaps_32_33_MetroidElectricity_2           ;B4C3C2;
    dw $0001,SpriteObjectSpritemaps_32_33_MetroidElectricity_0           ;B4C3C6;
    dw $0003,SpriteObjectSpritemaps_32_33_MetroidElectricity_2           ;B4C3CA;
    dw $0004,SpriteObject_DrawInst_Empty                                 ;B4C3CE;
    dw $0004,SpriteObjectSpritemaps_32_33_MetroidElectricity_3           ;B4C3D2;
    dw $0005,SpriteObjectSpritemaps_32_33_MetroidElectricity_4           ;B4C3D6;
    dw $0002,SpriteObjectSpritemaps_32_33_MetroidElectricity_5           ;B4C3DA;
    dw $0001,SpriteObjectSpritemaps_32_33_MetroidElectricity_4           ;B4C3DE;
    dw $0004,SpriteObject_DrawInst_Empty                                 ;B4C3E2;
    dw $0002,SpriteObjectSpritemaps_32_MetroidElectricity_C              ;B4C3E6;
    dw $0003,SpriteObjectSpritemaps_32_MetroidElectricity_D              ;B4C3EA;
    dw $0004,SpriteObjectSpritemaps_32_MetroidElectricity_E              ;B4C3EE;
    dw $0007,SpriteObject_DrawInst_Empty                                 ;B4C3F2;
    dw $0003,SpriteObjectSpritemaps_32_33_MetroidElectricity_9           ;B4C3F6;
    dw $0002,SpriteObjectSpritemaps_32_33_MetroidElectricity_A           ;B4C3FA;
    dw $0001,SpriteObjectSpritemaps_32_33_MetroidElectricity_B           ;B4C3FE;
    dw $0002,SpriteObjectSpritemaps_32_33_MetroidElectricity_A           ;B4C402;
    dw $0003,SpriteObjectSpritemaps_32_33_MetroidElectricity_B           ;B4C406;
    dw $0004,SpriteObject_DrawInst_Empty                                 ;B4C40A;
    dw $0004,SpriteObjectSpritemaps_32_33_MetroidElectricity_F           ;B4C40E;
    dw $0002,SpriteObjectSpritemaps_32_33_MetroidElectricity_10          ;B4C412;
    dw $0002,SpriteObjectSpritemaps_32_33_MetroidElectricity_11          ;B4C416;
    dw $0003,SpriteObjectSpritemaps_32_33_MetroidElectricity_F           ;B4C41A;
    dw $0001,SpriteObject_DrawInst_Empty                                 ;B4C41E;
    dw $0004,SpriteObjectSpritemaps_32_MetroidElectricity_12             ;B4C422;
    dw $0003,SpriteObjectSpritemaps_32_MetroidElectricity_13             ;B4C426;
    dw $0003,SpriteObjectSpritemaps_32_MetroidElectricity_14             ;B4C42A;
    dw $0002,SpriteObjectSpritemaps_32_MetroidElectricity_13             ;B4C42E;
    dw $0007,SpriteObject_DrawInst_Empty                                 ;B4C432;


;;; $C436: Instruction list - sprite object 33h (unused) ;;;
UNUSED_InstList_SpriteObject_33_B4C436:
    dw $0002,SpriteObjectSpritemaps_32_33_MetroidElectricity_6           ;B4C436;
    dw $0003,SpriteObjectSpritemaps_32_33_MetroidElectricity_7           ;B4C43A;
    dw $0004,SpriteObjectSpritemaps_32_33_MetroidElectricity_8           ;B4C43E;
    dw $0002,SpriteObjectSpritemaps_32_33_MetroidElectricity_6           ;B4C442;
    dw $0001,SpriteObjectSpritemaps_32_33_MetroidElectricity_8           ;B4C446;
    dw $0003,SpriteObject_DrawInst_Empty                                 ;B4C44A;
    dw $0002,SpriteObjectSpritemaps_32_33_MetroidElectricity_15          ;B4C44E;
    dw $0003,SpriteObjectSpritemaps_32_33_MetroidElectricity_16          ;B4C452;
    dw $0004,SpriteObjectSpritemaps_32_33_MetroidElectricity_17          ;B4C456;
    dw $0001,SpriteObjectSpritemaps_32_33_MetroidElectricity_15          ;B4C45A;
    dw $0003,SpriteObject_DrawInst_Empty                                 ;B4C45E;
    dw $0003,SpriteObjectSpritemaps_32_33_MetroidElectricity_6           ;B4C462;
    dw $0004,SpriteObjectSpritemaps_32_33_MetroidElectricity_8           ;B4C466;
    dw $0020,SpriteObject_DrawInst_Empty                                 ;B4C46A;
    dw $0002,SpriteObjectSpritemaps_32_33_MetroidElectricity_0           ;B4C46E;
    dw $0001,SpriteObjectSpritemaps_32_33_MetroidElectricity_1           ;B4C472;
    dw $0002,SpriteObjectSpritemaps_32_33_MetroidElectricity_2           ;B4C476;
    dw $0001,SpriteObjectSpritemaps_32_33_MetroidElectricity_0           ;B4C47A;
    dw $0004,SpriteObject_DrawInst_Empty                                 ;B4C47E;
    dw $0003,SpriteObjectSpritemaps_32_33_MetroidElectricity_F           ;B4C482;
    dw $0004,SpriteObjectSpritemaps_32_33_MetroidElectricity_10          ;B4C486;
    dw $0005,SpriteObjectSpritemaps_32_33_MetroidElectricity_11          ;B4C48A;
    dw $0004,SpriteObject_DrawInst_Empty                                 ;B4C48E;
    dw $0002,SpriteObjectSpritemaps_32_33_MetroidElectricity_9           ;B4C492;
    dw $0001,SpriteObjectSpritemaps_32_33_MetroidElectricity_A           ;B4C496;
    dw $0003,SpriteObjectSpritemaps_32_33_MetroidElectricity_B           ;B4C49A;
    dw $0001,SpriteObjectSpritemaps_32_33_MetroidElectricity_9           ;B4C49E;
    dw $0006,SpriteObject_DrawInst_Empty                                 ;B4C4A2;
    dw $0003,SpriteObjectSpritemaps_32_33_MetroidElectricity_3           ;B4C4A6;
    dw $0004,SpriteObjectSpritemaps_32_33_MetroidElectricity_4           ;B4C4AA;
    dw $0002,SpriteObjectSpritemaps_32_33_MetroidElectricity_5           ;B4C4AE;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C4B2;
    dw UNUSED_InstList_SpriteObject_33_B4C436                            ;B4C4B4;


;;; $C4B6: Instruction list - sprite object 34h (metroid shell) ;;;
InstList_SpriteObject_34_MetroidShell:
    dw $0001,SpriteObjectSpritemaps_34_35_36_MetroidShell_0              ;B4C4B6;
    dw $0001,SpriteObject_DrawInst_Empty                                 ;B4C4BA;
    dw $0001,SpriteObjectSpritemaps_34_35_36_MetroidShell_0              ;B4C4BE;
    dw $0001,SpriteObject_DrawInst_Empty                                 ;B4C4C2;
    dw $0001,SpriteObjectSpritemaps_34_35_36_MetroidShell_0              ;B4C4C6;
    dw $0001,SpriteObject_DrawInst_Empty                                 ;B4C4CA;
    dw $0001,SpriteObjectSpritemaps_34_35_36_MetroidShell_0              ;B4C4CE;
    dw $0001,SpriteObject_DrawInst_Empty                                 ;B4C4D2;
    dw $0001,SpriteObjectSpritemaps_34_35_36_MetroidShell_0              ;B4C4D6;
    dw $0001,SpriteObject_DrawInst_Empty                                 ;B4C4DA;
    dw $0001,SpriteObjectSpritemaps_34_35_36_MetroidShell_0              ;B4C4DE;
    dw $0001,SpriteObject_DrawInst_Empty                                 ;B4C4E2;
    dw $0001,SpriteObjectSpritemaps_34_35_36_MetroidShell_0              ;B4C4E6;
    dw $0001,SpriteObject_DrawInst_Empty                                 ;B4C4EA;
    dw $0001,SpriteObjectSpritemaps_34_36_MetroidShell_1                 ;B4C4EE;
    dw $0001,SpriteObject_DrawInst_Empty                                 ;B4C4F2;
    dw $0001,SpriteObjectSpritemaps_34_36_MetroidShell_1                 ;B4C4F6;
    dw $0001,SpriteObject_DrawInst_Empty                                 ;B4C4FA;
    dw $0001,SpriteObjectSpritemaps_34_36_MetroidShell_1                 ;B4C4FE;
    dw $0001,SpriteObject_DrawInst_Empty                                 ;B4C502;
    dw $0001,SpriteObjectSpritemaps_34_36_MetroidShell_1                 ;B4C506;
    dw $0001,SpriteObject_DrawInst_Empty                                 ;B4C50A;
    dw $0001,SpriteObjectSpritemaps_34_36_MetroidShell_1                 ;B4C50E;
    dw $0001,SpriteObject_DrawInst_Empty                                 ;B4C512;
    dw $0001,SpriteObjectSpritemaps_34_36_MetroidShell_1                 ;B4C516;
    dw $0001,SpriteObject_DrawInst_Empty                                 ;B4C51A;
    dw $0001,SpriteObjectSpritemaps_34_36_MetroidShell_1                 ;B4C51E;
    dw $0001,SpriteObject_DrawInst_Empty                                 ;B4C522;
    dw $0001,SpriteObjectSpritemaps_34_36_MetroidShell_1                 ;B4C526;
    dw $0001,SpriteObject_DrawInst_Empty                                 ;B4C52A;
    dw $0001,SpriteObjectSpritemaps_34_35_36_MetroidShell_0              ;B4C52E;
    dw $0001,SpriteObject_DrawInst_Empty                                 ;B4C532;


;;; $C536: Instruction list - sprite object 35h (unused) ;;;
UNUSED_InstList_SpriteObject_35_B4C536:
    dw $0001,SpriteObjectSpritemaps_34_35_36_MetroidShell_0              ;B4C536;
    dw $0001,SpriteObject_DrawInst_Empty                                 ;B4C53A;
    dw $0001,SpriteObjectSpritemaps_34_35_36_MetroidShell_0              ;B4C53E;
    dw $0001,SpriteObject_DrawInst_Empty                                 ;B4C542;
    dw $0001,SpriteObjectSpritemaps_34_35_36_MetroidShell_0              ;B4C546;
    dw $0001,SpriteObject_DrawInst_Empty                                 ;B4C54A;
    dw $0001,SpriteObjectSpritemaps_34_35_36_MetroidShell_0              ;B4C54E;
    dw $0001,SpriteObject_DrawInst_Empty                                 ;B4C552;
    dw $0001,SpriteObjectSpritemaps_34_35_36_MetroidShell_0              ;B4C556;
    dw $0001,SpriteObject_DrawInst_Empty                                 ;B4C55A;
    dw $0001,SpriteObjectSpritemaps_34_35_36_MetroidShell_0              ;B4C55E;
    dw $0001,SpriteObject_DrawInst_Empty                                 ;B4C562;
    dw $0001,SpriteObjectSpritemaps_34_35_36_MetroidShell_2              ;B4C566;
    dw $0001,SpriteObject_DrawInst_Empty                                 ;B4C56A;
    dw $0001,SpriteObjectSpritemaps_34_35_36_MetroidShell_2              ;B4C56E;
    dw $0001,SpriteObject_DrawInst_Empty                                 ;B4C572;
    dw $0001,SpriteObjectSpritemaps_34_35_36_MetroidShell_2              ;B4C576;
    dw $0001,SpriteObject_DrawInst_Empty                                 ;B4C57A;
    dw $0001,SpriteObjectSpritemaps_34_35_36_MetroidShell_2              ;B4C57E;
    dw $0001,SpriteObject_DrawInst_Empty                                 ;B4C582;
    dw $0001,SpriteObjectSpritemaps_34_35_36_MetroidShell_2              ;B4C586;
    dw $0001,SpriteObject_DrawInst_Empty                                 ;B4C58A;
    dw $0001,SpriteObjectSpritemaps_34_35_36_MetroidShell_2              ;B4C58E;
    dw $0001,SpriteObject_DrawInst_Empty                                 ;B4C592;
    dw $0001,SpriteObjectSpritemaps_34_35_36_MetroidShell_2              ;B4C596;
    dw $0001,SpriteObject_DrawInst_Empty                                 ;B4C59A;
    dw $0001,SpriteObjectSpritemaps_34_35_36_MetroidShell_2              ;B4C59E;
    dw $0001,SpriteObject_DrawInst_Empty                                 ;B4C5A2;
    dw $0001,SpriteObjectSpritemaps_34_35_36_MetroidShell_2              ;B4C5A6;
    dw $0001,SpriteObject_DrawInst_Empty                                 ;B4C5AA;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C5AE;
    dw UNUSED_InstList_SpriteObject_35_B4C536                            ;B4C5B0;


;;; $C5B2: Instruction list - sprite object 36h (unused) ;;;
UNUSED_InstList_SpriteObject_36_B4C5B2:
    dw $0010,SpriteObjectSpritemaps_34_35_36_MetroidShell_0              ;B4C5B2;
    dw $0010,SpriteObjectSpritemaps_34_36_MetroidShell_1                 ;B4C5B6;
    dw $0010,SpriteObjectSpritemaps_34_35_36_MetroidShell_0              ;B4C5BA;
    dw $0010,SpriteObjectSpritemaps_34_35_36_MetroidShell_2              ;B4C5BE;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C5C2;
    dw UNUSED_InstList_SpriteObject_36_B4C5B2                            ;B4C5C4;


;;; $C5C6: Instruction list - sprite object 37h (enemy shot) ;;;
InstList_SpriteObject_37_EnemyShot:
    dw $0002,SpriteObjectSpritemaps_37_EnemyShot_0                       ;B4C5C6;
    dw $0002,SpriteObjectSpritemaps_37_EnemyShot_1                       ;B4C5CA;
    dw $0002,SpriteObjectSpritemaps_37_EnemyShot_2                       ;B4C5CE;
    dw $0002,SpriteObjectSpritemaps_37_EnemyShot_3                       ;B4C5D2;
    dw Instruction_SpriteObject_Delete                                   ;B4C5D6;


;;; $C5D8: Instruction list - sprite object 38h (yapping maw base - facing down) ;;;
InstList_SpriteObject_38_YappingMawBaseFacingDown:
    dw $0001,SpriteObjectSpritemaps_38_YappingMawBaseFacingDown          ;B4C5D8;
    dw Instruction_SpriteObject_GoBack4Bytes                             ;B4C5DC;


;;; $C5DE: Instruction list - sprite object 39h (yapping maw base - facing up) ;;;
InstList_SpriteObject_39_YappingMawBaseFacingUp:
    dw $0001,SpriteObjectSpritemaps_39_YappingMawBaseFacingUp            ;B4C5DE;
    dw Instruction_SpriteObject_GoBack4Bytes                             ;B4C5E2;


;;; $C5E4: Instruction list - sprite object 3Ah (unused) ;;;
UNUSED_InstList_SpriteObject_3A_B4C5E4:
    dw $000A,UNUSED_SpriteObjectSpritemaps_3A_0_B4D8BD                   ;B4C5E4;
    dw $000A,UNUSED_SpriteObjectSpritemaps_3A_1_B4D905                   ;B4C5E8;
    dw $000A,UNUSED_SpriteObjectSpritemaps_3A_2_B4D957                   ;B4C5EC;
    dw $000A,UNUSED_SpriteObjectSpritemaps_3A_3_B4D9A9                   ;B4C5F0;
    dw $000A,UNUSED_SpriteObjectSpritemaps_3A_4_B4D9FB                   ;B4C5F4;
    dw $000A,UNUSED_SpriteObjectSpritemaps_3A_5_B4DA48                   ;B4C5F8;
    dw $000A,UNUSED_SpriteObjectSpritemaps_3A_6_B4DA90                   ;B4C5FC;
    dw $000A,UNUSED_SpriteObjectSpritemaps_3A_7_B4DAD8                   ;B4C600;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C604;
    dw UNUSED_InstList_SpriteObject_3A_B4C5E4                            ;B4C606;


;;; $C608: Instruction list - sprite object 3Bh (evir facing left) ;;;
InstList_SpriteObject_3B_EvirFacingLeft:
    dw $000A,SpriteObjectSpritemaps_3B_EvirFacingLeft_0                  ;B4C608;
    dw $000A,SpriteObjectSpritemaps_3B_EvirFacingLeft_1                  ;B4C60C;
    dw $000A,SpriteObjectSpritemaps_3B_EvirFacingLeft_2                  ;B4C610;
    dw $000A,SpriteObjectSpritemaps_3B_EvirFacingLeft_3                  ;B4C614;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C618;
    dw InstList_SpriteObject_3B_EvirFacingLeft                           ;B4C61A;


;;; $C61C: Instruction list - sprite object 3Ch (evir facing right) ;;;
InstList_SpriteObject_3C_EvirFacingRight:
    dw $000A,SpriteObjectSpritemaps_3C_EvirFacingRight_0                 ;B4C61C;
    dw $000A,SpriteObjectSpritemaps_3C_EvirFacingRight_1                 ;B4C620;
    dw $000A,SpriteObjectSpritemaps_3C_EvirFacingRight_2                 ;B4C624;
    dw $000A,SpriteObjectSpritemaps_3C_EvirFacingRight_3                 ;B4C628;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C62C;
    dw InstList_SpriteObject_3C_EvirFacingRight                          ;B4C62E;


;;; $C630: Sprite object spritemaps ;;;
UNUSED_SpriteObjectSpritemaps_1E_0_B4C630:
    dw $0001                                                             ;B4C630;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 0, 0, $100)

UNUSED_SpriteObjectSpritemaps_1E_1_B4C637:
    dw $0001                                                             ;B4C637;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 0, 0, $101)

UNUSED_SpriteObjectSpritemaps_1E_2_B4C63E:
    dw $0001                                                             ;B4C63E;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 0, 0, $102)

UNUSED_SpriteObjectSpritemaps_1F_0_B4C645:
    dw $0001                                                             ;B4C645;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 0, 0, $103)

UNUSED_SpriteObjectSpritemaps_1F_1_B4C645:
    dw $0001                                                             ;B4C64C;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 0, 0, $104)

UNUSED_SpriteObjectSpritemaps_1F_2_B4C653:
    dw $0001                                                             ;B4C653;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 0, 0, $105)

UNUSED_SpriteObjectSpritemaps_20_0_B4C65A:
    dw $0001                                                             ;B4C65A;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 0, 0, $106)

UNUSED_SpriteObjectSpritemaps_20_1_B4C661:
    dw $0001                                                             ;B4C661;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 0, 0, $107)

UNUSED_SpriteObjectSpritemaps_20_2_B4C668:
    dw $0001                                                             ;B4C668;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 0, 0, $108)

UNUSED_SpriteObjectSpritemaps_21_0_B4C66F:
    dw $0001                                                             ;B4C66F;
    %spritemapEntry(0, $1FC, $FC, 1, 0, 0, 0, $103)

UNUSED_SpriteObjectSpritemaps_21_1_B4C676:
    dw $0001                                                             ;B4C676;
    %spritemapEntry(0, $1FC, $FC, 1, 0, 0, 0, $104)

UNUSED_SpriteObjectSpritemaps_21_2_B4C67D:
    dw $0001                                                             ;B4C67D;
    %spritemapEntry(0, $1FC, $FC, 1, 0, 0, 0, $105)

UNUSED_SpriteObjectSpritemaps_22_0_B4C684:
    dw $0001                                                             ;B4C684;
    %spritemapEntry(0, $1FC, $FC, 1, 0, 0, 0, $100)

UNUSED_SpriteObjectSpritemaps_22_1_B4C68B:
    dw $0001                                                             ;B4C68B;
    %spritemapEntry(0, $1FC, $FC, 1, 0, 0, 0, $101)

UNUSED_SpriteObjectSpritemaps_22_2_B4C692:
    dw $0001                                                             ;B4C692;
    %spritemapEntry(0, $1FC, $FC, 1, 0, 0, 0, $102)

UNUSED_SpriteObjectSpritemaps_23_0_B4C699:
    dw $0001                                                             ;B4C699;
    %spritemapEntry(0, $1FC, $FC, 1, 1, 0, 0, $103)

UNUSED_SpriteObjectSpritemaps_23_1_B4C6A0:
    dw $0001                                                             ;B4C6A0;
    %spritemapEntry(0, $1FC, $FC, 1, 1, 0, 0, $104)

UNUSED_SpriteObjectSpritemaps_23_2_B4C6A7:
    dw $0001                                                             ;B4C6A7;
    %spritemapEntry(0, $1FC, $FC, 1, 1, 0, 0, $105)

UNUSED_SpriteObjectSpritemaps_24_0_B4C6AE:
    dw $0001                                                             ;B4C6AE;
    %spritemapEntry(0, $1FC, $FC, 0, 1, 0, 0, $106)

UNUSED_SpriteObjectSpritemaps_24_1_B4C6B5:
    dw $0001                                                             ;B4C6B5;
    %spritemapEntry(0, $1FC, $FC, 0, 1, 0, 0, $107)

UNUSED_SpriteObjectSpritemaps_24_2_B4C6BC:
    dw $0001                                                             ;B4C6BC;
    %spritemapEntry(0, $1FC, $FC, 0, 1, 0, 0, $108)

UNUSED_SpriteObjectSpritemaps_25_0_B4C6C3:
    dw $0001                                                             ;B4C6C3;
    %spritemapEntry(0, $1FC, $FC, 0, 1, 0, 0, $103)

UNUSED_SpriteObjectSpritemaps_25_1_B4C6CA:
    dw $0001                                                             ;B4C6CA;
    %spritemapEntry(0, $1FC, $FC, 0, 1, 0, 0, $104)

UNUSED_SpriteObjectSpritemaps_25_2_B4C6D1:
    dw $0001                                                             ;B4C6D1;
    %spritemapEntry(0, $1FC, $FC, 0, 1, 0, 0, $105)

UNUSED_SpriteObjectSpritemaps_11_RockParticles_0_B4C6D8:
    dw $0004                                                             ;B4C6D8;
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $00, $00, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 5, $2B)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $2B)

UNUSED_SpriteObjectSpritemaps_11_RockParticles_1_B4C6EE:
    dw $0004                                                             ;B4C6EE;
    %spritemapEntry(0, $02, $F3, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $01, $FF, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $1F7, $FF, 0, 0, 3, 5, $2B)
    %spritemapEntry(0, $1F6, $F3, 0, 0, 3, 5, $2B)

UNUSED_SpriteObjectSpritemaps_11_RockParticles_2_B4C704:
    dw $0004                                                             ;B4C704;
    %spritemapEntry(0, $05, $EE, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $03, $FD, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $1F5, $FD, 0, 0, 3, 5, $2B)
    %spritemapEntry(0, $1F3, $EE, 0, 0, 3, 5, $2B)

UNUSED_SpriteObjectSpritemaps_11_RockParticles_3_B4C71A:
    dw $0004                                                             ;B4C71A;
    %spritemapEntry(0, $07, $EC, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $05, $FB, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $1F3, $FB, 0, 0, 3, 5, $2B)
    %spritemapEntry(0, $1F1, $EC, 0, 0, 3, 5, $2B)

UNUSED_SpriteObjectSpritemaps_11_RockParticles_4_B4C730:
    dw $0004                                                             ;B4C730;
    %spritemapEntry(0, $09, $EA, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $07, $FA, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $1F1, $FA, 0, 0, 3, 5, $2B)
    %spritemapEntry(0, $1EF, $EA, 0, 0, 3, 5, $2B)

UNUSED_SpriteObjectSpritemaps_11_RockParticles_5_B4C746:
    dw $0004                                                             ;B4C746;
    %spritemapEntry(0, $0A, $EA, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $08, $F9, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $1F0, $F9, 0, 0, 3, 5, $2B)
    %spritemapEntry(0, $1EE, $EA, 0, 0, 3, 5, $2B)

UNUSED_SpriteObjectSpritemaps_11_RockParticles_6_B4C75C:
    dw $0004                                                             ;B4C75C;
    %spritemapEntry(0, $0C, $EB, 0, 1, 3, 5, $2A)
    %spritemapEntry(0, $09, $FA, 0, 1, 3, 5, $2A)
    %spritemapEntry(0, $1EF, $FA, 0, 0, 3, 5, $2A)
    %spritemapEntry(0, $1EC, $EB, 0, 0, 3, 5, $2A)

UNUSED_SpriteObjectSpritemaps_11_RockParticles_7_B4C772:
    dw $0004                                                             ;B4C772;
    %spritemapEntry(0, $0E, $EC, 0, 1, 3, 5, $2A)
    %spritemapEntry(0, $0A, $FC, 0, 1, 3, 5, $2A)
    %spritemapEntry(0, $1EE, $FC, 0, 0, 3, 5, $2A)
    %spritemapEntry(0, $1EA, $EC, 0, 0, 3, 5, $2A)

UNUSED_SpriteObjectSpritemaps_11_RockParticles_8_B4C788:
    dw $0004                                                             ;B4C788;
    %spritemapEntry(0, $10, $ED, 0, 1, 3, 5, $29)
    %spritemapEntry(0, $0B, $FE, 0, 1, 3, 5, $29)
    %spritemapEntry(0, $1ED, $FE, 0, 0, 3, 5, $29)
    %spritemapEntry(0, $1E8, $ED, 0, 0, 3, 5, $29)

UNUSED_SpriteObjectSpritemaps_11_RockParticles_9_B4C79E:
    dw $0004                                                             ;B4C79E;
    %spritemapEntry(0, $12, $EE, 0, 1, 3, 5, $29)
    %spritemapEntry(0, $0C, $00, 0, 1, 3, 5, $29)
    %spritemapEntry(0, $1EC, $00, 0, 0, 3, 5, $29)
    %spritemapEntry(0, $1E6, $EE, 0, 0, 3, 5, $29)

UNUSED_SpriteObjectSpritemaps_11_RockParticles_A_B4C7B4:
    dw $0004                                                             ;B4C7B4;
    %spritemapEntry(0, $13, $F0, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $0D, $02, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $1E5, $F0, 0, 0, 3, 5, $28)
    %spritemapEntry(0, $1EB, $02, 0, 0, 3, 5, $28)

UNUSED_SpriteObjectSpritemaps_11_RockParticles_B_B4C7CA:
    dw $0004                                                             ;B4C7CA;
    %spritemapEntry(0, $14, $F2, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $0E, $04, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $1E4, $F2, 0, 0, 3, 5, $28)
    %spritemapEntry(0, $1EA, $04, 0, 0, 3, 5, $28)

UNUSED_SpriteObjectSpritemaps_11_RockParticles_C_B4C7E0:
    dw $0004                                                             ;B4C7E0;
    %spritemapEntry(0, $15, $F5, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $0F, $07, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $1E3, $F5, 0, 0, 3, 5, $28)
    %spritemapEntry(0, $1E9, $07, 0, 0, 3, 5, $28)

UNUSED_SpriteObjectSpritemaps_11_RockParticles_D_B4C7F6:
    dw $0004                                                             ;B4C7F6;
    %spritemapEntry(0, $16, $F9, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $10, $0B, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $1E2, $F9, 0, 0, 3, 5, $28)
    %spritemapEntry(0, $1E8, $0B, 0, 0, 3, 5, $28)

UNUSED_SpriteObjectSpritemaps_11_RockParticles_E_B4C80C:
    dw $0004                                                             ;B4C80C;
    %spritemapEntry(0, $17, $03, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $11, $11, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $1E1, $03, 0, 0, 3, 5, $28)
    %spritemapEntry(0, $1E7, $11, 0, 0, 3, 5, $28)

UNUSED_SpriteObjectSpritemaps_11_RockParticles_F_B4C822:
    dw $0004                                                             ;B4C822;
    %spritemapEntry(0, $18, $0A, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $12, $18, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $1E0, $0A, 0, 0, 3, 5, $28)
    %spritemapEntry(0, $1E6, $18, 0, 0, 3, 5, $28)

SpriteObjectSpritemaps_12_15_BigDustCloud_0:
    dw $0001                                                             ;B4C838;
    %spritemapEntry(0, $1F7, $F7, 0, 0, 3, 5, $48)

SpriteObjectSpritemaps_12_15_BigDustCloud_1:
    dw $0002                                                             ;B4C83F;
    %spritemapEntry(0, $01, $01, 0, 0, 3, 5, $48)
    %spritemapEntry(1, $1F3, $F3, 0, 0, 3, 5, $7C)

SpriteObjectSpritemaps_12_15_BigDustCloud_2:
    dw $0003                                                             ;B4C84B;
    %spritemapEntry(1, $1FD, $FD, 0, 0, 3, 5, $7C)
    %spritemapEntry(0, $1F7, $01, 0, 0, 3, 5, $48)
    %spritemapEntry(1, $1F3, $F3, 0, 0, 3, 5, $7E)

SpriteObjectSpritemaps_12_15_BigDustCloud_3:
    dw $0004                                                             ;B4C85C;
    %spritemapEntry(0, $01, $F7, 0, 0, 3, 5, $48)
    %spritemapEntry(1, $1FD, $FD, 0, 0, 3, 5, $7E)
    %spritemapEntry(1, $1F3, $FD, 0, 0, 3, 5, $7C)
    %spritemapEntry(1, $1F3, $F3, 0, 0, 3, 5, $9A)

SpriteObjectSpritemaps_13_14_15_BigDustCloud_4:
    dw $0004                                                             ;B4C872;
    %spritemapEntry(1, $1FD, $F3, 0, 0, 3, 5, $7C)
    %spritemapEntry(1, $1FD, $FD, 0, 0, 3, 5, $9A)
    %spritemapEntry(1, $1F3, $FD, 0, 0, 3, 5, $7E)
    %spritemapEntry(1, $1F3, $F3, 0, 0, 3, 5, $9C)

SpriteObjectSpritemaps_13_14_15_BigDustCloud_5:
    dw $0003                                                             ;B4C888;
    %spritemapEntry(1, $1FD, $F3, 0, 0, 3, 5, $7E)
    %spritemapEntry(1, $1FD, $FD, 0, 0, 3, 5, $9C)
    %spritemapEntry(1, $1F3, $FD, 0, 0, 3, 5, $9A)

SpriteObjectSpritemaps_13_14_15_BigDustCloud_6:
    dw $0002                                                             ;B4C899;
    %spritemapEntry(1, $1FD, $F3, 0, 0, 3, 5, $9A)
    %spritemapEntry(1, $1F3, $FD, 0, 0, 3, 5, $9C)

SpriteObjectSpritemaps_13_14_15_BigDustCloud_7:
    dw $0001                                                             ;B4C8A5;
    %spritemapEntry(1, $1FD, $F3, 0, 0, 3, 5, $9C)

UNUSED_SpriteObjectSpritemaps_13_14_16_DustCloud_Beam_B4C8AC:
    dw $0001                                                             ;B4C8AC;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $6B)

UNUSED_SpriteObjectSpritemaps_13_14_16_DustCloud_Beam_B4C8B3:
    dw $0001                                                             ;B4C8B3;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $6C)

UNUSED_SpriteObjectSpritemaps_14_16_DustCloud_Beam_B4C8BA:
    dw $0002                                                             ;B4C8BA;
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 5, $6B)
    %spritemapEntry(0, $00, $FC, 0, 0, 3, 5, $6B)

UNUSED_SpriteObjectSpritemaps_16_DustCloud_Beam_B4C8C6:
    dw $0002                                                             ;B4C8C6;
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 5, $6C)
    %spritemapEntry(0, $00, $FC, 0, 0, 3, 5, $6C)

UNUSED_SpriteObjectSpritemaps_16_DustCloud_Beam_B4C8D2:
    dw $0003                                                             ;B4C8D2;
    %spritemapEntry(0, $1F4, $FC, 0, 0, 3, 5, $6C)
    %spritemapEntry(0, $04, $FC, 0, 0, 3, 5, $6C)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $6C)

UNUSED_SpriteObjectSpritemaps_16_DustCloud_Beam_B4C8E2:
    dw $0003                                                             ;B4C8E3;
    %spritemapEntry(0, $04, $FC, 0, 0, 3, 5, $6B)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 3, 5, $6B)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $6B)

UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4:
    dw $0004                                                             ;B4C8F4;
    %spritemapEntry(0, $08, $FC, 0, 0, 3, 5, $6C)
    %spritemapEntry(0, $00, $FC, 0, 0, 3, 5, $6C)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 5, $6C)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 3, 5, $6C)

UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A:
    dw $0004                                                             ;B4C90A;
    %spritemapEntry(0, $08, $FC, 0, 0, 3, 5, $6B)
    %spritemapEntry(0, $00, $FC, 0, 0, 3, 5, $6B)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 5, $6B)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 3, 5, $6B)

SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_0:
    dw $0001                                                             ;B4C920;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $25)

SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_1:
    dw $0003                                                             ;B4C927;
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 5, $25)
    %spritemapEntry(0, $1FA, $F6, 0, 0, 3, 5, $25)
    %spritemapEntry(0, $1FC, $FB, 0, 0, 3, 5, $25)

SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_2:
    dw $0003                                                             ;B4C938;
    %spritemapEntry(0, $01, $F7, 0, 0, 3, 5, $25)
    %spritemapEntry(0, $1F9, $F4, 0, 0, 3, 5, $25)
    %spritemapEntry(0, $1FB, $FA, 0, 0, 3, 5, $25)

SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_3:
    dw $0003                                                             ;B4C949;
    %spritemapEntry(0, $01, $F5, 0, 0, 3, 5, $43)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 5, $43)
    %spritemapEntry(0, $1FA, $F1, 0, 0, 3, 5, $43)

SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_4:
    dw $0003                                                             ;B4C95A;
    %spritemapEntry(0, $01, $F3, 0, 0, 3, 5, $43)
    %spritemapEntry(0, $1FC, $F5, 0, 0, 3, 5, $43)
    %spritemapEntry(0, $1FA, $EE, 0, 0, 3, 5, $43)

SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_5:
    dw $0003                                                             ;B4C96B;
    %spritemapEntry(0, $00, $F0, 0, 0, 3, 5, $40)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 3, 5, $40)
    %spritemapEntry(0, $1FA, $ED, 0, 0, 3, 5, $40)

SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_6:
    dw $0003                                                             ;B4C97C;
    %spritemapEntry(0, $00, $EE, 0, 0, 3, 5, $40)
    %spritemapEntry(0, $1FC, $F2, 0, 0, 3, 5, $40)
    %spritemapEntry(0, $1FA, $EC, 0, 0, 3, 5, $40)

SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_7:
    dw $0002                                                             ;B4C98D;
    %spritemapEntry(0, $00, $EC, 0, 0, 3, 5, $40)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 3, 5, $40)

SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_8:
    dw $0001                                                             ;B4C999;
    %spritemapEntry(0, $1FC, $EE, 0, 0, 3, 5, $40)

UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_0_B4C9A0:
    dw $0004                                                             ;B4C9A0;
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 5, $6F)

UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_1_B4C9B6:
    dw $0004                                                             ;B4C9B6;
    %spritemapEntry(0, $08, $E8, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $00, $E8, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F8, $E8, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F0, $E8, 0, 0, 3, 5, $6F)

UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_2_B4C9CC:
    dw $0004                                                             ;B4C9CC;
    %spritemapEntry(0, $08, $F0, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $00, $F0, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F0, $F0, 0, 0, 3, 5, $6F)

UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_3_B4C9E2:
    dw $0004                                                             ;B4C9E2;
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 5, $6F)

UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_4_B4C9F8:
    dw $0004                                                             ;B4C9F8;
    %spritemapEntry(0, $08, $00, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F0, $00, 0, 0, 3, 5, $6F)

UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_5_B4CA0E:
    dw $0004                                                             ;B4CA0E;
    %spritemapEntry(0, $08, $08, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $00, $08, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F8, $08, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F0, $08, 0, 0, 3, 5, $6F)

UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_6_B4CA24:
    dw $0004                                                             ;B4CA24;
    %spritemapEntry(0, $08, $10, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $00, $10, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F8, $10, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F0, $10, 0, 0, 3, 5, $6F)

UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_7_B4CA3A:
    dw $0004                                                             ;B4CA3A;
    %spritemapEntry(0, $08, $18, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $00, $18, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F8, $18, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F0, $18, 0, 0, 3, 5, $6F)

UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_0_B4CA50:
    dw $0002                                                             ;B4CA50;
    %spritemapEntry(0, $00, $FC, 0, 0, 3, 5, $BF)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 5, $BE)

UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_1_B4CA5C:
    dw $0001                                                             ;B4CA5C;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 5, $BE)

UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_2_B4CA63:
    dw $0002                                                             ;B4CA63;
    %spritemapEntry(1, $1F8, $FC, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $F4, 0, 0, 3, 5, $BE)

UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_3_B4CA6F:
    dw $0002                                                             ;B4CA6F;
    %spritemapEntry(1, $1F8, $00, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 3, 5, $BE)

UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_4_B4CA7B:
    dw $0003                                                             ;B4CA7B;
    %spritemapEntry(1, $1F8, $04, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $EC, 0, 0, 3, 5, $BE)

UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_5_B4CA8C:
    dw $0003                                                             ;B4CA8C;
    %spritemapEntry(1, $1F8, $08, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $E8, 0, 0, 3, 5, $BE)

UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_6_B4CA9D:
    dw $0004                                                             ;B4CA9D;
    %spritemapEntry(1, $1F8, $0C, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $00, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $E4, 0, 0, 3, 5, $BE)

UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_7_B4CAB3:
    dw $0004                                                             ;B4CAB3;
    %spritemapEntry(1, $1F8, $10, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $00, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $E0, 0, 0, 3, 5, $BE)

UNUSED_SpriteObjectSpritemaps_0_BeamCharge_0_B4CAC9:
    dw $0001                                                             ;B4CAC9;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $53)

UNUSED_SpriteObjectSpritemaps_0_BeamCharge_1_B4CAD0:
    dw $0001                                                             ;B4CAD0;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $52)

UNUSED_SpriteObjectSpritemaps_0_BeamCharge_2_B4CAD7:
    dw $0001                                                             ;B4CAD7;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $51)

UNUSED_SpriteObjectSpritemaps_0_BeamCharge_3_B4CADE:
    dw $0004                                                             ;B4CADE;
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 6, $50)
    %spritemapEntry(0, $00, $00, 1, 1, 3, 6, $50)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 6, $50)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 6, $50)

UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_0_B4CAF4:
    dw $0003                                                             ;B4CAF4;
    %spritemapEntry(0, $00, $0C, 0, 0, 3, 5, $5B)
    %spritemapEntry(0, $08, $EC, 0, 0, 3, 5, $5B)
    %spritemapEntry(0, $1F0, $F4, 0, 0, 3, 5, $5B)

UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_1_B4CB05:
    dw $0003                                                             ;B4CB05;
    %spritemapEntry(0, $1FD, $0A, 0, 0, 3, 5, $5C)
    %spritemapEntry(0, $06, $EE, 0, 0, 3, 5, $5C)
    %spritemapEntry(0, $1F2, $F6, 0, 0, 3, 5, $5C)

UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_2_B4CB16:
    dw $0003                                                             ;B4CB16;
    %spritemapEntry(0, $1FC, $08, 0, 0, 3, 5, $5C)
    %spritemapEntry(0, $04, $F0, 0, 0, 3, 5, $5C)
    %spritemapEntry(0, $1F4, $F8, 0, 0, 3, 5, $5C)

UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_3_B4CB27:
    dw $0003                                                             ;B4CB27;
    %spritemapEntry(0, $02, $F2, 0, 0, 3, 5, $5D)
    %spritemapEntry(0, $1FB, $06, 0, 0, 3, 5, $5D)
    %spritemapEntry(0, $1F6, $FA, 0, 0, 3, 5, $5D)

UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_4_B4CB38:
    dw $0003                                                             ;B4CB38;
    %spritemapEntry(0, $1FB, $04, 0, 0, 3, 5, $5D)
    %spritemapEntry(0, $1F8, $FB, 0, 0, 3, 5, $5D)
    %spritemapEntry(0, $00, $F4, 0, 0, 3, 5, $5D)

UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_5_B4CB49:
    dw $0003                                                             ;B4CB49;
    %spritemapEntry(0, $1FB, $02, 0, 0, 3, 5, $5D)
    %spritemapEntry(0, $1FA, $FA, 0, 0, 3, 5, $5D)
    %spritemapEntry(0, $00, $F6, 0, 0, 3, 5, $5D)

UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_0_B4CB5A:
    dw $0003                                                             ;B4CB5A;
    %spritemapEntry(0, $00, $EC, 1, 0, 3, 5, $5B)
    %spritemapEntry(0, $08, $0C, 1, 0, 3, 5, $5B)
    %spritemapEntry(0, $1F0, $04, 1, 0, 3, 5, $5B)

UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_1_B4CB6B:
    dw $0003                                                             ;B4CB6B;
    %spritemapEntry(0, $1FE, $EE, 1, 0, 3, 5, $5C)
    %spritemapEntry(0, $06, $0A, 1, 0, 3, 5, $5C)
    %spritemapEntry(0, $1F2, $02, 1, 0, 3, 5, $5C)

UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_2_B4CB7C:
    dw $0003                                                             ;B4CB7C;
    %spritemapEntry(0, $04, $08, 1, 0, 3, 5, $5C)
    %spritemapEntry(0, $1F4, $00, 1, 0, 3, 5, $5C)
    %spritemapEntry(0, $1FD, $F0, 1, 0, 3, 5, $5C)

UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_3_B4CB8D:
    dw $0003                                                             ;B4CB8D;
    %spritemapEntry(0, $02, $06, 1, 0, 3, 5, $5D)
    %spritemapEntry(0, $1FC, $F2, 1, 0, 3, 5, $5D)
    %spritemapEntry(0, $1F6, $FE, 1, 0, 3, 5, $5D)

UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_4_B4CB9E:
    dw $0003                                                             ;B4CB9E;
    %spritemapEntry(0, $1FC, $F4, 1, 0, 3, 5, $5D)
    %spritemapEntry(0, $1F8, $FC, 1, 0, 3, 5, $5D)
    %spritemapEntry(0, $00, $04, 1, 0, 3, 5, $5D)

UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_5_B4CBAF:
    dw $0003                                                             ;B4CBAF;
    %spritemapEntry(0, $1FC, $F6, 1, 0, 3, 5, $5D)
    %spritemapEntry(0, $1FA, $FD, 1, 0, 3, 5, $5D)
    %spritemapEntry(0, $00, $02, 1, 0, 3, 5, $5D)

SpriteObjectSpritemaps_3_SmallExplosion_0:
    dw $0001                                                             ;B4CBC0;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $5F)

SpriteObjectSpritemaps_3_SmallExplosion_1:
    dw $0004                                                             ;B4CBC7;
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $8A)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $8A)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $8A)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $8A)

SpriteObjectSpritemaps_3_SmallExplosion_2:
    dw $0004                                                             ;B4CBDD;
    %spritemapEntry(1, $00, $00, 1, 1, 3, 5, $90)
    %spritemapEntry(1, $1F0, $00, 1, 0, 3, 5, $90)
    %spritemapEntry(1, $00, $F0, 0, 1, 3, 5, $90)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 5, $90)

SpriteObjectSpritemaps_3_SmallExplosion_3:
    dw $0004                                                             ;B4CBF3;
    %spritemapEntry(1, $00, $00, 1, 1, 3, 5, $92)
    %spritemapEntry(1, $1F0, $00, 1, 0, 3, 5, $92)
    %spritemapEntry(1, $00, $F0, 0, 1, 3, 5, $92)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 5, $92)

SpriteObjectSpritemaps_3_SmallExplosion_4:
    dw $0004                                                             ;B4CC09;
    %spritemapEntry(1, $00, $00, 1, 1, 3, 5, $94)
    %spritemapEntry(1, $1F0, $00, 1, 0, 3, 5, $94)
    %spritemapEntry(1, $00, $F0, 0, 1, 3, 5, $94)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 5, $94)

SpriteObjectSpritemaps_3_SmallExplosion_5:
    dw $0004                                                             ;B4CC1F;
    %spritemapEntry(1, $00, $00, 1, 1, 3, 5, $96)
    %spritemapEntry(1, $1F0, $00, 1, 0, 3, 5, $96)
    %spritemapEntry(1, $00, $F0, 0, 1, 3, 5, $96)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 5, $96)

UNSUED_SpriteObjectSpritemaps_4_BombExplosion_0_B4CC35:
    dw $0004                                                             ;B4CC35;
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $8B)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $8B)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $8B)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $8B)

UNSUED_SpriteObjectSpritemaps_4_BombExplosion_1_B4CC4B:
    dw $0004                                                             ;B4CC4B;
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $7A)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $7A)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $7A)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $7A)

UNSUED_SpriteObjectSpritemaps_4_BombExplosion_2_B4CC61:
    dw $0004                                                             ;B4CC61;
    %spritemapEntry(1, $00, $00, 1, 1, 3, 5, $70)
    %spritemapEntry(1, $1F0, $00, 1, 0, 3, 5, $70)
    %spritemapEntry(1, $00, $F0, 0, 1, 3, 5, $70)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 5, $70)

UNSUED_SpriteObjectSpritemaps_4_BombExplosion_3_B4CC77:
    dw $0004                                                             ;B4CC77;
    %spritemapEntry(1, $00, $00, 1, 1, 3, 5, $72)
    %spritemapEntry(1, $1F0, $00, 1, 0, 3, 5, $72)
    %spritemapEntry(1, $00, $F0, 0, 1, 3, 5, $72)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 5, $72)

UNSUED_SpriteObjectSpritemaps_4_BombExplosion_4_B4CC8D:
    dw $0004                                                             ;B4CC8D;
    %spritemapEntry(1, $00, $00, 1, 1, 3, 5, $74)
    %spritemapEntry(1, $1F0, $00, 1, 0, 3, 5, $74)
    %spritemapEntry(1, $00, $F0, 0, 1, 3, 5, $74)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 5, $74)

UNSUED_SpriteObjectSpritemaps__B4CCA3:
    dw $0004                                                             ;B4CCA3;
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 5, $5E)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 5, $5E)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 5, $5E)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $5E)

UNSUED_SpriteObjectSpritemaps_5_BeamTrail_0_B4CCB9:
    dw $0001                                                             ;B4CCB9;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $38)

UNSUED_SpriteObjectSpritemaps_5_BeamTrail_1_B4CCC0:
    dw $0001                                                             ;B4CCC0;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $39)

UNSUED_SpriteObjectSpritemaps_5_BeamTrail_2_B4CCC7:
    dw $0001                                                             ;B4CCC7;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $3A)

UNSUED_SpriteObjectSpritemaps_5_BeamTrail_3_B4CCCE:
    dw $0001                                                             ;B4CCCE;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $3B)

UNSUED_SpriteObjectSpritemaps_7_PowerBomb_0_B4CCD5:
    dw $0001                                                             ;B4CCD5;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $26)

UNSUED_SpriteObjectSpritemaps_7_PowerBomb_1_B4CCDC:
    dw $0001                                                             ;B4CCDC;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $27)

UNSUED_SpriteObjectSpritemaps_7_PowerBomb_2_B4CCE3:
    dw $0001                                                             ;B4CCE3;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $7B)

UNSUED_SpriteObjectSpritemaps_B4CCEA:
    dw $0001                                                             ;B4CCEA;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $5F)

SpriteObjectSpritemaps_6_DudShot_0:
    dw $0001                                                             ;B4CCF1;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $53)

SpriteObjectSpritemaps_6_DudShot_1:
    dw $0001                                                             ;B4CCF8;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $51)

SpriteObjectSpritemaps_6_DudShot_2:
    dw $0004                                                             ;B4CCFF;
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $60)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $60)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $60)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $60)

SpriteObjectSpritemaps_6_DudShot_3:
    dw $0004                                                             ;B4CD15;
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $61)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $61)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $61)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $61)

SpriteObjectSpritemaps_6_DudShot_4:
    dw $0004                                                             ;B4CD2B;
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $62)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $62)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $62)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $62)

SpriteObjectSpritemaps_6_DudShot_5:
    dw $0004                                                             ;B4CD41;
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $63)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $63)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $63)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $63)

UNSUED_SpriteObjectSpritemaps_8_1C_ElevatorPad_0_B4CD57:
    dw $0004                                                             ;B4CD57;
    %spritemapEntry(0, $1F2, $FC, 0, 1, 3, 5, $6C)
    %spritemapEntry(0, $06, $FC, 0, 1, 3, 5, $6C)
    %spritemapEntry(0, $00, $FC, 0, 1, 3, 5, $6C)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 5, $6C)

UNSUED_SpriteObjectSpritemaps_8_1C_ElevatorPad_1_B4CD6D:
    dw $0004                                                             ;B4CD6D;
    %spritemapEntry(0, $00, $FC, 0, 1, 3, 5, $6E)
    %spritemapEntry(0, $08, $FC, 0, 1, 3, 5, $6D)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 5, $6E)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 3, 5, $6D)

UNSUED_SpriteObjectSpritemaps_B4CD83:
    dw $0004                                                             ;B4CD83;
    %spritemapEntry(0, $1F0, $FE, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $08, $FE, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $00, $FE, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F8, $FE, 0, 0, 3, 5, $6F)

SpriteObjectSpritemaps_9_SmallDustCloud_0:
    dw $0001                                                             ;B4CD99;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 5, $7C)

SpriteObjectSpritemaps_9_SmallDustCloud_1:
    dw $0001                                                             ;B4CDA0;
    %spritemapEntry(1, $1F8, $F6, 0, 0, 3, 5, $7E)

SpriteObjectSpritemaps_9_SmallDustCloud_2:
    dw $0001                                                             ;B4CDA7;
    %spritemapEntry(1, $1F8, $F4, 0, 0, 3, 5, $9A)

SpriteObjectSpritemaps_9_SmallDustCloud_3:
    dw $0001                                                             ;B4CDAE;
    %spritemapEntry(1, $1F8, $F2, 0, 0, 3, 5, $9C)

SpriteObjectSpritemaps_A_PirateLandingDustCloud_0:
    dw $0001                                                             ;B4CDB5;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $48)

SpriteObjectSpritemaps_A_PirateLandingDustCloud_1:
    dw $0001                                                             ;B4CDBC;
    %spritemapEntry(0, $1FC, $FA, 0, 0, 3, 5, $49)

SpriteObjectSpritemaps_A_PirateLandingDustCloud_2:
    dw $0001                                                             ;B4CDC3;
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 5, $4A)

SpriteObjectSpritemaps_A_PirateLandingDustCloud_3:
    dw $0001                                                             ;B4CDCA;
    %spritemapEntry(0, $1FC, $F6, 0, 0, 3, 5, $4B)

UNSUED_SpriteObjectSpritemaps_B_EyeDoorSweatDrop_0_B4CDD1:
    dw $0001                                                             ;B4CDD1;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $2C)

UNSUED_SpriteObjectSpritemaps_B_EyeDoorSweatDrop_1_B4CDD8:
    dw $0001                                                             ;B4CDD8;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $2D)

UNSUED_SpriteObjectSpritemaps_B_EyeDoorSweatDrop_2_B4CDDF:
    dw $0001                                                             ;B4CDDF;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $2E)

UNSUED_SpriteObjectSpritemaps_B_EyeDoorSweatDrop_3_B4CDE6:
    dw $0001                                                             ;B4CDE6;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $2F)

SpriteObjectSpritemaps_C_Smoke_0:
    dw $0001                                                             ;B4CDED;
    %spritemapEntry(1, $1F8, $F6, 0, 0, 3, 5, $76)

SpriteObjectSpritemaps_C_Smoke_1:
    dw $0001                                                             ;B4CDF4;
    %spritemapEntry(1, $1F8, $F4, 0, 0, 3, 5, $78)

SpriteObjectSpritemaps_C_Smoke_2:
    dw $0001                                                             ;B4CDFB;
    %spritemapEntry(1, $1F8, $F2, 0, 0, 3, 5, $98)

SpriteObjectSpritemaps_C_Smoke_3:
    dw $0001                                                             ;B4CE02;
    %spritemapEntry(1, $1F8, $F0, 0, 0, 3, 5, $9E)

UNUSED_SpriteObjectSpritemaps_D_SmallEnergyDrop_0_B4CE1E:
    dw $0001                                                             ;B4CE1E;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $3E)

UNUSED_SpriteObjectSpritemaps_D_SmallEnergyDrop_1_B4CE25:
    dw $0001                                                             ;B4CE25;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $3D)

UNUSED_SpriteObjectSpritemaps_D_SmallEnergyDrop_2_B4CE2C:
    dw $0001                                                             ;B4CE2C;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $41)

UNUSED_SpriteObjectSpritemaps_D_SmallEnergyDrop_3_B4CE33:
    dw $0001                                                             ;B4CE33;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $42)

UNUSED_SpriteObjectSpritemaps_E_BigEnergyDrop_0_B4CE3A:
    dw $0004                                                             ;B4CE3A;
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $44)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $44)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $44)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $44)

UNUSED_SpriteObjectSpritemaps_E_BigEnergyDrop_1_B4CE50:
    dw $0004                                                             ;B4CE50;
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $45)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $45)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $45)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $45)

UNUSED_SpriteObjectSpritemaps_E_BigEnergyDrop_2_B4CE66:
    dw $0004                                                             ;B4CE66;
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $46)
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $46)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $46)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $46)

UNUSED_SpriteObjectSpritemaps_E_BigEnergyDrop_3_B4CE7C:
    dw $0001                                                             ;B4CE7C;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $42)

UNUSED_SpriteObjectSpritemaps_F_Bomb_0_B4CE83:
    dw $0001                                                             ;B4CE83;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $4C)

UNUSED_SpriteObjectSpritemaps_F_Bomb_1_B4CE8A:
    dw $0001                                                             ;B4CE8A;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $4D)

UNUSED_SpriteObjectSpritemaps_F_Bomb_2_B4CE91:
    dw $0001                                                             ;B4CE91;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $4E)

UNUSED_SpriteObjectSpritemaps_F_Bomb_3_B4CE98:
    dw $0001                                                             ;B4CE98;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $4F)

UNUSED_SpriteObjectSpritemaps_10_SmallEnergyDrop_0_B4CF87:
    dw $0001                                                             ;B4CF87;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $3C)

UNUSED_SpriteObjectSpritemaps_10_SmallEnergyDrop_1_B4CF8E:
    dw $0001                                                             ;B4CF8E;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $3D)

UNUSED_SpriteObjectSpritemaps_10_SmallEnergyDrop_2_B4CF95:
    dw $0001                                                             ;B4CF95;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $3E)

SpriteObjectSpritemaps_1D_BigExplosion_0:
    dw $0004                                                             ;B4CFA3;
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $8A)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $8A)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $8A)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $8A)

SpriteObjectSpritemaps_1D_BigExplosion_1:
    dw $0004                                                             ;B4CFB9;
    %spritemapEntry(1, $4200, $00, 1, 1, 3, 5, $90)
    %spritemapEntry(1, $4200, $F0, 0, 1, 3, 5, $90)
    %spritemapEntry(1, $43F0, $00, 1, 0, 3, 5, $90)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 5, $90)

SpriteObjectSpritemaps_1D_BigExplosion_2:
    dw $0004                                                             ;B4CFCF;
    %spritemapEntry(1, $4200, $00, 1, 1, 3, 5, $92)
    %spritemapEntry(1, $43F0, $00, 1, 0, 3, 5, $92)
    %spritemapEntry(1, $4200, $F0, 0, 1, 3, 5, $92)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 5, $92)

SpriteObjectSpritemaps_1D_BigExplosion_3:
    dw $000C                                                             ;B4CFE5;
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
    dw $0008                                                             ;B4D023;
    %spritemapEntry(1, $4208, $00, 1, 1, 3, 5, $B5)
    %spritemapEntry(1, $4200, $08, 1, 1, 3, 5, $B3)
    %spritemapEntry(1, $43E8, $00, 1, 0, 3, 5, $B5)
    %spritemapEntry(1, $43F0, $08, 1, 0, 3, 5, $B3)
    %spritemapEntry(1, $4208, $F0, 0, 1, 3, 5, $B5)
    %spritemapEntry(1, $4200, $E8, 0, 1, 3, 5, $B3)
    %spritemapEntry(1, $43E8, $F0, 0, 0, 3, 5, $B5)
    %spritemapEntry(1, $43F0, $E8, 0, 0, 3, 5, $B3)

SpriteObjectSpritemaps_1D_BigExplosion_5:
    dw $000C                                                             ;B4D04D;
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
    dw $0009                                                             ;B4D08B;
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
    dw $0009                                                             ;B4D0BA;
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
    dw $0009                                                             ;B4D0E9;
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
    dw $0009                                                             ;B4D118;
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
    dw $0009                                                             ;B4D147;
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
    dw $0009                                                             ;B4D176;
    %spritemapEntry(1, $1FE, $FB, 0, 0, 2, 0, $D6)
    %spritemapEntry(1, $1EE, $FB, 0, 0, 2, 0, $D4)
    %spritemapEntry(1, $1FE, $EB, 0, 0, 2, 0, $D2)
    %spritemapEntry(1, $1EE, $EB, 0, 0, 2, 0, $D0)
    %spritemapEntry(1, $02, $FC, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $01, $03, 0, 0, 2, 0, $D8)
    %spritemapEntry(1, $1FF, $09, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $1FE, $10, 0, 0, 2, 0, $F6)
    %spritemapEntry(0, $1FE, $08, 0, 0, 2, 0, $F5)

UNUSED_SpriteObjectSpritemaps_27_0_B4D1D4:
    dw $0005                                                             ;B4D1D4;
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 0, $F4)
    %spritemapEntry(0, $1FE, $F4, 0, 0, 2, 0, $F1)
    %spritemapEntry(0, $1F6, $F4, 0, 0, 2, 0, $F0)

UNUSED_SpriteObjectSpritemaps_27_1_B4D1EF:
    dw $0005                                                             ;B4D1EF;
    %spritemapEntry(0, $1FE, $F4, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $1F6, $F4, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $F4)
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $1FA, $FC, 0, 0, 2, 0, $F2)

UNUSED_SpriteObjectSpritemaps_27_2_B4D20A:
    dw $0005                                                             ;B4D20A;
    %spritemapEntry(0, $1FE, $F4, 0, 0, 2, 0, $F4)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 0, $F1)
    %spritemapEntry(0, $1FA, $FC, 0, 0, 2, 0, $F0)

UNUSED_SpriteObjectSpritemaps_27_3_B4D225:
    dw $0006                                                             ;B4D225;
    %spritemapEntry(0, $1FE, $F4, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $1F6, $F4, 0, 0, 2, 0, $F2)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $F0)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $F1)
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 0, $F3)
    %spritemapEntry(0, $1FA, $FC, 0, 0, 2, 0, $F2)

UNUSED_SpriteObjectSpritemaps_27_4_B4D245:
    dw $0003                                                             ;B4D245;
    %spritemapEntry(0, $1FE, $F4, 0, 0, 2, 0, $F4)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $F4)
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 0, $F4)

UNUSED_SpriteObjectSpritemaps_2A_B4D2AC:
    dw $0001                                                             ;B4D2AC;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $DE)

UNUSED_SpriteObjectSpritemaps_28_0_B4D2B3:
    dw $0009                                                             ;B4D2B3;
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
    dw $0009                                                             ;B4D2E2;
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
    dw $0009                                                             ;B4D311;
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
    dw $0009                                                             ;B4D340;
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
    dw $0009                                                             ;B4D36F;
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
    dw $0009                                                             ;B4D39E;
    %spritemapEntry(1, $1F2, $FB, 0, 1, 2, 0, $D6)
    %spritemapEntry(1, $02, $FB, 0, 1, 2, 0, $D4)
    %spritemapEntry(1, $1F2, $EB, 0, 1, 2, 0, $D2)
    %spritemapEntry(1, $02, $EB, 0, 1, 2, 0, $D0)
    %spritemapEntry(1, $1EE, $FC, 0, 1, 2, 0, $D8)
    %spritemapEntry(1, $1EF, $03, 0, 1, 2, 0, $D8)
    %spritemapEntry(1, $1F1, $09, 0, 1, 2, 0, $DC)
    %spritemapEntry(0, $1FA, $10, 0, 1, 2, 0, $F6)
    %spritemapEntry(0, $1FA, $08, 0, 1, 2, 0, $F5)

UNUSED_SpriteObjectSpritemaps_29_0_B4D3FC:
    dw $0005                                                             ;B4D3FC;
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $F3)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $F2)
    %spritemapEntry(0, $1FA, $F4, 0, 1, 2, 0, $F1)
    %spritemapEntry(0, $02, $F4, 0, 1, 2, 0, $F0)
    %spritemapEntry(0, $1F6, $FC, 0, 1, 2, 0, $F4)

UNUSED_SpriteObjectSpritemaps_29_1_B4D417:
    dw $0005                                                             ;B4D417;
    %spritemapEntry(0, $1FA, $F4, 0, 1, 2, 0, $F3)
    %spritemapEntry(0, $02, $F4, 0, 1, 2, 0, $F2)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $F4)
    %spritemapEntry(0, $1F6, $FC, 0, 1, 2, 0, $F3)
    %spritemapEntry(0, $1FE, $FC, 0, 1, 2, 0, $F2)

UNUSED_SpriteObjectSpritemaps_29_2_B4D432:
    dw $0005                                                             ;B4D432;
    %spritemapEntry(0, $1FA, $F4, 0, 1, 2, 0, $F4)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $F3)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $F2)
    %spritemapEntry(0, $1F6, $FC, 0, 1, 2, 0, $F1)
    %spritemapEntry(0, $1FE, $FC, 0, 1, 2, 0, $F0)

UNUSED_SpriteObjectSpritemaps_29_3_B4D44D:
    dw $0006                                                             ;B4D44D;
    %spritemapEntry(0, $1FA, $F4, 0, 1, 2, 0, $F3)
    %spritemapEntry(0, $02, $F4, 0, 1, 2, 0, $F2)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $F0)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $F1)
    %spritemapEntry(0, $1F6, $FC, 0, 1, 2, 0, $F3)
    %spritemapEntry(0, $1FE, $FC, 0, 1, 2, 0, $F2)

UNUSED_SpriteObjectSpritemaps_29_4_B4D46D:
    dw $0003                                                             ;B4D46D;
    %spritemapEntry(0, $1F6, $FC, 0, 1, 2, 0, $F4)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $F4)
    %spritemapEntry(0, $1FA, $F4, 0, 1, 2, 0, $F4)

SpriteObjectSpritemaps_2B_Puromi_0:
    dw $0001                                                             ;B4D4BE;
    %spritemapEntry(1, $1F9, $F8, 0, 0, 2, 1, $10A)

SpriteObjectSpritemaps_2B_Puromi_1:
    dw $0001                                                             ;B4D4C5;
    %spritemapEntry(1, $1F9, $F8, 0, 0, 2, 1, $108)

SpriteObjectSpritemaps_2B_Puromi_2:
    dw $0001                                                             ;B4D4CC;
    %spritemapEntry(1, $1F8, $F8, 1, 1, 2, 1, $10A)

SpriteObjectSpritemaps_2B_Puromi_3:
    dw $0001                                                             ;B4D4D3;
    %spritemapEntry(1, $1F8, $F8, 1, 1, 2, 1, $108)

SpriteObjectSpritemaps_2B_Puromi_4:
    dw $0001                                                             ;B4D4DA;
    %spritemapEntry(1, $1F9, $F8, 0, 0, 2, 1, $106)

SpriteObjectSpritemaps_2B_Puromi_5:
    dw $0001                                                             ;B4D4E1;
    %spritemapEntry(1, $1F9, $F8, 0, 0, 2, 1, $122)

SpriteObjectSpritemaps_2B_Puromi_6:
    dw $0001                                                             ;B4D4E8;
    %spritemapEntry(1, $1F8, $F8, 1, 1, 2, 1, $106)

SpriteObjectSpritemaps_2B_Puromi_7:
    dw $0001                                                             ;B4D4EF;
    %spritemapEntry(1, $1F8, $F8, 1, 1, 2, 1, $122)

SpriteObjectSpritemaps_2C_PuromiRightExplosion_0:
    dw $0001                                                             ;B4D4F6;
    %spritemapEntry(1, $1F9, $F9, 0, 0, 2, 1, $10E)

SpriteObjectSpritemaps_2C_PuromiRightExplosion_1:
    dw $0001                                                             ;B4D4FD;
    %spritemapEntry(1, $1FD, $F5, 0, 0, 2, 1, $120)

SpriteObjectSpritemaps_2C_PuromiRightExplosion_2:
    dw $0001                                                             ;B4D504;
    %spritemapEntry(1, $03, $EE, 0, 0, 2, 1, $104)

SpriteObjectSpritemaps_2C_PuromiRightExplosion_3:
    dw $0001                                                             ;B4D50B;
    %spritemapEntry(1, $05, $EC, 0, 0, 2, 1, $108)

SpriteObjectSpritemaps_2C_PuromiRightExplosion_4:
    dw $0001                                                             ;B4D512;
    %spritemapEntry(1, $05, $EC, 0, 0, 2, 1, $10C)

SpriteObjectSpritemaps_2C_PuromiRightExplosion_5:
    dw $0001                                                             ;B4D519;
    %spritemapEntry(1, $05, $EC, 0, 0, 2, 1, $126)

SpriteObjectSpritemaps_2C_PuromiRightExplosion_6:
    dw $0001                                                             ;B4D520;
    %spritemapEntry(1, $05, $EC, 0, 0, 2, 1, $12E)

SpriteObjectSpritemaps_2D_PuromiLeftExplosion_0:
    dw $0001                                                             ;B4D527;
    %spritemapEntry(1, $1F8, $F9, 0, 1, 2, 1, $10E)

SpriteObjectSpritemaps_2D_PuromiLeftExplosion_1:
    dw $0001                                                             ;B4D52E;
    %spritemapEntry(1, $1F4, $F5, 0, 1, 2, 1, $120)

SpriteObjectSpritemaps_2D_PuromiLeftExplosion_2:
    dw $0001                                                             ;B4D535;
    %spritemapEntry(1, $1EE, $EE, 0, 1, 2, 1, $104)

SpriteObjectSpritemaps_2D_PuromiLeftExplosion_3:
    dw $0001                                                             ;B4D53C;
    %spritemapEntry(1, $1EC, $EC, 0, 1, 2, 1, $108)

SpriteObjectSpritemaps_2D_PuromiLeftExplosion_4:
    dw $0001                                                             ;B4D543;
    %spritemapEntry(1, $1EC, $EC, 0, 1, 2, 1, $10C)

SpriteObjectSpritemaps_2D_PuromiLeftExplosion_5:
    dw $0001                                                             ;B4D54A;
    %spritemapEntry(1, $1EC, $EC, 0, 1, 2, 1, $126)

SpriteObjectSpritemaps_2D_PuromiLeftExplosion_6:
    dw $0001                                                             ;B4D551;
    %spritemapEntry(1, $1EB, $EC, 0, 0, 2, 1, $12E)

SpriteObjectSpritemaps_2E_PuromiSplash_0:
    dw $0002                                                             ;B4D558;
    %spritemapEntry(0, $1F1, $F8, 0, 1, 2, 1, $134)
    %spritemapEntry(0, $08, $F8, 0, 0, 2, 1, $134)

SpriteObjectSpritemaps_2E_PuromiSplash_1:
    dw $0002                                                             ;B4D564;
    %spritemapEntry(0, $1F1, $F8, 0, 1, 2, 1, $124)
    %spritemapEntry(0, $08, $F8, 0, 0, 2, 1, $124)

SpriteObjectSpritemaps_2E_PuromiSplash_2:
    dw $0002                                                             ;B4D570;
    %spritemapEntry(1, $1E9, $F0, 0, 1, 2, 1, $128)
    %spritemapEntry(1, $08, $F0, 0, 0, 2, 1, $128)

SpriteObjectSpritemaps_2E_PuromiSplash_3:
    dw $0002                                                             ;B4D57C;
    %spritemapEntry(1, $1E9, $F0, 0, 1, 2, 1, $12C)
    %spritemapEntry(1, $08, $F0, 0, 0, 2, 1, $12C)

SpriteObjectSpritemaps_2E_PuromiSplash_4:
    dw $0002                                                             ;B4D588;
    %spritemapEntry(1, $1E8, $F0, 0, 1, 2, 1, $12A)
    %spritemapEntry(1, $09, $F0, 0, 0, 2, 1, $12A)

UNUSED_SpriteObjectSpritemaps_2F_B4D594:
    dw $0001                                                             ;B4D594;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 1, $140)

SpriteObjectSpritemaps_30_FallingSparkTrail_0:
    dw $0001                                                             ;B4D59B;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $107)

SpriteObjectSpritemaps_30_FallingSparkTrail_1:
    dw $0001                                                             ;B4D5A2;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $108)

SpriteObjectSpritemaps_30_FallingSparkTrail_2:
    dw $0001                                                             ;B4D5A9;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $109)

SpriteObjectSpritemaps_30_FallingSparkTrail_3:
    dw $0001                                                             ;B4D5B0;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $10A)

SpriteObjectSpritemaps_34_35_36_MetroidShell_0:
    dw $000A                                                             ;B4D5B7;
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
    dw $000A                                                             ;B4D5EB;
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
    dw $000A                                                             ;B4D61F;
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
    dw $0008                                                             ;B4D653;
    %spritemapEntry(0, $10, $00, 0, 1, 2, 0, $160)
    %spritemapEntry(0, $10, $F8, 0, 1, 2, 0, $150)
    %spritemapEntry(0, $1E8, $00, 0, 0, 2, 0, $160)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 2, 0, $150)
    %spritemapEntry(1, $00, $00, 0, 1, 2, 0, $161)
    %spritemapEntry(1, $00, $F0, 0, 1, 2, 0, $141)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $161)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $141)

UNUSED_SpriteObjectSpritemaps_31_MetroidInsides_1_B4D67D:
    dw $0006                                                             ;B4D67D;
    %spritemapEntry(0, $10, $00, 0, 1, 2, 0, $163)
    %spritemapEntry(0, $1E8, $00, 0, 0, 2, 0, $163)
    %spritemapEntry(1, $00, $00, 0, 1, 2, 0, $164)
    %spritemapEntry(1, $00, $F0, 0, 1, 2, 0, $144)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $164)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $144)

UNUSED_SpriteObjectSpritemaps_31_MetroidInsides_2_B4D69D:
    dw $0008                                                             ;B4D69D;
    %spritemapEntry(0, $10, $00, 0, 1, 2, 0, $166)
    %spritemapEntry(0, $10, $F8, 0, 1, 2, 0, $156)
    %spritemapEntry(0, $1E8, $00, 0, 0, 2, 0, $166)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 2, 0, $156)
    %spritemapEntry(1, $00, $00, 0, 1, 2, 0, $167)
    %spritemapEntry(1, $00, $F0, 0, 1, 2, 0, $147)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $167)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $147)

UNUSED_SpriteObjectSpritemaps_31_MetroidInsides_3_B4D6C7:
    dw $0008                                                             ;B4D6C7;
    %spritemapEntry(0, $10, $00, 0, 1, 2, 0, $169)
    %spritemapEntry(0, $10, $F8, 0, 1, 2, 0, $159)
    %spritemapEntry(0, $1E8, $00, 0, 0, 2, 0, $169)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 2, 0, $159)
    %spritemapEntry(1, $00, $00, 0, 1, 2, 0, $16A)
    %spritemapEntry(1, $00, $F0, 0, 1, 2, 0, $14A)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $16A)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $14A)

SpriteObjectSpritemaps_32_33_MetroidElectricity_0:
    dw $0003                                                             ;B4D6F1;
    %spritemapEntry(0, $00, $EC, 0, 0, 2, 0, $17C)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $14C)

SpriteObjectSpritemaps_32_33_MetroidElectricity_1:
    dw $0003                                                             ;B4D702;
    %spritemapEntry(0, $00, $EC, 0, 0, 2, 0, $17D)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $15D)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $15C)

SpriteObjectSpritemaps_32_33_MetroidElectricity_2:
    dw $0003                                                             ;B4D713;
    %spritemapEntry(0, $00, $EC, 0, 0, 2, 0, $17E)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $16D)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $16C)

SpriteObjectSpritemaps_32_33_MetroidElectricity_3:
    dw $0004                                                             ;B4D724;
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $14F)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $14E)
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1F8, $EC, 0, 0, 2, 0, $12D)

SpriteObjectSpritemaps_32_33_MetroidElectricity_4:
    dw $0004                                                             ;B4D73A;
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $15F)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $15E)
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 0, $13E)
    %spritemapEntry(0, $1F8, $EC, 0, 0, 2, 0, $12E)

SpriteObjectSpritemaps_32_33_MetroidElectricity_5:
    dw $0004                                                             ;B4D750;
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $16F)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $16E)
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 0, $13F)
    %spritemapEntry(0, $1F8, $EC, 0, 0, 2, 0, $12F)

SpriteObjectSpritemaps_32_33_MetroidElectricity_6:
    dw $0003                                                             ;B4D766;
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $14C)
    %spritemapEntry(0, $1F8, $EC, 0, 1, 2, 0, $17C)

SpriteObjectSpritemaps_32_33_MetroidElectricity_7:
    dw $0003                                                             ;B4D777;
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $15D)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $15C)
    %spritemapEntry(0, $1F8, $EC, 0, 1, 2, 0, $17D)

SpriteObjectSpritemaps_32_33_MetroidElectricity_8:
    dw $0003                                                             ;B4D788;
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $16D)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $16C)
    %spritemapEntry(0, $1F8, $EC, 0, 1, 2, 0, $17E)

SpriteObjectSpritemaps_32_33_MetroidElectricity_9:
    dw $0004                                                             ;B4D799;
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $14F)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $14E)
    %spritemapEntry(0, $00, $F4, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $00, $EC, 0, 1, 2, 0, $12D)

SpriteObjectSpritemaps_32_33_MetroidElectricity_A:
    dw $0004                                                             ;B4D7AF;
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $16F)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $16E)
    %spritemapEntry(0, $00, $F4, 0, 1, 2, 0, $13E)
    %spritemapEntry(0, $00, $EC, 0, 1, 2, 0, $12E)

SpriteObjectSpritemaps_32_33_MetroidElectricity_B:
    dw $0004                                                             ;B4D7C5;
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $15F)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $15E)
    %spritemapEntry(0, $00, $F4, 0, 1, 2, 0, $13F)
    %spritemapEntry(0, $00, $EC, 0, 1, 2, 0, $12F)

SpriteObjectSpritemaps_32_MetroidElectricity_C:
    dw $0002                                                             ;B4D7DB;
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $14C)

SpriteObjectSpritemaps_32_MetroidElectricity_D:
    dw $0001                                                             ;B4D7E7;
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $15C)

SpriteObjectSpritemaps_32_MetroidElectricity_E:
    dw $0002                                                             ;B4D7EE;
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $16D)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $16C)

SpriteObjectSpritemaps_32_33_MetroidElectricity_F:
    dw $0002                                                             ;B4D7FA;
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1F8, $EC, 0, 0, 2, 0, $12D)

SpriteObjectSpritemaps_32_33_MetroidElectricity_10:
    dw $0002                                                             ;B4D806;
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 0, $13E)
    %spritemapEntry(0, $1F8, $EC, 0, 0, 2, 0, $12E)

SpriteObjectSpritemaps_32_33_MetroidElectricity_11:
    dw $0002                                                             ;B4D812;
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 0, $13F)
    %spritemapEntry(0, $1F8, $EC, 0, 0, 2, 0, $12F)

SpriteObjectSpritemaps_32_MetroidElectricity_12:
    dw $0002                                                             ;B4D81E;
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $14C)

SpriteObjectSpritemaps_32_MetroidElectricity_13:
    dw $0002                                                             ;B4D82A;
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $15D)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $15C)

SpriteObjectSpritemaps_32_MetroidElectricity_14:
    dw $0002                                                             ;B4D836;
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $16D)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $16C)

SpriteObjectSpritemaps_32_33_MetroidElectricity_15:
    dw $0001                                                             ;B4D842;
    %spritemapEntry(0, $00, $EC, 0, 0, 2, 0, $17C)

SpriteObjectSpritemaps_32_33_MetroidElectricity_16:
    dw $0001                                                             ;B4D849;
    %spritemapEntry(0, $00, $EC, 0, 0, 2, 0, $17D)

SpriteObjectSpritemaps_32_33_MetroidElectricity_17:
    dw $0001                                                             ;B4D850;
    %spritemapEntry(0, $00, $EC, 0, 0, 2, 0, $17E)

SpriteObjectSpritemaps_37_EnemyShot_0:
    dw $0004                                                             ;B4D857;
    %spritemapEntry(0, $02, $02, 1, 1, 2, 6, $BC)
    %spritemapEntry(0, $1F6, $02, 1, 0, 2, 6, $BC)
    %spritemapEntry(0, $02, $F6, 0, 1, 2, 6, $BC)
    %spritemapEntry(0, $1F6, $F6, 0, 0, 2, 6, $BC)

SpriteObjectSpritemaps_37_EnemyShot_1:
    dw $0004                                                             ;B4D86D;
    %spritemapEntry(0, $04, $04, 1, 1, 2, 6, $BD)
    %spritemapEntry(0, $1F4, $04, 1, 0, 2, 6, $BD)
    %spritemapEntry(0, $04, $F4, 0, 1, 2, 6, $BD)
    %spritemapEntry(0, $1F4, $F4, 0, 0, 2, 6, $BD)

SpriteObjectSpritemaps_37_EnemyShot_2:
    dw $0004                                                             ;B4D883;
    %spritemapEntry(0, $07, $07, 1, 1, 2, 6, $CB)
    %spritemapEntry(0, $07, $F1, 0, 1, 2, 6, $CB)
    %spritemapEntry(0, $1F1, $07, 1, 0, 2, 6, $CB)
    %spritemapEntry(0, $1F1, $F1, 0, 0, 2, 6, $CB)

SpriteObjectSpritemaps_37_EnemyShot_3:
    dw $0004                                                             ;B4D899;
    %spritemapEntry(0, $0B, $0B, 1, 1, 2, 6, $CC)
    %spritemapEntry(0, $1ED, $0B, 1, 0, 2, 6, $CC)
    %spritemapEntry(0, $0B, $ED, 0, 1, 2, 6, $CC)
    %spritemapEntry(0, $1ED, $ED, 0, 0, 2, 6, $CC)

SpriteObjectSpritemaps_38_YappingMawBaseFacingDown:
    dw $0001                                                             ;B4D8AF;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10A)

SpriteObjectSpritemaps_39_YappingMawBaseFacingUp:
    dw $0001                                                             ;B4D8B6;
    %spritemapEntry(1, $1F8, $F8, 1, 0, 2, 0, $10A)

UNUSED_SpriteObjectSpritemaps_3A_0_B4D8BD:
    dw $000E                                                             ;B4D8BD;
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
    dw $0010                                                             ;B4D905;
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
    dw $0010                                                             ;B4D957;
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
    dw $0010                                                             ;B4D9A9;
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
    dw $000F                                                             ;B4D9FB;
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
    dw $000E                                                             ;B4DA48;
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
    dw $000E                                                             ;B4DA90;
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
    dw $000F                                                             ;B4DAD8;
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

SpriteObjectSpritemaps_3B_EvirFacingLeft_0:
    dw $000C                                                             ;B4DB42;
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
    dw $000C                                                             ;B4DB80;
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
    dw $000C                                                             ;B4DBBE;
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
    dw $000D                                                             ;B4DBFC;
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
    dw $000C                                                             ;B4DC3F;
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
    dw $000C                                                             ;B4DC7D;
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
    dw $000C                                                             ;B4DCBB;
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
    dw $000D                                                             ;B4DCF9;
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

SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_0:
    dw $0001                                                             ;B4DD51;
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 2, $1E0)

SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_1:
    dw $0001                                                             ;B4DD58;
    %spritemapEntry(1, $1F8, $F4, 0, 0, 3, 2, $1E2)

SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_2:
    dw $0001                                                             ;B4DD5F;
    %spritemapEntry(1, $1F8, $F0, 0, 0, 3, 2, $1E4)

SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_3:
    dw $0001                                                             ;B4DD66;
    %spritemapEntry(1, $1F8, $EC, 0, 0, 3, 2, $1E6)

SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_4:
    dw $0001                                                             ;B4DD6D;
    %spritemapEntry(1, $1F8, $E8, 0, 0, 3, 2, $1E8)

SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_5:
    dw $0001                                                             ;B4DD74;
    %spritemapEntry(1, $1F8, $E4, 0, 0, 3, 2, $1EA)

SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_6:
    dw $0001                                                             ;B4DD7B;
    %spritemapEntry(1, $1F8, $E0, 0, 0, 3, 2, $1EC)

SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_7:
    dw $0001                                                             ;B4DD82;
    %spritemapEntry(1, $1F8, $DC, 0, 0, 3, 2, $1EE)


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
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02                   ;B4EC1C;
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02

EnemyVulnerabilities_DessgeegaLarge:
    db $00,$00,$00,$00,$01,$01,$01,$01,$02,$02,$02,$02                   ;B4EC32;
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02

EnemyVulnerabilities_Viola_Yard_HZoomer_Zeela_Sova_Zoomer:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02                   ;B4EC48;
    db $02,$02,$04,$04,$02,$02,$02,$02,$02,$02

EnemyVulnerabilities_PirateNinja_Grey_Green_Red_Magenta:
    db $82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82                   ;B4EC5E;
    db $02,$02,$00,$02,$02,$02,$02,$02,$80,$00

EnemyVulnerabilities_PirateGoldNinja:
    db $80,$80,$80,$80,$81,$81,$81,$81,$82,$82,$82,$82                   ;B4EC74;
    db $02,$04,$00,$00,$00,$00,$00,$02,$80,$00

EnemyVulnerabilities_PirateSilverWall_PirateSilverWalking:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02                   ;B4EC8A;
    db $04,$04,$00,$02,$02,$02,$02,$02,$02,$02

EnemyVulnerabilities_PirateSilverNinja:
    db $84,$84,$84,$84,$84,$84,$84,$84,$84,$84,$84,$84                   ;B4ECA0;
    db $84,$84,$84,$84,$84,$84,$84,$04,$84,$84

EnemyVulnerabilities_PirateRedWall:
    db $00,$02,$04,$04,$02,$02,$04,$04,$02,$02,$04,$04                   ;B4ECB6;
    db $04,$04,$02,$02,$02,$02,$02,$02,$02,$02

EnemyVulnerabilities_PirateGreyWall:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02                   ;B4ECCC;
    db $04,$04,$00,$02,$02,$02,$02,$02,$02,$02

EnemyVulnerabilities_PirateMagentaWall:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02                   ;B4ECE2;
    db $04,$04,$00,$02,$02,$02,$02,$02,$02,$02

EnemyVulnerabilities_PirateGreyWalking:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02                   ;B4ECF8;
    db $04,$04,$00,$02,$02,$02,$02,$02,$02,$02

EnemyVulnerabilities_PirateGreenWalking:
    db $00,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02                   ;B4ED0E;
    db $04,$04,$04,$02,$02,$02,$02,$02,$02,$02

EnemyVulnerabilities_PirateRedWalking:
    db $00,$02,$04,$04,$02,$02,$04,$04,$02,$02,$04,$04                   ;B4ED24;
    db $04,$04,$00,$02,$02,$02,$02,$02,$02,$02

EnemyVulnerabilities_PirateMagentaWalking:
    db $00,$00,$00,$00,$00,$00,$00,$00,$02,$02,$02,$02                   ;B4ED3A;
    db $00,$00,$00,$00,$02,$02,$02,$00,$02,$02

EnemyVulnerabilities_PirateGoldWall_PirateGoldWalking:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00                   ;B4ED50;
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02

EnemyVulnerabilities_KihunterGreen_KihunterGreenWings:
    db $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01                   ;B4ED66;
    db $04,$04,$00,$02,$02,$02,$02,$02,$02,$02

EnemyVulnerabilities_KihunterYellow_KihunterYellowWings:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02                   ;B4ED7C;
    db $02,$02,$00,$02,$02,$02,$02,$02,$02,$02

EnemyVulnerabilities_KihunterRed_KihunterRedWings:
    db $00,$00,$81,$81,$81,$82,$82,$82,$82,$82,$82,$82                   ;B4ED92;
    db $00,$02,$00,$00,$02,$02,$04,$82,$00,$02

EnemyVulnerabilities_Boyon:
    db $00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF                   ;B4EDA8;
    db $00,$02,$02,$02,$00,$00,$00,$00,$02,$02

EnemyVulnerabilities_Metaree:
    db $00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF                   ;B4EDBE;
    db $00,$02,$02,$02,$00,$00,$02,$00,$02,$02

EnemyVulnerabilities_MZoomer:
    db $00,$00,$00,$00,$00,$00,$00,$00,$02,$02,$02,$02                   ;B4EDD4;
    db $00,$00,$02,$02,$00,$00,$02,$00,$00,$00

EnemyVulnerabilities_Squeept_Ripper2_Ripper_Tripper:
    db $00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF                   ;B4EDEA;
    db $00,$02,$00,$02,$00,$00,$02,$00,$00,$02

EnemyVulnerabilities_Mella:
    db $02,$02,$04,$04,$02,$02,$04,$04,$02,$02,$04,$04                   ;B4EE00;
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02

EnemyVulnerabilities_Dragon:
    db $00,$00,$FF,$FF,$00,$00,$FF,$FF,$02,$02,$02,$02                   ;B4EE16;
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02

EnemyVulnerabilities_Alcoon:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02                   ;B4EE2C;
    db $04,$04,$02,$02,$02,$02,$02,$02,$02,$02

EnemyVulnerabilities_Geruta:
    db $02,$02,$04,$04,$02,$02,$04,$04,$02,$02,$04,$04                   ;B4EE42;
    db $02,$02,$00,$02,$02,$02,$02,$02,$02,$02

EnemyVulnerabilities_Holtz:
    db $02,$02,$04,$04,$02,$02,$04,$04,$02,$02,$04,$04                   ;B4EE58;
    db $00,$02,$00,$02,$02,$02,$02,$02,$02,$02

EnemyVulnerabilities_Multiviola:
    db $02,$02,$04,$04,$02,$02,$04,$04,$02,$02,$04,$04                   ;B4EE6E;
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02

EnemyVulnerabilities_Owtch:
    db $00,$00,$00,$00,$00,$00,$00,$00,$02,$02,$02,$02                   ;B4EE84;
    db $00,$02,$00,$02,$02,$02,$02,$02,$02,$02

EnemyVulnerabilities_YappingMaw:
    db $00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF                   ;B4EE9A;
    db $00,$02,$00,$00,$02,$02,$00,$00,$00,$02

EnemyVulnerabilities_Fune_Magdollite:
    db $00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF                   ;B4EEB0;
    db $00,$02,$00,$02,$02,$02,$00,$00,$00,$02

EnemyVulnerabilities_Indestructible:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00                   ;B4EEC6;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00

EnemyVulnerabilities_Boulder:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00                   ;B4EEDC;
    db $00,$02,$00,$00,$00,$00,$00,$00,$02,$02

EnemyVulnerabilities_Namihe:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FF,$FF                   ;B4EEF2;
    db $00,$00,$00,$00,$00,$00,$02,$00,$02,$02

EnemyVulnerabilities_NonDestructibleShutter:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00                   ;B4EF08;
    db $00,$00,$00,$82,$00,$00,$00,$00,$00,$00

EnemyVulnerabilities_Shaktool:
    db $82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82                   ;B4EF1E;
    db $82,$82,$82,$00,$00,$00,$00,$00,$00,$00

EnemyVulnerabilities_Powamp:
    db $82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82                   ;B4EF34;
    db $82,$82,$82,$82,$82,$82,$82,$02,$82,$82

EnemyVulnerabilities_GRipper:
    db $00,$00,$00,$00,$00,$00,$80,$00,$00,$00,$00,$00                   ;B4EF4A;
    db $02,$02,$00,$02,$00,$02,$02,$00,$00,$02

EnemyVulnerabilities_Metroid:
    db $00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF                   ;B4EF60;
    db $02,$04,$00,$01,$02,$02,$02,$00,$02,$02

EnemyVulnerabilities_Sciser_Zero:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02                   ;B4EF76;
    db $02,$02,$04,$04,$02,$02,$02,$02,$02,$02

EnemyVulnerabilities_Beetom:
    db $00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF                   ;B4EF8C;
    db $02,$02,$04,$04,$02,$02,$02,$00,$00,$02

EnemyVulnerabilities_Bull:
    db $80,$80,$80,$80,$80,$80,$80,$80,$02,$02,$82,$82                   ;B4EFA2;
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02

EnemyVulnerabilities_ShutterDestroyable:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$82,$82                   ;B4EFB8;
    db $00,$00,$00,$00,$00,$00,$00,$02,$00,$00

EnemyVulnerabilities_Evir:
    db $02,$02,$FF,$FF,$02,$02,$FF,$FF,$02,$02,$82,$82                   ;B4EFCE;
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02

EnemyVulnerabilities_EvirProjectile:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00                   ;B4EFE4;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00

EnemyVulnerabilities_MiniKraid:
    db $82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82                   ;B4EFFA;
    db $84,$84,$82,$82,$82,$82,$82,$02,$80,$80

EnemyVulnerabilities_Bang:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02                   ;B4F010;
    db $00,$00,$00,$00,$00,$00,$00,$02,$00,$00

EnemyVulnerabilities_Kago:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00                   ;B4F026;
    db $00,$00,$00,$02,$00,$00,$00,$00,$00,$00

EnemyVulnerabilities_Zebetite:
    db $80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80                   ;B4F068;
    db $82,$82,$80,$80,$80,$80,$80,$00,$80,$80

EnemyVulnerabilities_SidehopperTourian:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00                   ;B4F07E;
    db $00,$02,$00,$00,$00,$00,$00,$00,$00,$00

EnemyVulnerabilities_SporeSpawn:
    db $80,$82,$82,$82,$80,$82,$82,$82,$82,$82,$82,$82                   ;B4F094;
    db $82,$82,$80,$80,$80,$80,$80,$04,$80,$80

EnemyVulnerabilities_BombTorizo_BombTorizoOrb:
    db $02,$02,$82,$82,$02,$02,$82,$82,$02,$02,$82,$82                   ;B4F0C0;
    db $02,$04,$00,$00,$00,$00,$00,$02,$00,$00

EnemyVulnerabilities_GoldenTorizo_GoldenTorizoOrb:
    db $80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80                   ;B4F0D6;
    db $82,$84,$80,$00,$00,$00,$00,$02,$02,$00

EnemyVulnerabilities_Phantoon_Body_Eye_Tentacles_Mouth:
    db $80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80                   ;B4F0EC;
    db $82,$84,$00,$00,$00,$00,$00,$02,$80,$80

EnemyVulnerabilities_Crocomire_CrocomireTongue:
    db $80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80                   ;B4F102;
    db $80,$80,$80,$82,$80,$80,$80,$00,$80,$80

EnemyVulnerabilities_Botwoon:
    db $80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80                   ;B4F118;
    db $82,$82,$80,$80,$80,$80,$80,$02,$80,$80

EnemyVulnerabilities_Corpse_BabyMetroid:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00                   ;B4F12E;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00

EnemyVulnerabilities_Draygon_Body_Eye_Tail_Arms:
    db $80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80                   ;B4F144;
    db $82,$82,$80,$80,$80,$81,$80,$82,$82,$80

EnemyVulnerabilities_Kraid:
    db $82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82                   ;B4F15A;
    db $82,$82,$80,$80,$80,$80,$80,$02,$80,$80

EnemyVulnerabilities_KraidArm_KraidFoot:
    db $80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80                   ;B4F170;
    db $80,$80,$80,$80,$80,$80,$80,$00,$80,$80

EnemyVulnerabilities_Kraid_LintTop_LintMiddle_LintBottom:
    db $80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80                   ;B4F186;
    db $80,$80,$80,$80,$80,$80,$80,$00,$80,$80

EnemyVulnerabilities_KraidNail_KraidNailBad:
    db $82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82                   ;B4F19C;
    db $82,$82,$82,$82,$82,$00,$82,$02,$82,$82

EnemyVulnerabilities_Ridley_RidleyCeres:
    db $80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80                   ;B4F1B2;
    db $82,$84,$80,$82,$80,$80,$80,$82,$80,$80

EnemyVulnerabilities_MotherBrainHead:
    db $80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80                   ;B4F1C8;
    db $82,$82,$80,$80,$80,$80,$80,$02,$80,$80

EnemyVulnerabilities_MotherBrainBody:
    db $80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80                   ;B4F1DE;
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
    db $3C,$3C,$3C,$05,$3C,$0A                                           ;B4F1F4; 23.5%  23.5%  23.5%   2.0%  23.5%   3.9%

EnemyDropChances_Rio:
    db $1E,$50,$55,$28,$0A,$0A                                           ;B4F1FA; 11.8%  31.4%  33.3%  15.7%   3.9%   3.9%

EnemyDropChances_Waver:
    db $3C,$3C,$3C,$05,$3C,$0A                                           ;B4F200; 23.5%  23.5%  23.5%   2.0%  23.5%   3.9%

EnemyDropChances_Skree:
    db $14,$03,$55,$89,$05,$05                                           ;B4F206;  7.8%   1.2%  33.3%  53.7%   2.0%   2.0%

EnemyDropChances_Puyo:
    db $3C,$3C,$3C,$05,$0A,$3C                                           ;B4F20C; 23.5%  23.5%  23.5%   2.0%   3.9%  23.5%

EnemyDropChances_Atomic:
    db $00,$A5,$50,$00,$05,$05                                           ;B4F212;        64.7%  31.4%          2.0%   2.0%

EnemyDropChances_Mochtroid:
    db $3C,$3C,$3C,$05,$3C,$0A                                           ;B4F218; 23.5%  23.5%  23.5%   2.0%  23.5%   3.9%

EnemyDropChances_Choot:
    db $3C,$3C,$3C,$05,$3C,$0A                                           ;B4F21E; 23.5%  23.5%  23.5%   2.0%  23.5%   3.9%

EnemyDropChances_Zoomer:
    db $37,$19,$AA,$00,$05,$00                                           ;B4F224; 21.6%   9.8%  66.7%          2.0%

EnemyDropChances_Zeela:
    db $37,$19,$7D,$00,$32,$00                                           ;B4F22A; 21.6%   9.8%  49.0%         19.6%

EnemyDropChances_Sova:
    db $50,$46,$1E,$19,$32,$00                                           ;B4F230; 31.4%  27.5%  11.8%   9.8%  19.6%

EnemyDropChances_Mellow:
    db $1E,$46,$50,$46,$05,$00                                           ;B4F236; 11.8%  27.5%  31.4%  27.5%   2.0%

EnemyDropChances_Mella:
    db $46,$1E,$50,$46,$05,$00                                           ;B4F23C; 27.5%  11.8%  31.4%  27.5%   2.0%

EnemyDropChances_Menu:
    db $46,$14,$50,$50,$05,$00                                           ;B4F242; 27.5%   7.8%  31.4%  31.4%   2.0%

EnemyDropChances_Zeb:
    db $3C,$3C,$3C,$05,$3C,$0A                                           ;B4F248; 23.5%  23.5%  23.5%   2.0%  23.5%   3.9%

EnemyDropChances_Geega:
    db $3C,$3C,$3C,$05,$3C,$0A                                           ;B4F24E; 23.5%  23.5%  23.5%   2.0%  23.5%   3.9%

EnemyDropChances_Zebbo:
    db $00,$8C,$0A,$00,$64,$05                                           ;B4F254;        54.9%   3.9%         39.2%   2.0%

EnemyDropChances_Gamet:
    db $3C,$3C,$3C,$05,$3C,$0A                                           ;B4F25A; 23.5%  23.5%  23.5%   2.0%  23.5%   3.9%

EnemyDropChances_Zoa:
    db $00,$64,$46,$05,$46,$0A                                           ;B4F260;        39.2%  27.5%   2.0%  27.5%   3.9%

EnemyDropChances_Coven:
    db $32,$5F,$46,$00,$14,$14                                           ;B4F266; 19.6%  37.3%  27.5%          7.8%   7.8%

EnemyDropChances_Kago:
    db $32,$5A,$46,$05,$14,$14                                           ;B4F26C; 19.6%  35.3%  27.5%   2.0%   7.8%   7.8%

EnemyDropChances_KihunterGreen_KihunterGreenWings:
    db $32,$1E,$50,$4B,$0A,$0A                                           ;B4F272; 19.6%  11.8%  31.4%  29.4%   3.9%   3.9%

EnemyDropChances_KihunterYellow_KihunterYellowWings:
    db $37,$50,$0A,$28,$3C,$0A                                           ;B4F278; 21.6%  31.4%   3.9%  15.7%  23.5%   3.9%

EnemyDropChances_KihunterRed_KihunterRedWings:
    db $23,$78,$0A,$14,$3C,$0A                                           ;B4F27E; 13.7%  47.1%   3.9%   7.8%  23.5%   3.9%

EnemyDropChances_PirateGoldNinja:
    db $00,$96,$05,$00,$64,$00                                           ;B4F284;        58.8%   2.0%         39.2%

EnemyDropChances_DessgeegaLarge:
    db $50,$14,$32,$5F,$05,$05                                           ;B4F28A; 31.4%   7.8%  19.6%  37.3%   2.0%   2.0%

EnemyDropChances_PirateRedWall:
    db $0A,$14,$14,$C3,$05,$05                                           ;B4F290;  3.9%   7.8%   7.8%  76.5%   2.0%   2.0%

EnemyDropChances_PirateRedNinja:
    db $0A,$14,$14,$C3,$05,$05                                           ;B4F296;  3.9%   7.8%   7.8%  76.5%   2.0%   2.0%

EnemyDropChances_PirateRedWalking:
    db $0A,$14,$14,$C3,$05,$05                                           ;B4F29C;  3.9%   7.8%   7.8%  76.5%   2.0%   2.0%

EnemyDropChances_PirateGoldWall:
    db $0A,$14,$14,$C3,$05,$05                                           ;B4F2A2;  3.9%   7.8%   7.8%  76.5%   2.0%   2.0%

EnemyDropChances_PirateGreyWall:
    db $0A,$2D,$C5,$01,$01,$01                                           ;B4F2A8;  3.9%  17.6%  77.3%   0.4%   0.4%   0.4%

EnemyDropChances_PirateGreenWall:
    db $05,$1E,$78,$00,$64,$00                                           ;B4F2AE;  2.0%  11.8%  47.1%         39.2%

EnemyDropChances_Powamp:
    db $01,$00,$00,$00,$FE,$00                                           ;B4F2B4;  0.4%                       99.6%

EnemyDropChances_Cacatac:
    db $00,$01,$00,$00,$FE,$00                                           ;B4F2BA;         0.4%                99.6%

EnemyDropChances_MiniKraid:
    db $00,$01,$00,$00,$FE,$00                                           ;B4F2C0;         0.4%                99.6%

EnemyDropChances_GRipper_Ripper2:
    db $00,$01,$00,$00,$FE,$00                                           ;B4F2C6;         0.4%                99.6%

EnemyDropChances_Viola:
    db $01,$00,$00,$00,$00,$FE                                           ;B4F2CC;  0.4%                              99.6%

EnemyDropChances_Bull:
    db $00,$05,$00,$00,$00,$FA                                           ;B4F2D2;         2.0%                       98.0%

EnemyDropChances_Sciser:
    db $01,$64,$00,$00,$00,$9A                                           ;B4F2D8;  0.4%  39.2%                       60.4%

EnemyDropChances_Dessgeega:
    db $01,$00,$00,$00,$00,$FE                                           ;B4F2DE;  0.4%                              99.6%

EnemyDropChances_Fireflea:
    db $00,$01,$00,$00,$00,$FE                                           ;B4F2E4;         0.4%                       99.6%

EnemyDropChances_Alcoon:
    db $01,$00,$00,$00,$00,$FE                                           ;B4F2EA;  0.4%                              99.6%

EnemyDropChances_Zero:
    db $01,$00,$00,$00,$00,$FE                                           ;B4F2F0;  0.4%                              99.6%

EnemyDropChances_Beetom:
    db $01,$00,$00,$00,$00,$FE                                           ;B4F2F6;  0.4%                              99.6%

EnemyDropChances_HZoomer:
    db $82,$14,$00,$64,$00,$05                                           ;B4F2FC; 51.0%   7.8%         39.2%          2.0%

EnemyDropChances_MZoomer:
    db $82,$14,$00,$64,$00,$05                                           ;B4F302; 51.0%   7.8%         39.2%          2.0%

EnemyDropChances_Ripper:
    db $50,$14,$50,$41,$05,$05                                           ;B4F308; 31.4%   7.8%  31.4%  25.5%   2.0%   2.0%

EnemyDropChances_Tripper_Kamer2:
    db $50,$50,$50,$05,$05,$05                                           ;B4F30E; 31.4%  31.4%  31.4%   2.0%   2.0%   2.0%

EnemyDropChances_Metaree:
    db $50,$19,$50,$3C,$05,$05                                           ;B4F314; 31.4%   9.8%  31.4%  23.5%   2.0%   2.0%

EnemyDropChances_Boyon:
    db $14,$0A,$55,$82,$05,$05                                           ;B4F320;  7.8%   3.9%  33.3%  51.0%   2.0%   2.0%

EnemyDropChances_Sidehopper:
    db $14,$28,$55,$64,$05,$05                                           ;B4F326;  7.8%  15.7%  33.3%  39.2%   2.0%   2.0%

EnemyDropChances_SidehopperLarge_SidehopperTourian:
    db $14,$14,$37,$64,$37,$05                                           ;B4F32C;  7.8%   7.8%  21.6%  39.2%  21.6%   2.0%

EnemyDropChances_Skultera:
    db $50,$1E,$46,$46,$05,$00                                           ;B4F332; 31.4%  11.8%  27.5%  27.5%   2.0%

EnemyDropChances_Oum:
    db $46,$1E,$46,$4B,$05,$05                                           ;B4F338; 27.5%  11.8%  27.5%  29.4%   2.0%   2.0%

EnemyDropChances_Yard:
    db $55,$50,$00,$50,$00,$0A                                           ;B4F33E; 33.3%  31.4%         31.4%          3.9%

EnemyDropChances_Botwoon:
    db $00,$82,$3C,$05,$1E,$1E                                           ;B4F344;        51.0%  23.5%   2.0%  11.8%  11.8%

EnemyDropChances_Owtch:
    db $50,$50,$50,$05,$05,$05                                           ;B4F34A; 31.4%  31.4%  31.4%   2.0%   2.0%   2.0%

EnemyDropChances_Evir_EvirProjectile:
    db $50,$50,$50,$05,$05,$05                                           ;B4F350; 31.4%  31.4%  31.4%   2.0%   2.0%   2.0%

EnemyDropChances_Holtz:
    db $00,$78,$32,$00,$32,$23                                           ;B4F356;        47.1%  19.6%         19.6%  13.7%

EnemyDropChances_Squeept:
    db $32,$32,$32,$05,$32,$32                                           ;B4F35C; 19.6%  19.6%  19.6%   2.0%  19.6%  19.6%

EnemyDropChances_Multiviola:
    db $46,$1E,$4B,$46,$05,$05                                           ;B4F362; 27.5%  11.8%  29.4%  27.5%   2.0%   2.0%

EnemyDropChances_Dragon:
    db $32,$32,$46,$4B,$05,$05                                           ;B4F368; 19.6%  19.6%  27.5%  29.4%   2.0%   2.0%

EnemyDropChances_Metroid:
    db $19,$32,$5A,$0A,$32,$1E                                           ;B4F36E;  9.8%  19.6%  35.3%   3.9%  19.6%  11.8%

EnemyDropChances_Rinka:
    db $00,$00,$00,$FF,$00,$00                                           ;B4F374;                     100.0%

EnemyDropChances_Bang:
    db $2D,$50,$50,$1E,$0A,$0A                                           ;B4F380; 17.6%  31.4%  31.4%  11.8%   3.9%   3.9%

EnemyDropChances_PirateGreyNinja:
    db $32,$78,$50,$00,$05,$00                                           ;B4F386; 19.6%  47.1%  31.4%          2.0%

EnemyDropChances_PirateGreyWalking:
    db $32,$78,$50,$00,$05,$00                                           ;B4F38C; 19.6%  47.1%  31.4%          2.0%

EnemyDropChances_PirateGreenNinja:
    db $32,$19,$00,$19,$9B,$00                                           ;B4F392; 19.6%   9.8%          9.8%  60.8%

EnemyDropChances_PirateGreenWalking:
    db $32,$1E,$64,$2D,$14,$0A                                           ;B4F398; 19.6%  11.8%  39.2%  17.6%   7.8%   3.9%

EnemyDropChances_PirateGoldWalking:
    db $32,$78,$50,$00,$05,$00                                           ;B4F39E; 19.6%  47.1%  31.4%          2.0%

EnemyDropChances_PirateMagentaWall:
    db $1E,$46,$50,$46,$05,$00                                           ;B4F3A4; 11.8%  27.5%  31.4%  27.5%   2.0%

EnemyDropChances_PirateMagentaNinja:
    db $32,$78,$50,$00,$05,$00                                           ;B4F3AA; 19.6%  47.1%  31.4%          2.0%

EnemyDropChances_PirateMagentaWalking:
    db $32,$78,$50,$00,$05,$00                                           ;B4F3B0; 19.6%  47.1%  31.4%          2.0%

EnemyDropChances_MamaTurtle_BabyTurtle:
    db $50,$50,$50,$05,$05,$05                                           ;B4F3BC; 31.4%  31.4%  31.4%   2.0%   2.0%   2.0%

EnemyDropChances_ShipTop_ShipBottomEntrance:
    db $00,$00,$00,$FF,$00,$00                                           ;B4F3C2;                     100.0%

EnemyDropChances_Shaktool:
    db $50,$50,$50,$05,$05,$05                                           ;B4F3C8; 31.4%  31.4%  31.4%   2.0%   2.0%   2.0%

EnemyDropChances_Eye:
    db $50,$50,$50,$05,$05,$05                                           ;B4F3CE; 31.4%  31.4%  31.4%   2.0%   2.0%   2.0%

EnemyDropChances_Fune:
    db $50,$50,$50,$05,$05,$05                                           ;B4F3D4; 31.4%  31.4%  31.4%   2.0%   2.0%   2.0%

EnemyDropChances_Namihe:
    db $50,$50,$50,$05,$05,$05                                           ;B4F3DA; 31.4%  31.4%  31.4%   2.0%   2.0%   2.0%

EnemyDropChances_YappingMaw:
    db $50,$50,$50,$05,$05,$05                                           ;B4F3E0; 31.4%  31.4%  31.4%   2.0%   2.0%   2.0%

EnemyDropChances_Magdollite:
    db $50,$50,$50,$05,$05,$05                                           ;B4F3E6; 31.4%  31.4%  31.4%   2.0%   2.0%   2.0%

EnemyDropChances_Robot:
    db $50,$50,$50,$05,$05,$05                                           ;B4F3EC; 31.4%  31.4%  31.4%   2.0%   2.0%   2.0%

EnemyDropChances_RobotNoPower:
    db $50,$50,$50,$05,$05,$05                                           ;B4F3F2; 31.4%  31.4%  31.4%   2.0%   2.0%   2.0%

EnemyDropChances_MotherBrainBody_BombTorizo:
    db $32,$32,$32,$00,$32,$37                                           ;B4F3F8; 19.6%  19.6%  19.6%         19.6%  21.6%

EnemyDropChances_BombTorizoOrb:
    db $74,$14,$41,$36,$00,$00                                           ;B4F3FE; 45.5%   7.8%  25.5%  21.2%

EnemyDropChances_GoldenTorizo:
    db $32,$32,$32,$00,$32,$37                                           ;B4F404; 19.6%  19.6%  19.6%         19.6%  21.6%

EnemyDropChances_GoldenTorizoOrb:
    db $1E,$1E,$32,$3C,$55,$00                                           ;B4F40A; 11.8%  11.8%  19.6%  23.5%  33.3%

EnemyDropChances_SporeSpawn:
    db $32,$32,$32,$00,$32,$37                                           ;B4F410; 19.6%  19.6%  19.6%         19.6%  21.6%

EnemyDropChances_SporeSpawnStalk:
    db $0A,$14,$C8,$19,$00,$00                                           ;B4F416;  3.9%   7.8%  78.4%   9.8%

EnemyDropChances_Kraid:
    db $32,$32,$32,$00,$32,$37                                           ;B4F41C; 19.6%  19.6%  19.6%         19.6%  21.6%

EnemyDropChances_KraidNail_KraidFoot:
    db $0A,$23,$C8,$00,$0A,$00                                           ;B4F422;  3.9%  13.7%  78.4%          3.9%

EnemyDropChances_CrocomireTongue:
    db $00,$0A,$DC,$05,$14,$00                                           ;B4F428;         3.9%  86.3%   2.0%   7.8%

EnemyDropChances_Crocomire:
    db $00,$78,$64,$05,$14,$0A                                           ;B4F42E;        47.1%  39.2%   2.0%   7.8%   3.9%

EnemyDropChances_Phantoon_Body_Tentacles_Mouth:
    db $32,$32,$32,$00,$32,$37                                           ;B4F434; 19.6%  19.6%  19.6%         19.6%  21.6%

EnemyDropChances_PhantoonEye:
    db $14,$14,$64,$69,$0A,$00                                           ;B4F43A;  7.8%   7.8%  39.2%  41.2%   3.9%

EnemyDropChances_DraygonBody_DraygonTail_DraygonArms:
    db $32,$32,$32,$00,$32,$37                                           ;B4F440; 19.6%  19.6%  19.6%         19.6%  21.6%

EnemyDropChances_DraygonEye:
    db $05,$1E,$6E,$64,$05,$05                                           ;B4F446;  2.0%  11.8%  43.1%  39.2%   2.0%   2.0%

EnemyDropChances_Ridley_RidleyCeres:
    db $32,$32,$32,$00,$32,$37                                           ;B4F44C; 19.6%  19.6%  19.6%         19.6%  21.6%

EnemyDropChances_NoobTubeCrack_Chozo:
    db $00,$00,$00,$FF,$00,$00                                           ;B4F452;                     100.0%

EnemyDropChances_Spark:
    db $00,$00,$00,$FF,$00,$00                                           ;B4F458;                     100.0%

EnemyDropChances_FaceBlock:
    db $00,$00,$00,$FF,$00,$00                                           ;B4F45E;                     100.0%

EnemyDropChances_Puromi:
    db $00,$00,$00,$FF,$00,$00                                           ;B4F464;                     100.0%

EnemyDropChances_Boulder:
    db $00,$00,$00,$FF,$00,$00                                           ;B4F46A;                     100.0%

EnemyDropChances_KzanTop_KzanBottom:
    db $00,$00,$00,$FF,$00,$00                                           ;B4F470;                     100.0%

EnemyDropChances_Hibashi:
    db $00,$00,$00,$FF,$00,$00                                           ;B4F476;                     100.0%

EnemyDropChances_Sbug_Sbug2:
    db $00,$00,$00,$FF,$00,$00                                           ;B4F47C;                     100.0%

EnemyDropChances_Etecoon_EtecoonEscape:
    db $00,$00,$00,$FF,$00,$00                                           ;B4F482;                     100.0%

EnemyDropChances_Steam_Dachora_DachoraEscape:
    db $00,$00,$00,$FF,$00,$00                                           ;B4F488;                     100.0%

EnemyDropChances_Polyp:
    db $00,$00,$00,$FF,$00,$00                                           ;B4F48E;                     100.0%

EnemyDropChances_MotherBrainHead:
    db $00,$00,$00,$FF,$00,$00                                           ;B4F49A;                     100.0%

EnemyDropChances_Shutter_Kamer_BabyMetroidCutscene:
    db $00,$00,$00,$FF,$00,$00                                           ;B4F4A0;                     100.0%

EnemyDropChances_PirateSilverWall:
    db $00,$00,$00,$FF,$00,$00                                           ;B4F4A6;                     100.0%

EnemyDropChances_PirateSilverNinja:
    db $00,$00,$00,$FF,$00,$00                                           ;B4F4AC;                     100.0%

EnemyDropChances_PirateSilverWalking:
    db $00,$00,$00,$FF,$00,$00                                           ;B4F4B2;                     100.0%


Freespace_BankB4_F4B8:                                                   ;B4F4B8;
; $B48 bytes
