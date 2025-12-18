
; Enemy populations

org $A18000


;;; $8000: Enemy populations ;;;
; see labels.asm for EnemyPopulations:
; Enemy population format is:
;  ________________________________________ Enemy ID
; |      __________________________________ X position
; |     |     _____________________________ Y position
; |     |    |      _______________________ Initialisation parameter (Orientation in SMILE, Tilemaps in RF, Tilemap Parameter in SMART)
; |     |    |     |      _________________ Properties (Special in SMILE, Properties 1 in SMART)
; |     |    |     |     |     ____________ Extra properties (Special GFX in SMILE, Graphics in RF, Properties 2 in SMART)
; |     |    |     |     |    |      ______ Parameter 1 (Speed in SMILE)
; |     |    |     |     |    |     |     _ Parameter 2 (Speed 2 in SMILE)
; |     |    |     |     |    |     |    |
; iiii, xxxx,yyyy, oooo, pppp,gggg, aaaa,bbbb

;  ______ Terminator
; |     _ Number of enemy deaths needed to clear current room
; |    |
; FFFF nn

EnemyPopulations_Draygon_State1_MotherBrain_State2:
; Room $DA60, state $DA8C
; Room $DD58, state $DDA2
    dw $FFFF                                                             ;A18000; No death quota byte (off to a good start)

EnemyPopulations_EastOcean:                                              ;A18002;
; Room $94FD, state $950A
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Choot),
    %XPosition($0150),
    %YPosition($054C),
    %initParam(0),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0203, $0010))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Choot),
    %XPosition($0190),
    %YPosition($050C),
    %initParam(0),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0203, $0010))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Choot),
    %XPosition($0214),
    %YPosition($053C),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0203, $0010))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Choot),
    %XPosition($05C8),
    %YPosition($05BE),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0203, $0010))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Choot),
    %XPosition($00B0),
    %YPosition($051C),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0203, $0010))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Skultera),
    %XPosition($00FC),
    %YPosition($0563),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0110, $0210))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Skultera),
    %XPosition($01D5),
    %YPosition($0571),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0010, $0210))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Skultera),
    %XPosition($0314),
    %YPosition($0587),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0110, $0210))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Skultera),
    %XPosition($03C4),
    %YPosition($056B),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0010, $0210))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Skultera),
    %XPosition($04D5),
    %YPosition($0577),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0010, $0210))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Kamer2),
    %XPosition($04C0),
    %YPosition($04F0),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $2800))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Kamer2),
    %XPosition($03C0),
    %YPosition($04F0),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $2800))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Kamer2),
    %XPosition($02C8),
    %YPosition($04F0),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $2800))
    dw $FFFF : db $0A                                                    ;A180D2;

EnemyPopulations_CrateriaPowerBombs:
; Room $93AA, state $93B7
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Alcoon),
    %XPosition($0088),
    %YPosition($00D8),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Alcoon),
    %XPosition($0108),
    %YPosition($00D8),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Alcoon),
    %XPosition($0178),
    %YPosition($00D8),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $03                                                    ;A18105;

EnemyPopulations_Terminator:
; Room $990D, state $991A
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Waver),
    %XPosition($0316),
    %YPosition($015C),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Waver),
    %XPosition($0213),
    %YPosition($01E0),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Waver),
    %XPosition($0102),
    %YPosition($0262),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zoomer),
    %XPosition($0378),
    %YPosition($0130),
    %initParam($0003),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zoomer),
    %XPosition($0498),
    %YPosition($00A0),
    %initParam($0003),
    %properties($2001),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zoomer),
    %XPosition($02E9),
    %YPosition($01D6),
    %initParam($0003),
    %properties($2001),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zoomer),
    %XPosition($0207),
    %YPosition($024A),
    %initParam($0003),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zoomer),
    %XPosition($0178),
    %YPosition($0230),
    %initParam($0003),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zoomer),
    %XPosition($0298),
    %YPosition($01A0),
    %initParam($0003),
    %properties($2001),
    %extraProperties($0000),
    %speedParams($0002, $0000))
    dw $FFFF : db $09                                                    ;A18198;

EnemyPopulations_FinalMissileBombway_1:
; Room $9A44, state $9A70
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_FaceBlock),
    %XPosition($0100),
    %YPosition($0048),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_FaceBlock),
    %XPosition($0080),
    %YPosition($0048),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_FaceBlock),
    %XPosition($0180),
    %YPosition($0048),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_FaceBlock),
    %XPosition($0080),
    %YPosition($00B8),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_FaceBlock),
    %XPosition($0100),
    %YPosition($00B8),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_FaceBlock),
    %XPosition($0180),
    %YPosition($00B8),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $00                                                    ;A181FB;

EnemyPopulations_FinalMissileBombway_0:
; Room $9A44, state $9A56
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_FaceBlock),
    %XPosition($0100),
    %YPosition($0048),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_FaceBlock),
    %XPosition($0080),
    %YPosition($0048),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_FaceBlock),
    %XPosition($0180),
    %YPosition($0048),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_FaceBlock),
    %XPosition($0080),
    %YPosition($00B8),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_FaceBlock),
    %XPosition($0100),
    %YPosition($00B8),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_FaceBlock),
    %XPosition($0180),
    %YPosition($00B8),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $00                                                    ;A1825E;

EnemyPopulations_Parlor_1:
; Room $92FD, state $932E
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zoomer),
    %XPosition($0498),
    %YPosition($0040),
    %initParam($0002),
    %properties($2801),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zoomer),
    %XPosition($041F),
    %YPosition($0088),
    %initParam($0003),
    %properties($2801),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zoomer),
    %XPosition($0448),
    %YPosition($00B8),
    %initParam($0003),
    %properties($2001),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Skree),
    %XPosition($02FE),
    %YPosition($003B),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Skree),
    %XPosition($02BE),
    %YPosition($005B),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Skree),
    %XPosition($027E),
    %YPosition($003B),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zoomer),
    %XPosition($01A0),
    %YPosition($0178),
    %initParam($0003),
    %properties($2001),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Ripper),
    %XPosition($01B8),
    %YPosition($0228),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0010, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zoomer),
    %XPosition($0128),
    %YPosition($0438),
    %initParam($0000),
    %properties($2003),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zoomer),
    %XPosition($01D4),
    %YPosition($0438),
    %initParam($0003),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zoomer),
    %XPosition($0180),
    %YPosition($0408),
    %initParam($0003),
    %properties($2001),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zoomer),
    %XPosition($0168),
    %YPosition($0328),
    %initParam($0000),
    %properties($2002),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zoomer),
    %XPosition($01EA),
    %YPosition($02EA),
    %initParam($0001),
    %properties($2003),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zoomer),
    %XPosition($01C8),
    %YPosition($0278),
    %initParam($0003),
    %properties($2001),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zoomer),
    %XPosition($0181),
    %YPosition($0115),
    %initParam($0002),
    %properties($2001),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Ripper),
    %XPosition($03AD),
    %YPosition($01E8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0010, $0000))
    dw $FFFF : db $10                                                    ;A18361;

EnemyPopulations_Flyway_0_1:
; Room $9879, state $9890
; Room $9879, state $98AA
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Mellow),
    %XPosition($00ED),
    %YPosition($0061),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Mellow),
    %XPosition($015E),
    %YPosition($005C),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Mellow),
    %XPosition($011B),
    %YPosition($0060),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Mellow),
    %XPosition($0132),
    %YPosition($0049),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Mellow),
    %XPosition($013A),
    %YPosition($0065),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Mellow),
    %XPosition($00EA),
    %YPosition($0042),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Mellow),
    %XPosition($01CA),
    %YPosition($006B),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Mellow),
    %XPosition($0100),
    %YPosition($0076),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Mellow),
    %XPosition($019A),
    %YPosition($0058),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Mellow),
    %XPosition($0190),
    %YPosition($007E),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Mellow),
    %XPosition($017F),
    %YPosition($003E),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Mellow),
    %XPosition($01C2),
    %YPosition($0041),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $00                                                    ;A18424;

EnemyPopulations_Pit_1:
; Room $975C, state $9787
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGreyWalking),
    %XPosition($0268),
    %YPosition($0070),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($8001, $0010))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGreyWall),
    %XPosition($02CD),
    %YPosition($003F),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($0001, $0020))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGreyWalking),
    %XPosition($01F9),
    %YPosition($0070),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($8000, $0010))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGreyWalking),
    %XPosition($0178),
    %YPosition($0070),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($8001, $0010))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGreyWalking),
    %XPosition($0068),
    %YPosition($0080),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($8001, $0020))
    dw $FFFF : db $05                                                    ;A18477;

EnemyPopulations_GauntletEntrance:
; Room $92B3, state $92C5
; Room $92B3, state $92DF
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_YappingMaw),
    %XPosition($0408),
    %YPosition($0038),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0070, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_YappingMaw),
    %XPosition($02F8),
    %YPosition($00C8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0070, $0001))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_YappingMaw),
    %XPosition($01F8),
    %YPosition($0038),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0070, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Waver),
    %XPosition($0371),
    %YPosition($0065),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Waver),
    %XPosition($023A),
    %YPosition($007D),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Waver),
    %XPosition($0166),
    %YPosition($0077),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_YappingMaw),
    %XPosition($0108),
    %YPosition($00C8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0070, $0001))
    dw $FFFF : db $03                                                    ;A184EA;

EnemyPopulations_BombTorizo_0_1:
; Room $9804, state $981B
; Room $9804, state $9835
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_BombTorizo),
    %XPosition($00DB),
    %YPosition($00B3),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $00                                                    ;A184FD;

EnemyPopulations_GreenPiratesShaft:
; Room $99BD, state $99CA
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGreenWalking),
    %XPosition($0080),
    %YPosition($04D0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($8000, $0018))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGreenWalking),
    %XPosition($008D),
    %YPosition($0520),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($8001, $0018))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGreenWalking),
    %XPosition($008B),
    %YPosition($0570),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($8000, $0018))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGreenWalking),
    %XPosition($0084),
    %YPosition($05C0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($8001, $0018))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGreenWalking),
    %XPosition($0096),
    %YPosition($0610),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($8000, $0018))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Beetom),
    %XPosition($00B8),
    %YPosition($03D8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Beetom),
    %XPosition($0048),
    %YPosition($03D8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $07                                                    ;A18570;

EnemyPopulations_GreenBrinstarElev:
; Room $9938, state $9945
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Elevator),
    %XPosition($0080),
    %YPosition($00A2),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0000, $0140))
    dw $FFFF : db $00                                                    ;A18583;

EnemyPopulations_FinalMissile_0:
; Room $9A90, state $9AA2
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Eye),
    %XPosition($0032),
    %YPosition($0078),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0000, $8000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Eye),
    %XPosition($0032),
    %YPosition($0078),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $00                                                    ;A185A6;

EnemyPopulations_CrateriaMap:
; Room $9994, state $99A1
    dw $FFFF : db $00                                                    ;A185A9;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyPopulations_A185AC:
    dw $FFFF : db $00                                                    ;A185AC;
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyPopulations_FinalMissile_1:
; Room $9A90, state $9ABC
    dw $FFFF : db $00                                                    ;A185AF;

EnemyPopulations_Climb_2:
; Room $96BA, state $9705
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateSilverNinja),
    %XPosition($0080),
    %YPosition($0880),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0004),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateSilverNinja),
    %XPosition($00C0),
    %YPosition($0880),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0004),
    %speedParams($0000, $0000))
    dw $FFFF : db $02                                                    ;A185D2;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyPopulations_A185D5:
    dw $FFFF : db $00                                                    ;A185D5;
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyPopulations_CrateriaSave:
; Room $93D5, state $93E2
    dw $FFFF : db $00                                                    ;A185D8;

EnemyPopulations_ForgottenHighwayElbow:
; Room $95A8, state $95B5
    dw $FFFF : db $00                                                    ;A185DB;

EnemyPopulations_Moat:
; Room $95FF, state $960C
    dw $FFFF : db $00                                                    ;A185DE;

EnemyPopulations_Climb_0:
; Room $96BA, state $96D1
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0114),
    %YPosition($004C),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($5003, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0110),
    %YPosition($0058),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($9002, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($010D),
    %YPosition($0072),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($AC03, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($01EB),
    %YPosition($0096),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($C804, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($01F3),
    %YPosition($009A),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($C303, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0115),
    %YPosition($0126),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($9203, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0114),
    %YPosition($0123),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($6003, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0111),
    %YPosition($0128),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($9C02, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($01EE),
    %YPosition($0217),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($F004, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0116),
    %YPosition($06B9),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($BC02, $0050))
    dw $FFFF : db $00                                                    ;A18681;

EnemyPopulations_WestOcean:
; Room $93FE, state $940B
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Skultera),
    %XPosition($04A4),
    %YPosition($0570),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0010, $0210))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Skultera),
    %XPosition($03CB),
    %YPosition($057A),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0110, $0210))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zeb),
    %XPosition($0278),
    %YPosition($02C0),
    %initParam($0000),
    %properties($6900),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_GRipper),
    %XPosition($0590),
    %YPosition($0430),
    %initParam($0010),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0560, $05C0))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Tripper),
    %XPosition($0150),
    %YPosition($00D8),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $0010))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Tripper),
    %XPosition($0388),
    %YPosition($0058),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $0010))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Tripper),
    %XPosition($0370),
    %YPosition($0160),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0001, $0010))
    dw $FFFF : db $07                                                    ;A186F4;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyPopulations_A186F7:
    dw $FFFF : db $00                                                    ;A186F7;
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyPopulations_Parlor_0:
; Room $92FD, state $9314
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($04BE),
    %YPosition($00C0),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($AA02, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($04A4),
    %YPosition($00C9),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($B502, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($04BB),
    %YPosition($00CF),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($D003, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($04E4),
    %YPosition($0041),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($4804, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0455),
    %YPosition($002A),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($6003, $00A0))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($043F),
    %YPosition($002E),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($6C03, $00A0))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($046F),
    %YPosition($0027),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($7802, $00A0))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($03D8),
    %YPosition($00C3),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($CA03, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($03D2),
    %YPosition($00C9),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($C803, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($03DB),
    %YPosition($00CE),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($E202, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($011B),
    %YPosition($00BC),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($A002, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0112),
    %YPosition($00C4),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($AB02, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($012C),
    %YPosition($0229),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($7C03, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0124),
    %YPosition($022D),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($9403, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0143),
    %YPosition($023F),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($8402, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($013F),
    %YPosition($02BF),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($A102, $0040))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0145),
    %YPosition($02BA),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($9103, $0040))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($013D),
    %YPosition($02C3),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($8C02, $0040))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($010D),
    %YPosition($02DB),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($AC03, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($01A5),
    %YPosition($04E0),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($E804, $0020))
    dw $FFFF : db $00                                                    ;A1883A;

EnemyPopulations_LandingSite_0_1_2:
; Room $91F8, state $9213
; Room $91F8, state $922D
; Room $91F8, state $9247
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_ShipTop),
    %XPosition($0480),
    %YPosition($0478),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_ShipBottomEntrance),
    %XPosition($0480),
    %YPosition($0478),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_ShipBottomEntrance),
    %XPosition($0480),
    %YPosition($0478),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($0000, $0001))
    dw $FFFF : db $00                                                    ;A1886D;

EnemyPopulations_CrateriaSuper:
; Room $99F9, state $9A06
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Boyon),
    %XPosition($0258),
    %YPosition($07A8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0103, $0020))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Boyon),
    %XPosition($0278),
    %YPosition($07A8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0103, $0020))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Boyon),
    %XPosition($0298),
    %YPosition($07A8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0103, $0020))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Boyon),
    %XPosition($02B8),
    %YPosition($07A8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0103, $0020))
    dw $FFFF : db $00                                                    ;A188B0;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyPopulations_A188B3:
    dw $FFFF : db $00                                                    ;A188B3;
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyPopulations_PreBowling:
; Room $968F, state $969C
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_HZoomer),
    %XPosition($0080),
    %YPosition($0048),
    %initParam($0003),
    %properties($2001),
    %extraProperties($0000),
    %speedParams($0001, $0000))
    dw $FFFF : db $01                                                    ;A188C6;

EnemyPopulations_Climb_1:
; Room $96BA, state $96EB
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGreyWall),
    %XPosition($0130),
    %YPosition($00D8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($8000, $00A0))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGreyWall),
    %XPosition($01D0),
    %YPosition($0128),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($8001, $00A0))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGreyWall),
    %XPosition($0130),
    %YPosition($01D8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($8000, $00A0))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGreyWall),
    %XPosition($0130),
    %YPosition($0338),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($8000, $00A0))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGreyWall),
    %XPosition($01D0),
    %YPosition($03D8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($8001, $00A0))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGreyWall),
    %XPosition($0130),
    %YPosition($04B8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($8000, $00A0))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGreyWall),
    %XPosition($01D0),
    %YPosition($05A8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($8001, $00A0))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGreyWall),
    %XPosition($012D),
    %YPosition($0698),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($8000, $00A0))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGreyWall),
    %XPosition($01D0),
    %YPosition($0278),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($8001, $00A0))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGreyWall),
    %XPosition($01D0),
    %YPosition($0708),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($8001, $00A0))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGreyWall),
    %XPosition($0130),
    %YPosition($07C8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($8000, $00A0))
    dw $FFFF : db $0B                                                    ;A18979;

EnemyPopulations_BowlingAlleyPath:
; Room $9461, state $946E
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Choot),
    %XPosition($0070),
    %YPosition($00CC),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0204, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Choot),
    %XPosition($00E0),
    %YPosition($00CC),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0204, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Choot),
    %XPosition($0150),
    %YPosition($00CC),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0204, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Waver),
    %XPosition($00AA),
    %YPosition($005D),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Waver),
    %XPosition($00E9),
    %YPosition($0075),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Waver),
    %XPosition($0136),
    %YPosition($0063),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $06                                                    ;A189DC;

EnemyPopulations_RedBinstarElev:
; Room $962A, state $9637
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Elevator),
    %XPosition($0080),
    %YPosition($00C2),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0000, $0140))
    dw $FFFF : db $00                                                    ;A189EF;

EnemyPopulations_GauntletETank:
; Room $965B, state $9668
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_YappingMaw),
    %XPosition($0088),
    %YPosition($0038),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0070, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zebbo),
    %XPosition($0088),
    %YPosition($00B8),
    %initParam($0000),
    %properties($6900),
    %extraProperties($0000),
    %speedParams($0002, $0000))
    dw $FFFF : db $01                                                    ;A18A12;

EnemyPopulations_Pit_0:
; Room $975C, state $976D
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($006B),
    %YPosition($0038),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($2802, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0070),
    %YPosition($0034),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($7803, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($005A),
    %YPosition($002D),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($7C02, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0073),
    %YPosition($00AD),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($9402, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($007A),
    %YPosition($00B7),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($C403, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($006C),
    %YPosition($00C3),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($7C03, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($007F),
    %YPosition($00B2),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($C203, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($00BD),
    %YPosition($00CA),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($C103, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($02C9),
    %YPosition($00A6),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($F002, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($02CC),
    %YPosition($00AB),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($EC04, $0050))
    dw $FFFF : db $00                                                    ;A18AB5;

EnemyPopulations_CrabMaze:
; Room $957D, state $958A
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sciser),
    %XPosition($0278),
    %YPosition($00AC),
    %initParam($0003),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sciser),
    %XPosition($0015),
    %YPosition($0098),
    %initParam($0003),
    %properties($2001),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sciser),
    %XPosition($00D1),
    %YPosition($00C8),
    %initParam($0003),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sciser),
    %XPosition($0202),
    %YPosition($0068),
    %initParam($0003),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sciser),
    %XPosition($011E),
    %YPosition($01D8),
    %initParam($0003),
    %properties($2801),
    %extraProperties($0000),
    %speedParams($0003, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sciser),
    %XPosition($0118),
    %YPosition($0158),
    %initParam($0003),
    %properties($2001),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sciser),
    %XPosition($00B2),
    %YPosition($01B8),
    %initParam($0003),
    %properties($2001),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sciser),
    %XPosition($02A8),
    %YPosition($01C4),
    %initParam($0003),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0003, $0000))
    dw $FFFF : db $08                                                    ;A18B38;

EnemyPopulations_CrateriaTube:
; Room $95D4, state $95E1
    dw $FFFF : db $00                                                    ;A18B3B;

EnemyPopulations_ForgottenHighwayKagos:
; Room $9552, state $955F
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Kago),
    %XPosition($0050),
    %YPosition($0340),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($000A, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Kago),
    %XPosition($00A8),
    %YPosition($0200),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($000A, $0000))
    dw $FFFF : db $02                                                    ;A18B5E;

EnemyPopulations_ElevToBlueBrinstar:
; Room $97B5, state $97C6
; Room $97B5, state $97E0
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Elevator),
    %XPosition($0080),
    %YPosition($00A2),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0000, $0140))
    dw $FFFF : db $00                                                    ;A18B71;

EnemyPopulations_ForgottenHighwayElev:
; Room $94CC, state $94D9
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Elevator),
    %XPosition($0080),
    %YPosition($00C0),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0000, $0140))
    dw $FFFF : db $00                                                    ;A18B84;

EnemyPopulations_PreMapFlyway:
; Room $98E2, state $98EF
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Mellow),
    %XPosition($014C),
    %YPosition($006E),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Mellow),
    %XPosition($00FB),
    %YPosition($0059),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Mellow),
    %XPosition($01A7),
    %YPosition($005A),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rio),
    %XPosition($014B),
    %YPosition($0045),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $01                                                    ;A18BC7;

EnemyPopulations_LowerMushrooms:
; Room $9969, state $9976
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Kago),
    %XPosition($0100),
    %YPosition($00A0),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($000A, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Kago),
    %XPosition($0210),
    %YPosition($00B0),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($000A, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_MZoomer),
    %XPosition($02F8),
    %YPosition($0070),
    %initParam($0003),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_MZoomer),
    %XPosition($01A8),
    %YPosition($0070),
    %initParam($0003),
    %properties($2001),
    %extraProperties($0000),
    %speedParams($0002, $0000))
    dw $FFFF : db $04                                                    ;A18C0A;

EnemyPopulations_LandingSite_3:
; Room $91F8, state $9261
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_ShipTop),
    %XPosition($0480),
    %YPosition($0478),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_ShipBottomEntrance),
    %XPosition($0480),
    %YPosition($0478),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_ShipBottomEntrance),
    %XPosition($0480),
    %YPosition($0478),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($0000, $0001))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($0051),
    %YPosition($04AA),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($0080),
    %YPosition($04BC),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($00A1),
    %YPosition($04D0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($00E5),
    %YPosition($04D7),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($015B),
    %YPosition($04D7),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($019D),
    %YPosition($04D5),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($01C0),
    %YPosition($04C9),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($0222),
    %YPosition($04C8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($0243),
    %YPosition($04C4),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($027C),
    %YPosition($04CE),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($0317),
    %YPosition($04D7),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($033F),
    %YPosition($04C9),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($036C),
    %YPosition($04B6),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($0390),
    %YPosition($04A9),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($03D9),
    %YPosition($04B7),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($041A),
    %YPosition($04D9),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($049C),
    %YPosition($04D8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($04F9),
    %YPosition($04CA),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($0525),
    %YPosition($04BB),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($0557),
    %YPosition($04C9),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($05C6),
    %YPosition($04D4),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($0624),
    %YPosition($04D4),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $00                                                    ;A18D9D;

EnemyPopulations_Parlor_2:
; Room $92FD, state $9348
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($0145),
    %YPosition($00B5),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($01B9),
    %YPosition($00BA),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($01DE),
    %YPosition($00A9),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($0227),
    %YPosition($00B1),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($023D),
    %YPosition($00B9),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($026F),
    %YPosition($00C0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($02B1),
    %YPosition($00D0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($02D1),
    %YPosition($00C8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($030B),
    %YPosition($00C0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($032F),
    %YPosition($00A0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($035E),
    %YPosition($0088),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($0384),
    %YPosition($0077),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($03DC),
    %YPosition($0079),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($03FE),
    %YPosition($008E),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($041F),
    %YPosition($00A1),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($045C),
    %YPosition($00C4),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($047F),
    %YPosition($00B3),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($04AA),
    %YPosition($00AE),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($04CC),
    %YPosition($00A6),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $00                                                    ;A18ED0;

EnemyPopulations_BombTorizo_2:
; Room $9804, state $984F
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_DachoraEscape),
    %XPosition($00E0),
    %YPosition($00B8),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_EtecoonEscape),
    %XPosition($00E0),
    %YPosition($00B8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_EtecoonEscape),
    %XPosition($00E0),
    %YPosition($00B8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_EtecoonEscape),
    %XPosition($00E0),
    %YPosition($00B8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0004, $0000))
    dw $FFFF : db $04                                                    ;A18F13;

EnemyPopulations_Flyway_2:
; Room $9879, state $98C4
    dw $FFFF : db $00                                                    ;A18F16;

EnemyPopulations_CrateriaKihunter:
; Room $948C, state $9499
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KihunterGreen),
    %XPosition($0264),
    %YPosition($0073),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KihunterGreenWings),
    %XPosition($0264),
    %YPosition($0073),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0020, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KihunterGreen),
    %XPosition($00A8),
    %YPosition($0087),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KihunterGreenWings),
    %XPosition($00A8),
    %YPosition($0087),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0020, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sciser),
    %XPosition($0198),
    %YPosition($01D8),
    %initParam($0003),
    %properties($2801),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sciser),
    %XPosition($0165),
    %YPosition($021A),
    %initParam($0003),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0000))
    dw $FFFF : db $04                                                    ;A18F79;

EnemyPopulations_BrinstarPreMap:
; Room $9B9D, state $9BAA
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sidehopper),
    %XPosition($0244),
    %YPosition($003B),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zeela),
    %XPosition($0178),
    %YPosition($0058),
    %initParam($0003),
    %properties($2001),
    %extraProperties($0000),
    %speedParams($0001, $0002))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zeela),
    %XPosition($01A8),
    %YPosition($0058),
    %initParam($0003),
    %properties($2801),
    %extraProperties($0000),
    %speedParams($0001, $0002))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zeela),
    %XPosition($0049),
    %YPosition($0040),
    %initParam($0001),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0002))
    dw $FFFF : db $04                                                    ;A18FBC;

EnemyPopulations_GreenBrinstarMap:
; Room $9C35, state $9C42
    dw $FFFF : db $00                                                    ;A18FDF;

EnemyPopulations_GreenBrinstarMissileRefill:
; Room $9C89, state $9C96
    dw $FFFF : db $00                                                    ;A18FC2;

EnemyPopulations_SporeSpawnKihunters:
; Room $9D9C, state $9DA9
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KihunterGreen),
    %XPosition($00D9),
    %YPosition($0068),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($003C, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KihunterGreenWings),
    %XPosition($00D9),
    %YPosition($0068),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0020, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KihunterGreen),
    %XPosition($02D5),
    %YPosition($0062),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($003C, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KihunterGreenWings),
    %XPosition($02D5),
    %YPosition($0062),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0020, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KihunterGreen),
    %XPosition($03D7),
    %YPosition($0068),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($003C, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KihunterGreenWings),
    %XPosition($03D7),
    %YPosition($0068),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0020, $0000))
    dw $FFFF : db $03                                                    ;A19025;

EnemyPopulations_EtecoonSuper:
; Room $A051, state $A05E
    dw $FFFF : db $00                                                    ;A19028;

EnemyPopulations_DachoraEnergyRefill:
; Room $A07B, state $A088
    dw $FFFF : db $00                                                    ;A1902B;

EnemyPopulations_SporeSpawnFarming:
; Room $A0A4, state $A0B1
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zeb),
    %XPosition($0180),
    %YPosition($00B8),
    %initParam($0000),
    %properties($6900),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zeb),
    %XPosition($0110),
    %YPosition($00B8),
    %initParam($0000),
    %properties($6900),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zeb),
    %XPosition($00E0),
    %YPosition($00B8),
    %initParam($0000),
    %properties($6900),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zeela),
    %XPosition($0080),
    %YPosition($0042),
    %initParam($0002),
    %properties($2001),
    %extraProperties($0000),
    %speedParams($00FF, $0002))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zeela),
    %XPosition($00B0),
    %YPosition($0042),
    %initParam($0002),
    %properties($2001),
    %extraProperties($0000),
    %speedParams($00FF, $0002))
    dw $FFFF : db $05                                                    ;A1907E;

EnemyPopulations_Statues:
; Room $A66A, state $A677
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Elevator),
    %XPosition($0080),
    %YPosition($01B0),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0000, $0240))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_TourianStatue),
    %XPosition($0078),
    %YPosition($00B8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_TourianStatue),
    %XPosition($008E),
    %YPosition($0055),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_TourianStatue),
    %XPosition($0084),
    %YPosition($0088),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0004, $0000))
    dw $FFFF : db $00                                                    ;A190C1;

EnemyPopulations_HopperETank:
; Room $A15B, state $A168
    dw $FFFF : db $00                                                    ;A190C4;

EnemyPopulations_BetaPowerBomb:
; Room $A37C, state $A389
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_YappingMaw),
    %XPosition($0170),
    %YPosition($00D0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0036, $0001))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_YappingMaw),
    %XPosition($00F0),
    %YPosition($00D0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0036, $0001))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_SidehopperLarge),
    %XPosition($00F0),
    %YPosition($0058),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($8000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_SidehopperLarge),
    %XPosition($0170),
    %YPosition($0058),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($8000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_SidehopperLarge),
    %XPosition($0078),
    %YPosition($0058),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($8000, $0000))
    dw $FFFF : db $03                                                    ;A19117;

EnemyPopulations_WaterwayETank:
; Room $A0D2, state $A0DF
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Skultera),
    %XPosition($0140),
    %YPosition($00AE),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0010, $1001))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Puyo),
    %XPosition($0169),
    %YPosition($00B3),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0001))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Puyo),
    %XPosition($01F7),
    %YPosition($00B3),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0001))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Puyo),
    %XPosition($0224),
    %YPosition($00B5),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0001))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Skultera),
    %XPosition($024B),
    %YPosition($00AE),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0010, $1001))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zero),
    %XPosition($0430),
    %YPosition($00B8),
    %initParam($0003),
    %properties($2001),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zero),
    %XPosition($05F0),
    %YPosition($0058),
    %initParam($0002),
    %properties($2001),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $07                                                    ;A1918A;

EnemyPopulations_ConstructionZone_1:
; Room $9F11, state $9F3D
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zoomer),
    %XPosition($0058),
    %YPosition($0078),
    %initParam($0003),
    %properties($2001),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zoomer),
    %XPosition($00A8),
    %YPosition($0094),
    %initParam($0002),
    %properties($2001),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_FaceBlock),
    %XPosition($0048),
    %YPosition($0088),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_FaceBlock),
    %XPosition($00B8),
    %YPosition($0088),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_FaceBlock),
    %XPosition($00E8),
    %YPosition($0116),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_FaceBlock),
    %XPosition($00E8),
    %YPosition($0166),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_FaceBlock),
    %XPosition($0018),
    %YPosition($0116),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $02                                                    ;A191FD;

EnemyPopulations_BlueBrinstarETank_1:
; Room $9F64, state $9F90
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zoomer),
    %XPosition($00A8),
    %YPosition($02C8),
    %initParam($0003),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zoomer),
    %XPosition($00D8),
    %YPosition($02C8),
    %initParam($0003),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Skree),
    %XPosition($00DE),
    %YPosition($024B),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Skree),
    %XPosition($00FE),
    %YPosition($023B),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rio),
    %XPosition($01F0),
    %YPosition($0240),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_FaceBlock),
    %XPosition($0038),
    %YPosition($0228),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_FaceBlock),
    %XPosition($0038),
    %YPosition($02A8),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_FaceBlock),
    %XPosition($02E8),
    %YPosition($02B8),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_FaceBlock),
    %XPosition($0268),
    %YPosition($0088),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_FaceBlock),
    %XPosition($0288),
    %YPosition($0088),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $05                                                    ;A192A0;

EnemyPopulations_NoobBridge:
; Room $9FBA, state $9FC7
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Cacatac),
    %XPosition($00C0),
    %YPosition($00B3),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0100, $0301))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Cacatac),
    %XPosition($01B0),
    %YPosition($00B3),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0100, $0301))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Cacatac),
    %XPosition($0570),
    %YPosition($00B3),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0101, $0301))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Cacatac),
    %XPosition($03D0),
    %YPosition($00B3),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0100, $0301))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zeela),
    %XPosition($0248),
    %YPosition($0076),
    %initParam($0002),
    %properties($2801),
    %extraProperties($0000),
    %speedParams($0000, $0002))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zeela),
    %XPosition($02A8),
    %YPosition($0076),
    %initParam($0002),
    %properties($2801),
    %extraProperties($0000),
    %speedParams($0000, $0002))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zeela),
    %XPosition($0300),
    %YPosition($0076),
    %initParam($0002),
    %properties($2801),
    %extraProperties($0000),
    %speedParams($0000, $0002))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zeela),
    %XPosition($0368),
    %YPosition($0076),
    %initParam($0002),
    %properties($2801),
    %extraProperties($0000),
    %speedParams($0000, $0002))
    dw $FFFF : db $08                                                    ;A19323;

EnemyPopulations_MorphBall_1:
; Room $9E9F, state $9ECB
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Elevator),
    %XPosition($0580),
    %YPosition($02C2),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0001, $0018))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_SidehopperLarge),
    %XPosition($0098),
    %YPosition($02A6),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_SidehopperLarge),
    %XPosition($017C),
    %YPosition($02A6),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_SidehopperLarge),
    %XPosition($0107),
    %YPosition($026C),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($8000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_FaceBlock),
    %XPosition($0548),
    %YPosition($0240),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_FaceBlock),
    %XPosition($05B8),
    %YPosition($0240),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_FaceBlock),
    %XPosition($0488),
    %YPosition($02B8),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_FaceBlock),
    %XPosition($0428),
    %YPosition($02B8),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $03                                                    ;A193A6;

EnemyPopulations_WarehouseSave:
; Room $A70B, state $A718
    dw $FFFF : db $00                                                    ;A193A9;

EnemyPopulations_MorphBall_0:
; Room $9E9F, state $9EB1
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Eye),
    %XPosition($0408),
    %YPosition($0248),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0000, $8000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Eye),
    %XPosition($0408),
    %YPosition($0248),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Elevator),
    %XPosition($0580),
    %YPosition($02C2),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0001, $0018))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_FaceBlock),
    %XPosition($0548),
    %YPosition($0240),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0040, $0001))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_FaceBlock),
    %XPosition($05B8),
    %YPosition($0240),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0040, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_FaceBlock),
    %XPosition($0488),
    %YPosition($02B8),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0040, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_FaceBlock),
    %XPosition($0428),
    %YPosition($02B8),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0040, $0001))
    dw $FFFF : db $00                                                    ;A1941C;

EnemyPopulations_WarehouseZeela:
; Room $A471, state $A47E
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zeela),
    %XPosition($006A),
    %YPosition($0040),
    %initParam($0001),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0002, $0002))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zeela),
    %XPosition($006A),
    %YPosition($0068),
    %initParam($0001),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0002, $0002))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zeela),
    %XPosition($002B),
    %YPosition($00E8),
    %initParam($0003),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0002, $0002))
    dw $FFFF : db $03                                                    ;A1944F;

EnemyPopulations_RedTower:
; Room $A253, state $A260
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Ripper),
    %XPosition($0098),
    %YPosition($0208),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0010, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Ripper),
    %XPosition($0060),
    %YPosition($00E8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0010, $0001))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Ripper),
    %XPosition($0098),
    %YPosition($0140),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0010, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Ripper),
    %XPosition($0068),
    %YPosition($01A0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0010, $0001))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Beetom),
    %XPosition($00CF),
    %YPosition($0658),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Ripper),
    %XPosition($0098),
    %YPosition($0948),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0010, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Ripper),
    %XPosition($005F),
    %YPosition($08E8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0010, $0001))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Ripper),
    %XPosition($009D),
    %YPosition($0888),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0010, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Ripper),
    %XPosition($0068),
    %YPosition($0800),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0010, $0001))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Geega),
    %XPosition($0018),
    %YPosition($0530),
    %initParam($0000),
    %properties($6100),
    %extraProperties($0000),
    %speedParams($0000, $0020))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Geega),
    %XPosition($00C8),
    %YPosition($0550),
    %initParam($0000),
    %properties($6100),
    %extraProperties($0000),
    %speedParams($0001, $0020))
    dw $FFFF : db $0B                                                    ;A19502;

EnemyPopulations_BlueBrinstarBoulders:
; Room $A1AD, state $A1BA
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Boulder),
    %XPosition($0158),
    %YPosition($00C0),
    %initParam($0080),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0200, $A050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Boulder),
    %XPosition($00F0),
    %YPosition($00C0),
    %initParam($0080),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0200, $A050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Boulder),
    %XPosition($0090),
    %YPosition($00C0),
    %initParam($0080),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0200, $A050))
    dw $FFFF : db $00                                                    ;A19535;

EnemyPopulations_BillyMays:
; Room $A1D8, state $A1E5
    dw $FFFF : db $00                                                    ;A19538;

EnemyPopulations_BigPinkSaveRoom:
; Room $A184, state $A191
    dw $FFFF : db $00                                                    ;A1953B;

EnemyPopulations_BigPink:
; Room $9D19, state $9D26
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rio),
    %XPosition($02E8),
    %YPosition($0478),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rio),
    %XPosition($0328),
    %YPosition($0478),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rio),
    %XPosition($0335),
    %YPosition($05A9),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sidehopper),
    %XPosition($0239),
    %YPosition($00FC),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sidehopper),
    %XPosition($02F8),
    %YPosition($00ED),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sidehopper),
    %XPosition($0250),
    %YPosition($0418),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sidehopper),
    %XPosition($02B0),
    %YPosition($0418),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zeb),
    %XPosition($02C0),
    %YPosition($0098),
    %initParam($0000),
    %properties($6900),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zeb),
    %XPosition($02B0),
    %YPosition($0228),
    %initParam($0000),
    %properties($6900),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zeb),
    %XPosition($0320),
    %YPosition($0549),
    %initParam($0000),
    %properties($6900),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $0A                                                    ;A195DE;

EnemyPopulations_EtecoonSave:
; Room $A22A, state $A237
    dw $FFFF : db $00                                                    ;A195E1;

EnemyPopulations_BelowSpazer:
; Room $A408, state $A415
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_YappingMaw),
    %XPosition($0190),
    %YPosition($01C8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0030, $0001))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_YappingMaw),
    %XPosition($0080),
    %YPosition($01C8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0030, $0001))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Cacatac),
    %XPosition($0108),
    %YPosition($0193),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0100, $0200))
    dw $FFFF : db $01                                                    ;A19614;

EnemyPopulations_GreenBrinstarSave:
; Room $A201, state $A20E
    dw $FFFF : db $00                                                    ;A19617;

EnemyPopulations_Spazer:
; Room $A447, state $A454
    dw $FFFF : db $00                                                    ;A1961A;

EnemyPopulations_PinkBrinstarPowerBombs:
; Room $9E11, state $9E1E
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_ShutterShootable),
    %XPosition($0038),
    %YPosition($0190),
    %initParam($0008),
    %properties($A800),
    %extraProperties($FFFF),
    %speedParams($6004, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_ShutterShootable),
    %XPosition($0198),
    %YPosition($01F0),
    %initParam($0008),
    %properties($A800),
    %extraProperties($FFFF),
    %speedParams($4004, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_SidehopperLarge),
    %XPosition($00F1),
    %YPosition($00A6),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_SidehopperLarge),
    %XPosition($0068),
    %YPosition($0064),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($8000, $0000))
    dw $FFFF : db $02                                                    ;A1965D;

EnemyPopulations_RedTowerRefill:
; Room $A618, state $A625
    dw $FFFF : db $00                                                    ;A19660;

EnemyPopulations_KraidRefill:
; Room $A641, state $A64E
    dw $FFFF : db $00                                                    ;A19663;

EnemyPopulations_VariaSuit:
; Room $A6E2, state $A6EF
    dw $FFFF : db $00                                                    ;A19666;

EnemyPopulations_RedBrinstarSave:
; Room $A734, state $A741
    dw $FFFF : db $00                                                    ;A19669;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyPopulations_A1966C:
    dw $FFFF : db $00                                                    ;A1966C;
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyPopulations_BlueBrinstarETank_0:
; Room $9F64, state $9F76
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Eye),
    %XPosition($0228),
    %YPosition($0268),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0000, $8001))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Eye),
    %XPosition($0228),
    %YPosition($0268),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_FaceBlock),
    %XPosition($0038),
    %YPosition($0228),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_FaceBlock),
    %XPosition($0038),
    %YPosition($02A8),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_FaceBlock),
    %XPosition($02E8),
    %YPosition($02B8),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_FaceBlock),
    %XPosition($0268),
    %YPosition($0088),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_FaceBlock),
    %XPosition($0288),
    %YPosition($0088),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $00                                                    ;A196DF;

EnemyPopulations_GreenBrinstarFirefleas:
; Room $9C5E, state $9C6B
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Fireflea),
    %XPosition($0180),
    %YPosition($005F),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0210))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Fireflea),
    %XPosition($00E1),
    %YPosition($006A),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0003, $0210))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Fireflea),
    %XPosition($0045),
    %YPosition($005B),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0210))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Fireflea),
    %XPosition($0070),
    %YPosition($0118),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0308))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Fireflea),
    %XPosition($00A0),
    %YPosition($0138),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0408))
    dw $FFFF : db $05                                                    ;A19732;

EnemyPopulations_GreenBrinstarBeetoms:
; Room $9FE5, state $9FF2
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Beetom),
    %XPosition($0050),
    %YPosition($00B8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Beetom),
    %XPosition($0070),
    %YPosition($00B8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Beetom),
    %XPosition($0090),
    %YPosition($00B8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Beetom),
    %XPosition($00B0),
    %YPosition($00B8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $04                                                    ;A19775;

EnemyPopulations_EtecoonETank:
; Room $A011, state $A01E
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zebbo),
    %XPosition($0250),
    %YPosition($01D8),
    %initParam($0000),
    %properties($6900),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zebbo),
    %XPosition($02F0),
    %YPosition($01D8),
    %initParam($0000),
    %properties($6900),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zebbo),
    %XPosition($0430),
    %YPosition($01D8),
    %initParam($0000),
    %properties($6900),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Beetom),
    %XPosition($01D8),
    %YPosition($0198),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Beetom),
    %XPosition($0278),
    %YPosition($0198),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Beetom),
    %XPosition($0360),
    %YPosition($01A8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Beetom),
    %XPosition($03D8),
    %YPosition($01A8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Beetom),
    %XPosition($0458),
    %YPosition($01A8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $08                                                    ;A197F8;

EnemyPopulations_PinkBrinstarHoppers:
; Room $A130, state $A13D
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_SidehopperLarge),
    %XPosition($00B5),
    %YPosition($01B5),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sidehopper),
    %XPosition($00F8),
    %YPosition($01A0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sidehopper),
    %XPosition($006A),
    %YPosition($01C1),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_ShutterShootable),
    %XPosition($0158),
    %YPosition($01E0),
    %initParam($0008),
    %properties($A800),
    %extraProperties($00FF),
    %speedParams($4003, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_ShutterShootable),
    %XPosition($0158),
    %YPosition($01E0),
    %initParam($0008),
    %properties($A800),
    %extraProperties($00FF),
    %speedParams($8003, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_ShutterShootable),
    %XPosition($0158),
    %YPosition($01E0),
    %initParam($0008),
    %properties($A800),
    %extraProperties($00FF),
    %speedParams($C003, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_ShutterShootable),
    %XPosition($0158),
    %YPosition($01E0),
    %initParam($0008),
    %properties($A800),
    %extraProperties($00FF),
    %speedParams($F003, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_ShutterShootable),
    %XPosition($0148),
    %YPosition($01E0),
    %initParam($0000),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_ShutterShootable),
    %XPosition($0168),
    %YPosition($01E0),
    %initParam($0000),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $03                                                    ;A1988B;

EnemyPopulations_WarehouseETank:
; Room $A4B1, state $A4BE
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Beetom),
    %XPosition($002D),
    %YPosition($0098),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Beetom),
    %XPosition($0047),
    %YPosition($0098),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Beetom),
    %XPosition($008B),
    %YPosition($00A8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Beetom),
    %XPosition($0060),
    %YPosition($0098),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $04                                                    ;A198CE;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyPopulations_A198D1:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Elevator),
    %XPosition($0080),
    %YPosition($00A0),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0000, $0140))
    dw $FFFF : db $00                                                    ;A198E1;
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyPopulations_WarehouseEntrance:
; Room $A6A1, state $A6AE
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Elevator),
    %XPosition($0080),
    %YPosition($00A0),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0000, $0140))
    dw $FFFF : db $00                                                    ;A198F4;

EnemyPopulations_WarehouseKihunter:
; Room $A4DA, state $A4E7
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KihunterGreen),
    %XPosition($0169),
    %YPosition($0070),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KihunterGreenWings),
    %XPosition($0169),
    %YPosition($0070),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0020, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KihunterGreen),
    %XPosition($0289),
    %YPosition($0059),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KihunterGreenWings),
    %XPosition($0289),
    %YPosition($0059),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0020, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KihunterGreen),
    %XPosition($01FE),
    %YPosition($0063),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KihunterGreenWings),
    %XPosition($01FE),
    %YPosition($0063),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0020, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KihunterGreen),
    %XPosition($0242),
    %YPosition($007A),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KihunterGreenWings),
    %XPosition($0242),
    %YPosition($007A),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0020, $0000))
    dw $FFFF : db $04                                                    ;A19977;

EnemyPopulations_GreenBrinstarMainShaft:
; Room $9AD9, state $9AE6
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Elevator),
    %XPosition($0080),
    %YPosition($02C2),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0001, $0018))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zeela),
    %XPosition($00DA),
    %YPosition($02CB),
    %initParam($0001),
    %properties($2803),
    %extraProperties($0000),
    %speedParams($0001, $0002))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zeela),
    %XPosition($0070),
    %YPosition($0398),
    %initParam($0003),
    %properties($2001),
    %extraProperties($0000),
    %speedParams($0001, $0002))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Ripper2),
    %XPosition($006C),
    %YPosition($03F6),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0018, $0001))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zeela),
    %XPosition($0079),
    %YPosition($06E8),
    %initParam($0003),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0002))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Ripper2),
    %XPosition($0043),
    %YPosition($0548),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0018, $0001))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zeela),
    %XPosition($007B),
    %YPosition($05F8),
    %initParam($0001),
    %properties($2002),
    %extraProperties($0000),
    %speedParams($0001, $0002))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zeela),
    %XPosition($0027),
    %YPosition($03CC),
    %initParam($0000),
    %properties($2003),
    %extraProperties($0000),
    %speedParams($0001, $0002))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Etecoon),
    %XPosition($025F),
    %YPosition($0B98),
    %initParam($0000),
    %properties($0C00),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Etecoon),
    %XPosition($026F),
    %YPosition($0B98),
    %initParam($0000),
    %properties($0C00),
    %extraProperties($0000),
    %speedParams($0000, $0001))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Etecoon),
    %XPosition($027F),
    %YPosition($0B98),
    %initParam($0000),
    %properties($0C00),
    %extraProperties($0000),
    %speedParams($0000, $0002))
    dw $FFFF : db $07                                                    ;A19A2A;

EnemyPopulations_SporeSpawnSuper:
; Room $9B5B, state $9B68
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zeb),
    %XPosition($00C0),
    %YPosition($00B8),
    %initParam($0000),
    %properties($6900),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $01                                                    ;A19A3D;

EnemyPopulations_EarlySupers:
; Room $9BC8, state $9BD5
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sidehopper),
    %XPosition($01BA),
    %YPosition($01A8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sidehopper),
    %XPosition($0200),
    %YPosition($01A8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_ShutterGrowing),
    %XPosition($0198),
    %YPosition($0128),
    %initParam($0001),
    %properties($A800),
    %extraProperties($0000),
    %speedParams(regional($0090, $00A4), $0010))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_ShutterGrowing),
    %XPosition($0228),
    %YPosition($0128),
    %initParam($0001),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0090, $0010))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_ShutterGrowing),
    %XPosition($0288),
    %YPosition($0128),
    %initParam($0001),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0090, $0010))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Waver),
    %XPosition($00AB),
    %YPosition($004B),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Waver),
    %XPosition($0108),
    %YPosition($006B),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Waver),
    %XPosition($0211),
    %YPosition($0065),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Waver),
    %XPosition($0141),
    %YPosition($0056),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zeb),
    %XPosition($0090),
    %YPosition($01B8),
    %initParam($0000),
    %properties($6900),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sidehopper),
    %XPosition($0142),
    %YPosition($0085),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sidehopper),
    %XPosition($01C3),
    %YPosition($0084),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sidehopper),
    %XPosition($0183),
    %YPosition($003D),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0000))
    dw $FFFF : db $0A                                                    ;A19B10;

EnemyPopulations_RedBrinstarFirefleas:
; Room $A293, state $A2A0
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Fireflea),
    %XPosition($06D0),
    %YPosition($0090),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0306))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Fireflea),
    %XPosition($0710),
    %YPosition($0070),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0518))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Fireflea),
    %XPosition($0688),
    %YPosition($0060),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0003, $0418))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Fireflea),
    %XPosition($04E0),
    %YPosition($00A8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0210))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Fireflea),
    %XPosition($0630),
    %YPosition($0080),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0003, $0220))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Waver),
    %XPosition($0745),
    %YPosition($0050),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Waver),
    %XPosition($0690),
    %YPosition($0060),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Waver),
    %XPosition($0600),
    %YPosition($0060),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_YappingMaw),
    %XPosition($0198),
    %YPosition($00C8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0050, $0001))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_YappingMaw),
    %XPosition($0258),
    %YPosition($00C0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0050, $0001))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_YappingMaw),
    %XPosition($03A8),
    %YPosition($00C0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0050, $0001))
    dw $FFFF : db $08                                                    ;A19BC3;

EnemyPopulations_ConstructionZone_0:
; Room $9F11, state $9F23
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($002E),
    %YPosition($00C0),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($8A03, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($00DE),
    %YPosition($00B3),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($C803, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($00DB),
    %YPosition($00B7),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($F802, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($00D9),
    %YPosition($00B1),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($EC02, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($00D7),
    %YPosition($00C1),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($F403, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($00B3),
    %YPosition($01D3),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($C402, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($00B9),
    %YPosition($01DB),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($D003, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($00BB),
    %YPosition($01EA),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($DC03, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($00AE),
    %YPosition($01DC),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($BB02, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($00D5),
    %YPosition($01F0),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($0303, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_FaceBlock),
    %XPosition($0048),
    %YPosition($0088),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_FaceBlock),
    %XPosition($00B8),
    %YPosition($0088),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $0001))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_FaceBlock),
    %XPosition($00E8),
    %YPosition($0116),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_FaceBlock),
    %XPosition($00E8),
    %YPosition($0166),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_FaceBlock),
    %XPosition($0018),
    %YPosition($0116),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $00                                                    ;A19CB6;

EnemyPopulations_GreenHillZone:
; Room $9E52, state $9E5F
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sidehopper),
    %XPosition($0400),
    %YPosition($02A0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sidehopper),
    %XPosition($0500),
    %YPosition($0300),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sidehopper),
    %XPosition($0687),
    %YPosition($03B6),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Geega),
    %XPosition($0170),
    %YPosition($0120),
    %initParam($0000),
    %properties($6100),
    %extraProperties($0000),
    %speedParams($0001, $0024))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Geega),
    %XPosition($0230),
    %YPosition($01E0),
    %initParam($0000),
    %properties($6100),
    %extraProperties($0000),
    %speedParams($0000, $0024))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Geega),
    %XPosition($0380),
    %YPosition($0220),
    %initParam($0000),
    %properties($6100),
    %extraProperties($0000),
    %speedParams($0001, $0024))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Geega),
    %XPosition($0560),
    %YPosition($02E0),
    %initParam($0000),
    %properties($6100),
    %extraProperties($0000),
    %speedParams($0001, $0024))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Geega),
    %XPosition($0500),
    %YPosition($0340),
    %initParam($0000),
    %properties($6100),
    %extraProperties($0000),
    %speedParams($0000, $0024))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sidehopper),
    %XPosition($06D0),
    %YPosition($0350),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sidehopper),
    %XPosition($0718),
    %YPosition($0350),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0000))
    dw $FFFF : db $0A                                                    ;A19D59;

EnemyPopulations_Dachora:
; Room $9CB3, state $9CC0
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zeela),
    %XPosition($00E0),
    %YPosition($00B8),
    %initParam($0000),
    %properties($2803),
    %extraProperties($0000),
    %speedParams($0002, $0002))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zeela),
    %XPosition($0108),
    %YPosition($00B8),
    %initParam($0000),
    %properties($2003),
    %extraProperties($0000),
    %speedParams($0002, $0002))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Metaree),
    %XPosition($062D),
    %YPosition($006C),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Metaree),
    %XPosition($0658),
    %YPosition($004C),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Metaree),
    %XPosition($0673),
    %YPosition($004C),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rio),
    %XPosition($0130),
    %YPosition($0060),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rio),
    %XPosition($01B0),
    %YPosition($0060),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rio),
    %XPosition($02E8),
    %YPosition($0060),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dachora),
    %XPosition($0060),
    %YPosition($06A8),
    %initParam($0000),
    %properties($0C00),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dachora),
    %XPosition($0060),
    %YPosition($06A8),
    %initParam($0000),
    %properties($0D00),
    %extraProperties($0000),
    %speedParams($8001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dachora),
    %XPosition($0060),
    %YPosition($06A8),
    %initParam($0000),
    %properties($0D00),
    %extraProperties($0000),
    %speedParams($8001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dachora),
    %XPosition($0060),
    %YPosition($06A8),
    %initParam($0000),
    %properties($0D00),
    %extraProperties($0000),
    %speedParams($8001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dachora),
    %XPosition($0060),
    %YPosition($06A8),
    %initParam($0000),
    %properties($0D00),
    %extraProperties($0000),
    %speedParams($8001, $0000))
    dw $FFFF : db $08                                                    ;A19E2C;

EnemyPopulations_Hellway:
; Room $A2F7, state $A304
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zeela),
    %XPosition($00A0),
    %YPosition($0098),
    %initParam($0003),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0002))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zeela),
    %XPosition($0127),
    %YPosition($0088),
    %initParam($0003),
    %properties($2001),
    %extraProperties($0000),
    %speedParams($0002, $0002))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zeela),
    %XPosition($0170),
    %YPosition($0098),
    %initParam($0003),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0002))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zeela),
    %XPosition($01BF),
    %YPosition($0098),
    %initParam($0003),
    %properties($2001),
    %extraProperties($0000),
    %speedParams($0002, $0002))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zebbo),
    %XPosition($01A0),
    %YPosition($00D8),
    %initParam($0000),
    %properties($6900),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zebbo),
    %XPosition($0100),
    %YPosition($00D8),
    %initParam($0000),
    %properties($6900),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zebbo),
    %XPosition($01E0),
    %YPosition($00D8),
    %initParam($0000),
    %properties($6900),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zebbo),
    %XPosition($0080),
    %YPosition($00D8),
    %initParam($0000),
    %properties($6900),
    %extraProperties($0000),
    %speedParams($0002, $0000))
    dw $FFFF : db $08                                                    ;A19EAF;

EnemyPopulations_FirstMissile:
; Room $A107, state $A114
    dw $FFFF : db $00                                                    ;A19EB2;

EnemyPopulations_Kraid:
; Room $A59F, state $A5B1
; Room $A59F, state $A5CB
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Kraid),
    %XPosition($0100),
    %YPosition($0218),
    %initParam($0000),
    %properties($0D00),
    %extraProperties($0004),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KraidArm),
    %XPosition($00E8),
    %YPosition($01E8),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0004),
    %speedParams($0000, $0001))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KraidLintTop),
    %XPosition($00C8),
    %YPosition($0210),
    %initParam($0000),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KraidLintMiddle),
    %XPosition($00B0),
    %YPosition($0250),
    %initParam($0000),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0000, $0001))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KraidLintBottom),
    %XPosition($00B2),
    %YPosition($0288),
    %initParam($0000),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0000, $0002))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KraidFoot),
    %XPosition($0100),
    %YPosition($0278),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0004),
    %speedParams($0000, $0003))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KraidNail),
    %XPosition($00E8),
    %YPosition($01E8),
    %initParam($0000),
    %properties($6800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KraidNailBad),
    %XPosition($00E8),
    %YPosition($01E8),
    %initParam($0000),
    %properties($6800),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $00                                                    ;A19F35;

EnemyPopulations_BrinstarReserveTank:
; Room $9C07, state $9C14
    dw $FFFF : db $00                                                    ;A19F38;

EnemyPopulations_XrayScope:
; Room $A2CE, state $A2DB
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_ShutterShootable),
    %XPosition($0168),
    %YPosition($00A0),
    %initParam($0008),
    %properties($A800),
    %extraProperties($FFFF),
    %speedParams($4004, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_ShutterShootable),
    %XPosition($00B8),
    %YPosition($00E0),
    %initParam($0008),
    %properties($A800),
    %extraProperties($FFFF),
    %speedParams($4004, $0000))
    dw $FFFF : db $00                                                    ;A19F5D;

EnemyPopulations_StatuesHallway:
; Room $A5ED, state $A5FA
    dw $FFFF : db $00                                                    ;A19F5E;

EnemyPopulations_AlphaPowerBomb:
; Room $A3AE, state $A3BB
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Boyon),
    %XPosition($0258),
    %YPosition($00A8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0003, $0020))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Boyon),
    %XPosition($0268),
    %YPosition($00A8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0003, $0020))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Boyon),
    %XPosition($01F8),
    %YPosition($00A8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0003, $0020))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Boyon),
    %XPosition($0208),
    %YPosition($00A8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0003, $0020))
    dw $FFFF : db $00                                                    ;A19FA1;

EnemyPopulations_KraidEyeDoor:
; Room $A56B, state $A578
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zeb),
    %XPosition($0090),
    %YPosition($01C8),
    %initParam($0000),
    %properties($6900),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0136),
    %YPosition($019D),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($C803, $0030))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0137),
    %YPosition($01A4),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($BA03, $0030))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($013D),
    %YPosition($01AB),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($A802, $0030))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0133),
    %YPosition($01AC),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($B403, $0030))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($013B),
    %YPosition($019E),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($CA02, $0030))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0142),
    %YPosition($01A4),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($C903, $0030))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0145),
    %YPosition($01A7),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($BE02, $0030))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0143),
    %YPosition($01AF),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($C203, $0030))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0137),
    %YPosition($01B0),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($9003, $0030))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($014E),
    %YPosition($01AC),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($C802, $0020))
    dw $FFFF : db $01                                                    ;A1A054;

EnemyPopulations_Caterpillar:
; Room $A322, state $A32F
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Elevator),
    %XPosition($0080),
    %YPosition($02C2),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0001, $0018))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zero),
    %XPosition($005F),
    %YPosition($0788),
    %initParam($0003),
    %properties($2001),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zero),
    %XPosition($0017),
    %YPosition($06DE),
    %initParam($0000),
    %properties($2002),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zero),
    %XPosition($0078),
    %YPosition($068F),
    %initParam($0001),
    %properties($2002),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Cacatac),
    %XPosition($0071),
    %YPosition($0473),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0101, $0300))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Cacatac),
    %XPosition($00C0),
    %YPosition($0503),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0100, $0300))
    dw $FFFF : db $05                                                    ;A1A0B7;

EnemyPopulations_MiniKraid:
; Room $A521, state $A533
; Room $A521, state $A54D
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGreenWalking),
    %XPosition($00D9),
    %YPosition($00A0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($8000, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGreenWalking),
    %XPosition($0120),
    %YPosition($00A0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($8000, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGreenWalking),
    %XPosition($01F4),
    %YPosition($00A0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($8000, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_MiniKraid),
    %XPosition($0530),
    %YPosition($00A0),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $04                                                    ;A1A0FA;

EnemyPopulations_SporeSpawn:
; Room $9DC7, state $9DD9
; Room $9DC7, state $9DF3
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_SporeSpawn),
    %XPosition($0080),
    %YPosition($0270),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0004),
    %speedParams($0000, $0000))
    dw $FFFF : db $00                                                    ;A1A10D;

EnemyPopulations_SkreeBoost:
; Room $A3DD, state $A3EA
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Skree),
    %XPosition($0148),
    %YPosition($003C),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Skree),
    %XPosition($0170),
    %YPosition($003C),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $02                                                    ;A1A130;

EnemyPopulations_GrappleTutorial3:
; Room $AB64, state $AB71
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Gamet),
    %XPosition($00D0),
    %YPosition($0168),
    %initParam($0000),
    %properties($6800),
    %extraProperties($0000),
    %speedParams($0000, $3030))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Gamet),
    %XPosition($00D0),
    %YPosition($0168),
    %initParam($0000),
    %properties($6800),
    %extraProperties($0000),
    %speedParams($0000, $3000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Gamet),
    %XPosition($00D0),
    %YPosition($0168),
    %initParam($0000),
    %properties($6800),
    %extraProperties($0000),
    %speedParams($0000, $3000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Gamet),
    %XPosition($00D0),
    %YPosition($0168),
    %initParam($0000),
    %properties($6800),
    %extraProperties($0000),
    %speedParams($0000, $3000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Gamet),
    %XPosition($00D0),
    %YPosition($0168),
    %initParam($0000),
    %properties($6800),
    %extraProperties($0000),
    %speedParams($0000, $3000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Puyo),
    %XPosition($01CD),
    %YPosition($014C),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Puyo),
    %XPosition($01BA),
    %YPosition($0114),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Puyo),
    %XPosition($0208),
    %YPosition($01A2),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Puyo),
    %XPosition($023C),
    %YPosition($01A7),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Puyo),
    %XPosition($0270),
    %YPosition($01A1),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $06                                                    ;A1A1D3;

EnemyPopulations_PostCrocShaft:
; Room $AB07, state $AB14
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Viola),
    %XPosition($0077),
    %YPosition($0348),
    %initParam($0003),
    %properties($2001),
    %extraProperties($0000),
    %speedParams($0002, $0006))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Viola),
    %XPosition($0060),
    %YPosition($03A8),
    %initParam($0003),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0006))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Viola),
    %XPosition($0093),
    %YPosition($03F8),
    %initParam($0003),
    %properties($2001),
    %extraProperties($0000),
    %speedParams($0002, $0006))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Viola),
    %XPosition($007D),
    %YPosition($0478),
    %initParam($0003),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0006))
    dw $FFFF : db $04                                                    ;A1A216;

EnemyPopulations_MetalPirates:
; Room $B62B, state $B638
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGoldNinja),
    %XPosition($00E8),
    %YPosition($00B0),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0004),
    %speedParams($0001, $00C0))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGoldNinja),
    %XPosition($0218),
    %YPosition($00B0),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0004),
    %speedParams($0000, $00C0))
    dw $FFFF : db $02                                                    ;A1A239;

EnemyPopulations_AcidStatue:
; Room $B1E5, state $B1F2
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Chozo),
    %XPosition($002C),
    %YPosition($009A),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0002))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Magdollite),
    %XPosition($01D8),
    %YPosition($02D8),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $20F0))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Magdollite),
    %XPosition($01D8),
    %YPosition($02D8),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Magdollite),
    %XPosition($01D8),
    %YPosition($02D8),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Holtz),
    %XPosition($0200),
    %YPosition($0268),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Holtz),
    %XPosition($0200),
    %YPosition($0268),
    %initParam($0006),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($8000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Holtz),
    %XPosition($01B0),
    %YPosition($0250),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Holtz),
    %XPosition($01B0),
    %YPosition($0250),
    %initParam($0006),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($8000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Holtz),
    %XPosition($0254),
    %YPosition($024D),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Holtz),
    %XPosition($0254),
    %YPosition($024D),
    %initParam($0006),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($8000, $0000))
    dw $FFFF : db $04                                                    ;A1A2DC;

EnemyPopulations_PurpleFarming:
; Room $B051, state $B05E
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Gamet),
    %XPosition($0080),
    %YPosition($00B8),
    %initParam($0000),
    %properties($6800),
    %extraProperties($0000),
    %speedParams($0000, $3030))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Gamet),
    %XPosition($0080),
    %YPosition($00B8),
    %initParam($0000),
    %properties($6800),
    %extraProperties($0000),
    %speedParams($0000, $3000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Gamet),
    %XPosition($0080),
    %YPosition($00B8),
    %initParam($0000),
    %properties($6800),
    %extraProperties($0000),
    %speedParams($0000, $3000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Gamet),
    %XPosition($0080),
    %YPosition($00B8),
    %initParam($0000),
    %properties($6800),
    %extraProperties($0000),
    %speedParams($0000, $3000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Gamet),
    %XPosition($0080),
    %YPosition($00B8),
    %initParam($0000),
    %properties($6800),
    %extraProperties($0000),
    %speedParams($0000, $3000))
    dw $FFFF : db $01                                                    ;A1A32F;

EnemyPopulations_IceBeamGate:
; Room $A815, state $A822
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_ShutterGrowing),
    %XPosition($0408),
    %YPosition($0258),
    %initParam($0001),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($00F0, regional($000D, $0010)))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_ShutterGrowing),
    %XPosition($0608),
    %YPosition($0258),
    %initParam($0001),
    %properties($A800),
    %extraProperties($0000),
    %speedParams(regional($0068, $0070), $0010))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dessgeega),
    %XPosition($0104),
    %YPosition($03AF),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dessgeega),
    %XPosition($0195),
    %YPosition($035F),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dessgeega),
    %XPosition($0222),
    %YPosition($03B2),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Mella),
    %XPosition($0139),
    %YPosition($0374),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Mella),
    %XPosition($0196),
    %YPosition($03A7),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Mella),
    %XPosition($01FC),
    %YPosition($0371),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Mella),
    %XPosition($0254),
    %YPosition($0379),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Mella),
    %XPosition($0281),
    %YPosition($039E),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Mella),
    %XPosition($00B0),
    %YPosition($0362),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sova),
    %XPosition($05C8),
    %YPosition($0238),
    %initParam($0003),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0003, $0004))
    dw $FFFF : db $04                                                    ;A1A3F2;

EnemyPopulations_SpikyAcidSnakesTunnel:
; Room $AFFB, state $B008
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_YappingMaw),
    %XPosition($0188),
    %YPosition($00D8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0080, $0001))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_YappingMaw),
    %XPosition($0219),
    %YPosition($00D7),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0080, $0001))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_YappingMaw),
    %XPosition($02F8),
    %YPosition($00D8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0080, $0001))
    dw $FFFF : db $00                                                    ;A1A425;

EnemyPopulations_RedKihunterShaft:
; Room $B585, state $B592
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KihunterRed),
    %XPosition($00B9),
    %YPosition($01D6),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0050, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KihunterRedWings),
    %XPosition($00B9),
    %YPosition($01D6),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0020, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KihunterRed),
    %XPosition($004D),
    %YPosition($023A),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0050, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KihunterRedWings),
    %XPosition($004D),
    %YPosition($023A),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0020, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KihunterRed),
    %XPosition($0087),
    %YPosition($02F2),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0050, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KihunterRedWings),
    %XPosition($0087),
    %YPosition($02F2),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0020, $0000))
    dw $FFFF : db $03                                                    ;A1A488;

EnemyPopulations_FastRipper:
; Room $B2DA, state $B2E7
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Ripper2),
    %XPosition($01D8),
    %YPosition($0078),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0040, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Ripper2),
    %XPosition($01D8),
    %YPosition($0058),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0040, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Ripper2),
    %XPosition($0268),
    %YPosition($0068),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0040, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Ripper2),
    %XPosition($0268),
    %YPosition($0088),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0040, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Ripper2),
    %XPosition($0268),
    %YPosition($0048),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0040, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Ripper2),
    %XPosition($0158),
    %YPosition($0098),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0040, $0000))
    dw $FFFF : db $06                                                    ;A1A4EB;

EnemyPopulations_WaveBeam:
; Room $ADDE, state $ADEB
    dw $FFFF : db $00                                                    ;A1A4EE;

EnemyPopulations_FastPillarsSetup:
; Room $B3A5, state $B3B2
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGoldWall),
    %XPosition($00D1),
    %YPosition($0138),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($0001, $00A0))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGoldWall),
    %XPosition($002D),
    %YPosition($00B8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($0000, $00A0))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGoldWalking),
    %XPosition($00B0),
    %YPosition($0180),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($8000, $00A0))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Viola),
    %XPosition($0078),
    %YPosition($0237),
    %initParam($0002),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0006))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Viola),
    %XPosition($0088),
    %YPosition($0237),
    %initParam($0002),
    %properties($2001),
    %extraProperties($0000),
    %speedParams($0001, $0006))
    dw $FFFF : db $05                                                    ;A1A541;

EnemyPopulations_LowerNorfairElev:
; Room $AF3F, state $AF4C
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Elevator),
    %XPosition($0080),
    %YPosition($00A0),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0000, $0140))
    dw $FFFF : db $00                                                    ;A1A554;

EnemyPopulations_LNSave:
; Room $B741, state $B74E
    dw $FFFF : db $00                                                    ;A1A557;

EnemyPopulations_UpperNorfairRefill:
; Room $B026, state $B033
    dw $FFFF : db $00                                                    ;A1A55A;

EnemyPopulations_NorfairMap:
; Room $B0B4, state $B0C1
    dw $FFFF : db $00                                                    ;A1A55D;

EnemyPopulations_MickeyMouse:
; Room $B40A, state $B417
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_DessgeegaLarge),
    %XPosition($03C0),
    %YPosition($038B),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_DessgeegaLarge),
    %XPosition($0357),
    %YPosition($038A),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_DessgeegaLarge),
    %XPosition($01B1),
    %YPosition($038B),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_DessgeegaLarge),
    %XPosition($0105),
    %YPosition($0380),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($8000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_DessgeegaLarge),
    %XPosition($026A),
    %YPosition($0381),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($8000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Multiviola),
    %XPosition($0095),
    %YPosition($0377),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($000E, $0006))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Multiviola),
    %XPosition($0161),
    %YPosition($0390),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($00A8, $0006))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Multiviola),
    %XPosition($0396),
    %YPosition($0316),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0007))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Multiviola),
    %XPosition($0349),
    %YPosition($02FB),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0050, $0007))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Multiviola),
    %XPosition($0373),
    %YPosition($02A9),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($00C8, $0006))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Multiviola),
    %XPosition($0358),
    %YPosition($0238),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($00F0, $0006))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Multiviola),
    %XPosition($03CB),
    %YPosition($0214),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0048, $0005))
    dw $FFFF : db $05                                                    ;A1A620;

EnemyPopulations_GTEnergyRefill:
; Room $B305, state $B312
    dw $FFFF : db $00                                                    ;A1A623;

EnemyPopulations_Ridley:
; Room $B32E, state $B340
; Room $B32E, state $B35A
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Ridley),
    %XPosition($0030),
    %YPosition($FFF0),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $00                                                    ;A1A636;

EnemyPopulations_PostCrocPowerBombs:
; Room $AADE, state $AAEB
    dw $FFFF : db $00                                                    ;A1A639;

EnemyPopulations_IceBeam:
; Room $A890, state $A89D
    dw $FFFF : db $00                                                    ;A1A63C;

EnemyPopulations_HiJumpBoots:
; Room $A9E5, state $A9F2
    dw $FFFF : db $00                                                    ;A1A63F;

EnemyPopulations_PostCrocSave:
; Room $AAB5, state $AAC2
    dw $FFFF : db $00                                                    ;A1A642;

EnemyPopulations_FrogSpeedway:
; Room $B106, state $B113
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Beetom),
    %XPosition($02B8),
    %YPosition($0098),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Beetom),
    %XPosition($02E8),
    %YPosition($0098),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Beetom),
    %XPosition($0310),
    %YPosition($0098),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Beetom),
    %XPosition($0390),
    %YPosition($0098),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Beetom),
    %XPosition($0400),
    %YPosition($0098),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Beetom),
    %XPosition($0460),
    %YPosition($0098),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $06                                                    ;A1A6A5;

EnemyPopulations_RisingTide:
; Room $AFA3, state $AFB0
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Squeept),
    %XPosition($00E8),
    %YPosition($00F0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Squeept),
    %XPosition($00E8),
    %YPosition($00F0),
    %initParam($0002),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($8000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sova),
    %XPosition($01E8),
    %YPosition($0098),
    %initParam($0003),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0004))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sova),
    %XPosition($03E8),
    %YPosition($00A8),
    %initParam($0003),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0004))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sova),
    %XPosition($0178),
    %YPosition($00A0),
    %initParam($0003),
    %properties($2001),
    %extraProperties($0000),
    %speedParams($0002, $0004))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sova),
    %XPosition($02C8),
    %YPosition($00AB),
    %initParam($0001),
    %properties($2002),
    %extraProperties($0000),
    %speedParams($0001, $0004))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sova),
    %XPosition($0288),
    %YPosition($00A8),
    %initParam($0000),
    %properties($2003),
    %extraProperties($0000),
    %speedParams($0001, $0004))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dragon),
    %XPosition($0238),
    %YPosition($00F0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dragon),
    %XPosition($0238),
    %YPosition($00F0),
    %initParam($0002),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dragon),
    %XPosition($0338),
    %YPosition($00F0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dragon),
    %XPosition($0338),
    %YPosition($00F0),
    %initParam($0002),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dragon),
    %XPosition($0468),
    %YPosition($00F0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dragon),
    %XPosition($0468),
    %YPosition($00F0),
    %initParam($0002),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dragon),
    %XPosition($03B8),
    %YPosition($00F0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dragon),
    %XPosition($03B8),
    %YPosition($00F0),
    %initParam($0002),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Squeept),
    %XPosition($0168),
    %YPosition($00F0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Squeept),
    %XPosition($0168),
    %YPosition($00F0),
    %initParam($0002),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($8000, $0000))
    dw $FFFF : db $0B                                                    ;A1A7B8;

EnemyPopulations_PostCrocFarming:
; Room $AA82, state $AA8F
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Gamet),
    %XPosition($0130),
    %YPosition($01C8),
    %initParam($0000),
    %properties($6800),
    %extraProperties($0000),
    %speedParams($0000, $3030))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Gamet),
    %XPosition($0130),
    %YPosition($01C8),
    %initParam($0000),
    %properties($6800),
    %extraProperties($0000),
    %speedParams($0000, $3000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Gamet),
    %XPosition($0130),
    %YPosition($01C8),
    %initParam($0000),
    %properties($6800),
    %extraProperties($0000),
    %speedParams($0000, $3000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Gamet),
    %XPosition($0130),
    %YPosition($01C8),
    %initParam($0000),
    %properties($6800),
    %extraProperties($0000),
    %speedParams($0000, $3000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Gamet),
    %XPosition($0130),
    %YPosition($01C8),
    %initParam($0000),
    %properties($6800),
    %extraProperties($0000),
    %speedParams($0000, $3000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_GRipper),
    %XPosition($0100),
    %YPosition($0050),
    %initParam($0010),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($00E8, $0130))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Kamer2),
    %XPosition($0158),
    %YPosition($0148),
    %initParam($0000),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0000, $2800))
    dw $FFFF : db $02                                                    ;A1A82B;

EnemyPopulations_WorstRoomInTheGame:
; Room $B4AD, state $B4BA
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Namihe),
    %XPosition($00DA),
    %YPosition($0577),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($1001, $4007))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGoldWall),
    %XPosition($00D0),
    %YPosition($04F8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($0001, $00A0))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGoldWall),
    %XPosition($0030),
    %YPosition($0490),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($0000, $00A0))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGoldWall),
    %XPosition($00D0),
    %YPosition($0440),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($0001, $00A0))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Namihe),
    %XPosition($0027),
    %YPosition($0320),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($1011, $4007))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGoldWalking),
    %XPosition($0030),
    %YPosition($02B0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($0000, $0001))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Namihe),
    %XPosition($00DA),
    %YPosition($0388),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($1001, $4007))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGoldWalking),
    %XPosition($00D0),
    %YPosition($02E0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Namihe),
    %XPosition($00DA),
    %YPosition($0240),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($1001, $4007))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Namihe),
    %XPosition($0027),
    %YPosition($01E0),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($1011, $4007))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGoldWalking),
    %XPosition($0080),
    %YPosition($0170),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($0000, $0010))
    dw $FFFF : db $0B                                                    ;A1A8DE;

EnemyPopulations_DoubleChamber:
; Room $ADAD, state $ADBA
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Fune),
    %XPosition($0030),
    %YPosition($00D0),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($5010, $F007))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Fune),
    %XPosition($01C0),
    %YPosition($00D8),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($5000, $F007))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Kamer),
    %XPosition($0088),
    %YPosition($00A8),
    %initParam($0108),
    %properties($A800),
    %extraProperties($0404),
    %speedParams($4001, $0020))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Kamer),
    %XPosition($00D0),
    %YPosition($00E8),
    %initParam($0008),
    %properties($A800),
    %extraProperties($0808),
    %speedParams($3001, $0030))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Kamer),
    %XPosition($0110),
    %YPosition($00A8),
    %initParam($0108),
    %properties($A800),
    %extraProperties($0202),
    %speedParams($6001, $0030))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Kamer),
    %XPosition($0178),
    %YPosition($00A8),
    %initParam($0108),
    %properties($A800),
    %extraProperties($0303),
    %speedParams($5001, $0030))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Kago),
    %XPosition($02F0),
    %YPosition($01D0),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($000A, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_GRipper),
    %XPosition($02E8),
    %YPosition($00F0),
    %initParam($0010),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0298, $0338))
    dw $FFFF : db $04                                                    ;A1A962;

EnemyPopulations_GrappleBeam:
; Room $AC2B, state $AC38
    dw $FFFF : db $00                                                    ;A1A964;

EnemyPopulations_RedPirateShaft:
; Room $B139, state $B146
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateRedWalking),
    %XPosition($0050),
    %YPosition($0200),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($8001, $0008))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateRedWalking),
    %XPosition($00B0),
    %YPosition($0180),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($8000, $0008))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateRedWalking),
    %XPosition($0050),
    %YPosition($0100),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($8001, $0008))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_MZoomer),
    %XPosition($0080),
    %YPosition($0268),
    %initParam($0003),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_MZoomer),
    %XPosition($0080),
    %YPosition($01D8),
    %initParam($0003),
    %properties($2001),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_MZoomer),
    %XPosition($0080),
    %YPosition($0158),
    %initParam($0003),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_MZoomer),
    %XPosition($0080),
    %YPosition($00D8),
    %initParam($0003),
    %properties($2001),
    %extraProperties($0000),
    %speedParams($0002, $0000))
    dw $FFFF : db $07                                                    ;A1A9D7;

EnemyPopulations_CrocomireSpeedway:
; Room $A923, state $A930
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateRedWalking),
    %XPosition($08B8),
    %YPosition($0270),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($8000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Multiviola),
    %XPosition($0413),
    %YPosition($00CC),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($00F0, $0003))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateRedWalking),
    %XPosition($02F4),
    %YPosition($00B0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($8000, $0030))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Multiviola),
    %XPosition($048D),
    %YPosition($0116),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0030, $0003))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateRedWalking),
    %XPosition($039A),
    %YPosition($00E0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($8000, $0020))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Multiviola),
    %XPosition($050C),
    %YPosition($0158),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0068, $0003))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Multiviola),
    %XPosition($05AF),
    %YPosition($01C8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($00D0, $0003))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateRedWalking),
    %XPosition($09FB),
    %YPosition($0270),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($8000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateRedWalking),
    %XPosition($06E7),
    %YPosition($0290),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($8000, $0010))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Cacatac),
    %XPosition($0C58),
    %YPosition($01E3),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0100, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Cacatac),
    %XPosition($0CA8),
    %YPosition($01E3),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0100, $0000))
    dw $FFFF : db $07                                                    ;A1AA8A;

EnemyPopulations_Plowerhouse:
; Room $B482, state $B48F
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Holtz),
    %XPosition($0258),
    %YPosition($0058),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Holtz),
    %XPosition($0258),
    %YPosition($0058),
    %initParam($0006),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($8000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Holtz),
    %XPosition($0288),
    %YPosition($0058),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Holtz),
    %XPosition($0288),
    %YPosition($0058),
    %initParam($0006),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($8000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Holtz),
    %XPosition($0118),
    %YPosition($0058),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Holtz),
    %XPosition($0118),
    %YPosition($0058),
    %initParam($0006),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($8000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Holtz),
    %XPosition($01C8),
    %YPosition($0058),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Holtz),
    %XPosition($01C8),
    %YPosition($0058),
    %initParam($0006),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($8000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Holtz),
    %XPosition($0068),
    %YPosition($0058),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Holtz),
    %XPosition($0068),
    %YPosition($0058),
    %initParam($0006),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($8000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Holtz),
    %XPosition($0098),
    %YPosition($0058),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Holtz),
    %XPosition($0098),
    %YPosition($0058),
    %initParam($0006),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($8000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zebbo),
    %XPosition($00C0),
    %YPosition($00B8),
    %initParam($0000),
    %properties($6900),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zebbo),
    %XPosition($0180),
    %YPosition($00B8),
    %initParam($0000),
    %properties($6900),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zebbo),
    %XPosition($0240),
    %YPosition($00B8),
    %initParam($0000),
    %properties($6900),
    %extraProperties($0000),
    %speedParams($0002, $0000))
    dw $FFFF : db $09                                                    ;A1AB7D;

EnemyPopulations_LNFireflea:
; Room $B6EE, state $B6FB
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Fune),
    %XPosition($01F0),
    %YPosition($02D0),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0100, $0F07))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Fune),
    %XPosition($0110),
    %YPosition($01E8),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0110, $0F07))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Fune),
    %XPosition($01F0),
    %YPosition($01B0),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0100, $0F07))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Fune),
    %XPosition($01D0),
    %YPosition($00D8),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0100, $0F07))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Fune),
    %XPosition($01F0),
    %YPosition($0380),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0100, $0F07))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Boulder),
    %XPosition($0150),
    %YPosition($0130),
    %initParam($0050),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Boulder),
    %XPosition($01B8),
    %YPosition($01D0),
    %initParam($0050),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0100, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Boulder),
    %XPosition($0128),
    %YPosition($0260),
    %initParam($0050),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Fireflea),
    %XPosition($0156),
    %YPosition($0558),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0520))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Fireflea),
    %XPosition($01C8),
    %YPosition($0538),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0003, $0518))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Fireflea),
    %XPosition($0238),
    %YPosition($0558),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0520))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Fireflea),
    %XPosition($02A8),
    %YPosition($0538),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0003, $0518))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Fireflea),
    %XPosition($0170),
    %YPosition($0476),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0720))
    dw $FFFF : db $0A                                                    ;A1AC50;

EnemyPopulations_MagdolliteTunnel:
; Room $AEB4, state $AEC1
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Magdollite),
    %XPosition($00F8),
    %YPosition($00B8),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $3A60))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Magdollite),
    %XPosition($00F8),
    %YPosition($00B8),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Magdollite),
    %XPosition($00F8),
    %YPosition($00B8),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Magdollite),
    %XPosition($01E8),
    %YPosition($00B8),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $3A60))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Magdollite),
    %XPosition($01E8),
    %YPosition($00B8),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Magdollite),
    %XPosition($01E8),
    %YPosition($00B8),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Magdollite),
    %XPosition($0248),
    %YPosition($00B8),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $3A60))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Magdollite),
    %XPosition($0248),
    %YPosition($00B8),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Magdollite),
    %XPosition($0248),
    %YPosition($00B8),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Multiviola),
    %XPosition($0078),
    %YPosition($0058),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0060, $0002))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Multiviola),
    %XPosition($023C),
    %YPosition($005D),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0030, $0002))
    dw $FFFF : db $03                                                    ;A1AD05;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyPopulations_8FB3EE_A1AD06:
; Room $B3E1, state $B3EE
    dw $FFFF : db $00                                                    ;A1AD06;
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyPopulations_LavaDive:
; Room $AF14, state $AF21
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Namihe),
    %XPosition($01F0),
    %YPosition($0108),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($1001, $8005))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Namihe),
    %XPosition($0120),
    %YPosition($01D0),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($1011, $8005))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Namihe),
    %XPosition($0120),
    %YPosition($0248),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($1011, $8005))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Namihe),
    %XPosition($027F),
    %YPosition($0238),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($1001, $8005))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Namihe),
    %XPosition($0390),
    %YPosition($0118),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($1001, $8005))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Namihe),
    %XPosition($0340),
    %YPosition($0198),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($1001, $8005))
    dw $FFFF : db $06                                                    ;A1AD69;

EnemyPopulations_Pillar:
; Room $B457, state $B464
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Puromi),
    %XPosition($0190),
    %YPosition($00D0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($4010, $2001))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Puromi),
    %XPosition($02D0),
    %YPosition($00D0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($4010, $2001))
    dw $FFFF : db $00                                                    ;A1AD8C;

EnemyPopulations_CrocomireEscape:
; Room $AA0E, state $AA1B
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dragon),
    %XPosition($0380),
    %YPosition($01E8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dragon),
    %XPosition($0380),
    %YPosition($01E8),
    %initParam($0002),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Geruta),
    %XPosition($0396),
    %YPosition($007F),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Geruta),
    %XPosition($0396),
    %YPosition($007F),
    %initParam($0005),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($8000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dragon),
    %XPosition($02C0),
    %YPosition($01E8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dragon),
    %XPosition($02C0),
    %YPosition($01E8),
    %initParam($0002),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dragon),
    %XPosition($0200),
    %YPosition($01E8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dragon),
    %XPosition($0200),
    %YPosition($01E8),
    %initParam($0002),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dragon),
    %XPosition($0140),
    %YPosition($01E8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dragon),
    %XPosition($0140),
    %YPosition($01E8),
    %initParam($0002),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dragon),
    %XPosition($0080),
    %YPosition($01E8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dragon),
    %XPosition($0080),
    %YPosition($01E8),
    %initParam($0002),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($0001, $0000))
    dw $FFFF : db $06                                                    ;A1AE4F;

EnemyPopulations_LNSpringBallMaze:
; Room $B510, state $B51D
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Alcoon),
    %XPosition($0100),
    %YPosition($0200),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Alcoon),
    %XPosition($0151),
    %YPosition($0200),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Alcoon),
    %XPosition($0060),
    %YPosition($0200),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Alcoon),
    %XPosition($0198),
    %YPosition($00D8),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Alcoon),
    %XPosition($03FB),
    %YPosition($04C9),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $05                                                    ;A1AEA2;

EnemyPopulations_LNEscapePowerBombs:
; Room $B55A, state $B567
    dw $FFFF : db $00                                                    ;A1AEA5;

EnemyPopulations_PurpleShaft:
; Room $AEDF, state $AEEC
    dw $FFFF : db $00                                                    ;A1AEA8;

EnemyPopulations_RidleyETank:
; Room $B698, state $B6A5
    dw $FFFF : db $00                                                    ;A1AEAB;

EnemyPopulations_ScrewAttack:
; Room $B6C1, state $B6CE
    dw $FFFF : db $00                                                    ;A1AEAE;

EnemyPopulations_GreenBubblesMissiles:
; Room $AC83, state $AC90
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_ShutterShootable),
    %XPosition($0128),
    %YPosition($0100),
    %initParam($0008),
    %properties($A800),
    %extraProperties($FFFF),
    %speedParams($4003, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_ShutterShootable),
    %XPosition($0128),
    %YPosition($0100),
    %initParam($0008),
    %properties($A800),
    %extraProperties($FFFF),
    %speedParams($8003, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Geruta),
    %XPosition($0184),
    %YPosition($0060),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Geruta),
    %XPosition($0184),
    %YPosition($0060),
    %initParam($0005),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($8000, $0000))
    dw $FFFF : db $01                                                    ;A1AEF2;

EnemyPopulations_Amphitheatre:
; Room $B4E5, state $B4F2
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGoldWalking),
    %XPosition($01C0),
    %YPosition($00D0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($8000, $0010))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGoldWalking),
    %XPosition($02C0),
    %YPosition($00B0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($8000, $0008))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGoldWalking),
    %XPosition($02B8),
    %YPosition($0230),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($8000, $0008))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGoldWalking),
    %XPosition($0158),
    %YPosition($0120),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($8001, $0008))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGoldWalking),
    %XPosition($01D0),
    %YPosition($0440),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($8000, $0010))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGoldWalking),
    %XPosition($00C5),
    %YPosition($0450),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($8000, $00A0))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGoldWalking),
    %XPosition($037D),
    %YPosition($039D),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($8000, $0010))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGoldWalking),
    %XPosition($03C0),
    %YPosition($0310),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($8000, $0010))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateGoldWalking),
    %XPosition($0238),
    %YPosition($01A0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($8000, $0008))
    dw $FFFF : db $09                                                    ;A1AF84;

EnemyPopulations_CathedralEntrance:
; Room $A7B3, state $A7C0
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sova),
    %XPosition($0028),
    %YPosition($0100),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0003, $0004))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sova),
    %XPosition($0018),
    %YPosition($0138),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0003, $0004))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sova),
    %XPosition($00F8),
    %YPosition($0098),
    %initParam($0003),
    %properties($2001),
    %extraProperties($0000),
    %speedParams($0003, $0004))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sova),
    %XPosition($00B0),
    %YPosition($00D8),
    %initParam($0003),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0003, $0004))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dessgeega),
    %XPosition($0188),
    %YPosition($019F),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dessgeega),
    %XPosition($022F),
    %YPosition($019E),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $06                                                    ;A1AFE7;

EnemyPopulations_MainHall:
; Room $B236, state $B243
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Elevator),
    %XPosition($0480),
    %YPosition($02A2),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0001, $0018))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dragon),
    %XPosition($02D0),
    %YPosition($02F8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dragon),
    %XPosition($02D0),
    %YPosition($02F8),
    %initParam($0002),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dragon),
    %XPosition($0330),
    %YPosition($02F8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dragon),
    %XPosition($0330),
    %YPosition($02F8),
    %initParam($0002),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Hibashi),
    %XPosition($0197),
    %YPosition($02B8),
    %initParam($0000),
    %properties($2500),
    %extraProperties($0000),
    %speedParams($0050, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Hibashi),
    %XPosition($0197),
    %YPosition($02B8),
    %initParam($0000),
    %properties($2100),
    %extraProperties($0000),
    %speedParams($0000, $0001))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Hibashi),
    %XPosition($0117),
    %YPosition($02A8),
    %initParam($0000),
    %properties($2500),
    %extraProperties($0000),
    %speedParams($0060, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Hibashi),
    %XPosition($0117),
    %YPosition($02A8),
    %initParam($0000),
    %properties($2100),
    %extraProperties($0000),
    %speedParams($0000, $0001))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Hibashi),
    %XPosition($0097),
    %YPosition($0288),
    %initParam($0000),
    %properties($2500),
    %extraProperties($0000),
    %speedParams($0060, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Hibashi),
    %XPosition($0097),
    %YPosition($0288),
    %initParam($0000),
    %properties($2100),
    %extraProperties($0000),
    %speedParams($0000, $0001))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Hibashi),
    %XPosition($0217),
    %YPosition($02B8),
    %initParam($0000),
    %properties($2500),
    %extraProperties($0000),
    %speedParams($0050, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Hibashi),
    %XPosition($0217),
    %YPosition($02B8),
    %initParam($0000),
    %properties($2100),
    %extraProperties($0000),
    %speedParams($0000, $0001))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dragon),
    %XPosition($0238),
    %YPosition($02F8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dragon),
    %XPosition($0238),
    %YPosition($02F8),
    %initParam($0002),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dragon),
    %XPosition($0138),
    %YPosition($02F8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dragon),
    %XPosition($0138),
    %YPosition($02F8),
    %initParam($0002),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dragon),
    %XPosition($01B8),
    %YPosition($02F8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dragon),
    %XPosition($01B8),
    %YPosition($02F8),
    %initParam($0002),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($0001, $0000))
    dw $FFFF : db $05                                                    ;A1B11A;

EnemyPopulations_PostCrocJump:
; Room $AB8F, state $AB9C
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Mella),
    %XPosition($05C3),
    %YPosition($0253),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Mella),
    %XPosition($0599),
    %YPosition($0268),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Mella),
    %XPosition($05F1),
    %YPosition($0272),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Mella),
    %XPosition($0552),
    %YPosition($025C),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Mella),
    %XPosition($057B),
    %YPosition($027D),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_GRipper),
    %XPosition($00D1),
    %YPosition($009B),
    %initParam($0010),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($00B1, $0111))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_GRipper),
    %XPosition($0198),
    %YPosition($0068),
    %initParam($0120),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0168, $01C8))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_GRipper),
    %XPosition($0228),
    %YPosition($0098),
    %initParam($0020),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0210, $0268))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_GRipper),
    %XPosition($0360),
    %YPosition($0058),
    %initParam($0110),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0300, $03C0))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Kamer2),
    %XPosition($00B0),
    %YPosition($0298),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $2800))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Kamer2),
    %XPosition($0110),
    %YPosition($0298),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $2800))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Kamer2),
    %XPosition($0170),
    %YPosition($0298),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $2800))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Kamer2),
    %XPosition($01D0),
    %YPosition($0298),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $2800))
    dw $FFFF : db $04                                                    ;A1B1ED;

EnemyPopulations_FrogSave:
; Room $B167, state $B174
    dw $FFFF : db $00                                                    ;A1B1F0;

EnemyPopulations_CrocomireSave:
; Room $B192, state $B19F
    dw $FFFF : db $00                                                    ;A1B1F3;

EnemyPopulations_CrumbleShaft:
; Room $A8F8, state $A905
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sova),
    %XPosition($0078),
    %YPosition($0106),
    %initParam($0002),
    %properties($2001),
    %extraProperties($0000),
    %speedParams($0001, $0004))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sova),
    %XPosition($0038),
    %YPosition($0138),
    %initParam($0003),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0004))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sova),
    %XPosition($00C0),
    %YPosition($01D8),
    %initParam($0003),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0004))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sova),
    %XPosition($0080),
    %YPosition($0256),
    %initParam($0002),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0004))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sova),
    %XPosition($0080),
    %YPosition($02F6),
    %initParam($0002),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0004))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sova),
    %XPosition($00C0),
    %YPosition($0346),
    %initParam($0002),
    %properties($2001),
    %extraProperties($0000),
    %speedParams($0001, $0004))
    dw $FFFF : db $06                                                    ;A1B258;

EnemyPopulations_Wasteland:
; Room $B5D5, state $B5E2
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Hibashi),
    %XPosition($05C0),
    %YPosition($00E0),
    %initParam($0000),
    %properties($2500),
    %extraProperties($0000),
    %speedParams($0008, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Hibashi),
    %XPosition($05C0),
    %YPosition($00E0),
    %initParam($0000),
    %properties($2100),
    %extraProperties($0000),
    %speedParams($0000, $0001))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_DessgeegaLarge),
    %XPosition($0288),
    %YPosition($005A),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($8000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_DessgeegaLarge),
    %XPosition($0228),
    %YPosition($00A8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_DessgeegaLarge),
    %XPosition($02F0),
    %YPosition($00A8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_DessgeegaLarge),
    %XPosition($0138),
    %YPosition($0058),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($8000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Hibashi),
    %XPosition($0540),
    %YPosition($00E0),
    %initParam($0000),
    %properties($2500),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Hibashi),
    %XPosition($0540),
    %YPosition($00E0),
    %initParam($0000),
    %properties($2100),
    %extraProperties($0000),
    %speedParams($0000, $0001))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_ShutterShootable),
    %XPosition($0528),
    %YPosition($00E0),
    %initParam($0008),
    %properties($A800),
    %extraProperties($00FF),
    %speedParams($2003, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KzanTop),
    %XPosition($0180),
    %YPosition($025C),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0040, $5070))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KzanBottom),
    %XPosition($0180),
    %YPosition($0264),
    %initParam($0000),
    %properties($0100),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KzanTop),
    %XPosition($0180),
    %YPosition($015C),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0040, $8070))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KzanBottom),
    %XPosition($0180),
    %YPosition($0164),
    %initParam($0000),
    %properties($0100),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $04                                                    ;A1B329;

EnemyPopulations_AcidSnakesTunnel:
; Room $AFCE, state $AFDB
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Gamet),
    %XPosition($0110),
    %YPosition($00E8),
    %initParam($0000),
    %properties($6800),
    %extraProperties($0000),
    %speedParams($0000, $3030))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Gamet),
    %XPosition($0110),
    %YPosition($00E8),
    %initParam($0000),
    %properties($6800),
    %extraProperties($0000),
    %speedParams($0000, $3000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Gamet),
    %XPosition($0110),
    %YPosition($00E8),
    %initParam($0000),
    %properties($6800),
    %extraProperties($0000),
    %speedParams($0000, $3000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Gamet),
    %XPosition($0110),
    %YPosition($00E8),
    %initParam($0000),
    %properties($6800),
    %extraProperties($0000),
    %speedParams($0000, $3000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Gamet),
    %XPosition($0110),
    %YPosition($00E8),
    %initParam($0000),
    %properties($6800),
    %extraProperties($0000),
    %speedParams($0000, $3000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dragon),
    %XPosition($0200),
    %YPosition($00F0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dragon),
    %XPosition($0200),
    %YPosition($00F0),
    %initParam($0002),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dragon),
    %XPosition($02F0),
    %YPosition($00F0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dragon),
    %XPosition($02F0),
    %YPosition($00F0),
    %initParam($0002),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($0001, $0000))
    dw $FFFF : db $03                                                    ;A1B3BC;

EnemyPopulations_GrappleTutorial1:
; Room $AC00, state $AC0D
    dw $FFFF : db $00                                                    ;A1B3BF;

EnemyPopulations_BubbleMountainSave:
; Room $B0DD, state $B0EA
    dw $FFFF : db $00                                                    ;A1B3C2;

EnemyPopulations_HiJumpETank:
; Room $AA41, state $AA4E
    dw EnemyHeaders_Sova                                                 ;A1B3C5;
    dw $0177,$00B5,$0002,$2801,$0000,regional($0004, $0005),$0004        ;A1B3C7;
    dw $FFFF : db $01                                                    ;A1B3D5;

EnemyPopulations_BubbleMountain:
; Room $ACB3, state $ACC0
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Ripper2),
    %XPosition($0178),
    %YPosition($0370),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0020, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sova),
    %XPosition($0118),
    %YPosition($0380),
    %initParam($0001),
    %properties($2002),
    %extraProperties($0000),
    %speedParams($0002, $0004))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sova),
    %XPosition($0151),
    %YPosition($02DA),
    %initParam($0003),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0004))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sova),
    %XPosition($0048),
    %YPosition($0329),
    %initParam($0003),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0004))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Waver),
    %XPosition($00B9),
    %YPosition($01B8),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Waver),
    %XPosition($01C0),
    %YPosition($0220),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Waver),
    %XPosition($0093),
    %YPosition($00DE),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Cacatac),
    %XPosition($010C),
    %YPosition($0095),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0100, $0000))
    dw $FFFF : db $08                                                    ;A1B458;

EnemyPopulations_IceBeamAcid:
; Room $A75D, state $A76A
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Tripper),
    %XPosition($0190),
    %YPosition($00A8),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $1010))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Tripper),
    %XPosition($0100),
    %YPosition($00A8),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $1010))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Tripper),
    %XPosition($0070),
    %YPosition($00A8),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $1010))
    dw $FFFF : db $03                                                    ;A1B48B;

EnemyPopulations_IceBeamTutorial:
; Room $A865, state $A872
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Boyon),
    %XPosition($0078),
    %YPosition(regional($00D9, $00D5)),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0103, $0040))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Boyon),
    %XPosition($00A8),
    %YPosition(regional($00D9, $00D5)),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0103, $0040))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Boyon),
    %XPosition($00D8),
    %YPosition(regional($00D9, $00D5)),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0203, $0040))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Ripper2),
    %XPosition($0158),
    %YPosition($00A8),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0018, $0000))
    dw $FFFF : db $01                                                    ;A1B4CE;

EnemyPopulations_PostCrocMissile:
; Room $AB3B, state $AB48
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Metaree),
    %XPosition($0118),
    %YPosition($0038),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Metaree),
    %XPosition($00F8),
    %YPosition($0040),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Gamet),
    %XPosition($02B0),
    %YPosition($00E0),
    %initParam($0000),
    %properties($6800),
    %extraProperties($0000),
    %speedParams($0000, $3030))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Gamet),
    %XPosition($02B0),
    %YPosition($00E0),
    %initParam($0000),
    %properties($6800),
    %extraProperties($0000),
    %speedParams($0000, $3000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Gamet),
    %XPosition($02B0),
    %YPosition($00E0),
    %initParam($0000),
    %properties($6800),
    %extraProperties($0000),
    %speedParams($0000, $3000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Gamet),
    %XPosition($02B0),
    %YPosition($00E0),
    %initParam($0000),
    %properties($6800),
    %extraProperties($0000),
    %speedParams($0000, $3000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Gamet),
    %XPosition($02B0),
    %YPosition($00E0),
    %initParam($0000),
    %properties($6800),
    %extraProperties($0000),
    %speedParams($0000, $3000))
    dw $FFFF : db $03                                                    ;A1B541;

EnemyPopulations_Cathedral:
; Room $A788, state $A795
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Geruta),
    %XPosition($00A1),
    %YPosition($0053),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Geruta),
    %XPosition($00A1),
    %YPosition($0053),
    %initParam($0005),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($8000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Geruta),
    %XPosition($01DE),
    %YPosition($0141),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Geruta),
    %XPosition($01DE),
    %YPosition($0141),
    %initParam($0005),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($8000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Geruta),
    %XPosition($0224),
    %YPosition($007D),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Geruta),
    %XPosition($0224),
    %YPosition($007D),
    %initParam($0005),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($8000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sova),
    %XPosition($0140),
    %YPosition($00E5),
    %initParam($0003),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0004))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sova),
    %XPosition($006E),
    %YPosition($0116),
    %initParam($0003),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0004))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sova),
    %XPosition($00D8),
    %YPosition($00B8),
    %initParam($0000),
    %properties($2002),
    %extraProperties($0000),
    %speedParams($0002, $0004))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sova),
    %XPosition($029C),
    %YPosition($00F4),
    %initParam($0003),
    %properties($2001),
    %extraProperties($0000),
    %speedParams($0002, $0004))
    dw $FFFF : db $07                                                    ;A1B5E4;

EnemyPopulations_NorfairReserveTank:
; Room $AC5A, state $AC67
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dragon),
    %XPosition($0158),
    %YPosition($00F8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dragon),
    %XPosition($0158),
    %YPosition($00F8),
    %initParam($0002),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dragon),
    %XPosition($00D8),
    %YPosition($00F8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dragon),
    %XPosition($00D8),
    %YPosition($00F8),
    %initParam($0002),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dragon),
    %XPosition($0098),
    %YPosition($00F8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Dragon),
    %XPosition($0098),
    %YPosition($00F8),
    %initParam($0002),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sova),
    %XPosition($0078),
    %YPosition($0045),
    %initParam($0002),
    %properties($2001),
    %extraProperties($0000),
    %speedParams($0006, $0004))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sova),
    %XPosition($00F8),
    %YPosition($0050),
    %initParam($0002),
    %properties($2001),
    %extraProperties($0000),
    %speedParams($0006, $0004))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sova),
    %XPosition($0187),
    %YPosition($003A),
    %initParam($0002),
    %properties($2001),
    %extraProperties($0000),
    %speedParams($0006, $0004))
    dw $FFFF : db $06                                                    ;A1B678;

EnemyPopulations_GrappleTutorial2:
; Room $ABD2, state $ABDF
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Fune),
    %XPosition($00F0),
    %YPosition($0290),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($2000, $A007))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Fune),
    %XPosition($0010),
    %YPosition($01B0),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($2010, $A007))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Fune),
    %XPosition($00F0),
    %YPosition($0210),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($2000, $A007))
    dw $FFFF : db $03                                                    ;A1B6AA;

EnemyPopulations_IceBeamSnake:
; Room $A8B9, state $A8C6
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sova),
    %XPosition($0158),
    %YPosition($01B8),
    %initParam($0003),
    %properties($2800),
    %extraProperties($0000),
    %speedParams(regional($0001, $0002), $0004))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sova),
    %XPosition($0198),
    %YPosition($01B8),
    %initParam($0003),
    %properties($2800),
    %extraProperties($0000),
    %speedParams(regional($0001, $0002), $0004))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sova),
    %XPosition($0178),
    %YPosition($01B8),
    %initParam($0003),
    %properties($2800),
    %extraProperties($0000),
    %speedParams(regional($0001, $0002), $0004))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Fune),
    %XPosition($00B0),
    %YPosition($01C4),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($5000, $5007))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Fune),
    %XPosition($0020),
    %YPosition($0100),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($5010, $5007))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Fune),
    %XPosition($00B0),
    %YPosition($0144),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($5000, $5007))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Fune),
    %XPosition($0020),
    %YPosition($0290),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($5010, $5007))
    dw $FFFF : db $07                                                    ;A1B71D;

EnemyPopulations_GoldenTorizo:
; Room $B283, state $B295
; Room $B283, state $B2AF
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_GoldenTorizo),
    %XPosition($0080),
    %YPosition($0180),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $00                                                    ;A1B730;

EnemyPopulations_SpikyPlatformsTunnel:
; Room $AE07, state $AE14
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Tripper),
    %XPosition($0280),
    %YPosition($00A8),
    %initParam($0000),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0001, $0018))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Tripper),
    %XPosition($0180),
    %YPosition($00A8),
    %initParam($0000),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0000, $0718))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_ShutterShootable),
    %XPosition($0200),
    %YPosition($0008),
    %initParam($0110),
    %properties($A800),
    %extraProperties($0303),
    %speedParams($4002, $0030))
    dw $FFFF : db $02                                                    ;A1B763;

EnemyPopulations_SpeedBooster:
; Room $AD1B, state $AD28
    dw $FFFF : db $00                                                    ;A1B766;

EnemyPopulations_LNFarming:
; Room $B37A, state $B387
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Viola),
    %XPosition($0228),
    %YPosition($0088),
    %initParam($0003),
    %properties($2001),
    %extraProperties($0000),
    %speedParams($0002, $0006))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Viola),
    %XPosition($0238),
    %YPosition($00D8),
    %initParam($0002),
    %properties($2001),
    %extraProperties($0000),
    %speedParams($0002, $0006))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Viola),
    %XPosition($0168),
    %YPosition($0088),
    %initParam($0003),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0006))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Viola),
    %XPosition($0168),
    %YPosition($00D8),
    %initParam($0002),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0006))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Viola),
    %XPosition($00D8),
    %YPosition($0098),
    %initParam($0003),
    %properties($2001),
    %extraProperties($0000),
    %speedParams($0002, $0006))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zebbo),
    %XPosition($0298),
    %YPosition($00F0),
    %initParam($0000),
    %properties($6900),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zebbo),
    %XPosition($0258),
    %YPosition($00F0),
    %initParam($0000),
    %properties($6900),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zebbo),
    %XPosition($0208),
    %YPosition($00F0),
    %initParam($0000),
    %properties($6900),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zebbo),
    %XPosition($01C8),
    %YPosition($00F0),
    %initParam($0000),
    %properties($6900),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zebbo),
    %XPosition($0148),
    %YPosition($00F0),
    %initParam($0000),
    %properties($6900),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zebbo),
    %XPosition($00F8),
    %YPosition($00F0),
    %initParam($0000),
    %properties($6900),
    %extraProperties($0000),
    %speedParams($0002, $0000))
    dw $FFFF : db $0B                                                    ;A1B819;

EnemyPopulations_SingleChamber:
; Room $AD5E, state $AD6B
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Multiviola),
    %XPosition($003C),
    %YPosition($0356),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams(regional($00D0, $00D8), $0002))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Multiviola),
    %XPosition($0099),
    %YPosition($01E3),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0058, $0002))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Multiviola),
    %XPosition($00CF),
    %YPosition($00D2),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams(regional($0088, $0098), $0002))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Alcoon),
    %XPosition($0080),
    %YPosition($0338),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Alcoon),
    %XPosition($0080),
    %YPosition($0238),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Alcoon),
    %XPosition($00D8),
    %YPosition($0138),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Alcoon),
    %XPosition($0088),
    %YPosition($0138),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $04                                                    ;A1B88C;

EnemyPopulations_SpeedBoosterHall:
; Room $ACF0, state $ACFD
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Geruta),
    %XPosition($0388),
    %YPosition($0128),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Geruta),
    %XPosition($0388),
    %YPosition($0128),
    %initParam($0005),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($8000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Geruta),
    %XPosition($0488),
    %YPosition($0128),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Geruta),
    %XPosition($0488),
    %YPosition($0128),
    %initParam($0005),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($8000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Geruta),
    %XPosition($062C),
    %YPosition($0188),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Geruta),
    %XPosition($062C),
    %YPosition($0188),
    %initParam($0005),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($8000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Metaree),
    %XPosition($0120),
    %YPosition($0064),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Metaree),
    %XPosition($00F0),
    %YPosition($0056),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $05                                                    ;A1B90F;

EnemyPopulations_BatCave:
; Room $B07A, state $B087
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Gamet),
    %XPosition($0060),
    %YPosition($00B0),
    %initParam($0000),
    %properties($6800),
    %extraProperties($0000),
    %speedParams($0000, $2020))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Gamet),
    %XPosition($0060),
    %YPosition($00B0),
    %initParam($0000),
    %properties($6800),
    %extraProperties($0000),
    %speedParams($0000, $2000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Gamet),
    %XPosition($0060),
    %YPosition($00B0),
    %initParam($0000),
    %properties($6800),
    %extraProperties($0000),
    %speedParams($0000, $2000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Gamet),
    %XPosition($0060),
    %YPosition($00B0),
    %initParam($0000),
    %properties($6800),
    %extraProperties($0000),
    %speedParams($0000, $2000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Gamet),
    %XPosition($0060),
    %YPosition($00B0),
    %initParam($0000),
    %properties($6800),
    %extraProperties($0000),
    %speedParams($0000, $2000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Skree),
    %XPosition($00C8),
    %YPosition($0148),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Skree),
    %XPosition($00A8),
    %YPosition($0140),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Skree),
    %XPosition($0080),
    %YPosition($0138),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $04                                                    ;A1B992;

EnemyPopulations_KronicBoost:
; Room $AE74, state $AE81
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Viola),
    %XPosition($0188),
    %YPosition($00A8),
    %initParam($0003),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0006))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Viola),
    %XPosition($0160),
    %YPosition($01C8),
    %initParam($0003),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0006))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Viola),
    %XPosition($01A0),
    %YPosition($0208),
    %initParam($0003),
    %properties($2001),
    %extraProperties($0000),
    %speedParams($0002, $0006))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Viola),
    %XPosition($0180),
    %YPosition($0258),
    %initParam($0003),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0006))
    dw $FFFF : db $04                                                    ;A1B9D5;

EnemyPopulations_BusinessCenter:
; Room $A7DE, state $A7EB
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Elevator),
    %XPosition($0080),
    %YPosition($02C2),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0001, $0018))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sova),
    %XPosition($007B),
    %YPosition($0358),
    %initParam($0003),
    %properties($2001),
    %extraProperties($0000),
    %speedParams($0001, $0004))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sova),
    %XPosition($0090),
    %YPosition($03E8),
    %initParam($0003),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0004))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sova),
    %XPosition($0061),
    %YPosition($0438),
    %initParam($0003),
    %properties($2001),
    %extraProperties($0000),
    %speedParams($0001, $0004))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sova),
    %XPosition($00A0),
    %YPosition($0518),
    %initParam($0003),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0004))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sova),
    %XPosition($0060),
    %YPosition($0548),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0004))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sova),
    %XPosition($0081),
    %YPosition($05E8),
    %initParam($0003),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0004))
    dw $FFFF : db $06                                                    ;A1BA48;

EnemyPopulations_ThreeMusketeers:
; Room $B656, state $B663
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Hibashi),
    %XPosition($0297),
    %YPosition($0280),
    %initParam($0000),
    %properties($2500),
    %extraProperties($0000),
    %speedParams($0030, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Hibashi),
    %XPosition($0297),
    %YPosition($0280),
    %initParam($0000),
    %properties($2100),
    %extraProperties($0000),
    %speedParams($0000, $0001))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Hibashi),
    %XPosition($0337),
    %YPosition($0280),
    %initParam($0000),
    %properties($2500),
    %extraProperties($0000),
    %speedParams($0030, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Hibashi),
    %XPosition($0337),
    %YPosition($0280),
    %initParam($0000),
    %properties($2100),
    %extraProperties($0000),
    %speedParams($0000, $0001))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KihunterRed),
    %XPosition($0155),
    %YPosition($01F2),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0384, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KihunterRedWings),
    %XPosition($0155),
    %YPosition($01F2),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0020, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KihunterRed),
    %XPosition($0165),
    %YPosition($0174),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0384, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KihunterRedWings),
    %XPosition($0165),
    %YPosition($0174),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0020, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KihunterRed),
    %XPosition($014A),
    %YPosition($0108),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0384, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KihunterRedWings),
    %XPosition($014A),
    %YPosition($0108),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0020, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_ShutterShootable),
    %XPosition($02E8),
    %YPosition($025A),
    %initParam($0108),
    %properties($A800),
    %extraProperties($FF00),
    %speedParams($4003, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_ShutterShootable),
    %XPosition($0388),
    %YPosition($023A),
    %initParam($0108),
    %properties($A800),
    %extraProperties($FF00),
    %speedParams($4003, $0000))
    dw $FFFF : db $03                                                    ;A1BB0B;

EnemyPopulations_Crocomire:
; Room $A98D, state $A99F
; Room $A98D, state $A9B9
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Crocomire),
    %XPosition($0480),
    %YPosition($0078),
    %initParam(InstList_Crocomire_WaitForFirstSecondDamage_Roar),
    %properties($A800),
    %extraProperties($0004),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_CrocomireTongue),
    %XPosition($0480),
    %YPosition($0078),
    %initParam(InstList_Crocomire_WaitForFirstSecondDamage_Roar),
    %properties($A800),
    %extraProperties($0004),
    %speedParams($0000, $0000))
    dw $FFFF : db $00                                                    ;A1BB2E;

EnemyPopulations_LNElevSave:
; Room $B1BB, state $B1C8
    dw $FFFF : db $00                                                    ;A1BB31;

EnemyPopulations_Volcano:
; Room $AE32, state $AE3F
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Fune),
    %XPosition($01D0),
    %YPosition($0280),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($8000, $8005))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Fune),
    %XPosition($02E0),
    %YPosition($0210),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($8000, $0007))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Fune),
    %XPosition($0220),
    %YPosition($01C8),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($8010, $0007))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Fune),
    %XPosition($02E0),
    %YPosition($0178),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($8000, $0007))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Fune),
    %XPosition($0220),
    %YPosition($0128),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($8010, $0007))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Fune),
    %XPosition($02E0),
    %YPosition($00D8),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($8000, $0007))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_LavaRocks),
    %XPosition($00F8),
    %YPosition($02C8),
    %initParam($0000),
    %properties($2500),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_LavaRocks),
    %XPosition($0080),
    %YPosition($02C8),
    %initParam($0000),
    %properties($2500),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_LavaRocks),
    %XPosition($0088),
    %YPosition($02C8),
    %initParam($0000),
    %properties($2500),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_LavaRocks),
    %XPosition($0108),
    %YPosition($02C8),
    %initParam($0000),
    %properties($2500),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $0A                                                    ;A1BBD4;

EnemyPopulations_UpperNorfairFarming:
; Room $AF72, state $AF7F
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Fune),
    %XPosition($01F0),
    %YPosition($0190),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($2000, $2007))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Gamet),
    %XPosition($0130),
    %YPosition($01C0),
    %initParam($0000),
    %properties($6800),
    %extraProperties($0000),
    %speedParams($0000, $4050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Gamet),
    %XPosition($0130),
    %YPosition($01C0),
    %initParam($0000),
    %properties($6800),
    %extraProperties($0000),
    %speedParams($0000, $4000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Gamet),
    %XPosition($0130),
    %YPosition($01C0),
    %initParam($0000),
    %properties($6800),
    %extraProperties($0000),
    %speedParams($0000, $4000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Gamet),
    %XPosition($0130),
    %YPosition($01C0),
    %initParam($0000),
    %properties($6800),
    %extraProperties($0000),
    %speedParams($0000, $4000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Gamet),
    %XPosition($0130),
    %YPosition($01C0),
    %initParam($0000),
    %properties($6800),
    %extraProperties($0000),
    %speedParams($0000, $4000))
    dw $FFFF : db $02                                                    ;A1BC38;

EnemyPopulations_SpongeBath_1:
; Room $CD5C, state $CD88
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Bull),
    %XPosition($00F0),
    %YPosition($0088),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0003, $0003))
    dw $FFFF : db $01                                                    ;A1BC4A;

EnemyPopulations_WreckedShipETank_1:
; Room $CC27, state $CC53
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Skultera),
    %XPosition($00AD),
    %YPosition($0176),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0010, $0210))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Skultera),
    %XPosition($0240),
    %YPosition($012C),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0110, $0210))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Kamer2),
    %XPosition($0118),
    %YPosition($00A8),
    %initParam($0000),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0000, $2000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Kamer2),
    %XPosition($0180),
    %YPosition($00A8),
    %initParam($0000),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0000, $2000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Kamer2),
    %XPosition($01F0),
    %YPosition($00A8),
    %initParam($0000),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0000, $2000))
    dw $FFFF : db $02                                                    ;A1BC9D;

EnemyPopulations_WreckedShipMainShaft_0:
; Room $CAF6, state $CB08
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Coven),
    %XPosition($0038),
    %YPosition($03D8),
    %initParam($0000),
    %properties($6800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0442),
    %YPosition($034A),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($7002, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($044D),
    %YPosition($0351),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($7C02, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($04C8),
    %YPosition($03CC),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($CC03, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($04C5),
    %YPosition($03D3),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($D804, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($04CE),
    %YPosition($03D9),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($D003, $00A0))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($04CB),
    %YPosition($04CB),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($2003, $00A0))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($04CC),
    %YPosition($04D6),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($FF02, $00A0))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($04C4),
    %YPosition($04D1),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($0A03, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($04DE),
    %YPosition($04BE),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($D003, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($03A7),
    %YPosition($0521),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($7A02, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($03B9),
    %YPosition($052C),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($7E02, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($04C4),
    %YPosition($027D),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($FC02, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($04CA),
    %YPosition($028A),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($0803, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($04DB),
    %YPosition($0278),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($E003, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0425),
    %YPosition($0210),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($8402, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0424),
    %YPosition($0206),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($7802, $0040))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0145),
    %YPosition($02BA),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($9103, $0040))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($013D),
    %YPosition($02C3),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($8C02, $0040))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($010D),
    %YPosition($02DB),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($AC03, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($01AD),
    %YPosition($04E8),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($E804, $0020))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KzanTop),
    %XPosition($0260),
    %YPosition($0558),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KzanBottom),
    %XPosition($0260),
    %YPosition($0560),
    %initParam($0000),
    %properties($0100),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KzanTop),
    %XPosition($01C0),
    %YPosition($0558),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KzanBottom),
    %XPosition($01C0),
    %YPosition($0560),
    %initParam($0000),
    %properties($0100),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KzanTop),
    %XPosition($0120),
    %YPosition($0558),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KzanBottom),
    %XPosition($0120),
    %YPosition($0560),
    %initParam($0000),
    %properties($0100),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KzanTop),
    %XPosition($0080),
    %YPosition($0558),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KzanBottom),
    %XPosition($0080),
    %YPosition($0560),
    %initParam($0000),
    %properties($0100),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Atomic),
    %XPosition($0430),
    %YPosition($07D0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Atomic),
    %XPosition($04D0),
    %YPosition($07D0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $03                                                    ;A1BE90;

EnemyPopulations_BowlingAlley_0:
; Room $C98E, state $C9A0
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Chozo),
    %XPosition($04C8),
    %YPosition($018A),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($04CB),
    %YPosition($0189),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($C203, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($04CC),
    %YPosition($017C),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($DC04, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($04C5),
    %YPosition($0184),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($DE03, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($04D1),
    %YPosition($0191),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($C402, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($04CC),
    %YPosition($019D),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($D803, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0026),
    %YPosition($01D2),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($8802, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($009D),
    %YPosition($01EA),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($8C03, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($00CE),
    %YPosition($01D2),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($9802, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($00D3),
    %YPosition($01CF),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($9004, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0025),
    %YPosition($01B0),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($8802, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($002D),
    %YPosition($01B9),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($9802, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0030),
    %YPosition($01BF),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($9202, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($01E2),
    %YPosition($01DA),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($B802, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($01DD),
    %YPosition($01E3),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($8803, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($01F8),
    %YPosition($01E3),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($E003, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0275),
    %YPosition($01E1),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($D003, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($035D),
    %YPosition($01D2),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($C802, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0332),
    %YPosition($01E7),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($D002, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($035F),
    %YPosition($01D9),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($C804, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0324),
    %YPosition($01E2),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($C402, $0080))
    dw $FFFF : db $00                                                    ;A1BFE3;

EnemyPopulations_Attic_1:
; Room $CA52, state $CA7E
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KihunterYellow),
    %XPosition($0419),
    %YPosition($00C8),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($FFFF, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KihunterYellowWings),
    %XPosition($0419),
    %YPosition($00C8),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0020, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KihunterYellow),
    %XPosition($01FF),
    %YPosition($008E),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KihunterYellowWings),
    %XPosition($01FF),
    %YPosition($008E),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0020, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KihunterYellow),
    %XPosition($05D5),
    %YPosition($0076),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KihunterYellowWings),
    %XPosition($05D5),
    %YPosition($0076),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0020, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Atomic),
    %XPosition($058F),
    %YPosition($005A),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0008))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Atomic),
    %XPosition($0352),
    %YPosition($0061),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0008))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Atomic),
    %XPosition($022C),
    %YPosition($0060),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0008))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Atomic),
    %XPosition($0093),
    %YPosition($007C),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0008))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KihunterYellow),
    %XPosition($04E8),
    %YPosition($00C8),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($FFFF, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KihunterYellowWings),
    %XPosition($04E8),
    %YPosition($00C8),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0020, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Spark),
    %XPosition($00E0),
    %YPosition($0058),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0090))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Spark),
    %XPosition($0130),
    %YPosition($00B8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Spark),
    %XPosition($0290),
    %YPosition($00B8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0020))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Spark),
    %XPosition($02F0),
    %YPosition($0068),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Spark),
    %XPosition($0370),
    %YPosition($00D8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0030))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Spark),
    %XPosition($0430),
    %YPosition($0088),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Spark),
    %XPosition($04D0),
    %YPosition($0088),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0070))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Spark),
    %XPosition($05D0),
    %YPosition($00B8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0010))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Spark),
    %XPosition($0630),
    %YPosition($0078),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0060))
    dw $FFFF : db $08                                                    ;A1C138;

EnemyPopulations_Basement_1:
; Room $CC6F, state $CC9B
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Robot),
    %XPosition($004D),
    %YPosition($00B0),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Robot),
    %XPosition($0370),
    %YPosition($00B0),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Atomic),
    %XPosition($0098),
    %YPosition($004D),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0008))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Atomic),
    %XPosition($027E),
    %YPosition($00A8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0008))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Atomic),
    %XPosition($0354),
    %YPosition($0049),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0008))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Spark),
    %XPosition($0479),
    %YPosition($006A),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0020))
    dw $FFFF : db $05                                                    ;A1C19B;

EnemyPopulations_WreckedShipMap_1:
; Room $CCCB, state $CCF7
    dw $FFFF : db $00                                                    ;A1C19C;

EnemyPopulations_WSWestSuper_0:
; Room $CDA8, state $CDBA
    dw $FFFF : db $00                                                    ;A1C19F;

EnemyPopulations_SpikyDeath_0:
; Room $CB8B, state $CB9D
    dw $FFFF : db $00                                                    ;A1C1A2;

EnemyPopulations_SpongeBath_0:
; Room $CD5C, state $CD6E
    dw $FFFF : db $00                                                    ;A1C1A5;

EnemyPopulations_WreckedShipEntrance_1:
; Room $CA08, state $CA34
    dw $FFFF : db $00                                                    ;A1C1A8;

EnemyPopulations_ElectricDeath_0:
; Room $CBD5, state $CBE7
    dw $FFFF : db $00                                                    ;A1C1AB;

EnemyPopulations_BowlingAlley_1:
; Room $C98E, state $C9BA
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Chozo),
    %XPosition($04C8),
    %YPosition($018A),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Robot),
    %XPosition($02F0),
    %YPosition($0270),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Robot),
    %XPosition($0370),
    %YPosition($0270),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $02                                                    ;A1C1DE;

EnemyPopulations_AssemblyLine_0:
; Room $CAAE, state $CAC0
    dw $FFFF : db $00                                                    ;A1C1E1;

EnemyPopulations_Phantoon_1:
; Room $CD13, state $CD3F
    dw $FFFF : db $00                                                    ;A1C1E4;

EnemyPopulations_WreckedShipETank_0:
; Room $CC27, state $CC39
    dw $FFFF : db $00                                                    ;A1C1E7;

EnemyPopulations_GravitySuit_0:
; Room $CE40, state $CE52
    dw $FFFF : db $00                                                    ;A1C1EA;

EnemyPopulations_WreckedShipMap_0:
; Room $CCCB, state $CCDD
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Coven),
    %XPosition($0088),
    %YPosition($0088),
    %initParam($0000),
    %properties($6800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0058),
    %YPosition($00B8),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($B802, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0050),
    %YPosition($00A8),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($C402, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($004D),
    %YPosition($00CF),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($FA03, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($00CD),
    %YPosition($00B8),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($B004, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($00C8),
    %YPosition($00B0),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($B803, $00A0))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($00D0),
    %YPosition($00B8),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($D003, $00A0))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($008B),
    %YPosition($0027),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($7802, $00A0))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($008D),
    %YPosition($0008),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($8A02, $0050))
    dw $FFFF : db $01                                                    ;A1C27D;

EnemyPopulations_GravitySuit_1:
; Room $CE40, state $CE6C
    dw $FFFF : db $00                                                    ;A1C280;

EnemyPopulations_Basement_0:
; Room $CC6F, state $CC81
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($036B),
    %YPosition($00BB),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($C203, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0370),
    %YPosition($00B8),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($DC04, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0370),
    %YPosition($00BC),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($DE03, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0368),
    %YPosition($00C3),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($C402, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0372),
    %YPosition($00C9),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($D803, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($004E),
    %YPosition($00AA),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($8802, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0051),
    %YPosition($00AD),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($8C03, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0048),
    %YPosition($00C8),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($7002, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0052),
    %YPosition($00C2),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($9004, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0029),
    %YPosition($00AA),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($8802, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($002D),
    %YPosition($00B9),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($9802, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0030),
    %YPosition($00BF),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($9202, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($01E2),
    %YPosition($00DA),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($B802, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($01DD),
    %YPosition($00E3),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($8803, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($01F8),
    %YPosition($00E3),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($E003, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($03F3),
    %YPosition($00AF),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($D003, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($03EF),
    %YPosition($00B3),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($C802, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($03EA),
    %YPosition($00CB),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($D002, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($03CC),
    %YPosition($00DE),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($C804, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($03CE),
    %YPosition($00DE),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($C402, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_RobotNoPower),
    %XPosition($004D),
    %YPosition($00C0),
    %initParam($0000),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_RobotNoPower),
    %XPosition($0370),
    %YPosition($00C0),
    %initParam($0000),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $02                                                    ;A1C3E3;

EnemyPopulations_WreckedShipEntrance_0:
; Room $CA08, state $CA1A
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0074),
    %YPosition($0040),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($1802, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($007C),
    %YPosition($00BD),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($E002, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0096),
    %YPosition($00C5),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($B803, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0073),
    %YPosition($004A),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($7804, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($00BA),
    %YPosition($0042),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($3003, $00A0))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($00B4),
    %YPosition($00C8),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($9803, $00A0))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0041),
    %YPosition($0049),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($7802, $00A0))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0082),
    %YPosition($00BC),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($D803, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0044),
    %YPosition($004B),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($5803, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0257),
    %YPosition($0041),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($1802, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($011B),
    %YPosition($00BC),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($E802, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0112),
    %YPosition($00C4),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($F802, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($012D),
    %YPosition($021E),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($7C03, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0125),
    %YPosition($0226),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($9403, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0143),
    %YPosition($023F),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($8402, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($013F),
    %YPosition($02BF),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($A102, $0040))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0145),
    %YPosition($02BA),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($9103, $0040))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($013D),
    %YPosition($02C3),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($8C02, $0040))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($010D),
    %YPosition($02DB),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($AC03, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($01AD),
    %YPosition($04E8),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($E804, $0020))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0261),
    %YPosition($0042),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($5002, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0293),
    %YPosition($0037),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($4802, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($027A),
    %YPosition($00B5),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($CC02, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($028B),
    %YPosition($00BE),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($DD02, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0261),
    %YPosition($00CB),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($8802, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($03E9),
    %YPosition($00B3),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($D802, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($03D9),
    %YPosition($00C0),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($D802, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($03EB),
    %YPosition($00C4),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($D802, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($03DE),
    %YPosition($0051),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($7D02, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($03EF),
    %YPosition($004C),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($3C02, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($036B),
    %YPosition($004B),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($7002, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0317),
    %YPosition($00B0),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($F802, $0050))
    dw $FFFF : db $00                                                    ;A1C5E6;

EnemyPopulations_AssemblyLine_1:
; Room $CAAE, state $CADA
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Spark),
    %XPosition($01D0),
    %YPosition($005D),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0098))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Spark),
    %XPosition($0270),
    %YPosition($005B),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0040))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Spark),
    %XPosition($0090),
    %YPosition($0058),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $00A0))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Spark),
    %XPosition($00F0),
    %YPosition($0058),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0030))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Spark),
    %XPosition($012D),
    %YPosition($0058),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0010))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Spark),
    %XPosition($0190),
    %YPosition($0058),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Spark),
    %XPosition($0230),
    %YPosition($0058),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0028))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Spark),
    %XPosition($02D8),
    %YPosition($0048),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0020))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Robot),
    %XPosition($0250),
    %YPosition($0080),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Robot),
    %XPosition($0110),
    %YPosition($0080),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Robot),
    %XPosition($01B0),
    %YPosition($0080),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $03                                                    ;A1C699;

EnemyPopulations_WreckedShipSave_1:
; Room $CE8A, state $CEB6
    dw $FFFF : db $00                                                    ;A1C69C;

EnemyPopulations_WSWestSuper_1:
; Room $CDA8, state $CDD4
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Spark),
    %XPosition($009A),
    %YPosition($003A),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0030))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Spark),
    %XPosition($0034),
    %YPosition($003B),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0020))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Spark),
    %XPosition($0097),
    %YPosition($00B8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0028))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Spark),
    %XPosition($0067),
    %YPosition($00C8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0030))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Spark),
    %XPosition($00B2),
    %YPosition($00C8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0018))
    dw $FFFF : db $00                                                    ;A1C6EF;

EnemyPopulations_Attic_0:
; Room $CA52, state $CA64
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Coven),
    %XPosition($02D7),
    %YPosition($0098),
    %initParam($0000),
    %properties($6800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($06A9),
    %YPosition($00BA),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($AA02, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($06AF),
    %YPosition($00BD),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($D403, $0550))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($06AD),
    %YPosition($00C5),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($D002, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($06B9),
    %YPosition($00B2),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($F002, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0028),
    %YPosition($00B9),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($7403, $00A0))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0025),
    %YPosition($00BE),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($8803, $05A0))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($001B),
    %YPosition($00C6),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($A002, $00A0))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0033),
    %YPosition($0052),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($7803, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0028),
    %YPosition($0043),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($5002, $0550))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($040E),
    %YPosition($00E6),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($8203, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($011E),
    %YPosition($00EA),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($8402, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0114),
    %YPosition($00E6),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($8203, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($001A),
    %YPosition($0049),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($9803, $0580))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0431),
    %YPosition($00E9),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($B802, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($043D),
    %YPosition($00ED),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($BA04, $0580))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($05C3),
    %YPosition($00E3),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($C401, $0540))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($05D2),
    %YPosition($00D7),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($B802, $0040))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($01A7),
    %YPosition($0094),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($4003, $0540))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($06D5),
    %YPosition($00C5),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($E002, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Atomic),
    %XPosition($00E0),
    %YPosition($004E),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Atomic),
    %XPosition($02F0),
    %YPosition($005E),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Atomic),
    %XPosition($0630),
    %YPosition($006E),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Atomic),
    %XPosition($05D0),
    %YPosition($00BE),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Atomic),
    %XPosition($0290),
    %YPosition($00BE),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Atomic),
    %XPosition($0130),
    %YPosition($00BE),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Atomic),
    %XPosition($0370),
    %YPosition($00DE),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Atomic),
    %XPosition($04D0),
    %YPosition($007E),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Atomic),
    %XPosition($0430),
    %YPosition($007E),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $0A                                                    ;A1C8C2;

EnemyPopulations_WSEastSuper_0:
; Room $CDF1, state $CE03
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Coven),
    %XPosition($0088),
    %YPosition($0088),
    %initParam($0000),
    %properties($6800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($034F),
    %YPosition($009A),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($C203, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($00FF),
    %YPosition($00E9),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($FC04, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0354),
    %YPosition($00A6),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($DE02, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0354),
    %YPosition($00A4),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($C402, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0347),
    %YPosition($00A6),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($D802, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0175),
    %YPosition($00D1),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($8802, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0051),
    %YPosition($00AD),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($8C03, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0048),
    %YPosition($00C8),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($7002, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($02DE),
    %YPosition($0099),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($3003, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($02CB),
    %YPosition($008F),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($B802, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($002D),
    %YPosition($00B9),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($9803, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0030),
    %YPosition($00BF),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($9202, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($02C9),
    %YPosition($008A),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($B802, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($02E3),
    %YPosition($0073),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($A804, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($02E7),
    %YPosition($00AA),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($E002, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($03F3),
    %YPosition($00AF),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($D004, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($03EF),
    %YPosition($00B3),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($C802, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($03EA),
    %YPosition($00CB),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($D002, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0184),
    %YPosition($00D8),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($C802, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($00F0),
    %YPosition($00E5),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($8202, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_RobotNoPower),
    %XPosition($0178),
    %YPosition($0090),
    %initParam($0000),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_RobotNoPower),
    %XPosition($02C4),
    %YPosition($0090),
    %initParam($0000),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Atomic),
    %XPosition($00A0),
    %YPosition($0050),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Atomic),
    %XPosition($0120),
    %YPosition($0050),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Atomic),
    %XPosition($01D0),
    %YPosition($0050),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Atomic),
    %XPosition($0250),
    %YPosition($0050),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0003, $0000))
    dw $FFFF : db $07                                                    ;A1CA75;

EnemyPopulations_WreckedShipSave_0:
; Room $CE8A, state $CE9C
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Coven),
    %XPosition($0088),
    %YPosition($0088),
    %initParam($0000),
    %properties($6800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0083),
    %YPosition($00BA),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($B002, $0030))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($007B),
    %YPosition($00B5),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($CA02, $0030))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($008E),
    %YPosition($00C0),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($FA02, $0030))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0074),
    %YPosition($00C4),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($8302, $0030))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($00B9),
    %YPosition($002E),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($7B02, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($00C1),
    %YPosition($0035),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($E002, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($00BA),
    %YPosition($0036),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($F802, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($00CB),
    %YPosition($0040),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($1802, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($00C5),
    %YPosition($0046),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($FD02, $0050))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0033),
    %YPosition($00AB),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($8802, $0130))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sbug),
    %XPosition($0038),
    %YPosition($00AC),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($9002, $0030))
    dw $FFFF : db $01                                                    ;A1CB38;

EnemyPopulations_ElectricDeath_1:
; Room $CBD5, state $CC01
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Spark),
    %XPosition($0068),
    %YPosition($0258),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Spark),
    %XPosition($002A),
    %YPosition($0227),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Spark),
    %XPosition($00C8),
    %YPosition($01DD),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0010))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Spark),
    %XPosition($0086),
    %YPosition($018A),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0090))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Spark),
    %XPosition($004F),
    %YPosition($0033),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0090))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Spark),
    %XPosition($0035),
    %YPosition($00DA),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0010))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Spark),
    %XPosition($005C),
    %YPosition($0098),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $00A0))
    dw $FFFF : db $00                                                    ;A1CBAB;

EnemyPopulations_SpikyDeath_1:
; Room $CB8B, state $CBB7
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KzanTop),
    %XPosition($0050),
    %YPosition($0060),
    %initParam($0000),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0040, $6810))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KzanBottom),
    %XPosition($0050),
    %YPosition($0068),
    %initParam($0000),
    %properties($0100),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KzanTop),
    %XPosition($00A0),
    %YPosition($0060),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0040, $680C))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KzanBottom),
    %XPosition($00A0),
    %YPosition($0068),
    %initParam($0000),
    %properties($0100),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KzanTop),
    %XPosition($0100),
    %YPosition($0060),
    %initParam($0000),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0040, $6811))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KzanBottom),
    %XPosition($0100),
    %YPosition($0068),
    %initParam($0000),
    %properties($0100),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KzanTop),
    %XPosition($0160),
    %YPosition($0060),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0040, $680A))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KzanBottom),
    %XPosition($0160),
    %YPosition($0068),
    %initParam($0000),
    %properties($0100),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KzanTop),
    %XPosition($01B0),
    %YPosition($0060),
    %initParam($0000),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0040, $6814))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KzanBottom),
    %XPosition($01B0),
    %YPosition($0068),
    %initParam($0000),
    %properties($0100),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $00                                                    ;A1CC4E;

EnemyPopulations_WSEastSuper_1:
; Room $CDF1, state $CE1D
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Robot),
    %XPosition($0178),
    %YPosition($0080),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Robot),
    %XPosition($02C0),
    %YPosition($0080),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Bull),
    %XPosition($00E0),
    %YPosition($0078),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0003, $0003))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Bull),
    %XPosition($0210),
    %YPosition($0075),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0003, $0003))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Spark),
    %XPosition($00A0),
    %YPosition($0050),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0080))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Spark),
    %XPosition($0120),
    %YPosition($0050),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0010))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Spark),
    %XPosition($01D0),
    %YPosition($0050),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $00A0))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Spark),
    %XPosition($0250),
    %YPosition($0050),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0080))
    dw $FFFF : db $04                                                    ;A1CCD1;

EnemyPopulations_Phantoon_0:
; Room $CD13, state $CD25
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PhantoonBody),
    %XPosition($0080),
    %YPosition($0060),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0004),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PhantoonEye),
    %XPosition($0080),
    %YPosition($0060),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0004),
    %speedParams($0000, $0001))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PhantoonTentacles),
    %XPosition($0080),
    %YPosition($0060),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0004),
    %speedParams($0000, $0002))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PhantoonMouth),
    %XPosition($0080),
    %YPosition($0060),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0004),
    %speedParams($0000, $0003))
    dw $FFFF : db $00                                                    ;A1CD14;

EnemyPopulations_WreckedShipMainShaft_1:
; Room $CAF6, state $CB22
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Spark),
    %XPosition($0498),
    %YPosition($02A8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0030))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Spark),
    %XPosition($0470),
    %YPosition($0359),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0028))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Spark),
    %XPosition($0420),
    %YPosition($048C),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0020))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Spark),
    %XPosition($04C8),
    %YPosition($0508),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0020))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Spark),
    %XPosition($0488),
    %YPosition($05BC),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0018))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Spark),
    %XPosition($0469),
    %YPosition($071A),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Spark),
    %XPosition($0418),
    %YPosition($0788),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0030))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Atomic),
    %XPosition($0478),
    %YPosition($0252),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0008))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Atomic),
    %XPosition($04D5),
    %YPosition($02AB),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0008))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Atomic),
    %XPosition($04C0),
    %YPosition($0507),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0008))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Atomic),
    %XPosition($0426),
    %YPosition($05B9),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0008))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KzanTop),
    %XPosition($0260),
    %YPosition($0558),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0020, $5030))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KzanBottom),
    %XPosition($0260),
    %YPosition($0560),
    %initParam($0000),
    %properties($0100),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KzanTop),
    %XPosition($01C0),
    %YPosition($0558),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0020, $5030))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KzanBottom),
    %XPosition($01C0),
    %YPosition($0560),
    %initParam($0000),
    %properties($0100),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KzanTop),
    %XPosition($0120),
    %YPosition($0558),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0020, $5030))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KzanBottom),
    %XPosition($0120),
    %YPosition($0560),
    %initParam($0000),
    %properties($0100),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KzanTop),
    %XPosition($0080),
    %YPosition($0558),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0020, $5030))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_KzanBottom),
    %XPosition($0080),
    %YPosition($0560),
    %initParam($0000),
    %properties($0100),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Spark),
    %XPosition($04D0),
    %YPosition($07C8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0030))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Spark),
    %XPosition($0430),
    %YPosition($07C8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0020))
    dw $FFFF : db $04                                                    ;A1CE67;

EnemyPopulations_MtEverest:
; Room $D0B9, state $D0C6
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Powamp),
    %XPosition($0200),
    %YPosition($0180),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0001, $0070))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Powamp),
    %XPosition($0200),
    %YPosition($0180),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Powamp),
    %XPosition($0308),
    %YPosition($0200),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0001, $0120))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Powamp),
    %XPosition($0308),
    %YPosition($0200),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Powamp),
    %XPosition($0400),
    %YPosition($0230),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0001, $0030))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Powamp),
    %XPosition($0400),
    %YPosition($0230),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sciser),
    %XPosition($02F0),
    %YPosition($0387),
    %initParam($0002),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sciser),
    %XPosition($0228),
    %YPosition($3B60),
    %initParam($0002),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0004, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sciser),
    %XPosition($0168),
    %YPosition($0240),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sciser),
    %XPosition($03C0),
    %YPosition($03B8),
    %initParam($0003),
    %properties($2001),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sciser),
    %XPosition($0268),
    %YPosition($02A0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0004, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sciser),
    %XPosition($0499),
    %YPosition($0358),
    %initParam($0001),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0000))
    dw $FFFF : db $09                                                    ;A1CF2A;

EnemyPopulations_HalfieClimb:
; Room $D913, state $D920
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Oum),
    %XPosition($0250),
    %YPosition($0260),
    %initParam($0000),
    %properties($A800),
    %extraProperties($0004),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Oum),
    %XPosition($02D0),
    %YPosition($0260),
    %initParam($0000),
    %properties($A800),
    %extraProperties($0004),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Oum),
    %XPosition($0370),
    %YPosition($0260),
    %initParam($0000),
    %properties($A800),
    %extraProperties($0004),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Mochtroid),
    %XPosition($00A0),
    %YPosition($0238),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Mochtroid),
    %XPosition($0050),
    %YPosition($0190),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Mochtroid),
    %XPosition($0060),
    %YPosition($0080),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $06                                                    ;A1CF8D;

EnemyPopulations_WateringHole:
; Room $D13B, state $D148
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Choot),
    %XPosition($0078),
    %YPosition($01E0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0005, $0008))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zeb),
    %XPosition($0110),
    %YPosition($00CC),
    %initParam($0000),
    %properties($6900),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zeb),
    %XPosition($0190),
    %YPosition($00CC),
    %initParam($0000),
    %properties($6900),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $03                                                    ;A1CFC0;

EnemyPopulations_CrabShaft:
; Room $D1A3, state $D1B0
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sciser),
    %XPosition($0170),
    %YPosition($0367),
    %initParam($0002),
    %properties($2801),
    %extraProperties($0000),
    %speedParams(regional($0003, $0002), $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sciser),
    %XPosition($0030),
    %YPosition($03B8),
    %initParam($0003),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sciser),
    %XPosition($00E0),
    %YPosition($0367),
    %initParam($0002),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sciser),
    %XPosition($0080),
    %YPosition($00B8),
    %initParam($0003),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0004, $0000))
    dw $FFFF : db $04                                                    ;A1D003;

EnemyPopulations_MaridiaElev:
; Room $D30B, state $D318
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Elevator),
    %XPosition($0080),
    %YPosition($02C0),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0001, $0018))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Ripper),
    %XPosition($00D0),
    %YPosition($0314),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0010, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Ripper),
    %XPosition($0070),
    %YPosition($0384),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0010, $0001))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Ripper),
    %XPosition($0080),
    %YPosition($03F4),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0010, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Ripper),
    %XPosition($0090),
    %YPosition($0454),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0010, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Ripper),
    %XPosition($0040),
    %YPosition($04C8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0010, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Ripper),
    %XPosition($0038),
    %YPosition($02D0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0010, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Owtch),
    %XPosition($0098),
    %YPosition($05C8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0300, $0104))
    dw $FFFF : db $07                                                    ;A1D086;

EnemyPopulations_Colosseum:
; Room $D72A, state $D737
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Mochtroid),
    %XPosition($0080),
    %YPosition($0078),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Mochtroid),
    %XPosition($0290),
    %YPosition($0068),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Mochtroid),
    %XPosition($0450),
    %YPosition($00B0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Mochtroid),
    %XPosition($0490),
    %YPosition($0060),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Mochtroid),
    %XPosition($0660),
    %YPosition($0088),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Mochtroid),
    %XPosition($00A8),
    %YPosition($01A0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Mochtroid),
    %XPosition($0168),
    %YPosition($0158),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Mochtroid),
    %XPosition($0630),
    %YPosition($01A0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $08                                                    ;A1D109;

EnemyPopulations_AqueductSave:
; Room $D765, state $D772
    dw $FFFF : db $00                                                    ;A1D10C;

EnemyPopulations_ThePrecious:
; Room $D78F, state $D7A1
; Room $D78F, state $D7BB
    dw $FFFF : db $00                                                    ;A1D10F;

EnemyPopulations_BotwoonETank:
; Room $D7E4, state $D7F1
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Puyo),
    %XPosition($0120),
    %YPosition($0080),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0016))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Puyo),
    %XPosition($0190),
    %YPosition($0070),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0016))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Puyo),
    %XPosition($01F0),
    %YPosition($0080),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0016))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Puyo),
    %XPosition($0250),
    %YPosition($0080),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0016))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Puyo),
    %XPosition($03F0),
    %YPosition($00AC),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0010, $0016))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zoa),
    %XPosition($0560),
    %YPosition($00D8),
    %initParam($0000),
    %properties($6100),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zoa),
    %XPosition($0560),
    %YPosition($00E0),
    %initParam($0000),
    %properties($6100),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zoa),
    %XPosition($0560),
    %YPosition($00E8),
    %initParam($0000),
    %properties($6100),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zoa),
    %XPosition($0560),
    %YPosition($00F0),
    %initParam($0000),
    %properties($6100),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zoa),
    %XPosition($0560),
    %YPosition($00F8),
    %initParam($0000),
    %properties($6100),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $0A                                                    ;A1D1B2;

EnemyPopulations_DraygonSave:
; Room $D81A, state $D827
    dw $FFFF : db $00                                                    ;A1D1B5;

EnemyPopulations_MaridiaMissileRefill:
; Room $D845, state $D852
    dw $FFFF : db $00                                                    ;A1D1B8;

EnemyPopulations_PlasmaBeachQuicksand:
; Room $D86E, state $D87B
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Bull),
    %XPosition($0020),
    %YPosition($0038),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Bull),
    %XPosition($00E0),
    %YPosition($0078),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0001, $0001))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Bull),
    %XPosition($0058),
    %YPosition($00C8),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0005, $0007))
    dw $FFFF : db $03                                                    ;A1D1EB;

EnemyPopulations_BotwoonQuicksand:
; Room $D898, state $D8A5
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Bull),
    %XPosition($0048),
    %YPosition($0020),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0001, $0001))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Bull),
    %XPosition($0048),
    %YPosition($0068),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0003, $0002))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Bull),
    %XPosition($00F0),
    %YPosition($0090),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0005, $0006))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Bull),
    %XPosition($0048),
    %YPosition($00D0),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0001, $0007))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Bull),
    %XPosition($0100),
    %YPosition($0038),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0002, $0002))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Bull),
    %XPosition($01B8),
    %YPosition($0028),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0001, $0001))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Bull),
    %XPosition($01C8),
    %YPosition($0068),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0003, $0002))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Bull),
    %XPosition($01E0),
    %YPosition($00C0),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0001, $0007))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Bull),
    %XPosition($0100),
    %YPosition($00E0),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0002, $0007))
    dw $FFFF : db $09                                                    ;A1D27E;

EnemyPopulations_Shaktool:
; Room $D8C5, state $D8D7
; Room $D8C5, state $D8F1
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Shaktool),
    %XPosition($00A8),
    %YPosition($00B8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Shaktool),
    %XPosition($00A8),
    %YPosition($00B8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0002))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Shaktool),
    %XPosition($00A8),
    %YPosition($00B8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0004))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Shaktool),
    %XPosition($00A8),
    %YPosition($00B8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0006))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Shaktool),
    %XPosition($00A8),
    %YPosition($00B8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0008))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Shaktool),
    %XPosition($00A8),
    %YPosition($00B8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $000A))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Shaktool),
    %XPosition($00A8),
    %YPosition($00B8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $000C))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Yard),
    %XPosition($0398),
    %YPosition($00B8),
    %initParam($0006),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Yard),
    %XPosition($03D8),
    %YPosition($0050),
    %initParam($0002),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0001, $0000))
    dw $FFFF : db $03                                                    ;A1D311;

EnemyPopulations_Draygon_0:
; Room $DA60, state $DA72
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_DraygonBody),
    %XPosition($FFB0),
    %YPosition($FFB0),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0004),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_DraygonEye),
    %XPosition($FFB0),
    %YPosition($FFB0),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0004),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_DraygonTail),
    %XPosition($FFB0),
    %YPosition($FFB0),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0004),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_DraygonArms),
    %XPosition($FFB0),
    %YPosition($FFB0),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0004),
    %speedParams($0000, $0000))
    dw $FFFF : db $00                                                    ;A1D354;

EnemyPopulations_Aqueduct:
; Room $D5A7, state $D5B4
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Yard),
    %XPosition($0544),
    %YPosition($01D8),
    %initParam($0007),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0004, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Yard),
    %XPosition($0220),
    %YPosition($0294),
    %initParam($0006),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0003, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Yard),
    %XPosition($0420),
    %YPosition($0264),
    %initParam($0004),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0005, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Yard),
    %XPosition($01D8),
    %YPosition($0130),
    %initParam($0003),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0007, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Yard),
    %XPosition($0550),
    %YPosition($02B8),
    %initParam($0004),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0002, $0000))
    dw $FFFF : db $05                                                    ;A1D3A7;

EnemyPopulations_RedFish:
; Room $D104, state $D111
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Skultera),
    %XPosition($02C0),
    %YPosition($01B0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0008, $1001))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zebbo),
    %XPosition($0088),
    %YPosition($00CC),
    %initParam($0000),
    %properties($6900),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zebbo),
    %XPosition($0088),
    %YPosition($00D4),
    %initParam($0000),
    %properties($6900),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zebbo),
    %XPosition($0088),
    %YPosition($00DC),
    %initParam($0000),
    %properties($6900),
    %extraProperties($0000),
    %speedParams($0002, $0000))
    dw $FFFF : db $04                                                    ;A1D3EA;

EnemyPopulations_Plasma:
; Room $D2AA, state $D2B7
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateMagentaWalking),
    %XPosition($0100),
    %YPosition($0080),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($8001, $0020))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateMagentaWalking),
    %XPosition($0080),
    %YPosition($01D0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($8000, $0030))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateMagentaWalking),
    %XPosition($01B0),
    %YPosition($01D0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($8001, $0030))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateMagentaWall),
    %XPosition($0030),
    %YPosition($0180),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($0000, $01A0))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateMagentaWall),
    %XPosition($01D0),
    %YPosition($0130),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($0001, $01A0))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateMagentaWalking),
    %XPosition($0078),
    %YPosition($0280),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($8001, $0080))
    dw $FFFF : db $06                                                    ;A1D44D;

EnemyPopulations_SpaceJump:
; Room $D9AA, state $D9B7
    dw $FFFF : db $00                                                    ;A1D450;

EnemyPopulations_Pants:
; Room $D646, state $D653
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Menu),
    %XPosition($0050),
    %YPosition($0050),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Menu),
    %XPosition($0030),
    %YPosition($0078),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Menu),
    %XPosition($00B8),
    %YPosition($0050),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Puyo),
    %XPosition($0170),
    %YPosition($029C),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0080, $0016))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Puyo),
    %XPosition($0160),
    %YPosition($01FC),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0080, $0016))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Menu),
    %XPosition($0170),
    %YPosition($0078),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Menu),
    %XPosition($0198),
    %YPosition($0070),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Menu),
    %XPosition($0090),
    %YPosition($0070),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Puyo),
    %XPosition($01C0),
    %YPosition($02DC),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0020, $0016))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Puyo),
    %XPosition($0180),
    %YPosition($032C),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0030, $0016))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Puyo),
    %XPosition($01A0),
    %YPosition($019C),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0040, $0016))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Puyo),
    %XPosition($0150),
    %YPosition($03F0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0010, $0008))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Puyo),
    %XPosition($01B0),
    %YPosition($03F0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0008, $0008))
    dw $FFFF : db $07                                                    ;A1D523;

EnemyPopulations_GlassTunnelSave:
; Room $CED2, state $CEDF
    dw $FFFF : db $00                                                    ;A1D526;

EnemyPopulations_GlassTunnel:
; Room $CEFB, state $CF0D
; Room $CEFB, state $CF27
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_NoobTubeCrack),
    %XPosition($0080),
    %YPosition($0100),
    %initParam($0000),
    %properties($2200),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $00                                                    ;A1D53B;

EnemyPopulations_WestTunnel:
; Room $CF54, state $CF61
    dw $FFFF : db $00                                                    ;A1D53C;

EnemyPopulations_EastTunnel:
; Room $CF80, state $CF8D
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Boyon),
    %XPosition($0088),
    %YPosition($00C0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0104, $0008))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Boyon),
    %XPosition($01E8),
    %YPosition($00D0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0004, $0008))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Boyon),
    %XPosition($0218),
    %YPosition($00D0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0104, $0020))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Boyon),
    %XPosition($0278),
    %YPosition($00D0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0304, $0008))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Boyon),
    %XPosition($02D8),
    %YPosition($00D0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0306, $0008))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Boyon),
    %XPosition($0308),
    %YPosition($00D0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0304, $0008))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Boyon),
    %XPosition($0368),
    %YPosition($00D0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0004, $0008))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zebbo),
    %XPosition($00B8),
    %YPosition($00C8),
    %initParam($0000),
    %properties($6900),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zebbo),
    %XPosition($02A8),
    %YPosition($00C8),
    %initParam($0000),
    %properties($6900),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zebbo),
    %XPosition($0248),
    %YPosition($00C8),
    %initParam($0000),
    %properties($6900),
    %extraProperties($0000),
    %speedParams($0002, $0000))
    dw $FFFF : db $03                                                    ;A1D5DF;

EnemyPopulations_MamaTurtle:
; Room $D055, state $D062
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_MamaTurtle),
    %XPosition($01D8),
    %YPosition($03CD),
    %initParam($0000),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_BabyTurtle),
    %XPosition($01B0),
    %YPosition($03CD),
    %initParam($0000),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($FFFF, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_BabyTurtle),
    %XPosition($01D8),
    %YPosition($03CD),
    %initParam($0000),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($FFFF, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_BabyTurtle),
    %XPosition($01E8),
    %YPosition($03CD),
    %initParam($0000),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_BabyTurtle),
    %XPosition($0218),
    %YPosition($03CD),
    %initParam($0000),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0001, $0000))
    dw $FFFF : db $01                                                    ;A1D632;

EnemyPopulations_CrabTunnel:
; Room $D08A, state $D097
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sciser),
    %XPosition($0080),
    %YPosition($0047),
    %initParam($0002),
    %properties($2001),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sciser),
    %XPosition($0130),
    %YPosition($0087),
    %initParam($0002),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sciser),
    %XPosition($01C0),
    %YPosition($00C8),
    %initParam($0003),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0003, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sciser),
    %XPosition($0200),
    %YPosition($0047),
    %initParam($0002),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sciser),
    %XPosition($02B0),
    %YPosition($00C8),
    %initParam($0003),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sciser),
    %XPosition($0370),
    %YPosition($0047),
    %initParam($0002),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0000))
    dw $FFFF : db $06                                                    ;A1D695;

EnemyPopulations_NWestMaridiaBug:
; Room $D16D, state $D17A
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Owtch),
    %XPosition($0040),
    %YPosition($01C8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0101, $0004))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Owtch),
    %XPosition($00B8),
    %YPosition($01C8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0100, $0108))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Owtch),
    %XPosition($0170),
    %YPosition($01C8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0100, $0308))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Owtch),
    %XPosition($0198),
    %YPosition($01C8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0301, $0104))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Owtch),
    %XPosition($0290),
    %YPosition($01B8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0101, $0008))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Owtch),
    %XPosition($0308),
    %YPosition($01C8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0500, $0104))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Owtch),
    %XPosition($0378),
    %YPosition($01C8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0501, $0108))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Menu),
    %XPosition($0020),
    %YPosition($0110),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Menu),
    %XPosition($0018),
    %YPosition($0140),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Menu),
    %XPosition($0010),
    %YPosition($0170),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Menu),
    %XPosition($02F0),
    %YPosition($0160),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Menu),
    %XPosition($0360),
    %YPosition($0140),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $07                                                    ;A1D758;

EnemyPopulations_PseudoPlasmaSpark:
; Room $D1DD, state $D1EA
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Owtch),
    %XPosition($0180),
    %YPosition($02B8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0101, $0208))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Choot),
    %XPosition($00F0),
    %YPosition($01A4),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0203, $0002))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Choot),
    %XPosition($0210),
    %YPosition($017C),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0004, $0004))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Choot),
    %XPosition($02A8),
    %YPosition($013C),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0102, $0010))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Choot),
    %XPosition($0310),
    %YPosition($00DC),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0008))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Choot),
    %XPosition($0368),
    %YPosition($009C),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0004))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Skultera),
    %XPosition($0070),
    %YPosition($0258),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0010, $0210))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Skultera),
    %XPosition($01C0),
    %YPosition($0280),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0110, $0210))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Choot),
    %XPosition($03B8),
    %YPosition($01E0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0005, $0008))
    dw $FFFF : db $09                                                    ;A1D7EB;

EnemyPopulations_WestSandHallTunnel:
; Room $D252, state $D25F
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sciser),
    %XPosition($0088),
    %YPosition($0067),
    %initParam($0002),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0004, $0000))
    dw $FFFF : db $01                                                    ;A1D7FE;

EnemyPopulations_PlasmaTutorial:
; Room $D27E, state $D28B
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Puyo),
    %XPosition($0057),
    %YPosition($009C),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0F00, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Puyo),
    %XPosition($0062),
    %YPosition($009C),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0F00, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Puyo),
    %XPosition($0069),
    %YPosition($009C),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0F00, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Puyo),
    %XPosition($005B),
    %YPosition($0098),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0E00, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Puyo),
    %XPosition($0065),
    %YPosition($0098),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0E00, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Puyo),
    %XPosition($0061),
    %YPosition($0094),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0D00, $0000))
    dw $FFFF : db $06                                                    ;A1D861;

EnemyPopulations_ThreadTheNeedle:
; Room $D2D9, state $D2E6
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Puyo),
    %XPosition($0118),
    %YPosition($008C),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0020, $0016))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Puyo),
    %XPosition($0144),
    %YPosition($00AC),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0020, $0016))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Puyo),
    %XPosition($02C4),
    %YPosition($008C),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0040, $0016))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Puyo),
    %XPosition($05F8),
    %YPosition($006C),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0030, $0016))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Puyo),
    %XPosition($0410),
    %YPosition($006C),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0020, $0016))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Puyo),
    %XPosition($0470),
    %YPosition($008C),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0040, $0016))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Puyo),
    %XPosition($0440),
    %YPosition($005C),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0010, $0016))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Choot),
    %XPosition($00D8),
    %YPosition($008C),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0201, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Choot),
    %XPosition($01B0),
    %YPosition($00AC),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0202, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Choot),
    %XPosition($0318),
    %YPosition($006C),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0201, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Choot),
    %XPosition($0518),
    %YPosition($00AC),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0202, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Choot),
    %XPosition($05A8),
    %YPosition($008C),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0102, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Choot),
    %XPosition($0278),
    %YPosition($00AC),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0003, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Choot),
    %XPosition($03A8),
    %YPosition($00AC),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0003, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Choot),
    %XPosition($065C),
    %YPosition($00AC),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0202, $0000))
    dw $FFFF : db $0F                                                    ;A1D954;

EnemyPopulations_PlasmaSpark:
; Room $D340, state $D34D
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Owtch),
    %XPosition($0350),
    %YPosition($04F8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0100, $0304))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Owtch),
    %XPosition($0338),
    %YPosition($04F8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0101, $0204))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Owtch),
    %XPosition($0170),
    %YPosition($0568),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0301, $0002))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Owtch),
    %XPosition($01A0),
    %YPosition($05C8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0501, $0204))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Choot),
    %XPosition($0100),
    %YPosition($029C),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0010))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Choot),
    %XPosition($0230),
    %YPosition($039C),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0005, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Choot),
    %XPosition($0300),
    %YPosition($03A4),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0207, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Choot),
    %XPosition($01E0),
    %YPosition($00AC),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0010))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Choot),
    %XPosition($0270),
    %YPosition($00EC),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0010))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Skultera),
    %XPosition($0300),
    %YPosition($0420),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0010, $0210))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Skultera),
    %XPosition($0270),
    %YPosition($0488),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0110, $0210))
    dw $FFFF : db $0B                                                    ;A1DA07;

EnemyPopulations_Toilet:
; Room $D408, state $D415
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Mochtroid),
    %XPosition($00A0),
    %YPosition($0388),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Puyo),
    %XPosition($0064),
    %YPosition($0358),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0010, $0004))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Yard),
    %XPosition($0030),
    %YPosition($0698),
    %initParam($0006),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0002, $0000))
    dw $FFFF : db $03                                                    ;A1DA3A;

EnemyPopulations_WestSandHall:
; Room $D461, state $D46E
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Evir),
    %XPosition($01F8),
    %YPosition($00A0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $F808))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Evir),
    %XPosition($01F8),
    %YPosition($00A0),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_EvirProjectile),
    %XPosition($01F8),
    %YPosition($00A0),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Evir),
    %XPosition($02E0),
    %YPosition($0078),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $D00C))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Evir),
    %XPosition($02E0),
    %YPosition($0078),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_EvirProjectile),
    %XPosition($02E0),
    %YPosition($0078),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Evir),
    %XPosition($0340),
    %YPosition($00A0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $F808))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Evir),
    %XPosition($0340),
    %YPosition($00A0),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_EvirProjectile),
    %XPosition($0340),
    %YPosition($00A0),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0002, $0000))
    dw $FFFF : db $03                                                    ;A1DACD;

EnemyPopulations_Oasis:
; Room $D48E, state $D49B
    dw $FFFF : db $00                                                    ;A1DAD0;

EnemyPopulations_EastSandHall:
; Room $D4C2, state $D4CF
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Evir),
    %XPosition($00A8),
    %YPosition($00A0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $F808))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Evir),
    %XPosition($00A8),
    %YPosition($00A0),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_EvirProjectile),
    %XPosition($00A8),
    %YPosition($00A0),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Evir),
    %XPosition($0100),
    %YPosition($0078),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $D00C))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Evir),
    %XPosition($0100),
    %YPosition($0078),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_EvirProjectile),
    %XPosition($0100),
    %YPosition($0078),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Evir),
    %XPosition($0220),
    %YPosition($0078),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $D00C))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Evir),
    %XPosition($0220),
    %YPosition($0078),
    %initParam($0000),
    %properties($2400),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_EvirProjectile),
    %XPosition($0220),
    %YPosition($0078),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0002, $0000))
    dw $FFFF : db $03                                                    ;A1DB63;

EnemyPopulations_WestAqueductQuicksand:
; Room $D54D, state $D55A
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Bull),
    %XPosition($0028),
    %YPosition($00B8),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0008, $0001))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Bull),
    %XPosition($0048),
    %YPosition($0138),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0008, $0001))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Bull),
    %XPosition($00B8),
    %YPosition($0118),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0006, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Bull),
    %XPosition($00A8),
    %YPosition($0178),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0007, $0002))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Bull),
    %XPosition($00D8),
    %YPosition($0068),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($000A, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Bull),
    %XPosition($0028),
    %YPosition($0038),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($000A, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Bull),
    %XPosition($0070),
    %YPosition($01B8),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0007, $0002))
    dw $FFFF : db $07                                                    ;A1DBD6;

EnemyPopulations_EastAqueductQuicksand:
; Room $D57A, state $D587
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Bull),
    %XPosition($0038),
    %YPosition($00D8),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0009, $0001))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Bull),
    %XPosition($00D8),
    %YPosition($0098),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($000A, $0001))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Bull),
    %XPosition($0058),
    %YPosition($0178),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0007, $0002))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Bull),
    %XPosition($00B8),
    %YPosition($0138),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0008, $0002))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Bull),
    %XPosition($0028),
    %YPosition($0028),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($000A, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Bull),
    %XPosition($0098),
    %YPosition($01C8),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0007, $0002))
    dw $FFFF : db $06                                                    ;A1DC39;

EnemyPopulations_Butterfly:
; Room $D5EC, state $D5F9
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zoa),
    %XPosition($0098),
    %YPosition($00D8),
    %initParam($0000),
    %properties($6100),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zoa),
    %XPosition($0068),
    %YPosition($00D8),
    %initParam($0000),
    %properties($6100),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zoa),
    %XPosition($0098),
    %YPosition($00E0),
    %initParam($0000),
    %properties($6100),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $03                                                    ;A1DC6C;

EnemyPopulations_BotwoonHallway:
; Room $D617, state $D624
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Mochtroid),
    %XPosition($0030),
    %YPosition($0048),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Mochtroid),
    %XPosition($00C0),
    %YPosition($0090),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Mochtroid),
    %XPosition($0170),
    %YPosition($0048),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Mochtroid),
    %XPosition($0298),
    %YPosition($0098),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Mochtroid),
    %XPosition($02F0),
    %YPosition($0780),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Puyo),
    %XPosition($0260),
    %YPosition($0058),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0020, $0008))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Puyo),
    %XPosition($0360),
    %YPosition($0058),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0020, $0008))
    dw $FFFF : db $07                                                    ;A1DCDF;

EnemyPopulations_EastPants:
; Room $D69A, state $D6A7
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Puyo),
    %XPosition($0080),
    %YPosition($022C),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0030, $0016))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Puyo),
    %XPosition($00C0),
    %YPosition($01DC),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0020, $0016))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Puyo),
    %XPosition($0070),
    %YPosition($019C),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0080, $0016))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Puyo),
    %XPosition($0050),
    %YPosition($02F0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0010, $0008))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Puyo),
    %XPosition($00B0),
    %YPosition($02F0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0008, $0008))
    dw $FFFF : db $05                                                    ;A1DD32;

EnemyPopulations_Springball:
; Room $D6D0, state $D6DD
    dw $FFFF : db $00                                                    ;A1DD35;

EnemyPopulations_BelowBotwoonETank:
; Room $D6FD, state $D70A
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zoa),
    %XPosition($02B8),
    %YPosition($00C8),
    %initParam($0000),
    %properties($6100),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zoa),
    %XPosition($01C8),
    %YPosition($00D0),
    %initParam($0000),
    %properties($6100),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zoa),
    %XPosition($01C8),
    %YPosition($00D8),
    %initParam($0000),
    %properties($6100),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zoa),
    %XPosition($03B8),
    %YPosition($00D8),
    %initParam($0000),
    %properties($6100),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zoa),
    %XPosition($01C8),
    %YPosition($00E0),
    %initParam($0000),
    %properties($6100),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Owtch),
    %XPosition($00C0),
    %YPosition($00A8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0101, $031C))
    dw $FFFF : db $06                                                    ;A1DD98;

EnemyPopulations_Kassiuz:
; Room $D387, state $D394
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Choot),
    %XPosition($0070),
    %YPosition($00BC),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0203, $0010))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Choot),
    %XPosition($0090),
    %YPosition($01DC),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0202, $0010))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Choot),
    %XPosition($0060),
    %YPosition($02CC),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0104, $0010))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Puyo),
    %XPosition($00D8),
    %YPosition($02BC),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0040, $0008))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Puyo),
    %XPosition($0038),
    %YPosition($01CC),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0040, $0008))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Puyo),
    %XPosition($00D4),
    %YPosition($037C),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0040, $0008))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Puyo),
    %XPosition($00A8),
    %YPosition($03AC),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0040, $0008))
    dw $FFFF : db $07                                                    ;A1DE0B;

EnemyPopulations_ForgottenHighwaySave:
; Room $D3DF, state $D3EC
    dw $FFFF : db $00                                                    ;A1DE0E;

EnemyPopulations_MaridiaEnergyRefill:
; Room $D9D4, state $D9E1
    dw $FFFF : db $00                                                    ;A1DE11;

EnemyPopulations_MaridiaMap:
; Room $D3B6, state $D3C3
    dw $FFFF : db $00                                                    ;A1DE14;

EnemyPopulations_CrabHole:
; Room $D21C, state $D229
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sciser),
    %XPosition($0060),
    %YPosition($0037),
    %initParam($0002),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sciser),
    %XPosition($0076),
    %YPosition($00E8),
    %initParam($0000),
    %properties($2801),
    %extraProperties($0000),
    %speedParams($0004, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sciser),
    %XPosition($0076),
    %YPosition($0100),
    %initParam($0000),
    %properties($2801),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sciser),
    %XPosition($0080),
    %YPosition($01B8),
    %initParam($0003),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0002, $0000))
    dw $FFFF : db $04                                                    ;A1DE57;

EnemyPopulations_Botwoon:
; Room $D95E, state $D970
; Room $D95E, state $D98A
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Botwoon),
    %XPosition($0080),
    %YPosition($0080),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $01                                                    ;A1DE6A;

EnemyPopulations_MainStreet:
; Room $CFC9, state $CFD6
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Skultera),
    %XPosition($0100),
    %YPosition($01A0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0010, $0210))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Skultera),
    %XPosition($00F0),
    %YPosition($03D8),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0010, $0210))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Skultera),
    %XPosition($0120),
    %YPosition($04F0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0010, $0210))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Skultera),
    %XPosition($00D0),
    %YPosition($05A0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0010, $0210))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Skultera),
    %XPosition($0100),
    %YPosition($0724),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0010, $0210))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sciser),
    %XPosition($0090),
    %YPosition($0118),
    %initParam($0003),
    %properties($2001),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sciser),
    %XPosition($00F0),
    %YPosition($0298),
    %initParam($0003),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0003, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sciser),
    %XPosition($00F8),
    %YPosition($0487),
    %initParam($0002),
    %properties($2001),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sciser),
    %XPosition($0108),
    %YPosition($0658),
    %initParam($0003),
    %properties($2001),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sciser),
    %XPosition($0168),
    %YPosition($0257),
    %initParam($0002),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sciser),
    %XPosition($0160),
    %YPosition($0047),
    %initParam($0002),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Sciser),
    %XPosition($0097),
    %YPosition($07A0),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0001, $0000))
    dw $FFFF : db $0C                                                    ;A1DF2D;

EnemyPopulations_BugSandHole:
; Room $D433, state $D440
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_YappingMaw),
    %XPosition($00B0),
    %YPosition($00F0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0040, $0001))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zoa),
    %XPosition($0080),
    %YPosition($00DC),
    %initParam($0000),
    %properties($6100),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_YappingMaw),
    %XPosition($004D),
    %YPosition($00F0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0040, $0001))
    dw $FFFF : db $01                                                    ;A1DF60;

EnemyPopulations_EastSandHole:
; Room $D51E, state $D52B
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Boulder),
    %XPosition($0190),
    %YPosition($00A0),
    %initParam($0072),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0200, $7204))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Boulder),
    %XPosition($0150),
    %YPosition($00C0),
    %initParam($0098),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0200, $A204))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Boulder),
    %XPosition($00D0),
    %YPosition($00D0),
    %initParam($00C0),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0200, $A204))
    dw $FFFF : db $00                                                    ;A1DF93;

EnemyPopulations_WestSandHole:
; Room $D4EF, state $D4FC
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Boulder),
    %XPosition($01D0),
    %YPosition($0090),
    %initParam($0050),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0200, $6204))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Boulder),
    %XPosition($00B0),
    %YPosition($0140),
    %initParam($0080),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0200, $A004))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Boulder),
    %XPosition($00F0),
    %YPosition($0160),
    %initParam($00F0),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0200, $F004))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Boulder),
    %XPosition($0030),
    %YPosition($0090),
    %initParam($0040),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0200, $5204))
    dw $FFFF : db $00                                                    ;A1DFD6;

EnemyPopulations_WestCactusAlley:
; Room $D9FE, state $DA0B
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Cacatac),
    %XPosition($0048),
    %YPosition($00B4),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0101, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Cacatac),
    %XPosition($00B0),
    %YPosition($0134),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0101, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Cacatac),
    %XPosition($0068),
    %YPosition($01B4),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0100, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Cacatac),
    %XPosition($00A0),
    %YPosition($004A),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $04                                                    ;A1E019;

EnemyPopulations_EastCactusAlley:
; Room $DA2B, state $DA38
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Cacatac),
    %XPosition($0180),
    %YPosition($0094),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0101, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Cacatac),
    %XPosition($0290),
    %YPosition($00A4),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0100, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Cacatac),
    %XPosition($0390),
    %YPosition($0104),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0101, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Cacatac),
    %XPosition($02D0),
    %YPosition($01B4),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0100, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Cacatac),
    %XPosition($00F0),
    %YPosition($015A),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Cacatac),
    %XPosition($02D0),
    %YPosition($016A),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0201))
    dw $FFFF : db $06                                                    ;A1E07C;

EnemyPopulations_FishTank:
; Room $D017, state $D024
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Skultera),
    %XPosition($0070),
    %YPosition($0098),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0110, $0210))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Skultera),
    %XPosition($00B8),
    %YPosition($02A8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0010, $0210))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Skultera),
    %XPosition($0190),
    %YPosition($00F0),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0010, $0210))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateMagentaWalking),
    %XPosition($01A8),
    %YPosition($02A0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($8000, $0018))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateMagentaWalking),
    %XPosition($0190),
    %YPosition($0140),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($8001, $0008))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateMagentaWalking),
    %XPosition($02A0),
    %YPosition($00D0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($8000, $0008))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateMagentaWalking),
    %XPosition($0378),
    %YPosition($01B0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($8001, $0028))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Skultera),
    %XPosition($0368),
    %YPosition($00B8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0010, $0210))
    dw $FFFF : db $08                                                    ;A1E10F;

EnemyPopulations_TourianEscape4:
; Room $DEDE, state $DEEB
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateSilverWall),
    %XPosition($002B),
    %YPosition($04D0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($0000, $0084))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateSilverWall),
    %XPosition($00B2),
    %YPosition($0428),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($0001, $0084))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateSilverWall),
    %XPosition($002B),
    %YPosition($0308),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($0000, $0084))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateSilverWall),
    %XPosition($00B2),
    %YPosition($0278),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($0001, $0084))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateSilverWall),
    %XPosition($002B),
    %YPosition($01E8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($0000, $0084))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateSilverWall),
    %XPosition($00B2),
    %YPosition($0158),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($0001, $0084))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateSilverWalking),
    %XPosition($0270),
    %YPosition($0180),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($0000, $0020))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateSilverWalking),
    %XPosition($01D0),
    %YPosition($0180),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($0000, $0020))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateSilverWalking),
    %XPosition($01C8),
    %YPosition($02D0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($0000, $0010))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateSilverWalking),
    %XPosition($0140),
    %YPosition($0200),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($0000, $0020))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateSilverWalking),
    %XPosition($01B8),
    %YPosition($03B0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($0000, $0010))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateSilverWalking),
    %XPosition($0168),
    %YPosition($0500),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($0000, $0010))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateSilverWalking),
    %XPosition($0278),
    %YPosition($0450),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($0000, $0010))
    dw $FFFF : db $0D                                                    ;A1E1D2;

EnemyPopulations_MotherBrainSave:
; Room $DE23, state $DE30
    dw $FFFF : db $00                                                    ;A1E1D5;

EnemyPopulations_Metroids1_0:
; Room $DAE1, state $DAF3
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Metroid),
    %XPosition($010C),
    %YPosition($006A),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0005))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Metroid),
    %XPosition($027D),
    %YPosition($0074),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0005))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Metroid),
    %XPosition($036D),
    %YPosition($0092),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0005))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Metroid),
    %XPosition($04AD),
    %YPosition($008C),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0005))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rinka),
    %XPosition($0028),
    %YPosition($0048),
    %initParam($0000),
    %properties($6000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rinka),
    %XPosition($0218),
    %YPosition($00D8),
    %initParam($0000),
    %properties($6000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rinka),
    %XPosition($0498),
    %YPosition($0048),
    %initParam($0000),
    %properties($6000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rinka),
    %XPosition($0468),
    %YPosition($00D8),
    %initParam($0000),
    %properties($6000),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $04                                                    ;A1E258;

EnemyPopulations_DustTorizo:
; Room $DC65, state $DC77
; Room $DC65, state $DC91
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_CorpseTorizo),
    %XPosition($0120),
    %YPosition($0094),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $00                                                    ;A1E26B;

EnemyPopulations_BigBoy:
; Room $DCB1, state $DCC3
; Room $DCB1, state $DCDD
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_BabyMetroid),
    %XPosition($0180),
    %YPosition($0040),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_CorpseSidehopper),
    %XPosition($0228),
    %YPosition($00A0),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_CorpseSidehopper),
    %XPosition($00A0),
    %YPosition($0040),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_CorpseZoomer),
    %XPosition($00F0),
    %YPosition($0040),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_CorpseZoomer),
    %XPosition($0298),
    %YPosition($00C8),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_CorpseZoomer),
    %XPosition($0108),
    %YPosition($0036),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0004, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_CorpseRipper),
    %XPosition($0320),
    %YPosition($00A8),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_CorpseRipper),
    %XPosition($00C2),
    %YPosition($00C8),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_CorpseSkree),
    %XPosition($0380),
    %YPosition($0047),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_CorpseSkree),
    %XPosition($0260),
    %YPosition($0047),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_CorpseSkree),
    %XPosition($0180),
    %YPosition($0047),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0004, $0000))
    dw $FFFF : db $00                                                    ;A1E31E;

EnemyPopulations_MotherBrain_0_1:
; Room $DD58, state $DD6E
; Room $DD58, state $DD88
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_MotherBrainBody),
    %XPosition($0081),
    %YPosition($006F),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0004),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_MotherBrainHead),
    %XPosition($0081),
    %YPosition($006F),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0004),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Zebetite),
    %XPosition($0000),
    %YPosition($0000),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rinka),
    %XPosition($0337),
    %YPosition($0036),
    %initParam($0000),
    %properties($6000),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rinka),
    %XPosition($0337),
    %YPosition($00A6),
    %initParam($0000),
    %properties($6000),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rinka),
    %XPosition($0277),
    %YPosition($001C),
    %initParam($0000),
    %properties($6000),
    %extraProperties($0000),
    %speedParams($0003, $0000))
    dw $FFFF : db $00                                                    ;A1E381;

EnemyPopulations_TourianEyeDoor:
; Room $DDC4, state $DDD1
    dw $FFFF : db $00                                                    ;A1E384;

EnemyPopulations_BlueHopper:
; Room $DC19, state $DC2B
; Room $DC19, state $DC45
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_SidehopperTourian),
    %XPosition($00F8),
    %YPosition($0061),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($8000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_SidehopperTourian),
    %XPosition($0086),
    %YPosition($00A9),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $02                                                    ;A1E3A7;

EnemyPopulations_TourianEscape1:
; Room $DE4D, state $DE5A
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_ShutterDestroyable),
    %XPosition($01B8),
    %YPosition($0040),
    %initParam($0108),
    %properties($A800),
    %extraProperties($FF00),
    %speedParams($2000, $0010))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_ShutterDestroyable),
    %XPosition($01B8),
    %YPosition($00C0),
    %initParam($0008),
    %properties($A800),
    %extraProperties($00FF),
    %speedParams($2000, $0010))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_ShutterDestroyable),
    %XPosition($0168),
    %YPosition($0040),
    %initParam($0108),
    %properties($A800),
    %extraProperties($FF00),
    %speedParams($2000, $0010))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_ShutterDestroyable),
    %XPosition($0168),
    %YPosition($00C0),
    %initParam($0008),
    %properties($A800),
    %extraProperties($00FF),
    %speedParams($2000, $0010))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_ShutterDestroyable),
    %XPosition($0118),
    %YPosition($0040),
    %initParam($0108),
    %properties($A800),
    %extraProperties($FF00),
    %speedParams($2000, $0018))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_ShutterDestroyable),
    %XPosition($0118),
    %YPosition($00C0),
    %initParam($0008),
    %properties($A800),
    %extraProperties($00FF),
    %speedParams($2000, $0018))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_ShutterDestroyable),
    %XPosition($00C8),
    %YPosition($0040),
    %initParam($0108),
    %properties($A800),
    %extraProperties($FF00),
    %speedParams($2000, $0020))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_ShutterDestroyable),
    %XPosition($00C8),
    %YPosition($00C0),
    %initParam($0008),
    %properties($A800),
    %extraProperties($00FF),
    %speedParams($2000, $0020))
    dw $FFFF : db $00                                                    ;A1E42A;

EnemyPopulations_TourianFirst:
; Room $DAAE, state $DABB
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Elevator),
    %XPosition($0080),
    %YPosition($02C2),
    %initParam($0000),
    %properties($2C00),
    %extraProperties($0000),
    %speedParams($0001, $0018))
    dw $FFFF : db $00                                                    ;A1E43D;

EnemyPopulations_Metroids2_0:
; Room $DB31, state $DB43
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Metroid),
    %XPosition($0098),
    %YPosition($0115),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0005))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rinka),
    %XPosition($0098),
    %YPosition($0048),
    %initParam($0000),
    %properties($6000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rinka),
    %XPosition($00D8),
    %YPosition($00B8),
    %initParam($0000),
    %properties($6000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rinka),
    %XPosition($00D8),
    %YPosition($01B8),
    %initParam($0000),
    %properties($6000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rinka),
    %XPosition($0008),
    %YPosition($0148),
    %initParam($0000),
    %properties($6000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Metroid),
    %XPosition($0056),
    %YPosition($018A),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0005))
    dw $FFFF : db $02                                                    ;A1E4A0;

EnemyPopulations_Metroids4_0:
; Room $DBCD, state $DBDF
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Metroid),
    %XPosition($00C4),
    %YPosition($0152),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0005))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Metroid),
    %XPosition($003E),
    %YPosition($00FB),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0005))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rinka),
    %XPosition($0098),
    %YPosition($00B8),
    %initParam($0000),
    %properties($6000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rinka),
    %XPosition($0098),
    %YPosition($0188),
    %initParam($0000),
    %properties($6000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rinka),
    %XPosition($0068),
    %YPosition($0128),
    %initParam($0000),
    %properties($6000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rinka),
    %XPosition($00F8),
    %YPosition($00B8),
    %initParam($0000),
    %properties($6000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Metroid),
    %XPosition($0046),
    %YPosition($01BE),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0005))
    dw $FFFF : db $03                                                    ;A1E513;

EnemyPopulations_Metroids1_1:
; Room $DAE1, state $DB0D
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rinka),
    %XPosition($0028),
    %YPosition($0048),
    %initParam($0000),
    %properties($6000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rinka),
    %XPosition($0218),
    %YPosition($00D8),
    %initParam($0000),
    %properties($6000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rinka),
    %XPosition($0498),
    %YPosition($0048),
    %initParam($0000),
    %properties($6000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rinka),
    %XPosition($0468),
    %YPosition($00D8),
    %initParam($0000),
    %properties($6000),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $00                                                    ;A1E556;

EnemyPopulations_Metroids2_1:
; Room $DB31, state $DB5D
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rinka),
    %XPosition($0098),
    %YPosition($0048),
    %initParam($0000),
    %properties($6000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rinka),
    %XPosition($00D8),
    %YPosition($00B8),
    %initParam($0000),
    %properties($6000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rinka),
    %XPosition($00D8),
    %YPosition($01B8),
    %initParam($0000),
    %properties($6000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rinka),
    %XPosition($0008),
    %YPosition($0148),
    %initParam($0000),
    %properties($6000),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $00                                                    ;A1E599;

EnemyPopulations_TourianEscape2:
; Room $DE7A, state $DE87
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateSilverWall),
    %XPosition($002B),
    %YPosition($00D8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($0000, $00A0))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateSilverWall),
    %XPosition($00D0),
    %YPosition($0128),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($0001, $00A0))
    dw $FFFF : db $02                                                    ;A1E5BC;

EnemyPopulations_Metroids3_1:
; Room $DB7D, state $DBA9
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rinka),
    %XPosition($0108),
    %YPosition($0048),
    %initParam($0000),
    %properties($6000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rinka),
    %XPosition($0018),
    %YPosition($0048),
    %initParam($0000),
    %properties($6000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rinka),
    %XPosition($0028),
    %YPosition($00B8),
    %initParam($0000),
    %properties($6000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rinka),
    %XPosition($00E8),
    %YPosition($00B8),
    %initParam($0000),
    %properties($6000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rinka),
    %XPosition($01B8),
    %YPosition($0048),
    %initParam($0000),
    %properties($6000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rinka),
    %XPosition($0268),
    %YPosition($0048),
    %initParam($0000),
    %properties($6000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rinka),
    %XPosition($0268),
    %YPosition($00B8),
    %initParam($0000),
    %properties($6000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rinka),
    %XPosition($05D8),
    %YPosition($0048),
    %initParam($0000),
    %properties($6000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rinka),
    %XPosition($05B8),
    %YPosition($00B8),
    %initParam($0000),
    %properties($6000),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $00                                                    ;A1E64F;

EnemyPopulations_Metroids4_1:
; Room $DBCD, state $DBF9
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rinka),
    %XPosition($0098),
    %YPosition($00B8),
    %initParam($0000),
    %properties($6000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rinka),
    %XPosition($0098),
    %YPosition($0188),
    %initParam($0000),
    %properties($6000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rinka),
    %XPosition($0068),
    %YPosition($0128),
    %initParam($0000),
    %properties($6000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rinka),
    %XPosition($00F8),
    %YPosition($00B8),
    %initParam($0000),
    %properties($6000),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $00                                                    ;A1E692;

EnemyPopulations_TourianEscape3:
; Room $DEA7, state $DEB4
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateSilverWalking),
    %XPosition($00C0),
    %YPosition($0160),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($0000, $0010))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateSilverWalking),
    %XPosition($0538),
    %YPosition($0160),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($0000, $0010))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateSilverWalking),
    %XPosition($0488),
    %YPosition($0160),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($0000, $0010))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateSilverWalking),
    %XPosition($03D8),
    %YPosition($0160),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($0000, $0010))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateSilverWalking),
    %XPosition($0478),
    %YPosition($0050),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($0000, $0010))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateSilverWalking),
    %XPosition($04E0),
    %YPosition($0050),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($0000, $0010))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_PirateSilverWalking),
    %XPosition($0560),
    %YPosition($0050),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0004),
    %speedParams($0000, $0010))
    dw $FFFF : db $07                                                    ;A1E705;

EnemyPopulations_Seaweed:
; Room $DCFF, state $DD0C
    dw $FFFF : db $00                                                    ;A1E708;

EnemyPopulations_TourianRecharge:
; Room $DD2E, state $DD3B
    dw $FFFF : db $00                                                    ;A1E70B;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyPopulations_A1E70E:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_CorpseZoomer),
    %XPosition($00F0),
    %YPosition($0040),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_CorpseZoomer),
    %XPosition($0298),
    %YPosition($00C8),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_CorpseZoomer),
    %XPosition($0108),
    %YPosition($0036),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0004, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_CorpseRipper),
    %XPosition($0320),
    %YPosition($00A8),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_CorpseRipper),
    %XPosition($00C2),
    %YPosition($00C8),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_CorpseSkree),
    %XPosition($0380),
    %YPosition($0047),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_CorpseSkree),
    %XPosition($0260),
    %YPosition($0047),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_CorpseSkree),
    %XPosition($0180),
    %YPosition($0047),
    %initParam($0000),
    %properties($A000),
    %extraProperties($0000),
    %speedParams($0004, $0000))
    dw $FFFF : db $00                                                    ;A1E78E;
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyPopulations_UpperTourianSave:
; Room $DF1B, state $DF28
    dw $FFFF : db $00                                                    ;A1E791;

EnemyPopulations_Metroids3_0:
; Room $DB7D, state $DB8F
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Metroid),
    %XPosition($018A),
    %YPosition($0081),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0005))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Metroid),
    %XPosition($0367),
    %YPosition($0077),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0005))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Metroid),
    %XPosition($046A),
    %YPosition($0073),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0005))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rinka),
    %XPosition($0108),
    %YPosition($0048),
    %initParam($0000),
    %properties($6000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rinka),
    %XPosition($0018),
    %YPosition($0048),
    %initParam($0000),
    %properties($6000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rinka),
    %XPosition($0028),
    %YPosition($00B8),
    %initParam($0000),
    %properties($6000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rinka),
    %XPosition($00E8),
    %YPosition($00B8),
    %initParam($0000),
    %properties($6000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rinka),
    %XPosition($01B8),
    %YPosition($0048),
    %initParam($0000),
    %properties($6000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rinka),
    %XPosition($0268),
    %YPosition($0048),
    %initParam($0000),
    %properties($6000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rinka),
    %XPosition($0268),
    %YPosition($00B8),
    %initParam($0000),
    %properties($6000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rinka),
    %XPosition($05D8),
    %YPosition($0048),
    %initParam($0000),
    %properties($6000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rinka),
    %XPosition($05B8),
    %YPosition($00B8),
    %initParam($0000),
    %properties($6000),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $03                                                    ;A1E854;

EnemyPopulations_RinkaShaft:
; Room $DDF3, state $DE00
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rinka),
    %XPosition($00E8),
    %YPosition($01B8),
    %initParam($0000),
    %properties($6000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rinka),
    %XPosition($00E8),
    %YPosition($0208),
    %initParam($0000),
    %properties($6000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Rinka),
    %XPosition($0008),
    %YPosition($0248),
    %initParam($0000),
    %properties($6000),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $00                                                    ;A1E887;

EnemyPopulations_CeresElev_0:
; Room $DF45, state $DF57
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_CeresDoor),
    %XPosition($00E8),
    %YPosition($0277),
    %initParam($0002),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_CeresDoor),
    %XPosition($00E0),
    %YPosition($027F),
    %initParam($0001),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0001, $0000))
    dw $FFFF : db $00                                                    ;A1E8AA;

EnemyPopulations_FallingTile_0:
; Room $DF8D, state $DF9F
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_CeresDoor),
    %XPosition($0020),
    %YPosition($007F),
    %initParam($0000),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_CeresDoor),
    %XPosition($01E0),
    %YPosition($007F),
    %initParam($0001),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0001, $0000))
    dw $FFFF : db $00                                                    ;A1E8CD;

EnemyPopulations_MagnetStairs_0:
; Room $DFD7, state $DFE9
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_CeresDoor),
    %XPosition($0020),
    %YPosition($007F),
    %initParam($0000),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_CeresDoor),
    %XPosition($00E0),
    %YPosition($017F),
    %initParam($0001),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0001, $0000))
    dw $FFFF : db $00                                                    ;A1E8F0;

EnemyPopulations_DeadScientist_0:
; Room $E021, state $E033
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_CeresDoor),
    %XPosition($0020),
    %YPosition($007F),
    %initParam($0000),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_CeresDoor),
    %XPosition($01E0),
    %YPosition($007F),
    %initParam($0001),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0001, $0000))
    dw $FFFF : db $00                                                    ;A1E913;

EnemyPopulations_58Escape_0:
; Room $E06B, state $E07D
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_CeresDoor),
    %XPosition($0020),
    %YPosition($007F),
    %initParam($0000),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_CeresDoor),
    %XPosition($01E0),
    %YPosition($007F),
    %initParam($0001),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0001, $0000))
    dw $FFFF : db $00                                                    ;A1E936;

EnemyPopulations_CeresRidley_0:
; Room $E0B5, state $E0C7
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_RidleyCeres),
    %XPosition($00BA),
    %YPosition($00AB),
    %initParam($0000),
    %properties($2800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_CeresDoor),
    %XPosition($0010),
    %YPosition($007F),
    %initParam($0003),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0003, $0000))
    dw $FFFF : db $00                                                    ;A1E959;

EnemyPopulations_CeresElev_1:
; Room $DF45, state $DF71
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_CeresDoor),
    %XPosition($00E8),
    %YPosition($0277),
    %initParam($0002),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_CeresDoor),
    %XPosition($00E0),
    %YPosition($027F),
    %initParam($0004),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0004, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($005E),
    %YPosition($006C),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0004, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($00A2),
    %YPosition($006C),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0005, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($009E),
    %YPosition($00C8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0004, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($0062),
    %YPosition($00C8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0005, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($005E),
    %YPosition($0128),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0004, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($00A2),
    %YPosition($0128),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0005, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($009E),
    %YPosition($0188),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0004, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($0062),
    %YPosition($0198),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0005, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($005E),
    %YPosition($01F8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0004, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($00A2),
    %YPosition($01F8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0005, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($0072),
    %YPosition($0258),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0005, $0000))
    dw $FFFF : db $00                                                    ;A1EA2C;

EnemyPopulations_FallingTile_1:
; Room $DF8D, state $DFB9
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($00A0),
    %YPosition($00CC),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($00E0),
    %YPosition($00BC),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($0120),
    %YPosition($00BC),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($0160),
    %YPosition($00CC),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($01B8),
    %YPosition($00A8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($0080),
    %YPosition($0042),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($00C0),
    %YPosition($0042),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($0100),
    %YPosition($0042),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($0140),
    %YPosition($0042),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($0180),
    %YPosition($0042),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0002, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($0048),
    %YPosition($00A8),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0003, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_CeresDoor),
    %XPosition($0020),
    %YPosition($007F),
    %initParam($0000),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_CeresDoor),
    %XPosition($01E0),
    %YPosition($007F),
    %initParam($0001),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0001, $0000))
    dw $FFFF : db $00                                                    ;A1EAFF;

EnemyPopulations_MagnetStairs_1:
; Room $DFD7, state $E003
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_CeresDoor),
    %XPosition($0020),
    %YPosition($007F),
    %initParam($0000),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_CeresDoor),
    %XPosition($00E0),
    %YPosition($017F),
    %initParam($0001),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($0070),
    %YPosition($009C),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($00C2),
    %YPosition($00B0),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0003, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($0078),
    %YPosition($0116),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($003E),
    %YPosition($0130),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0001, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_Steam),
    %XPosition($0088),
    %YPosition($0194),
    %initParam($0000),
    %properties($2000),
    %extraProperties($0000),
    %speedParams($0000, $0000))
    dw $FFFF : db $00                                                    ;A1EB72;

EnemyPopulations_DeadScientist_1:
; Room $E021, state $E04D
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_CeresDoor),
    %XPosition($0020),
    %YPosition($007F),
    %initParam($0000),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_CeresDoor),
    %XPosition($01E0),
    %YPosition($007F),
    %initParam($0001),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0001, $0000))
    dw $FFFF : db $00                                                    ;A1EB95;

EnemyPopulations_58Escape_1:
; Room $E06B, state $E097
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_CeresDoor),
    %XPosition($0020),
    %YPosition($007F),
    %initParam($0000),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0000, $0000))

    %EnemyPopulations(\
    %enemyID(EnemyHeaders_CeresDoor),
    %XPosition($01E0),
    %YPosition($007F),
    %initParam($0001),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0001, $0000))
    dw $FFFF : db $00                                                    ;A1EBB8;

EnemyPopulations_CeresRidley_1:
; Room $E0B5, state $E0E1
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_CeresDoor),
    %XPosition($0010),
    %YPosition($007F),
    %initParam($0003),
    %properties($A800),
    %extraProperties($0000),
    %speedParams($0003, $0000))
    dw $FFFF : db $00                                                    ;A1EBCB;

EnemyPopulations_Debug:
; Room $E82C, state $E839
    dw $FFFF : db $00                                                    ;A1EBCE;


Freespace_BankA1_EBD1:                                                   ;A1EBD1;
; $142F bytes
