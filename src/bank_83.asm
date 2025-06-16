
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
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(6),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_Parlor_State2:
    %FXHeader(\
    %door(0),
    %baseY($04E8),
    %targetY($0010),
    %velocity($FF98),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX($42),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_Climb_State2:
    %FXHeader(\
    %door(0),
    %baseY($08E8),
    %targetY($0010),
    %velocity($FF98),
    %timer($28),
    %FXType(4),
    %layerBlendConfig(2, $1e),
    %liquidOptions(1),
    %paletteFX($38),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_BombTorizo_State2:
    %FXHeader(\
    %door(0),
    %baseY($00F0),
    %targetY($00B8),
    %velocity($FFF0),
    %timer($30),
    %FXType(4),
    %layerBlendConfig(2, $1e),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_Flyway_State2:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_Parlor_State1:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_Climb_State1:
    %FXHeader(\
    %door(Door_TourianEscape4_1),
    %baseY($0908),
    %targetY(0),
    %velocity($FF80),
    %timer($20),
    %FXType(2),
    %layerBlendConfig(2, $1E),
    %liquidOptions($0B),
    %paletteFX($1F),
    %animTiles(1),
    %paletteBlend(2))

FXHeader_Climb_State1_Part2:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_Pit_State1:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_ElevToBlueBrinstar_State1:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_FinalMissileBombway_State1:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_FinalMissile_State1:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_LandingSite_State0_1:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType($0A),
    %layerBlendConfig(2, $0E),
    %liquidOptions(0),
    %paletteFX(1),
    %animTiles(0),
    %paletteBlend($22))

FXHeader_LandingSite_State2:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_GauntletEntrance_State0_1:
    %FXHeader(\
    %door(0),
    %baseY($00C8),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(4),
    %layerBlendConfig(2, $1E),
    %liquidOptions($42),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_Parlor_State0:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig($28, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend($62))

FXHeader_CrateriaPowerBombs:
    %FXHeader(\
    %door(0),
    %baseY($00C0),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(4),
    %layerBlendConfig(2, $1E),
    %liquidOptions($42),
    %paletteFX(0),
    %animTiles(2),
    %paletteBlend($48))

FXHeader_CrateriaSave:
    dw $FFFF

FXHeader_WestOcean:
    %FXHeader(\
    %door(0),
    %baseY($04F0),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $18),
    %liquidOptions(1),
    %paletteFX(0),
    %animTiles(6),
    %paletteBlend($48))

FXHeader_BowlingAlleyPath:
    %FXHeader(\
    %door(0),
    %baseY($00B0),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $18),
    %liquidOptions($83),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend($48))

FXHeader_CrateriaKihunters:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_ForgottenHighwayElev:
    dw $FFFF

FXHeader_EastOcean:
    %FXHeader(\
    %door(0),
    %baseY($04F0),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $18),
    %liquidOptions(1),
    %paletteFX(0),
    %animTiles(4),
    %paletteBlend($48))

FXHeader_ForgottenHighwayKagos:
    dw $FFFF

FXHeader_CrabMaze:
    %FXHeader(\
    %door(0),
    %baseY($01B0),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $18),
    %liquidOptions(3),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend($48))

FXHeader_ForgottenHighwayElbow:
    dw $FFFF

FXHeader_CrateriaTube:
    dw $FFFF

FXHeader_Moat:
    %FXHeader(\
    %door(0),
    %baseY($00B0),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $18),
    %liquidOptions(1),
    %paletteFX(0),
    %animTiles(6),
    %paletteBlend($48))

FXHeader_RedBrinstarElev:
    dw $FFFF

FXHeader_GauntletETank:
    %FXHeader(\
    %door(0),
    %baseY($00C8),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(4),
    %layerBlendConfig(2, $1E),
    %liquidOptions($42),
    %paletteFX(0),
    %animTiles(2),
    %paletteBlend(0))

FXHeader_PreBowling:
    dw $FFFF

FXHeader_Climb_State0:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType($0C),
    %layerBlendConfig(2, $30),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend($62))

FXHeader_Pit_State0:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType($0C),
    %layerBlendConfig(2, $30),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend($62))

FXHeader_ElevToBlueBrinstar_State0:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig($2A, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_BombTorizo_State0_1:
    dw $FFFF

FXHeader_Flyway_State0_1:
    dw $FFFF

FXHeader_VariousRooms_8381C2:
    dw $FFFF

FXHeader_CrateriaSuper:
    %FXHeader(\
    %door(0),
    %baseY($07E0),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(4),
    %layerBlendConfig(2, $1E),
    %liquidOptions($40),
    %paletteFX(0),
    %animTiles(2),
    %paletteBlend($48))

FXHeader_FinalMissileBombway_State0:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig($28, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend($62))

FXHeader_FinalMissile_State0:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig($28, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend($62))

FXHeader_VariousRooms_8381F4:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_GreenBrinstarMainShaft:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(1),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_SporeSpawnSuper:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(8),
    %layerBlendConfig(2, $0A),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_BrinstarPreMap:
    dw $FFFF

FXHeader_EarlySupers:
    dw $FFFF

FXHeader_BrinstarReserveTank:
    dw $FFFF

FXHeader_GreenBrinstarMap:
    dw $FFFF

FXHeader_GreenBrinstarFirefleas:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType($24),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_GreenBrinstarMissileRefill:
    dw $FFFF

FXHeader_Dachora:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(8),
    %layerBlendConfig(2, $0A),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_BigPink:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(8),
    %layerBlendConfig(2, $0A),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(1),
    %paletteBlend(0))

FXHeader_SporeSpawnKihunters:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(1),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_SporeSpawn_State0_1:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(8),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_PinkBrinstarPowerBombs:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(2),
    %paletteBlend(0))

FXHeader_GreenHillZone:
    dw $FFFF

FXHeader_MorphBall_State0:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig($2A, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_ConstructionZone_State0:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig($2A, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_BlueBrinstarETank_State0:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig($2A, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_NoobBridge:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(1),
    %animTiles(2),
    %paletteBlend(0))

FXHeader_GreenBrinstarBeetoms:
    dw $FFFF

FXHeader_EtecoonETank:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(1),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_EtecoonSuper:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(1),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_DachoraEnergyRefill:
    dw $FFFF

FXHeader_SporeSpawnFarming:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(8),
    %layerBlendConfig(2, $0A),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_WaterwayETank:
    %FXHeader(\
    %door(0),
    %baseY($00A8),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $18),
    %liquidOptions(3),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend($48))

FXHeader_FirstMissile:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_PinkBrinstarHoppers:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(1),
    %animTiles(3),
    %paletteBlend(0))

FXHeader_HopperETank:
    dw $FFFF

FXHeader_BigPinkSaveRoom:
    dw $FFFF

FXHeader_BlueBrinstarBoulders:
    %FXHeader(\
    %door(0),
    %baseY($00B0),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $18),
    %liquidOptions($83),
    %paletteFX(0),
    %animTiles(2),
    %paletteBlend($48))

FXHeader_BillyMays:
    dw $FFFF

FXHeader_GreenBrinstarSave:
    dw $FFFF

FXHeader_EtecoonSave:
    dw $FFFF

FXHeader_RedTower:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(6),
    %animTiles(3),
    %paletteBlend(0))

FXHeader_RedBrinstarFirefleas:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType($24),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(2),
    %paletteBlend(0))

FXHeader_XrayScope:
    dw $FFFF

FXHeader_Hellway:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(2),
    %animTiles(4),
    %paletteBlend(0))

FXHeader_Caterpillar:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(6),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_BetaPowerBomb:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(4),
    %paletteBlend(0))

FXHeader_AlphaPowerBomb:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(4),
    %paletteBlend(0))

FXHeader_SkreeBoost:
    %FXHeader(\
    %door(0),
    %baseY($00BE),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $18),
    %liquidOptions(3),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend($48))

FXHeader_BelowSpazer:
    %FXHeader(\
    %door(0),
    %baseY($01BE),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $18),
    %liquidOptions(3),
    %paletteFX(0),
    %animTiles(1),
    %paletteBlend($48))

FXHeader_Spazer:
    dw $FFFF

FXHeader_VariousRooms_8383D2:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(4),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_MiniKraid_State0_1:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(2),
    %paletteBlend(0))

FXHeader_KraidEyeDoor:
    dw $FFFF

FXHeader_Kraid_State0:
    dw $FFFF

FXHeader_Kraid_State1:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType($0C),
    %layerBlendConfig(2, $30),
    %liquidOptions(0),
    %paletteFX($80),
    %animTiles(0),
    %paletteBlend($62))

FXHeader_RedTowerRefill:
    dw $FFFF

FXHeader_KraidRefill:
    dw $FFFF

FXHeader_Statues:
    %FXHeader(\
    %door(0),
    %baseY($00B0),
    %targetY($01FF),
    %velocity(0),
    %timer(0),
    %FXType($26),
    %layerBlendConfig(2, $18),
    %liquidOptions(1),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend($48))

FXHeader_WarehouseEntrance:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig($2A, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_VariaSuit:
    dw $FFFF

FXHeader_WarehouseSave:
    dw $FFFF

FXHeader_RedBrinstarSave:
    dw $FFFF

FXHeader_IceBeamAcid:
    %FXHeader(\
    %door(0),
    %baseY($00B8),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(2),
    %layerBlendConfig(2, $1E),
    %liquidOptions($0B),
    %paletteFX($1F),
    %animTiles(2),
    %paletteBlend(2))

FXHeader_Cathedral:
    %FXHeader(\
    %door(0),
    %baseY($01B1),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(2),
    %layerBlendConfig(2, $1E),
    %liquidOptions($0B),
    %paletteFX($1F),
    %animTiles(0),
    %paletteBlend(2))

FXHeader_CathedralEntrance:
    %FXHeader(\
    %door(0),
    %baseY($01D0),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(2),
    %layerBlendConfig(2, $1E),
    %liquidOptions($0B),
    %paletteFX($1F),
    %animTiles(3),
    %paletteBlend(2))

FXHeader_BusinessCenter:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(2),
    %layerBlendConfig(2, $1E),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(2))

FXHeader_IceBeamGate:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_IceBeamTutorial:
    %FXHeader(\
    %door(0),
    %baseY($00B2),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(2),
    %layerBlendConfig(2, $1E),
    %liquidOptions($0B),
    %paletteFX($1F),
    %animTiles(0),
    %paletteBlend(2))

FXHeader_IceBeam:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(2),
    %layerBlendConfig(2, $1E),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(2))

FXHeader_IceBeamSnake:
    %FXHeader(\
    %door(0),
    %baseY($02B8),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(2),
    %layerBlendConfig(2, $1E),
    %liquidOptions(3),
    %paletteFX($1F),
    %animTiles(3),
    %paletteBlend(2))

FXHeader_CrumbleShaft:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(2),
    %layerBlendConfig(2, $1E),
    %liquidOptions(3),
    %paletteFX($1F),
    %animTiles(0),
    %paletteBlend(2))

FXHeader_CrocomireSpeedway:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(2),
    %layerBlendConfig(2, $1E),
    %liquidOptions($0B),
    %paletteFX($1F),
    %animTiles(2),
    %paletteBlend(2))

FXHeader_Crocomire_State0_1:
    %FXHeader(\
    %door(0),
    %baseY($00C6),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(4),
    %layerBlendConfig(2, $1E),
    %liquidOptions($81),
    %paletteFX(0),
    %animTiles(1),
    %paletteBlend(2))

FXHeader_HiJumpBoots:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(2),
    %layerBlendConfig(2, $1E),
    %liquidOptions(1),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(2))

FXHeader_CrocomireEscape:
    %FXHeader(\
    %door(0),
    %baseY($01B8),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(2),
    %layerBlendConfig(2, $1E),
    %liquidOptions($0B),
    %paletteFX($1F),
    %animTiles(0),
    %paletteBlend(2))

FXHeader_HiJumpETank:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(2),
    %layerBlendConfig(2, $1E),
    %liquidOptions(1),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(2))

FXHeader_PostCrocFarming:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(3),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(2))

FXHeader_PostCrocSave:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(2),
    %layerBlendConfig(2, $1E),
    %liquidOptions(1),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(2))

FXHeader_PostCrocPowerBombs:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(2),
    %layerBlendConfig(2, $1E),
    %liquidOptions(3),
    %paletteFX($1F),
    %animTiles(0),
    %paletteBlend(2))

FXHeader_PostCrocShaft:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_PostCrocMissile:
    %FXHeader(\
    %door(0),
    %baseY($00C8),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(4),
    %layerBlendConfig(2, $1E),
    %liquidOptions($41),
    %paletteFX(0),
    %animTiles(2),
    %paletteBlend(0))

FXHeader_GrappleTutorial3:
    %FXHeader(\
    %door(0),
    %baseY($00B8),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $18),
    %liquidOptions($83),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend($48))

FXHeader_PostCrocJump:
    %FXHeader(\
    %door(0),
    %baseY($02B4),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(4),
    %layerBlendConfig(2, $1E),
    %liquidOptions($80),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_GrappleTutorial2:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_GrappleTutorial1:
    %FXHeader(\
    %door(0),
    %baseY($00C0),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $18),
    %liquidOptions($83),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend($48))

FXHeader_GrappleBeam:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(3),
    %paletteBlend(0))

FXHeader_NorfairReserveTank:
    %FXHeader(\
    %door(0),
    %baseY($00C7),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(2),
    %layerBlendConfig(2, $1E),
    %liquidOptions($0B),
    %paletteFX($1F),
    %animTiles(0),
    %paletteBlend(2))

FXHeader_GreenBubblesMissiles:
    %FXHeader(\
    %door(0),
    %baseY($00C6),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(2),
    %layerBlendConfig(2, $1E),
    %liquidOptions($0B),
    %paletteFX($1F),
    %animTiles(0),
    %paletteBlend(2))

FXHeader_BubbleMountain:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(2),
    %layerBlendConfig(2, $1E),
    %liquidOptions(3),
    %paletteFX(0),
    %animTiles(2),
    %paletteBlend(2))

FXHeader_SpeedBoosterHall:
    %FXHeader(\
    %door(Door_SpeedBooster_0),
    %baseY($01DA),
    %targetY($00B0),
    %velocity(0),
    %timer($F0),
    %FXType(2),
    %layerBlendConfig(2, $1E),
    %liquidOptions($0B),
    %paletteFX($1F),
    %animTiles(2),
    %paletteBlend(2))

FXHeader_SpeedBoosterHall_Part2:
    %FXHeader(\
    %door(0),
    %baseY($01DA),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(2),
    %layerBlendConfig(2, $1E),
    %liquidOptions($0B),
    %paletteFX($1F),
    %animTiles(2),
    %paletteBlend(2))

FXHeader_SpeedBooster:
    %FXHeader(\
    %door(0),
    %baseY($00DA),
    %targetY(0),
    %velocity(0),
    %timer($20),
    %FXType(2),
    %layerBlendConfig(2, $1E),
    %liquidOptions($0B),
    %paletteFX($1F),
    %animTiles(0),
    %paletteBlend(2))

FXHeader_SingleChamber:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(2),
    %layerBlendConfig(2, $1E),
    %liquidOptions(3),
    %paletteFX($1F),
    %animTiles(2),
    %paletteBlend(2))

FXHeader_DoubleChamber:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(2),
    %layerBlendConfig(2, $1E),
    %liquidOptions(3),
    %paletteFX($1F),
    %animTiles(2),
    %paletteBlend(2))

FXHeader_WaveBeam:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(2),
    %layerBlendConfig(2, $1E),
    %liquidOptions(1),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(2))

FXHeader_SpikyPlatformsTunnel:
    %FXHeader(\
    %door(0),
    %baseY($00C0),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(2),
    %layerBlendConfig(2, $1E),
    %liquidOptions(3),
    %paletteFX($1F),
    %animTiles(2),
    %paletteBlend(2))

FXHeader_Volcano:
    %FXHeader(\
    %door(Door_KronicBoost_1),
    %baseY($02E0),
    %targetY($0260),
    %velocity($FFF6),
    %timer($40),
    %FXType(2),
    %layerBlendConfig(2, $1E),
    %liquidOptions($0B),
    %paletteFX($1F),
    %animTiles(0),
    %paletteBlend(2))

FXHeader_Volcano_Part2:
    %FXHeader(\
    %door(0),
    %baseY($0268),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(2),
    %layerBlendConfig(2, $1E),
    %liquidOptions(1),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(2))

FXHeader_KronicBoost:
    %FXHeader(\
    %door(0),
    %baseY($02D4),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(2),
    %layerBlendConfig(2, $1E),
    %liquidOptions($0B),
    %paletteFX($1F),
    %animTiles(0),
    %paletteBlend(2))

FXHeader_MagdolliteTunnel:
    %FXHeader(\
    %door(0),
    %baseY($00BE),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(2),
    %layerBlendConfig(2, $1E),
    %liquidOptions($0B),
    %paletteFX($1F),
    %animTiles(0),
    %paletteBlend(2))

FXHeader_PurpleShaft:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(2),
    %layerBlendConfig(2, $1E),
    %liquidOptions(3),
    %paletteFX($1F),
    %animTiles(3),
    %paletteBlend(2))

FXHeader_LavaDive:
    %FXHeader(\
    %door(0),
    %baseY($00D0),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(2),
    %layerBlendConfig(2, $1E),
    %liquidOptions($0B),
    %paletteFX($1F),
    %animTiles(3),
    %paletteBlend(2))

FXHeader_LowerNorfairElev:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(2),
    %layerBlendConfig(2, $1E),
    %liquidOptions(3),
    %paletteFX($1F),
    %animTiles(0),
    %paletteBlend(2))

FXHeader_UpperNorfairFarming:
    %FXHeader(\
    %door(0),
    %baseY($01C0),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(2),
    %layerBlendConfig(2, $1E),
    %liquidOptions($0B),
    %paletteFX($1F),
    %animTiles(0),
    %paletteBlend(2))

FXHeader_RisingTide:
    %FXHeader(\
    %door(Door_Cathedral_1),
    %baseY($0108),
    %targetY($00C0),
    %velocity($FFE0),
    %timer($40),
    %FXType(2),
    %layerBlendConfig(2, $1E),
    %liquidOptions($0B),
    %paletteFX($1F),
    %animTiles(0),
    %paletteBlend(2))

FXHeader_RisingTide_Part2:
    %FXHeader(\
    %door(0),
    %baseY($00C8),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(2),
    %layerBlendConfig(2, $1E),
    %liquidOptions($0B),
    %paletteFX($1F),
    %animTiles(0),
    %paletteBlend(2))

FXHeader_AcidSnakesTunnel:
    %FXHeader(\
    %door(0),
    %baseY($00C5),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(2),
    %layerBlendConfig(2, $1E),
    %liquidOptions($0B),
    %paletteFX($1F),
    %animTiles(0),
    %paletteBlend(2))

FXHeader_SpikyAcidSnakesTunnel:
    %FXHeader(\
    %door(0),
    %baseY($00C6),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(2),
    %layerBlendConfig(2, $1E),
    %liquidOptions(3),
    %paletteFX($1F),
    %animTiles(2),
    %paletteBlend(2))

FXHeader_UpperNorfairRefill:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(2),
    %layerBlendConfig(2, $1E),
    %liquidOptions(1),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(2))

FXHeader_PurpleFarming:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(2),
    %layerBlendConfig(2, $1E),
    %liquidOptions(3),
    %paletteFX($1F),
    %animTiles(0),
    %paletteBlend(2))

FXHeader_BatCave:
    %FXHeader(\
    %door(0),
    %baseY($01B4),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(2),
    %layerBlendConfig(2, $1E),
    %liquidOptions(3),
    %paletteFX($1F),
    %animTiles(0),
    %paletteBlend(2))

FXHeader_NorfairMap:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(2),
    %layerBlendConfig(2, $1E),
    %liquidOptions(1),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(2))

FXHeader_BubbleMountainSave:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(2),
    %layerBlendConfig(2, $1E),
    %liquidOptions(1),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(2))

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
    %FXHeader(\
    %door(Door_GoldenTorizo_0),
    %baseY($02D2),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(4),
    %layerBlendConfig(2, $1E),
    %liquidOptions($82),
    %paletteFX($1F),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_AcidStatue_Part2:
    %FXHeader(\
    %door(0),
    %baseY($00C8),
    %targetY($02D2),
    %velocity(0),
    %timer(0),
    %FXType(4),
    %layerBlendConfig(2, $1E),
    %liquidOptions(2),
    %paletteFX($1F),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_MainHall:
    %FXHeader(\
    %door(0),
    %baseY($02C1),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(4),
    %layerBlendConfig(2, $1E),
    %liquidOptions($82),
    %paletteFX($1F),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_GoldenTorizo_State0_1:
    %FXHeader(\
    %door(0),
    %baseY($02C6),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(4),
    %layerBlendConfig(2, $1E),
    %liquidOptions($82),
    %paletteFX($1F),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_FastRipper:
    %FXHeader(\
    %door(0),
    %baseY($00B8),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(4),
    %layerBlendConfig(2, $1E),
    %liquidOptions($82),
    %paletteFX($1F),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_GTEnergyRefill:
    dw $FFFF

FXHeader_Ridley_State0_1:
    %FXHeader(\
    %door(0),
    %baseY($0210),
    %targetY($01D0),
    %velocity(0),
    %timer(0),
    %FXType(4),
    %layerBlendConfig(2, $1E),
    %liquidOptions($82),
    %paletteFX($1F),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_LNFarming:
    %FXHeader(\
    %door(0),
    %baseY($00D0),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(4),
    %layerBlendConfig(2, $1E),
    %liquidOptions($82),
    %paletteFX($1F),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_FastPillarsSetup:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(4),
    %layerBlendConfig(2, $1E),
    %liquidOptions(2),
    %paletteFX($1F),
    %animTiles(0),
    %paletteBlend(0))

if !FEATURE_KEEP_UNREFERENCED
UNUSED_FXHeader_8387EC:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(4),
    %layerBlendConfig(2, $1E),
    %liquidOptions(2),
    %paletteFX($1F),
    %animTiles(0),
    %paletteBlend(0))
endif ; !FEATURE_KEEP_UNREFERENCED

FXHeader_MickeyMouse:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(4),
    %layerBlendConfig(2, $1E),
    %liquidOptions(2),
    %paletteFX($1F),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_Pillar:
    %FXHeader(\
    %door(0),
    %baseY($00E8),
    %targetY($0010),
    %velocity($FFE0),
    %timer($50),
    %FXType(4),
    %layerBlendConfig(2, $1E),
    %liquidOptions($82),
    %paletteFX($1F),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_Plowerhouse:
    %FXHeader(\
    %door(0),
    %baseY($00CD),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(4),
    %layerBlendConfig(2, $1E),
    %liquidOptions($82),
    %paletteFX($1F),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_WorstRoomInTheGame:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer($20),
    %FXType(4),
    %layerBlendConfig(2, $1E),
    %liquidOptions(2),
    %paletteFX($1F),
    %animTiles(2),
    %paletteBlend(0))

FXHeader_Amphitheatre:
    %FXHeader(\
    %door(Door_RedKihunterShaft_1),
    %baseY($00D0),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(4),
    %layerBlendConfig(2, $1E),
    %liquidOptions($82),
    %paletteFX($1F),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_Amphitheatre_Part2:
    %FXHeader(\
    %door(0),
    %baseY($04E8),
    %targetY($00D0),
    %velocity($FF80),
    %timer($60),
    %FXType(4),
    %layerBlendConfig(2, $1E),
    %liquidOptions($82),
    %paletteFX($1F),
    %animTiles(2),
    %paletteBlend(0))

FXHeader_LNSpringballMaze:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(4),
    %layerBlendConfig(2, $1E),
    %liquidOptions(2),
    %paletteFX($1F),
    %animTiles(2),
    %paletteBlend(0))

FXHeader_LNEscapePowerBombs:
    %FXHeader(\
    %door(0),
    %baseY($00B3),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(4),
    %layerBlendConfig(2, $1E),
    %liquidOptions($82),
    %paletteFX($1F),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_RedKihunterShaft:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(4),
    %layerBlendConfig(2, $1E),
    %liquidOptions(2),
    %paletteFX($1F),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_Wasteland:
    %FXHeader(\
    %door(0),
    %baseY($02C0),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(4),
    %layerBlendConfig(2, $1E),
    %liquidOptions(2),
    %paletteFX($1F),
    %animTiles(3),
    %paletteBlend(0))

FXHeader_MetalPirates:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(4),
    %layerBlendConfig(2, $1E),
    %liquidOptions(2),
    %paletteFX($1F),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_ThreeMusketeers:
    %FXHeader(\
    %door(0),
    %baseY($02D0),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(4),
    %layerBlendConfig(2, $1E),
    %liquidOptions($42),
    %paletteFX($1F),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_RidleyETank:
    %FXHeader(\
    %door(0),
    %baseY($00DD),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(4),
    %layerBlendConfig(2, $1E),
    %liquidOptions($82),
    %paletteFX($1F),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_ScrewAttack:
    %FXHeader(\
    %door(0),
    %baseY($02DD),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(4),
    %layerBlendConfig(2, $1E),
    %liquidOptions($82),
    %paletteFX($1F),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_LNFireflea:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType($24),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(2),
    %paletteBlend(0))

FXHeader_LNSave:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(2),
    %layerBlendConfig(2, $1E),
    %liquidOptions(1),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(2))


; see labels.asm for DoorHeaders:
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
    %DoorHeader(\
    %destination(RoomHeader_LandingSite),
    %elevator(0),
    %direction(3),
    %doorPos(0, 0),
    %screenPos(4, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_DemoSet3_0_2_4:
    %DoorHeader(\
    %destination(RoomHeader_LandingSite),
    %elevator(0),
    %direction(3),
    %doorPos(0, 0),
    %screenPos(4, 2),
    %spawnDistance($8000),
    %doorASM(0))

Door_LandingSite_0:
    %DoorHeader(\
    %destination(RoomHeader_Parlor),
    %elevator(0),
    %direction(5),
    %doorPos($4E, 6),
    %screenPos(4, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_LandingSite_1:
    %DoorHeader(\
    %destination(RoomHeader_CrateriaTube),
    %elevator(0),
    %direction(0),
    %doorPos(0, 0),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_LandingSite_2:
    %DoorHeader(\
    %destination(RoomHeader_GauntletEntrance),
    %elevator(0),
    %direction(5),
    %doorPos($4E, 6),
    %screenPos(4, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_LandingSite_3:
    %DoorHeader(\
    %destination(RoomHeader_CrateriaPowerBombs),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_GauntletEntrance_0:
    %DoorHeader(\
    %destination(RoomHeader_LandingSite),
    %elevator(0),
    %direction(4),
    %doorPos(1, $26),
    %screenPos(0, 2),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_13_Blue))

Door_GauntletEntrance_1:
    %DoorHeader(\
    %destination(RoomHeader_GauntletETank),
    %elevator(0),
    %direction(5),
    %doorPos($5E, 6),
    %screenPos(5, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Parlor_0:
    %DoorHeader(\
    %destination(RoomHeader_Terminator),
    %elevator(0),
    %direction(5),
    %doorPos($5E, 6),
    %screenPos(5, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Parlor_1:
    %DoorHeader(\
    %destination(RoomHeader_LandingSite),
    %elevator(0),
    %direction(4),
    %doorPos(1, $46),
    %screenPos(0, 4),
    %spawnDistance($8000),
    %doorASM(0))

Door_Parlor_2:
    %DoorHeader(\
    %destination(RoomHeader_PreMapFlyway),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Parlor_3:
    %DoorHeader(\
    %destination(RoomHeader_Flyway),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Parlor_4:
    %DoorHeader(\
    %destination(RoomHeader_Climb),
    %elevator(0),
    %direction(6),
    %doorPos($16, 2),
    %screenPos(1, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Parlor_5:
    %DoorHeader(\
    %destination(RoomHeader_CrateriaSave),
    %elevator(0),
    %direction(5),
    %doorPos($E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Parlor_6:
    %DoorHeader(\
    %destination(RoomHeader_FinalMissileBombway),
    %elevator(0),
    %direction(5),
    %doorPos($1E, 6),
    %screenPos(1, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_CrateriaPowerBombs_0:
    %DoorHeader(\
    %destination(RoomHeader_LandingSite),
    %elevator(0),
    %direction(5),
    %doorPos($8E, $16),
    %screenPos(8, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_CrateriaSave_0:
    %DoorHeader(\
    %destination(RoomHeader_Parlor),
    %elevator(0),
    %direction(4),
    %doorPos($11, $26),
    %screenPos(1, 2),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_6_Green))

Door_WestOcean_0:
    %DoorHeader(\
    %destination(RoomHeader_Moat),
    %elevator(0),
    %direction(5),
    %doorPos($1E, 6),
    %screenPos(1, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_WestOcean_1:
    %DoorHeader(\
    %destination(RoomHeader_WreckedShipEntrance),
    %elevator($50),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(DoorASM_StartWreckedShipTreadmillWestEntrance))

Door_WestOcean_2:
    %DoorHeader(\
    %destination(RoomHeader_BowlingAlleyPath),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_WestOcean_3:
    %DoorHeader(\
    %destination(RoomHeader_Attic),
    %elevator($40),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_WestOcean_4:
    %DoorHeader(\
    %destination(RoomHeader_BowlingAlley),
    %elevator($40),
    %direction(4),
    %doorPos($21, 6),
    %screenPos(2, 0),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_8_9_A_B_Red))

Door_WestOcean_5:
    %DoorHeader(\
    %destination(RoomHeader_GravitySuit),
    %elevator($40),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_BowlingAlleyPath_0:
    %DoorHeader(\
    %destination(RoomHeader_WestOcean),
    %elevator(0),
    %direction(5),
    %doorPos($2E, $26),
    %screenPos(2, 2),
    %spawnDistance($8000),
    %doorASM(0))

Door_BowlingAlleyPath_1:
    %DoorHeader(\
    %destination(RoomHeader_PreBowling),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_CrateriaKihunter_0:
    %DoorHeader(\
    %destination(RoomHeader_CrateriaTube),
    %elevator(0),
    %direction(1),
    %doorPos(0, 0),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_CrateriaKihunter_1:
    %DoorHeader(\
    %destination(RoomHeader_Moat),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_CrateriaKihunter_2:
    %DoorHeader(\
    %destination(RoomHeader_RedBinstarElev),
    %elevator(0),
    %direction(6),
    %doorPos(6, 2),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_ForgottenHighwayElev_0:
    %DoorHeader(\
    %destination(RoomHeader_ForgottenHighwayElbow),
    %elevator(0),
    %direction(7),
    %doorPos(6, $0D),
    %screenPos(0, 0),
    %spawnDistance($01C0),
    %doorASM(0))

Door_ForgottenHighwayElev_1:
    %DoorHeader(\
    %destination(RoomHeader_MaridiaElev),
    %elevator($D0),
    %direction(2),
    %doorPos(0, 0),
    %screenPos(0, 0),
    %spawnDistance(0),
    %doorASM(0))

Door_EastOcean_0:
    %DoorHeader(\
    %destination(RoomHeader_ElectricDeath),
    %elevator($40),
    %direction(5),
    %doorPos($0E, $16),
    %screenPos(0, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_EastOcean_1:
    %DoorHeader(\
    %destination(RoomHeader_ForgottenHighwayKagos),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_ForgottenHighwayKagos_0:
    %DoorHeader(\
    %destination(RoomHeader_EastOcean),
    %elevator(0),
    %direction(5),
    %doorPos($6E, $46),
    %screenPos(6, 4),
    %spawnDistance($8000),
    %doorASM(0))

Door_ForgottenHighwayKagos_1:
    %DoorHeader(\
    %destination(RoomHeader_CrabMaze),
    %elevator(0),
    %direction(6),
    %doorPos($36, 2),
    %screenPos(3, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_CrabMaze_0:
    %DoorHeader(\
    %destination(RoomHeader_ForgottenHighwayKagos),
    %elevator(0),
    %direction(7),
    %doorPos(6, $3D),
    %screenPos(0, 3),
    %spawnDistance($01C0),
    %doorASM(0))

Door_ForgottenHighwayElbow_0:
    %DoorHeader(\
    %destination(RoomHeader_CrabMaze),
    %elevator(0),
    %direction(4),
    %doorPos(1, $16),
    %screenPos(0, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_CrabMaze_1:
    %DoorHeader(\
    %destination(RoomHeader_ForgottenHighwayElbow),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_ForgottenHighwayElbow_1:
    %DoorHeader(\
    %destination(RoomHeader_ForgottenHighwayElev),
    %elevator(0),
    %direction(6),
    %doorPos(6, 2),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_CrateriaTube_0:
    %DoorHeader(\
    %destination(RoomHeader_LandingSite),
    %elevator(0),
    %direction(5),
    %doorPos($8E, $46),
    %screenPos(8, 4),
    %spawnDistance($8000),
    %doorASM(0))

Door_CrateriaTube_1:
    %DoorHeader(\
    %destination(RoomHeader_CrateriaKihunter),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Moat_0:
    %DoorHeader(\
    %destination(RoomHeader_CrateriaKihunter),
    %elevator(0),
    %direction(5),
    %doorPos($2E, 6),
    %screenPos(2, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Moat_1:
    %DoorHeader(\
    %destination(RoomHeader_WestOcean),
    %elevator(0),
    %direction(4),
    %doorPos(1, $46),
    %screenPos(0, 4),
    %spawnDistance($8000),
    %doorASM(0))

Door_RedBinstarElev_0:
    %DoorHeader(\
    %destination(RoomHeader_CrateriaKihunter),
    %elevator(0),
    %direction(7),
    %doorPos($16, $2D),
    %screenPos(1, 2),
    %spawnDistance($01C0),
    %doorASM(DoorASM_Scroll_1_4_Green))

Door_RedBinstarElev_1:
    %DoorHeader(\
    %destination(RoomHeader_Caterpillar),
    %elevator($E0),
    %direction(2),
    %doorPos(0, 0),
    %screenPos(0, 0),
    %spawnDistance(0),
    %doorASM(DoorASM_Scroll_6_Green_duplicate))

Door_GauntletETank_0:
    %DoorHeader(\
    %destination(RoomHeader_GauntletEntrance),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_GauntletETank_1:
    %DoorHeader(\
    %destination(RoomHeader_GreenPiratesShaft),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_3_Green))

Door_PreBowling_0:
    %DoorHeader(\
    %destination(RoomHeader_BowlingAlleyPath),
    %elevator(0),
    %direction(5),
    %doorPos($1E, 6),
    %screenPos(1, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_PreBowling_1:
    %DoorHeader(\
    %destination(RoomHeader_BowlingAlley),
    %elevator($40),
    %direction(4),
    %doorPos(1, $16),
    %screenPos(0, 1),
    %spawnDistance($00A0),
    %doorASM(DoorASM_Scroll_2_3_4_5_B_C_D_11_Red))

Door_Climb_0:
    %DoorHeader(\
    %destination(RoomHeader_Parlor),
    %elevator(0),
    %direction(7),
    %doorPos($16, $4D),
    %screenPos(1, 4),
    %spawnDistance($01C0),
    %doorASM(DoorASM_Scroll_6_Green))

Door_Climb_1:
    %DoorHeader(\
    %destination(RoomHeader_CrateriaSuper),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Climb_2:
    %DoorHeader(\
    %destination(RoomHeader_CrateriaSuper),
    %elevator(0),
    %direction(4),
    %doorPos(1, $76),
    %screenPos(0, 7),
    %spawnDistance($8000),
    %doorASM(0))

Door_Climb_3:
    %DoorHeader(\
    %destination(RoomHeader_Pit),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Climb_4:
    %DoorHeader(\
    %destination(RoomHeader_TourianEscape4),
    %elevator(0),
    %direction(5),
    %doorPos($2E, $16),
    %screenPos(2, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_Pit_0:
    %DoorHeader(\
    %destination(RoomHeader_Climb),
    %elevator(0),
    %direction(5),
    %doorPos($1E, $86),
    %screenPos(1, 8),
    %spawnDistance($8000),
    %doorASM(0))

Door_Pit_1:
    %DoorHeader(\
    %destination(RoomHeader_ElevToBlueBrinstar),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_ElevToBlueBrinstar_0:
    %DoorHeader(\
    %destination(RoomHeader_Pit),
    %elevator(0),
    %direction(5),
    %doorPos($2E, 6),
    %screenPos(2, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_ElevToBlueBrinstar_1:
    %DoorHeader(\
    %destination(RoomHeader_MorphBall),
    %elevator($F0),
    %direction(2),
    %doorPos(0, 0),
    %screenPos(5, 0),
    %spawnDistance(0),
    %doorASM(0))

Door_BombTorizo_0:
    %DoorHeader(\
    %destination(RoomHeader_Flyway),
    %elevator(0),
    %direction(5),
    %doorPos($2E, 6),
    %screenPos(2, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Flyway_0:
    %DoorHeader(\
    %destination(RoomHeader_Parlor),
    %elevator(0),
    %direction(5),
    %doorPos($3E, $26),
    %screenPos(3, 2),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_4_Red_8_Green))

Door_Flyway_1:
    %DoorHeader(\
    %destination(RoomHeader_BombTorizo),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_PreMapFlyway_0:
    %DoorHeader(\
    %destination(RoomHeader_Parlor),
    %elevator(0),
    %direction(5),
    %doorPos($1E, $36),
    %screenPos(1, 3),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_6_Green))

Door_PreMapFlyway_1:
    %DoorHeader(\
    %destination(RoomHeader_CrateriaMap),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Terminator_0:
    %DoorHeader(\
    %destination(RoomHeader_GreenPiratesShaft),
    %elevator(0),
    %direction(5),
    %doorPos($0E, $46),
    %screenPos(0, 4),
    %spawnDistance($8000),
    %doorASM(0))

Door_Terminator_1:
    %DoorHeader(\
    %destination(RoomHeader_Parlor),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_0_Blue))

Door_GreenBrinstarElev_0:
    %DoorHeader(\
    %destination(RoomHeader_LowerMushrooms),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_GreenBrinstarElev_1:
    %DoorHeader(\
    %destination(RoomHeader_GreenBrinstarMainShaft),
    %elevator($C0),
    %direction(2),
    %doorPos(0, 0),
    %screenPos(0, 0),
    %spawnDistance(0),
    %doorASM(DoorASM_Scroll_1D_Blue))

Door_LowerMushrooms_0:
    %DoorHeader(\
    %destination(RoomHeader_GreenPiratesShaft),
    %elevator(0),
    %direction(4),
    %doorPos(1, $66),
    %screenPos(0, 6),
    %spawnDistance($8000),
    %doorASM(0))

Door_LowerMushrooms_1:
    %DoorHeader(\
    %destination(RoomHeader_GreenBrinstarElev),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_CrateriaMap_0:
    %DoorHeader(\
    %destination(RoomHeader_PreMapFlyway),
    %elevator(0),
    %direction(5),
    %doorPos($2E, 6),
    %screenPos(2, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_GreenPiratesShaft_0:
    %DoorHeader(\
    %destination(RoomHeader_Terminator),
    %elevator(0),
    %direction(4),
    %doorPos(1, $26),
    %screenPos(0, 2),
    %spawnDistance($8000),
    %doorASM(0))

Door_GreenPiratesShaft_1:
    %DoorHeader(\
    %destination(RoomHeader_LowerMushrooms),
    %elevator(0),
    %direction(5),
    %doorPos($3E, 6),
    %screenPos(3, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_GreenPiratesShaft_2:
    %DoorHeader(\
    %destination(RoomHeader_StatuesHallway),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_GreenPiratesShaft_3:
    %DoorHeader(\
    %destination(RoomHeader_GauntletETank),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_4_Blue))

Door_CrateriaSuper_0:
    %DoorHeader(\
    %destination(RoomHeader_Climb),
    %elevator(0),
    %direction(5),
    %doorPos($2E, 6),
    %screenPos(2, 0),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_2_Blue))

Door_CrateriaSuper_1:
    %DoorHeader(\
    %destination(RoomHeader_Climb),
    %elevator(0),
    %direction(5),
    %doorPos($2E, $76),
    %screenPos(2, 7),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_17_Blue))

Door_FinalMissileBombway_0:
    %DoorHeader(\
    %destination(RoomHeader_FinalMissile),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_FinalMissileBombway_1:
    %DoorHeader(\
    %destination(RoomHeader_Parlor),
    %elevator(0),
    %direction(4),
    %doorPos($11, $36),
    %screenPos(1, 3),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_6_Green))

Door_FinalMissile_0:
    %DoorHeader(\
    %destination(RoomHeader_FinalMissileBombway),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_GreenBrinstarMainShaft_0:
    %DoorHeader(\
    %destination(RoomHeader_GreenBrinstarElev),
    %elevator($D0),
    %direction(3),
    %doorPos(0, 0),
    %screenPos(0, 0),
    %spawnDistance(0),
    %doorASM(DoorASM_Scroll_2_Green))

Door_GreenBrinstarMainShaft_1:
    %DoorHeader(\
    %destination(RoomHeader_BrinstarPreMap),
    %elevator(0),
    %direction(5),
    %doorPos($2E, 6),
    %screenPos(2, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_GreenBrinstarMainShaft_2:
    %DoorHeader(\
    %destination(RoomHeader_GreenBrinstarBeetoms),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_GreenBrinstarMainShaft_3:
    %DoorHeader(\
    %destination(RoomHeader_GreenBrinstarFirefleas),
    %elevator(0),
    %direction(5),
    %doorPos($2E, 6),
    %screenPos(2, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_GreenBrinstarMainShaft_4:
    %DoorHeader(\
    %destination(RoomHeader_EarlySupers),
    %elevator(0),
    %direction(4),
    %doorPos(1, $16),
    %screenPos(0, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_GreenBrinstarMainShaft_5:
    %DoorHeader(\
    %destination(RoomHeader_Dachora),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_4_Red))

Door_GreenBrinstarMainShaft_6:
    %DoorHeader(\
    %destination(RoomHeader_GreenBrinstarMainShaft),
    %elevator(0),
    %direction(4),
    %doorPos(1, $76),
    %screenPos(1, 7),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_1D_Blue))

Door_GreenBrinstarMainShaft_7:
    %DoorHeader(\
    %destination(RoomHeader_EtecoonETank),
    %elevator(0),
    %direction(5),
    %doorPos($4E, $16),
    %screenPos(4, 1),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_5_6_Blue))

Door_GreenBrinstarMainShaft_8:
    %DoorHeader(\
    %destination(RoomHeader_GreenBrinstarMainShaft),
    %elevator(0),
    %direction(5),
    %doorPos($0E, $76),
    %screenPos(0, 7),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_18_1C_Green))

Door_GreenBrinstarMainShaft_A:
    %DoorHeader(\
    %destination(RoomHeader_GreenBrinstarSave),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_SporeSpawnSuper_0:
    %DoorHeader(\
    %destination(RoomHeader_SporeSpawnFarming),
    %elevator(0),
    %direction(5),
    %doorPos($2E, 6),
    %screenPos(2, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_SporeSpawnSuper_1:
    %DoorHeader(\
    %destination(RoomHeader_SporeSpawn),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_BrinstarPreMap_0:
    %DoorHeader(\
    %destination(RoomHeader_GreenBrinstarMap),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_BrinstarPreMap_1:
    %DoorHeader(\
    %destination(RoomHeader_GreenBrinstarMainShaft),
    %elevator(0),
    %direction(4),
    %doorPos(1, $46),
    %screenPos(0, 4),
    %spawnDistance($8000),
    %doorASM(0))

Door_EarlySupers_0:
    %DoorHeader(\
    %destination(RoomHeader_GreenBrinstarMainShaft),
    %elevator(0),
    %direction(5),
    %doorPos($0E, $46),
    %screenPos(0, 4),
    %spawnDistance($8000),
    %doorASM(0))

Door_EarlySupers_1:
    %DoorHeader(\
    %destination(RoomHeader_BrinstarReserveTank),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_BrinstarReserveTank_0:
    %DoorHeader(\
    %destination(RoomHeader_EarlySupers),
    %elevator(0),
    %direction(5),
    %doorPos($2E, $16),
    %screenPos(2, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_GreenBrinstarMap_0:
    %DoorHeader(\
    %destination(RoomHeader_BrinstarPreMap),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_GreenBrinstarFirefleas_0:
    %DoorHeader(\
    %destination(RoomHeader_GreenBrinstarMissileRefill),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_GreenBrinstarFirefleas_1:
    %DoorHeader(\
    %destination(RoomHeader_GreenBrinstarMainShaft),
    %elevator(0),
    %direction(4),
    %doorPos(1, $66),
    %screenPos(0, 6),
    %spawnDistance($8000),
    %doorASM(0))

Door_GreenBrinstarMissileRefill_0:
    %DoorHeader(\
    %destination(RoomHeader_GreenBrinstarFirefleas),
    %elevator(0),
    %direction(4),
    %doorPos(1, $16),
    %screenPos(0, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_Dachora_0:
    %DoorHeader(\
    %destination(RoomHeader_GreenBrinstarMainShaft),
    %elevator(0),
    %direction(5),
    %doorPos($0E, $66),
    %screenPos(0, 6),
    %spawnDistance($8000),
    %doorASM(0))

Door_Dachora_1:
    %DoorHeader(\
    %destination(RoomHeader_BigPink),
    %elevator(0),
    %direction(4),
    %doorPos($21, $26),
    %screenPos(2, 2),
    %spawnDistance($8000),
    %doorASM(0))

Door_Dachora_2:
    %DoorHeader(\
    %destination(RoomHeader_DachoraEnergyRefill),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_BigPink_0:
    %DoorHeader(\
    %destination(RoomHeader_SporeSpawnKihunters),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_BigPink_1:
    %DoorHeader(\
    %destination(RoomHeader_Dachora),
    %elevator(0),
    %direction(5),
    %doorPos($6E, 6),
    %screenPos(6, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_BigPink_2:
    %DoorHeader(\
    %destination(RoomHeader_PinkBrinstarPowerBombs),
    %elevator(0),
    %direction(5),
    %doorPos($1E, $16),
    %screenPos(1, 1),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_2_3_Green))

Door_BigPink_3:
    %DoorHeader(\
    %destination(RoomHeader_GreenHillZone),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_BigPink_4:
    %DoorHeader(\
    %destination(RoomHeader_BigPinkSaveRoom),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_BigPink_5:
    %DoorHeader(\
    %destination(RoomHeader_PinkBrinstarPowerBombs),
    %elevator(0),
    %direction(1),
    %doorPos($1E, 6),
    %screenPos(1, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_BigPink_6:
    %DoorHeader(\
    %destination(RoomHeader_WaterwayETank),
    %elevator(0),
    %direction(5),
    %doorPos($6E, 6),
    %screenPos(6, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_BigPink_7:
    %DoorHeader(\
    %destination(RoomHeader_PinkBrinstarHoppers),
    %elevator(0),
    %direction(4),
    %doorPos(1, $16),
    %screenPos(0, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_BigPink_8:
    %DoorHeader(\
    %destination(RoomHeader_SporeSpawnFarming),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_SporeSpawnKihunters_0:
    %DoorHeader(\
    %destination(RoomHeader_BigPink),
    %elevator(0),
    %direction(5),
    %doorPos($3E, 6),
    %screenPos(3, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_SporeSpawnKihunters_1:
    %DoorHeader(\
    %destination(RoomHeader_SporeSpawn),
    %elevator(0),
    %direction(7),
    %doorPos(6, $2E),
    %screenPos(0, 2),
    %spawnDistance($8000),
    %doorASM(0))

Door_SporeSpawn_0:
    %DoorHeader(\
    %destination(RoomHeader_SporeSpawnSuper),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_1_Blue_3_Red))

Door_SporeSpawn_1:
    %DoorHeader(\
    %destination(RoomHeader_SporeSpawnKihunters),
    %elevator(0),
    %direction(6),
    %doorPos($36, 3),
    %screenPos(3, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_PinkBrinstarPowerBombs_0:
    %DoorHeader(\
    %destination(RoomHeader_BigPink),
    %elevator(0),
    %direction(0),
    %doorPos(0, 0),
    %screenPos(2, 3),
    %spawnDistance($8000),
    %doorASM(0))

Door_PinkBrinstarPowerBombs_1:
    %DoorHeader(\
    %destination(RoomHeader_BigPink),
    %elevator(0),
    %direction(4),
    %doorPos($21, $46),
    %screenPos(2, 4),
    %spawnDistance($8000),
    %doorASM(0))

Door_GreenHillZone_0:
    %DoorHeader(\
    %destination(RoomHeader_BigPink),
    %elevator(0),
    %direction(5),
    %doorPos($3E, $66),
    %screenPos(3, 6),
    %spawnDistance($8000),
    %doorASM(0))

Door_GreenHillZone_1:
    %DoorHeader(\
    %destination(RoomHeader_MorphBall),
    %elevator(0),
    %direction(4),
    %doorPos(1, $26),
    %screenPos(0, 2),
    %spawnDistance($8000),
    %doorASM(0))

Door_GreenHillZone_2:
    %DoorHeader(\
    %destination(RoomHeader_NoobBridge),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_MorphBall_0:
    %DoorHeader(\
    %destination(RoomHeader_GreenHillZone),
    %elevator(0),
    %direction(5),
    %doorPos($1E, 6),
    %screenPos(1, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_MorphBall_1:
    %DoorHeader(\
    %destination(RoomHeader_ConstructionZone),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_MorphBall_2:
    %DoorHeader(\
    %destination(RoomHeader_ElevToBlueBrinstar),
    %elevator($E0),
    %direction(3),
    %doorPos(0, 0),
    %screenPos(0, 0),
    %spawnDistance(0),
    %doorASM(0))

Door_ConstructionZone_0:
    %DoorHeader(\
    %destination(RoomHeader_MorphBall),
    %elevator(0),
    %direction(5),
    %doorPos($7E, $26),
    %screenPos(7, 2),
    %spawnDistance($8000),
    %doorASM(0))

Door_ConstructionZone_1:
    %DoorHeader(\
    %destination(RoomHeader_BlueBrinstarETank),
    %elevator(0),
    %direction(4),
    %doorPos(1, $26),
    %screenPos(0, 2),
    %spawnDistance($8000),
    %doorASM(0))

Door_ConstructionZone_2:
    %DoorHeader(\
    %destination(RoomHeader_FirstMissile),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_BlueBrinstarETank_0:
    %DoorHeader(\
    %destination(RoomHeader_ConstructionZone),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_BlueBrinstarETank_1:
    %DoorHeader(\
    %destination(RoomHeader_BlueBrinstarBoulders),
    %elevator(0),
    %direction(5),
    %doorPos($1E, 6),
    %screenPos(1, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_NoobBridge_0:
    %DoorHeader(\
    %destination(RoomHeader_GreenHillZone),
    %elevator(0),
    %direction(5),
    %doorPos($7E, $36),
    %screenPos(7, 3),
    %spawnDistance($8000),
    %doorASM(0))

Door_NoobBridge_1:
    %DoorHeader(\
    %destination(RoomHeader_RedTower),
    %elevator(0),
    %direction(4),
    %doorPos(1, $46),
    %screenPos(0, 4),
    %spawnDistance($8000),
    %doorASM(0))

Door_GreenBrinstarBeetoms_0:
    %DoorHeader(\
    %destination(RoomHeader_GreenBrinstarMainShaft),
    %elevator(0),
    %direction(4),
    %doorPos(1, $A6),
    %screenPos(0, $0A),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_18_1C_Green))

Door_GreenBrinstarBeetoms_1:
    %DoorHeader(\
    %destination(RoomHeader_EtecoonETank),
    %elevator(0),
    %direction(5),
    %doorPos($1E, 6),
    %screenPos(1, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_EtecoonETank_0:
    %DoorHeader(\
    %destination(RoomHeader_GreenBrinstarBeetoms),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_EtecoonETank_1:
    %DoorHeader(\
    %destination(RoomHeader_EtecoonSuper),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_EtecoonETank_2:
    %DoorHeader(\
    %destination(RoomHeader_GreenBrinstarMainShaft),
    %elevator(0),
    %direction(4),
    %doorPos($21, $B6),
    %screenPos(2, $0B),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_1D_Blue))

Door_EtecoonETank_3:
    %DoorHeader(\
    %destination(RoomHeader_EtecoonSave),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_EtecoonSuper_0:
    %DoorHeader(\
    %destination(RoomHeader_EtecoonETank),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_DachoraEnergyRefill_0:
    %DoorHeader(\
    %destination(RoomHeader_Dachora),
    %elevator(0),
    %direction(4),
    %doorPos(1, $66),
    %screenPos(0, 6),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_B_Green))

Door_SporeSpawnFarming_0:
    %DoorHeader(\
    %destination(RoomHeader_SporeSpawnSuper),
    %elevator(0),
    %direction(4),
    %doorPos(1, $86),
    %screenPos(0, 8),
    %spawnDistance($8000),
    %doorASM(0))

Door_SporeSpawnFarming_1:
    %DoorHeader(\
    %destination(RoomHeader_BigPink),
    %elevator(0),
    %direction(5),
    %doorPos($4E, $56),
    %screenPos(4, 5),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_Scroll_1C_Red_1D_Blue))

Door_WaterwayETank_0:
    %DoorHeader(\
    %destination(RoomHeader_BigPink),
    %elevator(0),
    %direction(4),
    %doorPos(1, $96),
    %screenPos(0, 9),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_20_24_25_Green))

Door_WaterwayETank_1:
    %DoorHeader(\
    %destination(RoomHeader_KraidRefill),
    %elevator(0),
    %direction(6),
    %doorPos($16, 3),
    %screenPos(1, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_FirstMissile_0:
    %DoorHeader(\
    %destination(RoomHeader_ConstructionZone),
    %elevator(0),
    %direction(4),
    %doorPos(1, $16),
    %screenPos(0, 1),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_0_Green_1_Blue))

Door_PinkBrinstarHoppers_0:
    %DoorHeader(\
    %destination(RoomHeader_BigPink),
    %elevator(0),
    %direction(5),
    %doorPos($3E, $46),
    %screenPos(3, 4),
    %spawnDistance($8000),
    %doorASM(0))

Door_PinkBrinstarHoppers_1:
    %DoorHeader(\
    %destination(RoomHeader_HopperETank),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_HopperETank_0:
    %DoorHeader(\
    %destination(RoomHeader_PinkBrinstarHoppers),
    %elevator(0),
    %direction(5),
    %doorPos($1E, $16),
    %screenPos(1, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_BigPinkSaveRoom_0:
    %DoorHeader(\
    %destination(RoomHeader_BigPink),
    %elevator(0),
    %direction(4),
    %doorPos($11, 6),
    %screenPos(1, 0),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_1_Green))

Door_BlueBrinstarBoulders_0:
    %DoorHeader(\
    %destination(RoomHeader_BlueBrinstarETank),
    %elevator(0),
    %direction(4),
    %doorPos($21, 6),
    %screenPos(2, 0),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_2_Blue_duplicate))

Door_BlueBrinstarBoulders_1:
    %DoorHeader(\
    %destination(RoomHeader_BillyMays),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_BillyMays_0:
    %DoorHeader(\
    %destination(RoomHeader_BlueBrinstarBoulders),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_GreenBrinstarSave_0:
    %DoorHeader(\
    %destination(RoomHeader_GreenBrinstarMainShaft),
    %elevator(0),
    %direction(4),
    %doorPos(1, $56),
    %screenPos(0, 5),
    %spawnDistance($8000),
    %doorASM(0))

Door_EtecoonSave_0:
    %DoorHeader(\
    %destination(RoomHeader_EtecoonETank),
    %elevator(0),
    %direction(4),
    %doorPos(1, $16),
    %screenPos(0, 1),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_5_6_Blue))

Door_RedTower_0:
    %DoorHeader(\
    %destination(RoomHeader_Hellway),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_RedTower_1:
    %DoorHeader(\
    %destination(RoomHeader_NoobBridge),
    %elevator(0),
    %direction(5),
    %doorPos($5E, 6),
    %screenPos(5, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_RedTower_2:
    %DoorHeader(\
    %destination(RoomHeader_RedBrinstarFirefleas),
    %elevator(0),
    %direction(5),
    %doorPos($7E, 6),
    %screenPos(7, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_RedTower_3:
    %DoorHeader(\
    %destination(RoomHeader_SkreeBoost),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_RedTower_4:
    %DoorHeader(\
    %destination(RoomHeader_RedTowerRefill),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_RedBrinstarFirefleas_0:
    %DoorHeader(\
    %destination(RoomHeader_XrayScope),
    %elevator(0),
    %direction(5),
    %doorPos($1E, 6),
    %screenPos(1, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_RedBrinstarFirefleas_1:
    %DoorHeader(\
    %destination(RoomHeader_RedTower),
    %elevator(0),
    %direction(4),
    %doorPos(1, $66),
    %screenPos(0, 6),
    %spawnDistance($8000),
    %doorASM(0))

Door_XrayScope_0:
    %DoorHeader(\
    %destination(RoomHeader_RedBrinstarFirefleas),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Hellway_0:
    %DoorHeader(\
    %destination(RoomHeader_RedTower),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Hellway_1:
    %DoorHeader(\
    %destination(RoomHeader_Caterpillar),
    %elevator(0),
    %direction(4),
    %doorPos(1, $56),
    %screenPos(0, 5),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_6_Green_duplicate_again))

Door_Caterpillar_0:
    %DoorHeader(\
    %destination(RoomHeader_AlphaPowerBomb),
    %elevator(0),
    %direction(5),
    %doorPos($2E, 6),
    %screenPos(2, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Caterpillar_1:
    %DoorHeader(\
    %destination(RoomHeader_BetaPowerBomb),
    %elevator(0),
    %direction(5),
    %doorPos($1E, 6),
    %screenPos(1, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Caterpillar_2:
    %DoorHeader(\
    %destination(RoomHeader_Hellway),
    %elevator(0),
    %direction(5),
    %doorPos($2E, 6),
    %screenPos(2, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Caterpillar_3:
    %DoorHeader(\
    %destination(RoomHeader_RedBinstarElev),
    %elevator($F0),
    %direction(3),
    %doorPos(0, 0),
    %screenPos(0, 0),
    %spawnDistance(0),
    %doorASM(0))

Door_Caterpillar_4:
    %DoorHeader(\
    %destination(RoomHeader_RedFish),
    %elevator($40),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_1_Blue_2_Red))

Door_Caterpillar_6:
    %DoorHeader(\
    %destination(RoomHeader_RedBrinstarSave),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_BetaPowerBomb_0:
    %DoorHeader(\
    %destination(RoomHeader_Caterpillar),
    %elevator(0),
    %direction(4),
    %doorPos(1, $36),
    %screenPos(0, 3),
    %spawnDistance($8000),
    %doorASM(0))

Door_AlphaPowerBomb_0:
    %DoorHeader(\
    %destination(RoomHeader_Caterpillar),
    %elevator(0),
    %direction(4),
    %doorPos(1, $76),
    %screenPos(0, 7),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_F_12_Green))

Door_SkreeBoost_0:
    %DoorHeader(\
    %destination(RoomHeader_RedTower),
    %elevator(0),
    %direction(5),
    %doorPos($0E, $96),
    %screenPos(0, 9),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_6_7_Green))

Door_SkreeBoost_1:
    %DoorHeader(\
    %destination(RoomHeader_BelowSpazer),
    %elevator(0),
    %direction(4),
    %doorPos(1, $16),
    %screenPos(0, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_BelowSpazer_0:
    %DoorHeader(\
    %destination(RoomHeader_SkreeBoost),
    %elevator(0),
    %direction(5),
    %doorPos($1E, 6),
    %screenPos(1, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_BelowSpazer_1:
    %DoorHeader(\
    %destination(RoomHeader_WestTunnel),
    %elevator($40),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_BelowSpazer_2:
    %DoorHeader(\
    %destination(RoomHeader_Spazer),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Spazer_0:
    %DoorHeader(\
    %destination(RoomHeader_BelowSpazer),
    %elevator(0),
    %direction(5),
    %doorPos($1E, 6),
    %screenPos(1, 0),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_0_1_Green))

Door_WarehouseZeela_0:
    %DoorHeader(\
    %destination(RoomHeader_WarehouseEntrance),
    %elevator(0),
    %direction(5),
    %doorPos($2E, 6),
    %screenPos(2, 0),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_0_Red_1_Green))

Door_WarehouseZeela_1:
    %DoorHeader(\
    %destination(RoomHeader_WarehouseETank),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_WarehouseZeela_2:
    %DoorHeader(\
    %destination(RoomHeader_WarehouseKihunter),
    %elevator(0),
    %direction(7),
    %doorPos(6, $0C),
    %screenPos(0, 0),
    %spawnDistance($0240),
    %doorASM(0))

Door_WarehouseETank_0:
    %DoorHeader(\
    %destination(RoomHeader_WarehouseZeela),
    %elevator(0),
    %direction(4),
    %doorPos(1, $16),
    %screenPos(0, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_WarehouseKihunter_0:
    %DoorHeader(\
    %destination(RoomHeader_WarehouseZeela),
    %elevator(0),
    %direction(6),
    %doorPos($16, $13),
    %screenPos(1, 1),
    %spawnDistance($01C0),
    %doorASM(0))

Door_WarehouseKihunter_1:
    %DoorHeader(\
    %destination(RoomHeader_MiniKraid),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_WarehouseKihunter_2:
    %DoorHeader(\
    %destination(RoomHeader_WarehouseSave),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_MiniKraid_0:
    %DoorHeader(\
    %destination(RoomHeader_WarehouseKihunter),
    %elevator(0),
    %direction(5),
    %doorPos($1E, $16),
    %screenPos(1, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_MiniKraid_1:
    %DoorHeader(\
    %destination(RoomHeader_KraidEyeDoor),
    %elevator(0),
    %direction(4),
    %doorPos(1, $16),
    %screenPos(0, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_KraidEyeDoor_0:
    %DoorHeader(\
    %destination(RoomHeader_MiniKraid),
    %elevator(0),
    %direction(5),
    %doorPos($5E, 6),
    %screenPos(5, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_KraidEyeDoor_1:
    %DoorHeader(\
    %destination(RoomHeader_Kraid),
    %elevator(0),
    %direction(4),
    %doorPos(1, $16),
    %screenPos(0, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_KraidEyeDoor_2:
    %DoorHeader(\
    %destination(RoomHeader_KraidRefill),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Kraid_0:
    %DoorHeader(\
    %destination(RoomHeader_KraidEyeDoor),
    %elevator(0),
    %direction(5),
    %doorPos($1E, $16),
    %screenPos(1, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_Kraid_1:
    %DoorHeader(\
    %destination(RoomHeader_VariaSuit),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_StatuesHallway_0:
    %DoorHeader(\
    %destination(RoomHeader_GreenPiratesShaft),
    %elevator(0),
    %direction(5),
    %doorPos($0E, $66),
    %screenPos(0, 6),
    %spawnDistance($8000),
    %doorASM(0))

Door_StatuesHallway_1:
    %DoorHeader(\
    %destination(RoomHeader_Statues),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_RedTowerRefill_0:
    %DoorHeader(\
    %destination(RoomHeader_RedTower),
    %elevator(0),
    %direction(4),
    %doorPos(1, $96),
    %screenPos(0, 9),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_6_7_Green))

Door_KraidRefill_0:
    %DoorHeader(\
    %destination(RoomHeader_KraidEyeDoor),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_0_Green))

Door_Statues_0:
    %DoorHeader(\
    %destination(RoomHeader_StatuesHallway),
    %elevator(0),
    %direction(5),
    %doorPos($4E, 6),
    %screenPos(4, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Statues_1:
    %DoorHeader(\
    %destination(RoomHeader_TourianFirst),
    %elevator($D0),
    %direction(2),
    %doorPos(0, 0),
    %screenPos(0, 0),
    %spawnDistance(0),
    %doorASM(0))

Door_WarehouseEntrance_0:
    %DoorHeader(\
    %destination(RoomHeader_EastTunnel),
    %elevator($40),
    %direction(5),
    %doorPos($0E, $16),
    %screenPos(0, 1),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_0_Red_4_Blue))

Door_WarehouseEntrance_1:
    %DoorHeader(\
    %destination(RoomHeader_WarehouseZeela),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_WarehouseEntrance_2:
    %DoorHeader(\
    %destination(RoomHeader_BusinessCenter),
    %elevator($C0),
    %direction(2),
    %doorPos(0, 0),
    %screenPos(0, 0),
    %spawnDistance(0),
    %doorASM(0))

Door_VariaSuit_0:
    %DoorHeader(\
    %destination(RoomHeader_Kraid),
    %elevator(0),
    %direction(5),
    %doorPos($1E, $16),
    %screenPos(1, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_WarehouseSave_0:
    %DoorHeader(\
    %destination(RoomHeader_WarehouseKihunter),
    %elevator(0),
    %direction(5),
    %doorPos($3E, 6),
    %screenPos(3, 0),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_2_3_Blue))

Door_RedBrinstarSave_0:
    %DoorHeader(\
    %destination(RoomHeader_Caterpillar),
    %elevator(0),
    %direction(5),
    %doorPos($0E, $46),
    %screenPos(0, 4),
    %spawnDistance($8000),
    %doorASM(0))

Door_IceBeamAcid_0:
    %DoorHeader(\
    %destination(RoomHeader_IceBeamGate),
    %elevator(0),
    %direction(4),
    %doorPos($31, $26),
    %screenPos(3, 2),
    %spawnDistance($8000),
    %doorASM(0))

Door_IceBeamAcid_1:
    %DoorHeader(\
    %destination(RoomHeader_IceBeamSnake),
    %elevator(0),
    %direction(5),
    %doorPos($0E, $26),
    %screenPos(0, 2),
    %spawnDistance($8000),
    %doorASM(0))

Door_Cathedral_0:
    %DoorHeader(\
    %destination(RoomHeader_CathedralEntrance),
    %elevator(0),
    %direction(5),
    %doorPos($2E, 6),
    %screenPos(2, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Cathedral_1:
    %DoorHeader(\
    %destination(RoomHeader_RisingTide),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_CathedralEntrance_0:
    %DoorHeader(\
    %destination(RoomHeader_BusinessCenter),
    %elevator(0),
    %direction(5),
    %doorPos($0E, $36),
    %screenPos(0, 3),
    %spawnDistance($8000),
    %doorASM(0))

Door_CathedralEntrance_1:
    %DoorHeader(\
    %destination(RoomHeader_Cathedral),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_BusinessCenter_0:
    %DoorHeader(\
    %destination(RoomHeader_IceBeamGate),
    %elevator(0),
    %direction(5),
    %doorPos($6E, $26),
    %screenPos(6, 2),
    %spawnDistance($8000),
    %doorASM(0))

Door_BusinessCenter_1:
    %DoorHeader(\
    %destination(RoomHeader_CathedralEntrance),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_BusinessCenter_2:
    %DoorHeader(\
    %destination(RoomHeader_HiJumpETank),
    %elevator(0),
    %direction(5),
    %doorPos($1E, 6),
    %screenPos(1, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_BusinessCenter_3:
    %DoorHeader(\
    %destination(RoomHeader_CrocomireEscape),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_BusinessCenter_4:
    %DoorHeader(\
    %destination(RoomHeader_WarehouseEntrance),
    %elevator($D0),
    %direction(3),
    %doorPos(0, 0),
    %screenPos(0, 0),
    %spawnDistance(0),
    %doorASM(0))

Door_BusinessCenter_6:
    %DoorHeader(\
    %destination(RoomHeader_FrogSave),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_BusinessCenter_7:
    %DoorHeader(\
    %destination(RoomHeader_NorfairMap),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_IceBeamGate_0:
    %DoorHeader(\
    %destination(RoomHeader_IceBeamTutorial),
    %elevator(0),
    %direction(5),
    %doorPos($1E, 6),
    %screenPos(1, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_IceBeamGate_1:
    %DoorHeader(\
    %destination(RoomHeader_IceBeamAcid),
    %elevator(0),
    %direction(5),
    %doorPos($1E, 6),
    %screenPos(1, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_IceBeamGate_2:
    %DoorHeader(\
    %destination(RoomHeader_BusinessCenter),
    %elevator(0),
    %direction(4),
    %doorPos(1, $36),
    %screenPos(0, 3),
    %spawnDistance($8000),
    %doorASM(0))

Door_IceBeamGate_3:
    %DoorHeader(\
    %destination(RoomHeader_CrumbleShaft),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_IceBeamTutorial_0:
    %DoorHeader(\
    %destination(RoomHeader_IceBeamSnake),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_IceBeamTutorial_1:
    %DoorHeader(\
    %destination(RoomHeader_IceBeamGate),
    %elevator(0),
    %direction(4),
    %doorPos($31, 6),
    %screenPos(3, 0),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_A_Green))

Door_IceBeam_0:
    %DoorHeader(\
    %destination(RoomHeader_IceBeamSnake),
    %elevator(0),
    %direction(5),
    %doorPos($1E, $16),
    %screenPos(1, 1),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_2_Red_3_Blue))

Door_IceBeamSnake_0:
    %DoorHeader(\
    %destination(RoomHeader_IceBeamAcid),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_IceBeamSnake_1:
    %DoorHeader(\
    %destination(RoomHeader_IceBeamTutorial),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_IceBeamSnake_2:
    %DoorHeader(\
    %destination(RoomHeader_IceBeam),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_CrumbleShaft_0:
    %DoorHeader(\
    %destination(RoomHeader_IceBeamGate),
    %elevator(0),
    %direction(4),
    %doorPos(1, $36),
    %screenPos(0, 3),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_18_Blue))

Door_CrumbleShaft_1:
    %DoorHeader(\
    %destination(RoomHeader_CrocomireSpeedway),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_CrocomireSpeedway_0:
    %DoorHeader(\
    %destination(RoomHeader_CrumbleShaft),
    %elevator(0),
    %direction(5),
    %doorPos($0E, $36),
    %screenPos(0, 3),
    %spawnDistance($8000),
    %doorASM(0))

Door_CrocomireSpeedway_1:
    %DoorHeader(\
    %destination(RoomHeader_CrocomireEscape),
    %elevator(0),
    %direction(5),
    %doorPos($3E, $16),
    %screenPos(3, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_CrocomireSpeedway_2:
    %DoorHeader(\
    %destination(RoomHeader_CrocomireSave),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_CrocomireSpeedway_3:
    %DoorHeader(\
    %destination(RoomHeader_AcidSnakesTunnel),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_CrocomireSpeedway_4:
    %DoorHeader(\
    %destination(RoomHeader_Crocomire),
    %elevator(0),
    %direction(6),
    %doorPos($36, 2),
    %screenPos(3, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Crocomire_0:
    %DoorHeader(\
    %destination(RoomHeader_PostCrocFarming),
    %elevator(0),
    %direction(5),
    %doorPos($1E, 6),
    %screenPos(1, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Crocomire_1:
    %DoorHeader(\
    %destination(RoomHeader_CrocomireSpeedway),
    %elevator(0),
    %direction(7),
    %doorPos($C6, $2D),
    %screenPos($0C, 2),
    %spawnDistance($01C0),
    %doorASM(0))

Door_HiJumpBoots_0:
    %DoorHeader(\
    %destination(RoomHeader_HiJumpETank),
    %elevator(0),
    %direction(4),
    %doorPos(1, $16),
    %screenPos(0, 1),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_0_2_Green))

Door_CrocomireEscape_0:
    %DoorHeader(\
    %destination(RoomHeader_BusinessCenter),
    %elevator(0),
    %direction(5),
    %doorPos($0E, $66),
    %screenPos(0, 6),
    %spawnDistance($8000),
    %doorASM(0))

Door_CrocomireEscape_1:
    %DoorHeader(\
    %destination(RoomHeader_CrocomireSpeedway),
    %elevator(0),
    %direction(4),
    %doorPos($C1, 6),
    %screenPos($0C, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_HiJumpETank_0:
    %DoorHeader(\
    %destination(RoomHeader_BusinessCenter),
    %elevator(0),
    %direction(4),
    %doorPos(1, $56),
    %screenPos(0, 5),
    %spawnDistance($8000),
    %doorASM(0))

Door_HiJumpETank_1:
    %DoorHeader(\
    %destination(RoomHeader_HiJumpBoots),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_PostCrocFarming_0:
    %DoorHeader(\
    %destination(RoomHeader_Crocomire),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_0_1_Blue))

Door_PostCrocFarming_1:
    %DoorHeader(\
    %destination(RoomHeader_PostCrocPowerBombs),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_PostCrocFarming_2:
    %DoorHeader(\
    %destination(RoomHeader_PostCrocShaft),
    %elevator(0),
    %direction(6),
    %doorPos(6, 2),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_PostCrocFarming_3:
    %DoorHeader(\
    %destination(RoomHeader_PostCrocSave),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_PostCrocSave_0:
    %DoorHeader(\
    %destination(RoomHeader_PostCrocFarming),
    %elevator(0),
    %direction(5),
    %doorPos($1E, $16),
    %screenPos(1, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_PostCrocPowerBombs_0:
    %DoorHeader(\
    %destination(RoomHeader_PostCrocFarming),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_PostCrocShaft_0:
    %DoorHeader(\
    %destination(RoomHeader_PostCrocFarming),
    %elevator(0),
    %direction(7),
    %doorPos(6, $1D),
    %screenPos(0, 1),
    %spawnDistance($01C0),
    %doorASM(0))

Door_PostCrocShaft_1:
    %DoorHeader(\
    %destination(RoomHeader_GrappleTutorial3),
    %elevator(0),
    %direction(5),
    %doorPos($2E, 6),
    %screenPos(2, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_PostCrocShaft_2:
    %DoorHeader(\
    %destination(RoomHeader_PostCrocMissile),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_PostCrocShaft_3:
    %DoorHeader(\
    %destination(RoomHeader_PostCrocJump),
    %elevator(0),
    %direction(6),
    %doorPos($66, $22),
    %screenPos(6, 2),
    %spawnDistance($0140),
    %doorASM(0))

Door_PostCrocMissile_0:
    %DoorHeader(\
    %destination(RoomHeader_PostCrocShaft),
    %elevator(0),
    %direction(5),
    %doorPos($0E, $36),
    %screenPos(0, 3),
    %spawnDistance($8000),
    %doorASM(0))

Door_GrappleTutorial3_0:
    %DoorHeader(\
    %destination(RoomHeader_GrappleTutorial2),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_GrappleTutorial3_1:
    %DoorHeader(\
    %destination(RoomHeader_PostCrocShaft),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_PostCrocJump_0:
    %DoorHeader(\
    %destination(RoomHeader_PostCrocShaft),
    %elevator(0),
    %direction(7),
    %doorPos(6, $4D),
    %screenPos(0, 4),
    %spawnDistance($01C0),
    %doorASM(0))

Door_PostCrocJump_1:
    %DoorHeader(\
    %destination(RoomHeader_GrappleBeam),
    %elevator(0),
    %direction(5),
    %doorPos($0E, $26),
    %screenPos(0, 2),
    %spawnDistance($8000),
    %doorASM(0))

Door_GrappleTutorial2_0:
    %DoorHeader(\
    %destination(RoomHeader_GrappleTutorial1),
    %elevator(0),
    %direction(5),
    %doorPos($1E, 6),
    %screenPos(1, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_GrappleTutorial2_1:
    %DoorHeader(\
    %destination(RoomHeader_GrappleTutorial3),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_GrappleTutorial1_0:
    %DoorHeader(\
    %destination(RoomHeader_GrappleBeam),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_GrappleTutorial1_1:
    %DoorHeader(\
    %destination(RoomHeader_GrappleTutorial2),
    %elevator(0),
    %direction(4),
    %doorPos(1, $26),
    %screenPos(0, 2),
    %spawnDistance($8000),
    %doorASM(0))

Door_GrappleBeam_0:
    %DoorHeader(\
    %destination(RoomHeader_PostCrocJump),
    %elevator(0),
    %direction(4),
    %doorPos(1, $16),
    %screenPos(0, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_GrappleBeam_1:
    %DoorHeader(\
    %destination(RoomHeader_GrappleTutorial1),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_NorfairReserveTank:
    %DoorHeader(\
    %destination(RoomHeader_GreenBubblesMissiles),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_0_Blue_duplicate))

Door_GreenBubblesMissiles_0:
    %DoorHeader(\
    %destination(RoomHeader_BubbleMountain),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_GreenBubblesMissiles_1:
    %DoorHeader(\
    %destination(RoomHeader_NorfairReserveTank),
    %elevator(0),
    %direction(5),
    %doorPos($1E, 6),
    %screenPos(1, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_BubbleMountain_0:
    %DoorHeader(\
    %destination(RoomHeader_GreenBubblesMissiles),
    %elevator(0),
    %direction(5),
    %doorPos($1E, 6),
    %screenPos(1, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_BubbleMountain_1:
    %DoorHeader(\
    %destination(RoomHeader_RisingTide),
    %elevator(0),
    %direction(5),
    %doorPos($4E, 6),
    %screenPos(4, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_BubbleMountain_2:
    %DoorHeader(\
    %destination(RoomHeader_UpperNorfairFarming),
    %elevator(0),
    %direction(5),
    %doorPos($1E, 6),
    %screenPos(1, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_BubbleMountain_3:
    %DoorHeader(\
    %destination(RoomHeader_PurpleShaft),
    %elevator(0),
    %direction(6),
    %doorPos(6, 2),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_0_Blue_1_Red_duplicate))

Door_BubbleMountain_4:
    %DoorHeader(\
    %destination(RoomHeader_SingleChamber),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_BubbleMountain_5:
    %DoorHeader(\
    %destination(RoomHeader_BatCave),
    %elevator(0),
    %direction(4),
    %doorPos(1, $16),
    %screenPos(0, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_BubbleMountain_6:
    %DoorHeader(\
    %destination(RoomHeader_BubbleMountainSave),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_SpeedBoosterHall_0:
    %DoorHeader(\
    %destination(RoomHeader_BatCave),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_0_Blue_1_Red))

Door_SpeedBoosterHall_1:
    %DoorHeader(\
    %destination(RoomHeader_SpeedBooster),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_SpeedBooster_0:
    %DoorHeader(\
    %destination(RoomHeader_SpeedBoosterHall),
    %elevator(0),
    %direction(5),
    %doorPos($BE, $16),
    %screenPos($0B, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_SingleChamber_0:
    %DoorHeader(\
    %destination(RoomHeader_BubbleMountain),
    %elevator(0),
    %direction(5),
    %doorPos($1E, $16),
    %screenPos(1, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_SingleChamber_1:
    %DoorHeader(\
    %destination(RoomHeader_DoubleChamber),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_SingleChamber_2:
    %DoorHeader(\
    %destination(RoomHeader_DoubleChamber),
    %elevator(0),
    %direction(4),
    %doorPos(1, $16),
    %screenPos(0, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_SingleChamber_3:
    %DoorHeader(\
    %destination(RoomHeader_SpikyPlatformsTunnel),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_SingleChamber_4:
    %DoorHeader(\
    %destination(RoomHeader_ThreeMusketeers),
    %elevator(0),
    %direction(4),
    %doorPos($11, 6),
    %screenPos(1, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_DoubleChamber_0:
    %DoorHeader(\
    %destination(RoomHeader_SingleChamber),
    %elevator(0),
    %direction(5),
    %doorPos($0E, $16),
    %screenPos(0, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_DoubleChamber_1:
    %DoorHeader(\
    %destination(RoomHeader_SingleChamber),
    %elevator(0),
    %direction(5),
    %doorPos($0E, $26),
    %screenPos(0, 2),
    %spawnDistance($8000),
    %doorASM(0))

Door_DoubleChamber_2:
    %DoorHeader(\
    %destination(RoomHeader_WaveBeam),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_WaveBeam_0:
    %DoorHeader(\
    %destination(RoomHeader_DoubleChamber),
    %elevator(0),
    %direction(5),
    %doorPos($3E, 6),
    %screenPos(3, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_SpikyPlatformsTunnel_0:
    %DoorHeader(\
    %destination(RoomHeader_SingleChamber),
    %elevator(0),
    %direction(5),
    %doorPos($0E, $36),
    %screenPos(0, 3),
    %spawnDistance($8000),
    %doorASM(0))

Door_SpikyPlatformsTunnel_1:
    %DoorHeader(\
    %destination(RoomHeader_Volcano),
    %elevator(0),
    %direction(4),
    %doorPos($21, 6),
    %screenPos(2, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Volcano_0:
    %DoorHeader(\
    %destination(RoomHeader_SpikyPlatformsTunnel),
    %elevator(0),
    %direction(5),
    %doorPos($3E, 6),
    %screenPos(3, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Volcano_1:
    %DoorHeader(\
    %destination(RoomHeader_KronicBoost),
    %elevator(0),
    %direction(5),
    %doorPos($1E, 6),
    %screenPos(1, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_KronicBoost_0:
    %DoorHeader(\
    %destination(RoomHeader_MagdolliteTunnel),
    %elevator(0),
    %direction(5),
    %doorPos($2E, 6),
    %screenPos(2, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_KronicBoost_1:
    %DoorHeader(\
    %destination(RoomHeader_Volcano),
    %elevator(0),
    %direction(4),
    %doorPos(1, $26),
    %screenPos(0, 2),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_6_7_Blue_8_Red))

Door_KronicBoost_2:
    %DoorHeader(\
    %destination(RoomHeader_LavaDive),
    %elevator(0),
    %direction(5),
    %doorPos($3E, 6),
    %screenPos(3, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_KronicBoost_3:
    %DoorHeader(\
    %destination(RoomHeader_SpikyAcidSnakesTunnel),
    %elevator(0),
    %direction(5),
    %doorPos($3E, 6),
    %screenPos(3, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_MagdolliteTunnel_0:
    %DoorHeader(\
    %destination(RoomHeader_PurpleShaft),
    %elevator(0),
    %direction(5),
    %doorPos($0E, $26),
    %screenPos(0, 2),
    %spawnDistance($8000),
    %doorASM(0))

Door_MagdolliteTunnel_1:
    %DoorHeader(\
    %destination(RoomHeader_KronicBoost),
    %elevator(0),
    %direction(4),
    %doorPos($11, 6),
    %screenPos(1, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_PurpleShaft_0:
    %DoorHeader(\
    %destination(RoomHeader_BubbleMountain),
    %elevator(0),
    %direction(7),
    %doorPos(6, $3D),
    %screenPos(0, 3),
    %spawnDistance($01C0),
    %doorASM(0))

Door_PurpleShaft_1:
    %DoorHeader(\
    %destination(RoomHeader_MagdolliteTunnel),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_PurpleShaft_2:
    %DoorHeader(\
    %destination(RoomHeader_PurpleFarming),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_LavaDive_0:
    %DoorHeader(\
    %destination(RoomHeader_KronicBoost),
    %elevator(0),
    %direction(4),
    %doorPos($11, $26),
    %screenPos(1, 2),
    %spawnDistance($8000),
    %doorASM(0))

Door_LavaDive_1:
    %DoorHeader(\
    %destination(RoomHeader_LowerNorfairElev),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_LowerNorfairElev_0:
    %DoorHeader(\
    %destination(RoomHeader_LavaDive),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_LowerNorfairElev_1:
    %DoorHeader(\
    %destination(RoomHeader_MainHall),
    %elevator($A0),
    %direction(2),
    %doorPos(0, 0),
    %screenPos(4, 0),
    %spawnDistance(0),
    %doorASM(0))

Door_LowerNorfairElev_3:
    %DoorHeader(\
    %destination(RoomHeader_LNElevSave),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_UpperNorfairFarming_0:
    %DoorHeader(\
    %destination(RoomHeader_FrogSpeedway),
    %elevator(0),
    %direction(5),
    %doorPos($7E, 6),
    %screenPos(7, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_UpperNorfairFarming_1:
    %DoorHeader(\
    %destination(RoomHeader_BubbleMountain),
    %elevator(0),
    %direction(4),
    %doorPos(1, $36),
    %screenPos(0, 3),
    %spawnDistance($8000),
    %doorASM(0))

Door_UpperNorfairFarming_2:
    %DoorHeader(\
    %destination(RoomHeader_RedPirateShaft),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_RisingTide_0:
    %DoorHeader(\
    %destination(RoomHeader_Cathedral),
    %elevator(0),
    %direction(5),
    %doorPos($2E, $16),
    %screenPos(2, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_RisingTide_1:
    %DoorHeader(\
    %destination(RoomHeader_BubbleMountain),
    %elevator(0),
    %direction(4),
    %doorPos(1, $26),
    %screenPos(0, 2),
    %spawnDistance($8000),
    %doorASM(0))

Door_AcidSnakesTunnel_0:
    %DoorHeader(\
    %destination(RoomHeader_CrocomireSpeedway),
    %elevator(0),
    %direction(5),
    %doorPos($CE, $26),
    %screenPos($0C, 2),
    %spawnDistance($8000),
    %doorASM(0))

Door_AcidSnakesTunnel_1:
    %DoorHeader(\
    %destination(RoomHeader_UpperNorfairRefill),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_AcidSnakesTunnel_2:
    %DoorHeader(\
    %destination(RoomHeader_RedPirateShaft),
    %elevator(0),
    %direction(7),
    %doorPos(6, $2D),
    %screenPos(0, 2),
    %spawnDistance($0200),
    %doorASM(0))

Door_SpikyAcidSnakesTunnel_0:
    %DoorHeader(\
    %destination(RoomHeader_UpperNorfairRefill),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_SpikyAcidSnakesTunnel_1:
    %DoorHeader(\
    %destination(RoomHeader_KronicBoost),
    %elevator(0),
    %direction(4),
    %doorPos(1, $16),
    %screenPos(0, 1),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_2_Blue_3_Red))

Door_UpperNorfairRefill_0:
    %DoorHeader(\
    %destination(RoomHeader_AcidSnakesTunnel),
    %elevator(0),
    %direction(5),
    %doorPos($3E, 6),
    %screenPos(3, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_UpperNorfairRefill_1:
    %DoorHeader(\
    %destination(RoomHeader_SpikyAcidSnakesTunnel),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_PurpleFarming_0:
    %DoorHeader(\
    %destination(RoomHeader_PurpleShaft),
    %elevator(0),
    %direction(5),
    %doorPos($0E, $16),
    %screenPos(0, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_BatCave_0:
    %DoorHeader(\
    %destination(RoomHeader_BubbleMountain),
    %elevator(0),
    %direction(5),
    %doorPos($1E, 6),
    %screenPos(1, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_BatCave_1:
    %DoorHeader(\
    %destination(RoomHeader_SpeedBoosterHall),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_NorfairMap_0:
    %DoorHeader(\
    %destination(RoomHeader_BusinessCenter),
    %elevator(0),
    %direction(4),
    %doorPos(1, $46),
    %screenPos(0, 4),
    %spawnDistance($8000),
    %doorASM(0))

Door_BubbleMountainSave_0:
    %DoorHeader(\
    %destination(RoomHeader_BubbleMountain),
    %elevator(0),
    %direction(4),
    %doorPos(1, $16),
    %screenPos(0, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_FrogSpeedway_0:
    %DoorHeader(\
    %destination(RoomHeader_FrogSave),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_FrogSpeedway_1:
    %DoorHeader(\
    %destination(RoomHeader_UpperNorfairFarming),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_RedPirateShaft_0:
    %DoorHeader(\
    %destination(RoomHeader_UpperNorfairFarming),
    %elevator(0),
    %direction(4),
    %doorPos(1, $16),
    %screenPos(0, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_RedPirateShaft_1:
    %DoorHeader(\
    %destination(RoomHeader_AcidSnakesTunnel),
    %elevator(0),
    %direction(6),
    %doorPos($36, 2),
    %screenPos(3, 0),
    %spawnDistance($0140),
    %doorASM(0))

Door_FrogSave_0:
    %DoorHeader(\
    %destination(RoomHeader_FrogSpeedway),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_FrogSave_1:
    %DoorHeader(\
    %destination(RoomHeader_BusinessCenter),
    %elevator(0),
    %direction(5),
    %doorPos($0E, $56),
    %screenPos(0, 5),
    %spawnDistance($8000),
    %doorASM(0))

Door_CrocomireSave_0:
    %DoorHeader(\
    %destination(RoomHeader_CrocomireSpeedway),
    %elevator(0),
    %direction(5),
    %doorPos($AE, $16),
    %screenPos($0C, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_LNElevSave_0:
    %DoorHeader(\
    %destination(RoomHeader_LowerNorfairElev),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_AcidStatue_0:
    %DoorHeader(\
    %destination(RoomHeader_GoldenTorizo),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_0_Blue_1_2_3_Red))

Door_AcidStatue_1:
    %DoorHeader(\
    %destination(RoomHeader_MainHall),
    %elevator(0),
    %direction(4),
    %doorPos(1, $26),
    %screenPos(0, 2),
    %spawnDistance($8000),
    %doorASM(0))

Door_MainHall_0:
    %DoorHeader(\
    %destination(RoomHeader_AcidStatue),
    %elevator(0),
    %direction(5),
    %doorPos($1E, 6),
    %screenPos(1, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_MainHall_1:
    %DoorHeader(\
    %destination(RoomHeader_FastPillarsSetup),
    %elevator(0),
    %direction(4),
    %doorPos(1, $16),
    %screenPos(0, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_MainHall_2:
    %DoorHeader(\
    %destination(RoomHeader_LowerNorfairElev),
    %elevator($B0),
    %direction(3),
    %doorPos(0, 0),
    %screenPos(0, 0),
    %spawnDistance(0),
    %doorASM(0))

Door_GoldenTorizo_0:
    %DoorHeader(\
    %destination(RoomHeader_AcidStatue),
    %elevator(0),
    %direction(5),
    %doorPos($2E, $26),
    %screenPos(2, 2),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_3_4_Red_6_7_8_Blue))

Door_GoldenTorizo_1:
    %DoorHeader(\
    %destination(RoomHeader_ScrewAttack),
    %elevator(0),
    %direction(4),
    %doorPos(1, $26),
    %screenPos(0, 2),
    %spawnDistance($8000),
    %doorASM(0))

Door_FastRipper_0:
    %DoorHeader(\
    %destination(RoomHeader_ScrewAttack),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_FastRipper_1:
    %DoorHeader(\
    %destination(RoomHeader_FastPillarsSetup),
    %elevator(0),
    %direction(4),
    %doorPos(1, $26),
    %screenPos(0, 2),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_1_Red_2_Blue))

Door_GTEnergyRefill_0:
    %DoorHeader(\
    %destination(RoomHeader_ScrewAttack),
    %elevator(0),
    %direction(5),
    %doorPos($0E, $16),
    %screenPos(0, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_Ridley_0:
    %DoorHeader(\
    %destination(RoomHeader_RidleyETank),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Ridley_1:
    %DoorHeader(\
    %destination(RoomHeader_LNFarming),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_LNFarming_0:
    %DoorHeader(\
    %destination(RoomHeader_Ridley),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_LNFarming_1:
    %DoorHeader(\
    %destination(RoomHeader_Plowerhouse),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_FastPillarsSetup_0:
    %DoorHeader(\
    %destination(RoomHeader_MainHall),
    %elevator(0),
    %direction(5),
    %doorPos($7E, $26),
    %screenPos(7, 2),
    %spawnDistance($8000),
    %doorASM(0))

Door_FastPillarsSetup_1:
    %DoorHeader(\
    %destination(RoomHeader_MickeyMouse),
    %elevator(0),
    %direction(4),
    %doorPos(1, $36),
    %screenPos(0, 3),
    %spawnDistance($8000),
    %doorASM(0))

Door_FastPillarsSetup_2:
    %DoorHeader(\
    %destination(RoomHeader_MainHall),
    %elevator(0),
    %direction(5),
    %doorPos($7E, $26),
    %screenPos(7, 2),
    %spawnDistance($8000),
    %doorASM(0))

Door_FastPillarsSetup_3:
    %DoorHeader(\
    %destination(RoomHeader_FastRipper),
    %elevator(0),
    %direction(5),
    %doorPos($3E, 6),
    %screenPos(3, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_FastPillarsSetup_4:
    %DoorHeader(\
    %destination(RoomHeader_Pillar),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Door_83991E:
    %DoorHeader(\
    %destination(RoomHeader_FastPillarsSetup),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))
endif ; !FEATURE_KEEP_UNREFERENCED

Door_MickeyMouse_0:
    %DoorHeader(\
    %destination(RoomHeader_FastPillarsSetup),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_MickeyMouse_1:
    %DoorHeader(\
    %destination(RoomHeader_WorstRoomInTheGame),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_0_Green_duplicate))

Door_Pillar_0:
    %DoorHeader(\
    %destination(RoomHeader_FastPillarsSetup),
    %elevator(0),
    %direction(5),
    %doorPos($0E, $26),
    %screenPos(0, 2),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_1_Red_2_Blue))

Door_Pillar_1:
    %DoorHeader(\
    %destination(RoomHeader_WorstRoomInTheGame),
    %elevator(0),
    %direction(4),
    %doorPos(1, $56),
    %screenPos(0, 5),
    %spawnDistance($8000),
    %doorASM(0))

Door_Plowerhouse_0:
    %DoorHeader(\
    %destination(RoomHeader_LNFarming),
    %elevator(0),
    %direction(5),
    %doorPos($2E, 6),
    %screenPos(2, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Plowerhouse_1:
    %DoorHeader(\
    %destination(RoomHeader_MetalPirates),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_WorstRoomInTheGame_0:
    %DoorHeader(\
    %destination(RoomHeader_MickeyMouse),
    %elevator(0),
    %direction(5),
    %doorPos($3E, 6),
    %screenPos(3, 0),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_E_Red))

Door_WorstRoomInTheGame_1:
    %DoorHeader(\
    %destination(RoomHeader_Amphitheatre),
    %elevator(0),
    %direction(4),
    %doorPos(1, $16),
    %screenPos(0, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_WorstRoomInTheGame_2:
    %DoorHeader(\
    %destination(RoomHeader_Pillar),
    %elevator(0),
    %direction(5),
    %doorPos($3E, 6),
    %screenPos(3, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Amphitheatre_0:
    %DoorHeader(\
    %destination(RoomHeader_WorstRoomInTheGame),
    %elevator(0),
    %direction(5),
    %doorPos($0E, $16),
    %screenPos(0, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_Amphitheatre_1:
    %DoorHeader(\
    %destination(RoomHeader_RedKihunterShaft),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_0_Blue_3_Red))

Door_LNSpringBallMaze_0:
    %DoorHeader(\
    %destination(RoomHeader_ThreeMusketeers),
    %elevator(0),
    %direction(5),
    %doorPos($3E, $26),
    %screenPos(3, 2),
    %spawnDistance($8000),
    %doorASM(0))

Door_LNSpringBallMaze_1:
    %DoorHeader(\
    %destination(RoomHeader_LNFireflea),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_0_1_Blue_4_Red))

Door_LNSpringBallMaze_2:
    %DoorHeader(\
    %destination(RoomHeader_LNEscapePowerBombs),
    %elevator(0),
    %direction(6),
    %doorPos(6, 2),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_LNEscapePowerBombs_0:
    %DoorHeader(\
    %destination(RoomHeader_LNFireflea),
    %elevator(0),
    %direction(5),
    %doorPos($1E, 6),
    %screenPos(1, 0),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_1_Blue_4_Red))

Door_LNEscapePowerBombs_1:
    %DoorHeader(\
    %destination(RoomHeader_LNSpringBallMaze),
    %elevator(0),
    %direction(7),
    %doorPos($46, $0D),
    %screenPos(4, 0),
    %spawnDistance($01C0),
    %doorASM(DoorASM_Scroll_1_2_3_Blue_4_Green_6_Red))

Door_RedKihunterShaft_0:
    %DoorHeader(\
    %destination(RoomHeader_Wasteland),
    %elevator(0),
    %direction(6),
    %doorPos($56, 2),
    %screenPos(5, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_RedKihunterShaft_1:
    %DoorHeader(\
    %destination(RoomHeader_Amphitheatre),
    %elevator(0),
    %direction(5),
    %doorPos($3E, 6),
    %screenPos(3, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_RedKihunterShaft_2:
    %DoorHeader(\
    %destination(RoomHeader_LNFireflea),
    %elevator(0),
    %direction(4),
    %doorPos($11, $36),
    %screenPos(1, 3),
    %spawnDistance($8000),
    %doorASM(0))

Door_RedKihunterShaft_3:
    %DoorHeader(\
    %destination(RoomHeader_LNSave),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Wasteland_0:
    %DoorHeader(\
    %destination(RoomHeader_MetalPirates),
    %elevator(0),
    %direction(5),
    %doorPos($2E, 6),
    %screenPos(2, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Wasteland_1:
    %DoorHeader(\
    %destination(RoomHeader_RedKihunterShaft),
    %elevator(0),
    %direction(7),
    %doorPos($26, $4D),
    %screenPos(2, 4),
    %spawnDistance($0200),
    %doorASM(0))

Door_MetalPirates_0:
    %DoorHeader(\
    %destination(RoomHeader_Plowerhouse),
    %elevator(0),
    %direction(5),
    %doorPos($2E, 6),
    %screenPos(2, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_MetalPirates_1:
    %DoorHeader(\
    %destination(RoomHeader_Wasteland),
    %elevator(0),
    %direction(4),
    %doorPos($11, $26),
    %screenPos(1, 2),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_7_Green))

Door_ThreeMusketeers_0:
    %DoorHeader(\
    %destination(RoomHeader_SingleChamber),
    %elevator(0),
    %direction(5),
    %doorPos($5E, 6),
    %screenPos(5, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_ThreeMusketeers_1:
    %DoorHeader(\
    %destination(RoomHeader_LNSpringBallMaze),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_RidleyETank_0:
    %DoorHeader(\
    %destination(RoomHeader_Ridley),
    %elevator(0),
    %direction(4),
    %doorPos(1, $16),
    %screenPos(0, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_ScrewAttack_0:
    %DoorHeader(\
    %destination(RoomHeader_FastRipper),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_ScrewAttack_1:
    %DoorHeader(\
    %destination(RoomHeader_GTEnergyRefill),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_ScrewAttack_2:
    %DoorHeader(\
    %destination(RoomHeader_GoldenTorizo),
    %elevator(0),
    %direction(5),
    %doorPos($1E, $16),
    %screenPos(1, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_LNFireflea_0:
    %DoorHeader(\
    %destination(RoomHeader_LNSpringBallMaze),
    %elevator(0),
    %direction(5),
    %doorPos($1E, $16),
    %screenPos(1, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_LNFireflea_1:
    %DoorHeader(\
    %destination(RoomHeader_LNEscapePowerBombs),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_LNFireflea_2:
    %DoorHeader(\
    %destination(RoomHeader_RedKihunterShaft),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_0_Blue_3_Red_duplicate))

Door_LNSave_0:
    %DoorHeader(\
    %destination(RoomHeader_RedKihunterShaft),
    %elevator(0),
    %direction(5),
    %doorPos($0E, $36),
    %screenPos(0, 3),
    %spawnDistance($8000),
    %doorASM(0))


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
    %FXHeader(\
    %door(0),
    %baseY($01B0),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(1),
    %animTiles($0B),
    %paletteBlend(0))

FXHeader_WreckedShipEntrance_State1:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(1),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_Attic_State1:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(1),
    %animTiles($10),
    %paletteBlend(0))

FXHeader_AssemblyLine_State1:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(1),
    %animTiles($18),
    %paletteBlend(0))

FXHeader_WreckedShipMainShaft_State1:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(1),
    %animTiles(6),
    %paletteBlend(0))

FXHeader_SpikyDeath_State1:
    %FXHeader(\
    %door(0),
    %baseY($00A8),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $18),
    %liquidOptions(3),
    %paletteFX(1),
    %animTiles($0A),
    %paletteBlend($48))

FXHeader_ElectricDeath_State1:
    %FXHeader(\
    %door(0),
    %baseY($02A8),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $18),
    %liquidOptions(3),
    %paletteFX(1),
    %animTiles(2),
    %paletteBlend($48))

FXHeader_WreckedShipETank_State1:
    %FXHeader(\
    %door(0),
    %baseY($00B0),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $18),
    %liquidOptions($83),
    %paletteFX(1),
    %animTiles(6),
    %paletteBlend($48))

FXHeader_Basement_State1:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(1),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_WreckedShipMap_State1:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_Phantoon_State1:
    dw $FFFF

FXHeader_SpongeBath_State1:
    %FXHeader(\
    %door(0),
    %baseY($00A8),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $18),
    %liquidOptions(3),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend($48))

FXHeader_WSWestSuper_State1:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(1),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_WSEastSuper_State1:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(1),
    %animTiles(9),
    %paletteBlend(0))

FXHeader_GravitySuit_State1_WreckedShipSave_State1:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(1),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_BowlingAlley_State0:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig($28, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_WreckedShipEntrance_State0:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_Attic_State0:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(8, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_AssemblyLine_State0:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_WreckedShipMainShaft_State0:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(8, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_SpikyDeath_State0:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_ElectricDeath_State0:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_WreckedShipETank_State0:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_Basement_State0:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig($28, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_WreckedShipMap_State0:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(8, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_Phantoon_State0:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_SpongeBath_State0:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_WSWestSuper_State0:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_VariousRooms_State0_839C74:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_GlassTunnelSave:
    %FXHeader(\
    %door(0),
    %baseY($0010),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $14),
    %liquidOptions($82),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend($E2))

FXHeader_GlassTunnel_State0_1:
    %FXHeader(\
    %door(0),
    %baseY($0010),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $14),
    %liquidOptions($84),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend($E2))

FXHeader_WestTunnel:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig($2A, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_EastTunnel:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig($2A, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_MainStreet:
    %FXHeader(\
    %door(0),
    %baseY($0010),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $14),
    %liquidOptions($83),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend($E2))

FXHeader_FishTank:
    %FXHeader(\
    %door(0),
    %baseY($0010),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $14),
    %liquidOptions($83),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend($E2))

FXHeader_MamaTurtle:
    %FXHeader(\
    %door(0),
    %baseY($02BA),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $14),
    %liquidOptions($80),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend($E2))

FXHeader_CrabTunnel:
    %FXHeader(\
    %door(0),
    %baseY($0010),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $14),
    %liquidOptions($80),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend($E2))

FXHeader_MtEverest:
    %FXHeader(\
    %door(0),
    %baseY($0010),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $14),
    %liquidOptions($83),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend($E2))

FXHeader_RedFish:
    %FXHeader(\
    %door(0),
    %baseY($0180),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $14),
    %liquidOptions($81),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend($E2))

FXHeader_WateringHole:
    %FXHeader(\
    %door(0),
    %baseY($01B5),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $14),
    %liquidOptions($83),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend($42))

FXHeader_NWestMaridiaBug:
    %FXHeader(\
    %door(0),
    %baseY($01B5),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $14),
    %liquidOptions($83),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend($42))

FXHeader_CrabShaft:
    %FXHeader(\
    %door(0),
    %baseY($0010),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $14),
    %liquidOptions($81),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend($E2))

FXHeader_PseudoPlasmaSpark:
    %FXHeader(\
    %door(0),
    %baseY($01B5),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $14),
    %liquidOptions($83),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend($42))

FXHeader_CrabHole:
    %FXHeader(\
    %door(0),
    %baseY($0010),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $14),
    %liquidOptions($80),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend($E2))

FXHeader_WestSandHallTunnel:
    %FXHeader(\
    %door(0),
    %baseY($0010),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $14),
    %liquidOptions($80),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend($E2))

FXHeader_PlasmaTutorial:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig($28, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend($42))

FXHeader_Plasma:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig($2A, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend($42))

FXHeader_ThreadTheNeedle:
    %FXHeader(\
    %door(0),
    %baseY($00B5),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $14),
    %liquidOptions($83),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend($42))

FXHeader_MaridiaElev:
    %FXHeader(\
    %door(0),
    %baseY($05B5),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $14),
    %liquidOptions($83),
    %paletteFX(0),
    %animTiles(2),
    %paletteBlend($42))

FXHeader_PlasmaSpark:
    %FXHeader(\
    %door(0),
    %baseY($03B4),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $14),
    %liquidOptions($83),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend($42))

FXHeader_Kassiuz:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig($28, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend($42))

FXHeader_MaridiaMap:
    %FXHeader(\
    %door(0),
    %baseY($0010),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $14),
    %liquidOptions($82),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend($E2))

FXHeader_ForgottenHighwaySave:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend($42))

FXHeader_Toilet:
    %FXHeader(\
    %door(Door_PlasmaSpark_1),
    %baseY($0080),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $14),
    %liquidOptions($85),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend($E8))

FXHeader_Toilet_Part2:
    %FXHeader(\
    %door(Door_Oasis_2),
    %baseY($0080),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $14),
    %liquidOptions($85),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend($E8))

FXHeader_Toilet_Part3:
    %FXHeader(\
    %door(0),
    %baseY($0080),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $14),
    %liquidOptions($81),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend($E8))

FXHeader_BugSandHole:
    %FXHeader(\
    %door(0),
    %baseY($00B5),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $14),
    %liquidOptions($83),
    %paletteFX(1),
    %animTiles(0),
    %paletteBlend($42))

FXHeader_WestSandHall:
    %FXHeader(\
    %door(0),
    %baseY($0010),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $14),
    %liquidOptions($82),
    %paletteFX(1),
    %animTiles($0C),
    %paletteBlend($E8))

FXHeader_Oasis:
    %FXHeader(\
    %door(0),
    %baseY($0010),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $14),
    %liquidOptions($82),
    %paletteFX(1),
    %animTiles(0),
    %paletteBlend($E8))

FXHeader_EastSandHall:
    %FXHeader(\
    %door(0),
    %baseY($0010),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $14),
    %liquidOptions($82),
    %paletteFX(1),
    %animTiles($0C),
    %paletteBlend($E8))

FXHeader_WestSandHole:
    %FXHeader(\
    %door(0),
    %baseY($00D6),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $14),
    %liquidOptions(3),
    %paletteFX(1),
    %animTiles($0C),
    %paletteBlend($EE))

FXHeader_EastSandHole:
    %FXHeader(\
    %door(0),
    %baseY($00D6),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $14),
    %liquidOptions(3),
    %paletteFX(1),
    %animTiles($0C),
    %paletteBlend($EE))

FXHeader_EastAqueductQuicksand_WestAqueductQuicksand:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig($2A, 2),
    %liquidOptions(0),
    %paletteFX(2),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_Aqueduct:
    %FXHeader(\
    %door(0),
    %baseY($0010),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $14),
    %liquidOptions($83),
    %paletteFX(1),
    %animTiles(0),
    %paletteBlend($EE))

FXHeader_Butterfly:
    %FXHeader(\
    %door(0),
    %baseY($0049),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $14),
    %liquidOptions($83),
    %paletteFX(1),
    %animTiles($0C),
    %paletteBlend($42))

FXHeader_BotwoonHallway:
    %FXHeader(\
    %door(0),
    %baseY($0010),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $14),
    %liquidOptions($83),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend($EE))

FXHeader_Pants:
    %FXHeader(\
    %door(0),
    %baseY($02B0),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $14),
    %liquidOptions($82),
    %paletteFX(1),
    %animTiles(0),
    %paletteBlend($E8))

FXHeader_EastPants:
    %FXHeader(\
    %door(0),
    %baseY($00B0),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $14),
    %liquidOptions($82),
    %paletteFX(1),
    %animTiles(0),
    %paletteBlend($E8))

FXHeader_Springball:
    %FXHeader(\
    %door(0),
    %baseY($00B0),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $14),
    %liquidOptions($82),
    %paletteFX(1),
    %animTiles(0),
    %paletteBlend($E8))

FXHeader_BelowBotwoonETank:
    %FXHeader(\
    %door(0),
    %baseY($0048),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $14),
    %liquidOptions(3),
    %paletteFX(1),
    %animTiles($0C),
    %paletteBlend($EE))

FXHeader_Colosseum:
    %FXHeader(\
    %door(0),
    %baseY($0117),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $16),
    %liquidOptions(1),
    %paletteFX(5),
    %animTiles(2),
    %paletteBlend($EE))

FXHeader_AqueductSave:
    %FXHeader(\
    %door(0),
    %baseY($0010),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $14),
    %liquidOptions($82),
    %paletteFX(2),
    %animTiles(0),
    %paletteBlend($42))

FXHeader_ThePrecious_State0_1:
    %FXHeader(\
    %door(0),
    %baseY($00BF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $14),
    %liquidOptions($83),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend($EE))

FXHeader_BotwoonETank:
    %FXHeader(\
    %door(0),
    %baseY($0010),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $14),
    %liquidOptions($83),
    %paletteFX(1),
    %animTiles(0),
    %paletteBlend($EE))

FXHeader_DraygonSave:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend($EE))

FXHeader_MaridiaMissileRefill:
    %FXHeader(\
    %door(0),
    %baseY(0),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $14),
    %liquidOptions(3),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend($EE))

FXHeader_PlasmaBeachQuicksand_BotwoonQuicksand:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig($2A, 2),
    %liquidOptions(0),
    %paletteFX(2),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_Shaktool_State0_1:
    %FXHeader(\
    %door(0),
    %baseY($00B0),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $14),
    %liquidOptions($82),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend($E8))

FXHeader_HalfieClimb:
    %FXHeader(\
    %door(0),
    %baseY($0135),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $16),
    %liquidOptions(3),
    %paletteFX(4),
    %animTiles(2),
    %paletteBlend($EE))

FXHeader_Botwoon_State0_1:
    %FXHeader(\
    %door(0),
    %baseY($0010),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $14),
    %liquidOptions($83),
    %paletteFX(2),
    %animTiles(0),
    %paletteBlend($EE))

FXHeader_SpaceJump:
    %FXHeader(\
    %door(0),
    %baseY($0010),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $14),
    %liquidOptions($83),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend($EE))

FXHeader_MaridiaEnergyRefill:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend($EE))

FXHeader_WestCactusAlley:
    %FXHeader(\
    %door(0),
    %baseY($00B9),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $14),
    %liquidOptions($83),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend($EE))

FXHeader_EastCactusAlley:
    %FXHeader(\
    %door(0),
    %baseY($0135),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $16),
    %liquidOptions(1),
    %paletteFX(4),
    %animTiles(2),
    %paletteBlend($EE))

FXHeader_Draygon_State0_1:
    %FXHeader(\
    %door(0),
    %baseY($0010),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(6),
    %layerBlendConfig(2, $14),
    %liquidOptions($81),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend($42))

FXHeader_TourianFirst:
    %FXHeader(\
    %door(0),
    %baseY($03BC),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(4),
    %layerBlendConfig(2, $1E),
    %liquidOptions(1),
    %paletteFX(2),
    %animTiles(0),
    %paletteBlend(2))

FXHeader_Metroids1_State0_1:
    %FXHeader(\
    %door(0),
    %baseY($00D0),
    %targetY($FFFF),
    %velocity(0),
    %timer($10),
    %FXType(4),
    %layerBlendConfig(2, $1e),
    %liquidOptions(1),
    %paletteFX(2),
    %animTiles(0),
    %paletteBlend(2))

FXHeader_Metroids2_State0_1:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(2),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_Metroids3_State0_1:
    %FXHeader(\
    %door(0),
    %baseY($00D0),
    %targetY($FFFF),
    %velocity(0),
    %timer($10),
    %FXType(4),
    %layerBlendConfig(2, $1e),
    %liquidOptions(1),
    %paletteFX(2),
    %animTiles(0),
    %paletteBlend(2))

FXHeader_Metroids4_State0_1:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(2),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_BlueHopper_State0_1:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(2),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_DustTorizo_State0_1:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(2),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_BigBoy_State0_1:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(2),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_Seaweed:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(2),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_TourianRecharge:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_MotherBrain_State0_1:
    %FXHeader(\
    %door(0),
    %baseY($00E8),
    %targetY($FFFF),
    %velocity(0),
    %timer($10),
    %FXType(4),
    %layerBlendConfig(2, $1e),
    %liquidOptions(1),
    %paletteFX(2),
    %animTiles(0),
    %paletteBlend(2))

FXHeader_SetByMotherBrain_0:
    %FXHeader(\
    %door(0),
    %baseY($00E8),
    %targetY($00B8),
    %velocity($FFF0),
    %timer($10),
    %FXType(4),
    %layerBlendConfig(2, $1E),
    %liquidOptions(1),
    %paletteFX(2),
    %animTiles(0),
    %paletteBlend(2))

FXHeader_SetByMotherBrain_1:
    %FXHeader(\
    %door(0),
    %baseY($00B8),
    %targetY($00E8),
    %velocity($0030),
    %timer($10),
    %FXType(4),
    %layerBlendConfig(2, $1E),
    %liquidOptions(1),
    %paletteFX(2),
    %animTiles(0),
    %paletteBlend(2))

FXHeader_TourianEyeDoor:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(2),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_RinkaShaft:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(2),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_MotherBrainSave:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_TourianEscape1:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX($78),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_TourianEscape2:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX($70),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_TourianEscape3:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType(0),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX($70),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_ToruianEscaper4:
    %FXHeader(\
    %door(0),
    %baseY($05E0),
    %targetY($0010),
    %velocity(0),
    %timer($40),
    %FXType(4),
    %layerBlendConfig(2, $1E),
    %liquidOptions(1),
    %paletteFX($70),
    %animTiles(2),
    %paletteBlend(0))

FXHeader_UpperTourianSave:
    dw $FFFF

FXHeader_CeresElev_State0_1:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType($2A),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(0))

FXHeader_FallingTile_State0:
    dw $FFFF

FXHeader_MagnetStairs_State0:
    dw $FFFF

FXHeader_DeadScientist_State0:
    dw $FFFF

FXHeader_58Escape_State0:
    dw $FFFF

FXHeader_CeresRidley_State0:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType($28),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(0))

if !FEATURE_KEEP_UNREFERENCED
UNUSED_FXHeader_83A16E:
    %FXHeader(\
    %door(0),
    %baseY($FFFF),
    %targetY($FFFF),
    %velocity(0),
    %timer(0),
    %FXType($2A),
    %layerBlendConfig(2, 2),
    %liquidOptions(0),
    %paletteFX(0),
    %animTiles(0),
    %paletteBlend(0))
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
Door_MaridiaElev_3_TourianFirst_2:
    dw $0000

Door_BowlingAlley_0:
    %DoorHeader(\
    %destination(RoomHeader_WestOcean),
    %elevator($40),
    %direction(5),
    %doorPos($7E, $16),
    %screenPos(7, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_BowlingAlley_1:
    %DoorHeader(\
    %destination(RoomHeader_PreBowling),
    %elevator($40),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_BowlingAlley_2:
    %DoorHeader(\
    %destination(RoomHeader_GravitySuit),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_WreckedShipEntrance_0:
    %DoorHeader(\
    %destination(RoomHeader_WestOcean),
    %elevator($40),
    %direction(5),
    %doorPos($7E, $46),
    %screenPos(7, 4),
    %spawnDistance($8000),
    %doorASM(0))

Door_WreckedShipEntrance_1:
    %DoorHeader(\
    %destination(RoomHeader_WreckedShipMainShaft),
    %elevator(0),
    %direction(4),
    %doorPos($41, $36),
    %screenPos(4, 3),
    %spawnDistance($8000),
    %doorASM(0))

Door_Attic_0:
    %DoorHeader(\
    %destination(RoomHeader_WreckedShipMainShaft),
    %elevator(0),
    %direction(6),
    %doorPos($46, 2),
    %screenPos(4, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Attic_1:
    %DoorHeader(\
    %destination(RoomHeader_AssemblyLine),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Attic_2:
    %DoorHeader(\
    %destination(RoomHeader_WestOcean),
    %elevator($40),
    %direction(5),
    %doorPos($7E, 6),
    %screenPos(7, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_AssemblyLine_0:
    %DoorHeader(\
    %destination(RoomHeader_Attic),
    %elevator(0),
    %direction(5),
    %doorPos($6E, 6),
    %screenPos(6, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_WreckedShipMainShaft_0:
    %DoorHeader(\
    %destination(RoomHeader_WreckedShipEntrance),
    %elevator(0),
    %direction(5),
    %doorPos($3E, 6),
    %screenPos(3, 0),
    %spawnDistance($8000),
    %doorASM(DoorASM_StartWreckedShipTreadmillEastEntrance))

Door_WreckedShipMainShaft_1:
    %DoorHeader(\
    %destination(RoomHeader_SpongeBath),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_WreckedShipMainShaft_2:
    %DoorHeader(\
    %destination(RoomHeader_WSWestSuper),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_WreckedShipMainShaft_3:
    %DoorHeader(\
    %destination(RoomHeader_Basement),
    %elevator(0),
    %direction(6),
    %doorPos($26, 2),
    %screenPos(2, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_WreckedShipMainShaft_4:
    %DoorHeader(\
    %destination(RoomHeader_Attic),
    %elevator(0),
    %direction(7),
    %doorPos($46, $0E),
    %screenPos(4, 0),
    %spawnDistance($01C0),
    %doorASM(0))

Door_WreckedShipMainShaft_5:
    %DoorHeader(\
    %destination(RoomHeader_WSEastSuper),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_WreckedShipMainShaft_6:
    %DoorHeader(\
    %destination(RoomHeader_WreckedShipSave),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_SpikyDeath_0:
    %DoorHeader(\
    %destination(RoomHeader_SpongeBath),
    %elevator(0),
    %direction(5),
    %doorPos($1E, 6),
    %screenPos(1, 0),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_1_Blue))

Door_SpikyDeath_1:
    %DoorHeader(\
    %destination(RoomHeader_ElectricDeath),
    %elevator(0),
    %direction(4),
    %doorPos(1, $26),
    %screenPos(0, 2),
    %spawnDistance($8000),
    %doorASM(0))

Door_ElectricDeath_0:
    %DoorHeader(\
    %destination(RoomHeader_EastOcean),
    %elevator($40),
    %direction(4),
    %doorPos(1, $46),
    %screenPos(0, 4),
    %spawnDistance($8000),
    %doorASM(0))

Door_ElectricDeath_1:
    %DoorHeader(\
    %destination(RoomHeader_SpikyDeath),
    %elevator(0),
    %direction(5),
    %doorPos($1E, 6),
    %screenPos(1, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_ElectricDeath_2:
    %DoorHeader(\
    %destination(RoomHeader_WreckedShipETank),
    %elevator(0),
    %direction(5),
    %doorPos($2E, 6),
    %screenPos(2, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_WreckedShipETank_0:
    %DoorHeader(\
    %destination(RoomHeader_ElectricDeath),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_0_Green_duplicate_again))

Door_Basement_0:
    %DoorHeader(\
    %destination(RoomHeader_WreckedShipMainShaft),
    %elevator(0),
    %direction(7),
    %doorPos($46, $7D),
    %screenPos(4, 7),
    %spawnDistance($01C0),
    %doorASM(DoorASM_Scroll_28_2E_Green))

Door_Basement_1:
    %DoorHeader(\
    %destination(RoomHeader_WreckedShipMap),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Basement_2:
    %DoorHeader(\
    %destination(RoomHeader_Phantoon),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_WreckedShipMap_0:
    %DoorHeader(\
    %destination(RoomHeader_Basement),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Phantoon_0:
    %DoorHeader(\
    %destination(RoomHeader_Basement),
    %elevator(0),
    %direction(5),
    %doorPos($4E, 6),
    %screenPos(4, 0),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_3_Red_4_Blue))

Door_SpongeBath_0:
    %DoorHeader(\
    %destination(RoomHeader_WreckedShipMainShaft),
    %elevator(0),
    %direction(5),
    %doorPos($4E, $46),
    %screenPos(4, 4),
    %spawnDistance($8000),
    %doorASM(0))

Door_SpongeBath_1:
    %DoorHeader(\
    %destination(RoomHeader_SpikyDeath),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_WSWestSuper_0:
    %DoorHeader(\
    %destination(RoomHeader_WreckedShipMainShaft),
    %elevator(0),
    %direction(4),
    %doorPos($41, $66),
    %screenPos(4, 6),
    %spawnDistance($8000),
    %doorASM(0))

Door_WSEastSuper_0:
    %DoorHeader(\
    %destination(RoomHeader_WreckedShipMainShaft),
    %elevator(0),
    %direction(5),
    %doorPos($5E, $66),
    %screenPos(5, 6),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_29_Blue))

Door_GravitySuit_0:
    %DoorHeader(\
    %destination(RoomHeader_WestOcean),
    %elevator($40),
    %direction(5),
    %doorPos($5E, $36),
    %screenPos(5, 3),
    %spawnDistance($8000),
    %doorASM(0))

Door_GravitySuit_1:
    %DoorHeader(\
    %destination(RoomHeader_BowlingAlley),
    %elevator(0),
    %direction(4),
    %doorPos($11, $26),
    %screenPos(1, 2),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_6_7_8_9_A_B_Red))

Door_WreckedShipSave_0:
    %DoorHeader(\
    %destination(RoomHeader_WreckedShipMainShaft),
    %elevator(0),
    %direction(5),
    %doorPos($4E, $36),
    %screenPos(4, 3),
    %spawnDistance($8000),
    %doorASM(0))

Door_GlassTunnelSave_0:
    %DoorHeader(\
    %destination(RoomHeader_GlassTunnel),
    %elevator(0),
    %direction(5),
    %doorPos($0E, $26),
    %screenPos(0, 2),
    %spawnDistance($8000),
    %doorASM(0))

Door_GlassTunnel_0:
    %DoorHeader(\
    %destination(RoomHeader_MainStreet),
    %elevator(0),
    %direction(7),
    %doorPos($16, $7D),
    %screenPos(1, 7),
    %spawnDistance($0200),
    %doorASM(0))

Door_GlassTunnel_1:
    %DoorHeader(\
    %destination(RoomHeader_WestTunnel),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_GlassTunnel_2:
    %DoorHeader(\
    %destination(RoomHeader_EastTunnel),
    %elevator(0),
    %direction(4),
    %doorPos(1, $16),
    %screenPos(0, 1),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_0_Red_4_Blue_duplicate))

Door_GlassTunnel_3:
    %DoorHeader(\
    %destination(RoomHeader_GlassTunnelSave),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_WestTunnel_0:
    %DoorHeader(\
    %destination(RoomHeader_GlassTunnel),
    %elevator(0),
    %direction(0),
    %doorPos(0, 0),
    %screenPos(0, 1),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_0_2_Red_1_Blue))

Door_WestTunnel_1:
    %DoorHeader(\
    %destination(RoomHeader_BelowSpazer),
    %elevator($40),
    %direction(5),
    %doorPos($1E, $16),
    %screenPos(1, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_EastTunnel_0:
    %DoorHeader(\
    %destination(RoomHeader_GlassTunnel),
    %elevator(0),
    %direction(1),
    %doorPos(0, 0),
    %screenPos(0, 1),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_0_2_Red_1_Blue))

Door_EastTunnel_1:
    %DoorHeader(\
    %destination(RoomHeader_WarehouseEntrance),
    %elevator($40),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_EastTunnel_2:
    %DoorHeader(\
    %destination(RoomHeader_CrabHole),
    %elevator(0),
    %direction(4),
    %doorPos(1, $16),
    %screenPos(0, 1),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_0_Red_1_Blue))

Door_MainStreet_0:
    %DoorHeader(\
    %destination(RoomHeader_GlassTunnel),
    %elevator(0),
    %direction(6),
    %doorPos(6, 2),
    %screenPos(0, 0),
    %spawnDistance($0170),
    %doorASM(0))

Door_MainStreet_1:
    %DoorHeader(\
    %destination(RoomHeader_CrabTunnel),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_MainStreet_2:
    %DoorHeader(\
    %destination(RoomHeader_FishTank),
    %elevator(0),
    %direction(4),
    %doorPos(1, $26),
    %screenPos(0, 2),
    %spawnDistance($8000),
    %doorASM(0))

Door_MainStreet_3:
    %DoorHeader(\
    %destination(RoomHeader_MtEverest),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_MainStreet_4:
    %DoorHeader(\
    %destination(RoomHeader_MtEverest),
    %elevator(0),
    %direction(0),
    %doorPos(0, 0),
    %screenPos(1, 2),
    %spawnDistance($8000),
    %doorASM(0))

Door_FishTank_0:
    %DoorHeader(\
    %destination(RoomHeader_MainStreet),
    %elevator(0),
    %direction(5),
    %doorPos($2E, $66),
    %screenPos(2, 6),
    %spawnDistance($8000),
    %doorASM(0))

Door_FishTank_1:
    %DoorHeader(\
    %destination(RoomHeader_MamaTurtle),
    %elevator(0),
    %direction(4),
    %doorPos(1, $36),
    %screenPos(0, 3),
    %spawnDistance($8000),
    %doorASM(0))

Door_FishTank_2:
    %DoorHeader(\
    %destination(RoomHeader_MtEverest),
    %elevator(0),
    %direction(7),
    %doorPos($16, $3D),
    %screenPos(1, 3),
    %spawnDistance($01C0),
    %doorASM(0))

Door_FishTank_3:
    %DoorHeader(\
    %destination(RoomHeader_MtEverest),
    %elevator(0),
    %direction(7),
    %doorPos($46, $3D),
    %screenPos(4, 3),
    %spawnDistance($01C0),
    %doorASM(0))

Door_MamaTurtle_0:
    %DoorHeader(\
    %destination(RoomHeader_FishTank),
    %elevator(0),
    %direction(5),
    %doorPos($3E, $26),
    %screenPos(3, 2),
    %spawnDistance($8000),
    %doorASM(0))

Door_CrabTunnel_0:
    %DoorHeader(\
    %destination(RoomHeader_MainStreet),
    %elevator(0),
    %direction(5),
    %doorPos($1E, $76),
    %screenPos(1, 7),
    %spawnDistance($8000),
    %doorASM(0))

Door_CrabTunnel_1:
    %DoorHeader(\
    %destination(RoomHeader_CrabHole),
    %elevator(0),
    %direction(0),
    %doorPos(0, 0),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_MtEverest_0:
    %DoorHeader(\
    %destination(RoomHeader_RedFish),
    %elevator(0),
    %direction(7),
    %doorPos($26, $1D),
    %screenPos(2, 1),
    %spawnDistance($01C0),
    %doorASM(0))

Door_MtEverest_1:
    %DoorHeader(\
    %destination(RoomHeader_MainStreet),
    %elevator(0),
    %direction(5),
    %doorPos($1E, 6),
    %screenPos(1, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_MtEverest_2:
    %DoorHeader(\
    %destination(RoomHeader_FishTank),
    %elevator(0),
    %direction(6),
    %doorPos(6, 2),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_MtEverest_3:
    %DoorHeader(\
    %destination(RoomHeader_FishTank),
    %elevator(0),
    %direction(6),
    %doorPos($36, 2),
    %screenPos(3, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_MtEverest_4:
    %DoorHeader(\
    %destination(RoomHeader_MainStreet),
    %elevator(0),
    %direction(1),
    %doorPos(0, 0),
    %screenPos(2, 2),
    %spawnDistance($8000),
    %doorASM(0))

Door_MtEverest_5:
    %DoorHeader(\
    %destination(RoomHeader_CrabShaft),
    %elevator(0),
    %direction(4),
    %doorPos(1, $26),
    %screenPos(0, 2),
    %spawnDistance($8000),
    %doorASM(0))

Door_RedFish_0:
    %DoorHeader(\
    %destination(RoomHeader_MtEverest),
    %elevator(0),
    %direction(6),
    %doorPos($26, 2),
    %screenPos(2, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_RedFish_1:
    %DoorHeader(\
    %destination(RoomHeader_Caterpillar),
    %elevator($40),
    %direction(5),
    %doorPos($2E, $36),
    %screenPos(2, 3),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_9_Red_A_Blue))

Door_WateringHole_0:
    %DoorHeader(\
    %destination(RoomHeader_NWestMaridiaBug),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($0140),
    %doorASM(0))

Door_NWestMaridiaBug_0:
    %DoorHeader(\
    %destination(RoomHeader_WateringHole),
    %elevator(0),
    %direction(5),
    %doorPos($1E, 6),
    %screenPos(1, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_NWestMaridiaBug_1:
    %DoorHeader(\
    %destination(RoomHeader_PseudoPlasmaSpark),
    %elevator(0),
    %direction(4),
    %doorPos(1, $16),
    %screenPos(0, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_CrabShaft_0:
    %DoorHeader(\
    %destination(RoomHeader_MtEverest),
    %elevator(0),
    %direction(5),
    %doorPos($5E, 6),
    %screenPos(5, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_CrabShaft_1:
    %DoorHeader(\
    %destination(RoomHeader_PseudoPlasmaSpark),
    %elevator(0),
    %direction(7),
    %doorPos(6, $2D),
    %screenPos(0, 2),
    %spawnDistance($01C0),
    %doorASM(0))

Door_CrabShaft_2:
    %DoorHeader(\
    %destination(RoomHeader_Aqueduct),
    %elevator(0),
    %direction(4),
    %doorPos(1, $16),
    %screenPos(0, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_PseudoPlasmaSpark_0:
    %DoorHeader(\
    %destination(RoomHeader_NWestMaridiaBug),
    %elevator(0),
    %direction(5),
    %doorPos($3E, $16),
    %screenPos(3, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_PseudoPlasmaSpark_1:
    %DoorHeader(\
    %destination(RoomHeader_CrabShaft),
    %elevator(0),
    %direction(6),
    %doorPos(6, 2),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_PseudoPlasmaSpark_2:
    %DoorHeader(\
    %destination(RoomHeader_PlasmaSpark),
    %elevator(0),
    %direction(0),
    %doorPos(0, 0),
    %screenPos(0, 2),
    %spawnDistance($8000),
    %doorASM(0))

Door_CrabHole_0:
    %DoorHeader(\
    %destination(RoomHeader_CrabTunnel),
    %elevator(0),
    %direction(5),
    %doorPos($3E, 6),
    %screenPos(3, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_CrabHole_1:
    %DoorHeader(\
    %destination(RoomHeader_WestSandHallTunnel),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_CrabHole_2:
    %DoorHeader(\
    %destination(RoomHeader_EastTunnel),
    %elevator(0),
    %direction(5),
    %doorPos($3E, 6),
    %screenPos(3, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_CrabHole_3:
    %DoorHeader(\
    %destination(RoomHeader_MaridiaMap),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_WestSandHallTunnel_0:
    %DoorHeader(\
    %destination(RoomHeader_CrabHole),
    %elevator(0),
    %direction(1),
    %doorPos(0, 0),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_WestSandHallTunnel_1:
    %DoorHeader(\
    %destination(RoomHeader_WestSandHall),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_PlasmaTutorial_0:
    %DoorHeader(\
    %destination(RoomHeader_Kassiuz),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_PlasmaTutorial_1:
    %DoorHeader(\
    %destination(RoomHeader_Plasma),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Plasma_0:
    %DoorHeader(\
    %destination(RoomHeader_PlasmaTutorial),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_ThreadTheNeedle_0:
    %DoorHeader(\
    %destination(RoomHeader_BugSandHole),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_ThreadTheNeedle_1:
    %DoorHeader(\
    %destination(RoomHeader_MaridiaElev),
    %elevator(0),
    %direction(4),
    %doorPos(1, $56),
    %screenPos(0, 5),
    %spawnDistance($8000),
    %doorASM(0))

Door_MaridiaElev_0:
    %DoorHeader(\
    %destination(RoomHeader_ThreadTheNeedle),
    %elevator(0),
    %direction(5),
    %doorPos($6E, 6),
    %screenPos(6, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_MaridiaElev_1:
    %DoorHeader(\
    %destination(RoomHeader_ForgottenHighwaySave),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_MaridiaElev_2:
    %DoorHeader(\
    %destination(RoomHeader_ForgottenHighwayElev),
    %elevator($D0),
    %direction(3),
    %doorPos(0, 0),
    %screenPos(0, 0),
    %spawnDistance(0),
    %doorASM(0))

Door_PlasmaSpark_0:
    %DoorHeader(\
    %destination(RoomHeader_Butterfly),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_PlasmaSpark_1:
    %DoorHeader(\
    %destination(RoomHeader_Toilet),
    %elevator(0),
    %direction(2),
    %doorPos(0, 0),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(DoorASM_SetupElevatubeFromNorth))

Door_PlasmaSpark_2:
    %DoorHeader(\
    %destination(RoomHeader_Kassiuz),
    %elevator(0),
    %direction(4),
    %doorPos(1, $36),
    %screenPos(0, 3),
    %spawnDistance($8000),
    %doorASM(0))

Door_PlasmaSpark_3:
    %DoorHeader(\
    %destination(RoomHeader_BugSandHole),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Kassiuz_0:
    %DoorHeader(\
    %destination(RoomHeader_PlasmaSpark),
    %elevator(0),
    %direction(5),
    %doorPos($2E, $16),
    %screenPos(2, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_Kassiuz_1:
    %DoorHeader(\
    %destination(RoomHeader_PlasmaTutorial),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_MaridiaMap_0:
    %DoorHeader(\
    %destination(RoomHeader_CrabHole),
    %elevator(0),
    %direction(5),
    %doorPos($0E, $16),
    %screenPos(0, 1),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_0_Red_1_Blue))

Door_ForgottenHighwaySave_0:
    %DoorHeader(\
    %destination(RoomHeader_MaridiaElev),
    %elevator(0),
    %direction(5),
    %doorPos($0E, $46),
    %screenPos(0, 4),
    %spawnDistance($8000),
    %doorASM(0))

Door_Toilet_0:
    %DoorHeader(\
    %destination(RoomHeader_Oasis),
    %elevator(0),
    %direction(6),
    %doorPos(6, 2),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(DoorASM_ResetElevatubeOnSouthExit))

Door_Toilet_1:
    %DoorHeader(\
    %destination(RoomHeader_PlasmaSpark),
    %elevator(0),
    %direction(7),
    %doorPos(6, $2D),
    %screenPos(0, 2),
    %spawnDistance($0200),
    %doorASM(DoorASM_ResetElevatubeOnNorthExit))

Door_BugSandHole_0:
    %DoorHeader(\
    %destination(RoomHeader_ThreadTheNeedle),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_BugSandHole_1:
    %DoorHeader(\
    %destination(RoomHeader_PlasmaBeachQuicksand),
    %elevator(0),
    %direction(2),
    %doorPos(0, 0),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_BugSandHole_2:
    %DoorHeader(\
    %destination(RoomHeader_PlasmaSpark),
    %elevator(0),
    %direction(5),
    %doorPos($3E, $36),
    %screenPos(3, 3),
    %spawnDistance($8000),
    %doorASM(0))

Door_WestSandHall_0:
    %DoorHeader(\
    %destination(RoomHeader_WestSandHallTunnel),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_WestSandHall_1:
    %DoorHeader(\
    %destination(RoomHeader_Oasis),
    %elevator(0),
    %direction(4),
    %doorPos(1, $16),
    %screenPos(0, 1),
    %spawnDistance($8000),
    %doorASM(0))

UNUSED_Door_WestSandHall_2_83A654:
    %DoorHeader(\
    %destination(RoomHeader_WestSandHole),
    %elevator(0),
    %direction(3),
    %doorPos(0, 0),
    %screenPos(0, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_Oasis_0:
    %DoorHeader(\
    %destination(RoomHeader_WestSandHall),
    %elevator(0),
    %direction(5),
    %doorPos($3E, 6),
    %screenPos(3, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Oasis_1:
    %DoorHeader(\
    %destination(RoomHeader_EastSandHall),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Oasis_2:
    %DoorHeader(\
    %destination(RoomHeader_Toilet),
    %elevator(0),
    %direction(3),
    %doorPos(0, 0),
    %screenPos(0, 9),
    %spawnDistance($8000),
    %doorASM(DoorASM_SetupElevatubeFromSouth))

Door_EastSandHall_0:
    %DoorHeader(\
    %destination(RoomHeader_Oasis),
    %elevator(0),
    %direction(5),
    %doorPos($0E, $16),
    %screenPos(0, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_EastSandHall_1:
    %DoorHeader(\
    %destination(RoomHeader_Pants),
    %elevator(0),
    %direction(4),
    %doorPos(1, $36),
    %screenPos(0, 3),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_4_Red_duplicate))

UNUSED_Door_EastSandHall_2_83A69C:
    %DoorHeader(\
    %destination(RoomHeader_EastSandHole),
    %elevator(0),
    %direction(3),
    %doorPos(0, 0),
    %screenPos(1, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_WestSandHole_0:
    %DoorHeader(\
    %destination(RoomHeader_WestAqueductQuicksand),
    %elevator(0),
    %direction(3),
    %doorPos(0, 0),
    %screenPos(0, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_WestSandHole_1:
    %DoorHeader(\
    %destination(RoomHeader_WestSandHall),
    %elevator(0),
    %direction(2),
    %doorPos(0, 0),
    %screenPos(2, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_EastSandHole_0:
    %DoorHeader(\
    %destination(RoomHeader_EastAqueductQuicksand),
    %elevator(0),
    %direction(3),
    %doorPos(0, 0),
    %screenPos(0, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_EastSandHole_1:
    %DoorHeader(\
    %destination(RoomHeader_EastSandHall),
    %elevator(0),
    %direction(2),
    %doorPos(0, 0),
    %screenPos(1, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_WestAqueductQuicksand_0:
    %DoorHeader(\
    %destination(RoomHeader_Aqueduct),
    %elevator(0),
    %direction(3),
    %doorPos(0, 0),
    %screenPos(1, 2),
    %spawnDistance($8000),
    %doorASM(0))

Door_WestAqueductQuicksand_1:
    %DoorHeader(\
    %destination(RoomHeader_WestSandHole),
    %elevator(0),
    %direction(2),
    %doorPos(0, 0),
    %screenPos(1, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_EastAqueductQuicksand_0:
    %DoorHeader(\
    %destination(RoomHeader_Aqueduct),
    %elevator(0),
    %direction(3),
    %doorPos(0, 0),
    %screenPos(3, 2),
    %spawnDistance($8000),
    %doorASM(0))

Door_EastAqueductQuicksand_1:
    %DoorHeader(\
    %destination(RoomHeader_EastSandHole),
    %elevator(0),
    %direction(2),
    %doorPos(0, 0),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Aqueduct_0:
    %DoorHeader(\
    %destination(RoomHeader_CrabShaft),
    %elevator(0),
    %direction(5),
    %doorPos($1E, $36),
    %screenPos(1, 3),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_6_Blue))

Door_Aqueduct_1:
    %DoorHeader(\
    %destination(RoomHeader_WestAqueductQuicksand),
    %elevator(0),
    %direction(2),
    %doorPos(0, 0),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Aqueduct_2:
    %DoorHeader(\
    %destination(RoomHeader_EastAqueductQuicksand),
    %elevator(0),
    %direction(2),
    %doorPos(0, 0),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Aqueduct_3:
    %DoorHeader(\
    %destination(RoomHeader_BotwoonHallway),
    %elevator(0),
    %direction(7),
    %doorPos(6, $0D),
    %screenPos(0, 0),
    %spawnDistance($01C0),
    %doorASM(0))

Door_Aqueduct_4:
    %DoorHeader(\
    %destination(RoomHeader_BelowBotwoonETank),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Aqueduct_5:
    %DoorHeader(\
    %destination(RoomHeader_AqueductSave),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Butterfly_0:
    %DoorHeader(\
    %destination(RoomHeader_PlasmaSpark),
    %elevator(0),
    %direction(5),
    %doorPos($3E, $56),
    %screenPos(3, 5),
    %spawnDistance($8000),
    %doorASM(0))

Door_Butterfly_1:
    %DoorHeader(\
    %destination(RoomHeader_WestCactusAlley),
    %elevator(0),
    %direction(4),
    %doorPos(1, $16),
    %screenPos(0, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_BotwoonHallway_0:
    %DoorHeader(\
    %destination(RoomHeader_Aqueduct),
    %elevator(0),
    %direction(6),
    %doorPos(6, 2),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_BotwoonHallway_1:
    %DoorHeader(\
    %destination(RoomHeader_Botwoon),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Pants_0:
    %DoorHeader(\
    %destination(RoomHeader_EastSandHall),
    %elevator(0),
    %direction(5),
    %doorPos($2E, 6),
    %screenPos(2, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Pants_1:
    %DoorHeader(\
    %destination(RoomHeader_EastPants),
    %elevator(0),
    %direction(4),
    %doorPos(1, $26),
    %screenPos(0, 2),
    %spawnDistance($8000),
    %doorASM(0))

Door_Pants_2:
    %DoorHeader(\
    %destination(RoomHeader_Shaktool),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Pants_3:
    %DoorHeader(\
    %destination(RoomHeader_Pants),
    %elevator(0),
    %direction(5),
    %doorPos($0E, $36),
    %screenPos(0, 3),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_4_7_Red))

Door_EastPants_0:
    %DoorHeader(\
    %destination(RoomHeader_Pants),
    %elevator(0),
    %direction(5),
    %doorPos($0E, $36),
    %screenPos(0, 3),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_4_Red_duplicate))

Door_EastPants_1:
    %DoorHeader(\
    %destination(RoomHeader_Shaktool),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Springball_0:
    %DoorHeader(\
    %destination(RoomHeader_Shaktool),
    %elevator(0),
    %direction(5),
    %doorPos($3E, 6),
    %screenPos(3, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_BelowBotwoonETank_0:
    %DoorHeader(\
    %destination(RoomHeader_Aqueduct),
    %elevator(0),
    %direction(5),
    %doorPos($5E, $16),
    %screenPos(5, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_Colosseum_0:
    %DoorHeader(\
    %destination(RoomHeader_HalfieClimb),
    %elevator(0),
    %direction(1),
    %doorPos(0, 0),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Colosseum_1:
    %DoorHeader(\
    %destination(RoomHeader_DraygonSave),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Colosseum_2:
    %DoorHeader(\
    %destination(RoomHeader_ThePrecious),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Door_83A804:
    %DoorHeader(\
    %destination(RoomHeader_HalfieClimb),
    %elevator(0),
    %direction(1),
    %doorPos(0, 0),
    %screenPos(0, 2),
    %spawnDistance($8000),
    %doorASM(0))

UNUSED_Door_83A810:
    %DoorHeader(\
    %destination(RoomHeader_MaridiaMissileRefill),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))
endif ; !FEATURE_KEEP_UNREFERENCED

Door_ThePrecious_MaridiaLoad11:
    %DoorHeader(\
    %destination(RoomHeader_ThePrecious),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_AqueductSave_0:
    %DoorHeader(\
    %destination(RoomHeader_Aqueduct),
    %elevator(0),
    %direction(4),
    %doorPos(1, $26),
    %screenPos(0, 2),
    %spawnDistance($8000),
    %doorASM(0))

Door_ThePrecious_0:
    %DoorHeader(\
    %destination(RoomHeader_Colosseum),
    %elevator(0),
    %direction(5),
    %doorPos($6E, $16),
    %screenPos(6, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_ThePrecious_1:
    %DoorHeader(\
    %destination(RoomHeader_Draygon),
    %elevator(0),
    %direction(5),
    %doorPos($1E, 6),
    %screenPos(1, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_BotwoonETank_0:
    %DoorHeader(\
    %destination(RoomHeader_Botwoon),
    %elevator(0),
    %direction(5),
    %doorPos($1E, 6),
    %screenPos(1, 0),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_1_Blue_duplicate))

Door_BotwoonETank_1:
    %DoorHeader(\
    %destination(RoomHeader_BotwoonQuicksand),
    %elevator(0),
    %direction(2),
    %doorPos(0, 0),
    %screenPos(1, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_BotwoonETank_2:
    %DoorHeader(\
    %destination(RoomHeader_BotwoonQuicksand),
    %elevator(0),
    %direction(2),
    %doorPos(0, 0),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_BotwoonETank_3:
    %DoorHeader(\
    %destination(RoomHeader_HalfieClimb),
    %elevator(0),
    %direction(4),
    %doorPos(1, $26),
    %screenPos(0, 2),
    %spawnDistance($8000),
    %doorASM(0))

Door_DraygonSave_0:
    %DoorHeader(\
    %destination(RoomHeader_MaridiaEnergyRefill),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_DraygonSave_1:
    %DoorHeader(\
    %destination(RoomHeader_Colosseum),
    %elevator(0),
    %direction(5),
    %doorPos($6E, 6),
    %screenPos(6, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_MaridiaMissileRefill_0:
    %DoorHeader(\
    %destination(RoomHeader_HalfieClimb),
    %elevator(0),
    %direction(5),
    %doorPos($4E, $26),
    %screenPos(4, 2),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_A_Red_B_Blue))

Door_PlasmaBeachQuicksand_0:
    %DoorHeader(\
    %destination(RoomHeader_Butterfly),
    %elevator(0),
    %direction(2),
    %doorPos(0, 0),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_BotwoonQuicksand_0:
    %DoorHeader(\
    %destination(RoomHeader_BelowBotwoonETank),
    %elevator(0),
    %direction(2),
    %doorPos(0, 0),
    %screenPos(2, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_BotwoonQuicksand_1:
    %DoorHeader(\
    %destination(RoomHeader_BelowBotwoonETank),
    %elevator(0),
    %direction(2),
    %doorPos(0, 0),
    %screenPos(3, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Shaktool_0:
    %DoorHeader(\
    %destination(RoomHeader_EastPants),
    %elevator(0),
    %direction(5),
    %doorPos($0E, $16),
    %screenPos(0, 1),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_1_Blue_2_Red_duplicate))

Door_Shaktool_1:
    %DoorHeader(\
    %destination(RoomHeader_Springball),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_HalfieClimb_0:
    %DoorHeader(\
    %destination(RoomHeader_BotwoonETank),
    %elevator(0),
    %direction(5),
    %doorPos($6E, 6),
    %screenPos(6, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_HalfieClimb_1:
    %DoorHeader(\
    %destination(RoomHeader_Colosseum),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_HalfieClimb_2:
    %DoorHeader(\
    %destination(RoomHeader_MaridiaMissileRefill),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_HalfieClimb_3:
    %DoorHeader(\
    %destination(RoomHeader_EastCactusAlley),
    %elevator(0),
    %direction(5),
    %doorPos($4E, $16),
    %screenPos(4, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_Botwoon_0:
    %DoorHeader(\
    %destination(RoomHeader_BotwoonHallway),
    %elevator(0),
    %direction(5),
    %doorPos($3E, 6),
    %screenPos(3, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Botwoon_1:
    %DoorHeader(\
    %destination(RoomHeader_BotwoonETank),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_SpaceJump_0:
    %DoorHeader(\
    %destination(RoomHeader_Draygon),
    %elevator(0),
    %direction(4),
    %doorPos(1, $16),
    %screenPos(0, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_MaridiaEnergyRefill_0:
    %DoorHeader(\
    %destination(RoomHeader_DraygonSave),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_WestCactusAlley_0:
    %DoorHeader(\
    %destination(RoomHeader_Butterfly),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_WestCactusAlley_1:
    %DoorHeader(\
    %destination(RoomHeader_EastCactusAlley),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_EastCactusAlley_0:
    %DoorHeader(\
    %destination(RoomHeader_WestCactusAlley),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_EastCactusAlley_1:
    %DoorHeader(\
    %destination(RoomHeader_HalfieClimb),
    %elevator(0),
    %direction(4),
    %doorPos(1, $16),
    %screenPos(0, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_Draygon_0:
    %DoorHeader(\
    %destination(RoomHeader_ThePrecious),
    %elevator(0),
    %direction(4),
    %doorPos(1, $26),
    %screenPos(0, 2),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_0_2_Green_duplicate))

Door_Draygon_1:
    %DoorHeader(\
    %destination(RoomHeader_SpaceJump),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_TourianFirst_0:
    %DoorHeader(\
    %destination(RoomHeader_Metroids1),
    %elevator(0),
    %direction(5),
    %doorPos($5E, 6),
    %screenPos(5, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_TourianFirst_1:
    %DoorHeader(\
    %destination(RoomHeader_Statues),
    %elevator($D0),
    %direction(3),
    %doorPos(0, 0),
    %screenPos(0, 1),
    %spawnDistance(0),
    %doorASM(DoorASM_Scroll_0_1_Green_duplicate))

Door_TourianFirst_3:
    %DoorHeader(\
    %destination(RoomHeader_UpperTourianSave),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Metroids1_0:
    %DoorHeader(\
    %destination(RoomHeader_TourianFirst),
    %elevator(0),
    %direction(4),
    %doorPos(1, $36),
    %screenPos(0, 3),
    %spawnDistance($8000),
    %doorASM(0))

Door_Metroids1_1:
    %DoorHeader(\
    %destination(RoomHeader_Metroids2),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Metroids2_0:
    %DoorHeader(\
    %destination(RoomHeader_Metroids1),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Metroids2_1:
    %DoorHeader(\
    %destination(RoomHeader_Metroids3),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Metroids3_0:
    %DoorHeader(\
    %destination(RoomHeader_Metroids2),
    %elevator(0),
    %direction(5),
    %doorPos($0E, $16),
    %screenPos(0, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_Metroids3_1:
    %DoorHeader(\
    %destination(RoomHeader_Metroids4),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Metroids4_0:
    %DoorHeader(\
    %destination(RoomHeader_Metroids3),
    %elevator(0),
    %direction(5),
    %doorPos($5E, 6),
    %screenPos(5, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Metroids4_1:
    %DoorHeader(\
    %destination(RoomHeader_BlueHopper),
    %elevator(0),
    %direction(6),
    %doorPos($16, 3),
    %screenPos(1, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_BlueHopper_0:
    %DoorHeader(\
    %destination(RoomHeader_Metroids4),
    %elevator(0),
    %direction(7),
    %doorPos(6, $1E),
    %screenPos(0, 1),
    %spawnDistance($01C0),
    %doorASM(0))

Door_BlueHopper_1:
    %DoorHeader(\
    %destination(RoomHeader_DustTorizo),
    %elevator(0),
    %direction(5),
    %doorPos($1E, 6),
    %screenPos(1, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_DustTorizo_0:
    %DoorHeader(\
    %destination(RoomHeader_BlueHopper),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_DustTorizo_1:
    %DoorHeader(\
    %destination(RoomHeader_BigBoy),
    %elevator(0),
    %direction(5),
    %doorPos($3E, 6),
    %screenPos(3, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_BigBoy_0:
    %DoorHeader(\
    %destination(RoomHeader_DustTorizo),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_BigBoy_1:
    %DoorHeader(\
    %destination(RoomHeader_Seaweed),
    %elevator(0),
    %direction(1),
    %doorPos(0, 0),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Seaweed_0:
    %DoorHeader(\
    %destination(RoomHeader_BigBoy),
    %elevator(0),
    %direction(0),
    %doorPos(0, 0),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Seaweed_1:
    %DoorHeader(\
    %destination(RoomHeader_TourianEyeDoor),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_Seaweed_2:
    %DoorHeader(\
    %destination(RoomHeader_TourianRecharge),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_TourianRecharge_0:
    %DoorHeader(\
    %destination(RoomHeader_Seaweed),
    %elevator(0),
    %direction(4),
    %doorPos(1, $16),
    %screenPos(0, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_MotherBrain_0:
    %DoorHeader(\
    %destination(RoomHeader_RinkaShaft),
    %elevator(0),
    %direction(4),
    %doorPos(1, $26),
    %screenPos(0, 2),
    %spawnDistance($8000),
    %doorASM(0))

Door_MotherBrain_1:
    %DoorHeader(\
    %destination(RoomHeader_TourianEscape1),
    %elevator(0),
    %direction(9),
    %doorPos($1F, 6),
    %screenPos(1, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_TourianEyeDoor_0:
    %DoorHeader(\
    %destination(RoomHeader_Seaweed),
    %elevator(0),
    %direction(5),
    %doorPos($0E, $16),
    %screenPos(0, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_TourianEyeDoor_1:
    %DoorHeader(\
    %destination(RoomHeader_RinkaShaft),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_RinkaShaft_0:
    %DoorHeader(\
    %destination(RoomHeader_TourianEyeDoor),
    %elevator(0),
    %direction(5),
    %doorPos($3E, 6),
    %screenPos(3, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_RinkaShaft_1:
    %DoorHeader(\
    %destination(RoomHeader_MotherBrainSave),
    %elevator(0),
    %direction(5),
    %doorPos($0E, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_RinkaShaft_2:
    %DoorHeader(\
    %destination(RoomHeader_MotherBrain),
    %elevator(0),
    %direction(5),
    %doorPos($3E, 6),
    %screenPos(3, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_MotherBrainSave_0:
    %DoorHeader(\
    %destination(RoomHeader_RinkaShaft),
    %elevator(0),
    %direction(4),
    %doorPos(1, $16),
    %screenPos(0, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_TourianEscape1_0:
    %DoorHeader(\
    %destination(RoomHeader_MotherBrain),
    %elevator(0),
    %direction(4),
    %doorPos(1, 6),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_TourianEscape1_1:
    %DoorHeader(\
    %destination(RoomHeader_TourianEscape2),
    %elevator(0),
    %direction(6),
    %doorPos(6, 3),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_TourianEscape2_0:
    %DoorHeader(\
    %destination(RoomHeader_TourianEscape1),
    %elevator(0),
    %direction(7),
    %doorPos(6, $0C),
    %screenPos(0, 0),
    %spawnDistance($0200),
    %doorASM(0))

Door_TourianEscape2_1:
    %DoorHeader(\
    %destination(RoomHeader_TourianEscape3),
    %elevator(0),
    %direction(4),
    %doorPos(1, $16),
    %screenPos(0, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_TourianEscape3_0:
    %DoorHeader(\
    %destination(RoomHeader_TourianEscape2),
    %elevator(0),
    %direction(5),
    %doorPos($0E, $16),
    %screenPos(0, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_TourianEscape3_1:
    %DoorHeader(\
    %destination(RoomHeader_TourianEscape4),
    %elevator(0),
    %direction(4),
    %doorPos(1, $36),
    %screenPos(0, 3),
    %spawnDistance($8000),
    %doorASM(0))

Door_TourianEscape4_0:
    %DoorHeader(\
    %destination(RoomHeader_TourianEscape3),
    %elevator(0),
    %direction(5),
    %doorPos($5E, 6),
    %screenPos(5, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_TourianEscape4_1:
    %DoorHeader(\
    %destination(RoomHeader_Climb),
    %elevator($40),
    %direction(4),
    %doorPos(1, $86),
    %screenPos(0, 8),
    %spawnDistance($8000),
    %doorASM(DoorASM_Scroll_8_Blue_9_Red))

Door_UpperTourianSave_0:
    %DoorHeader(\
    %destination(RoomHeader_TourianFirst),
    %elevator(0),
    %direction(5),
    %doorPos($0E, $36),
    %screenPos(0, 3),
    %spawnDistance($8000),
    %doorASM(0))

Door_CeresElev_0:
    %DoorHeader(\
    %destination(RoomHeader_FallingTile),
    %elevator(0),
    %direction(0),
    %doorPos(0, 0),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(DoorASM_FromCeresElevatorShaft))

Door_FallingTile_0:
    %DoorHeader(\
    %destination(RoomHeader_CeresElev),
    %elevator(0),
    %direction(1),
    %doorPos(0, 0),
    %screenPos(0, 2),
    %spawnDistance($8000),
    %doorASM(DoorASM_ToCeresElevatorShaft))

Door_FallingTile_1:
    %DoorHeader(\
    %destination(RoomHeader_MagnetStairs),
    %elevator(0),
    %direction(0),
    %doorPos(0, 0),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_MagnetStairs_0:
    %DoorHeader(\
    %destination(RoomHeader_FallingTile),
    %elevator(0),
    %direction(1),
    %doorPos(0, 0),
    %screenPos(1, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_MagnetStairs_1:
    %DoorHeader(\
    %destination(RoomHeader_DeadScientist),
    %elevator(0),
    %direction(0),
    %doorPos(0, 0),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_DeadScientist_0:
    %DoorHeader(\
    %destination(RoomHeader_MagnetStairs),
    %elevator(0),
    %direction(1),
    %doorPos(0, 0),
    %screenPos(0, 1),
    %spawnDistance($8000),
    %doorASM(0))

Door_DeadScientist_1:
    %DoorHeader(\
    %destination(RoomHeader_58Escape),
    %elevator(0),
    %direction(0),
    %doorPos(0, 0),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_58Escape_0:
    %DoorHeader(\
    %destination(RoomHeader_DeadScientist),
    %elevator(0),
    %direction(1),
    %doorPos(0, 0),
    %screenPos(1, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_58Escape_1:
    %DoorHeader(\
    %destination(RoomHeader_CeresRidley),
    %elevator(0),
    %direction(0),
    %doorPos(0, 0),
    %screenPos(0, 0),
    %spawnDistance($8000),
    %doorASM(0))

Door_CeresRidley:
    %DoorHeader(\
    %destination(RoomHeader_58Escape),
    %elevator(0),
    %direction(1),
    %doorPos(0, 0),
    %screenPos(1, 0),
    %spawnDistance($8000),
    %doorASM(0))

; These four doors appear to be missing the elevator properties byte
UNUSED_Door_Debug_0_83ABC4:
; Debug load station
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
    dw RTL_88B278 ; 0: None
    dw FXType_2_Lava ; 2: Lava
    dw FXType_4_Acid ; 4: Acid
    dw FXType_6_Water ; 6: Water
    dw FXType_8_Spores ; 8: Spores
    dw FXType_A_Rain ; Ah: Rain
    dw FXType_C_Fog ; Ch: Fog
    dw RTL_88B278
    dw RTL_88B278
    dw RTL_88B278
    dw RTL_88B278
    dw RTL_88B278
    dw RTL_88B278
    dw RTL_88B278
    dw RTL_88B278
    dw RTL_88B278
    dw FXType_20_ScrollingSky_RoomSetupASM_ScrollingSkyLand ; 20h: Scrolling sky
    dw FXType_20_22_ScrollingSky ; 22h: Unused
    dw FXType_24_Fireflea ; 24h: Fireflea
    dw FXType_26_TourianEntranceStatue ; 26h: Tourian entrance statue
    dw FXType_28_CeresRidley ; 28h: Ceres Ridley
    dw FXType_2A_CeresElevator ; 2Ah: Ceres elevator
    dw FXType_2C_CeresHaze ; 2Ch: Ceres haze

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
    dw AnimatedTilesObjects_FX_brinstarPlant
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
