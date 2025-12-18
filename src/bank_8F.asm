
; PLM populations, room/state headers, room/door ASM, library backgrounds

org $8F8000


;;; $8000: PLM populations ;;;
PLMPopulation_LandingSite_State0_1_2:                                    ;8F8000;
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

PLMPopulation_LandingSite_State3:                                        ;8F8026;
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
    dw $0000                                                             ;8F8058;

PLMPopulation_Parlor_State0_1:                                           ;8F805A;
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

PLMPopulation_Parlor_State2:                                             ;8F8104;
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

PLMPopulation_CrateriaPowerBombs:                                        ;8F81CC;
; Room $93AA, state $93B7: PLM
    %PLMPopEntry(PLMEntries_PowerBombTank, $1D, $07, $0000)
    dw $0000

PLMPopulation_CrateriaSave:                                              ;8F81D4;
; Room $93D5, state $93E2: PLM
    %PLMPopEntry(PLMEntries_saveStation, $05, $0B, $0001)
    dw $0000

PLMPopulation_WestOcean:                                                 ;8F81DC;
; Room $93FE, state $940B: PLM
    %PLMPopEntry(PLMEntries_greyDoorFacingLeft, $5E, $36, $900B)
    %PLMPopEntry(PLMEntries_greenDoorFacingLeft, $7E, $46, $000C)
    %PLMPopEntry(PLMEntries_MissileTank, $02, $5B, $0001)
    %PLMPopEntry(PLMEntries_MissileTankShotBlock, $1C, $03, $0002)
    %PLMPopEntry(PLMEntries_MissileTank, $01, $2F, $0003)
    dw $0000

PLMPopulation_BowlingAlleyPath:
; Room $9461, state $946E: PLM
    dw $0000                                                             ;8F81FC;

PLMPopulation_CrateriaKihunter:                                          ;8F81FE;
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

PLMPopulation_ForgottenHighwayElev:                                      ;8F8230;
; Room $94CC, state $94D9: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $08, $0D, RoomPLM_ForgottenHighwayElev_0)
    dw $0000

PLMPopulation_EastOcean:
; Room $94FD, state $950A: PLM
    dw $0000                                                             ;8F8238;

PLMPopulation_ForgottenHighwayKagos:
; Room $9552, state $955F: PLM
    dw $0000                                                             ;8F823A;

PLMPopulation_CrabMaze:
; Room $957D, state $958A: PLM
    dw $0000                                                             ;8F823C;

PLMPopulation_ForgottenHighwayElbow:                                     ;8F823E;
; Room $95A8, state $95B5: PLM
    %PLMPopEntry(PLMEntries_yellowDoorFacingUp, $06, $0D, $000F)
    dw $0000

PLMPopulation_CrateriaTube:
; Room $95D4, state $95E1: PLM
    dw $0000                                                             ;8F8246;

PLMPopulation_Moat:                                                      ;8F8248;
; Room $95FF, state $960C: PLM
    %PLMPopEntry(PLMEntries_MissileTank, $0E, $09, $0004)
    dw $0000

PLMPopulation_RedBinstarElev:                                            ;8F8250;
; Room $962A, state $9637: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $08, $0D, RoomPLM_RedBinstarElev_0)
    %PLMPopEntry(PLMEntries_yellowDoorFacingDown, $06, $02, $0010)
    dw $0000

PLMPopulation_GauntletETank:                                             ;8F825E;
; Room $965B, state $9668: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $54, $0C, RoomPLM_GauntletETank_0)
    %PLMPopEntry(PLMEntries_EnergyTank, $53, $08, $0005)
    dw $0000

PLMPopulation_PreBowling:
; Room $968F, state $969C: PLM
    dw $0000                                                             ;8F826C;

PLMPopulation_Climb_State_0_1:                                           ;8F826E;
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

PLMPopulation_Climb_State2:                                              ;8F830C;
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

PLMPopulation_Pit_0:                                                     ;8F83B6;
; Room $975C, state $976D: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $04, $0F, $97AB)
    %PLMPopEntry(PLMEntries_ScrollPLM, $06, $0F, RoomPLM_Pit_0_1)
    %PLMPopEntry(PLMEntries_ScrollPLM, $05, $09, RoomPLM_Pit_2)
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $06, $9018)
    dw $0000

PLMPopulation_Pit_1:                                                     ;8F83D0;
; Room $975C, state $9787: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $04, $0F, RoomPLM_Pit_0_1)
    %PLMPopEntry(PLMEntries_ScrollPLM, $06, $0F, RoomPLM_Pit_0_1)
    %PLMPopEntry(PLMEntries_ScrollPLM, $05, $09, RoomPLM_Pit_2)
    %PLMPopEntry(PLMEntries_greyDoorFacingLeft, $2E, $06, $0C19)
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $06, $0C1A)
    %PLMPopEntry(PLMEntries_MissileTank, $05, $1A, $0006)
    dw $0000

PLMPopulation_ElevToBlueBrinstar_State0_1:                               ;8F83F6;
; Room $97B5, state $97C6: PLM
; Room $97B5, state $97E0: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $07, $0D, RoomPLM_ElevToBlueBrinstar)
    dw $0000

PLMPopulation_BombTorizo_State0_1:                                       ;8F83FE;
; Room $9804, state $981B: PLM
; Room $9804, state $9835: PLM
    %PLMPopEntry(PLMEntries_bombTorizoGreyDoor, $01, $06, $081B)
    %PLMPopEntry(PLMEntries_BombsChozoOrb, $0C, $0A, $0007)
    %PLMPopEntry(PLMEntries_BombTorizosCrumblingChozo, $0D, $0B, $0000)
    dw $0000

PLMPopulation_BombTorizo_State2:                                         ;8F8412;
; Room $9804, state $984F: PLM
    %PLMPopEntry(PLMEntries_SetsMetroidsClearedStatesWhenRequired, $08, $08, $000E)
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $06, $181C)
    dw $0000

PLMPopulation_Flyway_State0_1:                                           ;8F8420;
; Room $9879, state $9890: PLM
; Room $9879, state $98AA: PLM
    %PLMPopEntry(PLMEntries_redDoorFacingLeft, $2E, $06, $001D)
    dw $0000

PLMPopulation_Flyway_State2:                                             ;8F8428;
; Room $9879, state $98C4: PLM
    %PLMPopEntry(PLMEntries_SetsMetroidsClearedStatesWhenRequired, $08, $08, $0010)
    dw $0000

PLMPopulation_PreMapFlyway:
; Room $98E2, state $98EF: PLM
    dw $0000                                                             ;8F8430;

PLMPopulation_Terminator:                                                ;8F8432;
; Room $990D, state $991A: PLM
    %PLMPopEntry(PLMEntries_EnergyTank, $07, $2A, $0008)
    dw $0000

PLMPopulation_GreenBrinstarElev:                                         ;8F843A;
; Room $9938, state $9945: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $07, $0D, RoomPLM_GreenBrinstarElev_0)
    dw $0000

PLMPopulation_LowerMushrooms:
; Room $9969, state $9976: PLM
    dw $0000                                                             ;8F8442;

PLMPopulation_CrateriaMap:                                               ;8F8444;
; Room $9994, state $99A1: PLM
    %PLMPopEntry(PLMEntries_mapStation, $0B, $0A, $8000)
    dw $0000

PLMPopulation_GreenPiratesShaft:                                         ;8F844C;
; Room $99BD, state $99CA: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $07, $43, RoomPLM_GreenPiratesShaft_0)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $08, $43, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $09, $46, RoomPLM_GreenPiratesShaft_2)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $0A, $46, $8000)
    %PLMPopEntry(PLMEntries_MissileTank, $0D, $1B, $0009)
    %PLMPopEntry(PLMEntries_MissileTank, $02, $1B, $000A)
    %PLMPopEntry(PLMEntries_redDoorFacingLeft, $0E, $66, $001E)
    dw $0000

PLMPopulation_CrateriaSuper:                                             ;8F8478;
; Room $99F9, state $9A06: PLM
    %PLMPopEntry(PLMEntries_SuperMissileTank, $3B, $09, $000B)
    dw $0000

PLMPopulation_FinalMissileBombway_State0:
; Room $9A44, state $9A56: PLM
    dw $0000                                                             ;8F8480;

PLMPopulation_FinalMissileBombway_State1:
; Room $9A44, state $9A70: PLM
    dw $0000                                                             ;8F8482;

PLMPopulation_FinalMissile_State0:
; Room $9A90, state $9AA2: PLM
    dw $0000                                                             ;8F8484;

PLMPopulation_FinalMissile_State1:                                       ;8F8486;
; Room $9A90, state $9ABC: PLM
    %PLMPopEntry(PLMEntries_MissileTank, $04, $07, $000C)
    dw $0000

PLMPopulation_GreenBrinstarMainShaft:                                    ;8F848E;
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

PLMPopulation_SporeSpawnSuper:                                           ;8F84D8;
; Room $9B5B, state $9B68: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $17, $0B, RoomPLM_SporeSpawnSuper_0)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $18, $0B, $8000)
    %PLMPopEntry(PLMEntries_SuperMissileTankChozoOrb, $1A, $87, $000E)
    dw $0000

PLMPopulation_BrinstarPreMap:                                            ;8F84EC;
; Room $9B9D, state $9BAA: PLM
    %PLMPopEntry(PLMEntries_greyDoorFacingLeft, $2E, $06, $0C25)
    dw $0000

PLMPopulation_EarlySupers:                                               ;8F84F4;
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

PLMPopulation_BrinstarReserveTank:                                       ;8F8526;
; Room $9C07, state $9C14: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $0E, $0B, RoomPLM_BrinstarReserveTank_0)
    %PLMPopEntry(PLMEntries_ReserveTankChozoOrb, $0B, $07, $0011)
    %PLMPopEntry(PLMEntries_MissileTankShotBlock, $1E, $07, $0012)
    %PLMPopEntry(PLMEntries_MissileTank, $19, $07, $0013)
    dw $0000

PLMPopulation_GreenBrinstarMap:                                          ;8F8540;
; Room $9C35, state $9C42: PLM
    %PLMPopEntry(PLMEntries_mapStation, $05, $0A, $8000)
    dw $0000

PLMPopulation_GreenBrinstarFirefleas:                                    ;8F8548;
; Room $9C5E, state $9C6B: PLM
    %PLMPopEntry(PLMEntries_greenDoorFacingRight, $01, $26, $0027)
    dw $0000

PLMPopulation_GreenBrinstarMissileRefill:                                ;8F8550;
; Room $9C89, state $9C96: PLM
    %PLMPopEntry(PLMEntries_missileStation, $04, $0A, $0014)
    dw $0000

PLMPopulation_Dachora:                                                   ;8F8558;
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
    dw $0000                                                             ;8F85E2;

PLMPopulation_BigPink:                                                   ;8F8550;
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

PLMPopulation_SporeSpawnKihunters:                                       ;8F8634;
; Room $9D9C, state $9DA9: PLM
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $06, $0C2C)
    %PLMPopEntry(PLMEntries_greyDoorFacingDown, $36, $03, $0C2D)
    dw $0000

PLMPopulation_SporeSpawn_State0_1:                                       ;8F8642;
; Room $9DC7, state $9DD9: PLM
; Room $9DC7, state $9DF3: PLM
    %PLMPopEntry(PLMEntries_greenDoorFacingUp, $06, $2E, $002E)
    dw $0000

PLMPopulation_PinkBrinstarPowerBombs:                                    ;8F864A;
; Room $9E11, state $9E1E: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $08, $0E, RoomPLM_PinkBrinstarPowerBombs_0)
    %PLMPopEntry(PLMEntries_ScrollPLM, $08, $0B, RoomPLM_PinkBrinstarPowerBombs_1)
    %PLMPopEntry(PLMEntries_greyDoorFacingLeft, $1E, $06, $0C2F)
    %PLMPopEntry(PLMEntries_PowerBombTank, $06, $17, $0018)
    dw $0000

PLMPopulation_GreenHillZone:                                             ;8F8664;
; Room $9E52, state $9E5F: PLM
    %PLMPopEntry(PLMEntries_downwardsClosedGate, $64, $37, $8000)
    %PLMPopEntry(PLMEntries_downwardsGateShotblock, $64, $37, $0000)
    %PLMPopEntry(PLMEntries_yellowDoorFacingLeft, $1E, $06, $0030)
    %PLMPopEntry(PLMEntries_MissileTank, $3D, $18, $0019)
    dw $0000

PLMPopulation_MorphBall_State0:                                          ;8F867E;
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

PLMPopulation_MorphBall_State1:                                          ;8F86E6;
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

PLMPopulation_ConstructionZone_State0_1:                                 ;8F8754;
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

PLMPopulation_BlueBrinstarETank_State0_1:                                ;8F878C;
; Room $9F64, state $9F76: PLM
; Room $9F64, state $9F90: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $27, $0B, RoomPLM_BlueBrinstarETank_0_1)
    %PLMPopEntry(PLMEntries_ScrollPLM, $27, $26, RoomPLM_BlueBrinstarETank_0_1)
    %PLMPopEntry(PLMEntries_MissileTank, $2E, $29, $001C)
    %PLMPopEntry(PLMEntries_EnergyTankShotBlock, $1C, $22, $001D)
    dw $0000

PLMPopulation_NoobBridge:                                                ;8F87A6;
; Room $9FBA, state $9FC7: PLM
    %PLMPopEntry(PLMEntries_greenDoorFacingLeft, $5E, $06, $0033)
    dw $0000

PLMPopulation_GreenBrinstarBeetoms:
; Room $9FE5, state $9FF2: PLM
    dw $0000                                                             ;8F87AE;

PLMPopulation_EtecoonETank:                                              ;8F87B0;
; Room $A011, state $A01E: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $07, $0B, RoomPLM_EtecoonETank_0)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $08, $0B, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $09, $0B, $8000)
    %PLMPopEntry(PLMEntries_EnergyTank, $05, $09, $001E)
    %PLMPopEntry(PLMEntries_greenDoorFacingRight, $01, $06, $0034)
    dw $0000

PLMPopulation_EtecoonSuper:                                              ;8F87D0;
; Room $A051, state $A05E: PLM
    %PLMPopEntry(PLMEntries_SuperMissileTank, $07, $09, $001F)
    dw $0000

PLMPopulation_DachoraEnergyRefill:                                       ;8F87D8;
; Room $A07B, state $A088: PLM
    %PLMPopEntry(PLMEntries_energyStation, $04, $0A, $0020)
    dw $0000

PLMPopulation_SporeSpawnFarming:                                         ;8F87E0;
; Room $A0A4, state $A0B1: PLM
    %PLMPopEntry(PLMEntries_greenDoorFacingRight, $01, $06, $0035)
    dw $0000

PLMPopulation_WaterwayETank:                                             ;8F87E8;
; Room $A0D2, state $A0DF: PLM
    %PLMPopEntry(PLMEntries_upwardsExtension, $0F, $09, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0F, $0A, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $0F, $0B, RoomPLM_WaterwayETank)
    %PLMPopEntry(PLMEntries_EnergyTank, $04, $09, $0021)
    dw $0000

PLMPopulation_FirstMissile:                                              ;8F8802;
; Room $A107, state $A114: PLM
    %PLMPopEntry(PLMEntries_MissileTankChozoOrb, $04, $07, $0022)
    dw $0000

PLMPopulation_PinkBrinstarHoppers:                                       ;8F880A;
; Room $A130, state $A13D: PLM
    %PLMPopEntry(PLMEntries_downwardsClosedGate, $11, $04, $8000)
    %PLMPopEntry(PLMEntries_downwardsGateShotblock, $11, $04, $0002)
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $16, $0C36)
    %PLMPopEntry(PLMEntries_greyDoorFacingLeft, $1E, $16, $0C37)
    dw $0000

PLMPopulation_HopperETank:                                               ;8F8824;
; Room $A15B, state $A168: PLM
    %PLMPopEntry(PLMEntries_EnergyTank, $0B, $09, $0023)
    dw $0000

PLMPopulation_BigPinkSaveRoom:                                           ;8F882C;
; Room $A184, state $A191: PLM
    %PLMPopEntry(PLMEntries_saveStation, $05, $0B, $0000)
    dw $0000

PLMPopulation_BlueBrinstarBoulders:
    dw $0000                                                             ;8F8834;
; Room $A1AD, state $A1BA: PLM

PLMPopulation_BillyMays:                                                 ;8F8836;
; Room $A1D8, state $A1E5: PLM
    %PLMPopEntry(PLMEntries_MissileTank, $07, $09, $0024)
    %PLMPopEntry(PLMEntries_MissileTankShotBlock, $05, $0C, $0025)
    dw $0000

PLMPopulation_GreenBrinstarSave:                                         ;8F8844;
; Room $A201, state $A20E: PLM
    %PLMPopEntry(PLMEntries_saveStation, $05, $0B, $0001)
    dw $0000

PLMPopulation_EtecoonSave:                                               ;8F884C;
; Room $A22A, state $A237: PLM
    %PLMPopEntry(PLMEntries_saveStation, $05, $0B, $0002)
    dw $0000

PLMPopulation_RedTower:                                                  ;8F8854;
; Room $A253, state $A260: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $09, $6A, RoomPLM_RedTower_0)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $0A, $6A, $8000)
    %PLMPopEntry(PLMEntries_greenDoorFacingRight, $01, $96, $0038)
    %PLMPopEntry(PLMEntries_yellowDoorFacingRight, $01, $66, $0039)
    dw $0000

PLMPopulation_RedBrinstarFirefleas:                                      ;8F886E;
; Room $A293, state $A2A0: PLM
    %PLMPopEntry(PLMEntries_redDoorFacingRight, $01, $06, $003A)
    dw $0000

PLMPopulation_XrayScope:                                                 ;8F8876;
; Room $A2CE, state $A2DB: PLM
    %PLMPopEntry(PLMEntries_XrayScopeChozoOrb, $05, $07, $0026)
    dw $0000

PLMPopulation_Hellway:
; Room $A2F7, state $A304: PLM
    dw $0000                                                             ;8F887E;

PLMPopulation_Caterpillar:                                               ;8F8880;
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

PLMPopulation_BetaPowerBomb:                                             ;8F88BE;
; Room $A37C, state $A389: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $07, $0E, RoomPLM_BetaPowerBomb_0)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $08, $0E, $8000)
    %PLMPopEntry(PLMEntries_PowerBombTank, $04, $13, $0027)
    %PLMPopEntry(PLMEntries_greyDoorFacingLeft, $1E, $06, $0C3E)
    dw $0000

PLMPopulation_AlphaPowerBomb:                                            ;8F88D8;
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
    dw $0000                                                             ;8F891C;

PLMPopulation_BelowSpazer:                                               ;8F891E;
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

PLMPopulation_Spazer:                                                    ;8F896E;
; Room $A447, state $A454: PLM
    %PLMPopEntry(PLMEntries_SpazerChozoOrb, $0B, $09, $002A)
    dw $0000

PLMPopulation_WarehouseZeela:                                            ;8F8976;
; Room $A471, state $A47E: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $02, $0B, RoomPLM_WarehouseZeela_0)
    %PLMPopEntry(PLMEntries_ScrollPLM, $02, $19, RoomPLM_WarehouseZeela_1_3)
    %PLMPopEntry(PLMEntries_ScrollPLM, $07, $19, RoomPLM_WarehouseZeela_2)
    %PLMPopEntry(PLMEntries_ScrollPLM, $15, $19, RoomPLM_WarehouseZeela_1_3)
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $16, $0040)
    dw $0000

PLMPopulation_WarehouseETank:                                            ;8F8996;
; Room $A4B1, state $A4BE: PLM
    %PLMPopEntry(PLMEntries_greyDoorFacingLeft, $0E, $06, $0C41)
    %PLMPopEntry(PLMEntries_EnergyTankShotBlock, $05, $04, $002B)
    dw $0000

PLMPopulation_WarehouseKihunter:                                         ;8F89A4;
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

PLMPopulation_MiniKraid_State0_1:                                        ;8F89F4;
; Room $A521, state $A533: PLM
; Room $A521, state $A54D: PLM
    %PLMPopEntry(PLMEntries_greyDoorFacingLeft, $5E, $06, $0C42)
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $06, $0C43)
    dw $0000

PLMPopulation_KraidEyeDoor:                                              ;8F8A02;
; Room $A56B, state $A578: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $03, $12, RoomPLM_KraidEyeDoor_0)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $04, $12, $8000)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $05, $12, $8000)
    %PLMPopEntry(PLMEntries_greenDoorFacingLeft, $0E, $06, $0044)
    %PLMPopEntry(PLMEntries_EyeDoorFacingLeft, $1E, $16, $0045)
    %PLMPopEntry(PLMEntries_EyeDoorBottomFacingLeft, $1E, $19, $0045)
    %PLMPopEntry(PLMEntries_EyeDoorEyeFacingLeft, $1E, $17, $0045)
    dw $0000

PLMPopulation_Kraid_State0_1:                                            ;8F8A2E;
; Room $A59F, state $A5B1: PLM
; Room $A59F, state $A5CB: PLM
    %PLMPopEntry(PLMEntries_greyDoorFacingLeft, $1E, $16, $0046)
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $16, $0047)
    dw $0000

PLMPopulation_StatuesHallway:
; Room $A5ED, state $A5FA: PLM
    dw $0000                                                             ;8F8A3C;

PLMPopulation_RedTowerRefill:                                            ;8F8A3E;
; Room $A618, state $A625: PLM
    %PLMPopEntry(PLMEntries_energyStation, $04, $0A, $002D)
    dw $0000

PLMPopulation_KraidRefill:                                               ;8F8A46;
; Room $A641, state $A64E: PLM
    %PLMPopEntry(PLMEntries_missileStation, $09, $0A, $002E)
    %PLMPopEntry(PLMEntries_energyStation, $07, $0A, $002F)
    dw $0000

PLMPopulation_Statues:                                                   ;8F8A54;
; Room $A66A, state $A677: PLM
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $06, $9448)
    dw $0000

PLMPopulation_WarehouseEntrance:                                         ;8F8A5C;
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

PLMPopulation_VariaSuit:                                                 ;8F8ACA;
; Room $A6E2, state $A6EF: PLM
    %PLMPopEntry(PLMEntries_VariaSuitChozoOrb, $07, $09, $0030)
    dw $0000

PLMPopulation_WarehouseSave:                                             ;8F8AD2;
; Room $A70B, state $A718: PLM
    %PLMPopEntry(PLMEntries_saveStation, $07, $0B, $0003)
    dw $0000

PLMPopulation_RedBrinstarSave:                                           ;8F8ADA;
; Room $A734, state $A741: PLM
    %PLMPopEntry(PLMEntries_saveStation, $07, $0B, $0004)
    dw $0000

PLMPopulation_IceBeamAcid:
; Room $A75D, state $A76A: PLM
    dw $0000                                                             ;8F8AE2;

PLMPopulation_Cathedral:                                                 ;8F8AE4;
; Room $A788, state $A795: PLM
    %PLMPopEntry(PLMEntries_MissileTankShotBlock, $22, $1C, $0031)
    %PLMPopEntry(PLMEntries_greenDoorFacingLeft, $2E, $16, $0049)
    dw $0000

PLMPopulation_CathedralEntrance:                                         ;8F8AF2;
; Room $A7B3, state $A7C0: PLM
    %PLMPopEntry(PLMEntries_redDoorFacingLeft, $2E, $06, $004A)
    dw $0000

PLMPopulation_BusinessCenter:                                            ;8F8AFA;
; Room $A7DE, state $A7EB: PLM
    %PLMPopEntry(PLMEntries_elevatorPlatform, $06, $2C, $8000)
    %PLMPopEntry(PLMEntries_greenDoorFacingRight, $01, $36, $004B)
    %PLMPopEntry(PLMEntries_yellowDoorFacingRight, $01, $46, $004C)
    %PLMPopEntry(PLMEntries_redDoorFacingRight, $01, $56, $004D)
    dw $0000

PLMPopulation_IceBeamGate:                                               ;8F8B14;
; Room $A815, state $A822: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $37, $2D, RoomPLM_IceBeamGate_0)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $38, $2D, $8000)
    dw $0000

PLMPopulation_IceBeamTutorial:
; Room $A865, state $A872: PLM
    dw $0000                                                             ;8F8B22;

PLMPopulation_IceBeam:                                                   ;8F8B24;
; Room $A890, state $A89D: PLM
    %PLMPopEntry(PLMEntries_IceBeamChozoOrb, $0C, $07, $0032)
    dw $0000

PLMPopulation_IceBeamSnake:                                              ;8F8B2C;
; Room $A8B9, state $A8C6: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $0F, $17, RoomPLM_IceBeamSnake_0)
    %PLMPopEntry(PLMEntries_ScrollPLM, $0D, $17, RoomPLM_IceBeamSnake_1)
    %PLMPopEntry(PLMEntries_ScrollPLM, $11, $17, RoomPLM_IceBeamSnake_2)
    %PLMPopEntry(PLMEntries_ScrollPLM, $13, $17, RoomPLM_IceBeamSnake_3)
    dw $0000

PLMPopulation_CrumbleShaft:                                              ;8F8B46;
; Room $A8F8, state $A905: PLM
    %PLMPopEntry(PLMEntries_MissileTankShotBlock, $01, $08, $0033)
    dw $0000

PLMPopulation_CrocomireSpeedway:                                         ;8F8B4E;
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

PLMPopulation_Crocomire_State0_1:                                        ;8F8B9E;
; Room $A98D, state $A99F: PLM
; Room $A98D, state $A9B9: PLM
    %PLMPopEntry(PLMEntries_greyDoorFacingDown, $36, $02, $044F)
    %PLMPopEntry(PLMEntries_EnergyTank, $7D, $06, $0034)
    dw $0000

PLMPopulation_HiJumpBoots:                                               ;8F8BAC;
; Room $A9E5, state $A9F2: PLM
    %PLMPopEntry(PLMEntries_HiJumpBootsChozoOrb, $03, $0A, $0035)
    dw $0000

PLMPopulation_CrocomireEscape:                                           ;8F8BB4;
; Room $AA0E, state $AA1B: PLM
    %PLMPopEntry(PLMEntries_downwardsClosedGate, $06, $05, $8000)
    %PLMPopEntry(PLMEntries_downwardsGateShotblock, $06, $05, $000A)
    %PLMPopEntry(PLMEntries_MissileTank, $0D, $09, $0036)
    dw $0000

PLMPopulation_HiJumpETank:                                               ;8F8BC8;
; Room $AA41, state $AA4E: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $10, $0C, RoomPLM_HiJumpETank_0)
    %PLMPopEntry(PLMEntries_ScrollPLM, $0F, $05, RoomPLM_HiJumpETank_1)
    %PLMPopEntry(PLMEntries_ScrollPLM, $08, $1C, RoomPLM_HiJumpETank_2)
    %PLMPopEntry(PLMEntries_ScrollPLM, $0B, $12, RoomPLM_HiJumpETank_3)
    %PLMPopEntry(PLMEntries_greyDoorFacingLeft, $1E, $06, $0C50)
    %PLMPopEntry(PLMEntries_MissileTank, $09, $06, $0037)
    %PLMPopEntry(PLMEntries_EnergyTank, $17, $08, $0038)
    dw $0000

PLMPopulation_PostCrocFarming:                                           ;8F8BF4;
; Room $AA82, state $AA8F: PLM
    %PLMPopEntry(PLMEntries_redDoorFacingRight, $01, $06, $0051)
    dw $0000

PLMPopulation_PostCrocSave:                                              ;8F8BFC;
; Room $AAB5, state $AAC2: PLM
    %PLMPopEntry(PLMEntries_saveStation, $07, $0B, $0000)
    dw $0000

PLMPopulation_PostCrocPowerBombs:                                        ;8F8C04;
; Room $AADE, state $AAEB: PLM
    %PLMPopEntry(PLMEntries_PowerBombTank, $07, $08, $0039)
    dw $0000

PLMPopulation_PostCrocShaft:                                             ;8F8C0C;
; Room $AB07, state $AB14: PLM
    %PLMPopEntry(PLMEntries_redDoorFacingLeft, $0E, $36, $0052)
    dw $0000

PLMPopulation_PostCrocMissile:                                           ;8F8C14;
; Room $AB3B, state $AB48: PLM
    %PLMPopEntry(PLMEntries_MissileTank, $3C, $09, $003A)
    dw $0000

PLMPopulation_GrappleTutorial3:                                          ;8F8C1C;
; Room $AB64, state $AB71: PLM
    %PLMPopEntry(PLMEntries_downwardsClosedGate, $2A, $05, $8000)
    %PLMPopEntry(PLMEntries_downwardsGateShotblock, $2A, $05, $0008)
    dw $0000

PLMPopulation_PostCrocJump:                                              ;8F8C2A;
; Room $AB8F, state $AB9C: PLM
    %PLMPopEntry(PLMEntries_MissileTank, $43, $09, $003B)
    dw $0000

PLMPopulation_GrappleTutorial2:
; Room $ABD2, state $ABDF: PLM
    dw $0000                                                             ;8F8C32;

PLMPopulation_GrappleTutorial1:
; Room $AC00, state $AC0D: PLM
    dw $0000                                                             ;8F8C34;

PLMPopulation_GrappleBeam:                                               ;8F8C36;
; Room $AC2B, state $AC38: PLM
    %PLMPopEntry(PLMEntries_GrappleBeamChozoOrb, $04, $27, $003C)
    dw $0000

PLMPopulation_NorfairReserveTank:                                        ;8F8C3E;
; Room $AC5A, state $AC67: PLM
    %PLMPopEntry(PLMEntries_ReserveTankChozoOrb, $02, $07, $003D)
    %PLMPopEntry(PLMEntries_MissileTankShotBlock, $07, $0B, $003E)
    dw $0000

PLMPopulation_GreenBubblesMissiles:                                      ;8F8C4C;
; Room $AC83, state $AC90: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $10, $05, RoomPLM_GreenBubblesMissiles_0)
    %PLMPopEntry(PLMEntries_MissileTank, $14, $0A, $003F)
    dw $0000

PLMPopulation_BubbleMountain:                                            ;8F8C5A;
; Room $ACB3, state $ACC0: PLM
    %PLMPopEntry(PLMEntries_greenDoorFacingRight, $01, $06, $0053)
    %PLMPopEntry(PLMEntries_greenDoorFacingLeft, $1E, $06, $0054)
    %PLMPopEntry(PLMEntries_MissileTank, $14, $3C, $0040)
    dw $0000

PLMPopulation_SpeedBoosterHall:                                          ;8F8C6E;
; Room $ACF0, state $ACFD: PLM
    %PLMPopEntry(PLMEntries_SpeedBoosterEscape, $00, $00, $8000)
    %PLMPopEntry(PLMEntries_MissileTankShotBlock, $BC, $13, $0041)
    %PLMPopEntry(PLMEntries_redDoorFacingLeft, $BE, $16, $0055)
    dw $0000

PLMPopulation_SpeedBooster:                                              ;8F8C82;
; Room $AD1B, state $AD28: PLM
    %PLMPopEntry(PLMEntries_SpeedBoosterChozoOrb, $0B, $06, $0042)
    dw $0000

PLMPopulation_SingleChamber:                                             ;8F8C8A;
; Room $AD5E, state $AD6B: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $0D, $08, RoomPLM_SingleChamber_0)
    %PLMPopEntry(PLMEntries_ScrollPLM, $10, $08, RoomPLM_SingleChamber_1_4)
    %PLMPopEntry(PLMEntries_upwardsExtension, $4D, $0A, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $4D, $0B, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $4D, $0C, RoomPLM_SingleChamber_1_4)
    %PLMPopEntry(PLMEntries_redDoorFacingLeft, $0E, $16, $0056)
    dw $0000

PLMPopulation_DoubleChamber:                                             ;8F8CB0;
; Room $ADAD, state $ADBA: PLM
    %PLMPopEntry(PLMEntries_downwardsClosedGate, $1A, $05, $8000)
    %PLMPopEntry(PLMEntries_downwardsGateShotblock, $1A, $05, $0000)
    %PLMPopEntry(PLMEntries_MissileTank, $1F, $09, $0043)
    %PLMPopEntry(PLMEntries_redDoorFacingLeft, $3E, $06, $0057)
    dw $0000

PLMPopulation_WaveBeam:                                                  ;8F8CCA;
; Room $ADDE, state $ADEB: PLM
    %PLMPopEntry(PLMEntries_WaveBeamChozoOrb, $0B, $06, $0044)
    dw $0000

PLMPopulation_SpikyPlatformsTunnel:
; Room $AE07, state $AE14: PLM
    dw $0000                                                             ;8F8CD2;

PLMPopulation_Volcano:                                                   ;8F8CD4;
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

PLMPopulation_KronicBoost:                                               ;8F8D1E;
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
    dw $0000                                                             ;8F8D56;

PLMPopulation_PurpleShaft:                                               ;8F8D58;
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
    dw $0000                                                             ;8F8D7E;

PLMPopulation_LowerNorfairElev:                                          ;8F8D80;
; Room $AF3F, state $AF4C: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $08, $0B, RoomPLM_LowerNorfairElev_0)
    dw $0000

PLMPopulation_UpperNorfairFarming:                                       ;8F8D88;
; Room $AF72, state $AF7F: PLM
    %PLMPopEntry(PLMEntries_downwardsClosedGate, $06, $15, $8000)
    %PLMPopEntry(PLMEntries_downwardsGateShotblock, $06, $15, $0000)
    dw $0000

PLMPopulation_RisingTide:
; Room $AFA3, state $AFB0: PLM
    dw $0000                                                             ;8F8D96;

PLMPopulation_AcidSnakesTunnel:
; Room $AFCE, state $AFDB: PLM
    dw $0000                                                             ;8F8D98;

PLMPopulation_SpikyAcidSnakesTunnel:
; Room $AFFB, state $B008: PLM
    dw $0000                                                             ;8F8D9A;

PLMPopulation_UpperNorfairRefill:                                        ;8F8D9C;
; Room $B026, state $B033: PLM
    %PLMPopEntry(PLMEntries_energyStation, $07, $0A, $0045)
    dw $0000

PLMPopulation_PurpleFarming:
; Room $B051, state $B05E: PLM
    dw $0000                                                             ;8F8DA4;

PLMPopulation_BatCave:                                                   ;8F8DA6;
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

PLMPopulation_NorfairMap:                                                ;8F8DD8;
; Room $B0B4, state $B0C1: PLM
    %PLMPopEntry(PLMEntries_mapStation, $05, $0A, $8000)
    dw $0000

PLMPopulation_BubbleMountainSave:                                        ;8F8DE0;
; Room $B0DD, state $B0EA: PLM
    %PLMPopEntry(PLMEntries_saveStation, $05, $0B, $0001)
    dw $0000

PLMPopulation_FrogSpeedway:
; Room $B106, state $B113: PLM
    dw $0000                                                             ;8F8DE8;

PLMPopulation_RedPirateShaft:
; Room $B139, state $B146: PLM
    dw $0000                                                             ;8F8DEA;

PLMPopulation_FrogSave:                                                  ;8F8DEC;
; Room $B167, state $B174: PLM
    %PLMPopEntry(PLMEntries_saveStation, $07, $0B, $0002)
    dw $0000

PLMPopulation_CrocomireSave:                                             ;8F8DF4;
; Room $B192, state $B19F: PLM
    %PLMPopEntry(PLMEntries_saveStation, $07, $0B, $0003)
    dw $0000

PLMPopulation_LNElevSave:                                                ;8F8DFC;
; Room $B1BB, state $B1C8: PLM
    %PLMPopEntry(PLMEntries_saveStation, $05, $0B, $0004)
    dw $0000

PLMPopulation_AcidStatue:                                                ;8F8E04;
; Room $B1E5, state $B1F2: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $0C, $1E, RoomPLM_AcidStatue_0)
    %PLMPopEntry(PLMEntries_ScrollPLM, $0C, $23, RoomPLM_AcidStatue_1)
    dw $0000

PLMPopulation_MainHall:                                                  ;8F8E12;
; Room $B236, state $B243: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $47, $08, RoomPLM_MainHall_0_2)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $48, $08, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $47, $23, RoomPLM_MainHall_0_2)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $48, $23, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $47, $29, RoomPLM_MainHall_4)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $48, $29, $8000)
    %PLMPopEntry(PLMEntries_elevatorPlatform, $46, $2A, $8000)
    dw $0000

PLMPopulation_GoldenTorizo_State0_1:                                     ;8F8E3E;
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

PLMPopulation_FastRipper:                                                ;8F8E82;
; Room $B2DA, state $B2E7: PLM
    %PLMPopEntry(PLMEntries_downwardsClosedGate, $34, $05, $8000)
    %PLMPopEntry(PLMEntries_downwardsGateShotblock, $34, $05, $0008)
    dw $0000

PLMPopulation_GTEnergyRefill:                                            ;8F8E90;
; Room $B305, state $B312: PLM
    %PLMPopEntry(PLMEntries_energyStation, $08, $0A, $0048)
    dw $0000

PLMPopulation_Ridley_State0_1:                                           ;8F8E98;
; Room $B32E, state $B340: PLM
; Room $B32E, state $B35A: PLM
    %PLMPopEntry(PLMEntries_greyDoorFacingLeft, $0E, $06, $005A)
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $16, $005B)
    dw $0000

PLMPopulation_LNFarming:                                                 ;8F8EA6;
; Room $B37A, state $B387: PLM
    %PLMPopEntry(PLMEntries_EyeDoorFacingRight, $01, $06, $005C)
    %PLMPopEntry(PLMEntries_EyeDoorBottomFacingRight, $01, $09, $005C)
    %PLMPopEntry(PLMEntries_EyeDoorEyeFacingRight, $01, $07, $005C)
    dw $0000

PLMPopulation_FastPillarsSetup:                                          ;8F8EBA;
; Room $B3A5, state $B3B2: PLM
    %PLMPopEntry(PLMEntries_ScrollPLM, $07, $21, RoomPLM_FastPillarsSetup_0)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $08, $21, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $07, $1B, RoomPLM_FastPillarsSetup_2)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $08, $1B, $8000)
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_PLMPopulation_8FB3EE:
; Room $B3E1, state $B3EE: PLM
    dw $0000                                                             ;8F8ED4;
endif ; !FEATURE_KEEP_UNREFERENCED

PLMPopulation_MickeyMouse:                                               ;8F8ED6;
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
    dw $0000                                                             ;8F8F38;

PLMPopulation_Plowerhouse:
; Room $B482, state $B48F: PLM
    dw $0000                                                             ;8F8F3A;

PLMPopulation_WorstRoomInTheGame:                                        ;8F8F3C;
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
    dw $0000                                                             ;8F8F7A;

PLMPopulation_LNSpringBallMaze:                                          ;8F8F7C;
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

PLMPopulation_LNEscapePowerBombs:                                        ;8F8FD2;
; Room $B55A, state $B567: PLM
    %PLMPopEntry(PLMEntries_PowerBombTank, $0C, $08, $004B)
    dw $0000

PLMPopulation_RedKihunterShaft:                                          ;8F8FDA;
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

PLMPopulation_Wasteland:                                                 ;8F9036;
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

PLMPopulation_MetalPirates:                                              ;8F90C8;
; Room $B62B, state $B638: PLM
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $06, $0C60)
    dw $0000

PLMPopulation_ThreeMusketeers:                                           ;8F90D0;
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

PLMPopulation_RidleyETank:                                               ;8F9108;
; Room $B698, state $B6A5: PLM
    %PLMPopEntry(PLMEntries_EnergyTankShotBlock, $0E, $0B, $004E)
    dw $0000

PLMPopulation_ScrewAttack:                                               ;8F9110;
; Room $B6C1, state $B6CE: PLM
    %PLMPopEntry(PLMEntries_ScrewAttackChozoOrb, $0B, $28, $004F)
    dw $0000

PLMPopulation_LNFireflea:                                                ;8F9118;
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

PLMPopulation_LNSave:                                                    ;8F918C;
; Room $B741, state $B74E: PLM
    %PLMPopEntry(PLMEntries_saveStation, $07, $0B, $0005)
    dw $0000


;;; $9194: Room setup ASM - clear Crateria mainstreet escape passage if critters escaped and shake screen ;;;
SetupASM_ClearBlocksAfterSavingAnimalsAndShakeScreen:
; Room $92FD, state $9348. Crateria mainstreet, Zebes timebomb set
    JSL.L Spawn_Hardcoded_PLM                                            ;8F9194;
    db $3D,$0B                                                           ;8F9198;
    dw PLMEntries_ClearCrateriaMainstreetEscapePassageIfCrittersEsc      ;8F919A;
    LDA.W #$0018                                                         ;8F919C;
    STA.W EarthquakeType                                                 ;8F919F;
    LDA.W #$FFFF                                                         ;8F91A2;
    STA.W EarthquakeTimer                                                ;8F91A5;
    RTS                                                                  ;8F91A8;


;;; $91A9: Room setup ASM - make old Tourian escape shaft fake wall explode ;;;
SetupASM_AutoDestroyWallDuringEscape:
; Room $96BA, state $9705. Old Tourian escape shaft, Zebes timebomb set
    JSL.L Spawn_Hardcoded_PLM                                            ;8F91A9;
    db $10,$87                                                           ;8F91AD;
    dw PLMEntries_MakeOldTourianEscapeShaftFakeWallExplode               ;8F91AF;
    RTS                                                                  ;8F91B1;


;;; $91B2: Room setup ASM - spawn critters escape block ;;;
SetupASM_TurnWallIntoShotBlocksDuringEscape:
; Room $9804, state $984F. Bomb Torizo's room, Zebes timebomb set
    JSL.L Spawn_Hardcoded_PLM                                            ;8F91B2;
    db $0F,$0A                                                           ;8F91B6;
    dw PLMEntries_CrittersEscapeBlock                                    ;8F91B8;
    RTS                                                                  ;8F91BA;


;;; $91BB: RTS. Room setup ASM ;;;
RTS_8F91BB:
; Room $9879, state $98C4. Pre Bomb Torizo room, Zebes timebomb set
    RTS                                                                  ;8F91BB;


;;; $91BC: RTS. Room setup ASM ;;;
RTS_8F91BC:
; Room $92FD, state $932E. Crateria mainstreet, Zebes is awake
; Room $96BA, state $96EB. Old Tourian escape shaft, Zebes is awake
; Room $975C, state $9787. Old Mother Brain room, morph & missiles
; Room $97B5, state $97E0. Crateria -> Blue Brinstar, morph & missiles
; Room $9E9F, state $9ECB. Morph ball room, Zebes is awake
; Room $9F11, state $9F3D. Pre-missiles room, Zebes is awake
; Room $9F64, state $9F90. Ceiling E-tank room, Zebes is awake
    RTS                                                                  ;8F91BC;


;;; $91BD: Room setup ASM - scrolling sky land, shake screen ;;;
SetupASM_ShakeScreenAndCallFX20DuringEscape:
; Room $91F8, state $9261. Landing site, Zebes timebomb set
    LDA.W #$0006                                                         ;8F91BD;
    STA.W EarthquakeType                                                 ;8F91C0;
    LDA.W #$FFFF                                                         ;8F91C3;
    STA.W EarthquakeTimer                                                ;8F91C6; fallthrough to SetupASM_ScrollingSkyLand


;;; $91C9: Room setup ASM - scrolling sky land ;;;
SetupASM_ScrollingSkyLand:
; Room $91F8, state $9213. Landing site, power bombs
; Room $91F8, state $922D. Landing site, Zebes is awake
; Room $91F8, state $9247. Landing site, default
    JSL.L FXType_20_ScrollingSky_RoomSetupASM_ScrollingSkyLand           ;8F91C9;
    RTS                                                                  ;8F91CD;


;;; $91CE: Room setup ASM - scrolling sky ocean ;;;
SetupASM_ScrollingSkyOcean:
; Room $93FE. Wrecked Ship entrance
; Room $94FD. Wrecked Ship back door
; Room $968F. Orange zoomer room
    JSL.L RoomSetupASM_ScrollingSkyOcean                                 ;8F91CE;
    RTS                                                                  ;8F91D2;


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
    RTS                                                                  ;8F91D3;


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
    RTS                                                                  ;8F91D4;


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
    RTS                                                                  ;8F91D5;


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
    RTS                                                                  ;8F91D6;


;;; $91D7: Room setup ASM - run statue unlocking animations ;;;
SetupASM_RunStatueUnlockingAnimations:
; Room $A66A. Tourian entrance
    LDY.W #AnimatedTilesObject_TourianStatueKraid                        ;8F91D7;
    JSL.L Spawn_AnimatedTilesObject                                      ;8F91DA;
    LDY.W #AnimatedTilesObject_TourianStatuePhantoon                     ;8F91DE;
    JSL.L Spawn_AnimatedTilesObject                                      ;8F91E1;
    LDY.W #AnimatedTilesObject_TourianStatueDraygon                      ;8F91E5;
    JSL.L Spawn_AnimatedTilesObject                                      ;8F91E8;
    LDY.W #AnimatedTilesObject_TourianStatueRidley                       ;8F91EC;
    JSL.L Spawn_AnimatedTilesObject                                      ;8F91EF;
    RTS                                                                  ;8F91F3;


;;; $91F4: Setup ASM: RTS ;;;
RTS_8F91F4:
; Room $A6A1: Kraid's gauntlet entrance
; Room $A6E2: Varia suit room
; Room $A70B: Kraid's lair save room
; Room $A734: Red Brinstar save room
    RTS                                                                  ;8F91F4;


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
    RTS                                                                  ;8F91F5;


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
    RTS                                                                  ;8F91F6;


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
    RTS                                                                  ;8F91F7;


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
RoomHeader_LandingSite:                                                  ;8F91F8;
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

RoomState_LandingSite_0:                                                 ;8F9213;
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

RoomState_LandingSite_1:                                                 ;8F922D;
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

RoomState_LandingSite_2:                                                 ;8F9247;
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

RoomState_LandingSite_3:                                                 ;8F9261;
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
    dw Door_LandingSite_0                                                ;8F927B;
    dw Door_LandingSite_1                                                ;8F927D;
    dw Door_LandingSite_2                                                ;8F927F;
    dw Door_LandingSite_3                                                ;8F9281;

RoomScrolls_LandingSite:
    db $00,$00,$02,$02,$02,$02,$02,$02,$02,$00,$00,$02,$02,$02,$02,$02   ;8F9283;
    db $02,$02,$01,$00,$02,$02,$02,$02,$02,$02,$02,$00,$00,$02,$02,$02   ;8F9293;
    db $02,$02,$02,$02,$01,$01,$01,$01,$01,$01,$01,$01,$01               ;8F92A3;

RoomPLM_LandingSite_0:
    db $13,$01, $80                                                      ;8F92B0;

RoomHeader_GauntletEntrance:                                             ;8F92B3;
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

RoomState_GauntletEntrance_0:                                            ;8F92C5;
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

RoomState_GauntletEntrance_1:                                            ;8F92DF;
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
    dw Door_GauntletEntrance_0                                           ;8F92F9;
    dw Door_GauntletEntrance_1                                           ;8F92FB;

RoomHeader_Parlor:                                                       ;8F92FD;
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

RoomState_Parlor_0:                                                      ;8F9314;
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

RoomState_Parlor_1:                                                      ;8F932E;
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

RoomState_Parlor_2:                                                      ;8F9348;
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
    dw Door_Parlor_0                                                     ;8F9362;
    dw Door_Parlor_1                                                     ;8F9364;
    dw Door_Parlor_2                                                     ;8F9366;
    dw Door_Parlor_3                                                     ;8F9368;
    dw Door_Parlor_4                                                     ;8F936A;
    dw Door_Parlor_5                                                     ;8F936C;
    dw Door_Parlor_6                                                     ;8F936E;

RoomScrolls_Parlor:
    db $00,$01,$01,$01,$01,$00,$00,$00,$00,$00,$00,$02,$00,$01,$00,$00   ;8F9370;
    db $02,$00,$00,$00,$00,$02,$00,$00,$00                               ;8F9380;

RoomPLM_Parlor_0:
    db $08,$02, $80                                                      ;8F9389;

RoomPLM_Parlor_1:
    db $08,$00, $80                                                      ;8F938C;

RoomPLM_Parlor_2:
    db $00,$00, $02,$00, $06,$02, $80                                    ;8F938F;

RoomPLM_Parlor_6:
    db $06,$00, $80                                                      ;8F9396;

RoomPLM_Parlor_A:
    db $00,$01, $80                                                      ;8F9399;

RoomPLM_Parlor_D:
    db $02,$01, $80                                                      ;8F939C;

RoomPLM_Parlor_13_14:
    db $04,$01, $80                                                      ;8F939F;

RoomPLM_Parlor_15:
    db $04,$00, $80                                                      ;8F93A2;

RoomPLM_Parlor_1A:
    db $04,$00, $08,$02, $80                                             ;8F93A5;

RoomHeader_CrateriaPowerBombs:                                           ;8F93AA;
    %RoomHeader(\
    %room(3),
    %area(0),
    %positions($20, 1),
    %dimensions(2, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_CrateriaPowerBombs))
    %stateChecks(0)

RoomState_CrateriaPowerBombs:                                            ;8F93B7;
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
    dw Door_CrateriaPowerBombs_0                                         ;8F93D1;

RoomScrolls_CrateriaPowerBomb:
    db $01,$01                                                           ;8F93D3;

RoomHeader_CrateriaSave:                                                 ;8F93D5;
    %RoomHeader(\
    %room(4),
    %area(0),
    %positions($12, 6),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_CrateriaSave))
    %stateChecks(0)

RoomState_CrateriaSave:                                                  ;8F93E2;
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
    dw Door_CrateriaSave_0                                               ;8F93FC;

RoomHeader_WestOcean:                                                    ;8F93FE;
    %RoomHeader(\
    %room(5),
    %area(0),
    %positions($26, 0),
    %dimensions(8, 6),
    %scrollers($90, $A0),
    %CRE(0),
    %doorList(RoomDoors_WestOcean))
    %stateChecks(0)

RoomState_WestOcean:                                                     ;8F940B;
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
    dw Door_WestOcean_0                                                  ;8F9425;
    dw Door_WestOcean_1                                                  ;8F9427;
    dw Door_WestOcean_2                                                  ;8F9429;
    dw Door_WestOcean_3                                                  ;8F942B;
    dw Door_WestOcean_4                                                  ;8F942D;
    dw Door_WestOcean_5                                                  ;8F942F;

RoomScrolls_WestOcean:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02   ;8F9431;
    db $02,$02,$02,$00,$00,$02,$00,$00,$02,$02,$02,$02,$02,$02,$00,$00   ;8F9441;
    db $02,$02,$02,$02,$02,$02,$02,$02,$01,$01,$01,$01,$01,$01,$01,$01   ;8F9451;

RoomHeader_BowlingAlleyPath:                                             ;8F9461;
    %RoomHeader(\
    %room(6),
    %area(0),
    %positions($29, 2),
    %dimensions(2, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_BowlingAlleyPath))
    %stateChecks(0)

RoomState_BowlingAlleyPath:                                              ;8F946E;
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
    dw Door_BowlingAlleyPath_0                                           ;8F9488;
    dw Door_BowlingAlleyPath_1                                           ;8F948A;

RoomHeader_CrateriaKihunter:                                             ;8F948C;
    %RoomHeader(\
    %room(7),
    %area(0),
    %positions($21, 4),
    %dimensions(3, 3),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_CrateriaKihunter))
    %stateChecks(0)

RoomState_CrateriaKihunter:                                              ;8F9499;
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
    dw Door_CrateriaKihunter_0                                           ;8F94B3;
    dw Door_CrateriaKihunter_1                                           ;8F94B5;
    dw Door_CrateriaKihunter_2                                           ;8F94B7;

RoomScroll_CrateriaKihunter:
    db $01,$01,$01,$00,$00,$00,$00,$02,$00                               ;8F94B9;

RoomPLM_CrateriaKihunter_0:
    db $01,$02, $04,$02, $80                                             ;8F94C2;

RoomPLM_CrateriaKihunter_2:
    db $01,$01, $04,$00, $80                                             ;8F94C7;

RoomHeader_ForgottenHighwayElev:                                         ;8F94CC;
    %RoomHeader(\
    %room(8),
    %area(0),
    %positions($34, $0A),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_ForgottenHighwayElev))
    %stateChecks(0)

RoomState_ForgottenHighwayElev:                                          ;8F94D9;
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
    dw Door_ForgottenHighwayElev_0                                       ;8F94F3;
    dw Door_ForgottenHighwayElev_1                                       ;8F94F5;
    dw Door_VariousRooms_Elevator                                        ;8F94F7;

RoomScrolls_ForgottenHighwayElev:
    db $01                                                               ;8F94F9;

RoomPLM_ForgottenHighwayElev_0:
    db $00,$02, $80                                                      ;8F94FA;

RoomHeader_EastOcean:                                                    ;8F94FD;
    %RoomHeader(\
    %room(9),
    %area(0),
    %positions($31, 0),
    %dimensions(7, 6),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_EastOcean))
    %stateChecks(0)

RoomState_EastOcean:                                                     ;8F950A;
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
    dw Door_EastOcean_0                                                  ;8F9524;
    dw Door_EastOcean_1                                                  ;8F9526;

RoomScrolls_EastOcean:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8F9528;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$02,$02,$02,$02   ;8F9538;
    db $02,$02,$02,$01,$01,$01,$01,$01,$01,$01                           ;8F9548;

RoomHeader_ForgottenHighwayKagos:                                        ;8F9552;
    %RoomHeader(\
    %room($0A),
    %area(0),
    %positions($38, 4),
    %dimensions(1, 4),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_ForgottenHighwayKagos))
    %stateChecks(0)

RoomState_ForgottenHighwayKagos:                                         ;8F955F;
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
    dw Door_ForgottenHighwayKagos_0                                      ;8F9579;
    dw Door_ForgottenHighwayKagos_1                                      ;8F957B;

RoomHeader_CrabMaze:                                                     ;8F957D;
    %RoomHeader(\
    %room($0B),
    %area(0),
    %positions($35, 8),
    %dimensions(4, 2),
    %scrollers($90, $A0),
    %CRE(0),
    %doorList(RoomDoors_CrabMaze))
    %stateChecks(0)

RoomState_CrabMaze:                                                      ;8F958A;
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
    dw Door_CrabMaze_0                                                   ;8F95A4;
    dw Door_CrabMaze_1                                                   ;8F95A6;

RoomHeader_ForgottenHighwayElbow:                                        ;8F95A8;
    %RoomHeader(\
    %room($0C),
    %area(0),
    %positions($34, 9),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_ForgottenHighwayElbow))
    %stateChecks(0)

RoomState_ForgottenHighwayElbow:                                         ;8F95B5;
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
    dw Door_ForgottenHighwayElbow_0                                      ;8F95CF;
    dw Door_ForgottenHighwayElbow_1                                      ;8F95D1;

RoomScrolls_ForgottenHighwayElbow:
    db $02                                                               ;8F95D3;

RoomHeader_CrateriaTube:                                                 ;8F95D4;
    %RoomHeader(\
    %room($0D),
    %area(0),
    %positions($20, 4),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_CrateriaTube))
    %stateChecks(0)

RoomState_CrateriaTube:                                                  ;8F95E1;
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
    dw Door_CrateriaTube_0                                               ;8F95FB;
    dw Door_CrateriaTube_1                                               ;8F95FD;

RoomHeader_Moat:                                                         ;8F95FF;
    %RoomHeader(\
    %room($0E),
    %area(0),
    %positions($24, 4),
    %dimensions(2, 2),
    %scrollers($90, $A0),
    %CRE(0),
    %doorList(RoomDoors_Moat))
    %stateChecks(0)

RoomState_Moat:                                                          ;8F960C;
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
    dw Door_Moat_0                                                       ;8F9626;
    dw Door_Moat_1                                                       ;8F9628;

RoomHeader_RedBinstarElev:                                               ;8F962A;
    %RoomHeader(\
    %room($0F),
    %area(0),
    %positions($22, 7),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_RedBinstarElev))
    %stateChecks(0)

RoomState_RedBinstarElev:                                                ;8F9637;
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
    dw Door_RedBinstarElev_0                                             ;8F9651;
    dw Door_RedBinstarElev_1                                             ;8F9653;
    dw Door_VariousRooms_Elevator                                        ;8F9655;

RoomScrolls_RedBinstarElev:
    db $01                                                               ;8F9657;

RoomPLM_RedBinstarElev_0:
    db $00,$02, $80                                                      ;8F9658;

RoomHeader_GauntletETank:                                                ;8F965B;
    %RoomHeader(\
    %room($10),
    %area(0),
    %positions($0C, 2),
    %dimensions(6, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_GauntletETank))
    %stateChecks(0)

RoomState_GauntletETank:                                                 ;8F9668;
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
    dw Door_GauntletETank_0                                              ;8F9682;
    dw Door_GauntletETank_1                                              ;8F9684;

RoomScrolls_GauntletETank:
    db $01,$01,$01,$01,$00,$01                                           ;8F9686;

RoomPLM_GauntletETank_0:
    db $04,$01, $80                                                      ;8F968C;

RoomHeader_PreBowling:                                                   ;8F968F;
    %RoomHeader(\
    %room($11),
    %area(0),
    %positions($2B, 2),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_PreBowling))
    %stateChecks(0)

RoomState_PreBowling:                                                    ;8F969C;
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
    dw Door_PreBowling_0                                                 ;8F96B6;
    dw Door_PreBowling_1                                                 ;8F96B8;

RoomHeader_Climb:                                                        ;8F96BA;
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

RoomState_Climb_0:                                                       ;8F96D1;
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

RoomState_Climb_1:                                                       ;8F96EB;
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

RoomState_Climb_2:                                                       ;8F9705;
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
    dw Door_Climb_0                                                      ;8F971F;
    dw Door_Climb_1                                                      ;8F9721;
    dw Door_Climb_2                                                      ;8F9723;
    dw Door_Climb_3                                                      ;8F9725;
    dw Door_Climb_4                                                      ;8F9727;

RoomScrolls_Climb:
    db $00,$02,$00,$00,$02,$00,$00,$02,$00,$00,$02,$00,$00,$02,$00,$00   ;8F9729;
    db $02,$00,$00,$02,$00,$00,$02,$00,$00,$01,$00                       ;8F9739;

RoomPLM_Climb_1:
    db $02,$01, $80                                                      ;8F9744;

RoomPLM_Climb_0:
    db $02,$00, $80                                                      ;8F9747;

RoomPLM_Climb_3:
    db $17,$01, $80                                                      ;8F974A;

RoomPLM_Climb_2:
    db $17,$00, $80                                                      ;8F974D;

RoomPLM_Climb_E:
    db $18,$01, $80                                                      ;8F9750;

RoomPLM_Climb_A:
    db $18,$00, $80                                                      ;8F9753;

RoomPLM_Climb_12:
    db $19,$01, $80                                                      ;8F9756;

RoomPLM_Climb_16:
    db $19,$00, $80                                                      ;8F9759;

RoomHeader_Pit:                                                          ;8F975C;
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

RoomState_Pit_0:                                                         ;8F976D;
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

RoomState_Pit_1:                                                         ;8F9787;
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
    dw Door_Pit_0                                                        ;8F97A1;
    dw Door_Pit_1                                                        ;8F97A3;

RoomScrolls_Pit:
    db $01,$01,$01,$00,$00,$00                                           ;8F97A5;

RoomPLM_Pit_0_1:
    db $00,$02, $03,$02, $80                                             ;8F97AB;

RoomPLM_Pit_2:
    db $00,$01, $03,$00, $80                                             ;8F97B0;

RoomHeader_ElevToBlueBrinstar:                                           ;8F97B5;
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

RoomState_ElevToBlueBrinstar_0:                                          ;8F97C6;
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

RoomState_ElevToBlueBrinstar_1:                                          ;8F97E0;
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
    dw Door_ElevToBlueBrinstar_0                                         ;8F97FA;
    dw Door_ElevToBlueBrinstar_1                                         ;8F97FC;
    dw Door_VariousRooms_Elevator                                        ;8F97FE;

RoomScrolls_ElevToBlueBrinstar:
    db $01                                                               ;8F9800;

RoomPLM_ElevToBlueBrinstar:
    db $00,$02, $80                                                      ;8F9801;

RoomHeader_BombTorizo:                                                   ;8F9804;
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

RoomState_BombTorizo_0:                                                  ;8F981B;
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

RoomState_BombTorizo_1:                                                  ;8F9835;
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

RoomState_BombTorizo_2:                                                  ;8F984F;
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
    dw Door_BombTorizo_0                                                 ;8F9869;

RoomVar_BombTorizo:
    db $0F,$0A : dw $0052                                                ;8F986B;
    db $0F,$0B : dw $0052
    db $0F,$0C : dw $0052
    db $00,$00

RoomHeader_Flyway:                                                       ;8F9879;
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

RoomState_Flyway_0:                                                      ;8F9890;
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

RoomState_Flyway_1:                                                      ;8F98AA;
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

RoomState_Flyway_2:                                                      ;8F98C4;
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
    dw Door_Flyway_0                                                     ;8F98DE;
    dw Door_Flyway_1                                                     ;8F98E0;

RoomHeader_PreMapFlyway:                                                 ;8F98E2;
    %RoomHeader(\
    %room($17),
    %area(0),
    %positions($14, 7),
    %dimensions(3, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_PreMapFlyway))
    %stateChecks(0)

RoomState_PreMapFlyway:                                                  ;8F98EF;
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
    dw Door_PreMapFlyway_0                                               ;8F9909;
    dw Door_PreMapFlyway_1                                               ;8F990B;

RoomHeader_Terminator:                                                   ;8F990D;
    %RoomHeader(\
    %room($18),
    %area(0),
    %positions($0C, 4),
    %dimensions(6, 3),
    %scrollers($A0, $A0),
    %CRE(0),
    %doorList(RoomDoors_Terminator))
    %stateChecks(0)

RoomState_Terminator:                                                    ;8F991A;
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
    dw Door_Terminator_0                                                 ;8F9934;
    dw Door_Terminator_1                                                 ;8F9936;

RoomHeader_GreenBrinstarElev:                                            ;8F9938;
    %RoomHeader(\
    %room($19),
    %area(0),
    %positions(6, 8),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_GreenBrinstarElev))
    %stateChecks(0)

RoomState_GreenBrinstarElev:                                             ;8F9945;
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
    dw Door_GreenBrinstarElev_0                                          ;8F995F;
    dw Door_GreenBrinstarElev_1                                          ;8F9961;
    dw Door_VariousRooms_Elevator                                        ;8F9963;

RoomScrolls_GreenBrinstarElev:
    db $01                                                               ;8F9965;

RoomPLM_GreenBrinstarElev_0:
    db $00,$02, $80                                                      ;8F9966;

RoomHeader_LowerMushrooms:                                               ;8F9969;
    %RoomHeader(\
    %room($1A),
    %area(0),
    %positions(7, 8),
    %dimensions(4, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_LowerMushrooms))
    %stateChecks(0)

RoomState_LowerMushrooms:                                                ;8F9976;
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
    dw Door_LowerMushrooms_0                                             ;8F9990;
    dw Door_LowerMushrooms_1                                             ;8F9992;

RoomHeader_CrateriaMap:                                                  ;8F9994;
    %RoomHeader(\
    %room($1B),
    %area(0),
    %positions($17, 7),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_CrateriaMap))
    %stateChecks(0)

RoomState_CrateriaMap:                                                   ;8F99A1;
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
    dw Door_CrateriaMap_0                                                ;8F99BB;

RoomHeader_GreenPiratesShaft:                                            ;8F99BD;
    %RoomHeader(\
    %room($1C),
    %area(0),
    %positions($0B, 2),
    %dimensions(1, 7),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_GreenPiratesShaft))
    %stateChecks(0)

RoomState_GreenPiratesShaft:                                             ;8F99CA;
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
    dw Door_GreenPiratesShaft_0                                          ;8F99E4;
    dw Door_GreenPiratesShaft_1                                          ;8F99E6;
    dw Door_GreenPiratesShaft_2                                          ;8F99E8;
    dw Door_GreenPiratesShaft_3                                          ;8F99EA;

RoomScrolls_GreenPiratesShaft:
    db $02,$02,$02,$00,$02,$02,$01                                       ;8F99EC;

RoomPLM_GreenPiratesShaft_0:
    db $03,$02, $80                                                      ;8F99F3;

RoomPLM_GreenPiratesShaft_2:
    db $03,$00, $80                                                      ;8F99F6;

RoomHeader_CrateriaSuper:                                                ;8F99F9;
    %RoomHeader(\
    %room($1D),
    %area(0),
    %positions($15, 9),
    %dimensions(4, 8),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_CrateriaSuper))
    %stateChecks(0)

RoomState_CrateriaSuper:                                                 ;8F9A06;
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
    dw Door_CrateriaSuper_0                                              ;8F9A20;
    dw Door_CrateriaSuper_1                                              ;8F9A22;

RoomScrolls_CrateriaSuper:
    db $01,$01,$01,$02,$00,$00,$00,$02,$00,$00,$00,$02,$00,$00,$00,$02   ;8F9A24;
    db $00,$00,$00,$02,$00,$00,$00,$02,$00,$00,$00,$02,$01,$01,$01,$01   ;8F9A34;

RoomHeader_FinalMissileBombway:                                          ;8F9A44;
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

RoomState_FinalMissileBombway_0:                                         ;8F9A56;
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

RoomState_FinalMissileBombway_1:                                         ;8F9A70;
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
    dw Door_FinalMissileBombway_0                                        ;8F9A8A;
    dw Door_FinalMissileBombway_1                                        ;8F9A8C;

RoomScrolls_FinalMissileBombway:
    db $01,$01                                                           ;8F9A8E;

RoomHeader_FinalMissile:                                                 ;8F9A90;
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

RoomState_FinalMissile_0:                                                ;8F9AA2;
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

RoomState_FinalMissile_1:                                                ;8F9ABC;
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
    dw Door_FinalMissile_0                                               ;8F9AD6;

RoomScrolls_FinalMissile:
    db $01                                                               ;8F9AD8;

RoomHeader_GreenBrinstarMainShaft:                                       ;8F9AD9;
    %RoomHeader(\
    %room(0),
    %area(1),
    %positions(9, 0),
    %dimensions(4, $0C),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_GreenBrinstarMainShaft))
    %stateChecks(0)

RoomState_GreenBrinstarMainShaft:                                        ;8F9AE6;
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
    dw Door_GreenBrinstarMainShaft_0                                     ;8F9B00;
    dw Door_GreenBrinstarMainShaft_1                                     ;8F9B02;
    dw Door_GreenBrinstarMainShaft_2                                     ;8F9B04;
    dw Door_GreenBrinstarMainShaft_3                                     ;8F9B06;
    dw Door_GreenBrinstarMainShaft_4                                     ;8F9B08;
    dw Door_GreenBrinstarMainShaft_5                                     ;8F9B0A;
    dw Door_GreenBrinstarMainShaft_6                                     ;8F9B0C;
    dw Door_GreenBrinstarMainShaft_7                                     ;8F9B0E;
    dw Door_GreenBrinstarMainShaft_8                                     ;8F9B10;
    dw Door_VariousRooms_Elevator                                        ;8F9B12;
    dw Door_GreenBrinstarMainShaft_A                                     ;8F9B14;

RoomScrolls_GreenBrinstarMainShaft:
    db $02,$00,$00,$00,$02,$00,$00,$00,$02,$00,$00,$00,$02,$00,$00,$00   ;8F9B16;
    db $02,$00,$00,$00,$02,$00,$00,$00,$02,$00,$00,$00,$00,$00,$02,$01   ;8F9B26;
    db $02,$00,$02,$00,$02,$00,$02,$00,$02,$00,$02,$00,$00,$00,$02,$00   ;8F9B36;

RoomPLM_GreenBrinstarMainShaft_0:
    db $1C,$02, $1D,$00, $80                                             ;8F9B46;

RoomPLM_GreenBrinstarMainShaft_1_2:
    db $1C,$00, $1D,$01, $29,$01, $80                                    ;8F9B4B;

RoomPLM_GreenBrinstarMainShaft_3:
    db $18,$02, $1C,$02, $1D,$00, $29,$00, $80                           ;8F9B52;

RoomHeader_SporeSpawnSuper:                                              ;8F9B5B;
    %RoomHeader(\
    %room(1),
    %area(1),
    %positions($17, 1),
    %dimensions(2, 9),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_SporeSpawnSuper))
    %stateChecks(0)

RoomState_SporeSpawnSuper:                                               ;8F9B68;
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
    dw Door_SporeSpawnSuper_0                                            ;8F9B82;
    dw Door_SporeSpawnSuper_1                                            ;8F9B84;

RoomScrolls_SporeSpawnSuper:
    db $01,$02,$00,$02,$00,$02,$00,$02,$00,$02,$00,$02,$00,$02,$00,$02   ;8F9B86;
    db $01,$01                                                           ;8F9B96;

RoomPLM_SporeSpawnSuper_0:
    db $01,$02, $03,$02, $80                                             ;8F9B98;

RoomHeader_BrinstarPreMap:                                               ;8F9B9D;
    %RoomHeader(\
    %room(2),
    %area(1),
    %positions(6, 4),
    %dimensions(3, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_BrinstarPreMap))
    %stateChecks(0)

RoomState_BrinstarPreMap:                                                ;8F9BAA;
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
    dw Door_BrinstarPreMap_0                                             ;8F9BC4;
    dw Door_BrinstarPreMap_1                                             ;8F9BC6;

RoomHeader_EarlySupers:                                                  ;8F9BC8;
    %RoomHeader(\
    %room(3),
    %area(1),
    %positions($0A, 3),
    %dimensions(3, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_EarlySupers))
    %stateChecks(0)

RoomState_EarlySupers:                                                   ;8F9BD5;
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
    dw Door_EarlySupers_0                                                ;8F9BEF;
    dw Door_EarlySupers_1                                                ;8F9BF1;

RoomScrolls_EarlySupers:
    db $00,$00,$00,$01,$01,$01                                           ;8F9BF3;

RoomPLM_EarlySupers_0_4:
    db $00,$02, $01,$02, $02,$02, $80                                    ;8F9BF9;

RoomPLM_EarlySupers_3:
    db $00,$00, $01,$00, $02,$00, $80                                    ;8F9C00;

RoomHeader_BrinstarReserveTank:                                          ;8F9C07;
    %RoomHeader(\
    %room(4),
    %area(1),
    %positions($0D, 4),
    %dimensions(2, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_BrinstarReserveTank))
    %stateChecks(0)

RoomState_BrinstarReserveTank:                                           ;8F9C14;
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
    dw Door_BrinstarReserveTank_0                                        ;8F9C2E;

RoomScrolls_BrinstarReserveTank:
    db $01,$00                                                           ;8F9C30;

RoomPLM_BrinstarReserveTank_0:
    db $01,$01, $80                                                      ;8F9C32;

RoomHeader_GreenBrinstarMap:                                             ;8F9C35;
    %RoomHeader(\
    %room(5),
    %area(1),
    %positions(5, 4),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_GreenBrinstarMap))
    %stateChecks(0)

RoomState_GreenBrinstarMap:                                              ;8F9C42;
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
    dw Door_GreenBrinstarMap_0                                           ;8F9C5C;

RoomHeader_GreenBrinstarFirefleas:                                       ;8F9C5E;
    %RoomHeader(\
    %room(6),
    %area(1),
    %positions(6, 6),
    %dimensions(3, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_GreenBrinstarFirefleas))
    %stateChecks(0)

RoomState_GreenBrinstarFirefleas:                                        ;8F9C6B;
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
    dw Door_GreenBrinstarFirefleas_0                                     ;8F9C85;
    dw Door_GreenBrinstarFirefleas_1                                     ;8F9C87;

RoomHeader_GreenBrinstarMissileRefill:                                   ;8F9C89;
    %RoomHeader(\
    %room(7),
    %area(1),
    %positions(5, 7),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_GreenBrinstarMissileRefill))
    %stateChecks(0)

RoomState_GreenBrinstarMissileRefill:                                    ;8F9C96;
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
    dw Door_GreenBrinstarMissileRefill_0                                 ;8F9CB0;

RoomScrolls_GreenBrinstarMissileRefill:
    db $01                                                               ;8F9CB2;

RoomHeader_Dachora:                                                      ;8F9CB3;
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
    dl LevelData_Dachora                                                 ;8F9CC0;
    db $06,$00,$00                                                       ;8F9CC3;
    dw FXHeader_Dachora                                                  ;8F9CC6;
    dw EnemyPopulations_Dachora                                          ;8F9CC8;
    dw EnemySets_Dachora                                                 ;8F9CCA;
    db $C0,$00                                                           ;8F9CCC;
    dw RoomScrolls_Dachora                                               ;8F9CCE;
    dw $0000                                                             ;8F9CD0;
    dw MainASM_ScrollScreenRightInDachoraRoom                            ;8F9CD2;
    dw PLMPopulation_Dachora                                             ;8F9CD4;
    dw $0000                                                             ;8F9CD6;
    dw RTS_8F91D5                                                        ;8F9CD8;

RoomDoors_Dachora:
    dw Door_Dachora_0                                                    ;8F9CDA;
    dw Door_Dachora_1                                                    ;8F9CDC;
    dw Door_Dachora_2                                                    ;8F9CDE;

RoomScrolls_Dachora:
    db $01,$01,$01,$01,$01,$01,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8F9CE0;
    db $00,$00,$02,$00,$00,$00,$00,$00,$00,$02,$00,$00,$00,$00,$00,$00   ;8F9CF0;
    db $02,$00,$00,$00,$00,$00,$00,$02,$00,$00,$02,$02,$02,$02,$02,$00   ;8F9D00;
    db $00                                                               ;8F9D10;

RoomPLM_Dachora_6:
    db $0B,$02, $80                                                      ;8F9D11;

RoomPLM_Dachora_A_16:
    db $04,$01, $0B,$00, $80                                             ;8F9D14;

RoomHeader_BigPink:                                                      ;8F9D19;
    %RoomHeader(\
    %room(9),
    %area(1),
    %positions($0F, 4),
    %dimensions(5, $0A),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_BigPink))
    %stateChecks(0)

RoomState_BigPink:                                                       ;8F9D26;
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
    dw Door_BigPink_0                                                    ;8F9D40;
    dw Door_BigPink_1                                                    ;8F9D42;
    dw Door_BigPink_2                                                    ;8F9D44;
    dw Door_BigPink_3                                                    ;8F9D46;
    dw Door_BigPink_4                                                    ;8F9D48;
    dw Door_BigPink_5                                                    ;8F9D4A;
    dw Door_BigPink_6                                                    ;8F9D4C;
    dw Door_BigPink_7                                                    ;8F9D4E;
    dw Door_BigPink_8                                                    ;8F9D50;

RoomScrolls_BigPink:
    db $00,$00,$02,$02,$00,$00,$00,$02,$02,$00,$00,$00,$02,$02,$00,$00   ;8F9D52;
    db $00,$02,$02,$00,$00,$00,$02,$02,$00,$00,$00,$02,$02,$00,$00,$00   ;8F9D62;
    db $01,$01,$00,$02,$00,$00,$00,$00,$02,$00,$00,$00,$00,$02,$00,$00   ;8F9D72;
    db $00,$00                                                           ;8F9D82;

RoomPLM_BigPink_0:
    db $20,$02, $25,$02, $26,$02, $80                                    ;8F9D84;

RoomPLM_BigPink_1:
    db $24,$02, $80                                                      ;8F9D8B;

RoomPLM_BigPink_2:
    db $1D,$00, $80                                                      ;8F9D8E;

RoomPLM_BigPink_3:
    db $1C,$01, $1D,$01, $80                                             ;8F9D91;

RoomPLM_BigPink_4:
    db $01,$02, $80                                                      ;8F9D96;

RoomPLM_BigPink_5:
    db $01,$00, $80                                                      ;8F9D99;

RoomHeader_SporeSpawnKihunters:                                          ;8F9D9C;
    %RoomHeader(\
    %room($0A),
    %area(1),
    %positions($13, 4),
    %dimensions(4, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_SporeSpawnKihunters))
    %stateChecks(0)

RoomState_SporeSpawnKihunters:                                           ;8F9DA9;
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
    dw Door_SporeSpawnKihunters_0                                        ;8F9DC3;
    dw Door_SporeSpawnKihunters_1                                        ;8F9DC5;

RoomHeader_SporeSpawn:                                                   ;8F9DC7;
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

RoomState_SporeSpawn_0:                                                  ;8F9DD9;
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

RoomState_SporeSpawn_1:                                                  ;8F9DF3;
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
    dw Door_SporeSpawn_0                                                 ;8F9E0D;
    dw Door_SporeSpawn_1                                                 ;8F9E0F;

RoomHeader_PinkBrinstarPowerBombs:                                       ;8F9E11;
    %RoomHeader(\
    %room($0C),
    %area(1),
    %positions($0F, 7),
    %dimensions(2, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_PinkBrinstarPowerBombs))
    %stateChecks(0)

RoomState_PinkBrinstarPowerBombs:                                        ;8F9E1E;
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
    dw Door_PinkBrinstarPowerBombs_0                                     ;8F9E38;
    dw Door_PinkBrinstarPowerBombs_1                                     ;8F9E3A;

RoomScrolls_PinkBrinstarPowerBombs:
    db $01,$01,$00,$00                                                   ;8F9E3C;

RoomPLM_PinkBrinstarPowerBombs_0:
    db $00,$02, $01,$00, $02,$01, $03,$01, $80                           ;8F9E40;

RoomPLM_PinkBrinstarPowerBombs_1:
    db $00,$01, $01,$01, $02,$00, $03,$00, $80                           ;8F9E49;

RoomHeader_GreenHillZone:                                                ;8F9E52;
    %RoomHeader(\
    %room($0D),
    %area(1),
    %positions($13, $0A),
    %dimensions(8, 4),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_GreenHillZone))
    %stateChecks(0)

RoomState_GreenHillZone:                                                 ;8F9E5F;
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
    dw Door_GreenHillZone_0                                              ;8F9E79;
    dw Door_GreenHillZone_1                                              ;8F9E7B;
    dw Door_GreenHillZone_2                                              ;8F9E7D;

RoomScrolls_GreenHillZone:
    db $02,$02,$00,$00,$00,$00,$00,$00,$02,$02,$02,$02,$00,$00,$00,$00   ;8F9E7F;
    db $02,$02,$02,$02,$02,$02,$02,$02,$01,$01,$01,$01,$01,$01,$01,$01   ;8F9E8F;

RoomHeader_MorphBall:                                                    ;8F9E9F;
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

RoomState_MorphBall_0:                                                   ;8F9EB1;
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

RoomState_MorphBall_1:                                                   ;8F9ECB;
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
    dw Door_MorphBall_0                                                  ;8F9EE5;
    dw Door_MorphBall_1                                                  ;8F9EE7;
    dw Door_MorphBall_2                                                  ;8F9EE9;
    dw Door_VariousRooms_Elevator                                        ;8F9EEB;

RoomScrolls_MorphBall:
    db $00,$00,$00,$00,$00,$02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8F9EED;
    db $01,$01,$01,$01,$01,$01,$01,$01                                   ;8F9EFD;

RoomPLM_MorphBall_0:
    db $12,$01, $80                                                      ;8F9F05;

RoomPLM_MorphBall_9:
    db $12,$00, $80                                                      ;8F9F08;

RoomPLM_MorphBall_B_D:
    db $0D,$02, $80                                                      ;8F9F0B;

RoomPLM_MorphBall_F:
    db $0D,$00, $80                                                      ;8F9F0E;

RoomHeader_ConstructionZone:                                             ;8F9F11;
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

RoomState_ConstructionZone_0:                                            ;8F9F23;
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

RoomState_ConstructionZone_1:                                            ;8F9F3D;
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
    dw Door_ConstructionZone_0                                           ;8F9F57;
    dw Door_ConstructionZone_1                                           ;8F9F59;
    dw Door_ConstructionZone_2                                           ;8F9F5B;

RoomScrolls_ConstructionZone:
    db $01,$00                                                           ;8F9F5D;

RoomPLM_ConstructionZone_0:
    db $00,$02, $01,$01, $80                                             ;8F9F5F;

RoomHeader_BlueBrinstarETank:                                            ;8F9F64;
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

RoomState_BlueBrinstarETank_0:                                           ;8F9F76;
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

RoomState_BlueBrinstarETank_1:                                           ;8F9F90;
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
    dw Door_BlueBrinstarETank_0                                          ;8F9FAA;
    dw Door_BlueBrinstarETank_1                                          ;8F9FAC;

RoomScrolls_BlueBrinstarETank:
    db $00,$00,$02,$00,$00,$00,$01,$01,$01                               ;8F9FAE;

RoomPLM_BlueBrinstarETank_0_1:
    db $05,$02, $80                                                      ;8F9FB7;

RoomHeader_NoobBridge:                                                   ;8F9FBA;
    %RoomHeader(\
    %room($11),
    %area(1),
    %positions($1B, $0D),
    %dimensions(6, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_NoobBridge))
    %stateChecks(0)

RoomState_NoobBridge:                                                    ;8F9FC7;
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
    dw Door_NoobBridge_0                                                 ;8F9FE1;
    dw Door_NoobBridge_1                                                 ;8F9FE3;

RoomHeader_GreenBrinstarBeetoms:                                         ;8F9FE5;
    %RoomHeader(\
    %room($12),
    %area(1),
    %positions(8, $0A),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_GreenBrinstarBeetoms))
    %stateChecks(0)

RoomState_GreenBrinstarBeetoms:                                          ;8F9FF2;
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
    dw Door_GreenBrinstarBeetoms_0                                       ;8FA00C;
    dw Door_GreenBrinstarBeetoms_1                                       ;8FA00E;

RoomScrolls_GreenBrinstarBeetoms:
    db $01                                                               ;8FA010;

RoomHeader_EtecoonETank:                                                 ;8FA011;
    %RoomHeader(\
    %room($13),
    %area(1),
    %positions(6, $0A),
    %dimensions(5, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_EtecoonETank))
    %stateChecks(0)

RoomState_EtecoonETank:                                                  ;8FA01E;
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
    dw Door_EtecoonETank_0                                               ;8FA038;
    dw Door_EtecoonETank_1                                               ;8FA03A;
    dw Door_EtecoonETank_2                                               ;8FA03C;
    dw Door_EtecoonETank_3                                               ;8FA03E;

RoomScrolls_EtecoonETank:
    db $01,$01,$00,$00,$00,$00,$00,$01,$01,$01                           ;8FA040;

RoomPLM_EtecoonETank_0:
    db $01,$02, $05,$01, $06,$01, $80                                    ;8FA04A;

RoomHeader_EtecoonSuper:                                                 ;8FA051;
    %RoomHeader(\
    %room($14),
    %area(1),
    %positions(5, $0A),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_EtecoonSuper))
    %stateChecks(0)

RoomState_EtecoonSuper:                                                  ;8FA05E;
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
    dw Door_EtecoonSuper_0                                               ;8FA078;

RoomScrolls_EtecoonSuper:
    db $01                                                               ;8FA07A;

RoomHeader_DachoraEnergyRefill:                                          ;8FA07B;
    %RoomHeader(\
    %room($15),
    %area(1),
    %positions(9, $0C),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_DachoraEnergyRefill))
    %stateChecks(0)

RoomState_DachoraEnergyRefill:                                           ;8FA088;
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
    dw Door_DachoraEnergyRefill_0                                        ;8FA0A2;

RoomHeader_SporeSpawnFarming:                                            ;8FA0A4;
    %RoomHeader(\
    %room($16),
    %area(1),
    %positions($14, 9),
    %dimensions(3, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_SporeSpawnFarming))
    %stateChecks(0)

RoomState_SporeSpawnFarming:                                             ;8FA0B1;
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
    dw Door_SporeSpawnFarming_0                                          ;8FA0CB;
    dw Door_SporeSpawnFarming_1                                          ;8FA0CD;

RoomScrolls_SporeSpawnFarming:
    db $01,$01,$01                                                       ;8FA0CF;

RoomHeader_WaterwayETank:                                                ;8FA0D2;
    %RoomHeader(\
    %room($17),
    %area(1),
    %positions(8, $0D),
    %dimensions(7, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_WaterwayETank))
    %stateChecks(0)

RoomState_WaterwayETank:                                                 ;8FA0DF;
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
    dw Door_WaterwayETank_0                                              ;8FA0F9;
    dw Door_WaterwayETank_1                                              ;8FA0FB;

RoomScrolls_WaterwayETank:
    db $00,$01,$01,$01,$01,$01,$01                                       ;8FA0FD;

RoomPLM_WaterwayETank:
    db $00,$01, $80                                                      ;8FA104;

RoomHeader_FirstMissile:                                                 ;8FA107;
    %RoomHeader(\
    %room($18),
    %area(1),
    %positions($1C, $0B),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_FirstMissile))
    %stateChecks(0)

RoomState_FirstMissile:                                                  ;8FA114;
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
    dw Door_FirstMissile_0                                               ;8FA12E;

RoomHeader_PinkBrinstarHoppers:                                          ;8FA130;
    %RoomHeader(\
    %room($19),
    %area(1),
    %positions($13, 7),
    %dimensions(2, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_PinkBrinstarHoppers))
    %stateChecks(0)

RoomState_PinkBrinstarHoppers:                                           ;8FA13D;
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
    dw Door_PinkBrinstarHoppers_0                                        ;8FA157;
    dw Door_PinkBrinstarHoppers_1                                        ;8FA159;

RoomHeader_HopperETank:                                                  ;8FA15B;
    %RoomHeader(\
    %room($1A),
    %area(1),
    %positions($15, 8),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_HopperETank))
    %stateChecks(0)

RoomState_HopperETank:                                                   ;8FA168;
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
    dw Door_HopperETank_0                                                ;8FA182;

RoomHeader_BigPinkSaveRoom:                                              ;8FA184;
    %RoomHeader(\
    %room($1B),
    %area(1),
    %positions($0F, 4),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_BigPinkSaveRoom))
    %stateChecks(0)

RoomState_BigPinkSaveRoom:                                               ;8FA191;
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
    dw Door_BigPinkSaveRoom_0                                            ;8FA1AB;

RoomHeader_BlueBrinstarBoulders:                                         ;8FA1AD;
    %RoomHeader(\
    %room($1C),
    %area(1),
    %positions($1E, 8),
    %dimensions(2, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_BlueBrinstarBoulders))
    %stateChecks(0)

RoomState_BlueBrinstarBoulders:                                          ;8FA1BA;
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
    dw Door_BlueBrinstarBoulders_0                                       ;8FA1D4;
    dw Door_BlueBrinstarBoulders_1                                       ;8FA1D6;

RoomHeader_BillyMays:                                                    ;8FA1D8;
    %RoomHeader(\
    %room($1D),
    %area(1),
    %positions($1D, 8),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_BillyMays))
    %stateChecks(0)

RoomState_BillyMays:                                                     ;8FA1E5;
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
    dw Door_BillyMays_0                                                  ;8FA1FF;

RoomHeader_GreenBrinstarSave:                                            ;8FA201;
    %RoomHeader(\
    %room($1E),
    %area(1),
    %positions(8, 5),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_GreenBrinstarSave))
    %stateChecks(0)

RoomState_GreenBrinstarSave:                                             ;8FA20E;
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
    dw Door_GreenBrinstarSave_0                                          ;8FA228;

RoomHeader_EtecoonSave:                                                  ;8FA22A;
    %RoomHeader(\
    %room($1F),
    %area(1),
    %positions(5, $0B),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_EtecoonSave))
    %stateChecks(0)

RoomState_EtecoonSave:                                                   ;8FA237;
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
    dw Door_EtecoonSave_0                                                ;8FA251;

RoomHeader_RedTower:                                                     ;8FA253;
    %RoomHeader(\
    %room($20),
    %area(1),
    %positions($21, 9),
    %dimensions(1, $0A),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_RedTower))
    %stateChecks(0)

RoomState_RedTower:                                                      ;8FA260;
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
    dw Door_RedTower_0                                                   ;8FA27A;
    dw Door_RedTower_1                                                   ;8FA27C;
    dw Door_RedTower_2                                                   ;8FA27E;
    dw Door_RedTower_3                                                   ;8FA280;
    dw Door_RedTower_4                                                   ;8FA282;

RoomScrolls_RedTower:
    db $02,$02,$02,$02,$02,$02,$01,$00,$02,$02                           ;8FA284;

RoomPLM_RedTower_0:
    db $06,$02, $07,$02, $80                                             ;8FA28E;

RoomHeader_RedBrinstarFirefleas:                                         ;8FA293;
    %RoomHeader(\
    %room($21),
    %area(1),
    %positions($19, $0F),
    %dimensions(8, 2),
    %scrollers($90, $A0),
    %CRE(0),
    %doorList(RoomDoors_RedBrinstarFirefleas))
    %stateChecks(0)

RoomState_RedBrinstarFirefleas:                                          ;8FA2A0;
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
    dw Door_RedBrinstarFirefleas_0                                       ;8FA2BA;
    dw Door_RedBrinstarFirefleas_1                                       ;8FA2BC;

RoomScrolls_RedBrinstarFirefleas:
    db $02,$02,$01,$01,$02,$02,$01,$01,$01,$01,$00,$00,$01,$01,$00,$00   ;8FA2BE;

RoomHeader_XrayScope:                                                    ;8FA2CE;
    %RoomHeader(\
    %room($22),
    %area(1),
    %positions($17, $0F),
    %dimensions(2, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_XrayScope))
    %stateChecks(0)

RoomState_XrayScope:                                                     ;8FA2DB;
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
    dw Door_XrayScope_0                                                  ;8FA2F5;

RoomHeader_Hellway:                                                      ;8FA2F7;
    %RoomHeader(\
    %room($23),
    %area(1),
    %positions($22, 9),
    %dimensions(3, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_Hellway))
    %stateChecks(0)

RoomState_Hellway:                                                       ;8FA304;
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
    dw Door_Hellway_0                                                    ;8FA31E;
    dw Door_Hellway_1                                                    ;8FA320;

RoomHeader_Caterpillar:                                                  ;8FA322;
    %RoomHeader(\
    %room($24),
    %area(1),
    %positions($25, 4),
    %dimensions(3, 8),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_Caterpillar))
    %stateChecks(0)

RoomState_Caterpillar:                                                   ;8FA32F;
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
    dw Door_Caterpillar_0                                                ;8FA349;
    dw Door_Caterpillar_1                                                ;8FA34B;
    dw Door_Caterpillar_2                                                ;8FA34D;
    dw Door_Caterpillar_3                                                ;8FA34F;
    dw Door_Caterpillar_4                                                ;8FA351;
    dw Door_VariousRooms_Elevator                                        ;8FA353;
    dw Door_Caterpillar_6                                                ;8FA355;

RoomScrolls_Caterpillar:
    db $02,$00,$00,$02,$00,$00,$02,$00,$00,$02,$00,$01,$02,$00,$00,$01   ;8FA357;
    db $00,$00,$00,$00,$00,$02,$00,$00                                   ;8FA367;

RoomPLM_Caterpillar_0:
    db $0F,$02, $12,$02, $80                                             ;8FA36F;

RoomPLM_Caterpillar_2:
    db $0A,$01, $09,$02, $80                                             ;8FA374;

RoomPLM_Caterpillar_3:
    db $0A,$00, $80                                                      ;8FA379;

RoomHeader_BetaPowerBomb:                                                ;8FA37C;
    %RoomHeader(\
    %room($25),
    %area(1),
    %positions($23, 7),
    %dimensions(2, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_BetaPowerBomb))
    %stateChecks(0)

RoomState_BetaPowerBomb:                                                 ;8FA389;
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
    dw Door_BetaPowerBomb_0                                              ;8FA3A3;

RoomScrolls_BetaPowerBomb:
    db $01,$01,$00,$00                                                   ;8FA3A5;

RoomPLM_BetaPowerBomb_0:
    db $00,$02, $02,$01, $80                                             ;8FA3A9;

RoomHeader_AlphaPowerBomb:                                               ;8FA3AE;
    %RoomHeader(\
    %room($26),
    %area(1),
    %positions($22, $0B),
    %dimensions(3, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_AlphaPowerBomb))
    %stateChecks(0)

RoomState_AlphaPowerBomb:                                                ;8FA3BB;
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
    dw Door_AlphaPowerBomb_0                                             ;8FA3D5;

RoomScrolls_AlphaPowerBomb:
    db $00,$01,$01                                                       ;8FA3D7;

RoomPLM_AlphaPowerBomb_8:
    db $00,$01, $80                                                      ;8FA3DA;

RoomHeader_SkreeBoost:                                                   ;8FA3DD;
    %RoomHeader(\
    %room($27),
    %area(1),
    %positions($22, $12),
    %dimensions(2, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_SkreeBoost))
    %stateChecks(0)

RoomState_SkreeBoost:                                                    ;8FA3EA;
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
    dw Door_SkreeBoost_0                                                 ;8FA404;
    dw Door_SkreeBoost_1                                                 ;8FA406;

RoomHeader_BelowSpazer:                                                  ;8FA408;
    %RoomHeader(\
    %room($28),
    %area(1),
    %positions($24, $11),
    %dimensions(2, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_BelowSpazer))
    %stateChecks(0)

RoomState_BelowSpazer:                                                   ;8FA415;
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
    dw Door_BelowSpazer_0                                                ;8FA42F;
    dw Door_BelowSpazer_1                                                ;8FA431;
    dw Door_BelowSpazer_2                                                ;8FA433;

RoomScrolls_BelowSpazer:
    db $00,$00,$01,$01                                                   ;8FA435;

RoomPLM_BelowSpazer_0_8_A:
    db $00,$02, $01,$02, $80                                             ;8FA439;

RoomPLM_BelowSpazer_4_9_B:
    db $00,$00, $01,$00, $02,$01, $03,$01, $80                           ;8FA43E;

RoomHeader_Spazer:                                                       ;8FA447;
    %RoomHeader(\
    %room($29),
    %area(1),
    %positions($26, $11),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_Spazer))
    %stateChecks(0)

RoomState_Spazer:                                                        ;8FA454;
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
    dw Door_Spazer_0                                                     ;8FA46E;

RoomScrolls_Spazer:
    db $01                                                               ;8FA470;

RoomHeader_WarehouseZeela:                                               ;8FA471;
    %RoomHeader(\
    %room($2A),
    %area(1),
    %positions($2C, $12),
    %dimensions(2, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_WarehouseZeela))
    %stateChecks(0)

RoomState_WarehouseZeela:                                                ;8FA47E;
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
    dw Door_WarehouseZeela_0                                             ;8FA498;
    dw Door_WarehouseZeela_1                                             ;8FA49A;
    dw Door_WarehouseZeela_2                                             ;8FA49C;

RoomScrolls_WarehouseZeela:
    db $01,$00,$00,$01                                                   ;8FA49E;

RoomPLM_WarehouseZeela_0:
    db $00,$02, $02,$01, $03,$00, $80                                    ;8FA4A2;

RoomPLM_WarehouseZeela_1_3:
    db $00,$02, $02,$01, $80                                             ;8FA4A9;

RoomPLM_WarehouseZeela_2:
    db $03,$01, $80                                                      ;8FA4AE;

RoomHeader_WarehouseETank:                                               ;8FA4B1;
    %RoomHeader(\
    %room($2B),
    %area(1),
    %positions($2B, $13),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_WarehouseETank))
    %stateChecks(0)

RoomState_WarehouseETank:                                                ;8FA4BE;
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
    dw Door_WarehouseETank_0                                             ;8FA4D8;

RoomHeader_WarehouseKihunter:                                            ;8FA4DA;
    %RoomHeader(\
    %room($2C),
    %area(1),
    %positions($2D, $12),
    %dimensions(4, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_WarehouseKihunter))
    %stateChecks(0)

RoomState_WarehouseKihunter:                                             ;8FA4E7;
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
    dw Door_WarehouseKihunter_0                                          ;8FA501;
    dw Door_WarehouseKihunter_1                                          ;8FA503;
    dw Door_WarehouseKihunter_2                                          ;8FA505;

RoomScrolls_WarehouseKihunter:
    db $02,$01,$01,$00,$00,$01,$00,$00                                   ;8FA507;

RoomPLM_WarehouseKihunter_0:
    db $01,$01, $05,$00, $80                                             ;8FA50F;

RoomPLM_WarehouseKihunter_1:
    db $01,$02, $05,$01, $80                                             ;8FA514;

RoomPLM_WarehouseKihunter_9:
    db $05,$00, $80                                                      ;8FA519;

RoomPLM_WarehouseKihunter_A_B:
    db $03,$01, $05,$00, $80                                             ;8FA51C;

RoomHeader_MiniKraid:                                                    ;8FA521;
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

RoomState_MiniKraid_0:                                                   ;8FA533;
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

RoomState_MiniKraid_1:                                                   ;8FA54D;
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
    dw Door_MiniKraid_0                                                  ;8FA567;
    dw Door_MiniKraid_1                                                  ;8FA569;

RoomHeader_KraidEyeDoor:                                                 ;8FA56B;
    %RoomHeader(\
    %room($2E),
    %area(1),
    %positions($35, $12),
    %dimensions(2, 2),
    %scrollers($70, $A0),
    %CRE(2),
    %doorList(RoomDoors_KraidEyeDoor))
    %stateChecks(0)

RoomState_KraidEyeDoor:                                                  ;8FA578;
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
    dw Door_KraidEyeDoor_0                                               ;8FA592;
    dw Door_KraidEyeDoor_1                                               ;8FA594;
    dw Door_KraidEyeDoor_2                                               ;8FA596;

RoomScrolls_KraidEyeDoor:
    db $00,$00,$01,$01                                                   ;8FA598;

RoomPLM_KraidEyeDoor_0:
    db $00,$02, $80                                                      ;8FA59C;

RoomHeader_Kraid:                                                        ;8FA59F;
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

RoomState_Kraid_0:                                                       ;8FA5B1;
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

RoomState_Kraid_1:                                                       ;8FA5CB;
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
    dw Door_Kraid_0                                                      ;8FA5E5;
    dw Door_Kraid_1                                                      ;8FA5E7;

RoomScrolls_Kraid:
    db $02,$02,$01,$01                                                   ;8FA5E9;

RoomHeader_StatuesHallway:                                               ;8FA5ED;
    %RoomHeader(\
    %room($30),
    %area(0),
    %positions($0C, 8),
    %dimensions(5, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_StatuesHallway))
    %stateChecks(0)

RoomState_StatuesHallway:                                                ;8FA5FA;
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
    dw Door_StatuesHallway_0                                             ;8FA614;
    dw Door_StatuesHallway_1                                             ;8FA616;

RoomHeader_RedTowerRefill:                                               ;8FA618;
    %RoomHeader(\
    %room($31),
    %area(1),
    %positions($20, $12),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_RedTowerRefill))
    %stateChecks(0)

RoomState_RedTowerRefill:                                                ;8FA625;
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
    dw Door_RedTowerRefill_0                                             ;8FA63F;

RoomHeader_KraidRefill:                                                  ;8FA641;
    %RoomHeader(\
    %room($32),
    %area(1),
    %positions($36, $12),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_KraidRefill))
    %stateChecks(0)

RoomState_KraidRefill:                                                   ;8FA64E;
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
    dw Door_KraidRefill_0                                                ;8FA668;

RoomHeader_Statues:                                                      ;8FA66A;
    %RoomHeader(\
    %room($33),
    %area(0),
    %positions($11, 8),
    %dimensions(1, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_Statues))
    %stateChecks(0)

RoomState_Statues:                                                       ;8FA677;
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
    dw Door_Statues_0                                                    ;8FA691;
    dw Door_Statues_1                                                    ;8FA693;
    dw Door_VariousRooms_Elevator                                        ;8FA695;

RoomScrolls_Statues:
    db $01,$00                                                           ;8FA697;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_RoomPLM_8FA699:
    db $00,$02, $01,$01, $80                                             ;8FA699;

UNUSED_RoomPLM_8FA69E:
    db $01,$02, $80                                                      ;8FA69E;
endif ; !FEATURE_KEEP_UNREFERENCED

RoomHeader_WarehouseEntrance:                                            ;8FA6A1;
    %RoomHeader(\
    %room($34),
    %area(1),
    %positions($29, $12),
    %dimensions(3, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_WarehouseEntrance))
    %stateChecks(0)

RoomState_WarehouseEntrance:                                             ;8FA6AE;
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
    dw Door_WarehouseEntrance_0                                          ;8FA6C8;
    dw Door_WarehouseEntrance_1                                          ;8FA6CA;
    dw Door_WarehouseEntrance_2                                          ;8FA6CC;
    dw Door_VariousRooms_Elevator                                        ;8FA6CE;

RoomScrolls_WarehouseEntrance:
    db $01,$00,$02,$00,$01,$01                                           ;8FA6D0;

RoomPLM_WarehouseEntrance_0:
    db $00,$02, $80                                                      ;8FA6D6;

RoomPLM_WarehouseEntrance_2:
    db $01,$02, $80                                                      ;8FA6D9;

RoomPLM_WarehouseEntrance_5:
    db $00,$01, $80                                                      ;8FA6DC;

RoomPLM_WarehouseEntrance_9:
    db $00,$00, $80                                                      ;8FA6DF;

RoomHeader_VariaSuit:                                                    ;8FA6E2;
    %RoomHeader(\
    %room($35),
    %area(1),
    %positions($39, $13),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(2),
    %doorList(RoomDoors_VariaSuit))
    %stateChecks(0)

RoomState_VariaSuit:                                                     ;8FA6EF;
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
    dw Door_VariaSuit_0                                                  ;8FA709;

RoomHeader_WarehouseSave:                                                ;8FA70B;
    %RoomHeader(\
    %room($36),
    %area(1),
    %positions($31, $12),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_WarehouseSave))
    %stateChecks(0)

RoomState_WarehouseSave:                                                 ;8FA718;
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
    dw Door_WarehouseSave_0                                              ;8FA732;

RoomHeader_RedBrinstarSave:                                              ;8FA734;
    %RoomHeader(\
    %room($37),
    %area(1),
    %positions($26, 8),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_RedBrinstarSave))
    %stateChecks(0)

RoomState_RedBrinstarSave:                                               ;8FA741;
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
    dw Door_RedBrinstarSave_0                                            ;8FA75B;

RoomHeader_IceBeamAcid:                                                  ;8FA75D;
    %RoomHeader(\
    %room(0),
    %area(2),
    %positions(4, 3),
    %dimensions(2, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_IceBeamAcid))
    %stateChecks(0)

RoomState_IceBeamAcid:                                                   ;8FA76A;
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
    dw Door_IceBeamAcid_0                                                ;8FA784;
    dw Door_IceBeamAcid_1                                                ;8FA786;

RoomHeader_Cathedral:                                                    ;8FA788;
    %RoomHeader(\
    %room(1),
    %area(2),
    %positions($0E, 3),
    %dimensions(3, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_Cathedral))
    %stateChecks(0)

RoomState_Cathedral:                                                     ;8FA795;
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
    dw Door_Cathedral_0                                                  ;8FA7AF;
    dw Door_Cathedral_1                                                  ;8FA7B1;

RoomHeader_CathedralEntrance:                                            ;8FA7B3;
    %RoomHeader(\
    %room(2),
    %area(2),
    %positions($0B, 3),
    %dimensions(3, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_CathedralEntrance))
    %stateChecks(0)

RoomState_CathedralEntrance:                                             ;8FA7C0;
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
    dw Door_CathedralEntrance_0                                          ;8FA7DA;
    dw Door_CathedralEntrance_1                                          ;8FA7DC;

RoomHeader_BusinessCenter:                                               ;8FA7DE;
    %RoomHeader(\
    %room(3),
    %area(2),
    %positions($0A, 0),
    %dimensions(1, 7),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_BusinessCenter))
    %stateChecks(0)

RoomState_BusinessCenter:                                                ;8FA7EB;
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
    dw Door_BusinessCenter_0                                             ;8FA805;
    dw Door_BusinessCenter_1                                             ;8FA807;
    dw Door_BusinessCenter_2                                             ;8FA809;
    dw Door_BusinessCenter_3                                             ;8FA80B;
    dw Door_BusinessCenter_4                                             ;8FA80D;
    dw Door_VariousRooms_Elevator                                        ;8FA80F;
    dw Door_BusinessCenter_6                                             ;8FA811;
    dw Door_BusinessCenter_7                                             ;8FA813;

RoomHeader_IceBeamGate:                                                  ;8FA815;
    %RoomHeader(\
    %room(4),
    %area(2),
    %positions(3, 1),
    %dimensions(7, 4),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_IceBeamGate))
    %stateChecks(0)

RoomState_IceBeamGate:                                                   ;8FA822;
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
    dw Door_IceBeamGate_0                                                ;8FA83C;
    dw Door_IceBeamGate_1                                                ;8FA83E;
    dw Door_IceBeamGate_2                                                ;8FA840;
    dw Door_IceBeamGate_3                                                ;8FA842;

RoomScrolls_IceBeamGate:
    db $00,$00,$00,$02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8FA844;
    db $00,$01,$01,$01,$01,$01,$01,$01,$00,$00,$00,$00                   ;8FA854;

RoomPLM_IceBeamGate_0:
    db $11,$02, $18,$01, $80                                             ;8FA860;

RoomHeader_IceBeamTutorial:                                              ;8FA865;
    %RoomHeader(\
    %room(5),
    %area(2),
    %positions(4, 1),
    %dimensions(2, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_IceBeamTutorial))
    %stateChecks(0)

RoomState_IceBeamTutorial:                                               ;8FA872;
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
    dw Door_IceBeamTutorial_0                                            ;8FA88C;
    dw Door_IceBeamTutorial_1                                            ;8FA88E;

RoomHeader_IceBeam:                                                      ;8FA890;
    %RoomHeader(\
    %room(6),
    %area(2),
    %positions(5, 2),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_IceBeam))
    %stateChecks(0)

RoomState_IceBeam:                                                       ;8FA89D;
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
    dw Door_IceBeam_0                                                    ;8FA8B7;

RoomHeader_IceBeamSnake:                                                 ;8FA8B9;
    %RoomHeader(\
    %room(7),
    %area(2),
    %positions(3, 1),
    %dimensions(2, 3),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_IceBeamSnake))
    %stateChecks(0)

RoomState_IceBeamSnake:                                                  ;8FA8C6;
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
    dw Door_IceBeamSnake_0                                               ;8FA8E0;
    dw Door_IceBeamSnake_1                                               ;8FA8E2;
    dw Door_IceBeamSnake_2                                               ;8FA8E4;

RoomScrolls_IceBeamSnake:
    db $02,$00,$02,$00,$01,$00                                           ;8FA8E6;

RoomPLM_IceBeamSnake_0:
    db $03,$01, $80                                                      ;8FA8EC;

RoomPLM_IceBeamSnake_1:
    db $03,$00, $80                                                      ;8FA8EF;

RoomPLM_IceBeamSnake_2:
    db $02,$02, $80                                                      ;8FA8F2;

RoomPLM_IceBeamSnake_3:
    db $02,$00, $80                                                      ;8FA8F5;

RoomHeader_CrumbleShaft:                                                 ;8FA8F8;
    %RoomHeader(\
    %room(8),
    %area(2),
    %positions(2, 4),
    %dimensions(1, 4),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_CrumbleShaft))
    %stateChecks(0)

RoomState_CrumbleShaft:                                                  ;8FA905;
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
    dw Door_CrumbleShaft_0                                               ;8FA91F;
    dw Door_CrumbleShaft_1                                               ;8FA921;

RoomHeader_CrocomireSpeedway:                                            ;8FA923;
    %RoomHeader(\
    %room(9),
    %area(2),
    %positions(3, 7),
    %dimensions($0D, 3),
    %scrollers($70, $A0),
    %CRE(2),
    %doorList(RoomDoors_CrocomireSpeedway))
    %stateChecks(0)

RoomState_CrocomireSpeedway:                                             ;8FA930;
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
    dw Door_CrocomireSpeedway_0                                          ;8FA94A;
    dw Door_CrocomireSpeedway_1                                          ;8FA94C;
    dw Door_CrocomireSpeedway_2                                          ;8FA94E;
    dw Door_CrocomireSpeedway_3                                          ;8FA950;
    dw Door_CrocomireSpeedway_4                                          ;8FA952;

RoomScrolls_CrocomireSpeedway:
    db $01,$01,$01,$02,$02,$00,$00,$00,$00,$00,$00,$00,$02,$00,$00,$00   ;8FA954;
    db $02,$02,$02,$02,$00,$00,$00,$00,$00,$02,$00,$00,$00,$00,$00,$02   ;8FA964;
    db $02,$02,$02,$02,$02,$00,$02                                       ;8FA974;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_RoomPLM_8FA97B:
    db $19,$02, $26,$02, $80                                             ;8FA97B;
endif ; !FEATURE_KEEP_UNREFERENCED

RoomPLM_CrocomireSpeedway_0:
    db $19,$02, $25,$02, $26,$02, $80                                    ;8FA980;

RoomPLM_CrocomireSpeedway_5:
    db $25,$02, $80                                                      ;8FA987;

RoomPLM_CrocomireSpeedway_8:
    db $25,$00, $80                                                      ;8FA98A;

RoomHeader_Crocomire:                                                    ;8FA98D;
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

RoomState_Crocomire_0:                                                   ;8FA99F;
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

RoomState_Crocomire_1:                                                   ;8FA9B9;
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
    dw Door_Crocomire_0                                                  ;8FA9D3;
    dw Door_Crocomire_1                                                  ;8FA9D5;

RoomScrolls_Crocomire:
    db $00,$00,$01,$01,$01,$01,$01,$01                                   ;8FA9D7;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_RoomPLM_8FA9DF:
    db $01,$01, $80                                                      ;8FA9DF;

UNUSED_RoomPLM_8FA9E2:
    db $00,$01, $80                                                      ;8FA9E2;
endif ; !FEATURE_KEEP_UNREFERENCED

RoomHeader_HiJumpBoots:                                                  ;8FA9E5;
    %RoomHeader(\
    %room($0B),
    %area(2),
    %positions(7, 6),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_HiJumpBoots))
    %stateChecks(0)

RoomState_HiJumpBoots:                                                   ;8FA9F2;
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
    dw Door_HiJumpBoots_0                                                ;8FAA0C;

RoomHeader_CrocomireEscape:                                              ;8FAA0E;
    %RoomHeader(\
    %room($0C),
    %area(2),
    %positions($0B, 6),
    %dimensions(4, 2),
    %scrollers($90, $A0),
    %CRE(0),
    %doorList(RoomDoors_CrocomireEscape))
    %stateChecks(0)

RoomState_CrocomireEscape:                                               ;8FAA1B;
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
    dw Door_CrocomireEscape_0                                            ;8FAA35;
    dw Door_CrocomireEscape_1                                            ;8FAA37;

RoomScrolls_CrocomireEscape:
    db $02,$02,$02,$02,$01,$01,$01,$01                                   ;8FAA39;

RoomHeader_HiJumpETank:                                                  ;8FAA41;
    %RoomHeader(\
    %room($0D),
    %area(2),
    %positions(8, 5),
    %dimensions(2, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_HiJumpETank))
    %stateChecks(0)

RoomState_HiJumpETank:                                                   ;8FAA4E;
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
    dw Door_HiJumpETank_0                                                ;8FAA68;
    dw Door_HiJumpETank_1                                                ;8FAA6A;

RoomScrolls_HiJumpETank:
    db $00,$01,$00,$00                                                   ;8FAA6C;

RoomPLM_HiJumpETank_1:
    db $00,$02, $02,$02, $80                                             ;8FAA70;

RoomPLM_HiJumpETank_0:
    db $00,$02, $02,$02, $03,$02, $80                                    ;8FAA75;

RoomPLM_HiJumpETank_2:
    db $03,$00, $80                                                      ;8FAA7C;

RoomPLM_HiJumpETank_3:
    db $03,$02, $80                                                      ;8FAA7F;

RoomHeader_PostCrocFarming:                                              ;8FAA82;
    %RoomHeader(\
    %room($0E),
    %area(2),
    %positions($0A, $0A),
    %dimensions(2, 2),
    %scrollers($90, $A0),
    %CRE(2),
    %doorList(RoomDoors_PostCrocFarming))
    %stateChecks(0)

RoomState_PostCrocFarming:                                               ;8FAA8F;
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
    dw Door_PostCrocFarming_0                                            ;8FAAA9;
    dw Door_PostCrocFarming_1                                            ;8FAAAB;
    dw Door_PostCrocFarming_2                                            ;8FAAAD;
    dw Door_PostCrocFarming_3                                            ;8FAAAF;

RoomScrolls_PostCrocFarming:
    db $02,$02,$02,$02                                                   ;8FAAB1;

RoomHeader_PostCrocSave:                                                 ;8FAAB5;
    %RoomHeader(\
    %room($0F),
    %area(2),
    %positions($0C, $0B),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_PostCrocSave))
    %stateChecks(0)

RoomState_PostCrocSave:                                                  ;8FAAC2;
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
    dw Door_PostCrocSave_0                                               ;8FAADC;

RoomHeader_PostCrocPowerBombs:                                           ;8FAADE;
    %RoomHeader(\
    %room($10),
    %area(2),
    %positions(9, $0A),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_PostCrocPowerBombs))
    %stateChecks(0)

RoomState_PostCrocPowerBombs:                                            ;8FAAEB;
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
    %libraryBG(LibBG_Norfair_9_A_CavernStalactites),
    %setupASM(RTS_8F91F6))

RoomDoors_PostCrocPowerBombs:
    dw Door_PostCrocPowerBombs_0                                         ;8FAB05;

RoomHeader_PostCrocShaft:                                                ;8FAB07;
    %RoomHeader(\
    %room($11),
    %area(2),
    %positions($0A, $0C),
    %dimensions(1, 5),
    %scrollers($90, $A0),
    %CRE(0),
    %doorList(RoomDoors_PostCrocShaft))
    %stateChecks(0)

RoomState_PostCrocShaft:                                                 ;8FAB14;
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
    dw Door_PostCrocShaft_0                                              ;8FAB2E;
    dw Door_PostCrocShaft_1                                              ;8FAB30;
    dw Door_PostCrocShaft_2                                              ;8FAB32;
    dw Door_PostCrocShaft_3                                              ;8FAB34;

RoomScrolls_PostCrocShaft:
    db $02,$02,$02,$02,$02                                               ;8FAB36;

RoomHeader_PostCrocMissile:                                              ;8FAB3B;
    %RoomHeader(\
    %room($12),
    %area(2),
    %positions($0B, $0F),
    %dimensions(4, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_PostCrocMissile))
    %stateChecks(0)

RoomState_PostCrocMissile:                                               ;8FAB48;
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
    %libraryBG(LibBG_Norfair_9_A_CavernStalactites),
    %setupASM(RTS_8F91F6))

RoomDoors_PostCrocMissile:
    dw Door_PostCrocMissile_0                                            ;8FAB62;

RoomHeader_GrappleTutorial3:                                             ;8FAB64;
    %RoomHeader(\
    %room($13),
    %area(2),
    %positions(7, $0C),
    %dimensions(3, 2),
    %scrollers($90, $A0),
    %CRE(0),
    %doorList(RoomDoors_GrappleTutorial3))
    %stateChecks(0)

RoomState_GrappleTutorial3:                                              ;8FAB71;
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
    dw Door_GrappleTutorial3_0                                           ;8FAB8B;
    dw Door_GrappleTutorial3_1                                           ;8FAB8D;

RoomHeader_PostCrocJump:                                                 ;8FAB8F;
    %RoomHeader(\
    %room($14),
    %area(2),
    %positions(4, $0F),
    %dimensions(8, 3),
    %scrollers($90, $A0),
    %CRE(0),
    %doorList(RoomDoors_PostCrocJump))
    %stateChecks(0)

RoomState_PostCrocJump:                                                  ;8FAB9C;
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
    dw Door_PostCrocJump_0                                               ;8FABB6;
    dw Door_PostCrocJump_1                                               ;8FABB8;

RoomScrolls_PostCrocJump:
    db $02,$02,$02,$02,$02,$00,$00,$00,$02,$02,$02,$02,$02,$00,$00,$00   ;8FABBA;
    db $01,$01,$01,$01,$01,$01,$01,$01                                   ;8FABCA;

RoomHeader_GrappleTutorial2:                                             ;8FABD2;
    %RoomHeader(\
    %room($15),
    %area(2),
    %positions(6, $0C),
    %dimensions(1, 3),
    %scrollers($90, $A0),
    %CRE(0),
    %doorList(RoomDoors_GrappleTutorial2))
    %stateChecks(0)

RoomState_GrappleTutorial2:                                              ;8FABDF;
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
    dw Door_GrappleTutorial2_0                                           ;8FABF9;
    dw Door_GrappleTutorial2_1                                           ;8FABFB;

RoomScrolls_GrappleTutorial2:
    db $02,$02,$01                                                       ;8FABFD;

RoomHeader_GrappleTutorial1:                                             ;8FAC00;
    %RoomHeader(\
    %room($16),
    %area(2),
    %positions(4, $0E),
    %dimensions(2, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_GrappleTutorial1))
    %stateChecks(0)

RoomState_GrappleTutorial1:                                              ;8FAC0D;
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
    %libraryBG(LibBG_Norfair_9_A_CavernStalactites),
    %setupASM(RTS_8F91F6))

RoomDoors_GrappleTutorial1:
    dw Door_GrappleTutorial1_0                                           ;8FAC27;
    dw Door_GrappleTutorial1_1                                           ;8FAC29;

RoomHeader_GrappleBeam:                                                  ;8FAC2B;
    %RoomHeader(\
    %room($17),
    %area(2),
    %positions(3, $0E),
    %dimensions(1, 4),
    %scrollers($90, $A0),
    %CRE(0),
    %doorList(RoomDoors_GrappleBeam))
    %stateChecks(0)

RoomState_GrappleBeam:                                                   ;8FAC38;
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
    dw Door_GrappleBeam_0                                                ;8FAC52;
    dw Door_GrappleBeam_1                                                ;8FAC54;

RoomScrolls_GrappleBeam:
    db $02,$02,$01,$00                                                   ;8FAC56;

RoomHeader_NorfairReserveTank:                                           ;8FAC5A;
    %RoomHeader(\
    %room($18),
    %area(2),
    %positions($12, 2),
    %dimensions(2, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_NorfairReserveTank))
    %stateChecks(0)

RoomState_NorfairReserveTank:                                            ;8FAC67;
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
    dw Door_NorfairReserveTank                                           ;8FAC81;

RoomHeader_GreenBubblesMissiles:                                         ;8FAC83;
    %RoomHeader(\
    %room($19),
    %area(2),
    %positions($14, 2),
    %dimensions(2, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_GreenBubblesMissiles))
    %stateChecks(0)

RoomState_GreenBubblesMissiles:                                          ;8FAC90;
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
    dw Door_GreenBubblesMissiles_0                                       ;8FACAA;
    dw Door_GreenBubblesMissiles_1                                       ;8FACAC;

RoomScrolls_GreenBubblesMissiles:
    db $00,$01                                                           ;8FACAE;

RoomPLM_GreenBubblesMissiles_0:
    db $00,$01, $80                                                      ;8FACB0;

RoomHeader_BubbleMountain:                                               ;8FACB3;
    %RoomHeader(\
    %room($1A),
    %area(2),
    %positions($16, 2),
    %dimensions(2, 4),
    %scrollers($90, $A0),
    %CRE(0),
    %doorList(RoomDoors_BubbleMountain))
    %stateChecks(0)

RoomState_BubbleMountain:                                                ;8FACC0;
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
    dw Door_BubbleMountain_0                                             ;8FACDA;
    dw Door_BubbleMountain_1                                             ;8FACDC;
    dw Door_BubbleMountain_2                                             ;8FACDE;
    dw Door_BubbleMountain_3                                             ;8FACE0;
    dw Door_BubbleMountain_4                                             ;8FACE2;
    dw Door_BubbleMountain_5                                             ;8FACE4;
    dw Door_BubbleMountain_6                                             ;8FACE6;

RoomScrolls_BubbleMountain:
    db $02,$02,$02,$02,$02,$02,$02,$02                                   ;8FACE8;

RoomHeader_SpeedBoosterHall:                                             ;8FACF0;
    %RoomHeader(\
    %room($1B),
    %area(2),
    %positions($19, 1),
    %dimensions($0C, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_SpeedBoosterHall))
    %stateChecks(0)

RoomState_SpeedBoosterHall:                                              ;8FACFD;
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
    dw Door_SpeedBoosterHall_0                                           ;8FAD17;
    dw Door_SpeedBoosterHall_1                                           ;8FAD19;

RoomHeader_SpeedBooster:                                                 ;8FAD1B;
    %RoomHeader(\
    %room($1C),
    %area(2),
    %positions($25, 2),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_SpeedBooster))
    %stateChecks(0)

RoomState_SpeedBooster:                                                  ;8FAD28;
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
    dl LevelData_SpeedBooster                                            ;8FAD42;
    db $09,$00,$03                                                       ;8FAD45;
    dw FXHeader_SpeedBooster                                             ;8FAD48;
    dw EnemyPopulations_SpeedBooster                                     ;8FAD4A;
    dw EnemySets_SpeedBooster                                            ;8FAD4C;
    db $C1,$C1                                                           ;8FAD4E;
    dw $0000                                                             ;8FAD50;
    dw $0000                                                             ;8FAD52;
    dw $0000                                                             ;8FAD54;
    dw PLMPopulation_SpeedBooster                                        ;8FAD56;
    dw LibBG_Norfair_9_A_SmallPatternBrownPurple_Bright                  ;8FAD58;
    dw RTS_8F91F6                                                        ;8FAD5A;
endif ; !FEATURE_KEEP_UNREFERENCED

RoomDoors_SpeedBooster:
    dw Door_SpeedBooster_0                                               ;8FAD5C;

RoomHeader_SingleChamber:                                                ;8FAD5E;
    %RoomHeader(\
    %room($1D),
    %area(2),
    %positions($18, 3),
    %dimensions(6, 4),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_SingleChamber))
    %stateChecks(0)

RoomState_SingleChamber:                                                 ;8FAD6B;
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
    dw Door_SingleChamber_0                                              ;8FAD85;
    dw Door_SingleChamber_1                                              ;8FAD87;
    dw Door_SingleChamber_2                                              ;8FAD89;
    dw Door_SingleChamber_3                                              ;8FAD8B;
    dw Door_SingleChamber_4                                              ;8FAD8D;

RoomScrolls_SingleChamber:
    db $02,$00,$01,$01,$01,$01,$02,$00,$00,$00,$00,$00,$02,$00,$00,$00   ;8FAD8F;
    db $00,$00,$01,$00,$00,$00,$00,$00                                   ;8FAD9F;

RoomPLM_SingleChamber_0:
    db $01,$00, $80                                                      ;8FADA7;

RoomPLM_SingleChamber_1_4:
    db $01,$01, $80                                                      ;8FADAA;

RoomHeader_DoubleChamber:                                                ;8FADAD;
    %RoomHeader(\
    %room($1E),
    %area(2),
    %positions($19, 4),
    %dimensions(4, 2),
    %scrollers($90, $A0),
    %CRE(0),
    %doorList(RoomDoors_DoubleChamber))
    %stateChecks(0)

RoomState_DoubleChamber:                                                 ;8FADBA;
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
    dw Door_DoubleChamber_0                                              ;8FADD4;
    dw Door_DoubleChamber_1                                              ;8FADD6;
    dw Door_DoubleChamber_2                                              ;8FADD8;

RoomScrolls_DoubleChamber:
    db $02,$02,$02,$02                                                   ;8FADDA;

RoomHeader_WaveBeam:                                                     ;8FADDE;
    %RoomHeader(\
    %room($1F),
    %area(2),
    %positions($1D, 4),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_WaveBeam))
    %stateChecks(0)

RoomState_WaveBeam:                                                      ;8FADEB;
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
    %libraryBG(LibBG_Norfair_9_A_CavernStalactites),
    %setupASM(RTS_8F91F6))

RoomDoors_WaveBeam:
    dw Door_WaveBeam_0                                                   ;8FAE05;

RoomHeader_SpikyPlatformsTunnel:                                         ;8FAE07;
    %RoomHeader(\
    %room($20),
    %area(2),
    %positions($19, 6),
    %dimensions(4, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_SpikyPlatformsTunnel))
    %stateChecks(0)

RoomState_SpikyPlatformsTunnel:                                          ;8FAE14;
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
    %libraryBG(LibBG_Norfair_9_A_CavernStalactites),
    %setupASM(RTS_8F91F6))

RoomDoors_SpikyPlatformsTunnel:
    dw Door_SpikyPlatformsTunnel_0                                       ;8FAE2E;
    dw Door_SpikyPlatformsTunnel_1                                       ;8FAE30;

RoomHeader_Volcano:                                                      ;8FAE32;
    %RoomHeader(\
    %room($21),
    %area(2),
    %positions($1B, 6),
    %dimensions(3, 3),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_Volcano))
    %stateChecks(0)

RoomState_Volcano:                                                       ;8FAE3F;
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
    dw Door_Volcano_0                                                    ;8FAE59;
    dw Door_Volcano_1                                                    ;8FAE5B;

RoomScrolls_Volcano:
    db $00,$00,$02,$00,$00,$02,$00,$00,$01                               ;8FAE5D;

RoomPLM_Volcano_0:
    db $06,$01, $07,$01, $80                                             ;8FAE66;

RoomPLM_Volcano_1:
    db $08,$01, $80                                                      ;8FAE6B;

RoomPLM_Volcano_7:
    db $08,$00, $80                                                      ;8FAE6E;

RoomPLM_Volcano_B:
    db $07,$00, $80                                                      ;8FAE71;

RoomHeader_KronicBoost:                                                  ;8FAE74;
    %RoomHeader(\
    %room($22),
    %area(2),
    %positions($19, 8),
    %dimensions(2, 3),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_KronicBoost))
    %stateChecks(0)

RoomState_KronicBoost:                                                   ;8FAE81;
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
    dw Door_KronicBoost_0                                                ;8FAE9B;
    dw Door_KronicBoost_1                                                ;8FAE9D;
    dw Door_KronicBoost_2                                                ;8FAE9F;
    dw Door_KronicBoost_3                                                ;8FAEA1;

RoomScrolls_KronicBoost:
    db $00,$02,$00,$02,$00,$01                                           ;8FAEA3;

RoomPLM_KronicBoost_0:
    db $02,$01, $80                                                      ;8FAEA9;

RoomPLM_KronicBoost_1:
    db $02,$00, $03,$02, $80                                             ;8FAEAC;

RoomPLM_KronicBoost_5:
    db $03,$00, $80                                                      ;8FAEB1;

RoomHeader_MagdolliteTunnel:                                             ;8FAEB4;
    %RoomHeader(\
    %room($23),
    %area(2),
    %positions($17, 8),
    %dimensions(3, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_MagdolliteTunnel))
    %stateChecks(0)

RoomState_MagdolliteTunnel:                                              ;8FAEC1;
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
    %libraryBG(LibBG_Norfair_9_A_CavernStalactites),
    %setupASM(RTS_8F91F6))

RoomDoors_MagdolliteTunnel:
    dw Door_MagdolliteTunnel_0                                           ;8FAEDB;
    dw Door_MagdolliteTunnel_1                                           ;8FAEDD;

RoomHeader_PurpleShaft:                                                  ;8FAEDF;
    %RoomHeader(\
    %room($24),
    %area(2),
    %positions($16, 6),
    %dimensions(1, 3),
    %scrollers($A0, $A0),
    %CRE(0),
    %doorList(RoomDoors_PurpleShaft))
    %stateChecks(0)

RoomState_PurpleShaft:                                                   ;8FAEEC;
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
    dw Door_PurpleShaft_0                                                ;8FAF06;
    dw Door_PurpleShaft_1                                                ;8FAF08;
    dw Door_PurpleShaft_2                                                ;8FAF0A;

RoomScrolls_PurpleShaft:
    db $02,$02,$01                                                       ;8FAF0C;

RoomPLM_PurpleShaft_0_3:
    db $00,$02, $01,$02, $80                                             ;8FAF0F;

RoomHeader_LavaDive:                                                     ;8FAF14;
    %RoomHeader(\
    %room($25),
    %area(2),
    %positions($16, $0A),
    %dimensions(4, 3),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_LavaDive))
    %stateChecks(0)

RoomState_LavaDive:                                                      ;8FAF21;
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
    dw Door_LavaDive_0                                                   ;8FAF3B;
    dw Door_LavaDive_1                                                   ;8FAF3D;

RoomHeader_LowerNorfairElev:                                             ;8FAF3F;
    %RoomHeader(\
    %room($26),
    %area(2),
    %positions($15, $0A),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_LowerNorfairElev))
    %stateChecks(0)

RoomState_LowerNorfairElev:                                              ;8FAF4C;
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
    %libraryBG(LibBG_Norfair_9_A_CavernStalactites),
    %setupASM(RTS_8F91F6))

RoomDoors_LowerNorfairElev:
    dw Door_LowerNorfairElev_0                                           ;8FAF66;
    dw Door_LowerNorfairElev_1                                           ;8FAF68;
    dw Door_VariousRooms_Elevator                                        ;8FAF6A;
    dw Door_LowerNorfairElev_3                                           ;8FAF6C;

RoomScrolls_LowerNorfairElev:
    db $01                                                               ;8FAF6E;

RoomPLM_LowerNorfairElev_0:
    db $00,$02, $80                                                      ;8FAF6F;

RoomHeader_UpperNorfairFarming:                                          ;8FAF72;
    %RoomHeader(\
    %room($27),
    %area(2),
    %positions($14, 5),
    %dimensions(2, 2),
    %scrollers($A0, $A0),
    %CRE(0),
    %doorList(RoomDoors_UpperNorfairFarming))
    %stateChecks(0)

RoomState_UpperNorfairFarming:                                           ;8FAF7F;
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
    dw Door_UpperNorfairFarming_0                                        ;8FAF99;
    dw Door_UpperNorfairFarming_1                                        ;8FAF9B;
    dw Door_UpperNorfairFarming_2                                        ;8FAF9D;

RoomScrolls_UpperNorfairFarming:
    db $02,$02,$01,$01                                                   ;8FAF9F;

RoomHeader_RisingTide:                                                   ;8FAFA3;
    %RoomHeader(\
    %room($28),
    %area(2),
    %positions($11, 4),
    %dimensions(5, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_RisingTide))
    %stateChecks(0)

RoomState_RisingTide:                                                    ;8FAFB0;
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
    %libraryBG(LibBG_Norfair_9_A_CavernStalactites),
    %setupASM(RTS_8F91F6))

RoomDoors_RisingTide:
    dw Door_RisingTide_0                                                 ;8FAFCA;
    dw Door_RisingTide_1                                                 ;8FAFCC;

RoomHeader_AcidSnakesTunnel:                                             ;8FAFCE;
    %RoomHeader(\
    %room($29),
    %area(2),
    %positions($10, 9),
    %dimensions(4, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_AcidSnakesTunnel))
    %stateChecks(0)

RoomState_AcidSnakesTunnel:                                              ;8FAFDB;
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
    %libraryBG(LibBG_Norfair_9_A_CavernStalactites),
    %setupASM(RTS_8F91F6))

RoomDoors_AcidSnakesTunnel:
    dw Door_AcidSnakesTunnel_0                                           ;8FAFF5;
    dw Door_AcidSnakesTunnel_1                                           ;8FAFF7;
    dw Door_AcidSnakesTunnel_2                                           ;8FAFF9;

RoomHeader_SpikyAcidSnakesTunnel:                                        ;8FAFFB;
    %RoomHeader(\
    %room($2A),
    %area(2),
    %positions($15, 9),
    %dimensions(4, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_SpikyAcidSnakesTunnel))
    %stateChecks(0)

RoomState_SpikyAcidSnakesTunnel:                                         ;8FB008;
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
    %libraryBG(LibBG_Norfair_9_A_CavernStalactites),
    %setupASM(RTS_8F91F6))

RoomDoors_SpikyAcidSnakesTunnel:
    dw Door_SpikyAcidSnakesTunnel_0                                      ;8FB022;
    dw Door_SpikyAcidSnakesTunnel_1                                      ;8FB024;

RoomHeader_UpperNorfairRefill:                                           ;8FB026;
    %RoomHeader(\
    %room($2B),
    %area(2),
    %positions($14, 9),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_UpperNorfairRefill))
    %stateChecks(0)

RoomState_UpperNorfairRefill:                                            ;8FB033;
    %StateHeader(\
    %levelData(LevelData_EnergyRefill_BothDoors),
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
    dw Door_UpperNorfairRefill_0                                         ;8FB04D;
    dw Door_UpperNorfairRefill_1                                         ;8FB04F;

RoomHeader_PurpleFarming:                                                ;8FB051;
    %RoomHeader(\
    %room($2C),
    %area(2),
    %positions($17, 7),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_PurpleFarming))
    %stateChecks(0)

RoomState_PurpleFarming:                                                 ;8FB05E;
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
    dw Door_PurpleFarming_0                                              ;8FB078;

RoomHeader_BatCave:                                                      ;8FB07A;
    %RoomHeader(\
    %room($2D),
    %area(2),
    %positions($18, 1),
    %dimensions(1, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_BatCave))
    %stateChecks(0)

RoomState_BatCave:                                                       ;8FB087;
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
    dw Door_BatCave_0                                                    ;8FB0A1;
    dw Door_BatCave_1                                                    ;8FB0A3;

RoomScrolls_BatCave:
    db $00,$01                                                           ;8FB0A5;

RoomPLM_BatCave_0:
    db $00,$02, $01,$02, $80                                             ;8FB0A7;

RoomPLM_BatCave_2:
    db $00,$02, $01,$01, $80                                             ;8FB0AC;

RoomPLM_BatCave_4:
    db $00,$00, $80                                                      ;8FB0B1;

RoomHeader_NorfairMap:                                                   ;8FB0B4;
    %RoomHeader(\
    %room($2E),
    %area(2),
    %positions(9, 4),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_NorfairMap))
    %stateChecks(0)

RoomState_NorfairMap:                                                    ;8FB0C1;
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
    dw Door_NorfairMap_0                                                 ;8FB0DB;

RoomHeader_BubbleMountainSave:                                           ;8FB0DD;
    %RoomHeader(\
    %room($2F),
    %area(2),
    %positions($15, 3),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_BubbleMountainSave))
    %stateChecks(0)

RoomState_BubbleMountainSave:                                            ;8FB0EA;
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
    dw Door_BubbleMountainSave_0                                         ;8FB104;

RoomHeader_FrogSpeedway:                                                 ;8FB106;
    %RoomHeader(\
    %room($30),
    %area(2),
    %positions($0C, 5),
    %dimensions(8, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_FrogSpeedway))
    %stateChecks(0)

RoomState_FrogSpeedway:                                                  ;8FB113;
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
    dw Door_FrogSpeedway_0                                               ;8FB12D;
    dw Door_FrogSpeedway_1                                               ;8FB12F;

RoomScrolls_FrogSpeedway:
    db $01,$01,$01,$01,$01,$01,$01,$01                                   ;8FB131;

RoomHeader_RedPirateShaft:                                               ;8FB139;
    %RoomHeader(\
    %room($31),
    %area(2),
    %positions($13, 6),
    %dimensions(1, 3),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_RedPirateShaft))
    %stateChecks(0)

RoomState_RedPirateShaft:                                                ;8FB146;
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
    dw Door_RedPirateShaft_0                                             ;8FB160;
    dw Door_RedPirateShaft_1                                             ;8FB162;

RoomScrolls_RedPirateShaft:
    db $02,$02,$02                                                       ;8FB164;

RoomHeader_FrogSave:                                                     ;8FB167;
    %RoomHeader(\
    %room($32),
    %area(2),
    %positions($0B, 5),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_FrogSave))
    %stateChecks(0)

RoomState_FrogSave:                                                      ;8FB174;
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
    dw Door_FrogSave_0                                                   ;8FB18E;
    dw Door_FrogSave_1                                                   ;8FB190;

RoomHeader_CrocomireSave:                                                ;8FB192;
    %RoomHeader(\
    %room($33),
    %area(2),
    %positions($10, 8),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_CrocomireSave))
    %stateChecks(0)

RoomState_CrocomireSave:                                                 ;8FB19F;
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
    dw Door_CrocomireSave_0                                              ;8FB1B9;

RoomHeader_LNElevSave:                                                   ;8FB1BB;
    %RoomHeader(\
    %room($34),
    %area(2),
    %positions($14, $0A),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_LNElevSave))
    %stateChecks(0)

RoomState_LNElevSave:                                                    ;8FB1C8;
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
    dw Door_LNElevSave_0                                                 ;8FB1E2;

RoomScrolls_LNElevSave:
    db $01                                                               ;8FB1E4;

RoomHeader_AcidStatue:                                                   ;8FB1E5;
    %RoomHeader(\
    %room($35),
    %area(2),
    %positions($0F, $0D),
    %dimensions(3, 3),
    %scrollers($90, $A0),
    %CRE(0),
    %doorList(RoomDoors_AcidStatue))
    %stateChecks(0)

RoomState_AcidStatue:                                                    ;8FB1F2;
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
    dw Door_AcidStatue_0                                                 ;8FB20C;
    dw Door_AcidStatue_1                                                 ;8FB20E;

RoomScrolls_AcidStatue:
    db $02,$02,$00,$01,$01,$00,$00,$00,$00                               ;8FB210;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_RoomPLM_8FB219:
    db $03,$01, $04,$01, $06,$00, $07,$00, $08,$00, $80                  ;8FB219;
endif ; !FEATURE_KEEP_UNREFERENCED

RoomPLM_AcidStatue_0:
    db $03,$02, $04,$02, $06,$02, $07,$02, $80                           ;8FB224;

RoomPLM_AcidStatue_1:
    db $04,$00, $06,$01, $07,$01, $08,$01, $80                           ;8FB22D;

RoomHeader_MainHall:                                                     ;8FB236;
    %RoomHeader(\
    %room($36),
    %area(2),
    %positions($11, $0B),
    %dimensions(8, 3),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_MainHall))
    %stateChecks(0)

RoomState_MainHall:                                                      ;8FB243;
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
    dw Door_MainHall_0                                                   ;8FB25D;
    dw Door_MainHall_1                                                   ;8FB25F;
    dw Door_MainHall_2                                                   ;8FB261;
    dw Door_VariousRooms_Elevator                                        ;8FB263;

RoomScrolls_MainHall:
    db $00,$00,$00,$00,$02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8FB265;
    db $01,$01,$01,$01,$01,$01,$01,$01                                   ;8FB275;

RoomPLM_MainHall_0_2:
    db $0C,$02, $80                                                      ;8FB27D;

RoomPLM_MainHall_4:
    db $0C,$00, $80                                                      ;8FB280;

RoomHeader_GoldenTorizo:                                                 ;8FB283;
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

RoomState_GoldenTorizo_0:                                                ;8FB295;
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

RoomState_GoldenTorizo_1:                                                ;8FB2AF;
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
    dw Door_GoldenTorizo_0                                               ;8FB2C9;
    dw Door_GoldenTorizo_1                                               ;8FB2CB;

RoomScrolls_GoldenTorizo:
    db $02,$02,$01,$01                                                   ;8FB2CD;

RoomPLM_GoldenTorizo_0:
    db $00,$02, $01,$02, $02,$01, $03,$01, $80                           ;8FB2D1;

RoomHeader_FastRipper:                                                   ;8FB2DA;
    %RoomHeader(\
    %room($38),
    %area(2),
    %positions($15, $0E),
    %dimensions(4, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_FastRipper))
    %stateChecks(0)

RoomState_FastRipper:                                                    ;8FB2E7;
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
    dw Door_FastRipper_0                                                 ;8FB301;
    dw Door_FastRipper_1                                                 ;8FB303;

RoomHeader_GTEnergyRefill:                                               ;8FB305;
    %RoomHeader(\
    %room($39),
    %area(2),
    %positions($15, $0F),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_GTEnergyRefill))
    %stateChecks(0)

RoomState_GTEnergyRefill:                                                ;8FB312;
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
    dw Door_GTEnergyRefill_0                                             ;8FB32C;

RoomHeader_Ridley:                                                       ;8FB32E;
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

RoomState_Ridley_0:                                                      ;8FB340;
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

RoomState_Ridley_1:                                                      ;8FB35A;
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
    dw Door_Ridley_0                                                     ;8FB374;
    dw Door_Ridley_1                                                     ;8FB376;

RoomScrolls_Ridley:
    db $02,$02                                                           ;8FB378;

RoomHeader_LNFarming:                                                    ;8FB37A;
    %RoomHeader(\
    %room($3B),
    %area(2),
    %positions($18, $10),
    %dimensions(3, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_LNFarming))
    %stateChecks(0)

RoomState_LNFarming:                                                     ;8FB387;
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
    dw Door_LNFarming_0                                                  ;8FB3A1;
    dw Door_LNFarming_1                                                  ;8FB3A3;

RoomHeader_FastPillarsSetup:                                             ;8FB3A5;
    %RoomHeader(\
    %room($3C),
    %area(2),
    %positions($19, $0C),
    %dimensions(1, 3),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_FastPillarsSetup))
    %stateChecks(0)

RoomState_FastPillarsSetup:                                              ;8FB3B2;
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
    dw Door_FastPillarsSetup_0                                           ;8FB3CC;
    dw Door_FastPillarsSetup_1                                           ;8FB3CE;
    dw Door_FastPillarsSetup_2                                           ;8FB3D0;
    dw Door_FastPillarsSetup_3                                           ;8FB3D2;
    dw Door_FastPillarsSetup_4                                           ;8FB3D4;

RoomScrolls_FastPillarsSetup:
    db $02,$01,$00                                                       ;8FB3D6;

RoomPLM_FastPillarsSetup_0:
    db $01,$02, $80                                                      ;8FB3D9;

RoomPLM_FastPillarsSetup_2:
    db $01,$02, $02,$01, $80                                             ;8FB3DC;

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

UNUSED_RoomState_8FB3EE:                                                 ;8FB3EE;
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
    dw UNUSED_Door_83991E                                                ;8FB408;
endif ; !FEATURE_KEEP_UNREFERENCED

RoomHeader_MickeyMouse:                                                  ;8FB40A;
    %RoomHeader(\
    %room($3E),
    %area(2),
    %positions($1A, 9),
    %dimensions(4, 4),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_MickeyMouse))
    %stateChecks(0)

RoomState_MickeyMouse:                                                   ;8FB417;
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
    dw Door_MickeyMouse_0                                                ;8FB431;
    dw Door_MickeyMouse_1                                                ;8FB433;

RoomScrolls_MickeyMouse:
    db $00,$00,$00,$02,$00,$00,$00,$02,$00,$00,$00,$02,$01,$01,$01,$01   ;8FB435;

RoomPLM_MickeyMouse_0:
    db $06,$01, $80                                                      ;8FB445;

RoomPLM_MickeyMouse_1:
    db $06,$00, $80                                                      ;8FB448;

RoomPLM_MickeyMouse_2:
    db $07,$01, $80                                                      ;8FB44B;

RoomPLM_MickeyMouse_6:
    db $07,$00, $80                                                      ;8FB44E;

RoomPLM_MickeyMouse_A:
    db $0E,$01, $80                                                      ;8FB451;

RoomPLM_MickeyMouse_D:
    db $0E,$00, $80                                                      ;8FB454;

RoomHeader_Pillar:                                                       ;8FB457;
    %RoomHeader(\
    %room($3F),
    %area(2),
    %positions($1A, $0E),
    %dimensions(4, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_Pillar))
    %stateChecks(0)

RoomState_Pillar:                                                        ;8FB464;
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
    dw Door_Pillar_0                                                     ;8FB47E;
    dw Door_Pillar_1                                                     ;8FB480;

RoomHeader_Plowerhouse:                                                  ;8FB482;
    %RoomHeader(\
    %room($40),
    %area(2),
    %positions($1B, $10),
    %dimensions(3, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_Plowerhouse))
    dw Use_StatePointer_inX                                              ;8FB48D;

RoomState_Plowerhouse:                                                   ;8FB48F;
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
    dw Door_Plowerhouse_0                                                ;8FB4A9;
    dw Door_Plowerhouse_1                                                ;8FB4AB;

RoomHeader_WorstRoomInTheGame:                                           ;8FB4AD;
    %RoomHeader(\
    %room($41),
    %area(2),
    %positions($1E, 9),
    %dimensions(1, 6),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_WorstRoomInTheGame))
    %stateChecks(0)

RoomState_WorstRoomInTheGame:                                            ;8FB4BA;
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
    dw Door_WorstRoomInTheGame_0                                         ;8FB4D4;
    dw Door_WorstRoomInTheGame_1                                         ;8FB4D6;
    dw Door_WorstRoomInTheGame_2                                         ;8FB4D8;

RoomScrolls_WorstRoomInTheGame:
    db $00,$02,$02,$02,$02,$01                                           ;8FB4DA;

RoomPLM_WorstRoomInTheGame_0:
    db $00,$02, $01,$02, $80                                             ;8FB4E0;

RoomHeader_Amphitheatre:                                                 ;8FB4E5;
    %RoomHeader(\
    %room($42),
    %area(2),
    %positions($1F, 9),
    %dimensions(4, 5),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_Amphitheatre))
    %stateChecks(0)

RoomState_Amphitheatre:                                                  ;8FB4F2;
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
    dw Door_Amphitheatre_0                                               ;8FB50C;
    dw Door_Amphitheatre_1                                               ;8FB50E;

RoomHeader_LNSpringBallMaze:                                             ;8FB510;
    %RoomHeader(\
    %room($43),
    %area(2),
    %positions($21, 5),
    %dimensions(5, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_LNSpringBallMaze))
    %stateChecks(0)

RoomState_LNSpringBallMaze:                                              ;8FB51D;
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
    dw Door_LNSpringBallMaze_0                                           ;8FB537;
    dw Door_LNSpringBallMaze_1                                           ;8FB539;
    dw Door_LNSpringBallMaze_2                                           ;8FB53B;

RoomScrolls_LNSpringBallMaze:
    db $02,$00,$00,$00,$00,$01,$01,$00,$00,$00                           ;8FB53D;

RoomPLM_LNSpringBallMaze_0:
    db $01,$01, $02,$01, $06,$00, $80                                    ;8FB547;

RoomPLM_LNSpringBallMaze_4:
    db $01,$00, $02,$00, $06,$01, $80                                    ;8FB54E;

RoomPLM_LNSpringBallMaze_C:
    db $03,$01, $04,$02, $80                                             ;8FB555;

RoomHeader_LNEscapePowerBombs:                                           ;8FB55A;
    %RoomHeader(\
    %room($44),
    %area(2),
    %positions($25, 6),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_LNEscapePowerBombs))
    %stateChecks(0)

RoomState_LNEscapePowerBombs:                                            ;8FB567;
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
    dw Door_LNEscapePowerBombs_0                                         ;8FB581;
    dw Door_LNEscapePowerBombs_1                                         ;8FB583;

RoomHeader_RedKihunterShaft:                                             ;8FB585;
    %RoomHeader(\
    %room($45),
    %area(2),
    %positions($23, 9),
    %dimensions(3, 5),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_RedKihunterShaft))
    %stateChecks(0)

RoomState_RedKihunterShaft:                                              ;8FB592;
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
    dw Door_RedKihunterShaft_0                                           ;8FB5AC;
    dw Door_RedKihunterShaft_1                                           ;8FB5AE;
    dw Door_RedKihunterShaft_2                                           ;8FB5B0;
    dw Door_RedKihunterShaft_3                                           ;8FB5B2;

RoomScrolls_RedKihunterShaft:
    db $02,$00,$00,$02,$00,$00,$02,$00,$00,$02,$00,$00,$02,$00,$02       ;8FB5B4;

RoomPLM_RedKihunterShaft_0_4:
    db $0A,$02, $0D,$02, $80                                             ;8FB5C3;

RoomPLM_RedKihunterShaft_3_5:
    db $0A,$00, $0D,$00, $80                                             ;8FB5C8;

RoomPLM_RedKihunterShaft_6:
    db $00,$02, $03,$02, $80                                             ;8FB5CD;

RoomPLM_RedKihunterShaft_A:
    db $00,$02, $80                                                      ;8FB5D2;

RoomHeader_Wasteland:                                                    ;8FB5D5;
    %RoomHeader(\
    %room($46),
    %area(2),
    %positions($20, $0E),
    %dimensions(6, 3),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_Wasteland))
    %stateChecks(0)

RoomState_Wasteland:                                                     ;8FB5E2;
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
    dw Door_Wasteland_0                                                  ;8FB5FC;
    dw Door_Wasteland_1                                                  ;8FB5FE;

RoomScrolls_Wasteland:
    db $00,$01,$01,$01,$00,$01,$00,$00,$00,$00,$00,$00,$00,$02,$00,$00   ;8FB600;
    db $00,$00                                                           ;8FB610;

RoomPLM_Wasteland_0:
    db $07,$02, $80                                                      ;8FB612;

RoomPLM_Wasteland_2:
    db $01,$01, $07,$00, $80                                             ;8FB615;

RoomPLM_Wasteland_8_C:
    db $04,$01, $80                                                      ;8FB61A;

RoomPLM_Wasteland_A:
    db $00,$01, $01,$01, $80                                             ;8FB61D;

RoomPLM_Wasteland_9_B:
    db $04,$00, $80                                                      ;8FB622;

RoomPLM_Wasteland_D:
    db $00,$00, $80                                                      ;8FB625;

RoomPLM_Wasteland_11:
    db $01,$00, $80                                                      ;8FB628;

RoomHeader_MetalPirates:                                                 ;8FB62B;
    %RoomHeader(\
    %room($47),
    %area(2),
    %positions($1E, $10),
    %dimensions(3, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_MetalPirates))
    %stateChecks(0)

RoomState_MetalPirates:                                                  ;8FB638;
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
    dw Door_MetalPirates_0                                               ;8FB652;
    dw Door_MetalPirates_1                                               ;8FB654;

RoomHeader_ThreeMusketeers:                                              ;8FB656;
    %RoomHeader(\
    %room($48),
    %area(2),
    %positions($1D, 3),
    %dimensions(4, 3),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_ThreeMusketeers))
    %stateChecks(0)

RoomState_ThreeMusketeers:                                               ;8FB663;
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
    dw Door_ThreeMusketeers_0                                            ;8FB67D;
    dw Door_ThreeMusketeers_1                                            ;8FB67F;

RoomScrolls_ThreeMusketeers:
    db $00,$02,$00,$00,$00,$02,$00,$00,$00,$01,$01,$01                   ;8FB681;

RoomPLM_ThreeMusketeers_0:
    db $09,$00, $80                                                      ;8FB68D;

RoomPLM_ThreeMusketeers_6:
    db $08,$01, $09,$01, $80                                             ;8FB690;

RoomPLM_ThreeMusketeers_7:
    db $08,$00, $80                                                      ;8FB695;

RoomHeader_RidleyETank:                                                  ;8FB698;
    %RoomHeader(\
    %room($49),
    %area(2),
    %positions($16, $11),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_RidleyETank))
    %stateChecks(0)

RoomState_RidleyETank:                                                   ;8FB6A5;
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
    dw Door_RidleyETank_0                                                ;8FB6BF;

RoomHeader_ScrewAttack:                                                  ;8FB6C1;
    %RoomHeader(\
    %room($4A),
    %area(2),
    %positions($14, $0E),
    %dimensions(1, 3),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_ScrewAttack))
    %stateChecks(0)

RoomState_ScrewAttack:                                                   ;8FB6CE;
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
    dw Door_ScrewAttack_0                                                ;8FB6E8;
    dw Door_ScrewAttack_1                                                ;8FB6EA;
    dw Door_ScrewAttack_2                                                ;8FB6EC;

RoomHeader_LNFireflea:                                                   ;8FB6EE;
    %RoomHeader(\
    %room($4B),
    %area(2),
    %positions($23, 6),
    %dimensions(3, 6),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_LNFireflea))
    %stateChecks(0)

RoomState_LNFireflea:                                                    ;8FB6FB;
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
    dw Door_LNFireflea_0                                                 ;8FB715;
    dw Door_LNFireflea_1                                                 ;8FB717;
    dw Door_LNFireflea_2                                                 ;8FB719;

RoomScrolls_LNFireflea:
    db $00,$02,$00,$00,$02,$00,$00,$02,$00,$00,$01,$00,$00,$00,$00,$00   ;8FB71B;
    db $01,$01                                                           ;8FB72B;

RoomPLM_LNFireflea_2:
    db $0B,$01, $80                                                      ;8FB72D;

RoomPLM_LNFireflea_5:
    db $0B,$02, $0D,$02, $0E,$02, $80                                    ;8FB730;

RoomPLM_LNFireflea_9:
    db $00,$01, $04,$00, $80                                             ;8FB737;

RoomPLM_LNFireflea_11:
    db $01,$02, $04,$02, $80                                             ;8FB73C;

RoomHeader_LNSave:                                                       ;8FB741;
    %RoomHeader(\
    %room($4C),
    %area(2),
    %positions($24, $0C),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_LNSave))
    %stateChecks(0)

RoomState_LNSave:                                                        ;8FB74E;
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
    dw Door_LNSave_0                                                     ;8FB768;


;;; $B76A: Library backgrounds ;;;
LibBG_ScrollingSky_Tilemaps_LandingSite:                                 ;8FB76A;
    dw $000E,Door_GauntletEntrance_0 : dl ScrollingSky_Tilemaps_2 : dw $4800,$0800
    dw $000E,Door_Parlor_1 : dl ScrollingSky_Tilemaps_4 : dw $4800,$0800
    dw $000E,Door_CrateriaPowerBombs_0 : dl ScrollingSky_Tilemaps_1 : dw $4C00,$0800
    dw $000E,Door_CrateriaTube_0 : dl ScrollingSky_Tilemaps_4 : dw $4800,$0800
    dw $000E,Door_LandingSite_LandingCutscene : dl ScrollingSky_Tilemaps_0 : dw $4800,$0800
    dw $000E,Door_DemoSet3_0_2_4 : dl ScrollingSky_Tilemaps_2 : dw $4800,$0800
    dw $0000

LibBG_ScrollingSky_Tilemaps_WreckedShipEntrance:                         ;8FB7AE;
    dw $000E,Door_BowlingAlleyPath_0 : dl ScrollingSky_Tilemaps_2 : dw $4800,$0800
    dw $000E,Door_Moat_1 : dl ScrollingSky_Tilemaps_5 : dw $4800,$0800
    dw $000E,Door_BowlingAlley_0 : dl ScrollingSky_Tilemaps_1 : dw $4C00,$0800
    dw $000E,Door_WreckedShipEntrance_0 : dl ScrollingSky_Tilemaps_5 : dw $4800,$0800
    dw $000E,Door_Attic_2 : dl ScrollingSky_Tilemaps_0 : dw $4800,$0800
    dw $000E,Door_GravitySuit_0 : dl ScrollingSky_Tilemaps_3 : dw $4C00,$0800
    dw $0000

LibBG_ScrollingSky_Tilemaps_EastOcean:                                   ;8FB7F2;
    dw $000E,Door_ForgottenHighwayKagos_0 : dl ScrollingSky_Tilemaps_5 : dw $4800,$0800
    dw $000E,Door_ElectricDeath_0 : dl ScrollingSky_Tilemaps_5 : dw $4800,$0800
    dw $0000

LibBG_ScrollingSky_Tilemaps_BowlingAlley:                                ;8FB80A;
    dw $0002 : dl ScrollingSky_Tilemaps_2 : dw $4800,$0800
    dw $0000

LibBG_Brinstar_1A_Kraid_Upper_Lower:                                     ;8FB815;
    dw $0008 : dl Tiles_Standard_BG3 : dw $2000,$1000
    dw $0004 : dl Background_Brinstar_1A_Kraid_Upper : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4000,$1000
    dw $0004 : dl Background_Brinstar_1A_Kraid_Lower_0 : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$1000
    dw $0000

LibBG_Standard_BG3_Tiles:                                                ;8FB840;
    dw $0008 : dl Tiles_Standard_BG3 : dw $2000,$1000,$000C,$0000

LibBG_Crocomire_State0:                                                  ;8FB84D;
    dw $0002 : dl $7E2000 : dw $4800,$1000
    dw $0000

LibBG_Crocomire_State1:                                                  ;8FB858;
    dw $0002 : dl $7E2000 : dw $4800,$1000
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_LibBG_Brinstar_1A_Kraid_Lower_8FB863:                             ;8FB863;
    dw $0004 : dl Background_Brinstar_1A_Kraid_Lower_1 : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED

LibBG_Crateria_0_VerticalPatternRocks:                                   ;8FB87E;
    dw $0004 : dl Background_Crateria_0_VerticalPatternRocks : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Crateria_0_HorizontalPatternRocks:                                 ;8FB899;
    dw $0004 : dl Background_Crateria_0_HorizontalPatternRocks : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Crateria_0_Rocks:                                                  ;8FB8B4;
    dw $0004 : dl Background_Crateria_0_Rocks : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Crateria_2_PurpleRocks:                                            ;8FB8CF;
    dw $0004 : dl Background_Crateria_2_PurpleRocks : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Crateria_2_BrickRoom_WallArt_Dark:                                 ;8FB8EA;
    dw $0004 : dl Background_Crateria_2_BrickRoom_WallArt_Dark : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Crateria_2_3_Mechanical:                                           ;8FB905;
    dw $0004 : dl Background_Crateria_2_3_Mechanical : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Crateria_2_BrickRoom_WallArt:                                      ;8FB920;
    dw $0004 : dl Background_Crateria_2_BrickRoom_WallArt : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Crateria_2_Elevator:                                               ;8FB93B;
    dw $0004 : dl Background_Crateria_2_Elevator : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Crateria_2_BrickRoom:                                              ;8FB956;
    dw $0004 : dl Background_Crateria_2_BrickRoom : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000


;;; $B971: Door ASM: start Wrecked Ship treadmill west entrance ;;;
DoorASM_StartWreckedShipTreadmillWestEntrance:
; Room $93FE, door list index 1: Door
    LDY.W #AnimatedTilesObjects_FX_wreckedShipTreadmillRightwards        ;8FB971;
    JSL.L Spawn_AnimatedTilesObject                                      ;8FB974;
    JSL.L Spawn_Hardcoded_PLM                                            ;8FB978;
    db $04,$09                                                           ;8FB97C;
    dw PLMEntries_wreckedShipEntranceTreadmillFromWest                   ;8FB97E;
    RTS                                                                  ;8FB980;


;;; $B981: Door ASM: scroll 6 = green ;;;
DoorASM_Scroll_6_Green:
; Door destination: Crateria mainstreet
; Room $93D5, door 0. Crateria save station
; Room $96BA, door 0. Old Tourian escape shaft
; Room $98E2, door 0. Pre Crateria map station hall
; Room $9A44, door 1. Crateria bomb block hall
    PHP                                                                  ;8FB981;
    SEP #$20                                                             ;8FB982;
    LDA.B #$02                                                           ;8FB984;
    STA.L Scrolls+6                                                      ;8FB986;
    PLP                                                                  ;8FB98A;
    RTS                                                                  ;8FB98B;


;;; $B98C: Door ASM: scroll 0 = blue ;;;
DoorASM_Scroll_0_Blue:
; Door destination: Crateria mainstreet
; Room $990D, door list index 1: Door
    PHP                                                                  ;8FB98C;
    SEP #$20                                                             ;8FB98D;
    LDA.B #$01                                                           ;8FB98F;
    STA.L Scrolls                                                        ;8FB991;
    PLP                                                                  ;8FB995;
    RTS                                                                  ;8FB996;


;;; $B997: Door ASM: scroll 13h = blue ;;;
DoorASM_Scroll_13_Blue:
; Door destination: Landing site
; Room $92B3, door list index 0: Door
    PHP                                                                  ;8FB997;
    SEP #$20                                                             ;8FB998;
    LDA.B #$01                                                           ;8FB99A;
    STA.L Scrolls+$13                                                    ;8FB99C;
    PLP                                                                  ;8FB9A0;
    RTS                                                                  ;8FB9A1;


;;; $B9A2: Door ASM: scroll 4 = red, 8 = green ;;;
DoorASM_Scroll_4_Red_8_Green:
; Door destination: Wrecked Ship chozo room
; Room $9879, door list index 0: Door
    PHP                                                                  ;8FB9A2;
    SEP #$20                                                             ;8FB9A3;
    LDA.B #$00                                                           ;8FB9A5;
    STA.L Scrolls+4                                                      ;8FB9A7;
    LDA.B #$02                                                           ;8FB9AB;
    STA.L Scrolls+8                                                      ;8FB9AD;
    PLP                                                                  ;8FB9B1;
    RTS                                                                  ;8FB9B2;


;;; $B9B3: Door ASM: scroll 8..Bh = red ;;;
DoorASM_Scroll_8_9_A_B_Red:
; Door destination: Wrecked Ship chozo room
; Room $93FE, door list index 4: Door
    PHP                                                                  ;8FB9B3;
    SEP #$20                                                             ;8FB9B4;
    LDA.B #$00                                                           ;8FB9B6;
    STA.L Scrolls+8                                                      ;8FB9B8;
    STA.L Scrolls+9                                                      ;8FB9BC;
    STA.L Scrolls+$A                                                     ;8FB9C0;
    STA.L Scrolls+$B                                                     ;8FB9C4;
    PLP                                                                  ;8FB9C8;
    RTS                                                                  ;8FB9C9;


;;; $B9CA: Door ASM: scroll 2..5,Bh..Dh,11h = red ;;;
DoorASM_Scroll_2_3_4_5_B_C_D_11_Red:
; Door destination: Wrecked Ship chozo room
; Room $968F, door list index 1: Door
    PHP                                                                  ;8FB9CA;
    SEP #$20                                                             ;8FB9CB;
    LDA.B #$00                                                           ;8FB9CD;
    STA.L Scrolls+2                                                      ;8FB9CF;
    STA.L Scrolls+3                                                      ;8FB9D3;
    STA.L Scrolls+4                                                      ;8FB9D7;
    STA.L Scrolls+5                                                      ;8FB9DB;
    STA.L Scrolls+$B                                                     ;8FB9DF;
    STA.L Scrolls+$C                                                     ;8FB9E3;
    STA.L Scrolls+$D                                                     ;8FB9E7;
    STA.L Scrolls+$11                                                    ;8FB9EB;
    PLP                                                                  ;8FB9EF;
    RTS                                                                  ;8FB9F0;


;;; $B9F1: Door ASM: scroll 1,4 = green ;;;
DoorASM_Scroll_1_4_Green:
; Room $962A, door list index 0: Door
    PHP                                                                  ;8FB9F1;
    SEP #$20                                                             ;8FB9F2;
    LDA.B #$02                                                           ;8FB9F4;
    STA.L Scrolls+1                                                      ;8FB9F6;
    STA.L Scrolls+4                                                      ;8FB9FA;
    PLP                                                                  ;8FB9FE;
    RTS                                                                  ;8FB9FF;


;;; $BA00: Door ASM: scroll 2 = blue ;;;
DoorASM_Scroll_2_Blue:
; Room $99F9, door list index 0: Door
    PHP                                                                  ;8FBA00;
    SEP #$20                                                             ;8FBA01;
    LDA.B #$01                                                           ;8FBA03;
    STA.L Scrolls+2                                                      ;8FBA05;
    PLP                                                                  ;8FBA09;
    RTS                                                                  ;8FBA0A;


;;; $BA0B: Door ASM: scroll 17h = blue ;;;
DoorASM_Scroll_17_Blue:
; Room $99F9, door list index 1: Door
    PHP                                                                  ;8FBA0B;
    SEP #$20                                                             ;8FBA0C;
    LDA.B #$01                                                           ;8FBA0E;
    STA.L Scrolls+$17                                                    ;8FBA10;
    PLP                                                                  ;8FBA14;
    RTS                                                                  ;8FBA15;


;;; $BA16: Door ASM: scroll 4 = blue ;;;
DoorASM_Scroll_4_Blue:
; Room $99BD, door list index 3: Door
    PHP                                                                  ;8FBA16;
    SEP #$20                                                             ;8FBA17;
    LDA.B #$01                                                           ;8FBA19;
    STA.L Scrolls+4                                                      ;8FBA1B;
    PLP                                                                  ;8FBA1F;
    RTS                                                                  ;8FBA20;


;;; $BA21: Door ASM: scroll 6 = green ;;;
DoorASM_Scroll_6_Green_duplicate:
; Room $962A, door list index 1: Door
    PHP                                                                  ;8FBA21;
    SEP #$20                                                             ;8FBA22;
    LDA.B #$02                                                           ;8FBA24;
    STA.L Scrolls+6                                                      ;8FBA26;
    PLP                                                                  ;8FBA2A;
    RTS                                                                  ;8FBA2B;


;;; $BA2C: Door ASM: scroll 3 = green ;;;
DoorASM_Scroll_3_Green:
; Room $965B, door list index 1: Door
    PHP                                                                  ;8FBA2C;
    SEP #$20                                                             ;8FBA2D;
    LDA.B #$02                                                           ;8FBA2F;
    STA.L Scrolls+3                                                      ;8FBA31;
    PLP                                                                  ;8FBA35;
    RTS                                                                  ;8FBA36;


;;; $BA37: Library background ;;;
LibBG_Brinstar_6_Vertical_GlowPatches:                                   ;8FBA37;
    dw $0004 : dl Background_Brinstar_6_Vertical_GlowPatches : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Brinstar_6_Horizontal_GlowPatches:                                 ;8FBA52;
    dw $0004 : dl Background_Brinstar_6_Horizontal_GlowPatches : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Brinstar_6_LargeHorizontalPattern:                                 ;8FBA6D;
    dw $0004 : dl Background_Brinstar_6_LargeHorizontalPattern : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Brinstar_6_MediumHorizontalPattern:                                ;8FBA88;
    dw $0004 : dl Background_Brinstar_6_MediumHorizontalPattern : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Brinstar_6_ThinHorizontalPattern:                                  ;8FBAA3;
    dw $0004 : dl Background_Brinstar_6_ThinHorizontalPattern : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Brinstar_6_SmallPattern:                                           ;8FBABE;
    dw $0004 : dl Background_Brinstar_6_SmallPattern : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Brinstar_6_SpheresPattern:                                         ;8FBAD9;
    dw $0004 : dl Background_Brinstar_6_SpheresPattern : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Brinstar_6_SmallPattern_Variety_0:                                 ;8FBAF4;
    dw $0004 : dl Background_Brinstar_6_SmallPattern_Variety_0 : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_LibBG_Brinstar_6_SmallPattern_Variety_1_8FBB0F:                   ;8FBB0F;
    dw $0004 : dl Background_Brinstar_6_SmallPattern_Variety_1 : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

UNUSED_LibBG_Brinstar_6_SmallPattern_Variety_2_8FBB2A:                   ;8FBB2A;
    dw $0004 : dl Background_Brinstar_6_SmallPattern_Variety_2 : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED

LibBG_Brinstar_6_DarkPattern:                                            ;8FBB45;
    dw $0004 : dl Background_Brinstar_6_DarkPattern : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Tourian_15_Statues:                                                ;8FBB60;
    dw $0004 : dl Background_Tourian_15_Statues : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$1000
    dw $0002 : dl Tiles_TourianStatuesSoul : dw $6D00,$0600
    dw $0000

LibBG_Brinstar_7_WideVerticalTower_Brick_0:                              ;8FBB7B;
    dw $0004 : dl Background_Brinstar_7_WideVerticalTower_Brick_0 : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_LibBG_Brinstar_7_WideVerticalTower_Brick_1_8FBB96:                ;8FBB96;
    dw $0004 : dl Background_Brinstar_7_WideVerticalTower_Brick_1 : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

UNUSED_LibBG_Brinstar_7_WideVerticalTower_Brick_2_8FBBB1:                ;8FBBB1;
    dw $0004 : dl Background_Brinstar_7_WideVerticalTower_Brick_2 : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED

LibBG_Brinstar_7_VerticalTower:                                          ;8FBBCC;
    dw $0004 : dl Background_Brinstar_7_VerticalTower : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Brinstar_7_NarrowVerticalTower_Brick:                              ;8FBBE7;
    dw $0004 : dl Background_Brinstar_7_NarrowVerticalTower_Brick : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Brinstar_7_VerticalBrick_0:                                        ;8FBC02;
    dw $0004 : dl Background_Brinstar_7_VerticalBrick_0 : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_LibBG_Brinstar_7_VerticalBrick_1_8FBC1D:                          ;8FBC1D;
    dw $0004 : dl Background_Brinstar_7_VerticalBrick_1 : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED

LibBG_Brinstar_7_MechanicalRoom_SpikeFloor:                              ;8FBC38;
    dw $0004 : dl Background_Brinstar_7_MechanicalRoom_SpikeFloor : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Brinstar_7_MechanicalRoom:                                         ;8FBC53;
    dw $0004 : dl Background_Brinstar_7_MechanicalRoom : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Brinstar_7_NarrowVerticalTower_Brick_Vines_0:                      ;8FBC6E;
    dw $0004 : dl Background_Brinstar_7_NarrowVerticalTower_Brick_Vines_0 : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_LibBG_Brin_7_NarrowVerticalTower_Brick_Vines_1_8FBC89:            ;8FBC89;
    dw $0004 : dl Background_Brinstar_7_NarrowVerticalTower_Brick_Vines_1 : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED

LibBG_Brinstar_8_NarrowVerticalTower_Brick_Grey_0:                       ;8FBCA4;
    dw $0004 : dl Background_Brinstar_8_NarrowVerticalTower_Brick_Grey_0 : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$1000
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_LibBG_Brin_8_NarrowVerticalTower_Brick_Grey_1_8FBCB6:             ;8FBCB6;
    dw $0004 : dl Background_Brinstar_8_NarrowVerticalTower_Brick_Grey_1 : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

UNUSED_LibBG_Brin_8_NarrowVerticalTower_Brick_Grey_2_8FBCD1:             ;8FBCD1;
    dw $0004 : dl Background_Brinstar_8_NarrowVerticalTower_Brick_Grey_2 : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED

LibBG_Brinstar_7_BlueGridBlocks:                                         ;8FBCEC;
    dw $0004 : dl Background_Brinstar_7_BlueGridBlocks : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000


;;; $BD07: Door ASM: scroll 18h,1Ch = green ;;;
DoorASM_Scroll_18_1C_Green:
; Room $9AD9, door list index 8: Door
; Room $9FE5, door list index 0: Door
    PHP                                                                  ;8FBD07;
    SEP #$20                                                             ;8FBD08;
    LDA.B #$02                                                           ;8FBD0A;
    STA.L Scrolls+$18                                                    ;8FBD0C;
    STA.L Scrolls+$1C                                                    ;8FBD10;
    PLP                                                                  ;8FBD14;
    RTS                                                                  ;8FBD15;


;;; $BD16: Door ASM: scroll 5..6 = blue ;;;
DoorASM_Scroll_5_6_Blue:
; Room $9AD9, door list index 7: Door
; Room $A22A, door list index 0: Door
    PHP                                                                  ;8FBD16;
    SEP #$20                                                             ;8FBD17;
    LDA.B #$01                                                           ;8FBD19;
    STA.L Scrolls+5                                                      ;8FBD1B;
    STA.L Scrolls+6                                                      ;8FBD1F;
    PLP                                                                  ;8FBD23;
    RTS                                                                  ;8FBD24;


;;; $BD25: Door ASM: scroll 1Dh = blue ;;;
DoorASM_Scroll_1D_Blue:
; Room $9938, door list index 1: Door
; Room $9AD9, door list index 6: Door
; Room $A011, door list index 2: Door
    PHP                                                                  ;8FBD25;
    SEP #$20                                                             ;8FBD26;
    LDA.B #$01                                                           ;8FBD28;
    STA.L Scrolls+$1D                                                    ;8FBD2A;
    PLP                                                                  ;8FBD2E;
    RTS                                                                  ;8FBD2F;


;;; $BD30: Door ASM: scroll 2..3 = green ;;;
DoorASM_Scroll_2_3_Green:
; Room $9D19, door list index 2: Door
    PHP                                                                  ;8FBD30;
    SEP #$20                                                             ;8FBD31;
    LDA.B #$02                                                           ;8FBD33;
    STA.L Scrolls+2                                                      ;8FBD35;
    STA.L Scrolls+3                                                      ;8FBD39;
    PLP                                                                  ;8FBD3D;
    RTS                                                                  ;8FBD3E;


;;; $BD3F: Door ASM: scroll 0 = red, 1 = green ;;;
DoorASM_Scroll_0_Red_1_Green:
; Room $A471, door list index 0: Door
    PHP                                                                  ;8FBD3F;
    SEP #$20                                                             ;8FBD40;
    LDA.B #$00                                                           ;8FBD42;
    STA.L Scrolls                                                        ;8FBD44;
    LDA.B #$02                                                           ;8FBD48;
    STA.L Scrolls+1                                                      ;8FBD4A;
    PLP                                                                  ;8FBD4E;
    RTS                                                                  ;8FBD4F;


;;; $BD50: Door ASM: scroll Bh = green ;;;
DoorASM_Scroll_B_Green:
; Room $A07B, door list index 0: Door
    PHP                                                                  ;8FBD50;
    SEP #$20                                                             ;8FBD51;
    LDA.B #$02                                                           ;8FBD53;
    STA.L Scrolls+$B                                                     ;8FBD55;
    PLP                                                                  ;8FBD59;
    RTS                                                                  ;8FBD5A;


;;; $BD5B: Door ASM: scroll 1Ch = red, 1Dh = blue ;;;
DoorASM_Scroll_Scroll_1C_Red_1D_Blue:
; Room $A0A4, door list index 1: Door
    PHP                                                                  ;8FBD5B;
    SEP #$20                                                             ;8FBD5C;
    LDA.B #$00                                                           ;8FBD5E;
    STA.L Scrolls+$1C                                                    ;8FBD60;
    LDA.B #$01                                                           ;8FBD64;
    STA.L Scrolls+$1D                                                    ;8FBD66;
    PLP                                                                  ;8FBD6A;
    RTS                                                                  ;8FBD6B;


;;; $BD6C: Door ASM: scroll 4 = red ;;;
DoorASM_Scroll_4_Red:
; Room $9AD9, door list index 5: Door
    PHP                                                                  ;8FBD6C;
    SEP #$20                                                             ;8FBD6D;
    LDA.B #$00                                                           ;8FBD6F;
    STA.L Scrolls+4                                                      ;8FBD71;
    PLP                                                                  ;8FBD75;
    RTS                                                                  ;8FBD76;


;;; $BD77: Door ASM: scroll 20h,24h..25h = green ;;;
DoorASM_Scroll_20_24_25_Green:
; Room $A0D2, door list index 0: Door
    PHP                                                                  ;8FBD77;
    SEP #$20                                                             ;8FBD78;
    LDA.B #$02                                                           ;8FBD7A;
    STA.L Scrolls+$20                                                    ;8FBD7C;
    STA.L Scrolls+$24                                                    ;8FBD80;
    STA.L Scrolls+$25                                                    ;8FBD84;
    PLP                                                                  ;8FBD88;
    RTS                                                                  ;8FBD89;


;;; $BD8A: Door ASM: scroll 2 = blue ;;;
DoorASM_Scroll_2_Blue_duplicate:
; Room $A1AD, door list index 0: Door
    PHP                                                                  ;8FBD8A;
    SEP #$20                                                             ;8FBD8B;
    LDA.B #$01                                                           ;8FBD8D;
    STA.L Scrolls+2                                                      ;8FBD8F;
    PLP                                                                  ;8FBD93;
    RTS                                                                  ;8FBD94;


;;; $BD95: Door ASM: scroll 0 = green ;;;
DoorASM_Scroll_0_Green:
; Room $A641, door list index 0: Door
    PHP                                                                  ;8FBD95;
    SEP #$20                                                             ;8FBD96;
    LDA.B #$02                                                           ;8FBD98;
    STA.L Scrolls                                                        ;8FBD9A;
    PLP                                                                  ;8FBD9E;
    RTS                                                                  ;8FBD9F;


;;; $BDA0: Door ASM: scroll 6..7 = green ;;;
DoorASM_Scroll_6_7_Green:
; Room $A3DD, door list index 0: Door
; Room $A618, door list index 0: Door
    PHP                                                                  ;8FBDA0;
    SEP #$20                                                             ;8FBDA1;
    LDA.B #$02                                                           ;8FBDA3;
    STA.L Scrolls+6                                                      ;8FBDA5;
    STA.L Scrolls+7                                                      ;8FBDA9;
    PLP                                                                  ;8FBDAD;
    RTS                                                                  ;8FBDAE;


;;; $BDAF: Door ASM: scroll 1 = blue, 2 = red ;;;
DoorASM_Scroll_1_Blue_2_Red:
; Room $A322, door list index 4: Door
    PHP                                                                  ;8FBDAF;
    SEP #$20                                                             ;8FBDB0;
    LDA.B #$01                                                           ;8FBDB2;
    STA.L Scrolls+1                                                      ;8FBDB4;
    LDA.B #$00                                                           ;8FBDB8;
    STA.L Scrolls+2                                                      ;8FBDBA;
    PLP                                                                  ;8FBDBE;
    RTS                                                                  ;8FBDBF;


;;; $BDC0: Door ASM: scroll 1 = blue, 3 = red ;;;
DoorASM_Scroll_1_Blue_3_Red:
; Room $9DC7, door list index 0: Door
    PHP                                                                  ;8FBDC0;
    SEP #$20                                                             ;8FBDC1;
    LDA.B #$01                                                           ;8FBDC3;
    STA.L Scrolls+1                                                      ;8FBDC5;
    LDA.B #$00                                                           ;8FBDC9;
    STA.L Scrolls+3                                                      ;8FBDCB;
    PLP                                                                  ;8FBDCF;
    RTS                                                                  ;8FBDD0;


;;; $BDD1: Door ASM: scroll 0 = red, 4 = blue ;;;
DoorASM_Scroll_0_Red_4_Blue:
; Room $A6A1, door list index 0: Door
    PHP                                                                  ;8FBDD1;
    SEP #$20                                                             ;8FBDD2;
    LDA.B #$00                                                           ;8FBDD4;
    STA.L Scrolls                                                        ;8FBDD6;
    LDA.B #$01                                                           ;8FBDDA;
    STA.L Scrolls+4                                                      ;8FBDDC;
    PLP                                                                  ;8FBDE0;
    RTS                                                                  ;8FBDE1;


;;; $BDE2: Door ASM: scroll 2..3 = blue ;;;
DoorASM_Scroll_2_3_Blue:
; Room $A70B, door list index 0: Door
    PHP                                                                  ;8FBDE2;
    SEP #$20                                                             ;8FBDE3;
    LDA.B #$01                                                           ;8FBDE5;
    STA.L Scrolls+2                                                      ;8FBDE7;
    STA.L Scrolls+3                                                      ;8FBDEB;
    PLP                                                                  ;8FBDEF;
    RTS                                                                  ;8FBDF0;


;;; $BDF1: Door ASM: scroll 0..1 = green ;;;
DoorASM_Scroll_0_1_Green:
; Room $A447, door list index 0: Door
    PHP                                                                  ;8FBDF1;
    SEP #$20                                                             ;8FBDF2;
    LDA.B #$02                                                           ;8FBDF4;
    STA.L Scrolls                                                        ;8FBDF6;
    STA.L Scrolls+1                                                      ;8FBDFA;
    PLP                                                                  ;8FBDFE;
    RTS                                                                  ;8FBDFF;


;;; $BE00: Door ASM: scroll 1 = green ;;;
DoorASM_Scroll_1_Green:
; Room $A184, door list index 0: Door
    PHP                                                                  ;8FBE00;
    SEP #$20                                                             ;8FBE01;
    LDA.B #$02                                                           ;8FBE03;
    STA.L Scrolls+1                                                      ;8FBE05;
    PLP                                                                  ;8FBE09;
    RTS                                                                  ;8FBE0A;


;;; $BE0B: Door ASM: scroll Fh,12h = green ;;;
DoorASM_Scroll_F_12_Green:
; Room $A3AE, door list index 0: Door
    PHP                                                                  ;8FBE0B;
    SEP #$20                                                             ;8FBE0C;
    LDA.B #$02                                                           ;8FBE0E;
    STA.L Scrolls+$F                                                     ;8FBE10;
    STA.L Scrolls+$12                                                    ;8FBE14;
    PLP                                                                  ;8FBE18;
    RTS                                                                  ;8FBE19;


;;; $BE1A: Door ASM: scroll 6 = green ;;;
DoorASM_Scroll_6_Green_duplicate_again:
; Room $A2F7, door list index 1: Door
    PHP                                                                  ;8FBE1A;
    SEP #$20                                                             ;8FBE1B;
    LDA.B #$02                                                           ;8FBE1D;
    STA.L Scrolls+6                                                      ;8FBE1F;
    PLP                                                                  ;8FBE23;
    RTS                                                                  ;8FBE24;


;;; $BE25: Door ASM: scroll 0 = green, 1 = blue ;;;
DoorASM_Scroll_0_Green_1_Blue:
; Room $A107, door list index 0: Door
    PHP                                                                  ;8FBE25;
    SEP #$20                                                             ;8FBE26;
    LDA.B #$02                                                           ;8FBE28;
    STA.L Scrolls                                                        ;8FBE2A;
    LDA.B #$01                                                           ;8FBE2E;
    STA.L Scrolls+1                                                      ;8FBE30;
    PLP                                                                  ;8FBE34;
    RTS                                                                  ;8FBE35;


;;; $BE36: Door ASM: scroll 2 = green ;;;
DoorASM_Scroll_2_Green:
; Room $9AD9, door list index 0: Door
    SEP #$20                                                             ;8FBE36;
    LDA.B #$02                                                           ;8FBE38;
    STA.L Scrolls+2                                                      ;8FBE3A;
    RTS                                                                  ;8FBE3E;


;;; $BE3F: Library background ;;;
LibBG_Norfair_9_A_SmallPatternBrownPurple_Bright:                        ;8FBE3F;
; Room $A75D, state $A76A: Post ice beam mockball hall
; Room $A865, state $A872: Ice beam practice room
; Room $A9E5, state $A9F2: Hi-jump room
; Room $AD1B, state $AD28: Speed booster room
; Room $B106, state $B113: Norfair speed blockade hall
    dw $0004 : dl Background_Norfair_9_A_SmallPatternBrownPurple_Bright : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Norfair_9_A_SmallPatternBrownPurple_0:                             ;8FBE5A;
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
UNUSED_LibBG_Norfair_9_A_SmallPatternBrownPurple_1_8FBE75:               ;8FBE75;
    dw $0004 : dl Background_Norfair_9_A_SmallPatternBrownPurple_1 : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED

LibBG_Norfair_9_HorizontalPatternBrick:                                  ;8FBE90;
; Room $B3E1, state $B3EE: Unused room
    dw $0004 : dl Background_Norfair_9_HorizontalPatternBrick : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Norfair_9_VerticalPatternBrick:                                    ;8FBEAB;
; Room $B3A5, state $B3B2: Lower Norfair power bomb floor shaft
    dw $0004 : dl Background_Norfair_9_VerticalPatternBrick : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Norfair_9_A_CavernStalactites:                                     ;8FBEC6;
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
    dw $0004 : dl Background_Norfair_9_A_CavernStalactites : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Norfair_9_A_CavernVertical:                                        ;8FBEE1;
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

LibBG_Norfair_9_CavernHorizontalRuins:                                   ;8FBEFC;
; Room $B4AD, state $B4BA: Lower Norfair wall jumping space pirates shaft
    dw $0004 : dl Background_Norfair_9_CavernHorizontalRuins : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Norfair_9_CavernVerticalRuins:                                     ;8FBF17;
; Room $B236, state $B243: Lower Norfair mainstreet
; Room $B2DA, state $B2E7: Screw attack practice
; Room $B457, state $B464: Lower Norfair breakable pillars hall
    dw $0004 : dl Background_Norfair_9_CavernVerticalRuins : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Norfair_9_CavernRoomPillars:                                       ;8FBF32;
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

LibBG_Norfair_9_RoomStatues:                                             ;8FBF4D;
; Room $B37A, state $B387: Pre Ridley hall
; Room $B482, state $B48F: Lower Norfair holtz room
; Room $B62B, state $B638: Elite pirate hall
    dw $0004 : dl Background_Norfair_9_RoomStatues : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Norfair_9_PurplePatches:                                           ;8FBF68;
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

LibBG_Norfair_9_Bubbles:                                                 ;8FBF83;
; Room $AC83, state $AC90: Bubble Norfair pre reserve tank room
; Room $ACB3, state $ACC0: Bubble Norfair mainstreet
    dw $0004 : dl Background_Norfair_9_Bubbles : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000


;;; $BF9E: Door ASM: scroll 3..4 = red, 6..8 = blue ;;;
DoorASM_Scroll_3_4_Red_6_7_8_Blue:
; Room $B283, door list index 0: Door
    PHP                                                                  ;8FBF9E;
    SEP #$20                                                             ;8FBF9F;
    LDA.B #$00                                                           ;8FBFA1;
    STA.L Scrolls+3                                                      ;8FBFA3;
    STA.L Scrolls+4                                                      ;8FBFA7;
    LDA.B #$01                                                           ;8FBFAB;
    STA.L Scrolls+6                                                      ;8FBFAD;
    STA.L Scrolls+7                                                      ;8FBFB1;
    STA.L Scrolls+8                                                      ;8FBFB5;
    PLP                                                                  ;8FBFB9;
    RTS                                                                  ;8FBFBA;


;;; $BFBB: Door ASM: scroll 1..3 = blue, 4 = green, 6 = red ;;;
DoorASM_Scroll_1_2_3_Blue_4_Green_6_Red:
; Room $B55A, door list index 1: Door
    PHP                                                                  ;8FBFBB;
    SEP #$20                                                             ;8FBFBC;
    LDA.B #$01                                                           ;8FBFBE;
    STA.L Scrolls+1                                                      ;8FBFC0;
    STA.L Scrolls+2                                                      ;8FBFC4;
    STA.L Scrolls+3                                                      ;8FBFC8;
    LDA.B #$02                                                           ;8FBFCC;
    STA.L Scrolls+4                                                      ;8FBFCE;
    LDA.B #$00                                                           ;8FBFD2;
    STA.L Scrolls+6                                                      ;8FBFD4;
    PLP                                                                  ;8FBFD8;
    RTS                                                                  ;8FBFD9;


;;; $BFDA: Door ASM: scroll 0..1 = blue ;;;
DoorASM_Scroll_0_1_Blue:
; Room $AA82, door list index 0: Door
    PHP                                                                  ;8FBFDA;
    SEP #$20                                                             ;8FBFDB;
    LDA.B #$01                                                           ;8FBFDD;
    STA.L Scrolls                                                        ;8FBFDF;
    STA.L Scrolls+1                                                      ;8FBFE3;
    PLP                                                                  ;8FBFE7;
    RTS                                                                  ;8FBFE8;


;;; $BFE9: Door ASM: scroll 0 = blue, 1 = red ;;;
DoorASM_Scroll_0_Blue_1_Red:
; Room $ACF0, door list index 0: Door
    PHP                                                                  ;8FBFE9;
    SEP #$20                                                             ;8FBFEA;
    LDA.B #$00                                                           ;8FBFEC;
    STA.L Scrolls+1                                                      ;8FBFEE;
    LDA.B #$01                                                           ;8FBFF2;
    STA.L Scrolls                                                        ;8FBFF4;
    PLP                                                                  ;8FBFF8;
    RTS                                                                  ;8FBFF9;


;;; $BFFA: Door ASM: scroll Ah = green ;;;
DoorASM_Scroll_A_Green:
; Room $A865, door list index 1: Door
    PHP                                                                  ;8FBFFA;
    SEP #$20                                                             ;8FBFFB;
    LDA.B #$02                                                           ;8FBFFD;
    STA.L Scrolls+$A                                                     ;8FBFFF;
    PLP                                                                  ;8FC003;
    RTS                                                                  ;8FC004;


if !FEATURE_KEEP_UNREFERENCED
;;; $C005: Unused. Door ASM: scroll 0 = blue, 2 = red ;;;
UNUSED_DoorASM_Scroll_0_Blue_2_Red_8FC005:
    PHP                                                                  ;8FC005;
    SEP #$20                                                             ;8FC006;
    LDA.B #$01                                                           ;8FC008;
    STA.L Scrolls                                                        ;8FC00A;
    LDA.B #$00                                                           ;8FC00E;
    STA.L Scrolls+2                                                      ;8FC010;
    PLP                                                                  ;8FC014;
    RTS                                                                  ;8FC015;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C016: Door ASM: scroll 0,2 = green ;;;
DoorASM_Scroll_0_2_Green:
; Room $A9E5, door list index 0: Door
    PHP                                                                  ;8FC016;
    SEP #$20                                                             ;8FC017;
    LDA.B #$02                                                           ;8FC019;
    STA.L Scrolls                                                        ;8FC01B;
    STA.L Scrolls+2                                                      ;8FC01F;
    PLP                                                                  ;8FC023;
    RTS                                                                  ;8FC024;


;;; $C025: Door ASM: scroll 6..7 = blue, 8 = red ;;;
DoorASM_Scroll_6_7_Blue_8_Red:
; Room $AE74, door list index 1: Door
    PHP                                                                  ;8FC025;
    SEP #$20                                                             ;8FC026;
    LDA.B #$01                                                           ;8FC028;
    STA.L Scrolls+6                                                      ;8FC02A;
    STA.L Scrolls+7                                                      ;8FC02E;
    LDA.B #$00                                                           ;8FC032;
    STA.L Scrolls+8                                                      ;8FC034;
    PLP                                                                  ;8FC038;
    RTS                                                                  ;8FC039;


;;; $C03A: Door ASM: scroll 2 = red, 3 = blue ;;;
DoorASM_Scroll_2_Red_3_Blue:
; Room $A890, door list index 0: Door
    PHP                                                                  ;8FC03A;
    SEP #$20                                                             ;8FC03B;
    LDA.B #$00                                                           ;8FC03D;
    STA.L Scrolls+2                                                      ;8FC03F;
    LDA.B #$01                                                           ;8FC043;
    STA.L Scrolls+3                                                      ;8FC045;
    PLP                                                                  ;8FC049;
    RTS                                                                  ;8FC04A;


;;; $C04B: Door ASM: scroll 7 = green ;;;
DoorASM_Scroll_7_Green:
; Room $B62B, door list index 1: Door
    PHP                                                                  ;8FC04B;
    SEP #$20                                                             ;8FC04C;
    LDA.B #$02                                                           ;8FC04E;
    STA.L Scrolls+7                                                      ;8FC050;
    PLP                                                                  ;8FC054;
    RTS                                                                  ;8FC055;


;;; $C056: Door ASM: scroll 1 = red, 2 = blue ;;;
DoorASM_Scroll_1_Red_2_Blue:
; Room $B2DA, door list index 1: Door
; Room $B457, door list index 0: Door
    PHP                                                                  ;8FC056;
    SEP #$20                                                             ;8FC057;
    LDA.B #$00                                                           ;8FC059;
    STA.L Scrolls+1                                                      ;8FC05B;
    LDA.B #$01                                                           ;8FC05F;
    STA.L Scrolls+2                                                      ;8FC061;
    PLP                                                                  ;8FC065;
    RTS                                                                  ;8FC066;


;;; $C067: Door ASM: scroll 0 = blue, 3 = red ;;;
DoorASM_Scroll_0_Blue_3_Red:
; Room $B4E5, door list index 1: Door
    PHP                                                                  ;8FC067;
    SEP #$20                                                             ;8FC068;
    LDA.B #$00                                                           ;8FC06A;
    STA.L Scrolls+3                                                      ;8FC06C;
    LDA.B #$01                                                           ;8FC070;
    STA.L Scrolls                                                        ;8FC072;
    PLP                                                                  ;8FC076;
    RTS                                                                  ;8FC077;


;;; $C078: Door ASM: scroll 1 = blue, 4 = red ;;;
DoorASM_Scroll_1_Blue_4_Red:
; Room $B55A, door list index 0: Door
    PHP                                                                  ;8FC078;
    SEP #$20                                                             ;8FC079;
    LDA.B #$01                                                           ;8FC07B;
    STA.L Scrolls+1                                                      ;8FC07D;
    LDA.B #$00                                                           ;8FC081;
    STA.L Scrolls+4                                                      ;8FC083;
    PLP                                                                  ;8FC087;
    RTS                                                                  ;8FC088;


;;; $C089: Door ASM: scroll 0 = blue, 1..3 = red ;;;
DoorASM_Scroll_0_Blue_1_2_3_Red:
; Room $B1E5, door list index 0: Door
    PHP                                                                  ;8FC089;
    SEP #$20                                                             ;8FC08A;
    LDA.B #$01                                                           ;8FC08C;
    STA.L Scrolls                                                        ;8FC08E;
    LDA.B #$00                                                           ;8FC092;
    STA.L Scrolls+1                                                      ;8FC094;
    STA.L Scrolls+2                                                      ;8FC098;
    STA.L Scrolls+3                                                      ;8FC09C;
    PLP                                                                  ;8FC0A0;
    RTS                                                                  ;8FC0A1;


;;; $C0A2: Door ASM: scroll 0 = green ;;;
DoorASM_Scroll_0_Green_duplicate:
; Room $B40A, door list index 1: Door
    PHP                                                                  ;8FC0A2;
    SEP #$20                                                             ;8FC0A3;
    LDA.B #$02                                                           ;8FC0A5;
    STA.L Scrolls                                                        ;8FC0A7;
    PLP                                                                  ;8FC0AB;
    RTS                                                                  ;8FC0AC;


;;; $C0AD: Door ASM: scroll 0..1 = blue, 4 = red ;;;
DoorASM_Scroll_0_1_Blue_4_Red:
; Room $B510, door list index 1: Door
    PHP                                                                  ;8FC0AD;
    SEP #$20                                                             ;8FC0AE;
    LDA.B #$01                                                           ;8FC0B0;
    STA.L Scrolls                                                        ;8FC0B2;
    STA.L Scrolls+1                                                      ;8FC0B6;
    LDA.B #$00                                                           ;8FC0BA;
    STA.L Scrolls+4                                                      ;8FC0BC;
    PLP                                                                  ;8FC0C0;
    RTS                                                                  ;8FC0C1;


;;; $C0C2: Door ASM: scroll 0 = blue, 3 = red ;;;
DoorASM_Scroll_0_Blue_3_Red_duplicate:
; Room $B6EE, door list index 2: Door
    PHP                                                                  ;8FC0C2;
    SEP #$20                                                             ;8FC0C3;
    LDA.B #$01                                                           ;8FC0C5;
    STA.L Scrolls                                                        ;8FC0C7;
    LDA.B #$00                                                           ;8FC0CB;
    STA.L Scrolls+3                                                      ;8FC0CD;
    PLP                                                                  ;8FC0D1;
    RTS                                                                  ;8FC0D2;


;;; $C0D3: Door ASM: scroll 0 = blue ;;;
DoorASM_Scroll_0_Blue_duplicate:
; Room $AC5A, door list index 0: Door
    PHP                                                                  ;8FC0D3;
    SEP #$20                                                             ;8FC0D4;
    LDA.B #$01                                                           ;8FC0D6;
    STA.L Scrolls                                                        ;8FC0D8;
    PLP                                                                  ;8FC0DC;
    RTS                                                                  ;8FC0DD;


;;; $C0DE: Door ASM: scroll 0 = blue, 1 = red ;;;
DoorASM_Scroll_0_Blue_1_Red_duplicate:
; Room $ACB3, door list index 3: Door
    PHP                                                                  ;8FC0DE;
    SEP #$20                                                             ;8FC0DF;
    LDA.B #$01                                                           ;8FC0E1;
    STA.L Scrolls                                                        ;8FC0E3;
    LDA.B #$00                                                           ;8FC0E7;
    STA.L Scrolls+1                                                      ;8FC0E9;
    PLP                                                                  ;8FC0ED;
    RTS                                                                  ;8FC0EE;


;;; $C0EF: Door ASM: scroll 18h = blue ;;;
DoorASM_Scroll_18_Blue:
; Room $A8F8, door list index 0: Door
    PHP                                                                  ;8FC0EF;
    SEP #$20                                                             ;8FC0F0;
    LDA.B #$01                                                           ;8FC0F2;
    STA.L Scrolls+$18                                                    ;8FC0F4;
    PLP                                                                  ;8FC0F8;
    RTS                                                                  ;8FC0F9;


;;; $C0FA: Door ASM: scroll 2 = blue, 3 = red ;;;
DoorASM_Scroll_2_Blue_3_Red:
; Room $AFFB, door list index 1: Door
    PHP                                                                  ;8FC0FA;
    SEP #$20                                                             ;8FC0FB;
    LDA.B #$00                                                           ;8FC0FD;
    STA.L Scrolls+3                                                      ;8FC0FF;
    LDA.B #$01                                                           ;8FC103;
    STA.L Scrolls+2                                                      ;8FC105;
    PLP                                                                  ;8FC109;
    RTS                                                                  ;8FC10A;


;;; $C10B: Door ASM: scroll Eh = red ;;;
DoorASM_Scroll_E_Red:
; Room $B4AD, door list index 0: Door
    PHP                                                                  ;8FC10B;
    SEP #$20                                                             ;8FC10C;
    LDA.B #$00                                                           ;8FC10E;
    STA.L Scrolls+$E                                                     ;8FC110;
    PLP                                                                  ;8FC114;
    RTS                                                                  ;8FC115;


;;; $C116: Main ASM: scrolling sky land ;;;
MainASM_ScrollingSkyLand:
; Room $91F8, state $9213. Landing site, power bombs
; Room $91F8, state $922D. Landing site, Zebes is awake
; Room $91F8, state $9247. Landing site, default
; Room $93AA. Landing site power bomb room
    JSL.L RoomMainASM_ScrollingSkyLand                                   ;8FC116;
    RTS                                                                  ;8FC11A;


;;; $C11B: Main ASM: scrolling sky ocean ;;;
MainASM_ScrollingSkyOcean:
; Room $93FE. Wrecked Ship entrance
; Room $94FD. Wrecked Ship back door
; Room $968F. Orange zoomer room
    JSL.L RoomMainASM_ScrollingSkyOcean                                  ;8FC11B;
    RTS                                                                  ;8FC11F;


;;; $C120: Main ASM: scrolling sky land, Zebes timebomb set ;;;
MainASM_ScrollingSkyLand_ZebesTimebombSet:
; Room $91F8, state $9261. Landing site, Zebes timebomb set
    JSL.L RoomMainASM_ScrollingSkyLand                                   ;8FC120; fallthrough to MainASM_SetScreenShaking_GenerateRandomExplosions


;;; $C124: Main ASM: set screen shaking and generate random explosions ;;;
MainASM_SetScreenShaking_GenerateRandomExplosions:
; Room $92FD, state $9348. Crateria mainstreet, Zebes timebomb set
; Room $96BA, state $9705. Old Tourian escape shaft, Zebes timebomb set
; Room $9804, state $984F. Bomb Torizo's room, Zebes timebomb set
; Room $9879, state $98C4. Pre Bomb Torizo room, Zebes timebomb set
    JSR.W GenerateRandomExplosionOnEvenFramesOnRandomNonBlankTile        ;8FC124;
    LDA.W EarthquakeTimer                                                ;8FC127;
    ORA.W #$8000                                                         ;8FC12A;
    STA.W EarthquakeTimer                                                ;8FC12D;
    RTS                                                                  ;8FC130;


;;; $C131: Generate random explosion on even frames on random non-blank tile ;;;
GenerateRandomExplosionOnEvenFramesOnRandomNonBlankTile:
    LDA.W TimeIsFrozenFlag                                               ;8FC131;
    BNE .return                                                          ;8FC134;
    LDA.W NMI_FrameCounter                                               ;8FC136;
    AND.W #$0001                                                         ;8FC139;
    BNE .return                                                          ;8FC13C;
    JSL.L GenerateRandomNumber                                           ;8FC13E;
    PHA                                                                  ;8FC142;
    AND.W #$00FF                                                         ;8FC143;
    CLC                                                                  ;8FC146;
    ADC.W Layer1XPosition                                                ;8FC147;
    STA.B DP_Temp12                                                      ;8FC14A;
    PLA                                                                  ;8FC14C;
    XBA                                                                  ;8FC14D;
    AND.W #$00FF                                                         ;8FC14E;
    CLC                                                                  ;8FC151;
    ADC.W Layer1YPosition                                                ;8FC152;
    STA.B DP_Temp14                                                      ;8FC155;
    LSR                                                                  ;8FC157;
    LSR                                                                  ;8FC158;
    LSR                                                                  ;8FC159;
    LSR                                                                  ;8FC15A;
    SEP #$20                                                             ;8FC15B;
    PHA                                                                  ;8FC15D;
    LDA.W RoomWidthBlocks                                                ;8FC15E;
    STA.W $4202                                                          ;8FC161;
    PLA                                                                  ;8FC164;
    STA.W $4203                                                          ;8FC165;
    REP #$20                                                             ;8FC168;
    LDA.B DP_Temp12                                                      ;8FC16A;
    LSR                                                                  ;8FC16C;
    LSR                                                                  ;8FC16D;
    LSR                                                                  ;8FC16E;
    LSR                                                                  ;8FC16F;
    CLC                                                                  ;8FC170;
    ADC.W $4216                                                          ;8FC171;
    ASL                                                                  ;8FC174;
    TAX                                                                  ;8FC175;
    LDA.L LevelData,X                                                    ;8FC176;
    AND.W #$03FF                                                         ;8FC17A;
    CMP.W #$00FF                                                         ;8FC17D;
    BNE GenerateRandomExplosionAt_12_14                                  ;8FC180;

  .return:
    RTS                                                                  ;8FC182;


;;; $C183: Generate random explosion on every fourth frame ;;;
GenerateRandomExplosionOnEveryFourthFrame:
    LDA.W TimeIsFrozenFlag                                               ;8FC183;
    BNE GenerateRandomExplosionAt_12_14_return                           ;8FC186;
    LDA.W NMI_FrameCounter                                               ;8FC188;
    AND.W #$0003                                                         ;8FC18B;
    BNE GenerateRandomExplosionAt_12_14_return                           ;8FC18E;
    JSL.L GenerateRandomNumber                                           ;8FC190;
    PHA                                                                  ;8FC194;
    AND.W #$00FF                                                         ;8FC195;
    CLC                                                                  ;8FC198;
    ADC.W Layer1XPosition                                                ;8FC199;
    STA.B DP_Temp12                                                      ;8FC19C;
    PLA                                                                  ;8FC19E;
    XBA                                                                  ;8FC19F;
    AND.W #$00FF                                                         ;8FC1A0;
    CLC                                                                  ;8FC1A3;
    ADC.W Layer1YPosition                                                ;8FC1A4;
    STA.B DP_Temp14                                                      ;8FC1A7; fallthrough to GenerateRandomExplosionAt_12_14


;;; $C1A9: Generate random explosion at ([$12], [$14]) ;;;
GenerateRandomExplosionAt_12_14:
; Note that if [random number] & Fh >= 8, then X is some garbage value (instead of random) for the purposes of indexing the sprite object IDs array
    JSL.L GenerateRandomNumber                                           ;8FC1A9;
    AND.W #$000F                                                         ;8FC1AD;
    CMP.W #$0008                                                         ;8FC1B0;
    BCS +                                                                ;8FC1B3;
    TAX                                                                  ;8FC1B5;
    LDA.W ExplosionSoundEffects,X                                        ;8FC1B6;
    AND.W #$00FF                                                         ;8FC1B9;
    BEQ +                                                                ;8FC1BC;
    JSL.L QueueSound_Lib2_Max6                                           ;8FC1BE;

+   TXA                                                                  ;8FC1C2;
    AND.W #$0007                                                         ;8FC1C3;
    TAX                                                                  ;8FC1C6;
    LDA.W ExplosionSpriteObjectIDs,X                                     ;8FC1C7;
    AND.W #$00FF                                                         ;8FC1CA;
    STA.B DP_Temp16                                                      ;8FC1CD;
    STZ.B DP_Temp18                                                      ;8FC1CF;
    JSL.L Create_Sprite_Object                                           ;8FC1D1;

  .return:
    RTS                                                                  ;8FC1D5;

ExplosionSpriteObjectIDs:
; 3 = small explosion, 9 = small dust cloud, Ch = smoke, 12h = short big dust cloud, 15h = big dust cloud
    db $03,$03,$09,$0C,$0C,$12,$12,$15                                   ;8FC1D6;

ExplosionSoundEffects:
    db $24,$00,$00,$25,$00,$00,$00,$00                                   ;8FC1DE;


;;; $C1E6: Main ASM: scroll screen right in Dachora room ;;;
MainASM_ScrollScreenRightInDachoraRoom:
; Room $9CB3. Dachora room
; The intent of the code is probably to scroll the screen so that it's centred when falling down the shaft;
; in practice, the conditions for the scrolling never occur
    LDA.L Scrolls+$B                                                     ;8FC1E6;
    AND.W #$00FF                                                         ;8FC1EA;
    CMP.W #$0002                                                         ;8FC1ED;
    BNE .return                                                          ;8FC1F0;
    LDA.W Layer1YPosition                                                ;8FC1F2;
    CMP.W #$0500                                                         ;8FC1F5;
    BCS .return                                                          ;8FC1F8;
    LDA.W Layer1XPosition                                                ;8FC1FA;
    CMP.W #$0380                                                         ;8FC1FD;
    BCS .return                                                          ;8FC200;
    ADC.W #$0003                                                         ;8FC202;
    STA.W Layer1XPosition                                                ;8FC205;

  .return:
    RTS                                                                  ;8FC208;


if !FEATURE_KEEP_UNREFERENCED
;;; $C209: Unused. PLM metadata - Crateria / Brinstar / Norfair ;;;
UNUSED_8FC209:                                                           ;8FC209;
; See UNUSED_UnknownUnreferenced_8FE881 for the other areas
    dw $0051 ; "Next" item / refill station index (50h is the last used one, see "Item PLMs.asm")
    dw $0061 ; "Next" doorcap index (60h is the last used one, see "Door PLMs.asm")
    dw $0001 ; ?
    dw $0002 ; Number of save stations in Crateria
    dw $0005 ; Number of save stations in Brinstar
    dw $0006 ; Number of save stations in Norfair
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C215: PLM populations ;;;
PLMPopulation_BowlingAlley_State0:                                       ;8FC215;
    %PLMPopEntry(PLMEntries_ScrollPLM, $1F, $2D, RoomPLM_BowlingAlley_0)
    %PLMPopEntry(PLMEntries_upwardsExtension, $41, $26, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $41, $27, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $41, $28, RoomPLM_BowlingAlley_3)
    dw $0000                                                             ;8FC22D;

PLMPopulation_WreckedShipEntrance_State0:
    dw $0000                                                             ;8FC22F;

PLMPopulation_Attic_State0:                                              ;8FC231;
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $06, $0080)
    %PLMPopEntry(PLMEntries_greyDoorFacingLeft, $6E, $06, $0081)
    %PLMPopEntry(PLMEntries_wreckedShipAttic, $08, $08, $8000)
    dw $0000

PLMPopulation_AssemblyLine_State0:
    dw $0000                                                             ;8FC245;

PLMPopulation_WreckedShipMainShaft:                                      ;8FC247;
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
    dw $0000                                                             ;8FC27F;

PLMPopulation_ElectricDeath_State0:                                      ;8FC281;
    %PLMPopEntry(PLMEntries_ScrollPLM, $07, $10, RoomPLM_ElectricDeath_0)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $08, $10, $8000)
    dw $0000

PLMPopulation_WreckedShipETank_State0:
    dw $0000                                                             ;8FC28F;

PLMPopulation_Basement_State0:                                           ;8FC291;
    %PLMPopEntry(PLMEntries_ScrollPLM, $40, $0C, RoomPLM_Basement_0)
    %PLMPopEntry(PLMEntries_ScrollPLM, $46, $0C, RoomPLM_Basement_1)
    %PLMPopEntry(PLMEntries_EyeDoorFacingLeft, $4E, $06, $0085)
    %PLMPopEntry(PLMEntries_EyeDoorBottomFacingLeft, $4E, $09, $0085)
    %PLMPopEntry(PLMEntries_EyeDoorEyeFacingLeft, $4E, $07, $0085)
    dw $0000

PLMPopulation_WreckedShipMap_State0:
    dw $0000                                                             ;8FC2B1;

PLMPopulation_Phantoon:                                                  ;8FC2B3;
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $06, $0086)
    dw $0000

PLMPopulation_SpongeBath_State0:
    dw $0000                                                             ;8FC2BB;

PLMPopulation_WSWestSuper_State0:
    dw $0000                                                             ;8FC2BD;

PLMPopulation_WSEastSuper_State0:                                        ;8FC2BF;
    %PLMPopEntry(PLMEntries_ScrollPLM, $2F, $07, RoomPLM_WSEastSuper_0)
    dw $0000

PLMPopulation_GravitySuit_State0_WreckedShipSave_State0:
    dw $0000                                                             ;8FC2C7;

PLMPopulation_WreckedShipSave_State1:                                    ;8FC2C9;
    %PLMPopEntry(PLMEntries_saveStation, $07, $0B, $0000)
    dw $0000

PLMPopulation_BowlingAlley_State1:                                       ;8FC2D1;
    %PLMPopEntry(PLMEntries_ScrollPLM, $1F, $2D, RoomPLM_BowlingAlley_0)
    %PLMPopEntry(PLMEntries_upwardsExtension, $41, $26, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $41, $27, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $41, $28, RoomPLM_BowlingAlley_3)
    %PLMPopEntry(PLMEntries_ReserveTankChozoOrb, $53, $0B, $0081)
    %PLMPopEntry(PLMEntries_MissileTank, $3C, $26, $0082)
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $16, $9087)
    dw $0000

PLMPopulation_WreckedShipEntrance_State1:
    dw $0000                                                             ;8FC2FD;

PLMPopulation_Attic_State1:                                              ;8FC2FF;
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $06, $0C88)
    %PLMPopEntry(PLMEntries_greyDoorFacingLeft, $6E, $06, $0C89)
    %PLMPopEntry(PLMEntries_greyDoorFacingUp, $46, $0E, $0C8A)
    %PLMPopEntry(PLMEntries_wreckedShipAttic, $08, $08, $8000)
    dw $0000

PLMPopulation_AssemblyLine_State1:                                       ;8FC319;
    %PLMPopEntry(PLMEntries_MissileTank, $2D, $08, $0083)
    dw $0000

PLMPopulation_SpikyDeath_State1:
    dw $0000                                                             ;8FC321;

PLMPopulation_ElectricDeath_State1:                                      ;8FC323;
    %PLMPopEntry(PLMEntries_ScrollPLM, $07, $10, RoomPLM_ElectricDeath_0)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $08, $10, $8000)
    %PLMPopEntry(PLMEntries_redDoorFacingRight, $01, $06, $008B)
    dw $0000

PLMPopulation_WreckedShipETank_State1:                                   ;8FC337;
    %PLMPopEntry(PLMEntries_EnergyTank, $03, $06, $0084)
    dw $0000

PLMPopulation_Basement_State1:                                           ;8FC33F;
    %PLMPopEntry(PLMEntries_ScrollPLM, $40, $0C, RoomPLM_Basement_0)
    %PLMPopEntry(PLMEntries_ScrollPLM, $46, $0C, RoomPLM_Basement_1)
    dw $0000

PLMPopulation_WreckedShipMap_State1:                                     ;8FC34D;
    %PLMPopEntry(PLMEntries_mapStation, $05, $0A, $8000)
    dw $0000

PLMPopulation_SpongeBath_State1:
    dw $0000                                                             ;8FC355;

PLMPopulation_WSWestSuper_State1:                                        ;8FC357;
    %PLMPopEntry(PLMEntries_SuperMissileTank, $02, $07, $0085)
    dw $0000

PLMPopulation_WSEastSuper_State1:                                        ;8FC35F;
    %PLMPopEntry(PLMEntries_ScrollPLM, $2F, $07, RoomPLM_WSEastSuper_0)
    %PLMPopEntry(PLMEntries_SuperMissileTank, $38, $09, $0086)
    dw $0000

PLMPopulation_GravitySuit_State1:                                        ;8FC36D;
    %PLMPopEntry(PLMEntries_GravitySuitChozoOrb, $07, $09, $0087)
    dw $0000

PLMPopulation_GlassTunnelSave:                                           ;8FC375;
    %PLMPopEntry(PLMEntries_saveStation, $07, $0B, $0000)
    dw $0000

PLMPopulation_GlassTunnel_State0_1:                                      ;8FC37D;
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
    dw $0000                                                             ;8FC3DF;

PLMPopulation_EastTunnel:                                                ;8FC3E1;
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

PLMPopulation_MainStreet:                                                ;8FC42B;
    %PLMPopEntry(PLMEntries_ScrollPLM, $25, $29, RoomPLM_MainStreet_0)
    %PLMPopEntry(PLMEntries_redDoorFacingLeft, $1E, $76, $008D)
    %PLMPopEntry(PLMEntries_MissileTank, $0E, $35, $0088)
    %PLMPopEntry(PLMEntries_SuperMissileTank, $16, $28, $0089)
    dw $0000

PLMPopulation_FishTank:                                                  ;8FC445;
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

PLMPopulation_MamaTurtle:                                                ;8FC47D;
    %PLMPopEntry(PLMEntries_EnergyTank, $1F, $0A, $008A)
    %PLMPopEntry(PLMEntries_MissileTankShotBlock, $2C, $1D, $008B)
    dw $0000

PLMPopulation_CrabTunnel:                                                ;8FC48B;
    %PLMPopEntry(PLMEntries_downwardsClosedGate, $0E, $07, $8000)
    %PLMPopEntry(PLMEntries_downwardsGateShotblock, $0E, $07, $0008)
    dw $0000

PLMPopulation_MtEverest:
    dw $0000                                                             ;8FC499;

PLMPopulation_RedFish:                                                   ;8FC49B;
    %PLMPopEntry(PLMEntries_ScrollPLM, $20, $06, RoomPLM_RedFish_0)
    %PLMPopEntry(PLMEntries_ScrollPLM, $1E, $06, RoomPLM_RedFish_1)
    dw $0000

PLMPopulation_WateringHole:                                              ;8FC4A9;
    %PLMPopEntry(PLMEntries_ScrollPLM, $07, $1F, RoomPLM_WateringHole_0)
    %PLMPopEntry(PLMEntries_SuperMissileTank, $04, $26, $008C)
    %PLMPopEntry(PLMEntries_MissileTank, $0B, $27, $008D)
    dw $0000

PLMPopulation_NWestMaridiaBug:                                           ;8FC4BD;
    %PLMPopEntry(PLMEntries_upwardsExtension, $20, $16, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $20, $17, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $20, $18, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $20, $19, RoomPLM_NWestMaridiaBug_3_7)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0F, $16, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0F, $17, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0F, $18, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $0F, $19, RoomPLM_NWestMaridiaBug_3_7)
    dw $0000

PLMPopulation_CrabShaft:                                                 ;8FC4EF;
    %PLMPopEntry(PLMEntries_ScrollPLM, $07, $2D, RoomPLM_CrabShaft_0)
    %PLMPopEntry(PLMEntries_rightwardsExtension, $08, $2D, $8000)
    %PLMPopEntry(PLMEntries_greenDoorFacingLeft, $1E, $36, $008F)
    dw $0000

PLMPopulation_PseudoPlasmaSpark:                                         ;8FC503;
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

PLMPopulation_CrabHole:                                                  ;8FC53B;
    %PLMPopEntry(PLMEntries_ScrollPLM, $08, $0E, RoomPLM_CrabHole_0_1)
    %PLMPopEntry(PLMEntries_ScrollPLM, $08, $11, RoomPLM_CrabHole_0_1)
    %PLMPopEntry(PLMEntries_redDoorFacingLeft, $0E, $16, $0090)
    dw $0000

PLMPopulation_WestSandHallTunnel:
    dw $0000                                                             ;8FC54F;

PLMPopulation_PlasmaTutorial:
    dw $0000                                                             ;8FC551;

PLMPopulation_Plasma:                                                    ;8FC553;
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $06, $0C91)
    %PLMPopEntry(PLMEntries_PlasmaBeamChozoOrb, $19, $26, $008F)
    dw $0000

PLMPopulation_ThreadTheNeedle:
    dw $0000                                                             ;8FC561;

PLMPopulation_MaridiaElev:                                               ;8FC563;
    %PLMPopEntry(PLMEntries_elevatorPlatform, $06, $2C, $8000)
    %PLMPopEntry(PLMEntries_redDoorFacingLeft, $0E, $46, $0092)
    dw $0000

PLMPopulation_PlasmaSpark:                                               ;8FC571;
    %PLMPopEntry(PLMEntries_greyDoorFacingLeft, $2E, $16, $0093)
    %PLMPopEntry(PLMEntries_greenDoorFacingUp, $06, $2D, $0094)
    dw $0000

PLMPopulation_Kassiuz:
    dw $0000                                                             ;8FC57F;

PLMPopulation_MaridiaMap:                                                ;8FC581;
    %PLMPopEntry(PLMEntries_mapStation, $0B, $0A, $8000)
    dw $0000

PLMPopulation_ForgottenHighwaySave:                                      ;8FC589;
    %PLMPopEntry(PLMEntries_saveStation, $07, $0B, $0001)
    dw $0000

PLMPopulation_Toilet:
    dw $0000                                                             ;8FC591;

PLMPopulation_BugSandHole:
    dw $0000                                                             ;8FC593;

PLMPopulation_WestSandHall:
    dw $0000                                                             ;8FC595;

PLMPopulation_Oasis:                                                     ;8FC597;
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
    dw $0000                                                             ;8FC5DB;

PLMPopulation_WestSandHole:                                              ;8FC5DD;
    %PLMPopEntry(PLMEntries_MissileTank, $06, $04, $0090)
    %PLMPopEntry(PLMEntries_ReserveTankChozoOrb, $0F, $04, $0091)
    dw $0000

PLMPopulation_EastSandHole:                                              ;8FC5EB;
    %PLMPopEntry(PLMEntries_MissileTank, $03, $07, $0092)
    %PLMPopEntry(PLMEntries_PowerBombTank, $19, $10, $0093)
    dw $0000

PLMPopulation_WestAqueductQuicksand:
    dw $0000                                                             ;8FC5F9;

PLMPopulation_EastAqueductQuicksand:
    dw $0000                                                             ;8FC5FB;

PLMPopulation_Aqueduct:                                                  ;8FC5FD;
    %PLMPopEntry(PLMEntries_redDoorFacingRight, $01, $26, $0096)
    %PLMPopEntry(PLMEntries_MissileTank, $4C, $09, $0094)
    %PLMPopEntry(PLMEntries_SuperMissileTank, $5C, $08, $0095)
    dw $0000

PLMPopulation_Butterfly:                                                 ;8FC611;
    %PLMPopEntry(PLMEntries_greyDoorFacingLeft, $0E, $06, $0097)
    dw $0000

PLMPopulation_BotwoonHallway:
    dw $0000                                                             ;8FC619;

PLMPopulation_Pants:                                                     ;8FC61B;
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

PLMPopulation_EastPants:                                                 ;8FC6AD;
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

PLMPopulation_Springball:                                                ;8FC6E5;
    %PLMPopEntry(PLMEntries_SpringBallChozoOrb, $18, $16, $0096)
    dw $0000

PLMPopulation_BelowBotwoonETank:
    dw $0000                                                             ;8FC6ED;

PLMPopulation_Colosseum:                                                 ;8FC6EF;
    %PLMPopEntry(PLMEntries_redDoorFacingLeft, $6E, $06, $0098)
    %PLMPopEntry(PLMEntries_greenDoorFacingLeft, $4E, $26, $0099)
    %PLMPopEntry(PLMEntries_greenDoorFacingLeft, $6E, $16, $009A)
    dw $0000

PLMPopulation_AqueductSave:                                              ;8FC703;
    %PLMPopEntry(PLMEntries_saveStation, $05, $0B, $0002)
    dw $0000

PLMPopulation_ThePrecious_State0_1:                                      ;8FC70B;
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

PLMPopulation_BotwoonETank:                                              ;8FC755;
    %PLMPopEntry(PLMEntries_EnergyTank, $32, $05, $0098)
    dw $0000

PLMPopulation_DraygonSave:                                               ;8FC75D;
    %PLMPopEntry(PLMEntries_saveStation, $07, $0B, $0003)
    dw $0000

PLMPopulation_MaridiaMissileRefill:                                      ;8FC765;
    %PLMPopEntry(PLMEntries_missileStation, $08, $0A, $0099)
    dw $0000

PLMPopulation_PlasmaBeachQuicksand:
    dw $0000                                                             ;8FC76D;

PLMPopulation_BotwoonQuicksand:
    dw $0000                                                             ;8FC76F;

PLMPopulation_Shaktool_State0_1:
    dw $0000                                                             ;8FC771;

PLMPopulation_HalfieClimb:                                               ;8FC773;
    %PLMPopEntry(PLMEntries_ScrollPLM, $10, $29, RoomPLM_HalfieClimb_0)
    %PLMPopEntry(PLMEntries_ScrollPLM, $0B, $29, RoomPLM_HalfieClimb_1)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0B, $28, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0B, $27, $8000)
    %PLMPopEntry(PLMEntries_upwardsExtension, $0B, $26, $8000)
    %PLMPopEntry(PLMEntries_ScrollPLM, $0E, $29, RoomPLM_HalfieClimb_5)
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $16, $009C)
    dw $0000

PLMPopulation_Botwoon_State0_1:                                          ;8FC79F;
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $06, $049D)
    dw $0000

PLMPopulation_SpaceJump:                                                 ;8FC7A7;
    %PLMPopEntry(PLMEntries_SpaceJumpChozoOrb, $04, $08, $009A)
    dw $0000

PLMPopulation_MaridiaEnergyRefill:                                       ;8FC7AF;
    %PLMPopEntry(PLMEntries_energyStation, $08, $0A, $009B)
    dw $0000

PLMPopulation_WestCactusAlley:
    dw $0000                                                             ;8FC7B7;

PLMPopulation_EastCactusAlley:
    dw $0000                                                             ;8FC7B9;

PLMPopulation_Draygon_State0_1:                                          ;8FC7BB;
    %PLMPopEntry(PLMEntries_greyDoorFacingLeft, $1E, $06, $009E)
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $16, $009F)
    %PLMPopEntry(PLMEntries_DraygonCannonFacingRight, $02, $0B, $8802)
    %PLMPopEntry(PLMEntries_DraygonCannonWithShieldFacingRight, $02, $12, $8804)
    %PLMPopEntry(PLMEntries_DraygonCannonWithShieldFacingLeft, $1D, $0F, $8806)
    %PLMPopEntry(PLMEntries_DraygonCannonWithShieldFacingLeft, $1D, $15, $8808)
    dw $0000

PLMPopulation_TourianFirst:                                              ;8FC7E1;
    %PLMPopEntry(PLMEntries_elevatorPlatform, $06, $2C, $8000)
    dw $0000

PLMPopulation_Metroids1_State0_1:                                        ;8FC7E9;
    %PLMPopEntry(PLMEntries_SetsMetroidsClearedStatesWhenRequired, $08, $08, $0012)
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $06, $0CA0)
    dw $0000

PLMPopulation_Metroids2_State0_1:                                        ;8FC7F7;
    %PLMPopEntry(PLMEntries_SetsMetroidsClearedStatesWhenRequired, $08, $08, $0014)
    %PLMPopEntry(PLMEntries_greyDoorFacingLeft, $0E, $16, $0CA1)
    dw $0000

PLMPopulation_Metroids3_State0_1:                                        ;8FC805;
    %PLMPopEntry(PLMEntries_SetsMetroidsClearedStatesWhenRequired, $08, $08, $0016)
    %PLMPopEntry(PLMEntries_greyDoorFacingLeft, $5E, $06, $0CA2)
    dw $0000

PLMPopulation_Metroids4_State0_1:                                        ;8FC813;
    %PLMPopEntry(PLMEntries_SetsMetroidsClearedStatesWhenRequired, $08, $08, $0018)
    %PLMPopEntry(PLMEntries_greyDoorFacingUp, $06, $1E, $0CA3)
    dw $0000

PLMPopulation_BlueHopper_State0_1:
    dw $0000                                                             ;8FC821;

PLMPopulation_DustTorizo_State0_1:                                       ;8FC823;
    %PLMPopEntry(PLMEntries_greyDoorFacingLeft, $1E, $06, $90A4)
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $06, $0CA5)
    dw $0000

PLMPopulation_BigBoy_State0_1:                                           ;8FC831;
    %PLMPopEntry(PLMEntries_greyDoorFacingLeft, $3E, $06, $90A6)
    dw $0000

PLMPopulation_Seaweed:                                                   ;8FC839;
    %PLMPopEntry(PLMEntries_redDoorFacingLeft, $0E, $16, $00A7)
    dw $0000

PLMPopulation_TourianRecharge:                                           ;8FC841;
    %PLMPopEntry(PLMEntries_missileStation, $08, $0A, $009C)
    %PLMPopEntry(PLMEntries_energyStation, $06, $0A, $009D)
    dw $0000

PLMPopulation_MotherBrain_State0_1_2:                                    ;8FC84F;
    %PLMPopEntry(PLMEntries_MotherBrainsGlass, $09, $05, $8000)
    dw $0000

PLMPopulation_TourianEyeDoor:                                            ;8FC857;
    %PLMPopEntry(PLMEntries_EyeDoorFacingLeft, $3E, $06, $00A8)
    %PLMPopEntry(PLMEntries_EyeDoorBottomFacingLeft, $3E, $09, $00A8)
    %PLMPopEntry(PLMEntries_EyeDoorEyeFacingLeft, $3E, $07, $00A8)
    dw $0000

PLMPopulation_RinkaShaft:                                                ;8FC86B;
    %PLMPopEntry(PLMEntries_redDoorFacingRight, $01, $26, $00A9)
    dw $0000

PLMPopulation_MotherBrainSave:                                           ;8FC873;
    %PLMPopEntry(PLMEntries_saveStation, $05, $0B, $0000)
    dw $0000

PLMPopulation_TourianEscape1:                                            ;8FC87B;
    %PLMPopEntry(PLMEntries_SetsMetroidsClearedStatesWhenRequired, $08, $08, $0000)
    %PLMPopEntry(PLMEntries_gateThatClosesInEscapeRoom1, $1F, $06, $8000)
    dw $0000

PLMPopulation_TourianEscape2:                                            ;8FC889;
    %PLMPopEntry(PLMEntries_SetsMetroidsClearedStatesWhenRequired, $08, $08, $0002)
    %PLMPopEntry(PLMEntries_greyDoorFacingDown, $06, $03, $90AA)
    dw $0000

PLMPopulation_TourianEscape3:                                            ;8FC897;
    %PLMPopEntry(PLMEntries_SetsMetroidsClearedStatesWhenRequired, $08, $08, $0004)
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $16, $90AB)
    dw $0000

PLMPopulation_TourianEscape4:                                            ;8FC8A5;
    %PLMPopEntry(PLMEntries_SetsMetroidsClearedStatesWhenRequired, $08, $08, $0006)
    %PLMPopEntry(PLMEntries_greyDoorFacingRight, $01, $36, $90AC)
    dw $0000

PLMPopulation_UpperTourianSave:                                          ;8FC8B3;
    %PLMPopEntry(PLMEntries_saveStation, $07, $0B, $0001)
    dw $0000

PLMPopulation_CeresElev_State0_1:
    dw $0000                                                             ;8FC8BB;

PLMPopulation_FallingTile_State0_1:
    dw $0000                                                             ;8FC8BD;

PLMPopulation_MagnetStairs_State0_1:
    dw $0000                                                             ;8FC8BF;

PLMPopulation_DeadScientist_State0_1:
    dw $0000                                                             ;8FC8C1;

PLMPopulation_58Escape_State0_1:
    dw $0000                                                             ;8FC8C3;

PLMPopulation_CeresRidley_State0_1:
    dw $0000                                                             ;8FC8C5;


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
    RTS                                                                  ;8FC8C7;


;;; $C8C8: Setup ASM: spawn pre Phantoon room enemy projectile ;;;
SetupASM_SpawnPrePhantoonRoomEnemyProjectile:
; Room $CC6F. Pre Phantoon room
    LDY.W #EnemyProjectile_PrePhantoonRoom                               ;8FC8C8;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;8FC8CB;
    RTS                                                                  ;8FC8CF;


;;; $C8D0: Setup ASM: RTS ;;;
RTS_8FC8D0:
; Room $CCCB. Wrecked Ship map room
; Room $CD13. Phantoon's room
; Room $CD5C. Wrecked Ship first drowned room
; Room $CDA8. Wrecked Ship obvious super missile room
; Room $CDF1. Wrecked Ship hidden super missile hall
; Room $CE40. Gravity suit room
; Room $CE8A. Wrecked Ship save room, Phantoon dead
    RTS                                                                  ;8FC8D0;


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
    RTS                                                                  ;8FC8D1;


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
    RTS                                                                  ;8FC8D2;


;;; $C8D3: Setup ASM: set up Shaktool's room's PLM ;;;
SetupASM_SetupShaktoolsRoomPLM:
; Room $D8C5, state $D8D7. Shaktool's room, default
    JSL.L Spawn_Hardcoded_PLM                                            ;8FC8D3;
    db $00,$00                                                           ;8FC8D7;
    dw PLMEntries_shaktoolsRoom                                          ;8FC8D9;
    RTS                                                                  ;8FC8DB;


;;; $C8DC: Setup ASM: RTS ;;;
RTS_8FC8DC:
; Room $D8C5, state $D8F1. Shaktool's event is set
; Room $D913, state $D920. Maridia grapple wall shaft
; Room $D95E. Botwoon's room
; Room $D9AA. Space jump room
    RTS                                                                  ;8FC8DC;


;;; $C8DD: Setup ASM: set pausing code for Draygon ;;;
SetupASM_SetPausingCodeForDraygon:
; Room $DA60. Draygon's room
    LDA.W #PauseHook_Draygon>>8&$FF00                                    ;8FC8DD;
    STA.W PauseHook_Pause+1                                              ;8FC8E0;
    LDA.W #PauseHook_Draygon                                             ;8FC8E3;
    STA.W PauseHook_Pause                                                ;8FC8E6;
    LDA.W #UnpauseHook_Draygon>>8&$FF00                                  ;8FC8E9;
    STA.W PauseHook_Unpause+1                                            ;8FC8EC;
    LDA.W #UnpauseHook_Draygon                                           ;8FC8EF;
    STA.W PauseHook_Unpause                                              ;8FC8F2;
    RTS                                                                  ;8FC8F5;


;;; $C8F6: Pause hook - Draygon ;;;
PauseHook_Draygon:
; Set interrupt handler to main gameplay
    LDA.W #$0004                                                         ;8FC8F6;
    STA.B DP_NextIRQCmd                                                  ;8FC8F9;
    RTL                                                                  ;8FC8FB;


;;; $C8FC: Unpause hook - Draygon ;;;
UnpauseHook_Draygon:
    LDA.W HDMAObject_ChannelBitflags+2                                   ;8FC8FC;
    CMP.W #$0008                                                         ;8FC8FF;
    BNE .return                                                          ;8FC902;
    LDA.W #$000C                                                         ;8FC904;
    STA.B DP_NextIRQCmd                                                  ;8FC907;

  .return:
    RTL                                                                  ;8FC909;


;;; $C90A: Setup ASM: set collected map ;;;
SetupASM_SetCollectedMap:
; Room $DAAE. Tourian -> Crateria
    REP #$30                                                             ;8FC90A;
    LDX.W AreaIndex                                                      ;8FC90C;
    LDA.L SRAMMirror_MapStations,X                                       ;8FC90F;
    ORA.W #$0001                                                         ;8FC913;
    STA.L SRAMMirror_MapStations,X                                       ;8FC916;
    STA.W CurrentAreaMapCollectedFlag                                    ;8FC91A;
    RTS                                                                  ;8FC91D;


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
    RTS                                                                  ;8FC91E;


;;; $C91F: Setup ASM: set Zebes timebomb event and set light horizontal room shaking ;;;
SetupASM_SetZebesTimebombEvent_SetLightHorizontalRoomShaking:
; Room $DE4D. Escape room 1
; The Zebes timebomb set event was already marked by Mother Brain when she started the time ($A9:B313),
; no reason to do it here
    LDA.W #$000E                                                         ;8FC91F;
    JSL.L MarkEvent_inA                                                  ;8FC922;
    LDA.W #$0012                                                         ;8FC926;
    STA.W EarthquakeType                                                 ;8FC929;
    LDA.W #$FFFF                                                         ;8FC92C;
    STA.W EarthquakeTimer                                                ;8FC92F;
    RTS                                                                  ;8FC932;


;;; $C933: Setup ASM: set light horizontal room shaking ;;;
SetupASM_SetLightHorizontalRoomShaking:
; Room $DE7A. Escape room 2
    LDA.W #$0012                                                         ;8FC933;
    STA.W EarthquakeType                                                 ;8FC936;
    STA.W RoomMainASMVar2                                                ;8FC939;
    STZ.W RoomMainASMVar1                                                ;8FC93C;
    LDA.W #$FFFF                                                         ;8FC93F;
    STA.W EarthquakeTimer                                                ;8FC942;
    RTS                                                                  ;8FC945;


;;; $C946: Setup ASM: set medium horizontal room shaking ;;;
SetupASM_SetMediumHorizontalRoomShaking:
; Room $DEA7. Escape room 3
    LDA.W #$0015                                                         ;8FC946;
    STA.W EarthquakeType                                                 ;8FC949;
    LDA.W #$FFFF                                                         ;8FC94C;
    STA.W EarthquakeTimer                                                ;8FC94F;
    RTS                                                                  ;8FC952;


;;; $C953: Setup ASM: set up escape room 4's PLM and set medium horizontal room shaking ;;;
SetupASM_SetupEscapeRoom4sPLM_SetMediumHorizontalRoomShaking:
; Room $DEDE. Escape room 4
    JSL.L Spawn_Hardcoded_PLM                                            ;8FC953;
    db $10,$10                                                           ;8FC957;
    dw PLMEntries_RaiseAcidInEscapeRoomBeforeOldTourianEscapeShaft       ;8FC959;
    LDA.W #$0015                                                         ;8FC95B;
    STA.W EarthquakeType                                                 ;8FC95E;
    STA.W RoomMainASMVar2                                                ;8FC961;
    STZ.W RoomMainASMVar1                                                ;8FC964;
    LDA.W #$FFFF                                                         ;8FC967;
    STA.W EarthquakeTimer                                                ;8FC96A;
    RTS                                                                  ;8FC96D;


;;; $C96E: Setup ASM: turn Ceres door to solid blocks and spawn Ceres haze ;;;
SetupASM_TurnCeresDoorToSolidBlocks_SpawnCeresHaze:
; Room $DF45, state $DF71. Ceres elevator, Ceres Ridley dead
    JSL.L Spawn_Hardcoded_PLM                                            ;8FC96E; fallthrough to SetupASM_SpawnCeresHaze
    db $0F,$26                                                           ;8FC972;
    dw PLMEntries_turnCeresElevatorDoorToSolidBlocksDuringEscape         ;8FC974;


;;; $C976: Setup ASM: Spawn Ceres haze ;;;
SetupASM_SpawnCeresHaze:
; Room $DF45, state $DF57. Ceres elevator default
; Room $DF8D. Ceres pre elevator hall
; Room $DFD7. Ceres shaft
; Room $E021. Ceres baby Metroid hall
; Room $E06B. Pre Ceres Ridley hall
    JSL.L FXType_2C_CeresHaze                                            ;8FC976;
    RTS                                                                  ;8FC97A;


;;; $C97B: Setup ASM: Set BG1/2 tiles base address and spawn Ceres haze ;;;
SetupASM_SetBG1_2_TilesBaseAddress_SpawnCeresHaze:
; Room $E0B5. Ceres Ridley's room
    PHP                                                                  ;8FC97B;
    SEP #$20                                                             ;8FC97C;
    LDA.B #$66                                                           ;8FC97E;
    STA.B DP_BGTilesAddr                                                 ;8FC980;
    PLP                                                                  ;8FC982;
    JSL.L FXType_2C_CeresHaze                                            ;8FC983;
    LDA.W #$0009                                                         ;8FC987;
    STA.W CeresMode7HDMATables                                           ;8FC98A;
    RTS                                                                  ;8FC98D;


;;; $C98E: Room headers, scroll data, door lists ;;;
RoomHeader_BowlingAlley:                                                 ;8FC98E;
    %RoomHeader(\
    %room(0),
    %area(3),
    %positions($0A, $0B),
    %dimensions(6, 3),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_BowlingAlley))
    %stateChecks(1,
    %stateCheckBossDead(1, RoomState_BowlingAlley_1))

RoomState_BowlingAlley_0:                                                ;8FC9A0;
    %StateHeader(\
    %levelData(LevelData_BowlingAlley),
    %tileset(5),
    %music($30, 3),
    %FX(FXHeader_BowlingAlley_State0),
    %enemyPop(EnemyPopulations_BowlingAlley_0),
    %enemySet(EnemySets_BowlingAlley_0),
    %layer2Scrolls(0, 0),
    %scrollPointer(RoomScrolls_BowlingAlley),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_BowlingAlley_State0),
    %libraryBG(0),
    %setupASM(RTS_8FC8C7))

RoomState_BowlingAlley_1:                                                ;8FC9BA;
    %StateHeader(\
    %levelData(LevelData_BowlingAlley),
    %tileset(4),
    %music($30, 3),
    %FX(FXHeader_BowlingAlley_State1),
    %enemyPop(EnemyPopulations_BowlingAlley_1),
    %enemySet(EnemySets_BowlingAlley_1),
    %layer2Scrolls(0, 0),
    %scrollPointer(RoomScrolls_BowlingAlley),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_BowlingAlley_State1),
    %libraryBG(0),
    %setupASM(RTS_8FC8C7))

RoomDoors_BowlingAlley:
    dw Door_BowlingAlley_0                                               ;8FC9D4;
    dw Door_BowlingAlley_1                                               ;8FC9D6;
    dw Door_BowlingAlley_2                                               ;8FC9D8;

RoomScrolls_BowlingAlley:
    db $00,$00,$01,$01,$01,$02,$01,$01,$01                               ;8FC9DA;
    dw $0101                                                             ;8FC9E3;
    dw $0002                                                             ;8FC9E5;
    db $01                                                               ;8FC9E7;
    dw $0000                                                             ;8FC9E8;
    dw $0200                                                             ;8FC9EA;

RoomPLM_BowlingAlley_0:
    db $0E,$01, $0F,$01, $80                                             ;8FC9EC;

RoomPLM_BowlingAlley_3:
    db $04,$00, $05,$02, $0B,$02, $10,$01, $11,$01, $80                  ;8FC9F1;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_RoomPLM_8FC9FC:
    db $05,$01, $80                                                      ;8FC9FC;

UNUSED_RoomPLM_8FC9FF:
    db $04,$01, $80                                                      ;8FC9FF;

UNUSED_RoomPLM_8FCA02:
    db $05,$00, $80                                                      ;8FCA02;

UNUSED_RoomPLM_8FCA05:
    db $04,$00, $80                                                      ;8FCA05;
endif ; !FEATURE_KEEP_UNREFERENCED

RoomHeader_WreckedShipEntrance:                                          ;8FCA08;
    %RoomHeader(\
    %room(1),
    %area(3),
    %positions($0C, $0E),
    %dimensions(4, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_WreckedShipEntrance))
    %stateChecks(1,
    %stateCheckBossDead(1, RoomState_WreckedShipEntrance_1))

RoomState_WreckedShipEntrance_0:                                         ;8FCA1A;
    %StateHeader(\
    %levelData(LevelData_WreckedShipEntrance),
    %tileset(5),
    %music($30, 5),
    %FX(FXHeader_WreckedShipEntrance_State0),
    %enemyPop(EnemyPopulations_WreckedShipEntrance_0),
    %enemySet(EnemySets_WreckedShipEntrance_0),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_WreckedShipEntrance_State0),
    %libraryBG(LibBG_WreckedShip_4_5_EntranceHall),
    %setupASM(RTS_8FC8C7))

RoomState_WreckedShipEntrance_1:                                         ;8FCA34;
    %StateHeader(\
    %levelData(LevelData_WreckedShipEntrance),
    %tileset(4),
    %music($30, 6),
    %FX(FXHeader_WreckedShipEntrance_State1),
    %enemyPop(EnemyPopulations_WreckedShipEntrance_1),
    %enemySet(EnemySets_WreckedShipEntrance_1),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_WreckedShipEntrance_State1),
    %libraryBG(LibBG_WreckedShip_4_5_EntranceHall),
    %setupASM(RTS_8FC8C7))

RoomDoors_WreckedShipEntrance:
    dw Door_WreckedShipEntrance_0                                        ;8FCA4E;
    dw Door_WreckedShipEntrance_1                                        ;8FCA50;

RoomHeader_Attic:                                                        ;8FCA52;
    %RoomHeader(\
    %room(2),
    %area(3),
    %positions($0C, $0A),
    %dimensions(7, 1),
    %scrollers(0, 0),
    %CRE(0),
    %doorList(RoomDoors_Attic))
    %stateChecks(1,
    %stateCheckBossDead(1, RoomState_Attic_1))

RoomState_Attic_0:                                                       ;8FCA64;
    %StateHeader(\
    %levelData(LevelData_Attic_State0),
    %tileset(5),
    %music($30, 5),
    %FX(FXHeader_Attic_State0),
    %enemyPop(EnemyPopulations_Attic_0),
    %enemySet(EnemySets_Attic_0),
    %layer2Scrolls($C1, $FF),
    %scrollPointer(RoomScrolls_Attic),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Attic_State0),
    %libraryBG(LibBG_WreckedShip_4_5_ExperimentRoom),
    %setupASM(RTS_8FC8C7))

RoomState_Attic_1:                                                       ;8FCA7E;
    %StateHeader(\
    %levelData(LevelData_Attic_State1),
    %tileset(4),
    %music($30, 6),
    %FX(FXHeader_Attic_State1),
    %enemyPop(EnemyPopulations_Attic_1),
    %enemySet(EnemySets_Attic_1),
    %layer2Scrolls($C1, $FF),
    %scrollPointer(RoomScrolls_Attic),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Attic_State1),
    %libraryBG(LibBG_WreckedShip_4_5_ExperimentRoom),
    %setupASM(RTS_8FC8C7))

RoomDoors_Attic:
    dw Door_Attic_0                                                      ;8FCA98;
    dw Door_Attic_1                                                      ;8FCA9A;
    dw Door_Attic_2                                                      ;8FCA9C;

RoomScrolls_Attic:
    db $02,$02,$02,$02,$02,$02,$02                                       ;8FCA9E;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_RoomPLM_8FCAA5:
    db $00,$01, $80                                                      ;8FCAA5;

UNUSED_RoomPLM_8FCAA8:
    db $03,$01, $80                                                      ;8FCAA8;

UNUSED_RoomPLM_8FCAAB:
    db $03,$02, $80                                                      ;8FCAAB;
endif ; !FEATURE_KEEP_UNREFERENCED

RoomHeader_AssemblyLine:                                                 ;8FCAAE;
    %RoomHeader(\
    %room(3),
    %area(3),
    %positions($13, $0A),
    %dimensions(3, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_AssemblyLine))
    %stateChecks(1,
    %stateCheckBossDead(1, RoomState_AssemblyLine_1))

RoomState_AssemblyLine_0:                                                ;8FCAC0;
    %StateHeader(\
    %levelData(LevelData_AssemblyLine),
    %tileset(5),
    %music(0, 0),
    %FX(FXHeader_AssemblyLine_State0),
    %enemyPop(EnemyPopulations_AssemblyLine_0),
    %enemySet(EnemySets_AssemblyLine_0),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_AssemblyLine_State0),
    %libraryBG(LibBG_WreckedShip_4_5_Panels_Vents_Vertical),
    %setupASM(RTS_8FC8C7))

RoomState_AssemblyLine_1:                                                ;8FCADA;
    %StateHeader(\
    %levelData(LevelData_AssemblyLine),
    %tileset(4),
    %music(0, 0),
    %FX(FXHeader_AssemblyLine_State1),
    %enemyPop(EnemyPopulations_AssemblyLine_1),
    %enemySet(EnemySets_AssemblyLine_1),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_AssemblyLine_State1),
    %libraryBG(LibBG_WreckedShip_4_5_Panels_Vents_Vertical),
    %setupASM(RTS_8FC8C7))

RoomDoors_AssemblyLine:
    dw Door_AssemblyLine_0                                               ;8FCAF4;

RoomHeader_WreckedShipMainShaft:                                         ;8FCAF6;
    %RoomHeader(\
    %room(4),
    %area(3),
    %positions($0C, $0B),
    %dimensions(6, 8),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_WreckedShipMainShaft))
    %stateChecks(1,
    %stateCheckBossDead(1, RoomState_WreckedShipMainShaft_1))

RoomState_WreckedShipMainShaft_0:                                        ;8FCB08;
    %StateHeader(\
    %levelData(LevelData_WreckedShipMainShaft_State0),
    %tileset(5),
    %music($30, 5),
    %FX(FXHeader_WreckedShipMainShaft_State0),
    %enemyPop(EnemyPopulations_WreckedShipMainShaft_0),
    %enemySet(EnemySets_WreckedShipMainShaft_0),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_WreckedShipMainShaft),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_WreckedShipMainShaft),
    %libraryBG(LibBG_WreckedShip_4_5_Panels_Vents_Horizontal),
    %setupASM(RTS_8FC8C7))

RoomState_WreckedShipMainShaft_1:                                        ;8FCB22;
    %StateHeader(\
    %levelData(LevelData_WreckedShipMainShaft_State1),
    %tileset(4),
    %music($30, 6),
    %FX(FXHeader_WreckedShipMainShaft_State1),
    %enemyPop(EnemyPopulations_WreckedShipMainShaft_1),
    %enemySet(EnemySets_WreckedShipMainShaft_1),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_WreckedShipMainShaft),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_WreckedShipMainShaft),
    %libraryBG(LibBG_WreckedShip_4_5_Panels_Vents_Horizontal),
    %setupASM(RTS_8FC8C7))

RoomDoors_WreckedShipMainShaft:
    dw Door_WreckedShipMainShaft_0                                       ;8FCB3C;
    dw Door_WreckedShipMainShaft_1                                       ;8FCB3E;
    dw Door_WreckedShipMainShaft_2                                       ;8FCB40;
    dw Door_WreckedShipMainShaft_3                                       ;8FCB42;
    dw Door_WreckedShipMainShaft_4                                       ;8FCB44;
    dw Door_WreckedShipMainShaft_5                                       ;8FCB46;
    dw Door_WreckedShipMainShaft_6                                       ;8FCB48;

RoomScrolls_WreckedShipMainShaft:
    db $00,$00,$00,$00,$02,$00,$00,$00,$00,$00,$02,$00,$00,$00,$00,$00   ;8FCB4A;
    db $02,$00,$00,$00,$00,$00,$02,$00,$00,$00,$00,$00,$02,$00,$01,$01   ;8FCB5A;
    db $01,$00,$02,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00   ;8FCB6A;

RoomPLM_WreckedShipMainShaft_0:
    db $21,$01, $80                                                      ;8FCB7A;

RoomPLM_WreckedShipMainShaft_1:
    db $29,$01, $80                                                      ;8FCB7D;

RoomPLM_WreckedShipMainShaft_2:
    db $21,$00, $80                                                      ;8FCB80;

RoomPLM_WreckedShipMainShaft_3:
    db $29,$00, $80                                                      ;8FCB83;

RoomPLM_WreckedShipMainShaft_4:
    db $28,$02, $2E,$02, $80                                             ;8FCB86;

RoomHeader_SpikyDeath:                                                   ;8FCB8B;
    %RoomHeader(\
    %room(5),
    %area(3),
    %positions($13, $0F),
    %dimensions(2, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_SpikyDeath))
    %stateChecks(1,
    %stateCheckBossDead(1, RoomState_SpikyDeath_1))

RoomState_SpikyDeath_0:                                                  ;8FCB9D;
    %StateHeader(\
    %levelData(LevelData_SpikyDeath),
    %tileset(5),
    %music(0, 0),
    %FX(FXHeader_SpikyDeath_State0),
    %enemyPop(EnemyPopulations_SpikyDeath_0),
    %enemySet(EnemySets_SpikyDeath_0),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_SpikyDeath_State0),
    %libraryBG(LibBG_WreckedShip_4_5_Columns_Tubes),
    %setupASM(RTS_8FC8C7))

RoomState_SpikyDeath_1:                                                  ;8FCBB7;
    %StateHeader(\
    %levelData(LevelData_SpikyDeath),
    %tileset(4),
    %music(0, 0),
    %FX(FXHeader_SpikyDeath_State1),
    %enemyPop(EnemyPopulations_SpikyDeath_1),
    %enemySet(EnemySets_SpikyDeath_1),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_SpikyDeath_State1),
    %libraryBG(LibBG_WreckedShip_4_5_Columns_Tubes),
    %setupASM(RTS_8FC8C7))

RoomDoors_SpikyDeath:
    dw Door_SpikyDeath_0                                                 ;8FCBD1;
    dw Door_SpikyDeath_1                                                 ;8FCBD3;

RoomHeader_ElectricDeath:                                                ;8FCBD5;
    %RoomHeader(\
    %room(6),
    %area(3),
    %positions($15, $0D),
    %dimensions(1, 3),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_ElectricDeath))
    %stateChecks(1,
    %stateCheckBossDead(1, RoomState_ElectricDeath_1))

RoomState_ElectricDeath_0:                                               ;8FCBE7;
    %StateHeader(\
    %levelData(LevelData_ElectricDeath),
    %tileset(5),
    %music($30, 5),
    %FX(FXHeader_ElectricDeath_State0),
    %enemyPop(EnemyPopulations_ElectricDeath_0),
    %enemySet(EnemySets_ElectricDeath_0),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_ElectricDeath),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_ElectricDeath_State0),
    %libraryBG(LibBG_WreckedShip_4_5_Panels_Vents_Horizontal),
    %setupASM(RTS_8FC8C7))

RoomState_ElectricDeath_1:                                               ;8FCC01;
    %StateHeader(\
    %levelData(LevelData_ElectricDeath),
    %tileset(4),
    %music($30, 6),
    %FX(FXHeader_ElectricDeath_State1),
    %enemyPop(EnemyPopulations_ElectricDeath_1),
    %enemySet(EnemySets_ElectricDeath_1),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_ElectricDeath),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_ElectricDeath_State1),
    %libraryBG(LibBG_WreckedShip_4_5_Panels_Vents_Horizontal),
    %setupASM(RTS_8FC8C7))

RoomDoors_ElectricDeath:
    dw Door_ElectricDeath_0                                              ;8FCC1B;
    dw Door_ElectricDeath_1                                              ;8FCC1D;
    dw Door_ElectricDeath_2                                              ;8FCC1F;

RoomScrolls_ElectricDeath:
    db $00,$02,$02                                                       ;8FCC21;

RoomPLM_ElectricDeath_0:
    db $00,$02, $80                                                      ;8FCC24;

RoomHeader_WreckedShipETank:                                             ;8FCC27;
    %RoomHeader(\
    %room(7),
    %area(3),
    %positions($12, $0D),
    %dimensions(3, 2),
    %scrollers($90, $A0),
    %CRE(0),
    %doorList(RoomDoors_WreckedShipETank))
    %stateChecks(1,
    %stateCheckBossDead(1, RoomState_WreckedShipETank_1))

RoomState_WreckedShipETank_0:                                            ;8FCC39;
    %StateHeader(\
    %levelData(LevelData_WreckedShipETank),
    %tileset(5),
    %music(0, 3),
    %FX(FXHeader_WreckedShipETank_State0),
    %enemyPop(EnemyPopulations_WreckedShipETank_0),
    %enemySet(EnemySets_WreckedShipETank_0),
    %layer2Scrolls($C0, 0),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_WreckedShipETank_State0),
    %libraryBG(0),
    %setupASM(RTS_8FC8C7))

RoomState_WreckedShipETank_1:                                            ;8FCC53;
    %StateHeader(\
    %levelData(LevelData_WreckedShipETank),
    %tileset(4),
    %music(0, 3),
    %FX(FXHeader_WreckedShipETank_State1),
    %enemyPop(EnemyPopulations_WreckedShipETank_1),
    %enemySet(EnemySets_WreckedShipETank_1),
    %layer2Scrolls($C0, 0),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_WreckedShipETank_State1),
    %libraryBG(0),
    %setupASM(RTS_8FC8C7))

RoomDoors_WreckedShipETank:
    dw Door_WreckedShipETank_0                                           ;8FCC6D;

RoomHeader_Basement:                                                     ;8FCC6F;
    %RoomHeader(\
    %room(8),
    %area(3),
    %positions($0E, $13),
    %dimensions(5, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_Basement))
    %stateChecks(1,
    %stateCheckBossDead(1, RoomState_Basement_1))

RoomState_Basement_0:                                                    ;8FCC81;
    %StateHeader(\
    %levelData(LevelData_Basement),
    %tileset(5),
    %music($30, 5),
    %FX(FXHeader_Basement_State0),
    %enemyPop(EnemyPopulations_Basement_0),
    %enemySet(EnemySets_Basement_0),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_Basement),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Basement_State0),
    %libraryBG(LibBG_WreckedShip_4_5_Columns_Tubes),
    %setupASM(SetupASM_SpawnPrePhantoonRoomEnemyProjectile))

RoomState_Basement_1:                                                    ;8FCC9B;
    %StateHeader(\
    %levelData(LevelData_Basement),
    %tileset(4),
    %music($30, 6),
    %FX(FXHeader_Basement_State1),
    %enemyPop(EnemyPopulations_Basement_1),
    %enemySet(EnemySets_Basement_1),
    %layer2Scrolls($C1, 1),
    %scrollPointer(RoomScrolls_Basement),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Basement_State1),
    %libraryBG(LibBG_WreckedShip_4_5_Columns_Tubes),
    %setupASM(SetupASM_SpawnPrePhantoonRoomEnemyProjectile))

RoomDoors_Basement:
    dw Door_Basement_0                                                   ;8FCCB5;
    dw Door_Basement_1                                                   ;8FCCB7;
    dw Door_Basement_2                                                   ;8FCCB9;

RoomScrolls_Basement:
    db $01,$01,$01,$01,$00                                               ;8FCCBB;

RoomPLM_Basement_0:
    db $03,$01, $04,$01, $80                                             ;8FCCC0;

RoomPLM_Basement_1:
    db $03,$00, $80                                                      ;8FCCC5;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_RoomPLM_8FCCC8:
    db $04,$00, $80                                                      ;8FCCC8;
endif ; !FEATURE_KEEP_UNREFERENCED

RoomHeader_WreckedShipMap:                                               ;8FCCCB;
    %RoomHeader(\
    %room(9),
    %area(3),
    %positions($0D, $13),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_WreckedShipMap))
    %stateChecks(1,
    %stateCheckBossDead(1, RoomState_WreckedShipMap_1))

RoomState_WreckedShipMap_0:                                              ;8FCCDD;
    %StateHeader(\
    %levelData(LevelData_MapStation_RightSideDoor),
    %tileset($16),
    %music(0, 0),
    %FX(FXHeader_WreckedShipMap_State0),
    %enemyPop(EnemyPopulations_WreckedShipMap_0),
    %enemySet(EnemySets_WreckedShipMap_0),
    %layer2Scrolls(0, 0),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_WreckedShipMap_State0),
    %libraryBG(0),
    %setupASM(RTS_8FC8D0))

RoomState_WreckedShipMap_1:                                              ;8FCCF7;
    %StateHeader(\
    %levelData(LevelData_MapStation_RightSideDoor),
    %tileset($15),
    %music(0, 0),
    %FX(FXHeader_WreckedShipMap_State1),
    %enemyPop(EnemyPopulations_WreckedShipMap_1),
    %enemySet(EnemySets_WreckedShipMap_1),
    %layer2Scrolls(0, 0),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_WreckedShipMap_State1),
    %libraryBG(0),
    %setupASM(RTS_8FC8D0))

RoomDoors_WreckedShipMap:
    dw Door_WreckedShipMap_0                                             ;8FCD11;

RoomHeader_Phantoon:                                                     ;8FCD13;
    %RoomHeader(\
    %room($0A),
    %area(3),
    %positions($13, $13),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_Phantoon))
    %stateChecks(1,
    %stateCheckBossDead(1, RoomState_Phantoon_1))

RoomState_Phantoon_0:                                                    ;8FCD25;
    %StateHeader(\
    %levelData(LevelData_Phantoon),
    %tileset(5),
    %music($27, 6),
    %FX(FXHeader_Phantoon_State0),
    %enemyPop(EnemyPopulations_Phantoon_0),
    %enemySet(EnemySets_Phantoon_0),
    %layer2Scrolls(1, 1),
    %scrollPointer(RoomScrolls_Phantoon),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Phantoon),
    %libraryBG(LibBG_Phantoon_State0),
    %setupASM(RTS_8FC8D0))

RoomState_Phantoon_1:                                                    ;8FCD3F;
    %StateHeader(\
    %levelData(LevelData_Phantoon),
    %tileset(4),
    %music(0, 3),
    %FX(FXHeader_Phantoon_State1),
    %enemyPop(EnemyPopulations_Phantoon_1),
    %enemySet(EnemySets_Phantoon_1),
    %layer2Scrolls(1, 1),
    %scrollPointer(RoomScrolls_Phantoon),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Phantoon),
    %libraryBG(LibBG_Phantoon_Draygon_State1),
    %setupASM(RTS_8FC8D0))

RoomDoors_Phantoon:
    dw Door_Phantoon_0                                                   ;8FCD59;

RoomScrolls_Phantoon:
    db $01                                                               ;8FCD5B;

RoomHeader_SpongeBath:                                                   ;8FCD5C;
    %RoomHeader(\
    %room($0B),
    %area(3),
    %positions($11, $0F),
    %dimensions(2, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_SpongeBath))
    %stateChecks(1,
    %stateCheckBossDead(1, RoomState_SpongeBath_1))

RoomState_SpongeBath_0:                                                  ;8FCD6E;
    %StateHeader(\
    %levelData(LevelData_SpongeBath),
    %tileset(5),
    %music(0, 0),
    %FX(FXHeader_SpongeBath_State0),
    %enemyPop(EnemyPopulations_SpongeBath_0),
    %enemySet(EnemySets_SpongeBath_0),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_SpongeBath),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_SpongeBath_State0),
    %libraryBG(LibBG_WreckedShip_4_5_Panels_Vents),
    %setupASM(RTS_8FC8D0))

RoomState_SpongeBath_1:                                                  ;8FCD88;
    %StateHeader(\
    %levelData(LevelData_SpongeBath),
    %tileset(4),
    %music(0, 0),
    %FX(FXHeader_SpongeBath_State1),
    %enemyPop(EnemyPopulations_SpongeBath_1),
    %enemySet(EnemySets_SpongeBath_1),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_SpongeBath),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_SpongeBath_State1),
    %libraryBG(LibBG_WreckedShip_4_5_Panels_Vents),
    %setupASM(RTS_8FC8D0))

RoomDoors_SpongeBath:
    dw Door_SpongeBath_0                                                 ;8FCDA2;
    dw Door_SpongeBath_1                                                 ;8FCDA4;

RoomScrolls_SpongeBath:
    db $01,$01                                                           ;8FCDA6;

RoomHeader_WSWestSuper:                                                  ;8FCDA8;
    %RoomHeader(\
    %room($0C),
    %area(3),
    %positions($0F, $11),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_WSWestSuper))
    %stateChecks(1,
    %stateCheckBossDead(1, RoomState_WSWestSuper_1))

RoomState_WSWestSuper_0:                                                 ;8FCDBA;
    %StateHeader(\
    %levelData(LevelData_WSWestSuper),
    %tileset(5),
    %music(0, 0),
    %FX(FXHeader_WSWestSuper_State0),
    %enemyPop(EnemyPopulations_WSWestSuper_0),
    %enemySet(EnemySets_WSWestSuper_0),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_WSWestSuper),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_WSWestSuper_State0),
    %libraryBG(LibBG_WreckedShip_4_5_Panels_Vents),
    %setupASM(RTS_8FC8D0))

RoomState_WSWestSuper_1:                                                 ;8FCDD4;
    %StateHeader(\
    %levelData(LevelData_WSWestSuper),
    %tileset(4),
    %music(0, 0),
    %FX(FXHeader_WSWestSuper_State1),
    %enemyPop(EnemyPopulations_WSWestSuper_1),
    %enemySet(EnemySets_WSWestSuper_1),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_WSWestSuper),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_WSWestSuper_State1),
    %libraryBG(LibBG_WreckedShip_4_5_Panels_Vents),
    %setupASM(RTS_8FC8D0))

RoomDoors_WSWestSuper:
    dw Door_WSWestSuper_0                                                ;8FCDEE;

RoomScrolls_WSWestSuper:
    db $01                                                               ;8FCDF0;

RoomHeader_WSEastSuper:                                                  ;8FCDF1;
    %RoomHeader(\
    %room($0D),
    %area(3),
    %positions($12, $11),
    %dimensions(4, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_WSEastSuper))
    %stateChecks(1,
    %stateCheckBossDead(1, RoomState_WSEastSuper_1))

RoomState_WSEastSuper_0:                                                 ;8FCE03;
    %StateHeader(\
    %levelData(LevelData_WSEastSuper_State0),
    %tileset(5),
    %music(0, 0),
    %FX(FXHeader_VariousRooms_State0_839C74),
    %enemyPop(EnemyPopulations_WSEastSuper_0),
    %enemySet(EnemySets_WSEastSuper_0),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_WSEastSuper),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_WSEastSuper_State0),
    %libraryBG(LibBG_WreckedShip_4_5_Panels_Vents_Horizontal),
    %setupASM(RTS_8FC8D0))

RoomState_WSEastSuper_1:                                                 ;8FCE1D;
    %StateHeader(\
    %levelData(LevelData_WSEastSuper_State1),
    %tileset(4),
    %music(0, 0),
    %FX(FXHeader_WSEastSuper_State1),
    %enemyPop(EnemyPopulations_WSEastSuper_1),
    %enemySet(EnemySets_WSEastSuper_1),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_WSEastSuper),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_WSEastSuper_State1),
    %libraryBG(LibBG_WreckedShip_4_5_Panels_Vents),
    %setupASM(RTS_8FC8D0))

RoomDoors_WSEastSuper:
    dw Door_WSEastSuper_0                                                ;8FCE37;

RoomScrolls_WSEastSuper:
    db $01,$01,$01,$00                                                   ;8FCE39;

RoomPLM_WSEastSuper_0:
    db $03,$01, $80                                                      ;8FCE3D;

RoomHeader_GravitySuit:                                                  ;8FCE40;
    %RoomHeader(\
    %room($0E),
    %area(3),
    %positions($0A, $0D),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_GravitySuit))
    %stateChecks(1,
    %stateCheckBossDead(1, RoomState_GravitySuit_1))

RoomState_GravitySuit_0:                                                 ;8FCE52;
    %StateHeader(\
    %levelData(LevelData_GravitySuit),
    %tileset(5),
    %music(0, 0),
    %FX(FXHeader_VariousRooms_State0_839C74),
    %enemyPop(EnemyPopulations_GravitySuit_0),
    %enemySet(EnemySets_GravitySuit_0),
    %layer2Scrolls(1, 1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_GravitySuit_State0_WreckedShipSave_State0),
    %libraryBG(LibBG_WreckedShip_4_5_Panels_Vents),
    %setupASM(RTS_8FC8D0))

RoomState_GravitySuit_1:                                                 ;8FCE6C;
    %StateHeader(\
    %levelData(LevelData_GravitySuit),
    %tileset(4),
    %music(0, 0),
    %FX(FXHeader_GravitySuit_State1_WreckedShipSave_State1),
    %enemyPop(EnemyPopulations_GravitySuit_1),
    %enemySet(EnemySets_GravitySuit_1),
    %layer2Scrolls(1, 1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_GravitySuit_State1),
    %libraryBG(LibBG_WreckedShip_4_5_Panels_Vents),
    %setupASM(RTS_8FC8D0))

RoomDoors_GravitySuit:
    dw Door_GravitySuit_0                                                ;8FCE86;
    dw Door_GravitySuit_1                                                ;8FCE88;

RoomHeader_WreckedShipSave:                                              ;8FCE8A;
    %RoomHeader(\
    %room($0F),
    %area(3),
    %positions($11, $0E),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_WreckedShipSave))
    %stateChecks(1,
    %stateCheckBossDead(1, RoomState_WreckedShipSave_1))

RoomState_WreckedShipSave_0:                                             ;8FCE9C;
    %StateHeader(\
    %levelData(LevelData_SaveStation_LeftSideDoor),
    %tileset($16),
    %music($30, 5),
    %FX(FXHeader_VariousRooms_State0_839C74),
    %enemyPop(EnemyPopulations_WreckedShipSave_0),
    %enemySet(EnemySets_WreckedShipSave_0),
    %layer2Scrolls(0, 0),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_GravitySuit_State0_WreckedShipSave_State0),
    %libraryBG(0),
    %setupASM(0))

RoomState_WreckedShipSave_1:                                             ;8FCEB6;
    %StateHeader(\
    %levelData(LevelData_SaveStation_LeftSideDoor),
    %tileset($15),
    %music($30, 6),
    %FX(FXHeader_GravitySuit_State1_WreckedShipSave_State1),
    %enemyPop(EnemyPopulations_WreckedShipSave_1),
    %enemySet(EnemySets_WreckedShipSave_1),
    %layer2Scrolls(0, 0),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_WreckedShipSave_State1),
    %libraryBG(0),
    %setupASM(RTS_8FC8D0))

RoomDoors_WreckedShipSave:
    dw Door_WreckedShipSave_0                                            ;8FCED0;

RoomHeader_GlassTunnelSave:                                              ;8FCED2;
    %RoomHeader(\
    %room(0),
    %area(4),
    %positions($0C, $13),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_GlassTunnelSave))
    %stateChecks(0)

RoomState_GlassTunnelSave:                                               ;8FCEDF;
    %StateHeader(\
    %levelData(LevelData_SaveStation_LeftSideDoor),
    %tileset($19),
    %music($12, 5),
    %FX(FXHeader_GlassTunnelSave),
    %enemyPop(EnemyPopulations_GlassTunnelSave),
    %enemySet(EnemySets_GlassTunnelSave),
    %layer2Scrolls(0, 0),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_GlassTunnelSave),
    %libraryBG(0),
    %setupASM(RTS_8FC8D1))

RoomDoors_GlassTunnelSave:
    dw Door_GlassTunnelSave_0                                            ;8FCEF9;

RoomHeader_GlassTunnel:                                                  ;8FCEFB;
    %RoomHeader(\
    %room(1),
    %area(4),
    %positions($0B, $11),
    %dimensions(1, 3),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_GlassTunnel))
    %stateChecks(1,
    %stateCheckEventSet($0B, RoomState_GlassTunnel_1))

RoomState_GlassTunnel_0:                                                 ;8FCF0D;
    %StateHeader(\
    %levelData(LevelData_GlassTunnel_State0),
    %tileset($0B),
    %music($12, 5),
    %FX(FXHeader_GlassTunnel_State0_1),
    %enemyPop(EnemyPopulations_GlassTunnel),
    %enemySet(EnemySets_GlassTunnel),
    %layer2Scrolls(0, $C0),
    %scrollPointer(RoomScrolls_GlassTunnel),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_GlassTunnel_State0_1),
    %libraryBG(0),
    %setupASM(RTS_8FC8D1))

RoomState_GlassTunnel_1:                                                 ;8FCF27;
    %StateHeader(\
    %levelData(LevelData_GlassTunnel_State1),
    %tileset($0B),
    %music($12, 5),
    %FX(FXHeader_GlassTunnel_State0_1),
    %enemyPop(EnemyPopulations_GlassTunnel),
    %enemySet(EnemySets_GlassTunnel),
    %layer2Scrolls(0, $C0),
    %scrollPointer(RoomScrolls_GlassTunnel),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_GlassTunnel_State0_1),
    %libraryBG(0),
    %setupASM(RTS_8FC8D1))

RoomDoors_GlassTunnel:
    dw Door_GlassTunnel_0                                                ;8FCF41;
    dw Door_GlassTunnel_1                                                ;8FCF43;
    dw Door_GlassTunnel_2                                                ;8FCF45;
    dw Door_GlassTunnel_3                                                ;8FCF47;

RoomScrolls_GlassTunnel:
    db $02,$02,$02                                                       ;8FCF49;

RoomPLM_GlassTunnel_0_4:
    db $00,$02, $80                                                      ;8FCF4C;

RoomPLM_GlassTunnel_8:
    db $01,$02, $02,$02, $80                                             ;8FCF4F;

RoomHeader_WestTunnel:                                                   ;8FCF54;
    %RoomHeader(\
    %room(2),
    %area(4),
    %positions($0A, $12),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_WestTunnel))
    %stateChecks(0)

RoomState_WestTunnel:                                                    ;8FCF61;
    %StateHeader(\
    %levelData(LevelData_WestTunnel),
    %tileset($0B),
    %music(0, 0),
    %FX(FXHeader_WestTunnel),
    %enemyPop(EnemyPopulations_WestTunnel),
    %enemySet(EnemySets_WestTunnel),
    %layer2Scrolls(0, 0),
    %scrollPointer(RoomScrolls_WestTunnel),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_WestTunnel),
    %libraryBG(0),
    %setupASM(RTS_8FC8D1))

RoomDoors_WestTunnel:
    dw Door_WestTunnel_0                                                 ;8FCF7B;
    dw Door_WestTunnel_1                                                 ;8FCF7D;

RoomScrolls_WestTunnel:
    db $01                                                               ;8FCF7F;

RoomHeader_EastTunnel:                                                   ;8FCF80;
    %RoomHeader(\
    %room(3),
    %area(4),
    %positions($0C, $11),
    %dimensions(4, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_EastTunnel))
    %stateChecks(0)

RoomState_EastTunnel:                                                    ;8FCF8D;
    %StateHeader(\
    %levelData(LevelData_EastTunnel),
    %tileset($0B),
    %music($12, 5),
    %FX(FXHeader_EastTunnel),
    %enemyPop(EnemyPopulations_EastTunnel),
    %enemySet(EnemySets_EastTunnel),
    %layer2Scrolls(0, 0),
    %scrollPointer(RoomScrolls_EastTunnel),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_EastTunnel),
    %libraryBG(0),
    %setupASM(RTS_8FC8D1))

RoomDoors_EastTunnel:
    dw Door_EastTunnel_0                                                 ;8FCFA7;
    dw Door_EastTunnel_1                                                 ;8FCFA9;
    dw Door_EastTunnel_2                                                 ;8FCFAB;

RoomScrolls_EastTunnel:
    db $01,$01,$01,$01,$00,$00,$00,$00                                   ;8FCFAD;

RoomPLM_EastTunnel_0:
    db $00,$01, $01,$00, $04,$00, $80                                    ;8FCFB5;

RoomPLM_EastTunnel_1:
    db $00,$02, $04,$01, $80                                             ;8FCFBC;

RoomPLM_EastTunnel_2:
    db $00,$00, $04,$01, $80                                             ;8FCFC1;

RoomPLM_EastTunnel_9:
    db $01,$01,$80                                                       ;8FCFC6;

RoomHeader_MainStreet:                                                   ;8FCFC9;
    %RoomHeader(\
    %room(4),
    %area(4),
    %positions($0A, 9),
    %dimensions(3, 8),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_MainStreet))
    %stateChecks(0)

RoomState_MainStreet:                                                    ;8FCFD6;
    %StateHeader(\
    %levelData(LevelData_MainStreet),
    %tileset($0B),
    %music($1B, 6),
    %FX(FXHeader_MainStreet),
    %enemyPop(EnemyPopulations_MainStreet),
    %enemySet(EnemySets_MainStreet),
    %layer2Scrolls($C0, $C0),
    %scrollPointer(RoomScrolls_MainStreet),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_MainStreet),
    %libraryBG(0),
    %setupASM(RTS_8FC8D1))

RoomDoors_MainStreet:
    dw Door_MainStreet_0                                                 ;8FCFF0;
    dw Door_MainStreet_1                                                 ;8FCFF2;
    dw Door_MainStreet_2                                                 ;8FCFF4;
    dw Door_MainStreet_3                                                 ;8FCFF6;
    dw Door_MainStreet_4                                                 ;8FCFF8;

RoomScrolls_MainStreet:
    db $02,$02,$00,$02,$02,$00,$02,$02,$01,$02,$02,$00,$02,$02,$00,$02   ;8FCFFA;
    db $02,$00,$02,$02,$02,$02,$02,$00                                   ;8FD00A;

RoomPLM_MainStreet_0:
    db $07,$01, $0A,$00, $80                                             ;8FD012;

RoomHeader_FishTank:                                                     ;8FD017;
    %RoomHeader(\
    %room(5),
    %area(4),
    %positions($0D, $0D),
    %dimensions(4, 3),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_FishTank))
    %stateChecks(0)

RoomState_FishTank:                                                      ;8FD024;
    %StateHeader(\
    %levelData(LevelData_FishTank),
    %tileset($0B),
    %music(0, 0),
    %FX(FXHeader_FishTank),
    %enemyPop(EnemyPopulations_FishTank),
    %enemySet(EnemySets_FishTank),
    %layer2Scrolls($C0, $C0),
    %scrollPointer(RoomScrolls_FishTank),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_FishTank),
    %libraryBG(0),
    %setupASM(RTS_8FC8D1))

RoomDoors_FishTank:
    dw Door_FishTank_0                                                   ;8FD03E;
    dw Door_FishTank_1                                                   ;8FD040;
    dw Door_FishTank_2                                                   ;8FD042;
    dw Door_FishTank_3                                                   ;8FD044;

RoomScrolls_FishTank:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$00,$02                   ;8FD046;

RoomPLM_FishTank_3_7:
    db $0A,$02, $80                                                      ;8FD052;

RoomHeader_MamaTurtle:                                                   ;8FD055;
    %RoomHeader(\
    %room(6),
    %area(4),
    %positions($11, $0C),
    %dimensions(3, 4),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_MamaTurtle))
    %stateChecks(0)

RoomState_MamaTurtle:                                                    ;8FD062;
    %StateHeader(\
    %levelData(LevelData_MamaTurtle),
    %tileset($0B),
    %music(0, 0),
    %FX(FXHeader_MamaTurtle),
    %enemyPop(EnemyPopulations_MamaTurtle),
    %enemySet(EnemySets_MamaTurtle),
    %layer2Scrolls(0, $C0),
    %scrollPointer(RoomScrolls_MamaTurtle),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_MamaTurtle),
    %libraryBG(0),
    %setupASM(RTS_8FC8D1))

RoomDoors_MamaTurtle:
    dw Door_MamaTurtle_0                                                 ;8FD07C;

RoomScrolls_MamaTurtle:
    db $00,$02,$02,$00,$02,$02,$00,$02,$02,$02,$02,$02                   ;8FD07E;

RoomHeader_CrabTunnel:                                                   ;8FD08A;
    %RoomHeader(\
    %room(7),
    %area(4),
    %positions($0C, $10),
    %dimensions(4, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_CrabTunnel))
    %stateChecks(0)

RoomState_CrabTunnel:                                                    ;8FD097;
    %StateHeader(\
    %levelData(LevelData_CrabTunnel),
    %tileset($0B),
    %music($1B, 6),
    %FX(FXHeader_CrabTunnel),
    %enemyPop(EnemyPopulations_CrabTunnel),
    %enemySet(EnemySets_CrabTunnel),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_CrabTunnel),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_CrabTunnel),
    %libraryBG(LibBG_Maridia_B_BrownWall),
    %setupASM(RTS_8FC8D1))

RoomDoors_CrabTunnel:
    dw Door_CrabTunnel_0                                                 ;8FD0B1;
    dw Door_CrabTunnel_1                                                 ;8FD0B3;

RoomScrolls_CrabTunnel:
    db $01,$01,$01,$01                                                   ;8FD0B5;

RoomHeader_MtEverest:                                                    ;8FD0B9;
    %RoomHeader(\
    %room(8),
    %area(4),
    %positions($0C, 9),
    %dimensions(6, 4),
    %scrollers($90, $A0),
    %CRE(0),
    %doorList(RoomDoors_MtEverest))
    %stateChecks(0)

RoomState_MtEverest:                                                     ;8FD0C6;
    %StateHeader(\
    %levelData(LevelData_MtEverest),
    %tileset($0B),
    %music(0, 0),
    %FX(FXHeader_MtEverest),
    %enemyPop(EnemyPopulations_MtEverest),
    %enemySet(EnemySets_MtEverest),
    %layer2Scrolls($C0, $C0),
    %scrollPointer(RoomScrolls_MtEverest),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_MtEverest),
    %libraryBG(0),
    %setupASM(RTS_8FC8D1))

RoomDoors_MtEverest:
    dw Door_MtEverest_0                                                  ;8FD0E0;
    dw Door_MtEverest_1                                                  ;8FD0E2;
    dw Door_MtEverest_2                                                  ;8FD0E4;
    dw Door_MtEverest_3                                                  ;8FD0E6;
    dw Door_MtEverest_4                                                  ;8FD0E8;
    dw Door_MtEverest_5                                                  ;8FD0EA;

RoomScrolls_MtEverest:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$00,$02,$02,$02   ;8FD0EC;
    db $02,$00,$00,$02,$02,$02,$02,$00                                   ;8FD0FC;

RoomHeader_RedFish:                                                      ;8FD104;
    %RoomHeader(\
    %room(9),
    %area(4),
    %positions($0C, 7),
    %dimensions(3, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_RedFish))
    %stateChecks(0)

RoomState_RedFish:                                                       ;8FD111;
    %StateHeader(\
    %levelData(LevelData_RedFish),
    %tileset($0B),
    %music($1B, 6),
    %FX(FXHeader_RedFish),
    %enemyPop(EnemyPopulations_RedFish),
    %enemySet(EnemySets_RedFish),
    %layer2Scrolls(0, $C0),
    %scrollPointer(RoomScrolls_RedFish),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_RedFish),
    %libraryBG(0),
    %setupASM(RTS_8FC8D1))

RoomDoors_RedFish:
    dw Door_RedFish_0                                                    ;8FD12B;
    dw Door_RedFish_1                                                    ;8FD12D;

RoomScrolls_RedFish:
    db $01,$00,$02,$00,$00,$02                                           ;8FD12F;

RoomPLM_RedFish_0:
    db $02,$02, $80                                                      ;8FD135;

RoomPLM_RedFish_1:
    db $01,$01, $80                                                      ;8FD138;

RoomHeader_WateringHole:                                                 ;8FD13B;
    %RoomHeader(\
    %room($0A),
    %area(4),
    %positions($0C, 4),
    %dimensions(2, 3),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_WateringHole))
    %stateChecks(0)

RoomState_WateringHole:                                                  ;8FD148;
    %StateHeader(\
    %levelData(LevelData_WateringHole),
    %tileset($0B),
    %music(0, 0),
    %FX(FXHeader_WateringHole),
    %enemyPop(EnemyPopulations_WateringHole),
    %enemySet(EnemySets_WateringHole),
    %layer2Scrolls($C0, 0),
    %scrollPointer(RoomScrolls_WateringHole),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_WateringHole),
    %libraryBG(0),
    %setupASM(RTS_8FC8D1))

RoomDoors_WateringHole:
    dw Door_WateringHole_0                                               ;8FD162;

RoomScrolls_WateringHole:
    db $02,$01,$02,$00,$00,$00                                           ;8FD164;

RoomPLM_WateringHole_0:
    db $04,$01, $80                                                      ;8FD16A;

RoomHeader_NWestMaridiaBug:                                              ;8FD16D;
    %RoomHeader(\
    %room($0B),
    %area(4),
    %positions($0E, 4),
    %dimensions(4, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_NWestMaridiaBug))
    %stateChecks(0)

RoomState_NWestMaridiaBug:                                               ;8FD17A;
    %StateHeader(\
    %levelData(LevelData_NWestMaridiaBug),
    %tileset($0B),
    %music(0, 0),
    %FX(FXHeader_NWestMaridiaBug),
    %enemyPop(EnemyPopulations_NWestMaridiaBug),
    %enemySet(EnemySets_NWestMaridiaBug),
    %layer2Scrolls($C0, 0),
    %scrollPointer(RoomScrolls_NWestMaridiaBug),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_NWestMaridiaBug),
    %libraryBG(0),
    %setupASM(RTS_8FC8D1))

RoomDoors_NWestMaridiaBug:
    dw Door_NWestMaridiaBug_0                                            ;8FD194;
    dw Door_NWestMaridiaBug_1                                            ;8FD196;

RoomScrolls_NWestMaridiaBug:
    db $02,$00,$00,$00,$01,$00,$01,$01                                   ;8FD198;

RoomPLM_NWestMaridiaBug_3_7:
    db $05,$01, $80                                                      ;8FD1A0;

RoomHeader_CrabShaft:                                                    ;8FD1A3;
    %RoomHeader(\
    %room($0C),
    %area(4),
    %positions($12, 7),
    %dimensions(2, 4),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_CrabShaft))
    %stateChecks(0)

RoomState_CrabShaft:                                                     ;8FD1B0;
    %StateHeader(\
    %levelData(LevelData_CrabShaft),
    %tileset($0B),
    %music($1B, 6),
    %FX(FXHeader_CrabShaft),
    %enemyPop(EnemyPopulations_CrabShaft),
    %enemySet(EnemySets_CrabShaft),
    %layer2Scrolls(0, $C0),
    %scrollPointer(RoomScrolls_CrabShaft),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_CrabShaft),
    %libraryBG(0),
    %setupASM(RTS_8FC8D1))

RoomDoors_CrabShaft:
    dw Door_CrabShaft_0                                                  ;8FD1CA;
    dw Door_CrabShaft_1                                                  ;8FD1CC;
    dw Door_CrabShaft_2                                                  ;8FD1CE;

RoomScrolls_CrabShaft:
    db $02,$00,$02,$00,$01,$00,$00,$01                                   ;8FD1D0;

RoomPLM_CrabShaft_0:
    db $04,$02, $06,$01, $80                                             ;8FD1D8;

RoomHeader_PseudoPlasmaSpark:                                            ;8FD1DD;
    %RoomHeader(\
    %room($0D),
    %area(4),
    %positions($12, 4),
    %dimensions(4, 3),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_PseudoPlasmaSpark))
    %stateChecks(0)

RoomState_PseudoPlasmaSpark:                                             ;8FD1EA;
    %StateHeader(\
    %levelData(LevelData_PseudoPlasmaSpark),
    %tileset($0B),
    %music(0, 0),
    %FX(FXHeader_PseudoPlasmaSpark),
    %enemyPop(EnemyPopulations_PseudoPlasmaSpark),
    %enemySet(EnemySets_PseudoPlasmaSpark),
    %layer2Scrolls($C0, 0),
    %scrollPointer(RoomScrolls_PseudoPlasmaSpark),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_PseudoPlasmaSpark),
    %libraryBG(0),
    %setupASM(RTS_8FC8D1))

RoomDoors_PseudoPlasmaSpark:
    dw Door_PseudoPlasmaSpark_0                                          ;8FD204;
    dw Door_PseudoPlasmaSpark_1                                          ;8FD206;
    dw Door_PseudoPlasmaSpark_2                                          ;8FD208;

RoomScrolls_PseudoPlasmaSpark:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$00,$00                   ;8FD20A;

RoomPLM_PseudoPlasmaSpark_3:
    db $0A,$02, $80                                                      ;8FD216;

RoomPLM_PseudoPlasmaSpark_7:
    db $0A,$00, $80                                                      ;8FD219;

RoomHeader_CrabHole:                                                     ;8FD21C;
    %RoomHeader(\
    %room($0E),
    %area(4),
    %positions($10, $10),
    %dimensions(1, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_CrabHole))
    %stateChecks(0)

RoomState_CrabHole:                                                      ;8FD229;
    %StateHeader(\
    %levelData(LevelData_CrabHole),
    %tileset($0B),
    %music($1B, 5),
    %FX(FXHeader_CrabHole),
    %enemyPop(EnemyPopulations_CrabHole),
    %enemySet(EnemySets_CrabHole),
    %layer2Scrolls(0, 0),
    %scrollPointer(RoomScrolls_CrabHole),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_CrabHole),
    %libraryBG(0),
    %setupASM(RTS_8FC8D1))

RoomDoors_CrabHole:
    dw Door_CrabHole_0                                                   ;8FD243;
    dw Door_CrabHole_1                                                   ;8FD245;
    dw Door_CrabHole_2                                                   ;8FD247;
    dw Door_CrabHole_3                                                   ;8FD249;

RoomScrolls_CrabHole:
    db $01,$00                                                           ;8FD24B;

RoomPLM_CrabHole_0_1:
    db $00,$02, $01,$01, $80                                             ;8FD24D;

RoomHeader_WestSandHallTunnel:                                           ;8FD252;
    %RoomHeader(\
    %room($0F),
    %area(4),
    %positions($11, $10),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_WestSandHallTunnel))
    %stateChecks(0)

RoomState_WestSandHallTunnel:                                            ;8FD25F;
    %StateHeader(\
    %levelData(LevelData_WestSandHallTunnel),
    %tileset($0B),
    %music(0, 0),
    %FX(FXHeader_WestSandHallTunnel),
    %enemyPop(EnemyPopulations_WestSandHallTunnel),
    %enemySet(EnemySets_WestSandHallTunnel),
    %layer2Scrolls($C0, 0),
    %scrollPointer(RoomScrolls_WestSandHallTunnel),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_WestSandHallTunnel),
    %libraryBG(0),
    %setupASM(RTS_8FC8D1))

RoomDoors_WestSandHallTunnel:
    dw Door_WestSandHallTunnel_0                                         ;8FD279;
    dw Door_WestSandHallTunnel_1                                         ;8FD27B;

RoomScrolls_WestSandHallTunnel:
    db $01                                                               ;8FD27D;

RoomHeader_PlasmaTutorial:                                               ;8FD27E;
    %RoomHeader(\
    %room($10),
    %area(4),
    %positions($1A, 0),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_PlasmaTutorial))
    %stateChecks(0)

RoomState_PlasmaTutorial:                                                ;8FD28B;
    %StateHeader(\
    %levelData(LevelData_PlasmaTutorial),
    %tileset($0B),
    %music(0, 0),
    %FX(FXHeader_PlasmaTutorial),
    %enemyPop(EnemyPopulations_PlasmaTutorial),
    %enemySet(EnemySets_PlasmaTutorial),
    %layer2Scrolls(0, 0),
    %scrollPointer(RoomScrolls_PlasmaTutorial),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_PlasmaTutorial),
    %libraryBG(0),
    %setupASM(RTS_8FC8D1))

RoomDoors_PlasmaTutorial:
    dw Door_PlasmaTutorial_0                                             ;8FD2A5;
    dw Door_PlasmaTutorial_1                                             ;8FD2A7;

RoomScrolls_PlasmaTutorial:
    db $01                                                               ;8FD2A9;

RoomHeader_Plasma:                                                       ;8FD2AA;
    %RoomHeader(\
    %room($11),
    %area(4),
    %positions($1B, 0),
    %dimensions(2, 3),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_Plasma))
    %stateChecks(0)

RoomState_Plasma:                                                        ;8FD2B7;
    %StateHeader(\
    %levelData(LevelData_Plasma),
    %tileset($0B),
    %music(0, 0),
    %FX(FXHeader_Plasma),
    %enemyPop(EnemyPopulations_Plasma),
    %enemySet(EnemySets_Plasma),
    %layer2Scrolls($C0, 0),
    %scrollPointer(RoomScrolls_Plasma),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Plasma),
    %libraryBG(0),
    %setupASM(RTS_8FC8D1))

RoomDoors_Plasma:
    dw Door_Plasma_0                                                     ;8FD2D1;

RoomScrolls_Plasma:
    db $02,$02,$02,$02,$01,$01                                           ;8FD2D3;

RoomHeader_ThreadTheNeedle:                                              ;8FD2D9;
    %RoomHeader(\
    %room($12),
    %area(4),
    %positions($1B, 5),
    %dimensions(7, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_ThreadTheNeedle))
    %stateChecks(0)

RoomState_ThreadTheNeedle:                                               ;8FD2E6;
    %StateHeader(\
    %levelData(LevelData_ThreadTheNeedle),
    %tileset($0B),
    %music(0, 0),
    %FX(FXHeader_ThreadTheNeedle),
    %enemyPop(EnemyPopulations_ThreadTheNeedle),
    %enemySet(EnemySets_ThreadTheNeedle),
    %layer2Scrolls($C0, 0),
    %scrollPointer(RoomScrolls_ThreadTheNeedle),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_ThreadTheNeedle),
    %libraryBG(0),
    %setupASM(RTS_8FC8D1))

RoomDoors_ThreadTheNeedle:
    dw Door_ThreadTheNeedle_0                                            ;8FD300;
    dw Door_ThreadTheNeedle_1                                            ;8FD302;

RoomScrolls_ThreadTheNeedle:
    db $01,$01,$01,$01,$01,$01,$01                                       ;8FD304;

RoomHeader_MaridiaElev:                                                  ;8FD30B;
    %RoomHeader(\
    %room($13),
    %area(4),
    %positions($22, 0),
    %dimensions(1, 6),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_MaridiaElev))
    %stateChecks(0)

RoomState_MaridiaElev:                                                   ;8FD318;
    %StateHeader(\
    %levelData(LevelData_MaridiaElev),
    %tileset($0B),
    %music($1B, 5),
    %FX(FXHeader_MaridiaElev),
    %enemyPop(EnemyPopulations_MaridiaElev),
    %enemySet(EnemySets_MaridiaElev),
    %layer2Scrolls(0, $C0),
    %scrollPointer(RoomScrolls_MaridiaElev),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_MaridiaElev),
    %libraryBG(0),
    %setupASM(RTS_8FC8D1))

RoomDoors_MaridiaElev:
    dw Door_MaridiaElev_0                                                ;8FD332;
    dw Door_MaridiaElev_1                                                ;8FD334;
    dw Door_MaridiaElev_2                                                ;8FD336;
    dw Door_MaridiaElev_3_TourianFirst_2                                 ;8FD338;

RoomScrolls_MaridiaElev:
    db $02,$02,$02,$02,$02,$01                                           ;8FD33A;

RoomHeader_PlasmaSpark:                                                  ;8FD340;
    %RoomHeader(\
    %room($14),
    %area(4),
    %positions($16, 2),
    %dimensions(4, 6),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_PlasmaSpark))
    %stateChecks(0)

RoomState_PlasmaSpark:                                                   ;8FD34D;
    %StateHeader(\
    %levelData(LevelData_PlasmaSpark),
    %tileset($0B),
    %music(0, 5),
    %FX(FXHeader_PlasmaSpark),
    %enemyPop(EnemyPopulations_PlasmaSpark),
    %enemySet(EnemySets_PlasmaSpark),
    %layer2Scrolls($E0, 0),
    %scrollPointer(RoomScrolls_PlasmaSpark),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_PlasmaSpark),
    %libraryBG(0),
    %setupASM(RTS_8FC8D1))

RoomDoors_PlasmaSpark:
    dw Door_PlasmaSpark_0                                                ;8FD367;
    dw Door_PlasmaSpark_1                                                ;8FD369;
    dw Door_PlasmaSpark_2                                                ;8FD36B;
    dw Door_PlasmaSpark_3                                                ;8FD36D;

RoomScrolls_PlasmaSpark:
    db $00,$02,$02,$00,$00,$02,$02,$00,$02,$02,$02,$02,$00,$02,$02,$02   ;8FD36F;
    db $00,$02,$02,$02,$00,$01,$01,$01                                   ;8FD37F;

RoomHeader_Kassiuz:                                                      ;8FD387;
    %RoomHeader(\
    %room($15),
    %area(4),
    %positions($19, 0),
    %dimensions(1, 4),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_Kassiuz))
    %stateChecks(0)

RoomState_Kassiuz:                                                       ;8FD394;
    %StateHeader(\
    %levelData(LevelData_Kassiuz),
    %tileset($0B),
    %music(0, 5),
    %FX(FXHeader_Kassiuz),
    %enemyPop(EnemyPopulations_Kassiuz),
    %enemySet(EnemySets_Kassiuz),
    %layer2Scrolls(0, $C0),
    %scrollPointer(RoomScrolls_Kassiuz),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Kassiuz),
    %libraryBG(0),
    %setupASM(RTS_8FC8D1))

RoomDoors_Kassiuz:
    dw Door_Kassiuz_0                                                    ;8FD3AE;
    dw Door_Kassiuz_1                                                    ;8FD3B0;

RoomScrolls_Kassiuz:
    db $02,$02,$02,$02                                                   ;8FD3B2;

RoomHeader_MaridiaMap:                                                   ;8FD3B6;
    %RoomHeader(\
    %room($16),
    %area(4),
    %positions($11, $11),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_MaridiaMap))
    %stateChecks(0)

RoomState_MaridiaMap:                                                    ;8FD3C3;
    %StateHeader(\
    %levelData(LevelData_MapStation_LeftSideDoor),
    %tileset($15),
    %music(0, 0),
    %FX(FXHeader_MaridiaMap),
    %enemyPop(EnemyPopulations_MaridiaMap),
    %enemySet(EnemySets_MaridiaMap),
    %layer2Scrolls(0, 0),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_MaridiaMap),
    %libraryBG(0),
    %setupASM(RTS_8FC8D1))

RoomDoors_MaridiaMap:
    dw Door_MaridiaMap_0                                                 ;8FD3DD;

RoomHeader_ForgottenHighwaySave:                                         ;8FD3DF;
    %RoomHeader(\
    %room($17),
    %area(4),
    %positions($23, 4),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_ForgottenHighwaySave))
    %stateChecks(0)

RoomState_ForgottenHighwaySave:                                          ;8FD3EC;
    %StateHeader(\
    %levelData(LevelData_SaveStation_LeftSideDoor),
    %tileset($19),
    %music($1B, 5),
    %FX(FXHeader_ForgottenHighwaySave),
    %enemyPop(EnemyPopulations_ForgottenHighwaySave),
    %enemySet(EnemySets_ForgottenHighwaySave),
    %layer2Scrolls(0, 0),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_ForgottenHighwaySave),
    %libraryBG(0),
    %setupASM(0))

RoomDoors_ForgottenHighwaySave:
    dw Door_ForgottenHighwaySave_0                                       ;8FD406;

RoomHeader_Toilet:                                                       ;8FD408;
    %RoomHeader(\
    %room($18),
    %area(4),
    %positions($16, 5),
    %dimensions(1, $0A),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_Toilet))
    %stateChecks(0)

RoomState_Toilet:                                                        ;8FD415;
    %StateHeader(\
    %levelData(LevelData_Toilet),
    %tileset($0C),
    %music(0, 0),
    %FX(FXHeader_Toilet),
    %enemyPop(EnemyPopulations_Toilet),
    %enemySet(EnemySets_Toilet),
    %layer2Scrolls(0, 0),
    %scrollPointer(1),
    %specialXray(0),
    %mainASM(MainASM_Elevatube),
    %PLMPop(PLMPopulation_Toilet),
    %libraryBG(0),
    %setupASM(RTS_8FC8D2))

RoomDoors_Toilet:
    dw Door_Toilet_0                                                     ;8FD42F;
    dw Door_Toilet_1                                                     ;8FD431;

RoomHeader_BugSandHole:                                                  ;8FD433;
    %RoomHeader(\
    %room($19),
    %area(4),
    %positions($1A, 5),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_BugSandHole))
    %stateChecks(0)

RoomState_BugSandHole:                                                   ;8FD440;
    %StateHeader(\
    %levelData(LevelData_BugSandHole),
    %tileset($0C),
    %music(0, 0),
    %FX(FXHeader_BugSandHole),
    %enemyPop(EnemyPopulations_BugSandHole),
    %enemySet(EnemySets_BugSandHole),
    %layer2Scrolls(0, 0),
    %scrollPointer(RoomScrolls_BugSandHole),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_BugSandHole),
    %libraryBG(0),
    %setupASM(RTS_8FC8D2))

RoomDoors_BugSandHole:
    dw Door_BugSandHole_0                                                ;8FD45A;
    dw Door_BugSandHole_1                                                ;8FD45C;
    dw Door_BugSandHole_2                                                ;8FD45E;

RoomScrolls_BugSandHole:
    db $02                                                               ;8FD460;

RoomHeader_WestSandHall:                                                 ;8FD461;
    %RoomHeader(\
    %room($1A),
    %area(4),
    %positions($12, $10),
    %dimensions(4, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_WestSandHall))
    %stateChecks(0)

RoomState_WestSandHall:                                                  ;8FD46E;
    %StateHeader(\
    %levelData(LevelData_WestSandHall),
    %tileset($0C),
    %music(0, 0),
    %FX(FXHeader_WestSandHall),
    %enemyPop(EnemyPopulations_WestSandHall),
    %enemySet(EnemySets_WestSandHall),
    %layer2Scrolls($C1, 1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_WestSandHall),
    %libraryBG(LibBG_Maridia_C_GreenWall),
    %setupASM(RTS_8FC8D2))

RoomDoors_WestSandHall:
    dw Door_WestSandHall_0                                               ;8FD488;
    dw Door_WestSandHall_1                                               ;8FD48A;
    dw UNUSED_Door_WestSandHall_2_83A654                                 ;8FD48C;

RoomHeader_Oasis:                                                        ;8FD48E;
    %RoomHeader(\
    %room($1B),
    %area(4),
    %positions($16, $0F),
    %dimensions(1, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_Oasis))
    %stateChecks(0)

RoomState_Oasis:                                                         ;8FD49B;
    %StateHeader(\
    %levelData(LevelData_Oasis),
    %tileset($0C),
    %music(0, 0),
    %FX(FXHeader_Oasis),
    %enemyPop(EnemyPopulations_Oasis),
    %enemySet(EnemySets_Oasis),
    %layer2Scrolls(0, $C0),
    %scrollPointer(RoomScrolls_Oasis),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Oasis),
    %libraryBG(0),
    %setupASM(RTS_8FC8D2))

RoomDoors_Oasis:
    dw Door_Oasis_0                                                      ;8FD4B5;
    dw Door_Oasis_1                                                      ;8FD4B7;
    dw Door_Oasis_2                                                      ;8FD4B9;

RoomScrolls_Oasis:
    db $00,$01                                                           ;8FD4BB;

RoomPLM_Oasis_0:
    db $00,$02, $01,$02, $80                                             ;8FD4BD;

RoomHeader_EastSandHall:                                                 ;8FD4C2;
    %RoomHeader(\
    %room($1C),
    %area(4),
    %positions($17, $10),
    %dimensions(3, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_EastSandHall))
    %stateChecks(0)

RoomState_EastSandHall:                                                  ;8FD4CF;
    %StateHeader(\
    %levelData(LevelData_EastSandHall),
    %tileset($0C),
    %music(0, 0),
    %FX(FXHeader_EastSandHall),
    %enemyPop(EnemyPopulations_EastSandHall),
    %enemySet(EnemySets_EastSandHall),
    %layer2Scrolls($C1, 1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_EastSandHall),
    %libraryBG(LibBG_Maridia_C_GreenWall),
    %setupASM(RTS_8FC8D2))

RoomDoors_EastSandHall:
    dw Door_EastSandHall_0                                               ;8FD4E9;
    dw Door_EastSandHall_1                                               ;8FD4EB;
    dw UNUSED_Door_EastSandHall_2_83A69C                                 ;8FD4ED;

RoomHeader_WestSandHole:                                                 ;8FD4EF;
    %RoomHeader(\
    %room($1D),
    %area(4),
    %positions($14, $0E),
    %dimensions(2, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_WestSandHole))
    %stateChecks(0)

RoomState_WestSandHole:                                                  ;8FD4FC;
    %StateHeader(\
    %levelData(LevelData_WestSandHole),
    %tileset($0C),
    %music(0, 0),
    %FX(FXHeader_WestSandHole),
    %enemyPop(EnemyPopulations_WestSandHole),
    %enemySet(EnemySets_WestSandHole),
    %layer2Scrolls(0, 0),
    %scrollPointer(RoomScrolls_WestSandHole),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_WestSandHole),
    %libraryBG(0),
    %setupASM(RTS_8FC8D2))

RoomDoors_WestSandHole:
    dw Door_WestSandHole_0                                               ;8FD516;
    dw Door_WestSandHole_1                                               ;8FD518;

RoomScrolls_WestSandHole:
    db $02,$02,$02,$02                                                   ;8FD51A;

RoomHeader_EastSandHole:                                                 ;8FD51E;
    %RoomHeader(\
    %room($1E),
    %area(4),
    %positions($17, $0E),
    %dimensions(2, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_EastSandHole))
    %stateChecks(0)

RoomState_EastSandHole:                                                  ;8FD52B;
    %StateHeader(\
    %levelData(LevelData_EastSandHole),
    %tileset($0C),
    %music(0, 0),
    %FX(FXHeader_EastSandHole),
    %enemyPop(EnemyPopulations_EastSandHole),
    %enemySet(EnemySets_EastSandHole),
    %layer2Scrolls(0, 0),
    %scrollPointer(RoomScrolls_EastSandHole),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_EastSandHole),
    %libraryBG(0),
    %setupASM(RTS_8FC8D2))

RoomDoors_EastSandHole:
    dw Door_EastSandHole_0                                               ;8FD545;
    dw Door_EastSandHole_1                                               ;8FD547;

RoomScrolls_EastSandHole:
    db $02,$02,$02,$02                                                   ;8FD549;

RoomHeader_WestAqueductQuicksand:                                        ;8FD54D;
    %RoomHeader(\
    %room($1F),
    %area(4),
    %positions($15, $0C),
    %dimensions(1, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_WestAqueductQuicksand))
    %stateChecks(0)

RoomState_WestAqueductQuicksand:                                         ;8FD55A;
    %StateHeader(\
    %levelData(LevelData_WestAqueductQuicksand),
    %tileset($0C),
    %music(0, 0),
    %FX(FXHeader_EastAqueductQuicksand_WestAqueductQuicksand),
    %enemyPop(EnemyPopulations_WestAqueductQuicksand),
    %enemySet(EnemySets_WestAqueductQuicksand),
    %layer2Scrolls(0, 0),
    %scrollPointer(RoomScrolls_WestAqueductQuicksand),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_WestAqueductQuicksand),
    %libraryBG(0),
    %setupASM(RTS_8FC8D2))

RoomDoors_WestAqueductQuicksand:
    dw Door_WestAqueductQuicksand_0                                      ;8FD574;
    dw Door_WestAqueductQuicksand_1                                      ;8FD576;

RoomScrolls_WestAqueductQuicksand:
    db $02,$02                                                           ;8FD578;

RoomHeader_EastAqueductQuicksand:                                        ;8FD57A;
    %RoomHeader(\
    %room($20),
    %area(4),
    %positions($17, $0C),
    %dimensions(1, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_EastAqueductQuicksand))
    %stateChecks(0)

RoomState_EastAqueductQuicksand:                                         ;8FD587;
    %StateHeader(\
    %levelData(LevelData_EastAqueductQuicksand),
    %tileset($0C),
    %music(0, 0),
    %FX(FXHeader_EastAqueductQuicksand_WestAqueductQuicksand),
    %enemyPop(EnemyPopulations_EastAqueductQuicksand),
    %enemySet(EnemySets_EastAqueductQuicksand),
    %layer2Scrolls(0, 0),
    %scrollPointer(RoomScrolls_EastAqueductQuicksand),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_EastAqueductQuicksand),
    %libraryBG(0),
    %setupASM(RTS_8FC8D2))

RoomDoors_EastAqueductQuicksand:
    dw Door_EastAqueductQuicksand_0                                      ;8FD5A1;
    dw Door_EastAqueductQuicksand_1                                      ;8FD5A3;

RoomScrolls_EastAqueductQuicksand:
    db $02,$02                                                           ;8FD5A5;

RoomHeader_Aqueduct:                                                     ;8FD5A7;
    %RoomHeader(\
    %room($21),
    %area(4),
    %positions($14, 9),
    %dimensions(6, 3),
    %scrollers($90, $A0),
    %CRE(0),
    %doorList(RoomDoors_Aqueduct))
    %stateChecks(0)

RoomState_Aqueduct:                                                      ;8FD5B4;
    %StateHeader(\
    %levelData(LevelData_Aqueduct),
    %tileset($0C),
    %music($1B, 5),
    %FX(FXHeader_Aqueduct),
    %enemyPop(EnemyPopulations_Aqueduct),
    %enemySet(EnemySets_Aqueduct),
    %layer2Scrolls($C0, 0),
    %scrollPointer(RoomScrolls_Aqueduct),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Aqueduct),
    %libraryBG(0),
    %setupASM(RTS_8FC8D2))

RoomDoors_Aqueduct:
    dw Door_Aqueduct_0                                                   ;8FD5CE;
    dw Door_Aqueduct_1                                                   ;8FD5D0;
    dw Door_Aqueduct_2                                                   ;8FD5D2;
    dw Door_Aqueduct_3                                                   ;8FD5D4;
    dw Door_Aqueduct_4                                                   ;8FD5D6;
    dw Door_Aqueduct_5                                                   ;8FD5D8;

RoomScrolls_Aqueduct:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02   ;8FD5DA;
    db $02,$02                                                           ;8FD5EA;

RoomHeader_Butterfly:                                                    ;8FD5EC;
    %RoomHeader(\
    %room($22),
    %area(4),
    %positions($1A, 7),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_Butterfly))
    %stateChecks(0)

RoomState_Butterfly:                                                     ;8FD5F9;
    %StateHeader(\
    %levelData(LevelData_Butterfly),
    %tileset($0C),
    %music(0, 0),
    %FX(FXHeader_Butterfly),
    %enemyPop(EnemyPopulations_Butterfly),
    %enemySet(EnemySets_Butterfly),
    %layer2Scrolls($C0, 0),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Butterfly),
    %libraryBG(0),
    %setupASM(RTS_8FC8D2))

RoomDoors_Butterfly:
    dw Door_Butterfly_0                                                  ;8FD613;
    dw Door_Butterfly_1                                                  ;8FD615;

RoomHeader_BotwoonHallway:                                               ;8FD617;
    %RoomHeader(\
    %room($23),
    %area(4),
    %positions($14, 8),
    %dimensions(4, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_BotwoonHallway))
    %stateChecks(0)

RoomState_BotwoonHallway:                                                ;8FD624;
    %StateHeader(\
    %levelData(LevelData_BotwoonHallway),
    %tileset($0C),
    %music($1B, 5),
    %FX(FXHeader_BotwoonHallway),
    %enemyPop(EnemyPopulations_BotwoonHallway),
    %enemySet(EnemySets_BotwoonHallway),
    %layer2Scrolls($C0, 0),
    %scrollPointer(RoomScrolls_BotwoonHallway),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_BotwoonHallway),
    %libraryBG(0),
    %setupASM(RTS_8FC8D2))

RoomDoors_BotwoonHallway:
    dw Door_BotwoonHallway_0                                             ;8FD63E;
    dw Door_BotwoonHallway_1                                             ;8FD640;

RoomScrolls_BotwoonHallway:
    db $02,$02,$02,$02                                                   ;8FD642;

RoomHeader_Pants:                                                        ;8FD646;
    %RoomHeader(\
    %room($24),
    %area(4),
    %positions($1A, $0D),
    %dimensions(2, 4),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_Pants))
    %stateChecks(0)

RoomState_Pants:                                                         ;8FD653;
    %StateHeader(\
    %levelData(LevelData_Pants),
    %tileset($0C),
    %music(0, 0),
    %FX(FXHeader_Pants),
    %enemyPop(EnemyPopulations_Pants),
    %enemySet(EnemySets_Pants),
    %layer2Scrolls(0, $C0),
    %scrollPointer(RoomScrolls_Pants),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Pants),
    %libraryBG(0),
    %setupASM(RTS_8FC8D2))

RoomDoors_Pants:
    dw Door_Pants_0                                                      ;8FD66D;
    dw Door_Pants_1                                                      ;8FD66F;
    dw Door_Pants_2                                                      ;8FD671;
    dw Door_Pants_3                                                      ;8FD673;

RoomScrolls_Pants:
    db $02,$02,$02,$02,$02,$01,$01,$00                                   ;8FD675;

RoomPLM_Pants_0_4:
    db $02,$02, $03,$00, $04,$02, $05,$00, $06,$01, $07,$00, $80         ;8FD67D;

RoomPLM_Pants_D:
    db $02,$00, $03,$02, $04,$00, $05,$01, $06,$00, $80                  ;8FD68A;

RoomPLM_Pants_15:
    db $05,$02, $07,$01, $80                                             ;8FD695;

RoomHeader_EastPants:                                                    ;8FD69A;
    %RoomHeader(\
    %room($25),
    %area(4),
    %positions($1B, $0E),
    %dimensions(1, 3),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_EastPants))
    %stateChecks(0)

RoomState_EastPants:                                                     ;8FD6A7;
    %StateHeader(\
    %levelData(LevelData_EastPants),
    %tileset($0C),
    %music(0, 0),
    %FX(FXHeader_EastPants),
    %enemyPop(EnemyPopulations_EastPants),
    %enemySet(EnemySets_EastPants),
    %layer2Scrolls(0, $C0),
    %scrollPointer(RoomScrolls_EastPants),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_EastPants),
    %libraryBG(0),
    %setupASM(RTS_8FC8D2))

RoomDoors_EastPants:
    dw Door_EastPants_0                                                  ;8FD6C1;
    dw Door_EastPants_1                                                  ;8FD6C3;

RoomScrolls_EastPants:
    db $02,$00,$01                                                       ;8FD6C5;

RoomPLM_EastPants_0:
    db $01,$02, $80                                                      ;8FD6C8;

RoomPLM_EastPants_6:
    db $01,$02, $02,$01, $80                                             ;8FD6CB;

RoomHeader_Springball:                                                   ;8FD6D0;
    %RoomHeader(\
    %room($26),
    %area(4),
    %positions($20, $0F),
    %dimensions(2, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_Springball))
    %stateChecks(0)

RoomState_Springball:                                                    ;8FD6DD;
    %StateHeader(\
    %levelData(LevelData_Springball),
    %tileset($0C),
    %music(0, 0),
    %FX(FXHeader_Springball),
    %enemyPop(EnemyPopulations_Springball),
    %enemySet(EnemySets_Springball),
    %layer2Scrolls($C0, 0),
    %scrollPointer(RoomScrolls_Springball),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Springball),
    %libraryBG(0),
    %setupASM(RTS_8FC8D2))

RoomDoors_Springball:
    dw Door_Springball_0                                                 ;8FD6F7;

RoomScrolls_Springball:
    db $02,$00,$01,$01                                                   ;8FD6F9;

RoomHeader_BelowBotwoonETank:                                            ;8FD6FD;
    %RoomHeader(\
    %room($27),
    %area(4),
    %positions($1A, $0A),
    %dimensions(4, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_BelowBotwoonETank))
    %stateChecks(0)

RoomState_BelowBotwoonETank:                                             ;8FD70A;
    %StateHeader(\
    %levelData(LevelData_BelowBotwoonETank),
    %tileset($0C),
    %music(0, 0),
    %FX(FXHeader_BelowBotwoonETank),
    %enemyPop(EnemyPopulations_BelowBotwoonETank),
    %enemySet(EnemySets_BelowBotwoonETank),
    %layer2Scrolls(0, 0),
    %scrollPointer(RoomScrolls_BelowBotwoonETank),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_BelowBotwoonETank),
    %libraryBG(0),
    %setupASM(RTS_8FC8D2))

RoomDoors_BelowBotwoonETank:
    dw Door_BelowBotwoonETank_0                                          ;8FD724;

RoomScrolls_BelowBotwoonETank:
    db $01,$01,$01,$01                                                   ;8FD726;

RoomHeader_Colosseum:                                                    ;8FD72A;
    %RoomHeader(\
    %room($28),
    %area(4),
    %positions($22, 6),
    %dimensions(7, 2),
    %scrollers($90, $A0),
    %CRE(0),
    %doorList(RoomDoors_Colosseum))
    %stateChecks(0)

RoomState_Colosseum:                                                     ;8FD737;
    %StateHeader(\
    %levelData(LevelData_Colosseum),
    %tileset($0C),
    %music(0, 0),
    %FX(FXHeader_Colosseum),
    %enemyPop(EnemyPopulations_Colosseum),
    %enemySet(EnemySets_Colosseum),
    %layer2Scrolls(0, 0),
    %scrollPointer(RoomScrolls_Colosseum),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Colosseum),
    %libraryBG(0),
    %setupASM(RTS_8FC8D2))

RoomDoors_Colosseum:
    dw Door_Colosseum_0                                                  ;8FD751;
    dw Door_Colosseum_1                                                  ;8FD753;
    dw Door_Colosseum_2                                                  ;8FD755;

RoomScrolls_Colosseum:
    db $02,$02,$02,$02,$02,$02,$02,$01,$01,$01,$01,$01,$01,$01           ;8FD757;

RoomHeader_AqueductSave:                                                 ;8FD765;
    %RoomHeader(\
    %room($29),
    %area(4),
    %positions($13, $0B),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_AqueductSave))
    %stateChecks(0)

RoomState_AqueductSave:                                                  ;8FD772;
    %StateHeader(\
    %levelData(LevelData_SaveStation_RightSideDoor),
    %tileset($19),
    %music($1B, 5),
    %FX(FXHeader_AqueductSave),
    %enemyPop(EnemyPopulations_AqueductSave),
    %enemySet(EnemySets_AqueductSave),
    %layer2Scrolls(0, 0),
    %scrollPointer(RoomScrolls_AqueductSave),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_AqueductSave),
    %libraryBG(0),
    %setupASM(RTS_8FC8D2))

RoomDoors_AqueductSave:
    dw Door_AqueductSave_0                                               ;8FD78C;

RoomScrolls_AqueductSave:
    db $01                                                               ;8FD78E;

RoomHeader_ThePrecious:                                                  ;8FD78F;
    %RoomHeader(\
    %room($2A),
    %area(4),
    %positions($29, 7),
    %dimensions(2, 3),
    %scrollers($90, $A0),
    %CRE(0),
    %doorList(RoomDoors_ThePrecious))
    %stateChecks(1,
    %stateCheckBossDead(1, RoomState_ThePrecious_1))

RoomState_ThePrecious_0:                                                 ;8FD7A1;
    %StateHeader(\
    %levelData(LevelData_ThePrecious),
    %tileset($0C),
    %music(0, 0),
    %FX(FXHeader_ThePrecious_State0_1),
    %enemyPop(EnemyPopulations_ThePrecious),
    %enemySet(EnemySets_ThePrecious),
    %layer2Scrolls(0, $C0),
    %scrollPointer(RoomScrolls_ThePrecious),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_ThePrecious_State0_1),
    %libraryBG(0),
    %setupASM(RTS_8FC8D2))

RoomState_ThePrecious_1:                                                 ;8FD7BB;
    %StateHeader(\
    %levelData(LevelData_ThePrecious),
    %tileset($0C),
    %music($1B, 5),
    %FX(FXHeader_ThePrecious_State0_1),
    %enemyPop(EnemyPopulations_ThePrecious),
    %enemySet(EnemySets_ThePrecious),
    %layer2Scrolls(0, $C0),
    %scrollPointer(RoomScrolls_ThePrecious),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_ThePrecious_State0_1),
    %libraryBG(0),
    %setupASM(RTS_8FC8D2))

RoomDoors_ThePrecious:
    dw Door_ThePrecious_0                                                ;8FD7D5;
    dw Door_ThePrecious_1                                                ;8FD7D7;

RoomScrolls_ThePrecious:
    db $01,$01,$00,$00,$01,$00                                           ;8FD7D9;

RoomPLM_ThePrecious_0:
    db $00,$02, $02,$02, $80                                             ;8FD7DF;

RoomHeader_BotwoonETank:                                                 ;8FD7E4;
    %RoomHeader(\
    %room($2B),
    %area(4),
    %positions($1A, 8),
    %dimensions(7, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_BotwoonETank))
    %stateChecks(0)

RoomState_BotwoonETank:                                                  ;8FD7F1;
    %StateHeader(\
    %levelData(LevelData_BotwoonETank),
    %tileset($0C),
    %music($1B, 5),
    %FX(FXHeader_BotwoonETank),
    %enemyPop(EnemyPopulations_BotwoonETank),
    %enemySet(EnemySets_BotwoonETank),
    %layer2Scrolls($C0, 0),
    %scrollPointer(RoomScrolls_BotwoonETank),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_BotwoonETank),
    %libraryBG(0),
    %setupASM(RTS_8FC8D2))

RoomDoors_BotwoonETank:
    dw Door_BotwoonETank_0                                               ;8FD80B;
    dw Door_BotwoonETank_1                                               ;8FD80D;
    dw Door_BotwoonETank_2                                               ;8FD80F;
    dw Door_BotwoonETank_3                                               ;8FD811;

RoomScrolls_BotwoonETank:
    db $02,$02,$02,$02,$02,$02,$02                                       ;8FD813;

RoomHeader_DraygonSave:                                                  ;8FD81A;
    %RoomHeader(\
    %room($2C),
    %area(4),
    %positions($29, 6),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_DraygonSave))
    %stateChecks(0)

RoomState_DraygonSave:                                                   ;8FD827;
    %StateHeader(\
    %levelData(LevelData_SaveStation_BothDoors),
    %tileset($19),
    %music($1B, 5),
    %FX(FXHeader_DraygonSave),
    %enemyPop(EnemyPopulations_DraygonSave),
    %enemySet(EnemySets_DraygonSave),
    %layer2Scrolls(0, 0),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_DraygonSave),
    %libraryBG(0),
    %setupASM(RTS_8FC8D2))

RoomDoors_DraygonSave:
    dw Door_DraygonSave_0                                                ;8FD841;
    dw Door_DraygonSave_1                                                ;8FD843;

RoomHeader_MaridiaMissileRefill:                                         ;8FD845;
    %RoomHeader(\
    %room($2D),
    %area(4),
    %positions($26, 8),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_MaridiaMissileRefill))
    %stateChecks(0)

RoomState_MaridiaMissileRefill:                                          ;8FD852;
    %StateHeader(\
    %levelData(LevelData_MissileRefill_LeftSideDoor),
    %tileset($17),
    %music(0, 0),
    %FX(FXHeader_MaridiaMissileRefill),
    %enemyPop(EnemyPopulations_MaridiaMissileRefill),
    %enemySet(EnemySets_MaridiaMissileRefill),
    %layer2Scrolls(0, 0),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_MaridiaMissileRefill),
    %libraryBG(0),
    %setupASM(RTS_8FC8D2))

RoomDoors_MaridiaMissileRefill:
    dw Door_MaridiaMissileRefill_0                                       ;8FD86C;

RoomHeader_PlasmaBeachQuicksand:                                         ;8FD86E;
    %RoomHeader(\
    %room($2E),
    %area(4),
    %positions($1A, 6),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_PlasmaBeachQuicksand))
    %stateChecks(0)

RoomState_PlasmaBeachQuicksand:                                          ;8FD87B;
    %StateHeader(\
    %levelData(LevelData_PlasmaBeachQuicksand),
    %tileset($0C),
    %music(0, 0),
    %FX(FXHeader_PlasmaBeachQuicksand_BotwoonQuicksand),
    %enemyPop(EnemyPopulations_PlasmaBeachQuicksand),
    %enemySet(EnemySets_PlasmaBeachQuicksand),
    %layer2Scrolls(0, 0),
    %scrollPointer(RoomScrolls_PlasmaBeachQuicksand),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_PlasmaBeachQuicksand),
    %libraryBG(0),
    %setupASM(RTS_8FC8D2))

RoomDoors_PlasmaBeachQuicksand:
    dw Door_PlasmaBeachQuicksand_0                                       ;8FD895;

RoomScrolls_PlasmaBeachQuicksand:
    db $02                                                               ;8FD897;

RoomHeader_BotwoonQuicksand:                                             ;8FD898;
    %RoomHeader(\
    %room($2F),
    %area(4),
    %positions($1C, 9),
    %dimensions(2, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_BotwoonQuicksand))
    %stateChecks(0)

RoomState_BotwoonQuicksand:                                              ;8FD8A5;
    %StateHeader(\
    %levelData(LevelData_BotwoonQuicksand),
    %tileset($0C),
    %music(0, 0),
    %FX(FXHeader_PlasmaBeachQuicksand_BotwoonQuicksand),
    %enemyPop(EnemyPopulations_BotwoonQuicksand),
    %enemySet(EnemySets_BotwoonQuicksand),
    %layer2Scrolls(0, 0),
    %scrollPointer(RoomScrolls_BotwoonQuicksand),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_BotwoonQuicksand),
    %libraryBG(0),
    %setupASM(RTS_8FC8D2))

RoomDoors_BotwoonQuicksand:
    dw Door_BotwoonQuicksand_0                                           ;8FD8BF;
    dw Door_BotwoonQuicksand_1                                           ;8FD8C1;

RoomScrolls_BotwoonQuicksand:
    db $02,$02                                                           ;8FD8C3;

RoomHeader_Shaktool:                                                     ;8FD8C5;
    %RoomHeader(\
    %room($30),
    %area(4),
    %positions($1C, $0F),
    %dimensions(4, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_Shaktool))
    %stateChecks(1,
    %stateCheckEventSet($0D, RoomState_Shaktool_1))

RoomState_Shaktool_0:                                                    ;8FD8D7;
    %StateHeader(\
    %levelData(LevelData_Shaktool_State0),
    %tileset($0C),
    %music(0, 0),
    %FX(FXHeader_Shaktool_State0_1),
    %enemyPop(EnemyPopulations_Shaktool),
    %enemySet(EnemySets_Shaktool),
    %layer2Scrolls($C0, 0),
    %scrollPointer(RoomScrolls_Shaktool),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Shaktool_State0_1),
    %libraryBG(0),
    %setupASM(SetupASM_SetupShaktoolsRoomPLM))

RoomState_Shaktool_1:                                                    ;8FD8F1;
    %StateHeader(\
    %levelData(LevelData_Shaktool_State1),
    %tileset($0C),
    %music(0, 0),
    %FX(FXHeader_Shaktool_State0_1),
    %enemyPop(EnemyPopulations_Shaktool),
    %enemySet(EnemySets_Shaktool),
    %layer2Scrolls($C0, 0),
    %scrollPointer(RoomScrolls_Shaktool),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Shaktool_State0_1),
    %libraryBG(0),
    %setupASM(RTS_8FC8DC))

RoomDoors_Shaktool:
    dw Door_Shaktool_0                                                   ;8FD90B;
    dw Door_Shaktool_1                                                   ;8FD90D;

RoomScrolls_Shaktool:
    db $01,$01,$01,$01                                                   ;8FD90F;

RoomHeader_HalfieClimb:                                                  ;8FD913;
    %RoomHeader(\
    %room($31),
    %area(4),
    %positions($21, 6),
    %dimensions(5, 3),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_HalfieClimb))
    %stateChecks(0)

RoomState_HalfieClimb:                                                   ;8FD920;
    %StateHeader(\
    %levelData(LevelData_HalfieClimb),
    %tileset($0C),
    %music(0, 0),
    %FX(FXHeader_HalfieClimb),
    %enemyPop(EnemyPopulations_HalfieClimb),
    %enemySet(EnemySets_HalfieClimb),
    %layer2Scrolls(0, 0),
    %scrollPointer(RoomScrolls_HalfieClimb),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_HalfieClimb),
    %libraryBG(0),
    %setupASM(RTS_8FC8DC))

RoomDoors_HalfieClimb:
    dw Door_HalfieClimb_0                                                ;8FD93A;
    dw Door_HalfieClimb_1                                                ;8FD93C;
    dw Door_HalfieClimb_2                                                ;8FD93E;
    dw Door_HalfieClimb_3                                                ;8FD940;

RoomScrolls_HalfieClimb:
    db $02,$00,$00,$00,$00,$02,$00,$00,$00,$00,$01,$00,$01,$01,$01       ;8FD942;

RoomPLM_HalfieClimb_0:
    db $05,$00, $0B,$01, $80                                             ;8FD951;

RoomPLM_HalfieClimb_1:
    db $05,$01, $0B,$00, $80                                             ;8FD956;

RoomPLM_HalfieClimb_5:
    db $0A,$01, $80                                                      ;8FD95B;

RoomHeader_Botwoon:                                                      ;8FD95E;
    %RoomHeader(\
    %room($32),
    %area(4),
    %positions($18, 8),
    %dimensions(2, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_Botwoon))
    %stateChecks(1,
    %stateCheckBossDead(2, RoomState_Botwoon_1))

RoomState_Botwoon_0:                                                     ;8FD970;
    %StateHeader(\
    %levelData(LevelData_Botwoon),
    %tileset($0C),
    %music($2A, 5),
    %FX(FXHeader_Botwoon_State0_1),
    %enemyPop(EnemyPopulations_Botwoon),
    %enemySet(EnemySets_Botwoon),
    %layer2Scrolls(0, 0),
    %scrollPointer(RoomScrolls_Botwoon),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Botwoon_State0_1),
    %libraryBG(0),
    %setupASM(RTS_8FC8DC))

RoomState_Botwoon_1:                                                     ;8FD98A;
    %StateHeader(\
    %levelData(LevelData_Botwoon),
    %tileset($0C),
    %music(0, 3),
    %FX(FXHeader_Botwoon_State0_1),
    %enemyPop(EnemyPopulations_Botwoon),
    %enemySet(EnemySets_Botwoon),
    %layer2Scrolls(0, 0),
    %scrollPointer(RoomScrolls_Botwoon),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Botwoon_State0_1),
    %libraryBG(0),
    %setupASM(RTS_8FC8DC))

RoomDoors_Botwoon:
    dw Door_Botwoon_0                                                    ;8FD9A4;
    dw Door_Botwoon_1                                                    ;8FD9A6;

RoomScrolls_Botwoon:
    db $01,$00                                                           ;8FD9A8;

RoomHeader_SpaceJump:                                                    ;8FD9AA;
    %RoomHeader(\
    %room($33),
    %area(4),
    %positions($26, $0A),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_SpaceJump))
    %stateChecks(0)

RoomState_SpaceJump:                                                     ;8FD9B7;
    %StateHeader(\
    %levelData(LevelData_SpaceJump),
    %tileset($0C),
    %music(0, 3),
    %FX(FXHeader_SpaceJump),
    %enemyPop(EnemyPopulations_SpaceJump),
    %enemySet(EnemySets_SpaceJump),
    %layer2Scrolls(0, 0),
    %scrollPointer(RoomScrolls_SpaceJump),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_SpaceJump),
    %libraryBG(0),
    %setupASM(RTS_8FC8DC))

RoomDoors_SpaceJump:
    dw Door_SpaceJump_0                                                  ;8FD9D1;

RoomScrolls_SpaceJump:
    db $01                                                               ;8FD9D3;

RoomHeader_MaridiaEnergyRefill:                                          ;8FD9D4;
    %RoomHeader(\
    %room($34),
    %area(4),
    %positions($2A, 6),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_MaridiaEnergyRefill))
    %stateChecks(0)

RoomState_MaridiaEnergyRefill:                                           ;8FD9E1;
    %StateHeader(\
    %levelData(LevelData_EnergyRefill_LeftSideDoor),
    %tileset($17),
    %music(0, 0),
    %FX(FXHeader_MaridiaEnergyRefill),
    %enemyPop(EnemyPopulations_MaridiaEnergyRefill),
    %enemySet(EnemySets_MaridiaEnergyRefill),
    %layer2Scrolls(0, 0),
    %scrollPointer(RoomScrolls_MaridiaEnergyRefill),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_MaridiaEnergyRefill),
    %libraryBG(0),
    %setupASM(0))

RoomDoors_MaridiaEnergyRefill:
    dw Door_MaridiaEnergyRefill_0                                        ;8FD9FB;

RoomScrolls_MaridiaEnergyRefill:
    db $01                                                               ;8FD9FD;

RoomHeader_WestCactusAlley:                                              ;8FD9FE;
    %RoomHeader(\
    %room($35),
    %area(4),
    %positions($1B, 6),
    %dimensions(1, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_WestCactusAlley))
    %stateChecks(0)

RoomState_WestCactusAlley:                                               ;8FDA0B;
    %StateHeader(\
    %levelData(LevelData_WestCactusAlley),
    %tileset($0C),
    %music(0, 0),
    %FX(FXHeader_WestCactusAlley),
    %enemyPop(EnemyPopulations_WestCactusAlley),
    %enemySet(EnemySets_WestCactusAlley),
    %layer2Scrolls(0, $C0),
    %scrollPointer(RoomScrolls_WestCactusAlley),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_WestCactusAlley),
    %libraryBG(0),
    %setupASM(0))

RoomDoors_WestCactusAlley:
    dw Door_WestCactusAlley_0                                            ;8FDA25;
    dw Door_WestCactusAlley_1                                            ;8FDA27;

RoomScrolls_WestCactusAlley:
    db $02,$01                                                           ;8FDA29;

RoomHeader_EastCactusAlley:                                              ;8FDA2B;
    %RoomHeader(\
    %room($36),
    %area(4),
    %positions($1C, 6),
    %dimensions(5, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_EastCactusAlley))
    %stateChecks(0)

RoomState_EastCactusAlley:                                               ;8FDA38;
    %StateHeader(\
    %levelData(LevelData_EastCactusAlley),
    %tileset($0C),
    %music(0, 0),
    %FX(FXHeader_EastCactusAlley),
    %enemyPop(EnemyPopulations_EastCactusAlley),
    %enemySet(EnemySets_EastCactusAlley),
    %layer2Scrolls(0, 0),
    %scrollPointer(RoomScrolls_EastCactusAlley),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_EastCactusAlley),
    %libraryBG(0),
    %setupASM(0))

RoomDoors_EastCactusAlley:
    dw Door_EastCactusAlley_0                                            ;8FDA52;
    dw Door_EastCactusAlley_1                                            ;8FDA54;

RoomScrolls_EastCactusAlley:
    db $02,$02,$02,$02,$02,$01,$01,$01,$01,$01                           ;8FDA56;

RoomHeader_Draygon:                                                      ;8FDA60;
    %RoomHeader(\
    %room($37),
    %area(4),
    %positions($27, 9),
    %dimensions(2, 2),
    %scrollers($70, $A0),
    %CRE(1),
    %doorList(RoomDoors_Draygon))
    %stateChecks(1,
    %stateCheckBossDead(1, RoomState_Draygon_1))

RoomState_Draygon_0:                                                     ;8FDA72;
    %StateHeader(\
    %levelData(LevelData_Draygon),
    %tileset($1C),
    %music($24, 5),
    %FX(FXHeader_Draygon_State0_1),
    %enemyPop(EnemyPopulations_Draygon_0),
    %enemySet(EnemySets_Draygon_0),
    %layer2Scrolls(1, 1),
    %scrollPointer(RoomScrolls_Draygon),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Draygon_State0_1),
    %libraryBG(LibBG_Draygon_State0),
    %setupASM(SetupASM_SetPausingCodeForDraygon))

RoomState_Draygon_1:                                                     ;8FDA8C;
    %StateHeader(\
    %levelData(LevelData_Draygon),
    %tileset($1C),
    %music(0, 3),
    %FX(FXHeader_Draygon_State0_1),
    %enemyPop(EnemyPopulations_Draygon_State1_MotherBrain_State2),
    %enemySet(EnemySets_Draygon_1_MotherBrain_2),
    %layer2Scrolls(1, 1),
    %scrollPointer(RoomScrolls_Draygon),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Draygon_State0_1),
    %libraryBG(LibBG_Phantoon_Draygon_State1),
    %setupASM(SetupASM_SetPausingCodeForDraygon))

RoomDoors_Draygon:
    dw Door_Draygon_0                                                    ;8FDAA6;
    dw Door_Draygon_1                                                    ;8FDAA8;

RoomScrolls_Draygon:
    db $02,$02,$01,$01                                                   ;8FDAAA;

RoomHeader_TourianFirst:                                                 ;8FDAAE;
    %RoomHeader(\
    %room(0),
    %area(5),
    %positions($14, 9),
    %dimensions(1, 4),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_TourianFirst))
    %stateChecks(0)

RoomState_TourianFirst:                                                  ;8FDABB;
    %StateHeader(\
    %levelData(LevelData_TourianFirst),
    %tileset($0D),
    %music($1E, 5),
    %FX(FXHeader_TourianFirst),
    %enemyPop(EnemyPopulations_TourianFirst),
    %enemySet(EnemySets_TourianFirst),
    %layer2Scrolls(1, $C1),
    %scrollPointer(RoomScrolls_TourianFirst),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_TourianFirst),
    %libraryBG(LibBG_Tourian_D_MechanicalRoom),
    %setupASM(SetupASM_SetCollectedMap))

RoomDoors_TourianFirst:
    dw Door_TourianFirst_0                                               ;8FDAD5;
    dw Door_TourianFirst_1                                               ;8FDAD7;
    dw Door_MaridiaElev_3_TourianFirst_2                                 ;8FDAD9;
    dw Door_TourianFirst_3                                               ;8FDADB;

RoomScrolls_TourianFirst:
    db $02,$02,$02,$01                                                   ;8FDADD;

RoomHeader_Metroids1:                                                    ;8FDAE1;
    %RoomHeader(\
    %room(1),
    %area(5),
    %positions($0E, $0C),
    %dimensions(6, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_Metroids1))
    %stateChecks(1,
    %stateCheckEventSet($10, RoomState_Metroids1_1))

RoomState_Metroids1_0:                                                   ;8FDAF3;
    %StateHeader(\
    %levelData(LevelData_Metroids1),
    %tileset($0D),
    %music(0, 0),
    %FX(FXHeader_Metroids1_State0_1),
    %enemyPop(EnemyPopulations_Metroids1_0),
    %enemySet(EnemySets_Metroids1_0),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_Metroids1),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Metroids1_State0_1),
    %libraryBG(LibBG_Tourian_D_MechanicalRoom_Letterbox),
    %setupASM(RTS_8FC91E))

RoomState_Metroids1_1:                                                   ;8FDB0D;
    %StateHeader(\
    %levelData(LevelData_Metroids1),
    %tileset($0D),
    %music(0, 0),
    %FX(FXHeader_Metroids1_State0_1),
    %enemyPop(EnemyPopulations_Metroids1_1),
    %enemySet(EnemySets_Metroids1_1),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_Metroids1),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Metroids1_State0_1),
    %libraryBG(LibBG_Tourian_D_MechanicalRoom_Letterbox),
    %setupASM(RTS_8FC91E))

RoomDoors_Metroids1:
    dw Door_Metroids1_0                                                  ;8FDB27;
    dw Door_Metroids1_1                                                  ;8FDB29;

RoomScrolls_Metroids1:
    db $01,$01,$01,$01,$01,$01                                           ;8FDB2B;

RoomHeader_Metroids2:                                                    ;8FDB31;
    %RoomHeader(\
    %room(2),
    %area(5),
    %positions($0D, $0C),
    %dimensions(1, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_Metroids2))
    %stateChecks(1,
    %stateCheckEventSet($11, RoomState_Metroids2_1))

RoomState_Metroids2_0:                                                   ;8FDB43;
    %StateHeader(\
    %levelData(LevelData_Metroids2),
    %tileset($0D),
    %music(0, 0),
    %FX(FXHeader_Metroids2_State0_1),
    %enemyPop(EnemyPopulations_Metroids2_0),
    %enemySet(EnemySets_Metroids2_0),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_Metroids2),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Metroids2_State0_1),
    %libraryBG(LibBG_Tourian_D_MechanicalRoom),
    %setupASM(RTS_8FC91E))

RoomState_Metroids2_1:                                                   ;8FDB5D;
    %StateHeader(\
    %levelData(LevelData_Metroids2),
    %tileset($0D),
    %music(0, 0),
    %FX(FXHeader_Metroids2_State0_1),
    %enemyPop(EnemyPopulations_Metroids2_1),
    %enemySet(EnemySets_Metroids2_1),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_Metroids2),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Metroids2_State0_1),
    %libraryBG(LibBG_Tourian_D_MechanicalRoom),
    %setupASM(RTS_8FC91E))

RoomDoors_Metroids2:
    dw Door_Metroids2_0                                                  ;8FDB77;
    dw Door_Metroids2_1                                                  ;8FDB79;

RoomScrolls_Metroids2:
    db $02,$02                                                           ;8FDB7B;

RoomHeader_Metroids3:                                                    ;8FDB7D;
    %RoomHeader(\
    %room(3),
    %area(5),
    %positions($0E, $0D),
    %dimensions(6, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_Metroids3))
    %stateChecks(1,
    %stateCheckEventSet($12, RoomState_Metroids3_1))

RoomState_Metroids3_0:                                                   ;8FDB8F;
    %StateHeader(\
    %levelData(LevelData_Metroids3),
    %tileset($0D),
    %music(0, 0),
    %FX(FXHeader_Metroids3_State0_1),
    %enemyPop(EnemyPopulations_Metroids3_0),
    %enemySet(EnemySets_Metroids3_0),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_Metroids3),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Metroids3_State0_1),
    %libraryBG(LibBG_Tourian_D_MechanicalRoom_Letterbox),
    %setupASM(RTS_8FC91E))

RoomState_Metroids3_1:                                                   ;8FDBA9;
    %StateHeader(\
    %levelData(LevelData_Metroids3),
    %tileset($0D),
    %music(0, 0),
    %FX(FXHeader_Metroids3_State0_1),
    %enemyPop(EnemyPopulations_Metroids3_1),
    %enemySet(EnemySets_Metroids3_1),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_Metroids3),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Metroids3_State0_1),
    %libraryBG(LibBG_Tourian_D_MechanicalRoom_Letterbox),
    %setupASM(RTS_8FC91E))

RoomDoors_Metroids3:
    dw Door_Metroids3_0                                                  ;8FDBC3;
    dw Door_Metroids3_1                                                  ;8FDBC5;

RoomScrolls_Metroids3:
    db $01,$01,$01,$01,$01,$01                                           ;8FDBC7;

RoomHeader_Metroids4:                                                    ;8FDBCD;
    %RoomHeader(\
    %room(4),
    %area(5),
    %positions($14, $0D),
    %dimensions(1, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_Metroids4))
    %stateChecks(1,
    %stateCheckEventSet($13, RoomState_Metroids4_1))

RoomState_Metroids4_0:                                                   ;8FDBDF;
    %StateHeader(\
    %levelData(LevelData_Metroids4),
    %tileset($0D),
    %music($1E, 5),
    %FX(FXHeader_Metroids4_State0_1),
    %enemyPop(EnemyPopulations_Metroids4_0),
    %enemySet(EnemySets_Metroids4_0),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_Metroids4),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Metroids4_State0_1),
    %libraryBG(LibBG_Tourian_D_MechanicalRoom),
    %setupASM(RTS_8FC91E))

RoomState_Metroids4_1:                                                   ;8FDBF9;
    %StateHeader(\
    %levelData(LevelData_Metroids4),
    %tileset($0D),
    %music($1E, 5),
    %FX(FXHeader_Metroids4_State0_1),
    %enemyPop(EnemyPopulations_Metroids4_1),
    %enemySet(EnemySets_Metroids4_1),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_Metroids4),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Metroids4_State0_1),
    %libraryBG(LibBG_Tourian_D_MechanicalRoom),
    %setupASM(RTS_8FC91E))

RoomDoors_Metroids4:
    dw Door_Metroids4_0                                                  ;8FDC13;
    dw Door_Metroids4_1                                                  ;8FDC15;

RoomScrolls_Metroids4:
    db $02,$02                                                           ;8FDC17;

RoomHeader_BlueHopper:                                                   ;8FDC19;
    %RoomHeader(\
    %room(5),
    %area(5),
    %positions($13, $0F),
    %dimensions(2, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_BlueHopper))
    %stateChecks(1,
    %stateCheckEventSet($14, RoomState_BlueHopper_1))

RoomState_BlueHopper_0:                                                  ;8FDC2B;
    %StateHeader(\
    %levelData(LevelData_BlueHopper),
    %tileset($0D),
    %music($45, 6),
    %FX(FXHeader_BlueHopper_State0_1),
    %enemyPop(EnemyPopulations_BlueHopper),
    %enemySet(EnemySets_BlueHopper),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_BlueHopper),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_BlueHopper_State0_1),
    %libraryBG(LibBG_Tourian_D_VerticalStructures),
    %setupASM(RTS_8FC91E))

RoomState_BlueHopper_1:                                                  ;8FDC45;
    %StateHeader(\
    %levelData(LevelData_BlueHopper),
    %tileset($0D),
    %music(0, 0),
    %FX(FXHeader_BlueHopper_State0_1),
    %enemyPop(EnemyPopulations_BlueHopper),
    %enemySet(EnemySets_BlueHopper),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_BlueHopper),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_BlueHopper_State0_1),
    %libraryBG(LibBG_Tourian_D_VerticalStructures),
    %setupASM(RTS_8FC91E))

RoomDoors_BlueHopper:
    dw Door_BlueHopper_0                                                 ;8FDC5F;
    dw Door_BlueHopper_1                                                 ;8FDC61;

RoomScrolls_BlueHopper:
    db $01,$01                                                           ;8FDC63;

RoomHeader_DustTorizo:                                                   ;8FDC65;
    %RoomHeader(\
    %room(6),
    %area(5),
    %positions($11, $0F),
    %dimensions(2, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_DustTorizo))
    %stateChecks(1,
    %stateCheckEventSet($14, RoomState_DustTorizo_1))

RoomState_DustTorizo_0:                                                  ;8FDC77;
    %StateHeader(\
    %levelData(LevelData_DustTorizo),
    %tileset($0D),
    %music($45, 6),
    %FX(FXHeader_DustTorizo_State0_1),
    %enemyPop(EnemyPopulations_DustTorizo),
    %enemySet(EnemySets_DustTorizo),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_DustTorizo),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_DustTorizo_State0_1),
    %libraryBG(LibBG_Tourian_D_VerticalStructures),
    %setupASM(RTS_8FC91E))

RoomState_DustTorizo_1:                                                  ;8FDC91;
    %StateHeader(\
    %levelData(LevelData_DustTorizo),
    %tileset($0D),
    %music($1E, 5),
    %FX(FXHeader_DustTorizo_State0_1),
    %enemyPop(EnemyPopulations_DustTorizo),
    %enemySet(EnemySets_DustTorizo),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_DustTorizo),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_DustTorizo_State0_1),
    %libraryBG(LibBG_Tourian_D_VerticalStructures),
    %setupASM(RTS_8FC91E))

RoomDoors_DustTorizo:
    dw Door_DustTorizo_0                                                 ;8FDCAB;
    dw Door_DustTorizo_1                                                 ;8FDCAD;

RoomScrolls_DustTorizo:
    db $01,$01                                                           ;8FDCAF;

RoomHeader_BigBoy:                                                       ;8FDCB1;
    %RoomHeader(\
    %room(7),
    %area(5),
    %positions($0D, $0F),
    %dimensions(4, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_BigBoy))
    %stateChecks(1,
    %stateCheckEventSet($14, RoomState_BigBoy_1))

RoomState_BigBoy_0:                                                      ;8FDCC3;
    %StateHeader(\
    %levelData(LevelData_BigBoy),
    %tileset($0D),
    %music(0, 0),
    %FX(FXHeader_BigBoy_State0_1),
    %enemyPop(EnemyPopulations_BigBoy),
    %enemySet(EnemySets_BigBoy),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_BigBoy),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_BigBoy_State0_1),
    %libraryBG(LibBG_Tourian_D_VerticalStructures),
    %setupASM(RTS_8FC91E))

RoomState_BigBoy_1:                                                      ;8FDCDD;
    %StateHeader(\
    %levelData(LevelData_BigBoy),
    %tileset($0D),
    %music(0, 0),
    %FX(FXHeader_BigBoy_State0_1),
    %enemyPop(EnemyPopulations_BigBoy),
    %enemySet(EnemySets_BigBoy),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_BigBoy),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_BigBoy_State0_1),
    %libraryBG(LibBG_Tourian_D_VerticalStructures),
    %setupASM(RTS_8FC91E))

RoomDoors_BigBoy:
    dw Door_BigBoy_0                                                     ;8FDCF7;
    dw Door_BigBoy_1                                                     ;8FDCF9;

RoomScrolls_BigBoy:
    db $01,$01,$01,$01                                                   ;8FDCFB;

RoomHeader_Seaweed:                                                      ;8FDCFF;
    %RoomHeader(\
    %room(8),
    %area(5),
    %positions($0C, $0F),
    %dimensions(1, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_Seaweed))
    %stateChecks(0)

RoomState_Seaweed:                                                       ;8FDD0C;
    %StateHeader(\
    %levelData(LevelData_Seaweed),
    %tileset($0D),
    %music($1E, 5),
    %FX(FXHeader_Seaweed),
    %enemyPop(EnemyPopulations_Seaweed),
    %enemySet(EnemySets_Seaweed),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_Seaweed),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_Seaweed),
    %libraryBG(LibBG_Tourian_D_VerticalStructures),
    %setupASM(RTS_8FC91E))

RoomDoors_Seaweed:
    dw Door_Seaweed_0                                                    ;8FDD26;
    dw Door_Seaweed_1                                                    ;8FDD28;
    dw Door_Seaweed_2                                                    ;8FDD2A;

RoomScrolls_Seaweed:
    db $02,$02                                                           ;8FDD2C;

RoomHeader_TourianRecharge:                                              ;8FDD2E;
    %RoomHeader(\
    %room(9),
    %area(5),
    %positions($0B, $10),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_TourianRecharge))
    %stateChecks(0)

RoomState_TourianRecharge:                                               ;8FDD3B;
    %StateHeader(\
    %levelData(LevelData_RefillStation_RightSideDoor),
    %tileset($18),
    %music(0, 0),
    %FX(FXHeader_TourianRecharge),
    %enemyPop(EnemyPopulations_TourianRecharge),
    %enemySet(EnemySets_TourianRecharge),
    %layer2Scrolls(0, 0),
    %scrollPointer(RoomScrolls_TourianRecharge),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_TourianRecharge),
    %libraryBG(0),
    %setupASM(RTS_8FC91E))

RoomDoors_TourianRecharge:
    dw Door_TourianRecharge_0                                            ;8FDD55;

RoomScrolls_TourianRecharge:
    db $01                                                               ;8FDD57;

RoomHeader_MotherBrain:                                                  ;8FDD58;
    %RoomHeader(\
    %room($0A),
    %area(5),
    %positions($0D, $12),
    %dimensions(4, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_MotherBrain))
    %stateChecks(2,
    %stateCheckMainBoss(RoomState_MotherBrain_2),
    %stateCheckEventSet(2, RoomState_MotherBrain_1))

RoomState_MotherBrain_0:                                                 ;8FDD6E;
    %StateHeader(\
    %levelData(LevelData_MotherBrain),
    %tileset($0E),
    %music(0, 0),
    %FX(FXHeader_MotherBrain_State0_1),
    %enemyPop(EnemyPopulations_MotherBrain_0_1),
    %enemySet(EnemySets_MotherBrain_0_1),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_MotherBrain),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_MotherBrain_State0_1_2),
    %libraryBG(LibBG_Tourian_E_PipeRoom_Dark),
    %setupASM(RTS_8FC91E))

RoomState_MotherBrain_1:                                                 ;8FDD88;
    %StateHeader(\
    %levelData(LevelData_MotherBrain),
    %tileset($0E),
    %music(0, 0),
    %FX(FXHeader_MotherBrain_State0_1),
    %enemyPop(EnemyPopulations_MotherBrain_0_1),
    %enemySet(EnemySets_MotherBrain_0_1),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_MotherBrain),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_MotherBrain_State0_1_2),
    %libraryBG(LibBG_Tourian_E_PipeRoom_Dark),
    %setupASM(RTS_8FC91E))

RoomState_MotherBrain_2:                                                 ;8FDDA2;
    %StateHeader(\
    %levelData(LevelData_MotherBrain),
    %tileset($0E),
    %music(0, 3),
    %FX(FXHeader_Debug_MotherBrain_State2),
    %enemyPop(EnemyPopulations_Draygon_State1_MotherBrain_State2),
    %enemySet(EnemySets_Draygon_1_MotherBrain_2),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_MotherBrain),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_MotherBrain_State0_1_2),
    %libraryBG(LibBG_Tourian_E_PipeRoom_Dark),
    %setupASM(RTS_8FC91E))

RoomDoors_MotherBrain:
    dw Door_MotherBrain_0                                                ;8FDDBC;
    dw Door_MotherBrain_1                                                ;8FDDBE;

RoomScrolls_MotherBrain:
    db $01,$01,$01,$01                                                   ;8FDDC0;

RoomHeader_TourianEyeDoor:                                               ;8FDDC4;
    %RoomHeader(\
    %room($0B),
    %area(5),
    %positions($0D, $10),
    %dimensions(4, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_TourianEyeDoor))
    %stateChecks(0)

RoomState_TourianEyeDoor:                                                ;8FDDD1;
    %StateHeader(\
    %levelData(LevelData_TourianEyeDoor),
    %tileset($0D),
    %music(0, 0),
    %FX(FXHeader_TourianEyeDoor),
    %enemyPop(EnemyPopulations_TourianEyeDoor),
    %enemySet(EnemySets_TourianEyeDoor),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_TourianEyeDoor),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_TourianEyeDoor),
    %libraryBG(LibBG_Tourian_D_VerticalStructures),
    %setupASM(RTS_8FC91E))

RoomDoors_TourianEyeDoor:
    dw Door_TourianEyeDoor_0                                             ;8FDDEB;
    dw Door_TourianEyeDoor_1                                             ;8FDDED;

RoomScrolls_TourianEyeDoor:
    db $01,$01,$01,$01                                                   ;8FDDEF;

RoomHeader_RinkaShaft:                                                   ;8FDDF3;
    %RoomHeader(\
    %room($0C),
    %area(5),
    %positions($11, $10),
    %dimensions(1, 3),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_RinkaShaft))
    %stateChecks(0)

RoomState_RinkaShaft:                                                    ;8FDE00;
    %StateHeader(\
    %levelData(LevelData_RinkaShaft),
    %tileset($0D),
    %music($1E, 5),
    %FX(FXHeader_RinkaShaft),
    %enemyPop(EnemyPopulations_RinkaShaft),
    %enemySet(EnemySets_RinkaShaft),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_RinkaShaft),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_RinkaShaft),
    %libraryBG(LibBG_Tourian_D_PipeRoom_VerticalSeparation),
    %setupASM(RTS_8FC91E))

RoomDoors_RinkaShaft:
    dw Door_RinkaShaft_0                                                 ;8FDE1A;
    dw Door_RinkaShaft_1                                                 ;8FDE1C;
    dw Door_RinkaShaft_2                                                 ;8FDE1E;

RoomScrolls_RinkaShaft:
    db $02,$02,$02                                                       ;8FDE20;

RoomHeader_MotherBrainSave:                                              ;8FDE23;
    %RoomHeader(\
    %room($0D),
    %area(5),
    %positions($10, $11),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_MotherBrainSave))
    %stateChecks(0)

RoomState_MotherBrainSave:                                               ;8FDE30;
    %StateHeader(\
    %levelData(LevelData_SaveStation_RightSideDoor),
    %tileset($19),
    %music($1E, 5),
    %FX(FXHeader_MotherBrainSave),
    %enemyPop(EnemyPopulations_MotherBrainSave),
    %enemySet(EnemySets_MotherBrainSave),
    %layer2Scrolls(0, 0),
    %scrollPointer(RoomScrolls_MotherBrainSave),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_MotherBrainSave),
    %libraryBG(0),
    %setupASM(RTS_8FC91E))

RoomDoors_MotherBrainSave:
    dw Door_MotherBrainSave_0                                            ;8FDE4A;

RoomScrolls_MotherBrainSave:
    db $01                                                               ;8FDE4C;

RoomHeader_TourianEscape1:                                               ;8FDE4D;
    %RoomHeader(\
    %room($0E),
    %area(5),
    %positions($0B, $12),
    %dimensions(2, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_TourianEscape1))
    %stateChecks(0)

RoomState_TourianEscape1:                                                ;8FDE5A;
    %StateHeader(\
    %levelData(LevelData_TourianEscape1),
    %tileset($0D),
    %music($24, 7),
    %FX(FXHeader_TourianEscape1),
    %enemyPop(EnemyPopulations_TourianEscape1),
    %enemySet(EnemySets_TourianEscape1),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_TourianEscape1),
    %specialXray(0),
    %mainASM(MainASM_GenerateRandomExplosionOnEveryFourthFrame),
    %PLMPop(PLMPopulation_TourianEscape1),
    %libraryBG(LibBG_Tourian_D_PipeRoom_Letterbox),
    %setupASM(SetupASM_SetZebesTimebombEvent_SetLightHorizontalRoomShaking))

RoomDoors_TourianEscape1:
    dw Door_TourianEscape1_0                                             ;8FDE74;
    dw Door_TourianEscape1_1                                             ;8FDE76;

RoomScrolls_TourianEscape1:
    db $02,$02                                                           ;8FDE78;

RoomHeader_TourianEscape2:                                               ;8FDE7A;
    %RoomHeader(\
    %room($0F),
    %area(5),
    %positions($0B, $13),
    %dimensions(1, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_TourianEscape2))
    %stateChecks(0)

RoomState_TourianEscape2:                                                ;8FDE87;
    %StateHeader(\
    %levelData(LevelData_TourianEscape2),
    %tileset($0D),
    %music(0, 0),
    %FX(FXHeader_TourianEscape2),
    %enemyPop(EnemyPopulations_TourianEscape2),
    %enemySet(EnemySets_TourianEscape2),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_TourianEscape2),
    %specialXray(0),
    %mainASM(MainASM_ShakeScreenSwitchingBetweenLightHorizAndMediumDiag),
    %PLMPop(PLMPopulation_TourianEscape2),
    %libraryBG(LibBG_Tourian_D_PipeRoom_VerticalSeparation),
    %setupASM(SetupASM_SetLightHorizontalRoomShaking))

RoomDoors_TourianEscape2:
    dw Door_TourianEscape2_0                                             ;8FDEA1;
    dw Door_TourianEscape2_1                                             ;8FDEA3;

RoomScrolls_TourianEscape2:
    db $02,$01                                                           ;8FDEA5;

RoomHeader_TourianEscape3:                                               ;8FDEA7;
    %RoomHeader(\
    %room($10),
    %area(5),
    %positions($0C, $13),
    %dimensions(6, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_TourianEscape3))
    %stateChecks(0)

RoomState_TourianEscape3:                                                ;8FDEB4;
    %StateHeader(\
    %levelData(LevelData_TourianEscape3),
    %tileset($0D),
    %music(0, 0),
    %FX(FXHeader_TourianEscape3),
    %enemyPop(EnemyPopulations_TourianEscape3),
    %enemySet(EnemySets_TourianEscape3),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_TourianEscape3),
    %specialXray(0),
    %mainASM(MainASM_GenerateRandomExplosionOnEveryFourthFrame),
    %PLMPop(PLMPopulation_TourianEscape3),
    %libraryBG(LibBG_Tourian_D_PipeRoom),
    %setupASM(SetupASM_SetMediumHorizontalRoomShaking))

RoomDoors_TourianEscape3:
    dw Door_TourianEscape3_0                                             ;8FDECE;
    dw Door_TourianEscape3_1                                             ;8FDED0;

RoomScrolls_TourianEscape3:
    db $02,$02,$02,$02,$02,$02,$01,$01,$01,$01,$01,$01                   ;8FDED2;

RoomHeader_TourianEscape4:                                               ;8FDEDE;
    %RoomHeader(\
    %room($11),
    %area(5),
    %positions($12, $10),
    %dimensions(3, 6),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_TourianEscape4))
    %stateChecks(0)

RoomState_TourianEscape4:                                                ;8FDEEB;
    %StateHeader(\
    %levelData(LevelData_TourianEscape4),
    %tileset($0D),
    %music(0, 0),
    %FX(FXHeader_ToruianEscaper4),
    %enemyPop(EnemyPopulations_TourianEscape4),
    %enemySet(EnemySets_TourianEscape4),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(RoomScrolls_TourianEscape4),
    %specialXray(0),
    %mainASM(MainASM_ShakeScreenSwitchingBetweenMediumHorizAndStrongDiag),
    %PLMPop(PLMPopulation_TourianEscape4),
    %libraryBG(LibBG_Tourian_D_PipeRoom),
    %setupASM(SetupASM_SetupEscapeRoom4sPLM_SetMediumHorizontalRoomShaking))

RoomDoors_TourianEscape4:
    dw Door_TourianEscape4_0                                             ;8FDF05;
    dw Door_TourianEscape4_1                                             ;8FDF07;

RoomScrolls_TourianEscape4:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$01   ;8FDF09;
    db $01,$01                                                           ;8FDF19;

RoomHeader_UpperTourianSave:                                             ;8FDF1B;
    %RoomHeader(\
    %room($12),
    %area(5),
    %positions($15, $0C),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_UpperTourianSave))
    %stateChecks(0)

RoomState_UpperTourianSave:                                              ;8FDF28;
    %StateHeader(\
    %levelData(LevelData_SaveStation_LeftSideDoor),
    %tileset($19),
    %music($1E, 5),
    %FX(FXHeader_UpperTourianSave),
    %enemyPop(EnemyPopulations_UpperTourianSave),
    %enemySet(EnemySets_UpperTourianSave),
    %layer2Scrolls(0, 0),
    %scrollPointer(RoomScrolls_UpperTourianSave),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(PLMPopulation_UpperTourianSave),
    %libraryBG(0),
    %setupASM(0))

RoomDoors_UpperTourianSave:
    dw Door_UpperTourianSave_0                                           ;8FDF42;

RoomScrolls_UpperTourianSave:
    db $01                                                               ;8FDF44;

RoomHeader_CeresElev:                                                    ;8FDF45;
    %RoomHeader(\
    %room(0),
    %area(6),
    %positions($0C, $0D),
    %dimensions(1, 3),
    %scrollers($70, $A0),
    %CRE(5),
    %doorList(RoomDoors_CeresElev))
    %stateChecks(1,
    %stateCheckBossDead(1, RoomState_CeresElev_1))

RoomState_CeresElev_0:                                                   ;8FDF57;
    %StateHeader(\
    %levelData(LevelData_CeresElev),
    %tileset($11),
    %music($2D, 6),
    %FX(FXHeader_CeresElev_State0_1),
    %enemyPop(EnemyPopulations_CeresElev_0),
    %enemySet(EnemySets_CeresElev_0),
    %layer2Scrolls(0, 0),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(MainASM_CeresElevatorShaft),
    %PLMPop(PLMPopulation_CeresElev_State0_1),
    %libraryBG(LibBG_CeresElevator_State0_1),
    %setupASM(SetupASM_SpawnCeresHaze))

RoomState_CeresElev_1:                                                   ;8FDF71;
    %StateHeader(\
    %levelData(LevelData_CeresElev),
    %tileset($12),
    %music(0, 0),
    %FX(FXHeader_CeresElev_State0_1),
    %enemyPop(EnemyPopulations_CeresElev_1),
    %enemySet(EnemySets_CeresElev_1),
    %layer2Scrolls(0, 0),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(MainASM_CeresElevatorShaft),
    %PLMPop(PLMPopulation_CeresElev_State0_1),
    %libraryBG(LibBG_CeresElevator_State0_1),
    %setupASM(SetupASM_TurnCeresDoorToSolidBlocks_SpawnCeresHaze))

RoomDoors_CeresElev:
    dw Door_CeresElev_0                                                  ;8FDF8B;

RoomHeader_FallingTile:                                                  ;8FDF8D;
    %RoomHeader(\
    %room(1),
    %area(6),
    %positions($0D, $0F),
    %dimensions(2, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_FallingTile))
    %stateChecks(1,
    %stateCheckBossDead(1, RoomState_FallingTile_1))

RoomState_FallingTile_0:                                                 ;8FDF9F;
    %StateHeader(\
    %levelData(LevelData_FallingTile),
    %tileset($0F),
    %music(0, 0),
    %FX(FXHeader_FallingTile_State0),
    %enemyPop(EnemyPopulations_FallingTile_0),
    %enemySet(EnemySets_FallingTile_0),
    %layer2Scrolls($C1, 1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(MainASM_SpawnCeresPreElevatorHallFallingDebris),
    %PLMPop(PLMPopulation_FallingTile_State0_1),
    %libraryBG(LibBG_Tourian_D_E_StatueHall),
    %setupASM(SetupASM_SpawnCeresHaze))

RoomState_FallingTile_1:                                                 ;8FDFB9;
    %StateHeader(\
    %levelData(LevelData_FallingTile),
    %tileset($10),
    %music(0, 0),
    %FX(FXHeader_FallingTile_State1),
    %enemyPop(EnemyPopulations_FallingTile_1),
    %enemySet(EnemySets_FallingTile_1),
    %layer2Scrolls($C1, 1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(MainASM_SpawnCeresPreElevatorHallFallingDebris),
    %PLMPop(PLMPopulation_FallingTile_State0_1),
    %libraryBG(LibBG_Tourian_D_E_StatueHall),
    %setupASM(SetupASM_SpawnCeresHaze))

RoomDoors_FallingTile:
    dw Door_FallingTile_0                                                ;8FDFD3;
    dw Door_FallingTile_1                                                ;8FDFD5;

RoomHeader_MagnetStairs:                                                 ;8FDFD7;
    %RoomHeader(\
    %room(2),
    %area(6),
    %positions($0F, $0F),
    %dimensions(1, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_MagnetStairs))
    %stateChecks(1,
    %stateCheckBossDead(1, RoomState_MagnetStairs_1))

RoomState_MagnetStairs_0:                                                ;8FDFE9;
    %StateHeader(\
    %levelData(LevelData_MagnetStairs),
    %tileset($0F),
    %music(0, 0),
    %FX(FXHeader_MagnetStairs_State0),
    %enemyPop(EnemyPopulations_MagnetStairs_0),
    %enemySet(EnemySets_MagnetStairs_0),
    %layer2Scrolls(1, $41),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(RTS_8FE524),
    %PLMPop(PLMPopulation_MagnetStairs_State0_1),
    %libraryBG(LibBG_Tourian_D_E_StatueHall),
    %setupASM(SetupASM_SpawnCeresHaze))

RoomState_MagnetStairs_1:                                                ;8FE003;
    %StateHeader(\
    %levelData(LevelData_MagnetStairs),
    %tileset($10),
    %music(0, 0),
    %FX(FXHeader_MagnetStairs_State1),
    %enemyPop(EnemyPopulations_MagnetStairs_1),
    %enemySet(EnemySets_MagnetStairs_1),
    %layer2Scrolls(1, $C1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(RTS_8FE524),
    %PLMPop(PLMPopulation_MagnetStairs_State0_1),
    %libraryBG(LibBG_Tourian_D_E_StatueHall),
    %setupASM(SetupASM_SpawnCeresHaze))

RoomDoors_MagnetStairs:
    dw Door_MagnetStairs_0                                               ;8FE01D;
    dw Door_MagnetStairs_1                                               ;8FE01F;

RoomHeader_DeadScientist:                                                ;8FE021;
    %RoomHeader(\
    %room(3),
    %area(6),
    %positions($10, $10),
    %dimensions(2, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_DeadScientist))
    %stateChecks(1,
    %stateCheckBossDead(1, RoomState_DeadScientist_1))

RoomState_DeadScientist_0:                                               ;8FE033;
    %StateHeader(\
    %levelData(LevelData_DeadScientist),
    %tileset($0F),
    %music(0, 0),
    %FX(FXHeader_DeadScientist_State0),
    %enemyPop(EnemyPopulations_DeadScientist_0),
    %enemySet(EnemySets_DeadScientist_0),
    %layer2Scrolls($C0, 0),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(RTS_8FE524),
    %PLMPop(PLMPopulation_DeadScientist_State0_1),
    %libraryBG(0),
    %setupASM(SetupASM_SpawnCeresHaze))

RoomState_DeadScientist_1:                                               ;8FE04D;
    %StateHeader(\
    %levelData(LevelData_DeadScientist),
    %tileset($10),
    %music(0, 0),
    %FX(FXHeader_DeadScientist_State1),
    %enemyPop(EnemyPopulations_DeadScientist_1),
    %enemySet(EnemySets_DeadScientist_1),
    %layer2Scrolls($C0, 0),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(RTS_8FE524),
    %PLMPop(PLMPopulation_DeadScientist_State0_1),
    %libraryBG(0),
    %setupASM(SetupASM_SpawnCeresHaze))

RoomDoors_DeadScientist:
    dw Door_DeadScientist_0                                              ;8FE067;
    dw Door_DeadScientist_1                                              ;8FE069;

RoomHeader_58Escape:                                                     ;8FE06B;
    %RoomHeader(\
    %room(4),
    %area(6),
    %positions($12, $10),
    %dimensions(2, 1),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_58Escape))
    %stateChecks(1,
    %stateCheckBossDead(1, RoomState_58Escape_1))

RoomState_58Escape_0:                                                    ;8FE07D;
    %StateHeader(\
    %levelData(LevelData_58Escape),
    %tileset($0F),
    %music(0, 0),
    %FX(FXHeader_58Escape_State0),
    %enemyPop(EnemyPopulations_58Escape_0),
    %enemySet(EnemySets_58Escape_0),
    %layer2Scrolls($C1, 1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(RTS_8FE524),
    %PLMPop(PLMPopulation_58Escape_State0_1),
    %libraryBG(LibBG_Tourian_D_E_StatueHall),
    %setupASM(SetupASM_SpawnCeresHaze))

RoomState_58Escape_1:                                                    ;8FE097;
    %StateHeader(\
    %levelData(LevelData_58Escape),
    %tileset($10),
    %music(0, 0),
    %FX(FXHeader_58Escape_State1),
    %enemyPop(EnemyPopulations_58Escape_1),
    %enemySet(EnemySets_58Escape_1),
    %layer2Scrolls($C1, 1),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(RTS_8FE524),
    %PLMPop(PLMPopulation_58Escape_State0_1),
    %libraryBG(LibBG_Tourian_D_E_StatueHall),
    %setupASM(SetupASM_SpawnCeresHaze))

RoomDoors_58Escape:
    dw Door_58Escape_0                                                   ;8FE0B1;
    dw Door_58Escape_1                                                   ;8FE0B3;

RoomHeader_CeresRidley:                                                  ;8FE0B5;
    %RoomHeader(\
    %room(5),
    %area(6),
    %positions($14, $10),
    %dimensions(1, 1),
    %scrollers($70, $A0),
    %CRE(5),
    %doorList(RoomDoors_CeresRidley))
    %stateChecks(1,
    %stateCheckBossDead(1, RoomState_CeresRidley_1))

RoomState_CeresRidley_0:                                                 ;8FE0C7;
    %StateHeader(\
    %levelData(LevelData_CeresRidley),
    %tileset($13),
    %music($24, $80),
    %FX(FXHeader_CeresRidley_State0),
    %enemyPop(EnemyPopulations_CeresRidley_0),
    %enemySet(EnemySets_CeresRidley_0),
    %layer2Scrolls(0, 0),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(MainASM_HandleCeresRidleyGetawayCutscene),
    %PLMPop(PLMPopulation_CeresRidley_State0_1),
    %libraryBG(0),
    %setupASM(SetupASM_SetBG1_2_TilesBaseAddress_SpawnCeresHaze))

RoomState_CeresRidley_1:                                                 ;8FE0E1;
    %StateHeader(\
    %levelData(LevelData_CeresRidley),
    %tileset($14),
    %music(0, 0),
    %FX(FXHeader_CeresRidley_State1),
    %enemyPop(EnemyPopulations_CeresRidley_1),
    %enemySet(EnemySets_CeresRidley_1),
    %layer2Scrolls(0, 0),
    %scrollPointer(0),
    %specialXray(0),
    %mainASM(MainASM_HandleCeresRidleyGetawayCutscene),
    %PLMPop(PLMPopulation_CeresRidley_State0_1),
    %libraryBG(0),
    %setupASM(SetupASM_SetBG1_2_TilesBaseAddress_SpawnCeresHaze))

RoomDoors_CeresRidley:
    dw Door_CeresRidley                                                  ;8FE0FB;


;;; $E0FD: Library background ;;;
LibBG_Phantoon_State0:                                                   ;8FE0FD;
; Room $CD13, state $CD25: Phantoon
    dw $0002 : dl $7E2000 : dw $4800,$1000
    dw $0000

LibBG_Draygon_State0:                                                    ;8FE108;
; Room $DA60, state $DA72: Draygon
    dw $0002 : dl $7E2000 : dw $4800,$1000
    dw $0000

LibBG_Phantoon_Draygon_State1:
; Room $CD13, state $CD3F: Phantoon
; Room $DA60, state $DA8C: Draygon
    dw $000A
    dw $0000

LibBG_WreckedShip_4_5_EntranceHall:                                      ;8FE117;
; Room $CA08, state $CA1A: Wrecked Ship entrance treadmill
; Room $CA08, state $CA34: Wrecked Ship entrance treadmill
; Room $E82C, state $E839: Debug room
    dw $0004 : dl Background_WreckedShip_4_5_EntranceHall_0 : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_LibBG_WreckedShip_4_5_EntranceHall_1_8FE132:                      ;8FE132;
    dw $0004 : dl Background_WreckedShip_4_5_EntranceHall_1 : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED

LibBG_WreckedShip_4_5_Columns_Tubes:                                     ;8FE14D;
; Room $CB8B, state $CB9D: Wrecked Ship flooded spikey hall
; Room $CB8B, state $CBB7: Wrecked Ship flooded spikey hall
; Room $CC6F, state $CC81: Pre Phantoon hall
; Room $CC6F, state $CC9B: Pre Phantoon hall
    dw $0004 : dl Background_WreckedShip_4_5_Columns_Tubes : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_WreckedShip_4_5_ExperimentRoom:                                    ;8FE168;
; Room $CA52, state $CA64: Wrecked Ship attic
; Room $CA52, state $CA7E: Wrecked Ship attic
    dw $0004 : dl Background_WreckedShip_4_5_ExperimentRoom : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_WreckedShip_4_5_Panels_Vents:                                      ;8FE183;
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

LibBG_WreckedShip_4_5_Panels_Vents_Horizontal:                           ;8FE19E;
; Room $CAF6, state $CB08: Wrecked Ship mainstreet
; Room $CAF6, state $CB22: Wrecked Ship mainstreet
; Room $CBD5, state $CBE7: Wrecked Ship east exit
; Room $CBD5, state $CC01: Wrecked Ship east exit
; Room $CDF1, state $CE03: Wrecked Ship hidden super missile hall
    dw $0004 : dl Background_WreckedShip_4_5_Panels_Vents_Horizontal : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_WreckedShip_4_5_Panels_Vents_Vertical:                             ;8FE1B9;
; Room $CAAE, state $CAC0: Wrecked Ship attic missile tank room
; Room $CAAE, state $CADA: Wrecked Ship attic missile tank room
    dw $0004 : dl Background_WreckedShip_4_5_Panels_Vents_Vertical : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_CeresElevator_State0_1:                                            ;8FE1D4;
; Room $DF45, state $DF57: Ceres elevator shaft
; Room $DF45, state $DF71: Ceres elevator shaft
    dw $000A
    dw $0000


;;; $E1D8: Door ASM: start Wrecked Ship treadmill east entrance ;;;
DoorASM_StartWreckedShipTreadmillEastEntrance:
; Room $CAF6, door list index 0: Door
    LDY.W #AnimatedTilesObjects_FX_wreckedShipTreadmillLeftwards         ;8FE1D8;
    JSL.L Spawn_AnimatedTilesObject                                      ;8FE1DB;
    JSL.L Spawn_Hardcoded_PLM                                            ;8FE1DF;
    db $04,$09                                                           ;8FE1E3;
    dw PLMEntries_wreckedShipEntranceTreadmillFromEast                   ;8FE1E5;
    RTS                                                                  ;8FE1E7;


;;; $E1E8: Door ASM: scroll 1 = blue ;;;
DoorASM_Scroll_1_Blue:
; Room $CB8B, door list index 0: Door
    PHP                                                                  ;8FE1E8;
    SEP #$20                                                             ;8FE1E9;
    LDA.B #$01                                                           ;8FE1EB;
    STA.L Scrolls+1                                                      ;8FE1ED;
    PLP                                                                  ;8FE1F1;
    RTS                                                                  ;8FE1F2;


;;; $E1F3: Door ASM: scroll 0 = green ;;;
DoorASM_Scroll_0_Green_duplicate_again:
; Room $CC27, door list index 0: Door
    PHP                                                                  ;8FE1F3;
    SEP #$20                                                             ;8FE1F4;
    LDA.B #$02                                                           ;8FE1F6;
    STA.L Scrolls                                                        ;8FE1F8;
    PLP                                                                  ;8FE1FC;
    RTS                                                                  ;8FE1FD;


;;; $E1FE: Door ASM: scroll 3 = red, 4 = blue ;;;
DoorASM_Scroll_3_Red_4_Blue:
; Room $CD13, door list index 0: Door
    PHP                                                                  ;8FE1FE;
    SEP #$20                                                             ;8FE1FF;
    LDA.B #$00                                                           ;8FE201;
    STA.L Scrolls+3                                                      ;8FE203;
    LDA.B #$01                                                           ;8FE207;
    STA.L Scrolls+4                                                      ;8FE209;
    PLP                                                                  ;8FE20D;
    RTS                                                                  ;8FE20E;


;;; $E20F: Door ASM: scroll 29h = blue ;;;
DoorASM_Scroll_29_Blue:
; Room $CDF1, door list index 0: Door
    PHP                                                                  ;8FE20F;
    SEP #$20                                                             ;8FE210;
    LDA.B #$01                                                           ;8FE212;
    STA.L Scrolls+$29                                                    ;8FE214;
    PLP                                                                  ;8FE218;
    RTS                                                                  ;8FE219;


;;; $E21A: Door ASM: scroll 28h,2E = green ;;;
DoorASM_Scroll_28_2E_Green:
; Room $CC6F, door list index 0: Door
    PHP                                                                  ;8FE21A;
    SEP #$20                                                             ;8FE21B;
    LDA.B #$02                                                           ;8FE21D;
    STA.L Scrolls+$28                                                    ;8FE21F;
    STA.L Scrolls+$2E                                                    ;8FE223;
    PLP                                                                  ;8FE227;
    RTS                                                                  ;8FE228;


;;; $E229: Door ASM: scroll 6..Bh = red ;;;
DoorASM_Scroll_6_7_8_9_A_B_Red:
; Room $CE40, door list index 1: Door
    PHP                                                                  ;8FE229;
    SEP #$20                                                             ;8FE22A;
    LDA.B #$00                                                           ;8FE22C;
    STA.L Scrolls+6                                                      ;8FE22E;
    STA.L Scrolls+7                                                      ;8FE232;
    STA.L Scrolls+8                                                      ;8FE236;
    STA.L Scrolls+9                                                      ;8FE23A;
    STA.L Scrolls+$A                                                     ;8FE23E;
    STA.L Scrolls+$B                                                     ;8FE242;
    PLP                                                                  ;8FE246;
    RTS                                                                  ;8FE247;


;;; $E248: Library background ;;;
LibBG_Maridia_B_BrownWall:                                               ;8FE248;
; Room $D08A, state $D097: Maridia green gate hall
    dw $0004 : dl Background_Maridia_B_BrownWall : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$1000
    dw $0000

LibBG_Maridia_C_GreenWall:                                               ;8FE25A;
; Room $D461, state $D46E: Sand falls west
; Room $D4C2, state $D4CF: Sand falls east
    dw $0004 : dl Background_Maridia_C_GreenWall : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$1000
    dw $0000


;;; $E26C: Door ASM: set up elevatube from south ;;;
DoorASM_SetupElevatubeFromSouth:
; Room $D48E, door list index 2: Door
    LDA.W #$FF00                                                         ;8FE26C;
    STA.W RoomMainASMVar3                                                ;8FE26F;
    STZ.W RoomMainASMVar2                                                ;8FE272;
    LDA.W #$09C0                                                         ;8FE275;
    STA.W RoomMainASMVar2                                                ;8FE278;
    LDA.W #$FFE0                                                         ;8FE27B;
    STA.W RoomMainASMVar4                                                ;8FE27E;
    LDA.W #$0000                                                         ;8FE281;
    JSL.L Run_Samus_Command                                              ;8FE284;
    JSL.L Spawn_Hardcoded_PLM                                            ;8FE288;
    db $01,$00                                                           ;8FE28C;
    dw PLMEntries_maridiaElevatube                                       ;8FE28E;
    RTS                                                                  ;8FE290;


;;; $E291: Door ASM: set up elevatube from north ;;;
DoorASM_SetupElevatubeFromNorth:
; Room $D340, door list index 1: Door
    LDA.W #$0100                                                         ;8FE291;
    STA.W RoomMainASMVar3                                                ;8FE294;
    STZ.W RoomMainASMVar2                                                ;8FE297;
    LDA.W #$0040                                                         ;8FE29A;
    STA.W RoomMainASMVar2                                                ;8FE29D;
    LDA.W #$0020                                                         ;8FE2A0;
    STA.W RoomMainASMVar4                                                ;8FE2A3;
    LDA.W #$0000                                                         ;8FE2A6;
    JSL.L Run_Samus_Command                                              ;8FE2A9;
    JSL.L Spawn_Hardcoded_PLM                                            ;8FE2AD;
    db $01,$00                                                           ;8FE2B1;
    dw PLMEntries_maridiaElevatube                                       ;8FE2B3;
    RTS                                                                  ;8FE2B5;


;;; $E2B6: Main ASM: elevatube ;;;
MainASM_Elevatube:
; Room $D408. Maridia elevatube
    LDA.W #$0080                                                         ;8FE2B6;
    STA.W SamusXPosition                                                 ;8FE2B9;
    STZ.W SamusXSubPosition                                              ;8FE2BC;
    STZ.B DP_Temp12                                                      ;8FE2BF;
    STZ.B DP_Temp14                                                      ;8FE2C1;
    LDA.W RoomMainASMVar3                                                ;8FE2C3;
    BPL +                                                                ;8FE2C6;
    DEC.B DP_Temp14                                                      ;8FE2C8;

+   STA.B DP_Temp13                                                      ;8FE2CA;
    LDA.W RoomMainASMVar1                                                ;8FE2CC;
    CLC                                                                  ;8FE2CF;
    ADC.B DP_Temp12                                                      ;8FE2D0;
    STA.W RoomMainASMVar1                                                ;8FE2D2;
    LDA.W RoomMainASMVar2                                                ;8FE2D5;
    ADC.B DP_Temp14                                                      ;8FE2D8;
    STA.W RoomMainASMVar2                                                ;8FE2DA;
    LDA.B DP_Temp12                                                      ;8FE2DD;
    LDX.B DP_Temp14                                                      ;8FE2DF;
    STX.B DP_Temp12                                                      ;8FE2E1;
    STA.B DP_Temp14                                                      ;8FE2E3;
    JSL.L MoveSamusDown_NoSolidEnemyCollision                            ;8FE2E5;
    LDA.W RoomMainASMVar3                                                ;8FE2E9;
    CLC                                                                  ;8FE2EC;
    ADC.W RoomMainASMVar4                                                ;8FE2ED;
    CLC                                                                  ;8FE2F0;
    ADC.W #$0E20                                                         ;8FE2F1;
    CMP.W #$1C41                                                         ;8FE2F4;
    BCS .return                                                          ;8FE2F7;
    SEC                                                                  ;8FE2F9;
    SBC.W #$0E20                                                         ;8FE2FA;
    STA.W RoomMainASMVar3                                                ;8FE2FD;

  .return:
    RTS                                                                  ;8FE300;


;;; $E301: Door ASM: reset elevatube on north exit ;;;
DoorASM_ResetElevatubeOnNorthExit:
; Room $D408, door list index 1: Door
    LDA.W #$0001                                                         ;8FE301;
    JSL.L Run_Samus_Command                                              ;8FE304;
    RTS                                                                  ;8FE308;


;;; $E309: Door ASM: reset elevatube on south exit ;;;
DoorASM_ResetElevatubeOnSouthExit:
; Room $D408, door list index 0: Door
    LDA.W #$0202                                                         ;8FE309;
    STA.L Scrolls                                                        ;8FE30C;
    LDA.W #$0001                                                         ;8FE310;
    JSL.L Run_Samus_Command                                              ;8FE313;
    RTS                                                                  ;8FE317;


;;; $E318: Door ASM: scroll Ah = red, Bh = blue ;;;
DoorASM_Scroll_A_Red_B_Blue:
; Room $D845, door list index 0: Door
    PHP                                                                  ;8FE318;
    SEP #$20                                                             ;8FE319;
    LDA.B #$00                                                           ;8FE31B;
    STA.L Scrolls+$A                                                     ;8FE31D;
    LDA.B #$01                                                           ;8FE321;
    STA.L Scrolls+$B                                                     ;8FE323;
    PLP                                                                  ;8FE327;
    RTS                                                                  ;8FE328;


if !FEATURE_KEEP_UNREFERENCED
;;; $E329: Unused. Door ASM: scroll 10h = blue, 11h = red ;;;
UNUSED_DoorASM_Scroll_4_Green_8FE329:
    PHP                                                                  ;8FE329;
    SEP #$20                                                             ;8FE32A;
    LDA.B #$00                                                           ;8FE32C;
    STA.L Scrolls+$11                                                    ;8FE32E;
    LDA.B #$01                                                           ;8FE332;
    STA.L Scrolls+$10                                                    ;8FE334;
    PLP                                                                  ;8FE338;
    RTS                                                                  ;8FE339;


;;; $E33A: Unused. Door ASM: scroll 4 = green ;;;
UNUSED_DoorASM_Scroll_4_Green_8FE33A:
    PHP                                                                  ;8FE33A;
    SEP #$20                                                             ;8FE33B;
    LDA.B #$02                                                           ;8FE33D;
    STA.L Scrolls+4                                                      ;8FE33F;
    PLP                                                                  ;8FE343;
    RTS                                                                  ;8FE344;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E345: Door ASM: scroll 0 = red, 4 = blue ;;;
DoorASM_Scroll_0_Red_4_Blue_duplicate:
; Room $CEFB, door list index 2: Door
    PHP                                                                  ;8FE345;
    SEP #$20                                                             ;8FE346;
    LDA.B #$00                                                           ;8FE348;
    STA.L Scrolls                                                        ;8FE34A;
    LDA.B #$01                                                           ;8FE34E;
    STA.L Scrolls+4                                                      ;8FE350;
    PLP                                                                  ;8FE354;
    RTS                                                                  ;8FE355;


;;; $E356: Door ASM: scroll 0 = red, 1 = blue ;;;
DoorASM_Scroll_0_Red_1_Blue:
; Room $CF80, door list index 2: Door
; Room $D3B6, door list index 0: Door
    PHP                                                                  ;8FE356;
    SEP #$20                                                             ;8FE357;
    LDA.B #$00                                                           ;8FE359;
    STA.L Scrolls                                                        ;8FE35B;
    LDA.B #$01                                                           ;8FE35F;
    STA.L Scrolls+1                                                      ;8FE361;
    PLP                                                                  ;8FE365;
    RTS                                                                  ;8FE366;


;;; $E367: Door ASM: scroll 9 = red, Ah = blue ;;;
DoorASM_Scroll_9_Red_A_Blue:
; Room $D104, door list index 1: Door
    PHP                                                                  ;8FE367;
    SEP #$20                                                             ;8FE368;
    LDA.B #$00                                                           ;8FE36A;
    STA.L Scrolls+9                                                      ;8FE36C;
    LDA.B #$01                                                           ;8FE370;
    STA.L Scrolls+$A                                                     ;8FE372;
    PLP                                                                  ;8FE376;
    RTS                                                                  ;8FE377;


;;; $E378: Door ASM: scroll 0,2 = red, 1 = blue ;;;
DoorASM_Scroll_0_2_Red_1_Blue:
; Room $CF54, door list index 0: Door
; Room $CF80, door list index 0: Door
    PHP                                                                  ;8FE378;
    SEP #$20                                                             ;8FE379;
    LDA.B #$00                                                           ;8FE37B;
    STA.L Scrolls                                                        ;8FE37D;
    STA.L Scrolls+2                                                      ;8FE381;
    LDA.B #$01                                                           ;8FE385;
    STA.L Scrolls+1                                                      ;8FE387;
    PLP                                                                  ;8FE38B;
    RTS                                                                  ;8FE38C;


;;; $E38D: Door ASM: scroll 1 = blue ;;;
DoorASM_Scroll_1_Blue_duplicate:
; Room $D7E4, door list index 0: Door
    PHP                                                                  ;8FE38D;
    SEP #$20                                                             ;8FE38E;
    LDA.B #$01                                                           ;8FE390;
    STA.L Scrolls+1                                                      ;8FE392;
    PLP                                                                  ;8FE396;
    RTS                                                                  ;8FE397;


;;; $E398: Door ASM: scroll 6 = blue ;;;
DoorASM_Scroll_6_Blue:
; Room $D5A7, door list index 0: Door
    PHP                                                                  ;8FE398;
    SEP #$20                                                             ;8FE399;
    LDA.B #$01                                                           ;8FE39B;
    STA.L Scrolls+6                                                      ;8FE39D;
    PLP                                                                  ;8FE3A1;
    RTS                                                                  ;8FE3A2;


;;; $E3A3: Door ASM: scroll 4 = red ;;;
DoorASM_Scroll_4_Red_duplicate:
; Room $D4C2, door list index 1: Door
; Room $D69A, door list index 0: Door
    PHP                                                                  ;8FE3A3;
    SEP #$20                                                             ;8FE3A4;
    LDA.B #$00                                                           ;8FE3A6;
    STA.L Scrolls+4                                                      ;8FE3A8;
    PLP                                                                  ;8FE3AC;
    RTS                                                                  ;8FE3AD;


if !FEATURE_KEEP_UNREFERENCED
;;; $E3AE: Unused. Door ASM: scroll 1 = red ;;;
UNUSED_DoorASM_Scroll_1_Red_8FE3AE:
    PHP                                                                  ;8FE3AE;
    SEP #$20                                                             ;8FE3AF;
    LDA.B #$00                                                           ;8FE3B1;
    STA.L Scrolls+1                                                      ;8FE3B3;
    PLP                                                                  ;8FE3B7;
    RTS                                                                  ;8FE3B8;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E3B9: Door ASM: scroll 4,7 = red ;;;
DoorASM_Scroll_4_7_Red:
; Room $D646, door list index 3: Door
    PHP                                                                  ;8FE3B9;
    SEP #$20                                                             ;8FE3BA;
    LDA.B #$00                                                           ;8FE3BC;
    STA.L Scrolls+4                                                      ;8FE3BE;
    STA.L Scrolls+7                                                      ;8FE3C2;
    PLP                                                                  ;8FE3C6;
    RTS                                                                  ;8FE3C7;


;;; $E3C8: Door ASM: scroll 1 = blue, 2 = red ;;;
DoorASM_Scroll_1_Blue_2_Red_duplicate:
; Room $D8C5, door list index 0: Door
    PHP                                                                  ;8FE3C8;
    SEP #$20                                                             ;8FE3C9;
    LDA.B #$00                                                           ;8FE3CB;
    STA.L Scrolls+2                                                      ;8FE3CD;
    LDA.B #$01                                                           ;8FE3D1;
    STA.L Scrolls+1                                                      ;8FE3D3;
    PLP                                                                  ;8FE3D7;
    RTS                                                                  ;8FE3D8;


;;; $E3D9: Door ASM: scroll 0,2 = green ;;;
DoorASM_Scroll_0_2_Green_duplicate:
; Room $DA60, door list index 0: Door
    PHP                                                                  ;8FE3D9;
    SEP #$20                                                             ;8FE3DA;
    LDA.B #$02                                                           ;8FE3DC;
    STA.L Scrolls                                                        ;8FE3DE;
    STA.L Scrolls+2                                                      ;8FE3E2;
    PLP                                                                  ;8FE3E6;
    RTS                                                                  ;8FE3E7;


;;; $E3E8: Library background ;;;
LibBG_Tourian_D_MechanicalRoom:                                          ;8FE3E8;
; Room $DAAE, state $DABB: Tourian -> Crateria elevator
; Room $DB31, state $DB43: Metroid room 2
; Room $DB31, state $DB5D: Metroid room 2
; Room $DBCD, state $DBDF: Metroid room 4
; Room $DBCD, state $DBF9: Metroid room 4
    dw $0004 : dl Background_Tourian_D_MechanicalRoom : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Tourian_D_MechanicalRoom_Letterbox:                                ;8FE403;
; Room $DAE1, state $DAF3: Metroid room 1
; Room $DAE1, state $DB0D: Metroid room 1
; Room $DB7D, state $DB8F: Metroid room 3
; Room $DB7D, state $DBA9: Metroid room 3
    dw $0004 : dl Background_Tourian_D_MechanicalRoom_Letterbox : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Tourian_D_VerticalStructures:                                      ;8FE41E;
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

LibBG_Tourian_D_PipeRoom_Letterbox:                                      ;8FE439;
; Room $DE4D, state $DE5A: Escape room 1
    dw $0004 : dl Background_Tourian_D_PipeRoom_Letterbox : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Tourian_D_PipeRoom_VerticalSeparation:                             ;8FE454;
; Room $DDF3, state $DE00: Pre Mother Brain shaft
; Room $DE7A, state $DE87: Escape room 2
    dw $0004 : dl Background_Tourian_D_PipeRoom_VerticalSeparation : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Tourian_D_PipeRoom:                                                ;8FE46F;
; Room $DEA7, state $DEB4: Escape room 3
; Room $DEDE, state $DEEB: Escape room 4
    dw $0004 : dl Background_Tourian_D_PipeRoom : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Tourian_E_PipeRoom_Dark:                                           ;8FE48A;
; Room $DD58, state $DD6E: Mother Brain
; Room $DD58, state $DD88: Mother Brain
; Room $DD58, state $DDA2: Mother Brain
    dw $0004 : dl Background_Tourian_E_PipeRoom_Dark : dw $4000
    dw $0002 : dl BG2Tilemap : dw $4800,$0800
    dw $0002 : dl BG2Tilemap : dw $4C00,$0800
    dw $0000

LibBG_Tourian_D_E_StatueHall:                                            ;8FE4A5;
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
    PHP                                                                  ;8FE4C0;
    SEP #$20                                                             ;8FE4C1;
    LDA.B #$02                                                           ;8FE4C3;
    STA.L Scrolls                                                        ;8FE4C5;
    STA.L Scrolls+1                                                      ;8FE4C9;
    PLP                                                                  ;8FE4CD;
    RTS                                                                  ;8FE4CE;


;;; $E4CF: Door ASM: scroll 8 = blue, 9 = red ;;;
DoorASM_Scroll_8_Blue_9_Red:
; Room $DEDE, door list index 1: Door
    PHP                                                                  ;8FE4CF;
    SEP #$20                                                             ;8FE4D0;
    LDA.B #$01                                                           ;8FE4D2;
    STA.L Scrolls+$18                                                    ;8FE4D4;
    LDA.B #$00                                                           ;8FE4D8;
    STA.L Scrolls+$19                                                    ;8FE4DA;
    PLP                                                                  ;8FE4DE;
    RTS                                                                  ;8FE4DF;


;;; $E4E0: Door ASM: to Ceres elevator shaft ;;;
DoorASM_ToCeresElevatorShaft:
; Room $DF8D, door list index 0: Door
    SEP #$20                                                             ;8FE4E0;
    LDA.B #$07                                                           ;8FE4E2;
    STA.B DP_FakeBGModeSize                                              ;8FE4E4;
    STA.W $2105                                                          ;8FE4E6;
    REP #$20                                                             ;8FE4E9;
    LDA.W #$0100                                                         ;8FE4EB;
    STA.B DP_Mode7TransMatrixA                                           ;8FE4EE;
    STA.B DP_Mode7TransMatrixD                                           ;8FE4F0;
    STZ.B DP_Mode7TransMatrixB                                           ;8FE4F2;
    STZ.B DP_Mode7TransMatrixC                                           ;8FE4F4;
    LDA.W #$0080                                                         ;8FE4F6;
    STA.B DP_Mode7TransOriginX                                           ;8FE4F9;
    LDA.W #$03F0                                                         ;8FE4FB;
    STA.B DP_Mode7TransOriginY                                           ;8FE4FE;
    LDA.W #$0001                                                         ;8FE500;
    STA.W Mode7Flag                                                      ;8FE503;
    LDA.W #$0022                                                         ;8FE506;
    STA.W RoomMainASMVar1                                                ;8FE509;
    LDA.W #$003C                                                         ;8FE50C;
    STA.W RoomMainASMVar2                                                ;8FE50F;
    RTS                                                                  ;8FE512;


;;; $E513: Door ASM: from Ceres elevator shaft ;;;
DoorASM_FromCeresElevatorShaft:
; Room $DF45, door list index 0: Door
    SEP #$20                                                             ;8FE513;
    LDA.B #$09                                                           ;8FE515;
    STA.B DP_FakeBGModeSize                                              ;8FE517;
    REP #$20                                                             ;8FE519;
    STZ.W Mode7Flag                                                      ;8FE51B;
    RTS                                                                  ;8FE51E;


;;; $E51F: Main ASM: Ceres elevator shaft ;;;
MainASM_CeresElevatorShaft:
; Handles landing on elevator and setting mode 7 rotation matrix
; Room $DF45. Ceres elevator shaft
    JSL.L RoomMainASM_CeresElevatorShaft                                 ;8FE51F;
    RTS                                                                  ;8FE523;


;;; $E524: Main ASM: RTS ;;;
RTS_8FE524:
; Room $DFD7. Ceres shaft
; Room $E021. Ceres baby Metroid hall
; Room $E06B. Pre Ceres Ridley hall
    RTS                                                                  ;8FE524;


;;; $E525: Main ASM: spawn Ceres pre elevator hall falling debris ;;;
MainASM_SpawnCeresPreElevatorHallFallingDebris:
; Room $DF8D. Ceres pre elevator hall
    LDA.W CeresStatus                                                    ;8FE525;
    BEQ RTS_8FE524                                                       ;8FE528;
    DEC.W RoomMainASMVar1                                                ;8FE52A;
    BPL RTS_8FE524                                                       ;8FE52D;
    LDA.W #$0008                                                         ;8FE52F;
    STA.W RoomMainASMVar1                                                ;8FE532;
    LDY.W #EnemyProjectile_CeresFallingTile_Light                        ;8FE535;
    LDA.W RandomNumberSeed                                               ;8FE538;
    ASL                                                                  ;8FE53B;
    BCC +                                                                ;8FE53C;
    LDY.W #EnemyProjectile_CeresFallingTile_Dark                         ;8FE53E;

+   LDA.W RandomNumberSeed                                               ;8FE541;
    AND.W #$000F                                                         ;8FE544;
    ASL                                                                  ;8FE547;
    TAX                                                                  ;8FE548;
    LDA.W .debrisXpos,X                                                  ;8FE549;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;8FE54C;
    RTS                                                                  ;8FE550;

  .debrisXpos:
    dw $0050,$0060,$0070,$0080,$0090,$00A0,$00B0,$00C0                   ;8FE551;
    dw $00D0,$00E0,$00F0,$0110,$0130,$0150,$0170,$0190                   ;8FE561;


;;; $E571: Main ASM: handle Ceres Ridley getaway cutscene ;;;
MainASM_HandleCeresRidleyGetawayCutscene:
; Room $E0B5. Ceres Ridley's room
    LDA.W CeresStatus                                                    ;8FE571;
    LSR                                                                  ;8FE574;
    BCC .return                                                          ;8FE575;
    JSL.L HandleCeresRidleyGetawayCutscene                               ;8FE577;

  .return:
    RTS                                                                  ;8FE57B;


;;; $E57C: Main ASM: shake screen switching between light horizontal and medium diagonal ;;;
MainASM_ShakeScreenSwitchingBetweenLightHorizAndMediumDiag:
; Room $DE7A. Escape room 2
; Horizontal screen shaking with a 1/80h chance of becoming medium diagonal for 2Ah frames
    LDA.W RoomMainASMVar1                                                ;8FE57C;
    BEQ .resetQuakeTimer                                                 ;8FE57F;
    DEC.W RoomMainASMVar1                                                ;8FE581;
    BNE MainASM_GenerateRandomExplosionOnEveryFourthFrame                ;8FE584;
    LDA.W #$0012                                                         ;8FE586;
    BRA +                                                                ;8FE589;

  .resetQuakeTimer:
    JSL.L GenerateRandomNumber                                           ;8FE58B;
    CMP.W #$0200                                                         ;8FE58F;
    BCS MainASM_GenerateRandomExplosionOnEveryFourthFrame                ;8FE592;
    LDA.W #$002A                                                         ;8FE594;
    STA.W RoomMainASMVar1                                                ;8FE597;
    LDA.W #$0017                                                         ;8FE59A;

+   STA.W EarthquakeType                                                 ;8FE59D; fallthrough to MainASM_GenerateRandomExplosionOnEveryFourthFrame


;;; $E5A0: Main ASM: generate random explosion on every fourth frame ;;;
MainASM_GenerateRandomExplosionOnEveryFourthFrame:
; Room $DE4D. Escape room 1
; Room $DEA7. Escape room 3
    JSR.W GenerateRandomExplosionOnEveryFourthFrame                      ;8FE5A0;
    RTS                                                                  ;8FE5A3;


;;; $E5A4: Main ASM: shake screen switching between medium horizontal and strong diagonal ;;;
MainASM_ShakeScreenSwitchingBetweenMediumHorizAndStrongDiag:
; Room $DEDE. Escape room 4
; Horizontal screen shaking with a 3/200h chance of becoming strong diagonal for 2Ah frames
    LDA.W RoomMainASMVar1                                                ;8FE5A4;
    BEQ .resetQuakeTimer                                                 ;8FE5A7;
    DEC.W RoomMainASMVar1                                                ;8FE5A9;
    BNE .noEarthquakeChange                                              ;8FE5AC;
    LDA.W #$0015                                                         ;8FE5AE;
    BRA +                                                                ;8FE5B1;

  .resetQuakeTimer:
    JSL.L GenerateRandomNumber                                           ;8FE5B3;
    CMP.W #$0180                                                         ;8FE5B7;
    BCS .noEarthquakeChange                                              ;8FE5BA;
    LDA.W #$002A                                                         ;8FE5BC;
    STA.W RoomMainASMVar1                                                ;8FE5BF;
    LDA.W #$001A                                                         ;8FE5C2;

+   STA.W RoomMainASMVar2                                                ;8FE5C5;

  .noEarthquakeChange:
    LDA.W RoomMainASMVar2                                                ;8FE5C8;
    STA.W EarthquakeType                                                 ;8FE5CB;
    JSR.W GenerateRandomExplosionOnEveryFourthFrame                      ;8FE5CE;
    RTS                                                                  ;8FE5D1;


;;; $E5D2: Room state checking handler ;;;
Room_State_Checking_Handler:
;; Parameters:
;;     X: Room pointer

; A matching state condition will return out of *this* routine by popping the return address pushed to the stack by $E5E0
    TXA                                                                  ;8FE5D2;
    CLC                                                                  ;8FE5D3;
    ADC.W #$000B                                                         ;8FE5D4;
    TAX                                                                  ;8FE5D7;

  .loop:
    LDA.W $0000,X                                                        ;8FE5D8;
    STA.W EventPointer                                                   ;8FE5DB;
    INX                                                                  ;8FE5DE;
    INX                                                                  ;8FE5DF;
    PEA.W .loop-1                                                        ;8FE5E0;
    JMP.W (EventPointer)                                                 ;8FE5E3;


;;; $E5E6: Use state pointer [X] ;;;
Use_StatePointer_inX:
; Room state check: default
    STX.W RoomStatePointer                                               ;8FE5E6;
    PLA                                                                  ;8FE5E9;
    RTL                                                                  ;8FE5EA;


if !FEATURE_KEEP_UNREFERENCED
;;; $E5EB: Unused. Room state check: door ;;;
UNUSED_RoomStateCheck_Door_8FE5EB:
    LDA.W $0000,X                                                        ;8FE5EB;
    CMP.W DoorPointer                                                    ;8FE5EE;
    BNE +                                                                ;8FE5F1;
    LDA.W $0002,X                                                        ;8FE5F3;
    TAX                                                                  ;8FE5F6;
    JMP.W Use_StatePointer_inX                                           ;8FE5F7;

+   INX                                                                  ;8FE5FA;
    INX                                                                  ;8FE5FB;
    INX                                                                  ;8FE5FC;
    INX                                                                  ;8FE5FD;
    RTS                                                                  ;8FE5FE;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E5FF: Room state check: main area boss is dead ;;;
RoomStateCheck_MainAreaBossIsDead:
    LDA.W #$0001                                                         ;8FE5FF;
    JSL.L CheckIfBossBitsForCurrentAreaMatchAnyBitsInA                   ;8FE602;
    BCC +                                                                ;8FE606;
    LDA.W $0000,X                                                        ;8FE608;
    TAX                                                                  ;8FE60B;
    JMP.W Use_StatePointer_inX                                           ;8FE60C;

+   INX                                                                  ;8FE60F;
    INX                                                                  ;8FE610;
    RTS                                                                  ;8FE611;


;;; $E612: Room state check: event has been set ;;;
RoomStateCheck_EventHasBeenSet:
    LDA.W $0000,X                                                        ;8FE612;
    AND.W #$00FF                                                         ;8FE615;
    JSL.L CheckIfEvent_inA_HasHappened                                   ;8FE618;
    BCC +                                                                ;8FE61C;
    LDA.W $0001,X                                                        ;8FE61E;
    TAX                                                                  ;8FE621;
    JMP.W Use_StatePointer_inX                                           ;8FE622;

+   INX                                                                  ;8FE625;
    INX                                                                  ;8FE626;
    INX                                                                  ;8FE627;
    RTS                                                                  ;8FE628;


;;; $E629: Room state check: boss is dead ;;;
RoomStateCheck_BossIsDead:
    LDA.W $0000,X                                                        ;8FE629;
    AND.W #$00FF                                                         ;8FE62C;
    JSL.L CheckIfBossBitsForCurrentAreaMatchAnyBitsInA                   ;8FE62F;
    BCC +                                                                ;8FE633;
    LDA.W $0001,X                                                        ;8FE635;
    TAX                                                                  ;8FE638;
    JMP.W Use_StatePointer_inX                                           ;8FE639;

+   INX                                                                  ;8FE63C;
    INX                                                                  ;8FE63D;
    INX                                                                  ;8FE63E;
    RTS                                                                  ;8FE63F;


if !FEATURE_KEEP_UNREFERENCED
;;; $E640: Unused. Room state check: morphball ;;;
UNUSED_RoomStateCheck_Morphball_8FE640:
    LDA.W CollectedItems                                                 ;8FE640;
    AND.W #$0004                                                         ;8FE643;
    BEQ +                                                                ;8FE646;
    LDA.W $0000,X                                                        ;8FE648;
    TAX                                                                  ;8FE64B;
    JMP.W Use_StatePointer_inX                                           ;8FE64C;

+   INX                                                                  ;8FE64F;
    INX                                                                  ;8FE650;
    RTS                                                                  ;8FE651;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E652: Room state check: morphball and missiles ;;;
RoomStateCheck_MorphballAndMissiles:
    LDA.W CollectedItems                                                 ;8FE652;
    BIT.W #$0004                                                         ;8FE655;
    BEQ +                                                                ;8FE658;
    LDA.W MaxMissiles                                                    ;8FE65A;
    BEQ +                                                                ;8FE65D;
    LDA.W $0000,X                                                        ;8FE65F;
    TAX                                                                  ;8FE662;
    JMP.W Use_StatePointer_inX                                           ;8FE663;

+   INX                                                                  ;8FE666;
    INX                                                                  ;8FE667;
    RTS                                                                  ;8FE668;


;;; $E669: Room state check: power bombs ;;;
RoomStateCheck_PowerBombs:
    LDA.W MaxPowerBombs                                                  ;8FE669;
    BEQ +                                                                ;8FE66C;
    LDA.W $0000,X                                                        ;8FE66E;
    TAX                                                                  ;8FE671;
    JMP.W Use_StatePointer_inX                                           ;8FE672;

+   INX                                                                  ;8FE675;
    INX                                                                  ;8FE676;
    RTS                                                                  ;8FE677;


if !FEATURE_KEEP_UNREFERENCED
;;; $E678: Unused. Room state check: speed booster ;;;
UNUSED_RoomStateCheck_SpeedBooster_8FE678:
    LDA.W CollectedItems                                                 ;8FE678;
    AND.W #$2000                                                         ;8FE67B;
    BEQ +                                                                ;8FE67E;
    LDA.W $0000,X                                                        ;8FE680;
    TAX                                                                  ;8FE683;
    JMP.W Use_StatePointer_inX                                           ;8FE684;

+   INX                                                                  ;8FE687;
    INX                                                                  ;8FE688;
    RTS                                                                  ;8FE689;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E68A: Door closing PLMs ;;;
Door_Closing_PLMs:
; Spawned by Spawn_Door_Closing_PLM during door transition
    dw $0000                                                             ;8FE68A; 0: Non-closing door facing right
    dw $0000                                                             ;8FE68C; 1: Non-closing door facing left
    dw $0000                                                             ;8FE68E; 2: Non-closing door facing down
    dw $0000                                                             ;8FE690; 3: Non-closing door facing up
    dw PLMEntries_blueDoorClosingFacingRight                             ;8FE692; 4: Blue door closing facing right
    dw PLMEntries_blueDoorClosingFacingLeft                              ;8FE694; 5: Blue door closing facing left
    dw PLMEntries_blueDoorClosingFacingDown                              ;8FE696; 6: Blue door closing facing down
    dw PLMEntries_blueDoorClosingFacingUp                                ;8FE698; 7: Blue door closing facing up
    dw PLMEntries_gateThatClosesInEscapeRoom1_PLM                        ;8FE69A; 8: Gate that closes during escape in room after Mother Brain
    dw PLMEntries_gateThatClosesInEscapeRoom1_PLM                        ;8FE69C; 9: Gate that closes during escape in room after Mother Brain
    dw PLMEntries_gateThatClosesInEscapeRoom1_PLM                        ;8FE69E; Ah: Gate that closes during escape in room after Mother Brain
    dw PLMEntries_gateThatClosesInEscapeRoom1_PLM                        ;8FE6A0; Bh: Gate that closes during escape in room after Mother Brain

Tileset_Table_0_UpperCrateria:
; 0: Upper Crateria
    dl TileTables_0_1_UpperCrateria                                      ;8FE6A2; Tile table pointer
    dl Tiles_0_1_UpperCrateria                                           ;8FE6A5; Tiles pointer
    dl Palettes_0_UpperCrateria                                          ;8FE6A8; Palette pointer

Tileset_Table_1_RedCrateria:
; 1: Red Crateria
    dl TileTables_0_1_UpperCrateria                                      ;8FE6AB; Tile table pointer
    dl Tiles_0_1_UpperCrateria                                           ;8FE6AE; Tiles pointer
    dl Palettes_1_RedCrateria                                            ;8FE6B1; Palette pointer

Tileset_Table_2_LowerCrateria:
; 2: Lower Crateria
    dl TileTables_2_3_LowerCrateria                                      ;8FE6B4; Tile table pointer
    dl Tiles_2_3_LowerCrateria                                           ;8FE6B7; Tiles pointer
    dl Palettes_2_LowerCrateria                                          ;8FE6BA; Palette pointer

Tileset_Table_3_OldTourian:
; 3: Old Tourian
    dl TileTables_2_3_LowerCrateria                                      ;8FE6BD; Tile table pointer
    dl Tiles_2_3_LowerCrateria                                           ;8FE6C0; Tiles pointer
    dl Palettes_3_OldTourian                                             ;8FE6C3; Palette pointer

Tileset_Table_4_WreckedShip_PowerOn:
; 4: Wrecked Ship - power on
    dl TileTables_4_5_WreckedShip                                        ;8FE6C6; Tile table pointer
    dl Tiles_4_5_WreckedShip                                             ;8FE6C9; Tiles pointer
    dl Palettes_4_WreckedShip_PowerOn                                    ;8FE6CC; Palette pointer

Tileset_Table_5_WreckedShip_PowerOff:
; 5: Wrecked Ship - power off
    dl TileTables_4_5_WreckedShip                                        ;8FE6CF; Tile table pointer
    dl Tiles_4_5_WreckedShip                                             ;8FE6D2; Tiles pointer
    dl Palettes_5_WreckedShip_PowerOff                                   ;8FE6D5; Palette pointer

Tileset_Table_6_GreenBlueBrinstar:
; 6: Green/blue Brinstar
    dl TileTables_6_GreenBlueBrinstar                                    ;8FE6D8; Tile table pointer
    dl Tiles_6_GreenBlueBrinstar                                         ;8FE6DB; Tiles pointer
    dl Palettes_6_GreenBlueBrinstar                                      ;8FE6DE; Palette pointer

Tileset_Table_7_RedBrinstar_Kraid:
; 7: Red Brinstar / Kraid's lair
    dl TileTables_7_8_RedBrinstar_Kraid_StatuesHall                      ;8FE6E1; Tile table pointer
    dl Tiles_7_8_RedBrinstar_Kraid_StatuesHall                           ;8FE6E4; Tiles pointer
    dl Palettes_7_RedBrinstar_Kraid                                      ;8FE6E7; Palette pointer

Tileset_Table_8_StatuesHall:
; 8: Pre Tourian entrance corridor
    dl TileTables_7_8_RedBrinstar_Kraid_StatuesHall                      ;8FE6EA; Tile table pointer
    dl Tiles_7_8_RedBrinstar_Kraid_StatuesHall                           ;8FE6ED; Tiles pointer
    dl Palettes_8_StatuesHall                                            ;8FE6F0; Palette pointer

Tileset_Table_9_HeatedNorfair:
; 9: Heated Norfair
    dl TileTables_9_A_Norfair                                            ;8FE6F3; Tile table pointer
    dl Tiles_9_A_Norfair                                                 ;8FE6F6; Tiles pointer
    dl Palettes_9_HeatedNorfair                                          ;8FE6F9; Palette pointer

Tileset_Table_A_UnheatedNorfair:
; Ah: Unheated Norfair
    dl TileTables_9_A_Norfair                                            ;8FE6FC; Tile table pointer
    dl Tiles_9_A_Norfair                                                 ;8FE6FF; Tiles pointer
    dl Palettes_A_UnheatedNorfair                                        ;8FE702; Palette pointer

Tileset_Table_B_SandlessMaridia:
; Bh: Sandless Maridia
    dl TileTables_B_SandlessMaridia                                      ;8FE705; Tile table pointer
    dl Tiles_B_SandlessMaridia                                           ;8FE708; Tiles pointer
    dl Palettes_B_SandlessMaridia                                        ;8FE70B; Palette pointer

Tileset_Table_C_SandyMaridia:
; Ch: Sandy Maridia
    dl TileTables_C_SandyMaridia                                         ;8FE70E; Tile table pointer
    dl Tiles_C_SandyMaridia                                              ;8FE711; Tiles pointer
    dl Palettes_C_SandyMaridia                                           ;8FE714; Palette pointer

Tileset_Table_D_Tourian:
; Dh: Tourian
    dl TileTables_D_E_Tourian                                            ;8FE717; Tile table pointer
    dl Tiles_D_E_Tourian                                                 ;8FE71A; Tiles pointer
    dl Palettes_D_Tourian                                                ;8FE71D; Palette pointer

Tileset_Table_E_MotherBrain:
; Eh: Mother Brain's room
    dl TileTables_D_E_Tourian                                            ;8FE720; Tile table pointer
    dl Tiles_D_E_Tourian                                                 ;8FE723; Tiles pointer
    dl Palettes_E_MotherBrain                                            ;8FE726; Palette pointer

Tileset_Table_F_BlueCeres:
; Fh: Blue Ceres
    dl TileTables_F_10_11_12_13_14_Ceres                                 ;8FE729; Tile table pointer
    dl Tiles_F_10_Ceres                                                  ;8FE72C; Tiles pointer
    dl Palettes_F_11_13_BlueCeres                                        ;8FE72F; Palette pointer

Tileset_Table_10_WhiteCeres:
; 10h: White Ceres
    dl TileTables_F_10_11_12_13_14_Ceres                                 ;8FE732; Tile table pointer
    dl Tiles_F_10_Ceres                                                  ;8FE735; Tiles pointer
    dl Palettes_10_12_14_WhiteCeres                                      ;8FE738; Palette pointer

Tileset_Table_11_BlueCeresElevator:
; 11h: Blue Ceres elevator
    dl TileTables_F_10_11_12_13_14_Ceres                                 ;8FE73B; Tile table pointer
    dl Tiles_11_12_CeresElevator                                         ;8FE73E; Tiles pointer
    dl Palettes_F_11_13_BlueCeres                                        ;8FE741; Palette pointer

Tileset_Table_12_WhiteCeresElevator:
; 12h: White Ceres elevator
    dl TileTables_F_10_11_12_13_14_Ceres                                 ;8FE744; Tile table pointer
    dl Tiles_11_12_CeresElevator                                         ;8FE747; Tiles pointer
    dl Palettes_10_12_14_WhiteCeres                                      ;8FE74A; Palette pointer

Tileset_Table_13_BlueCeresRidley:
; 13h: Blue Ceres Ridley's room
    dl TileTables_F_10_11_12_13_14_Ceres                                 ;8FE74D; Tile table pointer
    dl Tiles_13_14_CeresRidley                                           ;8FE750; Tiles pointer
    dl Palettes_F_11_13_BlueCeres                                        ;8FE753; Palette pointer

Tileset_Table_14_WhiteCeresRidley:
; 14h: White Ceres Ridley's room
    dl TileTables_F_10_11_12_13_14_Ceres                                 ;8FE756; Tile table pointer
    dl Tiles_13_14_CeresRidley                                           ;8FE759; Tiles pointer
    dl Palettes_10_12_14_WhiteCeres                                      ;8FE75C; Palette pointer

Tileset_Table_15_Map_Statues:
; 15h: Map room / Tourian entrance
    dl TileTables_15_16_17_18_19_UtilityRoom_Statues                     ;8FE75F; Tile table pointer
    dl Tiles_15_16_17_18_19_UtilityRoom_Statues                          ;8FE762; Tiles pointer
    dl Palettes_Map_Statues                                              ;8FE765; Palette pointer

Tileset_Table_16_WreckedShipMap_PowerOff:
; 16h: Wrecked Ship map room - power off
    dl TileTables_15_16_17_18_19_UtilityRoom_Statues                     ;8FE768; Tile table pointer
    dl Tiles_15_16_17_18_19_UtilityRoom_Statues                          ;8FE76B; Tiles pointer
    dl Palettes_16_WreckedShipMap_PowerOff                               ;8FE76E; Palette pointer

Tileset_Table_17_BlueRefill:
; 17h: Blue refill room
    dl TileTables_15_16_17_18_19_UtilityRoom_Statues                     ;8FE771; Tile table pointer
    dl Tiles_15_16_17_18_19_UtilityRoom_Statues                          ;8FE774; Tiles pointer
    dl Palettes_17_BlueRefill                                            ;8FE777; Palette pointer

Tileset_Table_18_YellowRefill:
; 18h: Yellow refill room
    dl TileTables_15_16_17_18_19_UtilityRoom_Statues                     ;8FE77A; Tile table pointer
    dl Tiles_15_16_17_18_19_UtilityRoom_Statues                          ;8FE77D; Tiles pointer
    dl Palettes_18_YellowRefill                                          ;8FE780; Palette pointer

Tileset_Table_19_SaveStation:
; 19h: Save room
    dl TileTables_15_16_17_18_19_UtilityRoom_Statues                     ;8FE783; Tile table pointer
    dl Tiles_15_16_17_18_19_UtilityRoom_Statues                          ;8FE786; Tiles pointer
    dl Palettes_19_SaveStation                                           ;8FE789; Palette pointer

Tileset_Table_1A_Kraid:
; 1Ah: Kraid's room
    dl TileTables_1A_Kraid                                               ;8FE78C; Tile table pointer
    dl Tiles_1A_Kraid                                                    ;8FE78F; Tiles pointer
    dl Palettes_1A_Kraid                                                 ;8FE792; Palette pointer

Tileset_Table_1B_Crocomire:
; 1Bh: Crocomire's room
    dl TileTables_1B_Crocomire                                           ;8FE795; Tile table pointer
    dl Tiles_1B_Crocomire                                                ;8FE798; Tiles pointer
    dl Palettes_1B_Crocomire                                             ;8FE79B; Palette pointer

Tileset_Table_1C_Draygon:
; 1Ch: Draygon's room
    dl TileTables_1C_Draygon                                             ;8FE79E; Tile table pointer
    dl Tiles_1C_Draygon                                                  ;8FE7A1; Tiles pointer
    dl Palettes_1C_Draygon                                               ;8FE7A4; Palette pointer


;;; $E7A7: Tileset pointers ;;;
Tileset_Pointers:
    dw Tileset_Table_0_UpperCrateria                                     ;8FE7A7;
    dw Tileset_Table_1_RedCrateria                                       ;8FE7A9;
    dw Tileset_Table_2_LowerCrateria                                     ;8FE7AB;
    dw Tileset_Table_3_OldTourian                                        ;8FE7AD;
    dw Tileset_Table_4_WreckedShip_PowerOn                               ;8FE7AF;
    dw Tileset_Table_5_WreckedShip_PowerOff                              ;8FE7B1;
    dw Tileset_Table_6_GreenBlueBrinstar                                 ;8FE7B3;
    dw Tileset_Table_7_RedBrinstar_Kraid                                 ;8FE7B5;
    dw Tileset_Table_8_StatuesHall                                       ;8FE7B7;
    dw Tileset_Table_9_HeatedNorfair                                     ;8FE7B9;
    dw Tileset_Table_A_UnheatedNorfair                                   ;8FE7BB;
    dw Tileset_Table_B_SandlessMaridia                                   ;8FE7BD;
    dw Tileset_Table_C_SandyMaridia                                      ;8FE7BF;
    dw Tileset_Table_D_Tourian                                           ;8FE7C1;
    dw Tileset_Table_E_MotherBrain                                       ;8FE7C3;
    dw Tileset_Table_F_BlueCeres                                         ;8FE7C5;
    dw Tileset_Table_10_WhiteCeres                                       ;8FE7C7;
    dw Tileset_Table_11_BlueCeresElevator                                ;8FE7C9;
    dw Tileset_Table_12_WhiteCeresElevator                               ;8FE7CB;
    dw Tileset_Table_13_BlueCeresRidley                                  ;8FE7CD;
    dw Tileset_Table_14_WhiteCeresRidley                                 ;8FE7CF;
    dw Tileset_Table_15_Map_Statues                                      ;8FE7D1;
    dw Tileset_Table_16_WreckedShipMap_PowerOff                          ;8FE7D3;
    dw Tileset_Table_17_BlueRefill                                       ;8FE7D5;
    dw Tileset_Table_18_YellowRefill                                     ;8FE7D7;
    dw Tileset_Table_19_SaveStation                                      ;8FE7D9;
    dw Tileset_Table_1A_Kraid                                            ;8FE7DB;
    dw Tileset_Table_1B_Crocomire                                        ;8FE7DD;
    dw Tileset_Table_1C_Draygon                                          ;8FE7DF;


;;; $E7E1: Music pointers ;;;
Music_Pointers:
    dl SPC_Engine                                                        ;8FE7E1; 0   - SPC engine
    dl Music_TitleSequence                                               ;8FE7E4; 3   - Title sequence
    dl Music_EmptyCrateria                                               ;8FE7E7; 6   - Empty Crateria
    dl Music_LowerCrateria                                               ;8FE7EA; 9   - Lower Crateria
    dl Music_UpperCrateria                                               ;8FE7ED; Ch  - Upper Crateria
    dl Music_GreenBrinstar                                               ;8FE7F0; Fh  - Green Brinstar
    dl Music_RedBrinstar                                                 ;8FE7F3; 12h - Red Brinstar
    dl Music_UpperNorfair                                                ;8FE7F6; 15h - Upper Norfair
    dl Music_LowerNorfair                                                ;8FE7F9; 18h - Lower Norfair
    dl Music_Maridia                                                     ;8FE7FC; 1Bh - Maridia
    dl Music_Tourian                                                     ;8FE7FF; 1Eh - Tourian
    dl Music_MotherBrain                                                 ;8FE802; 21h - Mother Brain
    dl Music_BossFight1                                                  ;8FE805; 24h - Boss fight 1
    dl Music_BossFight2                                                  ;8FE808; 27h - Boss fight 2
    dl Music_MiniBossFight                                               ;8FE80B; 2Ah - Miniboss fight
    dl Music_Ceres                                                       ;8FE80E; 2Dh - Ceres
    dl Music_WreckedShip                                                 ;8FE811; 30h - Wrecked Ship
    dl Music_ZebesExplosion                                              ;8FE814; 33h - Zebes boom
    dl Music_Intro                                                       ;8FE817; 36h - Intro
    dl Music_Death                                                       ;8FE81A; 39h - Death
    dl Music_Credits                                                     ;8FE81D; 3Ch - Credits
    dl Music_TheLastMetroidIsInCaptivity                                 ;8FE820; 3Fh - "The last Metroid is in captivity"
    dl Music_TheGalaxyIsAtPeace                                          ;8FE823; 42h - "The galaxy is at peace"
    dl Music_BabyMetroid_BossFight2                                      ;8FE826; 45h - Shitroid (same as boss fight 2)
    dl Music_SamusTheme_UpperCrateria                                    ;8FE829; 48h - Samus theme (same as upper Crateria)


;;; $E82C: Debug room ;;;
RoomHeader_Debug:
; Room $E82C: Header                                                     ;8FE82C;
    %RoomHeader(\
    %room(0),
    %area(7),
    %positions(0, 0),
    %dimensions(6, 2),
    %scrollers($70, $A0),
    %CRE(0),
    %doorList(RoomDoors_Debug))
    %stateChecks(0)

RoomState_Debug:                                                         ;8FE839;
; Room $E82C, state $E839: Header
    %StateHeader(\
    %levelData(LevelData_DebugRoom),
    %tileset($0B),
    %music(0, 0),
    %FX(FXHeader_Debug_MotherBrain_State2),
    %enemyPop(EnemyPopulations_Debug),
    %enemySet(EnemySets_Debug),
    %layer2Scrolls($C1, $C1),
    %scrollPointer(1),
    %specialXray(0),
    %mainASM(0),
    %PLMPop(RoomPLM_Debug),
    %libraryBG(LibBG_WreckedShip_4_5_EntranceHall),
    %setupASM(0))

RoomDoors_Debug:
; Room $E82C: Door list
    dw UNUSED_Door_Debug_0_83ABC4                                        ;8FE853;
    dw UNUSED_Door_Debug_1_83ABCF                                        ;8FE855;
    dw UNUSED_Door_Debug_2_83ABDA                                        ;8FE857;
    dw UNUSED_Door_Debug_3_83ABE5                                        ;8FE859;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_LibraryBackground_8FE85B:                                         ;8FE85B;
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
    db $00,$00                                                           ;8FE87F;

if !FEATURE_KEEP_UNREFERENCED
;;; $E881: Unused. PLM metadata - Wrecked Ship / Maridia / Tourian (/ Ceres?) ;;;
UNUSED_UnknownUnreferenced_8FE881:                                       ;8FE881;
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
    PHP                                                                  ;8FE88F;
    PHB                                                                  ;8FE890;
    REP #$30                                                             ;8FE891;
    LDX.W RoomStatePointer                                               ;8FE893;
    LDA.W $0018,X                                                        ;8FE896;
    BEQ .return                                                          ;8FE899;
    PHK                                                                  ;8FE89B;
    PLB                                                                  ;8FE89C;
    JSR.W ($0018,X)                                                      ;8FE89D;

  .return:
    PLB                                                                  ;8FE8A0;
    PLP                                                                  ;8FE8A1;
    RTL                                                                  ;8FE8A2;


;;; $E8A3: Execute door ASM ;;;
Execute_Door_ASM:
    PHP                                                                  ;8FE8A3;
    PHB                                                                  ;8FE8A4;
    REP #$30                                                             ;8FE8A5;
    LDX.W DoorPointer                                                    ;8FE8A7;
    LDA.L DoorHeaders_doorASM,X                                          ;8FE8AA;
    BEQ .return                                                          ;8FE8AE;
    STA.B DP_Temp12                                                      ;8FE8B0;
    PHK                                                                  ;8FE8B2;
    PLB                                                                  ;8FE8B3;
    PEA.W .return-1                                                      ;8FE8B4;
    JMP.W (DP_Temp12)                                                    ;8FE8B7;

  .return:
    PLB                                                                  ;8FE8BA;
    PLP                                                                  ;8FE8BB;
    RTL                                                                  ;8FE8BC;


;;; $E8BD: Execute room main ASM ;;;
Execute_Room_Main_ASM:
    LDX.W RoomMainASMPointer                                             ;8FE8BD;
    BEQ .return                                                          ;8FE8C0;
    PHB                                                                  ;8FE8C2;
    PHK                                                                  ;8FE8C3;
    PLB                                                                  ;8FE8C4;
    LDX.W #$0000                                                         ;8FE8C5;
    JSR.W (RoomMainASMPointer,X)                                         ;8FE8C8;
    PLB                                                                  ;8FE8CB;

  .return:
    RTL                                                                  ;8FE8CC;


;;; $E8CD: Main ASM: Crocomire's room shaking ;;;
MainASM_CrocomiresRoomShaking:
; Room $A98D. Crocomire's room
    LDA.W Enemy.properties                                               ;8FE8CD;
    BIT.W #$0200                                                         ;8FE8D0;
    BNE .return                                                          ;8FE8D3;
    LDA.W Enemy.var0                                                     ;8FE8D5;
    CMP.W #$0040                                                         ;8FE8D8;
    BEQ .behindWallRumbling                                              ;8FE8DB;
    LDA.W Enemy.var1                                                     ;8FE8DD;
    BIT.W #$0400                                                         ;8FE8E0;
    BEQ .branch                                                          ;8FE8E3;
    LDA.W Enemy[1].var3                                                  ;8FE8E5;
    DEC                                                                  ;8FE8E8;
    STA.W Enemy[1].var3                                                  ;8FE8E9;
    CMP.W #$FFF9                                                         ;8FE8EC;
    BMI +                                                                ;8FE8EF;
    LDA.W Enemy[1].var3                                                  ;8FE8F1;
    BRA .scroll                                                          ;8FE8F4;

+   LDA.W #$0007                                                         ;8FE8F6;
    CLC                                                                  ;8FE8F9;
    ADC.W Enemy[1].var3                                                  ;8FE8FA;
    ASL                                                                  ;8FE8FD;
    STA.B DP_Temp12                                                      ;8FE8FE;
    LDA.W Enemy[1].var3                                                  ;8FE900;
    SEC                                                                  ;8FE903;
    SBC.B DP_Temp12                                                      ;8FE904;

  .scroll:
    STA.B DP_Temp12                                                      ;8FE906;
    CLC                                                                  ;8FE908;
    ADC.B DP_BG1YScroll                                                  ;8FE909;
    STA.B DP_BG1YScroll                                                  ;8FE90B;
    LDA.W #$FFD0                                                         ;8FE90D;
    CLC                                                                  ;8FE910;
    ADC.B DP_Temp12                                                      ;8FE911;
    STA.B DP_BG2YScroll                                                  ;8FE913;

  .return:
    RTS                                                                  ;8FE915;

  .branch:
    LDA.W Enemy.var2                                                     ;8FE916;
    CMP.W #$0022                                                         ;8FE919;
    BNE .return                                                          ;8FE91C;
    LDA.W Enemy.var3                                                     ;8FE91E;
    BEQ .return                                                          ;8FE921;
    DEC                                                                  ;8FE923;
    STA.W Enemy.var3                                                     ;8FE924;
    BIT.W #$0001                                                         ;8FE927;
    BNE +                                                                ;8FE92A;
    LDA.W Layer1XPosition                                                ;8FE92C;
    CLC                                                                  ;8FE92F;
    ADC.W #$0004                                                         ;8FE930;
    STA.W Layer1XPosition                                                ;8FE933;
    RTS                                                                  ;8FE936;

+   LDA.W Layer1XPosition                                                ;8FE937;
    SEC                                                                  ;8FE93A;
    SBC.W #$0004                                                         ;8FE93B;
    STA.W Layer1XPosition                                                ;8FE93E;
    RTS                                                                  ;8FE941;

  .behindWallRumbling:
    LDA.W Layer1YPosition                                                ;8FE942;
    CLC                                                                  ;8FE945;
    ADC.W BG1YOffset                                                     ;8FE946;
    CLC                                                                  ;8FE949;
    ADC.W Enemy[1].var3                                                  ;8FE94A;
    STA.B DP_BG1YScroll                                                  ;8FE94D;
    RTS                                                                  ;8FE94F;


;;; $E950: Main ASM: Ridley's room shaking ;;;
MainASM_RidleysRoomShaking:
; Room $B32E. Ridley's room
; Scrolls background in circle when Ridley's tail explosion sets Enemy[4].var0 (when? Doesn't seem to ever happen)
; It's actually probably a good thing if this never happens, messing with the BG scroll registers can break scrolling
    LDA.W Enemy[4].var0                                                  ;8FE950;
    BEQ .return                                                          ;8FE953;
    DEC                                                                  ;8FE955;
    STA.W Enemy[4].var0                                                  ;8FE956;
    ASL                                                                  ;8FE959;
    TAX                                                                  ;8FE95A;
    LDA.B DP_BG1XScroll                                                  ;8FE95B;
    ADC.W .Xspeeds,X                                                     ;8FE95D;
    STA.B DP_BG1XScroll                                                  ;8FE960;
    LDA.B DP_BG2XScroll                                                  ;8FE962;
    CLC                                                                  ;8FE964;
    ADC.W .Xspeeds,X                                                     ;8FE965;
    STA.B DP_BG2XScroll                                                  ;8FE968;
    LDA.B DP_BG1YScroll                                                  ;8FE96A;
    CLC                                                                  ;8FE96C;
    ADC.W .Yspeeds,X                                                     ;8FE96D;
    STA.B DP_BG1YScroll                                                  ;8FE970;
    LDA.B DP_BG2YScroll                                                  ;8FE972;
    CLC                                                                  ;8FE974;
    ADC.W .Yspeeds,X                                                     ;8FE975;
    STA.B DP_BG2YScroll                                                  ;8FE978;

  .return:
    RTS                                                                  ;8FE97A;

  .Xspeeds:
; X scroll speeds
    dw $0000,$0002,$0002,$0002,$0000,$FFFE,$FFFE,$FFFE                   ;8FE97B;

  .Yspeeds:
; Y scroll speeds
    dw $FFFE,$FFFE,$0000,$0002,$0002,$0002,$0000,$FFFE                   ;8FE98B;


Freespace_Bank8F_E99B:                                                   ;8FE99B;
; $1665 bytes
