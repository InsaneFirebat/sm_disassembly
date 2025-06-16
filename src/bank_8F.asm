
org $8F8000


;;; $8000: PLM populations ;;;
PLMPopulation_LandingSite_State0_1_2:
; Room $91F8, state $9213: PLM
; Room $91F8, state $922D: PLM
; Room $91F8, state $9247: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $1E, $28, RoomPLM_LandingSite_0)
    %PLMPopEntry(PLMEntries_upwardsExtension, $1E, $27, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $1E, $26, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $1E, $25, $8000)
    %PLMPopEntry(PLMEntries_greenDoorFacingLeft, $8E, $46, $0000)
    %PLMPopEntry(PLMEntries_yellowDoorFacingLeft, $8E, $16, $0001)
    dw $0000

PLMPopulation_LandingSite_State3:
; Room $91F8, state $9261: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $1E, $28, RoomPLM_LandingSite_0)
    %PLMPopEntry(PLMEntries_upwardsExtension, $1E, $27, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $1E, $26, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $1E, $25, $8000)
    %PLMPopEntry(PLMEntries_SetsMetroidsClearedStatesWhenRequired, $08, $08, $0008)
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $26, $9002)
    %PLMPopEntry(PLMEntries_greyDoorFacingLeft, $8E, $46, $9003)
    %PLMPopEntry(PLMEntries_greyDoorFacingLeft, $8E, $16, $9004)
    dw $0000

PLMPopulation_GauntletEntrance_State0_1:
; Room $92B3, state $92C5: PLM
; Room $92B3, state $92DF: PLM
    dw $0000

PLMPopulation_Parlor_State0_1:
; Room $92FD, state $9314: PLM
; Room $92FD, state $932E: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $3F, $0B, RoomPLM_Parlor_0)
    %PLMPopEntry(PLMEntries_ScrollPLM, $43, $0B, RoomPLM_Parlor_1)
    %PLMPopEntry(PLMEntries_ScrollPLM, $16, $0D, RoomPLM_Parlor_2)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $17, $0D, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $18, $0D, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $19, $0D, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $16, $0B, RoomPLM_Parlor_6)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $17, $0B, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $18, $0B, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $19, $0B, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $0E, $09, RoomPLM_Parlor_A)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0E, $08, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0E, $07, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $1C, $0A, RoomPLM_Parlor_D)
    %PLMPopEntry(PLMEntries_upwardsExtension, $1C, $09, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $1C, $08, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $1C, $07, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $1C, $06, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $1C, $05, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $32, $0B, RoomPLM_Parlor_13_14)
    %PLMPopEntry(PLMEntries_ScrollPLM, $3C, $0B, RoomPLM_Parlor_13_14)
    %PLMPopEntry(PLMEntries_ScrollPLM, $3A, $11, RoomPLM_Parlor_15)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $3B, $11, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $3C, $11, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $3D, $11, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $3E, $11, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $34, $0E, RoomPLM_Parlor_1A)
    %PLMPopEntry(PLMEntries_redDoorFacingLeft, $1E, $36, $0005)
    dw $0000

PLMPopulation_Parlor_State2:
; Room $92FD, state $9348: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $3F, $0B, RoomPLM_Parlor_0)
    %PLMPopEntry(PLMEntries_ScrollPLM, $43, $0B, RoomPLM_Parlor_1)
    %PLMPopEntry(PLMEntries_ScrollPLM, $16, $0D, RoomPLM_Parlor_2)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $17, $0D, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $18, $0D, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $19, $0D, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $16, $0B, RoomPLM_Parlor_6)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $17, $0B, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $18, $0B, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $19, $0B, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $0E, $09, RoomPLM_Parlor_A)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0E, $08, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0E, $07, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $1C, $0A, RoomPLM_Parlor_D)
    %PLMPopEntry(PLMEntries_upwardsExtension, $1C, $09, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $1C, $08, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $1C, $07, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $1C, $06, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $1C, $05, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $32, $0B, RoomPLM_Parlor_13_14)
    %PLMPopEntry(PLMEntries_ScrollPLM, $3C, $0B, RoomPLM_Parlor_13_14)
    %PLMPopEntry(PLMEntries_ScrollPLM, $3A, $11, RoomPLM_Parlor_15)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $3B, $11, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $3C, $11, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $3D, $11, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $3E, $11, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $34, $0E, RoomPLM_Parlor_1A)
    %PLMPopEntry(PLMEntries_SetsMetroidsClearedStatesWhenRequired, $08, $08, $000A)
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $06, $9006)
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $11, $26, $9007)
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $11, $36, $9008)
    %PLMPopEntry(PLMEntries_greyDoorFacingLeft, $1E, $36, $9009)
    %PLMPopEntry(PLMEntries_greyDoorFacingUp, $16, $4D, $900A)
    dw $0000

PLMPopulation_CrateriaPowerBombs:
; Room $93AA, state $93B7: PLM
    %PLMPopEntry(PLMEntries_PowerBombTank, $1D, $07, $0000)
    dw $0000

PLMPopulation_CrateriaSave:
; Room $93D5, state $93E2: PLM
    %PLMPopEntry(PLMEntries_saveStation, $05, $0B, $0001)
    dw $0000

PLMPopulation_WestOcean:
; Room $93FE, state $940B: PLM
    %PLMPopEntry(PLMEntries_greyDoorFacingLeft, $5E, $36, $900B)
    %PLMPopEntry(PLMEntries_greenDoorFacingLeft, $7E, $46, $000C)
    %PLMPopEntry(PLMEntries_MissileTank, $02, $5B, $0001)
    %PLMPopEntry(PLMEntries_MissileTankShotBlock, $1C, $03, $0002)
    %PLMPopEntry(PLMEntries_MissileTank, $01, $2F, $0003)
    dw $0000

PLMPopulation_BowlingAlleyPath:
; Room $9461, state $946E: PLM
    dw $0000

PLMPopulation_CrateriaKihunter:
; Room $948C, state $9499: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $17, $0F, RoomPLM_CrateriaKihunter_0)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $18, $0F, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $16, $0C, RoomPLM_CrateriaKihunter_2)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $17, $0C, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $18, $0C, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $19, $0C, $8000)
    %PLMPopEntry(PLMEntries_yellowDoorFacingLeft, $2E, $06, $000D)
    %PLMPopEntry(PLMEntries_yellowDoorFacingUp, $16, $2D, $000E)
    dw $0000

PLMPopulation_ForgottenHighwayElev:
; Room $94CC, state $94D9: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $08, $0D, RoomPLM_ForgottenHighwayElev_0)
    dw $0000

PLMPopulation_EastOcean:
; Room $94FD, state $950A: PLM
    dw $0000

PLMPopulation_ForgottenHighwayKagos:
; Room $9552, state $955F: PLM
    dw $0000

PLMPopulation_CrabMaze:
; Room $957D, state $958A: PLM
    dw $0000

PLMPopulation_ForgottenHighwayElbow:
; Room $95A8, state $95B5: PLM
    %PLMPopEntry(PLMEntries_yellowDoorFacingUp, $06, $0D, $000F)
    dw $0000

PLMPopulation_CrateriaTube:
; Room $95D4, state $95E1: PLM
    dw $0000

PLMPopulation_Moat:
; Room $95FF, state $960C: PLM
    %PLMPopEntry(PLMEntries_MissileTank, $0E, $09, $0004)
    dw $0000

PLMPopulation_RedBinstarElev:
; Room $962A, state $9637: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $08, $0D, RoomPLM_RedBinstarElev_0)
    %PLMPopEntry(PLMEntries_yellowDoorFacingDown, $06, $02, $0010)
    dw $0000

PLMPopulation_GauntletETank:
; Room $965B, state $9668: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $54, $0C, RoomPLM_GauntletETank_0)
    %PLMPopEntry(PLMEntries_EnergyTank, $53, $08, $0005)
    dw $0000

PLMPopulation_PreBowling:
; Room $968F, state $969C: PLM
    dw $0000

PLMPopulation_Climb_State_0_1:
; Room $96BA, state $96D1: PLM
; Room $96BA, state $96EB: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $1D, $05, RoomPLM_Climb_0)
    %PLMPopEntry(PLMEntries_ScrollPLM, $20, $05, RoomPLM_Climb_1)
    %PLMPopEntry(PLMEntries_ScrollPLM, $1D, $76, RoomPLM_Climb_2)
    %PLMPopEntry(PLMEntries_ScrollPLM, $20, $76, RoomPLM_Climb_3)
    %PLMPopEntry(PLMEntries_leftwardsExtension, $12, $85, $8000)
    %PLMPopEntry(PLMEntries_leftwardsExtension, $13, $85, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $14, $85, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $14, $86, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $14, $87, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $14, $88, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $14, $89, RoomPLM_Climb_A)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0F, $86, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0F, $87, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0F, $88, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $0F, $89, RoomPLM_Climb_E)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0D, $86, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0D, $87, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0D, $88, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $0D, $89, RoomPLM_Climb_12)
    %PLMPopEntry(PLMEntries_upwardsExtension, $08, $86, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $08, $87, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $08, $88, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $08, $89, RoomPLM_Climb_16)
    %PLMPopEntry(PLMEntries_greyDoorFacingLeft, $2E, $06, $9011)
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $86, $9012)
    %PLMPopEntry(PLMEntries_yellowDoorFacingLeft, $2E, $76, $0013)
    dw $0000

PLMPopulation_Climb_State2:
; Room $96BA, state $9705: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $1D, $05, RoomPLM_Climb_0)
    %PLMPopEntry(PLMEntries_ScrollPLM, $20, $05, RoomPLM_Climb_1)
    %PLMPopEntry(PLMEntries_ScrollPLM, $1D, $76, RoomPLM_Climb_2)
    %PLMPopEntry(PLMEntries_ScrollPLM, $20, $76, RoomPLM_Climb_3)
    %PLMPopEntry(PLMEntries_leftwardsExtension, $12, $85, $8000)
    %PLMPopEntry(PLMEntries_leftwardsExtension, $13, $85, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $14, $85, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $14, $86, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $14, $87, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $14, $88, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $14, $89, RoomPLM_Climb_A)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0F, $86, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0F, $87, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0F, $88, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $0F, $89, RoomPLM_Climb_E)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0D, $86, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0D, $87, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0D, $88, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $0D, $89, RoomPLM_Climb_12)
    %PLMPopEntry(PLMEntries_upwardsExtension, $08, $86, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $08, $87, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $08, $88, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $08, $89, RoomPLM_Climb_16)
    %PLMPopEntry(PLMEntries_SetsMetroidsClearedStatesWhenRequired, $08, $08, $000C)
    %PLMPopEntry(PLMEntries_greyDoorFacingLeft, $2E, $06, $9014)
    %PLMPopEntry(PLMEntries_greyDoorFacingLeft, $2E, $76, $9015)
    %PLMPopEntry(PLMEntries_greyDoorFacingLeft, $1E, $86, $9016)
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $86, $9017)
    dw $0000

PLMPopulation_Pit_0:
; Room $975C, state $976D: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $04, $0F, $97AB)
    %PLMPopEntry(PLMEntries_ScrollPLM, $06, $0F, RoomPLM_Pit_0_1)
    %PLMPopEntry(PLMEntries_ScrollPLM, $05, $09, RoomPLM_Pit_2)
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $06, $9018)
    dw $0000

PLMPopulation_Pit_1:
; Room $975C, state $9787: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $04, $0F, RoomPLM_Pit_0_1)
    %PLMPopEntry(PLMEntries_ScrollPLM, $06, $0F, RoomPLM_Pit_0_1)
    %PLMPopEntry(PLMEntries_ScrollPLM, $05, $09, RoomPLM_Pit_2)
    %PLMPopEntry(PLMEntries_greyDoorFacingLeft, $2E, $06, $0C19)
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $06, $0C1A)
    %PLMPopEntry(PLMEntries_MissileTank, $05, $1A, $0006)
    dw $0000

PLMPopulation_ElevToBlueBrinstar_State0_1:
; Room $97B5, state $97C6: PLM
; Room $97B5, state $97E0: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $07, $0D, RoomPLM_ElevToBlueBrinstar)
    dw $0000

PLMPopulation_BombTorizo_State0_1:
; Room $9804, state $981B: PLM
; Room $9804, state $9835: PLM
    %PLMPopEntry(PLMEntries_bombTorizoGreyDoor, $01, $06, $081B)
    %PLMPopEntry(PLMEntries_BombsChozoOrb, $0C, $0A, $0007)
    %PLMPopEntry(PLMEntries_BombTorizosCrumblingChozo, $0D, $0B, $0000)
    dw $0000

PLMPopulation_BombTorizo_State2:
; Room $9804, state $984F: PLM
    %PLMPopEntry(PLMEntries_SetsMetroidsClearedStatesWhenRequired, $08, $08, $000E)
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $06, $181C)
    dw $0000

PLMPopulation_Flyway_State0_1:
; Room $9879, state $9890: PLM
; Room $9879, state $98AA: PLM
    %PLMPopEntry(PLMEntries_redDoorFacingLeft, $2E, $06, $001D)
    dw $0000

PLMPopulation_Flyway_State2:
; Room $9879, state $98C4: PLM
    %PLMPopEntry(PLMEntries_SetsMetroidsClearedStatesWhenRequired, $08, $08, $0010)
    dw $0000

PLMPopulation_PreMapFlyway:
; Room $98E2, state $98EF: PLM
    dw $0000

PLMPopulation_Terminator:
; Room $990D, state $991A: PLM
    %PLMPopEntry(PLMEntries_EnergyTank, $07, $2A, $0008)
    dw $0000

PLMPopulation_GreenBrinstarElev:
; Room $9938, state $9945: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $07, $0D, RoomPLM_GreenBrinstarElev_0)
    dw $0000

PLMPopulation_LowerMushrooms:
; Room $9969, state $9976: PLM
    dw $0000

PLMPopulation_CrateriaMap:
; Room $9994, state $99A1: PLM
    %PLMPopEntry(PLMEntries_mapStation, $0B, $0A, $8000)
    dw $0000

PLMPopulation_GreenPiratesShaft:
; Room $99BD, state $99CA: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $07, $43, RoomPLM_GreenPiratesShaft_0)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $08, $43, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $09, $46, RoomPLM_GreenPiratesShaft_2)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $0A, $46, $8000)
    %PLMPopEntry(PLMEntries_MissileTank, $0D, $1B, $0009)
    %PLMPopEntry(PLMEntries_MissileTank, $02, $1B, $000A)
    %PLMPopEntry(PLMEntries_redDoorFacingLeft, $0E, $66, $001E)
    dw $0000

PLMPopulation_CrateriaSuper:
; Room $99F9, state $9A06: PLM
    %PLMPopEntry(PLMEntries_SuperMissileTank, $3B, $09, $000B)
    dw $0000

PLMPopulation_FinalMissileBombway_State0:
; Room $9A44, state $9A56: PLM
    dw $0000

PLMPopulation_FinalMissileBombway_State1:
; Room $9A44, state $9A70: PLM
    dw $0000

PLMPopulation_FinalMissile_State0:
; Room $9A90, state $9AA2: PLM
    dw $0000

PLMPopulation_FinalMissile_State1:
; Room $9A90, state $9ABC: PLM
    %PLMPopEntry(PLMEntries_MissileTank, $04, $07, $000C)
    dw $0000

PLMPopulation_GreenBrinstarMainShaft:
; Room $9AD9, state $9AE6: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $07, $71, RoomPLM_GreenBrinstarMainShaft_0)
    %PLMPopEntry(PLMEntries_ScrollPLM, $10, $A8, RoomPLM_GreenBrinstarMainShaft_1_2)
    %PLMPopEntry(PLMEntries_ScrollPLM, $21, $A8, RoomPLM_GreenBrinstarMainShaft_1_2)
    %PLMPopEntry(PLMEntries_ScrollPLM, $0D, $AC, RoomPLM_GreenBrinstarMainShaft_3)
    %PLMPopEntry(PLMEntries_elevatorPlatform, $06, $2C, $8000)
    %PLMPopEntry(PLMEntries_PowerBombTankChozoOrb, $3C, $7A, $000D)
    %PLMPopEntry(PLMEntries_redDoorFacingRight, $01, $56, $001F)
    %PLMPopEntry(PLMEntries_redDoorFacingRight, $01, $46, $0020)
    %PLMPopEntry(PLMEntries_redDoorFacingLeft, $0E, $46, $0021)
    %PLMPopEntry(PLMEntries_redDoorFacingLeft, $0E, $66, $0022)
    %PLMPopEntry(PLMEntries_redDoorFacingRight, $01, $66, $0023)
    %PLMPopEntry(PLMEntries_greyDoorFacingLeft, $0E, $76, $9024)
    dw $0000

PLMPopulation_SporeSpawnSuper:
; Room $9B5B, state $9B68: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $17, $0B, RoomPLM_SporeSpawnSuper_0)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $18, $0B, $8000)
    %PLMPopEntry(PLMEntries_SuperMissileTankChozoOrb, $1A, $87, $000E)
    dw $0000

PLMPopulation_BrinstarPreMap:
; Room $9B9D, state $9BAA: PLM
    %PLMPopEntry(PLMEntries_greyDoorFacingLeft, $2E, $06, $0C25)
    dw $0000

PLMPopulation_EarlySupers:
; Room $9BC8, state $9BD5: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $29, $0E, RoomPLM_EarlySupers_0_4)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $2A, $0E, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $2B, $0E, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $04, $13, RoomPLM_EarlySupers_3)
    %PLMPopEntry(PLMEntries_ScrollPLM, $04, $0F, RoomPLM_EarlySupers_0_4)
    %PLMPopEntry(PLMEntries_redDoorFacingLeft, $2E, $16, $0026)
    %PLMPopEntry(PLMEntries_MissileTank, $13, $1B, $000F)
    %PLMPopEntry(PLMEntries_SuperMissileTank, $04, $06, $0010)
    dw $0000

PLMPopulation_BrinstarReserveTank:
; Room $9C07, state $9C14: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $0E, $0B, RoomPLM_BrinstarReserveTank_0)
    %PLMPopEntry(PLMEntries_ReserveTankChozoOrb, $0B, $07, $0011)
    %PLMPopEntry(PLMEntries_MissileTankShotBlock, $1E, $07, $0012)
    %PLMPopEntry(PLMEntries_MissileTank, $19, $07, $0013)
    dw $0000

PLMPopulation_GreenBrinstarMap:
; Room $9C35, state $9C42: PLM
    %PLMPopEntry(PLMEntries_mapStation, $05, $0A, $8000)
    dw $0000

PLMPopulation_GreenBrinstarFirefleas:
; Room $9C5E, state $9C6B: PLM
    %PLMPopEntry(PLMEntries_greenDoorFacingRight, $01, $26, $0027)
    dw $0000

PLMPopulation_GreenBrinstarMissileRefill:
; Room $9C89, state $9C96: PLM
    %PLMPopEntry(PLMEntries_missileStation, $04, $0A, $0014)
    dw $0000

PLMPopulation_Dachora:
; Room $9CB3, state $9CC0: PLM
    %PLMPopEntry(PLMEntries_downwardsExtension, $45, $0E, $8000)
    %PLMPopEntry(PLMEntries_leftwardsExtension, $45, $0D, $8000)
    %PLMPopEntry(PLMEntries_leftwardsExtension, $46, $0D, $8000)
    %PLMPopEntry(PLMEntries_leftwardsExtension, $47, $0D, $8000)
    %PLMPopEntry(PLMEntries_leftwardsExtension, $48, $0D, $8000)
    %PLMPopEntry(PLMEntries_leftwardsExtension, $49, $0D, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $4A, $0D, RoomPLM_Dachora_6)
    %PLMPopEntry(PLMEntries_upwardsExtension, $40, $08, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $40, $09, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $40, $0A, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $40, $0B, RoomPLM_Dachora_A_16)
    %PLMPopEntry(PLMEntries_downwardsExtension, $4B, $0B, $8000)
    %PLMPopEntry(PLMEntries_downwardsExtension, $4B, $0A, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $4B, $09, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $4A, $09, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $49, $09, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $48, $09, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $47, $09, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $46, $09, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $45, $09, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $44, $09, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $44, $0A, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $44, $0B, RoomPLM_Dachora_A_16)
    dw $0000

PLMPopulation_BigPink:
; Room $9D19, state $9D26: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $2E, $6B, RoomPLM_BigPink_0)
    %PLMPopEntry(PLMEntries_ScrollPLM, $20, $7A, RoomPLM_BigPink_1)
    %PLMPopEntry(PLMEntries_ScrollPLM, $3D, $57, RoomPLM_BigPink_2)
    %PLMPopEntry(PLMEntries_ScrollPLM, $40, $57, RoomPLM_BigPink_3)
    %PLMPopEntry(PLMEntries_ScrollPLM, $1F, $08, RoomPLM_BigPink_4)
    %PLMPopEntry(PLMEntries_ScrollPLM, $21, $08, RoomPLM_BigPink_5)
    %PLMPopEntry(PLMEntries_MissileTank, $24, $32, $0015)
    %PLMPopEntry(PLMEntries_MissileTank, $22, $67, $0016)
    %PLMPopEntry(PLMEntries_ChargeBeamChozoOrb, $25, $76, $0017)
    %PLMPopEntry(PLMEntries_yellowDoorFacingLeft, $3E, $46, $0028)
    %PLMPopEntry(PLMEntries_greenDoorFacingLeft, $3E, $66, $0029)
    %PLMPopEntry(PLMEntries_redDoorFacingLeft, $3E, $06, $002A)
    %PLMPopEntry(PLMEntries_redDoorFacingRight, $01, $96, $002B)
    dw $0000

PLMPopulation_SporeSpawnKihunters:
; Room $9D9C, state $9DA9: PLM
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $06, $0C2C)
    %PLMPopEntry(PLMEntries_greyDoorFacingDown, $36, $03, $0C2D)
    dw $0000

PLMPopulation_SporeSpawn_State0_1:
; Room $9DC7, state $9DD9: PLM
; Room $9DC7, state $9DF3: PLM
    %PLMPopEntry(PLMEntries_greenDoorFacingUp, $06, $2E, $002E)
    dw $0000

PLMPopulation_PinkBrinstarPowerBombs:
; Room $9E11, state $9E1E: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $08, $0E, RoomPLM_PinkBrinstarPowerBombs_0)
    %PLMPopEntry(PLMEntries_ScrollPLM, $08, $0B, RoomPLM_PinkBrinstarPowerBombs_1)
    %PLMPopEntry(PLMEntries_greyDoorFacingLeft, $1E, $06, $0C2F)
    %PLMPopEntry(PLMEntries_PowerBombTank, $06, $17, $0018)
    dw $0000

PLMPopulation_GreenHillZone:
; Room $9E52, state $9E5F: PLM
    %PLMPopEntry(PLMEntries_downwardsClosedGate, $64, $37, $8000)
    %PLMPopEntry(PLMEntries_downwardsGateShotblock, $64, $37, $0000)
    %PLMPopEntry(PLMEntries_yellowDoorFacingLeft, $1E, $06, $0030)
    %PLMPopEntry(PLMEntries_MissileTank, $3D, $18, $0019)
    dw $0000

PLMPopulation_MorphBall_State0:
; Room $9E9F, state $9EB1: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $1F, $2B, RoomPLM_MorphBall_0)
    %PLMPopEntry(PLMEntries_upwardsExtension, $08, $23, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $08, $24, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $08, $25, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $08, $26, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $08, $27, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $08, $28, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $08, $29, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $08, $2A, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $08, $2B, RoomPLM_MorphBall_9)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $58, $21, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $57, $21, RoomPLM_MorphBall_B_D)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $58, $0A, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $57, $0A, RoomPLM_MorphBall_B_D)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $58, $26, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $57, $26, RoomPLM_MorphBall_F)
    %PLMPopEntry(PLMEntries_MorphBall, $45, $29, $001A)
    dw $0000

PLMPopulation_MorphBall_State1:
; Room $9E9F, state $9ECB: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $1F, $2B, RoomPLM_MorphBall_0)
    %PLMPopEntry(PLMEntries_upwardsExtension, $08, $23, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $08, $24, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $08, $25, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $08, $26, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $08, $27, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $08, $28, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $08, $29, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $08, $2A, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $08, $2B, RoomPLM_MorphBall_9)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $58, $21, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $57, $21, RoomPLM_MorphBall_B_D)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $58, $0A, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $57, $0A, RoomPLM_MorphBall_B_D)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $58, $26, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $57, $26, RoomPLM_MorphBall_F)
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $26, $0C31)
    %PLMPopEntry(PLMEntries_PowerBombTank, $28, $2A, $001B)
    dw $0000

PLMPopulation_ConstructionZone_State0_1:
; Room $9F11, state $9F23: PLM
; Room $9F11, state $9F3D: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $04, $0B, RoomPLM_ConstructionZone_0)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $05, $0B, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $06, $0B, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $07, $0B, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $08, $0B, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $09, $0B, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $0A, $0B, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $0B, $0B, $8000)
    %PLMPopEntry(PLMEntries_redDoorFacingLeft, $0E, $06, $0032)
    dw $0000

PLMPopulation_BlueBrinstarETank_State0_1:
; Room $9F64, state $9F76: PLM
; Room $9F64, state $9F90: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $27, $0B, RoomPLM_BlueBrinstarETank_0_1)
    %PLMPopEntry(PLMEntries_ScrollPLM, $27, $26, RoomPLM_BlueBrinstarETank_0_1)
    %PLMPopEntry(PLMEntries_MissileTank, $2E, $29, $001C)
    %PLMPopEntry(PLMEntries_EnergyTankShotBlock, $1C, $22, $001D)
    dw $0000

PLMPopulation_NoobBridge:
; Room $9FBA, state $9FC7: PLM
    %PLMPopEntry(PLMEntries_greenDoorFacingLeft, $5E, $06, $0033)
    dw $0000

PLMPopulation_GreenBrinstarBeetoms:
; Room $9FE5, state $9FF2: PLM
    dw $0000

PLMPopulation_EtecoonETank:
; Room $A011, state $A01E: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $07, $0B, RoomPLM_EtecoonETank_0)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $08, $0B, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $09, $0B, $8000)
    %PLMPopEntry(PLMEntries_EnergyTank, $05, $09, $001E)
    %PLMPopEntry(PLMEntries_greenDoorFacingRight, $01, $06, $0034)
    dw $0000

PLMPopulation_EtecoonSuper:
; Room $A051, state $A05E: PLM
    %PLMPopEntry(PLMEntries_SuperMissileTank, $07, $09, $001F)
    dw $0000

PLMPopulation_DachoraEnergyRefill:
; Room $A07B, state $A088: PLM
    %PLMPopEntry(PLMEntries_energyStation, $04, $0A, $0020)
    dw $0000

PLMPopulation_SporeSpawnFarming:
; Room $A0A4, state $A0B1: PLM
    %PLMPopEntry(PLMEntries_greenDoorFacingRight, $01, $06, $0035)
    dw $0000

PLMPopulation_WaterwayETank:
; Room $A0D2, state $A0DF: PLM
    %PLMPopEntry(PLMEntries_upwardsExtension, $0F, $09, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0F, $0A, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $0F, $0B, RoomPLM_WaterwayETank)
    %PLMPopEntry(PLMEntries_EnergyTank, $04, $09, $0021)
    dw $0000

PLMPopulation_FirstMissile:
; Room $A107, state $A114: PLM
    %PLMPopEntry(PLMEntries_MissileTankChozoOrb, $04, $07, $0022)
    dw $0000

PLMPopulation_PinkBrinstarHoppers:
; Room $A130, state $A13D: PLM
    %PLMPopEntry(PLMEntries_downwardsClosedGate, $11, $04, $8000)
    %PLMPopEntry(PLMEntries_downwardsGateShotblock, $11, $04, $0002)
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $16, $0C36)
    %PLMPopEntry(PLMEntries_greyDoorFacingLeft, $1E, $16, $0C37)
    dw $0000

PLMPopulation_HopperETank:
; Room $A15B, state $A168: PLM
    %PLMPopEntry(PLMEntries_EnergyTank, $0B, $09, $0023)
    dw $0000

PLMPopulation_BigPinkSaveRoom:
; Room $A184, state $A191: PLM
    %PLMPopEntry(PLMEntries_saveStation, $05, $0B, $0000)
    dw $0000

PLMPopulation_BlueBrinstarBoulders:
    dw $0000
; Room $A1AD, state $A1BA: PLM

PLMPopulation_BillyMays:
; Room $A1D8, state $A1E5: PLM
    %PLMPopEntry(PLMEntries_MissileTank, $07, $09, $0024)
    %PLMPopEntry(PLMEntries_MissileTankShotBlock, $05, $0C, $0025)
    dw $0000

PLMPopulation_GreenBrinstarSave:
; Room $A201, state $A20E: PLM
    %PLMPopEntry(PLMEntries_saveStation, $05, $0B, $0001)
    dw $0000

PLMPopulation_EtecoonSave:
; Room $A22A, state $A237: PLM
    %PLMPopEntry(PLMEntries_saveStation, $05, $0B, $0002)
    dw $0000

PLMPopulation_RedTower:
; Room $A253, state $A260: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $09, $6A, RoomPLM_RedTower_0)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $0A, $6A, $8000)
    %PLMPopEntry(PLMEntries_greenDoorFacingRight, $01, $96, $0038)
    %PLMPopEntry(PLMEntries_yellowDoorFacingRight, $01, $66, $0039)
    dw $0000

PLMPopulation_RedBrinstarFirefleas:
; Room $A293, state $A2A0: PLM
    %PLMPopEntry(PLMEntries_redDoorFacingRight, $01, $06, $003A)
    dw $0000

PLMPopulation_XrayScope:
; Room $A2CE, state $A2DB: PLM
    %PLMPopEntry(PLMEntries_XrayScopeChozoOrb, $05, $07, $0026)
    dw $0000

PLMPopulation_Hellway:
; Room $A2F7, state $A304: PLM
    dw $0000

PLMPopulation_Caterpillar:
; Room $A322, state $A32F: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $05, $5E, RoomPLM_Caterpillar_0)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $06, $5E, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $10, $37, RoomPLM_Caterpillar_2)
    %PLMPopEntry(PLMEntries_ScrollPLM, $0D, $37, RoomPLM_Caterpillar_3)
    %PLMPopEntry(PLMEntries_elevatorPlatform, $06, $2C, $8000)
    %PLMPopEntry(PLMEntries_downwardsClosedGate, $26, $35, $8000)
    %PLMPopEntry(PLMEntries_downwardsGateShotblock, $26, $35, $000A)
    %PLMPopEntry(PLMEntries_greenDoorFacingRight, $01, $36, $003B)
    %PLMPopEntry(PLMEntries_yellowDoorFacingRight, $01, $56, $003C)
    %PLMPopEntry(PLMEntries_greenDoorFacingRight, $01, $76, $003D)
    dw $0000

PLMPopulation_BetaPowerBomb:
; Room $A37C, state $A389: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $07, $0E, RoomPLM_BetaPowerBomb_0)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $08, $0E, $8000)
    %PLMPopEntry(PLMEntries_PowerBombTank, $04, $13, $0027)
    %PLMPopEntry(PLMEntries_greyDoorFacingLeft, $1E, $06, $0C3E)
    dw $0000

PLMPopulation_AlphaPowerBomb:
; Room $A3AE, state $A3BB: PLM
    %PLMPopEntry(PLMEntries_upwardsExtension, $0F, $04, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0F, $05, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0F, $06, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0F, $07, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0F, $08, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0F, $09, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0F, $0A, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0F, $0B, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $0F, $0C, RoomPLM_AlphaPowerBomb_8)
    %PLMPopEntry(PLMEntries_PowerBombTankChozoOrb, $14, $09, $0028)
    %PLMPopEntry(PLMEntries_MissileTank, $02, $08, $0029)
    dw $0000

PLMPopulation_SkreeBoost:
; Room $A3DD, state $A3EA: PLM
    dw $0000

PLMPopulation_BelowSpazer:
; Room $A408, state $A415: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $10, $11, RoomPLM_BelowSpazer_0_8_A)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $11, $11, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $12, $11, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $13, $11, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $10, $14, RoomPLM_BelowSpazer_4_9_B)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $11, $14, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $12, $14, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $13, $14, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $08, $11, RoomPLM_BelowSpazer_0_8_A)
    %PLMPopEntry(PLMEntries_ScrollPLM, $08, $14, RoomPLM_BelowSpazer_4_9_B)
    %PLMPopEntry(PLMEntries_ScrollPLM, $02, $11, RoomPLM_BelowSpazer_0_8_A)
    %PLMPopEntry(PLMEntries_ScrollPLM, $02, $14, RoomPLM_BelowSpazer_4_9_B)
    %PLMPopEntry(PLMEntries_greenDoorFacingLeft, $1E, $06, $003F)
    dw $0000

PLMPopulation_Spazer:
; Room $A447, state $A454: PLM
    %PLMPopEntry(PLMEntries_SpazerChozoOrb, $0B, $09, $002A)
    dw $0000

PLMPopulation_WarehouseZeela:
; Room $A471, state $A47E: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $02, $0B, RoomPLM_WarehouseZeela_0)
    %PLMPopEntry(PLMEntries_ScrollPLM, $02, $19, RoomPLM_WarehouseZeela_1_3)
    %PLMPopEntry(PLMEntries_ScrollPLM, $07, $19, RoomPLM_WarehouseZeela_2)
    %PLMPopEntry(PLMEntries_ScrollPLM, $15, $19, RoomPLM_WarehouseZeela_1_3)
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $16, $0040)
    dw $0000

PLMPopulation_WarehouseETank:
; Room $A4B1, state $A4BE: PLM
    %PLMPopEntry(PLMEntries_greyDoorFacingLeft, $0E, $06, $0C41)
    %PLMPopEntry(PLMEntries_EnergyTankShotBlock, $05, $04, $002B)
    dw $0000

PLMPopulation_WarehouseKihunter:
; Room $A4DA, state $A4E7: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $17, $0B, RoomPLM_WarehouseKihunter_0)
    %PLMPopEntry(PLMEntries_ScrollPLM, $17, $0E, RoomPLM_WarehouseKihunter_1)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0B, $04, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0B, $05, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0B, $06, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0B, $07, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0B, $08, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0B, $09, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0B, $0A, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $0B, $0B, RoomPLM_WarehouseKihunter_9)
    %PLMPopEntry(PLMEntries_ScrollPLM, $27, $0C, RoomPLM_WarehouseKihunter_A_B)
    %PLMPopEntry(PLMEntries_ScrollPLM, $2E, $0C, RoomPLM_WarehouseKihunter_A_B)
    %PLMPopEntry(PLMEntries_MissileTankShotBlock, $2E, $08, $002C)
    dw $0000

PLMPopulation_MiniKraid_State0_1:
; Room $A521, state $A533: PLM
; Room $A521, state $A54D: PLM
    %PLMPopEntry(PLMEntries_greyDoorFacingLeft, $5E, $06, $0C42)
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $06, $0C43)
    dw $0000

PLMPopulation_KraidEyeDoor:
; Room $A56B, state $A578: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $03, $12, RoomPLM_KraidEyeDoor_0)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $04, $12, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $05, $12, $8000)
    %PLMPopEntry(PLMEntries_greenDoorFacingLeft, $0E, $06, $0044)
    %PLMPopEntry(PLMEntries_EyeDoorFacingLeft, $1E, $16, $0045)
    %PLMPopEntry(PLMEntries_EyeDoorBottomFacingLeft, $1E, $19, $0045)
    %PLMPopEntry(PLMEntries_EyeDoorEyeFacingLeft, $1E, $17, $0045)
    dw $0000

PLMPopulation_Kraid_State0_1:
; Room $A59F, state $A5B1: PLM
; Room $A59F, state $A5CB: PLM
    %PLMPopEntry(PLMEntries_greyDoorFacingLeft, $1E, $16, $0046)
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $16, $0047)
    dw $0000

PLMPopulation_StatuesHallway:
; Room $A5ED, state $A5FA: PLM
    dw $0000

PLMPopulation_RedTowerRefill:
; Room $A618, state $A625: PLM
    %PLMPopEntry(PLMEntries_energyStation, $04, $0A, $002D)
    dw $0000

PLMPopulation_KraidRefill:
; Room $A641, state $A64E: PLM
    %PLMPopEntry(PLMEntries_missileStation, $09, $0A, $002E)
    %PLMPopEntry(PLMEntries_energyStation, $07, $0A, $002F)
    dw $0000

PLMPopulation_Statues:
; Room $A66A, state $A677: PLM
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $06, $9448)
    dw $0000

PLMPopulation_WarehouseEntrance:
; Room $A6A1, state $A6AE: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $07, $0C, RoomPLM_WarehouseEntrance_0)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $08, $0C, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $10, $09, RoomPLM_WarehouseEntrance_2)
    %PLMPopEntry(PLMEntries_upwardsExtension, $10, $08, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $10, $07, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $12, $09, RoomPLM_WarehouseEntrance_5)
    %PLMPopEntry(PLMEntries_upwardsExtension, $12, $08, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $12, $07, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $12, $06, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $13, $0B, RoomPLM_WarehouseEntrance_9)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $14, $0B, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $14, $0A, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $14, $09, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $14, $08, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $14, $07, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $14, $06, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $14, $05, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $14, $04, $8000)
    dw $0000

PLMPopulation_VariaSuit:
; Room $A6E2, state $A6EF: PLM
    %PLMPopEntry(PLMEntries_VariaSuitChozoOrb, $07, $09, $0030)
    dw $0000

PLMPopulation_WarehouseSave:
; Room $A70B, state $A718: PLM
    %PLMPopEntry(PLMEntries_saveStation, $07, $0B, $0003)
    dw $0000

PLMPopulation_RedBrinstarSave:
; Room $A734, state $A741: PLM
    %PLMPopEntry(PLMEntries_saveStation, $07, $0B, $0004)
    dw $0000

PLMPopulation_IceBeamAcid:
; Room $A75D, state $A76A: PLM
    dw $0000

PLMPopulation_Cathedral:
; Room $A788, state $A795: PLM
    %PLMPopEntry(PLMEntries_MissileTankShotBlock, $22, $1C, $0031)
    %PLMPopEntry(PLMEntries_greenDoorFacingLeft, $2E, $16, $0049)
    dw $0000

PLMPopulation_CathedralEntrance:
; Room $A7B3, state $A7C0: PLM
    %PLMPopEntry(PLMEntries_redDoorFacingLeft, $2E, $06, $004A)
    dw $0000

PLMPopulation_BusinessCenter:
; Room $A7DE, state $A7EB: PLM
    %PLMPopEntry(PLMEntries_elevatorPlatform, $06, $2C, $8000)
    %PLMPopEntry(PLMEntries_greenDoorFacingRight, $01, $36, $004B)
    %PLMPopEntry(PLMEntries_yellowDoorFacingRight, $01, $46, $004C)
    %PLMPopEntry(PLMEntries_redDoorFacingRight, $01, $56, $004D)
    dw $0000

PLMPopulation_IceBeamGate:
; Room $A815, state $A822: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $37, $2D, RoomPLM_IceBeamGate_0)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $38, $2D, $8000)
    dw $0000

PLMPopulation_IceBeamTutorial:
; Room $A865, state $A872: PLM
    dw $0000

PLMPopulation_IceBeam:
; Room $A890, state $A89D: PLM
    %PLMPopEntry(PLMEntries_IceBeamChozoOrb, $0C, $07, $0032)
    dw $0000

PLMPopulation_IceBeamSnake:
; Room $A8B9, state $A8C6: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $0F, $17, RoomPLM_IceBeamSnake_0)
    %PLMPopEntry(PLMEntries_ScrollPLM, $0D, $17, RoomPLM_IceBeamSnake_1)
    %PLMPopEntry(PLMEntries_ScrollPLM, $11, $17, RoomPLM_IceBeamSnake_2)
    %PLMPopEntry(PLMEntries_ScrollPLM, $13, $17, RoomPLM_IceBeamSnake_3)
    dw $0000

PLMPopulation_CrumbleShaft:
; Room $A8F8, state $A905: PLM
    %PLMPopEntry(PLMEntries_MissileTankShotBlock, $01, $08, $0033)
    dw $0000

PLMPopulation_CrocomireSpeedway:
; Room $A923, state $A930: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $9E, $28, RoomPLM_CrocomireSpeedway_0)
    %PLMPopEntry(PLMEntries_upwardsExtension, $9E, $27, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $9E, $26, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $9E, $25, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $9E, $24, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $BE, $29, RoomPLM_CrocomireSpeedway_5)
    %PLMPopEntry(PLMEntries_upwardsExtension, $BE, $28, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $BE, $27, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $C2, $29, RoomPLM_CrocomireSpeedway_8)
    %PLMPopEntry(PLMEntries_upwardsExtension, $C2, $28, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $C2, $27, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $C2, $26, $8000)
    %PLMPopEntry(PLMEntries_greenDoorFacingUp, $C6, $2D, $004E)
    dw $0000

PLMPopulation_Crocomire_State0_1:
; Room $A98D, state $A99F: PLM
; Room $A98D, state $A9B9: PLM
    %PLMPopEntry(PLMEntries_greyDoorFacingDown, $36, $02, $044F)
    %PLMPopEntry(PLMEntries_EnergyTank, $7D, $06, $0034)
    dw $0000

PLMPopulation_HiJumpBoots:
; Room $A9E5, state $A9F2: PLM
    %PLMPopEntry(PLMEntries_HiJumpBootsChozoOrb, $03, $0A, $0035)
    dw $0000

PLMPopulation_CrocomireEscape:
; Room $AA0E, state $AA1B: PLM
    %PLMPopEntry(PLMEntries_downwardsClosedGate, $06, $05, $8000)
    %PLMPopEntry(PLMEntries_downwardsGateShotblock, $06, $05, $000A)
    %PLMPopEntry(PLMEntries_MissileTank, $0D, $09, $0036)
    dw $0000

PLMPopulation_HiJumpETank:
; Room $AA41, state $AA4E: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $10, $0C, RoomPLM_HiJumpETank_0)
    %PLMPopEntry(PLMEntries_ScrollPLM, $0F, $05, RoomPLM_HiJumpETank_1)
    %PLMPopEntry(PLMEntries_ScrollPLM, $08, $1C, RoomPLM_HiJumpETank_2)
    %PLMPopEntry(PLMEntries_ScrollPLM, $0B, $12, RoomPLM_HiJumpETank_3)
    %PLMPopEntry(PLMEntries_greyDoorFacingLeft, $1E, $06, $0C50)
    %PLMPopEntry(PLMEntries_MissileTank, $09, $06, $0037)
    %PLMPopEntry(PLMEntries_EnergyTank, $17, $08, $0038)
    dw $0000

PLMPopulation_PostCrocFarming:
; Room $AA82, state $AA8F: PLM
    %PLMPopEntry(PLMEntries_redDoorFacingRight, $01, $06, $0051)
    dw $0000

PLMPopulation_PostCrocSave:
; Room $AAB5, state $AAC2: PLM
    %PLMPopEntry(PLMEntries_saveStation, $07, $0B, $0000)
    dw $0000

PLMPopulation_PostCrocPowerBombs:
; Room $AADE, state $AAEB: PLM
    %PLMPopEntry(PLMEntries_PowerBombTank, $07, $08, $0039)
    dw $0000

PLMPopulation_PostCrocShaft:
; Room $AB07, state $AB14: PLM
    %PLMPopEntry(PLMEntries_redDoorFacingLeft, $0E, $36, $0052)
    dw $0000

PLMPopulation_PostCrocMissile:
; Room $AB3B, state $AB48: PLM
    %PLMPopEntry(PLMEntries_MissileTank, $3C, $09, $003A)
    dw $0000

PLMPopulation_GrappleTutorial3:
; Room $AB64, state $AB71: PLM
    %PLMPopEntry(PLMEntries_downwardsClosedGate, $2A, $05, $8000)
    %PLMPopEntry(PLMEntries_downwardsGateShotblock, $2A, $05, $0008)
    dw $0000

PLMPopulation_PostCrocJump:
; Room $AB8F, state $AB9C: PLM
    %PLMPopEntry(PLMEntries_MissileTank, $43, $09, $003B)
    dw $0000

PLMPopulation_GrappleTutorial2:
; Room $ABD2, state $ABDF: PLM
    dw $0000

PLMPopulation_GrappleTutorial1:
; Room $AC00, state $AC0D: PLM
    dw $0000

PLMPopulation_GrappleBeam:
; Room $AC2B, state $AC38: PLM
    %PLMPopEntry(PLMEntries_GrappleBeamChozoOrb, $04, $27, $003C)
    dw $0000

PLMPopulation_NorfairReserveTank:
; Room $AC5A, state $AC67: PLM
    %PLMPopEntry(PLMEntries_ReserveTankChozoOrb, $02, $07, $003D)
    %PLMPopEntry(PLMEntries_MissileTankShotBlock, $07, $0B, $003E)
    dw $0000

PLMPopulation_GreenBubblesMissiles:
; Room $AC83, state $AC90: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $10, $05, RoomPLM_GreenBubblesMissiles_0)
    %PLMPopEntry(PLMEntries_MissileTank, $14, $0A, $003F)
    dw $0000

PLMPopulation_BubbleMountain:
; Room $ACB3, state $ACC0: PLM
    %PLMPopEntry(PLMEntries_greenDoorFacingRight, $01, $06, $0053)
    %PLMPopEntry(PLMEntries_greenDoorFacingLeft, $1E, $06, $0054)
    %PLMPopEntry(PLMEntries_MissileTank, $14, $3C, $0040)
    dw $0000

PLMPopulation_SpeedBoosterHall:
; Room $ACF0, state $ACFD: PLM
    %PLMPopEntry(PLMEntries_SpeedBoosterEscape, $00, $00, $8000)
    %PLMPopEntry(PLMEntries_MissileTankShotBlock, $BC, $13, $0041)
    %PLMPopEntry(PLMEntries_redDoorFacingLeft, $BE, $16, $0055)
    dw $0000

PLMPopulation_SpeedBooster:
; Room $AD1B, state $AD28: PLM
    %PLMPopEntry(PLMEntries_SpeedBoosterChozoOrb, $0B, $06, $0042)
    dw $0000

PLMPopulation_SingleChamber:
; Room $AD5E, state $AD6B: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $0D, $08, RoomPLM_SingleChamber_0)
    %PLMPopEntry(PLMEntries_ScrollPLM, $10, $08, RoomPLM_SingleChamber_1_4)
    %PLMPopEntry(PLMEntries_upwardsExtension, $4D, $0A, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $4D, $0B, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $4D, $0C, RoomPLM_SingleChamber_1_4)
    %PLMPopEntry(PLMEntries_redDoorFacingLeft, $0E, $16, $0056)
    dw $0000

PLMPopulation_DoubleChamber:
; Room $ADAD, state $ADBA: PLM
    %PLMPopEntry(PLMEntries_downwardsClosedGate, $1A, $05, $8000)
    %PLMPopEntry(PLMEntries_downwardsGateShotblock, $1A, $05, $0000)
    %PLMPopEntry(PLMEntries_MissileTank, $1F, $09, $0043)
    %PLMPopEntry(PLMEntries_redDoorFacingLeft, $3E, $06, $0057)
    dw $0000

PLMPopulation_WaveBeam:
; Room $ADDE, state $ADEB: PLM
    %PLMPopEntry(PLMEntries_WaveBeamChozoOrb, $0B, $06, $0044)
    dw $0000

PLMPopulation_SpikyPlatformsTunnel:
; Room $AE07, state $AE14: PLM
    dw $0000

PLMPopulation_Volcano:
; Room $AE32, state $AE3F: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $20, $29, RoomPLM_Volcano_0)
    %PLMPopEntry(PLMEntries_ScrollPLM, $1F, $29, RoomPLM_Volcano_1)
    %PLMPopEntry(PLMEntries_upwardsExtension, $19, $24, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $19, $25, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $19, $26, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $19, $27, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $19, $28, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $19, $29, RoomPLM_Volcano_7)
    %PLMPopEntry(PLMEntries_upwardsExtension, $26, $26, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $26, $27, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $26, $28, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $26, $29, RoomPLM_Volcano_B)
    dw $0000

PLMPopulation_KronicBoost:
; Room $AE74, state $AE81: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $0F, $17, RoomPLM_KronicBoost_0)
    %PLMPopEntry(PLMEntries_ScrollPLM, $11, $17, RoomPLM_KronicBoost_1)
    %PLMPopEntry(PLMEntries_upwardsExtension, $08, $15, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $08, $16, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $08, $17, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $08, $18, RoomPLM_KronicBoost_5)
    %PLMPopEntry(PLMEntries_downwardsClosedGate, $07, $14, $8000)
    %PLMPopEntry(PLMEntries_downwardsGateShotblock, $07, $14, $0000)
    %PLMPopEntry(PLMEntries_yellowDoorFacingRight, $11, $26, $0058)
    dw $0000

PLMPopulation_MagdolliteTunnel:
; Room $AEB4, state $AEC1: PLM
    dw $0000

PLMPopulation_PurpleShaft:
; Room $AEDF, state $AEEC: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $02, $0B, RoomPLM_PurpleShaft_0_3)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $03, $0B, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $04, $0B, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $0B, $0B, RoomPLM_PurpleShaft_0_3)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $0C, $0B, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $0D, $0B, $8000)
    dw $0000

PLMPopulation_LavaDive:
; Room $AF14, state $AF21: PLM
    dw $0000

PLMPopulation_LowerNorfairElev:
; Room $AF3F, state $AF4C: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $08, $0B, RoomPLM_LowerNorfairElev_0)
    dw $0000

PLMPopulation_UpperNorfairFarming:
; Room $AF72, state $AF7F: PLM
    %PLMPopEntry(PLMEntries_downwardsClosedGate, $06, $15, $8000)
    %PLMPopEntry(PLMEntries_downwardsGateShotblock, $06, $15, $0000)
    dw $0000

PLMPopulation_RisingTide:
; Room $AFA3, state $AFB0: PLM
    dw $0000

PLMPopulation_AcidSnakesTunnel:
; Room $AFCE, state $AFDB: PLM
    dw $0000

PLMPopulation_SpikyAcidSnakesTunnel:
; Room $AFFB, state $B008: PLM
    dw $0000

PLMPopulation_UpperNorfairRefill:
; Room $B026, state $B033: PLM
    %PLMPopEntry(PLMEntries_energyStation, $07, $0A, $0045)
    dw $0000

PLMPopulation_PurpleFarming:
; Room $B051, state $B05E: PLM
    dw $0000

PLMPopulation_BatCave:
; Room $B07A, state $B087: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $09, $0C, RoomPLM_BatCave_0)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $0A, $0C, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $09, $10, RoomPLM_BatCave_2)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $0A, $10, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $06, $13, RoomPLM_BatCave_4)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $07, $13, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $08, $13, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $09, $13, $8000)
    dw $0000

PLMPopulation_NorfairMap:
; Room $B0B4, state $B0C1: PLM
    %PLMPopEntry(PLMEntries_mapStation, $05, $0A, $8000)
    dw $0000

PLMPopulation_BubbleMountainSave:
; Room $B0DD, state $B0EA: PLM
    %PLMPopEntry(PLMEntries_saveStation, $05, $0B, $0001)
    dw $0000

PLMPopulation_FrogSpeedway:
; Room $B106, state $B113: PLM
    dw $0000

PLMPopulation_RedPirateShaft:
; Room $B139, state $B146: PLM
    dw $0000

PLMPopulation_FrogSave:
; Room $B167, state $B174: PLM
    %PLMPopEntry(PLMEntries_saveStation, $07, $0B, $0002)
    dw $0000

PLMPopulation_CrocomireSave:
; Room $B192, state $B19F: PLM
    %PLMPopEntry(PLMEntries_saveStation, $07, $0B, $0003)
    dw $0000

PLMPopulation_LNElevSave:
; Room $B1BB, state $B1C8: PLM
    %PLMPopEntry(PLMEntries_saveStation, $05, $0B, $0004)
    dw $0000

PLMPopulation_AcidStatue:
; Room $B1E5, state $B1F2: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $0C, $1E, RoomPLM_AcidStatue_0)
    %PLMPopEntry(PLMEntries_ScrollPLM, $0C, $23, RoomPLM_AcidStatue_1)
    dw $0000

PLMPopulation_MainHall:
; Room $B236, state $B243: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $47, $08, RoomPLM_MainHall_0_2)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $48, $08, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $47, $23, RoomPLM_MainHall_0_2)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $48, $23, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $47, $29, RoomPLM_MainHall_4)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $48, $29, $8000)
    %PLMPopEntry(PLMEntries_elevatorPlatform, $46, $2A, $8000)
    dw $0000

PLMPopulation_GoldenTorizo_State0_1:
; Room $B283, state $B295: PLM
; Room $B283, state $B2AF: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $04, $0C, RoomPLM_GoldenTorizo_0)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $05, $0C, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $06, $0C, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $07, $0C, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $08, $0C, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $09, $0C, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $0A, $0C, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $0B, $0C, $8000)
    %PLMPopEntry(PLMEntries_MissileTank, $0D, $08, $0046)
    %PLMPopEntry(PLMEntries_SuperMissileTankShotBlock, $15, $08, $0047)
    %PLMPopEntry(PLMEntries_greyDoorFacingLeft, $1E, $16, $0859)
    dw $0000

PLMPopulation_FastRipper:
; Room $B2DA, state $B2E7: PLM
    %PLMPopEntry(PLMEntries_downwardsClosedGate, $34, $05, $8000)
    %PLMPopEntry(PLMEntries_downwardsGateShotblock, $34, $05, $0008)
    dw $0000

PLMPopulation_GTEnergyRefill:
; Room $B305, state $B312: PLM
    %PLMPopEntry(PLMEntries_energyStation, $08, $0A, $0048)
    dw $0000

PLMPopulation_Ridley_State0_1:
; Room $B32E, state $B340: PLM
; Room $B32E, state $B35A: PLM
    %PLMPopEntry(PLMEntries_greyDoorFacingLeft, $0E, $06, $005A)
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $16, $005B)
    dw $0000

PLMPopulation_LNFarming:
; Room $B37A, state $B387: PLM
    %PLMPopEntry(PLMEntries_EyeDoorFacingRight, $01, $06, $005C)
    %PLMPopEntry(PLMEntries_EyeDoorBottomFacingRight, $01, $09, $005C)
    %PLMPopEntry(PLMEntries_EyeDoorEyeFacingRight, $01, $07, $005C)
    dw $0000

PLMPopulation_FastPillarsSetup:
; Room $B3A5, state $B3B2: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $07, $21, RoomPLM_FastPillarsSetup_0)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $08, $21, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $07, $1B, RoomPLM_FastPillarsSetup_2)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $08, $1B, $8000)
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_PLMPopulation_8FB3EE:
; Room $B3E1, state $B3EE: PLM
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED

PLMPopulation_MickeyMouse:
; Room $B40A, state $B417: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $30, $16, RoomPLM_MickeyMouse_0)
    %PLMPopEntry(PLMEntries_ScrollPLM, $32, $16, RoomPLM_MickeyMouse_1)
    %PLMPopEntry(PLMEntries_ScrollPLM, $2D, $16, RoomPLM_MickeyMouse_2)
    %PLMPopEntry(PLMEntries_upwardsExtension, $2B, $14, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $2B, $15, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $2B, $16, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $2B, $17, RoomPLM_MickeyMouse_6)
    %PLMPopEntry(PLMEntries_upwardsExtension, $38, $36, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $38, $37, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $38, $38, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $38, $39, RoomPLM_MickeyMouse_A)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $3D, $34, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $3C, $34, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $3B, $34, RoomPLM_MickeyMouse_D)
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $36, $0C5D)
    %PLMPopEntry(PLMEntries_MissileTank, $27, $1B, $0049)
    dw $0000

PLMPopulation_Pillar:
; Room $B457, state $B464: PLM
    dw $0000

PLMPopulation_Plowerhouse:
; Room $B482, state $B48F: PLM
    dw $0000

PLMPopulation_WorstRoomInTheGame:
; Room $B4AD, state $B4BA: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $03, $10, RoomPLM_WorstRoomInTheGame_0)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $04, $10, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $05, $10, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $06, $10, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $07, $10, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $08, $10, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $09, $10, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $0A, $10, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $0B, $10, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $0C, $10, $8000)
    dw $0000

PLMPopulation_Amphitheatre:
; Room $B4E5, state $B4F2: PLM
    dw $0000

PLMPopulation_LNSpringBallMaze:
; Room $B510, state $B51D: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $0C, $09, RoomPLM_LNSpringBallMaze_0)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0C, $08, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0C, $07, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0C, $06, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $03, $12, RoomPLM_LNSpringBallMaze_4)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $04, $12, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $05, $12, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $06, $12, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $07, $12, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $08, $12, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $09, $12, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $0A, $12, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $2F, $03, RoomPLM_LNSpringBallMaze_C)
    %PLMPopEntry(PLMEntries_MissileTank, $2B, $07, $004A)
    dw $0000

PLMPopulation_LNEscapePowerBombs:
; Room $B55A, state $B567: PLM
    %PLMPopEntry(PLMEntries_PowerBombTank, $0C, $08, $004B)
    dw $0000

PLMPopulation_RedKihunterShaft:
; Room $B585, state $B592: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $11, $48, RoomPLM_RedKihunterShaft_0_4)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $09, $46, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $08, $46, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $08, $47, RoomPLM_RedKihunterShaft_3_5)
    %PLMPopEntry(PLMEntries_ScrollPLM, $1F, $48, RoomPLM_RedKihunterShaft_0_4)
    %PLMPopEntry(PLMEntries_ScrollPLM, $24, $48, RoomPLM_RedKihunterShaft_3_5)
    %PLMPopEntry(PLMEntries_ScrollPLM, $06, $0E, RoomPLM_RedKihunterShaft_6)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $07, $0E, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $08, $0E, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $09, $0E, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $06, $0B, RoomPLM_RedKihunterShaft_A)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $07, $0B, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $08, $0B, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $09, $0B, $8000)
    %PLMPopEntry(PLMEntries_yellowDoorFacingUp, $26, $4D, $005E)
    dw $0000

PLMPopulation_Wasteland:
; Room $B5D5, state $B5E2: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $17, $0D, RoomPLM_Wasteland_0)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $18, $0D, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $15, $08, RoomPLM_Wasteland_2)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $16, $08, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $17, $08, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $18, $08, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $19, $08, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $1A, $08, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $4F, $09, RoomPLM_Wasteland_8_C)
    %PLMPopEntry(PLMEntries_ScrollPLM, $51, $09, RoomPLM_Wasteland_9_B)
    %PLMPopEntry(PLMEntries_ScrollPLM, $0F, $0B, RoomPLM_Wasteland_A)
    %PLMPopEntry(PLMEntries_ScrollPLM, $3C, $09, RoomPLM_Wasteland_9_B)
    %PLMPopEntry(PLMEntries_ScrollPLM, $3F, $09, RoomPLM_Wasteland_8_C)
    %PLMPopEntry(PLMEntries_ScrollPLM, $14, $07, RoomPLM_Wasteland_D)
    %PLMPopEntry(PLMEntries_upwardsExtension, $14, $06, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $14, $05, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $14, $04, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $09, $09, RoomPLM_Wasteland_11)
    %PLMPopEntry(PLMEntries_upwardsExtension, $09, $08, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $09, $07, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $09, $06, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $09, $05, $8000)
    %PLMPopEntry(PLMEntries_greenDoorFacingRight, $11, $26, $005F)
    %PLMPopEntry(PLMEntries_PowerBombTank, $07, $08, $004C)
    dw $0000

PLMPopulation_MetalPirates:
; Room $B62B, state $B638: PLM
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $06, $0C60)
    dw $0000

PLMPopulation_ThreeMusketeers:
; Room $B656, state $B663: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $0B, $2A, RoomPLM_ThreeMusketeers_0)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0B, $29, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0B, $28, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0B, $27, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0B, $26, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0B, $25, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $0F, $2A, RoomPLM_ThreeMusketeers_6)
    %PLMPopEntry(PLMEntries_ScrollPLM, $14, $2A, RoomPLM_ThreeMusketeers_7)
    %PLMPopEntry(PLMEntries_MissileTank, $08, $29, $004D)
    dw $0000

PLMPopulation_RidleyETank:
; Room $B698, state $B6A5: PLM
    %PLMPopEntry(PLMEntries_EnergyTankShotBlock, $0E, $0B, $004E)
    dw $0000

PLMPopulation_ScrewAttack:
; Room $B6C1, state $B6CE: PLM
    %PLMPopEntry(PLMEntries_ScrewAttackChozoOrb, $0B, $28, $004F)
    dw $0000

PLMPopulation_LNFireflea:
; Room $B6EE, state $B6FB: PLM
    %PLMPopEntry(PLMEntries_upwardsExtension, $1F, $36, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $1F, $37, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $1F, $38, RoomPLM_LNFireflea_2)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $2D, $39, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $2C, $39, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $2B, $39, RoomPLM_LNFireflea_5)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0F, $06, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0F, $07, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0F, $08, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $0F, $09, RoomPLM_LNFireflea_9)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $1B, $0B, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $1A, $0B, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $19, $0B, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $18, $0B, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $17, $0B, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $16, $0B, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $15, $0B, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $14, $0B, RoomPLM_LNFireflea_11)
    %PLMPopEntry(PLMEntries_EnergyTank, $2A, $51, $0050)
    dw $0000

PLMPopulation_LNSave:
; Room $B741, state $B74E: PLM
    %PLMPopEntry(PLMEntries_saveStation, $07, $0B, $0005)
    dw $0000


;;; $9194: Room setup ASM - clear Crateria mainstreet escape passage if critters escaped and shake screen ;;;
SetupASM_ClearBlocksAfterSavingAnimalsAndShakeScreen:
; Room $92FD, state $9348. Crateria mainstreet, Zebes timebomb set
    JSL Spawn_Hardcoded_PLM
    db $3D,$0B
    dw PLMEntries_ClearCrateriaMainstreetEscapePassageIfCrittersEsc
    LDA.W #$0018 : STA.W EarthquakeType
    LDA.W #$FFFF : STA.W EarthquakeTimer
    RTS


;;; $91A9: Room setup ASM - make old Tourian escape shaft fake wall explode ;;;
SetupASM_AutoDestroyWallDuringEscape:
; Room $96BA, state $9705. Old Tourian escape shaft, Zebes timebomb set
    JSL Spawn_Hardcoded_PLM
    db $10,$87
    dw PLMEntries_MakeOldTourianEscapeShaftFakeWallExplode
    RTS


;;; $91B2: Room setup ASM - spawn critters escape block ;;;
SetupASM_TurnWallIntoShotBlocksDuringEscape:
; Room $9804, state $984F. Bomb Torizo's room, Zebes timebomb set
    JSL Spawn_Hardcoded_PLM
    db $0F,$0A
    dw PLMEntries_CrittersEscapeBlock
    RTS


;;; $91BB: RTS. Room setup ASM ;;;
RTS_8F91BB:
; Room $9879, state $98C4. Pre Bomb Torizo room, Zebes timebomb set
    RTS


;;; $91BC: RTS. Room setup ASM ;;;
RTS_8F91BC:
; Room $92FD, state $932E. Crateria mainstreet, Zebes is awake
; Room $96BA, state $96EB. Old Tourian escape shaft, Zebes is awake
; Room $975C, state $9787. Old Mother Brain room, morph & missiles
; Room $97B5, state $97E0. Crateria -> Blue Brinstar, morph & missiles
; Room $9E9F, state $9ECB. Morph ball room, Zebes is awake
; Room $9F11, state $9F3D. Pre-missiles room, Zebes is awake
; Room $9F64, state $9F90. Ceiling E-tank room, Zebes is awake
    RTS


;;; $91BD: Room setup ASM - scrolling sky land, shake screen ;;;
SetupASM_ShakeScreenAndCallFX20DuringEscape:
; Room $91F8, state $9261. Landing site, Zebes timebomb set
    LDA.W #$0006 : STA.W EarthquakeType
    LDA.W #$FFFF : STA.W EarthquakeTimer
; fallthrough to SetupASM_ScrollingSkyLand


;;; $91C9: Room setup ASM - scrolling sky land ;;;
SetupASM_ScrollingSkyLand:
; Room $91F8, state $9213. Landing site, power bombs
; Room $91F8, state $922D. Landing site, Zebes is awake
; Room $91F8, state $9247. Landing site, default
    JSL FXType_20_ScrollingSky_RoomSetupASM_ScrollingSkyLand
    RTS


;;; $91CE: Room setup ASM - scrolling sky ocean ;;;
SetupASM_ScrollingSkyOcean:
; Room $93FE. Wrecked Ship entrance
; Room $94FD. Wrecked Ship back door
; Room $968F. Orange zoomer room
    JSL RoomSetupASM_ScrollingSkyOcean
    RTS


;;; $91D3: RTS. Room setup ASM ;;;
RTS_8F91D3:
; Room $92B3. Gauntlet east
; Room $92FD, state $9314. Crateria mainstreet, default
; Room $93AA. Landing site power bomb room
; Room $93D5. Crateria save room
; Room $9461. Pre orange zoomer room
; Room $948C. Pre moat room
; Room $94CC. Crateria -> Maridia
; Room $9552. East Crateria kago shaft
; Room $957D. East Crateria maze
; Room $95A8. East Crateria maze -> elevator room
; Room $95D4. Crateria transport tube
; Room $95FF. Moat
; Room $962A. Crateria -> Red Brinstar
; Room $965B. Gauntlet west
    RTS


;;; $91D4: Setup ASM: RTS ;;;
RTS_8F91D4:
; Room $96BA, state $96D1. Old Tourian escape shaft, default
; Room $975C, state $976D. Old Mother Brain room, default
; Room $97B5, state $97C6. Crateria -> Blue Brinstar, default
; Room $9804, state $981B. Bomb Torizo's room, default
; Room $9804, state $9835. Bomb Torizo's room, Bomb Torizo dead
; Room $9879, state $9890. Pre Bomb Torizo room, default
; Room $9879, state $98AA. Pre Bomb Torizo room, Bomb Torizo dead
; Room $98E2. Crateria pre map room hall
; Room $990D. Crateria diagonal room
; Room $9938. Crateria -> Green Brinstar
; Room $9969. West Crateria kago hall
; Room $9994. Crateria map room
; Room $99BD. Crateria space pirate shaft
; Room $99F9. Old Tourian escape shaft parallel
; Room $9A44. Crateria bomb hall
; Room $9A90. Crateria missile room
    RTS


;;; $91D5: Setup ASM: RTS ;;;
RTS_8F91D5:
; Room $9AD9. Green Brinstar mainstreet
; Room $9B5B. Spore Spawn's super missile shaft
; Room $9B9D. Brinstar pre map room hall
; Room $9BC8. Green Brinstar gate hater
; Room $9C07. Green Brinstar reserve tank room
; Room $9C35. Brinstar map room
; Room $9C5E. Fireflea room
; Room $9C89. Green Brinstar missile station
; Room $9CB3. Dachora room
; Room $9D19. Pink Brinstar mainstreet
; Room $9D9C. Pre Spore Spawn room
; Room $9DC7. Spore Spawn's room
; Room $9E11. Pink Brinstar giant sidehopper room
; Room $9E52. Brinstar diagonal room
; Room $9E9F, state $9EB1. Morph ball room, default
; Room $9F11, state $9F23. Pre-missiles room, default
; Room $9F64, state $9F76. Ceiling E-tank room, default
; Room $9FBA. n00b bridge
; Room $9FE5. Brinstar false floor beetom room
; Room $A011. Brinstar false floor hall
; Room $A051. Brinstar post false floor super missile room
; Room $A07B. Dachora energy station
; Room $A0A4. Post Spore Spawn's super missile shaft hall
; Room $A0D2. Pink Brinstar flooded hall
; Room $A107. Blue Brinstar missile room
; Room $A130. Pink Brinstar wave beam gate room
; Room $A15B. Pink Brinstar energy tank room
; Room $A184. Pink Brinstar save room
; Room $A1AD. Blue Brinstar boulder room
; Room $A1D8. Blue Brinstar double missile room
; Room $A201. Green Brinstar save room
; Room $A22A. Brinstar false floor save room
    RTS


;;; $91D6: Setup ASM: RTS ;;;
RTS_8F91D6:
; Room $A253. Red Brinstar mainstreet
; Room $A293. Red Brinstar grapple ceiling spike floor hall
; Room $A2CE. X-ray room
; Room $A2F7. Red Brinstar damage boost hall
; Room $A322. Red Brinstar -> Crateria
; Room $A37C. Red Brinstar giant sidehopper room
; Room $A3AE. Red Brinstar power bomb room
; Room $A3DD. Red Brinstar skree hall
; Room $A408. Pre spazer room
; Room $A447. Spazer room
; Room $A471. Kraid BTS madness
; Room $A4B1. Kraid beetom room
; Room $A4DA. Kraid kihunter room
; Room $A521. Kraid space pirate hall
; Room $A56B. Pre Kraid room
; Room $A59F. Kraid's room
; Room $A5ED. Crateria pre Tourian hall
; Room $A618. Red Brinstar energy station
; Room $A641. Kraid refill station
    RTS


;;; $91D7: Room setup ASM - run statue unlocking animations ;;;
SetupASM_RunStatueUnlockingAnimations:
; Room $A66A. Tourian entrance
    LDY.W #AnimatedTilesObject_TourianStatueKraid
    JSL Spawn_AnimatedTilesObject
    LDY.W #AnimatedTilesObject_TourianStatuePhantoon
    JSL Spawn_AnimatedTilesObject
    LDY.W #AnimatedTilesObject_TourianStatueDraygon
    JSL Spawn_AnimatedTilesObject
    LDY.W #AnimatedTilesObject_TourianStatueRidley
    JSL Spawn_AnimatedTilesObject
    RTS


;;; $91F4: Setup ASM: RTS ;;;
RTS_8F91F4:
; Room $A6A1: Kraid's gauntlet entrance
; Room $A6E2: Varia suit room
; Room $A70B: Kraid's lair save room
; Room $A734: Red Brinstar save room
    RTS


;;; $91F5: Setup ASM: RTS ;;;
RTS_8F91F5:
; Room $A75D. Norfair post gate hater hall
; Room $A788. Norfair lava hidden missile room
; Room $A7B3. Norfair hi-jump requirement room
; Room $A7DE. Norfair mainstreet
; Room $A815. Norfair gate hater
; Room $A865. Norfair ice-beam testing room
; Room $A890. Ice beam room
; Room $A8B9. Pre ice beam room
; Room $A8F8. Impossible to find missile shaft
; Room $A923. Norfair diagonal room
    RTS


;;; $91F6: Setup ASM: RTS ;;;
RTS_8F91F6:
; Room $A98D. Crocomire's room
; Room $A9E5. Hi jump room
; Room $AA0E. Norfair grapple ceiling room
; Room $AA41. Pre hi jump room
; Room $AA82. Post Crocomire room
; Room $AAB5. Post Crocomire save room
; Room $AADE. Post Crocomire power bomb room
; Room $AB07. Post Crocomire shaft
; Room $AB3B. Post Crocomire oscillating spikey acid room
; Room $AB64. Post Crocomire lake room
; Room $AB8F. Huge jump room
; Room $ABD2. Post Crocomire fune room
; Room $AC00. Post grapple room
; Room $AC2B. Grapple room
; Room $AC5A. Norfair reserve tank room
; Room $AC83. Bubble Norfair pre reserve tank room room
; Room $ACB3. Bubble Norfair mainstreet
; Room $ACF0. Speed booster lavaquake room
; Room $AD1B. Speed booster room
; Room $AD5E. Lower Norfair -> Bubble Norfair
; Room $ADAD. Pre wave beam room
; Room $ADDE. Wave beam room
; Room $AE07. Norfair sinking tripper room
; Room $AE32. Norfair funes and lavaquake room
; Room $AE74. Pre Lower Norfair entrance shaft
; Room $AEB4. Norfair multiviola and magdollite hall
; Room $AEDF. Norfair pre pointless infinite enemy room shaft
; Room $AF14. Lower Norfair entrance
; Room $AF3F. Norfair -> Lower Norfair
; Room $AF72. Norfair wave beam requirement room
; Room $AFA3. Norfair long lavaquake hall
; Room $AFCE. Boring near-Crocomire hall
; Room $AFFB. Norfair grapple ceiling spike floor hall
; Room $B026. Norfair energy station
; Room $B051. Norfair pointless infinite enemy room
; Room $B07A. Pre speed booster lavaquake room
; Room $B0B4. Norfair map room
; Room $B0DD. Bubble Norfair save room
; Room $B106. Norfair speed blockade room
; Room $B139. Norfair stone zoomer shaft
; Room $B167. Norfair mainstreet save room
; Room $B192. Pre Crocomire save room
    RTS


;;; $91F7: Setup ASM: RTS ;;;
RTS_8F91F7:
; Room $B1E5. Golden chozo room
; Room $B236. Lower Norfair mainstreet
; Room $B283. Golden Torizo's room
; Room $B2DA. Post Golden Torizo ripper ii room
; Room $B305. Lower Norfair energy station
; Room $B32E. Ridley's room
; Room $B37A. Pre Ridley room
; Room $B3A5. Lower Norfair power bombable floor shaft
; Room $B3E1. Unused room
; Room $B40A. Lower Norfair big many levelled room
; Room $B457. Lower Norfair breakable pillars hall
; Room $B482. Lower Norfair holtz room
; Room $B4AD. Lower Norfair wall jumping space pirates shaft
; Room $B4E5. Lower Norfair big lavaquake room
; Room $B510. Lower Norfair mini maze room
; Room $B55A. Lower Norfair crumble walls power bomb room
; Room $B585. Lower Norfair kihunter shaft
; Room $B5D5. Lower Norfair super desgeega hall
; Room $B62B. Elite pirate hall
; Room $B656. Lower Norfair oscillating lava kihunter room
; Room $B698. Ridley's energy tank
; Room $B6C1. Screw attack room
    RTS


; see labels.asm for RoomHeaders: RoomStates: and RoomDoors:
;;; $91F8: Room headers, scroll data, door lists ;;;

; Room header format:
;      __________________________________________ Room index
;     |   _______________________________________ Area index
;     |  |    ___________________________________ X position (of top left corner) on the map
;     |  |   |   ________________________________ Y position (of top left corner) on the map
;     |  |   |  |    ____________________________ Room width (in units of screens = 16 blocks = 256 pixels)
;     |  |   |  |   |   _________________________ Room height (in units of screens = 16 blocks = 256 pixels)
;     |  |   |  |   |  |    _____________________ Up scroller
;     |  |   |  |   |  |   |   __________________ Down scroller
;     |  |   |  |   |  |   |  |    ______________ CRE bitset
;     |  |   |  |   |  |   |  |   |    __________ Door list pointer
;     |  |   |  |   |  |   |  |   |   |      ____ State conditions list
;     |  |   |  |   |  |   |  |   |   |     |
;     ii,aa, xx,yy, ww,hh, uu,dd, cc, dddd, [...]

; State conditions list format:
;      ______________ State condition
;     |     _________ State condition parameters
;     |    |      ___ State header pointer
;     |    |     |
;     eeee [...] ssss ; First state condition
;     eeee [...] ssss ; Second state condition
;     [...]           ; Other state conditions
;     E5E6            ; Default state condition (terminator)

; State header format:
;      ___________________________________________________________________________ Level data
;     |        ___________________________________________________________________ Tileset
;     |       |    _______________________________________________________________ Music data index
;     |       |   |   ____________________________________________________________ Music track
;     |       |   |  |    ________________________________________________________ FX ($83)
;     |       |   |  |   |      __________________________________________________ Enemy population ($A1)
;     |       |   |  |   |     |      ____________________________________________ Enemy set ($B4)
;     |       |   |  |   |     |     |      ______________________________________ Layer 2 scroll X
;     |       |   |  |   |     |     |     |   ___________________________________ Layer 2 scroll Y
;     |       |   |  |   |     |     |     |  |    _______________________________ Scroll
;     |       |   |  |   |     |     |     |  |   |      _________________________ Special x-ray blocks
;     |       |   |  |   |     |     |     |  |   |     |      ___________________ Main ASM
;     |       |   |  |   |     |     |     |  |   |     |     |      _____________ PLM population
;     |       |   |  |   |     |     |     |  |   |     |     |     |      _______ Library background
;     |       |   |  |   |     |     |     |  |   |     |     |     |     |      _ Setup ASM
;     |       |   |  |   |     |     |     |  |   |     |     |     |     |     |
;     llllll, tt, MM,mm, ffff, eeee, EEEE, xx,yy, ssss, xxxx, AAAA, pppp, bbbb, aaaa
RoomHeader_LandingSite:
    %RoomHeader(\
    %room(0),
    %area(0),
    %positions($17, 0),
    %dimensions(9, 5),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_LandingSite))
    %stateChecks(3,
    %stateCheckEventSet($0E, RoomState_LandingSite_3),
    %stateCheckPowerBombs(RoomState_LandingSite_2),
    %stateCheckEventSet(0, RoomState_LandingSite_1))

RoomState_LandingSite_0:
    %StateHeader(\
    %levelData(LevelData_LandingSite),
    %tileset(0),
    %music(6, 5),
    %FX(FXHeader_LandingSite_State0_1),
    %enemyPop(EnemyPopulations_LandingSite_0_1_2),
    %enemySet(EnemySets_LandingSite_0_1_2),
    %layer2Scrolls($81, 1),
    %scrollPointer(RoomScrolls_LandingSite),
    %specialXray(0),
    %mainASM(MainASM_ScrollingSkyLand),
    %PLMPop(PLMPopulation_LandingSite_State0_1_2),
    %libraryBG(LibBG_ScrollingSky_Tilemaps_LandingSite),
    %setupASM(SetupASM_ScrollingSkyLand))

RoomState_LandingSite_1:
    %StateHeader(\
    %levelData(LevelData_LandingSite),
    %tileset(0),
    %music(6, 6),
    %FX(FXHeader_LandingSite_State0_1),
    %enemyPop(EnemyPopulations_LandingSite_0_1_2),
    %enemySet(EnemySets_LandingSite_0_1_2),
    %layer2Scrolls($81, 1),
    %scrollPointer(RoomScrolls_LandingSite),
    %specialXray(0),
    %mainASM(MainASM_ScrollingSkyLand),
    %PLMPop(PLMPopulation_LandingSite_State0_1_2),
    %libraryBG(LibBG_ScrollingSky_Tilemaps_LandingSite),
    %setupASM(SetupASM_ScrollingSkyLand))

RoomState_LandingSite_2:
    %StateHeader(\
    %levelData(LevelData_LandingSite),
    %tileset(0),
    %music($0C, 5),
    %FX(FXHeader_LandingSite_State2),
    %enemyPop(EnemyPopulations_LandingSite_0_1_2),
    %enemySet(EnemySets_LandingSite_0_1_2),
    %layer2Scrolls($81, 1),
    %scrollPointer(RoomScrolls_LandingSite),
    %specialXray(0),
    %mainASM(MainASM_ScrollingSkyLand),
    %PLMPop(PLMPopulation_LandingSite_State0_1_2),
    %libraryBG(LibBG_ScrollingSky_Tilemaps_LandingSite),
    %setupASM(SetupASM_ScrollingSkyLand))

RoomState_LandingSite_3:
    %StateHeader(\
    %levelData(LevelData_LandingSite),
    %tileset(0),
    %music(0, 0),
    %FX(FXHeader_LandingSite_State3),
    %enemyPop(EnemyPopulations_LandingSite_3),
    %enemySet(EnemySets_LandingSite_3),
    %layer2Scrolls($81, 1),
    %scrollPointer(RoomScrolls_LandingSite),
    %specialXray(0),
    %mainASM(MainASM_ScrollingSkyLand_ZebesTimebombSet),
    %PLMPop(PLMPopulation_LandingSite_State3),
    %libraryBG(LibBG_ScrollingSky_Tilemaps_LandingSite),
    %setupASM(SetupASM_ShakeScreenAndCallFX20DuringEscape))

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
    db $13,$01, $80

RoomHeader_GauntletEntrance:
    %RoomHeader(\
    %room(1),
    %area(0),
    %positions($12, 2),
    %dimensions(5, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_GauntletEntrance))
    %stateChecks(1,
    %stateCheckEventSet(0, RoomState_GauntletEntrance_1))

RoomState_GauntletEntrance_0:
    %StateHeader(\
    %levelData(LevelData_GauntletEntrance),
    %tileset(0),
    %music(0, 0),
    %FX(FXHeader_GauntletEntrance_State0_1),
    %enemyPop(EnemyPopulations_GauntletEntrance),
    %enemySet(EnemySets_GauntletEntrance),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_GauntletEntrance_State0_1),
    %libraryBG(LibBG_Crateria_0_HorizontalPatternRocks),
    %setupASM(RTS_8F91D3))

RoomState_GauntletEntrance_1:
    %StateHeader(\
    %levelData(LevelData_GauntletEntrance),
    %tileset(0),
    %music(9, 5),
    %FX(FXHeader_GauntletEntrance_State0_1),
    %enemyPop(EnemyPopulations_GauntletEntrance),
    %enemySet(EnemySets_GauntletEntrance),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_GauntletEntrance_State0_1),
    %libraryBG(LibBG_Crateria_0_HorizontalPatternRocks),
    %setupASM(RTS_8F91D3))

RoomDoors_GauntletEntrance:
    dw Door_GauntletEntrance_0
    dw Door_GauntletEntrance_1

RoomHeader_Parlor:
    %RoomHeader(\
    %room(2),
    %area(0),
    %positions($12, 4),
    %dimensions(5, 5),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_Parlor))
    %stateChecks(2,
    %stateCheckEventSet($0E, RoomState_Parlor_2),
    %stateCheckEventSet(0, RoomState_Parlor_1))

RoomState_Parlor_0:
    %StateHeader(\
    %levelData(LevelData_Parlor),
    %tileset(0),
    %music(0, 0),
    %FX(FXHeader_Parlor_State0),
    %enemyPop(EnemyPopulations_Parlor_0),
    %enemySet(EnemySets_Parlor_0),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_Parlor),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Parlor_State0_1),
    %libraryBG(LibBG_Crateria_0_Rocks),
    %setupASM(RTS_8F91D3))

RoomState_Parlor_1:
    %StateHeader(\
    %levelData(LevelData_Parlor),
    %tileset(0),
    %music(9, 5),
    %FX(FXHeader_Parlor_State1),
    %enemyPop(EnemyPopulations_Parlor_1),
    %enemySet(EnemySets_Parlor_1),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_Parlor),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Parlor_State0_1),
    %libraryBG(LibBG_Crateria_0_Rocks),
    %setupASM(RTS_8F91BC))

RoomState_Parlor_2:
    %StateHeader(\
    %levelData(LevelData_Parlor),
    %tileset(0),
    %music(0, 0),
    %FX(FXHeader_Parlor_State2),
    %enemyPop(EnemyPopulations_Parlor_2),
    %enemySet(EnemySets_Parlor_2),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_Parlor),
    %specialXray(0),
    %mainASM(MainASM_SetScreenShaking_GenerateRandomExplosions),
    %PLMPop(PLMPopulation_Parlor_State2),
    %libraryBG(LibBG_Crateria_0_Rocks),
    %setupASM(SetupASM_ClearBlocksAfterSavingAnimalsAndShakeScreen))

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
    db $08,$02, $80

RoomPLM_Parlor_1:
    db $08,$00, $80

RoomPLM_Parlor_2:
    db $00,$00, $02,$00, $06,$02, $80

RoomPLM_Parlor_6:
    db $06,$00, $80

RoomPLM_Parlor_A:
    db $00,$01, $80

RoomPLM_Parlor_D:
    db $02,$01, $80

RoomPLM_Parlor_13_14:
    db $04,$01, $80

RoomPLM_Parlor_15:
    db $04,$00, $80

RoomPLM_Parlor_1A:
    db $04,$00, $08,$02, $80

RoomHeader_CrateriaPowerBombs:
    %RoomHeader(\
    %room(3),
    %area(0),
    %positions($20, 1),
    %dimensions(2, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_CrateriaPowerBombs))
    %stateChecks(0)

RoomState_CrateriaPowerBombs:
    %StateHeader(\
    %levelData(LevelData_CrateriaPowerBombs),
    %tileset(0),
    %music(0, 0),
    %FX(FXHeader_CrateriaPowerBombs),
    %enemyPop(EnemyPopulations_CrateriaPowerBombs),
    %enemySet(EnemySets_CrateriaPowerBombs),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_CrateriaPowerBomb),
    %specialXray(0),
    %mainASM(MainASM_ScrollingSkyLand),
    %PLMPop(PLMPopulation_CrateriaPowerBombs),
    %libraryBG(LibBG_Crateria_0_Rocks),
    %setupASM(RTS_8F91D3))

RoomDoors_CrateriaPowerBombs:
    dw Door_CrateriaPowerBombs_0

RoomScrolls_CrateriaPowerBomb:
    db $01,$01

RoomHeader_CrateriaSave:
    %RoomHeader(\
    %room(4),
    %area(0),
    %positions($12, 6),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_CrateriaSave))
    %stateChecks(0)

RoomState_CrateriaSave:
    %StateHeader(\
    %levelData(LevelData_SaveStation_RightSideDoor),
    %tileset($19),
    %music(9, 5),
    %FX(FXHeader_CrateriaSave),
    %enemyPop(EnemyPopulations_CrateriaSave),
    %enemySet(EnemySets_CrateriaSave),
    %layer2Scrolls(0, 0),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_CrateriaSave),
    %libraryBG(0),
    %setupASM(RTS_8F91D3))

RoomDoors_CrateriaSave:
    dw Door_CrateriaSave_0

RoomHeader_WestOcean:
    %RoomHeader(\
    %room(5),
    %area(0),
    %positions($26, 0),
    %dimensions(8, 6),
    %scrollers($90, $A0),
    %CRE(0),
    %doorList(RoomDoors_WestOcean))
    %stateChecks(0)

RoomState_WestOcean:
    %StateHeader(\
    %levelData(LevelData_WestOcean),
    %tileset(0),
    %music($0C, 5),
    %FX(FXHeader_WestOcean),
    %enemyPop(EnemyPopulations_WestOcean),
    %enemySet(EnemySets_WestOcean),
    %layer2Scrolls($81, 1),
    %scrollPointer(RoomScrolls_WestOcean),
    %specialXray(0),
    %mainASM(MainASM_ScrollingSkyOcean),
    %PLMPop(PLMPopulation_WestOcean),
    %libraryBG(LibBG_ScrollingSky_Tilemaps_WreckedShipEntrance),
    %setupASM(SetupASM_ScrollingSkyOcean))

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
    %RoomHeader(\
    %room(6),
    %area(0),
    %positions($29, 2),
    %dimensions(2, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_BowlingAlleyPath))
    %stateChecks(0)

RoomState_BowlingAlleyPath:
    %StateHeader(\
    %levelData(LevelData_BowlingAlleyPath),
    %tileset(0),
    %music(0, 0),
    %FX(FXHeader_BowlingAlleyPath),
    %enemyPop(EnemyPopulations_BowlingAlleyPath),
    %enemySet(EnemySets_BowlingAlleyPath),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_BowlingAlleyPath),
    %libraryBG(LibBG_Crateria_0_HorizontalPatternRocks),
    %setupASM(RTS_8F91D3))

RoomDoors_BowlingAlleyPath:
    dw Door_BowlingAlleyPath_0
    dw Door_BowlingAlleyPath_1

RoomHeader_CrateriaKihunter:
    %RoomHeader(\
    %room(7),
    %area(0),
    %positions($21, 4),
    %dimensions(3, 3),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_CrateriaKihunter))
    %stateChecks(0)

RoomState_CrateriaKihunter:
    %StateHeader(\
    %levelData(LevelData_CrateriaKihunter),
    %tileset(0),
    %music(0, 5),
    %FX(FXHeader_CrateriaKihunters),
    %enemyPop(EnemyPopulations_CrateriaKihunter),
    %enemySet(EnemySets_CrateriaKihunter),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScroll_CrateriaKihunter),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_CrateriaKihunter),
    %libraryBG(LibBG_Crateria_0_Rocks),
    %setupASM(RTS_8F91D3))

RoomDoors_CrateriaKihunter:
    dw Door_CrateriaKihunter_0
    dw Door_CrateriaKihunter_1
    dw Door_CrateriaKihunter_2

RoomScroll_CrateriaKihunter:
    db $01,$01,$01,$00,$00,$00,$00,$02,$00

RoomPLM_CrateriaKihunter_0:
    db $01,$02, $04,$02, $80

RoomPLM_CrateriaKihunter_2:
    db $01,$01, $04,$00, $80

RoomHeader_ForgottenHighwayElev:
    %RoomHeader(\
    %room(8),
    %area(0),
    %positions($34, $0A),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_ForgottenHighwayElev))
    %stateChecks(0)

RoomState_ForgottenHighwayElev:
    %StateHeader(\
    %levelData(LevelData_ForgottenHighwayElev),
    %tileset(2),
    %music(9, 3),
    %FX(FXHeader_ForgottenHighwayElev),
    %enemyPop(EnemyPopulations_ForgottenHighwayElev),
    %enemySet(EnemySets_ForgottenHighwayElev),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_ForgottenHighwayElev),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_ForgottenHighwayElev),
    %libraryBG(LibBG_Crateria_2_Elevator),
    %setupASM(RTS_8F91D3))

RoomDoors_ForgottenHighwayElev:
    dw Door_ForgottenHighwayElev_0
    dw Door_ForgottenHighwayElev_1
    dw Door_VariousRooms_Elevator

RoomScrolls_ForgottenHighwayElev:
    db $01

RoomPLM_ForgottenHighwayElev_0:
    db $00,$02, $80

RoomHeader_EastOcean:
    %RoomHeader(\
    %room(9),
    %area(0),
    %positions($31, 0),
    %dimensions(7, 6),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_EastOcean))
    %stateChecks(0)

RoomState_EastOcean:
    %StateHeader(\
    %levelData(LevelData_EastOcean),
    %tileset(0),
    %music($0C, 5),
    %FX(FXHeader_EastOcean),
    %enemyPop(EnemyPopulations_EastOcean),
    %enemySet(EnemySets_EastOcean),
    %layer2Scrolls($81, $01),
    %scrollPointer(RoomScrolls_EastOcean),
    %specialXray(0),
    %mainASM(MainASM_ScrollingSkyOcean),
    %PLMPop(PLMPopulation_EastOcean),
    %libraryBG(LibBG_ScrollingSky_Tilemaps_EastOcean),
    %setupASM(SetupASM_ScrollingSkyOcean))

RoomDoors_EastOcean:
    dw Door_EastOcean_0
    dw Door_EastOcean_1

RoomScrolls_EastOcean:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$02,$02,$02,$02
    db $02,$02,$02,$01,$01,$01,$01,$01,$01,$01

RoomHeader_ForgottenHighwayKagos:
    %RoomHeader(\
    %room($0A),
    %area(0),
    %positions($38, 4),
    %dimensions(1, 4),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_ForgottenHighwayKagos))
    %stateChecks(0)

RoomState_ForgottenHighwayKagos:
    %StateHeader(\
    %levelData(LevelData_ForgottenHighwayKagos),
    %tileset(0),
    %music(0, 0),
    %FX(FXHeader_ForgottenHighwayKagos),
    %enemyPop(EnemyPopulations_ForgottenHighwayKagos),
    %enemySet(EnemySets_ForgottenHighwayKagos),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(1),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_ForgottenHighwayKagos),
    %libraryBG(LibBG_Crateria_0_VerticalPatternRocks),
    %setupASM(RTS_8F91D3))

RoomDoors_ForgottenHighwayKagos:
    dw Door_ForgottenHighwayKagos_0
    dw Door_ForgottenHighwayKagos_1

RoomHeader_CrabMaze:
    %RoomHeader(\
    %room($0B),
    %area(0),
    %positions($35, 8),
    %dimensions(4, 2),
    %scrollers($90, $A0),
    %CRE(0),
    %doorList(RoomDoors_CrabMaze))
    %stateChecks(0)

RoomState_CrabMaze:
    %StateHeader(\
    %levelData(LevelData_CrabMaze),
    %tileset(0),
    %music(0, 0),
    %FX(FXHeader_CrabMaze),
    %enemyPop(EnemyPopulations_CrabMaze),
    %enemySet(EnemySets_CrabMaze),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(1),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_CrabMaze),
    %libraryBG(LibBG_Crateria_0_Rocks),
    %setupASM(RTS_8F91D3))

RoomDoors_CrabMaze:
    dw Door_CrabMaze_0
    dw Door_CrabMaze_1

RoomHeader_ForgottenHighwayElbow:
    %RoomHeader(\
    %room($0C),
    %area(0),
    %positions($34, 9),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_ForgottenHighwayElbow))
    %stateChecks(0)

RoomState_ForgottenHighwayElbow:
    %StateHeader(\
    %levelData(LevelData_ForgottenHighwayElbow),
    %tileset(0),
    %music(0, 5),
    %FX(FXHeader_ForgottenHighwayElbow),
    %enemyPop(EnemyPopulations_ForgottenHighwayElbow),
    %enemySet(EnemySets_ForgottenHighwayElbow),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_ForgottenHighwayElbow),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_ForgottenHighwayElbow),
    %libraryBG(LibBG_Crateria_0_VerticalPatternRocks),
    %setupASM(RTS_8F91D3))

RoomDoors_ForgottenHighwayElbow:
    dw Door_ForgottenHighwayElbow_0
    dw Door_ForgottenHighwayElbow_1

RoomScrolls_ForgottenHighwayElbow:
    db $02

RoomHeader_CrateriaTube:
    %RoomHeader(\
    %room($0D),
    %area(0),
    %positions($20, 4),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_CrateriaTube))
    %stateChecks(0)

RoomState_CrateriaTube:
    %StateHeader(\
    %levelData(LevelData_CrateriaTube),
    %tileset(0),
    %music(0, 0),
    %FX(FXHeader_CrateriaTube),
    %enemyPop(EnemyPopulations_CrateriaTube),
    %enemySet(EnemySets_CrateriaTube),
    %layer2Scrolls(0, 0),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_CrateriaTube),
    %libraryBG(0),
    %setupASM(RTS_8F91D3))

RoomDoors_CrateriaTube:
    dw Door_CrateriaTube_0
    dw Door_CrateriaTube_1

RoomHeader_Moat:
    %RoomHeader(\
    %room($0E),
    %area(0),
    %positions($24, 4),
    %dimensions(2, 2),
    %scrollers($90, $A0),
    %CRE(0),
    %doorList(RoomDoors_Moat))
    %stateChecks(0)

RoomState_Moat:
    %StateHeader(\
    %levelData(LevelData_Moat),
    %tileset(0),
    %music(0, 0),
    %FX(FXHeader_Moat),
    %enemyPop(EnemyPopulations_Moat),
    %enemySet(EnemySets_Moat),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Moat),
    %libraryBG(LibBG_Crateria_0_Rocks),
    %setupASM(RTS_8F91D3))

RoomDoors_Moat:
    dw Door_Moat_0
    dw Door_Moat_1

RoomHeader_RedBinstarElev:
    %RoomHeader(\
    %room($0F),
    %area(0),
    %positions($22, 7),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_RedBinstarElev))
    %stateChecks(0)

RoomState_RedBinstarElev:
    %StateHeader(\
    %levelData(LevelData_RedBinstarElev),
    %tileset(2),
    %music(0, 3),
    %FX(FXHeader_RedBrinstarElev),
    %enemyPop(EnemyPopulations_RedBinstarElev),
    %enemySet(EnemySets_RedBinstarElev),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_RedBinstarElev),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_RedBinstarElev),
    %libraryBG(LibBG_Crateria_2_Elevator),
    %setupASM(RTS_8F91D3))

RoomDoors_RedBinstarElev:
    dw Door_RedBinstarElev_0
    dw Door_RedBinstarElev_1
    dw Door_VariousRooms_Elevator

RoomScrolls_RedBinstarElev:
    db $01

RoomPLM_RedBinstarElev_0:
    db $00,$02, $80

RoomHeader_GauntletETank:
    %RoomHeader(\
    %room($10),
    %area(0),
    %positions($0C, 2),
    %dimensions(6, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_GauntletETank))
    %stateChecks(0)

RoomState_GauntletETank:
    %StateHeader(\
    %levelData(LevelData_GauntletETank),
    %tileset(0),
    %music(0, 0),
    %FX(FXHeader_GauntletETank),
    %enemyPop(EnemyPopulations_GauntletETank),
    %enemySet(EnemySets_GauntletETank),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_GauntletETank),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_GauntletETank),
    %libraryBG(LibBG_Crateria_0_HorizontalPatternRocks),
    %setupASM(RTS_8F91D3))

RoomDoors_GauntletETank:
    dw Door_GauntletETank_0
    dw Door_GauntletETank_1

RoomScrolls_GauntletETank:
    db $01,$01,$01,$01,$00,$01

RoomPLM_GauntletETank_0:
    db $04,$01, $80

RoomHeader_PreBowling:
    %RoomHeader(\
    %room($11),
    %area(0),
    %positions($2B, 2),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_PreBowling))
    %stateChecks(0)

RoomState_PreBowling:
    %StateHeader(\
    %levelData(LevelData_PreBowling),
    %tileset(0),
    %music($0C, 5),
    %FX(FXHeader_PreBowling),
    %enemyPop(EnemyPopulations_PreBowling),
    %enemySet(EnemySets_PreBowling),
    %layer2Scrolls($81, 1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(MainASM_ScrollingSkyOcean),
    %PLMPop(PLMPopulation_PreBowling),
    %libraryBG(LibBG_ScrollingSky_Tilemaps_BowlingAlley),
    %setupASM(SetupASM_ScrollingSkyOcean))

RoomDoors_PreBowling:
    dw Door_PreBowling_0
    dw Door_PreBowling_1

RoomHeader_Climb:
    %RoomHeader(\
    %room($12),
    %area(0),
    %positions($12, 9),
    %dimensions(3, 9),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_Climb))
    %stateChecks(2,
    %stateCheckEventSet($0E, RoomState_Climb_2),
    %stateCheckEventSet(0, RoomState_Climb_1))

RoomState_Climb_0:
    %StateHeader(\
    %levelData(LevelData_Climb),
    %tileset(3),
    %music(0, 0),
    %FX(FXHeader_Climb_State0),
    %enemyPop(EnemyPopulations_Climb_0),
    %enemySet(EnemySets_Climb_0),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_Climb),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Climb_State_0_1),
    %libraryBG(LibBG_Crateria_2_3_Mechanical),
    %setupASM(RTS_8F91D4))

RoomState_Climb_1:
    %StateHeader(\
    %levelData(LevelData_Climb),
    %tileset(2),
    %music(9, 5),
    %FX(FXHeader_Climb_State1),
    %enemyPop(EnemyPopulations_Climb_1),
    %enemySet(EnemySets_Climb_1),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_Climb),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Climb_State_0_1),
    %libraryBG(LibBG_Crateria_2_3_Mechanical),
    %setupASM(RTS_8F91BC))

RoomState_Climb_2:
    %StateHeader(\
    %levelData(LevelData_Climb),
    %tileset(2),
    %music($24, 7),
    %FX(FXHeader_Climb_State2),
    %enemyPop(EnemyPopulations_Climb_2),
    %enemySet(EnemySets_Climb_2),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_Climb),
    %specialXray(0),
    %mainASM(MainASM_SetScreenShaking_GenerateRandomExplosions),
    %PLMPop(PLMPopulation_Climb_State2),
    %libraryBG(LibBG_Crateria_2_3_Mechanical),
    %setupASM(SetupASM_AutoDestroyWallDuringEscape))

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
    db $02,$01, $80

RoomPLM_Climb_0:
    db $02,$00, $80

RoomPLM_Climb_3:
    db $17,$01, $80

RoomPLM_Climb_2:
    db $17,$00, $80

RoomPLM_Climb_E:
    db $18,$01, $80

RoomPLM_Climb_A:
    db $18,$00, $80

RoomPLM_Climb_12:
    db $19,$01, $80

RoomPLM_Climb_16:
    db $19,$00, $80

RoomHeader_Pit:
    %RoomHeader(\
    %room($13),
    %area(0),
    %positions($14, $11),
    %dimensions(3, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_Pit))
    %stateChecks(1,
    %stateCheckMorphMissiles(RoomState_Pit_1))

RoomState_Pit_0:
    %StateHeader(\
    %levelData(LevelData_Pit),
    %tileset(3),
    %music(0, 5),
    %FX(FXHeader_Pit_State0),
    %enemyPop(EnemyPopulations_Pit_0),
    %enemySet(EnemySets_Pit_0),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_Pit),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Pit_0),
    %libraryBG(LibBG_Crateria_2_3_Mechanical),
    %setupASM(RTS_8F91D4))

RoomState_Pit_1:
    %StateHeader(\
    %levelData(LevelData_Pit),
    %tileset(2),
    %music(9, 5),
    %FX(FXHeader_Pit_State1),
    %enemyPop(EnemyPopulations_Pit_1),
    %enemySet(EnemySets_Pit_1),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_Pit),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Pit_1),
    %libraryBG(LibBG_Crateria_2_3_Mechanical),
    %setupASM(RTS_8F91BC))

RoomDoors_Pit:
    dw Door_Pit_0
    dw Door_Pit_1

RoomScrolls_Pit:
    db $01,$01,$01,$00,$00,$00

RoomPLM_Pit_0_1:
    db $00,$02, $03,$02, $80

RoomPLM_Pit_2:
    db $00,$01, $03,$00, $80

RoomHeader_ElevToBlueBrinstar:
    %RoomHeader(\
    %room($14),
    %area(0),
    %positions($17, $11),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_ElevToBlueBrinstar))
    %stateChecks(1,
    %stateCheckMorphMissiles(RoomState_ElevToBlueBrinstar_1))

RoomState_ElevToBlueBrinstar_0:
    %StateHeader(\
    %levelData(LevelData_ElevToBlueBrinstar),
    %tileset(2),
    %music(6, 5),
    %FX(FXHeader_ElevToBlueBrinstar_State0),
    %enemyPop(EnemyPopulations_ElevToBlueBrinstar),
    %enemySet(EnemySets_ElevToBlueBrinstar),
    %layer2Scrolls(0, 0),
    %scrollPointer(RoomScrolls_ElevToBlueBrinstar),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_ElevToBlueBrinstar_State0_1),
    %libraryBG(0),
    %setupASM(RTS_8F91D4))

RoomState_ElevToBlueBrinstar_1:
    %StateHeader(\
    %levelData(LevelData_ElevToBlueBrinstar),
    %tileset(2),
    %music(0, 3),
    %FX(FXHeader_ElevToBlueBrinstar_State1),
    %enemyPop(EnemyPopulations_ElevToBlueBrinstar),
    %enemySet(EnemySets_ElevToBlueBrinstar),
    %layer2Scrolls(0, 0),
    %scrollPointer(RoomScrolls_ElevToBlueBrinstar),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_ElevToBlueBrinstar_State0_1),
    %libraryBG(0),
    %setupASM(RTS_8F91BC))

RoomDoors_ElevToBlueBrinstar:
    dw Door_ElevToBlueBrinstar_0
    dw Door_ElevToBlueBrinstar_1
    dw Door_VariousRooms_Elevator

RoomScrolls_ElevToBlueBrinstar:
    db $01

RoomPLM_ElevToBlueBrinstar:
    db $00,$02, $80

RoomHeader_BombTorizo:
    %RoomHeader(\
    %room($15),
    %area(0),
    %positions($19, 6),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_BombTorizo))
    %stateChecks(2,
    %stateCheckEventSet($0E, RoomState_BombTorizo_2),
    %stateCheckBossDead(4, RoomState_BombTorizo_1))

RoomState_BombTorizo_0:
    %StateHeader(\
    %levelData(LevelData_BombTorizo),
    %tileset(2),
    %music($24, 3),
    %FX(FXHeader_BombTorizo_State0_1),
    %enemyPop(EnemyPopulations_BombTorizo_0_1),
    %enemySet(EnemySets_BombTorizo_0_1),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_BombTorizo_State0_1),
    %libraryBG(LibBG_Crateria_2_3_Mechanical),
    %setupASM(RTS_8F91D4))

RoomState_BombTorizo_1:
    %StateHeader(\
    %levelData(LevelData_BombTorizo),
    %tileset(2),
    %music(0, 3),
    %FX(FXHeader_BombTorizo_State0_1),
    %enemyPop(EnemyPopulations_BombTorizo_0_1),
    %enemySet(EnemySets_BombTorizo_0_1),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_BombTorizo_State0_1),
    %libraryBG(LibBG_Crateria_2_3_Mechanical),
    %setupASM(RTS_8F91D4))

RoomState_BombTorizo_2:
    %StateHeader(\
    %levelData(LevelData_BombTorizo),
    %tileset(2),
    %music(0, 0),
    %FX(FXHeader_BombTorizo_State2),
    %enemyPop(EnemyPopulations_BombTorizo_2),
    %enemySet(EnemySets_BombTorizo_2),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(RoomVar_BombTorizo),
    %mainASM(MainASM_SetScreenShaking_GenerateRandomExplosions),
    %PLMPop(PLMPopulation_BombTorizo_State2),
    %libraryBG(LibBG_Crateria_2_3_Mechanical),
    %setupASM(SetupASM_TurnWallIntoShotBlocksDuringEscape))

RoomDoors_BombTorizo:
    dw Door_BombTorizo_0

RoomVar_BombTorizo:
    db $0F,$0A : dw $0052
    db $0F,$0B : dw $0052
    db $0F,$0C : dw $0052
    db $00,$00

RoomHeader_Flyway:
    %RoomHeader(\
    %room($16),
    %area(0),
    %positions($16, 6),
    %dimensions(3, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_Flyway))
    %stateChecks(2,
    %stateCheckEventSet($0E, RoomState_Flyway_2),
    %stateCheckBossDead(4, RoomState_Flyway_1))

RoomState_Flyway_0:
    %StateHeader(\
    %levelData(LevelData_Flyway),
    %tileset(2),
    %music(9, 5),
    %FX(FXHeader_Flyway_State0_1),
    %enemyPop(EnemyPopulations_Flyway_0_1),
    %enemySet(EnemySets_Flyway_0_1),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Flyway_State0_1),
    %libraryBG(LibBG_Crateria_2_BrickRoom_WallArt_Dark),
    %setupASM(RTS_8F91D4))

RoomState_Flyway_1:
    %StateHeader(\
    %levelData(LevelData_Flyway),
    %tileset(2),
    %music(9, 5),
    %FX(FXHeader_Flyway_State0_1),
    %enemyPop(EnemyPopulations_Flyway_0_1),
    %enemySet(EnemySets_Flyway_0_1),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Flyway_State0_1),
    %libraryBG(LibBG_Crateria_2_BrickRoom_WallArt_Dark),
    %setupASM(RTS_8F91D4))

RoomState_Flyway_2:
    %StateHeader(\
    %levelData(LevelData_Flyway),
    %tileset(2),
    %music($24, 7),
    %FX(FXHeader_Flyway_State2),
    %enemyPop(EnemyPopulations_Flyway_2),
    %enemySet(EnemySets_Flyway_2),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(MainASM_SetScreenShaking_GenerateRandomExplosions),
    %PLMPop(PLMPopulation_Flyway_State2),
    %libraryBG(LibBG_Crateria_2_BrickRoom_WallArt_Dark),
    %setupASM(RTS_8F91BB))

RoomDoors_Flyway:
    dw Door_Flyway_0
    dw Door_Flyway_1

RoomHeader_PreMapFlyway:
    %RoomHeader(\
    %room($17),
    %area(0),
    %positions($14, 7),
    %dimensions(3, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_PreMapFlyway))
    %stateChecks(0)

RoomState_PreMapFlyway:
    %StateHeader(\
    %levelData(LevelData_PreMapFlyway),
    %tileset(2),
    %music(0, 0),
    %FX(FXHeader_VariousRooms_8381C2),
    %enemyPop(EnemyPopulations_PreMapFlyway),
    %enemySet(EnemySets_PreMapFlyway),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_PreMapFlyway),
    %libraryBG(LibBG_Crateria_2_BrickRoom_WallArt),
    %setupASM(RTS_8F91D4))

RoomDoors_PreMapFlyway:
    dw Door_PreMapFlyway_0
    dw Door_PreMapFlyway_1

RoomHeader_Terminator:
    %RoomHeader(\
    %room($18),
    %area(0),
    %positions($0C, 4),
    %dimensions(6, 3),
    %scrollers($A0, $A0),
    %CRE(0),
    %doorList(RoomDoors_Terminator))
    %stateChecks(0)

RoomState_Terminator:
    %StateHeader(\
    %levelData(LevelData_Terminator),
    %tileset(2),
    %music(0, 0),
    %FX(FXHeader_VariousRooms_8381C2),
    %enemyPop(EnemyPopulations_Terminator),
    %enemySet(EnemySets_Terminator),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Terminator),
    %libraryBG(LibBG_Crateria_2_PurpleRocks),
    %setupASM(RTS_8F91D4))

RoomDoors_Terminator:
    dw Door_Terminator_0
    dw Door_Terminator_1

RoomHeader_GreenBrinstarElev:
    %RoomHeader(\
    %room($19),
    %area(0),
    %positions(6, 8),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_GreenBrinstarElev))
    %stateChecks(0)

RoomState_GreenBrinstarElev:
    %StateHeader(\
    %levelData(LevelData_GreenBrinstarElev),
    %tileset(2),
    %music(9, 3),
    %FX(FXHeader_VariousRooms_8381C2),
    %enemyPop(EnemyPopulations_GreenBrinstarElev),
    %enemySet(EnemySets_GreenBrinstarElev),
    %layer2Scrolls(0, 0),
    %scrollPointer(RoomScrolls_GreenBrinstarElev),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_GreenBrinstarElev),
    %libraryBG(0),
    %setupASM(RTS_8F91D4))

RoomDoors_GreenBrinstarElev:
    dw Door_GreenBrinstarElev_0
    dw Door_GreenBrinstarElev_1
    dw Door_VariousRooms_Elevator

RoomScrolls_GreenBrinstarElev:
    db $01

RoomPLM_GreenBrinstarElev_0:
    db $00,$02, $80

RoomHeader_LowerMushrooms:
    %RoomHeader(\
    %room($1A),
    %area(0),
    %positions(7, 8),
    %dimensions(4, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_LowerMushrooms))
    %stateChecks(0)

RoomState_LowerMushrooms:
    %StateHeader(\
    %levelData(LevelData_LowerMushrooms),
    %tileset(2),
    %music(0, 5),
    %FX(FXHeader_VariousRooms_8381C2),
    %enemyPop(EnemyPopulations_LowerMushrooms),
    %enemySet(EnemySets_LowerMushrooms),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_LowerMushrooms),
    %libraryBG(LibBG_Crateria_2_PurpleRocks),
    %setupASM(RTS_8F91D4))

RoomDoors_LowerMushrooms:
    dw Door_LowerMushrooms_0
    dw Door_LowerMushrooms_1

RoomHeader_CrateriaMap:
    %RoomHeader(\
    %room($1B),
    %area(0),
    %positions($17, 7),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_CrateriaMap))
    %stateChecks(0)

RoomState_CrateriaMap:
    %StateHeader(\
    %levelData(LevelData_MapStation_LeftSideDoor),
    %tileset($15),
    %music(0, 0),
    %FX(FXHeader_VariousRooms_8381C2),
    %enemyPop(EnemyPopulations_CrateriaMap),
    %enemySet(EnemySets_CrateriaMap),
    %layer2Scrolls(0, 0),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_CrateriaMap),
    %libraryBG(0),
    %setupASM(RTS_8F91D4))

RoomDoors_CrateriaMap:
    dw Door_CrateriaMap_0

RoomHeader_GreenPiratesShaft:
    %RoomHeader(\
    %room($1C),
    %area(0),
    %positions($0B, 2),
    %dimensions(1, 7),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_GreenPiratesShaft))
    %stateChecks(0)

RoomState_GreenPiratesShaft:
    %StateHeader(\
    %levelData(LevelData_GreenPiratesShaft),
    %tileset(2),
    %music(0, 5),
    %FX(FXHeader_VariousRooms_8381C2),
    %enemyPop(EnemyPopulations_GreenPiratesShaft),
    %enemySet(EnemySets_GreenPiratesShaft),
    %layer2Scrolls(1, $C1),
    %scrollPointer(RoomScrolls_GreenPiratesShaft),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_GreenPiratesShaft),
    %libraryBG(LibBG_Crateria_2_BrickRoom),
    %setupASM(RTS_8F91D4))

RoomDoors_GreenPiratesShaft:
    dw Door_GreenPiratesShaft_0
    dw Door_GreenPiratesShaft_1
    dw Door_GreenPiratesShaft_2
    dw Door_GreenPiratesShaft_3

RoomScrolls_GreenPiratesShaft:
    db $02,$02,$02,$00,$02,$02,$01

RoomPLM_GreenPiratesShaft_0:
    db $03,$02, $80

RoomPLM_GreenPiratesShaft_2:
    db $03,$00, $80

RoomHeader_CrateriaSuper:
    %RoomHeader(\
    %room($1D),
    %area(0),
    %positions($15, 9),
    %dimensions(4, 8),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_CrateriaSuper))
    %stateChecks(0)

RoomState_CrateriaSuper:
    %StateHeader(\
    %levelData(LevelData_CrateriaSuper),
    %tileset(2),
    %music(0, 0),
    %FX(FXHeader_CrateriaSuper),
    %enemyPop(EnemyPopulations_CrateriaSuper),
    %enemySet(EnemySets_CrateriaSuper),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_CrateriaSuper),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_CrateriaSuper),
    %libraryBG(LibBG_Crateria_2_3_Mechanical),
    %setupASM(RTS_8F91D4))

RoomDoors_CrateriaSuper:
    dw Door_CrateriaSuper_0
    dw Door_CrateriaSuper_1

RoomScrolls_CrateriaSuper:
    db $01,$01,$01,$02,$00,$00,$00,$02,$00,$00,$00,$02,$00,$00,$00,$02
    db $00,$00,$00,$02,$00,$00,$00,$02,$00,$00,$00,$02,$01,$01,$01,$01

RoomHeader_FinalMissileBombway:
    %RoomHeader(\
    %room($1E),
    %area(0),
    %positions($11, 7),
    %dimensions(2, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_FinalMissileBombway))
    %stateChecks(1,
    %stateCheckEventSet(0, RoomState_FinalMissileBombway_1))

RoomState_FinalMissileBombway_0:
    %StateHeader(\
    %levelData(LevelData_FinalMissileBombway),
    %tileset(2),
    %music(0, 0),
    %FX(FXHeader_FinalMissileBombway_State0),
    %enemyPop(EnemyPopulations_FinalMissileBombway_0),
    %enemySet(EnemySets_FinalMissileBombway_0),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_FinalMissileBombway),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_FinalMissileBombway_State0),
    %libraryBG(LibBG_Crateria_2_BrickRoom),
    %setupASM(RTS_8F91D4))

RoomState_FinalMissileBombway_1:
    %StateHeader(\
    %levelData(LevelData_FinalMissileBombway),
    %tileset(2),
    %music(0, 0),
    %FX(FXHeader_FinalMissileBombway_State1),
    %enemyPop(EnemyPopulations_FinalMissileBombway_1),
    %enemySet(EnemySets_FinalMissileBombway_1),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_FinalMissileBombway),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_FinalMissileBombway_State1),
    %libraryBG(LibBG_Crateria_2_BrickRoom),
    %setupASM(RTS_8F91D4))

RoomDoors_FinalMissileBombway:
    dw Door_FinalMissileBombway_0
    dw Door_FinalMissileBombway_1

RoomScrolls_FinalMissileBombway:
    db $01,$01

RoomHeader_FinalMissile:
    %RoomHeader(\
    %room($1F),
    %area(0),
    %positions($10, 7),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_FinalMissile))
    %stateChecks(1,
    %stateCheckEventSet(0, RoomState_FinalMissile_1))

RoomState_FinalMissile_0:
    %StateHeader(\
    %levelData(LevelData_FinalMissile),
    %tileset(2),
    %music(0, 0),
    %FX(FXHeader_FinalMissile_State0),
    %enemyPop(EnemyPopulations_FinalMissile_0),
    %enemySet(EnemySets_FinalMissile_0),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_FinalMissile),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_FinalMissile_State0),
    %libraryBG(LibBG_Crateria_2_3_Mechanical),
    %setupASM(RTS_8F91D4))

RoomState_FinalMissile_1:
    %StateHeader(\
    %levelData(LevelData_FinalMissile),
    %tileset(2),
    %music(0, 0),
    %FX(FXHeader_FinalMissile_State1),
    %enemyPop(EnemyPopulations_FinalMissile_1),
    %enemySet(EnemySets_FinalMissile_1),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_FinalMissile),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_FinalMissile_State1),
    %libraryBG(LibBG_Crateria_2_3_Mechanical),
    %setupASM(RTS_8F91D4))

RoomDoors_FinalMissile:
    dw Door_FinalMissile_0

RoomScrolls_FinalMissile:
    db $01

RoomHeader_GreenBrinstarMainShaft:
    %RoomHeader(\
    %room(0),
    %area(1),
    %positions(9, 0),
    %dimensions(4, $0C),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_GreenBrinstarMainShaft))
    %stateChecks(0)

RoomState_GreenBrinstarMainShaft:
    %StateHeader(\
    %levelData(LevelData_GreenBrinstarMainShaft),
    %tileset(6),
    %music($0F, 5),
    %FX(FXHeader_GreenBrinstarMainShaft),
    %enemyPop(EnemyPopulations_GreenBrinstarMainShaft),
    %enemySet(EnemySets_GreenBrinstarMainShaft),
    %layer2Scrolls(0, $C0),
    %scrollPointer(RoomScrolls_GreenBrinstarMainShaft),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_GreenBrinstarMainShaft),
    %libraryBG(LibBG_Brinstar_6_Vertical_GlowPatches),
    %setupASM(RTS_8F91D5))

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
    db $1C,$02, $1D,$00, $80

RoomPLM_GreenBrinstarMainShaft_1_2:
    db $1C,$00, $1D,$01, $29,$01, $80

RoomPLM_GreenBrinstarMainShaft_3:
    db $18,$02, $1C,$02, $1D,$00, $29,$00, $80

RoomHeader_SporeSpawnSuper:
    %RoomHeader(\
    %room(1),
    %area(1),
    %positions($17, 1),
    %dimensions(2, 9),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_SporeSpawnSuper))
    %stateChecks(0)

RoomState_SporeSpawnSuper:
    %StateHeader(\
    %levelData(LevelData_SporeSpawnSuper),
    %tileset(6),
    %music(0, 3),
    %FX(FXHeader_SporeSpawnSuper),
    %enemyPop(EnemyPopulations_SporeSpawnSuper),
    %enemySet(EnemySets_SporeSpawnSuper),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_SporeSpawnSuper),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_SporeSpawnSuper),
    %libraryBG(LibBG_Brinstar_6_SmallPattern),
    %setupASM(RTS_8F91D5))

RoomDoors_SporeSpawnSuper:
    dw Door_SporeSpawnSuper_0
    dw Door_SporeSpawnSuper_1

RoomScrolls_SporeSpawnSuper:
    db $01,$02,$00,$02,$00,$02,$00,$02,$00,$02,$00,$02,$00,$02,$00,$02
    db $01,$01

RoomPLM_SporeSpawnSuper_0:
    db $01,$02, $03,$02, $80

RoomHeader_BrinstarPreMap:
    %RoomHeader(\
    %room(2),
    %area(1),
    %positions(6, 4),
    %dimensions(3, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_BrinstarPreMap))
    %stateChecks(0)

RoomState_BrinstarPreMap:
    %StateHeader(\
    %levelData(LevelData_BrinstarPreMap),
    %tileset(6),
    %music(0, 0),
    %FX(FXHeader_BrinstarPreMap),
    %enemyPop(EnemyPopulations_BrinstarPreMap),
    %enemySet(EnemySets_BrinstarPreMap),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_BrinstarPreMap),
    %libraryBG(LibBG_Brinstar_6_MediumHorizontalPattern),
    %setupASM(RTS_8F91D5))

RoomDoors_BrinstarPreMap:
    dw Door_BrinstarPreMap_0
    dw Door_BrinstarPreMap_1

RoomHeader_EarlySupers:
    %RoomHeader(\
    %room(3),
    %area(1),
    %positions($0A, 3),
    %dimensions(3, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_EarlySupers))
    %stateChecks(0)

RoomState_EarlySupers:
    %StateHeader(\
    %levelData(LevelData_EarlySupers),
    %tileset(6),
    %music(0, 5),
    %FX(FXHeader_EarlySupers),
    %enemyPop(EnemyPopulations_EarlySupers),
    %enemySet(EnemySets_EarlySupers),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_EarlySupers),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_EarlySupers),
    %libraryBG(LibBG_Brinstar_6_ThinHorizontalPattern),
    %setupASM(RTS_8F91D5))

RoomDoors_EarlySupers:
    dw Door_EarlySupers_0
    dw Door_EarlySupers_1

RoomScrolls_EarlySupers:
    db $00,$00,$00,$01,$01,$01

RoomPLM_EarlySupers_0_4:
    db $00,$02, $01,$02, $02,$02, $80

RoomPLM_EarlySupers_3:
    db $00,$00, $01,$00, $02,$00, $80

RoomHeader_BrinstarReserveTank:
    %RoomHeader(\
    %room(4),
    %area(1),
    %positions($0D, 4),
    %dimensions(2, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_BrinstarReserveTank))
    %stateChecks(0)

RoomState_BrinstarReserveTank:
    %StateHeader(\
    %levelData(LevelData_BrinstarReserveTank),
    %tileset(6),
    %music(0, 3),
    %FX(FXHeader_BrinstarReserveTank),
    %enemyPop(EnemyPopulations_BrinstarReserveTank),
    %enemySet(EnemySets_BrinstarReserveTank),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_BrinstarReserveTank),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_BrinstarReserveTank),
    %libraryBG(LibBG_Brinstar_6_LargeHorizontalPattern),
    %setupASM(RTS_8F91D5))

RoomDoors_BrinstarReserveTank:
    dw Door_BrinstarReserveTank_0

RoomScrolls_BrinstarReserveTank:
    db $01,$00

RoomPLM_BrinstarReserveTank_0:
    db $01,$01, $80

RoomHeader_GreenBrinstarMap:
    %RoomHeader(\
    %room(5),
    %area(1),
    %positions(5, 4),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_GreenBrinstarMap))
    %stateChecks(0)

RoomState_GreenBrinstarMap:
    %StateHeader(\
    %levelData(LevelData_MapStation_RightSideDoor),
    %tileset($15),
    %music(0, 0),
    %FX(FXHeader_GreenBrinstarMap),
    %enemyPop(EnemyPopulations_GreenBrinstarMap),
    %enemySet(EnemySets_GreenBrinstarMap),
    %layer2Scrolls(0, 0),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_GreenBrinstarMap),
    %libraryBG(0),
    %setupASM(RTS_8F91D5))

RoomDoors_GreenBrinstarMap:
    dw Door_GreenBrinstarMap_0

RoomHeader_GreenBrinstarFirefleas:
    %RoomHeader(\
    %room(6),
    %area(1),
    %positions(6, 6),
    %dimensions(3, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_GreenBrinstarFirefleas))
    %stateChecks(0)

RoomState_GreenBrinstarFirefleas:
    %StateHeader(\
    %levelData(LevelData_GreenBrinstarFirefleas),
    %tileset(6),
    %music(0, 0),
    %FX(FXHeader_GreenBrinstarFirefleas),
    %enemyPop(EnemyPopulations_GreenBrinstarFirefleas),
    %enemySet(EnemySets_GreenBrinstarFirefleas),
    %layer2Scrolls(0, 0),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_GreenBrinstarFirefleas),
    %libraryBG(0),
    %setupASM(RTS_8F91D5))

RoomDoors_GreenBrinstarFirefleas:
    dw Door_GreenBrinstarFirefleas_0
    dw Door_GreenBrinstarFirefleas_1

RoomHeader_GreenBrinstarMissileRefill:
    %RoomHeader(\
    %room(7),
    %area(1),
    %positions(5, 7),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_GreenBrinstarMissileRefill))
    %stateChecks(0)

RoomState_GreenBrinstarMissileRefill:
    %StateHeader(\
    %levelData(LevelData_MissileRefill_RightSideDoor),
    %tileset($18),
    %music(0, 0),
    %FX(FXHeader_GreenBrinstarMissileRefill),
    %enemyPop(EnemyPopulations_GreenBrinstarMissileRefill),
    %enemySet(EnemySets_GreenBrinstarMissileRefill),
    %layer2Scrolls(0, 0),
    %scrollPointer(RoomScrolls_GreenBrinstarMissileRefill),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_GreenBrinstarMissileRefill),
    %libraryBG(0),
    %setupASM(RTS_8F91D5))

RoomDoors_GreenBrinstarMissileRefill:
    dw Door_GreenBrinstarMissileRefill_0

RoomScrolls_GreenBrinstarMissileRefill:
    db $01

RoomHeader_Dachora:
    %RoomHeader(\
    %room(8),
    %area(1),
    %positions($0A, 6),
    %dimensions(7, 7),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_Dachora))
    %stateChecks(0)

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
    db $01,$01,$01,$01,$01,$01,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$02,$00,$00,$00,$00,$00,$00,$02,$00,$00,$00,$00,$00,$00
    db $02,$00,$00,$00,$00,$00,$00,$02,$00,$00,$02,$02,$02,$02,$02,$00
    db $00

RoomPLM_Dachora_6:
    db $0B,$02, $80

RoomPLM_Dachora_A_16:
    db $04,$01, $0B,$00, $80

RoomHeader_BigPink:
    %RoomHeader(\
    %room(9),
    %area(1),
    %positions($0F, 4),
    %dimensions(5, $0A),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_BigPink))
    %stateChecks(0)

RoomState_BigPink:
    %StateHeader(\
    %levelData(LevelData_BigPink),
    %tileset(6),
    %music($0F, 5),
    %FX(FXHeader_BigPink),
    %enemyPop(EnemyPopulations_BigPink),
    %enemySet(EnemySets_BigPink),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_BigPink),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_BigPink),
    %libraryBG(LibBG_Brinstar_6_DarkPattern),
    %setupASM(RTS_8F91D5))

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
    db $20,$02, $25,$02, $26,$02, $80

RoomPLM_BigPink_1:
    db $24,$02, $80

RoomPLM_BigPink_2:
    db $1D,$00, $80

RoomPLM_BigPink_3:
    db $1C,$01, $1D,$01, $80

RoomPLM_BigPink_4:
    db $01,$02, $80

RoomPLM_BigPink_5:
    db $01,$00, $80

RoomHeader_SporeSpawnKihunters:
    %RoomHeader(\
    %room($0A),
    %area(1),
    %positions($13, 4),
    %dimensions(4, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_SporeSpawnKihunters))
    %stateChecks(0)

RoomState_SporeSpawnKihunters:
    %StateHeader(\
    %levelData(LevelData_SporeSpawnKihunters),
    %tileset(6),
    %music($0F, 5),
    %FX(FXHeader_SporeSpawnKihunters),
    %enemyPop(EnemyPopulations_SporeSpawnKihunters),
    %enemySet(EnemySets_SporeSpawnKihunters),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_SporeSpawnKihunters),
    %libraryBG(LibBG_Brinstar_6_Horizontal_GlowPatches),
    %setupASM(RTS_8F91D5))

RoomDoors_SporeSpawnKihunters:
    dw Door_SporeSpawnKihunters_0
    dw Door_SporeSpawnKihunters_1

RoomHeader_SporeSpawn:
    %RoomHeader(\
    %room($0B),
    %area(1),
    %positions($16, 1),
    %dimensions(1, 3),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_SporeSpawn))
    %stateChecks(1,
    %stateCheckBossDead(2, RoomState_SporeSpawn_1))

RoomState_SporeSpawn_0:
    %StateHeader(\
    %levelData(LevelData_SporeSpawn),
    %tileset(6),
    %music($2A, 5),
    %FX(FXHeader_SporeSpawn_State0_1),
    %enemyPop(EnemyPopulations_SporeSpawn),
    %enemySet(EnemySets_SporeSpawn),
    %layer2Scrolls(0, 0),
    %scrollPointer(1),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_SporeSpawn_State0_1),
    %libraryBG(0),
    %setupASM(RTS_8F91D5))

RoomState_SporeSpawn_1:
    %StateHeader(\
    %levelData(LevelData_SporeSpawn),
    %tileset(6),
    %music(0, 3),
    %FX(FXHeader_SporeSpawn_State0_1),
    %enemyPop(EnemyPopulations_SporeSpawn),
    %enemySet(EnemySets_SporeSpawn),
    %layer2Scrolls(0, 0),
    %scrollPointer(1),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_SporeSpawn_State0_1),
    %libraryBG(0),
    %setupASM(RTS_8F91D5))

RoomDoors_SporeSpawn:
    dw Door_SporeSpawn_0
    dw Door_SporeSpawn_1

RoomHeader_PinkBrinstarPowerBombs:
    %RoomHeader(\
    %room($0C),
    %area(1),
    %positions($0F, 7),
    %dimensions(2, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_PinkBrinstarPowerBombs))
    %stateChecks(0)

RoomState_PinkBrinstarPowerBombs:
    %StateHeader(\
    %levelData(LevelData_PinkBrinstarPowerBombs),
    %tileset(6),
    %music(0, 0),
    %FX(FXHeader_PinkBrinstarPowerBombs),
    %enemyPop(EnemyPopulations_PinkBrinstarPowerBombs),
    %enemySet(EnemySets_PinkBrinstarPowerBombs),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_PinkBrinstarPowerBombs),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_PinkBrinstarPowerBombs),
    %libraryBG(LibBG_Brinstar_6_ThinHorizontalPattern),
    %setupASM(RTS_8F91D5))

RoomDoors_PinkBrinstarPowerBombs:
    dw Door_PinkBrinstarPowerBombs_0
    dw Door_PinkBrinstarPowerBombs_1

RoomScrolls_PinkBrinstarPowerBombs:
    db $01,$01,$00,$00

RoomPLM_PinkBrinstarPowerBombs_0:
    db $00,$02, $01,$00, $02,$01, $03,$01, $80

RoomPLM_PinkBrinstarPowerBombs_1:
    db $00,$01, $01,$01, $02,$00, $03,$00, $80

RoomHeader_GreenHillZone:
    %RoomHeader(\
    %room($0D),
    %area(1),
    %positions($13, $0A),
    %dimensions(8, 4),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_GreenHillZone))
    %stateChecks(0)

RoomState_GreenHillZone:
    %StateHeader(\
    %levelData(LevelData_GreenHillZone),
    %tileset(6),
    %music($0F, 5),
    %FX(FXHeader_GreenHillZone),
    %enemyPop(EnemyPopulations_GreenHillZone),
    %enemySet(EnemySets_GreenHillZone),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_GreenHillZone),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_GreenHillZone),
    %libraryBG(LibBG_Brinstar_6_SpheresPattern),
    %setupASM(RTS_8F91D5))

RoomDoors_GreenHillZone:
    dw Door_GreenHillZone_0
    dw Door_GreenHillZone_1
    dw Door_GreenHillZone_2

RoomScrolls_GreenHillZone:
    db $02,$02,$00,$00,$00,$00,$00,$00,$02,$02,$02,$02,$00,$00,$00,$00
    db $02,$02,$02,$02,$02,$02,$02,$02,$01,$01,$01,$01,$01,$01,$01,$01

RoomHeader_MorphBall:
    %RoomHeader(\
    %room($0E),
    %area(1),
    %positions($15, 8),
    %dimensions(8, 3),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_MorphBall))
    %stateChecks(1,
    %stateCheckEventSet(0, RoomState_MorphBall_1))

RoomState_MorphBall_0:
    %StateHeader(\
    %levelData(LevelData_MorphBall),
    %tileset(6),
    %music(6, 7),
    %FX(FXHeader_MorphBall_State0),
    %enemyPop(EnemyPopulations_MorphBall_0),
    %enemySet(EnemySets_MorphBall_0),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_MorphBall),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_MorphBall_State0),
    %libraryBG(LibBG_Brinstar_6_SmallPattern_Variety_0),
    %setupASM(RTS_8F91D5))

RoomState_MorphBall_1:
    %StateHeader(\
    %levelData(LevelData_MorphBall),
    %tileset(6),
    %music(9, 5),
    %FX(FXHeader_VariousRooms_8381F4),
    %enemyPop(EnemyPopulations_MorphBall_1),
    %enemySet(EnemySets_MorphBall_1),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_MorphBall),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_MorphBall_State1),
    %libraryBG(LibBG_Brinstar_6_SmallPattern_Variety_0),
    %setupASM(RTS_8F91BC))

RoomDoors_MorphBall:
    dw Door_MorphBall_0
    dw Door_MorphBall_1
    dw Door_MorphBall_2
    dw Door_VariousRooms_Elevator

RoomScrolls_MorphBall:
    db $00,$00,$00,$00,$00,$02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $01,$01,$01,$01,$01,$01,$01,$01

RoomPLM_MorphBall_0:
    db $12,$01, $80

RoomPLM_MorphBall_9:
    db $12,$00, $80

RoomPLM_MorphBall_B_D:
    db $0D,$02, $80

RoomPLM_MorphBall_F:
    db $0D,$00, $80

RoomHeader_ConstructionZone:
    %RoomHeader(\
    %room($0F),
    %area(1),
    %positions($1D, $0A),
    %dimensions(1, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_ConstructionZone))
    %stateChecks(1,
    %stateCheckEventSet(0, RoomState_ConstructionZone_1))

RoomState_ConstructionZone_0:
    %StateHeader(\
    %levelData(LevelData_ConstructionZone),
    %tileset(6),
    %music(0, 0),
    %FX(FXHeader_ConstructionZone_State0),
    %enemyPop(EnemyPopulations_ConstructionZone_0),
    %enemySet(EnemySets_ConstructionZone_0),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_ConstructionZone),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_ConstructionZone_State0_1),
    %libraryBG(LibBG_Brinstar_6_SmallPattern),
    %setupASM(RTS_8F91D5))

RoomState_ConstructionZone_1:
    %StateHeader(\
    %levelData(LevelData_ConstructionZone),
    %tileset(6),
    %music(0, 0),
    %FX(FXHeader_VariousRooms_8381F4),
    %enemyPop(EnemyPopulations_ConstructionZone_1),
    %enemySet(EnemySets_ConstructionZone_1),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_ConstructionZone),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_ConstructionZone_State0_1),
    %libraryBG(LibBG_Brinstar_6_SmallPattern),
    %setupASM(RTS_8F91BC))

RoomDoors_ConstructionZone:
    dw Door_ConstructionZone_0
    dw Door_ConstructionZone_1
    dw Door_ConstructionZone_2

RoomScrolls_ConstructionZone:
    db $01,$00

RoomPLM_ConstructionZone_0:
    db $00,$02, $01,$01, $80

RoomHeader_BlueBrinstarETank:
    %RoomHeader(\
    %room($10),
    %area(1),
    %positions($1E, 8),
    %dimensions(3, 3),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_BlueBrinstarETank))
    %stateChecks(1,
    %stateCheckEventSet(0, RoomState_BlueBrinstarETank_1))

RoomState_BlueBrinstarETank_0:
    %StateHeader(\
    %levelData(LevelData_BlueBrinstarETank),
    %tileset(6),
    %music(0, 0),
    %FX(FXHeader_BlueBrinstarETank_State0),
    %enemyPop(EnemyPopulations_BlueBrinstarETank_0),
    %enemySet(EnemySets_BlueBrinstarETank_0),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_BlueBrinstarETank),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_BlueBrinstarETank_State0_1),
    %libraryBG(LibBG_Brinstar_6_SmallPattern_Variety_0),
    %setupASM(RTS_8F91D5))

RoomState_BlueBrinstarETank_1:
    %StateHeader(\
    %levelData(LevelData_BlueBrinstarETank),
    %tileset(6),
    %music(0, 0),
    %FX(FXHeader_VariousRooms_8381F4),
    %enemyPop(EnemyPopulations_BlueBrinstarETank_1),
    %enemySet(EnemySets_BlueBrinstarETank_1),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_BlueBrinstarETank),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_BlueBrinstarETank_State0_1),
    %libraryBG(LibBG_Brinstar_6_SmallPattern_Variety_0),
    %setupASM(RTS_8F91BC))

RoomDoors_BlueBrinstarETank:
    dw Door_BlueBrinstarETank_0
    dw Door_BlueBrinstarETank_1

RoomScrolls_BlueBrinstarETank:
    db $00,$00,$02,$00,$00,$00,$01,$01,$01

RoomPLM_BlueBrinstarETank_0_1:
    db $05,$02, $80

RoomHeader_NoobBridge:
    %RoomHeader(\
    %room($11),
    %area(1),
    %positions($1B, $0D),
    %dimensions(6, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_NoobBridge))
    %stateChecks(0)

RoomState_NoobBridge:
    %StateHeader(\
    %levelData(LevelData_NoobBridge),
    %tileset(6),
    %music($0F, 5),
    %FX(FXHeader_NoobBridge),
    %enemyPop(EnemyPopulations_NoobBridge),
    %enemySet(EnemySets_NoobBridge),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_NoobBridge),
    %libraryBG(LibBG_Brinstar_6_Horizontal_GlowPatches),
    %setupASM(RTS_8F91D5))

RoomDoors_NoobBridge:
    dw Door_NoobBridge_0
    dw Door_NoobBridge_1

RoomHeader_GreenBrinstarBeetoms:
    %RoomHeader(\
    %room($12),
    %area(1),
    %positions(8, $0A),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_GreenBrinstarBeetoms))
    %stateChecks(0)

RoomState_GreenBrinstarBeetoms:
    %StateHeader(\
    %levelData(LevelData_GreenBrinstarBeetoms),
    %tileset(6),
    %music(0, 0),
    %FX(FXHeader_GreenBrinstarBeetoms),
    %enemyPop(EnemyPopulations_GreenBrinstarBeetoms),
    %enemySet(EnemySets_GreenBrinstarBeetoms),
    %layer2Scrolls(1, 1),
    %scrollPointer(RoomScrolls_GreenBrinstarBeetoms),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_GreenBrinstarBeetoms),
    %libraryBG(LibBG_Brinstar_6_Horizontal_GlowPatches),
    %setupASM(RTS_8F91D5))

RoomDoors_GreenBrinstarBeetoms:
    dw Door_GreenBrinstarBeetoms_0
    dw Door_GreenBrinstarBeetoms_1

RoomScrolls_GreenBrinstarBeetoms:
    db $01

RoomHeader_EtecoonETank:
    %RoomHeader(\
    %room($13),
    %area(1),
    %positions(6, $0A),
    %dimensions(5, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_EtecoonETank))
    %stateChecks(0)

RoomState_EtecoonETank:
    %StateHeader(\
    %levelData(LevelData_EtecoonETank),
    %tileset(6),
    %music(0, 0),
    %FX(FXHeader_EtecoonETank),
    %enemyPop(EnemyPopulations_EtecoonETank),
    %enemySet(EnemySets_EtecoonETank),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_EtecoonETank),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_EtecoonETank),
    %libraryBG(LibBG_Brinstar_6_Horizontal_GlowPatches),
    %setupASM(RTS_8F91D5))

RoomDoors_EtecoonETank:
    dw Door_EtecoonETank_0
    dw Door_EtecoonETank_1
    dw Door_EtecoonETank_2
    dw Door_EtecoonETank_3

RoomScrolls_EtecoonETank:
    db $01,$01,$00,$00,$00,$00,$00,$01,$01,$01

RoomPLM_EtecoonETank_0:
    db $01,$02, $05,$01, $06,$01, $80

RoomHeader_EtecoonSuper:
    %RoomHeader(\
    %room($14),
    %area(1),
    %positions(5, $0A),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_EtecoonSuper))
    %stateChecks(0)

RoomState_EtecoonSuper:
    %StateHeader(\
    %levelData(LevelData_EtecoonSuper),
    %tileset(6),
    %music(0, 0),
    %FX(FXHeader_EtecoonSuper),
    %enemyPop(EnemyPopulations_EtecoonSuper),
    %enemySet(EnemySets_EtecoonSuper),
    %layer2Scrolls(1, 1),
    %scrollPointer(RoomScrolls_EtecoonSuper),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_EtecoonSuper),
    %libraryBG(LibBG_Brinstar_6_Horizontal_GlowPatches),
    %setupASM(RTS_8F91D5))

RoomDoors_EtecoonSuper:
    dw Door_EtecoonSuper_0

RoomScrolls_EtecoonSuper:
    db $01

RoomHeader_DachoraEnergyRefill:
    %RoomHeader(\
    %room($15),
    %area(1),
    %positions(9, $0C),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_DachoraEnergyRefill))
    %stateChecks(0)

RoomState_DachoraEnergyRefill:
    %StateHeader(\
    %levelData(LevelData_EnergyRefill_RightSideDoor),
    %tileset($17),
    %music(0, 0),
    %FX(FXHeader_DachoraEnergyRefill),
    %enemyPop(EnemyPopulations_DachoraEnergyRefill),
    %enemySet(EnemySets_DachoraEnergyRefill),
    %layer2Scrolls(0, 0),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_DachoraEnergyRefill),
    %libraryBG(0),
    %setupASM(RTS_8F91D5))

RoomDoors_DachoraEnergyRefill:
    dw Door_DachoraEnergyRefill_0

RoomHeader_SporeSpawnFarming:
    %RoomHeader(\
    %room($16),
    %area(1),
    %positions($14, 9),
    %dimensions(3, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_SporeSpawnFarming))
    %stateChecks(0)

RoomState_SporeSpawnFarming:
    %StateHeader(\
    %levelData(LevelData_SporeSpawnFarming),
    %tileset(6),
    %music($0F, 5),
    %FX(FXHeader_SporeSpawnFarming),
    %enemyPop(EnemyPopulations_SporeSpawnFarming),
    %enemySet(EnemySets_SporeSpawnFarming),
    %layer2Scrolls($C0, 0),
    %scrollPointer(RoomScrolls_SporeSpawnFarming),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_SporeSpawnFarming),
    %libraryBG(0),
    %setupASM(RTS_8F91D5))

RoomDoors_SporeSpawnFarming:
    dw Door_SporeSpawnFarming_0
    dw Door_SporeSpawnFarming_1

RoomScrolls_SporeSpawnFarming:
    db $01,$01,$01

RoomHeader_WaterwayETank:
    %RoomHeader(\
    %room($17),
    %area(1),
    %positions(8, $0D),
    %dimensions(7, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_WaterwayETank))
    %stateChecks(0)

RoomState_WaterwayETank:
    %StateHeader(\
    %levelData(LevelData_WaterwayETank),
    %tileset(6),
    %music(0, 0),
    %FX(FXHeader_WaterwayETank),
    %enemyPop(EnemyPopulations_WaterwayETank),
    %enemySet(EnemySets_WaterwayETank),
    %layer2Scrolls($C1, 1),
    %scrollPointer(RoomScrolls_WaterwayETank),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_WaterwayETank),
    %libraryBG(LibBG_Brinstar_6_ThinHorizontalPattern),
    %setupASM(RTS_8F91D5))

RoomDoors_WaterwayETank:
    dw Door_WaterwayETank_0
    dw Door_WaterwayETank_1

RoomScrolls_WaterwayETank:
    db $00,$01,$01,$01,$01,$01,$01

RoomPLM_WaterwayETank:
    db $00,$01, $80

RoomHeader_FirstMissile:
    %RoomHeader(\
    %room($18),
    %area(1),
    %positions($1C, $0B),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_FirstMissile))
    %stateChecks(0)

RoomState_FirstMissile:
    %StateHeader(\
    %levelData(LevelData_FirstMissile),
    %tileset(6),
    %music(0, 0),
    %FX(FXHeader_FirstMissile),
    %enemyPop(EnemyPopulations_FirstMissile),
    %enemySet(EnemySets_FirstMissile),
    %layer2Scrolls(1, 1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_FirstMissile),
    %libraryBG(LibBG_Brinstar_6_SmallPattern),
    %setupASM(RTS_8F91D5))

RoomDoors_FirstMissile:
    dw Door_FirstMissile_0

RoomHeader_PinkBrinstarHoppers:
    %RoomHeader(\
    %room($19),
    %area(1),
    %positions($13, 7),
    %dimensions(2, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_PinkBrinstarHoppers))
    %stateChecks(0)

RoomState_PinkBrinstarHoppers:
    %StateHeader(\
    %levelData(LevelData_PinkBrinstarHoppers),
    %tileset(6),
    %music(0, 0),
    %FX(FXHeader_PinkBrinstarHoppers),
    %enemyPop(EnemyPopulations_PinkBrinstarHoppers),
    %enemySet(EnemySets_PinkBrinstarHoppers),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_PinkBrinstarHoppers),
    %libraryBG(LibBG_Brinstar_6_ThinHorizontalPattern),
    %setupASM(RTS_8F91D5))

RoomDoors_PinkBrinstarHoppers:
    dw Door_PinkBrinstarHoppers_0
    dw Door_PinkBrinstarHoppers_1

RoomHeader_HopperETank:
    %RoomHeader(\
    %room($1A),
    %area(1),
    %positions($15, 8),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_HopperETank))
    %stateChecks(0)

RoomState_HopperETank:
    %StateHeader(\
    %levelData(LevelData_HopperETank),
    %tileset(6),
    %music(0, 0),
    %FX(FXHeader_HopperETank),
    %enemyPop(EnemyPopulations_HopperETank),
    %enemySet(EnemySets_HopperETank),
    %layer2Scrolls(0, 0),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_HopperETank),
    %libraryBG(0),
    %setupASM(RTS_8F91D5))

RoomDoors_HopperETank:
    dw Door_HopperETank_0

RoomHeader_BigPinkSaveRoom:
    %RoomHeader(\
    %room($1B),
    %area(1),
    %positions($0F, 4),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_BigPinkSaveRoom))
    %stateChecks(0)

RoomState_BigPinkSaveRoom:
    %StateHeader(\
    %levelData(LevelData_SaveStation_RightSideDoor),
    %tileset($19),
    %music($0F, 5),
    %FX(FXHeader_BigPinkSaveRoom),
    %enemyPop(EnemyPopulations_BigPinkSaveRoom),
    %enemySet(EnemySets_BigPinkSaveRoom),
    %layer2Scrolls(0, 0),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_BigPinkSaveRoom),
    %libraryBG(0),
    %setupASM(RTS_8F91D5))

RoomDoors_BigPinkSaveRoom:
    dw Door_BigPinkSaveRoom_0

RoomHeader_BlueBrinstarBoulders:
    %RoomHeader(\
    %room($1C),
    %area(1),
    %positions($1E, 8),
    %dimensions(2, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_BlueBrinstarBoulders))
    %stateChecks(0)

RoomState_BlueBrinstarBoulders:
    %StateHeader(\
    %levelData(LevelData_BlueBrinstarBoulders),
    %tileset(6),
    %music(0, 0),
    %FX(FXHeader_BlueBrinstarBoulders),
    %enemyPop(EnemyPopulations_BlueBrinstarBoulders),
    %enemySet(EnemySets_BlueBrinstarBoulders),
    %layer2Scrolls($C1, 1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_BlueBrinstarBoulders),
    %libraryBG(LibBG_Brinstar_6_SmallPattern_Variety_0),
    %setupASM(RTS_8F91D5))

RoomDoors_BlueBrinstarBoulders:
    dw Door_BlueBrinstarBoulders_0
    dw Door_BlueBrinstarBoulders_1

RoomHeader_BillyMays:
    %RoomHeader(\
    %room($1D),
    %area(1),
    %positions($1D, 8),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_BillyMays))
    %stateChecks(0)

RoomState_BillyMays:
    %StateHeader(\
    %levelData(LevelData_BillyMays),
    %tileset(6),
    %music(0, 0),
    %FX(FXHeader_BillyMays),
    %enemyPop(EnemyPopulations_BillyMays),
    %enemySet(EnemySets_BillyMays),
    %layer2Scrolls(1, 1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_BillyMays),
    %libraryBG(LibBG_Brinstar_6_SmallPattern_Variety_0),
    %setupASM(RTS_8F91D5))

RoomDoors_BillyMays:
    dw Door_BillyMays_0

RoomHeader_GreenBrinstarSave:
    %RoomHeader(\
    %room($1E),
    %area(1),
    %positions(8, 5),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_GreenBrinstarSave))
    %stateChecks(0)

RoomState_GreenBrinstarSave:
    %StateHeader(\
    %levelData(LevelData_SaveStation_RightSideDoor),
    %tileset($19),
    %music($0F, 5),
    %FX(FXHeader_GreenBrinstarSave),
    %enemyPop(EnemyPopulations_GreenBrinstarSave),
    %enemySet(EnemySets_GreenBrinstarSave),
    %layer2Scrolls(0, 0),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_GreenBrinstarSave),
    %libraryBG(0),
    %setupASM(RTS_8F91D5))

RoomDoors_GreenBrinstarSave:
    dw Door_GreenBrinstarSave_0

RoomHeader_EtecoonSave:
    %RoomHeader(\
    %room($1F),
    %area(1),
    %positions(5, $0B),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_EtecoonSave))
    %stateChecks(0)

RoomState_EtecoonSave:
    %StateHeader(\
    %levelData(LevelData_SaveStation_RightSideDoor),
    %tileset($19),
    %music($0F, 5),
    %FX(FXHeader_EtecoonSave),
    %enemyPop(EnemyPopulations_EtecoonSave),
    %enemySet(EnemySets_EtecoonSave),
    %layer2Scrolls(0, 0),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_EtecoonSave),
    %libraryBG(0),
    %setupASM(RTS_8F91D5))

RoomDoors_EtecoonSave:
    dw Door_EtecoonSave_0

RoomHeader_RedTower:
    %RoomHeader(\
    %room($20),
    %area(1),
    %positions($21, 9),
    %dimensions(1, $0A),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_RedTower))
    %stateChecks(0)

RoomState_RedTower:
    %StateHeader(\
    %levelData(LevelData_RedTower),
    %tileset(7),
    %music($12, 5),
    %FX(FXHeader_RedTower),
    %enemyPop(EnemyPopulations_RedTower),
    %enemySet(EnemySets_RedTower),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_RedTower),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_RedTower),
    %libraryBG(LibBG_Brinstar_7_WideVerticalTower_Brick_0),
    %setupASM(RTS_8F91D6))

RoomDoors_RedTower:
    dw Door_RedTower_0
    dw Door_RedTower_1
    dw Door_RedTower_2
    dw Door_RedTower_3
    dw Door_RedTower_4

RoomScrolls_RedTower:
    db $02,$02,$02,$02,$02,$02,$01,$00,$02,$02

RoomPLM_RedTower_0:
    db $06,$02, $07,$02, $80

RoomHeader_RedBrinstarFirefleas:
    %RoomHeader(\
    %room($21),
    %area(1),
    %positions($19, $0F),
    %dimensions(8, 2),
    %scrollers($90, $A0),
    %CRE(0),
    %doorList(RoomDoors_RedBrinstarFirefleas))
    %stateChecks(0)

RoomState_RedBrinstarFirefleas:
    %StateHeader(\
    %levelData(LevelData_RedBrinstarFirefleas),
    %tileset(7),
    %music(0, 5),
    %FX(FXHeader_RedBrinstarFirefleas),
    %enemyPop(EnemyPopulations_RedBrinstarFirefleas),
    %enemySet(EnemySets_RedBrinstarFirefleas),
    %layer2Scrolls(0, 0),
    %scrollPointer(RoomScrolls_RedBrinstarFirefleas),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_RedBrinstarFirefleas),
    %libraryBG(0),
    %setupASM(RTS_8F91D6))

RoomDoors_RedBrinstarFirefleas:
    dw Door_RedBrinstarFirefleas_0
    dw Door_RedBrinstarFirefleas_1

RoomScrolls_RedBrinstarFirefleas:
    db $02,$02,$01,$01,$02,$02,$01,$01,$01,$01,$00,$00,$01,$01,$00,$00

RoomHeader_XrayScope:
    %RoomHeader(\
    %room($22),
    %area(1),
    %positions($17, $0F),
    %dimensions(2, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_XrayScope))
    %stateChecks(0)

RoomState_XrayScope:
    %StateHeader(\
    %levelData(LevelData_XrayScope),
    %tileset(7),
    %music(0, 3),
    %FX(FXHeader_XrayScope),
    %enemyPop(EnemyPopulations_XrayScope),
    %enemySet(EnemySets_XrayScope),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_XrayScope),
    %libraryBG(LibBG_Brinstar_7_MechanicalRoom_SpikeFloor),
    %setupASM(RTS_8F91D6))

RoomDoors_XrayScope:
    dw Door_XrayScope_0

RoomHeader_Hellway:
    %RoomHeader(\
    %room($23),
    %area(1),
    %positions($22, 9),
    %dimensions(3, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_Hellway))
    %stateChecks(0)

RoomState_Hellway:
    %StateHeader(\
    %levelData(LevelData_Hellway),
    %tileset(7),
    %music(0, 0),
    %FX(FXHeader_Hellway),
    %enemyPop(EnemyPopulations_Hellway),
    %enemySet(EnemySets_Hellway),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Hellway),
    %libraryBG(LibBG_Brinstar_7_VerticalTower),
    %setupASM(RTS_8F91D6))

RoomDoors_Hellway:
    dw Door_Hellway_0
    dw Door_Hellway_1

RoomHeader_Caterpillar:
    %RoomHeader(\
    %room($24),
    %area(1),
    %positions($25, 4),
    %dimensions(3, 8),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_Caterpillar))
    %stateChecks(0)

RoomState_Caterpillar:
    %StateHeader(\
    %levelData(LevelData_Caterpillar),
    %tileset(7),
    %music($12, 5),
    %FX(FXHeader_Caterpillar),
    %enemyPop(EnemyPopulations_Caterpillar),
    %enemySet(EnemySets_Caterpillar),
    %layer2Scrolls(0, 0),
    %scrollPointer(RoomScrolls_Caterpillar),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Caterpillar),
    %libraryBG(0),
    %setupASM(RTS_8F91D6))

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
    db $0F,$02, $12,$02, $80

RoomPLM_Caterpillar_2:
    db $0A,$01, $09,$02, $80

RoomPLM_Caterpillar_3:
    db $0A,$00, $80

RoomHeader_BetaPowerBomb:
    %RoomHeader(\
    %room($25),
    %area(1),
    %positions($23, 7),
    %dimensions(2, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_BetaPowerBomb))
    %stateChecks(0)

RoomState_BetaPowerBomb:
    %StateHeader(\
    %levelData(LevelData_BetaPowerBomb),
    %tileset(7),
    %music(0, 0),
    %FX(FXHeader_BetaPowerBomb),
    %enemyPop(EnemyPopulations_BetaPowerBomb),
    %enemySet(EnemySets_BetaPowerBomb),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_BetaPowerBomb),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_BetaPowerBomb),
    %libraryBG(LibBG_Brinstar_7_NarrowVerticalTower_Brick),
    %setupASM(RTS_8F91D6))

RoomDoors_BetaPowerBomb:
    dw Door_BetaPowerBomb_0

RoomScrolls_BetaPowerBomb:
    db $01,$01,$00,$00

RoomPLM_BetaPowerBomb_0:
    db $00,$02, $02,$01, $80

RoomHeader_AlphaPowerBomb:
    %RoomHeader(\
    %room($26),
    %area(1),
    %positions($22, $0B),
    %dimensions(3, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_AlphaPowerBomb))
    %stateChecks(0)

RoomState_AlphaPowerBomb:
    %StateHeader(\
    %levelData(LevelData_AlphaPowerBomb),
    %tileset(7),
    %music(0, 3),
    %FX(FXHeader_AlphaPowerBomb),
    %enemyPop(EnemyPopulations_AlphaPowerBomb),
    %enemySet(EnemySets_AlphaPowerBomb),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_AlphaPowerBomb),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_AlphaPowerBomb),
    %libraryBG(LibBG_Brinstar_7_BlueGridBlocks),
    %setupASM(RTS_8F91D6))

RoomDoors_AlphaPowerBomb:
    dw Door_AlphaPowerBomb_0

RoomScrolls_AlphaPowerBomb:
    db $00,$01,$01

RoomPLM_AlphaPowerBomb_8:
    db $00,$01, $80

RoomHeader_SkreeBoost:
    %RoomHeader(\
    %room($27),
    %area(1),
    %positions($22, $12),
    %dimensions(2, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_SkreeBoost))
    %stateChecks(0)

RoomState_SkreeBoost:
    %StateHeader(\
    %levelData(LevelData_SkreeBoost),
    %tileset(7),
    %music(0, 0),
    %FX(FXHeader_SkreeBoost),
    %enemyPop(EnemyPopulations_SkreeBoost),
    %enemySet(EnemySets_SkreeBoost),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_SkreeBoost),
    %libraryBG(LibBG_Brinstar_7_NarrowVerticalTower_Brick),
    %setupASM(RTS_8F91D6))

RoomDoors_SkreeBoost:
    dw Door_SkreeBoost_0
    dw Door_SkreeBoost_1

RoomHeader_BelowSpazer:
    %RoomHeader(\
    %room($28),
    %area(1),
    %positions($24, $11),
    %dimensions(2, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_BelowSpazer))
    %stateChecks(0)

RoomState_BelowSpazer:
    %StateHeader(\
    %levelData(LevelData_BelowSpazer),
    %tileset(7),
    %music(0, 5),
    %FX(FXHeader_BelowSpazer),
    %enemyPop(EnemyPopulations_BelowSpazer),
    %enemySet(EnemySets_BelowSpazer),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_BelowSpazer),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_BelowSpazer),
    %libraryBG(LibBG_Brinstar_7_VerticalBrick_0),
    %setupASM(RTS_8F91D6))

RoomDoors_BelowSpazer:
    dw Door_BelowSpazer_0
    dw Door_BelowSpazer_1
    dw Door_BelowSpazer_2

RoomScrolls_BelowSpazer:
    db $00,$00,$01,$01

RoomPLM_BelowSpazer_0_8_A:
    db $00,$02, $01,$02, $80

RoomPLM_BelowSpazer_4_9_B:
    db $00,$00, $01,$00, $02,$01, $03,$01, $80

RoomHeader_Spazer:
    %RoomHeader(\
    %room($29),
    %area(1),
    %positions($26, $11),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_Spazer))
    %stateChecks(0)

RoomState_Spazer:
    %StateHeader(\
    %levelData(LevelData_Spazer),
    %tileset(7),
    %music(0, 3),
    %FX(FXHeader_Spazer),
    %enemyPop(EnemyPopulations_Spazer),
    %enemySet(EnemySets_Spazer),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_Spazer),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Spazer),
    %libraryBG(LibBG_Brinstar_7_BlueGridBlocks),
    %setupASM(RTS_8F91D6))

RoomDoors_Spazer:
    dw Door_Spazer_0

RoomScrolls_Spazer:
    db $01

RoomHeader_WarehouseZeela:
    %RoomHeader(\
    %room($2A),
    %area(1),
    %positions($2C, $12),
    %dimensions(2, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_WarehouseZeela))
    %stateChecks(0)

RoomState_WarehouseZeela:
    %StateHeader(\
    %levelData(LevelData_WarehouseZeela),
    %tileset(7),
    %music(0, 5),
    %FX(FXHeader_VariousRooms_8383D2),
    %enemyPop(EnemyPopulations_WarehouseZeela),
    %enemySet(EnemySets_WarehouseZeela),
    %layer2Scrolls($C0, 0),
    %scrollPointer(RoomScrolls_WarehouseZeela),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_WarehouseZeela),
    %libraryBG(0),
    %setupASM(RTS_8F91D6))

RoomDoors_WarehouseZeela:
    dw Door_WarehouseZeela_0
    dw Door_WarehouseZeela_1
    dw Door_WarehouseZeela_2

RoomScrolls_WarehouseZeela:
    db $01,$00,$00,$01

RoomPLM_WarehouseZeela_0:
    db $00,$02, $02,$01, $03,$00, $80

RoomPLM_WarehouseZeela_1_3:
    db $00,$02, $02,$01, $80

RoomPLM_WarehouseZeela_2:
    db $03,$01, $80

RoomHeader_WarehouseETank:
    %RoomHeader(\
    %room($2B),
    %area(1),
    %positions($2B, $13),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_WarehouseETank))
    %stateChecks(0)

RoomState_WarehouseETank:
    %StateHeader(\
    %levelData(LevelData_WarehouseETank),
    %tileset(7),
    %music(0, 0),
    %FX(FXHeader_VariousRooms_8383D2),
    %enemyPop(EnemyPopulations_WarehouseETank),
    %enemySet(EnemySets_WarehouseETank),
    %layer2Scrolls($C0, 0),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_WarehouseETank),
    %libraryBG(0),
    %setupASM(RTS_8F91D6))

RoomDoors_WarehouseETank:
    dw Door_WarehouseETank_0

RoomHeader_WarehouseKihunter:
    %RoomHeader(\
    %room($2C),
    %area(1),
    %positions($2D, $12),
    %dimensions(4, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_WarehouseKihunter))
    %stateChecks(0)

RoomState_WarehouseKihunter:
    %StateHeader(\
    %levelData(LevelData_WarehouseKihunter),
    %tileset(7),
    %music($12, 5),
    %FX(FXHeader_VariousRooms_8383D2),
    %enemyPop(EnemyPopulations_WarehouseKihunter),
    %enemySet(EnemySets_WarehouseKihunter),
    %layer2Scrolls($C0, 0),
    %scrollPointer(RoomScrolls_WarehouseKihunter),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_WarehouseKihunter),
    %libraryBG(0),
    %setupASM(RTS_8F91D6))

RoomDoors_WarehouseKihunter:
    dw Door_WarehouseKihunter_0
    dw Door_WarehouseKihunter_1
    dw Door_WarehouseKihunter_2

RoomScrolls_WarehouseKihunter:
    db $02,$01,$01,$00,$00,$01,$00,$00

RoomPLM_WarehouseKihunter_0:
    db $01,$01, $05,$00, $80

RoomPLM_WarehouseKihunter_1:
    db $01,$02, $05,$01, $80

RoomPLM_WarehouseKihunter_9:
    db $05,$00, $80

RoomPLM_WarehouseKihunter_A_B:
    db $03,$01, $05,$00, $80

RoomHeader_MiniKraid:
    %RoomHeader(\
    %room($2D),
    %area(1),
    %positions($2F, $13),
    %dimensions(6, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_MiniKraid))
    %stateChecks(1,
    %stateCheckBossDead(1, RoomState_MiniKraid_1))

RoomState_MiniKraid_0:
    %StateHeader(\
    %levelData(LevelData_MiniKraid),
    %tileset(7),
    %music($27, 6),
    %FX(FXHeader_MiniKraid_State0_1),
    %enemyPop(EnemyPopulations_MiniKraid),
    %enemySet(EnemySets_MiniKraid),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_MiniKraid_State0_1),
    %libraryBG(LibBG_Brinstar_7_NarrowVerticalTower_Brick_Vines_0),
    %setupASM(RTS_8F91D6))

RoomState_MiniKraid_1:
    %StateHeader(\
    %levelData(LevelData_MiniKraid),
    %tileset(7),
    %music($27, 3),
    %FX(FXHeader_MiniKraid_State0_1),
    %enemyPop(EnemyPopulations_MiniKraid),
    %enemySet(EnemySets_MiniKraid),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_MiniKraid_State0_1),
    %libraryBG(LibBG_Brinstar_7_NarrowVerticalTower_Brick_Vines_0),
    %setupASM(RTS_8F91D6))

RoomDoors_MiniKraid:
    dw Door_MiniKraid_0
    dw Door_MiniKraid_1

RoomHeader_KraidEyeDoor:
    %RoomHeader(\
    %room($2E),
    %area(1),
    %positions($35, $12),
    %dimensions(2, 2),
    %scrollers($70, $A0),
    %CRE(2),
    %doorList(RoomDoors_KraidEyeDoor))
    %stateChecks(0)

RoomState_KraidEyeDoor:
    %StateHeader(\
    %levelData(LevelData_KraidEyeDoor),
    %tileset(7),
    %music(0, 0),
    %FX(FXHeader_KraidEyeDoor),
    %enemyPop(EnemyPopulations_KraidEyeDoor),
    %enemySet(EnemySets_KraidEyeDoor),
    %layer2Scrolls(0, 0),
    %scrollPointer(RoomScrolls_KraidEyeDoor),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_KraidEyeDoor),
    %libraryBG(0),
    %setupASM(RTS_8F91D6))

RoomDoors_KraidEyeDoor:
    dw Door_KraidEyeDoor_0
    dw Door_KraidEyeDoor_1
    dw Door_KraidEyeDoor_2

RoomScrolls_KraidEyeDoor:
    db $00,$00,$01,$01

RoomPLM_KraidEyeDoor_0:
    db $00,$02, $80

RoomHeader_Kraid:
    %RoomHeader(\
    %room($2F),
    %area(1),
    %positions($37, $12),
    %dimensions(2, 2),
    %scrollers($70, $A0),
    %CRE(5),
    %doorList(RoomDoors_Kraid))
    %stateChecks(1,
    %stateCheckBossDead(1, RoomState_Kraid_1))

RoomState_Kraid_0:
    %StateHeader(\
    %levelData(LevelData_Kraid),
    %tileset($1A),
    %music($27, 6),
    %FX(FXHeader_Kraid_State0),
    %enemyPop(EnemyPopulations_Kraid),
    %enemySet(EnemySets_Kraid),
    %layer2Scrolls(1, 1),
    %scrollPointer(RoomScrolls_Kraid),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Kraid_State0_1),
    %libraryBG(LibBG_Brinstar_1A_Kraid_Upper_Lower),
    %setupASM(RTS_8F91D6))

RoomState_Kraid_1:
    %StateHeader(\
    %levelData(LevelData_Kraid),
    %tileset($1A),
    %music(0, 0),
    %FX(FXHeader_Kraid_State0),
    %enemyPop(EnemyPopulations_Kraid),
    %enemySet(EnemySets_Kraid),
    %layer2Scrolls(1, 1),
    %scrollPointer(RoomScrolls_Kraid),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Kraid_State0_1),
    %libraryBG(LibBG_Standard_BG3_Tiles),
    %setupASM(RTS_8F91D6))

RoomDoors_Kraid:
    dw Door_Kraid_0
    dw Door_Kraid_1

RoomScrolls_Kraid:
    db $02,$02,$01,$01

RoomHeader_StatuesHallway:
    %RoomHeader(\
    %room($30),
    %area(0),
    %positions($0C, 8),
    %dimensions(5, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_StatuesHallway))
    %stateChecks(0)

RoomState_StatuesHallway:
    %StateHeader(\
    %levelData(LevelData_StatuesHallway),
    %tileset(8),
    %music(0, 4),
    %FX(FXHeader_Kraid_State1),
    %enemyPop(EnemyPopulations_StatuesHallway),
    %enemySet(EnemySets_StatuesHallway),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_StatuesHallway),
    %libraryBG(LibBG_Brinstar_8_NarrowVerticalTower_Brick_Grey_0),
    %setupASM(RTS_8F91D6))

RoomDoors_StatuesHallway:
    dw Door_StatuesHallway_0
    dw Door_StatuesHallway_1

RoomHeader_RedTowerRefill:
    %RoomHeader(\
    %room($31),
    %area(1),
    %positions($20, $12),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_RedTowerRefill))
    %stateChecks(0)

RoomState_RedTowerRefill:
    %StateHeader(\
    %levelData(LevelData_EnergyRefill_RightSideDoor),
    %tileset($17),
    %music(0, 0),
    %FX(FXHeader_RedTowerRefill),
    %enemyPop(EnemyPopulations_RedTowerRefill),
    %enemySet(EnemySets_RedTowerRefill),
    %layer2Scrolls(0, 0),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_RedTowerRefill),
    %libraryBG(0),
    %setupASM(RTS_8F91D6))

RoomDoors_RedTowerRefill:
    dw Door_RedTowerRefill_0

RoomHeader_KraidRefill:
    %RoomHeader(\
    %room($32),
    %area(1),
    %positions($36, $12),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_KraidRefill))
    %stateChecks(0)

RoomState_KraidRefill:
    %StateHeader(\
    %levelData(LevelData_RefillStation_LeftSideDoor),
    %tileset($18),
    %music(0, 0),
    %FX(FXHeader_KraidRefill),
    %enemyPop(EnemyPopulations_KraidRefill),
    %enemySet(EnemySets_KraidRefill),
    %layer2Scrolls(0, 0),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_KraidRefill),
    %libraryBG(0),
    %setupASM(RTS_8F91D6))

RoomDoors_KraidRefill:
    dw Door_KraidRefill_0

RoomHeader_Statues:
    %RoomHeader(\
    %room($33),
    %area(0),
    %positions($11, 8),
    %dimensions(1, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_Statues))
    %stateChecks(0)

RoomState_Statues:
    %StateHeader(\
    %levelData(LevelData_Statues),
    %tileset($15),
    %music(9, 6),
    %FX(FXHeader_Statues),
    %enemyPop(EnemyPopulations_Statues),
    %enemySet(EnemySets_Statues),
    %layer2Scrolls($81, 1),
    %scrollPointer(RoomScrolls_Statues),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Statues),
    %libraryBG(LibBG_Tourian_15_Statues),
    %setupASM(SetupASM_RunStatueUnlockingAnimations))

RoomDoors_Statues:
    dw Door_Statues_0
    dw Door_Statues_1
    dw Door_VariousRooms_Elevator

RoomScrolls_Statues:
    db $01,$00

if !FEATURE_KEEP_UNREFERENCED
UNUSED_RoomPLM_8FA699:
    db $00,$02, $01,$01, $80

UNUSED_RoomPLM_8FA69E:
    db $01,$02, $80
endif ; !FEATURE_KEEP_UNREFERENCED

RoomHeader_WarehouseEntrance:
    %RoomHeader(\
    %room($34),
    %area(1),
    %positions($29, $12),
    %dimensions(3, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_WarehouseEntrance))
    %stateChecks(0)

RoomState_WarehouseEntrance:
    %StateHeader(\
    %levelData(LevelData_WarehouseEntrance),
    %tileset(7),
    %music($12, 3),
    %FX(FXHeader_WarehouseEntrance),
    %enemyPop(EnemyPopulations_WarehouseEntrance),
    %enemySet(EnemySets_WarehouseEntrance),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_WarehouseEntrance),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_WarehouseEntrance),
    %libraryBG(LibBG_Brinstar_7_MechanicalRoom),
    %setupASM(RTS_8F91F4))

RoomDoors_WarehouseEntrance:
    dw Door_WarehouseEntrance_0
    dw Door_WarehouseEntrance_1
    dw Door_WarehouseEntrance_2
    dw Door_VariousRooms_Elevator

RoomScrolls_WarehouseEntrance:
    db $01,$00,$02,$00,$01,$01

RoomPLM_WarehouseEntrance_0:
    db $00,$02, $80

RoomPLM_WarehouseEntrance_2:
    db $01,$02, $80

RoomPLM_WarehouseEntrance_5:
    db $00,$01, $80

RoomPLM_WarehouseEntrance_9:
    db $00,$00, $80

RoomHeader_VariaSuit:
    %RoomHeader(\
    %room($35),
    %area(1),
    %positions($39, $13),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(2),
    %doorList(RoomDoors_VariaSuit))
    %stateChecks(0)

RoomState_VariaSuit:
    %StateHeader(\
    %levelData(LevelData_VariaSuit),
    %tileset(7),
    %music(0, 3),
    %FX(FXHeader_VariaSuit),
    %enemyPop(EnemyPopulations_VariaSuit),
    %enemySet(EnemySets_VariaSuit),
    %layer2Scrolls(0, 0),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_VariaSuit),
    %libraryBG(0),
    %setupASM(RTS_8F91F4))

RoomDoors_VariaSuit:
    dw Door_VariaSuit_0

RoomHeader_WarehouseSave:
    %RoomHeader(\
    %room($36),
    %area(1),
    %positions($31, $12),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_WarehouseSave))
    %stateChecks(0)

RoomState_WarehouseSave:
    %StateHeader(\
    %levelData(LevelData_SaveStation_LeftSideDoor),
    %tileset($19),
    %music($12, 5),
    %FX(FXHeader_WarehouseSave),
    %enemyPop(EnemyPopulations_WarehouseSave),
    %enemySet(EnemySets_WarehouseSave),
    %layer2Scrolls(0, 0),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_WarehouseSave),
    %libraryBG(0),
    %setupASM(RTS_8F91F4))

RoomDoors_WarehouseSave:
    dw Door_WarehouseSave_0

RoomHeader_RedBrinstarSave:
    %RoomHeader(\
    %room($37),
    %area(1),
    %positions($26, 8),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_RedBrinstarSave))
    %stateChecks(0)

RoomState_RedBrinstarSave:
    %StateHeader(\
    %levelData(LevelData_SaveStation_LeftSideDoor),
    %tileset($19),
    %music($12, 5),
    %FX(FXHeader_RedBrinstarSave),
    %enemyPop(EnemyPopulations_RedBrinstarSave),
    %enemySet(EnemySets_RedBrinstarSave),
    %layer2Scrolls(0, 0),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_RedBrinstarSave),
    %libraryBG(0),
    %setupASM(RTS_8F91F4))

RoomDoors_RedBrinstarSave:
    dw Door_RedBrinstarSave_0

RoomHeader_IceBeamAcid:
    %RoomHeader(\
    %room(0),
    %area(2),
    %positions(4, 3),
    %dimensions(2, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_IceBeamAcid))
    %stateChecks(0)

RoomState_IceBeamAcid:
    %StateHeader(\
    %levelData(LevelData_IceBeamAcid),
    %tileset(9),
    %music(0, 0),
    %FX(FXHeader_IceBeamAcid),
    %enemyPop(EnemyPopulations_IceBeamAcid),
    %enemySet(EnemySets_IceBeamAcid),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_IceBeamAcid),
    %libraryBG(LibBG_Norfair_9_A_SmallPatternBrownPurple_Bright),
    %setupASM(RTS_8F91F5))

RoomDoors_IceBeamAcid:
    dw Door_IceBeamAcid_0
    dw Door_IceBeamAcid_1

RoomHeader_Cathedral:
    %RoomHeader(\
    %room(1),
    %area(2),
    %positions($0E, 3),
    %dimensions(3, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_Cathedral))
    %stateChecks(0)

RoomState_Cathedral:
    %StateHeader(\
    %levelData(LevelData_Cathedral),
    %tileset(9),
    %music(0, 0),
    %FX(FXHeader_Cathedral),
    %enemyPop(EnemyPopulations_Cathedral),
    %enemySet(EnemySets_Cathedral),
    %layer2Scrolls(0, 0),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Cathedral),
    %libraryBG(0),
    %setupASM(RTS_8F91F5))

RoomDoors_Cathedral:
    dw Door_Cathedral_0
    dw Door_Cathedral_1

RoomHeader_CathedralEntrance:
    %RoomHeader(\
    %room(2),
    %area(2),
    %positions($0B, 3),
    %dimensions(3, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_CathedralEntrance))
    %stateChecks(0)

RoomState_CathedralEntrance:
    %StateHeader(\
    %levelData(LevelData_CathedralEntrance),
    %tileset(9),
    %music(0, 0),
    %FX(FXHeader_CathedralEntrance),
    %enemyPop(EnemyPopulations_CathedralEntrance),
    %enemySet(EnemySets_CathedralEntrance),
    %layer2Scrolls(0, 0),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_CathedralEntrance),
    %libraryBG(0),
    %setupASM(RTS_8F91F5))

RoomDoors_CathedralEntrance:
    dw Door_CathedralEntrance_0
    dw Door_CathedralEntrance_1

RoomHeader_BusinessCenter:
    %RoomHeader(\
    %room(3),
    %area(2),
    %positions($0A, 0),
    %dimensions(1, 7),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_BusinessCenter))
    %stateChecks(0)

RoomState_BusinessCenter:
    %StateHeader(\
    %levelData(LevelData_BusinessCenter),
    %tileset($0A),
    %music($15, 5),
    %FX(FXHeader_BusinessCenter),
    %enemyPop(EnemyPopulations_BusinessCenter),
    %enemySet(EnemySets_BusinessCenter),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_BusinessCenter),
    %libraryBG(LibBG_Norfair_9_A_CavernVertical),
    %setupASM(RTS_8F91F5))

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
    %RoomHeader(\
    %room(4),
    %area(2),
    %positions(3, 1),
    %dimensions(7, 4),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_IceBeamGate))
    %stateChecks(0)

RoomState_IceBeamGate:
    %StateHeader(\
    %levelData(LevelData_IceBeamGate),
    %tileset($0A),
    %music(0, 0),
    %FX(FXHeader_IceBeamGate),
    %enemyPop(EnemyPopulations_IceBeamGate),
    %enemySet(EnemySets_IceBeamGate),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_IceBeamGate),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_IceBeamGate),
    %libraryBG(LibBG_Norfair_9_A_SmallPatternBrownPurple_0),
    %setupASM(RTS_8F91F5))

RoomDoors_IceBeamGate:
    dw Door_IceBeamGate_0
    dw Door_IceBeamGate_1
    dw Door_IceBeamGate_2
    dw Door_IceBeamGate_3

RoomScrolls_IceBeamGate:
    db $00,$00,$00,$02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$01,$01,$01,$01,$01,$01,$01,$00,$00,$00,$00

RoomPLM_IceBeamGate_0:
    db $11,$02, $18,$01, $80

RoomHeader_IceBeamTutorial:
    %RoomHeader(\
    %room(5),
    %area(2),
    %positions(4, 1),
    %dimensions(2, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_IceBeamTutorial))
    %stateChecks(0)

RoomState_IceBeamTutorial:
    %StateHeader(\
    %levelData(LevelData_IceBeamTutorial),
    %tileset(9),
    %music(0, 0),
    %FX(FXHeader_IceBeamTutorial),
    %enemyPop(EnemyPopulations_IceBeamTutorial),
    %enemySet(EnemySets_IceBeamTutorial),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_IceBeamTutorial),
    %libraryBG(LibBG_Norfair_9_A_SmallPatternBrownPurple_Bright),
    %setupASM(RTS_8F91F5))

RoomDoors_IceBeamTutorial:
    dw Door_IceBeamTutorial_0
    dw Door_IceBeamTutorial_1

RoomHeader_IceBeam:
    %RoomHeader(\
    %room(6),
    %area(2),
    %positions(5, 2),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_IceBeam))
    %stateChecks(0)

RoomState_IceBeam:
    %StateHeader(\
    %levelData(LevelData_IceBeam),
    %tileset($0A),
    %music(0, 3),
    %FX(FXHeader_IceBeam),
    %enemyPop(EnemyPopulations_IceBeam),
    %enemySet(EnemySets_IceBeam),
    %layer2Scrolls(1, 1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_IceBeam),
    %libraryBG(LibBG_Norfair_9_A_SmallPatternBrownPurple_0),
    %setupASM(RTS_8F91F5))

RoomDoors_IceBeam:
    dw Door_IceBeam_0

RoomHeader_IceBeamSnake:
    %RoomHeader(\
    %room(7),
    %area(2),
    %positions(3, 1),
    %dimensions(2, 3),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_IceBeamSnake))
    %stateChecks(0)

RoomState_IceBeamSnake:
    %StateHeader(\
    %levelData(LevelData_IceBeamSnake),
    %tileset(9),
    %music(0, 5),
    %FX(FXHeader_IceBeamSnake),
    %enemyPop(EnemyPopulations_IceBeamSnake),
    %enemySet(EnemySets_IceBeamSnake),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_IceBeamSnake),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_IceBeamSnake),
    %libraryBG(LibBG_Norfair_9_A_SmallPatternBrownPurple_0),
    %setupASM(RTS_8F91F5))

RoomDoors_IceBeamSnake:
    dw Door_IceBeamSnake_0
    dw Door_IceBeamSnake_1
    dw Door_IceBeamSnake_2

RoomScrolls_IceBeamSnake:
    db $02,$00,$02,$00,$01,$00

RoomPLM_IceBeamSnake_0:
    db $03,$01, $80

RoomPLM_IceBeamSnake_1:
    db $03,$00, $80

RoomPLM_IceBeamSnake_2:
    db $02,$02, $80

RoomPLM_IceBeamSnake_3:
    db $02,$00, $80

RoomHeader_CrumbleShaft:
    %RoomHeader(\
    %room(8),
    %area(2),
    %positions(2, 4),
    %dimensions(1, 4),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_CrumbleShaft))
    %stateChecks(0)

RoomState_CrumbleShaft:
    %StateHeader(\
    %levelData(LevelData_CrumbleShaft),
    %tileset(9),
    %music(0, 0),
    %FX(FXHeader_CrumbleShaft),
    %enemyPop(EnemyPopulations_CrumbleShaft),
    %enemySet(EnemySets_CrumbleShaft),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_CrumbleShaft),
    %libraryBG(LibBG_Norfair_9_A_CavernVertical),
    %setupASM(RTS_8F91F5))

RoomDoors_CrumbleShaft:
    dw Door_CrumbleShaft_0
    dw Door_CrumbleShaft_1

RoomHeader_CrocomireSpeedway:
    %RoomHeader(\
    %room(9),
    %area(2),
    %positions(3, 7),
    %dimensions($0D, 3),
    %scrollers($70, $A0),
    %CRE(2),
    %doorList(RoomDoors_CrocomireSpeedway))
    %stateChecks(0)

RoomState_CrocomireSpeedway:
    %StateHeader(\
    %levelData(LevelData_CrocomireSpeedway),
    %tileset(9),
    %music($15, 5),
    %FX(FXHeader_CrocomireSpeedway),
    %enemyPop(EnemyPopulations_CrocomireSpeedway),
    %enemySet(EnemySets_CrocomireSpeedway),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_CrocomireSpeedway),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_CrocomireSpeedway),
    %libraryBG(LibBG_Norfair_9_A_SmallPatternBrownPurple_0),
    %setupASM(RTS_8F91F5))

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
    db $19,$02, $26,$02, $80
endif ; !FEATURE_KEEP_UNREFERENCED

RoomPLM_CrocomireSpeedway_0:
    db $19,$02, $25,$02, $26,$02, $80

RoomPLM_CrocomireSpeedway_5:
    db $25,$02, $80

RoomPLM_CrocomireSpeedway_8:
    db $25,$00, $80

RoomHeader_Crocomire:
    %RoomHeader(\
    %room($0A),
    %area(2),
    %positions($0C, $0A),
    %dimensions(8, 1),
    %scrollers($70, $A0),
    %CRE(1),
    %doorList(RoomDoors_Crocomire))
    %stateChecks(1,
    %stateCheckBossDead(2, RoomState_Crocomire_1))

RoomState_Crocomire_0:
    %StateHeader(\
    %levelData(LevelData_Crocomire),
    %tileset($1B),
    %music($27, 5),
    %FX(FXHeader_Crocomire_State0_1),
    %enemyPop(EnemyPopulations_Crocomire),
    %enemySet(EnemySets_Crocomire),
    %layer2Scrolls(1, 1),
    %scrollPointer(RoomScrolls_Crocomire),
    %specialXray(0),
    %mainASM(MainASM_CrocomiresRoomShaking),
    %PLMPop(PLMPopulation_Crocomire_State0_1),
    %libraryBG(LibBG_Crocomire_State0),
    %setupASM(RTS_8F91F6))

RoomState_Crocomire_1:
    %StateHeader(\
    %levelData(LevelData_Crocomire),
    %tileset($1B),
    %music(0, 0),
    %FX(FXHeader_Crocomire_State0_1),
    %enemyPop(EnemyPopulations_Crocomire),
    %enemySet(EnemySets_Crocomire),
    %layer2Scrolls(1, 1),
    %scrollPointer(RoomScrolls_Crocomire),
    %specialXray(0),
    %mainASM(MainASM_CrocomiresRoomShaking),
    %PLMPop(PLMPopulation_Crocomire_State0_1),
    %libraryBG(LibBG_Crocomire_State1),
    %setupASM(RTS_8F91F6))

RoomDoors_Crocomire:
    dw Door_Crocomire_0
    dw Door_Crocomire_1

RoomScrolls_Crocomire:
    db $00,$00,$01,$01,$01,$01,$01,$01

if !FEATURE_KEEP_UNREFERENCED
UNUSED_RoomPLM_8FA9DF:
    db $01,$01, $80

UNUSED_RoomPLM_8FA9E2:
    db $00,$01, $80
endif ; !FEATURE_KEEP_UNREFERENCED

RoomHeader_HiJumpBoots:
    %RoomHeader(\
    %room($0B),
    %area(2),
    %positions(7, 6),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_HiJumpBoots))
    %stateChecks(0)

RoomState_HiJumpBoots:
    %StateHeader(\
    %levelData(LevelData_HiJumpBoots),
    %tileset($0A),
    %music(0, 3),
    %FX(FXHeader_HiJumpBoots),
    %enemyPop(EnemyPopulations_HiJumpBoots),
    %enemySet(EnemySets_HiJumpBoots),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_HiJumpBoots),
    %libraryBG(LibBG_Norfair_9_A_SmallPatternBrownPurple_Bright),
    %setupASM(RTS_8F91F6))

RoomDoors_HiJumpBoots:
    dw Door_HiJumpBoots_0

RoomHeader_CrocomireEscape:
    %RoomHeader(\
    %room($0C),
    %area(2),
    %positions($0B, 6),
    %dimensions(4, 2),
    %scrollers($90, $A0),
    %CRE(0),
    %doorList(RoomDoors_CrocomireEscape))
    %stateChecks(0)

RoomState_CrocomireEscape:
    %StateHeader(\
    %levelData(LevelData_CrocomireEscape),
    %tileset(9),
    %music(0, 0),
    %FX(FXHeader_CrocomireEscape),
    %enemyPop(EnemyPopulations_CrocomireEscape),
    %enemySet(EnemySets_CrocomireEscape),
    %layer2Scrolls($C0, 0),
    %scrollPointer(RoomScrolls_CrocomireEscape),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_CrocomireEscape),
    %libraryBG(0),
    %setupASM(RTS_8F91F6))

RoomDoors_CrocomireEscape:
    dw Door_CrocomireEscape_0
    dw Door_CrocomireEscape_1

RoomScrolls_CrocomireEscape:
    db $02,$02,$02,$02,$01,$01,$01,$01

RoomHeader_HiJumpETank:
    %RoomHeader(\
    %room($0D),
    %area(2),
    %positions(8, 5),
    %dimensions(2, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_HiJumpETank))
    %stateChecks(0)

RoomState_HiJumpETank:
    %StateHeader(\
    %levelData(LevelData_HiJumpETank),
    %tileset($0A),
    %music(0, 5),
    %FX(FXHeader_HiJumpETank),
    %enemyPop(EnemyPopulations_HiJumpETank),
    %enemySet(EnemySets_HiJumpETank),
    %layer2Scrolls($C0, 0),
    %scrollPointer(RoomScrolls_HiJumpETank),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_HiJumpETank),
    %libraryBG(0),
    %setupASM(RTS_8F91F6))

RoomDoors_HiJumpETank:
    dw Door_HiJumpETank_0
    dw Door_HiJumpETank_1

RoomScrolls_HiJumpETank:
    db $00,$01,$00,$00

RoomPLM_HiJumpETank_1:
    db $00,$02, $02,$02, $80

RoomPLM_HiJumpETank_0:
    db $00,$02, $02,$02, $03,$02, $80

RoomPLM_HiJumpETank_2:
    db $03,$00, $80

RoomPLM_HiJumpETank_3:
    db $03,$02, $80

RoomHeader_PostCrocFarming:
    %RoomHeader(\
    %room($0E),
    %area(2),
    %positions($0A, $0A),
    %dimensions(2, 2),
    %scrollers($90, $A0),
    %CRE(2),
    %doorList(RoomDoors_PostCrocFarming))
    %stateChecks(0)

RoomState_PostCrocFarming:
    %StateHeader(\
    %levelData(LevelData_PostCrocFarming),
    %tileset(9),
    %music($15, 5),
    %FX(FXHeader_PostCrocFarming),
    %enemyPop(EnemyPopulations_PostCrocFarming),
    %enemySet(EnemySets_PostCrocFarming),
    %layer2Scrolls(0, 0),
    %scrollPointer(RoomScrolls_PostCrocFarming),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_PostCrocFarming),
    %libraryBG(0),
    %setupASM(RTS_8F91F6))

RoomDoors_PostCrocFarming:
    dw Door_PostCrocFarming_0
    dw Door_PostCrocFarming_1
    dw Door_PostCrocFarming_2
    dw Door_PostCrocFarming_3

RoomScrolls_PostCrocFarming:
    db $02,$02,$02,$02

RoomHeader_PostCrocSave:
    %RoomHeader(\
    %room($0F),
    %area(2),
    %positions($0C, $0B),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_PostCrocSave))
    %stateChecks(0)

RoomState_PostCrocSave:
    %StateHeader(\
    %levelData(LevelData_SaveStation_LeftSideDoor),
    %tileset($19),
    %music($15, 5),
    %FX(FXHeader_PostCrocSave),
    %enemyPop(EnemyPopulations_PostCrocSave),
    %enemySet(EnemySets_PostCrocSave),
    %layer2Scrolls(0, 0),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_PostCrocSave),
    %libraryBG(0),
    %setupASM(RTS_8F91F6))

RoomDoors_PostCrocSave:
    dw Door_PostCrocSave_0

RoomHeader_PostCrocPowerBombs:
    %RoomHeader(\
    %room($10),
    %area(2),
    %positions(9, $0A),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_PostCrocPowerBombs))
    %stateChecks(0)

RoomState_PostCrocPowerBombs:
    %StateHeader(\
    %levelData(LevelData_PostCrocPowerBombs),
    %tileset(9),
    %music(0, 0),
    %FX(FXHeader_PostCrocPowerBombs),
    %enemyPop(EnemyPopulations_PostCrocPowerBombs),
    %enemySet(EnemySets_PostCrocPowerBombs),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_PostCrocPowerBombs),
    %libraryBG(LibBG_Norfair_9_A_CavernStalagtites),
    %setupASM(RTS_8F91F6))

RoomDoors_PostCrocPowerBombs:
    dw Door_PostCrocPowerBombs_0

RoomHeader_PostCrocShaft:
    %RoomHeader(\
    %room($11),
    %area(2),
    %positions($0A, $0C),
    %dimensions(1, 5),
    %scrollers($90, $A0),
    %CRE(0),
    %doorList(RoomDoors_PostCrocShaft))
    %stateChecks(0)

RoomState_PostCrocShaft:
    %StateHeader(\
    %levelData(LevelData_PostCrocShaft),
    %tileset($0A),
    %music(0, 0),
    %FX(FXHeader_PostCrocShaft),
    %enemyPop(EnemyPopulations_PostCrocShaft),
    %enemySet(EnemySets_PostCrocShaft),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_PostCrocShaft),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_PostCrocShaft),
    %libraryBG(LibBG_Norfair_9_A_CavernVertical),
    %setupASM(RTS_8F91F6))

RoomDoors_PostCrocShaft:
    dw Door_PostCrocShaft_0
    dw Door_PostCrocShaft_1
    dw Door_PostCrocShaft_2
    dw Door_PostCrocShaft_3

RoomScrolls_PostCrocShaft:
    db $02,$02,$02,$02,$02

RoomHeader_PostCrocMissile:
    %RoomHeader(\
    %room($12),
    %area(2),
    %positions($0B, $0F),
    %dimensions(4, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_PostCrocMissile))
    %stateChecks(0)

RoomState_PostCrocMissile:
    %StateHeader(\
    %levelData(LevelData_PostCrocMissile),
    %tileset($0A),
    %music(0, 0),
    %FX(FXHeader_PostCrocMissile),
    %enemyPop(EnemyPopulations_PostCrocMissile),
    %enemySet(EnemySets_PostCrocMissile),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_PostCrocMissile),
    %libraryBG(LibBG_Norfair_9_A_CavernStalagtites),
    %setupASM(RTS_8F91F6))

RoomDoors_PostCrocMissile:
    dw Door_PostCrocMissile_0

RoomHeader_GrappleTutorial3:
    %RoomHeader(\
    %room($13),
    %area(2),
    %positions(7, $0C),
    %dimensions(3, 2),
    %scrollers($90, $A0),
    %CRE(0),
    %doorList(RoomDoors_GrappleTutorial3))
    %stateChecks(0)

RoomState_GrappleTutorial3:
    %StateHeader(\
    %levelData(LevelData_GrappleTutorial3),
    %tileset($0A),
    %music(0, 0),
    %FX(FXHeader_GrappleTutorial3),
    %enemyPop(EnemyPopulations_GrappleTutorial3),
    %enemySet(EnemySets_GrappleTutorial3),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_GrappleTutorial3),
    %libraryBG(LibBG_Norfair_9_A_SmallPatternBrownPurple_0),
    %setupASM(RTS_8F91F6))

RoomDoors_GrappleTutorial3:
    dw Door_GrappleTutorial3_0
    dw Door_GrappleTutorial3_1

RoomHeader_PostCrocJump:
    %RoomHeader(\
    %room($14),
    %area(2),
    %positions(4, $0F),
    %dimensions(8, 3),
    %scrollers($90, $A0),
    %CRE(0),
    %doorList(RoomDoors_PostCrocJump))
    %stateChecks(0)

RoomState_PostCrocJump:
    %StateHeader(\
    %levelData(LevelData_PostCrocJump),
    %tileset($0A),
    %music(0, 5),
    %FX(FXHeader_PostCrocJump),
    %enemyPop(EnemyPopulations_PostCrocJump),
    %enemySet(EnemySets_PostCrocJump),
    %layer2Scrolls($C0, 0),
    %scrollPointer(RoomScrolls_PostCrocJump),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_PostCrocJump),
    %libraryBG(0),
    %setupASM(RTS_8F91F6))

RoomDoors_PostCrocJump:
    dw Door_PostCrocJump_0
    dw Door_PostCrocJump_1

RoomScrolls_PostCrocJump:
    db $02,$02,$02,$02,$02,$00,$00,$00,$02,$02,$02,$02,$02,$00,$00,$00
    db $01,$01,$01,$01,$01,$01,$01,$01

RoomHeader_GrappleTutorial2:
    %RoomHeader(\
    %room($15),
    %area(2),
    %positions(6, $0C),
    %dimensions(1, 3),
    %scrollers($90, $A0),
    %CRE(0),
    %doorList(RoomDoors_GrappleTutorial2))
    %stateChecks(0)

RoomState_GrappleTutorial2:
    %StateHeader(\
    %levelData(LevelData_GrappleTutorial2),
    %tileset($0A),
    %music(0, 0),
    %FX(FXHeader_GrappleTutorial2),
    %enemyPop(EnemyPopulations_GrappleTutorial2),
    %enemySet(EnemySets_GrappleTutorial2),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_GrappleTutorial2),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_GrappleTutorial2),
    %libraryBG(LibBG_Norfair_9_A_CavernVertical),
    %setupASM(RTS_8F91F6))

RoomDoors_GrappleTutorial2:
    dw Door_GrappleTutorial2_0
    dw Door_GrappleTutorial2_1

RoomScrolls_GrappleTutorial2:
    db $02,$02,$01

RoomHeader_GrappleTutorial1:
    %RoomHeader(\
    %room($16),
    %area(2),
    %positions(4, $0E),
    %dimensions(2, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_GrappleTutorial1))
    %stateChecks(0)

RoomState_GrappleTutorial1:
    %StateHeader(\
    %levelData(LevelData_GrappleTutorial1),
    %tileset($0A),
    %music(0, 5),
    %FX(FXHeader_GrappleTutorial1),
    %enemyPop(EnemyPopulations_GrappleTutorial1),
    %enemySet(EnemySets_GrappleTutorial1),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_GrappleTutorial1),
    %libraryBG(LibBG_Norfair_9_A_CavernStalagtites),
    %setupASM(RTS_8F91F6))

RoomDoors_GrappleTutorial1:
    dw Door_GrappleTutorial1_0
    dw Door_GrappleTutorial1_1

RoomHeader_GrappleBeam:
    %RoomHeader(\
    %room($17),
    %area(2),
    %positions(3, $0E),
    %dimensions(1, 4),
    %scrollers($90, $A0),
    %CRE(0),
    %doorList(RoomDoors_GrappleBeam))
    %stateChecks(0)

RoomState_GrappleBeam:
    %StateHeader(\
    %levelData(LevelData_GrappleBeam),
    %tileset($0A),
    %music(0, 3),
    %FX(FXHeader_GrappleBeam),
    %enemyPop(EnemyPopulations_GrappleBeam),
    %enemySet(EnemySets_GrappleBeam),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_GrappleBeam),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_GrappleBeam),
    %libraryBG(LibBG_Norfair_9_A_CavernVertical),
    %setupASM(RTS_8F91F6))

RoomDoors_GrappleBeam:
    dw Door_GrappleBeam_0
    dw Door_GrappleBeam_1

RoomScrolls_GrappleBeam:
    db $02,$02,$01,$00

RoomHeader_NorfairReserveTank:
    %RoomHeader(\
    %room($18),
    %area(2),
    %positions($12, 2),
    %dimensions(2, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_NorfairReserveTank))
    %stateChecks(0)

RoomState_NorfairReserveTank:
    %StateHeader(\
    %levelData(LevelData_NorfairReserveTank),
    %tileset(9),
    %music(0, 0),
    %FX(FXHeader_NorfairReserveTank),
    %enemyPop(EnemyPopulations_NorfairReserveTank),
    %enemySet(EnemySets_NorfairReserveTank),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_NorfairReserveTank),
    %libraryBG(LibBG_Norfair_9_PurplePatches),
    %setupASM(RTS_8F91F6))

RoomDoors_NorfairReserveTank:
    dw Door_NorfairReserveTank

RoomHeader_GreenBubblesMissiles:
    %RoomHeader(\
    %room($19),
    %area(2),
    %positions($14, 2),
    %dimensions(2, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_GreenBubblesMissiles))
    %stateChecks(0)

RoomState_GreenBubblesMissiles:
    %StateHeader(\
    %levelData(LevelData_GreenBubblesMissiles),
    %tileset(9),
    %music(0, 0),
    %FX(FXHeader_GreenBubblesMissiles),
    %enemyPop(EnemyPopulations_GreenBubblesMissiles),
    %enemySet(EnemySets_GreenBubblesMissiles),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_GreenBubblesMissiles),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_GreenBubblesMissiles),
    %libraryBG(LibBG_Norfair_9_Bubbles),
    %setupASM(RTS_8F91F6))

RoomDoors_GreenBubblesMissiles:
    dw Door_GreenBubblesMissiles_0
    dw Door_GreenBubblesMissiles_1

RoomScrolls_GreenBubblesMissiles:
    db $00,$01

RoomPLM_GreenBubblesMissiles_0:
    db $00,$01, $80

RoomHeader_BubbleMountain:
    %RoomHeader(\
    %room($1A),
    %area(2),
    %positions($16, 2),
    %dimensions(2, 4),
    %scrollers($90, $A0),
    %CRE(0),
    %doorList(RoomDoors_BubbleMountain))
    %stateChecks(0)

RoomState_BubbleMountain:
    %StateHeader(\
    %levelData(LevelData_BubbleMountain),
    %tileset(9),
    %music(0, 0),
    %FX(FXHeader_BubbleMountain),
    %enemyPop(EnemyPopulations_BubbleMountain),
    %enemySet(EnemySets_BubbleMountain),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_BubbleMountain),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_BubbleMountain),
    %libraryBG(LibBG_Norfair_9_Bubbles),
    %setupASM(RTS_8F91F6))

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
    %RoomHeader(\
    %room($1B),
    %area(2),
    %positions($19, 1),
    %dimensions($0C, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_SpeedBoosterHall))
    %stateChecks(0)

RoomState_SpeedBoosterHall:
    %StateHeader(\
    %levelData(LevelData_SpeedBoosterHall),
    %tileset(9),
    %music(0, 5),
    %FX(FXHeader_SpeedBoosterHall),
    %enemyPop(EnemyPopulations_SpeedBoosterHall),
    %enemySet(EnemySets_SpeedBoosterHall),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_SpeedBoosterHall),
    %libraryBG(LibBG_Norfair_9_A_SmallPatternBrownPurple_0),
    %setupASM(RTS_8F91F6))

RoomDoors_SpeedBoosterHall:
    dw Door_SpeedBoosterHall_0
    dw Door_SpeedBoosterHall_1

RoomHeader_SpeedBooster:
    %RoomHeader(\
    %room($1C),
    %area(2),
    %positions($25, 2),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_SpeedBooster))
    %stateChecks(0)

RoomState_SpeedBooster:
    %StateHeader(\
    %levelData(LevelData_SpeedBooster),
    %tileset(9),
    %music(0, 3),
    %FX(FXHeader_SpeedBooster),
    %enemyPop(EnemyPopulations_SpeedBooster),
    %enemySet(EnemySets_SpeedBooster),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_SpeedBooster),
    %libraryBG(LibBG_Norfair_9_A_SmallPatternBrownPurple_Bright),
    %setupASM(RTS_8F91F6))

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
    %RoomHeader(\
    %room($1D),
    %area(2),
    %positions($18, 3),
    %dimensions(6, 4),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_SingleChamber))
    %stateChecks(0)

RoomState_SingleChamber:
    %StateHeader(\
    %levelData(LevelData_SingleChamber),
    %tileset(9),
    %music($15, 5),
    %FX(FXHeader_SingleChamber),
    %enemyPop(EnemyPopulations_SingleChamber),
    %enemySet(EnemySets_SingleChamber),
    %layer2Scrolls($C0, $C0),
    %scrollPointer(RoomScrolls_SingleChamber),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_SingleChamber),
    %libraryBG(0),
    %setupASM(RTS_8F91F6))

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
    db $01,$00, $80

RoomPLM_SingleChamber_1_4:
    db $01,$01, $80

RoomHeader_DoubleChamber:
    %RoomHeader(\
    %room($1E),
    %area(2),
    %positions($19, 4),
    %dimensions(4, 2),
    %scrollers($90, $A0),
    %CRE(0),
    %doorList(RoomDoors_DoubleChamber))
    %stateChecks(0)

RoomState_DoubleChamber:
    %StateHeader(\
    %levelData(LevelData_DoubleChamber),
    %tileset(9),
    %music(0, 5),
    %FX(FXHeader_DoubleChamber),
    %enemyPop(EnemyPopulations_DoubleChamber),
    %enemySet(EnemySets_DoubleChamber),
    %layer2Scrolls($C0, 0),
    %scrollPointer(RoomScrolls_DoubleChamber),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_DoubleChamber),
    %libraryBG(0),
    %setupASM(RTS_8F91F6))

RoomDoors_DoubleChamber:
    dw Door_DoubleChamber_0
    dw Door_DoubleChamber_1
    dw Door_DoubleChamber_2

RoomScrolls_DoubleChamber:
    db $02,$02,$02,$02

RoomHeader_WaveBeam:
    %RoomHeader(\
    %room($1F),
    %area(2),
    %positions($1D, 4),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_WaveBeam))
    %stateChecks(0)

RoomState_WaveBeam:
    %StateHeader(\
    %levelData(LevelData_WaveBeam),
    %tileset(9),
    %music(0, 3),
    %FX(FXHeader_WaveBeam),
    %enemyPop(EnemyPopulations_WaveBeam),
    %enemySet(EnemySets_WaveBeam),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_WaveBeam),
    %libraryBG(LibBG_Norfair_9_A_CavernStalagtites),
    %setupASM(RTS_8F91F6))

RoomDoors_WaveBeam:
    dw Door_WaveBeam_0

RoomHeader_SpikyPlatformsTunnel:
    %RoomHeader(\
    %room($20),
    %area(2),
    %positions($19, 6),
    %dimensions(4, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_SpikyPlatformsTunnel))
    %stateChecks(0)

RoomState_SpikyPlatformsTunnel:
    %StateHeader(\
    %levelData(LevelData_SpikyPlatformsTunnel),
    %tileset(9),
    %music(0, 0),
    %FX(FXHeader_SpikyPlatformsTunnel),
    %enemyPop(EnemyPopulations_SpikyPlatformsTunnel),
    %enemySet(EnemySets_SpikyPlatformsTunnel),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_SpikyPlatformsTunnel),
    %libraryBG(LibBG_Norfair_9_A_CavernStalagtites),
    %setupASM(RTS_8F91F6))

RoomDoors_SpikyPlatformsTunnel:
    dw Door_SpikyPlatformsTunnel_0
    dw Door_SpikyPlatformsTunnel_1

RoomHeader_Volcano:
    %RoomHeader(\
    %room($21),
    %area(2),
    %positions($1B, 6),
    %dimensions(3, 3),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_Volcano))
    %stateChecks(0)

RoomState_Volcano:
    %StateHeader(\
    %levelData(LevelData_Volcano),
    %tileset(9),
    %music(0, 0),
    %FX(FXHeader_Volcano),
    %enemyPop(EnemyPopulations_Volcano),
    %enemySet(EnemySets_Volcano),
    %layer2Scrolls(0, 0),
    %scrollPointer(RoomScrolls_Volcano),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Volcano),
    %libraryBG(0),
    %setupASM(RTS_8F91F6))

RoomDoors_Volcano:
    dw Door_Volcano_0
    dw Door_Volcano_1

RoomScrolls_Volcano:
    db $00,$00,$02,$00,$00,$02,$00,$00,$01

RoomPLM_Volcano_0:
    db $06,$01, $07,$01, $80

RoomPLM_Volcano_1:
    db $08,$01, $80

RoomPLM_Volcano_7:
    db $08,$00, $80

RoomPLM_Volcano_B:
    db $07,$00, $80

RoomHeader_KronicBoost:
    %RoomHeader(\
    %room($22),
    %area(2),
    %positions($19, 8),
    %dimensions(2, 3),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_KronicBoost))
    %stateChecks(0)

RoomState_KronicBoost:
    %StateHeader(\
    %levelData(LevelData_KronicBoost),
    %tileset(9),
    %music(0, 0),
    %FX(FXHeader_KronicBoost),
    %enemyPop(EnemyPopulations_KronicBoost),
    %enemySet(EnemySets_KronicBoost),
    %layer2Scrolls(0, 0),
    %scrollPointer(RoomScrolls_KronicBoost),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_KronicBoost),
    %libraryBG(0),
    %setupASM(RTS_8F91F6))

RoomDoors_KronicBoost:
    dw Door_KronicBoost_0
    dw Door_KronicBoost_1
    dw Door_KronicBoost_2
    dw Door_KronicBoost_3

RoomScrolls_KronicBoost:
    db $00,$02,$00,$02,$00,$01

RoomPLM_KronicBoost_0:
    db $02,$01, $80

RoomPLM_KronicBoost_1:
    db $02,$00, $03,$02, $80

RoomPLM_KronicBoost_5:
    db $03,$00, $80

RoomHeader_MagdolliteTunnel:
    %RoomHeader(\
    %room($23),
    %area(2),
    %positions($17, 8),
    %dimensions(3, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_MagdolliteTunnel))
    %stateChecks(0)

RoomState_MagdolliteTunnel:
    %StateHeader(\
    %levelData(LevelData_MagdolliteTunnel),
    %tileset(9),
    %music(0, 0),
    %FX(FXHeader_MagdolliteTunnel),
    %enemyPop(EnemyPopulations_MagdolliteTunnel),
    %enemySet(EnemySets_MagdolliteTunnel),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_MagdolliteTunnel),
    %libraryBG(LibBG_Norfair_9_A_CavernStalagtites),
    %setupASM(RTS_8F91F6))

RoomDoors_MagdolliteTunnel:
    dw Door_MagdolliteTunnel_0
    dw Door_MagdolliteTunnel_1

RoomHeader_PurpleShaft:
    %RoomHeader(\
    %room($24),
    %area(2),
    %positions($16, 6),
    %dimensions(1, 3),
    %scrollers($A0, $A0),
    %CRE(0),
    %doorList(RoomDoors_PurpleShaft))
    %stateChecks(0)

RoomState_PurpleShaft:
    %StateHeader(\
    %levelData(LevelData_PurpleShaft),
    %tileset(9),
    %music(0, 0),
    %FX(FXHeader_PurpleShaft),
    %enemyPop(EnemyPopulations_PurpleShaft),
    %enemySet(EnemySets_PurpleShaft),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_PurpleShaft),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_PurpleShaft),
    %libraryBG(LibBG_Norfair_9_PurplePatches),
    %setupASM(RTS_8F91F6))

RoomDoors_PurpleShaft:
    dw Door_PurpleShaft_0
    dw Door_PurpleShaft_1
    dw Door_PurpleShaft_2

RoomScrolls_PurpleShaft:
    db $02,$02,$01

RoomPLM_PurpleShaft_0_3:
    db $00,$02, $01,$02, $80

RoomHeader_LavaDive:
    %RoomHeader(\
    %room($25),
    %area(2),
    %positions($16, $0A),
    %dimensions(4, 3),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_LavaDive))
    %stateChecks(0)

RoomState_LavaDive:
    %StateHeader(\
    %levelData(LevelData_LavaDive),
    %tileset(9),
    %music(0, 5),
    %FX(FXHeader_LavaDive),
    %enemyPop(EnemyPopulations_LavaDive),
    %enemySet(EnemySets_LavaDive),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_LavaDive),
    %libraryBG(LibBG_Norfair_9_A_SmallPatternBrownPurple_0),
    %setupASM(RTS_8F91F6))

RoomDoors_LavaDive:
    dw Door_LavaDive_0
    dw Door_LavaDive_1

RoomHeader_LowerNorfairElev:
    %RoomHeader(\
    %room($26),
    %area(2),
    %positions($15, $0A),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_LowerNorfairElev))
    %stateChecks(0)

RoomState_LowerNorfairElev:
    %StateHeader(\
    %levelData(LevelData_LowerNorfairElev),
    %tileset(9),
    %music($15, 5),
    %FX(FXHeader_LowerNorfairElev),
    %enemyPop(EnemyPopulations_LowerNorfairElev),
    %enemySet(EnemySets_LowerNorfairElev),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_LowerNorfairElev),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_LowerNorfairElev),
    %libraryBG(LibBG_Norfair_9_A_CavernStalagtites),
    %setupASM(RTS_8F91F6))

RoomDoors_LowerNorfairElev:
    dw Door_LowerNorfairElev_0
    dw Door_LowerNorfairElev_1
    dw Door_VariousRooms_Elevator
    dw Door_LowerNorfairElev_3

RoomScrolls_LowerNorfairElev:
    db $01

RoomPLM_LowerNorfairElev_0:
    db $00,$02, $80

RoomHeader_UpperNorfairFarming:
    %RoomHeader(\
    %room($27),
    %area(2),
    %positions($14, 5),
    %dimensions(2, 2),
    %scrollers($A0, $A0),
    %CRE(0),
    %doorList(RoomDoors_UpperNorfairFarming))
    %stateChecks(0)

RoomState_UpperNorfairFarming:
    %StateHeader(\
    %levelData(LevelData_UpperNorfairFarming),
    %tileset(9),
    %music(0, 0),
    %FX(FXHeader_UpperNorfairFarming),
    %enemyPop(EnemyPopulations_UpperNorfairFarming),
    %enemySet(EnemySets_UpperNorfairFarming),
    %layer2Scrolls($C0, 0),
    %scrollPointer(RoomScrolls_UpperNorfairFarming),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_UpperNorfairFarming),
    %libraryBG(0),
    %setupASM(RTS_8F91F6))

RoomDoors_UpperNorfairFarming:
    dw Door_UpperNorfairFarming_0
    dw Door_UpperNorfairFarming_1
    dw Door_UpperNorfairFarming_2

RoomScrolls_UpperNorfairFarming:
    db $02,$02,$01,$01

RoomHeader_RisingTide:
    %RoomHeader(\
    %room($28),
    %area(2),
    %positions($11, 4),
    %dimensions(5, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_RisingTide))
    %stateChecks(0)

RoomState_RisingTide:
    %StateHeader(\
    %levelData(LevelData_RisingTide),
    %tileset(9),
    %music(0, 0),
    %FX(FXHeader_RisingTide),
    %enemyPop(EnemyPopulations_RisingTide),
    %enemySet(EnemySets_RisingTide),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_RisingTide),
    %libraryBG(LibBG_Norfair_9_A_CavernStalagtites),
    %setupASM(RTS_8F91F6))

RoomDoors_RisingTide:
    dw Door_RisingTide_0
    dw Door_RisingTide_1

RoomHeader_AcidSnakesTunnel:
    %RoomHeader(\
    %room($29),
    %area(2),
    %positions($10, 9),
    %dimensions(4, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_AcidSnakesTunnel))
    %stateChecks(0)

RoomState_AcidSnakesTunnel:
    %StateHeader(\
    %levelData(LevelData_AcidSnakesTunnel),
    %tileset(9),
    %music(0, 0),
    %FX(FXHeader_AcidSnakesTunnel),
    %enemyPop(EnemyPopulations_AcidSnakesTunnel),
    %enemySet(EnemySets_AcidSnakesTunnel),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_AcidSnakesTunnel),
    %libraryBG(LibBG_Norfair_9_A_CavernStalagtites),
    %setupASM(RTS_8F91F6))

RoomDoors_AcidSnakesTunnel:
    dw Door_AcidSnakesTunnel_0
    dw Door_AcidSnakesTunnel_1
    dw Door_AcidSnakesTunnel_2

RoomHeader_SpikyAcidSnakesTunnel:
    %RoomHeader(\
    %room($2A),
    %area(2),
    %positions($15, 9),
    %dimensions(4, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_SpikyAcidSnakesTunnel))
    %stateChecks(0)

RoomState_SpikyAcidSnakesTunnel:
    %StateHeader(\
    %levelData(LevelData_SpikyAcidSnakesTunnel),
    %tileset(9),
    %music(0, 0),
    %FX(FXHeader_SpikyAcidSnakesTunnel),
    %enemyPop(EnemyPopulations_SpikyAcidSnakesTunnel),
    %enemySet(EnemySets_SpikyAcidSnakesTunnel),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_SpikyAcidSnakesTunnel),
    %libraryBG(LibBG_Norfair_9_A_CavernStalagtites),
    %setupASM(RTS_8F91F6))

RoomDoors_SpikyAcidSnakesTunnel:
    dw Door_SpikyAcidSnakesTunnel_0
    dw Door_SpikyAcidSnakesTunnel_1

RoomHeader_UpperNorfairRefill:
    %RoomHeader(\
    %room($2B),
    %area(2),
    %positions($14, 9),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_UpperNorfairRefill))
    %stateChecks(0)

RoomState_UpperNorfairRefill:
    %StateHeader(\
    %levelData(LevelData_EnergyRefeill_BothDoors),
    %tileset($17),
    %music(0, 0),
    %FX(FXHeader_UpperNorfairRefill),
    %enemyPop(EnemyPopulations_UpperNorfairRefill),
    %enemySet(EnemySets_UpperNorfairRefill),
    %layer2Scrolls(0, 0),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_UpperNorfairRefill),
    %libraryBG(0),
    %setupASM(RTS_8F91F6))

RoomDoors_UpperNorfairRefill:
    dw Door_UpperNorfairRefill_0
    dw Door_UpperNorfairRefill_1

RoomHeader_PurpleFarming:
    %RoomHeader(\
    %room($2C),
    %area(2),
    %positions($17, 7),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_PurpleFarming))
    %stateChecks(0)

RoomState_PurpleFarming:
    %StateHeader(\
    %levelData(LevelData_PurpleFarming),
    %tileset(9),
    %music(0, 0),
    %FX(FXHeader_PurpleFarming),
    %enemyPop(EnemyPopulations_PurpleFarming),
    %enemySet(EnemySets_PurpleFarming),
    %layer2Scrolls(1, 1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_PurpleFarming),
    %libraryBG(LibBG_Norfair_9_PurplePatches),
    %setupASM(RTS_8F91F6))

RoomDoors_PurpleFarming:
    dw Door_PurpleFarming_0

RoomHeader_BatCave:
    %RoomHeader(\
    %room($2D),
    %area(2),
    %positions($18, 1),
    %dimensions(1, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_BatCave))
    %stateChecks(0)

RoomState_BatCave:
    %StateHeader(\
    %levelData(LevelData_BatCave),
    %tileset(9),
    %music(0, 5),
    %FX(FXHeader_BatCave),
    %enemyPop(EnemyPopulations_BatCave),
    %enemySet(EnemySets_BatCave),
    %layer2Scrolls(0, 0),
    %scrollPointer(RoomScrolls_BatCave),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_BatCave),
    %libraryBG(0),
    %setupASM(RTS_8F91F6))

RoomDoors_BatCave:
    dw Door_BatCave_0
    dw Door_BatCave_1

RoomScrolls_BatCave:
    db $00,$01

RoomPLM_BatCave_0:
    db $00,$02, $01,$02, $80

RoomPLM_BatCave_2:
    db $00,$02, $01,$01, $80

RoomPLM_BatCave_4:
    db $00,$00, $80

RoomHeader_NorfairMap:
    %RoomHeader(\
    %room($2E),
    %area(2),
    %positions(9, 4),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_NorfairMap))
    %stateChecks(0)

RoomState_NorfairMap:
    %StateHeader(\
    %levelData(LevelData_MapStation_RightSideDoor),
    %tileset($15),
    %music(0, 0),
    %FX(FXHeader_NorfairMap),
    %enemyPop(EnemyPopulations_NorfairMap),
    %enemySet(EnemySets_NorfairMap),
    %layer2Scrolls(0, 0),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_NorfairMap),
    %libraryBG(0),
    %setupASM(RTS_8F91F6))

RoomDoors_NorfairMap:
    dw Door_NorfairMap_0

RoomHeader_BubbleMountainSave:
    %RoomHeader(\
    %room($2F),
    %area(2),
    %positions($15, 3),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_BubbleMountainSave))
    %stateChecks(0)

RoomState_BubbleMountainSave:
    %StateHeader(\
    %levelData(LevelData_SaveStation_RightSideDoor),
    %tileset($19),
    %music($15, 5),
    %FX(FXHeader_BubbleMountainSave),
    %enemyPop(EnemyPopulations_BubbleMountainSave),
    %enemySet(EnemySets_BubbleMountainSave),
    %layer2Scrolls(0, 0),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_BubbleMountainSave),
    %libraryBG(0),
    %setupASM(RTS_8F91F6))

RoomDoors_BubbleMountainSave:
    dw Door_BubbleMountainSave_0

RoomHeader_FrogSpeedway:
    %RoomHeader(\
    %room($30),
    %area(2),
    %positions($0C, 5),
    %dimensions(8, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_FrogSpeedway))
    %stateChecks(0)

RoomState_FrogSpeedway:
    %StateHeader(\
    %levelData(LevelData_FrogSpeedway),
    %tileset($0A),
    %music(0, 0),
    %FX(FXHeader_FrogSpeedway),
    %enemyPop(EnemyPopulations_FrogSpeedway),
    %enemySet(EnemySets_FrogSpeedway),
    %layer2Scrolls($C1, 1),
    %scrollPointer(RoomScrolls_FrogSpeedway),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_FrogSpeedway),
    %libraryBG(LibBG_Norfair_9_A_SmallPatternBrownPurple_Bright),
    %setupASM(RTS_8F91F6))

RoomDoors_FrogSpeedway:
    dw Door_FrogSpeedway_0
    dw Door_FrogSpeedway_1

RoomScrolls_FrogSpeedway:
    db $01,$01,$01,$01,$01,$01,$01,$01

RoomHeader_RedPirateShaft:
    %RoomHeader(\
    %room($31),
    %area(2),
    %positions($13, 6),
    %dimensions(1, 3),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_RedPirateShaft))
    %stateChecks(0)

RoomState_RedPirateShaft:
    %StateHeader(\
    %levelData(LevelData_RedPirateShaft),
    %tileset(9),
    %music(0, 0),
    %FX(FXHeader_RedPirateShaft),
    %enemyPop(EnemyPopulations_RedPirateShaft),
    %enemySet(EnemySets_RedPirateShaft),
    %layer2Scrolls(1, $C1),
    %scrollPointer(RoomScrolls_RedPirateShaft),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_RedPirateShaft),
    %libraryBG(LibBG_Norfair_9_A_CavernVertical),
    %setupASM(RTS_8F91F6))

RoomDoors_RedPirateShaft:
    dw Door_RedPirateShaft_0
    dw Door_RedPirateShaft_1

RoomScrolls_RedPirateShaft:
    db $02,$02,$02

RoomHeader_FrogSave:
    %RoomHeader(\
    %room($32),
    %area(2),
    %positions($0B, 5),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_FrogSave))
    %stateChecks(0)

RoomState_FrogSave:
    %StateHeader(\
    %levelData(LevelData_SaveStation_BothDoors),
    %tileset($19),
    %music($15, 5),
    %FX(FXHeader_FrogSave),
    %enemyPop(EnemyPopulations_FrogSave),
    %enemySet(EnemySets_FrogSave),
    %layer2Scrolls(0, 0),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_FrogSave),
    %libraryBG(0),
    %setupASM(RTS_8F91F6))

RoomDoors_FrogSave:
    dw Door_FrogSave_0
    dw Door_FrogSave_1

RoomHeader_CrocomireSave:
    %RoomHeader(\
    %room($33),
    %area(2),
    %positions($10, 8),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_CrocomireSave))
    %stateChecks(0)

RoomState_CrocomireSave:
    %StateHeader(\
    %levelData(LevelData_SaveStation_LeftSideDoor),
    %tileset($19),
    %music($15, 5),
    %FX(FXHeader_CrocomireSave),
    %enemyPop(EnemyPopulations_CrocomireSave),
    %enemySet(EnemySets_CrocomireSave),
    %layer2Scrolls(0, 0),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_CrocomireSave),
    %libraryBG(0),
    %setupASM(RTS_8F91F6))

RoomDoors_CrocomireSave:
    dw Door_CrocomireSave_0

RoomHeader_LNElevSave:
    %RoomHeader(\
    %room($34),
    %area(2),
    %positions($14, $0A),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_LNElevSave))
    %stateChecks(0)

RoomState_LNElevSave:
    %StateHeader(\
    %levelData(LevelData_SaveStation_RightSideDoor),
    %tileset($19),
    %music($15, 5),
    %FX(FXHeader_LNElevSave),
    %enemyPop(EnemyPopulations_LNElevSave),
    %enemySet(EnemySets_LNElevSave),
    %layer2Scrolls(0, 0),
    %scrollPointer(RoomScrolls_LNElevSave),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_LNElevSave),
    %libraryBG(0),
    %setupASM(0))

RoomDoors_LNElevSave:
    dw Door_LNElevSave_0

RoomScrolls_LNElevSave:
    db $01

RoomHeader_AcidStatue:
    %RoomHeader(\
    %room($35),
    %area(2),
    %positions($0F, $0D),
    %dimensions(3, 3),
    %scrollers($90, $A0),
    %CRE(0),
    %doorList(RoomDoors_AcidStatue))
    %stateChecks(0)

RoomState_AcidStatue:
    %StateHeader(\
    %levelData(LevelData_AcidStatue),
    %tileset(9),
    %music($18, 5),
    %FX(FXHeader_AcidStatue),
    %enemyPop(EnemyPopulations_AcidStatue),
    %enemySet(EnemySets_AcidStatue),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_AcidStatue),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_AcidStatue),
    %libraryBG(LibBG_Norfair_9_CavernRoomPillars),
    %setupASM(RTS_8F91F7))

RoomDoors_AcidStatue:
    dw Door_AcidStatue_0
    dw Door_AcidStatue_1

RoomScrolls_AcidStatue:
    db $02,$02,$00,$01,$01,$00,$00,$00,$00

if !FEATURE_KEEP_UNREFERENCED
UNUSED_RoomPLM_8FB219:
    db $03,$01, $04,$01, $06,$00, $07,$00, $08,$00, $80
endif ; !FEATURE_KEEP_UNREFERENCED

RoomPLM_AcidStatue_0:
    db $03,$02, $04,$02, $06,$02, $07,$02, $80

RoomPLM_AcidStatue_1:
    db $04,$00, $06,$01, $07,$01, $08,$01, $80

RoomHeader_MainHall:
    %RoomHeader(\
    %room($36),
    %area(2),
    %positions($11, $0B),
    %dimensions(8, 3),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_MainHall))
    %stateChecks(0)

RoomState_MainHall:
    %StateHeader(\
    %levelData(LevelData_MainHall),
    %tileset(9),
    %music($18, 5),
    %FX(FXHeader_MainHall),
    %enemyPop(EnemyPopulations_MainHall),
    %enemySet(EnemySets_MainHall),
    %layer2Scrolls($C1, 1),
    %scrollPointer(RoomScrolls_MainHall),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_MainHall),
    %libraryBG(LibBG_Norfair_9_CavernVerticalRuins),
    %setupASM(RTS_8F91F7))

RoomDoors_MainHall:
    dw Door_MainHall_0
    dw Door_MainHall_1
    dw Door_MainHall_2
    dw Door_VariousRooms_Elevator

RoomScrolls_MainHall:
    db $00,$00,$00,$00,$02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $01,$01,$01,$01,$01,$01,$01,$01

RoomPLM_MainHall_0_2:
    db $0C,$02, $80

RoomPLM_MainHall_4:
    db $0C,$00, $80

RoomHeader_GoldenTorizo:
    %RoomHeader(\
    %room($37),
    %area(2),
    %positions($12, $0F),
    %dimensions(2, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_GoldenTorizo))
    %stateChecks(1,
    %stateCheckBossDead(4, RoomState_GoldenTorizo_1))

RoomState_GoldenTorizo_0:
    %StateHeader(\
    %levelData(LevelData_GoldenTorizo),
    %tileset(9),
    %music($24, 3),
    %FX(FXHeader_GoldenTorizo_State0_1),
    %enemyPop(EnemyPopulations_GoldenTorizo),
    %enemySet(EnemySets_GoldenTorizo),
    %layer2Scrolls($C0, 0),
    %scrollPointer(RoomScrolls_GoldenTorizo),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_GoldenTorizo_State0_1),
    %libraryBG(0),
    %setupASM(RTS_8F91F7))

RoomState_GoldenTorizo_1:
    %StateHeader(\
    %levelData(LevelData_GoldenTorizo),
    %tileset(9),
    %music(0, 3),
    %FX(FXHeader_GoldenTorizo_State0_1),
    %enemyPop(EnemyPopulations_GoldenTorizo),
    %enemySet(EnemySets_GoldenTorizo),
    %layer2Scrolls($C0, 0),
    %scrollPointer(RoomScrolls_GoldenTorizo),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_GoldenTorizo_State0_1),
    %libraryBG(0),
    %setupASM(RTS_8F91F7))

RoomDoors_GoldenTorizo:
    dw Door_GoldenTorizo_0
    dw Door_GoldenTorizo_1

RoomScrolls_GoldenTorizo:
    db $02,$02,$01,$01

RoomPLM_GoldenTorizo_0:
    db $00,$02, $01,$02, $02,$01, $03,$01, $80

RoomHeader_FastRipper:
    %RoomHeader(\
    %room($38),
    %area(2),
    %positions($15, $0E),
    %dimensions(4, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_FastRipper))
    %stateChecks(0)

RoomState_FastRipper:
    %StateHeader(\
    %levelData(LevelData_FastRipper),
    %tileset(9),
    %music($18, 5),
    %FX(FXHeader_FastRipper),
    %enemyPop(EnemyPopulations_FastRipper),
    %enemySet(EnemySets_FastRipper),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_FastRipper),
    %libraryBG(LibBG_Norfair_9_CavernVerticalRuins),
    %setupASM(RTS_8F91F7))

RoomDoors_FastRipper:
    dw Door_FastRipper_0
    dw Door_FastRipper_1

RoomHeader_GTEnergyRefill:
    %RoomHeader(\
    %room($39),
    %area(2),
    %positions($15, $0F),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_GTEnergyRefill))
    %stateChecks(0)

RoomState_GTEnergyRefill:
    %StateHeader(\
    %levelData(LevelData_EnergyRefill_LeftSideDoor),
    %tileset($17),
    %music(0, 3),
    %FX(FXHeader_GTEnergyRefill),
    %enemyPop(EnemyPopulations_GTEnergyRefill),
    %enemySet(EnemySets_GTEnergyRefill),
    %layer2Scrolls(0, 0),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_GTEnergyRefill),
    %libraryBG(0),
    %setupASM(RTS_8F91F7))

RoomDoors_GTEnergyRefill:
    dw Door_GTEnergyRefill_0

RoomHeader_Ridley:
    %RoomHeader(\
    %room($3A),
    %area(2),
    %positions($17, $10),
    %dimensions(1, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_Ridley))
    %stateChecks(1,
    %stateCheckBossDead(1, RoomState_Ridley_1))

RoomState_Ridley_0:
    %StateHeader(\
    %levelData(LevelData_Ridley),
    %tileset(9),
    %music($24, 4),
    %FX(FXHeader_Ridley_State0_1),
    %enemyPop(EnemyPopulations_Ridley),
    %enemySet(EnemySets_Ridley),
    %layer2Scrolls(1, $C1),
    %scrollPointer(RoomScrolls_Ridley),
    %specialXray(0),
    %mainASM(MainASM_RidleysRoomShaking),
    %PLMPop(PLMPopulation_Ridley_State0_1),
    %libraryBG(LibBG_Norfair_9_CavernRoomPillars),
    %setupASM(RTS_8F91F7))

RoomState_Ridley_1:
    %StateHeader(\
    %levelData(LevelData_Ridley),
    %tileset(9),
    %music(0, 3),
    %FX(FXHeader_Ridley_State0_1),
    %enemyPop(EnemyPopulations_Ridley),
    %enemySet(EnemySets_Ridley),
    %layer2Scrolls(1, $C1),
    %scrollPointer(RoomScrolls_Ridley),
    %specialXray(0),
    %mainASM(MainASM_RidleysRoomShaking),
    %PLMPop(PLMPopulation_Ridley_State0_1),
    %libraryBG(LibBG_Norfair_9_CavernRoomPillars),
    %setupASM(RTS_8F91F7))

RoomDoors_Ridley:
    dw Door_Ridley_0
    dw Door_Ridley_1

RoomScrolls_Ridley:
    db $02,$02

RoomHeader_LNFarming:
    %RoomHeader(\
    %room($3B),
    %area(2),
    %positions($18, $10),
    %dimensions(3, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_LNFarming))
    %stateChecks(0)

RoomState_LNFarming:
    %StateHeader(\
    %levelData(LevelData_LNFarming),
    %tileset(9),
    %music($18, 5),
    %FX(FXHeader_LNFarming),
    %enemyPop(EnemyPopulations_LNFarming),
    %enemySet(EnemySets_LNFarming),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_LNFarming),
    %libraryBG(LibBG_Norfair_9_RoomStatues),
    %setupASM(RTS_8F91F7))

RoomDoors_LNFarming:
    dw Door_LNFarming_0
    dw Door_LNFarming_1

RoomHeader_FastPillarsSetup:
    %RoomHeader(\
    %room($3C),
    %area(2),
    %positions($19, $0C),
    %dimensions(1, 3),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_FastPillarsSetup))
    %stateChecks(0)

RoomState_FastPillarsSetup:
    %StateHeader(\
    %levelData(LevelData_FastPillarsSetup),
    %tileset(9),
    %music(0, 0),
    %FX(FXHeader_FastPillarsSetup),
    %enemyPop(EnemyPopulations_FastPillarsSetup),
    %enemySet(EnemySets_FastPillarsSetup),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_FastPillarsSetup),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_FastPillarsSetup),
    %libraryBG(LibBG_Norfair_9_VerticalPatternBrick),
    %setupASM(RTS_8F91F7))

RoomDoors_FastPillarsSetup:
    dw Door_FastPillarsSetup_0
    dw Door_FastPillarsSetup_1
    dw Door_FastPillarsSetup_2
    dw Door_FastPillarsSetup_3
    dw Door_FastPillarsSetup_4

RoomScrolls_FastPillarsSetup:
    db $02,$01,$00

RoomPLM_FastPillarsSetup_0:
    db $01,$02, $80

RoomPLM_FastPillarsSetup_2:
    db $01,$02, $02,$01, $80

if !FEATURE_KEEP_UNREFERENCED
UNUSED_RoomHeader_8FB3E1:
    %RoomHeader(\
    %room($3D),
    %area(2),
    %positions($1A, $0B),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(UNUSED_RoomDoors_8FB408))
    %stateChecks(0)

UNUSED_RoomState_8FB3EE:
    %StateHeader(\
    %levelData(UNUSED_LevelData_C8F40B),
    %tileset(9),
    %music(0, 0),
    %FX(UNUSED_FXHeader_8387EC),
    %enemyPop(UNUSED_EnemyPopulations_8FB3EE_A1AD06),
    %enemySet(UNUSED_EnemySets_State8FB3EE_B48899),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(UNUSED_PLMPopulation_8FB3EE),
    %libraryBG(LibBG_Norfair_9_HorizontalPatternBrick),
    %setupASM(RTS_8F91F7))

UNUSED_RoomDoors_8FB408:
    dw UNUSED_Door_83991E
endif ; !FEATURE_KEEP_UNREFERENCED

RoomHeader_MickeyMouse:
    %RoomHeader(\
    %room($3E),
    %area(2),
    %positions($1A, 9),
    %dimensions(4, 4),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_MickeyMouse))
    %stateChecks(0)

RoomState_MickeyMouse:
    %StateHeader(\
    %levelData(LevelData_MickeyMouse),
    %tileset(9),
    %music(0, 0),
    %FX(FXHeader_MickeyMouse),
    %enemyPop(EnemyPopulations_MickeyMouse),
    %enemySet(EnemySets_MickeyMouse),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_MickeyMouse),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_MickeyMouse),
    %libraryBG(LibBG_Norfair_9_PurplePatches),
    %setupASM(RTS_8F91F7))

RoomDoors_MickeyMouse:
    dw Door_MickeyMouse_0
    dw Door_MickeyMouse_1

RoomScrolls_MickeyMouse:
    db $00,$00,$00,$02,$00,$00,$00,$02,$00,$00,$00,$02,$01,$01,$01,$01

RoomPLM_MickeyMouse_0:
    db $06,$01, $80

RoomPLM_MickeyMouse_1:
    db $06,$00, $80

RoomPLM_MickeyMouse_2:
    db $07,$01, $80

RoomPLM_MickeyMouse_6:
    db $07,$00, $80

RoomPLM_MickeyMouse_A:
    db $0E,$01, $80

RoomPLM_MickeyMouse_D:
    db $0E,$00, $80

RoomHeader_Pillar:
    %RoomHeader(\
    %room($3F),
    %area(2),
    %positions($1A, $0E),
    %dimensions(4, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_Pillar))
    %stateChecks(0)

RoomState_Pillar:
    %StateHeader(\
    %levelData(LevelData_Pillar),
    %tileset(9),
    %music(0, 0),
    %FX(FXHeader_Pillar),
    %enemyPop(EnemyPopulations_Pillar),
    %enemySet(EnemySets_Pillar),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Pillar),
    %libraryBG(LibBG_Norfair_9_CavernVerticalRuins),
    %setupASM(RTS_8F91F7))

RoomDoors_Pillar:
    dw Door_Pillar_0
    dw Door_Pillar_1

RoomHeader_Plowerhouse:
    %RoomHeader(\
    %room($40),
    %area(2),
    %positions($1B, $10),
    %dimensions(3, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_Plowerhouse))
    dw Use_StatePointer_inX

RoomState_Plowerhouse:
    %StateHeader(\
    %levelData(LevelData_Plowerhouse),
    %tileset(9),
    %music(0, 0),
    %FX(FXHeader_Plowerhouse),
    %enemyPop(EnemyPopulations_Plowerhouse),
    %enemySet(EnemySets_Plowerhouse),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Plowerhouse),
    %libraryBG(LibBG_Norfair_9_RoomStatues),
    %setupASM(RTS_8F91F7))

RoomDoors_Plowerhouse:
    dw Door_Plowerhouse_0
    dw Door_Plowerhouse_1

RoomHeader_WorstRoomInTheGame:
    %RoomHeader(\
    %room($41),
    %area(2),
    %positions($1E, 9),
    %dimensions(1, 6),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_WorstRoomInTheGame))
    %stateChecks(0)

RoomState_WorstRoomInTheGame:
    %StateHeader(\
    %levelData(LevelData_WorstRoomInTheGame),
    %tileset(9),
    %music(0, 0),
    %FX(FXHeader_WorstRoomInTheGame),
    %enemyPop(EnemyPopulations_WorstRoomInTheGame),
    %enemySet(EnemySets_WorstRoomInTheGame),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_WorstRoomInTheGame),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_WorstRoomInTheGame),
    %libraryBG(LibBG_Norfair_9_CavernHorizontalRuins),
    %setupASM(RTS_8F91F7))

RoomDoors_WorstRoomInTheGame:
    dw Door_WorstRoomInTheGame_0
    dw Door_WorstRoomInTheGame_1
    dw Door_WorstRoomInTheGame_2

RoomScrolls_WorstRoomInTheGame:
    db $00,$02,$02,$02,$02,$01

RoomPLM_WorstRoomInTheGame_0:
    db $00,$02, $01,$02, $80

RoomHeader_Amphitheatre:
    %RoomHeader(\
    %room($42),
    %area(2),
    %positions($1F, 9),
    %dimensions(4, 5),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_Amphitheatre))
    %stateChecks(0)

RoomState_Amphitheatre:
    %StateHeader(\
    %levelData(LevelData_Amphitheatre),
    %tileset(9),
    %music(0, 0),
    %FX(FXHeader_Amphitheatre),
    %enemyPop(EnemyPopulations_Amphitheatre),
    %enemySet(EnemySets_Amphitheatre),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Amphitheatre),
    %libraryBG(LibBG_Norfair_9_A_SmallPatternBrownPurple_0),
    %setupASM(RTS_8F91F7))

RoomDoors_Amphitheatre:
    dw Door_Amphitheatre_0
    dw Door_Amphitheatre_1

RoomHeader_LNSpringBallMaze:
    %RoomHeader(\
    %room($43),
    %area(2),
    %positions($21, 5),
    %dimensions(5, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_LNSpringBallMaze))
    %stateChecks(0)

RoomState_LNSpringBallMaze:
    %StateHeader(\
    %levelData(LevelData_LNSpringBallMaze),
    %tileset(9),
    %music(0, 5),
    %FX(FXHeader_LNSpringballMaze),
    %enemyPop(EnemyPopulations_LNSpringBallMaze),
    %enemySet(EnemySets_LNSpringBallMaze),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_LNSpringBallMaze),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_LNSpringBallMaze),
    %libraryBG(LibBG_Norfair_9_PurplePatches),
    %setupASM(RTS_8F91F7))

RoomDoors_LNSpringBallMaze:
    dw Door_LNSpringBallMaze_0
    dw Door_LNSpringBallMaze_1
    dw Door_LNSpringBallMaze_2

RoomScrolls_LNSpringBallMaze:
    db $02,$00,$00,$00,$00,$01,$01,$00,$00,$00

RoomPLM_LNSpringBallMaze_0:
    db $01,$01, $02,$01, $06,$00, $80

RoomPLM_LNSpringBallMaze_4:
    db $01,$00, $02,$00, $06,$01, $80

RoomPLM_LNSpringBallMaze_C:
    db $03,$01, $04,$02, $80

RoomHeader_LNEscapePowerBombs:
    %RoomHeader(\
    %room($44),
    %area(2),
    %positions($25, 6),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_LNEscapePowerBombs))
    %stateChecks(0)

RoomState_LNEscapePowerBombs:
    %StateHeader(\
    %levelData(LevelData_LNEscapePowerBombs),
    %tileset(9),
    %music(0, 0),
    %FX(FXHeader_LNEscapePowerBombs),
    %enemyPop(EnemyPopulations_LNEscapePowerBombs),
    %enemySet(EnemySets_LNEscapePowerBombs),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_LNEscapePowerBombs),
    %libraryBG(LibBG_Norfair_9_CavernRoomPillars),
    %setupASM(RTS_8F91F7))

RoomDoors_LNEscapePowerBombs:
    dw Door_LNEscapePowerBombs_0
    dw Door_LNEscapePowerBombs_1

RoomHeader_RedKihunterShaft:
    %RoomHeader(\
    %room($45),
    %area(2),
    %positions($23, 9),
    %dimensions(3, 5),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_RedKihunterShaft))
    %stateChecks(0)

RoomState_RedKihunterShaft:
    %StateHeader(\
    %levelData(LevelData_RedKihunterShaft),
    %tileset(9),
    %music(0, 0),
    %FX(FXHeader_RedKihunterShaft),
    %enemyPop(EnemyPopulations_RedKihunterShaft),
    %enemySet(EnemySets_RedKihunterShaft),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_RedKihunterShaft),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_RedKihunterShaft),
    %libraryBG(LibBG_Norfair_9_A_SmallPatternBrownPurple_0),
    %setupASM(RTS_8F91F7))

RoomDoors_RedKihunterShaft:
    dw Door_RedKihunterShaft_0
    dw Door_RedKihunterShaft_1
    dw Door_RedKihunterShaft_2
    dw Door_RedKihunterShaft_3

RoomScrolls_RedKihunterShaft:
    db $02,$00,$00,$02,$00,$00,$02,$00,$00,$02,$00,$00,$02,$00,$02

RoomPLM_RedKihunterShaft_0_4:
    db $0A,$02, $0D,$02, $80

RoomPLM_RedKihunterShaft_3_5:
    db $0A,$00, $0D,$00, $80

RoomPLM_RedKihunterShaft_6:
    db $00,$02, $03,$02, $80

RoomPLM_RedKihunterShaft_A:
    db $00,$02, $80

RoomHeader_Wasteland:
    %RoomHeader(\
    %room($46),
    %area(2),
    %positions($20, $0E),
    %dimensions(6, 3),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_Wasteland))
    %stateChecks(0)

RoomState_Wasteland:
    %StateHeader(\
    %levelData(LevelData_Wasteland),
    %tileset(9),
    %music(0, 0),
    %FX(FXHeader_Wasteland),
    %enemyPop(EnemyPopulations_Wasteland),
    %enemySet(EnemySets_Wasteland),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_Wasteland),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Wasteland),
    %libraryBG(LibBG_Norfair_9_CavernRoomPillars),
    %setupASM(RTS_8F91F7))

RoomDoors_Wasteland:
    dw Door_Wasteland_0
    dw Door_Wasteland_1

RoomScrolls_Wasteland:
    db $00,$01,$01,$01,$00,$01,$00,$00,$00,$00,$00,$00,$00,$02,$00,$00
    db $00,$00

RoomPLM_Wasteland_0:
    db $07,$02, $80

RoomPLM_Wasteland_2:
    db $01,$01, $07,$00, $80

RoomPLM_Wasteland_8_C:
    db $04,$01, $80

RoomPLM_Wasteland_A:
    db $00,$01, $01,$01, $80

RoomPLM_Wasteland_9_B:
    db $04,$00, $80

RoomPLM_Wasteland_D:
    db $00,$00, $80

RoomPLM_Wasteland_11:
    db $01,$00, $80

RoomHeader_MetalPirates:
    %RoomHeader(\
    %room($47),
    %area(2),
    %positions($1E, $10),
    %dimensions(3, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_MetalPirates))
    %stateChecks(0)

RoomState_MetalPirates:
    %StateHeader(\
    %levelData(LevelData_MetalPirates),
    %tileset(9),
    %music(0, 0),
    %FX(FXHeader_MetalPirates),
    %enemyPop(EnemyPopulations_MetalPirates),
    %enemySet(EnemySets_MetalPirates),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_MetalPirates),
    %libraryBG(LibBG_Norfair_9_RoomStatues),
    %setupASM(RTS_8F91F7))

RoomDoors_MetalPirates:
    dw Door_MetalPirates_0
    dw Door_MetalPirates_1

RoomHeader_ThreeMusketeers:
    %RoomHeader(\
    %room($48),
    %area(2),
    %positions($1D, 3),
    %dimensions(4, 3),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_ThreeMusketeers))
    %stateChecks(0)

RoomState_ThreeMusketeers:
    %StateHeader(\
    %levelData(LevelData_ThreeMusketeers),
    %tileset(9),
    %music($18, 5),
    %FX(FXHeader_ThreeMusketeers),
    %enemyPop(EnemyPopulations_ThreeMusketeers),
    %enemySet(EnemySets_ThreeMusketeers),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_ThreeMusketeers),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_ThreeMusketeers),
    %libraryBG(LibBG_Norfair_9_PurplePatches),
    %setupASM(RTS_8F91F7))

RoomDoors_ThreeMusketeers:
    dw Door_ThreeMusketeers_0
    dw Door_ThreeMusketeers_1

RoomScrolls_ThreeMusketeers:
    db $00,$02,$00,$00,$00,$02,$00,$00,$00,$01,$01,$01

RoomPLM_ThreeMusketeers_0:
    db $09,$00, $80

RoomPLM_ThreeMusketeers_6:
    db $08,$01, $09,$01, $80

RoomPLM_ThreeMusketeers_7:
    db $08,$00, $80

RoomHeader_RidleyETank:
    %RoomHeader(\
    %room($49),
    %area(2),
    %positions($16, $11),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_RidleyETank))
    %stateChecks(0)

RoomState_RidleyETank:
    %StateHeader(\
    %levelData(LevelData_RidleyETank),
    %tileset(9),
    %music(0, 0),
    %FX(FXHeader_RidleyETank),
    %enemyPop(EnemyPopulations_RidleyETank),
    %enemySet(EnemySets_RidleyETank),
    %layer2Scrolls(1, 1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_RidleyETank),
    %libraryBG(LibBG_Norfair_9_CavernRoomPillars),
    %setupASM(RTS_8F91F7))

RoomDoors_RidleyETank:
    dw Door_RidleyETank_0

RoomHeader_ScrewAttack:
    %RoomHeader(\
    %room($4A),
    %area(2),
    %positions($14, $0E),
    %dimensions(1, 3),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_ScrewAttack))
    %stateChecks(0)

RoomState_ScrewAttack:
    %StateHeader(\
    %levelData(LevelData_ScrewAttack),
    %tileset(9),
    %music(0, 3),
    %FX(FXHeader_ScrewAttack),
    %enemyPop(EnemyPopulations_ScrewAttack),
    %enemySet(EnemySets_ScrewAttack),
    %layer2Scrolls(1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_ScrewAttack),
    %libraryBG(LibBG_Norfair_9_CavernRoomPillars),
    %setupASM(RTS_8F91F7))

RoomDoors_ScrewAttack:
    dw Door_ScrewAttack_0
    dw Door_ScrewAttack_1
    dw Door_ScrewAttack_2

RoomHeader_LNFireflea:
    %RoomHeader(\
    %room($4B),
    %area(2),
    %positions($23, 6),
    %dimensions(3, 6),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_LNFireflea))
    %stateChecks(0)

RoomState_LNFireflea:
    %StateHeader(\
    %levelData(LevelData_LNFireflea),
    %tileset($0A),
    %music($18, 5),
    %FX(FXHeader_LNFireflea),
    %enemyPop(EnemyPopulations_LNFireflea),
    %enemySet(EnemySets_LNFireflea),
    %layer2Scrolls(0, 0),
    %scrollPointer(RoomScrolls_LNFireflea),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_LNFireflea),
    %libraryBG(0),
    %setupASM(0))

RoomDoors_LNFireflea:
    dw Door_LNFireflea_0
    dw Door_LNFireflea_1
    dw Door_LNFireflea_2

RoomScrolls_LNFireflea:
    db $00,$02,$00,$00,$02,$00,$00,$02,$00,$00,$01,$00,$00,$00,$00,$00
    db $01,$01

RoomPLM_LNFireflea_2:
    db $0B,$01, $80

RoomPLM_LNFireflea_5:
    db $0B,$02, $0D,$02, $0E,$02, $80

RoomPLM_LNFireflea_9:
    db $00,$01, $04,$00, $80

RoomPLM_LNFireflea_11:
    db $01,$02, $04,$02, $80

RoomHeader_LNSave:
    %RoomHeader(\
    %room($4C),
    %area(2),
    %positions($24, $0C),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_LNSave))
    %stateChecks(0)

RoomState_LNSave:
    %StateHeader(\
    %levelData(LevelData_SaveStation_LeftSideDoor),
    %tileset($19),
    %music($18, 5),
    %FX(FXHeader_LNSave),
    %enemyPop(EnemyPopulations_LNSave),
    %enemySet(EnemySets_LNSave),
    %layer2Scrolls(0, 0),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_LNSave),
    %libraryBG(0),
    %setupASM(0))

RoomDoors_LNSave:
    dw Door_LNSave_0



;;; $B76A: Library backgrounds ;;;
LibBG_ScrollingSky_Tilemaps_LandingSite:
    dw $000E,Door_GauntletEntrance_0 : dl ScrollingSky_Tilemaps_2 : dw $4800,$0800
    dw $000E,Door_Parlor_1 : dl ScrollingSky_Tilemaps_4 : dw $4800,$0800
    dw $000E,Door_CrateriaPowerBombs_0 : dl ScrollingSky_Tilemaps_1 : dw $4C00,$0800
    dw $000E,Door_CrateriaTube_0 : dl ScrollingSky_Tilemaps_4 : dw $4800,$0800
    dw $000E,Door_LandingSite_LandingCutscene : dl ScrollingSky_Tilemaps_0 : dw $4800,$0800
    dw $000E,Door_DemoSet3_0_2_4 : dl ScrollingSky_Tilemaps_2 : dw $4800,$0800
    dw $0000

LibBG_ScrollingSky_Tilemaps_WreckedShipEntrance:
    dw $000E,Door_BowlingAlleyPath_0 : dl ScrollingSky_Tilemaps_2 : dw $4800,$0800
    dw $000E,Door_Moat_1 : dl ScrollingSky_Tilemaps_5 : dw $4800,$0800
    dw $000E,Door_BowlingAlley_0 : dl ScrollingSky_Tilemaps_1 : dw $4C00,$0800
    dw $000E,Door_WreckedShipEntrance_0 : dl ScrollingSky_Tilemaps_5 : dw $4800,$0800
    dw $000E,Door_Attic_2 : dl ScrollingSky_Tilemaps_0 : dw $4800,$0800
    dw $000E,Door_GravitySuit_0 : dl ScrollingSky_Tilemaps_3 : dw $4C00,$0800
    dw $0000

LibBG_ScrollingSky_Tilemaps_EastOcean:
    dw $000E,Door_ForgottenHighwayKagos_0 : dl ScrollingSky_Tilemaps_5 : dw $4800,$0800
    dw $000E,Door_ElectricDeath_0 : dl ScrollingSky_Tilemaps_5 : dw $4800,$0800
    dw $0000

LibBG_ScrollingSky_Tilemaps_BowlingAlley:
    dw $0002 : dl ScrollingSky_Tilemaps_2 : dw $4800,$0800
    dw $0000

LibBG_Brinstar_1A_Kraid_Upper_Lower:
    dw $0008 : dl Tiles_Standard_BG3 : dw $2000,$1000
    dw $0004 : dl Background_Brinstar_1A_Kraid_Upper : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4000,$1000
    dw $0004 : dl Background_Brinstar_1A_Kraid_Lower_0 : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$1000
    dw $0000

LibBG_Standard_BG3_Tiles:
    dw $0008 : dl Tiles_Standard_BG3 : dw $2000,$1000,$000C,$0000

LibBG_Crocomire_State0:
    dw $0002 : dl $7E2000 : dw $4800,$1000
    dw $0000

LibBG_Crocomire_State1:
    dw $0002 : dl $7E2000 : dw $4800,$1000
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_LibBG_Brinstar_1A_Kraid_Lower_8FB863:
    dw $0004 : dl Background_Brinstar_1A_Kraid_Lower_1 : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED

LibBG_Crateria_0_VerticalPatternRocks:
    dw $0004 : dl Background_Crateria_0_VerticalPatternRocks : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Crateria_0_HorizontalPatternRocks:
    dw $0004 : dl Background_Crateria_0_HorizontalPatternRocks : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Crateria_0_Rocks:
    dw $0004 : dl Background_Crateria_0_Rocks : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Crateria_2_PurpleRocks:
    dw $0004 : dl Background_Crateria_2_PurpleRocks : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Crateria_2_BrickRoom_WallArt_Dark:
    dw $0004 : dl Background_Crateria_2_BrickRoom_WallArt_Dark : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Crateria_2_3_Mechanical:
    dw $0004 : dl Background_Crateria_2_3_Mechanical : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Crateria_2_BrickRoom_WallArt:
    dw $0004 : dl Background_Crateria_2_BrickRoom_WallArt : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Crateria_2_Elevator:
    dw $0004 : dl Background_Crateria_2_Elevator : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Crateria_2_BrickRoom:
    dw $0004 : dl Background_Crateria_2_BrickRoom : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000


;;; $B971: Door ASM: start Wrecked Ship treadmill west entrance ;;;
DoorASM_StartWreckedShipTreadmillWestEntrance:
; Room $93FE, door list index 1: Door
    LDY.W #AnimatedTilesObjects_FX_wreckedShipTreadmillRightwards
    JSL Spawn_AnimatedTilesObject
    JSL Spawn_Hardcoded_PLM
    db $04,$09
    dw PLMEntries_wreckedShipEntranceTreadmillFromWest
    RTS


;;; $B981: Door ASM: scroll 6 = green ;;;
DoorASM_Scroll_6_Green:
; Door destination: Crateria mainstreet
; Room $93D5, door 0. Crateria save station
; Room $96BA, door 0. Old Tourian escape shaft
; Room $98E2, door 0. Pre Crateria map station hall
; Room $9A44, door 1. Crateria bomb block hall
    PHP
    SEP #$20
    LDA.B #$02 : STA.L Scrolls+6
    PLP
    RTS


;;; $B98C: Door ASM: scroll 0 = blue ;;;
DoorASM_Scroll_0_Blue:
; Door destination: Crateria mainstreet
; Room $990D, door list index 1: Door
    PHP
    SEP #$20
    LDA.B #$01 : STA.L Scrolls
    PLP
    RTS


;;; $B997: Door ASM: scroll 13h = blue ;;;
DoorASM_Scroll_13_Blue:
; Door destination: Landing site
; Room $92B3, door list index 0: Door
    PHP
    SEP #$20
    LDA.B #$01 : STA.L Scrolls+$13
    PLP
    RTS


;;; $B9A2: Door ASM: scroll 4 = red, 8 = green ;;;
DoorASM_Scroll_4_Red_8_Green:
; Door destination: Wrecked Ship chozo room
; Room $9879, door list index 0: Door
    PHP
    SEP #$20
    LDA.B #$00 : STA.L Scrolls+4
    LDA.B #$02 : STA.L Scrolls+8
    PLP
    RTS


;;; $B9B3: Door ASM: scroll 8..Bh = red ;;;
DoorASM_Scroll_8_9_A_B_Red:
; Door destination: Wrecked Ship chozo room
; Room $93FE, door list index 4: Door
    PHP
    SEP #$20
    LDA.B #$00
    STA.L Scrolls+8 : STA.L Scrolls+9
    STA.L Scrolls+$A : STA.L Scrolls+$B
    PLP
    RTS


;;; $B9CA: Door ASM: scroll 2..5,Bh..Dh,11h = red ;;;
DoorASM_Scroll_2_3_4_5_B_C_D_11_Red:
; Door destination: Wrecked Ship chozo room
; Room $968F, door list index 1: Door
    PHP
    SEP #$20
    LDA.B #$00
    STA.L Scrolls+2 : STA.L Scrolls+3
    STA.L Scrolls+4 : STA.L Scrolls+5
    STA.L Scrolls+$B : STA.L Scrolls+$C
    STA.L Scrolls+$D : STA.L Scrolls+$11
    PLP
    RTS


;;; $B9F1: Door ASM: scroll 1,4 = green ;;;
DoorASM_Scroll_1_4_Green:
; Room $962A, door list index 0: Door
    PHP
    SEP #$20
    LDA.B #$02 : STA.L Scrolls+1 : STA.L Scrolls+4
    PLP
    RTS


;;; $BA00: Door ASM: scroll 2 = blue ;;;
DoorASM_Scroll_2_Blue:
; Room $99F9, door list index 0: Door
    PHP
    SEP #$20
    LDA.B #$01 : STA.L Scrolls+2
    PLP
    RTS


;;; $BA0B: Door ASM: scroll 17h = blue ;;;
DoorASM_Scroll_17_Blue:
; Room $99F9, door list index 1: Door
    PHP
    SEP #$20
    LDA.B #$01 : STA.L Scrolls+$17
    PLP
    RTS


;;; $BA16: Door ASM: scroll 4 = blue ;;;
DoorASM_Scroll_4_Blue:
; Room $99BD, door list index 3: Door
    PHP
    SEP #$20
    LDA.B #$01 : STA.L Scrolls+4
    PLP
    RTS


;;; $BA21: Door ASM: scroll 6 = green ;;;
DoorASM_Scroll_6_Green_duplicate:
; Room $962A, door list index 1: Door
    PHP
    SEP #$20
    LDA.B #$02 : STA.L Scrolls+6
    PLP
    RTS


;;; $BA2C: Door ASM: scroll 3 = green ;;;
DoorASM_Scroll_3_Green:
; Room $965B, door list index 1: Door
    PHP
    SEP #$20
    LDA.B #$02 : STA.L Scrolls+3
    PLP
    RTS


;;; $BA37: Library background ;;;
LibBG_Brinstar_6_Vertical_GlowPatches:
    dw $0004 : dl Background_Brinstar_6_Vertical_GlowPatches : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Brinstar_6_Horizontal_GlowPatches:
    dw $0004 : dl Background_Brinstar_6_Horizontal_GlowPatches : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Brinstar_6_LargeHorizontalPattern:
    dw $0004 : dl Background_Brinstar_6_LargeHorizontalPattern : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Brinstar_6_MediumHorizontalPattern:
    dw $0004 : dl Background_Brinstar_6_MediumHorizontalPattern : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Brinstar_6_ThinHorizontalPattern:
    dw $0004 : dl Background_Brinstar_6_ThinHorizontalPattern : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Brinstar_6_SmallPattern:
    dw $0004 : dl Background_Brinstar_6_SmallPattern : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Brinstar_6_SpheresPattern:
    dw $0004 : dl Background_Brinstar_6_SpheresPattern : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Brinstar_6_SmallPattern_Variety_0:
    dw $0004 : dl Background_Brinstar_6_SmallPattern_Variety_0 : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_LibBG_Brinstar_6_SmallPattern_Variety_1_8FBB0F:
    dw $0004 : dl Background_Brinstar_6_SmallPattern_Variety_1 : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

UNUSED_LibBG_Brinstar_6_SmallPattern_Variety_2_8FBB2A:
    dw $0004 : dl Background_Brinstar_6_SmallPattern_Variety_2 : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED

LibBG_Brinstar_6_DarkPattern:
    dw $0004 : dl Background_Brinstar_6_DarkPattern : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Tourian_15_Statues:
    dw $0004 : dl Background_Tourian_15_Statues : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$1000
    dw $0002 : dl Tiles_TourianStatuesSoul : dw $6D00,$0600
    dw $0000

LibBG_Brinstar_7_WideVerticalTower_Brick_0:
    dw $0004 : dl Background_Brinstar_7_WideVerticalTower_Brick_0 : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_LibBG_Brinstar_7_WideVerticalTower_Brick_1_8FBB96:
    dw $0004 : dl Background_Brinstar_7_WideVerticalTower_Brick_1 : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

UNUSED_LibBG_Brinstar_7_WideVerticalTower_Brick_2_8FBBB1:
    dw $0004 : dl Background_Brinstar_7_WideVerticalTower_Brick_2 : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED

LibBG_Brinstar_7_VerticalTower:
    dw $0004 : dl Background_Brinstar_7_VerticalTower : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Brinstar_7_NarrowVerticalTower_Brick:
    dw $0004 : dl Background_Brinstar_7_NarrowVerticalTower_Brick : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Brinstar_7_VerticalBrick_0:
    dw $0004 : dl Background_Brinstar_7_VerticalBrick_0 : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_LibBG_Brinstar_7_VerticalBrick_1_8FBC1D:
    dw $0004 : dl Background_Brinstar_7_VerticalBrick_1 : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED

LibBG_Brinstar_7_MechanicalRoom_SpikeFloor:
    dw $0004 : dl Background_Brinstar_7_MechanicalRoom_SpikeFloor : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Brinstar_7_MechanicalRoom:
    dw $0004 : dl Background_Brinstar_7_MechanicalRoom : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Brinstar_7_NarrowVerticalTower_Brick_Vines_0:
    dw $0004 : dl Background_Brinstar_7_NarrowVerticalTower_Brick_Vines_0 : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_LibBG_Brin_7_NarrowVerticalTower_Brick_Vines_1_8FBC89:
    dw $0004 : dl Background_Brinstar_7_NarrowVerticalTower_Brick_Vines_1 : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED

LibBG_Brinstar_8_NarrowVerticalTower_Brick_Grey_0:
    dw $0004 : dl Background_Brinstar_8_NarrowVerticalTower_Brick_Grey_0 : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$1000
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_LibBG_Brin_8_NarrowVerticalTower_Brick_Grey_1_8FBCB6:
    dw $0004 : dl Background_Brinstar_8_NarrowVerticalTower_Brick_Grey_1 : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

UNUSED_LibBG_Brin_8_NarrowVerticalTower_Brick_Grey_2_8FBCD1:
    dw $0004 : dl Background_Brinstar_8_NarrowVerticalTower_Brick_Grey_2 : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED

LibBG_Brinstar_7_BlueGridBlocks:
    dw $0004 : dl Background_Brinstar_7_BlueGridBlocks : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000


;;; $BD07: Door ASM: scroll 18h,1Ch = green ;;;
DoorASM_Scroll_18_1C_Green:
; Room $9AD9, door list index 8: Door
; Room $9FE5, door list index 0: Door
    PHP
    SEP #$20
    LDA.B #$02 : STA.L Scrolls+$18 : STA.L Scrolls+$1C
    PLP
    RTS


;;; $BD16: Door ASM: scroll 5..6 = blue ;;;
DoorASM_Scroll_5_6_Blue:
; Room $9AD9, door list index 7: Door
; Room $A22A, door list index 0: Door
    PHP
    SEP #$20
    LDA.B #$01 : STA.L Scrolls+5 : STA.L Scrolls+6
    PLP
    RTS


;;; $BD25: Door ASM: scroll 1Dh = blue ;;;
DoorASM_Scroll_1D_Blue:
; Room $9938, door list index 1: Door
; Room $9AD9, door list index 6: Door
; Room $A011, door list index 2: Door
    PHP
    SEP #$20
    LDA.B #$01 : STA.L Scrolls+$1D
    PLP
    RTS


;;; $BD30: Door ASM: scroll 2..3 = green ;;;
DoorASM_Scroll_2_3_Green:
; Room $9D19, door list index 2: Door
    PHP
    SEP #$20
    LDA.B #$02 : STA.L Scrolls+2 : STA.L Scrolls+3
    PLP
    RTS


;;; $BD3F: Door ASM: scroll 0 = red, 1 = green ;;;
DoorASM_Scroll_0_Red_1_Green:
; Room $A471, door list index 0: Door
    PHP
    SEP #$20
    LDA.B #$00 : STA.L Scrolls
    LDA.B #$02 : STA.L Scrolls+1
    PLP
    RTS


;;; $BD50: Door ASM: scroll Bh = green ;;;
DoorASM_Scroll_B_Green:
; Room $A07B, door list index 0: Door
    PHP
    SEP #$20
    LDA.B #$02 : STA.L Scrolls+$B
    PLP
    RTS


;;; $BD5B: Door ASM: scroll 1Ch = red, 1Dh = blue ;;;
DoorASM_Scroll_Scroll_1C_Red_1D_Blue:
; Room $A0A4, door list index 1: Door
    PHP
    SEP #$20
    LDA.B #$00 : STA.L Scrolls+$1C
    LDA.B #$01 : STA.L Scrolls+$1D
    PLP
    RTS


;;; $BD6C: Door ASM: scroll 4 = red ;;;
DoorASM_Scroll_4_Red:
; Room $9AD9, door list index 5: Door
    PHP
    SEP #$20
    LDA.B #$00 : STA.L Scrolls+4
    PLP
    RTS


;;; $BD77: Door ASM: scroll 20h,24h..25h = green ;;;
DoorASM_Scroll_20_24_25_Green:
; Room $A0D2, door list index 0: Door
    PHP
    SEP #$20
    LDA.B #$02
    STA.L Scrolls+$20 : STA.L Scrolls+$24 : STA.L Scrolls+$25
    PLP
    RTS


;;; $BD8A: Door ASM: scroll 2 = blue ;;;
DoorASM_Scroll_2_Blue_duplicate:
; Room $A1AD, door list index 0: Door
    PHP
    SEP #$20
    LDA.B #$01 : STA.L Scrolls+2
    PLP
    RTS


;;; $BD95: Door ASM: scroll 0 = green ;;;
DoorASM_Scroll_0_Green:
; Room $A641, door list index 0: Door
    PHP
    SEP #$20
    LDA.B #$02 : STA.L Scrolls
    PLP
    RTS


;;; $BDA0: Door ASM: scroll 6..7 = green ;;;
DoorASM_Scroll_6_7_Green:
; Room $A3DD, door list index 0: Door
; Room $A618, door list index 0: Door
    PHP
    SEP #$20
    LDA.B #$02 : STA.L Scrolls+6 : STA.L Scrolls+7
    PLP
    RTS


;;; $BDAF: Door ASM: scroll 1 = blue, 2 = red ;;;
DoorASM_Scroll_1_Blue_2_Red:
; Room $A322, door list index 4: Door
    PHP
    SEP #$20
    LDA.B #$01 : STA.L Scrolls+1
    LDA.B #$00 : STA.L Scrolls+2
    PLP
    RTS


;;; $BDC0: Door ASM: scroll 1 = blue, 3 = red ;;;
DoorASM_Scroll_1_Blue_3_Red:
; Room $9DC7, door list index 0: Door
    PHP
    SEP #$20
    LDA.B #$01 : STA.L Scrolls+1
    LDA.B #$00 : STA.L Scrolls+3
    PLP
    RTS


;;; $BDD1: Door ASM: scroll 0 = red, 4 = blue ;;;
DoorASM_Scroll_0_Red_4_Blue:
; Room $A6A1, door list index 0: Door
    PHP
    SEP #$20
    LDA.B #$00 : STA.L Scrolls
    LDA.B #$01 : STA.L Scrolls+4
    PLP
    RTS


;;; $BDE2: Door ASM: scroll 2..3 = blue ;;;
DoorASM_Scroll_2_3_Blue:
; Room $A70B, door list index 0: Door
    PHP
    SEP #$20
    LDA.B #$01 : STA.L Scrolls+2 : STA.L Scrolls+3
    PLP
    RTS


;;; $BDF1: Door ASM: scroll 0..1 = green ;;;
DoorASM_Scroll_0_1_Green:
; Room $A447, door list index 0: Door
    PHP
    SEP #$20
    LDA.B #$02 : STA.L Scrolls : STA.L Scrolls+1
    PLP
    RTS


;;; $BE00: Door ASM: scroll 1 = green ;;;
DoorASM_Scroll_1_Green:
; Room $A184, door list index 0: Door
    PHP
    SEP #$20
    LDA.B #$02 : STA.L Scrolls+1
    PLP
    RTS


;;; $BE0B: Door ASM: scroll Fh,12h = green ;;;
DoorASM_Scroll_F_12_Green:
; Room $A3AE, door list index 0: Door
    PHP
    SEP #$20
    LDA.B #$02 : STA.L Scrolls+$F : STA.L Scrolls+$12
    PLP
    RTS


;;; $BE1A: Door ASM: scroll 6 = green ;;;
DoorASM_Scroll_6_Green_duplicate_again:
; Room $A2F7, door list index 1: Door
    PHP
    SEP #$20
    LDA.B #$02 : STA.L Scrolls+6
    PLP
    RTS


;;; $BE25: Door ASM: scroll 0 = green, 1 = blue ;;;
DoorASM_Scroll_0_Green_1_Blue:
; Room $A107, door list index 0: Door
    PHP
    SEP #$20
    LDA.B #$02 : STA.L Scrolls
    LDA.B #$01 : STA.L Scrolls+1
    PLP
    RTS


;;; $BE36: Door ASM: scroll 2 = green ;;;
DoorASM_Scroll_2_Green:
; Room $9AD9, door list index 0: Door
    SEP #$20
    LDA.B #$02 : STA.L Scrolls+2
    RTS


;;; $BE3F: Library background ;;;
LibBG_Norfair_9_A_SmallPatternBrownPurple_Bright:
; Room $A75D, state $A76A: Post ice beam mockball hall
; Room $A865, state $A872: Ice beam practice room
; Room $A9E5, state $A9F2: Hi-jump room
; Room $AD1B, state $AD28: Speed booster room
; Room $B106, state $B113: Norfair speed blockade hall
    dw $0004 : dl Background_Norfair_9_A_SmallPatternBrownPurple_Bright : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Norfair_9_A_SmallPatternBrownPurple_0:
; Room $A815, state $A822: Ice beam mockball hall
; Room $A890, state $A89D: Ice beam room
; Room $A8B9, state $A8C6: Pre ice beam shaft
; Room $A923, state $A930: Norfair slope
; Room $AB64, state $AB71: Double lake grapple practice room
; Room $ACF0, state $ACFD: Speed booster lavaquake
; Room $AF14, state $AF21: Lower Norfair entrance
; Room $B4E5, state $B4F2: Lower Norfair lavaquake room
; Room $B585, state $B592: Lower Norfair kihunter shaft
    dw $0004 : dl Background_Norfair_9_A_SmallPatternBrownPurple_0 : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_LibBG_Norfair_9_A_SmallPatternBrownPurple_1_8FBE75:
    dw $0004 : dl Background_Norfair_9_A_SmallPatternBrownPurple_1 : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED

LibBG_Norfair_9_HorizontalPatternBrick:
; Room $B3E1, state $B3EE: Unused room
    dw $0004 : dl Background_Norfair_9_HorizontalPatternBrick : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Norfair_9_VerticalPatternBrick:
; Room $B3A5, state $B3B2: Lower Norfair power bomb floor shaft
    dw $0004 : dl Background_Norfair_9_VerticalPatternBrick : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Norfair_9_A_CavernStalagtites:
; Room $AADE, state $AAEB: Post Crocomire power bombs room
; Room $AB3B, state $AB48: Post Crocomire fluctuating acid missiles cave
; Room $AC00, state $AC0D: Single lake grapple practice room
; Room $ADDE, state $ADEB: Wave beam room
; Room $AE07, state $AE14: Norfair sinking kamer hall
; Room $AEB4, state $AEC1: Norfair multiviola and lavamen hall
; Room $AF3F, state $AF4C: Norfair -> Lower Norfair elevator
; Room $AFA3, state $AFB0: Norfair long lavaquake hall
; Room $AFCE, state $AFDB: Boring near-Crocomire hall
; Room $AFFB, state $B008: Norfair spike floor hall
    dw $0004 : dl Background_Norfair_9_A_CavernStalagtites : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Norfair_9_A_CavernVertical:
; Room $A7DE, state $A7EB: Norfair mainstreet
; Room $A8F8, state $A905: Crumble block platform shaft
; Room $AB07, state $AB14: Post Crocomire shaft
; Room $ABD2, state $ABDF: Grapple practice shaft
; Room $AC2B, state $AC38: Grapple room
; Room $B139, state $B146: Norfair stone zoomer shaft
    dw $0004 : dl Background_Norfair_9_A_CavernVertical : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Norfair_9_CavernHorizontalRuins:
; Room $B4AD, state $B4BA: Lower Norfair wall jumping space pirates shaft
    dw $0004 : dl Background_Norfair_9_CavernHorizontalRuins : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Norfair_9_CavernVerticalRuins:
; Room $B236, state $B243: Lower Norfair mainstreet
; Room $B2DA, state $B2E7: Screw attack practice
; Room $B457, state $B464: Lower Norfair breakable pillars hall
    dw $0004 : dl Background_Norfair_9_CavernVerticalRuins : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Norfair_9_CavernRoomPillars:
; Room $B1E5, state $B1F2: Golden chozo statue lava lake
; Room $B32E, state $B340: Ridley
; Room $B32E, state $B35A: Ridley
; Room $B55A, state $B567: Lower Norfair crumble walls power bomb room
; Room $B5D5, state $B5E2: Lower Norfair super desgeega hall
; Room $B698, state $B6A5: Ridley's energy tank
; Room $B6C1, state $B6CE: Screw attack shaft
    dw $0004 : dl Background_Norfair_9_CavernRoomPillars : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Norfair_9_RoomStatues:
; Room $B37A, state $B387: Pre Ridley hall
; Room $B482, state $B48F: Lower Norfair holtz room
; Room $B62B, state $B638: Elite pirate hall
    dw $0004 : dl Background_Norfair_9_RoomStatues : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Norfair_9_PurplePatches:
; Room $AC5A, state $AC67: Bubble Norfair reserve tank room
; Room $AEDF, state $AEEC: Pre "useless cave" shaft
; Room $B051, state $B05E: "useless cave"
; Room $B40A, state $B417: Lower Norfair multi-level one-way shaft
; Room $B510, state $B51D: Lower Norfair mini metal maze room
; Room $B656, state $B663: Impossible's x-ray room
    dw $0004 : dl Background_Norfair_9_PurplePatches : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Norfair_9_Bubbles:
; Room $AC83, state $AC90: Bubble Norfair pre reserve tank room
; Room $ACB3, state $ACC0: Bubble Norfair mainstreet
    dw $0004 : dl Background_Norfair_9_Bubbles : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000


;;; $BF9E: Door ASM: scroll 3..4 = red, 6..8 = blue ;;;
DoorASM_Scroll_3_4_Red_6_7_8_Blue:
; Room $B283, door list index 0: Door
    PHP
    SEP #$20
    LDA.B #$00 : STA.L Scrolls+3 : STA.L Scrolls+4
    LDA.B #$01 : STA.L Scrolls+6
    STA.L Scrolls+7 : STA.L Scrolls+8
    PLP
    RTS


;;; $BFBB: Door ASM: scroll 1..3 = blue, 4 = green, 6 = red ;;;
DoorASM_Scroll_1_2_3_Blue_4_Green_6_Red:
; Room $B55A, door list index 1: Door
    PHP
    SEP #$20
    LDA.B #$01 : STA.L Scrolls+1
    STA.L Scrolls+2 : STA.L Scrolls+3
    LDA.B #$02 : STA.L Scrolls+4
    LDA.B #$00 : STA.L Scrolls+6
    PLP
    RTS


;;; $BFDA: Door ASM: scroll 0..1 = blue ;;;
DoorASM_Scroll_0_1_Blue:
; Room $AA82, door list index 0: Door
    PHP
    SEP #$20
    LDA.B #$01 : STA.L Scrolls : STA.L Scrolls+1
    PLP
    RTS


;;; $BFE9: Door ASM: scroll 0 = blue, 1 = red ;;;
DoorASM_Scroll_0_Blue_1_Red:
; Room $ACF0, door list index 0: Door
    PHP
    SEP #$20
    LDA.B #$00 : STA.L Scrolls+1
    LDA.B #$01 : STA.L Scrolls
    PLP
    RTS


;;; $BFFA: Door ASM: scroll Ah = green ;;;
DoorASM_Scroll_A_Green:
; Room $A865, door list index 1: Door
    PHP
    SEP #$20
    LDA.B #$02 : STA.L Scrolls+$A
    PLP
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $C005: Unused. Door ASM: scroll 0 = blue, 2 = red ;;;
UNUSED_DoorASM_Scroll_0_Blue_2_Red_8FC005:
    PHP
    SEP #$20
    LDA.B #$01 : STA.L Scrolls
    LDA.B #$00 : STA.L Scrolls+2
    PLP
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C016: Door ASM: scroll 0,2 = green ;;;
DoorASM_Scroll_0_2_Green:
; Room $A9E5, door list index 0: Door
    PHP
    SEP #$20
    LDA.B #$02 : STA.L Scrolls : STA.L Scrolls+2
    PLP
    RTS


;;; $C025: Door ASM: scroll 6..7 = blue, 8 = red ;;;
DoorASM_Scroll_6_7_Blue_8_Red:
; Room $AE74, door list index 1: Door
    PHP
    SEP #$20
    LDA.B #$01 : STA.L Scrolls+6 : STA.L Scrolls+7
    LDA.B #$00 : STA.L Scrolls+8
    PLP
    RTS


;;; $C03A: Door ASM: scroll 2 = red, 3 = blue ;;;
DoorASM_Scroll_2_Red_3_Blue:
; Room $A890, door list index 0: Door
    PHP
    SEP #$20
    LDA.B #$00 : STA.L Scrolls+2
    LDA.B #$01 : STA.L Scrolls+3
    PLP
    RTS


;;; $C04B: Door ASM: scroll 7 = green ;;;
DoorASM_Scroll_7_Green:
; Room $B62B, door list index 1: Door
    PHP
    SEP #$20
    LDA.B #$02 : STA.L Scrolls+7
    PLP
    RTS


;;; $C056: Door ASM: scroll 1 = red, 2 = blue ;;;
DoorASM_Scroll_1_Red_2_Blue:
; Room $B2DA, door list index 1: Door
; Room $B457, door list index 0: Door
    PHP
    SEP #$20
    LDA.B #$00 : STA.L Scrolls+1
    LDA.B #$01 : STA.L Scrolls+2
    PLP
    RTS


;;; $C067: Door ASM: scroll 0 = blue, 3 = red ;;;
DoorASM_Scroll_0_Blue_3_Red:
; Room $B4E5, door list index 1: Door
    PHP
    SEP #$20
    LDA.B #$00 : STA.L Scrolls+3
    LDA.B #$01 : STA.L Scrolls
    PLP
    RTS


;;; $C078: Door ASM: scroll 1 = blue, 4 = red ;;;
DoorASM_Scroll_1_Blue_4_Red:
; Room $B55A, door list index 0: Door
    PHP
    SEP #$20
    LDA.B #$01 : STA.L Scrolls+1
    LDA.B #$00 : STA.L Scrolls+4
    PLP
    RTS


;;; $C089: Door ASM: scroll 0 = blue, 1..3 = red ;;;
DoorASM_Scroll_0_Blue_1_2_3_Red:
; Room $B1E5, door list index 0: Door
    PHP
    SEP #$20
    LDA.B #$01 : STA.L Scrolls
    LDA.B #$00 : STA.L Scrolls+1
    STA.L Scrolls+2 : STA.L Scrolls+3
    PLP
    RTS


;;; $C0A2: Door ASM: scroll 0 = green ;;;
DoorASM_Scroll_0_Green_duplicate:
; Room $B40A, door list index 1: Door
    PHP
    SEP #$20
    LDA.B #$02 : STA.L Scrolls
    PLP
    RTS


;;; $C0AD: Door ASM: scroll 0..1 = blue, 4 = red ;;;
DoorASM_Scroll_0_1_Blue_4_Red:
; Room $B510, door list index 1: Door
    PHP
    SEP #$20
    LDA.B #$01 : STA.L Scrolls : STA.L Scrolls+1
    LDA.B #$00 : STA.L Scrolls+4
    PLP
    RTS


;;; $C0C2: Door ASM: scroll 0 = blue, 3 = red ;;;
DoorASM_Scroll_0_Blue_3_Red_duplicate:
; Room $B6EE, door list index 2: Door
    PHP
    SEP #$20
    LDA.B #$01 : STA.L Scrolls
    LDA.B #$00 : STA.L Scrolls+3
    PLP
    RTS


;;; $C0D3: Door ASM: scroll 0 = blue ;;;
DoorASM_Scroll_0_Blue_duplicate:
; Room $AC5A, door list index 0: Door
    PHP
    SEP #$20
    LDA.B #$01 : STA.L Scrolls
    PLP
    RTS


;;; $C0DE: Door ASM: scroll 0 = blue, 1 = red ;;;
DoorASM_Scroll_0_Blue_1_Red_duplicate:
; Room $ACB3, door list index 3: Door
    PHP
    SEP #$20
    LDA.B #$01 : STA.L Scrolls
    LDA.B #$00 : STA.L Scrolls+1
    PLP
    RTS


;;; $C0EF: Door ASM: scroll 18h = blue ;;;
DoorASM_Scroll_18_Blue:
; Room $A8F8, door list index 0: Door
    PHP
    SEP #$20
    LDA.B #$01 : STA.L Scrolls+$18
    PLP
    RTS


;;; $C0FA: Door ASM: scroll 2 = blue, 3 = red ;;;
DoorASM_Scroll_2_Blue_3_Red:
; Room $AFFB, door list index 1: Door
    PHP
    SEP #$20
    LDA.B #$00 : STA.L Scrolls+3
    LDA.B #$01 : STA.L Scrolls+2
    PLP
    RTS


;;; $C10B: Door ASM: scroll Eh = red ;;;
DoorASM_Scroll_E_Red:
; Room $B4AD, door list index 0: Door
    PHP
    SEP #$20
    LDA.B #$00 : STA.L Scrolls+$E
    PLP
    RTS


;;; $C116: Main ASM: scrolling sky land ;;;
MainASM_ScrollingSkyLand:
; Room $91F8, state $9213. Landing site, power bombs
; Room $91F8, state $922D. Landing site, Zebes is awake
; Room $91F8, state $9247. Landing site, default
; Room $93AA. Landing site power bomb room
    JSL RoomMainASM_ScrollingSkyLand
    RTS


;;; $C11B: Main ASM: scrolling sky ocean ;;;
MainASM_ScrollingSkyOcean:
; Room $93FE. Wrecked Ship entrance
; Room $94FD. Wrecked Ship back door
; Room $968F. Orange zoomer room
    JSL RoomMainASM_ScrollingSkyOcean
    RTS


;;; $C120: Main ASM: scrolling sky land, Zebes timebomb set ;;;
MainASM_ScrollingSkyLand_ZebesTimebombSet:
; Room $91F8, state $9261. Landing site, Zebes timebomb set
    JSL RoomMainASM_ScrollingSkyLand
; fallthrough to MainASM_SetScreenShaking_GenerateRandomExplosions


;;; $C124: Main ASM: set screen shaking and generate random explosions ;;;
MainASM_SetScreenShaking_GenerateRandomExplosions:
; Room $92FD, state $9348. Crateria mainstreet, Zebes timebomb set
; Room $96BA, state $9705. Old Tourian escape shaft, Zebes timebomb set
; Room $9804, state $984F. Bomb Torizo's room, Zebes timebomb set
; Room $9879, state $98C4. Pre Bomb Torizo room, Zebes timebomb set
    JSR GenerateRandomExplosionOnEvenFramesOnRandomNonBlankTile
    LDA.W EarthquakeTimer : ORA.W #$8000 : STA.W EarthquakeTimer
    RTS


;;; $C131: Generate random explosion on even frames on random non-blank tile ;;;
GenerateRandomExplosionOnEvenFramesOnRandomNonBlankTile:
    LDA.W TimeIsFrozenFlag : BNE .return
    LDA.W NMI_FrameCounter : AND.W #$0001 : BNE .return
    JSL GenerateRandomNumber
    PHA
    AND.W #$00FF : CLC : ADC.W Layer1XPosition : STA.B DP_Temp12
    PLA : XBA : AND.W #$00FF
    CLC : ADC.W Layer1YPosition : STA.B DP_Temp14
    LSR #4
    SEP #$20
    PHA
    LDA.W RoomWidthBlocks : STA.W $4202
    PLA : STA.W $4203
    REP #$20
    LDA.B DP_Temp12 : LSR #4 : CLC : ADC.W $4216 : ASL : TAX
    LDA.L LevelData,X : AND.W #$03FF : CMP.W #$00FF : BNE GenerateRandomExplosionAt_12_14

  .return:
    RTS


;;; $C183: Generate random explosion on every fourth frame ;;;
GenerateRandomExplosionOnEveryFourthFrame:
    LDA.W TimeIsFrozenFlag : BNE GenerateRandomExplosionAt_12_14_return
    LDA.W NMI_FrameCounter : AND.W #$0003 : BNE GenerateRandomExplosionAt_12_14_return
    JSL GenerateRandomNumber
    PHA
    AND.W #$00FF : CLC : ADC.W Layer1XPosition : STA.B DP_Temp12
    PLA : XBA : AND.W #$00FF : CLC : ADC.W Layer1YPosition : STA.B DP_Temp14
; fallthrough to GenerateRandomExplosionAt_12_14


;;; $C1A9: Generate random explosion at ([$12], [$14]) ;;;
GenerateRandomExplosionAt_12_14:
; Note that if [random number] & Fh >= 8, then X is some garbage value (instead of random) for the purposes of indexing the sprite object IDs array
    JSL GenerateRandomNumber
    AND.W #$000F : CMP.W #$0008 : BCS +
    TAX
    LDA.W ExplosionSoundEffects,X : AND.W #$00FF : BEQ +
    JSL QueueSound_Lib2_Max6

+   TXA : AND.W #$0007 : TAX
    LDA.W ExplosionSpriteObjectIDs,X : AND.W #$00FF : STA.B DP_Temp16
    STZ.B DP_Temp18
    JSL Create_Sprite_Object

  .return:
    RTS

ExplosionSpriteObjectIDs:
; 3 = small explosion, 9 = small dust cloud, Ch = smoke, 12h = short big dust cloud, 15h = big dust cloud
    db $03,$03,$09,$0C,$0C,$12,$12,$15

ExplosionSoundEffects:
    db $24,$00,$00,$25,$00,$00,$00,$00


;;; $C1E6: Main ASM: scroll screen right in Dachora room ;;;
MainASM_ScrollScreenRightInDachoraRoom:
; Room $9CB3. Dachora room
; The intent of the code is probably to scroll the screen so that it's centred when falling down the shaft;
; in practice, the conditions for the scrolling never occur
    LDA.L Scrolls+$B : AND.W #$00FF : CMP.W #$0002 : BNE .return
    LDA.W Layer1YPosition : CMP.W #$0500 : BCS .return
    LDA.W Layer1XPosition : CMP.W #$0380 : BCS .return
    ADC.W #$0003 : STA.W Layer1XPosition

  .return:
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $C209: Unused. PLM metadata - Crateria / Brinstar / Norfair ;;;
UNUSED_8FC209:
; See UNUSED_UnknownUnreferenced_8FE881 for the other areas
    dw $0051 ; "Next" item / refill station index (50h is the last used one, see "Item PLMs.asm")
    dw $0061 ; "Next" doorcap index (60h is the last used one, see "Door PLMs.asm")
    dw $0001 ; ?
    dw $0002 ; Number of save stations in Crateria
    dw $0005 ; Number of save stations in Brinstar
    dw $0006 ; Number of save stations in Norfair
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C215: PLM populations ;;;
PLMPopulation_BowlingAlley_State0:
    %PLMPopEntry(PLMEntries_ScrollPLM, $1F, $2D, RoomPLM_BowlingAlley_0)
    %PLMPopEntry(PLMEntries_upwardsExtension, $41, $26, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $41, $27, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $41, $28, RoomPLM_BowlingAlley_3)
    dw $0000

PLMPopulation_WreckedShipEntrance_State0:
    dw $0000

PLMPopulation_Attic_State0:
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $06, $0080)
    %PLMPopEntry(PLMEntries_greyDoorFacingLeft, $6E, $06, $0081)
    %PLMPopEntry(PLMEntries_wreckedShipAttic, $08, $08, $8000)
    dw $0000

PLMPopulation_AssemblyLine_State0:
    dw $0000

PLMPopulation_WreckedShipMainShaft_State0_1:
    %PLMPopEntry(PLMEntries_ScrollPLM, $3E, $57, RoomPLM_WreckedShipMainShaft_0)
    %PLMPopEntry(PLMEntries_ScrollPLM, $51, $69, RoomPLM_WreckedShipMainShaft_1)
    %PLMPopEntry(PLMEntries_ScrollPLM, $41, $57, RoomPLM_WreckedShipMainShaft_2)
    %PLMPopEntry(PLMEntries_ScrollPLM, $4E, $69, RoomPLM_WreckedShipMainShaft_3)
    %PLMPopEntry(PLMEntries_ScrollPLM, $47, $6D, RoomPLM_WreckedShipMainShaft_4)
    %PLMPopEntry(PLMEntries_MissileTank, $02, $59, $0080)
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $41, $66, $0082)
    %PLMPopEntry(PLMEntries_greyDoorFacingLeft, $4E, $46, $0083)
    %PLMPopEntry(PLMEntries_greenDoorFacingUp, $46, $7D, $0084)
    dw $0000

PLMPopulation_SpikyDeath_State0:
    dw $0000

PLMPopulation_ElectricDeath_State0:
    %PLMPopEntry(PLMEntries_ScrollPLM, $07, $10, RoomPLM_ElectricDeath_0)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $08, $10, $8000)
    dw $0000

PLMPopulation_WreckedShipETank_State0:
    dw $0000

PLMPopulation_Basement_State0:
    %PLMPopEntry(PLMEntries_ScrollPLM, $40, $0C, RoomPLM_Basement_0)
    %PLMPopEntry(PLMEntries_ScrollPLM, $46, $0C, RoomPLM_Basement_1)
    %PLMPopEntry(PLMEntries_EyeDoorFacingLeft, $4E, $06, $0085)
    %PLMPopEntry(PLMEntries_EyeDoorBottomFacingLeft, $4E, $09, $0085)
    %PLMPopEntry(PLMEntries_EyeDoorEyeFacingLeft, $4E, $07, $0085)
    dw $0000

PLMPopulation_WreckedShipMap_State0:
    dw $0000

PLMPopulation_Phantoon_State0_1:
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $06, $0086)
    dw $0000

PLMPopulation_SpongeBath_State0:
    dw $0000

PLMPopulation_WSWestSuper_State0:
    dw $0000

PLMPopulation_WSEastSuper_State0:
    %PLMPopEntry(PLMEntries_ScrollPLM, $2F, $07, RoomPLM_WSEastSuper_0)
    dw $0000

PLMPopulation_GravitySuit_State0_WreckedShipSave_State0:
    dw $0000

PLMPopulation_WreckedShipSave_State1:
    %PLMPopEntry(PLMEntries_saveStation, $07, $0B, $0000)
    dw $0000

PLMPopulation_BowlingAlley_State1:
    %PLMPopEntry(PLMEntries_ScrollPLM, $1F, $2D, RoomPLM_BowlingAlley_0)
    %PLMPopEntry(PLMEntries_upwardsExtension, $41, $26, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $41, $27, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $41, $28, RoomPLM_BowlingAlley_3)
    %PLMPopEntry(PLMEntries_ReserveTankChozoOrb, $53, $0B, $0081)
    %PLMPopEntry(PLMEntries_MissileTank, $3C, $26, $0082)
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $16, $9087)
    dw $0000

PLMPopulation_WreckedShipEntrance_State1:
    dw $0000

PLMPopulation_Attic_State1:
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $06, $0C88)
    %PLMPopEntry(PLMEntries_greyDoorFacingLeft, $6E, $06, $0C89)
    %PLMPopEntry(PLMEntries_greyDoorFacingUp, $46, $0E, $0C8A)
    %PLMPopEntry(PLMEntries_wreckedShipAttic, $08, $08, $8000)
    dw $0000

PLMPopulation_AssemblyLine_State1:
    %PLMPopEntry(PLMEntries_MissileTank, $2D, $08, $0083)
    dw $0000

PLMPopulation_SpikyDeath_State1:
    dw $0000

PLMPopulation_ElectricDeath_State1:
    %PLMPopEntry(PLMEntries_ScrollPLM, $07, $10, RoomPLM_ElectricDeath_0)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $08, $10, $8000)
    %PLMPopEntry(PLMEntries_redDoorFacingRight, $01, $06, $008B)
    dw $0000

PLMPopulation_WreckedShipETank_State1:
    %PLMPopEntry(PLMEntries_EnergyTank, $03, $06, $0084)
    dw $0000

PLMPopulation_Basement_State1:
    %PLMPopEntry(PLMEntries_ScrollPLM, $40, $0C, RoomPLM_Basement_0)
    %PLMPopEntry(PLMEntries_ScrollPLM, $46, $0C, RoomPLM_Basement_1)
    dw $0000

PLMPopulation_WreckedShipMap_State1:
    %PLMPopEntry(PLMEntries_mapStation, $05, $0A, $8000)
    dw $0000

PLMPopulation_SpongeBath_State1:
    dw $0000

PLMPopulation_WSWestSuper_State1:
    %PLMPopEntry(PLMEntries_SuperMissileTank, $02, $07, $0085)
    dw $0000

PLMPopulation_WSEastSuper_State1:
    %PLMPopEntry(PLMEntries_ScrollPLM, $2F, $07, RoomPLM_WSEastSuper_0)
    %PLMPopEntry(PLMEntries_SuperMissileTank, $38, $09, $0086)
    dw $0000

PLMPopulation_GravitySuit_State1:
    %PLMPopEntry(PLMEntries_GravitySuitChozoOrb, $07, $09, $0087)
    dw $0000

PLMPopulation_GlassTunnelSave:
    %PLMPopEntry(PLMEntries_saveStation, $07, $0B, $0000)
    dw $0000

PLMPopulation_GlassTunnel_State0_1:
    %PLMPopEntry(PLMEntries_ScrollPLM, $03, $14, RoomPLM_GlassTunnel_0_4)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $04, $14, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $05, $14, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $06, $14, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $09, $14, RoomPLM_GlassTunnel_0_4)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $0A, $14, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $0B, $14, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $0C, $14, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $05, $1D, RoomPLM_GlassTunnel_8)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $06, $1D, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $07, $1D, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $08, $1D, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $09, $1D, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $0A, $1D, $8000)
    %PLMPopEntry(PLMEntries_NoobTube, $02, $15, $0080)
    %PLMPopEntry(PLMEntries_redDoorFacingLeft, $0E, $26, $008C)
    dw $0000

PLMPopulation_WestTunnel:
    dw $0000

PLMPopulation_EastTunnel:
    %PLMPopEntry(PLMEntries_ScrollPLM, $05, $09, RoomPLM_EastTunnel_0)
    %PLMPopEntry(PLMEntries_ScrollPLM, $05, $10, RoomPLM_EastTunnel_1)
    %PLMPopEntry(PLMEntries_ScrollPLM, $05, $16, RoomPLM_EastTunnel_2)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0A, $03, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0A, $04, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0A, $05, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0A, $06, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0A, $07, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0A, $08, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $0A, $09, RoomPLM_EastTunnel_9)
    %PLMPopEntry(PLMEntries_downwardsClosedGate, $16, $05, $8000)
    %PLMPopEntry(PLMEntries_downwardsGateShotblock, $16, $05, $000A)
    dw $0000

PLMPopulation_MainStreet:
    %PLMPopEntry(PLMEntries_ScrollPLM, $25, $29, RoomPLM_MainStreet_0)
    %PLMPopEntry(PLMEntries_redDoorFacingLeft, $1E, $76, $008D)
    %PLMPopEntry(PLMEntries_MissileTank, $0E, $35, $0088)
    %PLMPopEntry(PLMEntries_SuperMissileTank, $16, $28, $0089)
    dw $0000

PLMPopulation_FishTank:
    %PLMPopEntry(PLMEntries_upwardsExtension, $1F, $26, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $1F, $27, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $1F, $28, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $1F, $29, RoomPLM_FishTank_3_7)
    %PLMPopEntry(PLMEntries_upwardsExtension, $30, $26, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $30, $27, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $30, $28, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $30, $29, RoomPLM_FishTank_3_7)
    %PLMPopEntry(PLMEntries_redDoorFacingLeft, $3E, $26, $008E)
    dw $0000

PLMPopulation_MamaTurtle:
    %PLMPopEntry(PLMEntries_EnergyTank, $1F, $0A, $008A)
    %PLMPopEntry(PLMEntries_MissileTankShotBlock, $2C, $1D, $008B)
    dw $0000

PLMPopulation_CrabTunnel:
    %PLMPopEntry(PLMEntries_downwardsClosedGate, $0E, $07, $8000)
    %PLMPopEntry(PLMEntries_downwardsGateShotblock, $0E, $07, $0008)
    dw $0000

PLMPopulation_MtEverest:
    dw $0000

PLMPopulation_RedFish:
    %PLMPopEntry(PLMEntries_ScrollPLM, $20, $06, RoomPLM_RedFish_0)
    %PLMPopEntry(PLMEntries_ScrollPLM, $1E, $06, RoomPLM_RedFish_1)
    dw $0000

PLMPopulation_WateringHole:
    %PLMPopEntry(PLMEntries_ScrollPLM, $07, $1F, RoomPLM_WateringHole_0)
    %PLMPopEntry(PLMEntries_SuperMissileTank, $04, $26, $008C)
    %PLMPopEntry(PLMEntries_MissileTank, $0B, $27, $008D)
    dw $0000

PLMPopulation_NWestMaridiaBug:
    %PLMPopEntry(PLMEntries_upwardsExtension, $20, $16, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $20, $17, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $20, $18, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $20, $19, RoomPLM_NWestMaridiaBug_3_7)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0F, $16, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0F, $17, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0F, $18, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $0F, $19, RoomPLM_NWestMaridiaBug_3_7)
    dw $0000

PLMPopulation_CrabShaft:
    %PLMPopEntry(PLMEntries_ScrollPLM, $07, $2D, RoomPLM_CrabShaft_0)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $08, $2D, $8000)
    %PLMPopEntry(PLMEntries_greenDoorFacingLeft, $1E, $36, $008F)
    dw $0000

PLMPopulation_PseudoPlasmaSpark:
    %PLMPopEntry(PLMEntries_upwardsExtension, $1F, $26, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $1F, $27, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $1F, $28, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $1F, $29, RoomPLM_PseudoPlasmaSpark_3)
    %PLMPopEntry(PLMEntries_upwardsExtension, $1D, $26, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $1D, $27, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $1D, $28, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $1D, $29, RoomPLM_PseudoPlasmaSpark_7)
    %PLMPopEntry(PLMEntries_MissileTank, $2C, $28, $008E)
    dw $0000

PLMPopulation_CrabHole:
    %PLMPopEntry(PLMEntries_ScrollPLM, $08, $0E, RoomPLM_CrabHole_0_1)
    %PLMPopEntry(PLMEntries_ScrollPLM, $08, $11, RoomPLM_CrabHole_0_1)
    %PLMPopEntry(PLMEntries_redDoorFacingLeft, $0E, $16, $0090)
    dw $0000

PLMPopulation_WestSandHallTunnel:
    dw $0000

PLMPopulation_PlasmaTutorial:
    dw $0000

PLMPopulation_Plasma:
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $06, $0C91)
    %PLMPopEntry(PLMEntries_PlasmaBeamChozoOrb, $19, $26, $008F)
    dw $0000

PLMPopulation_ThreadTheNeedle:
    dw $0000

PLMPopulation_MaridiaElev:
    %PLMPopEntry(PLMEntries_elevatorPlatform, $06, $2C, $8000)
    %PLMPopEntry(PLMEntries_redDoorFacingLeft, $0E, $46, $0092)
    dw $0000

PLMPopulation_PlasmaSpark:
    %PLMPopEntry(PLMEntries_greyDoorFacingLeft, $2E, $16, $0093)
    %PLMPopEntry(PLMEntries_greenDoorFacingUp, $06, $2D, $0094)
    dw $0000

PLMPopulation_Kassiuz:
    dw $0000

PLMPopulation_MaridiaMap:
    %PLMPopEntry(PLMEntries_mapStation, $0B, $0A, $8000)
    dw $0000

PLMPopulation_ForgottenHighwaySave:
    %PLMPopEntry(PLMEntries_saveStation, $07, $0B, $0001)
    dw $0000

PLMPopulation_Toilet:
    dw $0000

PLMPopulation_BugSandHole:
    dw $0000

PLMPopulation_WestSandHall:
    dw $0000

PLMPopulation_Oasis:
    %PLMPopEntry(PLMEntries_ScrollPLM, $03, $14, RoomPLM_Oasis_0)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $04, $14, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $05, $14, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $06, $14, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $07, $14, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $08, $14, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $09, $14, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $0A, $14, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $0B, $14, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $0C, $14, $8000)
    %PLMPopEntry(PLMEntries_greenDoorFacingDown, $06, $02, $0095)
    dw $0000

PLMPopulation_EastSandHall:
    dw $0000

PLMPopulation_WestSandHole:
    %PLMPopEntry(PLMEntries_MissileTank, $06, $04, $0090)
    %PLMPopEntry(PLMEntries_ReserveTankChozoOrb, $0F, $04, $0091)
    dw $0000

PLMPopulation_EastSandHole:
    %PLMPopEntry(PLMEntries_MissileTank, $03, $07, $0092)
    %PLMPopEntry(PLMEntries_PowerBombTank, $19, $10, $0093)
    dw $0000

PLMPopulation_WestAqueductQuicksand:
    dw $0000

PLMPopulation_EastAqueductQuicksand:
    dw $0000

PLMPopulation_Aqueduct:
    %PLMPopEntry(PLMEntries_redDoorFacingRight, $01, $26, $0096)
    %PLMPopEntry(PLMEntries_MissileTank, $4C, $09, $0094)
    %PLMPopEntry(PLMEntries_SuperMissileTank, $5C, $08, $0095)
    dw $0000

PLMPopulation_Butterfly:
    %PLMPopEntry(PLMEntries_greyDoorFacingLeft, $0E, $06, $0097)
    dw $0000

PLMPopulation_BotwoonHallway:
    dw $0000

PLMPopulation_Pants:
    %PLMPopEntry(PLMEntries_ScrollPLM, $06, $32, RoomPLM_Pants_0_4)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $07, $32, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $08, $32, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $09, $32, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $0D, $0C, RoomPLM_Pants_0_4)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0D, $0B, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0D, $0A, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0D, $09, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0D, $08, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0D, $07, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0D, $06, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0D, $05, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0D, $04, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $12, $0E, RoomPLM_Pants_D)
    %PLMPopEntry(PLMEntries_upwardsExtension, $12, $0D, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $12, $0C, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $12, $0B, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $12, $0A, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $12, $09, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $12, $08, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $12, $07, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $15, $2B, RoomPLM_Pants_15)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $16, $2B, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $17, $2B, $8000)
    dw $0000

PLMPopulation_EastPants:
    %PLMPopEntry(PLMEntries_ScrollPLM, $05, $22, RoomPLM_EastPants_0)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $06, $22, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $07, $22, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $08, $22, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $09, $22, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $0A, $12, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $05, $1B, RoomPLM_EastPants_6)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $06, $1B, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $07, $1B, $8000)
    dw $0000

PLMPopulation_Springball:
    %PLMPopEntry(PLMEntries_SpringBallChozoOrb, $18, $16, $0096)
    dw $0000

PLMPopulation_BelowBotwoonETank:
    dw $0000

PLMPopulation_Colosseum:
    %PLMPopEntry(PLMEntries_redDoorFacingLeft, $6E, $06, $0098)
    %PLMPopEntry(PLMEntries_greenDoorFacingLeft, $4E, $26, $0099)
    %PLMPopEntry(PLMEntries_greenDoorFacingLeft, $6E, $16, $009A)
    dw $0000

PLMPopulation_AqueductSave:
    %PLMPopEntry(PLMEntries_saveStation, $05, $0B, $0002)
    dw $0000

PLMPopulation_ThePrecious_State0_1:
    %PLMPopEntry(PLMEntries_ScrollPLM, $04, $0E, RoomPLM_ThePrecious_0)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $05, $0E, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $06, $0E, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $07, $0E, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $08, $0E, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $09, $0E, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $0A, $0E, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $0B, $0E, $8000)
    %PLMPopEntry(PLMEntries_EyeDoorFacingRight, $01, $26, $009B)
    %PLMPopEntry(PLMEntries_EyeDoorBottomFacingRight, $01, $29, $009B)
    %PLMPopEntry(PLMEntries_EyeDoorEyeFacingRight, $01, $27, $009B)
    %PLMPopEntry(PLMEntries_MissileTankShotBlock, $1C, $06, $0097)
    dw $0000

PLMPopulation_BotwoonETank:
    %PLMPopEntry(PLMEntries_EnergyTank, $32, $05, $0098)
    dw $0000

PLMPopulation_DraygonSave:
    %PLMPopEntry(PLMEntries_saveStation, $07, $0B, $0003)
    dw $0000

PLMPopulation_MaridiaMissileRefill:
    %PLMPopEntry(PLMEntries_missileStation, $08, $0A, $0099)
    dw $0000

PLMPopulation_PlasmaBeachQuicksand:
    dw $0000

PLMPopulation_BotwoonQuicksand:
    dw $0000

PLMPopulation_Shaktool_State0_1:
    dw $0000

PLMPopulation_HalfieClimb:
    %PLMPopEntry(PLMEntries_ScrollPLM, $10, $29, RoomPLM_HalfieClimb_0)
    %PLMPopEntry(PLMEntries_ScrollPLM, $0B, $29, RoomPLM_HalfieClimb_1)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0B, $28, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0B, $27, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0B, $26, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $0E, $29, RoomPLM_HalfieClimb_5)
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $16, $009C)
    dw $0000

PLMPopulation_Botwoon_State0_1:
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $06, $049D)
    dw $0000

PLMPopulation_SpaceJump:
    %PLMPopEntry(PLMEntries_SpaceJumpChozoOrb, $04, $08, $009A)
    dw $0000

PLMPopulation_MaridiaEnergyRefill:
    %PLMPopEntry(PLMEntries_energyStation, $08, $0A, $009B)
    dw $0000

PLMPopulation_WestCactusAlley:
    dw $0000

PLMPopulation_EastCactusAlley:
    dw $0000

PLMPopulation_Draygon_State0_1:
    %PLMPopEntry(PLMEntries_greyDoorFacingLeft, $1E, $06, $009E)
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $16, $009F)
    %PLMPopEntry(PLMEntries_DraygonCannonFacingRight, $02, $0B, $8802)
    %PLMPopEntry(PLMEntries_DraygonCannonWithShieldFacingRight, $02, $12, $8804)
    %PLMPopEntry(PLMEntries_DraygonCannonWithShieldFacingLeft, $1D, $0F, $8806)
    %PLMPopEntry(PLMEntries_DraygonCannonWithShieldFacingLeft, $1D, $15, $8808)
    dw $0000

PLMPopulation_TourianFirst:
    %PLMPopEntry(PLMEntries_elevatorPlatform, $06, $2C, $8000)
    dw $0000

PLMPopulation_Metroids1_State0_1:
    %PLMPopEntry(PLMEntries_SetsMetroidsClearedStatesWhenRequired, $08, $08, $0012)
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $06, $0CA0)
    dw $0000

PLMPopulation_Metroids2_State0_1:
    %PLMPopEntry(PLMEntries_SetsMetroidsClearedStatesWhenRequired, $08, $08, $0014)
    %PLMPopEntry(PLMEntries_greyDoorFacingLeft, $0E, $16, $0CA1)
    dw $0000

PLMPopulation_Metroids3_State0_1:
    %PLMPopEntry(PLMEntries_SetsMetroidsClearedStatesWhenRequired, $08, $08, $0016)
    %PLMPopEntry(PLMEntries_greyDoorFacingLeft, $5E, $06, $0CA2)
    dw $0000

PLMPopulation_Metroids4_State0_1:
    %PLMPopEntry(PLMEntries_SetsMetroidsClearedStatesWhenRequired, $08, $08, $0018)
    %PLMPopEntry(PLMEntries_greyDoorFacingUp, $06, $1E, $0CA3)
    dw $0000

PLMPopulation_BlueHopper_State0_1:
    dw $0000

PLMPopulation_DustTorizo_State0_1:
    %PLMPopEntry(PLMEntries_greyDoorFacingLeft, $1E, $06, $90A4)
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $06, $0CA5)
    dw $0000

PLMPopulation_BigBoy_State0_1:
    %PLMPopEntry(PLMEntries_greyDoorFacingLeft, $3E, $06, $90A6)
    dw $0000

PLMPopulation_Seaweed:
    %PLMPopEntry(PLMEntries_redDoorFacingLeft, $0E, $16, $00A7)
    dw $0000

PLMPopulation_TourianRecharge:
    %PLMPopEntry(PLMEntries_missileStation, $08, $0A, $009C)
    %PLMPopEntry(PLMEntries_energyStation, $06, $0A, $009D)
    dw $0000

PLMPopulation_MotherBrain_State0_1_2:
    %PLMPopEntry(PLMEntries_MotherBrainsGlass, $09, $05, $8000)
    dw $0000

PLMPopulation_TourianEyeDoor:
    %PLMPopEntry(PLMEntries_EyeDoorFacingLeft, $3E, $06, $00A8)
    %PLMPopEntry(PLMEntries_EyeDoorBottomFacingLeft, $3E, $09, $00A8)
    %PLMPopEntry(PLMEntries_EyeDoorEyeFacingLeft, $3E, $07, $00A8)
    dw $0000

PLMPopulation_RinkaShaft:
    %PLMPopEntry(PLMEntries_redDoorFacingRight, $01, $26, $00A9)
    dw $0000

PLMPopulation_MotherBrainSave:
    %PLMPopEntry(PLMEntries_saveStation, $05, $0B, $0000)
    dw $0000

PLMPopulation_TourianEscape1:
    %PLMPopEntry(PLMEntries_SetsMetroidsClearedStatesWhenRequired, $08, $08, $0000)
    %PLMPopEntry(PLMEntries_gateThatClosesInEscapeRoom1, $1F, $06, $8000)
    dw $0000

PLMPopulation_TourianEscape2:
    %PLMPopEntry(PLMEntries_SetsMetroidsClearedStatesWhenRequired, $08, $08, $0002)
    %PLMPopEntry(PLMEntries_greyDoorFacingDown, $06, $03, $90AA)
    dw $0000

PLMPopulation_TourianEscape3:
    %PLMPopEntry(PLMEntries_SetsMetroidsClearedStatesWhenRequired, $08, $08, $0004)
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $16, $90AB)
    dw $0000

PLMPopulation_TourianEscape4:
    %PLMPopEntry(PLMEntries_SetsMetroidsClearedStatesWhenRequired, $08, $08, $0006)
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $36, $90AC)
    dw $0000

PLMPopulation_UpperTourianSave:
    %PLMPopEntry(PLMEntries_saveStation, $07, $0B, $0001)
    dw $0000

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


;;; $C8C7: Setup ASM: RTS ;;;
RTS_8FC8C7:
; Room $C98E. Walking chozo room
; Room $CA08. Wrecked Ship entrance treadmill
; Room $CA52. Wrecked Ship attic
; Room $CAAE. Wrecked Ship attic missile tank room
; Room $CAF6. Wrecked Ship mainstreet
; Room $CB8B. Wrecked Ship flooded spikey hall
; Room $CBD5. Wrecked Ship -> East Crateria
; Room $CC27. Wrecked Ship energy tank chozo room
    RTS


;;; $C8C8: Setup ASM: spawn pre Phantoon room enemy projectile ;;;
SetupASM_SpawnPrePhantoonRoomEnemyProjectile:
; Room $CC6F. Pre Phantoon room
    LDY.W #EnemyProjectile_PrePhantoonRoom
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    RTS


;;; $C8D0: Setup ASM: RTS ;;;
RTS_8FC8D0:
; Room $CCCB. Wrecked Ship map room
; Room $CD13. Phantoon's room
; Room $CD5C. Wrecked Ship first drowned room
; Room $CDA8. Wrecked Ship obvious super missile room
; Room $CDF1. Wrecked Ship hidden super missile hall
; Room $CE40. Gravity suit room
; Room $CE8A. Wrecked Ship save room, Phantoon dead
    RTS


;;; $C8D1: Setup ASM: RTS ;;;
RTS_8FC8D1:
; Room $CED2. n00b tube save room
; Room $CEFB. n00b tube
; Room $CF54. n00b tube west
; Room $CF80. n00b tube east
; Room $CFC9. Maridia mainstreet
; Room $D017. Maridia space pirate room
; Room $D055. Maridia spinning turtle room
; Room $D08A. Maridia green gate hall
; Room $D0B9. Mt. Doom
; Room $D104. Maridia -> Red Brinstar
; Room $D13B. Sandy Maridia missile and super missile room
; Room $D16D. Sandy Maridia memu room
; Room $D1A3. Maridia pink room
; Room $D1DD. Sandy Maridia unused passage to Sandy Maridia mainstreet
; Room $D21C. Maridia broken glass tube room
; Room $D252. Maridia broken glass tube room east
; Room $D27E. Plasma beam puyo room
; Room $D2AA. Plasma beam room
; Room $D2D9. Sandy room thin platform hall
; Room $D30B. Maridia -> Crateria
; Room $D340. Sandy Maridia mainstreet
; Room $D387. Pre plasma beam shaft
; Room $D3B6. Maridia map room
    RTS


;;; $C8D2: Setup ASM: RTS ;;;
RTS_8FC8D2:
; Room $D408. Elevatube
; Room $D433. Sandy Maridia drowning sand pit room
; Room $D461. Sand falls west
; Room $D48E. Elevatube south
; Room $D4C2. Sand falls east
; Room $D4EF. Maridia reserve tank room
; Room $D51E. PB #66 room
; Room $D54D. Pre Maridia reserve tank room sand fall room
; Room $D57A. Pre PB #66 room sand fall room
; Room $D5A7. Snail room
; Room $D5EC. Sandy Maridia sand pit room
; Room $D617. Mochtroid room
; Room $D646. Pre Shaktool room
; Room $D69A. Pre Shaktool room section
; Room $D6D0. Springball room
; Room $D6FD. Sand falls sand pit
; Room $D72A. Maridia grapple room
; Room $D765. Snail room save room
; Room $D78F. Pre Draygon room
; Room $D7E4. Maridia speed blockade room
; Room $D81A. Draygon save room
; Room $D845. Maridia missile station
; Room $D86E. Sandy Maridia sand falls room
; Room $D898. Sand falls
    RTS


;;; $C8D3: Setup ASM: set up Shaktool's room's PLM ;;;
SetupASM_SetupShaktoolsRoomPLM:
; Room $D8C5, state $D8D7. Shaktool's room, default
    JSL Spawn_Hardcoded_PLM
    db $00,$00
    dw PLMEntries_shaktoolsRoom
    RTS


;;; $C8DC: Setup ASM: RTS ;;;
RTS_8FC8DC:
; Room $D8C5, state $D8F1. Shaktool's event is set
; Room $D913, state $D920. Maridia grapple wall shaft
; Room $D95E. Botwoon's room
; Room $D9AA. Space jump room
    RTS


;;; $C8DD: Setup ASM: set pausing code for Draygon ;;;
SetupASM_SetPausingCodeForDraygon:
; Room $DA60. Draygon's room
    LDA.W #PauseHook_Draygon>>8&$FF00 : STA.W PauseHook_Pause+1
    LDA.W #PauseHook_Draygon : STA.W PauseHook_Pause
    LDA.W #UnpauseHook_Draygon>>8&$FF00 : STA.W PauseHook_Unpause+1
    LDA.W #UnpauseHook_Draygon : STA.W PauseHook_Unpause
    RTS


;;; $C8F6: Pause hook - Draygon ;;;
PauseHook_Draygon:
; Set interrupt handler to main gameplay
    LDA.W #$0004 : STA.B DP_NextIRQCmd
    RTL


;;; $C8FC: Unpause hook - Draygon ;;;
UnpauseHook_Draygon:
    LDA.W HDMAObject_ChannelBitflags+2 : CMP.W #$0008 : BNE .return
    LDA.W #$000C : STA.B DP_NextIRQCmd

  .return:
    RTL


;;; $C90A: Setup ASM: set collected map ;;;
SetupASM_SetCollectedMap:
; Room $DAAE. Tourian -> Crateria
    REP #$30
    LDX.W AreaIndex
    LDA.L SRAMMirror_MapStations,X : ORA.W #$0001 : STA.L SRAMMirror_MapStations,X : STA.W CurrentAreaMapCollectedFlag
    RTS


;;; $C91E: Setup ASM: RTS ;;;
RTS_8FC91E:
; Room $DAE1. Metroid room 1
; Room $DB31. Metroid room 2
; Room $DB7D. Metroid room 3
; Room $DBCD. Metroid room 4
; Room $DC19. Tourian super-sidehopper room
; Room $DC65. Drained Torizo room
; Room $DCB1. Shitroid room
; Room $DCFF. Post Shitroid room
; Room $DD2E. Tourian refill station
; Room $DD58. Mother Brain's room
; Room $DDC4. Tourian eye-door room
; Room $DDF3. Pre Mother Brain room
; Room $DE23. Mother Brain save room
    RTS


;;; $C91F: Setup ASM: set Zebes timebomb event and set light horizontal room shaking ;;;
SetupASM_SetZebesTimebombEvent_SetLightHorizontalRoomShaking:
; Room $DE4D. Escape room 1
; The Zebes timebomb set event was already marked by Mother Brain when she started the time ($A9:B313),
; no reason to do it here
    LDA.W #$000E
    JSL MarkEvent_inA
    LDA.W #$0012 : STA.W EarthquakeType
    LDA.W #$FFFF : STA.W EarthquakeTimer
    RTS


;;; $C933: Setup ASM: set light horizontal room shaking ;;;
SetupASM_SetLightHorizontalRoomShaking:
; Room $DE7A. Escape room 2
    LDA.W #$0012 : STA.W EarthquakeType : STA.W RoomMainASMVar2
    STZ.W RoomMainASMVar1
    LDA.W #$FFFF : STA.W EarthquakeTimer
    RTS


;;; $C946: Setup ASM: set medium horizontal room shaking ;;;
SetupASM_SetMediumHorizontalRoomShaking:
; Room $DEA7. Escape room 3
    LDA.W #$0015 : STA.W EarthquakeType
    LDA.W #$FFFF : STA.W EarthquakeTimer
    RTS


;;; $C953: Setup ASM: set up escape room 4's PLM and set medium horizontal room shaking ;;;
SetupASM_SetupEscapeRoom4sPLM_SetMediumHorizontalRoomShaking:
; Room $DEDE. Escape room 4
    JSL Spawn_Hardcoded_PLM
    db $10,$10
    dw PLMEntries_RaiseAcidInEscapeRoomBeforeOldTourianEscapeShaft
    LDA.W #$0015 : STA.W EarthquakeType : STA.W RoomMainASMVar2
    STZ.W RoomMainASMVar1
    LDA.W #$FFFF : STA.W EarthquakeTimer
    RTS


;;; $C96E: Setup ASM: turn Ceres door to solid blocks and spawn Ceres haze ;;;
SetupASM_TurnCeresDoorToSolidBlocks_SpawnCeresHaze:
; Room $DF45, state $DF71. Ceres elevator, Ceres Ridley dead
    JSL Spawn_Hardcoded_PLM
    db $0F,$26
    dw PLMEntries_turnCeresElevatorDoorToSolidBlocksDuringEscape
; fallthrough to SetupASM_SpawnCeresHaze


;;; $C976: Setup ASM: Spawn Ceres haze ;;;
SetupASM_SpawnCeresHaze:
; Room $DF45, state $DF57. Ceres elevator default
; Room $DF8D. Ceres pre elevator hall
; Room $DFD7. Ceres shaft
; Room $E021. Ceres baby Metroid hall
; Room $E06B. Pre Ceres Ridley hall
    JSL FXType_2C_CeresHaze
    RTS


;;; $C97B: Setup ASM: Set BG1/2 tiles base address and spawn Ceres haze ;;;
SetupASM_SetBG1_2_TilesBaseAddress_SpawnCeresHaze:
; Room $E0B5. Ceres Ridley's room
    PHP
    SEP #$20
    LDA.B #$66 : STA.B DP_BGTilesAddr
    PLP
    JSL FXType_2C_CeresHaze
    LDA.W #$0009 : STA.W CeresMode7HDMATables
    RTS


;;; $C98E: Room headers, scroll data, door lists ;;;
RoomHeader_BowlingAlley:
    db $00,$03,$0A,$0B,$06,$03,$70,$A0,$00
    dw RoomDoors_BowlingAlley
    dw RoomStateCheck_BossIsDead : db $01
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
    db $0E,$01, $0F,$01, $80

RoomPLM_BowlingAlley_3:
    db $04,$00, $05,$02, $0B,$02, $10,$01, $11,$01, $80

if !FEATURE_KEEP_UNREFERENCED
UNUSED_RoomPLM_8FC9FC:
    db $05,$01, $80

UNUSED_RoomPLM_8FC9FF:
    db $04,$01, $80

UNUSED_RoomPLM_8FCA02:
    db $05,$00, $80

UNUSED_RoomPLM_8FCA05:
    db $04,$00, $80
endif ; !FEATURE_KEEP_UNREFERENCED

RoomHeader_WreckedShipEntrance:
    db $01,$03,$0C,$0E,$04,$01,$70,$A0,$00
    dw RoomDoors_WreckedShipEntrance
    dw RoomStateCheck_BossIsDead : db $01
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
    dw RoomStateCheck_BossIsDead : db $01
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
    db $00,$01, $80

UNUSED_RoomPLM_8FCAA8:
    db $03,$01, $80

UNUSED_RoomPLM_8FCAAB:
    db $03,$02, $80
endif ; !FEATURE_KEEP_UNREFERENCED

RoomHeader_AssemblyLine:
    db $03,$03,$13,$0A,$03,$01,$70,$A0,$00
    dw RoomDoors_AssemblyLine
    dw RoomStateCheck_BossIsDead : db $01
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
    dw RoomStateCheck_BossIsDead : db $01
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
    db $21,$01, $80

RoomPLM_WreckedShipMainShaft_1:
    db $29,$01, $80

RoomPLM_WreckedShipMainShaft_2:
    db $21,$00, $80

RoomPLM_WreckedShipMainShaft_3:
    db $29,$00, $80

RoomPLM_WreckedShipMainShaft_4:
    db $28,$02, $2E,$02, $80

RoomHeader_SpikyDeath:
    db $05,$03,$13,$0F,$02,$01,$70,$A0,$00
    dw RoomDoors_SpikyDeath
    dw RoomStateCheck_BossIsDead : db $01
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
    dw RoomStateCheck_BossIsDead : db $01
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
    db $00,$02, $80

RoomHeader_WreckedShipETank:
    db $07,$03,$12,$0D,$03,$02,$90,$A0,$00
    dw RoomDoors_WreckedShipETank
    dw RoomStateCheck_BossIsDead : db $01
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
    dw RoomStateCheck_BossIsDead : db $01
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
    db $03,$01, $04,$01, $80

RoomPLM_Basement_1:
    db $03,$00, $80

if !FEATURE_KEEP_UNREFERENCED
UNUSED_RoomPLM_8FCCC8:
    db $04,$00, $80
endif ; !FEATURE_KEEP_UNREFERENCED

RoomHeader_WreckedShipMap:
    db $09,$03,$0D,$13,$01,$01,$70,$A0,$00
    dw RoomDoors_WreckedShipMap
    dw RoomStateCheck_BossIsDead : db $01
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
    dw RoomStateCheck_BossIsDead : db $01
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
    dw RoomStateCheck_BossIsDead : db $01
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
    dw RoomStateCheck_BossIsDead : db $01
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
    dw RoomStateCheck_BossIsDead : db $01
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
    db $03,$01, $80

RoomHeader_GravitySuit:
    db $0E,$03,$0A,$0D,$01,$01,$70,$A0,$00
    dw RoomDoors_GravitySuit
    dw RoomStateCheck_BossIsDead : db $01
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
    dw RoomStateCheck_BossIsDead : db $01
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
    dw RoomStateCheck_EventHasBeenSet : db $0B
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
    db $00,$02, $80

RoomPLM_GlassTunnel_8:
    db $01,$02, $02,$02, $80

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
    db $00,$01, $01,$00, $04,$00, $80

RoomPLM_EastTunnel_1:
    db $00,$02, $04,$01, $80

RoomPLM_EastTunnel_2:
    db $00,$00, $04,$01, $80

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
    db $07,$01, $0A,$00, $80

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
    db $0A,$02, $80

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
    db $02,$02, $80

RoomPLM_RedFish_1:
    db $01,$01, $80

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
    db $04,$01, $80

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
    db $05,$01, $80

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
    db $04,$02, $06,$01, $80

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
    db $0A,$02, $80

RoomPLM_PseudoPlasmaSpark_7:
    db $0A,$00, $80

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
    db $00,$02, $01,$01, $80

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
    db $00,$02, $01,$02, $80

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
    db $02,$02, $03,$00, $04,$02, $05,$00, $06,$01, $07,$00, $80

RoomPLM_Pants_D:
    db $02,$00, $03,$02, $04,$00, $05,$01, $06,$00, $80

RoomPLM_Pants_15:
    db $05,$02, $07,$01, $80

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
    db $01,$02, $80

RoomPLM_EastPants_6:
    db $01,$02, $02,$01, $80

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
    dw RoomStateCheck_BossIsDead : db $01
    dw RoomState_ThePrecious_1
    dw Use_StatePointer_inX

RoomState_ThePrecious_0:
    dl LevelData_ThePrecious
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
    db $00,$02, $02,$02, $80

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
    dw RoomStateCheck_EventHasBeenSet : db $0D
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
    db $05,$00, $0B,$01, $80

RoomPLM_HalfieClimb_1:
    db $05,$01, $0B,$00, $80

RoomPLM_HalfieClimb_5:
    db $0A,$01, $80

RoomHeader_Botwoon:
    db $32,$04,$18,$08,$02,$01,$70,$A0,$00
    dw RoomDoors_Botwoon
    dw RoomStateCheck_BossIsDead : db $02
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
    dw RoomStateCheck_BossIsDead : db $01
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
    dw RoomStateCheck_EventHasBeenSet : db $10
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
    dw RoomStateCheck_EventHasBeenSet : db $11
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
    dw RoomStateCheck_EventHasBeenSet : db $12
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
    dw RoomStateCheck_EventHasBeenSet : db $13
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
    dw RoomStateCheck_EventHasBeenSet : db $14
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
    dw RoomStateCheck_EventHasBeenSet : db $14
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
    dw RoomStateCheck_EventHasBeenSet : db $14
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
    dw RoomStateCheck_EventHasBeenSet : db $02
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
    dw RoomStateCheck_BossIsDead : db $01
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
    dw RoomStateCheck_BossIsDead : db $01
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
    dw RoomStateCheck_BossIsDead : db $01
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
    dw RoomStateCheck_BossIsDead : db $01
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
    dw RoomStateCheck_BossIsDead : db $01
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
    dw RoomStateCheck_BossIsDead : db $01
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


;;; $E0FD: Library background ;;;
LibBG_Phantoon_State0:
; Room $CD13, state $CD25: Phantoon
    dw $0002 : dl $7E2000 : dw $4800,$1000
    dw $0000

LibBG_Draygon_State0:
; Room $DA60, state $DA72: Draygon
    dw $0002 : dl $7E2000 : dw $4800,$1000
    dw $0000

LibBG_Phantoon_Draygon_State1:
; Room $CD13, state $CD3F: Phantoon
; Room $DA60, state $DA8C: Draygon
    dw $000A
    dw $0000

LibBG_WreckedShip_4_5_EntranceHall:
; Room $CA08, state $CA1A: Wrecked Ship entrance treadmill
; Room $CA08, state $CA34: Wrecked Ship entrance treadmill
; Room $E82C, state $E839: Debug room
    dw $0004 : dl Background_WreckedShip_4_5_EntranceHall_0 : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_LibBG_WreckedShip_4_5_EntranceHall_1_8FE132:
    dw $0004 : dl Background_WreckedShip_4_5_EntranceHall_1 : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED

LibBG_WreckedShip_4_5_Columns_Tubes:
; Room $CB8B, state $CB9D: Wrecked Ship flooded spikey hall
; Room $CB8B, state $CBB7: Wrecked Ship flooded spikey hall
; Room $CC6F, state $CC81: Pre Phantoon hall
; Room $CC6F, state $CC9B: Pre Phantoon hall
    dw $0004 : dl Background_WreckedShip_4_5_Columns_Tubes : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_WreckedShip_4_5_ExperimentRoom:
; Room $CA52, state $CA64: Wrecked Ship attic
; Room $CA52, state $CA7E: Wrecked Ship attic
    dw $0004 : dl Background_WreckedShip_4_5_ExperimentRoom : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_WreckedShip_4_5_Panels_Vents:
; Room $CD5C, state $CD6E: Wrecked Ship first flooded room
; Room $CD5C, state $CD88: Wrecked Ship first flooded room
; Room $CDA8, state $CDBA: Wrecked Ship obvious super missile room
; Room $CDA8, state $CDD4: Wrecked Ship obvious super missile room
; Room $CDF1, state $CE1D: Wrecked Ship hidden super missile hall
; Room $CE40, state $CE52: Gravity suit room
; Room $CE40, state $CE6C: Gravity suit room
    dw $0004 : dl Background_WreckedShip_4_5_Panels_Vents : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_WreckedShip_4_5_Panels_Vents_Horizontal:
; Room $CAF6, state $CB08: Wrecked Ship mainstreet
; Room $CAF6, state $CB22: Wrecked Ship mainstreet
; Room $CBD5, state $CBE7: Wrecked Ship east exit
; Room $CBD5, state $CC01: Wrecked Ship east exit
; Room $CDF1, state $CE03: Wrecked Ship hidden super missile hall
    dw $0004 : dl Background_WreckedShip_4_5_Panels_Vents_Horizontal : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_WreckedShip_4_5_Panels_Vents_Vertical:
; Room $CAAE, state $CAC0: Wrecked Ship attic missile tank room
; Room $CAAE, state $CADA: Wrecked Ship attic missile tank room
    dw $0004 : dl Background_WreckedShip_4_5_Panels_Vents_Vertical : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_CeresElevator_State0_1:
; Room $DF45, state $DF57: Ceres elevator shaft
; Room $DF45, state $DF71: Ceres elevator shaft
    dw $000A
    dw $0000


;;; $E1D8: Door ASM: start Wrecked Ship treadmill east entrance ;;;
DoorASM_StartWreckedShipTreadmillEastEntrance:
; Room $CAF6, door list index 0: Door
    LDY.W #AnimatedTilesObjects_FX_wreckedShipTreadmillLeftwards
    JSL Spawn_AnimatedTilesObject
    JSL Spawn_Hardcoded_PLM
    db $04,$09
    dw PLMEntries_wreckedShipEntranceTreadmillFromEast
    RTS


;;; $E1E8: Door ASM: scroll 1 = blue ;;;
DoorASM_Scroll_1_Blue:
; Room $CB8B, door list index 0: Door
    PHP
    SEP #$20
    LDA.B #$01 : STA.L Scrolls+1
    PLP
    RTS


;;; $E1F3: Door ASM: scroll 0 = green ;;;
DoorASM_Scroll_0_Green_duplicate_again:
; Room $CC27, door list index 0: Door
    PHP
    SEP #$20
    LDA.B #$02 : STA.L Scrolls
    PLP
    RTS


;;; $E1FE: Door ASM: scroll 3 = red, 4 = blue ;;;
DoorASM_Scroll_3_Red_4_Blue:
; Room $CD13, door list index 0: Door
    PHP
    SEP #$20
    LDA.B #$00 : STA.L Scrolls+3
    LDA.B #$01 : STA.L Scrolls+4
    PLP
    RTS


;;; $E20F: Door ASM: scroll 29h = blue ;;;
DoorASM_Scroll_29_Blue:
; Room $CDF1, door list index 0: Door
    PHP
    SEP #$20
    LDA.B #$01 : STA.L Scrolls+$29
    PLP
    RTS


;;; $E21A: Door ASM: scroll 28h,2E = green ;;;
DoorASM_Scroll_28_2E_Green:
; Room $CC6F, door list index 0: Door
    PHP
    SEP #$20
    LDA.B #$02 : STA.L Scrolls+$28 : STA.L Scrolls+$2E
    PLP
    RTS


;;; $E229: Door ASM: scroll 6..Bh = red ;;;
DoorASM_Scroll_6_7_8_9_A_B_Red:
; Room $CE40, door list index 1: Door
    PHP
    SEP #$20
    LDA.B #$00
    STA.L Scrolls+6 : STA.L Scrolls+7
    STA.L Scrolls+8 : STA.L Scrolls+9
    STA.L Scrolls+$A : STA.L Scrolls+$B
    PLP
    RTS


;;; $E248: Library background ;;;
LibBG_Maridia_B_BrownWall:
; Room $D08A, state $D097: Maridia green gate hall
    dw $0004 : dl Background_Maridia_B_BrownWall : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$1000
    dw $0000

LibBG_Maridia_C_GreenWall:
; Room $D461, state $D46E: Sand falls west
; Room $D4C2, state $D4CF: Sand falls east
    dw $0004 : dl Background_Maridia_C_GreenWall : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$1000
    dw $0000


;;; $E26C: Door ASM: set up elevatube from south ;;;
DoorASM_SetupElevatubeFromSouth:
; Room $D48E, door list index 2: Door
    LDA.W #$FF00 : STA.W RoomMainASMVar3
    STZ.W RoomMainASMVar2
    LDA.W #$09C0 : STA.W RoomMainASMVar2
    LDA.W #$FFE0 : STA.W RoomMainASMVar4
    LDA.W #$0000
    JSL Run_Samus_Command
    JSL Spawn_Hardcoded_PLM
    db $01,$00
    dw PLMEntries_maridiaElevatube
    RTS


;;; $E291: Door ASM: set up elevatube from north ;;;
DoorASM_SetupElevatubeFromNorth:
; Room $D340, door list index 1: Door
    LDA.W #$0100 : STA.W RoomMainASMVar3
    STZ.W RoomMainASMVar2
    LDA.W #$0040 : STA.W RoomMainASMVar2
    LDA.W #$0020 : STA.W RoomMainASMVar4
    LDA.W #$0000
    JSL Run_Samus_Command
    JSL Spawn_Hardcoded_PLM
    db $01,$00
    dw PLMEntries_maridiaElevatube
    RTS


;;; $E2B6: Main ASM: elevatube ;;;
MainASM_Elevatube:
; Room $D408. Maridia elevatube
    LDA.W #$0080 : STA.W SamusXPosition
    STZ.W SamusXSubPosition
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W RoomMainASMVar3 : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    LDA.W RoomMainASMVar1 : CLC : ADC.B DP_Temp12 : STA.W RoomMainASMVar1
    LDA.W RoomMainASMVar2 : ADC.B DP_Temp14 : STA.W RoomMainASMVar2
    LDA.B DP_Temp12
    LDX.B DP_Temp14 : STX.B DP_Temp12
    STA.B DP_Temp14
    JSL MoveSamusDown_NoSolidEnemyCollision
    LDA.W RoomMainASMVar3 : CLC : ADC.W RoomMainASMVar4
    CLC : ADC.W #$0E20 : CMP.W #$1C41 : BCS .return
    SEC : SBC.W #$0E20 : STA.W RoomMainASMVar3

  .return:
    RTS


;;; $E301: Door ASM: reset elevatube on north exit ;;;
DoorASM_ResetElevatubeOnNorthExit:
; Room $D408, door list index 1: Door
    LDA.W #$0001
    JSL Run_Samus_Command
    RTS


;;; $E309: Door ASM: reset elevatube on south exit ;;;
DoorASM_ResetElevatubeOnSouthExit:
; Room $D408, door list index 0: Door
    LDA.W #$0202 : STA.L Scrolls
    LDA.W #$0001
    JSL Run_Samus_Command
    RTS


;;; $E318: Door ASM: scroll Ah = red, Bh = blue ;;;
DoorASM_Scroll_A_Red_B_Blue:
; Room $D845, door list index 0: Door
    PHP
    SEP #$20
    LDA.B #$00 : STA.L Scrolls+$A
    LDA.B #$01 : STA.L Scrolls+$B
    PLP
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $E329: Unused. Door ASM: scroll 10h = blue, 11h = red ;;;
UNUSED_DoorASM_Scroll_4_Green_8FE329:
    PHP
    SEP #$20
    LDA.B #$00 : STA.L Scrolls+$11
    LDA.B #$01 : STA.L Scrolls+$10
    PLP
    RTS


;;; $E33A: Unused. Door ASM: scroll 4 = green ;;;
UNUSED_DoorASM_Scroll_4_Green_8FE33A:
    PHP
    SEP #$20
    LDA.B #$02 : STA.L Scrolls+4
    PLP
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E345: Door ASM: scroll 0 = red, 4 = blue ;;;
DoorASM_Scroll_0_Red_4_Blue_duplicate:
; Room $CEFB, door list index 2: Door
    PHP
    SEP #$20
    LDA.B #$00 : STA.L Scrolls
    LDA.B #$01 : STA.L Scrolls+4
    PLP
    RTS


;;; $E356: Door ASM: scroll 0 = red, 1 = blue ;;;
DoorASM_Scroll_0_Red_1_Blue:
; Room $CF80, door list index 2: Door
; Room $D3B6, door list index 0: Door
    PHP
    SEP #$20
    LDA.B #$00 : STA.L Scrolls
    LDA.B #$01 : STA.L Scrolls+1
    PLP
    RTS


;;; $E367: Door ASM: scroll 9 = red, Ah = blue ;;;
DoorASM_Scroll_9_Red_A_Blue:
; Room $D104, door list index 1: Door
    PHP
    SEP #$20
    LDA.B #$00 : STA.L Scrolls+9
    LDA.B #$01 : STA.L Scrolls+$A
    PLP
    RTS


;;; $E378: Door ASM: scroll 0,2 = red, 1 = blue ;;;
DoorASM_Scroll_0_2_Red_1_Blue:
; Room $CF54, door list index 0: Door
; Room $CF80, door list index 0: Door
    PHP
    SEP #$20
    LDA.B #$00 : STA.L Scrolls : STA.L Scrolls+2
    LDA.B #$01 : STA.L Scrolls+1
    PLP
    RTS


;;; $E38D: Door ASM: scroll 1 = blue ;;;
DoorASM_Scroll_1_Blue_duplicate:
; Room $D7E4, door list index 0: Door
    PHP
    SEP #$20
    LDA.B #$01 : STA.L Scrolls+1
    PLP
    RTS


;;; $E398: Door ASM: scroll 6 = blue ;;;
DoorASM_Scroll_6_Blue:
; Room $D5A7, door list index 0: Door
    PHP
    SEP #$20
    LDA.B #$01 : STA.L Scrolls+6
    PLP
    RTS


;;; $E3A3: Door ASM: scroll 4 = red ;;;
DoorASM_Scroll_4_Red_duplicate:
; Room $D4C2, door list index 1: Door
; Room $D69A, door list index 0: Door
    PHP
    SEP #$20
    LDA.B #$00 : STA.L Scrolls+4
    PLP
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $E3AE: Unused. Door ASM: scroll 1 = red ;;;
UNUSED_DoorASM_Scroll_1_Red_8FE3AE:
    PHP
    SEP #$20
    LDA.B #$00 : STA.L Scrolls+1
    PLP
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E3B9: Door ASM: scroll 4,7 = red ;;;
DoorASM_Scroll_4_7_Red:
; Room $D646, door list index 3: Door
    PHP
    SEP #$20
    LDA.B #$00 : STA.L Scrolls+4 : STA.L Scrolls+7
    PLP
    RTS


;;; $E3C8: Door ASM: scroll 1 = blue, 2 = red ;;;
DoorASM_Scroll_1_Blue_2_Red_duplicate:
; Room $D8C5, door list index 0: Door
    PHP
    SEP #$20
    LDA.B #$00 : STA.L Scrolls+2
    LDA.B #$01 : STA.L Scrolls+1
    PLP
    RTS


;;; $E3D9: Door ASM: scroll 0,2 = green ;;;
DoorASM_Scroll_0_2_Green_duplicate:
; Room $DA60, door list index 0: Door
    PHP
    SEP #$20
    LDA.B #$02 : STA.L Scrolls : STA.L Scrolls+2
    PLP
    RTS


;;; $E3E8: Library background ;;;
LibBG_Tourian_D_MechanicalRoom:
; Room $DAAE, state $DABB: Tourian -> Crateria elevator
; Room $DB31, state $DB43: Metroid room 2
; Room $DB31, state $DB5D: Metroid room 2
; Room $DBCD, state $DBDF: Metroid room 4
; Room $DBCD, state $DBF9: Metroid room 4
    dw $0004 : dl Background_Tourian_D_MechanicalRoom : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Tourian_D_MechanicalRoom_Letterbox:
; Room $DAE1, state $DAF3: Metroid room 1
; Room $DAE1, state $DB0D: Metroid room 1
; Room $DB7D, state $DB8F: Metroid room 3
; Room $DB7D, state $DBA9: Metroid room 3
    dw $0004 : dl Background_Tourian_D_MechanicalRoom_Letterbox : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Tourian_D_VerticalStructures:
; Room $DC19, state $DC2B: Tourian super-sidehopper room
; Room $DC19, state $DC45: Tourian super-sidehopper room
; Room $DC65, state $DC77: Drained Torizo room
; Room $DC65, state $DC91: Drained Torizo room
; Room $DCB1, state $DCC3: Shitroid room
; Room $DCB1, state $DCDD: Shitroid room
; Room $DCFF, state $DD0C: Post Shitroid room
; Room $DDC4, state $DDD1: Tourian eye-door room
    dw $0004 : dl Background_Tourian_D_VerticalStructures : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Tourian_D_PipeRoom_Letterbox:
; Room $DE4D, state $DE5A: Escape room 1
    dw $0004 : dl Background_Tourian_D_PipeRoom_Letterbox : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Tourian_D_PipeRoom_VerticalSeparation:
; Room $DDF3, state $DE00: Pre Mother Brain shaft
; Room $DE7A, state $DE87: Escape room 2
    dw $0004 : dl Background_Tourian_D_PipeRoom_VerticalSeparation : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Tourian_D_PipeRoom:
; Room $DEA7, state $DEB4: Escape room 3
; Room $DEDE, state $DEEB: Escape room 4
    dw $0004 : dl Background_Tourian_D_PipeRoom : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Tourian_E_PipeRoom_Dark:
; Room $DD58, state $DD6E: Mother Brain
; Room $DD58, state $DD88: Mother Brain
; Room $DD58, state $DDA2: Mother Brain
    dw $0004 : dl Background_Tourian_E_PipeRoom_Dark : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Tourian_D_E_StatueHall:
; Room $DF8D, state $DF9F: Ceres pre elevator hall
; Room $DF8D, state $DFB9: Ceres pre elevator hall
; Room $DFD7, state $DFE9: Ceres stairs
; Room $DFD7, state $E003: Ceres stairs
; Room $E06B, state $E07D: Pre Ceres Ridley hall
; Room $E06B, state $E097: Pre Ceres Ridley hall
    dw $0004 : dl Background_Tourian_D_E_StatueHall : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000


;;; $E4C0: Door ASM: scroll 0..1 = green ;;;
DoorASM_Scroll_0_1_Green_duplicate:
; Room $DAAE, door list index 1: Door
    PHP
    SEP #$20
    LDA.B #$02 : STA.L Scrolls : STA.L Scrolls+1
    PLP
    RTS


;;; $E4CF: Door ASM: scroll 8 = blue, 9 = red ;;;
DoorASM_Scroll_8_Blue_9_Red:
; Room $DEDE, door list index 1: Door
    PHP
    SEP #$20
    LDA.B #$01 : STA.L Scrolls+$18
    LDA.B #$00 : STA.L Scrolls+$19
    PLP
    RTS


;;; $E4E0: Door ASM: to Ceres elevator shaft ;;;
DoorASM_ToCeresElevatorShaft:
; Room $DF8D, door list index 0: Door
    SEP #$20
    LDA.B #$07 : STA.B DP_FakeBGModeSize : STA.W $2105
    REP #$20
    LDA.W #$0100 : STA.B DP_Mode7TransMatrixA : STA.B DP_Mode7TransMatrixD
    STZ.B DP_Mode7TransMatrixB : STZ.B DP_Mode7TransMatrixC
    LDA.W #$0080 : STA.B DP_Mode7TransOriginX
    LDA.W #$03F0 : STA.B DP_Mode7TransOriginY
    LDA.W #$0001 : STA.W Mode7Flag
    LDA.W #$0022 : STA.W RoomMainASMVar1
    LDA.W #$003C : STA.W RoomMainASMVar2
    RTS


;;; $E513: Door ASM: from Ceres elevator shaft ;;;
DoorASM_FromCeresElevatorShaft:
; Room $DF45, door list index 0: Door
    SEP #$20
    LDA.B #$09 : STA.B DP_FakeBGModeSize
    REP #$20
    STZ.W Mode7Flag
    RTS


;;; $E51F: Main ASM: Ceres elevator shaft ;;;
MainASM_CeresElevatorShaft:
; Handles landing on elevator and setting mode 7 rotation matrix
; Room $DF45. Ceres elevator shaft
    JSL RoomMainASM_CeresElevatorShaft
    RTS


;;; $E524: Main ASM: RTS ;;;
RTS_8FE524:
; Room $DFD7. Ceres shaft
; Room $E021. Ceres baby Metroid hall
; Room $E06B. Pre Ceres Ridley hall
    RTS


;;; $E525: Main ASM: spawn Ceres pre elevator hall falling debris ;;;
MainASM_SpawnCeresPreElevatorHallFallingDebris:
; Room $DF8D. Ceres pre elevator hall
    LDA.W CeresStatus : BEQ RTS_8FE524
    DEC.W RoomMainASMVar1 : BPL RTS_8FE524
    LDA.W #$0008 : STA.W RoomMainASMVar1
    LDY.W #EnemyProjectile_CeresFallingTile_Light
    LDA.W RandomNumberSeed : ASL : BCC +
    LDY.W #EnemyProjectile_CeresFallingTile_Dark

+   LDA.W RandomNumberSeed : AND.W #$000F : ASL : TAX
    LDA.W .debrisXpos,X
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    RTS

  .debrisXpos:
    dw $0050,$0060,$0070,$0080,$0090,$00A0,$00B0,$00C0
    dw $00D0,$00E0,$00F0,$0110,$0130,$0150,$0170,$0190


;;; $E571: Main ASM: handle Ceres Ridley getaway cutscene ;;;
MainASM_HandleCeresRidleyGetawayCutscene:
; Room $E0B5. Ceres Ridley's room
    LDA.W CeresStatus : LSR : BCC .return
    JSL HandleCeresRidleyGetawayCutscene

  .return:
    RTS


;;; $E57C: Main ASM: shake screen switching between light horizontal and medium diagonal ;;;
MainASM_ShakeScreenSwitchingBetweenLightHorizAndMediumDiag:
; Room $DE7A. Escape room 2
; Horizontal screen shaking with a 1/80h chance of becoming medium diagonal for 2Ah frames
    LDA.W RoomMainASMVar1 : BEQ .resetQuakeTimer
    DEC.W RoomMainASMVar1 : BNE MainASM_GenerateRandomExplosionOnEveryFourthFrame
    LDA.W #$0012
    BRA +

  .resetQuakeTimer:
    JSL GenerateRandomNumber
    CMP.W #$0200 : BCS MainASM_GenerateRandomExplosionOnEveryFourthFrame
    LDA.W #$002A : STA.W RoomMainASMVar1
    LDA.W #$0017

+   STA.W EarthquakeType
; fallthrough to MainASM_GenerateRandomExplosionOnEveryFourthFrame


;;; $E5A0: Main ASM: generate random explosion on every fourth frame ;;;
MainASM_GenerateRandomExplosionOnEveryFourthFrame:
; Room $DE4D. Escape room 1
; Room $DEA7. Escape room 3
    JSR GenerateRandomExplosionOnEveryFourthFrame
    RTS


;;; $E5A4: Main ASM: shake screen switching between medium horizontal and strong diagonal ;;;
MainASM_ShakeScreenSwitchingBetweenMediumHorizAndStrongDiag:
; Room $DEDE. Escape room 4
; Horizontal screen shaking with a 3/200h chance of becoming strong diagonal for 2Ah frames
    LDA.W RoomMainASMVar1 : BEQ .resetQuakeTimer
    DEC.W RoomMainASMVar1 : BNE .noEarthquakeChange
    LDA.W #$0015
    BRA +

  .resetQuakeTimer:
    JSL GenerateRandomNumber
    CMP.W #$0180 : BCS .noEarthquakeChange
    LDA.W #$002A : STA.W RoomMainASMVar1
    LDA.W #$001A

+   STA.W RoomMainASMVar2

  .noEarthquakeChange:
    LDA.W RoomMainASMVar2 : STA.W EarthquakeType
    JSR GenerateRandomExplosionOnEveryFourthFrame
    RTS


;;; $E5D2: Room state checking handler ;;;
Room_State_Checking_Handler:
;; Parameters:
;;     X: Room pointer

; A matching state condition will return out of *this* routine by popping the return address pushed to the stack by $E5E0
    TXA : CLC : ADC.W #$000B : TAX

  .loop:
    LDA.W $0000,X : STA.W EventPointer
    INX #2
    PEA .loop-1
    JMP.W (EventPointer)


;;; $E5E6: Use state pointer [X] ;;;
Use_StatePointer_inX:
; Room state check: default
    STX.W RoomStatePointer
    PLA
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $E5EB: Unused. Room state check: door ;;;
UNUSED_RoomStateCheck_Door_8FE5EB:
    LDA.W $0000,X : CMP.W DoorPointer : BNE +
    LDA.W $0002,X : TAX
    JMP Use_StatePointer_inX

+   INX #4
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E5FF: Room state check: main area boss is dead ;;;
RoomStateCheck_MainAreaBossIsDead:
    LDA.W #$0001
    JSL CheckIfBossBitsForCurrentAreaMatchAnyBitsInA
    BCC +
    LDA.W $0000,X : TAX
    JMP Use_StatePointer_inX

+   INX #2
    RTS


;;; $E612: Room state check: event has been set ;;;
RoomStateCheck_EventHasBeenSet:
    LDA.W $0000,X : AND.W #$00FF
    JSL CheckIfEvent_inA_HasHappened
    BCC +
    LDA.W $0001,X : TAX
    JMP Use_StatePointer_inX

+   INX #3
    RTS


;;; $E629: Room state check: boss is dead ;;;
RoomStateCheck_BossIsDead:
    LDA.W $0000,X : AND.W #$00FF
    JSL CheckIfBossBitsForCurrentAreaMatchAnyBitsInA
    BCC +
    LDA.W $0001,X : TAX
    JMP Use_StatePointer_inX

+   INX #3
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $E640: Unused. Room state check: morphball ;;;
UNUSED_RoomStateCheck_Morphball_8FE640:
    LDA.W CollectedItems : AND.W #$0004 : BEQ +
    LDA.W $0000,X : TAX
    JMP Use_StatePointer_inX

+   INX #2
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E652: Room state check: morphball and missiles ;;;
RoomStateCheck_MorphballAndMissiles:
    LDA.W CollectedItems : BIT.W #$0004 : BEQ +
    LDA.W MaxMissiles : BEQ +
    LDA.W $0000,X : TAX
    JMP Use_StatePointer_inX

+   INX #2
    RTS


;;; $E669: Room state check: power bombs ;;;
RoomStateCheck_PowerBombs:
    LDA.W MaxPowerBombs : BEQ +
    LDA.W $0000,X : TAX
    JMP Use_StatePointer_inX

+   INX #2
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $E678: Unused. Room state check: speed booster ;;;
UNUSED_RoomStateCheck_SpeedBooster_8FE678:
    LDA.W CollectedItems : AND.W #$2000 : BEQ +
    LDA.W $0000,X : TAX
    JMP Use_StatePointer_inX

+   INX #2
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E68A: Door closing PLMs ;;;
Door_Closing_PLMs:
; Spawned by Spawn_Door_Closing_PLM during door transition
    dw $0000                                                             ; 0: Non-closing door facing right
    dw $0000                                                             ; 1: Non-closing door facing left
    dw $0000                                                             ; 2: Non-closing door facing down
    dw $0000                                                             ; 3: Non-closing door facing up
    dw PLMEntries_blueDoorClosingFacingRight                             ; 4: Blue door closing facing right
    dw PLMEntries_blueDoorClosingFacingLeft                              ; 5: Blue door closing facing left
    dw PLMEntries_blueDoorClosingFacingDown                              ; 6: Blue door closing facing down
    dw PLMEntries_blueDoorClosingFacingUp                                ; 7: Blue door closing facing up
    dw PLMEntries_gateThatClosesInEscapeRoom1_PLM                        ; 8: Gate that closes during escape in room after Mother Brain
    dw PLMEntries_gateThatClosesInEscapeRoom1_PLM                        ; 9: Gate that closes during escape in room after Mother Brain
    dw PLMEntries_gateThatClosesInEscapeRoom1_PLM                        ; Ah: Gate that closes during escape in room after Mother Brain
    dw PLMEntries_gateThatClosesInEscapeRoom1_PLM                        ; Bh: Gate that closes during escape in room after Mother Brain

Tileset_Table_0_UpperCrateria:
; 0: Upper Crateria
    dl TileTables_0_1_UpperCrateria                                      ; Tile table pointer
    dl Tiles_0_1_UpperCrateria                                           ; Tiles pointer
    dl Palettes_0_UpperCrateria                                          ; Palette pointer

Tileset_Table_1_RedCrateria:
; 1: Red Crateria
    dl TileTables_0_1_UpperCrateria                                      ; Tile table pointer
    dl Tiles_0_1_UpperCrateria                                           ; Tiles pointer
    dl Palettes_1_RedCrateria                                            ; Palette pointer

Tileset_Table_2_LowerCrateria:
; 2: Lower Crateria
    dl TileTables_2_3_LowerCrateria                                      ; Tile table pointer
    dl Tiles_2_3_LowerCrateria                                           ; Tiles pointer
    dl Palettes_2_LowerCrateria                                          ; Palette pointer

Tileset_Table_3_OldTourian:
; 3: Old Tourian
    dl TileTables_2_3_LowerCrateria                                      ; Tile table pointer
    dl Tiles_2_3_LowerCrateria                                           ; Tiles pointer
    dl Palettes_3_OldTourian                                             ; Palette pointer

Tileset_Table_4_WreckedShip_PowerOn:
; 4: Wrecked Ship - power on
    dl TileTables_4_5_WreckedShip                                        ; Tile table pointer
    dl Tiles_4_5_WreckedShip                                             ; Tiles pointer
    dl Palettes_4_WreckedShip_PowerOn                                    ; Palette pointer

Tileset_Table_5_WreckedShip_PowerOff:
; 5: Wrecked Ship - power off
    dl TileTables_4_5_WreckedShip                                        ; Tile table pointer
    dl Tiles_4_5_WreckedShip                                             ; Tiles pointer
    dl Palettes_5_WreckedShip_PowerOff                                   ; Palette pointer

Tileset_Table_6_GreenBlueBrinstar:
; 6: Green/blue Brinstar
    dl TileTables_6_GreenBlueBrinstar                                    ; Tile table pointer
    dl Tiles_6_GreenBlueBrinstar                                         ; Tiles pointer
    dl Palettes_6_GreenBlueBrinstar                                      ; Palette pointer

Tileset_Table_7_RedBrinstar_Kraid:
; 7: Red Brinstar / Kraid's lair
    dl TileTables_7_8_RedBrinstar_Kraid_StatuesHall                      ; Tile table pointer
    dl Tiles_7_8_RedBrinstar_Kraid_StatuesHall                           ; Tiles pointer
    dl Palettes_7_RedBrinstar_Kraid                                      ; Palette pointer

Tileset_Table_8_StatuesHall:
; 8: Pre Tourian entrance corridor
    dl TileTables_7_8_RedBrinstar_Kraid_StatuesHall                      ; Tile table pointer
    dl Tiles_7_8_RedBrinstar_Kraid_StatuesHall                           ; Tiles pointer
    dl Palettes_8_StatuesHall                                            ; Palette pointer

Tileset_Table_9_HeatedNorfair:
; 9: Heated Norfair
    dl TileTables_9_A_Norfair                                            ; Tile table pointer
    dl Tiles_9_A_Norfair                                                 ; Tiles pointer
    dl Palettes_9_HeatedNorfair                                          ; Palette pointer

Tileset_Table_A_UnheatedNofair:
; Ah: Unheated Norfair
    dl TileTables_9_A_Norfair                                            ; Tile table pointer
    dl Tiles_9_A_Norfair                                                 ; Tiles pointer
    dl Palettes_A_UnheatedNorfair                                        ; Palette pointer

Tileset_Table_B_SandlessMaridia:
; Bh: Sandless Maridia
    dl TileTables_B_SandlessMaridia                                      ; Tile table pointer
    dl Tiles_B_SandlessMaridia                                           ; Tiles pointer
    dl Palettes_B_SandlessMaridia                                        ; Palette pointer

Tileset_Table_C_SandyMaridia:
; Ch: Sandy Maridia
    dl TileTables_C_SandyMaridia                                         ; Tile table pointer
    dl Tiles_C_SandyMaridia                                              ; Tiles pointer
    dl Palettes_C_SandyMaridia                                           ; Palette pointer

Tileset_Table_D_Tourian:
; Dh: Tourian
    dl TileTables_D_E_Tourian                                            ; Tile table pointer
    dl Tiles_D_E_Tourian                                                 ; Tiles pointer
    dl Palettes_D_Tourian                                                ; Palette pointer

Tileset_Table_E_MotherBrain:
; Eh: Mother Brain's room
    dl TileTables_D_E_Tourian                                            ; Tile table pointer
    dl Tiles_D_E_Tourian                                                 ; Tiles pointer
    dl Palettes_E_MotherBrain                                            ; Palette pointer

Tileset_Table_F_BlueCeres:
; Fh: Blue Ceres
    dl TileTables_F_10_11_12_13_14_Ceres                                 ; Tile table pointer
    dl Tiles_F_10_Ceres                                                  ; Tiles pointer
    dl Palettes_F_11_13_BlueCeres                                        ; Palette pointer

Tileset_Table_10_WhiteCeres:
; 10h: White Ceres
    dl TileTables_F_10_11_12_13_14_Ceres                                 ; Tile table pointer
    dl Tiles_F_10_Ceres                                                  ; Tiles pointer
    dl Palettes_10_12_14_WhiteCeres                                      ; Palette pointer

Tileset_Table_11_BlueCeresElevator:
; 11h: Blue Ceres elevator
    dl TileTables_F_10_11_12_13_14_Ceres                                 ; Tile table pointer
    dl Tiles_11_12_CeresElevator                                         ; Tiles pointer
    dl Palettes_F_11_13_BlueCeres                                        ; Palette pointer

Tileset_Table_12_WhiteCeresElevator:
; 12h: White Ceres elevator
    dl TileTables_F_10_11_12_13_14_Ceres                                 ; Tile table pointer
    dl Tiles_11_12_CeresElevator                                         ; Tiles pointer
    dl Palettes_10_12_14_WhiteCeres                                      ; Palette pointer

Tileset_Table_13_BlueCeresRidley:
; 13h: Blue Ceres Ridley's room
    dl TileTables_F_10_11_12_13_14_Ceres                                 ; Tile table pointer
    dl Tiles_13_14_CeresRidley                                           ; Tiles pointer
    dl Palettes_F_11_13_BlueCeres                                        ; Palette pointer

Tileset_Table_14_WhiteCeresRidley:
; 14h: White Ceres Ridley's room
    dl TileTables_F_10_11_12_13_14_Ceres                                 ; Tile table pointer
    dl Tiles_13_14_CeresRidley                                           ; Tiles pointer
    dl Palettes_10_12_14_WhiteCeres                                      ; Palette pointer

Tileset_Table_15_Map_Statues:
; 15h: Map room / Tourian entrance
    dl TileTables_15_16_17_18_19_UtilityRoom_Statues                     ; Tile table pointer
    dl Tiles_15_16_17_18_19_UtilityRoom_Statues                          ; Tiles pointer
    dl Palettes_Map_Statues                                              ; Palette pointer

Tileset_Table_16_WreckedShipMap_PowerOff:
; 16h: Wrecked Ship map room - power off
    dl TileTables_15_16_17_18_19_UtilityRoom_Statues                     ; Tile table pointer
    dl Tiles_15_16_17_18_19_UtilityRoom_Statues                          ; Tiles pointer
    dl Palettes_16_WreckedShipMap_PowerOff                               ; Palette pointer

Tileset_Table_17_BlueRefill:
; 17h: Blue refill room
    dl TileTables_15_16_17_18_19_UtilityRoom_Statues                     ; Tile table pointer
    dl Tiles_15_16_17_18_19_UtilityRoom_Statues                          ; Tiles pointer
    dl Palettes_17_BlueRefill                                            ; Palette pointer

Tileset_Table_18_YellowRefill:
; 18h: Yellow refill room
    dl TileTables_15_16_17_18_19_UtilityRoom_Statues                     ; Tile table pointer
    dl Tiles_15_16_17_18_19_UtilityRoom_Statues                          ; Tiles pointer
    dl Palettes_18_YellowRefill                                          ; Palette pointer

Tileset_Table_19_SaveStation:
; 19h: Save room
    dl TileTables_15_16_17_18_19_UtilityRoom_Statues                     ; Tile table pointer
    dl Tiles_15_16_17_18_19_UtilityRoom_Statues                          ; Tiles pointer
    dl Palettes_19_SaveStation                                           ; Palette pointer

Tileset_Table_1A_Kraid:
; 1Ah: Kraid's room
    dl TileTables_1A_Kraid                                               ; Tile table pointer
    dl Tiles_1A_Kraid                                                    ; Tiles pointer
    dl Palettes_1A_Kraid                                                 ; Palette pointer

Tileset_Table_1B_Crocomire:
; 1Bh: Crocomire's room
    dl TileTables_1B_Crocomire                                           ; Tile table pointer
    dl Tiles_1B_Crocomire                                                ; Tiles pointer
    dl Palettes_1B_Crocomire                                             ; Palette pointer

Tileset_Table_1C_Draygon:
; 1Ch: Draygon's room
    dl TileTables_1C_Draygon                                             ; Tile table pointer
    dl Tiles_1C_Draygon                                                  ; Tiles pointer
    dl Palettes_1C_Draygon                                               ; Palette pointer


;;; $E7A7: Tileset pointers ;;;
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


;;; $E7E1: Music pointers ;;;
Music_Pointers:
    dl SPC_Engine                                                        ; 0   - SPC engine
    dl Music_TitleSequence                                               ; 3   - Title sequence
    dl Music_EmptyCrateria                                               ; 6   - Empty Crateria
    dl Music_LowerCrateria                                               ; 9   - Lower Crateria
    dl Music_UpperCrateria                                               ; Ch  - Upper Crateria
    dl Music_GreenBrinstar                                               ; Fh  - Green Brinstar
    dl Music_RedBrinstar                                                 ; 12h - Red Brinstar
    dl Music_UpperNofair                                                 ; 15h - Upper Norfair
    dl Music_LowerNorfair                                                ; 18h - Lower Norfair
    dl Music_Maridia                                                     ; 1Bh - Maridia
    dl Music_Tourian                                                     ; 1Eh - Tourian
    dl Music_MotherBrain                                                 ; 21h - Mother Brain
    dl Music_BossFight1                                                  ; 24h - Boss fight 1
    dl Music_BossFight2                                                  ; 27h - Boss fight 2
    dl Music_MiniBossFight                                               ; 2Ah - Miniboss fight
    dl Music_Ceres                                                       ; 2Dh - Ceres
    dl Music_WreckedShip                                                 ; 30h - Wrecked Ship
    dl Music_ZebesExplosion                                              ; 33h - Zebes boom
    dl Music_Intro                                                       ; 36h - Intro
    dl Music_Death                                                       ; 39h - Death
    dl Music_Credits                                                     ; 3Ch - Credits
    dl Music_TheLastMetroidIsInCaptivity                                 ; 3Fh - "The last Metroid is in captivity"
    dl Music_TheGalaxyIsAtPeace                                          ; 42h - "The galaxy is at peace"
    dl Music_BabyMetroid_BossFight2                                      ; 45h - Shitroid (same as boss fight 2)
    dl Music_SamusTheme_UpperCrateria                                    ; 48h - Samus theme (same as upper Crateria)


;;; $E82C: Debug room ;;;
RoomHeader_Debug:
; Room $E82C: Header
    db $00,$07,$00,$00,$06,$02,$70,$A0,$00
    dw RoomDoors_Debug
    dw Use_StatePointer_inX

RoomState_Debug:
; Room $E82C, state $E839: Header
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
; Room $E82C: Door list
    dw UNUSED_Door_Debug_0_83ABC4
    dw UNUSED_Door_Debug_1_83ABCF
    dw UNUSED_Door_Debug_2_83ABDA
    dw UNUSED_Door_Debug_3_83ABE5

if !FEATURE_KEEP_UNREFERENCED
UNUSED_LibraryBackground_8FE85B:
; Unused library background. Same as the library background LibBG_Crateria_0_Rocks used by rooms:
;     Crateria mainstreet
;     Landing site power bomb room
;     Pre moat room
;     East Crateria maze
;     Moat
; Except that this one additionally (incorrectly) loads the water FX tilemap
    dw $0002 : dl FX_Layer3_Tilemaps_water : dw $5880,$0F00
    dw $0004 : dl Background_Crateria_0_Rocks : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED

RoomPLM_Debug:
; Room $E82C, state $E839: PLM
    db $00,$00

if !FEATURE_KEEP_UNREFERENCED
;;; $E881: Unused. PLM metadata - Wrecked Ship / Maridia / Tourian (/ Ceres?) ;;;
UNUSED_UnknownUnreferenced_8FE881:
; See UNUSED_8FC209 for the other areas
    dw $009E ; "Next" item / refill station index (9Dh is the last used one, see "Item PLMs.asm" from bank logs)
    dw $00AD ; "Next" doorcap index (ACh is the last used one, see "Door PLMs.asm" from bank logs)
    dw $0081 ; ?
    dw $0001 ; Number of save stations in Wrecked Ship
    dw $0004 ; Number of save stations in Maridia
    dw $0002 ; Number of save stations in Tourian
    dw $0000 ; Number of save stations in Ceres?
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E88F: Execute setup ASM ;;;
Execute_Room_Setup_ASM:
    PHP : PHB
    REP #$30
    LDX.W RoomStatePointer
    LDA.W $0018,X : BEQ .return
    PHK : PLB
    JSR.W ($0018,X)

  .return:
    PLB : PLP
    RTL


;;; $E8A3: Execute door ASM ;;;
Execute_Door_ASM:
    PHP : PHB
    REP #$30
    LDX.W DoorPointer
    LDA.L DoorHeaders_doorASM,X : BEQ .return
    STA.B DP_Temp12
    PHK : PLB
    PEA .return-1
    JMP.W (DP_Temp12)

  .return:
    PLB : PLP
    RTL


;;; $E8BD: Execute room main ASM ;;;
Execute_Room_Main_ASM:
    LDX.W RoomMainASMPointer : BEQ .return
    PHB
    PHK : PLB
    LDX.W #$0000
    JSR.W (RoomMainASMPointer,X)
    PLB

  .return:
    RTL


;;; $E8CD: Main ASM: Crocomire's room shaking ;;;
MainASM_CrocomiresRoomShaking:
; Room $A98D. Crocomire's room
    LDA.W Enemy.properties : BIT.W #$0200 : BNE .return
    LDA.W Enemy.var0 : CMP.W #$0040 : BEQ .behindWallRumbling
    LDA.W Enemy.var1 : BIT.W #$0400 : BEQ .branch
    LDA.W Enemy[1].var3 : DEC : STA.W Enemy[1].var3
    CMP.W #$FFF9 : BMI +
    LDA.W Enemy[1].var3
    BRA .scroll

+   LDA.W #$0007 : CLC : ADC.W Enemy[1].var3 : ASL : STA.B DP_Temp12
    LDA.W Enemy[1].var3 : SEC : SBC.B DP_Temp12

  .scroll:
    STA.B DP_Temp12
    CLC : ADC.B DP_BG1YScroll : STA.B DP_BG1YScroll
    LDA.W #$FFD0 : CLC : ADC.B DP_Temp12 : STA.B DP_BG2YScroll

  .return:
    RTS

  .branch:
    LDA.W Enemy.var2 : CMP.W #$0022 : BNE .return
    LDA.W Enemy.var3 : BEQ .return
    DEC : STA.W Enemy.var3
    BIT.W #$0001 : BNE +
    LDA.W Layer1XPosition : CLC : ADC.W #$0004 : STA.W Layer1XPosition
    RTS

+   LDA.W Layer1XPosition : SEC : SBC.W #$0004 : STA.W Layer1XPosition
    RTS

  .behindWallRumbling:
    LDA.W Layer1YPosition : CLC : ADC.W BG1YOffset
    CLC : ADC.W Enemy[1].var3 : STA.B DP_BG1YScroll
    RTS


;;; $E950: Main ASM: Ridley's room shaking ;;;
MainASM_RidleysRoomShaking:
; Room $B32E. Ridley's room
; Scrolls background in circle when Ridley's tail explosion sets Enemy[4].var0 (when? Doesn't seem to ever happen)
; It's actually probably a good thing if this never happens, messing with the BG scroll registers can break scrolling
    LDA.W Enemy[4].var0 : BEQ .return
    DEC : STA.W Enemy[4].var0
    ASL : TAX
    LDA.B DP_BG1XScroll : ADC.W .Xspeeds,X : STA.B DP_BG1XScroll
    LDA.B DP_BG2XScroll : CLC : ADC.W .Xspeeds,X : STA.B DP_BG2XScroll
    LDA.B DP_BG1YScroll : CLC : ADC.W .Yspeeds,X : STA.B DP_BG1YScroll
    LDA.B DP_BG2YScroll : CLC : ADC.W .Yspeeds,X : STA.B DP_BG2YScroll

  .return:
    RTS

  .Xspeeds:
; X scroll speeds
    dw $0000,$0002,$0002,$0002,$0000,$FFFE,$FFFE,$FFFE

  .Yspeeds:
; Y scroll speeds
    dw $FFFE,$FFFE,$0000,$0002,$0002,$0002,$0000,$FFFE


Freespace_Bank8F_E99B:
; $1665 bytes
