
org $B48000


EnemySets:
EnemySets_Draygon_1_MotherBrain_2:
    dw $FFFF                                                             ;B48000;
    db "SF1_10 "                                                         ;B48002;

EnemySets_EastOcean:
    dw EnemyHeaders_Choot                                                ;B48009;
    dw $0001                                                             ;B4800B;
    dw EnemyHeaders_Skultera                                             ;B4800D;
    dw $0002                                                             ;B4800F;
    dw EnemyHeaders_Kamer2                                               ;B48011;
    dw $0003,$FFFF                                                       ;B48013;
    db $00                                                               ;B48017;
    db "sf1_04 "                                                         ;B48018;

EnemySets_CrateriaPowerBombs:
    dw EnemyHeaders_Alcoon                                               ;B4801F;
    dw $0001                                                             ;B48021;
    dw EnemyHeaders_Zero                                                 ;B48023;
    dw $0001,$FFFF                                                       ;B48025;
    db $00                                                               ;B48029;
    db "sf2_06 "                                                         ;B4802A;

EnemySets_Terminator:
    dw EnemyHeaders_Waver                                                ;B48031;
    dw $0001                                                             ;B48033;
    dw EnemyHeaders_Zoomer                                               ;B48035;
    dw $0002,$FFFF                                                       ;B48037;
    db $00                                                               ;B4803B;
    db "SF2_12a"                                                         ;B4803C;

EnemySets_FinalMissileBombway_1:
    dw EnemyHeaders_FaceBlock                                            ;B48043;
    dw $0007                                                             ;B48045;
    dw EnemyHeaders_Stoke                                                ;B48047;
    dw $0007,$FFFF                                                       ;B48049;
    db $00                                                               ;B4804D;
    db "SF2_12 "                                                         ;B4804E;

EnemySets_FinalMissileBombway_0:
    dw EnemyHeaders_FaceBlock                                            ;B48055;
    dw $0007                                                             ;B48057;
    dw EnemyHeaders_Stoke                                                ;B48059;
    dw $0007,$FFFF                                                       ;B4805B;
    db $00                                                               ;B4805F;
    db "sf1_02A"                                                         ;B48060;

EnemySets_Parlor_1:
    dw EnemyHeaders_Zoomer                                               ;B48067;
    dw $0001                                                             ;B48069;
    dw EnemyHeaders_Skree                                                ;B4806B;
    dw $0002                                                             ;B4806D;
    dw EnemyHeaders_Ripper                                               ;B4806F;
    dw $0003,$FFFF                                                       ;B48071;
    db $00                                                               ;B48075;
    db "sf2_04 "                                                         ;B48076;

EnemySets_Flyway_0_1:
    dw EnemyHeaders_Waver                                                ;B4807D;
    dw $0001                                                             ;B4807F;
    dw EnemyHeaders_Mellow                                               ;B48081;
    dw $0002,$FFFF                                                       ;B48083;
    db $00                                                               ;B48087;
    db "sf2_01A"                                                         ;B48088;

EnemySets_Pit_1:
    dw EnemyHeaders_PirateGreyWalking                                    ;B4808F;
    dw $0001                                                             ;B48091;
    dw EnemyHeaders_PirateGreyWall                                       ;B48093;
    dw $0002,$FFFF                                                       ;B48095;
    db $00                                                               ;B48099;
    db "sf1_01 "                                                         ;B4809A;

EnemySets_GauntletEntrance:
    dw EnemyHeaders_YappingMaw                                           ;B480A1;
    dw $0001                                                             ;B480A3;
    dw EnemyHeaders_Waver                                                ;B480A5;
    dw $0002,$FFFF                                                       ;B480A7;
    db $00                                                               ;B480AB;
    db "sf2_03 "                                                         ;B480AC;

EnemySets_BombTorizo_0_1:
    dw EnemyHeaders_BombTorizo                                           ;B480B3;
    dw $0001,$FFFF                                                       ;B480B5;
    db $00                                                               ;B480B9;
    db "sf2_10 "                                                         ;B480BA;

EnemySets_GreenPiratesShaft:
    dw EnemyHeaders_PirateGreenWalking                                   ;B480C1;
    dw $0001                                                             ;B480C3;
    dw EnemyHeaders_Beetom                                               ;B480C5;
    dw $0002,$FFFF                                                       ;B480C7;
    db $00                                                               ;B480CB;
    db "sf2_07 "                                                         ;B480CC;

EnemySets_GreenBrinstarElev:
    dw $FFFF                                                             ;B480D3;
    db $00                                                               ;B480D5;
    db "SF2_13 "                                                         ;B480D6;

EnemySets_FinalMissile_0:
    dw EnemyHeaders_Eye                                                  ;B480DD;
    dw $0001,$FFFF                                                       ;B480DF;
    db $00                                                               ;B480E3;
    db "sf2_09 "                                                         ;B480E4;

EnemySets_CrateriaMap:
    dw EnemyHeaders_BombTorizo                                           ;B480EB;
    dw $0001,$FFFF                                                       ;B480ED;
    db $00                                                               ;B480F1;
    db "SF2_14 "                                                         ;B480F2;

UNUSED_EnemySets_B480F9:
    dw EnemyHeaders_FaceBlock                                            ;B480F9;
    dw $0001,$FFFF                                                       ;B480FB;
    db $00                                                               ;B480FF;
    db "SF2_13a"                                                         ;B48100;

EnemySets_FinalMissile_1:
    dw $FFFF                                                             ;B48107;
    db $00                                                               ;B48109;
    db "sf2_00 "                                                         ;B4810A;

EnemySets_Climb_2:
    dw EnemyHeaders_PirateSilverNinja                                    ;B48111;
    dw $0002,$FFFF                                                       ;B48113;
    db $00                                                               ;B48117;
    db "sf1_03 "                                                         ;B48118;

UNUSED_EnemySets_B4811F:
    dw $FFFF                                                             ;B4811F;
    db $00                                                               ;B48121;
    db "SF1_05 "                                                         ;B48122;

EnemySets_CrateriaSave:
    dw $FFFF                                                             ;B48129;
    db $00                                                               ;B4812B;
    db "SF1_13 "                                                         ;B4812C;

EnemySets_ForgottenHighwayElbow:
    dw EnemyHeaders_FaceBlock                                            ;B48133;
    dw $0001,$FFFF                                                       ;B48135;
    db $00                                                               ;B48139;
    db "SF1_15 "                                                         ;B4813A;

EnemySets_Moat:
    dw EnemyHeaders_FaceBlock                                            ;B48141;
    dw $0001,$FFFF                                                       ;B48143;
    db $00                                                               ;B48147;
    db "sf2_00 "                                                         ;B48148;

EnemySets_Climb_0:
    dw EnemyHeaders_Sbug                                                 ;B4814F;
    dw $0007                                                             ;B48151;
    dw EnemyHeaders_FaceBlock                                            ;B48153;
    dw $0007,$FFFF                                                       ;B48155;
    db $00                                                               ;B48159;
    db "SF1_06 "                                                         ;B4815A;

EnemySets_WestOcean:
    dw EnemyHeaders_Skultera                                             ;B48161;
    dw $0001                                                             ;B48163;
    dw EnemyHeaders_Zeb                                                  ;B48165;
    dw $0002                                                             ;B48167;
    dw EnemyHeaders_GRipper                                              ;B48169;
    dw $0003                                                             ;B4816B;
    dw EnemyHeaders_Tripper                                              ;B4816D;
    dw $0007,$FFFF                                                       ;B4816F;
    db $00                                                               ;B48173;
    db "SF1_20 "                                                         ;B48174;

UNUSED_EnemySets_B4817B:
    dw $FFFF                                                             ;B4817B;
    db $00                                                               ;B4817D;
    db "sf1_02 "                                                         ;B4817E;

EnemySets_Parlor_0:
    dw EnemyHeaders_Sbug                                                 ;B48185;
    dw $0007,$FFFF                                                       ;B48187;
    db $00                                                               ;B4818B;
    db "sf1_00 "                                                         ;B4818C;

EnemySets_LandingSite_0_1_2:
    dw EnemyHeaders_ShipTop                                              ;B48193;
    dw $0002                                                             ;B48195;
    dw EnemyHeaders_ShipBottomEntrance                                   ;B48197;
    dw $0007,$FFFF                                                       ;B48199;
    db $00                                                               ;B4819D;
    db "SF2_11 "                                                         ;B4819E;

EnemySets_CrateriaSuper:
    dw EnemyHeaders_Boyon                                                ;B481A5;
    dw $0001                                                             ;B481A7;
    dw EnemyHeaders_YappingMaw                                           ;B481A9;
    dw $0002,$FFFF                                                       ;B481AB;
    db $00                                                               ;B481AF;
    db "SF1_19 "                                                         ;B481B0;

UNUSED_EnemySets_B481B7:
    dw $FFFF                                                             ;B481B7;
    db $00                                                               ;B481B9;
    db "SF1_18 "                                                         ;B481BA;

EnemySets_PreBowling:
    dw EnemyHeaders_HZoomer                                              ;B481C1;
    dw $0001                                                             ;B481C3;
    dw EnemyHeaders_Sova                                                 ;B481C5;
    dw $0001,$FFFF                                                       ;B481C7;
    db $00                                                               ;B481CB;
    db "sf2_00A"                                                         ;B481CC;

EnemySets_Climb_1:
    dw EnemyHeaders_PirateGreyWall                                       ;B481D3;
    dw $0001,$FFFF                                                       ;B481D5;
    db $00                                                               ;B481D9;
    db "SF1_07 "                                                         ;B481DA;

EnemySets_BowlingAlleyPath:
    dw EnemyHeaders_Waver                                                ;B481E1;
    dw $0001                                                             ;B481E3;
    dw EnemyHeaders_Choot                                                ;B481E5;
    dw $0007,$FFFF                                                       ;B481E7;
    db $00                                                               ;B481EB;
    db "SF1_16 "                                                         ;B481EC;

EnemySets_RedBinstarElev:
    dw $FFFF                                                             ;B481F3;
    db $00                                                               ;B481F5;
    db "SF1_17 "                                                         ;B481F6;

EnemySets_GauntletETank:
    dw EnemyHeaders_YappingMaw                                           ;B481FD;
    dw $0001                                                             ;B481FF;
    dw EnemyHeaders_Zebbo                                                ;B48201;
    dw $0002,$FFFF                                                       ;B48203;
    db $00                                                               ;B48207;
    db "sf2_01 "                                                         ;B48208;

EnemySets_Pit_0:
    dw EnemyHeaders_Sbug                                                 ;B4820F;
    dw $0007                                                             ;B48211;
    dw EnemyHeaders_FaceBlock                                            ;B48213;
    dw $0007,$FFFF                                                       ;B48215;
    db $00                                                               ;B48219;
    db "SF1_12 "                                                         ;B4821A;

EnemySets_CrabMaze:
    dw EnemyHeaders_Sciser                                               ;B48221;
    dw $0007                                                             ;B48223;
    dw EnemyHeaders_Puyo                                                 ;B48225;
    dw $0007,$FFFF                                                       ;B48227;
    db $00                                                               ;B4822B;
    db "SF1_14 "                                                         ;B4822C;

EnemySets_CrateriaTube:
    dw $FFFF                                                             ;B48233;
    db $00                                                               ;B48235;
    db "SF1_11 "                                                         ;B48236;

EnemySets_ForgottenHighwayKagos:
    dw EnemyHeaders_Kago                                                 ;B4823D;
    dw $0001,$FFFF                                                       ;B4823F;
    db $00                                                               ;B48243;
    db "sf2_02 "                                                         ;B48244;

EnemySets_ElevToBlueBrinstar:
    dw $FFFF                                                             ;B4824B;
    db $00                                                               ;B4824D;
    db "SF1_09 "                                                         ;B4824E;

EnemySets_ForgottenHighwayElev:
    dw $FFFF                                                             ;B48255;
    db $00                                                               ;B48257;
    db "sf2_05 "                                                         ;B48258;

EnemySets_PreMapFlyway:
    dw EnemyHeaders_Mellow                                               ;B4825F;
    dw $0001                                                             ;B48261;
    dw EnemyHeaders_Rio                                                  ;B48263;
    dw $0002,$FFFF                                                       ;B48265;
    db $00                                                               ;B48269;
    db "sf2_08 "                                                         ;B4826A;

EnemySets_LowerMushrooms:
    dw EnemyHeaders_Kago                                                 ;B48271;
    dw $0002                                                             ;B48273;
    dw EnemyHeaders_MZoomer                                              ;B48275;
    dw $0003,$FFFF                                                       ;B48277;
    db $00                                                               ;B4827B;
    db "sf1_00 "                                                         ;B4827C;

EnemySets_LandingSite_3:
    dw EnemyHeaders_ShipTop                                              ;B48283;
    dw $0002                                                             ;B48285;
    dw EnemyHeaders_ShipBottomEntrance                                   ;B48287;
    dw $0007,$FFFF                                                       ;B48289;
    db $00                                                               ;B4828D;
    db "sf1_02 "                                                         ;B4828E;

EnemySets_Parlor_2:
    dw EnemyHeaders_Sbug                                                 ;B48295;
    dw $0007,$FFFF                                                       ;B48297;
    db $00                                                               ;B4829B;
    db "sf2_03 "                                                         ;B4829C;

EnemySets_BombTorizo_2:
    dw EnemyHeaders_EtecoonEscape                                        ;B482A3;
    dw $0001                                                             ;B482A5;
    dw EnemyHeaders_DachoraEscape                                        ;B482A7;
    dw $0007,$FFFF                                                       ;B482A9;
    db $00                                                               ;B482AD;
    db "sf2_04 "                                                         ;B482AE;

EnemySets_Flyway_2:
    dw $FFFF                                                             ;B482B5;
    db $00                                                               ;B482B7;
    db "SF1_08 "                                                         ;B482B8;

EnemySets_CrateriaKihunter:
    dw EnemyHeaders_KihunterGreen                                        ;B482BF;
    dw $0001                                                             ;B482C1;
    dw EnemyHeaders_Sciser                                               ;B482C3;
    dw $0002                                                             ;B482C5;
    dw EnemyHeaders_Zero                                                 ;B482C7;
    dw $0002,$FFFF                                                       ;B482C9;
    db $00                                                               ;B482CD;
    db "bl1_02 "                                                         ;B482CE;

EnemySets_BrinstarPreMap:
    dw EnemyHeaders_Sidehopper                                           ;B482D5;
    dw $0001                                                             ;B482D7;
    dw EnemyHeaders_Zeela                                                ;B482D9;
    dw $0002,$FFFF                                                       ;B482DB;
    db $00                                                               ;B482DF;
    db "bl1_05 "                                                         ;B482E0;

EnemySets_GreenBrinstarMap:
    dw $FFFF                                                             ;B482E7;
    db $00                                                               ;B482E9;
    db "bl1_07 "                                                         ;B482EA;

EnemySets_GreenBrinstarMissileRefill:
    dw $FFFF                                                             ;B482F1;
    db $00                                                               ;B482F3;
    db "BL1_10 "                                                         ;B482F4;

EnemySets_SporeSpawnKihunters:
    dw EnemyHeaders_KihunterGreen                                        ;B482FB;
    dw $0007,$FFFF                                                       ;B482FD;
    db $00                                                               ;B48301;
    db "BL1_20 "                                                         ;B48302;

EnemySets_EtecoonSuper:
    dw $FFFF                                                             ;B48309;
    db $00                                                               ;B4830B;
    db "BL1_21 "                                                         ;B4830C;

EnemySets_DachoraEnergyRefill:
    dw EnemyHeaders_FaceBlock                                            ;B48313;
    dw $0001,$FFFF                                                       ;B48315;
    db $00                                                               ;B48319;
    db "BL1_22 "                                                         ;B4831A;

EnemySets_SporeSpawnFarming:
    dw EnemyHeaders_Zeb                                                  ;B48321;
    dw $0001                                                             ;B48323;
    dw EnemyHeaders_Zeela                                                ;B48325;
    dw $0002,$FFFF                                                       ;B48327;
    db $00                                                               ;B4832B;
    db "BL2_19 "                                                         ;B4832C;

EnemySets_Statues:
    dw EnemyHeaders_TourianStatue                                        ;B48333;
    dw $0001                                                             ;B48335;
    dw EnemyHeaders_TourianStatueGhost                                   ;B48337;
    dw $D003,$FFFF                                                       ;B48339;
    db $00                                                               ;B4833D;
    db "BL1_26 "                                                         ;B4833E;

EnemySets_HopperETank:
    dw $FFFF                                                             ;B48345;
    db $00                                                               ;B48347;
    db "BL2_05 "                                                         ;B48348;

EnemySets_BetaPowerBomb:
    dw EnemyHeaders_YappingMaw                                           ;B4834F;
    dw $0001                                                             ;B48351;
    dw EnemyHeaders_SidehopperLarge                                      ;B48353;
    dw $0002,$FFFF                                                       ;B48355;
    db $00                                                               ;B48359;
    db "BL1_23 "                                                         ;B4835A;

EnemySets_WaterwayETank:
    dw EnemyHeaders_Skultera                                             ;B48361;
    dw $0001                                                             ;B48363;
    dw EnemyHeaders_Puyo                                                 ;B48365;
    dw $0002                                                             ;B48367;
    dw EnemyHeaders_Zero                                                 ;B48369;
    dw $0003,$FFFF                                                       ;B4836B;
    db $00                                                               ;B4836F;
    db "BL1_15A"                                                         ;B48370;

EnemySets_ConstructionZone_1:
    dw EnemyHeaders_Zoomer                                               ;B48377;
    dw $0001                                                             ;B48379;
    dw EnemyHeaders_FaceBlock                                            ;B4837B;
    dw $0002,$FFFF                                                       ;B4837D;
    db $00                                                               ;B48381;
    db "BL1_16A"                                                         ;B48382;

EnemySets_BlueBrinstarETank_1:
    dw EnemyHeaders_FaceBlock                                            ;B48389;
    dw $0001                                                             ;B4838B;
    dw EnemyHeaders_Zoomer                                               ;B4838D;
    dw $0002                                                             ;B4838F;
    dw EnemyHeaders_Skree                                                ;B48391;
    dw $0003                                                             ;B48393;
    dw EnemyHeaders_Rio                                                  ;B48395;
    dw $0007,$FFFF                                                       ;B48397;
    db $00                                                               ;B4839B;
    db "BL1_17 "                                                         ;B4839C;

EnemySets_NoobBridge:
    dw EnemyHeaders_Cacatac                                              ;B483A3;
    dw $0001                                                             ;B483A5;
    dw EnemyHeaders_Zeela                                                ;B483A7;
    dw $0002,$FFFF                                                       ;B483A9;
    db $00                                                               ;B483AD;
    db "BL1_14A"                                                         ;B483AE;

EnemySets_MorphBall_1:
    dw EnemyHeaders_SidehopperLarge                                      ;B483B5;
    dw $0002                                                             ;B483B7;
    dw EnemyHeaders_FaceBlock                                            ;B483B9;
    dw $0007,$FFFF                                                       ;B483BB;
    db $00                                                               ;B483BF;
    db "BL2_22 "                                                         ;B483C0;

EnemySets_WarehouseSave:
    dw $FFFF                                                             ;B483C7;
    db $00                                                               ;B483C9;
    db "BL1_14 "                                                         ;B483CA;

EnemySets_MorphBall_0:
    dw EnemyHeaders_Eye                                                  ;B483D1;
    dw $0007                                                             ;B483D3;
    dw EnemyHeaders_FaceBlock                                            ;B483D5;
    dw $0007,$FFFF                                                       ;B483D7;
    db $00                                                               ;B483DB;
    db "BL2_10 "                                                         ;B483DC;

EnemySets_WarehouseZeela:
    dw EnemyHeaders_Zeela                                                ;B483E3;
    dw $0001,$FFFF                                                       ;B483E5;
    db $00                                                               ;B483E9;
    db "BL2_00 "                                                         ;B483EA;

EnemySets_RedTower:
    dw EnemyHeaders_Ripper                                               ;B483F1;
    dw $0001                                                             ;B483F3;
    dw EnemyHeaders_Beetom                                               ;B483F5;
    dw $0002                                                             ;B483F7;
    dw EnemyHeaders_Geega                                                ;B483F9;
    dw $0003,$FFFF                                                       ;B483FB;
    db $00                                                               ;B483FF;
    db "bl1_28 "                                                         ;B48400;

EnemySets_BlueBrinstarBoulders:
    dw EnemyHeaders_Boulder                                              ;B48407;
    dw $0001,$FFFF                                                       ;B48409;
    db $00                                                               ;B4840D;
    db "bl1_29 "                                                         ;B4840E;

EnemySets_BillyMays:
    dw $FFFF                                                             ;B48415;
    db $00                                                               ;B48417;
    db "bl1_27 "                                                         ;B48418;

EnemySets_BigPinkSaveRoom:
    dw $FFFF                                                             ;B4841F;
    db $00                                                               ;B48421;
    db "BL1_09 "                                                         ;B48422;

EnemySets_BigPink:
    dw EnemyHeaders_Rio                                                  ;B48429;
    dw $0001                                                             ;B4842B;
    dw EnemyHeaders_Sidehopper                                           ;B4842D;
    dw $0002                                                             ;B4842F;
    dw EnemyHeaders_Zeb                                                  ;B48431;
    dw $0003,$FFFF                                                       ;B48433;
    db $00                                                               ;B48437;
    db "bl1_31 "                                                         ;B48438;

EnemySets_EtecoonSave:
    dw $FFFF                                                             ;B4843F;
    db $00                                                               ;B48441;
    db "BL2_08 "                                                         ;B48442;

EnemySets_BelowSpazer:
    dw EnemyHeaders_YappingMaw                                           ;B48449;
    dw $0001                                                             ;B4844B;
    dw EnemyHeaders_Cacatac                                              ;B4844D;
    dw $0002,$FFFF                                                       ;B4844F;
    db $00                                                               ;B48453;
    db "bl1_30 "                                                         ;B48454;

EnemySets_GreenBrinstarSave:
    dw $FFFF                                                             ;B4845B;
    db $00                                                               ;B4845D;
    db "BL2_09 "                                                         ;B4845E;

EnemySets_Spazer:
    dw $FFFF                                                             ;B48465;
    db $00                                                               ;B48467;
    db "BL1_12 "                                                         ;B48468;

EnemySets_PinkBrinstarPowerBombs:
    dw EnemyHeaders_ShutterShootable                                     ;B4846F;
    dw $0001                                                             ;B48471;
    dw EnemyHeaders_Metaree                                              ;B48473;
    dw $0001                                                             ;B48475;
    dw EnemyHeaders_SidehopperLarge                                      ;B48477;
    dw $0002,$FFFF                                                       ;B48479;
    db $00                                                               ;B4847D;
    db "BL2_17 "                                                         ;B4847E;

EnemySets_RedTowerRefill:
    dw $FFFF                                                             ;B48485;
    db $00                                                               ;B48487;
    db "BL2_18 "                                                         ;B48488;

EnemySets_KraidRefill:
    dw $FFFF                                                             ;B4848F;
    db $00                                                               ;B48491;
    db "BL2_21 "                                                         ;B48492;

EnemySets_VariaSuit:
    dw $FFFF                                                             ;B48499;
    db $00                                                               ;B4849B;
    db "BL2_23 "                                                         ;B4849C;

EnemySets_RedBrinstarSave:
    dw $FFFF                                                             ;B484A3;
    db $00                                                               ;B484A5;
    db "BL1_24a"                                                         ;B484A6;

UNUSED_EnemySets_B484AD:
    dw $FFFF                                                             ;B484AD;
    db $00                                                               ;B484AF;
    db "BL1_16 "                                                         ;B484B0;

EnemySets_BlueBrinstarETank_0:
    dw EnemyHeaders_Eye                                                  ;B484B7;
    dw $0007                                                             ;B484B9;
    dw EnemyHeaders_FaceBlock                                            ;B484BB;
    dw $0007,$FFFF                                                       ;B484BD;
    db $00                                                               ;B484C1;
    db "bl1_06 "                                                         ;B484C2;

EnemySets_GreenBrinstarFirefleas:
    dw EnemyHeaders_Fireflea                                             ;B484C9;
    dw $0002,$FFFF                                                       ;B484CB;
    db $00                                                               ;B484CF;
    db "BL1_18 "                                                         ;B484D0;

EnemySets_GreenBrinstarBeetoms:
    dw EnemyHeaders_Beetom                                               ;B484D7;
    dw $0001,$FFFF                                                       ;B484D9;
    db $00                                                               ;B484DD;
    db "BL1_19 "                                                         ;B484DE;

EnemySets_EtecoonETank:
    dw EnemyHeaders_Zebbo                                                ;B484E5;
    dw $0001                                                             ;B484E7;
    dw EnemyHeaders_Beetom                                               ;B484E9;
    dw $0002,$FFFF                                                       ;B484EB;
    db $00                                                               ;B484EF;
    db "BL1_25 "                                                         ;B484F0;

EnemySets_PinkBrinstarHoppers:
    dw EnemyHeaders_SidehopperLarge                                      ;B484F7;
    dw $0001                                                             ;B484F9;
    dw EnemyHeaders_Sidehopper                                           ;B484FB;
    dw $0002                                                             ;B484FD;
    dw EnemyHeaders_ShutterShootable                                     ;B484FF;
    dw $0003,$FFFF                                                       ;B48501;
    db $00                                                               ;B48505;
    db "BL2_11 "                                                         ;B48506;

EnemySets_WarehouseETank:
    dw EnemyHeaders_Reflec                                               ;B4850D;
    dw $0001                                                             ;B4850F;
    dw EnemyHeaders_Beetom                                               ;B48511;
    dw $0002,$FFFF                                                       ;B48513;
    db $00                                                               ;B48517;
    db "BL2_20a"                                                         ;B48518;

UNUSED_EnemySets_B4851F:
    dw $FFFF                                                             ;B4851F;
    db $00                                                               ;B48521;
    db "BL2_20 "                                                         ;B48522;

EnemySets_WarehouseEntrance:
    dw $FFFF                                                             ;B48529;
    db $00                                                               ;B4852B;
    db "BL2_12 "                                                         ;B4852C;

EnemySets_WarehouseKihunter:
    dw EnemyHeaders_KihunterGreen                                        ;B48533;
    dw $0001,$FFFF                                                       ;B48535;
    db $00                                                               ;B48539;
    db "bl1_00 "                                                         ;B4853A;

EnemySets_GreenBrinstarMainShaft:
    dw EnemyHeaders_Etecoon                                              ;B48541;
    dw $0001                                                             ;B48543;
    dw EnemyHeaders_Zeela                                                ;B48545;
    dw $0002                                                             ;B48547;
    dw EnemyHeaders_Ripper2                                              ;B48549;
    dw $0003,$FFFF                                                       ;B4854B;
    db $00                                                               ;B4854F;
    db "bl1_01 "                                                         ;B48550;

EnemySets_SporeSpawnSuper:
    dw EnemyHeaders_Zeb                                                  ;B48557;
    dw $0001,$FFFF                                                       ;B48559;
    db $00                                                               ;B4855D;
    db "bl1_03 "                                                         ;B4855E;

EnemySets_EarlySupers:
    dw EnemyHeaders_Sidehopper                                           ;B48565;
    dw $0001                                                             ;B48567;
    dw EnemyHeaders_ShutterGrowing                                       ;B48569;
    dw $0002                                                             ;B4856B;
    dw EnemyHeaders_Waver                                                ;B4856D;
    dw $0003                                                             ;B4856F;
    dw EnemyHeaders_Zeb                                                  ;B48571;
    dw $0007,$FFFF                                                       ;B48573;
    db $00                                                               ;B48577;
    db "BL2_01 "                                                         ;B48578;

EnemySets_RedBrinstarFirefleas:
    dw EnemyHeaders_Fireflea                                             ;B4857F;
    dw $0001                                                             ;B48581;
    dw EnemyHeaders_Waver                                                ;B48583;
    dw $0002                                                             ;B48585;
    dw EnemyHeaders_YappingMaw                                           ;B48587;
    dw $0003,$FFFF                                                       ;B48589;
    db $00                                                               ;B4858D;
    db "BL1_15 "                                                         ;B4858E;

EnemySets_ConstructionZone_0:
    dw EnemyHeaders_Sbug                                                 ;B48595;
    dw $0007                                                             ;B48597;
    dw EnemyHeaders_FaceBlock                                            ;B48599;
    dw $0007,$FFFF                                                       ;B4859B;
    db $00                                                               ;B4859F;
    db "BL1_13 "                                                         ;B485A0;

EnemySets_GreenHillZone:
    dw EnemyHeaders_Sidehopper                                           ;B485A7;
    dw $0001                                                             ;B485A9;
    dw EnemyHeaders_Geega                                                ;B485AB;
    dw $0002,$FFFF                                                       ;B485AD;
    db $00                                                               ;B485B1;
    db "BL1_08 "                                                         ;B485B2;

EnemySets_Dachora:
    dw EnemyHeaders_Zeela                                                ;B485B9;
    dw $0001                                                             ;B485BB;
    dw EnemyHeaders_Metaree                                              ;B485BD;
    dw $0002                                                             ;B485BF;
    dw EnemyHeaders_Rio                                                  ;B485C1;
    dw $0003                                                             ;B485C3;
    dw EnemyHeaders_Dachora                                              ;B485C5;
    dw $0007,$FFFF                                                       ;B485C7;
    db $00                                                               ;B485CB;
    db "BL2_03 "                                                         ;B485CC;

EnemySets_Hellway:
    dw EnemyHeaders_Zeela                                                ;B485D3;
    dw $0001                                                             ;B485D5;
    dw EnemyHeaders_Zebbo                                                ;B485D7;
    dw $0002,$FFFF                                                       ;B485D9;
    db $00                                                               ;B485DD;
    db "BL1_24 "                                                         ;B485DE;

EnemySets_FirstMissile:
    dw $FFFF                                                             ;B485E5;
    db $00                                                               ;B485E7;
    db "BL2_15 "                                                         ;B485E8;

EnemySets_Kraid:
    dw EnemyHeaders_Kraid                                                ;B485EF;
    dw $0007,$FFFF                                                       ;B485F1;
    db $00                                                               ;B485F5;
    db "bl1_04 "                                                         ;B485F6;

EnemySets_BrinstarReserveTank:
    dw $FFFF                                                             ;B485FD;
    db $00                                                               ;B485FF;
    db "BL2_02 "                                                         ;B48600;

EnemySets_XrayScope:
    dw EnemyHeaders_ShutterShootable                                     ;B48607;
    dw $0001,$FFFF                                                       ;B48609;
    db $00                                                               ;B4860D;
    db "BL2_16 "                                                         ;B4860E;

EnemySets_StatuesHallway:
    dw $FFFF                                                             ;B48615;
    db $00                                                               ;B48617;
    db "BL2_06 "                                                         ;B48618;

EnemySets_AlphaPowerBomb:
    dw EnemyHeaders_Boyon                                                ;B4861F;
    dw $0001,$FFFF                                                       ;B48621;
    db $00                                                               ;B48625;
    db "BL2_14 "                                                         ;B48626;

EnemySets_KraidEyeDoor:
    dw EnemyHeaders_Zeb                                                  ;B4862D;
    dw $0001                                                             ;B4862F;
    dw EnemyHeaders_Sbug                                                 ;B48631;
    dw $0002,$FFFF                                                       ;B48633;
    db $00                                                               ;B48637;
    db "BL2_04 "                                                         ;B48638;

EnemySets_Caterpillar:
    dw EnemyHeaders_Zero                                                 ;B4863F;
    dw $0002                                                             ;B48641;
    dw EnemyHeaders_Cacatac                                              ;B48643;
    dw $0003,$FFFF                                                       ;B48645;
    db $00                                                               ;B48649;
    db "BL2_13 "                                                         ;B4864A;

EnemySets_MiniKraid:
    dw EnemyHeaders_PirateGreenWalking                                   ;B48651;
    dw $0001                                                             ;B48653;
    dw EnemyHeaders_MiniKraid                                            ;B48655;
    dw $0003,$FFFF                                                       ;B48657;
    db $00                                                               ;B4865B;
    db "BL1_11 "                                                         ;B4865C;

EnemySets_SporeSpawn:
    dw EnemyHeaders_SporeSpawn                                           ;B48663;
    dw $0001,$FFFF                                                       ;B48665;
    db $00                                                               ;B48669;
    db "BL2_07 "                                                         ;B4866A;

EnemySets_SkreeBoost:
    dw EnemyHeaders_Skree                                                ;B48671;
    dw $0001                                                             ;B48673;
    dw EnemyHeaders_Boyon                                                ;B48675;
    dw $0007,$FFFF                                                       ;B48677;
    db $00                                                               ;B4867B;
    db "NO1_19 "                                                         ;B4867C;

EnemySets_GrappleTutorial3:
    dw EnemyHeaders_Gamet                                                ;B48683;
    dw $0001                                                             ;B48685;
    dw EnemyHeaders_Puyo                                                 ;B48687;
    dw $0002,$FFFF                                                       ;B48689;
    db $00                                                               ;B4868D;
    db "NO1_17 "                                                         ;B4868E;

EnemySets_PostCrocShaft:
    dw EnemyHeaders_Viola                                                ;B48695;
    dw $0001,$FFFF                                                       ;B48697;
    db $00                                                               ;B4869B;
    db "NO2_18 "                                                         ;B4869C;

EnemySets_MetalPirates:
    dw EnemyHeaders_PirateGoldNinja                                      ;B486A3;
    dw $0001,$FFFF                                                       ;B486A5;
    db $00                                                               ;B486A9;
    db "NO2_00 "                                                         ;B486AA;

EnemySets_AcidStatue:
    dw EnemyHeaders_Chozo                                                ;B486B1;
    dw $0001                                                             ;B486B3;
    dw EnemyHeaders_Magdollite                                           ;B486B5;
    dw $0003                                                             ;B486B7;
    dw EnemyHeaders_Holtz                                                ;B486B9;
    dw $0007,$FFFF                                                       ;B486BB;
    db $00                                                               ;B486BF;
    db "NO1_44 "                                                         ;B486C0;

EnemySets_PurpleFarming:
    dw EnemyHeaders_Gamet                                                ;B486C7;
    dw $0001,$FFFF                                                       ;B486C9;
    db $00                                                               ;B486CD;
    db "NO1_04 "                                                         ;B486CE;

EnemySets_IceBeamGate:
    dw EnemyHeaders_ShutterGrowing                                       ;B486D5;
    dw $0001                                                             ;B486D7;
    dw EnemyHeaders_Dessgeega                                            ;B486D9;
    dw $0002                                                             ;B486DB;
    dw EnemyHeaders_Mella                                                ;B486DD;
    dw $0003                                                             ;B486DF;
    dw EnemyHeaders_Sova                                                 ;B486E1;
    dw $0007,$FFFF                                                       ;B486E3;
    db $00                                                               ;B486E7;
    db "NO1_42 "                                                         ;B486E8;

EnemySets_SpikyAcidSnakesTunnel:
    dw EnemyHeaders_YappingMaw                                           ;B486EF;
    dw $0001,$FFFF                                                       ;B486F1;
    db $00                                                               ;B486F5;
    db "NO2_16 "                                                         ;B486F6;

EnemySets_RedKihunterShaft:
    dw EnemyHeaders_KihunterRed                                          ;B486FD;
    dw $0001                                                             ;B486FF;
    dw EnemyHeaders_Reflec                                               ;B48701;
    dw $0002,$FFFF                                                       ;B48703;
    db $00                                                               ;B48707;
    db "NO2_03 "                                                         ;B48708;

EnemySets_FastRipper:
    dw EnemyHeaders_Ripper2                                              ;B4870F;
    dw $0001,$FFFF                                                       ;B48711;
    db $00                                                               ;B48715;
    db "NO1_31 "                                                         ;B48716;

EnemySets_WaveBeam:
    dw $FFFF                                                             ;B4871D;
    db $00                                                               ;B4871F;
    db "NO2_07 "                                                         ;B48720;

EnemySets_FastPillarsSetup:
    dw EnemyHeaders_PirateGoldWall                                       ;B48727;
    dw $0001                                                             ;B48729;
    dw EnemyHeaders_PirateGoldWalking                                    ;B4872B;
    dw $0002                                                             ;B4872D;
    dw EnemyHeaders_Viola                                                ;B4872F;
    dw $0003,$FFFF                                                       ;B48731;
    db $00                                                               ;B48735;
    db "NO1_38 "                                                         ;B48736;

EnemySets_LowerNorfairElev:
    dw $FFFF                                                             ;B4873D;
    db $00                                                               ;B4873F;
    db "NO2_23 "                                                         ;B48740;

EnemySets_LNSave:
    dw $FFFF                                                             ;B48747;
    db $00                                                               ;B48749;
    db "NO1_43 "                                                         ;B4874A;

EnemySets_UpperNorfairRefill:
    dw $FFFF                                                             ;B48751;
    db $00                                                               ;B48753;
    db "NO1_46 "                                                         ;B48754;

EnemySets_NorfairMap:
    dw $FFFF                                                             ;B4875B;
    db $00                                                               ;B4875D;
    db "NO2_09 "                                                         ;B4875E;

EnemySets_MickeyMouse:
    dw EnemyHeaders_DessgeegaLarge                                       ;B48765;
    dw $0001                                                             ;B48767;
    dw EnemyHeaders_Multiviola                                           ;B48769;
    dw $0002,$FFFF                                                       ;B4876B;
    db $00                                                               ;B4876F;
    db "NO2_04 "                                                         ;B48770;

EnemySets_GTEnergyRefill:
    dw $FFFF                                                             ;B48777;
    db $00                                                               ;B48779;
    db "NO2_05 "                                                         ;B4877A;

EnemySets_Ridley:
    dw EnemyHeaders_Ridley                                               ;B48781;
    dw $0001                                                             ;B48783;
    dw EnemyHeaders_RidleyExplosion                                      ;B48785;
    dw $E001,$FFFF                                                       ;B48787;
    db $00                                                               ;B4878B;
    db "NO1_16 "                                                         ;B4878C;

EnemySets_PostCrocPowerBombs:
    dw $FFFF                                                             ;B48793;
    db $00                                                               ;B48795;
    db "NO1_06 "                                                         ;B48796;

EnemySets_IceBeam:
    dw $FFFF                                                             ;B4879D;
    db $00                                                               ;B4879F;
    db "NO1_11 "                                                         ;B487A0;

EnemySets_HiJumpBoots:
    dw $FFFF                                                             ;B487A7;
    db $00                                                               ;B487A9;
    db "NO1_15 "                                                         ;B487AA;

EnemySets_PostCrocSave:
    dw $FFFF                                                             ;B487B1;
    db $00                                                               ;B487B3;
    db "NO1_48 "                                                         ;B487B4;

EnemySets_FrogSpeedway:
    dw EnemyHeaders_Beetom                                               ;B487BB;
    dw $0001,$FFFF                                                       ;B487BD;
    db $00                                                               ;B487C1;
    db "NO1_40 "                                                         ;B487C2;

EnemySets_RisingTide:
    dw EnemyHeaders_Squeept                                              ;B487C9;
    dw $0001                                                             ;B487CB;
    dw EnemyHeaders_Sova                                                 ;B487CD;
    dw $0002                                                             ;B487CF;
    dw EnemyHeaders_Dragon                                               ;B487D1;
    dw $0003,$FFFF                                                       ;B487D3;
    db $00                                                               ;B487D7;
    db "NO1_14 "                                                         ;B487D8;

EnemySets_PostCrocFarming:
    dw EnemyHeaders_Gamet                                                ;B487DF;
    dw $0001                                                             ;B487E1;
    dw EnemyHeaders_GRipper                                              ;B487E3;
    dw $0002                                                             ;B487E5;
    dw EnemyHeaders_Kamer2                                               ;B487E7;
    dw $0003,$FFFF                                                       ;B487E9;
    db $00                                                               ;B487ED;
    db "NO2_12 "                                                         ;B487EE;

EnemySets_WorstRoomInTheGame:
    dw EnemyHeaders_Namihe                                               ;B487F5;
    dw $0001                                                             ;B487F7;
    dw EnemyHeaders_PirateGoldWall                                       ;B487F9;
    dw $0002                                                             ;B487FB;
    dw EnemyHeaders_PirateGoldWalking                                    ;B487FD;
    dw $0003,$FFFF                                                       ;B487FF;
    db $00                                                               ;B48803;
    db "NO1_30 "                                                         ;B48804;

EnemySets_DoubleChamber:
    dw EnemyHeaders_Fune                                                 ;B4880B;
    dw $0001                                                             ;B4880D;
    dw EnemyHeaders_Kamer                                                ;B4880F;
    dw $0002                                                             ;B48811;
    dw EnemyHeaders_Kago                                                 ;B48813;
    dw $0003                                                             ;B48815;
    dw EnemyHeaders_GRipper                                              ;B48817;
    dw $0007,$FFFF                                                       ;B48819;
    db $00                                                               ;B4881D;
    db "NO1_23 "                                                         ;B4881E;

EnemySets_GrappleBeam:
    dw EnemyHeaders_Multiviola                                           ;B48825;
    dw $0001,$FFFF                                                       ;B48827;
    db $00                                                               ;B4882B;
    db "NO1_49 "                                                         ;B4882C;

EnemySets_RedPirateShaft:
    dw EnemyHeaders_PirateRedWalking                                     ;B48833;
    dw $0001                                                             ;B48835;
    dw EnemyHeaders_MZoomer                                              ;B48837;
    dw $0003,$FFFF                                                       ;B48839;
    db $00                                                               ;B4883D;
    db "NO1_09 "                                                         ;B4883E;

EnemySets_CrocomireSpeedway:
    dw EnemyHeaders_PirateRedWalking                                     ;B48845;
    dw $0001                                                             ;B48847;
    dw EnemyHeaders_Multiviola                                           ;B48849;
    dw $0002                                                             ;B4884B;
    dw EnemyHeaders_Cacatac                                              ;B4884D;
    dw $0003                                                             ;B4884F;
    dw EnemyHeaders_Sova                                                 ;B48851;
    dw $0003,$FFFF                                                       ;B48853;
    db $00                                                               ;B48857;
    db "NO2_11 "                                                         ;B48858;

EnemySets_Plowerhouse:
    dw EnemyHeaders_Zebbo                                                ;B4885F;
    dw $0001                                                             ;B48861;
    dw EnemyHeaders_Holtz                                                ;B48863;
    dw $0007,$FFFF                                                       ;B48865;
    db $00                                                               ;B48869;
    db "NO2_22 "                                                         ;B4886A;

EnemySets_LNFireflea:
    dw EnemyHeaders_Fireflea                                             ;B48871;
    dw $0001                                                             ;B48873;
    dw EnemyHeaders_Boulder                                              ;B48875;
    dw $0002                                                             ;B48877;
    dw EnemyHeaders_Fune                                                 ;B48879;
    dw $0003,$FFFF                                                       ;B4887B;
    db $00                                                               ;B4887F;
    db "NO1_35 "                                                         ;B48880;

EnemySets_MagdolliteTunnel:
    dw EnemyHeaders_Multiviola                                           ;B48887;
    dw $0001                                                             ;B48889;
    dw EnemyHeaders_Magdollite                                           ;B4888B;
    dw $0007,$FFFF                                                       ;B4888D;
    db $00                                                               ;B48891;
    db "NO2_08 "                                                         ;B48892;

UNUSED_EnemySets_State8FB3EE_B48899:
    dw $FFFF                                                             ;B48899;
    db $00                                                               ;B4889B;
    db "NO1_37 "                                                         ;B4889C;

EnemySets_LavaDive:
    dw EnemyHeaders_Namihe                                               ;B488A3;
    dw $0001,$FFFF                                                       ;B488A5;
    db $00                                                               ;B488A9;
    db "NO2_10 "                                                         ;B488AA;

EnemySets_Pillar:
    dw EnemyHeaders_Puromi                                               ;B488B1;
    dw $0007,$FFFF                                                       ;B488B3;
    db $00                                                               ;B488B7;
    db "NO1_12 "                                                         ;B488B8;

EnemySets_CrocomireEscape:
    dw EnemyHeaders_Dragon                                               ;B488BF;
    dw $0001                                                             ;B488C1;
    dw EnemyHeaders_Geruta                                               ;B488C3;
    dw $0002,$FFFF                                                       ;B488C5;
    db $00                                                               ;B488C9;
    db "NO2_14 "                                                         ;B488CA;

EnemySets_LNSpringBallMaze:
    dw EnemyHeaders_Alcoon                                               ;B488D1;
    dw $0001,$FFFF                                                       ;B488D3;
    db $00                                                               ;B488D7;
    db "NO2_15 "                                                         ;B488D8;

EnemySets_LNEscapePowerBombs:
    dw $FFFF                                                             ;B488DF;
    db $00                                                               ;B488E1;
    db "NO1_36 "                                                         ;B488E2;

EnemySets_PurpleShaft:
    dw $FFFF                                                             ;B488E9;
    db $00                                                               ;B488EB;
    db "NO2_20 "                                                         ;B488EC;

EnemySets_RidleyETank:
    dw $FFFF                                                             ;B488F3;
    db $00                                                               ;B488F5;
    db "NO2_21 "                                                         ;B488F6;

EnemySets_ScrewAttack:
    dw $FFFF                                                             ;B488FD;
    db $00                                                               ;B488FF;
    db "NO1_25 "                                                         ;B48900;

EnemySets_GreenBubblesMissiles:
    dw EnemyHeaders_ShutterShootable                                     ;B48907;
    dw $0007                                                             ;B48909;
    dw EnemyHeaders_Sova                                                 ;B4890B;
    dw $0002                                                             ;B4890D;
    dw EnemyHeaders_Geruta                                               ;B4890F;
    dw $0003,$FFFF                                                       ;B48911;
    db $00                                                               ;B48915;
    db "NO2_13 "                                                         ;B48916;

EnemySets_Amphitheatre:
    dw EnemyHeaders_PirateGoldWalking                                    ;B4891D;
    dw $0007,$FFFF                                                       ;B4891F;
    db $00                                                               ;B48923;
    db "NO1_02 "                                                         ;B48924;

EnemySets_CathedralEntrance:
    dw EnemyHeaders_Sova                                                 ;B4892B;
    dw $0001                                                             ;B4892D;
    dw EnemyHeaders_Dessgeega                                            ;B4892F;
    dw $0002,$FFFF                                                       ;B48931;
    db $00                                                               ;B48935;
    db "NO2_01 "                                                         ;B48936;

EnemySets_MainHall:
    dw EnemyHeaders_Hibashi                                              ;B4893D;
    dw $0001                                                             ;B4893F;
    dw EnemyHeaders_Dragon                                               ;B48941;
    dw $0007                                                             ;B48943;
    dw EnemyHeaders_Gamet                                                ;B48945;
    dw $0007,$FFFF                                                       ;B48947;
    db $00                                                               ;B4894B;
    db "NO1_20 "                                                         ;B4894C;

EnemySets_PostCrocJump:
    dw EnemyHeaders_Mella                                                ;B48953;
    dw $0001                                                             ;B48955;
    dw EnemyHeaders_GRipper                                              ;B48957;
    dw $0002                                                             ;B48959;
    dw EnemyHeaders_Kamer2                                               ;B4895B;
    dw $0003,$FFFF                                                       ;B4895D;
    db $00                                                               ;B48961;
    db "NO1_50 "                                                         ;B48962;

EnemySets_FrogSave:
    dw $FFFF                                                             ;B48969;
    db $00                                                               ;B4896B;
    db "NO1_51 "                                                         ;B4896C;

EnemySets_CrocomireSave:
    dw $FFFF                                                             ;B48973;
    db $00                                                               ;B48975;
    db "NO1_08 "                                                         ;B48976;

EnemySets_CrumbleShaft:
    dw EnemyHeaders_Sova                                                 ;B4897D;
    dw $0001,$FFFF                                                       ;B4897F;
    db $00                                                               ;B48983;
    db "NO2_17 "                                                         ;B48984;

EnemySets_Wasteland:
    dw EnemyHeaders_Hibashi                                              ;B4898B;
    dw $0001                                                             ;B4898D;
    dw EnemyHeaders_DessgeegaLarge                                       ;B4898F;
    dw $0002                                                             ;B48991;
    dw EnemyHeaders_ShutterShootable                                     ;B48993;
    dw $0003                                                             ;B48995;
    dw EnemyHeaders_KzanTop                                              ;B48997;
    dw $0007,$FFFF                                                       ;B48999;
    db $00                                                               ;B4899D;
    db "NO1_41 "                                                         ;B4899E;

EnemySets_AcidSnakesTunnel:
    dw EnemyHeaders_Dragon                                               ;B489A5;
    dw $0001                                                             ;B489A7;
    dw EnemyHeaders_Gamet                                                ;B489A9;
    dw $0002,$FFFF                                                       ;B489AB;
    db $00                                                               ;B489AF;
    db "NO1_22 "                                                         ;B489B0;

EnemySets_GrappleTutorial1:
    dw $FFFF                                                             ;B489B7;
    db $00                                                               ;B489B9;
    db "NO1_47 "                                                         ;B489BA;

EnemySets_BubbleMountainSave:
    dw $FFFF                                                             ;B489C1;
    db $00                                                               ;B489C3;
    db "NO1_13 "                                                         ;B489C4;

EnemySets_HiJumpETank:
    dw EnemyHeaders_Sova                                                 ;B489CB;
    dw $0001,$FFFF                                                       ;B489CD;
    db $00                                                               ;B489D1;
    db "NO1_26 "                                                         ;B489D2;

EnemySets_BubbleMountain:
    dw EnemyHeaders_Waver                                                ;B489D9;
    dw $0001                                                             ;B489DB;
    dw EnemyHeaders_Ripper2                                              ;B489DD;
    dw $0001                                                             ;B489DF;
    dw EnemyHeaders_Cacatac                                              ;B489E1;
    dw $0002                                                             ;B489E3;
    dw EnemyHeaders_Sova                                                 ;B489E5;
    dw $0002,$FFFF                                                       ;B489E7;
    db $00                                                               ;B489EB;
    db "NO1_00 "                                                         ;B489EC;

EnemySets_IceBeamAcid:
    dw EnemyHeaders_Tripper                                              ;B489F3;
    dw $0007,$FFFF                                                       ;B489F5;
    db $00                                                               ;B489F9;
    db "NO1_05 "                                                         ;B489FA;

EnemySets_IceBeamTutorial:
    dw EnemyHeaders_Boyon                                                ;B48A01;
    dw $0001                                                             ;B48A03;
    dw EnemyHeaders_Ripper2                                              ;B48A05;
    dw $0002,$FFFF                                                       ;B48A07;
    db $00                                                               ;B48A0B;
    db "NO1_18 "                                                         ;B48A0C;

EnemySets_PostCrocMissile:
    dw EnemyHeaders_Metaree                                              ;B48A13;
    dw $0001                                                             ;B48A15;
    dw EnemyHeaders_Gamet                                                ;B48A17;
    dw $0002,$FFFF                                                       ;B48A19;
    db $00                                                               ;B48A1D;
    db "NO1_01 "                                                         ;B48A1E;

EnemySets_Cathedral:
    dw EnemyHeaders_Sova                                                 ;B48A25;
    dw $0001                                                             ;B48A27;
    dw EnemyHeaders_Geruta                                               ;B48A29;
    dw $0002,$FFFF                                                       ;B48A2B;
    db $00                                                               ;B48A2F;
    db "NO1_24 "                                                         ;B48A30;

EnemySets_NorfairReserveTank:
    dw EnemyHeaders_Dragon                                               ;B48A37;
    dw $0001                                                             ;B48A39;
    dw EnemyHeaders_Sova                                                 ;B48A3B;
    dw $0002,$FFFF                                                       ;B48A3D;
    db $00                                                               ;B48A41;
    db "NO1_21 "                                                         ;B48A42;

EnemySets_GrappleTutorial2:
    dw EnemyHeaders_Fune                                                 ;B48A49;
    dw $0001                                                             ;B48A4B;
    dw EnemyHeaders_Multiviola                                           ;B48A4D;
    dw $0002,$FFFF                                                       ;B48A4F;
    db $00                                                               ;B48A53;
    db "NO1_07 "                                                         ;B48A54;

EnemySets_IceBeamSnake:
    dw EnemyHeaders_Sova                                                 ;B48A5B;
    dw $0001                                                             ;B48A5D;
    dw EnemyHeaders_Fune                                                 ;B48A5F;
    dw $0002,$FFFF                                                       ;B48A61;
    db $00                                                               ;B48A65;
    db "NO2_02 "                                                         ;B48A66;

EnemySets_GoldenTorizo:
    dw EnemyHeaders_GoldenTorizo                                         ;B48A6D;
    dw $0001,$FFFF                                                       ;B48A6F;
    db $00                                                               ;B48A73;
    db "NO1_32 "                                                         ;B48A74;

EnemySets_SpikyPlatformsTunnel:
    dw EnemyHeaders_Tripper                                              ;B48A7B;
    dw $0007                                                             ;B48A7D;
    dw EnemyHeaders_ShutterShootable                                     ;B48A7F;
    dw $0002,$FFFF                                                       ;B48A81;
    db $00                                                               ;B48A85;
    db "NO1_28 "                                                         ;B48A86;

EnemySets_SpeedBooster:
    dw $FFFF                                                             ;B48A8D;
    db $00                                                               ;B48A8F;
    db "NO2_06 "                                                         ;B48A90;

EnemySets_LNFarming:
    dw EnemyHeaders_Viola                                                ;B48A97;
    dw $0001                                                             ;B48A99;
    dw EnemyHeaders_Zebbo                                                ;B48A9B;
    dw $0007,$FFFF                                                       ;B48A9D;
    db $00                                                               ;B48AA1;
    db "NO1_29 "                                                         ;B48AA2;

EnemySets_SingleChamber:
    dw EnemyHeaders_Multiviola                                           ;B48AA9;
    dw $0001                                                             ;B48AAB;
    dw EnemyHeaders_Alcoon                                               ;B48AAD;
    dw $0002,$FFFF                                                       ;B48AAF;
    db $00                                                               ;B48AB3;
    db "NO1_27 "                                                         ;B48AB4;

EnemySets_SpeedBoosterHall:
    dw EnemyHeaders_Geruta                                               ;B48ABB;
    dw $0001                                                             ;B48ABD;
    dw EnemyHeaders_Metaree                                              ;B48ABF;
    dw $0002,$FFFF                                                       ;B48AC1;
    db $00                                                               ;B48AC5;
    db "NO1_45 "                                                         ;B48AC6;

EnemySets_BatCave:
    dw EnemyHeaders_Gamet                                                ;B48ACD;
    dw $0001                                                             ;B48ACF;
    dw EnemyHeaders_Skree                                                ;B48AD1;
    dw $0002,$FFFF                                                       ;B48AD3;
    db $00                                                               ;B48AD7;
    db "NO1_34 "                                                         ;B48AD8;

EnemySets_KronicBoost:
    dw EnemyHeaders_Viola                                                ;B48ADF;
    dw $0001,$FFFF                                                       ;B48AE1;
    db $00                                                               ;B48AE5;
    db "NO1_03 "                                                         ;B48AE6;

EnemySets_BusinessCenter:
    dw EnemyHeaders_Sova                                                 ;B48AED;
    dw $0002,$FFFF                                                       ;B48AEF;
    db $00                                                               ;B48AF3;
    db "NO2_19 "                                                         ;B48AF4;

EnemySets_ThreeMusketeers:
    dw EnemyHeaders_Hibashi                                              ;B48AFB;
    dw $0001                                                             ;B48AFD;
    dw EnemyHeaders_KihunterRed                                          ;B48AFF;
    dw $0002                                                             ;B48B01;
    dw EnemyHeaders_ShutterShootable                                     ;B48B03;
    dw $0003,$FFFF                                                       ;B48B05;
    db $00                                                               ;B48B09;
    db "NO1_10 "                                                         ;B48B0A;

EnemySets_Crocomire:
    dw EnemyHeaders_Crocomire                                            ;B48B11;
    dw $D007,$FFFF                                                       ;B48B13;
    db $00                                                               ;B48B17;
    db "NO1_52 "                                                         ;B48B18;

EnemySets_LNElevSave:
    dw $FFFF                                                             ;B48B1F;
    db $00                                                               ;B48B21;
    db "NO1_33 "                                                         ;B48B22;

EnemySets_Volcano:
    dw EnemyHeaders_Fune                                                 ;B48B29;
    dw $0001                                                             ;B48B2B;
    dw EnemyHeaders_LavaRocks                                            ;B48B2D;
    dw $0002,$FFFF                                                       ;B48B2F;
    db $00                                                               ;B48B33;
    db "NO1_39 "                                                         ;B48B34;

EnemySets_UpperNorfairFarming:
    dw EnemyHeaders_Fune                                                 ;B48B3B;
    dw $0001                                                             ;B48B3D;
    dw EnemyHeaders_Gamet                                                ;B48B3F;
    dw $0002,$FFFF                                                       ;B48B41;
    db $00                                                               ;B48B45;
    db "NP1_11a"                                                         ;B48B46;

EnemySets_SpongeBath_1:
    dw EnemyHeaders_Bull                                                 ;B48B4D;
    dw $0001,$FFFF                                                       ;B48B4F;
    db $00                                                               ;B48B53;
    db "NP1_07a"                                                         ;B48B54;

EnemySets_WreckedShipETank_1:
    dw EnemyHeaders_Kamer2                                               ;B48B5B;
    dw $0001                                                             ;B48B5D;
    dw EnemyHeaders_Skultera                                             ;B48B5F;
    dw $0002,$FFFF                                                       ;B48B61;
    db $00                                                               ;B48B65;
    db "NP1_04 "                                                         ;B48B66;

EnemySets_WreckedShipMainShaft_0:
    dw EnemyHeaders_Coven                                                ;B48B6D;
    dw $0001                                                             ;B48B6F;
    dw EnemyHeaders_KzanTop                                              ;B48B71;
    dw $0002                                                             ;B48B73;
    dw EnemyHeaders_Atomic                                               ;B48B75;
    dw $0003                                                             ;B48B77;
    dw EnemyHeaders_Sbug                                                 ;B48B79;
    dw $0003,$FFFF                                                       ;B48B7B;
    db $00                                                               ;B48B7F;
    db "NP1_00 "                                                         ;B48B80;

EnemySets_BowlingAlley_0:
    dw EnemyHeaders_Chozo                                                ;B48B87;
    dw $0001                                                             ;B48B89;
    dw EnemyHeaders_Sbug                                                 ;B48B8B;
    dw $0007,$FFFF                                                       ;B48B8D;
    db $00                                                               ;B48B91;
    db "NP1_02a"                                                         ;B48B92;

EnemySets_Attic_1:
    dw EnemyHeaders_KihunterYellow                                       ;B48B99;
    dw $0001                                                             ;B48B9B;
    dw EnemyHeaders_Atomic                                               ;B48B9D;
    dw $0002                                                             ;B48B9F;
    dw EnemyHeaders_Spark                                                ;B48BA1;
    dw $0003,$FFFF                                                       ;B48BA3;
    db $00                                                               ;B48BA7;
    db "NP1_08a"                                                         ;B48BA8;

EnemySets_Basement_1:
    dw EnemyHeaders_Robot                                                ;B48BAF;
    dw $0001                                                             ;B48BB1;
    dw EnemyHeaders_Atomic                                               ;B48BB3;
    dw $0002                                                             ;B48BB5;
    dw EnemyHeaders_Spark                                                ;B48BB7;
    dw $0003,$FFFF                                                       ;B48BB9;
    db $00                                                               ;B48BBD;
    db "NP1_09a"                                                         ;B48BBE;

EnemySets_WreckedShipMap_1:
    dw $FFFF                                                             ;B48BC5;
    db $00                                                               ;B48BC7;
    db "NP1_12 "                                                         ;B48BC8;

EnemySets_WSWestSuper_0:
    dw $FFFF                                                             ;B48BCF;
    db $00                                                               ;B48BD1;
    db "NP1_05 "                                                         ;B48BD2;

EnemySets_SpikyDeath_0:
    dw $FFFF                                                             ;B48BD9;
    db $00                                                               ;B48BDB;
    db "NP1_11 "                                                         ;B48BDC;

EnemySets_SpongeBath_0:
    dw $FFFF                                                             ;B48BE3;
    db $00                                                               ;B48BE5;
    db "NP1_01a"                                                         ;B48BE6;

EnemySets_WreckedShipEntrance_1:
    dw $FFFF                                                             ;B48BED;
    db $00                                                               ;B48BEF;
    db "NP1_06 "                                                         ;B48BF0;

EnemySets_ElectricDeath_0:
    dw $FFFF                                                             ;B48BF7;
    db $00                                                               ;B48BF9;
    db "NP1_00a"                                                         ;B48BFA;

EnemySets_BowlingAlley_1:
    dw EnemyHeaders_Chozo                                                ;B48C01;
    dw $0001                                                             ;B48C03;
    dw EnemyHeaders_Robot                                                ;B48C05;
    dw $0003,$FFFF                                                       ;B48C07;
    db $00                                                               ;B48C0B;
    db "NP1_03 "                                                         ;B48C0C;

EnemySets_AssemblyLine_0:
    dw $FFFF                                                             ;B48C13;
    db $00                                                               ;B48C15;
    db "NP1_10a"                                                         ;B48C16;

EnemySets_Phantoon_1:
    dw $FFFF                                                             ;B48C1D;
    db $00                                                               ;B48C1F;
    db "NP1_07 "                                                         ;B48C20;

EnemySets_WreckedShipETank_0:
    dw $FFFF                                                             ;B48C27;
    db $00                                                               ;B48C29;
    db "NP1_14 "                                                         ;B48C2A;

EnemySets_GravitySuit_0:
    dw $FFFF                                                             ;B48C31;
    db $00                                                               ;B48C33;
    db "NP1_09 "                                                         ;B48C34;

EnemySets_WreckedShipMap_0:
    dw EnemyHeaders_Coven                                                ;B48C3B;
    dw $0001                                                             ;B48C3D;
    dw EnemyHeaders_Sbug                                                 ;B48C3F;
    dw $0007                                                             ;B48C41;
    dw EnemyHeaders_Bull                                                 ;B48C43;
    dw $0007,$FFFF                                                       ;B48C45;
    db $00                                                               ;B48C49;
    db "NP1_14a"                                                         ;B48C4A;

EnemySets_GravitySuit_1:
    dw $FFFF                                                             ;B48C51;
    db $00                                                               ;B48C53;
    db "NP1_08 "                                                         ;B48C54;

EnemySets_Basement_0:
    dw EnemyHeaders_RobotNoPower                                         ;B48C5B;
    dw $0007                                                             ;B48C5D;
    dw EnemyHeaders_Sbug                                                 ;B48C5F;
    dw $0007,$FFFF                                                       ;B48C61;
    db $00                                                               ;B48C65;
    db "NP1_01 "                                                         ;B48C66;

EnemySets_WreckedShipEntrance_0:
    dw EnemyHeaders_Sbug                                                 ;B48C6D;
    dw $0001,$FFFF                                                       ;B48C6F;
    db $00                                                               ;B48C73;
    db "NP1_03a"                                                         ;B48C74;

EnemySets_AssemblyLine_1:
    dw EnemyHeaders_Spark                                                ;B48C7B;
    dw $0001                                                             ;B48C7D;
    dw EnemyHeaders_Puyo                                                 ;B48C7F;
    dw $0002                                                             ;B48C81;
    dw EnemyHeaders_Robot                                                ;B48C83;
    dw $0003,$FFFF                                                       ;B48C85;
    db $00                                                               ;B48C89;
    db "NP1_15a"                                                         ;B48C8A;

EnemySets_WreckedShipSave_1:
    dw $FFFF                                                             ;B48C91;
    db $00                                                               ;B48C93;
    db "NP1_12a"                                                         ;B48C94;

EnemySets_WSWestSuper_1:
    dw EnemyHeaders_Spark                                                ;B48C9B;
    dw $0001,$FFFF                                                       ;B48C9D;
    db $00                                                               ;B48CA1;
    db "NP1_02 "                                                         ;B48CA2;

EnemySets_Attic_0:
    dw EnemyHeaders_Coven                                                ;B48CA9;
    dw $0001                                                             ;B48CAB;
    dw EnemyHeaders_Atomic                                               ;B48CAD;
    dw $0002                                                             ;B48CAF;
    dw EnemyHeaders_Sbug                                                 ;B48CB1;
    dw $0002,$FFFF                                                       ;B48CB3;
    db $00                                                               ;B48CB7;
    db "NP1_13 "                                                         ;B48CB8;

EnemySets_WSEastSuper_0:
    dw EnemyHeaders_Coven                                                ;B48CBF;
    dw $0001                                                             ;B48CC1;
    dw EnemyHeaders_Atomic                                               ;B48CC3;
    dw $0002                                                             ;B48CC5;
    dw EnemyHeaders_Sbug                                                 ;B48CC7;
    dw $0002                                                             ;B48CC9;
    dw EnemyHeaders_RobotNoPower                                         ;B48CCB;
    dw $0007,$FFFF                                                       ;B48CCD;
    db $00                                                               ;B48CD1;
    db "NP1_15 "                                                         ;B48CD2;

EnemySets_WreckedShipSave_0:
    dw EnemyHeaders_Coven                                                ;B48CD9;
    dw $0001                                                             ;B48CDB;
    dw EnemyHeaders_Sbug                                                 ;B48CDD;
    dw $0002,$FFFF                                                       ;B48CDF;
    db $00                                                               ;B48CE3;
    db "NP1_06a"                                                         ;B48CE4;

EnemySets_ElectricDeath_1:
    dw EnemyHeaders_Spark                                                ;B48CEB;
    dw $0001,$FFFF                                                       ;B48CED;
    db $00                                                               ;B48CF1;
    db "NP1_05a"                                                         ;B48CF2;

EnemySets_SpikyDeath_1:
    dw EnemyHeaders_KzanTop                                              ;B48CF9;
    dw $0007,$FFFF                                                       ;B48CFB;
    db $00                                                               ;B48CFF;
    db "NP1_13a"                                                         ;B48D00;

EnemySets_WSEastSuper_1:
    dw EnemyHeaders_Robot                                                ;B48D07;
    dw $0001                                                             ;B48D09;
    dw EnemyHeaders_Bull                                                 ;B48D0B;
    dw $0002                                                             ;B48D0D;
    dw EnemyHeaders_Spark                                                ;B48D0F;
    dw $0003,$FFFF                                                       ;B48D11;
    db $00                                                               ;B48D15;
    db "NP1_10 "                                                         ;B48D16;

EnemySets_Phantoon_0:
    dw EnemyHeaders_PhantoonBody                                         ;B48D1D;
    dw $0007,$FFFF                                                       ;B48D1F;
    db $00                                                               ;B48D23;
    db "NP1_04a"                                                         ;B48D24;

EnemySets_WreckedShipMainShaft_1:
    dw EnemyHeaders_Spark                                                ;B48D2B;
    dw $0001                                                             ;B48D2D;
    dw EnemyHeaders_Atomic                                               ;B48D2F;
    dw $0002                                                             ;B48D31;
    dw EnemyHeaders_KzanTop                                              ;B48D33;
    dw $0003,$FFFF                                                       ;B48D35;
    db $00                                                               ;B48D39;
    db "ML1_08 "                                                         ;B48D3A;

EnemySets_MtEverest:
    dw EnemyHeaders_Powamp                                               ;B48D41;
    dw $0001                                                             ;B48D43;
    dw EnemyHeaders_Sciser                                               ;B48D45;
    dw $0003,$FFFF                                                       ;B48D47;
    db $00                                                               ;B48D4B;
    db "ML2_25 "                                                         ;B48D4C;

EnemySets_HalfieClimb:
    dw EnemyHeaders_Oum                                                  ;B48D53;
    dw $0001                                                             ;B48D55;
    dw EnemyHeaders_Mochtroid                                            ;B48D57;
    dw $0002,$FFFF                                                       ;B48D59;
    db $00                                                               ;B48D5D;
    db "ML1_10 "                                                         ;B48D5E;

EnemySets_WateringHole:
    dw EnemyHeaders_Choot                                                ;B48D65;
    dw $0001                                                             ;B48D67;
    dw EnemyHeaders_Zeb                                                  ;B48D69;
    dw $0002,$FFFF                                                       ;B48D6B;
    db $00                                                               ;B48D6F;
    db "ML1_12 "                                                         ;B48D70;

EnemySets_CrabShaft:
    dw EnemyHeaders_Sciser                                               ;B48D77;
    dw $0001,$FFFF                                                       ;B48D79;
    db $00                                                               ;B48D7D;
    db "ML1_19 "                                                         ;B48D7E;

EnemySets_MaridiaElev:
    dw EnemyHeaders_Ripper                                               ;B48D85;
    dw $0003                                                             ;B48D87;
    dw EnemyHeaders_Owtch                                                ;B48D89;
    dw $0007,$FFFF                                                       ;B48D8B;
    db $00                                                               ;B48D8F;
    db "ML2_16 "                                                         ;B48D90;

EnemySets_Colosseum:
    dw EnemyHeaders_Mochtroid                                            ;B48D97;
    dw $0001,$FFFF                                                       ;B48D99;
    db $00                                                               ;B48D9D;
    db "ML2_17 "                                                         ;B48D9E;

EnemySets_AqueductSave:
    dw $FFFF                                                             ;B48DA5;
    db $00                                                               ;B48DA7;
    db "ML2_18 "                                                         ;B48DA8;

EnemySets_ThePrecious:
    dw $FFFF                                                             ;B48DAF;
    db $00                                                               ;B48DB1;
    db "ML2_19 "                                                         ;B48DB2;

EnemySets_BotwoonETank:
    dw EnemyHeaders_Puyo                                                 ;B48DB9;
    dw $0001                                                             ;B48DBB;
    dw EnemyHeaders_Sciser                                               ;B48DBD;
    dw $0001                                                             ;B48DBF;
    dw EnemyHeaders_Zoa                                                  ;B48DC1;
    dw $0002,$FFFF                                                       ;B48DC3;
    db $00                                                               ;B48DC7;
    db "ML2_20 "                                                         ;B48DC8;

EnemySets_DraygonSave:
    dw $FFFF                                                             ;B48DCF;
    db $00                                                               ;B48DD1;
    db "ML2_21 "                                                         ;B48DD2;

EnemySets_MaridiaMissileRefill:
    dw $FFFF                                                             ;B48DD9;
    db $00                                                               ;B48DDB;
    db "ML2_22 "                                                         ;B48DDC;

EnemySets_PlasmaBeachQuicksand:
    dw EnemyHeaders_Bull                                                 ;B48DE3;
    dw $0001,$FFFF                                                       ;B48DE5;
    db $00                                                               ;B48DE9;
    db "ML2_23 "                                                         ;B48DEA;

EnemySets_BotwoonQuicksand:
    dw EnemyHeaders_Bull                                                 ;B48DF1;
    dw $0001,$FFFF                                                       ;B48DF3;
    db $00                                                               ;B48DF7;
    db "ML2_24 "                                                         ;B48DF8;

EnemySets_Shaktool:
    dw EnemyHeaders_Shaktool                                             ;B48DFF;
    dw $0001                                                             ;B48E01;
    dw EnemyHeaders_Yard                                                 ;B48E03;
    dw $0002,$FFFF                                                       ;B48E05;
    db $00                                                               ;B48E09;
    db "MLB_00"                                                          ;B48E0A;

EnemySets_Draygon_0:
    dw EnemyHeaders_DraygonBody                                          ;B48E10;
    dw $0007,$FFFF                                                       ;B48E12;
    db $00                                                               ;B48E16;
    db "ML2_09 "                                                         ;B48E17;

EnemySets_Aqueduct:
    dw EnemyHeaders_Yard                                                 ;B48E1E;
    dw $0001,$FFFF                                                       ;B48E20;
    db $00                                                               ;B48E24;
    db "ML1_09 "                                                         ;B48E25;

EnemySets_RedFish:
    dw EnemyHeaders_Skultera                                             ;B48E2C;
    dw $0001                                                             ;B48E2E;
    dw EnemyHeaders_Sciser                                               ;B48E30;
    dw $0001                                                             ;B48E32;
    dw EnemyHeaders_Zebbo                                                ;B48E34;
    dw $0002,$FFFF                                                       ;B48E36;
    db $00                                                               ;B48E3A;
    db "ML1_17 "                                                         ;B48E3B;

EnemySets_Plasma:
    dw EnemyHeaders_PirateMagentaWalking                                 ;B48E42;
    dw $0001                                                             ;B48E44;
    dw EnemyHeaders_PirateMagentaWall                                    ;B48E46;
    dw $0002,$FFFF                                                       ;B48E48;
    db $00                                                               ;B48E4C;
    db "ML2_27 "                                                         ;B48E4D;

EnemySets_SpaceJump:
    dw $FFFF                                                             ;B48E54;
    db $00                                                               ;B48E56;
    db "ML2_12 "                                                         ;B48E57;

EnemySets_Pants:
    dw EnemyHeaders_Menu                                                 ;B48E5E;
    dw $0001                                                             ;B48E60;
    dw EnemyHeaders_Puyo                                                 ;B48E62;
    dw $0002                                                             ;B48E64;
    dw EnemyHeaders_Tripper                                              ;B48E66;
    dw $0002,$FFFF                                                       ;B48E68;
    db $00                                                               ;B48E6C;
    db "ML1_00 "                                                         ;B48E6D;

EnemySets_GlassTunnelSave:
    dw $FFFF                                                             ;B48E74;
    db $00                                                               ;B48E76;
    db "ML1_01 "                                                         ;B48E77;

EnemySets_GlassTunnel:
    dw EnemyHeaders_NoobTubeCrack                                        ;B48E7E;
    dw $0007,$FFFF                                                       ;B48E80;
    db $00                                                               ;B48E84;
    db "ML1_02 "                                                         ;B48E85;

EnemySets_WestTunnel:
    dw $FFFF                                                             ;B48E8C;
    db $00                                                               ;B48E8E;
    db "ML1_03 "                                                         ;B48E8F;

EnemySets_EastTunnel:
    dw EnemyHeaders_Boyon                                                ;B48E96;
    dw $0001                                                             ;B48E98;
    dw EnemyHeaders_Zebbo                                                ;B48E9A;
    dw $0002,$FFFF                                                       ;B48E9C;
    db $00                                                               ;B48EA0;
    db "ML1_06 "                                                         ;B48EA1;

EnemySets_MamaTurtle:
    dw EnemyHeaders_MamaTurtle                                           ;B48EA8;
    dw $0001,$FFFF                                                       ;B48EAA;
    db $00                                                               ;B48EAE;
    db "ML1_07 "                                                         ;B48EAF;

EnemySets_CrabTunnel:
    dw EnemyHeaders_Sciser                                               ;B48EB6;
    dw $0001,$FFFF                                                       ;B48EB8;
    db $00                                                               ;B48EBC;
    db "ML1_11 "                                                         ;B48EBD;

EnemySets_NWestMaridiaBug:
    dw EnemyHeaders_Owtch                                                ;B48EC4;
    dw $0001                                                             ;B48EC6;
    dw EnemyHeaders_Menu                                                 ;B48EC8;
    dw $0002,$FFFF                                                       ;B48ECA;
    db $00                                                               ;B48ECE;
    db "ML1_13 "                                                         ;B48ECF;

EnemySets_PseudoPlasmaSpark:
    dw EnemyHeaders_Owtch                                                ;B48ED6;
    dw $0001                                                             ;B48ED8;
    dw EnemyHeaders_Choot                                                ;B48EDA;
    dw $0002                                                             ;B48EDC;
    dw EnemyHeaders_Skultera                                             ;B48EDE;
    dw $0003,$FFFF                                                       ;B48EE0;
    db $00                                                               ;B48EE4;
    db "ML1_15 "                                                         ;B48EE5;

EnemySets_WestSandHallTunnel:
    dw EnemyHeaders_Sciser                                               ;B48EEC;
    dw $0001,$FFFF                                                       ;B48EEE;
    db $00                                                               ;B48EF2;
    db "ML1_16 "                                                         ;B48EF3;

EnemySets_PlasmaTutorial:
    dw EnemyHeaders_Puyo                                                 ;B48EFA;
    dw $0001                                                             ;B48EFC;
    dw EnemyHeaders_MZoomer                                              ;B48EFE;
    dw $0001,$FFFF                                                       ;B48F00;
    db $00                                                               ;B48F04;
    db "ML1_18 "                                                         ;B48F05;

EnemySets_ThreadTheNeedle:
    dw EnemyHeaders_Puyo                                                 ;B48F0C;
    dw $0001                                                             ;B48F0E;
    dw EnemyHeaders_Boyon                                                ;B48F10;
    dw $0001                                                             ;B48F12;
    dw EnemyHeaders_Choot                                                ;B48F14;
    dw $0002,$FFFF                                                       ;B48F16;
    db $00                                                               ;B48F1A;
    db "ML1_20 "                                                         ;B48F1B;

EnemySets_PlasmaSpark:
    dw EnemyHeaders_Owtch                                                ;B48F22;
    dw $0001                                                             ;B48F24;
    dw EnemyHeaders_Choot                                                ;B48F26;
    dw $0002                                                             ;B48F28;
    dw EnemyHeaders_Skultera                                             ;B48F2A;
    dw $0003,$FFFF                                                       ;B48F2C;
    db $00                                                               ;B48F30;
    db "ML2_00 "                                                         ;B48F31;

EnemySets_Toilet:
    dw EnemyHeaders_Mochtroid                                            ;B48F38;
    dw $0001                                                             ;B48F3A;
    dw EnemyHeaders_Puyo                                                 ;B48F3C;
    dw $0002                                                             ;B48F3E;
    dw EnemyHeaders_Sciser                                               ;B48F40;
    dw $0002                                                             ;B48F42;
    dw EnemyHeaders_Yard                                                 ;B48F44;
    dw $0003,$FFFF                                                       ;B48F46;
    db $00                                                               ;B48F4A;
    db "ML2_02 "                                                         ;B48F4B;

EnemySets_WestSandHall:
    dw EnemyHeaders_Evir                                                 ;B48F52;
    dw $0001,$FFFF                                                       ;B48F54;
    db $00                                                               ;B48F58;
    db "ML2_03 "                                                         ;B48F59;

EnemySets_Oasis:
    dw $FFFF                                                             ;B48F60;
    db $00                                                               ;B48F62;
    db "ML2_04 "                                                         ;B48F63;

EnemySets_EastSandHall:
    dw EnemyHeaders_Evir                                                 ;B48F6A;
    dw $0001,$FFFF                                                       ;B48F6C;
    db $00                                                               ;B48F70;
    db "ML2_07 "                                                         ;B48F71;

EnemySets_WestAqueductQuicksand:
    dw EnemyHeaders_Bull                                                 ;B48F78;
    dw $0001,$FFFF                                                       ;B48F7A;
    db $00                                                               ;B48F7E;
    db "ML2_08 "                                                         ;B48F7F;

EnemySets_EastAqueductQuicksand:
    dw EnemyHeaders_Bull                                                 ;B48F86;
    dw $0001,$FFFF                                                       ;B48F88;
    db $00                                                               ;B48F8C;
    db "ML2_10 "                                                         ;B48F8D;

EnemySets_Butterfly:
    dw EnemyHeaders_Zoa                                                  ;B48F94;
    dw $0001,$FFFF                                                       ;B48F96;
    db $00                                                               ;B48F9A;
    db "ML2_11 "                                                         ;B48F9B;

EnemySets_BotwoonHallway:
    dw EnemyHeaders_Mochtroid                                            ;B48FA2;
    dw $0001                                                             ;B48FA4;
    dw EnemyHeaders_Puyo                                                 ;B48FA6;
    dw $0002                                                             ;B48FA8;
    dw EnemyHeaders_Sciser                                               ;B48FAA;
    dw $0002,$FFFF                                                       ;B48FAC;
    db $00                                                               ;B48FB0;
    db "ML2_13 "                                                         ;B48FB1;

EnemySets_EastPants:
    dw EnemyHeaders_Puyo                                                 ;B48FB8;
    dw $0001                                                             ;B48FBA;
    dw EnemyHeaders_Tripper                                              ;B48FBC;
    dw $0001,$FFFF                                                       ;B48FBE;
    db $00                                                               ;B48FC2;
    db "ML2_14 "                                                         ;B48FC3;

EnemySets_Springball:
    dw $FFFF                                                             ;B48FCA;
    db $00                                                               ;B48FCC;
    db "ML2_15 "                                                         ;B48FCD;

EnemySets_BelowBotwoonETank:
    dw EnemyHeaders_Zoa                                                  ;B48FD4;
    dw $0001                                                             ;B48FD6;
    dw EnemyHeaders_Owtch                                                ;B48FD8;
    dw $0002,$FFFF                                                       ;B48FDA;
    db $00                                                               ;B48FDE;
    db "ML1_21 "                                                         ;B48FDF;

EnemySets_Kassiuz:
    dw EnemyHeaders_Choot                                                ;B48FE6;
    dw $0001                                                             ;B48FE8;
    dw EnemyHeaders_Puyo                                                 ;B48FEA;
    dw $0002                                                             ;B48FEC;
    dw EnemyHeaders_Boyon                                                ;B48FEE;
    dw $0002,$FFFF                                                       ;B48FF0;
    db $00                                                               ;B48FF4;
    db "ML1_23 "                                                         ;B48FF5;

EnemySets_ForgottenHighwaySave:
    dw $FFFF                                                             ;B48FFC;
    db $00                                                               ;B48FFE;
    db "ML2_28 "                                                         ;B48FFF;

EnemySets_MaridiaEnergyRefill:
    dw $FFFF                                                             ;B49006;
    db $00                                                               ;B49008;
    db "ML1_22 "                                                         ;B49009;

EnemySets_MaridiaMap:
    dw $FFFF                                                             ;B49010;
    db $00                                                               ;B49012;
    db "ML1_14 "                                                         ;B49013;

EnemySets_CrabHole:
    dw EnemyHeaders_Sciser                                               ;B4901A;
    dw $0001,$FFFF                                                       ;B4901C;
    db $00                                                               ;B49020;
    db "ML2_26 "                                                         ;B49021;

EnemySets_Botwoon:
    dw EnemyHeaders_Owtch                                                ;B49028;
    dw $0001                                                             ;B4902A;
    dw EnemyHeaders_Botwoon                                              ;B4902C;
    dw $0007,$FFFF                                                       ;B4902E;
    db $00                                                               ;B49032;
    db "ML1_04 "                                                         ;B49033;

EnemySets_MainStreet:
    dw EnemyHeaders_Skultera                                             ;B4903A;
    dw $0001                                                             ;B4903C;
    dw EnemyHeaders_Sciser                                               ;B4903E;
    dw $0002,$FFFF                                                       ;B49040;
    db $00                                                               ;B49044;
    db "ML2_01 "                                                         ;B49045;

EnemySets_BugSandHole:
    dw EnemyHeaders_YappingMaw                                           ;B4904C;
    dw $0001                                                             ;B4904E;
    dw EnemyHeaders_Zoa                                                  ;B49050;
    dw $0007,$FFFF                                                       ;B49052;
    db $00                                                               ;B49056;
    db "ML2_06 "                                                         ;B49057;

EnemySets_EastSandHole:
    dw EnemyHeaders_Boulder                                              ;B4905E;
    dw $0001,$FFFF                                                       ;B49060;
    db $00                                                               ;B49064;
    db "ML2_05 "                                                         ;B49065;

EnemySets_WestSandHole:
    dw EnemyHeaders_Boulder                                              ;B4906C;
    dw $0001,$FFFF                                                       ;B4906E;
    db $00                                                               ;B49072;
    db "ML2_29 "                                                         ;B49073;

EnemySets_WestCactusAlley:
    dw EnemyHeaders_Cacatac                                              ;B4907A;
    dw $0007                                                             ;B4907C;
    dw EnemyHeaders_Zoa                                                  ;B4907E;
    dw $0007,$FFFF                                                       ;B49080;
    db $00                                                               ;B49084;
    db "ML2_30 "                                                         ;B49085;

EnemySets_EastCactusAlley:
    dw EnemyHeaders_Cacatac                                              ;B4908C;
    dw $0001                                                             ;B4908E;
    dw EnemyHeaders_Zoa                                                  ;B49090;
    dw $0001,$FFFF                                                       ;B49092;
    db $00                                                               ;B49096;
    db "ML1_05 "                                                         ;B49097;

EnemySets_FishTank:
    dw EnemyHeaders_Skultera                                             ;B4909E;
    dw $0001                                                             ;B490A0;
    dw EnemyHeaders_PirateMagentaWalking                                 ;B490A2;
    dw $0002,$FFFF                                                       ;B490A4;
    db $00                                                               ;B490A8;
    db "TS1_17 "                                                         ;B490A9;

EnemySets_TourianEscape4:
    dw EnemyHeaders_PirateSilverWall                                     ;B490B0;
    dw $0001                                                             ;B490B2;
    dw EnemyHeaders_PirateSilverWalking                                  ;B490B4;
    dw $0002,$FFFF                                                       ;B490B6;
    db $00                                                               ;B490BA;
    db "TS1_13 "                                                         ;B490BB;

EnemySets_MotherBrainSave:
    dw $FFFF                                                             ;B490C2;
    db $00                                                               ;B490C4;
    db "TS1_01 "                                                         ;B490C5;

EnemySets_Metroids1_0:
    dw EnemyHeaders_Metroid                                              ;B490CC;
    dw $0001                                                             ;B490CE;
    dw EnemyHeaders_Rinka                                                ;B490D0;
    dw $0002,$FFFF                                                       ;B490D2;
    db $00                                                               ;B490D6;
    db "TS1_06 "                                                         ;B490D7;

EnemySets_DustTorizo:
    dw EnemyHeaders_CorpseTorizo                                         ;B490DE;
    dw $0001,$FFFF                                                       ;B490E0;
    db $00                                                               ;B490E4;
    db "TS1_07 "                                                         ;B490E5;

EnemySets_BigBoy:
    dw EnemyHeaders_CorpseSidehopper                                     ;B490EC;
    dw $0001                                                             ;B490EE;
    dw EnemyHeaders_CorpseSidehopper2                                    ;B490F0;
    dw $0001                                                             ;B490F2;
    dw EnemyHeaders_BabyMetroid                                          ;B490F4;
    dw $0001,$FFFF                                                       ;B490F6;
    db $00                                                               ;B490FA;
    db "TS1_10 "                                                         ;B490FB;

EnemySets_MotherBrain_0_1:
    dw EnemyHeaders_MotherBrainHead                                      ;B49102;
    dw $0001                                                             ;B49104;
    dw EnemyHeaders_Rinka                                                ;B49106;
    dw $0002                                                             ;B49108;
    dw EnemyHeaders_MotherBrainBody                                      ;B4910A;
    dw $D001,$FFFF                                                       ;B4910C;
    db $00                                                               ;B49110;
    db "TS1_11 "                                                         ;B49111;

EnemySets_TourianEyeDoor:
    dw $FFFF                                                             ;B49118;
    db $00                                                               ;B4911A;
    db "TS1_05 "                                                         ;B4911B;

EnemySets_BlueHopper:
    dw EnemyHeaders_SidehopperTourian                                    ;B49122;
    dw $0001,$FFFF                                                       ;B49124;
    db $00                                                               ;B49128;
    db "TS1_14 "                                                         ;B49129;

EnemySets_TourianEscape1:
    dw EnemyHeaders_ShutterDestroyable                                   ;B49130;
    dw $0001,$FFFF                                                       ;B49132;
    db $00                                                               ;B49136;
    db "TS1_00 "                                                         ;B49137;

EnemySets_TourianFirst:
    dw $FFFF                                                             ;B4913E;
    db $00                                                               ;B49140;
    db "TS1_02 "                                                         ;B49141;

EnemySets_Metroids2_0:
    dw EnemyHeaders_Metroid                                              ;B49148;
    dw $0001                                                             ;B4914A;
    dw EnemyHeaders_Rinka                                                ;B4914C;
    dw $0002,$FFFF                                                       ;B4914E;
    db $00                                                               ;B49152;
    db "TS1_04 "                                                         ;B49153;

EnemySets_Metroids4_0:
    dw EnemyHeaders_Metroid                                              ;B4915A;
    dw $0001                                                             ;B4915C;
    dw EnemyHeaders_Rinka                                                ;B4915E;
    dw $0002,$FFFF                                                       ;B49160;
    db $00                                                               ;B49164;
    db "TS1_01 "                                                         ;B49165;

EnemySets_Metroids1_1:
    dw EnemyHeaders_Rinka                                                ;B4916C;
    dw $0002,$FFFF                                                       ;B4916E;
    db $00                                                               ;B49172;
    db "TS1_02 "                                                         ;B49173;

EnemySets_Metroids2_1:
    dw EnemyHeaders_Rinka                                                ;B4917A;
    dw $0002,$FFFF                                                       ;B4917C;
    db $00                                                               ;B49180;
    db "TS1_15 "                                                         ;B49181;

EnemySets_TourianEscape2:
    dw EnemyHeaders_PirateSilverWall                                     ;B49188;
    dw $0001,$FFFF                                                       ;B4918A;
    db $00                                                               ;B4918E;
    db "TS1_03 "                                                         ;B4918F;

EnemySets_Metroids3_1:
    dw EnemyHeaders_Rinka                                                ;B49196;
    dw $0002,$FFFF                                                       ;B49198;
    db $00                                                               ;B4919C;
    db "TS1_04 "                                                         ;B4919D;

EnemySets_Metroids4_1:
    dw EnemyHeaders_Rinka                                                ;B491A4;
    dw $0002,$FFFF                                                       ;B491A6;
    db $00                                                               ;B491AA;
    db "TS1_16 "                                                         ;B491AB;

EnemySets_TourianEscape3:
    dw EnemyHeaders_PirateSilverWalking                                  ;B491B2;
    dw $0001                                                             ;B491B4;
    dw EnemyHeaders_ShutterGrowing                                       ;B491B6;
    dw $0002,$FFFF                                                       ;B491B8;
    db $00                                                               ;B491BC;
    db "TS1_08 "                                                         ;B491BD;

EnemySets_Seaweed:
    dw $FFFF                                                             ;B491C4;
    db $00                                                               ;B491C6;
    db "TS1_09 "                                                         ;B491C7;

EnemySets_TourianRecharge:
    dw $FFFF                                                             ;B491CE;
    db $00                                                               ;B491D0;
    db "TS1_07 "                                                         ;B491D1;

UNUSED_EnemySets_B491D8:
    dw EnemyHeaders_CorpseSidehopper                                     ;B491D8;
    dw $0001                                                             ;B491DA;
    dw EnemyHeaders_CorpseSidehopper2                                    ;B491DC;
    dw $0001                                                             ;B491DE;
    dw EnemyHeaders_BabyMetroid                                          ;B491E0;
    dw $0001,$FFFF                                                       ;B491E2;
    db $00                                                               ;B491E6;
    db "TS1_18 "                                                         ;B491E7;

EnemySets_UpperTourianSave:
    dw $FFFF                                                             ;B491EE;
    db $00                                                               ;B491F0;
    db "TS1_03 "                                                         ;B491F1;

EnemySets_Metroids3_0:
    dw EnemyHeaders_Metroid                                              ;B491F8;
    dw $0001                                                             ;B491FA;
    dw EnemyHeaders_Rinka                                                ;B491FC;
    dw $0002,$FFFF                                                       ;B491FE;
    db $00                                                               ;B49202;
    db "TS1_12 "                                                         ;B49203;

EnemySets_RinkaShaft:
    dw EnemyHeaders_Rinka                                                ;B4920A;
    dw $0002,$FFFF                                                       ;B4920C;
    db $00                                                               ;B49210;
    db "cl1_00 "                                                         ;B49211;

EnemySets_CeresElev_0:
    dw EnemyHeaders_CeresDoor                                            ;B49218;
    dw $D002,$FFFF                                                       ;B4921A;
    db $00                                                               ;B4921E;
    db "cl1_01 "                                                         ;B4921F;

EnemySets_FallingTile_0:
    dw EnemyHeaders_CeresDoor                                            ;B49226;
    dw $D002,$FFFF                                                       ;B49228;
    db $00                                                               ;B4922C;
    db "cl1_02 "                                                         ;B4922D;

EnemySets_MagnetStairs_0:
    dw EnemyHeaders_CeresDoor                                            ;B49234;
    dw $D002,$FFFF                                                       ;B49236;
    db $00                                                               ;B4923A;
    db "cl1_03 "                                                         ;B4923B;

EnemySets_DeadScientist_0:
    dw EnemyHeaders_CeresDoor                                            ;B49242;
    dw $D002,$FFFF                                                       ;B49244;
    db $00                                                               ;B49248;
    db "cl1_04 "                                                         ;B49249;

EnemySets_58Escape_0:
    dw EnemyHeaders_CeresDoor                                            ;B49250;
    dw $D002,$FFFF                                                       ;B49252;
    db $00                                                               ;B49256;
    db "cl1_05 "                                                         ;B49257;

EnemySets_CeresRidley_0:
    dw EnemyHeaders_RidleyCeres                                          ;B4925E;
    dw $0001                                                             ;B49260;
    dw EnemyHeaders_CeresDoor                                            ;B49262;
    dw $D002,$FFFF                                                       ;B49264;
    db $00                                                               ;B49268;
    db "cl1_00 "                                                         ;B49269;

EnemySets_CeresElev_1:
    dw EnemyHeaders_CeresDoor                                            ;B49270;
    dw $D002,$FFFF                                                       ;B49272;
    db $00                                                               ;B49276;
    db "cl1_01 "                                                         ;B49277;

EnemySets_FallingTile_1:
    dw EnemyHeaders_CeresDoor                                            ;B4927E;
    dw $D002,$FFFF                                                       ;B49280;
    db $00                                                               ;B49284;
    db "cl1_02 "                                                         ;B49285;

EnemySets_MagnetStairs_1:
    dw EnemyHeaders_CeresDoor                                            ;B4928C;
    dw $D002,$FFFF                                                       ;B4928E;
    db $00                                                               ;B49292;
    db "cl1_03 "                                                         ;B49293;

EnemySets_DeadScientist_1:
    dw EnemyHeaders_CeresDoor                                            ;B4929A;
    dw $D002,$FFFF                                                       ;B4929C;
    db $00                                                               ;B492A0;
    db "cl1_04 "                                                         ;B492A1;

EnemySets_58Escape_1:
    dw EnemyHeaders_CeresDoor                                            ;B492A8;
    dw $D002,$FFFF                                                       ;B492AA;
    db $00                                                               ;B492AE;
    db "cl1_05 "                                                         ;B492AF;

EnemySets_CeresRidley_1:
    dw EnemyHeaders_CeresDoor                                            ;B492B6;
    dw $D002,$FFFF                                                       ;B492B8;
    db $00                                                               ;B492BC;
    db "TT_00 "                                                          ;B492BD;

EnemySets_Debug:
    dw $FFFF                                                             ;B492C3;
    db $00                                                               ;B492C5;

DebugHandler_7_EnemyDebugger_EnemySpawnDataEditor:
    JSR.W Debug_HandleCursorMovement                                     ;B492C6;
    JSR.W Debug_HandleDigitModification                                  ;B492C9;
    LDA.W #$0800                                                         ;B492CC;
    STA.B $26                                                            ;B492CF;
    LDA.W $1860                                                          ;B492D1;
    STA.B $14                                                            ;B492D4;
    LDA.W $1862                                                          ;B492D6;
    STA.B $12                                                            ;B492D9;
    LDA.W #$001C                                                         ;B492DB;
    JSL.L Add_Debug_Spritemap_to_OAM                                     ;B492DE;
    LDA.W #$0A00                                                         ;B492E2;
    STA.B $26                                                            ;B492E5;
    LDA.W #$00B0                                                         ;B492E7;
    STA.B $14                                                            ;B492EA;
    LDA.W #$0048                                                         ;B492EC;
    STA.B $12                                                            ;B492EF;
    LDA.W #$002F                                                         ;B492F1;
    JSL.L Add_Debug_Spritemap_to_OAM                                     ;B492F4;
    LDA.W #$0A00                                                         ;B492F8;
    STA.B $26                                                            ;B492FB;
    LDA.W #$00B0                                                         ;B492FD;
    STA.B $14                                                            ;B49300;
    LDA.W #$0048                                                         ;B49302;
    STA.B $12                                                            ;B49305;
    LDX.W $1846                                                          ;B49307;
    LDA.W EnemyData.pId,X                                                ;B4930A;
    TAX                                                                  ;B4930D;
    LDA.L $A0003E,X                                                      ;B4930E;
    BNE .nonZeroName                                                     ;B49312;
    LDA.W #$0030                                                         ;B49314;
    BRA .draw                                                            ;B49317;


.nonZeroName:
    TAX                                                                  ;B49319;
    LDA.L $B4000C,X                                                      ;B4931A;
    CLC                                                                  ;B4931E;
    ADC.W #$0030                                                         ;B4931F;

.draw:
    JSL.L Add_Debug_Spritemap_to_OAM                                     ;B49322;
    JSR.W Draw_Debug_Enemy_Spawn_Values                                  ;B49326;
    LDA.B $91                                                            ;B49329;
    BIT.W #$0010                                                         ;B4932B;
    BEQ .checkSelect                                                     ;B4932E;
    STZ.W $185C                                                          ;B49330;
    LDA.W #$0001                                                         ;B49333;
    RTS                                                                  ;B49336;


.checkSelect:
    LDA.B $91                                                            ;B49337;
    BIT.W #$2000                                                         ;B49339;
    BEQ .checkA                                                          ;B4933C;
    INC.W $185C                                                          ;B4933E;
    STZ.W $185E                                                          ;B49341;

.checkA:
    LDA.B $91                                                            ;B49344;
    BIT.W #$0080                                                         ;B49346;
    BEQ .checkL                                                          ;B49349;
    LDX.W $1846                                                          ;B4934B;
    LDA.W EnemyData.xPosition,X                                          ;B4934E;
    STA.L $7E7020,X                                                      ;B49351;
    LDA.W EnemyData.yPosition,X                                          ;B49355;
    STA.L $7E7022,X                                                      ;B49358;

.checkL:
    LDA.B $91                                                            ;B4935C;
    BIT.W #$0020                                                         ;B4935E;
    BEQ .return                                                          ;B49361;
    INC.W $185C                                                          ;B49363;
    INC.W $185C                                                          ;B49366;

.return:
    LDA.W #$0001                                                         ;B49369;
    RTS                                                                  ;B4936C;


Draw_Debug_Enemy_Spawn_Values:
    LDX.W $1846                                                          ;B4936D;
    LDA.L $7E7020,X                                                      ;B49370;
    STA.W $0E24                                                          ;B49374;
    LDA.W #$00C8                                                         ;B49377;
    STA.W $0E20                                                          ;B4937A;
    LDA.W #$0038                                                         ;B4937D;
    STA.W $0E22                                                          ;B49380;
    JSR.W Draw4DigitHexValue                                             ;B49383;
    LDX.W $1846                                                          ;B49386;
    LDA.L $7E7022,X                                                      ;B49389;
    STA.W $0E24                                                          ;B4938D;
    LDA.W #$00C8                                                         ;B49390;
    STA.W $0E20                                                          ;B49393;
    LDA.W #$0040                                                         ;B49396;
    STA.W $0E22                                                          ;B49399;
    JSR.W Draw4DigitHexValue                                             ;B4939C;
    LDX.W $1846                                                          ;B4939F;
    LDA.L $7E7024,X                                                      ;B493A2;
    STA.W $0E24                                                          ;B493A6;
    LDA.W #$00C8                                                         ;B493A9;
    STA.W $0E20                                                          ;B493AC;
    LDA.W #$0048                                                         ;B493AF;
    STA.W $0E22                                                          ;B493B2;
    JSR.W Draw4DigitHexValue                                             ;B493B5;
    LDX.W $1846                                                          ;B493B8;
    LDA.L $7E7026,X                                                      ;B493BB;
    STA.W $0E24                                                          ;B493BF;
    LDA.W #$00C8                                                         ;B493C2;
    STA.W $0E20                                                          ;B493C5;
    LDA.W #$0050                                                         ;B493C8;
    STA.W $0E22                                                          ;B493CB;
    JSR.W Draw4DigitHexValue                                             ;B493CE;
    LDX.W $1846                                                          ;B493D1;
    LDA.L $7E7028,X                                                      ;B493D4;
    STA.W $0E24                                                          ;B493D8;
    LDA.W #$00C8                                                         ;B493DB;
    STA.W $0E20                                                          ;B493DE;
    LDA.W #$0058                                                         ;B493E1;
    STA.W $0E22                                                          ;B493E4;
    JSR.W Draw4DigitHexValue                                             ;B493E7;
    LDX.W $1846                                                          ;B493EA;
    LDA.L $7E702A,X                                                      ;B493ED;
    STA.W $0E24                                                          ;B493F1;
    LDA.W #$00C8                                                         ;B493F4;
    STA.W $0E20                                                          ;B493F7;
    LDA.W #$0060                                                         ;B493FA;
    STA.W $0E22                                                          ;B493FD;
    JSR.W Draw4DigitHexValue                                             ;B49400;
    LDX.W $1846                                                          ;B49403;
    LDA.L $7E702C,X                                                      ;B49406;
    STA.W $0E24                                                          ;B4940A;
    LDA.W #$00C8                                                         ;B4940D;
    STA.W $0E20                                                          ;B49410;
    LDA.W #$0068                                                         ;B49413;
    STA.W $0E22                                                          ;B49416;
    JSR.W Draw4DigitHexValue                                             ;B49419;
    RTS                                                                  ;B4941C;


Debug_Draw_Enemy_Set_Name:
    PHX                                                                  ;B4941D;
    LDA.W #$0A00                                                         ;B4941E;
    STA.B $26                                                            ;B49421;
    LDA.W #$00B0                                                         ;B49423;
    STA.B $14                                                            ;B49426;
    LDA.W #$0058                                                         ;B49428;
    STA.B $12                                                            ;B4942B;
    LDA.W $079F                                                          ;B4942D;
    CLC                                                                  ;B49430;
    ADC.W #$0014                                                         ;B49431;
    JSL.L Add_Debug_Spritemap_to_OAM                                     ;B49434;
    LDA.W $07D1                                                          ;B49438;
    SEC                                                                  ;B4943B;
    SBC.W #$0007                                                         ;B4943C;
    TAX                                                                  ;B4943F;
    LDA.L $B40002,X                                                      ;B49440;
    AND.W #$00FF                                                         ;B49444;
    SEC                                                                  ;B49447;
    SBC.W #$002C                                                         ;B49448;
    STA.B $16                                                            ;B4944B;
    LDA.W #$0A00                                                         ;B4944D;
    STA.B $26                                                            ;B49450;
    LDA.W #$00A8                                                         ;B49452;
    STA.B $14                                                            ;B49455;
    LDA.W #$0058                                                         ;B49457;
    STA.B $12                                                            ;B4945A;
    LDA.B $16                                                            ;B4945C;
    JSL.L Add_Debug_Spritemap_to_OAM                                     ;B4945E;
    LDA.W $07D1                                                          ;B49462;
    SEC                                                                  ;B49465;
    SBC.W #$0007                                                         ;B49466;
    TAX                                                                  ;B49469;
    LDA.L $B40004,X                                                      ;B4946A;
    AND.W #$00FF                                                         ;B4946E;
    SEC                                                                  ;B49471;
    SBC.W #$002C                                                         ;B49472;
    STA.B $16                                                            ;B49475;
    LDA.W #$0A00                                                         ;B49477;
    STA.B $26                                                            ;B4947A;
    LDA.W #$00B8                                                         ;B4947C;
    STA.B $14                                                            ;B4947F;
    LDA.W #$0058                                                         ;B49481;
    STA.B $12                                                            ;B49484;
    LDA.B $16                                                            ;B49486;
    JSL.L Add_Debug_Spritemap_to_OAM                                     ;B49488;
    LDA.W $07D1                                                          ;B4948C;
    SEC                                                                  ;B4948F;
    SBC.W #$0007                                                         ;B49490;
    TAX                                                                  ;B49493;
    LDA.L $B40005,X                                                      ;B49494;
    AND.W #$00FF                                                         ;B49498;
    SEC                                                                  ;B4949B;
    SBC.W #$002C                                                         ;B4949C;
    STA.B $16                                                            ;B4949F;
    LDA.W #$0A00                                                         ;B494A1;
    STA.B $26                                                            ;B494A4;
    LDA.W #$00C0                                                         ;B494A6;
    STA.B $14                                                            ;B494A9;
    LDA.W #$0058                                                         ;B494AB;
    STA.B $12                                                            ;B494AE;
    LDA.B $16                                                            ;B494B0;
    JSL.L Add_Debug_Spritemap_to_OAM                                     ;B494B2;
    PLX                                                                  ;B494B6;
    RTS                                                                  ;B494B7;


DebugHandler_8_EnemyDebugger_RespawnEnemy:
    PHB                                                                  ;B494B8;
    PEA.W $7E7E                                                          ;B494B9;
    PLB                                                                  ;B494BC;
    PLB                                                                  ;B494BD;
    LDA.W #$701E                                                         ;B494BE;
    CLC                                                                  ;B494C1;
    ADC.W $1846                                                          ;B494C2;
    TAX                                                                  ;B494C5;
    LDY.W $1846                                                          ;B494C6;
    JSL.L Debug_SpawnEnemy_ToEnemyIndex_inY                              ;B494C9;
    PLB                                                                  ;B494CD;
    STZ.W $185C                                                          ;B494CE;
    LDA.W #$0001                                                         ;B494D1;
    RTS                                                                  ;B494D4;


DebugHandler_9_EnemyDebugger_EnemySpawner:
    LDA.W $07D1                                                          ;B494D5;
    TAX                                                                  ;B494D8;
    STA.W $0E26                                                          ;B494D9;
    LDX.W $0E26                                                          ;B494DC;
    LDA.W #$0038                                                         ;B494DF;
    STA.W $0E2A                                                          ;B494E2;

.loop:
    LDX.W $0E26                                                          ;B494E5;
    LDA.L $B40000,X                                                      ;B494E8;
    CMP.W #$FFFF                                                         ;B494EC;
    BEQ .endLoop                                                         ;B494EF;
    TAX                                                                  ;B494F1;
    LDA.L $A0003E,X                                                      ;B494F2;
    TAX                                                                  ;B494F6;
    LDA.L $B4000C,X                                                      ;B494F7;
    CLC                                                                  ;B494FB;
    ADC.W #$0030                                                         ;B494FC;
    STA.B $16                                                            ;B494FF;
    LDA.W #$0A00                                                         ;B49501;
    STA.B $26                                                            ;B49504;
    LDA.W #$00A8                                                         ;B49506;
    STA.B $14                                                            ;B49509;
    LDA.W $0E2A                                                          ;B4950B;
    CLC                                                                  ;B4950E;
    ADC.W #$0018                                                         ;B4950F;
    STA.B $12                                                            ;B49512;
    LDA.B $16                                                            ;B49514;
    AND.W #$00FF                                                         ;B49516;
    JSL.L Add_Debug_Spritemap_to_OAM                                     ;B49519;
    LDX.W $0E26                                                          ;B4951D;
    LDA.L $B40002,X                                                      ;B49520;
    STA.W $0E24                                                          ;B49524;
    LDA.W #$00D8                                                         ;B49527;
    STA.W $0E20                                                          ;B4952A;
    LDA.W $0E2A                                                          ;B4952D;
    STA.W $0E22                                                          ;B49530;
    JSR.W Draw4DigitHexValue                                             ;B49533;
    LDA.W $0E2A                                                          ;B49536;
    CLC                                                                  ;B49539;
    ADC.W #$0008                                                         ;B4953A;
    STA.W $0E2A                                                          ;B4953D;
    LDA.W $0E26                                                          ;B49540;
    CLC                                                                  ;B49543;
    ADC.W #$0004                                                         ;B49544;
    STA.W $0E26                                                          ;B49547;
    BRA .loop                                                            ;B4954A;


.endLoop:
    LDA.W #$0A00                                                         ;B4954C;
    STA.B $26                                                            ;B4954F;
    LDA.W #$00B0                                                         ;B49551;
    STA.B $14                                                            ;B49554;
    LDA.W #$0048                                                         ;B49556;
    STA.B $12                                                            ;B49559;
    LDX.W $1846                                                          ;B4955B;
    LDA.L $7E701E,X                                                      ;B4955E;
    BNE .hasSpawnID                                                      ;B49562;
    LDA.W #$0030                                                         ;B49564;
    BRA .resolvedName                                                    ;B49567;


.hasSpawnID:
    TAX                                                                  ;B49569;
    LDA.L $A0003E,X                                                      ;B4956A;
    BNE +                                                                ;B4956E;
    LDA.W #$0030                                                         ;B49570;
    BRA .resolvedName                                                    ;B49573;


  + TAX                                                                  ;B49575;
    LDA.L $B4000C,X                                                      ;B49576;
    CLC                                                                  ;B4957A;
    ADC.W #$0030                                                         ;B4957B;

.resolvedName:
    JSL.L Add_Debug_Spritemap_to_OAM                                     ;B4957E;
    LDA.B $91                                                            ;B49582;
    BIT.W #$0400                                                         ;B49584;
    BEQ .checkTerminator                                                 ;B49587;
    LDA.W $1864                                                          ;B49589;
    CLC                                                                  ;B4958C;
    ADC.W #$0004                                                         ;B4958D;
    CMP.W #$0010                                                         ;B49590;
    BNE +                                                                ;B49593;
    LDA.W #$0000                                                         ;B49595;

  + STA.W $1864                                                          ;B49598;

.checkTerminator:
    LDA.W $07D1                                                          ;B4959B;
    CLC                                                                  ;B4959E;
    ADC.W $1864                                                          ;B4959F;
    TAX                                                                  ;B495A2;
    LDA.L $B40000,X                                                      ;B495A3;
    CMP.W #$FFFF                                                         ;B495A7;
    BNE +                                                                ;B495AA;
    STZ.W $1864                                                          ;B495AC;
    LDX.W $07D1                                                          ;B495AF;
    LDA.L $B40000,X                                                      ;B495B2;

  + STA.B $12                                                            ;B495B6;
    TAX                                                                  ;B495B8;
    LDA.L $A0003E,X                                                      ;B495B9;
    TAX                                                                  ;B495BD;
    LDA.L $B4000A,X                                                      ;B495BE;
    TAX                                                                  ;B495C2;
    STX.W $1866                                                          ;B495C3;
    LDX.W $1846                                                          ;B495C6;
    LDA.B $12                                                            ;B495C9;
    STA.L $7E701E,X                                                      ;B495CB;
    LDA.B $91                                                            ;B495CF;
    BIT.W #$0010                                                         ;B495D1;
    BEQ .checkL                                                          ;B495D4;
    STZ.W $185C                                                          ;B495D6;
    LDA.W #$0001                                                         ;B495D9;
    RTS                                                                  ;B495DC;


.checkL:
    LDA.B $91                                                            ;B495DD;
    BIT.W #$0020                                                         ;B495DF;
    BNE .checkB                                                          ;B495E2;
    LDA.W #$0001                                                         ;B495E4;
    RTS                                                                  ;B495E7;


.checkB:
    LDX.W $1866                                                          ;B495E8;
    CMP.W #$8000                                                         ;B495EB;
    BMI +                                                                ;B495EE;
    LDA.L $B40000,X                                                      ;B495F0;
    TAX                                                                  ;B495F4;
    LDA.L $A0003E,X                                                      ;B495F5;
    TAX                                                                  ;B495F9;
    LDA.L $B4000C,X                                                      ;B495FA;
    BNE +                                                                ;B495FE;
    STZ.W $185C                                                          ;B49600;
    LDA.W #$0001                                                         ;B49603;
    RTS                                                                  ;B49606;


  + LDY.W $1846                                                          ;B49607;
    LDA.W EnemyData.xPosition,Y                                          ;B4960A;
    STA.W $1868                                                          ;B4960D;
    LDA.W EnemyData.yPosition,Y                                          ;B49610;
    STA.W $186A                                                          ;B49613;
    PHB                                                                  ;B49616;
    PEA.W $B4B4                                                          ;B49617;
    PLB                                                                  ;B4961A;
    PLB                                                                  ;B4961B;
    LDY.W $1846                                                          ;B4961C;
    LDX.W $1866                                                          ;B4961F;
    JSL.L Debug_SpawnEnemy_ToEnemyIndex_inY                              ;B49622;
    PLB                                                                  ;B49626;
    LDY.W $1846                                                          ;B49627;
    LDA.W $1868                                                          ;B4962A;
    STA.W EnemyData.xPosition,Y                                          ;B4962D;
    LDA.W $186A                                                          ;B49630;
    STA.W EnemyData.yPosition,Y                                          ;B49633;
    PHX                                                                  ;B49636;
    PHY                                                                  ;B49637;
    TYX                                                                  ;B49638;
    JSL.L Record_EnemySpawnData                                          ;B49639;
    PLY                                                                  ;B4963D;
    PLX                                                                  ;B4963E;
    STZ.W $185C                                                          ;B4963F;
    LDA.W #$0001                                                         ;B49642;
    RTS                                                                  ;B49645;


Debug_HandleCursorMovement:
    LDA.B $91                                                            ;B49646;
    BIT.W #$0100                                                         ;B49648;
    BEQ .noRight                                                         ;B4964B;
    LDA.W $1860                                                          ;B4964D;
    CLC                                                                  ;B49650;
    ADC.W #$0008                                                         ;B49651;
    CMP.W #$00E0                                                         ;B49654;
    BNE +                                                                ;B49657;
    LDA.W #$00C0                                                         ;B49659;

  + STA.W $1860                                                          ;B4965C;
    BRA .return                                                          ;B4965F;


.noRight:
    BIT.W #$0200                                                         ;B49661;
    BEQ .noLeft                                                          ;B49664;
    LDA.W $1860                                                          ;B49666;
    SEC                                                                  ;B49669;
    SBC.W #$0008                                                         ;B4966A;
    CMP.W #$00B8                                                         ;B4966D;
    BNE +                                                                ;B49670;
    LDA.W #$00D8                                                         ;B49672;

  + STA.W $1860                                                          ;B49675;
    BRA .return                                                          ;B49678;


.noLeft:
    BIT.W #$0400                                                         ;B4967A;
    BEQ .noDown                                                          ;B4967D;
    LDA.W $1862                                                          ;B4967F;
    CLC                                                                  ;B49682;
    ADC.W #$0008                                                         ;B49683;
    CMP.W #$0068                                                         ;B49686;
    BNE +                                                                ;B49689;
    LDA.W #$0030                                                         ;B4968B;

  + STA.W $1862                                                          ;B4968E;
    BRA .return                                                          ;B49691;


.noDown:
    BIT.W #$0800                                                         ;B49693;
    BEQ .return                                                          ;B49696;
    LDA.W $1862                                                          ;B49698;
    SEC                                                                  ;B4969B;
    SBC.W #$0008                                                         ;B4969C;
    CMP.W #$0028                                                         ;B4969F;
    BNE .setCursorY                                                      ;B496A2;
    LDA.W #$0060                                                         ;B496A4;

.setCursorY:
    STA.W $1862                                                          ;B496A7;

.return:
    RTS                                                                  ;B496AA;


Debug_HandleDigitModification:
    LDX.W $1846                                                          ;B496AB;
    LDA.L $7E7020,X                                                      ;B496AE;
    STA.B $12                                                            ;B496B2;
    LDA.L $7E7022,X                                                      ;B496B4;
    STA.B $14                                                            ;B496B8;
    LDA.L $7E7024,X                                                      ;B496BA;
    STA.B $16                                                            ;B496BE;
    LDA.L $7E7026,X                                                      ;B496C0;
    STA.B $18                                                            ;B496C4;
    LDA.L $7E7028,X                                                      ;B496C6;
    STA.B $1A                                                            ;B496CA;
    LDA.L $7E702A,X                                                      ;B496CC;
    STA.B $1C                                                            ;B496D0;
    LDA.L $7E702C,X                                                      ;B496D2;
    STA.B $1E                                                            ;B496D6;
    LDA.B $91                                                            ;B496D8;
    BIT.W #$0040                                                         ;B496DA;
    BEQ .notNewlyPressedX                                                ;B496DD;
    LDA.W $1860                                                          ;B496DF;
    SEC                                                                  ;B496E2;
    SBC.W #$00C0                                                         ;B496E3;
    LSR A                                                                ;B496E6;
    LSR A                                                                ;B496E7;
    TAX                                                                  ;B496E8;
    LDA.W $1862                                                          ;B496E9;
    SEC                                                                  ;B496EC;
    SBC.W #$0030                                                         ;B496ED;
    LSR A                                                                ;B496F0;
    LSR A                                                                ;B496F1;
    TAY                                                                  ;B496F2;
    LDA.W $0012,Y                                                        ;B496F3;
    CLC                                                                  ;B496F6;
    ADC.W .data,X                                                        ;B496F7;
    STA.W $0012,Y                                                        ;B496FA;
    BRA +                                                                ;B496FD;


.notNewlyPressedX:
    BIT.W #$8000                                                         ;B496FF;
    BEQ +                                                                ;B49702;
    LDA.W $1860                                                          ;B49704;
    SEC                                                                  ;B49707;
    SBC.W #$00C0                                                         ;B49708;
    LSR A                                                                ;B4970B;
    LSR A                                                                ;B4970C;
    TAX                                                                  ;B4970D;
    LDA.W $1862                                                          ;B4970E;
    SEC                                                                  ;B49711;
    SBC.W #$0030                                                         ;B49712;
    LSR A                                                                ;B49715;
    LSR A                                                                ;B49716;
    TAY                                                                  ;B49717;
    LDA.W $0012,Y                                                        ;B49718;
    SEC                                                                  ;B4971B;
    SBC.W .data,X                                                        ;B4971C;
    STA.W $0012,Y                                                        ;B4971F;

  + LDX.W $1846                                                          ;B49722;
    LDA.B $12                                                            ;B49725;
    STA.L $7E7020,X                                                      ;B49727;
    LDA.B $14                                                            ;B4972B;
    STA.L $7E7022,X                                                      ;B4972D;
    LDA.B $16                                                            ;B49731;
    STA.L $7E7024,X                                                      ;B49733;
    LDA.B $18                                                            ;B49737;
    STA.L $7E7026,X                                                      ;B49739;
    LDA.B $1A                                                            ;B4973D;
    STA.L $7E7028,X                                                      ;B4973F;
    LDA.B $1C                                                            ;B49743;
    STA.L $7E702A,X                                                      ;B49745;
    LDA.B $1E                                                            ;B49749;
    STA.L $7E702C,X                                                      ;B4974B;
    RTS                                                                  ;B4974F;


.data:
    dw $1000,$0100,$0010,$0001                                           ;B49750;

DebugHandler_10_EnemyDebugger_EnemyAllocationViewer:
    LDA.B $91                                                            ;B49758;
    BIT.W #$2000                                                         ;B4975A;
    BEQ .notNewlyPressedSelect                                           ;B4975D;
    STZ.W $185C                                                          ;B4975F;
    LDA.W #$0000                                                         ;B49762;
    RTS                                                                  ;B49765;


.notNewlyPressedSelect:
    LDA.W $07D1                                                          ;B49766;
    TAX                                                                  ;B49769;
    STA.W $0E26                                                          ;B4976A;
    LDX.W $0E26                                                          ;B4976D;
    LDA.W #$0038                                                         ;B49770;
    STA.W $0E2A                                                          ;B49773;
    STZ.W $0E2C                                                          ;B49776;

.loop:
    LDX.W $0E26                                                          ;B49779;
    LDA.L $B40000,X                                                      ;B4977C;
    CMP.W #$FFFF                                                         ;B49780;
    BEQ .terminated                                                      ;B49783;
    TAX                                                                  ;B49785;
    LDA.L $A00000,X                                                      ;B49786;
    XBA                                                                  ;B4978A;
    AND.W #$00FF                                                         ;B4978B;
    LSR A                                                                ;B4978E;
    CLC                                                                  ;B4978F;
    ADC.W $0E2C                                                          ;B49790;
    STA.W $0E2C                                                          ;B49793;
    LDA.L $A0003E,X                                                      ;B49796;
    TAX                                                                  ;B4979A;
    LDA.L $B4000C,X                                                      ;B4979B;
    CLC                                                                  ;B4979F;
    ADC.W #$0030                                                         ;B497A0;
    STA.B $16                                                            ;B497A3;
    LDA.W #$0A00                                                         ;B497A5;
    STA.B $26                                                            ;B497A8;
    LDA.W #$00A8                                                         ;B497AA;
    STA.B $14                                                            ;B497AD;
    LDA.W $0E2A                                                          ;B497AF;
    CLC                                                                  ;B497B2;
    ADC.W #$0018                                                         ;B497B3;
    STA.B $12                                                            ;B497B6;
    LDA.B $16                                                            ;B497B8;
    AND.W #$00FF                                                         ;B497BA;
    JSL.L Add_Debug_Spritemap_to_OAM                                     ;B497BD;
    LDX.W $0E26                                                          ;B497C1;
    LDA.L $B40002,X                                                      ;B497C4;
    STA.W $0E24                                                          ;B497C8;
    LDA.W #$00D8                                                         ;B497CB;
    STA.W $0E20                                                          ;B497CE;
    LDA.W $0E2A                                                          ;B497D1;
    STA.W $0E22                                                          ;B497D4;
    JSR.W Draw4DigitHexValue                                             ;B497D7;
    LDA.W $0E2A                                                          ;B497DA;
    CLC                                                                  ;B497DD;
    ADC.W #$0008                                                         ;B497DE;
    STA.W $0E2A                                                          ;B497E1;
    LDA.W $0E26                                                          ;B497E4;
    CLC                                                                  ;B497E7;
    ADC.W #$0004                                                         ;B497E8;
    STA.W $0E26                                                          ;B497EB;
    BRA .loop                                                            ;B497EE;


.terminated:
    LDA.W $0E2C                                                          ;B497F0;
    STA.W $0E24                                                          ;B497F3;
    LDA.W #$00A8                                                         ;B497F6;
    STA.W $0E20                                                          ;B497F9;
    LDA.W $0E2A                                                          ;B497FC;
    STA.W $0E22                                                          ;B497FF;
    JSR.W Draw4DigitHexValue                                             ;B49802;
    LDA.W #$0000                                                         ;B49805;
    RTS                                                                  ;B49808;


DebugHandler:
    PHB                                                                  ;B49809;
    SEP #$20                                                             ;B4980A;
    LDA.B #$B4                                                           ;B4980C;
    PHA                                                                  ;B4980E;
    PLB                                                                  ;B4980F;
    REP #$30                                                             ;B49810;
    LDA.W $185C                                                          ;B49812;
    AND.W #$00FF                                                         ;B49815;
    ASL A                                                                ;B49818;
    TAX                                                                  ;B49819;
    JSR.W (.pointers,X)                                                  ;B4981A;
    PLB                                                                  ;B4981D;
    RTL                                                                  ;B4981E;


.pointers:
    dw DebugHandler_0_Default                                            ;B4981F;
    dw DebugHandler_1_PaletteViewer_SpritePalettes                       ;B49821;
    dw DebugHandler_2_PaletteViewer_BGPalettes                           ;B49823;
    dw DebugHandler_3_SpriteTilesViewer_SecondHalf                       ;B49825;
    dw DebugHandler_4_SpriteTilesViewer_FirstHalf                        ;B49827;
    dw DebugHandler_5_EnemyDebugger_Initialize                           ;B49829;
    dw DebugHandler_6_EnemyDebugger_EnemyMover                           ;B4982B;
    dw DebugHandler_7_EnemyDebugger_EnemySpawnDataEditor                 ;B4982D;
    dw DebugHandler_8_EnemyDebugger_RespawnEnemy                         ;B4982F;
    dw DebugHandler_9_EnemyDebugger_EnemySpawner                         ;B49831;
    dw DebugHandler_A_EnemyDebugger_RAMViewer_0                          ;B49833;
    dw DebugHandler_B_EnemyDebugger_RAMViewer_1                          ;B49835;
    dw DebugHandler_C_EnemyDebugger_RAMViewer_2                          ;B49837;
    dw DebugHandler_D_EnemyDebugger_RAMViewer_3                          ;B49839;
    dw DebugHandler_E_EnemyDebugger_RAMViewer_4                          ;B4983B;
    dw DebugHandler_F_EnemyDebugger_RAMViewer_5                          ;B4983D;
    dw DebugHandler_10_EnemyDebugger_EnemyAllocationViewer               ;B4983F;

DebugHandler_4_SpriteTilesViewer_FirstHalf:
    LDA.W #$0A00                                                         ;B49841;
    STA.B $26                                                            ;B49844;
    LDA.W #$0080                                                         ;B49846;
    STA.B $14                                                            ;B49849;
    LDA.W #$0080                                                         ;B4984B;
    STA.B $12                                                            ;B4984E;
    LDA.W #$0003                                                         ;B49850;
    JSL.L Add_Debug_Spritemap_to_OAM                                     ;B49853;
    LDA.W $05C5                                                          ;B49857;
    BIT.W #$0040                                                         ;B4985A;
    BNE .resetIndex                                                      ;B4985D;
    LDA.W #$0001                                                         ;B4985F;
    RTS                                                                  ;B49862;


.resetIndex:
    STZ.W $185C                                                          ;B49863;
    LDA.W #$0001                                                         ;B49866;
    RTS                                                                  ;B49869;


DebugHandler_3_SpriteTilesViewer_SecondHalf:
    LDA.W $05C5                                                          ;B4986A;
    BIT.W #$0080                                                         ;B4986D;
    BEQ .noChange                                                        ;B49870;
    LDA.W $185A                                                          ;B49872;
    CMP.W #$0000                                                         ;B49875;
    BNE +                                                                ;B49878;
    LDA.W #$0200                                                         ;B4987A;
    STA.W $185A                                                          ;B4987D;
    BRA .merge                                                           ;B49880;


  + CMP.W #$0200                                                         ;B49882;
    BNE +                                                                ;B49885;
    LDA.W #$0400                                                         ;B49887;
    STA.W $185A                                                          ;B4988A;
    BRA .merge                                                           ;B4988D;


  + CMP.W #$0400                                                         ;B4988F;
    BNE +                                                                ;B49892;
    LDA.W #$0600                                                         ;B49894;
    STA.W $185A                                                          ;B49897;
    BRA .merge                                                           ;B4989A;


  + CMP.W #$0600                                                         ;B4989C;
    BNE +                                                                ;B4989F;
    LDA.W #$0E00                                                         ;B498A1;
    STA.W $185A                                                          ;B498A4;
    BRA .merge                                                           ;B498A7;


  + LDA.W #$0000                                                         ;B498A9;
    STA.W $185A                                                          ;B498AC;
    BRA .merge                                                           ;B498AF;


.noChange:
    LDA.W $185A                                                          ;B498B1;

.merge:
    STA.B $26                                                            ;B498B4;
    LDA.W #$0080                                                         ;B498B6;
    STA.B $14                                                            ;B498B9;
    LDA.W #$0080                                                         ;B498BB;
    STA.B $12                                                            ;B498BE;
    LDA.W #$0002                                                         ;B498C0;
    JSL.L Add_Debug_Spritemap_to_OAM                                     ;B498C3;
    LDA.W $05C5                                                          ;B498C7;
    BIT.W #$0040                                                         ;B498CA;
    BNE .incIndex                                                        ;B498CD;
    LDA.W #$0001                                                         ;B498CF;
    RTS                                                                  ;B498D2;


.incIndex:
    INC.W $185C                                                          ;B498D3;
    LDA.W #$0001                                                         ;B498D6;
    RTS                                                                  ;B498D9;


DebugHandler_1_PaletteViewer_SpritePalettes:
    LDA.W #$0000                                                         ;B498DA;
    STA.B $26                                                            ;B498DD;
    LDA.W #$0060                                                         ;B498DF;
    STA.B $14                                                            ;B498E2;
    STA.B $12                                                            ;B498E4;
    LDA.W #$0000                                                         ;B498E6;
    JSL.L Add_Debug_Spritemap_to_OAM                                     ;B498E9;
    LDA.W #$0000                                                         ;B498ED;
    STA.B $26                                                            ;B498F0;
    LDA.W #$00A0                                                         ;B498F2;
    STA.B $14                                                            ;B498F5;
    LDA.W #$0060                                                         ;B498F7;
    STA.B $12                                                            ;B498FA;
    LDA.W #$0001                                                         ;B498FC;
    JSL.L Add_Debug_Spritemap_to_OAM                                     ;B498FF;
    LDA.W $05C5                                                          ;B49903;
    BIT.W #$0080                                                         ;B49906;
    BNE .setupLoop                                                       ;B49909;
    LDA.W #$0001                                                         ;B4990B;
    RTS                                                                  ;B4990E;


.setupLoop:
    LDX.W #$00FE                                                         ;B4990F;

.loop:
    LDA.L $7EC000,X                                                      ;B49912;
    STA.L $7EC100,X                                                      ;B49916;
    DEX                                                                  ;B4991A;
    DEX                                                                  ;B4991B;
    BNE .loop                                                            ;B4991C;
    INC.W $185C                                                          ;B4991E;
    LDA.W #$0001                                                         ;B49921;
    RTS                                                                  ;B49924;


DebugHandler_2_PaletteViewer_BGPalettes:
    LDA.W #$0000                                                         ;B49925;
    STA.B $26                                                            ;B49928;
    LDA.W #$0060                                                         ;B4992A;
    STA.B $14                                                            ;B4992D;
    STA.B $12                                                            ;B4992F;
    LDA.W #$0000                                                         ;B49931;
    JSL.L Add_Debug_Spritemap_to_OAM                                     ;B49934;
    LDA.W #$0000                                                         ;B49938;
    STA.B $26                                                            ;B4993B;
    LDA.W #$00A0                                                         ;B4993D;
    STA.B $14                                                            ;B49940;
    LDA.W #$0060                                                         ;B49942;
    STA.B $12                                                            ;B49945;
    LDA.W #$0001                                                         ;B49947;
    JSL.L Add_Debug_Spritemap_to_OAM                                     ;B4994A;
    LDA.W $05C5                                                          ;B4994E;
    BIT.W #$0080                                                         ;B49951;
    BNE .resetIndex                                                      ;B49954;
    LDA.W #$0001                                                         ;B49956;
    RTS                                                                  ;B49959;


.resetIndex:
    STZ.W $185C                                                          ;B4995A;
    LDA.W #$0001                                                         ;B4995D;
    RTS                                                                  ;B49960;


DebugHandler_0_Default:
    LDA.B $91                                                            ;B49961;
    BIT.W #$1000                                                         ;B49963;
    BEQ .checkL                                                          ;B49966;
    LDX.W #$001D                                                         ;B49968;
    STX.W $0998                                                          ;B4996B;
    STZ.W $0727                                                          ;B4996E;

.checkL:
    LDA.B $91                                                            ;B49971;
    BIT.W #$0020                                                         ;B49973;
    BEQ .notNewlyPressedStartL                                           ;B49976;
    LDA.W $185E                                                          ;B49978;
    EOR.W #$0001                                                         ;B4997B;
    STA.W $185E                                                          ;B4997E;

.notNewlyPressedStartL:
    LDA.W $05C5                                                          ;B49981;
    BIT.W #$0080                                                         ;B49984;
    BNE .SelectLA                                                        ;B49987;
    LDA.W $05C5                                                          ;B49989;
    BIT.W #$0040                                                         ;B4998C;
    BNE .SelectLX                                                        ;B4998F;
    LDA.B $91                                                            ;B49991;
    AND.W #$0010                                                         ;B49993;
    BNE .R                                                               ;B49996;
    LDA.B $91                                                            ;B49998;
    BIT.W #$2000                                                         ;B4999A;
    BNE .Select                                                          ;B4999D;
    LDA.B $91                                                            ;B4999F;
    BIT.W #$0080                                                         ;B499A1;
    BNE .A                                                               ;B499A4;
    STZ.W $185C                                                          ;B499A6;
    LDA.W #$0000                                                         ;B499A9;
    RTS                                                                  ;B499AC;


.A:
    LDY.W #$0001                                                         ;B499AD;
    LDA.W $0E12                                                          ;B499B0;
    BEQ .toggle                                                          ;B499B3;
    LDY.W #$0000                                                         ;B499B5;

.toggle:
    TYA                                                                  ;B499B8;
    STA.W $0E12                                                          ;B499B9;
    LDA.W #$0000                                                         ;B499BC;
    RTS                                                                  ;B499BF;


.Select:
    LDA.W #$0010                                                         ;B499C0;
    STA.W $185C                                                          ;B499C3;
    LDA.W #$0000                                                         ;B499C6;
    RTS                                                                  ;B499C9;


.SelectLX:
    INC.W $185C                                                          ;B499CA;
    INC.W $185C                                                          ;B499CD;
    INC.W $185C                                                          ;B499D0;
    LDA.W #$0001                                                         ;B499D3;
    RTS                                                                  ;B499D6;


.R:
    INC.W $185C                                                          ;B499D7;
    INC.W $185C                                                          ;B499DA;
    INC.W $185C                                                          ;B499DD;
    INC.W $185C                                                          ;B499E0;
    INC.W $185C                                                          ;B499E3;
    LDA.W #$0000                                                         ;B499E6;
    RTS                                                                  ;B499E9;


.SelectLA:
    SEP #$20                                                             ;B499EA;
    LDA.B #$80                                                           ;B499EC;
    STA.W $2100                                                          ;B499EE;
    LDA.B #$00                                                           ;B499F1;
    STA.W $2116                                                          ;B499F3;
    LDA.B #$70                                                           ;B499F6;
    STA.W $2117                                                          ;B499F8;
    LDA.B #$80                                                           ;B499FB;
    STA.W $2115                                                          ;B499FD;
    JSL.L SetupHDMATransfer                                              ;B49A00;
    db $01,$01,$18                                                       ;B49A04;
    dl Tiles_Debug_PaletteViewer                                         ;B49A07;
    dw $1000                                                             ;B49A0A;
    LDA.B #$02                                                           ;B49A0C;
    STA.W HW_MDMAEN                                                      ;B49A0E;
    STZ.W $2100                                                          ;B49A11;
    REP #$20                                                             ;B49A14;
    INC.W $185C                                                          ;B49A16;
    LDA.W #$0001                                                         ;B49A19;
    RTS                                                                  ;B49A1C;


DebugHandler_5_EnemyDebugger_Initialize:
    SEP #$20                                                             ;B49A1D;
    LDA.B #$80                                                           ;B49A1F;
    STA.W $2100                                                          ;B49A21;
    LDA.B #$00                                                           ;B49A24;
    STA.W $2116                                                          ;B49A26;
    LDA.B #$6B                                                           ;B49A29;
    STA.W $2117                                                          ;B49A2B;
    LDA.B #$80                                                           ;B49A2E;
    STA.W $2115                                                          ;B49A30;
    JSL.L SetupHDMATransfer                                              ;B49A33;
    db $01,$01,$18                                                       ;B49A37;
    dl Tiles_DebuggerFont                                                ;B49A3A;
    dw $0A00                                                             ;B49A3D;
    LDA.B #$02                                                           ;B49A3F;
    STA.W HW_MDMAEN                                                      ;B49A41;
    STZ.W $2100                                                          ;B49A44;
    REP #$20                                                             ;B49A47;
    LDA.W #$00C0                                                         ;B49A49;
    STA.W $1860                                                          ;B49A4C;
    LDA.W #$0030                                                         ;B49A4F;
    STA.W $1862                                                          ;B49A52;
    INC.W $185C                                                          ;B49A55;
    RTS                                                                  ;B49A58;


DebugHandler_6_EnemyDebugger_EnemyMover:
    LDA.B $91                                                            ;B49A59;
    BIT.W #$0010                                                         ;B49A5B;
    BEQ .checkSelect                                                     ;B49A5E;
    INC.W $185C                                                          ;B49A60;
    LDA.W #$0000                                                         ;B49A63;
    RTS                                                                  ;B49A66;


.checkSelect:
    LDA.B $91                                                            ;B49A67;
    BIT.W #$2000                                                         ;B49A69;
    BEQ .checkA                                                          ;B49A6C;
    LDA.B $8D                                                            ;B49A6E;
    BIT.W #$8000                                                         ;B49A70;
    BNE .pressingB                                                       ;B49A73;
    LDA.W $1846                                                          ;B49A75;
    CLC                                                                  ;B49A78;
    ADC.W #$0040                                                         ;B49A79;
    CMP.W #$0800                                                         ;B49A7C;
    BMI +                                                                ;B49A7F;
    LDA.W #$0000                                                         ;B49A81;

  + STA.W $1846                                                          ;B49A84;
    BRA .checkA                                                          ;B49A87;


.pressingB:
    LDA.W $1846                                                          ;B49A89;
    SEC                                                                  ;B49A8C;
    SBC.W #$0040                                                         ;B49A8D;
    BNE +                                                                ;B49A90;
    LDA.W #$07C0                                                         ;B49A92;

  + STA.W $1846                                                          ;B49A95;

.checkA:
    LDA.B $91                                                            ;B49A98;
    BIT.W #$0080                                                         ;B49A9A;
    BEQ .checkX                                                          ;B49A9D;
    LDX.W $1846                                                          ;B49A9F;
    LDA.W $0AF6                                                          ;B49AA2;
    CLC                                                                  ;B49AA5;
    ADC.W #$0020                                                         ;B49AA6;
    STA.W EnemyData.xPosition,X                                          ;B49AA9;
    LDA.W $0AFA                                                          ;B49AAC;
    STA.W EnemyData.yPosition,X                                          ;B49AAF;

.checkX:
    LDX.W $1846                                                          ;B49AB2;
    LDA.B $8D                                                            ;B49AB5;
    BIT.W #$0040                                                         ;B49AB7;
    BEQ .moveWithDpad                                                    ;B49ABA;
    JSL.L Debug_MoveEnemyWithDpad_4PixelsPerFrame                        ;B49ABC;
    BRA +                                                                ;B49AC0;


.moveWithDpad:
    JSL.L Debug_MoveEnemyWithDpad_QuarterPixelPerFrame                   ;B49AC2;

  + LDX.W $1846                                                          ;B49AC6;
    LDA.W EnemyData.xPosition,X                                          ;B49AC9;
    CMP.W $0911                                                          ;B49ACC;
    BMI +                                                                ;B49ACF;
    LDA.W $0911                                                          ;B49AD1;
    CLC                                                                  ;B49AD4;
    ADC.W #$0100                                                         ;B49AD5;
    CMP.W EnemyData.xPosition,X                                          ;B49AD8;
    BMI +                                                                ;B49ADB;
    LDA.W EnemyData.yPosition,X                                          ;B49ADD;
    CMP.W $0915                                                          ;B49AE0;
    BMI +                                                                ;B49AE3;
    LDA.W $0915                                                          ;B49AE5;
    CLC                                                                  ;B49AE8;
    ADC.W #$0100                                                         ;B49AE9;
    CMP.W EnemyData.yPosition,X                                          ;B49AEC;
    BMI +                                                                ;B49AEF;
    LDX.W $1846                                                          ;B49AF1;
    LDA.W EnemyData.xPosition,X                                          ;B49AF4;
    SEC                                                                  ;B49AF7;
    SBC.W $0911                                                          ;B49AF8;
    STA.B $14                                                            ;B49AFB;
    STA.W $0E22                                                          ;B49AFD;
    LDA.W EnemyData.yPosition,X                                          ;B49B00;
    SEC                                                                  ;B49B03;
    SBC.W $0915                                                          ;B49B04;
    STA.B $12                                                            ;B49B07;
    STA.W $0E20                                                          ;B49B09;
    LDA.W $0E22                                                          ;B49B0C;
    CLC                                                                  ;B49B0F;
    ADC.W #$0020                                                         ;B49B10;
    STA.B $14                                                            ;B49B13;
    LDA.W $0E20                                                          ;B49B15;
    CLC                                                                  ;B49B18;
    ADC.W #$0004                                                         ;B49B19;
    STA.B $12                                                            ;B49B1C;
    LDA.W #$0A00                                                         ;B49B1E;
    STA.B $26                                                            ;B49B21;
    LDA.W #$0025                                                         ;B49B23;
    JSL.L Add_Debug_Spritemap_to_OAM                                     ;B49B26;

  + LDA.W #$00B0                                                         ;B49B2A;
    STA.B $14                                                            ;B49B2D;
    LDA.W #$0050                                                         ;B49B2F;
    STA.B $12                                                            ;B49B32;
    LDA.W #$0A00                                                         ;B49B34;
    STA.B $26                                                            ;B49B37;
    LDA.W #$0027                                                         ;B49B39;
    JSL.L Add_Debug_Spritemap_to_OAM                                     ;B49B3C;
    LDX.W $1846                                                          ;B49B40;
    LDA.W EnemyData.xPosition,X                                          ;B49B43;
    STA.W $0E24                                                          ;B49B46;
    LDA.W #$00E0                                                         ;B49B49;
    STA.W $0E20                                                          ;B49B4C;
    LDA.W #$0038                                                         ;B49B4F;
    STA.W $0E22                                                          ;B49B52;
    JSR.W Draw4DigitHexValue                                             ;B49B55;
    LDX.W $1846                                                          ;B49B58;
    LDA.W EnemyData.yPosition,X                                          ;B49B5B;
    STA.W $0E24                                                          ;B49B5E;
    LDA.W #$00E0                                                         ;B49B61;
    STA.W $0E20                                                          ;B49B64;
    LDA.W #$0040                                                         ;B49B67;
    STA.W $0E22                                                          ;B49B6A;
    JSR.W Draw4DigitHexValue                                             ;B49B6D;
    LDX.W $1846                                                          ;B49B70;
    LDA.W EnemyData.health,X                                             ;B49B73;
    STA.W $0E24                                                          ;B49B76;
    LDA.W #$00E0                                                         ;B49B79;
    STA.W $0E20                                                          ;B49B7C;
    LDA.W #$0048                                                         ;B49B7F;
    STA.W $0E22                                                          ;B49B82;
    JSR.W Draw4DigitHexValue                                             ;B49B85;
    LDA.W $1846                                                          ;B49B88;
    STA.W $0E24                                                          ;B49B8B;
    LDA.W #$00E0                                                         ;B49B8E;
    STA.W $0E20                                                          ;B49B91;
    LDA.W #$0050                                                         ;B49B94;
    STA.W $0E22                                                          ;B49B97;
    JSR.W Draw4DigitHexValue                                             ;B49B9A;
    LDA.W #$0A00                                                         ;B49B9D;
    STA.B $26                                                            ;B49BA0;
    LDA.W #$00B0                                                         ;B49BA2;
    STA.B $14                                                            ;B49BA5;
    LDA.W #$0048                                                         ;B49BA7;
    STA.B $12                                                            ;B49BAA;
    LDX.W $1846                                                          ;B49BAC;
    LDA.W EnemyData.pId,X                                                ;B49BAF;
    TAX                                                                  ;B49BB2;
    LDA.L $A0003E,X                                                      ;B49BB3;
    BNE .debugName                                                       ;B49BB7;
    LDA.W #$0030                                                         ;B49BB9;
    BRA .draw                                                            ;B49BBC;


.debugName:
    TAX                                                                  ;B49BBE;
    LDA.L $B4000C,X                                                      ;B49BBF;
    CLC                                                                  ;B49BC3;
    ADC.W #$0030                                                         ;B49BC4;

.draw:
    JSL.L Add_Debug_Spritemap_to_OAM                                     ;B49BC7;
    JSR.W Debug_Draw_Enemy_Set_Name                                      ;B49BCB;
    STZ.W $1864                                                          ;B49BCE;
    LDA.W #$0000                                                         ;B49BD1;
    RTS                                                                  ;B49BD4;


DebugHandler_A_EnemyDebugger_RAMViewer_0:
    LDA.B $91                                                            ;B49BD5;
    BIT.W #$0010                                                         ;B49BD7;
    BEQ +                                                                ;B49BDA;
    INC.W $185C                                                          ;B49BDC;
    LDA.W #$0000                                                         ;B49BDF;
    RTS                                                                  ;B49BE2;


  + LDA.W #$00B0                                                         ;B49BE3;
    STA.B $14                                                            ;B49BE6;
    LDA.W #$0050                                                         ;B49BE8;
    STA.B $12                                                            ;B49BEB;
    LDA.W #$0A00                                                         ;B49BED;
    STA.B $26                                                            ;B49BF0;
    LDA.W #$0029                                                         ;B49BF2;
    JSL.L Add_Debug_Spritemap_to_OAM                                     ;B49BF5;
    LDX.W $1846                                                          ;B49BF9;
    LDA.W EnemyData.frameCounter,X                                       ;B49BFC;
    STA.W $0E24                                                          ;B49BFF;
    LDA.W #$00E0                                                         ;B49C02;
    STA.W $0E20                                                          ;B49C05;
    LDA.W #$0038                                                         ;B49C08;
    STA.W $0E22                                                          ;B49C0B;
    JSR.W Draw4DigitHexValue                                             ;B49C0E;
    LDX.W $1846                                                          ;B49C11;
    LDA.W EnemyData.ai,X                                                 ;B49C14;
    STA.W $0E24                                                          ;B49C17;
    LDA.W #$00E0                                                         ;B49C1A;
    STA.W $0E20                                                          ;B49C1D;
    LDA.W #$0040                                                         ;B49C20;
    STA.W $0E22                                                          ;B49C23;
    JSR.W Draw4DigitHexValue                                             ;B49C26;
    LDX.W $1846                                                          ;B49C29;
    LDA.W EnemyData.pId,X                                                ;B49C2C;
    STA.W $0E24                                                          ;B49C2F;
    LDA.W #$00E0                                                         ;B49C32;
    STA.W $0E20                                                          ;B49C35;
    LDA.W #$0048                                                         ;B49C38;
    STA.W $0E22                                                          ;B49C3B;
    JSR.W Draw4DigitHexValue                                             ;B49C3E;
    LDX.W $1846                                                          ;B49C41;
    LDA.W EnemyData.bank,X                                               ;B49C44;
    STA.W $0E24                                                          ;B49C47;
    LDA.W #$00E0                                                         ;B49C4A;
    STA.W $0E20                                                          ;B49C4D;
    LDA.W #$0050                                                         ;B49C50;
    STA.W $0E22                                                          ;B49C53;
    JSR.W Draw4DigitHexValue                                             ;B49C56;
    LDA.W #$0000                                                         ;B49C59;
    RTS                                                                  ;B49C5C;


DebugHandler_B_EnemyDebugger_RAMViewer_1:
    LDA.B $91                                                            ;B49C5D;
    BIT.W #$0010                                                         ;B49C5F;
    BEQ +                                                                ;B49C62;
    INC.W $185C                                                          ;B49C64;
    LDA.W #$0000                                                         ;B49C67;
    RTS                                                                  ;B49C6A;


  + LDA.W #$00B0                                                         ;B49C6B;
    STA.B $14                                                            ;B49C6E;
    LDA.W #$0050                                                         ;B49C70;
    STA.B $12                                                            ;B49C73;
    LDA.W #$0A00                                                         ;B49C75;
    STA.B $26                                                            ;B49C78;
    LDA.W #$002A                                                         ;B49C7A;
    JSL.L Add_Debug_Spritemap_to_OAM                                     ;B49C7D;
    LDX.W $1846                                                          ;B49C81;
    LDA.W EnemyData.properties,X                                         ;B49C84;
    STA.W $0E24                                                          ;B49C87;
    LDA.W #$00E0                                                         ;B49C8A;
    STA.W $0E20                                                          ;B49C8D;
    LDA.W #$0038                                                         ;B49C90;
    STA.W $0E22                                                          ;B49C93;
    JSR.W Draw4DigitHexValue                                             ;B49C96;
    LDX.W $1846                                                          ;B49C99;
    LDA.W EnemyData.properties2,X                                        ;B49C9C;
    STA.W $0E24                                                          ;B49C9F;
    LDA.W #$00E0                                                         ;B49CA2;
    STA.W $0E20                                                          ;B49CA5;
    LDA.W #$0040                                                         ;B49CA8;
    STA.W $0E22                                                          ;B49CAB;
    JSR.W Draw4DigitHexValue                                             ;B49CAE;
    LDX.W $1846                                                          ;B49CB1;
    LDA.W EnemyData.palette,X                                            ;B49CB4;
    STA.W $0E24                                                          ;B49CB7;
    LDA.W #$00E0                                                         ;B49CBA;
    STA.W $0E20                                                          ;B49CBD;
    LDA.W #$0048                                                         ;B49CC0;
    STA.W $0E22                                                          ;B49CC3;
    JSR.W Draw4DigitHexValue                                             ;B49CC6;
    LDX.W $1846                                                          ;B49CC9;
    LDA.W EnemyData.gfxOffset,X                                          ;B49CCC;
    STA.W $0E24                                                          ;B49CCF;
    LDA.W #$00E0                                                         ;B49CD2;
    STA.W $0E20                                                          ;B49CD5;
    LDA.W #$0050                                                         ;B49CD8;
    STA.W $0E22                                                          ;B49CDB;
    JSR.W Draw4DigitHexValue                                             ;B49CDE;
    LDA.W #$0000                                                         ;B49CE1;
    RTS                                                                  ;B49CE4;


DebugHandler_C_EnemyDebugger_RAMViewer_2:
    LDA.B $91                                                            ;B49CE5;
    BIT.W #$0010                                                         ;B49CE7;
    BEQ +                                                                ;B49CEA;
    INC.W $185C                                                          ;B49CEC;
    LDA.W #$0000                                                         ;B49CEF;
    RTS                                                                  ;B49CF2;


  + LDA.W #$00B0                                                         ;B49CF3;
    STA.B $14                                                            ;B49CF6;
    LDA.W #$0050                                                         ;B49CF8;
    STA.B $12                                                            ;B49CFB;
    LDA.W #$0A00                                                         ;B49CFD;
    STA.B $26                                                            ;B49D00;
    LDA.W #$002B                                                         ;B49D02;
    JSL.L Add_Debug_Spritemap_to_OAM                                     ;B49D05;
    LDX.W $1846                                                          ;B49D09;
    LDA.W EnemyData.pInstList,X                                          ;B49D0C;
    STA.W $0E24                                                          ;B49D0F;
    LDA.W #$00E0                                                         ;B49D12;
    STA.W $0E20                                                          ;B49D15;
    LDA.W #$0038                                                         ;B49D18;
    STA.W $0E22                                                          ;B49D1B;
    JSR.W Draw4DigitHexValue                                             ;B49D1E;
    LDX.W $1846                                                          ;B49D21;
    LDA.W EnemyData.instTimer,X                                          ;B49D24;
    STA.W $0E24                                                          ;B49D27;
    LDA.W #$00E0                                                         ;B49D2A;
    STA.W $0E20                                                          ;B49D2D;
    LDA.W #$0040                                                         ;B49D30;
    STA.W $0E22                                                          ;B49D33;
    JSR.W Draw4DigitHexValue                                             ;B49D36;
    LDX.W $1846                                                          ;B49D39;
    LDA.W EnemyData.loopCounter,X                                        ;B49D3C;
    STA.W $0E24                                                          ;B49D3F;
    LDA.W #$00E0                                                         ;B49D42;
    STA.W $0E20                                                          ;B49D45;
    LDA.W #$0048                                                         ;B49D48;
    STA.W $0E22                                                          ;B49D4B;
    JSR.W Draw4DigitHexValue                                             ;B49D4E;
    LDX.W $1846                                                          ;B49D51;
    LDA.W EnemyData.pSpritemap,X                                         ;B49D54;
    STA.W $0E24                                                          ;B49D57;
    LDA.W #$00E0                                                         ;B49D5A;
    STA.W $0E20                                                          ;B49D5D;
    LDA.W #$0050                                                         ;B49D60;
    STA.W $0E22                                                          ;B49D63;
    JSR.W Draw4DigitHexValue                                             ;B49D66;
    LDA.W #$0000                                                         ;B49D69;
    RTS                                                                  ;B49D6C;


DebugHandler_D_EnemyDebugger_RAMViewer_3:
    LDA.B $91                                                            ;B49D6D;
    BIT.W #$0010                                                         ;B49D6F;
    BEQ +                                                                ;B49D72;
    INC.W $185C                                                          ;B49D74;
    LDA.W #$0000                                                         ;B49D77;
    RTS                                                                  ;B49D7A;


  + LDA.W #$00B0                                                         ;B49D7B;
    STA.B $14                                                            ;B49D7E;
    LDA.W #$0050                                                         ;B49D80;
    STA.B $12                                                            ;B49D83;
    LDA.W #$0A00                                                         ;B49D85;
    STA.B $26                                                            ;B49D88;
    LDA.W #$002C                                                         ;B49D8A;
    JSL.L Add_Debug_Spritemap_to_OAM                                     ;B49D8D;
    LDX.W $1846                                                          ;B49D91;
    LDA.W EnemyData.flashTimer,X                                         ;B49D94;
    STA.W $0E24                                                          ;B49D97;
    LDA.W #$00E0                                                         ;B49D9A;
    STA.W $0E20                                                          ;B49D9D;
    LDA.W #$0038                                                         ;B49DA0;
    STA.W $0E22                                                          ;B49DA3;
    JSR.W Draw4DigitHexValue                                             ;B49DA6;
    LDX.W $1846                                                          ;B49DA9;
    LDA.W EnemyData.freezeTimer,X                                        ;B49DAC;
    STA.W $0E24                                                          ;B49DAF;
    LDA.W #$00E0                                                         ;B49DB2;
    STA.W $0E20                                                          ;B49DB5;
    LDA.W #$0040                                                         ;B49DB8;
    STA.W $0E22                                                          ;B49DBB;
    JSR.W Draw4DigitHexValue                                             ;B49DBE;
    LDX.W $1846                                                          ;B49DC1;
    LDA.W EnemyData.invincibilityTimer,X                                 ;B49DC4;
    STA.W $0E24                                                          ;B49DC7;
    LDA.W #$00E0                                                         ;B49DCA;
    STA.W $0E20                                                          ;B49DCD;
    LDA.W #$0048                                                         ;B49DD0;
    STA.W $0E22                                                          ;B49DD3;
    JSR.W Draw4DigitHexValue                                             ;B49DD6;
    LDX.W $1846                                                          ;B49DD9;
    LDA.W EnemyData.shakeTimer,X                                         ;B49DDC;
    STA.W $0E24                                                          ;B49DDF;
    LDA.W #$00E0                                                         ;B49DE2;
    STA.W $0E20                                                          ;B49DE5;
    LDA.W #$0050                                                         ;B49DE8;
    STA.W $0E22                                                          ;B49DEB;
    JSR.W Draw4DigitHexValue                                             ;B49DEE;
    LDA.W #$0000                                                         ;B49DF1;
    RTS                                                                  ;B49DF4;


DebugHandler_E_EnemyDebugger_RAMViewer_4:
    LDA.B $91                                                            ;B49DF5;
    BIT.W #$0010                                                         ;B49DF7;
    BEQ +                                                                ;B49DFA;
    INC.W $185C                                                          ;B49DFC;
    LDA.W #$0000                                                         ;B49DFF;
    RTS                                                                  ;B49E02;


  + LDA.W #$00B0                                                         ;B49E03;
    STA.B $14                                                            ;B49E06;
    LDA.W #$0050                                                         ;B49E08;
    STA.B $12                                                            ;B49E0B;
    LDA.W #$0A00                                                         ;B49E0D;
    STA.B $26                                                            ;B49E10;
    LDA.W #$002D                                                         ;B49E12;
    JSL.L Add_Debug_Spritemap_to_OAM                                     ;B49E15;
    LDX.W $1846                                                          ;B49E19;
    LDA.W EnemyData.work0,X                                              ;B49E1C;
    STA.W $0E24                                                          ;B49E1F;
    LDA.W #$00E0                                                         ;B49E22;
    STA.W $0E20                                                          ;B49E25;
    LDA.W #$0038                                                         ;B49E28;
    STA.W $0E22                                                          ;B49E2B;
    JSR.W Draw4DigitHexValue                                             ;B49E2E;
    LDX.W $1846                                                          ;B49E31;
    LDA.W EnemyData.work1,X                                              ;B49E34;
    STA.W $0E24                                                          ;B49E37;
    LDA.W #$00E0                                                         ;B49E3A;
    STA.W $0E20                                                          ;B49E3D;
    LDA.W #$0040                                                         ;B49E40;
    STA.W $0E22                                                          ;B49E43;
    JSR.W Draw4DigitHexValue                                             ;B49E46;
    LDX.W $1846                                                          ;B49E49;
    LDA.W EnemyData.work2,X                                              ;B49E4C;
    STA.W $0E24                                                          ;B49E4F;
    LDA.W #$00E0                                                         ;B49E52;
    STA.W $0E20                                                          ;B49E55;
    LDA.W #$0048                                                         ;B49E58;
    STA.W $0E22                                                          ;B49E5B;
    JSR.W Draw4DigitHexValue                                             ;B49E5E;
    LDX.W $1846                                                          ;B49E61;
    LDA.W EnemyData.work3,X                                              ;B49E64;
    STA.W $0E24                                                          ;B49E67;
    LDA.W #$00E0                                                         ;B49E6A;
    STA.W $0E20                                                          ;B49E6D;
    LDA.W #$0050                                                         ;B49E70;
    STA.W $0E22                                                          ;B49E73;
    JSR.W Draw4DigitHexValue                                             ;B49E76;
    LDA.W #$0000                                                         ;B49E79;
    RTS                                                                  ;B49E7C;


DebugHandler_F_EnemyDebugger_RAMViewer_5:
    LDA.B $91                                                            ;B49E7D;
    BIT.W #$0010                                                         ;B49E7F;
    BEQ +                                                                ;B49E82;
    INC.W $185C                                                          ;B49E84;
    LDA.W #$0000                                                         ;B49E87;
    RTS                                                                  ;B49E8A;


  + LDA.W #$00B0                                                         ;B49E8B;
    STA.B $14                                                            ;B49E8E;
    LDA.W #$0050                                                         ;B49E90;
    STA.B $12                                                            ;B49E93;
    LDA.W #$0A00                                                         ;B49E95;
    STA.B $26                                                            ;B49E98;
    LDA.W #$002E                                                         ;B49E9A;
    JSL.L Add_Debug_Spritemap_to_OAM                                     ;B49E9D;
    LDX.W $1846                                                          ;B49EA1;
    LDA.W EnemyData.work4,X                                              ;B49EA4;
    STA.W $0E24                                                          ;B49EA7;
    LDA.W #$00E0                                                         ;B49EAA;
    STA.W $0E20                                                          ;B49EAD;
    LDA.W #$0038                                                         ;B49EB0;
    STA.W $0E22                                                          ;B49EB3;
    JSR.W Draw4DigitHexValue                                             ;B49EB6;
    LDX.W $1846                                                          ;B49EB9;
    LDA.W EnemyData.work5,X                                              ;B49EBC;
    STA.W $0E24                                                          ;B49EBF;
    LDA.W #$00E0                                                         ;B49EC2;
    STA.W $0E20                                                          ;B49EC5;
    LDA.W #$0040                                                         ;B49EC8;
    STA.W $0E22                                                          ;B49ECB;
    JSR.W Draw4DigitHexValue                                             ;B49ECE;
    LDX.W $1846                                                          ;B49ED1;
    LDA.W EnemyData.initParam0,X                                         ;B49ED4;
    STA.W $0E24                                                          ;B49ED7;
    LDA.W #$00E0                                                         ;B49EDA;
    STA.W $0E20                                                          ;B49EDD;
    LDA.W #$0048                                                         ;B49EE0;
    STA.W $0E22                                                          ;B49EE3;
    JSR.W Draw4DigitHexValue                                             ;B49EE6;
    LDX.W $1846                                                          ;B49EE9;
    LDA.W EnemyData.initParam1,X                                         ;B49EEC;
    STA.W $0E24                                                          ;B49EEF;
    LDA.W #$00E0                                                         ;B49EF2;
    STA.W $0E20                                                          ;B49EF5;
    LDA.W #$0050                                                         ;B49EF8;
    STA.W $0E22                                                          ;B49EFB;
    JSR.W Draw4DigitHexValue                                             ;B49EFE;
    LDA.W #$0000                                                         ;B49F01;
    RTS                                                                  ;B49F04;


Debug_MoveEnemyWithDpad_QuarterPixelPerFrame:
    LDA.W $05B6                                                          ;B49F05;
    AND.W #$0003                                                         ;B49F08;
    BNE .return                                                          ;B49F0B;
    LDA.B $8D                                                            ;B49F0D;
    BIT.W #$0200                                                         ;B49F0F;
    BEQ .notPressingLeft                                                 ;B49F12;
    DEC.W EnemyData.xPosition,X                                          ;B49F14;
    BRA .checkUp                                                         ;B49F17;


.notPressingLeft:
    BIT.W #$0100                                                         ;B49F19;
    BEQ .checkUp                                                         ;B49F1C;
    INC.W EnemyData.xPosition,X                                          ;B49F1E;

.checkUp:
    LDA.B $8D                                                            ;B49F21;
    BIT.W #$0800                                                         ;B49F23;
    BEQ .notPressingUp                                                   ;B49F26;
    DEC.W EnemyData.yPosition,X                                          ;B49F28;
    BRA .return                                                          ;B49F2B;


.notPressingUp:
    BIT.W #$0400                                                         ;B49F2D;
    BEQ .return                                                          ;B49F30;
    INC.W EnemyData.yPosition,X                                          ;B49F32;

.return:
    RTL                                                                  ;B49F35;


Debug_MoveEnemyWithDpad_4PixelsPerFrame:
    LDA.B $8D                                                            ;B49F36;
    BIT.W #$0200                                                         ;B49F38;
    BEQ .notPressingLeft                                                 ;B49F3B;
    LDA.W EnemyData.xPosition,X                                          ;B49F3D;
    SEC                                                                  ;B49F40;
    SBC.W #$0004                                                         ;B49F41;
    STA.W EnemyData.xPosition,X                                          ;B49F44;
    BRA .checkUp                                                         ;B49F47;


.notPressingLeft:
    BIT.W #$0100                                                         ;B49F49;
    BEQ .checkUp                                                         ;B49F4C;
    LDA.W EnemyData.xPosition,X                                          ;B49F4E;
    CLC                                                                  ;B49F51;
    ADC.W #$0004                                                         ;B49F52;
    STA.W EnemyData.xPosition,X                                          ;B49F55;

.checkUp:
    LDA.B $8D                                                            ;B49F58;
    BIT.W #$0800                                                         ;B49F5A;
    BEQ .notPressingUp                                                   ;B49F5D;
    LDA.W EnemyData.yPosition,X                                          ;B49F5F;
    SEC                                                                  ;B49F62;
    SBC.W #$0004                                                         ;B49F63;
    STA.W EnemyData.yPosition,X                                          ;B49F66;
    BRA .return                                                          ;B49F69;


.notPressingUp:
    BIT.W #$0400                                                         ;B49F6B;
    BEQ .return                                                          ;B49F6E;
    INC.W EnemyData.yPosition,X                                          ;B49F70;
    LDA.W EnemyData.yPosition,X                                          ;B49F73;
    CLC                                                                  ;B49F76;
    ADC.W #$0004                                                         ;B49F77;
    STA.W EnemyData.yPosition,X                                          ;B49F7A;

.return:
    RTL                                                                  ;B49F7D;


Draw4DigitHexValue:
    LDA.W $0E20                                                          ;B49F7E;
    CLC                                                                  ;B49F81;
    ADC.W #$0000                                                         ;B49F82;
    STA.B $14                                                            ;B49F85;
    LDA.W $0E22                                                          ;B49F87;
    CLC                                                                  ;B49F8A;
    ADC.W #$0000                                                         ;B49F8B;
    STA.B $12                                                            ;B49F8E;
    LDA.W #$0A00                                                         ;B49F90;
    STA.B $26                                                            ;B49F93;
    LDA.W $0E24                                                          ;B49F95;
    AND.W #$F000                                                         ;B49F98;
    XBA                                                                  ;B49F9B;
    LSR A                                                                ;B49F9C;
    LSR A                                                                ;B49F9D;
    LSR A                                                                ;B49F9E;
    LSR A                                                                ;B49F9F;
    CLC                                                                  ;B49FA0;
    ADC.W #$0004                                                         ;B49FA1;
    JSL.L Add_Debug_Spritemap_to_OAM                                     ;B49FA4;
    LDA.W $0E20                                                          ;B49FA8;
    CLC                                                                  ;B49FAB;
    ADC.W #$0008                                                         ;B49FAC;
    STA.B $14                                                            ;B49FAF;
    LDA.W $0E22                                                          ;B49FB1;
    CLC                                                                  ;B49FB4;
    ADC.W #$0000                                                         ;B49FB5;
    STA.B $12                                                            ;B49FB8;
    LDA.W #$0A00                                                         ;B49FBA;
    STA.B $26                                                            ;B49FBD;
    LDA.W $0E24                                                          ;B49FBF;
    AND.W #$0F00                                                         ;B49FC2;
    XBA                                                                  ;B49FC5;
    CLC                                                                  ;B49FC6;
    ADC.W #$0004                                                         ;B49FC7;
    JSL.L Add_Debug_Spritemap_to_OAM                                     ;B49FCA;
    LDA.W $0E20                                                          ;B49FCE;
    CLC                                                                  ;B49FD1;
    ADC.W #$0010                                                         ;B49FD2;
    STA.B $14                                                            ;B49FD5;
    LDA.W $0E22                                                          ;B49FD7;
    CLC                                                                  ;B49FDA;
    ADC.W #$0000                                                         ;B49FDB;
    STA.B $12                                                            ;B49FDE;
    LDA.W #$0A00                                                         ;B49FE0;
    STA.B $26                                                            ;B49FE3;
    LDA.W $0E24                                                          ;B49FE5;
    AND.W #$00F0                                                         ;B49FE8;
    LSR A                                                                ;B49FEB;
    LSR A                                                                ;B49FEC;
    LSR A                                                                ;B49FED;
    LSR A                                                                ;B49FEE;
    CLC                                                                  ;B49FEF;
    ADC.W #$0004                                                         ;B49FF0;
    JSL.L Add_Debug_Spritemap_to_OAM                                     ;B49FF3;
    LDA.W $0E20                                                          ;B49FF7;
    CLC                                                                  ;B49FFA;
    ADC.W #$0018                                                         ;B49FFB;
    STA.B $14                                                            ;B49FFE;
    LDA.W #$0A00                                                         ;B4A000;
    STA.B $26                                                            ;B4A003;
    LDA.W $0E22                                                          ;B4A005;
    CLC                                                                  ;B4A008;
    ADC.W #$0000                                                         ;B4A009;
    STA.B $12                                                            ;B4A00C;
    LDA.W $0E24                                                          ;B4A00E;
    AND.W #$000F                                                         ;B4A011;
    CLC                                                                  ;B4A014;
    ADC.W #$0004                                                         ;B4A015;
    JSL.L Add_Debug_Spritemap_to_OAM                                     ;B4A018;
    RTS                                                                  ;B4A01C;


Add_Debug_Spritemap_to_OAM:
    PHP                                                                  ;B4A01D;
    SEP #$20                                                             ;B4A01E;
    PHB                                                                  ;B4A020;
    PHK                                                                  ;B4A021;
    PLB                                                                  ;B4A022;
    REP #$30                                                             ;B4A023;
    ASL A                                                                ;B4A025;
    TAX                                                                  ;B4A026;
    LDA.W Debug_Spritemap_Addresses,X                                    ;B4A027;
    TAY                                                                  ;B4A02A;
    LDA.W $0000,Y                                                        ;B4A02B;
    INY                                                                  ;B4A02E;
    INY                                                                  ;B4A02F;
    STA.B $18                                                            ;B4A030;
    LDX.W $0590                                                          ;B4A032;

.loop:
    LDA.W $0000,Y                                                        ;B4A035;
    STA.B $1A                                                            ;B4A038;
    AND.W #$01FF                                                         ;B4A03A;
    INY                                                                  ;B4A03D;
    INY                                                                  ;B4A03E;
    CLC                                                                  ;B4A03F;
    ADC.B $14                                                            ;B4A040;
    STA.W $0370,X                                                        ;B4A042;
    INX                                                                  ;B4A045;
    LDA.B $1B                                                            ;B4A046;
    AND.W #$0002                                                         ;B4A048;
    BEQ +                                                                ;B4A04B;
    TXA                                                                  ;B4A04D;
    STA.B $1C                                                            ;B4A04E;
    LSR A                                                                ;B4A050;
    PHY                                                                  ;B4A051;
    TAY                                                                  ;B4A052;
    AND.W #$000E                                                         ;B4A053;
    TAX                                                                  ;B4A056;
    LDA.W .indices,Y                                                     ;B4A057;
    TAY                                                                  ;B4A05A;
    LDA.W .size,X                                                        ;B4A05B;
    ORA.W $0570,Y                                                        ;B4A05E;
    STA.W $0570,Y                                                        ;B4A061;
    PLY                                                                  ;B4A064;
    LDX.B $1C                                                            ;B4A065;

  + LDA.W $0370,X                                                        ;B4A067;
    AND.W #$0001                                                         ;B4A06A;
    BEQ +                                                                ;B4A06D;
    TXA                                                                  ;B4A06F;
    STA.B $1C                                                            ;B4A070;
    LSR A                                                                ;B4A072;
    PHY                                                                  ;B4A073;
    TAY                                                                  ;B4A074;
    AND.W #$000E                                                         ;B4A075;
    TAX                                                                  ;B4A078;
    LDA.W .indices,Y                                                     ;B4A079;
    TAY                                                                  ;B4A07C;
    LDA.W .XPosition,X                                                   ;B4A07D;
    ORA.W $0570,Y                                                        ;B4A080;
    STA.W $0570,Y                                                        ;B4A083;
    PLY                                                                  ;B4A086;
    LDX.B $1C                                                            ;B4A087;

  + SEP #$20                                                             ;B4A089;
    LDA.W $0000,Y                                                        ;B4A08B;
    BMI +                                                                ;B4A08E;
    CLC                                                                  ;B4A090;
    ADC.B $12                                                            ;B4A091;
    BCS .F0                                                              ;B4A093;
    CMP.B #$F0                                                           ;B4A095;
    BCC .store                                                           ;B4A097;
    BRA .F0                                                              ;B4A099;


  + CLC                                                                  ;B4A09B;
    ADC.B $12                                                            ;B4A09C;
    BCS .checkMax                                                        ;B4A09E;
    CMP.B #$F0                                                           ;B4A0A0;
    BCS .store                                                           ;B4A0A2;
    BRA .F0                                                              ;B4A0A4;


.checkMax:
    CMP.B #$F0                                                           ;B4A0A6;
    BCC .store                                                           ;B4A0A8;

.F0:
    LDA.B #$F0                                                           ;B4A0AA;

.store:
    STA.W $0370,X                                                        ;B4A0AC;
    REP #$20                                                             ;B4A0AF;
    INX                                                                  ;B4A0B1;

.unknown:
    INY                                                                  ;B4A0B2;
    LDA.B $26                                                            ;B4A0B3;
    BEQ .useSpritemapEntryPalette                                        ;B4A0B5;
    LDA.W $0000,Y                                                        ;B4A0B7;
    AND.W #$F1FF                                                         ;B4A0BA;
    ORA.B $26                                                            ;B4A0BD;
    BRA .next                                                            ;B4A0BF;


.useSpritemapEntryPalette:
    LDA.W $0000,Y                                                        ;B4A0C1;

.next:
    STA.W $0370,X                                                        ;B4A0C4;
    INY                                                                  ;B4A0C7;
    INY                                                                  ;B4A0C8;
    INX                                                                  ;B4A0C9;
    INX                                                                  ;B4A0CA;
    CPX.W #$01FF                                                         ;B4A0CB;
    BPL .return                                                          ;B4A0CE;
    DEC.B $18                                                            ;B4A0D0;
    BEQ .return                                                          ;B4A0D2;
    JMP.W .loop                                                          ;B4A0D4;


.return:
    STX.W $0590                                                          ;B4A0D7;
    SEP #$20                                                             ;B4A0DA;
    PLB                                                                  ;B4A0DC;
    REP #$20                                                             ;B4A0DD;
    PLP                                                                  ;B4A0DF;
    RTL                                                                  ;B4A0E0;


.size:
    dw $0002,$0008,$0020,$0080,$0200,$0800,$2000,$8000                   ;B4A0E1;

.XPosition:
    dw $0001,$0004,$0010,$0040,$0100,$0400,$1000,$4000                   ;B4A0F1;

.indices:
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;B4A101;
    dw $0002,$0002,$0002,$0002,$0002,$0002,$0002,$0002                   ;B4A111;
    dw $0004,$0004,$0004,$0004,$0004,$0004,$0004,$0004                   ;B4A121;
    dw $0006,$0006,$0006,$0006,$0006,$0006,$0006,$0006                   ;B4A131;
    dw $0008,$0008,$0008,$0008,$0008,$0008,$0008,$0008                   ;B4A141;
    dw $000A,$000A,$000A,$000A,$000A,$000A,$000A,$000A                   ;B4A151;
    dw $000C,$000C,$000C,$000C,$000C,$000C,$000C,$000C                   ;B4A161;
    dw $000E,$000E,$000E,$000E,$000E,$000E,$000E,$000E                   ;B4A171;
    dw $0010,$0010,$0010,$0010,$0010,$0010,$0010,$0010                   ;B4A181;
    dw $0012,$0012,$0012,$0012,$0012,$0012,$0012,$0012                   ;B4A191;
    dw $0014,$0014,$0014,$0014,$0014,$0014,$0014,$0014                   ;B4A1A1;
    dw $0016,$0016,$0016,$0016,$0016,$0016,$0016,$0016                   ;B4A1B1;
    dw $0018,$0018,$0018,$0018,$0018,$0018,$0018,$0018                   ;B4A1C1;
    dw $001A,$001A,$001A,$001A,$001A,$001A,$001A,$001A                   ;B4A1D1;
    dw $001C,$001C,$001C,$001C,$001C,$001C,$001C,$001C                   ;B4A1E1;
    dw $001E,$001E,$001E,$001E,$001E,$001E,$001E,$001E                   ;B4A1F1;

Debug_Spritemap_Addresses:
    dw DebugSpritemaps_0_PaletteViewer_LeftHalf                          ;B4A201;
    dw DebugSpritemaps_1_PaletteViewer_RightHalf                         ;B4A203;
    dw DebugSpritemaps_2_SpriteTilesViewer_2ndHalf                       ;B4A205;
    dw DebugSpritemaps_3_SpriteTilesViewer_1stHalf                       ;B4A207;
    dw DebugSpritemaps_4_0                                               ;B4A209;
    dw DebugSpritemaps_5_1                                               ;B4A20B;
    dw DebugSpritemaps_6_2                                               ;B4A20D;
    dw DebugSpritemaps_7_3                                               ;B4A20F;
    dw DebugSpritemaps_8_4                                               ;B4A211;
    dw DebugSpritemaps_9_5                                               ;B4A213;
    dw DebugSpritemaps_A_6                                               ;B4A215;
    dw DebugSpritemaps_B_7                                               ;B4A217;
    dw DebugSpritemaps_C_8                                               ;B4A219;
    dw DebugSpritemaps_D_9                                               ;B4A21B;
    dw DebugSpritemaps_E_A                                               ;B4A21D;
    dw DebugSpritemaps_F_B                                               ;B4A21F;
    dw DebugSpritemaps_10_C                                              ;B4A221;
    dw DebugSpritemaps_11_D                                              ;B4A223;
    dw DebugSpritemaps_12_E                                              ;B4A225;
    dw DebugSpritemaps_13_F                                              ;B4A227;
    dw DebugSpritemaps_14_AreaNames_SF_Crateria                          ;B4A229;
    dw DebugSpritemaps_15_AreaNames_BL_Brinstar                          ;B4A22B;
    dw DebugSpritemaps_16_AreaNames_NO_Norfair                           ;B4A22D;
    dw DebugSpritemaps_17_AreaNames_NP_WreckedShip                       ;B4A22F;
    dw DebugSpritemaps_18_AreaNames_ML_Maridia                           ;B4A231;
    dw DebugSpritemaps_19_AreaNames_TS_Tourian                           ;B4A233;
    dw DebugSpritemaps_1A_AreaNames_CO_Ceres                             ;B4A235;
    dw DebugSpritemaps_1B_AreaNames_TT_Debug                             ;B4A237;
    dw DebugSpritemaps_1C_TextCursor                                     ;B4A239;
    dw DebugSpritemaps_1D_j                                              ;B4A23B;
    dw DebugSpritemaps_1E_k                                              ;B4A23D;
    dw DebugSpritemaps_1F_l                                              ;B4A23F;
    dw DebugSpritemaps_20_m                                              ;B4A241;
    dw DebugSpritemaps_21_n                                              ;B4A243;
    dw DebugSpritemaps_22_o                                              ;B4A245;
    dw DebugSpritemaps_23_p                                              ;B4A247;
    dw UNUSED_DebugSpritemaps_24_P_UPTM_POSE_OPT0_OPT1_B4A90F            ;B4A249;
    dw DebugSpritemaps_25_EnemyDebuggerEnemyIndicator                    ;B4A24B;
    dw UNUSED_DebugSpritemaps_26_PP_X_PYo_itros_neTosKH_B4A90F           ;B4A24D;
    dw DebugSpritemaps_27_EnemyDebuggerText_PosX_PosY_HP_Pointer         ;B4A24F;
    dw UNUSED_DebugSpritemaps_28_EnemyIndicator_B4AB9E                   ;B4A251;
    dw DebugSpritemaps_29_UPTM_Stat_Num_Bank                             ;B4A253;
    dw DebugSpritemaps_2A_Switch_Switch2_ColorPa_CharaOf                 ;B4A255;
    dw DebugSpritemaps_2B_PoseAdr_WaitTim_LpCnt_Patern                   ;B4A257;
    dw DebugSpritemaps_2C_FlashCo_IceCoun_HitCoun_PlplCou                ;B4A259;
    dw DebugSpritemaps_2D_Pwork0_Pwork1_Pwork2_Pwork3                    ;B4A25B;
    dw DebugSpritemaps_2E_Pwork4_Pwork5_InitOP0_InitOP1                  ;B4A25D;
    dw DebugSpritemaps_2F_EnemySpawnDataEditorText                       ;B4A25F;
    dw DebugSpritemaps_30_EnemyNames_NoDebug                             ;B4A261;
    dw DebugSpritemaps_31_EnemyNames_ATOMIC                              ;B4A263;
    dw DebugSpritemaps_32_EnemyNames_BANG                                ;B4A265;
    dw DebugSpritemaps_33_EnemyNames_BATTA1                              ;B4A267;
    dw DebugSpritemaps_34_EnemyNames_BATTA2                              ;B4A269;
    dw DebugSpritemaps_35_EnemyNames_BATTA3                              ;B4A26B;
    dw DebugSpritemaps_36_EnemyNames_BOTOON                              ;B4A26D;
    dw DebugSpritemaps_37_EnemyNames_BOYON                               ;B4A26F;
    dw DebugSpritemaps_38_EnemyNames_DESSGEEG                            ;B4A271;
    dw DebugSpritemaps_39_EnemyNames_DORI                                ;B4A273;
    dw DebugSpritemaps_3A_EnemyNames_DRAGON                              ;B4A275;
    dw DebugSpritemaps_3B_EnemyNames_EBI                                 ;B4A277;
    dw DebugSpritemaps_3C_EnemyNames_EYE                                 ;B4A279;
    dw DebugSpritemaps_3D_EnemyNames_NAMIHE                              ;B4A27B;
    dw DebugSpritemaps_3E_EnemyNames_FISH                                ;B4A27D;
    dw DebugSpritemaps_3F_EnemyNames_GAI                                 ;B4A27F;
    dw DebugSpritemaps_40_EnemyNames_GAMET                               ;B4A281;
    dw DebugSpritemaps_41_EnemyNames_GEEGA                               ;B4A283;
    dw DebugSpritemaps_42_EnemyNames_GERUDA                              ;B4A285;
    dw DebugSpritemaps_43_EnemyNames_GRAVY                               ;B4A287;
    dw DebugSpritemaps_44_EnemyNames_HATCHI1                             ;B4A289;
    dw DebugSpritemaps_45_EnemyNames_HAND                                ;B4A28B;
    dw DebugSpritemaps_46_EnemyNames_HIBASHI                             ;B4A28D;
    dw DebugSpritemaps_47_EnemyNames_HIRU                                ;B4A28F;
    dw DebugSpritemaps_48_EnemyNames_HOLTZ                               ;B4A291;
    dw DebugSpritemaps_49_EnemyNames_HOTARY                              ;B4A293;
    dw DebugSpritemaps_4A_EnemyNames_HZOOMER                             ;B4A295;
    dw DebugSpritemaps_4B_EnemyNames_KAGO                                ;B4A297;
    dw DebugSpritemaps_4C_EnemyNames_KAME                                ;B4A299;
    dw DebugSpritemaps_4D_EnemyNames_KAMER                               ;B4A29B;
    dw DebugSpritemaps_4E_EnemyNames_KANI                                ;B4A29D;
    dw DebugSpritemaps_4F_EnemyNames_KOMA                                ;B4A29F;
    dw DebugSpritemaps_50_EnemyNames_KZAN                                ;B4A2A1;
    dw DebugSpritemaps_51_EnemyNames_LAVAMAN                             ;B4A2A3;
    dw DebugSpritemaps_52_EnemyNames_MELLA                               ;B4A2A5;
    dw DebugSpritemaps_53_EnemyNames_MEMU                                ;B4A2A7;
    dw DebugSpritemaps_54_EnemyNames_MERO                                ;B4A2A9;
    dw DebugSpritemaps_55_EnemyNames_METALEE                             ;B4A2AB;
    dw DebugSpritemaps_56_EnemyNames_METMOD                              ;B4A2AD;
    dw DebugSpritemaps_57_EnemyNames_METROID                             ;B4A2AF;
    dw DebugSpritemaps_58_EnemyNames_MULTI                               ;B4A2B1;
    dw DebugSpritemaps_59_EnemyNames_MZOOMER                             ;B4A2B3;
    dw DebugSpritemaps_5A_EnemyNames_NDRA                                ;B4A2B5;
    dw DebugSpritemaps_5B_EnemyNames_NOMI                                ;B4A2B7;
    dw DebugSpritemaps_5C_EnemyNames_NOVA                                ;B4A2B9;
    dw DebugSpritemaps_5D_EnemyNames_OUM                                 ;B4A2BB;
    dw DebugSpritemaps_5E_EnemyNames_OUMU                                ;B4A2BD;
    dw DebugSpritemaps_5F_EnemyNames_PIPE                                ;B4A2BF;
    dw DebugSpritemaps_60_EnemyNames_POLYP                               ;B4A2C1;
    dw DebugSpritemaps_61_EnemyNames_PUROMI                              ;B4A2C3;
    dw DebugSpritemaps_62_EnemyNames_PUU                                 ;B4A2C5;
    dw DebugSpritemaps_63_EnemyNames_PUYO                                ;B4A2C7;
    dw DebugSpritemaps_64_EnemyNames_REFLEC                              ;B4A2C9;
    dw DebugSpritemaps_65_EnemyNames_RINKA                               ;B4A2CB;
    dw DebugSpritemaps_66_EnemyNames_RIO                                 ;B4A2CD;
    dw DebugSpritemaps_67_EnemyNames_RIPPER1                             ;B4A2CF;
    dw DebugSpritemaps_68_EnemyNames_RIPPER2                             ;B4A2D1;
    dw DebugSpritemaps_69_EnemyNames_ROBO                                ;B4A2D3;
    dw DebugSpritemaps_6A_EnemyNames_RSTONE                              ;B4A2D5;
    dw DebugSpritemaps_6B_EnemyNames_SABOTEN                             ;B4A2D7;
    dw DebugSpritemaps_6C_EnemyNames_SBUG                                ;B4A2D9;
    dw DebugSpritemaps_6D_EnemyNames_SCLAYD                              ;B4A2DB;
    dw DebugSpritemaps_6E_EnemyNames_SDEATH                              ;B4A2DD;
    dw DebugSpritemaps_6F_EnemyNames_SHUTTER1                            ;B4A2DF;
    dw DebugSpritemaps_70_EnemyNames_SHUTTER2                            ;B4A2E1;
    dw DebugSpritemaps_71_EnemyNames_SIDE                                ;B4A2E3;
    dw DebugSpritemaps_72_EnemyNames_SKREE                               ;B4A2E5;
    dw DebugSpritemaps_73_EnemyNames_SPA                                 ;B4A2E7;
    dw DebugSpritemaps_74_EnemyNames_SQUEEWPT                            ;B4A2E9;
    dw DebugSpritemaps_75_EnemyNames_SSIDE                               ;B4A2EB;
    dw DebugSpritemaps_76_EnemyNames_STOKE                               ;B4A2ED;
    dw DebugSpritemaps_77_EnemyNames_TOGE                                ;B4A2EF;
    dw DebugSpritemaps_78_EnemyNames_VIOLA                               ;B4A2F1;
    dw DebugSpritemaps_79_EnemyNames_WAVER                               ;B4A2F3;
    dw DebugSpritemaps_7A_EnemyNames_YARD                                ;B4A2F5;
    dw DebugSpritemaps_7B_EnemyNames_ZEB                                 ;B4A2F7;
    dw DebugSpritemaps_7C_EnemyNames_ZEBBO                               ;B4A2F9;
    dw DebugSpritemaps_7D_EnemyNames_ZEELA                               ;B4A2FB;
    dw DebugSpritemaps_7E_EnemyNames_ZOA                                 ;B4A2FD;
    dw DebugSpritemaps_7F_EnemyNames_ZOOMER                              ;B4A2FF;
    dw DebugSpritemaps_80_EnemyNames_BATTA1br                            ;B4A301;
    dw DebugSpritemaps_81_EnemyNames_BATTA1NO                            ;B4A303;
    dw DebugSpritemaps_82_EnemyNames_BATTA1np                            ;B4A305;
    dw DebugSpritemaps_8_EnemyNames_BATTA1ml                             ;B4A307;
    dw DebugSpritemaps_84_EnemyNames_BATTA1ts                            ;B4A309;
    dw DebugSpritemaps_85_EnemyNames_BATTA2br                            ;B4A30B;
    dw DebugSpritemaps_86_EnemyNames_BATTA2no                            ;B4A30D;
    dw DebugSpritemaps_87_EnemyNames_BATTA2np                            ;B4A30F;
    dw DebugSpritemaps_88_EnemyNames_BATTA2ml                            ;B4A311;
    dw DebugSpritemaps_89_EnemyNames_BATTA2ts                            ;B4A313;
    dw DebugSpritemaps_8A_EnemyNames_BATTA3br                            ;B4A315;
    dw DebugSpritemaps_8B_EnemyNames_BATTA3no                            ;B4A317;
    dw DebugSpritemaps_8C_EnemyNames_BATTA3np                            ;B4A319;
    dw DebugSpritemaps_8D_EnemyNames_BATTA3ml                            ;B4A31B;
    dw DebugSpritemaps_8E_EnemyNames_BATTA3ts                            ;B4A31D;
    dw DebugSpritemaps_8F_EnemyNames_FUNE                                ;B4A31F;
    dw DebugSpritemaps_90_EnemyNames_HATCHI2                             ;B4A321;
    dw DebugSpritemaps_91_EnemyNames_HATCHI3                             ;B4A323;
    dw DebugSpritemaps_92_EnemyNames_ROBO2                               ;B4A325;

DebugSpritemaps_0_PaletteViewer_LeftHalf:
    dw $0040,$0018                                                       ;B4A327;
    db $18                                                               ;B4A32B;
    dw $3F77,$0010                                                       ;B4A32C;
    db $18                                                               ;B4A330;
    dw $3F76,$0008                                                       ;B4A331;
    db $18                                                               ;B4A335;
    dw $3F75,$0000                                                       ;B4A336;
    db $18                                                               ;B4A33A;
    dw $3F74,$01F8                                                       ;B4A33B;
    db $18                                                               ;B4A33F;
    dw $3F73,$01F0                                                       ;B4A340;
    db $18                                                               ;B4A344;
    dw $3F72,$01E8                                                       ;B4A345;
    db $18                                                               ;B4A349;
    dw $3F71,$01E0                                                       ;B4A34A;
    db $18                                                               ;B4A34E;
    dw $3F70,$0018                                                       ;B4A34F;
    db $10                                                               ;B4A353;
    dw $3D67,$0010                                                       ;B4A354;
    db $10                                                               ;B4A358;
    dw $3D66,$0008                                                       ;B4A359;
    db $10                                                               ;B4A35D;
    dw $3D65,$0000                                                       ;B4A35E;
    db $10                                                               ;B4A362;
    dw $3D64,$01F8                                                       ;B4A363;
    db $10                                                               ;B4A367;
    dw $3D63,$01F0                                                       ;B4A368;
    db $10                                                               ;B4A36C;
    dw $3D62,$01E8                                                       ;B4A36D;
    db $10                                                               ;B4A371;
    dw $3D61,$01E0                                                       ;B4A372;
    db $10                                                               ;B4A376;
    dw $3D60,$0018                                                       ;B4A377;
    db $08                                                               ;B4A37B;
    dw $3B57,$0010                                                       ;B4A37C;
    db $08                                                               ;B4A380;
    dw $3B56,$0008                                                       ;B4A381;
    db $08                                                               ;B4A385;
    dw $3B55,$0000                                                       ;B4A386;
    db $08                                                               ;B4A38A;
    dw $3B54,$01F8                                                       ;B4A38B;
    db $08                                                               ;B4A38F;
    dw $3B53,$01F0                                                       ;B4A390;
    db $08                                                               ;B4A394;
    dw $3B52,$01E8                                                       ;B4A395;
    db $08                                                               ;B4A399;
    dw $3B51,$01E0                                                       ;B4A39A;
    db $08                                                               ;B4A39E;
    dw $3B50,$0018                                                       ;B4A39F;
    db $00                                                               ;B4A3A3;
    dw $3947,$0010                                                       ;B4A3A4;
    db $00                                                               ;B4A3A8;
    dw $3946,$0008                                                       ;B4A3A9;
    db $00                                                               ;B4A3AD;
    dw $3945,$0000                                                       ;B4A3AE;
    db $00                                                               ;B4A3B2;
    dw $3944,$01F8                                                       ;B4A3B3;
    db $00                                                               ;B4A3B7;
    dw $3943,$01F0                                                       ;B4A3B8;
    db $00                                                               ;B4A3BC;
    dw $3942,$01E8                                                       ;B4A3BD;
    db $00                                                               ;B4A3C1;
    dw $3941,$01E0                                                       ;B4A3C2;
    db $00                                                               ;B4A3C6;
    dw $3940,$0018                                                       ;B4A3C7;
    db $F8                                                               ;B4A3CB;
    dw $3737,$0010                                                       ;B4A3CC;
    db $F8                                                               ;B4A3D0;
    dw $3736,$0008                                                       ;B4A3D1;
    db $F8                                                               ;B4A3D5;
    dw $3735,$0000                                                       ;B4A3D6;
    db $F8                                                               ;B4A3DA;
    dw $3734,$01F8                                                       ;B4A3DB;
    db $F8                                                               ;B4A3DF;
    dw $3733,$01F0                                                       ;B4A3E0;
    db $F8                                                               ;B4A3E4;
    dw $3732,$01E8                                                       ;B4A3E5;
    db $F8                                                               ;B4A3E9;
    dw $3731,$01E0                                                       ;B4A3EA;
    db $F8                                                               ;B4A3EE;
    dw $3730,$0018                                                       ;B4A3EF;
    db $F0                                                               ;B4A3F3;
    dw $3527,$0010                                                       ;B4A3F4;
    db $F0                                                               ;B4A3F8;
    dw $3526,$0008                                                       ;B4A3F9;
    db $F0                                                               ;B4A3FD;
    dw $3525,$0000                                                       ;B4A3FE;
    db $F0                                                               ;B4A402;
    dw $3524,$01F8                                                       ;B4A403;
    db $F0                                                               ;B4A407;
    dw $3523,$01F0                                                       ;B4A408;
    db $F0                                                               ;B4A40C;
    dw $3522,$01E8                                                       ;B4A40D;
    db $F0                                                               ;B4A411;
    dw $3521,$01E0                                                       ;B4A412;
    db $F0                                                               ;B4A416;
    dw $3520,$0018                                                       ;B4A417;
    db $E8                                                               ;B4A41B;
    dw $3317,$0010                                                       ;B4A41C;
    db $E8                                                               ;B4A420;
    dw $3316,$0008                                                       ;B4A421;
    db $E8                                                               ;B4A425;
    dw $3315,$0000                                                       ;B4A426;
    db $E8                                                               ;B4A42A;
    dw $3314,$01F8                                                       ;B4A42B;
    db $E8                                                               ;B4A42F;
    dw $3313,$01F0                                                       ;B4A430;
    db $E8                                                               ;B4A434;
    dw $3312,$01E8                                                       ;B4A435;
    db $E8                                                               ;B4A439;
    dw $3311,$01E0                                                       ;B4A43A;
    db $E8                                                               ;B4A43E;
    dw $3310,$0018                                                       ;B4A43F;
    db $E0                                                               ;B4A443;
    dw $3107,$0010                                                       ;B4A444;
    db $E0                                                               ;B4A448;
    dw $3106,$0008                                                       ;B4A449;
    db $E0                                                               ;B4A44D;
    dw $3105,$0000                                                       ;B4A44E;
    db $E0                                                               ;B4A452;
    dw $3104,$01F8                                                       ;B4A453;
    db $E0                                                               ;B4A457;
    dw $3103,$01F0                                                       ;B4A458;
    db $E0                                                               ;B4A45C;
    dw $3102,$01E8                                                       ;B4A45D;
    db $E0                                                               ;B4A461;
    dw $3101,$01E0                                                       ;B4A462;
    db $E0                                                               ;B4A466;
    dw $3300                                                             ;B4A467;

DebugSpritemaps_1_PaletteViewer_RightHalf:
    dw $0040,$0018                                                       ;B4A469;
    db $18                                                               ;B4A46D;
    dw $3F7F,$0010                                                       ;B4A46E;
    db $18                                                               ;B4A472;
    dw $3F7E,$0008                                                       ;B4A473;
    db $18                                                               ;B4A477;
    dw $3F7D,$0000                                                       ;B4A478;
    db $18                                                               ;B4A47C;
    dw $3F7C,$01F8                                                       ;B4A47D;
    db $18                                                               ;B4A481;
    dw $3F7B,$01F0                                                       ;B4A482;
    db $18                                                               ;B4A486;
    dw $3F7A,$01E8                                                       ;B4A487;
    db $18                                                               ;B4A48B;
    dw $3F79,$01E0                                                       ;B4A48C;
    db $18                                                               ;B4A490;
    dw $3F78,$0018                                                       ;B4A491;
    db $10                                                               ;B4A495;
    dw $3D6F,$0010                                                       ;B4A496;
    db $10                                                               ;B4A49A;
    dw $3D6E,$0008                                                       ;B4A49B;
    db $10                                                               ;B4A49F;
    dw $3D6D,$0000                                                       ;B4A4A0;
    db $10                                                               ;B4A4A4;
    dw $3D6C,$01F8                                                       ;B4A4A5;
    db $10                                                               ;B4A4A9;
    dw $3D6B,$01F0                                                       ;B4A4AA;
    db $10                                                               ;B4A4AE;
    dw $3D6A,$01E8                                                       ;B4A4AF;
    db $10                                                               ;B4A4B3;
    dw $3D69,$01E0                                                       ;B4A4B4;
    db $10                                                               ;B4A4B8;
    dw $3D68,$0018                                                       ;B4A4B9;
    db $08                                                               ;B4A4BD;
    dw $3B5F,$0010                                                       ;B4A4BE;
    db $08                                                               ;B4A4C2;
    dw $3B5E,$0008                                                       ;B4A4C3;
    db $08                                                               ;B4A4C7;
    dw $3B5D,$0000                                                       ;B4A4C8;
    db $08                                                               ;B4A4CC;
    dw $3B5C,$01F8                                                       ;B4A4CD;
    db $08                                                               ;B4A4D1;
    dw $3B5B,$01F0                                                       ;B4A4D2;
    db $08                                                               ;B4A4D6;
    dw $3B5A,$01E8                                                       ;B4A4D7;
    db $08                                                               ;B4A4DB;
    dw $3B59,$01E0                                                       ;B4A4DC;
    db $08                                                               ;B4A4E0;
    dw $3B58,$0018                                                       ;B4A4E1;
    db $00                                                               ;B4A4E5;
    dw $394F,$0010                                                       ;B4A4E6;
    db $00                                                               ;B4A4EA;
    dw $394E,$0008                                                       ;B4A4EB;
    db $00                                                               ;B4A4EF;
    dw $394D,$0000                                                       ;B4A4F0;
    db $00                                                               ;B4A4F4;
    dw $394C,$01F8                                                       ;B4A4F5;
    db $00                                                               ;B4A4F9;
    dw $394B,$01F0                                                       ;B4A4FA;
    db $00                                                               ;B4A4FE;
    dw $394A,$01E8                                                       ;B4A4FF;
    db $00                                                               ;B4A503;
    dw $3949,$01E0                                                       ;B4A504;
    db $00                                                               ;B4A508;
    dw $3948,$0018                                                       ;B4A509;
    db $F8                                                               ;B4A50D;
    dw $373F,$0010                                                       ;B4A50E;
    db $F8                                                               ;B4A512;
    dw $373E,$0008                                                       ;B4A513;
    db $F8                                                               ;B4A517;
    dw $373D,$0000                                                       ;B4A518;
    db $F8                                                               ;B4A51C;
    dw $373C,$01F8                                                       ;B4A51D;
    db $F8                                                               ;B4A521;
    dw $373B,$01F0                                                       ;B4A522;
    db $F8                                                               ;B4A526;
    dw $373A,$01E8                                                       ;B4A527;
    db $F8                                                               ;B4A52B;
    dw $3739,$01E0                                                       ;B4A52C;
    db $F8                                                               ;B4A530;
    dw $3738,$0018                                                       ;B4A531;
    db $F0                                                               ;B4A535;
    dw $352F,$0010                                                       ;B4A536;
    db $F0                                                               ;B4A53A;
    dw $352E,$0008                                                       ;B4A53B;
    db $F0                                                               ;B4A53F;
    dw $352D,$0000                                                       ;B4A540;
    db $F0                                                               ;B4A544;
    dw $352C,$01F8                                                       ;B4A545;
    db $F0                                                               ;B4A549;
    dw $352B,$01F0                                                       ;B4A54A;
    db $F0                                                               ;B4A54E;
    dw $352A,$01E8                                                       ;B4A54F;
    db $F0                                                               ;B4A553;
    dw $3529,$01E0                                                       ;B4A554;
    db $F0                                                               ;B4A558;
    dw $3528,$0018                                                       ;B4A559;
    db $E8                                                               ;B4A55D;
    dw $331F,$0010                                                       ;B4A55E;
    db $E8                                                               ;B4A562;
    dw $331E,$0008                                                       ;B4A563;
    db $E8                                                               ;B4A567;
    dw $331D,$0000                                                       ;B4A568;
    db $E8                                                               ;B4A56C;
    dw $331C,$01F8                                                       ;B4A56D;
    db $E8                                                               ;B4A571;
    dw $331B,$01F0                                                       ;B4A572;
    db $E8                                                               ;B4A576;
    dw $331A,$01E8                                                       ;B4A577;
    db $E8                                                               ;B4A57B;
    dw $3319,$01E0                                                       ;B4A57C;
    db $E8                                                               ;B4A580;
    dw $3318,$0018                                                       ;B4A581;
    db $E0                                                               ;B4A585;
    dw $310F,$0010                                                       ;B4A586;
    db $E0                                                               ;B4A58A;
    dw $310E,$0008                                                       ;B4A58B;
    db $E0                                                               ;B4A58F;
    dw $310D,$0000                                                       ;B4A590;
    db $E0                                                               ;B4A594;
    dw $310C,$01F8                                                       ;B4A595;
    db $E0                                                               ;B4A599;
    dw $310B,$01F0                                                       ;B4A59A;
    db $E0                                                               ;B4A59E;
    dw $310A,$01E8                                                       ;B4A59F;
    db $E0                                                               ;B4A5A3;
    dw $3109,$01E0                                                       ;B4A5A4;
    db $E0                                                               ;B4A5A8;
    dw $3108                                                             ;B4A5A9;

DebugSpritemaps_2_SpriteTilesViewer_2ndHalf:
    dw $0040,$C230                                                       ;B4A5AB;
    db $30                                                               ;B4A5AF;
    dw $33EE,$C220                                                       ;B4A5B0;
    db $30                                                               ;B4A5B4;
    dw $33EC,$C210                                                       ;B4A5B5;
    db $30                                                               ;B4A5B9;
    dw $33EA,$C200                                                       ;B4A5BA;
    db $30                                                               ;B4A5BE;
    dw $33E8,$C3F0                                                       ;B4A5BF;
    db $30                                                               ;B4A5C3;
    dw $33E6,$C3E0                                                       ;B4A5C4;
    db $30                                                               ;B4A5C8;
    dw $33E4,$C3D0                                                       ;B4A5C9;
    db $30                                                               ;B4A5CD;
    dw $33E2,$C3C0                                                       ;B4A5CE;
    db $30                                                               ;B4A5D2;
    dw $33E0,$C230                                                       ;B4A5D3;
    db $20                                                               ;B4A5D7;
    dw $33CE,$C220                                                       ;B4A5D8;
    db $20                                                               ;B4A5DC;
    dw $33CC,$C210                                                       ;B4A5DD;
    db $20                                                               ;B4A5E1;
    dw $33CA,$C200                                                       ;B4A5E2;
    db $20                                                               ;B4A5E6;
    dw $33C8,$C3F0                                                       ;B4A5E7;
    db $20                                                               ;B4A5EB;
    dw $33C6,$C3E0                                                       ;B4A5EC;
    db $20                                                               ;B4A5F0;
    dw $33C4,$C3D0                                                       ;B4A5F1;
    db $20                                                               ;B4A5F5;
    dw $33C2,$C3C0                                                       ;B4A5F6;
    db $20                                                               ;B4A5FA;
    dw $33C0,$C230                                                       ;B4A5FB;
    db $10                                                               ;B4A5FF;
    dw $33AE,$C220                                                       ;B4A600;
    db $10                                                               ;B4A604;
    dw $33AC,$C210                                                       ;B4A605;
    db $10                                                               ;B4A609;
    dw $33AA,$C200                                                       ;B4A60A;
    db $10                                                               ;B4A60E;
    dw $33A8,$C3F0                                                       ;B4A60F;
    db $10                                                               ;B4A613;
    dw $33A6,$C3E0                                                       ;B4A614;
    db $10                                                               ;B4A618;
    dw $33A4,$C3D0                                                       ;B4A619;
    db $10                                                               ;B4A61D;
    dw $33A2,$C3C0                                                       ;B4A61E;
    db $10                                                               ;B4A622;
    dw $33A0,$C230                                                       ;B4A623;
    db $00                                                               ;B4A627;
    dw $338E,$C220                                                       ;B4A628;
    db $00                                                               ;B4A62C;
    dw $338C,$C210                                                       ;B4A62D;
    db $00                                                               ;B4A631;
    dw $338A,$C200                                                       ;B4A632;
    db $00                                                               ;B4A636;
    dw $3388,$C3F0                                                       ;B4A637;
    db $00                                                               ;B4A63B;
    dw $3386,$C3E0                                                       ;B4A63C;
    db $00                                                               ;B4A640;
    dw $3384,$C3D0                                                       ;B4A641;
    db $00                                                               ;B4A645;
    dw $3382,$C3C0                                                       ;B4A646;
    db $00                                                               ;B4A64A;
    dw $3380,$C230                                                       ;B4A64B;
    db $F0                                                               ;B4A64F;
    dw $336E,$C220                                                       ;B4A650;
    db $F0                                                               ;B4A654;
    dw $336C,$C210                                                       ;B4A655;
    db $F0                                                               ;B4A659;
    dw $336A,$C200                                                       ;B4A65A;
    db $F0                                                               ;B4A65E;
    dw $3368,$C3F0                                                       ;B4A65F;
    db $F0                                                               ;B4A663;
    dw $3366,$C3E0                                                       ;B4A664;
    db $F0                                                               ;B4A668;
    dw $3364,$C3D0                                                       ;B4A669;
    db $F0                                                               ;B4A66D;
    dw $3362,$C3C0                                                       ;B4A66E;
    db $F0                                                               ;B4A672;
    dw $3360,$C230                                                       ;B4A673;
    db $E0                                                               ;B4A677;
    dw $334E,$C220                                                       ;B4A678;
    db $E0                                                               ;B4A67C;
    dw $334C,$C210                                                       ;B4A67D;
    db $E0                                                               ;B4A681;
    dw $334A,$C200                                                       ;B4A682;
    db $E0                                                               ;B4A686;
    dw $3348,$C3F0                                                       ;B4A687;
    db $E0                                                               ;B4A68B;
    dw $3346,$C3E0                                                       ;B4A68C;
    db $E0                                                               ;B4A690;
    dw $3344,$C3D0                                                       ;B4A691;
    db $E0                                                               ;B4A695;
    dw $3342,$C3C0                                                       ;B4A696;
    db $E0                                                               ;B4A69A;
    dw $3340,$C230                                                       ;B4A69B;
    db $D0                                                               ;B4A69F;
    dw $332E,$C220                                                       ;B4A6A0;
    db $D0                                                               ;B4A6A4;
    dw $332C,$C210                                                       ;B4A6A5;
    db $D0                                                               ;B4A6A9;
    dw $332A,$C200                                                       ;B4A6AA;
    db $D0                                                               ;B4A6AE;
    dw $3328,$C3F0                                                       ;B4A6AF;
    db $D0                                                               ;B4A6B3;
    dw $3326,$C3E0                                                       ;B4A6B4;
    db $D0                                                               ;B4A6B8;
    dw $3324,$C3D0                                                       ;B4A6B9;
    db $D0                                                               ;B4A6BD;
    dw $3322,$C3C0                                                       ;B4A6BE;
    db $D0                                                               ;B4A6C2;
    dw $3320,$C230                                                       ;B4A6C3;
    db $C0                                                               ;B4A6C7;
    dw $330E,$C220                                                       ;B4A6C8;
    db $C0                                                               ;B4A6CC;
    dw $330C,$C210                                                       ;B4A6CD;
    db $C0                                                               ;B4A6D1;
    dw $330A,$C200                                                       ;B4A6D2;
    db $C0                                                               ;B4A6D6;
    dw $3308,$C3F0                                                       ;B4A6D7;
    db $C0                                                               ;B4A6DB;
    dw $3306,$C3E0                                                       ;B4A6DC;
    db $C0                                                               ;B4A6E0;
    dw $3304,$C3D0                                                       ;B4A6E1;
    db $C0                                                               ;B4A6E5;
    dw $3302,$C3C0                                                       ;B4A6E6;
    db $C0                                                               ;B4A6EA;
    dw $3300                                                             ;B4A6EB;

DebugSpritemaps_3_SpriteTilesViewer_1stHalf:
    dw $0040,$C230                                                       ;B4A6ED;
    db $30                                                               ;B4A6F1;
    dw $30EE,$C220                                                       ;B4A6F2;
    db $30                                                               ;B4A6F6;
    dw $30EC,$C210                                                       ;B4A6F7;
    db $30                                                               ;B4A6FB;
    dw $30EA,$C200                                                       ;B4A6FC;
    db $30                                                               ;B4A700;
    dw $30E8,$C3F0                                                       ;B4A701;
    db $30                                                               ;B4A705;
    dw $30E6,$C3E0                                                       ;B4A706;
    db $30                                                               ;B4A70A;
    dw $30E4,$C3D0                                                       ;B4A70B;
    db $30                                                               ;B4A70F;
    dw $30E2,$C3C0                                                       ;B4A710;
    db $30                                                               ;B4A714;
    dw $30E0,$C230                                                       ;B4A715;
    db $20                                                               ;B4A719;
    dw $30CE,$C220                                                       ;B4A71A;
    db $20                                                               ;B4A71E;
    dw $30CC,$C210                                                       ;B4A71F;
    db $20                                                               ;B4A723;
    dw $30CA,$C200                                                       ;B4A724;
    db $20                                                               ;B4A728;
    dw $30C8,$C3F0                                                       ;B4A729;
    db $20                                                               ;B4A72D;
    dw $30C6,$C3E0                                                       ;B4A72E;
    db $20                                                               ;B4A732;
    dw $30C4,$C3D0                                                       ;B4A733;
    db $20                                                               ;B4A737;
    dw $30C2,$C3C0                                                       ;B4A738;
    db $20                                                               ;B4A73C;
    dw $30C0,$C230                                                       ;B4A73D;
    db $10                                                               ;B4A741;
    dw $3AAE,$C220                                                       ;B4A742;
    db $10                                                               ;B4A746;
    dw $3AAC,$C210                                                       ;B4A747;
    db $10                                                               ;B4A74B;
    dw $3AAA,$C200                                                       ;B4A74C;
    db $10                                                               ;B4A750;
    dw $3AA8,$C3F0                                                       ;B4A751;
    db $10                                                               ;B4A755;
    dw $3AA6,$C3E0                                                       ;B4A756;
    db $10                                                               ;B4A75A;
    dw $3AA4,$C3D0                                                       ;B4A75B;
    db $10                                                               ;B4A75F;
    dw $3AA2,$C3C0                                                       ;B4A760;
    db $10                                                               ;B4A764;
    dw $3AA0,$C230                                                       ;B4A765;
    db $00                                                               ;B4A769;
    dw $3A8E,$C220                                                       ;B4A76A;
    db $00                                                               ;B4A76E;
    dw $3A8C,$C210                                                       ;B4A76F;
    db $00                                                               ;B4A773;
    dw $3A8A,$C200                                                       ;B4A774;
    db $00                                                               ;B4A778;
    dw $3A88,$C3F0                                                       ;B4A779;
    db $00                                                               ;B4A77D;
    dw $3A86,$C3E0                                                       ;B4A77E;
    db $00                                                               ;B4A782;
    dw $3A84,$C3D0                                                       ;B4A783;
    db $00                                                               ;B4A787;
    dw $3A82,$C3C0                                                       ;B4A788;
    db $00                                                               ;B4A78C;
    dw $3A80,$C230                                                       ;B4A78D;
    db $F0                                                               ;B4A791;
    dw $3A6E,$C220                                                       ;B4A792;
    db $F0                                                               ;B4A796;
    dw $3A6C,$C210                                                       ;B4A797;
    db $F0                                                               ;B4A79B;
    dw $3A6A,$C200                                                       ;B4A79C;
    db $F0                                                               ;B4A7A0;
    dw $3A68,$C3F0                                                       ;B4A7A1;
    db $F0                                                               ;B4A7A5;
    dw $3A66,$C3E0                                                       ;B4A7A6;
    db $F0                                                               ;B4A7AA;
    dw $3A64,$C3D0                                                       ;B4A7AB;
    db $F0                                                               ;B4A7AF;
    dw $3A62,$C3C0                                                       ;B4A7B0;
    db $F0                                                               ;B4A7B4;
    dw $3A60,$C230                                                       ;B4A7B5;
    db $E0                                                               ;B4A7B9;
    dw $3A4E,$C220                                                       ;B4A7BA;
    db $E0                                                               ;B4A7BE;
    dw $3A4C,$C210                                                       ;B4A7BF;
    db $E0                                                               ;B4A7C3;
    dw $3A4A,$C200                                                       ;B4A7C4;
    db $E0                                                               ;B4A7C8;
    dw $3A48,$C3F0                                                       ;B4A7C9;
    db $E0                                                               ;B4A7CD;
    dw $3A46,$C3E0                                                       ;B4A7CE;
    db $E0                                                               ;B4A7D2;
    dw $3A44,$C3D0                                                       ;B4A7D3;
    db $E0                                                               ;B4A7D7;
    dw $3A42,$C3C0                                                       ;B4A7D8;
    db $E0                                                               ;B4A7DC;
    dw $3A40,$C230                                                       ;B4A7DD;
    db $D0                                                               ;B4A7E1;
    dw $3A2E,$C220                                                       ;B4A7E2;
    db $D0                                                               ;B4A7E6;
    dw $3A2C,$C210                                                       ;B4A7E7;
    db $D0                                                               ;B4A7EB;
    dw $3A2A,$C200                                                       ;B4A7EC;
    db $D0                                                               ;B4A7F0;
    dw $3A28,$C3F0                                                       ;B4A7F1;
    db $D0                                                               ;B4A7F5;
    dw $3A26,$C3E0                                                       ;B4A7F6;
    db $D0                                                               ;B4A7FA;
    dw $3A24,$C3D0                                                       ;B4A7FB;
    db $D0                                                               ;B4A7FF;
    dw $3A22,$C3C0                                                       ;B4A800;
    db $D0                                                               ;B4A804;
    dw $3A20,$C230                                                       ;B4A805;
    db $C0                                                               ;B4A809;
    dw $380E,$C220                                                       ;B4A80A;
    db $C0                                                               ;B4A80E;
    dw $380C,$C210                                                       ;B4A80F;
    db $C0                                                               ;B4A813;
    dw $380A,$C200                                                       ;B4A814;
    db $C0                                                               ;B4A818;
    dw $3808,$C3F0                                                       ;B4A819;
    db $C0                                                               ;B4A81D;
    dw $3806,$C3E0                                                       ;B4A81E;
    db $C0                                                               ;B4A822;
    dw $3804,$C3D0                                                       ;B4A823;
    db $C0                                                               ;B4A827;
    dw $3802,$C3C0                                                       ;B4A828;
    db $C0                                                               ;B4A82C;
    dw $3800                                                             ;B4A82D;

DebugSpritemaps_4_0:
    dw $0001,$01F8                                                       ;B4A82F;
    db $F8                                                               ;B4A833;
    dw $30D0                                                             ;B4A834;

DebugSpritemaps_5_1:
    dw $0001,$01F8                                                       ;B4A836;
    db $F8                                                               ;B4A83A;
    dw $30D1                                                             ;B4A83B;

DebugSpritemaps_6_2:
    dw $0001,$01F8                                                       ;B4A83D;
    db $F8                                                               ;B4A841;
    dw $30D2                                                             ;B4A842;

DebugSpritemaps_7_3:
    dw $0001,$01F8                                                       ;B4A844;
    db $F8                                                               ;B4A848;
    dw $30D3                                                             ;B4A849;

DebugSpritemaps_8_4:
    dw $0001,$01F8                                                       ;B4A84B;
    db $F8                                                               ;B4A84F;
    dw $30D4                                                             ;B4A850;

DebugSpritemaps_9_5:
    dw $0001,$01F8                                                       ;B4A852;
    db $F8                                                               ;B4A856;
    dw $30D5                                                             ;B4A857;

DebugSpritemaps_A_6:
    dw $0001,$01F8                                                       ;B4A859;
    db $F8                                                               ;B4A85D;
    dw $30D6                                                             ;B4A85E;

DebugSpritemaps_B_7:
    dw $0001,$01F8                                                       ;B4A860;
    db $F8                                                               ;B4A864;
    dw $30D7                                                             ;B4A865;

DebugSpritemaps_C_8:
    dw $0001,$01F8                                                       ;B4A867;
    db $F8                                                               ;B4A86B;
    dw $30D8                                                             ;B4A86C;

DebugSpritemaps_D_9:
    dw $0001,$01F8                                                       ;B4A86E;
    db $F8                                                               ;B4A872;
    dw $30D9                                                             ;B4A873;

DebugSpritemaps_E_A:
    dw $0001,$01F8                                                       ;B4A875;
    db $F8                                                               ;B4A879;
    dw $30DA                                                             ;B4A87A;

DebugSpritemaps_F_B:
    dw $0001,$01F8                                                       ;B4A87C;
    db $F8                                                               ;B4A880;
    dw $30DB                                                             ;B4A881;

DebugSpritemaps_10_C:
    dw $0001,$01F8                                                       ;B4A883;
    db $F8                                                               ;B4A887;
    dw $30DC                                                             ;B4A888;

DebugSpritemaps_11_D:
    dw $0001,$01F8                                                       ;B4A88A;
    db $F8                                                               ;B4A88E;
    dw $30DD                                                             ;B4A88F;

DebugSpritemaps_12_E:
    dw $0001,$01F8                                                       ;B4A891;
    db $F8                                                               ;B4A895;
    dw $30DE                                                             ;B4A896;

DebugSpritemaps_13_F:
    dw $0001,$01F8                                                       ;B4A898;
    db $F8                                                               ;B4A89C;
    dw $30DF                                                             ;B4A89D;

UNUSED_DebugSpritemaps_a_B4A89F:
    dw $0001,$01F8                                                       ;B4A89F;
    db $F8                                                               ;B4A8A3;
    dw $30E0                                                             ;B4A8A4;

UNUSED_DebugSpritemaps_b_B4A8A6:
    dw $0001,$01F8                                                       ;B4A8A6;
    db $F8                                                               ;B4A8AA;
    dw $30E1                                                             ;B4A8AB;

UNUSED_DebugSpritemaps_c_B4A8AD:
    dw $0001,$01F8                                                       ;B4A8AD;
    db $F8                                                               ;B4A8B1;
    dw $30E2                                                             ;B4A8B2;

UNUSED_DebugSpritemaps_d_B4A8B4:
    dw $0001,$01F8                                                       ;B4A8B4;
    db $F8                                                               ;B4A8B8;
    dw $30E3                                                             ;B4A8B9;

UNUSED_DebugSpritemaps_e_B4A8BB:
    dw $0001,$01F8                                                       ;B4A8BB;
    db $F8                                                               ;B4A8BF;
    dw $30E4                                                             ;B4A8C0;

UNUSED_DebugSpritemaps_f_B4A8C2:
    dw $0001,$01F8                                                       ;B4A8C2;
    db $F8                                                               ;B4A8C6;
    dw $30E5                                                             ;B4A8C7;

UNUSED_DebugSpritemaps_g_B4A8C9:
    dw $0001,$01F8                                                       ;B4A8C9;
    db $F8                                                               ;B4A8CD;
    dw $30E6                                                             ;B4A8CE;

UNUSED_DebugSpritemaps_h_B4A8D0:
    dw $0001,$01F8                                                       ;B4A8D0;
    db $F8                                                               ;B4A8D4;
    dw $30E7                                                             ;B4A8D5;

UNUSED_DebugSpritemaps_i_B4A8D7:
    dw $0001,$01F8                                                       ;B4A8D7;
    db $F8                                                               ;B4A8DB;
    dw $30E8                                                             ;B4A8DC;

DebugSpritemaps_1D_j:
    dw $0001,$01F8                                                       ;B4A8DE;
    db $F8                                                               ;B4A8E2;
    dw $30E9                                                             ;B4A8E3;

DebugSpritemaps_1E_k:
    dw $0001,$01F8                                                       ;B4A8E5;
    db $F8                                                               ;B4A8E9;
    dw $30EA                                                             ;B4A8EA;

DebugSpritemaps_1F_l:
    dw $0001,$01F8                                                       ;B4A8EC;
    db $F8                                                               ;B4A8F0;
    dw $30EB                                                             ;B4A8F1;

DebugSpritemaps_20_m:
    dw $0001,$01F8                                                       ;B4A8F3;
    db $F8                                                               ;B4A8F7;
    dw $30EC                                                             ;B4A8F8;

DebugSpritemaps_21_n:
    dw $0001,$01F8                                                       ;B4A8FA;
    db $F8                                                               ;B4A8FE;
    dw $30ED                                                             ;B4A8FF;

DebugSpritemaps_22_o:
    dw $0001,$01F8                                                       ;B4A901;
    db $F8                                                               ;B4A905;
    dw $30EE                                                             ;B4A906;

DebugSpritemaps_23_p:
    dw $0001,$01F8                                                       ;B4A908;
    db $F8                                                               ;B4A90C;
    dw $30EF                                                             ;B4A90D;

UNUSED_DebugSpritemaps_24_P_UPTM_POSE_OPT0_OPT1_B4A90F:
    dw $001F,$0018                                                       ;B4A90F;
    db $18                                                               ;B4A913;
    dw $30CC,$0018                                                       ;B4A914;
    db $10                                                               ;B4A918;
    dw $30CC,$0010                                                       ;B4A919;
    db $18                                                               ;B4A91D;
    dw $30D1,$0010                                                       ;B4A91E;
    db $10                                                               ;B4A922;
    dw $30D0,$0008                                                       ;B4A923;
    db $18                                                               ;B4A927;
    dw $30C5,$0008                                                       ;B4A928;
    db $10                                                               ;B4A92C;
    dw $30C5,$01F0                                                       ;B4A92D;
    db $18                                                               ;B4A931;
    dw $30FD,$01F8                                                       ;B4A932;
    db $18                                                               ;B4A936;
    dw $30C0,$0000                                                       ;B4A937;
    db $18                                                               ;B4A93B;
    dw $30C1,$0000                                                       ;B4A93C;
    db $10                                                               ;B4A940;
    dw $30C1,$01F8                                                       ;B4A941;
    db $10                                                               ;B4A945;
    dw $30C0,$01F0                                                       ;B4A946;
    db $10                                                               ;B4A94A;
    dw $30FD,$01E8                                                       ;B4A94B;
    db $18                                                               ;B4A94F;
    dw $30BA,$01E8                                                       ;B4A950;
    db $10                                                               ;B4A954;
    dw $30BA,$01E0                                                       ;B4A955;
    db $18                                                               ;B4A959;
    dw $30C5,$01E0                                                       ;B4A95A;
    db $10                                                               ;B4A95E;
    dw $30C5,$0008                                                       ;B4A95F;
    db $08                                                               ;B4A963;
    dw $30C4,$0010                                                       ;B4A964;
    db $08                                                               ;B4A968;
    dw $30B4,$0000                                                       ;B4A969;
    db $08                                                               ;B4A96D;
    dw $30C0,$01F8                                                       ;B4A96E;
    db $08                                                               ;B4A972;
    dw $30C1,$01F0                                                       ;B4A973;
    db $08                                                               ;B4A977;
    dw $30FD,$01E8                                                       ;B4A978;
    db $08                                                               ;B4A97C;
    dw $30BA,$01E0                                                       ;B4A97D;
    db $08                                                               ;B4A981;
    dw $30C5,$0018                                                       ;B4A982;
    db $08                                                               ;B4A986;
    dw $30CC,$0018                                                       ;B4A987;
    db $00                                                               ;B4A98B;
    dw $30CC,$0018                                                       ;B4A98C;
    db $F8                                                               ;B4A990;
    dw $30CC,$0010                                                       ;B4A991;
    db $00                                                               ;B4A995;
    dw $30BC,$0008                                                       ;B4A996;
    db $00                                                               ;B4A99A;
    dw $30C5,$0000                                                       ;B4A99B;
    db $00                                                               ;B4A99F;
    dw $30C1,$01F8                                                       ;B4A9A0;
    db $00                                                               ;B4A9A4;
    dw $30C6,$0000                                                       ;B4A9A5;
    db $F8                                                               ;B4A9A9;
    dw $30C1                                                             ;B4A9AA;

UNUSED_DebugSpritemaps_26_PP_X_PYo_itros_neTosKH_B4A90F:
    dw $001F,$0018                                                       ;B4A9AC;
    db $18                                                               ;B4A9B0;
    dw $30B7,$0018                                                       ;B4A9B1;
    db $10                                                               ;B4A9B5;
    dw $30FD,$0010                                                       ;B4A9B6;
    db $18                                                               ;B4A9BA;
    dw $30FD,$0010                                                       ;B4A9BB;
    db $10                                                               ;B4A9BF;
    dw $30BA,$0008                                                       ;B4A9C0;
    db $18                                                               ;B4A9C4;
    dw $30BA,$0008                                                       ;B4A9C5;
    db $10                                                               ;B4A9C9;
    dw $30C5,$01F0                                                       ;B4A9CA;
    db $18                                                               ;B4A9CE;
    dw $30C5,$01F8                                                       ;B4A9CF;
    db $18                                                               ;B4A9D3;
    dw $30EE,$0000                                                       ;B4A9D4;
    db $18                                                               ;B4A9D8;
    dw $30F2,$0000                                                       ;B4A9D9;
    db $10                                                               ;B4A9DD;
    dw $30F2,$01F8                                                       ;B4A9DE;
    db $10                                                               ;B4A9E2;
    dw $30EE,$01F0                                                       ;B4A9E3;
    db $10                                                               ;B4A9E7;
    dw $30F1,$01E8                                                       ;B4A9E8;
    db $18                                                               ;B4A9EC;
    dw $30E4,$01E8                                                       ;B4A9ED;
    db $10                                                               ;B4A9F1;
    dw $30F3,$01E0                                                       ;B4A9F2;
    db $18                                                               ;B4A9F6;
    dw $30ED,$01E0                                                       ;B4A9F7;
    db $10                                                               ;B4A9FB;
    dw $30E8,$0008                                                       ;B4A9FC;
    db $08                                                               ;B4AA00;
    dw $30EE,$0010                                                       ;B4AA01;
    db $08                                                               ;B4AA05;
    dw $30CC,$0000                                                       ;B4AA06;
    db $08                                                               ;B4AA0A;
    dw $30CA,$01F8                                                       ;B4AA0B;
    db $08                                                               ;B4AA0F;
    dw $30C1,$01F0                                                       ;B4AA10;
    db $08                                                               ;B4AA14;
    dw $30FD,$01E8                                                       ;B4AA15;
    db $08                                                               ;B4AA19;
    dw $30BA,$01E0                                                       ;B4AA1A;
    db $08                                                               ;B4AA1E;
    dw $30C5,$0018                                                       ;B4AA1F;
    db $08                                                               ;B4AA23;
    dw $30CC,$0018                                                       ;B4AA24;
    db $00                                                               ;B4AA28;
    dw $30C9,$0018                                                       ;B4AA29;
    db $F8                                                               ;B4AA2D;
    dw $30C1,$0010                                                       ;B4AA2E;
    db $00                                                               ;B4AA32;
    dw $30FD,$0008                                                       ;B4AA33;
    db $00                                                               ;B4AA37;
    dw $30BA,$0000                                                       ;B4AA38;
    db $00                                                               ;B4AA3C;
    dw $30C5,$01F8                                                       ;B4AA3D;
    db $00                                                               ;B4AA41;
    dw $30CC,$0000                                                       ;B4AA42;
    db $F8                                                               ;B4AA46;
    dw $30C1                                                             ;B4AA47;

DebugSpritemaps_25_EnemyDebuggerEnemyIndicator:
    dw $0007,$0010                                                       ;B4AA49;
    db $F8                                                               ;B4AA4D;
    dw $30E4,$0008                                                       ;B4AA4E;
    db $F8                                                               ;B4AA52;
    dw $30F5,$0000                                                       ;B4AA53;
    db $F8                                                               ;B4AA57;
    dw $30EE,$01F8                                                       ;B4AA58;
    db $F8                                                               ;B4AA5C;
    dw $30BC,$01F0                                                       ;B4AA5D;
    db $F8                                                               ;B4AA61;
    dw $30CC,$01E8                                                       ;B4AA62;
    db $F8                                                               ;B4AA66;
    dw $30FB,$01E0                                                       ;B4AA67;
    db $F8                                                               ;B4AA6B;
    dw $30FA                                                             ;B4AA6C;

DebugSpritemaps_27_EnemyDebuggerText_PosX_PosY_HP_Pointer:
    dw $001E,$0010                                                       ;B4AA6E;
    db $F8                                                               ;B4AA72;
    dw $30F1,$0008                                                       ;B4AA73;
    db $F8                                                               ;B4AA77;
    dw $30E4,$0000                                                       ;B4AA78;
    db $F8                                                               ;B4AA7C;
    dw $30F3,$01F8                                                       ;B4AA7D;
    db $F8                                                               ;B4AA81;
    dw $30ED,$01F0                                                       ;B4AA82;
    db $F8                                                               ;B4AA86;
    dw $30E8,$01E8                                                       ;B4AA87;
    db $F8                                                               ;B4AA8B;
    dw $30EE,$0018                                                       ;B4AA8C;
    db $F8                                                               ;B4AA90;
    dw $30CC,$01E0                                                       ;B4AA91;
    db $F8                                                               ;B4AA95;
    dw $30C1,$0018                                                       ;B4AA96;
    db $F0                                                               ;B4AA9A;
    dw $30CC,$0000                                                       ;B4AA9B;
    db $F0                                                               ;B4AA9F;
    dw $30C1,$01F8                                                       ;B4AAA0;
    db $F0                                                               ;B4AAA4;
    dw $30B7,$01F0                                                       ;B4AAA5;
    db $F0                                                               ;B4AAA9;
    dw $30FD,$01E8                                                       ;B4AAAA;
    db $F0                                                               ;B4AAAE;
    dw $30BA,$01E0                                                       ;B4AAAF;
    db $F0                                                               ;B4AAB3;
    dw $30C5,$0000                                                       ;B4AAB4;
    db $E8                                                               ;B4AAB8;
    dw $30EE,$0008                                                       ;B4AAB9;
    db $E8                                                               ;B4AABD;
    dw $30F2,$0008                                                       ;B4AABE;
    db $E0                                                               ;B4AAC2;
    dw $30F2,$0000                                                       ;B4AAC3;
    db $E0                                                               ;B4AAC7;
    dw $30EE,$0018                                                       ;B4AAC8;
    db $E8                                                               ;B4AACC;
    dw $30CC,$0010                                                       ;B4AACD;
    db $E8                                                               ;B4AAD1;
    dw $30CA,$01F8                                                       ;B4AAD2;
    db $E8                                                               ;B4AAD6;
    dw $30C1,$01F0                                                       ;B4AAD7;
    db $E8                                                               ;B4AADB;
    dw $30FD,$01E8                                                       ;B4AADC;
    db $E8                                                               ;B4AAE0;
    dw $30BA,$01E0                                                       ;B4AAE1;
    db $E8                                                               ;B4AAE5;
    dw $30C5,$0018                                                       ;B4AAE6;
    db $E0                                                               ;B4AAEA;
    dw $30CC,$0010                                                       ;B4AAEB;
    db $E0                                                               ;B4AAEF;
    dw $30C9,$01F8                                                       ;B4AAF0;
    db $E0                                                               ;B4AAF4;
    dw $30C1,$01F0                                                       ;B4AAF5;
    db $E0                                                               ;B4AAF9;
    dw $30FD,$01E8                                                       ;B4AAFA;
    db $E0                                                               ;B4AAFE;
    dw $30BA,$01E0                                                       ;B4AAFF;
    db $E0                                                               ;B4AB03;
    dw $30C5                                                             ;B4AB04;

UNUSED_DebugSpritemaps_PosX_PosY_HP_B4AB06:
    dw $001E,$0018                                                       ;B4AB06;
    db $F8                                                               ;B4AB0A;
    dw $30CC,$0000                                                       ;B4AB0B;
    db $F8                                                               ;B4AB0F;
    dw $30C1,$01F8                                                       ;B4AB10;
    db $F8                                                               ;B4AB14;
    dw $30B7,$01F0                                                       ;B4AB15;
    db $F8                                                               ;B4AB19;
    dw $30FD,$01E8                                                       ;B4AB1A;
    db $F8                                                               ;B4AB1E;
    dw $30BA,$01E0                                                       ;B4AB1F;
    db $F8                                                               ;B4AB23;
    dw $30C5,$0000                                                       ;B4AB24;
    db $F0                                                               ;B4AB28;
    dw $30EE,$0008                                                       ;B4AB29;
    db $F0                                                               ;B4AB2D;
    dw $30F2,$0008                                                       ;B4AB2E;
    db $E8                                                               ;B4AB32;
    dw $30F2,$0000                                                       ;B4AB33;
    db $E8                                                               ;B4AB37;
    dw $30EE,$0010                                                       ;B4AB38;
    db $E0                                                               ;B4AB3C;
    dw $30F1,$0008                                                       ;B4AB3D;
    db $E0                                                               ;B4AB41;
    dw $30E4,$0000                                                       ;B4AB42;
    db $E0                                                               ;B4AB46;
    dw $30F3,$01F8                                                       ;B4AB47;
    db $E0                                                               ;B4AB4B;
    dw $30ED,$01F0                                                       ;B4AB4C;
    db $E0                                                               ;B4AB50;
    dw $30E8,$01E8                                                       ;B4AB51;
    db $E0                                                               ;B4AB55;
    dw $30EE,$0018                                                       ;B4AB56;
    db $F0                                                               ;B4AB5A;
    dw $30CC,$0010                                                       ;B4AB5B;
    db $F0                                                               ;B4AB5F;
    dw $30CA,$01F8                                                       ;B4AB60;
    db $F0                                                               ;B4AB64;
    dw $30C1,$01F0                                                       ;B4AB65;
    db $F0                                                               ;B4AB69;
    dw $30FD,$01E8                                                       ;B4AB6A;
    db $F0                                                               ;B4AB6E;
    dw $30BA,$01E0                                                       ;B4AB6F;
    db $F0                                                               ;B4AB73;
    dw $30C5,$0018                                                       ;B4AB74;
    db $E8                                                               ;B4AB78;
    dw $30CC,$0010                                                       ;B4AB79;
    db $E8                                                               ;B4AB7D;
    dw $30C9,$01F8                                                       ;B4AB7E;
    db $E8                                                               ;B4AB82;
    dw $30C1,$01F0                                                       ;B4AB83;
    db $E8                                                               ;B4AB87;
    dw $30FD,$01E8                                                       ;B4AB88;
    db $E8                                                               ;B4AB8C;
    dw $30BA,$01E0                                                       ;B4AB8D;
    db $E8                                                               ;B4AB91;
    dw $30C5,$0018                                                       ;B4AB92;
    db $E0                                                               ;B4AB96;
    dw $30CC,$01E0                                                       ;B4AB97;
    db $E0                                                               ;B4AB9B;
    dw $30C1                                                             ;B4AB9C;

UNUSED_DebugSpritemaps_28_EnemyIndicator_B4AB9E:
    dw $0008,$0018                                                       ;B4AB9E;
    db $F8                                                               ;B4ABA2;
    dw $30CC,$0010                                                       ;B4ABA3;
    db $F8                                                               ;B4ABA7;
    dw $30E4,$0008                                                       ;B4ABA8;
    db $F8                                                               ;B4ABAC;
    dw $30F5,$0000                                                       ;B4ABAD;
    db $F8                                                               ;B4ABB1;
    dw $30EE,$01F8                                                       ;B4ABB2;
    db $F8                                                               ;B4ABB6;
    dw $30BC,$01F0                                                       ;B4ABB7;
    db $F8                                                               ;B4ABBB;
    dw $30CC,$01E8                                                       ;B4ABBC;
    db $F8                                                               ;B4ABC0;
    dw $30FB,$01E0                                                       ;B4ABC1;
    db $F8                                                               ;B4ABC5;
    dw $30FA                                                             ;B4ABC6;

DebugSpritemaps_29_UPTM_Stat_Num_Bank:
    dw $001F,$0010                                                       ;B4ABC8;
    db $F8                                                               ;B4ABCC;
    dw $30EA,$0008                                                       ;B4ABCD;
    db $F8                                                               ;B4ABD1;
    dw $30ED,$0000                                                       ;B4ABD2;
    db $F8                                                               ;B4ABD6;
    dw $30E0,$01F8                                                       ;B4ABD7;
    db $F8                                                               ;B4ABDB;
    dw $30B1,$0000                                                       ;B4ABDC;
    db $F0                                                               ;B4ABE0;
    dw $30F4,$0008                                                       ;B4ABE1;
    db $F0                                                               ;B4ABE5;
    dw $30EC,$01F8                                                       ;B4ABE6;
    db $F0                                                               ;B4ABEA;
    dw $30BD,$0010                                                       ;B4ABEB;
    db $E8                                                               ;B4ABEF;
    dw $30F3,$0008                                                       ;B4ABF0;
    db $E8                                                               ;B4ABF4;
    dw $30E0,$0000                                                       ;B4ABF5;
    db $E8                                                               ;B4ABF9;
    dw $30F3,$01F8                                                       ;B4ABFA;
    db $E8                                                               ;B4ABFE;
    dw $30C4,$0018                                                       ;B4ABFF;
    db $F8                                                               ;B4AC03;
    dw $30CC,$0018                                                       ;B4AC04;
    db $F0                                                               ;B4AC08;
    dw $30CC,$01F0                                                       ;B4AC09;
    db $F8                                                               ;B4AC0D;
    dw $30FD,$01F0                                                       ;B4AC0E;
    db $F0                                                               ;B4AC12;
    dw $30FD,$01E8                                                       ;B4AC13;
    db $F8                                                               ;B4AC17;
    dw $30BA,$01E8                                                       ;B4AC18;
    db $F0                                                               ;B4AC1C;
    dw $30BA,$01E0                                                       ;B4AC1D;
    db $F8                                                               ;B4AC21;
    dw $30C5,$01E0                                                       ;B4AC22;
    db $F0                                                               ;B4AC26;
    dw $30C5,$01F0                                                       ;B4AC27;
    db $E8                                                               ;B4AC2B;
    dw $30FD,$01E8                                                       ;B4AC2C;
    db $E8                                                               ;B4AC30;
    dw $30BA,$01E0                                                       ;B4AC31;
    db $E8                                                               ;B4AC35;
    dw $30C5,$0018                                                       ;B4AC36;
    db $E8                                                               ;B4AC3A;
    dw $30CC,$0018                                                       ;B4AC3B;
    db $E0                                                               ;B4AC3F;
    dw $30CC,$0010                                                       ;B4AC40;
    db $E0                                                               ;B4AC44;
    dw $30BC,$0008                                                       ;B4AC45;
    db $E0                                                               ;B4AC49;
    dw $30C5,$0000                                                       ;B4AC4A;
    db $E0                                                               ;B4AC4E;
    dw $30C1,$01F8                                                       ;B4AC4F;
    db $E0                                                               ;B4AC53;
    dw $30C6,$01F0                                                       ;B4AC54;
    db $E0                                                               ;B4AC58;
    dw $30FD,$01E8                                                       ;B4AC59;
    db $E0                                                               ;B4AC5D;
    dw $30BA,$01E0                                                       ;B4AC5E;
    db $E0                                                               ;B4AC62;
    dw $30C5                                                             ;B4AC63;

DebugSpritemaps_2A_Switch_Switch2_ColorPa_CharaOf:
    dw $001F,$0010                                                       ;B4AC65;
    db $F8                                                               ;B4AC69;
    dw $30E5,$0008                                                       ;B4AC6A;
    db $F8                                                               ;B4AC6E;
    dw $30C0,$0000                                                       ;B4AC6F;
    db $F8                                                               ;B4AC73;
    dw $30E0,$01F8                                                       ;B4AC74;
    db $F8                                                               ;B4AC78;
    dw $30F1,$01F0                                                       ;B4AC79;
    db $F8                                                               ;B4AC7D;
    dw $30E0,$01E8                                                       ;B4AC7E;
    db $F8                                                               ;B4AC82;
    dw $30E7,$01E0                                                       ;B4AC83;
    db $F8                                                               ;B4AC87;
    dw $30B2,$0018                                                       ;B4AC88;
    db $F8                                                               ;B4AC8C;
    dw $30CC,$0018                                                       ;B4AC8D;
    db $F0                                                               ;B4AC91;
    dw $30CC,$0010                                                       ;B4AC92;
    db $F0                                                               ;B4AC96;
    dw $30E0,$0008                                                       ;B4AC97;
    db $F0                                                               ;B4AC9B;
    dw $30C1,$0000                                                       ;B4AC9C;
    db $F0                                                               ;B4ACA0;
    dw $30F1,$01F8                                                       ;B4ACA1;
    db $F0                                                               ;B4ACA5;
    dw $30EE,$01F0                                                       ;B4ACA6;
    db $F0                                                               ;B4ACAA;
    dw $30EB,$01E8                                                       ;B4ACAB;
    db $F0                                                               ;B4ACAF;
    dw $30EE,$01E0                                                       ;B4ACB0;
    db $F0                                                               ;B4ACB4;
    dw $30B2,$01E8                                                       ;B4ACB5;
    db $E8                                                               ;B4ACB9;
    dw $30F6,$01E0                                                       ;B4ACBA;
    db $E8                                                               ;B4ACBE;
    dw $30C4,$0018                                                       ;B4ACBF;
    db $E8                                                               ;B4ACC3;
    dw $30CC,$0018                                                       ;B4ACC4;
    db $E0                                                               ;B4ACC8;
    dw $30CC,$0010                                                       ;B4ACC9;
    db $E8                                                               ;B4ACCD;
    dw $30D2,$0008                                                       ;B4ACCE;
    db $E8                                                               ;B4ACD2;
    dw $30E7,$0008                                                       ;B4ACD3;
    db $E0                                                               ;B4ACD7;
    dw $30E7,$0000                                                       ;B4ACD8;
    db $E8                                                               ;B4ACDC;
    dw $30E2,$0000                                                       ;B4ACDD;
    db $E0                                                               ;B4ACE1;
    dw $30E2,$01F8                                                       ;B4ACE2;
    db $E8                                                               ;B4ACE6;
    dw $30F3,$01F8                                                       ;B4ACE7;
    db $E0                                                               ;B4ACEB;
    dw $30F3,$01F0                                                       ;B4ACEC;
    db $E8                                                               ;B4ACF0;
    dw $30E8,$01F0                                                       ;B4ACF1;
    db $E0                                                               ;B4ACF5;
    dw $30E8,$01E8                                                       ;B4ACF6;
    db $E0                                                               ;B4ACFA;
    dw $30F6,$01E0                                                       ;B4ACFB;
    db $E0                                                               ;B4ACFF;
    dw $30C4                                                             ;B4AD00;

DebugSpritemaps_2B_PoseAdr_WaitTim_LpCnt_Patern:
    dw $001D,$01F8                                                       ;B4AD02;
    db $F0                                                               ;B4AD06;
    dw $30ED,$0000                                                       ;B4AD07;
    db $F0                                                               ;B4AD0B;
    dw $30F3,$01F0                                                       ;B4AD0C;
    db $F0                                                               ;B4AD10;
    dw $30B2,$01E8                                                       ;B4AD11;
    db $F0                                                               ;B4AD15;
    dw $30EF,$01E0                                                       ;B4AD16;
    db $F0                                                               ;B4AD1A;
    dw $30BB,$0010                                                       ;B4AD1B;
    db $E8                                                               ;B4AD1F;
    dw $30EC,$0008                                                       ;B4AD20;
    db $E8                                                               ;B4AD24;
    dw $30E8,$0000                                                       ;B4AD25;
    db $E8                                                               ;B4AD29;
    dw $30C5,$01F8                                                       ;B4AD2A;
    db $E8                                                               ;B4AD2E;
    dw $30F3,$01F0                                                       ;B4AD2F;
    db $E8                                                               ;B4AD33;
    dw $30E8,$01E8                                                       ;B4AD34;
    db $E8                                                               ;B4AD38;
    dw $30E0,$01E0                                                       ;B4AD39;
    db $E8                                                               ;B4AD3D;
    dw $30C8,$0018                                                       ;B4AD3E;
    db $F0                                                               ;B4AD42;
    dw $30CC,$0018                                                       ;B4AD43;
    db $F8                                                               ;B4AD47;
    dw $30CC,$0018                                                       ;B4AD48;
    db $E8                                                               ;B4AD4C;
    dw $30CC,$0018                                                       ;B4AD4D;
    db $E0                                                               ;B4AD51;
    dw $30CC,$0010                                                       ;B4AD52;
    db $E0                                                               ;B4AD56;
    dw $30F1,$0008                                                       ;B4AD57;
    db $E0                                                               ;B4AD5B;
    dw $30E3,$0000                                                       ;B4AD5C;
    db $E0                                                               ;B4AD60;
    dw $30B0,$01F8                                                       ;B4AD61;
    db $E0                                                               ;B4AD65;
    dw $30E4,$01F0                                                       ;B4AD66;
    db $E0                                                               ;B4AD6A;
    dw $30F2,$01E8                                                       ;B4AD6B;
    db $E0                                                               ;B4AD6F;
    dw $30EE,$0008                                                       ;B4AD70;
    db $F8                                                               ;B4AD74;
    dw $30ED,$0000                                                       ;B4AD75;
    db $F8                                                               ;B4AD79;
    dw $30F1,$01F8                                                       ;B4AD7A;
    db $F8                                                               ;B4AD7E;
    dw $30E4,$01F0                                                       ;B4AD7F;
    db $F8                                                               ;B4AD83;
    dw $30F3,$01E8                                                       ;B4AD84;
    db $F8                                                               ;B4AD88;
    dw $30E0,$01E0                                                       ;B4AD89;
    db $F8                                                               ;B4AD8D;
    dw $30C1,$01E0                                                       ;B4AD8E;
    db $E0                                                               ;B4AD92;
    dw $30C1                                                             ;B4AD93;

DebugSpritemaps_2C_FlashCo_IceCoun_HitCoun_PlplCou:
    dw $0020,$0010                                                       ;B4AD95;
    db $F8                                                               ;B4AD99;
    dw $30F4,$0008                                                       ;B4AD9A;
    db $F8                                                               ;B4AD9E;
    dw $30EE,$0000                                                       ;B4AD9F;
    db $F8                                                               ;B4ADA3;
    dw $30B2,$01F0                                                       ;B4ADA4;
    db $F8                                                               ;B4ADA8;
    dw $30EF,$01F8                                                       ;B4ADA9;
    db $F8                                                               ;B4ADAD;
    dw $30EB,$01E8                                                       ;B4ADAE;
    db $F8                                                               ;B4ADB2;
    dw $30EB,$01E0                                                       ;B4ADB3;
    db $F8                                                               ;B4ADB7;
    dw $30C1,$0010                                                       ;B4ADB8;
    db $F0                                                               ;B4ADBC;
    dw $30ED,$0008                                                       ;B4ADBD;
    db $F0                                                               ;B4ADC1;
    dw $30F4,$0000                                                       ;B4ADC2;
    db $F0                                                               ;B4ADC6;
    dw $30EE,$01F8                                                       ;B4ADC7;
    db $F0                                                               ;B4ADCB;
    dw $30B2,$01F0                                                       ;B4ADCC;
    db $F0                                                               ;B4ADD0;
    dw $30F3,$01E8                                                       ;B4ADD1;
    db $F0                                                               ;B4ADD5;
    dw $30E8,$01E0                                                       ;B4ADD6;
    db $F0                                                               ;B4ADDA;
    dw $30B7,$0010                                                       ;B4ADDB;
    db $E8                                                               ;B4ADDF;
    dw $30ED,$0008                                                       ;B4ADE0;
    db $E8                                                               ;B4ADE4;
    dw $30F4,$0000                                                       ;B4ADE5;
    db $E8                                                               ;B4ADE9;
    dw $30EE,$01F8                                                       ;B4ADEA;
    db $E8                                                               ;B4ADEE;
    dw $30B2,$01F0                                                       ;B4ADEF;
    db $E8                                                               ;B4ADF3;
    dw $30E4,$01E8                                                       ;B4ADF4;
    db $E8                                                               ;B4ADF8;
    dw $30E2,$01E0                                                       ;B4ADF9;
    db $E8                                                               ;B4ADFD;
    dw $30B8,$0010                                                       ;B4ADFE;
    db $E0                                                               ;B4AE02;
    dw $30EE,$0008                                                       ;B4AE03;
    db $E0                                                               ;B4AE07;
    dw $30B2,$0000                                                       ;B4AE08;
    db $E0                                                               ;B4AE0C;
    dw $30E7,$01F8                                                       ;B4AE0D;
    db $E0                                                               ;B4AE11;
    dw $30F2,$01F0                                                       ;B4AE12;
    db $E0                                                               ;B4AE16;
    dw $30E0,$01E8                                                       ;B4AE17;
    db $E0                                                               ;B4AE1B;
    dw $30EB,$01E0                                                       ;B4AE1C;
    db $E0                                                               ;B4AE20;
    dw $30B5,$0018                                                       ;B4AE21;
    db $F8                                                               ;B4AE25;
    dw $30CC,$0018                                                       ;B4AE26;
    db $F0                                                               ;B4AE2A;
    dw $30CC,$0018                                                       ;B4AE2B;
    db $E8                                                               ;B4AE2F;
    dw $30CC,$0018                                                       ;B4AE30;
    db $E0                                                               ;B4AE34;
    dw $30CC                                                             ;B4AE35;

DebugSpritemaps_2D_Pwork0_Pwork1_Pwork2_Pwork3:
    dw $001C,$0018                                                       ;B4AE37;
    db $F8                                                               ;B4AE3B;
    dw $30CC,$0018                                                       ;B4AE3C;
    db $F0                                                               ;B4AE40;
    dw $30CC,$0018                                                       ;B4AE41;
    db $E8                                                               ;B4AE45;
    dw $30CC,$0018                                                       ;B4AE46;
    db $E0                                                               ;B4AE4A;
    dw $30CC,$0008                                                       ;B4AE4B;
    db $F8                                                               ;B4AE4F;
    dw $30D3,$0008                                                       ;B4AE50;
    db $F0                                                               ;B4AE54;
    dw $30D2,$0008                                                       ;B4AE55;
    db $E8                                                               ;B4AE59;
    dw $30D1,$0008                                                       ;B4AE5A;
    db $E0                                                               ;B4AE5E;
    dw $30D0,$0000                                                       ;B4AE5F;
    db $F8                                                               ;B4AE63;
    dw $30EA,$01F8                                                       ;B4AE64;
    db $F8                                                               ;B4AE68;
    dw $30F1,$01F0                                                       ;B4AE69;
    db $F8                                                               ;B4AE6D;
    dw $30EE,$01E8                                                       ;B4AE6E;
    db $F8                                                               ;B4AE72;
    dw $30F6,$01E0                                                       ;B4AE73;
    db $F8                                                               ;B4AE77;
    dw $30C1,$0000                                                       ;B4AE78;
    db $F0                                                               ;B4AE7C;
    dw $30EA,$01F8                                                       ;B4AE7D;
    db $F0                                                               ;B4AE81;
    dw $30F1,$01F0                                                       ;B4AE82;
    db $F0                                                               ;B4AE86;
    dw $30EE,$01E8                                                       ;B4AE87;
    db $F0                                                               ;B4AE8B;
    dw $30F6,$01E0                                                       ;B4AE8C;
    db $F0                                                               ;B4AE90;
    dw $30C1,$0000                                                       ;B4AE91;
    db $E8                                                               ;B4AE95;
    dw $30EA,$01F8                                                       ;B4AE96;
    db $E8                                                               ;B4AE9A;
    dw $30F1,$01F0                                                       ;B4AE9B;
    db $E8                                                               ;B4AE9F;
    dw $30EE,$01E8                                                       ;B4AEA0;
    db $E8                                                               ;B4AEA4;
    dw $30F6,$01E0                                                       ;B4AEA5;
    db $E8                                                               ;B4AEA9;
    dw $30C1,$0000                                                       ;B4AEAA;
    db $E0                                                               ;B4AEAE;
    dw $30EA,$01F8                                                       ;B4AEAF;
    db $E0                                                               ;B4AEB3;
    dw $30F1,$01F0                                                       ;B4AEB4;
    db $E0                                                               ;B4AEB8;
    dw $30EE,$01E8                                                       ;B4AEB9;
    db $E0                                                               ;B4AEBD;
    dw $30F6,$01E0                                                       ;B4AEBE;
    db $E0                                                               ;B4AEC2;
    dw $30C1                                                             ;B4AEC3;

DebugSpritemaps_2E_Pwork4_Pwork5_InitOP0_InitOP1:
    dw $001E,$0010                                                       ;B4AEC5;
    db $F8                                                               ;B4AEC9;
    dw $30D1,$0008                                                       ;B4AECA;
    db $F8                                                               ;B4AECE;
    dw $30C1,$0000                                                       ;B4AECF;
    db $F8                                                               ;B4AED3;
    dw $30C0,$01F8                                                       ;B4AED4;
    db $F8                                                               ;B4AED8;
    dw $30F3,$01F0                                                       ;B4AED9;
    db $F8                                                               ;B4AEDD;
    dw $30E8,$01E8                                                       ;B4AEDE;
    db $F8                                                               ;B4AEE2;
    dw $30ED,$01E0                                                       ;B4AEE3;
    db $F8                                                               ;B4AEE7;
    dw $30B8,$0010                                                       ;B4AEE8;
    db $F0                                                               ;B4AEEC;
    dw $30D0,$0008                                                       ;B4AEED;
    db $F0                                                               ;B4AEF1;
    dw $30C1,$0000                                                       ;B4AEF2;
    db $F0                                                               ;B4AEF6;
    dw $30C0,$01F8                                                       ;B4AEF7;
    db $F0                                                               ;B4AEFB;
    dw $30F3,$01F0                                                       ;B4AEFC;
    db $F0                                                               ;B4AF00;
    dw $30E8,$01E8                                                       ;B4AF01;
    db $F0                                                               ;B4AF05;
    dw $30ED,$01E0                                                       ;B4AF06;
    db $F0                                                               ;B4AF0A;
    dw $30B8,$0008                                                       ;B4AF0B;
    db $E8                                                               ;B4AF0F;
    dw $30D5,$0008                                                       ;B4AF10;
    db $E0                                                               ;B4AF14;
    dw $30D4,$0018                                                       ;B4AF15;
    db $F8                                                               ;B4AF19;
    dw $30CC,$0018                                                       ;B4AF1A;
    db $F0                                                               ;B4AF1E;
    dw $30CC,$0018                                                       ;B4AF1F;
    db $E8                                                               ;B4AF23;
    dw $30CC,$0018                                                       ;B4AF24;
    db $E0                                                               ;B4AF28;
    dw $30CC,$0000                                                       ;B4AF29;
    db $E8                                                               ;B4AF2D;
    dw $30EA,$01F8                                                       ;B4AF2E;
    db $E8                                                               ;B4AF32;
    dw $30F1,$01F0                                                       ;B4AF33;
    db $E8                                                               ;B4AF37;
    dw $30EE,$01E8                                                       ;B4AF38;
    db $E8                                                               ;B4AF3C;
    dw $30F6,$01E0                                                       ;B4AF3D;
    db $E8                                                               ;B4AF41;
    dw $30C1,$0000                                                       ;B4AF42;
    db $E0                                                               ;B4AF46;
    dw $30EA,$01F8                                                       ;B4AF47;
    db $E0                                                               ;B4AF4B;
    dw $30F1,$01F0                                                       ;B4AF4C;
    db $E0                                                               ;B4AF50;
    dw $30EE,$01E8                                                       ;B4AF51;
    db $E0                                                               ;B4AF55;
    dw $30F6,$01E0                                                       ;B4AF56;
    db $E0                                                               ;B4AF5A;
    dw $30C1                                                             ;B4AF5B;

DebugSpritemaps_2F_EnemySpawnDataEditorText:
    dw $0023,$0000                                                       ;B4AF5D;
    db $18                                                               ;B4AF61;
    dw $30CC,$0000                                                       ;B4AF62;
    db $10                                                               ;B4AF66;
    dw $30CC,$0000                                                       ;B4AF67;
    db $00                                                               ;B4AF6B;
    dw $30CC,$0000                                                       ;B4AF6C;
    db $08                                                               ;B4AF70;
    dw $30CC,$0000                                                       ;B4AF71;
    db $F8                                                               ;B4AF75;
    dw $30CC,$0000                                                       ;B4AF76;
    db $F0                                                               ;B4AF7A;
    dw $30CC,$0000                                                       ;B4AF7B;
    db $E8                                                               ;B4AF7F;
    dw $30CC,$01F8                                                       ;B4AF80;
    db $00                                                               ;B4AF84;
    dw $30D1,$01F8                                                       ;B4AF85;
    db $18                                                               ;B4AF89;
    dw $30D1,$01F8                                                       ;B4AF8A;
    db $10                                                               ;B4AF8E;
    dw $30D0,$01F0                                                       ;B4AF8F;
    db $F0                                                               ;B4AF93;
    dw $30F2,$01F0                                                       ;B4AF94;
    db $E8                                                               ;B4AF98;
    dw $30F2,$01E8                                                       ;B4AF99;
    db $F0                                                               ;B4AF9D;
    dw $30EE,$01E8                                                       ;B4AF9E;
    db $E8                                                               ;B4AFA2;
    dw $30EE,$01E0                                                       ;B4AFA3;
    db $F0                                                               ;B4AFA7;
    dw $30C1,$01E0                                                       ;B4AFA8;
    db $E8                                                               ;B4AFAC;
    dw $30C1,$01F8                                                       ;B4AFAD;
    db $F0                                                               ;B4AFB1;
    dw $30CA,$01F8                                                       ;B4AFB2;
    db $E8                                                               ;B4AFB6;
    dw $30C9,$01E0                                                       ;B4AFB7;
    db $F8                                                               ;B4AFBB;
    dw $30C1,$01F0                                                       ;B4AFBC;
    db $18                                                               ;B4AFC0;
    dw $30F3,$01E8                                                       ;B4AFC1;
    db $18                                                               ;B4AFC5;
    dw $30EF,$01E0                                                       ;B4AFC6;
    db $18                                                               ;B4AFCA;
    dw $30C0,$01F0                                                       ;B4AFCB;
    db $10                                                               ;B4AFCF;
    dw $30F3,$01E8                                                       ;B4AFD0;
    db $10                                                               ;B4AFD4;
    dw $30EF,$01E0                                                       ;B4AFD5;
    db $10                                                               ;B4AFD9;
    dw $30C0,$01F8                                                       ;B4AFDA;
    db $08                                                               ;B4AFDE;
    dw $30D2,$01F0                                                       ;B4AFDF;
    db $08                                                               ;B4AFE3;
    dw $30F3,$01F0                                                       ;B4AFE4;
    db $00                                                               ;B4AFE8;
    dw $30F3,$01E8                                                       ;B4AFE9;
    db $08                                                               ;B4AFED;
    dw $30F6,$01E0                                                       ;B4AFEE;
    db $08                                                               ;B4AFF2;
    dw $30C4,$01E8                                                       ;B4AFF3;
    db $00                                                               ;B4AFF7;
    dw $30F6,$01E0                                                       ;B4AFF8;
    db $00                                                               ;B4AFFC;
    dw $30C4,$01F8                                                       ;B4AFFD;
    db $F8                                                               ;B4B001;
    dw $30E4,$01F0                                                       ;B4B002;
    db $F8                                                               ;B4B006;
    dw $30F2,$01E8                                                       ;B4B007;
    db $F8                                                               ;B4B00B;
    dw $30EE                                                             ;B4B00C;

DebugSpritemaps_31_EnemyNames_ATOMIC:
    dw $0006,$0008                                                       ;B4B00E;
    db $E0                                                               ;B4B012;
    dw $30B2,$0000                                                       ;B4B013;
    db $E0                                                               ;B4B017;
    dw $30B8,$01F8                                                       ;B4B018;
    db $E0                                                               ;B4B01C;
    dw $30BC,$01F0                                                       ;B4B01D;
    db $E0                                                               ;B4B021;
    dw $30C0,$01E8                                                       ;B4B022;
    db $E0                                                               ;B4B026;
    dw $30C5,$01E0                                                       ;B4B027;
    db $E0                                                               ;B4B02B;
    dw $30B0                                                             ;B4B02C;

DebugSpritemaps_32_EnemyNames_BANG:
    dw $0004,$01F8                                                       ;B4B02E;
    db $E0                                                               ;B4B032;
    dw $30B6,$01F0                                                       ;B4B033;
    db $E0                                                               ;B4B037;
    dw $30BD,$01E8                                                       ;B4B038;
    db $E0                                                               ;B4B03C;
    dw $30B0,$01E0                                                       ;B4B03D;
    db $E0                                                               ;B4B041;
    dw $30B1                                                             ;B4B042;

DebugSpritemaps_33_EnemyNames_BATTA1:
    dw $0006,$0008                                                       ;B4B044;
    db $E0                                                               ;B4B048;
    dw $30D1,$0000                                                       ;B4B049;
    db $E0                                                               ;B4B04D;
    dw $30B0,$01F8                                                       ;B4B04E;
    db $E0                                                               ;B4B052;
    dw $30C5,$01F0                                                       ;B4B053;
    db $E0                                                               ;B4B057;
    dw $30C5,$01E8                                                       ;B4B058;
    db $E0                                                               ;B4B05C;
    dw $30B0,$01E0                                                       ;B4B05D;
    db $E0                                                               ;B4B061;
    dw $30B1                                                             ;B4B062;

DebugSpritemaps_34_EnemyNames_BATTA2:
    dw $0006,$0008                                                       ;B4B064;
    db $E0                                                               ;B4B068;
    dw $30D2,$0000                                                       ;B4B069;
    db $E0                                                               ;B4B06D;
    dw $30B0,$01F8                                                       ;B4B06E;
    db $E0                                                               ;B4B072;
    dw $30C5,$01F0                                                       ;B4B073;
    db $E0                                                               ;B4B077;
    dw $30C5,$01E8                                                       ;B4B078;
    db $E0                                                               ;B4B07C;
    dw $30B0,$01E0                                                       ;B4B07D;
    db $E0                                                               ;B4B081;
    dw $30B1                                                             ;B4B082;

DebugSpritemaps_35_EnemyNames_BATTA3:
    dw $0006,$0008                                                       ;B4B084;
    db $E0                                                               ;B4B088;
    dw $30D3,$0000                                                       ;B4B089;
    db $E0                                                               ;B4B08D;
    dw $30B0,$01F8                                                       ;B4B08E;
    db $E0                                                               ;B4B092;
    dw $30C5,$01F0                                                       ;B4B093;
    db $E0                                                               ;B4B097;
    dw $30C5,$01E8                                                       ;B4B098;
    db $E0                                                               ;B4B09C;
    dw $30B0,$01E0                                                       ;B4B09D;
    db $E0                                                               ;B4B0A1;
    dw $30B1                                                             ;B4B0A2;

DebugSpritemaps_36_EnemyNames_BOTOON:
    dw $0006,$0008                                                       ;B4B0A4;
    db $E0                                                               ;B4B0A8;
    dw $30BD,$01F0                                                       ;B4B0A9;
    db $E0                                                               ;B4B0AD;
    dw $30C5,$0000                                                       ;B4B0AE;
    db $E0                                                               ;B4B0B2;
    dw $30C0,$01F8                                                       ;B4B0B3;
    db $E0                                                               ;B4B0B7;
    dw $30C0,$01E8                                                       ;B4B0B8;
    db $E0                                                               ;B4B0BC;
    dw $30C0,$01E0                                                       ;B4B0BD;
    db $E0                                                               ;B4B0C1;
    dw $30B1                                                             ;B4B0C2;

DebugSpritemaps_37_EnemyNames_BOYON:
    dw $0005,$0000                                                       ;B4B0C4;
    db $E0                                                               ;B4B0C8;
    dw $30BD,$01F8                                                       ;B4B0C9;
    db $E0                                                               ;B4B0CD;
    dw $30C0,$01F0                                                       ;B4B0CE;
    db $E0                                                               ;B4B0D2;
    dw $30CA,$01E8                                                       ;B4B0D3;
    db $E0                                                               ;B4B0D7;
    dw $30C0,$01E0                                                       ;B4B0D8;
    db $E0                                                               ;B4B0DC;
    dw $30B1                                                             ;B4B0DD;

DebugSpritemaps_38_EnemyNames_DESSGEEG:
    dw $0008,$0018                                                       ;B4B0DF;
    db $E0                                                               ;B4B0E3;
    dw $30B6,$0010                                                       ;B4B0E4;
    db $E0                                                               ;B4B0E8;
    dw $30B4,$0008                                                       ;B4B0E9;
    db $E0                                                               ;B4B0ED;
    dw $30B4,$0000                                                       ;B4B0EE;
    db $E0                                                               ;B4B0F2;
    dw $30B6,$01F8                                                       ;B4B0F3;
    db $E0                                                               ;B4B0F7;
    dw $30C4,$01F0                                                       ;B4B0F8;
    db $E0                                                               ;B4B0FC;
    dw $30C4,$01E8                                                       ;B4B0FD;
    db $E0                                                               ;B4B101;
    dw $30B4,$01E0                                                       ;B4B102;
    db $E0                                                               ;B4B106;
    dw $30B3                                                             ;B4B107;

DebugSpritemaps_39_EnemyNames_DORI:
    dw $0004,$01F8                                                       ;B4B109;
    db $E0                                                               ;B4B10D;
    dw $30B8,$01F0                                                       ;B4B10E;
    db $E0                                                               ;B4B112;
    dw $30C3,$01E8                                                       ;B4B113;
    db $E0                                                               ;B4B117;
    dw $30C0,$01E0                                                       ;B4B118;
    db $E0                                                               ;B4B11C;
    dw $30B3                                                             ;B4B11D;

DebugSpritemaps_3A_EnemyNames_DRAGON:
    dw $0006,$0008                                                       ;B4B11F;
    db $E0                                                               ;B4B123;
    dw $30BD,$0000                                                       ;B4B124;
    db $E0                                                               ;B4B128;
    dw $30C0,$01F8                                                       ;B4B129;
    db $E0                                                               ;B4B12D;
    dw $30B6,$01F0                                                       ;B4B12E;
    db $E0                                                               ;B4B132;
    dw $30B0,$01E8                                                       ;B4B133;
    db $E0                                                               ;B4B137;
    dw $30C3,$01E0                                                       ;B4B138;
    db $E0                                                               ;B4B13C;
    dw $30B3                                                             ;B4B13D;

DebugSpritemaps_3B_EnemyNames_EBI:
    dw $0003,$01F0                                                       ;B4B13F;
    db $E0                                                               ;B4B143;
    dw $30B8,$01E8                                                       ;B4B144;
    db $E0                                                               ;B4B148;
    dw $30B1,$01E0                                                       ;B4B149;
    db $E0                                                               ;B4B14D;
    dw $30B4                                                             ;B4B14E;

DebugSpritemaps_3C_EnemyNames_EYE:
    dw $0003,$01F0                                                       ;B4B150;
    db $E0                                                               ;B4B154;
    dw $30B4,$01E8                                                       ;B4B155;
    db $E0                                                               ;B4B159;
    dw $30CA,$01E0                                                       ;B4B15A;
    db $E0                                                               ;B4B15E;
    dw $30B4                                                             ;B4B15F;

DebugSpritemaps_3D_EnemyNames_NAMIHE:
    dw $0007,$0000                                                       ;B4B161;
    db $E0                                                               ;B4B165;
    dw $30B7,$0010                                                       ;B4B166;
    db $E0                                                               ;B4B16A;
    dw $30B8,$0008                                                       ;B4B16B;
    db $E0                                                               ;B4B16F;
    dw $30B4,$01F8                                                       ;B4B170;
    db $E0                                                               ;B4B174;
    dw $30B8,$01F0                                                       ;B4B175;
    db $E0                                                               ;B4B179;
    dw $30BC,$01E8                                                       ;B4B17A;
    db $E0                                                               ;B4B17E;
    dw $30B0,$01E0                                                       ;B4B17F;
    db $E0                                                               ;B4B183;
    dw $30BD                                                             ;B4B184;

DebugSpritemaps_3E_EnemyNames_FISH:
    dw $0004,$01F8                                                       ;B4B186;
    db $E0                                                               ;B4B18A;
    dw $30B7,$01F0                                                       ;B4B18B;
    db $E0                                                               ;B4B18F;
    dw $30C4,$01E8                                                       ;B4B190;
    db $E0                                                               ;B4B194;
    dw $30B8,$01E0                                                       ;B4B195;
    db $E0                                                               ;B4B199;
    dw $30B5                                                             ;B4B19A;

DebugSpritemaps_3F_EnemyNames_GAI:
    dw $0003,$01F0                                                       ;B4B19C;
    db $E0                                                               ;B4B1A0;
    dw $30B8,$01E8                                                       ;B4B1A1;
    db $E0                                                               ;B4B1A5;
    dw $30B0,$01E0                                                       ;B4B1A6;
    db $E0                                                               ;B4B1AA;
    dw $30B6                                                             ;B4B1AB;

DebugSpritemaps_40_EnemyNames_GAMET:
    dw $0005,$0000                                                       ;B4B1AD;
    db $E0                                                               ;B4B1B1;
    dw $30C5,$01F8                                                       ;B4B1B2;
    db $E0                                                               ;B4B1B6;
    dw $30B4,$01F0                                                       ;B4B1B7;
    db $E0                                                               ;B4B1BB;
    dw $30BC,$01E8                                                       ;B4B1BC;
    db $E0                                                               ;B4B1C0;
    dw $30B0,$01E0                                                       ;B4B1C1;
    db $E0                                                               ;B4B1C5;
    dw $30B6                                                             ;B4B1C6;

DebugSpritemaps_41_EnemyNames_GEEGA:
    dw $0005,$01F0                                                       ;B4B1C8;
    db $E0                                                               ;B4B1CC;
    dw $30B4,$0000                                                       ;B4B1CD;
    db $E0                                                               ;B4B1D1;
    dw $30B0,$01F8                                                       ;B4B1D2;
    db $E0                                                               ;B4B1D6;
    dw $30B6,$01E8                                                       ;B4B1D7;
    db $E0                                                               ;B4B1DB;
    dw $30B4,$01E0                                                       ;B4B1DC;
    db $E0                                                               ;B4B1E0;
    dw $30B6                                                             ;B4B1E1;

DebugSpritemaps_42_EnemyNames_GERUDA:
    dw $0006,$0008                                                       ;B4B1E3;
    db $E0                                                               ;B4B1E7;
    dw $30B0,$0000                                                       ;B4B1E8;
    db $E0                                                               ;B4B1EC;
    dw $30B3,$01F8                                                       ;B4B1ED;
    db $E0                                                               ;B4B1F1;
    dw $30C6,$01F0                                                       ;B4B1F2;
    db $E0                                                               ;B4B1F6;
    dw $30C3,$01E8                                                       ;B4B1F7;
    db $E0                                                               ;B4B1FB;
    dw $30B4,$01E0                                                       ;B4B1FC;
    db $E0                                                               ;B4B200;
    dw $30B6                                                             ;B4B201;

DebugSpritemaps_43_EnemyNames_GRAVY:
    dw $0005,$0000                                                       ;B4B203;
    db $E0                                                               ;B4B207;
    dw $30CA,$01F8                                                       ;B4B208;
    db $E0                                                               ;B4B20C;
    dw $30C7,$01F0                                                       ;B4B20D;
    db $E0                                                               ;B4B211;
    dw $30B0,$01E8                                                       ;B4B212;
    db $E0                                                               ;B4B216;
    dw $30C3,$01E0                                                       ;B4B217;
    db $E0                                                               ;B4B21B;
    dw $30B6                                                             ;B4B21C;

DebugSpritemaps_44_EnemyNames_HATCHI1:
    dw $0006,$0008                                                       ;B4B21E;
    db $E0                                                               ;B4B222;
    dw $30D1,$0000                                                       ;B4B223;
    db $E0                                                               ;B4B227;
    dw $30B8,$01F8                                                       ;B4B228;
    db $E0                                                               ;B4B22C;
    dw $30B7,$01F0                                                       ;B4B22D;
    db $E0                                                               ;B4B231;
    dw $30B2,$01E8                                                       ;B4B232;
    db $E0                                                               ;B4B236;
    dw $30B0,$01E0                                                       ;B4B237;
    db $E0                                                               ;B4B23B;
    dw $30B7                                                             ;B4B23C;

DebugSpritemaps_45_EnemyNames_HAND:
    dw $0004,$01F8                                                       ;B4B23E;
    db $E0                                                               ;B4B242;
    dw $30B3,$01F0                                                       ;B4B243;
    db $E0                                                               ;B4B247;
    dw $30BD,$01E8                                                       ;B4B248;
    db $E0                                                               ;B4B24C;
    dw $30B0,$01E0                                                       ;B4B24D;
    db $E0                                                               ;B4B251;
    dw $30B7                                                             ;B4B252;

DebugSpritemaps_46_EnemyNames_HIBASHI:
    dw $0007,$0010                                                       ;B4B254;
    db $E0                                                               ;B4B258;
    dw $30B8,$0008                                                       ;B4B259;
    db $E0                                                               ;B4B25D;
    dw $30B7,$0000                                                       ;B4B25E;
    db $E0                                                               ;B4B262;
    dw $30C4,$01F8                                                       ;B4B263;
    db $E0                                                               ;B4B267;
    dw $30B0,$01F0                                                       ;B4B268;
    db $E0                                                               ;B4B26C;
    dw $30B1,$01E8                                                       ;B4B26D;
    db $E0                                                               ;B4B271;
    dw $30B8,$01E0                                                       ;B4B272;
    db $E0                                                               ;B4B276;
    dw $30B7                                                             ;B4B277;

DebugSpritemaps_47_EnemyNames_HIRU:
    dw $0004,$01F8                                                       ;B4B279;
    db $E0                                                               ;B4B27D;
    dw $30C6,$01F0                                                       ;B4B27E;
    db $E0                                                               ;B4B282;
    dw $30C3,$01E8                                                       ;B4B283;
    db $E0                                                               ;B4B287;
    dw $30B8,$01E0                                                       ;B4B288;
    db $E0                                                               ;B4B28C;
    dw $30B7                                                             ;B4B28D;

DebugSpritemaps_48_EnemyNames_HOLTZ:
    dw $0005,$0000                                                       ;B4B28F;
    db $E0                                                               ;B4B293;
    dw $30CB,$01F8                                                       ;B4B294;
    db $E0                                                               ;B4B298;
    dw $30C5,$01F0                                                       ;B4B299;
    db $E0                                                               ;B4B29D;
    dw $30BB,$01E8                                                       ;B4B29E;
    db $E0                                                               ;B4B2A2;
    dw $30C0,$01E0                                                       ;B4B2A3;
    db $E0                                                               ;B4B2A7;
    dw $30B7                                                             ;B4B2A8;

DebugSpritemaps_49_EnemyNames_HOTARY:
    dw $0006,$0008                                                       ;B4B2AA;
    db $E0                                                               ;B4B2AE;
    dw $30CA,$0000                                                       ;B4B2AF;
    db $E0                                                               ;B4B2B3;
    dw $30C3,$01F8                                                       ;B4B2B4;
    db $E0                                                               ;B4B2B8;
    dw $30B0,$01F0                                                       ;B4B2B9;
    db $E0                                                               ;B4B2BD;
    dw $30C5,$01E8                                                       ;B4B2BE;
    db $E0                                                               ;B4B2C2;
    dw $30C0,$01E0                                                       ;B4B2C3;
    db $E0                                                               ;B4B2C7;
    dw $30B7                                                             ;B4B2C8;

DebugSpritemaps_4A_EnemyNames_HZOOMER:
    dw $0007,$0010                                                       ;B4B2CA;
    db $E0                                                               ;B4B2CE;
    dw $30C3,$0008                                                       ;B4B2CF;
    db $E0                                                               ;B4B2D3;
    dw $30B4,$0000                                                       ;B4B2D4;
    db $E0                                                               ;B4B2D8;
    dw $30BC,$01F8                                                       ;B4B2D9;
    db $E0                                                               ;B4B2DD;
    dw $30C0,$01F0                                                       ;B4B2DE;
    db $E0                                                               ;B4B2E2;
    dw $30C0,$01E8                                                       ;B4B2E3;
    db $E0                                                               ;B4B2E7;
    dw $30CB,$01E0                                                       ;B4B2E8;
    db $E0                                                               ;B4B2EC;
    dw $30B7                                                             ;B4B2ED;

DebugSpritemaps_4B_EnemyNames_KAGO:
    dw $0004,$01F8                                                       ;B4B2EF;
    db $E0                                                               ;B4B2F3;
    dw $30C0,$01F0                                                       ;B4B2F4;
    db $E0                                                               ;B4B2F8;
    dw $30B6,$01E8                                                       ;B4B2F9;
    db $E0                                                               ;B4B2FD;
    dw $30B0,$01E0                                                       ;B4B2FE;
    db $E0                                                               ;B4B302;
    dw $30BA                                                             ;B4B303;

DebugSpritemaps_4C_EnemyNames_KAME:
    dw $0004,$01F8                                                       ;B4B305;
    db $E0                                                               ;B4B309;
    dw $30B4,$01F0                                                       ;B4B30A;
    db $E0                                                               ;B4B30E;
    dw $30BC,$01E8                                                       ;B4B30F;
    db $E0                                                               ;B4B313;
    dw $30B0,$01E0                                                       ;B4B314;
    db $E0                                                               ;B4B318;
    dw $30BA                                                             ;B4B319;

DebugSpritemaps_4D_EnemyNames_KAMER:
    dw $0005,$0000                                                       ;B4B31B;
    db $E0                                                               ;B4B31F;
    dw $30C3,$01F8                                                       ;B4B320;
    db $E0                                                               ;B4B324;
    dw $30B4,$01F0                                                       ;B4B325;
    db $E0                                                               ;B4B329;
    dw $30BC,$01E8                                                       ;B4B32A;
    db $E0                                                               ;B4B32E;
    dw $30B0,$01E0                                                       ;B4B32F;
    db $E0                                                               ;B4B333;
    dw $30BA                                                             ;B4B334;

DebugSpritemaps_4E_EnemyNames_KANI:
    dw $0004,$01F8                                                       ;B4B336;
    db $E0                                                               ;B4B33A;
    dw $30B8,$01F0                                                       ;B4B33B;
    db $E0                                                               ;B4B33F;
    dw $30BD,$01E8                                                       ;B4B340;
    db $E0                                                               ;B4B344;
    dw $30B0,$01E0                                                       ;B4B345;
    db $E0                                                               ;B4B349;
    dw $30BA                                                             ;B4B34A;

DebugSpritemaps_4F_EnemyNames_KOMA:
    dw $0004,$01F8                                                       ;B4B34C;
    db $E0                                                               ;B4B350;
    dw $30B0,$01F0                                                       ;B4B351;
    db $E0                                                               ;B4B355;
    dw $30BC,$01E8                                                       ;B4B356;
    db $E0                                                               ;B4B35A;
    dw $30C0,$01E0                                                       ;B4B35B;
    db $E0                                                               ;B4B35F;
    dw $30BA                                                             ;B4B360;

DebugSpritemaps_50_EnemyNames_KZAN:
    dw $0004,$01F8                                                       ;B4B362;
    db $E0                                                               ;B4B366;
    dw $30BD,$01F0                                                       ;B4B367;
    db $E0                                                               ;B4B36B;
    dw $30B0,$01E8                                                       ;B4B36C;
    db $E0                                                               ;B4B370;
    dw $30CB,$01E0                                                       ;B4B371;
    db $E0                                                               ;B4B375;
    dw $30BA                                                             ;B4B376;

DebugSpritemaps_51_EnemyNames_LAVAMAN:
    dw $0007,$0010                                                       ;B4B378;
    db $E0                                                               ;B4B37C;
    dw $30BD,$0008                                                       ;B4B37D;
    db $E0                                                               ;B4B381;
    dw $30B0,$0000                                                       ;B4B382;
    db $E0                                                               ;B4B386;
    dw $30BC,$01F8                                                       ;B4B387;
    db $E0                                                               ;B4B38B;
    dw $30B0,$01F0                                                       ;B4B38C;
    db $E0                                                               ;B4B390;
    dw $30C7,$01E0                                                       ;B4B391;
    db $E0                                                               ;B4B395;
    dw $30BB,$01E8                                                       ;B4B396;
    db $E0                                                               ;B4B39A;
    dw $30B0                                                             ;B4B39B;

DebugSpritemaps_52_EnemyNames_MELLA:
    dw $0005,$0000                                                       ;B4B39D;
    db $E0                                                               ;B4B3A1;
    dw $30B0,$01F8                                                       ;B4B3A2;
    db $E0                                                               ;B4B3A6;
    dw $30BB,$01F0                                                       ;B4B3A7;
    db $E0                                                               ;B4B3AB;
    dw $30BB,$01E8                                                       ;B4B3AC;
    db $E0                                                               ;B4B3B0;
    dw $30B4,$01E0                                                       ;B4B3B1;
    db $E0                                                               ;B4B3B5;
    dw $30BC                                                             ;B4B3B6;

DebugSpritemaps_53_EnemyNames_MEMU:
    dw $0004,$01F8                                                       ;B4B3B8;
    db $E0                                                               ;B4B3BC;
    dw $30C6,$01E8                                                       ;B4B3BD;
    db $E0                                                               ;B4B3C1;
    dw $30B4,$01E0                                                       ;B4B3C2;
    db $E0                                                               ;B4B3C6;
    dw $30BC,$01F0                                                       ;B4B3C7;
    db $E0                                                               ;B4B3CB;
    dw $30BC                                                             ;B4B3CC;

DebugSpritemaps_54_EnemyNames_MERO:
    dw $0004,$01F8                                                       ;B4B3CE;
    db $E0                                                               ;B4B3D2;
    dw $30C0,$01F0                                                       ;B4B3D3;
    db $E0                                                               ;B4B3D7;
    dw $30C3,$01E8                                                       ;B4B3D8;
    db $E0                                                               ;B4B3DC;
    dw $30B4,$01E0                                                       ;B4B3DD;
    db $E0                                                               ;B4B3E1;
    dw $30BC                                                             ;B4B3E2;

DebugSpritemaps_55_EnemyNames_METALEE:
    dw $0007,$0010                                                       ;B4B3E4;
    db $E0                                                               ;B4B3E8;
    dw $30B4,$0008                                                       ;B4B3E9;
    db $E0                                                               ;B4B3ED;
    dw $30B4,$0000                                                       ;B4B3EE;
    db $E0                                                               ;B4B3F2;
    dw $30BB,$01F8                                                       ;B4B3F3;
    db $E0                                                               ;B4B3F7;
    dw $30B0,$01F0                                                       ;B4B3F8;
    db $E0                                                               ;B4B3FC;
    dw $30C5,$01E8                                                       ;B4B3FD;
    db $E0                                                               ;B4B401;
    dw $30B4,$01E0                                                       ;B4B402;
    db $E0                                                               ;B4B406;
    dw $30BC                                                             ;B4B407;

DebugSpritemaps_56_EnemyNames_METMOD:
    dw $0006,$0008                                                       ;B4B409;
    db $E0                                                               ;B4B40D;
    dw $30B3,$0000                                                       ;B4B40E;
    db $E0                                                               ;B4B412;
    dw $30C0,$01F8                                                       ;B4B413;
    db $E0                                                               ;B4B417;
    dw $30BC,$01F0                                                       ;B4B418;
    db $E0                                                               ;B4B41C;
    dw $30C5,$01E8                                                       ;B4B41D;
    db $E0                                                               ;B4B421;
    dw $30B4,$01E0                                                       ;B4B422;
    db $E0                                                               ;B4B426;
    dw $30BC                                                             ;B4B427;

DebugSpritemaps_57_EnemyNames_METROID:
    dw $0007,$0010                                                       ;B4B429;
    db $E0                                                               ;B4B42D;
    dw $30B3,$0008                                                       ;B4B42E;
    db $E0                                                               ;B4B432;
    dw $30B8,$01F8                                                       ;B4B433;
    db $E0                                                               ;B4B437;
    dw $30C3,$0000                                                       ;B4B438;
    db $E0                                                               ;B4B43C;
    dw $30C0,$01F0                                                       ;B4B43D;
    db $E0                                                               ;B4B441;
    dw $30C5,$01E8                                                       ;B4B442;
    db $E0                                                               ;B4B446;
    dw $30B4,$01E0                                                       ;B4B447;
    db $E0                                                               ;B4B44B;
    dw $30BC                                                             ;B4B44C;

DebugSpritemaps_58_EnemyNames_MULTI:
    dw $0005,$0000                                                       ;B4B44E;
    db $E0                                                               ;B4B452;
    dw $30B8,$01F8                                                       ;B4B453;
    db $E0                                                               ;B4B457;
    dw $30C5,$01F0                                                       ;B4B458;
    db $E0                                                               ;B4B45C;
    dw $30BB,$01E8                                                       ;B4B45D;
    db $E0                                                               ;B4B461;
    dw $30C6,$01E0                                                       ;B4B462;
    db $E0                                                               ;B4B466;
    dw $30BC                                                             ;B4B467;

DebugSpritemaps_59_EnemyNames_MZOOMER:
    dw $0007,$01F8                                                       ;B4B469;
    db $E0                                                               ;B4B46D;
    dw $30C0,$01F0                                                       ;B4B46E;
    db $E0                                                               ;B4B472;
    dw $30C0,$01E8                                                       ;B4B473;
    db $E0                                                               ;B4B477;
    dw $30CB,$0010                                                       ;B4B478;
    db $E0                                                               ;B4B47C;
    dw $30C3,$0008                                                       ;B4B47D;
    db $E0                                                               ;B4B481;
    dw $30B4,$0000                                                       ;B4B482;
    db $E0                                                               ;B4B486;
    dw $30BC,$01E0                                                       ;B4B487;
    db $E0                                                               ;B4B48B;
    dw $30BC                                                             ;B4B48C;

DebugSpritemaps_5A_EnemyNames_NDRA:
    dw $0004,$01F8                                                       ;B4B48E;
    db $E0                                                               ;B4B492;
    dw $30B0,$01F0                                                       ;B4B493;
    db $E0                                                               ;B4B497;
    dw $30C3,$01E8                                                       ;B4B498;
    db $E0                                                               ;B4B49C;
    dw $30B3,$01E0                                                       ;B4B49D;
    db $E0                                                               ;B4B4A1;
    dw $30BD                                                             ;B4B4A2;

DebugSpritemaps_5B_EnemyNames_NOMI:
    dw $0004,$01F8                                                       ;B4B4A4;
    db $E0                                                               ;B4B4A8;
    dw $30B8,$01F0                                                       ;B4B4A9;
    db $E0                                                               ;B4B4AD;
    dw $30BC,$01E8                                                       ;B4B4AE;
    db $E0                                                               ;B4B4B2;
    dw $30C0,$01E0                                                       ;B4B4B3;
    db $E0                                                               ;B4B4B7;
    dw $30BD                                                             ;B4B4B8;

DebugSpritemaps_5C_EnemyNames_NOVA:
    dw $0004,$01F8                                                       ;B4B4BA;
    db $E0                                                               ;B4B4BE;
    dw $30B0,$01F0                                                       ;B4B4BF;
    db $E0                                                               ;B4B4C3;
    dw $30C7,$01E8                                                       ;B4B4C4;
    db $E0                                                               ;B4B4C8;
    dw $30C0,$01E0                                                       ;B4B4C9;
    db $E0                                                               ;B4B4CD;
    dw $30BD                                                             ;B4B4CE;

DebugSpritemaps_5D_EnemyNames_OUM:
    dw $0003,$01F0                                                       ;B4B4D0;
    db $E0                                                               ;B4B4D4;
    dw $30BC,$01E8                                                       ;B4B4D5;
    db $E0                                                               ;B4B4D9;
    dw $30C6,$01E0                                                       ;B4B4DA;
    db $E0                                                               ;B4B4DE;
    dw $30C0                                                             ;B4B4DF;

DebugSpritemaps_5E_EnemyNames_OUMU:
    dw $0004,$01F8                                                       ;B4B4E1;
    db $E0                                                               ;B4B4E5;
    dw $30C6,$01F0                                                       ;B4B4E6;
    db $E0                                                               ;B4B4EA;
    dw $30BC,$01E8                                                       ;B4B4EB;
    db $E0                                                               ;B4B4EF;
    dw $30C6,$01E0                                                       ;B4B4F0;
    db $E0                                                               ;B4B4F4;
    dw $30C0                                                             ;B4B4F5;

DebugSpritemaps_5F_EnemyNames_PIPE:
    dw $0004,$01F8                                                       ;B4B4F7;
    db $E0                                                               ;B4B4FB;
    dw $30B4,$01F0                                                       ;B4B4FC;
    db $E0                                                               ;B4B500;
    dw $30C1,$01E8                                                       ;B4B501;
    db $E0                                                               ;B4B505;
    dw $30B8,$01E0                                                       ;B4B506;
    db $E0                                                               ;B4B50A;
    dw $30C1                                                             ;B4B50B;

DebugSpritemaps_60_EnemyNames_POLYP:
    dw $0005,$0000                                                       ;B4B50D;
    db $E0                                                               ;B4B511;
    dw $30C1,$01F0                                                       ;B4B512;
    db $E0                                                               ;B4B516;
    dw $30BB,$01F8                                                       ;B4B517;
    db $E0                                                               ;B4B51B;
    dw $30CA,$01E8                                                       ;B4B51C;
    db $E0                                                               ;B4B520;
    dw $30C0,$01E0                                                       ;B4B521;
    db $E0                                                               ;B4B525;
    dw $30C1                                                             ;B4B526;

DebugSpritemaps_61_EnemyNames_PUROMI:
    dw $0006,$0008                                                       ;B4B528;
    db $E0                                                               ;B4B52C;
    dw $30B8,$0000                                                       ;B4B52D;
    db $E0                                                               ;B4B531;
    dw $30BC,$01F8                                                       ;B4B532;
    db $E0                                                               ;B4B536;
    dw $30C0,$01F0                                                       ;B4B537;
    db $E0                                                               ;B4B53B;
    dw $30C3,$01E8                                                       ;B4B53C;
    db $E0                                                               ;B4B540;
    dw $30C6,$01E0                                                       ;B4B541;
    db $E0                                                               ;B4B545;
    dw $30C1                                                             ;B4B546;

DebugSpritemaps_62_EnemyNames_PUU:
    dw $0003,$01F0                                                       ;B4B548;
    db $E0                                                               ;B4B54C;
    dw $30C6,$01E8                                                       ;B4B54D;
    db $E0                                                               ;B4B551;
    dw $30C6,$01E0                                                       ;B4B552;
    db $E0                                                               ;B4B556;
    dw $30C1                                                             ;B4B557;

DebugSpritemaps_63_EnemyNames_PUYO:
    dw $0004,$01F8                                                       ;B4B559;
    db $E0                                                               ;B4B55D;
    dw $30C0,$01F0                                                       ;B4B55E;
    db $E0                                                               ;B4B562;
    dw $30CA,$01E8                                                       ;B4B563;
    db $E0                                                               ;B4B567;
    dw $30C6,$01E0                                                       ;B4B568;
    db $E0                                                               ;B4B56C;
    dw $30C1                                                             ;B4B56D;

DebugSpritemaps_64_EnemyNames_REFLEC:
    dw $0006,$0008                                                       ;B4B56F;
    db $E0                                                               ;B4B573;
    dw $30B2,$0000                                                       ;B4B574;
    db $E0                                                               ;B4B578;
    dw $30B4,$01F8                                                       ;B4B579;
    db $E0                                                               ;B4B57D;
    dw $30BB,$01F0                                                       ;B4B57E;
    db $E0                                                               ;B4B582;
    dw $30B5,$01E8                                                       ;B4B583;
    db $E0                                                               ;B4B587;
    dw $30B4,$01E0                                                       ;B4B588;
    db $E0                                                               ;B4B58C;
    dw $30C3                                                             ;B4B58D;

DebugSpritemaps_65_EnemyNames_RINKA:
    dw $0005,$0000                                                       ;B4B58F;
    db $E0                                                               ;B4B593;
    dw $30B0,$01F8                                                       ;B4B594;
    db $E0                                                               ;B4B598;
    dw $30BA,$01F0                                                       ;B4B599;
    db $E0                                                               ;B4B59D;
    dw $30BD,$01E8                                                       ;B4B59E;
    db $E0                                                               ;B4B5A2;
    dw $30B8,$01E0                                                       ;B4B5A3;
    db $E0                                                               ;B4B5A7;
    dw $30C3                                                             ;B4B5A8;

DebugSpritemaps_66_EnemyNames_RIO:
    dw $0003,$01F0                                                       ;B4B5AA;
    db $E0                                                               ;B4B5AE;
    dw $30C0,$01E8                                                       ;B4B5AF;
    db $E0                                                               ;B4B5B3;
    dw $30B8,$01E0                                                       ;B4B5B4;
    db $E0                                                               ;B4B5B8;
    dw $30C3                                                             ;B4B5B9;

DebugSpritemaps_67_EnemyNames_RIPPER1:
    dw $0007,$0010                                                       ;B4B5BB;
    db $E0                                                               ;B4B5BF;
    dw $30D1,$0000                                                       ;B4B5C0;
    db $E0                                                               ;B4B5C4;
    dw $30B4,$01F8                                                       ;B4B5C5;
    db $E0                                                               ;B4B5C9;
    dw $30C1,$01F0                                                       ;B4B5CA;
    db $E0                                                               ;B4B5CE;
    dw $30C1,$01E8                                                       ;B4B5CF;
    db $E0                                                               ;B4B5D3;
    dw $30B8,$0008                                                       ;B4B5D4;
    db $E0                                                               ;B4B5D8;
    dw $30C3,$01E0                                                       ;B4B5D9;
    db $E0                                                               ;B4B5DD;
    dw $30C3                                                             ;B4B5DE;

DebugSpritemaps_68_EnemyNames_RIPPER2:
    dw $0007,$0010                                                       ;B4B5E0;
    db $E0                                                               ;B4B5E4;
    dw $30D2,$0000                                                       ;B4B5E5;
    db $E0                                                               ;B4B5E9;
    dw $30B4,$01F8                                                       ;B4B5EA;
    db $E0                                                               ;B4B5EE;
    dw $30C1,$01F0                                                       ;B4B5EF;
    db $E0                                                               ;B4B5F3;
    dw $30C1,$01E8                                                       ;B4B5F4;
    db $E0                                                               ;B4B5F8;
    dw $30B8,$0008                                                       ;B4B5F9;
    db $E0                                                               ;B4B5FD;
    dw $30C3,$01E0                                                       ;B4B5FE;
    db $E0                                                               ;B4B602;
    dw $30C3                                                             ;B4B603;

DebugSpritemaps_69_EnemyNames_ROBO:
    dw $0004,$01F8                                                       ;B4B605;
    db $E0                                                               ;B4B609;
    dw $30C0,$01F0                                                       ;B4B60A;
    db $E0                                                               ;B4B60E;
    dw $30B1,$01E8                                                       ;B4B60F;
    db $E0                                                               ;B4B613;
    dw $30C0,$01E0                                                       ;B4B614;
    db $E0                                                               ;B4B618;
    dw $30C3                                                             ;B4B619;

DebugSpritemaps_6A_EnemyNames_RSTONE:
    dw $0006,$0008                                                       ;B4B61B;
    db $E0                                                               ;B4B61F;
    dw $30B4,$0000                                                       ;B4B620;
    db $E0                                                               ;B4B624;
    dw $30BD,$01F8                                                       ;B4B625;
    db $E0                                                               ;B4B629;
    dw $30C0,$01F0                                                       ;B4B62A;
    db $E0                                                               ;B4B62E;
    dw $30C5,$01E8                                                       ;B4B62F;
    db $E0                                                               ;B4B633;
    dw $30C4,$01E0                                                       ;B4B634;
    db $E0                                                               ;B4B638;
    dw $30C3                                                             ;B4B639;

DebugSpritemaps_6B_EnemyNames_SABOTEN:
    dw $0007,$0010                                                       ;B4B63B;
    db $E0                                                               ;B4B63F;
    dw $30BD,$0008                                                       ;B4B640;
    db $E0                                                               ;B4B644;
    dw $30B4,$0000                                                       ;B4B645;
    db $E0                                                               ;B4B649;
    dw $30C5,$01F8                                                       ;B4B64A;
    db $E0                                                               ;B4B64E;
    dw $30C0,$01F0                                                       ;B4B64F;
    db $E0                                                               ;B4B653;
    dw $30B1,$01E8                                                       ;B4B654;
    db $E0                                                               ;B4B658;
    dw $30B0,$01E0                                                       ;B4B659;
    db $E0                                                               ;B4B65D;
    dw $30C4                                                             ;B4B65E;

DebugSpritemaps_6C_EnemyNames_SBUG:
    dw $0004,$01F8                                                       ;B4B660;
    db $E0                                                               ;B4B664;
    dw $30B6,$01F0                                                       ;B4B665;
    db $E0                                                               ;B4B669;
    dw $30C6,$01E8                                                       ;B4B66A;
    db $E0                                                               ;B4B66E;
    dw $30B1,$01E0                                                       ;B4B66F;
    db $E0                                                               ;B4B673;
    dw $30C4                                                             ;B4B674;

DebugSpritemaps_6D_EnemyNames_SCLAYD:
    dw $0006,$0008                                                       ;B4B676;
    db $E0                                                               ;B4B67A;
    dw $30B3,$0000                                                       ;B4B67B;
    db $E0                                                               ;B4B67F;
    dw $30CA,$01F8                                                       ;B4B680;
    db $E0                                                               ;B4B684;
    dw $30B0,$01F0                                                       ;B4B685;
    db $E0                                                               ;B4B689;
    dw $30BB,$01E8                                                       ;B4B68A;
    db $E0                                                               ;B4B68E;
    dw $30B2,$01E0                                                       ;B4B68F;
    db $E0                                                               ;B4B693;
    dw $30C4                                                             ;B4B694;

DebugSpritemaps_6E_EnemyNames_SDEATH:
    dw $0006,$0008                                                       ;B4B696;
    db $E0                                                               ;B4B69A;
    dw $30B7,$0000                                                       ;B4B69B;
    db $E0                                                               ;B4B69F;
    dw $30C5,$01F8                                                       ;B4B6A0;
    db $E0                                                               ;B4B6A4;
    dw $30B0,$01F0                                                       ;B4B6A5;
    db $E0                                                               ;B4B6A9;
    dw $30B4,$01E8                                                       ;B4B6AA;
    db $E0                                                               ;B4B6AE;
    dw $30B3,$01E0                                                       ;B4B6AF;
    db $E0                                                               ;B4B6B3;
    dw $30C4                                                             ;B4B6B4;

DebugSpritemaps_6F_EnemyNames_SHUTTER1:
    dw $0008,$0018                                                       ;B4B6B6;
    db $E0                                                               ;B4B6BA;
    dw $30D1,$0010                                                       ;B4B6BB;
    db $E0                                                               ;B4B6BF;
    dw $30C3,$0008                                                       ;B4B6C0;
    db $E0                                                               ;B4B6C4;
    dw $30B4,$0000                                                       ;B4B6C5;
    db $E0                                                               ;B4B6C9;
    dw $30C5,$01F8                                                       ;B4B6CA;
    db $E0                                                               ;B4B6CE;
    dw $30C5,$01F0                                                       ;B4B6CF;
    db $E0                                                               ;B4B6D3;
    dw $30C6,$01E8                                                       ;B4B6D4;
    db $E0                                                               ;B4B6D8;
    dw $30B7,$01E0                                                       ;B4B6D9;
    db $E0                                                               ;B4B6DD;
    dw $30C4                                                             ;B4B6DE;

DebugSpritemaps_70_EnemyNames_SHUTTER2:
    dw $0008,$0018                                                       ;B4B6E0;
    db $E0                                                               ;B4B6E4;
    dw $30D2,$0010                                                       ;B4B6E5;
    db $E0                                                               ;B4B6E9;
    dw $30C3,$0008                                                       ;B4B6EA;
    db $E0                                                               ;B4B6EE;
    dw $30B4,$0000                                                       ;B4B6EF;
    db $E0                                                               ;B4B6F3;
    dw $30C5,$01F8                                                       ;B4B6F4;
    db $E0                                                               ;B4B6F8;
    dw $30C5,$01F0                                                       ;B4B6F9;
    db $E0                                                               ;B4B6FD;
    dw $30C6,$01E8                                                       ;B4B6FE;
    db $E0                                                               ;B4B702;
    dw $30B7,$01E0                                                       ;B4B703;
    db $E0                                                               ;B4B707;
    dw $30C4                                                             ;B4B708;

DebugSpritemaps_71_EnemyNames_SIDE:
    dw $0004,$01F8                                                       ;B4B70A;
    db $E0                                                               ;B4B70E;
    dw $30B4,$01F0                                                       ;B4B70F;
    db $E0                                                               ;B4B713;
    dw $30B3,$01E8                                                       ;B4B714;
    db $E0                                                               ;B4B718;
    dw $30B8,$01E0                                                       ;B4B719;
    db $E0                                                               ;B4B71D;
    dw $30C4                                                             ;B4B71E;

DebugSpritemaps_72_EnemyNames_SKREE:
    dw $0005,$0000                                                       ;B4B720;
    db $E0                                                               ;B4B724;
    dw $30B4,$01F8                                                       ;B4B725;
    db $E0                                                               ;B4B729;
    dw $30B4,$01F0                                                       ;B4B72A;
    db $E0                                                               ;B4B72E;
    dw $30C3,$01E8                                                       ;B4B72F;
    db $E0                                                               ;B4B733;
    dw $30BA,$01E0                                                       ;B4B734;
    db $E0                                                               ;B4B738;
    dw $30C4                                                             ;B4B739;

DebugSpritemaps_73_EnemyNames_SPA:
    dw $0003,$01F0                                                       ;B4B73B;
    db $E0                                                               ;B4B73F;
    dw $30B0,$01E8                                                       ;B4B740;
    db $E0                                                               ;B4B744;
    dw $30C1,$01E0                                                       ;B4B745;
    db $E0                                                               ;B4B749;
    dw $30C4                                                             ;B4B74A;

DebugSpritemaps_74_EnemyNames_SQUEEWPT:
    dw $0008,$0018                                                       ;B4B74C;
    db $E0                                                               ;B4B750;
    dw $30C5,$0010                                                       ;B4B751;
    db $E0                                                               ;B4B755;
    dw $30C1,$0008                                                       ;B4B756;
    db $E0                                                               ;B4B75A;
    dw $30C8,$0000                                                       ;B4B75B;
    db $E0                                                               ;B4B75F;
    dw $30B4,$01F8                                                       ;B4B760;
    db $E0                                                               ;B4B764;
    dw $30B4,$01F0                                                       ;B4B765;
    db $E0                                                               ;B4B769;
    dw $30C6,$01E8                                                       ;B4B76A;
    db $E0                                                               ;B4B76E;
    dw $30C2,$01E0                                                       ;B4B76F;
    db $E0                                                               ;B4B773;
    dw $30C4                                                             ;B4B774;

DebugSpritemaps_75_EnemyNames_SSIDE:
    dw $0005,$0000                                                       ;B4B776;
    db $E0                                                               ;B4B77A;
    dw $30B4,$01F8                                                       ;B4B77B;
    db $E0                                                               ;B4B77F;
    dw $30B3,$01F0                                                       ;B4B780;
    db $E0                                                               ;B4B784;
    dw $30B8,$01E8                                                       ;B4B785;
    db $E0                                                               ;B4B789;
    dw $30C4,$01E0                                                       ;B4B78A;
    db $E0                                                               ;B4B78E;
    dw $30C4                                                             ;B4B78F;

DebugSpritemaps_76_EnemyNames_STOKE:
    dw $0005,$0000                                                       ;B4B791;
    db $E0                                                               ;B4B795;
    dw $30B4,$01F8                                                       ;B4B796;
    db $E0                                                               ;B4B79A;
    dw $30BA,$01F0                                                       ;B4B79B;
    db $E0                                                               ;B4B79F;
    dw $30C0,$01E8                                                       ;B4B7A0;
    db $E0                                                               ;B4B7A4;
    dw $30C5,$01E0                                                       ;B4B7A5;
    db $E0                                                               ;B4B7A9;
    dw $30C4                                                             ;B4B7AA;

DebugSpritemaps_77_EnemyNames_TOGE:
    dw $0004,$01E0                                                       ;B4B7AC;
    db $E0                                                               ;B4B7B0;
    dw $30C5,$01F8                                                       ;B4B7B1;
    db $E0                                                               ;B4B7B5;
    dw $30B4,$01F0                                                       ;B4B7B6;
    db $E0                                                               ;B4B7BA;
    dw $30B6,$01E8                                                       ;B4B7BB;
    db $E0                                                               ;B4B7BF;
    dw $30C0                                                             ;B4B7C0;

DebugSpritemaps_78_EnemyNames_VIOLA:
    dw $0005,$01F8                                                       ;B4B7C2;
    db $E0                                                               ;B4B7C6;
    dw $30BB,$0000                                                       ;B4B7C7;
    db $E0                                                               ;B4B7CB;
    dw $30B0,$01F0                                                       ;B4B7CC;
    db $E0                                                               ;B4B7D0;
    dw $30C0,$01E8                                                       ;B4B7D1;
    db $E0                                                               ;B4B7D5;
    dw $30B8,$01E0                                                       ;B4B7D6;
    db $E0                                                               ;B4B7DA;
    dw $30C7                                                             ;B4B7DB;

DebugSpritemaps_79_EnemyNames_WAVER:
    dw $0005,$0000                                                       ;B4B7DD;
    db $E0                                                               ;B4B7E1;
    dw $30C3,$01F8                                                       ;B4B7E2;
    db $E0                                                               ;B4B7E6;
    dw $30B4,$01F0                                                       ;B4B7E7;
    db $E0                                                               ;B4B7EB;
    dw $30C7,$01E8                                                       ;B4B7EC;
    db $E0                                                               ;B4B7F0;
    dw $30B0,$01E0                                                       ;B4B7F1;
    db $E0                                                               ;B4B7F5;
    dw $30C8                                                             ;B4B7F6;

DebugSpritemaps_7A_EnemyNames_YARD:
    dw $0004,$01F8                                                       ;B4B7F8;
    db $E0                                                               ;B4B7FC;
    dw $30B3,$01F0                                                       ;B4B7FD;
    db $E0                                                               ;B4B801;
    dw $30C3,$01E8                                                       ;B4B802;
    db $E0                                                               ;B4B806;
    dw $30B0,$01E0                                                       ;B4B807;
    db $E0                                                               ;B4B80B;
    dw $30CA                                                             ;B4B80C;

DebugSpritemaps_7B_EnemyNames_ZEB:
    dw $0003,$01F0                                                       ;B4B80E;
    db $E0                                                               ;B4B812;
    dw $30B1,$01E8                                                       ;B4B813;
    db $E0                                                               ;B4B817;
    dw $30B4,$01E0                                                       ;B4B818;
    db $E0                                                               ;B4B81C;
    dw $30CB                                                             ;B4B81D;

DebugSpritemaps_7C_EnemyNames_ZEBBO:
    dw $0005,$0000                                                       ;B4B81F;
    db $E0                                                               ;B4B823;
    dw $30C0,$01F8                                                       ;B4B824;
    db $E0                                                               ;B4B828;
    dw $30B1,$01F0                                                       ;B4B829;
    db $E0                                                               ;B4B82D;
    dw $30B1,$01E8                                                       ;B4B82E;
    db $E0                                                               ;B4B832;
    dw $30B4,$01E0                                                       ;B4B833;
    db $E0                                                               ;B4B837;
    dw $30CB                                                             ;B4B838;

DebugSpritemaps_7D_EnemyNames_ZEELA:
    dw $0005,$0000                                                       ;B4B83A;
    db $E0                                                               ;B4B83E;
    dw $30B0,$01F8                                                       ;B4B83F;
    db $E0                                                               ;B4B843;
    dw $30BB,$01F0                                                       ;B4B844;
    db $E0                                                               ;B4B848;
    dw $30B4,$01E8                                                       ;B4B849;
    db $E0                                                               ;B4B84D;
    dw $30B4,$01E0                                                       ;B4B84E;
    db $E0                                                               ;B4B852;
    dw $30CB                                                             ;B4B853;

DebugSpritemaps_7E_EnemyNames_ZOA:
    dw $0003,$01F0                                                       ;B4B855;
    db $E0                                                               ;B4B859;
    dw $30B0,$01E8                                                       ;B4B85A;
    db $E0                                                               ;B4B85E;
    dw $30C0,$01E0                                                       ;B4B85F;
    db $E0                                                               ;B4B863;
    dw $30CB                                                             ;B4B864;

DebugSpritemaps_7F_EnemyNames_ZOOMER:
    dw $0006,$0008                                                       ;B4B866;
    db $E0                                                               ;B4B86A;
    dw $30C3,$0000                                                       ;B4B86B;
    db $E0                                                               ;B4B86F;
    dw $30B4,$01F8                                                       ;B4B870;
    db $E0                                                               ;B4B874;
    dw $30BC,$01F0                                                       ;B4B875;
    db $E0                                                               ;B4B879;
    dw $30C0,$01E8                                                       ;B4B87A;
    db $E0                                                               ;B4B87E;
    dw $30C0,$01E0                                                       ;B4B87F;
    db $E0                                                               ;B4B883;
    dw $30CB                                                             ;B4B884;

DebugSpritemaps_1C_TextCursor:
    dw $0001,$0000                                                       ;B4B886;
    db $00                                                               ;B4B88A;
    dw $303E                                                             ;B4B88B;

DebugSpritemaps_30_EnemyNames_NoDebug:
    dw $0008,$0018                                                       ;B4B88D;
    db $E0                                                               ;B4B891;
    dw $30CD,$0010                                                       ;B4B892;
    db $E0                                                               ;B4B896;
    dw $30E6,$0008                                                       ;B4B897;
    db $E0                                                               ;B4B89B;
    dw $30F4,$0000                                                       ;B4B89C;
    db $E0                                                               ;B4B8A0;
    dw $30E1,$01F8                                                       ;B4B8A1;
    db $E0                                                               ;B4B8A5;
    dw $30E4,$01F0                                                       ;B4B8A6;
    db $E0                                                               ;B4B8AA;
    dw $30B3,$01E8                                                       ;B4B8AB;
    db $E0                                                               ;B4B8AF;
    dw $30EE,$01E0                                                       ;B4B8B0;
    db $E0                                                               ;B4B8B4;
    dw $30BD                                                             ;B4B8B5;

DebugSpritemaps_80_EnemyNames_BATTA1br:
    dw $0008,$0018                                                       ;B4B8B7;
    db $E0                                                               ;B4B8BB;
    dw $30F1,$0010                                                       ;B4B8BC;
    db $E0                                                               ;B4B8C0;
    dw $30E1,$0008                                                       ;B4B8C1;
    db $E0                                                               ;B4B8C5;
    dw $30D1,$0000                                                       ;B4B8C6;
    db $E0                                                               ;B4B8CA;
    dw $30B0,$01F8                                                       ;B4B8CB;
    db $E0                                                               ;B4B8CF;
    dw $30C5,$01F0                                                       ;B4B8D0;
    db $E0                                                               ;B4B8D4;
    dw $30C5,$01E8                                                       ;B4B8D5;
    db $E0                                                               ;B4B8D9;
    dw $30B0,$01E0                                                       ;B4B8DA;
    db $E0                                                               ;B4B8DE;
    dw $30B1                                                             ;B4B8DF;

DebugSpritemaps_81_EnemyNames_BATTA1NO:
    dw $0008,$0018                                                       ;B4B8E1;
    db $E0                                                               ;B4B8E5;
    dw $30EE,$0010                                                       ;B4B8E6;
    db $E0                                                               ;B4B8EA;
    dw $30ED,$0008                                                       ;B4B8EB;
    db $E0                                                               ;B4B8EF;
    dw $30D1,$0000                                                       ;B4B8F0;
    db $E0                                                               ;B4B8F4;
    dw $30B0,$01F8                                                       ;B4B8F5;
    db $E0                                                               ;B4B8F9;
    dw $30C5,$01F0                                                       ;B4B8FA;
    db $E0                                                               ;B4B8FE;
    dw $30C5,$01E8                                                       ;B4B8FF;
    db $E0                                                               ;B4B903;
    dw $30B0,$01E0                                                       ;B4B904;
    db $E0                                                               ;B4B908;
    dw $30B1                                                             ;B4B909;

DebugSpritemaps_82_EnemyNames_BATTA1np:
    dw $0008,$0018                                                       ;B4B90B;
    db $E0                                                               ;B4B90F;
    dw $30EF,$0010                                                       ;B4B910;
    db $E0                                                               ;B4B914;
    dw $30ED,$0008                                                       ;B4B915;
    db $E0                                                               ;B4B919;
    dw $30D1,$0000                                                       ;B4B91A;
    db $E0                                                               ;B4B91E;
    dw $30B0,$01F8                                                       ;B4B91F;
    db $E0                                                               ;B4B923;
    dw $30C5,$01F0                                                       ;B4B924;
    db $E0                                                               ;B4B928;
    dw $30C5,$01E8                                                       ;B4B929;
    db $E0                                                               ;B4B92D;
    dw $30B0,$01E0                                                       ;B4B92E;
    db $E0                                                               ;B4B932;
    dw $30B1                                                             ;B4B933;

DebugSpritemaps_8_EnemyNames_BATTA1ml:
    dw $0008,$0018                                                       ;B4B935;
    db $E0                                                               ;B4B939;
    dw $30EB,$0010                                                       ;B4B93A;
    db $E0                                                               ;B4B93E;
    dw $30EC,$0008                                                       ;B4B93F;
    db $E0                                                               ;B4B943;
    dw $30D1,$0000                                                       ;B4B944;
    db $E0                                                               ;B4B948;
    dw $30B0,$01F8                                                       ;B4B949;
    db $E0                                                               ;B4B94D;
    dw $30C5,$01F0                                                       ;B4B94E;
    db $E0                                                               ;B4B952;
    dw $30C5,$01E8                                                       ;B4B953;
    db $E0                                                               ;B4B957;
    dw $30B0,$01E0                                                       ;B4B958;
    db $E0                                                               ;B4B95C;
    dw $30B1                                                             ;B4B95D;

DebugSpritemaps_84_EnemyNames_BATTA1ts:
    dw $0008,$0018                                                       ;B4B95F;
    db $E0                                                               ;B4B963;
    dw $30F2,$0010                                                       ;B4B964;
    db $E0                                                               ;B4B968;
    dw $30F3,$0008                                                       ;B4B969;
    db $E0                                                               ;B4B96D;
    dw $30D1,$0000                                                       ;B4B96E;
    db $E0                                                               ;B4B972;
    dw $30B0,$01F8                                                       ;B4B973;
    db $E0                                                               ;B4B977;
    dw $30C5,$01F0                                                       ;B4B978;
    db $E0                                                               ;B4B97C;
    dw $30C5,$01E8                                                       ;B4B97D;
    db $E0                                                               ;B4B981;
    dw $30B0,$01E0                                                       ;B4B982;
    db $E0                                                               ;B4B986;
    dw $30B1                                                             ;B4B987;

DebugSpritemaps_85_EnemyNames_BATTA2br:
    dw $0008,$0018                                                       ;B4B989;
    db $E0                                                               ;B4B98D;
    dw $30F1,$0010                                                       ;B4B98E;
    db $E0                                                               ;B4B992;
    dw $30E1,$0008                                                       ;B4B993;
    db $E0                                                               ;B4B997;
    dw $30D2,$0000                                                       ;B4B998;
    db $E0                                                               ;B4B99C;
    dw $30B0,$01F8                                                       ;B4B99D;
    db $E0                                                               ;B4B9A1;
    dw $30C5,$01F0                                                       ;B4B9A2;
    db $E0                                                               ;B4B9A6;
    dw $30C5,$01E8                                                       ;B4B9A7;
    db $E0                                                               ;B4B9AB;
    dw $30B0,$01E0                                                       ;B4B9AC;
    db $E0                                                               ;B4B9B0;
    dw $30B1                                                             ;B4B9B1;

DebugSpritemaps_86_EnemyNames_BATTA2no:
    dw $0008,$0008                                                       ;B4B9B3;
    db $E0                                                               ;B4B9B7;
    dw $30D2,$0018                                                       ;B4B9B8;
    db $E0                                                               ;B4B9BC;
    dw $30EE,$0010                                                       ;B4B9BD;
    db $E0                                                               ;B4B9C1;
    dw $30ED,$0000                                                       ;B4B9C2;
    db $E0                                                               ;B4B9C6;
    dw $30B0,$01F8                                                       ;B4B9C7;
    db $E0                                                               ;B4B9CB;
    dw $30C5,$01F0                                                       ;B4B9CC;
    db $E0                                                               ;B4B9D0;
    dw $30C5,$01E8                                                       ;B4B9D1;
    db $E0                                                               ;B4B9D5;
    dw $30B0,$01E0                                                       ;B4B9D6;
    db $E0                                                               ;B4B9DA;
    dw $30B1                                                             ;B4B9DB;

DebugSpritemaps_87_EnemyNames_BATTA2np:
    dw $0008,$0018                                                       ;B4B9DD;
    db $E0                                                               ;B4B9E1;
    dw $30EF,$0008                                                       ;B4B9E2;
    db $E0                                                               ;B4B9E6;
    dw $30D2,$0010                                                       ;B4B9E7;
    db $E0                                                               ;B4B9EB;
    dw $30ED,$0000                                                       ;B4B9EC;
    db $E0                                                               ;B4B9F0;
    dw $30B0,$01F8                                                       ;B4B9F1;
    db $E0                                                               ;B4B9F5;
    dw $30C5,$01F0                                                       ;B4B9F6;
    db $E0                                                               ;B4B9FA;
    dw $30C5,$01E8                                                       ;B4B9FB;
    db $E0                                                               ;B4B9FF;
    dw $30B0,$01E0                                                       ;B4BA00;
    db $E0                                                               ;B4BA04;
    dw $30B1                                                             ;B4BA05;

DebugSpritemaps_88_EnemyNames_BATTA2ml:
    dw $0008,$0018                                                       ;B4BA07;
    db $E0                                                               ;B4BA0B;
    dw $30EB,$0010                                                       ;B4BA0C;
    db $E0                                                               ;B4BA10;
    dw $30EC,$0008                                                       ;B4BA11;
    db $E0                                                               ;B4BA15;
    dw $30D2,$0000                                                       ;B4BA16;
    db $E0                                                               ;B4BA1A;
    dw $30B0,$01F8                                                       ;B4BA1B;
    db $E0                                                               ;B4BA1F;
    dw $30C5,$01F0                                                       ;B4BA20;
    db $E0                                                               ;B4BA24;
    dw $30C5,$01E8                                                       ;B4BA25;
    db $E0                                                               ;B4BA29;
    dw $30B0,$01E0                                                       ;B4BA2A;
    db $E0                                                               ;B4BA2E;
    dw $30B1                                                             ;B4BA2F;

DebugSpritemaps_89_EnemyNames_BATTA2ts:
    dw $0008,$0018                                                       ;B4BA31;
    db $E0                                                               ;B4BA35;
    dw $30F2,$0010                                                       ;B4BA36;
    db $E0                                                               ;B4BA3A;
    dw $30F3,$0008                                                       ;B4BA3B;
    db $E0                                                               ;B4BA3F;
    dw $30D2,$0000                                                       ;B4BA40;
    db $E0                                                               ;B4BA44;
    dw $30B0,$01F8                                                       ;B4BA45;
    db $E0                                                               ;B4BA49;
    dw $30C5,$01F0                                                       ;B4BA4A;
    db $E0                                                               ;B4BA4E;
    dw $30C5,$01E8                                                       ;B4BA4F;
    db $E0                                                               ;B4BA53;
    dw $30B0,$01E0                                                       ;B4BA54;
    db $E0                                                               ;B4BA58;
    dw $30B1                                                             ;B4BA59;

DebugSpritemaps_8A_EnemyNames_BATTA3br:
    dw $0008,$0018                                                       ;B4BA5B;
    db $E0                                                               ;B4BA5F;
    dw $30F1,$0010                                                       ;B4BA60;
    db $E0                                                               ;B4BA64;
    dw $30E1,$0008                                                       ;B4BA65;
    db $E0                                                               ;B4BA69;
    dw $30D3,$0000                                                       ;B4BA6A;
    db $E0                                                               ;B4BA6E;
    dw $30B0,$01F8                                                       ;B4BA6F;
    db $E0                                                               ;B4BA73;
    dw $30C5,$01F0                                                       ;B4BA74;
    db $E0                                                               ;B4BA78;
    dw $30C5,$01E8                                                       ;B4BA79;
    db $E0                                                               ;B4BA7D;
    dw $30B0,$01E0                                                       ;B4BA7E;
    db $E0                                                               ;B4BA82;
    dw $30B1                                                             ;B4BA83;

DebugSpritemaps_8B_EnemyNames_BATTA3no:
    dw $0008,$0018                                                       ;B4BA85;
    db $E0                                                               ;B4BA89;
    dw $30EE,$0010                                                       ;B4BA8A;
    db $E0                                                               ;B4BA8E;
    dw $30ED,$0008                                                       ;B4BA8F;
    db $E0                                                               ;B4BA93;
    dw $30D3,$0000                                                       ;B4BA94;
    db $E0                                                               ;B4BA98;
    dw $30B0,$01F8                                                       ;B4BA99;
    db $E0                                                               ;B4BA9D;
    dw $30C5,$01F0                                                       ;B4BA9E;
    db $E0                                                               ;B4BAA2;
    dw $30C5,$01E8                                                       ;B4BAA3;
    db $E0                                                               ;B4BAA7;
    dw $30B0,$01E0                                                       ;B4BAA8;
    db $E0                                                               ;B4BAAC;
    dw $30B1                                                             ;B4BAAD;

DebugSpritemaps_8C_EnemyNames_BATTA3np:
    dw $0008,$0018                                                       ;B4BAAF;
    db $E0                                                               ;B4BAB3;
    dw $30EF,$0010                                                       ;B4BAB4;
    db $E0                                                               ;B4BAB8;
    dw $30ED,$0008                                                       ;B4BAB9;
    db $E0                                                               ;B4BABD;
    dw $30D3,$0000                                                       ;B4BABE;
    db $E0                                                               ;B4BAC2;
    dw $30B0,$01F8                                                       ;B4BAC3;
    db $E0                                                               ;B4BAC7;
    dw $30C5,$01F0                                                       ;B4BAC8;
    db $E0                                                               ;B4BACC;
    dw $30C5,$01E8                                                       ;B4BACD;
    db $E0                                                               ;B4BAD1;
    dw $30B0,$01E0                                                       ;B4BAD2;
    db $E0                                                               ;B4BAD6;
    dw $30B1                                                             ;B4BAD7;

DebugSpritemaps_8D_EnemyNames_BATTA3ml:
    dw $0008,$0018                                                       ;B4BAD9;
    db $E0                                                               ;B4BADD;
    dw $30EB,$0010                                                       ;B4BADE;
    db $E0                                                               ;B4BAE2;
    dw $30EC,$0008                                                       ;B4BAE3;
    db $E0                                                               ;B4BAE7;
    dw $30D3,$0000                                                       ;B4BAE8;
    db $E0                                                               ;B4BAEC;
    dw $30B0,$01F8                                                       ;B4BAED;
    db $E0                                                               ;B4BAF1;
    dw $30C5,$01F0                                                       ;B4BAF2;
    db $E0                                                               ;B4BAF6;
    dw $30C5,$01E8                                                       ;B4BAF7;
    db $E0                                                               ;B4BAFB;
    dw $30B0,$01E0                                                       ;B4BAFC;
    db $E0                                                               ;B4BB00;
    dw $30B1                                                             ;B4BB01;

DebugSpritemaps_8E_EnemyNames_BATTA3ts:
    dw $0008,$0018                                                       ;B4BB03;
    db $E0                                                               ;B4BB07;
    dw $30F2,$0010                                                       ;B4BB08;
    db $E0                                                               ;B4BB0C;
    dw $30F3,$0008                                                       ;B4BB0D;
    db $E0                                                               ;B4BB11;
    dw $30D3,$0000                                                       ;B4BB12;
    db $E0                                                               ;B4BB16;
    dw $30B0,$01F8                                                       ;B4BB17;
    db $E0                                                               ;B4BB1B;
    dw $30C5,$01F0                                                       ;B4BB1C;
    db $E0                                                               ;B4BB20;
    dw $30C5,$01E8                                                       ;B4BB21;
    db $E0                                                               ;B4BB25;
    dw $30B0,$01E0                                                       ;B4BB26;
    db $E0                                                               ;B4BB2A;
    dw $30B1                                                             ;B4BB2B;

DebugSpritemaps_14_AreaNames_SF_Crateria:
    dw $0003,$01E8                                                       ;B4BB2D;
    db $F8                                                               ;B4BB31;
    dw $30B5,$01E0                                                       ;B4BB32;
    db $F8                                                               ;B4BB36;
    dw $30C4,$01F8                                                       ;B4BB37;
    db $F8                                                               ;B4BB3B;
    dw $30FD                                                             ;B4BB3C;

DebugSpritemaps_15_AreaNames_BL_Brinstar:
    dw $0003,$01E8                                                       ;B4BB3E;
    db $F8                                                               ;B4BB42;
    dw $30BB,$01E0                                                       ;B4BB43;
    db $F8                                                               ;B4BB47;
    dw $30B1,$01F8                                                       ;B4BB48;
    db $F8                                                               ;B4BB4C;
    dw $30FD                                                             ;B4BB4D;

DebugSpritemaps_16_AreaNames_NO_Norfair:
    dw $0003,$01E8                                                       ;B4BB4F;
    db $F8                                                               ;B4BB53;
    dw $30C0,$01E0                                                       ;B4BB54;
    db $F8                                                               ;B4BB58;
    dw $30BD,$01F8                                                       ;B4BB59;
    db $F8                                                               ;B4BB5D;
    dw $30FD                                                             ;B4BB5E;

DebugSpritemaps_17_AreaNames_NP_WreckedShip:
    dw $0003,$01E8                                                       ;B4BB60;
    db $F8                                                               ;B4BB64;
    dw $30C1,$01E0                                                       ;B4BB65;
    db $F8                                                               ;B4BB69;
    dw $30BD,$01F8                                                       ;B4BB6A;
    db $F8                                                               ;B4BB6E;
    dw $30FD                                                             ;B4BB6F;

DebugSpritemaps_18_AreaNames_ML_Maridia:
    dw $0003,$01E8                                                       ;B4BB71;
    db $F8                                                               ;B4BB75;
    dw $30BB,$01E0                                                       ;B4BB76;
    db $F8                                                               ;B4BB7A;
    dw $30BC,$01F8                                                       ;B4BB7B;
    db $F8                                                               ;B4BB7F;
    dw $30FD                                                             ;B4BB80;

DebugSpritemaps_19_AreaNames_TS_Tourian:
    dw $0003,$01E8                                                       ;B4BB82;
    db $F8                                                               ;B4BB86;
    dw $30C4,$01E0                                                       ;B4BB87;
    db $F8                                                               ;B4BB8B;
    dw $30C5,$01F8                                                       ;B4BB8C;
    db $F8                                                               ;B4BB90;
    dw $30FD                                                             ;B4BB91;

DebugSpritemaps_1A_AreaNames_CO_Ceres:
    dw $0003,$01E8                                                       ;B4BB93;
    db $F8                                                               ;B4BB97;
    dw $30C0,$01E0                                                       ;B4BB98;
    db $F8                                                               ;B4BB9C;
    dw $30B2,$01F8                                                       ;B4BB9D;
    db $F8                                                               ;B4BBA1;
    dw $30FD                                                             ;B4BBA2;

DebugSpritemaps_1B_AreaNames_TT_Debug:
    dw $0003,$01E8                                                       ;B4BBA4;
    db $F8                                                               ;B4BBA8;
    dw $30C5,$01E0                                                       ;B4BBA9;
    db $F8                                                               ;B4BBAD;
    dw $30C5,$01F8                                                       ;B4BBAE;
    db $F8                                                               ;B4BBB2;
    dw $30FD                                                             ;B4BBB3;

DebugSpritemaps_8F_EnemyNames_FUNE:
    dw $0004,$01F8                                                       ;B4BBB5;
    db $E0                                                               ;B4BBB9;
    dw $30B4,$01F0                                                       ;B4BBBA;
    db $E0                                                               ;B4BBBE;
    dw $30BD,$01E8                                                       ;B4BBBF;
    db $E0                                                               ;B4BBC3;
    dw $30C6,$01E0                                                       ;B4BBC4;
    db $E0                                                               ;B4BBC8;
    dw $30B5                                                             ;B4BBC9;

DebugSpritemaps_90_EnemyNames_HATCHI2:
    dw $0006,$0008                                                       ;B4BBCB;
    db $E0                                                               ;B4BBCF;
    dw $30D2,$0000                                                       ;B4BBD0;
    db $E0                                                               ;B4BBD4;
    dw $30B8,$01F8                                                       ;B4BBD5;
    db $E0                                                               ;B4BBD9;
    dw $30B7,$01F0                                                       ;B4BBDA;
    db $E0                                                               ;B4BBDE;
    dw $30B2,$01E8                                                       ;B4BBDF;
    db $E0                                                               ;B4BBE3;
    dw $30B0,$01E0                                                       ;B4BBE4;
    db $E0                                                               ;B4BBE8;
    dw $30B7                                                             ;B4BBE9;

DebugSpritemaps_91_EnemyNames_HATCHI3:
    dw $0006,$0008                                                       ;B4BBEB;
    db $E0                                                               ;B4BBEF;
    dw $30D3,$0000                                                       ;B4BBF0;
    db $E0                                                               ;B4BBF4;
    dw $30B8,$01F8                                                       ;B4BBF5;
    db $E0                                                               ;B4BBF9;
    dw $30B7,$01F0                                                       ;B4BBFA;
    db $E0                                                               ;B4BBFE;
    dw $30B2,$01E8                                                       ;B4BBFF;
    db $E0                                                               ;B4BC03;
    dw $30B0,$01E0                                                       ;B4BC04;
    db $E0                                                               ;B4BC08;
    dw $30B7                                                             ;B4BC09;

DebugSpritemaps_92_EnemyNames_ROBO2:
    dw $0005,$0000                                                       ;B4BC0B;
    db $E0                                                               ;B4BC0F;
    dw $30D2,$01F8                                                       ;B4BC10;
    db $E0                                                               ;B4BC14;
    dw $30C0,$01F0                                                       ;B4BC15;
    db $E0                                                               ;B4BC19;
    dw $30B1,$01E8                                                       ;B4BC1A;
    db $E0                                                               ;B4BC1E;
    dw $30C0,$01E0                                                       ;B4BC1F;
    db $E0                                                               ;B4BC23;
    dw $30C3                                                             ;B4BC24;

Create_Sprite_Object:
    PHX                                                                  ;B4BC26;
    PHY                                                                  ;B4BC27;
    PHP                                                                  ;B4BC28;
    PHB                                                                  ;B4BC29;
    PEA.W $B400                                                          ;B4BC2A;
    PLB                                                                  ;B4BC2D;
    PLB                                                                  ;B4BC2E;
    REP #$30                                                             ;B4BC2F;
    LDX.W #$003E                                                         ;B4BC31;

.loop:
    LDA.L $7EEF78,X                                                      ;B4BC34;
    BEQ .found                                                           ;B4BC38;
    DEX                                                                  ;B4BC3A;
    DEX                                                                  ;B4BC3B;
    BPL .loop                                                            ;B4BC3C;
    BRA .return                                                          ;B4BC3E;


.found:
    LDA.W #$0000                                                         ;B4BC40;
    STA.L $7EF078,X                                                      ;B4BC43;
    STA.L $7EF178,X                                                      ;B4BC47;
    STA.L $7EF278,X                                                      ;B4BC4B;
    STA.L $7EF2F8,X                                                      ;B4BC4F;
    LDA.B $12                                                            ;B4BC53;
    STA.L $7EF0F8,X                                                      ;B4BC55;
    LDA.B $14                                                            ;B4BC59;
    STA.L $7EF1F8,X                                                      ;B4BC5B;
    LDA.B $18                                                            ;B4BC5F;
    STA.L $7EF078,X                                                      ;B4BC61;
    LDA.B $16                                                            ;B4BC65;
    ASL A                                                                ;B4BC67;
    TAY                                                                  ;B4BC68;
    LDA.W SpriteObject_DrawInst_Pointers,Y                               ;B4BC69;
    STA.L $7EEF78,X                                                      ;B4BC6C;
    PHX                                                                  ;B4BC70;
    TAX                                                                  ;B4BC71;
    LDA.L $B40000,X                                                      ;B4BC72;
    PLX                                                                  ;B4BC76;
    STA.L $7EEFF8,X                                                      ;B4BC77;
    STX.B $12                                                            ;B4BC7B;

.return:
    PLB                                                                  ;B4BC7D;
    PLP                                                                  ;B4BC7E;
    PLY                                                                  ;B4BC7F;
    PLX                                                                  ;B4BC80;
    RTL                                                                  ;B4BC81;


HandleSpriteObjects:
    PHX                                                                  ;B4BC82;
    PHY                                                                  ;B4BC83;
    PHP                                                                  ;B4BC84;
    PHB                                                                  ;B4BC85;
    PEA.W $B400                                                          ;B4BC86;
    PLB                                                                  ;B4BC89;
    PLB                                                                  ;B4BC8A;
    REP #$30                                                             ;B4BC8B;
    LDA.W $0A78                                                          ;B4BC8D;
    ORA.W $185E                                                          ;B4BC90;
    BNE .return                                                          ;B4BC93;
    LDX.W #$003E                                                         ;B4BC95;
    STX.W $1844                                                          ;B4BC98;

.loop:
    LDX.W $1844                                                          ;B4BC9B;
    LDA.L $7EEF78,X                                                      ;B4BC9E;
    BEQ .next                                                            ;B4BCA2;
    LDA.L $7EF2F8,X                                                      ;B4BCA4;
    BIT.W #$0001                                                         ;B4BCA8;
    BNE .next                                                            ;B4BCAB;
    LDA.L $7EEFF8,X                                                      ;B4BCAD;
    BMI .ASMInstruction                                                  ;B4BCB1;
    DEC A                                                                ;B4BCB3;
    STA.L $7EEFF8,X                                                      ;B4BCB4;
    BNE .next                                                            ;B4BCB8;
    LDA.L $7EEF78,X                                                      ;B4BCBA;
    INC A                                                                ;B4BCBE;
    INC A                                                                ;B4BCBF;
    INC A                                                                ;B4BCC0;
    INC A                                                                ;B4BCC1;
    STA.L $7EEF78,X                                                      ;B4BCC2;
    TAX                                                                  ;B4BCC6;
    LDA.L $B40000,X                                                      ;B4BCC7;
    CMP.W #$8000                                                         ;B4BCCB;
    BPL .ASMInstruction                                                  ;B4BCCE;
    LDX.W $1844                                                          ;B4BCD0;
    STA.L $7EEFF8,X                                                      ;B4BCD3;

.next:
    LDA.W $1844                                                          ;B4BCD7;
    DEC A                                                                ;B4BCDA;
    DEC A                                                                ;B4BCDB;
    STA.W $1844                                                          ;B4BCDC;
    BPL .loop                                                            ;B4BCDF;
    BRA .return                                                          ;B4BCE1;


.ASMInstruction:
    STA.B $12                                                            ;B4BCE3;
    PEA.W .next-1                                                        ;B4BCE5;
    JMP.W ($0012)                                                        ;B4BCE8;


.return:
    PLB                                                                  ;B4BCEB;
    PLP                                                                  ;B4BCEC;
    PLY                                                                  ;B4BCED;
    PLX                                                                  ;B4BCEE;
    RTL                                                                  ;B4BCEF;


Instruction_SpriteObject_GoBack4Bytes:
    LDX.W $1844                                                          ;B4BCF0;
    LDA.L $7EEF78,X                                                      ;B4BCF3;
    DEC A                                                                ;B4BCF7;
    DEC A                                                                ;B4BCF8;
    DEC A                                                                ;B4BCF9;
    DEC A                                                                ;B4BCFA;
    STA.L $7EEF78,X                                                      ;B4BCFB;
    LDA.W #$7FFF                                                         ;B4BCFF;
    STA.L $7EEFF8,X                                                      ;B4BD02;
    RTS                                                                  ;B4BD06;


Instruction_SpriteObject_Delete:
    LDX.W $1844                                                          ;B4BD07;
    LDA.W #$0000                                                         ;B4BD0A;
    STA.L $7EEF78,X                                                      ;B4BD0D;
    RTS                                                                  ;B4BD11;


Instruction_SpriteObject_GotoParameter:
    LDX.W $1844                                                          ;B4BD12;
    LDA.L $7EEF78,X                                                      ;B4BD15;
    TAX                                                                  ;B4BD19;
    LDA.L $B40002,X                                                      ;B4BD1A;
    LDX.W $1844                                                          ;B4BD1E;
    STA.L $7EEF78,X                                                      ;B4BD21;
    TAX                                                                  ;B4BD25;
    LDA.L $B40000,X                                                      ;B4BD26;
    LDX.W $1844                                                          ;B4BD2A;
    STA.L $7EEFF8,X                                                      ;B4BD2D;
    RTS                                                                  ;B4BD31;


DrawSpriteObjects:
    PHX                                                                  ;B4BD32;
    PHY                                                                  ;B4BD33;
    PHP                                                                  ;B4BD34;
    PHB                                                                  ;B4BD35;
    PEA.W $B400                                                          ;B4BD36;
    PLB                                                                  ;B4BD39;
    PLB                                                                  ;B4BD3A;
    REP #$30                                                             ;B4BD3B;
    LDX.W #$003E                                                         ;B4BD3D;

.loop:
    LDA.L $7EEF78,X                                                      ;B4BD40;
    BEQ .next                                                            ;B4BD44;
    LDA.L $7EF0F8,X                                                      ;B4BD46;
    SEC                                                                  ;B4BD4A;
    SBC.W $0911                                                          ;B4BD4B;
    STA.B $14                                                            ;B4BD4E;
    CLC                                                                  ;B4BD50;
    ADC.W #$0010                                                         ;B4BD51;
    BMI .next                                                            ;B4BD54;
    CMP.W #$0120                                                         ;B4BD56;
    BPL .next                                                            ;B4BD59;
    LDA.L $7EF1F8,X                                                      ;B4BD5B;
    SEC                                                                  ;B4BD5F;
    SBC.W $0915                                                          ;B4BD60;
    STA.B $12                                                            ;B4BD63;
    BMI .next                                                            ;B4BD65;
    CMP.W #$0110                                                         ;B4BD67;
    BPL .next                                                            ;B4BD6A;
    LDA.L $7EF078,X                                                      ;B4BD6C;
    AND.W #$0E00                                                         ;B4BD70;
    STA.B $03                                                            ;B4BD73;
    LDA.L $7EF078,X                                                      ;B4BD75;
    AND.W #$01FF                                                         ;B4BD79;
    STA.B $00                                                            ;B4BD7C;
    PHX                                                                  ;B4BD7E;
    LDA.L $7EEF78,X                                                      ;B4BD7F;
    TAX                                                                  ;B4BD83;
    LDA.L $B40002,X                                                      ;B4BD84;
    TAY                                                                  ;B4BD88;
    JSL.L AddSpritemapToOAM_WithBaseTileNumber_8AB8                      ;B4BD89;
    PLX                                                                  ;B4BD8D;

.next:
    DEX                                                                  ;B4BD8E;
    DEX                                                                  ;B4BD8F;
    BPL .loop                                                            ;B4BD90;
    PLB                                                                  ;B4BD92;
    PLP                                                                  ;B4BD93;
    PLY                                                                  ;B4BD94;
    PLX                                                                  ;B4BD95;
    RTL                                                                  ;B4BD96;


ClearSpriteObjects:
    LDX.W #$03FE                                                         ;B4BD97;
    LDA.W #$0000                                                         ;B4BD9A;

.loop:
    STA.L $7EEF78,X                                                      ;B4BD9D;
    DEX                                                                  ;B4BDA1;
    DEX                                                                  ;B4BDA2;
    BNE .loop                                                            ;B4BDA3;
    RTL                                                                  ;B4BDA5;


SpriteObject_DrawInst_Empty:
    dw $0000                                                             ;B4BDA6;

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

InstList_SpriteObject_3D_DraygonFoamingAtTheMouth:
    dw $0006                                                             ;B4BE24;
    dw SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_0              ;B4BE26;
    dw $0006                                                             ;B4BE28;
    dw SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_1              ;B4BE2A;
    dw $0007                                                             ;B4BE2C;
    dw SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_2              ;B4BE2E;
    dw $0007                                                             ;B4BE30;
    dw SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_3              ;B4BE32;
    dw $0008                                                             ;B4BE34;
    dw SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_4              ;B4BE36;
    dw $0008                                                             ;B4BE38;
    dw SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_5              ;B4BE3A;
    dw $0009                                                             ;B4BE3C;
    dw SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_6              ;B4BE3E;
    dw $0009                                                             ;B4BE40;
    dw SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_7              ;B4BE42;
    dw Instruction_SpriteObject_Delete                                   ;B4BE44;

UNUSED_InstList_SpriteObject_B4BE46:
    dw $0005                                                             ;B4BE46;
    dw UNUSED_SpriteObjectSpritemaps_B4DD3C                              ;B4BE48;
    dw $0005                                                             ;B4BE4A;
    dw UNUSED_SpriteObjectSpritemaps_B4DD43                              ;B4BE4C;
    dw $0005                                                             ;B4BE4E;
    dw UNUSED_SpriteObjectSpritemaps_B4DD4A                              ;B4BE50;
    dw Instruction_SpriteObject_Delete                                   ;B4BE52;

UNUSED_InstList_SpriteObject_2F_B4BE54:
    dw $0001                                                             ;B4BE54;
    dw UNUSED_SpriteObjectSpritemaps_2F_B4D594                           ;B4BE56;
    dw Instruction_SpriteObject_GoBack4Bytes                             ;B4BE58;

UNUSED_InstList_SpriteObject_0_BeamCharge_B4BE5A:
    dw $0003                                                             ;B4BE5A;
    dw UNUSED_SpriteObjectSpritemaps_0_BeamCharge_0_B4CAC9               ;B4BE5C;
    dw $0003                                                             ;B4BE5E;
    dw UNUSED_SpriteObjectSpritemaps_0_BeamCharge_1_B4CAD0               ;B4BE60;
    dw $0003                                                             ;B4BE62;
    dw UNUSED_SpriteObjectSpritemaps_0_BeamCharge_2_B4CAD7               ;B4BE64;
    dw $0003                                                             ;B4BE66;
    dw UNUSED_SpriteObjectSpritemaps_0_BeamCharge_3_B4CADE               ;B4BE68;
    dw Instruction_SpriteObject_Delete                                   ;B4BE6A;

UNUSED_InstList_SpriteObject_1_MBElbowChargeParticles_B4BE6C:
    dw $0005                                                             ;B4BE6C;
    dw UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_0_B4CAF4          ;B4BE6E;
    dw $0004                                                             ;B4BE70;
    dw UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_1_B4CB05          ;B4BE72;
    dw $0003                                                             ;B4BE74;
    dw UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_2_B4CB16          ;B4BE76;
    dw $0003                                                             ;B4BE78;
    dw UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_3_B4CB27          ;B4BE7A;
    dw $0003                                                             ;B4BE7C;
    dw UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_4_B4CB38          ;B4BE7E;
    dw $0003                                                             ;B4BE80;
    dw UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_5_B4CB49          ;B4BE82;
    dw Instruction_SpriteObject_Delete                                   ;B4BE84;

UNSUED_InstList_SpriteObject_2_MBElbowChargeEnergy_B4BE86:
    dw $0004                                                             ;B4BE86;
    dw UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_0_B4CB5A            ;B4BE88;
    dw $0003                                                             ;B4BE8A;
    dw UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_1_B4CB6B            ;B4BE8C;
    dw $0002                                                             ;B4BE8E;
    dw UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_2_B4CB7C            ;B4BE90;
    dw $0002                                                             ;B4BE92;
    dw UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_3_B4CB8D            ;B4BE94;
    dw $0002                                                             ;B4BE96;
    dw UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_4_B4CB9E            ;B4BE98;
    dw $0002                                                             ;B4BE9A;
    dw UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_5_B4CBAF            ;B4BE9C;
    dw $000C                                                             ;B4BE9E;
    dw SpriteObjectSpritemaps_3_SmallExplosion_0                         ;B4BEA0;
    dw Instruction_SpriteObject_Delete                                   ;B4BEA2;

InstList_SpriteObject_3_SmallExplosion:
    dw $0004                                                             ;B4BEA4;
    dw SpriteObjectSpritemaps_3_SmallExplosion_0                         ;B4BEA6;
    dw $0006                                                             ;B4BEA8;
    dw SpriteObjectSpritemaps_3_SmallExplosion_1                         ;B4BEAA;
    dw $0005                                                             ;B4BEAC;
    dw SpriteObjectSpritemaps_3_SmallExplosion_2                         ;B4BEAE;
    dw $0005                                                             ;B4BEB0;
    dw SpriteObjectSpritemaps_3_SmallExplosion_3                         ;B4BEB2;
    dw $0005                                                             ;B4BEB4;
    dw SpriteObjectSpritemaps_3_SmallExplosion_4                         ;B4BEB6;
    dw $0006                                                             ;B4BEB8;
    dw SpriteObjectSpritemaps_3_SmallExplosion_5                         ;B4BEBA;
    dw Instruction_SpriteObject_Delete                                   ;B4BEBC;

UNUSED_InstList_SpriteObject_4_BombExplosion_B4BEBE:
    dw $0003                                                             ;B4BEBE;
    dw UNSUED_SpriteObjectSpritemaps_4_BombExplosion_0_B4CC35            ;B4BEC0;
    dw $0003                                                             ;B4BEC2;
    dw UNSUED_SpriteObjectSpritemaps_4_BombExplosion_1_B4CC4B            ;B4BEC4;
    dw $0004                                                             ;B4BEC6;
    dw UNSUED_SpriteObjectSpritemaps_4_BombExplosion_2_B4CC61            ;B4BEC8;
    dw $0004                                                             ;B4BECA;
    dw UNSUED_SpriteObjectSpritemaps_4_BombExplosion_3_B4CC77            ;B4BECC;
    dw $0004                                                             ;B4BECE;
    dw UNSUED_SpriteObjectSpritemaps_4_BombExplosion_4_B4CC8D            ;B4BED0;
    dw Instruction_SpriteObject_Delete                                   ;B4BED2;

UNUSED_InstList_SpriteObject_5_BeamTrail_B4BED4:
    dw $0008                                                             ;B4BED4;
    dw UNSUED_SpriteObjectSpritemaps_5_BeamTrail_0_B4CCB9                ;B4BED6;
    dw $0008                                                             ;B4BED8;
    dw UNSUED_SpriteObjectSpritemaps_5_BeamTrail_1_B4CCC0                ;B4BEDA;
    dw $0008                                                             ;B4BEDC;
    dw UNSUED_SpriteObjectSpritemaps_5_BeamTrail_2_B4CCC7                ;B4BEDE;
    dw $0008                                                             ;B4BEE0;
    dw UNSUED_SpriteObjectSpritemaps_5_BeamTrail_3_B4CCCE                ;B4BEE2;
    dw $0018                                                             ;B4BEE4;
    dw UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_3_B4CB8D            ;B4BEE6;
    dw Instruction_SpriteObject_Delete                                   ;B4BEE8;

InstList_SpriteObject_6_DudShot:
    dw $0004                                                             ;B4BEEA;
    dw SpriteObjectSpritemaps_6_DudShot_0                                ;B4BEEC;
    dw $0004                                                             ;B4BEEE;
    dw SpriteObjectSpritemaps_6_DudShot_1                                ;B4BEF0;
    dw $0004                                                             ;B4BEF2;
    dw SpriteObjectSpritemaps_6_DudShot_2                                ;B4BEF4;
    dw $0004                                                             ;B4BEF6;
    dw SpriteObjectSpritemaps_6_DudShot_3                                ;B4BEF8;
    dw $0004                                                             ;B4BEFA;
    dw SpriteObjectSpritemaps_6_DudShot_4                                ;B4BEFC;
    dw $0004                                                             ;B4BEFE;
    dw SpriteObjectSpritemaps_6_DudShot_5                                ;B4BF00;
    dw Instruction_SpriteObject_Delete                                   ;B4BF02;

UNUSED_InstList_SpriteObject_7_PowerBomb_B4BF04:
    dw $0005                                                             ;B4BF04;
    dw UNSUED_SpriteObjectSpritemaps_7_PowerBomb_0_B4CCD5                ;B4BF06;
    dw $0005                                                             ;B4BF08;
    dw UNSUED_SpriteObjectSpritemaps_7_PowerBomb_1_B4CCDC                ;B4BF0A;
    dw $0005                                                             ;B4BF0C;
    dw UNSUED_SpriteObjectSpritemaps_7_PowerBomb_2_B4CCE3                ;B4BF0E;
    dw Instruction_SpriteObject_Delete                                   ;B4BF10;

UNUSED_InstList_SpriteObject_8_ElevatorPad_B4BF12:
    dw $0001                                                             ;B4BF12;
    dw UNSUED_SpriteObjectSpritemaps_8_1C_ElevatorPad_0_B4CD57           ;B4BF14;
    dw $0001                                                             ;B4BF16;
    dw UNSUED_SpriteObjectSpritemaps_8_1C_ElevatorPad_1_B4CD6D           ;B4BF18;
    dw Instruction_SpriteObject_Delete                                   ;B4BF1A;

InstList_SpriteObject_9_SmallDudShot:
    dw $0005                                                             ;B4BF1C;
    dw SpriteObjectSpritemaps_A_PirateLandingDustCloud_0                 ;B4BF1E;
    dw $0005                                                             ;B4BF20;
    dw SpriteObjectSpritemaps_9_SmallDustCloud_0                         ;B4BF22;
    dw $0005                                                             ;B4BF24;
    dw SpriteObjectSpritemaps_9_SmallDustCloud_1                         ;B4BF26;
    dw $0005                                                             ;B4BF28;
    dw SpriteObjectSpritemaps_9_SmallDustCloud_2                         ;B4BF2A;
    dw $0005                                                             ;B4BF2C;
    dw SpriteObjectSpritemaps_9_SmallDustCloud_3                         ;B4BF2E;
    dw Instruction_SpriteObject_Delete                                   ;B4BF30;

InstList_SpriteObject_A_SpacePirateLandingDustCloud:
    dw $0003                                                             ;B4BF32;
    dw SpriteObjectSpritemaps_A_PirateLandingDustCloud_0                 ;B4BF34;
    dw $0003                                                             ;B4BF36;
    dw SpriteObjectSpritemaps_A_PirateLandingDustCloud_1                 ;B4BF38;
    dw $0003                                                             ;B4BF3A;
    dw SpriteObjectSpritemaps_A_PirateLandingDustCloud_2                 ;B4BF3C;
    dw $0003                                                             ;B4BF3E;
    dw SpriteObjectSpritemaps_A_PirateLandingDustCloud_3                 ;B4BF40;
    dw Instruction_SpriteObject_Delete                                   ;B4BF42;

UNUSED_InstList_SpriteObject_B_EyeDoorSweatDrop_B4BF44:
    dw $0005                                                             ;B4BF44;
    dw UNSUED_SpriteObjectSpritemaps_B_EyeDoorSweatDrop_0_B4CDD1         ;B4BF46;
    dw $0005                                                             ;B4BF48;
    dw UNSUED_SpriteObjectSpritemaps_B_EyeDoorSweatDrop_1_B4CDD8         ;B4BF4A;
    dw $0005                                                             ;B4BF4C;
    dw UNSUED_SpriteObjectSpritemaps_B_EyeDoorSweatDrop_2_B4CDDF         ;B4BF4E;
    dw $0005                                                             ;B4BF50;
    dw UNSUED_SpriteObjectSpritemaps_B_EyeDoorSweatDrop_3_B4CDE6         ;B4BF52;
    dw Instruction_SpriteObject_Delete                                   ;B4BF54;

InstList_SpriteObject_C_Smoke:
    dw $0008                                                             ;B4BF56;
    dw SpriteObjectSpritemaps_C_Smoke_0                                  ;B4BF58;
    dw $0008                                                             ;B4BF5A;
    dw SpriteObjectSpritemaps_C_Smoke_1                                  ;B4BF5C;
    dw $0008                                                             ;B4BF5E;
    dw SpriteObjectSpritemaps_C_Smoke_2                                  ;B4BF60;
    dw $0008                                                             ;B4BF62;
    dw SpriteObjectSpritemaps_C_Smoke_3                                  ;B4BF64;
    dw Instruction_SpriteObject_Delete                                   ;B4BF66;

UNUSED_InstList_SpriteObject_1C_ElevatorPad_B4BF68:
    dw $0001                                                             ;B4BF68;
    dw UNSUED_SpriteObjectSpritemaps_8_1C_ElevatorPad_0_B4CD57           ;B4BF6A;
    dw $0001                                                             ;B4BF6C;
    dw UNSUED_SpriteObjectSpritemaps_8_1C_ElevatorPad_1_B4CD6D           ;B4BF6E;
    dw Instruction_SpriteObject_GotoParameter                            ;B4BF70;
    dw UNUSED_InstList_SpriteObject_1C_ElevatorPad_B4BF68                ;B4BF72;

InstList_SpriteObject_1D_BigExplosion:
    dw $0005                                                             ;B4BF74;
    dw SpriteObjectSpritemaps_1D_BigExplosion_0                          ;B4BF76;
    dw $0005                                                             ;B4BF78;
    dw SpriteObjectSpritemaps_1D_BigExplosion_1                          ;B4BF7A;
    dw $0005                                                             ;B4BF7C;
    dw SpriteObjectSpritemaps_1D_BigExplosion_2                          ;B4BF7E;
    dw $0005                                                             ;B4BF80;
    dw SpriteObjectSpritemaps_1D_BigExplosion_3                          ;B4BF82;
    dw $0005                                                             ;B4BF84;
    dw SpriteObjectSpritemaps_1D_BigExplosion_4                          ;B4BF86;
    dw $0005                                                             ;B4BF88;
    dw SpriteObjectSpritemaps_1D_BigExplosion_5                          ;B4BF8A;
    dw Instruction_SpriteObject_Delete                                   ;B4BF8C;

UNUSED_InstList_SpriteObject_D_SmallEnergyDrop_B4BF8E:
    dw $0008                                                             ;B4BF8E;
    dw UNUSED_SpriteObjectSpritemaps_D_SmallEnergyDrop_0_B4CE1E          ;B4BF90;
    dw $0008                                                             ;B4BF92;
    dw UNUSED_SpriteObjectSpritemaps_D_SmallEnergyDrop_1_B4CE25          ;B4BF94;
    dw $0008                                                             ;B4BF96;
    dw UNUSED_SpriteObjectSpritemaps_D_SmallEnergyDrop_2_B4CE2C          ;B4BF98;
    dw $0008                                                             ;B4BF9A;
    dw UNUSED_SpriteObjectSpritemaps_D_SmallEnergyDrop_3_B4CE33          ;B4BF9C;
    dw Instruction_SpriteObject_Delete                                   ;B4BF9E;

UNUSED_InstList_SpriteObject_E_BigEnergyDrop_B4BFA0:
    dw $0008                                                             ;B4BFA0;
    dw UNUSED_SpriteObjectSpritemaps_E_BigEnergyDrop_0_B4CE3A            ;B4BFA2;
    dw $0008                                                             ;B4BFA4;
    dw UNUSED_SpriteObjectSpritemaps_E_BigEnergyDrop_1_B4CE50            ;B4BFA6;
    dw $0008                                                             ;B4BFA8;
    dw UNUSED_SpriteObjectSpritemaps_E_BigEnergyDrop_2_B4CE66            ;B4BFAA;
    dw $0008                                                             ;B4BFAC;
    dw UNUSED_SpriteObjectSpritemaps_E_BigEnergyDrop_3_B4CE7C            ;B4BFAE;
    dw Instruction_SpriteObject_Delete                                   ;B4BFB0;

UNUSED_InstList_SpriteObject_F_Bomb_B4BFB2:
    dw $0005                                                             ;B4BFB2;
    dw UNUSED_SpriteObjectSpritemaps_F_Bomb_0_B4CE83                     ;B4BFB4;
    dw $0005                                                             ;B4BFB6;
    dw UNUSED_SpriteObjectSpritemaps_F_Bomb_1_B4CE8A                     ;B4BFB8;
    dw $0005                                                             ;B4BFBA;
    dw UNUSED_SpriteObjectSpritemaps_F_Bomb_2_B4CE91                     ;B4BFBC;
    dw $0005                                                             ;B4BFBE;
    dw UNUSED_SpriteObjectSpritemaps_F_Bomb_3_B4CE98                     ;B4BFC0;
    dw Instruction_SpriteObject_Delete                                   ;B4BFC2;

UNUSED_InstList_SpriteObject_10_WeirdSmallEnergyDrop_B4BFC4:
    dw $0010                                                             ;B4BFC4;
    dw UNUSED_SpriteObjectSpritemaps_10_SmallEnergyDrop_0_B4CF87         ;B4BFC6;
    dw $0010                                                             ;B4BFC8;
    dw UNUSED_SpriteObjectSpritemaps_10_SmallEnergyDrop_1_B4CF8E         ;B4BFCA;
    dw $0010                                                             ;B4BFCC;
    dw UNUSED_SpriteObjectSpritemaps_10_SmallEnergyDrop_2_B4CF95         ;B4BFCE;
    dw Instruction_SpriteObject_Delete                                   ;B4BFD0;

UNUSED_InstList_SpriteObject_11_RockParticles_B4BFD2:
    dw $0002                                                             ;B4BFD2;
    dw UNUSED_SpriteObjectSpritemaps_11_RockParticles_0_B4C6D8           ;B4BFD4;
    dw $0002                                                             ;B4BFD6;
    dw UNUSED_SpriteObjectSpritemaps_11_RockParticles_1_B4C6EE           ;B4BFD8;
    dw $0002                                                             ;B4BFDA;
    dw UNUSED_SpriteObjectSpritemaps_11_RockParticles_2_B4C704           ;B4BFDC;
    dw $0002                                                             ;B4BFDE;
    dw UNUSED_SpriteObjectSpritemaps_11_RockParticles_3_B4C71A           ;B4BFE0;
    dw $0002                                                             ;B4BFE2;
    dw UNUSED_SpriteObjectSpritemaps_11_RockParticles_4_B4C730           ;B4BFE4;
    dw $0002                                                             ;B4BFE6;
    dw UNUSED_SpriteObjectSpritemaps_11_RockParticles_5_B4C746           ;B4BFE8;
    dw $0002                                                             ;B4BFEA;
    dw UNUSED_SpriteObjectSpritemaps_11_RockParticles_6_B4C75C           ;B4BFEC;
    dw $0002                                                             ;B4BFEE;
    dw UNUSED_SpriteObjectSpritemaps_11_RockParticles_7_B4C772           ;B4BFF0;
    dw $0002                                                             ;B4BFF2;
    dw UNUSED_SpriteObjectSpritemaps_11_RockParticles_8_B4C788           ;B4BFF4;
    dw $0002                                                             ;B4BFF6;
    dw UNUSED_SpriteObjectSpritemaps_11_RockParticles_9_B4C79E           ;B4BFF8;
    dw $0002                                                             ;B4BFFA;
    dw UNUSED_SpriteObjectSpritemaps_11_RockParticles_A_B4C7B4           ;B4BFFC;
    dw $0002                                                             ;B4BFFE;
    dw UNUSED_SpriteObjectSpritemaps_11_RockParticles_B_B4C7CA           ;B4C000;
    dw $0002                                                             ;B4C002;
    dw UNUSED_SpriteObjectSpritemaps_11_RockParticles_C_B4C7E0           ;B4C004;
    dw $0002                                                             ;B4C006;
    dw UNUSED_SpriteObjectSpritemaps_11_RockParticles_D_B4C7F6           ;B4C008;
    dw $0002                                                             ;B4C00A;
    dw UNUSED_SpriteObjectSpritemaps_11_RockParticles_E_B4C80C           ;B4C00C;
    dw $0002                                                             ;B4C00E;
    dw UNUSED_SpriteObjectSpritemaps_11_RockParticles_F_B4C822           ;B4C010;
    dw Instruction_SpriteObject_Delete                                   ;B4C012;

InstList_SpriteObject_12_ShortBigDustCloud:
    dw $0002                                                             ;B4C014;
    dw SpriteObjectSpritemaps_12_15_BigDustCloud_0                       ;B4C016;
    dw $0002                                                             ;B4C018;
    dw SpriteObjectSpritemaps_12_15_BigDustCloud_1                       ;B4C01A;
    dw $0002                                                             ;B4C01C;
    dw SpriteObjectSpritemaps_12_15_BigDustCloud_2                       ;B4C01E;
    dw $0002                                                             ;B4C020;
    dw SpriteObjectSpritemaps_12_15_BigDustCloud_3                       ;B4C022;
    dw Instruction_SpriteObject_Delete                                   ;B4C024;

UNUSED_InstList_SpriteObject_13_ShortBigDustCloudBeam_B4C026:
    dw $0003                                                             ;B4C026;
    dw SpriteObjectSpritemaps_13_14_15_BigDustCloud_4                    ;B4C028;
    dw $0003                                                             ;B4C02A;
    dw SpriteObjectSpritemaps_13_14_15_BigDustCloud_5                    ;B4C02C;
    dw $0003                                                             ;B4C02E;
    dw SpriteObjectSpritemaps_13_14_15_BigDustCloud_6                    ;B4C030;
    dw $0003                                                             ;B4C032;
    dw SpriteObjectSpritemaps_13_14_15_BigDustCloud_7                    ;B4C034;
    dw $0003                                                             ;B4C036;
    dw UNUSED_SpriteObjectSpritemaps_13_14_16_DustCloud_Beam_B4C8AC      ;B4C038;
    dw $0005                                                             ;B4C03A;
    dw UNUSED_SpriteObjectSpritemaps_13_14_16_DustCloud_Beam_B4C8B3      ;B4C03C;
    dw Instruction_SpriteObject_Delete                                   ;B4C03E;

UNUSED_InstList_SpriteObject_14_ShortBigDustCloudBeam_B4C040:
    dw $0003                                                             ;B4C040;
    dw SpriteObjectSpritemaps_13_14_15_BigDustCloud_4                    ;B4C042;
    dw $0003                                                             ;B4C044;
    dw SpriteObjectSpritemaps_13_14_15_BigDustCloud_5                    ;B4C046;
    dw $0003                                                             ;B4C048;
    dw SpriteObjectSpritemaps_13_14_15_BigDustCloud_6                    ;B4C04A;
    dw $0003                                                             ;B4C04C;
    dw SpriteObjectSpritemaps_13_14_15_BigDustCloud_7                    ;B4C04E;
    dw $0003                                                             ;B4C050;
    dw UNUSED_SpriteObjectSpritemaps_13_14_16_DustCloud_Beam_B4C8AC      ;B4C052;
    dw $0003                                                             ;B4C054;
    dw UNUSED_SpriteObjectSpritemaps_13_14_16_DustCloud_Beam_B4C8B3      ;B4C056;
    dw $0003                                                             ;B4C058;
    dw UNUSED_SpriteObjectSpritemaps_14_16_DustCloud_Beam_B4C8BA         ;B4C05A;
    dw Instruction_SpriteObject_Delete                                   ;B4C05C;

InstList_SpriteObject_15_BigDustCloud:
    dw $0005                                                             ;B4C05E;
    dw SpriteObjectSpritemaps_12_15_BigDustCloud_0                       ;B4C060;
    dw $0005                                                             ;B4C062;
    dw SpriteObjectSpritemaps_12_15_BigDustCloud_1                       ;B4C064;
    dw $0005                                                             ;B4C066;
    dw SpriteObjectSpritemaps_12_15_BigDustCloud_2                       ;B4C068;
    dw $0005                                                             ;B4C06A;
    dw SpriteObjectSpritemaps_12_15_BigDustCloud_3                       ;B4C06C;
    dw $0005                                                             ;B4C06E;
    dw SpriteObjectSpritemaps_13_14_15_BigDustCloud_4                    ;B4C070;
    dw $0005                                                             ;B4C072;
    dw SpriteObjectSpritemaps_13_14_15_BigDustCloud_5                    ;B4C074;
    dw $0005                                                             ;B4C076;
    dw SpriteObjectSpritemaps_13_14_15_BigDustCloud_6                    ;B4C078;
    dw $0005                                                             ;B4C07A;
    dw SpriteObjectSpritemaps_13_14_15_BigDustCloud_7                    ;B4C07C;
    dw Instruction_SpriteObject_Delete                                   ;B4C07E;

UNUSED_InstList_SpriteObject_16_WeirdLongBeam_B4C080:
    dw $0001                                                             ;B4C080;
    dw UNUSED_SpriteObjectSpritemaps_13_14_16_DustCloud_Beam_B4C8AC      ;B4C082;
    dw $0001                                                             ;B4C084;
    dw UNUSED_SpriteObjectSpritemaps_13_14_16_DustCloud_Beam_B4C8B3      ;B4C086;
    dw $0001                                                             ;B4C088;
    dw UNUSED_SpriteObjectSpritemaps_14_16_DustCloud_Beam_B4C8BA         ;B4C08A;
    dw $0001                                                             ;B4C08C;
    dw UNUSED_SpriteObjectSpritemaps_16_DustCloud_Beam_B4C8C6            ;B4C08E;
    dw $0001                                                             ;B4C090;
    dw UNUSED_SpriteObjectSpritemaps_16_DustCloud_Beam_B4C8D2            ;B4C092;
    dw $0001                                                             ;B4C094;
    dw UNUSED_SpriteObjectSpritemaps_16_DustCloud_Beam_B4C8E2            ;B4C096;
    dw $0001                                                             ;B4C098;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4         ;B4C09A;
    dw $0001                                                             ;B4C09C;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A         ;B4C09E;
    dw $0001                                                             ;B4C0A0;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4         ;B4C0A2;
    dw $0001                                                             ;B4C0A4;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A         ;B4C0A6;
    dw $0001                                                             ;B4C0A8;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4         ;B4C0AA;
    dw $0001                                                             ;B4C0AC;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A         ;B4C0AE;
    dw $0001                                                             ;B4C0B0;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4         ;B4C0B2;
    dw $0001                                                             ;B4C0B4;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A         ;B4C0B6;
    dw $0001                                                             ;B4C0B8;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4         ;B4C0BA;
    dw $0001                                                             ;B4C0BC;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A         ;B4C0BE;
    dw $0001                                                             ;B4C0C0;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4         ;B4C0C2;
    dw $0001                                                             ;B4C0C4;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A         ;B4C0C6;
    dw $0001                                                             ;B4C0C8;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4         ;B4C0CA;
    dw $0001                                                             ;B4C0CC;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A         ;B4C0CE;
    dw $0001                                                             ;B4C0D0;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4         ;B4C0D2;
    dw $0001                                                             ;B4C0D4;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A         ;B4C0D6;
    dw $0001                                                             ;B4C0D8;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4         ;B4C0DA;
    dw $0001                                                             ;B4C0DC;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A         ;B4C0DE;
    dw $0001                                                             ;B4C0E0;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4         ;B4C0E2;
    dw $0001                                                             ;B4C0E4;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A         ;B4C0E6;
    dw $0001                                                             ;B4C0E8;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4         ;B4C0EA;
    dw $0001                                                             ;B4C0EC;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A         ;B4C0EE;
    dw $0001                                                             ;B4C0F0;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4         ;B4C0F2;
    dw $0001                                                             ;B4C0F4;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A         ;B4C0F6;
    dw $0001                                                             ;B4C0F8;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4         ;B4C0FA;
    dw Instruction_SpriteObject_Delete                                   ;B4C0FC;

UNUSED_InstList_SpriteObject_17_WeirdLongFlickerBeam_B4C0FE:
    dw $0001                                                             ;B4C0FE;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4         ;B4C100;
    dw $0001                                                             ;B4C102;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A         ;B4C104;
    dw $0001                                                             ;B4C106;
    dw UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4         ;B4C108;
    dw Instruction_SpriteObject_Delete                                   ;B4C10A;

InstList_SpriteObject_18_ShortDraygonBreathBubbles:
    dw $0003                                                             ;B4C10C;
    dw SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_0             ;B4C10E;
    dw $0003                                                             ;B4C110;
    dw SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_1             ;B4C112;
    dw $0003                                                             ;B4C114;
    dw SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_2             ;B4C116;
    dw $0003                                                             ;B4C118;
    dw SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_3             ;B4C11A;
    dw $0003                                                             ;B4C11C;
    dw SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_4             ;B4C11E;
    dw $0003                                                             ;B4C120;
    dw SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_5             ;B4C122;
    dw $0003                                                             ;B4C124;
    dw SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_6             ;B4C126;
    dw $0003                                                             ;B4C128;
    dw SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_7             ;B4C12A;
    dw $0003                                                             ;B4C12C;
    dw SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_8             ;B4C12E;
    dw Instruction_SpriteObject_Delete                                   ;B4C130;

UNSUED_InstList_SpriteObject_19_SaveStationElectricity:
    dw $0001                                                             ;B4C132;
    dw UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_0_B4C9A0        ;B4C134;
    dw $0001                                                             ;B4C136;
    dw UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_1_B4C9B6        ;B4C138;
    dw $0001                                                             ;B4C13A;
    dw UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_2_B4C9CC        ;B4C13C;
    dw $0001                                                             ;B4C13E;
    dw UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_3_B4C9E2        ;B4C140;
    dw $0001                                                             ;B4C142;
    dw UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_4_B4C9F8        ;B4C144;
    dw $0001                                                             ;B4C146;
    dw UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_5_B4CA0E        ;B4C148;
    dw $0001                                                             ;B4C14A;
    dw UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_6_B4CA24        ;B4C14C;
    dw $0001                                                             ;B4C14E;
    dw UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_7_B4CA3A        ;B4C150;
    dw Instruction_SpriteObject_Delete                                   ;B4C152;

UNUSED_InstList_SpriteObject_1A_ExpandingVerticalGate_B4C154:
    dw $0010                                                             ;B4C154;
    dw UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_0_B4CA50         ;B4C156;
    dw $0010                                                             ;B4C158;
    dw UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_1_B4CA5C         ;B4C15A;
    dw $0010                                                             ;B4C15C;
    dw UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_2_B4CA63         ;B4C15E;
    dw $0010                                                             ;B4C160;
    dw UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_3_B4CA6F         ;B4C162;
    dw $0010                                                             ;B4C164;
    dw UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_4_B4CA7B         ;B4C166;
    dw $0010                                                             ;B4C168;
    dw UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_5_B4CA8C         ;B4C16A;
    dw $0010                                                             ;B4C16C;
    dw UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_6_B4CA9D         ;B4C16E;
    dw $0010                                                             ;B4C170;
    dw UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_7_B4CAB3         ;B4C172;
    dw Instruction_SpriteObject_Delete                                   ;B4C174;

UNUSED_InstList_SpriteObject_1B_ContractingVerticalGate:
    dw $0004                                                             ;B4C176;
    dw UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_7_B4CAB3         ;B4C178;
    dw $0004                                                             ;B4C17A;
    dw UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_6_B4CA9D         ;B4C17C;
    dw $0004                                                             ;B4C17E;
    dw UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_5_B4CA8C         ;B4C180;
    dw $0004                                                             ;B4C182;
    dw UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_4_B4CA7B         ;B4C184;
    dw $0004                                                             ;B4C186;
    dw UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_3_B4CA6F         ;B4C188;
    dw $0004                                                             ;B4C18A;
    dw UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_2_B4CA63         ;B4C18C;
    dw $0004                                                             ;B4C18E;
    dw UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_1_B4CA5C         ;B4C190;
    dw $0004                                                             ;B4C192;
    dw UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_0_B4CA50         ;B4C194;
    dw Instruction_SpriteObject_Delete                                   ;B4C196;

UNUSED_InstList_SpriteObject_1E_B4C198:
    dw $0005                                                             ;B4C198;
    dw UNUSED_SpriteObjectSpritemaps_1E_0_B4C630                         ;B4C19A;
    dw $0005                                                             ;B4C19C;
    dw UNUSED_SpriteObjectSpritemaps_1E_1_B4C637                         ;B4C19E;
    dw $0005                                                             ;B4C1A0;
    dw UNUSED_SpriteObjectSpritemaps_1E_0_B4C630                         ;B4C1A2;
    dw $0005                                                             ;B4C1A4;
    dw UNUSED_SpriteObjectSpritemaps_1E_2_B4C63E                         ;B4C1A6;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C1A8;
    dw UNUSED_InstList_SpriteObject_1E_B4C198                            ;B4C1AA;

UNUSED_InstList_SpriteObject_1F_B4C1AC:
    dw $0005                                                             ;B4C1AC;
    dw UNUSED_SpriteObjectSpritemaps_1F_0_B4C645                         ;B4C1AE;
    dw $0005                                                             ;B4C1B0;
    dw UNUSED_SpriteObjectSpritemaps_1F_1_B4C645                         ;B4C1B2;
    dw $0005                                                             ;B4C1B4;
    dw UNUSED_SpriteObjectSpritemaps_1F_0_B4C645                         ;B4C1B6;
    dw $0005                                                             ;B4C1B8;
    dw UNUSED_SpriteObjectSpritemaps_1F_2_B4C653                         ;B4C1BA;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C1BC;
    dw UNUSED_InstList_SpriteObject_1F_B4C1AC                            ;B4C1BE;

UNUSED_InstList_SpriteObject_20_B4C1C0:
    dw $0005                                                             ;B4C1C0;
    dw UNUSED_SpriteObjectSpritemaps_20_0_B4C65A                         ;B4C1C2;
    dw $0005                                                             ;B4C1C4;
    dw UNUSED_SpriteObjectSpritemaps_20_1_B4C661                         ;B4C1C6;
    dw $0005                                                             ;B4C1C8;
    dw UNUSED_SpriteObjectSpritemaps_20_0_B4C65A                         ;B4C1CA;
    dw $0005                                                             ;B4C1CC;
    dw UNUSED_SpriteObjectSpritemaps_20_2_B4C668                         ;B4C1CE;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C1D0;
    dw UNUSED_InstList_SpriteObject_20_B4C1C0                            ;B4C1D2;

UNUSED_InstList_SpriteObject_21_B4C1D4:
    dw $0005                                                             ;B4C1D4;
    dw UNUSED_SpriteObjectSpritemaps_21_0_B4C66F                         ;B4C1D6;
    dw $0005                                                             ;B4C1D8;
    dw UNUSED_SpriteObjectSpritemaps_21_1_B4C676                         ;B4C1DA;
    dw $0005                                                             ;B4C1DC;
    dw UNUSED_SpriteObjectSpritemaps_21_0_B4C66F                         ;B4C1DE;
    dw $0005                                                             ;B4C1E0;
    dw UNUSED_SpriteObjectSpritemaps_21_2_B4C67D                         ;B4C1E2;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C1E4;
    dw UNUSED_InstList_SpriteObject_21_B4C1D4                            ;B4C1E6;

UNUSED_InstList_SpriteObject_22_B4C1E8:
    dw $0005                                                             ;B4C1E8;
    dw UNUSED_SpriteObjectSpritemaps_22_0_B4C684                         ;B4C1EA;
    dw $0005                                                             ;B4C1EC;
    dw UNUSED_SpriteObjectSpritemaps_22_1_B4C68B                         ;B4C1EE;
    dw $0005                                                             ;B4C1F0;
    dw UNUSED_SpriteObjectSpritemaps_22_0_B4C684                         ;B4C1F2;
    dw $0005                                                             ;B4C1F4;
    dw UNUSED_SpriteObjectSpritemaps_22_2_B4C692                         ;B4C1F6;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C1F8;
    dw UNUSED_InstList_SpriteObject_22_B4C1E8                            ;B4C1FA;

UNUSED_InstList_SpriteObject_23_B4C1FC:
    dw $0005                                                             ;B4C1FC;
    dw UNUSED_SpriteObjectSpritemaps_23_0_B4C699                         ;B4C1FE;
    dw $0005                                                             ;B4C200;
    dw UNUSED_SpriteObjectSpritemaps_23_1_B4C6A0                         ;B4C202;
    dw $0005                                                             ;B4C204;
    dw UNUSED_SpriteObjectSpritemaps_23_0_B4C699                         ;B4C206;
    dw $0005                                                             ;B4C208;
    dw UNUSED_SpriteObjectSpritemaps_23_2_B4C6A7                         ;B4C20A;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C20C;
    dw UNUSED_InstList_SpriteObject_23_B4C1FC                            ;B4C20E;

UNUSED_InstList_SpriteObject_24_B4C210:
    dw $0005                                                             ;B4C210;
    dw UNUSED_SpriteObjectSpritemaps_24_0_B4C6AE                         ;B4C212;
    dw $0005                                                             ;B4C214;
    dw UNUSED_SpriteObjectSpritemaps_24_1_B4C6B5                         ;B4C216;
    dw $0005                                                             ;B4C218;
    dw UNUSED_SpriteObjectSpritemaps_24_0_B4C6AE                         ;B4C21A;
    dw $0005                                                             ;B4C21C;
    dw UNUSED_SpriteObjectSpritemaps_24_2_B4C6BC                         ;B4C21E;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C220;
    dw UNUSED_InstList_SpriteObject_24_B4C210                            ;B4C222;

UNUSED_InstList_SpriteObject_25_B4C224:
    dw $0005                                                             ;B4C224;
    dw UNUSED_SpriteObjectSpritemaps_25_0_B4C6C3                         ;B4C226;
    dw $0005                                                             ;B4C228;
    dw UNUSED_SpriteObjectSpritemaps_25_1_B4C6CA                         ;B4C22A;
    dw $0005                                                             ;B4C22C;
    dw UNUSED_SpriteObjectSpritemaps_25_0_B4C6C3                         ;B4C22E;
    dw $0005                                                             ;B4C230;
    dw UNUSED_SpriteObjectSpritemaps_25_2_B4C6D1                         ;B4C232;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C234;
    dw UNUSED_InstList_SpriteObject_25_B4C224                            ;B4C236;

UNUSED_InstList_SpriteObject_26_B4C238:
    dw $000A                                                             ;B4C238;
    dw UNUSED_SpriteObjectSpritemaps_26_0_B4D08B                         ;B4C23A;
    dw $000A                                                             ;B4C23C;
    dw UNUSED_SpriteObjectSpritemaps_26_0_B4D08B                         ;B4C23E;
    dw $000A                                                             ;B4C240;
    dw UNUSED_SpriteObjectSpritemaps_26_1_B4D0BA                         ;B4C242;
    dw $000A                                                             ;B4C244;
    dw UNUSED_SpriteObjectSpritemaps_26_2_B4D0E9                         ;B4C246;
    dw $000A                                                             ;B4C248;
    dw UNUSED_SpriteObjectSpritemaps_26_3_B4D118                         ;B4C24A;
    dw $000A                                                             ;B4C24C;
    dw UNUSED_SpriteObjectSpritemaps_26_4_B4D147                         ;B4C24E;
    dw $000A                                                             ;B4C250;
    dw UNUSED_SpriteObjectSpritemaps_26_5_B4D176                         ;B4C252;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C254;
    dw UNUSED_InstList_SpriteObject_26_B4C238                            ;B4C256;

UNUSED_InstList_SpriteObject_27_B4C258:
    dw $000A                                                             ;B4C258;
    dw UNUSED_SpriteObjectSpritemaps_27_0_B4D1D4                         ;B4C25A;
    dw $000A                                                             ;B4C25C;
    dw UNUSED_SpriteObjectSpritemaps_27_1_B4D1EF                         ;B4C25E;
    dw $000A                                                             ;B4C260;
    dw UNUSED_SpriteObjectSpritemaps_27_2_B4D20A                         ;B4C262;
    dw $000A                                                             ;B4C264;
    dw UNUSED_SpriteObjectSpritemaps_27_3_B4D225                         ;B4C266;
    dw $000A                                                             ;B4C268;
    dw UNUSED_SpriteObjectSpritemaps_27_0_B4D1D4                         ;B4C26A;
    dw $000A                                                             ;B4C26C;
    dw UNUSED_SpriteObjectSpritemaps_27_1_B4D1EF                         ;B4C26E;
    dw $000A                                                             ;B4C270;
    dw UNUSED_SpriteObjectSpritemaps_27_2_B4D20A                         ;B4C272;
    dw $000A                                                             ;B4C274;
    dw UNUSED_SpriteObjectSpritemaps_27_3_B4D225                         ;B4C276;
    dw $000A                                                             ;B4C278;
    dw UNUSED_SpriteObjectSpritemaps_27_0_B4D1D4                         ;B4C27A;
    dw $000A                                                             ;B4C27C;
    dw UNUSED_SpriteObjectSpritemaps_27_1_B4D1EF                         ;B4C27E;
    dw $000A                                                             ;B4C280;
    dw UNUSED_SpriteObjectSpritemaps_27_2_B4D20A                         ;B4C282;
    dw $000A                                                             ;B4C284;
    dw UNUSED_SpriteObjectSpritemaps_27_3_B4D225                         ;B4C286;
    dw $000A                                                             ;B4C288;
    dw UNUSED_SpriteObjectSpritemaps_27_0_B4D1D4                         ;B4C28A;
    dw $000A                                                             ;B4C28C;
    dw UNUSED_SpriteObjectSpritemaps_27_1_B4D1EF                         ;B4C28E;
    dw $000A                                                             ;B4C290;
    dw UNUSED_SpriteObjectSpritemaps_27_2_B4D20A                         ;B4C292;
    dw $000A                                                             ;B4C294;
    dw UNUSED_SpriteObjectSpritemaps_27_3_B4D225                         ;B4C296;
    dw $0030                                                             ;B4C298;
    dw UNUSED_SpriteObjectSpritemaps_27_4_B4D245                         ;B4C29A;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C29C;
    dw UNUSED_InstList_SpriteObject_27_B4C258                            ;B4C29E;

UNUSED_InstList_SpriteObject_28_B4C2A0:
    dw $000A                                                             ;B4C2A0;
    dw UNUSED_SpriteObjectSpritemaps_28_0_B4D2B3                         ;B4C2A2;
    dw $000A                                                             ;B4C2A4;
    dw UNUSED_SpriteObjectSpritemaps_28_1_B4D2E2                         ;B4C2A6;
    dw $000A                                                             ;B4C2A8;
    dw UNUSED_SpriteObjectSpritemaps_28_2_B4D311                         ;B4C2AA;
    dw $000A                                                             ;B4C2AC;
    dw UNUSED_SpriteObjectSpritemaps_28_3_B4D340                         ;B4C2AE;
    dw $000A                                                             ;B4C2B0;
    dw UNUSED_SpriteObjectSpritemaps_28_4_B4D36F                         ;B4C2B2;
    dw $000A                                                             ;B4C2B4;
    dw UNUSED_SpriteObjectSpritemaps_28_5_B4D39E                         ;B4C2B6;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C2B8;
    dw UNUSED_InstList_SpriteObject_28_B4C2A0                            ;B4C2BA;

UNUSED_InstList_SpriteObject_29_B4C2BC:
    dw $000A                                                             ;B4C2BC;
    dw UNUSED_SpriteObjectSpritemaps_29_0_B4D3FC                         ;B4C2BE;
    dw $000A                                                             ;B4C2C0;
    dw UNUSED_SpriteObjectSpritemaps_29_1_B4D417                         ;B4C2C2;
    dw $000A                                                             ;B4C2C4;
    dw UNUSED_SpriteObjectSpritemaps_29_2_B4D432                         ;B4C2C6;
    dw $000A                                                             ;B4C2C8;
    dw UNUSED_SpriteObjectSpritemaps_29_3_B4D44D                         ;B4C2CA;
    dw $000A                                                             ;B4C2CC;
    dw UNUSED_SpriteObjectSpritemaps_29_0_B4D3FC                         ;B4C2CE;
    dw $000A                                                             ;B4C2D0;
    dw UNUSED_SpriteObjectSpritemaps_29_1_B4D417                         ;B4C2D2;
    dw $000A                                                             ;B4C2D4;
    dw UNUSED_SpriteObjectSpritemaps_29_2_B4D432                         ;B4C2D6;
    dw $000A                                                             ;B4C2D8;
    dw UNUSED_SpriteObjectSpritemaps_29_3_B4D44D                         ;B4C2DA;
    dw $000A                                                             ;B4C2DC;
    dw UNUSED_SpriteObjectSpritemaps_29_0_B4D3FC                         ;B4C2DE;
    dw $000A                                                             ;B4C2E0;
    dw UNUSED_SpriteObjectSpritemaps_29_1_B4D417                         ;B4C2E2;
    dw $000A                                                             ;B4C2E4;
    dw UNUSED_SpriteObjectSpritemaps_29_2_B4D432                         ;B4C2E6;
    dw $000A                                                             ;B4C2E8;
    dw UNUSED_SpriteObjectSpritemaps_29_3_B4D44D                         ;B4C2EA;
    dw $000A                                                             ;B4C2EC;
    dw UNUSED_SpriteObjectSpritemaps_29_0_B4D3FC                         ;B4C2EE;
    dw $000A                                                             ;B4C2F0;
    dw UNUSED_SpriteObjectSpritemaps_29_1_B4D417                         ;B4C2F2;
    dw $000A                                                             ;B4C2F4;
    dw UNUSED_SpriteObjectSpritemaps_29_2_B4D432                         ;B4C2F6;
    dw $000A                                                             ;B4C2F8;
    dw UNUSED_SpriteObjectSpritemaps_29_3_B4D44D                         ;B4C2FA;
    dw $0030                                                             ;B4C2FC;
    dw UNUSED_SpriteObjectSpritemaps_29_4_B4D46D                         ;B4C2FE;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C300;
    dw UNUSED_InstList_SpriteObject_29_B4C2BC                            ;B4C302;

UNUSED_InstList_SpriteObject_2A_B4C304:
    dw $0001                                                             ;B4C304;
    dw UNUSED_SpriteObjectSpritemaps_2A_B4D2AC                           ;B4C306;
    dw Instruction_SpriteObject_GoBack4Bytes                             ;B4C308;

InstList_SpriteObject_2B_PuromiBody:
    dw $0003                                                             ;B4C30A;
    dw SpriteObjectSpritemaps_2B_Puromi_0                                ;B4C30C;
    dw $0003                                                             ;B4C30E;
    dw SpriteObjectSpritemaps_2B_Puromi_1                                ;B4C310;
    dw $0003                                                             ;B4C312;
    dw SpriteObjectSpritemaps_2B_Puromi_4                                ;B4C314;
    dw $0003                                                             ;B4C316;
    dw SpriteObjectSpritemaps_2B_Puromi_2                                ;B4C318;
    dw $0003                                                             ;B4C31A;
    dw SpriteObjectSpritemaps_2B_Puromi_3                                ;B4C31C;
    dw $0003                                                             ;B4C31E;
    dw SpriteObjectSpritemaps_2B_Puromi_5                                ;B4C320;
    dw $0003                                                             ;B4C322;
    dw SpriteObjectSpritemaps_2B_Puromi_0                                ;B4C324;
    dw $0003                                                             ;B4C326;
    dw SpriteObjectSpritemaps_2B_Puromi_1                                ;B4C328;
    dw $0003                                                             ;B4C32A;
    dw SpriteObjectSpritemaps_2B_Puromi_6                                ;B4C32C;
    dw $0003                                                             ;B4C32E;
    dw SpriteObjectSpritemaps_2B_Puromi_2                                ;B4C330;
    dw $0003                                                             ;B4C332;
    dw SpriteObjectSpritemaps_2B_Puromi_3                                ;B4C334;
    dw $0003                                                             ;B4C336;
    dw SpriteObjectSpritemaps_2B_Puromi_7                                ;B4C338;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C33A;
    dw InstList_SpriteObject_2B_PuromiBody                               ;B4C33C;

InstList_SpriteObject_2C_PuromiRightExplosion:
    dw $0002                                                             ;B4C33E;
    dw SpriteObjectSpritemaps_2C_PuromiRightExplosion_0                  ;B4C340;
    dw $0002                                                             ;B4C342;
    dw SpriteObjectSpritemaps_2C_PuromiRightExplosion_1                  ;B4C344;
    dw $0002                                                             ;B4C346;
    dw SpriteObjectSpritemaps_2C_PuromiRightExplosion_2                  ;B4C348;
    dw $0002                                                             ;B4C34A;
    dw SpriteObjectSpritemaps_2C_PuromiRightExplosion_3                  ;B4C34C;
    dw $0002                                                             ;B4C34E;
    dw SpriteObjectSpritemaps_2C_PuromiRightExplosion_4                  ;B4C350;
    dw $0002                                                             ;B4C352;
    dw SpriteObjectSpritemaps_2C_PuromiRightExplosion_5                  ;B4C354;
    dw $0002                                                             ;B4C356;
    dw SpriteObjectSpritemaps_2C_PuromiRightExplosion_6                  ;B4C358;
    dw Instruction_SpriteObject_Delete                                   ;B4C35A;

InstList_SpriteObject_2D_PuromiLeftExplosion:
    dw $0002                                                             ;B4C35C;
    dw SpriteObjectSpritemaps_2D_PuromiLeftExplosion_0                   ;B4C35E;
    dw $0002                                                             ;B4C360;
    dw SpriteObjectSpritemaps_2D_PuromiLeftExplosion_1                   ;B4C362;
    dw $0002                                                             ;B4C364;
    dw SpriteObjectSpritemaps_2D_PuromiLeftExplosion_2                   ;B4C366;
    dw $0002                                                             ;B4C368;
    dw SpriteObjectSpritemaps_2D_PuromiLeftExplosion_3                   ;B4C36A;
    dw $0002                                                             ;B4C36C;
    dw SpriteObjectSpritemaps_2D_PuromiLeftExplosion_4                   ;B4C36E;
    dw $0002                                                             ;B4C370;
    dw SpriteObjectSpritemaps_2D_PuromiLeftExplosion_5                   ;B4C372;
    dw $0002                                                             ;B4C374;
    dw SpriteObjectSpritemaps_2D_PuromiLeftExplosion_6                   ;B4C376;
    dw Instruction_SpriteObject_Delete                                   ;B4C378;

InstList_SpriteObject_2E_PuromiSplash:
    dw $0002                                                             ;B4C37A;
    dw SpriteObjectSpritemaps_2E_PuromiSplash_0                          ;B4C37C;
    dw $0002                                                             ;B4C37E;
    dw SpriteObjectSpritemaps_2E_PuromiSplash_0                          ;B4C380;
    dw $0002                                                             ;B4C382;
    dw SpriteObjectSpritemaps_2E_PuromiSplash_1                          ;B4C384;
    dw $0002                                                             ;B4C386;
    dw SpriteObjectSpritemaps_2E_PuromiSplash_2                          ;B4C388;
    dw $0002                                                             ;B4C38A;
    dw SpriteObjectSpritemaps_2E_PuromiSplash_4                          ;B4C38C;
    dw Instruction_SpriteObject_Delete                                   ;B4C38E;

InstList_SpriteObject_30_FallingSparkTrail:
    dw $0003                                                             ;B4C390;
    dw SpriteObjectSpritemaps_30_FallingSparkTrail_0                     ;B4C392;
    dw $0003                                                             ;B4C394;
    dw SpriteObjectSpritemaps_30_FallingSparkTrail_1                     ;B4C396;
    dw $0003                                                             ;B4C398;
    dw SpriteObjectSpritemaps_30_FallingSparkTrail_2                     ;B4C39A;
    dw $0003                                                             ;B4C39C;
    dw SpriteObjectSpritemaps_30_FallingSparkTrail_3                     ;B4C39E;
    dw Instruction_SpriteObject_Delete                                   ;B4C3A0;

UNSUED_InstList_SpriteObject_31_MetroidInsides_B4C3A2:
    dw $0010                                                             ;B4C3A2;
    dw UNUSED_SpriteObjectSpritemaps_31_MetroidInsides_0_B4D653          ;B4C3A4;
    dw $0010                                                             ;B4C3A6;
    dw UNUSED_SpriteObjectSpritemaps_31_MetroidInsides_1_B4D67D          ;B4C3A8;
    dw $0006                                                             ;B4C3AA;
    dw UNUSED_SpriteObjectSpritemaps_31_MetroidInsides_2_B4D69D          ;B4C3AC;
    dw $000A                                                             ;B4C3AE;
    dw UNUSED_SpriteObjectSpritemaps_31_MetroidInsides_3_B4D6C7          ;B4C3B0;
    dw $0010                                                             ;B4C3B2;
    dw UNUSED_SpriteObjectSpritemaps_31_MetroidInsides_1_B4D67D          ;B4C3B4;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C3B6;
    dw UNSUED_InstList_SpriteObject_31_MetroidInsides_B4C3A2             ;B4C3B8;

InstList_SpriteObject_32_MetroidElectricity:
    dw $0002                                                             ;B4C3BA;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_0                 ;B4C3BC;
    dw $0003                                                             ;B4C3BE;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_1                 ;B4C3C0;
    dw $0002                                                             ;B4C3C2;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_2                 ;B4C3C4;
    dw $0001                                                             ;B4C3C6;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_0                 ;B4C3C8;
    dw $0003                                                             ;B4C3CA;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_2                 ;B4C3CC;
    dw $0004                                                             ;B4C3CE;
    dw SpriteObject_DrawInst_Empty                                       ;B4C3D0;
    dw $0004                                                             ;B4C3D2;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_3                 ;B4C3D4;
    dw $0005                                                             ;B4C3D6;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_4                 ;B4C3D8;
    dw $0002                                                             ;B4C3DA;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_5                 ;B4C3DC;
    dw $0001                                                             ;B4C3DE;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_4                 ;B4C3E0;
    dw $0004                                                             ;B4C3E2;
    dw SpriteObject_DrawInst_Empty                                       ;B4C3E4;
    dw $0002                                                             ;B4C3E6;
    dw SpriteObjectSpritemaps_32_MetroidElectricity_C                    ;B4C3E8;
    dw $0003                                                             ;B4C3EA;
    dw SpriteObjectSpritemaps_32_MetroidElectricity_D                    ;B4C3EC;
    dw $0004                                                             ;B4C3EE;
    dw SpriteObjectSpritemaps_32_MetroidElectricity_E                    ;B4C3F0;
    dw $0007                                                             ;B4C3F2;
    dw SpriteObject_DrawInst_Empty                                       ;B4C3F4;
    dw $0003                                                             ;B4C3F6;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_9                 ;B4C3F8;
    dw $0002                                                             ;B4C3FA;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_A                 ;B4C3FC;
    dw $0001                                                             ;B4C3FE;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_B                 ;B4C400;
    dw $0002                                                             ;B4C402;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_A                 ;B4C404;
    dw $0003                                                             ;B4C406;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_B                 ;B4C408;
    dw $0004                                                             ;B4C40A;
    dw SpriteObject_DrawInst_Empty                                       ;B4C40C;
    dw $0004                                                             ;B4C40E;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_F                 ;B4C410;
    dw $0002                                                             ;B4C412;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_10                ;B4C414;
    dw $0002                                                             ;B4C416;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_11                ;B4C418;
    dw $0003                                                             ;B4C41A;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_F                 ;B4C41C;
    dw $0001                                                             ;B4C41E;
    dw SpriteObject_DrawInst_Empty                                       ;B4C420;
    dw $0004                                                             ;B4C422;
    dw SpriteObjectSpritemaps_32_MetroidElectricity_12                   ;B4C424;
    dw $0003                                                             ;B4C426;
    dw SpriteObjectSpritemaps_32_MetroidElectricity_13                   ;B4C428;
    dw $0003                                                             ;B4C42A;
    dw SpriteObjectSpritemaps_32_MetroidElectricity_14                   ;B4C42C;
    dw $0002                                                             ;B4C42E;
    dw SpriteObjectSpritemaps_32_MetroidElectricity_13                   ;B4C430;
    dw $0007                                                             ;B4C432;
    dw SpriteObject_DrawInst_Empty                                       ;B4C434;

UNUSED_InstList_SpriteObject_33_B4C436:
    dw $0002                                                             ;B4C436;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_6                 ;B4C438;
    dw $0003                                                             ;B4C43A;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_7                 ;B4C43C;
    dw $0004                                                             ;B4C43E;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_8                 ;B4C440;
    dw $0002                                                             ;B4C442;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_6                 ;B4C444;
    dw $0001                                                             ;B4C446;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_8                 ;B4C448;
    dw $0003                                                             ;B4C44A;
    dw SpriteObject_DrawInst_Empty                                       ;B4C44C;
    dw $0002                                                             ;B4C44E;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_15                ;B4C450;
    dw $0003                                                             ;B4C452;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_16                ;B4C454;
    dw $0004                                                             ;B4C456;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_17                ;B4C458;
    dw $0001                                                             ;B4C45A;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_15                ;B4C45C;
    dw $0003                                                             ;B4C45E;
    dw SpriteObject_DrawInst_Empty                                       ;B4C460;
    dw $0003                                                             ;B4C462;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_6                 ;B4C464;
    dw $0004                                                             ;B4C466;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_8                 ;B4C468;
    dw $0020                                                             ;B4C46A;
    dw SpriteObject_DrawInst_Empty                                       ;B4C46C;
    dw $0002                                                             ;B4C46E;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_0                 ;B4C470;
    dw $0001                                                             ;B4C472;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_1                 ;B4C474;
    dw $0002                                                             ;B4C476;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_2                 ;B4C478;
    dw $0001                                                             ;B4C47A;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_0                 ;B4C47C;
    dw $0004                                                             ;B4C47E;
    dw SpriteObject_DrawInst_Empty                                       ;B4C480;
    dw $0003                                                             ;B4C482;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_F                 ;B4C484;
    dw $0004                                                             ;B4C486;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_10                ;B4C488;
    dw $0005                                                             ;B4C48A;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_11                ;B4C48C;
    dw $0004                                                             ;B4C48E;
    dw SpriteObject_DrawInst_Empty                                       ;B4C490;
    dw $0002                                                             ;B4C492;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_9                 ;B4C494;
    dw $0001                                                             ;B4C496;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_A                 ;B4C498;
    dw $0003                                                             ;B4C49A;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_B                 ;B4C49C;
    dw $0001                                                             ;B4C49E;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_9                 ;B4C4A0;
    dw $0006                                                             ;B4C4A2;
    dw SpriteObject_DrawInst_Empty                                       ;B4C4A4;
    dw $0003                                                             ;B4C4A6;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_3                 ;B4C4A8;
    dw $0004                                                             ;B4C4AA;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_4                 ;B4C4AC;
    dw $0002                                                             ;B4C4AE;
    dw SpriteObjectSpritemaps_32_33_MetroidElectricity_5                 ;B4C4B0;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C4B2;
    dw UNUSED_InstList_SpriteObject_33_B4C436                            ;B4C4B4;

InstList_SpriteObject_34_MetroidShell:
    dw $0001                                                             ;B4C4B6;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_0                    ;B4C4B8;
    dw $0001                                                             ;B4C4BA;
    dw SpriteObject_DrawInst_Empty                                       ;B4C4BC;
    dw $0001                                                             ;B4C4BE;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_0                    ;B4C4C0;
    dw $0001                                                             ;B4C4C2;
    dw SpriteObject_DrawInst_Empty                                       ;B4C4C4;
    dw $0001                                                             ;B4C4C6;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_0                    ;B4C4C8;
    dw $0001                                                             ;B4C4CA;
    dw SpriteObject_DrawInst_Empty                                       ;B4C4CC;
    dw $0001                                                             ;B4C4CE;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_0                    ;B4C4D0;
    dw $0001                                                             ;B4C4D2;
    dw SpriteObject_DrawInst_Empty                                       ;B4C4D4;
    dw $0001                                                             ;B4C4D6;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_0                    ;B4C4D8;
    dw $0001                                                             ;B4C4DA;
    dw SpriteObject_DrawInst_Empty                                       ;B4C4DC;
    dw $0001                                                             ;B4C4DE;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_0                    ;B4C4E0;
    dw $0001                                                             ;B4C4E2;
    dw SpriteObject_DrawInst_Empty                                       ;B4C4E4;
    dw $0001                                                             ;B4C4E6;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_0                    ;B4C4E8;
    dw $0001                                                             ;B4C4EA;
    dw SpriteObject_DrawInst_Empty                                       ;B4C4EC;
    dw $0001                                                             ;B4C4EE;
    dw SpriteObjectSpritemaps_34_36_MetroidShell_1                       ;B4C4F0;
    dw $0001                                                             ;B4C4F2;
    dw SpriteObject_DrawInst_Empty                                       ;B4C4F4;
    dw $0001                                                             ;B4C4F6;
    dw SpriteObjectSpritemaps_34_36_MetroidShell_1                       ;B4C4F8;
    dw $0001                                                             ;B4C4FA;
    dw SpriteObject_DrawInst_Empty                                       ;B4C4FC;
    dw $0001                                                             ;B4C4FE;
    dw SpriteObjectSpritemaps_34_36_MetroidShell_1                       ;B4C500;
    dw $0001                                                             ;B4C502;
    dw SpriteObject_DrawInst_Empty                                       ;B4C504;
    dw $0001                                                             ;B4C506;
    dw SpriteObjectSpritemaps_34_36_MetroidShell_1                       ;B4C508;
    dw $0001                                                             ;B4C50A;
    dw SpriteObject_DrawInst_Empty                                       ;B4C50C;
    dw $0001                                                             ;B4C50E;
    dw SpriteObjectSpritemaps_34_36_MetroidShell_1                       ;B4C510;
    dw $0001                                                             ;B4C512;
    dw SpriteObject_DrawInst_Empty                                       ;B4C514;
    dw $0001                                                             ;B4C516;
    dw SpriteObjectSpritemaps_34_36_MetroidShell_1                       ;B4C518;
    dw $0001                                                             ;B4C51A;
    dw SpriteObject_DrawInst_Empty                                       ;B4C51C;
    dw $0001                                                             ;B4C51E;
    dw SpriteObjectSpritemaps_34_36_MetroidShell_1                       ;B4C520;
    dw $0001                                                             ;B4C522;
    dw SpriteObject_DrawInst_Empty                                       ;B4C524;
    dw $0001                                                             ;B4C526;
    dw SpriteObjectSpritemaps_34_36_MetroidShell_1                       ;B4C528;
    dw $0001                                                             ;B4C52A;
    dw SpriteObject_DrawInst_Empty                                       ;B4C52C;
    dw $0001                                                             ;B4C52E;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_0                    ;B4C530;
    dw $0001                                                             ;B4C532;
    dw SpriteObject_DrawInst_Empty                                       ;B4C534;

UNUSED_InstList_SpriteObject_35_B4C536:
    dw $0001                                                             ;B4C536;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_0                    ;B4C538;
    dw $0001                                                             ;B4C53A;
    dw SpriteObject_DrawInst_Empty                                       ;B4C53C;
    dw $0001                                                             ;B4C53E;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_0                    ;B4C540;
    dw $0001                                                             ;B4C542;
    dw SpriteObject_DrawInst_Empty                                       ;B4C544;
    dw $0001                                                             ;B4C546;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_0                    ;B4C548;
    dw $0001                                                             ;B4C54A;
    dw SpriteObject_DrawInst_Empty                                       ;B4C54C;
    dw $0001                                                             ;B4C54E;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_0                    ;B4C550;
    dw $0001                                                             ;B4C552;
    dw SpriteObject_DrawInst_Empty                                       ;B4C554;
    dw $0001                                                             ;B4C556;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_0                    ;B4C558;
    dw $0001                                                             ;B4C55A;
    dw SpriteObject_DrawInst_Empty                                       ;B4C55C;
    dw $0001                                                             ;B4C55E;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_0                    ;B4C560;
    dw $0001                                                             ;B4C562;
    dw SpriteObject_DrawInst_Empty                                       ;B4C564;
    dw $0001                                                             ;B4C566;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_2                    ;B4C568;
    dw $0001                                                             ;B4C56A;
    dw SpriteObject_DrawInst_Empty                                       ;B4C56C;
    dw $0001                                                             ;B4C56E;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_2                    ;B4C570;
    dw $0001                                                             ;B4C572;
    dw SpriteObject_DrawInst_Empty                                       ;B4C574;
    dw $0001                                                             ;B4C576;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_2                    ;B4C578;
    dw $0001                                                             ;B4C57A;
    dw SpriteObject_DrawInst_Empty                                       ;B4C57C;
    dw $0001                                                             ;B4C57E;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_2                    ;B4C580;
    dw $0001                                                             ;B4C582;
    dw SpriteObject_DrawInst_Empty                                       ;B4C584;
    dw $0001                                                             ;B4C586;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_2                    ;B4C588;
    dw $0001                                                             ;B4C58A;
    dw SpriteObject_DrawInst_Empty                                       ;B4C58C;
    dw $0001                                                             ;B4C58E;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_2                    ;B4C590;
    dw $0001                                                             ;B4C592;
    dw SpriteObject_DrawInst_Empty                                       ;B4C594;
    dw $0001                                                             ;B4C596;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_2                    ;B4C598;
    dw $0001                                                             ;B4C59A;
    dw SpriteObject_DrawInst_Empty                                       ;B4C59C;
    dw $0001                                                             ;B4C59E;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_2                    ;B4C5A0;
    dw $0001                                                             ;B4C5A2;
    dw SpriteObject_DrawInst_Empty                                       ;B4C5A4;
    dw $0001                                                             ;B4C5A6;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_2                    ;B4C5A8;
    dw $0001                                                             ;B4C5AA;
    dw SpriteObject_DrawInst_Empty                                       ;B4C5AC;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C5AE;
    dw UNUSED_InstList_SpriteObject_35_B4C536                            ;B4C5B0;

UNUSED_InstList_SpriteObject_36_B4C5B2:
    dw $0010                                                             ;B4C5B2;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_0                    ;B4C5B4;
    dw $0010                                                             ;B4C5B6;
    dw SpriteObjectSpritemaps_34_36_MetroidShell_1                       ;B4C5B8;
    dw $0010                                                             ;B4C5BA;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_0                    ;B4C5BC;
    dw $0010                                                             ;B4C5BE;
    dw SpriteObjectSpritemaps_34_35_36_MetroidShell_2                    ;B4C5C0;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C5C2;
    dw UNUSED_InstList_SpriteObject_36_B4C5B2                            ;B4C5C4;

InstList_SpriteObject_37_EnemyShot:
    dw $0002                                                             ;B4C5C6;
    dw SpriteObjectSpritemaps_37_EnemyShot_0                             ;B4C5C8;
    dw $0002                                                             ;B4C5CA;
    dw SpriteObjectSpritemaps_37_EnemyShot_1                             ;B4C5CC;
    dw $0002                                                             ;B4C5CE;
    dw SpriteObjectSpritemaps_37_EnemyShot_2                             ;B4C5D0;
    dw $0002                                                             ;B4C5D2;
    dw SpriteObjectSpritemaps_37_EnemyShot_3                             ;B4C5D4;
    dw Instruction_SpriteObject_Delete                                   ;B4C5D6;

InstList_SpriteObject_38_YappingMawBaseFacingDown:
    dw $0001                                                             ;B4C5D8;
    dw SpriteObjectSpritemaps_38_YappingMawBaseFacingDown                ;B4C5DA;
    dw Instruction_SpriteObject_GoBack4Bytes                             ;B4C5DC;

InstList_SpriteObject_39_YappingMawBaseFacingUp:
    dw $0001                                                             ;B4C5DE;
    dw SpriteObjectSpritemaps_39_YappingMawBaseFacingUp                  ;B4C5E0;
    dw Instruction_SpriteObject_GoBack4Bytes                             ;B4C5E2;

UNUSED_InstList_SpriteObject_3A_B4C5E4:
    dw $000A                                                             ;B4C5E4;
    dw UNUSED_SpriteObjectSpritemaps_3A_0_B4D8BD                         ;B4C5E6;
    dw $000A                                                             ;B4C5E8;
    dw UNUSED_SpriteObjectSpritemaps_3A_1_B4D905                         ;B4C5EA;
    dw $000A                                                             ;B4C5EC;
    dw UNUSED_SpriteObjectSpritemaps_3A_2_B4D957                         ;B4C5EE;
    dw $000A                                                             ;B4C5F0;
    dw UNUSED_SpriteObjectSpritemaps_3A_3_B4D9A9                         ;B4C5F2;
    dw $000A                                                             ;B4C5F4;
    dw UNUSED_SpriteObjectSpritemaps_3A_4_B4D9FB                         ;B4C5F6;
    dw $000A                                                             ;B4C5F8;
    dw UNUSED_SpriteObjectSpritemaps_3A_5_B4DA48                         ;B4C5FA;
    dw $000A                                                             ;B4C5FC;
    dw UNUSED_SpriteObjectSpritemaps_3A_6_B4DA90                         ;B4C5FE;
    dw $000A                                                             ;B4C600;
    dw UNUSED_SpriteObjectSpritemaps_3A_7_B4DAD8                         ;B4C602;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C604;
    dw UNUSED_InstList_SpriteObject_3A_B4C5E4                            ;B4C606;

InstList_SpriteObject_3B_EvirFacingLeft:
    dw $000A                                                             ;B4C608;
    dw SpriteObjectSpritemaps_3B_EvirFacingLeft_0                        ;B4C60A;
    dw $000A                                                             ;B4C60C;
    dw SpriteObjectSpritemaps_3B_EvirFacingLeft_1                        ;B4C60E;
    dw $000A                                                             ;B4C610;
    dw SpriteObjectSpritemaps_3B_EvirFacingLeft_2                        ;B4C612;
    dw $000A                                                             ;B4C614;
    dw SpriteObjectSpritemaps_3B_EvirFacingLeft_3                        ;B4C616;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C618;
    dw InstList_SpriteObject_3B_EvirFacingLeft                           ;B4C61A;

InstList_SpriteObject_3C_EvirFacingRight:
    dw $000A                                                             ;B4C61C;
    dw SpriteObjectSpritemaps_3C_EvirFacingRight_0                       ;B4C61E;
    dw $000A                                                             ;B4C620;
    dw SpriteObjectSpritemaps_3C_EvirFacingRight_1                       ;B4C622;
    dw $000A                                                             ;B4C624;
    dw SpriteObjectSpritemaps_3C_EvirFacingRight_2                       ;B4C626;
    dw $000A                                                             ;B4C628;
    dw SpriteObjectSpritemaps_3C_EvirFacingRight_3                       ;B4C62A;
    dw Instruction_SpriteObject_GotoParameter                            ;B4C62C;
    dw InstList_SpriteObject_3C_EvirFacingRight                          ;B4C62E;

UNUSED_SpriteObjectSpritemaps_1E_0_B4C630:
    dw $0001,$01FC                                                       ;B4C630;
    db $FC                                                               ;B4C634;
    dw $0100                                                             ;B4C635;

UNUSED_SpriteObjectSpritemaps_1E_1_B4C637:
    dw $0001,$01FC                                                       ;B4C637;
    db $FC                                                               ;B4C63B;
    dw $0101                                                             ;B4C63C;

UNUSED_SpriteObjectSpritemaps_1E_2_B4C63E:
    dw $0001,$01FC                                                       ;B4C63E;
    db $FC                                                               ;B4C642;
    dw $0102                                                             ;B4C643;

UNUSED_SpriteObjectSpritemaps_1F_0_B4C645:
    dw $0001,$01FC                                                       ;B4C645;
    db $FC                                                               ;B4C649;
    dw $0103                                                             ;B4C64A;

UNUSED_SpriteObjectSpritemaps_1F_1_B4C645:
    dw $0001,$01FC                                                       ;B4C64C;
    db $FC                                                               ;B4C650;
    dw $0104                                                             ;B4C651;

UNUSED_SpriteObjectSpritemaps_1F_2_B4C653:
    dw $0001,$01FC                                                       ;B4C653;
    db $FC                                                               ;B4C657;
    dw $0105                                                             ;B4C658;

UNUSED_SpriteObjectSpritemaps_20_0_B4C65A:
    dw $0001,$01FC                                                       ;B4C65A;
    db $FC                                                               ;B4C65E;
    dw $0106                                                             ;B4C65F;

UNUSED_SpriteObjectSpritemaps_20_1_B4C661:
    dw $0001,$01FC                                                       ;B4C661;
    db $FC                                                               ;B4C665;
    dw $0107                                                             ;B4C666;

UNUSED_SpriteObjectSpritemaps_20_2_B4C668:
    dw $0001,$01FC                                                       ;B4C668;
    db $FC                                                               ;B4C66C;
    dw $0108                                                             ;B4C66D;

UNUSED_SpriteObjectSpritemaps_21_0_B4C66F:
    dw $0001,$01FC                                                       ;B4C66F;
    db $FC                                                               ;B4C673;
    dw $8103                                                             ;B4C674;

UNUSED_SpriteObjectSpritemaps_21_1_B4C676:
    dw $0001,$01FC                                                       ;B4C676;
    db $FC                                                               ;B4C67A;
    dw $8104                                                             ;B4C67B;

UNUSED_SpriteObjectSpritemaps_21_2_B4C67D:
    dw $0001,$01FC                                                       ;B4C67D;
    db $FC                                                               ;B4C681;
    dw $8105                                                             ;B4C682;

UNUSED_SpriteObjectSpritemaps_22_0_B4C684:
    dw $0001,$01FC                                                       ;B4C684;
    db $FC                                                               ;B4C688;
    dw $8100                                                             ;B4C689;

UNUSED_SpriteObjectSpritemaps_22_1_B4C68B:
    dw $0001,$01FC                                                       ;B4C68B;
    db $FC                                                               ;B4C68F;
    dw $8101                                                             ;B4C690;

UNUSED_SpriteObjectSpritemaps_22_2_B4C692:
    dw $0001,$01FC                                                       ;B4C692;
    db $FC                                                               ;B4C696;
    dw $8102                                                             ;B4C697;

UNUSED_SpriteObjectSpritemaps_23_0_B4C699:
    dw $0001,$01FC                                                       ;B4C699;
    db $FC                                                               ;B4C69D;
    dw $C103                                                             ;B4C69E;

UNUSED_SpriteObjectSpritemaps_23_1_B4C6A0:
    dw $0001,$01FC                                                       ;B4C6A0;
    db $FC                                                               ;B4C6A4;
    dw $C104                                                             ;B4C6A5;

UNUSED_SpriteObjectSpritemaps_23_2_B4C6A7:
    dw $0001,$01FC                                                       ;B4C6A7;
    db $FC                                                               ;B4C6AB;
    dw $C105                                                             ;B4C6AC;

UNUSED_SpriteObjectSpritemaps_24_0_B4C6AE:
    dw $0001,$01FC                                                       ;B4C6AE;
    db $FC                                                               ;B4C6B2;
    dw $4106                                                             ;B4C6B3;

UNUSED_SpriteObjectSpritemaps_24_1_B4C6B5:
    dw $0001,$01FC                                                       ;B4C6B5;
    db $FC                                                               ;B4C6B9;
    dw $4107                                                             ;B4C6BA;

UNUSED_SpriteObjectSpritemaps_24_2_B4C6BC:
    dw $0001,$01FC                                                       ;B4C6BC;
    db $FC                                                               ;B4C6C0;
    dw $4108                                                             ;B4C6C1;

UNUSED_SpriteObjectSpritemaps_25_0_B4C6C3:
    dw $0001,$01FC                                                       ;B4C6C3;
    db $FC                                                               ;B4C6C7;
    dw $4103                                                             ;B4C6C8;

UNUSED_SpriteObjectSpritemaps_25_1_B4C6CA:
    dw $0001,$01FC                                                       ;B4C6CA;
    db $FC                                                               ;B4C6CE;
    dw $4104                                                             ;B4C6CF;

UNUSED_SpriteObjectSpritemaps_25_2_B4C6D1:
    dw $0001,$01FC                                                       ;B4C6D1;
    db $FC                                                               ;B4C6D5;
    dw $4105                                                             ;B4C6D6;

UNUSED_SpriteObjectSpritemaps_11_RockParticles_0_B4C6D8:
    dw $0004,$0000                                                       ;B4C6D8;
    db $F8                                                               ;B4C6DC;
    dw $7A2B,$0000                                                       ;B4C6DD;
    db $00                                                               ;B4C6E1;
    dw $7A2B,$01F8                                                       ;B4C6E2;
    db $00                                                               ;B4C6E6;
    dw $3A2B,$01F8                                                       ;B4C6E7;
    db $F8                                                               ;B4C6EB;
    dw $3A2B                                                             ;B4C6EC;

UNUSED_SpriteObjectSpritemaps_11_RockParticles_1_B4C6EE:
    dw $0004,$0002                                                       ;B4C6EE;
    db $F3                                                               ;B4C6F2;
    dw $7A2B,$0001                                                       ;B4C6F3;
    db $FF                                                               ;B4C6F7;
    dw $7A2B,$01F7                                                       ;B4C6F8;
    db $FF                                                               ;B4C6FC;
    dw $3A2B,$01F6                                                       ;B4C6FD;
    db $F3                                                               ;B4C701;
    dw $3A2B                                                             ;B4C702;

UNUSED_SpriteObjectSpritemaps_11_RockParticles_2_B4C704:
    dw $0004,$0005                                                       ;B4C704;
    db $EE                                                               ;B4C708;
    dw $7A2B,$0003                                                       ;B4C709;
    db $FD                                                               ;B4C70D;
    dw $7A2B,$01F5                                                       ;B4C70E;
    db $FD                                                               ;B4C712;
    dw $3A2B,$01F3                                                       ;B4C713;
    db $EE                                                               ;B4C717;
    dw $3A2B                                                             ;B4C718;

UNUSED_SpriteObjectSpritemaps_11_RockParticles_3_B4C71A:
    dw $0004,$0007                                                       ;B4C71A;
    db $EC                                                               ;B4C71E;
    dw $7A2B,$0005                                                       ;B4C71F;
    db $FB                                                               ;B4C723;
    dw $7A2B,$01F3                                                       ;B4C724;
    db $FB                                                               ;B4C728;
    dw $3A2B,$01F1                                                       ;B4C729;
    db $EC                                                               ;B4C72D;
    dw $3A2B                                                             ;B4C72E;

UNUSED_SpriteObjectSpritemaps_11_RockParticles_4_B4C730:
    dw $0004,$0009                                                       ;B4C730;
    db $EA                                                               ;B4C734;
    dw $7A2B,$0007                                                       ;B4C735;
    db $FA                                                               ;B4C739;
    dw $7A2B,$01F1                                                       ;B4C73A;
    db $FA                                                               ;B4C73E;
    dw $3A2B,$01EF                                                       ;B4C73F;
    db $EA                                                               ;B4C743;
    dw $3A2B                                                             ;B4C744;

UNUSED_SpriteObjectSpritemaps_11_RockParticles_5_B4C746:
    dw $0004,$000A                                                       ;B4C746;
    db $EA                                                               ;B4C74A;
    dw $7A2B,$0008                                                       ;B4C74B;
    db $F9                                                               ;B4C74F;
    dw $7A2B,$01F0                                                       ;B4C750;
    db $F9                                                               ;B4C754;
    dw $3A2B,$01EE                                                       ;B4C755;
    db $EA                                                               ;B4C759;
    dw $3A2B                                                             ;B4C75A;

UNUSED_SpriteObjectSpritemaps_11_RockParticles_6_B4C75C:
    dw $0004,$000C                                                       ;B4C75C;
    db $EB                                                               ;B4C760;
    dw $7A2A,$0009                                                       ;B4C761;
    db $FA                                                               ;B4C765;
    dw $7A2A,$01EF                                                       ;B4C766;
    db $FA                                                               ;B4C76A;
    dw $3A2A,$01EC                                                       ;B4C76B;
    db $EB                                                               ;B4C76F;
    dw $3A2A                                                             ;B4C770;

UNUSED_SpriteObjectSpritemaps_11_RockParticles_7_B4C772:
    dw $0004,$000E                                                       ;B4C772;
    db $EC                                                               ;B4C776;
    dw $7A2A,$000A                                                       ;B4C777;
    db $FC                                                               ;B4C77B;
    dw $7A2A,$01EE                                                       ;B4C77C;
    db $FC                                                               ;B4C780;
    dw $3A2A,$01EA                                                       ;B4C781;
    db $EC                                                               ;B4C785;
    dw $3A2A                                                             ;B4C786;

UNUSED_SpriteObjectSpritemaps_11_RockParticles_8_B4C788:
    dw $0004,$0010                                                       ;B4C788;
    db $ED                                                               ;B4C78C;
    dw $7A29,$000B                                                       ;B4C78D;
    db $FE                                                               ;B4C791;
    dw $7A29,$01ED                                                       ;B4C792;
    db $FE                                                               ;B4C796;
    dw $3A29,$01E8                                                       ;B4C797;
    db $ED                                                               ;B4C79B;
    dw $3A29                                                             ;B4C79C;

UNUSED_SpriteObjectSpritemaps_11_RockParticles_9_B4C79E:
    dw $0004,$0012                                                       ;B4C79E;
    db $EE                                                               ;B4C7A2;
    dw $7A29,$000C                                                       ;B4C7A3;
    db $00                                                               ;B4C7A7;
    dw $7A29,$01EC                                                       ;B4C7A8;
    db $00                                                               ;B4C7AC;
    dw $3A29,$01E6                                                       ;B4C7AD;
    db $EE                                                               ;B4C7B1;
    dw $3A29                                                             ;B4C7B2;

UNUSED_SpriteObjectSpritemaps_11_RockParticles_A_B4C7B4:
    dw $0004,$0013                                                       ;B4C7B4;
    db $F0                                                               ;B4C7B8;
    dw $7A28,$000D                                                       ;B4C7B9;
    db $02                                                               ;B4C7BD;
    dw $7A28,$01E5                                                       ;B4C7BE;
    db $F0                                                               ;B4C7C2;
    dw $3A28,$01EB                                                       ;B4C7C3;
    db $02                                                               ;B4C7C7;
    dw $3A28                                                             ;B4C7C8;

UNUSED_SpriteObjectSpritemaps_11_RockParticles_B_B4C7CA:
    dw $0004,$0014                                                       ;B4C7CA;
    db $F2                                                               ;B4C7CE;
    dw $7A28,$000E                                                       ;B4C7CF;
    db $04                                                               ;B4C7D3;
    dw $7A28,$01E4                                                       ;B4C7D4;
    db $F2                                                               ;B4C7D8;
    dw $3A28,$01EA                                                       ;B4C7D9;
    db $04                                                               ;B4C7DD;
    dw $3A28                                                             ;B4C7DE;

UNUSED_SpriteObjectSpritemaps_11_RockParticles_C_B4C7E0:
    dw $0004,$0015                                                       ;B4C7E0;
    db $F5                                                               ;B4C7E4;
    dw $7A28,$000F                                                       ;B4C7E5;
    db $07                                                               ;B4C7E9;
    dw $7A28,$01E3                                                       ;B4C7EA;
    db $F5                                                               ;B4C7EE;
    dw $3A28,$01E9                                                       ;B4C7EF;
    db $07                                                               ;B4C7F3;
    dw $3A28                                                             ;B4C7F4;

UNUSED_SpriteObjectSpritemaps_11_RockParticles_D_B4C7F6:
    dw $0004,$0016                                                       ;B4C7F6;
    db $F9                                                               ;B4C7FA;
    dw $7A28,$0010                                                       ;B4C7FB;
    db $0B                                                               ;B4C7FF;
    dw $7A28,$01E2                                                       ;B4C800;
    db $F9                                                               ;B4C804;
    dw $3A28,$01E8                                                       ;B4C805;
    db $0B                                                               ;B4C809;
    dw $3A28                                                             ;B4C80A;

UNUSED_SpriteObjectSpritemaps_11_RockParticles_E_B4C80C:
    dw $0004,$0017                                                       ;B4C80C;
    db $03                                                               ;B4C810;
    dw $7A28,$0011                                                       ;B4C811;
    db $11                                                               ;B4C815;
    dw $7A28,$01E1                                                       ;B4C816;
    db $03                                                               ;B4C81A;
    dw $3A28,$01E7                                                       ;B4C81B;
    db $11                                                               ;B4C81F;
    dw $3A28                                                             ;B4C820;

UNUSED_SpriteObjectSpritemaps_11_RockParticles_F_B4C822:
    dw $0004,$0018                                                       ;B4C822;
    db $0A                                                               ;B4C826;
    dw $7A28,$0012                                                       ;B4C827;
    db $18                                                               ;B4C82B;
    dw $7A28,$01E0                                                       ;B4C82C;
    db $0A                                                               ;B4C830;
    dw $3A28,$01E6                                                       ;B4C831;
    db $18                                                               ;B4C835;
    dw $3A28                                                             ;B4C836;

SpriteObjectSpritemaps_12_15_BigDustCloud_0:
    dw $0001,$01F7                                                       ;B4C838;
    db $F7                                                               ;B4C83C;
    dw $3A48                                                             ;B4C83D;

SpriteObjectSpritemaps_12_15_BigDustCloud_1:
    dw $0002,$0001                                                       ;B4C83F;
    db $01                                                               ;B4C843;
    dw $3A48,$81F3                                                       ;B4C844;
    db $F3                                                               ;B4C848;
    dw $3A7C                                                             ;B4C849;

SpriteObjectSpritemaps_12_15_BigDustCloud_2:
    dw $0003,$81FD                                                       ;B4C84B;
    db $FD                                                               ;B4C84F;
    dw $3A7C,$01F7                                                       ;B4C850;
    db $01                                                               ;B4C854;
    dw $3A48,$81F3                                                       ;B4C855;
    db $F3                                                               ;B4C859;
    dw $3A7E                                                             ;B4C85A;

SpriteObjectSpritemaps_12_15_BigDustCloud_3:
    dw $0004,$0001                                                       ;B4C85C;
    db $F7                                                               ;B4C860;
    dw $3A48,$81FD                                                       ;B4C861;
    db $FD                                                               ;B4C865;
    dw $3A7E,$81F3                                                       ;B4C866;
    db $FD                                                               ;B4C86A;
    dw $3A7C,$81F3                                                       ;B4C86B;
    db $F3                                                               ;B4C86F;
    dw $3A9A                                                             ;B4C870;

SpriteObjectSpritemaps_13_14_15_BigDustCloud_4:
    dw $0004,$81FD                                                       ;B4C872;
    db $F3                                                               ;B4C876;
    dw $3A7C,$81FD                                                       ;B4C877;
    db $FD                                                               ;B4C87B;
    dw $3A9A,$81F3                                                       ;B4C87C;
    db $FD                                                               ;B4C880;
    dw $3A7E,$81F3                                                       ;B4C881;
    db $F3                                                               ;B4C885;
    dw $3A9C                                                             ;B4C886;

SpriteObjectSpritemaps_13_14_15_BigDustCloud_5:
    dw $0003,$81FD                                                       ;B4C888;
    db $F3                                                               ;B4C88C;
    dw $3A7E,$81FD                                                       ;B4C88D;
    db $FD                                                               ;B4C891;
    dw $3A9C,$81F3                                                       ;B4C892;
    db $FD                                                               ;B4C896;
    dw $3A9A                                                             ;B4C897;

SpriteObjectSpritemaps_13_14_15_BigDustCloud_6:
    dw $0002,$81FD                                                       ;B4C899;
    db $F3                                                               ;B4C89D;
    dw $3A9A,$81F3                                                       ;B4C89E;
    db $FD                                                               ;B4C8A2;
    dw $3A9C                                                             ;B4C8A3;

SpriteObjectSpritemaps_13_14_15_BigDustCloud_7:
    dw $0001,$81FD                                                       ;B4C8A5;
    db $F3                                                               ;B4C8A9;
    dw $3A9C                                                             ;B4C8AA;

UNUSED_SpriteObjectSpritemaps_13_14_16_DustCloud_Beam_B4C8AC:
    dw $0001,$01FC                                                       ;B4C8AC;
    db $FC                                                               ;B4C8B0;
    dw $3A6B                                                             ;B4C8B1;

UNUSED_SpriteObjectSpritemaps_13_14_16_DustCloud_Beam_B4C8B3:
    dw $0001,$01FC                                                       ;B4C8B3;
    db $FC                                                               ;B4C8B7;
    dw $3A6C                                                             ;B4C8B8;

UNUSED_SpriteObjectSpritemaps_14_16_DustCloud_Beam_B4C8BA:
    dw $0002,$01F8                                                       ;B4C8BA;
    db $FC                                                               ;B4C8BE;
    dw $3A6B,$0000                                                       ;B4C8BF;
    db $FC                                                               ;B4C8C3;
    dw $3A6B                                                             ;B4C8C4;

UNUSED_SpriteObjectSpritemaps_16_DustCloud_Beam_B4C8C6:
    dw $0002,$01F8                                                       ;B4C8C6;
    db $FC                                                               ;B4C8CA;
    dw $3A6C,$0000                                                       ;B4C8CB;
    db $FC                                                               ;B4C8CF;
    dw $3A6C                                                             ;B4C8D0;

UNUSED_SpriteObjectSpritemaps_16_DustCloud_Beam_B4C8D2:
    dw $0003,$01F4                                                       ;B4C8D2;
    db $FC                                                               ;B4C8D6;
    dw $3A6C,$0004                                                       ;B4C8D7;
    db $FC                                                               ;B4C8DB;
    dw $3A6C,$01FC                                                       ;B4C8DC;
    db $FC                                                               ;B4C8E0;
    dw $3A6C                                                             ;B4C8E1;

UNUSED_SpriteObjectSpritemaps_16_DustCloud_Beam_B4C8E2:
    dw $0003,$0004                                                       ;B4C8E3;
    db $FC                                                               ;B4C8E7;
    dw $3A6B,$01F4                                                       ;B4C8E8;
    db $FC                                                               ;B4C8EC;
    dw $3A6B,$01FC                                                       ;B4C8ED;
    db $FC                                                               ;B4C8F1;
    dw $3A6B                                                             ;B4C8F2;

UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C8F4:
    dw $0004,$0008                                                       ;B4C8F4;
    db $FC                                                               ;B4C8F8;
    dw $3A6C,$0000                                                       ;B4C8F9;
    db $FC                                                               ;B4C8FD;
    dw $3A6C,$01F8                                                       ;B4C8FE;
    db $FC                                                               ;B4C902;
    dw $3A6C,$01F0                                                       ;B4C903;
    db $FC                                                               ;B4C907;
    dw $3A6C                                                             ;B4C908;

UNUSED_SpriteObjectSpritemaps_16_17_DustCloud_Beam_B4C90A:
    dw $0004,$0008                                                       ;B4C90A;
    db $FC                                                               ;B4C90E;
    dw $3A6B,$0000                                                       ;B4C90F;
    db $FC                                                               ;B4C913;
    dw $3A6B,$01F8                                                       ;B4C914;
    db $FC                                                               ;B4C918;
    dw $3A6B,$01F0                                                       ;B4C919;
    db $FC                                                               ;B4C91D;
    dw $3A6B                                                             ;B4C91E;

SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_0:
    dw $0001,$01FC                                                       ;B4C920;
    db $FC                                                               ;B4C924;
    dw $3A25                                                             ;B4C925;

SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_1:
    dw $0003,$0000                                                       ;B4C927;
    db $F8                                                               ;B4C92B;
    dw $3A25,$01FA                                                       ;B4C92C;
    db $F6                                                               ;B4C930;
    dw $3A25,$01FC                                                       ;B4C931;
    db $FB                                                               ;B4C935;
    dw $3A25                                                             ;B4C936;

SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_2:
    dw $0003,$0001                                                       ;B4C938;
    db $F7                                                               ;B4C93C;
    dw $3A25,$01F9                                                       ;B4C93D;
    db $F4                                                               ;B4C941;
    dw $3A25,$01FB                                                       ;B4C942;
    db $FA                                                               ;B4C946;
    dw $3A25                                                             ;B4C947;

SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_3:
    dw $0003,$0001                                                       ;B4C949;
    db $F5                                                               ;B4C94D;
    dw $3A43,$01FC                                                       ;B4C94E;
    db $F8                                                               ;B4C952;
    dw $3A43,$01FA                                                       ;B4C953;
    db $F1                                                               ;B4C957;
    dw $3A43                                                             ;B4C958;

SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_4:
    dw $0003,$0001                                                       ;B4C95A;
    db $F3                                                               ;B4C95E;
    dw $3A43,$01FC                                                       ;B4C95F;
    db $F5                                                               ;B4C963;
    dw $3A43,$01FA                                                       ;B4C964;
    db $EE                                                               ;B4C968;
    dw $3A43                                                             ;B4C969;

SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_5:
    dw $0003,$0000                                                       ;B4C96B;
    db $F0                                                               ;B4C96F;
    dw $3A40,$01FC                                                       ;B4C970;
    db $F4                                                               ;B4C974;
    dw $3A40,$01FA                                                       ;B4C975;
    db $ED                                                               ;B4C979;
    dw $3A40                                                             ;B4C97A;

SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_6:
    dw $0003,$0000                                                       ;B4C97C;
    db $EE                                                               ;B4C980;
    dw $3A40,$01FC                                                       ;B4C981;
    db $F2                                                               ;B4C985;
    dw $3A40,$01FA                                                       ;B4C986;
    db $EC                                                               ;B4C98A;
    dw $3A40                                                             ;B4C98B;

SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_7:
    dw $0002,$0000                                                       ;B4C98D;
    db $EC                                                               ;B4C991;
    dw $3A40,$01FC                                                       ;B4C992;
    db $F0                                                               ;B4C996;
    dw $3A40                                                             ;B4C997;

SpriteObjectSpritemaps_18_ShortDraygonBreathBubbles_8:
    dw $0001,$01FC                                                       ;B4C999;
    db $EE                                                               ;B4C99D;
    dw $3A40                                                             ;B4C99E;

UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_0_B4C9A0:
    dw $0004,$0008                                                       ;B4C9A0;
    db $E0                                                               ;B4C9A4;
    dw $3A6F,$0000                                                       ;B4C9A5;
    db $E0                                                               ;B4C9A9;
    dw $3A6F,$01F8                                                       ;B4C9AA;
    db $E0                                                               ;B4C9AE;
    dw $3A6F,$01F0                                                       ;B4C9AF;
    db $E0                                                               ;B4C9B3;
    dw $3A6F                                                             ;B4C9B4;

UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_1_B4C9B6:
    dw $0004,$0008                                                       ;B4C9B6;
    db $E8                                                               ;B4C9BA;
    dw $3A6F,$0000                                                       ;B4C9BB;
    db $E8                                                               ;B4C9BF;
    dw $3A6F,$01F8                                                       ;B4C9C0;
    db $E8                                                               ;B4C9C4;
    dw $3A6F,$01F0                                                       ;B4C9C5;
    db $E8                                                               ;B4C9C9;
    dw $3A6F                                                             ;B4C9CA;

UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_2_B4C9CC:
    dw $0004,$0008                                                       ;B4C9CC;
    db $F0                                                               ;B4C9D0;
    dw $3A6F,$0000                                                       ;B4C9D1;
    db $F0                                                               ;B4C9D5;
    dw $3A6F,$01F8                                                       ;B4C9D6;
    db $F0                                                               ;B4C9DA;
    dw $3A6F,$01F0                                                       ;B4C9DB;
    db $F0                                                               ;B4C9DF;
    dw $3A6F                                                             ;B4C9E0;

UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_3_B4C9E2:
    dw $0004,$0008                                                       ;B4C9E2;
    db $F8                                                               ;B4C9E6;
    dw $3A6F,$0000                                                       ;B4C9E7;
    db $F8                                                               ;B4C9EB;
    dw $3A6F,$01F8                                                       ;B4C9EC;
    db $F8                                                               ;B4C9F0;
    dw $3A6F,$01F0                                                       ;B4C9F1;
    db $F8                                                               ;B4C9F5;
    dw $3A6F                                                             ;B4C9F6;

UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_4_B4C9F8:
    dw $0004,$0008                                                       ;B4C9F8;
    db $00                                                               ;B4C9FC;
    dw $3A6F,$0000                                                       ;B4C9FD;
    db $00                                                               ;B4CA01;
    dw $3A6F,$01F8                                                       ;B4CA02;
    db $00                                                               ;B4CA06;
    dw $3A6F,$01F0                                                       ;B4CA07;
    db $00                                                               ;B4CA0B;
    dw $3A6F                                                             ;B4CA0C;

UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_5_B4CA0E:
    dw $0004,$0008                                                       ;B4CA0E;
    db $08                                                               ;B4CA12;
    dw $3A6F,$0000                                                       ;B4CA13;
    db $08                                                               ;B4CA17;
    dw $3A6F,$01F8                                                       ;B4CA18;
    db $08                                                               ;B4CA1C;
    dw $3A6F,$01F0                                                       ;B4CA1D;
    db $08                                                               ;B4CA21;
    dw $3A6F                                                             ;B4CA22;

UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_6_B4CA24:
    dw $0004,$0008                                                       ;B4CA24;
    db $10                                                               ;B4CA28;
    dw $3A6F,$0000                                                       ;B4CA29;
    db $10                                                               ;B4CA2D;
    dw $3A6F,$01F8                                                       ;B4CA2E;
    db $10                                                               ;B4CA32;
    dw $3A6F,$01F0                                                       ;B4CA33;
    db $10                                                               ;B4CA37;
    dw $3A6F                                                             ;B4CA38;

UNUSED_SpriteObjectSpritemaps_19_SaveStationElect_7_B4CA3A:
    dw $0004,$0008                                                       ;B4CA3A;
    db $18                                                               ;B4CA3E;
    dw $3A6F,$0000                                                       ;B4CA3F;
    db $18                                                               ;B4CA43;
    dw $3A6F,$01F8                                                       ;B4CA44;
    db $18                                                               ;B4CA48;
    dw $3A6F,$01F0                                                       ;B4CA49;
    db $18                                                               ;B4CA4D;
    dw $3A6F                                                             ;B4CA4E;

UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_0_B4CA50:
    dw $0002,$0000                                                       ;B4CA50;
    db $FC                                                               ;B4CA54;
    dw $3ABF,$01F8                                                       ;B4CA55;
    db $FC                                                               ;B4CA59;
    dw $3ABE                                                             ;B4CA5A;

UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_1_B4CA5C:
    dw $0001,$81F8                                                       ;B4CA5C;
    db $F8                                                               ;B4CA60;
    dw $3ABE                                                             ;B4CA61;

UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_2_B4CA63:
    dw $0002,$81F8                                                       ;B4CA63;
    db $FC                                                               ;B4CA67;
    dw $3ABE,$81F8                                                       ;B4CA68;
    db $F4                                                               ;B4CA6C;
    dw $3ABE                                                             ;B4CA6D;

UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_3_B4CA6F:
    dw $0002,$81F8                                                       ;B4CA6F;
    db $00                                                               ;B4CA73;
    dw $3ABE,$81F8                                                       ;B4CA74;
    db $F0                                                               ;B4CA78;
    dw $3ABE                                                             ;B4CA79;

UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_4_B4CA7B:
    dw $0003,$81F8                                                       ;B4CA7B;
    db $04                                                               ;B4CA7F;
    dw $3ABE,$81F8                                                       ;B4CA80;
    db $F8                                                               ;B4CA84;
    dw $3ABE,$81F8                                                       ;B4CA85;
    db $EC                                                               ;B4CA89;
    dw $3ABE                                                             ;B4CA8A;

UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_5_B4CA8C:
    dw $0003,$81F8                                                       ;B4CA8C;
    db $08                                                               ;B4CA90;
    dw $3ABE,$81F8                                                       ;B4CA91;
    db $F8                                                               ;B4CA95;
    dw $3ABE,$81F8                                                       ;B4CA96;
    db $E8                                                               ;B4CA9A;
    dw $3ABE                                                             ;B4CA9B;

UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_6_B4CA9D:
    dw $0004,$81F8                                                       ;B4CA9D;
    db $0C                                                               ;B4CAA1;
    dw $3ABE,$81F8                                                       ;B4CAA2;
    db $00                                                               ;B4CAA6;
    dw $3ABE,$81F8                                                       ;B4CAA7;
    db $F0                                                               ;B4CAAB;
    dw $3ABE,$81F8                                                       ;B4CAAC;
    db $E4                                                               ;B4CAB0;
    dw $3ABE                                                             ;B4CAB1;

UNUSED_SpriteObjectSpritemaps_1A_1B_VerticalGate_7_B4CAB3:
    dw $0004,$81F8                                                       ;B4CAB3;
    db $10                                                               ;B4CAB7;
    dw $3ABE,$81F8                                                       ;B4CAB8;
    db $00                                                               ;B4CABC;
    dw $3ABE,$81F8                                                       ;B4CABD;
    db $F0                                                               ;B4CAC1;
    dw $3ABE,$81F8                                                       ;B4CAC2;
    db $E0                                                               ;B4CAC6;
    dw $3ABE                                                             ;B4CAC7;

UNUSED_SpriteObjectSpritemaps_0_BeamCharge_0_B4CAC9:
    dw $0001,$01FC                                                       ;B4CAC9;
    db $FC                                                               ;B4CACD;
    dw $3C53                                                             ;B4CACE;

UNUSED_SpriteObjectSpritemaps_0_BeamCharge_1_B4CAD0:
    dw $0001,$01FC                                                       ;B4CAD0;
    db $FC                                                               ;B4CAD4;
    dw $3C52                                                             ;B4CAD5;

UNUSED_SpriteObjectSpritemaps_0_BeamCharge_2_B4CAD7:
    dw $0001,$01FC                                                       ;B4CAD7;
    db $FC                                                               ;B4CADB;
    dw $3C51                                                             ;B4CADC;

UNUSED_SpriteObjectSpritemaps_0_BeamCharge_3_B4CADE:
    dw $0004,$01F8                                                       ;B4CADE;
    db $00                                                               ;B4CAE2;
    dw $BC50,$0000                                                       ;B4CAE3;
    db $00                                                               ;B4CAE7;
    dw $FC50,$0000                                                       ;B4CAE8;
    db $F8                                                               ;B4CAEC;
    dw $7C50,$01F8                                                       ;B4CAED;
    db $F8                                                               ;B4CAF1;
    dw $3C50                                                             ;B4CAF2;

UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_0_B4CAF4:
    dw $0003,$0000                                                       ;B4CAF4;
    db $0C                                                               ;B4CAF8;
    dw $3A5B,$0008                                                       ;B4CAF9;
    db $EC                                                               ;B4CAFD;
    dw $3A5B,$01F0                                                       ;B4CAFE;
    db $F4                                                               ;B4CB02;
    dw $3A5B                                                             ;B4CB03;

UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_1_B4CB05:
    dw $0003,$01FD                                                       ;B4CB05;
    db $0A                                                               ;B4CB09;
    dw $3A5C,$0006                                                       ;B4CB0A;
    db $EE                                                               ;B4CB0E;
    dw $3A5C,$01F2                                                       ;B4CB0F;
    db $F6                                                               ;B4CB13;
    dw $3A5C                                                             ;B4CB14;

UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_2_B4CB16:
    dw $0003,$01FC                                                       ;B4CB16;
    db $08                                                               ;B4CB1A;
    dw $3A5C,$0004                                                       ;B4CB1B;
    db $F0                                                               ;B4CB1F;
    dw $3A5C,$01F4                                                       ;B4CB20;
    db $F8                                                               ;B4CB24;
    dw $3A5C                                                             ;B4CB25;

UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_3_B4CB27:
    dw $0003,$0002                                                       ;B4CB27;
    db $F2                                                               ;B4CB2B;
    dw $3A5D,$01FB                                                       ;B4CB2C;
    db $06                                                               ;B4CB30;
    dw $3A5D,$01F6                                                       ;B4CB31;
    db $FA                                                               ;B4CB35;
    dw $3A5D                                                             ;B4CB36;

UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_4_B4CB38:
    dw $0003,$01FB                                                       ;B4CB38;
    db $04                                                               ;B4CB3C;
    dw $3A5D,$01F8                                                       ;B4CB3D;
    db $FB                                                               ;B4CB41;
    dw $3A5D,$0000                                                       ;B4CB42;
    db $F4                                                               ;B4CB46;
    dw $3A5D                                                             ;B4CB47;

UNUSED_SpriteObjectSpritemaps_1_MBElbowParticle_5_B4CB49:
    dw $0003,$01FB                                                       ;B4CB49;
    db $02                                                               ;B4CB4D;
    dw $3A5D,$01FA                                                       ;B4CB4E;
    db $FA                                                               ;B4CB52;
    dw $3A5D,$0000                                                       ;B4CB53;
    db $F6                                                               ;B4CB57;
    dw $3A5D                                                             ;B4CB58;

UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_0_B4CB5A:
    dw $0003,$0000                                                       ;B4CB5A;
    db $EC                                                               ;B4CB5E;
    dw $BA5B,$0008                                                       ;B4CB5F;
    db $0C                                                               ;B4CB63;
    dw $BA5B,$01F0                                                       ;B4CB64;
    db $04                                                               ;B4CB68;
    dw $BA5B                                                             ;B4CB69;

UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_1_B4CB6B:
    dw $0003,$01FE                                                       ;B4CB6B;
    db $EE                                                               ;B4CB6F;
    dw $BA5C,$0006                                                       ;B4CB70;
    db $0A                                                               ;B4CB74;
    dw $BA5C,$01F2                                                       ;B4CB75;
    db $02                                                               ;B4CB79;
    dw $BA5C                                                             ;B4CB7A;

UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_2_B4CB7C:
    dw $0003,$0004                                                       ;B4CB7C;
    db $08                                                               ;B4CB80;
    dw $BA5C,$01F4                                                       ;B4CB81;
    db $00                                                               ;B4CB85;
    dw $BA5C,$01FD                                                       ;B4CB86;
    db $F0                                                               ;B4CB8A;
    dw $BA5C                                                             ;B4CB8B;

UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_3_B4CB8D:
    dw $0003,$0002                                                       ;B4CB8D;
    db $06                                                               ;B4CB91;
    dw $BA5D,$01FC                                                       ;B4CB92;
    db $F2                                                               ;B4CB96;
    dw $BA5D,$01F6                                                       ;B4CB97;
    db $FE                                                               ;B4CB9B;
    dw $BA5D                                                             ;B4CB9C;

UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_4_B4CB9E:
    dw $0003,$01FC                                                       ;B4CB9E;
    db $F4                                                               ;B4CBA2;
    dw $BA5D,$01F8                                                       ;B4CBA3;
    db $FC                                                               ;B4CBA7;
    dw $BA5D,$0000                                                       ;B4CBA8;
    db $04                                                               ;B4CBAC;
    dw $BA5D                                                             ;B4CBAD;

UNUSED_SpriteObjectSpritemaps_2_MBElbowEnergy_5_B4CBAF:
    dw $0003,$01FC                                                       ;B4CBAF;
    db $F6                                                               ;B4CBB3;
    dw $BA5D,$01FA                                                       ;B4CBB4;
    db $FD                                                               ;B4CBB8;
    dw $BA5D,$0000                                                       ;B4CBB9;
    db $02                                                               ;B4CBBD;
    dw $BA5D                                                             ;B4CBBE;

SpriteObjectSpritemaps_3_SmallExplosion_0:
    dw $0001,$01FC                                                       ;B4CBC0;
    db $FC                                                               ;B4CBC4;
    dw $3A5F                                                             ;B4CBC5;

SpriteObjectSpritemaps_3_SmallExplosion_1:
    dw $0004,$0000                                                       ;B4CBC7;
    db $00                                                               ;B4CBCB;
    dw $FA8A,$01F8                                                       ;B4CBCC;
    db $00                                                               ;B4CBD0;
    dw $BA8A,$0000                                                       ;B4CBD1;
    db $F8                                                               ;B4CBD5;
    dw $7A8A,$01F8                                                       ;B4CBD6;
    db $F8                                                               ;B4CBDA;
    dw $3A8A                                                             ;B4CBDB;

SpriteObjectSpritemaps_3_SmallExplosion_2:
    dw $0004,$8000                                                       ;B4CBDD;
    db $00                                                               ;B4CBE1;
    dw $FA90,$81F0                                                       ;B4CBE2;
    db $00                                                               ;B4CBE6;
    dw $BA90,$8000                                                       ;B4CBE7;
    db $F0                                                               ;B4CBEB;
    dw $7A90,$81F0                                                       ;B4CBEC;
    db $F0                                                               ;B4CBF0;
    dw $3A90                                                             ;B4CBF1;

SpriteObjectSpritemaps_3_SmallExplosion_3:
    dw $0004,$8000                                                       ;B4CBF3;
    db $00                                                               ;B4CBF7;
    dw $FA92,$81F0                                                       ;B4CBF8;
    db $00                                                               ;B4CBFC;
    dw $BA92,$8000                                                       ;B4CBFD;
    db $F0                                                               ;B4CC01;
    dw $7A92,$81F0                                                       ;B4CC02;
    db $F0                                                               ;B4CC06;
    dw $3A92                                                             ;B4CC07;

SpriteObjectSpritemaps_3_SmallExplosion_4:
    dw $0004,$8000                                                       ;B4CC09;
    db $00                                                               ;B4CC0D;
    dw $FA94,$81F0                                                       ;B4CC0E;
    db $00                                                               ;B4CC12;
    dw $BA94,$8000                                                       ;B4CC13;
    db $F0                                                               ;B4CC17;
    dw $7A94,$81F0                                                       ;B4CC18;
    db $F0                                                               ;B4CC1C;
    dw $3A94                                                             ;B4CC1D;

SpriteObjectSpritemaps_3_SmallExplosion_5:
    dw $0004,$8000                                                       ;B4CC1F;
    db $00                                                               ;B4CC23;
    dw $FA96,$81F0                                                       ;B4CC24;
    db $00                                                               ;B4CC28;
    dw $BA96,$8000                                                       ;B4CC29;
    db $F0                                                               ;B4CC2D;
    dw $7A96,$81F0                                                       ;B4CC2E;
    db $F0                                                               ;B4CC32;
    dw $3A96                                                             ;B4CC33;

UNSUED_SpriteObjectSpritemaps_4_BombExplosion_0_B4CC35:
    dw $0004,$0000                                                       ;B4CC35;
    db $00                                                               ;B4CC39;
    dw $FA8B,$01F8                                                       ;B4CC3A;
    db $00                                                               ;B4CC3E;
    dw $BA8B,$0000                                                       ;B4CC3F;
    db $F8                                                               ;B4CC43;
    dw $7A8B,$01F8                                                       ;B4CC44;
    db $F8                                                               ;B4CC48;
    dw $3A8B                                                             ;B4CC49;

UNSUED_SpriteObjectSpritemaps_4_BombExplosion_1_B4CC4B:
    dw $0004,$0000                                                       ;B4CC4B;
    db $00                                                               ;B4CC4F;
    dw $FA7A,$01F8                                                       ;B4CC50;
    db $00                                                               ;B4CC54;
    dw $BA7A,$0000                                                       ;B4CC55;
    db $F8                                                               ;B4CC59;
    dw $7A7A,$01F8                                                       ;B4CC5A;
    db $F8                                                               ;B4CC5E;
    dw $3A7A                                                             ;B4CC5F;

UNSUED_SpriteObjectSpritemaps_4_BombExplosion_2_B4CC61:
    dw $0004,$8000                                                       ;B4CC61;
    db $00                                                               ;B4CC65;
    dw $FA70,$81F0                                                       ;B4CC66;
    db $00                                                               ;B4CC6A;
    dw $BA70,$8000                                                       ;B4CC6B;
    db $F0                                                               ;B4CC6F;
    dw $7A70,$81F0                                                       ;B4CC70;
    db $F0                                                               ;B4CC74;
    dw $3A70                                                             ;B4CC75;

UNSUED_SpriteObjectSpritemaps_4_BombExplosion_3_B4CC77:
    dw $0004,$8000                                                       ;B4CC77;
    db $00                                                               ;B4CC7B;
    dw $FA72,$81F0                                                       ;B4CC7C;
    db $00                                                               ;B4CC80;
    dw $BA72,$8000                                                       ;B4CC81;
    db $F0                                                               ;B4CC85;
    dw $7A72,$81F0                                                       ;B4CC86;
    db $F0                                                               ;B4CC8A;
    dw $3A72                                                             ;B4CC8B;

UNSUED_SpriteObjectSpritemaps_4_BombExplosion_4_B4CC8D:
    dw $0004,$8000                                                       ;B4CC8D;
    db $00                                                               ;B4CC91;
    dw $FA74,$81F0                                                       ;B4CC92;
    db $00                                                               ;B4CC96;
    dw $BA74,$8000                                                       ;B4CC97;
    db $F0                                                               ;B4CC9B;
    dw $7A74,$81F0                                                       ;B4CC9C;
    db $F0                                                               ;B4CCA0;
    dw $3A74                                                             ;B4CCA1;

UNSUED_SpriteObjectSpritemaps__B4CCA3:
    dw $0004,$01F8                                                       ;B4CCA3;
    db $00                                                               ;B4CCA7;
    dw $3A5E,$0000                                                       ;B4CCA8;
    db $00                                                               ;B4CCAC;
    dw $3A5E,$0000                                                       ;B4CCAD;
    db $F8                                                               ;B4CCB1;
    dw $3A5E,$01F8                                                       ;B4CCB2;
    db $F8                                                               ;B4CCB6;
    dw $3A5E                                                             ;B4CCB7;

UNSUED_SpriteObjectSpritemaps_5_BeamTrail_0_B4CCB9:
    dw $0001,$01FC                                                       ;B4CCB9;
    db $FC                                                               ;B4CCBD;
    dw $3C38                                                             ;B4CCBE;

UNSUED_SpriteObjectSpritemaps_5_BeamTrail_1_B4CCC0:
    dw $0001,$01FC                                                       ;B4CCC0;
    db $FC                                                               ;B4CCC4;
    dw $3C39                                                             ;B4CCC5;

UNSUED_SpriteObjectSpritemaps_5_BeamTrail_2_B4CCC7:
    dw $0001,$01FC                                                       ;B4CCC7;
    db $FC                                                               ;B4CCCB;
    dw $3C3A                                                             ;B4CCCC;

UNSUED_SpriteObjectSpritemaps_5_BeamTrail_3_B4CCCE:
    dw $0001,$01FC                                                       ;B4CCCE;
    db $FC                                                               ;B4CCD2;
    dw $3C3B                                                             ;B4CCD3;

UNSUED_SpriteObjectSpritemaps_7_PowerBomb_0_B4CCD5:
    dw $0001,$01FC                                                       ;B4CCD5;
    db $FC                                                               ;B4CCD9;
    dw $3A26                                                             ;B4CCDA;

UNSUED_SpriteObjectSpritemaps_7_PowerBomb_1_B4CCDC:
    dw $0001,$01FC                                                       ;B4CCDC;
    db $FC                                                               ;B4CCE0;
    dw $3A27                                                             ;B4CCE1;

UNSUED_SpriteObjectSpritemaps_7_PowerBomb_2_B4CCE3:
    dw $0001,$01FC                                                       ;B4CCE3;
    db $FC                                                               ;B4CCE7;
    dw $3A7B                                                             ;B4CCE8;

UNSUED_SpriteObjectSpritemaps_B4CCEA:
    dw $0001,$01FC                                                       ;B4CCEA;
    db $FC                                                               ;B4CCEE;
    dw $3A5F                                                             ;B4CCEF;

SpriteObjectSpritemaps_6_DudShot_0:
    dw $0001,$01FC                                                       ;B4CCF1;
    db $FC                                                               ;B4CCF5;
    dw $3A53                                                             ;B4CCF6;

SpriteObjectSpritemaps_6_DudShot_1:
    dw $0001,$01FC                                                       ;B4CCF8;
    db $FC                                                               ;B4CCFC;
    dw $3A51                                                             ;B4CCFD;

SpriteObjectSpritemaps_6_DudShot_2:
    dw $0004,$0000                                                       ;B4CCFF;
    db $00                                                               ;B4CD03;
    dw $FA60,$0000                                                       ;B4CD04;
    db $F8                                                               ;B4CD08;
    dw $7A60,$01F8                                                       ;B4CD09;
    db $00                                                               ;B4CD0D;
    dw $BA60,$01F8                                                       ;B4CD0E;
    db $F8                                                               ;B4CD12;
    dw $3A60                                                             ;B4CD13;

SpriteObjectSpritemaps_6_DudShot_3:
    dw $0004,$0000                                                       ;B4CD15;
    db $00                                                               ;B4CD19;
    dw $FA61,$0000                                                       ;B4CD1A;
    db $F8                                                               ;B4CD1E;
    dw $7A61,$01F8                                                       ;B4CD1F;
    db $00                                                               ;B4CD23;
    dw $BA61,$01F8                                                       ;B4CD24;
    db $F8                                                               ;B4CD28;
    dw $3A61                                                             ;B4CD29;

SpriteObjectSpritemaps_6_DudShot_4:
    dw $0004,$0000                                                       ;B4CD2B;
    db $00                                                               ;B4CD2F;
    dw $FA62,$0000                                                       ;B4CD30;
    db $F8                                                               ;B4CD34;
    dw $7A62,$01F8                                                       ;B4CD35;
    db $00                                                               ;B4CD39;
    dw $BA62,$01F8                                                       ;B4CD3A;
    db $F8                                                               ;B4CD3E;
    dw $3A62                                                             ;B4CD3F;

SpriteObjectSpritemaps_6_DudShot_5:
    dw $0004,$0000                                                       ;B4CD41;
    db $00                                                               ;B4CD45;
    dw $FA63,$0000                                                       ;B4CD46;
    db $F8                                                               ;B4CD4A;
    dw $7A63,$01F8                                                       ;B4CD4B;
    db $00                                                               ;B4CD4F;
    dw $BA63,$01F8                                                       ;B4CD50;
    db $F8                                                               ;B4CD54;
    dw $3A63                                                             ;B4CD55;

UNSUED_SpriteObjectSpritemaps_8_1C_ElevatorPad_0_B4CD57:
    dw $0004,$01F2                                                       ;B4CD57;
    db $FC                                                               ;B4CD5B;
    dw $7A6C,$0006                                                       ;B4CD5C;
    db $FC                                                               ;B4CD60;
    dw $7A6C,$0000                                                       ;B4CD61;
    db $FC                                                               ;B4CD65;
    dw $7A6C,$01F8                                                       ;B4CD66;
    db $FC                                                               ;B4CD6A;
    dw $3A6C                                                             ;B4CD6B;

UNSUED_SpriteObjectSpritemaps_8_1C_ElevatorPad_1_B4CD6D:
    dw $0004,$0000                                                       ;B4CD6D;
    db $FC                                                               ;B4CD71;
    dw $7A6E,$0008                                                       ;B4CD72;
    db $FC                                                               ;B4CD76;
    dw $7A6D,$01F8                                                       ;B4CD77;
    db $FC                                                               ;B4CD7B;
    dw $3A6E,$01F0                                                       ;B4CD7C;
    db $FC                                                               ;B4CD80;
    dw $3A6D                                                             ;B4CD81;

UNSUED_SpriteObjectSpritemaps_B4CD83:
    dw $0004,$01F0                                                       ;B4CD83;
    db $FE                                                               ;B4CD87;
    dw $3A6F,$0008                                                       ;B4CD88;
    db $FE                                                               ;B4CD8C;
    dw $3A6F,$0000                                                       ;B4CD8D;
    db $FE                                                               ;B4CD91;
    dw $3A6F,$01F8                                                       ;B4CD92;
    db $FE                                                               ;B4CD96;
    dw $3A6F                                                             ;B4CD97;

SpriteObjectSpritemaps_9_SmallDustCloud_0:
    dw $0001,$81F8                                                       ;B4CD99;
    db $F8                                                               ;B4CD9D;
    dw $3A7C                                                             ;B4CD9E;

SpriteObjectSpritemaps_9_SmallDustCloud_1:
    dw $0001,$81F8                                                       ;B4CDA0;
    db $F6                                                               ;B4CDA4;
    dw $3A7E                                                             ;B4CDA5;

SpriteObjectSpritemaps_9_SmallDustCloud_2:
    dw $0001,$81F8                                                       ;B4CDA7;
    db $F4                                                               ;B4CDAB;
    dw $3A9A                                                             ;B4CDAC;

SpriteObjectSpritemaps_9_SmallDustCloud_3:
    dw $0001,$81F8                                                       ;B4CDAE;
    db $F2                                                               ;B4CDB2;
    dw $3A9C                                                             ;B4CDB3;

SpriteObjectSpritemaps_A_PirateLandingDustCloud_0:
    dw $0001,$01FC                                                       ;B4CDB5;
    db $FC                                                               ;B4CDB9;
    dw $3A48                                                             ;B4CDBA;

SpriteObjectSpritemaps_A_PirateLandingDustCloud_1:
    dw $0001,$01FC                                                       ;B4CDBC;
    db $FA                                                               ;B4CDC0;
    dw $3A49                                                             ;B4CDC1;

SpriteObjectSpritemaps_A_PirateLandingDustCloud_2:
    dw $0001,$01FC                                                       ;B4CDC3;
    db $F8                                                               ;B4CDC7;
    dw $3A4A                                                             ;B4CDC8;

SpriteObjectSpritemaps_A_PirateLandingDustCloud_3:
    dw $0001,$01FC                                                       ;B4CDCA;
    db $F6                                                               ;B4CDCE;
    dw $3A4B                                                             ;B4CDCF;

UNSUED_SpriteObjectSpritemaps_B_EyeDoorSweatDrop_0_B4CDD1:
    dw $0001,$01FC                                                       ;B4CDD1;
    db $FC                                                               ;B4CDD5;
    dw $3A2C                                                             ;B4CDD6;

UNSUED_SpriteObjectSpritemaps_B_EyeDoorSweatDrop_1_B4CDD8:
    dw $0001,$01FC                                                       ;B4CDD8;
    db $FC                                                               ;B4CDDC;
    dw $3A2D                                                             ;B4CDDD;

UNSUED_SpriteObjectSpritemaps_B_EyeDoorSweatDrop_2_B4CDDF:
    dw $0001,$01FC                                                       ;B4CDDF;
    db $FC                                                               ;B4CDE3;
    dw $3A2E                                                             ;B4CDE4;

UNSUED_SpriteObjectSpritemaps_B_EyeDoorSweatDrop_3_B4CDE6:
    dw $0001,$01FC                                                       ;B4CDE6;
    db $FC                                                               ;B4CDEA;
    dw $3A2F                                                             ;B4CDEB;

SpriteObjectSpritemaps_C_Smoke_0:
    dw $0001,$81F8                                                       ;B4CDED;
    db $F6                                                               ;B4CDF1;
    dw $3A76                                                             ;B4CDF2;

SpriteObjectSpritemaps_C_Smoke_1:
    dw $0001,$81F8                                                       ;B4CDF4;
    db $F4                                                               ;B4CDF8;
    dw $3A78                                                             ;B4CDF9;

SpriteObjectSpritemaps_C_Smoke_2:
    dw $0001,$81F8                                                       ;B4CDFB;
    db $F2                                                               ;B4CDFF;
    dw $3A98                                                             ;B4CE00;

SpriteObjectSpritemaps_C_Smoke_3:
    dw $0001,$81F8                                                       ;B4CE02;
    db $F0                                                               ;B4CE06;
    dw $3A9E                                                             ;B4CE07;

UNUSED_SpriteObjectSpritemaps_B4CE09:
    dw $0001,$01FC                                                       ;B4CE09;
    db $FC                                                               ;B4CE0D;
    dw $3A25                                                             ;B4CE0E;

UNUSED_SpriteObjectSpritemaps_B4CE10:
    dw $0001,$01FC                                                       ;B4CE10;
    db $FC                                                               ;B4CE14;
    dw $3A43                                                             ;B4CE15;

UNUSED_SpriteObjectSpritemaps_B4CE17:
    dw $0001,$01FC                                                       ;B4CE17;
    db $FC                                                               ;B4CE1B;
    dw $3A40                                                             ;B4CE1C;

UNUSED_SpriteObjectSpritemaps_D_SmallEnergyDrop_0_B4CE1E:
    dw $0001,$01FC                                                       ;B4CE1E;
    db $FC                                                               ;B4CE22;
    dw $3A3E                                                             ;B4CE23;

UNUSED_SpriteObjectSpritemaps_D_SmallEnergyDrop_1_B4CE25:
    dw $0001,$01FC                                                       ;B4CE25;
    db $FC                                                               ;B4CE29;
    dw $3A3D                                                             ;B4CE2A;

UNUSED_SpriteObjectSpritemaps_D_SmallEnergyDrop_2_B4CE2C:
    dw $0001,$01FC                                                       ;B4CE2C;
    db $FC                                                               ;B4CE30;
    dw $3A41                                                             ;B4CE31;

UNUSED_SpriteObjectSpritemaps_D_SmallEnergyDrop_3_B4CE33:
    dw $0001,$01FC                                                       ;B4CE33;
    db $FC                                                               ;B4CE37;
    dw $3A42                                                             ;B4CE38;

UNUSED_SpriteObjectSpritemaps_E_BigEnergyDrop_0_B4CE3A:
    dw $0004,$0000                                                       ;B4CE3A;
    db $00                                                               ;B4CE3E;
    dw $FA44,$01F8                                                       ;B4CE3F;
    db $00                                                               ;B4CE43;
    dw $BA44,$0000                                                       ;B4CE44;
    db $F8                                                               ;B4CE48;
    dw $7A44,$01F8                                                       ;B4CE49;
    db $F8                                                               ;B4CE4D;
    dw $3A44                                                             ;B4CE4E;

UNUSED_SpriteObjectSpritemaps_E_BigEnergyDrop_1_B4CE50:
    dw $0004,$0000                                                       ;B4CE50;
    db $00                                                               ;B4CE54;
    dw $FA45,$0000                                                       ;B4CE55;
    db $F8                                                               ;B4CE59;
    dw $7A45,$01F8                                                       ;B4CE5A;
    db $00                                                               ;B4CE5E;
    dw $BA45,$01F8                                                       ;B4CE5F;
    db $F8                                                               ;B4CE63;
    dw $3A45                                                             ;B4CE64;

UNUSED_SpriteObjectSpritemaps_E_BigEnergyDrop_2_B4CE66:
    dw $0004,$01F8                                                       ;B4CE66;
    db $00                                                               ;B4CE6A;
    dw $BA46,$0000                                                       ;B4CE6B;
    db $00                                                               ;B4CE6F;
    dw $FA46,$0000                                                       ;B4CE70;
    db $F8                                                               ;B4CE74;
    dw $7A46,$01F8                                                       ;B4CE75;
    db $F8                                                               ;B4CE79;
    dw $3A46                                                             ;B4CE7A;

UNUSED_SpriteObjectSpritemaps_E_BigEnergyDrop_3_B4CE7C:
    dw $0001,$01FC                                                       ;B4CE7C;
    db $FC                                                               ;B4CE80;
    dw $3A42                                                             ;B4CE81;

UNUSED_SpriteObjectSpritemaps_F_Bomb_0_B4CE83:
    dw $0001,$01FC                                                       ;B4CE83;
    db $FC                                                               ;B4CE87;
    dw $3A4C                                                             ;B4CE88;

UNUSED_SpriteObjectSpritemaps_F_Bomb_1_B4CE8A:
    dw $0001,$01FC                                                       ;B4CE8A;
    db $FC                                                               ;B4CE8E;
    dw $3A4D                                                             ;B4CE8F;

UNUSED_SpriteObjectSpritemaps_F_Bomb_2_B4CE91:
    dw $0001,$01FC                                                       ;B4CE91;
    db $FC                                                               ;B4CE95;
    dw $3A4E                                                             ;B4CE96;

UNUSED_SpriteObjectSpritemaps_F_Bomb_3_B4CE98:
    dw $0001,$01FC                                                       ;B4CE98;
    db $FC                                                               ;B4CE9C;
    dw $3A4F                                                             ;B4CE9D;

UNUSED_SpriteObjectSpritemaps_B4CE9F:
    dw $0002,$01FF                                                       ;B4CE9F;
    db $FC                                                               ;B4CEA3;
    dw $3A55,$01F7                                                       ;B4CEA4;
    db $FC                                                               ;B4CEA8;
    dw $3A54                                                             ;B4CEA9;

UNUSED_SpriteObjectSpritemaps_B4CEAB:
    dw $0003,$01FA                                                       ;B4CEAB;
    db $F5                                                               ;B4CEAF;
    dw $3A56,$0002                                                       ;B4CEB0;
    db $FD                                                               ;B4CEB4;
    dw $3A58,$01FA                                                       ;B4CEB5;
    db $FD                                                               ;B4CEB9;
    dw $3A57                                                             ;B4CEBA;

UNUSED_SpriteObjectSpritemaps_B4CEBC:
    dw $0002,$01FD                                                       ;B4CEBC;
    db $F7                                                               ;B4CEC0;
    dw $3A59,$01FD                                                       ;B4CEC1;
    db $FF                                                               ;B4CEC5;
    dw $3A5A                                                             ;B4CEC6;

UNUSED_SpriteObjectSpritemaps_B4CEC8:
    dw $0003,$01FE                                                       ;B4CEC8;
    db $F5                                                               ;B4CECC;
    dw $7A56,$01F6                                                       ;B4CECD;
    db $FD                                                               ;B4CED1;
    dw $7A58,$01FE                                                       ;B4CED2;
    db $FD                                                               ;B4CED6;
    dw $7A57                                                             ;B4CED7;

UNUSED_SpriteObjectSpritemaps_B4CED9:
    dw $0002,$01F9                                                       ;B4CED9;
    db $FC                                                               ;B4CEDD;
    dw $7A55,$0001                                                       ;B4CEDE;
    db $FC                                                               ;B4CEE2;
    dw $7A54                                                             ;B4CEE3;

UNUSED_SpriteObjectSpritemaps_B4CEE5:
    dw $0003,$01FE                                                       ;B4CEE5;
    db $03                                                               ;B4CEE9;
    dw $FA56,$01F6                                                       ;B4CEEA;
    db $FB                                                               ;B4CEEE;
    dw $FA58,$01FE                                                       ;B4CEEF;
    db $FB                                                               ;B4CEF3;
    dw $FA57                                                             ;B4CEF4;

UNUSED_SpriteObjectSpritemaps_B4CEF6:
    dw $0002,$01FD                                                       ;B4CEF6;
    db $01                                                               ;B4CEFA;
    dw $BA59,$01FD                                                       ;B4CEFB;
    db $F9                                                               ;B4CEFF;
    dw $BA5A                                                             ;B4CF00;

UNUSED_SpriteObjectSpritemaps_B4CF02:
    dw $0003,$01FA                                                       ;B4CF02;
    db $03                                                               ;B4CF06;
    dw $BA56,$0002                                                       ;B4CF07;
    db $FB                                                               ;B4CF0B;
    dw $BA58,$01FA                                                       ;B4CF0C;
    db $FB                                                               ;B4CF10;
    dw $BA57                                                             ;B4CF11;

UNUSED_SpriteObjectSpritemaps_B4CF13:
    dw $0002,$0000                                                       ;B4CF13;
    db $FC                                                               ;B4CF17;
    dw $3A65,$01F8                                                       ;B4CF18;
    db $FC                                                               ;B4CF1C;
    dw $3A64                                                             ;B4CF1D;

UNUSED_SpriteObjectSpritemaps_B4CF1F:
    dw $0003,$0002                                                       ;B4CF1F;
    db $FE                                                               ;B4CF23;
    dw $3A68,$01FA                                                       ;B4CF24;
    db $FE                                                               ;B4CF28;
    dw $3A67,$01FA                                                       ;B4CF29;
    db $F6                                                               ;B4CF2D;
    dw $3A66                                                             ;B4CF2E;

UNUSED_SpriteObjectSpritemaps_B4CF30:
    dw $0002,$01FC                                                       ;B4CF30;
    db $F8                                                               ;B4CF34;
    dw $3A69,$01FC                                                       ;B4CF35;
    db $00                                                               ;B4CF39;
    dw $3A6A                                                             ;B4CF3A;

UNUSED_SpriteObjectSpritemaps_B4CF3C:
    dw $0003,$01F6                                                       ;B4CF3C;
    db $FE                                                               ;B4CF40;
    dw $7A68,$01FE                                                       ;B4CF41;
    db $FE                                                               ;B4CF45;
    dw $7A67,$01FE                                                       ;B4CF46;
    db $F6                                                               ;B4CF4A;
    dw $7A66                                                             ;B4CF4B;

UNUSED_SpriteObjectSpritemaps_B4CF4D:
    dw $0002,$01F8                                                       ;B4CF4D;
    db $FC                                                               ;B4CF51;
    dw $7A65,$0000                                                       ;B4CF52;
    db $FC                                                               ;B4CF56;
    dw $7A64                                                             ;B4CF57;

UNUSED_SpriteObjectSpritemaps_B4CF59:
    dw $0003,$01F6                                                       ;B4CF59;
    db $FA                                                               ;B4CF5D;
    dw $FA68,$01FE                                                       ;B4CF5E;
    db $FA                                                               ;B4CF62;
    dw $FA67,$01FE                                                       ;B4CF63;
    db $02                                                               ;B4CF67;
    dw $FA66                                                             ;B4CF68;

UNUSED_SpriteObjectSpritemaps_B4CF6A:
    dw $0002,$01FC                                                       ;B4CF6A;
    db $00                                                               ;B4CF6E;
    dw $BA69,$01FC                                                       ;B4CF6F;
    db $F8                                                               ;B4CF73;
    dw $BA6A                                                             ;B4CF74;

UNUSED_SpriteObjectSpritemaps_B4CF76:
    dw $0003,$0002                                                       ;B4CF76;
    db $FA                                                               ;B4CF7A;
    dw $BA68,$01FA                                                       ;B4CF7B;
    db $FA                                                               ;B4CF7F;
    dw $BA67,$01FA                                                       ;B4CF80;
    db $02                                                               ;B4CF84;
    dw $BA66                                                             ;B4CF85;

UNUSED_SpriteObjectSpritemaps_10_SmallEnergyDrop_0_B4CF87:
    dw $0001,$01FC                                                       ;B4CF87;
    db $FC                                                               ;B4CF8B;
    dw $3A3C                                                             ;B4CF8C;

UNUSED_SpriteObjectSpritemaps_10_SmallEnergyDrop_1_B4CF8E:
    dw $0001,$01FC                                                       ;B4CF8E;
    db $FC                                                               ;B4CF92;
    dw $3A3D                                                             ;B4CF93;

UNUSED_SpriteObjectSpritemaps_10_SmallEnergyDrop_2_B4CF95:
    dw $0001,$01FC                                                       ;B4CF95;
    db $FC                                                               ;B4CF99;
    dw $3A3E                                                             ;B4CF9A;

UNUSED_SpriteObjectSpritemaps_B4CF9C:
    dw $0001,$01FC                                                       ;B4CF9C;
    db $FC                                                               ;B4CFA0;
    dw $3A3F                                                             ;B4CFA1;

SpriteObjectSpritemaps_1D_BigExplosion_0:
    dw $0004,$0000                                                       ;B4CFA3;
    db $00                                                               ;B4CFA7;
    dw $FA8A,$01F8                                                       ;B4CFA8;
    db $00                                                               ;B4CFAC;
    dw $BA8A,$0000                                                       ;B4CFAD;
    db $F8                                                               ;B4CFB1;
    dw $7A8A,$01F8                                                       ;B4CFB2;
    db $F8                                                               ;B4CFB6;
    dw $3A8A                                                             ;B4CFB7;

SpriteObjectSpritemaps_1D_BigExplosion_1:
    dw $0004,$C200                                                       ;B4CFB9;
    db $00                                                               ;B4CFBD;
    dw $FA90,$C200                                                       ;B4CFBE;
    db $F0                                                               ;B4CFC2;
    dw $7A90,$C3F0                                                       ;B4CFC3;
    db $00                                                               ;B4CFC7;
    dw $BA90,$C3F0                                                       ;B4CFC8;
    db $F0                                                               ;B4CFCC;
    dw $3A90                                                             ;B4CFCD;

SpriteObjectSpritemaps_1D_BigExplosion_2:
    dw $0004,$C200                                                       ;B4CFCF;
    db $00                                                               ;B4CFD3;
    dw $FA92,$C3F0                                                       ;B4CFD4;
    db $00                                                               ;B4CFD8;
    dw $BA92,$C200                                                       ;B4CFD9;
    db $F0                                                               ;B4CFDD;
    dw $7A92,$C3F0                                                       ;B4CFDE;
    db $F0                                                               ;B4CFE2;
    dw $3A92                                                             ;B4CFE3;

SpriteObjectSpritemaps_1D_BigExplosion_3:
    dw $000C,$0010                                                       ;B4CFE5;
    db $00                                                               ;B4CFE9;
    dw $FAC2,$0010                                                       ;B4CFEA;
    db $F8                                                               ;B4CFEE;
    dw $7AC2,$0000                                                       ;B4CFEF;
    db $10                                                               ;B4CFF3;
    dw $FAB2,$01F8                                                       ;B4CFF4;
    db $10                                                               ;B4CFF8;
    dw $BAB2,$01E8                                                       ;B4CFF9;
    db $00                                                               ;B4CFFD;
    dw $BAC2,$01E8                                                       ;B4CFFE;
    db $F8                                                               ;B4D002;
    dw $3AC2,$0000                                                       ;B4D003;
    db $E8                                                               ;B4D007;
    dw $7AB2,$01F8                                                       ;B4D008;
    db $E8                                                               ;B4D00C;
    dw $3AB2,$C200                                                       ;B4D00D;
    db $00                                                               ;B4D011;
    dw $FAB0,$C200                                                       ;B4D012;
    db $F0                                                               ;B4D016;
    dw $7AB0,$C3F0                                                       ;B4D017;
    db $00                                                               ;B4D01B;
    dw $BAB0,$C3F0                                                       ;B4D01C;
    db $F0                                                               ;B4D020;
    dw $3AB0                                                             ;B4D021;

SpriteObjectSpritemaps_1D_BigExplosion_4:
    dw $0008,$C208                                                       ;B4D023;
    db $00                                                               ;B4D027;
    dw $FAB5,$C200                                                       ;B4D028;
    db $08                                                               ;B4D02C;
    dw $FAB3,$C3E8                                                       ;B4D02D;
    db $00                                                               ;B4D031;
    dw $BAB5,$C3F0                                                       ;B4D032;
    db $08                                                               ;B4D036;
    dw $BAB3,$C208                                                       ;B4D037;
    db $F0                                                               ;B4D03B;
    dw $7AB5,$C200                                                       ;B4D03C;
    db $E8                                                               ;B4D040;
    dw $7AB3,$C3E8                                                       ;B4D041;
    db $F0                                                               ;B4D045;
    dw $3AB5,$C3F0                                                       ;B4D046;
    db $E8                                                               ;B4D04A;
    dw $3AB3                                                             ;B4D04B;

SpriteObjectSpritemaps_1D_BigExplosion_5:
    dw $000C,$0000                                                       ;B4D04D;
    db $10                                                               ;B4D051;
    dw $FABB,$01F8                                                       ;B4D052;
    db $10                                                               ;B4D056;
    dw $BABB,$0000                                                       ;B4D057;
    db $E8                                                               ;B4D05B;
    dw $7ABB,$01F8                                                       ;B4D05C;
    db $E8                                                               ;B4D060;
    dw $3ABB,$0010                                                       ;B4D061;
    db $00                                                               ;B4D065;
    dw $FAB7,$0010                                                       ;B4D066;
    db $F8                                                               ;B4D06A;
    dw $7AB7,$01E8                                                       ;B4D06B;
    db $00                                                               ;B4D06F;
    dw $BAB7,$01E8                                                       ;B4D070;
    db $F8                                                               ;B4D074;
    dw $3AB7,$C208                                                       ;B4D075;
    db $08                                                               ;B4D079;
    dw $FAB8,$C3E8                                                       ;B4D07A;
    db $08                                                               ;B4D07E;
    dw $BAB8,$C208                                                       ;B4D07F;
    db $E8                                                               ;B4D083;
    dw $7AB8,$C3E8                                                       ;B4D084;
    db $E8                                                               ;B4D088;
    dw $3AB8                                                             ;B4D089;

UNUSED_SpriteObjectSpritemaps_26_0_B4D08B:
    dw $0009,$81FE                                                       ;B4D08B;
    db $FB                                                               ;B4D08F;
    dw $20D6,$81EE                                                       ;B4D090;
    db $FB                                                               ;B4D094;
    dw $20D4,$81FE                                                       ;B4D095;
    db $EB                                                               ;B4D099;
    dw $20D2,$81EE                                                       ;B4D09A;
    db $EB                                                               ;B4D09E;
    dw $20D0,$8002                                                       ;B4D09F;
    db $FB                                                               ;B4D0A3;
    dw $20D8,$8001                                                       ;B4D0A4;
    db $01                                                               ;B4D0A8;
    dw $20D8,$81FF                                                       ;B4D0A9;
    db $07                                                               ;B4D0AD;
    dw $20DC,$01FE                                                       ;B4D0AE;
    db $10                                                               ;B4D0B2;
    dw $20F6,$01FE                                                       ;B4D0B3;
    db $08                                                               ;B4D0B7;
    dw $20F5                                                             ;B4D0B8;

UNUSED_SpriteObjectSpritemaps_26_1_B4D0BA:
    dw $0009,$81FE                                                       ;B4D0BA;
    db $FB                                                               ;B4D0BE;
    dw $20D6,$81EE                                                       ;B4D0BF;
    db $FB                                                               ;B4D0C3;
    dw $20D4,$81FE                                                       ;B4D0C4;
    db $EB                                                               ;B4D0C8;
    dw $20D2,$81EE                                                       ;B4D0C9;
    db $EB                                                               ;B4D0CD;
    dw $20D0,$8002                                                       ;B4D0CE;
    db $FC                                                               ;B4D0D2;
    dw $20D8,$8001                                                       ;B4D0D3;
    db $02                                                               ;B4D0D7;
    dw $20D8,$81FF                                                       ;B4D0D8;
    db $07                                                               ;B4D0DC;
    dw $20DC,$01FE                                                       ;B4D0DD;
    db $10                                                               ;B4D0E1;
    dw $20F6,$01FE                                                       ;B4D0E2;
    db $08                                                               ;B4D0E6;
    dw $20F5                                                             ;B4D0E7;

UNUSED_SpriteObjectSpritemaps_26_2_B4D0E9:
    dw $0009,$81FE                                                       ;B4D0E9;
    db $FB                                                               ;B4D0ED;
    dw $20D6,$81EE                                                       ;B4D0EE;
    db $FB                                                               ;B4D0F2;
    dw $20D4,$81FE                                                       ;B4D0F3;
    db $EB                                                               ;B4D0F7;
    dw $20D2,$81EE                                                       ;B4D0F8;
    db $EB                                                               ;B4D0FC;
    dw $20D0,$8002                                                       ;B4D0FD;
    db $FD                                                               ;B4D101;
    dw $20D8,$8001                                                       ;B4D102;
    db $03                                                               ;B4D106;
    dw $20D8,$81FF                                                       ;B4D107;
    db $08                                                               ;B4D10B;
    dw $20DC,$01FE                                                       ;B4D10C;
    db $11                                                               ;B4D110;
    dw $20F6,$01FE                                                       ;B4D111;
    db $09                                                               ;B4D115;
    dw $20F5                                                             ;B4D116;

UNUSED_SpriteObjectSpritemaps_26_3_B4D118:
    dw $0009,$81FE                                                       ;B4D118;
    db $FB                                                               ;B4D11C;
    dw $20D6,$81EE                                                       ;B4D11D;
    db $FB                                                               ;B4D121;
    dw $20D4,$81FE                                                       ;B4D122;
    db $EB                                                               ;B4D126;
    dw $20D2,$81EE                                                       ;B4D127;
    db $EB                                                               ;B4D12B;
    dw $20D0,$8002                                                       ;B4D12C;
    db $FD                                                               ;B4D130;
    dw $20D8,$8001                                                       ;B4D131;
    db $04                                                               ;B4D135;
    dw $20D8,$81FF                                                       ;B4D136;
    db $09                                                               ;B4D13A;
    dw $20DC,$01FE                                                       ;B4D13B;
    db $12                                                               ;B4D13F;
    dw $20F6,$01FE                                                       ;B4D140;
    db $0A                                                               ;B4D144;
    dw $20F5                                                             ;B4D145;

UNUSED_SpriteObjectSpritemaps_26_4_B4D147:
    dw $0009,$81FE                                                       ;B4D147;
    db $FB                                                               ;B4D14B;
    dw $20D6,$81EE                                                       ;B4D14C;
    db $FB                                                               ;B4D150;
    dw $20D4,$81FE                                                       ;B4D151;
    db $EB                                                               ;B4D155;
    dw $20D2,$81EE                                                       ;B4D156;
    db $EB                                                               ;B4D15A;
    dw $20D0,$8002                                                       ;B4D15B;
    db $FD                                                               ;B4D15F;
    dw $20D8,$8001                                                       ;B4D160;
    db $04                                                               ;B4D164;
    dw $20D8,$81FF                                                       ;B4D165;
    db $0A                                                               ;B4D169;
    dw $20DC,$01FE                                                       ;B4D16A;
    db $11                                                               ;B4D16E;
    dw $20F6,$01FE                                                       ;B4D16F;
    db $09                                                               ;B4D173;
    dw $20F5                                                             ;B4D174;

UNUSED_SpriteObjectSpritemaps_26_5_B4D176:
    dw $0009,$81FE                                                       ;B4D176;
    db $FB                                                               ;B4D17A;
    dw $20D6,$81EE                                                       ;B4D17B;
    db $FB                                                               ;B4D17F;
    dw $20D4,$81FE                                                       ;B4D180;
    db $EB                                                               ;B4D184;
    dw $20D2,$81EE                                                       ;B4D185;
    db $EB                                                               ;B4D189;
    dw $20D0,$8002                                                       ;B4D18A;
    db $FC                                                               ;B4D18E;
    dw $20D8,$8001                                                       ;B4D18F;
    db $03                                                               ;B4D193;
    dw $20D8,$81FF                                                       ;B4D194;
    db $09                                                               ;B4D198;
    dw $20DC,$01FE                                                       ;B4D199;
    db $10                                                               ;B4D19D;
    dw $20F6,$01FE                                                       ;B4D19E;
    db $08                                                               ;B4D1A2;
    dw $20F5                                                             ;B4D1A3;

UNUSED_SpriteObjectSpritemaps_B4D1A5:
    dw $0009,$81FE                                                       ;B4D1A5;
    db $FB                                                               ;B4D1A9;
    dw $20D6,$81EE                                                       ;B4D1AA;
    db $FB                                                               ;B4D1AE;
    dw $20D4,$81FE                                                       ;B4D1AF;
    db $EB                                                               ;B4D1B3;
    dw $20D2,$81EE                                                       ;B4D1B4;
    db $EB                                                               ;B4D1B8;
    dw $20D0,$8002                                                       ;B4D1B9;
    db $FB                                                               ;B4D1BD;
    dw $20D8,$8001                                                       ;B4D1BE;
    db $01                                                               ;B4D1C2;
    dw $20D8,$81FF                                                       ;B4D1C3;
    db $07                                                               ;B4D1C7;
    dw $20DC,$01FE                                                       ;B4D1C8;
    db $10                                                               ;B4D1CC;
    dw $20F6,$01FE                                                       ;B4D1CD;
    db $08                                                               ;B4D1D1;
    dw $20F5                                                             ;B4D1D2;

UNUSED_SpriteObjectSpritemaps_27_0_B4D1D4:
    dw $0005,$0000                                                       ;B4D1D4;
    db $F8                                                               ;B4D1D8;
    dw $20F3,$01F8                                                       ;B4D1D9;
    db $F8                                                               ;B4D1DD;
    dw $20F2,$0002                                                       ;B4D1DE;
    db $FC                                                               ;B4D1E2;
    dw $20F4,$01FE                                                       ;B4D1E3;
    db $F4                                                               ;B4D1E7;
    dw $20F1,$01F6                                                       ;B4D1E8;
    db $F4                                                               ;B4D1EC;
    dw $20F0                                                             ;B4D1ED;

UNUSED_SpriteObjectSpritemaps_27_1_B4D1EF:
    dw $0005,$01FE                                                       ;B4D1EF;
    db $F4                                                               ;B4D1F3;
    dw $20F3,$01F6                                                       ;B4D1F4;
    db $F4                                                               ;B4D1F8;
    dw $20F2,$0000                                                       ;B4D1F9;
    db $F8                                                               ;B4D1FD;
    dw $20F4,$0002                                                       ;B4D1FE;
    db $FC                                                               ;B4D202;
    dw $20F3,$01FA                                                       ;B4D203;
    db $FC                                                               ;B4D207;
    dw $20F2                                                             ;B4D208;

UNUSED_SpriteObjectSpritemaps_27_2_B4D20A:
    dw $0005,$01FE                                                       ;B4D20A;
    db $F4                                                               ;B4D20E;
    dw $20F4,$01F8                                                       ;B4D20F;
    db $F8                                                               ;B4D213;
    dw $20F2,$0000                                                       ;B4D214;
    db $F8                                                               ;B4D218;
    dw $20F3,$0002                                                       ;B4D219;
    db $FC                                                               ;B4D21D;
    dw $20F1,$01FA                                                       ;B4D21E;
    db $FC                                                               ;B4D222;
    dw $20F0                                                             ;B4D223;

UNUSED_SpriteObjectSpritemaps_27_3_B4D225:
    dw $0006,$01FE                                                       ;B4D225;
    db $F4                                                               ;B4D229;
    dw $20F3,$01F6                                                       ;B4D22A;
    db $F4                                                               ;B4D22E;
    dw $20F2,$01F8                                                       ;B4D22F;
    db $F8                                                               ;B4D233;
    dw $20F0,$0000                                                       ;B4D234;
    db $F8                                                               ;B4D238;
    dw $20F1,$0002                                                       ;B4D239;
    db $FC                                                               ;B4D23D;
    dw $20F3,$01FA                                                       ;B4D23E;
    db $FC                                                               ;B4D242;
    dw $20F2                                                             ;B4D243;

UNUSED_SpriteObjectSpritemaps_27_4_B4D245:
    dw $0003,$01FE                                                       ;B4D245;
    db $F4                                                               ;B4D249;
    dw $20F4,$0000                                                       ;B4D24A;
    db $F8                                                               ;B4D24E;
    dw $20F4,$0002                                                       ;B4D24F;
    db $FC                                                               ;B4D253;
    dw $20F4                                                             ;B4D254;

UNUSED_SpriteObjectSpritemaps_B4D256:
    dw $0006,$01FE                                                       ;B4D256;
    db $F4                                                               ;B4D25A;
    dw $20F3,$01F6                                                       ;B4D25B;
    db $F4                                                               ;B4D25F;
    dw $20F2,$01F8                                                       ;B4D260;
    db $F8                                                               ;B4D264;
    dw $20F2,$0000                                                       ;B4D265;
    db $F8                                                               ;B4D269;
    dw $20F3,$0002                                                       ;B4D26A;
    db $FC                                                               ;B4D26E;
    dw $20F3,$01FA                                                       ;B4D26F;
    db $FC                                                               ;B4D273;
    dw $20F2                                                             ;B4D274;

UNUSED_SpriteObjectSpritemaps_B4D276:
    dw $0006,$01FE                                                       ;B4D276;
    db $F4                                                               ;B4D27A;
    dw $20F1,$01F6                                                       ;B4D27B;
    db $F4                                                               ;B4D27F;
    dw $20F0,$0000                                                       ;B4D280;
    db $F8                                                               ;B4D284;
    dw $20F1,$01F8                                                       ;B4D285;
    db $F8                                                               ;B4D289;
    dw $20F0,$0002                                                       ;B4D28A;
    db $FC                                                               ;B4D28E;
    dw $20F1,$01FA                                                       ;B4D28F;
    db $FC                                                               ;B4D293;
    dw $20F0                                                             ;B4D294;

UNUSED_SpriteObjectSpritemaps_B4D296:
    dw $0004,$0000                                                       ;B4D296;
    db $00                                                               ;B4D29A;
    dw $A0F8,$01F8                                                       ;B4D29B;
    db $00                                                               ;B4D29F;
    dw $A0F7,$0000                                                       ;B4D2A0;
    db $F8                                                               ;B4D2A4;
    dw $20F8,$01F8                                                       ;B4D2A5;
    db $F8                                                               ;B4D2A9;
    dw $20F7                                                             ;B4D2AA;

UNUSED_SpriteObjectSpritemaps_2A_B4D2AC:
    dw $0001,$81F8                                                       ;B4D2AC;
    db $F8                                                               ;B4D2B0;
    dw $20DE                                                             ;B4D2B1;

UNUSED_SpriteObjectSpritemaps_28_0_B4D2B3:
    dw $0009,$81F2                                                       ;B4D2B3;
    db $FB                                                               ;B4D2B7;
    dw $60D6,$8002                                                       ;B4D2B8;
    db $FB                                                               ;B4D2BC;
    dw $60D4,$81F2                                                       ;B4D2BD;
    db $EB                                                               ;B4D2C1;
    dw $60D2,$8002                                                       ;B4D2C2;
    db $EB                                                               ;B4D2C6;
    dw $60D0,$81EE                                                       ;B4D2C7;
    db $FB                                                               ;B4D2CB;
    dw $60D8,$81EF                                                       ;B4D2CC;
    db $01                                                               ;B4D2D0;
    dw $60D8,$81F1                                                       ;B4D2D1;
    db $07                                                               ;B4D2D5;
    dw $60DC,$01FA                                                       ;B4D2D6;
    db $10                                                               ;B4D2DA;
    dw $60F6,$01FA                                                       ;B4D2DB;
    db $08                                                               ;B4D2DF;
    dw $60F5                                                             ;B4D2E0;

UNUSED_SpriteObjectSpritemaps_28_1_B4D2E2:
    dw $0009,$81F2                                                       ;B4D2E2;
    db $FB                                                               ;B4D2E6;
    dw $60D6,$8002                                                       ;B4D2E7;
    db $FB                                                               ;B4D2EB;
    dw $60D4,$81F2                                                       ;B4D2EC;
    db $EB                                                               ;B4D2F0;
    dw $60D2,$8002                                                       ;B4D2F1;
    db $EB                                                               ;B4D2F5;
    dw $60D0,$81EE                                                       ;B4D2F6;
    db $FC                                                               ;B4D2FA;
    dw $60D8,$81EF                                                       ;B4D2FB;
    db $02                                                               ;B4D2FF;
    dw $60D8,$81F1                                                       ;B4D300;
    db $07                                                               ;B4D304;
    dw $60DC,$01FA                                                       ;B4D305;
    db $10                                                               ;B4D309;
    dw $60F6,$01FA                                                       ;B4D30A;
    db $08                                                               ;B4D30E;
    dw $60F5                                                             ;B4D30F;

UNUSED_SpriteObjectSpritemaps_28_2_B4D311:
    dw $0009,$81F2                                                       ;B4D311;
    db $FB                                                               ;B4D315;
    dw $60D6,$8002                                                       ;B4D316;
    db $FB                                                               ;B4D31A;
    dw $60D4,$81F2                                                       ;B4D31B;
    db $EB                                                               ;B4D31F;
    dw $60D2,$8002                                                       ;B4D320;
    db $EB                                                               ;B4D324;
    dw $60D0,$81EE                                                       ;B4D325;
    db $FD                                                               ;B4D329;
    dw $60D8,$81EF                                                       ;B4D32A;
    db $03                                                               ;B4D32E;
    dw $60D8,$81F1                                                       ;B4D32F;
    db $08                                                               ;B4D333;
    dw $60DC,$01FA                                                       ;B4D334;
    db $11                                                               ;B4D338;
    dw $60F6,$01FA                                                       ;B4D339;
    db $09                                                               ;B4D33D;
    dw $60F5                                                             ;B4D33E;

UNUSED_SpriteObjectSpritemaps_28_3_B4D340:
    dw $0009,$81F2                                                       ;B4D340;
    db $FB                                                               ;B4D344;
    dw $60D6,$8002                                                       ;B4D345;
    db $FB                                                               ;B4D349;
    dw $60D4,$81F2                                                       ;B4D34A;
    db $EB                                                               ;B4D34E;
    dw $60D2,$8002                                                       ;B4D34F;
    db $EB                                                               ;B4D353;
    dw $60D0,$81EE                                                       ;B4D354;
    db $FD                                                               ;B4D358;
    dw $60D8,$81EF                                                       ;B4D359;
    db $04                                                               ;B4D35D;
    dw $60D8,$81F1                                                       ;B4D35E;
    db $09                                                               ;B4D362;
    dw $60DC,$01FA                                                       ;B4D363;
    db $12                                                               ;B4D367;
    dw $60F6,$01FA                                                       ;B4D368;
    db $0A                                                               ;B4D36C;
    dw $60F5                                                             ;B4D36D;

UNUSED_SpriteObjectSpritemaps_28_4_B4D36F:
    dw $0009,$81F2                                                       ;B4D36F;
    db $FB                                                               ;B4D373;
    dw $60D6,$8002                                                       ;B4D374;
    db $FB                                                               ;B4D378;
    dw $60D4,$81F2                                                       ;B4D379;
    db $EB                                                               ;B4D37D;
    dw $60D2,$8002                                                       ;B4D37E;
    db $EB                                                               ;B4D382;
    dw $60D0,$81EE                                                       ;B4D383;
    db $FD                                                               ;B4D387;
    dw $60D8,$81EF                                                       ;B4D388;
    db $04                                                               ;B4D38C;
    dw $60D8,$81F1                                                       ;B4D38D;
    db $0A                                                               ;B4D391;
    dw $60DC,$01FA                                                       ;B4D392;
    db $11                                                               ;B4D396;
    dw $60F6,$01FA                                                       ;B4D397;
    db $09                                                               ;B4D39B;
    dw $60F5                                                             ;B4D39C;

UNUSED_SpriteObjectSpritemaps_28_5_B4D39E:
    dw $0009,$81F2                                                       ;B4D39E;
    db $FB                                                               ;B4D3A2;
    dw $60D6,$8002                                                       ;B4D3A3;
    db $FB                                                               ;B4D3A7;
    dw $60D4,$81F2                                                       ;B4D3A8;
    db $EB                                                               ;B4D3AC;
    dw $60D2,$8002                                                       ;B4D3AD;
    db $EB                                                               ;B4D3B1;
    dw $60D0,$81EE                                                       ;B4D3B2;
    db $FC                                                               ;B4D3B6;
    dw $60D8,$81EF                                                       ;B4D3B7;
    db $03                                                               ;B4D3BB;
    dw $60D8,$81F1                                                       ;B4D3BC;
    db $09                                                               ;B4D3C0;
    dw $60DC,$01FA                                                       ;B4D3C1;
    db $10                                                               ;B4D3C5;
    dw $60F6,$01FA                                                       ;B4D3C6;
    db $08                                                               ;B4D3CA;
    dw $60F5                                                             ;B4D3CB;

UNUSED_SpriteObjectSpritemaps_B4D3CD:
    dw $0009,$81F2                                                       ;B4D3CD;
    db $FB                                                               ;B4D3D1;
    dw $60D6,$8002                                                       ;B4D3D2;
    db $FB                                                               ;B4D3D6;
    dw $60D4,$81F2                                                       ;B4D3D7;
    db $EB                                                               ;B4D3DB;
    dw $60D2,$8002                                                       ;B4D3DC;
    db $EB                                                               ;B4D3E0;
    dw $60D0,$81EE                                                       ;B4D3E1;
    db $FB                                                               ;B4D3E5;
    dw $60D8,$81EF                                                       ;B4D3E6;
    db $01                                                               ;B4D3EA;
    dw $60D8,$81F1                                                       ;B4D3EB;
    db $07                                                               ;B4D3EF;
    dw $60DC,$01FA                                                       ;B4D3F0;
    db $10                                                               ;B4D3F4;
    dw $60F6,$01FA                                                       ;B4D3F5;
    db $08                                                               ;B4D3F9;
    dw $60F5                                                             ;B4D3FA;

UNUSED_SpriteObjectSpritemaps_29_0_B4D3FC:
    dw $0005,$01F8                                                       ;B4D3FC;
    db $F8                                                               ;B4D400;
    dw $60F3,$0000                                                       ;B4D401;
    db $F8                                                               ;B4D405;
    dw $60F2,$01FA                                                       ;B4D406;
    db $F4                                                               ;B4D40A;
    dw $60F1,$0002                                                       ;B4D40B;
    db $F4                                                               ;B4D40F;
    dw $60F0,$01F6                                                       ;B4D410;
    db $FC                                                               ;B4D414;
    dw $60F4                                                             ;B4D415;

UNUSED_SpriteObjectSpritemaps_29_1_B4D417:
    dw $0005,$01FA                                                       ;B4D417;
    db $F4                                                               ;B4D41B;
    dw $60F3,$0002                                                       ;B4D41C;
    db $F4                                                               ;B4D420;
    dw $60F2,$01F8                                                       ;B4D421;
    db $F8                                                               ;B4D425;
    dw $60F4,$01F6                                                       ;B4D426;
    db $FC                                                               ;B4D42A;
    dw $60F3,$01FE                                                       ;B4D42B;
    db $FC                                                               ;B4D42F;
    dw $60F2                                                             ;B4D430;

UNUSED_SpriteObjectSpritemaps_29_2_B4D432:
    dw $0005,$01FA                                                       ;B4D432;
    db $F4                                                               ;B4D436;
    dw $60F4,$01F8                                                       ;B4D437;
    db $F8                                                               ;B4D43B;
    dw $60F3,$0000                                                       ;B4D43C;
    db $F8                                                               ;B4D440;
    dw $60F2,$01F6                                                       ;B4D441;
    db $FC                                                               ;B4D445;
    dw $60F1,$01FE                                                       ;B4D446;
    db $FC                                                               ;B4D44A;
    dw $60F0                                                             ;B4D44B;

UNUSED_SpriteObjectSpritemaps_29_3_B4D44D:
    dw $0006,$01FA                                                       ;B4D44D;
    db $F4                                                               ;B4D451;
    dw $60F3,$0002                                                       ;B4D452;
    db $F4                                                               ;B4D456;
    dw $60F2,$0000                                                       ;B4D457;
    db $F8                                                               ;B4D45B;
    dw $60F0,$01F8                                                       ;B4D45C;
    db $F8                                                               ;B4D460;
    dw $60F1,$01F6                                                       ;B4D461;
    db $FC                                                               ;B4D465;
    dw $60F3,$01FE                                                       ;B4D466;
    db $FC                                                               ;B4D46A;
    dw $60F2                                                             ;B4D46B;

UNUSED_SpriteObjectSpritemaps_29_4_B4D46D:
    dw $0003,$01F6                                                       ;B4D46D;
    db $FC                                                               ;B4D471;
    dw $60F4,$01F8                                                       ;B4D472;
    db $F8                                                               ;B4D476;
    dw $60F4,$01FA                                                       ;B4D477;
    db $F4                                                               ;B4D47B;
    dw $60F4                                                             ;B4D47C;

UNUSED_SpriteObjectSpritemaps_B4D47E:
    dw $0006,$01FA                                                       ;B4D47E;
    db $F4                                                               ;B4D482;
    dw $60F3,$0002                                                       ;B4D483;
    db $F4                                                               ;B4D487;
    dw $60F2,$01F8                                                       ;B4D488;
    db $F8                                                               ;B4D48C;
    dw $60F3,$0000                                                       ;B4D48D;
    db $F8                                                               ;B4D491;
    dw $60F2,$01F6                                                       ;B4D492;
    db $FC                                                               ;B4D496;
    dw $60F3,$01FE                                                       ;B4D497;
    db $FC                                                               ;B4D49B;
    dw $60F2                                                             ;B4D49C;

UNUSED_SpriteObjectSpritemaps_B4D49E:
    dw $0006,$01FA                                                       ;B4D49E;
    db $F4                                                               ;B4D4A2;
    dw $60F1,$0002                                                       ;B4D4A3;
    db $F4                                                               ;B4D4A7;
    dw $60F0,$0000                                                       ;B4D4A8;
    db $F8                                                               ;B4D4AC;
    dw $60F0,$01F8                                                       ;B4D4AD;
    db $F8                                                               ;B4D4B1;
    dw $60F1,$01F6                                                       ;B4D4B2;
    db $FC                                                               ;B4D4B6;
    dw $60F1,$01FE                                                       ;B4D4B7;
    db $FC                                                               ;B4D4BB;
    dw $60F0                                                             ;B4D4BC;

SpriteObjectSpritemaps_2B_Puromi_0:
    dw $0001,$81F9                                                       ;B4D4BE;
    db $F8                                                               ;B4D4C2;
    dw $230A                                                             ;B4D4C3;

SpriteObjectSpritemaps_2B_Puromi_1:
    dw $0001,$81F9                                                       ;B4D4C5;
    db $F8                                                               ;B4D4C9;
    dw $2308                                                             ;B4D4CA;

SpriteObjectSpritemaps_2B_Puromi_2:
    dw $0001,$81F8                                                       ;B4D4CC;
    db $F8                                                               ;B4D4D0;
    dw $E30A                                                             ;B4D4D1;

SpriteObjectSpritemaps_2B_Puromi_3:
    dw $0001,$81F8                                                       ;B4D4D3;
    db $F8                                                               ;B4D4D7;
    dw $E308                                                             ;B4D4D8;

SpriteObjectSpritemaps_2B_Puromi_4:
    dw $0001,$81F9                                                       ;B4D4DA;
    db $F8                                                               ;B4D4DE;
    dw $2306                                                             ;B4D4DF;

SpriteObjectSpritemaps_2B_Puromi_5:
    dw $0001,$81F9                                                       ;B4D4E1;
    db $F8                                                               ;B4D4E5;
    dw $2322                                                             ;B4D4E6;

SpriteObjectSpritemaps_2B_Puromi_6:
    dw $0001,$81F8                                                       ;B4D4E8;
    db $F8                                                               ;B4D4EC;
    dw $E306                                                             ;B4D4ED;

SpriteObjectSpritemaps_2B_Puromi_7:
    dw $0001,$81F8                                                       ;B4D4EF;
    db $F8                                                               ;B4D4F3;
    dw $E322                                                             ;B4D4F4;

SpriteObjectSpritemaps_2C_PuromiRightExplosion_0:
    dw $0001,$81F9                                                       ;B4D4F6;
    db $F9                                                               ;B4D4FA;
    dw $230E                                                             ;B4D4FB;

SpriteObjectSpritemaps_2C_PuromiRightExplosion_1:
    dw $0001,$81FD                                                       ;B4D4FD;
    db $F5                                                               ;B4D501;
    dw $2320                                                             ;B4D502;

SpriteObjectSpritemaps_2C_PuromiRightExplosion_2:
    dw $0001,$8003                                                       ;B4D504;
    db $EE                                                               ;B4D508;
    dw $2304                                                             ;B4D509;

SpriteObjectSpritemaps_2C_PuromiRightExplosion_3:
    dw $0001,$8005                                                       ;B4D50B;
    db $EC                                                               ;B4D50F;
    dw $2308                                                             ;B4D510;

SpriteObjectSpritemaps_2C_PuromiRightExplosion_4:
    dw $0001,$8005                                                       ;B4D512;
    db $EC                                                               ;B4D516;
    dw $230C                                                             ;B4D517;

SpriteObjectSpritemaps_2C_PuromiRightExplosion_5:
    dw $0001,$8005                                                       ;B4D519;
    db $EC                                                               ;B4D51D;
    dw $2326                                                             ;B4D51E;

SpriteObjectSpritemaps_2C_PuromiRightExplosion_6:
    dw $0001,$8005                                                       ;B4D520;
    db $EC                                                               ;B4D524;
    dw $232E                                                             ;B4D525;

SpriteObjectSpritemaps_2D_PuromiLeftExplosion_0:
    dw $0001,$81F8                                                       ;B4D527;
    db $F9                                                               ;B4D52B;
    dw $630E                                                             ;B4D52C;

SpriteObjectSpritemaps_2D_PuromiLeftExplosion_1:
    dw $0001,$81F4                                                       ;B4D52E;
    db $F5                                                               ;B4D532;
    dw $6320                                                             ;B4D533;

SpriteObjectSpritemaps_2D_PuromiLeftExplosion_2:
    dw $0001,$81EE                                                       ;B4D535;
    db $EE                                                               ;B4D539;
    dw $6304                                                             ;B4D53A;

SpriteObjectSpritemaps_2D_PuromiLeftExplosion_3:
    dw $0001,$81EC                                                       ;B4D53C;
    db $EC                                                               ;B4D540;
    dw $6308                                                             ;B4D541;

SpriteObjectSpritemaps_2D_PuromiLeftExplosion_4:
    dw $0001,$81EC                                                       ;B4D543;
    db $EC                                                               ;B4D547;
    dw $630C                                                             ;B4D548;

SpriteObjectSpritemaps_2D_PuromiLeftExplosion_5:
    dw $0001,$81EC                                                       ;B4D54A;
    db $EC                                                               ;B4D54E;
    dw $6326                                                             ;B4D54F;

SpriteObjectSpritemaps_2D_PuromiLeftExplosion_6:
    dw $0001,$81EB                                                       ;B4D551;
    db $EC                                                               ;B4D555;
    dw $232E                                                             ;B4D556;

SpriteObjectSpritemaps_2E_PuromiSplash_0:
    dw $0002,$01F1                                                       ;B4D558;
    db $F8                                                               ;B4D55C;
    dw $6334,$0008                                                       ;B4D55D;
    db $F8                                                               ;B4D561;
    dw $2334                                                             ;B4D562;

SpriteObjectSpritemaps_2E_PuromiSplash_1:
    dw $0002,$01F1                                                       ;B4D564;
    db $F8                                                               ;B4D568;
    dw $6324,$0008                                                       ;B4D569;
    db $F8                                                               ;B4D56D;
    dw $2324                                                             ;B4D56E;

SpriteObjectSpritemaps_2E_PuromiSplash_2:
    dw $0002,$81E9                                                       ;B4D570;
    db $F0                                                               ;B4D574;
    dw $6328,$8008                                                       ;B4D575;
    db $F0                                                               ;B4D579;
    dw $2328                                                             ;B4D57A;

SpriteObjectSpritemaps_2E_PuromiSplash_3:
    dw $0002,$81E9                                                       ;B4D57C;
    db $F0                                                               ;B4D580;
    dw $632C,$8008                                                       ;B4D581;
    db $F0                                                               ;B4D585;
    dw $232C                                                             ;B4D586;

SpriteObjectSpritemaps_2E_PuromiSplash_4:
    dw $0002,$81E8                                                       ;B4D588;
    db $F0                                                               ;B4D58C;
    dw $632A,$8009                                                       ;B4D58D;
    db $F0                                                               ;B4D591;
    dw $232A                                                             ;B4D592;

UNUSED_SpriteObjectSpritemaps_2F_B4D594:
    dw $0001,$81F8                                                       ;B4D594;
    db $F8                                                               ;B4D598;
    dw $3340                                                             ;B4D599;

SpriteObjectSpritemaps_30_FallingSparkTrail_0:
    dw $0001,$01FC                                                       ;B4D59B;
    db $FC                                                               ;B4D59F;
    dw $2107                                                             ;B4D5A0;

SpriteObjectSpritemaps_30_FallingSparkTrail_1:
    dw $0001,$01FC                                                       ;B4D5A2;
    db $FC                                                               ;B4D5A6;
    dw $2108                                                             ;B4D5A7;

SpriteObjectSpritemaps_30_FallingSparkTrail_2:
    dw $0001,$01FC                                                       ;B4D5A9;
    db $FC                                                               ;B4D5AD;
    dw $2109                                                             ;B4D5AE;

SpriteObjectSpritemaps_30_FallingSparkTrail_3:
    dw $0001,$01FC                                                       ;B4D5B0;
    db $FC                                                               ;B4D5B4;
    dw $210A                                                             ;B4D5B5;

SpriteObjectSpritemaps_34_35_36_MetroidShell_0:
    dw $000A,$0010                                                       ;B4D5B7;
    db $04                                                               ;B4D5BB;
    dw $6130,$0010                                                       ;B4D5BC;
    db $FC                                                               ;B4D5C0;
    dw $6120,$0010                                                       ;B4D5C1;
    db $F4                                                               ;B4D5C5;
    dw $6110,$01E8                                                       ;B4D5C6;
    db $04                                                               ;B4D5CA;
    dw $2130,$01E8                                                       ;B4D5CB;
    db $FC                                                               ;B4D5CF;
    dw $2120,$01E8                                                       ;B4D5D0;
    db $F4                                                               ;B4D5D4;
    dw $2110,$8000                                                       ;B4D5D5;
    db $FC                                                               ;B4D5D9;
    dw $6121,$8000                                                       ;B4D5DA;
    db $EC                                                               ;B4D5DE;
    dw $2103,$81F0                                                       ;B4D5DF;
    db $FC                                                               ;B4D5E3;
    dw $2121,$81F0                                                       ;B4D5E4;
    db $EC                                                               ;B4D5E8;
    dw $2101                                                             ;B4D5E9;

SpriteObjectSpritemaps_34_36_MetroidShell_1:
    dw $000A,$0010                                                       ;B4D5EB;
    db $FC                                                               ;B4D5EF;
    dw $612A,$0010                                                       ;B4D5F0;
    db $04                                                               ;B4D5F4;
    dw $613A,$0010                                                       ;B4D5F5;
    db $F4                                                               ;B4D5F9;
    dw $211F,$01E8                                                       ;B4D5FA;
    db $04                                                               ;B4D5FE;
    dw $213A,$01E8                                                       ;B4D5FF;
    db $FC                                                               ;B4D603;
    dw $212A,$01E8                                                       ;B4D604;
    db $F4                                                               ;B4D608;
    dw $211A,$8000                                                       ;B4D609;
    db $EC                                                               ;B4D60D;
    dw $210D,$8000                                                       ;B4D60E;
    db $FC                                                               ;B4D612;
    dw $612B,$81F0                                                       ;B4D613;
    db $FC                                                               ;B4D617;
    dw $212B,$81F0                                                       ;B4D618;
    db $EC                                                               ;B4D61C;
    dw $210B                                                             ;B4D61D;

SpriteObjectSpritemaps_34_35_36_MetroidShell_2:
    dw $000A,$01E8                                                       ;B4D61F;
    db $FC                                                               ;B4D623;
    dw $2125,$0010                                                       ;B4D624;
    db $04                                                               ;B4D628;
    dw $6135,$0010                                                       ;B4D629;
    db $FC                                                               ;B4D62D;
    dw $6125,$0010                                                       ;B4D62E;
    db $F4                                                               ;B4D632;
    dw $6115,$01E8                                                       ;B4D633;
    db $04                                                               ;B4D637;
    dw $2135,$01E8                                                       ;B4D638;
    db $F4                                                               ;B4D63C;
    dw $2115,$8000                                                       ;B4D63D;
    db $FC                                                               ;B4D641;
    dw $6126,$8000                                                       ;B4D642;
    db $EC                                                               ;B4D646;
    dw $2108,$81F0                                                       ;B4D647;
    db $FC                                                               ;B4D64B;
    dw $2126,$81F0                                                       ;B4D64C;
    db $EC                                                               ;B4D650;
    dw $2106                                                             ;B4D651;

UNUSED_SpriteObjectSpritemaps_31_MetroidInsides_0_B4D653:
    dw $0008,$0010                                                       ;B4D653;
    db $00                                                               ;B4D657;
    dw $6160,$0010                                                       ;B4D658;
    db $F8                                                               ;B4D65C;
    dw $6150,$01E8                                                       ;B4D65D;
    db $00                                                               ;B4D661;
    dw $2160,$01E8                                                       ;B4D662;
    db $F8                                                               ;B4D666;
    dw $2150,$8000                                                       ;B4D667;
    db $00                                                               ;B4D66B;
    dw $6161,$8000                                                       ;B4D66C;
    db $F0                                                               ;B4D670;
    dw $6141,$81F0                                                       ;B4D671;
    db $00                                                               ;B4D675;
    dw $2161,$81F0                                                       ;B4D676;
    db $F0                                                               ;B4D67A;
    dw $2141                                                             ;B4D67B;

UNUSED_SpriteObjectSpritemaps_31_MetroidInsides_1_B4D67D:
    dw $0006,$0010                                                       ;B4D67D;
    db $00                                                               ;B4D681;
    dw $6163,$01E8                                                       ;B4D682;
    db $00                                                               ;B4D686;
    dw $2163,$8000                                                       ;B4D687;
    db $00                                                               ;B4D68B;
    dw $6164,$8000                                                       ;B4D68C;
    db $F0                                                               ;B4D690;
    dw $6144,$81F0                                                       ;B4D691;
    db $00                                                               ;B4D695;
    dw $2164,$81F0                                                       ;B4D696;
    db $F0                                                               ;B4D69A;
    dw $2144                                                             ;B4D69B;

UNUSED_SpriteObjectSpritemaps_31_MetroidInsides_2_B4D69D:
    dw $0008,$0010                                                       ;B4D69D;
    db $00                                                               ;B4D6A1;
    dw $6166,$0010                                                       ;B4D6A2;
    db $F8                                                               ;B4D6A6;
    dw $6156,$01E8                                                       ;B4D6A7;
    db $00                                                               ;B4D6AB;
    dw $2166,$01E8                                                       ;B4D6AC;
    db $F8                                                               ;B4D6B0;
    dw $2156,$8000                                                       ;B4D6B1;
    db $00                                                               ;B4D6B5;
    dw $6167,$8000                                                       ;B4D6B6;
    db $F0                                                               ;B4D6BA;
    dw $6147,$81F0                                                       ;B4D6BB;
    db $00                                                               ;B4D6BF;
    dw $2167,$81F0                                                       ;B4D6C0;
    db $F0                                                               ;B4D6C4;
    dw $2147                                                             ;B4D6C5;

UNUSED_SpriteObjectSpritemaps_31_MetroidInsides_3_B4D6C7:
    dw $0008,$0010                                                       ;B4D6C7;
    db $00                                                               ;B4D6CB;
    dw $6169,$0010                                                       ;B4D6CC;
    db $F8                                                               ;B4D6D0;
    dw $6159,$01E8                                                       ;B4D6D1;
    db $00                                                               ;B4D6D5;
    dw $2169,$01E8                                                       ;B4D6D6;
    db $F8                                                               ;B4D6DA;
    dw $2159,$8000                                                       ;B4D6DB;
    db $00                                                               ;B4D6DF;
    dw $616A,$8000                                                       ;B4D6E0;
    db $F0                                                               ;B4D6E4;
    dw $614A,$81F0                                                       ;B4D6E5;
    db $00                                                               ;B4D6E9;
    dw $216A,$81F0                                                       ;B4D6EA;
    db $F0                                                               ;B4D6EE;
    dw $214A                                                             ;B4D6EF;

SpriteObjectSpritemaps_32_33_MetroidElectricity_0:
    dw $0003,$0000                                                       ;B4D6F1;
    db $EC                                                               ;B4D6F5;
    dw $217C,$01F8                                                       ;B4D6F6;
    db $FC                                                               ;B4D6FA;
    dw $214D,$01F0                                                       ;B4D6FB;
    db $FC                                                               ;B4D6FF;
    dw $214C                                                             ;B4D700;

SpriteObjectSpritemaps_32_33_MetroidElectricity_1:
    dw $0003,$0000                                                       ;B4D702;
    db $EC                                                               ;B4D706;
    dw $217D,$01F8                                                       ;B4D707;
    db $FC                                                               ;B4D70B;
    dw $215D,$01F0                                                       ;B4D70C;
    db $FC                                                               ;B4D710;
    dw $215C                                                             ;B4D711;

SpriteObjectSpritemaps_32_33_MetroidElectricity_2:
    dw $0003,$0000                                                       ;B4D713;
    db $EC                                                               ;B4D717;
    dw $217E,$01F8                                                       ;B4D718;
    db $FC                                                               ;B4D71C;
    dw $216D,$01F0                                                       ;B4D71D;
    db $FC                                                               ;B4D721;
    dw $216C                                                             ;B4D722;

SpriteObjectSpritemaps_32_33_MetroidElectricity_3:
    dw $0004,$0008                                                       ;B4D724;
    db $FC                                                               ;B4D728;
    dw $214F,$0000                                                       ;B4D729;
    db $FC                                                               ;B4D72D;
    dw $214E,$01F8                                                       ;B4D72E;
    db $F4                                                               ;B4D732;
    dw $213D,$01F8                                                       ;B4D733;
    db $EC                                                               ;B4D737;
    dw $212D                                                             ;B4D738;

SpriteObjectSpritemaps_32_33_MetroidElectricity_4:
    dw $0004,$0008                                                       ;B4D73A;
    db $FC                                                               ;B4D73E;
    dw $215F,$0000                                                       ;B4D73F;
    db $FC                                                               ;B4D743;
    dw $215E,$01F8                                                       ;B4D744;
    db $F4                                                               ;B4D748;
    dw $213E,$01F8                                                       ;B4D749;
    db $EC                                                               ;B4D74D;
    dw $212E                                                             ;B4D74E;

SpriteObjectSpritemaps_32_33_MetroidElectricity_5:
    dw $0004,$0008                                                       ;B4D750;
    db $FC                                                               ;B4D754;
    dw $216F,$0000                                                       ;B4D755;
    db $FC                                                               ;B4D759;
    dw $216E,$01F8                                                       ;B4D75A;
    db $F4                                                               ;B4D75E;
    dw $213F,$01F8                                                       ;B4D75F;
    db $EC                                                               ;B4D763;
    dw $212F                                                             ;B4D764;

SpriteObjectSpritemaps_32_33_MetroidElectricity_6:
    dw $0003,$0008                                                       ;B4D766;
    db $FC                                                               ;B4D76A;
    dw $214D,$0000                                                       ;B4D76B;
    db $FC                                                               ;B4D76F;
    dw $214C,$01F8                                                       ;B4D770;
    db $EC                                                               ;B4D774;
    dw $617C                                                             ;B4D775;

SpriteObjectSpritemaps_32_33_MetroidElectricity_7:
    dw $0003,$0008                                                       ;B4D777;
    db $FC                                                               ;B4D77B;
    dw $215D,$0000                                                       ;B4D77C;
    db $FC                                                               ;B4D780;
    dw $215C,$01F8                                                       ;B4D781;
    db $EC                                                               ;B4D785;
    dw $617D                                                             ;B4D786;

SpriteObjectSpritemaps_32_33_MetroidElectricity_8:
    dw $0003,$0008                                                       ;B4D788;
    db $FC                                                               ;B4D78C;
    dw $216D,$0000                                                       ;B4D78D;
    db $FC                                                               ;B4D791;
    dw $216C,$01F8                                                       ;B4D792;
    db $EC                                                               ;B4D796;
    dw $617E                                                             ;B4D797;

SpriteObjectSpritemaps_32_33_MetroidElectricity_9:
    dw $0004,$01F8                                                       ;B4D799;
    db $FC                                                               ;B4D79D;
    dw $214F,$01F0                                                       ;B4D79E;
    db $FC                                                               ;B4D7A2;
    dw $214E,$0000                                                       ;B4D7A3;
    db $F4                                                               ;B4D7A7;
    dw $613D,$0000                                                       ;B4D7A8;
    db $EC                                                               ;B4D7AC;
    dw $612D                                                             ;B4D7AD;

SpriteObjectSpritemaps_32_33_MetroidElectricity_A:
    dw $0004,$01F8                                                       ;B4D7AF;
    db $FC                                                               ;B4D7B3;
    dw $216F,$01F0                                                       ;B4D7B4;
    db $FC                                                               ;B4D7B8;
    dw $216E,$0000                                                       ;B4D7B9;
    db $F4                                                               ;B4D7BD;
    dw $613E,$0000                                                       ;B4D7BE;
    db $EC                                                               ;B4D7C2;
    dw $612E                                                             ;B4D7C3;

SpriteObjectSpritemaps_32_33_MetroidElectricity_B:
    dw $0004,$01F8                                                       ;B4D7C5;
    db $FC                                                               ;B4D7C9;
    dw $215F,$01F0                                                       ;B4D7CA;
    db $FC                                                               ;B4D7CE;
    dw $215E,$0000                                                       ;B4D7CF;
    db $F4                                                               ;B4D7D3;
    dw $613F,$0000                                                       ;B4D7D4;
    db $EC                                                               ;B4D7D8;
    dw $612F                                                             ;B4D7D9;

SpriteObjectSpritemaps_32_MetroidElectricity_C:
    dw $0002,$01F8                                                       ;B4D7DB;
    db $FC                                                               ;B4D7DF;
    dw $214D,$01F0                                                       ;B4D7E0;
    db $FC                                                               ;B4D7E4;
    dw $214C                                                             ;B4D7E5;

SpriteObjectSpritemaps_32_MetroidElectricity_D:
    dw $0001,$01F0                                                       ;B4D7E7;
    db $FC                                                               ;B4D7EB;
    dw $215C                                                             ;B4D7EC;

SpriteObjectSpritemaps_32_MetroidElectricity_E:
    dw $0002,$01F8                                                       ;B4D7EE;
    db $FC                                                               ;B4D7F2;
    dw $216D,$01F0                                                       ;B4D7F3;
    db $FC                                                               ;B4D7F7;
    dw $216C                                                             ;B4D7F8;

SpriteObjectSpritemaps_32_33_MetroidElectricity_F:
    dw $0002,$01F8                                                       ;B4D7FA;
    db $F4                                                               ;B4D7FE;
    dw $213D,$01F8                                                       ;B4D7FF;
    db $EC                                                               ;B4D803;
    dw $212D                                                             ;B4D804;

SpriteObjectSpritemaps_32_33_MetroidElectricity_10:
    dw $0002,$01F8                                                       ;B4D806;
    db $F4                                                               ;B4D80A;
    dw $213E,$01F8                                                       ;B4D80B;
    db $EC                                                               ;B4D80F;
    dw $212E                                                             ;B4D810;

SpriteObjectSpritemaps_32_33_MetroidElectricity_11:
    dw $0002,$01F8                                                       ;B4D812;
    db $F4                                                               ;B4D816;
    dw $213F,$01F8                                                       ;B4D817;
    db $EC                                                               ;B4D81B;
    dw $212F                                                             ;B4D81C;

SpriteObjectSpritemaps_32_MetroidElectricity_12:
    dw $0002,$0008                                                       ;B4D81E;
    db $FC                                                               ;B4D822;
    dw $214D,$0000                                                       ;B4D823;
    db $FC                                                               ;B4D827;
    dw $214C                                                             ;B4D828;

SpriteObjectSpritemaps_32_MetroidElectricity_13:
    dw $0002,$0008                                                       ;B4D82A;
    db $FC                                                               ;B4D82E;
    dw $215D,$0000                                                       ;B4D82F;
    db $FC                                                               ;B4D833;
    dw $215C                                                             ;B4D834;

SpriteObjectSpritemaps_32_MetroidElectricity_14:
    dw $0002,$0008                                                       ;B4D836;
    db $FC                                                               ;B4D83A;
    dw $216D,$0000                                                       ;B4D83B;
    db $FC                                                               ;B4D83F;
    dw $216C                                                             ;B4D840;

SpriteObjectSpritemaps_32_33_MetroidElectricity_15:
    dw $0001,$0000                                                       ;B4D842;
    db $EC                                                               ;B4D846;
    dw $217C                                                             ;B4D847;

SpriteObjectSpritemaps_32_33_MetroidElectricity_16:
    dw $0001,$0000                                                       ;B4D849;
    db $EC                                                               ;B4D84D;
    dw $217D                                                             ;B4D84E;

SpriteObjectSpritemaps_32_33_MetroidElectricity_17:
    dw $0001,$0000                                                       ;B4D850;
    db $EC                                                               ;B4D854;
    dw $217E                                                             ;B4D855;

SpriteObjectSpritemaps_37_EnemyShot_0:
    dw $0004,$0002                                                       ;B4D857;
    db $02                                                               ;B4D85B;
    dw $ECBC,$01F6                                                       ;B4D85C;
    db $02                                                               ;B4D860;
    dw $ACBC,$0002                                                       ;B4D861;
    db $F6                                                               ;B4D865;
    dw $6CBC,$01F6                                                       ;B4D866;
    db $F6                                                               ;B4D86A;
    dw $2CBC                                                             ;B4D86B;

SpriteObjectSpritemaps_37_EnemyShot_1:
    dw $0004,$0004                                                       ;B4D86D;
    db $04                                                               ;B4D871;
    dw $ECBD,$01F4                                                       ;B4D872;
    db $04                                                               ;B4D876;
    dw $ACBD,$0004                                                       ;B4D877;
    db $F4                                                               ;B4D87B;
    dw $6CBD,$01F4                                                       ;B4D87C;
    db $F4                                                               ;B4D880;
    dw $2CBD                                                             ;B4D881;

SpriteObjectSpritemaps_37_EnemyShot_2:
    dw $0004,$0007                                                       ;B4D883;
    db $07                                                               ;B4D887;
    dw $ECCB,$0007                                                       ;B4D888;
    db $F1                                                               ;B4D88C;
    dw $6CCB,$01F1                                                       ;B4D88D;
    db $07                                                               ;B4D891;
    dw $ACCB,$01F1                                                       ;B4D892;
    db $F1                                                               ;B4D896;
    dw $2CCB                                                             ;B4D897;

SpriteObjectSpritemaps_37_EnemyShot_3:
    dw $0004,$000B                                                       ;B4D899;
    db $0B                                                               ;B4D89D;
    dw $ECCC,$01ED                                                       ;B4D89E;
    db $0B                                                               ;B4D8A2;
    dw $ACCC,$000B                                                       ;B4D8A3;
    db $ED                                                               ;B4D8A7;
    dw $6CCC,$01ED                                                       ;B4D8A8;
    db $ED                                                               ;B4D8AC;
    dw $2CCC                                                             ;B4D8AD;

SpriteObjectSpritemaps_38_YappingMawBaseFacingDown:
    dw $0001,$81F8                                                       ;B4D8AF;
    db $F8                                                               ;B4D8B3;
    dw $210A                                                             ;B4D8B4;

SpriteObjectSpritemaps_39_YappingMawBaseFacingUp:
    dw $0001,$81F8                                                       ;B4D8B6;
    db $F8                                                               ;B4D8BA;
    dw $A10A                                                             ;B4D8BB;

UNUSED_SpriteObjectSpritemaps_3A_0_B4D8BD:
    dw $000E,$01FB                                                       ;B4D8BD;
    db $00                                                               ;B4D8C1;
    dw $20F3,$01F3                                                       ;B4D8C2;
    db $00                                                               ;B4D8C6;
    dw $20F2,$01FD                                                       ;B4D8C7;
    db $04                                                               ;B4D8CB;
    dw $20F4,$01F9                                                       ;B4D8CC;
    db $FD                                                               ;B4D8D0;
    dw $20F1,$01F1                                                       ;B4D8D1;
    db $FD                                                               ;B4D8D5;
    dw $20F0,$81FE                                                       ;B4D8D6;
    db $FB                                                               ;B4D8DA;
    dw $20D6,$81EE                                                       ;B4D8DB;
    db $FB                                                               ;B4D8DF;
    dw $20D4,$81FE                                                       ;B4D8E0;
    db $EB                                                               ;B4D8E4;
    dw $20D2,$81EE                                                       ;B4D8E5;
    db $EB                                                               ;B4D8E9;
    dw $20D0,$8002                                                       ;B4D8EA;
    db $FB                                                               ;B4D8EE;
    dw $20D8,$8001                                                       ;B4D8EF;
    db $01                                                               ;B4D8F3;
    dw $20DA,$81FF                                                       ;B4D8F4;
    db $07                                                               ;B4D8F8;
    dw $20DC,$01FE                                                       ;B4D8F9;
    db $10                                                               ;B4D8FD;
    dw $20F6,$01FE                                                       ;B4D8FE;
    db $08                                                               ;B4D902;
    dw $20F5                                                             ;B4D903;

UNUSED_SpriteObjectSpritemaps_3A_1_B4D905:
    dw $0010,$01F9                                                       ;B4D905;
    db $FC                                                               ;B4D909;
    dw $20F3,$01F1                                                       ;B4D90A;
    db $FC                                                               ;B4D90E;
    dw $20F2,$01FB                                                       ;B4D90F;
    db $00                                                               ;B4D913;
    dw $20F4,$01FD                                                       ;B4D914;
    db $04                                                               ;B4D918;
    dw $20F3,$01F5                                                       ;B4D919;
    db $04                                                               ;B4D91D;
    dw $20F2,$01EE                                                       ;B4D91E;
    db $FB                                                               ;B4D922;
    dw $20F9,$01F6                                                       ;B4D923;
    db $F3                                                               ;B4D927;
    dw $20FC,$81FE                                                       ;B4D928;
    db $FB                                                               ;B4D92C;
    dw $20D6,$81EE                                                       ;B4D92D;
    db $FB                                                               ;B4D931;
    dw $20D4,$81FE                                                       ;B4D932;
    db $EB                                                               ;B4D936;
    dw $20D2,$81EE                                                       ;B4D937;
    db $EB                                                               ;B4D93B;
    dw $20D0,$8002                                                       ;B4D93C;
    db $FC                                                               ;B4D940;
    dw $20D8,$8001                                                       ;B4D941;
    db $02                                                               ;B4D945;
    dw $20DA,$81FF                                                       ;B4D946;
    db $07                                                               ;B4D94A;
    dw $20DC,$01FE                                                       ;B4D94B;
    db $11                                                               ;B4D94F;
    dw $20F6,$01FE                                                       ;B4D950;
    db $09                                                               ;B4D954;
    dw $20F5                                                             ;B4D955;

UNUSED_SpriteObjectSpritemaps_3A_2_B4D957:
    dw $0010,$01FC                                                       ;B4D957;
    db $04                                                               ;B4D95B;
    dw $20F1,$01FC                                                       ;B4D95C;
    db $00                                                               ;B4D960;
    dw $20F3,$01F4                                                       ;B4D961;
    db $04                                                               ;B4D965;
    dw $20F0,$01F4                                                       ;B4D966;
    db $00                                                               ;B4D96A;
    dw $20F2,$01F8                                                       ;B4D96B;
    db $FC                                                               ;B4D96F;
    dw $20F4,$01EE                                                       ;B4D970;
    db $FB                                                               ;B4D974;
    dw $20FA,$01F6                                                       ;B4D975;
    db $F3                                                               ;B4D979;
    dw $20FB,$81FE                                                       ;B4D97A;
    db $FB                                                               ;B4D97E;
    dw $20D6,$81EE                                                       ;B4D97F;
    db $FB                                                               ;B4D983;
    dw $20D4,$81FE                                                       ;B4D984;
    db $EB                                                               ;B4D988;
    dw $20D2,$81EE                                                       ;B4D989;
    db $EB                                                               ;B4D98D;
    dw $20D0,$8002                                                       ;B4D98E;
    db $FD                                                               ;B4D992;
    dw $20D8,$8001                                                       ;B4D993;
    db $03                                                               ;B4D997;
    dw $20DA,$81FF                                                       ;B4D998;
    db $08                                                               ;B4D99C;
    dw $20DC,$01FE                                                       ;B4D99D;
    db $12                                                               ;B4D9A1;
    dw $20F6,$01FE                                                       ;B4D9A2;
    db $0A                                                               ;B4D9A6;
    dw $20F5                                                             ;B4D9A7;

UNUSED_SpriteObjectSpritemaps_3A_3_B4D9A9:
    dw $0010,$01FE                                                       ;B4D9A9;
    db $04                                                               ;B4D9AD;
    dw $20F3,$01F6                                                       ;B4D9AE;
    db $04                                                               ;B4D9B2;
    dw $20F2,$01F4                                                       ;B4D9B3;
    db $01                                                               ;B4D9B7;
    dw $20F0,$01FC                                                       ;B4D9B8;
    db $01                                                               ;B4D9BC;
    dw $20F1,$01FB                                                       ;B4D9BD;
    db $FC                                                               ;B4D9C1;
    dw $20F3,$01F3                                                       ;B4D9C2;
    db $FC                                                               ;B4D9C6;
    dw $20F2,$01EE                                                       ;B4D9C7;
    db $FB                                                               ;B4D9CB;
    dw $20F9,$81FE                                                       ;B4D9CC;
    db $FB                                                               ;B4D9D0;
    dw $20D6,$81EE                                                       ;B4D9D1;
    db $FB                                                               ;B4D9D5;
    dw $20D4,$81FE                                                       ;B4D9D6;
    db $EB                                                               ;B4D9DA;
    dw $20D2,$81EE                                                       ;B4D9DB;
    db $EB                                                               ;B4D9DF;
    dw $20D0,$8002                                                       ;B4D9E0;
    db $FD                                                               ;B4D9E4;
    dw $20D8,$8001                                                       ;B4D9E5;
    db $04                                                               ;B4D9E9;
    dw $20DA,$81FF                                                       ;B4D9EA;
    db $09                                                               ;B4D9EE;
    dw $20DC,$01FE                                                       ;B4D9EF;
    db $12                                                               ;B4D9F3;
    dw $20F6,$01FE                                                       ;B4D9F4;
    db $0A                                                               ;B4D9F8;
    dw $20F5                                                             ;B4D9F9;

UNUSED_SpriteObjectSpritemaps_3A_4_B4D9FB:
    dw $000F,$01FC                                                       ;B4D9FB;
    db $00                                                               ;B4D9FF;
    dw $20F3,$01F4                                                       ;B4DA00;
    db $00                                                               ;B4DA04;
    dw $20F2,$01FE                                                       ;B4DA05;
    db $04                                                               ;B4DA09;
    dw $20F4,$01FA                                                       ;B4DA0A;
    db $FD                                                               ;B4DA0E;
    dw $20F1,$01F2                                                       ;B4DA0F;
    db $FD                                                               ;B4DA13;
    dw $20F0,$01EE                                                       ;B4DA14;
    db $FB                                                               ;B4DA18;
    dw $20F9,$81FE                                                       ;B4DA19;
    db $FB                                                               ;B4DA1D;
    dw $20D6,$81EE                                                       ;B4DA1E;
    db $FB                                                               ;B4DA22;
    dw $20D4,$81FE                                                       ;B4DA23;
    db $EB                                                               ;B4DA27;
    dw $20D2,$81EE                                                       ;B4DA28;
    db $EB                                                               ;B4DA2C;
    dw $20D0,$8002                                                       ;B4DA2D;
    db $FD                                                               ;B4DA31;
    dw $20D8,$8001                                                       ;B4DA32;
    db $04                                                               ;B4DA36;
    dw $20DA,$81FF                                                       ;B4DA37;
    db $0A                                                               ;B4DA3B;
    dw $20DC,$01FE                                                       ;B4DA3C;
    db $12                                                               ;B4DA40;
    dw $20F6,$01FE                                                       ;B4DA41;
    db $0A                                                               ;B4DA45;
    dw $20F5                                                             ;B4DA46;

UNUSED_SpriteObjectSpritemaps_3A_5_B4DA48:
    dw $000E,$01FC                                                       ;B4DA48;
    db $00                                                               ;B4DA4C;
    dw $20F4,$01FE                                                       ;B4DA4D;
    db $04                                                               ;B4DA51;
    dw $20F3,$01FA                                                       ;B4DA52;
    db $FB                                                               ;B4DA56;
    dw $20F3,$01F2                                                       ;B4DA57;
    db $FB                                                               ;B4DA5B;
    dw $20F2,$01F6                                                       ;B4DA5C;
    db $04                                                               ;B4DA60;
    dw $20F2,$81FE                                                       ;B4DA61;
    db $FB                                                               ;B4DA65;
    dw $20D6,$81EE                                                       ;B4DA66;
    db $FB                                                               ;B4DA6A;
    dw $20D4,$81FE                                                       ;B4DA6B;
    db $EB                                                               ;B4DA6F;
    dw $20D2,$81EE                                                       ;B4DA70;
    db $EB                                                               ;B4DA74;
    dw $20D0,$8002                                                       ;B4DA75;
    db $FC                                                               ;B4DA79;
    dw $20D8,$8001                                                       ;B4DA7A;
    db $03                                                               ;B4DA7E;
    dw $20DA,$81FF                                                       ;B4DA7F;
    db $0A                                                               ;B4DA83;
    dw $20DC,$01FE                                                       ;B4DA84;
    db $11                                                               ;B4DA88;
    dw $20F6,$01FE                                                       ;B4DA89;
    db $09                                                               ;B4DA8D;
    dw $20F5                                                             ;B4DA8E;

UNUSED_SpriteObjectSpritemaps_3A_6_B4DA90:
    dw $000E,$01FE                                                       ;B4DA90;
    db $04                                                               ;B4DA94;
    dw $20F1,$01F6                                                       ;B4DA95;
    db $04                                                               ;B4DA99;
    dw $20F0,$01FA                                                       ;B4DA9A;
    db $FC                                                               ;B4DA9E;
    dw $20F4,$01F4                                                       ;B4DA9F;
    db $00                                                               ;B4DAA3;
    dw $20F2,$01FC                                                       ;B4DAA4;
    db $00                                                               ;B4DAA8;
    dw $20F3,$81FE                                                       ;B4DAA9;
    db $FB                                                               ;B4DAAD;
    dw $20D6,$81EE                                                       ;B4DAAE;
    db $FB                                                               ;B4DAB2;
    dw $20D4,$81FE                                                       ;B4DAB3;
    db $EB                                                               ;B4DAB7;
    dw $20D2,$81EE                                                       ;B4DAB8;
    db $EB                                                               ;B4DABC;
    dw $20D0,$8002                                                       ;B4DABD;
    db $FB                                                               ;B4DAC1;
    dw $20D8,$8001                                                       ;B4DAC2;
    db $01                                                               ;B4DAC6;
    dw $20DA,$81FF                                                       ;B4DAC7;
    db $08                                                               ;B4DACB;
    dw $20DC,$01FE                                                       ;B4DACC;
    db $10                                                               ;B4DAD0;
    dw $20F6,$01FE                                                       ;B4DAD1;
    db $08                                                               ;B4DAD5;
    dw $20F5                                                             ;B4DAD6;

UNUSED_SpriteObjectSpritemaps_3A_7_B4DAD8:
    dw $000F,$01FE                                                       ;B4DAD8;
    db $04                                                               ;B4DADC;
    dw $20F3,$01F6                                                       ;B4DADD;
    db $04                                                               ;B4DAE1;
    dw $20F2,$01FC                                                       ;B4DAE2;
    db $01                                                               ;B4DAE6;
    dw $20F1,$01F4                                                       ;B4DAE7;
    db $01                                                               ;B4DAEB;
    dw $20F0,$01FA                                                       ;B4DAEC;
    db $FC                                                               ;B4DAF0;
    dw $20F3,$01F2                                                       ;B4DAF1;
    db $FC                                                               ;B4DAF5;
    dw $20F2,$81FE                                                       ;B4DAF6;
    db $FB                                                               ;B4DAFA;
    dw $20D6,$81EE                                                       ;B4DAFB;
    db $FB                                                               ;B4DAFF;
    dw $20D4,$81FE                                                       ;B4DB00;
    db $EB                                                               ;B4DB04;
    dw $20D2,$81EE                                                       ;B4DB05;
    db $EB                                                               ;B4DB09;
    dw $20D0,$8002                                                       ;B4DB0A;
    db $FB                                                               ;B4DB0E;
    dw $20D8,$8001                                                       ;B4DB0F;
    db $01                                                               ;B4DB13;
    dw $20DA,$81FF                                                       ;B4DB14;
    db $07                                                               ;B4DB18;
    dw $20DC,$01FE                                                       ;B4DB19;
    db $0F                                                               ;B4DB1D;
    dw $20F6,$01FE                                                       ;B4DB1E;
    db $07                                                               ;B4DB22;
    dw $20F5                                                             ;B4DB23;

UNUSED_SpriteObjectSpritemaps_B4FB25:
    dw $0004,$0000                                                       ;B4DB25;
    db $00                                                               ;B4DB29;
    dw $A0F8,$01F8                                                       ;B4DB2A;
    db $00                                                               ;B4DB2E;
    dw $A0F7,$0000                                                       ;B4DB2F;
    db $F8                                                               ;B4DB33;
    dw $20F8,$01F8                                                       ;B4DB34;
    db $F8                                                               ;B4DB38;
    dw $20F7                                                             ;B4DB39;

UNUSED_SpriteObjectSpritemaps_B4FB3B:
    dw $0001,$81F8                                                       ;B4DB3B;
    db $F8                                                               ;B4DB3F;
    dw $20DE                                                             ;B4DB40;

SpriteObjectSpritemaps_3B_EvirFacingLeft_0:
    dw $000C,$0000                                                       ;B4DB42;
    db $02                                                               ;B4DB46;
    dw $20F3,$01F8                                                       ;B4DB47;
    db $02                                                               ;B4DB4B;
    dw $20F2,$01FC                                                       ;B4DB4C;
    db $FC                                                               ;B4DB50;
    dw $20F1,$01F4                                                       ;B4DB51;
    db $FC                                                               ;B4DB55;
    dw $20F0,$8000                                                       ;B4DB56;
    db $FC                                                               ;B4DB5A;
    dw $20D6,$81F0                                                       ;B4DB5B;
    db $FC                                                               ;B4DB5F;
    dw $20D4,$8000                                                       ;B4DB60;
    db $EC                                                               ;B4DB64;
    dw $20D2,$81F0                                                       ;B4DB65;
    db $EC                                                               ;B4DB69;
    dw $20D0,$8004                                                       ;B4DB6A;
    db $FB                                                               ;B4DB6E;
    dw $20D8,$8002                                                       ;B4DB6F;
    db $02                                                               ;B4DB73;
    dw $20DC,$0000                                                       ;B4DB74;
    db $0F                                                               ;B4DB78;
    dw $20F6,$0000                                                       ;B4DB79;
    db $07                                                               ;B4DB7D;
    dw $20F5                                                             ;B4DB7E;

SpriteObjectSpritemaps_3B_EvirFacingLeft_1:
    dw $000C,$01F8                                                       ;B4DB80;
    db $F4                                                               ;B4DB84;
    dw $20FC,$0000                                                       ;B4DB85;
    db $02                                                               ;B4DB89;
    dw $20F4,$01FC                                                       ;B4DB8A;
    db $FC                                                               ;B4DB8E;
    dw $20F3,$01F4                                                       ;B4DB8F;
    db $FC                                                               ;B4DB93;
    dw $20F2,$8000                                                       ;B4DB94;
    db $FC                                                               ;B4DB98;
    dw $20D6,$81F0                                                       ;B4DB99;
    db $FC                                                               ;B4DB9D;
    dw $20D4,$8000                                                       ;B4DB9E;
    db $EC                                                               ;B4DBA2;
    dw $20D2,$81F0                                                       ;B4DBA3;
    db $EC                                                               ;B4DBA7;
    dw $20D0,$8004                                                       ;B4DBA8;
    db $FC                                                               ;B4DBAC;
    dw $20D8,$8002                                                       ;B4DBAD;
    db $03                                                               ;B4DBB1;
    dw $20DC,$0000                                                       ;B4DBB2;
    db $0E                                                               ;B4DBB6;
    dw $20F6,$0000                                                       ;B4DBB7;
    db $06                                                               ;B4DBBB;
    dw $20F5                                                             ;B4DBBC;

SpriteObjectSpritemaps_3B_EvirFacingLeft_2:
    dw $000C,$01F8                                                       ;B4DBBE;
    db $F4                                                               ;B4DBC2;
    dw $20FB,$0000                                                       ;B4DBC3;
    db $02                                                               ;B4DBC7;
    dw $20F3,$01F8                                                       ;B4DBC8;
    db $02                                                               ;B4DBCC;
    dw $20F2,$01FA                                                       ;B4DBCD;
    db $FC                                                               ;B4DBD1;
    dw $20F4,$8000                                                       ;B4DBD2;
    db $FC                                                               ;B4DBD6;
    dw $20D6,$81F0                                                       ;B4DBD7;
    db $FC                                                               ;B4DBDB;
    dw $20D4,$8000                                                       ;B4DBDC;
    db $EC                                                               ;B4DBE0;
    dw $20D2,$81F0                                                       ;B4DBE1;
    db $EC                                                               ;B4DBE5;
    dw $20D0,$8004                                                       ;B4DBE6;
    db $FD                                                               ;B4DBEA;
    dw $20D8,$8002                                                       ;B4DBEB;
    db $03                                                               ;B4DBEF;
    dw $20DC,$0000                                                       ;B4DBF0;
    db $0D                                                               ;B4DBF4;
    dw $20F6,$0000                                                       ;B4DBF5;
    db $05                                                               ;B4DBF9;
    dw $20F5                                                             ;B4DBFA;

SpriteObjectSpritemaps_3B_EvirFacingLeft_3:
    dw $000D,$01FC                                                       ;B4DBFC;
    db $FC                                                               ;B4DC00;
    dw $20F3,$01F4                                                       ;B4DC01;
    db $FC                                                               ;B4DC05;
    dw $20F2,$01F0                                                       ;B4DC06;
    db $FC                                                               ;B4DC0A;
    dw $20F9,$0000                                                       ;B4DC0B;
    db $02                                                               ;B4DC0F;
    dw $20F1,$01F8                                                       ;B4DC10;
    db $02                                                               ;B4DC14;
    dw $20F0,$8000                                                       ;B4DC15;
    db $FC                                                               ;B4DC19;
    dw $20D6,$81F0                                                       ;B4DC1A;
    db $FC                                                               ;B4DC1E;
    dw $20D4,$8000                                                       ;B4DC1F;
    db $EC                                                               ;B4DC23;
    dw $20D2,$81F0                                                       ;B4DC24;
    db $EC                                                               ;B4DC28;
    dw $20D0,$8004                                                       ;B4DC29;
    db $FD                                                               ;B4DC2D;
    dw $20D8,$8002                                                       ;B4DC2E;
    db $04                                                               ;B4DC32;
    dw $20DC,$0000                                                       ;B4DC33;
    db $0E                                                               ;B4DC37;
    dw $20F6,$0000                                                       ;B4DC38;
    db $06                                                               ;B4DC3C;
    dw $20F5                                                             ;B4DC3D;

SpriteObjectSpritemaps_3C_EvirFacingRight_0:
    dw $000C,$01F8                                                       ;B4DC3F;
    db $02                                                               ;B4DC43;
    dw $60F3,$0000                                                       ;B4DC44;
    db $02                                                               ;B4DC48;
    dw $60F2,$01FC                                                       ;B4DC49;
    db $FC                                                               ;B4DC4D;
    dw $60F1,$0004                                                       ;B4DC4E;
    db $FC                                                               ;B4DC52;
    dw $60F0,$81F0                                                       ;B4DC53;
    db $FC                                                               ;B4DC57;
    dw $60D6,$8000                                                       ;B4DC58;
    db $FC                                                               ;B4DC5C;
    dw $60D4,$81F0                                                       ;B4DC5D;
    db $EC                                                               ;B4DC61;
    dw $60D2,$8000                                                       ;B4DC62;
    db $EC                                                               ;B4DC66;
    dw $60D0,$81EC                                                       ;B4DC67;
    db $FB                                                               ;B4DC6B;
    dw $60D8,$81EE                                                       ;B4DC6C;
    db $02                                                               ;B4DC70;
    dw $60DC,$01F8                                                       ;B4DC71;
    db $0F                                                               ;B4DC75;
    dw $60F6,$01F8                                                       ;B4DC76;
    db $07                                                               ;B4DC7A;
    dw $60F5                                                             ;B4DC7B;

SpriteObjectSpritemaps_3C_EvirFacingRight_1:
    dw $000C,$0000                                                       ;B4DC7D;
    db $F4                                                               ;B4DC81;
    dw $60FC,$01F8                                                       ;B4DC82;
    db $02                                                               ;B4DC86;
    dw $60F4,$01FC                                                       ;B4DC87;
    db $FC                                                               ;B4DC8B;
    dw $60F3,$0004                                                       ;B4DC8C;
    db $FC                                                               ;B4DC90;
    dw $60F2,$81F0                                                       ;B4DC91;
    db $FC                                                               ;B4DC95;
    dw $60D6,$8000                                                       ;B4DC96;
    db $FC                                                               ;B4DC9A;
    dw $60D4,$81F0                                                       ;B4DC9B;
    db $EC                                                               ;B4DC9F;
    dw $60D2,$8000                                                       ;B4DCA0;
    db $EC                                                               ;B4DCA4;
    dw $60D0,$81EC                                                       ;B4DCA5;
    db $FC                                                               ;B4DCA9;
    dw $60D8,$81EE                                                       ;B4DCAA;
    db $03                                                               ;B4DCAE;
    dw $60DC,$01F8                                                       ;B4DCAF;
    db $0E                                                               ;B4DCB3;
    dw $60F6,$01F8                                                       ;B4DCB4;
    db $06                                                               ;B4DCB8;
    dw $60F5                                                             ;B4DCB9;

SpriteObjectSpritemaps_3C_EvirFacingRight_2:
    dw $000C,$0000                                                       ;B4DCBB;
    db $F4                                                               ;B4DCBF;
    dw $60FB,$01F8                                                       ;B4DCC0;
    db $02                                                               ;B4DCC4;
    dw $60F3,$0000                                                       ;B4DCC5;
    db $02                                                               ;B4DCC9;
    dw $60F2,$01FE                                                       ;B4DCCA;
    db $FC                                                               ;B4DCCE;
    dw $60F4,$81F0                                                       ;B4DCCF;
    db $FC                                                               ;B4DCD3;
    dw $60D6,$8000                                                       ;B4DCD4;
    db $FC                                                               ;B4DCD8;
    dw $60D4,$81F0                                                       ;B4DCD9;
    db $EC                                                               ;B4DCDD;
    dw $60D2,$8000                                                       ;B4DCDE;
    db $EC                                                               ;B4DCE2;
    dw $60D0,$81EC                                                       ;B4DCE3;
    db $FD                                                               ;B4DCE7;
    dw $60D8,$81EE                                                       ;B4DCE8;
    db $03                                                               ;B4DCEC;
    dw $60DC,$01F8                                                       ;B4DCED;
    db $0D                                                               ;B4DCF1;
    dw $60F6,$01F8                                                       ;B4DCF2;
    db $05                                                               ;B4DCF6;
    dw $60F5                                                             ;B4DCF7;

SpriteObjectSpritemaps_3C_EvirFacingRight_3:
    dw $000D,$01FC                                                       ;B4DCF9;
    db $FC                                                               ;B4DCFD;
    dw $60F3,$0004                                                       ;B4DCFE;
    db $FC                                                               ;B4DD02;
    dw $60F2,$0008                                                       ;B4DD03;
    db $FC                                                               ;B4DD07;
    dw $60F9,$01F8                                                       ;B4DD08;
    db $02                                                               ;B4DD0C;
    dw $60F1,$0000                                                       ;B4DD0D;
    db $02                                                               ;B4DD11;
    dw $60F0,$81F0                                                       ;B4DD12;
    db $FC                                                               ;B4DD16;
    dw $60D6,$8000                                                       ;B4DD17;
    db $FC                                                               ;B4DD1B;
    dw $60D4,$81F0                                                       ;B4DD1C;
    db $EC                                                               ;B4DD20;
    dw $60D2,$8000                                                       ;B4DD21;
    db $EC                                                               ;B4DD25;
    dw $60D0,$81EC                                                       ;B4DD26;
    db $FD                                                               ;B4DD2A;
    dw $60D8,$81EE                                                       ;B4DD2B;
    db $04                                                               ;B4DD2F;
    dw $60DC,$01F8                                                       ;B4DD30;
    db $0E                                                               ;B4DD34;
    dw $60F6,$01F8                                                       ;B4DD35;
    db $06                                                               ;B4DD39;
    dw $60F5                                                             ;B4DD3A;

UNUSED_SpriteObjectSpritemaps_B4DD3C:
    dw $0001,$81F8                                                       ;B4DD3C;
    db $F8                                                               ;B4DD40;
    dw $3BCA                                                             ;B4DD41;

UNUSED_SpriteObjectSpritemaps_B4DD43:
    dw $0001,$81F8                                                       ;B4DD43;
    db $F8                                                               ;B4DD47;
    dw $3BCC                                                             ;B4DD48;

UNUSED_SpriteObjectSpritemaps_B4DD4A:
    dw $0001,$81F8                                                       ;B4DD4A;
    db $F8                                                               ;B4DD4E;
    dw $3BCE                                                             ;B4DD4F;

SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_0:
    dw $0001,$81F8                                                       ;B4DD51;
    db $F8                                                               ;B4DD55;
    dw $35E0                                                             ;B4DD56;

SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_1:
    dw $0001,$81F8                                                       ;B4DD58;
    db $F4                                                               ;B4DD5C;
    dw $35E2                                                             ;B4DD5D;

SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_2:
    dw $0001,$81F8                                                       ;B4DD5F;
    db $F0                                                               ;B4DD63;
    dw $35E4                                                             ;B4DD64;

SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_3:
    dw $0001,$81F8                                                       ;B4DD66;
    db $EC                                                               ;B4DD6A;
    dw $35E6                                                             ;B4DD6B;

SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_4:
    dw $0001,$81F8                                                       ;B4DD6D;
    db $E8                                                               ;B4DD71;
    dw $35E8                                                             ;B4DD72;

SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_5:
    dw $0001,$81F8                                                       ;B4DD74;
    db $E4                                                               ;B4DD78;
    dw $35EA                                                             ;B4DD79;

SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_6:
    dw $0001,$81F8                                                       ;B4DD7B;
    db $E0                                                               ;B4DD7F;
    dw $35EC                                                             ;B4DD80;

SpriteObjectSpritemaps_3D_DraygonFoamingAtTheMouth_7:
    dw $0001,$81F8                                                       ;B4DD82;
    db $DC                                                               ;B4DD86;
    dw $35EE                                                             ;B4DD87;

EnemyName_NoData:
    db "NODATA    "                                                      ;B4DD89;
    dw DebugEnemyPopulationData_NoName                                   ;B4DD93;
    dw $0000                                                             ;B4DD95;

EnemyName_Atomic:
    db "ATOMIC    "                                                      ;B4DD97;
    dw DebugEnemyPopulationData_Atomic                                   ;B4DDA1;
    dw $0001                                                             ;B4DDA3;

EnemyName_Bang:
    db "BANG      "                                                      ;B4DDA5;
    dw DebugEnemyPopulationData_Bang                                     ;B4DDAF;
    dw $0002                                                             ;B4DDB1;

EnemyName_PirateGreyWall:
    db "BATTA1    "                                                      ;B4DDB3;
    dw DebugEnemyPopulationData_PirateGreyWall                           ;B4DDBD;
    dw $0003                                                             ;B4DDBF;

EnemyName_PirateGreyNinja:
    db "BATTA2    "                                                      ;B4DDC1;
    dw DebugEnemyPopulationData_PirateGreyNinja                          ;B4DDCB;
    dw $0004                                                             ;B4DDCD;

EnemyName_PirateGreyWalking:
    db "BATTA3    "                                                      ;B4DDCF;
    dw DebugEnemyPopulationData_PirateGreyWalking                        ;B4DDD9;
    dw $0005                                                             ;B4DDDB;

EnemyName_Botwoon:
    db "BOTOON    "                                                      ;B4DDDD;
    dw DebugEnemyPopulationData_Botwoon                                  ;B4DDE7;
    dw $0006                                                             ;B4DDE9;

EnemyName_Boyon:
    db "BOYON     "                                                      ;B4DDEB;
    dw DebugEnemyPopulationData_Boyon                                    ;B4DDF5;
    dw $0007                                                             ;B4DDF7;

EnemyName_DessgeegaLarge:
    db "DESSGEEGA "                                                      ;B4DDF9;
    dw DebugEnemyPopulationData_DessgeegaLarge                           ;B4DE03;
    dw $0008                                                             ;B4DE05;

EnemyName_GoldenTorizo:
    db "DORI      "                                                      ;B4DE07;
    dw DebugEnemyPopulationData_Shaktool                                 ;B4DE11;
    dw $0009                                                             ;B4DE13;

EnemyName_Dragon:
    db "DRAGON    "                                                      ;B4DE15;
    dw DebugEnemyPopulationData_Dragon                                   ;B4DE1F;
    dw $000A                                                             ;B4DE21;

EnemyName_Evir:
    db "EBI       "                                                      ;B4DE23;
    dw DebugEnemyPopulationData_Evir                                     ;B4DE2D;
    dw $000B                                                             ;B4DE2F;

EnemyName_Eye:
    db "EYE       "                                                      ;B4DE31;
    dw DebugEnemyPopulationData_Eye                                      ;B4DE3B;
    dw $000C                                                             ;B4DE3D;

EnemyName_Namihe:
    db "NAMI      "                                                      ;B4DE3F;
    dw DebugEnemyPopulationData_Namihe                                   ;B4DE49;
    dw $000D                                                             ;B4DE4B;

EnemyName_Skultera:
    db "FISH      "                                                      ;B4DE4D;
    dw DebugEnemyPopulationData_Skultera                                 ;B4DE57;
    dw $000E                                                             ;B4DE59;

EnemyName_Coven:
    db "GAI       "                                                      ;B4DE5B;
    dw DebugEnemyPopulationData_Coven                                    ;B4DE65;
    dw $000F                                                             ;B4DE67;

EnemyName_Gamet:
    db "GAMET     "                                                      ;B4DE69;
    dw DebugEnemyPopulationData_Gamet                                    ;B4DE73;
    dw $0010                                                             ;B4DE75;

EnemyName_Geega:
    db "GEEGA     "                                                      ;B4DE77;
    dw DebugEnemyPopulationData_Geega                                    ;B4DE81;
    dw $0011                                                             ;B4DE83;

EnemyName_Geruta:
    db "GERUDA    "                                                      ;B4DE85;
    dw DebugEnemyPopulationData_Geruta                                   ;B4DE8F;
    dw $0012                                                             ;B4DE91;

EnemyName_UnknownGRAVY_B4DE93:
    db "GRAVY     "                                                      ;B4DE93;
    dw UNUSED_DebugEnemyPopulationData_GRAVY_B4E55C                      ;B4DE9D;
    dw $0013                                                             ;B4DE9F;

EnemyName_KihunterGreen:
    db "HACHI1    "                                                      ;B4DEA1;
    dw DebugEnemyPopulationData_KihunterGreen                            ;B4DEAB;
    dw $0014                                                             ;B4DEAD;

EnemyName_YappingMaw:
    db "HAND      "                                                      ;B4DEAF;
    dw DebugEnemyPopulationData_YappingMaw                               ;B4DEB9;
    dw $0015                                                             ;B4DEBB;

EnemyName_Hibashi:
    db "HIBASHI   "                                                      ;B4DEBD;
    dw DebugEnemyPopulationData_Hibashi                                  ;B4DEC7;
    dw $0016                                                             ;B4DEC9;

EnemyName_Choot:
    db "HIRU      "                                                      ;B4DECB;
    dw DebugEnemyPopulationData_Choot                                    ;B4DED5;
    dw $0017                                                             ;B4DED7;

EnemyName_Holtz:
    db "HOLTZ     "                                                      ;B4DED9;
    dw DebugEnemyPopulationData_Holtz                                    ;B4DEE3;
    dw $0018                                                             ;B4DEE5;

EnemyName_Fireflea:
    db "HOTARY    "                                                      ;B4DEE7;
    dw DebugEnemyPopulationData_Fireflea                                 ;B4DEF1;
    dw $0019                                                             ;B4DEF3;

EnemyName_HZoomer:
    db "HZOOMER   "                                                      ;B4DEF5;
    dw DebugEnemyPopulationData_HZoomer                                  ;B4DEFF;
    dw $001A                                                             ;B4DF01;

EnemyName_Kago:
    db "KAGO      "                                                      ;B4DF03;
    dw DebugEnemyPopulationData_Kago                                     ;B4DF0D;
    dw $001B                                                             ;B4DF0F;

EnemyName_MamaTurtle:
    db "KAME      "                                                      ;B4DF11;
    dw DebugEnemyPopulationData_MamaTurtle                               ;B4DF1B;
    dw $001C                                                             ;B4DF1D;

EnemyName_Tripper:
    db "KAMER     "                                                      ;B4DF1F;
    dw DebugEnemyPopulationData_Tripper_Kamer2                           ;B4DF29;
    dw $001D                                                             ;B4DF2B;

EnemyName_Sciser:
    db "KANI      "                                                      ;B4DF2D;
    dw DebugEnemyPopulationData_Sciser                                   ;B4DF37;
    dw $001E                                                             ;B4DF39;

EnemyName_FaceBlock:
    db "KOMA      "                                                      ;B4DF3B;
    dw DebugEnemyPopulationData_FaceBlock                                ;B4DF45;
    dw $001F                                                             ;B4DF47;

EnemyName_KzanTop:
    db "KZAN      "                                                      ;B4DF49;
    dw DebugEnemyPopulationData_KzanTop                                  ;B4DF53;
    dw $0020                                                             ;B4DF55;

EnemyName_Magdollite:
    db "LAVAMAN   "                                                      ;B4DF57;
    dw DebugEnemyPopulationData_Magdollite                               ;B4DF61;
    dw $0021                                                             ;B4DF63;

EnemyName_Mella:
    db "MELLA     "                                                      ;B4DF65;
    dw DebugEnemyPopulationData_Mella                                    ;B4DF6F;
    dw $0022                                                             ;B4DF71;

EnemyName_Menu:
    db "MEMU      "                                                      ;B4DF73;
    dw DebugEnemyPopulationData_Menu                                     ;B4DF7D;
    dw $0023                                                             ;B4DF7F;

EnemyName_Mellow:
    db "MERO      "                                                      ;B4DF81;
    dw DebugEnemyPopulationData_Mellow                                   ;B4DF8B;
    dw $0024                                                             ;B4DF8D;

EnemyName_Metaree:
    db "METALEE   "                                                      ;B4DF8F;
    dw DebugEnemyPopulationData_Metaree                                  ;B4DF99;
    dw $0025                                                             ;B4DF9B;

EnemyName_Mochtroid:
    db "METMOD    "                                                      ;B4DF9D;
    dw DebugEnemyPopulationData_Mochtroid                                ;B4DFA7;
    dw $0026                                                             ;B4DFA9;

EnemyName_Metroid:
    db "METROID   "                                                      ;B4DFAB;
    dw DebugEnemyPopulationData_Metroid                                  ;B4DFB5;
    dw $0027                                                             ;B4DFB7;

EnemyName_Multiviola:
    db "MULTI     "                                                      ;B4DFB9;
    dw DebugEnemyPopulationData_Multiviola                               ;B4DFC3;
    dw $0028                                                             ;B4DFC5;

EnemyName_MZoomer:
    db "MZOOMER   "                                                      ;B4DFC7;
    dw DebugEnemyPopulationData_MZoomer                                  ;B4DFD1;
    dw $0029                                                             ;B4DFD3;

EnemyName_Alcoon:
    db "NDRA      "                                                      ;B4DFD5;
    dw DebugEnemyPopulationData_Alcoon                                   ;B4DFDF;
    dw $002A                                                             ;B4DFE1;

EnemyName_Beetom:
    db "NOMI      "                                                      ;B4DFE3;
    dw DebugEnemyPopulationData_Beetom                                   ;B4DFED;
    dw $002B                                                             ;B4DFEF;

EnemyName_Sova:
    db "NOVA      "                                                      ;B4DFF1;
    dw DebugEnemyPopulationData_Sova                                     ;B4DFFB;
    dw $002C                                                             ;B4DFFD;

EnemyName_Oum:
    db "OUM       "                                                      ;B4DFFF;
    dw DebugEnemyPopulationData_Oum                                      ;B4E009;
    dw $002D                                                             ;B4E00B;

EnemyName_Zero:
    db "OUMU      "                                                      ;B4E00D;
    dw DebugEnemyPopulationData_Zero                                     ;B4E017;
    dw $002E                                                             ;B4E019;

EnemyName_Bull:
    db "PIPE      "                                                      ;B4E01B;
    dw DebugEnemyPopulationData_Bull                                     ;B4E025;
    dw $002F                                                             ;B4E027;

EnemyName_Polyp:
    db "POLYP     "                                                      ;B4E029;
    dw DebugEnemyPopulationData_Polyp                                    ;B4E033;
    dw $0030                                                             ;B4E035;

EnemyName_Puromi:
    db "PUROMI    "                                                      ;B4E037;
    dw DebugEnemyPopulationData_Puromi                                   ;B4E041;
    dw $0031                                                             ;B4E043;

EnemyName_Powamp:
    db "PUU       "                                                      ;B4E045;
    dw DebugEnemyPopulationData_Powamp                                   ;B4E04F;
    dw $0032                                                             ;B4E051;

EnemyName_Puyo:
    db "PUYO      "                                                      ;B4E053;
    dw DebugEnemyPopulationData_Puyo                                     ;B4E05D;
    dw $0033                                                             ;B4E05F;

EnemyName_Reflec:
    db "REFLEC    "                                                      ;B4E061;
    dw DebugEnemyPopulationData_Reflec                                   ;B4E06B;
    dw $0034                                                             ;B4E06D;

EnemyName_Rinka:
    db "RINKA     "                                                      ;B4E06F;
    dw DebugEnemyPopulationData_Rinka                                    ;B4E079;
    dw $0035                                                             ;B4E07B;

EnemyName_Rio:
    db "RIO       "                                                      ;B4E07D;
    dw DebugEnemyPopulationData_Rio                                      ;B4E087;
    dw $0036                                                             ;B4E089;

EnemyName_Ripper:
    db "RIPPER    "                                                      ;B4E08B;
    dw DebugEnemyPopulationData_Ripper                                   ;B4E095;
    dw $0037                                                             ;B4E097;

EnemyName_GRipper_Ripper2:
    db "RIPPER2   "                                                      ;B4E099;
    dw DebugEnemyPopulationData_GRipper_Ripper2                          ;B4E0A3;
    dw $0038                                                             ;B4E0A5;

EnemyName_Robot:
    db "ROBO      "                                                      ;B4E0A7;
    dw DebugEnemyPopulationData_Robot                                    ;B4E0B1;
    dw $0039                                                             ;B4E0B3;

EnemyName_Boulder:
    db "RSTONE    "                                                      ;B4E0B5;
    dw DebugEnemyPopulationData_Boulder                                  ;B4E0BF;
    dw $003A                                                             ;B4E0C1;

EnemyName_Cacatac:
    db "SABOTEN   "                                                      ;B4E0C3;
    dw DebugEnemyPopulationData_Cacatac                                  ;B4E0CD;
    dw $003B                                                             ;B4E0CF;

EnemyName_Sbug:
    db "SBUG      "                                                      ;B4E0D1;
    dw DebugEnemyPopulationData_Sbug_Sbug2                               ;B4E0DB;
    dw $003C                                                             ;B4E0DD;

EnemyName_MiniKraid:
    db "SCLAYD    "                                                      ;B4E0DF;
    dw DebugEnemyPopulationData_MiniKraid                                ;B4E0E9;
    dw $003D                                                             ;B4E0EB;

EnemyName_Dessgeega:
    db "SDEATH    "                                                      ;B4E0ED;
    dw DebugEnemyPopulationData_Dessgeega                                ;B4E0F7;
    dw $003E                                                             ;B4E0F9;

EnemyName_ShutterGrowing:
    db "SHUTTER   "                                                      ;B4E0FB;
    dw DebugEnemyPopulationData_ShutterGrowing                           ;B4E105;
    dw $003F                                                             ;B4E107;

EnemyName_Shutter2_Kamer:
    db "SHUTTER2  "                                                      ;B4E109;
    dw DebugEnemyPopulationData_Shutters_Kamer                           ;B4E113;
    dw $0040                                                             ;B4E115;

EnemyName_SidehopperLarge_SidehopperTourian:
    db "SIDE      "                                                      ;B4E117;
    dw DebugEnemyPopulationData_SidehopperLarge_SidehopperTourian        ;B4E121;
    dw $0041                                                             ;B4E123;

EnemyName_Skree:
    db "SKREE     "                                                      ;B4E125;
    dw DebugEnemyPopulationData_Skree                                    ;B4E12F;
    dw $0042                                                             ;B4E131;

EnemyName_Spark:
    db "SPA       "                                                      ;B4E133;
    dw DebugEnemyPopulationData_Spark                                    ;B4E13D;
    dw $0043                                                             ;B4E13F;

EnemyName_Squeept:
    db "SQUEEWPT  "                                                      ;B4E141;
    dw DebugEnemyPopulationData_Squeept                                  ;B4E14B;
    dw $0044                                                             ;B4E14D;

EnemyName_Sidehopper:
    db "SSIDE     "                                                      ;B4E14F;
    dw DebugEnemyPopulationData_Sidehopper                               ;B4E159;
    dw $0045                                                             ;B4E15B;

EnemyName_Stoke:
    db "STOKE     "                                                      ;B4E15D;
    dw DebugEnemyPopulationData_Stoke                                    ;B4E167;
    dw $0046                                                             ;B4E169;

EnemyName_Owtch:
    db "TOGE      "                                                      ;B4E16B;
    dw DebugEnemyPopulationData_Owtch                                    ;B4E175;
    dw $0047                                                             ;B4E177;

EnemyName_Viola:
    db "VIOLA     "                                                      ;B4E179;
    dw DebugEnemyPopulationData_Viola                                    ;B4E183;
    dw $0048                                                             ;B4E185;

EnemyName_Waver:
    db "WAVER     "                                                      ;B4E187;
    dw DebugEnemyPopulationData_Waver                                    ;B4E191;
    dw $0049                                                             ;B4E193;

EnemyName_Yard:
    db "YARD      "                                                      ;B4E195;
    dw DebugEnemyPopulationData_Yard                                     ;B4E19F;
    dw $004A                                                             ;B4E1A1;

EnemyName_Zeb:
    db "ZEB       "                                                      ;B4E1A3;
    dw DebugEnemyPopulationData_Zeb                                      ;B4E1AD;
    dw $004B                                                             ;B4E1AF;

EnemyName_Zebbo:
    db "ZEBBO     "                                                      ;B4E1B1;
    dw DebugEnemyPopulationData_Zebbo                                    ;B4E1BB;
    dw $004C                                                             ;B4E1BD;

EnemyName_Zeela:
    db "ZEELA     "                                                      ;B4E1BF;
    dw DebugEnemyPopulationData_Zeela                                    ;B4E1C9;
    dw $004D                                                             ;B4E1CB;

EnemyName_Zoa:
    db "ZOA       "                                                      ;B4E1CD;
    dw DebugEnemyPopulationData_Zoa                                      ;B4E1D7;
    dw $004E                                                             ;B4E1D9;

EnemyName_Zoomer:
    db "ZOOMER    "                                                      ;B4E1DB;
    dw DebugEnemyPopulationData_Zoomer                                   ;B4E1E5;
    dw $004F                                                             ;B4E1E7;

EnemyName_PirateGreenWall:
    db "BATTA1Br  "                                                      ;B4E1E9;
    dw DebugEnemyPopulationData_PirateGreenWall                          ;B4E1F3;
    dw $0050                                                             ;B4E1F5;

EnemyName_PirateRedWall:
    db "BATTA1No  "                                                      ;B4E1F7;
    dw DebugEnemyPopulationData_PirateRedWall                            ;B4E201;
    dw $0051                                                             ;B4E203;

EnemyName_PirateGoldWall:
    db "BATTA1Na  "                                                      ;B4E205;
    dw DebugEnemyPopulationData_PirateGoldWall                           ;B4E20F;
    dw $0052                                                             ;B4E211;

EnemyName_PirateMagentaWall:
    db "BATTA1Ma  "                                                      ;B4E213;
    dw DebugEnemyPopulationData_PirateMagentaWall                        ;B4E21D;
    dw $0053                                                             ;B4E21F;

EnemyName_PirateSilverWall:
    db "BATTA1Tu  "                                                      ;B4E221;
    dw DebugEnemyPopulationData_PirateSilverWall                         ;B4E22B;
    dw $0054                                                             ;B4E22D;

EnemyName_PirateGreenNinja:
    db "BATTA2Br  "                                                      ;B4E22F;
    dw DebugEnemyPopulationData_PirateGreenNinja                         ;B4E239;
    dw $0055                                                             ;B4E23B;

EnemyName_PirateRedNinja:
    db "BATTA2No  "                                                      ;B4E23D;
    dw DebugEnemyPopulationData_PirateRedNinja                           ;B4E247;
    dw $0056                                                             ;B4E249;

EnemyName_PirateGoldNinja:
    db "BATTA2Na  "                                                      ;B4E24B;
    dw DebugEnemyPopulationData_PirateGoldNinja                          ;B4E255;
    dw $0057                                                             ;B4E257;

EnemyName_PirateMagentaNinja:
    db "BATTA2Ma  "                                                      ;B4E259;
    dw DebugEnemyPopulationData_PirateMagentaNinja                       ;B4E263;
    dw $0058                                                             ;B4E265;

EnemyName_PirateSilverNinja:
    db "BATTA2Tu  "                                                      ;B4E267;
    dw DebugEnemyPopulationData_PirateSilverNinja                        ;B4E271;
    dw $0059                                                             ;B4E273;

EnemyName_PirateGreenWalking:
    db "BATTA3Br  "                                                      ;B4E275;
    dw DebugEnemyPopulationData_PirateGreenWalking                       ;B4E27F;
    dw $005A                                                             ;B4E281;

EnemyName_PirateRedWalking:
    db "BATTA3No  "                                                      ;B4E283;
    dw DebugEnemyPopulationData_PirateRedWalking                         ;B4E28D;
    dw $005B                                                             ;B4E28F;

EnemyName_PirateGoldWalking:
    db "BATTA3Na  "                                                      ;B4E291;
    dw DebugEnemyPopulationData_PirateGoldWalking                        ;B4E29B;
    dw $005C                                                             ;B4E29D;

EnemyName_PirateMagentaWalking:
    db "BATTA3Ma  "                                                      ;B4E29F;
    dw DebugEnemyPopulationData_PirateMagentaWalking                     ;B4E2A9;
    dw $005D                                                             ;B4E2AB;

EnemyName_PirateSilverWalking:
    db "BATTA3Tu  "                                                      ;B4E2AD;
    dw DebugEnemyPopulationData_PirateSilverWalking                      ;B4E2B7;
    dw $005E                                                             ;B4E2B9;

EnemyName_Fune:
    db "FUNE      "                                                      ;B4E2BB;
    dw DebugEnemyPopulationData_Fune                                     ;B4E2C5;
    dw $005F                                                             ;B4E2C7;

EnemyName_KihunterYellow:
    db "HACHI2    "                                                      ;B4E2C9;
    dw DebugEnemyPopulationData_KihunterYellow                           ;B4E2D3;
    dw $0060                                                             ;B4E2D5;

EnemyName_KihunterRed:
    db "HACHI3    "                                                      ;B4E2D7;
    dw DebugEnemyPopulationData_KihunterRed                              ;B4E2E1;
    dw $0061                                                             ;B4E2E3;

EnemyName_RobotNoPower:
    db "ROBO2     "                                                      ;B4E2E5;
    dw DebugEnemyPopulationData_RobotNoPower                             ;B4E2EF;
    dw $0062                                                             ;B4E2F1;

DebugEnemyPopulationData_NoName:
    dw $FFFF                                                             ;B4E2F3;
    db $00                                                               ;B4E2F5;

DebugEnemyPopulationData_Atomic:
    dw EnemyHeaders_Atomic                                               ;B4E2F6;
    dw $0100,$0100,$0000,$2000,$0000,$0001,$0001,$FFFF                   ;B4E2F8;
    db $01                                                               ;B4E308;

DebugEnemyPopulationData_Bang:
    dw EnemyHeaders_Bang                                                 ;B4E309;
    dw $0100,$0100,$0000,$2800,$0000,$BB2B,$0000                         ;B4E30B;
    dw EnemyHeaders_Bang                                                 ;B4E319;
    dw $0100,$0100,$0000,$2800,$0000,$BB66,$0101                         ;B4E31B;
    dw EnemyHeaders_Bang                                                 ;B4E329;
    dw $0100,$0100,$0000,$2800,$0000,$BB4A,$0000,$FFFF                   ;B4E32B;
    db $01                                                               ;B4E33B;

DebugEnemyPopulationData_PirateGreyWall:
    dw EnemyHeaders_PirateGreyWall                                       ;B4E33C;
    dw $002D,$01B8,$0000,$2000,$0004,$0000,$00A0,$FFFF                   ;B4E33E;
    db $01                                                               ;B4E34E;

DebugEnemyPopulationData_PirateGreyNinja:
    dw EnemyHeaders_PirateGreyNinja                                      ;B4E34F;
    dw $0270,$00A0,$0000,$2800,$0004,$0001,$0030,$FFFF                   ;B4E351;
    db $01                                                               ;B4E361;

DebugEnemyPopulationData_PirateGreyWalking:
    dw EnemyHeaders_PirateGreyWalking                                    ;B4E362;
    dw $00D9,$00A0,$0000,$2000,$0004,$0000,$0050,$FFFF                   ;B4E364;
    db $01                                                               ;B4E374;

DebugEnemyPopulationData_Botwoon:
    dw EnemyHeaders_Botwoon                                              ;B4E375;
    dw $0100,$0100,$0000,$2800,$0000,$0000,$0000,$FFFF                   ;B4E377;
    db $01                                                               ;B4E387;

DebugEnemyPopulationData_Boyon:
    dw EnemyHeaders_Boyon                                                ;B4E388;
    dw $00E8,$00A8,$0000,$2000,$0000,$0103,$0020,$FFFF                   ;B4E38A;
    db $00                                                               ;B4E39A;

DebugEnemyPopulationData_DessgeegaLarge:
    dw EnemyHeaders_DessgeegaLarge                                       ;B4E39B;
    dw $0100,$0100,$0000,$2000,$0000,$8000,$0000,$FFFF                   ;B4E39D;
    db $01                                                               ;B4E3AD;

DebugEnemyPopulationData_Shaktool:
    dw EnemyHeaders_Shaktool                                             ;B4E3AE;
    dw $0110,$035C,$0000,$2000,$0000,$8000,$0000                         ;B4E3B0;
    dw EnemyHeaders_Shaktool                                             ;B4E3BE;
    dw $0110,$035C,$0000,$2000,$0000,$8000,$0002                         ;B4E3C0;
    dw EnemyHeaders_Shaktool                                             ;B4E3CE;
    dw $0110,$035C,$0000,$2000,$0000,$8000,$0004                         ;B4E3D0;
    dw EnemyHeaders_Shaktool                                             ;B4E3DE;
    dw $0110,$035C,$0000,$2000,$0000,$8000,$0006                         ;B4E3E0;
    dw EnemyHeaders_Shaktool                                             ;B4E3EE;
    dw $0110,$035C,$0000,$2000,$0000,$8000,$0008                         ;B4E3F0;
    dw EnemyHeaders_Shaktool                                             ;B4E3FE;
    dw $0110,$035C,$0000,$2000,$0000,$8000,$000A                         ;B4E400;
    dw EnemyHeaders_Shaktool                                             ;B4E40E;
    dw $0110,$035C,$0000,$2000,$0000,$8000,$000C,$FFFF                   ;B4E410;
    db $01                                                               ;B4E420;

DebugEnemyPopulationData_Dragon:
    dw EnemyHeaders_Dragon                                               ;B4E421;
    dw $0100,$0100,$0000,$2000,$0000,$0000,$0000                         ;B4E423;
    dw EnemyHeaders_Dragon                                               ;B4E431;
    dw $0100,$0100,$0002,$2400,$0000,$0001,$0000,$FFFF                   ;B4E433;
    db $01                                                               ;B4E443;

DebugEnemyPopulationData_Evir:
    dw EnemyHeaders_Evir                                                 ;B4E444;
    dw $0100,$0100,$0000,$2000,$0000,$0000,$1010                         ;B4E446;
    dw EnemyHeaders_Evir                                                 ;B4E454;
    dw $0100,$0100,$0000,$2400,$0000,$0001,$0000                         ;B4E456;
    dw EnemyHeaders_EvirProjectile                                       ;B4E464;
    dw $0100,$0100,$0000,$2800,$0000,$0002,$0000,$FFFF                   ;B4E466;
    db $01                                                               ;B4E476;

DebugEnemyPopulationData_Eye:
    dw EnemyHeaders_Eye                                                  ;B4E477;
    dw $0228,$0048,$0000,$2C00,$0000,$0000,$8001                         ;B4E479;
    dw EnemyHeaders_Eye                                                  ;B4E487;
    dw $0228,$0048,$0000,$2C00,$0000,$0000,$0000,$FFFF                   ;B4E489;
    db $00                                                               ;B4E499;

DebugEnemyPopulationData_Namihe:
    dw EnemyHeaders_Namihe                                               ;B4E49A;
    dw $00F0,$04E0,$0000,$A000,$0000,$0111,$0F05,$FFFF                   ;B4E49C;
    db $01                                                               ;B4E4AC;

DebugEnemyPopulationData_Skultera:
    dw EnemyHeaders_Skultera                                             ;B4E4AD;
    dw $0090,$00A0,$0000,$2000,$0000,$0102,$0420,$FFFF                   ;B4E4AF;
    db $01                                                               ;B4E4BF;

DebugEnemyPopulationData_Coven:
    dw EnemyHeaders_Coven                                                ;B4E4C0;
    dw $0100,$0100,$0000,$6800,$0000,$0000,$0000,$FFFF                   ;B4E4C2;
    db $01                                                               ;B4E4D2;

DebugEnemyPopulationData_Gamet:
    dw EnemyHeaders_Gamet                                                ;B4E4D3;
    dw $0100,$00E0,$0000,$6800,$0000,$0000,$4030                         ;B4E4D5;
    dw EnemyHeaders_Gamet                                                ;B4E4E3;
    dw $0100,$00E0,$0000,$6800,$0000,$0000,$4000                         ;B4E4E5;
    dw EnemyHeaders_Gamet                                                ;B4E4F3;
    dw $0100,$00E0,$0000,$6800,$0000,$0000,$4000                         ;B4E4F5;
    dw EnemyHeaders_Gamet                                                ;B4E503;
    dw $0100,$00E0,$0000,$6800,$0000,$0000,$4000                         ;B4E505;
    dw EnemyHeaders_Gamet                                                ;B4E513;
    dw $0100,$00E0,$0000,$6800,$0000,$0000,$4000,$FFFF                   ;B4E515;
    db $01                                                               ;B4E525;

DebugEnemyPopulationData_Geega:
    dw EnemyHeaders_Geega                                                ;B4E526;
    dw $0100,$0100,$0000,$6100,$0000,$0001,$0010,$FFFF                   ;B4E528;
    db $01                                                               ;B4E538;

DebugEnemyPopulationData_Geruta:
    dw EnemyHeaders_Geruta                                               ;B4E539;
    dw $0048,$0080,$0000,$2000,$0000,$0000,$0000                         ;B4E53B;
    dw EnemyHeaders_Geruta                                               ;B4E549;
    dw $0048,$0080,$0005,$2400,$0000,$8000,$0000,$FFFF                   ;B4E54B;
    db $01                                                               ;B4E55B;

UNUSED_DebugEnemyPopulationData_GRAVY_B4E55C:
    dw $FFFF                                                             ;B4E55C;
    db $00                                                               ;B4E55E;

DebugEnemyPopulationData_KihunterGreen:
    dw EnemyHeaders_KihunterGreen                                        ;B4E55F;
    dw $0100,$0100,$0000,$2800,$0000,$0001,$0000                         ;B4E561;
    dw EnemyHeaders_KihunterGreenWings                                   ;B4E56F;
    dw $0100,$0100,$0000,$2C00,$0000,$0020,$0000,$FFFF                   ;B4E571;
    db $01                                                               ;B4E581;

DebugEnemyPopulationData_YappingMaw:
    dw EnemyHeaders_YappingMaw                                           ;B4E582;
    dw $0100,$0100,$0000,$2000,$0000,$0010,$0001,$FFFF                   ;B4E584;
    db $00                                                               ;B4E594;

DebugEnemyPopulationData_Hibashi:
    dw EnemyHeaders_Hibashi                                              ;B4E595;
    dw $0100,$0100,$0000,$2500,$0000,$0025,$0000                         ;B4E597;
    dw EnemyHeaders_Hibashi                                              ;B4E5A5;
    dw $0100,$0100,$0000,$2100,$0000,$0000,$0001,$FFFF                   ;B4E5A7;
    db $00                                                               ;B4E5B7;

DebugEnemyPopulationData_Choot:
    dw EnemyHeaders_Choot                                                ;B4E5B8;
    dw $0100,$0100,$0000,$2000,$0000,$0204,$0030,$FFFF                   ;B4E5BA;
    db $01                                                               ;B4E5CA;

DebugEnemyPopulationData_Holtz:
    dw EnemyHeaders_Holtz                                                ;B4E5CB;
    dw $0100,$0100,$0000,$2000,$0000,$0000,$0000                         ;B4E5CD;
    dw EnemyHeaders_Holtz                                                ;B4E5DB;
    dw $0100,$0100,$0006,$2400,$0000,$8000,$0000,$FFFF                   ;B4E5DD;
    db $01                                                               ;B4E5ED;

DebugEnemyPopulationData_Fireflea:
    dw EnemyHeaders_Fireflea                                             ;B4E5EE;
    dw $0600,$0060,$0000,$2000,$0000,$0001,$0108,$FFFF                   ;B4E5F0;
    db $01                                                               ;B4E600;

DebugEnemyPopulationData_HZoomer:
    dw EnemyHeaders_HZoomer                                              ;B4E601;
    dw $0360,$0098,$0003,$2001,$0000,$0002,$0000,$FFFF                   ;B4E603;
    db $01                                                               ;B4E613;

DebugEnemyPopulationData_Kago:
    dw EnemyHeaders_Kago                                                 ;B4E614;
    dw $0168,$0090,$0000,$A000,$0000,$0020,$0000,$FFFF                   ;B4E616;
    db $01                                                               ;B4E626;

DebugEnemyPopulationData_MamaTurtle:
    dw EnemyHeaders_MamaTurtle                                           ;B4E627;
    dw $0100,$0100,$0000,$A800,$0000,$0000,$0000                         ;B4E629;
    dw EnemyHeaders_BabyTurtle                                           ;B4E637;
    dw $00D8,$0100,$0000,$A800,$0000,$FFFF,$0000                         ;B4E639;
    dw EnemyHeaders_BabyTurtle                                           ;B4E647;
    dw $0100,$0100,$0000,$A800,$0000,$FFFF,$0000                         ;B4E649;
    dw EnemyHeaders_BabyTurtle                                           ;B4E657;
    dw $0110,$0100,$0000,$A800,$0000,$0001,$0000                         ;B4E659;
    dw EnemyHeaders_BabyTurtle                                           ;B4E667;
    dw $0140,$0100,$0000,$A800,$0000,$0001,$0000,$FFFF                   ;B4E669;
    db $01                                                               ;B4E679;

DebugEnemyPopulationData_Tripper_Kamer2:
    dw EnemyHeaders_Tripper                                              ;B4E67A;
    dw $0868,$00C8,$0000,$A000,$0000,$0000,$2020,$FFFF                   ;B4E67C;
    db $01                                                               ;B4E68C;

DebugEnemyPopulationData_Sciser:
    dw EnemyHeaders_Sciser                                               ;B4E68D;
    dw $01C0,$0098,$0003,$2000,$0000,$0001,$0000,$FFFF                   ;B4E68F;
    db $01                                                               ;B4E69F;

DebugEnemyPopulationData_FaceBlock:
    dw EnemyHeaders_FaceBlock                                            ;B4E6A0;
    dw $0100,$0100,$0000,$A000,$0000,$0025,$0000,$FFFF                   ;B4E6A2;
    db $00                                                               ;B4E6B2;

DebugEnemyPopulationData_KzanTop:
    dw EnemyHeaders_KzanTop                                              ;B4E6B3;
    dw $0480,$0400,$0000,$A000,$0000,$0030,$A070                         ;B4E6B5;
    dw EnemyHeaders_KzanBottom                                           ;B4E6C3;
    dw $0480,$0408,$0000,$0100,$0000,$0000,$0000,$FFFF                   ;B4E6C5;
    db $00                                                               ;B4E6D5;

DebugEnemyPopulationData_Magdollite:
    dw EnemyHeaders_Magdollite                                           ;B4E6D6;
    dw $0248,$00B0,$0000,$2800,$0000,$0000,$3A60                         ;B4E6D8;
    dw EnemyHeaders_Magdollite                                           ;B4E6E6;
    dw $0248,$00B0,$0000,$2C00,$0000,$0001,$0000                         ;B4E6E8;
    dw EnemyHeaders_Magdollite                                           ;B4E6F6;
    dw $0248,$00B0,$0000,$2C00,$0000,$0002,$0000,$FFFF                   ;B4E6F8;
    db $01                                                               ;B4E708;

DebugEnemyPopulationData_Mella:
    dw EnemyHeaders_Mella                                                ;B4E709;
    dw $0100,$0100,$0000,$2000,$0000,$0000,$0000,$FFFF                   ;B4E70B;
    db $00                                                               ;B4E71B;

DebugEnemyPopulationData_Menu:
    dw EnemyHeaders_Menu                                                 ;B4E71C;
    dw $0100,$0100,$0000,$2000,$0000,$0000,$0000,$FFFF                   ;B4E71E;
    db $00                                                               ;B4E72E;

DebugEnemyPopulationData_Mellow:
    dw EnemyHeaders_Mellow                                               ;B4E72F;
    dw $0100,$0100,$0000,$2000,$0000,$0000,$0000,$FFFF                   ;B4E731;
    db $00                                                               ;B4E741;

DebugEnemyPopulationData_Metaree:
    dw EnemyHeaders_Metaree                                              ;B4E742;
    dw $0100,$0100,$0000,$2000,$0000,$0000,$0000,$FFFF                   ;B4E744;
    db $01                                                               ;B4E754;

DebugEnemyPopulationData_Mochtroid:
    dw EnemyHeaders_Mochtroid                                            ;B4E755;
    dw $0100,$0100,$0000,$2000,$0000,$0000,$0000,$FFFF                   ;B4E757;
    db $01                                                               ;B4E767;

DebugEnemyPopulationData_Metroid:
    dw EnemyHeaders_Metroid                                              ;B4E768;
    dw $0100,$0100,$0000,$2000,$0000,$0000,$0005,$FFFF                   ;B4E76A;
    db $01                                                               ;B4E77A;

DebugEnemyPopulationData_Multiviola:
    dw EnemyHeaders_Multiviola                                           ;B4E77B;
    dw $0078,$0058,$0000,$2000,$0000,$0060,$0001,$FFFF                   ;B4E77D;
    db $00                                                               ;B4E78D;

DebugEnemyPopulationData_MZoomer:
    dw EnemyHeaders_MZoomer                                              ;B4E78E;
    dw $0188,$0198,$0003,$2800,$0000,$0001,$0000,$FFFF                   ;B4E790;
    db $01                                                               ;B4E7A0;

DebugEnemyPopulationData_Alcoon:
    dw EnemyHeaders_Alcoon                                               ;B4E7A1;
    dw $0100,$0100,$0000,$2800,$0000,$0000,$0000,$FFFF                   ;B4E7A3;
    db $01                                                               ;B4E7B3;

DebugEnemyPopulationData_Beetom:
    dw EnemyHeaders_Beetom                                               ;B4E7B4;
    dw $0100,$0100,$0000,$2000,$0000,$0000,$0000,$FFFF                   ;B4E7B6;
    db $01                                                               ;B4E7C6;

DebugEnemyPopulationData_Sova:
    dw EnemyHeaders_Sova                                                 ;B4E7C7;
    dw $0880,$02A8,$0003,$2000,$0000,$0001,$0004,$FFFF                   ;B4E7C9;
    db $01                                                               ;B4E7D9;

DebugEnemyPopulationData_Oum:
    dw EnemyHeaders_Oum                                                  ;B4E7DA;
    dw $0100,$0100,$0000,$A000,$0004,$0000,$0000,$FFFF                   ;B4E7DC;
    db $01                                                               ;B4E7EC;

DebugEnemyPopulationData_Zero:
    dw EnemyHeaders_Zero                                                 ;B4E7ED;
    dw $00A0,$0040,$0002,$2000,$0000,$0001,$0000,$FFFF                   ;B4E7EF;
    db $01                                                               ;B4E7FF;

DebugEnemyPopulationData_Bull:
    dw EnemyHeaders_Bull                                                 ;B4E800;
    dw $0200,$0060,$0000,$2800,$0000,$0008,$0000,$FFFF                   ;B4E802;
    db $01                                                               ;B4E812;

DebugEnemyPopulationData_Polyp:
    dw EnemyHeaders_LavaRocks                                            ;B4E813;
    dw $0100,$0100,$0000,$2500,$0000,$0000,$0000,$FFFF                   ;B4E815;
    db $01                                                               ;B4E825;

DebugEnemyPopulationData_Puromi:
    dw EnemyHeaders_Puromi                                               ;B4E826;
    dw $0100,$0100,$0000,$2000,$0000,$1010,$2001,$FFFF                   ;B4E828;
    db $00                                                               ;B4E838;

DebugEnemyPopulationData_Powamp:
    dw EnemyHeaders_Powamp                                               ;B4E839;
    dw $0100,$0100,$0000,$2C00,$0000,$0001,$0000                         ;B4E83B;
    dw EnemyHeaders_Powamp                                               ;B4E849;
    dw $0100,$0100,$0000,$2800,$0000,$0000,$0000,$FFFF                   ;B4E84B;
    db $01                                                               ;B4E85B;

DebugEnemyPopulationData_Puyo:
    dw EnemyHeaders_Puyo                                                 ;B4E85C;
    dw $033D,$00CC,$0000,$2000,$0000,$0003,$000A,$FFFF                   ;B4E85E;
    db $01                                                               ;B4E86E;

DebugEnemyPopulationData_Reflec:
    dw EnemyHeaders_Reflec                                               ;B4E86F;
    dw $0168,$0048,$0000,$2000,$0000,$0000,$0000,$FFFF                   ;B4E871;
    db $00                                                               ;B4E881;

DebugEnemyPopulationData_Rinka:
    dw EnemyHeaders_Rinka                                                ;B4E882;
    dw $0100,$0100,$0000,$6000,$0000,$0000,$0000,$FFFF                   ;B4E884;
    db $00                                                               ;B4E894;

DebugEnemyPopulationData_Rio:
    dw EnemyHeaders_Rio                                                  ;B4E895;
    dw $0100,$0100,$0000,$2000,$0000,$0000,$0000,$FFFF                   ;B4E897;
    db $01                                                               ;B4E8A7;

DebugEnemyPopulationData_Ripper:
    dw EnemyHeaders_Ripper                                               ;B4E8A8;
    dw $0068,$01A0,$0000,$2000,$0000,$0010,$0001,$FFFF                   ;B4E8AA;
    db $01                                                               ;B4E8BA;

DebugEnemyPopulationData_GRipper_Ripper2:
    dw EnemyHeaders_Ripper2                                              ;B4E8BB;
    dw $0040,$06A0,$0000,$2800,$0000,$0020,$0001,$FFFF                   ;B4E8BD;
    db $01                                                               ;B4E8CD;

DebugEnemyPopulationData_Robot:
    dw EnemyHeaders_Robot                                                ;B4E8CE;
    dw $0050,$00B0,$0000,$2800,$0000,$0001,$0000,$FFFF                   ;B4E8D0;
    db $01                                                               ;B4E8E0;

DebugEnemyPopulationData_Boulder:
    dw EnemyHeaders_Boulder                                              ;B4E8E1;
    dw $0400,$01B5,$0060,$2000,$0000,$0101,$20A0,$FFFF                   ;B4E8E3;
    db $00                                                               ;B4E8F3;

DebugEnemyPopulationData_Cacatac:
    dw EnemyHeaders_Cacatac                                              ;B4E8F4;
    dw $03D0,$00B3,$0000,$2000,$0000,$0100,$0F01,$FFFF                   ;B4E8F6;
    db $01                                                               ;B4E906;

DebugEnemyPopulationData_Sbug_Sbug2:
    dw EnemyHeaders_Sbug                                                 ;B4E907;
    dw $01AD,$04E8,$0000,$2400,$0000,$E804,$0020,$FFFF                   ;B4E909;
    db $00                                                               ;B4E919;

DebugEnemyPopulationData_MiniKraid:
    dw EnemyHeaders_MiniKraid                                            ;B4E91A;
    dw $0100,$0100,$0000,$2800,$0000,$0000,$0000,$FFFF                   ;B4E91C;
    db $01                                                               ;B4E92C;

DebugEnemyPopulationData_Dessgeega:
    dw EnemyHeaders_Dessgeega                                            ;B4E92D;
    dw $0100,$0100,$0000,$2000,$0000,$0001,$0000,$FFFF                   ;B4E92F;
    db $01                                                               ;B4E93F;

DebugEnemyPopulationData_ShutterGrowing:
    dw EnemyHeaders_ShutterGrowing                                       ;B4E940;
    dw $0300,$0088,$0000,$A800,$0000,$004C,$0008,$FFFF                   ;B4E942;
    db $00                                                               ;B4E952;

DebugEnemyPopulationData_Shutters_Kamer:
    dw EnemyHeaders_ShutterShootable                                     ;B4E953;
    dw $0100,$0100,$0020,$A800,$0A0A,$2003,$0000,$FFFF                   ;B4E955;
    db $00                                                               ;B4E965;

DebugEnemyPopulationData_SidehopperLarge_SidehopperTourian:
    dw EnemyHeaders_SidehopperLarge                                      ;B4E966;
    dw $0100,$0100,$0000,$2000,$0000,$0000,$0000,$FFFF                   ;B4E968;
    db $01                                                               ;B4E978;

DebugEnemyPopulationData_Skree:
    dw EnemyHeaders_Skree                                                ;B4E979;
    dw $0100,$0100,$0000,$2000,$0000,$0000,$0000,$FFFF                   ;B4E97B;
    db $01                                                               ;B4E98B;

DebugEnemyPopulationData_Spark:
    dw EnemyHeaders_Spark                                                ;B4E98C;
    dw $0100,$0100,$0000,$2000,$0000,$0000,$0000,$FFFF                   ;B4E98E;
    db $00                                                               ;B4E99E;

DebugEnemyPopulationData_Squeept:
    dw EnemyHeaders_Squeept                                              ;B4E99F;
    dw $0060,$00D8,$0000,$2000,$0000,$0000,$0000                         ;B4E9A1;
    dw EnemyHeaders_Squeept                                              ;B4E9AF;
    dw $0060,$00D8,$0002,$2400,$0000,$8000,$0000,$FFFF                   ;B4E9B1;
    db $01                                                               ;B4E9C1;

DebugEnemyPopulationData_Sidehopper:
    dw EnemyHeaders_Sidehopper                                           ;B4E9C2;
    dw $0100,$0100,$0000,$2000,$0000,$0001,$0000,$FFFF                   ;B4E9C4;
    db $01                                                               ;B4E9D4;

DebugEnemyPopulationData_Stoke:
    dw EnemyHeaders_Stoke                                                ;B4E9D5;
    dw $0C30,$01F8,$0000,$2000,$0000,$0000,$0001,$FFFF                   ;B4E9D7;
    db $01                                                               ;B4E9E7;

DebugEnemyPopulationData_Owtch:
    dw EnemyHeaders_Owtch                                                ;B4E9E8;
    dw $0060,$01C8,$0000,$2000,$0000,$0301,$0002,$FFFF                   ;B4E9EA;
    db $01                                                               ;B4E9FA;

DebugEnemyPopulationData_Viola:
    dw EnemyHeaders_Viola                                                ;B4E9FB;
    dw $00D8,$008A,$0003,$2001,$0000,$0002,$0006,$FFFF                   ;B4E9FD;
    db $01                                                               ;B4EA0D;

DebugEnemyPopulationData_Waver:
    dw EnemyHeaders_Waver                                                ;B4EA0E;
    dw $00C9,$005C,$0000,$2000,$0000,$0001,$0000,$FFFF                   ;B4EA10;
    db $01                                                               ;B4EA20;

DebugEnemyPopulationData_Yard:
    dw EnemyHeaders_Yard                                                 ;B4EA21;
    dw $01D0,$0098,$0003,$A004,$0000,$0001,$0000,$FFFF                   ;B4EA23;
    db $01                                                               ;B4EA33;

DebugEnemyPopulationData_Zeb:
    dw EnemyHeaders_Zeb                                                  ;B4EA34;
    dw $0100,$0100,$0000,$6900,$0000,$0000,$0000,$FFFF                   ;B4EA36;
    db $01                                                               ;B4EA46;

DebugEnemyPopulationData_Zebbo:
    dw EnemyHeaders_Zebbo                                                ;B4EA47;
    dw $0100,$0100,$0000,$6900,$0000,$0002,$0000,$FFFF                   ;B4EA49;
    db $01                                                               ;B4EA59;

DebugEnemyPopulationData_Zeela:
    dw EnemyHeaders_Zeela                                                ;B4EA5A;
    dw $0180,$008C,$0003,$2000,$0000,$0002,$0002,$FFFF                   ;B4EA5C;
    db $01                                                               ;B4EA6C;

DebugEnemyPopulationData_Zoa:
    dw EnemyHeaders_Zoa                                                  ;B4EA6D;
    dw $0100,$0100,$0000,$6100,$0000,$0000,$0000,$FFFF                   ;B4EA6F;
    db $01                                                               ;B4EA7F;

DebugEnemyPopulationData_Zoomer:
    dw EnemyHeaders_Zoomer                                               ;B4EA80;
    dw $00D8,$00C8,$0003,$2000,$0000,$0002,$0000,$FFFF                   ;B4EA82;
    db $01                                                               ;B4EA92;

DebugEnemyPopulationData_PirateGreenWall:
    dw EnemyHeaders_PirateGreenWall                                      ;B4EA93;
    dw $0100,$0100,$0000,$2000,$0004,$0001,$0030,$FFFF                   ;B4EA95;
    db $01                                                               ;B4EAA5;

DebugEnemyPopulationData_PirateRedWall:
    dw EnemyHeaders_PirateRedWall                                        ;B4EAA6;
    dw $0100,$0100,$0000,$2000,$0004,$0001,$0030,$FFFF                   ;B4EAA8;
    db $01                                                               ;B4EAB8;

DebugEnemyPopulationData_PirateGoldWall:
    dw EnemyHeaders_PirateGoldWall                                       ;B4EAB9;
    dw $0100,$0100,$0000,$2000,$0004,$0001,$0030,$FFFF                   ;B4EABB;
    db $01                                                               ;B4EACB;

DebugEnemyPopulationData_PirateMagentaWall:
    dw EnemyHeaders_PirateMagentaWall                                    ;B4EACC;
    dw $0100,$0100,$0000,$2000,$0004,$0001,$0030,$FFFF                   ;B4EACE;
    db $01                                                               ;B4EADE;

DebugEnemyPopulationData_PirateSilverWall:
    dw EnemyHeaders_PirateSilverWall                                     ;B4EADF;
    dw $0100,$0100,$0000,$2000,$0004,$0001,$0030,$FFFF                   ;B4EAE1;
    db $01                                                               ;B4EAF1;

DebugEnemyPopulationData_PirateGreenNinja:
    dw EnemyHeaders_PirateGreenNinja                                     ;B4EAF2;
    dw $0100,$0100,$0000,$2800,$0004,$0001,$0030,$FFFF                   ;B4EAF4;
    db $01                                                               ;B4EB04;

DebugEnemyPopulationData_PirateRedNinja:
    dw EnemyHeaders_PirateRedNinja                                       ;B4EB05;
    dw $0100,$0100,$0000,$2800,$0004,$0001,$0030,$FFFF                   ;B4EB07;
    db $01                                                               ;B4EB17;

DebugEnemyPopulationData_PirateGoldNinja:
    dw EnemyHeaders_PirateGoldNinja                                      ;B4EB18;
    dw $0100,$0100,$0000,$2800,$0004,$0001,$0030,$FFFF                   ;B4EB1A;
    db $01                                                               ;B4EB2A;

DebugEnemyPopulationData_PirateMagentaNinja:
    dw EnemyHeaders_PirateMagentaNinja                                   ;B4EB2B;
    dw $0100,$0100,$0000,$2800,$0004,$0001,$0030,$FFFF                   ;B4EB2D;
    db $01                                                               ;B4EB3D;

DebugEnemyPopulationData_PirateSilverNinja:
    dw EnemyHeaders_PirateSilverNinja                                    ;B4EB3E;
    dw $0100,$0100,$0000,$2800,$0004,$0001,$0030,$FFFF                   ;B4EB40;
    db $01                                                               ;B4EB50;

DebugEnemyPopulationData_PirateGreenWalking:
    dw EnemyHeaders_PirateGreenWalking                                   ;B4EB51;
    dw $0100,$0100,$0000,$2000,$0004,$0001,$0030,$FFFF                   ;B4EB53;
    db $01                                                               ;B4EB63;

DebugEnemyPopulationData_PirateRedWalking:
    dw EnemyHeaders_PirateRedWalking                                     ;B4EB64;
    dw $0100,$0100,$0000,$2000,$0004,$0001,$0030,$FFFF                   ;B4EB66;
    db $01                                                               ;B4EB76;

DebugEnemyPopulationData_PirateGoldWalking:
    dw EnemyHeaders_PirateGoldWalking                                    ;B4EB77;
    dw $0100,$0100,$0000,$2000,$0004,$0001,$0030,$FFFF                   ;B4EB79;
    db $01                                                               ;B4EB89;

DebugEnemyPopulationData_PirateMagentaWalking:
    dw EnemyHeaders_PirateMagentaWalking                                 ;B4EB8A;
    dw $0100,$0100,$0000,$2000,$0004,$0001,$0030,$FFFF                   ;B4EB8C;
    db $01                                                               ;B4EB9C;

DebugEnemyPopulationData_PirateSilverWalking:
    dw EnemyHeaders_PirateSilverWalking                                  ;B4EB9D;
    dw $0100,$0100,$0000,$2000,$0004,$0001,$0030,$FFFF                   ;B4EB9F;
    db $01                                                               ;B4EBAF;

DebugEnemyPopulationData_Fune:
    dw EnemyHeaders_Fune                                                 ;B4EBB0;
    dw $00F0,$04E0,$0000,$A000,$0000,$0110,$0F05,$FFFF                   ;B4EBB2;
    db $01                                                               ;B4EBC2;

DebugEnemyPopulationData_KihunterYellow:
    dw EnemyHeaders_KihunterYellow                                       ;B4EBC3;
    dw $0100,$0100,$0000,$2800,$0000,$0001,$0000                         ;B4EBC5;
    dw EnemyHeaders_KihunterYellowWings                                  ;B4EBD3;
    dw $0100,$0100,$0000,$2C00,$0000,$0020,$0000,$FFFF                   ;B4EBD5;
    db $01                                                               ;B4EBE5;

DebugEnemyPopulationData_KihunterRed:
    dw EnemyHeaders_KihunterRed                                          ;B4EBE6;
    dw $0100,$0100,$0000,$2800,$0000,$0001,$0000                         ;B4EBE8;
    dw EnemyHeaders_KihunterRedWings                                     ;B4EBF6;
    dw $0100,$0100,$0000,$2C00,$0000,$0020,$0000,$FFFF                   ;B4EBF8;
    db $01                                                               ;B4EC08;

DebugEnemyPopulationData_RobotNoPower:
    dw EnemyHeaders_RobotNoPower                                         ;B4EC09;
    dw $0050,$00B0,$0000,$A800,$0000,$0001,$0000,$FFFF                   ;B4EC0B;
    db $01                                                               ;B4EC1B;


AllEnemyVulnerabilities:
EnemyVulnerabilities_Default:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02   ;B4EC1C;
    db $02,$02,$02,$02,$02,$02                                           ;B4EC2C;

EnemyVulnerabilities_DessgeegaLarge:
    db $00,$00,$00,$00,$01,$01,$01,$01,$02,$02,$02,$02,$02,$02,$02,$02   ;B4EC32;
    db $02,$02,$02,$02,$02,$02                                           ;B4EC42;

EnemyVulnerabilities_Viola_Yard_HZoomer_Zeela_Sova_Zoomer:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$04,$04   ;B4EC48;
    db $02,$02,$02,$02,$02,$02                                           ;B4EC58;

EnemyVulnerabilities_PirateNinja_Grey_Green_Red_Magenta:
    db $82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$02,$02,$00,$02   ;B4EC5E;
    db $02,$02,$02,$02,$80,$00                                           ;B4EC6E;

EnemyVulnerabilities_PirateGoldNinja:
    db $80,$80,$80,$80,$81,$81,$81,$81,$82,$82,$82,$82,$02,$04,$00,$00   ;B4EC74;
    db $00,$00,$00,$02,$80,$00                                           ;B4EC84;

EnemyVulnerabilities_PirateSilverWall_PirateSilverWalking:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$04,$04,$00,$02   ;B4EC8A;
    db $02,$02,$02,$02,$02,$02                                           ;B4EC9A;

EnemyVulnerabilities_PirateSilverNinja:
    db $84,$84,$84,$84,$84,$84,$84,$84,$84,$84,$84,$84,$84,$84,$84,$84   ;B4ECA0;
    db $84,$84,$84,$04,$84,$84                                           ;B4ECB0;

EnemyVulnerabilities_PirateRedWall:
    db $00,$02,$04,$04,$02,$02,$04,$04,$02,$02,$04,$04,$04,$04,$02,$02   ;B4ECB6;
    db $02,$02,$02,$02,$02,$02                                           ;B4ECC6;

EnemyVulnerabilities_PirateGreyWall:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$04,$04,$00,$02   ;B4ECCC;
    db $02,$02,$02,$02,$02,$02                                           ;B4ECDC;

EnemyVulnerabilities_PirateMagentaWall:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$04,$04,$00,$02   ;B4ECE2;
    db $02,$02,$02,$02,$02,$02                                           ;B4ECF2;

EnemyVulnerabilities_PirateGreyWalking:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$04,$04,$00,$02   ;B4ECF8;
    db $02,$02,$02,$02,$02,$02                                           ;B4ED08;

EnemyVulnerabilities_PirateGreenWalking:
    db $00,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$04,$04,$04,$02   ;B4ED0E;
    db $02,$02,$02,$02,$02,$02                                           ;B4ED1E;

EnemyVulnerabilities_PirateRedWalking:
    db $00,$02,$04,$04,$02,$02,$04,$04,$02,$02,$04,$04,$04,$04,$00,$02   ;B4ED24;
    db $02,$02,$02,$02,$02,$02                                           ;B4ED34;

EnemyVulnerabilities_PirateMagentaWalking:
    db $00,$00,$00,$00,$00,$00,$00,$00,$02,$02,$02,$02,$00,$00,$00,$00   ;B4ED3A;
    db $02,$02,$02,$00,$02,$02                                           ;B4ED4A;

EnemyVulnerabilities_PirateGoldWall_PirateGoldWalking:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$02,$02,$02,$02   ;B4ED50;
    db $02,$02,$02,$02,$02,$02                                           ;B4ED60;

EnemyVulnerabilities_KihunterGreen_KihunterGreenWings:
    db $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$04,$04,$00,$02   ;B4ED66;
    db $02,$02,$02,$02,$02,$02                                           ;B4ED76;

EnemyVulnerabilities_KihunterYellow_KihunterYellowWings:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$00,$02   ;B4ED7C;
    db $02,$02,$02,$02,$02,$02                                           ;B4ED8C;

EnemyVulnerabilities_KihunterRed_KihunterRedWings:
    db $00,$00,$81,$81,$81,$82,$82,$82,$82,$82,$82,$82,$00,$02,$00,$00   ;B4ED92;
    db $02,$02,$04,$82,$00,$02                                           ;B4EDA2;

EnemyVulnerabilities_Boyon:
    db $00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$02,$02,$02   ;B4EDA8;
    db $00,$00,$00,$00,$02,$02                                           ;B4EDB8;

EnemyVulnerabilities_Metaree:
    db $00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$02,$02,$02   ;B4EDBE;
    db $00,$00,$02,$00,$02,$02                                           ;B4EDCE;

EnemyVulnerabilities_MZoomer:
    db $00,$00,$00,$00,$00,$00,$00,$00,$02,$02,$02,$02,$00,$00,$02,$02   ;B4EDD4;
    db $00,$00,$02,$00,$00,$00                                           ;B4EDE4;

EnemyVulnerabilities_Squeept_Ripper2_Ripper_Tripper:
    db $00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$02,$00,$02   ;B4EDEA;
    db $00,$00,$02,$00,$00,$02                                           ;B4EDFA;

EnemyVulnerabilities_Mella:
    db $02,$02,$04,$04,$02,$02,$04,$04,$02,$02,$04,$04,$02,$02,$02,$02   ;B4EE00;
    db $02,$02,$02,$02,$02,$02                                           ;B4EE10;

EnemyVulnerabilities_Dragon:
    db $00,$00,$FF,$FF,$00,$00,$FF,$FF,$02,$02,$02,$02,$02,$02,$02,$02   ;B4EE16;
    db $02,$02,$02,$02,$02,$02                                           ;B4EE26;

EnemyVulnerabilities_Alcoon:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$04,$04,$02,$02   ;B4EE2C;
    db $02,$02,$02,$02,$02,$02                                           ;B4EE3C;

EnemyVulnerabilities_Geruta:
    db $02,$02,$04,$04,$02,$02,$04,$04,$02,$02,$04,$04,$02,$02,$00,$02   ;B4EE42;
    db $02,$02,$02,$02,$02,$02                                           ;B4EE52;

EnemyVulnerabilities_Holtz:
    db $02,$02,$04,$04,$02,$02,$04,$04,$02,$02,$04,$04,$00,$02,$00,$02   ;B4EE58;
    db $02,$02,$02,$02,$02,$02                                           ;B4EE68;

EnemyVulnerabilities_Multiviola:
    db $02,$02,$04,$04,$02,$02,$04,$04,$02,$02,$04,$04,$02,$02,$02,$02   ;B4EE6E;
    db $02,$02,$02,$02,$02,$02                                           ;B4EE7E;

EnemyVulnerabilities_Owtch:
    db $00,$00,$00,$00,$00,$00,$00,$00,$02,$02,$02,$02,$00,$02,$00,$02   ;B4EE84;
    db $02,$02,$02,$02,$02,$02                                           ;B4EE94;

EnemyVulnerabilities_YappingMaw:
    db $00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$02,$00,$00   ;B4EE9A;
    db $02,$02,$00,$00,$00,$02                                           ;B4EEAA;

EnemyVulnerabilities_Fune_Magdollite:
    db $00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$02,$00,$02   ;B4EEB0;
    db $02,$02,$00,$00,$00,$02                                           ;B4EEC0;

EnemyVulnerabilities_Indestructible:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;B4EEC6;
    db $00,$00,$00,$00,$00,$00                                           ;B4EED6;

EnemyVulnerabilities_Boulder:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$02,$00,$00   ;B4EEDC;
    db $00,$00,$00,$00,$02,$02                                           ;B4EEEC;

EnemyVulnerabilities_Namihe:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FF,$FF,$00,$00,$00,$00   ;B4EEF2;
    db $00,$00,$02,$00,$02,$02                                           ;B4EF02;

EnemyVulnerabilities_NonDestructibleShutter:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$82   ;B4EF08;
    db $00,$00,$00,$00,$00,$00                                           ;B4EF18;

EnemyVulnerabilities_Shaktool:
    db $82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$00   ;B4EF1E;
    db $00,$00,$00,$00,$00,$00                                           ;B4EF2E;

EnemyVulnerabilities_Powamp:
    db $82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82   ;B4EF34;
    db $82,$82,$82,$02,$82,$82                                           ;B4EF44;

EnemyVulnerabilities_GRipper:
    db $00,$00,$00,$00,$00,$00,$80,$00,$00,$00,$00,$00,$02,$02,$00,$02   ;B4EF4A;
    db $00,$02,$02,$00,$00,$02                                           ;B4EF5A;

EnemyVulnerabilities_Metroid:
    db $00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$02,$04,$00,$01   ;B4EF60;
    db $02,$02,$02,$00,$02,$02                                           ;B4EF70;

EnemyVulnerabilities_Sciser_Zero:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$04,$04   ;B4EF76;
    db $02,$02,$02,$02,$02,$02                                           ;B4EF86;

EnemyVulnerabilities_Beetom:
    db $00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$02,$02,$04,$04   ;B4EF8C;
    db $02,$02,$02,$00,$00,$02                                           ;B4EF9C;

EnemyVulnerabilities_Bull:
    db $80,$80,$80,$80,$80,$80,$80,$80,$02,$02,$82,$82,$02,$02,$02,$02   ;B4EFA2;
    db $02,$02,$02,$02,$02,$02                                           ;B4EFB2;

EnemyVulnerabilities_ShutterDestroyable:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$82,$82,$00,$00,$00,$00   ;B4EFB8;
    db $00,$00,$00,$02,$00,$00                                           ;B4EFC8;

EnemyVulnerabilities_Evir:
    db $02,$02,$FF,$FF,$02,$02,$FF,$FF,$02,$02,$82,$82,$02,$02,$02,$02   ;B4EFCE;
    db $02,$02,$02,$02,$02,$02                                           ;B4EFDE;

EnemyVulnerabilities_EvirProjectile:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;B4EFE4;
    db $00,$00,$00,$00,$00,$00                                           ;B4EFF4;

EnemyVulnerabilities_MiniKraid:
    db $82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$84,$84,$82,$82   ;B4EFFA;
    db $82,$82,$82,$02,$80,$80                                           ;B4F00A;

EnemyVulnerabilities_Bang:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$00,$00,$00,$00   ;B4F010;
    db $00,$00,$00,$02,$00,$00                                           ;B4F020;

EnemyVulnerabilities_Kago:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$02   ;B4F026;
    db $00,$00,$00,$00,$00,$00                                           ;B4F036;

UNUSED_EnemyVulnerabilities_B4F03C:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$02   ;B4F03C;
    db $00,$00,$00,$02,$00,$00                                           ;B4F04C;

UNUSED_EnemyVulnerabilities_B4F052:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$04   ;B4F052;
    db $00,$00,$00,$02,$00,$00                                           ;B4F062;

EnemyVulnerabilities_Zebetite:
    db $80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$82,$82,$80,$80   ;B4F068;
    db $80,$80,$80,$00,$80,$80                                           ;B4F078;

EnemyVulnerabilities_SidehopperTourian:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$02,$00,$00   ;B4F07E;
    db $00,$00,$00,$00,$00,$00                                           ;B4F08E;

EnemyVulnerabilities_SporeSpawn:
    db $80,$82,$82,$82,$80,$82,$82,$82,$82,$82,$82,$82,$82,$82,$80,$80   ;B4F094;
    db $80,$80,$80,$04,$80,$80                                           ;B4F0A4;

UNUSED_EnemyVulnerabilities_B4F0AA:
    db $82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82   ;B4F0AA;
    db $82,$82,$82,$02,$82,$82                                           ;B4F0BA;

EnemyVulnerabilities_BombTorizo_BombTorizoOrb:
    db $02,$02,$82,$82,$02,$02,$82,$82,$02,$02,$82,$82,$02,$04,$00,$00   ;B4F0C0;
    db $00,$00,$00,$02,$00,$00                                           ;B4F0D0;

EnemyVulnerabilities_GoldenTorizo_GoldenTorizoOrb:
    db $80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$82,$84,$80,$00   ;B4F0D6;
    db $00,$00,$00,$02,$02,$00                                           ;B4F0E6;

EnemyVulnerabilities_Phantoon_Body_Eye_Tentacles_Mouth:
    db $80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$82,$84,$00,$00   ;B4F0EC;
    db $00,$00,$00,$02,$80,$80                                           ;B4F0FC;

EnemyVulnerabilities_Crocomire_CrocomireTongue:
    db $80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$82   ;B4F102;
    db $80,$80,$80,$00,$80,$80                                           ;B4F112;

EnemyVulnerabilities_Botwoon:
    db $80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$82,$82,$80,$80   ;B4F118;
    db $80,$80,$80,$02,$80,$80                                           ;B4F128;

EnemyVulnerabilities_Corpse_BabyMetroid:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;B4F12E;
    db $00,$00,$00,$00,$00,$00                                           ;B4F13E;

EnemyVulnerabilities_Draygon_Body_Eye_Tail_Arms:
    db $80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$82,$82,$80,$80   ;B4F144;
    db $80,$81,$80,$82,$82,$80                                           ;B4F154;

EnemyVulnerabilities_Kraid:
    db $82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$80,$80   ;B4F15A;
    db $80,$80,$80,$02,$80,$80                                           ;B4F16A;

EnemyVulnerabilities_KraidArm_KraidFoot:
    db $80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80   ;B4F170;
    db $80,$80,$80,$00,$80,$80                                           ;B4F180;

EnemyVulnerabilities_Kraid_LintTop_LintMiddle_LintBottom:
    db $80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80   ;B4F186;
    db $80,$80,$80,$00,$80,$80                                           ;B4F196;

EnemyVulnerabilities_KraidNail_KraidNailBad:
    db $82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82,$82   ;B4F19C;
    db $82,$00,$82,$02,$82,$82                                           ;B4F1AC;

EnemyVulnerabilities_Ridley_RidleyCeres:
    db $80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$82,$84,$80,$82   ;B4F1B2;
    db $80,$80,$80,$82,$80,$80                                           ;B4F1C2;

EnemyVulnerabilities_MotherBrainHead:
    db $80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$82,$82,$80,$80   ;B4F1C8;
    db $80,$80,$80,$02,$80,$80                                           ;B4F1D8;

EnemyVulnerabilities_MotherBrainBody:
    db $80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80   ;B4F1DE;
    db $80,$80,$80,$00,$80,$80                                           ;B4F1EE;


EnemyDropChances_Geruta:
AllEnemyDropChances:
  .smallEnergy:
    db $3C                                                               ;B4F1F4;

  .bigEnergy:
    db $3C                                                               ;B4F1F5;

  .missiles:
    db $3C                                                               ;B4F1F6;

  .nothing:
    db $05                                                               ;B4F1F7;

  .superMissiles:
    db $3C                                                               ;B4F1F8;

  .powerBombs:
    db $0A                                                               ;B4F1F9;

EnemyDropChances_Rio:
    db $1E,$50,$55,$28,$0A,$0A                                           ;B4F1FA;

EnemyDropChances_Waver:
    db $3C,$3C,$3C,$05,$3C,$0A                                           ;B4F200;

EnemyDropChances_Skree:
    db $14,$03,$55,$89,$05,$05                                           ;B4F206;

EnemyDropChances_Puyo:
    db $3C,$3C,$3C,$05,$0A,$3C                                           ;B4F20C;

EnemyDropChances_Atomic:
    db $00,$A5,$50,$00,$05,$05                                           ;B4F212;

EnemyDropChances_Mochtroid:
    db $3C,$3C,$3C,$05,$3C,$0A                                           ;B4F218;

EnemyDropChances_Choot:
    db $3C,$3C,$3C,$05,$3C,$0A                                           ;B4F21E;

EnemyDropChances_Zoomer:
    db $37,$19,$AA,$00,$05,$00                                           ;B4F224;

EnemyDropChances_Zeela:
    db $37,$19,$7D,$00,$32,$00                                           ;B4F22A;

EnemyDropChances_Sova:
    db $50,$46,$1E,$19,$32,$00                                           ;B4F230;

EnemyDropChances_Mellow:
    db $1E,$46,$50,$46,$05,$00                                           ;B4F236;

EnemyDropChances_Mella:
    db $46,$1E,$50,$46,$05,$00                                           ;B4F23C;

EnemyDropChances_Menu:
    db $46,$14,$50,$50,$05,$00                                           ;B4F242;

EnemyDropChances_Zeb:
    db $3C,$3C,$3C,$05,$3C,$0A                                           ;B4F248;

EnemyDropChances_Geega:
    db $3C,$3C,$3C,$05,$3C,$0A                                           ;B4F24E;

EnemyDropChances_Zebbo:
    db $00,$8C,$0A,$00,$64,$05                                           ;B4F254;

EnemyDropChances_Gamet:
    db $3C,$3C,$3C,$05,$3C,$0A                                           ;B4F25A;

EnemyDropChances_Zoa:
    db $00,$64,$46,$05,$46,$0A                                           ;B4F260;

EnemyDropChances_Coven:
    db $32,$5F,$46,$00,$14,$14                                           ;B4F266;

EnemyDropChances_Kago:
    db $32,$5A,$46,$05,$14,$14                                           ;B4F26C;

EnemyDropChances_KihunterGreen_KihunterGreenWings:
    db $32,$1E,$50,$4B,$0A,$0A                                           ;B4F272;

EnemyDropChances_KihunterYellow_KihunterYellowWings:
    db $37,$50,$0A,$28,$3C,$0A                                           ;B4F278;

EnemyDropChances_KihunterRed_KihunterRedWings:
    db $23,$78,$0A,$14,$3C,$0A                                           ;B4F27E;

EnemyDropChances_PirateGoldNinja:
    db $00,$96,$05,$00,$64,$00                                           ;B4F284;

EnemyDropChances_DessgeegaLarge:
    db $50,$14,$32,$5F,$05,$05                                           ;B4F28A;

EnemyDropChances_PirateRedWall:
    db $0A,$14,$14,$C3,$05,$05                                           ;B4F290;

EnemyDropChances_PirateRedNinja:
    db $0A,$14,$14,$C3,$05,$05                                           ;B4F296;

EnemyDropChances_PirateRedWalking:
    db $0A,$14,$14,$C3,$05,$05                                           ;B4F29C;

EnemyDropChances_PirateGoldWall:
    db $0A,$14,$14,$C3,$05,$05                                           ;B4F2A2;

EnemyDropChances_PirateGreyWall:
    db $0A,$2D,$C5,$01,$01,$01                                           ;B4F2A8;

EnemyDropChances_PirateGreenWall:
    db $05,$1E,$78,$00,$64,$00                                           ;B4F2AE;

EnemyDropChances_Powamp:
    db $01,$00,$00,$00,$FE,$00                                           ;B4F2B4;

EnemyDropChances_Cacatac:
    db $00,$01,$00,$00,$FE,$00                                           ;B4F2BA;

EnemyDropChances_MiniKraid:
    db $00,$01,$00,$00,$FE,$00                                           ;B4F2C0;

EnemyDropChances_GRipper_Ripper2:
    db $00,$01,$00,$00,$FE,$00                                           ;B4F2C6;

EnemyDropChances_Viola:
    db $01,$00,$00,$00,$00,$FE                                           ;B4F2CC;

EnemyDropChances_Bull:
    db $00,$05,$00,$00,$00,$FA                                           ;B4F2D2;

EnemyDropChances_Sciser:
    db $01,$64,$00,$00,$00,$9A                                           ;B4F2D8;

EnemyDropChances_Dessgeega:
    db $01,$00,$00,$00,$00,$FE                                           ;B4F2DE;

EnemyDropChances_Fireflea:
    db $00,$01,$00,$00,$00,$FE                                           ;B4F2E4;

EnemyDropChances_Alcoon:
    db $01,$00,$00,$00,$00,$FE                                           ;B4F2EA;

EnemyDropChances_Zero:
    db $01,$00,$00,$00,$00,$FE                                           ;B4F2F0;

EnemyDropChances_Beetom:
    db $01,$00,$00,$00,$00,$FE                                           ;B4F2F6;

EnemyDropChances_HZoomer:
    db $82,$14,$00,$64,$00,$05                                           ;B4F2FC;

EnemyDropChances_MZoomer:
    db $82,$14,$00,$64,$00,$05                                           ;B4F302;

EnemyDropChances_Ripper:
    db $50,$14,$50,$41,$05,$05                                           ;B4F308;

EnemyDropChances_Tripper_Kamer2:
    db $50,$50,$50,$05,$05,$05                                           ;B4F30E;

EnemyDropChances_Metaree:
    db $50,$19,$50,$3C,$05,$05                                           ;B4F314;

EnemyDropChances_Reflec:
    db $3C,$3C,$3C,$3C,$0F,$00                                           ;B4F31A;

EnemyDropChances_Boyon:
    db $14,$0A,$55,$82,$05,$05                                           ;B4F320;

EnemyDropChances_Sidehopper:
    db $14,$28,$55,$64,$05,$05                                           ;B4F326;

EnemyDropChances_SidehopperLarge_SidehopperTourian:
    db $14,$14,$37,$64,$37,$05                                           ;B4F32C;

EnemyDropChances_Skultera:
    db $50,$1E,$46,$46,$05,$00                                           ;B4F332;

EnemyDropChances_Oum:
    db $46,$1E,$46,$4B,$05,$05                                           ;B4F338;

EnemyDropChances_Yard:
    db $55,$50,$00,$50,$00,$0A                                           ;B4F33E;

EnemyDropChances_Botwoon:
    db $00,$82,$3C,$05,$1E,$1E                                           ;B4F344;

EnemyDropChances_Owtch:
    db $50,$50,$50,$05,$05,$05                                           ;B4F34A;

EnemyDropChances_Evir_EvirProjectile:
    db $50,$50,$50,$05,$05,$05                                           ;B4F350;

EnemyDropChances_Holtz:
    db $00,$78,$32,$00,$32,$23                                           ;B4F356;

EnemyDropChances_Squeept:
    db $32,$32,$32,$05,$32,$32                                           ;B4F35C;

EnemyDropChances_Multiviola:
    db $46,$1E,$4B,$46,$05,$05                                           ;B4F362;

EnemyDropChances_Dragon:
    db $32,$32,$46,$4B,$05,$05                                           ;B4F368;

EnemyDropChances_Metroid:
    db $19,$32,$5A,$0A,$32,$1E                                           ;B4F36E;

EnemyDropChances_Rinka:
    db $00,$00,$00,$FF,$00,$00                                           ;B4F374;

UNUSED_EnemyDropChances_B4F37A:
    db $00,$82,$3C,$05,$1E,$1E                                           ;B4F37A;

EnemyDropChances_Bang:
    db $2D,$50,$50,$1E,$0A,$0A                                           ;B4F380;

EnemyDropChances_PirateGreyNinja:
    db $32,$78,$50,$00,$05,$00                                           ;B4F386;

EnemyDropChances_PirateGreyWalking:
    db $32,$78,$50,$00,$05,$00                                           ;B4F38C;

EnemyDropChances_PirateGreenNinja:
    db $32,$19,$00,$19,$9B,$00                                           ;B4F392;

EnemyDropChances_PirateGreenWalking:
    db $32,$1E,$64,$2D,$14,$0A                                           ;B4F398;

EnemyDropChances_PirateGoldWalking:
    db $32,$78,$50,$00,$05,$00                                           ;B4F39E;

EnemyDropChances_PirateMagentaWall:
    db $1E,$46,$50,$46,$05,$00                                           ;B4F3A4;

EnemyDropChances_PirateMagentaNinja:
    db $32,$78,$50,$00,$05,$00                                           ;B4F3AA;

EnemyDropChances_PirateMagentaWalking:
    db $32,$78,$50,$00,$05,$00                                           ;B4F3B0;

EnemyDropChances_Stoke:
    db $50,$50,$50,$05,$05,$05                                           ;B4F3B6;

EnemyDropChances_MamaTurtle_BabyTurtle:
    db $50,$50,$50,$05,$05,$05                                           ;B4F3BC;

EnemyDropChances_ShipTop_ShipBottomEntrance:
    db $00,$00,$00,$FF,$00,$00                                           ;B4F3C2;

EnemyDropChances_Shaktool:
    db $50,$50,$50,$05,$05,$05                                           ;B4F3C8;

EnemyDropChances_Eye:
    db $50,$50,$50,$05,$05,$05                                           ;B4F3CE;

EnemyDropChances_Fune:
    db $50,$50,$50,$05,$05,$05                                           ;B4F3D4;

EnemyDropChances_Namihe:
    db $50,$50,$50,$05,$05,$05                                           ;B4F3DA;

EnemyDropChances_YappingMaw:
    db $50,$50,$50,$05,$05,$05                                           ;B4F3E0;

EnemyDropChances_Magdollite:
    db $50,$50,$50,$05,$05,$05                                           ;B4F3E6;

EnemyDropChances_Robot:
    db $50,$50,$50,$05,$05,$05                                           ;B4F3EC;

EnemyDropChances_RobotNoPower:
    db $50,$50,$50,$05,$05,$05                                           ;B4F3F2;

EnemyDropChances_MotherBrainBody_BombTorizo:
    db $32,$32,$32,$00,$32,$37                                           ;B4F3F8;

EnemyDropChances_BombTorizoOrb:
    db $74,$14,$41,$36,$00,$00                                           ;B4F3FE;

EnemyDropChances_GoldenTorizo:
    db $32,$32,$32,$00,$32,$37                                           ;B4F404;

EnemyDropChances_GoldenTorizoOrb:
    db $1E,$1E,$32,$3C,$55,$00                                           ;B4F40A;

EnemyDropChances_SporeSpawn:
    db $32,$32,$32,$00,$32,$37                                           ;B4F410;

EnemyDropChances_SporeSpawnStalk:
    db $0A,$14,$C8,$19,$00,$00                                           ;B4F416;

EnemyDropChances_Kraid:
    db $32,$32,$32,$00,$32,$37                                           ;B4F41C;

EnemyDropChances_KraidNail_KraidFoot:
    db $0A,$23,$C8,$00,$0A,$00                                           ;B4F422;

EnemyDropChances_CrocomireTongue:
    db $00,$0A,$DC,$05,$14,$00                                           ;B4F428;

EnemyDropChances_Crocomire:
    db $00,$78,$64,$05,$14,$0A                                           ;B4F42E;

EnemyDropChances_Phantoon_Body_Tentacles_Mouth:
    db $32,$32,$32,$00,$32,$37                                           ;B4F434;

EnemyDropChances_PhantoonEye:
    db $14,$14,$64,$69,$0A,$00                                           ;B4F43A;

EnemyDropChances_DraygonBody_DraygonTail_DraygonArms:
    db $32,$32,$32,$00,$32,$37                                           ;B4F440;

EnemyDropChances_DraygonEye:
    db $05,$1E,$6E,$64,$05,$05                                           ;B4F446;

EnemyDropChances_Ridley_RidleyCeres:
    db $32,$32,$32,$00,$32,$37                                           ;B4F44C;

EnemyDropChances_NoobTubeCrack_Chozo:
    db $00,$00,$00,$FF,$00,$00                                           ;B4F452;

EnemyDropChances_Spark:
    db $00,$00,$00,$FF,$00,$00                                           ;B4F458;

EnemyDropChances_FaceBlock:
    db $00,$00,$00,$FF,$00,$00                                           ;B4F45E;

EnemyDropChances_Puromi:
    db $00,$00,$00,$FF,$00,$00                                           ;B4F464;

EnemyDropChances_Boulder:
    db $00,$00,$00,$FF,$00,$00                                           ;B4F46A;

EnemyDropChances_KzanTop_KzanBottom:
    db $00,$00,$00,$FF,$00,$00                                           ;B4F470;

EnemyDropChances_Hibashi:
    db $00,$00,$00,$FF,$00,$00                                           ;B4F476;

EnemyDropChances_Sbug_Sbug2:
    db $00,$00,$00,$FF,$00,$00                                           ;B4F47C;

EnemyDropChances_Etecoon_EtecoonEscape:
    db $00,$00,$00,$FF,$00,$00                                           ;B4F482;

EnemyDropChances_Steam_Dachora_DachoraEscape:
    db $00,$00,$00,$FF,$00,$00                                           ;B4F488;

EnemyDropChances_Polyp:
    db $00,$00,$00,$FF,$00,$00                                           ;B4F48E;

UNUSED_EnemyDropChances_B4F494:
    db $00,$00,$00,$FF,$00,$00                                           ;B4F494;

EnemyDropChances_MotherBrainHead:
    db $00,$00,$00,$FF,$00,$00                                           ;B4F49A;

EnemyDropChances_Shutter_Kamer_BabyMetroidCutscene:
    db $00,$00,$00,$FF,$00,$00                                           ;B4F4A0;

EnemyDropChances_PirateSilverWall:
    db $00,$00,$00,$FF,$00,$00                                           ;B4F4A6;

EnemyDropChances_PirateSilverNinja:
    db $00,$00,$00,$FF,$00,$00                                           ;B4F4AC;

EnemyDropChances_PirateSilverWalking:
    db $00,$00,$00,$FF,$00,$00                                           ;B4F4B2;

Freespace_BankB4_F4B8:                                                   ;B4F4B8;
; $B48 bytes
