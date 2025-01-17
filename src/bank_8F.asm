
org $8F8000


PLMPopulation_LandingSite_State0_1_2:
    dw PLMEntries_ScrollPLM 
    db $1E,$28 
    dw RoomPLM_LandingSite_0 
    dw PLMEntries_upwardsExtension 
    db $1E,$27 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $1E,$26 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $1E,$25 
    dw $8000 
    dw PLMEntries_greenDoorFacingLeft 
    db $8E,$46 
    dw $0000 
    dw PLMEntries_yellowDoorFacingLeft 
    db $8E,$16 
    dw $0001,$0000 

PLMPopulation_LandingSite_State3:
    dw PLMEntries_ScrollPLM 
    db $1E,$28 
    dw RoomPLM_LandingSite_0 
    dw PLMEntries_upwardsExtension 
    db $1E,$27 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $1E,$26 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $1E,$25 
    dw $8000 
    dw PLMEntries_SetsMetroidsClearedStatesWhenRequired 
    db $08,$08 
    dw $0008 
    dw PLMEntries_greyDoorFacingRight 
    db $01,$26 
    dw $9002 
    dw PLMEntries_greyDoorFacingLeft 
    db $8E,$46 
    dw $9003 
    dw PLMEntries_greyDoorFacingLeft 
    db $8E,$16 
    dw $9004,$0000 

PLMPopulation_GauntletEntrance_State0_1:
    dw $0000 

PLMPopulation_Parlor_State0_1:
    dw PLMEntries_ScrollPLM 
    db $3F,$0B 
    dw RoomPLM_Parlor_0 
    dw PLMEntries_ScrollPLM 
    db $43,$0B 
    dw RoomPLM_Parlor_1 
    dw PLMEntries_ScrollPLM 
    db $16,$0D 
    dw RoomPLM_Parlor_2 
    dw PLMEntries_rightwardsExtension 
    db $17,$0D 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $18,$0D 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $19,$0D 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $16,$0B 
    dw RoomPLM_Parlor_6 
    dw PLMEntries_rightwardsExtension 
    db $17,$0B 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $18,$0B 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $19,$0B 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $0E,$09 
    dw RoomPLM_Parlor_A 
    dw PLMEntries_upwardsExtension 
    db $0E,$08 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $0E,$07 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $1C,$0A 
    dw RoomPLM_Parlor_D 
    dw PLMEntries_upwardsExtension 
    db $1C,$09 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $1C,$08 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $1C,$07 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $1C,$06 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $1C,$05 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $32,$0B 
    dw RoomPLM_Parlor_13_14 
    dw PLMEntries_ScrollPLM 
    db $3C,$0B 
    dw RoomPLM_Parlor_13_14 
    dw PLMEntries_ScrollPLM 
    db $3A,$11 
    dw RoomPLM_Parlor_15 
    dw PLMEntries_rightwardsExtension 
    db $3B,$11 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $3C,$11 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $3D,$11 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $3E,$11 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $34,$0E 
    dw RoomPLM_Parlor_1A 
    dw PLMEntries_redDoorFacingLeft 
    db $1E,$36 
    dw $0005,$0000 

PLMPopulation_Parlor_State2:
    dw PLMEntries_ScrollPLM 
    db $3F,$0B 
    dw RoomPLM_Parlor_0 
    dw PLMEntries_ScrollPLM 
    db $43,$0B 
    dw RoomPLM_Parlor_1 
    dw PLMEntries_ScrollPLM 
    db $16,$0D 
    dw RoomPLM_Parlor_2 
    dw PLMEntries_rightwardsExtension 
    db $17,$0D 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $18,$0D 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $19,$0D 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $16,$0B 
    dw RoomPLM_Parlor_6 
    dw PLMEntries_rightwardsExtension 
    db $17,$0B 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $18,$0B 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $19,$0B 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $0E,$09 
    dw RoomPLM_Parlor_A 
    dw PLMEntries_upwardsExtension 
    db $0E,$08 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $0E,$07 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $1C,$0A 
    dw RoomPLM_Parlor_D 
    dw PLMEntries_upwardsExtension 
    db $1C,$09 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $1C,$08 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $1C,$07 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $1C,$06 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $1C,$05 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $32,$0B 
    dw RoomPLM_Parlor_13_14 
    dw PLMEntries_ScrollPLM 
    db $3C,$0B 
    dw RoomPLM_Parlor_13_14 
    dw PLMEntries_ScrollPLM 
    db $3A,$11 
    dw RoomPLM_Parlor_15 
    dw PLMEntries_rightwardsExtension 
    db $3B,$11 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $3C,$11 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $3D,$11 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $3E,$11 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $34,$0E 
    dw RoomPLM_Parlor_1A 
    dw PLMEntries_SetsMetroidsClearedStatesWhenRequired 
    db $08,$08 
    dw $000A 
    dw PLMEntries_greyDoorFacingRight 
    db $01,$06 
    dw $9006 
    dw PLMEntries_greyDoorFacingRight 
    db $11,$26 
    dw $9007 
    dw PLMEntries_greyDoorFacingRight 
    db $11,$36 
    dw $9008 
    dw PLMEntries_greyDoorFacingLeft 
    db $1E,$36 
    dw $9009 
    dw PLMEntries_greyDoorFacingUp 
    db $16,$4D 
    dw $900A,$0000 

PLMPopulation_CrateriaPowerBombs:
    dw PLMEntries_PowerBombTank 
    db $1D,$07 
    dw $0000,$0000 

PLMPopulation_CrateriaSave:
    dw PLMEntries_saveStation 
    dw $0B05,$0001,$0000 

PLMPopulation_WestOcean:
    dw PLMEntries_greyDoorFacingLeft 
    db $5E,$36 
    dw $900B 
    dw PLMEntries_greenDoorFacingLeft 
    db $7E,$46 
    dw $000C 
    dw PLMEntries_MissileTank 
    db $02,$5B 
    dw $0001 
    dw PLMEntries_MissileTankShotBlock 
    db $1C,$03 
    dw $0002 
    dw PLMEntries_MissileTank 
    db $01,$2F 
    dw $0003,$0000 

PLMPopulation_BowlingAlleyPath:
    dw $0000 

PLMPopulation_CrateriaKihunter:
    dw PLMEntries_ScrollPLM 
    db $17,$0F 
    dw RoomPLM_CrateriaKihunter_0 
    dw PLMEntries_rightwardsExtension 
    db $18,$0F 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $16,$0C 
    dw RoomPLM_CrateriaKihunter_2 
    dw PLMEntries_rightwardsExtension 
    db $17,$0C 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $18,$0C 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $19,$0C 
    dw $8000 
    dw PLMEntries_yellowDoorFacingLeft 
    db $2E,$06 
    dw $000D 
    dw PLMEntries_yellowDoorFacingUp 
    db $16,$2D 
    dw $000E,$0000 

PLMPopulation_ForgottenHighwayElev:
    dw PLMEntries_ScrollPLM 
    db $08,$0D 
    dw RoomPLM_ForgottenHighwayElev_0 
    dw $0000 

PLMPopulation_EastOcean:
    dw $0000 

PLMPopulation_ForgottenHighwayKagos:
    dw $0000 

PLMPopulation_CrabMaze:
    dw $0000 

PLMPopulation_ForgottenHighwayElbow:
    dw PLMEntries_yellowDoorFacingUp 
    db $06,$0D 
    dw $000F,$0000 

PLMPopulation_CrateriaTube:
    dw $0000 

PLMPopulation_Moat:
    dw PLMEntries_MissileTank 
    db $0E,$09 
    dw $0004,$0000 

PLMPopulation_RedBinstarElev:
    dw PLMEntries_ScrollPLM 
    db $08,$0D 
    dw RoomPLM_RedBinstarElev_0 
    dw PLMEntries_yellowDoorFacingDown 
    db $06,$02 
    dw $0010,$0000 

PLMPopulation_GauntletETank:
    dw PLMEntries_ScrollPLM 
    db $54,$0C 
    dw RoomPLM_GauntletETank_0 
    dw PLMEntries_EnergyTank 
    db $53,$08 
    dw $0005,$0000 

PLMPopulation_PreBowling:
    dw $0000 

PLMPopulation_Climb_State_0_1:
    dw PLMEntries_ScrollPLM 
    db $1D,$05 
    dw RoomPLM_Climb_0 
    dw PLMEntries_ScrollPLM 
    db $20,$05 
    dw RoomPLM_Climb_1 
    dw PLMEntries_ScrollPLM 
    db $1D,$76 
    dw RoomPLM_Climb_2 
    dw PLMEntries_ScrollPLM 
    db $20,$76 
    dw RoomPLM_Climb_3 
    dw PLMEntries_leftwardsExtension 
    db $12,$85 
    dw $8000 
    dw PLMEntries_leftwardsExtension 
    db $13,$85 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $14,$85 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $14,$86 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $14,$87 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $14,$88 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $14,$89 
    dw RoomPLM_Climb_A 
    dw PLMEntries_upwardsExtension 
    db $0F,$86 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $0F,$87 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $0F,$88 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $0F,$89 
    dw RoomPLM_Climb_E 
    dw PLMEntries_upwardsExtension 
    db $0D,$86 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $0D,$87 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $0D,$88 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $0D,$89 
    dw RoomPLM_Climb_12 
    dw PLMEntries_upwardsExtension 
    db $08,$86 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $08,$87 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $08,$88 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $08,$89 
    dw RoomPLM_Climb_16 
    dw PLMEntries_greyDoorFacingLeft 
    db $2E,$06 
    dw $9011 
    dw PLMEntries_greyDoorFacingRight 
    db $01,$86 
    dw $9012 
    dw PLMEntries_yellowDoorFacingLeft 
    db $2E,$76 
    dw $0013,$0000 

PLMPopulation_Climb_State2:
    dw PLMEntries_ScrollPLM 
    db $1D,$05 
    dw RoomPLM_Climb_0 
    dw PLMEntries_ScrollPLM 
    db $20,$05 
    dw RoomPLM_Climb_1 
    dw PLMEntries_ScrollPLM 
    db $1D,$76 
    dw RoomPLM_Climb_2 
    dw PLMEntries_ScrollPLM 
    db $20,$76 
    dw RoomPLM_Climb_3 
    dw PLMEntries_leftwardsExtension 
    db $12,$85 
    dw $8000 
    dw PLMEntries_leftwardsExtension 
    db $13,$85 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $14,$85 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $14,$86 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $14,$87 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $14,$88 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $14,$89 
    dw RoomPLM_Climb_A 
    dw PLMEntries_upwardsExtension 
    db $0F,$86 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $0F,$87 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $0F,$88 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $0F,$89 
    dw RoomPLM_Climb_E 
    dw PLMEntries_upwardsExtension 
    db $0D,$86 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $0D,$87 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $0D,$88 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $0D,$89 
    dw RoomPLM_Climb_12 
    dw PLMEntries_upwardsExtension 
    db $08,$86 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $08,$87 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $08,$88 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $08,$89 
    dw RoomPLM_Climb_16 
    dw PLMEntries_SetsMetroidsClearedStatesWhenRequired 
    db $08,$08 
    dw $000C 
    dw PLMEntries_greyDoorFacingLeft 
    db $2E,$06 
    dw $9014 
    dw PLMEntries_greyDoorFacingLeft 
    db $2E,$76 
    dw $9015 
    dw PLMEntries_greyDoorFacingLeft 
    db $1E,$86 
    dw $9016 
    dw PLMEntries_greyDoorFacingRight 
    db $01,$86 
    dw $9017,$0000 

PLMPopulation_Pit_0:
    dw PLMEntries_ScrollPLM 
    db $04,$0F 
    dw $97AB 
    dw PLMEntries_ScrollPLM 
    db $06,$0F 
    dw RoomPLM_Pit_0_1 
    dw PLMEntries_ScrollPLM 
    db $05,$09 
    dw RoomPLM_Pit_2 
    dw PLMEntries_greyDoorFacingRight 
    db $01,$06 
    dw $9018,$0000 

PLMPopulation_Pit_1:
    dw PLMEntries_ScrollPLM 
    db $04,$0F 
    dw RoomPLM_Pit_0_1 
    dw PLMEntries_ScrollPLM 
    db $06,$0F 
    dw RoomPLM_Pit_0_1 
    dw PLMEntries_ScrollPLM 
    db $05,$09 
    dw RoomPLM_Pit_2 
    dw PLMEntries_greyDoorFacingLeft 
    db $2E,$06 
    dw $0C19 
    dw PLMEntries_greyDoorFacingRight 
    db $01,$06 
    dw $0C1A 
    dw PLMEntries_MissileTank 
    db $05,$1A 
    dw $0006,$0000 

PLMPopulation_ElevToBlueBrinstar_State0_1:
    dw PLMEntries_ScrollPLM 
    db $07,$0D 
    dw RoomPLM_ElevToBlueBrinstar 
    dw $0000 

PLMPopulation_BombTorizo_State0_1:
    dw PLMEntries_bombTorizoGreyDoor 
    db $01,$06 
    dw $081B 
    dw PLMEntries_BombsChozoOrb 
    db $0C,$0A 
    dw $0007 
    dw PLMEntries_BombTorizosCrumblingChozo 
    db $0D,$0B 
    dw $0000,$0000 

PLMPopulation_BombTorizo_State2:
    dw PLMEntries_SetsMetroidsClearedStatesWhenRequired 
    db $08,$08 
    dw $000E 
    dw PLMEntries_greyDoorFacingRight 
    db $01,$06 
    dw $181C,$0000 

PLMPopulation_Flyway_State0_1:
    dw PLMEntries_redDoorFacingLeft 
    db $2E,$06 
    dw $001D,$0000 

PLMPopulation_Flyway_State2:
    dw PLMEntries_SetsMetroidsClearedStatesWhenRequired 
    db $08,$08 
    dw $0010,$0000 

PLMPopulation_PreMapFlyway:
    dw $0000 

PLMPopulation_Terminator:
    dw PLMEntries_EnergyTank 
    db $07,$2A 
    dw $0008,$0000 

PLMPopulation_GreenBrinstarElev:
    dw PLMEntries_ScrollPLM 
    db $07,$0D 
    dw RoomPLM_GreenBrinstarElev_0 
    dw $0000 

PLMPopulation_LowerMushrooms:
    dw $0000 

PLMPopulation_CrateriaMap:
    dw PLMEntries_mapStation 
    db $0B,$0A 
    dw $8000,$0000 

PLMPopulation_GreenPiratesShaft:
    dw PLMEntries_ScrollPLM 
    db $07,$43 
    dw RoomPLM_GreenPiratesShaft_0 
    dw PLMEntries_rightwardsExtension 
    db $08,$43 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $09,$46 
    dw RoomPLM_GreenPiratesShaft_2 
    dw PLMEntries_rightwardsExtension 
    db $0A,$46 
    dw $8000 
    dw PLMEntries_MissileTank 
    db $0D,$1B 
    dw $0009 
    dw PLMEntries_MissileTank 
    db $02,$1B 
    dw $000A 
    dw PLMEntries_redDoorFacingLeft 
    db $0E,$66 
    dw $001E,$0000 

PLMPopulation_CrateriaSuper:
    dw PLMEntries_SuperMissileTank 
    db $3B,$09 
    dw $000B,$0000 

PLMPopulation_FinalMissileBombway_State0:
    dw $0000 

PLMPopulation_FinalMissileBombway_State1:
    dw $0000 

PLMPopulation_FinalMissile_State0:
    dw $0000 

PLMPopulation_FinalMissile_State1:
    dw PLMEntries_MissileTank 
    db $04,$07 
    dw $000C,$0000 

PLMPopulation_GreenBrinstarMainShaft:
    dw PLMEntries_ScrollPLM 
    db $07,$71 
    dw RoomPLM_GreenBrinstarMainShaft_0 
    dw PLMEntries_ScrollPLM 
    db $10,$A8 
    dw RoomPLM_GreenBrinstarMainShaft_1_2 
    dw PLMEntries_ScrollPLM 
    db $21,$A8 
    dw RoomPLM_GreenBrinstarMainShaft_1_2 
    dw PLMEntries_ScrollPLM 
    db $0D,$AC 
    dw RoomPLM_GreenBrinstarMainShaft_3 
    dw PLMEntries_elevatorPlatform 
    db $06,$2C 
    dw $8000 
    dw PLMEntries_PowerBombTankChozoOrb 
    db $3C,$7A 
    dw $000D 
    dw PLMEntries_redDoorFacingRight 
    db $01,$56 
    dw $001F 
    dw PLMEntries_redDoorFacingRight 
    db $01,$46 
    dw $0020 
    dw PLMEntries_redDoorFacingLeft 
    db $0E,$46 
    dw $0021 
    dw PLMEntries_redDoorFacingLeft 
    db $0E,$66 
    dw $0022 
    dw PLMEntries_redDoorFacingRight 
    db $01,$66 
    dw $0023 
    dw PLMEntries_greyDoorFacingLeft 
    db $0E,$76 
    dw $9024,$0000 

PLMPopulation_SporeSpawnSuper:
    dw PLMEntries_ScrollPLM 
    db $17,$0B 
    dw RoomPLM_SporeSpawnSuper_0 
    dw PLMEntries_rightwardsExtension 
    db $18,$0B 
    dw $8000 
    dw PLMEntries_SuperMissileTankChozoOrb 
    db $1A,$87 
    dw $000E,$0000 

PLMPopulation_BrinstarPreMap:
    dw PLMEntries_greyDoorFacingLeft 
    db $2E,$06 
    dw $0C25,$0000 

PLMPopulation_EarlySupers:
    dw PLMEntries_ScrollPLM 
    db $29,$0E 
    dw RoomPLM_EarlySupers_0_4 
    dw PLMEntries_rightwardsExtension 
    db $2A,$0E 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $2B,$0E 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $04,$13 
    dw RoomPLM_EarlySupers_3 
    dw PLMEntries_ScrollPLM 
    db $04,$0F 
    dw RoomPLM_EarlySupers_0_4 
    dw PLMEntries_redDoorFacingLeft 
    db $2E,$16 
    dw $0026 
    dw PLMEntries_MissileTank 
    db $13,$1B 
    dw $000F 
    dw PLMEntries_SuperMissileTank 
    db $04,$06 
    dw $0010,$0000 

PLMPopulation_BrinstarReserveTank:
    dw PLMEntries_ScrollPLM 
    db $0E,$0B 
    dw RoomPLM_BrinstarReserveTank_0 
    dw PLMEntries_ReserveTankChozoOrb 
    db $0B,$07 
    dw $0011 
    dw PLMEntries_MissileTankShotBlock 
    db $1E,$07 
    dw $0012 
    dw PLMEntries_MissileTank 
    db $19,$07 
    dw $0013,$0000 

PLMPopulation_GreenBrinstarMap:
    dw PLMEntries_mapStation 
    db $05,$0A 
    dw $8000,$0000 

PLMPopulation_GreenBrinstarFirefleas:
    dw PLMEntries_greenDoorFacingRight 
    db $01,$26 
    dw $0027,$0000 

PLMPopulation_GreenBrinstarMissileRefill:
    dw PLMEntries_missileStation 
    db $04,$0A 
    dw $0014,$0000 

PLMPopulation_Dachora:
    dw PLMEntries_downwardsExtension 
    db $45,$0E 
    dw $8000 
    dw PLMEntries_leftwardsExtension 
    db $45,$0D 
    dw $8000 
    dw PLMEntries_leftwardsExtension 
    db $46,$0D 
    dw $8000 
    dw PLMEntries_leftwardsExtension 
    db $47,$0D 
    dw $8000 
    dw PLMEntries_leftwardsExtension 
    db $48,$0D 
    dw $8000 
    dw PLMEntries_leftwardsExtension 
    db $49,$0D 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $4A,$0D 
    dw RoomPLM_Dachora_6 
    dw PLMEntries_upwardsExtension 
    db $40,$08 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $40,$09 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $40,$0A 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $40,$0B 
    dw RoomPLM_Dachora_A_16 
    dw PLMEntries_downwardsExtension 
    db $4B,$0B 
    dw $8000 
    dw PLMEntries_downwardsExtension 
    db $4B,$0A 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $4B,$09 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $4A,$09 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $49,$09 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $48,$09 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $47,$09 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $46,$09 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $45,$09 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $44,$09 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $44,$0A 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $44,$0B 
    dw RoomPLM_Dachora_A_16 
    dw $0000 

PLMPopulation_BigPink:
    dw PLMEntries_ScrollPLM 
    db $2E,$6B 
    dw RoomPLM_BigPink_0 
    dw PLMEntries_ScrollPLM 
    db $20,$7A 
    dw RoomPLM_BigPink_1 
    dw PLMEntries_ScrollPLM 
    db $3D,$57 
    dw RoomPLM_BigPink_2 
    dw PLMEntries_ScrollPLM 
    db $40,$57 
    dw RoomPLM_BigPink_3 
    dw PLMEntries_ScrollPLM 
    db $1F,$08 
    dw RoomPLM_BigPink_4 
    dw PLMEntries_ScrollPLM 
    db $21,$08 
    dw RoomPLM_BigPink_5 
    dw PLMEntries_MissileTank 
    db $24,$32 
    dw $0015 
    dw PLMEntries_MissileTank 
    db $22,$67 
    dw $0016 
    dw PLMEntries_ChargeBeamChozoOrb 
    db $25,$76 
    dw $0017 
    dw PLMEntries_yellowDoorFacingLeft 
    db $3E,$46 
    dw $0028 
    dw PLMEntries_greenDoorFacingLeft 
    db $3E,$66 
    dw $0029 
    dw PLMEntries_redDoorFacingLeft 
    db $3E,$06 
    dw $002A 
    dw PLMEntries_redDoorFacingRight 
    db $01,$96 
    dw $002B,$0000 

PLMPopulation_SporeSpawnKihunters:
    dw PLMEntries_greyDoorFacingRight 
    db $01,$06 
    dw $0C2C 
    dw PLMEntries_greyDoorFacingDown 
    db $36,$03 
    dw $0C2D,$0000 

PLMPopulation_SporeSpawn_State0_1:
    dw PLMEntries_greenDoorFacingUp 
    db $06,$2E 
    dw $002E,$0000 

PLMPopulation_PinkBrinstarPowerBombs:
    dw PLMEntries_ScrollPLM 
    db $08,$0E 
    dw RoomPLM_PinkBrinstarPowerBombs_0 
    dw PLMEntries_ScrollPLM 
    db $08,$0B 
    dw RoomPLM_PinkBrinstarPowerBombs_1 
    dw PLMEntries_greyDoorFacingLeft 
    db $1E,$06 
    dw $0C2F 
    dw PLMEntries_PowerBombTank 
    db $06,$17 
    dw $0018,$0000 

PLMPopulation_GreenHillZone:
    dw PLMEntries_downwardsClosedGate 
    db $64,$37 
    dw $8000 
    dw PLMEntries_downwardsGateShotblock 
    db $64,$37 
    dw $0000 
    dw PLMEntries_yellowDoorFacingLeft 
    db $1E,$06 
    dw $0030 
    dw PLMEntries_MissileTank 
    db $3D,$18 
    dw $0019,$0000 

PLMPopulation_MorphBall_State0:
    dw PLMEntries_ScrollPLM 
    db $1F,$2B 
    dw RoomPLM_MorphBall_0 
    dw PLMEntries_upwardsExtension 
    db $08,$23 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $08,$24 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $08,$25 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $08,$26 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $08,$27 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $08,$28 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $08,$29 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $08,$2A 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $08,$2B 
    dw RoomPLM_MorphBall_9 
    dw PLMEntries_rightwardsExtension 
    db $58,$21 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $57,$21 
    dw RoomPLM_MorphBall_B_D 
    dw PLMEntries_rightwardsExtension 
    db $58,$0A 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $57,$0A 
    dw RoomPLM_MorphBall_B_D 
    dw PLMEntries_rightwardsExtension 
    db $58,$26 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $57,$26 
    dw RoomPLM_MorphBall_F 
    dw PLMEntries_MorphBall 
    db $45,$29 
    dw $001A,$0000 

PLMPopulation_MorphBall_State1:
    dw PLMEntries_ScrollPLM 
    db $1F,$2B 
    dw RoomPLM_MorphBall_0 
    dw PLMEntries_upwardsExtension 
    db $08,$23 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $08,$24 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $08,$25 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $08,$26 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $08,$27 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $08,$28 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $08,$29 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $08,$2A 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $08,$2B 
    dw RoomPLM_MorphBall_9 
    dw PLMEntries_rightwardsExtension 
    db $58,$21 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $57,$21 
    dw RoomPLM_MorphBall_B_D 
    dw PLMEntries_rightwardsExtension 
    db $58,$0A 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $57,$0A 
    dw RoomPLM_MorphBall_B_D 
    dw PLMEntries_rightwardsExtension 
    db $58,$26 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $57,$26 
    dw RoomPLM_MorphBall_F 
    dw PLMEntries_greyDoorFacingRight 
    db $01,$26 
    dw $0C31 
    dw PLMEntries_PowerBombTank 
    db $28,$2A 
    dw $001B,$0000 

PLMPopulation_ConstructionZone_State0_1:
    dw PLMEntries_ScrollPLM 
    db $04,$0B 
    dw RoomPLM_ConstructionZone_0 
    dw PLMEntries_rightwardsExtension 
    db $05,$0B 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $06,$0B 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $07,$0B 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $08,$0B 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $09,$0B 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $0A,$0B 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $0B,$0B 
    dw $8000 
    dw PLMEntries_redDoorFacingLeft 
    db $0E,$06 
    dw $0032,$0000 

PLMPopulation_BlueBrinstarETank_State0_1:
    dw PLMEntries_ScrollPLM 
    db $27,$0B 
    dw RoomPLM_BlueBrinstarETank_0_1 
    dw PLMEntries_ScrollPLM 
    db $27,$26 
    dw RoomPLM_BlueBrinstarETank_0_1 
    dw PLMEntries_MissileTank 
    db $2E,$29 
    dw $001C 
    dw PLMEntries_EnergyTankShotBlock 
    db $1C,$22 
    dw $001D,$0000 

PLMPopulation_NoobBridge:
    dw PLMEntries_greenDoorFacingLeft 
    db $5E,$06 
    dw $0033,$0000 

PLMPopulation_GreenBrinstarBeetoms:
    dw $0000 

PLMPopulation_EtecoonETank:
    dw PLMEntries_ScrollPLM 
    db $07,$0B 
    dw RoomPLM_EtecoonETank_0 
    dw PLMEntries_rightwardsExtension 
    db $08,$0B 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $09,$0B 
    dw $8000 
    dw PLMEntries_EnergyTank 
    db $05,$09 
    dw $001E 
    dw PLMEntries_greenDoorFacingRight 
    db $01,$06 
    dw $0034,$0000 

PLMPopulation_EtecoonSuper:
    dw PLMEntries_SuperMissileTank 
    db $07,$09 
    dw $001F,$0000 

PLMPopulation_DachoraEnergyRefill:
    dw PLMEntries_energyStation 
    db $04,$0A 
    dw $0020,$0000 

PLMPopulation_SporeSpawnFarming:
    dw PLMEntries_greenDoorFacingRight 
    db $01,$06 
    dw $0035,$0000 

PLMPopulation_WaterwayETank:
    dw PLMEntries_upwardsExtension 
    db $0F,$09 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $0F,$0A 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $0F,$0B 
    dw RoomPLM_WaterwayETank 
    dw PLMEntries_EnergyTank 
    db $04,$09 
    dw $0021,$0000 

PLMPopulation_FirstMissile:
    dw PLMEntries_MissileTankChozoOrb 
    db $04,$07 
    dw $0022,$0000 

PLMPopulation_PinkBrinstarHoppers:
    dw PLMEntries_downwardsClosedGate 
    db $11,$04 
    dw $8000 
    dw PLMEntries_downwardsGateShotblock 
    db $11,$04 
    dw $0002 
    dw PLMEntries_greyDoorFacingRight 
    db $01,$16 
    dw $0C36 
    dw PLMEntries_greyDoorFacingLeft 
    db $1E,$16 
    dw $0C37,$0000 

PLMPopulation_HopperETank:
    dw PLMEntries_EnergyTank 
    db $0B,$09 
    dw $0023,$0000 

PLMPopulation_BigPinkSaveRoom:
    dw PLMEntries_saveStation 
    db $05,$0B 
    dw $0000,$0000 

PLMPopulation_BlueBrinstarBoulders:
    dw $0000 

PLMPopulation_BillyMays:
    dw PLMEntries_MissileTank 
    db $07,$09 
    dw $0024 
    dw PLMEntries_MissileTankShotBlock 
    db $05,$0C 
    dw $0025,$0000 

PLMPopulation_GreenBrinstarSave:
    dw PLMEntries_saveStation 
    db $05,$0B 
    dw $0001,$0000 

PLMPopulation_EtecoonSave:
    dw PLMEntries_saveStation 
    db $05,$0B 
    dw $0002,$0000 

PLMPopulation_RedTower:
    dw PLMEntries_ScrollPLM 
    db $09,$6A 
    dw RoomPLM_RedTower_0 
    dw PLMEntries_rightwardsExtension 
    db $0A,$6A 
    dw $8000 
    dw PLMEntries_greenDoorFacingRight 
    db $01,$96 
    dw $0038 
    dw PLMEntries_yellowDoorFacingRIght 
    db $01,$66 
    dw $0039,$0000 

PLMPopulation_RedBrinstarFirefleas:
    dw PLMEntries_redDoorFacingRight 
    db $01,$06 
    dw $003A,$0000 

PLMPopulation_XrayScope:
    dw PLMEntries_XrayScopeChozoOrb 
    db $05,$07 
    dw $0026,$0000 

PLMPopulation_Hellway:
    dw $0000 

PLMPopulation_Caterpillar:
    dw PLMEntries_ScrollPLM 
    db $05,$5E 
    dw RoomPLM_Caterpillar_0 
    dw PLMEntries_rightwardsExtension 
    db $06,$5E 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $10,$37 
    dw RoomPLM_Caterpillar_2 
    dw PLMEntries_ScrollPLM 
    db $0D,$37 
    dw RoomPLM_Caterpillar_3 
    dw PLMEntries_elevatorPlatform 
    db $06,$2C 
    dw $8000 
    dw PLMEntries_downwardsClosedGate 
    db $26,$35 
    dw $8000 
    dw PLMEntries_downwardsGateShotblock 
    db $26,$35 
    dw $000A 
    dw PLMEntries_greenDoorFacingRight 
    db $01,$36 
    dw $003B 
    dw PLMEntries_yellowDoorFacingRIght 
    db $01,$56 
    dw $003C 
    dw PLMEntries_greenDoorFacingRight 
    db $01,$76 
    dw $003D,$0000 

PLMPopulation_BetaPowerBomb:
    dw PLMEntries_ScrollPLM 
    db $07,$0E 
    dw RoomPLM_BetaPowerBomb_0 
    dw PLMEntries_rightwardsExtension 
    db $08,$0E 
    dw $8000 
    dw PLMEntries_PowerBombTank 
    db $04,$13 
    dw $0027 
    dw PLMEntries_greyDoorFacingLeft 
    db $1E,$06 
    dw $0C3E,$0000 

PLMPopulation_AlphaPowerBomb:
    dw PLMEntries_upwardsExtension 
    db $0F,$04 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $0F,$05 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $0F,$06 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $0F,$07 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $0F,$08 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $0F,$09 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $0F,$0A 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $0F,$0B 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $0F,$0C 
    dw RoomPLM_AlphaPowerBomb_8 
    dw PLMEntries_PowerBombTankChozoOrb 
    db $14,$09 
    dw $0028 
    dw PLMEntries_MissileTank 
    db $02,$08 
    dw $0029,$0000 

PLMPopulation_SkreeBoost:
    dw $0000 

PLMPopulation_BelowSpazer:
    dw PLMEntries_ScrollPLM 
    db $10,$11 
    dw RoomPLM_BelowSpazer_0_8_A 
    dw PLMEntries_rightwardsExtension 
    db $11,$11 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $12,$11 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $13,$11 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $10,$14 
    dw RoomPLM_BelowSpazer_4_9_B 
    dw PLMEntries_rightwardsExtension 
    db $11,$14 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $12,$14 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $13,$14 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $08,$11 
    dw RoomPLM_BelowSpazer_0_8_A 
    dw PLMEntries_ScrollPLM 
    db $08,$14 
    dw RoomPLM_BelowSpazer_4_9_B 
    dw PLMEntries_ScrollPLM 
    db $02,$11 
    dw RoomPLM_BelowSpazer_0_8_A 
    dw PLMEntries_ScrollPLM 
    db $02,$14 
    dw RoomPLM_BelowSpazer_4_9_B 
    dw PLMEntries_greenDoorFacingLeft 
    db $1E,$06 
    dw $003F,$0000 

PLMPopulation_Spazer:
    dw PLMEntries_SpazerChozoOrb 
    db $0B,$09 
    dw $002A,$0000 

PLMPopulation_WarehouseZeela:
    dw PLMEntries_ScrollPLM 
    db $02,$0B 
    dw RoomPLM_WarehouseZeela_0 
    dw PLMEntries_ScrollPLM 
    db $02,$19 
    dw RoomPLM_WarehouseZeela_1_3 
    dw PLMEntries_ScrollPLM 
    db $07,$19 
    dw RoomPLM_WarehouseZeela_2 
    dw PLMEntries_ScrollPLM 
    db $15,$19 
    dw RoomPLM_WarehouseZeela_1_3 
    dw PLMEntries_greyDoorFacingRight 
    db $01,$16 
    dw $0040,$0000 

PLMPopulation_WarehouseETank:
    dw PLMEntries_greyDoorFacingLeft 
    db $0E,$06 
    dw $0C41 
    dw PLMEntries_EnergyTankShotBlock 
    db $05,$04 
    dw $002B,$0000 

PLMPopulation_WarehouseKihunter:
    dw PLMEntries_ScrollPLM 
    db $17,$0B 
    dw RoomPLM_WarehouseKihunter_0 
    dw PLMEntries_ScrollPLM 
    db $17,$0E 
    dw RoomPLM_WarehouseKihunter_1 
    dw PLMEntries_upwardsExtension 
    db $0B,$04 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $0B,$05 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $0B,$06 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $0B,$07 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $0B,$08 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $0B,$09 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $0B,$0A 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $0B,$0B 
    dw RoomPLM_WarehouseKihunter_9 
    dw PLMEntries_ScrollPLM 
    db $27,$0C 
    dw RoomPLM_WarehouseKihunter_A_B 
    dw PLMEntries_ScrollPLM 
    db $2E,$0C 
    dw RoomPLM_WarehouseKihunter_A_B 
    dw PLMEntries_MissileTankShotBlock 
    db $2E,$08 
    dw $002C,$0000 

PLMPopulation_MiniKraid_State0_1:
    dw PLMEntries_greyDoorFacingLeft 
    db $5E,$06 
    dw $0C42 
    dw PLMEntries_greyDoorFacingRight 
    db $01,$06 
    dw $0C43,$0000 

PLMPopulation_KraidEyeDoor:
    dw PLMEntries_ScrollPLM 
    db $03,$12 
    dw RoomPLM_KraidEyeDoor_0 
    dw PLMEntries_rightwardsExtension 
    db $04,$12 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $05,$12 
    dw $8000 
    dw PLMEntries_greenDoorFacingLeft 
    db $0E,$06 
    dw $0044 
    dw PLMEntries_EyeDoorFacingLeft 
    db $1E,$16 
    dw $0045 
    dw PLMEntries_EyeDoorBottomFacingLeft 
    db $1E,$19 
    dw $0045 
    dw PLMEntries_EyeDoorEyeFacingLeft 
    db $1E,$17 
    dw $0045,$0000 

PLMPopulation_Kraid_State0_1:
    dw PLMEntries_greyDoorFacingLeft 
    db $1E,$16 
    dw $0046 
    dw PLMEntries_greyDoorFacingRight 
    db $01,$16 
    dw $0047,$0000 

PLMPopulation_StatuesHallway:
    dw $0000 

PLMPopulation_RedTowerRefill:
    dw PLMEntries_energyStation 
    db $04,$0A 
    dw $002D,$0000 

PLMPopulation_KraidRefill:
    dw PLMEntries_missileStation 
    db $09,$0A 
    dw $002E 
    dw PLMEntries_energyStation 
    db $07,$0A 
    dw $002F,$0000 

PLMPopulation_Statues:
    dw PLMEntries_greyDoorFacingRight 
    db $01,$06 
    dw $9448,$0000 

PLMPopulation_WarehouseEntrance:
    dw PLMEntries_ScrollPLM 
    db $07,$0C 
    dw RoomPLM_WarehouseEntrance_0 
    dw PLMEntries_rightwardsExtension 
    db $08,$0C 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $10,$09 
    dw RoomPLM_WarehouseEntrance_2 
    dw PLMEntries_upwardsExtension 
    db $10,$08 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $10,$07 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $12,$09 
    dw RoomPLM_WarehouseEntrance_5 
    dw PLMEntries_upwardsExtension 
    db $12,$08 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $12,$07 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $12,$06 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $13,$0B 
    dw RoomPLM_WarehouseEntrance_9 
    dw PLMEntries_rightwardsExtension 
    db $14,$0B 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $14,$0A 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $14,$09 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $14,$08 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $14,$07 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $14,$06 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $14,$05 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $14,$04 
    dw $8000,$0000 

PLMPopulation_VariaSuit:
    dw PLMEntries_VariaSuitChozoOrb 
    db $07,$09 
    dw $0030,$0000 

PLMPopulation_WarehouseSave:
    dw PLMEntries_saveStation 
    db $07,$0B 
    dw $0003,$0000 

PLMPopulation_RedBrinstarSave:
    dw PLMEntries_saveStation 
    db $07,$0B 
    dw $0004,$0000 

PLMPopulation_IceBeamAcid:
    dw $0000 

PLMPopulation_Cathedral:
    dw PLMEntries_MissileTankShotBlock 
    db $22,$1C 
    dw $0031 
    dw PLMEntries_greenDoorFacingLeft 
    db $2E,$16 
    dw $0049,$0000 

PLMPopulation_CathedralEntrance:
    dw PLMEntries_redDoorFacingLeft 
    db $2E,$06 
    dw $004A,$0000 

PLMPopulation_BusinessCenter:
    dw PLMEntries_elevatorPlatform 
    db $06,$2C 
    dw $8000 
    dw PLMEntries_greenDoorFacingRight 
    db $01,$36 
    dw $004B 
    dw PLMEntries_yellowDoorFacingRIght 
    db $01,$46 
    dw $004C 
    dw PLMEntries_redDoorFacingRight 
    db $01,$56 
    dw $004D,$0000 

PLMPopulation_IceBeamGate:
    dw PLMEntries_ScrollPLM 
    db $37,$2D 
    dw RoomPLM_IceBeamGate_0 
    dw PLMEntries_rightwardsExtension 
    db $38,$2D 
    dw $8000,$0000 

PLMPopulation_IceBeamTutorial:
    dw $0000 

PLMPopulation_IceBeam:
    dw PLMEntries_IceBeamChozoOrb 
    db $0C,$07 
    dw $0032,$0000 

PLMPopulation_IceBeamSnake:
    dw PLMEntries_ScrollPLM 
    db $0F,$17 
    dw RoomPLM_IceBeamSnake_0 
    dw PLMEntries_ScrollPLM 
    db $0D,$17 
    dw RoomPLM_IceBeamSnake_1 
    dw PLMEntries_ScrollPLM 
    db $11,$17 
    dw RoomPLM_IceBeamSnake_2 
    dw PLMEntries_ScrollPLM 
    db $13,$17 
    dw RoomPLM_IceBeamSnake_3 
    dw $0000 

PLMPopulation_CrumbleShaft:
    dw PLMEntries_MissileTankShotBlock 
    db $01,$08 
    dw $0033,$0000 

PLMPopulation_CrocomireSpeedway:
    dw PLMEntries_ScrollPLM 
    db $9E,$28 
    dw RoomPLM_CrocomireSpeedway_0 
    dw PLMEntries_upwardsExtension 
    db $9E,$27 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $9E,$26 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $9E,$25 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $9E,$24 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $BE,$29 
    dw RoomPLM_CrocomireSpeedway_5 
    dw PLMEntries_upwardsExtension 
    db $BE,$28 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $BE,$27 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $C2,$29 
    dw RoomPLM_CrocomireSpeedway_8 
    dw PLMEntries_upwardsExtension 
    db $C2,$28 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $C2,$27 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $C2,$26 
    dw $8000 
    dw PLMEntries_greenDoorFacingUp 
    db $C6,$2D 
    dw $004E,$0000 

PLMPopulation_Crocomire_State0_1:
    dw PLMEntries_greyDoorFacingDown 
    db $36,$02 
    dw $044F 
    dw PLMEntries_EnergyTank 
    db $7D,$06 
    dw $0034,$0000 

PLMPopulation_HiJumpBoots:
    dw PLMEntries_HiJumpBootsChozoOrb 
    db $03,$0A 
    dw $0035,$0000 

PLMPopulation_CrocomireEscape:
    dw PLMEntries_downwardsClosedGate 
    db $06,$05 
    dw $8000 
    dw PLMEntries_downwardsGateShotblock 
    db $06,$05 
    dw $000A 
    dw PLMEntries_MissileTank 
    db $0D,$09 
    dw $0036,$0000 

PLMPopulation_HiJumpETank:
    dw PLMEntries_ScrollPLM 
    db $10,$0C 
    dw RoomPLM_HiJumpETank_0 
    dw PLMEntries_ScrollPLM 
    db $0F,$05 
    dw RoomPLM_HiJumpETank_1 
    dw PLMEntries_ScrollPLM 
    db $08,$1C 
    dw RoomPLM_HiJumpETank_2 
    dw PLMEntries_ScrollPLM 
    db $0B,$12 
    dw RoomPLM_HiJumpETank_3 
    dw PLMEntries_greyDoorFacingLeft 
    db $1E,$06 
    dw $0C50 
    dw PLMEntries_MissileTank 
    db $09,$06 
    dw $0037 
    dw PLMEntries_EnergyTank 
    db $17,$08 
    dw $0038,$0000 

PLMPopulation_PostCrocFarming:
    dw PLMEntries_redDoorFacingRight 
    db $01,$06 
    dw $0051,$0000 

PLMPopulation_PostCrocSave:
    dw PLMEntries_saveStation 
    db $07,$0B 
    dw $0000,$0000 

PLMPopulation_PostCrocPowerBombs:
    dw PLMEntries_PowerBombTank 
    db $07,$08 
    dw $0039,$0000 

PLMPopulation_PostCrocShaft:
    dw PLMEntries_redDoorFacingLeft 
    db $0E,$36 
    dw $0052,$0000 

PLMPopulation_PostCrocMissile:
    dw PLMEntries_MissileTank 
    db $3C,$09 
    dw $003A,$0000 

PLMPopulation_GrappleTutorial3:
    dw PLMEntries_downwardsClosedGate 
    db $2A,$05 
    dw $8000 
    dw PLMEntries_downwardsGateShotblock 
    db $2A,$05 
    dw $0008,$0000 

PLMPopulation_PostCrocJump:
    dw PLMEntries_MissileTank 
    db $43,$09 
    dw $003B,$0000 

PLMPopulation_GrappleTutorial2:
    dw $0000 

PLMPopulation_GrappleTutorial1:
    dw $0000 

PLMPopulation_GrappleBeam:
    dw PLMEntries_GrappleBeamChozoOrb 
    db $04,$27 
    dw $003C,$0000 

PLMPopulation_NorfairReserveTank:
    dw PLMEntries_ReserveTankChozoOrb 
    db $02,$07 
    dw $003D 
    dw PLMEntries_MissileTankShotBlock 
    db $07,$0B 
    dw $003E,$0000 

PLMPopulation_GreenBubblesMissiles:
    dw PLMEntries_ScrollPLM 
    db $10,$05 
    dw RoomPLM_GreenBubblesMissiles_0 
    dw PLMEntries_MissileTank 
    db $14,$0A 
    dw $003F,$0000 

PLMPopulation_BubbleMountain:
    dw PLMEntries_greenDoorFacingRight 
    db $01,$06 
    dw $0053 
    dw PLMEntries_greenDoorFacingLeft 
    db $1E,$06 
    dw $0054 
    dw PLMEntries_MissileTank 
    db $14,$3C 
    dw $0040,$0000 

PLMPopulation_SpeedBoosterHall:
    dw PLMEntries_SpeedBoosterEscape 
    db $00,$00 
    dw $8000 
    dw PLMEntries_MissileTankShotBlock 
    db $BC,$13 
    dw $0041 
    dw PLMEntries_redDoorFacingLeft 
    db $BE,$16 
    dw $0055,$0000 

PLMPopulation_SpeedBooster:
    dw PLMEntries_SpeedBoosterChozoOrb 
    db $0B,$06 
    dw $0042,$0000 

PLMPopulation_SingleChamber:
    dw PLMEntries_ScrollPLM 
    db $0D,$08 
    dw RoomPLM_SingleChamber_0 
    dw PLMEntries_ScrollPLM 
    db $10,$08 
    dw RoomPLM_SingleChamber_1_4 
    dw PLMEntries_upwardsExtension 
    db $4D,$0A 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $4D,$0B 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $4D,$0C 
    dw RoomPLM_SingleChamber_1_4 
    dw PLMEntries_redDoorFacingLeft 
    db $0E,$16 
    dw $0056,$0000 

PLMPopulation_DoubleChamber:
    dw PLMEntries_downwardsClosedGate 
    db $1A,$05 
    dw $8000 
    dw PLMEntries_downwardsGateShotblock 
    db $1A,$05 
    dw $0000 
    dw PLMEntries_MissileTank 
    db $1F,$09 
    dw $0043 
    dw PLMEntries_redDoorFacingLeft 
    db $3E,$06 
    dw $0057,$0000 

PLMPopulation_WaveBeam:
    dw PLMEntries_WaveBeamChozoOrb 
    db $0B,$06 
    dw $0044,$0000 

PLMPopulation_SpikyPlatformsTunnel:
    dw $0000 

PLMPopulation_Volcano:
    dw PLMEntries_ScrollPLM 
    db $20,$29 
    dw RoomPLM_Volcano_0 
    dw PLMEntries_ScrollPLM 
    db $1F,$29 
    dw RoomPLM_Volcano_1 
    dw PLMEntries_upwardsExtension 
    db $19,$24 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $19,$25 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $19,$26 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $19,$27 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $19,$28 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $19,$29 
    dw RoomPLM_Volcano_7 
    dw PLMEntries_upwardsExtension 
    db $26,$26 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $26,$27 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $26,$28 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $26,$29 
    dw RoomPLM_Volcano_B 
    dw $0000 

PLMPopulation_KronicBoost:
    dw PLMEntries_ScrollPLM 
    db $0F,$17 
    dw RoomPLM_KronicBoost_0 
    dw PLMEntries_ScrollPLM 
    db $11,$17 
    dw RoomPLM_KronicBoost_1 
    dw PLMEntries_upwardsExtension 
    db $08,$15 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $08,$16 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $08,$17 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $08,$18 
    dw RoomPLM_KronicBoost_5 
    dw PLMEntries_downwardsClosedGate 
    db $07,$14 
    dw $8000 
    dw PLMEntries_downwardsGateShotblock 
    db $07,$14 
    dw $0000 
    dw PLMEntries_yellowDoorFacingRIght 
    db $11,$26 
    dw $0058,$0000 

PLMPopulation_MagdolliteTunnel:
    dw $0000 

PLMPopulation_PurpleShaft:
    dw PLMEntries_ScrollPLM 
    db $02,$0B 
    dw RoomPLM_PurpleShaft_0_3 
    dw PLMEntries_rightwardsExtension 
    db $03,$0B 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $04,$0B 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $0B,$0B 
    dw RoomPLM_PurpleShaft_0_3 
    dw PLMEntries_rightwardsExtension 
    db $0C,$0B 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $0D,$0B 
    dw $8000,$0000 

PLMPopulation_LavaDive:
    dw $0000 

PLMPopulation_LowerNorfairElev:
    dw PLMEntries_ScrollPLM 
    db $08,$0B 
    dw RoomPLM_LowerNorfairElev_0 
    dw $0000 

PLMPopulation_UpperNorfairFarming:
    dw PLMEntries_downwardsClosedGate 
    db $06,$15 
    dw $8000 
    dw PLMEntries_downwardsGateShotblock 
    db $06,$15 
    dw $0000,$0000 

PLMPopulation_RisingTide:
    dw $0000 

PLMPopulation_AcidSnakesTunnel:
    dw $0000 

PLMPopulation_SpikyAcidSnakesTunnel:
    dw $0000 

PLMPopulation_UpperNorfairRefill:
    dw PLMEntries_energyStation 
    db $07,$0A 
    dw $0045,$0000 

PLMPopulation_PurpleFarming:
    dw $0000 

PLMPopulation_BatCave:
    dw PLMEntries_ScrollPLM 
    db $09,$0C 
    dw RoomPLM_BatCave_0 
    dw PLMEntries_rightwardsExtension 
    db $0A,$0C 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $09,$10 
    dw RoomPLM_BatCave_2 
    dw PLMEntries_rightwardsExtension 
    db $0A,$10 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $06,$13 
    dw RoomPLM_BatCave_4 
    dw PLMEntries_rightwardsExtension 
    db $07,$13 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $08,$13 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $09,$13 
    dw $8000,$0000 

PLMPopulation_NorfairMap:
    dw PLMEntries_mapStation 
    db $05,$0A 
    dw $8000,$0000 

PLMPopulation_BubbleMountainSave:
    dw PLMEntries_saveStation 
    db $05,$0B 
    dw $0001,$0000 

PLMPopulation_FrogSpeedway:
    dw $0000 

PLMPopulation_RedPirateShaft:
    dw $0000 

PLMPopulation_FrogSave:
    dw PLMEntries_saveStation 
    db $07,$0B 
    dw $0002,$0000 

PLMPopulation_CrocomireSave:
    dw PLMEntries_saveStation 
    db $07,$0B 
    dw $0003,$0000 

PLMPopulation_LNElevSave:
    dw PLMEntries_saveStation 
    db $05,$0B 
    dw $0004,$0000 

PLMPopulation_AcidStatue:
    dw PLMEntries_ScrollPLM 
    db $0C,$1E 
    dw RoomPLM_AcidStatue_0 
    dw PLMEntries_ScrollPLM 
    db $0C,$23 
    dw RoomPLM_AcidStatue_1 
    dw $0000 

PLMPopulation_MainHall:
    dw PLMEntries_ScrollPLM 
    db $47,$08 
    dw RoomPLM_MainHall_0_2 
    dw PLMEntries_rightwardsExtension 
    db $48,$08 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $47,$23 
    dw RoomPLM_MainHall_0_2 
    dw PLMEntries_rightwardsExtension 
    db $48,$23 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $47,$29 
    dw RoomPLM_MainHall_4 
    dw PLMEntries_rightwardsExtension 
    db $48,$29 
    dw $8000 
    dw PLMEntries_elevatorPlatform 
    db $46,$2A 
    dw $8000,$0000 

PLMPopulation_GoldenTorizo_State0_1:
    dw PLMEntries_ScrollPLM 
    db $04,$0C 
    dw RoomPLM_GoldenTorizo_0 
    dw PLMEntries_rightwardsExtension 
    db $05,$0C 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $06,$0C 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $07,$0C 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $08,$0C 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $09,$0C 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $0A,$0C 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $0B,$0C 
    dw $8000 
    dw PLMEntries_MissileTank 
    db $0D,$08 
    dw $0046 
    dw PLMEntries_SuperMissileTankShotBlock 
    db $15,$08 
    dw $0047 
    dw PLMEntries_greyDoorFacingLeft 
    db $1E,$16 
    dw $0859,$0000 

PLMPopulation_FastRipper:
    dw PLMEntries_downwardsClosedGate 
    db $34,$05 
    dw $8000 
    dw PLMEntries_downwardsGateShotblock 
    db $34,$05 
    dw $0008,$0000 

PLMPopulation_GTEnergyRefill:
    dw PLMEntries_energyStation 
    db $08,$0A 
    dw $0048,$0000 

PLMPopulation_Ridley_State0_1:
    dw PLMEntries_greyDoorFacingLeft 
    db $0E,$06 
    dw $005A 
    dw PLMEntries_greyDoorFacingRight 
    db $01,$16 
    dw $005B,$0000 

PLMPopulation_LNFarming:
    dw PLMEntries_EyeDoorFacingRIght 
    db $01,$06 
    dw $005C 
    dw PLMEntries_EyeDoorBottomFacingRight 
    db $01,$09 
    dw $005C 
    dw PLMEntries_EyeDoorEyeFacingRight 
    db $01,$07 
    dw $005C,$0000 

PLMPopulation_FastPillarsSetup:
    dw PLMEntries_ScrollPLM 
    db $07,$21 
    dw RoomPLM_FastPillarsSetup_0 
    dw PLMEntries_rightwardsExtension 
    db $08,$21 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $07,$1B 
    dw RoomPLM_FastPillarsSetup_2 
    dw PLMEntries_rightwardsExtension 
    db $08,$1B 
    dw $8000,$0000 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_PLMPopulation_8FB3EE:
    dw $0000 
endif ; !FEATURE_KEEP_UNREFERENCED

PLMPopulation_MickeyMouse:
    dw PLMEntries_ScrollPLM 
    db $30,$16 
    dw RoomPLM_MickeyMouse_0 
    dw PLMEntries_ScrollPLM 
    db $32,$16 
    dw RoomPLM_MickeyMouse_1 
    dw PLMEntries_ScrollPLM 
    db $2D,$16 
    dw RoomPLM_MickeyMouse_2 
    dw PLMEntries_upwardsExtension 
    db $2B,$14 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $2B,$15 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $2B,$16 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $2B,$17 
    dw RoomPLM_MickeyMouse_6 
    dw PLMEntries_upwardsExtension 
    db $38,$36 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $38,$37 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $38,$38 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $38,$39 
    dw RoomPLM_MickeyMouse_A 
    dw PLMEntries_rightwardsExtension 
    db $3D,$34 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $3C,$34 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $3B,$34 
    dw RoomPLM_MickeyMouse_D 
    dw PLMEntries_greyDoorFacingRight 
    db $01,$36 
    dw $0C5D 
    dw PLMEntries_MissileTank 
    db $27,$1B 
    dw $0049,$0000 

PLMPopulation_Pillar:
    dw $0000 

PLMPopulation_Plowerhouse:
    dw $0000 

PLMPopulation_WorstRoomInTheGame:
    dw PLMEntries_ScrollPLM 
    db $03,$10 
    dw RoomPLM_WorstRoomInTheGame_0 
    dw PLMEntries_rightwardsExtension 
    db $04,$10 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $05,$10 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $06,$10 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $07,$10 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $08,$10 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $09,$10 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $0A,$10 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $0B,$10 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $0C,$10 
    dw $8000,$0000 

PLMPopulation_Amphitheatre:
    dw $0000 

PLMPopulation_LNSpringBallMaze:
    dw PLMEntries_ScrollPLM 
    db $0C,$09 
    dw RoomPLM_LNSpringBallMaze_0 
    dw PLMEntries_upwardsExtension 
    db $0C,$08 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $0C,$07 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $0C,$06 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $03,$12 
    dw RoomPLM_LNSpringBallMaze_4 
    dw PLMEntries_rightwardsExtension 
    db $04,$12 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $05,$12 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $06,$12 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $07,$12 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $08,$12 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $09,$12 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $0A,$12 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $2F,$03 
    dw RoomPLM_LNSpringBallMaze_C 
    dw PLMEntries_MissileTank 
    db $2B,$07 
    dw $004A,$0000 

PLMPopulation_LNEscapePowerBombs:
    dw PLMEntries_PowerBombTank 
    dw $080C,$004B,$0000 

PLMPopulation_RedKihunterShaft:
    dw PLMEntries_ScrollPLM 
    db $11,$48 
    dw RoomPLM_RedKihunterShaft_0_4 
    dw PLMEntries_rightwardsExtension 
    dw $4609,$8000 
    dw PLMEntries_upwardsExtension 
    dw $4608,$8000 
    dw PLMEntries_ScrollPLM 
    dw $4708 
    dw RoomPLM_RedKihunterShaft_3_5 
    dw PLMEntries_ScrollPLM 
    dw $481F 
    dw RoomPLM_RedKihunterShaft_0_4 
    dw PLMEntries_ScrollPLM 
    dw $4824 
    dw RoomPLM_RedKihunterShaft_3_5 
    dw PLMEntries_ScrollPLM 
    dw $0E06 
    dw RoomPLM_RedKihunterShaft_6 
    dw PLMEntries_rightwardsExtension 
    dw $0E07,$8000 
    dw PLMEntries_rightwardsExtension 
    dw $0E08,$8000 
    dw PLMEntries_rightwardsExtension 
    dw $0E09,$8000 
    dw PLMEntries_ScrollPLM 
    dw $0B06 
    dw RoomPLM_RedKihunterShaft_A 
    dw PLMEntries_rightwardsExtension 
    dw $0B07,$8000 
    dw PLMEntries_rightwardsExtension 
    dw $0B08,$8000 
    dw PLMEntries_rightwardsExtension 
    dw $0B09,$8000 
    dw PLMEntries_yellowDoorFacingUp 
    dw $4D26,$005E,$0000 

PLMPopulation_Wasteland:
    dw PLMEntries_ScrollPLM 
    db $17,$0D 
    dw RoomPLM_Wasteland_0 
    dw PLMEntries_rightwardsExtension 
    db $18,$0D 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $15,$08 
    dw RoomPLM_Wasteland_2 
    dw PLMEntries_rightwardsExtension 
    db $16,$08 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $17,$08 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $18,$08 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $19,$08 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $1A,$08 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $4F,$09 
    dw RoomPLM_Wasteland_8_C 
    dw PLMEntries_ScrollPLM 
    db $51,$09 
    dw RoomPLM_Wasteland_9_B 
    dw PLMEntries_ScrollPLM 
    db $0F,$0B 
    dw RoomPLM_Wasteland_A 
    dw PLMEntries_ScrollPLM 
    db $3C,$09 
    dw RoomPLM_Wasteland_9_B 
    dw PLMEntries_ScrollPLM 
    db $3F,$09 
    dw RoomPLM_Wasteland_8_C 
    dw PLMEntries_ScrollPLM 
    db $14,$07 
    dw RoomPLM_Wasteland_D 
    dw PLMEntries_upwardsExtension 
    db $14,$06 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $14,$05 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $14,$04 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $09,$09 
    dw RoomPLM_Wasteland_11 
    dw PLMEntries_upwardsExtension 
    db $09,$08 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $09,$07 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $09,$06 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $09,$05 
    dw $8000 
    dw PLMEntries_greenDoorFacingRight 
    db $11,$26 
    dw $005F 
    dw PLMEntries_PowerBombTank 
    db $07,$08 
    dw $004C,$0000 

PLMPopulation_MetalPirates:
    dw PLMEntries_greyDoorFacingRight 
    db $01,$06 
    dw $0C60,$0000 

PLMPopulation_ThreeMusketeers:
    dw PLMEntries_ScrollPLM 
    db $0B,$2A 
    dw RoomPLM_ThreeMusketeers_0 
    dw PLMEntries_upwardsExtension 
    db $0B,$29 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $0B,$28 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $0B,$27 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $0B,$26 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $0B,$25 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $0F,$2A 
    dw RoomPLM_ThreeMusketeers_6 
    dw PLMEntries_ScrollPLM 
    db $14,$2A 
    dw RoomPLM_ThreeMusketeers_7 
    dw PLMEntries_MissileTank 
    db $08,$29 
    dw $004D,$0000 

PLMPopulation_RidleyETank:
    dw PLMEntries_EnergyTankShotBlock 
    db $0E,$0B 
    dw $004E,$0000 

PLMPopulation_ScrewAttack:
    dw PLMEntries_ScrewAttackChozoOrb 
    db $0B,$28 
    dw $004F,$0000 

PLMPopulation_LNFireflea:
    dw PLMEntries_upwardsExtension 
    db $1F,$36 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $1F,$37 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $1F,$38 
    dw RoomPLM_LNFireflea_2 
    dw PLMEntries_rightwardsExtension 
    db $2D,$39 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $2C,$39 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $2B,$39 
    dw RoomPLM_LNFireflea_5 
    dw PLMEntries_upwardsExtension 
    db $0F,$06 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $0F,$07 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $0F,$08 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $0F,$09 
    dw RoomPLM_LNFireflea_9 
    dw PLMEntries_rightwardsExtension 
    db $1B,$0B 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $1A,$0B 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $19,$0B 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $18,$0B 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $17,$0B 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $16,$0B 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $15,$0B 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $14,$0B 
    dw RoomPLM_LNFireflea_11 
    dw PLMEntries_EnergyTank 
    db $2A,$51 
    dw $0050,$0000 

PLMPopulation_LNSave:
    dw PLMEntries_saveStation 
    db $07,$0B 
    dw $0005,$0000 

SetupASM_ClearBlocksAfterSavingAnimalsAndShakeScreen:
    JSL.L Spawn_Hardcoded_PLM 
    db $3D,$0B 
    dw PLMEntries_ClearCrateriaMainstreetEscapePassageIfCrittersEsc 
    LDA.W #$0018 : STA.W $183E 
    LDA.W #$FFFF : STA.W $1840 
    RTS 


SetupASM_AutoDestroyWallDuringEscape:
    JSL.L Spawn_Hardcoded_PLM 
    db $10,$87 
    dw PLMEntries_MakeOldTourianEscapeShaftFakeWallExplode 
    RTS 


SetupASM_TurnWallIntoShotBlocksDuringEscape:
    JSL.L Spawn_Hardcoded_PLM 
    db $0F,$0A 
    dw PLMEntries_CrittersEscapeBlock 
    RTS 


RTS_8F91BB:
    RTS 


RTS_8F91BC:
    RTS 


SetupASM_ShakeScreenAndCall88A7D8DuringEscape:
    LDA.W #$0006 : STA.W $183E 
    LDA.W #$FFFF : STA.W $1840 

SetupASM_ScrollingSkyLand:
    JSL.L FXType_20_ScrollingSky_RoomSetupASM_ScrollingSkyLand 
    RTS 


SetupASM_ScrollingSkyOcean:
    JSL.L RoomSetupASM_ScrollingSkyOcean 

RTS_8F91D2:
    RTS 


RTS_8F91D3:
    RTS 


RTS_8F91D4:
    RTS 


RTS_8F91D5:
    RTS 


RTS_8F91D6:
    RTS 


SetupASM_RunStatueUnlockingAnimations:
    LDY.W #AnimatedTilesObject_TourianStatueKraid 
    JSL.L Spawn_AnimatedTilesObject 
    LDY.W #AnimatedTilesObject_TourianStatuePhantoon 
    JSL.L Spawn_AnimatedTilesObject 
    LDY.W #AnimatedTilesObject_TourianStatueDraygon 
    JSL.L Spawn_AnimatedTilesObject 
    LDY.W #AnimatedTilesObject_TourianStatueRidley 
    JSL.L Spawn_AnimatedTilesObject 
    RTS 


RTS_8F91F4:
    RTS 


RTS_8F91F5:
    RTS 


RTS_8F91F6:
    RTS 


RTS_8F91F7:
    RTS 


RoomHeader_LandingSite:
    db $00,$00,$17,$00,$09,$05,$70,$A0,$00 
    dw RoomDoors_LandingSite 
    dw RoomStateCheck_EventHasBeenSet 
    db $0E 
    dw RoomState_LandingSite_3 
    dw RoomStateCheck_PowerBombs 
    dw RoomState_LandingSite_2 
    dw RoomStateCheck_EventHasBeenSet 
    db $00 
    dw RoomState_LandingSite_1 
    dw Use_StatePointer_inX 

RoomState_LandingSite_0:
    dl LevelData_LandingSite 
    db $00,$06,$05 
    dw FXHeader_LandingSite_State0_1 
    dw EnemyPopulations_LandingSite_0_1_2 
    dw EnemySets_LandingSite_0_1_2 
    dw $0181,$9283,$0000 
    dw MainASM_ScrollingSkyLand 
    dw PLMPopulation_LandingSite_State0_1_2 
    dw LibBG_ScrollingSky_Tilemaps_LandingSite 
    dw SetupASM_ScrollingSkyLand 

RoomState_LandingSite_1:
    dl LevelData_LandingSite 
    db $00,$06,$06 
    dw FXHeader_LandingSite_State0_1 
    dw EnemyPopulations_LandingSite_0_1_2 
    dw EnemySets_LandingSite_0_1_2 
    dw $0181,$9283,$0000 
    dw MainASM_ScrollingSkyLand 
    dw PLMPopulation_LandingSite_State0_1_2 
    dw LibBG_ScrollingSky_Tilemaps_LandingSite 
    dw SetupASM_ScrollingSkyLand 

RoomState_LandingSite_2:
    dl LevelData_LandingSite 
    db $00,$0C,$05 
    dw FXHeader_LandingSite_State2 
    dw EnemyPopulations_LandingSite_0_1_2 
    dw EnemySets_LandingSite_0_1_2 
    dw $0181,$9283,$0000 
    dw MainASM_ScrollingSkyLand 
    dw PLMPopulation_LandingSite_State0_1_2 
    dw LibBG_ScrollingSky_Tilemaps_LandingSite 
    dw SetupASM_ScrollingSkyLand 

RoomState_LandingSite_3:
    dl LevelData_LandingSite 
    db $00,$00,$00 
    dw FXHeader_LandingSite_State3 
    dw EnemyPopulations_LandingSite_3 
    dw EnemySets_LandingSite_3 
    dw $0181,$9283,$0000 
    dw MainASM_ScrollingSkyLand_ZebesTimebombSet 
    dw PLMPopulation_LandingSite_State3 
    dw LibBG_ScrollingSky_Tilemaps_LandingSite 
    dw SetupASM_ShakeScreenAndCall88A7D8DuringEscape 

RoomDoors_LandingSite:
    dw Door_LandingSite_0 
    dw Door_LandingSite_1 
    dw Door_LandingSite_2 
    dw Door_LandingSite_3 

RoomScrolls_LandingSite:
    db $00,$00,$02,$02,$02,$02,$02,$02,$02,$00,$00,$02,$02,$02,$02,$02 
    db $02,$02,$01,$00,$02,$02,$02,$02,$02,$02,$02,$00,$00,$02,$02,$02 
    db $02,$02,$02,$02,$01,$01,$01,$01,$01,$01,$01,$01,$01 

RoomPLM_LandingSite_0:
    db $13,$01,$80 

RoomHeader_GauntletEntrance:
    db $01,$00,$12,$02,$05,$01,$70,$A0,$00 
    dw RoomDoors_GauntletEntrance 
    dw RoomStateCheck_EventHasBeenSet 
    db $00 
    dw RoomState_GauntletEntrance_1 
    dw Use_StatePointer_inX 

RoomState_GauntletEntrance_0:
    dl LevelData_GauntletEntrance 
    db $00,$00,$00 
    dw FXHeader_GauntletEntrance_State0_1 
    dw EnemyPopulations_GauntletEntrance 
    dw EnemySets_GauntletEntrance 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_GauntletEntrance_State0_1 
    dw LibBG_Crateria_0_HorizontalPatternRocks 
    dw RTS_8F91D3 

RoomState_GauntletEntrance_1:
    dl LevelData_GauntletEntrance 
    db $00,$09,$05 
    dw FXHeader_GauntletEntrance_State0_1 
    dw EnemyPopulations_GauntletEntrance 
    dw EnemySets_GauntletEntrance 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_GauntletEntrance_State0_1 
    dw LibBG_Crateria_0_HorizontalPatternRocks 
    dw RTS_8F91D3 

RoomDoors_GauntletEntrance:
    dw Door_GauntletEntrance_0 
    dw Door_GauntletEntrance_1 

RoomHeader_Parlor:
    db $02,$00,$12,$04,$05,$05,$70,$A0,$00 
    dw RoomDoors_Parlor 
    dw RoomStateCheck_EventHasBeenSet 
    db $0E 
    dw RoomState_Parlor_2 
    dw RoomStateCheck_EventHasBeenSet 
    db $00 
    dw RoomState_Parlor_1 
    dw Use_StatePointer_inX 

RoomState_Parlor_0:
    dl LevelData_Parlor 
    db $00,$00,$00 
    dw FXHeader_Parlor_State0 
    dw EnemyPopulations_Parlor_0 
    dw EnemySets_Parlor_0 
    db $C1,$C1 
    dw RoomScrolls_Parlor 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Parlor_State0_1 
    dw LibBG_Crateria_0_Rocks 
    dw RTS_8F91D3 

RoomState_Parlor_1:
    dl LevelData_Parlor 
    db $00,$09,$05 
    dw FXHeader_Parlor_State1 
    dw EnemyPopulations_Parlor_1 
    dw EnemySets_Parlor_1 
    db $C1,$C1 
    dw RoomScrolls_Parlor 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Parlor_State0_1 
    dw LibBG_Crateria_0_Rocks 
    dw RTS_8F91BC 

RoomState_Parlor_2:
    dl LevelData_Parlor 
    db $00,$00,$00 
    dw FXHeader_Parlor_State2 
    dw EnemyPopulations_Parlor_2 
    dw EnemySets_Parlor_2 
    db $C1,$C1 
    dw RoomScrolls_Parlor 
    dw $0000 
    dw MainASM_SetScreenShaking_GenerateRandomExplosions 
    dw PLMPopulation_Parlor_State2 
    dw LibBG_Crateria_0_Rocks 
    dw SetupASM_ClearBlocksAfterSavingAnimalsAndShakeScreen 

RoomDoors_Parlor:
    dw Door_Parlor_0 
    dw Door_Parlor_1 
    dw Door_Parlor_2 
    dw Door_Parlor_3 
    dw Door_Parlor_4 
    dw Door_Parlor_5 
    dw Door_Parlor_6 

RoomScrolls_Parlor:
    db $00,$01,$01,$01,$01,$00,$00,$00,$00,$00,$00,$02,$00,$01,$00,$00 
    db $02,$00,$00,$00,$00,$02,$00,$00,$00 

RoomPLM_Parlor_0:
    db $08,$02,$80 

RoomPLM_Parlor_1:
    db $08,$00,$80 

RoomPLM_Parlor_2:
    db $00,$00,$02,$00,$06,$02,$80 

RoomPLM_Parlor_6:
    db $06,$00,$80 

RoomPLM_Parlor_A:
    db $00,$01,$80 

RoomPLM_Parlor_D:
    db $02,$01,$80 

RoomPLM_Parlor_13_14:
    db $04,$01,$80 

RoomPLM_Parlor_15:
    db $04,$00,$80 

RoomPLM_Parlor_1A:
    db $04,$00,$08,$02,$80 

RoomHeader_CrateriaPowerBombs:
    db $03,$00,$20,$01,$02,$01,$70,$A0,$00 
    dw RoomDoors_CrateriaPowerBombs 
    dw Use_StatePointer_inX 

RoomState_CrateriaPowerBombs:
    dl LevelData_CrateriaPowerBombs 
    db $00,$00,$00 
    dw FXHeader_CrateriaPowerBombs 
    dw EnemyPopulations_CrateriaPowerBombs 
    dw EnemySets_CrateriaPowerBombs 
    db $C1,$C1 
    dw RoomScrolls_CrateriaPowerBomb 
    dw $0000 
    dw MainASM_ScrollingSkyLand 
    dw PLMPopulation_CrateriaPowerBombs 
    dw LibBG_Crateria_0_Rocks 
    dw RTS_8F91D3 

RoomDoors_CrateriaPowerBombs:
    dw Door_CrateriaPowerBombs_0 

RoomScrolls_CrateriaPowerBomb:
    db $01,$01 

RoomHeader_CrateriaSave:
    db $04,$00,$12,$06,$01,$01,$70,$A0,$00 
    dw RoomDoors_CrateriaSave 
    dw Use_StatePointer_inX 

RoomState_CrateriaSave:
    dl LevelData_SaveStation_RightSideDoor 
    db $19,$09,$05 
    dw FXHeader_CrateriaSave 
    dw EnemyPopulations_CrateriaSave 
    dw EnemySets_CrateriaSave 
    db $00,$00 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_CrateriaSave 
    dw $0000 
    dw RTS_8F91D3 

RoomDoors_CrateriaSave:
    dw Door_CrateriaSave_0 

RoomHeader_WestOcean:
    db $05,$00,$26,$00,$08,$06,$90,$A0,$00 
    dw RoomDoors_WestOcean 
    dw Use_StatePointer_inX 

RoomState_WestOcean:
    dl LevelData_WestOcean 
    db $00,$0C,$05 
    dw FXHeader_WestOcean 
    dw EnemyPopulations_WestOcean 
    dw EnemySets_WestOcean 
    db $81,$01 
    dw RoomScrolls_WestOcean 
    dw $0000 
    dw MainASM_ScrollingSkyOcean 
    dw PLMPopulation_WestOcean 
    dw LibBG_ScrollingSky_Tilemaps_WreckedShipEntrance 
    dw SetupASM_ScrollingSkyOcean 

RoomDoors_WestOcean:
    dw Door_WestOcean_0 
    dw Door_WestOcean_1 
    dw Door_WestOcean_2 
    dw Door_WestOcean_3 
    dw Door_WestOcean_4 
    dw Door_WestOcean_5 

RoomScrolls_WestOcean:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02 
    db $02,$02,$02,$00,$00,$02,$00,$00,$02,$02,$02,$02,$02,$02,$00,$00 
    db $02,$02,$02,$02,$02,$02,$02,$02,$01,$01,$01,$01,$01,$01,$01,$01 

RoomHeader_BowlingAlleyPath:
    db $06,$00,$29,$02,$02,$01,$70,$A0,$00 
    dw RoomDoors_BowlingAlleyPath 
    dw Use_StatePointer_inX 

RoomState_BowlingAlleyPath:
    dl LevelData_BowlingAlleyPath 
    db $00,$00,$00 
    dw FXHeader_BowlingAlleyPath 
    dw EnemyPopulations_BowlingAlleyPath 
    dw EnemySets_BowlingAlleyPath 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_BowlingAlleyPath 
    dw LibBG_Crateria_0_HorizontalPatternRocks 
    dw RTS_8F91D3 

RoomDoors_BowlingAlleyPath:
    dw Door_BowlingAlleyPath_0 
    dw Door_BowlingAlleyPath_1 

RoomHeader_CrateriaKihunter:
    db $07,$00,$21,$04,$03,$03,$70,$A0,$00 
    dw RoomDoors_CrateriaKihunter 
    dw Use_StatePointer_inX 

RoomState_CrateriaKihunter:
    dl LevelData_CrateriaKihunter 
    db $00,$00,$05 
    dw FXHeader_CrateriaKihunters 
    dw EnemyPopulations_CrateriaKihunter 
    dw EnemySets_CrateriaKihunter 
    db $C1,$C1 
    dw RoomScroll_CrateriaKihunter 
    dw $0000 
    dw $0000 
    dw PLMPopulation_CrateriaKihunter 
    dw LibBG_Crateria_0_Rocks 
    dw RTS_8F91D3 

RoomDoors_CrateriaKihunter:
    dw Door_CrateriaKihunter_0 
    dw Door_CrateriaKihunter_1 
    dw Door_CrateriaKihunter_2 

RoomScroll_CrateriaKihunter:
    db $01,$01,$01,$00,$00,$00,$00,$02,$00 

RoomPLM_CrateriaKihunter_0:
    db $01,$02,$04,$02,$80 

RoomPLM_CrateriaKihunter_2:
    db $01,$01,$04,$00,$80 

RoomHeader_ForgottenHighwayElev:
    db $08,$00,$34,$0A,$01,$01,$70,$A0,$00 
    dw RoomDoors_ForgottenHighwayElev 
    dw Use_StatePointer_inX 

RoomState_ForgottenHighwayElev:
    dl LevelData_ForgottenHighwayElev 
    db $02,$09,$03 
    dw FXHeader_ForgottenHighwayElev 
    dw EnemyPopulations_ForgottenHighwayElev 
    dw EnemySets_ForgottenHighwayElev 
    db $C1,$C1 
    dw RoomScrolls_ForgottenHighwayElev 
    dw $0000 
    dw $0000 
    dw PLMPopulation_ForgottenHighwayElev 
    dw LibBG_Crateria_2_Elevator 
    dw RTS_8F91D3 

RoomDoors_ForgottenHighwayElev:
    dw Door_ForgottenHighwayElev_0 
    dw Door_ForgottenHighwayElev_1 
    dw Door_VariousRooms_Elevator 

RoomScrolls_ForgottenHighwayElev:
    db $01 

RoomPLM_ForgottenHighwayElev_0:
    db $00,$02,$80 

RoomHeader_EastOcean:
    db $09,$00,$31,$00,$07,$06,$70,$A0,$00 
    dw RoomDoors_EastOcean 
    dw Use_StatePointer_inX 

RoomState_EastOcean:
    dl LevelData_EastOcean 
    db $00,$0C,$05 
    dw FXHeader_EastOcean 
    dw EnemyPopulations_EastOcean 
    dw EnemySets_EastOcean 
    db $81,$01 
    dw RoomScrolls_EastOcean 
    dw $0000 
    dw MainASM_ScrollingSkyOcean 
    dw PLMPopulation_EastOcean 
    dw LibBG_ScrollingSky_Tilemaps_EastOcean 
    dw SetupASM_ScrollingSkyOcean 

RoomDoors_EastOcean:
    dw Door_EastOcean_0 
    dw Door_EastOcean_1 

RoomScrolls_EastOcean:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$02,$02,$02,$02 
    db $02,$02,$02,$01,$01,$01,$01,$01,$01,$01 

RoomHeader_ForgottenHighwayKagos:
    db $0A,$00,$38,$04,$01,$04,$70,$A0,$00 
    dw RoomDoors_ForgottenHighwayKagos 
    dw Use_StatePointer_inX 

RoomState_ForgottenHighwayKagos:
    dl LevelData_ForgottenHighwayKagos 
    db $00,$00,$00 
    dw FXHeader_ForgottenHighwayKagos 
    dw EnemyPopulations_ForgottenHighwayKagos 
    dw EnemySets_ForgottenHighwayKagos 
    db $C1,$C1 
    dw $0001 
    dw $0000 
    dw $0000 
    dw PLMPopulation_ForgottenHighwayKagos 
    dw LibBG_Crateria_0_VerticalPatternRocks 
    dw RTS_8F91D3 

RoomDoors_ForgottenHighwayKagos:
    dw Door_ForgottenHighwayKagos_0 
    dw Door_ForgottenHighwayKagos_1 

RoomHeader_CrabMaze:
    db $0B,$00,$35,$08,$04,$02,$90,$A0,$00 
    dw RoomDoors_CrabMaze 
    dw Use_StatePointer_inX 

RoomState_CrabMaze:
    dl LevelData_CrabMaze 
    db $00,$00,$00 
    dw FXHeader_CrabMaze 
    dw EnemyPopulations_CrabMaze 
    dw EnemySets_CrabMaze 
    db $C1,$C1 
    dw $0001 
    dw $0000 
    dw $0000 
    dw PLMPopulation_CrabMaze 
    dw LibBG_Crateria_0_Rocks 
    dw RTS_8F91D3 

RoomDoors_CrabMaze:
    dw Door_CrabMaze_0 
    dw Door_CrabMaze_1 

RoomHeader_ForgottenHighwayElbow:
    db $0C,$00,$34,$09,$01,$01,$70,$A0,$00 
    dw RoomDoors_ForgottenHighwayElbow 
    dw Use_StatePointer_inX 

RoomState_ForgottenHighwayElbow:
    dl LevelData_ForgottenHighwayElbow 
    db $00,$00,$05 
    dw FXHeader_ForgottenHighwayElbow 
    dw EnemyPopulations_ForgottenHighwayElbow 
    dw EnemySets_ForgottenHighwayElbow 
    db $C1,$C1 
    dw RoomScrolls_ForgottenHighwayElbow 
    dw $0000 
    dw $0000 
    dw PLMPopulation_ForgottenHighwayElbow 
    dw LibBG_Crateria_0_VerticalPatternRocks 
    dw RTS_8F91D3 

RoomDoors_ForgottenHighwayElbow:
    dw Door_ForgottenHighwayElbow_0 
    dw Door_ForgottenHighwayElbow_1 

RoomScrolls_ForgottenHighwayElbow:
    db $02 

RoomHeader_CrateriaTube:
    db $0D,$00,$20,$04,$01,$01,$70,$A0,$00 
    dw RoomDoors_CrateriaTube 
    dw Use_StatePointer_inX 

RoomState_CrateriaTube:
    dl LevelData_CrateriaTube 
    db $00,$00,$00 
    dw FXHeader_CrateriaTube 
    dw EnemyPopulations_CrateriaTube 
    dw EnemySets_CrateriaTube 
    db $00,$00 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_CrateriaTube 
    dw $0000 
    dw RTS_8F91D3 

RoomDoors_CrateriaTube:
    dw Door_CrateriaTube_0 
    dw Door_CrateriaTube_1 

RoomHeader_Moat:
    db $0E,$00,$24,$04,$02,$02,$90,$A0,$00 
    dw RoomDoors_Moat 
    dw Use_StatePointer_inX 

RoomState_Moat:
    dl LevelData_Moat 
    db $00,$00,$00 
    dw FXHeader_Moat 
    dw EnemyPopulations_Moat 
    dw EnemySets_Moat 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Moat 
    dw LibBG_Crateria_0_Rocks 
    dw RTS_8F91D3 

RoomDoors_Moat:
    dw Door_Moat_0 
    dw Door_Moat_1 

RoomHeader_RedBinstarElev:
    db $0F,$00,$22,$07,$01,$01,$70,$A0,$00 
    dw RoomDoors_RedBinstarElev 
    dw Use_StatePointer_inX 

RoomState_RedBinstarElev:
    dl LevelData_RedBinstarElev 
    db $02,$00,$03 
    dw FXHeader_RedBrinstarElev 
    dw EnemyPopulations_RedBinstarElev 
    dw EnemySets_RedBinstarElev 
    db $C1,$C1 
    dw RoomScrolls_RedBinstarElev 
    dw $0000 
    dw $0000 
    dw PLMPopulation_RedBinstarElev 
    dw LibBG_Crateria_2_Elevator 
    dw RTS_8F91D3 

RoomDoors_RedBinstarElev:
    dw Door_RedBinstarElev_0 
    dw Door_RedBinstarElev_1 
    dw Door_VariousRooms_Elevator 

RoomScrolls_RedBinstarElev:
    db $01 

RoomPLM_RedBinstarElev_0:
    db $00,$02,$80 

RoomHeader_GauntletETank:
    db $10,$00,$0C,$02,$06,$01,$70,$A0,$00 
    dw RoomDoors_GauntletETank 
    dw Use_StatePointer_inX 

RoomState_GauntletETank:
    dl LevelData_GauntletETank 
    db $00,$00,$00 
    dw FXHeader_GauntletETank 
    dw EnemyPopulations_GauntletETank 
    dw EnemySets_GauntletETank 
    db $C1,$C1 
    dw RoomScrolls_GauntletETank 
    dw $0000 
    dw $0000 
    dw PLMPopulation_GauntletETank 
    dw LibBG_Crateria_0_HorizontalPatternRocks 
    dw RTS_8F91D3 

RoomDoors_GauntletETank:
    dw Door_GauntletETank_0 
    dw Door_GauntletETank_1 

RoomScrolls_GauntletETank:
    db $01,$01,$01,$01,$00,$01 

RoomPLM_GauntletETank_0:
    db $04,$01,$80 

RoomHeader_PreBowling:
    db $11,$00,$2B,$02,$01,$01,$70,$A0,$00 
    dw RoomDoors_PreBowling 
    dw Use_StatePointer_inX 

RoomState_PreBowling:
    dl LevelData_PreBowling 
    db $00,$0C,$05 
    dw FXHeader_PreBowling 
    dw EnemyPopulations_PreBowling 
    dw EnemySets_PreBowling 
    db $81,$01 
    dw $0000 
    dw $0000 
    dw MainASM_ScrollingSkyOcean 
    dw PLMPopulation_PreBowling 
    dw LibBG_ScrollingSky_Tilemaps_BowlingAlley 
    dw SetupASM_ScrollingSkyOcean 

RoomDoors_PreBowling:
    dw Door_PreBowling_0 
    dw Door_PreBowling_1 

RoomHeader_Climb:
    db $12,$00,$12,$09,$03,$09,$70,$A0,$00 
    dw RoomDoors_Climb 
    dw RoomStateCheck_EventHasBeenSet 
    db $0E 
    dw RoomState_Climb_2 
    dw RoomStateCheck_EventHasBeenSet 
    db $00 
    dw RoomState_Climb_1 
    dw Use_StatePointer_inX 

RoomState_Climb_0:
    dl LevelData_Climb 
    db $03,$00,$00 
    dw FXHeader_Climb_State0 
    dw EnemyPopulations_Climb_0 
    dw EnemySets_Climb_0 
    db $C1,$C1 
    dw RoomScrolls_Climb 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Climb_State_0_1 
    dw LibBG_Crateria_2_3_Mechanical 
    dw RTS_8F91D4 

RoomState_Climb_1:
    dl LevelData_Climb 
    db $02,$09,$05 
    dw FXHeader_Climb_State1 
    dw EnemyPopulations_Climb_1 
    dw EnemySets_Climb_1 
    db $C1,$C1 
    dw RoomScrolls_Climb 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Climb_State_0_1 
    dw LibBG_Crateria_2_3_Mechanical 
    dw RTS_8F91BC 

RoomState_Climb_2:
    dl LevelData_Climb 
    db $02,$24,$07 
    dw FXHeader_Climb_State2 
    dw EnemyPopulations_Climb_2 
    dw EnemySets_Climb_2 
    db $C1,$C1 
    dw RoomScrolls_Climb 
    dw $0000 
    dw MainASM_SetScreenShaking_GenerateRandomExplosions 
    dw PLMPopulation_Climb_State2 
    dw LibBG_Crateria_2_3_Mechanical 
    dw SetupASM_AutoDestroyWallDuringEscape 

RoomDoors_Climb:
    dw Door_Climb_0 
    dw Door_Climb_1 
    dw Door_Climb_2 
    dw Door_Climb_3 
    dw Door_Climb_4 

RoomScrolls_Climb:
    db $00,$02,$00,$00,$02,$00,$00,$02,$00,$00,$02,$00,$00,$02,$00,$00 
    db $02,$00,$00,$02,$00,$00,$02,$00,$00,$01,$00 

RoomPLM_Climb_1:
    db $02,$01,$80 

RoomPLM_Climb_0:
    db $02,$00,$80 

RoomPLM_Climb_3:
    db $17,$01,$80 

RoomPLM_Climb_2:
    db $17,$00,$80 

RoomPLM_Climb_E:
    db $18,$01,$80 

RoomPLM_Climb_A:
    db $18,$00,$80 

RoomPLM_Climb_12:
    db $19,$01,$80 

RoomPLM_Climb_16:
    db $19,$00,$80 

RoomHeader_Pit:
    db $13,$00,$14,$11,$03,$02,$70,$A0,$00 
    dw RoomDoors_Pit 
    dw RoomStateCheck_MorphballAndMissiles 
    dw RoomState_Pit_1 
    dw Use_StatePointer_inX 

RoomState_Pit_0:
    dl LevelData_Pit 
    db $03,$00,$05 
    dw FXHeader_Pit_State0 
    dw EnemyPopulations_Pit_0 
    dw EnemySets_Pit_0 
    db $C1,$C1 
    dw RoomScrolls_Pit 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Pit_0 
    dw LibBG_Crateria_2_3_Mechanical 
    dw RTS_8F91D4 

RoomState_Pit_1:
    dl LevelData_Pit 
    db $02,$09,$05 
    dw FXHeader_Pit_State1 
    dw EnemyPopulations_Pit_1 
    dw EnemySets_Pit_1 
    db $C1,$C1 
    dw RoomScrolls_Pit 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Pit_1 
    dw LibBG_Crateria_2_3_Mechanical 
    dw RTS_8F91BC 

RoomDoors_Pit:
    dw Door_Pit_0 
    dw Door_Pit_1 

RoomScrolls_Pit:
    db $01,$01,$01,$00,$00,$00 

RoomPLM_Pit_0_1:
    db $00,$02,$03,$02,$80 

RoomPLM_Pit_2:
    db $00,$01,$03,$00,$80 

RoomHeader_ElevToBlueBrinstar:
    db $14,$00,$17,$11,$01,$01,$70,$A0,$00 
    dw RoomDoors_ElevToBlueBrinstar 
    dw RoomStateCheck_MorphballAndMissiles 
    dw RoomState_ElevToBlueBrinstar_1 
    dw Use_StatePointer_inX 

RoomState_ElevToBlueBrinstar_0:
    dl LevelData_ElevToBlueBrinstar 
    db $02,$06,$05 
    dw FXHeader_ElevToBlueBrinstar_State0 
    dw EnemyPopulations_ElevToBlueBrinstar 
    dw EnemySets_ElevToBlueBrinstar 
    db $00,$00 
    dw RoomScrolls_ElevToBlueBrinstar 
    dw $0000 
    dw $0000 
    dw PLMPopulation_ElevToBlueBrinstar_State0_1 
    dw $0000 
    dw RTS_8F91D4 

RoomState_ElevToBlueBrinstar_1:
    dl LevelData_ElevToBlueBrinstar 
    db $02,$00,$03 
    dw FXHeader_ElevToBlueBrinstar_State1 
    dw EnemyPopulations_ElevToBlueBrinstar 
    dw EnemySets_ElevToBlueBrinstar 
    db $00,$00 
    dw RoomScrolls_ElevToBlueBrinstar 
    dw $0000 
    dw $0000 
    dw PLMPopulation_ElevToBlueBrinstar_State0_1 
    dw $0000 
    dw RTS_8F91BC 

RoomDoors_ElevToBlueBrinstar:
    dw Door_ElevToBlueBrinstar_0 
    dw Door_ElevToBlueBrinstar_1 
    dw Door_VariousRooms_Elevator 

RoomScrolls_ElevToBlueBrinstar:
    db $01 

RoomPLM_ElevToBlueBrinstar:
    db $00,$02,$80 

RoomHeader_BombTorizo:
    db $15,$00,$19,$06,$01,$01,$70,$A0,$00 
    dw RoomDoors_BombTorizo 
    dw RoomStateCheck_EventHasBeenSet 
    db $0E 
    dw RoomState_BombTorizo_2 
    dw RoomStateCheck_BossIsDead 
    db $04 
    dw RoomState_BombTorizo_1 
    dw Use_StatePointer_inX 

RoomState_BombTorizo_0:
    dl LevelData_BombTorizo 
    db $02,$24,$03 
    dw FXHeader_BombTorizo_State0_1 
    dw EnemyPopulations_BombTorizo_0_1 
    dw EnemySets_BombTorizo_0_1 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_BombTorizo_State0_1 
    dw LibBG_Crateria_2_3_Mechanical 
    dw RTS_8F91D4 

RoomState_BombTorizo_1:
    dl LevelData_BombTorizo 
    db $02,$00,$03 
    dw FXHeader_BombTorizo_State0_1 
    dw EnemyPopulations_BombTorizo_0_1 
    dw EnemySets_BombTorizo_0_1 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_BombTorizo_State0_1 
    dw LibBG_Crateria_2_3_Mechanical 
    dw RTS_8F91D4 

RoomState_BombTorizo_2:
    dl LevelData_BombTorizo 
    db $02,$00,$00 
    dw FXHeader_BombTorizo_State2 
    dw EnemyPopulations_BombTorizo_2 
    dw EnemySets_BombTorizo_2 
    db $C1,$C1 
    dw $0000 
    dw RoomVar_BombTorizo 
    dw MainASM_SetScreenShaking_GenerateRandomExplosions 
    dw PLMPopulation_BombTorizo_State2 
    dw LibBG_Crateria_2_3_Mechanical 
    dw SetupASM_TurnWallIntoShotBlocksDuringEscape 

RoomDoors_BombTorizo:
    dw Door_BombTorizo_0 

RoomVar_BombTorizo:
    db $0F,$0A,$52,$00,$0F,$0B,$52,$00,$0F,$0C,$52,$00,$00,$00 

RoomHeader_Flyway:
    db $16,$00,$16,$06,$03,$01,$70,$A0,$00 
    dw RoomDoors_Flyway 
    dw RoomStateCheck_EventHasBeenSet 
    db $0E 
    dw RoomState_Flyway_2 
    dw RoomStateCheck_BossIsDead 
    db $04 
    dw RoomState_Flyway_1 
    dw Use_StatePointer_inX 

RoomState_Flyway_0:
    dl LevelData_Flyway 
    db $02,$09,$05 
    dw FXHeader_Flyway_State0_1 
    dw EnemyPopulations_Flyway_0_1 
    dw EnemySets_Flyway_0_1 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Flyway_State0_1 
    dw LibBG_Crateria_2_BrickRoom_WallArt_Dark 
    dw RTS_8F91D4 

RoomState_Flyway_1:
    dl LevelData_Flyway 
    db $02,$09,$05 
    dw FXHeader_Flyway_State0_1 
    dw EnemyPopulations_Flyway_0_1 
    dw EnemySets_Flyway_0_1 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Flyway_State0_1 
    dw LibBG_Crateria_2_BrickRoom_WallArt_Dark 
    dw RTS_8F91D4 

RoomState_Flyway_2:
    dl LevelData_Flyway 
    db $02,$24,$07 
    dw FXHeader_Flyway_State2 
    dw EnemyPopulations_Flyway_2 
    dw EnemySets_Flyway_2 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw MainASM_SetScreenShaking_GenerateRandomExplosions 
    dw PLMPopulation_Flyway_State2 
    dw LibBG_Crateria_2_BrickRoom_WallArt_Dark 
    dw RTS_8F91BB 

RoomDoors_Flyway:
    dw Door_Flyway_0 
    dw Door_Flyway_1 

RoomHeader_PreMapFlyway:
    db $17,$00,$14,$07,$03,$01,$70,$A0,$00 
    dw RoomDoors_PreMapFlyway 
    dw Use_StatePointer_inX 

RoomState_PreMapFlyway:
    dl LevelData_PreMapFlyway 
    db $02,$00,$00 
    dw FXHeader_VariousRooms_8381C2 
    dw EnemyPopulations_PreMapFlyway 
    dw EnemySets_PreMapFlyway 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_PreMapFlyway 
    dw LibBG_Crateria_2_BrickRoom_WallArt 
    dw RTS_8F91D4 

RoomDoors_PreMapFlyway:
    dw Door_PreMapFlyway_0 
    dw Door_PreMapFlyway_1 

RoomHeader_Terminator:
    db $18,$00,$0C,$04,$06,$03,$A0,$A0,$00 
    dw RoomDoors_Terminator 
    dw Use_StatePointer_inX 

RoomState_Terminator:
    dl LevelData_Terminator 
    db $02,$00,$00 
    dw FXHeader_VariousRooms_8381C2 
    dw EnemyPopulations_Terminator 
    dw EnemySets_Terminator 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Terminator 
    dw LibBG_Crateria_2_PurpleRocks 
    dw RTS_8F91D4 

RoomDoors_Terminator:
    dw Door_Terminator_0 
    dw Door_Terminator_1 

RoomHeader_GreenBrinstarElev:
    db $19,$00,$06,$08,$01,$01,$70,$A0,$00 
    dw RoomDoors_GreenBrinstarElev 
    dw Use_StatePointer_inX 

RoomState_GreenBrinstarElev:
    dl LevelData_GreenBrinstarElev 
    db $02,$09,$03 
    dw FXHeader_VariousRooms_8381C2 
    dw EnemyPopulations_GreenBrinstarElev 
    dw EnemySets_GreenBrinstarElev 
    db $00,$00 
    dw RoomScrolls_GreenBrinstarElev 
    dw $0000 
    dw $0000 
    dw PLMPopulation_GreenBrinstarElev 
    dw $0000 
    dw RTS_8F91D4 

RoomDoors_GreenBrinstarElev:
    dw Door_GreenBrinstarElev_ 
    dw Door_GreenBrinstarElev_1 
    dw Door_VariousRooms_Elevator 

RoomScrolls_GreenBrinstarElev:
    db $01 

RoomPLM_GreenBrinstarElev_0:
    db $00,$02,$80 

RoomHeader_LowerMushrooms:
    db $1A,$00,$07,$08,$04,$01,$70,$A0,$00 
    dw RoomDoors_LowerMushrooms 
    dw Use_StatePointer_inX 

RoomState_LowerMushrooms:
    dl LevelData_LowerMushrooms 
    db $02,$00,$05 
    dw FXHeader_VariousRooms_8381C2 
    dw EnemyPopulations_LowerMushrooms 
    dw EnemySets_LowerMushrooms 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_LowerMushrooms 
    dw LibBG_Crateria_2_PurpleRocks 
    dw RTS_8F91D4 

RoomDoors_LowerMushrooms:
    dw Door_LowerMushrooms_0 
    dw Door_LowerMushrooms_1 

RoomHeader_CrateriaMap:
    db $1B,$00,$17,$07,$01,$01,$70,$A0,$00 
    dw RoomDoors_CrateriaMap 
    dw Use_StatePointer_inX 

RoomState_CrateriaMap:
    dl LevelData_MapStation_LeftSideDoor 
    db $15,$00,$00 
    dw FXHeader_VariousRooms_8381C2 
    dw EnemyPopulations_CrateriaMap 
    dw EnemySets_CrateriaMap 
    db $00,$00 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_CrateriaMap 
    dw $0000 
    dw RTS_8F91D4 

RoomDoors_CrateriaMap:
    dw Door_CrateriaMap_0 

RoomHeader_GreenPiratesShaft:
    db $1C,$00,$0B,$02,$01,$07,$70,$A0,$00 
    dw RoomDoors_GreenPiratesShaft 
    dw Use_StatePointer_inX 

RoomState_GreenPiratesShaft:
    dl LevelData_GreenPiratesShaft 
    db $02,$00,$05 
    dw FXHeader_VariousRooms_8381C2 
    dw EnemyPopulations_GreenPiratesShaft 
    dw EnemySets_GreenPiratesShaft 
    db $01,$C1 
    dw RoomScrolls_GreenPiratesShaft 
    dw $0000 
    dw $0000 
    dw PLMPopulation_GreenPiratesShaft 
    dw LibBG_Crateria_2_BrickRoom 
    dw RTS_8F91D4 

RoomDoors_GreenPiratesShaft:
    dw Door_GreenPiratesShaft_0 
    dw Door_GreenPiratesShaft_1 
    dw Door_GreenPiratesShaft_2 
    dw Door_GreenPiratesShaft_3 

RoomScrolls_GreenPiratesShaft:
    db $02,$02,$02,$00,$02,$02,$01 

RoomPLM_GreenPiratesShaft_0:
    db $03,$02,$80 

RoomPLM_GreenPiratesShaft_2:
    db $03,$00,$80 

RoomHeader_CrateriaSuper:
    db $1D,$00,$15,$09,$04,$08,$70,$A0,$00 
    dw RoomDoors_CrateriaSuper 
    dw Use_StatePointer_inX 

RoomState_CrateriaSuper:
    dl LevelData_CrateriaSuper 
    db $02,$00,$00 
    dw FXHeader_CrateriaSuper 
    dw EnemyPopulations_CrateriaSuper 
    dw EnemySets_CrateriaSuper 
    db $C1,$C1 
    dw RoomScrolls_CrateriaSuper 
    dw $0000 
    dw $0000 
    dw PLMPopulation_CrateriaSuper 
    dw LibBG_Crateria_2_3_Mechanical 
    dw RTS_8F91D4 

RoomDoors_CrateriaSuper:
    dw Door_CrateriaSuper_0 
    dw Door_CrateriaSuper_1 

RoomScrolls_CrateriaSuper:
    db $01,$01,$01,$02,$00,$00,$00,$02,$00,$00,$00,$02,$00,$00,$00,$02 
    db $00,$00,$00,$02,$00,$00,$00,$02,$00,$00,$00,$02,$01,$01,$01,$01 

RoomHeader_FinalMissileBombway:
    db $1E,$00,$11,$07,$02,$01,$70,$A0,$00 
    dw RoomDoors_FinalMissileBombway 
    dw RoomStateCheck_EventHasBeenSet 
    db $00 
    dw RoomState_FinalMissileBombway_1 
    dw Use_StatePointer_inX 

RoomState_FinalMissileBombway_0:
    dl LevelData_FinalMissileBombway 
    db $02,$00,$00 
    dw FXHeader_FinalMissileBombway_State0 
    dw EnemyPopulations_FinalMissileBombway_0 
    dw EnemySets_FinalMissileBombway_0 
    db $C1,$C1 
    dw RoomScrolls_FinalMissileBombway 
    dw $0000 
    dw $0000 
    dw PLMPopulation_FinalMissileBombway_State0 
    dw LibBG_Crateria_2_BrickRoom 
    dw RTS_8F91D4 

RoomState_FinalMissileBombway_1:
    dl LevelData_FinalMissileBombway 
    db $02,$00,$00 
    dw FXHeader_FinalMissileBombway_State1 
    dw EnemyPopulations_FinalMissileBombway_1 
    dw EnemySets_FinalMissileBombway_1 
    db $C1,$C1 
    dw RoomScrolls_FinalMissileBombway 
    dw $0000 
    dw $0000 
    dw PLMPopulation_FinalMissileBombway_State1 
    dw LibBG_Crateria_2_BrickRoom 
    dw RTS_8F91D4 

RoomDoors_FinalMissileBombway:
    dw Door_FinalMissileBombway_0 
    dw Door_FinalMissileBombway_1 

RoomScrolls_FinalMissileBombway:
    db $01,$01 

RoomHeader_FinalMissile:
    db $1F,$00,$10,$07,$01,$01,$70,$A0,$00 
    dw RoomDoors_FinalMissile 
    dw RoomStateCheck_EventHasBeenSet 
    db $00 
    dw RoomState_FinalMissile_1 
    dw Use_StatePointer_inX 

RoomState_FinalMissile_0:
    dl LevelData_FinalMissile 
    db $02,$00,$00 
    dw FXHeader_FinalMissile_State0 
    dw EnemyPopulations_FinalMissile_0 
    dw EnemySets_FinalMissile_0 
    db $C1,$C1 
    dw RoomScrolls_FinalMissile 
    dw $0000 
    dw $0000 
    dw PLMPopulation_FinalMissile_State0 
    dw LibBG_Crateria_2_3_Mechanical 
    dw RTS_8F91D4 

RoomState_FinalMissile_1:
    dl LevelData_FinalMissile 
    db $02,$00,$00 
    dw FXHeader_FinalMissile_State1 
    dw EnemyPopulations_FinalMissile_1 
    dw EnemySets_FinalMissile_1 
    db $C1,$C1 
    dw RoomScrolls_FinalMissile 
    dw $0000 
    dw $0000 
    dw PLMPopulation_FinalMissile_State1 
    dw LibBG_Crateria_2_3_Mechanical 
    dw RTS_8F91D4 

RoomDoors_FinalMissile:
    dw Door_FinalMissile_0 

RoomScrolls_FinalMissile:
    db $01 

RoomHeader_GreenBrinstarMainShaft:
    db $00,$01,$09,$00,$04,$0C,$70,$A0,$00 
    dw RoomDoors_GreenBrinstarMainShaft 
    dw Use_StatePointer_inX 

RoomState_GreenBrinstarMainShaft:
    dl LevelData_GreenBrinstarMainShaft 
    db $06,$0F,$05 
    dw FXHeader_GreenBrinstarMainShaft 
    dw EnemyPopulations_GreenBrinstarMainShaft 
    dw EnemySets_GreenBrinstarMainShaft 
    db $00,$C0 
    dw RoomScrolls_GreenBrinstarMainShaft 
    dw $0000 
    dw $0000 
    dw PLMPopulation_GreenBrinstarMainShaft 
    dw LibBG_Brinstar_6_Vertical_GlowPatches 
    dw RTS_8F91D5 

RoomDoors_GreenBrinstarMainShaft:
    dw Door_GreenBrinstarMainShaft_0 
    dw Door_GreenBrinstarMainShaft_1 
    dw Door_GreenBrinstarMainShaft_2 
    dw Door_GreenBrinstarMainShaft_3 
    dw Door_GreenBrinstarMainShaft_4 
    dw Door_GreenBrinstarMainShaft_5 
    dw Door_GreenBrinstarMainShaft_6 
    dw Door_GreenBrinstarMainShaft_7 
    dw Door_GreenBrinstarMainShaft_8 
    dw Door_VariousRooms_Elevator 
    dw Door_GreenBrinstarMainShaft_A 

RoomScrolls_GreenBrinstarMainShaft:
    db $02,$00,$00,$00,$02,$00,$00,$00,$02,$00,$00,$00,$02,$00,$00,$00 
    db $02,$00,$00,$00,$02,$00,$00,$00,$02,$00,$00,$00,$00,$00,$02,$01 
    db $02,$00,$02,$00,$02,$00,$02,$00,$02,$00,$02,$00,$00,$00,$02,$00 

RoomPLM_GreenBrinstarMainShaft_0:
    db $1C,$02,$1D,$00,$80 

RoomPLM_GreenBrinstarMainShaft_1_2:
    db $1C,$00,$1D,$01,$29,$01,$80 

RoomPLM_GreenBrinstarMainShaft_3:
    db $18,$02,$1C,$02,$1D,$00,$29,$00,$80 

RoomHeader_SporeSpawnSuper:
    db $01,$01,$17,$01,$02,$09,$70,$A0,$00 
    dw RoomDoors_SporeSpawnSuper 
    dw Use_StatePointer_inX 

RoomState_SporeSpawnSuper:
    dl LevelData_SporeSpawnSuper 
    db $06,$00,$03 
    dw FXHeader_SporeSpawnSuper 
    dw EnemyPopulations_SporeSpawnSuper 
    dw EnemySets_SporeSpawnSuper 
    db $C1,$C1 
    dw RoomScrolls_SporeSpawnSuper 
    dw $0000 
    dw $0000 
    dw PLMPopulation_SporeSpawnSuper 
    dw LibBG_Brinstar_6_SmallPattern 
    dw RTS_8F91D5 

RoomDoors_SporeSpawnSuper:
    dw Door_SporeSpawnSuper_0 
    dw Door_SporeSpawnSuper_1 

RoomScrolls_SporeSpawnSuper:
    db $01,$02,$00,$02,$00,$02,$00,$02,$00,$02,$00,$02,$00,$02,$00,$02 
    db $01,$01 

RoomPLM_SporeSpawnSuper_0:
    db $01,$02,$03,$02,$80 

RoomHeader_BrinstarPreMap:
    db $02,$01,$06,$04,$03,$01,$70,$A0,$00 
    dw RoomDoors_BrinstarPreMap 
    dw Use_StatePointer_inX 

RoomState_BrinstarPreMap:
    dl LevelData_BrinstarPreMap 
    db $06,$00,$00 
    dw FXHeader_BrinstarPreMap 
    dw EnemyPopulations_BrinstarPreMap 
    dw EnemySets_BrinstarPreMap 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_BrinstarPreMap 
    dw LibBG_Brinstar_6_MediumHorizontalPattern 
    dw RTS_8F91D5 

RoomDoors_BrinstarPreMap:
    dw Door_BrinstarPreMap_0 
    dw Door_BrinstarPreMap_1 

RoomHeader_EarlySupers:
    db $03,$01,$0A,$03,$03,$02,$70,$A0,$00 
    dw RoomDoors_EarlySupers 
    dw Use_StatePointer_inX 

RoomState_EarlySupers:
    dl LevelData_EarlySupers 
    db $06,$00,$05 
    dw FXHeader_EarlySupers 
    dw EnemyPopulations_EarlySupers 
    dw EnemySets_EarlySupers 
    db $C1,$C1 
    dw RoomScrolls_EarlySupers 
    dw $0000 
    dw $0000 
    dw PLMPopulation_EarlySupers 
    dw LibBG_Brinstar_6_ThinHorizontalPattern 
    dw RTS_8F91D5 

RoomDoors_EarlySupers:
    dw Door_EarlySupers_0 
    dw Door_EarlySupers_1 

RoomScrolls_EarlySupers:
    db $00,$00,$00,$01,$01,$01 

RoomPLM_EarlySupers_0_4:
    db $00,$02,$01,$02,$02,$02,$80 

RoomPLM_EarlySupers_3:
    db $00,$00,$01,$00,$02,$00,$80 

RoomHeader_BrinstarReserveTank:
    db $04,$01,$0D,$04,$02,$01,$70,$A0,$00 
    dw RoomDoors_BrinstarReserveTank 
    dw Use_StatePointer_inX 

RoomState_BrinstarReserveTank:
    dl LevelData_BrinstarReserveTank 
    db $06,$00,$03 
    dw FXHeader_BrinstarReserveTank 
    dw EnemyPopulations_BrinstarReserveTank 
    dw EnemySets_BrinstarReserveTank 
    db $C1,$C1 
    dw RoomScrolls_BrinstarReserveTank 
    dw $0000 
    dw $0000 
    dw PLMPopulation_BrinstarReserveTank 
    dw LibBG_Brinstar_6_LargeHorizontalPattern 
    dw RTS_8F91D5 

RoomDoors_BrinstarReserveTank:
    dw Door_BrinstarReserveTank_0 

RoomScrolls_BrinstarReserveTank:
    db $01,$00 

RoomPLM_BrinstarReserveTank_0:
    db $01,$01,$80 

RoomHeader_GreenBrinstarMap:
    db $05,$01,$05,$04,$01,$01,$70,$A0,$00 
    dw RoomDoors_GreenBrinstarMap 
    dw Use_StatePointer_inX 

RoomState_GreenBrinstarMap:
    dl LevelData_MapStation_RightSideDoor 
    db $15,$00,$00 
    dw FXHeader_GreenBrinstarMap 
    dw EnemyPopulations_GreenBrinstarMap 
    dw EnemySets_GreenBrinstarMap 
    db $00,$00 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_GreenBrinstarMap 
    dw $0000 
    dw RTS_8F91D5 

RoomDoors_GreenBrinstarMap:
    dw Door_GreenBrinstarMap_0 

RoomHeader_GreenBrinstarFirefleas:
    db $06,$01,$06,$06,$03,$02,$70,$A0,$00 
    dw RoomDoors_GreenBrinstarFirefleas 
    dw Use_StatePointer_inX 

RoomState_GreenBrinstarFirefleas:
    dl LevelData_GreenBrinstarFirefleas 
    db $06,$00,$00 
    dw FXHeader_GreenBrinstarFirefleas 
    dw EnemyPopulations_GreenBrinstarFirefleas 
    dw EnemySets_GreenBrinstarFirefleas 
    db $00,$00 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_GreenBrinstarFirefleas 
    dw $0000 
    dw RTS_8F91D5 

RoomDoors_GreenBrinstarFirefleas:
    dw Door_GreenBrinstarFirefleas_0 
    dw Door_GreenBrinstarFirefleas_1 

RoomHeader_GreenBrinstarMissileRefill:
    db $07,$01,$05,$07,$01,$01,$70,$A0,$00 
    dw RoomDoors_GreenBrinstarMissileRefill 
    dw Use_StatePointer_inX 

RoomState_GreenBrinstarMissileRefill:
    dl LevelData_MissileRefill_RightSideDoor 
    db $18,$00,$00 
    dw FXHeader_GreenBrinstarMissileRefill 
    dw EnemyPopulations_GreenBrinstarMissileRefill 
    dw EnemySets_GreenBrinstarMissileRefill 
    db $00,$00 
    dw RoomScrolls_GreenBrinstarMissileRefill 
    dw $0000 
    dw $0000 
    dw PLMPopulation_GreenBrinstarMissileRefill 
    dw $0000 
    dw RTS_8F91D5 

RoomDoors_GreenBrinstarMissileRefill:
    dw Door_GreenBrinstarMissileRefill_0 

RoomScrolls_GreenBrinstarMissileRefill:
    db $01 

RoomHeader_Dachora:
    db $08,$01,$0A,$06,$07,$07,$70,$A0,$00 
    dw RoomDoors_Dachora 
    dw Use_StatePointer_inX 

RoomState_Dachora:
    dl LevelData_Dachora 
    db $06,$00,$00 
    dw FXHeader_Dachora 
    dw EnemyPopulations_Dachora 
    dw EnemySets_Dachora 
    db $C0,$00 
    dw RoomScrolls_Dachora 
    dw $0000 
    dw MainASM_ScrollScreenRightInDachoraRoom 
    dw PLMPopulation_Dachora 
    dw $0000 
    dw RTS_8F91D5 

RoomDoors_Dachora:
    dw Door_Dachora_0 
    dw Door_Dachora_1 
    dw Door_Dachora_2 

RoomScrolls_Dachora:
    dl $010101 
    db $01,$01,$01 
    dw $0001 
    dw $0000 
    dw $0000 
    db $00,$00 
    dw $0000 
    dw $0000 
    dw $0002 
    dw $0000 
    dw $0000 
    dw $0200 
    db $00,$00,$00,$00,$00,$00,$02,$00,$00,$00,$00,$00,$00,$02,$00,$00 
    db $02,$02,$02,$02,$02,$00,$00 

RoomPLM_Dachora_6:
    db $0B,$02,$80 

RoomPLM_Dachora_A_16:
    db $04,$01,$0B,$00,$80 

RoomHeader_BigPink:
    db $09,$01,$0F,$04,$05,$0A,$70,$A0,$00 
    dw RoomDoors_BigPink 
    dw Use_StatePointer_inX 

RoomState_BigPink:
    dl LevelData_BigPink 
    db $06,$0F,$05 
    dw FXHeader_BigPink 
    dw EnemyPopulations_BigPink 
    dw EnemySets_BigPink 
    db $C1,$C1 
    dw RoomScrolls_BigPink 
    dw $0000 
    dw $0000 
    dw PLMPopulation_BigPink 
    dw LibBG_Brinstar_6_DarkPattern 
    dw RTS_8F91D5 

RoomDoors_BigPink:
    dw Door_BigPink_0 
    dw Door_BigPink_1 
    dw Door_BigPink_2 
    dw Door_BigPink_3 
    dw Door_BigPink_4 
    dw Door_BigPink_5 
    dw Door_BigPink_6 
    dw Door_BigPink_7 
    dw Door_BigPink_8 

RoomScrolls_BigPink:
    db $00,$00,$02,$02,$00,$00,$00,$02,$02,$00,$00,$00,$02,$02,$00,$00 
    db $00,$02,$02,$00,$00,$00,$02,$02,$00,$00,$00,$02,$02,$00,$00,$00 
    db $01,$01,$00,$02,$00,$00,$00,$00,$02,$00,$00,$00,$00,$02,$00,$00 
    db $00,$00 

RoomPLM_BigPink_0:
    db $20,$02,$25,$02,$26,$02,$80 

RoomPLM_BigPink_1:
    db $24,$02,$80 

RoomPLM_BigPink_2:
    db $1D,$00,$80 

RoomPLM_BigPink_3:
    db $1C,$01,$1D,$01,$80 

RoomPLM_BigPink_4:
    db $01,$02,$80 

RoomPLM_BigPink_5:
    db $01,$00,$80 

RoomHeader_SporeSpawnKihunters:
    db $0A,$01,$13,$04,$04,$01,$70,$A0,$00 
    dw RoomDoors_SporeSpawnKihunters 
    dw Use_StatePointer_inX 

RoomState_SporeSpawnKihunters:
    dl LevelData_SporeSpawnKihunters 
    db $06,$0F,$05 
    dw FXHeader_SporeSpawnKihunters 
    dw EnemyPopulations_SporeSpawnKihunters 
    dw EnemySets_SporeSpawnKihunters 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_SporeSpawnKihunters 
    dw LibBG_Brinstar_6_Horizontal_GlowPatches 
    dw RTS_8F91D5 

RoomDoors_SporeSpawnKihunters:
    dw Door_SporeSpawnKihunters_0 
    dw Door_SporeSpawnKihunters_1 

RoomHeader_SporeSpawn:
    db $0B,$01,$16,$01,$01,$03,$70,$A0,$00 
    dw RoomDoors_SporeSpawn 
    dw RoomStateCheck_BossIsDead 
    db $02 
    dw RoomState_SporeSpawn_1 
    dw Use_StatePointer_inX 

RoomState_SporeSpawn_0:
    dl LevelData_SporeSpawn 
    db $06,$2A,$05 
    dw FXHeader_SporeSpawn_State0_1 
    dw EnemyPopulations_SporeSpawn 
    dw EnemySets_SporeSpawn 
    db $00,$00 
    dw $0001 
    dw $0000 
    dw $0000 
    dw PLMPopulation_SporeSpawn_State0_1 
    dw $0000 
    dw RTS_8F91D5 

RoomState_SporeSpawn_1:
    dl LevelData_SporeSpawn 
    db $06,$00,$03 
    dw FXHeader_SporeSpawn_State0_1 
    dw EnemyPopulations_SporeSpawn 
    dw EnemySets_SporeSpawn 
    db $00,$00 
    dw $0001 
    dw $0000 
    dw $0000 
    dw PLMPopulation_SporeSpawn_State0_1 
    dw $0000 
    dw RTS_8F91D5 

RoomDoors_SporeSpawn:
    dw Door_SporeSpawn_0 
    dw Door_SporeSpawn_1 

RoomHeader_PinkBrinstarPowerBombs:
    db $0C,$01,$0F,$07,$02,$02,$70,$A0,$00 
    dw RoomDoors_PinkBrinstarPowerBombs 
    dw Use_StatePointer_inX 

RoomState_PinkBrinstarPowerBombs:
    dl LevelData_PinkBrinstarPowerBombs 
    db $06,$00,$00 
    dw FXHeader_PinkBrinstarPowerBombs 
    dw EnemyPopulations_PinkBrinstarPowerBombs 
    dw EnemySets_PinkBrinstarPowerBombs 
    db $C1,$C1 
    dw RoomScrolls_PinkBrinstarPowerBombs 
    dw $0000 
    dw $0000 
    dw PLMPopulation_PinkBrinstarPowerBombs 
    dw LibBG_Brinstar_6_ThinHorizontalPattern 
    dw RTS_8F91D5 

RoomDoors_PinkBrinstarPowerBombs:
    dw Door_PinkBrinstarPowerBombs_0 
    dw Door_PinkBrinstarPowerBombs_1 

RoomScrolls_PinkBrinstarPowerBombs:
    db $01,$01,$00,$00 

RoomPLM_PinkBrinstarPowerBombs_0:
    db $00,$02,$01,$00,$02,$01,$03,$01,$80 

RoomPLM_PinkBrinstarPowerBombs_1:
    db $00,$01,$01,$01,$02,$00,$03,$00,$80 

RoomHeader_GreenHillZone:
    db $0D,$01,$13,$0A,$08,$04,$70,$A0,$00 
    dw RoomDoors_GreenHillZone 
    dw Use_StatePointer_inX 

RoomState_GreenHillZone:
    dl LevelData_GreenHillZone 
    db $06,$0F,$05 
    dw FXHeader_GreenHillZone 
    dw EnemyPopulations_GreenHillZone 
    dw EnemySets_GreenHillZone 
    db $C1,$C1 
    dw RoomScrolls_GreenHillZone 
    dw $0000 
    dw $0000 
    dw PLMPopulation_GreenHillZone 
    dw LibBG_Brinstar_6_SpheresPattern 
    dw RTS_8F91D5 

RoomDoors_GreenHillZone:
    dw Door_GreenHillZone_0 
    dw Door_GreenHillZone_1 
    dw Door_GreenHillZone_2 

RoomScrolls_GreenHillZone:
    db $02,$02,$00,$00,$00,$00,$00,$00,$02,$02,$02,$02,$00,$00,$00,$00 
    db $02,$02,$02,$02,$02,$02,$02,$02,$01,$01,$01,$01,$01,$01,$01,$01 

RoomHeader_MorphBall:
    db $0E,$01,$15,$08,$08,$03,$70,$A0,$00 
    dw RoomDoors_MorphBall 
    dw RoomStateCheck_EventHasBeenSet 
    db $00 
    dw RoomState_MorphBall_1 
    dw Use_StatePointer_inX 

RoomState_MorphBall_0:
    dl LevelData_MorphBall 
    db $06,$06,$07 
    dw FXHeader_MorphBall_State0 
    dw EnemyPopulations_MorphBall_0 
    dw EnemySets_MorphBall_0 
    db $C1,$C1 
    dw RoomScrolls_MorphBall 
    dw $0000 
    dw $0000 
    dw PLMPopulation_MorphBall_State0 
    dw LibBG_Brinstar_6_SmallPattern_Variety_0 
    dw RTS_8F91D5 

RoomState_MorphBall_1:
    dl LevelData_MorphBall 
    db $06,$09,$05 
    dw FXHeader_VariousRooms_8381F4 
    dw EnemyPopulations_MorphBall_1 
    dw EnemySets_MorphBall_1 
    db $C1,$C1 
    dw RoomScrolls_MorphBall 
    dw $0000 
    dw $0000 
    dw PLMPopulation_MorphBall_State1 
    dw LibBG_Brinstar_6_SmallPattern_Variety_0 
    dw RTS_8F91BC 

RoomDoors_MorphBall:
    dw Door_MorphBall_0 
    dw Door_MorphBall_1 
    dw Door_MorphBall_2 
    dw Door_VariousRooms_Elevator 

RoomScrolls_MorphBall:
    db $00,$00,$00,$00,$00,$02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $01,$01,$01,$01,$01,$01,$01,$01 

RoomPLM_MorphBall_0:
    db $12,$01,$80 

RoomPLM_MorphBall_9:
    db $12,$00,$80 

RoomPLM_MorphBall_B_D:
    db $0D,$02,$80 

RoomPLM_MorphBall_F:
    db $0D,$00,$80 

RoomHeader_ConstructionZone:
    db $0F,$01,$1D,$0A,$01,$02,$70,$A0,$00 
    dw RoomDoors_ConstructionZone 
    dw RoomStateCheck_EventHasBeenSet 
    db $00 
    dw RoomState_ConstructionZone_1 
    dw Use_StatePointer_inX 

RoomState_ConstructionZone_0:
    dl LevelData_ConstructionZone 
    db $06,$00,$00 
    dw FXHeader_ConstructionZone_State0 
    dw EnemyPopulations_ConstructionZone_0 
    dw EnemySets_ConstructionZone_0 
    db $C1,$C1 
    dw RoomScrolls_ConstructionZone 
    dw $0000 
    dw $0000 
    dw PLMPopulation_ConstructionZone_State0_1 
    dw LibBG_Brinstar_6_SmallPattern 
    dw RTS_8F91D5 

RoomState_ConstructionZone_1:
    dl LevelData_ConstructionZone 
    db $06,$00,$00 
    dw FXHeader_VariousRooms_8381F4 
    dw EnemyPopulations_ConstructionZone_1 
    dw EnemySets_ConstructionZone_1 
    db $C1,$C1 
    dw RoomScrolls_ConstructionZone 
    dw $0000 
    dw $0000 
    dw PLMPopulation_ConstructionZone_State0_1 
    dw LibBG_Brinstar_6_SmallPattern 
    dw RTS_8F91BC 

RoomDoors_ConstructionZone:
    dw Door_ConstructionZone_0 
    dw Door_ConstructionZone_1 
    dw Door_ConstructionZone_2 

RoomScrolls_ConstructionZone:
    db $01,$00 

RoomPLM_ConstructionZone_0:
    db $00,$02,$01,$01,$80 

RoomHeader_BlueBrinstarETank:
    db $10,$01,$1E,$08,$03,$03,$70,$A0,$00 
    dw RoomDoors_BlueBrinstarETank 
    dw RoomStateCheck_EventHasBeenSet 
    db $00 
    dw RoomState_BlueBrinstarETank_1 
    dw Use_StatePointer_inX 

RoomState_BlueBrinstarETank_0:
    dl LevelData_BlueBrinstarETank 
    db $06,$00,$00 
    dw FXHeader_BlueBrinstarETank_State0 
    dw EnemyPopulations_BlueBrinstarETank_0 
    dw EnemySets_BlueBrinstarETank_0 
    db $C1,$C1 
    dw RoomScrolls_BlueBrinstarETank 
    dw $0000 
    dw $0000 
    dw PLMPopulation_BlueBrinstarETank_State0_1 
    dw LibBG_Brinstar_6_SmallPattern_Variety_0 
    dw RTS_8F91D5 

RoomState_BlueBrinstarETank_1:
    dl LevelData_BlueBrinstarETank 
    db $06,$00,$00 
    dw FXHeader_VariousRooms_8381F4 
    dw EnemyPopulations_BlueBrinstarETank_1 
    dw EnemySets_BlueBrinstarETank_1 
    db $C1,$C1 
    dw RoomScrolls_BlueBrinstarETank 
    dw $0000 
    dw $0000 
    dw PLMPopulation_BlueBrinstarETank_State0_1 
    dw LibBG_Brinstar_6_SmallPattern_Variety_0 
    dw RTS_8F91BC 

RoomDoors_BlueBrinstarETank:
    dw Door_BlueBrinstarETank_0 
    dw Door_BlueBrinstarETank_1 

RoomScrolls_BlueBrinstarETank:
    db $00,$00,$02,$00,$00,$00,$01,$01,$01 

RoomPLM_BlueBrinstarETank_0_1:
    db $05,$02,$80 

RoomHeader_NoobBridge:
    db $11,$01,$1B,$0D,$06,$01,$70,$A0,$00 
    dw RoomDoors_NoobBridge 
    dw Use_StatePointer_inX 

RoomState_NoobBridge:
    dl LevelData_NoobBridge 
    db $06,$0F,$05 
    dw FXHeader_NoobBridge 
    dw EnemyPopulations_NoobBridge 
    dw EnemySets_NoobBridge 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_NoobBridge 
    dw LibBG_Brinstar_6_Horizontal_GlowPatches 
    dw RTS_8F91D5 

RoomDoors_NoobBridge:
    dw Door_NoobBridge_0 
    dw Door_NoobBridge_1 

RoomHeader_GreenBrinstarBeetoms:
    db $12,$01,$08,$0A,$01,$01,$70,$A0,$00 
    dw RoomDoors_GreenBrinstarBeetoms 
    dw Use_StatePointer_inX 

RoomState_GreenBrinstarBeetoms:
    dl LevelData_GreenBrinstarBeetoms 
    db $06,$00,$00 
    dw FXHeader_GreenBrinstarBeetoms 
    dw EnemyPopulations_GreenBrinstarBeetoms 
    dw EnemySets_GreenBrinstarBeetoms 
    db $01,$01 
    dw RoomScrolls_GreenBrinstarBeetoms 
    dw $0000 
    dw $0000 
    dw PLMPopulation_GreenBrinstarBeetoms 
    dw LibBG_Brinstar_6_Horizontal_GlowPatches 
    dw RTS_8F91D5 

RoomDoors_GreenBrinstarBeetoms:
    dw Door_GreenBrinstarBeetoms_0 
    dw Door_GreenBrinstarBeetoms_1 

RoomScrolls_GreenBrinstarBeetoms:
    db $01 

RoomHeader_EtecoonETank:
    db $13,$01,$06,$0A,$05,$02,$70,$A0,$00 
    dw RoomDoors_EtecoonETank 
    dw Use_StatePointer_inX 

RoomState_EtecoonETank:
    dl LevelData_EtecoonETank 
    db $06,$00,$00 
    dw FXHeader_EtecoonETank 
    dw EnemyPopulations_EtecoonETank 
    dw EnemySets_EtecoonETank 
    db $C1,$C1 
    dw RoomScrolls_EtecoonETank 
    dw $0000 
    dw $0000 
    dw PLMPopulation_EtecoonETank 
    dw LibBG_Brinstar_6_Horizontal_GlowPatches 
    dw RTS_8F91D5 

RoomDoors_EtecoonETank:
    dw Door_EtecoonETank_0 
    dw Door_EtecoonETank_1 
    dw Door_EtecoonETank_2 
    dw Door_EtecoonETank_3 

RoomScrolls_EtecoonETank:
    db $01,$01,$00,$00,$00,$00,$00,$01,$01,$01 

RoomPLM_EtecoonETank_0:
    db $01,$02,$05,$01,$06,$01,$80 

RoomHeader_EtecoonSuper:
    db $14,$01,$05,$0A,$01,$01,$70,$A0,$00 
    dw RoomDoors_EtecoonSuper 
    dw Use_StatePointer_inX 

RoomState_EtecoonSuper:
    dl LevelData_EtecoonSuper 
    db $06,$00,$00 
    dw FXHeader_EtecoonSuper 
    dw EnemyPopulations_EtecoonSuper 
    dw EnemySets_EtecoonSuper 
    db $01,$01 
    dw RoomScrolls_EtecoonSuper 
    dw $0000 
    dw $0000 
    dw PLMPopulation_EtecoonSuper 
    dw LibBG_Brinstar_6_Horizontal_GlowPatches 
    dw RTS_8F91D5 

RoomDoors_EtecoonSuper:
    dw Door_EtecoonSuper_0 

RoomScrolls_EtecoonSuper:
    db $01 

RoomHeader_DachoraEnergyRefill:
    db $15,$01,$09,$0C,$01,$01,$70,$A0,$00 
    dw RoomDoors_DachoraEnergyRefill 
    dw Use_StatePointer_inX 

RoomState_DachoraEnergyRefill:
    dl LevelData_EnergyRefill_RightSideDoor 
    db $17,$00,$00 
    dw FXHeader_DachoraEnergyRefill 
    dw EnemyPopulations_DachoraEnergyRefill 
    dw EnemySets_DachoraEnergyRefill 
    db $00,$00 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_DachoraEnergyRefill 
    dw $0000 
    dw RTS_8F91D5 

RoomDoors_DachoraEnergyRefill:
    dw Door_DachoraEnergyRefill_0 

RoomHeader_SporeSpawnFarming:
    db $16,$01,$14,$09,$03,$01,$70,$A0,$00 
    dw RoomDoors_SporeSpawnFarming 
    dw Use_StatePointer_inX 

RoomState_SporeSpawnFarming:
    dl LevelData_SporeSpawnFarming 
    db $06,$0F,$05 
    dw FXHeader_SporeSpawnFarming 
    dw EnemyPopulations_SporeSpawnFarming 
    dw EnemySets_SporeSpawnFarming 
    db $C0,$00 
    dw RoomScrolls_SporeSpawnFarming 
    dw $0000 
    dw $0000 
    dw PLMPopulation_SporeSpawnFarming 
    dw $0000 
    dw RTS_8F91D5 

RoomDoors_SporeSpawnFarming:
    dw Door_SporeSpawnFarming_0 
    dw Door_SporeSpawnFarming_1 

RoomScrolls_SporeSpawnFarming:
    db $01,$01,$01 

RoomHeader_WaterwayETank:
    db $17,$01,$08,$0D,$07,$01,$70,$A0,$00 
    dw RoomDoors_WaterwayETank 
    dw Use_StatePointer_inX 

RoomState_WaterwayETank:
    dl LevelData_WaterwayETank 
    db $06,$00,$00 
    dw FXHeader_WaterwayETank 
    dw EnemyPopulations_WaterwayETank 
    dw EnemySets_WaterwayETank 
    db $C1,$01 
    dw RoomScrolls_WaterwayETank 
    dw $0000 
    dw $0000 
    dw PLMPopulation_WaterwayETank 
    dw LibBG_Brinstar_6_ThinHorizontalPattern 
    dw RTS_8F91D5 

RoomDoors_WaterwayETank:
    dw Door_WaterwayETank_0 
    dw Door_WaterwayETank_1 

RoomScrolls_WaterwayETank:
    db $00,$01,$01,$01,$01,$01,$01 

RoomPLM_WaterwayETank:
    db $00,$01,$80 

RoomHeader_FirstMissile:
    db $18,$01,$1C,$0B,$01,$01,$70,$A0,$00 
    dw RoomDoors_FirstMissile 
    dw Use_StatePointer_inX 

RoomState_FirstMissile:
    dl LevelData_FirstMissile 
    db $06,$00,$00 
    dw FXHeader_FirstMissile 
    dw EnemyPopulations_FirstMissile 
    dw EnemySets_FirstMissile 
    db $01,$01 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_FirstMissile 
    dw LibBG_Brinstar_6_SmallPattern 
    dw RTS_8F91D5 

RoomDoors_FirstMissile:
    dw Door_FirstMissile_0 

RoomHeader_PinkBrinstarHoppers:
    db $19,$01,$13,$07,$02,$02,$70,$A0,$00 
    dw RoomDoors_PinkBrinstarHoppers 
    dw Use_StatePointer_inX 

RoomState_PinkBrinstarHoppers:
    dl LevelData_PinkBrinstarHoppers 
    db $06,$00,$00 
    dw FXHeader_PinkBrinstarHoppers 
    dw EnemyPopulations_PinkBrinstarHoppers 
    dw EnemySets_PinkBrinstarHoppers 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_PinkBrinstarHoppers 
    dw LibBG_Brinstar_6_ThinHorizontalPattern 
    dw RTS_8F91D5 

RoomDoors_PinkBrinstarHoppers:
    dw Door_PinkBrinstarHoppers_0 
    dw Door_PinkBrinstarHoppers_1 

RoomHeader_HopperETank:
    db $1A,$01,$15,$08,$01,$01,$70,$A0,$00 
    dw RoomDoors_HopperETank 
    dw Use_StatePointer_inX 

RoomState_HopperETank:
    dl LevelData_HopperETank 
    db $06,$00,$00 
    dw FXHeader_HopperETank 
    dw EnemyPopulations_HopperETank 
    dw EnemySets_HopperETank 
    db $00,$00 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_HopperETank 
    dw $0000 
    dw RTS_8F91D5 

RoomDoors_HopperETank:
    dw Door_HopperETank_0 

RoomHeader_BigPinkSaveRoom:
    db $1B,$01,$0F,$04,$01,$01,$70,$A0,$00 
    dw RoomDoors_BigPinkSaveRoom 
    dw Use_StatePointer_inX 

RoomState_BigPinkSaveRoom:
    dl LevelData_SaveStation_RightSideDoor 
    db $19,$0F,$05 
    dw FXHeader_BigPinkSaveRoom 
    dw EnemyPopulations_BigPinkSaveRoom 
    dw EnemySets_BigPinkSaveRoom 
    db $00,$00 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_BigPinkSaveRoom 
    dw $0000 
    dw RTS_8F91D5 

RoomDoors_BigPinkSaveRoom:
    dw Door_BigPinkSaveRoom_0 

RoomHeader_BlueBrinstarBoulders:
    db $1C,$01,$1E,$08,$02,$01,$70,$A0,$00 
    dw RoomDoors_BlueBrinstarBoulders 
    dw Use_StatePointer_inX 

RoomState_BlueBrinstarBoulders:
    dl LevelData_BlueBrinstarBoulders 
    db $06,$00,$00 
    dw FXHeader_BlueBrinstarBoulders 
    dw EnemyPopulations_BlueBrinstarBoulders 
    dw EnemySets_BlueBrinstarBoulders 
    db $C1,$01 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_BlueBrinstarBoulders 
    dw LibBG_Brinstar_6_SmallPattern_Variety_0 
    dw RTS_8F91D5 

RoomDoors_BlueBrinstarBoulders:
    dw Door_BlueBrinstarBoulders_0 
    dw Door_BlueBrinstarBoulders_1 

RoomHeader_BillyMays:
    db $1D,$01,$1D,$08,$01,$01,$70,$A0,$00 
    dw RoomDoors_BillyMays 
    dw Use_StatePointer_inX 

RoomState_BillyMays:
    dl LevelData_BillyMays 
    db $06,$00,$00 
    dw FXHeader_BillyMays 
    dw EnemyPopulations_BillyMays 
    dw EnemySets_BillyMays 
    db $01,$01 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_BillyMays 
    dw LibBG_Brinstar_6_SmallPattern_Variety_0 
    dw RTS_8F91D5 

RoomDoors_BillyMays:
    dw Door_BillyMays_0 

RoomHeader_GreenBrinstarSave:
    db $1E,$01,$08,$05,$01,$01,$70,$A0,$00 
    dw RoomDoors_GreenBrinstarSave 
    dw Use_StatePointer_inX 

RoomState_GreenBrinstarSave:
    dl LevelData_SaveStation_RightSideDoor 
    db $19,$0F,$05 
    dw FXHeader_GreenBrinstarSave 
    dw EnemyPopulations_GreenBrinstarSave 
    dw EnemySets_GreenBrinstarSave 
    db $00,$00 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_GreenBrinstarSave 
    dw $0000 
    dw RTS_8F91D5 

RoomDoors_GreenBrinstarSave:
    dw Door_GreenBrinstarSave_0 

RoomHeader_EtecoonSave:
    db $1F,$01,$05,$0B,$01,$01,$70,$A0,$00 
    dw RoomDoors_EtecoonSave 
    dw Use_StatePointer_inX 

RoomState_EtecoonSave:
    dl LevelData_SaveStation_RightSideDoor 
    db $19,$0F,$05 
    dw FXHeader_EtecoonSave 
    dw EnemyPopulations_EtecoonSave 
    dw EnemySets_EtecoonSave 
    db $00,$00 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_EtecoonSave 
    dw $0000 
    dw RTS_8F91D5 

RoomDoors_EtecoonSave:
    dw Door_EtecoonSave_0 

RoomHeader_RedTower:
    db $20,$01,$21,$09,$01,$0A,$70,$A0,$00 
    dw RoomDoors_RedTower 
    dw Use_StatePointer_inX 

RoomState_RedTower:
    dl LevelData_RedTower 
    db $07,$12,$05 
    dw FXHeader_RedTower 
    dw EnemyPopulations_RedTower 
    dw EnemySets_RedTower 
    db $C1,$C1 
    dw RoomScrolls_RedTower 
    dw $0000 
    dw $0000 
    dw PLMPopulation_RedTower 
    dw LibBG_Brinstar_7_WideVerticalTower_Brick_0 
    dw RTS_8F91D6 

RoomDoors_RedTower:
    dw Door_RedTower_0 
    dw Door_RedTower_1 
    dw Door_RedTower_2 
    dw Door_RedTower_3 
    dw Door_RedTower_4 

RoomScrolls_RedTower:
    db $02,$02,$02,$02,$02,$02,$01,$00,$02,$02 

RoomPLM_RedTower_0:
    db $06,$02,$07,$02,$80 

RoomHeader_RedBrinstarFirefleas:
    db $21,$01,$19,$0F,$08,$02,$90,$A0,$00 
    dw RoomDoors_RedBrinstarFirefleas 
    dw Use_StatePointer_inX 

RoomState_RedBrinstarFirefleas:
    dl LevelData_RedBrinstarFirefleas 
    db $07,$00,$05 
    dw FXHeader_RedBrinstarFirefleas 
    dw EnemyPopulations_RedBrinstarFirefleas 
    dw EnemySets_RedBrinstarFirefleas 
    db $00,$00 
    dw RoomScrolls_RedBrinstarFirefleas 
    dw $0000 
    dw $0000 
    dw PLMPopulation_RedBrinstarFirefleas 
    dw $0000 
    dw RTS_8F91D6 

RoomDoors_RedBrinstarFirefleas:
    dw Door_RedBrinstarFirefleas_0 
    dw Door_RedBrinstarFirefleas_1 

RoomScrolls_RedBrinstarFirefleas:
    db $02,$02,$01,$01,$02,$02,$01,$01,$01,$01,$00,$00,$01,$01,$00,$00 

RoomHeader_XrayScope:
    db $22,$01,$17,$0F,$02,$01,$70,$A0,$00 
    dw RoomDoors_XrayScope 
    dw Use_StatePointer_inX 

RoomState_XrayScope:
    dl LevelData_XrayScope 
    db $07,$00,$03 
    dw FXHeader_XrayScope 
    dw EnemyPopulations_XrayScope 
    dw EnemySets_XrayScope 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_XrayScope 
    dw LibBG_Brinstar_7_MechanicalRoom_SpikeFloor 
    dw RTS_8F91D6 

RoomDoors_XrayScope:
    dw Door_XrayScope_0 

RoomHeader_Hellway:
    db $23,$01,$22,$09,$03,$01,$70,$A0,$00 
    dw RoomDoors_Hellway 
    dw Use_StatePointer_inX 

RoomState_Hellway:
    dl LevelData_Hellway 
    db $07,$00,$00 
    dw FXHeader_Hellway 
    dw EnemyPopulations_Hellway 
    dw EnemySets_Hellway 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Hellway 
    dw LibBG_Brinstar_7_VerticalTower 
    dw RTS_8F91D6 

RoomDoors_Hellway:
    dw Door_Hellway_0 
    dw Door_Hellway_1 

RoomHeader_Caterpillar:
    db $24,$01,$25,$04,$03,$08,$70,$A0,$00 
    dw RoomDoors_Caterpillar 
    dw Use_StatePointer_inX 

RoomState_Caterpillar:
    dl LevelData_Caterpillar 
    db $07,$12,$05 
    dw FXHeader_Caterpillar 
    dw EnemyPopulations_Caterpillar 
    dw EnemySets_Caterpillar 
    db $00,$00 
    dw RoomScrolls_Caterpillar 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Caterpillar 
    dw $0000 
    dw RTS_8F91D6 

RoomDoors_Caterpillar:
    dw Door_Caterpillar_0 
    dw Door_Caterpillar_1 
    dw Door_Caterpillar_2 
    dw Door_Caterpillar_3 
    dw Door_Caterpillar_4 
    dw Door_VariousRooms_Elevator 
    dw Door_Caterpillar_6 

RoomScrolls_Caterpillar:
    db $02,$00,$00,$02,$00,$00,$02,$00,$00,$02,$00,$01,$02,$00,$00,$01 
    db $00,$00,$00,$00,$00,$02,$00,$00 

RoomPLM_Caterpillar_0:
    db $0F,$02,$12,$02,$80 

RoomPLM_Caterpillar_2:
    db $0A,$01,$09,$02,$80 

RoomPLM_Caterpillar_3:
    db $0A,$00,$80 

RoomHeader_BetaPowerBomb:
    db $25,$01,$23,$07,$02,$02,$70,$A0,$00 
    dw RoomDoors_BetaPowerBomb 
    dw Use_StatePointer_inX 

RoomState_BetaPowerBomb:
    dl LevelData_BetaPowerBomb 
    db $07,$00,$00 
    dw FXHeader_BetaPowerBomb 
    dw EnemyPopulations_BetaPowerBomb 
    dw EnemySets_BetaPowerBomb 
    db $C1,$C1 
    dw RoomScrolls_BetaPowerBomb 
    dw $0000 
    dw $0000 
    dw PLMPopulation_BetaPowerBomb 
    dw LibBG_Brinstar_7_NarrowVerticalTower_Brick 
    dw RTS_8F91D6 

RoomDoors_BetaPowerBomb:
    dw Door_BetaPowerBomb_0 

RoomScrolls_BetaPowerBomb:
    db $01,$01,$00,$00 

RoomPLM_BetaPowerBomb_0:
    db $00,$02,$02,$01,$80 

RoomHeader_AlphaPowerBomb:
    db $26,$01,$22,$0B,$03,$01,$70,$A0,$00 
    dw RoomDoors_AlphaPowerBomb 
    dw Use_StatePointer_inX 

RoomState_AlphaPowerBomb:
    dl LevelData_AlphaPowerBomb 
    db $07,$00,$03 
    dw FXHeader_AlphaPowerBomb 
    dw EnemyPopulations_AlphaPowerBomb 
    dw EnemySets_AlphaPowerBomb 
    db $C1,$C1 
    dw RoomScrolls_AlphaPowerBomb 
    dw $0000 
    dw $0000 
    dw PLMPopulation_AlphaPowerBomb 
    dw LibBG_Brinstar_7_BlueGridBlocks 
    dw RTS_8F91D6 

RoomDoors_AlphaPowerBomb:
    dw Door_AlphaPowerBomb_0 

RoomScrolls_AlphaPowerBomb:
    db $00,$01,$01 

RoomPLM_AlphaPowerBomb_8:
    db $00,$01,$80 

RoomHeader_SkreeBoost:
    db $27,$01,$22,$12,$02,$01,$70,$A0,$00 
    dw RoomDoors_SkreeBoost 
    dw Use_StatePointer_inX 

RoomState_SkreeBoost:
    dl LevelData_SkreeBoost 
    db $07,$00,$00 
    dw FXHeader_SkreeBoost 
    dw EnemyPopulations_SkreeBoost 
    dw EnemySets_SkreeBoost 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_SkreeBoost 
    dw LibBG_Brinstar_7_NarrowVerticalTower_Brick 
    dw RTS_8F91D6 

RoomDoors_SkreeBoost:
    dw Door_SkreeBoost_0 
    dw Door_SkreeBoost_1 

RoomHeader_BelowSpazer:
    db $28,$01,$24,$11,$02,$02,$70,$A0,$00 
    dw RoomDoors_BelowSpazer 
    dw Use_StatePointer_inX 

RoomState_BelowSpazer:
    dl LevelData_BelowSpazer 
    db $07,$00,$05 
    dw FXHeader_BelowSpazer 
    dw EnemyPopulations_BelowSpazer 
    dw EnemySets_BelowSpazer 
    db $C1,$C1 
    dw RoomScrolls_BelowSpazer 
    dw $0000 
    dw $0000 
    dw PLMPopulation_BelowSpazer 
    dw LibBG_Brinstar_7_VerticalBrick_0 
    dw RTS_8F91D6 

RoomDoors_BelowSpazer:
    dw Door_BelowSpazer_0 
    dw Door_BelowSpazer_1 
    dw Door_BelowSpazer_2 

RoomScrolls_BelowSpazer:
    db $00,$00,$01,$01 

RoomPLM_BelowSpazer_0_8_A:
    db $00,$02,$01,$02,$80 

RoomPLM_BelowSpazer_4_9_B:
    db $00,$00,$01,$00,$02,$01,$03,$01,$80 

RoomHeader_Spazer:
    db $29,$01,$26,$11,$01,$01,$70,$A0,$00 
    dw RoomDoors_Spazer 
    dw Use_StatePointer_inX 

RoomState_Spazer:
    dl LevelData_Spazer 
    db $07,$00,$03 
    dw FXHeader_Spazer 
    dw EnemyPopulations_Spazer 
    dw EnemySets_Spazer 
    db $C1,$C1 
    dw RoomScrolls_Spazer 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Spazer 
    dw LibBG_Brinstar_7_BlueGridBlocks 
    dw RTS_8F91D6 

RoomDoors_Spazer:
    dw Door_Spazer_0 

RoomScrolls_Spazer:
    db $01 

RoomHeader_WarehouseZeela:
    db $2A,$01,$2C,$12,$02,$02,$70,$A0,$00 
    dw RoomDoors_WarehouseZeela 
    dw Use_StatePointer_inX 

RoomState_WarehouseZeela:
    dl LevelData_WarehouseZeela 
    db $07,$00,$05 
    dw FXHeader_VariousRooms_8383D2 
    dw EnemyPopulations_WarehouseZeela 
    dw EnemySets_WarehouseZeela 
    db $C0,$00 
    dw RoomScrolls_WarehouseZeela 
    dw $0000 
    dw $0000 
    dw PLMPopulation_WarehouseZeela 
    dw $0000 
    dw RTS_8F91D6 

RoomDoors_WarehouseZeela:
    dw Door_WarehouseZeela_0 
    dw Door_WarehouseZeela_1 
    dw Door_WarehouseZeela_2 

RoomScrolls_WarehouseZeela:
    db $01,$00,$00,$01 

RoomPLM_WarehouseZeela_0:
    db $00,$02,$02,$01,$03,$00,$80 

RoomPLM_WarehouseZeela_1_3:
    db $00,$02,$02,$01,$80 

RoomPLM_WarehouseZeela_2:
    db $03,$01,$80 

RoomHeader_WarehouseETank:
    db $2B,$01,$2B,$13,$01,$01,$70,$A0,$00 
    dw RoomDoors_WarehouseETank 
    dw Use_StatePointer_inX 

RoomState_WarehouseETank:
    dl LevelData_WarehouseETank 
    db $07,$00,$00 
    dw FXHeader_VariousRooms_8383D2 
    dw EnemyPopulations_WarehouseETank 
    dw EnemySets_WarehouseETank 
    db $C0,$00 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_WarehouseETank 
    dw $0000 
    dw RTS_8F91D6 

RoomDoors_WarehouseETank:
    dw Door_WarehouseETank_0 

RoomHeader_WarehouseKihunter:
    db $2C,$01,$2D,$12,$04,$02,$70,$A0,$00 
    dw RoomDoors_WarehouseKihunter 
    dw Use_StatePointer_inX 

RoomState_WarehouseKihunter:
    dl LevelData_WarehouseKihunter 
    db $07,$12,$05 
    dw FXHeader_VariousRooms_8383D2 
    dw EnemyPopulations_WarehouseKihunter 
    dw EnemySets_WarehouseKihunter 
    db $C0,$00 
    dw RoomScrolls_WarehouseKihunter 
    dw $0000 
    dw $0000 
    dw PLMPopulation_WarehouseKihunter 
    dw $0000 
    dw RTS_8F91D6 

RoomDoors_WarehouseKihunter:
    dw Door_WarehouseKihunter_0 
    dw Door_WarehouseKihunter_1 
    dw Door_WarehouseKihunter_2 

RoomScrolls_WarehouseKihunter:
    db $02,$01,$01,$00,$00,$01,$00,$00 

RoomPLM_WarehouseKihunter_0:
    db $01,$01,$05,$00,$80 

RoomPLM_WarehouseKihunter_1:
    db $01,$02,$05,$01,$80 

RoomPLM_WarehouseKihunter_9:
    db $05,$00,$80 

RoomPLM_WarehouseKihunter_A_B:
    db $03,$01,$05,$00,$80 

RoomHeader_MiniKraid:
    db $2D,$01,$2F,$13,$06,$01,$70,$A0,$00 
    dw RoomDoors_MiniKraid 
    dw RoomStateCheck_BossIsDead 
    db $01 
    dw RoomState_MiniKraid_1 
    dw Use_StatePointer_inX 

RoomState_MiniKraid_0:
    dl LevelData_MiniKraid 
    db $07,$27,$06 
    dw FXHeader_MiniKraid_State0_1 
    dw EnemyPopulations_MiniKraid 
    dw EnemySets_MiniKraid 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_MiniKraid_State0_1 
    dw LibBG_Brinstar_7_NarrowVerticalTower_Brick_Vines_0 
    dw RTS_8F91D6 

RoomState_MiniKraid_1:
    dl LevelData_MiniKraid 
    db $07,$27,$03 
    dw FXHeader_MiniKraid_State0_1 
    dw EnemyPopulations_MiniKraid 
    dw EnemySets_MiniKraid 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_MiniKraid_State0_1 
    dw LibBG_Brinstar_7_NarrowVerticalTower_Brick_Vines_0 
    dw RTS_8F91D6 

RoomDoors_MiniKraid:
    dw Door_MiniKraid_0 
    dw Door_MiniKraid_1 

RoomHeader_KraidEyeDoor:
    db $2E,$01,$35,$12,$02,$02,$70,$A0,$02 
    dw RoomDoors_KraidEyeDoor 
    dw Use_StatePointer_inX 

RoomState_KraidEyeDoor:
    dl LevelData_KraidEyeDoor 
    db $07,$00,$00 
    dw FXHeader_KraidEyeDoor 
    dw EnemyPopulations_KraidEyeDoor 
    dw EnemySets_KraidEyeDoor 
    db $00,$00 
    dw RoomScrolls_KraidEyeDoor 
    dw $0000 
    dw $0000 
    dw PLMPopulation_KraidEyeDoor 
    dw $0000 
    dw RTS_8F91D6 

RoomDoors_KraidEyeDoor:
    dw Door_KraidEyeDoor_0 
    dw Door_KraidEyeDoor_1 
    dw Door_KraidEyeDoor_2 

RoomScrolls_KraidEyeDoor:
    db $00,$00,$01,$01 

RoomPLM_KraidEyeDoor_0:
    db $00,$02,$80 

RoomHeader_Kraid:
    db $2F,$01,$37,$12,$02,$02,$70,$A0,$05 
    dw RoomDoors_Kraid 
    dw RoomStateCheck_BossIsDead 
    db $01 
    dw RoomState_Kraid_1 
    dw Use_StatePointer_inX 

RoomState_Kraid_0:
    dl LevelData_Kraid 
    db $1A,$27,$06 
    dw FXHeader_Kraid_State0 
    dw EnemyPopulations_Kraid 
    dw EnemySets_Kraid 
    db $01,$01 
    dw RoomScrolls_Kraid 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Kraid_State0_1 
    dw LibBG_Brinstar_1A_Kraid_Upper_Lower 
    dw RTS_8F91D6 

RoomState_Kraid_1:
    dl LevelData_Kraid 
    db $1A,$00,$00 
    dw FXHeader_Kraid_State0 
    dw EnemyPopulations_Kraid 
    dw EnemySets_Kraid 
    db $01,$01 
    dw RoomScrolls_Kraid 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Kraid_State0_1 
    dw LibBG_Standard_BG3_Tiles 
    dw RTS_8F91D6 

RoomDoors_Kraid:
    dw Door_Kraid_0 
    dw Door_Kraid_1 

RoomScrolls_Kraid:
    db $02,$02,$01,$01 

RoomHeader_StatuesHallway:
    db $30,$00,$0C,$08,$05,$01,$70,$A0,$00 
    dw RoomDoors_StatuesHallway 
    dw Use_StatePointer_inX 

RoomState_StatuesHallway:
    dl LevelData_StatuesHallway 
    db $08,$00,$04 
    dw FXHeader_Kraid_State1 
    dw EnemyPopulations_StatuesHallway 
    dw EnemySets_StatuesHallway 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_StatuesHallway 
    dw LibBG_Brinstar_8_NarrowVerticalTower_Brick_Grey_0 
    dw RTS_8F91D6 

RoomDoors_StatuesHallway:
    dw Door_StatuesHallway_0 
    dw Door_StatuesHallway_1 

RoomHeader_RedTowerRefill:
    db $31,$01,$20,$12,$01,$01,$70,$A0,$00 
    dw RoomDoors_RedTowerRefill 
    dw Use_StatePointer_inX 

RoomState_RedTowerRefill:
    dl LevelData_EnergyRefill_RightSideDoor 
    db $17,$00,$00 
    dw FXHeader_RedTowerRefill 
    dw EnemyPopulations_RedTowerRefill 
    dw EnemySets_RedTowerRefill 
    db $00,$00 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_RedTowerRefill 
    dw $0000 
    dw RTS_8F91D6 

RoomDoors_RedTowerRefill:
    dw Door_RedTowerRefill_0 

RoomHeader_KraidRefill:
    db $32,$01,$36,$12,$01,$01,$70,$A0,$00 
    dw RoomDoors_KraidRefill 
    dw Use_StatePointer_inX 

RoomState_KraidRefill:
    dl LevelData_RefillStation_LeftSideDoor 
    db $18,$00,$00 
    dw FXHeader_KraidRefill 
    dw EnemyPopulations_KraidRefill 
    dw EnemySets_KraidRefill 
    db $00,$00 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_KraidRefill 
    dw $0000 
    dw RTS_8F91D6 

RoomDoors_KraidRefill:
    dw Door_KraidRefill_0 

RoomHeader_Statues:
    db $33,$00,$11,$08,$01,$02,$70,$A0,$00 
    dw RoomDoors_Statues 
    dw Use_StatePointer_inX 

RoomState_Statues:
    dl LevelData_Statues 
    db $15,$09,$06 
    dw FXHeader_Statues 
    dw EnemyPopulations_Statues 
    dw EnemySets_Statues 
    db $81,$01 
    dw RoomScrolls_Statues 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Statues 
    dw LibBG_Tourian_15_Statues 
    dw SetupASM_RunStatueUnlockingAnimations 

RoomDoors_Statues:
    dw Door_Statues_0 
    dw Door_Statues_1 
    dw Door_VariousRooms_Elevator 

RoomScrolls_Statues:
    db $01,$00 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_RoomPLM_8FA699:
    db $00,$02,$01,$01,$80 

UNUSED_RoomPLM_8FA69E:
    db $01,$02,$80 
endif ; !FEATURE_KEEP_UNREFERENCED

RoomHeader_WarehouseEntrance:
    db $34,$01,$29,$12,$03,$02,$70,$A0,$00 
    dw RoomDoors_WarehouseEntrance 
    dw Use_StatePointer_inX 

RoomState_WarehouseEntrance:
    dl LevelData_WarehouseEntrance 
    db $07,$12,$03 
    dw FXHeader_WarehouseEntrance 
    dw EnemyPopulations_WarehouseEntrance 
    dw EnemySets_WarehouseEntrance 
    db $C1,$C1 
    dw RoomScrolls_WarehouseEntrance 
    dw $0000 
    dw $0000 
    dw PLMPopulation_WarehouseEntrance 
    dw LibBG_Brinstar_7_MechanicalRoom 
    dw RTS_8F91F4 

RoomDoors_WarehouseEntrance:
    dw Door_WarehouseEntrance_0 
    dw Door_WarehouseEntrance_1 
    dw Door_WarehouseEntrance_2 
    dw Door_VariousRooms_Elevator 

RoomScrolls_WarehouseEntrance:
    db $01,$00,$02,$00,$01,$01 

RoomPLM_WarehouseEntrance_0:
    db $00,$02,$80 

RoomPLM_WarehouseEntrance_2:
    db $01,$02,$80 

RoomPLM_WarehouseEntrance_5:
    db $00,$01,$80 

RoomPLM_WarehouseEntrance_9:
    db $00,$00,$80 

RoomHeader_VariaSuit:
    db $35,$01,$39,$13,$01,$01,$70,$A0,$02 
    dw RoomDoors_VariaSuit 
    dw Use_StatePointer_inX 

RoomState_VariaSuit:
    dl LevelData_VariaSuit 
    db $07,$00,$03 
    dw FXHeader_VariaSuit 
    dw EnemyPopulations_VariaSuit 
    dw EnemySets_VariaSuit 
    db $00,$00 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_VariaSuit 
    dw $0000 
    dw RTS_8F91F4 

RoomDoors_VariaSuit:
    dw Door_VariaSuit_0 

RoomHeader_WarehouseSave:
    db $36,$01,$31,$12,$01,$01,$70,$A0,$00 
    dw RoomDoors_WarehouseSave 
    dw Use_StatePointer_inX 

RoomState_WarehouseSave:
    dl LevelData_SaveStation_LeftSideDoor 
    db $19,$12,$05 
    dw FXHeader_WarehouseSave 
    dw EnemyPopulations_WarehouseSave 
    dw EnemySets_WarehouseSave 
    db $00,$00 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_WarehouseSave 
    dw $0000 
    dw RTS_8F91F4 

RoomDoors_WarehouseSave:
    dw Door_WarehouseSave_0 

RoomHeader_RedBrinstarSave:
    db $37,$01,$26,$08,$01,$01,$70,$A0,$00 
    dw RoomDoors_RedBrinstarSave 
    dw Use_StatePointer_inX 

RoomState_RedBrinstarSave:
    dl LevelData_SaveStation_LeftSideDoor 
    db $19,$12,$05 
    dw FXHeader_RedBrinstarSave 
    dw EnemyPopulations_RedBrinstarSave 
    dw EnemySets_RedBrinstarSave 
    db $00,$00 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_RedBrinstarSave 
    dw $0000 
    dw RTS_8F91F4 

RoomDoors_RedBrinstarSave:
    dw Door_RedBrinstarSave_0 

RoomHeader_IceBeamAcid:
    db $00,$02,$04,$03,$02,$01,$70,$A0,$00 
    dw RoomDoors_IceBeamAcid 
    dw Use_StatePointer_inX 

RoomState_IceBeamAcid:
    dl LevelData_IceBeamAcid 
    db $09,$00,$00 
    dw FXHeader_IceBeamAcid 
    dw EnemyPopulations_IceBeamAcid 
    dw EnemySets_IceBeamAcid 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_IceBeamAcid 
    dw LibBG_Norfair_9_A_SmallPatternBrownPurple_Bright 
    dw RTS_8F91F5 

RoomDoors_IceBeamAcid:
    dw Door_IceBeamAcid_0 
    dw Door_IceBeamAcid_1 

RoomHeader_Cathedral:
    db $01,$02,$0E,$03,$03,$02,$70,$A0,$00 
    dw RoomDoors_Cathedral 
    dw Use_StatePointer_inX 

RoomState_Cathedral:
    dl LevelData_Cathedral 
    db $09,$00,$00 
    dw FXHeader_Cathedral 
    dw EnemyPopulations_Cathedral 
    dw EnemySets_Cathedral 
    db $00,$00 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Cathedral 
    dw $0000 
    dw RTS_8F91F5 

RoomDoors_Cathedral:
    dw Door_Cathedral_0 
    dw Door_Cathedral_1 

RoomHeader_CathedralEntrance:
    db $02,$02,$0B,$03,$03,$02,$70,$A0,$00 
    dw RoomDoors_CathedralEntrance 
    dw Use_StatePointer_inX 

RoomState_CathedralEntrance:
    dl LevelData_CathedralEntrance 
    db $09,$00,$00 
    dw FXHeader_CathedralEntrance 
    dw EnemyPopulations_CathedralEntrance 
    dw EnemySets_CathedralEntrance 
    db $00,$00 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_CathedralEntrance 
    dw $0000 
    dw RTS_8F91F5 

RoomDoors_CathedralEntrance:
    dw Door_CathedralEntrance_0 
    dw Door_CathedralEntrance_1 

RoomHeader_BusinessCenter:
    db $03,$02,$0A,$00,$01,$07,$70,$A0,$00 
    dw RoomDoors_BusinessCenter 
    dw Use_StatePointer_inX 

RoomState_BusinessCenter:
    dl LevelData_BusinessCenter 
    db $0A,$15,$05 
    dw FXHeader_BusinessCenter 
    dw EnemyPopulations_BusinessCenter 
    dw EnemySets_BusinessCenter 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_BusinessCenter 
    dw LibBG_Norfair_9_A_CavernVertical 
    dw RTS_8F91F5 

RoomDoors_BusinessCenter:
    dw Door_BusinessCenter_0 
    dw Door_BusinessCenter_1 
    dw Door_BusinessCenter_2 
    dw Door_BusinessCenter_3 
    dw Door_BusinessCenter_4 
    dw Door_VariousRooms_Elevator 
    dw Door_BusinessCenter_6 
    dw Door_BusinessCenter_7 

RoomHeader_IceBeamGate:
    db $04,$02,$03,$01,$07,$04,$70,$A0,$00 
    dw RoomDoors_IceBeamGate 
    dw Use_StatePointer_inX 

RoomState_IceBeamGate:
    dl LevelData_IceBeamGate 
    db $0A,$00,$00 
    dw FXHeader_IceBeamGate 
    dw EnemyPopulations_IceBeamGate 
    dw EnemySets_IceBeamGate 
    db $C1,$C1 
    dw RoomScrolls_IceBeamGate 
    dw $0000 
    dw $0000 
    dw PLMPopulation_IceBeamGate 
    dw LibBG_Norfair_9_A_SmallPatternBrownPurple_0 
    dw RTS_8F91F5 

RoomDoors_IceBeamGate:
    dw Door_IceBeamGate_0 
    dw Door_IceBeamGate_1 
    dw Door_IceBeamGate_2 
    dw Door_IceBeamGate_3 

RoomScrolls_IceBeamGate:
    db $00,$00,$00,$02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$01,$01,$01,$01,$01,$01,$01,$00,$00,$00,$00 

RoomPLM_IceBeamGate_0:
    db $11,$02,$18,$01,$80 

RoomHeader_IceBeamTutorial:
    db $05,$02,$04,$01,$02,$01,$70,$A0,$00 
    dw RoomDoors_IceBeamTutorial 
    dw Use_StatePointer_inX 

RoomState_IceBeamTutorial:
    dl LevelData_IceBeamTutorial 
    db $09,$00,$00 
    dw FXHeader_IceBeamTutorial 
    dw EnemyPopulations_IceBeamTutorial 
    dw EnemySets_IceBeamTutorial 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_IceBeamTutorial 
    dw LibBG_Norfair_9_A_SmallPatternBrownPurple_Bright 
    dw RTS_8F91F5 

RoomDoors_IceBeamTutorial:
    dw Door_IceBeamTutorial_0 
    dw Door_IceBeamTutorial_1 

RoomHeader_IceBeam:
    db $06,$02,$05,$02,$01,$01,$70,$A0,$00 
    dw RoomDoors_IceBeam 
    dw Use_StatePointer_inX 

RoomState_IceBeam:
    dl LevelData_IceBeam 
    db $0A,$00,$03 
    dw FXHeader_IceBeam 
    dw EnemyPopulations_IceBeam 
    dw EnemySets_IceBeam 
    db $01,$01 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_IceBeam 
    dw LibBG_Norfair_9_A_SmallPatternBrownPurple_0 
    dw RTS_8F91F5 

RoomDoors_IceBeam:
    dw Door_IceBeam_0 

RoomHeader_IceBeamSnake:
    db $07,$02,$03,$01,$02,$03,$70,$A0,$00 
    dw RoomDoors_IceBeamSnake 
    dw Use_StatePointer_inX 

RoomState_IceBeamSnake:
    dl LevelData_IceBeamSnake 
    db $09,$00,$05 
    dw FXHeader_IceBeamSnake 
    dw EnemyPopulations_IceBeamSnake 
    dw EnemySets_IceBeamSnake 
    db $C1,$C1 
    dw RoomScrolls_IceBeamSnake 
    dw $0000 
    dw $0000 
    dw PLMPopulation_IceBeamSnake 
    dw LibBG_Norfair_9_A_SmallPatternBrownPurple_0 
    dw RTS_8F91F5 

RoomDoors_IceBeamSnake:
    dw Door_IceBeamSnake_0 
    dw Door_IceBeamSnake_1 
    dw Door_IceBeamSnake_2 

RoomScrolls_IceBeamSnake:
    db $02,$00,$02,$00,$01,$00 

RoomPLM_IceBeamSnake_0:
    db $03,$01,$80 

RoomPLM_IceBeamSnake_1:
    db $03,$00,$80 

RoomPLM_IceBeamSnake_2:
    db $02,$02,$80 

RoomPLM_IceBeamSnake_3:
    db $02,$00,$80 

RoomHeader_CrumbleShaft:
    db $08,$02,$02,$04,$01,$04,$70,$A0,$00 
    dw RoomDoors_CrumbleShaft 
    dw Use_StatePointer_inX 

RoomState_CrumbleShaft:
    dl LevelData_CrumbleShaft 
    db $09,$00,$00 
    dw FXHeader_CrumbleShaft 
    dw EnemyPopulations_CrumbleShaft 
    dw EnemySets_CrumbleShaft 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_CrumbleShaft 
    dw LibBG_Norfair_9_A_CavernVertical 
    dw RTS_8F91F5 

RoomDoors_CrumbleShaft:
    dw Door_CrumbleShaft_0 
    dw Door_CrumbleShaft_1 

RoomHeader_CrocomireSpeedway:
    db $09,$02,$03,$07,$0D,$03,$70,$A0,$02 
    dw RoomDoors_CrocomireSpeedway 
    dw Use_StatePointer_inX 

RoomState_CrocomireSpeedway:
    dl LevelData_CrocomireSpeedway 
    db $09,$15,$05 
    dw FXHeader_CrocomireSpeedway 
    dw EnemyPopulations_CrocomireSpeedway 
    dw EnemySets_CrocomireSpeedway 
    db $C1,$C1 
    dw RoomScrolls_CrocomireSpeedway 
    dw $0000 
    dw $0000 
    dw PLMPopulation_CrocomireSpeedway 
    dw LibBG_Norfair_9_A_SmallPatternBrownPurple_0 
    dw RTS_8F91F5 

RoomDoors_CrocomireSpeedway:
    dw Door_CrocomireSpeedway_0 
    dw Door_CrocomireSpeedway_1 
    dw Door_CrocomireSpeedway_2 
    dw Door_CrocomireSpeedway_3 
    dw Door_CrocomireSpeedway_4 

RoomScrolls_CrocomireSpeedway:
    db $01,$01,$01,$02,$02,$00,$00,$00,$00,$00,$00,$00,$02,$00,$00,$00 
    db $02,$02,$02,$02,$00,$00,$00,$00,$00,$02,$00,$00,$00,$00,$00,$02 
    db $02,$02,$02,$02,$02,$00,$02 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_RoomPLM_8FA97B:
    db $19,$02,$26,$02,$80 
endif ; !FEATURE_KEEP_UNREFERENCED

RoomPLM_CrocomireSpeedway_0:
    db $19,$02,$25,$02,$26,$02,$80 

RoomPLM_CrocomireSpeedway_5:
    db $25,$02,$80 

RoomPLM_CrocomireSpeedway_8:
    db $25,$00,$80 

RoomHeader_Crocomire:
    db $0A,$02,$0C,$0A,$08,$01,$70,$A0,$01 
    dw RoomDoors_Crocomire 
    dw RoomStateCheck_BossIsDead 
    db $02 
    dw RoomState_Crocomire_1 
    dw Use_StatePointer_inX 

RoomState_Crocomire_0:
    dl LevelData_Crocomire 
    db $1B,$27,$05 
    dw FXHeader_Crocomire_State0_1 
    dw EnemyPopulations_Crocomire 
    dw EnemySets_Crocomire 
    db $01,$01 
    dw RoomScrolls_Crocomire 
    dw $0000 
    dw MainASM_CrocomiresRoomShaking 
    dw PLMPopulation_Crocomire_State0_1 
    dw LibBG_Crocomire_State0 
    dw RTS_8F91F6 

RoomState_Crocomire_1:
    dl LevelData_Crocomire 
    db $1B,$00,$00 
    dw FXHeader_Crocomire_State0_1 
    dw EnemyPopulations_Crocomire 
    dw EnemySets_Crocomire 
    db $01,$01 
    dw RoomScrolls_Crocomire 
    dw $0000 
    dw MainASM_CrocomiresRoomShaking 
    dw PLMPopulation_Crocomire_State0_1 
    dw LibBG_Crocomire_State1 
    dw RTS_8F91F6 

RoomDoors_Crocomire:
    dw Door_Crocomire_0 
    dw Door_Crocomire_1 

RoomScrolls_Crocomire:
    db $00,$00,$01,$01,$01,$01,$01,$01 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_RoomPLM_8FA9DF:
    db $01,$01,$80 

UNUSED_RoomPLM_8FA9E2:
    db $00,$01,$80 
endif ; !FEATURE_KEEP_UNREFERENCED

RoomHeader_HiJumpBoots:
    db $0B,$02,$07,$06,$01,$01,$70,$A0,$00 
    dw RoomDoors_HiJumpBoots 
    dw Use_StatePointer_inX 

RoomState_HiJumpBoots:
    dl LevelData_HiJumpBoots 
    db $0A,$00,$03 
    dw FXHeader_HiJumpBoots 
    dw EnemyPopulations_HiJumpBoots 
    dw EnemySets_HiJumpBoots 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_HiJumpBoots 
    dw LibBG_Norfair_9_A_SmallPatternBrownPurple_Bright 
    dw RTS_8F91F6 

RoomDoors_HiJumpBoots:
    dw Door_HiJumpBoots_0 

RoomHeader_CrocomireEscape:
    db $0C,$02,$0B,$06,$04,$02,$90,$A0,$00 
    dw RoomDoors_CrocomireEscape 
    dw Use_StatePointer_inX 

RoomState_CrocomireEscape:
    dl LevelData_CrocomireEscape 
    db $09,$00,$00 
    dw FXHeader_CrocomireEscape 
    dw EnemyPopulations_CrocomireEscape 
    dw EnemySets_CrocomireEscape 
    db $C0,$00 
    dw RoomScrolls_CrocomireEscape 
    dw $0000 
    dw $0000 
    dw PLMPopulation_CrocomireEscape 
    dw $0000 
    dw RTS_8F91F6 

RoomDoors_CrocomireEscape:
    dw Door_CrocomireEscape_0 
    dw Door_CrocomireEscape_1 

RoomScrolls_CrocomireEscape:
    db $02,$02,$02,$02,$01,$01,$01,$01 

RoomHeader_HiJumpETank:
    db $0D,$02,$08,$05,$02,$02,$70,$A0,$00 
    dw RoomDoors_HiJumpETank 
    dw Use_StatePointer_inX 

RoomState_HiJumpETank:
    dl LevelData_HiJumpETank 
    db $0A,$00,$05 
    dw FXHeader_HiJumpETank 
    dw EnemyPopulations_HiJumpETank 
    dw EnemySets_HiJumpETank 
    db $C0,$00 
    dw RoomScrolls_HiJumpETank 
    dw $0000 
    dw $0000 
    dw PLMPopulation_HiJumpETank 
    dw $0000 
    dw RTS_8F91F6 

RoomDoors_HiJumpETank:
    dw Door_HiJumpETank_0 
    dw Door_HiJumpETank_1 

RoomScrolls_HiJumpETank:
    db $00,$01,$00,$00 

RoomPLM_HiJumpETank_1:
    db $00,$02,$02,$02,$80 

RoomPLM_HiJumpETank_0:
    db $00,$02,$02,$02,$03,$02,$80 

RoomPLM_HiJumpETank_2:
    db $03,$00,$80 

RoomPLM_HiJumpETank_3:
    db $03,$02,$80 

RoomHeader_PostCrocFarming:
    db $0E,$02,$0A,$0A,$02,$02,$90,$A0,$02 
    dw RoomDoors_PostCrocFarming 
    dw Use_StatePointer_inX 

RoomState_PostCrocFarming:
    dl LevelData_PostCrocFarming 
    db $09,$15,$05 
    dw FXHeader_PostCrocFarming 
    dw EnemyPopulations_PostCrocFarming 
    dw EnemySets_PostCrocFarming 
    db $00,$00 
    dw RoomScrolls_PostCrocFarming 
    dw $0000 
    dw $0000 
    dw PLMPopulation_PostCrocFarming 
    dw $0000 
    dw RTS_8F91F6 

RoomDoors_PostCrocFarming:
    dw Door_PostCrocFarming_0 
    dw Door_PostCrocFarming_1 
    dw Door_PostCrocFarming_2 
    dw Door_PostCrocFarming_3 

RoomScrolls_PostCrocFarming:
    db $02,$02,$02,$02 

RoomHeader_PostCrocSave:
    db $0F,$02,$0C,$0B,$01,$01,$70,$A0,$00 
    dw RoomDoors_PostCrocSave 
    dw Use_StatePointer_inX 

RoomState_PostCrocSave:
    dl LevelData_SaveStation_LeftSideDoor 
    db $19,$15,$05 
    dw FXHeader_PostCrocSave 
    dw EnemyPopulations_PostCrocSave 
    dw EnemySets_PostCrocSave 
    db $00,$00 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_PostCrocSave 
    dw $0000 
    dw RTS_8F91F6 

RoomDoors_PostCrocSave:
    dw Door_PostCrocSave_0 

RoomHeader_PostCrocPowerBombs:
    db $10,$02,$09,$0A,$01,$01,$70,$A0,$00,$05,$AB,$E6,$E5 

RoomState_PostCrocPowerBombs:
    dl LevelData_PostCrocPowerBombs 
    db $09,$00,$00 
    dw FXHeader_PostCrocPowerBombs 
    dw EnemyPopulations_PostCrocPowerBombs 
    dw EnemySets_PostCrocPowerBombs 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_PostCrocPowerBombs 
    dw LibBG_Norfair_9_A_CavernStalagtites 
    dw RTS_8F91F6 

RoomDoors_PostCrocPowerBombs:
    dw Door_PostCrocPowerBombs_0 

RoomHeader_PostCrocShaft:
    db $11,$02,$0A,$0C,$01,$05,$90,$A0,$00 
    dw RoomDoors_PostCrocShaft 
    dw Use_StatePointer_inX 

RoomState_PostCrocShaft:
    dl LevelData_PostCrocShaft 
    db $0A,$00,$00 
    dw FXHeader_PostCrocShaft 
    dw EnemyPopulations_PostCrocShaft 
    dw EnemySets_PostCrocShaft 
    db $C1,$C1 
    dw RoomScrolls_PostCrocShaft 
    dw $0000 
    dw $0000 
    dw PLMPopulation_PostCrocShaft 
    dw LibBG_Norfair_9_A_CavernVertical 
    dw RTS_8F91F6 

RoomDoors_PostCrocShaft:
    dw Door_PostCrocShaft_0 
    dw Door_PostCrocShaft_1 
    dw Door_PostCrocShaft_2 
    dw Door_PostCrocShaft_3 

RoomScrolls_PostCrocShaft:
    db $02,$02,$02,$02,$02 

RoomHeader_PostCrocMissile:
    db $12,$02,$0B,$0F,$04,$01,$70,$A0,$00 
    dw RoomDoors_PostCrocMissile 
    dw Use_StatePointer_inX 

RoomState_PostCrocMissile:
    dl LevelData_PostCrocMissile 
    db $0A,$00,$00 
    dw FXHeader_PostCrocMissile 
    dw EnemyPopulations_PostCrocMissile 
    dw EnemySets_PostCrocMissile 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_PostCrocMissile 
    dw LibBG_Norfair_9_A_CavernStalagtites 
    dw RTS_8F91F6 

RoomDoors_PostCrocMissile:
    dw Door_PostCrocMissile_0 

RoomHeader_GrappleTutorial3:
    db $13,$02,$07,$0C,$03,$02,$90,$A0,$00 
    dw RoomDoors_GrappleTutorial3 
    dw Use_StatePointer_inX 

RoomState_GrappleTutorial3:
    dl LevelData_GrappleTutorial3 
    db $0A,$00,$00 
    dw FXHeader_GrappleTutorial3 
    dw EnemyPopulations_GrappleTutorial3 
    dw EnemySets_GrappleTutorial3 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_GrappleTutorial3 
    dw LibBG_Norfair_9_A_SmallPatternBrownPurple_0 
    dw RTS_8F91F6 

RoomDoors_GrappleTutorial3:
    dw Door_GrappleTutorial3_0 
    dw Door_GrappleTutorial3_1 

RoomHeader_PostCrocJump:
    db $14,$02,$04,$0F,$08,$03,$90,$A0,$00 
    dw RoomDoors_PostCrocJump 
    dw Use_StatePointer_inX 

RoomState_PostCrocJump:
    dl LevelData_PostCrocJump 
    db $0A,$00,$05 
    dw FXHeader_PostCrocJump 
    dw EnemyPopulations_PostCrocJump 
    dw EnemySets_PostCrocJump 
    db $C0,$00 
    dw RoomScrolls_PostCrocJump 
    dw $0000 
    dw $0000 
    dw PLMPopulation_PostCrocJump 
    dw $0000 
    dw RTS_8F91F6 

RoomDoors_PostCrocJump:
    dw Door_PostCrocJump_0 
    dw Door_PostCrocJump_1 

RoomScrolls_PostCrocJump:
    db $02,$02,$02,$02,$02,$00,$00,$00,$02,$02,$02,$02,$02,$00,$00,$00 
    db $01,$01,$01,$01,$01,$01,$01,$01 

RoomHeader_GrappleTutorial2:
    db $15,$02,$06,$0C,$01,$03,$90,$A0,$00 
    dw RoomDoors_GrappleTutorial2 
    dw Use_StatePointer_inX 

RoomState_GrappleTutorial2:
    dl LevelData_GrappleTutorial2 
    db $0A,$00,$00 
    dw FXHeader_GrappleTutorial2 
    dw EnemyPopulations_GrappleTutorial2 
    dw EnemySets_GrappleTutorial2 
    db $C1,$C1 
    dw RoomScrolls_GrappleTutorial2 
    dw $0000 
    dw $0000 
    dw PLMPopulation_GrappleTutorial2 
    dw LibBG_Norfair_9_A_CavernVertical 
    dw RTS_8F91F6 

RoomDoors_GrappleTutorial2:
    dw Door_GrappleTutorial2_0 
    dw Door_GrappleTutorial2_1 

RoomScrolls_GrappleTutorial2:
    db $02,$02,$01 

RoomHeader_GrappleTutorial1:
    db $16,$02,$04,$0E,$02,$01,$70,$A0,$00 
    dw RoomDoors_GrappleTutorial1 
    dw Use_StatePointer_inX 

RoomState_GrappleTutorial1:
    dl LevelData_GrappleTutorial1 
    db $0A,$00,$05 
    dw FXHeader_GrappleTutorial1 
    dw EnemyPopulations_GrappleTutorial1 
    dw EnemySets_GrappleTutorial1 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_GrappleTutorial1 
    dw LibBG_Norfair_9_A_CavernStalagtites 
    dw RTS_8F91F6 

RoomDoors_GrappleTutorial1:
    dw Door_GrappleTutorial1_0 
    dw Door_GrappleTutorial1_1 

RoomHeader_GrappleBeam:
    db $17,$02,$03,$0E,$01,$04,$90,$A0,$00 
    dw RoomDoors_GrappleBeam 
    dw Use_StatePointer_inX 

RoomState_GrappleBeam:
    dl LevelData_GrappleBeam 
    db $0A,$00,$03 
    dw FXHeader_GrappleBeam 
    dw EnemyPopulations_GrappleBeam 
    dw EnemySets_GrappleBeam 
    db $C1,$C1 
    dw RoomScrolls_GrappleBeam 
    dw $0000 
    dw $0000 
    dw PLMPopulation_GrappleBeam 
    dw LibBG_Norfair_9_A_CavernVertical 
    dw RTS_8F91F6 

RoomDoors_GrappleBeam:
    dw Door_GrappleBeam_0 
    dw Door_GrappleBeam_1 

RoomScrolls_GrappleBeam:
    db $02,$02,$01,$00 

RoomHeader_NorfairReserveTank:
    db $18,$02,$12,$02,$02,$01,$70,$A0,$00 
    dw RoomDoors_NorfairReserveTank 
    dw Use_StatePointer_inX 

RoomState_NorfairReserveTank:
    dl LevelData_NorfairReserveTank 
    db $09,$00,$00 
    dw FXHeader_NorfairReserveTank 
    dw EnemyPopulations_NorfairReserveTank 
    dw EnemySets_NorfairReserveTank 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_NorfairReserveTank 
    dw LibBG_Norfair_9_PurplePatches 
    dw RTS_8F91F6 

RoomDoors_NorfairReserveTank:
    dw Door_NorfairReserveTank 

RoomHeader_GreenBubblesMissiles:
    db $19,$02,$14,$02,$02,$01,$70,$A0,$00 
    dw RoomDoors_GreenBubblesMissiles 
    dw Use_StatePointer_inX 

RoomState_GreenBubblesMissiles:
    dl LevelData_GreenBubblesMissiles 
    db $09,$00,$00 
    dw FXHeader_GreenBubblesMissiles 
    dw EnemyPopulations_GreenBubblesMissiles 
    dw EnemySets_GreenBubblesMissiles 
    db $C1,$C1 
    dw RoomScrolls_GreenBubblesMissiles 
    dw $0000 
    dw $0000 
    dw PLMPopulation_GreenBubblesMissiles 
    dw LibBG_Norfair_9_Bubbles 
    dw RTS_8F91F6 

RoomDoors_GreenBubblesMissiles:
    dw Door_GreenBubblesMissiles_0 
    dw Door_GreenBubblesMissiles_1 

RoomScrolls_GreenBubblesMissiles:
    db $00,$01 

RoomPLM_GreenBubblesMissiles_0:
    db $00,$01,$80 

RoomHeader_BubbleMountain:
    db $1A,$02,$16,$02,$02,$04,$90,$A0,$00 
    dw RoomDoors_BubbleMountain 
    dw Use_StatePointer_inX 

RoomState_BubbleMountain:
    dl LevelData_BubbleMountain 
    db $09,$00,$00 
    dw FXHeader_BubbleMountain 
    dw EnemyPopulations_BubbleMountain 
    dw EnemySets_BubbleMountain 
    db $C1,$C1 
    dw RoomScrolls_BubbleMountain 
    dw $0000 
    dw $0000 
    dw PLMPopulation_BubbleMountain 
    dw LibBG_Norfair_9_Bubbles 
    dw RTS_8F91F6 

RoomDoors_BubbleMountain:
    dw Door_BubbleMountain_0 
    dw Door_BubbleMountain_1 
    dw Door_BubbleMountain_2 
    dw Door_BubbleMountain_3 
    dw Door_BubbleMountain_4 
    dw Door_BubbleMountain_5 
    dw Door_BubbleMountain_6 

RoomScrolls_BubbleMountain:
    db $02,$02,$02,$02,$02,$02,$02,$02 

RoomHeader_SpeedBoosterHall:
    db $1B,$02,$19,$01,$0C,$02,$70,$A0,$00 
    dw RoomDoors_SpeedBoosterHall 
    dw Use_StatePointer_inX 

RoomState_SpeedBoosterHall:
    dl LevelData_SpeedBoosterHall 
    db $09,$00,$05 
    dw FXHeader_SpeedBoosterHall 
    dw EnemyPopulations_SpeedBoosterHall 
    dw EnemySets_SpeedBoosterHall 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_SpeedBoosterHall 
    dw LibBG_Norfair_9_A_SmallPatternBrownPurple_0 
    dw RTS_8F91F6 

RoomDoors_SpeedBoosterHall:
    dw Door_SpeedBoosterHall_0 
    dw Door_SpeedBoosterHall_1 

RoomHeader_SpeedBooster:
    db $1C,$02,$25,$02,$01,$01,$70,$A0,$00 
    dw RoomDoors_SpeedBooster 
    dw Use_StatePointer_inX 

RoomState_SpeedBooster:
    dl LevelData_SpeedBooster 
    db $09,$00,$03 
    dw FXHeader_SpeedBooster 
    dw EnemyPopulations_SpeedBooster 
    dw EnemySets_SpeedBooster 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_SpeedBooster 
    dw LibBG_Norfair_9_A_SmallPatternBrownPurple_Bright 
    dw RTS_8F91F6 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_RoomState_8FAD42:
    dl LevelData_SpeedBooster 
    db $09,$00,$03 
    dw FXHeader_SpeedBooster 
    dw EnemyPopulations_SpeedBooster 
    dw EnemySets_SpeedBooster 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_SpeedBooster 
    dw LibBG_Norfair_9_A_SmallPatternBrownPurple_Bright 
    dw RTS_8F91F6 
endif ; !FEATURE_KEEP_UNREFERENCED

RoomDoors_SpeedBooster:
    dw Door_SpeedBooster_0 

RoomHeader_SingleChamber:
    db $1D,$02,$18,$03,$06,$04,$70,$A0,$00 
    dw RoomDoors_SingleChamber 
    dw Use_StatePointer_inX 

RoomState_SingleChamber:
    dl LevelData_SingleChamber 
    db $09,$15,$05 
    dw FXHeader_SingleChamber 
    dw EnemyPopulations_SingleChamber 
    dw EnemySets_SingleChamber 
    db $C0,$C0 
    dw RoomScrolls_SingleChamber 
    dw $0000 
    dw $0000 
    dw PLMPopulation_SingleChamber 
    dw $0000 
    dw RTS_8F91F6 

RoomDoors_SingleChamber:
    dw Door_SingleChamber_0 
    dw Door_SingleChamber_1 
    dw Door_SingleChamber_2 
    dw Door_SingleChamber_3 
    dw Door_SingleChamber_4 

RoomScrolls_SingleChamber:
    db $02,$00,$01,$01,$01,$01,$02,$00,$00,$00,$00,$00,$02,$00,$00,$00 
    db $00,$00,$01,$00,$00,$00,$00,$00 

RoomPLM_SingleChamber_0:
    db $01,$00,$80 

RoomPLM_SingleChamber_1_4:
    db $01,$01,$80 

RoomHeader_DoubleChamber:
    db $1E,$02,$19,$04,$04,$02,$90,$A0,$00 
    dw RoomDoors_DoubleChamber 
    dw Use_StatePointer_inX 

RoomState_DoubleChamber:
    dl LevelData_DoubleChamber 
    db $09,$00,$05 
    dw FXHeader_DoubleChamber 
    dw EnemyPopulations_DoubleChamber 
    dw EnemySets_DoubleChamber 
    db $C0,$00 
    dw RoomScrolls_DoubleChamber 
    dw $0000 
    dw $0000 
    dw PLMPopulation_DoubleChamber 
    dw $0000 
    dw RTS_8F91F6 

RoomDoors_DoubleChamber:
    dw Door_DoubleChamber_0 
    dw Door_DoubleChamber_1 
    dw Door_DoubleChamber_2 

RoomScrolls_DoubleChamber:
    db $02,$02,$02,$02 

RoomHeader_WaveBeam:
    db $1F,$02,$1D,$04,$01,$01,$70,$A0,$00 
    dw RoomDoors_WaveBeam 
    dw Use_StatePointer_inX 

RoomState_WaveBeam:
    dl LevelData_WaveBeam 
    db $09,$00,$03 
    dw FXHeader_WaveBeam 
    dw EnemyPopulations_WaveBeam 
    dw EnemySets_WaveBeam 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_WaveBeam 
    dw LibBG_Norfair_9_A_CavernStalagtites 
    dw RTS_8F91F6 

RoomDoors_WaveBeam:
    dw Door_WaveBeam_0 

RoomHeader_SpikyPlatformsTunnel:
    db $20,$02,$19,$06,$04,$01,$70,$A0,$00 
    dw RoomDoors_SpikyPlatformsTunnel 
    dw Use_StatePointer_inX 

RoomState_SpikyPlatformsTunnel:
    dl LevelData_SpikyPlatformsTunnel 
    db $09,$00,$00 
    dw FXHeader_SpikyPlatformsTunnel 
    dw EnemyPopulations_SpikyPlatformsTunnel 
    dw EnemySets_SpikyPlatformsTunnel 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_SpikyPlatformsTunnel 
    dw LibBG_Norfair_9_A_CavernStalagtites 
    dw RTS_8F91F6 

RoomDoors_SpikyPlatformsTunnel:
    dw Door_SpikyPlatformsTunnel_0 
    dw Door_SpikyPlatformsTunnel_1 

RoomHeader_Volcano:
    db $21,$02,$1B,$06,$03,$03,$70,$A0,$00 
    dw RoomDoors_Volcano 
    dw Use_StatePointer_inX 

RoomState_Volcano:
    dl LevelData_Volcano 
    db $09,$00,$00 
    dw FXHeader_Volcano 
    dw EnemyPopulations_Volcano 
    dw EnemySets_Volcano 
    db $00,$00 
    dw RoomScrolls_Volcano 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Volcano 
    dw $0000 
    dw RTS_8F91F6 

RoomDoors_Volcano:
    dw Door_Volcano_0 
    dw Door_Volcano_1 

RoomScrolls_Volcano:
    db $00,$00,$02,$00,$00,$02,$00,$00,$01 

RoomPLM_Volcano_0:
    db $06,$01,$07,$01,$80 

RoomPLM_Volcano_1:
    db $08,$01,$80 

RoomPLM_Volcano_7:
    db $08,$00,$80 

RoomPLM_Volcano_B:
    db $07,$00,$80 

RoomHeader_KronicBoost:
    db $22,$02,$19,$08,$02,$03,$70,$A0,$00 
    dw RoomDoors_KronicBoost 
    dw Use_StatePointer_inX 

RoomState_KronicBoost:
    dl LevelData_KronicBoost 
    db $09,$00,$00 
    dw FXHeader_KronicBoost 
    dw EnemyPopulations_KronicBoost 
    dw EnemySets_KronicBoost 
    db $00,$00 
    dw RoomScrolls_KronicBoost 
    dw $0000 
    dw $0000 
    dw PLMPopulation_KronicBoost 
    dw $0000 
    dw RTS_8F91F6 

RoomDoors_KronicBoost:
    dw Door_KronicBoost_0 
    dw Door_KronicBoost_1 
    dw Door_KronicBoost_2 
    dw Door_KronicBoost_3 

RoomScrolls_KronicBoost:
    db $00,$02,$00,$02,$00,$01 

RoomPLM_KronicBoost_0:
    db $02,$01,$80 

RoomPLM_KronicBoost_1:
    db $02,$00,$03,$02,$80 

RoomPLM_KronicBoost_5:
    db $03,$00,$80 

RoomHeader_MagdolliteTunnel:
    db $23,$02,$17,$08,$03,$01,$70,$A0,$00 
    dw RoomDoors_MagdolliteTunnel 
    dw Use_StatePointer_inX 

RoomState_MagdolliteTunnel:
    dl LevelData_MagdolliteTunnel 
    db $09,$00,$00 
    dw FXHeader_MagdolliteTunnel 
    dw EnemyPopulations_MagdolliteTunnel 
    dw EnemySets_MagdolliteTunnel 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_MagdolliteTunnel 
    dw LibBG_Norfair_9_A_CavernStalagtites 
    dw RTS_8F91F6 

RoomDoors_MagdolliteTunnel:
    dw Door_MagdolliteTunnel_0 
    dw Door_MagdolliteTunnel_1 

RoomHeader_PurpleShaft:
    db $24,$02,$16,$06,$01,$03,$A0,$A0,$00 
    dw RoomDoors_PurpleShaft 
    dw Use_StatePointer_inX 

RoomState_PurpleShaft:
    dl LevelData_PurpleShaft 
    db $09,$00,$00 
    dw FXHeader_PurpleShaft 
    dw EnemyPopulations_PurpleShaft 
    dw EnemySets_PurpleShaft 
    db $C1,$C1 
    dw RoomScrolls_PurpleShaft 
    dw $0000 
    dw $0000 
    dw PLMPopulation_PurpleShaft 
    dw LibBG_Norfair_9_PurplePatches 
    dw RTS_8F91F6 

RoomDoors_PurpleShaft:
    dw Door_PurpleShaft_0 
    dw Door_PurpleShaft_1 
    dw Door_PurpleShaft_2 

RoomScrolls_PurpleShaft:
    db $02,$02,$01 

RoomPLM_PurpleShaft_0_3:
    db $00,$02,$01,$02,$80 

RoomHeader_LavaDive:
    db $25,$02,$16,$0A,$04,$03,$70,$A0,$00 
    dw RoomDoors_LavaDive 
    dw Use_StatePointer_inX 

RoomState_LavaDive:
    dl LevelData_LavaDive 
    db $09,$00,$05 
    dw FXHeader_LavaDive 
    dw EnemyPopulations_LavaDive 
    dw EnemySets_LavaDive 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_LavaDive 
    dw LibBG_Norfair_9_A_SmallPatternBrownPurple_0 
    dw RTS_8F91F6 

RoomDoors_LavaDive:
    dw Door_LavaDive_0 
    dw Door_LavaDive_1 

RoomHeader_LowerNorfairElev:
    db $26,$02,$15,$0A,$01,$01,$70,$A0,$00 
    dw RoomDoors_LowerNorfairElev 
    dw Use_StatePointer_inX 

RoomState_LowerNorfairElev:
    dl LevelData_LowerNorfairElev 
    db $09,$15,$05 
    dw FXHeader_LowerNorfairElev 
    dw EnemyPopulations_LowerNorfairElev 
    dw EnemySets_LowerNorfairElev 
    db $C1,$C1 
    dw RoomScrolls_LowerNorfairElev 
    dw $0000 
    dw $0000 
    dw PLMPopulation_LowerNorfairElev 
    dw LibBG_Norfair_9_A_CavernStalagtites 
    dw RTS_8F91F6 

RoomDoors_LowerNorfairElev:
    dw Door_LowerNorfairElev_0 
    dw Door_LowerNorfairElev_1 
    dw Door_VariousRooms_Elevator 
    dw Door_LowerNorfairElev_3 

RoomScrolls_LowerNorfairElev:
    db $01 

RoomPLM_LowerNorfairElev_0:
    db $00,$02,$80 

RoomHeader_UpperNorfairFarming:
    db $27,$02,$14,$05,$02,$02,$A0,$A0,$00 
    dw RoomDoors_UpperNorfairFarming 
    dw Use_StatePointer_inX 

RoomState_UpperNorfairFarming:
    dl LevelData_UpperNorfairFarming 
    db $09,$00,$00 
    dw FXHeader_UpperNorfairFarming 
    dw EnemyPopulations_UpperNorfairFarming 
    dw EnemySets_UpperNorfairFarming 
    db $C0,$00 
    dw RoomScrolls_UpperNorfairFarming 
    dw $0000 
    dw $0000 
    dw PLMPopulation_UpperNorfairFarming 
    dw $0000 
    dw RTS_8F91F6 

RoomDoors_UpperNorfairFarming:
    dw Door_UpperNorfairFarming_0 
    dw Door_UpperNorfairFarming_1 
    dw Door_UpperNorfairFarming_2 

RoomScrolls_UpperNorfairFarming:
    db $02,$02,$01,$01 

RoomHeader_RisingTide:
    db $28,$02,$11,$04,$05,$01,$70,$A0,$00 
    dw RoomDoors_RisingTide 
    dw Use_StatePointer_inX 

RoomState_RisingTide:
    dl LevelData_RisingTide 
    db $09,$00,$00 
    dw FXHeader_RisingTide 
    dw EnemyPopulations_RisingTide 
    dw EnemySets_RisingTide 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_RisingTide 
    dw LibBG_Norfair_9_A_CavernStalagtites 
    dw RTS_8F91F6 

RoomDoors_RisingTide:
    dw Door_RisingTide_0 
    dw Door_RisingTide_1 

RoomHeader_AcidSnakesTunnel:
    db $29,$02,$10,$09,$04,$01,$70,$A0,$00 
    dw RoomDoors_AcidSnakesTunnel 
    dw Use_StatePointer_inX 

RoomState_AcidSnakesTunnel:
    dl LevelData_AcidSnakesTunnel 
    db $09,$00,$00 
    dw FXHeader_AcidSnakesTunnel 
    dw EnemyPopulations_AcidSnakesTunnel 
    dw EnemySets_AcidSnakesTunnel 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_AcidSnakesTunnel 
    dw LibBG_Norfair_9_A_CavernStalagtites 
    dw RTS_8F91F6 

RoomDoors_AcidSnakesTunnel:
    dw Door_AcidSnakesTunnel_0 
    dw Door_AcidSnakesTunnel_1 
    dw Door_AcidSnakesTunnel_2 

RoomHeader_SpikyAcidSnakesTunnel:
    db $2A,$02,$15,$09,$04,$01,$70,$A0,$00 
    dw RoomDoors_SpikyAcidSnakesTunnel 
    dw Use_StatePointer_inX 

RoomState_SpikyAcidSnakesTunnel:
    dl LevelData_SpikyAcidSnakesTunnel 
    db $09,$00,$00 
    dw FXHeader_SpikyAcidSnakesTunnel 
    dw EnemyPopulations_SpikyAcidSnakesTunnel 
    dw EnemySets_SpikyAcidSnakesTunnel 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_SpikyAcidSnakesTunnel 
    dw LibBG_Norfair_9_A_CavernStalagtites 
    dw RTS_8F91F6 

RoomDoors_SpikyAcidSnakesTunnel:
    dw Door_SpikyAcidSnakesTunnel_0 
    dw Door_SpikyAcidSnakesTunnel_1 

RoomHeader_UpperNorfairRefill:
    db $2B,$02,$14,$09,$01,$01,$70,$A0,$00 
    dw RoomDoors_UpperNorfairRefill 
    dw Use_StatePointer_inX 

RoomState_UpperNorfairRefill:
    dl LevelData_EnergyRefeill_BothDoors 
    db $17,$00,$00 
    dw FXHeader_UpperNorfairRefill 
    dw EnemyPopulations_UpperNorfairRefill 
    dw EnemySets_UpperNorfairRefill 
    db $00,$00 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_UpperNorfairRefill 
    dw $0000 
    dw RTS_8F91F6 

RoomDoors_UpperNorfairRefill:
    dw Door_UpperNorfairRefill_0 
    dw Door_UpperNorfairRefill_1 

RoomHeader_PurpleFarming:
    db $2C,$02,$17,$07,$01,$01,$70,$A0,$00 
    dw RoomDoors_PurpleFarming 
    dw Use_StatePointer_inX 

RoomState_PurpleFarming:
    dl LevelData_PurpleFarming 
    db $09,$00,$00 
    dw FXHeader_PurpleFarming 
    dw EnemyPopulations_PurpleFarming 
    dw EnemySets_PurpleFarming 
    db $01,$01 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_PurpleFarming 
    dw LibBG_Norfair_9_PurplePatches 
    dw RTS_8F91F6 

RoomDoors_PurpleFarming:
    dw Door_PurpleFarming_0 

RoomHeader_BatCave:
    db $2D,$02,$18,$01,$01,$02,$70,$A0,$00 
    dw RoomDoors_BatCave 
    dw Use_StatePointer_inX 

RoomState_BatCave:
    dl LevelData_BatCave 
    db $09,$00,$05 
    dw FXHeader_BatCave 
    dw EnemyPopulations_BatCave 
    dw EnemySets_BatCave 
    db $00,$00 
    dw RoomScrolls_BatCave 
    dw $0000 
    dw $0000 
    dw PLMPopulation_BatCave 
    dw $0000 
    dw RTS_8F91F6 

RoomDoors_BatCave:
    dw Door_BatCave_0 
    dw Door_BatCave_1 

RoomScrolls_BatCave:
    db $00,$01 

RoomPLM_BatCave_0:
    db $00,$02,$01,$02,$80 

RoomPLM_BatCave_2:
    db $00,$02,$01,$01,$80 

RoomPLM_BatCave_4:
    db $00,$00,$80 

RoomHeader_NorfairMap:
    db $2E,$02,$09,$04,$01,$01,$70,$A0,$00 
    dw RoomDoors_NorfairMap 
    dw Use_StatePointer_inX 

RoomState_NorfairMap:
    dl LevelData_MapStation_RightSideDoor 
    db $15,$00,$00 
    dw FXHeader_NorfairMap 
    dw EnemyPopulations_NorfairMap 
    dw EnemySets_NorfairMap 
    db $00,$00 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_NorfairMap 
    dw $0000 
    dw RTS_8F91F6 

RoomDoors_NorfairMap:
    dw Door_NorfairMap_0 

RoomHeader_BubbleMountainSave:
    db $2F,$02,$15,$03,$01,$01,$70,$A0,$00 
    dw RoomDoors_BubbleMountainSave 
    dw Use_StatePointer_inX 

RoomState_BubbleMountainSave:
    dl LevelData_SaveStation_RightSideDoor 
    db $19,$15,$05 
    dw FXHeader_BubbleMountainSave 
    dw EnemyPopulations_BubbleMountainSave 
    dw EnemySets_BubbleMountainSave 
    db $00,$00 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_BubbleMountainSave 
    dw $0000 
    dw RTS_8F91F6 

RoomDoors_BubbleMountainSave:
    dw Door_BubbleMountainSave_0 

RoomHeader_FrogSpeedway:
    db $30,$02,$0C,$05,$08,$01,$70,$A0,$00 
    dw RoomDoors_FrogSpeedway 
    dw Use_StatePointer_inX 

RoomState_FrogSpeedway:
    dl LevelData_FrogSpeedway 
    db $0A,$00,$00 
    dw FXHeader_FrogSpeedway 
    dw EnemyPopulations_FrogSpeedway 
    dw EnemySets_FrogSpeedway 
    db $C1,$01 
    dw RoomScrolls_FrogSpeedway 
    dw $0000 
    dw $0000 
    dw PLMPopulation_FrogSpeedway 
    dw LibBG_Norfair_9_A_SmallPatternBrownPurple_Bright 
    dw RTS_8F91F6 

RoomDoors_FrogSpeedway:
    dw Door_FrogSpeedway_0 
    dw Door_FrogSpeedway_1 

RoomScrolls_FrogSpeedway:
    db $01,$01,$01,$01,$01,$01,$01,$01 

RoomHeader_RedPirateShaft:
    db $31,$02,$13,$06,$01,$03,$70,$A0,$00 
    dw RoomDoors_RedPirateShaft 
    dw Use_StatePointer_inX 

RoomState_RedPirateShaft:
    dl LevelData_RedPirateShaft 
    db $09,$00,$00 
    dw FXHeader_RedPirateShaft 
    dw EnemyPopulations_RedPirateShaft 
    dw EnemySets_RedPirateShaft 
    db $01,$C1 
    dw RoomScrolls_RedPirateShaft 
    dw $0000 
    dw $0000 
    dw PLMPopulation_RedPirateShaft 
    dw LibBG_Norfair_9_A_CavernVertical 
    dw RTS_8F91F6 

RoomDoors_RedPirateShaft:
    dw Door_RedPirateShaft_0 
    dw Door_RedPirateShaft_1 

RoomScrolls_RedPirateShaft:
    db $02,$02,$02 

RoomHeader_FrogSave:
    db $32,$02,$0B,$05,$01,$01,$70,$A0,$00 
    dw RoomDoors_FrogSave 
    dw Use_StatePointer_inX 

RoomState_FrogSave:
    dl LevelData_SaveStation_BothDoors 
    db $19,$15,$05 
    dw FXHeader_FrogSave 
    dw EnemyPopulations_FrogSave 
    dw EnemySets_FrogSave 
    db $00,$00 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_FrogSave 
    dw $0000 
    dw RTS_8F91F6 

RoomDoors_FrogSave:
    dw Door_FrogSave_0 
    dw Door_FrogSave_1 

RoomHeader_CrocomireSave:
    db $33,$02,$10,$08,$01,$01,$70,$A0,$00 
    dw RoomDoors_CrocomireSave 
    dw Use_StatePointer_inX 

RoomState_CrocomireSave:
    dl LevelData_SaveStation_LeftSideDoor 
    db $19,$15,$05 
    dw FXHeader_CrocomireSave 
    dw EnemyPopulations_CrocomireSave 
    dw EnemySets_CrocomireSave 
    db $00,$00 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_CrocomireSave 
    dw $0000 
    dw RTS_8F91F6 

RoomDoors_CrocomireSave:
    dw Door_CrocomireSave_0 

RoomHeader_LNElevSave:
    db $34,$02,$14,$0A,$01,$01,$70,$A0,$00 
    dw RoomDoors_LNElevSave 
    dw Use_StatePointer_inX 

RoomState_LNElevSave:
    dl LevelData_SaveStation_RightSideDoor 
    db $19,$15,$05 
    dw FXHeader_LNElevSave 
    dw EnemyPopulations_LNElevSave 
    dw EnemySets_LNElevSave 
    db $00,$00 
    dw RoomScrolls_LNElevSave 
    dw $0000 
    dw $0000 
    dw PLMPopulation_LNElevSave 
    dw $0000 
    dw $0000 

RoomDoors_LNElevSave:
    dw Door_LNElevSave_0 

RoomScrolls_LNElevSave:
    db $01 

RoomHeader_AcidStatue:
    db $35,$02,$0F,$0D,$03,$03,$90,$A0,$00 
    dw RoomDoors_AcidStatue 
    dw Use_StatePointer_inX 

RoomState_AcidStatue:
    dl LevelData_AcidStatue 
    db $09,$18,$05 
    dw FXHeader_AcidStatue 
    dw EnemyPopulations_AcidStatue 
    dw EnemySets_AcidStatue 
    db $C1,$C1 
    dw RoomScrolls_AcidStatue 
    dw $0000 
    dw $0000 
    dw PLMPopulation_AcidStatue 
    dw LibBG_Norfair_9_CavernRoomPillars 
    dw RTS_8F91F7 

RoomDoors_AcidStatue:
    dw Door_AcidStatue_0 
    dw Door_AcidStatue_1 

RoomScrolls_AcidStatue:
    db $02,$02,$00,$01,$01,$00,$00,$00,$00 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_RoomPLM_8FB219:
    db $03,$01,$04,$01,$06,$00,$07,$00,$08,$00,$80 
endif ; !FEATURE_KEEP_UNREFERENCED

RoomPLM_AcidStatue_0:
    db $03,$02,$04,$02,$06,$02,$07,$02,$80 

RoomPLM_AcidStatue_1:
    db $04,$00,$06,$01,$07,$01,$08,$01,$80 

RoomHeader_MainHall:
    db $36,$02,$11,$0B,$08,$03,$70,$A0,$00 
    dw RoomDoors_MainHall 
    dw Use_StatePointer_inX 

RoomState_MainHall:
    dl LevelData_MainHall 
    db $09,$18,$05 
    dw FXHeader_MainHall 
    dw EnemyPopulations_MainHall 
    dw EnemySets_MainHall 
    db $C1,$01 
    dw RoomScrolls_MainHall 
    dw $0000 
    dw $0000 
    dw PLMPopulation_MainHall 
    dw LibBG_Norfair_9_CavernVerticalRuins 
    dw RTS_8F91F7 

RoomDoors_MainHall:
    dw Door_MainHall_0 
    dw Door_MainHall_1 
    dw Door_MainHall_2 
    dw Door_VariousRooms_Elevator 

RoomScrolls_MainHall:
    db $00,$00,$00,$00,$02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $01,$01,$01,$01,$01,$01,$01,$01 

RoomPLM_MainHall_0_2:
    db $0C,$02,$80 

RoomPLM_MainHall_4:
    db $0C,$00,$80 

RoomHeader_GoldenTorizo:
    db $37,$02,$12,$0F,$02,$02,$70,$A0,$00 
    dw RoomDoors_GoldenTorizo 
    dw RoomStateCheck_BossIsDead 
    db $04 
    dw RoomState_GoldenTorizo_1 
    dw Use_StatePointer_inX 

RoomState_GoldenTorizo_0:
    dl LevelData_GoldenTorizo 
    db $09,$24,$03 
    dw FXHeader_GoldenTorizo_State0_1 
    dw EnemyPopulations_GoldenTorizo 
    dw EnemySets_GoldenTorizo 
    db $C0,$00 
    dw RoomScrolls_GoldenTorizo 
    dw $0000 
    dw $0000 
    dw PLMPopulation_GoldenTorizo_State0_1 
    dw $0000 
    dw RTS_8F91F7 

RoomState_GoldenTorizo_1:
    dl LevelData_GoldenTorizo 
    db $09,$00,$03 
    dw FXHeader_GoldenTorizo_State0_1 
    dw EnemyPopulations_GoldenTorizo 
    dw EnemySets_GoldenTorizo 
    db $C0,$00 
    dw RoomScrolls_GoldenTorizo 
    dw $0000 
    dw $0000 
    dw PLMPopulation_GoldenTorizo_State0_1 
    dw $0000 
    dw RTS_8F91F7 

RoomDoors_GoldenTorizo:
    dw Door_GoldenTorizo_0 
    dw Door_GoldenTorizo_1 

RoomScrolls_GoldenTorizo:
    db $02,$02,$01,$01 

RoomPLM_GoldenTorizo_0:
    db $00,$02,$01,$02,$02,$01,$03,$01,$80 

RoomHeader_FastRipper:
    db $38,$02,$15,$0E,$04,$01,$70,$A0,$00 
    dw RoomDoors_FastRipper 
    dw Use_StatePointer_inX 

RoomState_FastRipper:
    dl LevelData_FastRipper 
    db $09,$18,$05 
    dw FXHeader_FastRipper 
    dw EnemyPopulations_FastRipper 
    dw EnemySets_FastRipper 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_FastRipper 
    dw LibBG_Norfair_9_CavernVerticalRuins 
    dw RTS_8F91F7 

RoomDoors_FastRipper:
    dw Door_FastRipper_0 
    dw Door_FastRipper_1 

RoomHeader_GTEnergyRefill:
    db $39,$02,$15,$0F,$01,$01,$70,$A0,$00 
    dw RoomDoors_GTEnergyRefill 
    dw Use_StatePointer_inX 

RoomState_GTEnergyRefill:
    dl LevelData_EnergyRefill_LeftSideDoor 
    db $17,$00,$03 
    dw FXHeader_GTEnergyRefill 
    dw EnemyPopulations_GTEnergyRefill 
    dw EnemySets_GTEnergyRefill 
    db $00,$00 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_GTEnergyRefill 
    dw $0000 
    dw RTS_8F91F7 

RoomDoors_GTEnergyRefill:
    dw Door_GTEnergyRefill_0 

RoomHeader_Ridley:
    db $3A,$02,$17,$10,$01,$02,$70,$A0,$00 
    dw RoomDoors_Ridley 
    dw RoomStateCheck_BossIsDead 
    db $01 
    dw RoomState_Ridley_1 
    dw Use_StatePointer_inX 

RoomState_Ridley_0:
    dl LevelData_Ridley 
    db $09,$24,$04 
    dw FXHeader_Ridley_State0_1 
    dw EnemyPopulations_Ridley 
    dw EnemySets_Ridley 
    db $01,$C1 
    dw RoomScrolls_Ridley 
    dw $0000 
    dw MainASM_RidleysRoomShaking 
    dw PLMPopulation_Ridley_State0_1 
    dw LibBG_Norfair_9_CavernRoomPillars 
    dw RTS_8F91F7 

RoomState_Ridley_1:
    dl LevelData_Ridley 
    db $09,$00,$03 
    dw FXHeader_Ridley_State0_1 
    dw EnemyPopulations_Ridley 
    dw EnemySets_Ridley 
    db $01,$C1 
    dw RoomScrolls_Ridley 
    dw $0000 
    dw MainASM_RidleysRoomShaking 
    dw PLMPopulation_Ridley_State0_1 
    dw LibBG_Norfair_9_CavernRoomPillars 
    dw RTS_8F91F7 

RoomDoors_Ridley:
    dw Door_Ridley_0 
    dw Door_Ridley_1 

RoomScrolls_Ridley:
    db $02,$02 

RoomHeader_LNFarming:
    db $3B,$02,$18,$10,$03,$01,$70,$A0,$00 
    dw RoomDoors_LNFarming 
    dw Use_StatePointer_inX 

RoomState_LNFarming:
    dl LevelData_LNFarming 
    db $09,$18,$05 
    dw FXHeader_LNFarming 
    dw EnemyPopulations_LNFarming 
    dw EnemySets_LNFarming 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_LNFarming 
    dw LibBG_Norfair_9_RoomStatues 
    dw RTS_8F91F7 

RoomDoors_LNFarming:
    dw Door_LNFarming_0 
    dw Door_LNFarming_1 

RoomHeader_FastPillarsSetup:
    db $3C,$02,$19,$0C,$01,$03,$70,$A0,$00 
    dw RoomDoors_FastPillarsSetup 
    dw Use_StatePointer_inX 

RoomState_FastPillarsSetup:
    dl LevelData_FastPillarsSetup 
    db $09,$00,$00 
    dw FXHeader_FastPillarsSetup 
    dw EnemyPopulations_FastPillarsSetup 
    dw EnemySets_FastPillarsSetup 
    db $C1,$C1 
    dw RoomScrolls_FastPillarsSetup 
    dw $0000 
    dw $0000 
    dw PLMPopulation_FastPillarsSetup 
    dw LibBG_Norfair_9_VeritcalPatternBrick 
    dw RTS_8F91F7 

RoomDoors_FastPillarsSetup:
    dw Door_FastPillarsSetup_0 
    dw Door_FastPillarsSetup_1 
    dw Door_FastPillarsSetup_2 
    dw Door_FastPillarsSetup_3 
    dw Door_FastPillarsSetup_4 

RoomScrolls_FastPillarsSetup:
    db $02,$01,$00 

RoomPLM_FastPillarsSetup_0:
    db $01,$02,$80 

RoomPLM_FastPillarsSetup_2:
    db $01,$02,$02,$01,$80 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_RoomHeader_8FB3E1:
    db $3D,$02,$1A,$0B,$01,$01,$70,$A0,$00 
    dw UNUSED_RoomDoors_8FB408 
    dw Use_StatePointer_inX 

UNUSED_RoomState_8FB3EE:
    dl UNUSED_LevelData_C8F40B 
    db $09,$00,$00 
    dw UNUSED_FXHeader_8387EC 
    dw UNUSED_EnemyPopulations_8FB3EE_A1AD06 
    dw UNUSED_EnemySets_State8FB3EE_B48899 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw UNUSED_PLMPopulation_8FB3EE 
    dw LibBG_Norfair_9_HorizontalPatternBrick 
    dw RTS_8F91F7 

UNUSED_RoomDoors_8FB408:
    dw UNUSED_Door_83991E 
endif ; !FEATURE_KEEP_UNREFERENCED

RoomHeader_MickeyMouse:
    db $3E,$02,$1A,$09,$04,$04,$70,$A0,$00 
    dw RoomDoors_MickeyMouse 
    dw Use_StatePointer_inX 

RoomState_MickeyMouse:
    dl LevelData_MickeyMouse 
    db $09,$00,$00 
    dw FXHeader_MickeyMouse 
    dw EnemyPopulations_MickeyMouse 
    dw EnemySets_MickeyMouse 
    db $C1,$C1 
    dw RoomScrolls_MickeyMouse 
    dw $0000 
    dw $0000 
    dw PLMPopulation_MickeyMouse 
    dw LibBG_Norfair_9_PurplePatches 
    dw RTS_8F91F7 

RoomDoors_MickeyMouse:
    dw Door_MickeyMouse_0 
    dw Door_MickeyMouse_1 

RoomScrolls_MickeyMouse:
    db $00,$00,$00,$02,$00,$00,$00,$02,$00,$00,$00,$02,$01,$01,$01,$01 

RoomPLM_MickeyMouse_0:
    db $06,$01,$80 

RoomPLM_MickeyMouse_1:
    db $06,$00,$80 

RoomPLM_MickeyMouse_2:
    db $07,$01,$80 

RoomPLM_MickeyMouse_6:
    db $07,$00,$80 

RoomPLM_MickeyMouse_A:
    db $0E,$01,$80 

RoomPLM_MickeyMouse_D:
    db $0E,$00,$80 

RoomHeader_Pillar:
    db $3F,$02,$1A,$0E,$04,$01,$70,$A0,$00 
    dw RoomDoors_Pillar 
    dw Use_StatePointer_inX 

RoomState_Pillar:
    dl LevelData_Pillar 
    db $09,$00,$00 
    dw FXHeader_Pillar 
    dw EnemyPopulations_Pillar 
    dw EnemySets_Pillar 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Pillar 
    dw LibBG_Norfair_9_CavernVerticalRuins 
    dw RTS_8F91F7 

RoomDoors_Pillar:
    dw Door_Pillar_0 
    dw Door_Pillar_1 

RoomHeader_Plowerhouse:
    db $40,$02,$1B,$10,$03,$01,$70,$A0,$00 
    dw RoomDoors_Plowerhouse 
    dw Use_StatePointer_inX 

RoomState_Plowerhouse:
    dl LevelData_Plowerhouse 
    db $09,$00,$00 
    dw FXHeader_Plowerhouse 
    dw EnemyPopulations_Plowerhouse 
    dw EnemySets_Plowerhouse 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Plowerhouse 
    dw LibBG_Norfair_9_RoomStatues 
    dw RTS_8F91F7 

RoomDoors_Plowerhouse:
    dw Door_Plowerhouse_0 
    dw Door_Plowerhouse_1 

RoomHeader_WorstRoomInTheGame:
    db $41,$02,$1E,$09,$01,$06,$70,$A0,$00 
    dw RoomDoors_WorstRoomInTheGame 
    dw Use_StatePointer_inX 

RoomState_WorstRoomInTheGame:
    dl LevelData_WorstRoomInTheGame 
    db $09,$00,$00 
    dw FXHeader_WorstRoomInTheGame 
    dw EnemyPopulations_WorstRoomInTheGame 
    dw EnemySets_WorstRoomInTheGame 
    db $C1,$C1 
    dw RoomScrolls_WorstRoomInTheGame 
    dw $0000 
    dw $0000 
    dw PLMPopulation_WorstRoomInTheGame 
    dw LibBG_Norfair_9_CavernHorizontalRuins 
    dw RTS_8F91F7 

RoomDoors_WorstRoomInTheGame:
    dw Door_WorstRoomInTheGame_0 
    dw Door_WorstRoomInTheGame_1 
    dw Door_WorstRoomInTheGame_2 

RoomScrolls_WorstRoomInTheGame:
    db $00,$02,$02,$02,$02,$01 

RoomPLM_WorstRoomInTheGame_0:
    db $00,$02,$01,$02,$80 

RoomHeader_Amphitheatre:
    db $42,$02,$1F,$09,$04,$05,$70,$A0,$00 
    dw RoomDoors_Amphitheatre 
    dw Use_StatePointer_inX 

RoomState_Amphitheatre:
    dl LevelData_Amphitheatre 
    db $09,$00,$00 
    dw FXHeader_Amphitheatre 
    dw EnemyPopulations_Amphitheatre 
    dw EnemySets_Amphitheatre 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Amphitheatre 
    dw LibBG_Norfair_9_A_SmallPatternBrownPurple_0 
    dw RTS_8F91F7 

RoomDoors_Amphitheatre:
    dw Door_Amphitheatre_0 
    dw Door_Amphitheatre_1 

RoomHeader_LNSpringBallMaze:
    db $43,$02,$21,$05,$05,$02,$70,$A0,$00 
    dw RoomDoors_LNSpringBallMaze 
    dw Use_StatePointer_inX 

RoomState_LNSpringBallMaze:
    dl LevelData_LNSpringBallMaze 
    db $09,$00,$05 
    dw FXHeader_LNSpringballMaze 
    dw EnemyPopulations_LNSpringBallMaze 
    dw EnemySets_LNSpringBallMaze 
    db $C1,$C1 
    dw RoomScrolls_LNSpringBallMaze 
    dw $0000 
    dw $0000 
    dw PLMPopulation_LNSpringBallMaze 
    dw LibBG_Norfair_9_PurplePatches 
    dw RTS_8F91F7 

RoomDoors_LNSpringBallMaze:
    dw Door_LNSpringBallMaze_0 
    dw Door_LNSpringBallMaze_1 
    dw Door_LNSpringBallMaze_2 

RoomScrolls_LNSpringBallMaze:
    db $02,$00,$00,$00,$00,$01,$01,$00,$00,$00 

RoomPLM_LNSpringBallMaze_0:
    db $01,$01,$02,$01,$06,$00,$80 

RoomPLM_LNSpringBallMaze_4:
    db $01,$00,$02,$00,$06,$01,$80 

RoomPLM_LNSpringBallMaze_C:
    db $03,$01,$04,$02,$80 

RoomHeader_LNEscapePowerBombs:
    db $44,$02,$25,$06,$01,$01,$70,$A0,$00 
    dw RoomDoors_LNEscapePowerBombs 
    dw Use_StatePointer_inX 

RoomState_LNEscapePowerBombs:
    dl LevelData_LNEscapePowerBombs 
    db $09,$00,$00 
    dw FXHeader_LNEscapePowerBombs 
    dw EnemyPopulations_LNEscapePowerBombs 
    dw EnemySets_LNEscapePowerBombs 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_LNEscapePowerBombs 
    dw LibBG_Norfair_9_CavernRoomPillars 
    dw RTS_8F91F7 

RoomDoors_LNEscapePowerBombs:
    dw Door_LNEscapePowerBombs_0 
    dw Door_LNEscapePowerBombs_1 

RoomHeader_RedKihunterShaft:
    db $45,$02,$23,$09,$03,$05,$70,$A0,$00 
    dw RoomDoors_RedKihunterShaft 
    dw Use_StatePointer_inX 

RoomState_RedKihunterShaft:
    dl LevelData_RedKihunterShaft 
    db $09,$00,$00 
    dw FXHeader_RedKihunterShaft 
    dw EnemyPopulations_RedKihunterShaft 
    dw EnemySets_RedKihunterShaft 
    db $C1,$C1 
    dw RoomScrolls_RedKihunterShaft 
    dw $0000 
    dw $0000 
    dw PLMPopulation_RedKihunterShaft 
    dw LibBG_Norfair_9_A_SmallPatternBrownPurple_0 
    dw RTS_8F91F7 

RoomDoors_RedKihunterShaft:
    dw Door_RedKihunterShaft_0 
    dw Door_RedKihunterShaft_1 
    dw Door_RedKihunterShaft_2 
    dw Door_RedKihunterShaft_3 

RoomScrolls_RedKihunterShaft:
    db $02,$00,$00,$02,$00,$00,$02,$00,$00,$02,$00,$00,$02,$00,$02 

RoomPLM_RedKihunterShaft_0_4:
    db $0A,$02,$0D,$02,$80 

RoomPLM_RedKihunterShaft_3_5:
    db $0A,$00,$0D,$00,$80 

RoomPLM_RedKihunterShaft_6:
    db $00,$02,$03,$02,$80 

RoomPLM_RedKihunterShaft_A:
    db $00,$02,$80 

RoomHeader_Wasteland:
    db $46,$02,$20,$0E,$06,$03,$70,$A0,$00 
    dw RoomDoors_Wasteland 
    dw Use_StatePointer_inX 

RoomState_Wasteland:
    dl LevelData_Wasteland 
    db $09,$00,$00 
    dw FXHeader_Wasteland 
    dw EnemyPopulations_Wasteland 
    dw EnemySets_Wasteland 
    db $C1,$C1 
    dw RoomScrolls_Wasteland 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Wasteland 
    dw LibBG_Norfair_9_CavernRoomPillars 
    dw RTS_8F91F7 

RoomDoors_Wasteland:
    dw Door_Wasteland_0 
    dw Door_Wasteland_1 

RoomScrolls_Wasteland:
    db $00,$01,$01,$01,$00,$01,$00,$00,$00,$00,$00,$00,$00,$02,$00,$00 
    db $00,$00 

RoomPLM_Wasteland_0:
    db $07,$02,$80 

RoomPLM_Wasteland_2:
    db $01,$01,$07,$00,$80 

RoomPLM_Wasteland_8_C:
    db $04,$01,$80 

RoomPLM_Wasteland_A:
    db $00,$01,$01,$01,$80 

RoomPLM_Wasteland_9_B:
    db $04,$00,$80 

RoomPLM_Wasteland_D:
    db $00,$00,$80 

RoomPLM_Wasteland_11:
    db $01,$00,$80 

RoomHeader_MetalPirates:
    db $47,$02,$1E,$10,$03,$01,$70,$A0,$00 
    dw RoomDoors_MetalPirates 
    dw Use_StatePointer_inX 

RoomState_MetalPirates:
    dl LevelData_MetalPirates 
    db $09,$00,$00 
    dw FXHeader_MetalPirates 
    dw EnemyPopulations_MetalPirates 
    dw EnemySets_MetalPirates 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_MetalPirates 
    dw LibBG_Norfair_9_RoomStatues 
    dw RTS_8F91F7 

RoomDoors_MetalPirates:
    dw Door_MetalPirates_0 
    dw Door_MetalPirates_1 

RoomHeader_ThreeMusketeers:
    db $48,$02,$1D,$03,$04,$03,$70,$A0,$00 
    dw RoomDoors_ThreeMusketeers 
    dw Use_StatePointer_inX 

RoomState_ThreeMusketeers:
    dl LevelData_ThreeMusketeers 
    db $09,$18,$05 
    dw FXHeader_ThreeMusketeers 
    dw EnemyPopulations_ThreeMusketeers 
    dw EnemySets_ThreeMusketeers 
    db $C1,$C1 
    dw RoomScrolls_ThreeMusketeers 
    dw $0000 
    dw $0000 
    dw PLMPopulation_ThreeMusketeers 
    dw LibBG_Norfair_9_PurplePatches 
    dw RTS_8F91F7 

RoomDoors_ThreeMusketeers:
    dw Door_ThreeMusketeers_0 
    dw Door_ThreeMusketeers_1 

RoomScrolls_ThreeMusketeers:
    db $00,$02,$00,$00,$00,$02,$00,$00,$00,$01,$01,$01 

RoomPLM_ThreeMusketeers_0:
    db $09,$00,$80 

RoomPLM_ThreeMusketeers_6:
    db $08,$01,$09,$01,$80 

RoomPLM_ThreeMusketeers_7:
    db $08,$00,$80 

RoomHeader_RidleyETank:
    db $49,$02,$16,$11,$01,$01,$70,$A0,$00 
    dw RoomDoors_RidleyETank 
    dw Use_StatePointer_inX 

RoomState_RidleyETank:
    dl LevelData_RidleyETank 
    db $09,$00,$00 
    dw FXHeader_RidleyETank 
    dw EnemyPopulations_RidleyETank 
    dw EnemySets_RidleyETank 
    db $01,$01 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_RidleyETank 
    dw LibBG_Norfair_9_CavernRoomPillars 
    dw RTS_8F91F7 

RoomDoors_RidleyETank:
    dw Door_RidleyETank_0 

RoomHeader_ScrewAttack:
    db $4A,$02,$14,$0E,$01,$03,$70,$A0,$00 
    dw RoomDoors_ScrewAttack 
    dw Use_StatePointer_inX 

RoomState_ScrewAttack:
    dl LevelData_ScrewAttack 
    db $09,$00,$03 
    dw FXHeader_ScrewAttack 
    dw EnemyPopulations_ScrewAttack 
    dw EnemySets_ScrewAttack 
    db $01,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_ScrewAttack 
    dw LibBG_Norfair_9_CavernRoomPillars 
    dw RTS_8F91F7 

RoomDoors_ScrewAttack:
    dw Door_ScrewAttack_0 
    dw Door_ScrewAttack_1 
    dw Door_ScrewAttack_2 

RoomHeader_LNFireflea:
    db $4B,$02,$23,$06,$03,$06,$70,$A0,$00 
    dw RoomDoors_LNFireflea 
    dw Use_StatePointer_inX 

RoomState_LNFireflea:
    dl LevelData_LNFireflea 
    db $0A,$18,$05 
    dw FXHeader_LNFireflea 
    dw EnemyPopulations_LNFireflea 
    dw EnemySets_LNFireflea 
    db $00,$00 
    dw RoomScrolls_LNFireflea 
    dw $0000 
    dw $0000 
    dw PLMPopulation_LNFireflea 
    dw $0000 
    dw $0000 

RoomDoors_LNFireflea:
    dw Door_LNFireflea_0 
    dw Door_LNFireflea_1 
    dw Door_LNFireflea_2 

RoomScrolls_LNFireflea:
    db $00,$02,$00,$00,$02,$00,$00,$02,$00,$00,$01,$00,$00,$00,$00,$00 
    db $01,$01 

RoomPLM_LNFireflea_2:
    db $0B,$01,$80 

RoomPLM_LNFireflea_5:
    db $0B,$02,$0D,$02,$0E,$02,$80 

RoomPLM_LNFireflea_9:
    db $00,$01,$04,$00,$80 

RoomPLM_LNFireflea_11:
    db $01,$02,$04,$02,$80 

RoomHeader_LNSave:
    db $4C,$02,$24,$0C,$01,$01,$70,$A0,$00 
    dw RoomDoors_LNSave 
    dw Use_StatePointer_inX 

RoomState_LNSave:
    dl LevelData_SaveStation_LeftSideDoor 
    db $19,$18,$05 
    dw FXHeader_LNSave 
    dw EnemyPopulations_LNSave 
    dw EnemySets_LNSave 
    db $00,$00 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_LNSave 
    dw $0000 
    dw $0000 

RoomDoors_LNSave:
    dw Door_LNSave_0 

LibBG_ScrollingSky_Tilemaps_LandingSite:
    dw $000E 
    dw Door_GauntletEntrance_0 
    dl ScrollingSky_Tilemaps_2 
    dw $4800,$0800,$000E 
    dw Door_Parlor_1 
    dl ScrollingSky_Tilemaps_4 
    dw $4800,$0800,$000E 
    dw Door_CrateriaPowerBombs_0 
    dl ScrollingSky_Tilemaps_1 
    dw $4C00,$0800,$000E 
    dw Door_CrateriaTube_0 
    dl ScrollingSky_Tilemaps_4 
    dw $4800,$0800,$000E 
    dw Door_LandingSite_LandingCutscene 
    dl ScrollingSky_Tilemaps_0 
    dw $4800,$0800,$000E 
    dw Door_DemoSet3_0_2_4 
    dl ScrollingSky_Tilemaps_2 
    dw $4800,$0800,$0000 

LibBG_ScrollingSky_Tilemaps_WreckedShipEntrance:
    dw $000E 
    dw Door_BowlingAlleyPath_0 
    dl ScrollingSky_Tilemaps_2 
    dw $4800,$0800,$000E 
    dw Door_Moat_1 
    dl ScrollingSky_Tilemaps_5 
    dw $4800,$0800,$000E 
    dw Door_BowlingAlley_0 
    dl ScrollingSky_Tilemaps_1 
    dw $4C00,$0800,$000E 
    dw Door_WreckedShipEntrance_0 
    dl ScrollingSky_Tilemaps_5 
    dw $4800,$0800,$000E 
    dw Door_Attic_2 
    dl ScrollingSky_Tilemaps_0 
    dw $4800,$0800,$000E 
    dw Door_GravitySuit_0 
    dl ScrollingSky_Tilemaps_3 
    dw $4C00,$0800,$0000 

LibBG_ScrollingSky_Tilemaps_EastOcean:
    dw $000E 
    dw Door_ForgottenHighwayKagos_0 
    dl ScrollingSky_Tilemaps_5 
    dw $4800,$0800,$000E 
    dw Door_ElectricDeath_0 
    dl ScrollingSky_Tilemaps_5 
    dw $4800,$0800,$0000 

LibBG_ScrollingSky_Tilemaps_BowlingAlley:
    dw $0002 
    dl ScrollingSky_Tilemaps_2 
    dw $4800,$0800,$0000 

LibBG_Brinstar_1A_Kraid_Upper_Lower:
    dw $0008 
    dl Tiles_Standard_BG3 
    dw $2000,$1000,$0004 
    dl Background_Brinstar_1A_Kraid_Upper 
    dw $4000,$0002 
    dl $7E4000 
    dw $4000,$1000,$0004 
    dl Background_Brinstar_1A_Kraid_Lower_0 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$1000,$0000 

LibBG_Standard_BG3_Tiles:
    dw $0008 
    dl Tiles_Standard_BG3 
    dw $2000,$1000,$000C,$0000 

LibBG_Crocomire_State0:
    dw $0002 
    dl $7E2000 
    dw $4800,$1000,$0000 

LibBG_Crocomire_State1:
    dw $0002 
    dl $7E2000 
    dw $4800,$1000,$0000 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_LibBG_Brinstar_1A_Kraid_Lower_8FB863:
    dw $0004 
    dl Background_Brinstar_1A_Kraid_Lower_1 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 
endif ; !FEATURE_KEEP_UNREFERENCED

LibBG_Crateria_0_VerticalPatternRocks:
    dw $0004 
    dl Background_Crateria_0_VerticalPatternRocks 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

LibBG_Crateria_0_HorizontalPatternRocks:
    dw $0004 
    dl Background_Crateria_0_HorizontalPatternRocks 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

LibBG_Crateria_0_Rocks:
    dw $0004 
    dl Background_Crateria_0_Rocks 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

LibBG_Crateria_2_PurpleRocks:
    dw $0004 
    dl Background_Crateria_2_PurpleRocks 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

LibBG_Crateria_2_BrickRoom_WallArt_Dark:
    dw $0004 
    dl Background_Crateria_2_BrickRoom_WallArt_Dark 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

LibBG_Crateria_2_3_Mechanical:
    dw $0004 
    dl Background_Crateria_2_3_Mechanical 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

LibBG_Crateria_2_BrickRoom_WallArt:
    dw $0004 
    dl Background_Crateria_2_BrickRoom_WallArt 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

LibBG_Crateria_2_Elevator:
    dw $0004 
    dl Background_Crateria_2_Elevator 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

LibBG_Crateria_2_BrickRoom:
    dw $0004 
    dl Background_Crateria_2_BrickRoom 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

DoorASM_StartWreckedShipTreadmillWestEntrance:
    LDY.W #AnimatedTilesObjects_FX_wreckedShipTreadmillRightwards 
    JSL.L Spawn_AnimatedTilesObject 
    JSL.L Spawn_Hardcoded_PLM 
    db $04,$09 
    dw PLMEntries_wreckedShipEntranceTreadmillFromWest 
    RTS 


DoorASM_Scroll_6_Green:
    PHP 
    SEP #$20 
    LDA.B #$02 : STA.L $7ECD26 
    PLP 
    RTS 


DoorASM_Scroll_0_Blue:
    PHP 
    SEP #$20 
    LDA.B #$01 : STA.L $7ECD20 
    PLP 
    RTS 


DoorASM_Scroll_13_Blue:
    PHP 
    SEP #$20 
    LDA.B #$01 : STA.L $7ECD33 
    PLP 
    RTS 


DoorASM_Scroll_4_Red_8_Green:
    PHP 
    SEP #$20 
    LDA.B #$00 : STA.L $7ECD24 
    LDA.B #$02 : STA.L $7ECD28 
    PLP 
    RTS 


DoorASM_Scroll_8_9_A_B_Red:
    PHP 
    SEP #$20 
    LDA.B #$00 : STA.L $7ECD28 
    STA.L $7ECD29 
    STA.L $7ECD2A 
    STA.L $7ECD2B 
    PLP 
    RTS 


DoorASM_Scroll_2_3_4_5_B_C_D_11_Red:
    PHP 
    SEP #$20 
    LDA.B #$00 : STA.L $7ECD22 
    STA.L $7ECD23 
    STA.L $7ECD24 
    STA.L $7ECD25 
    STA.L $7ECD2B 
    STA.L $7ECD2C 
    STA.L $7ECD2D 
    STA.L $7ECD31 
    PLP 
    RTS 


DoorASM_Scroll_1_4_Green:
    PHP 
    SEP #$20 
    LDA.B #$02 : STA.L $7ECD21 
    STA.L $7ECD24 
    PLP 
    RTS 


DoorASM_Scroll_2_Blue:
    PHP 
    SEP #$20 
    LDA.B #$01 : STA.L $7ECD22 
    PLP 
    RTS 


DoorASM_Scroll_17_Blue:
    PHP 
    SEP #$20 
    LDA.B #$01 : STA.L $7ECD37 
    PLP 
    RTS 


DoorASM_Scroll_4_Blue:
    PHP 
    SEP #$20 
    LDA.B #$01 : STA.L $7ECD24 
    PLP 
    RTS 


DoorASM_Scroll_6_Green_duplicate:
    PHP 
    SEP #$20 
    LDA.B #$02 : STA.L $7ECD26 
    PLP 
    RTS 


DoorASM_Scroll_3_Green:
    PHP 
    SEP #$20 
    LDA.B #$02 : STA.L $7ECD23 
    PLP 
    RTS 


LibBG_Brinstar_6_Vertical_GlowPatches:
    dw $0004 
    dl Background_Brinstar_6_Vertical_GlowPatches 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

LibBG_Brinstar_6_Horizontal_GlowPatches:
    dw $0004 
    dl Background_Brinstar_6_Horizontal_GlowPatches 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

LibBG_Brinstar_6_LargeHorizontalPattern:
    dw $0004 
    dl Background_Brinstar_6_LargeHorizontalPattern 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

LibBG_Brinstar_6_MediumHorizontalPattern:
    dw $0004 
    dl Background_Brinstar_6_MediumHorizontalPattern 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

LibBG_Brinstar_6_ThinHorizontalPattern:
    dw $0004 
    dl Background_Brinstar_6_ThinHorizontalPattern 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

LibBG_Brinstar_6_SmallPattern:
    dw $0004 
    dl Background_Brinstar_6_SmallPattern 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

LibBG_Brinstar_6_SpheresPattern:
    dw $0004 
    dl Background_Brinstar_6_SpheresPattern 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

LibBG_Brinstar_6_SmallPattern_Variety_0:
    dw $0004 
    dl Background_Brinstar_6_SmallPattern_Variety_0 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_LibBG_Brinstar_6_SmallPattern_Variety_1_8FBB0F:
    dw $0004 
    dl Background_Brinstar_6_SmallPattern_Variety_1 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

UNUSED_LibBG_Brinstar_6_SmallPattern_Variety_2_8FBB2A:
    dw $0004 
    dl Background_Brinstar_6_SmallPattern_Variety_2 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 
endif ; !FEATURE_KEEP_UNREFERENCED

LibBG_Brinstar_6_DarkPattern:
    dw $0004 
    dl Background_Brinstar_6_DarkPattern 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

LibBG_Tourian_15_Statues:
    dw $0004 
    dl Background_Tourian_15_Statues 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$1000,$0002 
    dl Tiles_TourianStatuesSoul 
    dw $6D00,$0600,$0000 

LibBG_Brinstar_7_WideVerticalTower_Brick_0:
    dw $0004 
    dl Background_Brinstar_7_WideVerticalTower_Brick_0 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_LibBG_Brinstar_7_WideVerticalTower_Brick_1_8FBB96:
    dw $0004 
    dl Background_Brinstar_7_WideVerticalTower_Brick_1 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

UNUSED_LibBG_Brinstar_7_WideVerticalTower_Brick_2_8FBBB1:
    dw $0004 
    dl Background_Brinstar_7_WideVerticalTower_Brick_2 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 
endif ; !FEATURE_KEEP_UNREFERENCED

LibBG_Brinstar_7_VerticalTower:
    dw $0004 
    dl Background_Brinstar_7_VerticalTower 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

LibBG_Brinstar_7_NarrowVerticalTower_Brick:
    dw $0004 
    dl Background_Brinstar_7_NarrowVerticalTower_Brick 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

LibBG_Brinstar_7_VerticalBrick_0:
    dw $0004 
    dl Background_Brinstar_7_VerticalBrick_0 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_LibBG_Brinstar_7_VerticalBrick_1_8FBC1D:
    dw $0004 
    dl Background_Brinstar_7_VerticalBrick_1 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 
endif ; !FEATURE_KEEP_UNREFERENCED

LibBG_Brinstar_7_MechanicalRoom_SpikeFloor:
    dw $0004 
    dl Background_Brinstar_7_MechanicalRoom_SpikeFloor 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

LibBG_Brinstar_7_MechanicalRoom:
    dw $0004 
    dl Background_Brinstar_7_MechanicalRoom 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

LibBG_Brinstar_7_NarrowVerticalTower_Brick_Vines_0:
    dw $0004 
    dl Background_Brinstar_7_NarrowVerticalTower_Brick_Vines_0 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_LibBG_Brin_7_NarrowVerticalTower_Brick_Vines_1_8FBC89:
    dw $0004 
    dl Background_Brinstar_7_NarrowVerticalTower_Brick_Vines_1 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 
endif ; !FEATURE_KEEP_UNREFERENCED

LibBG_Brinstar_8_NarrowVerticalTower_Brick_Grey_0:
    dw $0004 
    dl Background_Brinstar_8_NarrowVerticalTower_Brick_Grey_0 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$1000,$0000 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_LibBG_Brin_8_NarrowVerticalTower_Brick_Grey_1_8FBCB6:
    dw $0004 
    dl Background_Brinstar_8_NarrowVerticalTower_Brick_Grey_1 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

UNUSED_LibBG_Brin_8_NarrowVerticalTower_Brick_Grey_2_8FBCD1:
    dw $0004 
    dl Background_Brinstar_8_NarrowVerticalTower_Brick_Grey_2 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 
endif ; !FEATURE_KEEP_UNREFERENCED

LibBG_Brinstar_7_BlueGridBlocks:
    dw $0004 
    dl Background_Brinstar_7_BlueGridBlocks 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

DoorASM_Scroll_18_1C_Green:
    PHP 
    SEP #$20 
    LDA.B #$02 : STA.L $7ECD38 
    STA.L $7ECD3C 
    PLP 
    RTS 


DoorASM_Scroll_5_6_Blue:
    PHP 
    SEP #$20 
    LDA.B #$01 : STA.L $7ECD25 
    STA.L $7ECD26 
    PLP 
    RTS 


DoorASM_Scroll_1D_Blue:
    PHP 
    SEP #$20 
    LDA.B #$01 : STA.L $7ECD3D 
    PLP 
    RTS 


DoorASM_Scroll_2_3_Green:
    PHP 
    SEP #$20 
    LDA.B #$02 : STA.L $7ECD22 
    STA.L $7ECD23 
    PLP 
    RTS 


DoorASM_Scroll_0_Red_1_Green:
    PHP 
    SEP #$20 
    LDA.B #$00 : STA.L $7ECD20 
    LDA.B #$02 : STA.L $7ECD21 
    PLP 
    RTS 


DoorASM_Scroll_B_Green:
    PHP 
    SEP #$20 
    LDA.B #$02 : STA.L $7ECD2B 
    PLP 
    RTS 


DoorASM_Scroll_Scroll_1C_Red_1D_Blue:
    PHP 
    SEP #$20 
    LDA.B #$00 : STA.L $7ECD3C 
    LDA.B #$01 : STA.L $7ECD3D 
    PLP 
    RTS 


DoorASM_Scroll_4_Red:
    PHP 
    SEP #$20 
    LDA.B #$00 : STA.L $7ECD24 
    PLP 
    RTS 


DoorASM_Scroll_20_24_25_Green:
    PHP 
    SEP #$20 
    LDA.B #$02 : STA.L $7ECD40 
    STA.L $7ECD44 
    STA.L $7ECD45 
    PLP 
    RTS 


DoorASM_Scroll_2_Blue_duplicate:
    PHP 
    SEP #$20 
    LDA.B #$01 : STA.L $7ECD22 
    PLP 
    RTS 


DoorASM_Scroll_0_Green:
    PHP 
    SEP #$20 
    LDA.B #$02 : STA.L $7ECD20 
    PLP 
    RTS 


DoorASM_Scroll_6_7_Green:
    PHP 
    SEP #$20 
    LDA.B #$02 : STA.L $7ECD26 
    STA.L $7ECD27 
    PLP 
    RTS 


DoorASM_Scroll_1_Blue_2_Red:
    PHP 
    SEP #$20 
    LDA.B #$01 : STA.L $7ECD21 
    LDA.B #$00 : STA.L $7ECD22 
    PLP 
    RTS 


DoorASM_Scroll_1_Blue_3_Red:
    PHP 
    SEP #$20 
    LDA.B #$01 : STA.L $7ECD21 
    LDA.B #$00 : STA.L $7ECD23 
    PLP 
    RTS 


DoorASM_Scroll_0_Red_4_Blue:
    PHP 
    SEP #$20 
    LDA.B #$00 : STA.L $7ECD20 
    LDA.B #$01 : STA.L $7ECD24 
    PLP 
    RTS 


DoorASM_Scroll_2_3_Blue:
    PHP 
    SEP #$20 
    LDA.B #$01 : STA.L $7ECD22 
    STA.L $7ECD23 
    PLP 
    RTS 


DoorASM_Scroll_0_1_Green:
    PHP 
    SEP #$20 
    LDA.B #$02 : STA.L $7ECD20 
    STA.L $7ECD21 
    PLP 
    RTS 


DoorASM_Scroll_1_Green:
    PHP 
    SEP #$20 
    LDA.B #$02 : STA.L $7ECD21 
    PLP 
    RTS 


DoorASM_Scroll_F_12_Green:
    PHP 
    SEP #$20 
    LDA.B #$02 : STA.L $7ECD2F 
    STA.L $7ECD32 
    PLP 
    RTS 


DoorASM_Scroll_6_Green_duplicate_again:
    PHP 
    SEP #$20 
    LDA.B #$02 : STA.L $7ECD26 
    PLP 
    RTS 


DoorASM_Scroll_0_Green_1_Blue:
    PHP 
    SEP #$20 
    LDA.B #$02 : STA.L $7ECD20 
    LDA.B #$01 : STA.L $7ECD21 
    PLP 
    RTS 


DoorASM_Scroll_2_Green:
    SEP #$20 
    LDA.B #$02 : STA.L $7ECD22 
    RTS 


LibBG_Norfair_9_A_SmallPatternBrownPurple_Bright:
    dw $0004 
    dl Background_Norfair_9_A_SmallPatternBrownPurple_Bright 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

LibBG_Norfair_9_A_SmallPatternBrownPurple_0:
    dw $0004 
    dl Background_Norfair_9_A_SmallPatternBrownPurple_0 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_LibBG_Norfair_9_A_SmallPatternBrownPurple_1_8FBE75:
    dw $0004 
    dl Background_Norfair_9_A_SmallPatternBrownPurple_1 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 
endif ; !FEATURE_KEEP_UNREFERENCED

LibBG_Norfair_9_HorizontalPatternBrick:
    dw $0004 
    dl Background_Norfair_9_HorizontalPatternBrick 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

LibBG_Norfair_9_VeritcalPatternBrick:
    dw $0004 
    dl Background_Norfair_9_VeritcalPatternBrick 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

LibBG_Norfair_9_A_CavernStalagtites:
    dw $0004 
    dl Background_Norfair_9_A_CavernStalagtites 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

LibBG_Norfair_9_A_CavernVertical:
    dw $0004 
    dl Background_Norfair_9_A_CavernVertical 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

LibBG_Norfair_9_CavernHorizontalRuins:
    dw $0004 
    dl Background_Norfair_9_CavernHorizontalRuins 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

LibBG_Norfair_9_CavernVerticalRuins:
    dw $0004 
    dl Background_Norfair_9_CavernVerticalRuins 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

LibBG_Norfair_9_CavernRoomPillars:
    dw $0004 
    dl Background_Norfair_9_CavernRoomPillars 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

LibBG_Norfair_9_RoomStatues:
    dw $0004 
    dl Background_Norfair_9_RoomStatues 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

LibBG_Norfair_9_PurplePatches:
    dw $0004 
    dl Background_Norfair_9_PurplePatches 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

LibBG_Norfair_9_Bubbles:
    dw $0004 
    dl Background_Norfair_9_Bubbles 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

DoorASM_Scroll_3_4_Red_6_7_8_Blue:
    PHP 
    SEP #$20 
    LDA.B #$00 : STA.L $7ECD23 
    STA.L $7ECD24 
    LDA.B #$01 : STA.L $7ECD26 
    STA.L $7ECD27 
    STA.L $7ECD28 
    PLP 
    RTS 


DoorASM_Scroll_1_2_3_Blue_4_Green_6_Red:
    PHP 
    SEP #$20 
    LDA.B #$01 : STA.L $7ECD21 
    STA.L $7ECD22 
    STA.L $7ECD23 
    LDA.B #$02 : STA.L $7ECD24 
    LDA.B #$00 : STA.L $7ECD26 
    PLP 
    RTS 


DoorASM_Scroll_0_1_Blue:
    PHP 
    SEP #$20 
    LDA.B #$01 : STA.L $7ECD20 
    STA.L $7ECD21 
    PLP 
    RTS 


DoorASM_Scroll_0_Blue_1_Red:
    PHP 
    SEP #$20 
    LDA.B #$00 : STA.L $7ECD21 
    LDA.B #$01 : STA.L $7ECD20 
    PLP 
    RTS 


DoorASM_Scroll_A_Green:
    PHP 
    SEP #$20 
    LDA.B #$02 : STA.L $7ECD2A 
    PLP 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_DoorASM_Scroll_0_Blue_2_Red_8FC005:
    PHP 
    SEP #$20 
    LDA.B #$01 : STA.L $7ECD20 
    LDA.B #$00 : STA.L $7ECD22 
    PLP 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


DoorASM_Scroll_0_2_Green:
    PHP 
    SEP #$20 
    LDA.B #$02 : STA.L $7ECD20 
    STA.L $7ECD22 
    PLP 
    RTS 


DoorASM_Scroll_6_7_Blue_8_Red:
    PHP 
    SEP #$20 
    LDA.B #$01 : STA.L $7ECD26 
    STA.L $7ECD27 
    LDA.B #$00 : STA.L $7ECD28 
    PLP 
    RTS 


DoorASM_Scroll_2_Red_3_Blue:
    PHP 
    SEP #$20 
    LDA.B #$00 : STA.L $7ECD22 
    LDA.B #$01 : STA.L $7ECD23 
    PLP 
    RTS 


DoorASM_Scroll_7_Green:
    PHP 
    SEP #$20 
    LDA.B #$02 : STA.L $7ECD27 
    PLP 
    RTS 


DoorASM_Scroll_1_Red_2_Blue:
    PHP 
    SEP #$20 
    LDA.B #$00 : STA.L $7ECD21 
    LDA.B #$01 : STA.L $7ECD22 
    PLP 
    RTS 


DoorASM_Scroll_0_Blue_3_Red:
    PHP 
    SEP #$20 
    LDA.B #$00 : STA.L $7ECD23 
    LDA.B #$01 : STA.L $7ECD20 
    PLP 
    RTS 


DoorASM_Scroll_1_Blue_4_Red:
    PHP 
    SEP #$20 
    LDA.B #$01 : STA.L $7ECD21 
    LDA.B #$00 : STA.L $7ECD24 
    PLP 
    RTS 


DoorASM_Scroll_0_Blue_1_2_3_Red:
    PHP 
    SEP #$20 
    LDA.B #$01 : STA.L $7ECD20 
    LDA.B #$00 : STA.L $7ECD21 
    STA.L $7ECD22 
    STA.L $7ECD23 
    PLP 
    RTS 


DoorASM_Scroll_0_Green_duplicate:
    PHP 
    SEP #$20 
    LDA.B #$02 : STA.L $7ECD20 
    PLP 
    RTS 


DoorASM_Scroll_0_1_Blue_4_Red:
    PHP 
    SEP #$20 
    LDA.B #$01 : STA.L $7ECD20 
    STA.L $7ECD21 
    LDA.B #$00 : STA.L $7ECD24 
    PLP 
    RTS 


DoorASM_Scroll_0_Blue_3_Red_duplicate:
    PHP 
    SEP #$20 
    LDA.B #$01 : STA.L $7ECD20 
    LDA.B #$00 : STA.L $7ECD23 
    PLP 
    RTS 


DoorASM_Scroll_0_Blue_duplicate:
    PHP 
    SEP #$20 
    LDA.B #$01 : STA.L $7ECD20 
    PLP 
    RTS 


DoorASM_Scroll_0_Blue_1_Red_duplicate:
    PHP 
    SEP #$20 
    LDA.B #$01 : STA.L $7ECD20 
    LDA.B #$00 : STA.L $7ECD21 
    PLP 
    RTS 


DoorASM_Scroll_18_Blue:
    PHP 
    SEP #$20 
    LDA.B #$01 : STA.L $7ECD38 
    PLP 
    RTS 


DoorASM_Scroll_2_Blue_3_Red:
    PHP 
    SEP #$20 
    LDA.B #$00 : STA.L $7ECD23 
    LDA.B #$01 : STA.L $7ECD22 
    PLP 
    RTS 


DoorASM_Scroll_E_Red:
    PHP 
    SEP #$20 
    LDA.B #$00 : STA.L $7ECD2E 
    PLP 
    RTS 


MainASM_ScrollingSkyLand:
    JSL.L RoomMainASM_ScrollingSkyLand 
    RTS 


MainASM_ScrollingSkyOcean:
    JSL.L RoomMainASM_ScrollingSkyOcean 
    RTS 


MainASM_ScrollingSkyLand_ZebesTimebombSet:
    JSL.L RoomMainASM_ScrollingSkyLand 

MainASM_SetScreenShaking_GenerateRandomExplosions:
    JSR.W GenerateRandomExplosionOnEvenFramesOnRandomNonBlankTile 
    LDA.W $1840 : ORA.W #$8000 : STA.W $1840 
    RTS 


GenerateRandomExplosionOnEvenFramesOnRandomNonBlankTile:
    LDA.W $0A78 : BNE .return 
    LDA.W $05B6 : AND.W #$0001 
    BNE .return 
    JSL.L GenerateRandomNumber 
    PHA 
    AND.W #$00FF 
    CLC : ADC.W $0911 : STA.B $12 
    PLA 
    XBA 
    AND.W #$00FF 
    CLC : ADC.W $0915 : STA.B $14 
    LSR #4
    SEP #$20 
    PHA 
    LDA.W $07A5 : STA.W $4202 
    PLA 
    STA.W $4203 
    REP #$20 
    LDA.B $12 
    LSR #4
    CLC : ADC.W $4216 : ASL A 
    TAX 
    LDA.L $7F0002,X : AND.W #$03FF 
    CMP.W #$00FF 
    BNE GenerateRandomExplosionAt_12_14 

.return:
    RTS 


GenerateRandomExplosionOnEveryFourthFrame:
    LDA.W $0A78 : BNE GenerateRandomExplosionAt_12_14_return 
    LDA.W $05B6 : AND.W #$0003 
    BNE GenerateRandomExplosionAt_12_14_return 
    JSL.L GenerateRandomNumber 
    PHA 
    AND.W #$00FF 
    CLC : ADC.W $0911 : STA.B $12 
    PLA 
    XBA 
    AND.W #$00FF 
    CLC : ADC.W $0915 : STA.B $14 

GenerateRandomExplosionAt_12_14:
    JSL.L GenerateRandomNumber 
    AND.W #$000F 
    CMP.W #$0008 
    BCS + 
    TAX 
    LDA.W ExplosionSoundEffects,X : AND.W #$00FF 
    BEQ + 
    JSL.L QueueSound_Lib2_Max6 

  + TXA 
    AND.W #$0007 
    TAX 
    LDA.W ExplosionSpriteObjectIDs,X : AND.W #$00FF : STA.B $16 
    STZ.B $18 
    JSL.L Create_Sprite_Object 

  .return:
    RTS 


ExplosionSpriteObjectIDs:
    db $03,$03,$09,$0C,$0C,$12,$12,$15 

ExplosionSoundEffects:
    db $24,$00,$00,$25,$00,$00,$00,$00 

MainASM_ScrollScreenRightInDachoraRoom:
    LDA.L $7ECD2B : AND.W #$00FF 
    CMP.W #$0002 
    BNE .return 
    LDA.W $0915 
    CMP.W #$0500 
    BCS .return 
    LDA.W $0911 
    CMP.W #$0380 
    BCS .return 
    ADC.W #$0003 : STA.W $0911 

.return:
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_8FC209:
    dw $0051,$0061,$0001,$0002,$0005,$0006 
endif ; !FEATURE_KEEP_UNREFERENCED

PLMPopulation_BowlingAlley_State0:
    dw PLMEntries_ScrollPLM 
    db $1F,$2D 
    dw $C9EC 
    dw PLMEntries_upwardsExtension 
    db $41,$26 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $41,$27 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $41,$28 
    dw $C9F1,$0000 

PLMPopulation_WreckedShipEntrance_State0:
    dw $0000 

PLMPopulation_Attic_State0:
    dw PLMEntries_greyDoorFacingRight 
    db $01,$06 
    dw $0080 
    dw PLMEntries_greyDoorFacingLeft 
    db $6E,$06 
    dw $0081 
    dw PLMEntries_wreckedShipAttic 
    db $08,$08 
    dw $8000,$0000 

PLMPopulation_AssemblyLine_State0:
    dw $0000 

PLMPopulation_WreckedShipMainShaft_State0_1:
    dw PLMEntries_ScrollPLM 
    db $3E,$57 
    dw $CB7A 
    dw PLMEntries_ScrollPLM 
    db $51,$69 
    dw $CB7D 
    dw PLMEntries_ScrollPLM 
    db $41,$57 
    dw $CB80 
    dw PLMEntries_ScrollPLM 
    db $4E,$69 
    dw $CB83 
    dw PLMEntries_ScrollPLM 
    db $47,$6D 
    dw $CB86 
    dw PLMEntries_MissileTank 
    db $02,$59 
    dw $0080 
    dw PLMEntries_greyDoorFacingRight 
    db $41,$66 
    dw $0082 
    dw PLMEntries_greyDoorFacingLeft 
    db $4E,$46 
    dw $0083 
    dw PLMEntries_greenDoorFacingUp 
    db $46,$7D 
    dw $0084,$0000 

PLMPopulation_SpikyDeath_State0:
    dw $0000 

PLMPopulation_ElectricDeath_State0:
    dw PLMEntries_ScrollPLM 
    db $07,$10 
    dw RoomPLM_ElectricDeath_0 
    dw PLMEntries_rightwardsExtension 
    db $08,$10 
    dw $8000,$0000 

PLMPopulation_WreckedShipETank_State0:
    dw $0000 

PLMPopulation_Basement_State0:
    dw PLMEntries_ScrollPLM 
    db $40,$0C 
    dw RoomPLM_Basement_0 
    dw PLMEntries_ScrollPLM 
    db $46,$0C 
    dw RoomPLM_Basement_1 
    dw PLMEntries_EyeDoorFacingLeft 
    db $4E,$06 
    dw $0085 
    dw PLMEntries_EyeDoorBottomFacingLeft 
    db $4E,$09 
    dw $0085 
    dw PLMEntries_EyeDoorEyeFacingLeft 
    db $4E,$07 
    dw $0085,$0000 

PLMPopulation_WreckedShipMap_State0:
    dw $0000 

PLMPopulation_Phantoon_State0_1:
    dw PLMEntries_greyDoorFacingRight 
    db $01,$06 
    dw $0086,$0000 

PLMPopulation_SpongeBath_State0:
    dw $0000 

PLMPopulation_WSWestSuper_State0:
    dw $0000 

PLMPopulation_WSEastSuper_State0:
    dw PLMEntries_ScrollPLM 
    db $2F,$07 
    dw RoomPLM_WSEastSuper_0 
    dw $0000 

PLMPopulation_GravitySuit_State0_WreckedShipSave_State0:
    dw $0000 

PLMPopulation_WreckedShipSave_State1:
    dw PLMEntries_saveStation 
    db $07,$0B 
    dw $0000,$0000 

PLMPopulation_BowlingAlley_State1:
    dw PLMEntries_ScrollPLM 
    db $1F,$2D 
    dw RoomPLM_BowlingAlley_0 
    dw PLMEntries_upwardsExtension 
    db $41,$26 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $41,$27 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $41,$28 
    dw RoomPLM_BowlingAlley_3 
    dw PLMEntries_ReserveTankChozoOrb 
    db $53,$0B 
    dw $0081 
    dw PLMEntries_MissileTank 
    db $3C,$26 
    dw $0082 
    dw PLMEntries_greyDoorFacingRight 
    db $01,$16 
    dw $9087,$0000 

PLMPopulation_WreckedShipEntrance_State1:
    dw $0000 

PLMPopulation_Attic_State1:
    dw PLMEntries_greyDoorFacingRight 
    db $01,$06 
    dw $0C88 
    dw PLMEntries_greyDoorFacingLeft 
    db $6E,$06 
    dw $0C89 
    dw PLMEntries_greyDoorFacingUp 
    db $46,$0E 
    dw $0C8A 
    dw PLMEntries_wreckedShipAttic 
    db $08,$08 
    dw $8000,$0000 

PLMPopulation_AssemblyLine_State1:
    dw PLMEntries_MissileTank 
    db $2D,$08 
    dw $0083,$0000 

PLMPopulation_SpikyDeath_State1:
    dw $0000 

PLMPopulation_ElectricDeath_State1:
    dw PLMEntries_ScrollPLM 
    db $07,$10 
    dw RoomPLM_ElectricDeath_0 
    dw PLMEntries_rightwardsExtension 
    db $08,$10 
    dw $8000 
    dw PLMEntries_redDoorFacingRight 
    db $01,$06 
    dw $008B,$0000 

PLMPopulation_WreckedShipETank_State1:
    dw PLMEntries_EnergyTank 
    db $03,$06 
    dw $0084,$0000 

PLMPopulation_Basement_State1:
    dw PLMEntries_ScrollPLM 
    db $40,$0C 
    dw RoomPLM_Basement_0 
    dw PLMEntries_ScrollPLM 
    db $46,$0C 
    dw RoomPLM_Basement_1 
    dw $0000 

PLMPopulation_WreckedShipMap_State1:
    dw PLMEntries_mapStation 
    db $05,$0A 
    dw $8000,$0000 

PLMPopulation_SpongeBath_State1:
    dw $0000 

PLMPopulation_WSWestSuper_State1:
    dw PLMEntries_SuperMissileTank 
    db $02,$07 
    dw $0085,$0000 

PLMPopulation_WSEastSuper_State1:
    dw PLMEntries_ScrollPLM 
    db $2F,$07 
    dw RoomPLM_WSEastSuper_0 
    dw PLMEntries_SuperMissileTank 
    db $38,$09 
    dw $0086,$0000 

PLMPopulation_GravitySuit_State1:
    dw PLMEntries_GravitySuitChozoOrb 
    db $07,$09 
    dw $0087,$0000 

PLMPopulation_GlassTunnelSave:
    dw PLMEntries_saveStation 
    db $07,$0B 
    dw $0000,$0000 

PLMPopulation_GlassTunnel_State0_1:
    dw PLMEntries_ScrollPLM 
    db $03,$14 
    dw RoomPLM_GlassTunnel_0_4 
    dw PLMEntries_rightwardsExtension 
    db $04,$14 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $05,$14 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $06,$14 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $09,$14 
    dw RoomPLM_GlassTunnel_0_4 
    dw PLMEntries_rightwardsExtension 
    db $0A,$14 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $0B,$14 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $0C,$14 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $05,$1D 
    dw RoomPLM_GlassTunnel_8 
    dw PLMEntries_rightwardsExtension 
    db $06,$1D 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $07,$1D 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $08,$1D 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $09,$1D 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $0A,$1D 
    dw $8000 
    dw PLMEntries_NoobTube 
    db $02,$15 
    dw $0080 
    dw PLMEntries_redDoorFacingLeft 
    db $0E,$26 
    dw $008C,$0000 

PLMPopulation_WestTunnel:
    dw $0000 

PLMPopulation_EastTunnel:
    dw PLMEntries_ScrollPLM 
    db $05,$09 
    dw RoomPLM_EastTunnel_0 
    dw PLMEntries_ScrollPLM 
    db $05,$10 
    dw RoomPLM_EastTunnel_1 
    dw PLMEntries_ScrollPLM 
    db $05,$16 
    dw RoomPLM_EastTunnel_2 
    dw PLMEntries_upwardsExtension 
    db $0A,$03 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $0A,$04 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $0A,$05 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $0A,$06 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $0A,$07 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $0A,$08 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $0A,$09 
    dw RoomPLM_EastTunnel_9 
    dw PLMEntries_downwardsClosedGate 
    db $16,$05 
    dw $8000 
    dw PLMEntries_downwardsGateShotblock 
    db $16,$05 
    dw $000A,$0000 

PLMPopulation_MainStreet:
    dw PLMEntries_ScrollPLM 
    db $25,$29 
    dw RoomPLM_MainStreet_0 
    dw PLMEntries_redDoorFacingLeft 
    db $1E,$76 
    dw $008D 
    dw PLMEntries_MissileTank 
    db $0E,$35 
    dw $0088 
    dw PLMEntries_SuperMissileTank 
    db $16,$28 
    dw $0089,$0000 

PLMPopulation_FishTank:
    dw PLMEntries_upwardsExtension 
    db $1F,$26 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $1F,$27 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $1F,$28 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $1F,$29 
    dw RoomPLM_FishTank_3_7 
    dw PLMEntries_upwardsExtension 
    db $30,$26 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $30,$27 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $30,$28 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $30,$29 
    dw RoomPLM_FishTank_3_7 
    dw PLMEntries_redDoorFacingLeft 
    db $3E,$26 
    dw $008E,$0000 

PLMPopulation_MamaTurtle:
    dw PLMEntries_EnergyTank 
    db $1F,$0A 
    dw $008A 
    dw PLMEntries_MissileTankShotBlock 
    db $2C,$1D 
    dw $008B,$0000 

PLMPopulation_CrabTunnel:
    dw PLMEntries_downwardsClosedGate 
    db $0E,$07 
    dw $8000 
    dw PLMEntries_downwardsGateShotblock 
    db $0E,$07 
    dw $0008,$0000 

PLMPopulation_MtEverest:
    dw $0000 

PLMPopulation_RedFish:
    dw PLMEntries_ScrollPLM 
    db $20,$06 
    dw RoomPLM_RedFish_0 
    dw PLMEntries_ScrollPLM 
    db $1E,$06 
    dw RoomPLM_RedFish_1 
    dw $0000 

PLMPopulation_WateringHole:
    dw PLMEntries_ScrollPLM 
    db $07,$1F 
    dw RoomPLM_WateringHole_0 
    dw PLMEntries_SuperMissileTank 
    db $04,$26 
    dw $008C 
    dw PLMEntries_MissileTank 
    db $0B,$27 
    dw $008D,$0000 

PLMPopulation_NWestMaridiaBug:
    dw PLMEntries_upwardsExtension 
    db $20,$16 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $20,$17 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $20,$18 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $20,$19 
    dw RoomPLM_NWestMaridiaBug_3_7 
    dw PLMEntries_upwardsExtension 
    db $0F,$16 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $0F,$17 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $0F,$18 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $0F,$19 
    dw RoomPLM_NWestMaridiaBug_3_7 
    dw $0000 

PLMPopulation_CrabShaft:
    dw PLMEntries_ScrollPLM 
    db $07,$2D 
    dw RoomPLM_CrabShaft_0 
    dw PLMEntries_rightwardsExtension 
    db $08,$2D 
    dw $8000 
    dw PLMEntries_greenDoorFacingLeft 
    db $1E,$36 
    dw $008F,$0000 

PLMPopulation_PseudoPlasmaSpark:
    dw PLMEntries_upwardsExtension 
    db $1F,$26 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $1F,$27 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $1F,$28 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $1F,$29 
    dw RoomPLM_PseudoPlasmaSpark_3 
    dw PLMEntries_upwardsExtension 
    db $1D,$26 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $1D,$27 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $1D,$28 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $1D,$29 
    dw RoomPLM_PseudoPlasmaSpark_7 
    dw PLMEntries_MissileTank 
    db $2C,$28 
    dw $008E,$0000 

PLMPopulation_CrabHole:
    dw PLMEntries_ScrollPLM 
    db $08,$0E 
    dw RoomPLM_CrabHole_0_1 
    dw PLMEntries_ScrollPLM 
    db $08,$11 
    dw RoomPLM_CrabHole_0_1 
    dw PLMEntries_redDoorFacingLeft 
    db $0E,$16 
    dw $0090,$0000 

PLMPopulation_WestSandHallTunnel:
    dw $0000 

PLMPopulation_PlasmaTutorial:
    dw $0000 

PLMPopulation_Plasma:
    dw PLMEntries_greyDoorFacingRight 
    db $01,$06 
    dw $0C91 
    dw PLMEntries_PlasmaBeamChozoOrb 
    db $19,$26 
    dw $008F,$0000 

PLMPopulation_ThreadTheNeedle:
    dw $0000 

PLMPopulation_MaridiaElev:
    dw PLMEntries_elevatorPlatform 
    db $06,$2C 
    dw $8000 
    dw PLMEntries_redDoorFacingLeft 
    db $0E,$46 
    dw $0092,$0000 

PLMPopulation_PlasmaSpark:
    dw PLMEntries_greyDoorFacingLeft 
    db $2E,$16 
    dw $0093 
    dw PLMEntries_greenDoorFacingUp 
    db $06,$2D 
    dw $0094,$0000 

PLMPopulation_Kassiuz:
    dw $0000 

PLMPopulation_MaridiaMap:
    dw PLMEntries_mapStation 
    db $0B,$0A 
    dw $8000,$0000 

PLMPopulation_ForgottenHighwaySave:
    dw PLMEntries_saveStation 
    db $07,$0B 
    dw $0001,$0000 

PLMPopulation_Toilet:
    dw $0000 

PLMPopulation_BugSandHole:
    dw $0000 

PLMPopulation_WestSandHall:
    dw $0000 

PLMPopulation_Oasis:
    dw PLMEntries_ScrollPLM 
    db $03,$14 
    dw RoomPLM_Oasis_0 
    dw PLMEntries_rightwardsExtension 
    dw $1404,$8000 
    dw PLMEntries_rightwardsExtension 
    db $05,$14 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $06,$14 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $07,$14 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $08,$14 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $09,$14 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $0A,$14 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $0B,$14 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $0C,$14 
    dw $8000 
    dw PLMEntries_greenDoorFacingDown 
    db $06,$02 
    dw $0095,$0000 

PLMPopulation_EastSandHall:
    dw $0000 

PLMPopulation_WestSandHole:
    dw PLMEntries_MissileTank 
    db $06,$04 
    dw $0090 
    dw PLMEntries_ReserveTankChozoOrb 
    db $0F,$04 
    dw $0091,$0000 

PLMPopulation_EastSandHole:
    dw PLMEntries_MissileTank 
    db $03,$07 
    dw $0092 
    dw PLMEntries_PowerBombTank 
    db $19,$10 
    dw $0093,$0000 

PLMPopulation_WestAqueductQuicksand:
    dw $0000 

PLMPopulation_EastAqueductQuicksand:
    dw $0000 

PLMPopulation_Aqueduct:
    dw PLMEntries_redDoorFacingRight 
    db $01,$26 
    dw $0096 
    dw PLMEntries_MissileTank 
    db $4C,$09 
    dw $0094 
    dw PLMEntries_SuperMissileTank 
    db $5C,$08 
    dw $0095,$0000 

PLMPopulation_Butterfly:
    dw PLMEntries_greyDoorFacingLeft 
    db $0E,$06 
    dw $0097,$0000 

PLMPopulation_BotwoonHallway:
    dw $0000 

PLMPopulation_Pants:
    dw PLMEntries_ScrollPLM 
    db $06,$32 
    dw RoomPLM_Pants_0_4 
    dw PLMEntries_rightwardsExtension 
    db $07,$32 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $08,$32 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $09,$32 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $0D,$0C 
    dw RoomPLM_Pants_0_4 
    dw PLMEntries_upwardsExtension 
    db $0D,$0B 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $0D,$0A 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $0D,$09 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $0D,$08 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $0D,$07 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $0D,$06 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $0D,$05 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $0D,$04 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $12,$0E 
    dw RoomPLM_Pants_D 
    dw PLMEntries_upwardsExtension 
    db $12,$0D 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $12,$0C 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $12,$0B 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $12,$0A 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $12,$09 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $12,$08 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $12,$07 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $15,$2B 
    dw RoomPLM_Pants_15 
    dw PLMEntries_rightwardsExtension 
    db $16,$2B 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $17,$2B 
    dw $8000,$0000 

PLMPopulation_EastPants:
    dw PLMEntries_ScrollPLM 
    db $05,$22 
    dw RoomPLM_EastPants_0 
    dw PLMEntries_rightwardsExtension 
    db $06,$22 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $07,$22 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $08,$22 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $09,$22 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $0A,$12 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $05,$1B 
    dw RoomPLM_EastPants_6 
    dw PLMEntries_rightwardsExtension 
    db $06,$1B 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $07,$1B 
    dw $8000,$0000 

PLMPopulation_Springball:
    dw PLMEntries_SpringBallChozoOrb 
    db $18,$16 
    dw $0096,$0000 

PLMPopulation_BelowBotwoonETank:
    dw $0000 

PLMPopulation_Colosseum:
    dw PLMEntries_redDoorFacingLeft 
    db $6E,$06 
    dw $0098 
    dw PLMEntries_greenDoorFacingLeft 
    db $4E,$26 
    dw $0099 
    dw PLMEntries_greenDoorFacingLeft 
    db $6E,$16 
    dw $009A,$0000 

PLMPopulation_AqueductSave:
    dw PLMEntries_saveStation 
    db $05,$0B 
    dw $0002,$0000 

PLMPopulation_ThePrecious_State0_1:
    dw PLMEntries_ScrollPLM 
    db $04,$0E 
    dw RoomPLM_ThePrecious_0 
    dw PLMEntries_rightwardsExtension 
    db $05,$0E 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $06,$0E 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $07,$0E 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $08,$0E 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $09,$0E 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $0A,$0E 
    dw $8000 
    dw PLMEntries_rightwardsExtension 
    db $0B,$0E 
    dw $8000 
    dw PLMEntries_EyeDoorFacingRIght 
    db $01,$26 
    dw $009B 
    dw PLMEntries_EyeDoorBottomFacingRight 
    db $01,$29 
    dw $009B 
    dw PLMEntries_EyeDoorEyeFacingRight 
    db $01,$27 
    dw $009B 
    dw PLMEntries_MissileTankShotBlock 
    db $1C,$06 
    dw $0097,$0000 

PLMPopulation_BotwoonETank:
    dw PLMEntries_EnergyTank 
    db $32,$05 
    dw $0098,$0000 

PLMPopulation_DraygonSave:
    dw PLMEntries_saveStation 
    db $07,$0B 
    dw $0003,$0000 

PLMPopulation_MaridiaMissileRefill:
    dw PLMEntries_missileStation 
    db $08,$0A 
    dw $0099,$0000 

PLMPopulation_PlasmaBeachQuicksand:
    dw $0000 

PLMPopulation_BotwoonQuicksand:
    dw $0000 

PLMPopulation_Shaktool_State0_1:
    dw $0000 

PLMPopulation_HalfieClimb:
    dw PLMEntries_ScrollPLM 
    db $10,$29 
    dw RoomPLM_HalfieClimb_0 
    dw PLMEntries_ScrollPLM 
    db $0B,$29 
    dw RoomPLM_HalfieClimb_1 
    dw PLMEntries_upwardsExtension 
    db $0B,$28 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $0B,$27 
    dw $8000 
    dw PLMEntries_upwardsExtension 
    db $0B,$26 
    dw $8000 
    dw PLMEntries_ScrollPLM 
    db $0E,$29 
    dw RoomPLM_HalfieClimb_5 
    dw PLMEntries_greyDoorFacingRight 
    db $01,$16 
    dw $009C,$0000 

PLMPopulation_Botwoon_State0_1:
    dw PLMEntries_greyDoorFacingRight 
    db $01,$06 
    dw $049D,$0000 

PLMPopulation_SpaceJump:
    dw PLMEntries_SpaceJumpChozoOrb 
    db $04,$08 
    dw $009A,$0000 

PLMPopulation_MaridiaEnergyRefill:
    dw PLMEntries_energyStation 
    db $08,$0A 
    dw $009B,$0000 

PLMPopulation_WestCactusAlley:
    dw $0000 

PLMPopulation_EastCactusAlley:
    dw $0000 

PLMPopulation_Draygon_State0_1:
    dw PLMEntries_greyDoorFacingLeft 
    db $1E,$06 
    dw $009E 
    dw PLMEntries_greyDoorFacingRight 
    db $01,$16 
    dw $009F 
    dw PLMEntries_DraygonCannonFacingRight 
    db $02,$0B 
    dw $8802 
    dw PLMEntries_DraygonCannonWithShieldFacingRight 
    db $02,$12 
    dw $8804 
    dw PLMEntries_DraygonCannonWithShieldFacingLeft 
    db $1D,$0F 
    dw $8806 
    dw PLMEntries_DraygonCannonWithShieldFacingLeft 
    db $1D,$15 
    dw $8808,$0000 

PLMPopulation_TourianFirst:
    dw PLMEntries_elevatorPlatform 
    db $06,$2C 
    dw $8000,$0000 

PLMPopulation_Metroids1_State0_1:
    dw PLMEntries_SetsMetroidsClearedStatesWhenRequired 
    db $08,$08 
    dw $0012 
    dw PLMEntries_greyDoorFacingRight 
    db $01,$06 
    dw $0CA0,$0000 

PLMPopulation_Metroids2_State0_1:
    dw PLMEntries_SetsMetroidsClearedStatesWhenRequired 
    db $08,$08 
    dw $0014 
    dw PLMEntries_greyDoorFacingLeft 
    db $0E,$16 
    dw $0CA1,$0000 

PLMPopulation_Metroids3_State0_1:
    dw PLMEntries_SetsMetroidsClearedStatesWhenRequired 
    db $08,$08 
    dw $0016 
    dw PLMEntries_greyDoorFacingLeft 
    db $5E,$06 
    dw $0CA2,$0000 

PLMPopulation_Metroids4_State0_1:
    dw PLMEntries_SetsMetroidsClearedStatesWhenRequired 
    db $08,$08 
    dw $0018 
    dw PLMEntries_greyDoorFacingUp 
    db $06,$1E 
    dw $0CA3,$0000 

PLMPopulation_BlueHopper_State0_1:
    dw $0000 

PLMPopulation_DustTorizo_State0_1:
    dw PLMEntries_greyDoorFacingLeft 
    db $1E,$06 
    dw $90A4 
    dw PLMEntries_greyDoorFacingRight 
    db $01,$06 
    dw $0CA5,$0000 

PLMPopulation_BigBoy_State0_1:
    dw PLMEntries_greyDoorFacingLeft 
    db $3E,$06 
    dw $90A6,$0000 

PLMPopulation_Seaweed:
    dw PLMEntries_redDoorFacingLeft 
    db $0E,$16 
    dw $00A7,$0000 

PLMPopulation_TourianRecharge:
    dw PLMEntries_missileStation 
    db $08,$0A 
    dw $009C 
    dw PLMEntries_energyStation 
    db $06,$0A 
    dw $009D,$0000 

PLMPopulation_MotherBrain_State0_1_2:
    dw PLMEntries_MotherBrainsGlass 
    db $09,$05 
    dw $8000,$0000 

PLMPopulation_TourianEyeDoor:
    dw PLMEntries_EyeDoorFacingLeft 
    db $3E,$06 
    dw $00A8 
    dw PLMEntries_EyeDoorBottomFacingLeft 
    db $3E,$09 
    dw $00A8 
    dw PLMEntries_EyeDoorEyeFacingLeft 
    db $3E,$07 
    dw $00A8,$0000 

PLMPopulation_RinkaShaft:
    dw PLMEntries_redDoorFacingRight 
    db $01,$26 
    dw $00A9,$0000 

PLMPopulation_MotherBrainSave:
    dw PLMEntries_saveStation 
    db $05,$0B 
    dw $0000,$0000 

PLMPopulation_TourianEscape1:
    dw PLMEntries_SetsMetroidsClearedStatesWhenRequired 
    db $08,$08 
    dw $0000 
    dw PLMEntries_gateThatClosesInEscapeRoom1 
    db $1F,$06 
    dw $8000,$0000 

PLMPopulation_TourianEscape2:
    dw PLMEntries_SetsMetroidsClearedStatesWhenRequired 
    db $08,$08 
    dw $0002 
    dw PLMEntries_greyDoorFacingDown 
    db $06,$03 
    dw $90AA,$0000 

PLMPopulation_TourianEscape3:
    dw PLMEntries_SetsMetroidsClearedStatesWhenRequired 
    db $08,$08 
    dw $0004 
    dw PLMEntries_greyDoorFacingRight 
    db $01,$16 
    dw $90AB,$0000 

PLMPopulation_TourianEscape4:
    dw PLMEntries_SetsMetroidsClearedStatesWhenRequired 
    db $08,$08 
    dw $0006 
    dw PLMEntries_greyDoorFacingRight 
    db $01,$36 
    dw $90AC,$0000 

PLMPopulation_UpperTourianSave:
    dw PLMEntries_saveStation 
    db $07,$0B 
    dw $0001,$0000 

PLMPopulation_CeresElev_State0_1:
    dw $0000 

PLMPopulation_FallingTile_State0_1:
    dw $0000 

PLMPopulation_MagnetStairs_State0_1:
    dw $0000 

PLMPopulation_DeadScientist_State0_1:
    dw $0000 

PLMPopulation_58Escape_State0_1:
    dw $0000 

PLMPopulation_CeresRidley_State0_1:
    dw $0000 

RTS_8FC8C7:
    RTS 


SetupASM_SpawnPrePhantoonRoomEnemyProjectile:
    LDY.W #EnemyProjectile_PrePhantoonRoom 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    RTS 


RTS_8FC8D0:
    RTS 


RTS_8FC8D1:
    RTS 


RTS_8FC8D2:
    RTS 


SetupASM_SetupShaktoolsRoomPLM:
    JSL.L Spawn_Hardcoded_PLM 
    db $00,$00 
    dw PLMEntries_shaktoolsRoom 
    RTS 


RTS_8FC8DC:
    RTS 


SetupASM_SetPausingCodeForDraygon:
    LDA.W #PauseHook_Draygon>>8&$FF00 : STA.W $0602 
    LDA.W #PauseHook_Draygon : STA.W $0601 
    LDA.W #UnpauseHook_Draygon>>8&$FF00 : STA.W $0605 
    LDA.W #UnpauseHook_Draygon : STA.W $0604 
    RTS 


PauseHook_Draygon:
    LDA.W #$0004 : STA.B $A7 
    RTL 


UnpauseHook_Draygon:
    LDA.W $18B6 
    CMP.W #$0008 
    BNE .return 
    LDA.W #$000C : STA.B $A7 

.return:
    RTL 


SetupASM_SetCollectedMap:
    REP #$30 
    LDX.W $079F 
    LDA.L $7ED908,X : ORA.W #$0001 : STA.L $7ED908,X 
    STA.W $0789 
    RTS 


RTS_8FC91E:
    RTS 


SetupASM_SetZebesTimebombEvent_SetLightHorizontalRoomShaking:
    LDA.W #$000E : JSL.L MarkEvent_inA 
    LDA.W #$0012 : STA.W $183E 
    LDA.W #$FFFF : STA.W $1840 
    RTS 


SetupASM_SetLightHorizontalRoomShaking:
    LDA.W #$0012 : STA.W $183E 
    STA.W $07E3 
    STZ.W $07E1 
    LDA.W #$FFFF : STA.W $1840 
    RTS 


SetupASM_SetMediumHorizontalRoomShaking:
    LDA.W #$0015 : STA.W $183E 
    LDA.W #$FFFF : STA.W $1840 
    RTS 


SetupASM_SetupEscapeRoom4sPLM_SetMediumHorizontalRoomShaking:
    JSL.L Spawn_Hardcoded_PLM 
    db $10,$10 
    dw PLMEntries_RaiseAcidInEscapeRoomBeforeOldTourianEscapeShaft 
    LDA.W #$0015 : STA.W $183E 
    STA.W $07E3 
    STZ.W $07E1 
    LDA.W #$FFFF : STA.W $1840 
    RTS 


SetupASM_TurnCeresDoorToSolidBlocks_SpawnCeresHaze:
    JSL.L Spawn_Hardcoded_PLM ; fallthrough to SetupASM_SpawnCeresHaze
    db $0F,$26 
    dw PLMEntries_turnCeresElevatorDoorToSolidBlocksDuringEscape 

SetupASM_SpawnCeresHaze:
    JSL.L FXType_2C_CeresHaze 
    RTS 


SetupASM_SetBG1_2_TilesBaseAddress_SpawnCeresHaze:
    PHP 
    SEP #$20 
    LDA.B #$66 : STA.B $5D 
    PLP 
    JSL.L FXType_2C_CeresHaze 
    LDA.W #$0009 : STA.W $07EB 
    RTS 


RoomHeader_BowlingAlley:
    db $00,$03,$0A,$0B,$06,$03,$70,$A0,$00 
    dw RoomDoors_BowlingAlley 
    dw RoomStateCheck_BossIsDead 
    db $01 
    dw RoomState_BowlingAlley_1 
    dw Use_StatePointer_inX 

RoomState_BowlingAlley_0:
    dl LevelData_BowlingAlley 
    db $05,$30,$03 
    dw FXHeader_BowlingAlley_State0 
    dw EnemyPopulations_BowlingAlley_0 
    dw EnemySets_BowlingAlley_0 
    db $00,$00 
    dw RoomScrolls_BowlingAlley 
    dw $0000 
    dw $0000 
    dw PLMPopulation_BowlingAlley_State0 
    dw $0000 
    dw RTS_8FC8C7 

RoomState_BowlingAlley_1:
    dl LevelData_BowlingAlley 
    db $04,$30,$03 
    dw FXHeader_BowlingAlley_State1 
    dw EnemyPopulations_BowlingAlley_1 
    dw EnemySets_BowlingAlley_1 
    db $00,$00 
    dw RoomScrolls_BowlingAlley 
    dw $0000 
    dw $0000 
    dw PLMPopulation_BowlingAlley_State1 
    dw $0000 
    dw RTS_8FC8C7 

RoomDoors_BowlingAlley:
    dw Door_BowlingAlley_0 
    dw Door_BowlingAlley_1 
    dw Door_BowlingAlley_2 

RoomScrolls_BowlingAlley:
    db $00,$00,$01,$01,$01,$02,$01,$01,$01 
    dw $0101 
    dw $0002 
    db $01 
    dw $0000 
    dw $0200 

RoomPLM_BowlingAlley_0:
    db $0E,$01,$0F,$01,$80 

RoomPLM_BowlingAlley_3:
    db $04,$00,$05,$02,$0B,$02,$10,$01,$11,$01,$80 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_RoomPLM_8FC9FC:
    db $05,$01,$80 

UNUSED_RoomPLM_8FC9FF:
    db $04,$01,$80 

UNUSED_RoomPLM_8FCA02:
    db $05,$00,$80 

UNUSED_RoomPLM_8FCA05:
    db $04,$00,$80 
endif ; !FEATURE_KEEP_UNREFERENCED

RoomHeader_WreckedShipEntrance:
    db $01,$03,$0C,$0E,$04,$01,$70,$A0,$00 
    dw RoomDoors_WreckedShipEntrance 
    dw RoomStateCheck_BossIsDead 
    db $01 
    dw RoomState_WreckedShipEntrance_1 
    dw Use_StatePointer_inX 

RoomState_WreckedShipEntrance_0:
    dl LevelData_WreckedShipEntrance 
    db $05,$30,$05 
    dw FXHeader_WreckedShipEntrance_State0 
    dw EnemyPopulations_WreckedShipEntrance_0 
    dw EnemySets_WreckedShipEntrance_0 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_WreckedShipEntrance_State0 
    dw LibBG_WreckedShip_4_5_EntranceHall 
    dw RTS_8FC8C7 

RoomState_WreckedShipEntrance_1:
    dl LevelData_WreckedShipEntrance 
    db $04,$30,$06 
    dw FXHeader_WreckedShipEntrance_State1 
    dw EnemyPopulations_WreckedShipEntrance_1 
    dw EnemySets_WreckedShipEntrance_1 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_WreckedShipEntrance_State1 
    dw LibBG_WreckedShip_4_5_EntranceHall 
    dw RTS_8FC8C7 

RoomDoors_WreckedShipEntrance:
    dw Door_WreckedShipEntrance_0 
    dw Door_WreckedShipEntrance_1 

RoomHeader_Attic:
    db $02,$03,$0C,$0A,$07,$01,$00,$00,$00 
    dw RoomDoors_Attic 
    dw RoomStateCheck_BossIsDead 
    db $01 
    dw RoomState_Attic_1 
    dw Use_StatePointer_inX 

RoomState_Attic_0:
    dl LevelData_Attic_State0 
    db $05,$30,$05 
    dw FXHeader_Attic_State0 
    dw EnemyPopulations_Attic_0 
    dw EnemySets_Attic_0 
    db $C1,$FF 
    dw RoomScrolls_Attic 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Attic_State0 
    dw LibBG_WreckedShip_4_5_ExperimentRoom 
    dw RTS_8FC8C7 

RoomState_Attic_1:
    dl LevelData_Attic_State1 
    db $04,$30,$06 
    dw FXHeader_Attic_State1 
    dw EnemyPopulations_Attic_1 
    dw EnemySets_Attic_1 
    db $C1,$FF 
    dw RoomScrolls_Attic 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Attic_State1 
    dw LibBG_WreckedShip_4_5_ExperimentRoom 
    dw RTS_8FC8C7 

RoomDoors_Attic:
    dw Door_Attic_0 
    dw Door_Attic_1 
    dw Door_Attic_2 

RoomScrolls_Attic:
    db $02,$02,$02,$02,$02,$02,$02 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_RoomPLM_8FCAA5:
    db $00,$01,$80 

UNUSED_RoomPLM_8FCAA8:
    db $03,$01,$80 

UNUSED_RoomPLM_8FCAAB:
    db $03,$02,$80 
endif ; !FEATURE_KEEP_UNREFERENCED

RoomHeader_AssemblyLine:
    db $03,$03,$13,$0A,$03,$01,$70,$A0,$00 
    dw RoomDoors_AssemblyLine 
    dw RoomStateCheck_BossIsDead 
    db $01 
    dw RoomState_AssemblyLine_1 
    dw Use_StatePointer_inX 

RoomState_AssemblyLine_0:
    dl LevelData_AssemblyLine 
    db $05,$00,$00 
    dw FXHeader_AssemblyLine_State0 
    dw EnemyPopulations_AssemblyLine_0 
    dw EnemySets_AssemblyLine_0 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_AssemblyLine_State0 
    dw LibBG_WreckedShip_4_5_Panels_Vents_Vertical 
    dw RTS_8FC8C7 

RoomState_AssemblyLine_1:
    dl LevelData_AssemblyLine 
    db $04,$00,$00 
    dw FXHeader_AssemblyLine_State1 
    dw EnemyPopulations_AssemblyLine_1 
    dw EnemySets_AssemblyLine_1 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_AssemblyLine_State1 
    dw LibBG_WreckedShip_4_5_Panels_Vents_Vertical 
    dw RTS_8FC8C7 

RoomDoors_AssemblyLine:
    dw Door_AssemblyLine_0 

RoomHeader_WreckedShipMainShaft:
    db $04,$03,$0C,$0B,$06,$08,$70,$A0,$00 
    dw RoomDoors_WreckedShipMainShaft 
    dw RoomStateCheck_BossIsDead 
    db $01 
    dw RoomState_WreckedShipMainShaft_1 
    dw Use_StatePointer_inX 

RoomState_WreckedShipMainShaft_0:
    dl LevelData_WreckedShipMainShaft_State0 
    db $05,$30,$05 
    dw FXHeader_WreckedShipMainShaft_State0 
    dw EnemyPopulations_WreckedShipMainShaft_0 
    dw EnemySets_WreckedShipMainShaft_0 
    db $C1,$C1 
    dw RoomScrolls_WreckedShipMainShaft 
    dw $0000 
    dw $0000 
    dw PLMPopulation_WreckedShipMainShaft_State0_1 
    dw LibBG_WreckedShip_4_5_Panels_Vents_Horizontal 
    dw RTS_8FC8C7 

RoomState_WreckedShipMainShaft_1:
    dl LevelData_WreckedShipMainShaft_State1 
    db $04,$30,$06 
    dw FXHeader_WreckedShipMainShaft_State1 
    dw EnemyPopulations_WreckedShipMainShaft_1 
    dw EnemySets_WreckedShipMainShaft_1 
    db $C1,$C1 
    dw RoomScrolls_WreckedShipMainShaft 
    dw $0000 
    dw $0000 
    dw PLMPopulation_WreckedShipMainShaft_State0_1 
    dw LibBG_WreckedShip_4_5_Panels_Vents_Horizontal 
    dw RTS_8FC8C7 

RoomDoors_WreckedShipMainShaft:
    dw Door_WreckedShipMainShaft_0 
    dw Door_WreckedShipMainShaft_1 
    dw Door_WreckedShipMainShaft_2 
    dw Door_WreckedShipMainShaft_3 
    dw Door_WreckedShipMainShaft_4 
    dw Door_WreckedShipMainShaft_5 
    dw Door_WreckedShipMainShaft_6 

RoomScrolls_WreckedShipMainShaft:
    db $00,$00,$00,$00,$02,$00,$00,$00,$00,$00,$02,$00,$00,$00,$00,$00 
    db $02,$00,$00,$00,$00,$00,$02,$00,$00,$00,$00,$00,$02,$00,$01,$01 
    db $01,$00,$02,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00 

RoomPLM_WreckedShipMainShaft_0:
    db $21,$01,$80 

RoomPLM_WreckedShipMainShaft_1:
    db $29,$01,$80 

RoomPLM_WreckedShipMainShaft_2:
    db $21,$00,$80 

RoomPLM_WreckedShipMainShaft_3:
    db $29,$00,$80 

RoomPLM_WreckedShipMainShaft_4:
    db $28,$02,$2E,$02,$80 

RoomHeader_SpikyDeath:
    db $05,$03,$13,$0F,$02,$01,$70,$A0,$00 
    dw RoomDoors_SpikyDeath 
    dw RoomStateCheck_BossIsDead 
    db $01 
    dw RoomState_SpikyDeath_1 
    dw Use_StatePointer_inX 

RoomState_SpikyDeath_0:
    dl LevelData_SpikyDeath 
    db $05,$00,$00 
    dw FXHeader_SpikyDeath_State0 
    dw EnemyPopulations_SpikyDeath_0 
    dw EnemySets_SpikyDeath_0 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_SpikyDeath_State0 
    dw LibBG_WreckedShip_4_5_Columns_Tubes 
    dw RTS_8FC8C7 

RoomState_SpikyDeath_1:
    dl LevelData_SpikyDeath 
    db $04,$00,$00 
    dw FXHeader_SpikyDeath_State1 
    dw EnemyPopulations_SpikyDeath_1 
    dw EnemySets_SpikyDeath_1 
    db $C1,$C1 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_SpikyDeath_State1 
    dw LibBG_WreckedShip_4_5_Columns_Tubes 
    dw RTS_8FC8C7 

RoomDoors_SpikyDeath:
    dw Door_SpikyDeath_0 
    dw Door_SpikyDeath_1 

RoomHeader_ElectricDeath:
    db $06,$03,$15,$0D,$01,$03,$70,$A0,$00 
    dw RoomDoors_ElectricDeath 
    dw RoomStateCheck_BossIsDead 
    db $01 
    dw RoomState_ElectricDeath_1 
    dw Use_StatePointer_inX 

RoomState_ElectricDeath_0:
    dl LevelData_ElectricDeath 
    db $05,$30,$05 
    dw FXHeader_ElectricDeath_State0 
    dw EnemyPopulations_ElectricDeath_0 
    dw EnemySets_ElectricDeath_0 
    db $C1,$C1 
    dw RoomScrolls_ElectricDeath 
    dw $0000 
    dw $0000 
    dw PLMPopulation_ElectricDeath_State0 
    dw LibBG_WreckedShip_4_5_Panels_Vents_Horizontal 
    dw RTS_8FC8C7 

RoomState_ElectricDeath_1:
    dl LevelData_ElectricDeath 
    db $04,$30,$06 
    dw FXHeader_ElectricDeath_State1 
    dw EnemyPopulations_ElectricDeath_1 
    dw EnemySets_ElectricDeath_1 
    db $C1,$C1 
    dw RoomScrolls_ElectricDeath 
    dw $0000 
    dw $0000 
    dw PLMPopulation_ElectricDeath_State1 
    dw LibBG_WreckedShip_4_5_Panels_Vents_Horizontal 
    dw RTS_8FC8C7 

RoomDoors_ElectricDeath:
    dw Door_ElectricDeath_0 
    dw Door_ElectricDeath_1 
    dw Door_ElectricDeath_2 

RoomScrolls_ElectricDeath:
    db $00,$02,$02 

RoomPLM_ElectricDeath_0:
    db $00,$02,$80 

RoomHeader_WreckedShipETank:
    db $07,$03,$12,$0D,$03,$02,$90,$A0,$00 
    dw RoomDoors_WreckedShipETank 
    dw RoomStateCheck_BossIsDead 
    db $01 
    dw RoomState_WreckedShipETank_1 
    dw Use_StatePointer_inX 

RoomState_WreckedShipETank_0:
    dl LevelData_WreckedShipETank 
    db $05,$00,$03 
    dw FXHeader_WreckedShipETank_State0 
    dw EnemyPopulations_WreckedShipETank_0 
    dw EnemySets_WreckedShipETank_0 
    db $C0,$00 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_WreckedShipETank_State0 
    dw $0000 
    dw RTS_8FC8C7 

RoomState_WreckedShipETank_1:
    dl LevelData_WreckedShipETank 
    db $04,$00,$03 
    dw FXHeader_WreckedShipETank_State1 
    dw EnemyPopulations_WreckedShipETank_1 
    dw EnemySets_WreckedShipETank_1 
    db $C0,$00 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_WreckedShipETank_State1 
    dw $0000 
    dw RTS_8FC8C7 

RoomDoors_WreckedShipETank:
    dw Door_WreckedShipETank_0 

RoomHeader_Basement:
    db $08,$03,$0E,$13,$05,$01,$70,$A0,$00 
    dw RoomDoors_Basement 
    dw RoomStateCheck_BossIsDead 
    db $01 
    dw RoomState_Basement_1 
    dw Use_StatePointer_inX 

RoomState_Basement_0:
    dl LevelData_Basement 
    db $05,$30,$05 
    dw FXHeader_Basement_State0 
    dw EnemyPopulations_Basement_0 
    dw EnemySets_Basement_0 
    db $C1,$C1 
    dw RoomScrolls_Basement 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Basement_State0 
    dw LibBG_WreckedShip_4_5_Columns_Tubes 
    dw SetupASM_SpawnPrePhantoonRoomEnemyProjectile 

RoomState_Basement_1:
    dl LevelData_Basement 
    db $04,$30,$06 
    dw FXHeader_Basement_State1 
    dw EnemyPopulations_Basement_1 
    dw EnemySets_Basement_1 
    db $C1,$01 
    dw RoomScrolls_Basement 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Basement_State1 
    dw LibBG_WreckedShip_4_5_Columns_Tubes 
    dw SetupASM_SpawnPrePhantoonRoomEnemyProjectile 

RoomDoors_Basement:
    dw Door_Basement_0 
    dw Door_Basement_1 
    dw Door_Basement_2 

RoomScrolls_Basement:
    db $01,$01,$01,$01,$00 

RoomPLM_Basement_0:
    db $03,$01,$04,$01,$80 

RoomPLM_Basement_1:
    db $03,$00,$80 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_RoomPLM_8FCCC8:
    db $04,$00,$80 
endif ; !FEATURE_KEEP_UNREFERENCED

RoomHeader_WreckedShipMap:
    db $09,$03,$0D,$13,$01,$01,$70,$A0,$00 
    dw RoomDoors_WreckedShipMap 
    dw RoomStateCheck_BossIsDead 
    db $01 
    dw RoomState_WreckedShipMap_1 
    dw Use_StatePointer_inX 

RoomState_WreckedShipMap_0:
    dl LevelData_MapStation_RightSideDoor 
    db $16,$00,$00 
    dw FXHeader_WreckedShipMap_State0 
    dw EnemyPopulations_WreckedShipMap_0 
    dw EnemySets_WreckedShipMap_0 
    db $00,$00 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_WreckedShipMap_State0 
    dw $0000 
    dw RTS_8FC8D0 

RoomState_WreckedShipMap_1:
    dl LevelData_MapStation_RightSideDoor 
    db $15,$00,$00 
    dw FXHeader_WreckedShipMap_State1 
    dw EnemyPopulations_WreckedShipMap_1 
    dw EnemySets_WreckedShipMap_1 
    db $00,$00 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_WreckedShipMap_State1 
    dw $0000 
    dw RTS_8FC8D0 

RoomDoors_WreckedShipMap:
    dw Door_WreckedShipMap_0 

RoomHeader_Phantoon:
    db $0A,$03,$13,$13,$01,$01,$70,$A0,$00 
    dw RoomDoors_Phantoon 
    dw RoomStateCheck_BossIsDead 
    db $01 
    dw RoomState_Phantoon_1 
    dw Use_StatePointer_inX 

RoomState_Phantoon_0:
    dl LevelData_Phantoon 
    db $05,$27,$06 
    dw FXHeader_Phantoon_State0 
    dw EnemyPopulations_Phantoon_0 
    dw EnemySets_Phantoon_0 
    db $01,$01 
    dw RoomScrolls_Phantoon 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Phantoon_State0_1 
    dw LibBG_Phantoon_State0 
    dw RTS_8FC8D0 

RoomState_Phantoon_1:
    dl LevelData_Phantoon 
    db $04,$00,$03 
    dw FXHeader_Phantoon_State1 
    dw EnemyPopulations_Phantoon_1 
    dw EnemySets_Phantoon_1 
    db $01,$01 
    dw RoomScrolls_Phantoon 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Phantoon_State0_1 
    dw LibBG_Phantoon_Draygon_State1 
    dw RTS_8FC8D0 

RoomDoors_Phantoon:
    dw Door_Phantoon_0 

RoomScrolls_Phantoon:
    db $01 

RoomHeader_SpongeBath:
    db $0B,$03,$11,$0F,$02,$01,$70,$A0,$00 
    dw RoomDoors_SpongeBath 
    dw RoomStateCheck_BossIsDead 
    db $01 
    dw RoomState_SpongeBath_1 
    dw Use_StatePointer_inX 

RoomState_SpongeBath_0:
    dl LevelData_SpongeBath 
    db $05,$00,$00 
    dw FXHeader_SpongeBath_State0 
    dw EnemyPopulations_SpongeBath_0 
    dw EnemySets_SpongeBath_0 
    db $C1,$C1 
    dw RoomScrolls_SpongeBath 
    dw $0000 
    dw $0000 
    dw PLMPopulation_SpongeBath_State0 
    dw LibBG_WreckedShip_4_5_Panels_Vents 
    dw RTS_8FC8D0 

RoomState_SpongeBath_1:
    dl LevelData_SpongeBath 
    db $04,$00,$00 
    dw FXHeader_SpongeBath_State1 
    dw EnemyPopulations_SpongeBath_1 
    dw EnemySets_SpongeBath_1 
    db $C1,$C1 
    dw RoomScrolls_SpongeBath 
    dw $0000 
    dw $0000 
    dw PLMPopulation_SpongeBath_State1 
    dw LibBG_WreckedShip_4_5_Panels_Vents 
    dw RTS_8FC8D0 

RoomDoors_SpongeBath:
    dw Door_SpongeBath_0 
    dw Door_SpongeBath_1 

RoomScrolls_SpongeBath:
    db $01,$01 

RoomHeader_WSWestSuper:
    db $0C,$03,$0F,$11,$01,$01,$70,$A0,$00 
    dw RoomDoors_WSWestSuper 
    dw RoomStateCheck_BossIsDead 
    db $01 
    dw RoomState_WSWestSuper_1 
    dw Use_StatePointer_inX 

RoomState_WSWestSuper_0:
    dl LevelData_WSWestSuper 
    db $05,$00,$00 
    dw FXHeader_WSWestSuper_State0 
    dw EnemyPopulations_WSWestSuper_0 
    dw EnemySets_WSWestSuper_0 
    db $C1,$C1 
    dw RoomScrolls_WSWestSuper 
    dw $0000 
    dw $0000 
    dw PLMPopulation_WSWestSuper_State0 
    dw LibBG_WreckedShip_4_5_Panels_Vents 
    dw RTS_8FC8D0 

RoomState_WSWestSuper_1:
    dl LevelData_WSWestSuper 
    db $04,$00,$00 
    dw FXHeader_WSWestSuper_State1 
    dw EnemyPopulations_WSWestSuper_1 
    dw EnemySets_WSWestSuper_1 
    db $C1,$C1 
    dw RoomScrolls_WSWestSuper 
    dw $0000 
    dw $0000 
    dw PLMPopulation_WSWestSuper_State1 
    dw LibBG_WreckedShip_4_5_Panels_Vents 
    dw RTS_8FC8D0 

RoomDoors_WSWestSuper:
    dw Door_WSWestSuper_0 

RoomScrolls_WSWestSuper:
    db $01 

RoomHeader_WSEastSuper:
    db $0D,$03,$12,$11,$04,$01,$70,$A0,$00 
    dw RoomDoors_WSEastSuper 
    dw RoomStateCheck_BossIsDead 
    db $01 
    dw RoomState_WSEastSuper_1 
    dw Use_StatePointer_inX 

RoomState_WSEastSuper_0:
    dl LevelData_WSEastSuper_State0 
    db $05,$00,$00 
    dw FXHeader_VariousRooms_State0_839C74 
    dw EnemyPopulations_WSEastSuper_0 
    dw EnemySets_WSEastSuper_0 
    db $C1,$C1 
    dw RoomScrolls_WSEastSuper 
    dw $0000 
    dw $0000 
    dw PLMPopulation_WSEastSuper_State0 
    dw LibBG_WreckedShip_4_5_Panels_Vents_Horizontal 
    dw RTS_8FC8D0 

RoomState_WSEastSuper_1:
    dl LevelData_WSEastSuper_State1 
    db $04,$00,$00 
    dw FXHeader_WSEastSuper_State1 
    dw EnemyPopulations_WSEastSuper_1 
    dw EnemySets_WSEastSuper_1 
    db $C1,$C1 
    dw RoomScrolls_WSEastSuper 
    dw $0000 
    dw $0000 
    dw PLMPopulation_WSEastSuper_State1 
    dw LibBG_WreckedShip_4_5_Panels_Vents 
    dw RTS_8FC8D0 

RoomDoors_WSEastSuper:
    dw Door_WSEastSuper_0 

RoomScrolls_WSEastSuper:
    db $01,$01,$01,$00 

RoomPLM_WSEastSuper_0:
    db $03,$01,$80 

RoomHeader_GravitySuit:
    db $0E,$03,$0A,$0D,$01,$01,$70,$A0,$00 
    dw RoomDoors_GravitySuit 
    dw RoomStateCheck_BossIsDead 
    db $01 
    dw RoomState_GravitySuit_1 
    dw Use_StatePointer_inX 

RoomState_GravitySuit_0:
    dl LevelData_GravitySuit 
    db $05,$00,$00 
    dw FXHeader_VariousRooms_State0_839C74 
    dw EnemyPopulations_GravitySuit_0 
    dw EnemySets_GravitySuit_0 
    db $01,$01 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_GravitySuit_State0_WreckedShipSave_State0 
    dw LibBG_WreckedShip_4_5_Panels_Vents 
    dw RTS_8FC8D0 

RoomState_GravitySuit_1:
    dl LevelData_GravitySuit 
    db $04,$00,$00 
    dw FXHeader_GravitySuit_State1_WreckedShipSave_State1 
    dw EnemyPopulations_GravitySuit_1 
    dw EnemySets_GravitySuit_1 
    db $01,$01 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_GravitySuit_State1 
    dw LibBG_WreckedShip_4_5_Panels_Vents 
    dw RTS_8FC8D0 

RoomDoors_GravitySuit:
    dw Door_GravitySuit_0 
    dw Door_GravitySuit_1 

RoomHeader_WreckedShipSave:
    db $0F,$03,$11,$0E,$01,$01,$70,$A0,$00 
    dw RoomDoors_WreckedShipSave 
    dw RoomStateCheck_BossIsDead 
    db $01 
    dw RoomState_WreckedShipSave_1 
    dw Use_StatePointer_inX 

RoomState_WreckedShipSave_0:
    dl LevelData_SaveStation_LeftSideDoor 
    db $16,$30,$05 
    dw FXHeader_VariousRooms_State0_839C74 
    dw EnemyPopulations_WreckedShipSave_0 
    dw EnemySets_WreckedShipSave_0 
    db $00,$00 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_GravitySuit_State0_WreckedShipSave_State0 
    dw $0000 
    dw $0000 

RoomState_WreckedShipSave_1:
    dl LevelData_SaveStation_LeftSideDoor 
    db $15,$30,$06 
    dw FXHeader_GravitySuit_State1_WreckedShipSave_State1 
    dw EnemyPopulations_WreckedShipSave_1 
    dw EnemySets_WreckedShipSave_1 
    db $00,$00 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_WreckedShipSave_State1 
    dw $0000 
    dw RTS_8FC8D0 

RoomDoors_WreckedShipSave:
    dw Door_WreckedShipSave_0 

RoomHeader_GlassTunnelSave:
    db $00,$04,$0C,$13,$01,$01,$70,$A0,$00 
    dw RoomDoors_GlassTunnelSave 
    dw Use_StatePointer_inX 

RoomState_GlassTunnelSave:
    dl LevelData_SaveStation_LeftSideDoor 
    db $19,$12,$05 
    dw FXHeader_GlassTunnelSave 
    dw EnemyPopulations_GlassTunnelSave 
    dw EnemySets_GlassTunnelSave 
    db $00,$00 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_GlassTunnelSave 
    dw $0000 
    dw RTS_8FC8D1 

RoomDoors_GlassTunnelSave:
    dw Door_GlassTunnelSave_0 

RoomHeader_GlassTunnel:
    db $01,$04,$0B,$11,$01,$03,$70,$A0,$00 
    dw RoomDoors_GlassTunnel 
    dw RoomStateCheck_EventHasBeenSet 
    db $0B 
    dw RoomState_GlassTunnel_1 
    dw Use_StatePointer_inX 

RoomState_GlassTunnel_0:
    dl LevelData_GlassTunnel_State0 
    db $0B,$12,$05 
    dw FXHeader_GlassTunnel_State0_1 
    dw EnemyPopulations_GlassTunnel 
    dw EnemySets_GlassTunnel 
    db $00,$C0 
    dw RoomScrolls_GlassTunnel 
    dw $0000 
    dw $0000 
    dw PLMPopulation_GlassTunnel_State0_1 
    dw $0000 
    dw RTS_8FC8D1 

RoomState_GlassTunnel_1:
    dl LevelData_GlassTunnel_State1 
    db $0B,$12,$05 
    dw FXHeader_GlassTunnel_State0_1 
    dw EnemyPopulations_GlassTunnel 
    dw EnemySets_GlassTunnel 
    db $00,$C0 
    dw RoomScrolls_GlassTunnel 
    dw $0000 
    dw $0000 
    dw PLMPopulation_GlassTunnel_State0_1 
    dw $0000 
    dw RTS_8FC8D1 

RoomDoors_GlassTunnel:
    dw Door_GlassTunnel_0 
    dw Door_GlassTunnel_1 
    dw Door_GlassTunnel_2 
    dw Door_GlassTunnel_3 

RoomScrolls_GlassTunnel:
    db $02,$02,$02 

RoomPLM_GlassTunnel_0_4:
    db $00,$02,$80 

RoomPLM_GlassTunnel_8:
    db $01,$02,$02,$02,$80 

RoomHeader_WestTunnel:
    db $02,$04,$0A,$12,$01,$01,$70,$A0,$00 
    dw RoomDoors_WestTunnel 
    dw Use_StatePointer_inX 

RoomState_WestTunnel:
    dl LevelData_WestTunnel 
    db $0B,$00,$00 
    dw FXHeader_WestTunnel 
    dw EnemyPopulations_WestTunnel 
    dw EnemySets_WestTunnel 
    db $00,$00 
    dw RoomScrolls_WestTunnel 
    dw $0000 
    dw $0000 
    dw PLMPopulation_WestTunnel 
    dw $0000 
    dw RTS_8FC8D1 

RoomDoors_WestTunnel:
    dw Door_WestTunnel_0 
    dw Door_WestTunnel_1 

RoomScrolls_WestTunnel:
    db $01 

RoomHeader_EastTunnel:
    db $03,$04,$0C,$11,$04,$02,$70,$A0,$00 
    dw RoomDoors_EastTunnel 
    dw Use_StatePointer_inX 

RoomState_EastTunnel:
    dl LevelData_EastTunnel 
    db $0B,$12,$05 
    dw FXHeader_EastTunnel 
    dw EnemyPopulations_EastTunnel 
    dw EnemySets_EastTunnel 
    db $00,$00 
    dw RoomScrolls_EastTunnel 
    dw $0000 
    dw $0000 
    dw PLMPopulation_EastTunnel 
    dw $0000 
    dw RTS_8FC8D1 

RoomDoors_EastTunnel:
    dw Door_EastTunnel_0 
    dw Door_EastTunnel_1 
    dw Door_EastTunnel_2 

RoomScrolls_EastTunnel:
    db $01,$01,$01,$01,$00,$00,$00,$00 

RoomPLM_EastTunnel_0:
    db $00,$01,$01,$00,$04,$00,$80 

RoomPLM_EastTunnel_1:
    db $00,$02,$04,$01,$80 

RoomPLM_EastTunnel_2:
    db $00,$00,$04,$01,$80 

RoomPLM_EastTunnel_9:
    db $01,$01,$80 

RoomHeader_MainStreet:
    db $04,$04,$0A,$09,$03,$08,$70,$A0,$00 
    dw RoomDoors_MainStreet 
    dw Use_StatePointer_inX 

RoomState_MainStreet:
    dl LevelData_MainStreet 
    db $0B,$1B,$06 
    dw FXHeader_MainStreet 
    dw EnemyPopulations_MainStreet 
    dw EnemySets_MainStreet 
    db $C0,$C0 
    dw RoomScrolls_MainStreet 
    dw $0000 
    dw $0000 
    dw PLMPopulation_MainStreet 
    dw $0000 
    dw RTS_8FC8D1 

RoomDoors_MainStreet:
    dw Door_MainStreet_0 
    dw Door_MainStreet_1 
    dw Door_MainStreet_2 
    dw Door_MainStreet_3 
    dw Door_MainStreet_4 

RoomScrolls_MainStreet:
    db $02,$02,$00,$02,$02,$00,$02,$02,$01,$02,$02,$00,$02,$02,$00,$02 
    db $02,$00,$02,$02,$02,$02,$02,$00 

RoomPLM_MainStreet_0:
    db $07,$01,$0A,$00,$80 

RoomHeader_FishTank:
    db $05,$04,$0D,$0D,$04,$03,$70,$A0,$00 
    dw RoomDoors_FishTank 
    dw Use_StatePointer_inX 

RoomState_FishTank:
    dl LevelData_FishTank 
    db $0B,$00,$00 
    dw FXHeader_FishTank 
    dw EnemyPopulations_FishTank 
    dw EnemySets_FishTank 
    db $C0,$C0 
    dw RoomScrolls_FishTank 
    dw $0000 
    dw $0000 
    dw PLMPopulation_FishTank 
    dw $0000 
    dw RTS_8FC8D1 

RoomDoors_FishTank:
    dw Door_FishTank_0 
    dw Door_FishTank_1 
    dw Door_FishTank_2 
    dw Door_FishTank_3 

RoomScrolls_FishTank:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$00,$02 

RoomPLM_FishTank_3_7:
    db $0A,$02,$80 

RoomHeader_MamaTurtle:
    db $06,$04,$11,$0C,$03,$04,$70,$A0,$00 
    dw RoomDoors_MamaTurtle 
    dw Use_StatePointer_inX 

RoomState_MamaTurtle:
    dl LevelData_MamaTurtle 
    db $0B,$00,$00 
    dw FXHeader_MamaTurtle 
    dw EnemyPopulations_MamaTurtle 
    dw EnemySets_MamaTurtle 
    db $00,$C0 
    dw RoomScrolls_MamaTurtle 
    dw $0000 
    dw $0000 
    dw PLMPopulation_MamaTurtle 
    dw $0000 
    dw RTS_8FC8D1 

RoomDoors_MamaTurtle:
    dw Door_MamaTurtle_0 

RoomScrolls_MamaTurtle:
    db $00,$02,$02,$00,$02,$02,$00,$02,$02,$02,$02,$02 

RoomHeader_CrabTunnel:
    db $07,$04,$0C,$10,$04,$01,$70,$A0,$00 
    dw RoomDoors_CrabTunnel 
    dw Use_StatePointer_inX 

RoomState_CrabTunnel:
    dl LevelData_CrabTunnel 
    db $0B,$1B,$06 
    dw FXHeader_CrabTunnel 
    dw EnemyPopulations_CrabTunnel 
    dw EnemySets_CrabTunnel 
    db $C1,$C1 
    dw RoomScrolls_CrabTunnel 
    dw $0000 
    dw $0000 
    dw PLMPopulation_CrabTunnel 
    dw LibBG_Maridia_B_BrownWall 
    dw RTS_8FC8D1 

RoomDoors_CrabTunnel:
    dw Door_CrabTunnel_0 
    dw Door_CrabTunnel_1 

RoomScrolls_CrabTunnel:
    db $01,$01,$01,$01 

RoomHeader_MtEverest:
    db $08,$04,$0C,$09,$06,$04,$90,$A0,$00 
    dw RoomDoors_MtEverest 
    dw Use_StatePointer_inX 

RoomState_MtEverest:
    dl LevelData_MtEverest 
    db $0B,$00,$00 
    dw FXHeader_MtEverest 
    dw EnemyPopulations_MtEverest 
    dw EnemySets_MtEverest 
    db $C0,$C0 
    dw RoomScrolls_MtEverest 
    dw $0000 
    dw $0000 
    dw PLMPopulation_MtEverest 
    dw $0000 
    dw RTS_8FC8D1 

RoomDoors_MtEverest:
    dw Door_MtEverest_0 
    dw Door_MtEverest_1 
    dw Door_MtEverest_2 
    dw Door_MtEverest_3 
    dw Door_MtEverest_4 
    dw Door_MtEverest_5 

RoomScrolls_MtEverest:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$00,$02,$02,$02 
    db $02,$00,$00,$02,$02,$02,$02,$00 

RoomHeader_RedFish:
    db $09,$04,$0C,$07,$03,$02,$70,$A0,$00 
    dw RoomDoors_RedFish 
    dw Use_StatePointer_inX 

RoomState_RedFish:
    dl LevelData_RedFish 
    db $0B,$1B,$06 
    dw FXHeader_RedFish 
    dw EnemyPopulations_RedFish 
    dw EnemySets_RedFish 
    db $00,$C0 
    dw RoomScrolls_RedFish 
    dw $0000 
    dw $0000 
    dw PLMPopulation_RedFish 
    dw $0000 
    dw RTS_8FC8D1 

RoomDoors_RedFish:
    dw Door_RedFish_0 
    dw Door_RedFish_1 

RoomScrolls_RedFish:
    db $01,$00,$02,$00,$00,$02 

RoomPLM_RedFish_0:
    db $02,$02,$80 

RoomPLM_RedFish_1:
    db $01,$01,$80 

RoomHeader_WateringHole:
    db $0A,$04,$0C,$04,$02,$03,$70,$A0,$00 
    dw RoomDoors_WateringHole 
    dw Use_StatePointer_inX 

RoomState_WateringHole:
    dl LevelData_WateringHole 
    db $0B,$00,$00 
    dw FXHeader_WateringHole 
    dw EnemyPopulations_WateringHole 
    dw EnemySets_WateringHole 
    db $C0,$00 
    dw RoomScrolls_WateringHole 
    dw $0000 
    dw $0000 
    dw PLMPopulation_WateringHole 
    dw $0000 
    dw RTS_8FC8D1 

RoomDoors_WateringHole:
    dw Door_WateringHole_0 

RoomScrolls_WateringHole:
    db $02,$01,$02,$00,$00,$00 

RoomPLM_WateringHole_0:
    db $04,$01,$80 

RoomHeader_NWestMaridiaBug:
    db $0B,$04,$0E,$04,$04,$02,$70,$A0,$00 
    dw RoomDoors_NWestMaridiaBug 
    dw Use_StatePointer_inX 

RoomState_NWestMaridiaBug:
    dl LevelData_NWestMaridiaBug 
    db $0B,$00,$00 
    dw FXHeader_NWestMaridiaBug 
    dw EnemyPopulations_NWestMaridiaBug 
    dw EnemySets_NWestMaridiaBug 
    db $C0,$00 
    dw RoomScrolls_NWestMaridiaBug 
    dw $0000 
    dw $0000 
    dw PLMPopulation_NWestMaridiaBug 
    dw $0000 
    dw RTS_8FC8D1 

RoomDoors_NWestMaridiaBug:
    dw Door_NWestMaridiaBug_0 
    dw Door_NWestMaridiaBug_1 

RoomScrolls_NWestMaridiaBug:
    db $02,$00,$00,$00,$01,$00,$01,$01 

RoomPLM_NWestMaridiaBug_3_7:
    db $05,$01,$80 

RoomHeader_CrabShaft:
    db $0C,$04,$12,$07,$02,$04,$70,$A0,$00 
    dw RoomDoors_CrabShaft 
    dw Use_StatePointer_inX 

RoomState_CrabShaft:
    dl LevelData_CrabShaft 
    db $0B,$1B,$06 
    dw FXHeader_CrabShaft 
    dw EnemyPopulations_CrabShaft 
    dw EnemySets_CrabShaft 
    db $00,$C0 
    dw RoomScrolls_CrabShaft 
    dw $0000 
    dw $0000 
    dw PLMPopulation_CrabShaft 
    dw $0000 
    dw RTS_8FC8D1 

RoomDoors_CrabShaft:
    dw Door_CrabShaft_0 
    dw Door_CrabShaft_1 
    dw Door_CrabShaft_2 

RoomScrolls_CrabShaft:
    db $02,$00,$02,$00,$01,$00,$00,$01 

RoomPLM_CrabShaft_0:
    db $04,$02,$06,$01,$80 

RoomHeader_PseudoPlasmaSpark:
    db $0D,$04,$12,$04,$04,$03,$70,$A0,$00 
    dw RoomDoors_PseudoPlasmaSpark 
    dw Use_StatePointer_inX 

RoomState_PseudoPlasmaSpark:
    dl LevelData_PseudoPlasmaSpark 
    db $0B,$00,$00 
    dw FXHeader_PseudoPlasmaSpark 
    dw EnemyPopulations_PseudoPlasmaSpark 
    dw EnemySets_PseudoPlasmaSpark 
    db $C0,$00 
    dw RoomScrolls_PseudoPlasmaSpark 
    dw $0000 
    dw $0000 
    dw PLMPopulation_PseudoPlasmaSpark 
    dw $0000 
    dw RTS_8FC8D1 

RoomDoors_PseudoPlasmaSpark:
    dw Door_PseudoPlasmaSpark_0 
    dw Door_PseudoPlasmaSpark_1 
    dw Door_PseudoPlasmaSpark_2 

RoomScrolls_PseudoPlasmaSpark:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$00,$00 

RoomPLM_PseudoPlasmaSpark_3:
    db $0A,$02,$80 

RoomPLM_PseudoPlasmaSpark_7:
    db $0A,$00,$80 

RoomHeader_CrabHole:
    db $0E,$04,$10,$10,$01,$02,$70,$A0,$00 
    dw RoomDoors_CrabHole 
    dw Use_StatePointer_inX 

RoomState_CrabHole:
    dl LevelData_CrabHole 
    db $0B,$1B,$05 
    dw FXHeader_CrabHole 
    dw EnemyPopulations_CrabHole 
    dw EnemySets_CrabHole 
    db $00,$00 
    dw RoomScrolls_CrabHole 
    dw $0000 
    dw $0000 
    dw PLMPopulation_CrabHole 
    dw $0000 
    dw RTS_8FC8D1 

RoomDoors_CrabHole:
    dw Door_CrabHole_0 
    dw Door_CrabHole_1 
    dw Door_CrabHole_2 
    dw Door_CrabHole_3 

RoomScrolls_CrabHole:
    db $01,$00 

RoomPLM_CrabHole_0_1:
    db $00,$02,$01,$01,$80 

RoomHeader_WestSandHallTunnel:
    db $0F,$04,$11,$10,$01,$01,$70,$A0,$00 
    dw RoomDoors_WestSandHallTunnel 
    dw Use_StatePointer_inX 

RoomState_WestSandHallTunnel:
    dl LevelData_WestSandHallTunnel 
    db $0B,$00,$00 
    dw FXHeader_WestSandHallTunnel 
    dw EnemyPopulations_WestSandHallTunnel 
    dw EnemySets_WestSandHallTunnel 
    db $C0,$00 
    dw RoomScrolls_WestSandHallTunnel 
    dw $0000 
    dw $0000 
    dw PLMPopulation_WestSandHallTunnel 
    dw $0000 
    dw RTS_8FC8D1 

RoomDoors_WestSandHallTunnel:
    dw Door_WestSandHallTunnel_0 
    dw Door_WestSandHallTunnel_1 

RoomScrolls_WestSandHallTunnel:
    db $01 

RoomHeader_PlasmaTutorial:
    db $10,$04,$1A,$00,$01,$01,$70,$A0,$00 
    dw RoomDoors_PlasmaTutorial 
    dw Use_StatePointer_inX 

RoomState_PlasmaTutorial:
    dl LevelData_PlasmaTutorial 
    db $0B,$00,$00 
    dw FXHeader_PlasmaTutorial 
    dw EnemyPopulations_PlasmaTutorial 
    dw EnemySets_PlasmaTutorial 
    db $00,$00 
    dw RoomScrolls_PlasmaTutorial 
    dw $0000 
    dw $0000 
    dw PLMPopulation_PlasmaTutorial 
    dw $0000 
    dw RTS_8FC8D1 

RoomDoors_PlasmaTutorial:
    dw Door_PlasmaTutorial_0 
    dw Door_PlasmaTutorial_1 

RoomScrolls_PlasmaTutorial:
    db $01 

RoomHeader_Plasma:
    db $11,$04,$1B,$00,$02,$03,$70,$A0,$00 
    dw RoomDoors_Plasma 
    dw Use_StatePointer_inX 

RoomState_Plasma:
    dl LevelData_Plasma 
    db $0B,$00,$00 
    dw FXHeader_Plasma 
    dw EnemyPopulations_Plasma 
    dw EnemySets_Plasma 
    db $C0,$00 
    dw RoomScrolls_Plasma 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Plasma 
    dw $0000 
    dw RTS_8FC8D1 

RoomDoors_Plasma:
    dw Door_Plasma_0 

RoomScrolls_Plasma:
    db $02,$02,$02,$02,$01,$01 

RoomHeader_ThreadTheNeedle:
    db $12,$04,$1B,$05,$07,$01,$70,$A0,$00 
    dw RoomDoors_ThreadTheNeedle 
    dw Use_StatePointer_inX 

RoomState_ThreadTheNeedle:
    dl LevelData_ThreadTheNeedle 
    db $0B,$00,$00 
    dw FXHeader_ThreadTheNeedle 
    dw EnemyPopulations_ThreadTheNeedle 
    dw EnemySets_ThreadTheNeedle 
    db $C0,$00 
    dw RoomScrolls_ThreadTheNeedle 
    dw $0000 
    dw $0000 
    dw PLMPopulation_ThreadTheNeedle 
    dw $0000 
    dw RTS_8FC8D1 

RoomDoors_ThreadTheNeedle:
    dw Door_ThreadTheNeedle_0 
    dw Door_ThreadTheNeedle_1 

RoomScrolls_ThreadTheNeedle:
    db $01,$01,$01,$01,$01,$01,$01 

RoomHeader_MaridiaElev:
    db $13,$04,$22,$00,$01,$06,$70,$A0,$00 
    dw RoomDoors_MaridiaElev 
    dw Use_StatePointer_inX 

RoomState_MaridiaElev:
    dl LevelData_MaridiaElev 
    db $0B,$1B,$05 
    dw FXHeader_MaridiaElev 
    dw EnemyPopulations_MaridiaElev 
    dw EnemySets_MaridiaElev 
    db $00,$C0 
    dw RoomScrolls_MaridiaElev 
    dw $0000 
    dw $0000 
    dw PLMPopulation_MaridiaElev 
    dw $0000 
    dw RTS_8FC8D1 

RoomDoors_MaridiaElev:
    dw Door_MaridiaElev_0 
    dw Door_MaridiaElev_1 
    dw Door_MaridiaElev_2 
    dw Door_MaridiaElev_3_TourianFirst_2 

RoomScrolls_MaridiaElev:
    db $02,$02,$02,$02,$02,$01 

RoomHeader_PlasmaSpark:
    db $14,$04,$16,$02,$04,$06,$70,$A0,$00 
    dw RoomDoors_PlasmaSpark 
    dw Use_StatePointer_inX 

RoomState_PlasmaSpark:
    dl LevelData_PlasmaSpark 
    db $0B,$00,$05 
    dw FXHeader_PlasmaSpark 
    dw EnemyPopulations_PlasmaSpark 
    dw EnemySets_PlasmaSpark 
    db $E0,$00 
    dw RoomScrolls_PlasmaSpark 
    dw $0000 
    dw $0000 
    dw PLMPopulation_PlasmaSpark 
    dw $0000 
    dw RTS_8FC8D1 

RoomDoors_PlasmaSpark:
    dw Door_PlasmaSpark_0 
    dw Door_PlasmaSpark_1 
    dw Door_PlasmaSpark_2 
    dw Door_PlasmaSpark_3 

RoomScrolls_PlasmaSpark:
    db $00,$02,$02,$00,$00,$02,$02,$00,$02,$02,$02,$02,$00,$02,$02,$02 
    db $00,$02,$02,$02,$00,$01,$01,$01 

RoomHeader_Kassiuz:
    db $15,$04,$19,$00,$01,$04,$70,$A0,$00 
    dw RoomDoors_Kassiuz 
    dw Use_StatePointer_inX 

RoomState_Kassiuz:
    dl LevelData_Kassiuz 
    db $0B,$00,$05 
    dw FXHeader_Kassiuz 
    dw EnemyPopulations_Kassiuz 
    dw EnemySets_Kassiuz 
    db $00,$C0 
    dw RoomScrolls_Kassiuz 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Kassiuz 
    dw $0000 
    dw RTS_8FC8D1 

RoomDoors_Kassiuz:
    dw Door_Kassiuz_0 
    dw Door_Kassiuz_1 

RoomScrolls_Kassiuz:
    db $02,$02,$02,$02 

RoomHeader_MaridiaMap:
    db $16,$04,$11,$11,$01,$01,$70,$A0,$00 
    dw RoomDoors_MaridiaMap 
    dw Use_StatePointer_inX 

RoomState_MaridiaMap:
    dl LevelData_MapStation_LeftSideDoor 
    db $15,$00,$00 
    dw FXHeader_MaridiaMap 
    dw EnemyPopulations_MaridiaMap 
    dw EnemySets_MaridiaMap 
    db $00,$00 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_MaridiaMap 
    dw $0000 
    dw RTS_8FC8D1 

RoomDoors_MaridiaMap:
    dw Door_MaridiaMap_0 

RoomHeader_ForgottenHighwaySave:
    db $17,$04,$23,$04,$01,$01,$70,$A0,$00 
    dw RoomDoors_ForgottenHighwaySave 
    dw Use_StatePointer_inX 

RoomState_ForgottenHighwaySave:
    dl LevelData_SaveStation_LeftSideDoor 
    db $19,$1B,$05 
    dw FXHeader_ForgottenHighwaySave 
    dw EnemyPopulations_ForgottenHighwaySave 
    dw EnemySets_ForgottenHighwaySave 
    db $00,$00 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_ForgottenHighwaySave 
    dw $0000 
    dw $0000 

RoomDoors_ForgottenHighwaySave:
    dw Door_ForgottenHighwaySave_0 

RoomHeader_Toilet:
    db $18,$04,$16,$05,$01,$0A,$70,$A0,$00 
    dw RoomDoors_Toilet 
    dw Use_StatePointer_inX 

RoomState_Toilet:
    dl LevelData_Toilet 
    db $0C,$00,$00 
    dw FXHeader_Toilet 
    dw EnemyPopulations_Toilet 
    dw EnemySets_Toilet 
    db $00,$00 
    dw $0001 
    dw $0000 
    dw MainASM_Elevatube 
    dw PLMPopulation_Toilet 
    dw $0000 
    dw RTS_8FC8D2 

RoomDoors_Toilet:
    dw Door_Toilet_0 
    dw Door_Toilet_1 

RoomHeader_BugSandHole:
    db $19,$04,$1A,$05,$01,$01,$70,$A0,$00 
    dw RoomDoors_BugSandHole 
    dw Use_StatePointer_inX 

RoomState_BugSandHole:
    dl LevelData_BugSandHole 
    db $0C,$00,$00 
    dw FXHeader_BugSandHole 
    dw EnemyPopulations_BugSandHole 
    dw EnemySets_BugSandHole 
    db $00,$00 
    dw RoomScrolls_BugSandHole 
    dw $0000 
    dw $0000 
    dw PLMPopulation_BugSandHole 
    dw $0000 
    dw RTS_8FC8D2 

RoomDoors_BugSandHole:
    dw Door_BugSandHole_0 
    dw Door_BugSandHole_1 
    dw Door_BugSandHole_2 

RoomScrolls_BugSandHole:
    db $02 

RoomHeader_WestSandHall:
    db $1A,$04,$12,$10,$04,$01,$70,$A0,$00 
    dw RoomDoors_WestSandHall 
    dw Use_StatePointer_inX 

RoomState_WestSandHall:
    dl LevelData_WestSandHall 
    db $0C,$00,$00 
    dw FXHeader_WestSandHall 
    dw EnemyPopulations_WestSandHall 
    dw EnemySets_WestSandHall 
    db $C1,$01 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_WestSandHall 
    dw LibBG_Maridia_C_GreenWall 
    dw RTS_8FC8D2 

RoomDoors_WestSandHall:
    dw Door_WestSandHall_0 
    dw Door_WestSandHall_1 
    dw UNUSED_Door_WestSandHall_2_83A654 

RoomHeader_Oasis:
    db $1B,$04,$16,$0F,$01,$02,$70,$A0,$00 
    dw RoomDoors_Oasis 
    dw Use_StatePointer_inX 

RoomState_Oasis:
    dl LevelData_Oasis 
    db $0C,$00,$00 
    dw FXHeader_Oasis 
    dw EnemyPopulations_Oasis 
    dw EnemySets_Oasis 
    db $00,$C0 
    dw RoomScrolls_Oasis 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Oasis 
    dw $0000 
    dw RTS_8FC8D2 

RoomDoors_Oasis:
    dw Door_Oasis_0 
    dw Door_Oasis_1 
    dw Door_Oasis_2 

RoomScrolls_Oasis:
    db $00,$01 

RoomPLM_Oasis_0:
    db $00,$02,$01,$02,$80 

RoomHeader_EastSandHall:
    db $1C,$04,$17,$10,$03,$01,$70,$A0,$00 
    dw RoomDoors_EastSandHall 
    dw Use_StatePointer_inX 

RoomState_EastSandHall:
    dl LevelData_EastSandHall 
    db $0C,$00,$00 
    dw FXHeader_EastSandHall 
    dw EnemyPopulations_EastSandHall 
    dw EnemySets_EastSandHall 
    db $C1,$01 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_EastSandHall 
    dw LibBG_Maridia_C_GreenWall 
    dw RTS_8FC8D2 

RoomDoors_EastSandHall:
    dw Door_EastSandHall_0 
    dw Door_EastSandHall_1 
    dw UNUSED_Door_EastSandHall_2_83A69C 

RoomHeader_WestSandHole:
    db $1D,$04,$14,$0E,$02,$02,$70,$A0,$00 
    dw RoomDoors_WestSandHole 
    dw Use_StatePointer_inX 

RoomState_WestSandHole:
    dl LevelData_WestSandHole 
    db $0C,$00,$00 
    dw FXHeader_WestSandHole 
    dw EnemyPopulations_WestSandHole 
    dw EnemySets_WestSandHole 
    db $00,$00 
    dw RoomScrolls_WestSandHole 
    dw $0000 
    dw $0000 
    dw PLMPopulation_WestSandHole 
    dw $0000 
    dw RTS_8FC8D2 

RoomDoors_WestSandHole:
    dw Door_WestSandHole_0 
    dw Door_WestSandHole_1 

RoomScrolls_WestSandHole:
    db $02,$02,$02,$02 

RoomHeader_EastSandHole:
    db $1E,$04,$17,$0E,$02,$02,$70,$A0,$00 
    dw RoomDoors_EastSandHole 
    dw Use_StatePointer_inX 

RoomState_EastSandHole:
    dl LevelData_EastSandHole 
    db $0C,$00,$00 
    dw FXHeader_EastSandHole 
    dw EnemyPopulations_EastSandHole 
    dw EnemySets_EastSandHole 
    db $00,$00 
    dw RoomScrolls_EastSandHole 
    dw $0000 
    dw $0000 
    dw PLMPopulation_EastSandHole 
    dw $0000 
    dw RTS_8FC8D2 

RoomDoors_EastSandHole:
    dw Door_EastSandHole_0 
    dw Door_EastSandHole_1 

RoomScrolls_EastSandHole:
    db $02,$02,$02,$02 

RoomHeader_WestAqueductQuicksand:
    db $1F,$04,$15,$0C,$01,$02,$70,$A0,$00 
    dw RoomDoors_WestAqueductQuicksand 
    dw Use_StatePointer_inX 

RoomState_WestAqueductQuicksand:
    dl LevelData_WestAqueductQuicksand 
    db $0C,$00,$00 
    dw FXHeader_EastAqueductQuicksand_WestAqueductQuicksand 
    dw EnemyPopulations_WestAqueductQuicksand 
    dw EnemySets_WestAqueductQuicksand 
    db $00,$00 
    dw RoomScrolls_WestAqueductQuicksand 
    dw $0000 
    dw $0000 
    dw PLMPopulation_WestAqueductQuicksand 
    dw $0000 
    dw RTS_8FC8D2 

RoomDoors_WestAqueductQuicksand:
    dw Door_WestAqueductQuicksand_0 
    dw Door_WestAqueductQuicksand_1 

RoomScrolls_WestAqueductQuicksand:
    db $02,$02 

RoomHeader_EastAqueductQuicksand:
    db $20,$04,$17,$0C,$01,$02,$70,$A0,$00 
    dw RoomDoors_EastAqueductQuicksand 
    dw Use_StatePointer_inX 

RoomState_EastAqueductQuicksand:
    dl LevelData_EastAqueductQuicksand 
    db $0C,$00,$00 
    dw FXHeader_EastAqueductQuicksand_WestAqueductQuicksand 
    dw EnemyPopulations_EastAqueductQuicksand 
    dw EnemySets_EastAqueductQuicksand 
    db $00,$00 
    dw RoomScrolls_EastAqueductQuicksand 
    dw $0000 
    dw $0000 
    dw PLMPopulation_EastAqueductQuicksand 
    dw $0000 
    dw RTS_8FC8D2 

RoomDoors_EastAqueductQuicksand:
    dw Door_EastAqueductQuicksand_0 
    dw Door_EastAqueductQuicksand_1 

RoomScrolls_EastAqueductQuicksand:
    db $02,$02 

RoomHeader_Aqueduct:
    db $21,$04,$14,$09,$06,$03,$90,$A0,$00 
    dw RoomDoors_Aqueduct 
    dw Use_StatePointer_inX 

RoomState_Aqueduct:
    dl LevelData_Aqueduct 
    db $0C,$1B,$05 
    dw FXHeader_Aqueduct 
    dw EnemyPopulations_Aqueduct 
    dw EnemySets_Aqueduct 
    db $C0,$00 
    dw RoomScrolls_Aqueduct 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Aqueduct 
    dw $0000 
    dw RTS_8FC8D2 

RoomDoors_Aqueduct:
    dw Door_Aqueduct_0 
    dw Door_Aqueduct_1 
    dw Door_Aqueduct_2 
    dw Door_Aqueduct_3 
    dw Door_Aqueduct_4 
    dw Door_Aqueduct_5 

RoomScrolls_Aqueduct:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02 
    db $02,$02 

RoomHeader_Butterfly:
    db $22,$04,$1A,$07,$01,$01,$70,$A0,$00 
    dw RoomDoors_Butterfly 
    dw Use_StatePointer_inX 

RoomState_Butterfly:
    dl LevelData_Butterfly 
    db $0C,$00,$00 
    dw FXHeader_Butterfly 
    dw EnemyPopulations_Butterfly 
    dw EnemySets_Butterfly 
    db $C0,$00 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Butterfly 
    dw $0000 
    dw RTS_8FC8D2 

RoomDoors_Butterfly:
    dw Door_Butterfly_0 
    dw Door_Butterfly_1 

RoomHeader_BotwoonHallway:
    db $23,$04,$14,$08,$04,$01,$70,$A0,$00 
    dw RoomDoors_BotwoonHallway 
    dw Use_StatePointer_inX 

RoomState_BotwoonHallway:
    dl LevelData_BotwoonHallway 
    db $0C,$1B,$05 
    dw FXHeader_BotwoonHallway 
    dw EnemyPopulations_BotwoonHallway 
    dw EnemySets_BotwoonHallway 
    db $C0,$00 
    dw RoomScrolls_BotwoonHallway 
    dw $0000 
    dw $0000 
    dw PLMPopulation_BotwoonHallway 
    dw $0000 
    dw RTS_8FC8D2 

RoomDoors_BotwoonHallway:
    dw Door_BotwoonHallway_0 
    dw Door_BotwoonHallway_1 

RoomScrolls_BotwoonHallway:
    db $02,$02,$02,$02 

RoomHeader_Pants:
    db $24,$04,$1A,$0D,$02,$04,$70,$A0,$00 
    dw RoomDoors_Pants 
    dw Use_StatePointer_inX 

RoomState_Pants:
    dl LevelData_Pants 
    db $0C,$00,$00 
    dw FXHeader_Pants 
    dw EnemyPopulations_Pants 
    dw EnemySets_Pants 
    db $00,$C0 
    dw RoomScrolls_Pants 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Pants 
    dw $0000 
    dw RTS_8FC8D2 

RoomDoors_Pants:
    dw Door_Pants_0 
    dw Door_Pants_1 
    dw Door_Pants_2 
    dw Door_Pants_3 

RoomScrolls_Pants:
    db $02,$02,$02,$02,$02,$01,$01,$00 

RoomPLM_Pants_0_4:
    db $02,$02,$03,$00,$04,$02,$05,$00,$06,$01,$07,$00,$80 

RoomPLM_Pants_D:
    db $02,$00,$03,$02,$04,$00,$05,$01,$06,$00,$80 

RoomPLM_Pants_15:
    db $05,$02,$07,$01,$80 

RoomHeader_EastPants:
    db $25,$04,$1B,$0E,$01,$03,$70,$A0,$00 
    dw RoomDoors_EastPants 
    dw Use_StatePointer_inX 

RoomState_EastPants:
    dl LevelData_EastPants 
    db $0C,$00,$00 
    dw FXHeader_EastPants 
    dw EnemyPopulations_EastPants 
    dw EnemySets_EastPants 
    db $00,$C0 
    dw RoomScrolls_EastPants 
    dw $0000 
    dw $0000 
    dw PLMPopulation_EastPants 
    dw $0000 
    dw RTS_8FC8D2 

RoomDoors_EastPants:
    dw Door_EastPants_0 
    dw Door_EastPants_1 

RoomScrolls_EastPants:
    db $02,$00,$01 

RoomPLM_EastPants_0:
    db $01,$02,$80 

RoomPLM_EastPants_6:
    db $01,$02,$02,$01,$80 

RoomHeader_Springball:
    db $26,$04,$20,$0F,$02,$02,$70,$A0,$00 
    dw RoomDoors_Springball 
    dw Use_StatePointer_inX 

RoomState_Springball:
    dl LevelData_Springball 
    db $0C,$00,$00 
    dw FXHeader_Springball 
    dw EnemyPopulations_Springball 
    dw EnemySets_Springball 
    db $C0,$00 
    dw RoomScrolls_Springball 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Springball 
    dw $0000 
    dw RTS_8FC8D2 

RoomDoors_Springball:
    dw Door_Springball_0 

RoomScrolls_Springball:
    db $02,$00,$01,$01 

RoomHeader_BelowBotwoonETank:
    db $27,$04,$1A,$0A,$04,$01,$70,$A0,$00 
    dw RoomDoors_BelowBotwoonETank 
    dw Use_StatePointer_inX 

RoomState_BelowBotwoonETank:
    dl LevelData_BelowBotwoonETank 
    db $0C,$00,$00 
    dw FXHeader_BelowBotwoonETank 
    dw EnemyPopulations_BelowBotwoonETank 
    dw EnemySets_BelowBotwoonETank 
    db $00,$00 
    dw RoomScrolls_BelowBotwoonETank 
    dw $0000 
    dw $0000 
    dw PLMPopulation_BelowBotwoonETank 
    dw $0000 
    dw RTS_8FC8D2 

RoomDoors_BelowBotwoonETank:
    dw Door_BelowBotwoonETank_0 

RoomScrolls_BelowBotwoonETank:
    db $01,$01,$01,$01 

RoomHeader_Colosseum:
    db $28,$04,$22,$06,$07,$02,$90,$A0,$00 
    dw RoomDoors_Colosseum 
    dw Use_StatePointer_inX 

RoomState_Colosseum:
    dl LevelData_Colosseum 
    db $0C,$00,$00 
    dw FXHeader_Colosseum 
    dw EnemyPopulations_Colosseum 
    dw EnemySets_Colosseum 
    db $00,$00 
    dw RoomScrolls_Colosseum 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Colosseum 
    dw $0000 
    dw RTS_8FC8D2 

RoomDoors_Colosseum:
    dw Door_Colosseum_0 
    dw Door_Colosseum_1 
    dw Door_Colosseum_2 

RoomScrolls_Colosseum:
    db $02,$02,$02,$02,$02,$02,$02,$01,$01,$01,$01,$01,$01,$01 

RoomHeader_AqueductSave:
    db $29,$04,$13,$0B,$01,$01,$70,$A0,$00 
    dw RoomDoors_AqueductSave 
    dw Use_StatePointer_inX 

RoomState_AqueductSave:
    dl LevelData_SaveStation_RightSideDoor 
    db $19,$1B,$05 
    dw FXHeader_AqueductSave 
    dw EnemyPopulations_AqueductSave 
    dw EnemySets_AqueductSave 
    db $00,$00 
    dw RoomScrolls_AqueductSave 
    dw $0000 
    dw $0000 
    dw PLMPopulation_AqueductSave 
    dw $0000 
    dw RTS_8FC8D2 

RoomDoors_AqueductSave:
    dw Door_AqueductSave_0 

RoomScrolls_AqueductSave:
    db $01 

RoomHeader_ThePrecious:
    db $2A,$04,$29,$07,$02,$03,$90,$A0,$00 
    dw RoomDoors_ThePrecious 
    dw RoomStateCheck_BossIsDead 
    db $01 
    dw RoomState_ThePrecious_1 
    dw Use_StatePointer_inX 

RoomState_ThePrecious_0:
    dl LevelData_ThePrecious ; _0
    db $0C,$00,$00 
    dw FXHeader_ThePrecious_State0_1 
    dw EnemyPopulations_ThePrecious 
    dw EnemySets_ThePrecious 
    db $00,$C0 
    dw RoomScrolls_ThePrecious 
    dw $0000 
    dw $0000 
    dw PLMPopulation_ThePrecious_State0_1 
    dw $0000 
    dw RTS_8FC8D2 

RoomState_ThePrecious_1:
    dl LevelData_ThePrecious 
    db $0C,$1B,$05 
    dw FXHeader_ThePrecious_State0_1 
    dw EnemyPopulations_ThePrecious 
    dw EnemySets_ThePrecious 
    db $00,$C0 
    dw RoomScrolls_ThePrecious 
    dw $0000 
    dw $0000 
    dw PLMPopulation_ThePrecious_State0_1 
    dw $0000 
    dw RTS_8FC8D2 

RoomDoors_ThePrecious:
    dw Door_ThePrecious_0 
    dw Door_ThePrecious_1 

RoomScrolls_ThePrecious:
    db $01,$01,$00,$00,$01,$00 

RoomPLM_ThePrecious_0:
    db $00,$02,$02,$02,$80 

RoomHeader_BotwoonETank:
    db $2B,$04,$1A,$08,$07,$01,$70,$A0,$00 
    dw RoomDoors_BotwoonETank 
    dw Use_StatePointer_inX 

RoomState_BotwoonETank:
    dl LevelData_BotwoonETank 
    db $0C,$1B,$05 
    dw FXHeader_BotwoonETank 
    dw EnemyPopulations_BotwoonETank 
    dw EnemySets_BotwoonETank 
    db $C0,$00 
    dw RoomScrolls_BotwoonETank 
    dw $0000 
    dw $0000 
    dw PLMPopulation_BotwoonETank 
    dw $0000 
    dw RTS_8FC8D2 

RoomDoors_BotwoonETank:
    dw Door_BotwoonETank_0 
    dw Door_BotwoonETank_1 
    dw Door_BotwoonETank_2 
    dw Door_BotwoonETank_3 

RoomScrolls_BotwoonETank:
    db $02,$02,$02,$02,$02,$02,$02 

RoomHeader_DraygonSave:
    db $2C,$04,$29,$06,$01,$01,$70,$A0,$00 
    dw RoomDoors_DraygonSave 
    dw Use_StatePointer_inX 

RoomState_DraygonSave:
    dl LevelData_SaveStation_BothDoors 
    db $19,$1B,$05 
    dw FXHeader_DraygonSave 
    dw EnemyPopulations_DraygonSave 
    dw EnemySets_DraygonSave 
    db $00,$00 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_DraygonSave 
    dw $0000 
    dw RTS_8FC8D2 

RoomDoors_DraygonSave:
    dw Door_DraygonSave_0 
    dw Door_DraygonSave_1 

RoomHeader_MaridiaMissileRefill:
    db $2D,$04,$26,$08,$01,$01,$70,$A0,$00 
    dw RoomDoors_MaridiaMissileRefill 
    dw Use_StatePointer_inX 

RoomState_MaridiaMissileRefill:
    dl LevelData_MissileRefill_LeftSideDoor 
    db $17,$00,$00 
    dw FXHeader_MaridiaMissileRefill 
    dw EnemyPopulations_MaridiaMissileRefill 
    dw EnemySets_MaridiaMissileRefill 
    db $00,$00 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMPopulation_MaridiaMissileRefill 
    dw $0000 
    dw RTS_8FC8D2 

RoomDoors_MaridiaMissileRefill:
    dw Door_MaridiaMissileRefill_0 

RoomHeader_PlasmaBeachQuicksand:
    db $2E,$04,$1A,$06,$01,$01,$70,$A0,$00 
    dw RoomDoors_PlasmaBeachQuicksand 
    dw Use_StatePointer_inX 

RoomState_PlasmaBeachQuicksand:
    dl LevelData_PlasmaBeachQuicksand 
    db $0C,$00,$00 
    dw FXHeader_PlasmaBeachQuicksand_BotwoonQuicksand 
    dw EnemyPopulations_PlasmaBeachQuicksand 
    dw EnemySets_PlasmaBeachQuicksand 
    db $00,$00 
    dw RoomScrolls_PlasmaBeachQuicksand 
    dw $0000 
    dw $0000 
    dw PLMPopulation_PlasmaBeachQuicksand 
    dw $0000 
    dw RTS_8FC8D2 

RoomDoors_PlasmaBeachQuicksand:
    dw Door_PlasmaBeachQuicksand_0 

RoomScrolls_PlasmaBeachQuicksand:
    db $02 

RoomHeader_BotwoonQuicksand:
    db $2F,$04,$1C,$09,$02,$01,$70,$A0,$00 
    dw RoomDoors_BotwoonQuicksand 
    dw Use_StatePointer_inX 

RoomState_BotwoonQuicksand:
    dl LevelData_BotwoonQuicksand 
    db $0C,$00,$00 
    dw FXHeader_PlasmaBeachQuicksand_BotwoonQuicksand 
    dw EnemyPopulations_BotwoonQuicksand 
    dw EnemySets_BotwoonQuicksand 
    db $00,$00 
    dw RoomScrolls_BotwoonQuicksand 
    dw $0000 
    dw $0000 
    dw PLMPopulation_BotwoonQuicksand 
    dw $0000 
    dw RTS_8FC8D2 

RoomDoors_BotwoonQuicksand:
    dw Door_BotwoonQuicksand_0 
    dw Door_BotwoonQuicksand_1 

RoomScrolls_BotwoonQuicksand:
    db $02,$02 

RoomHeader_Shaktool:
    db $30,$04,$1C,$0F,$04,$01,$70,$A0,$00 
    dw RoomDoors_Shaktool 
    dw RoomStateCheck_EventHasBeenSet 
    db $0D 
    dw RoomState_Shaktool_1 
    dw Use_StatePointer_inX 

RoomState_Shaktool_0:
    dl LevelData_Shaktool_State0 
    db $0C,$00,$00 
    dw FXHeader_Shaktool_State0_1 
    dw EnemyPopulations_Shaktool 
    dw EnemySets_Shaktool 
    db $C0,$00 
    dw RoomScrolls_Shaktool 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Shaktool_State0_1 
    dw $0000 
    dw SetupASM_SetupShaktoolsRoomPLM 

RoomState_Shaktool_1:
    dl LevelData_Shaktool_State1 
    db $0C,$00,$00 
    dw FXHeader_Shaktool_State0_1 
    dw EnemyPopulations_Shaktool 
    dw EnemySets_Shaktool 
    db $C0,$00 
    dw RoomScrolls_Shaktool 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Shaktool_State0_1 
    dw $0000 
    dw RTS_8FC8DC 

RoomDoors_Shaktool:
    dw Door_Shaktool_0 
    dw Door_Shaktool_1 

RoomScrolls_Shaktool:
    db $01,$01,$01,$01 

RoomHeader_HalfieClimb:
    db $31,$04,$21,$06,$05,$03,$70,$A0,$00 
    dw RoomDoors_HalfieClimb 
    dw Use_StatePointer_inX 

RoomState_HalfieClimb:
    dl LevelData_HalfieClimb 
    db $0C,$00,$00 
    dw FXHeader_HalfieClimb 
    dw EnemyPopulations_HalfieClimb 
    dw EnemySets_HalfieClimb 
    db $00,$00 
    dw RoomScrolls_HalfieClimb 
    dw $0000 
    dw $0000 
    dw PLMPopulation_HalfieClimb 
    dw $0000 
    dw RTS_8FC8DC 

RoomDoors_HalfieClimb:
    dw Door_HalfieClimb_0 
    dw Door_HalfieClimb_1 
    dw Door_HalfieClimb_2 
    dw Door_HalfieClimb_3 

RoomScrolls_HalfieClimb:
    db $02,$00,$00,$00,$00,$02,$00,$00,$00,$00,$01,$00,$01,$01,$01 

RoomPLM_HalfieClimb_0:
    db $05,$00,$0B,$01,$80 

RoomPLM_HalfieClimb_1:
    db $05,$01,$0B,$00,$80 

RoomPLM_HalfieClimb_5:
    db $0A,$01,$80 

RoomHeader_Botwoon:
    db $32,$04,$18,$08,$02,$01,$70,$A0,$00 
    dw RoomDoors_Botwoon 
    dw RoomStateCheck_BossIsDead 
    db $02 
    dw RoomState_Botwoon_1 
    dw Use_StatePointer_inX 

RoomState_Botwoon_0:
    dl LevelData_Botwoon 
    db $0C,$2A,$05 
    dw FXHeader_Botwoon_State0_1 
    dw EnemyPopulations_Botwoon 
    dw EnemySets_Botwoon 
    db $00,$00 
    dw RoomScrolls_Botwoon 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Botwoon_State0_1 
    dw $0000 
    dw RTS_8FC8DC 

RoomState_Botwoon_1:
    dl LevelData_Botwoon 
    db $0C,$00,$03 
    dw FXHeader_Botwoon_State0_1 
    dw EnemyPopulations_Botwoon 
    dw EnemySets_Botwoon 
    db $00,$00 
    dw RoomScrolls_Botwoon 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Botwoon_State0_1 
    dw $0000 
    dw RTS_8FC8DC 

RoomDoors_Botwoon:
    dw Door_Botwoon_0 
    dw Door_Botwoon_1 

RoomScrolls_Botwoon:
    db $01,$00 

RoomHeader_SpaceJump:
    db $33,$04,$26,$0A,$01,$01,$70,$A0,$00 
    dw RoomDoors_SpaceJump 
    dw Use_StatePointer_inX 

RoomState_SpaceJump:
    dl LevelData_SpaceJump 
    db $0C,$00,$03 
    dw FXHeader_SpaceJump 
    dw EnemyPopulations_SpaceJump 
    dw EnemySets_SpaceJump 
    db $00,$00 
    dw RoomScrolls_SpaceJump 
    dw $0000 
    dw $0000 
    dw PLMPopulation_SpaceJump 
    dw $0000 
    dw RTS_8FC8DC 

RoomDoors_SpaceJump:
    dw Door_SpaceJump_0 

RoomScrolls_SpaceJump:
    db $01 

RoomHeader_MaridiaEnergyRefill:
    db $34,$04,$2A,$06,$01,$01,$70,$A0,$00 
    dw RoomDoors_MaridiaEnergyRefill 
    dw Use_StatePointer_inX 

RoomState_MaridiaEnergyRefill:
    dl LevelData_EnergyRefill_LeftSideDoor 
    db $17,$00,$00 
    dw FXHeader_MaridiaEnergyRefill 
    dw EnemyPopulations_MaridiaEnergyRefill 
    dw EnemySets_MaridiaEnergyRefill 
    db $00,$00 
    dw RoomScrolls_MaridiaEnergyRefill 
    dw $0000 
    dw $0000 
    dw PLMPopulation_MaridiaEnergyRefill 
    dw $0000 
    dw $0000 

RoomDoors_MaridiaEnergyRefill:
    dw Door_MaridiaEnergyRefill_0 

RoomScrolls_MaridiaEnergyRefill:
    db $01 

RoomHeader_WestCactusAlley:
    db $35,$04,$1B,$06,$01,$02,$70,$A0,$00 
    dw RoomDoors_WestCactusAlley 
    dw Use_StatePointer_inX 

RoomState_WestCactusAlley:
    dl LevelData_WestCactusAlley 
    db $0C,$00,$00 
    dw FXHeader_WestCactusAlley 
    dw EnemyPopulations_WestCactusAlley 
    dw EnemySets_WestCactusAlley 
    db $00,$C0 
    dw RoomScrolls_WestCactusAlley 
    dw $0000 
    dw $0000 
    dw PLMPopulation_WestCactusAlley 
    dw $0000 
    dw $0000 

RoomDoors_WestCactusAlley:
    dw Door_WestCactusAlley_0 
    dw Door_WestCactusAlley_1 

RoomScrolls_WestCactusAlley:
    db $02,$01 

RoomHeader_EastCactusAlley:
    db $36,$04,$1C,$06,$05,$02,$70,$A0,$00 
    dw RoomDoors_EastCactusAlley 
    dw Use_StatePointer_inX 

RoomState_EastCactusAlley:
    dl LevelData_EastCactusAlley 
    db $0C,$00,$00 
    dw FXHeader_EastCactusAlley 
    dw EnemyPopulations_EastCactusAlley 
    dw EnemySets_EastCactusAlley 
    db $00,$00 
    dw RoomScrolls_EastCactusAlley 
    dw $0000 
    dw $0000 
    dw PLMPopulation_EastCactusAlley 
    dw $0000 
    dw $0000 

RoomDoors_EastCactusAlley:
    dw Door_EastCactusAlley_0 
    dw Door_EastCactusAlley_1 

RoomScrolls_EastCactusAlley:
    db $02,$02,$02,$02,$02,$01,$01,$01,$01,$01 

RoomHeader_Draygon:
    db $37,$04,$27,$09,$02,$02,$70,$A0,$01 
    dw RoomDoors_Draygon 
    dw RoomStateCheck_BossIsDead 
    db $01 
    dw RoomState_Draygon_1 
    dw Use_StatePointer_inX 

RoomState_Draygon_0:
    dl LevelData_Draygon 
    db $1C,$24,$05 
    dw FXHeader_Draygon_State0_1 
    dw EnemyPopulations_Draygon_0 
    dw EnemySets_Draygon_0 
    db $01,$01 
    dw RoomScrolls_Draygon 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Draygon_State0_1 
    dw LibBG_Draygon_State0 
    dw SetupASM_SetPausingCodeForDraygon 

RoomState_Draygon_1:
    dl LevelData_Draygon 
    db $1C,$00,$03 
    dw FXHeader_Draygon_State0_1 
    dw EnemyPopulations_Draygon_State1_MotherBrain_State2 
    dw EnemySets_Draygon_1_MotherBrain_2 
    db $01,$01 
    dw RoomScrolls_Draygon 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Draygon_State0_1 
    dw LibBG_Phantoon_Draygon_State1 
    dw SetupASM_SetPausingCodeForDraygon 

RoomDoors_Draygon:
    dw Door_Draygon_0 
    dw Door_Draygon_1 

RoomScrolls_Draygon:
    db $02,$02,$01,$01 

RoomHeader_TourianFirst:
    db $00,$05,$14,$09,$01,$04,$70,$A0,$00 
    dw RoomDoors_TourianFirst 
    dw Use_StatePointer_inX 

RoomState_TourianFirst:
    dl LevelData_TourianFirst 
    db $0D,$1E,$05 
    dw FXHeader_TourianFirst 
    dw EnemyPopulations_TourianFirst 
    dw EnemySets_TourianFirst 
    db $01,$C1 
    dw RoomScrolls_TourianFirst 
    dw $0000 
    dw $0000 
    dw PLMPopulation_TourianFirst 
    dw LibBG_Tourian_D_MechanicalRoom 
    dw SetupASM_SetCollectedMap 

RoomDoors_TourianFirst:
    dw Door_TourianFirst_0 
    dw Door_TourianFirst_1 
    dw Door_MaridiaElev_3_TourianFirst_2 
    dw Door_TourianFirst_3 

RoomScrolls_TourianFirst:
    db $02,$02,$02,$01 

RoomHeader_Metroids1:
    db $01,$05,$0E,$0C,$06,$01,$70,$A0,$00 
    dw RoomDoors_Metroids1 
    dw RoomStateCheck_EventHasBeenSet 
    db $10 
    dw RoomState_Metroids1_1 
    dw Use_StatePointer_inX 

RoomState_Metroids1_0:
    dl LevelData_Metroids1 
    db $0D,$00,$00 
    dw FXHeader_Metroids1_State0_1 
    dw EnemyPopulations_Metroids1_0 
    dw EnemySets_Metroids1_0 
    db $C1,$C1 
    dw RoomScrolls_Metroids1 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Metroids1_State0_1 
    dw LibBG_Tourian_D_MechanicalRoom_Letterbox 
    dw RTS_8FC91E 

RoomState_Metroids1_1:
    dl LevelData_Metroids1 
    db $0D,$00,$00 
    dw FXHeader_Metroids1_State0_1 
    dw EnemyPopulations_Metroids1_1 
    dw EnemySets_Metroids1_1 
    db $C1,$C1 
    dw RoomScrolls_Metroids1 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Metroids1_State0_1 
    dw LibBG_Tourian_D_MechanicalRoom_Letterbox 
    dw RTS_8FC91E 

RoomDoors_Metroids1:
    dw Door_Metroids1_0 
    dw Door_Metroids1_1 

RoomScrolls_Metroids1:
    db $01,$01,$01,$01,$01,$01 

RoomHeader_Metroids2:
    db $02,$05,$0D,$0C,$01,$02,$70,$A0,$00 
    dw RoomDoors_Metroids2 
    dw RoomStateCheck_EventHasBeenSet 
    db $11 
    dw RoomState_Metroids2_1 
    dw Use_StatePointer_inX 

RoomState_Metroids2_0:
    dl LevelData_Metroids2 
    db $0D,$00,$00 
    dw FXHeader_Metroids2_State0_1 
    dw EnemyPopulations_Metroids2_0 
    dw EnemySets_Metroids2_0 
    db $C1,$C1 
    dw RoomScrolls_Metroids2 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Metroids2_State0_1 
    dw LibBG_Tourian_D_MechanicalRoom 
    dw RTS_8FC91E 

RoomState_Metroids2_1:
    dl LevelData_Metroids2 
    db $0D,$00,$00 
    dw FXHeader_Metroids2_State0_1 
    dw EnemyPopulations_Metroids2_1 
    dw EnemySets_Metroids2_1 
    db $C1,$C1 
    dw RoomScrolls_Metroids2 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Metroids2_State0_1 
    dw LibBG_Tourian_D_MechanicalRoom 
    dw RTS_8FC91E 

RoomDoors_Metroids2:
    dw Door_Metroids2_0 
    dw Door_Metroids2_1 

RoomScrolls_Metroids2:
    db $02,$02 

RoomHeader_Metroids3:
    db $03,$05,$0E,$0D,$06,$01,$70,$A0,$00 
    dw RoomDoors_Metroids3 
    dw RoomStateCheck_EventHasBeenSet 
    db $12 
    dw RoomState_Metroids3_1 
    dw Use_StatePointer_inX 

RoomState_Metroids3_0:
    dl LevelData_Metroids3 
    db $0D,$00,$00 
    dw FXHeader_Metroids3_State0_1 
    dw EnemyPopulations_Metroids3_0 
    dw EnemySets_Metroids3_0 
    db $C1,$C1 
    dw RoomScrolls_Metroids3 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Metroids3_State0_1 
    dw LibBG_Tourian_D_MechanicalRoom_Letterbox 
    dw RTS_8FC91E 

RoomState_Metroids3_1:
    dl LevelData_Metroids3 
    db $0D,$00,$00 
    dw FXHeader_Metroids3_State0_1 
    dw EnemyPopulations_Metroids3_1 
    dw EnemySets_Metroids3_1 
    db $C1,$C1 
    dw RoomScrolls_Metroids3 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Metroids3_State0_1 
    dw LibBG_Tourian_D_MechanicalRoom_Letterbox 
    dw RTS_8FC91E 

RoomDoors_Metroids3:
    dw Door_Metroids3_0 
    dw Door_Metroids3_1 

RoomScrolls_Metroids3:
    db $01,$01,$01,$01,$01,$01 

RoomHeader_Metroids4:
    db $04,$05,$14,$0D,$01,$02,$70,$A0,$00 
    dw RoomDoors_Metroids4 
    dw RoomStateCheck_EventHasBeenSet 
    db $13 
    dw RoomState_Metroids4_1 
    dw Use_StatePointer_inX 

RoomState_Metroids4_0:
    dl LevelData_Metroids4 
    db $0D,$1E,$05 
    dw FXHeader_Metroids4_State0_1 
    dw EnemyPopulations_Metroids4_0 
    dw EnemySets_Metroids4_0 
    db $C1,$C1 
    dw RoomScrolls_Metroids4 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Metroids4_State0_1 
    dw LibBG_Tourian_D_MechanicalRoom 
    dw RTS_8FC91E 

RoomState_Metroids4_1:
    dl LevelData_Metroids4 
    db $0D,$1E,$05 
    dw FXHeader_Metroids4_State0_1 
    dw EnemyPopulations_Metroids4_1 
    dw EnemySets_Metroids4_1 
    db $C1,$C1 
    dw RoomScrolls_Metroids4 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Metroids4_State0_1 
    dw LibBG_Tourian_D_MechanicalRoom 
    dw RTS_8FC91E 

RoomDoors_Metroids4:
    dw Door_Metroids4_0 
    dw Door_Metroids4_1 

RoomScrolls_Metroids4:
    db $02,$02 

RoomHeader_BlueHopper:
    db $05,$05,$13,$0F,$02,$01,$70,$A0,$00 
    dw RoomDoors_BlueHopper 
    dw RoomStateCheck_EventHasBeenSet 
    db $14 
    dw RoomState_BlueHopper_1 
    dw Use_StatePointer_inX 

RoomState_BlueHopper_0:
    dl LevelData_BlueHopper 
    db $0D,$45,$06 
    dw FXHeader_BlueHopper_State0_1 
    dw EnemyPopulations_BlueHopper 
    dw EnemySets_BlueHopper 
    db $C1,$C1 
    dw RoomScrolls_BlueHopper 
    dw $0000 
    dw $0000 
    dw PLMPopulation_BlueHopper_State0_1 
    dw LibBG_Tourian_D_VerticalStructures 
    dw RTS_8FC91E 

RoomState_BlueHopper_1:
    dl LevelData_BlueHopper 
    db $0D,$00,$00 
    dw FXHeader_BlueHopper_State0_1 
    dw EnemyPopulations_BlueHopper 
    dw EnemySets_BlueHopper 
    db $C1,$C1 
    dw RoomScrolls_BlueHopper 
    dw $0000 
    dw $0000 
    dw PLMPopulation_BlueHopper_State0_1 
    dw LibBG_Tourian_D_VerticalStructures 
    dw RTS_8FC91E 

RoomDoors_BlueHopper:
    dw Door_BlueHopper_0 
    dw Door_BlueHopper_1 

RoomScrolls_BlueHopper:
    db $01,$01 

RoomHeader_DustTorizo:
    db $06,$05,$11,$0F,$02,$01,$70,$A0,$00 
    dw RoomDoors_DustTorizo 
    dw RoomStateCheck_EventHasBeenSet 
    db $14 
    dw RoomState_DustTorizo_1 
    dw Use_StatePointer_inX 

RoomState_DustTorizo_0:
    dl LevelData_DustTorizo 
    db $0D,$45,$06 
    dw FXHeader_DustTorizo_State0_1 
    dw EnemyPopulations_DustTorizo 
    dw EnemySets_DustTorizo 
    db $C1,$C1 
    dw RoomScrolls_DustTorizo 
    dw $0000 
    dw $0000 
    dw PLMPopulation_DustTorizo_State0_1 
    dw LibBG_Tourian_D_VerticalStructures 
    dw RTS_8FC91E 

RoomState_DustTorizo_1:
    dl LevelData_DustTorizo 
    db $0D,$1E,$05 
    dw FXHeader_DustTorizo_State0_1 
    dw EnemyPopulations_DustTorizo 
    dw EnemySets_DustTorizo 
    db $C1,$C1 
    dw RoomScrolls_DustTorizo 
    dw $0000 
    dw $0000 
    dw PLMPopulation_DustTorizo_State0_1 
    dw LibBG_Tourian_D_VerticalStructures 
    dw RTS_8FC91E 

RoomDoors_DustTorizo:
    dw Door_DustTorizo_0 
    dw Door_DustTorizo_1 

RoomScrolls_DustTorizo:
    db $01,$01 

RoomHeader_BigBoy:
    db $07,$05,$0D,$0F,$04,$01,$70,$A0,$00 
    dw RoomDoors_BigBoy 
    dw RoomStateCheck_EventHasBeenSet 
    db $14 
    dw RoomState_BigBoy_1 
    dw Use_StatePointer_inX 

RoomState_BigBoy_0:
    dl LevelData_BigBoy 
    db $0D,$00,$00 
    dw FXHeader_BigBoy_State0_1 
    dw EnemyPopulations_BigBoy 
    dw EnemySets_BigBoy 
    db $C1,$C1 
    dw RoomScrolls_BigBoy 
    dw $0000 
    dw $0000 
    dw PLMPopulation_BigBoy_State0_1 
    dw LibBG_Tourian_D_VerticalStructures 
    dw RTS_8FC91E 

RoomState_BigBoy_1:
    dl LevelData_BigBoy 
    db $0D,$00,$00 
    dw FXHeader_BigBoy_State0_1 
    dw EnemyPopulations_BigBoy 
    dw EnemySets_BigBoy 
    db $C1,$C1 
    dw RoomScrolls_BigBoy 
    dw $0000 
    dw $0000 
    dw PLMPopulation_BigBoy_State0_1 
    dw LibBG_Tourian_D_VerticalStructures 
    dw RTS_8FC91E 

RoomDoors_BigBoy:
    dw Door_BigBoy_0 
    dw Door_BigBoy_1 

RoomScrolls_BigBoy:
    db $01,$01,$01,$01 

RoomHeader_Seaweed:
    db $08,$05,$0C,$0F,$01,$02,$70,$A0,$00 
    dw RoomDoors_Seaweed 
    dw Use_StatePointer_inX 

RoomState_Seaweed:
    dl LevelData_Seaweed 
    db $0D,$1E,$05 
    dw FXHeader_Seaweed 
    dw EnemyPopulations_Seaweed 
    dw EnemySets_Seaweed 
    db $C1,$C1 
    dw RoomScrolls_Seaweed 
    dw $0000 
    dw $0000 
    dw PLMPopulation_Seaweed 
    dw LibBG_Tourian_D_VerticalStructures 
    dw RTS_8FC91E 

RoomDoors_Seaweed:
    dw Door_Seaweed_0 
    dw Door_Seaweed_1 
    dw Door_Seaweed_2 

RoomScrolls_Seaweed:
    db $02,$02 

RoomHeader_TourianRecharge:
    db $09,$05,$0B,$10,$01,$01,$70,$A0,$00 
    dw RoomDoors_TourianRecharge 
    dw Use_StatePointer_inX 

RoomState_TourianRecharge:
    dl LevelData_RefillStation_RightSideDoor 
    db $18,$00,$00 
    dw FXHeader_TourianRecharge 
    dw EnemyPopulations_TourianRecharge 
    dw EnemySets_TourianRecharge 
    db $00,$00 
    dw RoomScrolls_TourianRecharge 
    dw $0000 
    dw $0000 
    dw PLMPopulation_TourianRecharge 
    dw $0000 
    dw RTS_8FC91E 

RoomDoors_TourianRecharge:
    dw Door_TourianRecharge_0 

RoomScrolls_TourianRecharge:
    db $01 

RoomHeader_MotherBrain:
    db $0A,$05,$0D,$12,$04,$01,$70,$A0,$00 
    dw RoomDoors_MotherBrain 
    dw RoomStateCheck_MainAreaBossIsDead 
    dw RoomState_MotherBrain_2 
    dw RoomStateCheck_EventHasBeenSet 
    db $02 
    dw RoomState_MotherBrain_1 
    dw Use_StatePointer_inX 

RoomState_MotherBrain_0:
    dl LevelData_MotherBrain 
    db $0E,$00,$00 
    dw FXHeader_MotherBrain_State0_1 
    dw EnemyPopulations_MotherBrain_0_1 
    dw EnemySets_MotherBrain_0_1 
    db $C1,$C1 
    dw RoomScrolls_MotherBrain 
    dw $0000 
    dw $0000 
    dw PLMPopulation_MotherBrain_State0_1_2 
    dw LibBG_Tourian_E_PipeRoom_Dark 
    dw RTS_8FC91E 

RoomState_MotherBrain_1:
    dl LevelData_MotherBrain 
    db $0E,$00,$00 
    dw FXHeader_MotherBrain_State0_1 
    dw EnemyPopulations_MotherBrain_0_1 
    dw EnemySets_MotherBrain_0_1 
    db $C1,$C1 
    dw RoomScrolls_MotherBrain 
    dw $0000 
    dw $0000 
    dw PLMPopulation_MotherBrain_State0_1_2 
    dw LibBG_Tourian_E_PipeRoom_Dark 
    dw RTS_8FC91E 

RoomState_MotherBrain_2:
    dl LevelData_MotherBrain 
    db $0E,$00,$03 
    dw FXHeader_Debug_MotherBrain_State2 
    dw EnemyPopulations_Draygon_State1_MotherBrain_State2 
    dw EnemySets_Draygon_1_MotherBrain_2 
    db $C1,$C1 
    dw RoomScrolls_MotherBrain 
    dw $0000 
    dw $0000 
    dw PLMPopulation_MotherBrain_State0_1_2 
    dw LibBG_Tourian_E_PipeRoom_Dark 
    dw RTS_8FC91E 

RoomDoors_MotherBrain:
    dw Door_MotherBrain_0 
    dw Door_MotherBrain_1 

RoomScrolls_MotherBrain:
    db $01,$01,$01,$01 

RoomHeader_TourianEyeDoor:
    db $0B,$05,$0D,$10,$04,$01,$70,$A0,$00 
    dw RoomDoors_TourianEyeDoor 
    dw Use_StatePointer_inX 

RoomState_TourianEyeDoor:
    dl LevelData_TourianEyeDoor 
    db $0D,$00,$00 
    dw FXHeader_TourianEyeDoor 
    dw EnemyPopulations_TourianEyeDoor 
    dw EnemySets_TourianEyeDoor 
    db $C1,$C1 
    dw RoomScrolls_TourianEyeDoor 
    dw $0000 
    dw $0000 
    dw PLMPopulation_TourianEyeDoor 
    dw LibBG_Tourian_D_VerticalStructures 
    dw RTS_8FC91E 

RoomDoors_TourianEyeDoor:
    dw Door_TourianEyeDoor_0 
    dw Door_TourianEyeDoor_1 

RoomScrolls_TourianEyeDoor:
    db $01,$01,$01,$01 

RoomHeader_RinkaShaft:
    db $0C,$05,$11,$10,$01,$03,$70,$A0,$00 
    dw RoomDoors_RinkaShaft 
    dw Use_StatePointer_inX 

RoomState_RinkaShaft:
    dl LevelData_RinkaShaft 
    db $0D,$1E,$05 
    dw FXHeader_RinkaShaft 
    dw EnemyPopulations_RinkaShaft 
    dw EnemySets_RinkaShaft 
    db $C1,$C1 
    dw RoomScrolls_RinkaShaft 
    dw $0000 
    dw $0000 
    dw PLMPopulation_RinkaShaft 
    dw LibBG_Tourian_D_PipeRoom_VerticalSeparation 
    dw RTS_8FC91E 

RoomDoors_RinkaShaft:
    dw Door_RinkaShaft_0 
    dw Door_RinkaShaft_1 
    dw Door_RinkaShaft_2 

RoomScrolls_RinkaShaft:
    db $02,$02,$02 

RoomHeader_MotherBrainSave:
    db $0D,$05,$10,$11,$01,$01,$70,$A0,$00 
    dw RoomDoors_MotherBrainSave 
    dw Use_StatePointer_inX 

RoomState_MotherBrainSave:
    dl LevelData_SaveStation_RightSideDoor 
    db $19,$1E,$05 
    dw FXHeader_MotherBrainSave 
    dw EnemyPopulations_MotherBrainSave 
    dw EnemySets_MotherBrainSave 
    db $00,$00 
    dw RoomScrolls_MotherBrainSave 
    dw $0000 
    dw $0000 
    dw PLMPopulation_MotherBrainSave 
    dw $0000 
    dw RTS_8FC91E 

RoomDoors_MotherBrainSave:
    dw Door_MotherBrainSave_0 

RoomScrolls_MotherBrainSave:
    db $01 

RoomHeader_TourianEscape1:
    db $0E,$05,$0B,$12,$02,$01,$70,$A0,$00 
    dw RoomDoors_TourianEscape1 
    dw Use_StatePointer_inX 

RoomState_TourianEscape1:
    dl LevelData_TourianEscape1 
    db $0D,$24,$07 
    dw FXHeader_TourianEscape1 
    dw EnemyPopulations_TourianEscape1 
    dw EnemySets_TourianEscape1 
    db $C1,$C1 
    dw RoomScrolls_TourianEscape1 
    dw $0000 
    dw MainASM_GenerateRandomExplosionOnEveryFourthFrame 
    dw PLMPopulation_TourianEscape1 
    dw LibBG_Tourian_D_PipeRoom_Letterbox 
    dw SetupASM_SetZebesTimebombEvent_SetLightHorizontalRoomShaking 

RoomDoors_TourianEscape1:
    dw Door_TourianEscape1_0 
    dw Door_TourianEscape1_1 

RoomScrolls_TourianEscape1:
    db $02,$02 

RoomHeader_TourianEscape2:
    db $0F,$05,$0B,$13,$01,$02,$70,$A0,$00 
    dw RoomDoors_TourianEscape2 
    dw Use_StatePointer_inX 

RoomState_TourianEscape2:
    dl LevelData_TourianEscape2 
    db $0D,$00,$00 
    dw FXHeader_TourianEscape2 
    dw EnemyPopulations_TourianEscape2 
    dw EnemySets_TourianEscape2 
    db $C1,$C1 
    dw RoomScrolls_TourianEscape2 
    dw $0000 
    dw MainASM_ShakeScreenSwitchingBetweenLightHorizAndMediumDiag 
    dw PLMPopulation_TourianEscape2 
    dw LibBG_Tourian_D_PipeRoom_VerticalSeparation 
    dw SetupASM_SetLightHorizontalRoomShaking 

RoomDoors_TourianEscape2:
    dw Door_TourianEscape2_0 
    dw Door_TourianEscape2_1 

RoomScrolls_TourianEscape2:
    db $02,$01 

RoomHeader_TourianEscape3:
    db $10,$05,$0C,$13,$06,$02,$70,$A0,$00 
    dw RoomDoors_TourianEscape3 
    dw Use_StatePointer_inX 

RoomState_TourianEscape3:
    dl LevelData_TourianEscape3 
    db $0D,$00,$00 
    dw FXHeader_TourianEscape3 
    dw EnemyPopulations_TourianEscape3 
    dw EnemySets_TourianEscape3 
    db $C1,$C1 
    dw RoomScrolls_TourianEscape3 
    dw $0000 
    dw MainASM_GenerateRandomExplosionOnEveryFourthFrame 
    dw PLMPopulation_TourianEscape3 
    dw LibBG_Tourian_D_PipeRoom 
    dw SetupASM_SetMediumHorizontalRoomShaking 

RoomDoors_TourianEscape3:
    dw Door_TourianEscape3_0 
    dw Door_TourianEscape3_1 

RoomScrolls_TourianEscape3:
    db $02,$02,$02,$02,$02,$02,$01,$01,$01,$01,$01,$01 

RoomHeader_TourianEscape4:
    db $11,$05,$12,$10,$03,$06,$70,$A0,$00 
    dw RoomDoors_TourianEscape4 
    dw Use_StatePointer_inX 

RoomState_TourianEscape4:
    dl LevelData_TourianEscape4 
    db $0D,$00,$00 
    dw FXHeader_ToruianEscaper4 
    dw EnemyPopulations_TourianEscape4 
    dw EnemySets_TourianEscape4 
    db $C1,$C1 
    dw RoomScrolls_TourianEscape4 
    dw $0000 
    dw MainASM_ShakeScreenSwitchingBetweenMediumHorizAndStrongDiag 
    dw PLMPopulation_TourianEscape4 
    dw LibBG_Tourian_D_PipeRoom 
    dw SetupASM_SetupEscapeRoom4sPLM_SetMediumHorizontalRoomShaking 

RoomDoors_TourianEscape4:
    dw Door_TourianEscape4_0 
    dw Door_TourianEscape4_1 

RoomScrolls_TourianEscape4:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$01 
    db $01,$01 

RoomHeader_UpperTourianSave:
    db $12,$05,$15,$0C,$01,$01,$70,$A0,$00 
    dw RoomDoors_UpperTourianSave 
    dw Use_StatePointer_inX 

RoomState_UpperTourianSave:
    dl LevelData_SaveStation_LeftSideDoor 
    db $19,$1E,$05 
    dw FXHeader_UpperTourianSave 
    dw EnemyPopulations_UpperTourianSave 
    dw EnemySets_UpperTourianSave 
    db $00,$00 
    dw RoomScrolls_UpperTourianSave 
    dw $0000 
    dw $0000 
    dw PLMPopulation_UpperTourianSave 
    dw $0000 
    dw $0000 

RoomDoors_UpperTourianSave:
    dw Door_UpperTourianSave_0 

RoomScrolls_UpperTourianSave:
    db $01 

RoomHeader_CeresElev:
    db $00,$06,$0C,$0D,$01,$03,$70,$A0,$05 
    dw RoomDoors_CeresElev 
    dw RoomStateCheck_BossIsDead 
    db $01 
    dw RoomState_CeresElev_1 
    dw Use_StatePointer_inX 

RoomState_CeresElev_0:
    dl LevelData_CeresElev 
    db $11,$2D,$06 
    dw FXHeader_CeresElev_State0_1 
    dw EnemyPopulations_CeresElev_0 
    dw EnemySets_CeresElev_0 
    db $00,$00 
    dw $0000 
    dw $0000 
    dw MainASM_CeresElevatorShaft 
    dw PLMPopulation_CeresElev_State0_1 
    dw LibBG_CeresElevator_State0_1 
    dw SetupASM_SpawnCeresHaze 

RoomState_CeresElev_1:
    dl LevelData_CeresElev 
    db $12,$00,$00 
    dw FXHeader_CeresElev_State0_1 
    dw EnemyPopulations_CeresElev_1 
    dw EnemySets_CeresElev_1 
    db $00,$00 
    dw $0000 
    dw $0000 
    dw MainASM_CeresElevatorShaft 
    dw PLMPopulation_CeresElev_State0_1 
    dw LibBG_CeresElevator_State0_1 
    dw SetupASM_TurnCeresDoorToSolidBlocks_SpawnCeresHaze 

RoomDoors_CeresElev:
    dw Door_CeresElev_0 

RoomHeader_FallingTile:
    db $01,$06,$0D,$0F,$02,$01,$70,$A0,$00 
    dw RoomDoors_FallingTile 
    dw RoomStateCheck_BossIsDead 
    db $01 
    dw RoomState_FallingTile_1 
    dw Use_StatePointer_inX 

RoomState_FallingTile_0:
    dl LevelData_FallingTile 
    db $0F,$00,$00 
    dw FXHeader_FallingTile_State0 
    dw EnemyPopulations_FallingTile_0 
    dw EnemySets_FallingTile_0 
    db $C1,$01 
    dw $0000 
    dw $0000 
    dw MainASM_SpawnCeresPreElevatorHallFallingDebris 
    dw PLMPopulation_FallingTile_State0_1 
    dw LibBG_Tourian_D_E_StatueHall 
    dw SetupASM_SpawnCeresHaze 

RoomState_FallingTile_1:
    dl LevelData_FallingTile 
    db $10,$00,$00 
    dw FXHeader_FallingTile_State1 
    dw EnemyPopulations_FallingTile_1 
    dw EnemySets_FallingTile_1 
    db $C1,$01 
    dw $0000 
    dw $0000 
    dw MainASM_SpawnCeresPreElevatorHallFallingDebris 
    dw PLMPopulation_FallingTile_State0_1 
    dw LibBG_Tourian_D_E_StatueHall 
    dw SetupASM_SpawnCeresHaze 

RoomDoors_FallingTile:
    dw Door_FallingTile_0 
    dw Door_FallingTile_1 

RoomHeader_MagnetStairs:
    db $02,$06,$0F,$0F,$01,$02,$70,$A0,$00 
    dw RoomDoors_MagnetStairs 
    dw RoomStateCheck_BossIsDead 
    db $01 
    dw RoomState_MagnetStairs_1 
    dw Use_StatePointer_inX 

RoomState_MagnetStairs_0:
    dl LevelData_MagnetStairs 
    db $0F,$00,$00 
    dw FXHeader_MagnetStairs_State0 
    dw EnemyPopulations_MagnetStairs_0 
    dw EnemySets_MagnetStairs_0 
    db $01,$41 
    dw $0000 
    dw $0000 
    dw RTS_8FE524 
    dw PLMPopulation_MagnetStairs_State0_1 
    dw LibBG_Tourian_D_E_StatueHall 
    dw SetupASM_SpawnCeresHaze 

RoomState_MagnetStairs_1:
    dl LevelData_MagnetStairs 
    db $10,$00,$00 
    dw FXHeader_MagnetStairs_State1 
    dw EnemyPopulations_MagnetStairs_1 
    dw EnemySets_MagnetStairs_1 
    db $01,$C1 
    dw $0000 
    dw $0000 
    dw RTS_8FE524 
    dw PLMPopulation_MagnetStairs_State0_1 
    dw LibBG_Tourian_D_E_StatueHall 
    dw SetupASM_SpawnCeresHaze 

RoomDoors_MagnetStairs:
    dw Door_MagnetStairs_0 
    dw Door_MagnetStairs_1 

RoomHeader_DeadScientist:
    db $03,$06,$10,$10,$02,$01,$70,$A0,$00 
    dw RoomDoors_DeadScientist 
    dw RoomStateCheck_BossIsDead 
    db $01 
    dw RoomState_DeadScientist_1 
    dw Use_StatePointer_inX 

RoomState_DeadScientist_0:
    dl LevelData_DeadScientist 
    db $0F,$00,$00 
    dw FXHeader_DeadScientist_State0 
    dw EnemyPopulations_DeadScientist_0 
    dw EnemySets_DeadScientist_0 
    db $C0,$00 
    dw $0000 
    dw $0000 
    dw RTS_8FE524 
    dw PLMPopulation_DeadScientist_State0_1 
    dw $0000 
    dw SetupASM_SpawnCeresHaze 

RoomState_DeadScientist_1:
    dl LevelData_DeadScientist 
    db $10,$00,$00 
    dw FXHeader_DeadScientist_State1 
    dw EnemyPopulations_DeadScientist_1 
    dw EnemySets_DeadScientist_1 
    db $C0,$00 
    dw $0000 
    dw $0000 
    dw RTS_8FE524 
    dw PLMPopulation_DeadScientist_State0_1 
    dw $0000 
    dw SetupASM_SpawnCeresHaze 

RoomDoors_DeadScientist:
    dw Door_DeadScientist_0 
    dw Door_DeadScientist_1 

RoomHeader_58Escape:
    db $04,$06,$12,$10,$02,$01,$70,$A0,$00 
    dw RoomDoors_58Escape 
    dw RoomStateCheck_BossIsDead 
    db $01 
    dw RoomState_58Escape_1 
    dw Use_StatePointer_inX 

RoomState_58Escape_0:
    dl LevelData_58Escape 
    db $0F,$00,$00 
    dw FXHeader_58Escape_State0 
    dw EnemyPopulations_58Escape_0 
    dw EnemySets_58Escape_0 
    db $C1,$01 
    dw $0000 
    dw $0000 
    dw RTS_8FE524 
    dw PLMPopulation_58Escape_State0_1 
    dw LibBG_Tourian_D_E_StatueHall 
    dw SetupASM_SpawnCeresHaze 

RoomState_58Escape_1:
    dl LevelData_58Escape 
    db $10,$00,$00 
    dw FXHeader_58Escape_State1 
    dw EnemyPopulations_58Escape_1 
    dw EnemySets_58Escape_1 
    db $C1,$01 
    dw $0000 
    dw $0000 
    dw RTS_8FE524 
    dw PLMPopulation_58Escape_State0_1 
    dw LibBG_Tourian_D_E_StatueHall 
    dw SetupASM_SpawnCeresHaze 

RoomDoors_58Escape:
    dw Door_58Escape_0 
    dw Door_58Escape_1 

RoomHeader_CeresRidley:
    db $05,$06,$14,$10,$01,$01,$70,$A0,$05 
    dw RoomDoors_CeresRidley 
    dw RoomStateCheck_BossIsDead 
    db $01 
    dw RoomState_CeresRidley_1 
    dw Use_StatePointer_inX 

RoomState_CeresRidley_0:
    dl LevelData_CeresRidley 
    db $13,$24,$80 
    dw FXHeader_CeresRidley_State0 
    dw EnemyPopulations_CeresRidley_0 
    dw EnemySets_CeresRidley_0 
    db $00,$00 
    dw $0000 
    dw $0000 
    dw MainASM_HandleCeresRidleyGetawayCutscene 
    dw PLMPopulation_CeresRidley_State0_1 
    dw $0000 
    dw SetupASM_SetBG1_2_TilesBaseAddress_SpawnCeresHaze 

RoomState_CeresRidley_1:
    dl LevelData_CeresRidley 
    db $14,$00,$00 
    dw FXHeader_CeresRidley_State1 
    dw EnemyPopulations_CeresRidley_1 
    dw EnemySets_CeresRidley_1 
    db $00,$00 
    dw $0000 
    dw $0000 
    dw MainASM_HandleCeresRidleyGetawayCutscene 
    dw PLMPopulation_CeresRidley_State0_1 
    dw $0000 
    dw SetupASM_SetBG1_2_TilesBaseAddress_SpawnCeresHaze 

RoomDoors_CeresRidley:
    dw Door_CeresRidley 

LibBG_Phantoon_State0:
    dw $0002 
    dl $7E2000 
    dw $4800,$1000,$0000 

LibBG_Draygon_State0:
    dw $0002 
    dl $7E2000 
    dw $4800,$1000,$0000 

LibBG_Phantoon_Draygon_State1:
    dw $000A,$0000 

LibBG_WreckedShip_4_5_EntranceHall:
    dw $0004 
    dl Background_WreckedShip_4_5_EntranceHall_0 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_LibBG_WreckedShip_4_5_EntranceHall_1_8FE132:
    dw $0004 
    dl Background_WreckedShip_4_5_EntranceHall_1 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 
endif ; !FEATURE_KEEP_UNREFERENCED

LibBG_WreckedShip_4_5_Columns_Tubes:
    dw $0004 
    dl Background_WreckedShip_4_5_Columns_Tubes 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

LibBG_WreckedShip_4_5_ExperimentRoom:
    dw $0004 
    dl Background_WreckedShip_4_5_ExperimentRoom 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

LibBG_WreckedShip_4_5_Panels_Vents:
    dw $0004 
    dl Background_WreckedShip_4_5_Panels_Vents 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

LibBG_WreckedShip_4_5_Panels_Vents_Horizontal:
    dw $0004 
    dl Background_WreckedShip_4_5_Panels_Vents_Horizontal 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

LibBG_WreckedShip_4_5_Panels_Vents_Vertical:
    dw $0004 
    dl Background_WreckedShip_4_5_Panels_Vents_Vertical 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

LibBG_CeresElevator_State0_1:
    dw $000A,$0000 

DoorASM_StartWreckedShipTreadmillEastEntrance:
    LDY.W #AnimatedTilesObjects_FX_wreckedShipTreadmillLeftwards 
    JSL.L Spawn_AnimatedTilesObject 
    JSL.L Spawn_Hardcoded_PLM 
    db $04,$09 
    dw PLMEntries_wreckedShipEntranceTreadmillFromEast 
    RTS 


DoorASM_Scroll_1_Blue:
    PHP 
    SEP #$20 
    LDA.B #$01 : STA.L $7ECD21 
    PLP 
    RTS 


DoorASM_Scroll_0_Green_duplicate_again:
    PHP 
    SEP #$20 
    LDA.B #$02 : STA.L $7ECD20 
    PLP 
    RTS 


DoorASM_Scroll_3_Red_4_Blue:
    PHP 
    SEP #$20 
    LDA.B #$00 : STA.L $7ECD23 
    LDA.B #$01 : STA.L $7ECD24 
    PLP 
    RTS 


DoorASM_Scroll_29_Blue:
    PHP 
    SEP #$20 
    LDA.B #$01 : STA.L $7ECD49 
    PLP 
    RTS 


DoorASM_Scroll_28_2E_Green:
    PHP 
    SEP #$20 
    LDA.B #$02 : STA.L $7ECD48 
    STA.L $7ECD4E 
    PLP 
    RTS 


DoorASM_Scroll_6_7_8_9_A_B_Red:
    PHP 
    SEP #$20 
    LDA.B #$00 : STA.L $7ECD26 
    STA.L $7ECD27 
    STA.L $7ECD28 
    STA.L $7ECD29 
    STA.L $7ECD2A 
    STA.L $7ECD2B 
    PLP 
    RTS 


LibBG_Maridia_B_BrownWall:
    dw $0004 
    dl Background_Maridia_B_BrownWall 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$1000,$0000 

LibBG_Maridia_C_GreenWall:
    dw $0004 
    dl Background_Maridia_C_GreenWall 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$1000,$0000 

DoorASM_SetupElevatubeFromSouth:
    LDA.W #$FF00 : STA.W $07E5 
    STZ.W $07E3 
    LDA.W #$09C0 : STA.W $07E3 
    LDA.W #$FFE0 : STA.W $07E7 
    LDA.W #$0000 : JSL.L Run_Samus_Command 
    JSL.L Spawn_Hardcoded_PLM 
    db $01,$00 
    dw PLMEntries_maridiaElevatube 
    RTS 


DoorASM_SetupElevatubeFromNorth:
    LDA.W #$0100 : STA.W $07E5 
    STZ.W $07E3 
    LDA.W #$0040 : STA.W $07E3 
    LDA.W #$0020 : STA.W $07E7 
    LDA.W #$0000 : JSL.L Run_Samus_Command 
    JSL.L Spawn_Hardcoded_PLM 
    db $01,$00 
    dw PLMEntries_maridiaElevatube 
    RTS 


MainASM_Elevatube:
    LDA.W #$0080 : STA.W $0AF6 
    STZ.W $0AF8 
    STZ.B $12 
    STZ.B $14 
    LDA.W $07E5 : BPL + 
    DEC.B $14 

  + STA.B $13 
    LDA.W $07E1 : CLC : ADC.B $12 : STA.W $07E1 
    LDA.W $07E3 : ADC.B $14 : STA.W $07E3 
    LDA.B $12 
    LDX.B $14 
    STX.B $12 
    STA.B $14 
    JSL.L MoveSamusDown_NoSolidEnemyCollision 
    LDA.W $07E5 : CLC : ADC.W $07E7 : CLC : ADC.W #$0E20 : CMP.W #$1C41 
    BCS .return 
    SEC : SBC.W #$0E20 : STA.W $07E5 

.return:
    RTS 


DoorASM_ResetElevatubeOnNorthExit:
    LDA.W #$0001 : JSL.L Run_Samus_Command 
    RTS 


DoorASM_ResetElevatubeOnSouthExit:
    LDA.W #$0202 : STA.L $7ECD20 
    LDA.W #$0001 : JSL.L Run_Samus_Command 
    RTS 


DoorASM_Scroll_A_Red_B_Blue:
    PHP 
    SEP #$20 
    LDA.B #$00 : STA.L $7ECD2A 
    LDA.B #$01 : STA.L $7ECD2B 
    PLP 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_DoorASM_Scroll_4_Green_8FE329:
    PHP 
    SEP #$20 
    LDA.B #$00 : STA.L $7ECD31 
    LDA.B #$01 : STA.L $7ECD30 
    PLP 
    RTS 


UNUSED_DoorASM_Scroll_4_Green_8FE33A:
    PHP 
    SEP #$20 
    LDA.B #$02 : STA.L $7ECD24 
    PLP 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


DoorASM_Scroll_0_Red_4_Blue_duplicate:
    PHP 
    SEP #$20 
    LDA.B #$00 : STA.L $7ECD20 
    LDA.B #$01 : STA.L $7ECD24 
    PLP 
    RTS 


DoorASM_Scroll_0_Red_1_Blue:
    PHP 
    SEP #$20 
    LDA.B #$00 : STA.L $7ECD20 
    LDA.B #$01 : STA.L $7ECD21 
    PLP 
    RTS 


DoorASM_Scroll_9_Red_A_Blue:
    PHP 
    SEP #$20 
    LDA.B #$00 : STA.L $7ECD29 
    LDA.B #$01 : STA.L $7ECD2A 
    PLP 
    RTS 


DoorASM_Scroll_0_2_Red_1_Blue:
    PHP 
    SEP #$20 
    LDA.B #$00 : STA.L $7ECD20 
    STA.L $7ECD22 
    LDA.B #$01 : STA.L $7ECD21 
    PLP 
    RTS 


DoorASM_Scroll_1_Blue_duplicate:
    PHP 
    SEP #$20 
    LDA.B #$01 : STA.L $7ECD21 
    PLP 
    RTS 


DoorASM_Scroll_6_Blue:
    PHP 
    SEP #$20 
    LDA.B #$01 : STA.L $7ECD26 
    PLP 
    RTS 


DoorASM_Scroll_4_Red_duplicate:
    PHP 
    SEP #$20 
    LDA.B #$00 : STA.L $7ECD24 
    PLP 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_DoorASM_Scroll_1_Red_8FE3AE:
    PHP 
    SEP #$20 
    LDA.B #$00 : STA.L $7ECD21 
    PLP 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


DoorASM_Scroll_4_7_Red:
    PHP 
    SEP #$20 
    LDA.B #$00 : STA.L $7ECD24 
    STA.L $7ECD27 
    PLP 
    RTS 


DoorASM_Scroll_1_Blue_2_Red_duplicate:
    PHP 
    SEP #$20 
    LDA.B #$00 : STA.L $7ECD22 
    LDA.B #$01 : STA.L $7ECD21 
    PLP 
    RTS 


DoorASM_Scroll_0_2_Green_duplicate:
    PHP 
    SEP #$20 
    LDA.B #$02 : STA.L $7ECD20 
    STA.L $7ECD22 
    PLP 
    RTS 


LibBG_Tourian_D_MechanicalRoom:
    dw $0004 
    dl Background_Tourian_D_MechanicalRoom 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

LibBG_Tourian_D_MechanicalRoom_Letterbox:
    dw $0004 
    dl Background_Tourian_D_MechanicalRoom_Letterbox 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

LibBG_Tourian_D_VerticalStructures:
    dw $0004 
    dl Background_Tourian_D_VerticalStructures 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

LibBG_Tourian_D_PipeRoom_Letterbox:
    dw $0004 
    dl Background_Tourian_D_PipeRoom_Letterbox 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

LibBG_Tourian_D_PipeRoom_VerticalSeparation:
    dw $0004 
    dl Background_Tourian_D_PipeRoom_VerticalSeparation 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

LibBG_Tourian_D_PipeRoom:
    dw $0004 
    dl Background_Tourian_D_PipeRoom 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

LibBG_Tourian_E_PipeRoom_Dark:
    dw $0004 
    dl Background_Tourian_E_PipeRoom_Dark 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

LibBG_Tourian_D_E_StatueHall:
    dw $0004 
    dl Background_Tourian_D_E_StatueHall 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 

DoorASM_Scroll_0_1_Green_duplicate:
    PHP 
    SEP #$20 
    LDA.B #$02 : STA.L $7ECD20 
    STA.L $7ECD21 
    PLP 
    RTS 


DoorASM_Scroll_8_Blue_9_Red:
    PHP 
    SEP #$20 
    LDA.B #$01 : STA.L $7ECD38 
    LDA.B #$00 : STA.L $7ECD39 
    PLP 
    RTS 


DoorASM_ToCeresElevatorShaft:
    SEP #$20 
    LDA.B #$07 : STA.B $56 
    STA.W $2105 
    REP #$20 
    LDA.W #$0100 : STA.B $78 
    STA.B $7E 
    STZ.B $7A 
    STZ.B $7C 
    LDA.W #$0080 : STA.B $80 
    LDA.W #$03F0 : STA.B $82 
    LDA.W #$0001 : STA.W $0783 
    LDA.W #$0022 : STA.W $07E1 
    LDA.W #$003C : STA.W $07E3 
    RTS 


DoorASM_FromCeresElevatorShaft:
    SEP #$20 
    LDA.B #$09 : STA.B $56 
    REP #$20 
    STZ.W $0783 
    RTS 


MainASM_CeresElevatorShaft:
    JSL.L RoomMainASM_CeresElevatorShaft 
    RTS 


RTS_8FE524:
    RTS 


MainASM_SpawnCeresPreElevatorHallFallingDebris:
    LDA.W $093F : BEQ RTS_8FE524 
    DEC.W $07E1 
    BPL RTS_8FE524 
    LDA.W #$0008 : STA.W $07E1 
    LDY.W #EnemyProjectile_CeresFallingTile_Light 
    LDA.W $05E5 
    ASL A 
    BCC + 
    LDY.W #EnemyProjectile_CeresFallingTile_Dark 

  + LDA.W $05E5 : AND.W #$000F 
    ASL A 
    TAX 
    LDA.W .debrisXpos,X : JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    RTS 


.debrisXpos:
    dw $0050,$0060,$0070,$0080,$0090,$00A0,$00B0,$00C0 
    dw $00D0,$00E0,$00F0,$0110,$0130,$0150,$0170,$0190 

MainASM_HandleCeresRidleyGetawayCutscene:
    LDA.W $093F 
    LSR A 
    BCC .return 
    JSL.L HandleCeresRidleyGetawayCutscene 

.return:
    RTS 


MainASM_ShakeScreenSwitchingBetweenLightHorizAndMediumDiag:
    LDA.W $07E1 : BEQ .resetQuakeTimer 
    DEC.W $07E1 
    BNE MainASM_GenerateRandomExplosionOnEveryFourthFrame 
    LDA.W #$0012 : BRA + 


.resetQuakeTimer:
    JSL.L GenerateRandomNumber 
    CMP.W #$0200 
    BCS MainASM_GenerateRandomExplosionOnEveryFourthFrame 
    LDA.W #$002A : STA.W $07E1 
    LDA.W #$0017 

  + STA.W $183E 

MainASM_GenerateRandomExplosionOnEveryFourthFrame:
    JSR.W GenerateRandomExplosionOnEveryFourthFrame 
    RTS 


MainASM_ShakeScreenSwitchingBetweenMediumHorizAndStrongDiag:
    LDA.W $07E1 : BEQ .resetQuakeTimer 
    DEC.W $07E1 
    BNE .noEarthquakeChange 
    LDA.W #$0015 : BRA + 


.resetQuakeTimer:
    JSL.L GenerateRandomNumber 
    CMP.W #$0180 
    BCS .noEarthquakeChange 
    LDA.W #$002A : STA.W $07E1 
    LDA.W #$001A 

  + STA.W $07E3 

.noEarthquakeChange:
    LDA.W $07E3 : STA.W $183E 
    JSR.W GenerateRandomExplosionOnEveryFourthFrame 
    RTS 


Room_State_Checking_Handler:
    TXA 
    CLC : ADC.W #$000B : TAX 

.loop:
    LDA.W $0000,X : STA.W $07B7 
    INX #2
    PEA.W .loop-1 
    JMP.W ($07B7) 


Use_StatePointer_inX:
    STX.W $07BB 
    PLA 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_RoomStateCheck_Door_8FE5EB:
    LDA.W $0000,X 
    CMP.W $078D 
    BNE + 
    LDA.W $0002,X 
    TAX 
    JMP.W Use_StatePointer_inX 


  + INX #4
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


RoomStateCheck_MainAreaBossIsDead:
    LDA.W #$0001 : JSL.L CheckIfBossBitsForCurrentAreaMatchAnyBitsInA 
    BCC + 
    LDA.W $0000,X 
    TAX 
    JMP.W Use_StatePointer_inX 


  + INX #2
    RTS 


RoomStateCheck_EventHasBeenSet:
    LDA.W $0000,X : AND.W #$00FF 
    JSL.L CheckIfEvent_inA_HasHappened 
    BCC + 
    LDA.W $0001,X 
    TAX 
    JMP.W Use_StatePointer_inX 


  + INX #3
    RTS 


RoomStateCheck_BossIsDead:
    LDA.W $0000,X : AND.W #$00FF 
    JSL.L CheckIfBossBitsForCurrentAreaMatchAnyBitsInA 
    BCC + 
    LDA.W $0001,X 
    TAX 
    JMP.W Use_StatePointer_inX 


  + INX #3
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_RoomStateCheck_Morphball_8FE640:
    LDA.W $09A4 : AND.W #$0004 
    BEQ + 
    LDA.W $0000,X 
    TAX 
    JMP.W Use_StatePointer_inX 


  + INX #2
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


RoomStateCheck_MorphballAndMissiles:
    LDA.W $09A4 : BIT.W #$0004 
    BEQ + 
    LDA.W $09C8 : BEQ + 
    LDA.W $0000,X 
    TAX 
    JMP.W Use_StatePointer_inX 


  + INX #2
    RTS 


RoomStateCheck_PowerBombs:
    LDA.W $09D0 : BEQ + 
    LDA.W $0000,X 
    TAX 
    JMP.W Use_StatePointer_inX 


  + INX #2
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_RoomStateCheck_SpeedBooster_8FE678:
    LDA.W $09A4 : AND.W #$2000 
    BEQ + 
    LDA.W $0000,X 
    TAX 
    JMP.W Use_StatePointer_inX 


  + INX #2
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Door_Closing_PLMs:
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMEntries_blueDoorClosingFacingRight 
    dw PLMEntries_blueDoorClosingFacingLeft 
    dw PLMEntries_blueDoorClosingFacingDown 
    dw PLMEntries_blueDoorClosingFacingUp 
    dw PLMEntries_gateThatClosesInEscapeRoom1_PLM 
    dw PLMEntries_gateThatClosesInEscapeRoom1_PLM 
    dw PLMEntries_gateThatClosesInEscapeRoom1_PLM 
    dw PLMEntries_gateThatClosesInEscapeRoom1_PLM 

Tileset_Table_0_UpperCrateria:
    dl TileTables_0_1_UpperCrateria 
    dl Tiles_0_1_UpperCrateria 
    dl Palettes_0_UpperCrateria 

Tileset_Table_1_RedCrateria:
    dl TileTables_0_1_UpperCrateria 
    dl Tiles_0_1_UpperCrateria 
    dl Palettes_1_RedCrateria 

Tileset_Table_2_LowerCrateria:
    dl TileTables_2_3_LowerCrateria 
    dl Tiles_2_3_LowerCrateria 
    dl Palettes_2_LowerCrateria 

Tileset_Table_3_OldTourian:
    dl TileTables_2_3_LowerCrateria 
    dl Tiles_2_3_LowerCrateria 
    dl Palettes_3_OldTourian 

Tileset_Table_4_WreckedShip_PowerOn:
    dl TileTables_4_5_WreckedShip 
    dl Tiles_4_5_WreckedShip 
    dl Palettes_4_WreckedShip_PowerOn 

Tileset_Table_5_WreckedShip_PowerOff:
    dl TileTables_4_5_WreckedShip 
    dl Tiles_4_5_WreckedShip 
    dl Palettes_5_WreckedShip_PowerOff 

Tileset_Table_6_GreenBlueBrinstar:
    dl TileTables_6_GreenBlueBrinstar 
    dl Tiles_6_GreenBlueBrinstar 
    dl Palettes_6_GreenBlueBrinstar 

Tileset_Table_7_RedBrinstar_Kraid:
    dl TileTables_7_8_RedBrinstar_Kraid_StatuesHall 
    dl Tiles_7_8_RedBrinstar_Kraid_StatuesHall 
    dl Palettes_7_RedBrinstar_Kraid 

Tileset_Table_8_StatuesHall:
    dl TileTables_7_8_RedBrinstar_Kraid_StatuesHall 
    dl Tiles_7_8_RedBrinstar_Kraid_StatuesHall 
    dl Palettes_8_StatuesHall 

Tileset_Table_9_HeatedNorfair:
    dl TileTables_9_A_Norfair 
    dl Tiles_9_A_Norfair 
    dl Palettes_9_HeatedNorfair 

Tileset_Table_A_UnheatedNofair:
    dl TileTables_9_A_Norfair 
    dl Tiles_9_A_Norfair 
    dl Palettes_A_UnheatedNorfair 

Tileset_Table_B_SandlessMaridia:
    dl TileTables_B_SandlessMaridia 
    dl Tiles_B_SandlessMaridia 
    dl Palettes_B_SandlessMaridia 

Tileset_Table_C_SandyMaridia:
    dl TileTables_C_SandyMaridia 
    dl Tiles_C_SandyMaridia 
    dl Palettes_C_SandyMaridia 

Tileset_Table_D_Tourian:
    dl TileTables_D_E_Tourian 
    dl Tiles_D_E_Tourian 
    dl Palettes_D_Tourian 

Tileset_Table_E_MotherBrain:
    dl TileTables_D_E_Tourian 
    dl Tiles_D_E_Tourian 
    dl Palettes_E_MotherBrain 

Tileset_Table_F_BlueCeres:
    dl TileTables_F_10_11_12_13_14_Ceres 
    dl Tiles_F_10_Ceres 
    dl Palettes_F_11_13_BlueCeres 

Tileset_Table_10_WhiteCeres:
    dl TileTables_F_10_11_12_13_14_Ceres 
    dl Tiles_F_10_Ceres 
    dl Palettes_10_12_14_WhiteCeres 

Tileset_Table_11_BlueCeresElevator:
    dl TileTables_F_10_11_12_13_14_Ceres 
    dl Tiles_11_12_CeresElevator 
    dl Palettes_F_11_13_BlueCeres 

Tileset_Table_12_WhiteCeresElevator:
    dl TileTables_F_10_11_12_13_14_Ceres 
    dl Tiles_11_12_CeresElevator 
    dl Palettes_10_12_14_WhiteCeres 

Tileset_Table_13_BlueCeresRidley:
    dl TileTables_F_10_11_12_13_14_Ceres 
    dl Tiles_13_14_CeresRidley 
    dl Palettes_F_11_13_BlueCeres 

Tileset_Table_14_WhiteCeresRidley:
    dl TileTables_F_10_11_12_13_14_Ceres 
    dl Tiles_13_14_CeresRidley 
    dl Palettes_10_12_14_WhiteCeres 

Tileset_Table_15_Map_Statues:
    dl TileTables_15_16_17_18_19_UtilityRoom_Statues 
    dl Tiles_15_16_17_18_19_UtilityRoom_Statues 
    dl Palettes_Map_Statues 

Tileset_Table_16_WreckedShipMap_PowerOff:
    dl TileTables_15_16_17_18_19_UtilityRoom_Statues 
    dl Tiles_15_16_17_18_19_UtilityRoom_Statues 
    dl Palettes_16_WreckedShipMap_PowerOff 

Tileset_Table_17_BlueRefill:
    dl TileTables_15_16_17_18_19_UtilityRoom_Statues 
    dl Tiles_15_16_17_18_19_UtilityRoom_Statues 
    dl Palettes_17_BlueRefill 

Tileset_Table_18_YellowRefill:
    dl TileTables_15_16_17_18_19_UtilityRoom_Statues 
    dl Tiles_15_16_17_18_19_UtilityRoom_Statues 
    dl Palettes_18_YellowRefill 

Tileset_Table_19_SaveStation:
    dl TileTables_15_16_17_18_19_UtilityRoom_Statues 
    dl Tiles_15_16_17_18_19_UtilityRoom_Statues 
    dl Palettes_19_SaveStation 

Tileset_Table_1A_Kraid:
    dl TileTables_1A_Kraid 
    dl Tiles_1A_Kraid 
    dl Palettes_1A_Kraid 

Tileset_Table_1B_Crocomire:
    dl TileTables_1B_Crocomire 
    dl Tiles_1B_Crocomire 
    dl Palettes_1B_Crocomire 

Tileset_Table_1C_Draygon:
    dl TileTables_1C_Draygon 
    dl Tiles_1C_Draygon 
    dl Palettes_1C_Draygon 

Tileset_Pointers:
    dw Tileset_Table_0_UpperCrateria 
    dw Tileset_Table_1_RedCrateria 
    dw Tileset_Table_2_LowerCrateria 
    dw Tileset_Table_3_OldTourian 
    dw Tileset_Table_4_WreckedShip_PowerOn 
    dw Tileset_Table_5_WreckedShip_PowerOff 
    dw Tileset_Table_6_GreenBlueBrinstar 
    dw Tileset_Table_7_RedBrinstar_Kraid 
    dw Tileset_Table_8_StatuesHall 
    dw Tileset_Table_9_HeatedNorfair 
    dw Tileset_Table_A_UnheatedNofair 
    dw Tileset_Table_B_SandlessMaridia 
    dw Tileset_Table_C_SandyMaridia 
    dw Tileset_Table_D_Tourian 
    dw Tileset_Table_E_MotherBrain 
    dw Tileset_Table_F_BlueCeres 
    dw Tileset_Table_10_WhiteCeres 
    dw Tileset_Table_11_BlueCeresElevator 
    dw Tileset_Table_12_WhiteCeresElevator 
    dw Tileset_Table_13_BlueCeresRidley 
    dw Tileset_Table_14_WhiteCeresRidley 
    dw Tileset_Table_15_Map_Statues 
    dw Tileset_Table_16_WreckedShipMap_PowerOff 
    dw Tileset_Table_17_BlueRefill 
    dw Tileset_Table_18_YellowRefill 
    dw Tileset_Table_19_SaveStation 
    dw Tileset_Table_1A_Kraid 
    dw Tileset_Table_1B_Crocomire 
    dw Tileset_Table_1C_Draygon 

Music_Pointers:
    dl SPC_Engine 
    dl Music_TitleSequence 
    dl Music_EmptyCrateria 
    dl Music_LowerCrateria 
    dl Music_UpperCrateria 
    dl Music_GreenBrinstar 
    dl Music_RedBrinstar 
    dl Music_UpperNofair 
    dl Music_LowerNorfair 
    dl Music_Maridia 
    dl Music_Tourian 
    dl Music_MotherBrain 
    dl Music_BossFight1 
    dl Music_BossFight2 
    dl Music_MiniBossFight 
    dl Music_Ceres 
    dl Music_WreckedShip 
    dl Music_ZebesExplosion 
    dl Music_Intro 
    dl Music_Death 
    dl Music_Credits 
    dl Music_TheLastMetroidIsInCaptivity 
    dl Music_TheGalaxyIsAtPeace 
    dl Music_BabyMetroid_BossFight2 
    dl Music_SamusTheme_UpperCrateria 

RoomHeader_Debug:
    db $00,$07,$00,$00,$06,$02,$70,$A0,$00 
    dw RoomDoors_Debug 
    dw Use_StatePointer_inX 

RoomState_Debug:
    dl LevelData_DebugRoom 
    db $0B,$00,$00 
    dw FXHeader_Debug_MotherBrain_State2 
    dw EnemyPopulations_Debug 
    dw EnemySets_Debug 
    dw $C1C1,$0001,$0000,$0000 
    dw RoomPLM_Debug 
    dw LibBG_WreckedShip_4_5_EntranceHall 
    dw $0000 

RoomDoors_Debug:
    dw UNUSED_Door_Debug_0_83ABC4 
    dw UNUSED_Door_Debug_1_83ABCF 
    dw UNUSED_Door_Debug_2_83ABDA 
    dw UNUSED_Door_Debug_3_83ABE5 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_LibraryBackground_8FE85B:
    dw $0002 
    dl FX_Layer3_Tilemaps_water 
    dw $5880,$0F00,$0004 
    dl Background_Crateria_0_Rocks 
    dw $4000,$0002 
    dl $7E4000 
    dw $4800,$0800,$0002 
    dl $7E4000 
    dw $4C00,$0800,$0000 
endif ; !FEATURE_KEEP_UNREFERENCED

RoomPLM_Debug:
    db $00,$00 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_UnknownUnreferenced_8FE881:
    dw $009E,$00AD,$0081,$0001,$0004,$0002,$0000 
endif ; !FEATURE_KEEP_UNREFERENCED

Execute_Room_Setup_ASM:
    PHP : PHB 
    REP #$30 
    LDX.W $07BB 
    LDA.W $0018,X : BEQ .return 
    PHK : PLB 
    JSR.W ($0018,X) 

.return:
    PLB : PLP 
    RTL 


Execute_Door_ASM:
    PHP : PHB 
    REP #$30 
    LDX.W $078D 
    LDA.L $83000A,X : BEQ .return 
    STA.B $12 
    PHK : PLB : PEA.W .return-1 
    JMP.W ($0012) 


.return:
    PLB : PLP 
    RTL 


Execute_Room_Main_ASM:
    LDX.W $07DF 
    BEQ .return 
    PHB : PHK : PLB 
    LDX.W #$0000 
    JSR.W ($07DF,X) 
    PLB 

.return:
    RTL 


MainASM_CrocomiresRoomShaking:
    LDA.W $0F86 : BIT.W #$0200 
    BNE .return 
    LDA.W $0FA8 
    CMP.W #$0040 
    BEQ .behindWallRumbling 
    LDA.W $0FAA : BIT.W #$0400 
    BEQ .branch 
    LDA.W $0FEE 
    DEC A 
    STA.W $0FEE 
    CMP.W #$FFF9 
    BMI + 
    LDA.W $0FEE : BRA .scroll 


  + LDA.W #$0007 : CLC : ADC.W $0FEE : ASL A 
    STA.B $12 
    LDA.W $0FEE : SEC : SBC.B $12 

.scroll:
    STA.B $12 
    CLC : ADC.B $B3 : STA.B $B3 
    LDA.W #$FFD0 : CLC : ADC.B $12 : STA.B $B7 

.return:
    RTS 


.branch:
    LDA.W $0FAC 
    CMP.W #$0022 
    BNE .return 
    LDA.W $0FAE : BEQ .return 
    DEC A 
    STA.W $0FAE 
    BIT.W #$0001 
    BNE + 
    LDA.W $0911 : CLC : ADC.W #$0004 : STA.W $0911 
    RTS 


  + LDA.W $0911 : SEC : SBC.W #$0004 : STA.W $0911 
    RTS 


.behindWallRumbling:
    LDA.W $0915 : CLC : ADC.W $091F : CLC : ADC.W $0FEE : STA.B $B3 
    RTS 


MainASM_RidleysRoomShaking:
    LDA.W $10A8 : BEQ .return 
    DEC A 
    STA.W $10A8 
    ASL A 
    TAX 
    LDA.B $B1 : ADC.W .Xspeeds,X : STA.B $B1 
    LDA.B $B5 : CLC : ADC.W .Xspeeds,X : STA.B $B5 
    LDA.B $B3 : CLC : ADC.W .Yspeeds,X : STA.B $B3 
    LDA.B $B7 : CLC : ADC.W .Yspeeds,X : STA.B $B7 

.return:
    RTS 


.Xspeeds:
    dw $0000,$0002,$0002,$0002,$0000,$FFFE,$FFFE,$FFFE 

.Yspeeds:
    dw $FFFE,$FFFE,$0000,$0002,$0002,$0002,$0000,$FFFE 

Freespace_Bank8F_E99B: 
; $1665 bytes
