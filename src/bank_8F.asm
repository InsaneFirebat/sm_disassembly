
org $8F8000


PLMPopulation_LandingSite_State0_1_2:
    dw PLMEntries_ScrollPLM                                              ;8F8000;
    db $1E,$28                                                           ;8F8002;
    dw RoomPLM_LandingSite_0                                             ;8F8004;
    dw PLMEntries_upwardsExtension                                       ;8F8006;
    db $1E,$27                                                           ;8F8008;
    dw $8000                                                             ;8F800A;
    dw PLMEntries_upwardsExtension                                       ;8F800C;
    db $1E,$26                                                           ;8F800E;
    dw $8000                                                             ;8F8010;
    dw PLMEntries_upwardsExtension                                       ;8F8012;
    db $1E,$25                                                           ;8F8014;
    dw $8000                                                             ;8F8016;
    dw PLMEntries_greenDoorFacingLeft                                    ;8F8018;
    db $8E,$46                                                           ;8F801A;
    dw $0000                                                             ;8F801C;
    dw PLMEntries_yellowDoorFacingLeft                                   ;8F801E;
    db $8E,$16                                                           ;8F8020;
    dw $0001,$0000                                                       ;8F8022;

PLMPopulation_LandingSite_State3:
    dw PLMEntries_ScrollPLM                                              ;8F8026;
    db $1E,$28                                                           ;8F8028;
    dw RoomPLM_LandingSite_0                                             ;8F802A;
    dw PLMEntries_upwardsExtension                                       ;8F802C;
    db $1E,$27                                                           ;8F802E;
    dw $8000                                                             ;8F8030;
    dw PLMEntries_upwardsExtension                                       ;8F8032;
    db $1E,$26                                                           ;8F8034;
    dw $8000                                                             ;8F8036;
    dw PLMEntries_upwardsExtension                                       ;8F8038;
    db $1E,$25                                                           ;8F803A;
    dw $8000                                                             ;8F803C;
    dw PLMEntries_SetsMetroidsClearedStatesWhenRequired                  ;8F803E;
    db $08,$08                                                           ;8F8040;
    dw $0008                                                             ;8F8042;
    dw PLMEntries_greyDoorFacingRight                                    ;8F8044;
    db $01,$26                                                           ;8F8046;
    dw $9002                                                             ;8F8048;
    dw PLMEntries_greyDoorFacingLeft                                     ;8F804A;
    db $8E,$46                                                           ;8F804C;
    dw $9003                                                             ;8F804E;
    dw PLMEntries_greyDoorFacingLeft                                     ;8F8050;
    db $8E,$16                                                           ;8F8052;
    dw $9004,$0000                                                       ;8F8054;

PLMPopulation_GauntletEntrance_State0_1:
    dw $0000                                                             ;8F8058;

PLMPopulation_Parlor_State0_1:
    dw PLMEntries_ScrollPLM                                              ;8F805A;
    db $3F,$0B                                                           ;8F805C;
    dw RoomPLM_Parlor_0                                                  ;8F805E;
    dw PLMEntries_ScrollPLM                                              ;8F8060;
    db $43,$0B                                                           ;8F8062;
    dw RoomPLM_Parlor_1                                                  ;8F8064;
    dw PLMEntries_ScrollPLM                                              ;8F8066;
    db $16,$0D                                                           ;8F8068;
    dw RoomPLM_Parlor_2                                                  ;8F806A;
    dw PLMEntries_rightwardsExtension                                    ;8F806C;
    db $17,$0D                                                           ;8F806E;
    dw $8000                                                             ;8F8070;
    dw PLMEntries_rightwardsExtension                                    ;8F8072;
    db $18,$0D                                                           ;8F8074;
    dw $8000                                                             ;8F8076;
    dw PLMEntries_rightwardsExtension                                    ;8F8078;
    db $19,$0D                                                           ;8F807A;
    dw $8000                                                             ;8F807C;
    dw PLMEntries_ScrollPLM                                              ;8F807E;
    db $16,$0B                                                           ;8F8080;
    dw RoomPLM_Parlor_6                                                  ;8F8082;
    dw PLMEntries_rightwardsExtension                                    ;8F8084;
    db $17,$0B                                                           ;8F8086;
    dw $8000                                                             ;8F8088;
    dw PLMEntries_rightwardsExtension                                    ;8F808A;
    db $18,$0B                                                           ;8F808C;
    dw $8000                                                             ;8F808E;
    dw PLMEntries_rightwardsExtension                                    ;8F8090;
    db $19,$0B                                                           ;8F8092;
    dw $8000                                                             ;8F8094;
    dw PLMEntries_ScrollPLM                                              ;8F8096;
    db $0E,$09                                                           ;8F8098;
    dw RoomPLM_Parlor_A                                                  ;8F809A;
    dw PLMEntries_upwardsExtension                                       ;8F809C;
    db $0E,$08                                                           ;8F809E;
    dw $8000                                                             ;8F80A0;
    dw PLMEntries_upwardsExtension                                       ;8F80A2;
    db $0E,$07                                                           ;8F80A4;
    dw $8000                                                             ;8F80A6;
    dw PLMEntries_ScrollPLM                                              ;8F80A8;
    db $1C,$0A                                                           ;8F80AA;
    dw RoomPLM_Parlor_D                                                  ;8F80AC;
    dw PLMEntries_upwardsExtension                                       ;8F80AE;
    db $1C,$09                                                           ;8F80B0;
    dw $8000                                                             ;8F80B2;
    dw PLMEntries_upwardsExtension                                       ;8F80B4;
    db $1C,$08                                                           ;8F80B6;
    dw $8000                                                             ;8F80B8;
    dw PLMEntries_upwardsExtension                                       ;8F80BA;
    db $1C,$07                                                           ;8F80BC;
    dw $8000                                                             ;8F80BE;
    dw PLMEntries_upwardsExtension                                       ;8F80C0;
    db $1C,$06                                                           ;8F80C2;
    dw $8000                                                             ;8F80C4;
    dw PLMEntries_upwardsExtension                                       ;8F80C6;
    db $1C,$05                                                           ;8F80C8;
    dw $8000                                                             ;8F80CA;
    dw PLMEntries_ScrollPLM                                              ;8F80CC;
    db $32,$0B                                                           ;8F80CE;
    dw RoomPLM_Parlor_13_14                                              ;8F80D0;
    dw PLMEntries_ScrollPLM                                              ;8F80D2;
    db $3C,$0B                                                           ;8F80D4;
    dw RoomPLM_Parlor_13_14                                              ;8F80D6;
    dw PLMEntries_ScrollPLM                                              ;8F80D8;
    db $3A,$11                                                           ;8F80DA;
    dw RoomPLM_Parlor_15                                                 ;8F80DC;
    dw PLMEntries_rightwardsExtension                                    ;8F80DE;
    db $3B,$11                                                           ;8F80E0;
    dw $8000                                                             ;8F80E2;
    dw PLMEntries_rightwardsExtension                                    ;8F80E4;
    db $3C,$11                                                           ;8F80E6;
    dw $8000                                                             ;8F80E8;
    dw PLMEntries_rightwardsExtension                                    ;8F80EA;
    db $3D,$11                                                           ;8F80EC;
    dw $8000                                                             ;8F80EE;
    dw PLMEntries_rightwardsExtension                                    ;8F80F0;
    db $3E,$11                                                           ;8F80F2;
    dw $8000                                                             ;8F80F4;
    dw PLMEntries_ScrollPLM                                              ;8F80F6;
    db $34,$0E                                                           ;8F80F8;
    dw RoomPLM_Parlor_1A                                                 ;8F80FA;
    dw PLMEntries_redDoorFacingLeft                                      ;8F80FC;
    db $1E,$36                                                           ;8F80FE;
    dw $0005,$0000                                                       ;8F8100;

PLMPopulation_Parlor_State2:
    dw PLMEntries_ScrollPLM                                              ;8F8104;
    db $3F,$0B                                                           ;8F8106;
    dw RoomPLM_Parlor_0                                                  ;8F8108;
    dw PLMEntries_ScrollPLM                                              ;8F810A;
    db $43,$0B                                                           ;8F810C;
    dw RoomPLM_Parlor_1                                                  ;8F810E;
    dw PLMEntries_ScrollPLM                                              ;8F8110;
    db $16,$0D                                                           ;8F8112;
    dw RoomPLM_Parlor_2                                                  ;8F8114;
    dw PLMEntries_rightwardsExtension                                    ;8F8116;
    db $17,$0D                                                           ;8F8118;
    dw $8000                                                             ;8F811A;
    dw PLMEntries_rightwardsExtension                                    ;8F811C;
    db $18,$0D                                                           ;8F811E;
    dw $8000                                                             ;8F8120;
    dw PLMEntries_rightwardsExtension                                    ;8F8122;
    db $19,$0D                                                           ;8F8124;
    dw $8000                                                             ;8F8126;
    dw PLMEntries_ScrollPLM                                              ;8F8128;
    db $16,$0B                                                           ;8F812A;
    dw RoomPLM_Parlor_6                                                  ;8F812C;
    dw PLMEntries_rightwardsExtension                                    ;8F812E;
    db $17,$0B                                                           ;8F8130;
    dw $8000                                                             ;8F8132;
    dw PLMEntries_rightwardsExtension                                    ;8F8134;
    db $18,$0B                                                           ;8F8136;
    dw $8000                                                             ;8F8138;
    dw PLMEntries_rightwardsExtension                                    ;8F813A;
    db $19,$0B                                                           ;8F813C;
    dw $8000                                                             ;8F813E;
    dw PLMEntries_ScrollPLM                                              ;8F8140;
    db $0E,$09                                                           ;8F8142;
    dw RoomPLM_Parlor_A                                                  ;8F8144;
    dw PLMEntries_upwardsExtension                                       ;8F8146;
    db $0E,$08                                                           ;8F8148;
    dw $8000                                                             ;8F814A;
    dw PLMEntries_upwardsExtension                                       ;8F814C;
    db $0E,$07                                                           ;8F814E;
    dw $8000                                                             ;8F8150;
    dw PLMEntries_ScrollPLM                                              ;8F8152;
    db $1C,$0A                                                           ;8F8154;
    dw RoomPLM_Parlor_D                                                  ;8F8156;
    dw PLMEntries_upwardsExtension                                       ;8F8158;
    db $1C,$09                                                           ;8F815A;
    dw $8000                                                             ;8F815C;
    dw PLMEntries_upwardsExtension                                       ;8F815E;
    db $1C,$08                                                           ;8F8160;
    dw $8000                                                             ;8F8162;
    dw PLMEntries_upwardsExtension                                       ;8F8164;
    db $1C,$07                                                           ;8F8166;
    dw $8000                                                             ;8F8168;
    dw PLMEntries_upwardsExtension                                       ;8F816A;
    db $1C,$06                                                           ;8F816C;
    dw $8000                                                             ;8F816E;
    dw PLMEntries_upwardsExtension                                       ;8F8170;
    db $1C,$05                                                           ;8F8172;
    dw $8000                                                             ;8F8174;
    dw PLMEntries_ScrollPLM                                              ;8F8176;
    db $32,$0B                                                           ;8F8178;
    dw RoomPLM_Parlor_13_14                                              ;8F817A;
    dw PLMEntries_ScrollPLM                                              ;8F817C;
    db $3C,$0B                                                           ;8F817E;
    dw RoomPLM_Parlor_13_14                                              ;8F8180;
    dw PLMEntries_ScrollPLM                                              ;8F8182;
    db $3A,$11                                                           ;8F8184;
    dw RoomPLM_Parlor_15                                                 ;8F8186;
    dw PLMEntries_rightwardsExtension                                    ;8F8188;
    db $3B,$11                                                           ;8F818A;
    dw $8000                                                             ;8F818C;
    dw PLMEntries_rightwardsExtension                                    ;8F818E;
    db $3C,$11                                                           ;8F8190;
    dw $8000                                                             ;8F8192;
    dw PLMEntries_rightwardsExtension                                    ;8F8194;
    db $3D,$11                                                           ;8F8196;
    dw $8000                                                             ;8F8198;
    dw PLMEntries_rightwardsExtension                                    ;8F819A;
    db $3E,$11                                                           ;8F819C;
    dw $8000                                                             ;8F819E;
    dw PLMEntries_ScrollPLM                                              ;8F81A0;
    db $34,$0E                                                           ;8F81A2;
    dw RoomPLM_Parlor_1A                                                 ;8F81A4;
    dw PLMEntries_SetsMetroidsClearedStatesWhenRequired                  ;8F81A6;
    db $08,$08                                                           ;8F81A8;
    dw $000A                                                             ;8F81AA;
    dw PLMEntries_greyDoorFacingRight                                    ;8F81AC;
    db $01,$06                                                           ;8F81AE;
    dw $9006                                                             ;8F81B0;
    dw PLMEntries_greyDoorFacingRight                                    ;8F81B2;
    db $11,$26                                                           ;8F81B4;
    dw $9007                                                             ;8F81B6;
    dw PLMEntries_greyDoorFacingRight                                    ;8F81B8;
    db $11,$36                                                           ;8F81BA;
    dw $9008                                                             ;8F81BC;
    dw PLMEntries_greyDoorFacingLeft                                     ;8F81BE;
    db $1E,$36                                                           ;8F81C0;
    dw $9009                                                             ;8F81C2;
    dw PLMEntries_greyDoorFacingUp                                       ;8F81C4;
    db $16,$4D                                                           ;8F81C6;
    dw $900A,$0000                                                       ;8F81C8;

PLMPopulation_CrateriaPowerBombs:
    dw PLMEntries_PowerBombTank                                          ;8F81CC;
    db $1D,$07                                                           ;8F81CE;
    dw $0000,$0000                                                       ;8F81D0;

PLMPopulation_CrateriaSave:
    dw PLMEntries_saveStation                                            ;8F81D4;
    dw $0B05,$0001,$0000                                                 ;8F81D6;

PLMPopulation_WestOcean:
    dw PLMEntries_greyDoorFacingLeft                                     ;8F81DC;
    db $5E,$36                                                           ;8F81DE;
    dw $900B                                                             ;8F81E0;
    dw PLMEntries_greenDoorFacingLeft                                    ;8F81E2;
    db $7E,$46                                                           ;8F81E4;
    dw $000C                                                             ;8F81E6;
    dw PLMEntries_MissileTank                                            ;8F81E8;
    db $02,$5B                                                           ;8F81EA;
    dw $0001                                                             ;8F81EC;
    dw PLMEntries_MissileTankShotBlock                                   ;8F81EE;
    db $1C,$03                                                           ;8F81F0;
    dw $0002                                                             ;8F81F2;
    dw PLMEntries_MissileTank                                            ;8F81F4;
    db $01,$2F                                                           ;8F81F6;
    dw $0003,$0000                                                       ;8F81F8;

PLMPopulation_BowlingAlleyPath:
    dw $0000                                                             ;8F81FC;

PLMPopulation_CrateriaKihunter:
    dw PLMEntries_ScrollPLM                                              ;8F81FE;
    db $17,$0F                                                           ;8F8200;
    dw RoomPLM_CrateriaKihunter_0                                        ;8F8202;
    dw PLMEntries_rightwardsExtension                                    ;8F8204;
    db $18,$0F                                                           ;8F8206;
    dw $8000                                                             ;8F8208;
    dw PLMEntries_ScrollPLM                                              ;8F820A;
    db $16,$0C                                                           ;8F820C;
    dw RoomPLM_CrateriaKihunter_2                                        ;8F820E;
    dw PLMEntries_rightwardsExtension                                    ;8F8210;
    db $17,$0C                                                           ;8F8212;
    dw $8000                                                             ;8F8214;
    dw PLMEntries_rightwardsExtension                                    ;8F8216;
    db $18,$0C                                                           ;8F8218;
    dw $8000                                                             ;8F821A;
    dw PLMEntries_rightwardsExtension                                    ;8F821C;
    db $19,$0C                                                           ;8F821E;
    dw $8000                                                             ;8F8220;
    dw PLMEntries_yellowDoorFacingLeft                                   ;8F8222;
    db $2E,$06                                                           ;8F8224;
    dw $000D                                                             ;8F8226;
    dw PLMEntries_yellowDoorFacingUp                                     ;8F8228;
    db $16,$2D                                                           ;8F822A;
    dw $000E,$0000                                                       ;8F822C;

PLMPopulation_ForgottenHighwayElev:
    dw PLMEntries_ScrollPLM                                              ;8F8230;
    db $08,$0D                                                           ;8F8232;
    dw RoomPLM_ForgottenHighwayElev_0                                    ;8F8234;
    dw $0000                                                             ;8F8236;

PLMPopulation_EastOcean:
    dw $0000                                                             ;8F8238;

PLMPopulation_ForgottenHighwayKagos:
    dw $0000                                                             ;8F823A;

PLMPopulation_CrabMaze:
    dw $0000                                                             ;8F823C;

PLMPopulation_ForgottenHighwayElbow:
    dw PLMEntries_yellowDoorFacingUp                                     ;8F823E;
    db $06,$0D                                                           ;8F8240;
    dw $000F,$0000                                                       ;8F8242;

PLMPopulation_CrateriaTube:
    dw $0000                                                             ;8F8246;

PLMPopulation_Moat:
    dw PLMEntries_MissileTank                                            ;8F8248;
    db $0E,$09                                                           ;8F824A;
    dw $0004,$0000                                                       ;8F824C;

PLMPopulation_RedBinstarElev:
    dw PLMEntries_ScrollPLM                                              ;8F8250;
    db $08,$0D                                                           ;8F8252;
    dw RoomPLM_RedBinstarElev_0                                          ;8F8254;
    dw PLMEntries_yellowDoorFacingDown                                   ;8F8256;
    db $06,$02                                                           ;8F8258;
    dw $0010,$0000                                                       ;8F825A;

PLMPopulation_GauntletETank:
    dw PLMEntries_ScrollPLM                                              ;8F825E;
    db $54,$0C                                                           ;8F8260;
    dw RoomPLM_GauntletETank_0                                           ;8F8262;
    dw PLMEntries_EnergyTank                                             ;8F8264;
    db $53,$08                                                           ;8F8266;
    dw $0005,$0000                                                       ;8F8268;

PLMPopulation_PreBowling:
    dw $0000                                                             ;8F826C;

PLMPopulation_Climb_State_0_1:
    dw PLMEntries_ScrollPLM                                              ;8F826E;
    db $1D,$05                                                           ;8F8270;
    dw RoomPLM_Climb_0                                                   ;8F8272;
    dw PLMEntries_ScrollPLM                                              ;8F8274;
    db $20,$05                                                           ;8F8276;
    dw RoomPLM_Climb_1                                                   ;8F8278;
    dw PLMEntries_ScrollPLM                                              ;8F827A;
    db $1D,$76                                                           ;8F827C;
    dw RoomPLM_Climb_2                                                   ;8F827E;
    dw PLMEntries_ScrollPLM                                              ;8F8280;
    db $20,$76                                                           ;8F8282;
    dw RoomPLM_Climb_3                                                   ;8F8284;
    dw PLMEntries_leftwardsExtension                                     ;8F8286;
    db $12,$85                                                           ;8F8288;
    dw $8000                                                             ;8F828A;
    dw PLMEntries_leftwardsExtension                                     ;8F828C;
    db $13,$85                                                           ;8F828E;
    dw $8000                                                             ;8F8290;
    dw PLMEntries_upwardsExtension                                       ;8F8292;
    db $14,$85                                                           ;8F8294;
    dw $8000                                                             ;8F8296;
    dw PLMEntries_upwardsExtension                                       ;8F8298;
    db $14,$86                                                           ;8F829A;
    dw $8000                                                             ;8F829C;
    dw PLMEntries_upwardsExtension                                       ;8F829E;
    db $14,$87                                                           ;8F82A0;
    dw $8000                                                             ;8F82A2;
    dw PLMEntries_upwardsExtension                                       ;8F82A4;
    db $14,$88                                                           ;8F82A6;
    dw $8000                                                             ;8F82A8;
    dw PLMEntries_ScrollPLM                                              ;8F82AA;
    db $14,$89                                                           ;8F82AC;
    dw RoomPLM_Climb_A                                                   ;8F82AE;
    dw PLMEntries_upwardsExtension                                       ;8F82B0;
    db $0F,$86                                                           ;8F82B2;
    dw $8000                                                             ;8F82B4;
    dw PLMEntries_upwardsExtension                                       ;8F82B6;
    db $0F,$87                                                           ;8F82B8;
    dw $8000                                                             ;8F82BA;
    dw PLMEntries_upwardsExtension                                       ;8F82BC;
    db $0F,$88                                                           ;8F82BE;
    dw $8000                                                             ;8F82C0;
    dw PLMEntries_ScrollPLM                                              ;8F82C2;
    db $0F,$89                                                           ;8F82C4;
    dw RoomPLM_Climb_E                                                   ;8F82C6;
    dw PLMEntries_upwardsExtension                                       ;8F82C8;
    db $0D,$86                                                           ;8F82CA;
    dw $8000                                                             ;8F82CC;
    dw PLMEntries_upwardsExtension                                       ;8F82CE;
    db $0D,$87                                                           ;8F82D0;
    dw $8000                                                             ;8F82D2;
    dw PLMEntries_upwardsExtension                                       ;8F82D4;
    db $0D,$88                                                           ;8F82D6;
    dw $8000                                                             ;8F82D8;
    dw PLMEntries_ScrollPLM                                              ;8F82DA;
    db $0D,$89                                                           ;8F82DC;
    dw RoomPLM_Climb_12                                                  ;8F82DE;
    dw PLMEntries_upwardsExtension                                       ;8F82E0;
    db $08,$86                                                           ;8F82E2;
    dw $8000                                                             ;8F82E4;
    dw PLMEntries_upwardsExtension                                       ;8F82E6;
    db $08,$87                                                           ;8F82E8;
    dw $8000                                                             ;8F82EA;
    dw PLMEntries_upwardsExtension                                       ;8F82EC;
    db $08,$88                                                           ;8F82EE;
    dw $8000                                                             ;8F82F0;
    dw PLMEntries_ScrollPLM                                              ;8F82F2;
    db $08,$89                                                           ;8F82F4;
    dw RoomPLM_Climb_16                                                  ;8F82F6;
    dw PLMEntries_greyDoorFacingLeft                                     ;8F82F8;
    db $2E,$06                                                           ;8F82FA;
    dw $9011                                                             ;8F82FC;
    dw PLMEntries_greyDoorFacingRight                                    ;8F82FE;
    db $01,$86                                                           ;8F8300;
    dw $9012                                                             ;8F8302;
    dw PLMEntries_yellowDoorFacingLeft                                   ;8F8304;
    db $2E,$76                                                           ;8F8306;
    dw $0013,$0000                                                       ;8F8308;

PLMPopulation_Climb_State2:
    dw PLMEntries_ScrollPLM                                              ;8F830C;
    db $1D,$05                                                           ;8F830E;
    dw RoomPLM_Climb_0                                                   ;8F8310;
    dw PLMEntries_ScrollPLM                                              ;8F8312;
    db $20,$05                                                           ;8F8314;
    dw RoomPLM_Climb_1                                                   ;8F8316;
    dw PLMEntries_ScrollPLM                                              ;8F8318;
    db $1D,$76                                                           ;8F831A;
    dw RoomPLM_Climb_2                                                   ;8F831C;
    dw PLMEntries_ScrollPLM                                              ;8F831E;
    db $20,$76                                                           ;8F8320;
    dw RoomPLM_Climb_3                                                   ;8F8322;
    dw PLMEntries_leftwardsExtension                                     ;8F8324;
    db $12,$85                                                           ;8F8326;
    dw $8000                                                             ;8F8328;
    dw PLMEntries_leftwardsExtension                                     ;8F832A;
    db $13,$85                                                           ;8F832C;
    dw $8000                                                             ;8F832E;
    dw PLMEntries_upwardsExtension                                       ;8F8330;
    db $14,$85                                                           ;8F8332;
    dw $8000                                                             ;8F8334;
    dw PLMEntries_upwardsExtension                                       ;8F8336;
    db $14,$86                                                           ;8F8338;
    dw $8000                                                             ;8F833A;
    dw PLMEntries_upwardsExtension                                       ;8F833C;
    db $14,$87                                                           ;8F833E;
    dw $8000                                                             ;8F8340;
    dw PLMEntries_upwardsExtension                                       ;8F8342;
    db $14,$88                                                           ;8F8344;
    dw $8000                                                             ;8F8346;
    dw PLMEntries_ScrollPLM                                              ;8F8348;
    db $14,$89                                                           ;8F834A;
    dw RoomPLM_Climb_A                                                   ;8F834C;
    dw PLMEntries_upwardsExtension                                       ;8F834E;
    db $0F,$86                                                           ;8F8350;
    dw $8000                                                             ;8F8352;
    dw PLMEntries_upwardsExtension                                       ;8F8354;
    db $0F,$87                                                           ;8F8356;
    dw $8000                                                             ;8F8358;
    dw PLMEntries_upwardsExtension                                       ;8F835A;
    db $0F,$88                                                           ;8F835C;
    dw $8000                                                             ;8F835E;
    dw PLMEntries_ScrollPLM                                              ;8F8360;
    db $0F,$89                                                           ;8F8362;
    dw RoomPLM_Climb_E                                                   ;8F8364;
    dw PLMEntries_upwardsExtension                                       ;8F8366;
    db $0D,$86                                                           ;8F8368;
    dw $8000                                                             ;8F836A;
    dw PLMEntries_upwardsExtension                                       ;8F836C;
    db $0D,$87                                                           ;8F836E;
    dw $8000                                                             ;8F8370;
    dw PLMEntries_upwardsExtension                                       ;8F8372;
    db $0D,$88                                                           ;8F8374;
    dw $8000                                                             ;8F8376;
    dw PLMEntries_ScrollPLM                                              ;8F8378;
    db $0D,$89                                                           ;8F837A;
    dw RoomPLM_Climb_12                                                  ;8F837C;
    dw PLMEntries_upwardsExtension                                       ;8F837E;
    db $08,$86                                                           ;8F8380;
    dw $8000                                                             ;8F8382;
    dw PLMEntries_upwardsExtension                                       ;8F8384;
    db $08,$87                                                           ;8F8386;
    dw $8000                                                             ;8F8388;
    dw PLMEntries_upwardsExtension                                       ;8F838A;
    db $08,$88                                                           ;8F838C;
    dw $8000                                                             ;8F838E;
    dw PLMEntries_ScrollPLM                                              ;8F8390;
    db $08,$89                                                           ;8F8392;
    dw RoomPLM_Climb_16                                                  ;8F8394;
    dw PLMEntries_SetsMetroidsClearedStatesWhenRequired                  ;8F8396;
    db $08,$08                                                           ;8F8398;
    dw $000C                                                             ;8F839A;
    dw PLMEntries_greyDoorFacingLeft                                     ;8F839C;
    db $2E,$06                                                           ;8F839E;
    dw $9014                                                             ;8F83A0;
    dw PLMEntries_greyDoorFacingLeft                                     ;8F83A2;
    db $2E,$76                                                           ;8F83A4;
    dw $9015                                                             ;8F83A6;
    dw PLMEntries_greyDoorFacingLeft                                     ;8F83A8;
    db $1E,$86                                                           ;8F83AA;
    dw $9016                                                             ;8F83AC;
    dw PLMEntries_greyDoorFacingRight                                    ;8F83AE;
    db $01,$86                                                           ;8F83B0;
    dw $9017,$0000                                                       ;8F83B2;

PLMPopulation_Pit_0:
    dw PLMEntries_ScrollPLM                                              ;8F83B6;
    db $04,$0F                                                           ;8F83B8;
    dw $97AB                                                             ;8F83BA;
    dw PLMEntries_ScrollPLM                                              ;8F83BC;
    db $06,$0F                                                           ;8F83BE;
    dw RoomPLM_Pit_0_1                                                   ;8F83C0;
    dw PLMEntries_ScrollPLM                                              ;8F83C2;
    db $05,$09                                                           ;8F83C4;
    dw RoomPLM_Pit_2                                                     ;8F83C6;
    dw PLMEntries_greyDoorFacingRight                                    ;8F83C8;
    db $01,$06                                                           ;8F83CA;
    dw $9018,$0000                                                       ;8F83CC;

PLMPopulation_Pit_1:
    dw PLMEntries_ScrollPLM                                              ;8F83D0;
    db $04,$0F                                                           ;8F83D2;
    dw RoomPLM_Pit_0_1                                                   ;8F83D4;
    dw PLMEntries_ScrollPLM                                              ;8F83D6;
    db $06,$0F                                                           ;8F83D8;
    dw RoomPLM_Pit_0_1                                                   ;8F83DA;
    dw PLMEntries_ScrollPLM                                              ;8F83DC;
    db $05,$09                                                           ;8F83DE;
    dw RoomPLM_Pit_2                                                     ;8F83E0;
    dw PLMEntries_greyDoorFacingLeft                                     ;8F83E2;
    db $2E,$06                                                           ;8F83E4;
    dw $0C19                                                             ;8F83E6;
    dw PLMEntries_greyDoorFacingRight                                    ;8F83E8;
    db $01,$06                                                           ;8F83EA;
    dw $0C1A                                                             ;8F83EC;
    dw PLMEntries_MissileTank                                            ;8F83EE;
    db $05,$1A                                                           ;8F83F0;
    dw $0006,$0000                                                       ;8F83F2;

PLMPopulation_ElevToBlueBrinstar_State0_1:
    dw PLMEntries_ScrollPLM                                              ;8F83F6;
    db $07,$0D                                                           ;8F83F8;
    dw RoomPLM_ElevToBlueBrinstar                                        ;8F83FA;
    dw $0000                                                             ;8F83FC;

PLMPopulation_BombTorizo_State0_1:
    dw PLMEntries_bombTorizoGreyDoor                                     ;8F83FE;
    db $01,$06                                                           ;8F8400;
    dw $081B                                                             ;8F8402;
    dw PLMEntries_BombsChozoOrb                                          ;8F8404;
    db $0C,$0A                                                           ;8F8406;
    dw $0007                                                             ;8F8408;
    dw PLMEntries_BombTorizosCrumblingChozo                              ;8F840A;
    db $0D,$0B                                                           ;8F840C;
    dw $0000,$0000                                                       ;8F840E;

PLMPopulation_BombTorizo_State2:
    dw PLMEntries_SetsMetroidsClearedStatesWhenRequired                  ;8F8412;
    db $08,$08                                                           ;8F8414;
    dw $000E                                                             ;8F8416;
    dw PLMEntries_greyDoorFacingRight                                    ;8F8418;
    db $01,$06                                                           ;8F841A;
    dw $181C,$0000                                                       ;8F841C;

PLMPopulation_Flyway_State0_1:
    dw PLMEntries_redDoorFacingLeft                                      ;8F8420;
    db $2E,$06                                                           ;8F8422;
    dw $001D,$0000                                                       ;8F8424;

PLMPopulation_Flyway_State2:
    dw PLMEntries_SetsMetroidsClearedStatesWhenRequired                  ;8F8428;
    db $08,$08                                                           ;8F842A;
    dw $0010,$0000                                                       ;8F842C;

PLMPopulation_PreMapFlyway:
    dw $0000                                                             ;8F8430;

PLMPopulation_Terminator:
    dw PLMEntries_EnergyTank                                             ;8F8432;
    db $07,$2A                                                           ;8F8434;
    dw $0008,$0000                                                       ;8F8436;

PLMPopulation_GreenBrinstarElev:
    dw PLMEntries_ScrollPLM                                              ;8F843A;
    db $07,$0D                                                           ;8F843C;
    dw RoomPLM_GreenBrinstarElev_0                                       ;8F843E;
    dw $0000                                                             ;8F8440;

PLMPopulation_LowerMushrooms:
    dw $0000                                                             ;8F8442;

PLMPopulation_CrateriaMap:
    dw PLMEntries_mapStation                                             ;8F8444;
    db $0B,$0A                                                           ;8F8446;
    dw $8000,$0000                                                       ;8F8448;

PLMPopulation_GreenPiratesShaft:
    dw PLMEntries_ScrollPLM                                              ;8F844C;
    db $07,$43                                                           ;8F844E;
    dw RoomPLM_GreenPiratesShaft_0                                       ;8F8450;
    dw PLMEntries_rightwardsExtension                                    ;8F8452;
    db $08,$43                                                           ;8F8454;
    dw $8000                                                             ;8F8456;
    dw PLMEntries_ScrollPLM                                              ;8F8458;
    db $09,$46                                                           ;8F845A;
    dw RoomPLM_GreenPiratesShaft_2                                       ;8F845C;
    dw PLMEntries_rightwardsExtension                                    ;8F845E;
    db $0A,$46                                                           ;8F8460;
    dw $8000                                                             ;8F8462;
    dw PLMEntries_MissileTank                                            ;8F8464;
    db $0D,$1B                                                           ;8F8466;
    dw $0009                                                             ;8F8468;
    dw PLMEntries_MissileTank                                            ;8F846A;
    db $02,$1B                                                           ;8F846C;
    dw $000A                                                             ;8F846E;
    dw PLMEntries_redDoorFacingLeft                                      ;8F8470;
    db $0E,$66                                                           ;8F8472;
    dw $001E,$0000                                                       ;8F8474;

PLMPopulation_CrateriaSuper:
    dw PLMEntries_SuperMissileTank                                       ;8F8478;
    db $3B,$09                                                           ;8F847A;
    dw $000B,$0000                                                       ;8F847C;

PLMPopulation_FinalMissileBombway_State0:
    dw $0000                                                             ;8F8480;

PLMPopulation_FinalMissileBombway_State1:
    dw $0000                                                             ;8F8482;

PLMPopulation_FinalMissile_State0:
    dw $0000                                                             ;8F8484;

PLMPopulation_FinalMissile_State1:
    dw PLMEntries_MissileTank                                            ;8F8486;
    db $04,$07                                                           ;8F8488;
    dw $000C,$0000                                                       ;8F848A;

PLMPopulation_GreenBrinstarMainShaft:
    dw PLMEntries_ScrollPLM                                              ;8F848E;
    db $07,$71                                                           ;8F8490;
    dw RoomPLM_GreenBrinstarMainShaft_0                                  ;8F8492;
    dw PLMEntries_ScrollPLM                                              ;8F8494;
    db $10,$A8                                                           ;8F8496;
    dw RoomPLM_GreenBrinstarMainShaft_1_2                                ;8F8498;
    dw PLMEntries_ScrollPLM                                              ;8F849A;
    db $21,$A8                                                           ;8F849C;
    dw RoomPLM_GreenBrinstarMainShaft_1_2                                ;8F849E;
    dw PLMEntries_ScrollPLM                                              ;8F84A0;
    db $0D,$AC                                                           ;8F84A2;
    dw RoomPLM_GreenBrinstarMainShaft_3                                  ;8F84A4;
    dw PLMEntries_elevatorPlatform                                       ;8F84A6;
    db $06,$2C                                                           ;8F84A8;
    dw $8000                                                             ;8F84AA;
    dw PLMEntries_PowerBombTankChozoOrb                                  ;8F84AC;
    db $3C,$7A                                                           ;8F84AE;
    dw $000D                                                             ;8F84B0;
    dw PLMEntries_redDoorFacingRight                                     ;8F84B2;
    db $01,$56                                                           ;8F84B4;
    dw $001F                                                             ;8F84B6;
    dw PLMEntries_redDoorFacingRight                                     ;8F84B8;
    db $01,$46                                                           ;8F84BA;
    dw $0020                                                             ;8F84BC;
    dw PLMEntries_redDoorFacingLeft                                      ;8F84BE;
    db $0E,$46                                                           ;8F84C0;
    dw $0021                                                             ;8F84C2;
    dw PLMEntries_redDoorFacingLeft                                      ;8F84C4;
    db $0E,$66                                                           ;8F84C6;
    dw $0022                                                             ;8F84C8;
    dw PLMEntries_redDoorFacingRight                                     ;8F84CA;
    db $01,$66                                                           ;8F84CC;
    dw $0023                                                             ;8F84CE;
    dw PLMEntries_greyDoorFacingLeft                                     ;8F84D0;
    db $0E,$76                                                           ;8F84D2;
    dw $9024,$0000                                                       ;8F84D4;

PLMPopulation_SporeSpawnSuper:
    dw PLMEntries_ScrollPLM                                              ;8F84D8;
    db $17,$0B                                                           ;8F84DA;
    dw RoomPLM_SporeSpawnSuper_0                                         ;8F84DC;
    dw PLMEntries_rightwardsExtension                                    ;8F84DE;
    db $18,$0B                                                           ;8F84E0;
    dw $8000                                                             ;8F84E2;
    dw PLMEntries_SuperMissileTankChozoOrb                               ;8F84E4;
    db $1A,$87                                                           ;8F84E6;
    dw $000E,$0000                                                       ;8F84E8;

PLMPopulation_BrinstarPreMap:
    dw PLMEntries_greyDoorFacingLeft                                     ;8F84EC;
    db $2E,$06                                                           ;8F84EE;
    dw $0C25,$0000                                                       ;8F84F0;

PLMPopulation_EarlySupers:
    dw PLMEntries_ScrollPLM                                              ;8F84F4;
    db $29,$0E                                                           ;8F84F6;
    dw RoomPLM_EarlySupers_0_4                                           ;8F84F8;
    dw PLMEntries_rightwardsExtension                                    ;8F84FA;
    db $2A,$0E                                                           ;8F84FC;
    dw $8000                                                             ;8F84FE;
    dw PLMEntries_rightwardsExtension                                    ;8F8500;
    db $2B,$0E                                                           ;8F8502;
    dw $8000                                                             ;8F8504;
    dw PLMEntries_ScrollPLM                                              ;8F8506;
    db $04,$13                                                           ;8F8508;
    dw RoomPLM_EarlySupers_3                                             ;8F850A;
    dw PLMEntries_ScrollPLM                                              ;8F850C;
    db $04,$0F                                                           ;8F850E;
    dw RoomPLM_EarlySupers_0_4                                           ;8F8510;
    dw PLMEntries_redDoorFacingLeft                                      ;8F8512;
    db $2E,$16                                                           ;8F8514;
    dw $0026                                                             ;8F8516;
    dw PLMEntries_MissileTank                                            ;8F8518;
    db $13,$1B                                                           ;8F851A;
    dw $000F                                                             ;8F851C;
    dw PLMEntries_SuperMissileTank                                       ;8F851E;
    db $04,$06                                                           ;8F8520;
    dw $0010,$0000                                                       ;8F8522;

PLMPopulation_BrinstarReserveTank:
    dw PLMEntries_ScrollPLM                                              ;8F8526;
    db $0E,$0B                                                           ;8F8528;
    dw RoomPLM_BrinstarReserveTank_0                                     ;8F852A;
    dw PLMEntries_ReserveTankChozoOrb                                    ;8F852C;
    db $0B,$07                                                           ;8F852E;
    dw $0011                                                             ;8F8530;
    dw PLMEntries_MissileTankShotBlock                                   ;8F8532;
    db $1E,$07                                                           ;8F8534;
    dw $0012                                                             ;8F8536;
    dw PLMEntries_MissileTank                                            ;8F8538;
    db $19,$07                                                           ;8F853A;
    dw $0013,$0000                                                       ;8F853C;

PLMPopulation_GreenBrinstarMap:
    dw PLMEntries_mapStation                                             ;8F8540;
    db $05,$0A                                                           ;8F8542;
    dw $8000,$0000                                                       ;8F8544;

PLMPopulation_GreenBrinstarFirefleas:
    dw PLMEntries_greenDoorFacingRight                                   ;8F8548;
    db $01,$26                                                           ;8F854A;
    dw $0027,$0000                                                       ;8F854C;

PLMPopulation_GreenBrinstarMissileRefill:
    dw PLMEntries_missileStation                                         ;8F8550;
    db $04,$0A                                                           ;8F8552;
    dw $0014,$0000                                                       ;8F8554;

PLMPopulation_Dachora:
    dw PLMEntries_downwardsExtension                                     ;8F8558;
    db $45,$0E                                                           ;8F855A;
    dw $8000                                                             ;8F855C;
    dw PLMEntries_leftwardsExtension                                     ;8F855E;
    db $45,$0D                                                           ;8F8560;
    dw $8000                                                             ;8F8562;
    dw PLMEntries_leftwardsExtension                                     ;8F8564;
    db $46,$0D                                                           ;8F8566;
    dw $8000                                                             ;8F8568;
    dw PLMEntries_leftwardsExtension                                     ;8F856A;
    db $47,$0D                                                           ;8F856C;
    dw $8000                                                             ;8F856E;
    dw PLMEntries_leftwardsExtension                                     ;8F8570;
    db $48,$0D                                                           ;8F8572;
    dw $8000                                                             ;8F8574;
    dw PLMEntries_leftwardsExtension                                     ;8F8576;
    db $49,$0D                                                           ;8F8578;
    dw $8000                                                             ;8F857A;
    dw PLMEntries_ScrollPLM                                              ;8F857C;
    db $4A,$0D                                                           ;8F857E;
    dw RoomPLM_Dachora_6                                                 ;8F8580;
    dw PLMEntries_upwardsExtension                                       ;8F8582;
    db $40,$08                                                           ;8F8584;
    dw $8000                                                             ;8F8586;
    dw PLMEntries_upwardsExtension                                       ;8F8588;
    db $40,$09                                                           ;8F858A;
    dw $8000                                                             ;8F858C;
    dw PLMEntries_upwardsExtension                                       ;8F858E;
    db $40,$0A                                                           ;8F8590;
    dw $8000                                                             ;8F8592;
    dw PLMEntries_ScrollPLM                                              ;8F8594;
    db $40,$0B                                                           ;8F8596;
    dw RoomPLM_Dachora_A_16                                              ;8F8598;
    dw PLMEntries_downwardsExtension                                     ;8F859A;
    db $4B,$0B                                                           ;8F859C;
    dw $8000                                                             ;8F859E;
    dw PLMEntries_downwardsExtension                                     ;8F85A0;
    db $4B,$0A                                                           ;8F85A2;
    dw $8000                                                             ;8F85A4;
    dw PLMEntries_rightwardsExtension                                    ;8F85A6;
    db $4B,$09                                                           ;8F85A8;
    dw $8000                                                             ;8F85AA;
    dw PLMEntries_rightwardsExtension                                    ;8F85AC;
    db $4A,$09                                                           ;8F85AE;
    dw $8000                                                             ;8F85B0;
    dw PLMEntries_rightwardsExtension                                    ;8F85B2;
    db $49,$09                                                           ;8F85B4;
    dw $8000                                                             ;8F85B6;
    dw PLMEntries_rightwardsExtension                                    ;8F85B8;
    db $48,$09                                                           ;8F85BA;
    dw $8000                                                             ;8F85BC;
    dw PLMEntries_rightwardsExtension                                    ;8F85BE;
    db $47,$09                                                           ;8F85C0;
    dw $8000                                                             ;8F85C2;
    dw PLMEntries_rightwardsExtension                                    ;8F85C4;
    db $46,$09                                                           ;8F85C6;
    dw $8000                                                             ;8F85C8;
    dw PLMEntries_rightwardsExtension                                    ;8F85CA;
    db $45,$09                                                           ;8F85CC;
    dw $8000                                                             ;8F85CE;
    dw PLMEntries_upwardsExtension                                       ;8F85D0;
    db $44,$09                                                           ;8F85D2;
    dw $8000                                                             ;8F85D4;
    dw PLMEntries_upwardsExtension                                       ;8F85D6;
    db $44,$0A                                                           ;8F85D8;
    dw $8000                                                             ;8F85DA;
    dw PLMEntries_ScrollPLM                                              ;8F85DC;
    db $44,$0B                                                           ;8F85DE;
    dw RoomPLM_Dachora_A_16                                              ;8F85E0;
    dw $0000                                                             ;8F85E2;

PLMPopulation_BigPink:
    dw PLMEntries_ScrollPLM                                              ;8F85E4;
    db $2E,$6B                                                           ;8F85E6;
    dw RoomPLM_BigPink_0                                                 ;8F85E8;
    dw PLMEntries_ScrollPLM                                              ;8F85EA;
    db $20,$7A                                                           ;8F85EC;
    dw RoomPLM_BigPink_1                                                 ;8F85EE;
    dw PLMEntries_ScrollPLM                                              ;8F85F0;
    db $3D,$57                                                           ;8F85F2;
    dw RoomPLM_BigPink_2                                                 ;8F85F4;
    dw PLMEntries_ScrollPLM                                              ;8F85F6;
    db $40,$57                                                           ;8F85F8;
    dw RoomPLM_BigPink_3                                                 ;8F85FA;
    dw PLMEntries_ScrollPLM                                              ;8F85FC;
    db $1F,$08                                                           ;8F85FE;
    dw RoomPLM_BigPink_4                                                 ;8F8600;
    dw PLMEntries_ScrollPLM                                              ;8F8602;
    db $21,$08                                                           ;8F8604;
    dw RoomPLM_BigPink_5                                                 ;8F8606;
    dw PLMEntries_MissileTank                                            ;8F8608;
    db $24,$32                                                           ;8F860A;
    dw $0015                                                             ;8F860C;
    dw PLMEntries_MissileTank                                            ;8F860E;
    db $22,$67                                                           ;8F8610;
    dw $0016                                                             ;8F8612;
    dw PLMEntries_ChargeBeamChozoOrb                                     ;8F8614;
    db $25,$76                                                           ;8F8616;
    dw $0017                                                             ;8F8618;
    dw PLMEntries_yellowDoorFacingLeft                                   ;8F861A;
    db $3E,$46                                                           ;8F861C;
    dw $0028                                                             ;8F861E;
    dw PLMEntries_greenDoorFacingLeft                                    ;8F8620;
    db $3E,$66                                                           ;8F8622;
    dw $0029                                                             ;8F8624;
    dw PLMEntries_redDoorFacingLeft                                      ;8F8626;
    db $3E,$06                                                           ;8F8628;
    dw $002A                                                             ;8F862A;
    dw PLMEntries_redDoorFacingRight                                     ;8F862C;
    db $01,$96                                                           ;8F862E;
    dw $002B,$0000                                                       ;8F8630;

PLMPopulation_SporeSpawnKihunters:
    dw PLMEntries_greyDoorFacingRight                                    ;8F8634;
    db $01,$06                                                           ;8F8636;
    dw $0C2C                                                             ;8F8638;
    dw PLMEntries_greyDoorFacingDown                                     ;8F863A;
    db $36,$03                                                           ;8F863C;
    dw $0C2D,$0000                                                       ;8F863E;

PLMPopulation_SporeSpawn_State0_1:
    dw PLMEntries_greenDoorFacingUp                                      ;8F8642;
    db $06,$2E                                                           ;8F8644;
    dw $002E,$0000                                                       ;8F8646;

PLMPopulation_PinkBrinstarPowerBombs:
    dw PLMEntries_ScrollPLM                                              ;8F864A;
    db $08,$0E                                                           ;8F864C;
    dw RoomPLM_PinkBrinstarPowerBombs_0                                  ;8F864E;
    dw PLMEntries_ScrollPLM                                              ;8F8650;
    db $08,$0B                                                           ;8F8652;
    dw RoomPLM_PinkBrinstarPowerBombs_1                                  ;8F8654;
    dw PLMEntries_greyDoorFacingLeft                                     ;8F8656;
    db $1E,$06                                                           ;8F8658;
    dw $0C2F                                                             ;8F865A;
    dw PLMEntries_PowerBombTank                                          ;8F865C;
    db $06,$17                                                           ;8F865E;
    dw $0018,$0000                                                       ;8F8660;

PLMPopulation_GreenHillZone:
    dw PLMEntries_downwardsClosedGate                                    ;8F8664;
    db $64,$37                                                           ;8F8666;
    dw $8000                                                             ;8F8668;
    dw PLMEntries_downwardsGateShotblock                                 ;8F866A;
    db $64,$37                                                           ;8F866C;
    dw $0000                                                             ;8F866E;
    dw PLMEntries_yellowDoorFacingLeft                                   ;8F8670;
    db $1E,$06                                                           ;8F8672;
    dw $0030                                                             ;8F8674;
    dw PLMEntries_MissileTank                                            ;8F8676;
    db $3D,$18                                                           ;8F8678;
    dw $0019,$0000                                                       ;8F867A;

PLMPopulation_MorphBall_State0:
    dw PLMEntries_ScrollPLM                                              ;8F867E;
    db $1F,$2B                                                           ;8F8680;
    dw RoomPLM_MorphBall_0                                               ;8F8682;
    dw PLMEntries_upwardsExtension                                       ;8F8684;
    db $08,$23                                                           ;8F8686;
    dw $8000                                                             ;8F8688;
    dw PLMEntries_upwardsExtension                                       ;8F868A;
    db $08,$24                                                           ;8F868C;
    dw $8000                                                             ;8F868E;
    dw PLMEntries_upwardsExtension                                       ;8F8690;
    db $08,$25                                                           ;8F8692;
    dw $8000                                                             ;8F8694;
    dw PLMEntries_upwardsExtension                                       ;8F8696;
    db $08,$26                                                           ;8F8698;
    dw $8000                                                             ;8F869A;
    dw PLMEntries_upwardsExtension                                       ;8F869C;
    db $08,$27                                                           ;8F869E;
    dw $8000                                                             ;8F86A0;
    dw PLMEntries_upwardsExtension                                       ;8F86A2;
    db $08,$28                                                           ;8F86A4;
    dw $8000                                                             ;8F86A6;
    dw PLMEntries_upwardsExtension                                       ;8F86A8;
    db $08,$29                                                           ;8F86AA;
    dw $8000                                                             ;8F86AC;
    dw PLMEntries_upwardsExtension                                       ;8F86AE;
    db $08,$2A                                                           ;8F86B0;
    dw $8000                                                             ;8F86B2;
    dw PLMEntries_ScrollPLM                                              ;8F86B4;
    db $08,$2B                                                           ;8F86B6;
    dw RoomPLM_MorphBall_9                                               ;8F86B8;
    dw PLMEntries_rightwardsExtension                                    ;8F86BA;
    db $58,$21                                                           ;8F86BC;
    dw $8000                                                             ;8F86BE;
    dw PLMEntries_ScrollPLM                                              ;8F86C0;
    db $57,$21                                                           ;8F86C2;
    dw RoomPLM_MorphBall_B_D                                             ;8F86C4;
    dw PLMEntries_rightwardsExtension                                    ;8F86C6;
    db $58,$0A                                                           ;8F86C8;
    dw $8000                                                             ;8F86CA;
    dw PLMEntries_ScrollPLM                                              ;8F86CC;
    db $57,$0A                                                           ;8F86CE;
    dw RoomPLM_MorphBall_B_D                                             ;8F86D0;
    dw PLMEntries_rightwardsExtension                                    ;8F86D2;
    db $58,$26                                                           ;8F86D4;
    dw $8000                                                             ;8F86D6;
    dw PLMEntries_ScrollPLM                                              ;8F86D8;
    db $57,$26                                                           ;8F86DA;
    dw RoomPLM_MorphBall_F                                               ;8F86DC;
    dw PLMEntries_MorphBall                                              ;8F86DE;
    db $45,$29                                                           ;8F86E0;
    dw $001A,$0000                                                       ;8F86E2;

PLMPopulation_MorphBall_State1:
    dw PLMEntries_ScrollPLM                                              ;8F86E6;
    db $1F,$2B                                                           ;8F86E8;
    dw RoomPLM_MorphBall_0                                               ;8F86EA;
    dw PLMEntries_upwardsExtension                                       ;8F86EC;
    db $08,$23                                                           ;8F86EE;
    dw $8000                                                             ;8F86F0;
    dw PLMEntries_upwardsExtension                                       ;8F86F2;
    db $08,$24                                                           ;8F86F4;
    dw $8000                                                             ;8F86F6;
    dw PLMEntries_upwardsExtension                                       ;8F86F8;
    db $08,$25                                                           ;8F86FA;
    dw $8000                                                             ;8F86FC;
    dw PLMEntries_upwardsExtension                                       ;8F86FE;
    db $08,$26                                                           ;8F8700;
    dw $8000                                                             ;8F8702;
    dw PLMEntries_upwardsExtension                                       ;8F8704;
    db $08,$27                                                           ;8F8706;
    dw $8000                                                             ;8F8708;
    dw PLMEntries_upwardsExtension                                       ;8F870A;
    db $08,$28                                                           ;8F870C;
    dw $8000                                                             ;8F870E;
    dw PLMEntries_upwardsExtension                                       ;8F8710;
    db $08,$29                                                           ;8F8712;
    dw $8000                                                             ;8F8714;
    dw PLMEntries_upwardsExtension                                       ;8F8716;
    db $08,$2A                                                           ;8F8718;
    dw $8000                                                             ;8F871A;
    dw PLMEntries_ScrollPLM                                              ;8F871C;
    db $08,$2B                                                           ;8F871E;
    dw RoomPLM_MorphBall_9                                               ;8F8720;
    dw PLMEntries_rightwardsExtension                                    ;8F8722;
    db $58,$21                                                           ;8F8724;
    dw $8000                                                             ;8F8726;
    dw PLMEntries_ScrollPLM                                              ;8F8728;
    db $57,$21                                                           ;8F872A;
    dw RoomPLM_MorphBall_B_D                                             ;8F872C;
    dw PLMEntries_rightwardsExtension                                    ;8F872E;
    db $58,$0A                                                           ;8F8730;
    dw $8000                                                             ;8F8732;
    dw PLMEntries_ScrollPLM                                              ;8F8734;
    db $57,$0A                                                           ;8F8736;
    dw RoomPLM_MorphBall_B_D                                             ;8F8738;
    dw PLMEntries_rightwardsExtension                                    ;8F873A;
    db $58,$26                                                           ;8F873C;
    dw $8000                                                             ;8F873E;
    dw PLMEntries_ScrollPLM                                              ;8F8740;
    db $57,$26                                                           ;8F8742;
    dw RoomPLM_MorphBall_F                                               ;8F8744;
    dw PLMEntries_greyDoorFacingRight                                    ;8F8746;
    db $01,$26                                                           ;8F8748;
    dw $0C31                                                             ;8F874A;
    dw PLMEntries_PowerBombTank                                          ;8F874C;
    db $28,$2A                                                           ;8F874E;
    dw $001B,$0000                                                       ;8F8750;

PLMPopulation_ConstructionZone_State0_1:
    dw PLMEntries_ScrollPLM                                              ;8F8754;
    db $04,$0B                                                           ;8F8756;
    dw RoomPLM_ConstructionZone_0                                        ;8F8758;
    dw PLMEntries_rightwardsExtension                                    ;8F875A;
    db $05,$0B                                                           ;8F875C;
    dw $8000                                                             ;8F875E;
    dw PLMEntries_rightwardsExtension                                    ;8F8760;
    db $06,$0B                                                           ;8F8762;
    dw $8000                                                             ;8F8764;
    dw PLMEntries_rightwardsExtension                                    ;8F8766;
    db $07,$0B                                                           ;8F8768;
    dw $8000                                                             ;8F876A;
    dw PLMEntries_rightwardsExtension                                    ;8F876C;
    db $08,$0B                                                           ;8F876E;
    dw $8000                                                             ;8F8770;
    dw PLMEntries_rightwardsExtension                                    ;8F8772;
    db $09,$0B                                                           ;8F8774;
    dw $8000                                                             ;8F8776;
    dw PLMEntries_rightwardsExtension                                    ;8F8778;
    db $0A,$0B                                                           ;8F877A;
    dw $8000                                                             ;8F877C;
    dw PLMEntries_rightwardsExtension                                    ;8F877E;
    db $0B,$0B                                                           ;8F8780;
    dw $8000                                                             ;8F8782;
    dw PLMEntries_redDoorFacingLeft                                      ;8F8784;
    db $0E,$06                                                           ;8F8786;
    dw $0032,$0000                                                       ;8F8788;

PLMPopulation_BlueBrinstarETank_State0_1:
    dw PLMEntries_ScrollPLM                                              ;8F878C;
    db $27,$0B                                                           ;8F878E;
    dw RoomPLM_BlueBrinstarETank_0_1                                     ;8F8790;
    dw PLMEntries_ScrollPLM                                              ;8F8792;
    db $27,$26                                                           ;8F8794;
    dw RoomPLM_BlueBrinstarETank_0_1                                     ;8F8796;
    dw PLMEntries_MissileTank                                            ;8F8798;
    db $2E,$29                                                           ;8F879A;
    dw $001C                                                             ;8F879C;
    dw PLMEntries_EnergyTankShotBlock                                    ;8F879E;
    db $1C,$22                                                           ;8F87A0;
    dw $001D,$0000                                                       ;8F87A2;

PLMPopulation_NoobBridge:
    dw PLMEntries_greenDoorFacingLeft                                    ;8F87A6;
    db $5E,$06                                                           ;8F87A8;
    dw $0033,$0000                                                       ;8F87AA;

PLMPopulation_GreenBrinstarBeetoms:
    dw $0000                                                             ;8F87AE;

PLMPopulation_EtecoonETank:
    dw PLMEntries_ScrollPLM                                              ;8F87B0;
    db $07,$0B                                                           ;8F87B2;
    dw RoomPLM_EtecoonETank_0                                            ;8F87B4;
    dw PLMEntries_rightwardsExtension                                    ;8F87B6;
    db $08,$0B                                                           ;8F87B8;
    dw $8000                                                             ;8F87BA;
    dw PLMEntries_rightwardsExtension                                    ;8F87BC;
    db $09,$0B                                                           ;8F87BE;
    dw $8000                                                             ;8F87C0;
    dw PLMEntries_EnergyTank                                             ;8F87C2;
    db $05,$09                                                           ;8F87C4;
    dw $001E                                                             ;8F87C6;
    dw PLMEntries_greenDoorFacingRight                                   ;8F87C8;
    db $01,$06                                                           ;8F87CA;
    dw $0034,$0000                                                       ;8F87CC;

PLMPopulation_EtecoonSuper:
    dw PLMEntries_SuperMissileTank                                       ;8F87D0;
    db $07,$09                                                           ;8F87D2;
    dw $001F,$0000                                                       ;8F87D4;

PLMPopulation_DachoraEnergyRefill:
    dw PLMEntries_energyStation                                          ;8F87D8;
    db $04,$0A                                                           ;8F87DA;
    dw $0020,$0000                                                       ;8F87DC;

PLMPopulation_SporeSpawnFarming:
    dw PLMEntries_greenDoorFacingRight                                   ;8F87E0;
    db $01,$06                                                           ;8F87E2;
    dw $0035,$0000                                                       ;8F87E4;

PLMPopulation_WaterwayETank:
    dw PLMEntries_upwardsExtension                                       ;8F87E8;
    db $0F,$09                                                           ;8F87EA;
    dw $8000                                                             ;8F87EC;
    dw PLMEntries_upwardsExtension                                       ;8F87EE;
    db $0F,$0A                                                           ;8F87F0;
    dw $8000                                                             ;8F87F2;
    dw PLMEntries_ScrollPLM                                              ;8F87F4;
    db $0F,$0B                                                           ;8F87F6;
    dw RoomPLM_WaterwayETank                                             ;8F87F8;
    dw PLMEntries_EnergyTank                                             ;8F87FA;
    db $04,$09                                                           ;8F87FC;
    dw $0021,$0000                                                       ;8F87FE;

PLMPopulation_FirstMissile:
    dw PLMEntries_MissileTankChozoOrb                                    ;8F8802;
    db $04,$07                                                           ;8F8804;
    dw $0022,$0000                                                       ;8F8806;

PLMPopulation_PinkBrinstarHoppers:
    dw PLMEntries_downwardsClosedGate                                    ;8F880A;
    db $11,$04                                                           ;8F880C;
    dw $8000                                                             ;8F880E;
    dw PLMEntries_downwardsGateShotblock                                 ;8F8810;
    db $11,$04                                                           ;8F8812;
    dw $0002                                                             ;8F8814;
    dw PLMEntries_greyDoorFacingRight                                    ;8F8816;
    db $01,$16                                                           ;8F8818;
    dw $0C36                                                             ;8F881A;
    dw PLMEntries_greyDoorFacingLeft                                     ;8F881C;
    db $1E,$16                                                           ;8F881E;
    dw $0C37,$0000                                                       ;8F8820;

PLMPopulation_HopperETank:
    dw PLMEntries_EnergyTank                                             ;8F8824;
    db $0B,$09                                                           ;8F8826;
    dw $0023,$0000                                                       ;8F8828;

PLMPopulation_BigPinkSaveRoom:
    dw PLMEntries_saveStation                                            ;8F882C;
    db $05,$0B                                                           ;8F882E;
    dw $0000,$0000                                                       ;8F8830;

PLMPopulation_BlueBrinstarBoulders:
    dw $0000                                                             ;8F8834;

PLMPopulation_BillyMays:
    dw PLMEntries_MissileTank                                            ;8F8836;
    db $07,$09                                                           ;8F8838;
    dw $0024                                                             ;8F883A;
    dw PLMEntries_MissileTankShotBlock                                   ;8F883C;
    db $05,$0C                                                           ;8F883E;
    dw $0025,$0000                                                       ;8F8840;

PLMPopulation_GreenBrinstarSave:
    dw PLMEntries_saveStation                                            ;8F8844;
    db $05,$0B                                                           ;8F8846;
    dw $0001,$0000                                                       ;8F8848;

PLMPopulation_EtecoonSave:
    dw PLMEntries_saveStation                                            ;8F884C;
    db $05,$0B                                                           ;8F884E;
    dw $0002,$0000                                                       ;8F8850;

PLMPopulation_RedTower:
    dw PLMEntries_ScrollPLM                                              ;8F8854;
    db $09,$6A                                                           ;8F8856;
    dw RoomPLM_RedTower_0                                                ;8F8858;
    dw PLMEntries_rightwardsExtension                                    ;8F885A;
    db $0A,$6A                                                           ;8F885C;
    dw $8000                                                             ;8F885E;
    dw PLMEntries_greenDoorFacingRight                                   ;8F8860;
    db $01,$96                                                           ;8F8862;
    dw $0038                                                             ;8F8864;
    dw PLMEntries_yellowDoorFacingRIght                                  ;8F8866;
    db $01,$66                                                           ;8F8868;
    dw $0039,$0000                                                       ;8F886A;

PLMPopulation_RedBrinstarFirefleas:
    dw PLMEntries_redDoorFacingRight                                     ;8F886E;
    db $01,$06                                                           ;8F8870;
    dw $003A,$0000                                                       ;8F8872;

PLMPopulation_XrayScope:
    dw PLMEntries_XrayScopeChozoOrb                                      ;8F8876;
    db $05,$07                                                           ;8F8878;
    dw $0026,$0000                                                       ;8F887A;

PLMPopulation_Hellway:
    dw $0000                                                             ;8F887E;

PLMPopulation_Caterpillar:
    dw PLMEntries_ScrollPLM                                              ;8F8880;
    db $05,$5E                                                           ;8F8882;
    dw RoomPLM_Caterpillar_0                                             ;8F8884;
    dw PLMEntries_rightwardsExtension                                    ;8F8886;
    db $06,$5E                                                           ;8F8888;
    dw $8000                                                             ;8F888A;
    dw PLMEntries_ScrollPLM                                              ;8F888C;
    db $10,$37                                                           ;8F888E;
    dw RoomPLM_Caterpillar_2                                             ;8F8890;
    dw PLMEntries_ScrollPLM                                              ;8F8892;
    db $0D,$37                                                           ;8F8894;
    dw RoomPLM_Caterpillar_3                                             ;8F8896;
    dw PLMEntries_elevatorPlatform                                       ;8F8898;
    db $06,$2C                                                           ;8F889A;
    dw $8000                                                             ;8F889C;
    dw PLMEntries_downwardsClosedGate                                    ;8F889E;
    db $26,$35                                                           ;8F88A0;
    dw $8000                                                             ;8F88A2;
    dw PLMEntries_downwardsGateShotblock                                 ;8F88A4;
    db $26,$35                                                           ;8F88A6;
    dw $000A                                                             ;8F88A8;
    dw PLMEntries_greenDoorFacingRight                                   ;8F88AA;
    db $01,$36                                                           ;8F88AC;
    dw $003B                                                             ;8F88AE;
    dw PLMEntries_yellowDoorFacingRIght                                  ;8F88B0;
    db $01,$56                                                           ;8F88B2;
    dw $003C                                                             ;8F88B4;
    dw PLMEntries_greenDoorFacingRight                                   ;8F88B6;
    db $01,$76                                                           ;8F88B8;
    dw $003D,$0000                                                       ;8F88BA;

PLMPopulation_BetaPowerBomb:
    dw PLMEntries_ScrollPLM                                              ;8F88BE;
    db $07,$0E                                                           ;8F88C0;
    dw RoomPLM_BetaPowerBomb_0                                           ;8F88C2;
    dw PLMEntries_rightwardsExtension                                    ;8F88C4;
    db $08,$0E                                                           ;8F88C6;
    dw $8000                                                             ;8F88C8;
    dw PLMEntries_PowerBombTank                                          ;8F88CA;
    db $04,$13                                                           ;8F88CC;
    dw $0027                                                             ;8F88CE;
    dw PLMEntries_greyDoorFacingLeft                                     ;8F88D0;
    db $1E,$06                                                           ;8F88D2;
    dw $0C3E,$0000                                                       ;8F88D4;

PLMPopulation_AlphaPowerBomb:
    dw PLMEntries_upwardsExtension                                       ;8F88D8;
    db $0F,$04                                                           ;8F88DA;
    dw $8000                                                             ;8F88DC;
    dw PLMEntries_upwardsExtension                                       ;8F88DE;
    db $0F,$05                                                           ;8F88E0;
    dw $8000                                                             ;8F88E2;
    dw PLMEntries_upwardsExtension                                       ;8F88E4;
    db $0F,$06                                                           ;8F88E6;
    dw $8000                                                             ;8F88E8;
    dw PLMEntries_upwardsExtension                                       ;8F88EA;
    db $0F,$07                                                           ;8F88EC;
    dw $8000                                                             ;8F88EE;
    dw PLMEntries_upwardsExtension                                       ;8F88F0;
    db $0F,$08                                                           ;8F88F2;
    dw $8000                                                             ;8F88F4;
    dw PLMEntries_upwardsExtension                                       ;8F88F6;
    db $0F,$09                                                           ;8F88F8;
    dw $8000                                                             ;8F88FA;
    dw PLMEntries_upwardsExtension                                       ;8F88FC;
    db $0F,$0A                                                           ;8F88FE;
    dw $8000                                                             ;8F8900;
    dw PLMEntries_upwardsExtension                                       ;8F8902;
    db $0F,$0B                                                           ;8F8904;
    dw $8000                                                             ;8F8906;
    dw PLMEntries_ScrollPLM                                              ;8F8908;
    db $0F,$0C                                                           ;8F890A;
    dw RoomPLM_AlphaPowerBomb_8                                          ;8F890C;
    dw PLMEntries_PowerBombTankChozoOrb                                  ;8F890E;
    db $14,$09                                                           ;8F8910;
    dw $0028                                                             ;8F8912;
    dw PLMEntries_MissileTank                                            ;8F8914;
    db $02,$08                                                           ;8F8916;
    dw $0029,$0000                                                       ;8F8918;

PLMPopulation_SkreeBoost:
    dw $0000                                                             ;8F891C;

PLMPopulation_BelowSpazer:
    dw PLMEntries_ScrollPLM                                              ;8F891E;
    db $10,$11                                                           ;8F8920;
    dw RoomPLM_BelowSpazer_0_8_A                                         ;8F8922;
    dw PLMEntries_rightwardsExtension                                    ;8F8924;
    db $11,$11                                                           ;8F8926;
    dw $8000                                                             ;8F8928;
    dw PLMEntries_rightwardsExtension                                    ;8F892A;
    db $12,$11                                                           ;8F892C;
    dw $8000                                                             ;8F892E;
    dw PLMEntries_rightwardsExtension                                    ;8F8930;
    db $13,$11                                                           ;8F8932;
    dw $8000                                                             ;8F8934;
    dw PLMEntries_ScrollPLM                                              ;8F8936;
    db $10,$14                                                           ;8F8938;
    dw RoomPLM_BelowSpazer_4_9_B                                         ;8F893A;
    dw PLMEntries_rightwardsExtension                                    ;8F893C;
    db $11,$14                                                           ;8F893E;
    dw $8000                                                             ;8F8940;
    dw PLMEntries_rightwardsExtension                                    ;8F8942;
    db $12,$14                                                           ;8F8944;
    dw $8000                                                             ;8F8946;
    dw PLMEntries_rightwardsExtension                                    ;8F8948;
    db $13,$14                                                           ;8F894A;
    dw $8000                                                             ;8F894C;
    dw PLMEntries_ScrollPLM                                              ;8F894E;
    db $08,$11                                                           ;8F8950;
    dw RoomPLM_BelowSpazer_0_8_A                                         ;8F8952;
    dw PLMEntries_ScrollPLM                                              ;8F8954;
    db $08,$14                                                           ;8F8956;
    dw RoomPLM_BelowSpazer_4_9_B                                         ;8F8958;
    dw PLMEntries_ScrollPLM                                              ;8F895A;
    db $02,$11                                                           ;8F895C;
    dw RoomPLM_BelowSpazer_0_8_A                                         ;8F895E;
    dw PLMEntries_ScrollPLM                                              ;8F8960;
    db $02,$14                                                           ;8F8962;
    dw RoomPLM_BelowSpazer_4_9_B                                         ;8F8964;
    dw PLMEntries_greenDoorFacingLeft                                    ;8F8966;
    db $1E,$06                                                           ;8F8968;
    dw $003F,$0000                                                       ;8F896A;

PLMPopulation_Spazer:
    dw PLMEntries_SpazerChozoOrb                                         ;8F896E;
    db $0B,$09                                                           ;8F8970;
    dw $002A,$0000                                                       ;8F8972;

PLMPopulation_WarehouseZeela:
    dw PLMEntries_ScrollPLM                                              ;8F8976;
    db $02,$0B                                                           ;8F8978;
    dw RoomPLM_WarehouseZeela_0                                          ;8F897A;
    dw PLMEntries_ScrollPLM                                              ;8F897C;
    db $02,$19                                                           ;8F897E;
    dw RoomPLM_WarehouseZeela_1_3                                        ;8F8980;
    dw PLMEntries_ScrollPLM                                              ;8F8982;
    db $07,$19                                                           ;8F8984;
    dw RoomPLM_WarehouseZeela_2                                          ;8F8986;
    dw PLMEntries_ScrollPLM                                              ;8F8988;
    db $15,$19                                                           ;8F898A;
    dw RoomPLM_WarehouseZeela_1_3                                        ;8F898C;
    dw PLMEntries_greyDoorFacingRight                                    ;8F898E;
    db $01,$16                                                           ;8F8990;
    dw $0040,$0000                                                       ;8F8992;

PLMPopulation_WarehouseETank:
    dw PLMEntries_greyDoorFacingLeft                                     ;8F8996;
    db $0E,$06                                                           ;8F8998;
    dw $0C41                                                             ;8F899A;
    dw PLMEntries_EnergyTankShotBlock                                    ;8F899C;
    db $05,$04                                                           ;8F899E;
    dw $002B,$0000                                                       ;8F89A0;

PLMPopulation_WarehouseKihunter:
    dw PLMEntries_ScrollPLM                                              ;8F89A4;
    db $17,$0B                                                           ;8F89A6;
    dw RoomPLM_WarehouseKihunter_0                                       ;8F89A8;
    dw PLMEntries_ScrollPLM                                              ;8F89AA;
    db $17,$0E                                                           ;8F89AC;
    dw RoomPLM_WarehouseKihunter_1                                       ;8F89AE;
    dw PLMEntries_upwardsExtension                                       ;8F89B0;
    db $0B,$04                                                           ;8F89B2;
    dw $8000                                                             ;8F89B4;
    dw PLMEntries_upwardsExtension                                       ;8F89B6;
    db $0B,$05                                                           ;8F89B8;
    dw $8000                                                             ;8F89BA;
    dw PLMEntries_upwardsExtension                                       ;8F89BC;
    db $0B,$06                                                           ;8F89BE;
    dw $8000                                                             ;8F89C0;
    dw PLMEntries_upwardsExtension                                       ;8F89C2;
    db $0B,$07                                                           ;8F89C4;
    dw $8000                                                             ;8F89C6;
    dw PLMEntries_upwardsExtension                                       ;8F89C8;
    db $0B,$08                                                           ;8F89CA;
    dw $8000                                                             ;8F89CC;
    dw PLMEntries_upwardsExtension                                       ;8F89CE;
    db $0B,$09                                                           ;8F89D0;
    dw $8000                                                             ;8F89D2;
    dw PLMEntries_upwardsExtension                                       ;8F89D4;
    db $0B,$0A                                                           ;8F89D6;
    dw $8000                                                             ;8F89D8;
    dw PLMEntries_ScrollPLM                                              ;8F89DA;
    db $0B,$0B                                                           ;8F89DC;
    dw RoomPLM_WarehouseKihunter_9                                       ;8F89DE;
    dw PLMEntries_ScrollPLM                                              ;8F89E0;
    db $27,$0C                                                           ;8F89E2;
    dw RoomPLM_WarehouseKihunter_A_B                                     ;8F89E4;
    dw PLMEntries_ScrollPLM                                              ;8F89E6;
    db $2E,$0C                                                           ;8F89E8;
    dw RoomPLM_WarehouseKihunter_A_B                                     ;8F89EA;
    dw PLMEntries_MissileTankShotBlock                                   ;8F89EC;
    db $2E,$08                                                           ;8F89EE;
    dw $002C,$0000                                                       ;8F89F0;

PLMPopulation_MiniKraid_State0_1:
    dw PLMEntries_greyDoorFacingLeft                                     ;8F89F4;
    db $5E,$06                                                           ;8F89F6;
    dw $0C42                                                             ;8F89F8;
    dw PLMEntries_greyDoorFacingRight                                    ;8F89FA;
    db $01,$06                                                           ;8F89FC;
    dw $0C43,$0000                                                       ;8F89FE;

PLMPopulation_KraidEyeDoor:
    dw PLMEntries_ScrollPLM                                              ;8F8A02;
    db $03,$12                                                           ;8F8A04;
    dw RoomPLM_KraidEyeDoor_0                                            ;8F8A06;
    dw PLMEntries_rightwardsExtension                                    ;8F8A08;
    db $04,$12                                                           ;8F8A0A;
    dw $8000                                                             ;8F8A0C;
    dw PLMEntries_rightwardsExtension                                    ;8F8A0E;
    db $05,$12                                                           ;8F8A10;
    dw $8000                                                             ;8F8A12;
    dw PLMEntries_greenDoorFacingLeft                                    ;8F8A14;
    db $0E,$06                                                           ;8F8A16;
    dw $0044                                                             ;8F8A18;
    dw PLMEntries_EyeDoorFacingLeft                                      ;8F8A1A;
    db $1E,$16                                                           ;8F8A1C;
    dw $0045                                                             ;8F8A1E;
    dw PLMEntries_EyeDoorBottomFacingLeft                                ;8F8A20;
    db $1E,$19                                                           ;8F8A22;
    dw $0045                                                             ;8F8A24;
    dw PLMEntries_EyeDoorEyeFacingLeft                                   ;8F8A26;
    db $1E,$17                                                           ;8F8A28;
    dw $0045,$0000                                                       ;8F8A2A;

PLMPopulation_Kraid_State0_1:
    dw PLMEntries_greyDoorFacingLeft                                     ;8F8A2E;
    db $1E,$16                                                           ;8F8A30;
    dw $0046                                                             ;8F8A32;
    dw PLMEntries_greyDoorFacingRight                                    ;8F8A34;
    db $01,$16                                                           ;8F8A36;
    dw $0047,$0000                                                       ;8F8A38;

PLMPopulation_StatuesHallway:
    dw $0000                                                             ;8F8A3C;

PLMPopulation_RedTowerRefill:
    dw PLMEntries_energyStation                                          ;8F8A3E;
    db $04,$0A                                                           ;8F8A40;
    dw $002D,$0000                                                       ;8F8A42;

PLMPopulation_KraidRefill:
    dw PLMEntries_missileStation                                         ;8F8A46;
    db $09,$0A                                                           ;8F8A48;
    dw $002E                                                             ;8F8A4A;
    dw PLMEntries_energyStation                                          ;8F8A4C;
    db $07,$0A                                                           ;8F8A4E;
    dw $002F,$0000                                                       ;8F8A50;

PLMPopulation_Statues:
    dw PLMEntries_greyDoorFacingRight                                    ;8F8A54;
    db $01,$06                                                           ;8F8A56;
    dw $9448,$0000                                                       ;8F8A58;

PLMPopulation_WarehouseEntrance:
    dw PLMEntries_ScrollPLM                                              ;8F8A5C;
    db $07,$0C                                                           ;8F8A5E;
    dw RoomPLM_WarehouseEntrance_0                                       ;8F8A60;
    dw PLMEntries_rightwardsExtension                                    ;8F8A62;
    db $08,$0C                                                           ;8F8A64;
    dw $8000                                                             ;8F8A66;
    dw PLMEntries_ScrollPLM                                              ;8F8A68;
    db $10,$09                                                           ;8F8A6A;
    dw RoomPLM_WarehouseEntrance_2                                       ;8F8A6C;
    dw PLMEntries_upwardsExtension                                       ;8F8A6E;
    db $10,$08                                                           ;8F8A70;
    dw $8000                                                             ;8F8A72;
    dw PLMEntries_upwardsExtension                                       ;8F8A74;
    db $10,$07                                                           ;8F8A76;
    dw $8000                                                             ;8F8A78;
    dw PLMEntries_ScrollPLM                                              ;8F8A7A;
    db $12,$09                                                           ;8F8A7C;
    dw RoomPLM_WarehouseEntrance_5                                       ;8F8A7E;
    dw PLMEntries_upwardsExtension                                       ;8F8A80;
    db $12,$08                                                           ;8F8A82;
    dw $8000                                                             ;8F8A84;
    dw PLMEntries_upwardsExtension                                       ;8F8A86;
    db $12,$07                                                           ;8F8A88;
    dw $8000                                                             ;8F8A8A;
    dw PLMEntries_upwardsExtension                                       ;8F8A8C;
    db $12,$06                                                           ;8F8A8E;
    dw $8000                                                             ;8F8A90;
    dw PLMEntries_ScrollPLM                                              ;8F8A92;
    db $13,$0B                                                           ;8F8A94;
    dw RoomPLM_WarehouseEntrance_9                                       ;8F8A96;
    dw PLMEntries_rightwardsExtension                                    ;8F8A98;
    db $14,$0B                                                           ;8F8A9A;
    dw $8000                                                             ;8F8A9C;
    dw PLMEntries_upwardsExtension                                       ;8F8A9E;
    db $14,$0A                                                           ;8F8AA0;
    dw $8000                                                             ;8F8AA2;
    dw PLMEntries_upwardsExtension                                       ;8F8AA4;
    db $14,$09                                                           ;8F8AA6;
    dw $8000                                                             ;8F8AA8;
    dw PLMEntries_upwardsExtension                                       ;8F8AAA;
    db $14,$08                                                           ;8F8AAC;
    dw $8000                                                             ;8F8AAE;
    dw PLMEntries_upwardsExtension                                       ;8F8AB0;
    db $14,$07                                                           ;8F8AB2;
    dw $8000                                                             ;8F8AB4;
    dw PLMEntries_upwardsExtension                                       ;8F8AB6;
    db $14,$06                                                           ;8F8AB8;
    dw $8000                                                             ;8F8ABA;
    dw PLMEntries_upwardsExtension                                       ;8F8ABC;
    db $14,$05                                                           ;8F8ABE;
    dw $8000                                                             ;8F8AC0;
    dw PLMEntries_upwardsExtension                                       ;8F8AC2;
    db $14,$04                                                           ;8F8AC4;
    dw $8000,$0000                                                       ;8F8AC6;

PLMPopulation_VariaSuit:
    dw PLMEntries_VariaSuitChozoOrb                                      ;8F8ACA;
    db $07,$09                                                           ;8F8ACC;
    dw $0030,$0000                                                       ;8F8ACE;

PLMPopulation_WarehouseSave:
    dw PLMEntries_saveStation                                            ;8F8AD2;
    db $07,$0B                                                           ;8F8AD4;
    dw $0003,$0000                                                       ;8F8AD6;

PLMPopulation_RedBrinstarSave:
    dw PLMEntries_saveStation                                            ;8F8ADA;
    db $07,$0B                                                           ;8F8ADC;
    dw $0004,$0000                                                       ;8F8ADE;

PLMPopulation_IceBeamAcid:
    dw $0000                                                             ;8F8AE2;

PLMPopulation_Cathedral:
    dw PLMEntries_MissileTankShotBlock                                   ;8F8AE4;
    db $22,$1C                                                           ;8F8AE6;
    dw $0031                                                             ;8F8AE8;
    dw PLMEntries_greenDoorFacingLeft                                    ;8F8AEA;
    db $2E,$16                                                           ;8F8AEC;
    dw $0049,$0000                                                       ;8F8AEE;

PLMPopulation_CathedralEntrance:
    dw PLMEntries_redDoorFacingLeft                                      ;8F8AF2;
    db $2E,$06                                                           ;8F8AF4;
    dw $004A,$0000                                                       ;8F8AF6;

PLMPopulation_BusinessCenter:
    dw PLMEntries_elevatorPlatform                                       ;8F8AFA;
    db $06,$2C                                                           ;8F8AFC;
    dw $8000                                                             ;8F8AFE;
    dw PLMEntries_greenDoorFacingRight                                   ;8F8B00;
    db $01,$36                                                           ;8F8B02;
    dw $004B                                                             ;8F8B04;
    dw PLMEntries_yellowDoorFacingRIght                                  ;8F8B06;
    db $01,$46                                                           ;8F8B08;
    dw $004C                                                             ;8F8B0A;
    dw PLMEntries_redDoorFacingRight                                     ;8F8B0C;
    db $01,$56                                                           ;8F8B0E;
    dw $004D,$0000                                                       ;8F8B10;

PLMPopulation_IceBeamGate:
    dw PLMEntries_ScrollPLM                                              ;8F8B14;
    db $37,$2D                                                           ;8F8B16;
    dw RoomPLM_IceBeamGate_0                                             ;8F8B18;
    dw PLMEntries_rightwardsExtension                                    ;8F8B1A;
    db $38,$2D                                                           ;8F8B1C;
    dw $8000,$0000                                                       ;8F8B1E;

PLMPopulation_IceBeamTutorial:
    dw $0000                                                             ;8F8B22;

PLMPopulation_IceBeam:
    dw PLMEntries_IceBeamChozoOrb                                        ;8F8B24;
    db $0C,$07                                                           ;8F8B26;
    dw $0032,$0000                                                       ;8F8B28;

PLMPopulation_IceBeamSnake:
    dw PLMEntries_ScrollPLM                                              ;8F8B2C;
    db $0F,$17                                                           ;8F8B2E;
    dw RoomPLM_IceBeamSnake_0                                            ;8F8B30;
    dw PLMEntries_ScrollPLM                                              ;8F8B32;
    db $0D,$17                                                           ;8F8B34;
    dw RoomPLM_IceBeamSnake_1                                            ;8F8B36;
    dw PLMEntries_ScrollPLM                                              ;8F8B38;
    db $11,$17                                                           ;8F8B3A;
    dw RoomPLM_IceBeamSnake_2                                            ;8F8B3C;
    dw PLMEntries_ScrollPLM                                              ;8F8B3E;
    db $13,$17                                                           ;8F8B40;
    dw RoomPLM_IceBeamSnake_3                                            ;8F8B42;
    dw $0000                                                             ;8F8B44;

PLMPopulation_CrumbleShaft:
    dw PLMEntries_MissileTankShotBlock                                   ;8F8B46;
    db $01,$08                                                           ;8F8B48;
    dw $0033,$0000                                                       ;8F8B4A;

PLMPopulation_CrocomireSpeedway:
    dw PLMEntries_ScrollPLM                                              ;8F8B4E;
    db $9E,$28                                                           ;8F8B50;
    dw RoomPLM_CrocomireSpeedway_0                                       ;8F8B52;
    dw PLMEntries_upwardsExtension                                       ;8F8B54;
    db $9E,$27                                                           ;8F8B56;
    dw $8000                                                             ;8F8B58;
    dw PLMEntries_upwardsExtension                                       ;8F8B5A;
    db $9E,$26                                                           ;8F8B5C;
    dw $8000                                                             ;8F8B5E;
    dw PLMEntries_upwardsExtension                                       ;8F8B60;
    db $9E,$25                                                           ;8F8B62;
    dw $8000                                                             ;8F8B64;
    dw PLMEntries_upwardsExtension                                       ;8F8B66;
    db $9E,$24                                                           ;8F8B68;
    dw $8000                                                             ;8F8B6A;
    dw PLMEntries_ScrollPLM                                              ;8F8B6C;
    db $BE,$29                                                           ;8F8B6E;
    dw RoomPLM_CrocomireSpeedway_5                                       ;8F8B70;
    dw PLMEntries_upwardsExtension                                       ;8F8B72;
    db $BE,$28                                                           ;8F8B74;
    dw $8000                                                             ;8F8B76;
    dw PLMEntries_upwardsExtension                                       ;8F8B78;
    db $BE,$27                                                           ;8F8B7A;
    dw $8000                                                             ;8F8B7C;
    dw PLMEntries_ScrollPLM                                              ;8F8B7E;
    db $C2,$29                                                           ;8F8B80;
    dw RoomPLM_CrocomireSpeedway_8                                       ;8F8B82;
    dw PLMEntries_upwardsExtension                                       ;8F8B84;
    db $C2,$28                                                           ;8F8B86;
    dw $8000                                                             ;8F8B88;
    dw PLMEntries_upwardsExtension                                       ;8F8B8A;
    db $C2,$27                                                           ;8F8B8C;
    dw $8000                                                             ;8F8B8E;
    dw PLMEntries_upwardsExtension                                       ;8F8B90;
    db $C2,$26                                                           ;8F8B92;
    dw $8000                                                             ;8F8B94;
    dw PLMEntries_greenDoorFacingUp                                      ;8F8B96;
    db $C6,$2D                                                           ;8F8B98;
    dw $004E,$0000                                                       ;8F8B9A;

PLMPopulation_Crocomire_State0_1:
    dw PLMEntries_greyDoorFacingDown                                     ;8F8B9E;
    db $36,$02                                                           ;8F8BA0;
    dw $044F                                                             ;8F8BA2;
    dw PLMEntries_EnergyTank                                             ;8F8BA4;
    db $7D,$06                                                           ;8F8BA6;
    dw $0034,$0000                                                       ;8F8BA8;

PLMPopulation_HiJumpBoots:
    dw PLMEntries_HiJumpBootsChozoOrb                                    ;8F8BAC;
    db $03,$0A                                                           ;8F8BAE;
    dw $0035,$0000                                                       ;8F8BB0;

PLMPopulation_CrocomireEscape:
    dw PLMEntries_downwardsClosedGate                                    ;8F8BB4;
    db $06,$05                                                           ;8F8BB6;
    dw $8000                                                             ;8F8BB8;
    dw PLMEntries_downwardsGateShotblock                                 ;8F8BBA;
    db $06,$05                                                           ;8F8BBC;
    dw $000A                                                             ;8F8BBE;
    dw PLMEntries_MissileTank                                            ;8F8BC0;
    db $0D,$09                                                           ;8F8BC2;
    dw $0036,$0000                                                       ;8F8BC4;

PLMPopulation_HiJumpETank:
    dw PLMEntries_ScrollPLM                                              ;8F8BC8;
    db $10,$0C                                                           ;8F8BCA;
    dw RoomPLM_HiJumpETank_0                                             ;8F8BCC;
    dw PLMEntries_ScrollPLM                                              ;8F8BCE;
    db $0F,$05                                                           ;8F8BD0;
    dw RoomPLM_HiJumpETank_1                                             ;8F8BD2;
    dw PLMEntries_ScrollPLM                                              ;8F8BD4;
    db $08,$1C                                                           ;8F8BD6;
    dw RoomPLM_HiJumpETank_2                                             ;8F8BD8;
    dw PLMEntries_ScrollPLM                                              ;8F8BDA;
    db $0B,$12                                                           ;8F8BDC;
    dw RoomPLM_HiJumpETank_3                                             ;8F8BDE;
    dw PLMEntries_greyDoorFacingLeft                                     ;8F8BE0;
    db $1E,$06                                                           ;8F8BE2;
    dw $0C50                                                             ;8F8BE4;
    dw PLMEntries_MissileTank                                            ;8F8BE6;
    db $09,$06                                                           ;8F8BE8;
    dw $0037                                                             ;8F8BEA;
    dw PLMEntries_EnergyTank                                             ;8F8BEC;
    db $17,$08                                                           ;8F8BEE;
    dw $0038,$0000                                                       ;8F8BF0;

PLMPopulation_PostCrocFarming:
    dw PLMEntries_redDoorFacingRight                                     ;8F8BF4;
    db $01,$06                                                           ;8F8BF6;
    dw $0051,$0000                                                       ;8F8BF8;

PLMPopulation_PostCrocSave:
    dw PLMEntries_saveStation                                            ;8F8BFC;
    db $07,$0B                                                           ;8F8BFE;
    dw $0000,$0000                                                       ;8F8C00;

PLMPopulation_PostCrocPowerBombs:
    dw PLMEntries_PowerBombTank                                          ;8F8C04;
    db $07,$08                                                           ;8F8C06;
    dw $0039,$0000                                                       ;8F8C08;

PLMPopulation_PostCrocShaft:
    dw PLMEntries_redDoorFacingLeft                                      ;8F8C0C;
    db $0E,$36                                                           ;8F8C0E;
    dw $0052,$0000                                                       ;8F8C10;

PLMPopulation_PostCrocMissile:
    dw PLMEntries_MissileTank                                            ;8F8C14;
    db $3C,$09                                                           ;8F8C16;
    dw $003A,$0000                                                       ;8F8C18;

PLMPopulation_GrappleTutorial3:
    dw PLMEntries_downwardsClosedGate                                    ;8F8C1C;
    db $2A,$05                                                           ;8F8C1E;
    dw $8000                                                             ;8F8C20;
    dw PLMEntries_downwardsGateShotblock                                 ;8F8C22;
    db $2A,$05                                                           ;8F8C24;
    dw $0008,$0000                                                       ;8F8C26;

PLMPopulation_PostCrocJump:
    dw PLMEntries_MissileTank                                            ;8F8C2A;
    db $43,$09                                                           ;8F8C2C;
    dw $003B,$0000                                                       ;8F8C2E;

PLMPopulation_GrappleTutorial2:
    dw $0000                                                             ;8F8C32;

PLMPopulation_GrappleTutorial1:
    dw $0000                                                             ;8F8C34;

PLMPopulation_GrappleBeam:
    dw PLMEntries_GrappleBeamChozoOrb                                    ;8F8C36;
    db $04,$27                                                           ;8F8C38;
    dw $003C,$0000                                                       ;8F8C3A;

PLMPopulation_NorfairReserveTank:
    dw PLMEntries_ReserveTankChozoOrb                                    ;8F8C3E;
    db $02,$07                                                           ;8F8C40;
    dw $003D                                                             ;8F8C42;
    dw PLMEntries_MissileTankShotBlock                                   ;8F8C44;
    db $07,$0B                                                           ;8F8C46;
    dw $003E,$0000                                                       ;8F8C48;

PLMPopulation_GreenBubblesMissiles:
    dw PLMEntries_ScrollPLM                                              ;8F8C4C;
    db $10,$05                                                           ;8F8C4E;
    dw RoomPLM_GreenBubblesMissiles_0                                    ;8F8C50;
    dw PLMEntries_MissileTank                                            ;8F8C52;
    db $14,$0A                                                           ;8F8C54;
    dw $003F,$0000                                                       ;8F8C56;

PLMPopulation_BubbleMountain:
    dw PLMEntries_greenDoorFacingRight                                   ;8F8C5A;
    db $01,$06                                                           ;8F8C5C;
    dw $0053                                                             ;8F8C5E;
    dw PLMEntries_greenDoorFacingLeft                                    ;8F8C60;
    db $1E,$06                                                           ;8F8C62;
    dw $0054                                                             ;8F8C64;
    dw PLMEntries_MissileTank                                            ;8F8C66;
    db $14,$3C                                                           ;8F8C68;
    dw $0040,$0000                                                       ;8F8C6A;

PLMPopulation_SpeedBoosterHall:
    dw PLMEntries_SpeedBoosterEscape                                     ;8F8C6E;
    db $00,$00                                                           ;8F8C70;
    dw $8000                                                             ;8F8C72;
    dw PLMEntries_MissileTankShotBlock                                   ;8F8C74;
    db $BC,$13                                                           ;8F8C76;
    dw $0041                                                             ;8F8C78;
    dw PLMEntries_redDoorFacingLeft                                      ;8F8C7A;
    db $BE,$16                                                           ;8F8C7C;
    dw $0055,$0000                                                       ;8F8C7E;

PLMPopulation_SpeedBooster:
    dw PLMEntries_SpeedBoosterChozoOrb                                   ;8F8C82;
    db $0B,$06                                                           ;8F8C84;
    dw $0042,$0000                                                       ;8F8C86;

PLMPopulation_SingleChamber:
    dw PLMEntries_ScrollPLM                                              ;8F8C8A;
    db $0D,$08                                                           ;8F8C8C;
    dw RoomPLM_SingleChamber_0                                           ;8F8C8E;
    dw PLMEntries_ScrollPLM                                              ;8F8C90;
    db $10,$08                                                           ;8F8C92;
    dw RoomPLM_SingleChamber_1_4                                         ;8F8C94;
    dw PLMEntries_upwardsExtension                                       ;8F8C96;
    db $4D,$0A                                                           ;8F8C98;
    dw $8000                                                             ;8F8C9A;
    dw PLMEntries_upwardsExtension                                       ;8F8C9C;
    db $4D,$0B                                                           ;8F8C9E;
    dw $8000                                                             ;8F8CA0;
    dw PLMEntries_ScrollPLM                                              ;8F8CA2;
    db $4D,$0C                                                           ;8F8CA4;
    dw RoomPLM_SingleChamber_1_4                                         ;8F8CA6;
    dw PLMEntries_redDoorFacingLeft                                      ;8F8CA8;
    db $0E,$16                                                           ;8F8CAA;
    dw $0056,$0000                                                       ;8F8CAC;

PLMPopulation_DoubleChamber:
    dw PLMEntries_downwardsClosedGate                                    ;8F8CB0;
    db $1A,$05                                                           ;8F8CB2;
    dw $8000                                                             ;8F8CB4;
    dw PLMEntries_downwardsGateShotblock                                 ;8F8CB6;
    db $1A,$05                                                           ;8F8CB8;
    dw $0000                                                             ;8F8CBA;
    dw PLMEntries_MissileTank                                            ;8F8CBC;
    db $1F,$09                                                           ;8F8CBE;
    dw $0043                                                             ;8F8CC0;
    dw PLMEntries_redDoorFacingLeft                                      ;8F8CC2;
    db $3E,$06                                                           ;8F8CC4;
    dw $0057,$0000                                                       ;8F8CC6;

PLMPopulation_WaveBeam:
    dw PLMEntries_WaveBeamChozoOrb                                       ;8F8CCA;
    db $0B,$06                                                           ;8F8CCC;
    dw $0044,$0000                                                       ;8F8CCE;

PLMPopulation_SpikyPlatformsTunnel:
    dw $0000                                                             ;8F8CD2;

PLMPopulation_Volcano:
    dw PLMEntries_ScrollPLM                                              ;8F8CD4;
    db $20,$29                                                           ;8F8CD6;
    dw RoomPLM_Volcano_0                                                 ;8F8CD8;
    dw PLMEntries_ScrollPLM                                              ;8F8CDA;
    db $1F,$29                                                           ;8F8CDC;
    dw RoomPLM_Volcano_1                                                 ;8F8CDE;
    dw PLMEntries_upwardsExtension                                       ;8F8CE0;
    db $19,$24                                                           ;8F8CE2;
    dw $8000                                                             ;8F8CE4;
    dw PLMEntries_upwardsExtension                                       ;8F8CE6;
    db $19,$25                                                           ;8F8CE8;
    dw $8000                                                             ;8F8CEA;
    dw PLMEntries_upwardsExtension                                       ;8F8CEC;
    db $19,$26                                                           ;8F8CEE;
    dw $8000                                                             ;8F8CF0;
    dw PLMEntries_upwardsExtension                                       ;8F8CF2;
    db $19,$27                                                           ;8F8CF4;
    dw $8000                                                             ;8F8CF6;
    dw PLMEntries_upwardsExtension                                       ;8F8CF8;
    db $19,$28                                                           ;8F8CFA;
    dw $8000                                                             ;8F8CFC;
    dw PLMEntries_ScrollPLM                                              ;8F8CFE;
    db $19,$29                                                           ;8F8D00;
    dw RoomPLM_Volcano_7                                                 ;8F8D02;
    dw PLMEntries_upwardsExtension                                       ;8F8D04;
    db $26,$26                                                           ;8F8D06;
    dw $8000                                                             ;8F8D08;
    dw PLMEntries_upwardsExtension                                       ;8F8D0A;
    db $26,$27                                                           ;8F8D0C;
    dw $8000                                                             ;8F8D0E;
    dw PLMEntries_upwardsExtension                                       ;8F8D10;
    db $26,$28                                                           ;8F8D12;
    dw $8000                                                             ;8F8D14;
    dw PLMEntries_ScrollPLM                                              ;8F8D16;
    db $26,$29                                                           ;8F8D18;
    dw RoomPLM_Volcano_B                                                 ;8F8D1A;
    dw $0000                                                             ;8F8D1C;

PLMPopulation_KronicBoost:
    dw PLMEntries_ScrollPLM                                              ;8F8D1E;
    db $0F,$17                                                           ;8F8D20;
    dw RoomPLM_KronicBoost_0                                             ;8F8D22;
    dw PLMEntries_ScrollPLM                                              ;8F8D24;
    db $11,$17                                                           ;8F8D26;
    dw RoomPLM_KronicBoost_1                                             ;8F8D28;
    dw PLMEntries_upwardsExtension                                       ;8F8D2A;
    db $08,$15                                                           ;8F8D2C;
    dw $8000                                                             ;8F8D2E;
    dw PLMEntries_upwardsExtension                                       ;8F8D30;
    db $08,$16                                                           ;8F8D32;
    dw $8000                                                             ;8F8D34;
    dw PLMEntries_upwardsExtension                                       ;8F8D36;
    db $08,$17                                                           ;8F8D38;
    dw $8000                                                             ;8F8D3A;
    dw PLMEntries_ScrollPLM                                              ;8F8D3C;
    db $08,$18                                                           ;8F8D3E;
    dw RoomPLM_KronicBoost_5                                             ;8F8D40;
    dw PLMEntries_downwardsClosedGate                                    ;8F8D42;
    db $07,$14                                                           ;8F8D44;
    dw $8000                                                             ;8F8D46;
    dw PLMEntries_downwardsGateShotblock                                 ;8F8D48;
    db $07,$14                                                           ;8F8D4A;
    dw $0000                                                             ;8F8D4C;
    dw PLMEntries_yellowDoorFacingRIght                                  ;8F8D4E;
    db $11,$26                                                           ;8F8D50;
    dw $0058,$0000                                                       ;8F8D52;

PLMPopulation_MagdolliteTunnel:
    dw $0000                                                             ;8F8D56;

PLMPopulation_PurpleShaft:
    dw PLMEntries_ScrollPLM                                              ;8F8D58;
    db $02,$0B                                                           ;8F8D5A;
    dw RoomPLM_PurpleShaft_0_3                                           ;8F8D5C;
    dw PLMEntries_rightwardsExtension                                    ;8F8D5E;
    db $03,$0B                                                           ;8F8D60;
    dw $8000                                                             ;8F8D62;
    dw PLMEntries_rightwardsExtension                                    ;8F8D64;
    db $04,$0B                                                           ;8F8D66;
    dw $8000                                                             ;8F8D68;
    dw PLMEntries_ScrollPLM                                              ;8F8D6A;
    db $0B,$0B                                                           ;8F8D6C;
    dw RoomPLM_PurpleShaft_0_3                                           ;8F8D6E;
    dw PLMEntries_rightwardsExtension                                    ;8F8D70;
    db $0C,$0B                                                           ;8F8D72;
    dw $8000                                                             ;8F8D74;
    dw PLMEntries_rightwardsExtension                                    ;8F8D76;
    db $0D,$0B                                                           ;8F8D78;
    dw $8000,$0000                                                       ;8F8D7A;

PLMPopulation_LavaDive:
    dw $0000                                                             ;8F8D7E;

PLMPopulation_LowerNorfairElev:
    dw PLMEntries_ScrollPLM                                              ;8F8D80;
    db $08,$0B                                                           ;8F8D82;
    dw RoomPLM_LowerNorfairElev_0                                        ;8F8D84;
    dw $0000                                                             ;8F8D86;

PLMPopulation_UpperNorfairFarming:
    dw PLMEntries_downwardsClosedGate                                    ;8F8D88;
    db $06,$15                                                           ;8F8D8A;
    dw $8000                                                             ;8F8D8C;
    dw PLMEntries_downwardsGateShotblock                                 ;8F8D8E;
    db $06,$15                                                           ;8F8D90;
    dw $0000,$0000                                                       ;8F8D92;

PLMPopulation_RisingTide:
    dw $0000                                                             ;8F8D96;

PLMPopulation_AcidSnakesTunnel:
    dw $0000                                                             ;8F8D98;

PLMPopulation_SpikyAcidSnakesTunnel:
    dw $0000                                                             ;8F8D9A;

PLMPopulation_UpperNorfairRefill:
    dw PLMEntries_energyStation                                          ;8F8D9C;
    db $07,$0A                                                           ;8F8D9E;
    dw $0045,$0000                                                       ;8F8DA0;

PLMPopulation_PurpleFarming:
    dw $0000                                                             ;8F8DA4;

PLMPopulation_BatCave:
    dw PLMEntries_ScrollPLM                                              ;8F8DA6;
    db $09,$0C                                                           ;8F8DA8;
    dw RoomPLM_BatCave_0                                                 ;8F8DAA;
    dw PLMEntries_rightwardsExtension                                    ;8F8DAC;
    db $0A,$0C                                                           ;8F8DAE;
    dw $8000                                                             ;8F8DB0;
    dw PLMEntries_ScrollPLM                                              ;8F8DB2;
    db $09,$10                                                           ;8F8DB4;
    dw RoomPLM_BatCave_2                                                 ;8F8DB6;
    dw PLMEntries_rightwardsExtension                                    ;8F8DB8;
    db $0A,$10                                                           ;8F8DBA;
    dw $8000                                                             ;8F8DBC;
    dw PLMEntries_ScrollPLM                                              ;8F8DBE;
    db $06,$13                                                           ;8F8DC0;
    dw RoomPLM_BatCave_4                                                 ;8F8DC2;
    dw PLMEntries_rightwardsExtension                                    ;8F8DC4;
    db $07,$13                                                           ;8F8DC6;
    dw $8000                                                             ;8F8DC8;
    dw PLMEntries_rightwardsExtension                                    ;8F8DCA;
    db $08,$13                                                           ;8F8DCC;
    dw $8000                                                             ;8F8DCE;
    dw PLMEntries_rightwardsExtension                                    ;8F8DD0;
    db $09,$13                                                           ;8F8DD2;
    dw $8000,$0000                                                       ;8F8DD4;

PLMPopulation_NorfairMap:
    dw PLMEntries_mapStation                                             ;8F8DD8;
    db $05,$0A                                                           ;8F8DDA;
    dw $8000,$0000                                                       ;8F8DDC;

PLMPopulation_BubbleMountainSave:
    dw PLMEntries_saveStation                                            ;8F8DE0;
    db $05,$0B                                                           ;8F8DE2;
    dw $0001,$0000                                                       ;8F8DE4;

PLMPopulation_FrogSpeedway:
    dw $0000                                                             ;8F8DE8;

PLMPopulation_RedPirateShaft:
    dw $0000                                                             ;8F8DEA;

PLMPopulation_FrogSave:
    dw PLMEntries_saveStation                                            ;8F8DEC;
    db $07,$0B                                                           ;8F8DEE;
    dw $0002,$0000                                                       ;8F8DF0;

PLMPopulation_CrocomireSave:
    dw PLMEntries_saveStation                                            ;8F8DF4;
    db $07,$0B                                                           ;8F8DF6;
    dw $0003,$0000                                                       ;8F8DF8;

PLMPopulation_LNElevSave:
    dw PLMEntries_saveStation                                            ;8F8DFC;
    db $05,$0B                                                           ;8F8DFE;
    dw $0004,$0000                                                       ;8F8E00;

PLMPopulation_AcidStatue:
    dw PLMEntries_ScrollPLM                                              ;8F8E04;
    db $0C,$1E                                                           ;8F8E06;
    dw RoomPLM_AcidStatue_0                                              ;8F8E08;
    dw PLMEntries_ScrollPLM                                              ;8F8E0A;
    db $0C,$23                                                           ;8F8E0C;
    dw RoomPLM_AcidStatue_1                                              ;8F8E0E;
    dw $0000                                                             ;8F8E10;

PLMPopulation_MainHall:
    dw PLMEntries_ScrollPLM                                              ;8F8E12;
    db $47,$08                                                           ;8F8E14;
    dw RoomPLM_MainHall_0_2                                              ;8F8E16;
    dw PLMEntries_rightwardsExtension                                    ;8F8E18;
    db $48,$08                                                           ;8F8E1A;
    dw $8000                                                             ;8F8E1C;
    dw PLMEntries_ScrollPLM                                              ;8F8E1E;
    db $47,$23                                                           ;8F8E20;
    dw RoomPLM_MainHall_0_2                                              ;8F8E22;
    dw PLMEntries_rightwardsExtension                                    ;8F8E24;
    db $48,$23                                                           ;8F8E26;
    dw $8000                                                             ;8F8E28;
    dw PLMEntries_ScrollPLM                                              ;8F8E2A;
    db $47,$29                                                           ;8F8E2C;
    dw RoomPLM_MainHall_4                                                ;8F8E2E;
    dw PLMEntries_rightwardsExtension                                    ;8F8E30;
    db $48,$29                                                           ;8F8E32;
    dw $8000                                                             ;8F8E34;
    dw PLMEntries_elevatorPlatform                                       ;8F8E36;
    db $46,$2A                                                           ;8F8E38;
    dw $8000,$0000                                                       ;8F8E3A;

PLMPopulation_GoldenTorizo_State0_1:
    dw PLMEntries_ScrollPLM                                              ;8F8E3E;
    db $04,$0C                                                           ;8F8E40;
    dw RoomPLM_GoldenTorizo_0                                            ;8F8E42;
    dw PLMEntries_rightwardsExtension                                    ;8F8E44;
    db $05,$0C                                                           ;8F8E46;
    dw $8000                                                             ;8F8E48;
    dw PLMEntries_rightwardsExtension                                    ;8F8E4A;
    db $06,$0C                                                           ;8F8E4C;
    dw $8000                                                             ;8F8E4E;
    dw PLMEntries_rightwardsExtension                                    ;8F8E50;
    db $07,$0C                                                           ;8F8E52;
    dw $8000                                                             ;8F8E54;
    dw PLMEntries_rightwardsExtension                                    ;8F8E56;
    db $08,$0C                                                           ;8F8E58;
    dw $8000                                                             ;8F8E5A;
    dw PLMEntries_rightwardsExtension                                    ;8F8E5C;
    db $09,$0C                                                           ;8F8E5E;
    dw $8000                                                             ;8F8E60;
    dw PLMEntries_rightwardsExtension                                    ;8F8E62;
    db $0A,$0C                                                           ;8F8E64;
    dw $8000                                                             ;8F8E66;
    dw PLMEntries_rightwardsExtension                                    ;8F8E68;
    db $0B,$0C                                                           ;8F8E6A;
    dw $8000                                                             ;8F8E6C;
    dw PLMEntries_MissileTank                                            ;8F8E6E;
    db $0D,$08                                                           ;8F8E70;
    dw $0046                                                             ;8F8E72;
    dw PLMEntries_SuperMissileTankShotBlock                              ;8F8E74;
    db $15,$08                                                           ;8F8E76;
    dw $0047                                                             ;8F8E78;
    dw PLMEntries_greyDoorFacingLeft                                     ;8F8E7A;
    db $1E,$16                                                           ;8F8E7C;
    dw $0859,$0000                                                       ;8F8E7E;

PLMPopulation_FastRipper:
    dw PLMEntries_downwardsClosedGate                                    ;8F8E82;
    db $34,$05                                                           ;8F8E84;
    dw $8000                                                             ;8F8E86;
    dw PLMEntries_downwardsGateShotblock                                 ;8F8E88;
    db $34,$05                                                           ;8F8E8A;
    dw $0008,$0000                                                       ;8F8E8C;

PLMPopulation_GTEnergyRefill:
    dw PLMEntries_energyStation                                          ;8F8E90;
    db $08,$0A                                                           ;8F8E92;
    dw $0048,$0000                                                       ;8F8E94;

PLMPopulation_Ridley_State0_1:
    dw PLMEntries_greyDoorFacingLeft                                     ;8F8E98;
    db $0E,$06                                                           ;8F8E9A;
    dw $005A                                                             ;8F8E9C;
    dw PLMEntries_greyDoorFacingRight                                    ;8F8E9E;
    db $01,$16                                                           ;8F8EA0;
    dw $005B,$0000                                                       ;8F8EA2;

PLMPopulation_LNFarming:
    dw PLMEntries_EyeDoorFacingRIght                                     ;8F8EA6;
    db $01,$06                                                           ;8F8EA8;
    dw $005C                                                             ;8F8EAA;
    dw PLMEntries_EyeDoorBottomFacingRight                               ;8F8EAC;
    db $01,$09                                                           ;8F8EAE;
    dw $005C                                                             ;8F8EB0;
    dw PLMEntries_EyeDoorEyeFacingRight                                  ;8F8EB2;
    db $01,$07                                                           ;8F8EB4;
    dw $005C,$0000                                                       ;8F8EB6;

PLMPopulation_FastPillarsSetup:
    dw PLMEntries_ScrollPLM                                              ;8F8EBA;
    db $07,$21                                                           ;8F8EBC;
    dw RoomPLM_FastPillarsSetup_0                                        ;8F8EBE;
    dw PLMEntries_rightwardsExtension                                    ;8F8EC0;
    db $08,$21                                                           ;8F8EC2;
    dw $8000                                                             ;8F8EC4;
    dw PLMEntries_ScrollPLM                                              ;8F8EC6;
    db $07,$1B                                                           ;8F8EC8;
    dw RoomPLM_FastPillarsSetup_2                                        ;8F8ECA;
    dw PLMEntries_rightwardsExtension                                    ;8F8ECC;
    db $08,$1B                                                           ;8F8ECE;
    dw $8000,$0000                                                       ;8F8ED0;

UNUSED_PLMPopulation_8FB3EE:
    dw $0000                                                             ;8F8ED4;

PLMPopulation_MickeyMouse:
    dw PLMEntries_ScrollPLM                                              ;8F8ED6;
    db $30,$16                                                           ;8F8ED8;
    dw RoomPLM_MickeyMouse_0                                             ;8F8EDA;
    dw PLMEntries_ScrollPLM                                              ;8F8EDC;
    db $32,$16                                                           ;8F8EDE;
    dw RoomPLM_MickeyMouse_1                                             ;8F8EE0;
    dw PLMEntries_ScrollPLM                                              ;8F8EE2;
    db $2D,$16                                                           ;8F8EE4;
    dw RoomPLM_MickeyMouse_2                                             ;8F8EE6;
    dw PLMEntries_upwardsExtension                                       ;8F8EE8;
    db $2B,$14                                                           ;8F8EEA;
    dw $8000                                                             ;8F8EEC;
    dw PLMEntries_upwardsExtension                                       ;8F8EEE;
    db $2B,$15                                                           ;8F8EF0;
    dw $8000                                                             ;8F8EF2;
    dw PLMEntries_upwardsExtension                                       ;8F8EF4;
    db $2B,$16                                                           ;8F8EF6;
    dw $8000                                                             ;8F8EF8;
    dw PLMEntries_ScrollPLM                                              ;8F8EFA;
    db $2B,$17                                                           ;8F8EFC;
    dw RoomPLM_MickeyMouse_6                                             ;8F8EFE;
    dw PLMEntries_upwardsExtension                                       ;8F8F00;
    db $38,$36                                                           ;8F8F02;
    dw $8000                                                             ;8F8F04;
    dw PLMEntries_upwardsExtension                                       ;8F8F06;
    db $38,$37                                                           ;8F8F08;
    dw $8000                                                             ;8F8F0A;
    dw PLMEntries_upwardsExtension                                       ;8F8F0C;
    db $38,$38                                                           ;8F8F0E;
    dw $8000                                                             ;8F8F10;
    dw PLMEntries_ScrollPLM                                              ;8F8F12;
    db $38,$39                                                           ;8F8F14;
    dw RoomPLM_MickeyMouse_A                                             ;8F8F16;
    dw PLMEntries_rightwardsExtension                                    ;8F8F18;
    db $3D,$34                                                           ;8F8F1A;
    dw $8000                                                             ;8F8F1C;
    dw PLMEntries_rightwardsExtension                                    ;8F8F1E;
    db $3C,$34                                                           ;8F8F20;
    dw $8000                                                             ;8F8F22;
    dw PLMEntries_ScrollPLM                                              ;8F8F24;
    db $3B,$34                                                           ;8F8F26;
    dw RoomPLM_MickeyMouse_D                                             ;8F8F28;
    dw PLMEntries_greyDoorFacingRight                                    ;8F8F2A;
    db $01,$36                                                           ;8F8F2C;
    dw $0C5D                                                             ;8F8F2E;
    dw PLMEntries_MissileTank                                            ;8F8F30;
    db $27,$1B                                                           ;8F8F32;
    dw $0049,$0000                                                       ;8F8F34;

PLMPopulation_Pillar:
    dw $0000                                                             ;8F8F38;

PLMPopulation_Plowerhouse:
    dw $0000                                                             ;8F8F3A;

PLMPopulation_WorstRoomInTheGame:
    dw PLMEntries_ScrollPLM                                              ;8F8F3C;
    db $03,$10                                                           ;8F8F3E;
    dw RoomPLM_WorstRoomInTheGame_0                                      ;8F8F40;
    dw PLMEntries_rightwardsExtension                                    ;8F8F42;
    db $04,$10                                                           ;8F8F44;
    dw $8000                                                             ;8F8F46;
    dw PLMEntries_rightwardsExtension                                    ;8F8F48;
    db $05,$10                                                           ;8F8F4A;
    dw $8000                                                             ;8F8F4C;
    dw PLMEntries_rightwardsExtension                                    ;8F8F4E;
    db $06,$10                                                           ;8F8F50;
    dw $8000                                                             ;8F8F52;
    dw PLMEntries_rightwardsExtension                                    ;8F8F54;
    db $07,$10                                                           ;8F8F56;
    dw $8000                                                             ;8F8F58;
    dw PLMEntries_rightwardsExtension                                    ;8F8F5A;
    db $08,$10                                                           ;8F8F5C;
    dw $8000                                                             ;8F8F5E;
    dw PLMEntries_rightwardsExtension                                    ;8F8F60;
    db $09,$10                                                           ;8F8F62;
    dw $8000                                                             ;8F8F64;
    dw PLMEntries_rightwardsExtension                                    ;8F8F66;
    db $0A,$10                                                           ;8F8F68;
    dw $8000                                                             ;8F8F6A;
    dw PLMEntries_rightwardsExtension                                    ;8F8F6C;
    db $0B,$10                                                           ;8F8F6E;
    dw $8000                                                             ;8F8F70;
    dw PLMEntries_rightwardsExtension                                    ;8F8F72;
    db $0C,$10                                                           ;8F8F74;
    dw $8000,$0000                                                       ;8F8F76;

PLMPopulation_Amphitheatre:
    dw $0000                                                             ;8F8F7A;

PLMPopulation_LNSpringBallMaze:
    dw PLMEntries_ScrollPLM                                              ;8F8F7C;
    db $0C,$09                                                           ;8F8F7E;
    dw RoomPLM_LNSpringBallMaze_0                                        ;8F8F80;
    dw PLMEntries_upwardsExtension                                       ;8F8F82;
    db $0C,$08                                                           ;8F8F84;
    dw $8000                                                             ;8F8F86;
    dw PLMEntries_upwardsExtension                                       ;8F8F88;
    db $0C,$07                                                           ;8F8F8A;
    dw $8000                                                             ;8F8F8C;
    dw PLMEntries_upwardsExtension                                       ;8F8F8E;
    db $0C,$06                                                           ;8F8F90;
    dw $8000                                                             ;8F8F92;
    dw PLMEntries_ScrollPLM                                              ;8F8F94;
    db $03,$12                                                           ;8F8F96;
    dw RoomPLM_LNSpringBallMaze_4                                        ;8F8F98;
    dw PLMEntries_rightwardsExtension                                    ;8F8F9A;
    db $04,$12                                                           ;8F8F9C;
    dw $8000                                                             ;8F8F9E;
    dw PLMEntries_rightwardsExtension                                    ;8F8FA0;
    db $05,$12                                                           ;8F8FA2;
    dw $8000                                                             ;8F8FA4;
    dw PLMEntries_rightwardsExtension                                    ;8F8FA6;
    db $06,$12                                                           ;8F8FA8;
    dw $8000                                                             ;8F8FAA;
    dw PLMEntries_rightwardsExtension                                    ;8F8FAC;
    db $07,$12                                                           ;8F8FAE;
    dw $8000                                                             ;8F8FB0;
    dw PLMEntries_rightwardsExtension                                    ;8F8FB2;
    db $08,$12                                                           ;8F8FB4;
    dw $8000                                                             ;8F8FB6;
    dw PLMEntries_rightwardsExtension                                    ;8F8FB8;
    db $09,$12                                                           ;8F8FBA;
    dw $8000                                                             ;8F8FBC;
    dw PLMEntries_rightwardsExtension                                    ;8F8FBE;
    db $0A,$12                                                           ;8F8FC0;
    dw $8000                                                             ;8F8FC2;
    dw PLMEntries_ScrollPLM                                              ;8F8FC4;
    db $2F,$03                                                           ;8F8FC6;
    dw RoomPLM_LNSpringBallMaze_C                                        ;8F8FC8;
    dw PLMEntries_MissileTank                                            ;8F8FCA;
    db $2B,$07                                                           ;8F8FCC;
    dw $004A,$0000                                                       ;8F8FCE;

PLMPopulation_LNEscapePowerBombs:
    dw PLMEntries_PowerBombTank                                          ;8F8FD2;
    dw $080C,$004B,$0000                                                 ;8F8FD4;

PLMPopulation_RedKihunterShaft:
    dw PLMEntries_ScrollPLM                                              ;8F8FDA;
    db $11,$48                                                           ;8F8FDC;
    dw RoomPLM_RedKihunterShaft_0_4                                      ;8F8FDE;
    dw PLMEntries_rightwardsExtension                                    ;8F8FE0;
    dw $4609,$8000                                                       ;8F8FE2;
    dw PLMEntries_upwardsExtension                                       ;8F8FE6;
    dw $4608,$8000                                                       ;8F8FE8;
    dw PLMEntries_ScrollPLM                                              ;8F8FEC;
    dw $4708                                                             ;8F8FEE;
    dw RoomPLM_RedKihunterShaft_3_5                                      ;8F8FF0;
    dw PLMEntries_ScrollPLM                                              ;8F8FF2;
    dw $481F                                                             ;8F8FF4;
    dw RoomPLM_RedKihunterShaft_0_4                                      ;8F8FF6;
    dw PLMEntries_ScrollPLM                                              ;8F8FF8;
    dw $4824                                                             ;8F8FFA;
    dw RoomPLM_RedKihunterShaft_3_5                                      ;8F8FFC;
    dw PLMEntries_ScrollPLM                                              ;8F8FFE;
    dw $0E06                                                             ;8F9000;
    dw RoomPLM_RedKihunterShaft_6                                        ;8F9002;
    dw PLMEntries_rightwardsExtension                                    ;8F9004;
    dw $0E07,$8000                                                       ;8F9006;
    dw PLMEntries_rightwardsExtension                                    ;8F900A;
    dw $0E08,$8000                                                       ;8F900C;
    dw PLMEntries_rightwardsExtension                                    ;8F9010;
    dw $0E09,$8000                                                       ;8F9012;
    dw PLMEntries_ScrollPLM                                              ;8F9016;
    dw $0B06                                                             ;8F9018;
    dw RoomPLM_RedKihunterShaft_A                                        ;8F901A;
    dw PLMEntries_rightwardsExtension                                    ;8F901C;
    dw $0B07,$8000                                                       ;8F901E;
    dw PLMEntries_rightwardsExtension                                    ;8F9022;
    dw $0B08,$8000                                                       ;8F9024;
    dw PLMEntries_rightwardsExtension                                    ;8F9028;
    dw $0B09,$8000                                                       ;8F902A;
    dw PLMEntries_yellowDoorFacingUp                                     ;8F902E;
    dw $4D26,$005E,$0000                                                 ;8F9030;

PLMPopulation_Wasteland:
    dw PLMEntries_ScrollPLM                                              ;8F9036;
    db $17,$0D                                                           ;8F9038;
    dw RoomPLM_Wasteland_0                                               ;8F903A;
    dw PLMEntries_rightwardsExtension                                    ;8F903C;
    db $18,$0D                                                           ;8F903E;
    dw $8000                                                             ;8F9040;
    dw PLMEntries_ScrollPLM                                              ;8F9042;
    db $15,$08                                                           ;8F9044;
    dw RoomPLM_Wasteland_2                                               ;8F9046;
    dw PLMEntries_rightwardsExtension                                    ;8F9048;
    db $16,$08                                                           ;8F904A;
    dw $8000                                                             ;8F904C;
    dw PLMEntries_rightwardsExtension                                    ;8F904E;
    db $17,$08                                                           ;8F9050;
    dw $8000                                                             ;8F9052;
    dw PLMEntries_rightwardsExtension                                    ;8F9054;
    db $18,$08                                                           ;8F9056;
    dw $8000                                                             ;8F9058;
    dw PLMEntries_rightwardsExtension                                    ;8F905A;
    db $19,$08                                                           ;8F905C;
    dw $8000                                                             ;8F905E;
    dw PLMEntries_rightwardsExtension                                    ;8F9060;
    db $1A,$08                                                           ;8F9062;
    dw $8000                                                             ;8F9064;
    dw PLMEntries_ScrollPLM                                              ;8F9066;
    db $4F,$09                                                           ;8F9068;
    dw RoomPLM_Wasteland_8_C                                             ;8F906A;
    dw PLMEntries_ScrollPLM                                              ;8F906C;
    db $51,$09                                                           ;8F906E;
    dw RoomPLM_Wasteland_9_B                                             ;8F9070;
    dw PLMEntries_ScrollPLM                                              ;8F9072;
    db $0F,$0B                                                           ;8F9074;
    dw RoomPLM_Wasteland_A                                               ;8F9076;
    dw PLMEntries_ScrollPLM                                              ;8F9078;
    db $3C,$09                                                           ;8F907A;
    dw RoomPLM_Wasteland_9_B                                             ;8F907C;
    dw PLMEntries_ScrollPLM                                              ;8F907E;
    db $3F,$09                                                           ;8F9080;
    dw RoomPLM_Wasteland_8_C                                             ;8F9082;
    dw PLMEntries_ScrollPLM                                              ;8F9084;
    db $14,$07                                                           ;8F9086;
    dw RoomPLM_Wasteland_D                                               ;8F9088;
    dw PLMEntries_upwardsExtension                                       ;8F908A;
    db $14,$06                                                           ;8F908C;
    dw $8000                                                             ;8F908E;
    dw PLMEntries_upwardsExtension                                       ;8F9090;
    db $14,$05                                                           ;8F9092;
    dw $8000                                                             ;8F9094;
    dw PLMEntries_upwardsExtension                                       ;8F9096;
    db $14,$04                                                           ;8F9098;
    dw $8000                                                             ;8F909A;
    dw PLMEntries_ScrollPLM                                              ;8F909C;
    db $09,$09                                                           ;8F909E;
    dw RoomPLM_Wasteland_11                                              ;8F90A0;
    dw PLMEntries_upwardsExtension                                       ;8F90A2;
    db $09,$08                                                           ;8F90A4;
    dw $8000                                                             ;8F90A6;
    dw PLMEntries_upwardsExtension                                       ;8F90A8;
    db $09,$07                                                           ;8F90AA;
    dw $8000                                                             ;8F90AC;
    dw PLMEntries_upwardsExtension                                       ;8F90AE;
    db $09,$06                                                           ;8F90B0;
    dw $8000                                                             ;8F90B2;
    dw PLMEntries_upwardsExtension                                       ;8F90B4;
    db $09,$05                                                           ;8F90B6;
    dw $8000                                                             ;8F90B8;
    dw PLMEntries_greenDoorFacingRight                                   ;8F90BA;
    db $11,$26                                                           ;8F90BC;
    dw $005F                                                             ;8F90BE;
    dw PLMEntries_PowerBombTank                                          ;8F90C0;
    db $07,$08                                                           ;8F90C2;
    dw $004C,$0000                                                       ;8F90C4;

PLMPopulation_MetalPirates:
    dw PLMEntries_greyDoorFacingRight                                    ;8F90C8;
    db $01,$06                                                           ;8F90CA;
    dw $0C60,$0000                                                       ;8F90CC;

PLMPopulation_ThreeMusketeers:
    dw PLMEntries_ScrollPLM                                              ;8F90D0;
    db $0B,$2A                                                           ;8F90D2;
    dw RoomPLM_ThreeMusketeers_0                                         ;8F90D4;
    dw PLMEntries_upwardsExtension                                       ;8F90D6;
    db $0B,$29                                                           ;8F90D8;
    dw $8000                                                             ;8F90DA;
    dw PLMEntries_upwardsExtension                                       ;8F90DC;
    db $0B,$28                                                           ;8F90DE;
    dw $8000                                                             ;8F90E0;
    dw PLMEntries_upwardsExtension                                       ;8F90E2;
    db $0B,$27                                                           ;8F90E4;
    dw $8000                                                             ;8F90E6;
    dw PLMEntries_upwardsExtension                                       ;8F90E8;
    db $0B,$26                                                           ;8F90EA;
    dw $8000                                                             ;8F90EC;
    dw PLMEntries_upwardsExtension                                       ;8F90EE;
    db $0B,$25                                                           ;8F90F0;
    dw $8000                                                             ;8F90F2;
    dw PLMEntries_ScrollPLM                                              ;8F90F4;
    db $0F,$2A                                                           ;8F90F6;
    dw RoomPLM_ThreeMusketeers_6                                         ;8F90F8;
    dw PLMEntries_ScrollPLM                                              ;8F90FA;
    db $14,$2A                                                           ;8F90FC;
    dw RoomPLM_ThreeMusketeers_7                                         ;8F90FE;
    dw PLMEntries_MissileTank                                            ;8F9100;
    db $08,$29                                                           ;8F9102;
    dw $004D,$0000                                                       ;8F9104;

PLMPopulation_RidleyETank:
    dw PLMEntries_EnergyTankShotBlock                                    ;8F9108;
    db $0E,$0B                                                           ;8F910A;
    dw $004E,$0000                                                       ;8F910C;

PLMPopulation_ScrewAttack:
    dw PLMEntries_ScrewAttackChozoOrb                                    ;8F9110;
    db $0B,$28                                                           ;8F9112;
    dw $004F,$0000                                                       ;8F9114;

PLMPopulation_LNFireflea:
    dw PLMEntries_upwardsExtension                                       ;8F9118;
    db $1F,$36                                                           ;8F911A;
    dw $8000                                                             ;8F911C;
    dw PLMEntries_upwardsExtension                                       ;8F911E;
    db $1F,$37                                                           ;8F9120;
    dw $8000                                                             ;8F9122;
    dw PLMEntries_ScrollPLM                                              ;8F9124;
    db $1F,$38                                                           ;8F9126;
    dw RoomPLM_LNFireflea_2                                              ;8F9128;
    dw PLMEntries_rightwardsExtension                                    ;8F912A;
    db $2D,$39                                                           ;8F912C;
    dw $8000                                                             ;8F912E;
    dw PLMEntries_rightwardsExtension                                    ;8F9130;
    db $2C,$39                                                           ;8F9132;
    dw $8000                                                             ;8F9134;
    dw PLMEntries_ScrollPLM                                              ;8F9136;
    db $2B,$39                                                           ;8F9138;
    dw RoomPLM_LNFireflea_5                                              ;8F913A;
    dw PLMEntries_upwardsExtension                                       ;8F913C;
    db $0F,$06                                                           ;8F913E;
    dw $8000                                                             ;8F9140;
    dw PLMEntries_upwardsExtension                                       ;8F9142;
    db $0F,$07                                                           ;8F9144;
    dw $8000                                                             ;8F9146;
    dw PLMEntries_upwardsExtension                                       ;8F9148;
    db $0F,$08                                                           ;8F914A;
    dw $8000                                                             ;8F914C;
    dw PLMEntries_ScrollPLM                                              ;8F914E;
    db $0F,$09                                                           ;8F9150;
    dw RoomPLM_LNFireflea_9                                              ;8F9152;
    dw PLMEntries_rightwardsExtension                                    ;8F9154;
    db $1B,$0B                                                           ;8F9156;
    dw $8000                                                             ;8F9158;
    dw PLMEntries_rightwardsExtension                                    ;8F915A;
    db $1A,$0B                                                           ;8F915C;
    dw $8000                                                             ;8F915E;
    dw PLMEntries_rightwardsExtension                                    ;8F9160;
    db $19,$0B                                                           ;8F9162;
    dw $8000                                                             ;8F9164;
    dw PLMEntries_rightwardsExtension                                    ;8F9166;
    db $18,$0B                                                           ;8F9168;
    dw $8000                                                             ;8F916A;
    dw PLMEntries_rightwardsExtension                                    ;8F916C;
    db $17,$0B                                                           ;8F916E;
    dw $8000                                                             ;8F9170;
    dw PLMEntries_rightwardsExtension                                    ;8F9172;
    db $16,$0B                                                           ;8F9174;
    dw $8000                                                             ;8F9176;
    dw PLMEntries_rightwardsExtension                                    ;8F9178;
    db $15,$0B                                                           ;8F917A;
    dw $8000                                                             ;8F917C;
    dw PLMEntries_ScrollPLM                                              ;8F917E;
    db $14,$0B                                                           ;8F9180;
    dw RoomPLM_LNFireflea_11                                             ;8F9182;
    dw PLMEntries_EnergyTank                                             ;8F9184;
    db $2A,$51                                                           ;8F9186;
    dw $0050,$0000                                                       ;8F9188;

PLMPopulation_LNSave:
    dw PLMEntries_saveStation                                            ;8F918C;
    db $07,$0B                                                           ;8F918E;
    dw $0005,$0000                                                       ;8F9190;

SetupASM_ClearBlocksAfterSavingAnimalsAndShakeScreen:
    JSL.L Spawn_Hardcoded_PLM                                            ;8F9194;
    db $3D,$0B                                                           ;8F9198;
    dw PLMEntries_ClearCrateriaMainstreetEscapePassageIfCrittersEsc      ;8F919A;
    LDA.W #$0018                                                         ;8F919C;
    STA.W $183E                                                          ;8F919F;
    LDA.W #$FFFF                                                         ;8F91A2;
    STA.W $1840                                                          ;8F91A5;
    RTS                                                                  ;8F91A8;


SetupASM_AutoDestroyWallDuringEscape:
    JSL.L Spawn_Hardcoded_PLM                                            ;8F91A9;
    db $10,$87                                                           ;8F91AD;
    dw PLMEntries_MakeOldTourianEscapeShaftFakeWallExplode               ;8F91AF;
    RTS                                                                  ;8F91B1;


SetupASM_TurnWallIntoShotBlocksDuringEscape:
    JSL.L Spawn_Hardcoded_PLM                                            ;8F91B2;
    db $0F,$0A                                                           ;8F91B6;
    dw PLMEntries_CrittersEscapeBlock                                    ;8F91B8;
    RTS                                                                  ;8F91BA;


RTS_8F91BB:
    RTS                                                                  ;8F91BB;


RTS_8F91BC:
    RTS                                                                  ;8F91BC;


SetupASM_ShakeScreenAndCall88A7D8DuringEscape:
    LDA.W #$0006                                                         ;8F91BD;
    STA.W $183E                                                          ;8F91C0;
    LDA.W #$FFFF                                                         ;8F91C3;
    STA.W $1840                                                          ;8F91C6;

SetupASM_ScrollingSkyLand:
    JSL.L FXType_20_ScrollingSky_RoomSetupASM_ScrollingSkyLand           ;8F91C9;
    RTS                                                                  ;8F91CD;


SetupASM_ScrollingSkyOcean:
    JSL.L RoomSetupASM_ScrollingSkyOcean                                 ;8F91CE;

RTS_8F91D2:
    RTS                                                                  ;8F91D2;


RTS_8F91D3:
    RTS                                                                  ;8F91D3;


RTS_8F91D4:
    RTS                                                                  ;8F91D4;


RTS_8F91D5:
    RTS                                                                  ;8F91D5;


RTS_8F91D6:
    RTS                                                                  ;8F91D6;


SetupASM_RunStatueUnlockingAnimations:
    LDY.W #AnimatedTilesObject_TourianStatueKraid                        ;8F91D7;
    JSL.L Spawn_AnimatedTilesObject                                      ;8F91DA;
    LDY.W #AnimatedTilesObject_TourianStatuePhantoon                     ;8F91DE;
    JSL.L Spawn_AnimatedTilesObject                                      ;8F91E1;
    LDY.W #AnimatedTilesObject_TourianStatueDraygon                      ;8F91E5;
    JSL.L Spawn_AnimatedTilesObject                                      ;8F91E8;
    LDY.W #AnimatedTilesObject_TourianStatueRidley                       ;8F91EC;
    JSL.L Spawn_AnimatedTilesObject                                      ;8F91EF;
    RTS                                                                  ;8F91F3;


RTS_8F91F4:
    RTS                                                                  ;8F91F4;


RTS_8F91F5:
    RTS                                                                  ;8F91F5;


RTS_8F91F6:
    RTS                                                                  ;8F91F6;


RTS_8F91F7:
    RTS                                                                  ;8F91F7;


RoomHeader_LandingSite:
    db $00,$00,$17,$00,$09,$05,$70,$A0,$00                               ;8F91F8;
    dw RoomDoors_LandingSite                                             ;8F9201;
    dw RoomStateCheck_EventHasBeenSet                                    ;8F9203;
    db $0E                                                               ;8F9205;
    dw RoomState_LandingSite_3                                           ;8F9206;
    dw RoomStateCheck_PowerBombs                                         ;8F9208;
    dw RoomState_LandingSite_2                                           ;8F920A;
    dw RoomStateCheck_EventHasBeenSet                                    ;8F920C;
    db $00                                                               ;8F920E;
    dw RoomState_LandingSite_1                                           ;8F920F;
    dw Use_StatePointer_inX                                              ;8F9211;

RoomState_LandingSite_0:
    dl LevelData_LandingSite                                             ;8F9213;
    db $00,$06,$05                                                       ;8F9216;
    dw FXHeader_LandingSite_State0_1                                     ;8F9219;
    dw EnemyPopulations_LandingSite_0_1_2                                ;8F921B;
    dw EnemySets_LandingSite_0_1_2                                       ;8F921D;
    dw $0181,$9283,$0000                                                 ;8F921F;
    dw MainASM_ScrollingSkyLand                                          ;8F9225;
    dw PLMPopulation_LandingSite_State0_1_2                              ;8F9227;
    dw LibBG_ScrollingSky_Tilemaps_LandingSite                           ;8F9229;
    dw SetupASM_ScrollingSkyLand                                         ;8F922B;

RoomState_LandingSite_1:
    dl LevelData_LandingSite                                             ;8F922D;
    db $00,$06,$06                                                       ;8F9230;
    dw FXHeader_LandingSite_State0_1                                     ;8F9233;
    dw EnemyPopulations_LandingSite_0_1_2                                ;8F9235;
    dw EnemySets_LandingSite_0_1_2                                       ;8F9237;
    dw $0181,$9283,$0000                                                 ;8F9239;
    dw MainASM_ScrollingSkyLand                                          ;8F923F;
    dw PLMPopulation_LandingSite_State0_1_2                              ;8F9241;
    dw LibBG_ScrollingSky_Tilemaps_LandingSite                           ;8F9243;
    dw SetupASM_ScrollingSkyLand                                         ;8F9245;

RoomState_LandingSite_2:
    dl LevelData_LandingSite                                             ;8F9247;
    db $00,$0C,$05                                                       ;8F924A;
    dw FXHeader_LandingSite_State2                                       ;8F924D;
    dw EnemyPopulations_LandingSite_0_1_2                                ;8F924F;
    dw EnemySets_LandingSite_0_1_2                                       ;8F9251;
    dw $0181,$9283,$0000                                                 ;8F9253;
    dw MainASM_ScrollingSkyLand                                          ;8F9259;
    dw PLMPopulation_LandingSite_State0_1_2                              ;8F925B;
    dw LibBG_ScrollingSky_Tilemaps_LandingSite                           ;8F925D;
    dw SetupASM_ScrollingSkyLand                                         ;8F925F;

RoomState_LandingSite_3:
    dl LevelData_LandingSite                                             ;8F9261;
    db $00,$00,$00                                                       ;8F9264;
    dw FXHeader_LandingSite_State3                                       ;8F9267;
    dw EnemyPopulations_LandingSite_3                                    ;8F9269;
    dw EnemySets_LandingSite_3                                           ;8F926B;
    dw $0181,$9283,$0000                                                 ;8F926D;
    dw MainASM_ScrollingSkyLand_ZebesTimebombSet                         ;8F9273;
    dw PLMPopulation_LandingSite_State3                                  ;8F9275;
    dw LibBG_ScrollingSky_Tilemaps_LandingSite                           ;8F9277;
    dw SetupASM_ShakeScreenAndCall88A7D8DuringEscape                     ;8F9279;

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
    db $13,$01,$80                                                       ;8F92B0;

RoomHeader_GauntletEntrance:
    db $01,$00,$12,$02,$05,$01,$70,$A0,$00                               ;8F92B3;
    dw RoomDoors_GauntletEntrance                                        ;8F92BC;
    dw RoomStateCheck_EventHasBeenSet                                    ;8F92BE;
    db $00                                                               ;8F92C0;
    dw RoomState_GauntletEntrance_1                                      ;8F92C1;
    dw Use_StatePointer_inX                                              ;8F92C3;

RoomState_GauntletEntrance_0:
    dl LevelData_GauntletEntrance                                        ;8F92C5;
    db $00,$00,$00                                                       ;8F92C8;
    dw FXHeader_GauntletEntrance_State0_1                                ;8F92CB;
    dw EnemyPopulations_GauntletEntrance                                 ;8F92CD;
    dw EnemySets_GauntletEntrance                                        ;8F92CF;
    db $C1,$C1                                                           ;8F92D1;
    dw $0000                                                             ;8F92D3;
    dw $0000                                                             ;8F92D5;
    dw $0000                                                             ;8F92D7;
    dw PLMPopulation_GauntletEntrance_State0_1                           ;8F92D9;
    dw LibBG_Crateria_0_HorizontalPatternRocks                           ;8F92DB;
    dw RTS_8F91D3                                                        ;8F92DD;

RoomState_GauntletEntrance_1:
    dl LevelData_GauntletEntrance                                        ;8F92DF;
    db $00,$09,$05                                                       ;8F92E2;
    dw FXHeader_GauntletEntrance_State0_1                                ;8F92E5;
    dw EnemyPopulations_GauntletEntrance                                 ;8F92E7;
    dw EnemySets_GauntletEntrance                                        ;8F92E9;
    db $C1,$C1                                                           ;8F92EB;
    dw $0000                                                             ;8F92ED;
    dw $0000                                                             ;8F92EF;
    dw $0000                                                             ;8F92F1;
    dw PLMPopulation_GauntletEntrance_State0_1                           ;8F92F3;
    dw LibBG_Crateria_0_HorizontalPatternRocks                           ;8F92F5;
    dw RTS_8F91D3                                                        ;8F92F7;

RoomDoors_GauntletEntrance:
    dw Door_GauntletEntrance_0                                           ;8F92F9;
    dw Door_GauntletEntrance_1                                           ;8F92FB;

RoomHeader_Parlor:
    db $02,$00,$12,$04,$05,$05,$70,$A0,$00                               ;8F92FD;
    dw RoomDoors_Parlor                                                  ;8F9306;
    dw RoomStateCheck_EventHasBeenSet                                    ;8F9308;
    db $0E                                                               ;8F930A;
    dw RoomState_Parlor_2                                                ;8F930B;
    dw RoomStateCheck_EventHasBeenSet                                    ;8F930D;
    db $00                                                               ;8F930F;
    dw RoomState_Parlor_1                                                ;8F9310;
    dw Use_StatePointer_inX                                              ;8F9312;

RoomState_Parlor_0:
    dl LevelData_Parlor                                                  ;8F9314;
    db $00,$00,$00                                                       ;8F9317;
    dw FXHeader_Parlor_State0                                            ;8F931A;
    dw EnemyPopulations_Parlor_0                                         ;8F931C;
    dw EnemySets_Parlor_0                                                ;8F931E;
    db $C1,$C1                                                           ;8F9320;
    dw RoomScrolls_Parlor                                                ;8F9322;
    dw $0000                                                             ;8F9324;
    dw $0000                                                             ;8F9326;
    dw PLMPopulation_Parlor_State0_1                                     ;8F9328;
    dw LibBG_Crateria_0_Rocks                                            ;8F932A;
    dw RTS_8F91D3                                                        ;8F932C;

RoomState_Parlor_1:
    dl LevelData_Parlor                                                  ;8F932E;
    db $00,$09,$05                                                       ;8F9331;
    dw FXHeader_Parlor_State1                                            ;8F9334;
    dw EnemyPopulations_Parlor_1                                         ;8F9336;
    dw EnemySets_Parlor_1                                                ;8F9338;
    db $C1,$C1                                                           ;8F933A;
    dw RoomScrolls_Parlor                                                ;8F933C;
    dw $0000                                                             ;8F933E;
    dw $0000                                                             ;8F9340;
    dw PLMPopulation_Parlor_State0_1                                     ;8F9342;
    dw LibBG_Crateria_0_Rocks                                            ;8F9344;
    dw RTS_8F91BC                                                        ;8F9346;

RoomState_Parlor_2:
    dl LevelData_Parlor                                                  ;8F9348;
    db $00,$00,$00                                                       ;8F934B;
    dw FXHeader_Parlor_State2                                            ;8F934E;
    dw EnemyPopulations_Parlor_2                                         ;8F9350;
    dw EnemySets_Parlor_2                                                ;8F9352;
    db $C1,$C1                                                           ;8F9354;
    dw RoomScrolls_Parlor                                                ;8F9356;
    dw $0000                                                             ;8F9358;
    dw MainASM_SetScreenShaking_GenerateRandomExplosions                 ;8F935A;
    dw PLMPopulation_Parlor_State2                                       ;8F935C;
    dw LibBG_Crateria_0_Rocks                                            ;8F935E;
    dw SetupASM_ClearBlocksAfterSavingAnimalsAndShakeScreen              ;8F9360;

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
    db $08,$02,$80                                                       ;8F9389;

RoomPLM_Parlor_1:
    db $08,$00,$80                                                       ;8F938C;

RoomPLM_Parlor_2:
    db $00,$00,$02,$00,$06,$02,$80                                       ;8F938F;

RoomPLM_Parlor_6:
    db $06,$00,$80                                                       ;8F9396;

RoomPLM_Parlor_A:
    db $00,$01,$80                                                       ;8F9399;

RoomPLM_Parlor_D:
    db $02,$01,$80                                                       ;8F939C;

RoomPLM_Parlor_13_14:
    db $04,$01,$80                                                       ;8F939F;

RoomPLM_Parlor_15:
    db $04,$00,$80                                                       ;8F93A2;

RoomPLM_Parlor_1A:
    db $04,$00,$08,$02,$80                                               ;8F93A5;

RoomHeader_CrateriaPowerBombs:
    db $03,$00,$20,$01,$02,$01,$70,$A0,$00                               ;8F93AA;
    dw RoomDoors_CrateriaPowerBombs                                      ;8F93B3;
    dw Use_StatePointer_inX                                              ;8F93B5;

RoomState_CrateriaPowerBombs:
    dl LevelData_CrateriaPowerBombs                                      ;8F93B7;
    db $00,$00,$00                                                       ;8F93BA;
    dw FXHeader_CrateriaPowerBombs                                       ;8F93BD;
    dw EnemyPopulations_CrateriaPowerBombs                               ;8F93BF;
    dw EnemySets_CrateriaPowerBombs                                      ;8F93C1;
    db $C1,$C1                                                           ;8F93C3;
    dw RoomScrolls_CrateriaPowerBomb                                     ;8F93C5;
    dw $0000                                                             ;8F93C7;
    dw MainASM_ScrollingSkyLand                                          ;8F93C9;
    dw PLMPopulation_CrateriaPowerBombs                                  ;8F93CB;
    dw LibBG_Crateria_0_Rocks                                            ;8F93CD;
    dw RTS_8F91D3                                                        ;8F93CF;

RoomDoors_CrateriaPowerBombs:
    dw Door_CrateriaPowerBombs_0                                         ;8F93D1;

RoomScrolls_CrateriaPowerBomb:
    db $01,$01                                                           ;8F93D3;

RoomHeader_CrateriaSave:
    db $04,$00,$12,$06,$01,$01,$70,$A0,$00                               ;8F93D5;
    dw RoomDoors_CrateriaSave                                            ;8F93DE;
    dw Use_StatePointer_inX                                              ;8F93E0;

RoomState_CrateriaSave:
    dl LevelData_SaveStation_RightSideDoor                               ;8F93E2;
    db $19,$09,$05                                                       ;8F93E5;
    dw FXHeader_CrateriaSave                                             ;8F93E8;
    dw EnemyPopulations_CrateriaSave                                     ;8F93EA;
    dw EnemySets_CrateriaSave                                            ;8F93EC;
    db $00,$00                                                           ;8F93EE;
    dw $0000                                                             ;8F93F0;
    dw $0000                                                             ;8F93F2;
    dw $0000                                                             ;8F93F4;
    dw PLMPopulation_CrateriaSave                                        ;8F93F6;
    dw $0000                                                             ;8F93F8;
    dw RTS_8F91D3                                                        ;8F93FA;

RoomDoors_CrateriaSave:
    dw Door_CrateriaSave_0                                               ;8F93FC;

RoomHeader_WestOcean:
    db $05,$00,$26,$00,$08,$06,$90,$A0,$00                               ;8F93FE;
    dw RoomDoors_WestOcean                                               ;8F9407;
    dw Use_StatePointer_inX                                              ;8F9409;

RoomState_WestOcean:
    dl LevelData_WestOcean                                               ;8F940B;
    db $00,$0C,$05                                                       ;8F940E;
    dw FXHeader_WestOcean                                                ;8F9411;
    dw EnemyPopulations_WestOcean                                        ;8F9413;
    dw EnemySets_WestOcean                                               ;8F9415;
    db $81,$01                                                           ;8F9417;
    dw RoomScrolls_WestOcean                                             ;8F9419;
    dw $0000                                                             ;8F941B;
    dw MainASM_ScrollingSkyOcean                                         ;8F941D;
    dw PLMPopulation_WestOcean                                           ;8F941F;
    dw LibBG_ScrollingSky_Tilemaps_WreckedShipEntrance                   ;8F9421;
    dw SetupASM_ScrollingSkyOcean                                        ;8F9423;

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

RoomHeader_BowlingAlleyPath:
    db $06,$00,$29,$02,$02,$01,$70,$A0,$00                               ;8F9461;
    dw RoomDoors_BowlingAlleyPath                                        ;8F946A;
    dw Use_StatePointer_inX                                              ;8F946C;

RoomState_BowlingAlleyPath:
    dl LevelData_BowlingAlleyPath                                        ;8F946E;
    db $00,$00,$00                                                       ;8F9471;
    dw FXHeader_BowlingAlleyPath                                         ;8F9474;
    dw EnemyPopulations_BowlingAlleyPath                                 ;8F9476;
    dw EnemySets_BowlingAlleyPath                                        ;8F9478;
    db $C1,$C1                                                           ;8F947A;
    dw $0000                                                             ;8F947C;
    dw $0000                                                             ;8F947E;
    dw $0000                                                             ;8F9480;
    dw PLMPopulation_BowlingAlleyPath                                    ;8F9482;
    dw LibBG_Crateria_0_HorizontalPatternRocks                           ;8F9484;
    dw RTS_8F91D3                                                        ;8F9486;

RoomDoors_BowlingAlleyPath:
    dw Door_BowlingAlleyPath_0                                           ;8F9488;
    dw Door_BowlingAlleyPath_1                                           ;8F948A;

RoomHeader_CrateriaKihunter:
    db $07,$00,$21,$04,$03,$03,$70,$A0,$00                               ;8F948C;
    dw RoomDoors_CrateriaKihunter                                        ;8F9495;
    dw Use_StatePointer_inX                                              ;8F9497;

RoomState_CrateriaKihunter:
    dl LevelData_CrateriaKihunter                                        ;8F9499;
    db $00,$00,$05                                                       ;8F949C;
    dw FXHeader_CrateriaKihunters                                        ;8F949F;
    dw EnemyPopulations_CrateriaKihunter                                 ;8F94A1;
    dw EnemySets_CrateriaKihunter                                        ;8F94A3;
    db $C1,$C1                                                           ;8F94A5;
    dw RoomScroll_CrateriaKihunter                                       ;8F94A7;
    dw $0000                                                             ;8F94A9;
    dw $0000                                                             ;8F94AB;
    dw PLMPopulation_CrateriaKihunter                                    ;8F94AD;
    dw LibBG_Crateria_0_Rocks                                            ;8F94AF;
    dw RTS_8F91D3                                                        ;8F94B1;

RoomDoors_CrateriaKihunter:
    dw Door_CrateriaKihunter_0                                           ;8F94B3;
    dw Door_CrateriaKihunter_1                                           ;8F94B5;
    dw Door_CrateriaKihunter_2                                           ;8F94B7;

RoomScroll_CrateriaKihunter:
    db $01,$01,$01,$00,$00,$00,$00,$02,$00                               ;8F94B9;

RoomPLM_CrateriaKihunter_0:
    db $01,$02,$04,$02,$80                                               ;8F94C2;

RoomPLM_CrateriaKihunter_2:
    db $01,$01,$04,$00,$80                                               ;8F94C7;

RoomHeader_ForgottenHighwayElev:
    db $08,$00,$34,$0A,$01,$01,$70,$A0,$00                               ;8F94CC;
    dw RoomDoors_ForgottenHighwayElev                                    ;8F94D5;
    dw Use_StatePointer_inX                                              ;8F94D7;

RoomState_ForgottenHighwayElev:
    dl LevelData_ForgottenHighwayElev                                    ;8F94D9;
    db $02,$09,$03                                                       ;8F94DC;
    dw FXHeader_ForgottenHighwayElev                                     ;8F94DF;
    dw EnemyPopulations_ForgottenHighwayElev                             ;8F94E1;
    dw EnemySets_ForgottenHighwayElev                                    ;8F94E3;
    db $C1,$C1                                                           ;8F94E5;
    dw RoomScrolls_ForgottenHighwayElev                                  ;8F94E7;
    dw $0000                                                             ;8F94E9;
    dw $0000                                                             ;8F94EB;
    dw PLMPopulation_ForgottenHighwayElev                                ;8F94ED;
    dw LibBG_Crateria_2_Elevator                                         ;8F94EF;
    dw RTS_8F91D3                                                        ;8F94F1;

RoomDoors_ForgottenHighwayElev:
    dw Door_ForgottenHighwayElev_0                                       ;8F94F3;
    dw Door_ForgottenHighwayElev_1                                       ;8F94F5;
    dw Door_VariousRooms_Elevator                                        ;8F94F7;

RoomScrolls_ForgottenHighwayElev:
    db $01                                                               ;8F94F9;

RoomPLM_ForgottenHighwayElev_0:
    db $00,$02,$80                                                       ;8F94FA;

RoomHeader_EastOcean:
    db $09,$00,$31,$00,$07,$06,$70,$A0,$00                               ;8F94FD;
    dw RoomDoors_EastOcean                                               ;8F9506;
    dw Use_StatePointer_inX                                              ;8F9508;

RoomState_EastOcean:
    dl LevelData_EastOcean                                               ;8F950A;
    db $00,$0C,$05                                                       ;8F950D;
    dw FXHeader_EastOcean                                                ;8F9510;
    dw EnemyPopulations_EastOcean                                        ;8F9512;
    dw EnemySets_EastOcean                                               ;8F9514;
    db $81,$01                                                           ;8F9516;
    dw RoomScrolls_EastOcean                                             ;8F9518;
    dw $0000                                                             ;8F951A;
    dw MainASM_ScrollingSkyOcean                                         ;8F951C;
    dw PLMPopulation_EastOcean                                           ;8F951E;
    dw LibBG_ScrollingSky_Tilemaps_EastOcean                             ;8F9520;
    dw SetupASM_ScrollingSkyOcean                                        ;8F9522;

RoomDoors_EastOcean:
    dw Door_EastOcean_0                                                  ;8F9524;
    dw Door_EastOcean_1                                                  ;8F9526;

RoomScrolls_EastOcean:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8F9528;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$02,$02,$02,$02   ;8F9538;
    db $02,$02,$02,$01,$01,$01,$01,$01,$01,$01                           ;8F9548;

RoomHeader_ForgottenHighwayKagos:
    db $0A,$00,$38,$04,$01,$04,$70,$A0,$00                               ;8F9552;
    dw RoomDoors_ForgottenHighwayKagos                                   ;8F955B;
    dw Use_StatePointer_inX                                              ;8F955D;

RoomState_ForgottenHighwayKagos:
    dl LevelData_ForgottenHighwayKagos                                   ;8F955F;
    db $00,$00,$00                                                       ;8F9562;
    dw FXHeader_ForgottenHighwayKagos                                    ;8F9565;
    dw EnemyPopulations_ForgottenHighwayKagos                            ;8F9567;
    dw EnemySets_ForgottenHighwayKagos                                   ;8F9569;
    db $C1,$C1                                                           ;8F956B;
    dw $0001                                                             ;8F956D;
    dw $0000                                                             ;8F956F;
    dw $0000                                                             ;8F9571;
    dw PLMPopulation_ForgottenHighwayKagos                               ;8F9573;
    dw LibBG_Crateria_0_VerticalPatternRocks                             ;8F9575;
    dw RTS_8F91D3                                                        ;8F9577;

RoomDoors_ForgottenHighwayKagos:
    dw Door_ForgottenHighwayKagos_0                                      ;8F9579;
    dw Door_ForgottenHighwayKagos_1                                      ;8F957B;

RoomHeader_CrabMaze:
    db $0B,$00,$35,$08,$04,$02,$90,$A0,$00                               ;8F957D;
    dw RoomDoors_CrabMaze                                                ;8F9586;
    dw Use_StatePointer_inX                                              ;8F9588;

RoomState_CrabMaze:
    dl LevelData_CrabMaze                                                ;8F958A;
    db $00,$00,$00                                                       ;8F958D;
    dw FXHeader_CrabMaze                                                 ;8F9590;
    dw EnemyPopulations_CrabMaze                                         ;8F9592;
    dw EnemySets_CrabMaze                                                ;8F9594;
    db $C1,$C1                                                           ;8F9596;
    dw $0001                                                             ;8F9598;
    dw $0000                                                             ;8F959A;
    dw $0000                                                             ;8F959C;
    dw PLMPopulation_CrabMaze                                            ;8F959E;
    dw LibBG_Crateria_0_Rocks                                            ;8F95A0;
    dw RTS_8F91D3                                                        ;8F95A2;

RoomDoors_CrabMaze:
    dw Door_CrabMaze_0                                                   ;8F95A4;
    dw Door_CrabMaze_1                                                   ;8F95A6;

RoomHeader_ForgottenHighwayElbow:
    db $0C,$00,$34,$09,$01,$01,$70,$A0,$00                               ;8F95A8;
    dw RoomDoors_ForgottenHighwayElbow                                   ;8F95B1;
    dw Use_StatePointer_inX                                              ;8F95B3;

RoomState_ForgottenHighwayElbow:
    dl LevelData_ForgottenHighwayElbow                                   ;8F95B5;
    db $00,$00,$05                                                       ;8F95B8;
    dw FXHeader_ForgottenHighwayElbow                                    ;8F95BB;
    dw EnemyPopulations_ForgottenHighwayElbow                            ;8F95BD;
    dw EnemySets_ForgottenHighwayElbow                                   ;8F95BF;
    db $C1,$C1                                                           ;8F95C1;
    dw RoomScrolls_ForgottenHighwayElbow                                 ;8F95C3;
    dw $0000                                                             ;8F95C5;
    dw $0000                                                             ;8F95C7;
    dw PLMPopulation_ForgottenHighwayElbow                               ;8F95C9;
    dw LibBG_Crateria_0_VerticalPatternRocks                             ;8F95CB;
    dw RTS_8F91D3                                                        ;8F95CD;

RoomDoors_ForgottenHighwayElbow:
    dw Door_ForgottenHighwayElbow_0                                      ;8F95CF;
    dw Door_ForgottenHighwayElbow_1                                      ;8F95D1;

RoomScrolls_ForgottenHighwayElbow:
    db $02                                                               ;8F95D3;

RoomHeader_CrateriaTube:
    db $0D,$00,$20,$04,$01,$01,$70,$A0,$00                               ;8F95D4;
    dw RoomDoors_CrateriaTube                                            ;8F95DD;
    dw Use_StatePointer_inX                                              ;8F95DF;

RoomState_CrateriaTube:
    dl LevelData_CrateriaTube                                            ;8F95E1;
    db $00,$00,$00                                                       ;8F95E4;
    dw FXHeader_CrateriaTube                                             ;8F95E7;
    dw EnemyPopulations_CrateriaTube                                     ;8F95E9;
    dw EnemySets_CrateriaTube                                            ;8F95EB;
    db $00,$00                                                           ;8F95ED;
    dw $0000                                                             ;8F95EF;
    dw $0000                                                             ;8F95F1;
    dw $0000                                                             ;8F95F3;
    dw PLMPopulation_CrateriaTube                                        ;8F95F5;
    dw $0000                                                             ;8F95F7;
    dw RTS_8F91D3                                                        ;8F95F9;

RoomDoors_CrateriaTube:
    dw Door_CrateriaTube_0                                               ;8F95FB;
    dw Door_CrateriaTube_1                                               ;8F95FD;

RoomHeader_Moat:
    db $0E,$00,$24,$04,$02,$02,$90,$A0,$00                               ;8F95FF;
    dw RoomDoors_Moat                                                    ;8F9608;
    dw Use_StatePointer_inX                                              ;8F960A;

RoomState_Moat:
    dl LevelData_Moat                                                    ;8F960C;
    db $00,$00,$00                                                       ;8F960F;
    dw FXHeader_Moat                                                     ;8F9612;
    dw EnemyPopulations_Moat                                             ;8F9614;
    dw EnemySets_Moat                                                    ;8F9616;
    db $C1,$C1                                                           ;8F9618;
    dw $0000                                                             ;8F961A;
    dw $0000                                                             ;8F961C;
    dw $0000                                                             ;8F961E;
    dw PLMPopulation_Moat                                                ;8F9620;
    dw LibBG_Crateria_0_Rocks                                            ;8F9622;
    dw RTS_8F91D3                                                        ;8F9624;

RoomDoors_Moat:
    dw Door_Moat_0                                                       ;8F9626;
    dw Door_Moat_1                                                       ;8F9628;

RoomHeader_RedBinstarElev:
    db $0F,$00,$22,$07,$01,$01,$70,$A0,$00                               ;8F962A;
    dw RoomDoors_RedBinstarElev                                          ;8F9633;
    dw Use_StatePointer_inX                                              ;8F9635;

RoomState_RedBinstarElev:
    dl LevelData_RedBinstarElev                                          ;8F9637;
    db $02,$00,$03                                                       ;8F963A;
    dw FXHeader_RedBrinstarElev                                          ;8F963D;
    dw EnemyPopulations_RedBinstarElev                                   ;8F963F;
    dw EnemySets_RedBinstarElev                                          ;8F9641;
    db $C1,$C1                                                           ;8F9643;
    dw RoomScrolls_RedBinstarElev                                        ;8F9645;
    dw $0000                                                             ;8F9647;
    dw $0000                                                             ;8F9649;
    dw PLMPopulation_RedBinstarElev                                      ;8F964B;
    dw LibBG_Crateria_2_Elevator                                         ;8F964D;
    dw RTS_8F91D3                                                        ;8F964F;

RoomDoors_RedBinstarElev:
    dw Door_RedBinstarElev_0                                             ;8F9651;
    dw Door_RedBinstarElev_1                                             ;8F9653;
    dw Door_VariousRooms_Elevator                                        ;8F9655;

RoomScrolls_RedBinstarElev:
    db $01                                                               ;8F9657;

RoomPLM_RedBinstarElev_0:
    db $00,$02,$80                                                       ;8F9658;

RoomHeader_GauntletETank:
    db $10,$00,$0C,$02,$06,$01,$70,$A0,$00                               ;8F965B;
    dw RoomDoors_GauntletETank                                           ;8F9664;
    dw Use_StatePointer_inX                                              ;8F9666;

RoomState_GauntletETank:
    dl LevelData_GauntletETank                                           ;8F9668;
    db $00,$00,$00                                                       ;8F966B;
    dw FXHeader_GauntletETank                                            ;8F966E;
    dw EnemyPopulations_GauntletETank                                    ;8F9670;
    dw EnemySets_GauntletETank                                           ;8F9672;
    db $C1,$C1                                                           ;8F9674;
    dw RoomScrolls_GauntletETank                                         ;8F9676;
    dw $0000                                                             ;8F9678;
    dw $0000                                                             ;8F967A;
    dw PLMPopulation_GauntletETank                                       ;8F967C;
    dw LibBG_Crateria_0_HorizontalPatternRocks                           ;8F967E;
    dw RTS_8F91D3                                                        ;8F9680;

RoomDoors_GauntletETank:
    dw Door_GauntletETank_0                                              ;8F9682;
    dw Door_GauntletETank_1                                              ;8F9684;

RoomScrolls_GauntletETank:
    db $01,$01,$01,$01,$00,$01                                           ;8F9686;

RoomPLM_GauntletETank_0:
    db $04,$01,$80                                                       ;8F968C;

RoomHeader_PreBowling:
    db $11,$00,$2B,$02,$01,$01,$70,$A0,$00                               ;8F968F;
    dw RoomDoors_PreBowling                                              ;8F9698;
    dw Use_StatePointer_inX                                              ;8F969A;

RoomState_PreBowling:
    dl LevelData_PreBowling                                              ;8F969C;
    db $00,$0C,$05                                                       ;8F969F;
    dw FXHeader_PreBowling                                               ;8F96A2;
    dw EnemyPopulations_PreBowling                                       ;8F96A4;
    dw EnemySets_PreBowling                                              ;8F96A6;
    db $81,$01                                                           ;8F96A8;
    dw $0000                                                             ;8F96AA;
    dw $0000                                                             ;8F96AC;
    dw MainASM_ScrollingSkyOcean                                         ;8F96AE;
    dw PLMPopulation_PreBowling                                          ;8F96B0;
    dw LibBG_ScrollingSky_Tilemaps_BowlingAlley                          ;8F96B2;
    dw SetupASM_ScrollingSkyOcean                                        ;8F96B4;

RoomDoors_PreBowling:
    dw Door_PreBowling_0                                                 ;8F96B6;
    dw Door_PreBowling_1                                                 ;8F96B8;

RoomHeader_Climb:
    db $12,$00,$12,$09,$03,$09,$70,$A0,$00                               ;8F96BA;
    dw RoomDoors_Climb                                                   ;8F96C3;
    dw RoomStateCheck_EventHasBeenSet                                    ;8F96C5;
    db $0E                                                               ;8F96C7;
    dw RoomState_Climb_2                                                 ;8F96C8;
    dw RoomStateCheck_EventHasBeenSet                                    ;8F96CA;
    db $00                                                               ;8F96CC;
    dw RoomState_Climb_1                                                 ;8F96CD;
    dw Use_StatePointer_inX                                              ;8F96CF;

RoomState_Climb_0:
    dl LevelData_Climb                                                   ;8F96D1;
    db $03,$00,$00                                                       ;8F96D4;
    dw FXHeader_Climb_State0                                             ;8F96D7;
    dw EnemyPopulations_Climb_0                                          ;8F96D9;
    dw EnemySets_Climb_0                                                 ;8F96DB;
    db $C1,$C1                                                           ;8F96DD;
    dw RoomScrolls_Climb                                                 ;8F96DF;
    dw $0000                                                             ;8F96E1;
    dw $0000                                                             ;8F96E3;
    dw PLMPopulation_Climb_State_0_1                                     ;8F96E5;
    dw LibBG_Crateria_2_3_Mechanical                                     ;8F96E7;
    dw RTS_8F91D4                                                        ;8F96E9;

RoomState_Climb_1:
    dl LevelData_Climb                                                   ;8F96EB;
    db $02,$09,$05                                                       ;8F96EE;
    dw FXHeader_Climb_State1                                             ;8F96F1;
    dw EnemyPopulations_Climb_1                                          ;8F96F3;
    dw EnemySets_Climb_1                                                 ;8F96F5;
    db $C1,$C1                                                           ;8F96F7;
    dw RoomScrolls_Climb                                                 ;8F96F9;
    dw $0000                                                             ;8F96FB;
    dw $0000                                                             ;8F96FD;
    dw PLMPopulation_Climb_State_0_1                                     ;8F96FF;
    dw LibBG_Crateria_2_3_Mechanical                                     ;8F9701;
    dw RTS_8F91BC                                                        ;8F9703;

RoomState_Climb_2:
    dl LevelData_Climb                                                   ;8F9705;
    db $02,$24,$07                                                       ;8F9708;
    dw FXHeader_Climb_State2                                             ;8F970B;
    dw EnemyPopulations_Climb_2                                          ;8F970D;
    dw EnemySets_Climb_2                                                 ;8F970F;
    db $C1,$C1                                                           ;8F9711;
    dw RoomScrolls_Climb                                                 ;8F9713;
    dw $0000                                                             ;8F9715;
    dw MainASM_SetScreenShaking_GenerateRandomExplosions                 ;8F9717;
    dw PLMPopulation_Climb_State2                                        ;8F9719;
    dw LibBG_Crateria_2_3_Mechanical                                     ;8F971B;
    dw SetupASM_AutoDestroyWallDuringEscape                              ;8F971D;

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
    db $02,$01,$80                                                       ;8F9744;

RoomPLM_Climb_0:
    db $02,$00,$80                                                       ;8F9747;

RoomPLM_Climb_3:
    db $17,$01,$80                                                       ;8F974A;

RoomPLM_Climb_2:
    db $17,$00,$80                                                       ;8F974D;

RoomPLM_Climb_E:
    db $18,$01,$80                                                       ;8F9750;

RoomPLM_Climb_A:
    db $18,$00,$80                                                       ;8F9753;

RoomPLM_Climb_12:
    db $19,$01,$80                                                       ;8F9756;

RoomPLM_Climb_16:
    db $19,$00,$80                                                       ;8F9759;

RoomHeader_Pit:
    db $13,$00,$14,$11,$03,$02,$70,$A0,$00                               ;8F975C;
    dw RoomDoors_Pit                                                     ;8F9765;
    dw RoomStateCheck_MorphballAndMissiles                               ;8F9767;
    dw RoomState_Pit_1                                                   ;8F9769;
    dw Use_StatePointer_inX                                              ;8F976B;

RoomState_Pit_0:
    dl LevelData_Pit                                                     ;8F976D;
    db $03,$00,$05                                                       ;8F9770;
    dw FXHeader_Pit_State0                                               ;8F9773;
    dw EnemyPopulations_Pit_0                                            ;8F9775;
    dw EnemySets_Pit_0                                                   ;8F9777;
    db $C1,$C1                                                           ;8F9779;
    dw RoomScrolls_Pit                                                   ;8F977B;
    dw $0000                                                             ;8F977D;
    dw $0000                                                             ;8F977F;
    dw PLMPopulation_Pit_0                                               ;8F9781;
    dw LibBG_Crateria_2_3_Mechanical                                     ;8F9783;
    dw RTS_8F91D4                                                        ;8F9785;

RoomState_Pit_1:
    dl LevelData_Pit                                                     ;8F9787;
    db $02,$09,$05                                                       ;8F978A;
    dw FXHeader_Pit_State1                                               ;8F978D;
    dw EnemyPopulations_Pit_1                                            ;8F978F;
    dw EnemySets_Pit_1                                                   ;8F9791;
    db $C1,$C1                                                           ;8F9793;
    dw RoomScrolls_Pit                                                   ;8F9795;
    dw $0000                                                             ;8F9797;
    dw $0000                                                             ;8F9799;
    dw PLMPopulation_Pit_1                                               ;8F979B;
    dw LibBG_Crateria_2_3_Mechanical                                     ;8F979D;
    dw RTS_8F91BC                                                        ;8F979F;

RoomDoors_Pit:
    dw Door_Pit_0                                                        ;8F97A1;
    dw Door_Pit_1                                                        ;8F97A3;

RoomScrolls_Pit:
    db $01,$01,$01,$00,$00,$00                                           ;8F97A5;

RoomPLM_Pit_0_1:
    db $00,$02,$03,$02,$80                                               ;8F97AB;

RoomPLM_Pit_2:
    db $00,$01,$03,$00,$80                                               ;8F97B0;

RoomHeader_ElevToBlueBrinstar:
    db $14,$00,$17,$11,$01,$01,$70,$A0,$00                               ;8F97B5;
    dw RoomDoors_ElevToBlueBrinstar                                      ;8F97BE;
    dw RoomStateCheck_MorphballAndMissiles                               ;8F97C0;
    dw RoomState_ElevToBlueBrinstar_1                                    ;8F97C2;
    dw Use_StatePointer_inX                                              ;8F97C4;

RoomState_ElevToBlueBrinstar_0:
    dl LevelData_ElevToBlueBrinstar                                      ;8F97C6;
    db $02,$06,$05                                                       ;8F97C9;
    dw FXHeader_ElevToBlueBrinstar_State0                                ;8F97CC;
    dw EnemyPopulations_ElevToBlueBrinstar                               ;8F97CE;
    dw EnemySets_ElevToBlueBrinstar                                      ;8F97D0;
    db $00,$00                                                           ;8F97D2;
    dw RoomScrolls_ElevToBlueBrinstar                                    ;8F97D4;
    dw $0000                                                             ;8F97D6;
    dw $0000                                                             ;8F97D8;
    dw PLMPopulation_ElevToBlueBrinstar_State0_1                         ;8F97DA;
    dw $0000                                                             ;8F97DC;
    dw RTS_8F91D4                                                        ;8F97DE;

RoomState_ElevToBlueBrinstar_1:
    dl LevelData_ElevToBlueBrinstar                                      ;8F97E0;
    db $02,$00,$03                                                       ;8F97E3;
    dw FXHeader_ElevToBlueBrinstar_State1                                ;8F97E6;
    dw EnemyPopulations_ElevToBlueBrinstar                               ;8F97E8;
    dw EnemySets_ElevToBlueBrinstar                                      ;8F97EA;
    db $00,$00                                                           ;8F97EC;
    dw RoomScrolls_ElevToBlueBrinstar                                    ;8F97EE;
    dw $0000                                                             ;8F97F0;
    dw $0000                                                             ;8F97F2;
    dw PLMPopulation_ElevToBlueBrinstar_State0_1                         ;8F97F4;
    dw $0000                                                             ;8F97F6;
    dw RTS_8F91BC                                                        ;8F97F8;

RoomDoors_ElevToBlueBrinstar:
    dw Door_ElevToBlueBrinstar_0                                         ;8F97FA;
    dw Door_ElevToBlueBrinstar_1                                         ;8F97FC;
    dw Door_VariousRooms_Elevator                                        ;8F97FE;

RoomScrolls_ElevToBlueBrinstar:
    db $01                                                               ;8F9800;

RoomPLM_ElevToBlueBrinstar:
    db $00,$02,$80                                                       ;8F9801;

RoomHeader_BombTorizo:
    db $15,$00,$19,$06,$01,$01,$70,$A0,$00                               ;8F9804;
    dw RoomDoors_BombTorizo                                              ;8F980D;
    dw RoomStateCheck_EventHasBeenSet                                    ;8F980F;
    db $0E                                                               ;8F9811;
    dw RoomState_BombTorizo_2                                            ;8F9812;
    dw RoomStateCheck_BossIsDead                                         ;8F9814;
    db $04                                                               ;8F9816;
    dw RoomState_BombTorizo_1                                            ;8F9817;
    dw Use_StatePointer_inX                                              ;8F9819;

RoomState_BombTorizo_0:
    dl LevelData_BombTorizo                                              ;8F981B;
    db $02,$24,$03                                                       ;8F981E;
    dw FXHeader_BombTorizo_State0_1                                      ;8F9821;
    dw EnemyPopulations_BombTorizo_0_1                                   ;8F9823;
    dw EnemySets_BombTorizo_0_1                                          ;8F9825;
    db $C1,$C1                                                           ;8F9827;
    dw $0000                                                             ;8F9829;
    dw $0000                                                             ;8F982B;
    dw $0000                                                             ;8F982D;
    dw PLMPopulation_BombTorizo_State0_1                                 ;8F982F;
    dw LibBG_Crateria_2_3_Mechanical                                     ;8F9831;
    dw RTS_8F91D4                                                        ;8F9833;

RoomState_BombTorizo_1:
    dl LevelData_BombTorizo                                              ;8F9835;
    db $02,$00,$03                                                       ;8F9838;
    dw FXHeader_BombTorizo_State0_1                                      ;8F983B;
    dw EnemyPopulations_BombTorizo_0_1                                   ;8F983D;
    dw EnemySets_BombTorizo_0_1                                          ;8F983F;
    db $C1,$C1                                                           ;8F9841;
    dw $0000                                                             ;8F9843;
    dw $0000                                                             ;8F9845;
    dw $0000                                                             ;8F9847;
    dw PLMPopulation_BombTorizo_State0_1                                 ;8F9849;
    dw LibBG_Crateria_2_3_Mechanical                                     ;8F984B;
    dw RTS_8F91D4                                                        ;8F984D;

RoomState_BombTorizo_2:
    dl LevelData_BombTorizo                                              ;8F984F;
    db $02,$00,$00                                                       ;8F9852;
    dw FXHeader_BombTorizo_State2                                        ;8F9855;
    dw EnemyPopulations_BombTorizo_2                                     ;8F9857;
    dw EnemySets_BombTorizo_2                                            ;8F9859;
    db $C1,$C1                                                           ;8F985B;
    dw $0000                                                             ;8F985D;
    dw RoomVar_BombTorizo                                                ;8F985F;
    dw MainASM_SetScreenShaking_GenerateRandomExplosions                 ;8F9861;
    dw PLMPopulation_BombTorizo_State2                                   ;8F9863;
    dw LibBG_Crateria_2_3_Mechanical                                     ;8F9865;
    dw SetupASM_TurnWallIntoShotBlocksDuringEscape                       ;8F9867;

RoomDoors_BombTorizo:
    dw Door_BombTorizo_0                                                 ;8F9869;

RoomVar_BombTorizo:
    db $0F,$0A,$52,$00,$0F,$0B,$52,$00,$0F,$0C,$52,$00,$00,$00           ;8F986B;

RoomHeader_Flyway:
    db $16,$00,$16,$06,$03,$01,$70,$A0,$00                               ;8F9879;
    dw RoomDoors_Flyway                                                  ;8F9882;
    dw RoomStateCheck_EventHasBeenSet                                    ;8F9884;
    db $0E                                                               ;8F9886;
    dw RoomState_Flyway_2                                                ;8F9887;
    dw RoomStateCheck_BossIsDead                                         ;8F9889;
    db $04                                                               ;8F988B;
    dw RoomState_Flyway_1                                                ;8F988C;
    dw Use_StatePointer_inX                                              ;8F988E;

RoomState_Flyway_0:
    dl LevelData_Flyway                                                  ;8F9890;
    db $02,$09,$05                                                       ;8F9893;
    dw FXHeader_Flyway_State0_1                                          ;8F9896;
    dw EnemyPopulations_Flyway_0_1                                       ;8F9898;
    dw EnemySets_Flyway_0_1                                              ;8F989A;
    db $C1,$C1                                                           ;8F989C;
    dw $0000                                                             ;8F989E;
    dw $0000                                                             ;8F98A0;
    dw $0000                                                             ;8F98A2;
    dw PLMPopulation_Flyway_State0_1                                     ;8F98A4;
    dw LibBG_Crateria_2_BrickRoom_WallArt_Dark                           ;8F98A6;
    dw RTS_8F91D4                                                        ;8F98A8;

RoomState_Flyway_1:
    dl LevelData_Flyway                                                  ;8F98AA;
    db $02,$09,$05                                                       ;8F98AD;
    dw FXHeader_Flyway_State0_1                                          ;8F98B0;
    dw EnemyPopulations_Flyway_0_1                                       ;8F98B2;
    dw EnemySets_Flyway_0_1                                              ;8F98B4;
    db $C1,$C1                                                           ;8F98B6;
    dw $0000                                                             ;8F98B8;
    dw $0000                                                             ;8F98BA;
    dw $0000                                                             ;8F98BC;
    dw PLMPopulation_Flyway_State0_1                                     ;8F98BE;
    dw LibBG_Crateria_2_BrickRoom_WallArt_Dark                           ;8F98C0;
    dw RTS_8F91D4                                                        ;8F98C2;

RoomState_Flyway_2:
    dl LevelData_Flyway                                                  ;8F98C4;
    db $02,$24,$07                                                       ;8F98C7;
    dw FXHeader_Flyway_State2                                            ;8F98CA;
    dw EnemyPopulations_Flyway_2                                         ;8F98CC;
    dw EnemySets_Flyway_2                                                ;8F98CE;
    db $C1,$C1                                                           ;8F98D0;
    dw $0000                                                             ;8F98D2;
    dw $0000                                                             ;8F98D4;
    dw MainASM_SetScreenShaking_GenerateRandomExplosions                 ;8F98D6;
    dw PLMPopulation_Flyway_State2                                       ;8F98D8;
    dw LibBG_Crateria_2_BrickRoom_WallArt_Dark                           ;8F98DA;
    dw RTS_8F91BB                                                        ;8F98DC;

RoomDoors_Flyway:
    dw Door_Flyway_0                                                     ;8F98DE;
    dw Door_Flyway_1                                                     ;8F98E0;

RoomHeader_PreMapFlyway:
    db $17,$00,$14,$07,$03,$01,$70,$A0,$00                               ;8F98E2;
    dw RoomDoors_PreMapFlyway                                            ;8F98EB;
    dw Use_StatePointer_inX                                              ;8F98ED;

RoomState_PreMapFlyway:
    dl LevelData_PreMapFlyway                                            ;8F98EF;
    db $02,$00,$00                                                       ;8F98F2;
    dw FXHeader_VariousRooms_8381C2                                      ;8F98F5;
    dw EnemyPopulations_PreMapFlyway                                     ;8F98F7;
    dw EnemySets_PreMapFlyway                                            ;8F98F9;
    db $C1,$C1                                                           ;8F98FB;
    dw $0000                                                             ;8F98FD;
    dw $0000                                                             ;8F98FF;
    dw $0000                                                             ;8F9901;
    dw PLMPopulation_PreMapFlyway                                        ;8F9903;
    dw LibBG_Crateria_2_BrickRoom_WallArt                                ;8F9905;
    dw RTS_8F91D4                                                        ;8F9907;

RoomDoors_PreMapFlyway:
    dw Door_PreMapFlyway_0                                               ;8F9909;
    dw Door_PreMapFlyway_1                                               ;8F990B;

RoomHeader_Terminator:
    db $18,$00,$0C,$04,$06,$03,$A0,$A0,$00                               ;8F990D;
    dw RoomDoors_Terminator                                              ;8F9916;
    dw Use_StatePointer_inX                                              ;8F9918;

RoomState_Terminator:
    dl LevelData_Terminator                                              ;8F991A;
    db $02,$00,$00                                                       ;8F991D;
    dw FXHeader_VariousRooms_8381C2                                      ;8F9920;
    dw EnemyPopulations_Terminator                                       ;8F9922;
    dw EnemySets_Terminator                                              ;8F9924;
    db $C1,$C1                                                           ;8F9926;
    dw $0000                                                             ;8F9928;
    dw $0000                                                             ;8F992A;
    dw $0000                                                             ;8F992C;
    dw PLMPopulation_Terminator                                          ;8F992E;
    dw LibBG_Crateria_2_PurpleRocks                                      ;8F9930;
    dw RTS_8F91D4                                                        ;8F9932;

RoomDoors_Terminator:
    dw Door_Terminator_0                                                 ;8F9934;
    dw Door_Terminator_1                                                 ;8F9936;

RoomHeader_GreenBrinstarElev:
    db $19,$00,$06,$08,$01,$01,$70,$A0,$00                               ;8F9938;
    dw RoomDoors_GreenBrinstarElev                                       ;8F9941;
    dw Use_StatePointer_inX                                              ;8F9943;

RoomState_GreenBrinstarElev:
    dl LevelData_GreenBrinstarElev                                       ;8F9945;
    db $02,$09,$03                                                       ;8F9948;
    dw FXHeader_VariousRooms_8381C2                                      ;8F994B;
    dw EnemyPopulations_GreenBrinstarElev                                ;8F994D;
    dw EnemySets_GreenBrinstarElev                                       ;8F994F;
    db $00,$00                                                           ;8F9951;
    dw RoomScrolls_GreenBrinstarElev                                     ;8F9953;
    dw $0000                                                             ;8F9955;
    dw $0000                                                             ;8F9957;
    dw PLMPopulation_GreenBrinstarElev                                   ;8F9959;
    dw $0000                                                             ;8F995B;
    dw RTS_8F91D4                                                        ;8F995D;

RoomDoors_GreenBrinstarElev:
    dw Door_GreenBrinstarElev_                                           ;8F995F;
    dw Door_GreenBrinstarElev_1                                          ;8F9961;
    dw Door_VariousRooms_Elevator                                        ;8F9963;

RoomScrolls_GreenBrinstarElev:
    db $01                                                               ;8F9965;

RoomPLM_GreenBrinstarElev_0:
    db $00,$02,$80                                                       ;8F9966;

RoomHeader_LowerMushrooms:
    db $1A,$00,$07,$08,$04,$01,$70,$A0,$00                               ;8F9969;
    dw RoomDoors_LowerMushrooms                                          ;8F9972;
    dw Use_StatePointer_inX                                              ;8F9974;

RoomState_LowerMushrooms:
    dl LevelData_LowerMushrooms                                          ;8F9976;
    db $02,$00,$05                                                       ;8F9979;
    dw FXHeader_VariousRooms_8381C2                                      ;8F997C;
    dw EnemyPopulations_LowerMushrooms                                   ;8F997E;
    dw EnemySets_LowerMushrooms                                          ;8F9980;
    db $C1,$C1                                                           ;8F9982;
    dw $0000                                                             ;8F9984;
    dw $0000                                                             ;8F9986;
    dw $0000                                                             ;8F9988;
    dw PLMPopulation_LowerMushrooms                                      ;8F998A;
    dw LibBG_Crateria_2_PurpleRocks                                      ;8F998C;
    dw RTS_8F91D4                                                        ;8F998E;

RoomDoors_LowerMushrooms:
    dw Door_LowerMushrooms_0                                             ;8F9990;
    dw Door_LowerMushrooms_1                                             ;8F9992;

RoomHeader_CrateriaMap:
    db $1B,$00,$17,$07,$01,$01,$70,$A0,$00                               ;8F9994;
    dw RoomDoors_CrateriaMap                                             ;8F999D;
    dw Use_StatePointer_inX                                              ;8F999F;

RoomState_CrateriaMap:
    dl LevelData_MapStation_LeftSideDoor                                 ;8F99A1;
    db $15,$00,$00                                                       ;8F99A4;
    dw FXHeader_VariousRooms_8381C2                                      ;8F99A7;
    dw EnemyPopulations_CrateriaMap                                      ;8F99A9;
    dw EnemySets_CrateriaMap                                             ;8F99AB;
    db $00,$00                                                           ;8F99AD;
    dw $0000                                                             ;8F99AF;
    dw $0000                                                             ;8F99B1;
    dw $0000                                                             ;8F99B3;
    dw PLMPopulation_CrateriaMap                                         ;8F99B5;
    dw $0000                                                             ;8F99B7;
    dw RTS_8F91D4                                                        ;8F99B9;

RoomDoors_CrateriaMap:
    dw Door_CrateriaMap_0                                                ;8F99BB;

RoomHeader_GreenPiratesShaft:
    db $1C,$00,$0B,$02,$01,$07,$70,$A0,$00                               ;8F99BD;
    dw RoomDoors_GreenPiratesShaft                                       ;8F99C6;
    dw Use_StatePointer_inX                                              ;8F99C8;

RoomState_GreenPiratesShaft:
    dl LevelData_GreenPiratesShaft                                       ;8F99CA;
    db $02,$00,$05                                                       ;8F99CD;
    dw FXHeader_VariousRooms_8381C2                                      ;8F99D0;
    dw EnemyPopulations_GreenPiratesShaft                                ;8F99D2;
    dw EnemySets_GreenPiratesShaft                                       ;8F99D4;
    db $01,$C1                                                           ;8F99D6;
    dw RoomScrolls_GreenPiratesShaft                                     ;8F99D8;
    dw $0000                                                             ;8F99DA;
    dw $0000                                                             ;8F99DC;
    dw PLMPopulation_GreenPiratesShaft                                   ;8F99DE;
    dw LibBG_Crateria_2_BrickRoom                                        ;8F99E0;
    dw RTS_8F91D4                                                        ;8F99E2;

RoomDoors_GreenPiratesShaft:
    dw Door_GreenPiratesShaft_0                                          ;8F99E4;
    dw Door_GreenPiratesShaft_1                                          ;8F99E6;
    dw Door_GreenPiratesShaft_2                                          ;8F99E8;
    dw Door_GreenPiratesShaft_3                                          ;8F99EA;

RoomScrolls_GreenPiratesShaft:
    db $02,$02,$02,$00,$02,$02,$01                                       ;8F99EC;

RoomPLM_GreenPiratesShaft_0:
    db $03,$02,$80                                                       ;8F99F3;

RoomPLM_GreenPiratesShaft_2:
    db $03,$00,$80                                                       ;8F99F6;

RoomHeader_CrateriaSuper:
    db $1D,$00,$15,$09,$04,$08,$70,$A0,$00                               ;8F99F9;
    dw RoomDoors_CrateriaSuper                                           ;8F9A02;
    dw Use_StatePointer_inX                                              ;8F9A04;

RoomState_CrateriaSuper:
    dl LevelData_CrateriaSuper                                           ;8F9A06;
    db $02,$00,$00                                                       ;8F9A09;
    dw FXHeader_CrateriaSuper                                            ;8F9A0C;
    dw EnemyPopulations_CrateriaSuper                                    ;8F9A0E;
    dw EnemySets_CrateriaSuper                                           ;8F9A10;
    db $C1,$C1                                                           ;8F9A12;
    dw RoomScrolls_CrateriaSuper                                         ;8F9A14;
    dw $0000                                                             ;8F9A16;
    dw $0000                                                             ;8F9A18;
    dw PLMPopulation_CrateriaSuper                                       ;8F9A1A;
    dw LibBG_Crateria_2_3_Mechanical                                     ;8F9A1C;
    dw RTS_8F91D4                                                        ;8F9A1E;

RoomDoors_CrateriaSuper:
    dw Door_CrateriaSuper_0                                              ;8F9A20;
    dw Door_CrateriaSuper_1                                              ;8F9A22;

RoomScrolls_CrateriaSuper:
    db $01,$01,$01,$02,$00,$00,$00,$02,$00,$00,$00,$02,$00,$00,$00,$02   ;8F9A24;
    db $00,$00,$00,$02,$00,$00,$00,$02,$00,$00,$00,$02,$01,$01,$01,$01   ;8F9A34;

RoomHeader_FinalMissileBombway:
    db $1E,$00,$11,$07,$02,$01,$70,$A0,$00                               ;8F9A44;
    dw RoomDoors_FinalMissileBombway                                     ;8F9A4D;
    dw RoomStateCheck_EventHasBeenSet                                    ;8F9A4F;
    db $00                                                               ;8F9A51;
    dw RoomState_FinalMissileBombway_1                                   ;8F9A52;
    dw Use_StatePointer_inX                                              ;8F9A54;

RoomState_FinalMissileBombway_0:
    dl LevelData_FinalMissileBombway                                     ;8F9A56;
    db $02,$00,$00                                                       ;8F9A59;
    dw FXHeader_FinalMissileBombway_State0                               ;8F9A5C;
    dw EnemyPopulations_FinalMissileBombway_0                            ;8F9A5E;
    dw EnemySets_FinalMissileBombway_0                                   ;8F9A60;
    db $C1,$C1                                                           ;8F9A62;
    dw RoomScrolls_FinalMissileBombway                                   ;8F9A64;
    dw $0000                                                             ;8F9A66;
    dw $0000                                                             ;8F9A68;
    dw PLMPopulation_FinalMissileBombway_State0                          ;8F9A6A;
    dw LibBG_Crateria_2_BrickRoom                                        ;8F9A6C;
    dw RTS_8F91D4                                                        ;8F9A6E;

RoomState_FinalMissileBombway_1:
    dl LevelData_FinalMissileBombway                                     ;8F9A70;
    db $02,$00,$00                                                       ;8F9A73;
    dw FXHeader_FinalMissileBombway_State1                               ;8F9A76;
    dw EnemyPopulations_FinalMissileBombway_1                            ;8F9A78;
    dw EnemySets_FinalMissileBombway_1                                   ;8F9A7A;
    db $C1,$C1                                                           ;8F9A7C;
    dw RoomScrolls_FinalMissileBombway                                   ;8F9A7E;
    dw $0000                                                             ;8F9A80;
    dw $0000                                                             ;8F9A82;
    dw PLMPopulation_FinalMissileBombway_State1                          ;8F9A84;
    dw LibBG_Crateria_2_BrickRoom                                        ;8F9A86;
    dw RTS_8F91D4                                                        ;8F9A88;

RoomDoors_FinalMissileBombway:
    dw Door_FinalMissileBombway_0                                        ;8F9A8A;
    dw Door_FinalMissileBombway_1                                        ;8F9A8C;

RoomScrolls_FinalMissileBombway:
    db $01,$01                                                           ;8F9A8E;

RoomHeader_FinalMissile:
    db $1F,$00,$10,$07,$01,$01,$70,$A0,$00                               ;8F9A90;
    dw RoomDoors_FinalMissile                                            ;8F9A99;
    dw RoomStateCheck_EventHasBeenSet                                    ;8F9A9B;
    db $00                                                               ;8F9A9D;
    dw RoomState_FinalMissile_1                                          ;8F9A9E;
    dw Use_StatePointer_inX                                              ;8F9AA0;

RoomState_FinalMissile_0:
    dl LevelData_FinalMissile                                            ;8F9AA2;
    db $02,$00,$00                                                       ;8F9AA5;
    dw FXHeader_FinalMissile_State0                                      ;8F9AA8;
    dw EnemyPopulations_FinalMissile_0                                   ;8F9AAA;
    dw EnemySets_FinalMissile_0                                          ;8F9AAC;
    db $C1,$C1                                                           ;8F9AAE;
    dw RoomScrolls_FinalMissile                                          ;8F9AB0;
    dw $0000                                                             ;8F9AB2;
    dw $0000                                                             ;8F9AB4;
    dw PLMPopulation_FinalMissile_State0                                 ;8F9AB6;
    dw LibBG_Crateria_2_3_Mechanical                                     ;8F9AB8;
    dw RTS_8F91D4                                                        ;8F9ABA;

RoomState_FinalMissile_1:
    dl LevelData_FinalMissile                                            ;8F9ABC;
    db $02,$00,$00                                                       ;8F9ABF;
    dw FXHeader_FinalMissile_State1                                      ;8F9AC2;
    dw EnemyPopulations_FinalMissile_1                                   ;8F9AC4;
    dw EnemySets_FinalMissile_1                                          ;8F9AC6;
    db $C1,$C1                                                           ;8F9AC8;
    dw RoomScrolls_FinalMissile                                          ;8F9ACA;
    dw $0000                                                             ;8F9ACC;
    dw $0000                                                             ;8F9ACE;
    dw PLMPopulation_FinalMissile_State1                                 ;8F9AD0;
    dw LibBG_Crateria_2_3_Mechanical                                     ;8F9AD2;
    dw RTS_8F91D4                                                        ;8F9AD4;

RoomDoors_FinalMissile:
    dw Door_FinalMissile_0                                               ;8F9AD6;

RoomScrolls_FinalMissile:
    db $01                                                               ;8F9AD8;

RoomHeader_GreenBrinstarMainShaft:
    db $00,$01,$09,$00,$04,$0C,$70,$A0,$00                               ;8F9AD9;
    dw RoomDoors_GreenBrinstarMainShaft                                  ;8F9AE2;
    dw Use_StatePointer_inX                                              ;8F9AE4;

RoomState_GreenBrinstarMainShaft:
    dl LevelData_GreenBrinstarMainShaft                                  ;8F9AE6;
    db $06,$0F,$05                                                       ;8F9AE9;
    dw FXHeader_GreenBrinstarMainShaft                                   ;8F9AEC;
    dw EnemyPopulations_GreenBrinstarMainShaft                           ;8F9AEE;
    dw EnemySets_GreenBrinstarMainShaft                                  ;8F9AF0;
    db $00,$C0                                                           ;8F9AF2;
    dw RoomScrolls_GreenBrinstarMainShaft                                ;8F9AF4;
    dw $0000                                                             ;8F9AF6;
    dw $0000                                                             ;8F9AF8;
    dw PLMPopulation_GreenBrinstarMainShaft                              ;8F9AFA;
    dw LibBG_Brinstar_6_Vertical_GlowPatches                             ;8F9AFC;
    dw RTS_8F91D5                                                        ;8F9AFE;

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
    db $1C,$02,$1D,$00,$80                                               ;8F9B46;

RoomPLM_GreenBrinstarMainShaft_1_2:
    db $1C,$00,$1D,$01,$29,$01,$80                                       ;8F9B4B;

RoomPLM_GreenBrinstarMainShaft_3:
    db $18,$02,$1C,$02,$1D,$00,$29,$00,$80                               ;8F9B52;

RoomHeader_SporeSpawnSuper:
    db $01,$01,$17,$01,$02,$09,$70,$A0,$00                               ;8F9B5B;
    dw RoomDoors_SporeSpawnSuper                                         ;8F9B64;
    dw Use_StatePointer_inX                                              ;8F9B66;

RoomState_SporeSpawnSuper:
    dl LevelData_SporeSpawnSuper                                         ;8F9B68;
    db $06,$00,$03                                                       ;8F9B6B;
    dw FXHeader_SporeSpawnSuper                                          ;8F9B6E;
    dw EnemyPopulations_SporeSpawnSuper                                  ;8F9B70;
    dw EnemySets_SporeSpawnSuper                                         ;8F9B72;
    db $C1,$C1                                                           ;8F9B74;
    dw RoomScrolls_SporeSpawnSuper                                       ;8F9B76;
    dw $0000                                                             ;8F9B78;
    dw $0000                                                             ;8F9B7A;
    dw PLMPopulation_SporeSpawnSuper                                     ;8F9B7C;
    dw LibBG_Brinstar_6_SmallPattern                                     ;8F9B7E;
    dw RTS_8F91D5                                                        ;8F9B80;

RoomDoors_SporeSpawnSuper:
    dw Door_SporeSpawnSuper_0                                            ;8F9B82;
    dw Door_SporeSpawnSuper_1                                            ;8F9B84;

RoomScrolls_SporeSpawnSuper:
    db $01,$02,$00,$02,$00,$02,$00,$02,$00,$02,$00,$02,$00,$02,$00,$02   ;8F9B86;
    db $01,$01                                                           ;8F9B96;

RoomPLM_SporeSpawnSuper_0:
    db $01,$02,$03,$02,$80                                               ;8F9B98;

RoomHeader_BrinstarPreMap:
    db $02,$01,$06,$04,$03,$01,$70,$A0,$00                               ;8F9B9D;
    dw RoomDoors_BrinstarPreMap                                          ;8F9BA6;
    dw Use_StatePointer_inX                                              ;8F9BA8;

RoomState_BrinstarPreMap:
    dl LevelData_BrinstarPreMap                                          ;8F9BAA;
    db $06,$00,$00                                                       ;8F9BAD;
    dw FXHeader_BrinstarPreMap                                           ;8F9BB0;
    dw EnemyPopulations_BrinstarPreMap                                   ;8F9BB2;
    dw EnemySets_BrinstarPreMap                                          ;8F9BB4;
    db $C1,$C1                                                           ;8F9BB6;
    dw $0000                                                             ;8F9BB8;
    dw $0000                                                             ;8F9BBA;
    dw $0000                                                             ;8F9BBC;
    dw PLMPopulation_BrinstarPreMap                                      ;8F9BBE;
    dw LibBG_Brinstar_6_MediumHorizontalPattern                          ;8F9BC0;
    dw RTS_8F91D5                                                        ;8F9BC2;

RoomDoors_BrinstarPreMap:
    dw Door_BrinstarPreMap_0                                             ;8F9BC4;
    dw Door_BrinstarPreMap_1                                             ;8F9BC6;

RoomHeader_EarlySupers:
    db $03,$01,$0A,$03,$03,$02,$70,$A0,$00                               ;8F9BC8;
    dw RoomDoors_EarlySupers                                             ;8F9BD1;
    dw Use_StatePointer_inX                                              ;8F9BD3;

RoomState_EarlySupers:
    dl LevelData_EarlySupers                                             ;8F9BD5;
    db $06,$00,$05                                                       ;8F9BD8;
    dw FXHeader_EarlySupers                                              ;8F9BDB;
    dw EnemyPopulations_EarlySupers                                      ;8F9BDD;
    dw EnemySets_EarlySupers                                             ;8F9BDF;
    db $C1,$C1                                                           ;8F9BE1;
    dw RoomScrolls_EarlySupers                                           ;8F9BE3;
    dw $0000                                                             ;8F9BE5;
    dw $0000                                                             ;8F9BE7;
    dw PLMPopulation_EarlySupers                                         ;8F9BE9;
    dw LibBG_Brinstar_6_ThinHorizontalPattern                            ;8F9BEB;
    dw RTS_8F91D5                                                        ;8F9BED;

RoomDoors_EarlySupers:
    dw Door_EarlySupers_0                                                ;8F9BEF;
    dw Door_EarlySupers_1                                                ;8F9BF1;

RoomScrolls_EarlySupers:
    db $00,$00,$00,$01,$01,$01                                           ;8F9BF3;

RoomPLM_EarlySupers_0_4:
    db $00,$02,$01,$02,$02,$02,$80                                       ;8F9BF9;

RoomPLM_EarlySupers_3:
    db $00,$00,$01,$00,$02,$00,$80                                       ;8F9C00;

RoomHeader_BrinstarReserveTank:
    db $04,$01,$0D,$04,$02,$01,$70,$A0,$00                               ;8F9C07;
    dw RoomDoors_BrinstarReserveTank                                     ;8F9C10;
    dw Use_StatePointer_inX                                              ;8F9C12;

RoomState_BrinstarReserveTank:
    dl LevelData_BrinstarReserveTank                                     ;8F9C14;
    db $06,$00,$03                                                       ;8F9C17;
    dw FXHeader_BrinstarReserveTank                                      ;8F9C1A;
    dw EnemyPopulations_BrinstarReserveTank                              ;8F9C1C;
    dw EnemySets_BrinstarReserveTank                                     ;8F9C1E;
    db $C1,$C1                                                           ;8F9C20;
    dw RoomScrolls_BrinstarReserveTank                                   ;8F9C22;
    dw $0000                                                             ;8F9C24;
    dw $0000                                                             ;8F9C26;
    dw PLMPopulation_BrinstarReserveTank                                 ;8F9C28;
    dw LibBG_Brinstar_6_LargeHorizontalPattern                           ;8F9C2A;
    dw RTS_8F91D5                                                        ;8F9C2C;

RoomDoors_BrinstarReserveTank:
    dw Door_BrinstarReserveTank_0                                        ;8F9C2E;

RoomScrolls_BrinstarReserveTank:
    db $01,$00                                                           ;8F9C30;

RoomPLM_BrinstarReserveTank_0:
    db $01,$01,$80                                                       ;8F9C32;

RoomHeader_GreenBrinstarMap:
    db $05,$01,$05,$04,$01,$01,$70,$A0,$00                               ;8F9C35;
    dw RoomDoors_GreenBrinstarMap                                        ;8F9C3E;
    dw Use_StatePointer_inX                                              ;8F9C40;

RoomState_GreenBrinstarMap:
    dl LevelData_MapStation_RightSideDoor                                ;8F9C42;
    db $15,$00,$00                                                       ;8F9C45;
    dw FXHeader_GreenBrinstarMap                                         ;8F9C48;
    dw EnemyPopulations_GreenBrinstarMap                                 ;8F9C4A;
    dw EnemySets_GreenBrinstarMap                                        ;8F9C4C;
    db $00,$00                                                           ;8F9C4E;
    dw $0000                                                             ;8F9C50;
    dw $0000                                                             ;8F9C52;
    dw $0000                                                             ;8F9C54;
    dw PLMPopulation_GreenBrinstarMap                                    ;8F9C56;
    dw $0000                                                             ;8F9C58;
    dw RTS_8F91D5                                                        ;8F9C5A;

RoomDoors_GreenBrinstarMap:
    dw Door_GreenBrinstarMap_0                                           ;8F9C5C;

RoomHeader_GreenBrinstarFirefleas:
    db $06,$01,$06,$06,$03,$02,$70,$A0,$00                               ;8F9C5E;
    dw RoomDoors_GreenBrinstarFirefleas                                  ;8F9C67;
    dw Use_StatePointer_inX                                              ;8F9C69;

RoomState_GreenBrinstarFirefleas:
    dl LevelData_GreenBrinstarFirefleas                                  ;8F9C6B;
    db $06,$00,$00                                                       ;8F9C6E;
    dw FXHeader_GreenBrinstarFirefleas                                   ;8F9C71;
    dw EnemyPopulations_GreenBrinstarFirefleas                           ;8F9C73;
    dw EnemySets_GreenBrinstarFirefleas                                  ;8F9C75;
    db $00,$00                                                           ;8F9C77;
    dw $0000                                                             ;8F9C79;
    dw $0000                                                             ;8F9C7B;
    dw $0000                                                             ;8F9C7D;
    dw PLMPopulation_GreenBrinstarFirefleas                              ;8F9C7F;
    dw $0000                                                             ;8F9C81;
    dw RTS_8F91D5                                                        ;8F9C83;

RoomDoors_GreenBrinstarFirefleas:
    dw Door_GreenBrinstarFirefleas_0                                     ;8F9C85;
    dw Door_GreenBrinstarFirefleas_1                                     ;8F9C87;

RoomHeader_GreenBrinstarMissileRefill:
    db $07,$01,$05,$07,$01,$01,$70,$A0,$00                               ;8F9C89;
    dw RoomDoors_GreenBrinstarMissileRefill                              ;8F9C92;
    dw Use_StatePointer_inX                                              ;8F9C94;

RoomState_GreenBrinstarMissileRefill:
    dl LevelData_MissileRefill_RightSideDoor                             ;8F9C96;
    db $18,$00,$00                                                       ;8F9C99;
    dw FXHeader_GreenBrinstarMissileRefill                               ;8F9C9C;
    dw EnemyPopulations_GreenBrinstarMissileRefill                       ;8F9C9E;
    dw EnemySets_GreenBrinstarMissileRefill                              ;8F9CA0;
    db $00,$00                                                           ;8F9CA2;
    dw RoomScrolls_GreenBrinstarMissileRefill                            ;8F9CA4;
    dw $0000                                                             ;8F9CA6;
    dw $0000                                                             ;8F9CA8;
    dw PLMPopulation_GreenBrinstarMissileRefill                          ;8F9CAA;
    dw $0000                                                             ;8F9CAC;
    dw RTS_8F91D5                                                        ;8F9CAE;

RoomDoors_GreenBrinstarMissileRefill:
    dw Door_GreenBrinstarMissileRefill_0                                 ;8F9CB0;

RoomScrolls_GreenBrinstarMissileRefill:
    db $01                                                               ;8F9CB2;

RoomHeader_Dachora:
    db $08,$01,$0A,$06,$07,$07,$70,$A0,$00                               ;8F9CB3;
    dw RoomDoors_Dachora                                                 ;8F9CBC;
    dw Use_StatePointer_inX                                              ;8F9CBE;

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
    dl $010101                                                           ;8F9CE0;
    db $01,$01,$01                                                       ;8F9CE3;
    dw $0001                                                             ;8F9CE6;
    dw $0000                                                             ;8F9CE8;
    dw $0000                                                             ;8F9CEA;
    db $00,$00                                                           ;8F9CEC;
    dw $0000                                                             ;8F9CEE;
    dw $0000                                                             ;8F9CF0;
    dw $0002                                                             ;8F9CF2;
    dw $0000                                                             ;8F9CF4;
    dw $0000                                                             ;8F9CF6;
    dw $0200                                                             ;8F9CF8;
    db $00,$00,$00,$00,$00,$00,$02,$00,$00,$00,$00,$00,$00,$02,$00,$00   ;8F9CFA;
    db $02,$02,$02,$02,$02,$00,$00                                       ;8F9D0A;

RoomPLM_Dachora_6:
    db $0B,$02,$80                                                       ;8F9D11;

RoomPLM_Dachora_A_16:
    db $04,$01,$0B,$00,$80                                               ;8F9D14;

RoomHeader_BigPink:
    db $09,$01,$0F,$04,$05,$0A,$70,$A0,$00                               ;8F9D19;
    dw RoomDoors_BigPink                                                 ;8F9D22;
    dw Use_StatePointer_inX                                              ;8F9D24;

RoomState_BigPink:
    dl LevelData_BigPink                                                 ;8F9D26;
    db $06,$0F,$05                                                       ;8F9D29;
    dw FXHeader_BigPink                                                  ;8F9D2C;
    dw EnemyPopulations_BigPink                                          ;8F9D2E;
    dw EnemySets_BigPink                                                 ;8F9D30;
    db $C1,$C1                                                           ;8F9D32;
    dw RoomScrolls_BigPink                                               ;8F9D34;
    dw $0000                                                             ;8F9D36;
    dw $0000                                                             ;8F9D38;
    dw PLMPopulation_BigPink                                             ;8F9D3A;
    dw LibBG_Brinstar_6_DarkPattern                                      ;8F9D3C;
    dw RTS_8F91D5                                                        ;8F9D3E;

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
    db $20,$02,$25,$02,$26,$02,$80                                       ;8F9D84;

RoomPLM_BigPink_1:
    db $24,$02,$80                                                       ;8F9D8B;

RoomPLM_BigPink_2:
    db $1D,$00,$80                                                       ;8F9D8E;

RoomPLM_BigPink_3:
    db $1C,$01,$1D,$01,$80                                               ;8F9D91;

RoomPLM_BigPink_4:
    db $01,$02,$80                                                       ;8F9D96;

RoomPLM_BigPink_5:
    db $01,$00,$80                                                       ;8F9D99;

RoomHeader_SporeSpawnKihunters:
    db $0A,$01,$13,$04,$04,$01,$70,$A0,$00                               ;8F9D9C;
    dw RoomDoors_SporeSpawnKihunters                                     ;8F9DA5;
    dw Use_StatePointer_inX                                              ;8F9DA7;

RoomState_SporeSpawnKihunters:
    dl LevelData_SporeSpawnKihunters                                     ;8F9DA9;
    db $06,$0F,$05                                                       ;8F9DAC;
    dw FXHeader_SporeSpawnKihunters                                      ;8F9DAF;
    dw EnemyPopulations_SporeSpawnKihunters                              ;8F9DB1;
    dw EnemySets_SporeSpawnKihunters                                     ;8F9DB3;
    db $C1,$C1                                                           ;8F9DB5;
    dw $0000                                                             ;8F9DB7;
    dw $0000                                                             ;8F9DB9;
    dw $0000                                                             ;8F9DBB;
    dw PLMPopulation_SporeSpawnKihunters                                 ;8F9DBD;
    dw LibBG_Brinstar_6_Horizontal_GlowPatches                           ;8F9DBF;
    dw RTS_8F91D5                                                        ;8F9DC1;

RoomDoors_SporeSpawnKihunters:
    dw Door_SporeSpawnKihunters_0                                        ;8F9DC3;
    dw Door_SporeSpawnKihunters_1                                        ;8F9DC5;

RoomHeader_SporeSpawn:
    db $0B,$01,$16,$01,$01,$03,$70,$A0,$00                               ;8F9DC7;
    dw RoomDoors_SporeSpawn                                              ;8F9DD0;
    dw RoomStateCheck_BossIsDead                                         ;8F9DD2;
    db $02                                                               ;8F9DD4;
    dw RoomState_SporeSpawn_1                                            ;8F9DD5;
    dw Use_StatePointer_inX                                              ;8F9DD7;

RoomState_SporeSpawn_0:
    dl LevelData_SporeSpawn                                              ;8F9DD9;
    db $06,$2A,$05                                                       ;8F9DDC;
    dw FXHeader_SporeSpawn_State0_1                                      ;8F9DDF;
    dw EnemyPopulations_SporeSpawn                                       ;8F9DE1;
    dw EnemySets_SporeSpawn                                              ;8F9DE3;
    db $00,$00                                                           ;8F9DE5;
    dw $0001                                                             ;8F9DE7;
    dw $0000                                                             ;8F9DE9;
    dw $0000                                                             ;8F9DEB;
    dw PLMPopulation_SporeSpawn_State0_1                                 ;8F9DED;
    dw $0000                                                             ;8F9DEF;
    dw RTS_8F91D5                                                        ;8F9DF1;

RoomState_SporeSpawn_1:
    dl LevelData_SporeSpawn                                              ;8F9DF3;
    db $06,$00,$03                                                       ;8F9DF6;
    dw FXHeader_SporeSpawn_State0_1                                      ;8F9DF9;
    dw EnemyPopulations_SporeSpawn                                       ;8F9DFB;
    dw EnemySets_SporeSpawn                                              ;8F9DFD;
    db $00,$00                                                           ;8F9DFF;
    dw $0001                                                             ;8F9E01;
    dw $0000                                                             ;8F9E03;
    dw $0000                                                             ;8F9E05;
    dw PLMPopulation_SporeSpawn_State0_1                                 ;8F9E07;
    dw $0000                                                             ;8F9E09;
    dw RTS_8F91D5                                                        ;8F9E0B;

RoomDoors_SporeSpawn:
    dw Door_SporeSpawn_0                                                 ;8F9E0D;
    dw Door_SporeSpawn_1                                                 ;8F9E0F;

RoomHeader_PinkBrinstarPowerBombs:
    db $0C,$01,$0F,$07,$02,$02,$70,$A0,$00                               ;8F9E11;
    dw RoomDoors_PinkBrinstarPowerBombs                                  ;8F9E1A;
    dw Use_StatePointer_inX                                              ;8F9E1C;

RoomState_PinkBrinstarPowerBombs:
    dl LevelData_PinkBrinstarPowerBombs                                  ;8F9E1E;
    db $06,$00,$00                                                       ;8F9E21;
    dw FXHeader_PinkBrinstarPowerBombs                                   ;8F9E24;
    dw EnemyPopulations_PinkBrinstarPowerBombs                           ;8F9E26;
    dw EnemySets_PinkBrinstarPowerBombs                                  ;8F9E28;
    db $C1,$C1                                                           ;8F9E2A;
    dw RoomScrolls_PinkBrinstarPowerBombs                                ;8F9E2C;
    dw $0000                                                             ;8F9E2E;
    dw $0000                                                             ;8F9E30;
    dw PLMPopulation_PinkBrinstarPowerBombs                              ;8F9E32;
    dw LibBG_Brinstar_6_ThinHorizontalPattern                            ;8F9E34;
    dw RTS_8F91D5                                                        ;8F9E36;

RoomDoors_PinkBrinstarPowerBombs:
    dw Door_PinkBrinstarPowerBombs_0                                     ;8F9E38;
    dw Door_PinkBrinstarPowerBombs_1                                     ;8F9E3A;

RoomScrolls_PinkBrinstarPowerBombs:
    db $01,$01,$00,$00                                                   ;8F9E3C;

RoomPLM_PinkBrinstarPowerBombs_0:
    db $00,$02,$01,$00,$02,$01,$03,$01,$80                               ;8F9E40;

RoomPLM_PinkBrinstarPowerBombs_1:
    db $00,$01,$01,$01,$02,$00,$03,$00,$80                               ;8F9E49;

RoomHeader_GreenHillZone:
    db $0D,$01,$13,$0A,$08,$04,$70,$A0,$00                               ;8F9E52;
    dw RoomDoors_GreenHillZone                                           ;8F9E5B;
    dw Use_StatePointer_inX                                              ;8F9E5D;

RoomState_GreenHillZone:
    dl LevelData_GreenHillZone                                           ;8F9E5F;
    db $06,$0F,$05                                                       ;8F9E62;
    dw FXHeader_GreenHillZone                                            ;8F9E65;
    dw EnemyPopulations_GreenHillZone                                    ;8F9E67;
    dw EnemySets_GreenHillZone                                           ;8F9E69;
    db $C1,$C1                                                           ;8F9E6B;
    dw RoomScrolls_GreenHillZone                                         ;8F9E6D;
    dw $0000                                                             ;8F9E6F;
    dw $0000                                                             ;8F9E71;
    dw PLMPopulation_GreenHillZone                                       ;8F9E73;
    dw LibBG_Brinstar_6_SpheresPattern                                   ;8F9E75;
    dw RTS_8F91D5                                                        ;8F9E77;

RoomDoors_GreenHillZone:
    dw Door_GreenHillZone_0                                              ;8F9E79;
    dw Door_GreenHillZone_1                                              ;8F9E7B;
    dw Door_GreenHillZone_2                                              ;8F9E7D;

RoomScrolls_GreenHillZone:
    db $02,$02,$00,$00,$00,$00,$00,$00,$02,$02,$02,$02,$00,$00,$00,$00   ;8F9E7F;
    db $02,$02,$02,$02,$02,$02,$02,$02,$01,$01,$01,$01,$01,$01,$01,$01   ;8F9E8F;

RoomHeader_MorphBall:
    db $0E,$01,$15,$08,$08,$03,$70,$A0,$00                               ;8F9E9F;
    dw RoomDoors_MorphBall                                               ;8F9EA8;
    dw RoomStateCheck_EventHasBeenSet                                    ;8F9EAA;
    db $00                                                               ;8F9EAC;
    dw RoomState_MorphBall_1                                             ;8F9EAD;
    dw Use_StatePointer_inX                                              ;8F9EAF;

RoomState_MorphBall_0:
    dl LevelData_MorphBall                                               ;8F9EB1;
    db $06,$06,$07                                                       ;8F9EB4;
    dw FXHeader_MorphBall_State0                                         ;8F9EB7;
    dw EnemyPopulations_MorphBall_0                                      ;8F9EB9;
    dw EnemySets_MorphBall_0                                             ;8F9EBB;
    db $C1,$C1                                                           ;8F9EBD;
    dw RoomScrolls_MorphBall                                             ;8F9EBF;
    dw $0000                                                             ;8F9EC1;
    dw $0000                                                             ;8F9EC3;
    dw PLMPopulation_MorphBall_State0                                    ;8F9EC5;
    dw LibBG_Brinstar_6_SmallPattern_Variety_0                           ;8F9EC7;
    dw RTS_8F91D5                                                        ;8F9EC9;

RoomState_MorphBall_1:
    dl LevelData_MorphBall                                               ;8F9ECB;
    db $06,$09,$05                                                       ;8F9ECE;
    dw FXHeader_VariousRooms_8381F4                                      ;8F9ED1;
    dw EnemyPopulations_MorphBall_1                                      ;8F9ED3;
    dw EnemySets_MorphBall_1                                             ;8F9ED5;
    db $C1,$C1                                                           ;8F9ED7;
    dw RoomScrolls_MorphBall                                             ;8F9ED9;
    dw $0000                                                             ;8F9EDB;
    dw $0000                                                             ;8F9EDD;
    dw PLMPopulation_MorphBall_State1                                    ;8F9EDF;
    dw LibBG_Brinstar_6_SmallPattern_Variety_0                           ;8F9EE1;
    dw RTS_8F91BC                                                        ;8F9EE3;

RoomDoors_MorphBall:
    dw Door_MorphBall_0                                                  ;8F9EE5;
    dw Door_MorphBall_1                                                  ;8F9EE7;
    dw Door_MorphBall_2                                                  ;8F9EE9;
    dw Door_VariousRooms_Elevator                                        ;8F9EEB;

RoomScrolls_MorphBall:
    db $00,$00,$00,$00,$00,$02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8F9EED;
    db $01,$01,$01,$01,$01,$01,$01,$01                                   ;8F9EFD;

RoomPLM_MorphBall_0:
    db $12,$01,$80                                                       ;8F9F05;

RoomPLM_MorphBall_9:
    db $12,$00,$80                                                       ;8F9F08;

RoomPLM_MorphBall_B_D:
    db $0D,$02,$80                                                       ;8F9F0B;

RoomPLM_MorphBall_F:
    db $0D,$00,$80                                                       ;8F9F0E;

RoomHeader_ConstructionZone:
    db $0F,$01,$1D,$0A,$01,$02,$70,$A0,$00                               ;8F9F11;
    dw RoomDoors_ConstructionZone                                        ;8F9F1A;
    dw RoomStateCheck_EventHasBeenSet                                    ;8F9F1C;
    db $00                                                               ;8F9F1E;
    dw RoomState_ConstructionZone_1                                      ;8F9F1F;
    dw Use_StatePointer_inX                                              ;8F9F21;

RoomState_ConstructionZone_0:
    dl LevelData_ConstructionZone                                        ;8F9F23;
    db $06,$00,$00                                                       ;8F9F26;
    dw FXHeader_ConstructionZone_State0                                  ;8F9F29;
    dw EnemyPopulations_ConstructionZone_0                               ;8F9F2B;
    dw EnemySets_ConstructionZone_0                                      ;8F9F2D;
    db $C1,$C1                                                           ;8F9F2F;
    dw RoomScrolls_ConstructionZone                                      ;8F9F31;
    dw $0000                                                             ;8F9F33;
    dw $0000                                                             ;8F9F35;
    dw PLMPopulation_ConstructionZone_State0_1                           ;8F9F37;
    dw LibBG_Brinstar_6_SmallPattern                                     ;8F9F39;
    dw RTS_8F91D5                                                        ;8F9F3B;

RoomState_ConstructionZone_1:
    dl LevelData_ConstructionZone                                        ;8F9F3D;
    db $06,$00,$00                                                       ;8F9F40;
    dw FXHeader_VariousRooms_8381F4                                      ;8F9F43;
    dw EnemyPopulations_ConstructionZone_1                               ;8F9F45;
    dw EnemySets_ConstructionZone_1                                      ;8F9F47;
    db $C1,$C1                                                           ;8F9F49;
    dw RoomScrolls_ConstructionZone                                      ;8F9F4B;
    dw $0000                                                             ;8F9F4D;
    dw $0000                                                             ;8F9F4F;
    dw PLMPopulation_ConstructionZone_State0_1                           ;8F9F51;
    dw LibBG_Brinstar_6_SmallPattern                                     ;8F9F53;
    dw RTS_8F91BC                                                        ;8F9F55;

RoomDoors_ConstructionZone:
    dw Door_ConstructionZone_0                                           ;8F9F57;
    dw Door_ConstructionZone_1                                           ;8F9F59;
    dw Door_ConstructionZone_2                                           ;8F9F5B;

RoomScrolls_ConstructionZone:
    db $01,$00                                                           ;8F9F5D;

RoomPLM_ConstructionZone_0:
    db $00,$02,$01,$01,$80                                               ;8F9F5F;

RoomHeader_BlueBrinstarETank:
    db $10,$01,$1E,$08,$03,$03,$70,$A0,$00                               ;8F9F64;
    dw RoomDoors_BlueBrinstarETank                                       ;8F9F6D;
    dw RoomStateCheck_EventHasBeenSet                                    ;8F9F6F;
    db $00                                                               ;8F9F71;
    dw RoomState_BlueBrinstarETank_1                                     ;8F9F72;
    dw Use_StatePointer_inX                                              ;8F9F74;

RoomState_BlueBrinstarETank_0:
    dl LevelData_BlueBrinstarETank                                       ;8F9F76;
    db $06,$00,$00                                                       ;8F9F79;
    dw FXHeader_BlueBrinstarETank_State0                                 ;8F9F7C;
    dw EnemyPopulations_BlueBrinstarETank_0                              ;8F9F7E;
    dw EnemySets_BlueBrinstarETank_0                                     ;8F9F80;
    db $C1,$C1                                                           ;8F9F82;
    dw RoomScrolls_BlueBrinstarETank                                     ;8F9F84;
    dw $0000                                                             ;8F9F86;
    dw $0000                                                             ;8F9F88;
    dw PLMPopulation_BlueBrinstarETank_State0_1                          ;8F9F8A;
    dw LibBG_Brinstar_6_SmallPattern_Variety_0                           ;8F9F8C;
    dw RTS_8F91D5                                                        ;8F9F8E;

RoomState_BlueBrinstarETank_1:
    dl LevelData_BlueBrinstarETank                                       ;8F9F90;
    db $06,$00,$00                                                       ;8F9F93;
    dw FXHeader_VariousRooms_8381F4                                      ;8F9F96;
    dw EnemyPopulations_BlueBrinstarETank_1                              ;8F9F98;
    dw EnemySets_BlueBrinstarETank_1                                     ;8F9F9A;
    db $C1,$C1                                                           ;8F9F9C;
    dw RoomScrolls_BlueBrinstarETank                                     ;8F9F9E;
    dw $0000                                                             ;8F9FA0;
    dw $0000                                                             ;8F9FA2;
    dw PLMPopulation_BlueBrinstarETank_State0_1                          ;8F9FA4;
    dw LibBG_Brinstar_6_SmallPattern_Variety_0                           ;8F9FA6;
    dw RTS_8F91BC                                                        ;8F9FA8;

RoomDoors_BlueBrinstarETank:
    dw Door_BlueBrinstarETank_0                                          ;8F9FAA;
    dw Door_BlueBrinstarETank_1                                          ;8F9FAC;

RoomScrolls_BlueBrinstarETank:
    db $00,$00,$02,$00,$00,$00,$01,$01,$01                               ;8F9FAE;

RoomPLM_BlueBrinstarETank_0_1:
    db $05,$02,$80                                                       ;8F9FB7;

RoomHeader_NoobBridge:
    db $11,$01,$1B,$0D,$06,$01,$70,$A0,$00                               ;8F9FBA;
    dw RoomDoors_NoobBridge                                              ;8F9FC3;
    dw Use_StatePointer_inX                                              ;8F9FC5;

RoomState_NoobBridge:
    dl LevelData_NoobBridge                                              ;8F9FC7;
    db $06,$0F,$05                                                       ;8F9FCA;
    dw FXHeader_NoobBridge                                               ;8F9FCD;
    dw EnemyPopulations_NoobBridge                                       ;8F9FCF;
    dw EnemySets_NoobBridge                                              ;8F9FD1;
    db $C1,$C1                                                           ;8F9FD3;
    dw $0000                                                             ;8F9FD5;
    dw $0000                                                             ;8F9FD7;
    dw $0000                                                             ;8F9FD9;
    dw PLMPopulation_NoobBridge                                          ;8F9FDB;
    dw LibBG_Brinstar_6_Horizontal_GlowPatches                           ;8F9FDD;
    dw RTS_8F91D5                                                        ;8F9FDF;

RoomDoors_NoobBridge:
    dw Door_NoobBridge_0                                                 ;8F9FE1;
    dw Door_NoobBridge_1                                                 ;8F9FE3;

RoomHeader_GreenBrinstarBeetoms:
    db $12,$01,$08,$0A,$01,$01,$70,$A0,$00                               ;8F9FE5;
    dw RoomDoors_GreenBrinstarBeetoms                                    ;8F9FEE;
    dw Use_StatePointer_inX                                              ;8F9FF0;

RoomState_GreenBrinstarBeetoms:
    dl LevelData_GreenBrinstarBeetoms                                    ;8F9FF2;
    db $06,$00,$00                                                       ;8F9FF5;
    dw FXHeader_GreenBrinstarBeetoms                                     ;8F9FF8;
    dw EnemyPopulations_GreenBrinstarBeetoms                             ;8F9FFA;
    dw EnemySets_GreenBrinstarBeetoms                                    ;8F9FFC;
    db $01,$01                                                           ;8F9FFE;
    dw RoomScrolls_GreenBrinstarBeetoms                                  ;8FA000;
    dw $0000                                                             ;8FA002;
    dw $0000                                                             ;8FA004;
    dw PLMPopulation_GreenBrinstarBeetoms                                ;8FA006;
    dw LibBG_Brinstar_6_Horizontal_GlowPatches                           ;8FA008;
    dw RTS_8F91D5                                                        ;8FA00A;

RoomDoors_GreenBrinstarBeetoms:
    dw Door_GreenBrinstarBeetoms_0                                       ;8FA00C;
    dw Door_GreenBrinstarBeetoms_1                                       ;8FA00E;

RoomScrolls_GreenBrinstarBeetoms:
    db $01                                                               ;8FA010;

RoomHeader_EtecoonETank:
    db $13,$01,$06,$0A,$05,$02,$70,$A0,$00                               ;8FA011;
    dw RoomDoors_EtecoonETank                                            ;8FA01A;
    dw Use_StatePointer_inX                                              ;8FA01C;

RoomState_EtecoonETank:
    dl LevelData_EtecoonETank                                            ;8FA01E;
    db $06,$00,$00                                                       ;8FA021;
    dw FXHeader_EtecoonETank                                             ;8FA024;
    dw EnemyPopulations_EtecoonETank                                     ;8FA026;
    dw EnemySets_EtecoonETank                                            ;8FA028;
    db $C1,$C1                                                           ;8FA02A;
    dw RoomScrolls_EtecoonETank                                          ;8FA02C;
    dw $0000                                                             ;8FA02E;
    dw $0000                                                             ;8FA030;
    dw PLMPopulation_EtecoonETank                                        ;8FA032;
    dw LibBG_Brinstar_6_Horizontal_GlowPatches                           ;8FA034;
    dw RTS_8F91D5                                                        ;8FA036;

RoomDoors_EtecoonETank:
    dw Door_EtecoonETank_0                                               ;8FA038;
    dw Door_EtecoonETank_1                                               ;8FA03A;
    dw Door_EtecoonETank_2                                               ;8FA03C;
    dw Door_EtecoonETank_3                                               ;8FA03E;

RoomScrolls_EtecoonETank:
    db $01,$01,$00,$00,$00,$00,$00,$01,$01,$01                           ;8FA040;

RoomPLM_EtecoonETank_0:
    db $01,$02,$05,$01,$06,$01,$80                                       ;8FA04A;

RoomHeader_EtecoonSuper:
    db $14,$01,$05,$0A,$01,$01,$70,$A0,$00                               ;8FA051;
    dw RoomDoors_EtecoonSuper                                            ;8FA05A;
    dw Use_StatePointer_inX                                              ;8FA05C;

RoomState_EtecoonSuper:
    dl LevelData_EtecoonSuper                                            ;8FA05E;
    db $06,$00,$00                                                       ;8FA061;
    dw FXHeader_EtecoonSuper                                             ;8FA064;
    dw EnemyPopulations_EtecoonSuper                                     ;8FA066;
    dw EnemySets_EtecoonSuper                                            ;8FA068;
    db $01,$01                                                           ;8FA06A;
    dw RoomScrolls_EtecoonSuper                                          ;8FA06C;
    dw $0000                                                             ;8FA06E;
    dw $0000                                                             ;8FA070;
    dw PLMPopulation_EtecoonSuper                                        ;8FA072;
    dw LibBG_Brinstar_6_Horizontal_GlowPatches                           ;8FA074;
    dw RTS_8F91D5                                                        ;8FA076;

RoomDoors_EtecoonSuper:
    dw Door_EtecoonSuper_0                                               ;8FA078;

RoomScrolls_EtecoonSuper:
    db $01                                                               ;8FA07A;

RoomHeader_DachoraEnergyRefill:
    db $15,$01,$09,$0C,$01,$01,$70,$A0,$00                               ;8FA07B;
    dw RoomDoors_DachoraEnergyRefill                                     ;8FA084;
    dw Use_StatePointer_inX                                              ;8FA086;

RoomState_DachoraEnergyRefill:
    dl LevelData_EnergyRefill_RightSideDoor                              ;8FA088;
    db $17,$00,$00                                                       ;8FA08B;
    dw FXHeader_DachoraEnergyRefill                                      ;8FA08E;
    dw EnemyPopulations_DachoraEnergyRefill                              ;8FA090;
    dw EnemySets_DachoraEnergyRefill                                     ;8FA092;
    db $00,$00                                                           ;8FA094;
    dw $0000                                                             ;8FA096;
    dw $0000                                                             ;8FA098;
    dw $0000                                                             ;8FA09A;
    dw PLMPopulation_DachoraEnergyRefill                                 ;8FA09C;
    dw $0000                                                             ;8FA09E;
    dw RTS_8F91D5                                                        ;8FA0A0;

RoomDoors_DachoraEnergyRefill:
    dw Door_DachoraEnergyRefill_0                                        ;8FA0A2;

RoomHeader_SporeSpawnFarming:
    db $16,$01,$14,$09,$03,$01,$70,$A0,$00                               ;8FA0A4;
    dw RoomDoors_SporeSpawnFarming                                       ;8FA0AD;
    dw Use_StatePointer_inX                                              ;8FA0AF;

RoomState_SporeSpawnFarming:
    dl LevelData_SporeSpawnFarming                                       ;8FA0B1;
    db $06,$0F,$05                                                       ;8FA0B4;
    dw FXHeader_SporeSpawnFarming                                        ;8FA0B7;
    dw EnemyPopulations_SporeSpawnFarming                                ;8FA0B9;
    dw EnemySets_SporeSpawnFarming                                       ;8FA0BB;
    db $C0,$00                                                           ;8FA0BD;
    dw RoomScrolls_SporeSpawnFarming                                     ;8FA0BF;
    dw $0000                                                             ;8FA0C1;
    dw $0000                                                             ;8FA0C3;
    dw PLMPopulation_SporeSpawnFarming                                   ;8FA0C5;
    dw $0000                                                             ;8FA0C7;
    dw RTS_8F91D5                                                        ;8FA0C9;

RoomDoors_SporeSpawnFarming:
    dw Door_SporeSpawnFarming_0                                          ;8FA0CB;
    dw Door_SporeSpawnFarming_1                                          ;8FA0CD;

RoomScrolls_SporeSpawnFarming:
    db $01,$01,$01                                                       ;8FA0CF;

RoomHeader_WaterwayETank:
    db $17,$01,$08,$0D,$07,$01,$70,$A0,$00                               ;8FA0D2;
    dw RoomDoors_WaterwayETank                                           ;8FA0DB;
    dw Use_StatePointer_inX                                              ;8FA0DD;

RoomState_WaterwayETank:
    dl LevelData_WaterwayETank                                           ;8FA0DF;
    db $06,$00,$00                                                       ;8FA0E2;
    dw FXHeader_WaterwayETank                                            ;8FA0E5;
    dw EnemyPopulations_WaterwayETank                                    ;8FA0E7;
    dw EnemySets_WaterwayETank                                           ;8FA0E9;
    db $C1,$01                                                           ;8FA0EB;
    dw RoomScrolls_WaterwayETank                                         ;8FA0ED;
    dw $0000                                                             ;8FA0EF;
    dw $0000                                                             ;8FA0F1;
    dw PLMPopulation_WaterwayETank                                       ;8FA0F3;
    dw LibBG_Brinstar_6_ThinHorizontalPattern                            ;8FA0F5;
    dw RTS_8F91D5                                                        ;8FA0F7;

RoomDoors_WaterwayETank:
    dw Door_WaterwayETank_0                                              ;8FA0F9;
    dw Door_WaterwayETank_1                                              ;8FA0FB;

RoomScrolls_WaterwayETank:
    db $00,$01,$01,$01,$01,$01,$01                                       ;8FA0FD;

RoomPLM_WaterwayETank:
    db $00,$01,$80                                                       ;8FA104;

RoomHeader_FirstMissile:
    db $18,$01,$1C,$0B,$01,$01,$70,$A0,$00                               ;8FA107;
    dw RoomDoors_FirstMissile                                            ;8FA110;
    dw Use_StatePointer_inX                                              ;8FA112;

RoomState_FirstMissile:
    dl LevelData_FirstMissile                                            ;8FA114;
    db $06,$00,$00                                                       ;8FA117;
    dw FXHeader_FirstMissile                                             ;8FA11A;
    dw EnemyPopulations_FirstMissile                                     ;8FA11C;
    dw EnemySets_FirstMissile                                            ;8FA11E;
    db $01,$01                                                           ;8FA120;
    dw $0000                                                             ;8FA122;
    dw $0000                                                             ;8FA124;
    dw $0000                                                             ;8FA126;
    dw PLMPopulation_FirstMissile                                        ;8FA128;
    dw LibBG_Brinstar_6_SmallPattern                                     ;8FA12A;
    dw RTS_8F91D5                                                        ;8FA12C;

RoomDoors_FirstMissile:
    dw Door_FirstMissile_0                                               ;8FA12E;

RoomHeader_PinkBrinstarHoppers:
    db $19,$01,$13,$07,$02,$02,$70,$A0,$00                               ;8FA130;
    dw RoomDoors_PinkBrinstarHoppers                                     ;8FA139;
    dw Use_StatePointer_inX                                              ;8FA13B;

RoomState_PinkBrinstarHoppers:
    dl LevelData_PinkBrinstarHoppers                                     ;8FA13D;
    db $06,$00,$00                                                       ;8FA140;
    dw FXHeader_PinkBrinstarHoppers                                      ;8FA143;
    dw EnemyPopulations_PinkBrinstarHoppers                              ;8FA145;
    dw EnemySets_PinkBrinstarHoppers                                     ;8FA147;
    db $C1,$C1                                                           ;8FA149;
    dw $0000                                                             ;8FA14B;
    dw $0000                                                             ;8FA14D;
    dw $0000                                                             ;8FA14F;
    dw PLMPopulation_PinkBrinstarHoppers                                 ;8FA151;
    dw LibBG_Brinstar_6_ThinHorizontalPattern                            ;8FA153;
    dw RTS_8F91D5                                                        ;8FA155;

RoomDoors_PinkBrinstarHoppers:
    dw Door_PinkBrinstarHoppers_0                                        ;8FA157;
    dw Door_PinkBrinstarHoppers_1                                        ;8FA159;

RoomHeader_HopperETank:
    db $1A,$01,$15,$08,$01,$01,$70,$A0,$00                               ;8FA15B;
    dw RoomDoors_HopperETank                                             ;8FA164;
    dw Use_StatePointer_inX                                              ;8FA166;

RoomState_HopperETank:
    dl LevelData_HopperETank                                             ;8FA168;
    db $06,$00,$00                                                       ;8FA16B;
    dw FXHeader_HopperETank                                              ;8FA16E;
    dw EnemyPopulations_HopperETank                                      ;8FA170;
    dw EnemySets_HopperETank                                             ;8FA172;
    db $00,$00                                                           ;8FA174;
    dw $0000                                                             ;8FA176;
    dw $0000                                                             ;8FA178;
    dw $0000                                                             ;8FA17A;
    dw PLMPopulation_HopperETank                                         ;8FA17C;
    dw $0000                                                             ;8FA17E;
    dw RTS_8F91D5                                                        ;8FA180;

RoomDoors_HopperETank:
    dw Door_HopperETank_0                                                ;8FA182;

RoomHeader_BigPinkSaveRoom:
    db $1B,$01,$0F,$04,$01,$01,$70,$A0,$00                               ;8FA184;
    dw RoomDoors_BigPinkSaveRoom                                         ;8FA18D;
    dw Use_StatePointer_inX                                              ;8FA18F;

RoomState_BigPinkSaveRoom:
    dl LevelData_SaveStation_RightSideDoor                               ;8FA191;
    db $19,$0F,$05                                                       ;8FA194;
    dw FXHeader_BigPinkSaveRoom                                          ;8FA197;
    dw EnemyPopulations_BigPinkSaveRoom                                  ;8FA199;
    dw EnemySets_BigPinkSaveRoom                                         ;8FA19B;
    db $00,$00                                                           ;8FA19D;
    dw $0000                                                             ;8FA19F;
    dw $0000                                                             ;8FA1A1;
    dw $0000                                                             ;8FA1A3;
    dw PLMPopulation_BigPinkSaveRoom                                     ;8FA1A5;
    dw $0000                                                             ;8FA1A7;
    dw RTS_8F91D5                                                        ;8FA1A9;

RoomDoors_BigPinkSaveRoom:
    dw Door_BigPinkSaveRoom_0                                            ;8FA1AB;

RoomHeader_BlueBrinstarBoulders:
    db $1C,$01,$1E,$08,$02,$01,$70,$A0,$00                               ;8FA1AD;
    dw RoomDoors_BlueBrinstarBoulders                                    ;8FA1B6;
    dw Use_StatePointer_inX                                              ;8FA1B8;

RoomState_BlueBrinstarBoulders:
    dl LevelData_BlueBrinstarBoulders                                    ;8FA1BA;
    db $06,$00,$00                                                       ;8FA1BD;
    dw FXHeader_BlueBrinstarBoulders                                     ;8FA1C0;
    dw EnemyPopulations_BlueBrinstarBoulders                             ;8FA1C2;
    dw EnemySets_BlueBrinstarBoulders                                    ;8FA1C4;
    db $C1,$01                                                           ;8FA1C6;
    dw $0000                                                             ;8FA1C8;
    dw $0000                                                             ;8FA1CA;
    dw $0000                                                             ;8FA1CC;
    dw PLMPopulation_BlueBrinstarBoulders                                ;8FA1CE;
    dw LibBG_Brinstar_6_SmallPattern_Variety_0                           ;8FA1D0;
    dw RTS_8F91D5                                                        ;8FA1D2;

RoomDoors_BlueBrinstarBoulders:
    dw Door_BlueBrinstarBoulders_0                                       ;8FA1D4;
    dw Door_BlueBrinstarBoulders_1                                       ;8FA1D6;

RoomHeader_BillyMays:
    db $1D,$01,$1D,$08,$01,$01,$70,$A0,$00                               ;8FA1D8;
    dw RoomDoors_BillyMays                                               ;8FA1E1;
    dw Use_StatePointer_inX                                              ;8FA1E3;

RoomState_BillyMays:
    dl LevelData_BillyMays                                               ;8FA1E5;
    db $06,$00,$00                                                       ;8FA1E8;
    dw FXHeader_BillyMays                                                ;8FA1EB;
    dw EnemyPopulations_BillyMays                                        ;8FA1ED;
    dw EnemySets_BillyMays                                               ;8FA1EF;
    db $01,$01                                                           ;8FA1F1;
    dw $0000                                                             ;8FA1F3;
    dw $0000                                                             ;8FA1F5;
    dw $0000                                                             ;8FA1F7;
    dw PLMPopulation_BillyMays                                           ;8FA1F9;
    dw LibBG_Brinstar_6_SmallPattern_Variety_0                           ;8FA1FB;
    dw RTS_8F91D5                                                        ;8FA1FD;

RoomDoors_BillyMays:
    dw Door_BillyMays_0                                                  ;8FA1FF;

RoomHeader_GreenBrinstarSave:
    db $1E,$01,$08,$05,$01,$01,$70,$A0,$00                               ;8FA201;
    dw RoomDoors_GreenBrinstarSave                                       ;8FA20A;
    dw Use_StatePointer_inX                                              ;8FA20C;

RoomState_GreenBrinstarSave:
    dl LevelData_SaveStation_RightSideDoor                               ;8FA20E;
    db $19,$0F,$05                                                       ;8FA211;
    dw FXHeader_GreenBrinstarSave                                        ;8FA214;
    dw EnemyPopulations_GreenBrinstarSave                                ;8FA216;
    dw EnemySets_GreenBrinstarSave                                       ;8FA218;
    db $00,$00                                                           ;8FA21A;
    dw $0000                                                             ;8FA21C;
    dw $0000                                                             ;8FA21E;
    dw $0000                                                             ;8FA220;
    dw PLMPopulation_GreenBrinstarSave                                   ;8FA222;
    dw $0000                                                             ;8FA224;
    dw RTS_8F91D5                                                        ;8FA226;

RoomDoors_GreenBrinstarSave:
    dw Door_GreenBrinstarSave_0                                          ;8FA228;

RoomHeader_EtecoonSave:
    db $1F,$01,$05,$0B,$01,$01,$70,$A0,$00                               ;8FA22A;
    dw RoomDoors_EtecoonSave                                             ;8FA233;
    dw Use_StatePointer_inX                                              ;8FA235;

RoomState_EtecoonSave:
    dl LevelData_SaveStation_RightSideDoor                               ;8FA237;
    db $19,$0F,$05                                                       ;8FA23A;
    dw FXHeader_EtecoonSave                                              ;8FA23D;
    dw EnemyPopulations_EtecoonSave                                      ;8FA23F;
    dw EnemySets_EtecoonSave                                             ;8FA241;
    db $00,$00                                                           ;8FA243;
    dw $0000                                                             ;8FA245;
    dw $0000                                                             ;8FA247;
    dw $0000                                                             ;8FA249;
    dw PLMPopulation_EtecoonSave                                         ;8FA24B;
    dw $0000                                                             ;8FA24D;
    dw RTS_8F91D5                                                        ;8FA24F;

RoomDoors_EtecoonSave:
    dw Door_EtecoonSave_0                                                ;8FA251;

RoomHeader_RedTower:
    db $20,$01,$21,$09,$01,$0A,$70,$A0,$00                               ;8FA253;
    dw RoomDoors_RedTower                                                ;8FA25C;
    dw Use_StatePointer_inX                                              ;8FA25E;

RoomState_RedTower:
    dl LevelData_RedTower                                                ;8FA260;
    db $07,$12,$05                                                       ;8FA263;
    dw FXHeader_RedTower                                                 ;8FA266;
    dw EnemyPopulations_RedTower                                         ;8FA268;
    dw EnemySets_RedTower                                                ;8FA26A;
    db $C1,$C1                                                           ;8FA26C;
    dw RoomScrolls_RedTower                                              ;8FA26E;
    dw $0000                                                             ;8FA270;
    dw $0000                                                             ;8FA272;
    dw PLMPopulation_RedTower                                            ;8FA274;
    dw LibBG_Brinstar_7_WideVerticalTower_Brick_0                        ;8FA276;
    dw RTS_8F91D6                                                        ;8FA278;

RoomDoors_RedTower:
    dw Door_RedTower_0                                                   ;8FA27A;
    dw Door_RedTower_1                                                   ;8FA27C;
    dw Door_RedTower_2                                                   ;8FA27E;
    dw Door_RedTower_3                                                   ;8FA280;
    dw Door_RedTower_4                                                   ;8FA282;

RoomScrolls_RedTower:
    db $02,$02,$02,$02,$02,$02,$01,$00,$02,$02                           ;8FA284;

RoomPLM_RedTower_0:
    db $06,$02,$07,$02,$80                                               ;8FA28E;

RoomHeader_RedBrinstarFirefleas:
    db $21,$01,$19,$0F,$08,$02,$90,$A0,$00                               ;8FA293;
    dw RoomDoors_RedBrinstarFirefleas                                    ;8FA29C;
    dw Use_StatePointer_inX                                              ;8FA29E;

RoomState_RedBrinstarFirefleas:
    dl LevelData_RedBrinstarFirefleas                                    ;8FA2A0;
    db $07,$00,$05                                                       ;8FA2A3;
    dw FXHeader_RedBrinstarFirefleas                                     ;8FA2A6;
    dw EnemyPopulations_RedBrinstarFirefleas                             ;8FA2A8;
    dw EnemySets_RedBrinstarFirefleas                                    ;8FA2AA;
    db $00,$00                                                           ;8FA2AC;
    dw RoomScrolls_RedBrinstarFirefleas                                  ;8FA2AE;
    dw $0000                                                             ;8FA2B0;
    dw $0000                                                             ;8FA2B2;
    dw PLMPopulation_RedBrinstarFirefleas                                ;8FA2B4;
    dw $0000                                                             ;8FA2B6;
    dw RTS_8F91D6                                                        ;8FA2B8;

RoomDoors_RedBrinstarFirefleas:
    dw Door_RedBrinstarFirefleas_0                                       ;8FA2BA;
    dw Door_RedBrinstarFirefleas_1                                       ;8FA2BC;

RoomScrolls_RedBrinstarFirefleas:
    db $02,$02,$01,$01,$02,$02,$01,$01,$01,$01,$00,$00,$01,$01,$00,$00   ;8FA2BE;

RoomHeader_XrayScope:
    db $22,$01,$17,$0F,$02,$01,$70,$A0,$00                               ;8FA2CE;
    dw RoomDoors_XrayScope                                               ;8FA2D7;
    dw Use_StatePointer_inX                                              ;8FA2D9;

RoomState_XrayScope:
    dl LevelData_XrayScope                                               ;8FA2DB;
    db $07,$00,$03                                                       ;8FA2DE;
    dw FXHeader_XrayScope                                                ;8FA2E1;
    dw EnemyPopulations_XrayScope                                        ;8FA2E3;
    dw EnemySets_XrayScope                                               ;8FA2E5;
    db $C1,$C1                                                           ;8FA2E7;
    dw $0000                                                             ;8FA2E9;
    dw $0000                                                             ;8FA2EB;
    dw $0000                                                             ;8FA2ED;
    dw PLMPopulation_XrayScope                                           ;8FA2EF;
    dw LibBG_Brinstar_7_MechanicalRoom_SpikeFloor                        ;8FA2F1;
    dw RTS_8F91D6                                                        ;8FA2F3;

RoomDoors_XrayScope:
    dw Door_XrayScope_0                                                  ;8FA2F5;

RoomHeader_Hellway:
    db $23,$01,$22,$09,$03,$01,$70,$A0,$00                               ;8FA2F7;
    dw RoomDoors_Hellway                                                 ;8FA300;
    dw Use_StatePointer_inX                                              ;8FA302;

RoomState_Hellway:
    dl LevelData_Hellway                                                 ;8FA304;
    db $07,$00,$00                                                       ;8FA307;
    dw FXHeader_Hellway                                                  ;8FA30A;
    dw EnemyPopulations_Hellway                                          ;8FA30C;
    dw EnemySets_Hellway                                                 ;8FA30E;
    db $C1,$C1                                                           ;8FA310;
    dw $0000                                                             ;8FA312;
    dw $0000                                                             ;8FA314;
    dw $0000                                                             ;8FA316;
    dw PLMPopulation_Hellway                                             ;8FA318;
    dw LibBG_Brinstar_7_VerticalTower                                    ;8FA31A;
    dw RTS_8F91D6                                                        ;8FA31C;

RoomDoors_Hellway:
    dw Door_Hellway_0                                                    ;8FA31E;
    dw Door_Hellway_1                                                    ;8FA320;

RoomHeader_Caterpillar:
    db $24,$01,$25,$04,$03,$08,$70,$A0,$00                               ;8FA322;
    dw RoomDoors_Caterpillar                                             ;8FA32B;
    dw Use_StatePointer_inX                                              ;8FA32D;

RoomState_Caterpillar:
    dl LevelData_Caterpillar                                             ;8FA32F;
    db $07,$12,$05                                                       ;8FA332;
    dw FXHeader_Caterpillar                                              ;8FA335;
    dw EnemyPopulations_Caterpillar                                      ;8FA337;
    dw EnemySets_Caterpillar                                             ;8FA339;
    db $00,$00                                                           ;8FA33B;
    dw RoomScrolls_Caterpillar                                           ;8FA33D;
    dw $0000                                                             ;8FA33F;
    dw $0000                                                             ;8FA341;
    dw PLMPopulation_Caterpillar                                         ;8FA343;
    dw $0000                                                             ;8FA345;
    dw RTS_8F91D6                                                        ;8FA347;

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
    db $0F,$02,$12,$02,$80                                               ;8FA36F;

RoomPLM_Caterpillar_2:
    db $0A,$01,$09,$02,$80                                               ;8FA374;

RoomPLM_Caterpillar_3:
    db $0A,$00,$80                                                       ;8FA379;

RoomHeader_BetaPowerBomb:
    db $25,$01,$23,$07,$02,$02,$70,$A0,$00                               ;8FA37C;
    dw RoomDoors_BetaPowerBomb                                           ;8FA385;
    dw Use_StatePointer_inX                                              ;8FA387;

RoomState_BetaPowerBomb:
    dl LevelData_BetaPowerBomb                                           ;8FA389;
    db $07,$00,$00                                                       ;8FA38C;
    dw FXHeader_BetaPowerBomb                                            ;8FA38F;
    dw EnemyPopulations_BetaPowerBomb                                    ;8FA391;
    dw EnemySets_BetaPowerBomb                                           ;8FA393;
    db $C1,$C1                                                           ;8FA395;
    dw RoomScrolls_BetaPowerBomb                                         ;8FA397;
    dw $0000                                                             ;8FA399;
    dw $0000                                                             ;8FA39B;
    dw PLMPopulation_BetaPowerBomb                                       ;8FA39D;
    dw LibBG_Brinstar_7_NarrowVerticalTower_Brick                        ;8FA39F;
    dw RTS_8F91D6                                                        ;8FA3A1;

RoomDoors_BetaPowerBomb:
    dw Door_BetaPowerBomb_0                                              ;8FA3A3;

RoomScrolls_BetaPowerBomb:
    db $01,$01,$00,$00                                                   ;8FA3A5;

RoomPLM_BetaPowerBomb_0:
    db $00,$02,$02,$01,$80                                               ;8FA3A9;

RoomHeader_AlphaPowerBomb:
    db $26,$01,$22,$0B,$03,$01,$70,$A0,$00                               ;8FA3AE;
    dw RoomDoors_AlphaPowerBomb                                          ;8FA3B7;
    dw Use_StatePointer_inX                                              ;8FA3B9;

RoomState_AlphaPowerBomb:
    dl LevelData_AlphaPowerBomb                                          ;8FA3BB;
    db $07,$00,$03                                                       ;8FA3BE;
    dw FXHeader_AlphaPowerBomb                                           ;8FA3C1;
    dw EnemyPopulations_AlphaPowerBomb                                   ;8FA3C3;
    dw EnemySets_AlphaPowerBomb                                          ;8FA3C5;
    db $C1,$C1                                                           ;8FA3C7;
    dw RoomScrolls_AlphaPowerBomb                                        ;8FA3C9;
    dw $0000                                                             ;8FA3CB;
    dw $0000                                                             ;8FA3CD;
    dw PLMPopulation_AlphaPowerBomb                                      ;8FA3CF;
    dw LibBG_Brinstar_7_BlueGridBlocks                                   ;8FA3D1;
    dw RTS_8F91D6                                                        ;8FA3D3;

RoomDoors_AlphaPowerBomb:
    dw Door_AlphaPowerBomb_0                                             ;8FA3D5;

RoomScrolls_AlphaPowerBomb:
    db $00,$01,$01                                                       ;8FA3D7;

RoomPLM_AlphaPowerBomb_8:
    db $00,$01,$80                                                       ;8FA3DA;

RoomHeader_SkreeBoost:
    db $27,$01,$22,$12,$02,$01,$70,$A0,$00                               ;8FA3DD;
    dw RoomDoors_SkreeBoost                                              ;8FA3E6;
    dw Use_StatePointer_inX                                              ;8FA3E8;

RoomState_SkreeBoost:
    dl LevelData_SkreeBoost                                              ;8FA3EA;
    db $07,$00,$00                                                       ;8FA3ED;
    dw FXHeader_SkreeBoost                                               ;8FA3F0;
    dw EnemyPopulations_SkreeBoost                                       ;8FA3F2;
    dw EnemySets_SkreeBoost                                              ;8FA3F4;
    db $C1,$C1                                                           ;8FA3F6;
    dw $0000                                                             ;8FA3F8;
    dw $0000                                                             ;8FA3FA;
    dw $0000                                                             ;8FA3FC;
    dw PLMPopulation_SkreeBoost                                          ;8FA3FE;
    dw LibBG_Brinstar_7_NarrowVerticalTower_Brick                        ;8FA400;
    dw RTS_8F91D6                                                        ;8FA402;

RoomDoors_SkreeBoost:
    dw Door_SkreeBoost_0                                                 ;8FA404;
    dw Door_SkreeBoost_1                                                 ;8FA406;

RoomHeader_BelowSpazer:
    db $28,$01,$24,$11,$02,$02,$70,$A0,$00                               ;8FA408;
    dw RoomDoors_BelowSpazer                                             ;8FA411;
    dw Use_StatePointer_inX                                              ;8FA413;

RoomState_BelowSpazer:
    dl LevelData_BelowSpazer                                             ;8FA415;
    db $07,$00,$05                                                       ;8FA418;
    dw FXHeader_BelowSpazer                                              ;8FA41B;
    dw EnemyPopulations_BelowSpazer                                      ;8FA41D;
    dw EnemySets_BelowSpazer                                             ;8FA41F;
    db $C1,$C1                                                           ;8FA421;
    dw RoomScrolls_BelowSpazer                                           ;8FA423;
    dw $0000                                                             ;8FA425;
    dw $0000                                                             ;8FA427;
    dw PLMPopulation_BelowSpazer                                         ;8FA429;
    dw LibBG_Brinstar_7_VerticalBrick_0                                  ;8FA42B;
    dw RTS_8F91D6                                                        ;8FA42D;

RoomDoors_BelowSpazer:
    dw Door_BelowSpazer_0                                                ;8FA42F;
    dw Door_BelowSpazer_1                                                ;8FA431;
    dw Door_BelowSpazer_2                                                ;8FA433;

RoomScrolls_BelowSpazer:
    db $00,$00,$01,$01                                                   ;8FA435;

RoomPLM_BelowSpazer_0_8_A:
    db $00,$02,$01,$02,$80                                               ;8FA439;

RoomPLM_BelowSpazer_4_9_B:
    db $00,$00,$01,$00,$02,$01,$03,$01,$80                               ;8FA43E;

RoomHeader_Spazer:
    db $29,$01,$26,$11,$01,$01,$70,$A0,$00                               ;8FA447;
    dw RoomDoors_Spazer                                                  ;8FA450;
    dw Use_StatePointer_inX                                              ;8FA452;

RoomState_Spazer:
    dl LevelData_Spazer                                                  ;8FA454;
    db $07,$00,$03                                                       ;8FA457;
    dw FXHeader_Spazer                                                   ;8FA45A;
    dw EnemyPopulations_Spazer                                           ;8FA45C;
    dw EnemySets_Spazer                                                  ;8FA45E;
    db $C1,$C1                                                           ;8FA460;
    dw RoomScrolls_Spazer                                                ;8FA462;
    dw $0000                                                             ;8FA464;
    dw $0000                                                             ;8FA466;
    dw PLMPopulation_Spazer                                              ;8FA468;
    dw LibBG_Brinstar_7_BlueGridBlocks                                   ;8FA46A;
    dw RTS_8F91D6                                                        ;8FA46C;

RoomDoors_Spazer:
    dw Door_Spazer_0                                                     ;8FA46E;

RoomScrolls_Spazer:
    db $01                                                               ;8FA470;

RoomHeader_WarehouseZeela:
    db $2A,$01,$2C,$12,$02,$02,$70,$A0,$00                               ;8FA471;
    dw RoomDoors_WarehouseZeela                                          ;8FA47A;
    dw Use_StatePointer_inX                                              ;8FA47C;

RoomState_WarehouseZeela:
    dl LevelData_WarehouseZeela                                          ;8FA47E;
    db $07,$00,$05                                                       ;8FA481;
    dw FXHeader_VariousRooms_8383D2                                      ;8FA484;
    dw EnemyPopulations_WarehouseZeela                                   ;8FA486;
    dw EnemySets_WarehouseZeela                                          ;8FA488;
    db $C0,$00                                                           ;8FA48A;
    dw RoomScrolls_WarehouseZeela                                        ;8FA48C;
    dw $0000                                                             ;8FA48E;
    dw $0000                                                             ;8FA490;
    dw PLMPopulation_WarehouseZeela                                      ;8FA492;
    dw $0000                                                             ;8FA494;
    dw RTS_8F91D6                                                        ;8FA496;

RoomDoors_WarehouseZeela:
    dw Door_WarehouseZeela_0                                             ;8FA498;
    dw Door_WarehouseZeela_1                                             ;8FA49A;
    dw Door_WarehouseZeela_2                                             ;8FA49C;

RoomScrolls_WarehouseZeela:
    db $01,$00,$00,$01                                                   ;8FA49E;

RoomPLM_WarehouseZeela_0:
    db $00,$02,$02,$01,$03,$00,$80                                       ;8FA4A2;

RoomPLM_WarehouseZeela_1_3:
    db $00,$02,$02,$01,$80                                               ;8FA4A9;

RoomPLM_WarehouseZeela_2:
    db $03,$01,$80                                                       ;8FA4AE;

RoomHeader_WarehouseETank:
    db $2B,$01,$2B,$13,$01,$01,$70,$A0,$00                               ;8FA4B1;
    dw RoomDoors_WarehouseETank                                          ;8FA4BA;
    dw Use_StatePointer_inX                                              ;8FA4BC;

RoomState_WarehouseETank:
    dl LevelData_WarehouseETank                                          ;8FA4BE;
    db $07,$00,$00                                                       ;8FA4C1;
    dw FXHeader_VariousRooms_8383D2                                      ;8FA4C4;
    dw EnemyPopulations_WarehouseETank                                   ;8FA4C6;
    dw EnemySets_WarehouseETank                                          ;8FA4C8;
    db $C0,$00                                                           ;8FA4CA;
    dw $0000                                                             ;8FA4CC;
    dw $0000                                                             ;8FA4CE;
    dw $0000                                                             ;8FA4D0;
    dw PLMPopulation_WarehouseETank                                      ;8FA4D2;
    dw $0000                                                             ;8FA4D4;
    dw RTS_8F91D6                                                        ;8FA4D6;

RoomDoors_WarehouseETank:
    dw Door_WarehouseETank_0                                             ;8FA4D8;

RoomHeader_WarehouseKihunter:
    db $2C,$01,$2D,$12,$04,$02,$70,$A0,$00                               ;8FA4DA;
    dw RoomDoors_WarehouseKihunter                                       ;8FA4E3;
    dw Use_StatePointer_inX                                              ;8FA4E5;

RoomState_WarehouseKihunter:
    dl LevelData_WarehouseKihunter                                       ;8FA4E7;
    db $07,$12,$05                                                       ;8FA4EA;
    dw FXHeader_VariousRooms_8383D2                                      ;8FA4ED;
    dw EnemyPopulations_WarehouseKihunter                                ;8FA4EF;
    dw EnemySets_WarehouseKihunter                                       ;8FA4F1;
    db $C0,$00                                                           ;8FA4F3;
    dw RoomScrolls_WarehouseKihunter                                     ;8FA4F5;
    dw $0000                                                             ;8FA4F7;
    dw $0000                                                             ;8FA4F9;
    dw PLMPopulation_WarehouseKihunter                                   ;8FA4FB;
    dw $0000                                                             ;8FA4FD;
    dw RTS_8F91D6                                                        ;8FA4FF;

RoomDoors_WarehouseKihunter:
    dw Door_WarehouseKihunter_0                                          ;8FA501;
    dw Door_WarehouseKihunter_1                                          ;8FA503;
    dw Door_WarehouseKihunter_2                                          ;8FA505;

RoomScrolls_WarehouseKihunter:
    db $02,$01,$01,$00,$00,$01,$00,$00                                   ;8FA507;

RoomPLM_WarehouseKihunter_0:
    db $01,$01,$05,$00,$80                                               ;8FA50F;

RoomPLM_WarehouseKihunter_1:
    db $01,$02,$05,$01,$80                                               ;8FA514;

RoomPLM_WarehouseKihunter_9:
    db $05,$00,$80                                                       ;8FA519;

RoomPLM_WarehouseKihunter_A_B:
    db $03,$01,$05,$00,$80                                               ;8FA51C;

RoomHeader_MiniKraid:
    db $2D,$01,$2F,$13,$06,$01,$70,$A0,$00                               ;8FA521;
    dw RoomDoors_MiniKraid                                               ;8FA52A;
    dw RoomStateCheck_BossIsDead                                         ;8FA52C;
    db $01                                                               ;8FA52E;
    dw RoomState_MiniKraid_1                                             ;8FA52F;
    dw Use_StatePointer_inX                                              ;8FA531;

RoomState_MiniKraid_0:
    dl LevelData_MiniKraid                                               ;8FA533;
    db $07,$27,$06                                                       ;8FA536;
    dw FXHeader_MiniKraid_State0_1                                       ;8FA539;
    dw EnemyPopulations_MiniKraid                                        ;8FA53B;
    dw EnemySets_MiniKraid                                               ;8FA53D;
    db $C1,$C1                                                           ;8FA53F;
    dw $0000                                                             ;8FA541;
    dw $0000                                                             ;8FA543;
    dw $0000                                                             ;8FA545;
    dw PLMPopulation_MiniKraid_State0_1                                  ;8FA547;
    dw LibBG_Brinstar_7_NarrowVerticalTower_Brick_Vines_0                ;8FA549;
    dw RTS_8F91D6                                                        ;8FA54B;

RoomState_MiniKraid_1:
    dl LevelData_MiniKraid                                               ;8FA54D;
    db $07,$27,$03                                                       ;8FA550;
    dw FXHeader_MiniKraid_State0_1                                       ;8FA553;
    dw EnemyPopulations_MiniKraid                                        ;8FA555;
    dw EnemySets_MiniKraid                                               ;8FA557;
    db $C1,$C1                                                           ;8FA559;
    dw $0000                                                             ;8FA55B;
    dw $0000                                                             ;8FA55D;
    dw $0000                                                             ;8FA55F;
    dw PLMPopulation_MiniKraid_State0_1                                  ;8FA561;
    dw LibBG_Brinstar_7_NarrowVerticalTower_Brick_Vines_0                ;8FA563;
    dw RTS_8F91D6                                                        ;8FA565;

RoomDoors_MiniKraid:
    dw Door_MiniKraid_0                                                  ;8FA567;
    dw Door_MiniKraid_1                                                  ;8FA569;

RoomHeader_KraidEyeDoor:
    db $2E,$01,$35,$12,$02,$02,$70,$A0,$02                               ;8FA56B;
    dw RoomDoors_KraidEyeDoor                                            ;8FA574;
    dw Use_StatePointer_inX                                              ;8FA576;

RoomState_KraidEyeDoor:
    dl LevelData_KraidEyeDoor                                            ;8FA578;
    db $07,$00,$00                                                       ;8FA57B;
    dw FXHeader_KraidEyeDoor                                             ;8FA57E;
    dw EnemyPopulations_KraidEyeDoor                                     ;8FA580;
    dw EnemySets_KraidEyeDoor                                            ;8FA582;
    db $00,$00                                                           ;8FA584;
    dw RoomScrolls_KraidEyeDoor                                          ;8FA586;
    dw $0000                                                             ;8FA588;
    dw $0000                                                             ;8FA58A;
    dw PLMPopulation_KraidEyeDoor                                        ;8FA58C;
    dw $0000                                                             ;8FA58E;
    dw RTS_8F91D6                                                        ;8FA590;

RoomDoors_KraidEyeDoor:
    dw Door_KraidEyeDoor_0                                               ;8FA592;
    dw Door_KraidEyeDoor_1                                               ;8FA594;
    dw Door_KraidEyeDoor_2                                               ;8FA596;

RoomScrolls_KraidEyeDoor:
    db $00,$00,$01,$01                                                   ;8FA598;

RoomPLM_KraidEyeDoor_0:
    db $00,$02,$80                                                       ;8FA59C;

RoomHeader_Kraid:
    db $2F,$01,$37,$12,$02,$02,$70,$A0,$05                               ;8FA59F;
    dw RoomDoors_Kraid                                                   ;8FA5A8;
    dw RoomStateCheck_BossIsDead                                         ;8FA5AA;
    db $01                                                               ;8FA5AC;
    dw RoomState_Kraid_1                                                 ;8FA5AD;
    dw Use_StatePointer_inX                                              ;8FA5AF;

RoomState_Kraid_0:
    dl LevelData_Kraid                                                   ;8FA5B1;
    db $1A,$27,$06                                                       ;8FA5B4;
    dw FXHeader_Kraid_State0                                             ;8FA5B7;
    dw EnemyPopulations_Kraid                                            ;8FA5B9;
    dw EnemySets_Kraid                                                   ;8FA5BB;
    db $01,$01                                                           ;8FA5BD;
    dw RoomScrolls_Kraid                                                 ;8FA5BF;
    dw $0000                                                             ;8FA5C1;
    dw $0000                                                             ;8FA5C3;
    dw PLMPopulation_Kraid_State0_1                                      ;8FA5C5;
    dw LibBG_Brinstar_1A_Kraid_Upper_Lower                               ;8FA5C7;
    dw RTS_8F91D6                                                        ;8FA5C9;

RoomState_Kraid_1:
    dl LevelData_Kraid                                                   ;8FA5CB;
    db $1A,$00,$00                                                       ;8FA5CE;
    dw FXHeader_Kraid_State0                                             ;8FA5D1;
    dw EnemyPopulations_Kraid                                            ;8FA5D3;
    dw EnemySets_Kraid                                                   ;8FA5D5;
    db $01,$01                                                           ;8FA5D7;
    dw RoomScrolls_Kraid                                                 ;8FA5D9;
    dw $0000                                                             ;8FA5DB;
    dw $0000                                                             ;8FA5DD;
    dw PLMPopulation_Kraid_State0_1                                      ;8FA5DF;
    dw LibBG_Standard_BG3_Tiles                                          ;8FA5E1;
    dw RTS_8F91D6                                                        ;8FA5E3;

RoomDoors_Kraid:
    dw Door_Kraid_0                                                      ;8FA5E5;
    dw Door_Kraid_1                                                      ;8FA5E7;

RoomScrolls_Kraid:
    db $02,$02,$01,$01                                                   ;8FA5E9;

RoomHeader_StatuesHallway:
    db $30,$00,$0C,$08,$05,$01,$70,$A0,$00                               ;8FA5ED;
    dw RoomDoors_StatuesHallway                                          ;8FA5F6;
    dw Use_StatePointer_inX                                              ;8FA5F8;

RoomState_StatuesHallway:
    dl LevelData_StatuesHallway                                          ;8FA5FA;
    db $08,$00,$04                                                       ;8FA5FD;
    dw FXHeader_Kraid_State1                                             ;8FA600;
    dw EnemyPopulations_StatuesHallway                                   ;8FA602;
    dw EnemySets_StatuesHallway                                          ;8FA604;
    db $C1,$C1                                                           ;8FA606;
    dw $0000                                                             ;8FA608;
    dw $0000                                                             ;8FA60A;
    dw $0000                                                             ;8FA60C;
    dw PLMPopulation_StatuesHallway                                      ;8FA60E;
    dw LibBG_Brinstar_8_NarrowVerticalTower_Brick_Grey_0                 ;8FA610;
    dw RTS_8F91D6                                                        ;8FA612;

RoomDoors_StatuesHallway:
    dw Door_StatuesHallway_0                                             ;8FA614;
    dw Door_StatuesHallway_1                                             ;8FA616;

RoomHeader_RedTowerRefill:
    db $31,$01,$20,$12,$01,$01,$70,$A0,$00                               ;8FA618;
    dw RoomDoors_RedTowerRefill                                          ;8FA621;
    dw Use_StatePointer_inX                                              ;8FA623;

RoomState_RedTowerRefill:
    dl LevelData_EnergyRefill_RightSideDoor                              ;8FA625;
    db $17,$00,$00                                                       ;8FA628;
    dw FXHeader_RedTowerRefill                                           ;8FA62B;
    dw EnemyPopulations_RedTowerRefill                                   ;8FA62D;
    dw EnemySets_RedTowerRefill                                          ;8FA62F;
    db $00,$00                                                           ;8FA631;
    dw $0000                                                             ;8FA633;
    dw $0000                                                             ;8FA635;
    dw $0000                                                             ;8FA637;
    dw PLMPopulation_RedTowerRefill                                      ;8FA639;
    dw $0000                                                             ;8FA63B;
    dw RTS_8F91D6                                                        ;8FA63D;

RoomDoors_RedTowerRefill:
    dw Door_RedTowerRefill_0                                             ;8FA63F;

RoomHeader_KraidRefill:
    db $32,$01,$36,$12,$01,$01,$70,$A0,$00                               ;8FA641;
    dw RoomDoors_KraidRefill                                             ;8FA64A;
    dw Use_StatePointer_inX                                              ;8FA64C;

RoomState_KraidRefill:
    dl LevelData_RefillStation_LeftSideDoor                              ;8FA64E;
    db $18,$00,$00                                                       ;8FA651;
    dw FXHeader_KraidRefill                                              ;8FA654;
    dw EnemyPopulations_KraidRefill                                      ;8FA656;
    dw EnemySets_KraidRefill                                             ;8FA658;
    db $00,$00                                                           ;8FA65A;
    dw $0000                                                             ;8FA65C;
    dw $0000                                                             ;8FA65E;
    dw $0000                                                             ;8FA660;
    dw PLMPopulation_KraidRefill                                         ;8FA662;
    dw $0000                                                             ;8FA664;
    dw RTS_8F91D6                                                        ;8FA666;

RoomDoors_KraidRefill:
    dw Door_KraidRefill_0                                                ;8FA668;

RoomHeader_Statues:
    db $33,$00,$11,$08,$01,$02,$70,$A0,$00                               ;8FA66A;
    dw RoomDoors_Statues                                                 ;8FA673;
    dw Use_StatePointer_inX                                              ;8FA675;

RoomState_Statues:
    dl LevelData_Statues                                                 ;8FA677;
    db $15,$09,$06                                                       ;8FA67A;
    dw FXHeader_Statues                                                  ;8FA67D;
    dw EnemyPopulations_Statues                                          ;8FA67F;
    dw EnemySets_Statues                                                 ;8FA681;
    db $81,$01                                                           ;8FA683;
    dw RoomScrolls_Statues                                               ;8FA685;
    dw $0000                                                             ;8FA687;
    dw $0000                                                             ;8FA689;
    dw PLMPopulation_Statues                                             ;8FA68B;
    dw LibBG_Tourian_15_Statues                                          ;8FA68D;
    dw SetupASM_RunStatueUnlockingAnimations                             ;8FA68F;

RoomDoors_Statues:
    dw Door_Statues_0                                                    ;8FA691;
    dw Door_Statues_1                                                    ;8FA693;
    dw Door_VariousRooms_Elevator                                        ;8FA695;

RoomScrolls_Statues:
    db $01,$00                                                           ;8FA697;

UNUSED_RoomPLM_8FA699:
    db $00,$02,$01,$01,$80                                               ;8FA699;

UNUSED_RoomPLM_8FA69E:
    db $01,$02,$80                                                       ;8FA69E;

RoomHeader_WarehouseEntrance:
    db $34,$01,$29,$12,$03,$02,$70,$A0,$00                               ;8FA6A1;
    dw RoomDoors_WarehouseEntrance                                       ;8FA6AA;
    dw Use_StatePointer_inX                                              ;8FA6AC;

RoomState_WarehouseEntrance:
    dl LevelData_WarehouseEntrance                                       ;8FA6AE;
    db $07,$12,$03                                                       ;8FA6B1;
    dw FXHeader_WarehouseEntrance                                        ;8FA6B4;
    dw EnemyPopulations_WarehouseEntrance                                ;8FA6B6;
    dw EnemySets_WarehouseEntrance                                       ;8FA6B8;
    db $C1,$C1                                                           ;8FA6BA;
    dw RoomScrolls_WarehouseEntrance                                     ;8FA6BC;
    dw $0000                                                             ;8FA6BE;
    dw $0000                                                             ;8FA6C0;
    dw PLMPopulation_WarehouseEntrance                                   ;8FA6C2;
    dw LibBG_Brinstar_7_MechanicalRoom                                   ;8FA6C4;
    dw RTS_8F91F4                                                        ;8FA6C6;

RoomDoors_WarehouseEntrance:
    dw Door_WarehouseEntrance_0                                          ;8FA6C8;
    dw Door_WarehouseEntrance_1                                          ;8FA6CA;
    dw Door_WarehouseEntrance_2                                          ;8FA6CC;
    dw Door_VariousRooms_Elevator                                        ;8FA6CE;

RoomScrolls_WarehouseEntrance:
    db $01,$00,$02,$00,$01,$01                                           ;8FA6D0;

RoomPLM_WarehouseEntrance_0:
    db $00,$02,$80                                                       ;8FA6D6;

RoomPLM_WarehouseEntrance_2:
    db $01,$02,$80                                                       ;8FA6D9;

RoomPLM_WarehouseEntrance_5:
    db $00,$01,$80                                                       ;8FA6DC;

RoomPLM_WarehouseEntrance_9:
    db $00,$00,$80                                                       ;8FA6DF;

RoomHeader_VariaSuit:
    db $35,$01,$39,$13,$01,$01,$70,$A0,$02                               ;8FA6E2;
    dw RoomDoors_VariaSuit                                               ;8FA6EB;
    dw Use_StatePointer_inX                                              ;8FA6ED;

RoomState_VariaSuit:
    dl LevelData_VariaSuit                                               ;8FA6EF;
    db $07,$00,$03                                                       ;8FA6F2;
    dw FXHeader_VariaSuit                                                ;8FA6F5;
    dw EnemyPopulations_VariaSuit                                        ;8FA6F7;
    dw EnemySets_VariaSuit                                               ;8FA6F9;
    db $00,$00                                                           ;8FA6FB;
    dw $0000                                                             ;8FA6FD;
    dw $0000                                                             ;8FA6FF;
    dw $0000                                                             ;8FA701;
    dw PLMPopulation_VariaSuit                                           ;8FA703;
    dw $0000                                                             ;8FA705;
    dw RTS_8F91F4                                                        ;8FA707;

RoomDoors_VariaSuit:
    dw Door_VariaSuit_0                                                  ;8FA709;

RoomHeader_WarehouseSave:
    db $36,$01,$31,$12,$01,$01,$70,$A0,$00                               ;8FA70B;
    dw RoomDoors_WarehouseSave                                           ;8FA714;
    dw Use_StatePointer_inX                                              ;8FA716;

RoomState_WarehouseSave:
    dl LevelData_SaveStation_LeftSideDoor                                ;8FA718;
    db $19,$12,$05                                                       ;8FA71B;
    dw FXHeader_WarehouseSave                                            ;8FA71E;
    dw EnemyPopulations_WarehouseSave                                    ;8FA720;
    dw EnemySets_WarehouseSave                                           ;8FA722;
    db $00,$00                                                           ;8FA724;
    dw $0000                                                             ;8FA726;
    dw $0000                                                             ;8FA728;
    dw $0000                                                             ;8FA72A;
    dw PLMPopulation_WarehouseSave                                       ;8FA72C;
    dw $0000                                                             ;8FA72E;
    dw RTS_8F91F4                                                        ;8FA730;

RoomDoors_WarehouseSave:
    dw Door_WarehouseSave_0                                              ;8FA732;

RoomHeader_RedBrinstarSave:
    db $37,$01,$26,$08,$01,$01,$70,$A0,$00                               ;8FA734;
    dw RoomDoors_RedBrinstarSave                                         ;8FA73D;
    dw Use_StatePointer_inX                                              ;8FA73F;

RoomState_RedBrinstarSave:
    dl LevelData_SaveStation_LeftSideDoor                                ;8FA741;
    db $19,$12,$05                                                       ;8FA744;
    dw FXHeader_RedBrinstarSave                                          ;8FA747;
    dw EnemyPopulations_RedBrinstarSave                                  ;8FA749;
    dw EnemySets_RedBrinstarSave                                         ;8FA74B;
    db $00,$00                                                           ;8FA74D;
    dw $0000                                                             ;8FA74F;
    dw $0000                                                             ;8FA751;
    dw $0000                                                             ;8FA753;
    dw PLMPopulation_RedBrinstarSave                                     ;8FA755;
    dw $0000                                                             ;8FA757;
    dw RTS_8F91F4                                                        ;8FA759;

RoomDoors_RedBrinstarSave:
    dw Door_RedBrinstarSave_0                                            ;8FA75B;

RoomHeader_IceBeamAcid:
    db $00,$02,$04,$03,$02,$01,$70,$A0,$00                               ;8FA75D;
    dw RoomDoors_IceBeamAcid                                             ;8FA766;
    dw Use_StatePointer_inX                                              ;8FA768;

RoomState_IceBeamAcid:
    dl LevelData_IceBeamAcid                                             ;8FA76A;
    db $09,$00,$00                                                       ;8FA76D;
    dw FXHeader_IceBeamAcid                                              ;8FA770;
    dw EnemyPopulations_IceBeamAcid                                      ;8FA772;
    dw EnemySets_IceBeamAcid                                             ;8FA774;
    db $C1,$C1                                                           ;8FA776;
    dw $0000                                                             ;8FA778;
    dw $0000                                                             ;8FA77A;
    dw $0000                                                             ;8FA77C;
    dw PLMPopulation_IceBeamAcid                                         ;8FA77E;
    dw LibBG_Norfair_9_A_SmallPatternBrownPurple_Bright                  ;8FA780;
    dw RTS_8F91F5                                                        ;8FA782;

RoomDoors_IceBeamAcid:
    dw Door_IceBeamAcid_0                                                ;8FA784;
    dw Door_IceBeamAcid_1                                                ;8FA786;

RoomHeader_Cathedral:
    db $01,$02,$0E,$03,$03,$02,$70,$A0,$00                               ;8FA788;
    dw RoomDoors_Cathedral                                               ;8FA791;
    dw Use_StatePointer_inX                                              ;8FA793;

RoomState_Cathedral:
    dl LevelData_Cathedral                                               ;8FA795;
    db $09,$00,$00                                                       ;8FA798;
    dw FXHeader_Cathedral                                                ;8FA79B;
    dw EnemyPopulations_Cathedral                                        ;8FA79D;
    dw EnemySets_Cathedral                                               ;8FA79F;
    db $00,$00                                                           ;8FA7A1;
    dw $0000                                                             ;8FA7A3;
    dw $0000                                                             ;8FA7A5;
    dw $0000                                                             ;8FA7A7;
    dw PLMPopulation_Cathedral                                           ;8FA7A9;
    dw $0000                                                             ;8FA7AB;
    dw RTS_8F91F5                                                        ;8FA7AD;

RoomDoors_Cathedral:
    dw Door_Cathedral_0                                                  ;8FA7AF;
    dw Door_Cathedral_1                                                  ;8FA7B1;

RoomHeader_CathedralEntrance:
    db $02,$02,$0B,$03,$03,$02,$70,$A0,$00                               ;8FA7B3;
    dw RoomDoors_CathedralEntrance                                       ;8FA7BC;
    dw Use_StatePointer_inX                                              ;8FA7BE;

RoomState_CathedralEntrance:
    dl LevelData_CathedralEntrance                                       ;8FA7C0;
    db $09,$00,$00                                                       ;8FA7C3;
    dw FXHeader_CathedralEntrance                                        ;8FA7C6;
    dw EnemyPopulations_CathedralEntrance                                ;8FA7C8;
    dw EnemySets_CathedralEntrance                                       ;8FA7CA;
    db $00,$00                                                           ;8FA7CC;
    dw $0000                                                             ;8FA7CE;
    dw $0000                                                             ;8FA7D0;
    dw $0000                                                             ;8FA7D2;
    dw PLMPopulation_CathedralEntrance                                   ;8FA7D4;
    dw $0000                                                             ;8FA7D6;
    dw RTS_8F91F5                                                        ;8FA7D8;

RoomDoors_CathedralEntrance:
    dw Door_CathedralEntrance_0                                          ;8FA7DA;
    dw Door_CathedralEntrance_1                                          ;8FA7DC;

RoomHeader_BusinessCenter:
    db $03,$02,$0A,$00,$01,$07,$70,$A0,$00                               ;8FA7DE;
    dw RoomDoors_BusinessCenter                                          ;8FA7E7;
    dw Use_StatePointer_inX                                              ;8FA7E9;

RoomState_BusinessCenter:
    dl LevelData_BusinessCenter                                          ;8FA7EB;
    db $0A,$15,$05                                                       ;8FA7EE;
    dw FXHeader_BusinessCenter                                           ;8FA7F1;
    dw EnemyPopulations_BusinessCenter                                   ;8FA7F3;
    dw EnemySets_BusinessCenter                                          ;8FA7F5;
    db $C1,$C1                                                           ;8FA7F7;
    dw $0000                                                             ;8FA7F9;
    dw $0000                                                             ;8FA7FB;
    dw $0000                                                             ;8FA7FD;
    dw PLMPopulation_BusinessCenter                                      ;8FA7FF;
    dw LibBG_Norfair_9_A_CavernVertical                                  ;8FA801;
    dw RTS_8F91F5                                                        ;8FA803;

RoomDoors_BusinessCenter:
    dw Door_BusinessCenter_0                                             ;8FA805;
    dw Door_BusinessCenter_1                                             ;8FA807;
    dw Door_BusinessCenter_2                                             ;8FA809;
    dw Door_BusinessCenter_3                                             ;8FA80B;
    dw Door_BusinessCenter_4                                             ;8FA80D;
    dw Door_VariousRooms_Elevator                                        ;8FA80F;
    dw Door_BusinessCenter_6                                             ;8FA811;
    dw Door_BusinessCenter_7                                             ;8FA813;

RoomHeader_IceBeamGate:
    db $04,$02,$03,$01,$07,$04,$70,$A0,$00                               ;8FA815;
    dw RoomDoors_IceBeamGate                                             ;8FA81E;
    dw Use_StatePointer_inX                                              ;8FA820;

RoomState_IceBeamGate:
    dl LevelData_IceBeamGate                                             ;8FA822;
    db $0A,$00,$00                                                       ;8FA825;
    dw FXHeader_IceBeamGate                                              ;8FA828;
    dw EnemyPopulations_IceBeamGate                                      ;8FA82A;
    dw EnemySets_IceBeamGate                                             ;8FA82C;
    db $C1,$C1                                                           ;8FA82E;
    dw RoomScrolls_IceBeamGate                                           ;8FA830;
    dw $0000                                                             ;8FA832;
    dw $0000                                                             ;8FA834;
    dw PLMPopulation_IceBeamGate                                         ;8FA836;
    dw LibBG_Norfair_9_A_SmallPatternBrownPurple_0                       ;8FA838;
    dw RTS_8F91F5                                                        ;8FA83A;

RoomDoors_IceBeamGate:
    dw Door_IceBeamGate_0                                                ;8FA83C;
    dw Door_IceBeamGate_1                                                ;8FA83E;
    dw Door_IceBeamGate_2                                                ;8FA840;
    dw Door_IceBeamGate_3                                                ;8FA842;

RoomScrolls_IceBeamGate:
    db $00,$00,$00,$02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8FA844;
    db $00,$01,$01,$01,$01,$01,$01,$01,$00,$00,$00,$00                   ;8FA854;

RoomPLM_IceBeamGate_0:
    db $11,$02,$18,$01,$80                                               ;8FA860;

RoomHeader_IceBeamTutorial:
    db $05,$02,$04,$01,$02,$01,$70,$A0,$00                               ;8FA865;
    dw RoomDoors_IceBeamTutorial                                         ;8FA86E;
    dw Use_StatePointer_inX                                              ;8FA870;

RoomState_IceBeamTutorial:
    dl LevelData_IceBeamTutorial                                         ;8FA872;
    db $09,$00,$00                                                       ;8FA875;
    dw FXHeader_IceBeamTutorial                                          ;8FA878;
    dw EnemyPopulations_IceBeamTutorial                                  ;8FA87A;
    dw EnemySets_IceBeamTutorial                                         ;8FA87C;
    db $C1,$C1                                                           ;8FA87E;
    dw $0000                                                             ;8FA880;
    dw $0000                                                             ;8FA882;
    dw $0000                                                             ;8FA884;
    dw PLMPopulation_IceBeamTutorial                                     ;8FA886;
    dw LibBG_Norfair_9_A_SmallPatternBrownPurple_Bright                  ;8FA888;
    dw RTS_8F91F5                                                        ;8FA88A;

RoomDoors_IceBeamTutorial:
    dw Door_IceBeamTutorial_0                                            ;8FA88C;
    dw Door_IceBeamTutorial_1                                            ;8FA88E;

RoomHeader_IceBeam:
    db $06,$02,$05,$02,$01,$01,$70,$A0,$00                               ;8FA890;
    dw RoomDoors_IceBeam                                                 ;8FA899;
    dw Use_StatePointer_inX                                              ;8FA89B;

RoomState_IceBeam:
    dl LevelData_IceBeam                                                 ;8FA89D;
    db $0A,$00,$03                                                       ;8FA8A0;
    dw FXHeader_IceBeam                                                  ;8FA8A3;
    dw EnemyPopulations_IceBeam                                          ;8FA8A5;
    dw EnemySets_IceBeam                                                 ;8FA8A7;
    db $01,$01                                                           ;8FA8A9;
    dw $0000                                                             ;8FA8AB;
    dw $0000                                                             ;8FA8AD;
    dw $0000                                                             ;8FA8AF;
    dw PLMPopulation_IceBeam                                             ;8FA8B1;
    dw LibBG_Norfair_9_A_SmallPatternBrownPurple_0                       ;8FA8B3;
    dw RTS_8F91F5                                                        ;8FA8B5;

RoomDoors_IceBeam:
    dw Door_IceBeam_0                                                    ;8FA8B7;

RoomHeader_IceBeamSnake:
    db $07,$02,$03,$01,$02,$03,$70,$A0,$00                               ;8FA8B9;
    dw RoomDoors_IceBeamSnake                                            ;8FA8C2;
    dw Use_StatePointer_inX                                              ;8FA8C4;

RoomState_IceBeamSnake:
    dl LevelData_IceBeamSnake                                            ;8FA8C6;
    db $09,$00,$05                                                       ;8FA8C9;
    dw FXHeader_IceBeamSnake                                             ;8FA8CC;
    dw EnemyPopulations_IceBeamSnake                                     ;8FA8CE;
    dw EnemySets_IceBeamSnake                                            ;8FA8D0;
    db $C1,$C1                                                           ;8FA8D2;
    dw RoomScrolls_IceBeamSnake                                          ;8FA8D4;
    dw $0000                                                             ;8FA8D6;
    dw $0000                                                             ;8FA8D8;
    dw PLMPopulation_IceBeamSnake                                        ;8FA8DA;
    dw LibBG_Norfair_9_A_SmallPatternBrownPurple_0                       ;8FA8DC;
    dw RTS_8F91F5                                                        ;8FA8DE;

RoomDoors_IceBeamSnake:
    dw Door_IceBeamSnake_0                                               ;8FA8E0;
    dw Door_IceBeamSnake_1                                               ;8FA8E2;
    dw Door_IceBeamSnake_2                                               ;8FA8E4;

RoomScrolls_IceBeamSnake:
    db $02,$00,$02,$00,$01,$00                                           ;8FA8E6;

RoomPLM_IceBeamSnake_0:
    db $03,$01,$80                                                       ;8FA8EC;

RoomPLM_IceBeamSnake_1:
    db $03,$00,$80                                                       ;8FA8EF;

RoomPLM_IceBeamSnake_2:
    db $02,$02,$80                                                       ;8FA8F2;

RoomPLM_IceBeamSnake_3:
    db $02,$00,$80                                                       ;8FA8F5;

RoomHeader_CrumbleShaft:
    db $08,$02,$02,$04,$01,$04,$70,$A0,$00                               ;8FA8F8;
    dw RoomDoors_CrumbleShaft                                            ;8FA901;
    dw Use_StatePointer_inX                                              ;8FA903;

RoomState_CrumbleShaft:
    dl LevelData_CrumbleShaft                                            ;8FA905;
    db $09,$00,$00                                                       ;8FA908;
    dw FXHeader_CrumbleShaft                                             ;8FA90B;
    dw EnemyPopulations_CrumbleShaft                                     ;8FA90D;
    dw EnemySets_CrumbleShaft                                            ;8FA90F;
    db $C1,$C1                                                           ;8FA911;
    dw $0000                                                             ;8FA913;
    dw $0000                                                             ;8FA915;
    dw $0000                                                             ;8FA917;
    dw PLMPopulation_CrumbleShaft                                        ;8FA919;
    dw LibBG_Norfair_9_A_CavernVertical                                  ;8FA91B;
    dw RTS_8F91F5                                                        ;8FA91D;

RoomDoors_CrumbleShaft:
    dw Door_CrumbleShaft_0                                               ;8FA91F;
    dw Door_CrumbleShaft_1                                               ;8FA921;

RoomHeader_CrocomireSpeedway:
    db $09,$02,$03,$07,$0D,$03,$70,$A0,$02                               ;8FA923;
    dw RoomDoors_CrocomireSpeedway                                       ;8FA92C;
    dw Use_StatePointer_inX                                              ;8FA92E;

RoomState_CrocomireSpeedway:
    dl LevelData_CrocomireSpeedway                                       ;8FA930;
    db $09,$15,$05                                                       ;8FA933;
    dw FXHeader_CrocomireSpeedway                                        ;8FA936;
    dw EnemyPopulations_CrocomireSpeedway                                ;8FA938;
    dw EnemySets_CrocomireSpeedway                                       ;8FA93A;
    db $C1,$C1                                                           ;8FA93C;
    dw RoomScrolls_CrocomireSpeedway                                     ;8FA93E;
    dw $0000                                                             ;8FA940;
    dw $0000                                                             ;8FA942;
    dw PLMPopulation_CrocomireSpeedway                                   ;8FA944;
    dw LibBG_Norfair_9_A_SmallPatternBrownPurple_0                       ;8FA946;
    dw RTS_8F91F5                                                        ;8FA948;

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

UNUSED_RoomPLM_8FA97B:
    db $19,$02,$26,$02,$80                                               ;8FA97B;

RoomPLM_CrocomireSpeedway_0:
    db $19,$02,$25,$02,$26,$02,$80                                       ;8FA980;

RoomPLM_CrocomireSpeedway_5:
    db $25,$02,$80                                                       ;8FA987;

RoomPLM_CrocomireSpeedway_8:
    db $25,$00,$80                                                       ;8FA98A;

RoomHeader_Crocomire:
    db $0A,$02,$0C,$0A,$08,$01,$70,$A0,$01                               ;8FA98D;
    dw RoomDoors_Crocomire                                               ;8FA996;
    dw RoomStateCheck_BossIsDead                                         ;8FA998;
    db $02                                                               ;8FA99A;
    dw RoomState_Crocomire_1                                             ;8FA99B;
    dw Use_StatePointer_inX                                              ;8FA99D;

RoomState_Crocomire_0:
    dl LevelData_Crocomire                                               ;8FA99F;
    db $1B,$27,$05                                                       ;8FA9A2;
    dw FXHeader_Crocomire_State0_1                                       ;8FA9A5;
    dw EnemyPopulations_Crocomire                                        ;8FA9A7;
    dw EnemySets_Crocomire                                               ;8FA9A9;
    db $01,$01                                                           ;8FA9AB;
    dw RoomScrolls_Crocomire                                             ;8FA9AD;
    dw $0000                                                             ;8FA9AF;
    dw MainASM_CrocomiresRoomShaking                                     ;8FA9B1;
    dw PLMPopulation_Crocomire_State0_1                                  ;8FA9B3;
    dw LibBG_Crocomire_State0                                            ;8FA9B5;
    dw RTS_8F91F6                                                        ;8FA9B7;

RoomState_Crocomire_1:
    dl LevelData_Crocomire                                               ;8FA9B9;
    db $1B,$00,$00                                                       ;8FA9BC;
    dw FXHeader_Crocomire_State0_1                                       ;8FA9BF;
    dw EnemyPopulations_Crocomire                                        ;8FA9C1;
    dw EnemySets_Crocomire                                               ;8FA9C3;
    db $01,$01                                                           ;8FA9C5;
    dw RoomScrolls_Crocomire                                             ;8FA9C7;
    dw $0000                                                             ;8FA9C9;
    dw MainASM_CrocomiresRoomShaking                                     ;8FA9CB;
    dw PLMPopulation_Crocomire_State0_1                                  ;8FA9CD;
    dw LibBG_Crocomire_State1                                            ;8FA9CF;
    dw RTS_8F91F6                                                        ;8FA9D1;

RoomDoors_Crocomire:
    dw Door_Crocomire_0                                                  ;8FA9D3;
    dw Door_Crocomire_1                                                  ;8FA9D5;

RoomScrolls_Crocomire:
    db $00,$00,$01,$01,$01,$01,$01,$01                                   ;8FA9D7;

UNUSED_RoomPLM_8FA9DF:
    db $01,$01,$80                                                       ;8FA9DF;

UNUSED_RoomPLM_8FA9E2:
    db $00,$01,$80                                                       ;8FA9E2;

RoomHeader_HiJumpBoots:
    db $0B,$02,$07,$06,$01,$01,$70,$A0,$00                               ;8FA9E5;
    dw RoomDoors_HiJumpBoots                                             ;8FA9EE;
    dw Use_StatePointer_inX                                              ;8FA9F0;

RoomState_HiJumpBoots:
    dl LevelData_HiJumpBoots                                             ;8FA9F2;
    db $0A,$00,$03                                                       ;8FA9F5;
    dw FXHeader_HiJumpBoots                                              ;8FA9F8;
    dw EnemyPopulations_HiJumpBoots                                      ;8FA9FA;
    dw EnemySets_HiJumpBoots                                             ;8FA9FC;
    db $C1,$C1                                                           ;8FA9FE;
    dw $0000                                                             ;8FAA00;
    dw $0000                                                             ;8FAA02;
    dw $0000                                                             ;8FAA04;
    dw PLMPopulation_HiJumpBoots                                         ;8FAA06;
    dw LibBG_Norfair_9_A_SmallPatternBrownPurple_Bright                  ;8FAA08;
    dw RTS_8F91F6                                                        ;8FAA0A;

RoomDoors_HiJumpBoots:
    dw Door_HiJumpBoots_0                                                ;8FAA0C;

RoomHeader_CrocomireEscape:
    db $0C,$02,$0B,$06,$04,$02,$90,$A0,$00                               ;8FAA0E;
    dw RoomDoors_CrocomireEscape                                         ;8FAA17;
    dw Use_StatePointer_inX                                              ;8FAA19;

RoomState_CrocomireEscape:
    dl LevelData_CrocomireEscape                                         ;8FAA1B;
    db $09,$00,$00                                                       ;8FAA1E;
    dw FXHeader_CrocomireEscape                                          ;8FAA21;
    dw EnemyPopulations_CrocomireEscape                                  ;8FAA23;
    dw EnemySets_CrocomireEscape                                         ;8FAA25;
    db $C0,$00                                                           ;8FAA27;
    dw RoomScrolls_CrocomireEscape                                       ;8FAA29;
    dw $0000                                                             ;8FAA2B;
    dw $0000                                                             ;8FAA2D;
    dw PLMPopulation_CrocomireEscape                                     ;8FAA2F;
    dw $0000                                                             ;8FAA31;
    dw RTS_8F91F6                                                        ;8FAA33;

RoomDoors_CrocomireEscape:
    dw Door_CrocomireEscape_0                                            ;8FAA35;
    dw Door_CrocomireEscape_1                                            ;8FAA37;

RoomScrolls_CrocomireEscape:
    db $02,$02,$02,$02,$01,$01,$01,$01                                   ;8FAA39;

RoomHeader_HiJumpETank:
    db $0D,$02,$08,$05,$02,$02,$70,$A0,$00                               ;8FAA41;
    dw RoomDoors_HiJumpETank                                             ;8FAA4A;
    dw Use_StatePointer_inX                                              ;8FAA4C;

RoomState_HiJumpETank:
    dl LevelData_HiJumpETank                                             ;8FAA4E;
    db $0A,$00,$05                                                       ;8FAA51;
    dw FXHeader_HiJumpETank                                              ;8FAA54;
    dw EnemyPopulations_HiJumpETank                                      ;8FAA56;
    dw EnemySets_HiJumpETank                                             ;8FAA58;
    db $C0,$00                                                           ;8FAA5A;
    dw RoomScrolls_HiJumpETank                                           ;8FAA5C;
    dw $0000                                                             ;8FAA5E;
    dw $0000                                                             ;8FAA60;
    dw PLMPopulation_HiJumpETank                                         ;8FAA62;
    dw $0000                                                             ;8FAA64;
    dw RTS_8F91F6                                                        ;8FAA66;

RoomDoors_HiJumpETank:
    dw Door_HiJumpETank_0                                                ;8FAA68;
    dw Door_HiJumpETank_1                                                ;8FAA6A;

RoomScrolls_HiJumpETank:
    db $00,$01,$00,$00                                                   ;8FAA6C;

RoomPLM_HiJumpETank_1:
    db $00,$02,$02,$02,$80                                               ;8FAA70;

RoomPLM_HiJumpETank_0:
    db $00,$02,$02,$02,$03,$02,$80                                       ;8FAA75;

RoomPLM_HiJumpETank_2:
    db $03,$00,$80                                                       ;8FAA7C;

RoomPLM_HiJumpETank_3:
    db $03,$02,$80                                                       ;8FAA7F;

RoomHeader_PostCrocFarming:
    db $0E,$02,$0A,$0A,$02,$02,$90,$A0,$02                               ;8FAA82;
    dw RoomDoors_PostCrocFarming                                         ;8FAA8B;
    dw Use_StatePointer_inX                                              ;8FAA8D;

RoomState_PostCrocFarming:
    dl LevelData_PostCrocFarming                                         ;8FAA8F;
    db $09,$15,$05                                                       ;8FAA92;
    dw FXHeader_PostCrocFarming                                          ;8FAA95;
    dw EnemyPopulations_PostCrocFarming                                  ;8FAA97;
    dw EnemySets_PostCrocFarming                                         ;8FAA99;
    db $00,$00                                                           ;8FAA9B;
    dw RoomScrolls_PostCrocFarming                                       ;8FAA9D;
    dw $0000                                                             ;8FAA9F;
    dw $0000                                                             ;8FAAA1;
    dw PLMPopulation_PostCrocFarming                                     ;8FAAA3;
    dw $0000                                                             ;8FAAA5;
    dw RTS_8F91F6                                                        ;8FAAA7;

RoomDoors_PostCrocFarming:
    dw Door_PostCrocFarming_0                                            ;8FAAA9;
    dw Door_PostCrocFarming_1                                            ;8FAAAB;
    dw Door_PostCrocFarming_2                                            ;8FAAAD;
    dw Door_PostCrocFarming_3                                            ;8FAAAF;

RoomScrolls_PostCrocFarming:
    db $02,$02,$02,$02                                                   ;8FAAB1;

RoomHeader_PostCrocSave:
    db $0F,$02,$0C,$0B,$01,$01,$70,$A0,$00                               ;8FAAB5;
    dw RoomDoors_PostCrocSave                                            ;8FAABE;
    dw Use_StatePointer_inX                                              ;8FAAC0;

RoomState_PostCrocSave:
    dl LevelData_SaveStation_LeftSideDoor                                ;8FAAC2;
    db $19,$15,$05                                                       ;8FAAC5;
    dw FXHeader_PostCrocSave                                             ;8FAAC8;
    dw EnemyPopulations_PostCrocSave                                     ;8FAACA;
    dw EnemySets_PostCrocSave                                            ;8FAACC;
    db $00,$00                                                           ;8FAACE;
    dw $0000                                                             ;8FAAD0;
    dw $0000                                                             ;8FAAD2;
    dw $0000                                                             ;8FAAD4;
    dw PLMPopulation_PostCrocSave                                        ;8FAAD6;
    dw $0000                                                             ;8FAAD8;
    dw RTS_8F91F6                                                        ;8FAADA;

RoomDoors_PostCrocSave:
    dw Door_PostCrocSave_0                                               ;8FAADC;

RoomHeader_PostCrocPowerBombs:
    db $10,$02,$09,$0A,$01,$01,$70,$A0,$00,$05,$AB,$E6,$E5               ;8FAADE;

RoomState_PostCrocPowerBombs:
    dl LevelData_PostCrocPowerBombs                                      ;8FAAEB;
    db $09,$00,$00                                                       ;8FAAEE;
    dw FXHeader_PostCrocPowerBombs                                       ;8FAAF1;
    dw EnemyPopulations_PostCrocPowerBombs                               ;8FAAF3;
    dw EnemySets_PostCrocPowerBombs                                      ;8FAAF5;
    db $C1,$C1                                                           ;8FAAF7;
    dw $0000                                                             ;8FAAF9;
    dw $0000                                                             ;8FAAFB;
    dw $0000                                                             ;8FAAFD;
    dw PLMPopulation_PostCrocPowerBombs                                  ;8FAAFF;
    dw LibBG_Norfair_9_A_CavernStalagtites                               ;8FAB01;
    dw RTS_8F91F6                                                        ;8FAB03;

RoomDoors_PostCrocPowerBombs:
    dw Door_PostCrocPowerBombs_0                                         ;8FAB05;

RoomHeader_PostCrocShaft:
    db $11,$02,$0A,$0C,$01,$05,$90,$A0,$00                               ;8FAB07;
    dw RoomDoors_PostCrocShaft                                           ;8FAB10;
    dw Use_StatePointer_inX                                              ;8FAB12;

RoomState_PostCrocShaft:
    dl LevelData_PostCrocShaft                                           ;8FAB14;
    db $0A,$00,$00                                                       ;8FAB17;
    dw FXHeader_PostCrocShaft                                            ;8FAB1A;
    dw EnemyPopulations_PostCrocShaft                                    ;8FAB1C;
    dw EnemySets_PostCrocShaft                                           ;8FAB1E;
    db $C1,$C1                                                           ;8FAB20;
    dw RoomScrolls_PostCrocShaft                                         ;8FAB22;
    dw $0000                                                             ;8FAB24;
    dw $0000                                                             ;8FAB26;
    dw PLMPopulation_PostCrocShaft                                       ;8FAB28;
    dw LibBG_Norfair_9_A_CavernVertical                                  ;8FAB2A;
    dw RTS_8F91F6                                                        ;8FAB2C;

RoomDoors_PostCrocShaft:
    dw Door_PostCrocShaft_0                                              ;8FAB2E;
    dw Door_PostCrocShaft_1                                              ;8FAB30;
    dw Door_PostCrocShaft_2                                              ;8FAB32;
    dw Door_PostCrocShaft_3                                              ;8FAB34;

RoomScrolls_PostCrocShaft:
    db $02,$02,$02,$02,$02                                               ;8FAB36;

RoomHeader_PostCrocMissile:
    db $12,$02,$0B,$0F,$04,$01,$70,$A0,$00                               ;8FAB3B;
    dw RoomDoors_PostCrocMissile                                         ;8FAB44;
    dw Use_StatePointer_inX                                              ;8FAB46;

RoomState_PostCrocMissile:
    dl LevelData_PostCrocMissile                                         ;8FAB48;
    db $0A,$00,$00                                                       ;8FAB4B;
    dw FXHeader_PostCrocMissile                                          ;8FAB4E;
    dw EnemyPopulations_PostCrocMissile                                  ;8FAB50;
    dw EnemySets_PostCrocMissile                                         ;8FAB52;
    db $C1,$C1                                                           ;8FAB54;
    dw $0000                                                             ;8FAB56;
    dw $0000                                                             ;8FAB58;
    dw $0000                                                             ;8FAB5A;
    dw PLMPopulation_PostCrocMissile                                     ;8FAB5C;
    dw LibBG_Norfair_9_A_CavernStalagtites                               ;8FAB5E;
    dw RTS_8F91F6                                                        ;8FAB60;

RoomDoors_PostCrocMissile:
    dw Door_PostCrocMissile_0                                            ;8FAB62;

RoomHeader_GrappleTutorial3:
    db $13,$02,$07,$0C,$03,$02,$90,$A0,$00                               ;8FAB64;
    dw RoomDoors_GrappleTutorial3                                        ;8FAB6D;
    dw Use_StatePointer_inX                                              ;8FAB6F;

RoomState_GrappleTutorial3:
    dl LevelData_GrappleTutorial3                                        ;8FAB71;
    db $0A,$00,$00                                                       ;8FAB74;
    dw FXHeader_GrappleTutorial3                                         ;8FAB77;
    dw EnemyPopulations_GrappleTutorial3                                 ;8FAB79;
    dw EnemySets_GrappleTutorial3                                        ;8FAB7B;
    db $C1,$C1                                                           ;8FAB7D;
    dw $0000                                                             ;8FAB7F;
    dw $0000                                                             ;8FAB81;
    dw $0000                                                             ;8FAB83;
    dw PLMPopulation_GrappleTutorial3                                    ;8FAB85;
    dw LibBG_Norfair_9_A_SmallPatternBrownPurple_0                       ;8FAB87;
    dw RTS_8F91F6                                                        ;8FAB89;

RoomDoors_GrappleTutorial3:
    dw Door_GrappleTutorial3_0                                           ;8FAB8B;
    dw Door_GrappleTutorial3_1                                           ;8FAB8D;

RoomHeader_PostCrocJump:
    db $14,$02,$04,$0F,$08,$03,$90,$A0,$00                               ;8FAB8F;
    dw RoomDoors_PostCrocJump                                            ;8FAB98;
    dw Use_StatePointer_inX                                              ;8FAB9A;

RoomState_PostCrocJump:
    dl LevelData_PostCrocJump                                            ;8FAB9C;
    db $0A,$00,$05                                                       ;8FAB9F;
    dw FXHeader_PostCrocJump                                             ;8FABA2;
    dw EnemyPopulations_PostCrocJump                                     ;8FABA4;
    dw EnemySets_PostCrocJump                                            ;8FABA6;
    db $C0,$00                                                           ;8FABA8;
    dw RoomScrolls_PostCrocJump                                          ;8FABAA;
    dw $0000                                                             ;8FABAC;
    dw $0000                                                             ;8FABAE;
    dw PLMPopulation_PostCrocJump                                        ;8FABB0;
    dw $0000                                                             ;8FABB2;
    dw RTS_8F91F6                                                        ;8FABB4;

RoomDoors_PostCrocJump:
    dw Door_PostCrocJump_0                                               ;8FABB6;
    dw Door_PostCrocJump_1                                               ;8FABB8;

RoomScrolls_PostCrocJump:
    db $02,$02,$02,$02,$02,$00,$00,$00,$02,$02,$02,$02,$02,$00,$00,$00   ;8FABBA;
    db $01,$01,$01,$01,$01,$01,$01,$01                                   ;8FABCA;

RoomHeader_GrappleTutorial2:
    db $15,$02,$06,$0C,$01,$03,$90,$A0,$00                               ;8FABD2;
    dw RoomDoors_GrappleTutorial2                                        ;8FABDB;
    dw Use_StatePointer_inX                                              ;8FABDD;

RoomState_GrappleTutorial2:
    dl LevelData_GrappleTutorial2                                        ;8FABDF;
    db $0A,$00,$00                                                       ;8FABE2;
    dw FXHeader_GrappleTutorial2                                         ;8FABE5;
    dw EnemyPopulations_GrappleTutorial2                                 ;8FABE7;
    dw EnemySets_GrappleTutorial2                                        ;8FABE9;
    db $C1,$C1                                                           ;8FABEB;
    dw RoomScrolls_GrappleTutorial2                                      ;8FABED;
    dw $0000                                                             ;8FABEF;
    dw $0000                                                             ;8FABF1;
    dw PLMPopulation_GrappleTutorial2                                    ;8FABF3;
    dw LibBG_Norfair_9_A_CavernVertical                                  ;8FABF5;
    dw RTS_8F91F6                                                        ;8FABF7;

RoomDoors_GrappleTutorial2:
    dw Door_GrappleTutorial2_0                                           ;8FABF9;
    dw Door_GrappleTutorial2_1                                           ;8FABFB;

RoomScrolls_GrappleTutorial2:
    db $02,$02,$01                                                       ;8FABFD;

RoomHeader_GrappleTutorial1:
    db $16,$02,$04,$0E,$02,$01,$70,$A0,$00                               ;8FAC00;
    dw RoomDoors_GrappleTutorial1                                        ;8FAC09;
    dw Use_StatePointer_inX                                              ;8FAC0B;

RoomState_GrappleTutorial1:
    dl LevelData_GrappleTutorial1                                        ;8FAC0D;
    db $0A,$00,$05                                                       ;8FAC10;
    dw FXHeader_GrappleTutorial1                                         ;8FAC13;
    dw EnemyPopulations_GrappleTutorial1                                 ;8FAC15;
    dw EnemySets_GrappleTutorial1                                        ;8FAC17;
    db $C1,$C1                                                           ;8FAC19;
    dw $0000                                                             ;8FAC1B;
    dw $0000                                                             ;8FAC1D;
    dw $0000                                                             ;8FAC1F;
    dw PLMPopulation_GrappleTutorial1                                    ;8FAC21;
    dw LibBG_Norfair_9_A_CavernStalagtites                               ;8FAC23;
    dw RTS_8F91F6                                                        ;8FAC25;

RoomDoors_GrappleTutorial1:
    dw Door_GrappleTutorial1_0                                           ;8FAC27;
    dw Door_GrappleTutorial1_1                                           ;8FAC29;

RoomHeader_GrappleBeam:
    db $17,$02,$03,$0E,$01,$04,$90,$A0,$00                               ;8FAC2B;
    dw RoomDoors_GrappleBeam                                             ;8FAC34;
    dw Use_StatePointer_inX                                              ;8FAC36;

RoomState_GrappleBeam:
    dl LevelData_GrappleBeam                                             ;8FAC38;
    db $0A,$00,$03                                                       ;8FAC3B;
    dw FXHeader_GrappleBeam                                              ;8FAC3E;
    dw EnemyPopulations_GrappleBeam                                      ;8FAC40;
    dw EnemySets_GrappleBeam                                             ;8FAC42;
    db $C1,$C1                                                           ;8FAC44;
    dw RoomScrolls_GrappleBeam                                           ;8FAC46;
    dw $0000                                                             ;8FAC48;
    dw $0000                                                             ;8FAC4A;
    dw PLMPopulation_GrappleBeam                                         ;8FAC4C;
    dw LibBG_Norfair_9_A_CavernVertical                                  ;8FAC4E;
    dw RTS_8F91F6                                                        ;8FAC50;

RoomDoors_GrappleBeam:
    dw Door_GrappleBeam_0                                                ;8FAC52;
    dw Door_GrappleBeam_1                                                ;8FAC54;

RoomScrolls_GrappleBeam:
    db $02,$02,$01,$00                                                   ;8FAC56;

RoomHeader_NorfairReserveTank:
    db $18,$02,$12,$02,$02,$01,$70,$A0,$00                               ;8FAC5A;
    dw RoomDoors_NorfairReserveTank                                      ;8FAC63;
    dw Use_StatePointer_inX                                              ;8FAC65;

RoomState_NorfairReserveTank:
    dl LevelData_NorfairReserveTank                                      ;8FAC67;
    db $09,$00,$00                                                       ;8FAC6A;
    dw FXHeader_NorfairReserveTank                                       ;8FAC6D;
    dw EnemyPopulations_NorfairReserveTank                               ;8FAC6F;
    dw EnemySets_NorfairReserveTank                                      ;8FAC71;
    db $C1,$C1                                                           ;8FAC73;
    dw $0000                                                             ;8FAC75;
    dw $0000                                                             ;8FAC77;
    dw $0000                                                             ;8FAC79;
    dw PLMPopulation_NorfairReserveTank                                  ;8FAC7B;
    dw LibBG_Norfair_9_PurplePatches                                     ;8FAC7D;
    dw RTS_8F91F6                                                        ;8FAC7F;

RoomDoors_NorfairReserveTank:
    dw Door_NorfairReserveTank                                           ;8FAC81;

RoomHeader_GreenBubblesMissiles:
    db $19,$02,$14,$02,$02,$01,$70,$A0,$00                               ;8FAC83;
    dw RoomDoors_GreenBubblesMissiles                                    ;8FAC8C;
    dw Use_StatePointer_inX                                              ;8FAC8E;

RoomState_GreenBubblesMissiles:
    dl LevelData_GreenBubblesMissiles                                    ;8FAC90;
    db $09,$00,$00                                                       ;8FAC93;
    dw FXHeader_GreenBubblesMissiles                                     ;8FAC96;
    dw EnemyPopulations_GreenBubblesMissiles                             ;8FAC98;
    dw EnemySets_GreenBubblesMissiles                                    ;8FAC9A;
    db $C1,$C1                                                           ;8FAC9C;
    dw RoomScrolls_GreenBubblesMissiles                                  ;8FAC9E;
    dw $0000                                                             ;8FACA0;
    dw $0000                                                             ;8FACA2;
    dw PLMPopulation_GreenBubblesMissiles                                ;8FACA4;
    dw LibBG_Norfair_9_Bubbles                                           ;8FACA6;
    dw RTS_8F91F6                                                        ;8FACA8;

RoomDoors_GreenBubblesMissiles:
    dw Door_GreenBubblesMissiles_0                                       ;8FACAA;
    dw Door_GreenBubblesMissiles_1                                       ;8FACAC;

RoomScrolls_GreenBubblesMissiles:
    db $00,$01                                                           ;8FACAE;

RoomPLM_GreenBubblesMissiles_0:
    db $00,$01,$80                                                       ;8FACB0;

RoomHeader_BubbleMountain:
    db $1A,$02,$16,$02,$02,$04,$90,$A0,$00                               ;8FACB3;
    dw RoomDoors_BubbleMountain                                          ;8FACBC;
    dw Use_StatePointer_inX                                              ;8FACBE;

RoomState_BubbleMountain:
    dl LevelData_BubbleMountain                                          ;8FACC0;
    db $09,$00,$00                                                       ;8FACC3;
    dw FXHeader_BubbleMountain                                           ;8FACC6;
    dw EnemyPopulations_BubbleMountain                                   ;8FACC8;
    dw EnemySets_BubbleMountain                                          ;8FACCA;
    db $C1,$C1                                                           ;8FACCC;
    dw RoomScrolls_BubbleMountain                                        ;8FACCE;
    dw $0000                                                             ;8FACD0;
    dw $0000                                                             ;8FACD2;
    dw PLMPopulation_BubbleMountain                                      ;8FACD4;
    dw LibBG_Norfair_9_Bubbles                                           ;8FACD6;
    dw RTS_8F91F6                                                        ;8FACD8;

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

RoomHeader_SpeedBoosterHall:
    db $1B,$02,$19,$01,$0C,$02,$70,$A0,$00                               ;8FACF0;
    dw RoomDoors_SpeedBoosterHall                                        ;8FACF9;
    dw Use_StatePointer_inX                                              ;8FACFB;

RoomState_SpeedBoosterHall:
    dl LevelData_SpeedBoosterHall                                        ;8FACFD;
    db $09,$00,$05                                                       ;8FAD00;
    dw FXHeader_SpeedBoosterHall                                         ;8FAD03;
    dw EnemyPopulations_SpeedBoosterHall                                 ;8FAD05;
    dw EnemySets_SpeedBoosterHall                                        ;8FAD07;
    db $C1,$C1                                                           ;8FAD09;
    dw $0000                                                             ;8FAD0B;
    dw $0000                                                             ;8FAD0D;
    dw $0000                                                             ;8FAD0F;
    dw PLMPopulation_SpeedBoosterHall                                    ;8FAD11;
    dw LibBG_Norfair_9_A_SmallPatternBrownPurple_0                       ;8FAD13;
    dw RTS_8F91F6                                                        ;8FAD15;

RoomDoors_SpeedBoosterHall:
    dw Door_SpeedBoosterHall_0                                           ;8FAD17;
    dw Door_SpeedBoosterHall_1                                           ;8FAD19;

RoomHeader_SpeedBooster:
    db $1C,$02,$25,$02,$01,$01,$70,$A0,$00                               ;8FAD1B;
    dw RoomDoors_SpeedBooster                                            ;8FAD24;
    dw Use_StatePointer_inX                                              ;8FAD26;

RoomState_SpeedBooster:
    dl LevelData_SpeedBooster                                            ;8FAD28;
    db $09,$00,$03                                                       ;8FAD2B;
    dw FXHeader_SpeedBooster                                             ;8FAD2E;
    dw EnemyPopulations_SpeedBooster                                     ;8FAD30;
    dw EnemySets_SpeedBooster                                            ;8FAD32;
    db $C1,$C1                                                           ;8FAD34;
    dw $0000                                                             ;8FAD36;
    dw $0000                                                             ;8FAD38;
    dw $0000                                                             ;8FAD3A;
    dw PLMPopulation_SpeedBooster                                        ;8FAD3C;
    dw LibBG_Norfair_9_A_SmallPatternBrownPurple_Bright                  ;8FAD3E;
    dw RTS_8F91F6                                                        ;8FAD40;

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

RoomDoors_SpeedBooster:
    dw Door_SpeedBooster_0                                               ;8FAD5C;

RoomHeader_SingleChamber:
    db $1D,$02,$18,$03,$06,$04,$70,$A0,$00                               ;8FAD5E;
    dw RoomDoors_SingleChamber                                           ;8FAD67;
    dw Use_StatePointer_inX                                              ;8FAD69;

RoomState_SingleChamber:
    dl LevelData_SingleChamber                                           ;8FAD6B;
    db $09,$15,$05                                                       ;8FAD6E;
    dw FXHeader_SingleChamber                                            ;8FAD71;
    dw EnemyPopulations_SingleChamber                                    ;8FAD73;
    dw EnemySets_SingleChamber                                           ;8FAD75;
    db $C0,$C0                                                           ;8FAD77;
    dw RoomScrolls_SingleChamber                                         ;8FAD79;
    dw $0000                                                             ;8FAD7B;
    dw $0000                                                             ;8FAD7D;
    dw PLMPopulation_SingleChamber                                       ;8FAD7F;
    dw $0000                                                             ;8FAD81;
    dw RTS_8F91F6                                                        ;8FAD83;

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
    db $01,$00,$80                                                       ;8FADA7;

RoomPLM_SingleChamber_1_4:
    db $01,$01,$80                                                       ;8FADAA;

RoomHeader_DoubleChamber:
    db $1E,$02,$19,$04,$04,$02,$90,$A0,$00                               ;8FADAD;
    dw RoomDoors_DoubleChamber                                           ;8FADB6;
    dw Use_StatePointer_inX                                              ;8FADB8;

RoomState_DoubleChamber:
    dl LevelData_DoubleChamber                                           ;8FADBA;
    db $09,$00,$05                                                       ;8FADBD;
    dw FXHeader_DoubleChamber                                            ;8FADC0;
    dw EnemyPopulations_DoubleChamber                                    ;8FADC2;
    dw EnemySets_DoubleChamber                                           ;8FADC4;
    db $C0,$00                                                           ;8FADC6;
    dw RoomScrolls_DoubleChamber                                         ;8FADC8;
    dw $0000                                                             ;8FADCA;
    dw $0000                                                             ;8FADCC;
    dw PLMPopulation_DoubleChamber                                       ;8FADCE;
    dw $0000                                                             ;8FADD0;
    dw RTS_8F91F6                                                        ;8FADD2;

RoomDoors_DoubleChamber:
    dw Door_DoubleChamber_0                                              ;8FADD4;
    dw Door_DoubleChamber_1                                              ;8FADD6;
    dw Door_DoubleChamber_2                                              ;8FADD8;

RoomScrolls_DoubleChamber:
    db $02,$02,$02,$02                                                   ;8FADDA;

RoomHeader_WaveBeam:
    db $1F,$02,$1D,$04,$01,$01,$70,$A0,$00                               ;8FADDE;
    dw RoomDoors_WaveBeam                                                ;8FADE7;
    dw Use_StatePointer_inX                                              ;8FADE9;

RoomState_WaveBeam:
    dl LevelData_WaveBeam                                                ;8FADEB;
    db $09,$00,$03                                                       ;8FADEE;
    dw FXHeader_WaveBeam                                                 ;8FADF1;
    dw EnemyPopulations_WaveBeam                                         ;8FADF3;
    dw EnemySets_WaveBeam                                                ;8FADF5;
    db $C1,$C1                                                           ;8FADF7;
    dw $0000                                                             ;8FADF9;
    dw $0000                                                             ;8FADFB;
    dw $0000                                                             ;8FADFD;
    dw PLMPopulation_WaveBeam                                            ;8FADFF;
    dw LibBG_Norfair_9_A_CavernStalagtites                               ;8FAE01;
    dw RTS_8F91F6                                                        ;8FAE03;

RoomDoors_WaveBeam:
    dw Door_WaveBeam_0                                                   ;8FAE05;

RoomHeader_SpikyPlatformsTunnel:
    db $20,$02,$19,$06,$04,$01,$70,$A0,$00                               ;8FAE07;
    dw RoomDoors_SpikyPlatformsTunnel                                    ;8FAE10;
    dw Use_StatePointer_inX                                              ;8FAE12;

RoomState_SpikyPlatformsTunnel:
    dl LevelData_SpikyPlatformsTunnel                                    ;8FAE14;
    db $09,$00,$00                                                       ;8FAE17;
    dw FXHeader_SpikyPlatformsTunnel                                     ;8FAE1A;
    dw EnemyPopulations_SpikyPlatformsTunnel                             ;8FAE1C;
    dw EnemySets_SpikyPlatformsTunnel                                    ;8FAE1E;
    db $C1,$C1                                                           ;8FAE20;
    dw $0000                                                             ;8FAE22;
    dw $0000                                                             ;8FAE24;
    dw $0000                                                             ;8FAE26;
    dw PLMPopulation_SpikyPlatformsTunnel                                ;8FAE28;
    dw LibBG_Norfair_9_A_CavernStalagtites                               ;8FAE2A;
    dw RTS_8F91F6                                                        ;8FAE2C;

RoomDoors_SpikyPlatformsTunnel:
    dw Door_SpikyPlatformsTunnel_0                                       ;8FAE2E;
    dw Door_SpikyPlatformsTunnel_1                                       ;8FAE30;

RoomHeader_Volcano:
    db $21,$02,$1B,$06,$03,$03,$70,$A0,$00                               ;8FAE32;
    dw RoomDoors_Volcano                                                 ;8FAE3B;
    dw Use_StatePointer_inX                                              ;8FAE3D;

RoomState_Volcano:
    dl LevelData_Volcano                                                 ;8FAE3F;
    db $09,$00,$00                                                       ;8FAE42;
    dw FXHeader_Volcano                                                  ;8FAE45;
    dw EnemyPopulations_Volcano                                          ;8FAE47;
    dw EnemySets_Volcano                                                 ;8FAE49;
    db $00,$00                                                           ;8FAE4B;
    dw RoomScrolls_Volcano                                               ;8FAE4D;
    dw $0000                                                             ;8FAE4F;
    dw $0000                                                             ;8FAE51;
    dw PLMPopulation_Volcano                                             ;8FAE53;
    dw $0000                                                             ;8FAE55;
    dw RTS_8F91F6                                                        ;8FAE57;

RoomDoors_Volcano:
    dw Door_Volcano_0                                                    ;8FAE59;
    dw Door_Volcano_1                                                    ;8FAE5B;

RoomScrolls_Volcano:
    db $00,$00,$02,$00,$00,$02,$00,$00,$01                               ;8FAE5D;

RoomPLM_Volcano_0:
    db $06,$01,$07,$01,$80                                               ;8FAE66;

RoomPLM_Volcano_1:
    db $08,$01,$80                                                       ;8FAE6B;

RoomPLM_Volcano_7:
    db $08,$00,$80                                                       ;8FAE6E;

RoomPLM_Volcano_B:
    db $07,$00,$80                                                       ;8FAE71;

RoomHeader_KronicBoost:
    db $22,$02,$19,$08,$02,$03,$70,$A0,$00                               ;8FAE74;
    dw RoomDoors_KronicBoost                                             ;8FAE7D;
    dw Use_StatePointer_inX                                              ;8FAE7F;

RoomState_KronicBoost:
    dl LevelData_KronicBoost                                             ;8FAE81;
    db $09,$00,$00                                                       ;8FAE84;
    dw FXHeader_KronicBoost                                              ;8FAE87;
    dw EnemyPopulations_KronicBoost                                      ;8FAE89;
    dw EnemySets_KronicBoost                                             ;8FAE8B;
    db $00,$00                                                           ;8FAE8D;
    dw RoomScrolls_KronicBoost                                           ;8FAE8F;
    dw $0000                                                             ;8FAE91;
    dw $0000                                                             ;8FAE93;
    dw PLMPopulation_KronicBoost                                         ;8FAE95;
    dw $0000                                                             ;8FAE97;
    dw RTS_8F91F6                                                        ;8FAE99;

RoomDoors_KronicBoost:
    dw Door_KronicBoost_0                                                ;8FAE9B;
    dw Door_KronicBoost_1                                                ;8FAE9D;
    dw Door_KronicBoost_2                                                ;8FAE9F;
    dw Door_KronicBoost_3                                                ;8FAEA1;

RoomScrolls_KronicBoost:
    db $00,$02,$00,$02,$00,$01                                           ;8FAEA3;

RoomPLM_KronicBoost_0:
    db $02,$01,$80                                                       ;8FAEA9;

RoomPLM_KronicBoost_1:
    db $02,$00,$03,$02,$80                                               ;8FAEAC;

RoomPLM_KronicBoost_5:
    db $03,$00,$80                                                       ;8FAEB1;

RoomHeader_MagdolliteTunnel:
    db $23,$02,$17,$08,$03,$01,$70,$A0,$00                               ;8FAEB4;
    dw RoomDoors_MagdolliteTunnel                                        ;8FAEBD;
    dw Use_StatePointer_inX                                              ;8FAEBF;

RoomState_MagdolliteTunnel:
    dl LevelData_MagdolliteTunnel                                        ;8FAEC1;
    db $09,$00,$00                                                       ;8FAEC4;
    dw FXHeader_MagdolliteTunnel                                         ;8FAEC7;
    dw EnemyPopulations_MagdolliteTunnel                                 ;8FAEC9;
    dw EnemySets_MagdolliteTunnel                                        ;8FAECB;
    db $C1,$C1                                                           ;8FAECD;
    dw $0000                                                             ;8FAECF;
    dw $0000                                                             ;8FAED1;
    dw $0000                                                             ;8FAED3;
    dw PLMPopulation_MagdolliteTunnel                                    ;8FAED5;
    dw LibBG_Norfair_9_A_CavernStalagtites                               ;8FAED7;
    dw RTS_8F91F6                                                        ;8FAED9;

RoomDoors_MagdolliteTunnel:
    dw Door_MagdolliteTunnel_0                                           ;8FAEDB;
    dw Door_MagdolliteTunnel_1                                           ;8FAEDD;

RoomHeader_PurpleShaft:
    db $24,$02,$16,$06,$01,$03,$A0,$A0,$00                               ;8FAEDF;
    dw RoomDoors_PurpleShaft                                             ;8FAEE8;
    dw Use_StatePointer_inX                                              ;8FAEEA;

RoomState_PurpleShaft:
    dl LevelData_PurpleShaft                                             ;8FAEEC;
    db $09,$00,$00                                                       ;8FAEEF;
    dw FXHeader_PurpleShaft                                              ;8FAEF2;
    dw EnemyPopulations_PurpleShaft                                      ;8FAEF4;
    dw EnemySets_PurpleShaft                                             ;8FAEF6;
    db $C1,$C1                                                           ;8FAEF8;
    dw RoomScrolls_PurpleShaft                                           ;8FAEFA;
    dw $0000                                                             ;8FAEFC;
    dw $0000                                                             ;8FAEFE;
    dw PLMPopulation_PurpleShaft                                         ;8FAF00;
    dw LibBG_Norfair_9_PurplePatches                                     ;8FAF02;
    dw RTS_8F91F6                                                        ;8FAF04;

RoomDoors_PurpleShaft:
    dw Door_PurpleShaft_0                                                ;8FAF06;
    dw Door_PurpleShaft_1                                                ;8FAF08;
    dw Door_PurpleShaft_2                                                ;8FAF0A;

RoomScrolls_PurpleShaft:
    db $02,$02,$01                                                       ;8FAF0C;

RoomPLM_PurpleShaft_0_3:
    db $00,$02,$01,$02,$80                                               ;8FAF0F;

RoomHeader_LavaDive:
    db $25,$02,$16,$0A,$04,$03,$70,$A0,$00                               ;8FAF14;
    dw RoomDoors_LavaDive                                                ;8FAF1D;
    dw Use_StatePointer_inX                                              ;8FAF1F;

RoomState_LavaDive:
    dl LevelData_LavaDive                                                ;8FAF21;
    db $09,$00,$05                                                       ;8FAF24;
    dw FXHeader_LavaDive                                                 ;8FAF27;
    dw EnemyPopulations_LavaDive                                         ;8FAF29;
    dw EnemySets_LavaDive                                                ;8FAF2B;
    db $C1,$C1                                                           ;8FAF2D;
    dw $0000                                                             ;8FAF2F;
    dw $0000                                                             ;8FAF31;
    dw $0000                                                             ;8FAF33;
    dw PLMPopulation_LavaDive                                            ;8FAF35;
    dw LibBG_Norfair_9_A_SmallPatternBrownPurple_0                       ;8FAF37;
    dw RTS_8F91F6                                                        ;8FAF39;

RoomDoors_LavaDive:
    dw Door_LavaDive_0                                                   ;8FAF3B;
    dw Door_LavaDive_1                                                   ;8FAF3D;

RoomHeader_LowerNorfairElev:
    db $26,$02,$15,$0A,$01,$01,$70,$A0,$00                               ;8FAF3F;
    dw RoomDoors_LowerNorfairElev                                        ;8FAF48;
    dw Use_StatePointer_inX                                              ;8FAF4A;

RoomState_LowerNorfairElev:
    dl LevelData_LowerNorfairElev                                        ;8FAF4C;
    db $09,$15,$05                                                       ;8FAF4F;
    dw FXHeader_LowerNorfairElev                                         ;8FAF52;
    dw EnemyPopulations_LowerNorfairElev                                 ;8FAF54;
    dw EnemySets_LowerNorfairElev                                        ;8FAF56;
    db $C1,$C1                                                           ;8FAF58;
    dw RoomScrolls_LowerNorfairElev                                      ;8FAF5A;
    dw $0000                                                             ;8FAF5C;
    dw $0000                                                             ;8FAF5E;
    dw PLMPopulation_LowerNorfairElev                                    ;8FAF60;
    dw LibBG_Norfair_9_A_CavernStalagtites                               ;8FAF62;
    dw RTS_8F91F6                                                        ;8FAF64;

RoomDoors_LowerNorfairElev:
    dw Door_LowerNorfairElev_0                                           ;8FAF66;
    dw Door_LowerNorfairElev_1                                           ;8FAF68;
    dw Door_VariousRooms_Elevator                                        ;8FAF6A;
    dw Door_LowerNorfairElev_3                                           ;8FAF6C;

RoomScrolls_LowerNorfairElev:
    db $01                                                               ;8FAF6E;

RoomPLM_LowerNorfairElev_0:
    db $00,$02,$80                                                       ;8FAF6F;

RoomHeader_UpperNorfairFarming:
    db $27,$02,$14,$05,$02,$02,$A0,$A0,$00                               ;8FAF72;
    dw RoomDoors_UpperNorfairFarming                                     ;8FAF7B;
    dw Use_StatePointer_inX                                              ;8FAF7D;

RoomState_UpperNorfairFarming:
    dl LevelData_UpperNorfairFarming                                     ;8FAF7F;
    db $09,$00,$00                                                       ;8FAF82;
    dw FXHeader_UpperNorfairFarming                                      ;8FAF85;
    dw EnemyPopulations_UpperNorfairFarming                              ;8FAF87;
    dw EnemySets_UpperNorfairFarming                                     ;8FAF89;
    db $C0,$00                                                           ;8FAF8B;
    dw RoomScrolls_UpperNorfairFarming                                   ;8FAF8D;
    dw $0000                                                             ;8FAF8F;
    dw $0000                                                             ;8FAF91;
    dw PLMPopulation_UpperNorfairFarming                                 ;8FAF93;
    dw $0000                                                             ;8FAF95;
    dw RTS_8F91F6                                                        ;8FAF97;

RoomDoors_UpperNorfairFarming:
    dw Door_UpperNorfairFarming_0                                        ;8FAF99;
    dw Door_UpperNorfairFarming_1                                        ;8FAF9B;
    dw Door_UpperNorfairFarming_2                                        ;8FAF9D;

RoomScrolls_UpperNorfairFarming:
    db $02,$02,$01,$01                                                   ;8FAF9F;

RoomHeader_RisingTide:
    db $28,$02,$11,$04,$05,$01,$70,$A0,$00                               ;8FAFA3;
    dw RoomDoors_RisingTide                                              ;8FAFAC;
    dw Use_StatePointer_inX                                              ;8FAFAE;

RoomState_RisingTide:
    dl LevelData_RisingTide                                              ;8FAFB0;
    db $09,$00,$00                                                       ;8FAFB3;
    dw FXHeader_RisingTide                                               ;8FAFB6;
    dw EnemyPopulations_RisingTide                                       ;8FAFB8;
    dw EnemySets_RisingTide                                              ;8FAFBA;
    db $C1,$C1                                                           ;8FAFBC;
    dw $0000                                                             ;8FAFBE;
    dw $0000                                                             ;8FAFC0;
    dw $0000                                                             ;8FAFC2;
    dw PLMPopulation_RisingTide                                          ;8FAFC4;
    dw LibBG_Norfair_9_A_CavernStalagtites                               ;8FAFC6;
    dw RTS_8F91F6                                                        ;8FAFC8;

RoomDoors_RisingTide:
    dw Door_RisingTide_0                                                 ;8FAFCA;
    dw Door_RisingTide_1                                                 ;8FAFCC;

RoomHeader_AcidSnakesTunnel:
    db $29,$02,$10,$09,$04,$01,$70,$A0,$00                               ;8FAFCE;
    dw RoomDoors_AcidSnakesTunnel                                        ;8FAFD7;
    dw Use_StatePointer_inX                                              ;8FAFD9;

RoomState_AcidSnakesTunnel:
    dl LevelData_AcidSnakesTunnel                                        ;8FAFDB;
    db $09,$00,$00                                                       ;8FAFDE;
    dw FXHeader_AcidSnakesTunnel                                         ;8FAFE1;
    dw EnemyPopulations_AcidSnakesTunnel                                 ;8FAFE3;
    dw EnemySets_AcidSnakesTunnel                                        ;8FAFE5;
    db $C1,$C1                                                           ;8FAFE7;
    dw $0000                                                             ;8FAFE9;
    dw $0000                                                             ;8FAFEB;
    dw $0000                                                             ;8FAFED;
    dw PLMPopulation_AcidSnakesTunnel                                    ;8FAFEF;
    dw LibBG_Norfair_9_A_CavernStalagtites                               ;8FAFF1;
    dw RTS_8F91F6                                                        ;8FAFF3;

RoomDoors_AcidSnakesTunnel:
    dw Door_AcidSnakesTunnel_0                                           ;8FAFF5;
    dw Door_AcidSnakesTunnel_1                                           ;8FAFF7;
    dw Door_AcidSnakesTunnel_2                                           ;8FAFF9;

RoomHeader_SpikyAcidSnakesTunnel:
    db $2A,$02,$15,$09,$04,$01,$70,$A0,$00                               ;8FAFFB;
    dw RoomDoors_SpikyAcidSnakesTunnel                                   ;8FB004;
    dw Use_StatePointer_inX                                              ;8FB006;

RoomState_SpikyAcidSnakesTunnel:
    dl LevelData_SpikyAcidSnakesTunnel                                   ;8FB008;
    db $09,$00,$00                                                       ;8FB00B;
    dw FXHeader_SpikyAcidSnakesTunnel                                    ;8FB00E;
    dw EnemyPopulations_SpikyAcidSnakesTunnel                            ;8FB010;
    dw EnemySets_SpikyAcidSnakesTunnel                                   ;8FB012;
    db $C1,$C1                                                           ;8FB014;
    dw $0000                                                             ;8FB016;
    dw $0000                                                             ;8FB018;
    dw $0000                                                             ;8FB01A;
    dw PLMPopulation_SpikyAcidSnakesTunnel                               ;8FB01C;
    dw LibBG_Norfair_9_A_CavernStalagtites                               ;8FB01E;
    dw RTS_8F91F6                                                        ;8FB020;

RoomDoors_SpikyAcidSnakesTunnel:
    dw Door_SpikyAcidSnakesTunnel_0                                      ;8FB022;
    dw Door_SpikyAcidSnakesTunnel_1                                      ;8FB024;

RoomHeader_UpperNorfairRefill:
    db $2B,$02,$14,$09,$01,$01,$70,$A0,$00                               ;8FB026;
    dw RoomDoors_UpperNorfairRefill                                      ;8FB02F;
    dw Use_StatePointer_inX                                              ;8FB031;

RoomState_UpperNorfairRefill:
    dl LevelData_EnergyRefeill_BothDoors                                 ;8FB033;
    db $17,$00,$00                                                       ;8FB036;
    dw FXHeader_UpperNorfairRefill                                       ;8FB039;
    dw EnemyPopulations_UpperNorfairRefill                               ;8FB03B;
    dw EnemySets_UpperNorfairRefill                                      ;8FB03D;
    db $00,$00                                                           ;8FB03F;
    dw $0000                                                             ;8FB041;
    dw $0000                                                             ;8FB043;
    dw $0000                                                             ;8FB045;
    dw PLMPopulation_UpperNorfairRefill                                  ;8FB047;
    dw $0000                                                             ;8FB049;
    dw RTS_8F91F6                                                        ;8FB04B;

RoomDoors_UpperNorfairRefill:
    dw Door_UpperNorfairRefill_0                                         ;8FB04D;
    dw Door_UpperNorfairRefill_1                                         ;8FB04F;

RoomHeader_PurpleFarming:
    db $2C,$02,$17,$07,$01,$01,$70,$A0,$00                               ;8FB051;
    dw RoomDoors_PurpleFarming                                           ;8FB05A;
    dw Use_StatePointer_inX                                              ;8FB05C;

RoomState_PurpleFarming:
    dl LevelData_PurpleFarming                                           ;8FB05E;
    db $09,$00,$00                                                       ;8FB061;
    dw FXHeader_PurpleFarming                                            ;8FB064;
    dw EnemyPopulations_PurpleFarming                                    ;8FB066;
    dw EnemySets_PurpleFarming                                           ;8FB068;
    db $01,$01                                                           ;8FB06A;
    dw $0000                                                             ;8FB06C;
    dw $0000                                                             ;8FB06E;
    dw $0000                                                             ;8FB070;
    dw PLMPopulation_PurpleFarming                                       ;8FB072;
    dw LibBG_Norfair_9_PurplePatches                                     ;8FB074;
    dw RTS_8F91F6                                                        ;8FB076;

RoomDoors_PurpleFarming:
    dw Door_PurpleFarming_0                                              ;8FB078;

RoomHeader_BatCave:
    db $2D,$02,$18,$01,$01,$02,$70,$A0,$00                               ;8FB07A;
    dw RoomDoors_BatCave                                                 ;8FB083;
    dw Use_StatePointer_inX                                              ;8FB085;

RoomState_BatCave:
    dl LevelData_BatCave                                                 ;8FB087;
    db $09,$00,$05                                                       ;8FB08A;
    dw FXHeader_BatCave                                                  ;8FB08D;
    dw EnemyPopulations_BatCave                                          ;8FB08F;
    dw EnemySets_BatCave                                                 ;8FB091;
    db $00,$00                                                           ;8FB093;
    dw RoomScrolls_BatCave                                               ;8FB095;
    dw $0000                                                             ;8FB097;
    dw $0000                                                             ;8FB099;
    dw PLMPopulation_BatCave                                             ;8FB09B;
    dw $0000                                                             ;8FB09D;
    dw RTS_8F91F6                                                        ;8FB09F;

RoomDoors_BatCave:
    dw Door_BatCave_0                                                    ;8FB0A1;
    dw Door_BatCave_1                                                    ;8FB0A3;

RoomScrolls_BatCave:
    db $00,$01                                                           ;8FB0A5;

RoomPLM_BatCave_0:
    db $00,$02,$01,$02,$80                                               ;8FB0A7;

RoomPLM_BatCave_2:
    db $00,$02,$01,$01,$80                                               ;8FB0AC;

RoomPLM_BatCave_4:
    db $00,$00,$80                                                       ;8FB0B1;

RoomHeader_NorfairMap:
    db $2E,$02,$09,$04,$01,$01,$70,$A0,$00                               ;8FB0B4;
    dw RoomDoors_NorfairMap                                              ;8FB0BD;
    dw Use_StatePointer_inX                                              ;8FB0BF;

RoomState_NorfairMap:
    dl LevelData_MapStation_RightSideDoor                                ;8FB0C1;
    db $15,$00,$00                                                       ;8FB0C4;
    dw FXHeader_NorfairMap                                               ;8FB0C7;
    dw EnemyPopulations_NorfairMap                                       ;8FB0C9;
    dw EnemySets_NorfairMap                                              ;8FB0CB;
    db $00,$00                                                           ;8FB0CD;
    dw $0000                                                             ;8FB0CF;
    dw $0000                                                             ;8FB0D1;
    dw $0000                                                             ;8FB0D3;
    dw PLMPopulation_NorfairMap                                          ;8FB0D5;
    dw $0000                                                             ;8FB0D7;
    dw RTS_8F91F6                                                        ;8FB0D9;

RoomDoors_NorfairMap:
    dw Door_NorfairMap_0                                                 ;8FB0DB;

RoomHeader_BubbleMountainSave:
    db $2F,$02,$15,$03,$01,$01,$70,$A0,$00                               ;8FB0DD;
    dw RoomDoors_BubbleMountainSave                                      ;8FB0E6;
    dw Use_StatePointer_inX                                              ;8FB0E8;

RoomState_BubbleMountainSave:
    dl LevelData_SaveStation_RightSideDoor                               ;8FB0EA;
    db $19,$15,$05                                                       ;8FB0ED;
    dw FXHeader_BubbleMountainSave                                       ;8FB0F0;
    dw EnemyPopulations_BubbleMountainSave                               ;8FB0F2;
    dw EnemySets_BubbleMountainSave                                      ;8FB0F4;
    db $00,$00                                                           ;8FB0F6;
    dw $0000                                                             ;8FB0F8;
    dw $0000                                                             ;8FB0FA;
    dw $0000                                                             ;8FB0FC;
    dw PLMPopulation_BubbleMountainSave                                  ;8FB0FE;
    dw $0000                                                             ;8FB100;
    dw RTS_8F91F6                                                        ;8FB102;

RoomDoors_BubbleMountainSave:
    dw Door_BubbleMountainSave_0                                         ;8FB104;

RoomHeader_FrogSpeedway:
    db $30,$02,$0C,$05,$08,$01,$70,$A0,$00                               ;8FB106;
    dw RoomDoors_FrogSpeedway                                            ;8FB10F;
    dw Use_StatePointer_inX                                              ;8FB111;

RoomState_FrogSpeedway:
    dl LevelData_FrogSpeedway                                            ;8FB113;
    db $0A,$00,$00                                                       ;8FB116;
    dw FXHeader_FrogSpeedway                                             ;8FB119;
    dw EnemyPopulations_FrogSpeedway                                     ;8FB11B;
    dw EnemySets_FrogSpeedway                                            ;8FB11D;
    db $C1,$01                                                           ;8FB11F;
    dw RoomScrolls_FrogSpeedway                                          ;8FB121;
    dw $0000                                                             ;8FB123;
    dw $0000                                                             ;8FB125;
    dw PLMPopulation_FrogSpeedway                                        ;8FB127;
    dw LibBG_Norfair_9_A_SmallPatternBrownPurple_Bright                  ;8FB129;
    dw RTS_8F91F6                                                        ;8FB12B;

RoomDoors_FrogSpeedway:
    dw Door_FrogSpeedway_0                                               ;8FB12D;
    dw Door_FrogSpeedway_1                                               ;8FB12F;

RoomScrolls_FrogSpeedway:
    db $01,$01,$01,$01,$01,$01,$01,$01                                   ;8FB131;

RoomHeader_RedPirateShaft:
    db $31,$02,$13,$06,$01,$03,$70,$A0,$00                               ;8FB139;
    dw RoomDoors_RedPirateShaft                                          ;8FB142;
    dw Use_StatePointer_inX                                              ;8FB144;

RoomState_RedPirateShaft:
    dl LevelData_RedPirateShaft                                          ;8FB146;
    db $09,$00,$00                                                       ;8FB149;
    dw FXHeader_RedPirateShaft                                           ;8FB14C;
    dw EnemyPopulations_RedPirateShaft                                   ;8FB14E;
    dw EnemySets_RedPirateShaft                                          ;8FB150;
    db $01,$C1                                                           ;8FB152;
    dw RoomScrolls_RedPirateShaft                                        ;8FB154;
    dw $0000                                                             ;8FB156;
    dw $0000                                                             ;8FB158;
    dw PLMPopulation_RedPirateShaft                                      ;8FB15A;
    dw LibBG_Norfair_9_A_CavernVertical                                  ;8FB15C;
    dw RTS_8F91F6                                                        ;8FB15E;

RoomDoors_RedPirateShaft:
    dw Door_RedPirateShaft_0                                             ;8FB160;
    dw Door_RedPirateShaft_1                                             ;8FB162;

RoomScrolls_RedPirateShaft:
    db $02,$02,$02                                                       ;8FB164;

RoomHeader_FrogSave:
    db $32,$02,$0B,$05,$01,$01,$70,$A0,$00                               ;8FB167;
    dw RoomDoors_FrogSave                                                ;8FB170;
    dw Use_StatePointer_inX                                              ;8FB172;

RoomState_FrogSave:
    dl LevelData_SaveStation_BothDoors                                   ;8FB174;
    db $19,$15,$05                                                       ;8FB177;
    dw FXHeader_FrogSave                                                 ;8FB17A;
    dw EnemyPopulations_FrogSave                                         ;8FB17C;
    dw EnemySets_FrogSave                                                ;8FB17E;
    db $00,$00                                                           ;8FB180;
    dw $0000                                                             ;8FB182;
    dw $0000                                                             ;8FB184;
    dw $0000                                                             ;8FB186;
    dw PLMPopulation_FrogSave                                            ;8FB188;
    dw $0000                                                             ;8FB18A;
    dw RTS_8F91F6                                                        ;8FB18C;

RoomDoors_FrogSave:
    dw Door_FrogSave_0                                                   ;8FB18E;
    dw Door_FrogSave_1                                                   ;8FB190;

RoomHeader_CrocomireSave:
    db $33,$02,$10,$08,$01,$01,$70,$A0,$00                               ;8FB192;
    dw RoomDoors_CrocomireSave                                           ;8FB19B;
    dw Use_StatePointer_inX                                              ;8FB19D;

RoomState_CrocomireSave:
    dl LevelData_SaveStation_LeftSideDoor                                ;8FB19F;
    db $19,$15,$05                                                       ;8FB1A2;
    dw FXHeader_CrocomireSave                                            ;8FB1A5;
    dw EnemyPopulations_CrocomireSave                                    ;8FB1A7;
    dw EnemySets_CrocomireSave                                           ;8FB1A9;
    db $00,$00                                                           ;8FB1AB;
    dw $0000                                                             ;8FB1AD;
    dw $0000                                                             ;8FB1AF;
    dw $0000                                                             ;8FB1B1;
    dw PLMPopulation_CrocomireSave                                       ;8FB1B3;
    dw $0000                                                             ;8FB1B5;
    dw RTS_8F91F6                                                        ;8FB1B7;

RoomDoors_CrocomireSave:
    dw Door_CrocomireSave_0                                              ;8FB1B9;

RoomHeader_LNElevSave:
    db $34,$02,$14,$0A,$01,$01,$70,$A0,$00                               ;8FB1BB;
    dw RoomDoors_LNElevSave                                              ;8FB1C4;
    dw Use_StatePointer_inX                                              ;8FB1C6;

RoomState_LNElevSave:
    dl LevelData_SaveStation_RightSideDoor                               ;8FB1C8;
    db $19,$15,$05                                                       ;8FB1CB;
    dw FXHeader_LNElevSave                                               ;8FB1CE;
    dw EnemyPopulations_LNElevSave                                       ;8FB1D0;
    dw EnemySets_LNElevSave                                              ;8FB1D2;
    db $00,$00                                                           ;8FB1D4;
    dw RoomScrolls_LNElevSave                                            ;8FB1D6;
    dw $0000                                                             ;8FB1D8;
    dw $0000                                                             ;8FB1DA;
    dw PLMPopulation_LNElevSave                                          ;8FB1DC;
    dw $0000                                                             ;8FB1DE;
    dw $0000                                                             ;8FB1E0;

RoomDoors_LNElevSave:
    dw Door_LNElevSave_0                                                 ;8FB1E2;

RoomScrolls_LNElevSave:
    db $01                                                               ;8FB1E4;

RoomHeader_AcidStatue:
    db $35,$02,$0F,$0D,$03,$03,$90,$A0,$00                               ;8FB1E5;
    dw RoomDoors_AcidStatue                                              ;8FB1EE;
    dw Use_StatePointer_inX                                              ;8FB1F0;

RoomState_AcidStatue:
    dl LevelData_AcidStatue                                              ;8FB1F2;
    db $09,$18,$05                                                       ;8FB1F5;
    dw FXHeader_AcidStatue                                               ;8FB1F8;
    dw EnemyPopulations_AcidStatue                                       ;8FB1FA;
    dw EnemySets_AcidStatue                                              ;8FB1FC;
    db $C1,$C1                                                           ;8FB1FE;
    dw RoomScrolls_AcidStatue                                            ;8FB200;
    dw $0000                                                             ;8FB202;
    dw $0000                                                             ;8FB204;
    dw PLMPopulation_AcidStatue                                          ;8FB206;
    dw LibBG_Norfair_9_CavernRoomPillars                                 ;8FB208;
    dw RTS_8F91F7                                                        ;8FB20A;

RoomDoors_AcidStatue:
    dw Door_AcidStatue_0                                                 ;8FB20C;
    dw Door_AcidStatue_1                                                 ;8FB20E;

RoomScrolls_AcidStatue:
    db $02,$02,$00,$01,$01,$00,$00,$00,$00                               ;8FB210;

UNUSED_RoomPLM_8FB219:
    db $03,$01,$04,$01,$06,$00,$07,$00,$08,$00,$80                       ;8FB219;

RoomPLM_AcidStatue_0:
    db $03,$02,$04,$02,$06,$02,$07,$02,$80                               ;8FB224;

RoomPLM_AcidStatue_1:
    db $04,$00,$06,$01,$07,$01,$08,$01,$80                               ;8FB22D;

RoomHeader_MainHall:
    db $36,$02,$11,$0B,$08,$03,$70,$A0,$00                               ;8FB236;
    dw RoomDoors_MainHall                                                ;8FB23F;
    dw Use_StatePointer_inX                                              ;8FB241;

RoomState_MainHall:
    dl LevelData_MainHall                                                ;8FB243;
    db $09,$18,$05                                                       ;8FB246;
    dw FXHeader_MainHall                                                 ;8FB249;
    dw EnemyPopulations_MainHall                                         ;8FB24B;
    dw EnemySets_MainHall                                                ;8FB24D;
    db $C1,$01                                                           ;8FB24F;
    dw RoomScrolls_MainHall                                              ;8FB251;
    dw $0000                                                             ;8FB253;
    dw $0000                                                             ;8FB255;
    dw PLMPopulation_MainHall                                            ;8FB257;
    dw LibBG_Norfair_9_CavernVerticalRuins                               ;8FB259;
    dw RTS_8F91F7                                                        ;8FB25B;

RoomDoors_MainHall:
    dw Door_MainHall_0                                                   ;8FB25D;
    dw Door_MainHall_1                                                   ;8FB25F;
    dw Door_MainHall_2                                                   ;8FB261;
    dw Door_VariousRooms_Elevator                                        ;8FB263;

RoomScrolls_MainHall:
    db $00,$00,$00,$00,$02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8FB265;
    db $01,$01,$01,$01,$01,$01,$01,$01                                   ;8FB275;

RoomPLM_MainHall_0_2:
    db $0C,$02,$80                                                       ;8FB27D;

RoomPLM_MainHall_4:
    db $0C,$00,$80                                                       ;8FB280;

RoomHeader_GoldenTorizo:
    db $37,$02,$12,$0F,$02,$02,$70,$A0,$00                               ;8FB283;
    dw RoomDoors_GoldenTorizo                                            ;8FB28C;
    dw RoomStateCheck_BossIsDead                                         ;8FB28E;
    db $04                                                               ;8FB290;
    dw RoomState_GoldenTorizo_1                                          ;8FB291;
    dw Use_StatePointer_inX                                              ;8FB293;

RoomState_GoldenTorizo_0:
    dl LevelData_GoldenTorizo                                            ;8FB295;
    db $09,$24,$03                                                       ;8FB298;
    dw FXHeader_GoldenTorizo_State0_1                                    ;8FB29B;
    dw EnemyPopulations_GoldenTorizo                                     ;8FB29D;
    dw EnemySets_GoldenTorizo                                            ;8FB29F;
    db $C0,$00                                                           ;8FB2A1;
    dw RoomScrolls_GoldenTorizo                                          ;8FB2A3;
    dw $0000                                                             ;8FB2A5;
    dw $0000                                                             ;8FB2A7;
    dw PLMPopulation_GoldenTorizo_State0_1                               ;8FB2A9;
    dw $0000                                                             ;8FB2AB;
    dw RTS_8F91F7                                                        ;8FB2AD;

RoomState_GoldenTorizo_1:
    dl LevelData_GoldenTorizo                                            ;8FB2AF;
    db $09,$00,$03                                                       ;8FB2B2;
    dw FXHeader_GoldenTorizo_State0_1                                    ;8FB2B5;
    dw EnemyPopulations_GoldenTorizo                                     ;8FB2B7;
    dw EnemySets_GoldenTorizo                                            ;8FB2B9;
    db $C0,$00                                                           ;8FB2BB;
    dw RoomScrolls_GoldenTorizo                                          ;8FB2BD;
    dw $0000                                                             ;8FB2BF;
    dw $0000                                                             ;8FB2C1;
    dw PLMPopulation_GoldenTorizo_State0_1                               ;8FB2C3;
    dw $0000                                                             ;8FB2C5;
    dw RTS_8F91F7                                                        ;8FB2C7;

RoomDoors_GoldenTorizo:
    dw Door_GoldenTorizo_0                                               ;8FB2C9;
    dw Door_GoldenTorizo_1                                               ;8FB2CB;

RoomScrolls_GoldenTorizo:
    db $02,$02,$01,$01                                                   ;8FB2CD;

RoomPLM_GoldenTorizo_0:
    db $00,$02,$01,$02,$02,$01,$03,$01,$80                               ;8FB2D1;

RoomHeader_FastRipper:
    db $38,$02,$15,$0E,$04,$01,$70,$A0,$00                               ;8FB2DA;
    dw RoomDoors_FastRipper                                              ;8FB2E3;
    dw Use_StatePointer_inX                                              ;8FB2E5;

RoomState_FastRipper:
    dl LevelData_FastRipper                                              ;8FB2E7;
    db $09,$18,$05                                                       ;8FB2EA;
    dw FXHeader_FastRipper                                               ;8FB2ED;
    dw EnemyPopulations_FastRipper                                       ;8FB2EF;
    dw EnemySets_FastRipper                                              ;8FB2F1;
    db $C1,$C1                                                           ;8FB2F3;
    dw $0000                                                             ;8FB2F5;
    dw $0000                                                             ;8FB2F7;
    dw $0000                                                             ;8FB2F9;
    dw PLMPopulation_FastRipper                                          ;8FB2FB;
    dw LibBG_Norfair_9_CavernVerticalRuins                               ;8FB2FD;
    dw RTS_8F91F7                                                        ;8FB2FF;

RoomDoors_FastRipper:
    dw Door_FastRipper_0                                                 ;8FB301;
    dw Door_FastRipper_1                                                 ;8FB303;

RoomHeader_GTEnergyRefill:
    db $39,$02,$15,$0F,$01,$01,$70,$A0,$00                               ;8FB305;
    dw RoomDoors_GTEnergyRefill                                          ;8FB30E;
    dw Use_StatePointer_inX                                              ;8FB310;

RoomState_GTEnergyRefill:
    dl LevelData_EnergyRefill_LeftSideDoor                               ;8FB312;
    db $17,$00,$03                                                       ;8FB315;
    dw FXHeader_GTEnergyRefill                                           ;8FB318;
    dw EnemyPopulations_GTEnergyRefill                                   ;8FB31A;
    dw EnemySets_GTEnergyRefill                                          ;8FB31C;
    db $00,$00                                                           ;8FB31E;
    dw $0000                                                             ;8FB320;
    dw $0000                                                             ;8FB322;
    dw $0000                                                             ;8FB324;
    dw PLMPopulation_GTEnergyRefill                                      ;8FB326;
    dw $0000                                                             ;8FB328;
    dw RTS_8F91F7                                                        ;8FB32A;

RoomDoors_GTEnergyRefill:
    dw Door_GTEnergyRefill_0                                             ;8FB32C;

RoomHeader_Ridley:
    db $3A,$02,$17,$10,$01,$02,$70,$A0,$00                               ;8FB32E;
    dw RoomDoors_Ridley                                                  ;8FB337;
    dw RoomStateCheck_BossIsDead                                         ;8FB339;
    db $01                                                               ;8FB33B;
    dw RoomState_Ridley_1                                                ;8FB33C;
    dw Use_StatePointer_inX                                              ;8FB33E;

RoomState_Ridley_0:
    dl LevelData_Ridley                                                  ;8FB340;
    db $09,$24,$04                                                       ;8FB343;
    dw FXHeader_Ridley_State0_1                                          ;8FB346;
    dw EnemyPopulations_Ridley                                           ;8FB348;
    dw EnemySets_Ridley                                                  ;8FB34A;
    db $01,$C1                                                           ;8FB34C;
    dw RoomScrolls_Ridley                                                ;8FB34E;
    dw $0000                                                             ;8FB350;
    dw MainASM_RidleysRoomShaking                                        ;8FB352;
    dw PLMPopulation_Ridley_State0_1                                     ;8FB354;
    dw LibBG_Norfair_9_CavernRoomPillars                                 ;8FB356;
    dw RTS_8F91F7                                                        ;8FB358;

RoomState_Ridley_1:
    dl LevelData_Ridley                                                  ;8FB35A;
    db $09,$00,$03                                                       ;8FB35D;
    dw FXHeader_Ridley_State0_1                                          ;8FB360;
    dw EnemyPopulations_Ridley                                           ;8FB362;
    dw EnemySets_Ridley                                                  ;8FB364;
    db $01,$C1                                                           ;8FB366;
    dw RoomScrolls_Ridley                                                ;8FB368;
    dw $0000                                                             ;8FB36A;
    dw MainASM_RidleysRoomShaking                                        ;8FB36C;
    dw PLMPopulation_Ridley_State0_1                                     ;8FB36E;
    dw LibBG_Norfair_9_CavernRoomPillars                                 ;8FB370;
    dw RTS_8F91F7                                                        ;8FB372;

RoomDoors_Ridley:
    dw Door_Ridley_0                                                     ;8FB374;
    dw Door_Ridley_1                                                     ;8FB376;

RoomScrolls_Ridley:
    db $02,$02                                                           ;8FB378;

RoomHeader_LNFarming:
    db $3B,$02,$18,$10,$03,$01,$70,$A0,$00                               ;8FB37A;
    dw RoomDoors_LNFarming                                               ;8FB383;
    dw Use_StatePointer_inX                                              ;8FB385;

RoomState_LNFarming:
    dl LevelData_LNFarming                                               ;8FB387;
    db $09,$18,$05                                                       ;8FB38A;
    dw FXHeader_LNFarming                                                ;8FB38D;
    dw EnemyPopulations_LNFarming                                        ;8FB38F;
    dw EnemySets_LNFarming                                               ;8FB391;
    db $C1,$C1                                                           ;8FB393;
    dw $0000                                                             ;8FB395;
    dw $0000                                                             ;8FB397;
    dw $0000                                                             ;8FB399;
    dw PLMPopulation_LNFarming                                           ;8FB39B;
    dw LibBG_Norfair_9_RoomStatues                                       ;8FB39D;
    dw RTS_8F91F7                                                        ;8FB39F;

RoomDoors_LNFarming:
    dw Door_LNFarming_0                                                  ;8FB3A1;
    dw Door_LNFarming_1                                                  ;8FB3A3;

RoomHeader_FastPillarsSetup:
    db $3C,$02,$19,$0C,$01,$03,$70,$A0,$00                               ;8FB3A5;
    dw RoomDoors_FastPillarsSetup                                        ;8FB3AE;
    dw Use_StatePointer_inX                                              ;8FB3B0;

RoomState_FastPillarsSetup:
    dl LevelData_FastPillarsSetup                                        ;8FB3B2;
    db $09,$00,$00                                                       ;8FB3B5;
    dw FXHeader_FastPillarsSetup                                         ;8FB3B8;
    dw EnemyPopulations_FastPillarsSetup                                 ;8FB3BA;
    dw EnemySets_FastPillarsSetup                                        ;8FB3BC;
    db $C1,$C1                                                           ;8FB3BE;
    dw RoomScrolls_FastPillarsSetup                                      ;8FB3C0;
    dw $0000                                                             ;8FB3C2;
    dw $0000                                                             ;8FB3C4;
    dw PLMPopulation_FastPillarsSetup                                    ;8FB3C6;
    dw LibBG_Norfair_9_VeritcalPatternBrick                              ;8FB3C8;
    dw RTS_8F91F7                                                        ;8FB3CA;

RoomDoors_FastPillarsSetup:
    dw Door_FastPillarsSetup_0                                           ;8FB3CC;
    dw Door_FastPillarsSetup_1                                           ;8FB3CE;
    dw Door_FastPillarsSetup_2                                           ;8FB3D0;
    dw Door_FastPillarsSetup_3                                           ;8FB3D2;
    dw Door_FastPillarsSetup_4                                           ;8FB3D4;

RoomScrolls_FastPillarsSetup:
    db $02,$01,$00                                                       ;8FB3D6;

RoomPLM_FastPillarsSetup_0:
    db $01,$02,$80                                                       ;8FB3D9;

RoomPLM_FastPillarsSetup_2:
    db $01,$02,$02,$01,$80                                               ;8FB3DC;

UNUSED_RoomHeader_8FB3E1:
    db $3D,$02,$1A,$0B,$01,$01,$70,$A0,$00                               ;8FB3E1;
    dw UNUSED_RoomDoors_8FB408                                           ;8FB3EA;
    dw Use_StatePointer_inX                                              ;8FB3EC;

UNUSED_RoomState_8FB3EE:
    dl UNUSED_LevelData_C8F40B                                           ;8FB3EE;
    db $09,$00,$00                                                       ;8FB3F1;
    dw UNUSED_FXHeader_8387EC                                            ;8FB3F4;
    dw UNUSED_EnemyPopulations_8FB3EE_A1AD06                             ;8FB3F6;
    dw UNUSED_EnemySets_State8FB3EE_B48899                               ;8FB3F8;
    db $C1,$C1                                                           ;8FB3FA;
    dw $0000                                                             ;8FB3FC;
    dw $0000                                                             ;8FB3FE;
    dw $0000                                                             ;8FB400;
    dw UNUSED_PLMPopulation_8FB3EE                                       ;8FB402;
    dw LibBG_Norfair_9_HorizontalPatternBrick                            ;8FB404;
    dw RTS_8F91F7                                                        ;8FB406;

UNUSED_RoomDoors_8FB408:
    dw UNUSED_Door_83991E                                                ;8FB408;

RoomHeader_MickeyMouse:
    db $3E,$02,$1A,$09,$04,$04,$70,$A0,$00                               ;8FB40A;
    dw RoomDoors_MickeyMouse                                             ;8FB413;
    dw Use_StatePointer_inX                                              ;8FB415;

RoomState_MickeyMouse:
    dl LevelData_MickeyMouse                                             ;8FB417;
    db $09,$00,$00                                                       ;8FB41A;
    dw FXHeader_MickeyMouse                                              ;8FB41D;
    dw EnemyPopulations_MickeyMouse                                      ;8FB41F;
    dw EnemySets_MickeyMouse                                             ;8FB421;
    db $C1,$C1                                                           ;8FB423;
    dw RoomScrolls_MickeyMouse                                           ;8FB425;
    dw $0000                                                             ;8FB427;
    dw $0000                                                             ;8FB429;
    dw PLMPopulation_MickeyMouse                                         ;8FB42B;
    dw LibBG_Norfair_9_PurplePatches                                     ;8FB42D;
    dw RTS_8F91F7                                                        ;8FB42F;

RoomDoors_MickeyMouse:
    dw Door_MickeyMouse_0                                                ;8FB431;
    dw Door_MickeyMouse_1                                                ;8FB433;

RoomScrolls_MickeyMouse:
    db $00,$00,$00,$02,$00,$00,$00,$02,$00,$00,$00,$02,$01,$01,$01,$01   ;8FB435;

RoomPLM_MickeyMouse_0:
    db $06,$01,$80                                                       ;8FB445;

RoomPLM_MickeyMouse_1:
    db $06,$00,$80                                                       ;8FB448;

RoomPLM_MickeyMouse_2:
    db $07,$01,$80                                                       ;8FB44B;

RoomPLM_MickeyMouse_6:
    db $07,$00,$80                                                       ;8FB44E;

RoomPLM_MickeyMouse_A:
    db $0E,$01,$80                                                       ;8FB451;

RoomPLM_MickeyMouse_D:
    db $0E,$00,$80                                                       ;8FB454;

RoomHeader_Pillar:
    db $3F,$02,$1A,$0E,$04,$01,$70,$A0,$00                               ;8FB457;
    dw RoomDoors_Pillar                                                  ;8FB460;
    dw Use_StatePointer_inX                                              ;8FB462;

RoomState_Pillar:
    dl LevelData_Pillar                                                  ;8FB464;
    db $09,$00,$00                                                       ;8FB467;
    dw FXHeader_Pillar                                                   ;8FB46A;
    dw EnemyPopulations_Pillar                                           ;8FB46C;
    dw EnemySets_Pillar                                                  ;8FB46E;
    db $C1,$C1                                                           ;8FB470;
    dw $0000                                                             ;8FB472;
    dw $0000                                                             ;8FB474;
    dw $0000                                                             ;8FB476;
    dw PLMPopulation_Pillar                                              ;8FB478;
    dw LibBG_Norfair_9_CavernVerticalRuins                               ;8FB47A;
    dw RTS_8F91F7                                                        ;8FB47C;

RoomDoors_Pillar:
    dw Door_Pillar_0                                                     ;8FB47E;
    dw Door_Pillar_1                                                     ;8FB480;

RoomHeader_Plowerhouse:
    db $40,$02,$1B,$10,$03,$01,$70,$A0,$00                               ;8FB482;
    dw RoomDoors_Plowerhouse                                             ;8FB48B;
    dw Use_StatePointer_inX                                              ;8FB48D;

RoomState_Plowerhouse:
    dl LevelData_Plowerhouse                                             ;8FB48F;
    db $09,$00,$00                                                       ;8FB492;
    dw FXHeader_Plowerhouse                                              ;8FB495;
    dw EnemyPopulations_Plowerhouse                                      ;8FB497;
    dw EnemySets_Plowerhouse                                             ;8FB499;
    db $C1,$C1                                                           ;8FB49B;
    dw $0000                                                             ;8FB49D;
    dw $0000                                                             ;8FB49F;
    dw $0000                                                             ;8FB4A1;
    dw PLMPopulation_Plowerhouse                                         ;8FB4A3;
    dw LibBG_Norfair_9_RoomStatues                                       ;8FB4A5;
    dw RTS_8F91F7                                                        ;8FB4A7;

RoomDoors_Plowerhouse:
    dw Door_Plowerhouse_0                                                ;8FB4A9;
    dw Door_Plowerhouse_1                                                ;8FB4AB;

RoomHeader_WorstRoomInTheGame:
    db $41,$02,$1E,$09,$01,$06,$70,$A0,$00                               ;8FB4AD;
    dw RoomDoors_WorstRoomInTheGame                                      ;8FB4B6;
    dw Use_StatePointer_inX                                              ;8FB4B8;

RoomState_WorstRoomInTheGame:
    dl LevelData_WorstRoomInTheGame                                      ;8FB4BA;
    db $09,$00,$00                                                       ;8FB4BD;
    dw FXHeader_WorstRoomInTheGame                                       ;8FB4C0;
    dw EnemyPopulations_WorstRoomInTheGame                               ;8FB4C2;
    dw EnemySets_WorstRoomInTheGame                                      ;8FB4C4;
    db $C1,$C1                                                           ;8FB4C6;
    dw RoomScrolls_WorstRoomInTheGame                                    ;8FB4C8;
    dw $0000                                                             ;8FB4CA;
    dw $0000                                                             ;8FB4CC;
    dw PLMPopulation_WorstRoomInTheGame                                  ;8FB4CE;
    dw LibBG_Norfair_9_CavernHorizontalRuins                             ;8FB4D0;
    dw RTS_8F91F7                                                        ;8FB4D2;

RoomDoors_WorstRoomInTheGame:
    dw Door_WorstRoomInTheGame_0                                         ;8FB4D4;
    dw Door_WorstRoomInTheGame_1                                         ;8FB4D6;
    dw Door_WorstRoomInTheGame_2                                         ;8FB4D8;

RoomScrolls_WorstRoomInTheGame:
    db $00,$02,$02,$02,$02,$01                                           ;8FB4DA;

RoomPLM_WorstRoomInTheGame_0:
    db $00,$02,$01,$02,$80                                               ;8FB4E0;

RoomHeader_Amphitheatre:
    db $42,$02,$1F,$09,$04,$05,$70,$A0,$00                               ;8FB4E5;
    dw RoomDoors_Amphitheatre                                            ;8FB4EE;
    dw Use_StatePointer_inX                                              ;8FB4F0;

RoomState_Amphitheatre:
    dl LevelData_Amphitheatre                                            ;8FB4F2;
    db $09,$00,$00                                                       ;8FB4F5;
    dw FXHeader_Amphitheatre                                             ;8FB4F8;
    dw EnemyPopulations_Amphitheatre                                     ;8FB4FA;
    dw EnemySets_Amphitheatre                                            ;8FB4FC;
    db $C1,$C1                                                           ;8FB4FE;
    dw $0000                                                             ;8FB500;
    dw $0000                                                             ;8FB502;
    dw $0000                                                             ;8FB504;
    dw PLMPopulation_Amphitheatre                                        ;8FB506;
    dw LibBG_Norfair_9_A_SmallPatternBrownPurple_0                       ;8FB508;
    dw RTS_8F91F7                                                        ;8FB50A;

RoomDoors_Amphitheatre:
    dw Door_Amphitheatre_0                                               ;8FB50C;
    dw Door_Amphitheatre_1                                               ;8FB50E;

RoomHeader_LNSpringBallMaze:
    db $43,$02,$21,$05,$05,$02,$70,$A0,$00                               ;8FB510;
    dw RoomDoors_LNSpringBallMaze                                        ;8FB519;
    dw Use_StatePointer_inX                                              ;8FB51B;

RoomState_LNSpringBallMaze:
    dl LevelData_LNSpringBallMaze                                        ;8FB51D;
    db $09,$00,$05                                                       ;8FB520;
    dw FXHeader_LNSpringballMaze                                         ;8FB523;
    dw EnemyPopulations_LNSpringBallMaze                                 ;8FB525;
    dw EnemySets_LNSpringBallMaze                                        ;8FB527;
    db $C1,$C1                                                           ;8FB529;
    dw RoomScrolls_LNSpringBallMaze                                      ;8FB52B;
    dw $0000                                                             ;8FB52D;
    dw $0000                                                             ;8FB52F;
    dw PLMPopulation_LNSpringBallMaze                                    ;8FB531;
    dw LibBG_Norfair_9_PurplePatches                                     ;8FB533;
    dw RTS_8F91F7                                                        ;8FB535;

RoomDoors_LNSpringBallMaze:
    dw Door_LNSpringBallMaze_0                                           ;8FB537;
    dw Door_LNSpringBallMaze_1                                           ;8FB539;
    dw Door_LNSpringBallMaze_2                                           ;8FB53B;

RoomScrolls_LNSpringBallMaze:
    db $02,$00,$00,$00,$00,$01,$01,$00,$00,$00                           ;8FB53D;

RoomPLM_LNSpringBallMaze_0:
    db $01,$01,$02,$01,$06,$00,$80                                       ;8FB547;

RoomPLM_LNSpringBallMaze_4:
    db $01,$00,$02,$00,$06,$01,$80                                       ;8FB54E;

RoomPLM_LNSpringBallMaze_C:
    db $03,$01,$04,$02,$80                                               ;8FB555;

RoomHeader_LNEscapePowerBombs:
    db $44,$02,$25,$06,$01,$01,$70,$A0,$00                               ;8FB55A;
    dw RoomDoors_LNEscapePowerBombs                                      ;8FB563;
    dw Use_StatePointer_inX                                              ;8FB565;

RoomState_LNEscapePowerBombs:
    dl LevelData_LNEscapePowerBombs                                      ;8FB567;
    db $09,$00,$00                                                       ;8FB56A;
    dw FXHeader_LNEscapePowerBombs                                       ;8FB56D;
    dw EnemyPopulations_LNEscapePowerBombs                               ;8FB56F;
    dw EnemySets_LNEscapePowerBombs                                      ;8FB571;
    db $C1,$C1                                                           ;8FB573;
    dw $0000                                                             ;8FB575;
    dw $0000                                                             ;8FB577;
    dw $0000                                                             ;8FB579;
    dw PLMPopulation_LNEscapePowerBombs                                  ;8FB57B;
    dw LibBG_Norfair_9_CavernRoomPillars                                 ;8FB57D;
    dw RTS_8F91F7                                                        ;8FB57F;

RoomDoors_LNEscapePowerBombs:
    dw Door_LNEscapePowerBombs_0                                         ;8FB581;
    dw Door_LNEscapePowerBombs_1                                         ;8FB583;

RoomHeader_RedKihunterShaft:
    db $45,$02,$23,$09,$03,$05,$70,$A0,$00                               ;8FB585;
    dw RoomDoors_RedKihunterShaft                                        ;8FB58E;
    dw Use_StatePointer_inX                                              ;8FB590;

RoomState_RedKihunterShaft:
    dl LevelData_RedKihunterShaft                                        ;8FB592;
    db $09,$00,$00                                                       ;8FB595;
    dw FXHeader_RedKihunterShaft                                         ;8FB598;
    dw EnemyPopulations_RedKihunterShaft                                 ;8FB59A;
    dw EnemySets_RedKihunterShaft                                        ;8FB59C;
    db $C1,$C1                                                           ;8FB59E;
    dw RoomScrolls_RedKihunterShaft                                      ;8FB5A0;
    dw $0000                                                             ;8FB5A2;
    dw $0000                                                             ;8FB5A4;
    dw PLMPopulation_RedKihunterShaft                                    ;8FB5A6;
    dw LibBG_Norfair_9_A_SmallPatternBrownPurple_0                       ;8FB5A8;
    dw RTS_8F91F7                                                        ;8FB5AA;

RoomDoors_RedKihunterShaft:
    dw Door_RedKihunterShaft_0                                           ;8FB5AC;
    dw Door_RedKihunterShaft_1                                           ;8FB5AE;
    dw Door_RedKihunterShaft_2                                           ;8FB5B0;
    dw Door_RedKihunterShaft_3                                           ;8FB5B2;

RoomScrolls_RedKihunterShaft:
    db $02,$00,$00,$02,$00,$00,$02,$00,$00,$02,$00,$00,$02,$00,$02       ;8FB5B4;

RoomPLM_RedKihunterShaft_0_4:
    db $0A,$02,$0D,$02,$80                                               ;8FB5C3;

RoomPLM_RedKihunterShaft_3_5:
    db $0A,$00,$0D,$00,$80                                               ;8FB5C8;

RoomPLM_RedKihunterShaft_6:
    db $00,$02,$03,$02,$80                                               ;8FB5CD;

RoomPLM_RedKihunterShaft_A:
    db $00,$02,$80                                                       ;8FB5D2;

RoomHeader_Wasteland:
    db $46,$02,$20,$0E,$06,$03,$70,$A0,$00                               ;8FB5D5;
    dw RoomDoors_Wasteland                                               ;8FB5DE;
    dw Use_StatePointer_inX                                              ;8FB5E0;

RoomState_Wasteland:
    dl LevelData_Wasteland                                               ;8FB5E2;
    db $09,$00,$00                                                       ;8FB5E5;
    dw FXHeader_Wasteland                                                ;8FB5E8;
    dw EnemyPopulations_Wasteland                                        ;8FB5EA;
    dw EnemySets_Wasteland                                               ;8FB5EC;
    db $C1,$C1                                                           ;8FB5EE;
    dw RoomScrolls_Wasteland                                             ;8FB5F0;
    dw $0000                                                             ;8FB5F2;
    dw $0000                                                             ;8FB5F4;
    dw PLMPopulation_Wasteland                                           ;8FB5F6;
    dw LibBG_Norfair_9_CavernRoomPillars                                 ;8FB5F8;
    dw RTS_8F91F7                                                        ;8FB5FA;

RoomDoors_Wasteland:
    dw Door_Wasteland_0                                                  ;8FB5FC;
    dw Door_Wasteland_1                                                  ;8FB5FE;

RoomScrolls_Wasteland:
    db $00,$01,$01,$01,$00,$01,$00,$00,$00,$00,$00,$00,$00,$02,$00,$00   ;8FB600;
    db $00,$00                                                           ;8FB610;

RoomPLM_Wasteland_0:
    db $07,$02,$80                                                       ;8FB612;

RoomPLM_Wasteland_2:
    db $01,$01,$07,$00,$80                                               ;8FB615;

RoomPLM_Wasteland_8_C:
    db $04,$01,$80                                                       ;8FB61A;

RoomPLM_Wasteland_A:
    db $00,$01,$01,$01,$80                                               ;8FB61D;

RoomPLM_Wasteland_9_B:
    db $04,$00,$80                                                       ;8FB622;

RoomPLM_Wasteland_D:
    db $00,$00,$80                                                       ;8FB625;

RoomPLM_Wasteland_11:
    db $01,$00,$80                                                       ;8FB628;

RoomHeader_MetalPirates:
    db $47,$02,$1E,$10,$03,$01,$70,$A0,$00                               ;8FB62B;
    dw RoomDoors_MetalPirates                                            ;8FB634;
    dw Use_StatePointer_inX                                              ;8FB636;

RoomState_MetalPirates:
    dl LevelData_MetalPirates                                            ;8FB638;
    db $09,$00,$00                                                       ;8FB63B;
    dw FXHeader_MetalPirates                                             ;8FB63E;
    dw EnemyPopulations_MetalPirates                                     ;8FB640;
    dw EnemySets_MetalPirates                                            ;8FB642;
    db $C1,$C1                                                           ;8FB644;
    dw $0000                                                             ;8FB646;
    dw $0000                                                             ;8FB648;
    dw $0000                                                             ;8FB64A;
    dw PLMPopulation_MetalPirates                                        ;8FB64C;
    dw LibBG_Norfair_9_RoomStatues                                       ;8FB64E;
    dw RTS_8F91F7                                                        ;8FB650;

RoomDoors_MetalPirates:
    dw Door_MetalPirates_0                                               ;8FB652;
    dw Door_MetalPirates_1                                               ;8FB654;

RoomHeader_ThreeMusketeers:
    db $48,$02,$1D,$03,$04,$03,$70,$A0,$00                               ;8FB656;
    dw RoomDoors_ThreeMusketeers                                         ;8FB65F;
    dw Use_StatePointer_inX                                              ;8FB661;

RoomState_ThreeMusketeers:
    dl LevelData_ThreeMusketeers                                         ;8FB663;
    db $09,$18,$05                                                       ;8FB666;
    dw FXHeader_ThreeMusketeers                                          ;8FB669;
    dw EnemyPopulations_ThreeMusketeers                                  ;8FB66B;
    dw EnemySets_ThreeMusketeers                                         ;8FB66D;
    db $C1,$C1                                                           ;8FB66F;
    dw RoomScrolls_ThreeMusketeers                                       ;8FB671;
    dw $0000                                                             ;8FB673;
    dw $0000                                                             ;8FB675;
    dw PLMPopulation_ThreeMusketeers                                     ;8FB677;
    dw LibBG_Norfair_9_PurplePatches                                     ;8FB679;
    dw RTS_8F91F7                                                        ;8FB67B;

RoomDoors_ThreeMusketeers:
    dw Door_ThreeMusketeers_0                                            ;8FB67D;
    dw Door_ThreeMusketeers_1                                            ;8FB67F;

RoomScrolls_ThreeMusketeers:
    db $00,$02,$00,$00,$00,$02,$00,$00,$00,$01,$01,$01                   ;8FB681;

RoomPLM_ThreeMusketeers_0:
    db $09,$00,$80                                                       ;8FB68D;

RoomPLM_ThreeMusketeers_6:
    db $08,$01,$09,$01,$80                                               ;8FB690;

RoomPLM_ThreeMusketeers_7:
    db $08,$00,$80                                                       ;8FB695;

RoomHeader_RidleyETank:
    db $49,$02,$16,$11,$01,$01,$70,$A0,$00                               ;8FB698;
    dw RoomDoors_RidleyETank                                             ;8FB6A1;
    dw Use_StatePointer_inX                                              ;8FB6A3;

RoomState_RidleyETank:
    dl LevelData_RidleyETank                                             ;8FB6A5;
    db $09,$00,$00                                                       ;8FB6A8;
    dw FXHeader_RidleyETank                                              ;8FB6AB;
    dw EnemyPopulations_RidleyETank                                      ;8FB6AD;
    dw EnemySets_RidleyETank                                             ;8FB6AF;
    db $01,$01                                                           ;8FB6B1;
    dw $0000                                                             ;8FB6B3;
    dw $0000                                                             ;8FB6B5;
    dw $0000                                                             ;8FB6B7;
    dw PLMPopulation_RidleyETank                                         ;8FB6B9;
    dw LibBG_Norfair_9_CavernRoomPillars                                 ;8FB6BB;
    dw RTS_8F91F7                                                        ;8FB6BD;

RoomDoors_RidleyETank:
    dw Door_RidleyETank_0                                                ;8FB6BF;

RoomHeader_ScrewAttack:
    db $4A,$02,$14,$0E,$01,$03,$70,$A0,$00                               ;8FB6C1;
    dw RoomDoors_ScrewAttack                                             ;8FB6CA;
    dw Use_StatePointer_inX                                              ;8FB6CC;

RoomState_ScrewAttack:
    dl LevelData_ScrewAttack                                             ;8FB6CE;
    db $09,$00,$03                                                       ;8FB6D1;
    dw FXHeader_ScrewAttack                                              ;8FB6D4;
    dw EnemyPopulations_ScrewAttack                                      ;8FB6D6;
    dw EnemySets_ScrewAttack                                             ;8FB6D8;
    db $01,$C1                                                           ;8FB6DA;
    dw $0000                                                             ;8FB6DC;
    dw $0000                                                             ;8FB6DE;
    dw $0000                                                             ;8FB6E0;
    dw PLMPopulation_ScrewAttack                                         ;8FB6E2;
    dw LibBG_Norfair_9_CavernRoomPillars                                 ;8FB6E4;
    dw RTS_8F91F7                                                        ;8FB6E6;

RoomDoors_ScrewAttack:
    dw Door_ScrewAttack_0                                                ;8FB6E8;
    dw Door_ScrewAttack_1                                                ;8FB6EA;
    dw Door_ScrewAttack_2                                                ;8FB6EC;

RoomHeader_LNFireflea:
    db $4B,$02,$23,$06,$03,$06,$70,$A0,$00                               ;8FB6EE;
    dw RoomDoors_LNFireflea                                              ;8FB6F7;
    dw Use_StatePointer_inX                                              ;8FB6F9;

RoomState_LNFireflea:
    dl LevelData_LNFireflea                                              ;8FB6FB;
    db $0A,$18,$05                                                       ;8FB6FE;
    dw FXHeader_LNFireflea                                               ;8FB701;
    dw EnemyPopulations_LNFireflea                                       ;8FB703;
    dw EnemySets_LNFireflea                                              ;8FB705;
    db $00,$00                                                           ;8FB707;
    dw RoomScrolls_LNFireflea                                            ;8FB709;
    dw $0000                                                             ;8FB70B;
    dw $0000                                                             ;8FB70D;
    dw PLMPopulation_LNFireflea                                          ;8FB70F;
    dw $0000                                                             ;8FB711;
    dw $0000                                                             ;8FB713;

RoomDoors_LNFireflea:
    dw Door_LNFireflea_0                                                 ;8FB715;
    dw Door_LNFireflea_1                                                 ;8FB717;
    dw Door_LNFireflea_2                                                 ;8FB719;

RoomScrolls_LNFireflea:
    db $00,$02,$00,$00,$02,$00,$00,$02,$00,$00,$01,$00,$00,$00,$00,$00   ;8FB71B;
    db $01,$01                                                           ;8FB72B;

RoomPLM_LNFireflea_2:
    db $0B,$01,$80                                                       ;8FB72D;

RoomPLM_LNFireflea_5:
    db $0B,$02,$0D,$02,$0E,$02,$80                                       ;8FB730;

RoomPLM_LNFireflea_9:
    db $00,$01,$04,$00,$80                                               ;8FB737;

RoomPLM_LNFireflea_11:
    db $01,$02,$04,$02,$80                                               ;8FB73C;

RoomHeader_LNSave:
    db $4C,$02,$24,$0C,$01,$01,$70,$A0,$00                               ;8FB741;
    dw RoomDoors_LNSave                                                  ;8FB74A;
    dw Use_StatePointer_inX                                              ;8FB74C;

RoomState_LNSave:
    dl LevelData_SaveStation_LeftSideDoor                                ;8FB74E;
    db $19,$18,$05                                                       ;8FB751;
    dw FXHeader_LNSave                                                   ;8FB754;
    dw EnemyPopulations_LNSave                                           ;8FB756;
    dw EnemySets_LNSave                                                  ;8FB758;
    db $00,$00                                                           ;8FB75A;
    dw $0000                                                             ;8FB75C;
    dw $0000                                                             ;8FB75E;
    dw $0000                                                             ;8FB760;
    dw PLMPopulation_LNSave                                              ;8FB762;
    dw $0000                                                             ;8FB764;
    dw $0000                                                             ;8FB766;

RoomDoors_LNSave:
    dw Door_LNSave_0                                                     ;8FB768;

LibBG_ScrollingSky_Tilemaps_LandingSite:
    dw $000E                                                             ;8FB76A;
    dw Door_GauntletEntrance_0                                           ;8FB76C;
    dl ScrollingSky_Tilemaps_2                                           ;8FB76E;
    dw $4800,$0800,$000E                                                 ;8FB771;
    dw Door_Parlor_1                                                     ;8FB777;
    dl ScrollingSky_Tilemaps_4                                           ;8FB779;
    dw $4800,$0800,$000E                                                 ;8FB77C;
    dw Door_CrateriaPowerBombs_0                                         ;8FB782;
    dl ScrollingSky_Tilemaps_1                                           ;8FB784;
    dw $4C00,$0800,$000E                                                 ;8FB787;
    dw Door_CrateriaTube_0                                               ;8FB78D;
    dl ScrollingSky_Tilemaps_4                                           ;8FB78F;
    dw $4800,$0800,$000E                                                 ;8FB792;
    dw Door_LandingSite_LandingCutscene                                  ;8FB798;
    dl ScrollingSky_Tilemaps_0                                           ;8FB79A;
    dw $4800,$0800,$000E                                                 ;8FB79D;
    dw Door_DemoSet3_0_2_4                                               ;8FB7A3;
    dl ScrollingSky_Tilemaps_2                                           ;8FB7A5;
    dw $4800,$0800,$0000                                                 ;8FB7A8;

LibBG_ScrollingSky_Tilemaps_WreckedShipEntrance:
    dw $000E                                                             ;8FB7AE;
    dw Door_BowlingAlleyPath_0                                           ;8FB7B0;
    dl ScrollingSky_Tilemaps_2                                           ;8FB7B2;
    dw $4800,$0800,$000E                                                 ;8FB7B5;
    dw Door_Moat_1                                                       ;8FB7BB;
    dl ScrollingSky_Tilemaps_5                                           ;8FB7BD;
    dw $4800,$0800,$000E                                                 ;8FB7C0;
    dw Door_BowlingAlley_0                                               ;8FB7C6;
    dl ScrollingSky_Tilemaps_1                                           ;8FB7C8;
    dw $4C00,$0800,$000E                                                 ;8FB7CB;
    dw Door_WreckedShipEntrance_0                                        ;8FB7D1;
    dl ScrollingSky_Tilemaps_5                                           ;8FB7D3;
    dw $4800,$0800,$000E                                                 ;8FB7D6;
    dw Door_Attic_2                                                      ;8FB7DC;
    dl ScrollingSky_Tilemaps_0                                           ;8FB7DE;
    dw $4800,$0800,$000E                                                 ;8FB7E1;
    dw Door_GravitySuit_0                                                ;8FB7E7;
    dl ScrollingSky_Tilemaps_3                                           ;8FB7E9;
    dw $4C00,$0800,$0000                                                 ;8FB7EC;

LibBG_ScrollingSky_Tilemaps_EastOcean:
    dw $000E                                                             ;8FB7F2;
    dw Door_ForgottenHighwayKagos_0                                      ;8FB7F4;
    dl ScrollingSky_Tilemaps_5                                           ;8FB7F6;
    dw $4800,$0800,$000E                                                 ;8FB7F9;
    dw Door_ElectricDeath_0                                              ;8FB7FF;
    dl ScrollingSky_Tilemaps_5                                           ;8FB801;
    dw $4800,$0800,$0000                                                 ;8FB804;

LibBG_ScrollingSky_Tilemaps_BowlingAlley:
    dw $0002                                                             ;8FB80A;
    dl ScrollingSky_Tilemaps_2                                           ;8FB80C;
    dw $4800,$0800,$0000                                                 ;8FB80F;

LibBG_Brinstar_1A_Kraid_Upper_Lower:
    dw $0008                                                             ;8FB815;
    dl Tiles_Standard_BG3                                                ;8FB817;
    dw $2000,$1000,$0004                                                 ;8FB81A;
    dl Background_Brinstar_1A_Kraid_Upper                                ;8FB820;
    dw $4000,$0002                                                       ;8FB823;
    dl $7E4000                                                           ;8FB827;
    dw $4000,$1000,$0004                                                 ;8FB82A;
    dl Background_Brinstar_1A_Kraid_Lower_0                              ;8FB830;
    dw $4000,$0002                                                       ;8FB833;
    dl $7E4000                                                           ;8FB837;
    dw $4800,$1000,$0000                                                 ;8FB83A;

LibBG_Standard_BG3_Tiles:
    dw $0008                                                             ;8FB840;
    dl Tiles_Standard_BG3                                                ;8FB842;
    dw $2000,$1000,$000C,$0000                                           ;8FB845;

LibBG_Crocomire_State0:
    dw $0002                                                             ;8FB84D;
    dl $7E2000                                                           ;8FB84F;
    dw $4800,$1000,$0000                                                 ;8FB852;

LibBG_Crocomire_State1:
    dw $0002                                                             ;8FB858;
    dl $7E2000                                                           ;8FB85A;
    dw $4800,$1000,$0000                                                 ;8FB85D;

UNUSED_LibBG_Brinstar_1A_Kraid_Lower_8FB863:
    dw $0004                                                             ;8FB863;
    dl Background_Brinstar_1A_Kraid_Lower_1                              ;8FB865;
    dw $4000,$0002                                                       ;8FB868;
    dl $7E4000                                                           ;8FB86C;
    dw $4800,$0800,$0002                                                 ;8FB86F;
    dl $7E4000                                                           ;8FB875;
    dw $4C00,$0800,$0000                                                 ;8FB878;

LibBG_Crateria_0_VerticalPatternRocks:
    dw $0004                                                             ;8FB87E;
    dl Background_Crateria_0_VerticalPatternRocks                        ;8FB880;
    dw $4000,$0002                                                       ;8FB883;
    dl $7E4000                                                           ;8FB887;
    dw $4800,$0800,$0002                                                 ;8FB88A;
    dl $7E4000                                                           ;8FB890;
    dw $4C00,$0800,$0000                                                 ;8FB893;

LibBG_Crateria_0_HorizontalPatternRocks:
    dw $0004                                                             ;8FB899;
    dl Background_Crateria_0_HorizontalPatternRocks                      ;8FB89B;
    dw $4000,$0002                                                       ;8FB89E;
    dl $7E4000                                                           ;8FB8A2;
    dw $4800,$0800,$0002                                                 ;8FB8A5;
    dl $7E4000                                                           ;8FB8AB;
    dw $4C00,$0800,$0000                                                 ;8FB8AE;

LibBG_Crateria_0_Rocks:
    dw $0004                                                             ;8FB8B4;
    dl Background_Crateria_0_Rocks                                       ;8FB8B6;
    dw $4000,$0002                                                       ;8FB8B9;
    dl $7E4000                                                           ;8FB8BD;
    dw $4800,$0800,$0002                                                 ;8FB8C0;
    dl $7E4000                                                           ;8FB8C6;
    dw $4C00,$0800,$0000                                                 ;8FB8C9;

LibBG_Crateria_2_PurpleRocks:
    dw $0004                                                             ;8FB8CF;
    dl Background_Crateria_2_PurpleRocks                                 ;8FB8D1;
    dw $4000,$0002                                                       ;8FB8D4;
    dl $7E4000                                                           ;8FB8D8;
    dw $4800,$0800,$0002                                                 ;8FB8DB;
    dl $7E4000                                                           ;8FB8E1;
    dw $4C00,$0800,$0000                                                 ;8FB8E4;

LibBG_Crateria_2_BrickRoom_WallArt_Dark:
    dw $0004                                                             ;8FB8EA;
    dl Background_Crateria_2_BrickRoom_WallArt_Dark                      ;8FB8EC;
    dw $4000,$0002                                                       ;8FB8EF;
    dl $7E4000                                                           ;8FB8F3;
    dw $4800,$0800,$0002                                                 ;8FB8F6;
    dl $7E4000                                                           ;8FB8FC;
    dw $4C00,$0800,$0000                                                 ;8FB8FF;

LibBG_Crateria_2_3_Mechanical:
    dw $0004                                                             ;8FB905;
    dl Background_Crateria_2_3_Mechanical                                ;8FB907;
    dw $4000,$0002                                                       ;8FB90A;
    dl $7E4000                                                           ;8FB90E;
    dw $4800,$0800,$0002                                                 ;8FB911;
    dl $7E4000                                                           ;8FB917;
    dw $4C00,$0800,$0000                                                 ;8FB91A;

LibBG_Crateria_2_BrickRoom_WallArt:
    dw $0004                                                             ;8FB920;
    dl Background_Crateria_2_BrickRoom_WallArt                           ;8FB922;
    dw $4000,$0002                                                       ;8FB925;
    dl $7E4000                                                           ;8FB929;
    dw $4800,$0800,$0002                                                 ;8FB92C;
    dl $7E4000                                                           ;8FB932;
    dw $4C00,$0800,$0000                                                 ;8FB935;

LibBG_Crateria_2_Elevator:
    dw $0004                                                             ;8FB93B;
    dl Background_Crateria_2_Elevator                                    ;8FB93D;
    dw $4000,$0002                                                       ;8FB940;
    dl $7E4000                                                           ;8FB944;
    dw $4800,$0800,$0002                                                 ;8FB947;
    dl $7E4000                                                           ;8FB94D;
    dw $4C00,$0800,$0000                                                 ;8FB950;

LibBG_Crateria_2_BrickRoom:
    dw $0004                                                             ;8FB956;
    dl Background_Crateria_2_BrickRoom                                   ;8FB958;
    dw $4000,$0002                                                       ;8FB95B;
    dl $7E4000                                                           ;8FB95F;
    dw $4800,$0800,$0002                                                 ;8FB962;
    dl $7E4000                                                           ;8FB968;
    dw $4C00,$0800,$0000                                                 ;8FB96B;

DoorASM_StartWreckedShipTreadmillWestEntrance:
    LDY.W #AnimatedTilesObjects_FX_wreckedShipTreadmillRightwards        ;8FB971;
    JSL.L Spawn_AnimatedTilesObject                                      ;8FB974;
    JSL.L Spawn_Hardcoded_PLM                                            ;8FB978;
    db $04,$09                                                           ;8FB97C;
    dw PLMEntries_wreckedShipEntranceTreadmillFromWest                   ;8FB97E;
    RTS                                                                  ;8FB980;


DoorASM_Scroll_6_Green:
    PHP                                                                  ;8FB981;
    SEP #$20                                                             ;8FB982;
    LDA.B #$02                                                           ;8FB984;
    STA.L $7ECD26                                                        ;8FB986;
    PLP                                                                  ;8FB98A;
    RTS                                                                  ;8FB98B;


DoorASM_Scroll_0_Blue:
    PHP                                                                  ;8FB98C;
    SEP #$20                                                             ;8FB98D;
    LDA.B #$01                                                           ;8FB98F;
    STA.L $7ECD20                                                        ;8FB991;
    PLP                                                                  ;8FB995;
    RTS                                                                  ;8FB996;


DoorASM_Scroll_13_Blue:
    PHP                                                                  ;8FB997;
    SEP #$20                                                             ;8FB998;
    LDA.B #$01                                                           ;8FB99A;
    STA.L $7ECD33                                                        ;8FB99C;
    PLP                                                                  ;8FB9A0;
    RTS                                                                  ;8FB9A1;


DoorASM_Scroll_4_Red_8_Green:
    PHP                                                                  ;8FB9A2;
    SEP #$20                                                             ;8FB9A3;
    LDA.B #$00                                                           ;8FB9A5;
    STA.L $7ECD24                                                        ;8FB9A7;
    LDA.B #$02                                                           ;8FB9AB;
    STA.L $7ECD28                                                        ;8FB9AD;
    PLP                                                                  ;8FB9B1;
    RTS                                                                  ;8FB9B2;


DoorASM_Scroll_8_9_A_B_Red:
    PHP                                                                  ;8FB9B3;
    SEP #$20                                                             ;8FB9B4;
    LDA.B #$00                                                           ;8FB9B6;
    STA.L $7ECD28                                                        ;8FB9B8;
    STA.L $7ECD29                                                        ;8FB9BC;
    STA.L $7ECD2A                                                        ;8FB9C0;
    STA.L $7ECD2B                                                        ;8FB9C4;
    PLP                                                                  ;8FB9C8;
    RTS                                                                  ;8FB9C9;


DoorASM_Scroll_2_3_4_5_B_C_D_11_Red:
    PHP                                                                  ;8FB9CA;
    SEP #$20                                                             ;8FB9CB;
    LDA.B #$00                                                           ;8FB9CD;
    STA.L $7ECD22                                                        ;8FB9CF;
    STA.L $7ECD23                                                        ;8FB9D3;
    STA.L $7ECD24                                                        ;8FB9D7;
    STA.L $7ECD25                                                        ;8FB9DB;
    STA.L $7ECD2B                                                        ;8FB9DF;
    STA.L $7ECD2C                                                        ;8FB9E3;
    STA.L $7ECD2D                                                        ;8FB9E7;
    STA.L $7ECD31                                                        ;8FB9EB;
    PLP                                                                  ;8FB9EF;
    RTS                                                                  ;8FB9F0;


DoorASM_Scroll_1_4_Green:
    PHP                                                                  ;8FB9F1;
    SEP #$20                                                             ;8FB9F2;
    LDA.B #$02                                                           ;8FB9F4;
    STA.L $7ECD21                                                        ;8FB9F6;
    STA.L $7ECD24                                                        ;8FB9FA;
    PLP                                                                  ;8FB9FE;
    RTS                                                                  ;8FB9FF;


DoorASM_Scroll_2_Blue:
    PHP                                                                  ;8FBA00;
    SEP #$20                                                             ;8FBA01;
    LDA.B #$01                                                           ;8FBA03;
    STA.L $7ECD22                                                        ;8FBA05;
    PLP                                                                  ;8FBA09;
    RTS                                                                  ;8FBA0A;


DoorASM_Scroll_17_Blue:
    PHP                                                                  ;8FBA0B;
    SEP #$20                                                             ;8FBA0C;
    LDA.B #$01                                                           ;8FBA0E;
    STA.L $7ECD37                                                        ;8FBA10;
    PLP                                                                  ;8FBA14;
    RTS                                                                  ;8FBA15;


DoorASM_Scroll_4_Blue:
    PHP                                                                  ;8FBA16;
    SEP #$20                                                             ;8FBA17;
    LDA.B #$01                                                           ;8FBA19;
    STA.L $7ECD24                                                        ;8FBA1B;
    PLP                                                                  ;8FBA1F;
    RTS                                                                  ;8FBA20;


DoorASM_Scroll_6_Green_duplicate:
    PHP                                                                  ;8FBA21;
    SEP #$20                                                             ;8FBA22;
    LDA.B #$02                                                           ;8FBA24;
    STA.L $7ECD26                                                        ;8FBA26;
    PLP                                                                  ;8FBA2A;
    RTS                                                                  ;8FBA2B;


DoorASM_Scroll_3_Green:
    PHP                                                                  ;8FBA2C;
    SEP #$20                                                             ;8FBA2D;
    LDA.B #$02                                                           ;8FBA2F;
    STA.L $7ECD23                                                        ;8FBA31;
    PLP                                                                  ;8FBA35;
    RTS                                                                  ;8FBA36;


LibBG_Brinstar_6_Vertical_GlowPatches:
    dw $0004                                                             ;8FBA37;
    dl Background_Brinstar_6_Vertical_GlowPatches                        ;8FBA39;
    dw $4000,$0002                                                       ;8FBA3C;
    dl $7E4000                                                           ;8FBA40;
    dw $4800,$0800,$0002                                                 ;8FBA43;
    dl $7E4000                                                           ;8FBA49;
    dw $4C00,$0800,$0000                                                 ;8FBA4C;

LibBG_Brinstar_6_Horizontal_GlowPatches:
    dw $0004                                                             ;8FBA52;
    dl Background_Brinstar_6_Horizontal_GlowPatches                      ;8FBA54;
    dw $4000,$0002                                                       ;8FBA57;
    dl $7E4000                                                           ;8FBA5B;
    dw $4800,$0800,$0002                                                 ;8FBA5E;
    dl $7E4000                                                           ;8FBA64;
    dw $4C00,$0800,$0000                                                 ;8FBA67;

LibBG_Brinstar_6_LargeHorizontalPattern:
    dw $0004                                                             ;8FBA6D;
    dl Background_Brinstar_6_LargeHorizontalPattern                      ;8FBA6F;
    dw $4000,$0002                                                       ;8FBA72;
    dl $7E4000                                                           ;8FBA76;
    dw $4800,$0800,$0002                                                 ;8FBA79;
    dl $7E4000                                                           ;8FBA7F;
    dw $4C00,$0800,$0000                                                 ;8FBA82;

LibBG_Brinstar_6_MediumHorizontalPattern:
    dw $0004                                                             ;8FBA88;
    dl Background_Brinstar_6_MediumHorizontalPattern                     ;8FBA8A;
    dw $4000,$0002                                                       ;8FBA8D;
    dl $7E4000                                                           ;8FBA91;
    dw $4800,$0800,$0002                                                 ;8FBA94;
    dl $7E4000                                                           ;8FBA9A;
    dw $4C00,$0800,$0000                                                 ;8FBA9D;

LibBG_Brinstar_6_ThinHorizontalPattern:
    dw $0004                                                             ;8FBAA3;
    dl Background_Brinstar_6_ThinHorizontalPattern                       ;8FBAA5;
    dw $4000,$0002                                                       ;8FBAA8;
    dl $7E4000                                                           ;8FBAAC;
    dw $4800,$0800,$0002                                                 ;8FBAAF;
    dl $7E4000                                                           ;8FBAB5;
    dw $4C00,$0800,$0000                                                 ;8FBAB8;

LibBG_Brinstar_6_SmallPattern:
    dw $0004                                                             ;8FBABE;
    dl Background_Brinstar_6_SmallPattern                                ;8FBAC0;
    dw $4000,$0002                                                       ;8FBAC3;
    dl $7E4000                                                           ;8FBAC7;
    dw $4800,$0800,$0002                                                 ;8FBACA;
    dl $7E4000                                                           ;8FBAD0;
    dw $4C00,$0800,$0000                                                 ;8FBAD3;

LibBG_Brinstar_6_SpheresPattern:
    dw $0004                                                             ;8FBAD9;
    dl Background_Brinstar_6_SpheresPattern                              ;8FBADB;
    dw $4000,$0002                                                       ;8FBADE;
    dl $7E4000                                                           ;8FBAE2;
    dw $4800,$0800,$0002                                                 ;8FBAE5;
    dl $7E4000                                                           ;8FBAEB;
    dw $4C00,$0800,$0000                                                 ;8FBAEE;

LibBG_Brinstar_6_SmallPattern_Variety_0:
    dw $0004                                                             ;8FBAF4;
    dl Background_Brinstar_6_SmallPattern_Variety_0                      ;8FBAF6;
    dw $4000,$0002                                                       ;8FBAF9;
    dl $7E4000                                                           ;8FBAFD;
    dw $4800,$0800,$0002                                                 ;8FBB00;
    dl $7E4000                                                           ;8FBB06;
    dw $4C00,$0800,$0000                                                 ;8FBB09;

UNUSED_LibBG_Brinstar_6_SmallPattern_Variety_1_8FBB0F:
    dw $0004                                                             ;8FBB0F;
    dl Background_Brinstar_6_SmallPattern_Variety_1                      ;8FBB11;
    dw $4000,$0002                                                       ;8FBB14;
    dl $7E4000                                                           ;8FBB18;
    dw $4800,$0800,$0002                                                 ;8FBB1B;
    dl $7E4000                                                           ;8FBB21;
    dw $4C00,$0800,$0000                                                 ;8FBB24;

UNUSED_LibBG_Brinstar_6_SmallPattern_Variety_2_8FBB2A:
    dw $0004                                                             ;8FBB2A;
    dl Background_Brinstar_6_SmallPattern_Variety_2                      ;8FBB2C;
    dw $4000,$0002                                                       ;8FBB2F;
    dl $7E4000                                                           ;8FBB33;
    dw $4800,$0800,$0002                                                 ;8FBB36;
    dl $7E4000                                                           ;8FBB3C;
    dw $4C00,$0800,$0000                                                 ;8FBB3F;

LibBG_Brinstar_6_DarkPattern:
    dw $0004                                                             ;8FBB45;
    dl Background_Brinstar_6_DarkPattern                                 ;8FBB47;
    dw $4000,$0002                                                       ;8FBB4A;
    dl $7E4000                                                           ;8FBB4E;
    dw $4800,$0800,$0002                                                 ;8FBB51;
    dl $7E4000                                                           ;8FBB57;
    dw $4C00,$0800,$0000                                                 ;8FBB5A;

LibBG_Tourian_15_Statues:
    dw $0004                                                             ;8FBB60;
    dl Background_Tourian_15_Statues                                     ;8FBB62;
    dw $4000,$0002                                                       ;8FBB65;
    dl $7E4000                                                           ;8FBB69;
    dw $4800,$1000,$0002                                                 ;8FBB6C;
    dl Tiles_TourianStatuesSoul                                          ;8FBB72;
    dw $6D00,$0600,$0000                                                 ;8FBB75;

LibBG_Brinstar_7_WideVerticalTower_Brick_0:
    dw $0004                                                             ;8FBB7B;
    dl Background_Brinstar_7_WideVerticalTower_Brick_0                   ;8FBB7D;
    dw $4000,$0002                                                       ;8FBB80;
    dl $7E4000                                                           ;8FBB84;
    dw $4800,$0800,$0002                                                 ;8FBB87;
    dl $7E4000                                                           ;8FBB8D;
    dw $4C00,$0800,$0000                                                 ;8FBB90;

UNUSED_LibBG_Brinstar_7_WideVerticalTower_Brick_1_8FBB96:
    dw $0004                                                             ;8FBB96;
    dl Background_Brinstar_7_WideVerticalTower_Brick_1                   ;8FBB98;
    dw $4000,$0002                                                       ;8FBB9B;
    dl $7E4000                                                           ;8FBB9F;
    dw $4800,$0800,$0002                                                 ;8FBBA2;
    dl $7E4000                                                           ;8FBBA8;
    dw $4C00,$0800,$0000                                                 ;8FBBAB;

UNUSED_LibBG_Brinstar_7_WideVerticalTower_Brick_2_8FBBB1:
    dw $0004                                                             ;8FBBB1;
    dl Background_Brinstar_7_WideVerticalTower_Brick_2                   ;8FBBB3;
    dw $4000,$0002                                                       ;8FBBB6;
    dl $7E4000                                                           ;8FBBBA;
    dw $4800,$0800,$0002                                                 ;8FBBBD;
    dl $7E4000                                                           ;8FBBC3;
    dw $4C00,$0800,$0000                                                 ;8FBBC6;

LibBG_Brinstar_7_VerticalTower:
    dw $0004                                                             ;8FBBCC;
    dl Background_Brinstar_7_VerticalTower                               ;8FBBCE;
    dw $4000,$0002                                                       ;8FBBD1;
    dl $7E4000                                                           ;8FBBD5;
    dw $4800,$0800,$0002                                                 ;8FBBD8;
    dl $7E4000                                                           ;8FBBDE;
    dw $4C00,$0800,$0000                                                 ;8FBBE1;

LibBG_Brinstar_7_NarrowVerticalTower_Brick:
    dw $0004                                                             ;8FBBE7;
    dl Background_Brinstar_7_NarrowVerticalTower_Brick                   ;8FBBE9;
    dw $4000,$0002                                                       ;8FBBEC;
    dl $7E4000                                                           ;8FBBF0;
    dw $4800,$0800,$0002                                                 ;8FBBF3;
    dl $7E4000                                                           ;8FBBF9;
    dw $4C00,$0800,$0000                                                 ;8FBBFC;

LibBG_Brinstar_7_VerticalBrick_0:
    dw $0004                                                             ;8FBC02;
    dl Background_Brinstar_7_VerticalBrick_0                             ;8FBC04;
    dw $4000,$0002                                                       ;8FBC07;
    dl $7E4000                                                           ;8FBC0B;
    dw $4800,$0800,$0002                                                 ;8FBC0E;
    dl $7E4000                                                           ;8FBC14;
    dw $4C00,$0800,$0000                                                 ;8FBC17;

UNUSED_LibBG_Brinstar_7_VerticalBrick_1_8FBC1D:
    dw $0004                                                             ;8FBC1D;
    dl Background_Brinstar_7_VerticalBrick_1                             ;8FBC1F;
    dw $4000,$0002                                                       ;8FBC22;
    dl $7E4000                                                           ;8FBC26;
    dw $4800,$0800,$0002                                                 ;8FBC29;
    dl $7E4000                                                           ;8FBC2F;
    dw $4C00,$0800,$0000                                                 ;8FBC32;

LibBG_Brinstar_7_MechanicalRoom_SpikeFloor:
    dw $0004                                                             ;8FBC38;
    dl Background_Brinstar_7_MechanicalRoom_SpikeFloor                   ;8FBC3A;
    dw $4000,$0002                                                       ;8FBC3D;
    dl $7E4000                                                           ;8FBC41;
    dw $4800,$0800,$0002                                                 ;8FBC44;
    dl $7E4000                                                           ;8FBC4A;
    dw $4C00,$0800,$0000                                                 ;8FBC4D;

LibBG_Brinstar_7_MechanicalRoom:
    dw $0004                                                             ;8FBC53;
    dl Background_Brinstar_7_MechanicalRoom                              ;8FBC55;
    dw $4000,$0002                                                       ;8FBC58;
    dl $7E4000                                                           ;8FBC5C;
    dw $4800,$0800,$0002                                                 ;8FBC5F;
    dl $7E4000                                                           ;8FBC65;
    dw $4C00,$0800,$0000                                                 ;8FBC68;

LibBG_Brinstar_7_NarrowVerticalTower_Brick_Vines_0:
    dw $0004                                                             ;8FBC6E;
    dl Background_Brinstar_7_NarrowVerticalTower_Brick_Vines_0           ;8FBC70;
    dw $4000,$0002                                                       ;8FBC73;
    dl $7E4000                                                           ;8FBC77;
    dw $4800,$0800,$0002                                                 ;8FBC7A;
    dl $7E4000                                                           ;8FBC80;
    dw $4C00,$0800,$0000                                                 ;8FBC83;

UNUSED_LibBG_Brin_7_NarrowVerticalTower_Brick_Vines_1_8FBC89:
    dw $0004                                                             ;8FBC89;
    dl Background_Brinstar_7_NarrowVerticalTower_Brick_Vines_1           ;8FBC8B;
    dw $4000,$0002                                                       ;8FBC8E;
    dl $7E4000                                                           ;8FBC92;
    dw $4800,$0800,$0002                                                 ;8FBC95;
    dl $7E4000                                                           ;8FBC9B;
    dw $4C00,$0800,$0000                                                 ;8FBC9E;

LibBG_Brinstar_8_NarrowVerticalTower_Brick_Grey_0:
    dw $0004                                                             ;8FBCA4;
    dl Background_Brinstar_8_NarrowVerticalTower_Brick_Grey_0            ;8FBCA6;
    dw $4000,$0002                                                       ;8FBCA9;
    dl $7E4000                                                           ;8FBCAD;
    dw $4800,$1000,$0000                                                 ;8FBCB0;

UNUSED_LibBG_Brin_8_NarrowVerticalTower_Brick_Grey_1_8FBCB6:
    dw $0004                                                             ;8FBCB6;
    dl Background_Brinstar_8_NarrowVerticalTower_Brick_Grey_1            ;8FBCB8;
    dw $4000,$0002                                                       ;8FBCBB;
    dl $7E4000                                                           ;8FBCBF;
    dw $4800,$0800,$0002                                                 ;8FBCC2;
    dl $7E4000                                                           ;8FBCC8;
    dw $4C00,$0800,$0000                                                 ;8FBCCB;

UNUSED_LibBG_Brin_8_NarrowVerticalTower_Brick_Grey_2_8FBCD1:
    dw $0004                                                             ;8FBCD1;
    dl Background_Brinstar_8_NarrowVerticalTower_Brick_Grey_2            ;8FBCD3;
    dw $4000,$0002                                                       ;8FBCD6;
    dl $7E4000                                                           ;8FBCDA;
    dw $4800,$0800,$0002                                                 ;8FBCDD;
    dl $7E4000                                                           ;8FBCE3;
    dw $4C00,$0800,$0000                                                 ;8FBCE6;

LibBG_Brinstar_7_BlueGridBlocks:
    dw $0004                                                             ;8FBCEC;
    dl Background_Brinstar_7_BlueGridBlocks                              ;8FBCEE;
    dw $4000,$0002                                                       ;8FBCF1;
    dl $7E4000                                                           ;8FBCF5;
    dw $4800,$0800,$0002                                                 ;8FBCF8;
    dl $7E4000                                                           ;8FBCFE;
    dw $4C00,$0800,$0000                                                 ;8FBD01;

DoorASM_Scroll_18_1C_Green:
    PHP                                                                  ;8FBD07;
    SEP #$20                                                             ;8FBD08;
    LDA.B #$02                                                           ;8FBD0A;
    STA.L $7ECD38                                                        ;8FBD0C;
    STA.L $7ECD3C                                                        ;8FBD10;
    PLP                                                                  ;8FBD14;
    RTS                                                                  ;8FBD15;


DoorASM_Scroll_5_6_Blue:
    PHP                                                                  ;8FBD16;
    SEP #$20                                                             ;8FBD17;
    LDA.B #$01                                                           ;8FBD19;
    STA.L $7ECD25                                                        ;8FBD1B;
    STA.L $7ECD26                                                        ;8FBD1F;
    PLP                                                                  ;8FBD23;
    RTS                                                                  ;8FBD24;


DoorASM_Scroll_1D_Blue:
    PHP                                                                  ;8FBD25;
    SEP #$20                                                             ;8FBD26;
    LDA.B #$01                                                           ;8FBD28;
    STA.L $7ECD3D                                                        ;8FBD2A;
    PLP                                                                  ;8FBD2E;
    RTS                                                                  ;8FBD2F;


DoorASM_Scroll_2_3_Green:
    PHP                                                                  ;8FBD30;
    SEP #$20                                                             ;8FBD31;
    LDA.B #$02                                                           ;8FBD33;
    STA.L $7ECD22                                                        ;8FBD35;
    STA.L $7ECD23                                                        ;8FBD39;
    PLP                                                                  ;8FBD3D;
    RTS                                                                  ;8FBD3E;


DoorASM_Scroll_0_Red_1_Green:
    PHP                                                                  ;8FBD3F;
    SEP #$20                                                             ;8FBD40;
    LDA.B #$00                                                           ;8FBD42;
    STA.L $7ECD20                                                        ;8FBD44;
    LDA.B #$02                                                           ;8FBD48;
    STA.L $7ECD21                                                        ;8FBD4A;
    PLP                                                                  ;8FBD4E;
    RTS                                                                  ;8FBD4F;


DoorASM_Scroll_B_Green:
    PHP                                                                  ;8FBD50;
    SEP #$20                                                             ;8FBD51;
    LDA.B #$02                                                           ;8FBD53;
    STA.L $7ECD2B                                                        ;8FBD55;
    PLP                                                                  ;8FBD59;
    RTS                                                                  ;8FBD5A;


DoorASM_Scroll_Scroll_1C_Red_1D_Blue:
    PHP                                                                  ;8FBD5B;
    SEP #$20                                                             ;8FBD5C;
    LDA.B #$00                                                           ;8FBD5E;
    STA.L $7ECD3C                                                        ;8FBD60;
    LDA.B #$01                                                           ;8FBD64;
    STA.L $7ECD3D                                                        ;8FBD66;
    PLP                                                                  ;8FBD6A;
    RTS                                                                  ;8FBD6B;


DoorASM_Scroll_4_Red:
    PHP                                                                  ;8FBD6C;
    SEP #$20                                                             ;8FBD6D;
    LDA.B #$00                                                           ;8FBD6F;
    STA.L $7ECD24                                                        ;8FBD71;
    PLP                                                                  ;8FBD75;
    RTS                                                                  ;8FBD76;


DoorASM_Scroll_20_24_25_Green:
    PHP                                                                  ;8FBD77;
    SEP #$20                                                             ;8FBD78;
    LDA.B #$02                                                           ;8FBD7A;
    STA.L $7ECD40                                                        ;8FBD7C;
    STA.L $7ECD44                                                        ;8FBD80;
    STA.L $7ECD45                                                        ;8FBD84;
    PLP                                                                  ;8FBD88;
    RTS                                                                  ;8FBD89;


DoorASM_Scroll_2_Blue_duplicate:
    PHP                                                                  ;8FBD8A;
    SEP #$20                                                             ;8FBD8B;
    LDA.B #$01                                                           ;8FBD8D;
    STA.L $7ECD22                                                        ;8FBD8F;
    PLP                                                                  ;8FBD93;
    RTS                                                                  ;8FBD94;


DoorASM_Scroll_0_Green:
    PHP                                                                  ;8FBD95;
    SEP #$20                                                             ;8FBD96;
    LDA.B #$02                                                           ;8FBD98;
    STA.L $7ECD20                                                        ;8FBD9A;
    PLP                                                                  ;8FBD9E;
    RTS                                                                  ;8FBD9F;


DoorASM_Scroll_6_7_Green:
    PHP                                                                  ;8FBDA0;
    SEP #$20                                                             ;8FBDA1;
    LDA.B #$02                                                           ;8FBDA3;
    STA.L $7ECD26                                                        ;8FBDA5;
    STA.L $7ECD27                                                        ;8FBDA9;
    PLP                                                                  ;8FBDAD;
    RTS                                                                  ;8FBDAE;


DoorASM_Scroll_1_Blue_2_Red:
    PHP                                                                  ;8FBDAF;
    SEP #$20                                                             ;8FBDB0;
    LDA.B #$01                                                           ;8FBDB2;
    STA.L $7ECD21                                                        ;8FBDB4;
    LDA.B #$00                                                           ;8FBDB8;
    STA.L $7ECD22                                                        ;8FBDBA;
    PLP                                                                  ;8FBDBE;
    RTS                                                                  ;8FBDBF;


DoorASM_Scroll_1_Blue_3_Red:
    PHP                                                                  ;8FBDC0;
    SEP #$20                                                             ;8FBDC1;
    LDA.B #$01                                                           ;8FBDC3;
    STA.L $7ECD21                                                        ;8FBDC5;
    LDA.B #$00                                                           ;8FBDC9;
    STA.L $7ECD23                                                        ;8FBDCB;
    PLP                                                                  ;8FBDCF;
    RTS                                                                  ;8FBDD0;


DoorASM_Scroll_0_Red_4_Blue:
    PHP                                                                  ;8FBDD1;
    SEP #$20                                                             ;8FBDD2;
    LDA.B #$00                                                           ;8FBDD4;
    STA.L $7ECD20                                                        ;8FBDD6;
    LDA.B #$01                                                           ;8FBDDA;
    STA.L $7ECD24                                                        ;8FBDDC;
    PLP                                                                  ;8FBDE0;
    RTS                                                                  ;8FBDE1;


DoorASM_Scroll_2_3_Blue:
    PHP                                                                  ;8FBDE2;
    SEP #$20                                                             ;8FBDE3;
    LDA.B #$01                                                           ;8FBDE5;
    STA.L $7ECD22                                                        ;8FBDE7;
    STA.L $7ECD23                                                        ;8FBDEB;
    PLP                                                                  ;8FBDEF;
    RTS                                                                  ;8FBDF0;


DoorASM_Scroll_0_1_Green:
    PHP                                                                  ;8FBDF1;
    SEP #$20                                                             ;8FBDF2;
    LDA.B #$02                                                           ;8FBDF4;
    STA.L $7ECD20                                                        ;8FBDF6;
    STA.L $7ECD21                                                        ;8FBDFA;
    PLP                                                                  ;8FBDFE;
    RTS                                                                  ;8FBDFF;


DoorASM_Scroll_1_Green:
    PHP                                                                  ;8FBE00;
    SEP #$20                                                             ;8FBE01;
    LDA.B #$02                                                           ;8FBE03;
    STA.L $7ECD21                                                        ;8FBE05;
    PLP                                                                  ;8FBE09;
    RTS                                                                  ;8FBE0A;


DoorASM_Scroll_F_12_Green:
    PHP                                                                  ;8FBE0B;
    SEP #$20                                                             ;8FBE0C;
    LDA.B #$02                                                           ;8FBE0E;
    STA.L $7ECD2F                                                        ;8FBE10;
    STA.L $7ECD32                                                        ;8FBE14;
    PLP                                                                  ;8FBE18;
    RTS                                                                  ;8FBE19;


DoorASM_Scroll_6_Green_duplicate_again:
    PHP                                                                  ;8FBE1A;
    SEP #$20                                                             ;8FBE1B;
    LDA.B #$02                                                           ;8FBE1D;
    STA.L $7ECD26                                                        ;8FBE1F;
    PLP                                                                  ;8FBE23;
    RTS                                                                  ;8FBE24;


DoorASM_Scroll_0_Green_1_Blue:
    PHP                                                                  ;8FBE25;
    SEP #$20                                                             ;8FBE26;
    LDA.B #$02                                                           ;8FBE28;
    STA.L $7ECD20                                                        ;8FBE2A;
    LDA.B #$01                                                           ;8FBE2E;
    STA.L $7ECD21                                                        ;8FBE30;
    PLP                                                                  ;8FBE34;
    RTS                                                                  ;8FBE35;


DoorASM_Scroll_2_Green:
    SEP #$20                                                             ;8FBE36;
    LDA.B #$02                                                           ;8FBE38;
    STA.L $7ECD22                                                        ;8FBE3A;
    RTS                                                                  ;8FBE3E;


LibBG_Norfair_9_A_SmallPatternBrownPurple_Bright:
    dw $0004                                                             ;8FBE3F;
    dl Background_Norfair_9_A_SmallPatternBrownPurple_Bright             ;8FBE41;
    dw $4000,$0002                                                       ;8FBE44;
    dl $7E4000                                                           ;8FBE48;
    dw $4800,$0800,$0002                                                 ;8FBE4B;
    dl $7E4000                                                           ;8FBE51;
    dw $4C00,$0800,$0000                                                 ;8FBE54;

LibBG_Norfair_9_A_SmallPatternBrownPurple_0:
    dw $0004                                                             ;8FBE5A;
    dl Background_Norfair_9_A_SmallPatternBrownPurple_0                  ;8FBE5C;
    dw $4000,$0002                                                       ;8FBE5F;
    dl $7E4000                                                           ;8FBE63;
    dw $4800,$0800,$0002                                                 ;8FBE66;
    dl $7E4000                                                           ;8FBE6C;
    dw $4C00,$0800,$0000                                                 ;8FBE6F;

UNUSED_LibBG_Norfair_9_A_SmallPatternBrownPurple_1_8FBE75:
    dw $0004                                                             ;8FBE75;
    dl Background_Norfair_9_A_SmallPatternBrownPurple_1                  ;8FBE77;
    dw $4000,$0002                                                       ;8FBE7A;
    dl $7E4000                                                           ;8FBE7E;
    dw $4800,$0800,$0002                                                 ;8FBE81;
    dl $7E4000                                                           ;8FBE87;
    dw $4C00,$0800,$0000                                                 ;8FBE8A;

LibBG_Norfair_9_HorizontalPatternBrick:
    dw $0004                                                             ;8FBE90;
    dl Background_Norfair_9_HorizontalPatternBrick                       ;8FBE92;
    dw $4000,$0002                                                       ;8FBE95;
    dl $7E4000                                                           ;8FBE99;
    dw $4800,$0800,$0002                                                 ;8FBE9C;
    dl $7E4000                                                           ;8FBEA2;
    dw $4C00,$0800,$0000                                                 ;8FBEA5;

LibBG_Norfair_9_VeritcalPatternBrick:
    dw $0004                                                             ;8FBEAB;
    dl Background_Norfair_9_VeritcalPatternBrick                         ;8FBEAD;
    dw $4000,$0002                                                       ;8FBEB0;
    dl $7E4000                                                           ;8FBEB4;
    dw $4800,$0800,$0002                                                 ;8FBEB7;
    dl $7E4000                                                           ;8FBEBD;
    dw $4C00,$0800,$0000                                                 ;8FBEC0;

LibBG_Norfair_9_A_CavernStalagtites:
    dw $0004                                                             ;8FBEC6;
    dl Background_Norfair_9_A_CavernStalagtites                          ;8FBEC8;
    dw $4000,$0002                                                       ;8FBECB;
    dl $7E4000                                                           ;8FBECF;
    dw $4800,$0800,$0002                                                 ;8FBED2;
    dl $7E4000                                                           ;8FBED8;
    dw $4C00,$0800,$0000                                                 ;8FBEDB;

LibBG_Norfair_9_A_CavernVertical:
    dw $0004                                                             ;8FBEE1;
    dl Background_Norfair_9_A_CavernVertical                             ;8FBEE3;
    dw $4000,$0002                                                       ;8FBEE6;
    dl $7E4000                                                           ;8FBEEA;
    dw $4800,$0800,$0002                                                 ;8FBEED;
    dl $7E4000                                                           ;8FBEF3;
    dw $4C00,$0800,$0000                                                 ;8FBEF6;

LibBG_Norfair_9_CavernHorizontalRuins:
    dw $0004                                                             ;8FBEFC;
    dl Background_Norfair_9_CavernHorizontalRuins                        ;8FBEFE;
    dw $4000,$0002                                                       ;8FBF01;
    dl $7E4000                                                           ;8FBF05;
    dw $4800,$0800,$0002                                                 ;8FBF08;
    dl $7E4000                                                           ;8FBF0E;
    dw $4C00,$0800,$0000                                                 ;8FBF11;

LibBG_Norfair_9_CavernVerticalRuins:
    dw $0004                                                             ;8FBF17;
    dl Background_Norfair_9_CavernVerticalRuins                          ;8FBF19;
    dw $4000,$0002                                                       ;8FBF1C;
    dl $7E4000                                                           ;8FBF20;
    dw $4800,$0800,$0002                                                 ;8FBF23;
    dl $7E4000                                                           ;8FBF29;
    dw $4C00,$0800,$0000                                                 ;8FBF2C;

LibBG_Norfair_9_CavernRoomPillars:
    dw $0004                                                             ;8FBF32;
    dl Background_Norfair_9_CavernRoomPillars                            ;8FBF34;
    dw $4000,$0002                                                       ;8FBF37;
    dl $7E4000                                                           ;8FBF3B;
    dw $4800,$0800,$0002                                                 ;8FBF3E;
    dl $7E4000                                                           ;8FBF44;
    dw $4C00,$0800,$0000                                                 ;8FBF47;

LibBG_Norfair_9_RoomStatues:
    dw $0004                                                             ;8FBF4D;
    dl Background_Norfair_9_RoomStatues                                  ;8FBF4F;
    dw $4000,$0002                                                       ;8FBF52;
    dl $7E4000                                                           ;8FBF56;
    dw $4800,$0800,$0002                                                 ;8FBF59;
    dl $7E4000                                                           ;8FBF5F;
    dw $4C00,$0800,$0000                                                 ;8FBF62;

LibBG_Norfair_9_PurplePatches:
    dw $0004                                                             ;8FBF68;
    dl Background_Norfair_9_PurplePatches                                ;8FBF6A;
    dw $4000,$0002                                                       ;8FBF6D;
    dl $7E4000                                                           ;8FBF71;
    dw $4800,$0800,$0002                                                 ;8FBF74;
    dl $7E4000                                                           ;8FBF7A;
    dw $4C00,$0800,$0000                                                 ;8FBF7D;

LibBG_Norfair_9_Bubbles:
    dw $0004                                                             ;8FBF83;
    dl Background_Norfair_9_Bubbles                                      ;8FBF85;
    dw $4000,$0002                                                       ;8FBF88;
    dl $7E4000                                                           ;8FBF8C;
    dw $4800,$0800,$0002                                                 ;8FBF8F;
    dl $7E4000                                                           ;8FBF95;
    dw $4C00,$0800,$0000                                                 ;8FBF98;

DoorASM_Scroll_3_4_Red_6_7_8_Blue:
    PHP                                                                  ;8FBF9E;
    SEP #$20                                                             ;8FBF9F;
    LDA.B #$00                                                           ;8FBFA1;
    STA.L $7ECD23                                                        ;8FBFA3;
    STA.L $7ECD24                                                        ;8FBFA7;
    LDA.B #$01                                                           ;8FBFAB;
    STA.L $7ECD26                                                        ;8FBFAD;
    STA.L $7ECD27                                                        ;8FBFB1;
    STA.L $7ECD28                                                        ;8FBFB5;
    PLP                                                                  ;8FBFB9;
    RTS                                                                  ;8FBFBA;


DoorASM_Scroll_1_2_3_Blue_4_Green_6_Red:
    PHP                                                                  ;8FBFBB;
    SEP #$20                                                             ;8FBFBC;
    LDA.B #$01                                                           ;8FBFBE;
    STA.L $7ECD21                                                        ;8FBFC0;
    STA.L $7ECD22                                                        ;8FBFC4;
    STA.L $7ECD23                                                        ;8FBFC8;
    LDA.B #$02                                                           ;8FBFCC;
    STA.L $7ECD24                                                        ;8FBFCE;
    LDA.B #$00                                                           ;8FBFD2;
    STA.L $7ECD26                                                        ;8FBFD4;
    PLP                                                                  ;8FBFD8;
    RTS                                                                  ;8FBFD9;


DoorASM_Scroll_0_1_Blue:
    PHP                                                                  ;8FBFDA;
    SEP #$20                                                             ;8FBFDB;
    LDA.B #$01                                                           ;8FBFDD;
    STA.L $7ECD20                                                        ;8FBFDF;
    STA.L $7ECD21                                                        ;8FBFE3;
    PLP                                                                  ;8FBFE7;
    RTS                                                                  ;8FBFE8;


DoorASM_Scroll_0_Blue_1_Red:
    PHP                                                                  ;8FBFE9;
    SEP #$20                                                             ;8FBFEA;
    LDA.B #$00                                                           ;8FBFEC;
    STA.L $7ECD21                                                        ;8FBFEE;
    LDA.B #$01                                                           ;8FBFF2;
    STA.L $7ECD20                                                        ;8FBFF4;
    PLP                                                                  ;8FBFF8;
    RTS                                                                  ;8FBFF9;


DoorASM_Scroll_A_Green:
    PHP                                                                  ;8FBFFA;
    SEP #$20                                                             ;8FBFFB;
    LDA.B #$02                                                           ;8FBFFD;
    STA.L $7ECD2A                                                        ;8FBFFF;
    PLP                                                                  ;8FC003;
    RTS                                                                  ;8FC004;


UNUSED_DoorASM_Scroll_0_Blue_2_Red_8FC005:
    PHP                                                                  ;8FC005;
    SEP #$20                                                             ;8FC006;
    LDA.B #$01                                                           ;8FC008;
    STA.L $7ECD20                                                        ;8FC00A;
    LDA.B #$00                                                           ;8FC00E;
    STA.L $7ECD22                                                        ;8FC010;
    PLP                                                                  ;8FC014;
    RTS                                                                  ;8FC015;


DoorASM_Scroll_0_2_Green:
    PHP                                                                  ;8FC016;
    SEP #$20                                                             ;8FC017;
    LDA.B #$02                                                           ;8FC019;
    STA.L $7ECD20                                                        ;8FC01B;
    STA.L $7ECD22                                                        ;8FC01F;
    PLP                                                                  ;8FC023;
    RTS                                                                  ;8FC024;


DoorASM_Scroll_6_7_Blue_8_Red:
    PHP                                                                  ;8FC025;
    SEP #$20                                                             ;8FC026;
    LDA.B #$01                                                           ;8FC028;
    STA.L $7ECD26                                                        ;8FC02A;
    STA.L $7ECD27                                                        ;8FC02E;
    LDA.B #$00                                                           ;8FC032;
    STA.L $7ECD28                                                        ;8FC034;
    PLP                                                                  ;8FC038;
    RTS                                                                  ;8FC039;


DoorASM_Scroll_2_Red_3_Blue:
    PHP                                                                  ;8FC03A;
    SEP #$20                                                             ;8FC03B;
    LDA.B #$00                                                           ;8FC03D;
    STA.L $7ECD22                                                        ;8FC03F;
    LDA.B #$01                                                           ;8FC043;
    STA.L $7ECD23                                                        ;8FC045;
    PLP                                                                  ;8FC049;
    RTS                                                                  ;8FC04A;


DoorASM_Scroll_7_Green:
    PHP                                                                  ;8FC04B;
    SEP #$20                                                             ;8FC04C;
    LDA.B #$02                                                           ;8FC04E;
    STA.L $7ECD27                                                        ;8FC050;
    PLP                                                                  ;8FC054;
    RTS                                                                  ;8FC055;


DoorASM_Scroll_1_Red_2_Blue:
    PHP                                                                  ;8FC056;
    SEP #$20                                                             ;8FC057;
    LDA.B #$00                                                           ;8FC059;
    STA.L $7ECD21                                                        ;8FC05B;
    LDA.B #$01                                                           ;8FC05F;
    STA.L $7ECD22                                                        ;8FC061;
    PLP                                                                  ;8FC065;
    RTS                                                                  ;8FC066;


DoorASM_Scroll_0_Blue_3_Red:
    PHP                                                                  ;8FC067;
    SEP #$20                                                             ;8FC068;
    LDA.B #$00                                                           ;8FC06A;
    STA.L $7ECD23                                                        ;8FC06C;
    LDA.B #$01                                                           ;8FC070;
    STA.L $7ECD20                                                        ;8FC072;
    PLP                                                                  ;8FC076;
    RTS                                                                  ;8FC077;


DoorASM_Scroll_1_Blue_4_Red:
    PHP                                                                  ;8FC078;
    SEP #$20                                                             ;8FC079;
    LDA.B #$01                                                           ;8FC07B;
    STA.L $7ECD21                                                        ;8FC07D;
    LDA.B #$00                                                           ;8FC081;
    STA.L $7ECD24                                                        ;8FC083;
    PLP                                                                  ;8FC087;
    RTS                                                                  ;8FC088;


DoorASM_Scroll_0_Blue_1_2_3_Red:
    PHP                                                                  ;8FC089;
    SEP #$20                                                             ;8FC08A;
    LDA.B #$01                                                           ;8FC08C;
    STA.L $7ECD20                                                        ;8FC08E;
    LDA.B #$00                                                           ;8FC092;
    STA.L $7ECD21                                                        ;8FC094;
    STA.L $7ECD22                                                        ;8FC098;
    STA.L $7ECD23                                                        ;8FC09C;
    PLP                                                                  ;8FC0A0;
    RTS                                                                  ;8FC0A1;


DoorASM_Scroll_0_Green_duplicate:
    PHP                                                                  ;8FC0A2;
    SEP #$20                                                             ;8FC0A3;
    LDA.B #$02                                                           ;8FC0A5;
    STA.L $7ECD20                                                        ;8FC0A7;
    PLP                                                                  ;8FC0AB;
    RTS                                                                  ;8FC0AC;


DoorASM_Scroll_0_1_Blue_4_Red:
    PHP                                                                  ;8FC0AD;
    SEP #$20                                                             ;8FC0AE;
    LDA.B #$01                                                           ;8FC0B0;
    STA.L $7ECD20                                                        ;8FC0B2;
    STA.L $7ECD21                                                        ;8FC0B6;
    LDA.B #$00                                                           ;8FC0BA;
    STA.L $7ECD24                                                        ;8FC0BC;
    PLP                                                                  ;8FC0C0;
    RTS                                                                  ;8FC0C1;


DoorASM_Scroll_0_Blue_3_Red_duplicate:
    PHP                                                                  ;8FC0C2;
    SEP #$20                                                             ;8FC0C3;
    LDA.B #$01                                                           ;8FC0C5;
    STA.L $7ECD20                                                        ;8FC0C7;
    LDA.B #$00                                                           ;8FC0CB;
    STA.L $7ECD23                                                        ;8FC0CD;
    PLP                                                                  ;8FC0D1;
    RTS                                                                  ;8FC0D2;


DoorASM_Scroll_0_Blue_duplicate:
    PHP                                                                  ;8FC0D3;
    SEP #$20                                                             ;8FC0D4;
    LDA.B #$01                                                           ;8FC0D6;
    STA.L $7ECD20                                                        ;8FC0D8;
    PLP                                                                  ;8FC0DC;
    RTS                                                                  ;8FC0DD;


DoorASM_Scroll_0_Blue_1_Red_duplicate:
    PHP                                                                  ;8FC0DE;
    SEP #$20                                                             ;8FC0DF;
    LDA.B #$01                                                           ;8FC0E1;
    STA.L $7ECD20                                                        ;8FC0E3;
    LDA.B #$00                                                           ;8FC0E7;
    STA.L $7ECD21                                                        ;8FC0E9;
    PLP                                                                  ;8FC0ED;
    RTS                                                                  ;8FC0EE;


DoorASM_Scroll_18_Blue:
    PHP                                                                  ;8FC0EF;
    SEP #$20                                                             ;8FC0F0;
    LDA.B #$01                                                           ;8FC0F2;
    STA.L $7ECD38                                                        ;8FC0F4;
    PLP                                                                  ;8FC0F8;
    RTS                                                                  ;8FC0F9;


DoorASM_Scroll_2_Blue_3_Red:
    PHP                                                                  ;8FC0FA;
    SEP #$20                                                             ;8FC0FB;
    LDA.B #$00                                                           ;8FC0FD;
    STA.L $7ECD23                                                        ;8FC0FF;
    LDA.B #$01                                                           ;8FC103;
    STA.L $7ECD22                                                        ;8FC105;
    PLP                                                                  ;8FC109;
    RTS                                                                  ;8FC10A;


DoorASM_Scroll_E_Red:
    PHP                                                                  ;8FC10B;
    SEP #$20                                                             ;8FC10C;
    LDA.B #$00                                                           ;8FC10E;
    STA.L $7ECD2E                                                        ;8FC110;
    PLP                                                                  ;8FC114;
    RTS                                                                  ;8FC115;


MainASM_ScrollingSkyLand:
    JSL.L RoomMainASM_ScrollingSkyLand                                   ;8FC116;
    RTS                                                                  ;8FC11A;


MainASM_ScrollingSkyOcean:
    JSL.L RoomMainASM_ScrollingSkyOcean                                  ;8FC11B;
    RTS                                                                  ;8FC11F;


MainASM_ScrollingSkyLand_ZebesTimebombSet:
    JSL.L RoomMainASM_ScrollingSkyLand                                   ;8FC120;

MainASM_SetScreenShaking_GenerateRandomExplosions:
    JSR.W GenerateRandomExplosionOnEvenFramesOnRandomNonBlankTile        ;8FC124;
    LDA.W $1840                                                          ;8FC127;
    ORA.W #$8000                                                         ;8FC12A;
    STA.W $1840                                                          ;8FC12D;
    RTS                                                                  ;8FC130;


GenerateRandomExplosionOnEvenFramesOnRandomNonBlankTile:
    LDA.W $0A78                                                          ;8FC131;
    BNE .return                                                          ;8FC134;
    LDA.W $05B6                                                          ;8FC136;
    AND.W #$0001                                                         ;8FC139;
    BNE .return                                                          ;8FC13C;
    JSL.L GenerateRandomNumber                                           ;8FC13E;
    PHA                                                                  ;8FC142;
    AND.W #$00FF                                                         ;8FC143;
    CLC                                                                  ;8FC146;
    ADC.W $0911                                                          ;8FC147;
    STA.B $12                                                            ;8FC14A;
    PLA                                                                  ;8FC14C;
    XBA                                                                  ;8FC14D;
    AND.W #$00FF                                                         ;8FC14E;
    CLC                                                                  ;8FC151;
    ADC.W $0915                                                          ;8FC152;
    STA.B $14                                                            ;8FC155;
    LSR A                                                                ;8FC157;
    LSR A                                                                ;8FC158;
    LSR A                                                                ;8FC159;
    LSR A                                                                ;8FC15A;
    SEP #$20                                                             ;8FC15B;
    PHA                                                                  ;8FC15D;
    LDA.W $07A5                                                          ;8FC15E;
    STA.W HW_WRMPYA                                                      ;8FC161;
    PLA                                                                  ;8FC164;
    STA.W HW_WRMPYB                                                      ;8FC165;
    REP #$20                                                             ;8FC168;
    LDA.B $12                                                            ;8FC16A;
    LSR A                                                                ;8FC16C;
    LSR A                                                                ;8FC16D;
    LSR A                                                                ;8FC16E;
    LSR A                                                                ;8FC16F;
    CLC                                                                  ;8FC170;
    ADC.W HW_RDMPY                                                       ;8FC171;
    ASL A                                                                ;8FC174;
    TAX                                                                  ;8FC175;
    LDA.L $7F0002,X                                                      ;8FC176;
    AND.W #$03FF                                                         ;8FC17A;
    CMP.W #$00FF                                                         ;8FC17D;
    BNE GenerateRandomExplosionAt_12_14                                  ;8FC180;

.return:
    RTS                                                                  ;8FC182;


GenerateRandomExplosionOnEveryFourthFrame:
    LDA.W $0A78                                                          ;8FC183;
    BNE GenerateRandomExplosionAt_12_14_return                           ;8FC186;
    LDA.W $05B6                                                          ;8FC188;
    AND.W #$0003                                                         ;8FC18B;
    BNE GenerateRandomExplosionAt_12_14_return                           ;8FC18E;
    JSL.L GenerateRandomNumber                                           ;8FC190;
    PHA                                                                  ;8FC194;
    AND.W #$00FF                                                         ;8FC195;
    CLC                                                                  ;8FC198;
    ADC.W $0911                                                          ;8FC199;
    STA.B $12                                                            ;8FC19C;
    PLA                                                                  ;8FC19E;
    XBA                                                                  ;8FC19F;
    AND.W #$00FF                                                         ;8FC1A0;
    CLC                                                                  ;8FC1A3;
    ADC.W $0915                                                          ;8FC1A4;
    STA.B $14                                                            ;8FC1A7;

GenerateRandomExplosionAt_12_14:
    JSL.L GenerateRandomNumber                                           ;8FC1A9;
    AND.W #$000F                                                         ;8FC1AD;
    CMP.W #$0008                                                         ;8FC1B0;
    BCS +                                                                ;8FC1B3;
    TAX                                                                  ;8FC1B5;
    LDA.W ExplosionSoundEffects,X                                        ;8FC1B6;
    AND.W #$00FF                                                         ;8FC1B9;
    BEQ +                                                                ;8FC1BC;
    JSL.L QueueSound_Lib2_Max6                                           ;8FC1BE;

  + TXA                                                                  ;8FC1C2;
    AND.W #$0007                                                         ;8FC1C3;
    TAX                                                                  ;8FC1C6;
    LDA.W ExplosionSpriteObjectIDs,X                                     ;8FC1C7;
    AND.W #$00FF                                                         ;8FC1CA;
    STA.B $16                                                            ;8FC1CD;
    STZ.B $18                                                            ;8FC1CF;
    JSL.L Create_Sprite_Object                                           ;8FC1D1;

  .return:
    RTS                                                                  ;8FC1D5;


ExplosionSpriteObjectIDs:
    db $03,$03,$09,$0C,$0C,$12,$12,$15                                   ;8FC1D6;

ExplosionSoundEffects:
    db $24,$00,$00,$25,$00,$00,$00,$00                                   ;8FC1DE;

MainASM_ScrollScreenRightInDachoraRoom:
    LDA.L $7ECD2B                                                        ;8FC1E6;
    AND.W #$00FF                                                         ;8FC1EA;
    CMP.W #$0002                                                         ;8FC1ED;
    BNE .return                                                          ;8FC1F0;
    LDA.W $0915                                                          ;8FC1F2;
    CMP.W #$0500                                                         ;8FC1F5;
    BCS .return                                                          ;8FC1F8;
    LDA.W $0911                                                          ;8FC1FA;
    CMP.W #$0380                                                         ;8FC1FD;
    BCS .return                                                          ;8FC200;
    ADC.W #$0003                                                         ;8FC202;
    STA.W $0911                                                          ;8FC205;

.return:
    RTS                                                                  ;8FC208;


UNUSED_8FC209:
    dw $0051,$0061,$0001,$0002,$0005,$0006                               ;8FC209;

PLMPopulation_BowlingAlley_State0:
    dw PLMEntries_ScrollPLM                                              ;8FC215;
    db $1F,$2D                                                           ;8FC217;
    dw $C9EC                                                             ;8FC219;
    dw PLMEntries_upwardsExtension                                       ;8FC21B;
    db $41,$26                                                           ;8FC21D;
    dw $8000                                                             ;8FC21F;
    dw PLMEntries_upwardsExtension                                       ;8FC221;
    db $41,$27                                                           ;8FC223;
    dw $8000                                                             ;8FC225;
    dw PLMEntries_ScrollPLM                                              ;8FC227;
    db $41,$28                                                           ;8FC229;
    dw $C9F1,$0000                                                       ;8FC22B;

PLMPopulation_WreckedShipEntrance_State0:
    dw $0000                                                             ;8FC22F;

PLMPopulation_Attic_State0:
    dw PLMEntries_greyDoorFacingRight                                    ;8FC231;
    db $01,$06                                                           ;8FC233;
    dw $0080                                                             ;8FC235;
    dw PLMEntries_greyDoorFacingLeft                                     ;8FC237;
    db $6E,$06                                                           ;8FC239;
    dw $0081                                                             ;8FC23B;
    dw PLMEntries_wreckedShipAttic                                       ;8FC23D;
    db $08,$08                                                           ;8FC23F;
    dw $8000,$0000                                                       ;8FC241;

PLMPopulation_AssemblyLine_State0:
    dw $0000                                                             ;8FC245;

PLMPopulation_WreckedShipMainShaft_State0_1:
    dw PLMEntries_ScrollPLM                                              ;8FC247;
    db $3E,$57                                                           ;8FC249;
    dw $CB7A                                                             ;8FC24B;
    dw PLMEntries_ScrollPLM                                              ;8FC24D;
    db $51,$69                                                           ;8FC24F;
    dw $CB7D                                                             ;8FC251;
    dw PLMEntries_ScrollPLM                                              ;8FC253;
    db $41,$57                                                           ;8FC255;
    dw $CB80                                                             ;8FC257;
    dw PLMEntries_ScrollPLM                                              ;8FC259;
    db $4E,$69                                                           ;8FC25B;
    dw $CB83                                                             ;8FC25D;
    dw PLMEntries_ScrollPLM                                              ;8FC25F;
    db $47,$6D                                                           ;8FC261;
    dw $CB86                                                             ;8FC263;
    dw PLMEntries_MissileTank                                            ;8FC265;
    db $02,$59                                                           ;8FC267;
    dw $0080                                                             ;8FC269;
    dw PLMEntries_greyDoorFacingRight                                    ;8FC26B;
    db $41,$66                                                           ;8FC26D;
    dw $0082                                                             ;8FC26F;
    dw PLMEntries_greyDoorFacingLeft                                     ;8FC271;
    db $4E,$46                                                           ;8FC273;
    dw $0083                                                             ;8FC275;
    dw PLMEntries_greenDoorFacingUp                                      ;8FC277;
    db $46,$7D                                                           ;8FC279;
    dw $0084,$0000                                                       ;8FC27B;

PLMPopulation_SpikyDeath_State0:
    dw $0000                                                             ;8FC27F;

PLMPopulation_ElectricDeath_State0:
    dw PLMEntries_ScrollPLM                                              ;8FC281;
    db $07,$10                                                           ;8FC283;
    dw RoomPLM_ElectricDeath_0                                           ;8FC285;
    dw PLMEntries_rightwardsExtension                                    ;8FC287;
    db $08,$10                                                           ;8FC289;
    dw $8000,$0000                                                       ;8FC28B;

PLMPopulation_WreckedShipETank_State0:
    dw $0000                                                             ;8FC28F;

PLMPopulation_Basement_State0:
    dw PLMEntries_ScrollPLM                                              ;8FC291;
    db $40,$0C                                                           ;8FC293;
    dw RoomPLM_Basement_0                                                ;8FC295;
    dw PLMEntries_ScrollPLM                                              ;8FC297;
    db $46,$0C                                                           ;8FC299;
    dw RoomPLM_Basement_1                                                ;8FC29B;
    dw PLMEntries_EyeDoorFacingLeft                                      ;8FC29D;
    db $4E,$06                                                           ;8FC29F;
    dw $0085                                                             ;8FC2A1;
    dw PLMEntries_EyeDoorBottomFacingLeft                                ;8FC2A3;
    db $4E,$09                                                           ;8FC2A5;
    dw $0085                                                             ;8FC2A7;
    dw PLMEntries_EyeDoorEyeFacingLeft                                   ;8FC2A9;
    db $4E,$07                                                           ;8FC2AB;
    dw $0085,$0000                                                       ;8FC2AD;

PLMPopulation_WreckedShipMap_State0:
    dw $0000                                                             ;8FC2B1;

PLMPopulation_Phantoon_State0_1:
    dw PLMEntries_greyDoorFacingRight                                    ;8FC2B3;
    db $01,$06                                                           ;8FC2B5;
    dw $0086,$0000                                                       ;8FC2B7;

PLMPopulation_SpongeBath_State0:
    dw $0000                                                             ;8FC2BB;

PLMPopulation_WSWestSuper_State0:
    dw $0000                                                             ;8FC2BD;

PLMPopulation_WSEastSuper_State0:
    dw PLMEntries_ScrollPLM                                              ;8FC2BF;
    db $2F,$07                                                           ;8FC2C1;
    dw RoomPLM_WSEastSuper_0                                             ;8FC2C3;
    dw $0000                                                             ;8FC2C5;

PLMPopulation_GravitySuit_State0_WreckedShipSave_State0:
    dw $0000                                                             ;8FC2C7;

PLMPopulation_WreckedShipSave_State1:
    dw PLMEntries_saveStation                                            ;8FC2C9;
    db $07,$0B                                                           ;8FC2CB;
    dw $0000,$0000                                                       ;8FC2CD;

PLMPopulation_BowlingAlley_State1:
    dw PLMEntries_ScrollPLM                                              ;8FC2D1;
    db $1F,$2D                                                           ;8FC2D3;
    dw RoomPLM_BowlingAlley_0                                            ;8FC2D5;
    dw PLMEntries_upwardsExtension                                       ;8FC2D7;
    db $41,$26                                                           ;8FC2D9;
    dw $8000                                                             ;8FC2DB;
    dw PLMEntries_upwardsExtension                                       ;8FC2DD;
    db $41,$27                                                           ;8FC2DF;
    dw $8000                                                             ;8FC2E1;
    dw PLMEntries_ScrollPLM                                              ;8FC2E3;
    db $41,$28                                                           ;8FC2E5;
    dw RoomPLM_BowlingAlley_3                                            ;8FC2E7;
    dw PLMEntries_ReserveTankChozoOrb                                    ;8FC2E9;
    db $53,$0B                                                           ;8FC2EB;
    dw $0081                                                             ;8FC2ED;
    dw PLMEntries_MissileTank                                            ;8FC2EF;
    db $3C,$26                                                           ;8FC2F1;
    dw $0082                                                             ;8FC2F3;
    dw PLMEntries_greyDoorFacingRight                                    ;8FC2F5;
    db $01,$16                                                           ;8FC2F7;
    dw $9087,$0000                                                       ;8FC2F9;

PLMPopulation_WreckedShipEntrance_State1:
    dw $0000                                                             ;8FC2FD;

PLMPopulation_Attic_State1:
    dw PLMEntries_greyDoorFacingRight                                    ;8FC2FF;
    db $01,$06                                                           ;8FC301;
    dw $0C88                                                             ;8FC303;
    dw PLMEntries_greyDoorFacingLeft                                     ;8FC305;
    db $6E,$06                                                           ;8FC307;
    dw $0C89                                                             ;8FC309;
    dw PLMEntries_greyDoorFacingUp                                       ;8FC30B;
    db $46,$0E                                                           ;8FC30D;
    dw $0C8A                                                             ;8FC30F;
    dw PLMEntries_wreckedShipAttic                                       ;8FC311;
    db $08,$08                                                           ;8FC313;
    dw $8000,$0000                                                       ;8FC315;

PLMPopulation_AssemblyLine_State1:
    dw PLMEntries_MissileTank                                            ;8FC319;
    db $2D,$08                                                           ;8FC31B;
    dw $0083,$0000                                                       ;8FC31D;

PLMPopulation_SpikyDeath_State1:
    dw $0000                                                             ;8FC321;

PLMPopulation_ElectricDeath_State1:
    dw PLMEntries_ScrollPLM                                              ;8FC323;
    db $07,$10                                                           ;8FC325;
    dw RoomPLM_ElectricDeath_0                                           ;8FC327;
    dw PLMEntries_rightwardsExtension                                    ;8FC329;
    db $08,$10                                                           ;8FC32B;
    dw $8000                                                             ;8FC32D;
    dw PLMEntries_redDoorFacingRight                                     ;8FC32F;
    db $01,$06                                                           ;8FC331;
    dw $008B,$0000                                                       ;8FC333;

PLMPopulation_WreckedShipETank_State1:
    dw PLMEntries_EnergyTank                                             ;8FC337;
    db $03,$06                                                           ;8FC339;
    dw $0084,$0000                                                       ;8FC33B;

PLMPopulation_Basement_State1:
    dw PLMEntries_ScrollPLM                                              ;8FC33F;
    db $40,$0C                                                           ;8FC341;
    dw RoomPLM_Basement_0                                                ;8FC343;
    dw PLMEntries_ScrollPLM                                              ;8FC345;
    db $46,$0C                                                           ;8FC347;
    dw RoomPLM_Basement_1                                                ;8FC349;
    dw $0000                                                             ;8FC34B;

PLMPopulation_WreckedShipMap_State1:
    dw PLMEntries_mapStation                                             ;8FC34D;
    db $05,$0A                                                           ;8FC34F;
    dw $8000,$0000                                                       ;8FC351;

PLMPopulation_SpongeBath_State1:
    dw $0000                                                             ;8FC355;

PLMPopulation_WSWestSuper_State1:
    dw PLMEntries_SuperMissileTank                                       ;8FC357;
    db $02,$07                                                           ;8FC359;
    dw $0085,$0000                                                       ;8FC35B;

PLMPopulation_WSEastSuper_State1:
    dw PLMEntries_ScrollPLM                                              ;8FC35F;
    db $2F,$07                                                           ;8FC361;
    dw RoomPLM_WSEastSuper_0                                             ;8FC363;
    dw PLMEntries_SuperMissileTank                                       ;8FC365;
    db $38,$09                                                           ;8FC367;
    dw $0086,$0000                                                       ;8FC369;

PLMPopulation_GravitySuit_State1:
    dw PLMEntries_GravitySuitChozoOrb                                    ;8FC36D;
    db $07,$09                                                           ;8FC36F;
    dw $0087,$0000                                                       ;8FC371;

PLMPopulation_GlassTunnelSave:
    dw PLMEntries_saveStation                                            ;8FC375;
    db $07,$0B                                                           ;8FC377;
    dw $0000,$0000                                                       ;8FC379;

PLMPopulation_GlassTunnel_State0_1:
    dw PLMEntries_ScrollPLM                                              ;8FC37D;
    db $03,$14                                                           ;8FC37F;
    dw RoomPLM_GlassTunnel_0_4                                           ;8FC381;
    dw PLMEntries_rightwardsExtension                                    ;8FC383;
    db $04,$14                                                           ;8FC385;
    dw $8000                                                             ;8FC387;
    dw PLMEntries_rightwardsExtension                                    ;8FC389;
    db $05,$14                                                           ;8FC38B;
    dw $8000                                                             ;8FC38D;
    dw PLMEntries_rightwardsExtension                                    ;8FC38F;
    db $06,$14                                                           ;8FC391;
    dw $8000                                                             ;8FC393;
    dw PLMEntries_ScrollPLM                                              ;8FC395;
    db $09,$14                                                           ;8FC397;
    dw RoomPLM_GlassTunnel_0_4                                           ;8FC399;
    dw PLMEntries_rightwardsExtension                                    ;8FC39B;
    db $0A,$14                                                           ;8FC39D;
    dw $8000                                                             ;8FC39F;
    dw PLMEntries_rightwardsExtension                                    ;8FC3A1;
    db $0B,$14                                                           ;8FC3A3;
    dw $8000                                                             ;8FC3A5;
    dw PLMEntries_rightwardsExtension                                    ;8FC3A7;
    db $0C,$14                                                           ;8FC3A9;
    dw $8000                                                             ;8FC3AB;
    dw PLMEntries_ScrollPLM                                              ;8FC3AD;
    db $05,$1D                                                           ;8FC3AF;
    dw RoomPLM_GlassTunnel_8                                             ;8FC3B1;
    dw PLMEntries_rightwardsExtension                                    ;8FC3B3;
    db $06,$1D                                                           ;8FC3B5;
    dw $8000                                                             ;8FC3B7;
    dw PLMEntries_rightwardsExtension                                    ;8FC3B9;
    db $07,$1D                                                           ;8FC3BB;
    dw $8000                                                             ;8FC3BD;
    dw PLMEntries_rightwardsExtension                                    ;8FC3BF;
    db $08,$1D                                                           ;8FC3C1;
    dw $8000                                                             ;8FC3C3;
    dw PLMEntries_rightwardsExtension                                    ;8FC3C5;
    db $09,$1D                                                           ;8FC3C7;
    dw $8000                                                             ;8FC3C9;
    dw PLMEntries_rightwardsExtension                                    ;8FC3CB;
    db $0A,$1D                                                           ;8FC3CD;
    dw $8000                                                             ;8FC3CF;
    dw PLMEntries_NoobTube                                               ;8FC3D1;
    db $02,$15                                                           ;8FC3D3;
    dw $0080                                                             ;8FC3D5;
    dw PLMEntries_redDoorFacingLeft                                      ;8FC3D7;
    db $0E,$26                                                           ;8FC3D9;
    dw $008C,$0000                                                       ;8FC3DB;

PLMPopulation_WestTunnel:
    dw $0000                                                             ;8FC3DF;

PLMPopulation_EastTunnel:
    dw PLMEntries_ScrollPLM                                              ;8FC3E1;
    db $05,$09                                                           ;8FC3E3;
    dw RoomPLM_EastTunnel_0                                              ;8FC3E5;
    dw PLMEntries_ScrollPLM                                              ;8FC3E7;
    db $05,$10                                                           ;8FC3E9;
    dw RoomPLM_EastTunnel_1                                              ;8FC3EB;
    dw PLMEntries_ScrollPLM                                              ;8FC3ED;
    db $05,$16                                                           ;8FC3EF;
    dw RoomPLM_EastTunnel_2                                              ;8FC3F1;
    dw PLMEntries_upwardsExtension                                       ;8FC3F3;
    db $0A,$03                                                           ;8FC3F5;
    dw $8000                                                             ;8FC3F7;
    dw PLMEntries_upwardsExtension                                       ;8FC3F9;
    db $0A,$04                                                           ;8FC3FB;
    dw $8000                                                             ;8FC3FD;
    dw PLMEntries_upwardsExtension                                       ;8FC3FF;
    db $0A,$05                                                           ;8FC401;
    dw $8000                                                             ;8FC403;
    dw PLMEntries_upwardsExtension                                       ;8FC405;
    db $0A,$06                                                           ;8FC407;
    dw $8000                                                             ;8FC409;
    dw PLMEntries_upwardsExtension                                       ;8FC40B;
    db $0A,$07                                                           ;8FC40D;
    dw $8000                                                             ;8FC40F;
    dw PLMEntries_upwardsExtension                                       ;8FC411;
    db $0A,$08                                                           ;8FC413;
    dw $8000                                                             ;8FC415;
    dw PLMEntries_ScrollPLM                                              ;8FC417;
    db $0A,$09                                                           ;8FC419;
    dw RoomPLM_EastTunnel_9                                              ;8FC41B;
    dw PLMEntries_downwardsClosedGate                                    ;8FC41D;
    db $16,$05                                                           ;8FC41F;
    dw $8000                                                             ;8FC421;
    dw PLMEntries_downwardsGateShotblock                                 ;8FC423;
    db $16,$05                                                           ;8FC425;
    dw $000A,$0000                                                       ;8FC427;

PLMPopulation_MainStreet:
    dw PLMEntries_ScrollPLM                                              ;8FC42B;
    db $25,$29                                                           ;8FC42D;
    dw RoomPLM_MainStreet_0                                              ;8FC42F;
    dw PLMEntries_redDoorFacingLeft                                      ;8FC431;
    db $1E,$76                                                           ;8FC433;
    dw $008D                                                             ;8FC435;
    dw PLMEntries_MissileTank                                            ;8FC437;
    db $0E,$35                                                           ;8FC439;
    dw $0088                                                             ;8FC43B;
    dw PLMEntries_SuperMissileTank                                       ;8FC43D;
    db $16,$28                                                           ;8FC43F;
    dw $0089,$0000                                                       ;8FC441;

PLMPopulation_FishTank:
    dw PLMEntries_upwardsExtension                                       ;8FC445;
    db $1F,$26                                                           ;8FC447;
    dw $8000                                                             ;8FC449;
    dw PLMEntries_upwardsExtension                                       ;8FC44B;
    db $1F,$27                                                           ;8FC44D;
    dw $8000                                                             ;8FC44F;
    dw PLMEntries_upwardsExtension                                       ;8FC451;
    db $1F,$28                                                           ;8FC453;
    dw $8000                                                             ;8FC455;
    dw PLMEntries_ScrollPLM                                              ;8FC457;
    db $1F,$29                                                           ;8FC459;
    dw RoomPLM_FishTank_3_7                                              ;8FC45B;
    dw PLMEntries_upwardsExtension                                       ;8FC45D;
    db $30,$26                                                           ;8FC45F;
    dw $8000                                                             ;8FC461;
    dw PLMEntries_upwardsExtension                                       ;8FC463;
    db $30,$27                                                           ;8FC465;
    dw $8000                                                             ;8FC467;
    dw PLMEntries_upwardsExtension                                       ;8FC469;
    db $30,$28                                                           ;8FC46B;
    dw $8000                                                             ;8FC46D;
    dw PLMEntries_ScrollPLM                                              ;8FC46F;
    db $30,$29                                                           ;8FC471;
    dw RoomPLM_FishTank_3_7                                              ;8FC473;
    dw PLMEntries_redDoorFacingLeft                                      ;8FC475;
    db $3E,$26                                                           ;8FC477;
    dw $008E,$0000                                                       ;8FC479;

PLMPopulation_MamaTurtle:
    dw PLMEntries_EnergyTank                                             ;8FC47D;
    db $1F,$0A                                                           ;8FC47F;
    dw $008A                                                             ;8FC481;
    dw PLMEntries_MissileTankShotBlock                                   ;8FC483;
    db $2C,$1D                                                           ;8FC485;
    dw $008B,$0000                                                       ;8FC487;

PLMPopulation_CrabTunnel:
    dw PLMEntries_downwardsClosedGate                                    ;8FC48B;
    db $0E,$07                                                           ;8FC48D;
    dw $8000                                                             ;8FC48F;
    dw PLMEntries_downwardsGateShotblock                                 ;8FC491;
    db $0E,$07                                                           ;8FC493;
    dw $0008,$0000                                                       ;8FC495;

PLMPopulation_MtEverest:
    dw $0000                                                             ;8FC499;

PLMPopulation_RedFish:
    dw PLMEntries_ScrollPLM                                              ;8FC49B;
    db $20,$06                                                           ;8FC49D;
    dw RoomPLM_RedFish_0                                                 ;8FC49F;
    dw PLMEntries_ScrollPLM                                              ;8FC4A1;
    db $1E,$06                                                           ;8FC4A3;
    dw RoomPLM_RedFish_1                                                 ;8FC4A5;
    dw $0000                                                             ;8FC4A7;

PLMPopulation_WateringHole:
    dw PLMEntries_ScrollPLM                                              ;8FC4A9;
    db $07,$1F                                                           ;8FC4AB;
    dw RoomPLM_WateringHole_0                                            ;8FC4AD;
    dw PLMEntries_SuperMissileTank                                       ;8FC4AF;
    db $04,$26                                                           ;8FC4B1;
    dw $008C                                                             ;8FC4B3;
    dw PLMEntries_MissileTank                                            ;8FC4B5;
    db $0B,$27                                                           ;8FC4B7;
    dw $008D,$0000                                                       ;8FC4B9;

PLMPopulation_NWestMaridiaBug:
    dw PLMEntries_upwardsExtension                                       ;8FC4BD;
    db $20,$16                                                           ;8FC4BF;
    dw $8000                                                             ;8FC4C1;
    dw PLMEntries_upwardsExtension                                       ;8FC4C3;
    db $20,$17                                                           ;8FC4C5;
    dw $8000                                                             ;8FC4C7;
    dw PLMEntries_upwardsExtension                                       ;8FC4C9;
    db $20,$18                                                           ;8FC4CB;
    dw $8000                                                             ;8FC4CD;
    dw PLMEntries_ScrollPLM                                              ;8FC4CF;
    db $20,$19                                                           ;8FC4D1;
    dw RoomPLM_NWestMaridiaBug_3_7                                       ;8FC4D3;
    dw PLMEntries_upwardsExtension                                       ;8FC4D5;
    db $0F,$16                                                           ;8FC4D7;
    dw $8000                                                             ;8FC4D9;
    dw PLMEntries_upwardsExtension                                       ;8FC4DB;
    db $0F,$17                                                           ;8FC4DD;
    dw $8000                                                             ;8FC4DF;
    dw PLMEntries_upwardsExtension                                       ;8FC4E1;
    db $0F,$18                                                           ;8FC4E3;
    dw $8000                                                             ;8FC4E5;
    dw PLMEntries_ScrollPLM                                              ;8FC4E7;
    db $0F,$19                                                           ;8FC4E9;
    dw RoomPLM_NWestMaridiaBug_3_7                                       ;8FC4EB;
    dw $0000                                                             ;8FC4ED;

PLMPopulation_CrabShaft:
    dw PLMEntries_ScrollPLM                                              ;8FC4EF;
    db $07,$2D                                                           ;8FC4F1;
    dw RoomPLM_CrabShaft_0                                               ;8FC4F3;
    dw PLMEntries_rightwardsExtension                                    ;8FC4F5;
    db $08,$2D                                                           ;8FC4F7;
    dw $8000                                                             ;8FC4F9;
    dw PLMEntries_greenDoorFacingLeft                                    ;8FC4FB;
    db $1E,$36                                                           ;8FC4FD;
    dw $008F,$0000                                                       ;8FC4FF;

PLMPopulation_PseudoPlasmaSpark:
    dw PLMEntries_upwardsExtension                                       ;8FC503;
    db $1F,$26                                                           ;8FC505;
    dw $8000                                                             ;8FC507;
    dw PLMEntries_upwardsExtension                                       ;8FC509;
    db $1F,$27                                                           ;8FC50B;
    dw $8000                                                             ;8FC50D;
    dw PLMEntries_upwardsExtension                                       ;8FC50F;
    db $1F,$28                                                           ;8FC511;
    dw $8000                                                             ;8FC513;
    dw PLMEntries_ScrollPLM                                              ;8FC515;
    db $1F,$29                                                           ;8FC517;
    dw RoomPLM_PseudoPlasmaSpark_3                                       ;8FC519;
    dw PLMEntries_upwardsExtension                                       ;8FC51B;
    db $1D,$26                                                           ;8FC51D;
    dw $8000                                                             ;8FC51F;
    dw PLMEntries_upwardsExtension                                       ;8FC521;
    db $1D,$27                                                           ;8FC523;
    dw $8000                                                             ;8FC525;
    dw PLMEntries_upwardsExtension                                       ;8FC527;
    db $1D,$28                                                           ;8FC529;
    dw $8000                                                             ;8FC52B;
    dw PLMEntries_ScrollPLM                                              ;8FC52D;
    db $1D,$29                                                           ;8FC52F;
    dw RoomPLM_PseudoPlasmaSpark_7                                       ;8FC531;
    dw PLMEntries_MissileTank                                            ;8FC533;
    db $2C,$28                                                           ;8FC535;
    dw $008E,$0000                                                       ;8FC537;

PLMPopulation_CrabHole:
    dw PLMEntries_ScrollPLM                                              ;8FC53B;
    db $08,$0E                                                           ;8FC53D;
    dw RoomPLM_CrabHole_0_1                                              ;8FC53F;
    dw PLMEntries_ScrollPLM                                              ;8FC541;
    db $08,$11                                                           ;8FC543;
    dw RoomPLM_CrabHole_0_1                                              ;8FC545;
    dw PLMEntries_redDoorFacingLeft                                      ;8FC547;
    db $0E,$16                                                           ;8FC549;
    dw $0090,$0000                                                       ;8FC54B;

PLMPopulation_WestSandHallTunnel:
    dw $0000                                                             ;8FC54F;

PLMPopulation_PlasmaTutorial:
    dw $0000                                                             ;8FC551;

PLMPopulation_Plasma:
    dw PLMEntries_greyDoorFacingRight                                    ;8FC553;
    db $01,$06                                                           ;8FC555;
    dw $0C91                                                             ;8FC557;
    dw PLMEntries_PlasmaBeamChozoOrb                                     ;8FC559;
    db $19,$26                                                           ;8FC55B;
    dw $008F,$0000                                                       ;8FC55D;

PLMPopulation_ThreadTheNeedle:
    dw $0000                                                             ;8FC561;

PLMPopulation_MaridiaElev:
    dw PLMEntries_elevatorPlatform                                       ;8FC563;
    db $06,$2C                                                           ;8FC565;
    dw $8000                                                             ;8FC567;
    dw PLMEntries_redDoorFacingLeft                                      ;8FC569;
    db $0E,$46                                                           ;8FC56B;
    dw $0092,$0000                                                       ;8FC56D;

PLMPopulation_PlasmaSpark:
    dw PLMEntries_greyDoorFacingLeft                                     ;8FC571;
    db $2E,$16                                                           ;8FC573;
    dw $0093                                                             ;8FC575;
    dw PLMEntries_greenDoorFacingUp                                      ;8FC577;
    db $06,$2D                                                           ;8FC579;
    dw $0094,$0000                                                       ;8FC57B;

PLMPopulation_Kassiuz:
    dw $0000                                                             ;8FC57F;

PLMPopulation_MaridiaMap:
    dw PLMEntries_mapStation                                             ;8FC581;
    db $0B,$0A                                                           ;8FC583;
    dw $8000,$0000                                                       ;8FC585;

PLMPopulation_ForgottenHighwaySave:
    dw PLMEntries_saveStation                                            ;8FC589;
    db $07,$0B                                                           ;8FC58B;
    dw $0001,$0000                                                       ;8FC58D;

PLMPopulation_Toilet:
    dw $0000                                                             ;8FC591;

PLMPopulation_BugSandHole:
    dw $0000                                                             ;8FC593;

PLMPopulation_WestSandHall:
    dw $0000                                                             ;8FC595;

PLMPopulation_Oasis:
    dw PLMEntries_ScrollPLM                                              ;8FC597;
    db $03,$14                                                           ;8FC599;
    dw RoomPLM_Oasis_0                                                   ;8FC59B;
    dw PLMEntries_rightwardsExtension                                    ;8FC59D;
    dw $1404,$8000                                                       ;8FC59F;
    dw PLMEntries_rightwardsExtension                                    ;8FC5A3;
    db $05,$14                                                           ;8FC5A5;
    dw $8000                                                             ;8FC5A7;
    dw PLMEntries_rightwardsExtension                                    ;8FC5A9;
    db $06,$14                                                           ;8FC5AB;
    dw $8000                                                             ;8FC5AD;
    dw PLMEntries_rightwardsExtension                                    ;8FC5AF;
    db $07,$14                                                           ;8FC5B1;
    dw $8000                                                             ;8FC5B3;
    dw PLMEntries_rightwardsExtension                                    ;8FC5B5;
    db $08,$14                                                           ;8FC5B7;
    dw $8000                                                             ;8FC5B9;
    dw PLMEntries_rightwardsExtension                                    ;8FC5BB;
    db $09,$14                                                           ;8FC5BD;
    dw $8000                                                             ;8FC5BF;
    dw PLMEntries_rightwardsExtension                                    ;8FC5C1;
    db $0A,$14                                                           ;8FC5C3;
    dw $8000                                                             ;8FC5C5;
    dw PLMEntries_rightwardsExtension                                    ;8FC5C7;
    db $0B,$14                                                           ;8FC5C9;
    dw $8000                                                             ;8FC5CB;
    dw PLMEntries_rightwardsExtension                                    ;8FC5CD;
    db $0C,$14                                                           ;8FC5CF;
    dw $8000                                                             ;8FC5D1;
    dw PLMEntries_greenDoorFacingDown                                    ;8FC5D3;
    db $06,$02                                                           ;8FC5D5;
    dw $0095,$0000                                                       ;8FC5D7;

PLMPopulation_EastSandHall:
    dw $0000                                                             ;8FC5DB;

PLMPopulation_WestSandHole:
    dw PLMEntries_MissileTank                                            ;8FC5DD;
    db $06,$04                                                           ;8FC5DF;
    dw $0090                                                             ;8FC5E1;
    dw PLMEntries_ReserveTankChozoOrb                                    ;8FC5E3;
    db $0F,$04                                                           ;8FC5E5;
    dw $0091,$0000                                                       ;8FC5E7;

PLMPopulation_EastSandHole:
    dw PLMEntries_MissileTank                                            ;8FC5EB;
    db $03,$07                                                           ;8FC5ED;
    dw $0092                                                             ;8FC5EF;
    dw PLMEntries_PowerBombTank                                          ;8FC5F1;
    db $19,$10                                                           ;8FC5F3;
    dw $0093,$0000                                                       ;8FC5F5;

PLMPopulation_WestAqueductQuicksand:
    dw $0000                                                             ;8FC5F9;

PLMPopulation_EastAqueductQuicksand:
    dw $0000                                                             ;8FC5FB;

PLMPopulation_Aqueduct:
    dw PLMEntries_redDoorFacingRight                                     ;8FC5FD;
    db $01,$26                                                           ;8FC5FF;
    dw $0096                                                             ;8FC601;
    dw PLMEntries_MissileTank                                            ;8FC603;
    db $4C,$09                                                           ;8FC605;
    dw $0094                                                             ;8FC607;
    dw PLMEntries_SuperMissileTank                                       ;8FC609;
    db $5C,$08                                                           ;8FC60B;
    dw $0095,$0000                                                       ;8FC60D;

PLMPopulation_Butterfly:
    dw PLMEntries_greyDoorFacingLeft                                     ;8FC611;
    db $0E,$06                                                           ;8FC613;
    dw $0097,$0000                                                       ;8FC615;

PLMPopulation_BotwoonHallway:
    dw $0000                                                             ;8FC619;

PLMPopulation_Pants:
    dw PLMEntries_ScrollPLM                                              ;8FC61B;
    db $06,$32                                                           ;8FC61D;
    dw RoomPLM_Pants_0_4                                                 ;8FC61F;
    dw PLMEntries_rightwardsExtension                                    ;8FC621;
    db $07,$32                                                           ;8FC623;
    dw $8000                                                             ;8FC625;
    dw PLMEntries_rightwardsExtension                                    ;8FC627;
    db $08,$32                                                           ;8FC629;
    dw $8000                                                             ;8FC62B;
    dw PLMEntries_rightwardsExtension                                    ;8FC62D;
    db $09,$32                                                           ;8FC62F;
    dw $8000                                                             ;8FC631;
    dw PLMEntries_ScrollPLM                                              ;8FC633;
    db $0D,$0C                                                           ;8FC635;
    dw RoomPLM_Pants_0_4                                                 ;8FC637;
    dw PLMEntries_upwardsExtension                                       ;8FC639;
    db $0D,$0B                                                           ;8FC63B;
    dw $8000                                                             ;8FC63D;
    dw PLMEntries_upwardsExtension                                       ;8FC63F;
    db $0D,$0A                                                           ;8FC641;
    dw $8000                                                             ;8FC643;
    dw PLMEntries_upwardsExtension                                       ;8FC645;
    db $0D,$09                                                           ;8FC647;
    dw $8000                                                             ;8FC649;
    dw PLMEntries_upwardsExtension                                       ;8FC64B;
    db $0D,$08                                                           ;8FC64D;
    dw $8000                                                             ;8FC64F;
    dw PLMEntries_upwardsExtension                                       ;8FC651;
    db $0D,$07                                                           ;8FC653;
    dw $8000                                                             ;8FC655;
    dw PLMEntries_upwardsExtension                                       ;8FC657;
    db $0D,$06                                                           ;8FC659;
    dw $8000                                                             ;8FC65B;
    dw PLMEntries_upwardsExtension                                       ;8FC65D;
    db $0D,$05                                                           ;8FC65F;
    dw $8000                                                             ;8FC661;
    dw PLMEntries_upwardsExtension                                       ;8FC663;
    db $0D,$04                                                           ;8FC665;
    dw $8000                                                             ;8FC667;
    dw PLMEntries_ScrollPLM                                              ;8FC669;
    db $12,$0E                                                           ;8FC66B;
    dw RoomPLM_Pants_D                                                   ;8FC66D;
    dw PLMEntries_upwardsExtension                                       ;8FC66F;
    db $12,$0D                                                           ;8FC671;
    dw $8000                                                             ;8FC673;
    dw PLMEntries_upwardsExtension                                       ;8FC675;
    db $12,$0C                                                           ;8FC677;
    dw $8000                                                             ;8FC679;
    dw PLMEntries_upwardsExtension                                       ;8FC67B;
    db $12,$0B                                                           ;8FC67D;
    dw $8000                                                             ;8FC67F;
    dw PLMEntries_upwardsExtension                                       ;8FC681;
    db $12,$0A                                                           ;8FC683;
    dw $8000                                                             ;8FC685;
    dw PLMEntries_upwardsExtension                                       ;8FC687;
    db $12,$09                                                           ;8FC689;
    dw $8000                                                             ;8FC68B;
    dw PLMEntries_upwardsExtension                                       ;8FC68D;
    db $12,$08                                                           ;8FC68F;
    dw $8000                                                             ;8FC691;
    dw PLMEntries_upwardsExtension                                       ;8FC693;
    db $12,$07                                                           ;8FC695;
    dw $8000                                                             ;8FC697;
    dw PLMEntries_ScrollPLM                                              ;8FC699;
    db $15,$2B                                                           ;8FC69B;
    dw RoomPLM_Pants_15                                                  ;8FC69D;
    dw PLMEntries_rightwardsExtension                                    ;8FC69F;
    db $16,$2B                                                           ;8FC6A1;
    dw $8000                                                             ;8FC6A3;
    dw PLMEntries_rightwardsExtension                                    ;8FC6A5;
    db $17,$2B                                                           ;8FC6A7;
    dw $8000,$0000                                                       ;8FC6A9;

PLMPopulation_EastPants:
    dw PLMEntries_ScrollPLM                                              ;8FC6AD;
    db $05,$22                                                           ;8FC6AF;
    dw RoomPLM_EastPants_0                                               ;8FC6B1;
    dw PLMEntries_rightwardsExtension                                    ;8FC6B3;
    db $06,$22                                                           ;8FC6B5;
    dw $8000                                                             ;8FC6B7;
    dw PLMEntries_rightwardsExtension                                    ;8FC6B9;
    db $07,$22                                                           ;8FC6BB;
    dw $8000                                                             ;8FC6BD;
    dw PLMEntries_rightwardsExtension                                    ;8FC6BF;
    db $08,$22                                                           ;8FC6C1;
    dw $8000                                                             ;8FC6C3;
    dw PLMEntries_rightwardsExtension                                    ;8FC6C5;
    db $09,$22                                                           ;8FC6C7;
    dw $8000                                                             ;8FC6C9;
    dw PLMEntries_rightwardsExtension                                    ;8FC6CB;
    db $0A,$12                                                           ;8FC6CD;
    dw $8000                                                             ;8FC6CF;
    dw PLMEntries_ScrollPLM                                              ;8FC6D1;
    db $05,$1B                                                           ;8FC6D3;
    dw RoomPLM_EastPants_6                                               ;8FC6D5;
    dw PLMEntries_rightwardsExtension                                    ;8FC6D7;
    db $06,$1B                                                           ;8FC6D9;
    dw $8000                                                             ;8FC6DB;
    dw PLMEntries_rightwardsExtension                                    ;8FC6DD;
    db $07,$1B                                                           ;8FC6DF;
    dw $8000,$0000                                                       ;8FC6E1;

PLMPopulation_Springball:
    dw PLMEntries_SpringBallChozoOrb                                     ;8FC6E5;
    db $18,$16                                                           ;8FC6E7;
    dw $0096,$0000                                                       ;8FC6E9;

PLMPopulation_BelowBotwoonETank:
    dw $0000                                                             ;8FC6ED;

PLMPopulation_Colosseum:
    dw PLMEntries_redDoorFacingLeft                                      ;8FC6EF;
    db $6E,$06                                                           ;8FC6F1;
    dw $0098                                                             ;8FC6F3;
    dw PLMEntries_greenDoorFacingLeft                                    ;8FC6F5;
    db $4E,$26                                                           ;8FC6F7;
    dw $0099                                                             ;8FC6F9;
    dw PLMEntries_greenDoorFacingLeft                                    ;8FC6FB;
    db $6E,$16                                                           ;8FC6FD;
    dw $009A,$0000                                                       ;8FC6FF;

PLMPopulation_AqueductSave:
    dw PLMEntries_saveStation                                            ;8FC703;
    db $05,$0B                                                           ;8FC705;
    dw $0002,$0000                                                       ;8FC707;

PLMPopulation_ThePrecious_State0_1:
    dw PLMEntries_ScrollPLM                                              ;8FC70B;
    db $04,$0E                                                           ;8FC70D;
    dw RoomPLM_ThePrecious_0                                             ;8FC70F;
    dw PLMEntries_rightwardsExtension                                    ;8FC711;
    db $05,$0E                                                           ;8FC713;
    dw $8000                                                             ;8FC715;
    dw PLMEntries_rightwardsExtension                                    ;8FC717;
    db $06,$0E                                                           ;8FC719;
    dw $8000                                                             ;8FC71B;
    dw PLMEntries_rightwardsExtension                                    ;8FC71D;
    db $07,$0E                                                           ;8FC71F;
    dw $8000                                                             ;8FC721;
    dw PLMEntries_rightwardsExtension                                    ;8FC723;
    db $08,$0E                                                           ;8FC725;
    dw $8000                                                             ;8FC727;
    dw PLMEntries_rightwardsExtension                                    ;8FC729;
    db $09,$0E                                                           ;8FC72B;
    dw $8000                                                             ;8FC72D;
    dw PLMEntries_rightwardsExtension                                    ;8FC72F;
    db $0A,$0E                                                           ;8FC731;
    dw $8000                                                             ;8FC733;
    dw PLMEntries_rightwardsExtension                                    ;8FC735;
    db $0B,$0E                                                           ;8FC737;
    dw $8000                                                             ;8FC739;
    dw PLMEntries_EyeDoorFacingRIght                                     ;8FC73B;
    db $01,$26                                                           ;8FC73D;
    dw $009B                                                             ;8FC73F;
    dw PLMEntries_EyeDoorBottomFacingRight                               ;8FC741;
    db $01,$29                                                           ;8FC743;
    dw $009B                                                             ;8FC745;
    dw PLMEntries_EyeDoorEyeFacingRight                                  ;8FC747;
    db $01,$27                                                           ;8FC749;
    dw $009B                                                             ;8FC74B;
    dw PLMEntries_MissileTankShotBlock                                   ;8FC74D;
    db $1C,$06                                                           ;8FC74F;
    dw $0097,$0000                                                       ;8FC751;

PLMPopulation_BotwoonETank:
    dw PLMEntries_EnergyTank                                             ;8FC755;
    db $32,$05                                                           ;8FC757;
    dw $0098,$0000                                                       ;8FC759;

PLMPopulation_DraygonSave:
    dw PLMEntries_saveStation                                            ;8FC75D;
    db $07,$0B                                                           ;8FC75F;
    dw $0003,$0000                                                       ;8FC761;

PLMPopulation_MaridiaMissileRefill:
    dw PLMEntries_missileStation                                         ;8FC765;
    db $08,$0A                                                           ;8FC767;
    dw $0099,$0000                                                       ;8FC769;

PLMPopulation_PlasmaBeachQuicksand:
    dw $0000                                                             ;8FC76D;

PLMPopulation_BotwoonQuicksand:
    dw $0000                                                             ;8FC76F;

PLMPopulation_Shaktool_State0_1:
    dw $0000                                                             ;8FC771;

PLMPopulation_HalfieClimb:
    dw PLMEntries_ScrollPLM                                              ;8FC773;
    db $10,$29                                                           ;8FC775;
    dw RoomPLM_HalfieClimb_0                                             ;8FC777;
    dw PLMEntries_ScrollPLM                                              ;8FC779;
    db $0B,$29                                                           ;8FC77B;
    dw RoomPLM_HalfieClimb_1                                             ;8FC77D;
    dw PLMEntries_upwardsExtension                                       ;8FC77F;
    db $0B,$28                                                           ;8FC781;
    dw $8000                                                             ;8FC783;
    dw PLMEntries_upwardsExtension                                       ;8FC785;
    db $0B,$27                                                           ;8FC787;
    dw $8000                                                             ;8FC789;
    dw PLMEntries_upwardsExtension                                       ;8FC78B;
    db $0B,$26                                                           ;8FC78D;
    dw $8000                                                             ;8FC78F;
    dw PLMEntries_ScrollPLM                                              ;8FC791;
    db $0E,$29                                                           ;8FC793;
    dw RoomPLM_HalfieClimb_5                                             ;8FC795;
    dw PLMEntries_greyDoorFacingRight                                    ;8FC797;
    db $01,$16                                                           ;8FC799;
    dw $009C,$0000                                                       ;8FC79B;

PLMPopulation_Botwoon_State0_1:
    dw PLMEntries_greyDoorFacingRight                                    ;8FC79F;
    db $01,$06                                                           ;8FC7A1;
    dw $049D,$0000                                                       ;8FC7A3;

PLMPopulation_SpaceJump:
    dw PLMEntries_SpaceJumpChozoOrb                                      ;8FC7A7;
    db $04,$08                                                           ;8FC7A9;
    dw $009A,$0000                                                       ;8FC7AB;

PLMPopulation_MaridiaEnergyRefill:
    dw PLMEntries_energyStation                                          ;8FC7AF;
    db $08,$0A                                                           ;8FC7B1;
    dw $009B,$0000                                                       ;8FC7B3;

PLMPopulation_WestCactusAlley:
    dw $0000                                                             ;8FC7B7;

PLMPopulation_EastCactusAlley:
    dw $0000                                                             ;8FC7B9;

PLMPopulation_Draygon_State0_1:
    dw PLMEntries_greyDoorFacingLeft                                     ;8FC7BB;
    db $1E,$06                                                           ;8FC7BD;
    dw $009E                                                             ;8FC7BF;
    dw PLMEntries_greyDoorFacingRight                                    ;8FC7C1;
    db $01,$16                                                           ;8FC7C3;
    dw $009F                                                             ;8FC7C5;
    dw PLMEntries_DraygonCannonFacingRight                               ;8FC7C7;
    db $02,$0B                                                           ;8FC7C9;
    dw $8802                                                             ;8FC7CB;
    dw PLMEntries_DraygonCannonWithShieldFacingRight                     ;8FC7CD;
    db $02,$12                                                           ;8FC7CF;
    dw $8804                                                             ;8FC7D1;
    dw PLMEntries_DraygonCannonWithShieldFacingLeft                      ;8FC7D3;
    db $1D,$0F                                                           ;8FC7D5;
    dw $8806                                                             ;8FC7D7;
    dw PLMEntries_DraygonCannonWithShieldFacingLeft                      ;8FC7D9;
    db $1D,$15                                                           ;8FC7DB;
    dw $8808,$0000                                                       ;8FC7DD;

PLMPopulation_TourianFirst:
    dw PLMEntries_elevatorPlatform                                       ;8FC7E1;
    db $06,$2C                                                           ;8FC7E3;
    dw $8000,$0000                                                       ;8FC7E5;

PLMPopulation_Metroids1_State0_1:
    dw PLMEntries_SetsMetroidsClearedStatesWhenRequired                  ;8FC7E9;
    db $08,$08                                                           ;8FC7EB;
    dw $0012                                                             ;8FC7ED;
    dw PLMEntries_greyDoorFacingRight                                    ;8FC7EF;
    db $01,$06                                                           ;8FC7F1;
    dw $0CA0,$0000                                                       ;8FC7F3;

PLMPopulation_Metroids2_State0_1:
    dw PLMEntries_SetsMetroidsClearedStatesWhenRequired                  ;8FC7F7;
    db $08,$08                                                           ;8FC7F9;
    dw $0014                                                             ;8FC7FB;
    dw PLMEntries_greyDoorFacingLeft                                     ;8FC7FD;
    db $0E,$16                                                           ;8FC7FF;
    dw $0CA1,$0000                                                       ;8FC801;

PLMPopulation_Metroids3_State0_1:
    dw PLMEntries_SetsMetroidsClearedStatesWhenRequired                  ;8FC805;
    db $08,$08                                                           ;8FC807;
    dw $0016                                                             ;8FC809;
    dw PLMEntries_greyDoorFacingLeft                                     ;8FC80B;
    db $5E,$06                                                           ;8FC80D;
    dw $0CA2,$0000                                                       ;8FC80F;

PLMPopulation_Metroids4_State0_1:
    dw PLMEntries_SetsMetroidsClearedStatesWhenRequired                  ;8FC813;
    db $08,$08                                                           ;8FC815;
    dw $0018                                                             ;8FC817;
    dw PLMEntries_greyDoorFacingUp                                       ;8FC819;
    db $06,$1E                                                           ;8FC81B;
    dw $0CA3,$0000                                                       ;8FC81D;

PLMPopulation_BlueHopper_State0_1:
    dw $0000                                                             ;8FC821;

PLMPopulation_DustTorizo_State0_1:
    dw PLMEntries_greyDoorFacingLeft                                     ;8FC823;
    db $1E,$06                                                           ;8FC825;
    dw $90A4                                                             ;8FC827;
    dw PLMEntries_greyDoorFacingRight                                    ;8FC829;
    db $01,$06                                                           ;8FC82B;
    dw $0CA5,$0000                                                       ;8FC82D;

PLMPopulation_BigBoy_State0_1:
    dw PLMEntries_greyDoorFacingLeft                                     ;8FC831;
    db $3E,$06                                                           ;8FC833;
    dw $90A6,$0000                                                       ;8FC835;

PLMPopulation_Seaweed:
    dw PLMEntries_redDoorFacingLeft                                      ;8FC839;
    db $0E,$16                                                           ;8FC83B;
    dw $00A7,$0000                                                       ;8FC83D;

PLMPopulation_TourianRecharge:
    dw PLMEntries_missileStation                                         ;8FC841;
    db $08,$0A                                                           ;8FC843;
    dw $009C                                                             ;8FC845;
    dw PLMEntries_energyStation                                          ;8FC847;
    db $06,$0A                                                           ;8FC849;
    dw $009D,$0000                                                       ;8FC84B;

PLMPopulation_MotherBrain_State0_1_2:
    dw PLMEntries_MotherBrainsGlass                                      ;8FC84F;
    db $09,$05                                                           ;8FC851;
    dw $8000,$0000                                                       ;8FC853;

PLMPopulation_TourianEyeDoor:
    dw PLMEntries_EyeDoorFacingLeft                                      ;8FC857;
    db $3E,$06                                                           ;8FC859;
    dw $00A8                                                             ;8FC85B;
    dw PLMEntries_EyeDoorBottomFacingLeft                                ;8FC85D;
    db $3E,$09                                                           ;8FC85F;
    dw $00A8                                                             ;8FC861;
    dw PLMEntries_EyeDoorEyeFacingLeft                                   ;8FC863;
    db $3E,$07                                                           ;8FC865;
    dw $00A8,$0000                                                       ;8FC867;

PLMPopulation_RinkaShaft:
    dw PLMEntries_redDoorFacingRight                                     ;8FC86B;
    db $01,$26                                                           ;8FC86D;
    dw $00A9,$0000                                                       ;8FC86F;

PLMPopulation_MotherBrainSave:
    dw PLMEntries_saveStation                                            ;8FC873;
    db $05,$0B                                                           ;8FC875;
    dw $0000,$0000                                                       ;8FC877;

PLMPopulation_TourianEscape1:
    dw PLMEntries_SetsMetroidsClearedStatesWhenRequired                  ;8FC87B;
    db $08,$08                                                           ;8FC87D;
    dw $0000                                                             ;8FC87F;
    dw PLMEntries_gateThatClosesInEscapeRoom1                            ;8FC881;
    db $1F,$06                                                           ;8FC883;
    dw $8000,$0000                                                       ;8FC885;

PLMPopulation_TourianEscape2:
    dw PLMEntries_SetsMetroidsClearedStatesWhenRequired                  ;8FC889;
    db $08,$08                                                           ;8FC88B;
    dw $0002                                                             ;8FC88D;
    dw PLMEntries_greyDoorFacingDown                                     ;8FC88F;
    db $06,$03                                                           ;8FC891;
    dw $90AA,$0000                                                       ;8FC893;

PLMPopulation_TourianEscape3:
    dw PLMEntries_SetsMetroidsClearedStatesWhenRequired                  ;8FC897;
    db $08,$08                                                           ;8FC899;
    dw $0004                                                             ;8FC89B;
    dw PLMEntries_greyDoorFacingRight                                    ;8FC89D;
    db $01,$16                                                           ;8FC89F;
    dw $90AB,$0000                                                       ;8FC8A1;

PLMPopulation_TourianEscape4:
    dw PLMEntries_SetsMetroidsClearedStatesWhenRequired                  ;8FC8A5;
    db $08,$08                                                           ;8FC8A7;
    dw $0006                                                             ;8FC8A9;
    dw PLMEntries_greyDoorFacingRight                                    ;8FC8AB;
    db $01,$36                                                           ;8FC8AD;
    dw $90AC,$0000                                                       ;8FC8AF;

PLMPopulation_UpperTourianSave:
    dw PLMEntries_saveStation                                            ;8FC8B3;
    db $07,$0B                                                           ;8FC8B5;
    dw $0001,$0000                                                       ;8FC8B7;

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

RTS_8FC8C7:
    RTS                                                                  ;8FC8C7;


SetupASM_SpawnPrePhantoonRoomEnemyProjectile:
    LDY.W #EnemyProjectile_PrePhantoonRoom                               ;8FC8C8;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;8FC8CB;
    RTS                                                                  ;8FC8CF;


RTS_8FC8D0:
    RTS                                                                  ;8FC8D0;


RTS_8FC8D1:
    RTS                                                                  ;8FC8D1;


RTS_8FC8D2:
    RTS                                                                  ;8FC8D2;


SetupASM_SetupShaktoolsRoomPLM:
    JSL.L Spawn_Hardcoded_PLM                                            ;8FC8D3;
    db $00,$00                                                           ;8FC8D7;
    dw PLMEntries_shaktoolsRoom                                          ;8FC8D9;
    RTS                                                                  ;8FC8DB;


RTS_8FC8DC:
    RTS                                                                  ;8FC8DC;


SetupASM_SetPausingCodeForDraygon:
    LDA.W #PauseHook_Draygon>>8&$FF00                                    ;8FC8DD;
    STA.W $0602                                                          ;8FC8E0;
    LDA.W #PauseHook_Draygon                                             ;8FC8E3;
    STA.W $0601                                                          ;8FC8E6;
    LDA.W #UnpauseHook_Draygon>>8&$FF00                                  ;8FC8E9;
    STA.W $0605                                                          ;8FC8EC;
    LDA.W #UnpauseHook_Draygon                                           ;8FC8EF;
    STA.W $0604                                                          ;8FC8F2;
    RTS                                                                  ;8FC8F5;


PauseHook_Draygon:
    LDA.W #$0004                                                         ;8FC8F6;
    STA.B $A7                                                            ;8FC8F9;
    RTL                                                                  ;8FC8FB;


UnpauseHook_Draygon:
    LDA.W $18B6                                                          ;8FC8FC;
    CMP.W #$0008                                                         ;8FC8FF;
    BNE .return                                                          ;8FC902;
    LDA.W #$000C                                                         ;8FC904;
    STA.B $A7                                                            ;8FC907;

.return:
    RTL                                                                  ;8FC909;


SetupASM_SetCollectedMap:
    REP #$30                                                             ;8FC90A;
    LDX.W $079F                                                          ;8FC90C;
    LDA.L $7ED908,X                                                      ;8FC90F;
    ORA.W #$0001                                                         ;8FC913;
    STA.L $7ED908,X                                                      ;8FC916;
    STA.W $0789                                                          ;8FC91A;
    RTS                                                                  ;8FC91D;


RTS_8FC91E:
    RTS                                                                  ;8FC91E;


SetupASM_SetZebesTimebombEvent_SetLightHorizontalRoomShaking:
    LDA.W #$000E                                                         ;8FC91F;
    JSL.L MarkEvent_inA                                                  ;8FC922;
    LDA.W #$0012                                                         ;8FC926;
    STA.W $183E                                                          ;8FC929;
    LDA.W #$FFFF                                                         ;8FC92C;
    STA.W $1840                                                          ;8FC92F;
    RTS                                                                  ;8FC932;


SetupASM_SetLightHorizontalRoomShaking:
    LDA.W #$0012                                                         ;8FC933;
    STA.W $183E                                                          ;8FC936;
    STA.W $07E3                                                          ;8FC939;
    STZ.W $07E1                                                          ;8FC93C;
    LDA.W #$FFFF                                                         ;8FC93F;
    STA.W $1840                                                          ;8FC942;
    RTS                                                                  ;8FC945;


SetupASM_SetMediumHorizontalRoomShaking:
    LDA.W #$0015                                                         ;8FC946;
    STA.W $183E                                                          ;8FC949;
    LDA.W #$FFFF                                                         ;8FC94C;
    STA.W $1840                                                          ;8FC94F;
    RTS                                                                  ;8FC952;


SetupASM_SetupEscapeRoom4sPLM_SetMediumHorizontalRoomShaking:
    JSL.L Spawn_Hardcoded_PLM                                            ;8FC953;
    db $10,$10                                                           ;8FC957;
    dw PLMEntries_RaiseAcidInEscapeRoomBeforeOldTourianEscapeShaft       ;8FC959;
    LDA.W #$0015                                                         ;8FC95B;
    STA.W $183E                                                          ;8FC95E;
    STA.W $07E3                                                          ;8FC961;
    STZ.W $07E1                                                          ;8FC964;
    LDA.W #$FFFF                                                         ;8FC967;
    STA.W $1840                                                          ;8FC96A;
    RTS                                                                  ;8FC96D;


SetupASM_TurnCeresDoorToSolidBlocks_SpawnCeresHaze:
    JSL.L Spawn_Hardcoded_PLM                                            ;8FC96E; fallthrough to SetupASM_SpawnCeresHaze
    db $0F,$26                                                           ;8FC972;
    dw PLMEntries_turnCeresElevatorDoorToSolidBlocksDuringEscape         ;8FC974;

SetupASM_SpawnCeresHaze:
    JSL.L FXType_2C_CeresHaze                                            ;8FC976;
    RTS                                                                  ;8FC97A;


SetupASM_SetBG1_2_TilesBaseAddress_SpawnCeresHaze:
    PHP                                                                  ;8FC97B;
    SEP #$20                                                             ;8FC97C;
    LDA.B #$66                                                           ;8FC97E;
    STA.B $5D                                                            ;8FC980;
    PLP                                                                  ;8FC982;
    JSL.L FXType_2C_CeresHaze                                            ;8FC983;
    LDA.W #$0009                                                         ;8FC987;
    STA.W $07EB                                                          ;8FC98A;
    RTS                                                                  ;8FC98D;


RoomHeader_BowlingAlley:
    db $00,$03,$0A,$0B,$06,$03,$70,$A0,$00                               ;8FC98E;
    dw RoomDoors_BowlingAlley                                            ;8FC997;
    dw RoomStateCheck_BossIsDead                                         ;8FC999;
    db $01                                                               ;8FC99B;
    dw RoomState_BowlingAlley_1                                          ;8FC99C;
    dw Use_StatePointer_inX                                              ;8FC99E;

RoomState_BowlingAlley_0:
    dl LevelData_BowlingAlley                                            ;8FC9A0;
    db $05,$30,$03                                                       ;8FC9A3;
    dw FXHeader_BowlingAlley_State0                                      ;8FC9A6;
    dw EnemyPopulations_BowlingAlley_0                                   ;8FC9A8;
    dw EnemySets_BowlingAlley_0                                          ;8FC9AA;
    db $00,$00                                                           ;8FC9AC;
    dw RoomScrolls_BowlingAlley                                          ;8FC9AE;
    dw $0000                                                             ;8FC9B0;
    dw $0000                                                             ;8FC9B2;
    dw PLMPopulation_BowlingAlley_State0                                 ;8FC9B4;
    dw $0000                                                             ;8FC9B6;
    dw RTS_8FC8C7                                                        ;8FC9B8;

RoomState_BowlingAlley_1:
    dl LevelData_BowlingAlley                                            ;8FC9BA;
    db $04,$30,$03                                                       ;8FC9BD;
    dw FXHeader_BowlingAlley_State1                                      ;8FC9C0;
    dw EnemyPopulations_BowlingAlley_1                                   ;8FC9C2;
    dw EnemySets_BowlingAlley_1                                          ;8FC9C4;
    db $00,$00                                                           ;8FC9C6;
    dw RoomScrolls_BowlingAlley                                          ;8FC9C8;
    dw $0000                                                             ;8FC9CA;
    dw $0000                                                             ;8FC9CC;
    dw PLMPopulation_BowlingAlley_State1                                 ;8FC9CE;
    dw $0000                                                             ;8FC9D0;
    dw RTS_8FC8C7                                                        ;8FC9D2;

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
    db $0E,$01,$0F,$01,$80                                               ;8FC9EC;

RoomPLM_BowlingAlley_3:
    db $04,$00,$05,$02,$0B,$02,$10,$01,$11,$01,$80                       ;8FC9F1;

UNUSED_RoomPLM_8FC9FC:
    db $05,$01,$80                                                       ;8FC9FC;

UNUSED_RoomPLM_8FC9FF:
    db $04,$01,$80                                                       ;8FC9FF;

UNUSED_RoomPLM_8FCA02:
    db $05,$00,$80                                                       ;8FCA02;

UNUSED_RoomPLM_8FCA05:
    db $04,$00,$80                                                       ;8FCA05;

RoomHeader_WreckedShipEntrance:
    db $01,$03,$0C,$0E,$04,$01,$70,$A0,$00                               ;8FCA08;
    dw RoomDoors_WreckedShipEntrance                                     ;8FCA11;
    dw RoomStateCheck_BossIsDead                                         ;8FCA13;
    db $01                                                               ;8FCA15;
    dw RoomState_WreckedShipEntrance_1                                   ;8FCA16;
    dw Use_StatePointer_inX                                              ;8FCA18;

RoomState_WreckedShipEntrance_0:
    dl LevelData_WreckedShipEntrance                                     ;8FCA1A;
    db $05,$30,$05                                                       ;8FCA1D;
    dw FXHeader_WreckedShipEntrance_State0                               ;8FCA20;
    dw EnemyPopulations_WreckedShipEntrance_0                            ;8FCA22;
    dw EnemySets_WreckedShipEntrance_0                                   ;8FCA24;
    db $C1,$C1                                                           ;8FCA26;
    dw $0000                                                             ;8FCA28;
    dw $0000                                                             ;8FCA2A;
    dw $0000                                                             ;8FCA2C;
    dw PLMPopulation_WreckedShipEntrance_State0                          ;8FCA2E;
    dw LibBG_WreckedShip_4_5_EntranceHall                                ;8FCA30;
    dw RTS_8FC8C7                                                        ;8FCA32;

RoomState_WreckedShipEntrance_1:
    dl LevelData_WreckedShipEntrance                                     ;8FCA34;
    db $04,$30,$06                                                       ;8FCA37;
    dw FXHeader_WreckedShipEntrance_State1                               ;8FCA3A;
    dw EnemyPopulations_WreckedShipEntrance_1                            ;8FCA3C;
    dw EnemySets_WreckedShipEntrance_1                                   ;8FCA3E;
    db $C1,$C1                                                           ;8FCA40;
    dw $0000                                                             ;8FCA42;
    dw $0000                                                             ;8FCA44;
    dw $0000                                                             ;8FCA46;
    dw PLMPopulation_WreckedShipEntrance_State1                          ;8FCA48;
    dw LibBG_WreckedShip_4_5_EntranceHall                                ;8FCA4A;
    dw RTS_8FC8C7                                                        ;8FCA4C;

RoomDoors_WreckedShipEntrance:
    dw Door_WreckedShipEntrance_0                                        ;8FCA4E;
    dw Door_WreckedShipEntrance_1                                        ;8FCA50;

RoomHeader_Attic:
    db $02,$03,$0C,$0A,$07,$01,$00,$00,$00                               ;8FCA52;
    dw RoomDoors_Attic                                                   ;8FCA5B;
    dw RoomStateCheck_BossIsDead                                         ;8FCA5D;
    db $01                                                               ;8FCA5F;
    dw RoomState_Attic_1                                                 ;8FCA60;
    dw Use_StatePointer_inX                                              ;8FCA62;

RoomState_Attic_0:
    dl LevelData_Attic_State0                                            ;8FCA64;
    db $05,$30,$05                                                       ;8FCA67;
    dw FXHeader_Attic_State0                                             ;8FCA6A;
    dw EnemyPopulations_Attic_0                                          ;8FCA6C;
    dw EnemySets_Attic_0                                                 ;8FCA6E;
    db $C1,$FF                                                           ;8FCA70;
    dw RoomScrolls_Attic                                                 ;8FCA72;
    dw $0000                                                             ;8FCA74;
    dw $0000                                                             ;8FCA76;
    dw PLMPopulation_Attic_State0                                        ;8FCA78;
    dw LibBG_WreckedShip_4_5_ExperimentRoom                              ;8FCA7A;
    dw RTS_8FC8C7                                                        ;8FCA7C;

RoomState_Attic_1:
    dl LevelData_Attic_State1                                            ;8FCA7E;
    db $04,$30,$06                                                       ;8FCA81;
    dw FXHeader_Attic_State1                                             ;8FCA84;
    dw EnemyPopulations_Attic_1                                          ;8FCA86;
    dw EnemySets_Attic_1                                                 ;8FCA88;
    db $C1,$FF                                                           ;8FCA8A;
    dw RoomScrolls_Attic                                                 ;8FCA8C;
    dw $0000                                                             ;8FCA8E;
    dw $0000                                                             ;8FCA90;
    dw PLMPopulation_Attic_State1                                        ;8FCA92;
    dw LibBG_WreckedShip_4_5_ExperimentRoom                              ;8FCA94;
    dw RTS_8FC8C7                                                        ;8FCA96;

RoomDoors_Attic:
    dw Door_Attic_0                                                      ;8FCA98;
    dw Door_Attic_1                                                      ;8FCA9A;
    dw Door_Attic_2                                                      ;8FCA9C;

RoomScrolls_Attic:
    db $02,$02,$02,$02,$02,$02,$02                                       ;8FCA9E;

UNUSED_RoomPLM_8FCAA5:
    db $00,$01,$80                                                       ;8FCAA5;

UNUSED_RoomPLM_8FCAA8:
    db $03,$01,$80                                                       ;8FCAA8;

UNUSED_RoomPLM_8FCAAB:
    db $03,$02,$80                                                       ;8FCAAB;

RoomHeader_AssemblyLine:
    db $03,$03,$13,$0A,$03,$01,$70,$A0,$00                               ;8FCAAE;
    dw RoomDoors_AssemblyLine                                            ;8FCAB7;
    dw RoomStateCheck_BossIsDead                                         ;8FCAB9;
    db $01                                                               ;8FCABB;
    dw RoomState_AssemblyLine_1                                          ;8FCABC;
    dw Use_StatePointer_inX                                              ;8FCABE;

RoomState_AssemblyLine_0:
    dl LevelData_AssemblyLine                                            ;8FCAC0;
    db $05,$00,$00                                                       ;8FCAC3;
    dw FXHeader_AssemblyLine_State0                                      ;8FCAC6;
    dw EnemyPopulations_AssemblyLine_0                                   ;8FCAC8;
    dw EnemySets_AssemblyLine_0                                          ;8FCACA;
    db $C1,$C1                                                           ;8FCACC;
    dw $0000                                                             ;8FCACE;
    dw $0000                                                             ;8FCAD0;
    dw $0000                                                             ;8FCAD2;
    dw PLMPopulation_AssemblyLine_State0                                 ;8FCAD4;
    dw LibBG_WreckedShip_4_5_Panels_Vents_Vertical                       ;8FCAD6;
    dw RTS_8FC8C7                                                        ;8FCAD8;

RoomState_AssemblyLine_1:
    dl LevelData_AssemblyLine                                            ;8FCADA;
    db $04,$00,$00                                                       ;8FCADD;
    dw FXHeader_AssemblyLine_State1                                      ;8FCAE0;
    dw EnemyPopulations_AssemblyLine_1                                   ;8FCAE2;
    dw EnemySets_AssemblyLine_1                                          ;8FCAE4;
    db $C1,$C1                                                           ;8FCAE6;
    dw $0000                                                             ;8FCAE8;
    dw $0000                                                             ;8FCAEA;
    dw $0000                                                             ;8FCAEC;
    dw PLMPopulation_AssemblyLine_State1                                 ;8FCAEE;
    dw LibBG_WreckedShip_4_5_Panels_Vents_Vertical                       ;8FCAF0;
    dw RTS_8FC8C7                                                        ;8FCAF2;

RoomDoors_AssemblyLine:
    dw Door_AssemblyLine_0                                               ;8FCAF4;

RoomHeader_WreckedShipMainShaft:
    db $04,$03,$0C,$0B,$06,$08,$70,$A0,$00                               ;8FCAF6;
    dw RoomDoors_WreckedShipMainShaft                                    ;8FCAFF;
    dw RoomStateCheck_BossIsDead                                         ;8FCB01;
    db $01                                                               ;8FCB03;
    dw RoomState_WreckedShipMainShaft_1                                  ;8FCB04;
    dw Use_StatePointer_inX                                              ;8FCB06;

RoomState_WreckedShipMainShaft_0:
    dl LevelData_WreckedShipMainShaft_State0                             ;8FCB08;
    db $05,$30,$05                                                       ;8FCB0B;
    dw FXHeader_WreckedShipMainShaft_State0                              ;8FCB0E;
    dw EnemyPopulations_WreckedShipMainShaft_0                           ;8FCB10;
    dw EnemySets_WreckedShipMainShaft_0                                  ;8FCB12;
    db $C1,$C1                                                           ;8FCB14;
    dw RoomScrolls_WreckedShipMainShaft                                  ;8FCB16;
    dw $0000                                                             ;8FCB18;
    dw $0000                                                             ;8FCB1A;
    dw PLMPopulation_WreckedShipMainShaft_State0_1                       ;8FCB1C;
    dw LibBG_WreckedShip_4_5_Panels_Vents_Horizontal                     ;8FCB1E;
    dw RTS_8FC8C7                                                        ;8FCB20;

RoomState_WreckedShipMainShaft_1:
    dl LevelData_WreckedShipMainShaft_State1                             ;8FCB22;
    db $04,$30,$06                                                       ;8FCB25;
    dw FXHeader_WreckedShipMainShaft_State1                              ;8FCB28;
    dw EnemyPopulations_WreckedShipMainShaft_1                           ;8FCB2A;
    dw EnemySets_WreckedShipMainShaft_1                                  ;8FCB2C;
    db $C1,$C1                                                           ;8FCB2E;
    dw RoomScrolls_WreckedShipMainShaft                                  ;8FCB30;
    dw $0000                                                             ;8FCB32;
    dw $0000                                                             ;8FCB34;
    dw PLMPopulation_WreckedShipMainShaft_State0_1                       ;8FCB36;
    dw LibBG_WreckedShip_4_5_Panels_Vents_Horizontal                     ;8FCB38;
    dw RTS_8FC8C7                                                        ;8FCB3A;

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
    db $21,$01,$80                                                       ;8FCB7A;

RoomPLM_WreckedShipMainShaft_1:
    db $29,$01,$80                                                       ;8FCB7D;

RoomPLM_WreckedShipMainShaft_2:
    db $21,$00,$80                                                       ;8FCB80;

RoomPLM_WreckedShipMainShaft_3:
    db $29,$00,$80                                                       ;8FCB83;

RoomPLM_WreckedShipMainShaft_4:
    db $28,$02,$2E,$02,$80                                               ;8FCB86;

RoomHeader_SpikyDeath:
    db $05,$03,$13,$0F,$02,$01,$70,$A0,$00                               ;8FCB8B;
    dw RoomDoors_SpikyDeath                                              ;8FCB94;
    dw RoomStateCheck_BossIsDead                                         ;8FCB96;
    db $01                                                               ;8FCB98;
    dw RoomState_SpikyDeath_1                                            ;8FCB99;
    dw Use_StatePointer_inX                                              ;8FCB9B;

RoomState_SpikyDeath_0:
    dl LevelData_SpikyDeath                                              ;8FCB9D;
    db $05,$00,$00                                                       ;8FCBA0;
    dw FXHeader_SpikyDeath_State0                                        ;8FCBA3;
    dw EnemyPopulations_SpikyDeath_0                                     ;8FCBA5;
    dw EnemySets_SpikyDeath_0                                            ;8FCBA7;
    db $C1,$C1                                                           ;8FCBA9;
    dw $0000                                                             ;8FCBAB;
    dw $0000                                                             ;8FCBAD;
    dw $0000                                                             ;8FCBAF;
    dw PLMPopulation_SpikyDeath_State0                                   ;8FCBB1;
    dw LibBG_WreckedShip_4_5_Columns_Tubes                               ;8FCBB3;
    dw RTS_8FC8C7                                                        ;8FCBB5;

RoomState_SpikyDeath_1:
    dl LevelData_SpikyDeath                                              ;8FCBB7;
    db $04,$00,$00                                                       ;8FCBBA;
    dw FXHeader_SpikyDeath_State1                                        ;8FCBBD;
    dw EnemyPopulations_SpikyDeath_1                                     ;8FCBBF;
    dw EnemySets_SpikyDeath_1                                            ;8FCBC1;
    db $C1,$C1                                                           ;8FCBC3;
    dw $0000                                                             ;8FCBC5;
    dw $0000                                                             ;8FCBC7;
    dw $0000                                                             ;8FCBC9;
    dw PLMPopulation_SpikyDeath_State1                                   ;8FCBCB;
    dw LibBG_WreckedShip_4_5_Columns_Tubes                               ;8FCBCD;
    dw RTS_8FC8C7                                                        ;8FCBCF;

RoomDoors_SpikyDeath:
    dw Door_SpikyDeath_0                                                 ;8FCBD1;
    dw Door_SpikyDeath_1                                                 ;8FCBD3;

RoomHeader_ElectricDeath:
    db $06,$03,$15,$0D,$01,$03,$70,$A0,$00                               ;8FCBD5;
    dw RoomDoors_ElectricDeath                                           ;8FCBDE;
    dw RoomStateCheck_BossIsDead                                         ;8FCBE0;
    db $01                                                               ;8FCBE2;
    dw RoomState_ElectricDeath_1                                         ;8FCBE3;
    dw Use_StatePointer_inX                                              ;8FCBE5;

RoomState_ElectricDeath_0:
    dl LevelData_ElectricDeath                                           ;8FCBE7;
    db $05,$30,$05                                                       ;8FCBEA;
    dw FXHeader_ElectricDeath_State0                                     ;8FCBED;
    dw EnemyPopulations_ElectricDeath_0                                  ;8FCBEF;
    dw EnemySets_ElectricDeath_0                                         ;8FCBF1;
    db $C1,$C1                                                           ;8FCBF3;
    dw RoomScrolls_ElectricDeath                                         ;8FCBF5;
    dw $0000                                                             ;8FCBF7;
    dw $0000                                                             ;8FCBF9;
    dw PLMPopulation_ElectricDeath_State0                                ;8FCBFB;
    dw LibBG_WreckedShip_4_5_Panels_Vents_Horizontal                     ;8FCBFD;
    dw RTS_8FC8C7                                                        ;8FCBFF;

RoomState_ElectricDeath_1:
    dl LevelData_ElectricDeath                                           ;8FCC01;
    db $04,$30,$06                                                       ;8FCC04;
    dw FXHeader_ElectricDeath_State1                                     ;8FCC07;
    dw EnemyPopulations_ElectricDeath_1                                  ;8FCC09;
    dw EnemySets_ElectricDeath_1                                         ;8FCC0B;
    db $C1,$C1                                                           ;8FCC0D;
    dw RoomScrolls_ElectricDeath                                         ;8FCC0F;
    dw $0000                                                             ;8FCC11;
    dw $0000                                                             ;8FCC13;
    dw PLMPopulation_ElectricDeath_State1                                ;8FCC15;
    dw LibBG_WreckedShip_4_5_Panels_Vents_Horizontal                     ;8FCC17;
    dw RTS_8FC8C7                                                        ;8FCC19;

RoomDoors_ElectricDeath:
    dw Door_ElectricDeath_0                                              ;8FCC1B;
    dw Door_ElectricDeath_1                                              ;8FCC1D;
    dw Door_ElectricDeath_2                                              ;8FCC1F;

RoomScrolls_ElectricDeath:
    db $00,$02,$02                                                       ;8FCC21;

RoomPLM_ElectricDeath_0:
    db $00,$02,$80                                                       ;8FCC24;

RoomHeader_WreckedShipETank:
    db $07,$03,$12,$0D,$03,$02,$90,$A0,$00                               ;8FCC27;
    dw RoomDoors_WreckedShipETank                                        ;8FCC30;
    dw RoomStateCheck_BossIsDead                                         ;8FCC32;
    db $01                                                               ;8FCC34;
    dw RoomState_WreckedShipETank_1                                      ;8FCC35;
    dw Use_StatePointer_inX                                              ;8FCC37;

RoomState_WreckedShipETank_0:
    dl LevelData_WreckedShipETank                                        ;8FCC39;
    db $05,$00,$03                                                       ;8FCC3C;
    dw FXHeader_WreckedShipETank_State0                                  ;8FCC3F;
    dw EnemyPopulations_WreckedShipETank_0                               ;8FCC41;
    dw EnemySets_WreckedShipETank_0                                      ;8FCC43;
    db $C0,$00                                                           ;8FCC45;
    dw $0000                                                             ;8FCC47;
    dw $0000                                                             ;8FCC49;
    dw $0000                                                             ;8FCC4B;
    dw PLMPopulation_WreckedShipETank_State0                             ;8FCC4D;
    dw $0000                                                             ;8FCC4F;
    dw RTS_8FC8C7                                                        ;8FCC51;

RoomState_WreckedShipETank_1:
    dl LevelData_WreckedShipETank                                        ;8FCC53;
    db $04,$00,$03                                                       ;8FCC56;
    dw FXHeader_WreckedShipETank_State1                                  ;8FCC59;
    dw EnemyPopulations_WreckedShipETank_1                               ;8FCC5B;
    dw EnemySets_WreckedShipETank_1                                      ;8FCC5D;
    db $C0,$00                                                           ;8FCC5F;
    dw $0000                                                             ;8FCC61;
    dw $0000                                                             ;8FCC63;
    dw $0000                                                             ;8FCC65;
    dw PLMPopulation_WreckedShipETank_State1                             ;8FCC67;
    dw $0000                                                             ;8FCC69;
    dw RTS_8FC8C7                                                        ;8FCC6B;

RoomDoors_WreckedShipETank:
    dw Door_WreckedShipETank_0                                           ;8FCC6D;

RoomHeader_Basement:
    db $08,$03,$0E,$13,$05,$01,$70,$A0,$00                               ;8FCC6F;
    dw RoomDoors_Basement                                                ;8FCC78;
    dw RoomStateCheck_BossIsDead                                         ;8FCC7A;
    db $01                                                               ;8FCC7C;
    dw RoomState_Basement_1                                              ;8FCC7D;
    dw Use_StatePointer_inX                                              ;8FCC7F;

RoomState_Basement_0:
    dl LevelData_Basement                                                ;8FCC81;
    db $05,$30,$05                                                       ;8FCC84;
    dw FXHeader_Basement_State0                                          ;8FCC87;
    dw EnemyPopulations_Basement_0                                       ;8FCC89;
    dw EnemySets_Basement_0                                              ;8FCC8B;
    db $C1,$C1                                                           ;8FCC8D;
    dw RoomScrolls_Basement                                              ;8FCC8F;
    dw $0000                                                             ;8FCC91;
    dw $0000                                                             ;8FCC93;
    dw PLMPopulation_Basement_State0                                     ;8FCC95;
    dw LibBG_WreckedShip_4_5_Columns_Tubes                               ;8FCC97;
    dw SetupASM_SpawnPrePhantoonRoomEnemyProjectile                      ;8FCC99;

RoomState_Basement_1:
    dl LevelData_Basement                                                ;8FCC9B;
    db $04,$30,$06                                                       ;8FCC9E;
    dw FXHeader_Basement_State1                                          ;8FCCA1;
    dw EnemyPopulations_Basement_1                                       ;8FCCA3;
    dw EnemySets_Basement_1                                              ;8FCCA5;
    db $C1,$01                                                           ;8FCCA7;
    dw RoomScrolls_Basement                                              ;8FCCA9;
    dw $0000                                                             ;8FCCAB;
    dw $0000                                                             ;8FCCAD;
    dw PLMPopulation_Basement_State1                                     ;8FCCAF;
    dw LibBG_WreckedShip_4_5_Columns_Tubes                               ;8FCCB1;
    dw SetupASM_SpawnPrePhantoonRoomEnemyProjectile                      ;8FCCB3;

RoomDoors_Basement:
    dw Door_Basement_0                                                   ;8FCCB5;
    dw Door_Basement_1                                                   ;8FCCB7;
    dw Door_Basement_2                                                   ;8FCCB9;

RoomScrolls_Basement:
    db $01,$01,$01,$01,$00                                               ;8FCCBB;

RoomPLM_Basement_0:
    db $03,$01,$04,$01,$80                                               ;8FCCC0;

RoomPLM_Basement_1:
    db $03,$00,$80                                                       ;8FCCC5;

UNUSED_RoomPLM_8FCCC8:
    db $04,$00,$80                                                       ;8FCCC8;

RoomHeader_WreckedShipMap:
    db $09,$03,$0D,$13,$01,$01,$70,$A0,$00                               ;8FCCCB;
    dw RoomDoors_WreckedShipMap                                          ;8FCCD4;
    dw RoomStateCheck_BossIsDead                                         ;8FCCD6;
    db $01                                                               ;8FCCD8;
    dw RoomState_WreckedShipMap_1                                        ;8FCCD9;
    dw Use_StatePointer_inX                                              ;8FCCDB;

RoomState_WreckedShipMap_0:
    dl LevelData_MapStation_RightSideDoor                                ;8FCCDD;
    db $16,$00,$00                                                       ;8FCCE0;
    dw FXHeader_WreckedShipMap_State0                                    ;8FCCE3;
    dw EnemyPopulations_WreckedShipMap_0                                 ;8FCCE5;
    dw EnemySets_WreckedShipMap_0                                        ;8FCCE7;
    db $00,$00                                                           ;8FCCE9;
    dw $0000                                                             ;8FCCEB;
    dw $0000                                                             ;8FCCED;
    dw $0000                                                             ;8FCCEF;
    dw PLMPopulation_WreckedShipMap_State0                               ;8FCCF1;
    dw $0000                                                             ;8FCCF3;
    dw RTS_8FC8D0                                                        ;8FCCF5;

RoomState_WreckedShipMap_1:
    dl LevelData_MapStation_RightSideDoor                                ;8FCCF7;
    db $15,$00,$00                                                       ;8FCCFA;
    dw FXHeader_WreckedShipMap_State1                                    ;8FCCFD;
    dw EnemyPopulations_WreckedShipMap_1                                 ;8FCCFF;
    dw EnemySets_WreckedShipMap_1                                        ;8FCD01;
    db $00,$00                                                           ;8FCD03;
    dw $0000                                                             ;8FCD05;
    dw $0000                                                             ;8FCD07;
    dw $0000                                                             ;8FCD09;
    dw PLMPopulation_WreckedShipMap_State1                               ;8FCD0B;
    dw $0000                                                             ;8FCD0D;
    dw RTS_8FC8D0                                                        ;8FCD0F;

RoomDoors_WreckedShipMap:
    dw Door_WreckedShipMap_0                                             ;8FCD11;

RoomHeader_Phantoon:
    db $0A,$03,$13,$13,$01,$01,$70,$A0,$00                               ;8FCD13;
    dw RoomDoors_Phantoon                                                ;8FCD1C;
    dw RoomStateCheck_BossIsDead                                         ;8FCD1E;
    db $01                                                               ;8FCD20;
    dw RoomState_Phantoon_1                                              ;8FCD21;
    dw Use_StatePointer_inX                                              ;8FCD23;

RoomState_Phantoon_0:
    dl LevelData_Phantoon                                                ;8FCD25;
    db $05,$27,$06                                                       ;8FCD28;
    dw FXHeader_Phantoon_State0                                          ;8FCD2B;
    dw EnemyPopulations_Phantoon_0                                       ;8FCD2D;
    dw EnemySets_Phantoon_0                                              ;8FCD2F;
    db $01,$01                                                           ;8FCD31;
    dw RoomScrolls_Phantoon                                              ;8FCD33;
    dw $0000                                                             ;8FCD35;
    dw $0000                                                             ;8FCD37;
    dw PLMPopulation_Phantoon_State0_1                                   ;8FCD39;
    dw LibBG_Phantoon_State0                                             ;8FCD3B;
    dw RTS_8FC8D0                                                        ;8FCD3D;

RoomState_Phantoon_1:
    dl LevelData_Phantoon                                                ;8FCD3F;
    db $04,$00,$03                                                       ;8FCD42;
    dw FXHeader_Phantoon_State1                                          ;8FCD45;
    dw EnemyPopulations_Phantoon_1                                       ;8FCD47;
    dw EnemySets_Phantoon_1                                              ;8FCD49;
    db $01,$01                                                           ;8FCD4B;
    dw RoomScrolls_Phantoon                                              ;8FCD4D;
    dw $0000                                                             ;8FCD4F;
    dw $0000                                                             ;8FCD51;
    dw PLMPopulation_Phantoon_State0_1                                   ;8FCD53;
    dw LibBG_Phantoon_Draygon_State1                                     ;8FCD55;
    dw RTS_8FC8D0                                                        ;8FCD57;

RoomDoors_Phantoon:
    dw Door_Phantoon_0                                                   ;8FCD59;

RoomScrolls_Phantoon:
    db $01                                                               ;8FCD5B;

RoomHeader_SpongeBath:
    db $0B,$03,$11,$0F,$02,$01,$70,$A0,$00                               ;8FCD5C;
    dw RoomDoors_SpongeBath                                              ;8FCD65;
    dw RoomStateCheck_BossIsDead                                         ;8FCD67;
    db $01                                                               ;8FCD69;
    dw RoomState_SpongeBath_1                                            ;8FCD6A;
    dw Use_StatePointer_inX                                              ;8FCD6C;

RoomState_SpongeBath_0:
    dl LevelData_SpongeBath                                              ;8FCD6E;
    db $05,$00,$00                                                       ;8FCD71;
    dw FXHeader_SpongeBath_State0                                        ;8FCD74;
    dw EnemyPopulations_SpongeBath_0                                     ;8FCD76;
    dw EnemySets_SpongeBath_0                                            ;8FCD78;
    db $C1,$C1                                                           ;8FCD7A;
    dw RoomScrolls_SpongeBath                                            ;8FCD7C;
    dw $0000                                                             ;8FCD7E;
    dw $0000                                                             ;8FCD80;
    dw PLMPopulation_SpongeBath_State0                                   ;8FCD82;
    dw LibBG_WreckedShip_4_5_Panels_Vents                                ;8FCD84;
    dw RTS_8FC8D0                                                        ;8FCD86;

RoomState_SpongeBath_1:
    dl LevelData_SpongeBath                                              ;8FCD88;
    db $04,$00,$00                                                       ;8FCD8B;
    dw FXHeader_SpongeBath_State1                                        ;8FCD8E;
    dw EnemyPopulations_SpongeBath_1                                     ;8FCD90;
    dw EnemySets_SpongeBath_1                                            ;8FCD92;
    db $C1,$C1                                                           ;8FCD94;
    dw RoomScrolls_SpongeBath                                            ;8FCD96;
    dw $0000                                                             ;8FCD98;
    dw $0000                                                             ;8FCD9A;
    dw PLMPopulation_SpongeBath_State1                                   ;8FCD9C;
    dw LibBG_WreckedShip_4_5_Panels_Vents                                ;8FCD9E;
    dw RTS_8FC8D0                                                        ;8FCDA0;

RoomDoors_SpongeBath:
    dw Door_SpongeBath_0                                                 ;8FCDA2;
    dw Door_SpongeBath_1                                                 ;8FCDA4;

RoomScrolls_SpongeBath:
    db $01,$01                                                           ;8FCDA6;

RoomHeader_WSWestSuper:
    db $0C,$03,$0F,$11,$01,$01,$70,$A0,$00                               ;8FCDA8;
    dw RoomDoors_WSWestSuper                                             ;8FCDB1;
    dw RoomStateCheck_BossIsDead                                         ;8FCDB3;
    db $01                                                               ;8FCDB5;
    dw RoomState_WSWestSuper_1                                           ;8FCDB6;
    dw Use_StatePointer_inX                                              ;8FCDB8;

RoomState_WSWestSuper_0:
    dl LevelData_WSWestSuper                                             ;8FCDBA;
    db $05,$00,$00                                                       ;8FCDBD;
    dw FXHeader_WSWestSuper_State0                                       ;8FCDC0;
    dw EnemyPopulations_WSWestSuper_0                                    ;8FCDC2;
    dw EnemySets_WSWestSuper_0                                           ;8FCDC4;
    db $C1,$C1                                                           ;8FCDC6;
    dw RoomScrolls_WSWestSuper                                           ;8FCDC8;
    dw $0000                                                             ;8FCDCA;
    dw $0000                                                             ;8FCDCC;
    dw PLMPopulation_WSWestSuper_State0                                  ;8FCDCE;
    dw LibBG_WreckedShip_4_5_Panels_Vents                                ;8FCDD0;
    dw RTS_8FC8D0                                                        ;8FCDD2;

RoomState_WSWestSuper_1:
    dl LevelData_WSWestSuper                                             ;8FCDD4;
    db $04,$00,$00                                                       ;8FCDD7;
    dw FXHeader_WSWestSuper_State1                                       ;8FCDDA;
    dw EnemyPopulations_WSWestSuper_1                                    ;8FCDDC;
    dw EnemySets_WSWestSuper_1                                           ;8FCDDE;
    db $C1,$C1                                                           ;8FCDE0;
    dw RoomScrolls_WSWestSuper                                           ;8FCDE2;
    dw $0000                                                             ;8FCDE4;
    dw $0000                                                             ;8FCDE6;
    dw PLMPopulation_WSWestSuper_State1                                  ;8FCDE8;
    dw LibBG_WreckedShip_4_5_Panels_Vents                                ;8FCDEA;
    dw RTS_8FC8D0                                                        ;8FCDEC;

RoomDoors_WSWestSuper:
    dw Door_WSWestSuper_0                                                ;8FCDEE;

RoomScrolls_WSWestSuper:
    db $01                                                               ;8FCDF0;

RoomHeader_WSEastSuper:
    db $0D,$03,$12,$11,$04,$01,$70,$A0,$00                               ;8FCDF1;
    dw RoomDoors_WSEastSuper                                             ;8FCDFA;
    dw RoomStateCheck_BossIsDead                                         ;8FCDFC;
    db $01                                                               ;8FCDFE;
    dw RoomState_WSEastSuper_1                                           ;8FCDFF;
    dw Use_StatePointer_inX                                              ;8FCE01;

RoomState_WSEastSuper_0:
    dl LevelData_WSEastSuper_State0                                      ;8FCE03;
    db $05,$00,$00                                                       ;8FCE06;
    dw FXHeader_VariousRooms_State0_839C74                               ;8FCE09;
    dw EnemyPopulations_WSEastSuper_0                                    ;8FCE0B;
    dw EnemySets_WSEastSuper_0                                           ;8FCE0D;
    db $C1,$C1                                                           ;8FCE0F;
    dw RoomScrolls_WSEastSuper                                           ;8FCE11;
    dw $0000                                                             ;8FCE13;
    dw $0000                                                             ;8FCE15;
    dw PLMPopulation_WSEastSuper_State0                                  ;8FCE17;
    dw LibBG_WreckedShip_4_5_Panels_Vents_Horizontal                     ;8FCE19;
    dw RTS_8FC8D0                                                        ;8FCE1B;

RoomState_WSEastSuper_1:
    dl LevelData_WSEastSuper_State1                                      ;8FCE1D;
    db $04,$00,$00                                                       ;8FCE20;
    dw FXHeader_WSEastSuper_State1                                       ;8FCE23;
    dw EnemyPopulations_WSEastSuper_1                                    ;8FCE25;
    dw EnemySets_WSEastSuper_1                                           ;8FCE27;
    db $C1,$C1                                                           ;8FCE29;
    dw RoomScrolls_WSEastSuper                                           ;8FCE2B;
    dw $0000                                                             ;8FCE2D;
    dw $0000                                                             ;8FCE2F;
    dw PLMPopulation_WSEastSuper_State1                                  ;8FCE31;
    dw LibBG_WreckedShip_4_5_Panels_Vents                                ;8FCE33;
    dw RTS_8FC8D0                                                        ;8FCE35;

RoomDoors_WSEastSuper:
    dw Door_WSEastSuper_0                                                ;8FCE37;

RoomScrolls_WSEastSuper:
    db $01,$01,$01,$00                                                   ;8FCE39;

RoomPLM_WSEastSuper_0:
    db $03,$01,$80                                                       ;8FCE3D;

RoomHeader_GravitySuit:
    db $0E,$03,$0A,$0D,$01,$01,$70,$A0,$00                               ;8FCE40;
    dw RoomDoors_GravitySuit                                             ;8FCE49;
    dw RoomStateCheck_BossIsDead                                         ;8FCE4B;
    db $01                                                               ;8FCE4D;
    dw RoomState_GravitySuit_1                                           ;8FCE4E;
    dw Use_StatePointer_inX                                              ;8FCE50;

RoomState_GravitySuit_0:
    dl LevelData_GravitySuit                                             ;8FCE52;
    db $05,$00,$00                                                       ;8FCE55;
    dw FXHeader_VariousRooms_State0_839C74                               ;8FCE58;
    dw EnemyPopulations_GravitySuit_0                                    ;8FCE5A;
    dw EnemySets_GravitySuit_0                                           ;8FCE5C;
    db $01,$01                                                           ;8FCE5E;
    dw $0000                                                             ;8FCE60;
    dw $0000                                                             ;8FCE62;
    dw $0000                                                             ;8FCE64;
    dw PLMPopulation_GravitySuit_State0_WreckedShipSave_State0           ;8FCE66;
    dw LibBG_WreckedShip_4_5_Panels_Vents                                ;8FCE68;
    dw RTS_8FC8D0                                                        ;8FCE6A;

RoomState_GravitySuit_1:
    dl LevelData_GravitySuit                                             ;8FCE6C;
    db $04,$00,$00                                                       ;8FCE6F;
    dw FXHeader_GravitySuit_State1_WreckedShipSave_State1                ;8FCE72;
    dw EnemyPopulations_GravitySuit_1                                    ;8FCE74;
    dw EnemySets_GravitySuit_1                                           ;8FCE76;
    db $01,$01                                                           ;8FCE78;
    dw $0000                                                             ;8FCE7A;
    dw $0000                                                             ;8FCE7C;
    dw $0000                                                             ;8FCE7E;
    dw PLMPopulation_GravitySuit_State1                                  ;8FCE80;
    dw LibBG_WreckedShip_4_5_Panels_Vents                                ;8FCE82;
    dw RTS_8FC8D0                                                        ;8FCE84;

RoomDoors_GravitySuit:
    dw Door_GravitySuit_0                                                ;8FCE86;
    dw Door_GravitySuit_1                                                ;8FCE88;

RoomHeader_WreckedShipSave:
    db $0F,$03,$11,$0E,$01,$01,$70,$A0,$00                               ;8FCE8A;
    dw RoomDoors_WreckedShipSave                                         ;8FCE93;
    dw RoomStateCheck_BossIsDead                                         ;8FCE95;
    db $01                                                               ;8FCE97;
    dw RoomState_WreckedShipSave_1                                       ;8FCE98;
    dw Use_StatePointer_inX                                              ;8FCE9A;

RoomState_WreckedShipSave_0:
    dl LevelData_SaveStation_LeftSideDoor                                ;8FCE9C;
    db $16,$30,$05                                                       ;8FCE9F;
    dw FXHeader_VariousRooms_State0_839C74                               ;8FCEA2;
    dw EnemyPopulations_WreckedShipSave_0                                ;8FCEA4;
    dw EnemySets_WreckedShipSave_0                                       ;8FCEA6;
    db $00,$00                                                           ;8FCEA8;
    dw $0000                                                             ;8FCEAA;
    dw $0000                                                             ;8FCEAC;
    dw $0000                                                             ;8FCEAE;
    dw PLMPopulation_GravitySuit_State0_WreckedShipSave_State0           ;8FCEB0;
    dw $0000                                                             ;8FCEB2;
    dw $0000                                                             ;8FCEB4;

RoomState_WreckedShipSave_1:
    dl LevelData_SaveStation_LeftSideDoor                                ;8FCEB6;
    db $15,$30,$06                                                       ;8FCEB9;
    dw FXHeader_GravitySuit_State1_WreckedShipSave_State1                ;8FCEBC;
    dw EnemyPopulations_WreckedShipSave_1                                ;8FCEBE;
    dw EnemySets_WreckedShipSave_1                                       ;8FCEC0;
    db $00,$00                                                           ;8FCEC2;
    dw $0000                                                             ;8FCEC4;
    dw $0000                                                             ;8FCEC6;
    dw $0000                                                             ;8FCEC8;
    dw PLMPopulation_WreckedShipSave_State1                              ;8FCECA;
    dw $0000                                                             ;8FCECC;
    dw RTS_8FC8D0                                                        ;8FCECE;

RoomDoors_WreckedShipSave:
    dw Door_WreckedShipSave_0                                            ;8FCED0;

RoomHeader_GlassTunnelSave:
    db $00,$04,$0C,$13,$01,$01,$70,$A0,$00                               ;8FCED2;
    dw RoomDoors_GlassTunnelSave                                         ;8FCEDB;
    dw Use_StatePointer_inX                                              ;8FCEDD;

RoomState_GlassTunnelSave:
    dl LevelData_SaveStation_LeftSideDoor                                ;8FCEDF;
    db $19,$12,$05                                                       ;8FCEE2;
    dw FXHeader_GlassTunnelSave                                          ;8FCEE5;
    dw EnemyPopulations_GlassTunnelSave                                  ;8FCEE7;
    dw EnemySets_GlassTunnelSave                                         ;8FCEE9;
    db $00,$00                                                           ;8FCEEB;
    dw $0000                                                             ;8FCEED;
    dw $0000                                                             ;8FCEEF;
    dw $0000                                                             ;8FCEF1;
    dw PLMPopulation_GlassTunnelSave                                     ;8FCEF3;
    dw $0000                                                             ;8FCEF5;
    dw RTS_8FC8D1                                                        ;8FCEF7;

RoomDoors_GlassTunnelSave:
    dw Door_GlassTunnelSave_0                                            ;8FCEF9;

RoomHeader_GlassTunnel:
    db $01,$04,$0B,$11,$01,$03,$70,$A0,$00                               ;8FCEFB;
    dw RoomDoors_GlassTunnel                                             ;8FCF04;
    dw RoomStateCheck_EventHasBeenSet                                    ;8FCF06;
    db $0B                                                               ;8FCF08;
    dw RoomState_GlassTunnel_1                                           ;8FCF09;
    dw Use_StatePointer_inX                                              ;8FCF0B;

RoomState_GlassTunnel_0:
    dl LevelData_GlassTunnel_State0                                      ;8FCF0D;
    db $0B,$12,$05                                                       ;8FCF10;
    dw FXHeader_GlassTunnel_State0_1                                     ;8FCF13;
    dw EnemyPopulations_GlassTunnel                                      ;8FCF15;
    dw EnemySets_GlassTunnel                                             ;8FCF17;
    db $00,$C0                                                           ;8FCF19;
    dw RoomScrolls_GlassTunnel                                           ;8FCF1B;
    dw $0000                                                             ;8FCF1D;
    dw $0000                                                             ;8FCF1F;
    dw PLMPopulation_GlassTunnel_State0_1                                ;8FCF21;
    dw $0000                                                             ;8FCF23;
    dw RTS_8FC8D1                                                        ;8FCF25;

RoomState_GlassTunnel_1:
    dl LevelData_GlassTunnel_State1                                      ;8FCF27;
    db $0B,$12,$05                                                       ;8FCF2A;
    dw FXHeader_GlassTunnel_State0_1                                     ;8FCF2D;
    dw EnemyPopulations_GlassTunnel                                      ;8FCF2F;
    dw EnemySets_GlassTunnel                                             ;8FCF31;
    db $00,$C0                                                           ;8FCF33;
    dw RoomScrolls_GlassTunnel                                           ;8FCF35;
    dw $0000                                                             ;8FCF37;
    dw $0000                                                             ;8FCF39;
    dw PLMPopulation_GlassTunnel_State0_1                                ;8FCF3B;
    dw $0000                                                             ;8FCF3D;
    dw RTS_8FC8D1                                                        ;8FCF3F;

RoomDoors_GlassTunnel:
    dw Door_GlassTunnel_0                                                ;8FCF41;
    dw Door_GlassTunnel_1                                                ;8FCF43;
    dw Door_GlassTunnel_2                                                ;8FCF45;
    dw Door_GlassTunnel_3                                                ;8FCF47;

RoomScrolls_GlassTunnel:
    db $02,$02,$02                                                       ;8FCF49;

RoomPLM_GlassTunnel_0_4:
    db $00,$02,$80                                                       ;8FCF4C;

RoomPLM_GlassTunnel_8:
    db $01,$02,$02,$02,$80                                               ;8FCF4F;

RoomHeader_WestTunnel:
    db $02,$04,$0A,$12,$01,$01,$70,$A0,$00                               ;8FCF54;
    dw RoomDoors_WestTunnel                                              ;8FCF5D;
    dw Use_StatePointer_inX                                              ;8FCF5F;

RoomState_WestTunnel:
    dl LevelData_WestTunnel                                              ;8FCF61;
    db $0B,$00,$00                                                       ;8FCF64;
    dw FXHeader_WestTunnel                                               ;8FCF67;
    dw EnemyPopulations_WestTunnel                                       ;8FCF69;
    dw EnemySets_WestTunnel                                              ;8FCF6B;
    db $00,$00                                                           ;8FCF6D;
    dw RoomScrolls_WestTunnel                                            ;8FCF6F;
    dw $0000                                                             ;8FCF71;
    dw $0000                                                             ;8FCF73;
    dw PLMPopulation_WestTunnel                                          ;8FCF75;
    dw $0000                                                             ;8FCF77;
    dw RTS_8FC8D1                                                        ;8FCF79;

RoomDoors_WestTunnel:
    dw Door_WestTunnel_0                                                 ;8FCF7B;
    dw Door_WestTunnel_1                                                 ;8FCF7D;

RoomScrolls_WestTunnel:
    db $01                                                               ;8FCF7F;

RoomHeader_EastTunnel:
    db $03,$04,$0C,$11,$04,$02,$70,$A0,$00                               ;8FCF80;
    dw RoomDoors_EastTunnel                                              ;8FCF89;
    dw Use_StatePointer_inX                                              ;8FCF8B;

RoomState_EastTunnel:
    dl LevelData_EastTunnel                                              ;8FCF8D;
    db $0B,$12,$05                                                       ;8FCF90;
    dw FXHeader_EastTunnel                                               ;8FCF93;
    dw EnemyPopulations_EastTunnel                                       ;8FCF95;
    dw EnemySets_EastTunnel                                              ;8FCF97;
    db $00,$00                                                           ;8FCF99;
    dw RoomScrolls_EastTunnel                                            ;8FCF9B;
    dw $0000                                                             ;8FCF9D;
    dw $0000                                                             ;8FCF9F;
    dw PLMPopulation_EastTunnel                                          ;8FCFA1;
    dw $0000                                                             ;8FCFA3;
    dw RTS_8FC8D1                                                        ;8FCFA5;

RoomDoors_EastTunnel:
    dw Door_EastTunnel_0                                                 ;8FCFA7;
    dw Door_EastTunnel_1                                                 ;8FCFA9;
    dw Door_EastTunnel_2                                                 ;8FCFAB;

RoomScrolls_EastTunnel:
    db $01,$01,$01,$01,$00,$00,$00,$00                                   ;8FCFAD;

RoomPLM_EastTunnel_0:
    db $00,$01,$01,$00,$04,$00,$80                                       ;8FCFB5;

RoomPLM_EastTunnel_1:
    db $00,$02,$04,$01,$80                                               ;8FCFBC;

RoomPLM_EastTunnel_2:
    db $00,$00,$04,$01,$80                                               ;8FCFC1;

RoomPLM_EastTunnel_9:
    db $01,$01,$80                                                       ;8FCFC6;

RoomHeader_MainStreet:
    db $04,$04,$0A,$09,$03,$08,$70,$A0,$00                               ;8FCFC9;
    dw RoomDoors_MainStreet                                              ;8FCFD2;
    dw Use_StatePointer_inX                                              ;8FCFD4;

RoomState_MainStreet:
    dl LevelData_MainStreet                                              ;8FCFD6;
    db $0B,$1B,$06                                                       ;8FCFD9;
    dw FXHeader_MainStreet                                               ;8FCFDC;
    dw EnemyPopulations_MainStreet                                       ;8FCFDE;
    dw EnemySets_MainStreet                                              ;8FCFE0;
    db $C0,$C0                                                           ;8FCFE2;
    dw RoomScrolls_MainStreet                                            ;8FCFE4;
    dw $0000                                                             ;8FCFE6;
    dw $0000                                                             ;8FCFE8;
    dw PLMPopulation_MainStreet                                          ;8FCFEA;
    dw $0000                                                             ;8FCFEC;
    dw RTS_8FC8D1                                                        ;8FCFEE;

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
    db $07,$01,$0A,$00,$80                                               ;8FD012;

RoomHeader_FishTank:
    db $05,$04,$0D,$0D,$04,$03,$70,$A0,$00                               ;8FD017;
    dw RoomDoors_FishTank                                                ;8FD020;
    dw Use_StatePointer_inX                                              ;8FD022;

RoomState_FishTank:
    dl LevelData_FishTank                                                ;8FD024;
    db $0B,$00,$00                                                       ;8FD027;
    dw FXHeader_FishTank                                                 ;8FD02A;
    dw EnemyPopulations_FishTank                                         ;8FD02C;
    dw EnemySets_FishTank                                                ;8FD02E;
    db $C0,$C0                                                           ;8FD030;
    dw RoomScrolls_FishTank                                              ;8FD032;
    dw $0000                                                             ;8FD034;
    dw $0000                                                             ;8FD036;
    dw PLMPopulation_FishTank                                            ;8FD038;
    dw $0000                                                             ;8FD03A;
    dw RTS_8FC8D1                                                        ;8FD03C;

RoomDoors_FishTank:
    dw Door_FishTank_0                                                   ;8FD03E;
    dw Door_FishTank_1                                                   ;8FD040;
    dw Door_FishTank_2                                                   ;8FD042;
    dw Door_FishTank_3                                                   ;8FD044;

RoomScrolls_FishTank:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$00,$02                   ;8FD046;

RoomPLM_FishTank_3_7:
    db $0A,$02,$80                                                       ;8FD052;

RoomHeader_MamaTurtle:
    db $06,$04,$11,$0C,$03,$04,$70,$A0,$00                               ;8FD055;
    dw RoomDoors_MamaTurtle                                              ;8FD05E;
    dw Use_StatePointer_inX                                              ;8FD060;

RoomState_MamaTurtle:
    dl LevelData_MamaTurtle                                              ;8FD062;
    db $0B,$00,$00                                                       ;8FD065;
    dw FXHeader_MamaTurtle                                               ;8FD068;
    dw EnemyPopulations_MamaTurtle                                       ;8FD06A;
    dw EnemySets_MamaTurtle                                              ;8FD06C;
    db $00,$C0                                                           ;8FD06E;
    dw RoomScrolls_MamaTurtle                                            ;8FD070;
    dw $0000                                                             ;8FD072;
    dw $0000                                                             ;8FD074;
    dw PLMPopulation_MamaTurtle                                          ;8FD076;
    dw $0000                                                             ;8FD078;
    dw RTS_8FC8D1                                                        ;8FD07A;

RoomDoors_MamaTurtle:
    dw Door_MamaTurtle_0                                                 ;8FD07C;

RoomScrolls_MamaTurtle:
    db $00,$02,$02,$00,$02,$02,$00,$02,$02,$02,$02,$02                   ;8FD07E;

RoomHeader_CrabTunnel:
    db $07,$04,$0C,$10,$04,$01,$70,$A0,$00                               ;8FD08A;
    dw RoomDoors_CrabTunnel                                              ;8FD093;
    dw Use_StatePointer_inX                                              ;8FD095;

RoomState_CrabTunnel:
    dl LevelData_CrabTunnel                                              ;8FD097;
    db $0B,$1B,$06                                                       ;8FD09A;
    dw FXHeader_CrabTunnel                                               ;8FD09D;
    dw EnemyPopulations_CrabTunnel                                       ;8FD09F;
    dw EnemySets_CrabTunnel                                              ;8FD0A1;
    db $C1,$C1                                                           ;8FD0A3;
    dw RoomScrolls_CrabTunnel                                            ;8FD0A5;
    dw $0000                                                             ;8FD0A7;
    dw $0000                                                             ;8FD0A9;
    dw PLMPopulation_CrabTunnel                                          ;8FD0AB;
    dw LibBG_Maridia_B_BrownWall                                         ;8FD0AD;
    dw RTS_8FC8D1                                                        ;8FD0AF;

RoomDoors_CrabTunnel:
    dw Door_CrabTunnel_0                                                 ;8FD0B1;
    dw Door_CrabTunnel_1                                                 ;8FD0B3;

RoomScrolls_CrabTunnel:
    db $01,$01,$01,$01                                                   ;8FD0B5;

RoomHeader_MtEverest:
    db $08,$04,$0C,$09,$06,$04,$90,$A0,$00                               ;8FD0B9;
    dw RoomDoors_MtEverest                                               ;8FD0C2;
    dw Use_StatePointer_inX                                              ;8FD0C4;

RoomState_MtEverest:
    dl LevelData_MtEverest                                               ;8FD0C6;
    db $0B,$00,$00                                                       ;8FD0C9;
    dw FXHeader_MtEverest                                                ;8FD0CC;
    dw EnemyPopulations_MtEverest                                        ;8FD0CE;
    dw EnemySets_MtEverest                                               ;8FD0D0;
    db $C0,$C0                                                           ;8FD0D2;
    dw RoomScrolls_MtEverest                                             ;8FD0D4;
    dw $0000                                                             ;8FD0D6;
    dw $0000                                                             ;8FD0D8;
    dw PLMPopulation_MtEverest                                           ;8FD0DA;
    dw $0000                                                             ;8FD0DC;
    dw RTS_8FC8D1                                                        ;8FD0DE;

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

RoomHeader_RedFish:
    db $09,$04,$0C,$07,$03,$02,$70,$A0,$00                               ;8FD104;
    dw RoomDoors_RedFish                                                 ;8FD10D;
    dw Use_StatePointer_inX                                              ;8FD10F;

RoomState_RedFish:
    dl LevelData_RedFish                                                 ;8FD111;
    db $0B,$1B,$06                                                       ;8FD114;
    dw FXHeader_RedFish                                                  ;8FD117;
    dw EnemyPopulations_RedFish                                          ;8FD119;
    dw EnemySets_RedFish                                                 ;8FD11B;
    db $00,$C0                                                           ;8FD11D;
    dw RoomScrolls_RedFish                                               ;8FD11F;
    dw $0000                                                             ;8FD121;
    dw $0000                                                             ;8FD123;
    dw PLMPopulation_RedFish                                             ;8FD125;
    dw $0000                                                             ;8FD127;
    dw RTS_8FC8D1                                                        ;8FD129;

RoomDoors_RedFish:
    dw Door_RedFish_0                                                    ;8FD12B;
    dw Door_RedFish_1                                                    ;8FD12D;

RoomScrolls_RedFish:
    db $01,$00,$02,$00,$00,$02                                           ;8FD12F;

RoomPLM_RedFish_0:
    db $02,$02,$80                                                       ;8FD135;

RoomPLM_RedFish_1:
    db $01,$01,$80                                                       ;8FD138;

RoomHeader_WateringHole:
    db $0A,$04,$0C,$04,$02,$03,$70,$A0,$00                               ;8FD13B;
    dw RoomDoors_WateringHole                                            ;8FD144;
    dw Use_StatePointer_inX                                              ;8FD146;

RoomState_WateringHole:
    dl LevelData_WateringHole                                            ;8FD148;
    db $0B,$00,$00                                                       ;8FD14B;
    dw FXHeader_WateringHole                                             ;8FD14E;
    dw EnemyPopulations_WateringHole                                     ;8FD150;
    dw EnemySets_WateringHole                                            ;8FD152;
    db $C0,$00                                                           ;8FD154;
    dw RoomScrolls_WateringHole                                          ;8FD156;
    dw $0000                                                             ;8FD158;
    dw $0000                                                             ;8FD15A;
    dw PLMPopulation_WateringHole                                        ;8FD15C;
    dw $0000                                                             ;8FD15E;
    dw RTS_8FC8D1                                                        ;8FD160;

RoomDoors_WateringHole:
    dw Door_WateringHole_0                                               ;8FD162;

RoomScrolls_WateringHole:
    db $02,$01,$02,$00,$00,$00                                           ;8FD164;

RoomPLM_WateringHole_0:
    db $04,$01,$80                                                       ;8FD16A;

RoomHeader_NWestMaridiaBug:
    db $0B,$04,$0E,$04,$04,$02,$70,$A0,$00                               ;8FD16D;
    dw RoomDoors_NWestMaridiaBug                                         ;8FD176;
    dw Use_StatePointer_inX                                              ;8FD178;

RoomState_NWestMaridiaBug:
    dl LevelData_NWestMaridiaBug                                         ;8FD17A;
    db $0B,$00,$00                                                       ;8FD17D;
    dw FXHeader_NWestMaridiaBug                                          ;8FD180;
    dw EnemyPopulations_NWestMaridiaBug                                  ;8FD182;
    dw EnemySets_NWestMaridiaBug                                         ;8FD184;
    db $C0,$00                                                           ;8FD186;
    dw RoomScrolls_NWestMaridiaBug                                       ;8FD188;
    dw $0000                                                             ;8FD18A;
    dw $0000                                                             ;8FD18C;
    dw PLMPopulation_NWestMaridiaBug                                     ;8FD18E;
    dw $0000                                                             ;8FD190;
    dw RTS_8FC8D1                                                        ;8FD192;

RoomDoors_NWestMaridiaBug:
    dw Door_NWestMaridiaBug_0                                            ;8FD194;
    dw Door_NWestMaridiaBug_1                                            ;8FD196;

RoomScrolls_NWestMaridiaBug:
    db $02,$00,$00,$00,$01,$00,$01,$01                                   ;8FD198;

RoomPLM_NWestMaridiaBug_3_7:
    db $05,$01,$80                                                       ;8FD1A0;

RoomHeader_CrabShaft:
    db $0C,$04,$12,$07,$02,$04,$70,$A0,$00                               ;8FD1A3;
    dw RoomDoors_CrabShaft                                               ;8FD1AC;
    dw Use_StatePointer_inX                                              ;8FD1AE;

RoomState_CrabShaft:
    dl LevelData_CrabShaft                                               ;8FD1B0;
    db $0B,$1B,$06                                                       ;8FD1B3;
    dw FXHeader_CrabShaft                                                ;8FD1B6;
    dw EnemyPopulations_CrabShaft                                        ;8FD1B8;
    dw EnemySets_CrabShaft                                               ;8FD1BA;
    db $00,$C0                                                           ;8FD1BC;
    dw RoomScrolls_CrabShaft                                             ;8FD1BE;
    dw $0000                                                             ;8FD1C0;
    dw $0000                                                             ;8FD1C2;
    dw PLMPopulation_CrabShaft                                           ;8FD1C4;
    dw $0000                                                             ;8FD1C6;
    dw RTS_8FC8D1                                                        ;8FD1C8;

RoomDoors_CrabShaft:
    dw Door_CrabShaft_0                                                  ;8FD1CA;
    dw Door_CrabShaft_1                                                  ;8FD1CC;
    dw Door_CrabShaft_2                                                  ;8FD1CE;

RoomScrolls_CrabShaft:
    db $02,$00,$02,$00,$01,$00,$00,$01                                   ;8FD1D0;

RoomPLM_CrabShaft_0:
    db $04,$02,$06,$01,$80                                               ;8FD1D8;

RoomHeader_PseudoPlasmaSpark:
    db $0D,$04,$12,$04,$04,$03,$70,$A0,$00                               ;8FD1DD;
    dw RoomDoors_PseudoPlasmaSpark                                       ;8FD1E6;
    dw Use_StatePointer_inX                                              ;8FD1E8;

RoomState_PseudoPlasmaSpark:
    dl LevelData_PseudoPlasmaSpark                                       ;8FD1EA;
    db $0B,$00,$00                                                       ;8FD1ED;
    dw FXHeader_PseudoPlasmaSpark                                        ;8FD1F0;
    dw EnemyPopulations_PseudoPlasmaSpark                                ;8FD1F2;
    dw EnemySets_PseudoPlasmaSpark                                       ;8FD1F4;
    db $C0,$00                                                           ;8FD1F6;
    dw RoomScrolls_PseudoPlasmaSpark                                     ;8FD1F8;
    dw $0000                                                             ;8FD1FA;
    dw $0000                                                             ;8FD1FC;
    dw PLMPopulation_PseudoPlasmaSpark                                   ;8FD1FE;
    dw $0000                                                             ;8FD200;
    dw RTS_8FC8D1                                                        ;8FD202;

RoomDoors_PseudoPlasmaSpark:
    dw Door_PseudoPlasmaSpark_0                                          ;8FD204;
    dw Door_PseudoPlasmaSpark_1                                          ;8FD206;
    dw Door_PseudoPlasmaSpark_2                                          ;8FD208;

RoomScrolls_PseudoPlasmaSpark:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$00,$00                   ;8FD20A;

RoomPLM_PseudoPlasmaSpark_3:
    db $0A,$02,$80                                                       ;8FD216;

RoomPLM_PseudoPlasmaSpark_7:
    db $0A,$00,$80                                                       ;8FD219;

RoomHeader_CrabHole:
    db $0E,$04,$10,$10,$01,$02,$70,$A0,$00                               ;8FD21C;
    dw RoomDoors_CrabHole                                                ;8FD225;
    dw Use_StatePointer_inX                                              ;8FD227;

RoomState_CrabHole:
    dl LevelData_CrabHole                                                ;8FD229;
    db $0B,$1B,$05                                                       ;8FD22C;
    dw FXHeader_CrabHole                                                 ;8FD22F;
    dw EnemyPopulations_CrabHole                                         ;8FD231;
    dw EnemySets_CrabHole                                                ;8FD233;
    db $00,$00                                                           ;8FD235;
    dw RoomScrolls_CrabHole                                              ;8FD237;
    dw $0000                                                             ;8FD239;
    dw $0000                                                             ;8FD23B;
    dw PLMPopulation_CrabHole                                            ;8FD23D;
    dw $0000                                                             ;8FD23F;
    dw RTS_8FC8D1                                                        ;8FD241;

RoomDoors_CrabHole:
    dw Door_CrabHole_0                                                   ;8FD243;
    dw Door_CrabHole_1                                                   ;8FD245;
    dw Door_CrabHole_2                                                   ;8FD247;
    dw Door_CrabHole_3                                                   ;8FD249;

RoomScrolls_CrabHole:
    db $01,$00                                                           ;8FD24B;

RoomPLM_CrabHole_0_1:
    db $00,$02,$01,$01,$80                                               ;8FD24D;

RoomHeader_WestSandHallTunnel:
    db $0F,$04,$11,$10,$01,$01,$70,$A0,$00                               ;8FD252;
    dw RoomDoors_WestSandHallTunnel                                      ;8FD25B;
    dw Use_StatePointer_inX                                              ;8FD25D;

RoomState_WestSandHallTunnel:
    dl LevelData_WestSandHallTunnel                                      ;8FD25F;
    db $0B,$00,$00                                                       ;8FD262;
    dw FXHeader_WestSandHallTunnel                                       ;8FD265;
    dw EnemyPopulations_WestSandHallTunnel                               ;8FD267;
    dw EnemySets_WestSandHallTunnel                                      ;8FD269;
    db $C0,$00                                                           ;8FD26B;
    dw RoomScrolls_WestSandHallTunnel                                    ;8FD26D;
    dw $0000                                                             ;8FD26F;
    dw $0000                                                             ;8FD271;
    dw PLMPopulation_WestSandHallTunnel                                  ;8FD273;
    dw $0000                                                             ;8FD275;
    dw RTS_8FC8D1                                                        ;8FD277;

RoomDoors_WestSandHallTunnel:
    dw Door_WestSandHallTunnel_0                                         ;8FD279;
    dw Door_WestSandHallTunnel_1                                         ;8FD27B;

RoomScrolls_WestSandHallTunnel:
    db $01                                                               ;8FD27D;

RoomHeader_PlasmaTutorial:
    db $10,$04,$1A,$00,$01,$01,$70,$A0,$00                               ;8FD27E;
    dw RoomDoors_PlasmaTutorial                                          ;8FD287;
    dw Use_StatePointer_inX                                              ;8FD289;

RoomState_PlasmaTutorial:
    dl LevelData_PlasmaTutorial                                          ;8FD28B;
    db $0B,$00,$00                                                       ;8FD28E;
    dw FXHeader_PlasmaTutorial                                           ;8FD291;
    dw EnemyPopulations_PlasmaTutorial                                   ;8FD293;
    dw EnemySets_PlasmaTutorial                                          ;8FD295;
    db $00,$00                                                           ;8FD297;
    dw RoomScrolls_PlasmaTutorial                                        ;8FD299;
    dw $0000                                                             ;8FD29B;
    dw $0000                                                             ;8FD29D;
    dw PLMPopulation_PlasmaTutorial                                      ;8FD29F;
    dw $0000                                                             ;8FD2A1;
    dw RTS_8FC8D1                                                        ;8FD2A3;

RoomDoors_PlasmaTutorial:
    dw Door_PlasmaTutorial_0                                             ;8FD2A5;
    dw Door_PlasmaTutorial_1                                             ;8FD2A7;

RoomScrolls_PlasmaTutorial:
    db $01                                                               ;8FD2A9;

RoomHeader_Plasma:
    db $11,$04,$1B,$00,$02,$03,$70,$A0,$00                               ;8FD2AA;
    dw RoomDoors_Plasma                                                  ;8FD2B3;
    dw Use_StatePointer_inX                                              ;8FD2B5;

RoomState_Plasma:
    dl LevelData_Plasma                                                  ;8FD2B7;
    db $0B,$00,$00                                                       ;8FD2BA;
    dw FXHeader_Plasma                                                   ;8FD2BD;
    dw EnemyPopulations_Plasma                                           ;8FD2BF;
    dw EnemySets_Plasma                                                  ;8FD2C1;
    db $C0,$00                                                           ;8FD2C3;
    dw RoomScrolls_Plasma                                                ;8FD2C5;
    dw $0000                                                             ;8FD2C7;
    dw $0000                                                             ;8FD2C9;
    dw PLMPopulation_Plasma                                              ;8FD2CB;
    dw $0000                                                             ;8FD2CD;
    dw RTS_8FC8D1                                                        ;8FD2CF;

RoomDoors_Plasma:
    dw Door_Plasma_0                                                     ;8FD2D1;

RoomScrolls_Plasma:
    db $02,$02,$02,$02,$01,$01                                           ;8FD2D3;

RoomHeader_ThreadTheNeedle:
    db $12,$04,$1B,$05,$07,$01,$70,$A0,$00                               ;8FD2D9;
    dw RoomDoors_ThreadTheNeedle                                         ;8FD2E2;
    dw Use_StatePointer_inX                                              ;8FD2E4;

RoomState_ThreadTheNeedle:
    dl LevelData_ThreadTheNeedle                                         ;8FD2E6;
    db $0B,$00,$00                                                       ;8FD2E9;
    dw FXHeader_ThreadTheNeedle                                          ;8FD2EC;
    dw EnemyPopulations_ThreadTheNeedle                                  ;8FD2EE;
    dw EnemySets_ThreadTheNeedle                                         ;8FD2F0;
    db $C0,$00                                                           ;8FD2F2;
    dw RoomScrolls_ThreadTheNeedle                                       ;8FD2F4;
    dw $0000                                                             ;8FD2F6;
    dw $0000                                                             ;8FD2F8;
    dw PLMPopulation_ThreadTheNeedle                                     ;8FD2FA;
    dw $0000                                                             ;8FD2FC;
    dw RTS_8FC8D1                                                        ;8FD2FE;

RoomDoors_ThreadTheNeedle:
    dw Door_ThreadTheNeedle_0                                            ;8FD300;
    dw Door_ThreadTheNeedle_1                                            ;8FD302;

RoomScrolls_ThreadTheNeedle:
    db $01,$01,$01,$01,$01,$01,$01                                       ;8FD304;

RoomHeader_MaridiaElev:
    db $13,$04,$22,$00,$01,$06,$70,$A0,$00                               ;8FD30B;
    dw RoomDoors_MaridiaElev                                             ;8FD314;
    dw Use_StatePointer_inX                                              ;8FD316;

RoomState_MaridiaElev:
    dl LevelData_MaridiaElev                                             ;8FD318;
    db $0B,$1B,$05                                                       ;8FD31B;
    dw FXHeader_MaridiaElev                                              ;8FD31E;
    dw EnemyPopulations_MaridiaElev                                      ;8FD320;
    dw EnemySets_MaridiaElev                                             ;8FD322;
    db $00,$C0                                                           ;8FD324;
    dw RoomScrolls_MaridiaElev                                           ;8FD326;
    dw $0000                                                             ;8FD328;
    dw $0000                                                             ;8FD32A;
    dw PLMPopulation_MaridiaElev                                         ;8FD32C;
    dw $0000                                                             ;8FD32E;
    dw RTS_8FC8D1                                                        ;8FD330;

RoomDoors_MaridiaElev:
    dw Door_MaridiaElev_0                                                ;8FD332;
    dw Door_MaridiaElev_1                                                ;8FD334;
    dw Door_MaridiaElev_2                                                ;8FD336;
    dw Door_MaridiaElev_3_TourianFirst_2                                 ;8FD338;

RoomScrolls_MaridiaElev:
    db $02,$02,$02,$02,$02,$01                                           ;8FD33A;

RoomHeader_PlasmaSpark:
    db $14,$04,$16,$02,$04,$06,$70,$A0,$00                               ;8FD340;
    dw RoomDoors_PlasmaSpark                                             ;8FD349;
    dw Use_StatePointer_inX                                              ;8FD34B;

RoomState_PlasmaSpark:
    dl LevelData_PlasmaSpark                                             ;8FD34D;
    db $0B,$00,$05                                                       ;8FD350;
    dw FXHeader_PlasmaSpark                                              ;8FD353;
    dw EnemyPopulations_PlasmaSpark                                      ;8FD355;
    dw EnemySets_PlasmaSpark                                             ;8FD357;
    db $E0,$00                                                           ;8FD359;
    dw RoomScrolls_PlasmaSpark                                           ;8FD35B;
    dw $0000                                                             ;8FD35D;
    dw $0000                                                             ;8FD35F;
    dw PLMPopulation_PlasmaSpark                                         ;8FD361;
    dw $0000                                                             ;8FD363;
    dw RTS_8FC8D1                                                        ;8FD365;

RoomDoors_PlasmaSpark:
    dw Door_PlasmaSpark_0                                                ;8FD367;
    dw Door_PlasmaSpark_1                                                ;8FD369;
    dw Door_PlasmaSpark_2                                                ;8FD36B;
    dw Door_PlasmaSpark_3                                                ;8FD36D;

RoomScrolls_PlasmaSpark:
    db $00,$02,$02,$00,$00,$02,$02,$00,$02,$02,$02,$02,$00,$02,$02,$02   ;8FD36F;
    db $00,$02,$02,$02,$00,$01,$01,$01                                   ;8FD37F;

RoomHeader_Kassiuz:
    db $15,$04,$19,$00,$01,$04,$70,$A0,$00                               ;8FD387;
    dw RoomDoors_Kassiuz                                                 ;8FD390;
    dw Use_StatePointer_inX                                              ;8FD392;

RoomState_Kassiuz:
    dl LevelData_Kassiuz                                                 ;8FD394;
    db $0B,$00,$05                                                       ;8FD397;
    dw FXHeader_Kassiuz                                                  ;8FD39A;
    dw EnemyPopulations_Kassiuz                                          ;8FD39C;
    dw EnemySets_Kassiuz                                                 ;8FD39E;
    db $00,$C0                                                           ;8FD3A0;
    dw RoomScrolls_Kassiuz                                               ;8FD3A2;
    dw $0000                                                             ;8FD3A4;
    dw $0000                                                             ;8FD3A6;
    dw PLMPopulation_Kassiuz                                             ;8FD3A8;
    dw $0000                                                             ;8FD3AA;
    dw RTS_8FC8D1                                                        ;8FD3AC;

RoomDoors_Kassiuz:
    dw Door_Kassiuz_0                                                    ;8FD3AE;
    dw Door_Kassiuz_1                                                    ;8FD3B0;

RoomScrolls_Kassiuz:
    db $02,$02,$02,$02                                                   ;8FD3B2;

RoomHeader_MaridiaMap:
    db $16,$04,$11,$11,$01,$01,$70,$A0,$00                               ;8FD3B6;
    dw RoomDoors_MaridiaMap                                              ;8FD3BF;
    dw Use_StatePointer_inX                                              ;8FD3C1;

RoomState_MaridiaMap:
    dl LevelData_MapStation_LeftSideDoor                                 ;8FD3C3;
    db $15,$00,$00                                                       ;8FD3C6;
    dw FXHeader_MaridiaMap                                               ;8FD3C9;
    dw EnemyPopulations_MaridiaMap                                       ;8FD3CB;
    dw EnemySets_MaridiaMap                                              ;8FD3CD;
    db $00,$00                                                           ;8FD3CF;
    dw $0000                                                             ;8FD3D1;
    dw $0000                                                             ;8FD3D3;
    dw $0000                                                             ;8FD3D5;
    dw PLMPopulation_MaridiaMap                                          ;8FD3D7;
    dw $0000                                                             ;8FD3D9;
    dw RTS_8FC8D1                                                        ;8FD3DB;

RoomDoors_MaridiaMap:
    dw Door_MaridiaMap_0                                                 ;8FD3DD;

RoomHeader_ForgottenHighwaySave:
    db $17,$04,$23,$04,$01,$01,$70,$A0,$00                               ;8FD3DF;
    dw RoomDoors_ForgottenHighwaySave                                    ;8FD3E8;
    dw Use_StatePointer_inX                                              ;8FD3EA;

RoomState_ForgottenHighwaySave:
    dl LevelData_SaveStation_LeftSideDoor                                ;8FD3EC;
    db $19,$1B,$05                                                       ;8FD3EF;
    dw FXHeader_ForgottenHighwaySave                                     ;8FD3F2;
    dw EnemyPopulations_ForgottenHighwaySave                             ;8FD3F4;
    dw EnemySets_ForgottenHighwaySave                                    ;8FD3F6;
    db $00,$00                                                           ;8FD3F8;
    dw $0000                                                             ;8FD3FA;
    dw $0000                                                             ;8FD3FC;
    dw $0000                                                             ;8FD3FE;
    dw PLMPopulation_ForgottenHighwaySave                                ;8FD400;
    dw $0000                                                             ;8FD402;
    dw $0000                                                             ;8FD404;

RoomDoors_ForgottenHighwaySave:
    dw Door_ForgottenHighwaySave_0                                       ;8FD406;

RoomHeader_Toilet:
    db $18,$04,$16,$05,$01,$0A,$70,$A0,$00                               ;8FD408;
    dw RoomDoors_Toilet                                                  ;8FD411;
    dw Use_StatePointer_inX                                              ;8FD413;

RoomState_Toilet:
    dl LevelData_Toilet                                                  ;8FD415;
    db $0C,$00,$00                                                       ;8FD418;
    dw FXHeader_Toilet                                                   ;8FD41B;
    dw EnemyPopulations_Toilet                                           ;8FD41D;
    dw EnemySets_Toilet                                                  ;8FD41F;
    db $00,$00                                                           ;8FD421;
    dw $0001                                                             ;8FD423;
    dw $0000                                                             ;8FD425;
    dw MainASM_Elevatube                                                 ;8FD427;
    dw PLMPopulation_Toilet                                              ;8FD429;
    dw $0000                                                             ;8FD42B;
    dw RTS_8FC8D2                                                        ;8FD42D;

RoomDoors_Toilet:
    dw Door_Toilet_0                                                     ;8FD42F;
    dw Door_Toilet_1                                                     ;8FD431;

RoomHeader_BugSandHole:
    db $19,$04,$1A,$05,$01,$01,$70,$A0,$00                               ;8FD433;
    dw RoomDoors_BugSandHole                                             ;8FD43C;
    dw Use_StatePointer_inX                                              ;8FD43E;

RoomState_BugSandHole:
    dl LevelData_BugSandHole                                             ;8FD440;
    db $0C,$00,$00                                                       ;8FD443;
    dw FXHeader_BugSandHole                                              ;8FD446;
    dw EnemyPopulations_BugSandHole                                      ;8FD448;
    dw EnemySets_BugSandHole                                             ;8FD44A;
    db $00,$00                                                           ;8FD44C;
    dw RoomScrolls_BugSandHole                                           ;8FD44E;
    dw $0000                                                             ;8FD450;
    dw $0000                                                             ;8FD452;
    dw PLMPopulation_BugSandHole                                         ;8FD454;
    dw $0000                                                             ;8FD456;
    dw RTS_8FC8D2                                                        ;8FD458;

RoomDoors_BugSandHole:
    dw Door_BugSandHole_0                                                ;8FD45A;
    dw Door_BugSandHole_1                                                ;8FD45C;
    dw Door_BugSandHole_2                                                ;8FD45E;

RoomScrolls_BugSandHole:
    db $02                                                               ;8FD460;

RoomHeader_WestSandHall:
    db $1A,$04,$12,$10,$04,$01,$70,$A0,$00                               ;8FD461;
    dw RoomDoors_WestSandHall                                            ;8FD46A;
    dw Use_StatePointer_inX                                              ;8FD46C;

RoomState_WestSandHall:
    dl LevelData_WestSandHall                                            ;8FD46E;
    db $0C,$00,$00                                                       ;8FD471;
    dw FXHeader_WestSandHall                                             ;8FD474;
    dw EnemyPopulations_WestSandHall                                     ;8FD476;
    dw EnemySets_WestSandHall                                            ;8FD478;
    db $C1,$01                                                           ;8FD47A;
    dw $0000                                                             ;8FD47C;
    dw $0000                                                             ;8FD47E;
    dw $0000                                                             ;8FD480;
    dw PLMPopulation_WestSandHall                                        ;8FD482;
    dw LibBG_Maridia_C_GreenWall                                         ;8FD484;
    dw RTS_8FC8D2                                                        ;8FD486;

RoomDoors_WestSandHall:
    dw Door_WestSandHall_0                                               ;8FD488;
    dw Door_WestSandHall_1                                               ;8FD48A;
    dw UNUSED_Door_WestSandHall_2_83A654                                 ;8FD48C;

RoomHeader_Oasis:
    db $1B,$04,$16,$0F,$01,$02,$70,$A0,$00                               ;8FD48E;
    dw RoomDoors_Oasis                                                   ;8FD497;
    dw Use_StatePointer_inX                                              ;8FD499;

RoomState_Oasis:
    dl LevelData_Oasis                                                   ;8FD49B;
    db $0C,$00,$00                                                       ;8FD49E;
    dw FXHeader_Oasis                                                    ;8FD4A1;
    dw EnemyPopulations_Oasis                                            ;8FD4A3;
    dw EnemySets_Oasis                                                   ;8FD4A5;
    db $00,$C0                                                           ;8FD4A7;
    dw RoomScrolls_Oasis                                                 ;8FD4A9;
    dw $0000                                                             ;8FD4AB;
    dw $0000                                                             ;8FD4AD;
    dw PLMPopulation_Oasis                                               ;8FD4AF;
    dw $0000                                                             ;8FD4B1;
    dw RTS_8FC8D2                                                        ;8FD4B3;

RoomDoors_Oasis:
    dw Door_Oasis_0                                                      ;8FD4B5;
    dw Door_Oasis_1                                                      ;8FD4B7;
    dw Door_Oasis_2                                                      ;8FD4B9;

RoomScrolls_Oasis:
    db $00,$01                                                           ;8FD4BB;

RoomPLM_Oasis_0:
    db $00,$02,$01,$02,$80                                               ;8FD4BD;

RoomHeader_EastSandHall:
    db $1C,$04,$17,$10,$03,$01,$70,$A0,$00                               ;8FD4C2;
    dw RoomDoors_EastSandHall                                            ;8FD4CB;
    dw Use_StatePointer_inX                                              ;8FD4CD;

RoomState_EastSandHall:
    dl LevelData_EastSandHall                                            ;8FD4CF;
    db $0C,$00,$00                                                       ;8FD4D2;
    dw FXHeader_EastSandHall                                             ;8FD4D5;
    dw EnemyPopulations_EastSandHall                                     ;8FD4D7;
    dw EnemySets_EastSandHall                                            ;8FD4D9;
    db $C1,$01                                                           ;8FD4DB;
    dw $0000                                                             ;8FD4DD;
    dw $0000                                                             ;8FD4DF;
    dw $0000                                                             ;8FD4E1;
    dw PLMPopulation_EastSandHall                                        ;8FD4E3;
    dw LibBG_Maridia_C_GreenWall                                         ;8FD4E5;
    dw RTS_8FC8D2                                                        ;8FD4E7;

RoomDoors_EastSandHall:
    dw Door_EastSandHall_0                                               ;8FD4E9;
    dw Door_EastSandHall_1                                               ;8FD4EB;
    dw UNUSED_Door_EastSandHall_2_83A69C                                 ;8FD4ED;

RoomHeader_WestSandHole:
    db $1D,$04,$14,$0E,$02,$02,$70,$A0,$00                               ;8FD4EF;
    dw RoomDoors_WestSandHole                                            ;8FD4F8;
    dw Use_StatePointer_inX                                              ;8FD4FA;

RoomState_WestSandHole:
    dl LevelData_WestSandHole                                            ;8FD4FC;
    db $0C,$00,$00                                                       ;8FD4FF;
    dw FXHeader_WestSandHole                                             ;8FD502;
    dw EnemyPopulations_WestSandHole                                     ;8FD504;
    dw EnemySets_WestSandHole                                            ;8FD506;
    db $00,$00                                                           ;8FD508;
    dw RoomScrolls_WestSandHole                                          ;8FD50A;
    dw $0000                                                             ;8FD50C;
    dw $0000                                                             ;8FD50E;
    dw PLMPopulation_WestSandHole                                        ;8FD510;
    dw $0000                                                             ;8FD512;
    dw RTS_8FC8D2                                                        ;8FD514;

RoomDoors_WestSandHole:
    dw Door_WestSandHole_0                                               ;8FD516;
    dw Door_WestSandHole_1                                               ;8FD518;

RoomScrolls_WestSandHole:
    db $02,$02,$02,$02                                                   ;8FD51A;

RoomHeader_EastSandHole:
    db $1E,$04,$17,$0E,$02,$02,$70,$A0,$00                               ;8FD51E;
    dw RoomDoors_EastSandHole                                            ;8FD527;
    dw Use_StatePointer_inX                                              ;8FD529;

RoomState_EastSandHole:
    dl LevelData_EastSandHole                                            ;8FD52B;
    db $0C,$00,$00                                                       ;8FD52E;
    dw FXHeader_EastSandHole                                             ;8FD531;
    dw EnemyPopulations_EastSandHole                                     ;8FD533;
    dw EnemySets_EastSandHole                                            ;8FD535;
    db $00,$00                                                           ;8FD537;
    dw RoomScrolls_EastSandHole                                          ;8FD539;
    dw $0000                                                             ;8FD53B;
    dw $0000                                                             ;8FD53D;
    dw PLMPopulation_EastSandHole                                        ;8FD53F;
    dw $0000                                                             ;8FD541;
    dw RTS_8FC8D2                                                        ;8FD543;

RoomDoors_EastSandHole:
    dw Door_EastSandHole_0                                               ;8FD545;
    dw Door_EastSandHole_1                                               ;8FD547;

RoomScrolls_EastSandHole:
    db $02,$02,$02,$02                                                   ;8FD549;

RoomHeader_WestAqueductQuicksand:
    db $1F,$04,$15,$0C,$01,$02,$70,$A0,$00                               ;8FD54D;
    dw RoomDoors_WestAqueductQuicksand                                   ;8FD556;
    dw Use_StatePointer_inX                                              ;8FD558;

RoomState_WestAqueductQuicksand:
    dl LevelData_WestAqueductQuicksand                                   ;8FD55A;
    db $0C,$00,$00                                                       ;8FD55D;
    dw FXHeader_EastAqueductQuicksand_WestAqueductQuicksand              ;8FD560;
    dw EnemyPopulations_WestAqueductQuicksand                            ;8FD562;
    dw EnemySets_WestAqueductQuicksand                                   ;8FD564;
    db $00,$00                                                           ;8FD566;
    dw RoomScrolls_WestAqueductQuicksand                                 ;8FD568;
    dw $0000                                                             ;8FD56A;
    dw $0000                                                             ;8FD56C;
    dw PLMPopulation_WestAqueductQuicksand                               ;8FD56E;
    dw $0000                                                             ;8FD570;
    dw RTS_8FC8D2                                                        ;8FD572;

RoomDoors_WestAqueductQuicksand:
    dw Door_WestAqueductQuicksand_0                                      ;8FD574;
    dw Door_WestAqueductQuicksand_1                                      ;8FD576;

RoomScrolls_WestAqueductQuicksand:
    db $02,$02                                                           ;8FD578;

RoomHeader_EastAqueductQuicksand:
    db $20,$04,$17,$0C,$01,$02,$70,$A0,$00                               ;8FD57A;
    dw RoomDoors_EastAqueductQuicksand                                   ;8FD583;
    dw Use_StatePointer_inX                                              ;8FD585;

RoomState_EastAqueductQuicksand:
    dl LevelData_EastAqueductQuicksand                                   ;8FD587;
    db $0C,$00,$00                                                       ;8FD58A;
    dw FXHeader_EastAqueductQuicksand_WestAqueductQuicksand              ;8FD58D;
    dw EnemyPopulations_EastAqueductQuicksand                            ;8FD58F;
    dw EnemySets_EastAqueductQuicksand                                   ;8FD591;
    db $00,$00                                                           ;8FD593;
    dw RoomScrolls_EastAqueductQuicksand                                 ;8FD595;
    dw $0000                                                             ;8FD597;
    dw $0000                                                             ;8FD599;
    dw PLMPopulation_EastAqueductQuicksand                               ;8FD59B;
    dw $0000                                                             ;8FD59D;
    dw RTS_8FC8D2                                                        ;8FD59F;

RoomDoors_EastAqueductQuicksand:
    dw Door_EastAqueductQuicksand_0                                      ;8FD5A1;
    dw Door_EastAqueductQuicksand_1                                      ;8FD5A3;

RoomScrolls_EastAqueductQuicksand:
    db $02,$02                                                           ;8FD5A5;

RoomHeader_Aqueduct:
    db $21,$04,$14,$09,$06,$03,$90,$A0,$00                               ;8FD5A7;
    dw RoomDoors_Aqueduct                                                ;8FD5B0;
    dw Use_StatePointer_inX                                              ;8FD5B2;

RoomState_Aqueduct:
    dl LevelData_Aqueduct                                                ;8FD5B4;
    db $0C,$1B,$05                                                       ;8FD5B7;
    dw FXHeader_Aqueduct                                                 ;8FD5BA;
    dw EnemyPopulations_Aqueduct                                         ;8FD5BC;
    dw EnemySets_Aqueduct                                                ;8FD5BE;
    db $C0,$00                                                           ;8FD5C0;
    dw RoomScrolls_Aqueduct                                              ;8FD5C2;
    dw $0000                                                             ;8FD5C4;
    dw $0000                                                             ;8FD5C6;
    dw PLMPopulation_Aqueduct                                            ;8FD5C8;
    dw $0000                                                             ;8FD5CA;
    dw RTS_8FC8D2                                                        ;8FD5CC;

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

RoomHeader_Butterfly:
    db $22,$04,$1A,$07,$01,$01,$70,$A0,$00                               ;8FD5EC;
    dw RoomDoors_Butterfly                                               ;8FD5F5;
    dw Use_StatePointer_inX                                              ;8FD5F7;

RoomState_Butterfly:
    dl LevelData_Butterfly                                               ;8FD5F9;
    db $0C,$00,$00                                                       ;8FD5FC;
    dw FXHeader_Butterfly                                                ;8FD5FF;
    dw EnemyPopulations_Butterfly                                        ;8FD601;
    dw EnemySets_Butterfly                                               ;8FD603;
    db $C0,$00                                                           ;8FD605;
    dw $0000                                                             ;8FD607;
    dw $0000                                                             ;8FD609;
    dw $0000                                                             ;8FD60B;
    dw PLMPopulation_Butterfly                                           ;8FD60D;
    dw $0000                                                             ;8FD60F;
    dw RTS_8FC8D2                                                        ;8FD611;

RoomDoors_Butterfly:
    dw Door_Butterfly_0                                                  ;8FD613;
    dw Door_Butterfly_1                                                  ;8FD615;

RoomHeader_BotwoonHallway:
    db $23,$04,$14,$08,$04,$01,$70,$A0,$00                               ;8FD617;
    dw RoomDoors_BotwoonHallway                                          ;8FD620;
    dw Use_StatePointer_inX                                              ;8FD622;

RoomState_BotwoonHallway:
    dl LevelData_BotwoonHallway                                          ;8FD624;
    db $0C,$1B,$05                                                       ;8FD627;
    dw FXHeader_BotwoonHallway                                           ;8FD62A;
    dw EnemyPopulations_BotwoonHallway                                   ;8FD62C;
    dw EnemySets_BotwoonHallway                                          ;8FD62E;
    db $C0,$00                                                           ;8FD630;
    dw RoomScrolls_BotwoonHallway                                        ;8FD632;
    dw $0000                                                             ;8FD634;
    dw $0000                                                             ;8FD636;
    dw PLMPopulation_BotwoonHallway                                      ;8FD638;
    dw $0000                                                             ;8FD63A;
    dw RTS_8FC8D2                                                        ;8FD63C;

RoomDoors_BotwoonHallway:
    dw Door_BotwoonHallway_0                                             ;8FD63E;
    dw Door_BotwoonHallway_1                                             ;8FD640;

RoomScrolls_BotwoonHallway:
    db $02,$02,$02,$02                                                   ;8FD642;

RoomHeader_Pants:
    db $24,$04,$1A,$0D,$02,$04,$70,$A0,$00                               ;8FD646;
    dw RoomDoors_Pants                                                   ;8FD64F;
    dw Use_StatePointer_inX                                              ;8FD651;

RoomState_Pants:
    dl LevelData_Pants                                                   ;8FD653;
    db $0C,$00,$00                                                       ;8FD656;
    dw FXHeader_Pants                                                    ;8FD659;
    dw EnemyPopulations_Pants                                            ;8FD65B;
    dw EnemySets_Pants                                                   ;8FD65D;
    db $00,$C0                                                           ;8FD65F;
    dw RoomScrolls_Pants                                                 ;8FD661;
    dw $0000                                                             ;8FD663;
    dw $0000                                                             ;8FD665;
    dw PLMPopulation_Pants                                               ;8FD667;
    dw $0000                                                             ;8FD669;
    dw RTS_8FC8D2                                                        ;8FD66B;

RoomDoors_Pants:
    dw Door_Pants_0                                                      ;8FD66D;
    dw Door_Pants_1                                                      ;8FD66F;
    dw Door_Pants_2                                                      ;8FD671;
    dw Door_Pants_3                                                      ;8FD673;

RoomScrolls_Pants:
    db $02,$02,$02,$02,$02,$01,$01,$00                                   ;8FD675;

RoomPLM_Pants_0_4:
    db $02,$02,$03,$00,$04,$02,$05,$00,$06,$01,$07,$00,$80               ;8FD67D;

RoomPLM_Pants_D:
    db $02,$00,$03,$02,$04,$00,$05,$01,$06,$00,$80                       ;8FD68A;

RoomPLM_Pants_15:
    db $05,$02,$07,$01,$80                                               ;8FD695;

RoomHeader_EastPants:
    db $25,$04,$1B,$0E,$01,$03,$70,$A0,$00                               ;8FD69A;
    dw RoomDoors_EastPants                                               ;8FD6A3;
    dw Use_StatePointer_inX                                              ;8FD6A5;

RoomState_EastPants:
    dl LevelData_EastPants                                               ;8FD6A7;
    db $0C,$00,$00                                                       ;8FD6AA;
    dw FXHeader_EastPants                                                ;8FD6AD;
    dw EnemyPopulations_EastPants                                        ;8FD6AF;
    dw EnemySets_EastPants                                               ;8FD6B1;
    db $00,$C0                                                           ;8FD6B3;
    dw RoomScrolls_EastPants                                             ;8FD6B5;
    dw $0000                                                             ;8FD6B7;
    dw $0000                                                             ;8FD6B9;
    dw PLMPopulation_EastPants                                           ;8FD6BB;
    dw $0000                                                             ;8FD6BD;
    dw RTS_8FC8D2                                                        ;8FD6BF;

RoomDoors_EastPants:
    dw Door_EastPants_0                                                  ;8FD6C1;
    dw Door_EastPants_1                                                  ;8FD6C3;

RoomScrolls_EastPants:
    db $02,$00,$01                                                       ;8FD6C5;

RoomPLM_EastPants_0:
    db $01,$02,$80                                                       ;8FD6C8;

RoomPLM_EastPants_6:
    db $01,$02,$02,$01,$80                                               ;8FD6CB;

RoomHeader_Springball:
    db $26,$04,$20,$0F,$02,$02,$70,$A0,$00                               ;8FD6D0;
    dw RoomDoors_Springball                                              ;8FD6D9;
    dw Use_StatePointer_inX                                              ;8FD6DB;

RoomState_Springball:
    dl LevelData_Springball                                              ;8FD6DD;
    db $0C,$00,$00                                                       ;8FD6E0;
    dw FXHeader_Springball                                               ;8FD6E3;
    dw EnemyPopulations_Springball                                       ;8FD6E5;
    dw EnemySets_Springball                                              ;8FD6E7;
    db $C0,$00                                                           ;8FD6E9;
    dw RoomScrolls_Springball                                            ;8FD6EB;
    dw $0000                                                             ;8FD6ED;
    dw $0000                                                             ;8FD6EF;
    dw PLMPopulation_Springball                                          ;8FD6F1;
    dw $0000                                                             ;8FD6F3;
    dw RTS_8FC8D2                                                        ;8FD6F5;

RoomDoors_Springball:
    dw Door_Springball_0                                                 ;8FD6F7;

RoomScrolls_Springball:
    db $02,$00,$01,$01                                                   ;8FD6F9;

RoomHeader_BelowBotwoonETank:
    db $27,$04,$1A,$0A,$04,$01,$70,$A0,$00                               ;8FD6FD;
    dw RoomDoors_BelowBotwoonETank                                       ;8FD706;
    dw Use_StatePointer_inX                                              ;8FD708;

RoomState_BelowBotwoonETank:
    dl LevelData_BelowBotwoonETank                                       ;8FD70A;
    db $0C,$00,$00                                                       ;8FD70D;
    dw FXHeader_BelowBotwoonETank                                        ;8FD710;
    dw EnemyPopulations_BelowBotwoonETank                                ;8FD712;
    dw EnemySets_BelowBotwoonETank                                       ;8FD714;
    db $00,$00                                                           ;8FD716;
    dw RoomScrolls_BelowBotwoonETank                                     ;8FD718;
    dw $0000                                                             ;8FD71A;
    dw $0000                                                             ;8FD71C;
    dw PLMPopulation_BelowBotwoonETank                                   ;8FD71E;
    dw $0000                                                             ;8FD720;
    dw RTS_8FC8D2                                                        ;8FD722;

RoomDoors_BelowBotwoonETank:
    dw Door_BelowBotwoonETank_0                                          ;8FD724;

RoomScrolls_BelowBotwoonETank:
    db $01,$01,$01,$01                                                   ;8FD726;

RoomHeader_Colosseum:
    db $28,$04,$22,$06,$07,$02,$90,$A0,$00                               ;8FD72A;
    dw RoomDoors_Colosseum                                               ;8FD733;
    dw Use_StatePointer_inX                                              ;8FD735;

RoomState_Colosseum:
    dl LevelData_Colosseum                                               ;8FD737;
    db $0C,$00,$00                                                       ;8FD73A;
    dw FXHeader_Colosseum                                                ;8FD73D;
    dw EnemyPopulations_Colosseum                                        ;8FD73F;
    dw EnemySets_Colosseum                                               ;8FD741;
    db $00,$00                                                           ;8FD743;
    dw RoomScrolls_Colosseum                                             ;8FD745;
    dw $0000                                                             ;8FD747;
    dw $0000                                                             ;8FD749;
    dw PLMPopulation_Colosseum                                           ;8FD74B;
    dw $0000                                                             ;8FD74D;
    dw RTS_8FC8D2                                                        ;8FD74F;

RoomDoors_Colosseum:
    dw Door_Colosseum_0                                                  ;8FD751;
    dw Door_Colosseum_1                                                  ;8FD753;
    dw Door_Colosseum_2                                                  ;8FD755;

RoomScrolls_Colosseum:
    db $02,$02,$02,$02,$02,$02,$02,$01,$01,$01,$01,$01,$01,$01           ;8FD757;

RoomHeader_AqueductSave:
    db $29,$04,$13,$0B,$01,$01,$70,$A0,$00                               ;8FD765;
    dw RoomDoors_AqueductSave                                            ;8FD76E;
    dw Use_StatePointer_inX                                              ;8FD770;

RoomState_AqueductSave:
    dl LevelData_SaveStation_RightSideDoor                               ;8FD772;
    db $19,$1B,$05                                                       ;8FD775;
    dw FXHeader_AqueductSave                                             ;8FD778;
    dw EnemyPopulations_AqueductSave                                     ;8FD77A;
    dw EnemySets_AqueductSave                                            ;8FD77C;
    db $00,$00                                                           ;8FD77E;
    dw RoomScrolls_AqueductSave                                          ;8FD780;
    dw $0000                                                             ;8FD782;
    dw $0000                                                             ;8FD784;
    dw PLMPopulation_AqueductSave                                        ;8FD786;
    dw $0000                                                             ;8FD788;
    dw RTS_8FC8D2                                                        ;8FD78A;

RoomDoors_AqueductSave:
    dw Door_AqueductSave_0                                               ;8FD78C;

RoomScrolls_AqueductSave:
    db $01                                                               ;8FD78E;

RoomHeader_ThePrecious:
    db $2A,$04,$29,$07,$02,$03,$90,$A0,$00                               ;8FD78F;
    dw RoomDoors_ThePrecious                                             ;8FD798;
    dw RoomStateCheck_BossIsDead                                         ;8FD79A;
    db $01                                                               ;8FD79C;
    dw RoomState_ThePrecious_1                                           ;8FD79D;
    dw Use_StatePointer_inX                                              ;8FD79F;

RoomState_ThePrecious_0:
    dl LevelData_ThePrecious                                             ;8FD7A1; _0
    db $0C,$00,$00                                                       ;8FD7A4;
    dw FXHeader_ThePrecious_State0_1                                     ;8FD7A7;
    dw EnemyPopulations_ThePrecious                                      ;8FD7A9;
    dw EnemySets_ThePrecious                                             ;8FD7AB;
    db $00,$C0                                                           ;8FD7AD;
    dw RoomScrolls_ThePrecious                                           ;8FD7AF;
    dw $0000                                                             ;8FD7B1;
    dw $0000                                                             ;8FD7B3;
    dw PLMPopulation_ThePrecious_State0_1                                ;8FD7B5;
    dw $0000                                                             ;8FD7B7;
    dw RTS_8FC8D2                                                        ;8FD7B9;

RoomState_ThePrecious_1:
    dl LevelData_ThePrecious                                             ;8FD7BB;
    db $0C,$1B,$05                                                       ;8FD7BE;
    dw FXHeader_ThePrecious_State0_1                                     ;8FD7C1;
    dw EnemyPopulations_ThePrecious                                      ;8FD7C3;
    dw EnemySets_ThePrecious                                             ;8FD7C5;
    db $00,$C0                                                           ;8FD7C7;
    dw RoomScrolls_ThePrecious                                           ;8FD7C9;
    dw $0000                                                             ;8FD7CB;
    dw $0000                                                             ;8FD7CD;
    dw PLMPopulation_ThePrecious_State0_1                                ;8FD7CF;
    dw $0000                                                             ;8FD7D1;
    dw RTS_8FC8D2                                                        ;8FD7D3;

RoomDoors_ThePrecious:
    dw Door_ThePrecious_0                                                ;8FD7D5;
    dw Door_ThePrecious_1                                                ;8FD7D7;

RoomScrolls_ThePrecious:
    db $01,$01,$00,$00,$01,$00                                           ;8FD7D9;

RoomPLM_ThePrecious_0:
    db $00,$02,$02,$02,$80                                               ;8FD7DF;

RoomHeader_BotwoonETank:
    db $2B,$04,$1A,$08,$07,$01,$70,$A0,$00                               ;8FD7E4;
    dw RoomDoors_BotwoonETank                                            ;8FD7ED;
    dw Use_StatePointer_inX                                              ;8FD7EF;

RoomState_BotwoonETank:
    dl LevelData_BotwoonETank                                            ;8FD7F1;
    db $0C,$1B,$05                                                       ;8FD7F4;
    dw FXHeader_BotwoonETank                                             ;8FD7F7;
    dw EnemyPopulations_BotwoonETank                                     ;8FD7F9;
    dw EnemySets_BotwoonETank                                            ;8FD7FB;
    db $C0,$00                                                           ;8FD7FD;
    dw RoomScrolls_BotwoonETank                                          ;8FD7FF;
    dw $0000                                                             ;8FD801;
    dw $0000                                                             ;8FD803;
    dw PLMPopulation_BotwoonETank                                        ;8FD805;
    dw $0000                                                             ;8FD807;
    dw RTS_8FC8D2                                                        ;8FD809;

RoomDoors_BotwoonETank:
    dw Door_BotwoonETank_0                                               ;8FD80B;
    dw Door_BotwoonETank_1                                               ;8FD80D;
    dw Door_BotwoonETank_2                                               ;8FD80F;
    dw Door_BotwoonETank_3                                               ;8FD811;

RoomScrolls_BotwoonETank:
    db $02,$02,$02,$02,$02,$02,$02                                       ;8FD813;

RoomHeader_DraygonSave:
    db $2C,$04,$29,$06,$01,$01,$70,$A0,$00                               ;8FD81A;
    dw RoomDoors_DraygonSave                                             ;8FD823;
    dw Use_StatePointer_inX                                              ;8FD825;

RoomState_DraygonSave:
    dl LevelData_SaveStation_BothDoors                                   ;8FD827;
    db $19,$1B,$05                                                       ;8FD82A;
    dw FXHeader_DraygonSave                                              ;8FD82D;
    dw EnemyPopulations_DraygonSave                                      ;8FD82F;
    dw EnemySets_DraygonSave                                             ;8FD831;
    db $00,$00                                                           ;8FD833;
    dw $0000                                                             ;8FD835;
    dw $0000                                                             ;8FD837;
    dw $0000                                                             ;8FD839;
    dw PLMPopulation_DraygonSave                                         ;8FD83B;
    dw $0000                                                             ;8FD83D;
    dw RTS_8FC8D2                                                        ;8FD83F;

RoomDoors_DraygonSave:
    dw Door_DraygonSave_0                                                ;8FD841;
    dw Door_DraygonSave_1                                                ;8FD843;

RoomHeader_MaridiaMissileRefill:
    db $2D,$04,$26,$08,$01,$01,$70,$A0,$00                               ;8FD845;
    dw RoomDoors_MaridiaMissileRefill                                    ;8FD84E;
    dw Use_StatePointer_inX                                              ;8FD850;

RoomState_MaridiaMissileRefill:
    dl LevelData_MissileRefill_LeftSideDoor                              ;8FD852;
    db $17,$00,$00                                                       ;8FD855;
    dw FXHeader_MaridiaMissileRefill                                     ;8FD858;
    dw EnemyPopulations_MaridiaMissileRefill                             ;8FD85A;
    dw EnemySets_MaridiaMissileRefill                                    ;8FD85C;
    db $00,$00                                                           ;8FD85E;
    dw $0000                                                             ;8FD860;
    dw $0000                                                             ;8FD862;
    dw $0000                                                             ;8FD864;
    dw PLMPopulation_MaridiaMissileRefill                                ;8FD866;
    dw $0000                                                             ;8FD868;
    dw RTS_8FC8D2                                                        ;8FD86A;

RoomDoors_MaridiaMissileRefill:
    dw Door_MaridiaMissileRefill_0                                       ;8FD86C;

RoomHeader_PlasmaBeachQuicksand:
    db $2E,$04,$1A,$06,$01,$01,$70,$A0,$00                               ;8FD86E;
    dw RoomDoors_PlasmaBeachQuicksand                                    ;8FD877;
    dw Use_StatePointer_inX                                              ;8FD879;

RoomState_PlasmaBeachQuicksand:
    dl LevelData_PlasmaBeachQuicksand                                    ;8FD87B;
    db $0C,$00,$00                                                       ;8FD87E;
    dw FXHeader_PlasmaBeachQuicksand_BotwoonQuicksand                    ;8FD881;
    dw EnemyPopulations_PlasmaBeachQuicksand                             ;8FD883;
    dw EnemySets_PlasmaBeachQuicksand                                    ;8FD885;
    db $00,$00                                                           ;8FD887;
    dw RoomScrolls_PlasmaBeachQuicksand                                  ;8FD889;
    dw $0000                                                             ;8FD88B;
    dw $0000                                                             ;8FD88D;
    dw PLMPopulation_PlasmaBeachQuicksand                                ;8FD88F;
    dw $0000                                                             ;8FD891;
    dw RTS_8FC8D2                                                        ;8FD893;

RoomDoors_PlasmaBeachQuicksand:
    dw Door_PlasmaBeachQuicksand_0                                       ;8FD895;

RoomScrolls_PlasmaBeachQuicksand:
    db $02                                                               ;8FD897;

RoomHeader_BotwoonQuicksand:
    db $2F,$04,$1C,$09,$02,$01,$70,$A0,$00                               ;8FD898;
    dw RoomDoors_BotwoonQuicksand                                        ;8FD8A1;
    dw Use_StatePointer_inX                                              ;8FD8A3;

RoomState_BotwoonQuicksand:
    dl LevelData_BotwoonQuicksand                                        ;8FD8A5;
    db $0C,$00,$00                                                       ;8FD8A8;
    dw FXHeader_PlasmaBeachQuicksand_BotwoonQuicksand                    ;8FD8AB;
    dw EnemyPopulations_BotwoonQuicksand                                 ;8FD8AD;
    dw EnemySets_BotwoonQuicksand                                        ;8FD8AF;
    db $00,$00                                                           ;8FD8B1;
    dw RoomScrolls_BotwoonQuicksand                                      ;8FD8B3;
    dw $0000                                                             ;8FD8B5;
    dw $0000                                                             ;8FD8B7;
    dw PLMPopulation_BotwoonQuicksand                                    ;8FD8B9;
    dw $0000                                                             ;8FD8BB;
    dw RTS_8FC8D2                                                        ;8FD8BD;

RoomDoors_BotwoonQuicksand:
    dw Door_BotwoonQuicksand_0                                           ;8FD8BF;
    dw Door_BotwoonQuicksand_1                                           ;8FD8C1;

RoomScrolls_BotwoonQuicksand:
    db $02,$02                                                           ;8FD8C3;

RoomHeader_Shaktool:
    db $30,$04,$1C,$0F,$04,$01,$70,$A0,$00                               ;8FD8C5;
    dw RoomDoors_Shaktool                                                ;8FD8CE;
    dw RoomStateCheck_EventHasBeenSet                                    ;8FD8D0;
    db $0D                                                               ;8FD8D2;
    dw RoomState_Shaktool_1                                              ;8FD8D3;
    dw Use_StatePointer_inX                                              ;8FD8D5;

RoomState_Shaktool_0:
    dl LevelData_Shaktool_State0                                         ;8FD8D7;
    db $0C,$00,$00                                                       ;8FD8DA;
    dw FXHeader_Shaktool_State0_1                                        ;8FD8DD;
    dw EnemyPopulations_Shaktool                                         ;8FD8DF;
    dw EnemySets_Shaktool                                                ;8FD8E1;
    db $C0,$00                                                           ;8FD8E3;
    dw RoomScrolls_Shaktool                                              ;8FD8E5;
    dw $0000                                                             ;8FD8E7;
    dw $0000                                                             ;8FD8E9;
    dw PLMPopulation_Shaktool_State0_1                                   ;8FD8EB;
    dw $0000                                                             ;8FD8ED;
    dw SetupASM_SetupShaktoolsRoomPLM                                    ;8FD8EF;

RoomState_Shaktool_1:
    dl LevelData_Shaktool_State1                                         ;8FD8F1;
    db $0C,$00,$00                                                       ;8FD8F4;
    dw FXHeader_Shaktool_State0_1                                        ;8FD8F7;
    dw EnemyPopulations_Shaktool                                         ;8FD8F9;
    dw EnemySets_Shaktool                                                ;8FD8FB;
    db $C0,$00                                                           ;8FD8FD;
    dw RoomScrolls_Shaktool                                              ;8FD8FF;
    dw $0000                                                             ;8FD901;
    dw $0000                                                             ;8FD903;
    dw PLMPopulation_Shaktool_State0_1                                   ;8FD905;
    dw $0000                                                             ;8FD907;
    dw RTS_8FC8DC                                                        ;8FD909;

RoomDoors_Shaktool:
    dw Door_Shaktool_0                                                   ;8FD90B;
    dw Door_Shaktool_1                                                   ;8FD90D;

RoomScrolls_Shaktool:
    db $01,$01,$01,$01                                                   ;8FD90F;

RoomHeader_HalfieClimb:
    db $31,$04,$21,$06,$05,$03,$70,$A0,$00                               ;8FD913;
    dw RoomDoors_HalfieClimb                                             ;8FD91C;
    dw Use_StatePointer_inX                                              ;8FD91E;

RoomState_HalfieClimb:
    dl LevelData_HalfieClimb                                             ;8FD920;
    db $0C,$00,$00                                                       ;8FD923;
    dw FXHeader_HalfieClimb                                              ;8FD926;
    dw EnemyPopulations_HalfieClimb                                      ;8FD928;
    dw EnemySets_HalfieClimb                                             ;8FD92A;
    db $00,$00                                                           ;8FD92C;
    dw RoomScrolls_HalfieClimb                                           ;8FD92E;
    dw $0000                                                             ;8FD930;
    dw $0000                                                             ;8FD932;
    dw PLMPopulation_HalfieClimb                                         ;8FD934;
    dw $0000                                                             ;8FD936;
    dw RTS_8FC8DC                                                        ;8FD938;

RoomDoors_HalfieClimb:
    dw Door_HalfieClimb_0                                                ;8FD93A;
    dw Door_HalfieClimb_1                                                ;8FD93C;
    dw Door_HalfieClimb_2                                                ;8FD93E;
    dw Door_HalfieClimb_3                                                ;8FD940;

RoomScrolls_HalfieClimb:
    db $02,$00,$00,$00,$00,$02,$00,$00,$00,$00,$01,$00,$01,$01,$01       ;8FD942;

RoomPLM_HalfieClimb_0:
    db $05,$00,$0B,$01,$80                                               ;8FD951;

RoomPLM_HalfieClimb_1:
    db $05,$01,$0B,$00,$80                                               ;8FD956;

RoomPLM_HalfieClimb_5:
    db $0A,$01,$80                                                       ;8FD95B;

RoomHeader_Botwoon:
    db $32,$04,$18,$08,$02,$01,$70,$A0,$00                               ;8FD95E;
    dw RoomDoors_Botwoon                                                 ;8FD967;
    dw RoomStateCheck_BossIsDead                                         ;8FD969;
    db $02                                                               ;8FD96B;
    dw RoomState_Botwoon_1                                               ;8FD96C;
    dw Use_StatePointer_inX                                              ;8FD96E;

RoomState_Botwoon_0:
    dl LevelData_Botwoon                                                 ;8FD970;
    db $0C,$2A,$05                                                       ;8FD973;
    dw FXHeader_Botwoon_State0_1                                         ;8FD976;
    dw EnemyPopulations_Botwoon                                          ;8FD978;
    dw EnemySets_Botwoon                                                 ;8FD97A;
    db $00,$00                                                           ;8FD97C;
    dw RoomScrolls_Botwoon                                               ;8FD97E;
    dw $0000                                                             ;8FD980;
    dw $0000                                                             ;8FD982;
    dw PLMPopulation_Botwoon_State0_1                                    ;8FD984;
    dw $0000                                                             ;8FD986;
    dw RTS_8FC8DC                                                        ;8FD988;

RoomState_Botwoon_1:
    dl LevelData_Botwoon                                                 ;8FD98A;
    db $0C,$00,$03                                                       ;8FD98D;
    dw FXHeader_Botwoon_State0_1                                         ;8FD990;
    dw EnemyPopulations_Botwoon                                          ;8FD992;
    dw EnemySets_Botwoon                                                 ;8FD994;
    db $00,$00                                                           ;8FD996;
    dw RoomScrolls_Botwoon                                               ;8FD998;
    dw $0000                                                             ;8FD99A;
    dw $0000                                                             ;8FD99C;
    dw PLMPopulation_Botwoon_State0_1                                    ;8FD99E;
    dw $0000                                                             ;8FD9A0;
    dw RTS_8FC8DC                                                        ;8FD9A2;

RoomDoors_Botwoon:
    dw Door_Botwoon_0                                                    ;8FD9A4;
    dw Door_Botwoon_1                                                    ;8FD9A6;

RoomScrolls_Botwoon:
    db $01,$00                                                           ;8FD9A8;

RoomHeader_SpaceJump:
    db $33,$04,$26,$0A,$01,$01,$70,$A0,$00                               ;8FD9AA;
    dw RoomDoors_SpaceJump                                               ;8FD9B3;
    dw Use_StatePointer_inX                                              ;8FD9B5;

RoomState_SpaceJump:
    dl LevelData_SpaceJump                                               ;8FD9B7;
    db $0C,$00,$03                                                       ;8FD9BA;
    dw FXHeader_SpaceJump                                                ;8FD9BD;
    dw EnemyPopulations_SpaceJump                                        ;8FD9BF;
    dw EnemySets_SpaceJump                                               ;8FD9C1;
    db $00,$00                                                           ;8FD9C3;
    dw RoomScrolls_SpaceJump                                             ;8FD9C5;
    dw $0000                                                             ;8FD9C7;
    dw $0000                                                             ;8FD9C9;
    dw PLMPopulation_SpaceJump                                           ;8FD9CB;
    dw $0000                                                             ;8FD9CD;
    dw RTS_8FC8DC                                                        ;8FD9CF;

RoomDoors_SpaceJump:
    dw Door_SpaceJump_0                                                  ;8FD9D1;

RoomScrolls_SpaceJump:
    db $01                                                               ;8FD9D3;

RoomHeader_MaridiaEnergyRefill:
    db $34,$04,$2A,$06,$01,$01,$70,$A0,$00                               ;8FD9D4;
    dw RoomDoors_MaridiaEnergyRefill                                     ;8FD9DD;
    dw Use_StatePointer_inX                                              ;8FD9DF;

RoomState_MaridiaEnergyRefill:
    dl LevelData_EnergyRefill_LeftSideDoor                               ;8FD9E1;
    db $17,$00,$00                                                       ;8FD9E4;
    dw FXHeader_MaridiaEnergyRefill                                      ;8FD9E7;
    dw EnemyPopulations_MaridiaEnergyRefill                              ;8FD9E9;
    dw EnemySets_MaridiaEnergyRefill                                     ;8FD9EB;
    db $00,$00                                                           ;8FD9ED;
    dw RoomScrolls_MaridiaEnergyRefill                                   ;8FD9EF;
    dw $0000                                                             ;8FD9F1;
    dw $0000                                                             ;8FD9F3;
    dw PLMPopulation_MaridiaEnergyRefill                                 ;8FD9F5;
    dw $0000                                                             ;8FD9F7;
    dw $0000                                                             ;8FD9F9;

RoomDoors_MaridiaEnergyRefill:
    dw Door_MaridiaEnergyRefill_0                                        ;8FD9FB;

RoomScrolls_MaridiaEnergyRefill:
    db $01                                                               ;8FD9FD;

RoomHeader_WestCactusAlley:
    db $35,$04,$1B,$06,$01,$02,$70,$A0,$00                               ;8FD9FE;
    dw RoomDoors_WestCactusAlley                                         ;8FDA07;
    dw Use_StatePointer_inX                                              ;8FDA09;

RoomState_WestCactusAlley:
    dl LevelData_WestCactusAlley                                         ;8FDA0B;
    db $0C,$00,$00                                                       ;8FDA0E;
    dw FXHeader_WestCactusAlley                                          ;8FDA11;
    dw EnemyPopulations_WestCactusAlley                                  ;8FDA13;
    dw EnemySets_WestCactusAlley                                         ;8FDA15;
    db $00,$C0                                                           ;8FDA17;
    dw RoomScrolls_WestCactusAlley                                       ;8FDA19;
    dw $0000                                                             ;8FDA1B;
    dw $0000                                                             ;8FDA1D;
    dw PLMPopulation_WestCactusAlley                                     ;8FDA1F;
    dw $0000                                                             ;8FDA21;
    dw $0000                                                             ;8FDA23;

RoomDoors_WestCactusAlley:
    dw Door_WestCactusAlley_0                                            ;8FDA25;
    dw Door_WestCactusAlley_1                                            ;8FDA27;

RoomScrolls_WestCactusAlley:
    db $02,$01                                                           ;8FDA29;

RoomHeader_EastCactusAlley:
    db $36,$04,$1C,$06,$05,$02,$70,$A0,$00                               ;8FDA2B;
    dw RoomDoors_EastCactusAlley                                         ;8FDA34;
    dw Use_StatePointer_inX                                              ;8FDA36;

RoomState_EastCactusAlley:
    dl LevelData_EastCactusAlley                                         ;8FDA38;
    db $0C,$00,$00                                                       ;8FDA3B;
    dw FXHeader_EastCactusAlley                                          ;8FDA3E;
    dw EnemyPopulations_EastCactusAlley                                  ;8FDA40;
    dw EnemySets_EastCactusAlley                                         ;8FDA42;
    db $00,$00                                                           ;8FDA44;
    dw RoomScrolls_EastCactusAlley                                       ;8FDA46;
    dw $0000                                                             ;8FDA48;
    dw $0000                                                             ;8FDA4A;
    dw PLMPopulation_EastCactusAlley                                     ;8FDA4C;
    dw $0000                                                             ;8FDA4E;
    dw $0000                                                             ;8FDA50;

RoomDoors_EastCactusAlley:
    dw Door_EastCactusAlley_0                                            ;8FDA52;
    dw Door_EastCactusAlley_1                                            ;8FDA54;

RoomScrolls_EastCactusAlley:
    db $02,$02,$02,$02,$02,$01,$01,$01,$01,$01                           ;8FDA56;

RoomHeader_Draygon:
    db $37,$04,$27,$09,$02,$02,$70,$A0,$01                               ;8FDA60;
    dw RoomDoors_Draygon                                                 ;8FDA69;
    dw RoomStateCheck_BossIsDead                                         ;8FDA6B;
    db $01                                                               ;8FDA6D;
    dw RoomState_Draygon_1                                               ;8FDA6E;
    dw Use_StatePointer_inX                                              ;8FDA70;

RoomState_Draygon_0:
    dl LevelData_Draygon                                                 ;8FDA72;
    db $1C,$24,$05                                                       ;8FDA75;
    dw FXHeader_Draygon_State0_1                                         ;8FDA78;
    dw EnemyPopulations_Draygon_0                                        ;8FDA7A;
    dw EnemySets_Draygon_0                                               ;8FDA7C;
    db $01,$01                                                           ;8FDA7E;
    dw RoomScrolls_Draygon                                               ;8FDA80;
    dw $0000                                                             ;8FDA82;
    dw $0000                                                             ;8FDA84;
    dw PLMPopulation_Draygon_State0_1                                    ;8FDA86;
    dw LibBG_Draygon_State0                                              ;8FDA88;
    dw SetupASM_SetPausingCodeForDraygon                                 ;8FDA8A;

RoomState_Draygon_1:
    dl LevelData_Draygon                                                 ;8FDA8C;
    db $1C,$00,$03                                                       ;8FDA8F;
    dw FXHeader_Draygon_State0_1                                         ;8FDA92;
    dw EnemyPopulations_Draygon_State1_MotherBrain_State2                ;8FDA94;
    dw EnemySets_Draygon_1_MotherBrain_2                                 ;8FDA96;
    db $01,$01                                                           ;8FDA98;
    dw RoomScrolls_Draygon                                               ;8FDA9A;
    dw $0000                                                             ;8FDA9C;
    dw $0000                                                             ;8FDA9E;
    dw PLMPopulation_Draygon_State0_1                                    ;8FDAA0;
    dw LibBG_Phantoon_Draygon_State1                                     ;8FDAA2;
    dw SetupASM_SetPausingCodeForDraygon                                 ;8FDAA4;

RoomDoors_Draygon:
    dw Door_Draygon_0                                                    ;8FDAA6;
    dw Door_Draygon_1                                                    ;8FDAA8;

RoomScrolls_Draygon:
    db $02,$02,$01,$01                                                   ;8FDAAA;

RoomHeader_TourianFirst:
    db $00,$05,$14,$09,$01,$04,$70,$A0,$00                               ;8FDAAE;
    dw RoomDoors_TourianFirst                                            ;8FDAB7;
    dw Use_StatePointer_inX                                              ;8FDAB9;

RoomState_TourianFirst:
    dl LevelData_TourianFirst                                            ;8FDABB;
    db $0D,$1E,$05                                                       ;8FDABE;
    dw FXHeader_TourianFirst                                             ;8FDAC1;
    dw EnemyPopulations_TourianFirst                                     ;8FDAC3;
    dw EnemySets_TourianFirst                                            ;8FDAC5;
    db $01,$C1                                                           ;8FDAC7;
    dw RoomScrolls_TourianFirst                                          ;8FDAC9;
    dw $0000                                                             ;8FDACB;
    dw $0000                                                             ;8FDACD;
    dw PLMPopulation_TourianFirst                                        ;8FDACF;
    dw LibBG_Tourian_D_MechanicalRoom                                    ;8FDAD1;
    dw SetupASM_SetCollectedMap                                          ;8FDAD3;

RoomDoors_TourianFirst:
    dw Door_TourianFirst_0                                               ;8FDAD5;
    dw Door_TourianFirst_1                                               ;8FDAD7;
    dw Door_MaridiaElev_3_TourianFirst_2                                 ;8FDAD9;
    dw Door_TourianFirst_3                                               ;8FDADB;

RoomScrolls_TourianFirst:
    db $02,$02,$02,$01                                                   ;8FDADD;

RoomHeader_Metroids1:
    db $01,$05,$0E,$0C,$06,$01,$70,$A0,$00                               ;8FDAE1;
    dw RoomDoors_Metroids1                                               ;8FDAEA;
    dw RoomStateCheck_EventHasBeenSet                                    ;8FDAEC;
    db $10                                                               ;8FDAEE;
    dw RoomState_Metroids1_1                                             ;8FDAEF;
    dw Use_StatePointer_inX                                              ;8FDAF1;

RoomState_Metroids1_0:
    dl LevelData_Metroids1                                               ;8FDAF3;
    db $0D,$00,$00                                                       ;8FDAF6;
    dw FXHeader_Metroids1_State0_1                                       ;8FDAF9;
    dw EnemyPopulations_Metroids1_0                                      ;8FDAFB;
    dw EnemySets_Metroids1_0                                             ;8FDAFD;
    db $C1,$C1                                                           ;8FDAFF;
    dw RoomScrolls_Metroids1                                             ;8FDB01;
    dw $0000                                                             ;8FDB03;
    dw $0000                                                             ;8FDB05;
    dw PLMPopulation_Metroids1_State0_1                                  ;8FDB07;
    dw LibBG_Tourian_D_MechanicalRoom_Letterbox                          ;8FDB09;
    dw RTS_8FC91E                                                        ;8FDB0B;

RoomState_Metroids1_1:
    dl LevelData_Metroids1                                               ;8FDB0D;
    db $0D,$00,$00                                                       ;8FDB10;
    dw FXHeader_Metroids1_State0_1                                       ;8FDB13;
    dw EnemyPopulations_Metroids1_1                                      ;8FDB15;
    dw EnemySets_Metroids1_1                                             ;8FDB17;
    db $C1,$C1                                                           ;8FDB19;
    dw RoomScrolls_Metroids1                                             ;8FDB1B;
    dw $0000                                                             ;8FDB1D;
    dw $0000                                                             ;8FDB1F;
    dw PLMPopulation_Metroids1_State0_1                                  ;8FDB21;
    dw LibBG_Tourian_D_MechanicalRoom_Letterbox                          ;8FDB23;
    dw RTS_8FC91E                                                        ;8FDB25;

RoomDoors_Metroids1:
    dw Door_Metroids1_0                                                  ;8FDB27;
    dw Door_Metroids1_1                                                  ;8FDB29;

RoomScrolls_Metroids1:
    db $01,$01,$01,$01,$01,$01                                           ;8FDB2B;

RoomHeader_Metroids2:
    db $02,$05,$0D,$0C,$01,$02,$70,$A0,$00                               ;8FDB31;
    dw RoomDoors_Metroids2                                               ;8FDB3A;
    dw RoomStateCheck_EventHasBeenSet                                    ;8FDB3C;
    db $11                                                               ;8FDB3E;
    dw RoomState_Metroids2_1                                             ;8FDB3F;
    dw Use_StatePointer_inX                                              ;8FDB41;

RoomState_Metroids2_0:
    dl LevelData_Metroids2                                               ;8FDB43;
    db $0D,$00,$00                                                       ;8FDB46;
    dw FXHeader_Metroids2_State0_1                                       ;8FDB49;
    dw EnemyPopulations_Metroids2_0                                      ;8FDB4B;
    dw EnemySets_Metroids2_0                                             ;8FDB4D;
    db $C1,$C1                                                           ;8FDB4F;
    dw RoomScrolls_Metroids2                                             ;8FDB51;
    dw $0000                                                             ;8FDB53;
    dw $0000                                                             ;8FDB55;
    dw PLMPopulation_Metroids2_State0_1                                  ;8FDB57;
    dw LibBG_Tourian_D_MechanicalRoom                                    ;8FDB59;
    dw RTS_8FC91E                                                        ;8FDB5B;

RoomState_Metroids2_1:
    dl LevelData_Metroids2                                               ;8FDB5D;
    db $0D,$00,$00                                                       ;8FDB60;
    dw FXHeader_Metroids2_State0_1                                       ;8FDB63;
    dw EnemyPopulations_Metroids2_1                                      ;8FDB65;
    dw EnemySets_Metroids2_1                                             ;8FDB67;
    db $C1,$C1                                                           ;8FDB69;
    dw RoomScrolls_Metroids2                                             ;8FDB6B;
    dw $0000                                                             ;8FDB6D;
    dw $0000                                                             ;8FDB6F;
    dw PLMPopulation_Metroids2_State0_1                                  ;8FDB71;
    dw LibBG_Tourian_D_MechanicalRoom                                    ;8FDB73;
    dw RTS_8FC91E                                                        ;8FDB75;

RoomDoors_Metroids2:
    dw Door_Metroids2_0                                                  ;8FDB77;
    dw Door_Metroids2_1                                                  ;8FDB79;

RoomScrolls_Metroids2:
    db $02,$02                                                           ;8FDB7B;

RoomHeader_Metroids3:
    db $03,$05,$0E,$0D,$06,$01,$70,$A0,$00                               ;8FDB7D;
    dw RoomDoors_Metroids3                                               ;8FDB86;
    dw RoomStateCheck_EventHasBeenSet                                    ;8FDB88;
    db $12                                                               ;8FDB8A;
    dw RoomState_Metroids3_1                                             ;8FDB8B;
    dw Use_StatePointer_inX                                              ;8FDB8D;

RoomState_Metroids3_0:
    dl LevelData_Metroids3                                               ;8FDB8F;
    db $0D,$00,$00                                                       ;8FDB92;
    dw FXHeader_Metroids3_State0_1                                       ;8FDB95;
    dw EnemyPopulations_Metroids3_0                                      ;8FDB97;
    dw EnemySets_Metroids3_0                                             ;8FDB99;
    db $C1,$C1                                                           ;8FDB9B;
    dw RoomScrolls_Metroids3                                             ;8FDB9D;
    dw $0000                                                             ;8FDB9F;
    dw $0000                                                             ;8FDBA1;
    dw PLMPopulation_Metroids3_State0_1                                  ;8FDBA3;
    dw LibBG_Tourian_D_MechanicalRoom_Letterbox                          ;8FDBA5;
    dw RTS_8FC91E                                                        ;8FDBA7;

RoomState_Metroids3_1:
    dl LevelData_Metroids3                                               ;8FDBA9;
    db $0D,$00,$00                                                       ;8FDBAC;
    dw FXHeader_Metroids3_State0_1                                       ;8FDBAF;
    dw EnemyPopulations_Metroids3_1                                      ;8FDBB1;
    dw EnemySets_Metroids3_1                                             ;8FDBB3;
    db $C1,$C1                                                           ;8FDBB5;
    dw RoomScrolls_Metroids3                                             ;8FDBB7;
    dw $0000                                                             ;8FDBB9;
    dw $0000                                                             ;8FDBBB;
    dw PLMPopulation_Metroids3_State0_1                                  ;8FDBBD;
    dw LibBG_Tourian_D_MechanicalRoom_Letterbox                          ;8FDBBF;
    dw RTS_8FC91E                                                        ;8FDBC1;

RoomDoors_Metroids3:
    dw Door_Metroids3_0                                                  ;8FDBC3;
    dw Door_Metroids3_1                                                  ;8FDBC5;

RoomScrolls_Metroids3:
    db $01,$01,$01,$01,$01,$01                                           ;8FDBC7;

RoomHeader_Metroids4:
    db $04,$05,$14,$0D,$01,$02,$70,$A0,$00                               ;8FDBCD;
    dw RoomDoors_Metroids4                                               ;8FDBD6;
    dw RoomStateCheck_EventHasBeenSet                                    ;8FDBD8;
    db $13                                                               ;8FDBDA;
    dw RoomState_Metroids4_1                                             ;8FDBDB;
    dw Use_StatePointer_inX                                              ;8FDBDD;

RoomState_Metroids4_0:
    dl LevelData_Metroids4                                               ;8FDBDF;
    db $0D,$1E,$05                                                       ;8FDBE2;
    dw FXHeader_Metroids4_State0_1                                       ;8FDBE5;
    dw EnemyPopulations_Metroids4_0                                      ;8FDBE7;
    dw EnemySets_Metroids4_0                                             ;8FDBE9;
    db $C1,$C1                                                           ;8FDBEB;
    dw RoomScrolls_Metroids4                                             ;8FDBED;
    dw $0000                                                             ;8FDBEF;
    dw $0000                                                             ;8FDBF1;
    dw PLMPopulation_Metroids4_State0_1                                  ;8FDBF3;
    dw LibBG_Tourian_D_MechanicalRoom                                    ;8FDBF5;
    dw RTS_8FC91E                                                        ;8FDBF7;

RoomState_Metroids4_1:
    dl LevelData_Metroids4                                               ;8FDBF9;
    db $0D,$1E,$05                                                       ;8FDBFC;
    dw FXHeader_Metroids4_State0_1                                       ;8FDBFF;
    dw EnemyPopulations_Metroids4_1                                      ;8FDC01;
    dw EnemySets_Metroids4_1                                             ;8FDC03;
    db $C1,$C1                                                           ;8FDC05;
    dw RoomScrolls_Metroids4                                             ;8FDC07;
    dw $0000                                                             ;8FDC09;
    dw $0000                                                             ;8FDC0B;
    dw PLMPopulation_Metroids4_State0_1                                  ;8FDC0D;
    dw LibBG_Tourian_D_MechanicalRoom                                    ;8FDC0F;
    dw RTS_8FC91E                                                        ;8FDC11;

RoomDoors_Metroids4:
    dw Door_Metroids4_0                                                  ;8FDC13;
    dw Door_Metroids4_1                                                  ;8FDC15;

RoomScrolls_Metroids4:
    db $02,$02                                                           ;8FDC17;

RoomHeader_BlueHopper:
    db $05,$05,$13,$0F,$02,$01,$70,$A0,$00                               ;8FDC19;
    dw RoomDoors_BlueHopper                                              ;8FDC22;
    dw RoomStateCheck_EventHasBeenSet                                    ;8FDC24;
    db $14                                                               ;8FDC26;
    dw RoomState_BlueHopper_1                                            ;8FDC27;
    dw Use_StatePointer_inX                                              ;8FDC29;

RoomState_BlueHopper_0:
    dl LevelData_BlueHopper                                              ;8FDC2B;
    db $0D,$45,$06                                                       ;8FDC2E;
    dw FXHeader_BlueHopper_State0_1                                      ;8FDC31;
    dw EnemyPopulations_BlueHopper                                       ;8FDC33;
    dw EnemySets_BlueHopper                                              ;8FDC35;
    db $C1,$C1                                                           ;8FDC37;
    dw RoomScrolls_BlueHopper                                            ;8FDC39;
    dw $0000                                                             ;8FDC3B;
    dw $0000                                                             ;8FDC3D;
    dw PLMPopulation_BlueHopper_State0_1                                 ;8FDC3F;
    dw LibBG_Tourian_D_VerticalStructures                                ;8FDC41;
    dw RTS_8FC91E                                                        ;8FDC43;

RoomState_BlueHopper_1:
    dl LevelData_BlueHopper                                              ;8FDC45;
    db $0D,$00,$00                                                       ;8FDC48;
    dw FXHeader_BlueHopper_State0_1                                      ;8FDC4B;
    dw EnemyPopulations_BlueHopper                                       ;8FDC4D;
    dw EnemySets_BlueHopper                                              ;8FDC4F;
    db $C1,$C1                                                           ;8FDC51;
    dw RoomScrolls_BlueHopper                                            ;8FDC53;
    dw $0000                                                             ;8FDC55;
    dw $0000                                                             ;8FDC57;
    dw PLMPopulation_BlueHopper_State0_1                                 ;8FDC59;
    dw LibBG_Tourian_D_VerticalStructures                                ;8FDC5B;
    dw RTS_8FC91E                                                        ;8FDC5D;

RoomDoors_BlueHopper:
    dw Door_BlueHopper_0                                                 ;8FDC5F;
    dw Door_BlueHopper_1                                                 ;8FDC61;

RoomScrolls_BlueHopper:
    db $01,$01                                                           ;8FDC63;

RoomHeader_DustTorizo:
    db $06,$05,$11,$0F,$02,$01,$70,$A0,$00                               ;8FDC65;
    dw RoomDoors_DustTorizo                                              ;8FDC6E;
    dw RoomStateCheck_EventHasBeenSet                                    ;8FDC70;
    db $14                                                               ;8FDC72;
    dw RoomState_DustTorizo_1                                            ;8FDC73;
    dw Use_StatePointer_inX                                              ;8FDC75;

RoomState_DustTorizo_0:
    dl LevelData_DustTorizo                                              ;8FDC77;
    db $0D,$45,$06                                                       ;8FDC7A;
    dw FXHeader_DustTorizo_State0_1                                      ;8FDC7D;
    dw EnemyPopulations_DustTorizo                                       ;8FDC7F;
    dw EnemySets_DustTorizo                                              ;8FDC81;
    db $C1,$C1                                                           ;8FDC83;
    dw RoomScrolls_DustTorizo                                            ;8FDC85;
    dw $0000                                                             ;8FDC87;
    dw $0000                                                             ;8FDC89;
    dw PLMPopulation_DustTorizo_State0_1                                 ;8FDC8B;
    dw LibBG_Tourian_D_VerticalStructures                                ;8FDC8D;
    dw RTS_8FC91E                                                        ;8FDC8F;

RoomState_DustTorizo_1:
    dl LevelData_DustTorizo                                              ;8FDC91;
    db $0D,$1E,$05                                                       ;8FDC94;
    dw FXHeader_DustTorizo_State0_1                                      ;8FDC97;
    dw EnemyPopulations_DustTorizo                                       ;8FDC99;
    dw EnemySets_DustTorizo                                              ;8FDC9B;
    db $C1,$C1                                                           ;8FDC9D;
    dw RoomScrolls_DustTorizo                                            ;8FDC9F;
    dw $0000                                                             ;8FDCA1;
    dw $0000                                                             ;8FDCA3;
    dw PLMPopulation_DustTorizo_State0_1                                 ;8FDCA5;
    dw LibBG_Tourian_D_VerticalStructures                                ;8FDCA7;
    dw RTS_8FC91E                                                        ;8FDCA9;

RoomDoors_DustTorizo:
    dw Door_DustTorizo_0                                                 ;8FDCAB;
    dw Door_DustTorizo_1                                                 ;8FDCAD;

RoomScrolls_DustTorizo:
    db $01,$01                                                           ;8FDCAF;

RoomHeader_BigBoy:
    db $07,$05,$0D,$0F,$04,$01,$70,$A0,$00                               ;8FDCB1;
    dw RoomDoors_BigBoy                                                  ;8FDCBA;
    dw RoomStateCheck_EventHasBeenSet                                    ;8FDCBC;
    db $14                                                               ;8FDCBE;
    dw RoomState_BigBoy_1                                                ;8FDCBF;
    dw Use_StatePointer_inX                                              ;8FDCC1;

RoomState_BigBoy_0:
    dl LevelData_BigBoy                                                  ;8FDCC3;
    db $0D,$00,$00                                                       ;8FDCC6;
    dw FXHeader_BigBoy_State0_1                                          ;8FDCC9;
    dw EnemyPopulations_BigBoy                                           ;8FDCCB;
    dw EnemySets_BigBoy                                                  ;8FDCCD;
    db $C1,$C1                                                           ;8FDCCF;
    dw RoomScrolls_BigBoy                                                ;8FDCD1;
    dw $0000                                                             ;8FDCD3;
    dw $0000                                                             ;8FDCD5;
    dw PLMPopulation_BigBoy_State0_1                                     ;8FDCD7;
    dw LibBG_Tourian_D_VerticalStructures                                ;8FDCD9;
    dw RTS_8FC91E                                                        ;8FDCDB;

RoomState_BigBoy_1:
    dl LevelData_BigBoy                                                  ;8FDCDD;
    db $0D,$00,$00                                                       ;8FDCE0;
    dw FXHeader_BigBoy_State0_1                                          ;8FDCE3;
    dw EnemyPopulations_BigBoy                                           ;8FDCE5;
    dw EnemySets_BigBoy                                                  ;8FDCE7;
    db $C1,$C1                                                           ;8FDCE9;
    dw RoomScrolls_BigBoy                                                ;8FDCEB;
    dw $0000                                                             ;8FDCED;
    dw $0000                                                             ;8FDCEF;
    dw PLMPopulation_BigBoy_State0_1                                     ;8FDCF1;
    dw LibBG_Tourian_D_VerticalStructures                                ;8FDCF3;
    dw RTS_8FC91E                                                        ;8FDCF5;

RoomDoors_BigBoy:
    dw Door_BigBoy_0                                                     ;8FDCF7;
    dw Door_BigBoy_1                                                     ;8FDCF9;

RoomScrolls_BigBoy:
    db $01,$01,$01,$01                                                   ;8FDCFB;

RoomHeader_Seaweed:
    db $08,$05,$0C,$0F,$01,$02,$70,$A0,$00                               ;8FDCFF;
    dw RoomDoors_Seaweed                                                 ;8FDD08;
    dw Use_StatePointer_inX                                              ;8FDD0A;

RoomState_Seaweed:
    dl LevelData_Seaweed                                                 ;8FDD0C;
    db $0D,$1E,$05                                                       ;8FDD0F;
    dw FXHeader_Seaweed                                                  ;8FDD12;
    dw EnemyPopulations_Seaweed                                          ;8FDD14;
    dw EnemySets_Seaweed                                                 ;8FDD16;
    db $C1,$C1                                                           ;8FDD18;
    dw RoomScrolls_Seaweed                                               ;8FDD1A;
    dw $0000                                                             ;8FDD1C;
    dw $0000                                                             ;8FDD1E;
    dw PLMPopulation_Seaweed                                             ;8FDD20;
    dw LibBG_Tourian_D_VerticalStructures                                ;8FDD22;
    dw RTS_8FC91E                                                        ;8FDD24;

RoomDoors_Seaweed:
    dw Door_Seaweed_0                                                    ;8FDD26;
    dw Door_Seaweed_1                                                    ;8FDD28;
    dw Door_Seaweed_2                                                    ;8FDD2A;

RoomScrolls_Seaweed:
    db $02,$02                                                           ;8FDD2C;

RoomHeader_TourianRecharge:
    db $09,$05,$0B,$10,$01,$01,$70,$A0,$00                               ;8FDD2E;
    dw RoomDoors_TourianRecharge                                         ;8FDD37;
    dw Use_StatePointer_inX                                              ;8FDD39;

RoomState_TourianRecharge:
    dl LevelData_RefillStation_RightSideDoor                             ;8FDD3B;
    db $18,$00,$00                                                       ;8FDD3E;
    dw FXHeader_TourianRecharge                                          ;8FDD41;
    dw EnemyPopulations_TourianRecharge                                  ;8FDD43;
    dw EnemySets_TourianRecharge                                         ;8FDD45;
    db $00,$00                                                           ;8FDD47;
    dw RoomScrolls_TourianRecharge                                       ;8FDD49;
    dw $0000                                                             ;8FDD4B;
    dw $0000                                                             ;8FDD4D;
    dw PLMPopulation_TourianRecharge                                     ;8FDD4F;
    dw $0000                                                             ;8FDD51;
    dw RTS_8FC91E                                                        ;8FDD53;

RoomDoors_TourianRecharge:
    dw Door_TourianRecharge_0                                            ;8FDD55;

RoomScrolls_TourianRecharge:
    db $01                                                               ;8FDD57;

RoomHeader_MotherBrain:
    db $0A,$05,$0D,$12,$04,$01,$70,$A0,$00                               ;8FDD58;
    dw RoomDoors_MotherBrain                                             ;8FDD61;
    dw RoomStateCheck_MainAreaBossIsDead                                 ;8FDD63;
    dw RoomState_MotherBrain_2                                           ;8FDD65;
    dw RoomStateCheck_EventHasBeenSet                                    ;8FDD67;
    db $02                                                               ;8FDD69;
    dw RoomState_MotherBrain_1                                           ;8FDD6A;
    dw Use_StatePointer_inX                                              ;8FDD6C;

RoomState_MotherBrain_0:
    dl LevelData_MotherBrain                                             ;8FDD6E;
    db $0E,$00,$00                                                       ;8FDD71;
    dw FXHeader_MotherBrain_State0_1                                     ;8FDD74;
    dw EnemyPopulations_MotherBrain_0_1                                  ;8FDD76;
    dw EnemySets_MotherBrain_0_1                                         ;8FDD78;
    db $C1,$C1                                                           ;8FDD7A;
    dw RoomScrolls_MotherBrain                                           ;8FDD7C;
    dw $0000                                                             ;8FDD7E;
    dw $0000                                                             ;8FDD80;
    dw PLMPopulation_MotherBrain_State0_1_2                              ;8FDD82;
    dw LibBG_Tourian_E_PipeRoom_Dark                                     ;8FDD84;
    dw RTS_8FC91E                                                        ;8FDD86;

RoomState_MotherBrain_1:
    dl LevelData_MotherBrain                                             ;8FDD88;
    db $0E,$00,$00                                                       ;8FDD8B;
    dw FXHeader_MotherBrain_State0_1                                     ;8FDD8E;
    dw EnemyPopulations_MotherBrain_0_1                                  ;8FDD90;
    dw EnemySets_MotherBrain_0_1                                         ;8FDD92;
    db $C1,$C1                                                           ;8FDD94;
    dw RoomScrolls_MotherBrain                                           ;8FDD96;
    dw $0000                                                             ;8FDD98;
    dw $0000                                                             ;8FDD9A;
    dw PLMPopulation_MotherBrain_State0_1_2                              ;8FDD9C;
    dw LibBG_Tourian_E_PipeRoom_Dark                                     ;8FDD9E;
    dw RTS_8FC91E                                                        ;8FDDA0;

RoomState_MotherBrain_2:
    dl LevelData_MotherBrain                                             ;8FDDA2;
    db $0E,$00,$03                                                       ;8FDDA5;
    dw FXHeader_Debug_MotherBrain_State2                                 ;8FDDA8;
    dw EnemyPopulations_Draygon_State1_MotherBrain_State2                ;8FDDAA;
    dw EnemySets_Draygon_1_MotherBrain_2                                 ;8FDDAC;
    db $C1,$C1                                                           ;8FDDAE;
    dw RoomScrolls_MotherBrain                                           ;8FDDB0;
    dw $0000                                                             ;8FDDB2;
    dw $0000                                                             ;8FDDB4;
    dw PLMPopulation_MotherBrain_State0_1_2                              ;8FDDB6;
    dw LibBG_Tourian_E_PipeRoom_Dark                                     ;8FDDB8;
    dw RTS_8FC91E                                                        ;8FDDBA;

RoomDoors_MotherBrain:
    dw Door_MotherBrain_0                                                ;8FDDBC;
    dw Door_MotherBrain_1                                                ;8FDDBE;

RoomScrolls_MotherBrain:
    db $01,$01,$01,$01                                                   ;8FDDC0;

RoomHeader_TourianEyeDoor:
    db $0B,$05,$0D,$10,$04,$01,$70,$A0,$00                               ;8FDDC4;
    dw RoomDoors_TourianEyeDoor                                          ;8FDDCD;
    dw Use_StatePointer_inX                                              ;8FDDCF;

RoomState_TourianEyeDoor:
    dl LevelData_TourianEyeDoor                                          ;8FDDD1;
    db $0D,$00,$00                                                       ;8FDDD4;
    dw FXHeader_TourianEyeDoor                                           ;8FDDD7;
    dw EnemyPopulations_TourianEyeDoor                                   ;8FDDD9;
    dw EnemySets_TourianEyeDoor                                          ;8FDDDB;
    db $C1,$C1                                                           ;8FDDDD;
    dw RoomScrolls_TourianEyeDoor                                        ;8FDDDF;
    dw $0000                                                             ;8FDDE1;
    dw $0000                                                             ;8FDDE3;
    dw PLMPopulation_TourianEyeDoor                                      ;8FDDE5;
    dw LibBG_Tourian_D_VerticalStructures                                ;8FDDE7;
    dw RTS_8FC91E                                                        ;8FDDE9;

RoomDoors_TourianEyeDoor:
    dw Door_TourianEyeDoor_0                                             ;8FDDEB;
    dw Door_TourianEyeDoor_1                                             ;8FDDED;

RoomScrolls_TourianEyeDoor:
    db $01,$01,$01,$01                                                   ;8FDDEF;

RoomHeader_RinkaShaft:
    db $0C,$05,$11,$10,$01,$03,$70,$A0,$00                               ;8FDDF3;
    dw RoomDoors_RinkaShaft                                              ;8FDDFC;
    dw Use_StatePointer_inX                                              ;8FDDFE;

RoomState_RinkaShaft:
    dl LevelData_RinkaShaft                                              ;8FDE00;
    db $0D,$1E,$05                                                       ;8FDE03;
    dw FXHeader_RinkaShaft                                               ;8FDE06;
    dw EnemyPopulations_RinkaShaft                                       ;8FDE08;
    dw EnemySets_RinkaShaft                                              ;8FDE0A;
    db $C1,$C1                                                           ;8FDE0C;
    dw RoomScrolls_RinkaShaft                                            ;8FDE0E;
    dw $0000                                                             ;8FDE10;
    dw $0000                                                             ;8FDE12;
    dw PLMPopulation_RinkaShaft                                          ;8FDE14;
    dw LibBG_Tourian_D_PipeRoom_VerticalSeparation                       ;8FDE16;
    dw RTS_8FC91E                                                        ;8FDE18;

RoomDoors_RinkaShaft:
    dw Door_RinkaShaft_0                                                 ;8FDE1A;
    dw Door_RinkaShaft_1                                                 ;8FDE1C;
    dw Door_RinkaShaft_2                                                 ;8FDE1E;

RoomScrolls_RinkaShaft:
    db $02,$02,$02                                                       ;8FDE20;

RoomHeader_MotherBrainSave:
    db $0D,$05,$10,$11,$01,$01,$70,$A0,$00                               ;8FDE23;
    dw RoomDoors_MotherBrainSave                                         ;8FDE2C;
    dw Use_StatePointer_inX                                              ;8FDE2E;

RoomState_MotherBrainSave:
    dl LevelData_SaveStation_RightSideDoor                               ;8FDE30;
    db $19,$1E,$05                                                       ;8FDE33;
    dw FXHeader_MotherBrainSave                                          ;8FDE36;
    dw EnemyPopulations_MotherBrainSave                                  ;8FDE38;
    dw EnemySets_MotherBrainSave                                         ;8FDE3A;
    db $00,$00                                                           ;8FDE3C;
    dw RoomScrolls_MotherBrainSave                                       ;8FDE3E;
    dw $0000                                                             ;8FDE40;
    dw $0000                                                             ;8FDE42;
    dw PLMPopulation_MotherBrainSave                                     ;8FDE44;
    dw $0000                                                             ;8FDE46;
    dw RTS_8FC91E                                                        ;8FDE48;

RoomDoors_MotherBrainSave:
    dw Door_MotherBrainSave_0                                            ;8FDE4A;

RoomScrolls_MotherBrainSave:
    db $01                                                               ;8FDE4C;

RoomHeader_TourianEscape1:
    db $0E,$05,$0B,$12,$02,$01,$70,$A0,$00                               ;8FDE4D;
    dw RoomDoors_TourianEscape1                                          ;8FDE56;
    dw Use_StatePointer_inX                                              ;8FDE58;

RoomState_TourianEscape1:
    dl LevelData_TourianEscape1                                          ;8FDE5A;
    db $0D,$24,$07                                                       ;8FDE5D;
    dw FXHeader_TourianEscape1                                           ;8FDE60;
    dw EnemyPopulations_TourianEscape1                                   ;8FDE62;
    dw EnemySets_TourianEscape1                                          ;8FDE64;
    db $C1,$C1                                                           ;8FDE66;
    dw RoomScrolls_TourianEscape1                                        ;8FDE68;
    dw $0000                                                             ;8FDE6A;
    dw MainASM_GenerateRandomExplosionOnEveryFourthFrame                 ;8FDE6C;
    dw PLMPopulation_TourianEscape1                                      ;8FDE6E;
    dw LibBG_Tourian_D_PipeRoom_Letterbox                                ;8FDE70;
    dw SetupASM_SetZebesTimebombEvent_SetLightHorizontalRoomShaking      ;8FDE72;

RoomDoors_TourianEscape1:
    dw Door_TourianEscape1_0                                             ;8FDE74;
    dw Door_TourianEscape1_1                                             ;8FDE76;

RoomScrolls_TourianEscape1:
    db $02,$02                                                           ;8FDE78;

RoomHeader_TourianEscape2:
    db $0F,$05,$0B,$13,$01,$02,$70,$A0,$00                               ;8FDE7A;
    dw RoomDoors_TourianEscape2                                          ;8FDE83;
    dw Use_StatePointer_inX                                              ;8FDE85;

RoomState_TourianEscape2:
    dl LevelData_TourianEscape2                                          ;8FDE87;
    db $0D,$00,$00                                                       ;8FDE8A;
    dw FXHeader_TourianEscape2                                           ;8FDE8D;
    dw EnemyPopulations_TourianEscape2                                   ;8FDE8F;
    dw EnemySets_TourianEscape2                                          ;8FDE91;
    db $C1,$C1                                                           ;8FDE93;
    dw RoomScrolls_TourianEscape2                                        ;8FDE95;
    dw $0000                                                             ;8FDE97;
    dw MainASM_ShakeScreenSwitchingBetweenLightHorizAndMediumDiag        ;8FDE99;
    dw PLMPopulation_TourianEscape2                                      ;8FDE9B;
    dw LibBG_Tourian_D_PipeRoom_VerticalSeparation                       ;8FDE9D;
    dw SetupASM_SetLightHorizontalRoomShaking                            ;8FDE9F;

RoomDoors_TourianEscape2:
    dw Door_TourianEscape2_0                                             ;8FDEA1;
    dw Door_TourianEscape2_1                                             ;8FDEA3;

RoomScrolls_TourianEscape2:
    db $02,$01                                                           ;8FDEA5;

RoomHeader_TourianEscape3:
    db $10,$05,$0C,$13,$06,$02,$70,$A0,$00                               ;8FDEA7;
    dw RoomDoors_TourianEscape3                                          ;8FDEB0;
    dw Use_StatePointer_inX                                              ;8FDEB2;

RoomState_TourianEscape3:
    dl LevelData_TourianEscape3                                          ;8FDEB4;
    db $0D,$00,$00                                                       ;8FDEB7;
    dw FXHeader_TourianEscape3                                           ;8FDEBA;
    dw EnemyPopulations_TourianEscape3                                   ;8FDEBC;
    dw EnemySets_TourianEscape3                                          ;8FDEBE;
    db $C1,$C1                                                           ;8FDEC0;
    dw RoomScrolls_TourianEscape3                                        ;8FDEC2;
    dw $0000                                                             ;8FDEC4;
    dw MainASM_GenerateRandomExplosionOnEveryFourthFrame                 ;8FDEC6;
    dw PLMPopulation_TourianEscape3                                      ;8FDEC8;
    dw LibBG_Tourian_D_PipeRoom                                          ;8FDECA;
    dw SetupASM_SetMediumHorizontalRoomShaking                           ;8FDECC;

RoomDoors_TourianEscape3:
    dw Door_TourianEscape3_0                                             ;8FDECE;
    dw Door_TourianEscape3_1                                             ;8FDED0;

RoomScrolls_TourianEscape3:
    db $02,$02,$02,$02,$02,$02,$01,$01,$01,$01,$01,$01                   ;8FDED2;

RoomHeader_TourianEscape4:
    db $11,$05,$12,$10,$03,$06,$70,$A0,$00                               ;8FDEDE;
    dw RoomDoors_TourianEscape4                                          ;8FDEE7;
    dw Use_StatePointer_inX                                              ;8FDEE9;

RoomState_TourianEscape4:
    dl LevelData_TourianEscape4                                          ;8FDEEB;
    db $0D,$00,$00                                                       ;8FDEEE;
    dw FXHeader_ToruianEscaper4                                          ;8FDEF1;
    dw EnemyPopulations_TourianEscape4                                   ;8FDEF3;
    dw EnemySets_TourianEscape4                                          ;8FDEF5;
    db $C1,$C1                                                           ;8FDEF7;
    dw RoomScrolls_TourianEscape4                                        ;8FDEF9;
    dw $0000                                                             ;8FDEFB;
    dw MainASM_ShakeScreenSwitchingBetweenMediumHorizAndStrongDiag       ;8FDEFD;
    dw PLMPopulation_TourianEscape4                                      ;8FDEFF;
    dw LibBG_Tourian_D_PipeRoom                                          ;8FDF01;
    dw SetupASM_SetupEscapeRoom4sPLM_SetMediumHorizontalRoomShaking      ;8FDF03;

RoomDoors_TourianEscape4:
    dw Door_TourianEscape4_0                                             ;8FDF05;
    dw Door_TourianEscape4_1                                             ;8FDF07;

RoomScrolls_TourianEscape4:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$01   ;8FDF09;
    db $01,$01                                                           ;8FDF19;

RoomHeader_UpperTourianSave:
    db $12,$05,$15,$0C,$01,$01,$70,$A0,$00                               ;8FDF1B;
    dw RoomDoors_UpperTourianSave                                        ;8FDF24;
    dw Use_StatePointer_inX                                              ;8FDF26;

RoomState_UpperTourianSave:
    dl LevelData_SaveStation_LeftSideDoor                                ;8FDF28;
    db $19,$1E,$05                                                       ;8FDF2B;
    dw FXHeader_UpperTourianSave                                         ;8FDF2E;
    dw EnemyPopulations_UpperTourianSave                                 ;8FDF30;
    dw EnemySets_UpperTourianSave                                        ;8FDF32;
    db $00,$00                                                           ;8FDF34;
    dw RoomScrolls_UpperTourianSave                                      ;8FDF36;
    dw $0000                                                             ;8FDF38;
    dw $0000                                                             ;8FDF3A;
    dw PLMPopulation_UpperTourianSave                                    ;8FDF3C;
    dw $0000                                                             ;8FDF3E;
    dw $0000                                                             ;8FDF40;

RoomDoors_UpperTourianSave:
    dw Door_UpperTourianSave_0                                           ;8FDF42;

RoomScrolls_UpperTourianSave:
    db $01                                                               ;8FDF44;

RoomHeader_CeresElev:
    db $00,$06,$0C,$0D,$01,$03,$70,$A0,$05                               ;8FDF45;
    dw RoomDoors_CeresElev                                               ;8FDF4E;
    dw RoomStateCheck_BossIsDead                                         ;8FDF50;
    db $01                                                               ;8FDF52;
    dw RoomState_CeresElev_1                                             ;8FDF53;
    dw Use_StatePointer_inX                                              ;8FDF55;

RoomState_CeresElev_0:
    dl LevelData_CeresElev                                               ;8FDF57;
    db $11,$2D,$06                                                       ;8FDF5A;
    dw FXHeader_CeresElev_State0_1                                       ;8FDF5D;
    dw EnemyPopulations_CeresElev_0                                      ;8FDF5F;
    dw EnemySets_CeresElev_0                                             ;8FDF61;
    db $00,$00                                                           ;8FDF63;
    dw $0000                                                             ;8FDF65;
    dw $0000                                                             ;8FDF67;
    dw MainASM_CeresElevatorShaft                                        ;8FDF69;
    dw PLMPopulation_CeresElev_State0_1                                  ;8FDF6B;
    dw LibBG_CeresElevator_State0_1                                      ;8FDF6D;
    dw SetupASM_SpawnCeresHaze                                           ;8FDF6F;

RoomState_CeresElev_1:
    dl LevelData_CeresElev                                               ;8FDF71;
    db $12,$00,$00                                                       ;8FDF74;
    dw FXHeader_CeresElev_State0_1                                       ;8FDF77;
    dw EnemyPopulations_CeresElev_1                                      ;8FDF79;
    dw EnemySets_CeresElev_1                                             ;8FDF7B;
    db $00,$00                                                           ;8FDF7D;
    dw $0000                                                             ;8FDF7F;
    dw $0000                                                             ;8FDF81;
    dw MainASM_CeresElevatorShaft                                        ;8FDF83;
    dw PLMPopulation_CeresElev_State0_1                                  ;8FDF85;
    dw LibBG_CeresElevator_State0_1                                      ;8FDF87;
    dw SetupASM_TurnCeresDoorToSolidBlocks_SpawnCeresHaze                ;8FDF89;

RoomDoors_CeresElev:
    dw Door_CeresElev_0                                                  ;8FDF8B;

RoomHeader_FallingTile:
    db $01,$06,$0D,$0F,$02,$01,$70,$A0,$00                               ;8FDF8D;
    dw RoomDoors_FallingTile                                             ;8FDF96;
    dw RoomStateCheck_BossIsDead                                         ;8FDF98;
    db $01                                                               ;8FDF9A;
    dw RoomState_FallingTile_1                                           ;8FDF9B;
    dw Use_StatePointer_inX                                              ;8FDF9D;

RoomState_FallingTile_0:
    dl LevelData_FallingTile                                             ;8FDF9F;
    db $0F,$00,$00                                                       ;8FDFA2;
    dw FXHeader_FallingTile_State0                                       ;8FDFA5;
    dw EnemyPopulations_FallingTile_0                                    ;8FDFA7;
    dw EnemySets_FallingTile_0                                           ;8FDFA9;
    db $C1,$01                                                           ;8FDFAB;
    dw $0000                                                             ;8FDFAD;
    dw $0000                                                             ;8FDFAF;
    dw MainASM_SpawnCeresPreElevatorHallFallingDebris                    ;8FDFB1;
    dw PLMPopulation_FallingTile_State0_1                                ;8FDFB3;
    dw LibBG_Tourian_D_E_StatueHall                                      ;8FDFB5;
    dw SetupASM_SpawnCeresHaze                                           ;8FDFB7;

RoomState_FallingTile_1:
    dl LevelData_FallingTile                                             ;8FDFB9;
    db $10,$00,$00                                                       ;8FDFBC;
    dw FXHeader_FallingTile_State1                                       ;8FDFBF;
    dw EnemyPopulations_FallingTile_1                                    ;8FDFC1;
    dw EnemySets_FallingTile_1                                           ;8FDFC3;
    db $C1,$01                                                           ;8FDFC5;
    dw $0000                                                             ;8FDFC7;
    dw $0000                                                             ;8FDFC9;
    dw MainASM_SpawnCeresPreElevatorHallFallingDebris                    ;8FDFCB;
    dw PLMPopulation_FallingTile_State0_1                                ;8FDFCD;
    dw LibBG_Tourian_D_E_StatueHall                                      ;8FDFCF;
    dw SetupASM_SpawnCeresHaze                                           ;8FDFD1;

RoomDoors_FallingTile:
    dw Door_FallingTile_0                                                ;8FDFD3;
    dw Door_FallingTile_1                                                ;8FDFD5;

RoomHeader_MagnetStairs:
    db $02,$06,$0F,$0F,$01,$02,$70,$A0,$00                               ;8FDFD7;
    dw RoomDoors_MagnetStairs                                            ;8FDFE0;
    dw RoomStateCheck_BossIsDead                                         ;8FDFE2;
    db $01                                                               ;8FDFE4;
    dw RoomState_MagnetStairs_1                                          ;8FDFE5;
    dw Use_StatePointer_inX                                              ;8FDFE7;

RoomState_MagnetStairs_0:
    dl LevelData_MagnetStairs                                            ;8FDFE9;
    db $0F,$00,$00                                                       ;8FDFEC;
    dw FXHeader_MagnetStairs_State0                                      ;8FDFEF;
    dw EnemyPopulations_MagnetStairs_0                                   ;8FDFF1;
    dw EnemySets_MagnetStairs_0                                          ;8FDFF3;
    db $01,$41                                                           ;8FDFF5;
    dw $0000                                                             ;8FDFF7;
    dw $0000                                                             ;8FDFF9;
    dw RTS_8FE524                                                        ;8FDFFB;
    dw PLMPopulation_MagnetStairs_State0_1                               ;8FDFFD;
    dw LibBG_Tourian_D_E_StatueHall                                      ;8FDFFF;
    dw SetupASM_SpawnCeresHaze                                           ;8FE001;

RoomState_MagnetStairs_1:
    dl LevelData_MagnetStairs                                            ;8FE003;
    db $10,$00,$00                                                       ;8FE006;
    dw FXHeader_MagnetStairs_State1                                      ;8FE009;
    dw EnemyPopulations_MagnetStairs_1                                   ;8FE00B;
    dw EnemySets_MagnetStairs_1                                          ;8FE00D;
    db $01,$C1                                                           ;8FE00F;
    dw $0000                                                             ;8FE011;
    dw $0000                                                             ;8FE013;
    dw RTS_8FE524                                                        ;8FE015;
    dw PLMPopulation_MagnetStairs_State0_1                               ;8FE017;
    dw LibBG_Tourian_D_E_StatueHall                                      ;8FE019;
    dw SetupASM_SpawnCeresHaze                                           ;8FE01B;

RoomDoors_MagnetStairs:
    dw Door_MagnetStairs_0                                               ;8FE01D;
    dw Door_MagnetStairs_1                                               ;8FE01F;

RoomHeader_DeadScientist:
    db $03,$06,$10,$10,$02,$01,$70,$A0,$00                               ;8FE021;
    dw RoomDoors_DeadScientist                                           ;8FE02A;
    dw RoomStateCheck_BossIsDead                                         ;8FE02C;
    db $01                                                               ;8FE02E;
    dw RoomState_DeadScientist_1                                         ;8FE02F;
    dw Use_StatePointer_inX                                              ;8FE031;

RoomState_DeadScientist_0:
    dl LevelData_DeadScientist                                           ;8FE033;
    db $0F,$00,$00                                                       ;8FE036;
    dw FXHeader_DeadScientist_State0                                     ;8FE039;
    dw EnemyPopulations_DeadScientist_0                                  ;8FE03B;
    dw EnemySets_DeadScientist_0                                         ;8FE03D;
    db $C0,$00                                                           ;8FE03F;
    dw $0000                                                             ;8FE041;
    dw $0000                                                             ;8FE043;
    dw RTS_8FE524                                                        ;8FE045;
    dw PLMPopulation_DeadScientist_State0_1                              ;8FE047;
    dw $0000                                                             ;8FE049;
    dw SetupASM_SpawnCeresHaze                                           ;8FE04B;

RoomState_DeadScientist_1:
    dl LevelData_DeadScientist                                           ;8FE04D;
    db $10,$00,$00                                                       ;8FE050;
    dw FXHeader_DeadScientist_State1                                     ;8FE053;
    dw EnemyPopulations_DeadScientist_1                                  ;8FE055;
    dw EnemySets_DeadScientist_1                                         ;8FE057;
    db $C0,$00                                                           ;8FE059;
    dw $0000                                                             ;8FE05B;
    dw $0000                                                             ;8FE05D;
    dw RTS_8FE524                                                        ;8FE05F;
    dw PLMPopulation_DeadScientist_State0_1                              ;8FE061;
    dw $0000                                                             ;8FE063;
    dw SetupASM_SpawnCeresHaze                                           ;8FE065;

RoomDoors_DeadScientist:
    dw Door_DeadScientist_0                                              ;8FE067;
    dw Door_DeadScientist_1                                              ;8FE069;

RoomHeader_58Escape:
    db $04,$06,$12,$10,$02,$01,$70,$A0,$00                               ;8FE06B;
    dw RoomDoors_58Escape                                                ;8FE074;
    dw RoomStateCheck_BossIsDead                                         ;8FE076;
    db $01                                                               ;8FE078;
    dw RoomState_58Escape_1                                              ;8FE079;
    dw Use_StatePointer_inX                                              ;8FE07B;

RoomState_58Escape_0:
    dl LevelData_58Escape                                                ;8FE07D;
    db $0F,$00,$00                                                       ;8FE080;
    dw FXHeader_58Escape_State0                                          ;8FE083;
    dw EnemyPopulations_58Escape_0                                       ;8FE085;
    dw EnemySets_58Escape_0                                              ;8FE087;
    db $C1,$01                                                           ;8FE089;
    dw $0000                                                             ;8FE08B;
    dw $0000                                                             ;8FE08D;
    dw RTS_8FE524                                                        ;8FE08F;
    dw PLMPopulation_58Escape_State0_1                                   ;8FE091;
    dw LibBG_Tourian_D_E_StatueHall                                      ;8FE093;
    dw SetupASM_SpawnCeresHaze                                           ;8FE095;

RoomState_58Escape_1:
    dl LevelData_58Escape                                                ;8FE097;
    db $10,$00,$00                                                       ;8FE09A;
    dw FXHeader_58Escape_State1                                          ;8FE09D;
    dw EnemyPopulations_58Escape_1                                       ;8FE09F;
    dw EnemySets_58Escape_1                                              ;8FE0A1;
    db $C1,$01                                                           ;8FE0A3;
    dw $0000                                                             ;8FE0A5;
    dw $0000                                                             ;8FE0A7;
    dw RTS_8FE524                                                        ;8FE0A9;
    dw PLMPopulation_58Escape_State0_1                                   ;8FE0AB;
    dw LibBG_Tourian_D_E_StatueHall                                      ;8FE0AD;
    dw SetupASM_SpawnCeresHaze                                           ;8FE0AF;

RoomDoors_58Escape:
    dw Door_58Escape_0                                                   ;8FE0B1;
    dw Door_58Escape_1                                                   ;8FE0B3;

RoomHeader_CeresRidley:
    db $05,$06,$14,$10,$01,$01,$70,$A0,$05                               ;8FE0B5;
    dw RoomDoors_CeresRidley                                             ;8FE0BE;
    dw RoomStateCheck_BossIsDead                                         ;8FE0C0;
    db $01                                                               ;8FE0C2;
    dw RoomState_CeresRidley_1                                           ;8FE0C3;
    dw Use_StatePointer_inX                                              ;8FE0C5;

RoomState_CeresRidley_0:
    dl LevelData_CeresRidley                                             ;8FE0C7;
    db $13,$24,$80                                                       ;8FE0CA;
    dw FXHeader_CeresRidley_State0                                       ;8FE0CD;
    dw EnemyPopulations_CeresRidley_0                                    ;8FE0CF;
    dw EnemySets_CeresRidley_0                                           ;8FE0D1;
    db $00,$00                                                           ;8FE0D3;
    dw $0000                                                             ;8FE0D5;
    dw $0000                                                             ;8FE0D7;
    dw MainASM_HandleCeresRidleyGetawayCutscene                          ;8FE0D9;
    dw PLMPopulation_CeresRidley_State0_1                                ;8FE0DB;
    dw $0000                                                             ;8FE0DD;
    dw SetupASM_SetBG1_2_TilesBaseAddress_SpawnCeresHaze                 ;8FE0DF;

RoomState_CeresRidley_1:
    dl LevelData_CeresRidley                                             ;8FE0E1;
    db $14,$00,$00                                                       ;8FE0E4;
    dw FXHeader_CeresRidley_State1                                       ;8FE0E7;
    dw EnemyPopulations_CeresRidley_1                                    ;8FE0E9;
    dw EnemySets_CeresRidley_1                                           ;8FE0EB;
    db $00,$00                                                           ;8FE0ED;
    dw $0000                                                             ;8FE0EF;
    dw $0000                                                             ;8FE0F1;
    dw MainASM_HandleCeresRidleyGetawayCutscene                          ;8FE0F3;
    dw PLMPopulation_CeresRidley_State0_1                                ;8FE0F5;
    dw $0000                                                             ;8FE0F7;
    dw SetupASM_SetBG1_2_TilesBaseAddress_SpawnCeresHaze                 ;8FE0F9;

RoomDoors_CeresRidley:
    dw Door_CeresRidley                                                  ;8FE0FB;

LibBG_Phantoon_State0:
    dw $0002                                                             ;8FE0FD;
    dl $7E2000                                                           ;8FE0FF;
    dw $4800,$1000,$0000                                                 ;8FE102;

LibBG_Draygon_State0:
    dw $0002                                                             ;8FE108;
    dl $7E2000                                                           ;8FE10A;
    dw $4800,$1000,$0000                                                 ;8FE10D;

LibBG_Phantoon_Draygon_State1:
    dw $000A,$0000                                                       ;8FE113;

LibBG_WreckedShip_4_5_EntranceHall:
    dw $0004                                                             ;8FE117;
    dl Background_WreckedShip_4_5_EntranceHall_0                         ;8FE119;
    dw $4000,$0002                                                       ;8FE11C;
    dl $7E4000                                                           ;8FE120;
    dw $4800,$0800,$0002                                                 ;8FE123;
    dl $7E4000                                                           ;8FE129;
    dw $4C00,$0800,$0000                                                 ;8FE12C;

UNUSED_LibBG_WreckedShip_4_5_EntranceHall_1_8FE132:
    dw $0004                                                             ;8FE132;
    dl Background_WreckedShip_4_5_EntranceHall_1                         ;8FE134;
    dw $4000,$0002                                                       ;8FE137;
    dl $7E4000                                                           ;8FE13B;
    dw $4800,$0800,$0002                                                 ;8FE13E;
    dl $7E4000                                                           ;8FE144;
    dw $4C00,$0800,$0000                                                 ;8FE147;

LibBG_WreckedShip_4_5_Columns_Tubes:
    dw $0004                                                             ;8FE14D;
    dl Background_WreckedShip_4_5_Columns_Tubes                          ;8FE14F;
    dw $4000,$0002                                                       ;8FE152;
    dl $7E4000                                                           ;8FE156;
    dw $4800,$0800,$0002                                                 ;8FE159;
    dl $7E4000                                                           ;8FE15F;
    dw $4C00,$0800,$0000                                                 ;8FE162;

LibBG_WreckedShip_4_5_ExperimentRoom:
    dw $0004                                                             ;8FE168;
    dl Background_WreckedShip_4_5_ExperimentRoom                         ;8FE16A;
    dw $4000,$0002                                                       ;8FE16D;
    dl $7E4000                                                           ;8FE171;
    dw $4800,$0800,$0002                                                 ;8FE174;
    dl $7E4000                                                           ;8FE17A;
    dw $4C00,$0800,$0000                                                 ;8FE17D;

LibBG_WreckedShip_4_5_Panels_Vents:
    dw $0004                                                             ;8FE183;
    dl Background_WreckedShip_4_5_Panels_Vents                           ;8FE185;
    dw $4000,$0002                                                       ;8FE188;
    dl $7E4000                                                           ;8FE18C;
    dw $4800,$0800,$0002                                                 ;8FE18F;
    dl $7E4000                                                           ;8FE195;
    dw $4C00,$0800,$0000                                                 ;8FE198;

LibBG_WreckedShip_4_5_Panels_Vents_Horizontal:
    dw $0004                                                             ;8FE19E;
    dl Background_WreckedShip_4_5_Panels_Vents_Horizontal                ;8FE1A0;
    dw $4000,$0002                                                       ;8FE1A3;
    dl $7E4000                                                           ;8FE1A7;
    dw $4800,$0800,$0002                                                 ;8FE1AA;
    dl $7E4000                                                           ;8FE1B0;
    dw $4C00,$0800,$0000                                                 ;8FE1B3;

LibBG_WreckedShip_4_5_Panels_Vents_Vertical:
    dw $0004                                                             ;8FE1B9;
    dl Background_WreckedShip_4_5_Panels_Vents_Vertical                  ;8FE1BB;
    dw $4000,$0002                                                       ;8FE1BE;
    dl $7E4000                                                           ;8FE1C2;
    dw $4800,$0800,$0002                                                 ;8FE1C5;
    dl $7E4000                                                           ;8FE1CB;
    dw $4C00,$0800,$0000                                                 ;8FE1CE;

LibBG_CeresElevator_State0_1:
    dw $000A,$0000                                                       ;8FE1D4;

DoorASM_StartWreckedShipTreadmillEastEntrance:
    LDY.W #AnimatedTilesObjects_FX_wreckedShipTreadmillLeftwards         ;8FE1D8;
    JSL.L Spawn_AnimatedTilesObject                                      ;8FE1DB;
    JSL.L Spawn_Hardcoded_PLM                                            ;8FE1DF;
    db $04,$09                                                           ;8FE1E3;
    dw PLMEntries_wreckedShipEntranceTreadmillFromEast                   ;8FE1E5;
    RTS                                                                  ;8FE1E7;


DoorASM_Scroll_1_Blue:
    PHP                                                                  ;8FE1E8;
    SEP #$20                                                             ;8FE1E9;
    LDA.B #$01                                                           ;8FE1EB;
    STA.L $7ECD21                                                        ;8FE1ED;
    PLP                                                                  ;8FE1F1;
    RTS                                                                  ;8FE1F2;


DoorASM_Scroll_0_Green_duplicate_again:
    PHP                                                                  ;8FE1F3;
    SEP #$20                                                             ;8FE1F4;
    LDA.B #$02                                                           ;8FE1F6;
    STA.L $7ECD20                                                        ;8FE1F8;
    PLP                                                                  ;8FE1FC;
    RTS                                                                  ;8FE1FD;


DoorASM_Scroll_3_Red_4_Blue:
    PHP                                                                  ;8FE1FE;
    SEP #$20                                                             ;8FE1FF;
    LDA.B #$00                                                           ;8FE201;
    STA.L $7ECD23                                                        ;8FE203;
    LDA.B #$01                                                           ;8FE207;
    STA.L $7ECD24                                                        ;8FE209;
    PLP                                                                  ;8FE20D;
    RTS                                                                  ;8FE20E;


DoorASM_Scroll_29_Blue:
    PHP                                                                  ;8FE20F;
    SEP #$20                                                             ;8FE210;
    LDA.B #$01                                                           ;8FE212;
    STA.L $7ECD49                                                        ;8FE214;
    PLP                                                                  ;8FE218;
    RTS                                                                  ;8FE219;


DoorASM_Scroll_28_2E_Green:
    PHP                                                                  ;8FE21A;
    SEP #$20                                                             ;8FE21B;
    LDA.B #$02                                                           ;8FE21D;
    STA.L $7ECD48                                                        ;8FE21F;
    STA.L $7ECD4E                                                        ;8FE223;
    PLP                                                                  ;8FE227;
    RTS                                                                  ;8FE228;


DoorASM_Scroll_6_7_8_9_A_B_Red:
    PHP                                                                  ;8FE229;
    SEP #$20                                                             ;8FE22A;
    LDA.B #$00                                                           ;8FE22C;
    STA.L $7ECD26                                                        ;8FE22E;
    STA.L $7ECD27                                                        ;8FE232;
    STA.L $7ECD28                                                        ;8FE236;
    STA.L $7ECD29                                                        ;8FE23A;
    STA.L $7ECD2A                                                        ;8FE23E;
    STA.L $7ECD2B                                                        ;8FE242;
    PLP                                                                  ;8FE246;
    RTS                                                                  ;8FE247;


LibBG_Maridia_B_BrownWall:
    dw $0004                                                             ;8FE248;
    dl Background_Maridia_B_BrownWall                                    ;8FE24A;
    dw $4000,$0002                                                       ;8FE24D;
    dl $7E4000                                                           ;8FE251;
    dw $4800,$1000,$0000                                                 ;8FE254;

LibBG_Maridia_C_GreenWall:
    dw $0004                                                             ;8FE25A;
    dl Background_Maridia_C_GreenWall                                    ;8FE25C;
    dw $4000,$0002                                                       ;8FE25F;
    dl $7E4000                                                           ;8FE263;
    dw $4800,$1000,$0000                                                 ;8FE266;

DoorASM_SetupElevatubeFromSouth:
    LDA.W #$FF00                                                         ;8FE26C;
    STA.W $07E5                                                          ;8FE26F;
    STZ.W $07E3                                                          ;8FE272;
    LDA.W #$09C0                                                         ;8FE275;
    STA.W $07E3                                                          ;8FE278;
    LDA.W #$FFE0                                                         ;8FE27B;
    STA.W $07E7                                                          ;8FE27E;
    LDA.W #$0000                                                         ;8FE281;
    JSL.L Run_Samus_Command                                              ;8FE284;
    JSL.L Spawn_Hardcoded_PLM                                            ;8FE288;
    db $01,$00                                                           ;8FE28C;
    dw PLMEntries_maridiaElevatube                                       ;8FE28E;
    RTS                                                                  ;8FE290;


DoorASM_SetupElevatubeFromNorth:
    LDA.W #$0100                                                         ;8FE291;
    STA.W $07E5                                                          ;8FE294;
    STZ.W $07E3                                                          ;8FE297;
    LDA.W #$0040                                                         ;8FE29A;
    STA.W $07E3                                                          ;8FE29D;
    LDA.W #$0020                                                         ;8FE2A0;
    STA.W $07E7                                                          ;8FE2A3;
    LDA.W #$0000                                                         ;8FE2A6;
    JSL.L Run_Samus_Command                                              ;8FE2A9;
    JSL.L Spawn_Hardcoded_PLM                                            ;8FE2AD;
    db $01,$00                                                           ;8FE2B1;
    dw PLMEntries_maridiaElevatube                                       ;8FE2B3;
    RTS                                                                  ;8FE2B5;


MainASM_Elevatube:
    LDA.W #$0080                                                         ;8FE2B6;
    STA.W $0AF6                                                          ;8FE2B9;
    STZ.W $0AF8                                                          ;8FE2BC;
    STZ.B $12                                                            ;8FE2BF;
    STZ.B $14                                                            ;8FE2C1;
    LDA.W $07E5                                                          ;8FE2C3;
    BPL +                                                                ;8FE2C6;
    DEC.B $14                                                            ;8FE2C8;

  + STA.B $13                                                            ;8FE2CA;
    LDA.W $07E1                                                          ;8FE2CC;
    CLC                                                                  ;8FE2CF;
    ADC.B $12                                                            ;8FE2D0;
    STA.W $07E1                                                          ;8FE2D2;
    LDA.W $07E3                                                          ;8FE2D5;
    ADC.B $14                                                            ;8FE2D8;
    STA.W $07E3                                                          ;8FE2DA;
    LDA.B $12                                                            ;8FE2DD;
    LDX.B $14                                                            ;8FE2DF;
    STX.B $12                                                            ;8FE2E1;
    STA.B $14                                                            ;8FE2E3;
    JSL.L MoveSamusDown_NoSolidEnemyCollision                            ;8FE2E5;
    LDA.W $07E5                                                          ;8FE2E9;
    CLC                                                                  ;8FE2EC;
    ADC.W $07E7                                                          ;8FE2ED;
    CLC                                                                  ;8FE2F0;
    ADC.W #$0E20                                                         ;8FE2F1;
    CMP.W #$1C41                                                         ;8FE2F4;
    BCS .return                                                          ;8FE2F7;
    SEC                                                                  ;8FE2F9;
    SBC.W #$0E20                                                         ;8FE2FA;
    STA.W $07E5                                                          ;8FE2FD;

.return:
    RTS                                                                  ;8FE300;


DoorASM_ResetElevatubeOnNorthExit:
    LDA.W #$0001                                                         ;8FE301;
    JSL.L Run_Samus_Command                                              ;8FE304;
    RTS                                                                  ;8FE308;


DoorASM_ResetElevatubeOnSouthExit:
    LDA.W #$0202                                                         ;8FE309;
    STA.L $7ECD20                                                        ;8FE30C;
    LDA.W #$0001                                                         ;8FE310;
    JSL.L Run_Samus_Command                                              ;8FE313;
    RTS                                                                  ;8FE317;


DoorASM_Scroll_A_Red_B_Blue:
    PHP                                                                  ;8FE318;
    SEP #$20                                                             ;8FE319;
    LDA.B #$00                                                           ;8FE31B;
    STA.L $7ECD2A                                                        ;8FE31D;
    LDA.B #$01                                                           ;8FE321;
    STA.L $7ECD2B                                                        ;8FE323;
    PLP                                                                  ;8FE327;
    RTS                                                                  ;8FE328;


UNUSED_DoorASM_Scroll_4_Green_8FE329:
    PHP                                                                  ;8FE329;
    SEP #$20                                                             ;8FE32A;
    LDA.B #$00                                                           ;8FE32C;
    STA.L $7ECD31                                                        ;8FE32E;
    LDA.B #$01                                                           ;8FE332;
    STA.L $7ECD30                                                        ;8FE334;
    PLP                                                                  ;8FE338;
    RTS                                                                  ;8FE339;


UNUSED_DoorASM_Scroll_4_Green_8FE33A:
    PHP                                                                  ;8FE33A;
    SEP #$20                                                             ;8FE33B;
    LDA.B #$02                                                           ;8FE33D;
    STA.L $7ECD24                                                        ;8FE33F;
    PLP                                                                  ;8FE343;
    RTS                                                                  ;8FE344;


DoorASM_Scroll_0_Red_4_Blue_duplicate:
    PHP                                                                  ;8FE345;
    SEP #$20                                                             ;8FE346;
    LDA.B #$00                                                           ;8FE348;
    STA.L $7ECD20                                                        ;8FE34A;
    LDA.B #$01                                                           ;8FE34E;
    STA.L $7ECD24                                                        ;8FE350;
    PLP                                                                  ;8FE354;
    RTS                                                                  ;8FE355;


DoorASM_Scroll_0_Red_1_Blue:
    PHP                                                                  ;8FE356;
    SEP #$20                                                             ;8FE357;
    LDA.B #$00                                                           ;8FE359;
    STA.L $7ECD20                                                        ;8FE35B;
    LDA.B #$01                                                           ;8FE35F;
    STA.L $7ECD21                                                        ;8FE361;
    PLP                                                                  ;8FE365;
    RTS                                                                  ;8FE366;


DoorASM_Scroll_9_Red_A_Blue:
    PHP                                                                  ;8FE367;
    SEP #$20                                                             ;8FE368;
    LDA.B #$00                                                           ;8FE36A;
    STA.L $7ECD29                                                        ;8FE36C;
    LDA.B #$01                                                           ;8FE370;
    STA.L $7ECD2A                                                        ;8FE372;
    PLP                                                                  ;8FE376;
    RTS                                                                  ;8FE377;


DoorASM_Scroll_0_2_Red_1_Blue:
    PHP                                                                  ;8FE378;
    SEP #$20                                                             ;8FE379;
    LDA.B #$00                                                           ;8FE37B;
    STA.L $7ECD20                                                        ;8FE37D;
    STA.L $7ECD22                                                        ;8FE381;
    LDA.B #$01                                                           ;8FE385;
    STA.L $7ECD21                                                        ;8FE387;
    PLP                                                                  ;8FE38B;
    RTS                                                                  ;8FE38C;


DoorASM_Scroll_1_Blue_duplicate:
    PHP                                                                  ;8FE38D;
    SEP #$20                                                             ;8FE38E;
    LDA.B #$01                                                           ;8FE390;
    STA.L $7ECD21                                                        ;8FE392;
    PLP                                                                  ;8FE396;
    RTS                                                                  ;8FE397;


DoorASM_Scroll_6_Blue:
    PHP                                                                  ;8FE398;
    SEP #$20                                                             ;8FE399;
    LDA.B #$01                                                           ;8FE39B;
    STA.L $7ECD26                                                        ;8FE39D;
    PLP                                                                  ;8FE3A1;
    RTS                                                                  ;8FE3A2;


DoorASM_Scroll_4_Red_duplicate:
    PHP                                                                  ;8FE3A3;
    SEP #$20                                                             ;8FE3A4;
    LDA.B #$00                                                           ;8FE3A6;
    STA.L $7ECD24                                                        ;8FE3A8;
    PLP                                                                  ;8FE3AC;
    RTS                                                                  ;8FE3AD;


UNUSED_DoorASM_Scroll_1_Red_8FE3AE:
    PHP                                                                  ;8FE3AE;
    SEP #$20                                                             ;8FE3AF;
    LDA.B #$00                                                           ;8FE3B1;
    STA.L $7ECD21                                                        ;8FE3B3;
    PLP                                                                  ;8FE3B7;
    RTS                                                                  ;8FE3B8;


DoorASM_Scroll_4_7_Red:
    PHP                                                                  ;8FE3B9;
    SEP #$20                                                             ;8FE3BA;
    LDA.B #$00                                                           ;8FE3BC;
    STA.L $7ECD24                                                        ;8FE3BE;
    STA.L $7ECD27                                                        ;8FE3C2;
    PLP                                                                  ;8FE3C6;
    RTS                                                                  ;8FE3C7;


DoorASM_Scroll_1_Blue_2_Red_duplicate:
    PHP                                                                  ;8FE3C8;
    SEP #$20                                                             ;8FE3C9;
    LDA.B #$00                                                           ;8FE3CB;
    STA.L $7ECD22                                                        ;8FE3CD;
    LDA.B #$01                                                           ;8FE3D1;
    STA.L $7ECD21                                                        ;8FE3D3;
    PLP                                                                  ;8FE3D7;
    RTS                                                                  ;8FE3D8;


DoorASM_Scroll_0_2_Green_duplicate:
    PHP                                                                  ;8FE3D9;
    SEP #$20                                                             ;8FE3DA;
    LDA.B #$02                                                           ;8FE3DC;
    STA.L $7ECD20                                                        ;8FE3DE;
    STA.L $7ECD22                                                        ;8FE3E2;
    PLP                                                                  ;8FE3E6;
    RTS                                                                  ;8FE3E7;


LibBG_Tourian_D_MechanicalRoom:
    dw $0004                                                             ;8FE3E8;
    dl Background_Tourian_D_MechanicalRoom                               ;8FE3EA;
    dw $4000,$0002                                                       ;8FE3ED;
    dl $7E4000                                                           ;8FE3F1;
    dw $4800,$0800,$0002                                                 ;8FE3F4;
    dl $7E4000                                                           ;8FE3FA;
    dw $4C00,$0800,$0000                                                 ;8FE3FD;

LibBG_Tourian_D_MechanicalRoom_Letterbox:
    dw $0004                                                             ;8FE403;
    dl Background_Tourian_D_MechanicalRoom_Letterbox                     ;8FE405;
    dw $4000,$0002                                                       ;8FE408;
    dl $7E4000                                                           ;8FE40C;
    dw $4800,$0800,$0002                                                 ;8FE40F;
    dl $7E4000                                                           ;8FE415;
    dw $4C00,$0800,$0000                                                 ;8FE418;

LibBG_Tourian_D_VerticalStructures:
    dw $0004                                                             ;8FE41E;
    dl Background_Tourian_D_VerticalStructures                           ;8FE420;
    dw $4000,$0002                                                       ;8FE423;
    dl $7E4000                                                           ;8FE427;
    dw $4800,$0800,$0002                                                 ;8FE42A;
    dl $7E4000                                                           ;8FE430;
    dw $4C00,$0800,$0000                                                 ;8FE433;

LibBG_Tourian_D_PipeRoom_Letterbox:
    dw $0004                                                             ;8FE439;
    dl Background_Tourian_D_PipeRoom_Letterbox                           ;8FE43B;
    dw $4000,$0002                                                       ;8FE43E;
    dl $7E4000                                                           ;8FE442;
    dw $4800,$0800,$0002                                                 ;8FE445;
    dl $7E4000                                                           ;8FE44B;
    dw $4C00,$0800,$0000                                                 ;8FE44E;

LibBG_Tourian_D_PipeRoom_VerticalSeparation:
    dw $0004                                                             ;8FE454;
    dl Background_Tourian_D_PipeRoom_VerticalSeparation                  ;8FE456;
    dw $4000,$0002                                                       ;8FE459;
    dl $7E4000                                                           ;8FE45D;
    dw $4800,$0800,$0002                                                 ;8FE460;
    dl $7E4000                                                           ;8FE466;
    dw $4C00,$0800,$0000                                                 ;8FE469;

LibBG_Tourian_D_PipeRoom:
    dw $0004                                                             ;8FE46F;
    dl Background_Tourian_D_PipeRoom                                     ;8FE471;
    dw $4000,$0002                                                       ;8FE474;
    dl $7E4000                                                           ;8FE478;
    dw $4800,$0800,$0002                                                 ;8FE47B;
    dl $7E4000                                                           ;8FE481;
    dw $4C00,$0800,$0000                                                 ;8FE484;

LibBG_Tourian_E_PipeRoom_Dark:
    dw $0004                                                             ;8FE48A;
    dl Background_Tourian_E_PipeRoom_Dark                                ;8FE48C;
    dw $4000,$0002                                                       ;8FE48F;
    dl $7E4000                                                           ;8FE493;
    dw $4800,$0800,$0002                                                 ;8FE496;
    dl $7E4000                                                           ;8FE49C;
    dw $4C00,$0800,$0000                                                 ;8FE49F;

LibBG_Tourian_D_E_StatueHall:
    dw $0004                                                             ;8FE4A5;
    dl Background_Tourian_D_E_StatueHall                                 ;8FE4A7;
    dw $4000,$0002                                                       ;8FE4AA;
    dl $7E4000                                                           ;8FE4AE;
    dw $4800,$0800,$0002                                                 ;8FE4B1;
    dl $7E4000                                                           ;8FE4B7;
    dw $4C00,$0800,$0000                                                 ;8FE4BA;

DoorASM_Scroll_0_1_Green_duplicate:
    PHP                                                                  ;8FE4C0;
    SEP #$20                                                             ;8FE4C1;
    LDA.B #$02                                                           ;8FE4C3;
    STA.L $7ECD20                                                        ;8FE4C5;
    STA.L $7ECD21                                                        ;8FE4C9;
    PLP                                                                  ;8FE4CD;
    RTS                                                                  ;8FE4CE;


DoorASM_Scroll_8_Blue_9_Red:
    PHP                                                                  ;8FE4CF;
    SEP #$20                                                             ;8FE4D0;
    LDA.B #$01                                                           ;8FE4D2;
    STA.L $7ECD38                                                        ;8FE4D4;
    LDA.B #$00                                                           ;8FE4D8;
    STA.L $7ECD39                                                        ;8FE4DA;
    PLP                                                                  ;8FE4DE;
    RTS                                                                  ;8FE4DF;


DoorASM_ToCeresElevatorShaft:
    SEP #$20                                                             ;8FE4E0;
    LDA.B #$07                                                           ;8FE4E2;
    STA.B $56                                                            ;8FE4E4;
    STA.W $2105                                                          ;8FE4E6;
    REP #$20                                                             ;8FE4E9;
    LDA.W #$0100                                                         ;8FE4EB;
    STA.B $78                                                            ;8FE4EE;
    STA.B $7E                                                            ;8FE4F0;
    STZ.B $7A                                                            ;8FE4F2;
    STZ.B $7C                                                            ;8FE4F4;
    LDA.W #$0080                                                         ;8FE4F6;
    STA.B $80                                                            ;8FE4F9;
    LDA.W #$03F0                                                         ;8FE4FB;
    STA.B $82                                                            ;8FE4FE;
    LDA.W #$0001                                                         ;8FE500;
    STA.W $0783                                                          ;8FE503;
    LDA.W #$0022                                                         ;8FE506;
    STA.W $07E1                                                          ;8FE509;
    LDA.W #$003C                                                         ;8FE50C;
    STA.W $07E3                                                          ;8FE50F;
    RTS                                                                  ;8FE512;


DoorASM_FromCeresElevatorShaft:
    SEP #$20                                                             ;8FE513;
    LDA.B #$09                                                           ;8FE515;
    STA.B $56                                                            ;8FE517;
    REP #$20                                                             ;8FE519;
    STZ.W $0783                                                          ;8FE51B;
    RTS                                                                  ;8FE51E;


MainASM_CeresElevatorShaft:
    JSL.L RoomMainASM_CeresElevatorShaft                                 ;8FE51F;
    RTS                                                                  ;8FE523;


RTS_8FE524:
    RTS                                                                  ;8FE524;


MainASM_SpawnCeresPreElevatorHallFallingDebris:
    LDA.W $093F                                                          ;8FE525;
    BEQ RTS_8FE524                                                       ;8FE528;
    DEC.W $07E1                                                          ;8FE52A;
    BPL RTS_8FE524                                                       ;8FE52D;
    LDA.W #$0008                                                         ;8FE52F;
    STA.W $07E1                                                          ;8FE532;
    LDY.W #EnemyProjectile_CeresFallingTile_Light                        ;8FE535;
    LDA.W $05E5                                                          ;8FE538;
    ASL A                                                                ;8FE53B;
    BCC +                                                                ;8FE53C;
    LDY.W #EnemyProjectile_CeresFallingTile_Dark                         ;8FE53E;

  + LDA.W $05E5                                                          ;8FE541;
    AND.W #$000F                                                         ;8FE544;
    ASL A                                                                ;8FE547;
    TAX                                                                  ;8FE548;
    LDA.W .debrisXpos,X                                                  ;8FE549;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;8FE54C;
    RTS                                                                  ;8FE550;


.debrisXpos:
    dw $0050,$0060,$0070,$0080,$0090,$00A0,$00B0,$00C0                   ;8FE551;
    dw $00D0,$00E0,$00F0,$0110,$0130,$0150,$0170,$0190                   ;8FE561;

MainASM_HandleCeresRidleyGetawayCutscene:
    LDA.W $093F                                                          ;8FE571;
    LSR A                                                                ;8FE574;
    BCC .return                                                          ;8FE575;
    JSL.L HandleCeresRidleyGetawayCutscene                               ;8FE577;

.return:
    RTS                                                                  ;8FE57B;


MainASM_ShakeScreenSwitchingBetweenLightHorizAndMediumDiag:
    LDA.W $07E1                                                          ;8FE57C;
    BEQ .resetQuakeTimer                                                 ;8FE57F;
    DEC.W $07E1                                                          ;8FE581;
    BNE MainASM_GenerateRandomExplosionOnEveryFourthFrame                ;8FE584;
    LDA.W #$0012                                                         ;8FE586;
    BRA +                                                                ;8FE589;


.resetQuakeTimer:
    JSL.L GenerateRandomNumber                                           ;8FE58B;
    CMP.W #$0200                                                         ;8FE58F;
    BCS MainASM_GenerateRandomExplosionOnEveryFourthFrame                ;8FE592;
    LDA.W #$002A                                                         ;8FE594;
    STA.W $07E1                                                          ;8FE597;
    LDA.W #$0017                                                         ;8FE59A;

  + STA.W $183E                                                          ;8FE59D;

MainASM_GenerateRandomExplosionOnEveryFourthFrame:
    JSR.W GenerateRandomExplosionOnEveryFourthFrame                      ;8FE5A0;
    RTS                                                                  ;8FE5A3;


MainASM_ShakeScreenSwitchingBetweenMediumHorizAndStrongDiag:
    LDA.W $07E1                                                          ;8FE5A4;
    BEQ .resetQuakeTimer                                                 ;8FE5A7;
    DEC.W $07E1                                                          ;8FE5A9;
    BNE .noEarthquakeChange                                              ;8FE5AC;
    LDA.W #$0015                                                         ;8FE5AE;
    BRA +                                                                ;8FE5B1;


.resetQuakeTimer:
    JSL.L GenerateRandomNumber                                           ;8FE5B3;
    CMP.W #$0180                                                         ;8FE5B7;
    BCS .noEarthquakeChange                                              ;8FE5BA;
    LDA.W #$002A                                                         ;8FE5BC;
    STA.W $07E1                                                          ;8FE5BF;
    LDA.W #$001A                                                         ;8FE5C2;

  + STA.W $07E3                                                          ;8FE5C5;

.noEarthquakeChange:
    LDA.W $07E3                                                          ;8FE5C8;
    STA.W $183E                                                          ;8FE5CB;
    JSR.W GenerateRandomExplosionOnEveryFourthFrame                      ;8FE5CE;
    RTS                                                                  ;8FE5D1;


Room_State_Checking_Handler:
    TXA                                                                  ;8FE5D2;
    CLC                                                                  ;8FE5D3;
    ADC.W #$000B                                                         ;8FE5D4;
    TAX                                                                  ;8FE5D7;

.loop:
    LDA.W $0000,X                                                        ;8FE5D8;
    STA.W $07B7                                                          ;8FE5DB;
    INX                                                                  ;8FE5DE;
    INX                                                                  ;8FE5DF;
    PEA.W .loop-1                                                        ;8FE5E0;
    JMP.W ($07B7)                                                        ;8FE5E3;


Use_StatePointer_inX:
    STX.W $07BB                                                          ;8FE5E6;
    PLA                                                                  ;8FE5E9;
    RTL                                                                  ;8FE5EA;


UNUSED_RoomStateCheck_Door_8FE5EB:
    LDA.W $0000,X                                                        ;8FE5EB;
    CMP.W $078D                                                          ;8FE5EE;
    BNE +                                                                ;8FE5F1;
    LDA.W $0002,X                                                        ;8FE5F3;
    TAX                                                                  ;8FE5F6;
    JMP.W Use_StatePointer_inX                                           ;8FE5F7;


  + INX                                                                  ;8FE5FA;
    INX                                                                  ;8FE5FB;
    INX                                                                  ;8FE5FC;
    INX                                                                  ;8FE5FD;
    RTS                                                                  ;8FE5FE;


RoomStateCheck_MainAreaBossIsDead:
    LDA.W #$0001                                                         ;8FE5FF;
    JSL.L CheckIfBossBitsForCurrentAreaMatchAnyBitsInA                   ;8FE602;
    BCC +                                                                ;8FE606;
    LDA.W $0000,X                                                        ;8FE608;
    TAX                                                                  ;8FE60B;
    JMP.W Use_StatePointer_inX                                           ;8FE60C;


  + INX                                                                  ;8FE60F;
    INX                                                                  ;8FE610;
    RTS                                                                  ;8FE611;


RoomStateCheck_EventHasBeenSet:
    LDA.W $0000,X                                                        ;8FE612;
    AND.W #$00FF                                                         ;8FE615;
    JSL.L CheckIfEvent_inA_HasHappened                                   ;8FE618;
    BCC +                                                                ;8FE61C;
    LDA.W $0001,X                                                        ;8FE61E;
    TAX                                                                  ;8FE621;
    JMP.W Use_StatePointer_inX                                           ;8FE622;


  + INX                                                                  ;8FE625;
    INX                                                                  ;8FE626;
    INX                                                                  ;8FE627;
    RTS                                                                  ;8FE628;


RoomStateCheck_BossIsDead:
    LDA.W $0000,X                                                        ;8FE629;
    AND.W #$00FF                                                         ;8FE62C;
    JSL.L CheckIfBossBitsForCurrentAreaMatchAnyBitsInA                   ;8FE62F;
    BCC +                                                                ;8FE633;
    LDA.W $0001,X                                                        ;8FE635;
    TAX                                                                  ;8FE638;
    JMP.W Use_StatePointer_inX                                           ;8FE639;


  + INX                                                                  ;8FE63C;
    INX                                                                  ;8FE63D;
    INX                                                                  ;8FE63E;
    RTS                                                                  ;8FE63F;


UNUSED_RoomStateCheck_Morphball_8FE640:
    LDA.W Equipment.collectedItems                                       ;8FE640;
    AND.W #$0004                                                         ;8FE643;
    BEQ +                                                                ;8FE646;
    LDA.W $0000,X                                                        ;8FE648;
    TAX                                                                  ;8FE64B;
    JMP.W Use_StatePointer_inX                                           ;8FE64C;


  + INX                                                                  ;8FE64F;
    INX                                                                  ;8FE650;
    RTS                                                                  ;8FE651;


RoomStateCheck_MorphballAndMissiles:
    LDA.W Equipment.collectedItems                                       ;8FE652;
    BIT.W #$0004                                                         ;8FE655;
    BEQ +                                                                ;8FE658;
    LDA.W Equipment.maxMissiles                                          ;8FE65A;
    BEQ +                                                                ;8FE65D;
    LDA.W $0000,X                                                        ;8FE65F;
    TAX                                                                  ;8FE662;
    JMP.W Use_StatePointer_inX                                           ;8FE663;


  + INX                                                                  ;8FE666;
    INX                                                                  ;8FE667;
    RTS                                                                  ;8FE668;


RoomStateCheck_PowerBombs:
    LDA.W Equipment.maxPowerBombs                                        ;8FE669;
    BEQ +                                                                ;8FE66C;
    LDA.W $0000,X                                                        ;8FE66E;
    TAX                                                                  ;8FE671;
    JMP.W Use_StatePointer_inX                                           ;8FE672;


  + INX                                                                  ;8FE675;
    INX                                                                  ;8FE676;
    RTS                                                                  ;8FE677;


UNUSED_RoomStateCheck_SpeedBooster_8FE678:
    LDA.W Equipment.collectedItems                                       ;8FE678;
    AND.W #$2000                                                         ;8FE67B;
    BEQ +                                                                ;8FE67E;
    LDA.W $0000,X                                                        ;8FE680;
    TAX                                                                  ;8FE683;
    JMP.W Use_StatePointer_inX                                           ;8FE684;


  + INX                                                                  ;8FE687;
    INX                                                                  ;8FE688;
    RTS                                                                  ;8FE689;


Door_Closing_PLMs:
    dw $0000                                                             ;8FE68A;
    dw $0000                                                             ;8FE68C;
    dw $0000                                                             ;8FE68E;
    dw $0000                                                             ;8FE690;
    dw PLMEntries_blueDoorClosingFacingRight                             ;8FE692;
    dw PLMEntries_blueDoorClosingFacingLeft                              ;8FE694;
    dw PLMEntries_blueDoorClosingFacingDown                              ;8FE696;
    dw PLMEntries_blueDoorClosingFacingUp                                ;8FE698;
    dw PLMEntries_gateThatClosesInEscapeRoom1_PLM                        ;8FE69A;
    dw PLMEntries_gateThatClosesInEscapeRoom1_PLM                        ;8FE69C;
    dw PLMEntries_gateThatClosesInEscapeRoom1_PLM                        ;8FE69E;
    dw PLMEntries_gateThatClosesInEscapeRoom1_PLM                        ;8FE6A0;

Tileset_Table_0_UpperCrateria:
    dl TileTables_0_1_UpperCrateria                                      ;8FE6A2;
    dl Tiles_0_1_UpperCrateria                                           ;8FE6A5;
    dl Palettes_0_UpperCrateria                                          ;8FE6A8;

Tileset_Table_1_RedCrateria:
    dl TileTables_0_1_UpperCrateria                                      ;8FE6AB;
    dl Tiles_0_1_UpperCrateria                                           ;8FE6AE;
    dl Palettes_1_RedCrateria                                            ;8FE6B1;

Tileset_Table_2_LowerCrateria:
    dl TileTables_2_3_LowerCrateria                                      ;8FE6B4;
    dl Tiles_2_3_LowerCrateria                                           ;8FE6B7;
    dl Palettes_2_LowerCrateria                                          ;8FE6BA;

Tileset_Table_3_OldTourian:
    dl TileTables_2_3_LowerCrateria                                      ;8FE6BD;
    dl Tiles_2_3_LowerCrateria                                           ;8FE6C0;
    dl Palettes_3_OldTourian                                             ;8FE6C3;

Tileset_Table_4_WreckedShip_PowerOn:
    dl TileTables_4_5_WreckedShip                                        ;8FE6C6;
    dl Tiles_4_5_WreckedShip                                             ;8FE6C9;
    dl Palettes_4_WreckedShip_PowerOn                                    ;8FE6CC;

Tileset_Table_5_WreckedShip_PowerOff:
    dl TileTables_4_5_WreckedShip                                        ;8FE6CF;
    dl Tiles_4_5_WreckedShip                                             ;8FE6D2;
    dl Palettes_5_WreckedShip_PowerOff                                   ;8FE6D5;

Tileset_Table_6_GreenBlueBrinstar:
    dl TileTables_6_GreenBlueBrinstar                                    ;8FE6D8;
    dl Tiles_6_GreenBlueBrinstar                                         ;8FE6DB;
    dl Palettes_6_GreenBlueBrinstar                                      ;8FE6DE;

Tileset_Table_7_RedBrinstar_Kraid:
    dl TileTables_7_8_RedBrinstar_Kraid_StatuesHall                      ;8FE6E1;
    dl Tiles_7_8_RedBrinstar_Kraid_StatuesHall                           ;8FE6E4;
    dl Palettes_7_RedBrinstar_Kraid                                      ;8FE6E7;

Tileset_Table_8_StatuesHall:
    dl TileTables_7_8_RedBrinstar_Kraid_StatuesHall                      ;8FE6EA;
    dl Tiles_7_8_RedBrinstar_Kraid_StatuesHall                           ;8FE6ED;
    dl Palettes_8_StatuesHall                                            ;8FE6F0;

Tileset_Table_9_HeatedNorfair:
    dl TileTables_9_A_Norfair                                            ;8FE6F3;
    dl Tiles_9_A_Norfair                                                 ;8FE6F6;
    dl Palettes_9_HeatedNorfair                                          ;8FE6F9;

Tileset_Table_A_UnheatedNofair:
    dl TileTables_9_A_Norfair                                            ;8FE6FC;
    dl Tiles_9_A_Norfair                                                 ;8FE6FF;
    dl Palettes_A_UnheatedNorfair                                        ;8FE702;

Tileset_Table_B_SandlessMaridia:
    dl TileTables_B_SandlessMaridia                                      ;8FE705;
    dl Tiles_B_SandlessMaridia                                           ;8FE708;
    dl Palettes_B_SandlessMaridia                                        ;8FE70B;

Tileset_Table_C_SandyMaridia:
    dl TileTables_C_SandyMaridia                                         ;8FE70E;
    dl Tiles_C_SandyMaridia                                              ;8FE711;
    dl Palettes_C_SandyMaridia                                           ;8FE714;

Tileset_Table_D_Tourian:
    dl TileTables_D_E_Tourian                                            ;8FE717;
    dl Tiles_D_E_Tourian                                                 ;8FE71A;
    dl Palettes_D_Tourian                                                ;8FE71D;

Tileset_Table_E_MotherBrain:
    dl TileTables_D_E_Tourian                                            ;8FE720;
    dl Tiles_D_E_Tourian                                                 ;8FE723;
    dl Palettes_E_MotherBrain                                            ;8FE726;

Tileset_Table_F_BlueCeres:
    dl TileTables_F_10_11_12_13_14_Ceres                                 ;8FE729;
    dl Tiles_F_10_Ceres                                                  ;8FE72C;
    dl Palettes_F_11_13_BlueCeres                                        ;8FE72F;

Tileset_Table_10_WhiteCeres:
    dl TileTables_F_10_11_12_13_14_Ceres                                 ;8FE732;
    dl Tiles_F_10_Ceres                                                  ;8FE735;
    dl Palettes_10_12_14_WhiteCeres                                      ;8FE738;

Tileset_Table_11_BlueCeresElevator:
    dl TileTables_F_10_11_12_13_14_Ceres                                 ;8FE73B;
    dl Tiles_11_12_CeresElevator                                         ;8FE73E;
    dl Palettes_F_11_13_BlueCeres                                        ;8FE741;

Tileset_Table_12_WhiteCeresElevator:
    dl TileTables_F_10_11_12_13_14_Ceres                                 ;8FE744;
    dl Tiles_11_12_CeresElevator                                         ;8FE747;
    dl Palettes_10_12_14_WhiteCeres                                      ;8FE74A;

Tileset_Table_13_BlueCeresRidley:
    dl TileTables_F_10_11_12_13_14_Ceres                                 ;8FE74D;
    dl Tiles_13_14_CeresRidley                                           ;8FE750;
    dl Palettes_F_11_13_BlueCeres                                        ;8FE753;

Tileset_Table_14_WhiteCeresRidley:
    dl TileTables_F_10_11_12_13_14_Ceres                                 ;8FE756;
    dl Tiles_13_14_CeresRidley                                           ;8FE759;
    dl Palettes_10_12_14_WhiteCeres                                      ;8FE75C;

Tileset_Table_15_Map_Statues:
    dl TileTables_15_16_17_18_19_UtilityRoom_Statues                     ;8FE75F;
    dl Tiles_15_16_17_18_19_UtilityRoom_Statues                          ;8FE762;
    dl Palettes_Map_Statues                                              ;8FE765;

Tileset_Table_16_WreckedShipMap_PowerOff:
    dl TileTables_15_16_17_18_19_UtilityRoom_Statues                     ;8FE768;
    dl Tiles_15_16_17_18_19_UtilityRoom_Statues                          ;8FE76B;
    dl Palettes_16_WreckedShipMap_PowerOff                               ;8FE76E;

Tileset_Table_17_BlueRefill:
    dl TileTables_15_16_17_18_19_UtilityRoom_Statues                     ;8FE771;
    dl Tiles_15_16_17_18_19_UtilityRoom_Statues                          ;8FE774;
    dl Palettes_17_BlueRefill                                            ;8FE777;

Tileset_Table_18_YellowRefill:
    dl TileTables_15_16_17_18_19_UtilityRoom_Statues                     ;8FE77A;
    dl Tiles_15_16_17_18_19_UtilityRoom_Statues                          ;8FE77D;
    dl Palettes_18_YellowRefill                                          ;8FE780;

Tileset_Table_19_SaveStation:
    dl TileTables_15_16_17_18_19_UtilityRoom_Statues                     ;8FE783;
    dl Tiles_15_16_17_18_19_UtilityRoom_Statues                          ;8FE786;
    dl Palettes_19_SaveStation                                           ;8FE789;

Tileset_Table_1A_Kraid:
    dl TileTables_1A_Kraid                                               ;8FE78C;
    dl Tiles_1A_Kraid                                                    ;8FE78F;
    dl Palettes_1A_Kraid                                                 ;8FE792;

Tileset_Table_1B_Crocomire:
    dl TileTables_1B_Crocomire                                           ;8FE795;
    dl Tiles_1B_Crocomire                                                ;8FE798;
    dl Palettes_1B_Crocomire                                             ;8FE79B;

Tileset_Table_1C_Draygon:
    dl TileTables_1C_Draygon                                             ;8FE79E;
    dl Tiles_1C_Draygon                                                  ;8FE7A1;
    dl Palettes_1C_Draygon                                               ;8FE7A4;

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
    dw Tileset_Table_A_UnheatedNofair                                    ;8FE7BB;
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

Music_Pointers:
    dl SPC_Engine                                                        ;8FE7E1;
    dl Music_TitleSequence                                               ;8FE7E4;
    dl Music_EmptyCrateria                                               ;8FE7E7;
    dl Music_LowerCrateria                                               ;8FE7EA;
    dl Music_UpperCrateria                                               ;8FE7ED;
    dl Music_GreenBrinstar                                               ;8FE7F0;
    dl Music_RedBrinstar                                                 ;8FE7F3;
    dl Music_UpperNofair                                                 ;8FE7F6;
    dl Music_LowerNorfair                                                ;8FE7F9;
    dl Music_Maridia                                                     ;8FE7FC;
    dl Music_Tourian                                                     ;8FE7FF;
    dl Music_MotherBrain                                                 ;8FE802;
    dl Music_BossFight1                                                  ;8FE805;
    dl Music_BossFight2                                                  ;8FE808;
    dl Music_MiniBossFight                                               ;8FE80B;
    dl Music_Ceres                                                       ;8FE80E;
    dl Music_WreckedShip                                                 ;8FE811;
    dl Music_ZebesExplosion                                              ;8FE814;
    dl Music_Intro                                                       ;8FE817;
    dl Music_Death                                                       ;8FE81A;
    dl Music_Credits                                                     ;8FE81D;
    dl Music_TheLastMetroidIsInCaptivity                                 ;8FE820;
    dl Music_TheGalaxyIsAtPeace                                          ;8FE823;
    dl Music_BabyMetroid_BossFight2                                      ;8FE826;
    dl Music_SamusTheme_UpperCrateria                                    ;8FE829;

RoomHeader_Debug:
    db $00,$07,$00,$00,$06,$02,$70,$A0,$00                               ;8FE82C;
    dw RoomDoors_Debug                                                   ;8FE835;
    dw Use_StatePointer_inX                                              ;8FE837;

RoomState_Debug:
    dl LevelData_DebugRoom                                               ;8FE839;
    db $0B,$00,$00                                                       ;8FE83C;
    dw FXHeader_Debug_MotherBrain_State2                                 ;8FE83F;
    dw EnemyPopulations_Debug                                            ;8FE841;
    dw EnemySets_Debug                                                   ;8FE843;
    dw $C1C1,$0001,$0000,$0000                                           ;8FE845;
    dw RoomPLM_Debug                                                     ;8FE84D;
    dw LibBG_WreckedShip_4_5_EntranceHall                                ;8FE84F;
    dw $0000                                                             ;8FE851;

RoomDoors_Debug:
    dw UNUSED_Door_Debug_0_83ABC4                                        ;8FE853;
    dw UNUSED_Door_Debug_1_83ABCF                                        ;8FE855;
    dw UNUSED_Door_Debug_2_83ABDA                                        ;8FE857;
    dw UNUSED_Door_Debug_3_83ABE5                                        ;8FE859;

UNUSED_LibraryBackground_8FE85B:
    dw $0002                                                             ;8FE85B;
    dl FX_Layer3_Tilemaps_water                                          ;8FE85D;
    dw $5880,$0F00,$0004                                                 ;8FE860;
    dl Background_Crateria_0_Rocks                                       ;8FE866;
    dw $4000,$0002                                                       ;8FE869;
    dl $7E4000                                                           ;8FE86D;
    dw $4800,$0800,$0002                                                 ;8FE870;
    dl $7E4000                                                           ;8FE876;
    dw $4C00,$0800,$0000                                                 ;8FE879;

RoomPLM_Debug:
    db $00,$00                                                           ;8FE87F;

UNUSED_UnknownUnreferenced_8FE881:
    dw $009E,$00AD,$0081,$0001,$0004,$0002,$0000                         ;8FE881;

Execute_Room_Setup_ASM:
    PHP                                                                  ;8FE88F;
    PHB                                                                  ;8FE890;
    REP #$30                                                             ;8FE891;
    LDX.W $07BB                                                          ;8FE893;
    LDA.W $0018,X                                                        ;8FE896;
    BEQ .return                                                          ;8FE899;
    PHK                                                                  ;8FE89B;
    PLB                                                                  ;8FE89C;
    JSR.W ($0018,X)                                                      ;8FE89D;

.return:
    PLB                                                                  ;8FE8A0;
    PLP                                                                  ;8FE8A1;
    RTL                                                                  ;8FE8A2;


Execute_Door_ASM:
    PHP                                                                  ;8FE8A3;
    PHB                                                                  ;8FE8A4;
    REP #$30                                                             ;8FE8A5;
    LDX.W $078D                                                          ;8FE8A7;
    LDA.L $83000A,X                                                      ;8FE8AA;
    BEQ .return                                                          ;8FE8AE;
    STA.B $12                                                            ;8FE8B0;
    PHK                                                                  ;8FE8B2;
    PLB                                                                  ;8FE8B3;
    PEA.W .return-1                                                      ;8FE8B4;
    JMP.W ($0012)                                                        ;8FE8B7;


.return:
    PLB                                                                  ;8FE8BA;
    PLP                                                                  ;8FE8BB;
    RTL                                                                  ;8FE8BC;


Execute_Room_Main_ASM:
    LDX.W $07DF                                                          ;8FE8BD;
    BEQ .return                                                          ;8FE8C0;
    PHB                                                                  ;8FE8C2;
    PHK                                                                  ;8FE8C3;
    PLB                                                                  ;8FE8C4;
    LDX.W #$0000                                                         ;8FE8C5;
    JSR.W ($07DF,X)                                                      ;8FE8C8;
    PLB                                                                  ;8FE8CB;

.return:
    RTL                                                                  ;8FE8CC;


MainASM_CrocomiresRoomShaking:
    LDA.W $0F86                                                          ;8FE8CD;
    BIT.W #$0200                                                         ;8FE8D0;
    BNE .return                                                          ;8FE8D3;
    LDA.W $0FA8                                                          ;8FE8D5;
    CMP.W #$0040                                                         ;8FE8D8;
    BEQ .behindWallRumbling                                              ;8FE8DB;
    LDA.W $0FAA                                                          ;8FE8DD;
    BIT.W #$0400                                                         ;8FE8E0;
    BEQ .branch                                                          ;8FE8E3;
    LDA.W $0FEE                                                          ;8FE8E5;
    DEC A                                                                ;8FE8E8;
    STA.W $0FEE                                                          ;8FE8E9;
    CMP.W #$FFF9                                                         ;8FE8EC;
    BMI +                                                                ;8FE8EF;
    LDA.W $0FEE                                                          ;8FE8F1;
    BRA .scroll                                                          ;8FE8F4;


  + LDA.W #$0007                                                         ;8FE8F6;
    CLC                                                                  ;8FE8F9;
    ADC.W $0FEE                                                          ;8FE8FA;
    ASL A                                                                ;8FE8FD;
    STA.B $12                                                            ;8FE8FE;
    LDA.W $0FEE                                                          ;8FE900;
    SEC                                                                  ;8FE903;
    SBC.B $12                                                            ;8FE904;

.scroll:
    STA.B $12                                                            ;8FE906;
    CLC                                                                  ;8FE908;
    ADC.B $B3                                                            ;8FE909;
    STA.B $B3                                                            ;8FE90B;
    LDA.W #$FFD0                                                         ;8FE90D;
    CLC                                                                  ;8FE910;
    ADC.B $12                                                            ;8FE911;
    STA.B $B7                                                            ;8FE913;

.return:
    RTS                                                                  ;8FE915;


.branch:
    LDA.W $0FAC                                                          ;8FE916;
    CMP.W #$0022                                                         ;8FE919;
    BNE .return                                                          ;8FE91C;
    LDA.W $0FAE                                                          ;8FE91E;
    BEQ .return                                                          ;8FE921;
    DEC A                                                                ;8FE923;
    STA.W $0FAE                                                          ;8FE924;
    BIT.W #$0001                                                         ;8FE927;
    BNE +                                                                ;8FE92A;
    LDA.W $0911                                                          ;8FE92C;
    CLC                                                                  ;8FE92F;
    ADC.W #$0004                                                         ;8FE930;
    STA.W $0911                                                          ;8FE933;
    RTS                                                                  ;8FE936;


  + LDA.W $0911                                                          ;8FE937;
    SEC                                                                  ;8FE93A;
    SBC.W #$0004                                                         ;8FE93B;
    STA.W $0911                                                          ;8FE93E;
    RTS                                                                  ;8FE941;


.behindWallRumbling:
    LDA.W $0915                                                          ;8FE942;
    CLC                                                                  ;8FE945;
    ADC.W $091F                                                          ;8FE946;
    CLC                                                                  ;8FE949;
    ADC.W $0FEE                                                          ;8FE94A;
    STA.B $B3                                                            ;8FE94D;
    RTS                                                                  ;8FE94F;


MainASM_RidleysRoomShaking:
    LDA.W $10A8                                                          ;8FE950;
    BEQ .return                                                          ;8FE953;
    DEC A                                                                ;8FE955;
    STA.W $10A8                                                          ;8FE956;
    ASL A                                                                ;8FE959;
    TAX                                                                  ;8FE95A;
    LDA.B $B1                                                            ;8FE95B;
    ADC.W .Xspeeds,X                                                     ;8FE95D;
    STA.B $B1                                                            ;8FE960;
    LDA.B $B5                                                            ;8FE962;
    CLC                                                                  ;8FE964;
    ADC.W .Xspeeds,X                                                     ;8FE965;
    STA.B $B5                                                            ;8FE968;
    LDA.B $B3                                                            ;8FE96A;
    CLC                                                                  ;8FE96C;
    ADC.W .Yspeeds,X                                                     ;8FE96D;
    STA.B $B3                                                            ;8FE970;
    LDA.B $B7                                                            ;8FE972;
    CLC                                                                  ;8FE974;
    ADC.W .Yspeeds,X                                                     ;8FE975;
    STA.B $B7                                                            ;8FE978;

.return:
    RTS                                                                  ;8FE97A;


.Xspeeds:
    dw $0000,$0002,$0002,$0002,$0000,$FFFE,$FFFE,$FFFE                   ;8FE97B;

.Yspeeds:
    dw $FFFE,$FFFE,$0000,$0002,$0002,$0002,$0000,$FFFE                   ;8FE98B;

Freespace_Bank8F_E99B:                                                   ;8FE99B;
; $1665 bytes
