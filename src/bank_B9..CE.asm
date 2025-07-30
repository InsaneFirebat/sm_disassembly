
; CRE, backgrounds

org $B98000


check bankcross off

;;; $B9:8000: CRE tiles (compressed) ;;;
CRE_Tiles_Compressed:
incbin "../data/CRE_Tiles_Compressed.bin" ; $209D bytes


;;; $B9:A09D: CRE tile table (compressed) ;;;
CRE_TileTable_Compressed:
incbin "../data/CRE_TileTable_Compressed.bin" ; $597 bytes


;;; $B9:A634: Backgrounds (compressed) ;;;
Background_Norfair_9_A_SmallPatternBrownPurple_Bright:
incbin "../data/Background_Norfair_9_A_SmallPatternBrownPurple_Bright.bin" ; $E0 bytes

Background_Norfair_9_A_SmallPatternBrownPurple_0:
incbin "../data/Background_Norfair_9_A_SmallPatternBrownPurple_0.bin" ; $4A bytes

Background_Norfair_9_A_SmallPatternBrownPurple_1:
incbin "../data/Background_Norfair_9_A_SmallPatternBrownPurple_1.bin" ; $4A bytes

Background_Norfair_9_HorizontalPatternBrick:
incbin "../data/Background_Norfair_9_HorizontalPatternBrick.bin" ; $92 bytes

Background_Norfair_9_VerticalPatternBrick:
incbin "../data/Background_Norfair_9_VerticalPatternBrick.bin" ; $449 bytes

Background_Norfair_9_A_CavernStalagtites:
incbin "../data/Background_Norfair_9_A_CavernStalagtites.bin" ; $27C bytes

Background_Norfair_9_A_CavernVertical:
incbin "../data/Background_Norfair_9_A_CavernVertical.bin" ; $3F1 bytes

Background_Norfair_9_CavernHorizontalRuins:
incbin "../data/Background_Norfair_9_CavernHorizontalRuins.bin" ; $3CB bytes

Background_Norfair_9_CavernVerticalRuins:
incbin "../data/Background_Norfair_9_CavernVerticalRuins.bin" ; $4EA bytes

Background_Norfair_9_CavernRoomPillars:
incbin "../data/Background_Norfair_9_CavernRoomPillars.bin" ; $396 bytes

Background_Norfair_9_RoomStatues:
incbin "../data/Background_Norfair_9_RoomStatues.bin" ; $334 bytes

Background_Norfair_9_PurplePatches:
incbin "../data/Background_Norfair_9_PurplePatches.bin" ; $359 bytes

Background_Norfair_9_Bubbles:
incbin "../data/Background_Norfair_9_Bubbles.bin" ; $3AA bytes

Background_Brinstar_6_Vertical_GlowPatches:
incbin "../data/Background_Brinstar_6_Vertical_GlowPatches.bin" ; $38F bytes

Background_Brinstar_6_Horizontal_GlowPatches:
incbin "../data/Background_Brinstar_6_Horizontal_GlowPatches.bin" ; $19E bytes

Background_Brinstar_6_LargeHorizontalPattern:
incbin "../data/Background_Brinstar_6_LargeHorizontalPattern.bin" ; $159 bytes

Background_Brinstar_6_MediumHorizontalPattern:
incbin "../data/Background_Brinstar_6_MediumHorizontalPattern.bin" ; $203 bytes

Background_Brinstar_6_ThinHorizontalPattern:
incbin "../data/Background_Brinstar_6_ThinHorizontalPattern.bin" ; $194 bytes

Background_Brinstar_6_SmallPattern:
incbin "../data/Background_Brinstar_6_SmallPattern.bin" ; $36 bytes

Background_Brinstar_6_SpheresPattern:
incbin "../data/Background_Brinstar_6_SpheresPattern.bin" ; $36 bytes

Background_Brinstar_6_SmallPattern_Variety_0:
incbin "../data/Background_Brinstar_6_SmallPattern_Variety_0.bin" ; $16F bytes

Background_Brinstar_6_SmallPattern_Variety_1:
incbin "../data/Background_Brinstar_6_SmallPattern_Variety_1.bin" ; $37 bytes

Background_Brinstar_6_SmallPattern_Variety_2:
incbin "../data/Background_Brinstar_6_SmallPattern_Variety_2.bin" ; $37 bytes

Background_Brinstar_6_DarkPattern:
incbin "../data/Background_Brinstar_6_DarkPattern.bin" ; $13D bytes

Background_Brinstar_7_WideVerticalTower_Brick_0:
incbin "../data/Background_Brinstar_7_WideVerticalTower_Brick_0.bin" ; $287 bytes

Background_Brinstar_7_WideVerticalTower_Brick_1:
incbin "../data/Background_Brinstar_7_WideVerticalTower_Brick_1.bin" ; $475 bytes

Background_Brinstar_7_WideVerticalTower_Brick_2:
incbin "../data/Background_Brinstar_7_WideVerticalTower_Brick_2.bin" ; $3A2 bytes

Background_Brinstar_7_VerticalTower:
incbin "../data/Background_Brinstar_7_VerticalTower.bin" ; $469 bytes

Background_Brinstar_7_NarrowVerticalTower_Brick:
incbin "../data/Background_Brinstar_7_NarrowVerticalTower_Brick.bin" ; $269 bytes

Background_Brinstar_7_VerticalBrick_0:
incbin "../data/Background_Brinstar_7_VerticalBrick_0.bin" ; $CA bytes

Background_Brinstar_7_VerticalBrick_1:
incbin "../data/Background_Brinstar_7_VerticalBrick_1.bin" ; $131 bytes

Background_Brinstar_7_MechanicalRoom_SpikeFloor:
incbin "../data/Background_Brinstar_7_MechanicalRoom_SpikeFloor.bin" ; $147 bytes

Background_Brinstar_7_MechanicalRoom:
incbin "../data/Background_Brinstar_7_MechanicalRoom.bin" ; $28B bytes

Background_Brinstar_7_NarrowVerticalTower_Brick_Vines_0:
incbin "../data/Background_Brinstar_7_NarrowVerticalTower_Brick_Vines_0.bin" ; $2CB bytes

Background_Brinstar_7_NarrowVerticalTower_Brick_Vines_1:
incbin "../data/Background_Brinstar_7_NarrowVerticalTower_Brick_Vines_1.bin" ; $AB bytes

Background_Brinstar_8_NarrowVerticalTower_Brick_Grey_0:
incbin "../data/Background_Brinstar_8_NarrowVerticalTower_Brick_Grey_0.bin" ; $545 bytes

Background_Brinstar_8_NarrowVerticalTower_Brick_Grey_1:
incbin "../data/Background_Brinstar_8_NarrowVerticalTower_Brick_Grey_1.bin" ; $21 bytes

Background_Brinstar_8_NarrowVerticalTower_Brick_Grey_2:
incbin "../data/Background_Brinstar_8_NarrowVerticalTower_Brick_Grey_2.bin" ; $221 bytes

Background_Brinstar_7_BlueGridBlocks:
incbin "../data/Background_Brinstar_7_BlueGridBlocks.bin" ; $E9 bytes

Background_Brinstar_1A_Kraid_Upper:
incbin "../data/Background_Brinstar_1A_Kraid_Upper.bin" ; $406 bytes

Background_Brinstar_1A_Kraid_Lower_0:
incbin "../data/Background_Brinstar_1A_Kraid_Lower_0.bin" ; $110 bytes

Background_Brinstar_1A_Kraid_Lower_1:
incbin "../data/Background_Brinstar_1A_Kraid_Lower_1.bin" ; $12F bytes

Background_Crateria_0_VerticalPatternRocks:
incbin "../data/Background_Crateria_0_VerticalPatternRocks.bin" ; $246 bytes

Background_Crateria_0_HorizontalPatternRocks:
incbin "../data/Background_Crateria_0_HorizontalPatternRocks.bin" ; $173 bytes

Background_Crateria_0_Rocks:
incbin "../data/Background_Crateria_0_Rocks.bin" ; $183 bytes

Background_Crateria_2_PurpleRocks:
incbin "../data/Background_Crateria_2_PurpleRocks.bin" ; $142 bytes

Background_Crateria_2_BrickRoom_WallArt_Dark:
incbin "../data/Background_Crateria_2_BrickRoom_WallArt_Dark.bin" ; $84 bytes

Background_Crateria_2_3_Mechanical:
incbin "../data/Background_Crateria_2_3_Mechanical.bin" ; $2C9 bytes

Background_Crateria_2_BrickRoom_WallArt:
incbin "../data/Background_Crateria_2_BrickRoom_WallArt.bin" ; $84 bytes

Background_Crateria_2_Elevator:
incbin "../data/Background_Crateria_2_Elevator.bin" ; $2F0 bytes

Background_Crateria_2_BrickRoom:
incbin "../data/Background_Crateria_2_BrickRoom.bin" ; $2A bytes

Background_WreckedShip_4_5_EntranceHall_0:
incbin "../data/Background_WreckedShip_4_5_EntranceHall_0.bin" ; $23C bytes

Background_WreckedShip_4_5_EntranceHall_1:
incbin "../data/Background_WreckedShip_4_5_EntranceHall_1.bin" ; $363 bytes

Background_WreckedShip_4_5_Columns_Tubes:
incbin "../data/Background_WreckedShip_4_5_Columns_Tubes.bin" ; $507 bytes

Background_WreckedShip_4_5_ExperimentRoom:
incbin "../data/Background_WreckedShip_4_5_ExperimentRoom.bin" ; $3A8 bytes

Background_WreckedShip_4_5_Panels_Vents:
incbin "../data/Background_WreckedShip_4_5_Panels_Vents.bin" ; $2DD bytes

Background_WreckedShip_4_5_Panels_Vents_Horizontal:
incbin "../data/Background_WreckedShip_4_5_Panels_Vents_Horizontal.bin" ; $207 bytes

Background_WreckedShip_4_5_Panels_Vents_Vertical:
incbin "../data/Background_WreckedShip_4_5_Panels_Vents_Vertical.bin" ; $35C bytes

Background_Maridia_B_BrownWall:
incbin "../data/Background_Maridia_B_BrownWall.bin" ; $22A bytes

Background_Maridia_C_GreenWall:
incbin "../data/Background_Maridia_C_GreenWall.bin" ; $3D9 bytes

Background_Tourian_D_MechanicalRoom:
incbin "../data/Background_Tourian_D_MechanicalRoom.bin" ; $378 bytes

Background_Tourian_D_MechanicalRoom_Letterbox:
incbin "../data/Background_Tourian_D_MechanicalRoom_Letterbox.bin" ; $1F6 bytes

Background_Tourian_D_VerticalStructures:
incbin "../data/Background_Tourian_D_VerticalStructures.bin" ; $385 bytes

Background_Tourian_D_PipeRoom_Letterbox:
incbin "../data/Background_Tourian_D_PipeRoom_Letterbox.bin" ; $26D bytes

Background_Tourian_D_PipeRoom_VerticalSeparation:
incbin "../data/Background_Tourian_D_PipeRoom_VerticalSeparation.bin" ; $3CB bytes

Background_Tourian_D_PipeRoom:
incbin "../data/Background_Tourian_D_PipeRoom.bin" ; $436 bytes

Background_Tourian_E_PipeRoom_Dark:
incbin "../data/Background_Tourian_E_PipeRoom_Dark.bin" ; $451 bytes

Background_Tourian_D_E_StatueHall:
incbin "../data/Background_Tourian_D_E_StatueHall.bin" ; $292 bytes

Background_Tourian_15_Statues:
incbin "../data/Background_Tourian_15_Statues.bin" ; $164 bytes

Background_Blank:
incbin "../data/Background_Blank.bin" ; $9 bytes


;;; $C629: Tiles (compressed) ;;;
Tiles_0_1_UpperCrateria:
incbin "../data/Tiles_0_1_UpperCrateria.bin" ; $32E8 bytes

Tiles_2_3_LowerCrateria:
incbin "../data/Tiles_2_3_LowerCrateria.bin" ; $358C bytes

Tiles_4_5_WreckedShip:
incbin "../data/Tiles_4_5_WreckedShip.bin" ; $3812 bytes

Tiles_6_GreenBlueBrinstar:
incbin "../data/Tiles_6_GreenBlueBrinstar.bin" ; $3EF9 bytes

Tiles_7_8_RedBrinstar_Kraid_StatuesHall:
incbin "../data/Tiles_7_8_RedBrinstar_Kraid_StatuesHall.bin" ; $3A46 bytes

Tiles_1A_Kraid:
incbin "../data/Tiles_1A_Kraid.bin" ; $6408 bytes

Tiles_9_A_Norfair:
incbin "../data/Tiles_9_A_Norfair.bin" ; $3A31 bytes

Tiles_1B_Crocomire:
incbin "../data/Tiles_1B_Crocomire.bin" ; $3305 bytes

Tiles_B_SandlessMaridia:
incbin "../data/Tiles_B_SandlessMaridia.bin" ; $365D bytes

Tiles_C_SandyMaridia:
incbin "../data/Tiles_C_SandyMaridia.bin" ; $365C bytes

Tiles_1C_Draygon:
incbin "../data/Tiles_1C_Draygon.bin" ; $362A bytes

Tiles_D_E_Tourian:
incbin "../data/Tiles_D_E_Tourian.bin" ; $31F6 bytes

Tiles_15_16_17_18_19_UtilityRoom_Statues:
incbin "../data/Tiles_15_16_17_18_19_UtilityRoom_Statues.bin" ; $29F9 bytes

Tiles_F_10_Ceres:
incbin "../data/Tiles_F_10_Ceres.bin" ; $3226 bytes

Tiles_11_12_CeresElevator:
incbin "../data/Tiles_11_12_CeresElevator.bin" ; $2B7E bytes

Tiles_13_14_CeresRidley:
incbin "../data/Tiles_13_14_CeresRidley.bin" ; $294D bytes


;;; $C629: Tile tables (compressed) ;;;
TileTables_0_1_UpperCrateria:
incbin "../data/TileTables_0_1_UpperCrateria.bin" ; $7F8 bytes

TileTables_2_3_LowerCrateria:
incbin "../data/TileTables_2_3_LowerCrateria.bin" ; $6E1 bytes

TileTables_4_5_WreckedShip:
incbin "../data/TileTables_4_5_WreckedShip.bin" ; $9D7 bytes

TileTables_6_GreenBlueBrinstar:
incbin "../data/TileTables_6_GreenBlueBrinstar.bin" ; $936 bytes

TileTables_7_8_RedBrinstar_Kraid_StatuesHall:
incbin "../data/TileTables_7_8_RedBrinstar_Kraid_StatuesHall.bin" ; $8AD bytes

TileTables_1A_Kraid:
incbin "../data/TileTables_1A_Kraid.bin" ; $1D8 bytes

TileTables_9_A_Norfair:
incbin "../data/TileTables_9_A_Norfair.bin" ; $104E bytes

TileTables_1B_Crocomire:
incbin "../data/TileTables_1B_Crocomire.bin" ; $102 bytes

TileTables_B_SandlessMaridia:
incbin "../data/TileTables_B_SandlessMaridia.bin" ; $10AD bytes

TileTables_C_SandyMaridia:
incbin "../data/TileTables_C_SandyMaridia.bin" ; $10AE bytes

TileTables_1C_Draygon:
incbin "../data/TileTables_1C_Draygon.bin" ; $4F4 bytes

TileTables_D_E_Tourian:
incbin "../data/TileTables_D_E_Tourian.bin" ; $77A bytes

TileTables_15_16_17_18_19_UtilityRoom_Statues:
incbin "../data/TileTables_15_16_17_18_19_UtilityRoom_Statues.bin" ; $4E3 bytes

TileTables_F_10_11_12_13_14_Ceres:
incbin "../data/TileTables_F_10_11_12_13_14_Ceres.bin" ; $61E bytes


;;; $C2:AD7C: Palettes (compressed) ;;;
Palettes_0_UpperCrateria:
incbin "../data/Palettes_0_UpperCrateria.bin" ; $E1 bytes

Palettes_1_RedCrateria:
incbin "../data/Palettes_1_RedCrateria.bin" ; $E6 bytes

Palettes_2_LowerCrateria:
incbin "../data/Palettes_2_LowerCrateria.bin" ; $D2 bytes

Palettes_3_OldTourian:
incbin "../data/Palettes_3_OldTourian.bin" ; $D2 bytes

Palettes_4_WreckedShip_PowerOn:
incbin "../data/Palettes_4_WreckedShip_PowerOn.bin" ; $BF bytes

Palettes_5_WreckedShip_PowerOff:
incbin "../data/Palettes_5_WreckedShip_PowerOff.bin" ; $BE bytes

Palettes_6_GreenBlueBrinstar:
incbin "../data/Palettes_6_GreenBlueBrinstar.bin" ; $FB bytes

Palettes_7_RedBrinstar_Kraid:
incbin "../data/Palettes_7_RedBrinstar_Kraid.bin" ; $E8 bytes

Palettes_8_StatuesHall:
incbin "../data/Palettes_8_StatuesHall.bin" ; $C9 bytes

Palettes_1A_Kraid:
incbin "../data/Palettes_1A_Kraid.bin" ; $D4 bytes

Palettes_9_HeatedNorfair:
incbin "../data/Palettes_9_HeatedNorfair.bin" ; $D7 bytes

Palettes_A_UnheatedNorfair:
incbin "../data/Palettes_A_UnheatedNorfair.bin" ; $DD bytes

Palettes_1B_Crocomire:
incbin "../data/Palettes_1B_Crocomire.bin" ; $A4 bytes

Palettes_B_SandlessMaridia:
incbin "../data/Palettes_B_SandlessMaridia.bin" ; $F2 bytes

Palettes_C_SandyMaridia:
incbin "../data/Palettes_C_SandyMaridia.bin" ; $FE bytes

Palettes_1C_Draygon:
incbin "../data/Palettes_1C_Draygon.bin" ; $C1 bytes

Palettes_D_Tourian:
incbin "../data/Palettes_D_Tourian.bin" ; $D4 bytes

Palettes_E_MotherBrain:
incbin "../data/Palettes_E_MotherBrain.bin" ; $DB bytes

Palettes_Map_Statues:
incbin "../data/Palettes_Map_Statues.bin" ; $DF bytes

Palettes_16_WreckedShipMap_PowerOff:
incbin "../data/Palettes_16_WreckedShipMap_PowerOff.bin" ; $DD bytes

Palettes_17_BlueRefill:
incbin "../data/Palettes_17_BlueRefill.bin" ; $E5 bytes

Palettes_18_YellowRefill:
incbin "../data/Palettes_18_YellowRefill.bin" ; $E4 bytes

Palettes_19_SaveStation:
incbin "../data/Palettes_19_SaveStation.bin" ; $E3 bytes

Palettes_F_11_13_BlueCeres:
incbin "../data/Palettes_F_11_13_BlueCeres.bin" ; $DF bytes

Palettes_10_12_14_WhiteCeres:
incbin "../data/Palettes_10_12_14_WhiteCeres.bin" ; $D8 bytes


;;; $C2:C2BB: Level data (compressed) ;;;
LevelData_LandingSite:
incbin "../data/LevelData_LandingSite.bin" ; $142D bytes

LevelData_GauntletEntrance:
incbin "../data/LevelData_GauntletEntrance.bin" ; $4DC bytes

LevelData_Parlor:
incbin "../data/LevelData_Parlor.bin" ; $DB3 bytes

LevelData_CrateriaPowerBombs:
incbin "../data/LevelData_CrateriaPowerBombs.bin" ; $1CE bytes

LevelData_WestOcean:
incbin "../data/LevelData_WestOcean.bin" ; $22D9 bytes

LevelData_BowlingAlleyPath:
incbin "../data/LevelData_BowlingAlleyPath.bin" ; $1DF bytes

LevelData_CrateriaKihunter:
incbin "../data/LevelData_CrateriaKihunter.bin" ; $BFE bytes

LevelData_ForgottenHighwayElev:
incbin "../data/LevelData_ForgottenHighwayElev.bin" ; $1BC bytes

LevelData_EastOcean:
incbin "../data/LevelData_EastOcean.bin" ; $F23 bytes

LevelData_ForgottenHighwayKagos:
incbin "../data/LevelData_ForgottenHighwayKagos.bin" ; $4DF bytes

LevelData_CrabMaze:
incbin "../data/LevelData_CrabMaze.bin" ; $9E1 bytes

LevelData_ForgottenHighwayElbow:
incbin "../data/LevelData_ForgottenHighwayElbow.bin" ; $137 bytes

LevelData_CrateriaTube:
incbin "../data/LevelData_CrateriaTube.bin" ; $9B bytes

LevelData_Moat:
incbin "../data/LevelData_Moat.bin" ; $3D8 bytes

LevelData_RedBinstarElev:
incbin "../data/LevelData_RedBinstarElev.bin" ; $1BC bytes

LevelData_GauntletETank:
incbin "../data/LevelData_GauntletETank.bin" ; $50B bytes

LevelData_PreBowling:
incbin "../data/LevelData_PreBowling.bin" ; $18C bytes

LevelData_Climb:
incbin "../data/LevelData_Climb.bin" ; $105F bytes

LevelData_Pit:
incbin "../data/LevelData_Pit.bin" ; $52C bytes

LevelData_ElevToBlueBrinstar:
incbin "../data/LevelData_ElevToBlueBrinstar.bin" ; $1AD bytes

LevelData_BombTorizo:
incbin "../data/LevelData_BombTorizo.bin" ; $9E bytes

LevelData_Flyway:
incbin "../data/LevelData_Flyway.bin" ; $C4 bytes

LevelData_PreMapFlyway:
incbin "../data/LevelData_PreMapFlyway.bin" ; $CA bytes

LevelData_Terminator:
incbin "../data/LevelData_Terminator.bin" ; $689 bytes

LevelData_GreenBrinstarElev:
incbin "../data/LevelData_GreenBrinstarElev.bin" ; $1B0 bytes

LevelData_LowerMushrooms:
incbin "../data/LevelData_LowerMushrooms.bin" ; $32B bytes

LevelData_GreenPiratesShaft:
incbin "../data/LevelData_GreenPiratesShaft.bin" ; $673 bytes

LevelData_CrateriaSuper:
incbin "../data/LevelData_CrateriaSuper.bin" ; $C4A bytes

LevelData_FinalMissileBombway:
incbin "../data/LevelData_FinalMissileBombway.bin" ; $114 bytes

LevelData_FinalMissile:
incbin "../data/LevelData_FinalMissile.bin" ; $F0 bytes

LevelData_BowlingAlley:
incbin "../data/LevelData_BowlingAlley.bin" ; $1A0C bytes

LevelData_WreckedShipEntrance:
incbin "../data/LevelData_WreckedShipEntrance.bin" ; $180 bytes

LevelData_Attic_State0:
incbin "../data/LevelData_Attic_State0.bin" ; $439 bytes

LevelData_Attic_State1:
incbin "../data/LevelData_Attic_State1.bin" ; $439 bytes

LevelData_AssemblyLine:
incbin "../data/LevelData_AssemblyLine.bin" ; $28C bytes

LevelData_WreckedShipMainShaft_State0:
incbin "../data/LevelData_WreckedShipMainShaft_State0.bin" ; $1414 bytes

LevelData_WreckedShipMainShaft_State1:
incbin "../data/LevelData_WreckedShipMainShaft_State1.bin" ; $13C7 bytes

LevelData_SpikyDeath:
incbin "../data/LevelData_SpikyDeath.bin" ; $267 bytes

LevelData_ElectricDeath:
incbin "../data/LevelData_ElectricDeath.bin" ; $495 bytes

LevelData_WreckedShipETank:
incbin "../data/LevelData_WreckedShipETank.bin" ; $8CB bytes

LevelData_Basement:
incbin "../data/LevelData_Basement.bin" ; $43E bytes

LevelData_Phantoon:
incbin "../data/LevelData_Phantoon.bin" ; $119 bytes

LevelData_SpongeBath:
incbin "../data/LevelData_SpongeBath.bin" ; $2A9 bytes

LevelData_WSWestSuper:
incbin "../data/LevelData_WSWestSuper.bin" ; $141 bytes

LevelData_WSEastSuper_State0:
incbin "../data/LevelData_WSEastSuper_State0.bin" ; $309 bytes

LevelData_WSEastSuper_State1:
incbin "../data/LevelData_WSEastSuper_State1.bin" ; $309 bytes

LevelData_GravitySuit:
incbin "../data/LevelData_GravitySuit.bin" ; $12D bytes

LevelData_GreenBrinstarMainShaft:
incbin "../data/LevelData_GreenBrinstarMainShaft.bin" ; $1A06 bytes

LevelData_SporeSpawnSuper:
incbin "../data/LevelData_SporeSpawnSuper.bin" ; $A6D bytes

LevelData_BrinstarPreMap:
incbin "../data/LevelData_BrinstarPreMap.bin" ; $113 bytes

LevelData_EarlySupers:
incbin "../data/LevelData_EarlySupers.bin" ; $3AB bytes

LevelData_BrinstarReserveTank:
incbin "../data/LevelData_BrinstarReserveTank.bin" ; $1AC bytes

LevelData_GreenBrinstarFirefleas:
incbin "../data/LevelData_GreenBrinstarFirefleas.bin" ; $4B3 bytes

LevelData_Dachora:
incbin "../data/LevelData_Dachora.bin" ; $13EE bytes

LevelData_BigPink:
incbin "../data/LevelData_BigPink.bin" ; $165A bytes

LevelData_SporeSpawnKihunters:
incbin "../data/LevelData_SporeSpawnKihunters.bin" ; $28D bytes

LevelData_SporeSpawn:
incbin "../data/LevelData_SporeSpawn.bin" ; $35B bytes

LevelData_PinkBrinstarPowerBombs:
incbin "../data/LevelData_PinkBrinstarPowerBombs.bin" ; $3CA bytes

LevelData_GreenHillZone:
incbin "../data/LevelData_GreenHillZone.bin" ; $97C bytes

LevelData_MorphBall:
incbin "../data/LevelData_MorphBall.bin" ; $765 bytes

LevelData_ConstructionZone:
incbin "../data/LevelData_ConstructionZone.bin" ; $325 bytes

LevelData_BlueBrinstarETank:
incbin "../data/LevelData_BlueBrinstarETank.bin" ; $43F bytes

LevelData_NoobBridge:
incbin "../data/LevelData_NoobBridge.bin" ; $2C3 bytes

LevelData_GreenBrinstarBeetoms:
incbin "../data/LevelData_GreenBrinstarBeetoms.bin" ; $E6 bytes

LevelData_EtecoonETank:
incbin "../data/LevelData_EtecoonETank.bin" ; $3E7 bytes

LevelData_EtecoonSuper:
incbin "../data/LevelData_EtecoonSuper.bin" ; $8B bytes

LevelData_SporeSpawnFarming:
incbin "../data/LevelData_SporeSpawnFarming.bin" ; $2AF bytes

LevelData_WaterwayETank:
incbin "../data/LevelData_WaterwayETank.bin" ; $5D8 bytes

LevelData_FirstMissile:
incbin "../data/LevelData_FirstMissile.bin" ; $CB bytes

LevelData_PinkBrinstarHoppers:
incbin "../data/LevelData_PinkBrinstarHoppers.bin" ; $3A6 bytes

LevelData_HopperETank:
incbin "../data/LevelData_HopperETank.bin" ; $156 bytes

LevelData_BlueBrinstarBoulders:
incbin "../data/LevelData_BlueBrinstarBoulders.bin" ; $11F bytes

LevelData_BillyMays:
incbin "../data/LevelData_BillyMays.bin" ; $B7 bytes

LevelData_RedTower:
incbin "../data/LevelData_RedTower.bin" ; $CF5 bytes

LevelData_RedBrinstarFirefleas:
incbin "../data/LevelData_RedBrinstarFirefleas.bin" ; $A16 bytes

LevelData_XrayScope:
incbin "../data/LevelData_XrayScope.bin" ; $177 bytes

LevelData_Hellway:
incbin "../data/LevelData_Hellway.bin" ; $1DB bytes

LevelData_Caterpillar:
incbin "../data/LevelData_Caterpillar.bin" ; $13D4 bytes

LevelData_BetaPowerBomb:
incbin "../data/LevelData_BetaPowerBomb.bin" ; $26D bytes

LevelData_AlphaPowerBomb:
incbin "../data/LevelData_AlphaPowerBomb.bin" ; $1AD bytes

LevelData_SkreeBoost:
incbin "../data/LevelData_SkreeBoost.bin" ; $1E3 bytes

LevelData_BelowSpazer:
incbin "../data/LevelData_BelowSpazer.bin" ; $3AB bytes

LevelData_Spazer:
incbin "../data/LevelData_Spazer.bin" ; $BC bytes

LevelData_WarehouseZeela:
incbin "../data/LevelData_WarehouseZeela.bin" ; $6E6 bytes

LevelData_WarehouseETank:
incbin "../data/LevelData_WarehouseETank.bin" ; $1C7 bytes

LevelData_WarehouseKihunter:
incbin "../data/LevelData_WarehouseKihunter.bin" ; $789 bytes

LevelData_MiniKraid:
incbin "../data/LevelData_MiniKraid.bin" ; $512 bytes

LevelData_KraidEyeDoor:
incbin "../data/LevelData_KraidEyeDoor.bin" ; $355 bytes

LevelData_Kraid:
incbin "../data/LevelData_Kraid.bin" ; $26D bytes

LevelData_StatuesHallway:
incbin "../data/LevelData_StatuesHallway.bin" ; $4EA bytes

if !FEATURE_KEEP_UNREFERENCED
UNUSED_LevelData_C6DD77:
incbin "../data/UNUSED_LevelData_C6DD77.bin" ; $169 bytes
endif ; !FEATURE_KEEP_UNREFERENCED

LevelData_WarehouseEntrance:
incbin "../data/LevelData_WarehouseEntrance.bin" ; $475 bytes

LevelData_VariaSuit:
incbin "../data/LevelData_VariaSuit.bin" ; $14F bytes

LevelData_IceBeamAcid:
incbin "../data/LevelData_IceBeamAcid.bin" ; $151 bytes

LevelData_Cathedral:
incbin "../data/LevelData_Cathedral.bin" ; $6C4 bytes

LevelData_CathedralEntrance:
incbin "../data/LevelData_CathedralEntrance.bin" ; $628 bytes

LevelData_BusinessCenter:
incbin "../data/LevelData_BusinessCenter.bin" ; $5E0 bytes

LevelData_IceBeamGate:
incbin "../data/LevelData_IceBeamGate.bin" ; $A2B bytes

LevelData_IceBeamTutorial:
incbin "../data/LevelData_IceBeamTutorial.bin" ; $628 bytes

LevelData_IceBeam:
incbin "../data/LevelData_IceBeam.bin" ; $133 bytes

LevelData_IceBeamSnake:
incbin "../data/LevelData_IceBeamSnake.bin" ; $471 bytes

LevelData_CrumbleShaft:
incbin "../data/LevelData_CrumbleShaft.bin" ; $2B3 bytes

LevelData_CrocomireSpeedway:
incbin "../data/LevelData_CrocomireSpeedway.bin" ; $1077 bytes

LevelData_Crocomire:
incbin "../data/LevelData_Crocomire.bin" ; $2C5 bytes

LevelData_HiJumpBoots:
incbin "../data/LevelData_HiJumpBoots.bin" ; $157 bytes

LevelData_CrocomireEscape:
incbin "../data/LevelData_CrocomireEscape.bin" ; $8E3 bytes

LevelData_HiJumpETank:
incbin "../data/LevelData_HiJumpETank.bin" ; $443 bytes

LevelData_PostCrocFarming:
incbin "../data/LevelData_PostCrocFarming.bin" ; $3E8 bytes

LevelData_PostCrocPowerBombs:
incbin "../data/LevelData_PostCrocPowerBombs.bin" ; $15C bytes

LevelData_PostCrocShaft:
incbin "../data/LevelData_PostCrocShaft.bin" ; $399 bytes

LevelData_PostCrocMissile:
incbin "../data/LevelData_PostCrocMissile.bin" ; $3EB bytes

LevelData_GrappleTutorial3:
incbin "../data/LevelData_GrappleTutorial3.bin" ; $360 bytes

LevelData_PostCrocJump:
incbin "../data/LevelData_PostCrocJump.bin" ; $EC6 bytes

LevelData_GrappleTutorial2:
incbin "../data/LevelData_GrappleTutorial2.bin" ; $23C bytes

LevelData_GrappleTutorial1:
incbin "../data/LevelData_GrappleTutorial1.bin" ; $16F bytes

LevelData_GrappleBeam:
incbin "../data/LevelData_GrappleBeam.bin" ; $3C2 bytes

LevelData_NorfairReserveTank:
incbin "../data/LevelData_NorfairReserveTank.bin" ; $171 bytes

LevelData_GreenBubblesMissiles:
incbin "../data/LevelData_GreenBubblesMissiles.bin" ; $226 bytes

LevelData_BubbleMountain:
incbin "../data/LevelData_BubbleMountain.bin" ; $7F7 bytes

LevelData_SpeedBoosterHall:
incbin "../data/LevelData_SpeedBoosterHall.bin" ; $A1C bytes

LevelData_SpeedBooster:
incbin "../data/LevelData_SpeedBooster.bin" ; $15B bytes

LevelData_SingleChamber:
incbin "../data/LevelData_SingleChamber.bin" ; $12FF bytes

LevelData_DoubleChamber:
incbin "../data/LevelData_DoubleChamber.bin" ; $62F bytes

LevelData_WaveBeam:
incbin "../data/LevelData_WaveBeam.bin" ; $12A bytes

LevelData_SpikyPlatformsTunnel:
incbin "../data/LevelData_SpikyPlatformsTunnel.bin" ; $2F7 bytes

LevelData_Volcano:
incbin "../data/LevelData_Volcano.bin" ; $AE7 bytes

LevelData_KronicBoost:
incbin "../data/LevelData_KronicBoost.bin" ; $923 bytes

LevelData_MagdolliteTunnel:
incbin "../data/LevelData_MagdolliteTunnel.bin" ; $286 bytes

LevelData_PurpleShaft:
incbin "../data/LevelData_PurpleShaft.bin" ; $2EC bytes

LevelData_LavaDive:
incbin "../data/LevelData_LavaDive.bin" ; $7BA bytes

LevelData_LowerNorfairElev:
incbin "../data/LevelData_LowerNorfairElev.bin" ; $164 bytes

LevelData_UpperNorfairFarming:
incbin "../data/LevelData_UpperNorfairFarming.bin" ; $56E bytes

LevelData_RisingTide:
incbin "../data/LevelData_RisingTide.bin" ; $29E bytes

LevelData_AcidSnakesTunnel:
incbin "../data/LevelData_AcidSnakesTunnel.bin" ; $35A bytes

LevelData_SpikyAcidSnakesTunnel:
incbin "../data/LevelData_SpikyAcidSnakesTunnel.bin" ; $17C bytes

LevelData_PurpleFarming:
incbin "../data/LevelData_PurpleFarming.bin" ; $152 bytes

LevelData_BatCave:
incbin "../data/LevelData_BatCave.bin" ; $2C7 bytes

LevelData_FrogSpeedway:
incbin "../data/LevelData_FrogSpeedway.bin" ; $37D bytes

LevelData_RedPirateShaft:
incbin "../data/LevelData_RedPirateShaft.bin" ; $36E bytes

LevelData_AcidStatue:
incbin "../data/LevelData_AcidStatue.bin" ; $8D6 bytes

if !FEATURE_KEEP_UNREFERENCED
UNUSED_LevelData_C8CDA9:
incbin "../data/UNUSED_LevelData_C8CDA9.bin" ; $7F3 bytes
endif ; !FEATURE_KEEP_UNREFERENCED

LevelData_MainHall:
incbin "../data/LevelData_MainHall.bin" ; $B01 bytes

LevelData_GoldenTorizo:
incbin "../data/LevelData_GoldenTorizo.bin" ; $863 bytes

LevelData_FastRipper:
incbin "../data/LevelData_FastRipper.bin" ; $2FD bytes

LevelData_Ridley:
incbin "../data/LevelData_Ridley.bin" ; $1D1 bytes

LevelData_LNFarming:
incbin "../data/LevelData_LNFarming.bin" ; $251 bytes

LevelData_FastPillarsSetup:
incbin "../data/LevelData_FastPillarsSetup.bin" ; $3EC bytes

if !FEATURE_KEEP_UNREFERENCED
UNUSED_LevelData_C8F40B:
incbin "../data/UNUSED_LevelData_C8F40B.bin" ; $180 bytes
endif ; !FEATURE_KEEP_UNREFERENCED

LevelData_MickeyMouse:
incbin "../data/LevelData_MickeyMouse.bin" ; $73A bytes

LevelData_Pillar:
incbin "../data/LevelData_Pillar.bin" ; $55C bytes

LevelData_Plowerhouse:
incbin "../data/LevelData_Plowerhouse.bin" ; $2B1 bytes

LevelData_WorstRoomInTheGame:
incbin "../data/LevelData_WorstRoomInTheGame.bin" ; $4CC bytes

LevelData_Amphitheatre:
incbin "../data/LevelData_Amphitheatre.bin" ; $B1B bytes

LevelData_LNSpringBallMaze:
incbin "../data/LevelData_LNSpringBallMaze.bin" ; $828 bytes

LevelData_LNEscapePowerBombs:
incbin "../data/LevelData_LNEscapePowerBombs.bin" ; $199 bytes

LevelData_RedKihunterShaft:
incbin "../data/LevelData_RedKihunterShaft.bin" ; $A11 bytes

LevelData_Wasteland:
incbin "../data/LevelData_Wasteland.bin" ; $93B bytes

LevelData_MetalPirates:
incbin "../data/LevelData_MetalPirates.bin" ; $2E4 bytes

LevelData_ThreeMusketeers:
incbin "../data/LevelData_ThreeMusketeers.bin" ; $E62 bytes

LevelData_RidleyETank:
incbin "../data/LevelData_RidleyETank.bin" ; $11B bytes

LevelData_ScrewAttack:
incbin "../data/LevelData_ScrewAttack.bin" ; $2DE bytes

LevelData_LNFireflea:
incbin "../data/LevelData_LNFireflea.bin" ; $144C bytes

LevelData_GlassTunnel_State0:
incbin "../data/LevelData_GlassTunnel_State0.bin" ; $5D7 bytes

LevelData_GlassTunnel_State1:
incbin "../data/LevelData_GlassTunnel_State1.bin" ; $585 bytes

LevelData_WestTunnel:
incbin "../data/LevelData_WestTunnel.bin" ; $15B bytes

LevelData_EastTunnel:
incbin "../data/LevelData_EastTunnel.bin" ; $A1C bytes

LevelData_MainStreet:
incbin "../data/LevelData_MainStreet.bin" ; $1CD9 bytes

LevelData_FishTank:
incbin "../data/LevelData_FishTank.bin" ; $1214 bytes

LevelData_MamaTurtle:
incbin "../data/LevelData_MamaTurtle.bin" ; $E86 bytes

LevelData_CrabTunnel:
incbin "../data/LevelData_CrabTunnel.bin" ; $2B6 bytes

LevelData_MtEverest:
incbin "../data/LevelData_MtEverest.bin" ; $1BF3 bytes

LevelData_RedFish:
incbin "../data/LevelData_RedFish.bin" ; $632 bytes

LevelData_WateringHole:
incbin "../data/LevelData_WateringHole.bin" ; $754 bytes

LevelData_NWestMaridiaBug:
incbin "../data/LevelData_NWestMaridiaBug.bin" ; $890 bytes

LevelData_CrabShaft:
incbin "../data/LevelData_CrabShaft.bin" ; $1144 bytes

LevelData_PseudoPlasmaSpark:
incbin "../data/LevelData_PseudoPlasmaSpark.bin" ; $E3E bytes

LevelData_CrabHole:
incbin "../data/LevelData_CrabHole.bin" ; $45F bytes

LevelData_WestSandHallTunnel:
incbin "../data/LevelData_WestSandHallTunnel.bin" ; $1A6 bytes

LevelData_PlasmaTutorial:
incbin "../data/LevelData_PlasmaTutorial.bin" ; $1F4 bytes

LevelData_Plasma:
incbin "../data/LevelData_Plasma.bin" ; $BBE bytes

LevelData_ThreadTheNeedle:
incbin "../data/LevelData_ThreadTheNeedle.bin" ; $93E bytes

LevelData_MaridiaElev:
incbin "../data/LevelData_MaridiaElev.bin" ; $7A8 bytes

LevelData_PlasmaSpark:
incbin "../data/LevelData_PlasmaSpark.bin" ; $1DD7 bytes

LevelData_Kassiuz:
incbin "../data/LevelData_Kassiuz.bin" ; $750 bytes

LevelData_Toilet:
incbin "../data/LevelData_Toilet.bin" ; $F54 bytes

LevelData_BugSandHole:
incbin "../data/LevelData_BugSandHole.bin" ; $19C bytes

LevelData_WestSandHall:
incbin "../data/LevelData_WestSandHall.bin" ; $5E3 bytes

LevelData_Oasis:
incbin "../data/LevelData_Oasis.bin" ; $427 bytes

LevelData_EastSandHall:
incbin "../data/LevelData_EastSandHall.bin" ; $399 bytes

LevelData_WestSandHole:
incbin "../data/LevelData_WestSandHole.bin" ; $94E bytes

LevelData_EastSandHole:
incbin "../data/LevelData_EastSandHole.bin" ; $948 bytes

LevelData_WestAqueductQuicksand:
incbin "../data/LevelData_WestAqueductQuicksand.bin" ; $1EF bytes

LevelData_EastAqueductQuicksand:
incbin "../data/LevelData_EastAqueductQuicksand.bin" ; $1F0 bytes

LevelData_Aqueduct:
incbin "../data/LevelData_Aqueduct.bin" ; $1E93 bytes

LevelData_Butterfly:
incbin "../data/LevelData_Butterfly.bin" ; $20F bytes

LevelData_BotwoonHallway:
incbin "../data/LevelData_BotwoonHallway.bin" ; $8FE bytes

LevelData_Pants:
incbin "../data/LevelData_Pants.bin" ; $BFB bytes

LevelData_EastPants:
incbin "../data/LevelData_EastPants.bin" ; $4EE bytes

LevelData_Springball:
incbin "../data/LevelData_Springball.bin" ; $4FE bytes

LevelData_BelowBotwoonETank:
incbin "../data/LevelData_BelowBotwoonETank.bin" ; $7C2 bytes

LevelData_Colosseum:
incbin "../data/LevelData_Colosseum.bin" ; $1BC0 bytes

LevelData_ThePrecious:
incbin "../data/LevelData_ThePrecious.bin" ; $85B bytes

LevelData_BotwoonETank:
incbin "../data/LevelData_BotwoonETank.bin" ; $C81 bytes

LevelData_PlasmaBeachQuicksand:
incbin "../data/LevelData_PlasmaBeachQuicksand.bin" ; $FB bytes

LevelData_BotwoonQuicksand:
incbin "../data/LevelData_BotwoonQuicksand.bin" ; $1ED bytes

LevelData_Shaktool_State0:
incbin "../data/LevelData_Shaktool_State0.bin" ; $68E bytes

LevelData_Shaktool_State1:
incbin "../data/LevelData_Shaktool_State1.bin" ; $633 bytes

LevelData_HalfieClimb:
incbin "../data/LevelData_HalfieClimb.bin" ; $AD7 bytes

LevelData_Botwoon:
incbin "../data/LevelData_Botwoon.bin" ; $410 bytes

LevelData_SpaceJump:
incbin "../data/LevelData_SpaceJump.bin" ; $20A bytes

LevelData_WestCactusAlley:
incbin "../data/LevelData_WestCactusAlley.bin" ; $4E5 bytes

LevelData_EastCactusAlley:
incbin "../data/LevelData_EastCactusAlley.bin" ; $1190 bytes

LevelData_Draygon:
incbin "../data/LevelData_Draygon.bin" ; $6A9 bytes

LevelData_CeresElev:
incbin "../data/LevelData_CeresElev.bin" ; $3B8 bytes

LevelData_FallingTile:
incbin "../data/LevelData_FallingTile.bin" ; $17A bytes

LevelData_MagnetStairs:
incbin "../data/LevelData_MagnetStairs.bin" ; $251 bytes

LevelData_DeadScientist:
incbin "../data/LevelData_DeadScientist.bin" ; $367 bytes

LevelData_58Escape:
incbin "../data/LevelData_58Escape.bin" ; $10F bytes

LevelData_CeresRidley:
incbin "../data/LevelData_CeresRidley.bin" ; $BF bytes

LevelData_TourianFirst:
incbin "../data/LevelData_TourianFirst.bin" ; $3DE bytes

LevelData_Metroids1:
incbin "../data/LevelData_Metroids1.bin" ; $4C4 bytes

LevelData_Metroids2:
incbin "../data/LevelData_Metroids2.bin" ; $28D bytes

LevelData_Metroids3:
incbin "../data/LevelData_Metroids3.bin" ; $3B8 bytes

LevelData_Metroids4:
incbin "../data/LevelData_Metroids4.bin" ; $206 bytes

LevelData_BlueHopper:
incbin "../data/LevelData_BlueHopper.bin" ; $1D9 bytes

LevelData_DustTorizo:
incbin "../data/LevelData_DustTorizo.bin" ; $16C bytes

LevelData_BigBoy:
incbin "../data/LevelData_BigBoy.bin" ; $2C8 bytes

LevelData_Seaweed:
incbin "../data/LevelData_Seaweed.bin" ; $2E6 bytes

LevelData_MotherBrain:
incbin "../data/LevelData_MotherBrain.bin" ; $331 bytes

LevelData_TourianEyeDoor:
incbin "../data/LevelData_TourianEyeDoor.bin" ; $309 bytes

LevelData_RinkaShaft:
incbin "../data/LevelData_RinkaShaft.bin" ; $3FC bytes

LevelData_TourianEscape1:
incbin "../data/LevelData_TourianEscape1.bin" ; $247 bytes

LevelData_TourianEscape2:
incbin "../data/LevelData_TourianEscape2.bin" ; $21F bytes

LevelData_TourianEscape3:
incbin "../data/LevelData_TourianEscape3.bin" ; $7BA bytes

LevelData_TourianEscape4:
incbin "../data/LevelData_TourianEscape4.bin" ; $E8E bytes

LevelData_MapStation_RightSideDoor:
incbin "../data/LevelData_MapStation_RightSideDoor.bin" ; $2FA bytes

LevelData_MapStation_LeftSideDoor:
incbin "../data/LevelData_MapStation_LeftSideDoor.bin" ; $2F9 bytes

LevelData_EnergyRefill_RightSideDoor:
incbin "../data/LevelData_EnergyRefill_RightSideDoor.bin" ; $2FD bytes

LevelData_MissileRefill_RightSideDoor:
incbin "../data/LevelData_MissileRefill_RightSideDoor.bin" ; $2F3 bytes

LevelData_EnergyRefeill_BothDoors:
incbin "../data/LevelData_EnergyRefeill_BothDoors.bin" ; $325 bytes

LevelData_SaveStation_RightSideDoor:
incbin "../data/LevelData_SaveStation_RightSideDoor.bin" ; $2F7 bytes

LevelData_SaveStation_LeftSideDoor:
incbin "../data/LevelData_SaveStation_LeftSideDoor.bin" ; $31A bytes

LevelData_EnergyRefill_LeftSideDoor:
incbin "../data/LevelData_EnergyRefill_LeftSideDoor.bin" ; $30D bytes

LevelData_Statues:
incbin "../data/LevelData_Statues.bin" ; $30D bytes

LevelData_SaveStation_BothDoors:
incbin "../data/LevelData_SaveStation_BothDoors.bin" ; $30B bytes

LevelData_RefillStation_LeftSideDoor:
incbin "../data/LevelData_RefillStation_LeftSideDoor.bin" ; $302 bytes

if !FEATURE_KEEP_UNREFERENCED
UNUSED_LevelData_CEA503:
incbin "../data/UNUSED_LevelData_CEA503.bin" ; $320 bytes
endif ; !FEATURE_KEEP_UNREFERENCED

LevelData_RefillStation_RightSideDoor:
incbin "../data/LevelData_RefillStation_RightSideDoor.bin" ; $30E bytes

LevelData_MissileRefill_LeftSideDoor:
incbin "../data/LevelData_MissileRefill_LeftSideDoor.bin" ; $30D bytes

LevelData_DebugRoom:
incbin "../data/LevelData_DebugRoom.bin" ; $3F0 bytes

check bankcross on


Freespace_BankCE_B22E:                                                   ;CEB22E;
; $4DD2 bytes
