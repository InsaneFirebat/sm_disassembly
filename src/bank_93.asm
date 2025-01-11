
org $938000


InitializeProjectile:
    PHP                                                                  ;938000;
    PHB                                                                  ;938001;
    PHK                                                                  ;938002;
    PLB                                                                  ;938003;
    REP #$30                                                             ;938004;
    LDA.W $0C04,X                                                        ;938006;
    AND.W #$000F                                                         ;938009;
    ASL A                                                                ;93800C;
    STA.B $12                                                            ;93800D;
    LDA.W $0C18,X                                                        ;93800F;
    BIT.W #$0F00                                                         ;938012;
    BNE .notBeam                                                         ;938015;
    BIT.W #$0010                                                         ;938017;
    BNE .charged                                                         ;93801A;
    AND.W #$000F                                                         ;93801C;
    ASL A                                                                ;93801F;
    TAY                                                                  ;938020;
    LDA.W SamusProjectileDataPointers_UnchargedBeams,Y                   ;938021;
    TAY                                                                  ;938024;
    BRA .merge                                                           ;938025;


.charged:
    AND.W #$000F                                                         ;938027;
    ASL A                                                                ;93802A;
    TAY                                                                  ;93802B;
    LDA.W SamusProjectileDataPointers_ChargedBeams,Y                     ;93802C;
    TAY                                                                  ;93802F;
    BRA .merge                                                           ;938030;


.notBeam:
    XBA                                                                  ;938032;
    AND.W #$000F                                                         ;938033;
    ASL A                                                                ;938036;
    TAY                                                                  ;938037;
    LDA.W SamusProjectileDataPointers_NonBeam,Y                          ;938038;
    TAY                                                                  ;93803B;

.merge:
    LDA.W $0000,Y                                                        ;93803C;
    STA.W $0C2C,X                                                        ;93803F;
    BPL .dontCrash                                                       ;938042;
    JML.L Crash_Handler                                                  ;938044;


.dontCrash:
    INY                                                                  ;938048;
    INY                                                                  ;938049;
    TYA                                                                  ;93804A;
    CLC                                                                  ;93804B;
    ADC.B $12                                                            ;93804C;
    TAY                                                                  ;93804E;
    LDA.W $0000,Y                                                        ;93804F;
    STA.W $0C40,X                                                        ;938052;
    TAY                                                                  ;938055;
    LDA.W $0004,Y                                                        ;938056;
    AND.W #$00FF                                                         ;938059;
    STA.W $0BB4,X                                                        ;93805C;
    LDA.W $0005,Y                                                        ;93805F;
    AND.W #$00FF                                                         ;938062;
    STA.W $0BC8,X                                                        ;938065;
    LDA.W #$0001                                                         ;938068;
    STA.W $0C54,X                                                        ;93806B;
    PLB                                                                  ;93806E;
    PLP                                                                  ;93806F;
    RTL                                                                  ;938070;


InitializeSuperMissileLink:
    PHP                                                                  ;938071;
    PHB                                                                  ;938072;
    PHK                                                                  ;938073;
    PLB                                                                  ;938074;
    REP #$30                                                             ;938075;
    LDA.W $0C19,X                                                        ;938077;
    AND.W #$000F                                                         ;93807A;
    ASL A                                                                ;93807D;
    TAY                                                                  ;93807E;
    LDA.W SamusProjectileDataPointers_SuperMissileLink,Y                 ;93807F;
    TAY                                                                  ;938082;
    LDA.W $0000,Y                                                        ;938083;
    STA.W $0C2C,X                                                        ;938086;
    BPL .dontCrash                                                       ;938089;
    JML.L Crash_Handler                                                  ;93808B;


.dontCrash:
    INY                                                                  ;93808F;
    INY                                                                  ;938090;
    LDA.W $0000,Y                                                        ;938091;
    STA.W $0C40,X                                                        ;938094;
    LDA.W #$0001                                                         ;938097;
    STA.W $0C54,X                                                        ;93809A;
    PLB                                                                  ;93809D;
    PLP                                                                  ;93809E;
    RTL                                                                  ;93809F;


InitializeBomb:
    PHP                                                                  ;9380A0;
    PHB                                                                  ;9380A1;
    PHK                                                                  ;9380A2;
    PLB                                                                  ;9380A3;
    REP #$30                                                             ;9380A4;
    LDA.W $0C19,X                                                        ;9380A6;
    AND.W #$000F                                                         ;9380A9;
    ASL A                                                                ;9380AC;
    TAY                                                                  ;9380AD;
    LDA.W SamusProjectileDataPointers_NonBeam,Y                          ;9380AE;
    TAY                                                                  ;9380B1;
    LDA.W $0000,Y                                                        ;9380B2;
    STA.W $0C2C,X                                                        ;9380B5;
    BPL .dontCrash                                                       ;9380B8;
    JML.L Crash_Handler                                                  ;9380BA;


.dontCrash:
    INY                                                                  ;9380BE;
    INY                                                                  ;9380BF;
    LDA.W $0000,Y                                                        ;9380C0;
    STA.W $0C40,X                                                        ;9380C3;
    LDA.W #$0001                                                         ;9380C6;
    STA.W $0C54,X                                                        ;9380C9;
    PLB                                                                  ;9380CC;
    PLP                                                                  ;9380CD;
    RTL                                                                  ;9380CE;


PartOfKillProjectile_QueueSFX_SetInstruction:
    PHP                                                                  ;9380CF;
    PHB                                                                  ;9380D0;
    PHK                                                                  ;9380D1;
    PLB                                                                  ;9380D2;
    REP #$30                                                             ;9380D3;
    LDA.W $0C18,X                                                        ;9380D5;
    BIT.W #$0F00                                                         ;9380D8;
    BNE .notBeam                                                         ;9380DB;
    LDA.W $0C18,X                                                        ;9380DD;
    AND.W #$F0FF                                                         ;9380E0;
    ORA.W #$0700                                                         ;9380E3;
    STA.W $0C18,X                                                        ;9380E6;
    LDA.W ProjectileDataTable_NonBeam_BeamExplosion_pointer              ;9380E9;
    STA.W $0C40,X                                                        ;9380EC;
    LDA.W #$000C                                                         ;9380EF;
    JSL.L QueueSound_Lib2_Max6                                           ;9380F2;
    BRA .return                                                          ;9380F6;


.notBeam:
    LDA.W $1F51                                                          ;9380F8;
    BNE .setExplosion                                                    ;9380FB;
    LDA.W #$0007                                                         ;9380FD;
    JSL.L QueueSound_Lib2_Max6                                           ;938100;

.setExplosion:
    LDA.W $0C18,X                                                        ;938104;
    PHA                                                                  ;938107;
    AND.W #$F0FF                                                         ;938108;
    ORA.W #$0800                                                         ;93810B;
    STA.W $0C18,X                                                        ;93810E;
    PLA                                                                  ;938111;
    BIT.W #$0200                                                         ;938112;
    BNE .superMissile                                                    ;938115;
    LDA.W ProjectileDataTable_NonBeam_MissileExplosion_pointer           ;938117;
    STA.W $0C40,X                                                        ;93811A;
    BRA .setCooldown                                                     ;93811D;


.superMissile:
    LDA.W ProjectileDataTable_NonBeam_SuperMissileExplosion_pointer      ;93811F;
    STA.W $0C40,X                                                        ;938122;
    LDA.W #$0014                                                         ;938125;
    STA.W $183E                                                          ;938128;
    LDA.W #$001E                                                         ;93812B;
    STA.W $1840                                                          ;93812E;

.setCooldown:
    LDA.W $0CCC                                                          ;938131;
    CMP.W #$0015                                                         ;938134;
    BMI .return                                                          ;938137;
    LDA.W #$0014                                                         ;938139;
    STA.W $0CCC                                                          ;93813C;

.return:
    LDA.W #$0001                                                         ;93813F;
    STA.W $0C54,X                                                        ;938142;
    LDA.W #$0008                                                         ;938145;
    STA.W $0C2C,X                                                        ;938148;
    PLB                                                                  ;93814B;
    PLP                                                                  ;93814C;
    RTL                                                                  ;93814D;


Initialize_Bomb_Explosion:
    PHP                                                                  ;93814E;
    PHB                                                                  ;93814F;
    PHK                                                                  ;938150;
    PLB                                                                  ;938151;
    REP #$30                                                             ;938152;
    LDA.W ProjectileDataTable_NonBeam_BombExplosion_pointer              ;938154;
    STA.W $0C40,X                                                        ;938157;
    LDA.W #$0001                                                         ;93815A;
    STA.W $0C54,X                                                        ;93815D;
    PLB                                                                  ;938160;
    PLP                                                                  ;938161;
    RTL                                                                  ;938162;


Initialize_ShinesparkEcho_or_SpazerSBATrailProjectile:
    PHP                                                                  ;938163;
    PHB                                                                  ;938164;
    PHK                                                                  ;938165;
    PLB                                                                  ;938166;
    REP #$30                                                             ;938167;
    LDA.W $0C04,X                                                        ;938169;
    AND.W #$000F                                                         ;93816C;
    ASL A                                                                ;93816F;
    STA.B $12                                                            ;938170;
    LDA.W $0C18,X                                                        ;938172;
    AND.W #$00FF                                                         ;938175;
    SEC                                                                  ;938178;
    SBC.W #$0022                                                         ;938179;
    ASL A                                                                ;93817C;
    TAY                                                                  ;93817D;
    LDA.W SamusProjectileDataPointers_ShinesparkEcho_SpazerSBATrail,Y    ;93817E;
    TAY                                                                  ;938181;
    LDA.W $0000,Y                                                        ;938182;
    STA.W $0C2C,X                                                        ;938185;
    BPL .dontCrash                                                       ;938188;
    JML.L Crash_Handler                                                  ;93818A;


.dontCrash:
    INY                                                                  ;93818E;
    INY                                                                  ;93818F;
    TYA                                                                  ;938190;
    CLC                                                                  ;938191;
    ADC.B $12                                                            ;938192;
    TAY                                                                  ;938194;
    LDA.W $0000,Y                                                        ;938195;
    STA.W $0C40,X                                                        ;938198;
    LDA.W #$0001                                                         ;93819B;
    STA.W $0C54,X                                                        ;93819E;
    PLB                                                                  ;9381A1;
    PLP                                                                  ;9381A2;
    RTL                                                                  ;9381A3;


InitializeSBAProjectile:
    PHP                                                                  ;9381A4;
    PHB                                                                  ;9381A5;
    PHK                                                                  ;9381A6;
    PLB                                                                  ;9381A7;
    REP #$30                                                             ;9381A8;
    LDA.W $0C18,X                                                        ;9381AA;
    AND.W #$000F                                                         ;9381AD;
    ASL A                                                                ;9381B0;
    TAY                                                                  ;9381B1;
    LDA.W SamusProjectileDataPointers_SBA,Y                              ;9381B2;
    TAY                                                                  ;9381B5;
    LDA.W $0000,Y                                                        ;9381B6;
    STA.W $0C2C,X                                                        ;9381B9;
    BPL .dontCrash                                                       ;9381BC;
    JML.L Crash_Handler                                                  ;9381BE;


.dontCrash:
    LDA.W $0002,Y                                                        ;9381C2;
    STA.W $0C40,X                                                        ;9381C5;
    LDA.W #$0001                                                         ;9381C8;
    STA.W $0C54,X                                                        ;9381CB;
    PLB                                                                  ;9381CE;
    PLP                                                                  ;9381CF;
    RTL                                                                  ;9381D0;


Get_ProjectileTrailFrame:
    PHP                                                                  ;9381D1;
    PHB                                                                  ;9381D2;
    PHK                                                                  ;9381D3;
    PLB                                                                  ;9381D4;
    REP #$30                                                             ;9381D5;
    PHY                                                                  ;9381D7;
    LDA.W $0C40,X                                                        ;9381D8;
    SEC                                                                  ;9381DB;
    SBC.W #$0008                                                         ;9381DC;
    TAY                                                                  ;9381DF;
    LDA.W $0006,Y                                                        ;9381E0;
    STA.B $16                                                            ;9381E3;
    PLY                                                                  ;9381E5;
    PLB                                                                  ;9381E6;
    PLP                                                                  ;9381E7;
    RTL                                                                  ;9381E8;


ProjectileInstructionHandler:
    PHP                                                                  ;9381E9;
    PHB                                                                  ;9381EA;
    PHK                                                                  ;9381EB;
    PLB                                                                  ;9381EC;
    REP #$30                                                             ;9381ED;
    LDX.W $0DDE                                                          ;9381EF;
    DEC.W $0C54,X                                                        ;9381F2;
    BNE .return                                                          ;9381F5;
    LDY.W $0C40,X                                                        ;9381F7;

.loop:
    LDA.W $0000,Y                                                        ;9381FA;
    BPL .timer                                                           ;9381FD;
    STA.B $12                                                            ;9381FF;
    INY                                                                  ;938201;
    INY                                                                  ;938202;
    PEA.W .loop-1                                                        ;938203;
    JMP.W ($0012)                                                        ;938206;


.timer:
    STA.W $0C54,X                                                        ;938209;
    LDA.W $0002,Y                                                        ;93820C;
    STA.W $0CB8,X                                                        ;93820F;
    LDA.W $0004,Y                                                        ;938212;
    AND.W #$00FF                                                         ;938215;
    STA.W $0BB4,X                                                        ;938218;
    LDA.W $0005,Y                                                        ;93821B;
    AND.W #$00FF                                                         ;93821E;
    STA.W $0BC8,X                                                        ;938221;
    TYA                                                                  ;938224;
    CLC                                                                  ;938225;
    ADC.W #$0008                                                         ;938226;
    STA.W $0C40,X                                                        ;938229;

.return:
    PLB                                                                  ;93822C;
    PLP                                                                  ;93822D;
    RTL                                                                  ;93822E;


Instruction_SamusProjectile_Delete:
    REP #$30                                                             ;93822F;
    JSL.L Clear_Projectile                                               ;938231;
    PLA                                                                  ;938235;
    PLB                                                                  ;938236;
    PLP                                                                  ;938237;
    RTL                                                                  ;938238;


Instruction_SamusProjectile_GotoY:
    REP #$30                                                             ;938239;
    LDA.W $0000,Y                                                        ;93823B;
    TAY                                                                  ;93823E;
    RTS                                                                  ;93823F;


UNUSED_Instruction_SamusProj_GotoY_BasedOnBombTimer_938240:
    REP #$30                                                             ;938240;
    LDA.W $0000,Y                                                        ;938242;
    CMP.W $0C7C,X                                                        ;938245;
    BPL .lessThanY                                                       ;938248;
    LDA.W $0004,Y                                                        ;93824A;
    TAY                                                                  ;93824D;
    RTS                                                                  ;93824E;


.lessThanY:
    LDA.W $0002,Y                                                        ;93824F;
    TAY                                                                  ;938252;
    RTS                                                                  ;938253;


DrawProjectiles:
    PHP                                                                  ;938254;
    REP #$30                                                             ;938255;
    LDX.W #$0008                                                         ;938257;
    STX.W $0DDE                                                          ;93825A;

.loop:
    LDA.W $0C40,X                                                        ;93825D;
    BNE +                                                                ;938260;
    JMP.W .next                                                          ;938262;


  + LDA.W $0C18,X                                                        ;938265;
    BIT.W #$0F10                                                         ;938268;
    BNE .noFlickering                                                    ;93826B;
    BIT.W #$000C                                                         ;93826D;
    BNE .spazerPlasma                                                    ;938270;
    TXA                                                                  ;938272;
    BIT.W #$0002                                                         ;938273;
    BNE +                                                                ;938276;
    LDA.W $05B6                                                          ;938278;
    BIT.W #$0001                                                         ;93827B;
    BNE .draw                                                            ;93827E;
    BRA .next                                                            ;938280;


  + LDA.W $05B6                                                          ;938282;
    BIT.W #$0001                                                         ;938285;
    BNE .next                                                            ;938288;
    BRA .draw                                                            ;93828A;


.spazerPlasma:
    TXA                                                                  ;93828C;
    BIT.W #$0002                                                         ;93828D;
    BNE +                                                                ;938290;
    LDA.W $05B6                                                          ;938292;
    BIT.W #$0002                                                         ;938295;
    BNE .next                                                            ;938298;
    BRA .draw                                                            ;93829A;


  + LDA.W $05B6                                                          ;93829C;
    BIT.W #$0002                                                         ;93829F;
    BEQ .next                                                            ;9382A2;
    BRA .draw                                                            ;9382A4;


.noFlickering:
    AND.W #$0F00                                                         ;9382A6;
    CMP.W #$0300                                                         ;9382A9;
    BPL .next                                                            ;9382AC;

.draw:
    LDA.W $093F                                                          ;9382AE;
    BPL .noRotation                                                      ;9382B1;
    JSL.L Calculate_ProjectilePosition_InRotatingElevatorRoom            ;9382B3;
    LDA.B $12                                                            ;9382B7;
    BRA .positionCalculated                                              ;9382B9;


.noRotation:
    LDA.W $0B64,X                                                        ;9382BB;
    SEC                                                                  ;9382BE;
    SBC.W $0911                                                          ;9382BF;
    STA.B $14                                                            ;9382C2;
    LDA.W $0B78,X                                                        ;9382C4;
    SEC                                                                  ;9382C7;
    SBC.W $0915                                                          ;9382C8;
    STA.B $12                                                            ;9382CB;

.positionCalculated:
    AND.W #$FF00                                                         ;9382CD;
    BNE +                                                                ;9382D0;
    LDA.W $0CB8,X                                                        ;9382D2;
    BPL .loadIndex                                                       ;9382D5;
    JSL.L AddProjectileSpritemapToOAM                                    ;9382D7;
    BRA .loadIndex                                                       ;9382DB;


  + LDA.W $0CB8,X                                                        ;9382DD;
    BPL .loadIndex                                                       ;9382E0;
    JSL.L RTL_818AB7                                                     ;9382E2;

.loadIndex:
    LDX.W $0DDE                                                          ;9382E6;

.next:
    DEX                                                                  ;9382E9;
    DEX                                                                  ;9382EA;
    STX.W $0DDE                                                          ;9382EB;
    BMI .echoes                                                          ;9382EE;
    JMP.W .loop                                                          ;9382F0;


.echoes:
    JSL.L DrawShinesparkCrashEchoProjectiles                             ;9382F3;
    JSL.L HandleProjectileTrails                                         ;9382F7;
    PLP                                                                  ;9382FB;
    RTL                                                                  ;9382FC;


UNUSED_PartialDrawProjectiles_9282FD:
    PHP                                                                  ;9382FD;
    REP #$30                                                             ;9382FE;
    LDX.W #$0008                                                         ;938300;
    STX.W $0DDE                                                          ;938303;

.loop:
    LDA.W $0C40,X                                                        ;938306;
    BEQ .next                                                            ;938309;
    LDA.W $0B64,X                                                        ;93830B;
    SEC                                                                  ;93830E;
    SBC.W $0911                                                          ;93830F;
    STA.B $14                                                            ;938312;
    LDA.W $0B78,X                                                        ;938314;
    SEC                                                                  ;938317;
    SBC.W #$0008                                                         ;938318;
    SEC                                                                  ;93831B;
    SBC.W $0915                                                          ;93831C;
    STA.B $12                                                            ;93831F;
    AND.W #$FF00                                                         ;938321;
    BNE +                                                                ;938324;
    LDA.W $0CB8,X                                                        ;938326;
    BPL .getIndex                                                        ;938329;
    JSL.L AddProjectileSpritemapToOAM                                    ;93832B;
    BRA .getIndex                                                        ;93832F;


  + LDA.W $0CB8,X                                                        ;938331;
    BPL .getIndex                                                        ;938334;
    JSL.L RTL_818AB7                                                     ;938336;

.getIndex:
    LDX.W $0DDE                                                          ;93833A;

.next:
    DEX                                                                  ;93833D;
    DEX                                                                  ;93833E;
    STX.W $0DDE                                                          ;93833F;
    BMI .timerExpired                                                    ;938342;
    JMP.W .loop                                                          ;938344;


.timerExpired:
    JSL.L HandleProjectileTrails                                         ;938347;
    PLP                                                                  ;93834B;
    RTL                                                                  ;93834C;


DrawBombsAndProjectileExplosions:
    PHP                                                                  ;93834D;
    REP #$30                                                             ;93834E;
    LDX.W #$0012                                                         ;938350;
    STX.W $0DDE                                                          ;938353;

.loop:
    LDA.W $0C40,X                                                        ;938356;
    BEQ .next                                                            ;938359;
    LDA.W $0C18,X                                                        ;93835B;
    AND.W #$0F00                                                         ;93835E;
    CMP.W #$0300                                                         ;938361;
    BMI .next                                                            ;938364;
    BEQ .powerBomb                                                       ;938366;
    CMP.W #$0500                                                         ;938368;
    BEQ .normalPositionCalculation                                       ;93836B;
    LDA.W $093F                                                          ;93836D;
    BPL .normalPositionCalculation                                       ;938370;
    JSL.L Calculate_ProjectilePosition_InRotatingElevatorRoom            ;938372;
    LDA.B $12                                                            ;938376;
    BRA .calculatedPosition                                              ;938378;


.powerBomb:
    LDA.W $0C7C,X                                                        ;93837A;
    BEQ .next                                                            ;93837D;

.normalPositionCalculation:
    LDA.W $0B64,X                                                        ;93837F;
    SEC                                                                  ;938382;
    SBC.W $0911                                                          ;938383;
    STA.B $14                                                            ;938386;
    CMP.W #$0130                                                         ;938388;
    BPL .next                                                            ;93838B;
    CMP.W #$FFD0                                                         ;93838D;
    BMI .next                                                            ;938390;
    LDA.W $0B78,X                                                        ;938392;
    SEC                                                                  ;938395;
    SBC.W $0915                                                          ;938396;
    STA.B $12                                                            ;938399;

.calculatedPosition:
    AND.W #$FF00                                                         ;93839B;
    BNE .offScreen                                                       ;93839E;
    LDA.W $0CB8,X                                                        ;9383A0;
    JSL.L AddProjectileSpritemapToOAM                                    ;9383A3;
    LDX.W $0DDE                                                          ;9383A7;
    BRA .next                                                            ;9383AA;


.offScreen:
    LDA.W $0CB8,X                                                        ;9383AC;
    JSL.L RTL_818AB7                                                     ;9383AF;
    LDX.W $0DDE                                                          ;9383B3;

.next:
    DEX                                                                  ;9383B6;
    DEX                                                                  ;9383B7;
    STX.W $0DDE                                                          ;9383B8;
    BPL .loop                                                            ;9383BB;
    PLP                                                                  ;9383BD;
    RTL                                                                  ;9383BE;


HyperBeamDamageValue:
    dw $03E8                                                             ;9383BF;

SamusProjectileDataPointers_UnchargedBeams:
    dw ProjectileDataTable_Uncharged_Power                               ;9383C1;
    dw ProjectileDataTable_Uncharged_Wave                                ;9383C3;
    dw ProjectileDataTable_Uncharged_Ice                                 ;9383C5;
    dw ProjectileDataTable_Uncharged_IceWave                             ;9383C7;
    dw ProjectileDataTable_Uncharged_Spazer                              ;9383C9;
    dw ProjectileDataTable_Uncharged_SpazerWave                          ;9383CB;
    dw ProjectileDataTable_Uncharged_SpazerIce                           ;9383CD;
    dw ProjectileDataTable_Uncharged_SpazerIceWave                       ;9383CF;
    dw ProjectileDataTable_Uncharged_Plasma                              ;9383D1;
    dw ProjectileDataTable_Uncharged_PlasmaWave                          ;9383D3;
    dw ProjectileDataTable_Uncharged_PlasmaIce                           ;9383D5;
    dw ProjectileDataTable_Uncharged_PlasmaIceWave                       ;9383D7;

SamusProjectileDataPointers_ChargedBeams:
    dw ProjectileDataTable_Charged_Power                                 ;9383D9;
    dw ProjectileDataTable_Charged_Wave                                  ;9383DB;
    dw ProjectileDataTable_Charged_Ice                                   ;9383DD;
    dw ProjectileDataTable_Charged_IceWave                               ;9383DF;
    dw ProjectileDataTable_Charged_Spazer                                ;9383E1;
    dw ProjectileDataTable_Charged_SpazerWave                            ;9383E3;
    dw ProjectileDataTable_Charged_SpazerIce                             ;9383E5;
    dw ProjectileDataTable_Charged_SpazerIceWave                         ;9383E7;
    dw ProjectileDataTable_Charged_Plasma                                ;9383E9;
    dw ProjectileDataTable_Charged_PlasmaWave                            ;9383EB;
    dw ProjectileDataTable_Charged_PlasmaIce                             ;9383ED;
    dw ProjectileDataTable_Charged_PlasmaIceWave                         ;9383EF;

SamusProjectileDataPointers_NonBeam:
    dw ProjectileDataTable_NonBeam_Missile                               ;9383F1;
    dw ProjectileDataTable_NonBeam_Missile                               ;9383F3;
    dw ProjectileDataTable_NonBeam_SuperMissile                          ;9383F5;
    dw ProjectileDataTable_NonBeam_PowerBomb                             ;9383F7;
    dw ProjectileDataTable_NonBeam_Missile                               ;9383F9;
    dw ProjectileDataTable_NonBeam_Bomb                                  ;9383FB;
    dw ProjectileDataTable_NonBeam_Missile                               ;9383FD;
    dw ProjectileDataTable_NonBeam_BeamExplosion                         ;9383FF;
    dw ProjectileDataTable_NonBeam_MissileExplosion                      ;938401;

SamusProjectileDataPointers_ShinesparkEcho_SpazerSBATrail:
    dw $0000                                                             ;938403;
    dw $0000                                                             ;938405;
    dw ProjectileDataTable_NonBeam_SpazerSBATrail                        ;938407;
    dw UNUSED_ProjectileDataTable_NonBeam_Projectile25_938695            ;938409;
    dw ProjectileDataTable_NonBeam_SpazerSBATrail                        ;93840B;
    dw UNUSED_ProjectileDataTable_NonBeam_Projectile27_9386D7            ;93840D;
    dw $0000                                                             ;93840F;
    dw ProjectileDataTable_NonBeam_ShinesparkEcho                        ;938411;

SamusProjectileDataPointers_SBA:
    dw $0000                                                             ;938413;
    dw ProjectileDataTable_NonBeam_WaveSBA                               ;938415;
    dw $0000                                                             ;938417;
    dw $0000                                                             ;938419;
    dw ProjectileDataTable_NonBeam_SpazerSBA                             ;93841B;
    dw ProjectileDataTable_NonBeam_SpazerSBA                             ;93841D;
    dw $0000                                                             ;93841F;
    dw $0000                                                             ;938421;
    dw ProjectileDataTable_NonBeam_PlasmaSBA                             ;938423;
    dw ProjectileDataTable_NonBeam_PlasmaSBA                             ;938425;
    dw $0000                                                             ;938427;
    dw $0000                                                             ;938429;

SamusProjectileDataPointers_SuperMissileLink:
    dw $0000                                                             ;93842B;
    dw $0000                                                             ;93842D;
    dw ProjectileDataTable_NonBeam_SuperMissileLink                      ;93842F;

ProjectileDataTable_Uncharged_Power:
    dw $0014                                                             ;938431;
    dw InstList_SamusProjectile_Power_Up                                 ;938433;
    dw InstList_SamusProjectile_Power_UpRight                            ;938435;
    dw InstList_SamusProjectile_Power_Right                              ;938437;
    dw InstList_SamusProjectile_Power_DownRight                          ;938439;
    dw InstList_SamusProjectile_Power_Down                               ;93843B;
    dw InstList_SamusProjectile_Power_Down                               ;93843D;
    dw InstList_SamusProjectile_Power_DownLeft                           ;93843F;
    dw InstList_SamusProjectile_Power_Left                               ;938441;
    dw InstList_SamusProjectile_Power_UpLeft                             ;938443;
    dw InstList_SamusProjectile_Power_Up                                 ;938445;

ProjectileDataTable_Uncharged_Spazer:
    dw $0028                                                             ;938447;
    dw InstList_SamusProjectile_Spazer_SpazerIce_Up_0                    ;938449;
    dw InstList_SamusProjectile_Spazer_SpazerIce_UpRight_0               ;93844B;
    dw InstList_SamusProjectile_Spazer_SpazerIce_Right_0                 ;93844D;
    dw InstList_SamusProjectile_Spazer_SpazerIce_DownRight_0             ;93844F;
    dw InstList_SamusProjectile_Spazer_SpazerIce_Down_0                  ;938451;
    dw InstList_SamusProjectile_Spazer_SpazerIce_Down_0                  ;938453;
    dw InstList_SamusProjectile_Spazer_SpazerIce_DownLeft_0              ;938455;
    dw InstList_SamusProjectile_Spazer_SpazerIce_Left_0                  ;938457;
    dw InstList_SamusProjectile_Spazer_SpazerIce_UpLeft_0                ;938459;
    dw InstList_SamusProjectile_Spazer_SpazerIce_Up_0                    ;93845B;

ProjectileDataTable_Uncharged_SpazerIce:
    dw $003C                                                             ;93845D;
    dw InstList_SamusProjectile_Spazer_SpazerIce_Up_0                    ;93845F;
    dw InstList_SamusProjectile_Spazer_SpazerIce_UpRight_0               ;938461;
    dw InstList_SamusProjectile_Spazer_SpazerIce_Right_0                 ;938463;
    dw InstList_SamusProjectile_Spazer_SpazerIce_DownRight_0             ;938465;
    dw InstList_SamusProjectile_Spazer_SpazerIce_Down_0                  ;938467;
    dw InstList_SamusProjectile_Spazer_SpazerIce_Down_0                  ;938469;
    dw InstList_SamusProjectile_Spazer_SpazerIce_DownLeft_0              ;93846B;
    dw InstList_SamusProjectile_Spazer_SpazerIce_Left_0                  ;93846D;
    dw InstList_SamusProjectile_Spazer_SpazerIce_UpLeft_0                ;93846F;
    dw InstList_SamusProjectile_Spazer_SpazerIce_Up_0                    ;938471;

ProjectileDataTable_Uncharged_SpazerIceWave:
    dw $0064                                                             ;938473;
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Up              ;938475;
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_UpRight         ;938477;
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Right           ;938479;
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_DownRight       ;93847B;
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Down            ;93847D;
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Down            ;93847F;
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_DownLeft        ;938481;
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Left            ;938483;
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_UpLeft          ;938485;
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Up              ;938487;

ProjectileDataTable_Uncharged_PlasmaIceWave:
    dw $012C                                                             ;938489;
    dw InstList_SamusProjectile_PlasmaIceWave_Down_Up                    ;93848B;
    dw InstList_SamusProjectile_PlasmaIceWave_DownLeft_UpRight           ;93848D;
    dw InstList_SamusProj_PlasmaWave_PlasmaIceWave_Left_Right_0          ;93848F;
    dw InstList_SamusProjectile_PlasmaIceWave_DownRight_UpLeft           ;938491;
    dw InstList_SamusProjectile_PlasmaIceWave_Down_Up                    ;938493;
    dw InstList_SamusProjectile_PlasmaIceWave_Down_Up                    ;938495;
    dw InstList_SamusProjectile_PlasmaIceWave_DownLeft_UpRight           ;938497;
    dw InstList_SamusProj_PlasmaWave_PlasmaIceWave_Left_Right_0          ;938499;
    dw InstList_SamusProjectile_PlasmaIceWave_DownRight_UpLeft           ;93849B;
    dw InstList_SamusProjectile_PlasmaIceWave_Down_Up                    ;93849D;

ProjectileDataTable_Uncharged_Ice:
    dw $001E                                                             ;93849F;
    dw InstList_SamusProjectile_Ice                                      ;9384A1;
    dw InstList_SamusProjectile_Ice                                      ;9384A3;
    dw InstList_SamusProjectile_Ice                                      ;9384A5;
    dw InstList_SamusProjectile_Ice                                      ;9384A7;
    dw InstList_SamusProjectile_Ice                                      ;9384A9;
    dw InstList_SamusProjectile_Ice                                      ;9384AB;
    dw InstList_SamusProjectile_Ice                                      ;9384AD;
    dw InstList_SamusProjectile_Ice                                      ;9384AF;
    dw InstList_SamusProjectile_Ice                                      ;9384B1;
    dw InstList_SamusProjectile_Ice                                      ;9384B3;

ProjectileDataTable_Uncharged_Wave:
    dw $0032                                                             ;9384B5;
    dw InstList_SamusProjectile_Wave_IceWave_Up                          ;9384B7;
    dw InstList_SamusProjectile_Wave_IceWave_DownLeft_UpRight            ;9384B9;
    dw InstList_SamusProjectile_Wave_IceWave_Left_Right                  ;9384BB;
    dw InstList_SamusProjectile_Wave_IceWave_DownRight_UpLeft            ;9384BD;
    dw InstList_SamusProjectile_Wave_IceWave_Down                        ;9384BF;
    dw InstList_SamusProjectile_Wave_IceWave_Down                        ;9384C1;
    dw InstList_SamusProjectile_Wave_IceWave_DownLeft_UpRight            ;9384C3;
    dw InstList_SamusProjectile_Wave_IceWave_Left_Right                  ;9384C5;
    dw InstList_SamusProjectile_Wave_IceWave_DownRight_UpLeft            ;9384C7;
    dw InstList_SamusProjectile_Wave_IceWave_Up                          ;9384C9;

ProjectileDataTable_Uncharged_Plasma:
    dw $0096                                                             ;9384CB;
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Down_Up_0               ;9384CD;
    dw InstList_SamusProjectile_Plasma_PlasmaIce_DownLeft_UpRight_0      ;9384CF;
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Left_Right_0            ;9384D1;
    dw InstList_SamusProjectile_Plasma_PlasmaIce_DownRight_UpLeft_0      ;9384D3;
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Down_Up_0               ;9384D5;
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Down_Up_0               ;9384D7;
    dw InstList_SamusProjectile_Plasma_PlasmaIce_DownLeft_UpRight_0      ;9384D9;
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Left_Right_0            ;9384DB;
    dw InstList_SamusProjectile_Plasma_PlasmaIce_DownRight_UpLeft_0      ;9384DD;
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Down_Up_0               ;9384DF;

ProjectileDataTable_Uncharged_IceWave:
    dw $003C                                                             ;9384E1;
    dw InstList_SamusProjectile_Wave_IceWave_Up                          ;9384E3;
    dw InstList_SamusProjectile_Wave_IceWave_DownLeft_UpRight            ;9384E5;
    dw InstList_SamusProjectile_Wave_IceWave_Left_Right                  ;9384E7;
    dw InstList_SamusProjectile_Wave_IceWave_DownRight_UpLeft            ;9384E9;
    dw InstList_SamusProjectile_Wave_IceWave_Down                        ;9384EB;
    dw InstList_SamusProjectile_Wave_IceWave_Down                        ;9384ED;
    dw InstList_SamusProjectile_Wave_IceWave_DownLeft_UpRight            ;9384EF;
    dw InstList_SamusProjectile_Wave_IceWave_Left_Right                  ;9384F1;
    dw InstList_SamusProjectile_Wave_IceWave_DownRight_UpLeft            ;9384F3;
    dw InstList_SamusProjectile_Wave_IceWave_Up                          ;9384F5;

ProjectileDataTable_Uncharged_SpazerWave:
    dw $0046                                                             ;9384F7;
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Up              ;9384F9;
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_UpRight         ;9384FB;
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Right           ;9384FD;
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_DownRight       ;9384FF;
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Down            ;938501;
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Down            ;938503;
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_DownLeft        ;938505;
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Left            ;938507;
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_UpLeft          ;938509;
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Up              ;93850B;

ProjectileDataTable_Uncharged_PlasmaWave:
    dw $00FA                                                             ;93850D;
    dw InstList_SamusProjectile_PlasmaWave_Down_Up                       ;93850F;
    dw InstList_SamusProjectile_PlasmaWave_DownLeft_UpRight              ;938511;
    dw InstList_SamusProj_PlasmaWave_PlasmaIceWave_Left_Right_0          ;938513;
    dw InstList_SamusProjectile_PlasmaWave_DownRight_UpLeft              ;938515;
    dw InstList_SamusProjectile_PlasmaWave_Down_Up                       ;938517;
    dw InstList_SamusProjectile_PlasmaWave_Down_Up                       ;938519;
    dw InstList_SamusProjectile_PlasmaWave_DownLeft_UpRight              ;93851B;
    dw InstList_SamusProj_PlasmaWave_PlasmaIceWave_Left_Right_0          ;93851D;
    dw InstList_SamusProjectile_PlasmaWave_DownRight_UpLeft              ;93851F;
    dw InstList_SamusProjectile_PlasmaWave_Down_Up                       ;938521;

ProjectileDataTable_Uncharged_PlasmaIce:
    dw $00C8                                                             ;938523;
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Down_Up_0               ;938525;
    dw InstList_SamusProjectile_Plasma_PlasmaIce_DownLeft_UpRight_0      ;938527;
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Left_Right_0            ;938529;
    dw InstList_SamusProjectile_Plasma_PlasmaIce_DownRight_UpLeft_0      ;93852B;
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Down_Up_0               ;93852D;
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Down_Up_0               ;93852F;
    dw InstList_SamusProjectile_Plasma_PlasmaIce_DownLeft_UpRight_0      ;938531;
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Left_Right_0            ;938533;
    dw InstList_SamusProjectile_Plasma_PlasmaIce_DownRight_UpLeft_0      ;938535;
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Down_Up_0               ;938537;

ProjectileDataTable_Charged_Power:
    dw $003C                                                             ;938539;
    dw InstList_SamusProjectile_Charged_Power_Up                         ;93853B;
    dw InstList_SamusProjectile_Charged_Power_UpRight                    ;93853D;
    dw InstList_SamusProjectile_Charged_Power_Right                      ;93853F;
    dw InstList_SamusProjectile_Charged_Power_DownRight                  ;938541;
    dw InstList_SamusProjectile_Charged_Power_Down                       ;938543;
    dw InstList_SamusProjectile_Charged_Power_Down                       ;938545;
    dw InstList_SamusProjectile_Charged_Power_DownLeft                   ;938547;
    dw InstList_SamusProjectile_Charged_Power_Left                       ;938549;
    dw InstList_SamusProjectile_Charged_Power_UpLeft                     ;93854B;
    dw InstList_SamusProjectile_Charged_Power_Up                         ;93854D;

ProjectileDataTable_Charged_Spazer:
    dw $0078                                                             ;93854F;
    dw InstList_SamusProjectile_Charged_S_SI_Down_Up_0                   ;938551;
    dw InstList_SamusProjectile_Charged_S_SI_DownLeft_UpRight_0          ;938553;
    dw InstList_SamusProjectile_Charged_S_SI_Left_Right_0                ;938555;
    dw InstList_SamusProjectile_Charged_S_SI_DownRight_UpLeft_0          ;938557;
    dw InstList_SamusProjectile_Charged_S_SI_Down_Up_0                   ;938559;
    dw InstList_SamusProjectile_Charged_S_SI_Down_Up_0                   ;93855B;
    dw InstList_SamusProjectile_Charged_S_SI_DownLeft_UpRight_0          ;93855D;
    dw InstList_SamusProjectile_Charged_S_SI_Left_Right_0                ;93855F;
    dw InstList_SamusProjectile_Charged_S_SI_DownRight_UpLeft_0          ;938561;
    dw InstList_SamusProjectile_Charged_S_SI_Down_Up_0                   ;938563;

ProjectileDataTable_Charged_SpazerIce:
    dw $00B4                                                             ;938565;
    dw InstList_SamusProjectile_Charged_S_SI_Down_Up_0                   ;938567;
    dw InstList_SamusProjectile_Charged_S_SI_DownLeft_UpRight_0          ;938569;
    dw InstList_SamusProjectile_Charged_S_SI_Left_Right_0                ;93856B;
    dw InstList_SamusProjectile_Charged_S_SI_DownRight_UpLeft_0          ;93856D;
    dw InstList_SamusProjectile_Charged_S_SI_Down_Up_0                   ;93856F;
    dw InstList_SamusProjectile_Charged_S_SI_Down_Up_0                   ;938571;
    dw InstList_SamusProjectile_Charged_S_SI_DownLeft_UpRight_0          ;938573;
    dw InstList_SamusProjectile_Charged_S_SI_Left_Right_0                ;938575;
    dw InstList_SamusProjectile_Charged_S_SI_DownRight_UpLeft_0          ;938577;
    dw InstList_SamusProjectile_Charged_S_SI_Down_Up_0                   ;938579;

ProjectileDataTable_Charged_SpazerIceWave:
    dw $012C                                                             ;93857B;
    dw InstList_SamusProjectile_Charged_SW_SIW_Up_0                      ;93857D;
    dw InstList_SamusProjectile_Charged_SW_SIW_UpRight_0                 ;93857F;
    dw InstList_SamusProjectile_Charged_SW_SIW_Right_0                   ;938581;
    dw InstList_SamusProjectile_Charged_SW_SIW_DownRight_0               ;938583;
    dw InstList_SamusProjectile_Charged_SW_SIW_Down_0                    ;938585;
    dw InstList_SamusProjectile_Charged_SW_SIW_Down_0                    ;938587;
    dw InstList_SamusProjectile_Charged_SW_SIW_DownLeft_0                ;938589;
    dw InstList_SamusProjectile_Charged_SW_SIW_Left_0                    ;93858B;
    dw InstList_SamusProjectile_Charged_SW_SIW_UpLeft_0                  ;93858D;
    dw InstList_SamusProjectile_Charged_SW_SIW_Up_0                      ;93858F;

ProjectileDataTable_Charged_PlasmaIceWave:
    dw $0384                                                             ;938591;
    dw InstList_SamusProjectile_Charged_PW_PIW_Down_Up_0                 ;938593;
    dw InstList_SamusProjectile_Charged_PW_PIW_DownLeft_UpRight_0        ;938595;
    dw InstList_SamusProjectile_Charged_PW_PIW_Left_Right_0              ;938597;
    dw InstList_SamusProjectile_Charged_PW_PIW_DownRight_UpLeft_0        ;938599;
    dw InstList_SamusProjectile_Charged_PW_PIW_Down_Up_0                 ;93859B;
    dw InstList_SamusProjectile_Charged_PW_PIW_Down_Up_0                 ;93859D;
    dw InstList_SamusProjectile_Charged_PW_PIW_DownLeft_UpRight_0        ;93859F;
    dw InstList_SamusProjectile_Charged_PW_PIW_Left_Right_0              ;9385A1;
    dw InstList_SamusProjectile_Charged_PW_PIW_DownRight_UpLeft_0        ;9385A3;
    dw InstList_SamusProjectile_Charged_PW_PIW_Down_Up_0                 ;9385A5;

ProjectileDataTable_Charged_Ice:
    dw $005A                                                             ;9385A7;
    dw InstList_SamusProjectile_Charged_Ice                              ;9385A9;
    dw InstList_SamusProjectile_Charged_Ice                              ;9385AB;
    dw InstList_SamusProjectile_Charged_Ice                              ;9385AD;
    dw InstList_SamusProjectile_Charged_Ice                              ;9385AF;
    dw InstList_SamusProjectile_Charged_Ice                              ;9385B1;
    dw InstList_SamusProjectile_Charged_Ice                              ;9385B3;
    dw InstList_SamusProjectile_Charged_Ice                              ;9385B5;
    dw InstList_SamusProjectile_Charged_Ice                              ;9385B7;
    dw InstList_SamusProjectile_Charged_Ice                              ;9385B9;
    dw InstList_SamusProjectile_Charged_Ice                              ;9385BB;

ProjectileDataTable_Charged_Plasma:
    dw $01C2                                                             ;9385BD;
    dw InstList_SamusProjectile_Charged_P_PI_Down_Up_0                   ;9385BF;
    dw InstList_SamusProjectile_Charged_P_PI_DownLeft_UpRight_0          ;9385C1;
    dw InstList_SamusProjectile_Charged_P_PI_Left_Right_0                ;9385C3;
    dw InstList_SamusProjectile_Charged_P_PI_DownRight_UpLeft_0          ;9385C5;
    dw InstList_SamusProjectile_Charged_P_PI_Down_Up_0                   ;9385C7;
    dw InstList_SamusProjectile_Charged_P_PI_Down_Up_0                   ;9385C9;
    dw InstList_SamusProjectile_Charged_P_PI_DownLeft_UpRight_0          ;9385CB;
    dw InstList_SamusProjectile_Charged_P_PI_Left_Right_0                ;9385CD;
    dw InstList_SamusProjectile_Charged_P_PI_DownRight_UpLeft_0          ;9385CF;
    dw InstList_SamusProjectile_Charged_P_PI_Down_Up_0                   ;9385D1;

ProjectileDataTable_Charged_Wave:
    dw $0096                                                             ;9385D3;
    dw InstList_SamusProjectile_Charged_Wave_Up                          ;9385D5;
    dw InstList_SamusProjectile_Charged_Wave_DownLeft_UpRight            ;9385D7;
    dw InstList_SamusProjectile_Charged_Wave_Left_Right                  ;9385D9;
    dw InstList_SamusProjectile_Charged_Wave_DownRight_UpLeft            ;9385DB;
    dw InstList_SamusProjectile_Charged_Wave_Down                        ;9385DD;
    dw InstList_SamusProjectile_Charged_Wave_Down                        ;9385DF;
    dw InstList_SamusProjectile_Charged_Wave_DownLeft_UpRight            ;9385E1;
    dw InstList_SamusProjectile_Charged_Wave_Left_Right                  ;9385E3;
    dw InstList_SamusProjectile_Charged_Wave_DownRight_UpLeft            ;9385E5;
    dw InstList_SamusProjectile_Charged_Wave_Up                          ;9385E7;

ProjectileDataTable_Charged_IceWave:
    dw $00B4                                                             ;9385E9;
    dw InstList_SamusProjectile_Charged_IW_Up                            ;9385EB;
    dw InstList_SamusProjectile_Charged_IW_DownLeft_UpRight              ;9385ED;
    dw InstList_SamusProjectile_Charged_IW_Left_Right                    ;9385EF;
    dw InstList_SamusProjectile_Charged_IW_DownRight_UpLeft              ;9385F1;
    dw InstList_SamusProjectile_Charged_IW_Down                          ;9385F3;
    dw InstList_SamusProjectile_Charged_IW_Down                          ;9385F5;
    dw InstList_SamusProjectile_Charged_IW_DownLeft_UpRight              ;9385F7;
    dw InstList_SamusProjectile_Charged_IW_Left_Right                    ;9385F9;
    dw InstList_SamusProjectile_Charged_IW_DownRight_UpLeft              ;9385FB;
    dw InstList_SamusProjectile_Charged_IW_Up                            ;9385FD;

ProjectileDataTable_Charged_SpazerWave:
    dw $00D2                                                             ;9385FF;
    dw InstList_SamusProjectile_Charged_SW_SIW_Up_0                      ;938601;
    dw InstList_SamusProjectile_Charged_SW_SIW_UpRight_0                 ;938603;
    dw InstList_SamusProjectile_Charged_SW_SIW_Right_0                   ;938605;
    dw InstList_SamusProjectile_Charged_SW_SIW_DownRight_0               ;938607;
    dw InstList_SamusProjectile_Charged_SW_SIW_Down_0                    ;938609;
    dw InstList_SamusProjectile_Charged_SW_SIW_Down_0                    ;93860B;
    dw InstList_SamusProjectile_Charged_SW_SIW_DownLeft_0                ;93860D;
    dw InstList_SamusProjectile_Charged_SW_SIW_Left_0                    ;93860F;
    dw InstList_SamusProjectile_Charged_SW_SIW_UpLeft_0                  ;938611;
    dw InstList_SamusProjectile_Charged_SW_SIW_Up_0                      ;938613;

ProjectileDataTable_Charged_PlasmaIce:
    dw $0258                                                             ;938615;
    dw InstList_SamusProjectile_Charged_P_PI_Down_Up_0                   ;938617;
    dw InstList_SamusProjectile_Charged_P_PI_DownLeft_UpRight_0          ;938619;
    dw InstList_SamusProjectile_Charged_P_PI_Left_Right_0                ;93861B;
    dw InstList_SamusProjectile_Charged_P_PI_DownRight_UpLeft_0          ;93861D;
    dw InstList_SamusProjectile_Charged_P_PI_Down_Up_0                   ;93861F;
    dw InstList_SamusProjectile_Charged_P_PI_Down_Up_0                   ;938621;
    dw InstList_SamusProjectile_Charged_P_PI_DownLeft_UpRight_0          ;938623;
    dw InstList_SamusProjectile_Charged_P_PI_Left_Right_0                ;938625;
    dw InstList_SamusProjectile_Charged_P_PI_DownRight_UpLeft_0          ;938627;
    dw InstList_SamusProjectile_Charged_P_PI_Down_Up_0                   ;938629;

ProjectileDataTable_Charged_PlasmaWave:
    dw $02EE                                                             ;93862B;
    dw InstList_SamusProjectile_Charged_PW_PIW_Down_Up_0                 ;93862D;
    dw InstList_SamusProjectile_Charged_PW_PIW_DownLeft_UpRight_0        ;93862F;
    dw InstList_SamusProjectile_Charged_PW_PIW_Left_Right_0              ;938631;
    dw InstList_SamusProjectile_Charged_PW_PIW_DownRight_UpLeft_0        ;938633;
    dw InstList_SamusProjectile_Charged_PW_PIW_Down_Up_0                 ;938635;
    dw InstList_SamusProjectile_Charged_PW_PIW_Down_Up_0                 ;938637;
    dw InstList_SamusProjectile_Charged_PW_PIW_DownLeft_UpRight_0        ;938639;
    dw InstList_SamusProjectile_Charged_PW_PIW_Left_Right_0              ;93863B;
    dw InstList_SamusProjectile_Charged_PW_PIW_DownRight_UpLeft_0        ;93863D;
    dw InstList_SamusProjectile_Charged_PW_PIW_Down_Up_0                 ;93863F;

ProjectileDataTable_NonBeam_Missile:
    dw $0064                                                             ;938641;
    dw InstList_SamusProjectile_Missiles_Up                              ;938643;
    dw InstList_SamusProjectile_Missiles_UpRight                         ;938645;
    dw InstList_SamusProjectile_Missiles_Right                           ;938647;
    dw InstList_SamusProjectile_Missiles_DownRight                       ;938649;
    dw InstList_SamusProjectile_Missiles_Down                            ;93864B;
    dw InstList_SamusProjectile_Missiles_Down                            ;93864D;
    dw InstList_SamusProjectile_Missiles_DownLeft                        ;93864F;
    dw InstList_SamusProjectile_Missiles_Left                            ;938651;
    dw InstList_SamusProjectile_Missiles_UpLeft                          ;938653;
    dw InstList_SamusProjectile_Missiles_Up                              ;938655;

ProjectileDataTable_NonBeam_SuperMissile:
    dw $012C                                                             ;938657;
    dw InstList_SamusProjectile_SuperMissiles_Up                         ;938659;
    dw InstList_SamusProjectile_SuperMissiles_UpRight                    ;93865B;
    dw InstList_SamusProjectile_SuperMissiles_Right                      ;93865D;
    dw InstList_SamusProjectile_SuperMissiles_DownRight                  ;93865F;
    dw InstList_SamusProjectile_SuperMissiles_Down                       ;938661;
    dw InstList_SamusProjectile_SuperMissiles_Down                       ;938663;
    dw InstList_SamusProjectile_SuperMissiles_DownLeft                   ;938665;
    dw InstList_SamusProjectile_SuperMissiles_Left                       ;938667;
    dw InstList_SamusProjectile_SuperMissiles_UpLeft                     ;938669;
    dw InstList_SamusProjectile_SuperMissiles_Up                         ;93866B;

ProjectileDataTable_NonBeam_SuperMissileLink:
    dw $012C                                                             ;93866D;
    dw InstList_SamusProjectile_SuperMissileLink_                        ;93866F;

ProjectileDataTable_NonBeam_PowerBomb:
    dw $00C8                                                             ;938671;
    dw InstList_SamusProjectile_PowerBomb                                ;938673;

ProjectileDataTable_NonBeam_Bomb:
    dw $001E                                                             ;938675;
    dw InstList_SamusProjectile_Bomb                                     ;938677;

ProjectileDataTable_NonBeam_BeamExplosion:
    dw $0008                                                             ;938679;

ProjectileDataTable_NonBeam_BeamExplosion_pointer:
    dw InstList_SamusProjectile_BeamExplosion                            ;93867B;

ProjectileDataTable_NonBeam_MissileExplosion:
    dw $0008                                                             ;93867D;

ProjectileDataTable_NonBeam_MissileExplosion_pointer:
    dw InstList_SamusProjectile_MissileExplosion                         ;93867F;

UNUSED_ProjectileDataTable_NonBeam_BombExplosion_938681:
    dw $0000                                                             ;938681;

ProjectileDataTable_NonBeam_BombExplosion_pointer:
    dw InstList_SamusProjectile_BombExplosion                            ;938683;

ProjectileDataTable_NonBeam_PlasmaSBA:
    dw $012C                                                             ;938685;
    dw InstList_SamusProjectile_PlasmaSBA                                ;938687;

ProjectileDataTable_NonBeam_WaveSBA:
    dw $012C                                                             ;938689;
    dw InstList_SamusProjectile_WaveSBA                                  ;93868B;

ProjectileDataTable_NonBeam_SpazerSBA:
    dw $012C                                                             ;93868D;
    dw InstList_SamusProjectile_Spazer_SpazerIce_Up_0                    ;93868F;

UNUSED_ProjDataTable_NonBeam_SuperMissileExplosion_938691:
    dw $0008                                                             ;938691;

ProjectileDataTable_NonBeam_SuperMissileExplosion_pointer:
    dw InstList_SamusProjectile_SuperMissileExplosion                    ;938693;

UNUSED_ProjectileDataTable_NonBeam_Projectile25_938695:
    dw $F000                                                             ;938695;
    dw UNUSED_InstList_SamusProjectile_Projectile25_93A0F3               ;938697;
    dw UNUSED_InstList_SamusProjectile_Projectile25_93A0F3               ;938699;
    dw UNUSED_InstList_SamusProjectile_Projectile25_93A0F3               ;93869B;
    dw UNUSED_InstList_SamusProjectile_Projectile25_93A0F3               ;93869D;
    dw UNUSED_InstList_SamusProjectile_Projectile25_93A0F3               ;93869F;
    dw UNUSED_InstList_SamusProjectile_Projectile25_93A0F3               ;9386A1;
    dw UNUSED_InstList_SamusProjectile_Projectile25_93A0F3               ;9386A3;
    dw UNUSED_InstList_SamusProjectile_Projectile25_93A0F3               ;9386A5;
    dw UNUSED_InstList_SamusProjectile_Projectile25_93A0F3               ;9386A7;
    dw UNUSED_InstList_SamusProjectile_Projectile25_93A0F3               ;9386A9;

ProjectileDataTable_NonBeam_SpazerSBATrail:
    dw $012C                                                             ;9386AB;
    dw InstList_SamusProjectile_SpazerSBATrail_0                         ;9386AD;
    dw InstList_SamusProjectile_SpazerSBATrail_0                         ;9386AF;
    dw InstList_SamusProjectile_SpazerSBATrail_0                         ;9386B1;
    dw InstList_SamusProjectile_SpazerSBATrail_0                         ;9386B3;
    dw InstList_SamusProjectile_SpazerSBATrail_0                         ;9386B5;
    dw InstList_SamusProjectile_SpazerSBATrail_0                         ;9386B7;
    dw InstList_SamusProjectile_SpazerSBATrail_0                         ;9386B9;
    dw InstList_SamusProjectile_SpazerSBATrail_0                         ;9386BB;
    dw InstList_SamusProjectile_SpazerSBATrail_0                         ;9386BD;
    dw InstList_SamusProjectile_SpazerSBATrail_0                         ;9386BF;

ProjectileDataTable_NonBeam_ShinesparkEcho:
    dw $1000                                                             ;9386C1;
    dw InstList_SamusProjectile_ShinesparkEcho                           ;9386C3;
    dw InstList_SamusProjectile_ShinesparkEcho                           ;9386C5;
    dw InstList_SamusProjectile_ShinesparkEcho                           ;9386C7;
    dw InstList_SamusProjectile_ShinesparkEcho                           ;9386C9;
    dw InstList_SamusProjectile_ShinesparkEcho                           ;9386CB;
    dw InstList_SamusProjectile_ShinesparkEcho                           ;9386CD;
    dw InstList_SamusProjectile_ShinesparkEcho                           ;9386CF;
    dw InstList_SamusProjectile_ShinesparkEcho                           ;9386D1;
    dw InstList_SamusProjectile_ShinesparkEcho                           ;9386D3;
    dw InstList_SamusProjectile_ShinesparkEcho                           ;9386D5;

UNUSED_ProjectileDataTable_NonBeam_Projectile27_9386D7:
    dw $0000                                                             ;9386D7;
    dw UNUSED_InstList_SamusProjectile_Projectile27_93A16D               ;9386D9;

InstList_SamusProjectile_Power_Up:
    dw $000F                                                             ;9386DB;
    dw ProjectileFlareSpritemaps_Power_2                                 ;9386DD;
    db $04,$04                                                           ;9386DF;
    dw $0000                                                             ;9386E1;
    dw Instruction_SamusProjectile_GotoY                                 ;9386E3;
    dw InstList_SamusProjectile_Power_Up                                 ;9386E5;

InstList_SamusProjectile_Power_UpRight:
    dw $000F                                                             ;9386E7;
    dw ProjectileFlareSpritemaps_Power_3                                 ;9386E9;
    db $08,$04                                                           ;9386EB;
    dw $0000                                                             ;9386ED;
    dw Instruction_SamusProjectile_GotoY                                 ;9386EF;
    dw InstList_SamusProjectile_Power_UpRight                            ;9386F1;

InstList_SamusProjectile_Power_Right:
    dw $000F                                                             ;9386F3;
    dw ProjectileFlareSpritemaps_Power_4                                 ;9386F5;
    db $08,$04                                                           ;9386F7;
    dw $0000                                                             ;9386F9;
    dw Instruction_SamusProjectile_GotoY                                 ;9386FB;
    dw InstList_SamusProjectile_Power_Right                              ;9386FD;

InstList_SamusProjectile_Power_DownRight:
    dw $000F                                                             ;9386FF;
    dw ProjectileFlareSpritemaps_Power_5                                 ;938701;
    db $08,$04                                                           ;938703;
    dw $0000                                                             ;938705;
    dw Instruction_SamusProjectile_GotoY                                 ;938707;
    dw InstList_SamusProjectile_Power_DownRight                          ;938709;

InstList_SamusProjectile_Power_Down:
    dw $000F                                                             ;93870B;
    dw ProjectileFlareSpritemaps_Power_6                                 ;93870D;
    db $04,$04                                                           ;93870F;
    dw $0000                                                             ;938711;
    dw Instruction_SamusProjectile_GotoY                                 ;938713;
    dw InstList_SamusProjectile_Power_Down                               ;938715;

InstList_SamusProjectile_Power_DownLeft:
    dw $000F                                                             ;938717;
    dw ProjectileFlareSpritemaps_Power_7                                 ;938719;
    db $08,$04                                                           ;93871B;
    dw $0000                                                             ;93871D;
    dw Instruction_SamusProjectile_GotoY                                 ;93871F;
    dw InstList_SamusProjectile_Power_DownLeft                           ;938721;

InstList_SamusProjectile_Power_Left:
    dw $000F                                                             ;938723;
    dw ProjectileFlareSpritemaps_Power_0                                 ;938725;
    db $08,$04                                                           ;938727;
    dw $0000                                                             ;938729;
    dw Instruction_SamusProjectile_GotoY                                 ;93872B;
    dw InstList_SamusProjectile_Power_Left                               ;93872D;

InstList_SamusProjectile_Power_UpLeft:
    dw $000F                                                             ;93872F;
    dw ProjectileFlareSpritemaps_Power_1                                 ;938731;
    db $08,$04                                                           ;938733;
    dw $0000                                                             ;938735;
    dw Instruction_SamusProjectile_GotoY                                 ;938737;
    dw InstList_SamusProjectile_Power_UpLeft                             ;938739;

InstList_SamusProjectile_Wave_IceWave_Up:
    dw $0004                                                             ;93873B;
    dw Spritemap_Nothing_93A117                                          ;93873D;
    db $0C,$04                                                           ;93873F;
    dw $0000                                                             ;938741;

InstList_SamusProjectile_Wave_IceWave_Down:
    dw $0001                                                             ;938743;
    dw ProjectileFlareSpritemaps_Wave_IceWave_0                          ;938745;
    db $0C,$04                                                           ;938747;
    dw $0000,$0001                                                       ;938749;
    dw ProjectileFlareSpritemaps_Wave_IceWave_11                         ;93874D;
    db $0C,$04                                                           ;93874F;
    dw $0001,$0001                                                       ;938751;
    dw ProjectileFlareSpritemaps_Wave_IceWave_12                         ;938755;
    db $0C,$04                                                           ;938757;
    dw $0002,$0001                                                       ;938759;
    dw ProjectileFlareSpritemaps_Wave_IceWave_13                         ;93875D;
    db $10,$04                                                           ;93875F;
    dw $0003,$0001                                                       ;938761;
    dw ProjectileFlareSpritemaps_Wave_IceWave_14                         ;938765;
    db $14,$04                                                           ;938767;
    dw $0004,$0001                                                       ;938769;
    dw ProjectileFlareSpritemaps_Wave_IceWave_13                         ;93876D;
    db $10,$04                                                           ;93876F;
    dw $0005,$0001                                                       ;938771;
    dw ProjectileFlareSpritemaps_Wave_IceWave_12                         ;938775;
    db $0C,$04                                                           ;938777;
    dw $0006,$0001                                                       ;938779;
    dw ProjectileFlareSpritemaps_Wave_IceWave_11                         ;93877D;
    db $0C,$04                                                           ;93877F;
    dw $0007,$0001                                                       ;938781;
    dw ProjectileFlareSpritemaps_Wave_IceWave_0                          ;938785;
    db $0C,$04                                                           ;938787;
    dw $0008,$0001                                                       ;938789;
    dw ProjectileFlareSpritemaps_Wave_IceWave_15                         ;93878D;
    db $0C,$04                                                           ;93878F;
    dw $0009,$0001                                                       ;938791;
    dw ProjectileFlareSpritemaps_Wave_IceWave_16                         ;938795;
    db $0C,$04                                                           ;938797;
    dw $000A,$0001                                                       ;938799;
    dw ProjectileFlareSpritemaps_Wave_IceWave_17                         ;93879D;
    db $10,$04                                                           ;93879F;
    dw $000B,$0001                                                       ;9387A1;
    dw ProjectileFlareSpritemaps_Wave_IceWave_18                         ;9387A5;
    db $14,$04                                                           ;9387A7;
    dw $000C,$0001                                                       ;9387A9;
    dw ProjectileFlareSpritemaps_Wave_IceWave_17                         ;9387AD;
    db $10,$04                                                           ;9387AF;
    dw $000D,$0001                                                       ;9387B1;
    dw ProjectileFlareSpritemaps_Wave_IceWave_16                         ;9387B5;
    db $0C,$04                                                           ;9387B7;
    dw $000E,$0001                                                       ;9387B9;
    dw ProjectileFlareSpritemaps_Wave_IceWave_15                         ;9387BD;
    db $0C,$04                                                           ;9387BF;
    dw $000F                                                             ;9387C1;
    dw Instruction_SamusProjectile_GotoY                                 ;9387C3;
    dw InstList_SamusProjectile_Wave_IceWave_Down                        ;9387C5;

InstList_SamusProjectile_Wave_IceWave_DownLeft_UpRight:
    dw $0001                                                             ;9387C7;
    dw ProjectileFlareSpritemaps_Wave_IceWave_0                          ;9387C9;
    db $08,$08                                                           ;9387CB;
    dw $0000,$0001                                                       ;9387CD;
    dw ProjectileFlareSpritemaps_Wave_IceWave_19                         ;9387D1;
    db $08,$08                                                           ;9387D3;
    dw $0001,$0001                                                       ;9387D5;
    dw ProjectileFlareSpritemaps_Wave_IceWave_1A                         ;9387D9;
    db $08,$08                                                           ;9387DB;
    dw $0002,$0001                                                       ;9387DD;
    dw ProjectileFlareSpritemaps_Wave_IceWave_1B                         ;9387E1;
    db $0A,$0A                                                           ;9387E3;
    dw $0003,$0001                                                       ;9387E5;
    dw ProjectileFlareSpritemaps_Wave_IceWave_1C                         ;9387E9;
    db $0C,$0C                                                           ;9387EB;
    dw $0004,$0001                                                       ;9387ED;
    dw ProjectileFlareSpritemaps_Wave_IceWave_1B                         ;9387F1;
    db $0A,$0A                                                           ;9387F3;
    dw $0005,$0001                                                       ;9387F5;
    dw ProjectileFlareSpritemaps_Wave_IceWave_1A                         ;9387F9;
    db $08,$08                                                           ;9387FB;
    dw $0006,$0001                                                       ;9387FD;
    dw ProjectileFlareSpritemaps_Wave_IceWave_19                         ;938801;
    db $06,$06                                                           ;938803;
    dw $0007,$0001                                                       ;938805;
    dw ProjectileFlareSpritemaps_Wave_IceWave_0                          ;938809;
    db $04,$04                                                           ;93880B;
    dw $0008,$0001                                                       ;93880D;
    dw ProjectileFlareSpritemaps_Wave_IceWave_1D                         ;938811;
    db $06,$06                                                           ;938813;
    dw $0009,$0001                                                       ;938815;
    dw ProjectileFlareSpritemaps_Wave_IceWave_1E                         ;938819;
    db $08,$08                                                           ;93881B;
    dw $000A,$0001                                                       ;93881D;
    dw ProjectileFlareSpritemaps_Wave_IceWave_1F                         ;938821;
    db $0A,$0A                                                           ;938823;
    dw $000B,$0001                                                       ;938825;
    dw ProjectileFlareSpritemaps_Wave_IceWave_20                         ;938829;
    db $0C,$0C                                                           ;93882B;
    dw $000C,$0001                                                       ;93882D;
    dw ProjectileFlareSpritemaps_Wave_IceWave_1F                         ;938831;
    db $0A,$0A                                                           ;938833;
    dw $000D,$0001                                                       ;938835;
    dw ProjectileFlareSpritemaps_Wave_IceWave_1E                         ;938839;
    db $08,$08                                                           ;93883B;
    dw $000E,$0001                                                       ;93883D;
    dw ProjectileFlareSpritemaps_Wave_IceWave_1D                         ;938841;
    db $08,$08                                                           ;938843;
    dw $000F                                                             ;938845;
    dw Instruction_SamusProjectile_GotoY                                 ;938847;
    dw InstList_SamusProjectile_Wave_IceWave_DownLeft_UpRight            ;938849;

InstList_SamusProjectile_Wave_IceWave_Left_Right:
    dw $0001                                                             ;93884B;
    dw ProjectileFlareSpritemaps_Wave_IceWave_0                          ;93884D;
    db $04,$0C                                                           ;93884F;
    dw $0000,$0001                                                       ;938851;
    dw ProjectileFlareSpritemaps_Wave_IceWave_1                          ;938855;
    db $04,$0C                                                           ;938857;
    dw $0001,$0001                                                       ;938859;
    dw ProjectileFlareSpritemaps_Wave_IceWave_2                          ;93885D;
    db $04,$0C                                                           ;93885F;
    dw $0002,$0001                                                       ;938861;
    dw ProjectileFlareSpritemaps_Wave_IceWave_3                          ;938865;
    db $04,$10                                                           ;938867;
    dw $0003,$0001                                                       ;938869;
    dw ProjectileFlareSpritemaps_Wave_IceWave_4                          ;93886D;
    db $04,$14                                                           ;93886F;
    dw $0004,$0001                                                       ;938871;
    dw ProjectileFlareSpritemaps_Wave_IceWave_3                          ;938875;
    db $04,$10                                                           ;938877;
    dw $0005,$0001                                                       ;938879;
    dw ProjectileFlareSpritemaps_Wave_IceWave_2                          ;93887D;
    db $04,$0C                                                           ;93887F;
    dw $0006,$0001                                                       ;938881;
    dw ProjectileFlareSpritemaps_Wave_IceWave_1                          ;938885;
    db $04,$0C                                                           ;938887;
    dw $0007,$0001                                                       ;938889;
    dw ProjectileFlareSpritemaps_Wave_IceWave_0                          ;93888D;
    db $04,$0C                                                           ;93888F;
    dw $0008,$0001                                                       ;938891;
    dw ProjectileFlareSpritemaps_Wave_IceWave_5                          ;938895;
    db $04,$0C                                                           ;938897;
    dw $0009,$0001                                                       ;938899;
    dw ProjectileFlareSpritemaps_Wave_IceWave_6                          ;93889D;
    db $04,$0C                                                           ;93889F;
    dw $000A,$0001                                                       ;9388A1;
    dw ProjectileFlareSpritemaps_Wave_IceWave_7                          ;9388A5;
    db $04,$10                                                           ;9388A7;
    dw $000B,$0001                                                       ;9388A9;
    dw ProjectileFlareSpritemaps_Wave_IceWave_8                          ;9388AD;
    db $04,$14                                                           ;9388AF;
    dw $000C,$0001                                                       ;9388B1;
    dw ProjectileFlareSpritemaps_Wave_IceWave_7                          ;9388B5;
    db $04,$10                                                           ;9388B7;
    dw $000D,$0001                                                       ;9388B9;
    dw ProjectileFlareSpritemaps_Wave_IceWave_6                          ;9388BD;
    db $04,$0C                                                           ;9388BF;
    dw $000E,$0001                                                       ;9388C1;
    dw ProjectileFlareSpritemaps_Wave_IceWave_5                          ;9388C5;
    db $04,$0C                                                           ;9388C7;
    dw $000F                                                             ;9388C9;
    dw Instruction_SamusProjectile_GotoY                                 ;9388CB;
    dw InstList_SamusProjectile_Wave_IceWave_Left_Right                  ;9388CD;

InstList_SamusProjectile_Wave_IceWave_DownRight_UpLeft:
    dw $0001                                                             ;9388CF;
    dw ProjectileFlareSpritemaps_Wave_IceWave_0                          ;9388D1;
    db $08,$08                                                           ;9388D3;
    dw $0000,$0001                                                       ;9388D5;
    dw ProjectileFlareSpritemaps_Wave_IceWave_9                          ;9388D9;
    db $08,$08                                                           ;9388DB;
    dw $0001,$0001                                                       ;9388DD;
    dw ProjectileFlareSpritemaps_Wave_IceWave_A                          ;9388E1;
    db $08,$08                                                           ;9388E3;
    dw $0002,$0001                                                       ;9388E5;
    dw ProjectileFlareSpritemaps_Wave_IceWave_B                          ;9388E9;
    db $0A,$0A                                                           ;9388EB;
    dw $0003,$0001                                                       ;9388ED;
    dw ProjectileFlareSpritemaps_Wave_IceWave_C                          ;9388F1;
    db $0C,$0C                                                           ;9388F3;
    dw $0004,$0001                                                       ;9388F5;
    dw ProjectileFlareSpritemaps_Wave_IceWave_B                          ;9388F9;
    db $0A,$0A                                                           ;9388FB;
    dw $0005,$0001                                                       ;9388FD;
    dw ProjectileFlareSpritemaps_Wave_IceWave_A                          ;938901;
    db $08,$08                                                           ;938903;
    dw $0006,$0001                                                       ;938905;
    dw ProjectileFlareSpritemaps_Wave_IceWave_9                          ;938909;
    db $06,$06                                                           ;93890B;
    dw $0007,$0001                                                       ;93890D;
    dw ProjectileFlareSpritemaps_Wave_IceWave_0                          ;938911;
    db $04,$04                                                           ;938913;
    dw $0008,$0001                                                       ;938915;
    dw ProjectileFlareSpritemaps_Wave_IceWave_D                          ;938919;
    db $06,$06                                                           ;93891B;
    dw $0009,$0001                                                       ;93891D;
    dw ProjectileFlareSpritemaps_Wave_IceWave_E                          ;938921;
    db $08,$08                                                           ;938923;
    dw $000A,$0001                                                       ;938925;
    dw ProjectileFlareSpritemaps_Wave_IceWave_F                          ;938929;
    db $0A,$0A                                                           ;93892B;
    dw $000B,$0001                                                       ;93892D;
    dw ProjectileFlareSpritemaps_Wave_IceWave_10                         ;938931;
    db $0C,$0C                                                           ;938933;
    dw $000C,$0001                                                       ;938935;
    dw ProjectileFlareSpritemaps_Wave_IceWave_F                          ;938939;
    db $0A,$0A                                                           ;93893B;
    dw $000D,$0001                                                       ;93893D;
    dw ProjectileFlareSpritemaps_Wave_IceWave_E                          ;938941;
    db $08,$08                                                           ;938943;
    dw $000E,$0001                                                       ;938945;
    dw ProjectileFlareSpritemaps_Wave_IceWave_D                          ;938949;
    db $08,$08                                                           ;93894B;
    dw $000F                                                             ;93894D;
    dw Instruction_SamusProjectile_GotoY                                 ;93894F;
    dw InstList_SamusProjectile_Wave_IceWave_DownRight_UpLeft            ;938951;

InstList_SamusProjectile_Ice:
    dw $0001                                                             ;938953;
    dw ProjectileFlareSpritemaps_Ice_0                                   ;938955;
    db $08,$08                                                           ;938957;
    dw $0000,$0001                                                       ;938959;
    dw ProjectileFlareSpritemaps_Ice_1                                   ;93895D;
    db $08,$08                                                           ;93895F;
    dw $0001,$0001                                                       ;938961;
    dw ProjectileFlareSpritemaps_Ice_2                                   ;938965;
    db $08,$08                                                           ;938967;
    dw $0002,$0001                                                       ;938969;
    dw ProjectileFlareSpritemaps_Ice_3                                   ;93896D;
    db $08,$08                                                           ;93896F;
    dw $0003                                                             ;938971;
    dw Instruction_SamusProjectile_GotoY                                 ;938973;
    dw InstList_SamusProjectile_Ice                                      ;938975;

InstList_SamusProjectile_Spazer_SpazerIce_Up_0:
    dw $0002                                                             ;938977;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_23                          ;938979;
    db $0C,$08                                                           ;93897B;
    dw $0000,$0002                                                       ;93897D;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_25                          ;938981;
    db $0C,$08                                                           ;938983;
    dw $0001                                                             ;938985;

InstList_SamusProjectile_Spazer_SpazerIce_Up_1:
    dw $0002                                                             ;938987;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_28                          ;938989;
    db $14,$08                                                           ;93898B;
    dw $0002                                                             ;93898D;
    dw Instruction_SamusProjectile_GotoY                                 ;93898F;
    dw InstList_SamusProjectile_Spazer_SpazerIce_Up_1                    ;938991;

InstList_SamusProjectile_Spazer_SpazerIce_UpRight_0:
    dw $0002                                                             ;938993;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_0                           ;938995;
    db $08,$08                                                           ;938997;
    dw $0000,$0002                                                       ;938999;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_1                           ;93899D;
    db $0C,$0C                                                           ;93899F;
    dw $0001                                                             ;9389A1;

InstList_SamusProjectile_Spazer_SpazerIce_UpRight_1:
    dw $0002                                                             ;9389A3;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_4                           ;9389A5;
    db $10,$10                                                           ;9389A7;
    dw $0002                                                             ;9389A9;
    dw Instruction_SamusProjectile_GotoY                                 ;9389AB;
    dw InstList_SamusProjectile_Spazer_SpazerIce_UpRight_1               ;9389AD;

InstList_SamusProjectile_Spazer_SpazerIce_Right_0:
    dw $0002                                                             ;9389AF;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_29                          ;9389B1;
    db $08,$0C                                                           ;9389B3;
    dw $0000,$0002                                                       ;9389B5;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_2B                          ;9389B9;
    db $08,$0C                                                           ;9389BB;
    dw $0001                                                             ;9389BD;

InstList_SamusProjectile_Spazer_SpazerIce_Right_1:
    dw $0002                                                             ;9389BF;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_2E                          ;9389C1;
    db $08,$14                                                           ;9389C3;
    dw $0002                                                             ;9389C5;
    dw Instruction_SamusProjectile_GotoY                                 ;9389C7;
    dw InstList_SamusProjectile_Spazer_SpazerIce_Right_1                 ;9389C9;

InstList_SamusProjectile_Spazer_SpazerIce_DownRight_0:
    dw $0002                                                             ;9389CB;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_6                           ;9389CD;
    db $08,$08                                                           ;9389CF;
    dw $0000,$0002                                                       ;9389D1;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_7                           ;9389D5;
    db $0C,$0C                                                           ;9389D7;
    dw $0001                                                             ;9389D9;

InstList_SamusProjectile_Spazer_SpazerIce_DownRight_1:
    dw $0002                                                             ;9389DB;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_A                           ;9389DD;
    db $10,$10                                                           ;9389DF;
    dw $0002                                                             ;9389E1;
    dw Instruction_SamusProjectile_GotoY                                 ;9389E3;
    dw InstList_SamusProjectile_Spazer_SpazerIce_DownRight_1             ;9389E5;

InstList_SamusProjectile_Spazer_SpazerIce_Down_0:
    dw $0002                                                             ;9389E7;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_17                          ;9389E9;
    db $0C,$08                                                           ;9389EB;
    dw $0000,$0002                                                       ;9389ED;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_19                          ;9389F1;
    db $0C,$08                                                           ;9389F3;
    dw $0001                                                             ;9389F5;

InstList_SamusProjectile_Spazer_SpazerIce_Down_1:
    dw $0002                                                             ;9389F7;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_1C                          ;9389F9;
    db $14,$08                                                           ;9389FB;
    dw $0002                                                             ;9389FD;
    dw Instruction_SamusProjectile_GotoY                                 ;9389FF;
    dw InstList_SamusProjectile_Spazer_SpazerIce_Down_1                  ;938A01;

InstList_SamusProjectile_Spazer_SpazerIce_DownLeft_0:
    dw $0002                                                             ;938A03;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_C                           ;938A05;
    db $08,$08                                                           ;938A07;
    dw $0000,$0002                                                       ;938A09;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_D                           ;938A0D;
    db $0C,$0C                                                           ;938A0F;
    dw $0001                                                             ;938A11;

InstList_SamusProjectile_Spazer_SpazerIce_DownLeft_1:
    dw $0002                                                             ;938A13;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_10                          ;938A15;
    db $10,$10                                                           ;938A17;
    dw $0002                                                             ;938A19;
    dw Instruction_SamusProjectile_GotoY                                 ;938A1B;
    dw InstList_SamusProjectile_Spazer_SpazerIce_DownLeft_1              ;938A1D;

InstList_SamusProjectile_Spazer_SpazerIce_Left_0:
    dw $0002                                                             ;938A1F;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_1D                          ;938A21;
    db $08,$0C                                                           ;938A23;
    dw $0000,$0002                                                       ;938A25;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_1F                          ;938A29;
    db $08,$0C                                                           ;938A2B;
    dw $0001                                                             ;938A2D;

InstList_SamusProjectile_Spazer_SpazerIce_Left_1:
    dw $0002                                                             ;938A2F;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_22                          ;938A31;
    db $08,$14                                                           ;938A33;
    dw $0002                                                             ;938A35;
    dw Instruction_SamusProjectile_GotoY                                 ;938A37;
    dw InstList_SamusProjectile_Spazer_SpazerIce_Left_1                  ;938A39;

InstList_SamusProjectile_Spazer_SpazerIce_UpLeft_0:
    dw $0002                                                             ;938A3B;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_11                          ;938A3D;
    db $08,$08                                                           ;938A3F;
    dw $0000,$0002                                                       ;938A41;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_12                          ;938A45;
    db $0C,$0C                                                           ;938A47;
    dw $0001                                                             ;938A49;

InstList_SamusProjectile_Spazer_SpazerIce_UpLeft_1:
    dw $0002                                                             ;938A4B;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_15                          ;938A4D;
    db $10,$10                                                           ;938A4F;
    dw $0002                                                             ;938A51;
    dw Instruction_SamusProjectile_GotoY                                 ;938A53;
    dw InstList_SamusProjectile_Spazer_SpazerIce_UpLeft_1                ;938A55;

InstList_SamusProjectile_SpazerWave_SpazerIceWave_Up:
    dw $0002                                                             ;938A57;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_23                          ;938A59;
    db $0C,$08                                                           ;938A5B;
    dw $0000,$0002                                                       ;938A5D;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_24                          ;938A61;
    db $0C,$08                                                           ;938A63;
    dw $0001,$0002                                                       ;938A65;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_25                          ;938A69;
    db $0C,$08                                                           ;938A6B;
    dw $0002,$0002                                                       ;938A6D;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_26                          ;938A71;
    db $11,$08                                                           ;938A73;
    dw $0003,$0002                                                       ;938A75;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_27                          ;938A79;
    db $13,$08                                                           ;938A7B;
    dw $0004,$0002                                                       ;938A7D;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_28                          ;938A81;
    db $14,$08                                                           ;938A83;
    dw $0005,$0002                                                       ;938A85;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_27                          ;938A89;
    db $13,$08                                                           ;938A8B;
    dw $0006,$0002                                                       ;938A8D;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_26                          ;938A91;
    db $11,$08                                                           ;938A93;
    dw $0007,$0002                                                       ;938A95;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_25                          ;938A99;
    db $0C,$08                                                           ;938A9B;
    dw $0008,$0002                                                       ;938A9D;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_24                          ;938AA1;
    db $0C,$08                                                           ;938AA3;
    dw $0009                                                             ;938AA5;
    dw Instruction_SamusProjectile_GotoY                                 ;938AA7;
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Up              ;938AA9;

InstList_SamusProjectile_SpazerWave_SpazerIceWave_UpRight:
    dw $0002                                                             ;938AAB;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_0                           ;938AAD;
    db $08,$08                                                           ;938AAF;
    dw $0000,$0002                                                       ;938AB1;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_5                           ;938AB5;
    db $08,$08                                                           ;938AB7;
    dw $0001,$0002                                                       ;938AB9;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_1                           ;938ABD;
    db $0C,$0C                                                           ;938ABF;
    dw $0002,$0002                                                       ;938AC1;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_2                           ;938AC5;
    db $10,$10                                                           ;938AC7;
    dw $0003,$0002                                                       ;938AC9;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_3                           ;938ACD;
    db $10,$10                                                           ;938ACF;
    dw $0004,$0002                                                       ;938AD1;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_4                           ;938AD5;
    db $10,$10                                                           ;938AD7;
    dw $0005,$0002                                                       ;938AD9;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_3                           ;938ADD;
    db $10,$10                                                           ;938ADF;
    dw $0006,$0002                                                       ;938AE1;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_2                           ;938AE5;
    db $10,$10                                                           ;938AE7;
    dw $0007,$0002                                                       ;938AE9;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_1                           ;938AED;
    db $0C,$0C                                                           ;938AEF;
    dw $0008,$0002                                                       ;938AF1;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_5                           ;938AF5;
    db $08,$08                                                           ;938AF7;
    dw $0009                                                             ;938AF9;
    dw Instruction_SamusProjectile_GotoY                                 ;938AFB;
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_UpRight         ;938AFD;

InstList_SamusProjectile_SpazerWave_SpazerIceWave_Right:
    dw $0002                                                             ;938AFF;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_29                          ;938B01;
    db $08,$0C                                                           ;938B03;
    dw $0000,$0002                                                       ;938B05;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_2A                          ;938B09;
    db $08,$0C                                                           ;938B0B;
    dw $0001,$0002                                                       ;938B0D;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_2B                          ;938B11;
    db $08,$0C                                                           ;938B13;
    dw $0002,$0002                                                       ;938B15;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_2C                          ;938B19;
    db $08,$11                                                           ;938B1B;
    dw $0003,$0002                                                       ;938B1D;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_2D                          ;938B21;
    db $08,$13                                                           ;938B23;
    dw $0004,$0002                                                       ;938B25;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_2E                          ;938B29;
    db $08,$14                                                           ;938B2B;
    dw $0005,$0002                                                       ;938B2D;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_2D                          ;938B31;
    db $08,$13                                                           ;938B33;
    dw $0006,$0002                                                       ;938B35;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_2C                          ;938B39;
    db $08,$11                                                           ;938B3B;
    dw $0007,$0002                                                       ;938B3D;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_2B                          ;938B41;
    db $08,$0C                                                           ;938B43;
    dw $0008,$0002                                                       ;938B45;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_2A                          ;938B49;
    db $08,$0C                                                           ;938B4B;
    dw $0009                                                             ;938B4D;
    dw Instruction_SamusProjectile_GotoY                                 ;938B4F;
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Right           ;938B51;

InstList_SamusProjectile_SpazerWave_SpazerIceWave_DownRight:
    dw $0002                                                             ;938B53;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_6                           ;938B55;
    db $08,$08                                                           ;938B57;
    dw $0000,$0002                                                       ;938B59;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_B                           ;938B5D;
    db $08,$08                                                           ;938B5F;
    dw $0001,$0002                                                       ;938B61;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_7                           ;938B65;
    db $0C,$0C                                                           ;938B67;
    dw $0002,$0002                                                       ;938B69;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_8                           ;938B6D;
    db $10,$10                                                           ;938B6F;
    dw $0003,$0002                                                       ;938B71;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_9                           ;938B75;
    db $10,$10                                                           ;938B77;
    dw $0004,$0002                                                       ;938B79;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_A                           ;938B7D;
    db $10,$10                                                           ;938B7F;
    dw $0005,$0002                                                       ;938B81;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_9                           ;938B85;
    db $10,$10                                                           ;938B87;
    dw $0006,$0002                                                       ;938B89;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_8                           ;938B8D;
    db $10,$10                                                           ;938B8F;
    dw $0007,$0002                                                       ;938B91;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_7                           ;938B95;
    db $0C,$0C                                                           ;938B97;
    dw $0008,$0002                                                       ;938B99;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_B                           ;938B9D;
    db $08,$08                                                           ;938B9F;
    dw $0009                                                             ;938BA1;
    dw Instruction_SamusProjectile_GotoY                                 ;938BA3;
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_DownRight       ;938BA5;

InstList_SamusProjectile_SpazerWave_SpazerIceWave_Down:
    dw $0002                                                             ;938BA7;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_17                          ;938BA9;
    db $0C,$08                                                           ;938BAB;
    dw $0000,$0002                                                       ;938BAD;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_18                          ;938BB1;
    db $0C,$08                                                           ;938BB3;
    dw $0001,$0002                                                       ;938BB5;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_19                          ;938BB9;
    db $0C,$08                                                           ;938BBB;
    dw $0002,$0002                                                       ;938BBD;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_1A                          ;938BC1;
    db $11,$08                                                           ;938BC3;
    dw $0003,$0002                                                       ;938BC5;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_1B                          ;938BC9;
    db $13,$08                                                           ;938BCB;
    dw $0004,$0002                                                       ;938BCD;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_1C                          ;938BD1;
    db $14,$08                                                           ;938BD3;
    dw $0005,$0002                                                       ;938BD5;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_1B                          ;938BD9;
    db $13,$08                                                           ;938BDB;
    dw $0006,$0002                                                       ;938BDD;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_1A                          ;938BE1;
    db $11,$08                                                           ;938BE3;
    dw $0007,$0002                                                       ;938BE5;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_19                          ;938BE9;
    db $0C,$08                                                           ;938BEB;
    dw $0008,$0002                                                       ;938BED;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_18                          ;938BF1;
    db $0C,$08                                                           ;938BF3;
    dw $0009                                                             ;938BF5;
    dw Instruction_SamusProjectile_GotoY                                 ;938BF7;
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Down            ;938BF9;

InstList_SamusProjectile_SpazerWave_SpazerIceWave_DownLeft:
    dw $0002                                                             ;938BFB;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_C                           ;938BFD;
    db $08,$08                                                           ;938BFF;
    dw $0000,$0002                                                       ;938C01;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_D                           ;938C05;
    db $08,$08                                                           ;938C07;
    dw $0001,$0002                                                       ;938C09;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_E                           ;938C0D;
    db $0C,$0C                                                           ;938C0F;
    dw $0002,$0002                                                       ;938C11;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_F                           ;938C15;
    db $10,$10                                                           ;938C17;
    dw $0003,$0002                                                       ;938C19;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_10                          ;938C1D;
    db $10,$10                                                           ;938C1F;
    dw $0004,$0002                                                       ;938C21;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_10                          ;938C25;
    db $10,$10                                                           ;938C27;
    dw $0005,$0002                                                       ;938C29;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_10                          ;938C2D;
    db $10,$10                                                           ;938C2F;
    dw $0006,$0002                                                       ;938C31;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_F                           ;938C35;
    db $10,$10                                                           ;938C37;
    dw $0007,$0002                                                       ;938C39;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_E                           ;938C3D;
    db $0C,$0C                                                           ;938C3F;
    dw $0008,$0002                                                       ;938C41;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_D                           ;938C45;
    db $08,$08                                                           ;938C47;
    dw $0009                                                             ;938C49;
    dw Instruction_SamusProjectile_GotoY                                 ;938C4B;
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_DownLeft        ;938C4D;

InstList_SamusProjectile_SpazerWave_SpazerIceWave_Left:
    dw $0002                                                             ;938C4F;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_1D                          ;938C51;
    db $08,$0C                                                           ;938C53;
    dw $0000,$0002                                                       ;938C55;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_1E                          ;938C59;
    db $08,$0C                                                           ;938C5B;
    dw $0001,$0002                                                       ;938C5D;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_1F                          ;938C61;
    db $08,$0C                                                           ;938C63;
    dw $0002,$0002                                                       ;938C65;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_20                          ;938C69;
    db $08,$11                                                           ;938C6B;
    dw $0003,$0002                                                       ;938C6D;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_21                          ;938C71;
    db $08,$13                                                           ;938C73;
    dw $0004,$0002                                                       ;938C75;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_22                          ;938C79;
    db $08,$14                                                           ;938C7B;
    dw $0005,$0002                                                       ;938C7D;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_21                          ;938C81;
    db $08,$13                                                           ;938C83;
    dw $0006,$0002                                                       ;938C85;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_20                          ;938C89;
    db $08,$11                                                           ;938C8B;
    dw $0007,$0002                                                       ;938C8D;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_1F                          ;938C91;
    db $08,$0C                                                           ;938C93;
    dw $0008,$0002                                                       ;938C95;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_1E                          ;938C99;
    db $08,$0C                                                           ;938C9B;
    dw $0009                                                             ;938C9D;
    dw Instruction_SamusProjectile_GotoY                                 ;938C9F;
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Left            ;938CA1;

InstList_SamusProjectile_SpazerWave_SpazerIceWave_UpLeft:
    dw $0002                                                             ;938CA3;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_11                          ;938CA5;
    db $08,$08                                                           ;938CA7;
    dw $0000,$0002                                                       ;938CA9;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_16                          ;938CAD;
    db $08,$08                                                           ;938CAF;
    dw $0001,$0002                                                       ;938CB1;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_12                          ;938CB5;
    db $0C,$0C                                                           ;938CB7;
    dw $0002,$0002                                                       ;938CB9;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_13                          ;938CBD;
    db $10,$10                                                           ;938CBF;
    dw $0003,$0002                                                       ;938CC1;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_14                          ;938CC5;
    db $10,$10                                                           ;938CC7;
    dw $0004,$0002                                                       ;938CC9;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_15                          ;938CCD;
    db $10,$10                                                           ;938CCF;
    dw $0005,$0002                                                       ;938CD1;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_14                          ;938CD5;
    db $10,$10                                                           ;938CD7;
    dw $0006,$0002                                                       ;938CD9;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_13                          ;938CDD;
    db $10,$10                                                           ;938CDF;
    dw $0007,$0002                                                       ;938CE1;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_12                          ;938CE5;
    db $0C,$0C                                                           ;938CE7;
    dw $0008,$0002                                                       ;938CE9;
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_16                          ;938CED;
    db $08,$08                                                           ;938CEF;
    dw $0009                                                             ;938CF1;
    dw Instruction_SamusProjectile_GotoY                                 ;938CF3;
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_UpLeft          ;938CF5;

InstList_SamusProjectile_Plasma_PlasmaIce_Down_Up_0:
    dw $0001                                                             ;938CF7;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_4                   ;938CF9;
    db $08,$10                                                           ;938CFB;
    dw $0000                                                             ;938CFD;

InstList_SamusProjectile_Plasma_PlasmaIce_Down_Up_1:
    dw $000F                                                             ;938CFF;
    dw ProjectileFlareSpritemaps_Plasma_PlasmaIce_2                      ;938D01;
    db $08,$10                                                           ;938D03;
    dw $0001                                                             ;938D05;
    dw Instruction_SamusProjectile_GotoY                                 ;938D07;
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Down_Up_1               ;938D09;

InstList_SamusProjectile_Plasma_PlasmaIce_DownLeft_UpRight_0:
    dw $0001                                                             ;938D0B;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_C                   ;938D0D;
    db $08,$08                                                           ;938D0F;
    dw $0000                                                             ;938D11;

InstList_SamusProjectile_Plasma_PlasmaIce_DownLeft_UpRight_1:
    dw $000F                                                             ;938D13;
    dw ProjectileFlareSpritemaps_Plasma_PlasmaIce_3                      ;938D15;
    db $08,$08                                                           ;938D17;
    dw $0001                                                             ;938D19;
    dw Instruction_SamusProjectile_GotoY                                 ;938D1B;
    dw InstList_SamusProjectile_Plasma_PlasmaIce_DownLeft_UpRight_1      ;938D1D;

InstList_SamusProjectile_Plasma_PlasmaIce_Left_Right_0:
    dw $0001                                                             ;938D1F;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_0                   ;938D21;
    db $08,$08                                                           ;938D23;
    dw $0000                                                             ;938D25;

InstList_SamusProjectile_Plasma_PlasmaIce_Left_Right_1:
    dw $000F                                                             ;938D27;
    dw ProjectileFlareSpritemaps_Plasma_PlasmaIce_0                      ;938D29;
    db $10,$08                                                           ;938D2B;
    dw $0001                                                             ;938D2D;
    dw Instruction_SamusProjectile_GotoY                                 ;938D2F;
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Left_Right_1            ;938D31;

InstList_SamusProjectile_Plasma_PlasmaIce_DownRight_UpLeft_0:
    dw $0001                                                             ;938D33;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_8                   ;938D35;
    db $08,$08                                                           ;938D37;
    dw $0000                                                             ;938D39;

InstList_SamusProjectile_Plasma_PlasmaIce_DownRight_UpLeft_1:
    dw $000F                                                             ;938D3B;
    dw ProjectileFlareSpritemaps_Plasma_PlasmaIce_1                      ;938D3D;
    db $08,$08                                                           ;938D3F;
    dw $0001                                                             ;938D41;
    dw Instruction_SamusProjectile_GotoY                                 ;938D43;
    dw InstList_SamusProjectile_Plasma_PlasmaIce_DownRight_UpLeft_1      ;938D45;

InstList_SamusProjectile_PlasmaIceWave_Down_Up:
    dw $0001                                                             ;938D47;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_4                   ;938D49;
    db $0C,$10                                                           ;938D4B;
    dw $0000                                                             ;938D4D;

InstList_SamusProjectile_PlasmaWave_Down_Up:
    dw $0002                                                             ;938D4F;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_14                       ;938D51;
    db $0C,$10                                                           ;938D53;
    dw $0001,$0002                                                       ;938D55;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_15                       ;938D59;
    db $0C,$10                                                           ;938D5B;
    dw $0002,$0002                                                       ;938D5D;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_16                       ;938D61;
    db $11,$10                                                           ;938D63;
    dw $0003,$0002                                                       ;938D65;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_17                       ;938D69;
    db $13,$10                                                           ;938D6B;
    dw $0004,$0002                                                       ;938D6D;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_18                       ;938D71;
    db $14,$10                                                           ;938D73;
    dw $0005,$0002                                                       ;938D75;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_17                       ;938D79;
    db $13,$10                                                           ;938D7B;
    dw $0006,$0002                                                       ;938D7D;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_16                       ;938D81;
    db $11,$10                                                           ;938D83;
    dw $0007,$0002                                                       ;938D85;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_15                       ;938D89;
    db $0C,$10                                                           ;938D8B;
    dw $0008                                                             ;938D8D;
    dw Instruction_SamusProjectile_GotoY                                 ;938D8F;
    dw InstList_SamusProjectile_PlasmaWave_Down_Up                       ;938D91;

InstList_SamusProjectile_PlasmaIceWave_DownLeft_UpRight:
    dw $0001                                                             ;938D93;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_C                   ;938D95;
    db $08,$08                                                           ;938D97;
    dw $0000                                                             ;938D99;

InstList_SamusProjectile_PlasmaWave_DownLeft_UpRight:
    dw $0002                                                             ;938D9B;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_32                       ;938D9D;
    db $08,$08                                                           ;938D9F;
    dw $0001,$0002                                                       ;938DA1;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_33                       ;938DA5;
    db $0C,$0C                                                           ;938DA7;
    dw $0002,$0002                                                       ;938DA9;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_34                       ;938DAD;
    db $10,$10                                                           ;938DAF;
    dw $0003,$0002                                                       ;938DB1;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_35                       ;938DB5;
    db $10,$10                                                           ;938DB7;
    dw $0004,$0002                                                       ;938DB9;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_36                       ;938DBD;
    db $14,$14                                                           ;938DBF;
    dw $0005,$0002                                                       ;938DC1;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_35                       ;938DC5;
    db $10,$10                                                           ;938DC7;
    dw $0006,$0002                                                       ;938DC9;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_34                       ;938DCD;
    db $10,$10                                                           ;938DCF;
    dw $0007,$0002                                                       ;938DD1;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_33                       ;938DD5;
    db $0C,$0C                                                           ;938DD7;
    dw $0008                                                             ;938DD9;
    dw Instruction_SamusProjectile_GotoY                                 ;938DDB;
    dw InstList_SamusProjectile_PlasmaWave_DownLeft_UpRight              ;938DDD;

InstList_SamusProj_PlasmaWave_PlasmaIceWave_Left_Right_0:
    dw $0001                                                             ;938DDF;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_0                   ;938DE1;
    db $08,$0C                                                           ;938DE3;
    dw $0000                                                             ;938DE5;

InstList_SamusProj_PlasmaWave_PlasmaIceWave_Left_Right_1:
    dw $0002                                                             ;938DE7;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_0                        ;938DE9;
    db $10,$0C                                                           ;938DEB;
    dw $0001,$0002                                                       ;938DED;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_1                        ;938DF1;
    db $10,$0C                                                           ;938DF3;
    dw $0002,$0002                                                       ;938DF5;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_2                        ;938DF9;
    db $10,$11                                                           ;938DFB;
    dw $0003,$0002                                                       ;938DFD;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_3                        ;938E01;
    db $10,$13                                                           ;938E03;
    dw $0004,$0002                                                       ;938E05;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_4                        ;938E09;
    db $10,$14                                                           ;938E0B;
    dw $0005,$0002                                                       ;938E0D;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_3                        ;938E11;
    db $10,$13                                                           ;938E13;
    dw $0006,$0002                                                       ;938E15;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_2                        ;938E19;
    db $10,$11                                                           ;938E1B;
    dw $0007,$0002                                                       ;938E1D;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_1                        ;938E21;
    db $10,$0C                                                           ;938E23;
    dw $0008                                                             ;938E25;
    dw Instruction_SamusProjectile_GotoY                                 ;938E27;
    dw InstList_SamusProj_PlasmaWave_PlasmaIceWave_Left_Right_1          ;938E29;

InstList_SamusProjectile_PlasmaIceWave_DownRight_UpLeft:
    dw $0001                                                             ;938E2B;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_8                   ;938E2D;
    db $08,$08                                                           ;938E2F;
    dw $0000                                                             ;938E31;

InstList_SamusProjectile_PlasmaWave_DownRight_UpLeft:
    dw $0002                                                             ;938E33;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_A                        ;938E35;
    db $08,$08                                                           ;938E37;
    dw $0001,$0002                                                       ;938E39;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_B                        ;938E3D;
    db $0C,$0C                                                           ;938E3F;
    dw $0002,$0002                                                       ;938E41;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_C                        ;938E45;
    db $10,$10                                                           ;938E47;
    dw $0003,$0002                                                       ;938E49;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_D                        ;938E4D;
    db $10,$10                                                           ;938E4F;
    dw $0004,$0002                                                       ;938E51;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_E                        ;938E55;
    db $14,$14                                                           ;938E57;
    dw $0005,$0002                                                       ;938E59;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_D                        ;938E5D;
    db $10,$10                                                           ;938E5F;
    dw $0006,$0002                                                       ;938E61;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_C                        ;938E65;
    db $10,$10                                                           ;938E67;
    dw $0007,$0002                                                       ;938E69;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_B                        ;938E6D;
    db $0C,$0C                                                           ;938E6F;
    dw $0008                                                             ;938E71;
    dw Instruction_SamusProjectile_GotoY                                 ;938E73;
    dw InstList_SamusProjectile_PlasmaWave_DownRight_UpLeft              ;938E75;

InstList_SamusProjectile_Charged_Power_Up:
    dw $0001                                                             ;938E77;
    dw ProjectileFlareSpritemaps_Charged_Power_2                         ;938E79;
    db $08,$08                                                           ;938E7B;
    dw $0000,$0001                                                       ;938E7D;
    dw ProjectileFlareSpritemaps_Charged_Power_A                         ;938E81;
    db $08,$08                                                           ;938E83;
    dw $0001                                                             ;938E85;
    dw Instruction_SamusProjectile_GotoY                                 ;938E87;
    dw InstList_SamusProjectile_Charged_Power_Up                         ;938E89;

InstList_SamusProjectile_Charged_Power_UpRight:
    dw $0001                                                             ;938E8B;
    dw ProjectileFlareSpritemaps_Charged_Power_3                         ;938E8D;
    db $08,$08                                                           ;938E8F;
    dw $0000,$0001                                                       ;938E91;
    dw ProjectileFlareSpritemaps_Charged_Power_B                         ;938E95;
    db $08,$08                                                           ;938E97;
    dw $0001                                                             ;938E99;
    dw Instruction_SamusProjectile_GotoY                                 ;938E9B;
    dw InstList_SamusProjectile_Charged_Power_UpRight                    ;938E9D;

InstList_SamusProjectile_Charged_Power_Right:
    dw $0001                                                             ;938E9F;
    dw ProjectileFlareSpritemaps_Charged_Power_4                         ;938EA1;
    db $08,$08                                                           ;938EA3;
    dw $0000,$0001                                                       ;938EA5;
    dw ProjectileFlareSpritemaps_Charged_Power_C                         ;938EA9;
    db $08,$08                                                           ;938EAB;
    dw $0001                                                             ;938EAD;
    dw Instruction_SamusProjectile_GotoY                                 ;938EAF;
    dw InstList_SamusProjectile_Charged_Power_Right                      ;938EB1;

InstList_SamusProjectile_Charged_Power_DownRight:
    dw $0001                                                             ;938EB3;
    dw ProjectileFlareSpritemaps_Charged_Power_5                         ;938EB5;
    db $08,$08                                                           ;938EB7;
    dw $0000,$0001                                                       ;938EB9;
    dw ProjectileFlareSpritemaps_Charged_Power_D                         ;938EBD;
    db $08,$08                                                           ;938EBF;
    dw $0001                                                             ;938EC1;
    dw Instruction_SamusProjectile_GotoY                                 ;938EC3;
    dw InstList_SamusProjectile_Charged_Power_DownRight                  ;938EC5;

InstList_SamusProjectile_Charged_Power_Down:
    dw $0001                                                             ;938EC7;
    dw ProjectileFlareSpritemaps_Charged_Power_6                         ;938EC9;
    db $08,$08                                                           ;938ECB;
    dw $0000,$0001                                                       ;938ECD;
    dw ProjectileFlareSpritemaps_Charged_Power_E                         ;938ED1;
    db $08,$08                                                           ;938ED3;
    dw $0001                                                             ;938ED5;
    dw Instruction_SamusProjectile_GotoY                                 ;938ED7;
    dw InstList_SamusProjectile_Charged_Power_Down                       ;938ED9;

InstList_SamusProjectile_Charged_Power_DownLeft:
    dw $0001                                                             ;938EDB;
    dw ProjectileFlareSpritemaps_Charged_Power_7                         ;938EDD;
    db $08,$08                                                           ;938EDF;
    dw $0000,$0001                                                       ;938EE1;
    dw ProjectileFlareSpritemaps_Charged_Power_F                         ;938EE5;
    db $08,$08                                                           ;938EE7;
    dw $0001                                                             ;938EE9;
    dw Instruction_SamusProjectile_GotoY                                 ;938EEB;
    dw InstList_SamusProjectile_Charged_Power_DownLeft                   ;938EED;

InstList_SamusProjectile_Charged_Power_Left:
    dw $0001                                                             ;938EEF;
    dw ProjectileFlareSpritemaps_Charged_Power_0                         ;938EF1;
    db $08,$08                                                           ;938EF3;
    dw $0000,$0001                                                       ;938EF5;
    dw ProjectileFlareSpritemaps_Charged_Power_8                         ;938EF9;
    db $08,$08                                                           ;938EFB;
    dw $0001                                                             ;938EFD;
    dw Instruction_SamusProjectile_GotoY                                 ;938EFF;
    dw InstList_SamusProjectile_Charged_Power_Left                       ;938F01;

InstList_SamusProjectile_Charged_Power_UpLeft:
    dw $0001                                                             ;938F03;
    dw ProjectileFlareSpritemaps_Charged_Power_1                         ;938F05;
    db $08,$08                                                           ;938F07;
    dw $0000,$0001                                                       ;938F09;
    dw ProjectileFlareSpritemaps_Charged_Power_9                         ;938F0D;
    db $08,$08                                                           ;938F0F;
    dw $0001                                                             ;938F11;
    dw Instruction_SamusProjectile_GotoY                                 ;938F13;
    dw InstList_SamusProjectile_Charged_Power_UpLeft                     ;938F15;

InstList_SamusProjectile_Charged_Wave_Up:
    dw $0003                                                             ;938F17;
    dw Spritemap_Nothing_93A117                                          ;938F19;
    db $0C,$08                                                           ;938F1B;
    dw $0000                                                             ;938F1D;

InstList_SamusProjectile_Charged_Wave_Down:
    dw $0001                                                             ;938F1F;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_0                   ;938F21;
    db $0C,$08                                                           ;938F23;
    dw $0000,$0001                                                       ;938F25;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1                   ;938F29;
    db $0C,$08                                                           ;938F2B;
    dw $0001,$0001                                                       ;938F2D;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1A                  ;938F31;
    db $10,$08                                                           ;938F33;
    dw $0002,$0001                                                       ;938F35;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1B                  ;938F39;
    db $10,$08                                                           ;938F3B;
    dw $0003,$0001                                                       ;938F3D;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1C                  ;938F41;
    db $14,$08                                                           ;938F43;
    dw $0004,$0001                                                       ;938F45;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1D                  ;938F49;
    db $14,$08                                                           ;938F4B;
    dw $0005,$0001                                                       ;938F4D;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1E                  ;938F51;
    db $17,$08                                                           ;938F53;
    dw $0006,$0001                                                       ;938F55;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1F                  ;938F59;
    db $17,$08                                                           ;938F5B;
    dw $0007,$0001                                                       ;938F5D;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_20                  ;938F61;
    db $18,$08                                                           ;938F63;
    dw $0008,$0001                                                       ;938F65;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_21                  ;938F69;
    db $18,$08                                                           ;938F6B;
    dw $0009,$0001                                                       ;938F6D;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1E                  ;938F71;
    db $17,$08                                                           ;938F73;
    dw $000A,$0001                                                       ;938F75;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1F                  ;938F79;
    db $17,$08                                                           ;938F7B;
    dw $000B,$0001                                                       ;938F7D;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1C                  ;938F81;
    db $14,$08                                                           ;938F83;
    dw $000C,$0001                                                       ;938F85;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1D                  ;938F89;
    db $14,$08                                                           ;938F8B;
    dw $000D,$0001                                                       ;938F8D;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1B                  ;938F91;
    db $10,$08                                                           ;938F93;
    dw $000E,$0001                                                       ;938F95;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1A                  ;938F99;
    db $10,$08                                                           ;938F9B;
    dw $000F                                                             ;938F9D;
    dw Instruction_SamusProjectile_GotoY                                 ;938F9F;
    dw InstList_SamusProjectile_Charged_Wave_Down                        ;938FA1;

InstList_SamusProjectile_Charged_Wave_DownLeft_UpRight:
    dw $0001                                                             ;938FA3;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_0                   ;938FA5;
    db $08,$08                                                           ;938FA7;
    dw $0000,$0001                                                       ;938FA9;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1                   ;938FAD;
    db $08,$08                                                           ;938FAF;
    dw $0001,$0001                                                       ;938FB1;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_12                  ;938FB5;
    db $0C,$0C                                                           ;938FB7;
    dw $0002,$0001                                                       ;938FB9;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_13                  ;938FBD;
    db $0C,$0C                                                           ;938FBF;
    dw $0003,$0001                                                       ;938FC1;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_14                  ;938FC5;
    db $10,$10                                                           ;938FC7;
    dw $0004,$0001                                                       ;938FC9;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_15                  ;938FCD;
    db $10,$10                                                           ;938FCF;
    dw $0005,$0001                                                       ;938FD1;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_16                  ;938FD5;
    db $11,$11                                                           ;938FD7;
    dw $0006,$0001                                                       ;938FD9;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_17                  ;938FDD;
    db $11,$11                                                           ;938FDF;
    dw $0007,$0001                                                       ;938FE1;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_18                  ;938FE5;
    db $12,$12                                                           ;938FE7;
    dw $0008,$0001                                                       ;938FE9;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_19                  ;938FED;
    db $12,$12                                                           ;938FEF;
    dw $0009,$0001                                                       ;938FF1;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_16                  ;938FF5;
    db $11,$11                                                           ;938FF7;
    dw $000A,$0001                                                       ;938FF9;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_17                  ;938FFD;
    db $11,$11                                                           ;938FFF;
    dw $000B,$0001                                                       ;939001;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_14                  ;939005;
    db $10,$10                                                           ;939007;
    dw $000C,$0001                                                       ;939009;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_15                  ;93900D;
    db $10,$10                                                           ;93900F;
    dw $000D,$0001                                                       ;939011;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_12                  ;939015;
    db $0C,$0C                                                           ;939017;
    dw $000E,$0001                                                       ;939019;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_13                  ;93901D;
    db $0C,$0C                                                           ;93901F;
    dw $000F                                                             ;939021;
    dw Instruction_SamusProjectile_GotoY                                 ;939023;
    dw InstList_SamusProjectile_Charged_Wave_DownLeft_UpRight            ;939025;

InstList_SamusProjectile_Charged_Wave_Left_Right:
    dw $0001                                                             ;939027;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_0                   ;939029;
    db $08,$0C                                                           ;93902B;
    dw $0000,$0001                                                       ;93902D;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1                   ;939031;
    db $08,$0C                                                           ;939033;
    dw $0001,$0001                                                       ;939035;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_2                   ;939039;
    db $08,$10                                                           ;93903B;
    dw $0002,$0001                                                       ;93903D;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_3                   ;939041;
    db $08,$10                                                           ;939043;
    dw $0003,$0001                                                       ;939045;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_4                   ;939049;
    db $08,$14                                                           ;93904B;
    dw $0004,$0001                                                       ;93904D;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_5                   ;939051;
    db $08,$14                                                           ;939053;
    dw $0005,$0001                                                       ;939055;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_6                   ;939059;
    db $08,$17                                                           ;93905B;
    dw $0006,$0001                                                       ;93905D;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_7                   ;939061;
    db $08,$17                                                           ;939063;
    dw $0007,$0001                                                       ;939065;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_8                   ;939069;
    db $08,$18                                                           ;93906B;
    dw $0008,$0001                                                       ;93906D;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_9                   ;939071;
    db $08,$18                                                           ;939073;
    dw $0009,$0001                                                       ;939075;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_6                   ;939079;
    db $08,$17                                                           ;93907B;
    dw $000A,$0001                                                       ;93907D;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_7                   ;939081;
    db $08,$17                                                           ;939083;
    dw $000B,$0001                                                       ;939085;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_4                   ;939089;
    db $08,$14                                                           ;93908B;
    dw $000C,$0001                                                       ;93908D;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_5                   ;939091;
    db $08,$14                                                           ;939093;
    dw $000D,$0001                                                       ;939095;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_3                   ;939099;
    db $08,$10                                                           ;93909B;
    dw $000E,$0001                                                       ;93909D;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_2                   ;9390A1;
    db $08,$10                                                           ;9390A3;
    dw $000F                                                             ;9390A5;
    dw Instruction_SamusProjectile_GotoY                                 ;9390A7;
    dw InstList_SamusProjectile_Charged_Wave_Left_Right                  ;9390A9;

InstList_SamusProjectile_Charged_Wave_DownRight_UpLeft:
    dw $0001                                                             ;9390AB;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_0                   ;9390AD;
    db $08,$08                                                           ;9390AF;
    dw $0000,$0001                                                       ;9390B1;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1                   ;9390B5;
    db $08,$08                                                           ;9390B7;
    dw $0001,$0001                                                       ;9390B9;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_A                   ;9390BD;
    db $0C,$0C                                                           ;9390BF;
    dw $0002,$0001                                                       ;9390C1;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_B                   ;9390C5;
    db $0C,$0C                                                           ;9390C7;
    dw $0003,$0001                                                       ;9390C9;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_C                   ;9390CD;
    db $10,$10                                                           ;9390CF;
    dw $0004,$0001                                                       ;9390D1;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_D                   ;9390D5;
    db $10,$10                                                           ;9390D7;
    dw $0005,$0001                                                       ;9390D9;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_E                   ;9390DD;
    db $11,$11                                                           ;9390DF;
    dw $0006,$0001                                                       ;9390E1;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_F                   ;9390E5;
    db $11,$11                                                           ;9390E7;
    dw $0007,$0001                                                       ;9390E9;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_10                  ;9390ED;
    db $12,$12                                                           ;9390EF;
    dw $0008,$0001                                                       ;9390F1;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_11                  ;9390F5;
    db $12,$12                                                           ;9390F7;
    dw $0009,$0001                                                       ;9390F9;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_E                   ;9390FD;
    db $11,$11                                                           ;9390FF;
    dw $000A,$0001                                                       ;939101;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_F                   ;939105;
    db $11,$11                                                           ;939107;
    dw $000B,$0001                                                       ;939109;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_C                   ;93910D;
    db $10,$10                                                           ;93910F;
    dw $000C,$0001                                                       ;939111;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_D                   ;939115;
    db $10,$10                                                           ;939117;
    dw $000D,$0001                                                       ;939119;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_A                   ;93911D;
    db $0C,$0C                                                           ;93911F;
    dw $000E,$0001                                                       ;939121;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_B                   ;939125;
    db $0C,$0C                                                           ;939127;
    dw $000F                                                             ;939129;
    dw Instruction_SamusProjectile_GotoY                                 ;93912B;
    dw InstList_SamusProjectile_Charged_Wave_DownRight_UpLeft            ;93912D;

InstList_SamusProjectile_Charged_Ice:
    dw $0001                                                             ;93912F;
    dw ProjectileFlareSpritemaps_Charged_Ice_0                           ;939131;
    db $08,$08                                                           ;939133;
    dw $0000,$0001                                                       ;939135;
    dw ProjectileFlareSpritemaps_Charged_Ice_1                           ;939139;
    db $08,$08                                                           ;93913B;
    dw $0001,$0001                                                       ;93913D;
    dw ProjectileFlareSpritemaps_Charged_Ice_2                           ;939141;
    db $08,$08                                                           ;939143;
    dw $0002,$0001                                                       ;939145;
    dw ProjectileFlareSpritemaps_Charged_Ice_3                           ;939149;
    db $08,$08                                                           ;93914B;
    dw $0003                                                             ;93914D;
    dw Instruction_SamusProjectile_GotoY                                 ;93914F;
    dw InstList_SamusProjectile_Charged_Ice                              ;939151;

InstList_SamusProjectile_Charged_IW_Up:
    dw $0003                                                             ;939153;
    dw Spritemap_Nothing_93A117                                          ;939155;
    db $0C,$08                                                           ;939157;
    dw $0000                                                             ;939159;

InstList_SamusProjectile_Charged_IW_Down:
    dw $0001                                                             ;93915B;
    dw ProjectileFlareSpritemaps_ChargedIceWave_0                        ;93915D;
    db $0C,$08                                                           ;93915F;
    dw $0000,$0001                                                       ;939161;
    dw ProjectileFlareSpritemaps_ChargedIceWave_1                        ;939165;
    db $0C,$08                                                           ;939167;
    dw $0001,$0001                                                       ;939169;
    dw ProjectileFlareSpritemaps_ChargedIceWave_1C                       ;93916D;
    db $10,$08                                                           ;93916F;
    dw $0002,$0001                                                       ;939171;
    dw ProjectileFlareSpritemaps_ChargedIceWave_1D                       ;939175;
    db $10,$08                                                           ;939177;
    dw $0003,$0001                                                       ;939179;
    dw ProjectileFlareSpritemaps_ChargedIceWave_1E                       ;93917D;
    db $14,$08                                                           ;93917F;
    dw $0004,$0001                                                       ;939181;
    dw ProjectileFlareSpritemaps_ChargedIceWave_1F                       ;939185;
    db $14,$08                                                           ;939187;
    dw $0005,$0001                                                       ;939189;
    dw ProjectileFlareSpritemaps_ChargedIceWave_20                       ;93918D;
    db $17,$08                                                           ;93918F;
    dw $0006,$0001                                                       ;939191;
    dw ProjectileFlareSpritemaps_ChargedIceWave_21                       ;939195;
    db $17,$08                                                           ;939197;
    dw $0007,$0001                                                       ;939199;
    dw ProjectileFlareSpritemaps_ChargedIceWave_22                       ;93919D;
    db $18,$08                                                           ;93919F;
    dw $0008,$0001                                                       ;9391A1;
    dw ProjectileFlareSpritemaps_ChargedIceWave_23                       ;9391A5;
    db $18,$08                                                           ;9391A7;
    dw $0009,$0001                                                       ;9391A9;
    dw ProjectileFlareSpritemaps_ChargedIceWave_20                       ;9391AD;
    db $17,$08                                                           ;9391AF;
    dw $000A,$0001                                                       ;9391B1;
    dw ProjectileFlareSpritemaps_ChargedIceWave_21                       ;9391B5;
    db $17,$08                                                           ;9391B7;
    dw $000B,$0001                                                       ;9391B9;
    dw ProjectileFlareSpritemaps_ChargedIceWave_1E                       ;9391BD;
    db $14,$08                                                           ;9391BF;
    dw $000C,$0001                                                       ;9391C1;
    dw ProjectileFlareSpritemaps_ChargedIceWave_1F                       ;9391C5;
    db $14,$08                                                           ;9391C7;
    dw $000D,$0001                                                       ;9391C9;
    dw ProjectileFlareSpritemaps_ChargedIceWave_1D                       ;9391CD;
    db $10,$08                                                           ;9391CF;
    dw $000E,$0001                                                       ;9391D1;
    dw ProjectileFlareSpritemaps_ChargedIceWave_1C                       ;9391D5;
    db $10,$08                                                           ;9391D7;
    dw $000F                                                             ;9391D9;
    dw Instruction_SamusProjectile_GotoY                                 ;9391DB;
    dw InstList_SamusProjectile_Charged_IW_Down                          ;9391DD;

InstList_SamusProjectile_Charged_IW_DownLeft_UpRight:
    dw $0001                                                             ;9391DF;
    dw ProjectileFlareSpritemaps_ChargedIceWave_0                        ;9391E1;
    db $08,$08                                                           ;9391E3;
    dw $0000,$0001                                                       ;9391E5;
    dw ProjectileFlareSpritemaps_ChargedIceWave_1                        ;9391E9;
    db $08,$08                                                           ;9391EB;
    dw $0001,$0001                                                       ;9391ED;
    dw ProjectileFlareSpritemaps_ChargedIceWave_12                       ;9391F1;
    db $0C,$0C                                                           ;9391F3;
    dw $0002,$0001                                                       ;9391F5;
    dw ProjectileFlareSpritemaps_ChargedIceWave_13                       ;9391F9;
    db $0C,$0C                                                           ;9391FB;
    dw $0003,$0001                                                       ;9391FD;
    dw ProjectileFlareSpritemaps_ChargedIceWave_14                       ;939201;
    db $10,$10                                                           ;939203;
    dw $0004,$0001                                                       ;939205;
    dw ProjectileFlareSpritemaps_ChargedIceWave_15                       ;939209;
    db $10,$10                                                           ;93920B;
    dw $0005,$0001                                                       ;93920D;
    dw ProjectileFlareSpritemaps_ChargedIceWave_16                       ;939211;
    db $11,$11                                                           ;939213;
    dw $0006,$0001                                                       ;939215;
    dw ProjectileFlareSpritemaps_ChargedIceWave_17                       ;939219;
    db $11,$11                                                           ;93921B;
    dw $0007,$0001                                                       ;93921D;
    dw ProjectileFlareSpritemaps_ChargedIceWave_18                       ;939221;
    db $12,$12                                                           ;939223;
    dw $0008,$0001                                                       ;939225;
    dw ProjectileFlareSpritemaps_ChargedIceWave_19                       ;939229;
    db $12,$12                                                           ;93922B;
    dw $0009,$0001                                                       ;93922D;
    dw ProjectileFlareSpritemaps_ChargedIceWave_16                       ;939231;
    db $11,$11                                                           ;939233;
    dw $000A,$0001                                                       ;939235;
    dw ProjectileFlareSpritemaps_ChargedIceWave_17                       ;939239;
    db $11,$11                                                           ;93923B;
    dw $000B,$0001                                                       ;93923D;
    dw ProjectileFlareSpritemaps_ChargedIceWave_14                       ;939241;
    db $10,$10                                                           ;939243;
    dw $000C,$0001                                                       ;939245;
    dw ProjectileFlareSpritemaps_ChargedIceWave_15                       ;939249;
    db $10,$10                                                           ;93924B;
    dw $000D,$0001                                                       ;93924D;
    dw ProjectileFlareSpritemaps_ChargedIceWave_12                       ;939251;
    db $0C,$0C                                                           ;939253;
    dw $000E,$0001                                                       ;939255;
    dw ProjectileFlareSpritemaps_ChargedIceWave_13                       ;939259;
    db $0C,$0C                                                           ;93925B;
    dw $000F                                                             ;93925D;
    dw Instruction_SamusProjectile_GotoY                                 ;93925F;
    dw InstList_SamusProjectile_Charged_IW_DownLeft_UpRight              ;939261;

InstList_SamusProjectile_Charged_IW_Left_Right:
    dw $0001                                                             ;939263;
    dw ProjectileFlareSpritemaps_ChargedIceWave_0                        ;939265;
    db $08,$0C                                                           ;939267;
    dw $0000,$0001                                                       ;939269;
    dw ProjectileFlareSpritemaps_ChargedIceWave_1                        ;93926D;
    db $08,$0C                                                           ;93926F;
    dw $0001,$0001                                                       ;939271;
    dw ProjectileFlareSpritemaps_ChargedIceWave_2                        ;939275;
    db $08,$10                                                           ;939277;
    dw $0002,$0001                                                       ;939279;
    dw ProjectileFlareSpritemaps_ChargedIceWave_3                        ;93927D;
    db $08,$10                                                           ;93927F;
    dw $0003,$0001                                                       ;939281;
    dw ProjectileFlareSpritemaps_ChargedIceWave_4                        ;939285;
    db $08,$14                                                           ;939287;
    dw $0004,$0001                                                       ;939289;
    dw ProjectileFlareSpritemaps_ChargedIceWave_5                        ;93928D;
    db $08,$14                                                           ;93928F;
    dw $0005,$0001                                                       ;939291;
    dw ProjectileFlareSpritemaps_ChargedIceWave_6                        ;939295;
    db $08,$17                                                           ;939297;
    dw $0006,$0001                                                       ;939299;
    dw ProjectileFlareSpritemaps_ChargedIceWave_7                        ;93929D;
    db $08,$17                                                           ;93929F;
    dw $0007,$0001                                                       ;9392A1;
    dw ProjectileFlareSpritemaps_ChargedIceWave_8                        ;9392A5;
    db $08,$18                                                           ;9392A7;
    dw $0008,$0001                                                       ;9392A9;
    dw ProjectileFlareSpritemaps_ChargedIceWave_9                        ;9392AD;
    db $08,$18                                                           ;9392AF;
    dw $0009,$0001                                                       ;9392B1;
    dw ProjectileFlareSpritemaps_ChargedIceWave_6                        ;9392B5;
    db $08,$17                                                           ;9392B7;
    dw $000A,$0001                                                       ;9392B9;
    dw ProjectileFlareSpritemaps_ChargedIceWave_7                        ;9392BD;
    db $08,$17                                                           ;9392BF;
    dw $000B,$0001                                                       ;9392C1;
    dw ProjectileFlareSpritemaps_ChargedIceWave_4                        ;9392C5;
    db $08,$14                                                           ;9392C7;
    dw $000C,$0001                                                       ;9392C9;
    dw ProjectileFlareSpritemaps_ChargedIceWave_5                        ;9392CD;
    db $08,$14                                                           ;9392CF;
    dw $000D,$0001                                                       ;9392D1;
    dw ProjectileFlareSpritemaps_ChargedIceWave_3                        ;9392D5;
    db $08,$10                                                           ;9392D7;
    dw $000E,$0001                                                       ;9392D9;
    dw ProjectileFlareSpritemaps_ChargedIceWave_2                        ;9392DD;
    db $08,$10                                                           ;9392DF;
    dw $000F                                                             ;9392E1;
    dw Instruction_SamusProjectile_GotoY                                 ;9392E3;
    dw InstList_SamusProjectile_Charged_IW_Left_Right                    ;9392E5;

InstList_SamusProjectile_Charged_IW_DownRight_UpLeft:
    dw $0001                                                             ;9392E7;
    dw ProjectileFlareSpritemaps_ChargedIceWave_0                        ;9392E9;
    db $08,$08                                                           ;9392EB;
    dw $0000,$0001                                                       ;9392ED;
    dw ProjectileFlareSpritemaps_ChargedIceWave_1                        ;9392F1;
    db $08,$08                                                           ;9392F3;
    dw $0001,$0001                                                       ;9392F5;
    dw ProjectileFlareSpritemaps_ChargedIceWave_A                        ;9392F9;
    db $0C,$0C                                                           ;9392FB;
    dw $0002,$0001                                                       ;9392FD;
    dw ProjectileFlareSpritemaps_ChargedIceWave_B                        ;939301;
    db $0C,$0C                                                           ;939303;
    dw $0003,$0001                                                       ;939305;
    dw ProjectileFlareSpritemaps_ChargedIceWave_C                        ;939309;
    db $10,$10                                                           ;93930B;
    dw $0004,$0001                                                       ;93930D;
    dw ProjectileFlareSpritemaps_ChargedIceWave_D                        ;939311;
    db $10,$10                                                           ;939313;
    dw $0005,$0001                                                       ;939315;
    dw ProjectileFlareSpritemaps_ChargedIceWave_E                        ;939319;
    db $11,$11                                                           ;93931B;
    dw $0006,$0001                                                       ;93931D;
    dw ProjectileFlareSpritemaps_ChargedIceWave_F                        ;939321;
    db $11,$11                                                           ;939323;
    dw $0007,$0001                                                       ;939325;
    dw ProjectileFlareSpritemaps_ChargedIceWave_10                       ;939329;
    db $12,$12                                                           ;93932B;
    dw $0008,$0001                                                       ;93932D;
    dw ProjectileFlareSpritemaps_ChargedIceWave_11                       ;939331;
    db $12,$12                                                           ;939333;
    dw $0009,$0001                                                       ;939335;
    dw ProjectileFlareSpritemaps_ChargedIceWave_E                        ;939339;
    db $11,$11                                                           ;93933B;
    dw $000A,$0001                                                       ;93933D;
    dw ProjectileFlareSpritemaps_ChargedIceWave_F                        ;939341;
    db $11,$11                                                           ;939343;
    dw $000B,$0001                                                       ;939345;
    dw ProjectileFlareSpritemaps_ChargedIceWave_C                        ;939349;
    db $10,$10                                                           ;93934B;
    dw $000C,$0001                                                       ;93934D;
    dw ProjectileFlareSpritemaps_ChargedIceWave_D                        ;939351;
    db $10,$10                                                           ;939353;
    dw $000D,$0001                                                       ;939355;
    dw ProjectileFlareSpritemaps_ChargedIceWave_A                        ;939359;
    db $0C,$0C                                                           ;93935B;
    dw $000E,$0001                                                       ;93935D;
    dw ProjectileFlareSpritemaps_ChargedIceWave_B                        ;939361;
    db $0C,$0C                                                           ;939363;
    dw $000F                                                             ;939365;
    dw Instruction_SamusProjectile_GotoY                                 ;939367;
    dw InstList_SamusProjectile_Charged_IW_DownRight_UpLeft              ;939369;

InstList_SamusProjectile_Charged_S_SI_Down_Up_0:
    dw $0001                                                             ;93936B;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4C                  ;93936D;
    db $0C,$08                                                           ;93936F;
    dw $0000,$0001                                                       ;939371;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5B                  ;939375;
    db $0C,$08                                                           ;939377;
    dw $0001,$0001                                                       ;939379;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4D                  ;93937D;
    db $0C,$08                                                           ;93937F;
    dw $0002,$0001                                                       ;939381;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5C                  ;939385;
    db $0C,$08                                                           ;939387;
    dw $0003,$0001                                                       ;939389;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3C                  ;93938D;
    db $0C,$10                                                           ;93938F;
    dw $0004,$0001                                                       ;939391;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_6                   ;939395;
    db $0C,$10                                                           ;939397;
    dw $0005,$0001                                                       ;939399;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3E                  ;93939D;
    db $0C,$10                                                           ;93939F;
    dw $0006,$0001                                                       ;9393A1;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_8                   ;9393A5;
    db $0C,$10                                                           ;9393A7;
    dw $0007                                                             ;9393A9;

InstList_SamusProjectile_Charged_S_SI_Down_Up_1:
    dw $0001                                                             ;9393AB;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_41                  ;9393AD;
    db $14,$10                                                           ;9393AF;
    dw $0008,$0001                                                       ;9393B1;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_B                   ;9393B5;
    db $14,$10                                                           ;9393B7;
    dw $0009                                                             ;9393B9;
    dw Instruction_SamusProjectile_GotoY                                 ;9393BB;
    dw InstList_SamusProjectile_Charged_S_SI_Down_Up_1                   ;9393BD;

InstList_SamusProjectile_Charged_S_SI_DownLeft_UpRight_0:
    dw $0001                                                             ;9393BF;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4E                  ;9393C1;
    db $08,$08                                                           ;9393C3;
    dw $0000,$0001                                                       ;9393C5;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5D                  ;9393C9;
    db $08,$08                                                           ;9393CB;
    dw $0001,$0001                                                       ;9393CD;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4F                  ;9393D1;
    db $08,$08                                                           ;9393D3;
    dw $0002,$0001                                                       ;9393D5;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5E                  ;9393D9;
    db $08,$08                                                           ;9393DB;
    dw $0003,$0001                                                       ;9393DD;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_18                  ;9393E1;
    db $0C,$0C                                                           ;9393E3;
    dw $0004,$0001                                                       ;9393E5;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_12                  ;9393E9;
    db $0C,$0C                                                           ;9393EB;
    dw $0005,$0001                                                       ;9393ED;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_19                  ;9393F1;
    db $10,$10                                                           ;9393F3;
    dw $0006,$0001                                                       ;9393F5;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_14                  ;9393F9;
    db $10,$10                                                           ;9393FB;
    dw $0007                                                             ;9393FD;

InstList_SamusProjectile_Charged_S_SI_DownLeft_UpRight_1:
    dw $0001                                                             ;9393FF;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1C                  ;939401;
    db $14,$14                                                           ;939403;
    dw $0008,$0001                                                       ;939405;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_17                  ;939409;
    db $14,$14                                                           ;93940B;
    dw $0009                                                             ;93940D;
    dw Instruction_SamusProjectile_GotoY                                 ;93940F;
    dw InstList_SamusProjectile_Charged_S_SI_DownLeft_UpRight_1          ;939411;

InstList_SamusProjectile_Charged_S_SI_Left_Right_0:
    dw $0001                                                             ;939413;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_51                  ;939415;
    db $08,$0C                                                           ;939417;
    dw $0000,$0001                                                       ;939419;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_57                  ;93941D;
    db $08,$0C                                                           ;93941F;
    dw $0001,$0001                                                       ;939421;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_52                  ;939425;
    db $08,$0C                                                           ;939427;
    dw $0002,$0001                                                       ;939429;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_58                  ;93942D;
    db $08,$0C                                                           ;93942F;
    dw $0003,$0001                                                       ;939431;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_36                  ;939435;
    db $10,$0C                                                           ;939437;
    dw $0004,$0001                                                       ;939439;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_0                   ;93943D;
    db $10,$0C                                                           ;93943F;
    dw $0005,$0001                                                       ;939441;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_38                  ;939445;
    db $10,$0C                                                           ;939447;
    dw $0006,$0001                                                       ;939449;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2                   ;93944D;
    db $10,$0C                                                           ;93944F;
    dw $0007                                                             ;939451;

InstList_SamusProjectile_Charged_S_SI_Left_Right_1:
    dw $0001                                                             ;939453;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3B                  ;939455;
    db $10,$14                                                           ;939457;
    dw $0008,$0001                                                       ;939459;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5                   ;93945D;
    db $10,$14                                                           ;93945F;
    dw $0009                                                             ;939461;
    dw Instruction_SamusProjectile_GotoY                                 ;939463;
    dw InstList_SamusProjectile_Charged_S_SI_Left_Right_1                ;939465;

InstList_SamusProjectile_Charged_S_SI_DownRight_UpLeft_0:
    dw $0001                                                             ;939467;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_53                  ;939469;
    db $08,$08                                                           ;93946B;
    dw $0000,$0001                                                       ;93946D;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_59                  ;939471;
    db $08,$08                                                           ;939473;
    dw $0001,$0001                                                       ;939475;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_54                  ;939479;
    db $08,$08                                                           ;93947B;
    dw $0002,$0001                                                       ;93947D;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5A                  ;939481;
    db $08,$08                                                           ;939483;
    dw $0003,$0001                                                       ;939485;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1E                  ;939489;
    db $0C,$0C                                                           ;93948B;
    dw $0004,$0001                                                       ;93948D;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_C                   ;939491;
    db $0C,$0C                                                           ;939493;
    dw $0005,$0001                                                       ;939495;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1F                  ;939499;
    db $10,$10                                                           ;93949B;
    dw $0006,$0001                                                       ;93949D;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_E                   ;9394A1;
    db $10,$10                                                           ;9394A3;
    dw $0007                                                             ;9394A5;

InstList_SamusProjectile_Charged_S_SI_DownRight_UpLeft_1:
    dw $0001                                                             ;9394A7;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_22                  ;9394A9;
    db $14,$14                                                           ;9394AB;
    dw $0008,$0001                                                       ;9394AD;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_11                  ;9394B1;
    db $14,$14                                                           ;9394B3;
    dw $0009                                                             ;9394B5;
    dw Instruction_SamusProjectile_GotoY                                 ;9394B7;
    dw InstList_SamusProjectile_Charged_S_SI_DownRight_UpLeft_1          ;9394B9;

InstList_SamusProjectile_Charged_SW_SIW_Up_0:
    dw $0001                                                             ;9394BB;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4C                  ;9394BD;
    db $0C,$08                                                           ;9394BF;
    dw $0000,$0001                                                       ;9394C1;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5B                  ;9394C5;
    db $0C,$08                                                           ;9394C7;
    dw $0001,$0001                                                       ;9394C9;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4D                  ;9394CD;
    db $0C,$08                                                           ;9394CF;
    dw $0002,$0001                                                       ;9394D1;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5C                  ;9394D5;
    db $0C,$08                                                           ;9394D7;
    dw $0003                                                             ;9394D9;

InstList_SamusProjectile_Charged_SW_SIW_Up_1:
    dw $0001                                                             ;9394DB;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3C                  ;9394DD;
    db $0C,$10                                                           ;9394DF;
    dw $0004,$0001                                                       ;9394E1;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_6                   ;9394E5;
    db $0C,$10                                                           ;9394E7;
    dw $0005,$0001                                                       ;9394E9;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3D                  ;9394ED;
    db $0C,$10                                                           ;9394EF;
    dw $0006,$0001                                                       ;9394F1;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_7                   ;9394F5;
    db $0C,$10                                                           ;9394F7;
    dw $0007,$0001                                                       ;9394F9;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3E                  ;9394FD;
    db $0C,$10                                                           ;9394FF;
    dw $0008,$0001                                                       ;939501;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_8                   ;939505;
    db $0C,$10                                                           ;939507;
    dw $0009,$0001                                                       ;939509;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3F                  ;93950D;
    db $10,$10                                                           ;93950F;
    dw $000A,$0001                                                       ;939511;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_9                   ;939515;
    db $10,$10                                                           ;939517;
    dw $000B,$0001                                                       ;939519;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_40                  ;93951D;
    db $12,$10                                                           ;93951F;
    dw $000C,$0001                                                       ;939521;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_A                   ;939525;
    db $12,$10                                                           ;939527;
    dw $000D,$0001                                                       ;939529;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_41                  ;93952D;
    db $14,$10                                                           ;93952F;
    dw $000E,$0001                                                       ;939531;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_B                   ;939535;
    db $14,$10                                                           ;939537;
    dw $000F,$0001                                                       ;939539;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_40                  ;93953D;
    db $12,$10                                                           ;93953F;
    dw $0010,$0001                                                       ;939541;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_A                   ;939545;
    db $12,$10                                                           ;939547;
    dw $0011,$0001                                                       ;939549;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3F                  ;93954D;
    db $10,$10                                                           ;93954F;
    dw $0012,$0001                                                       ;939551;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_9                   ;939555;
    db $10,$10                                                           ;939557;
    dw $0013,$0001                                                       ;939559;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3E                  ;93955D;
    db $0C,$10                                                           ;93955F;
    dw $0014,$0001                                                       ;939561;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_8                   ;939565;
    db $0C,$10                                                           ;939567;
    dw $0015,$0001                                                       ;939569;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3D                  ;93956D;
    db $08,$10                                                           ;93956F;
    dw $0016,$0001                                                       ;939571;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_7                   ;939575;
    db $08,$10                                                           ;939577;
    dw $0017                                                             ;939579;
    dw Instruction_SamusProjectile_GotoY                                 ;93957B;
    dw InstList_SamusProjectile_Charged_SW_SIW_Up_1                      ;93957D;

InstList_SamusProjectile_Charged_SW_SIW_UpRight_0:
    dw $0001                                                             ;93957F;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4E                  ;939581;
    db $08,$08                                                           ;939583;
    dw $0000,$0001                                                       ;939585;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5D                  ;939589;
    db $08,$08                                                           ;93958B;
    dw $0001,$0001                                                       ;93958D;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4F                  ;939591;
    db $08,$08                                                           ;939593;
    dw $0002,$0001                                                       ;939595;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5E                  ;939599;
    db $08,$08                                                           ;93959B;
    dw $0003                                                             ;93959D;

InstList_SamusProjectile_Charged_SW_SIW_UpRight_1:
    dw $0001                                                             ;93959F;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_18                  ;9395A1;
    db $0C,$0C                                                           ;9395A3;
    dw $0004,$0001                                                       ;9395A5;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_12                  ;9395A9;
    db $0C,$0C                                                           ;9395AB;
    dw $0005,$0001                                                       ;9395AD;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1D                  ;9395B1;
    db $0C,$0C                                                           ;9395B3;
    dw $0006,$0001                                                       ;9395B5;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_13                  ;9395B9;
    db $0C,$0C                                                           ;9395BB;
    dw $0007,$0001                                                       ;9395BD;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_19                  ;9395C1;
    db $10,$10                                                           ;9395C3;
    dw $0008,$0001                                                       ;9395C5;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_14                  ;9395C9;
    db $10,$10                                                           ;9395CB;
    dw $0009,$0001                                                       ;9395CD;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1A                  ;9395D1;
    db $10,$10                                                           ;9395D3;
    dw $000A,$0001                                                       ;9395D5;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_15                  ;9395D9;
    db $10,$10                                                           ;9395DB;
    dw $000B,$0001                                                       ;9395DD;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1B                  ;9395E1;
    db $10,$10                                                           ;9395E3;
    dw $000C,$0001                                                       ;9395E5;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_16                  ;9395E9;
    db $10,$10                                                           ;9395EB;
    dw $000D,$0001                                                       ;9395ED;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1C                  ;9395F1;
    db $14,$14                                                           ;9395F3;
    dw $000E,$0001                                                       ;9395F5;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_17                  ;9395F9;
    db $14,$14                                                           ;9395FB;
    dw $000F,$0001                                                       ;9395FD;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1B                  ;939601;
    db $10,$10                                                           ;939603;
    dw $0010,$0001                                                       ;939605;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_16                  ;939609;
    db $10,$10                                                           ;93960B;
    dw $0011,$0001                                                       ;93960D;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1A                  ;939611;
    db $10,$10                                                           ;939613;
    dw $0012,$0001                                                       ;939615;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_15                  ;939619;
    db $10,$10                                                           ;93961B;
    dw $0013,$0001                                                       ;93961D;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_19                  ;939621;
    db $10,$10                                                           ;939623;
    dw $0014,$0001                                                       ;939625;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_14                  ;939629;
    db $10,$10                                                           ;93962B;
    dw $0015,$0001                                                       ;93962D;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1D                  ;939631;
    db $0C,$0C                                                           ;939633;
    dw $0016,$0001                                                       ;939635;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_13                  ;939639;
    db $0C,$0C                                                           ;93963B;
    dw $0017                                                             ;93963D;
    dw Instruction_SamusProjectile_GotoY                                 ;93963F;
    dw InstList_SamusProjectile_Charged_SW_SIW_UpRight_1                 ;939641;

InstList_SamusProjectile_Charged_SW_SIW_Right_0:
    dw $0001                                                             ;939643;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_51                  ;939645;
    db $08,$0C                                                           ;939647;
    dw $0000,$0001                                                       ;939649;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_57                  ;93964D;
    db $08,$0C                                                           ;93964F;
    dw $0001,$0001                                                       ;939651;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_52                  ;939655;
    db $08,$0C                                                           ;939657;
    dw $0002,$0001                                                       ;939659;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_58                  ;93965D;
    db $08,$0C                                                           ;93965F;
    dw $0003                                                             ;939661;

InstList_SamusProjectile_Charged_SW_SIW_Right_1:
    dw $0001                                                             ;939663;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_42                  ;939665;
    db $10,$0C                                                           ;939667;
    dw $0004,$0001                                                       ;939669;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_0                   ;93966D;
    db $10,$0C                                                           ;93966F;
    dw $0005,$0001                                                       ;939671;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_43                  ;939675;
    db $10,$0C                                                           ;939677;
    dw $0006,$0001                                                       ;939679;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1                   ;93967D;
    db $10,$0C                                                           ;93967F;
    dw $0007,$0001                                                       ;939681;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_44                  ;939685;
    db $10,$0C                                                           ;939687;
    dw $0008,$0001                                                       ;939689;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2                   ;93968D;
    db $10,$0C                                                           ;93968F;
    dw $0009,$0001                                                       ;939691;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_45                  ;939695;
    db $10,$10                                                           ;939697;
    dw $000A,$0001                                                       ;939699;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3                   ;93969D;
    db $10,$10                                                           ;93969F;
    dw $000B,$0001                                                       ;9396A1;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_46                  ;9396A5;
    db $10,$12                                                           ;9396A7;
    dw $000C,$0001                                                       ;9396A9;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4                   ;9396AD;
    db $10,$12                                                           ;9396AF;
    dw $000D,$0001                                                       ;9396B1;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_47                  ;9396B5;
    db $10,$14                                                           ;9396B7;
    dw $000E,$0001                                                       ;9396B9;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5                   ;9396BD;
    db $10,$14                                                           ;9396BF;
    dw $000F,$0001                                                       ;9396C1;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_46                  ;9396C5;
    db $10,$12                                                           ;9396C7;
    dw $0010,$0001                                                       ;9396C9;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4                   ;9396CD;
    db $10,$12                                                           ;9396CF;
    dw $0011,$0001                                                       ;9396D1;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_45                  ;9396D5;
    db $10,$10                                                           ;9396D7;
    dw $0012,$0001                                                       ;9396D9;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3                   ;9396DD;
    db $10,$10                                                           ;9396DF;
    dw $0013,$0001                                                       ;9396E1;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_44                  ;9396E5;
    db $10,$0C                                                           ;9396E7;
    dw $0014,$0001                                                       ;9396E9;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2                   ;9396ED;
    db $10,$0C                                                           ;9396EF;
    dw $0015,$0001                                                       ;9396F1;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_43                  ;9396F5;
    db $10,$08                                                           ;9396F7;
    dw $0016,$0001                                                       ;9396F9;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1                   ;9396FD;
    db $10,$08                                                           ;9396FF;
    dw $0017                                                             ;939701;
    dw Instruction_SamusProjectile_GotoY                                 ;939703;
    dw InstList_SamusProjectile_Charged_SW_SIW_Right_1                   ;939705;

InstList_SamusProjectile_Charged_SW_SIW_DownRight_0:
    dw $0001                                                             ;939707;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_53                  ;939709;
    db $08,$08                                                           ;93970B;
    dw $0000,$0001                                                       ;93970D;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_59                  ;939711;
    db $08,$08                                                           ;939713;
    dw $0001,$0001                                                       ;939715;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_54                  ;939719;
    db $08,$08                                                           ;93971B;
    dw $0002,$0001                                                       ;93971D;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5A                  ;939721;
    db $08,$08                                                           ;939723;
    dw $0003                                                             ;939725;

InstList_SamusProjectile_Charged_SW_SIW_DownRight_1:
    dw $0001                                                             ;939727;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1E                  ;939729;
    db $0C,$0C                                                           ;93972B;
    dw $0004,$0001                                                       ;93972D;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_C                   ;939731;
    db $0C,$0C                                                           ;939733;
    dw $0005,$0001                                                       ;939735;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_23                  ;939739;
    db $0C,$0C                                                           ;93973B;
    dw $0006,$0001                                                       ;93973D;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_D                   ;939741;
    db $0C,$0C                                                           ;939743;
    dw $0007,$0001                                                       ;939745;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1F                  ;939749;
    db $10,$10                                                           ;93974B;
    dw $0008,$0001                                                       ;93974D;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_E                   ;939751;
    db $10,$10                                                           ;939753;
    dw $0009,$0001                                                       ;939755;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_20                  ;939759;
    db $10,$10                                                           ;93975B;
    dw $000A,$0001                                                       ;93975D;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_F                   ;939761;
    db $10,$10                                                           ;939763;
    dw $000B,$0001                                                       ;939765;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_21                  ;939769;
    db $10,$10                                                           ;93976B;
    dw $000C,$0001                                                       ;93976D;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_10                  ;939771;
    db $10,$10                                                           ;939773;
    dw $000D,$0001                                                       ;939775;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_22                  ;939779;
    db $14,$14                                                           ;93977B;
    dw $000E,$0001                                                       ;93977D;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_11                  ;939781;
    db $14,$14                                                           ;939783;
    dw $000F,$0001                                                       ;939785;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_21                  ;939789;
    db $10,$10                                                           ;93978B;
    dw $0010,$0001                                                       ;93978D;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_10                  ;939791;
    db $10,$10                                                           ;939793;
    dw $0011,$0001                                                       ;939795;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_20                  ;939799;
    db $10,$10                                                           ;93979B;
    dw $0012,$0001                                                       ;93979D;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_F                   ;9397A1;
    db $10,$10                                                           ;9397A3;
    dw $0013,$0001                                                       ;9397A5;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1F                  ;9397A9;
    db $10,$10                                                           ;9397AB;
    dw $0014,$0001                                                       ;9397AD;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_E                   ;9397B1;
    db $10,$10                                                           ;9397B3;
    dw $0015,$0001                                                       ;9397B5;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_23                  ;9397B9;
    db $0C,$0C                                                           ;9397BB;
    dw $0016,$0001                                                       ;9397BD;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_D                   ;9397C1;
    db $0C,$0C                                                           ;9397C3;
    dw $0017                                                             ;9397C5;
    dw Instruction_SamusProjectile_GotoY                                 ;9397C7;
    dw InstList_SamusProjectile_Charged_SW_SIW_DownRight_1               ;9397C9;

InstList_SamusProjectile_Charged_SW_SIW_Down_0:
    dw $0001                                                             ;9397CB;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_55                  ;9397CD;
    db $0C,$08                                                           ;9397CF;
    dw $0000,$0001                                                       ;9397D1;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5B                  ;9397D5;
    db $0C,$08                                                           ;9397D7;
    dw $0001,$0001                                                       ;9397D9;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_56                  ;9397DD;
    db $0C,$08                                                           ;9397DF;
    dw $0002,$0001                                                       ;9397E1;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5C                  ;9397E5;
    db $0C,$08                                                           ;9397E7;
    dw $0003                                                             ;9397E9;

InstList_SamusProjectile_Charged_SW_SIW_Down_1:
    dw $0001                                                             ;9397EB;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_30                  ;9397ED;
    db $0C,$10                                                           ;9397EF;
    dw $0004,$0001                                                       ;9397F1;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_6                   ;9397F5;
    db $0C,$10                                                           ;9397F7;
    dw $0005,$0001                                                       ;9397F9;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_31                  ;9397FD;
    db $0C,$10                                                           ;9397FF;
    dw $0006,$0001                                                       ;939801;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_7                   ;939805;
    db $0C,$10                                                           ;939807;
    dw $0007,$0001                                                       ;939809;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_32                  ;93980D;
    db $0C,$10                                                           ;93980F;
    dw $0008,$0001                                                       ;939811;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_8                   ;939815;
    db $0C,$10                                                           ;939817;
    dw $0009,$0001                                                       ;939819;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_33                  ;93981D;
    db $10,$10                                                           ;93981F;
    dw $000A,$0001                                                       ;939821;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_9                   ;939825;
    db $10,$10                                                           ;939827;
    dw $000B,$0001                                                       ;939829;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_34                  ;93982D;
    db $12,$10                                                           ;93982F;
    dw $000C,$0001                                                       ;939831;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_A                   ;939835;
    db $12,$10                                                           ;939837;
    dw $000D,$0001                                                       ;939839;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_35                  ;93983D;
    db $14,$10                                                           ;93983F;
    dw $000E,$0001                                                       ;939841;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_B                   ;939845;
    db $14,$10                                                           ;939847;
    dw $000F,$0001                                                       ;939849;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_34                  ;93984D;
    db $12,$10                                                           ;93984F;
    dw $0010,$0001                                                       ;939851;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_A                   ;939855;
    db $12,$10                                                           ;939857;
    dw $0011,$0001                                                       ;939859;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_33                  ;93985D;
    db $10,$10                                                           ;93985F;
    dw $0012,$0001                                                       ;939861;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_9                   ;939865;
    db $10,$10                                                           ;939867;
    dw $0013,$0001                                                       ;939869;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_32                  ;93986D;
    db $0C,$10                                                           ;93986F;
    dw $0014,$0001                                                       ;939871;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_8                   ;939875;
    db $0C,$10                                                           ;939877;
    dw $0015,$0001                                                       ;939879;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_31                  ;93987D;
    db $08,$10                                                           ;93987F;
    dw $0016,$0001                                                       ;939881;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_7                   ;939885;
    db $08,$10                                                           ;939887;
    dw $0017                                                             ;939889;
    dw Instruction_SamusProjectile_GotoY                                 ;93988B;
    dw InstList_SamusProjectile_Charged_SW_SIW_Down_1                    ;93988D;

InstList_SamusProjectile_Charged_SW_SIW_DownLeft_0:
    dw $0001                                                             ;93988F;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4E                  ;939891;
    db $08,$08                                                           ;939893;
    dw $0000,$0001                                                       ;939895;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5D                  ;939899;
    db $08,$08                                                           ;93989B;
    dw $0001,$0001                                                       ;93989D;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4F                  ;9398A1;
    db $08,$08                                                           ;9398A3;
    dw $0002,$0001                                                       ;9398A5;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5E                  ;9398A9;
    db $08,$08                                                           ;9398AB;
    dw $0003                                                             ;9398AD;

InstList_SamusProjectile_Charged_SW_SIW_DownLeft_1:
    dw $0001                                                             ;9398AF;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_24                  ;9398B1;
    db $0C,$0C                                                           ;9398B3;
    dw $0004,$0001                                                       ;9398B5;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_12                  ;9398B9;
    db $0C,$0C                                                           ;9398BB;
    dw $0005,$0001                                                       ;9398BD;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_29                  ;9398C1;
    db $0C,$0C                                                           ;9398C3;
    dw $0006,$0001                                                       ;9398C5;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_13                  ;9398C9;
    db $0C,$0C                                                           ;9398CB;
    dw $0007,$0001                                                       ;9398CD;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_25                  ;9398D1;
    db $10,$10                                                           ;9398D3;
    dw $0008,$0001                                                       ;9398D5;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_14                  ;9398D9;
    db $10,$10                                                           ;9398DB;
    dw $0009,$0001                                                       ;9398DD;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_26                  ;9398E1;
    db $10,$10                                                           ;9398E3;
    dw $000A,$0001                                                       ;9398E5;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_15                  ;9398E9;
    db $10,$10                                                           ;9398EB;
    dw $000B,$0001                                                       ;9398ED;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_27                  ;9398F1;
    db $10,$10                                                           ;9398F3;
    dw $000C,$0001                                                       ;9398F5;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_16                  ;9398F9;
    db $10,$10                                                           ;9398FB;
    dw $000D,$0001                                                       ;9398FD;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_28                  ;939901;
    db $14,$14                                                           ;939903;
    dw $000E,$0001                                                       ;939905;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_17                  ;939909;
    db $14,$14                                                           ;93990B;
    dw $000F,$0001                                                       ;93990D;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_27                  ;939911;
    db $10,$10                                                           ;939913;
    dw $0010,$0001                                                       ;939915;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_16                  ;939919;
    db $10,$10                                                           ;93991B;
    dw $0011,$0001                                                       ;93991D;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_26                  ;939921;
    db $10,$10                                                           ;939923;
    dw $0012,$0001                                                       ;939925;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_15                  ;939929;
    db $10,$10                                                           ;93992B;
    dw $0013,$0001                                                       ;93992D;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_25                  ;939931;
    db $10,$10                                                           ;939933;
    dw $0014,$0001                                                       ;939935;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_14                  ;939939;
    db $10,$10                                                           ;93993B;
    dw $0015,$0001                                                       ;93993D;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_29                  ;939941;
    db $0C,$0C                                                           ;939943;
    dw $0016,$0001                                                       ;939945;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_13                  ;939949;
    db $0C,$0C                                                           ;93994B;
    dw $0017                                                             ;93994D;
    dw Instruction_SamusProjectile_GotoY                                 ;93994F;
    dw InstList_SamusProjectile_Charged_SW_SIW_DownLeft_1                ;939951;

InstList_SamusProjectile_Charged_SW_SIW_Left_0:
    dw $0001                                                             ;939953;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_48                  ;939955;
    db $08,$0C                                                           ;939957;
    dw $0000,$0001                                                       ;939959;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_57                  ;93995D;
    db $08,$0C                                                           ;93995F;
    dw $0001,$0001                                                       ;939961;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_49                  ;939965;
    db $08,$0C                                                           ;939967;
    dw $0002,$0001                                                       ;939969;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_58                  ;93996D;
    db $08,$0C                                                           ;93996F;
    dw $0003                                                             ;939971;

InstList_SamusProjectile_Charged_SW_SIW_Left_1:
    dw $0001                                                             ;939973;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_36                  ;939975;
    db $10,$0C                                                           ;939977;
    dw $0004,$0001                                                       ;939979;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_0                   ;93997D;
    db $10,$0C                                                           ;93997F;
    dw $0005,$0001                                                       ;939981;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_37                  ;939985;
    db $10,$0C                                                           ;939987;
    dw $0006,$0001                                                       ;939989;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1                   ;93998D;
    db $10,$0C                                                           ;93998F;
    dw $0007,$0001                                                       ;939991;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_38                  ;939995;
    db $10,$0C                                                           ;939997;
    dw $0008,$0001                                                       ;939999;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2                   ;93999D;
    db $10,$0C                                                           ;93999F;
    dw $0009,$0001                                                       ;9399A1;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_39                  ;9399A5;
    db $10,$10                                                           ;9399A7;
    dw $000A,$0001                                                       ;9399A9;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3                   ;9399AD;
    db $10,$10                                                           ;9399AF;
    dw $000B,$0001                                                       ;9399B1;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3A                  ;9399B5;
    db $10,$12                                                           ;9399B7;
    dw $000C,$0001                                                       ;9399B9;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4                   ;9399BD;
    db $10,$12                                                           ;9399BF;
    dw $000D,$0001                                                       ;9399C1;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3B                  ;9399C5;
    db $10,$14                                                           ;9399C7;
    dw $000E,$0001                                                       ;9399C9;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5                   ;9399CD;
    db $10,$14                                                           ;9399CF;
    dw $000F,$0001                                                       ;9399D1;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3A                  ;9399D5;
    db $10,$12                                                           ;9399D7;
    dw $0010,$0001                                                       ;9399D9;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4                   ;9399DD;
    db $10,$12                                                           ;9399DF;
    dw $0011,$0001                                                       ;9399E1;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_39                  ;9399E5;
    db $10,$10                                                           ;9399E7;
    dw $0012,$0001                                                       ;9399E9;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3                   ;9399ED;
    db $10,$10                                                           ;9399EF;
    dw $0013,$0001                                                       ;9399F1;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_38                  ;9399F5;
    db $10,$0C                                                           ;9399F7;
    dw $0014,$0001                                                       ;9399F9;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2                   ;9399FD;
    db $10,$0C                                                           ;9399FF;
    dw $0015,$0001                                                       ;939A01;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_37                  ;939A05;
    db $10,$08                                                           ;939A07;
    dw $0016,$0001                                                       ;939A09;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1                   ;939A0D;
    db $10,$08                                                           ;939A0F;
    dw $0017                                                             ;939A11;
    dw Instruction_SamusProjectile_GotoY                                 ;939A13;
    dw InstList_SamusProjectile_Charged_SW_SIW_Left_1                    ;939A15;

InstList_SamusProjectile_Charged_SW_SIW_UpLeft_0:
    dw $0001                                                             ;939A17;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4A                  ;939A19;
    db $08,$08                                                           ;939A1B;
    dw $0000,$0001                                                       ;939A1D;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_59                  ;939A21;
    db $08,$08                                                           ;939A23;
    dw $0001,$0001                                                       ;939A25;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4B                  ;939A29;
    db $08,$08                                                           ;939A2B;
    dw $0002,$0001                                                       ;939A2D;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5A                  ;939A31;
    db $08,$08                                                           ;939A33;
    dw $0003                                                             ;939A35;

InstList_SamusProjectile_Charged_SW_SIW_UpLeft_1:
    dw $0001                                                             ;939A37;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2A                  ;939A39;
    db $0C,$0C                                                           ;939A3B;
    dw $0004,$0001                                                       ;939A3D;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_C                   ;939A41;
    db $0C,$0C                                                           ;939A43;
    dw $0005,$0001                                                       ;939A45;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2F                  ;939A49;
    db $0C,$0C                                                           ;939A4B;
    dw $0006,$0001                                                       ;939A4D;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_D                   ;939A51;
    db $0C,$0C                                                           ;939A53;
    dw $0007,$0001                                                       ;939A55;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2B                  ;939A59;
    db $10,$10                                                           ;939A5B;
    dw $0008,$0001                                                       ;939A5D;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_E                   ;939A61;
    db $10,$10                                                           ;939A63;
    dw $0009,$0001                                                       ;939A65;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2C                  ;939A69;
    db $10,$10                                                           ;939A6B;
    dw $000A,$0001                                                       ;939A6D;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_F                   ;939A71;
    db $10,$10                                                           ;939A73;
    dw $000B,$0001                                                       ;939A75;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2D                  ;939A79;
    db $10,$10                                                           ;939A7B;
    dw $000C,$0001                                                       ;939A7D;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_10                  ;939A81;
    db $10,$10                                                           ;939A83;
    dw $000D,$0001                                                       ;939A85;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2E                  ;939A89;
    db $14,$14                                                           ;939A8B;
    dw $000E,$0001                                                       ;939A8D;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_11                  ;939A91;
    db $14,$14                                                           ;939A93;
    dw $000F,$0001                                                       ;939A95;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2D                  ;939A99;
    db $10,$10                                                           ;939A9B;
    dw $0010,$0001                                                       ;939A9D;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_10                  ;939AA1;
    db $10,$10                                                           ;939AA3;
    dw $0011,$0001                                                       ;939AA5;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2C                  ;939AA9;
    db $10,$10                                                           ;939AAB;
    dw $0012,$0001                                                       ;939AAD;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_F                   ;939AB1;
    db $10,$10                                                           ;939AB3;
    dw $0013,$0001                                                       ;939AB5;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2B                  ;939AB9;
    db $10,$10                                                           ;939ABB;
    dw $0014,$0001                                                       ;939ABD;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_E                   ;939AC1;
    db $10,$10                                                           ;939AC3;
    dw $0015,$0001                                                       ;939AC5;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2F                  ;939AC9;
    db $0C,$0C                                                           ;939ACB;
    dw $0016,$0001                                                       ;939ACD;
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_D                   ;939AD1;
    db $0C,$0C                                                           ;939AD3;
    dw $0017                                                             ;939AD5;
    dw Instruction_SamusProjectile_GotoY                                 ;939AD7;
    dw InstList_SamusProjectile_Charged_SW_SIW_UpLeft_1                  ;939AD9;

InstList_SamusProjectile_Charged_P_PI_Down_Up_0:
    dw $0001                                                             ;939ADB;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_4                   ;939ADD;
    db $08,$08                                                           ;939ADF;
    dw $0000,$0001                                                       ;939AE1;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_14                  ;939AE5;
    db $08,$08                                                           ;939AE7;
    dw $0001,$0001                                                       ;939AE9;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_5                   ;939AED;
    db $08,$10                                                           ;939AEF;
    dw $0002,$0001                                                       ;939AF1;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_15                  ;939AF5;
    db $08,$10                                                           ;939AF7;
    dw $0003,$0001                                                       ;939AF9;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_6                   ;939AFD;
    db $08,$18                                                           ;939AFF;
    dw $0004,$0001                                                       ;939B01;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_16                  ;939B05;
    db $08,$18                                                           ;939B07;
    dw $0005                                                             ;939B09;

InstList_SamusProjectile_Charged_P_PI_Down_Up_1:
    dw $0001                                                             ;939B0B;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_7                   ;939B0D;
    db $08,$1C                                                           ;939B0F;
    dw $0006,$0001                                                       ;939B11;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_17                  ;939B15;
    db $08,$1C                                                           ;939B17;
    dw $0007                                                             ;939B19;
    dw Instruction_SamusProjectile_GotoY                                 ;939B1B;
    dw InstList_SamusProjectile_Charged_P_PI_Down_Up_1                   ;939B1D;

InstList_SamusProjectile_Charged_P_PI_DownLeft_UpRight_0:
    dw $0001                                                             ;939B1F;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_C                   ;939B21;
    db $08,$08                                                           ;939B23;
    dw $0000,$0001                                                       ;939B25;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1C                  ;939B29;
    db $08,$08                                                           ;939B2B;
    dw $0001,$0001                                                       ;939B2D;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_D                   ;939B31;
    db $0C,$0C                                                           ;939B33;
    dw $0002,$0001                                                       ;939B35;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1D                  ;939B39;
    db $0C,$0C                                                           ;939B3B;
    dw $0003,$0001                                                       ;939B3D;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_E                   ;939B41;
    db $10,$10                                                           ;939B43;
    dw $0004,$0001                                                       ;939B45;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1E                  ;939B49;
    db $10,$10                                                           ;939B4B;
    dw $0005                                                             ;939B4D;

InstList_SamusProjectile_Charged_P_PI_DownLeft_UpRight_1:
    dw $0001                                                             ;939B4F;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_F                   ;939B51;
    db $14,$14                                                           ;939B53;
    dw $0006,$0001                                                       ;939B55;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1F                  ;939B59;
    db $14,$14                                                           ;939B5B;
    dw $0007                                                             ;939B5D;
    dw Instruction_SamusProjectile_GotoY                                 ;939B5F;
    dw InstList_SamusProjectile_Charged_P_PI_DownLeft_UpRight_1          ;939B61;

InstList_SamusProjectile_Charged_P_PI_Left_Right_0:
    dw $0001                                                             ;939B63;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_0                   ;939B65;
    db $08,$08                                                           ;939B67;
    dw $0000,$0001                                                       ;939B69;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_10                  ;939B6D;
    db $08,$08                                                           ;939B6F;
    dw $0001,$0001                                                       ;939B71;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1                   ;939B75;
    db $10,$08                                                           ;939B77;
    dw $0002,$0001                                                       ;939B79;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_11                  ;939B7D;
    db $10,$08                                                           ;939B7F;
    dw $0003,$0001                                                       ;939B81;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_2                   ;939B85;
    db $18,$08                                                           ;939B87;
    dw $0004,$0001                                                       ;939B89;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_12                  ;939B8D;
    db $18,$08                                                           ;939B8F;
    dw $0005                                                             ;939B91;

InstList_SamusProjectile_Charged_P_PI_Left_Right_1:
    dw $0001                                                             ;939B93;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_3                   ;939B95;
    db $1C,$08                                                           ;939B97;
    dw $0006,$0001                                                       ;939B99;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_13                  ;939B9D;
    db $1C,$08                                                           ;939B9F;
    dw $0007                                                             ;939BA1;
    dw Instruction_SamusProjectile_GotoY                                 ;939BA3;
    dw InstList_SamusProjectile_Charged_P_PI_Left_Right_1                ;939BA5;

InstList_SamusProjectile_Charged_P_PI_DownRight_UpLeft_0:
    dw $0001                                                             ;939BA7;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_8                   ;939BA9;
    db $08,$08                                                           ;939BAB;
    dw $0000,$0001                                                       ;939BAD;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_18                  ;939BB1;
    db $08,$08                                                           ;939BB3;
    dw $0001,$0001                                                       ;939BB5;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_9                   ;939BB9;
    db $0C,$0C                                                           ;939BBB;
    dw $0002,$0001                                                       ;939BBD;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_19                  ;939BC1;
    db $0C,$0C                                                           ;939BC3;
    dw $0003,$0001                                                       ;939BC5;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_A                   ;939BC9;
    db $10,$10                                                           ;939BCB;
    dw $0004,$0001                                                       ;939BCD;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1A                  ;939BD1;
    db $10,$10                                                           ;939BD3;
    dw $0005                                                             ;939BD5;

InstList_SamusProjectile_Charged_P_PI_DownRight_UpLeft_1:
    dw $0001                                                             ;939BD7;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_B                   ;939BD9;
    db $14,$14                                                           ;939BDB;
    dw $0006,$0001                                                       ;939BDD;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1B                  ;939BE1;
    db $14,$14                                                           ;939BE3;
    dw $0007                                                             ;939BE5;
    dw Instruction_SamusProjectile_GotoY                                 ;939BE7;
    dw InstList_SamusProjectile_Charged_P_PI_DownRight_UpLeft_1          ;939BE9;

InstList_SamusProjectile_Charged_PW_PIW_Down_Up_0:
    dw $0001                                                             ;939BEB;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_4                   ;939BED;
    db $0C,$08                                                           ;939BEF;
    dw $0000,$0001                                                       ;939BF1;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_14                  ;939BF5;
    db $0C,$08                                                           ;939BF7;
    dw $0001,$0001                                                       ;939BF9;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_5                   ;939BFD;
    db $0C,$08                                                           ;939BFF;
    dw $0002,$0001                                                       ;939C01;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_15                  ;939C05;
    db $0C,$08                                                           ;939C07;
    dw $0003,$0001                                                       ;939C09;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_6                   ;939C0D;
    db $0C,$18                                                           ;939C0F;
    dw $0004,$0001                                                       ;939C11;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_16                  ;939C15;
    db $0C,$18                                                           ;939C17;
    dw $0005                                                             ;939C19;

InstList_SamusProjectile_Charged_PW_PIW_Down_Up_1:
    dw $0001                                                             ;939C1B;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_19                       ;939C1D;
    db $0C,$1E                                                           ;939C1F;
    dw $0006,$0001                                                       ;939C21;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_28                       ;939C25;
    db $0C,$1E                                                           ;939C27;
    dw $0007,$0001                                                       ;939C29;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_1A                       ;939C2D;
    db $0C,$1E                                                           ;939C2F;
    dw $0008,$0001                                                       ;939C31;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_29                       ;939C35;
    db $0C,$1E                                                           ;939C37;
    dw $0009,$0001                                                       ;939C39;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_1B                       ;939C3D;
    db $11,$1E                                                           ;939C3F;
    dw $000A,$0001                                                       ;939C41;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_2A                       ;939C45;
    db $11,$1E                                                           ;939C47;
    dw $000B,$0001                                                       ;939C49;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_1C                       ;939C4D;
    db $13,$1E                                                           ;939C4F;
    dw $000C,$0001                                                       ;939C51;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_2B                       ;939C55;
    db $13,$1E                                                           ;939C57;
    dw $000D,$0001                                                       ;939C59;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_1D                       ;939C5D;
    db $14,$1E                                                           ;939C5F;
    dw $000E,$0001                                                       ;939C61;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_2C                       ;939C65;
    db $14,$1E                                                           ;939C67;
    dw $000F,$0001                                                       ;939C69;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_1C                       ;939C6D;
    db $13,$1E                                                           ;939C6F;
    dw $0010,$0001                                                       ;939C71;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_2B                       ;939C75;
    db $13,$1E                                                           ;939C77;
    dw $0011,$0001                                                       ;939C79;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_1B                       ;939C7D;
    db $11,$1E                                                           ;939C7F;
    dw $0012,$0001                                                       ;939C81;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_2A                       ;939C85;
    db $11,$1E                                                           ;939C87;
    dw $0013,$0001                                                       ;939C89;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_1A                       ;939C8D;
    db $0C,$1E                                                           ;939C8F;
    dw $0014,$0001                                                       ;939C91;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_29                       ;939C95;
    db $0C,$1E                                                           ;939C97;
    dw $0015                                                             ;939C99;
    dw Instruction_SamusProjectile_GotoY                                 ;939C9B;
    dw InstList_SamusProjectile_Charged_PW_PIW_Down_Up_1                 ;939C9D;

InstList_SamusProjectile_Charged_PW_PIW_DownLeft_UpRight_0:
    dw $0001                                                             ;939C9F;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_C                   ;939CA1;
    db $08,$08                                                           ;939CA3;
    dw $0000,$0001                                                       ;939CA5;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1C                  ;939CA9;
    db $08,$08                                                           ;939CAB;
    dw $0001,$0001                                                       ;939CAD;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_D                   ;939CB1;
    db $08,$08                                                           ;939CB3;
    dw $0002,$0001                                                       ;939CB5;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1D                  ;939CB9;
    db $08,$08                                                           ;939CBB;
    dw $0003,$0001                                                       ;939CBD;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_E                   ;939CC1;
    db $0C,$0C                                                           ;939CC3;
    dw $0004,$0001                                                       ;939CC5;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1E                  ;939CC9;
    db $0C,$0C                                                           ;939CCB;
    dw $0005                                                             ;939CCD;

InstList_SamusProjectile_Charged_PW_PIW_DownLeft_UpRight_1:
    dw $0001                                                             ;939CCF;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_37                       ;939CD1;
    db $0C,$0C                                                           ;939CD3;
    dw $0006,$0001                                                       ;939CD5;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_2D                       ;939CD9;
    db $0C,$0C                                                           ;939CDB;
    dw $0007,$0001                                                       ;939CDD;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_38                       ;939CE1;
    db $10,$10                                                           ;939CE3;
    dw $0008,$0001                                                       ;939CE5;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_2E                       ;939CE9;
    db $10,$10                                                           ;939CEB;
    dw $0009,$0001                                                       ;939CED;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_39                       ;939CF1;
    db $11,$11                                                           ;939CF3;
    dw $000A,$0001                                                       ;939CF5;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_2F                       ;939CF9;
    db $11,$11                                                           ;939CFB;
    dw $000B,$0001                                                       ;939CFD;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_3A                       ;939D01;
    db $14,$14                                                           ;939D03;
    dw $000C,$0001                                                       ;939D05;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_30                       ;939D09;
    db $14,$14                                                           ;939D0B;
    dw $000D,$0001                                                       ;939D0D;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_3B                       ;939D11;
    db $18,$18                                                           ;939D13;
    dw $000E,$0001                                                       ;939D15;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_31                       ;939D19;
    db $18,$18                                                           ;939D1B;
    dw $000F,$0001                                                       ;939D1D;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_3A                       ;939D21;
    db $14,$14                                                           ;939D23;
    dw $0010,$0001                                                       ;939D25;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_30                       ;939D29;
    db $14,$14                                                           ;939D2B;
    dw $0011,$0001                                                       ;939D2D;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_39                       ;939D31;
    db $11,$11                                                           ;939D33;
    dw $0012,$0001                                                       ;939D35;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_2F                       ;939D39;
    db $11,$11                                                           ;939D3B;
    dw $0013,$0001                                                       ;939D3D;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_38                       ;939D41;
    db $10,$10                                                           ;939D43;
    dw $0014,$0001                                                       ;939D45;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_2E                       ;939D49;
    db $10,$10                                                           ;939D4B;
    dw $0015                                                             ;939D4D;
    dw Instruction_SamusProjectile_GotoY                                 ;939D4F;
    dw InstList_SamusProjectile_Charged_PW_PIW_DownLeft_UpRight_1        ;939D51;

InstList_SamusProjectile_Charged_PW_PIW_Left_Right_0:
    dw $0001                                                             ;939D53;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_0                   ;939D55;
    db $08,$0C                                                           ;939D57;
    dw $0000,$0001                                                       ;939D59;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_10                  ;939D5D;
    db $08,$0C                                                           ;939D5F;
    dw $0001,$0001                                                       ;939D61;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1                   ;939D65;
    db $08,$0C                                                           ;939D67;
    dw $0002,$0001                                                       ;939D69;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_11                  ;939D6D;
    db $08,$0C                                                           ;939D6F;
    dw $0003,$0001                                                       ;939D71;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_2                   ;939D75;
    db $18,$0C                                                           ;939D77;
    dw $0004,$0001                                                       ;939D79;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_12                  ;939D7D;
    db $18,$0C                                                           ;939D7F;
    dw $0005                                                             ;939D81;

InstList_SamusProjectile_Charged_PW_PIW_Left_Right_1:
    dw $0001                                                             ;939D83;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_5                        ;939D85;
    db $1C,$0C                                                           ;939D87;
    dw $0006,$0001                                                       ;939D89;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_1E                       ;939D8D;
    db $1C,$0C                                                           ;939D8F;
    dw $0007,$0001                                                       ;939D91;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_6                        ;939D95;
    db $1C,$0C                                                           ;939D97;
    dw $0008,$0001                                                       ;939D99;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_1F                       ;939D9D;
    db $1C,$0C                                                           ;939D9F;
    dw $0009,$0001                                                       ;939DA1;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_7                        ;939DA5;
    db $1C,$11                                                           ;939DA7;
    dw $000A,$0001                                                       ;939DA9;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_20                       ;939DAD;
    db $1C,$11                                                           ;939DAF;
    dw $000B,$0001                                                       ;939DB1;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_8                        ;939DB5;
    db $1C,$13                                                           ;939DB7;
    dw $000C,$0001                                                       ;939DB9;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_21                       ;939DBD;
    db $1C,$13                                                           ;939DBF;
    dw $000D,$0001                                                       ;939DC1;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_9                        ;939DC5;
    db $1C,$14                                                           ;939DC7;
    dw $000E,$0001                                                       ;939DC9;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_22                       ;939DCD;
    db $1C,$14                                                           ;939DCF;
    dw $000F,$0001                                                       ;939DD1;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_8                        ;939DD5;
    db $1C,$13                                                           ;939DD7;
    dw $0010,$0001                                                       ;939DD9;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_21                       ;939DDD;
    db $1C,$13                                                           ;939DDF;
    dw $0011,$0001                                                       ;939DE1;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_7                        ;939DE5;
    db $1C,$11                                                           ;939DE7;
    dw $0012,$0001                                                       ;939DE9;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_20                       ;939DED;
    db $1C,$11                                                           ;939DEF;
    dw $0013,$0001                                                       ;939DF1;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_6                        ;939DF5;
    db $1C,$0C                                                           ;939DF7;
    dw $0014,$0001                                                       ;939DF9;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_1F                       ;939DFD;
    db $1C,$0C                                                           ;939DFF;
    dw $0015                                                             ;939E01;
    dw Instruction_SamusProjectile_GotoY                                 ;939E03;
    dw InstList_SamusProjectile_Charged_PW_PIW_Left_Right_1              ;939E05;

InstList_SamusProjectile_Charged_PW_PIW_DownRight_UpLeft_0:
    dw $0001                                                             ;939E07;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_8                   ;939E09;
    db $08,$08                                                           ;939E0B;
    dw $0000,$0001                                                       ;939E0D;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_18                  ;939E11;
    db $08,$08                                                           ;939E13;
    dw $0001,$0001                                                       ;939E15;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_9                   ;939E19;
    db $08,$08                                                           ;939E1B;
    dw $0002,$0001                                                       ;939E1D;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_19                  ;939E21;
    db $08,$08                                                           ;939E23;
    dw $0003,$0001                                                       ;939E25;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_A                   ;939E29;
    db $0C,$0C                                                           ;939E2B;
    dw $0004,$0001                                                       ;939E2D;
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1A                  ;939E31;
    db $0C,$0C                                                           ;939E33;
    dw $0005                                                             ;939E35;

InstList_SamusProjectile_Charged_PW_PIW_DownRight_UpLeft_1:
    dw $0001                                                             ;939E37;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_F                        ;939E39;
    db $0C,$0C                                                           ;939E3B;
    dw $0006,$0001                                                       ;939E3D;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_23                       ;939E41;
    db $0C,$0C                                                           ;939E43;
    dw $0007,$0001                                                       ;939E45;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_10                       ;939E49;
    db $10,$10                                                           ;939E4B;
    dw $0008,$0001                                                       ;939E4D;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_24                       ;939E51;
    db $10,$10                                                           ;939E53;
    dw $0009,$0001                                                       ;939E55;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_11                       ;939E59;
    db $11,$11                                                           ;939E5B;
    dw $000A,$0001                                                       ;939E5D;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_25                       ;939E61;
    db $11,$11                                                           ;939E63;
    dw $000B,$0001                                                       ;939E65;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_12                       ;939E69;
    db $14,$14                                                           ;939E6B;
    dw $000C,$0001                                                       ;939E6D;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_26                       ;939E71;
    db $14,$14                                                           ;939E73;
    dw $000D,$0001                                                       ;939E75;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_13                       ;939E79;
    db $18,$18                                                           ;939E7B;
    dw $000E,$0001                                                       ;939E7D;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_27                       ;939E81;
    db $18,$18                                                           ;939E83;
    dw $000F,$0001                                                       ;939E85;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_12                       ;939E89;
    db $14,$14                                                           ;939E8B;
    dw $0010,$0001                                                       ;939E8D;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_26                       ;939E91;
    db $14,$14                                                           ;939E93;
    dw $0011,$0001                                                       ;939E95;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_11                       ;939E99;
    db $11,$11                                                           ;939E9B;
    dw $0012,$0001                                                       ;939E9D;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_25                       ;939EA1;
    db $11,$11                                                           ;939EA3;
    dw $0013,$0001                                                       ;939EA5;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_10                       ;939EA9;
    db $10,$10                                                           ;939EAB;
    dw $0014,$0001                                                       ;939EAD;
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_24                       ;939EB1;
    db $10,$10                                                           ;939EB3;
    dw $0015                                                             ;939EB5;
    dw Instruction_SamusProjectile_GotoY                                 ;939EB7;
    dw InstList_SamusProjectile_Charged_PW_PIW_DownRight_UpLeft_1        ;939EB9;

InstList_SamusProjectile_Missiles_Up:
    dw $000F                                                             ;939EBB;
    dw ProjectileFlareSpritemaps_Missile_2                               ;939EBD;
    db $04,$04                                                           ;939EBF;
    dw $0000                                                             ;939EC1;
    dw Instruction_SamusProjectile_GotoY                                 ;939EC3;
    dw InstList_SamusProjectile_Missiles_Up                              ;939EC5;

InstList_SamusProjectile_Missiles_UpRight:
    dw $000F                                                             ;939EC7;
    dw ProjectileFlareSpritemaps_Missile_3                               ;939EC9;
    db $04,$04                                                           ;939ECB;
    dw $0000                                                             ;939ECD;
    dw Instruction_SamusProjectile_GotoY                                 ;939ECF;
    dw InstList_SamusProjectile_Missiles_UpRight                         ;939ED1;

InstList_SamusProjectile_Missiles_Right:
    dw $000F                                                             ;939ED3;
    dw ProjectileFlareSpritemaps_Missile_4                               ;939ED5;
    db $04,$04                                                           ;939ED7;
    dw $0000                                                             ;939ED9;
    dw Instruction_SamusProjectile_GotoY                                 ;939EDB;
    dw InstList_SamusProjectile_Missiles_Right                           ;939EDD;

InstList_SamusProjectile_Missiles_DownRight:
    dw $000F                                                             ;939EDF;
    dw ProjectileFlareSpritemaps_Missile_5                               ;939EE1;
    db $04,$04                                                           ;939EE3;
    dw $0000                                                             ;939EE5;
    dw Instruction_SamusProjectile_GotoY                                 ;939EE7;
    dw InstList_SamusProjectile_Missiles_DownRight                       ;939EE9;

InstList_SamusProjectile_Missiles_Down:
    dw $000F                                                             ;939EEB;
    dw ProjectileFlareSpritemaps_Missile_6                               ;939EED;
    db $04,$04                                                           ;939EEF;
    dw $0000                                                             ;939EF1;
    dw Instruction_SamusProjectile_GotoY                                 ;939EF3;
    dw InstList_SamusProjectile_Missiles_Down                            ;939EF5;

InstList_SamusProjectile_Missiles_DownLeft:
    dw $000F                                                             ;939EF7;
    dw ProjectileFlareSpritemaps_Missile_7                               ;939EF9;
    db $04,$04                                                           ;939EFB;
    dw $0000                                                             ;939EFD;
    dw Instruction_SamusProjectile_GotoY                                 ;939EFF;
    dw InstList_SamusProjectile_Missiles_DownLeft                        ;939F01;

InstList_SamusProjectile_Missiles_Left:
    dw $000F                                                             ;939F03;
    dw ProjectileFlareSpritemaps_Missile_0                               ;939F05;
    db $04,$04                                                           ;939F07;
    dw $0000                                                             ;939F09;
    dw Instruction_SamusProjectile_GotoY                                 ;939F0B;
    dw InstList_SamusProjectile_Missiles_Left                            ;939F0D;

InstList_SamusProjectile_Missiles_UpLeft:
    dw $000F                                                             ;939F0F;
    dw ProjectileFlareSpritemaps_Missile_1                               ;939F11;
    db $04,$04                                                           ;939F13;
    dw $0000                                                             ;939F15;
    dw Instruction_SamusProjectile_GotoY                                 ;939F17;
    dw InstList_SamusProjectile_Missiles_UpLeft                          ;939F19;

InstList_SamusProjectile_SuperMissiles_Up:
    dw $000F                                                             ;939F1B;
    dw ProjectileFlareSpritemaps_SuperMissile_2                          ;939F1D;
    db $08,$08                                                           ;939F1F;
    dw $0000                                                             ;939F21;
    dw Instruction_SamusProjectile_GotoY                                 ;939F23;
    dw InstList_SamusProjectile_SuperMissiles_Up                         ;939F25;

InstList_SamusProjectile_SuperMissiles_UpRight:
    dw $000F                                                             ;939F27;
    dw ProjectileFlareSpritemaps_SuperMissile_3                          ;939F29;
    db $08,$08                                                           ;939F2B;
    dw $0000                                                             ;939F2D;
    dw Instruction_SamusProjectile_GotoY                                 ;939F2F;
    dw InstList_SamusProjectile_SuperMissiles_UpRight                    ;939F31;

InstList_SamusProjectile_SuperMissiles_Right:
    dw $000F                                                             ;939F33;
    dw ProjectileFlareSpritemaps_SuperMissile_4                          ;939F35;
    db $08,$08                                                           ;939F37;
    dw $0000                                                             ;939F39;
    dw Instruction_SamusProjectile_GotoY                                 ;939F3B;
    dw InstList_SamusProjectile_SuperMissiles_Right                      ;939F3D;

InstList_SamusProjectile_SuperMissiles_DownRight:
    dw $000F                                                             ;939F3F;
    dw ProjectileFlareSpritemaps_SuperMissile_5                          ;939F41;
    db $08,$08                                                           ;939F43;
    dw $0000                                                             ;939F45;
    dw Instruction_SamusProjectile_GotoY                                 ;939F47;
    dw InstList_SamusProjectile_SuperMissiles_DownRight                  ;939F49;

InstList_SamusProjectile_SuperMissiles_Down:
    dw $000F                                                             ;939F4B;
    dw ProjectileFlareSpritemaps_SuperMissile_6                          ;939F4D;
    db $08,$08                                                           ;939F4F;
    dw $0000                                                             ;939F51;
    dw Instruction_SamusProjectile_GotoY                                 ;939F53;
    dw InstList_SamusProjectile_SuperMissiles_Down                       ;939F55;

InstList_SamusProjectile_SuperMissiles_DownLeft:
    dw $000F                                                             ;939F57;
    dw ProjectileFlareSpritemaps_SuperMissile_7                          ;939F59;
    db $08,$08                                                           ;939F5B;
    dw $0000                                                             ;939F5D;
    dw Instruction_SamusProjectile_GotoY                                 ;939F5F;
    dw InstList_SamusProjectile_SuperMissiles_DownLeft                   ;939F61;

InstList_SamusProjectile_SuperMissiles_Left:
    dw $000F                                                             ;939F63;
    dw ProjectileFlareSpritemaps_SuperMissile_0                          ;939F65;
    db $08,$08                                                           ;939F67;
    dw $0000                                                             ;939F69;
    dw Instruction_SamusProjectile_GotoY                                 ;939F6B;
    dw InstList_SamusProjectile_SuperMissiles_Left                       ;939F6D;

InstList_SamusProjectile_SuperMissiles_UpLeft:
    dw $000F                                                             ;939F6F;
    dw ProjectileFlareSpritemaps_SuperMissile_1                          ;939F71;
    db $08,$08                                                           ;939F73;
    dw $0000                                                             ;939F75;
    dw Instruction_SamusProjectile_GotoY                                 ;939F77;
    dw InstList_SamusProjectile_SuperMissiles_UpLeft                     ;939F79;

InstList_SamusProjectile_SuperMissileLink_:
    dw $000F                                                             ;939F7B;
    dw Spritemap_Nothing_93A117                                          ;939F7D;
    db $08,$08                                                           ;939F7F;
    dw $0000                                                             ;939F81;
    dw Instruction_SamusProjectile_GotoY                                 ;939F83;
    dw InstList_SamusProjectile_SuperMissileLink_                        ;939F85;

InstList_SamusProjectile_PowerBomb:
    dw $0005                                                             ;939F87;
    dw ProjectileFlareSpritemaps_PowerBomb_0                             ;939F89;
    db $04,$04                                                           ;939F8B;
    dw $0000,$0005                                                       ;939F8D;
    dw ProjectileFlareSpritemaps_PowerBomb_1                             ;939F91;
    db $04,$04                                                           ;939F93;
    dw $0000,$0005                                                       ;939F95;
    dw ProjectileFlareSpritemaps_PowerBomb_2                             ;939F99;
    db $04,$04                                                           ;939F9B;
    dw $0000                                                             ;939F9D;
    dw Instruction_SamusProjectile_GotoY                                 ;939F9F;
    dw InstList_SamusProjectile_PowerBomb                                ;939FA1;

InstList_SamusProjectile_PowerBomb_FastAnimation:
    dw $0001                                                             ;939FA3;
    dw ProjectileFlareSpritemaps_PowerBomb_0                             ;939FA5;
    db $04,$04                                                           ;939FA7;
    dw $0000,$0001                                                       ;939FA9;
    dw ProjectileFlareSpritemaps_PowerBomb_1                             ;939FAD;
    db $04,$04                                                           ;939FAF;
    dw $0000,$0001                                                       ;939FB1;
    dw ProjectileFlareSpritemaps_PowerBomb_2                             ;939FB5;
    db $04,$04                                                           ;939FB7;
    dw $0000                                                             ;939FB9;
    dw Instruction_SamusProjectile_GotoY                                 ;939FBB;
    dw InstList_SamusProjectile_PowerBomb_FastAnimation                  ;939FBD;

InstList_SamusProjectile_Bomb:
    dw $0005                                                             ;939FBF;
    dw ProjectileFlareSpritemaps_Bomb_0                                  ;939FC1;
    db $04,$04                                                           ;939FC3;
    dw $0000,$0005                                                       ;939FC5;
    dw ProjectileFlareSpritemaps_Bomb_1                                  ;939FC9;
    db $04,$04                                                           ;939FCB;
    dw $0000,$0005                                                       ;939FCD;
    dw ProjectileFlareSpritemaps_Bomb_2                                  ;939FD1;
    db $04,$04                                                           ;939FD3;
    dw $0000,$0005                                                       ;939FD5;
    dw ProjectileFlareSpritemaps_Bomb_3                                  ;939FD9;
    db $04,$04                                                           ;939FDB;
    dw $0000                                                             ;939FDD;
    dw Instruction_SamusProjectile_GotoY                                 ;939FDF;
    dw InstList_SamusProjectile_Bomb                                     ;939FE1;

InstList_SamusProjectile_Bomb_FastAnimation:
    dw $0001                                                             ;939FE3;
    dw ProjectileFlareSpritemaps_Bomb_0                                  ;939FE5;
    db $04,$04                                                           ;939FE7;
    dw $0000,$0001                                                       ;939FE9;
    dw ProjectileFlareSpritemaps_Bomb_1                                  ;939FED;
    db $04,$04                                                           ;939FEF;
    dw $0000,$0001                                                       ;939FF1;
    dw ProjectileFlareSpritemaps_Bomb_2                                  ;939FF5;
    db $04,$04                                                           ;939FF7;
    dw $0000,$0001                                                       ;939FF9;
    dw ProjectileFlareSpritemaps_Bomb_3                                  ;939FFD;
    db $04,$04                                                           ;939FFF;
    dw $0000                                                             ;93A001;
    dw Instruction_SamusProjectile_GotoY                                 ;93A003;
    dw InstList_SamusProjectile_Bomb_FastAnimation                       ;93A005;

InstList_SamusProjectile_BeamExplosion:
    dw $0003                                                             ;93A007;
    dw ProjectileFlareSpritemaps_BeamExplosion_0                         ;93A009;
    db $00,$00                                                           ;93A00B;
    dw $0000,$0003                                                       ;93A00D;
    dw ProjectileFlareSpritemaps_BeamExplosion_1                         ;93A011;
    db $00,$00                                                           ;93A013;
    dw $0000,$0003                                                       ;93A015;
    dw ProjectileFlareSpritemaps_BeamExplosion_2                         ;93A019;
    db $00,$00                                                           ;93A01B;
    dw $0000,$0003                                                       ;93A01D;
    dw ProjectileFlareSpritemaps_BeamExplosion_3                         ;93A021;
    db $00,$00                                                           ;93A023;
    dw $0000,$0003                                                       ;93A025;
    dw ProjectileFlareSpritemaps_BeamExplosion_4                         ;93A029;
    db $00,$00                                                           ;93A02B;
    dw $0000,$0003                                                       ;93A02D;
    dw ProjectileFlareSpritemaps_BeamExplosion_5                         ;93A031;
    db $00,$00                                                           ;93A033;
    dw $0000                                                             ;93A035;
    dw Instruction_SamusProjectile_Delete                                ;93A037;

InstList_SamusProjectile_MissileExplosion:
    dw $0003                                                             ;93A039;
    dw ProjectileFlareSpritemaps_MissileExplosion_0                      ;93A03B;
    db $08,$08                                                           ;93A03D;
    dw $0000,$0003                                                       ;93A03F;
    dw ProjectileFlareSpritemaps_MissileExplosion_1                      ;93A043;
    db $08,$08                                                           ;93A045;
    dw $0000,$0003                                                       ;93A047;
    dw ProjectileFlareSpritemaps_MissileExplosion_2                      ;93A04B;
    db $08,$08                                                           ;93A04D;
    dw $0000,$0003                                                       ;93A04F;
    dw ProjectileFlareSpritemaps_MissileExplosion_3                      ;93A053;
    db $08,$08                                                           ;93A055;
    dw $0000,$0003                                                       ;93A057;
    dw ProjectileFlareSpritemaps_MissileExplosion_4                      ;93A05B;
    db $08,$08                                                           ;93A05D;
    dw $0000,$0003                                                       ;93A05F;
    dw ProjectileFlareSpritemaps_MissileExplosion_5                      ;93A063;
    db $08,$08                                                           ;93A065;
    dw $0000                                                             ;93A067;
    dw Instruction_SamusProjectile_Delete                                ;93A069;

InstList_SamusProjectile_BombExplosion:
    dw $0002                                                             ;93A06B;
    dw ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_0               ;93A06D;
    db $08,$08                                                           ;93A06F;
    dw $0000,$0002                                                       ;93A071;
    dw ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_1               ;93A075;
    db $0C,$0C                                                           ;93A077;
    dw $0000,$0002                                                       ;93A079;
    dw ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_2               ;93A07D;
    db $10,$10                                                           ;93A07F;
    dw $0000,$0002                                                       ;93A081;
    dw ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_3               ;93A085;
    db $10,$10                                                           ;93A087;
    dw $0000,$0002                                                       ;93A089;
    dw ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_4               ;93A08D;
    db $10,$10                                                           ;93A08F;
    dw $0000                                                             ;93A091;
    dw Instruction_SamusProjectile_Delete                                ;93A093;

InstList_SamusProjectile_PlasmaSBA:
    dw $0002                                                             ;93A095;
    dw ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_0               ;93A097;
    db $08,$08                                                           ;93A099;
    dw $0000,$0002                                                       ;93A09B;
    dw ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_1               ;93A09F;
    db $0C,$0C                                                           ;93A0A1;
    dw $0000,$0002                                                       ;93A0A3;
    dw ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_2               ;93A0A7;
    db $10,$10                                                           ;93A0A9;
    dw $0000,$0002                                                       ;93A0AB;
    dw ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_3               ;93A0AF;
    db $10,$10                                                           ;93A0B1;
    dw $0000,$0002                                                       ;93A0B3;
    dw ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_4               ;93A0B7;
    db $10,$10                                                           ;93A0B9;
    dw $0000                                                             ;93A0BB;
    dw Instruction_SamusProjectile_GotoY                                 ;93A0BD;
    dw InstList_SamusProjectile_PlasmaSBA                                ;93A0BF;

InstList_SamusProjectile_SuperMissileExplosion:
    dw $0005                                                             ;93A0C1;
    dw ProjectileFlareSpritemaps_SuperMissileExplosion_0                 ;93A0C3;
    db $08,$08                                                           ;93A0C5;
    dw $0000,$0005                                                       ;93A0C7;
    dw ProjectileFlareSpritemaps_SuperMissileExplosion_1                 ;93A0CB;
    db $0C,$0C                                                           ;93A0CD;
    dw $0000,$0005                                                       ;93A0CF;
    dw ProjectileFlareSpritemaps_SuperMissileExplosion_2                 ;93A0D3;
    db $10,$10                                                           ;93A0D5;
    dw $0000,$0005                                                       ;93A0D7;
    dw ProjectileFlareSpritemaps_SuperMissileExplosion_3                 ;93A0DB;
    db $10,$10                                                           ;93A0DD;
    dw $0000,$0005                                                       ;93A0DF;
    dw ProjectileFlareSpritemaps_SuperMissileExplosion_4                 ;93A0E3;
    db $10,$10                                                           ;93A0E5;
    dw $0000,$0005                                                       ;93A0E7;
    dw ProjectileFlareSpritemaps_SuperMissileExplosion_5                 ;93A0EB;
    db $10,$10                                                           ;93A0ED;
    dw $0000                                                             ;93A0EF;
    dw Instruction_SamusProjectile_Delete                                ;93A0F1;

UNUSED_InstList_SamusProjectile_Projectile25_93A0F3:
    dw $0002                                                             ;93A0F3;
    dw Spritemap_Nothing_93A117                                          ;93A0F5;
    db $10,$20                                                           ;93A0F7;
    dw $0000,$0002                                                       ;93A0F9;
    dw Spritemap_Nothing_93A117                                          ;93A0FD;
    db $10,$20                                                           ;93A0FF;
    dw $0001,$0002                                                       ;93A101;
    dw Spritemap_Nothing_93A117                                          ;93A105;
    db $10,$20                                                           ;93A107;
    dw $0002,$0002                                                       ;93A109;
    dw Spritemap_Nothing_93A117                                          ;93A10D;
    db $10,$20                                                           ;93A10F;
    dw $0003                                                             ;93A111;
    dw Instruction_SamusProjectile_GotoY                                 ;93A113;
    dw UNUSED_InstList_SamusProjectile_Projectile25_93A0F3               ;93A115;

Spritemap_Nothing_93A117:
    dw $0000                                                             ;93A117;

InstList_SamusProjectile_ShinesparkEcho:
    dw $0002                                                             ;93A119;
    dw Spritemap_Nothing_93A117                                          ;93A11B;
    db $20,$20                                                           ;93A11D;
    dw $0000,$0002                                                       ;93A11F;
    dw Spritemap_Nothing_93A117                                          ;93A123;
    db $20,$20                                                           ;93A125;
    dw $0001,$0002                                                       ;93A127;
    dw Spritemap_Nothing_93A117                                          ;93A12B;
    db $20,$20                                                           ;93A12D;
    dw $0002,$0002                                                       ;93A12F;
    dw Spritemap_Nothing_93A117                                          ;93A133;
    db $20,$20                                                           ;93A135;
    dw $0003                                                             ;93A137;
    dw Instruction_SamusProjectile_GotoY                                 ;93A139;
    dw InstList_SamusProjectile_ShinesparkEcho                           ;93A13B;

InstList_SamusProjectile_SpazerSBATrail_0:
    dw $0002                                                             ;93A13D;
    dw Spritemap_Nothing_93A117                                          ;93A13F;
    db $04,$08                                                           ;93A141;
    dw $0000,$0002                                                       ;93A143;
    dw Spritemap_Nothing_93A117                                          ;93A147;
    db $0C,$08                                                           ;93A149;
    dw $0001                                                             ;93A14B;

InstList_SamusProjectile_SpazerSBATrail_1:
    dw $0002                                                             ;93A14D;
    dw Spritemap_Nothing_93A117                                          ;93A14F;
    db $14,$08                                                           ;93A151;
    dw $0002                                                             ;93A153;
    dw Instruction_SamusProjectile_GotoY                                 ;93A155;
    dw InstList_SamusProjectile_SpazerSBATrail_1                         ;93A157;

InstList_SamusProjectile_WaveSBA:
    dw $0008                                                             ;93A159;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_0                   ;93A15B;
    db $04,$04                                                           ;93A15D;
    dw $0000,$0008                                                       ;93A15F;
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1                   ;93A163;
    db $04,$04                                                           ;93A165;
    dw $0001                                                             ;93A167;
    dw Instruction_SamusProjectile_GotoY                                 ;93A169;
    dw InstList_SamusProjectile_WaveSBA                                  ;93A16B;

UNUSED_InstList_SamusProjectile_Projectile27_93A16D:
    dw $0003                                                             ;93A16D;
    dw ProjectileFlareSpritemaps_BeamExplosion_0                         ;93A16F;
    db $00,$00                                                           ;93A171;
    dw $0000,$0003                                                       ;93A173;
    dw ProjectileFlareSpritemaps_BeamExplosion_1                         ;93A177;
    db $00,$00                                                           ;93A179;
    dw $0000,$0003                                                       ;93A17B;
    dw ProjectileFlareSpritemaps_BeamExplosion_2                         ;93A17F;
    db $00,$00                                                           ;93A181;
    dw $0000,$0003                                                       ;93A183;
    dw ProjectileFlareSpritemaps_BeamExplosion_3                         ;93A187;
    db $00,$00                                                           ;93A189;
    dw $0000,$0003                                                       ;93A18B;
    dw ProjectileFlareSpritemaps_BeamExplosion_4                         ;93A18F;
    db $00,$00                                                           ;93A191;
    dw $0000,$0003                                                       ;93A193;
    dw ProjectileFlareSpritemaps_BeamExplosion_5                         ;93A197;
    db $00,$00                                                           ;93A199;
    dw $0000                                                             ;93A19B;
    dw Instruction_SamusProjectile_GotoY                                 ;93A19D;
    dw UNUSED_InstList_SamusProjectile_Projectile27_93A16D               ;93A19F;

FlareSpritemapPointers:
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_0            ;93A1A1;
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_1            ;93A1A3;
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_0            ;93A1A5;
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_1            ;93A1A7;
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_0            ;93A1A9;
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_1            ;93A1AB;
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_0            ;93A1AD;
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_1            ;93A1AF;
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_2            ;93A1B1;
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_1            ;93A1B3;
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_2            ;93A1B5;
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_1            ;93A1B7;
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_2            ;93A1B9;
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_1            ;93A1BB;
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_2            ;93A1BD;
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_1            ;93A1BF;
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_2            ;93A1C1;
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_3            ;93A1C3;
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_2            ;93A1C5;
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_3            ;93A1C7;
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_2            ;93A1C9;
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_3            ;93A1CB;
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_2            ;93A1CD;
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_3            ;93A1CF;
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_2            ;93A1D1;
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_3            ;93A1D3;
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_2            ;93A1D5;
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_3            ;93A1D7;
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_2            ;93A1D9;
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_3            ;93A1DB;
    dw ProjectileFlareSpritemaps_FlareSlowSparks_FacingRight_0           ;93A1DD;
    dw ProjectileFlareSpritemaps_FlareSlowSparks_FacingRight_1           ;93A1DF;
    dw ProjectileFlareSpritemaps_FlareSlowSparks_FacingRight_2           ;93A1E1;
    dw ProjectileFlareSpritemaps_FlareSlowSparks_FacingRight_3           ;93A1E3;
    dw ProjectileFlareSpritemaps_FlareSlowSparks_FacingRight_4           ;93A1E5;
    dw ProjectileFlareSpritemaps_FlareSlowSparks_FacingRight_5           ;93A1E7;
    dw ProjectileFlareSpritemaps_FlareFastSparks_FacingRight_0           ;93A1E9;
    dw ProjectileFlareSpritemaps_FlareFastSparks_FacingRight_1           ;93A1EB;
    dw ProjectileFlareSpritemaps_FlareFastSparks_FacingRight_2           ;93A1ED;
    dw ProjectileFlareSpritemaps_FlareFastSparks_FacingRight_3           ;93A1EF;
    dw ProjectileFlareSpritemaps_FlareFastSparks_FacingRight_4           ;93A1F1;
    dw ProjectileFlareSpritemaps_FlareFastSparks_FacingRight_5           ;93A1F3;
    dw ProjectileFlareSpritemaps_FlareSlowSparks_FacingLeft_0            ;93A1F5;
    dw ProjectileFlareSpritemaps_FlareSlowSparks_FacingLeft_1            ;93A1F7;
    dw ProjectileFlareSpritemaps_FlareSlowSparks_FacingLeft_2            ;93A1F9;
    dw ProjectileFlareSpritemaps_FlareSlowSparks_FacingLeft_3            ;93A1FB;
    dw ProjectileFlareSpritemaps_FlareSlowSparks_FacingLeft_4            ;93A1FD;
    dw ProjectileFlareSpritemaps_FlareSlowSparks_FacingLeft_5            ;93A1FF;
    dw ProjectileFlareSpritemaps_FlareFastSparks_FacingLeft_0            ;93A201;
    dw ProjectileFlareSpritemaps_FlareFastSparks_FacingLeft_1            ;93A203;
    dw ProjectileFlareSpritemaps_FlareFastSparks_FacingLeft_2            ;93A205;
    dw ProjectileFlareSpritemaps_FlareFastSparks_FacingLeft_3            ;93A207;
    dw ProjectileFlareSpritemaps_FlareFastSparks_FacingLeft_4            ;93A209;
    dw ProjectileFlareSpritemaps_FlareFastSparks_FacingLeft_5            ;93A20B;
    dw ProjectileFlareSpritemaps_BeamExplosion_0                         ;93A20D;
    dw ProjectileFlareSpritemaps_BeamExplosion_1                         ;93A20F;
    dw ProjectileFlareSpritemaps_BeamExplosion_2                         ;93A211;
    dw ProjectileFlareSpritemaps_BeamExplosion_3                         ;93A213;
    dw ProjectileFlareSpritemaps_BeamExplosion_4                         ;93A215;
    dw ProjectileFlareSpritemaps_BeamExplosion_5                         ;93A217;
    dw ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_0               ;93A219;
    dw ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_1               ;93A21B;
    dw ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_2               ;93A21D;
    dw ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_3               ;93A21F;
    dw ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_4               ;93A221;
    dw ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_5               ;93A223;

FlareSpritemapTable_IndexOffsets_facingRight:
    dw $0000,$001E,$0024                                                 ;93A225;

FlareSpritemapTable_IndexOffsets_facingLeft:
    dw $0000,$002A,$0030                                                 ;93A22B;

UNUSED_ProjectileFlareSpritemaps_93A231:
    dw $0001                                                             ;93A231;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $2B)

UNUSED_ProjectileFlareSpritemaps_93A238:
    dw $0001                                                             ;93A238;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $2A)

UNUSED_ProjectileFlareSpritemaps_93A23F:
    dw $0001                                                             ;93A23F;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $29)

UNUSED_ProjectileFlareSpritemaps_93A246:
    dw $0001                                                             ;93A246;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $28)

ProjectileFlareSpritemaps_Power_0:
    dw $0001                                                             ;93A24D;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Power_1:
    dw $0001                                                             ;93A254;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Power_2:
    dw $0001                                                             ;93A25B;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $32)

ProjectileFlareSpritemaps_Power_3:
    dw $0001                                                             ;93A262;
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 6, $31)

ProjectileFlareSpritemaps_Power_4:
    dw $0001                                                             ;93A269;
    %spritemapEntry(0, $1FC, $FC, 1, 1, 2, 6, $30)

ProjectileFlareSpritemaps_Power_5:
    dw $0001                                                             ;93A270;
    %spritemapEntry(0, $1FC, $FC, 1, 1, 2, 6, $31)

ProjectileFlareSpritemaps_Power_6:
    dw $0001                                                             ;93A277;
    %spritemapEntry(0, $1FC, $FC, 1, 0, 2, 6, $32)

ProjectileFlareSpritemaps_Power_7:
    dw $0001                                                             ;93A27E;
    %spritemapEntry(0, $1FC, $FC, 1, 0, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_93A285:
    dw $0001                                                             ;93A285;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_93A28C:
    dw $0001                                                             ;93A28C;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_93A293:
    dw $0001                                                             ;93A293;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $32)

UNUSED_ProjectileFlareSpritemaps_93A29A:
    dw $0001                                                             ;93A29A;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $32)

UNUSED_ProjectileFlareSpritemaps_93A2A1:
    dw $0001                                                             ;93A2A1;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_93A2A8:
    dw $0001                                                             ;93A2A8;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_93A2AF:
    dw $0001                                                             ;93A2AF;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $32)

UNUSED_ProjectileFlareSpritemaps_93A2B6:
    dw $0001                                                             ;93A2B6;
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_93A2BD:
    dw $0001                                                             ;93A2BD;
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_93A2C4:
    dw $0001                                                             ;93A2C4;
    %spritemapEntry(0, $1FC, $FC, 1, 1, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_93A2CB:
    dw $0001                                                             ;93A2CB;
    %spritemapEntry(0, $1FC, $FC, 1, 0, 2, 6, $32)

UNUSED_ProjectileFlareSpritemaps_93A2D2:
    dw $0001                                                             ;93A2D2;
    %spritemapEntry(0, $1FC, $FC, 1, 0, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_93A2D9:
    dw $0002                                                             ;93A2D9;
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_93A2E5:
    dw $0004                                                             ;93A2E5;
    %spritemapEntry(0, $06, $00, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FE, $00, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1FE, $F8, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F6, $F8, 0, 0, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_93A2FB:
    dw $0002                                                             ;93A2FB;
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $33)

UNUSED_ProjectileFlareSpritemaps_93A307:
    dw $0004                                                             ;93A307;
    %spritemapEntry(0, $1F2, $00, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1FA, $00, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1FA, $F8, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $02, $F8, 0, 1, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_93A31D:
    dw $0002                                                             ;93A31D;
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_93A329:
    dw $0004                                                             ;93A329;
    %spritemapEntry(0, $1F2, $F8, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1FA, $F8, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1FA, $00, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $02, $00, 1, 1, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_93A33F:
    dw $0002                                                             ;93A33F;
    %spritemapEntry(0, $1FC, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 1, 0, 2, 6, $33)

UNUSED_ProjectileFlareSpritemaps_93A34B:
    dw $0004                                                             ;93A34B;
    %spritemapEntry(0, $1F2, $00, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1FA, $00, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1FA, $F8, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $02, $F8, 0, 1, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_93A361:
    dw $0001                                                             ;93A361;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $38)

UNUSED_ProjectileFlareSpritemaps_93A368:
    dw $0001                                                             ;93A368;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $39)

UNUSED_ProjectileFlareSpritemaps_93A36F:
    dw $0001                                                             ;93A36F;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $3A)

UNUSED_ProjectileFlareSpritemaps_93A376:
    dw $0001                                                             ;93A376;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $3B)

ProjectileFlareSpritemaps_Plasma_PlasmaIce_0:
    dw $0004                                                             ;93A37D;
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Plasma_PlasmaIce_1:
    dw $0006                                                             ;93A393;
    %spritemapEntry(0, $08, $04, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $00, $04, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F0, $F4, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Plasma_PlasmaIce_2:
    dw $0004                                                             ;93A3B3;
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Plasma_PlasmaIce_3:
    dw $0006                                                             ;93A3C9;
    %spritemapEntry(0, $1F0, $04, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F8, $04, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $00, $F4, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $08, $F4, 0, 1, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_93A3E9:
    dw $0004                                                             ;93A3E9;
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_93A3FF:
    dw $0006                                                             ;93A3FF;
    %spritemapEntry(0, $0A, $04, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $02, $04, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FA, $FC, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1FA, $F4, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F2, $F4, 0, 0, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_93A41F:
    dw $0004                                                             ;93A41F;
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $33)

UNUSED_ProjectileFlareSpritemaps_93A435:
    dw $0006                                                             ;93A435;
    %spritemapEntry(0, $1EE, $04, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F6, $04, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F6, $FC, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1FE, $FC, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1FE, $F4, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $06, $F4, 0, 1, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_93A455:
    dw $0004                                                             ;93A455;
    %spritemapEntry(0, $1F0, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $08, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_93A46B:
    dw $0006                                                             ;93A46B;
    %spritemapEntry(0, $1EE, $F4, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1F6, $F4, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1F6, $FC, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1FE, $FC, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1FE, $04, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $06, $04, 1, 1, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_93A48B:
    dw $0004                                                             ;93A48B;
    %spritemapEntry(0, $1FC, $F0, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $08, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 1, 0, 2, 6, $33)

UNUSED_ProjectileFlareSpritemaps_93A4A1:
    dw $0006                                                             ;93A4A1;
    %spritemapEntry(0, $0A, $F4, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $02, $F4, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $02, $FC, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1FA, $FC, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $1FA, $04, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1F2, $04, 1, 0, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_93A4C1:
    dw $0007                                                             ;93A4C1;
    %spritemapEntry(0, $14, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1E4, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1EC, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $0C, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_93A4E6:
    dw $000A                                                             ;93A4E6;
    %spritemapEntry(0, $10, $0C, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $08, $0C, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $08, $04, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $00, $04, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F0, $F4, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1F0, $EC, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1E8, $EC, 0, 0, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_93A51A:
    dw $0007                                                             ;93A51A;
    %spritemapEntry(0, $1FC, $14, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $0C, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $EC, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $E4, 0, 0, 2, 6, $33)

UNUSED_ProjectileFlareSpritemaps_93A53F:
    dw $000A                                                             ;93A53F;
    %spritemapEntry(0, $08, $EC, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $10, $EC, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1E8, $0C, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F0, $0C, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F0, $04, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F8, $04, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $00, $F4, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $08, $F4, 0, 1, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_93A573:
    dw $0007                                                             ;93A573;
    %spritemapEntry(0, $14, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1E4, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $0C, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1EC, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 6, $34)

UNUSED_ProjectileFlareSpritemaps_93A598:
    dw $000A                                                             ;93A598;
    %spritemapEntry(0, $10, $0C, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $08, $0C, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1F0, $EC, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $1E8, $EC, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $1F0, $F4, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $08, $04, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $00, $04, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $35)

UNUSED_ProjectileFlareSpritemaps_93A5CC:
    dw $0007                                                             ;93A5CC;
    %spritemapEntry(0, $1FC, $14, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $0C, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $E4, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $EC, 0, 0, 2, 6, $37)

UNUSED_ProjectileFlareSpritemaps_93A5F1:
    dw $000A                                                             ;93A5F1;
    %spritemapEntry(0, $1E8, $0C, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $1F0, $0C, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $1F0, $04, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $1F8, $04, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $08, $EC, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $10, $EC, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $00, $F4, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $08, $F4, 0, 1, 2, 6, $35)

UNUSED_ProjectileFlareSpritemaps_93A625:
    dw $0004                                                             ;93A625;
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 6, $34)

UNUSED_ProjectileFlareSpritemaps_93A63B:
    dw $0006                                                             ;93A63B;
    %spritemapEntry(0, $08, $04, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $00, $04, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $1F0, $F4, 0, 0, 2, 6, $35)

UNUSED_ProjectileFlareSpritemaps_93A65B:
    dw $0004                                                             ;93A65B;
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 2, 6, $37)

UNUSED_ProjectileFlareSpritemaps_93A671:
    dw $0006                                                             ;93A671;
    %spritemapEntry(0, $1F0, $04, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $1F8, $04, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $00, $F4, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $08, $F4, 0, 1, 2, 6, $35)

UNUSED_ProjectileFlareSpritemaps_93A691:
    dw $0004                                                             ;93A691;
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $34)

UNUSED_ProjectileFlareSpritemaps_93A6A7:
    dw $0004                                                             ;93A6A7;
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $33)

UNUSED_ProjectileFlareSpritemaps_93A6BD:
    dw $0001                                                             ;93A6BD;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $35)

UNUSED_ProjectileFlareSpritemaps_93A6C4:
    dw $0001                                                             ;93A6C4;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $36)

UNUSED_ProjectileFlareSpritemaps_93A6CB:
    dw $0001                                                             ;93A6CB;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $37)

UNUSED_ProjectileFlareSpritemaps_93A6D2:
    dw $0001                                                             ;93A6D2;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $53)

UNUSED_ProjectileFlareSpritemaps_93A6D9:
    dw $0001                                                             ;93A6D9;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $52)

UNUSED_ProjectileFlareSpritemaps_93A6E0:
    dw $0001                                                             ;93A6E0;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $51)

UNUSED_ProjectileFlareSpritemaps_93A6E7:
    dw $0004                                                             ;93A6E7;
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 6, $50)
    %spritemapEntry(0, $00, $00, 1, 1, 3, 6, $50)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 6, $50)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 6, $50)

ProjectileFlareSpritemaps_FlareSlowSparks_FacingRight_0:
    dw $0003                                                             ;93A6FD;
    %spritemapEntry(0, $00, $0C, 0, 0, 2, 5, $5B)
    %spritemapEntry(0, $08, $EC, 0, 0, 2, 5, $5B)
    %spritemapEntry(0, $1F0, $F4, 0, 0, 2, 5, $5B)

ProjectileFlareSpritemaps_FlareSlowSparks_FacingRight_1:
    dw $0003                                                             ;93A70E;
    %spritemapEntry(0, $1FD, $0A, 0, 0, 2, 5, $5C)
    %spritemapEntry(0, $06, $EE, 0, 0, 2, 5, $5C)
    %spritemapEntry(0, $1F2, $F6, 0, 0, 2, 5, $5C)

ProjectileFlareSpritemaps_FlareSlowSparks_FacingRight_2:
    dw $0003                                                             ;93A71F;
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 5, $5C)
    %spritemapEntry(0, $04, $F0, 0, 0, 2, 5, $5C)
    %spritemapEntry(0, $1F4, $F8, 0, 0, 2, 5, $5C)

ProjectileFlareSpritemaps_FlareSlowSparks_FacingRight_3:
    dw $0003                                                             ;93A730;
    %spritemapEntry(0, $02, $F2, 0, 0, 2, 5, $5D)
    %spritemapEntry(0, $1FB, $06, 0, 0, 2, 5, $5D)
    %spritemapEntry(0, $1F6, $FA, 0, 0, 2, 5, $5D)

ProjectileFlareSpritemaps_FlareSlowSparks_FacingRight_4:
    dw $0003                                                             ;93A741;
    %spritemapEntry(0, $1FB, $04, 0, 0, 2, 5, $5D)
    %spritemapEntry(0, $1F8, $FB, 0, 0, 2, 5, $5D)
    %spritemapEntry(0, $00, $F4, 0, 0, 2, 5, $5D)

ProjectileFlareSpritemaps_FlareSlowSparks_FacingRight_5:
    dw $0003                                                             ;93A752;
    %spritemapEntry(0, $1FB, $02, 0, 0, 2, 5, $5D)
    %spritemapEntry(0, $1FA, $FA, 0, 0, 2, 5, $5D)
    %spritemapEntry(0, $00, $F6, 0, 0, 2, 5, $5D)

ProjectileFlareSpritemaps_FlareFastSparks_FacingRight_0:
    dw $0003                                                             ;93A763;
    %spritemapEntry(0, $00, $EC, 1, 0, 2, 5, $5B)
    %spritemapEntry(0, $08, $0C, 1, 0, 2, 5, $5B)
    %spritemapEntry(0, $1F0, $04, 1, 0, 2, 5, $5B)

ProjectileFlareSpritemaps_FlareFastSparks_FacingRight_1:
    dw $0003                                                             ;93A774;
    %spritemapEntry(0, $1FE, $EE, 1, 0, 2, 5, $5C)
    %spritemapEntry(0, $06, $0A, 1, 0, 2, 5, $5C)
    %spritemapEntry(0, $1F2, $02, 1, 0, 2, 5, $5C)

ProjectileFlareSpritemaps_FlareFastSparks_FacingRight_2:
    dw $0003                                                             ;93A785;
    %spritemapEntry(0, $04, $08, 1, 0, 2, 5, $5C)
    %spritemapEntry(0, $1F4, $00, 1, 0, 2, 5, $5C)
    %spritemapEntry(0, $1FD, $F0, 1, 0, 2, 5, $5C)

ProjectileFlareSpritemaps_FlareFastSparks_FacingRight_3:
    dw $0003                                                             ;93A796;
    %spritemapEntry(0, $02, $06, 1, 0, 2, 5, $5D)
    %spritemapEntry(0, $1FC, $F2, 1, 0, 2, 5, $5D)
    %spritemapEntry(0, $1F6, $FE, 1, 0, 2, 5, $5D)

ProjectileFlareSpritemaps_FlareFastSparks_FacingRight_4:
    dw $0003                                                             ;93A7A7;
    %spritemapEntry(0, $1FC, $F4, 1, 0, 2, 5, $5D)
    %spritemapEntry(0, $1F8, $FC, 1, 0, 2, 5, $5D)
    %spritemapEntry(0, $00, $04, 1, 0, 2, 5, $5D)

ProjectileFlareSpritemaps_FlareFastSparks_FacingRight_5:
    dw $0003                                                             ;93A7B8;
    %spritemapEntry(0, $1FC, $F6, 1, 0, 2, 5, $5D)
    %spritemapEntry(0, $1FA, $FD, 1, 0, 2, 5, $5D)
    %spritemapEntry(0, $00, $02, 1, 0, 2, 5, $5D)

ProjectileFlareSpritemaps_MissileExplosion_0:
    dw $0001                                                             ;93A7C9;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $5F)

ProjectileFlareSpritemaps_MissileExplosion_1:
    dw $0004                                                             ;93A7D0;
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $8A)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $8A)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $8A)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $8A)

ProjectileFlareSpritemaps_MissileExplosion_2:
    dw $0004                                                             ;93A7E6;
    %spritemapEntry(1, $4200, $00, 1, 1, 3, 5, $90)
    %spritemapEntry(1, $43F0, $00, 1, 0, 3, 5, $90)
    %spritemapEntry(1, $4200, $F0, 0, 1, 3, 5, $90)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 5, $90)

ProjectileFlareSpritemaps_MissileExplosion_3:
    dw $0004                                                             ;93A7FC;
    %spritemapEntry(1, $4200, $00, 1, 1, 3, 5, $92)
    %spritemapEntry(1, $43F0, $00, 1, 0, 3, 5, $92)
    %spritemapEntry(1, $4200, $F0, 0, 1, 3, 5, $92)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 5, $92)

ProjectileFlareSpritemaps_MissileExplosion_4:
    dw $0004                                                             ;93A812;
    %spritemapEntry(1, $4200, $00, 1, 1, 3, 5, $94)
    %spritemapEntry(1, $43F0, $00, 1, 0, 3, 5, $94)
    %spritemapEntry(1, $4200, $F0, 0, 1, 3, 5, $94)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 5, $94)

ProjectileFlareSpritemaps_MissileExplosion_5:
    dw $0004                                                             ;93A828;
    %spritemapEntry(1, $4200, $00, 1, 1, 3, 5, $96)
    %spritemapEntry(1, $43F0, $00, 1, 0, 3, 5, $96)
    %spritemapEntry(1, $4200, $F0, 0, 1, 3, 5, $96)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 5, $96)

ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_0:
    dw $0004                                                             ;93A83E;
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $8B)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $8B)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $8B)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $8B)

ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_1:
    dw $0004                                                             ;93A854;
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $7A)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $7A)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $7A)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $7A)

ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_2:
    dw $0004                                                             ;93A86A;
    %spritemapEntry(1, $4200, $00, 1, 1, 3, 5, $70)
    %spritemapEntry(1, $43F0, $00, 1, 0, 3, 5, $70)
    %spritemapEntry(1, $4200, $F0, 0, 1, 3, 5, $70)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 5, $70)

ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_3:
    dw $0004                                                             ;93A880;
    %spritemapEntry(1, $4200, $00, 1, 1, 3, 5, $72)
    %spritemapEntry(1, $43F0, $00, 1, 0, 3, 5, $72)
    %spritemapEntry(1, $4200, $F0, 0, 1, 3, 5, $72)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 5, $72)

ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_4:
    dw $0004                                                             ;93A896;
    %spritemapEntry(1, $4200, $00, 1, 1, 3, 5, $74)
    %spritemapEntry(1, $43F0, $00, 1, 0, 3, 5, $74)
    %spritemapEntry(1, $4200, $F0, 0, 1, 3, 5, $74)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 5, $74)

ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_5:
    dw $0004                                                             ;93A8AC;
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 5, $5E)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 5, $5E)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 5, $5E)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $5E)

UNUSED_ProjectileFlareSpritemaps_93A8C2:
    dw $0001                                                             ;93A8C2;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $38)

UNUSED_ProjectileFlareSpritemaps_93A8C9:
    dw $0001                                                             ;93A8C9;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $39)

UNUSED_ProjectileFlareSpritemaps_93A8D0:
    dw $0001                                                             ;93A8D0;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $3A)

UNUSED_ProjectileFlareSpritemaps_93A8D7:
    dw $0001                                                             ;93A8D7;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $3B)

ProjectileFlareSpritemaps_FlareSlowSparks_FacingLeft_0:
    dw $0003                                                             ;93A8DE;
    %spritemapEntry(0, $1F8, $0C, 0, 1, 2, 6, $5B)
    %spritemapEntry(0, $1F0, $EC, 0, 1, 2, 6, $5B)
    %spritemapEntry(0, $08, $F4, 0, 1, 2, 6, $5B)

ProjectileFlareSpritemaps_FlareSlowSparks_FacingLeft_1:
    dw $0003                                                             ;93A8EF;
    %spritemapEntry(0, $1FB, $0A, 0, 1, 2, 6, $5C)
    %spritemapEntry(0, $1F2, $EE, 0, 1, 2, 6, $5C)
    %spritemapEntry(0, $06, $F6, 0, 1, 2, 6, $5C)

ProjectileFlareSpritemaps_FlareSlowSparks_FacingLeft_2:
    dw $0003                                                             ;93A900;
    %spritemapEntry(0, $1FC, $08, 0, 1, 2, 6, $5C)
    %spritemapEntry(0, $1F4, $F0, 0, 1, 2, 6, $5C)
    %spritemapEntry(0, $04, $F8, 0, 1, 2, 6, $5C)

ProjectileFlareSpritemaps_FlareSlowSparks_FacingLeft_3:
    dw $0003                                                             ;93A911;
    %spritemapEntry(0, $1F6, $F2, 0, 1, 2, 6, $5D)
    %spritemapEntry(0, $1FD, $06, 0, 1, 2, 6, $5D)
    %spritemapEntry(0, $02, $FA, 0, 1, 2, 6, $5D)

ProjectileFlareSpritemaps_FlareSlowSparks_FacingLeft_4:
    dw $0003                                                             ;93A922;
    %spritemapEntry(0, $1FD, $04, 0, 1, 2, 6, $5D)
    %spritemapEntry(0, $00, $FB, 0, 1, 2, 6, $5D)
    %spritemapEntry(0, $1F8, $F4, 0, 1, 2, 6, $5D)

ProjectileFlareSpritemaps_FlareSlowSparks_FacingLeft_5:
    dw $0003                                                             ;93A933;
    %spritemapEntry(0, $1FD, $02, 0, 1, 2, 6, $5D)
    %spritemapEntry(0, $1FE, $FA, 0, 1, 2, 6, $5D)
    %spritemapEntry(0, $1F8, $F6, 0, 1, 2, 6, $5D)

ProjectileFlareSpritemaps_FlareFastSparks_FacingLeft_0:
    dw $0003                                                             ;93A944;
    %spritemapEntry(0, $1F8, $EC, 1, 1, 2, 6, $5B)
    %spritemapEntry(0, $1F0, $0C, 1, 1, 2, 6, $5B)
    %spritemapEntry(0, $08, $04, 1, 1, 2, 6, $5B)

ProjectileFlareSpritemaps_FlareFastSparks_FacingLeft_1:
    dw $0003                                                             ;93A955;
    %spritemapEntry(0, $1FA, $EE, 1, 1, 2, 6, $5C)
    %spritemapEntry(0, $1F2, $0A, 1, 1, 2, 6, $5C)
    %spritemapEntry(0, $06, $02, 1, 1, 2, 6, $5C)

ProjectileFlareSpritemaps_FlareFastSparks_FacingLeft_2:
    dw $0003                                                             ;93A966;
    %spritemapEntry(0, $1F4, $08, 1, 1, 2, 6, $5C)
    %spritemapEntry(0, $04, $00, 1, 1, 2, 6, $5C)
    %spritemapEntry(0, $1FB, $F0, 1, 1, 2, 6, $5C)

ProjectileFlareSpritemaps_FlareFastSparks_FacingLeft_3:
    dw $0003                                                             ;93A977;
    %spritemapEntry(0, $1F6, $06, 1, 1, 2, 6, $5D)
    %spritemapEntry(0, $1FC, $F2, 1, 1, 2, 6, $5D)
    %spritemapEntry(0, $02, $FE, 1, 1, 2, 6, $5D)

ProjectileFlareSpritemaps_FlareFastSparks_FacingLeft_4:
    dw $0003                                                             ;93A988;
    %spritemapEntry(0, $1FC, $F4, 1, 1, 2, 6, $5D)
    %spritemapEntry(0, $00, $FC, 1, 1, 2, 6, $5D)
    %spritemapEntry(0, $1F8, $04, 1, 1, 2, 6, $5D)

ProjectileFlareSpritemaps_FlareFastSparks_FacingLeft_5:
    dw $0003                                                             ;93A999;
    %spritemapEntry(0, $1FC, $F6, 1, 1, 2, 6, $5D)
    %spritemapEntry(0, $1FE, $FD, 1, 1, 2, 6, $5D)
    %spritemapEntry(0, $1F8, $02, 1, 1, 2, 6, $5D)

UNUSED_ProjectileFlareSpritemaps_93A9AA:
    dw $0001                                                             ;93A9AA;
    %spritemapEntry(0, $1F7, $F7, 0, 0, 3, 5, $48)

UNUSED_ProjectileFlareSpritemaps_93A9B1:
    dw $0002                                                             ;93A9B1;
    %spritemapEntry(0, $01, $01, 0, 0, 3, 5, $48)
    %spritemapEntry(1, $43F3, $F3, 0, 0, 3, 5, $7C)

UNUSED_ProjectileFlareSpritemaps_93A9BD:
    dw $0003                                                             ;93A9BD;
    %spritemapEntry(1, $43FD, $FD, 0, 0, 3, 5, $7C)
    %spritemapEntry(0, $1F7, $01, 0, 0, 3, 5, $48)
    %spritemapEntry(1, $43F3, $F3, 0, 0, 3, 5, $7E)

UNUSED_ProjectileFlareSpritemaps_93A9CE:
    dw $0004                                                             ;93A9CE;
    %spritemapEntry(0, $01, $F7, 0, 0, 3, 5, $48)
    %spritemapEntry(1, $43FD, $FD, 0, 0, 3, 5, $7E)
    %spritemapEntry(1, $43F3, $FD, 0, 0, 3, 5, $7C)
    %spritemapEntry(1, $43F3, $F3, 0, 0, 3, 5, $9A)

UNUSED_ProjectileFlareSpritemaps_93A9E4:
    dw $0004                                                             ;93A9E4;
    %spritemapEntry(1, $43FD, $F3, 0, 0, 3, 5, $7C)
    %spritemapEntry(1, $43FD, $FD, 0, 0, 3, 5, $9A)
    %spritemapEntry(1, $43F3, $FD, 0, 0, 3, 5, $7E)
    %spritemapEntry(1, $43F3, $F3, 0, 0, 3, 5, $9C)

UNUSED_ProjectileFlareSpritemaps_93A9FA:
    dw $0003                                                             ;93A9FA;
    %spritemapEntry(1, $43FD, $F3, 0, 0, 3, 5, $7E)
    %spritemapEntry(1, $43FD, $FD, 0, 0, 3, 5, $9C)
    %spritemapEntry(1, $43F3, $FD, 0, 0, 3, 5, $9A)

UNUSED_ProjectileFlareSpritemaps_93AA0B:
    dw $0002                                                             ;93AA0B;
    %spritemapEntry(1, $43FD, $F3, 0, 0, 3, 5, $9A)
    %spritemapEntry(1, $43F3, $FD, 0, 0, 3, 5, $9C)

UNUSED_ProjectileFlareSpritemaps_93AA17:
    dw $0001                                                             ;93AA17;
    %spritemapEntry(1, $43FD, $F3, 0, 0, 3, 5, $9C)

UNUSED_ProjectileFlareSpritemaps_93AA1E:
    dw $0001                                                             ;93AA1E;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $5E)

UNUSED_ProjectileFlareSpritemaps_93AA25:
    dw $0001                                                             ;93AA25;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $5F)

UNUSED_ProjectileFlareSpritemaps_93AA2C:
    dw $0004                                                             ;93AA2C;
    %spritemapEntry(0, $00, $00, 1, 1, 3, 6, $60)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 6, $60)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 6, $60)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 6, $60)

UNUSED_ProjectileFlareSpritemaps_93AA42:
    dw $0004                                                             ;93AA42;
    %spritemapEntry(0, $00, $00, 1, 1, 3, 6, $61)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 6, $61)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 6, $61)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 6, $61)

UNUSED_ProjectileFlareSpritemaps_93AA58:
    dw $0004                                                             ;93AA58;
    %spritemapEntry(0, $00, $00, 1, 1, 3, 6, $62)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 6, $62)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 6, $62)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 6, $62)

UNUSED_ProjectileFlareSpritemaps_93AA6E:
    dw $0004                                                             ;93AA6E;
    %spritemapEntry(0, $00, $00, 1, 1, 3, 6, $63)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 6, $63)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 6, $63)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 6, $63)

ProjectileFlareSpritemaps_SuperMissileExplosion_0:
    dw $0004                                                             ;93AA84;
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $8A)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $8A)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $8A)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $8A)

ProjectileFlareSpritemaps_SuperMissileExplosion_1:
    dw $0004                                                             ;93AA9A;
    %spritemapEntry(1, $4200, $00, 1, 1, 3, 5, $90)
    %spritemapEntry(1, $4200, $F0, 0, 1, 3, 5, $90)
    %spritemapEntry(1, $43F0, $00, 1, 0, 3, 5, $90)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 5, $90)

ProjectileFlareSpritemaps_SuperMissileExplosion_2:
    dw $0004                                                             ;93AAB0;
    %spritemapEntry(1, $4200, $00, 1, 1, 3, 5, $92)
    %spritemapEntry(1, $43F0, $00, 1, 0, 3, 5, $92)
    %spritemapEntry(1, $4200, $F0, 0, 1, 3, 5, $92)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 5, $92)

ProjectileFlareSpritemaps_SuperMissileExplosion_3:
    dw $000C                                                             ;93AAC6;
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

ProjectileFlareSpritemaps_SuperMissileExplosion_4:
    dw $0008                                                             ;93AB04;
    %spritemapEntry(1, $4208, $00, 1, 1, 3, 5, $B5)
    %spritemapEntry(1, $4200, $08, 1, 1, 3, 5, $B3)
    %spritemapEntry(1, $43E8, $00, 1, 0, 3, 5, $B5)
    %spritemapEntry(1, $43F0, $08, 1, 0, 3, 5, $B3)
    %spritemapEntry(1, $4208, $F0, 0, 1, 3, 5, $B5)
    %spritemapEntry(1, $4200, $E8, 0, 1, 3, 5, $B3)
    %spritemapEntry(1, $43E8, $F0, 0, 0, 3, 5, $B5)
    %spritemapEntry(1, $43F0, $E8, 0, 0, 3, 5, $B3)

ProjectileFlareSpritemaps_SuperMissileExplosion_5:
    dw $000C                                                             ;93AB2E;
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

ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_0:
    dw $0001                                                             ;93AB6C;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $53)

ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_1:
    dw $0001                                                             ;93AB73;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $52)

ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_2:
    dw $0001                                                             ;93AB7A;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $51)

ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_3:
    dw $0004                                                             ;93AB81;
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $50)
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $50)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $50)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $50)

ProjectileFlareSpritemaps_PowerBomb_0:
    dw $0001                                                             ;93AB97;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $26)

ProjectileFlareSpritemaps_PowerBomb_1:
    dw $0001                                                             ;93AB9E;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $27)

ProjectileFlareSpritemaps_PowerBomb_2:
    dw $0001                                                             ;93ABA5;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $7B)

UNUSED_ProjectileFlareSpritemaps_93ABAC:
    dw $0001                                                             ;93ABAC;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $5F)

ProjectileFlareSpritemaps_BeamExplosion_0:
    dw $0001                                                             ;93ABB3;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $53)

ProjectileFlareSpritemaps_BeamExplosion_1:
    dw $0001                                                             ;93ABBA;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $51)

ProjectileFlareSpritemaps_BeamExplosion_2:
    dw $0004                                                             ;93ABC1;
    %spritemapEntry(0, $00, $00, 1, 1, 3, 6, $60)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 6, $60)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 6, $60)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 6, $60)

ProjectileFlareSpritemaps_BeamExplosion_3:
    dw $0004                                                             ;93ABD7;
    %spritemapEntry(0, $00, $00, 1, 1, 3, 6, $61)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 6, $61)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 6, $61)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 6, $61)

ProjectileFlareSpritemaps_BeamExplosion_4:
    dw $0004                                                             ;93ABED;
    %spritemapEntry(0, $00, $00, 1, 1, 3, 6, $62)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 6, $62)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 6, $62)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 6, $62)

ProjectileFlareSpritemaps_BeamExplosion_5:
    dw $0004                                                             ;93AC03;
    %spritemapEntry(0, $00, $00, 1, 1, 3, 6, $63)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 6, $63)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 6, $63)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 6, $63)

UNUSED_ProjectileFlareSpritemaps_93AC19:
    dw $0004                                                             ;93AC19;
    %spritemapEntry(0, $1F2, $FC, 0, 1, 3, 5, $6C)
    %spritemapEntry(0, $06, $FC, 0, 1, 3, 5, $6C)
    %spritemapEntry(0, $00, $FC, 0, 1, 3, 5, $6C)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 5, $6C)

UNUSED_ProjectileFlareSpritemaps_93AC2F:
    dw $0004                                                             ;93AC2F;
    %spritemapEntry(0, $00, $FC, 0, 1, 3, 5, $6E)
    %spritemapEntry(0, $08, $FC, 0, 1, 3, 5, $6D)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 5, $6E)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 3, 5, $6D)

UNUSED_ProjectileFlareSpritemaps_93AC45:
    dw $0004                                                             ;93AC45;
    %spritemapEntry(0, $1F0, $FE, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $08, $FE, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $00, $FE, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F8, $FE, 0, 0, 3, 5, $6F)

UNUSED_ProjectileFlareSpritemaps_93AC5B:
    dw $0001                                                             ;93AC5B;
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 5, $7C)

UNUSED_ProjectileFlareSpritemaps_93AC62:
    dw $0001                                                             ;93AC62;
    %spritemapEntry(1, $43F8, $F6, 0, 0, 3, 5, $7E)

UNUSED_ProjectileFlareSpritemaps_93AC69:
    dw $0001                                                             ;93AC69;
    %spritemapEntry(1, $43F8, $F4, 0, 0, 3, 5, $9A)

UNUSED_ProjectileFlareSpritemaps_93AC70:
    dw $0001                                                             ;93AC70;
    %spritemapEntry(1, $43F8, $F2, 0, 0, 3, 5, $9C)

UNUSED_ProjectileFlareSpritemaps_93AC77:
    dw $0001                                                             ;93AC77;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 5, $48)

UNUSED_ProjectileFlareSpritemaps_93AC7E:
    dw $0001                                                             ;93AC7E;
    %spritemapEntry(0, $1FC, $FA, 0, 0, 2, 5, $49)

UNUSED_ProjectileFlareSpritemaps_93AC85:
    dw $0001                                                             ;93AC85;
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 5, $4A)

UNUSED_ProjectileFlareSpritemaps_93AC8C:
    dw $0001                                                             ;93AC8C;
    %spritemapEntry(0, $1FC, $F6, 0, 0, 2, 5, $4B)

UNUSED_ProjectileFlareSpritemaps_93AC93:
    dw $0001                                                             ;93AC93;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $2C)

UNUSED_ProjectileFlareSpritemaps_93AC9A:
    dw $0001                                                             ;93AC9A;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $2D)

UNUSED_ProjectileFlareSpritemaps_93ACA1:
    dw $0001                                                             ;93ACA1;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $2E)

UNUSED_ProjectileFlareSpritemaps_93ACA8:
    dw $0001                                                             ;93ACA8;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $2F)

UNUSED_ProjectileFlareSpritemaps_93ACAF:
    dw $0001                                                             ;93ACAF;
    %spritemapEntry(1, $43F8, $F6, 0, 0, 3, 5, $76)

UNUSED_ProjectileFlareSpritemaps_93ACB6:
    dw $0001                                                             ;93ACB6;
    %spritemapEntry(1, $43F8, $F4, 0, 0, 3, 5, $78)

UNUSED_ProjectileFlareSpritemaps_93ACBD:
    dw $0001                                                             ;93ACBD;
    %spritemapEntry(1, $43F8, $F2, 0, 0, 3, 5, $98)

UNUSED_ProjectileFlareSpritemaps_93ACC4:
    dw $0001                                                             ;93ACC4;
    %spritemapEntry(1, $43F8, $F0, 0, 0, 3, 5, $9E)

UNUSED_ProjectileFlareSpritemaps_93ACCB:
    dw $0001                                                             ;93ACCB;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $25)

UNUSED_ProjectileFlareSpritemaps_93ACD2:
    dw $0001                                                             ;93ACD2;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $43)

UNUSED_ProjectileFlareSpritemaps_93ACD9:
    dw $0001                                                             ;93ACD9;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $40)

UNUSED_ProjectileFlareSpritemaps_93ACE0:
    dw $0001                                                             ;93ACE0;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $3E)

UNUSED_ProjectileFlareSpritemaps_93ACE7:
    dw $0001                                                             ;93ACE7;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $3D)

UNUSED_ProjectileFlareSpritemaps_93ACEE:
    dw $0001                                                             ;93ACEE;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $41)

UNUSED_ProjectileFlareSpritemaps_93ACF5:
    dw $0001                                                             ;93ACF5;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $42)

UNUSED_ProjectileFlareSpritemaps_93ACFC:
    dw $0004                                                             ;93ACFC;
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $44)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $44)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $44)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $44)

UNUSED_ProjectileFlareSpritemaps_93AC12:
    dw $0004                                                             ;93AD12;
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $45)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $45)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $45)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $45)

UNUSED_ProjectileFlareSpritemaps_93AC28:
    dw $0004                                                             ;93AD28;
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $46)
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $46)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $46)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $46)

UNUSED_ProjectileFlareSpritemaps_93AC3E:
    dw $0001                                                             ;93AD3E;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $42)

ProjectileFlareSpritemaps_Bomb_0:
    dw $0001                                                             ;93AD45;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $4C)

ProjectileFlareSpritemaps_Bomb_1:
    dw $0001                                                             ;93AD4C;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $4D)

ProjectileFlareSpritemaps_Bomb_2:
    dw $0001                                                             ;93AD53;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $4E)

ProjectileFlareSpritemaps_Bomb_3:
    dw $0001                                                             ;93AD5A;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $4F)

ProjectileFlareSpritemaps_Missile_0:
    dw $0002                                                             ;93AD61;
    %spritemapEntry(0, $1FF, $FC, 0, 0, 2, 5, $55)
    %spritemapEntry(0, $1F7, $FC, 0, 0, 2, 5, $54)

ProjectileFlareSpritemaps_Missile_1:
    dw $0003                                                             ;93AD6D;
    %spritemapEntry(0, $1F8, $F5, 0, 0, 2, 5, $56)
    %spritemapEntry(0, $00, $FD, 0, 0, 2, 5, $58)
    %spritemapEntry(0, $1F8, $FD, 0, 0, 2, 5, $57)

ProjectileFlareSpritemaps_Missile_2:
    dw $0002                                                             ;93AD7E;
    %spritemapEntry(0, $1FC, $F7, 0, 0, 2, 5, $59)
    %spritemapEntry(0, $1FC, $FF, 0, 0, 2, 5, $5A)

ProjectileFlareSpritemaps_Missile_3:
    dw $0003                                                             ;93AD8A;
    %spritemapEntry(0, $00, $F5, 0, 1, 2, 5, $56)
    %spritemapEntry(0, $1F8, $FD, 0, 1, 2, 5, $58)
    %spritemapEntry(0, $00, $FD, 0, 1, 2, 5, $57)

ProjectileFlareSpritemaps_Missile_4:
    dw $0002                                                             ;93AD9B;
    %spritemapEntry(0, $1F9, $FC, 0, 1, 2, 5, $55)
    %spritemapEntry(0, $01, $FC, 0, 1, 2, 5, $54)

ProjectileFlareSpritemaps_Missile_5:
    dw $0003                                                             ;93ADA7;
    %spritemapEntry(0, $00, $03, 1, 1, 2, 5, $56)
    %spritemapEntry(0, $1F8, $FB, 1, 1, 2, 5, $58)
    %spritemapEntry(0, $00, $FB, 1, 1, 2, 5, $57)

ProjectileFlareSpritemaps_Missile_6:
    dw $0002                                                             ;93ADB8;
    %spritemapEntry(0, $1FD, $01, 1, 0, 2, 5, $59)
    %spritemapEntry(0, $1FD, $F9, 1, 0, 2, 5, $5A)

ProjectileFlareSpritemaps_Missile_7:
    dw $0003                                                             ;93ADC4;
    %spritemapEntry(0, $1F8, $03, 1, 0, 2, 5, $56)
    %spritemapEntry(0, $00, $FB, 1, 0, 2, 5, $58)
    %spritemapEntry(0, $1F8, $FB, 1, 0, 2, 5, $57)

ProjectileFlareSpritemaps_SuperMissile_0:
    dw $0002                                                             ;93ADD5;
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 5, $65)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 5, $64)

ProjectileFlareSpritemaps_SuperMissile_1:
    dw $0003                                                             ;93ADE1;
    %spritemapEntry(0, $02, $FE, 0, 0, 2, 5, $68)
    %spritemapEntry(0, $1FA, $FE, 0, 0, 2, 5, $67)
    %spritemapEntry(0, $1FA, $F6, 0, 0, 2, 5, $66)

ProjectileFlareSpritemaps_SuperMissile_2:
    dw $0002                                                             ;93ADF2;
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 5, $69)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 5, $6A)

ProjectileFlareSpritemaps_SuperMissile_3:
    dw $0003                                                             ;93ADFE;
    %spritemapEntry(0, $1F6, $FE, 0, 1, 2, 5, $68)
    %spritemapEntry(0, $1FE, $FE, 0, 1, 2, 5, $67)
    %spritemapEntry(0, $1FE, $F6, 0, 1, 2, 5, $66)

ProjectileFlareSpritemaps_SuperMissile_4:
    dw $0002                                                             ;93AE0F;
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 5, $65)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 5, $64)

ProjectileFlareSpritemaps_SuperMissile_5:
    dw $0003                                                             ;93AE1B;
    %spritemapEntry(0, $1F6, $FA, 1, 1, 2, 5, $68)
    %spritemapEntry(0, $1FE, $FA, 1, 1, 2, 5, $67)
    %spritemapEntry(0, $1FE, $02, 1, 1, 2, 5, $66)

ProjectileFlareSpritemaps_SuperMissile_6:
    dw $0002                                                             ;93AE2C;
    %spritemapEntry(0, $1FC, $00, 1, 0, 2, 5, $69)
    %spritemapEntry(0, $1FC, $F8, 1, 0, 2, 5, $6A)

ProjectileFlareSpritemaps_SuperMissile_7:
    dw $0003                                                             ;93AE38;
    %spritemapEntry(0, $02, $FA, 1, 0, 2, 5, $68)
    %spritemapEntry(0, $1FA, $FA, 1, 0, 2, 5, $67)
    %spritemapEntry(0, $1FA, $02, 1, 0, 2, 5, $66)

UNUSED_ProjectileFlareSpritemaps_93AE49:
    dw $0001                                                             ;93AE49;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $3C)

UNUSED_ProjectileFlareSpritemaps_93AE50:
    dw $0001                                                             ;93AE50;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $3D)

UNUSED_ProjectileFlareSpritemaps_93AE57:
    dw $0001                                                             ;93AE57;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $3E)

UNUSED_ProjectileFlareSpritemaps_93AE5E:
    dw $0001                                                             ;93AE5E;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $3F)

ProjectileFlareSpritemaps_Wave_IceWave_0:
    dw $0001                                                             ;93AE65;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Wave_IceWave_1:
    dw $0001                                                             ;93AE6C;
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Wave_IceWave_2:
    dw $0001                                                             ;93AE73;
    %spritemapEntry(0, $1FC, $EF, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Wave_IceWave_3:
    dw $0001                                                             ;93AE7A;
    %spritemapEntry(0, $1FC, $ED, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Wave_IceWave_4:
    dw $0001                                                             ;93AE81;
    %spritemapEntry(0, $1FC, $EC, 0, 0, 2, 6, $32)

ProjectileFlareSpritemaps_Wave_IceWave_5:
    dw $0001                                                             ;93AE88;
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Wave_IceWave_6:
    dw $0001                                                             ;93AE8F;
    %spritemapEntry(0, $1FC, $09, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Wave_IceWave_7:
    dw $0001                                                             ;93AE96;
    %spritemapEntry(0, $1FC, $0B, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Wave_IceWave_8:
    dw $0001                                                             ;93AE9D;
    %spritemapEntry(0, $1FC, $0C, 0, 0, 2, 6, $32)

ProjectileFlareSpritemaps_Wave_IceWave_9:
    dw $0001                                                             ;93AEA4;
    %spritemapEntry(0, $02, $F6, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Wave_IceWave_A:
    dw $0001                                                             ;93AEAB;
    %spritemapEntry(0, $05, $F3, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Wave_IceWave_B:
    dw $0001                                                             ;93AEB2;
    %spritemapEntry(0, $07, $F1, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Wave_IceWave_C:
    dw $0001                                                             ;93AEB9;
    %spritemapEntry(0, $08, $F0, 0, 0, 2, 6, $32)

ProjectileFlareSpritemaps_Wave_IceWave_D:
    dw $0001                                                             ;93AEC0;
    %spritemapEntry(0, $1F6, $02, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Wave_IceWave_E:
    dw $0001                                                             ;93AEC7;
    %spritemapEntry(0, $1F3, $05, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Wave_IceWave_F:
    dw $0001                                                             ;93AECE;
    %spritemapEntry(0, $1F1, $07, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Wave_IceWave_10:
    dw $0001                                                             ;93AED5;
    %spritemapEntry(0, $1F0, $08, 0, 0, 2, 6, $32)

ProjectileFlareSpritemaps_Wave_IceWave_11:
    dw $0001                                                             ;93AEDC;
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Wave_IceWave_12:
    dw $0001                                                             ;93AEE3;
    %spritemapEntry(0, $09, $FC, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Wave_IceWave_13:
    dw $0001                                                             ;93AEEA;
    %spritemapEntry(0, $0B, $FC, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Wave_IceWave_14:
    dw $0001                                                             ;93AEF1;
    %spritemapEntry(0, $0C, $FC, 0, 0, 2, 6, $32)

ProjectileFlareSpritemaps_Wave_IceWave_15:
    dw $0001                                                             ;93AEF8;
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Wave_IceWave_16:
    dw $0001                                                             ;93AEFF;
    %spritemapEntry(0, $1EF, $FC, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Wave_IceWave_17:
    dw $0001                                                             ;93AF06;
    %spritemapEntry(0, $1ED, $FC, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Wave_IceWave_18:
    dw $0001                                                             ;93AF0D;
    %spritemapEntry(0, $1EC, $FC, 0, 0, 2, 6, $32)

ProjectileFlareSpritemaps_Wave_IceWave_19:
    dw $0001                                                             ;93AF14;
    %spritemapEntry(0, $1F6, $F6, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Wave_IceWave_1A:
    dw $0001                                                             ;93AF1B;
    %spritemapEntry(0, $1F3, $F3, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Wave_IceWave_1B:
    dw $0001                                                             ;93AF22;
    %spritemapEntry(0, $1F1, $F1, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Wave_IceWave_1C:
    dw $0001                                                             ;93AF29;
    %spritemapEntry(0, $1F0, $F0, 0, 0, 2, 6, $32)

ProjectileFlareSpritemaps_Wave_IceWave_1D:
    dw $0001                                                             ;93AF30;
    %spritemapEntry(0, $02, $02, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Wave_IceWave_1E:
    dw $0001                                                             ;93AF37;
    %spritemapEntry(0, $05, $05, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Wave_IceWave_1F:
    dw $0001                                                             ;93AF3E;
    %spritemapEntry(0, $07, $07, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Wave_IceWave_20:
    dw $0001                                                             ;93AF45;
    %spritemapEntry(0, $08, $08, 0, 0, 2, 6, $32)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_0:
    dw $0004                                                             ;93AF4C;
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1:
    dw $0004                                                             ;93AF62;
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_2:
    dw $0008                                                             ;93AF78;
    %spritemapEntry(0, $00, $08, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $08, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $00, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $F8, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F8, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $F0, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_3:
    dw $0008                                                             ;93AFA2;
    %spritemapEntry(0, $00, $08, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $08, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $00, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $F8, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $F0, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_4:
    dw $0008                                                             ;93AFCC;
    %spritemapEntry(0, $00, $0D, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $0D, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $05, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $05, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $F3, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F3, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $EB, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $EB, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_5:
    dw $0008                                                             ;93AFF6;
    %spritemapEntry(0, $00, $0D, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $0D, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $05, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $05, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $F3, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F3, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $EB, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $EB, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_6:
    dw $0008                                                             ;93B020;
    %spritemapEntry(0, $00, $0F, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $0F, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $07, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $07, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $F1, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F1, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $E9, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $E9, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_7:
    dw $0008                                                             ;93B04A;
    %spritemapEntry(0, $00, $0F, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $0F, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $07, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $07, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $F1, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F1, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $E9, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $E9, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_8:
    dw $0008                                                             ;93B074;
    %spritemapEntry(0, $00, $10, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $10, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $08, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $08, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $F0, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F0, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $E8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $E8, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_9:
    dw $0008                                                             ;93B09E;
    %spritemapEntry(0, $00, $10, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $10, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $08, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $08, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $F0, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F0, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $E8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $E8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_A:
    dw $0008                                                             ;93B0C8;
    %spritemapEntry(0, $05, $FB, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1FD, $FB, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $05, $F3, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1FD, $F3, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1FB, $05, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F3, $05, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FB, $FD, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F3, $FD, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_B:
    dw $0008                                                             ;93B0F2;
    %spritemapEntry(0, $04, $FC, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1FC, $FC, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $04, $F4, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $04, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F4, $04, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_C:
    dw $0008                                                             ;93B11C;
    %spritemapEntry(0, $1F9, $07, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F1, $07, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F9, $FF, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F1, $FF, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $07, $F9, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1FF, $F9, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $07, $F1, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1FF, $F1, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_D:
    dw $0008                                                             ;93B146;
    %spritemapEntry(0, $1F9, $07, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F1, $07, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1F9, $FF, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F1, $FF, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $07, $F9, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1FF, $F9, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $07, $F1, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1FF, $F1, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_E:
    dw $0008                                                             ;93B170;
    %spritemapEntry(0, $1F7, $09, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1EF, $09, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F7, $01, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1EF, $01, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $09, $F7, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $01, $F7, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $09, $EF, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $01, $EF, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_F:
    dw $0008                                                             ;93B19A;
    %spritemapEntry(0, $1F7, $09, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1EF, $09, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1F7, $01, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1EF, $01, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $09, $F7, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $01, $F7, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $09, $EF, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $01, $EF, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_10:
    dw $0008                                                             ;93B1C4;
    %spritemapEntry(0, $1F6, $0A, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1EE, $0A, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F6, $02, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1EE, $02, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0A, $F6, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $02, $F6, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $0A, $EE, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $02, $EE, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_11:
    dw $0008                                                             ;93B1EE;
    %spritemapEntry(0, $1F6, $0A, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1EE, $0A, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1F6, $02, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1EE, $02, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $0A, $F6, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $02, $F6, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $0A, $EE, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $02, $EE, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_12:
    dw $0008                                                             ;93B218;
    %spritemapEntry(0, $1F3, $FB, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1FB, $FB, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F3, $F3, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1FB, $F3, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1FD, $05, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $05, $05, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1FD, $FD, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $05, $FD, 0, 1, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_13:
    dw $0008                                                             ;93B242;
    %spritemapEntry(0, $1F4, $FC, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $FC, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F4, $F4, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F4, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1FC, $04, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $04, $04, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $04, $FC, 0, 1, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_14:
    dw $0008                                                             ;93B26C;
    %spritemapEntry(0, $1FF, $07, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $07, $07, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1FF, $FF, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $07, $FF, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F1, $F9, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1F9, $F9, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F1, $F1, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F9, $F1, 0, 1, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_15:
    dw $0008                                                             ;93B296;
    %spritemapEntry(0, $1FF, $07, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $07, $07, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1FF, $FF, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $07, $FF, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F1, $F9, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F9, $F9, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F1, $F1, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1F9, $F1, 0, 1, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_16:
    dw $0008                                                             ;93B2C0;
    %spritemapEntry(0, $01, $09, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $09, $09, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $01, $01, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $09, $01, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1EF, $F7, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1F7, $F7, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1EF, $EF, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F7, $EF, 0, 1, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_17:
    dw $0008                                                             ;93B2EA;
    %spritemapEntry(0, $01, $09, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $09, $09, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $01, $01, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $09, $01, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1EF, $F7, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F7, $F7, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1EF, $EF, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1F7, $EF, 0, 1, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_18:
    dw $0008                                                             ;93B314;
    %spritemapEntry(0, $02, $0A, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $0A, $0A, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $02, $02, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0A, $02, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1EE, $F6, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1F6, $F6, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1EE, $EE, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F6, $EE, 0, 1, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_19:
    dw $0008                                                             ;93B33E;
    %spritemapEntry(0, $02, $0A, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $0A, $0A, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $02, $02, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $0A, $02, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1EE, $F6, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F6, $F6, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1EE, $EE, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1F6, $EE, 0, 1, 2, 6, $33)

UNUSED_ProjectileFlareSpritemaps_ChargedWave_WaveSBA_93B368:
    dw $0004                                                             ;93B368;
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $34)

UNUSED_ProjectileFlareSpritemaps_ChargedWave_WaveSBA_93B37E:
    dw $0004                                                             ;93B37E;
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1A:
    dw $0008                                                             ;93B394;
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F0, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $08, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $00, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $08, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1B:
    dw $0008                                                             ;93B3BE;
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F0, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $08, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $00, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $08, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1C:
    dw $0008                                                             ;93B3E8;
    %spritemapEntry(0, $1F3, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F3, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1EB, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1EB, $F8, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $0D, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $05, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $0D, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $05, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1D:
    dw $0008                                                             ;93B412;
    %spritemapEntry(0, $1F3, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F3, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1EB, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1EB, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0D, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $05, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $0D, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $05, $F8, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1E:
    dw $0008                                                             ;93B43C;
    %spritemapEntry(0, $1F1, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F1, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1E9, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1E9, $F8, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $0F, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $07, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $0F, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $07, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1F:
    dw $0008                                                             ;93B466;
    %spritemapEntry(0, $1F1, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F1, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1E9, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1E9, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0F, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $07, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $0F, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $07, $F8, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_20:
    dw $0008                                                             ;93B490;
    %spritemapEntry(0, $1F0, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F0, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1E8, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $10, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $08, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $10, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $08, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_21:
    dw $0008                                                             ;93B4BA;
    %spritemapEntry(0, $1F0, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F0, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1E8, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $10, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $08, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $10, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $08, $F8, 0, 0, 2, 6, $34)

UNUSED_ProjectileFlareSpritemaps_93B4E4:
    dw $0001                                                             ;93B4E4;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_93B4EB:
    dw $0002                                                             ;93B4EB;
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_93B4F7:
    dw $0002                                                             ;93B4F7;
    %spritemapEntry(0, $1FC, $09, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $1FC, $EF, 0, 0, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_93B503:
    dw $0002                                                             ;93B503;
    %spritemapEntry(0, $1FC, $0B, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $ED, 0, 0, 2, 6, $32)

UNUSED_ProjectileFlareSpritemaps_93B50F:
    dw $0002                                                             ;93B50F;
    %spritemapEntry(0, $1FC, $0C, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1FC, $EC, 0, 0, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_93B51B:
    dw $0002                                                             ;93B51B;
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_93B527:
    dw $0002                                                             ;93B527;
    %spritemapEntry(0, $1FC, $EF, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1FC, $09, 0, 0, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_93B533:
    dw $0002                                                             ;93B533;
    %spritemapEntry(0, $1FC, $0B, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FC, $ED, 0, 0, 2, 6, $36)

UNUSED_ProjectileFlareSpritemaps_93B53F:
    dw $0002                                                             ;93B53F;
    %spritemapEntry(0, $1FC, $EC, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $0C, 0, 0, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_93B54B:
    dw $0002                                                             ;93B54B;
    %spritemapEntry(0, $1F6, $02, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $02, $F6, 0, 0, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_93B557:
    dw $0002                                                             ;93B557;
    %spritemapEntry(0, $1F3, $05, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $05, $F3, 0, 0, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_93B563:
    dw $0002                                                             ;93B563;
    %spritemapEntry(0, $1F1, $07, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $07, $F1, 0, 0, 2, 6, $32)

UNUSED_ProjectileFlareSpritemaps_93B56F:
    dw $0002                                                             ;93B56F;
    %spritemapEntry(0, $08, $F0, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F0, $08, 0, 0, 2, 6, $35)

UNUSED_ProjectileFlareSpritemaps_93B57B:
    dw $0002                                                             ;93B57B;
    %spritemapEntry(0, $02, $F6, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1F6, $02, 0, 0, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_93B587:
    dw $0002                                                             ;93B587;
    %spritemapEntry(0, $05, $F3, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $1F3, $05, 0, 0, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_93B593:
    dw $0002                                                             ;93B593;
    %spritemapEntry(0, $07, $F1, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1F1, $07, 0, 0, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_93B59F:
    dw $0002                                                             ;93B59F;
    %spritemapEntry(0, $1F0, $08, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $08, $F0, 0, 0, 2, 6, $35)

UNUSED_ProjectileFlareSpritemaps_93B5AB:
    dw $0002                                                             ;93B5AB;
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_93B5B7:
    dw $0002                                                             ;93B5B7;
    %spritemapEntry(0, $1F1, $FC, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $09, $FC, 0, 0, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_93B5C3:
    dw $0002                                                             ;93B5C3;
    %spritemapEntry(0, $1ED, $FC, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $0B, $FC, 0, 0, 2, 6, $32)

UNUSED_ProjectileFlareSpritemaps_93B5CF:
    dw $0002                                                             ;93B5CF;
    %spritemapEntry(0, $0C, $FC, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1EC, $FC, 0, 0, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_93B5DB:
    dw $0002                                                             ;93B5DB;
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 6, $37)

UNUSED_ProjectileFlareSpritemaps_93B5E7:
    dw $0002                                                             ;93B5E7;
    %spritemapEntry(0, $09, $FC, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $1EF, $FC, 0, 0, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_93B5F3:
    dw $0002                                                             ;93B5F3;
    %spritemapEntry(0, $0C, $FC, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1ED, $FC, 0, 0, 2, 6, $32)

UNUSED_ProjectileFlareSpritemaps_93B5FF:
    dw $0002                                                             ;93B5FF;
    %spritemapEntry(0, $1EC, $FC, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $0D, $FC, 0, 0, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_93B60B:
    dw $0002                                                             ;93B60B;
    %spritemapEntry(0, $02, $02, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1F6, $F6, 0, 0, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_93B617:
    dw $0002                                                             ;93B617;
    %spritemapEntry(0, $05, $05, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $1F3, $F3, 0, 0, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_93B623:
    dw $0002                                                             ;93B623;
    %spritemapEntry(0, $07, $07, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1F1, $F1, 0, 0, 2, 6, $32)

UNUSED_ProjectileFlareSpritemaps_93B62F:
    dw $0002                                                             ;93B62F;
    %spritemapEntry(0, $08, $08, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1F0, $F0, 0, 0, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_93B63B:
    dw $0002                                                             ;93B63B;
    %spritemapEntry(0, $1F6, $F6, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $02, $02, 0, 0, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_93B647:
    dw $0002                                                             ;93B647;
    %spritemapEntry(0, $1F3, $F3, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $05, $05, 0, 0, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_93B653:
    dw $0002                                                             ;93B653;
    %spritemapEntry(0, $1F1, $F1, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $07, $07, 0, 0, 2, 6, $32)

UNUSED_ProjectileFlareSpritemaps_93B65F:
    dw $0002                                                             ;93B65F;
    %spritemapEntry(0, $1F0, $F0, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $08, $08, 0, 0, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_93B66B:
    dw $0001                                                             ;93B66B;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_ChargedIceWave_0:
    dw $0004                                                             ;93B672;
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedIceWave_1:
    dw $0004                                                             ;93B688;
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedIceWave_2:
    dw $0008                                                             ;93B69E;
    %spritemapEntry(0, $00, $08, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $08, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $00, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $F8, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F8, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $F0, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedIceWave_3:
    dw $0008                                                             ;93B6C8;
    %spritemapEntry(0, $00, $08, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $08, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $00, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $F8, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $F0, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedIceWave_4:
    dw $0008                                                             ;93B6F2;
    %spritemapEntry(0, $00, $0D, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $0D, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $05, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $05, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $F3, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F3, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $EB, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $EB, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedIceWave_5:
    dw $0008                                                             ;93B71C;
    %spritemapEntry(0, $00, $0D, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $0D, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $05, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $05, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $F3, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F3, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $EB, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $EB, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedIceWave_6:
    dw $0008                                                             ;93B746;
    %spritemapEntry(0, $00, $0F, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $0F, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $07, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $07, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $F1, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F1, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $E9, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $E9, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedIceWave_7:
    dw $0008                                                             ;93B770;
    %spritemapEntry(0, $00, $0F, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $0F, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $07, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $07, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $F1, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F1, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $E9, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $E9, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedIceWave_8:
    dw $0008                                                             ;93B79A;
    %spritemapEntry(0, $00, $10, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $10, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $08, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $08, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $F0, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F0, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $E8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $E8, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedIceWave_9:
    dw $0008                                                             ;93B7C4;
    %spritemapEntry(0, $00, $10, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $10, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $08, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $08, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $F0, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F0, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $E8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $E8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedIceWave_A:
    dw $0008                                                             ;93B7EE;
    %spritemapEntry(0, $05, $FB, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1FD, $FB, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $05, $F3, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1FD, $F3, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1FB, $05, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F3, $05, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FB, $FD, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F3, $FD, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedIceWave_B:
    dw $0008                                                             ;93B818;
    %spritemapEntry(0, $04, $FC, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1FC, $FC, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $04, $F4, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $04, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F4, $04, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedIceWave_C:
    dw $0008                                                             ;93B842;
    %spritemapEntry(0, $1F9, $07, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F1, $07, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F9, $FF, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F1, $FF, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $07, $F9, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1FF, $F9, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $07, $F1, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1FF, $F1, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedIceWave_D:
    dw $0008                                                             ;93B86C;
    %spritemapEntry(0, $1F9, $07, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F1, $07, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1F9, $FF, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F1, $FF, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $07, $F9, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1FF, $F9, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $07, $F1, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1FF, $F1, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedIceWave_E:
    dw $0008                                                             ;93B896;
    %spritemapEntry(0, $1F7, $09, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1EF, $09, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F7, $01, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1EF, $01, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $09, $F7, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $01, $F7, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $09, $EF, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $01, $EF, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedIceWave_F:
    dw $0008                                                             ;93B8C0;
    %spritemapEntry(0, $1F7, $09, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1EF, $09, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1F7, $01, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1EF, $01, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $09, $F7, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $01, $F7, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $09, $EF, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $01, $EF, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedIceWave_10:
    dw $0008                                                             ;93B8EA;
    %spritemapEntry(0, $1F6, $0A, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1EE, $0A, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F6, $02, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1EE, $02, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0A, $F6, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $02, $F6, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $0A, $EE, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $02, $EE, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedIceWave_11:
    dw $0008                                                             ;93B914;
    %spritemapEntry(0, $1F6, $0A, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1EE, $0A, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1F6, $02, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1EE, $02, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $0A, $F6, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $02, $F6, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $0A, $EE, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $02, $EE, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedIceWave_12:
    dw $0008                                                             ;93B93E;
    %spritemapEntry(0, $1F3, $FB, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1FB, $FB, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F3, $F3, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1FB, $F3, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1FD, $05, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $05, $05, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1FD, $FD, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $05, $FD, 0, 1, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedIceWave_13:
    dw $0008                                                             ;93B968;
    %spritemapEntry(0, $1F4, $FC, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $FC, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F4, $F4, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F4, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1FC, $04, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $04, $04, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $04, $FC, 0, 1, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedIceWave_14:
    dw $0008                                                             ;93B992;
    %spritemapEntry(0, $1FF, $07, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $07, $07, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1FF, $FF, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $07, $FF, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F1, $F9, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1F9, $F9, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F1, $F1, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F9, $F1, 0, 1, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedIceWave_15:
    dw $0008                                                             ;93B9BC;
    %spritemapEntry(0, $1FF, $07, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $07, $07, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1FF, $FF, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $07, $FF, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F1, $F9, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F9, $F9, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F1, $F1, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1F9, $F1, 0, 1, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedIceWave_16:
    dw $0008                                                             ;93B9E6;
    %spritemapEntry(0, $01, $09, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $09, $09, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $01, $01, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $09, $01, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1EF, $F7, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1F7, $F7, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1EF, $EF, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F7, $EF, 0, 1, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedIceWave_17:
    dw $0008                                                             ;93BA10;
    %spritemapEntry(0, $01, $09, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $09, $09, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $01, $01, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $09, $01, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1EF, $F7, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F7, $F7, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1EF, $EF, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1F7, $EF, 0, 1, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedIceWave_18:
    dw $0008                                                             ;93BA3A;
    %spritemapEntry(0, $02, $0A, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $0A, $0A, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $02, $02, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0A, $02, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1EE, $F6, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1F6, $F6, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1EE, $EE, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F6, $EE, 0, 1, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedIceWave_19:
    dw $0008                                                             ;93BA64;
    %spritemapEntry(0, $02, $0A, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $0A, $0A, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $02, $02, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $0A, $02, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1EE, $F6, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F6, $F6, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1EE, $EE, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1F6, $EE, 0, 1, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedIceWave_1A:
    dw $0004                                                             ;93BA8E;
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedIceWave_1B:
    dw $0004                                                             ;93BAA4;
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedIceWave_1C:
    dw $0008                                                             ;93BABA;
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F0, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $08, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $00, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $08, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedIceWave_1D:
    dw $0008                                                             ;93BAE4;
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F0, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $08, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $00, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $08, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedIceWave_1E:
    dw $0008                                                             ;93BB0E;
    %spritemapEntry(0, $1F3, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F3, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1EB, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1EB, $F8, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $0D, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $05, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $0D, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $05, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedIceWave_1F:
    dw $0008                                                             ;93BB38;
    %spritemapEntry(0, $1F3, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F3, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1EB, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1EB, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0D, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $05, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $0D, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $05, $F8, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedIceWave_20:
    dw $0008                                                             ;93BB62;
    %spritemapEntry(0, $1F1, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F1, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1E9, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1E9, $F8, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $0F, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $07, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $0F, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $07, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedIceWave_21:
    dw $0008                                                             ;93BB8C;
    %spritemapEntry(0, $1F1, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F1, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1E9, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1E9, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0F, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $07, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $0F, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $07, $F8, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedIceWave_22:
    dw $0008                                                             ;93BBB6;
    %spritemapEntry(0, $1F0, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F0, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1E8, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $10, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $08, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $10, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $08, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedIceWave_23:
    dw $0008                                                             ;93BBE0;
    %spritemapEntry(0, $1F0, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F0, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1E8, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $10, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $08, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $10, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $08, $F8, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_Charged_PW_PIW_0:
    dw $0004                                                             ;93BC0A;
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Charged_PW_PIW_1:
    dw $0008                                                             ;93BC20;
    %spritemapEntry(0, $08, $04, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $04, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $04, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F0, $04, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $08, $F4, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $F4, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F0, $F4, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Charged_PW_PIW_2:
    dw $0008                                                             ;93BC4A;
    %spritemapEntry(0, $08, $09, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $09, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $09, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F0, $09, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $08, $EF, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $EF, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $EF, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F0, $EF, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Charged_PW_PIW_3:
    dw $0008                                                             ;93BC74;
    %spritemapEntry(0, $08, $0B, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $0B, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $0B, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F0, $0B, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $08, $ED, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $ED, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $ED, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F0, $ED, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Charged_PW_PIW_4:
    dw $0008                                                             ;93BC9E;
    %spritemapEntry(0, $08, $0C, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $0C, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $0C, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F0, $0C, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $08, $EC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $EC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $EC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F0, $EC, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Charged_PW_PIW_5:
    dw $0007                                                             ;93BCC8;
    %spritemapEntry(0, $14, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1E4, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $0C, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1EC, $FC, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Charged_PW_PIW_6:
    dw $000E                                                             ;93BCED;
    %spritemapEntry(0, $14, $04, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $14, $F4, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $0C, $04, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1E4, $04, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1E4, $F4, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $0C, $F4, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $04, $04, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F4, $04, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1EC, $04, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $04, $F4, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F4, $F4, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1EC, $F4, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Charged_PW_PIW_7:
    dw $000E                                                             ;93BD35;
    %spritemapEntry(0, $14, $09, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $14, $EF, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $0C, $09, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1E4, $09, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1E4, $EF, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $0C, $EF, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $04, $09, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1FC, $09, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F4, $09, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1EC, $09, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $04, $EF, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1FC, $EF, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F4, $EF, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1EC, $EF, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Charged_PW_PIW_8:
    dw $000E                                                             ;93BD7D;
    %spritemapEntry(0, $14, $0B, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $14, $ED, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $0C, $0B, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1E4, $0B, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1E4, $ED, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $0C, $ED, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $04, $0B, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1FC, $0B, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F4, $0B, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1EC, $0B, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $04, $ED, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1FC, $ED, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F4, $ED, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1EC, $ED, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Charged_PW_PIW_9:
    dw $000E                                                             ;93BDC5;
    %spritemapEntry(0, $14, $0C, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $14, $EC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $0C, $0C, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1E4, $0C, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1E4, $EC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $0C, $EC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $04, $0C, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1FC, $0C, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F4, $0C, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1EC, $0C, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $04, $EC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1FC, $EC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F4, $EC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1EC, $EC, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Charged_PW_PIW_A:
    dw $0006                                                             ;93BE0D;
    %spritemapEntry(0, $08, $04, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $00, $04, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F0, $F4, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_PW_PIW_B:
    dw $000C                                                             ;93BE2D;
    %spritemapEntry(0, $0F, $FE, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $07, $FE, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1FF, $EE, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F7, $EE, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $07, $F6, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FF, $F6, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $02, $0A, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FA, $0A, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1F2, $FA, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1EA, $FA, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1FA, $02, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F2, $02, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_PW_PIW_C:
    dw $000C                                                             ;93BE6B;
    %spritemapEntry(0, $12, $FB, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $0A, $FB, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $02, $EB, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FA, $EB, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $0A, $F3, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $02, $F3, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1FF, $0D, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F7, $0D, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1EF, $FD, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1E7, $FD, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1F7, $05, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1EF, $05, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_PW_PIW_D:
    dw $000C                                                             ;93BEA9;
    %spritemapEntry(0, $14, $F9, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $0C, $F9, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $04, $E9, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FC, $E9, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $0C, $F1, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $04, $F1, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1FD, $0F, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F5, $0F, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1ED, $FF, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1E5, $FF, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1F5, $07, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1ED, $07, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_PW_PIW_E:
    dw $000C                                                             ;93BEE7;
    %spritemapEntry(0, $15, $F8, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $0D, $F8, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $05, $E8, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FD, $E8, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $0D, $F0, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $05, $F0, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1FC, $10, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F4, $10, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1EC, $00, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1E4, $00, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1F4, $08, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1EC, $08, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_PW_PIW_F:
    dw $000A                                                             ;93BF25;
    %spritemapEntry(0, $1F0, $EC, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1E8, $EC, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $10, $0C, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $08, $0C, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $08, $04, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $00, $04, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F0, $F4, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_PW_PIW_10:
    dw $0014                                                             ;93BF59;
    %spritemapEntry(0, $1F7, $E6, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1EF, $E6, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1EA, $F2, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1E2, $F2, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $0A, $12, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $02, $12, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $17, $06, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $0F, $06, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $0F, $FE, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $07, $FE, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1FF, $EE, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F7, $EE, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $07, $F6, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FF, $F6, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $02, $0A, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FA, $0A, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1F2, $FA, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1EA, $FA, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1FA, $02, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F2, $02, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_PW_PIW_11:
    dw $0014                                                             ;93BFBF;
    %spritemapEntry(0, $1FA, $E3, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F2, $E3, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1A, $03, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $12, $03, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1E7, $F5, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1DF, $F5, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $07, $15, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FF, $15, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $12, $FB, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $0A, $FB, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $02, $EB, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FA, $EB, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $0A, $F3, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $02, $F3, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1FF, $0D, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F7, $0D, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1EF, $FD, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1E7, $FD, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1F7, $05, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1EF, $05, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_PW_PIW_12:
    dw $0014                                                             ;93C025;
    %spritemapEntry(0, $1E5, $F7, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1DD, $F7, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1FC, $E1, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F4, $E1, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $05, $17, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FD, $17, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1B, $00, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $13, $00, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $14, $F9, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $0C, $F9, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $04, $E9, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FC, $E9, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $0C, $F1, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $04, $F1, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1FD, $0F, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F5, $0F, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1ED, $FF, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1E5, $FF, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1F5, $07, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1ED, $07, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_PW_PIW_13:
    dw $0014                                                             ;93C08B;
    %spritemapEntry(0, $1E4, $F8, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1DC, $F8, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1FD, $E0, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F5, $E0, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $04, $18, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FC, $18, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1D, $00, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $15, $00, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $15, $F8, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $0D, $F8, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $05, $E8, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FD, $E8, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $0D, $F0, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $05, $F0, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1FC, $10, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F4, $10, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1EC, $00, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1E4, $00, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1F4, $08, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1EC, $08, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_PW_PIW_14:
    dw $0004                                                             ;93C0F1;
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_PW_PIW_15:
    dw $0008                                                             ;93C107;
    %spritemapEntry(0, $04, $08, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $04, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $04, $F0, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $04, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1F5, $08, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1F5, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1F5, $F0, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1F5, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_PW_PIW_16:
    dw $0008                                                             ;93C131;
    %spritemapEntry(0, $09, $08, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $09, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $09, $F0, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $09, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1EF, $08, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1EF, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1EF, $F0, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1EF, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_PW_PIW_17:
    dw $0008                                                             ;93C15B;
    %spritemapEntry(0, $0B, $08, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0B, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0B, $F0, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0B, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1EE, $08, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1EE, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1EE, $F0, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1EE, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_PW_PIW_18:
    dw $0008                                                             ;93C185;
    %spritemapEntry(0, $0C, $08, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0C, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0C, $F0, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0C, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1ED, $08, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1ED, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1ED, $F0, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1ED, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_PW_PIW_19:
    dw $0007                                                             ;93C1AF;
    %spritemapEntry(0, $1FC, $14, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $0C, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $E4, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $EC, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_PW_PIW_1A:
    dw $000E                                                             ;93C1D4;
    %spritemapEntry(0, $04, $14, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $04, $0C, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1F5, $14, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1F5, $0C, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1F5, $E4, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $04, $E4, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $04, $04, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $04, $EC, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $04, $F4, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1F5, $04, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1F5, $FC, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1F5, $EC, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1F5, $F4, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_PW_PIW_1B:
    dw $000E                                                             ;93C21C;
    %spritemapEntry(0, $1EF, $14, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1EF, $0C, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $09, $14, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $09, $0C, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $09, $E4, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1EF, $E4, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $09, $04, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $09, $FC, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $09, $EC, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $09, $F4, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1EF, $04, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1EF, $FC, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1EF, $EC, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1EF, $F4, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_PW_PIW_1C:
    dw $000E                                                             ;93C264;
    %spritemapEntry(0, $1EE, $14, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1EE, $0C, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0B, $14, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0B, $0C, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0B, $E4, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1EE, $E4, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0B, $04, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0B, $FC, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0B, $EC, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0B, $F4, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1EE, $04, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1EE, $FC, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1EE, $EC, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1EE, $F4, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_PW_PIW_1D:
    dw $000E                                                             ;93C2AC;
    %spritemapEntry(0, $1ED, $14, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1ED, $0C, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0C, $14, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0C, $0C, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0C, $E4, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1ED, $E4, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0C, $04, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0C, $FC, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0C, $EC, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0C, $F4, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1ED, $04, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1ED, $FC, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1ED, $EC, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1ED, $F4, 0, 0, 2, 6, $33)

UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C2F4:
    dw $0004                                                             ;93C2F4;
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 6, $34)

UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C30A:
    dw $0008                                                             ;93C30A;
    %spritemapEntry(0, $08, $04, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $04, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $04, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F0, $04, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $08, $F4, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $F4, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F0, $F4, 0, 0, 2, 6, $34)

UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C334:
    dw $0008                                                             ;93C334;
    %spritemapEntry(0, $08, $09, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $09, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $09, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F0, $09, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $08, $EF, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $EF, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $EF, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F0, $EF, 0, 0, 2, 6, $34)

UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C35E:
    dw $0008                                                             ;93C35E;
    %spritemapEntry(0, $08, $0B, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $0B, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $0B, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F0, $0B, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $08, $ED, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $ED, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $ED, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F0, $ED, 0, 0, 2, 6, $34)

UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C388:
    dw $0008                                                             ;93C388;
    %spritemapEntry(0, $08, $0C, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $0C, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $0C, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F0, $0C, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $08, $EC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $EC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $EC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F0, $EC, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_Charged_PW_PIW_1E:
    dw $0007                                                             ;93C3B2;
    %spritemapEntry(0, $14, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1E4, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $0C, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1EC, $FC, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_Charged_PW_PIW_1F:
    dw $000E                                                             ;93C3D7;
    %spritemapEntry(0, $14, $04, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $14, $F4, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $0C, $04, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1E4, $04, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1E4, $F4, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $0C, $F4, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $04, $04, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F4, $04, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1EC, $04, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $04, $F4, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F4, $F4, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1EC, $F4, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_Charged_PW_PIW_20:
    dw $000E                                                             ;93C41F;
    %spritemapEntry(0, $14, $09, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $14, $EF, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $0C, $09, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1E4, $09, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1E4, $EF, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $0C, $EF, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $04, $09, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1FC, $09, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F4, $09, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1EC, $09, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $04, $EF, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1FC, $EF, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F4, $EF, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1EC, $EF, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_Charged_PW_PIW_21:
    dw $000E                                                             ;93C467;
    %spritemapEntry(0, $14, $0B, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $14, $ED, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $0C, $0B, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1E4, $0B, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1E4, $ED, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $0C, $ED, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $04, $0B, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1FC, $0B, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F4, $0B, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1EC, $0B, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $04, $ED, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1FC, $ED, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F4, $ED, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1EC, $ED, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_Charged_PW_PIW_22:
    dw $000E                                                             ;93C4AF;
    %spritemapEntry(0, $14, $0C, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $14, $EC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $0C, $0C, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1E4, $0C, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1E4, $EC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $0C, $EC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $04, $0C, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1FC, $0C, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F4, $0C, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1EC, $0C, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $04, $EC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1FC, $EC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F4, $EC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1EC, $EC, 0, 0, 2, 6, $34)

UNSUED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C4F7:
    dw $0008                                                             ;93C4F7;
    %spritemapEntry(0, $08, $0C, 1, 1, 2, 6, $36)
    %spritemapEntry(0, $1F0, $EC, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $08, $04, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $00, $FC, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1F8, $F4, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $00, $04, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1F0, $F4, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $35)

UNSUED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C521:
    dw $0010                                                             ;93C521;
    %spritemapEntry(0, $0F, $06, 1, 1, 2, 6, $36)
    %spritemapEntry(0, $02, $12, 1, 1, 2, 6, $36)
    %spritemapEntry(0, $1F7, $E6, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $1EA, $F2, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $1FF, $EE, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $07, $F6, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $0F, $FE, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $02, $0A, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1FA, $02, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1F2, $FA, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $07, $FE, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1F7, $EE, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1FF, $F6, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1FA, $0A, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1EA, $FA, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1F2, $02, 0, 0, 2, 6, $35)

UNSUED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C573:
    dw $0010                                                             ;93C573;
    %spritemapEntry(0, $1FF, $15, 1, 1, 2, 6, $36)
    %spritemapEntry(0, $12, $03, 1, 1, 2, 6, $36)
    %spritemapEntry(0, $1E7, $F5, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $1FA, $E3, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $12, $FB, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $0A, $F3, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $02, $EB, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1FF, $0D, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1F7, $05, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1EF, $FD, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $0A, $FB, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1FA, $EB, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $02, $F3, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1F7, $0D, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1E7, $FD, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1EF, $05, 0, 0, 2, 6, $35)

UNSUED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C5C5:
    dw $0010                                                             ;93C5C5;
    %spritemapEntry(0, $1FD, $17, 1, 1, 2, 6, $36)
    %spritemapEntry(0, $14, $01, 1, 1, 2, 6, $36)
    %spritemapEntry(0, $1E5, $F7, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $1FC, $E1, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $14, $F9, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $0C, $F1, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $04, $E9, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1FD, $0F, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1F5, $07, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1ED, $FF, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $0C, $F9, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1FC, $E9, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $04, $F1, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1F5, $0F, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1E5, $FF, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1ED, $07, 0, 0, 2, 6, $35)

UNSUED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C617:
    dw $0010                                                             ;93C617;
    %spritemapEntry(0, $1FC, $18, 1, 1, 2, 6, $36)
    %spritemapEntry(0, $15, $00, 1, 1, 2, 6, $36)
    %spritemapEntry(0, $1FD, $E0, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $1E4, $F8, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $15, $F8, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $0D, $F0, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $05, $E8, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1FC, $10, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1F4, $08, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1EC, $00, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $0D, $F8, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1FD, $E8, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $05, $F0, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1F4, $10, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1E4, $00, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1EC, $08, 0, 0, 2, 6, $35)

ProjectileFlareSpritemaps_Charged_PW_PIW_23:
    dw $000C                                                             ;93C669;
    %spritemapEntry(0, $10, $14, 1, 1, 2, 6, $36)
    %spritemapEntry(0, $1E8, $E4, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $10, $0C, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $08, $04, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $00, $FC, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1F8, $F4, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1F0, $EC, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1E8, $EC, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $08, $0C, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $00, $04, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1F0, $F4, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $35)

ProjectileFlareSpritemaps_Charged_PW_PIW_24:
    dw $0018                                                             ;93C6A7;
    %spritemapEntry(0, $0A, $1A, 1, 1, 2, 6, $36)
    %spritemapEntry(0, $17, $0E, 1, 1, 2, 6, $36)
    %spritemapEntry(0, $1E2, $EA, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $1EF, $DE, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $1F7, $E6, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1FF, $EE, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $07, $F6, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $0F, $FE, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $17, $06, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $0A, $12, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $02, $0A, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1FA, $02, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1F2, $FA, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1EA, $F2, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1EF, $E6, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1E2, $F2, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $02, $12, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $0F, $06, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $07, $FE, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1F7, $EE, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1FF, $F6, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1FA, $0A, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1EA, $FA, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1F2, $02, 0, 0, 2, 6, $35)

ProjectileFlareSpritemaps_Charged_PW_PIW_25:
    dw $0018                                                             ;93C721;
    %spritemapEntry(0, $1DF, $ED, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $1F2, $DB, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $07, $1D, 1, 1, 2, 6, $36)
    %spritemapEntry(0, $1A, $0B, 1, 1, 2, 6, $36)
    %spritemapEntry(0, $1FA, $E3, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $02, $EB, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $0A, $F3, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $12, $FB, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1A, $03, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $07, $15, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1FF, $0D, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1F7, $05, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1EF, $FD, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1E7, $F5, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1F2, $E3, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $12, $03, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1DF, $F5, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1FF, $15, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $0A, $FB, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1FA, $EB, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $02, $F3, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1F7, $0D, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1E7, $FD, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1EF, $05, 0, 0, 2, 6, $35)

ProjectileFlareSpritemaps_Charged_PW_PIW_26:
    dw $0018                                                             ;93C79B;
    %spritemapEntry(0, $1DD, $EF, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $1F4, $D9, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $05, $1F, 1, 1, 2, 6, $36)
    %spritemapEntry(0, $1B, $08, 1, 1, 2, 6, $36)
    %spritemapEntry(0, $1FC, $E1, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $04, $E9, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $0C, $F1, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $14, $F9, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1B, $00, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $05, $17, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1FD, $0F, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1F5, $07, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1ED, $FF, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1E5, $F7, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1DD, $F7, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1F4, $E1, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1FD, $17, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $13, $00, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $0C, $F9, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1FC, $E9, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $04, $F1, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1F5, $0F, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1E5, $FF, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1ED, $07, 0, 0, 2, 6, $35)

ProjectileFlareSpritemaps_Charged_PW_PIW_27:
    dw $0018                                                             ;93C815;
    %spritemapEntry(0, $04, $20, 1, 1, 2, 6, $36)
    %spritemapEntry(0, $1D, $08, 1, 1, 2, 6, $36)
    %spritemapEntry(0, $1DC, $F0, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $1F5, $D8, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $1E4, $F8, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1EC, $00, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1F4, $08, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1FC, $10, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $04, $18, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1D, $00, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $15, $F8, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $0D, $F0, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $05, $E8, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1FD, $E0, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1DC, $F8, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1F5, $E0, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1FC, $18, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $15, $00, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $0D, $F8, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1FD, $E8, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $05, $F0, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1F4, $10, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1E4, $00, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1EC, $08, 0, 0, 2, 6, $35)

UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C88F:
    dw $0004                                                             ;93C88F;
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $37)

UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C8A5:
    dw $0008                                                             ;93C8A5;
    %spritemapEntry(0, $04, $08, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $04, $00, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $04, $F0, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $04, $F8, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1F5, $08, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1F5, $00, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1F5, $F0, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1F5, $F8, 0, 0, 2, 6, $37)

UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C8CF:
    dw $0008                                                             ;93C8CF;
    %spritemapEntry(0, $09, $08, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $09, $00, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $09, $F0, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $09, $F8, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1EF, $08, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1EF, $00, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1EF, $F0, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1EF, $F8, 0, 0, 2, 6, $37)

UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C8F9:
    dw $0008                                                             ;93C8F9;
    %spritemapEntry(0, $0B, $08, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $0B, $00, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $0B, $F0, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $0B, $F8, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1EE, $08, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1EE, $00, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1EE, $F0, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1EE, $F8, 0, 0, 2, 6, $37)

UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C923:
    dw $0008                                                             ;93C923;
    %spritemapEntry(0, $0C, $08, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $0C, $00, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $0C, $F0, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $0C, $F8, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1ED, $08, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1ED, $00, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1ED, $F0, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1ED, $F8, 0, 0, 2, 6, $37)

ProjectileFlareSpritemaps_Charged_PW_PIW_28:
    dw $0007                                                             ;93C94D;
    %spritemapEntry(0, $1FC, $14, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $0C, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $E4, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $EC, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 6, $37)

ProjectileFlareSpritemaps_Charged_PW_PIW_29:
    dw $000E                                                             ;93C972;
    %spritemapEntry(0, $04, $14, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $04, $0C, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1F5, $14, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1F5, $0C, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1F5, $E4, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $04, $E4, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $04, $04, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $04, $EC, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $04, $F4, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1F5, $04, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1F5, $FC, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1F5, $EC, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1F5, $F4, 0, 0, 2, 6, $37)

ProjectileFlareSpritemaps_Charged_PW_PIW_2A:
    dw $000E                                                             ;93C9BA;
    %spritemapEntry(0, $1EF, $14, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1EF, $0C, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $09, $14, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $09, $0C, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $09, $E4, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1EF, $E4, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $09, $04, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $09, $FC, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $09, $EC, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $09, $F4, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1EF, $04, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1EF, $FC, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1EF, $EC, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1EF, $F4, 0, 0, 2, 6, $37)

ProjectileFlareSpritemaps_Charged_PW_PIW_2B:
    dw $000E                                                             ;93CA02;
    %spritemapEntry(0, $1EE, $14, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1EE, $0C, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $0B, $14, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $0B, $0C, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $0B, $E4, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1EE, $E4, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $0B, $04, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $0B, $FC, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $0B, $EC, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $0B, $F4, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1EE, $04, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1EE, $FC, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1EE, $EC, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1EE, $F4, 0, 0, 2, 6, $37)

ProjectileFlareSpritemaps_Charged_PW_PIW_2C:
    dw $000E                                                             ;93CA4A;
    %spritemapEntry(0, $1ED, $14, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1ED, $0C, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $0C, $14, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $0C, $0C, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $0C, $E4, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1ED, $E4, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $0C, $04, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $0C, $FC, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $0C, $EC, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $0C, $F4, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1ED, $04, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1ED, $FC, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1ED, $EC, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1ED, $F4, 0, 0, 2, 6, $37)

UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93CA92:
    dw $0008                                                             ;93CA92;
    %spritemapEntry(0, $1F0, $0C, 1, 0, 2, 6, $36)
    %spritemapEntry(0, $08, $EC, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $1F0, $04, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1F8, $FC, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $00, $F4, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1F8, $04, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $08, $F4, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 6, $35)

UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93CABC:
    dw $0010                                                             ;93CABC;
    %spritemapEntry(0, $1E9, $06, 1, 0, 2, 6, $36)
    %spritemapEntry(0, $1F6, $12, 1, 0, 2, 6, $36)
    %spritemapEntry(0, $01, $E6, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $0E, $F2, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $1F9, $EE, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1F1, $F6, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1E9, $FE, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1F6, $0A, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1FE, $02, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $06, $FA, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1F1, $FE, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $01, $EE, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $1F9, $F6, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $1FE, $0A, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $0E, $FA, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $06, $02, 0, 1, 2, 6, $35)

UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93CB0E:
    dw $0010                                                             ;93CB0E;
    %spritemapEntry(0, $1F9, $15, 1, 0, 2, 6, $36)
    %spritemapEntry(0, $1E6, $03, 1, 0, 2, 6, $36)
    %spritemapEntry(0, $11, $F5, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $1FE, $E3, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $1E6, $FB, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1EE, $F3, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1F6, $EB, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1F9, $0D, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $01, $05, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $09, $FD, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1EE, $FB, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $1FE, $EB, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $1F6, $F3, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $01, $0D, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $11, $FD, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $09, $05, 0, 1, 2, 6, $35)

UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93CB60:
    dw $0010                                                             ;93CB60;
    %spritemapEntry(0, $1FB, $17, 1, 0, 2, 6, $36)
    %spritemapEntry(0, $1E4, $01, 1, 0, 2, 6, $36)
    %spritemapEntry(0, $13, $F7, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $1FC, $E1, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $1E4, $F9, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1EC, $F1, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1F4, $E9, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1FB, $0F, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $03, $07, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $0B, $FF, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1EC, $F9, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $1FC, $E9, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $1F4, $F1, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $03, $0F, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $13, $FF, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $0B, $07, 0, 1, 2, 6, $35)

UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93CBB2:
    dw $0010                                                             ;93CBB2;
    %spritemapEntry(0, $1FC, $18, 1, 0, 2, 6, $36)
    %spritemapEntry(0, $1E3, $00, 1, 0, 2, 6, $36)
    %spritemapEntry(0, $1FB, $E0, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $14, $F8, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $1E3, $F8, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1EB, $F0, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1F3, $E8, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1FC, $10, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $04, $08, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $0C, $00, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1EB, $F8, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $1FB, $E8, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $1F3, $F0, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $04, $10, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $14, $00, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $0C, $08, 0, 1, 2, 6, $35)

ProjectileFlareSpritemaps_Charged_PW_PIW_2D:
    dw $000C                                                             ;93CC04;
    %spritemapEntry(0, $1E8, $14, 1, 0, 2, 6, $36)
    %spritemapEntry(0, $10, $E4, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $1E8, $0C, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1F0, $04, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1F8, $FC, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $00, $F4, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $08, $EC, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $10, $EC, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $1F0, $0C, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $1F8, $04, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $08, $F4, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 6, $35)

ProjectileFlareSpritemaps_Charged_PW_PIW_2E:
    dw $0018                                                             ;93CC42;
    %spritemapEntry(0, $1EE, $1A, 1, 0, 2, 6, $36)
    %spritemapEntry(0, $1E1, $0E, 1, 0, 2, 6, $36)
    %spritemapEntry(0, $16, $EA, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $09, $DE, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $01, $E6, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1F9, $EE, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1F1, $F6, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1E9, $FE, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1E1, $06, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1EE, $12, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1F6, $0A, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1FE, $02, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $06, $FA, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $0E, $F2, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $09, $E6, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $16, $F2, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $1F6, $12, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $1E9, $06, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $1F1, $FE, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $01, $EE, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $1F9, $F6, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $1FE, $0A, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $0E, $FA, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $06, $02, 0, 1, 2, 6, $35)

ProjectileFlareSpritemaps_Charged_PW_PIW_2F:
    dw $0018                                                             ;93CCBC;
    %spritemapEntry(0, $19, $ED, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $06, $DB, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $1F1, $1D, 1, 0, 2, 6, $36)
    %spritemapEntry(0, $1DE, $0B, 1, 0, 2, 6, $36)
    %spritemapEntry(0, $1FE, $E3, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1F6, $EB, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1EE, $F3, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1E6, $FB, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1DE, $03, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1F1, $15, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1F9, $0D, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $01, $05, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $09, $FD, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $11, $F5, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $06, $E3, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $1E6, $03, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $19, $F5, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $1F9, $15, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $1EE, $FB, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $1FE, $EB, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $1F6, $F3, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $01, $0D, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $11, $FD, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $09, $05, 0, 1, 2, 6, $35)

ProjectileFlareSpritemaps_Charged_PW_PIW_30:
    dw $0018                                                             ;93CD36;
    %spritemapEntry(0, $1B, $EF, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $04, $D9, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $1F3, $1F, 1, 0, 2, 6, $36)
    %spritemapEntry(0, $1DD, $08, 1, 0, 2, 6, $36)
    %spritemapEntry(0, $1FC, $E1, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1F4, $E9, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1EC, $F1, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1E4, $F9, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1DD, $00, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1F3, $17, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1FB, $0F, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $03, $07, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $0B, $FF, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $13, $F7, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1B, $F7, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $04, $E1, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $1FB, $17, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $1E5, $00, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $1EC, $F9, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $1FC, $E9, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $1F4, $F1, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $03, $0F, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $13, $FF, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $0B, $07, 0, 1, 2, 6, $35)

ProjectileFlareSpritemaps_Charged_PW_PIW_31:
    dw $0018                                                             ;93CDB0;
    %spritemapEntry(0, $1F4, $20, 1, 0, 2, 6, $36)
    %spritemapEntry(0, $1DB, $08, 1, 0, 2, 6, $36)
    %spritemapEntry(0, $1C, $F0, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $03, $D8, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $14, $F8, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $0C, $00, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $04, $08, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1FC, $10, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1F4, $18, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1DB, $00, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1E3, $F8, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1EB, $F0, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1F3, $E8, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1FB, $E0, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1C, $F8, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $03, $E0, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $1FC, $18, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $1E3, $00, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $1EB, $F8, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $1FB, $E8, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $1F3, $F0, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $04, $10, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $14, $00, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $0C, $08, 0, 1, 2, 6, $35)

ProjectileFlareSpritemaps_Charged_PW_PIW_32:
    dw $0006                                                             ;93CE2A;
    %spritemapEntry(0, $1F0, $04, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F8, $04, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $00, $F4, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $08, $F4, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_PW_PIW_33:
    dw $000C                                                             ;93CE4A;
    %spritemapEntry(0, $1E9, $FE, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F1, $FE, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F9, $EE, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $01, $EE, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F1, $F6, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F9, $F6, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F6, $0A, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1FE, $0A, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $06, $FA, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $0E, $FA, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1FE, $02, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $06, $02, 0, 1, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_PW_PIW_34:
    dw $000C                                                             ;93CE88;
    %spritemapEntry(0, $1E6, $FB, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1EE, $FB, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F6, $EB, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1FE, $EB, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1EE, $F3, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F6, $F3, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F9, $0D, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $01, $0D, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $09, $FD, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $11, $FD, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $01, $05, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $09, $05, 0, 1, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_PW_PIW_35:
    dw $000C                                                             ;93CEC6;
    %spritemapEntry(0, $1E4, $F9, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1EC, $F9, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F4, $E9, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1FC, $E9, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1EC, $F1, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F4, $F1, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1FB, $0F, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $03, $0F, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $0B, $FF, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $13, $FF, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $03, $07, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $0B, $07, 0, 1, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_PW_PIW_36:
    dw $000C                                                             ;93CF04;
    %spritemapEntry(0, $1E3, $F8, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1EB, $F8, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F3, $E8, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1FB, $E8, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1EB, $F0, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F3, $F0, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1FC, $10, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $04, $10, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $0C, $00, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $14, $00, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $04, $08, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $0C, $08, 0, 1, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_PW_PIW_37:
    dw $000A                                                             ;93CF42;
    %spritemapEntry(0, $08, $EC, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $10, $EC, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1E8, $0C, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F0, $0C, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F0, $04, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F8, $04, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $00, $F4, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $08, $F4, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_PW_PIW_38:
    dw $0014                                                             ;93CF76;
    %spritemapEntry(0, $01, $E6, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $09, $E6, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $0E, $F2, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $16, $F2, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1EE, $12, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F6, $12, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1E1, $06, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1E9, $06, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1E9, $FE, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F1, $FE, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F9, $EE, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $01, $EE, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F1, $F6, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F9, $F6, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F6, $0A, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1FE, $0A, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $06, $FA, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $0E, $FA, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1FE, $02, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $06, $02, 0, 1, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_PW_PIW_39:
    dw $0014                                                             ;93CFDC;
    %spritemapEntry(0, $1FE, $E3, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $06, $E3, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1DE, $03, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1E6, $03, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $11, $F5, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $19, $F5, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F1, $15, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F9, $15, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1E6, $FB, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1EE, $FB, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F6, $EB, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1FE, $EB, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1EE, $F3, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F6, $F3, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F9, $0D, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $01, $0D, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $09, $FD, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $11, $FD, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $01, $05, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $09, $05, 0, 1, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_PW_PIW_3A:
    dw $0014                                                             ;93D042;
    %spritemapEntry(0, $13, $F7, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1B, $F7, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1FC, $E1, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $04, $E1, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F3, $17, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1FB, $17, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1DD, $00, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1E5, $00, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1E4, $F9, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1EC, $F9, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F4, $E9, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1FC, $E9, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1EC, $F1, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F4, $F1, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1FB, $0F, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $03, $0F, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $0B, $FF, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $13, $FF, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $03, $07, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $0B, $07, 0, 1, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_PW_PIW_3B:
    dw $0014                                                             ;93D0A8;
    %spritemapEntry(0, $14, $F8, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1C, $F8, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1FB, $E0, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $03, $E0, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F4, $18, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1FC, $18, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1DB, $00, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1E3, $00, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1E3, $F8, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1EB, $F8, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F3, $E8, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1FB, $E8, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1EB, $F0, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F3, $F0, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1FC, $10, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $04, $10, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $0C, $00, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $14, $00, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $04, $08, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $0C, $08, 0, 1, 2, 6, $31)

ProjectileFlareSpritemaps_S_SI_SW_SIW_0:
    dw $0004                                                             ;93D10E;
    %spritemapEntry(0, $1F2, $00, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1FA, $00, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1FA, $F8, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $02, $F8, 0, 1, 2, 6, $31)

ProjectileFlareSpritemaps_S_SI_SW_SIW_1:
    dw $000C                                                             ;93D124;
    %spritemapEntry(0, $1F2, $00, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1FA, $00, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1FA, $F8, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $02, $F8, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1EC, $FA, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F4, $FA, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F4, $F2, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1FC, $F2, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F8, $06, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $00, $06, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $00, $FE, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $08, $FE, 0, 1, 2, 6, $31)

ProjectileFlareSpritemaps_S_SI_SW_SIW_2:
    dw $000C                                                             ;93D162;
    %spritemapEntry(0, $1F2, $00, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1FA, $00, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1FA, $F8, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $02, $F8, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1E9, $F7, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F1, $F7, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F1, $EF, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F9, $EF, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1FB, $09, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $03, $09, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $03, $01, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $0B, $01, 0, 1, 2, 6, $31)

ProjectileFlareSpritemaps_S_SI_SW_SIW_3:
    dw $000C                                                             ;93D1A0;
    %spritemapEntry(0, $1F2, $00, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1FA, $00, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1FA, $F8, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $02, $F8, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1E7, $F5, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1EF, $F5, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1EF, $ED, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F7, $ED, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1FD, $0B, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $05, $0B, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $05, $03, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $0D, $03, 0, 1, 2, 6, $31)

ProjectileFlareSpritemaps_S_SI_SW_SIW_4:
    dw $000C                                                             ;93D1DE;
    %spritemapEntry(0, $1F2, $00, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1FA, $00, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1FA, $F8, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $02, $F8, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1E6, $F4, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1EE, $F4, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1EE, $EC, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F6, $EC, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1FE, $0C, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $06, $0C, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $06, $04, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $0E, $04, 0, 1, 2, 6, $31)

ProjectileFlareSpritemaps_S_SI_SW_SIW_5:
    dw $000C                                                             ;93D21C;
    %spritemapEntry(0, $1EF, $FE, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F7, $FE, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F7, $F6, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1FF, $F6, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F4, $03, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1FC, $03, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1FC, $FB, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $04, $FB, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F2, $00, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1FA, $00, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1FA, $F8, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $02, $F8, 0, 1, 2, 6, $31)

ProjectileFlareSpritemaps_S_SI_SW_SIW_6:
    dw $0004                                                             ;93D25A;
    %spritemapEntry(0, $1F2, $F8, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1FA, $F8, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1FA, $00, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $02, $00, 1, 1, 2, 6, $31)

ProjectileFlareSpritemaps_S_SI_SW_SIW_7:
    dw $000C                                                             ;93D270;
    %spritemapEntry(0, $1F2, $F8, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1FA, $F8, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1FA, $00, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $02, $00, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1EC, $FE, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1F4, $FE, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1F4, $06, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1FC, $06, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1F8, $F2, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $00, $F2, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $00, $FA, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $08, $FA, 1, 1, 2, 6, $31)

ProjectileFlareSpritemaps_S_SI_SW_SIW_8:
    dw $000C                                                             ;93D2AE;
    %spritemapEntry(0, $1F2, $F8, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1FA, $F8, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1FA, $00, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $02, $00, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1E9, $01, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1F1, $01, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1F1, $09, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1F9, $09, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1FB, $EF, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $03, $EF, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $03, $F7, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $0B, $F7, 1, 1, 2, 6, $31)

ProjectileFlareSpritemaps_S_SI_SW_SIW_9:
    dw $000C                                                             ;93D2EC;
    %spritemapEntry(0, $1F2, $F8, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1FA, $F8, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1FA, $00, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $02, $00, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1E7, $03, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1EF, $03, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1EF, $0B, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1F7, $0B, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1FD, $ED, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $05, $ED, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $05, $F5, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $0D, $F5, 1, 1, 2, 6, $31)

ProjectileFlareSpritemaps_S_SI_SW_SIW_A:
    dw $000C                                                             ;93D32A;
    %spritemapEntry(0, $1F2, $F8, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1FA, $F8, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1FA, $00, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $02, $00, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1E6, $04, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1EE, $04, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1EE, $0C, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1F6, $0C, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1FE, $EC, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $06, $EC, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $06, $F4, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $0E, $F4, 1, 1, 2, 6, $31)

ProjectileFlareSpritemaps_S_SI_SW_SIW_B:
    dw $000C                                                             ;93D368;
    %spritemapEntry(0, $1EF, $FA, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1F7, $FA, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1F7, $02, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1FF, $02, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1F4, $F5, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1FC, $F5, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1FC, $FD, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $04, $FD, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1F2, $F8, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1FA, $F8, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1FA, $00, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $02, $00, 1, 1, 2, 6, $31)

ProjectileFlareSpritemaps_S_SI_SW_SIW_C:
    dw $0004                                                             ;93D3A6;
    %spritemapEntry(0, $06, $F8, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1FE, $F8, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $1FE, $00, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1F6, $00, 1, 0, 2, 6, $31)

ProjectileFlareSpritemaps_S_SI_SW_SIW_D:
    dw $000C                                                             ;93D3BC;
    %spritemapEntry(0, $06, $F8, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1FE, $F8, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $1FE, $00, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1F6, $00, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $0C, $FE, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $04, $FE, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $04, $06, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1FC, $06, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $00, $F2, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1F8, $F2, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $1F8, $FA, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1F0, $FA, 1, 0, 2, 6, $31)

ProjectileFlareSpritemaps_S_SI_SW_SIW_E:
    dw $000C                                                             ;93D3FA;
    %spritemapEntry(0, $06, $F8, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1FE, $F8, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $1FE, $00, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1F6, $00, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $0F, $01, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $07, $01, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $07, $09, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1FF, $09, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $1FD, $EF, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1F5, $EF, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $1F5, $F7, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1ED, $F7, 1, 0, 2, 6, $31)

ProjectileFlareSpritemaps_S_SI_SW_SIW_F:
    dw $000C                                                             ;93D438;
    %spritemapEntry(0, $06, $F8, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1FE, $F8, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $1FE, $00, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1F6, $00, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $11, $03, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $09, $03, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $09, $0B, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $01, $0B, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $1FB, $ED, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1F3, $ED, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $1F3, $F5, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1EB, $F5, 1, 0, 2, 6, $31)

ProjectileFlareSpritemaps_S_SI_SW_SIW_10:
    dw $000C                                                             ;93D476;
    %spritemapEntry(0, $06, $F8, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1FE, $F8, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $1FE, $00, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1F6, $00, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $12, $04, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $0A, $04, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $0A, $0C, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $02, $0C, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $1FA, $EC, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1F2, $EC, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $1F2, $F4, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1EA, $F4, 1, 0, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_S_SI_SW_SIW_93D4B4:
    dw $000C                                                             ;93D4B4;
    %spritemapEntry(0, $09, $FA, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $01, $FA, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $01, $02, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1F9, $02, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $04, $F5, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1FC, $F5, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $1FC, $FD, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1F4, $FD, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $06, $F8, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1FE, $F8, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $1FE, $00, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1F6, $00, 1, 0, 2, 6, $31)

ProjectileFlareSpritemaps_S_SI_SW_SIW_11:
    dw $0004                                                             ;93D4F2;
    %spritemapEntry(0, $06, $00, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FE, $00, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1FE, $F8, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F6, $F8, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_S_SI_SW_SIW_12:
    dw $000C                                                             ;93D508;
    %spritemapEntry(0, $06, $00, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FE, $00, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1FE, $F8, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F6, $F8, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $0C, $FA, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $04, $FA, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $04, $F2, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FC, $F2, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $00, $06, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F8, $06, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1F8, $FE, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F0, $FE, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_S_SI_SW_SIW_13:
    dw $000C                                                             ;93D546;
    %spritemapEntry(0, $06, $00, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FE, $00, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1FE, $F8, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F6, $F8, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $0F, $F7, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $07, $F7, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $07, $EF, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FF, $EF, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1FD, $09, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F5, $09, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1F5, $01, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1ED, $01, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_S_SI_SW_SIW_14:
    dw $000C                                                             ;93D584;
    %spritemapEntry(0, $06, $00, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FE, $00, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1FE, $F8, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F6, $F8, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $11, $F5, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $09, $F5, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $09, $ED, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $01, $ED, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1FB, $0B, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F3, $0B, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1F3, $03, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1EB, $03, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_S_SI_SW_SIW_15:
    dw $000C                                                             ;93D5C2;
    %spritemapEntry(0, $06, $00, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FE, $00, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1FE, $F8, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F6, $F8, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $12, $F4, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $0A, $F4, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $0A, $EC, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $02, $EC, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1FA, $0C, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F2, $0C, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1F2, $04, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1EA, $04, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_S_SI_SW_SIW_16:
    dw $000C                                                             ;93D600;
    %spritemapEntry(0, $09, $FE, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $01, $FE, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $01, $F6, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F9, $F6, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $04, $03, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FC, $03, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1FC, $FB, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F4, $FB, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $06, $00, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FE, $00, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1FE, $F8, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F6, $F8, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_S_SI_SW_SIW_17:
    dw $0002                                                             ;93D63E;
    %spritemapEntry(0, $1FC, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 1, 0, 2, 6, $33)

ProjectileFlareSpritemaps_S_SI_SW_SIW_18:
    dw $0006                                                             ;93D64A;
    %spritemapEntry(0, $00, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 1, 0, 2, 6, $33)

ProjectileFlareSpritemaps_S_SI_SW_SIW_19:
    dw $0006                                                             ;93D66A;
    %spritemapEntry(0, $04, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $04, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F4, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F4, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 1, 0, 2, 6, $33)

ProjectileFlareSpritemaps_S_SI_SW_SIW_1A:
    dw $0006                                                             ;93D68A;
    %spritemapEntry(0, $09, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $09, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1EF, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1EF, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 1, 0, 2, 6, $33)

ProjectileFlareSpritemaps_S_SI_SW_SIW_1B:
    dw $0006                                                             ;93D6AA;
    %spritemapEntry(0, $0B, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $0B, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1ED, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1ED, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 1, 0, 2, 6, $33)

ProjectileFlareSpritemaps_S_SI_SW_SIW_1C:
    dw $0006                                                             ;93D6CA;
    %spritemapEntry(0, $0C, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $0C, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1EC, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1EC, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 1, 0, 2, 6, $33)

ProjectileFlareSpritemaps_S_SI_SW_SIW_1D:
    dw $0002                                                             ;93D6EA;
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_S_SI_SW_SIW_1E:
    dw $0006                                                             ;93D6F6;
    %spritemapEntry(0, $00, $00, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_S_SI_SW_SIW_1F:
    dw $0006                                                             ;93D716;
    %spritemapEntry(0, $00, $F4, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $04, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $04, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_S_SI_SW_SIW_20:
    dw $0006                                                             ;93D736;
    %spritemapEntry(0, $00, $EF, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $09, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $09, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $EF, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_S_SI_SW_SIW_21:
    dw $0006                                                             ;93D756;
    %spritemapEntry(0, $00, $ED, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $0B, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $0B, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $ED, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_S_SI_SW_SIW_22:
    dw $0006                                                             ;93D776;
    %spritemapEntry(0, $00, $EC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $0C, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $0C, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $EC, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_S_SI_SW_SIW_23:
    dw $0002                                                             ;93D796;
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_S_SI_SW_SIW_24:
    dw $0006                                                             ;93D7A2;
    %spritemapEntry(0, $00, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_S_SI_SW_SIW_25:
    dw $0006                                                             ;93D7C2;
    %spritemapEntry(0, $04, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $04, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1F4, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1F4, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_S_SI_SW_SIW_26:
    dw $0006                                                             ;93D7E2;
    %spritemapEntry(0, $09, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $09, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1EF, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1EF, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_S_SI_SW_SIW_27:
    dw $0006                                                             ;93D802;
    %spritemapEntry(0, $0B, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0B, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1ED, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1ED, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_S_SI_SW_SIW_28:
    dw $0006                                                             ;93D822;
    %spritemapEntry(0, $0C, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0C, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1EC, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1EC, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_S_SI_SW_SIW_29:
    dw $0002                                                             ;93D842;
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 6, $30)

ProjectileFlareSpritemaps_S_SI_SW_SIW_2A:
    dw $0006                                                             ;93D84E;
    %spritemapEntry(0, $00, $00, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_S_SI_SW_SIW_2B:
    dw $0006                                                             ;93D86E;
    %spritemapEntry(0, $1F8, $F4, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $1F8, $04, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $00, $04, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $00, $F4, 0, 1, 2, 6, $30)

ProjectileFlareSpritemaps_S_SI_SW_SIW_2C:
    dw $0006                                                             ;93D88E;
    %spritemapEntry(0, $1F8, $EF, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $1F8, $09, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $00, $09, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $00, $EF, 0, 1, 2, 6, $30)

ProjectileFlareSpritemaps_S_SI_SW_SIW_2D:
    dw $0006                                                             ;93D8AE;
    %spritemapEntry(0, $1F8, $ED, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $1F8, $0B, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $00, $0B, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $00, $ED, 0, 1, 2, 6, $30)

ProjectileFlareSpritemaps_S_SI_SW_SIW_2E:
    dw $0006                                                             ;93D8CE;
    %spritemapEntry(0, $1F8, $EC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $1F8, $0C, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $00, $0C, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $00, $EC, 0, 1, 2, 6, $30)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_0:
    dw $0004                                                             ;93D8EE;
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1:
    dw $000C                                                             ;93D904;
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $08, $00, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $00, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F0, $00, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $08, $F8, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2:
    dw $000C                                                             ;93D942;
    %spritemapEntry(0, $08, $04, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $04, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $04, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F0, $04, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $08, $F4, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $F4, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F0, $F4, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3:
    dw $000C                                                             ;93D980;
    %spritemapEntry(0, $08, $09, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $09, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $09, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F0, $09, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $08, $EF, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $EF, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $EF, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F0, $EF, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4:
    dw $000C                                                             ;93D9BE;
    %spritemapEntry(0, $08, $0B, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $0B, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $0B, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F0, $0B, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $08, $ED, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $ED, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $ED, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F0, $ED, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5:
    dw $000C                                                             ;93D9FC;
    %spritemapEntry(0, $08, $0C, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $0C, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $0C, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F0, $0C, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $08, $EC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $EC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $EC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F0, $EC, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_6:
    dw $0004                                                             ;93DA3A;
    %spritemapEntry(0, $1FC, $F0, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $37)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_7:
    dw $000C                                                             ;93DA50;
    %spritemapEntry(0, $1FC, $F0, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $00, $08, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $00, $00, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $00, $F0, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1F8, $08, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $37)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_8:
    dw $000C                                                             ;93DA8E;
    %spritemapEntry(0, $08, $08, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $08, $00, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $08, $F8, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $08, $F0, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1F0, $08, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1F0, $00, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1F0, $F0, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 2, 6, $37)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_9:
    dw $000C                                                             ;93DACC;
    %spritemapEntry(0, $0D, $08, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $0D, $00, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $0D, $F8, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $0D, $F0, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1EB, $08, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1EB, $00, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1EB, $F8, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1EB, $F0, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 2, 6, $37)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_A:
    dw $000C                                                             ;93DB0A;
    %spritemapEntry(0, $0F, $08, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $0F, $00, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $0F, $F8, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $0F, $F0, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1E9, $08, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1E9, $00, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1E9, $F8, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1E9, $F0, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 2, 6, $37)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_B:
    dw $000C                                                             ;93DB48;
    %spritemapEntry(0, $10, $08, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $10, $00, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $10, $F8, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $10, $F0, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1E8, $08, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1E8, $00, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1E8, $F0, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 2, 6, $37)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_C:
    dw $0006                                                             ;93DB86;
    %spritemapEntry(0, $04, $08, 1, 1, 2, 6, $36)
    %spritemapEntry(0, $1F4, $F0, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $1FC, $F8, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $04, $00, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1F4, $F8, 0, 0, 2, 6, $35)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_D:
    dw $0012                                                             ;93DBA6;
    %spritemapEntry(0, $04, $08, 1, 1, 2, 6, $36)
    %spritemapEntry(0, $1F4, $F0, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $1FC, $F8, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $04, $00, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1F4, $F8, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $06, $05, 1, 1, 2, 6, $36)
    %spritemapEntry(0, $1F6, $ED, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $1FE, $F5, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $06, $FD, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1FE, $FD, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1F6, $F5, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $02, $0B, 1, 1, 2, 6, $36)
    %spritemapEntry(0, $1F2, $F3, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $1FA, $FB, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $02, $03, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1FA, $03, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1F2, $FB, 0, 0, 2, 6, $35)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_E:
    dw $0012                                                             ;93DC02;
    %spritemapEntry(0, $04, $08, 1, 1, 2, 6, $36)
    %spritemapEntry(0, $1F4, $F0, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $1FC, $F8, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $04, $00, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1F4, $F8, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1FE, $0F, 1, 1, 2, 6, $36)
    %spritemapEntry(0, $1EE, $F7, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $1F6, $FF, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1FE, $07, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1F6, $07, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1EE, $FF, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $0A, $01, 1, 1, 2, 6, $36)
    %spritemapEntry(0, $1FA, $E9, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $02, $F1, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $0A, $F9, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $02, $F9, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1FA, $F1, 0, 0, 2, 6, $35)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_F:
    dw $0012                                                             ;93DC5E;
    %spritemapEntry(0, $04, $08, 1, 1, 2, 6, $36)
    %spritemapEntry(0, $1F4, $F0, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $1FC, $F8, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $04, $00, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1F4, $F8, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1FB, $12, 1, 1, 2, 6, $36)
    %spritemapEntry(0, $1EB, $FA, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $1F3, $02, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1FB, $0A, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1F3, $0A, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1EB, $02, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $0D, $FE, 1, 1, 2, 6, $36)
    %spritemapEntry(0, $1FD, $E6, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $05, $EE, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $0D, $F6, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $05, $F6, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1FD, $EE, 0, 0, 2, 6, $35)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_10:
    dw $0012                                                             ;93DCBA;
    %spritemapEntry(0, $04, $08, 1, 1, 2, 6, $36)
    %spritemapEntry(0, $1F4, $F0, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $1FC, $F8, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $04, $00, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1F4, $F8, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1F7, $17, 1, 1, 2, 6, $36)
    %spritemapEntry(0, $1E7, $FF, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $1EF, $07, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1F7, $0F, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1EF, $0F, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1E7, $07, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $11, $F9, 1, 1, 2, 6, $36)
    %spritemapEntry(0, $01, $E1, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $09, $E9, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $11, $F1, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $09, $F1, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $01, $E9, 0, 0, 2, 6, $35)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_11:
    dw $0012                                                             ;93DD16;
    %spritemapEntry(0, $04, $08, 1, 1, 2, 6, $36)
    %spritemapEntry(0, $1F4, $F0, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $1FC, $F8, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $04, $00, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1F4, $F8, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1F6, $17, 1, 1, 2, 6, $36)
    %spritemapEntry(0, $1E6, $FF, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $1EE, $07, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1F6, $0F, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1EE, $0F, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1E6, $07, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $12, $F9, 1, 1, 2, 6, $36)
    %spritemapEntry(0, $02, $E1, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $0A, $E9, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $12, $F1, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $0A, $F1, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $02, $E9, 0, 0, 2, 6, $35)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_12:
    dw $0006                                                             ;93DD72;
    %spritemapEntry(0, $1F4, $08, 1, 0, 2, 6, $36)
    %spritemapEntry(0, $04, $F0, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $1FC, $F8, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1F4, $00, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1FC, $00, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $04, $F8, 0, 1, 2, 6, $35)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_13:
    dw $0012                                                             ;93DD92;
    %spritemapEntry(0, $1F4, $08, 1, 0, 2, 6, $36)
    %spritemapEntry(0, $04, $F0, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $1FC, $F8, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1F4, $00, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1FC, $00, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $04, $F8, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $1F2, $06, 1, 0, 2, 6, $36)
    %spritemapEntry(0, $02, $EE, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $1FA, $F6, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1F2, $FE, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1FA, $FE, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $02, $F6, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $1F6, $0B, 1, 0, 2, 6, $36)
    %spritemapEntry(0, $06, $F3, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $1FE, $FB, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1F6, $03, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1FE, $03, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $06, $FB, 0, 1, 2, 6, $35)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_14:
    dw $0012                                                             ;93DDEE;
    %spritemapEntry(0, $1F4, $08, 1, 0, 2, 6, $36)
    %spritemapEntry(0, $04, $F0, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $1FC, $F8, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1F4, $00, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1FC, $00, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $04, $F8, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $1FA, $0F, 1, 0, 2, 6, $36)
    %spritemapEntry(0, $0A, $F7, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $02, $FF, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1FA, $07, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $02, $07, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $0A, $FF, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $1EE, $01, 1, 0, 2, 6, $36)
    %spritemapEntry(0, $1FE, $E9, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $1F6, $F1, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1EE, $F9, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1F6, $F9, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $1FE, $F1, 0, 1, 2, 6, $35)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_15:
    dw $0012                                                             ;93DE4A;
    %spritemapEntry(0, $1F4, $08, 1, 0, 2, 6, $36)
    %spritemapEntry(0, $04, $F0, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $1FC, $F8, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1F4, $00, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1FC, $00, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $04, $F8, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $1FD, $12, 1, 0, 2, 6, $36)
    %spritemapEntry(0, $0D, $FA, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $05, $02, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1FD, $0A, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $05, $0A, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $0D, $02, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $1EB, $FE, 1, 0, 2, 6, $36)
    %spritemapEntry(0, $1FB, $E6, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $1F3, $EE, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1EB, $F6, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1F3, $F6, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $1FB, $EE, 0, 1, 2, 6, $35)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_16:
    dw $0012                                                             ;93DEA6;
    %spritemapEntry(0, $1F4, $08, 1, 0, 2, 6, $36)
    %spritemapEntry(0, $04, $F0, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $1FC, $F8, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1F4, $00, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1FC, $00, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $04, $F8, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $01, $16, 1, 0, 2, 6, $36)
    %spritemapEntry(0, $11, $FE, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $09, $06, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $01, $0E, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $09, $0E, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $11, $06, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $1E7, $FA, 1, 0, 2, 6, $36)
    %spritemapEntry(0, $1F7, $E2, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $1EF, $EA, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1E7, $F2, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1EF, $F2, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $1F7, $EA, 0, 1, 2, 6, $35)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_17:
    dw $0012                                                             ;93DF02;
    %spritemapEntry(0, $1F4, $08, 1, 0, 2, 6, $36)
    %spritemapEntry(0, $04, $F0, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $1FC, $F8, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1F4, $00, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1FC, $00, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $04, $F8, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $02, $17, 1, 0, 2, 6, $36)
    %spritemapEntry(0, $12, $FF, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $0A, $07, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $02, $0F, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $0A, $0F, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $12, $07, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $1E6, $F9, 1, 0, 2, 6, $36)
    %spritemapEntry(0, $1F6, $E1, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $1EE, $E9, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1E6, $F1, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1EE, $F1, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $1F6, $E9, 0, 1, 2, 6, $35)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_18:
    dw $0006                                                             ;93DF5E;
    %spritemapEntry(0, $1FE, $F4, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $06, $F4, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1EE, $04, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F6, $04, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F6, $FC, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1FE, $FC, 0, 1, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_19:
    dw $0012                                                             ;93DF7E;
    %spritemapEntry(0, $1F8, $EE, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $00, $EE, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1FE, $F4, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $06, $F4, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $04, $FA, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $0C, $FA, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1EE, $04, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F6, $04, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F6, $FC, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1FE, $FC, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1E8, $FE, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F0, $FE, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F0, $F6, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F8, $F6, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F4, $0A, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1FC, $0A, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1FC, $02, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $04, $02, 0, 1, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1A:
    dw $0012                                                             ;93DFDA;
    %spritemapEntry(0, $07, $FD, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $0F, $FD, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1FE, $F4, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $06, $F4, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F5, $EB, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1FD, $EB, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1EE, $04, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F6, $04, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F6, $FC, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1FE, $FC, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1E5, $FB, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1ED, $FB, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1ED, $F3, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F5, $F3, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F7, $0D, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1FF, $0D, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1FF, $05, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $07, $05, 0, 1, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1B:
    dw $0012                                                             ;93E036;
    %spritemapEntry(0, $09, $FF, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $11, $FF, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F3, $E9, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1FB, $E9, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1FE, $F4, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $06, $F4, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1EE, $04, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F6, $04, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F6, $FC, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1FE, $FC, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1E3, $F9, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1EB, $F9, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1EB, $F1, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F3, $F1, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F9, $0F, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $01, $0F, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $01, $07, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $09, $07, 0, 1, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1C:
    dw $0012                                                             ;93E092;
    %spritemapEntry(0, $1F2, $E8, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1FA, $E8, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $0A, $00, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $12, $00, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1FE, $F4, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $06, $F4, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1EE, $04, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F6, $04, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F6, $FC, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1FE, $FC, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1E2, $F8, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1EA, $F8, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1EA, $F0, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F2, $F0, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1FA, $10, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $02, $10, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $02, $08, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $0A, $08, 0, 1, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1D:
    dw $0012                                                             ;93E0EE;
    %spritemapEntry(0, $00, $F7, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $08, $F7, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1FE, $F4, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $06, $F4, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1FB, $F2, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $03, $F2, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1EB, $02, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F3, $02, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F3, $FA, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1FB, $FA, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F0, $07, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F8, $07, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F8, $FF, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $00, $FF, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1EE, $04, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F6, $04, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F6, $FC, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1FE, $FC, 0, 1, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1E:
    dw $0006                                                             ;93E14A;
    %spritemapEntry(0, $1FE, $04, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $06, $04, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1EE, $F4, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1F6, $F4, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1F6, $FC, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1FE, $FC, 1, 1, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1F:
    dw $0012                                                             ;93E16A;
    %spritemapEntry(0, $04, $FE, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $0C, $FE, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1FE, $04, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $06, $04, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1F8, $0A, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $00, $0A, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1EE, $F4, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1F6, $F4, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1F6, $FC, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1FE, $FC, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1E8, $FA, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1F0, $FA, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1F0, $02, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1F8, $02, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1F4, $EE, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1FC, $EE, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1FC, $F6, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $04, $F6, 1, 1, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_20:
    dw $0012                                                             ;93E1C6;
    %spritemapEntry(0, $1F5, $0D, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1FD, $0D, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $07, $FB, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $0F, $FB, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1FE, $04, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $06, $04, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1EE, $F4, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1F6, $F4, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1F6, $FC, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1FE, $FC, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1E5, $FD, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1ED, $FD, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1ED, $05, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1F5, $05, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1F7, $EB, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1FF, $EB, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1FF, $F3, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $07, $F3, 1, 1, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_21:
    dw $0012                                                             ;93E222;
    %spritemapEntry(0, $1F3, $0F, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1FB, $0F, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $09, $F9, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $11, $F9, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1FE, $04, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $06, $04, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1EE, $F4, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1F6, $F4, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1F6, $FC, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1FE, $FC, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1E3, $FF, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1EB, $FF, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1EB, $07, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1F3, $07, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1F9, $E9, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $01, $E9, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $01, $F1, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $09, $F1, 1, 1, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_22:
    dw $0012                                                             ;93E27E;
    %spritemapEntry(0, $1F2, $10, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1FA, $10, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1FE, $04, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $06, $04, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $0A, $F8, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $12, $F8, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1EE, $F4, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1F6, $F4, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1F6, $FC, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1FE, $FC, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1E2, $00, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1EA, $00, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1EA, $08, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1F2, $08, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1FA, $E8, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $02, $E8, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $02, $F0, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $0A, $F0, 1, 1, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_23:
    dw $0012                                                             ;93E2DA;
    %spritemapEntry(0, $1FE, $04, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $06, $04, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $00, $01, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $08, $01, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1FB, $06, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $03, $06, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1EB, $F6, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1F3, $F6, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1F3, $FE, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1FB, $FE, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1F0, $F1, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1F8, $F1, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1F8, $F9, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $00, $F9, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1EE, $F4, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1F6, $F4, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1F6, $FC, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1FE, $FC, 1, 1, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_24:
    dw $0006                                                             ;93E336;
    %spritemapEntry(0, $1FA, $04, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1F2, $04, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $0A, $F4, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $02, $F4, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $02, $FC, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1FA, $FC, 1, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_25:
    dw $0012                                                             ;93E356;
    %spritemapEntry(0, $1F4, $FE, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1EC, $FE, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $1FA, $04, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1F2, $04, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $00, $0A, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1F8, $0A, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $0A, $F4, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $02, $F4, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $02, $FC, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1FA, $FC, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $10, $FA, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $08, $FA, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $08, $02, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $00, $02, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $04, $EE, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1FC, $EE, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $1FC, $F6, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1F4, $F6, 1, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_26:
    dw $0012                                                             ;93E3B2;
    %spritemapEntry(0, $03, $0D, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1FB, $0D, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $1FA, $04, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1F2, $04, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $1F1, $FB, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1E9, $FB, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $0A, $F4, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $02, $F4, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $02, $FC, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1FA, $FC, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $13, $FD, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $0B, $FD, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $0B, $05, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $03, $05, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $01, $EB, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1F9, $EB, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $1F9, $F3, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1F1, $F3, 1, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_27:
    dw $0012                                                             ;93E40E;
    %spritemapEntry(0, $05, $0F, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1FD, $0F, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $1FA, $04, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1F2, $04, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $1EF, $F9, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1E7, $F9, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $0A, $F4, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $02, $F4, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $02, $FC, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1FA, $FC, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $15, $FF, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $0D, $FF, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $0D, $07, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $05, $07, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $1FF, $E9, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1F7, $E9, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $1F7, $F1, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1EF, $F1, 1, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_28:
    dw $0012                                                             ;93E46A;
    %spritemapEntry(0, $1EE, $F8, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1E6, $F8, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $06, $10, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1FE, $10, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $1FA, $04, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1F2, $04, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $0A, $F4, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $02, $F4, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $02, $FC, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1FA, $FC, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $16, $00, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $0E, $00, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $0E, $08, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $06, $08, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $1FE, $E8, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1F6, $E8, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $1F6, $F0, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1EE, $F0, 1, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_29:
    dw $0012                                                             ;93E4C6;
    %spritemapEntry(0, $1F8, $01, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1F0, $01, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $1FA, $04, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1F2, $04, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $1FD, $06, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1F5, $06, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $0D, $F6, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $05, $F6, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $05, $FE, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1FD, $FE, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $08, $F1, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $00, $F1, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $00, $F9, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1F8, $F9, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $0A, $F4, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $02, $F4, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $02, $FC, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1FA, $FC, 1, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2A:
    dw $0006                                                             ;93E522;
    %spritemapEntry(0, $0A, $04, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $02, $04, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FA, $FC, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1FA, $F4, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F2, $F4, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2B:
    dw $0012                                                             ;93E542;
    %spritemapEntry(0, $04, $0A, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FC, $0A, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $0A, $04, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $02, $04, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $10, $FE, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $08, $FE, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FA, $FC, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1FA, $F4, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F2, $F4, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $08, $F6, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $00, $F6, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $00, $EE, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F8, $EE, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1FC, $02, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F4, $02, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1F4, $FA, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1EC, $FA, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2C:
    dw $0012                                                             ;93E59E;
    %spritemapEntry(0, $01, $0D, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F9, $0D, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $0A, $04, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $02, $04, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $13, $FB, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $0B, $FB, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FA, $FC, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1FA, $F4, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F2, $F4, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $0B, $F3, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $03, $F3, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $03, $EB, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FB, $EB, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1F9, $05, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F1, $05, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1F1, $FD, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1E9, $FD, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2D:
    dw $0012                                                             ;93E5FA;
    %spritemapEntry(0, $1FF, $0F, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F7, $0F, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $0A, $04, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $02, $04, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $15, $F9, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $0D, $F9, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FA, $FC, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1FA, $F4, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F2, $F4, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $0D, $F1, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $05, $F1, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $05, $E9, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FD, $E9, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1F7, $07, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1EF, $07, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1EF, $FF, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1E7, $FF, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2E:
    dw $0012                                                             ;93E656;
    %spritemapEntry(0, $16, $F8, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $0E, $F8, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1FE, $10, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F6, $10, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $0A, $04, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $02, $04, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FA, $FC, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1FA, $F4, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F2, $F4, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $0E, $F0, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $06, $F0, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $06, $E8, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FE, $E8, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1F6, $08, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1EE, $08, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1EE, $00, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1E6, $00, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2F:
    dw $0012                                                             ;93E6B2;
    %spritemapEntry(0, $0D, $02, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $05, $02, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $0A, $04, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $02, $04, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $08, $07, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $00, $07, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $05, $FA, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FD, $FA, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1FD, $F2, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F5, $F2, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $00, $FF, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F8, $FF, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1F8, $F7, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F0, $F7, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FA, $FC, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1FA, $F4, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F2, $F4, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_30:
    dw $0004                                                             ;93E70E;
    %spritemapEntry(0, $1FC, $F0, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $08, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 1, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_31:
    dw $000C                                                             ;93E724;
    %spritemapEntry(0, $1FC, $F0, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $F0, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F0, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F8, $08, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $08, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $08, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 1, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_32:
    dw $000C                                                             ;93E762;
    %spritemapEntry(0, $1F4, $08, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F4, $F0, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F4, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F4, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $04, $F0, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $04, $08, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $04, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $04, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $08, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F0, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 1, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_33:
    dw $000C                                                             ;93E7A0;
    %spritemapEntry(0, $09, $F0, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $09, $08, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $08, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1EF, $08, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1EF, $F0, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F0, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $09, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $09, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1EF, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1EF, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 1, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_34:
    dw $000C                                                             ;93E7DE;
    %spritemapEntry(0, $0B, $F0, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1ED, $F0, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F0, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $0B, $08, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1ED, $08, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $08, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $0B, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $0B, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1ED, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1ED, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 1, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_35:
    dw $000C                                                             ;93E81C;
    %spritemapEntry(0, $0C, $08, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1EC, $08, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $08, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $0C, $F0, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1EC, $F0, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F0, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $0C, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $0C, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1EC, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1EC, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 1, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_36:
    dw $0004                                                             ;93E85A;
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_37:
    dw $000C                                                             ;93E870;
    %spritemapEntry(0, $1F0, $00, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $08, $00, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $08, $F8, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $00, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_38:
    dw $000C                                                             ;93E8AE;
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F0, $04, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F0, $F4, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $08, $04, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $08, $F4, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $F4, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $04, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $04, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_39:
    dw $000C                                                             ;93E8EC;
    %spritemapEntry(0, $1F0, $EF, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F0, $09, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $08, $EF, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $08, $09, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $EF, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $09, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $09, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $EF, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3A:
    dw $000C                                                             ;93E92A;
    %spritemapEntry(0, $08, $0B, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F0, $0B, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $08, $ED, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F0, $ED, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $ED, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $0B, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $0B, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $ED, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3B:
    dw $000C                                                             ;93E968;
    %spritemapEntry(0, $1F0, $EC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F0, $0C, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $08, $EC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $08, $0C, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $EC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $0C, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $0C, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $EC, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3C:
    dw $0004                                                             ;93E9A6;
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3D:
    dw $000C                                                             ;93E9BC;
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $08, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1F8, $08, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $F0, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3E:
    dw $000C                                                             ;93E9FA;
    %spritemapEntry(0, $04, $08, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1F4, $08, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $04, $F0, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1F4, $F0, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $04, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $04, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1F4, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1F4, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3F:
    dw $000C                                                             ;93EA38;
    %spritemapEntry(0, $09, $08, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1EF, $08, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $09, $F0, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1EF, $F0, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $09, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $09, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1EF, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1EF, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_40:
    dw $000C                                                             ;93EA76;
    %spritemapEntry(0, $0B, $08, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1ED, $08, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0B, $F0, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1ED, $F0, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0B, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0B, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1ED, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1ED, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_41:
    dw $000C                                                             ;93EAB4;
    %spritemapEntry(0, $1EC, $08, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0C, $08, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0C, $F0, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1EC, $F0, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0C, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0C, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1EC, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1EC, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_42:
    dw $0004                                                             ;93EAF2;
    %spritemapEntry(0, $1F0, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $08, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 6, $30)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_43:
    dw $000C                                                             ;93EB08;
    %spritemapEntry(0, $1F0, $00, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $08, $00, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $08, $F8, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $00, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_44:
    dw $000C                                                             ;93EB46;
    %spritemapEntry(0, $1F0, $04, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $1F0, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $1F0, $F4, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $08, $04, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $08, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $08, $F4, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $1F8, $F4, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $1F8, $04, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $00, $04, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $00, $F4, 0, 1, 2, 6, $30)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_45:
    dw $000C                                                             ;93EB84;
    %spritemapEntry(0, $1F0, $09, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $1F0, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $1F0, $EF, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $08, $09, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $08, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $08, $EF, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $1F8, $EF, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $1F8, $09, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $00, $09, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $00, $EF, 0, 1, 2, 6, $30)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_46:
    dw $000C                                                             ;93EBC2;
    %spritemapEntry(0, $1F0, $0B, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $1F0, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $1F0, $ED, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $08, $0B, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $08, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $08, $ED, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $1F8, $ED, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $1F8, $0B, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $00, $0B, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $00, $ED, 0, 1, 2, 6, $30)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_47:
    dw $000C                                                             ;93EC00;
    %spritemapEntry(0, $1F0, $0C, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $1F0, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $1F0, $EC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $08, $0C, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $08, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $08, $EC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $1F8, $EC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $1F8, $0C, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $00, $0C, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $00, $EC, 0, 1, 2, 6, $30)

ProjectileFlareSpritemaps_Charged_Power_0:
    dw $0004                                                             ;93EC3E;
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_Power_1:
    dw $0004                                                             ;93EC54;
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_Power_2:
    dw $0004                                                             ;93EC6A;
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_Power_3:
    dw $0004                                                             ;93EC80;
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_Power_4:
    dw $0004                                                             ;93EC96;
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_Power_5:
    dw $0004                                                             ;93ECAC;
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_Power_6:
    dw $0004                                                             ;93ECC2;
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_Power_7:
    dw $0004                                                             ;93ECD8;
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_Power_8:
    dw $0004                                                             ;93ECEE;
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_Charged_Power_9:
    dw $0004                                                             ;93ED04;
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_Charged_Power_A:
    dw $0004                                                             ;93ED1A;
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_Charged_Power_B:
    dw $0004                                                             ;93ED30;
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_Charged_Power_C:
    dw $0004                                                             ;93ED46;
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_Charged_Power_D:
    dw $0004                                                             ;93ED5C;
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_Charged_Power_E:
    dw $0004                                                             ;93ED72;
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_Charged_Power_F:
    dw $0004                                                             ;93ED88;
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_Charged_Ice_0:
    dw $0004                                                             ;93ED9E;
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_Ice_1:
    dw $0004                                                             ;93EDB4;
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_Charged_Ice_2:
    dw $0004                                                             ;93EDCA;
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_Ice_3:
    dw $0004                                                             ;93EDE0;
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_Ice_0:
    dw $0001                                                             ;93EDF6;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Ice_1:
    dw $0001                                                             ;93EDFD;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Ice_2:
    dw $0001                                                             ;93EE04;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $32)

ProjectileFlareSpritemaps_Ice_3:
    dw $0001                                                             ;93EE0B;
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_48:
    dw $0001                                                             ;93EE12;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_49:
    dw $0002                                                             ;93EE19;
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EE25:
    dw $0003                                                             ;93EE25;
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EE36:
    dw $0004                                                             ;93EE36;
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4A:
    dw $0002                                                             ;93EE4C;
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FA, $FC, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4B:
    dw $0004                                                             ;93EE58;
    %spritemapEntry(0, $06, $00, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FE, $00, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1FE, $F8, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F6, $F8, 0, 0, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EE6E:
    dw $0006                                                             ;93EE6E;
    %spritemapEntry(0, $0A, $04, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $02, $04, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FA, $FC, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1FA, $F4, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F2, $F4, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4C:
    dw $0001                                                             ;93EE8E;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4D:
    dw $0002                                                             ;93EE95;
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $33)

UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EEA1:
    dw $0003                                                             ;93EEA1;
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $33)

UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EEB2:
    dw $0004                                                             ;93EEB2;
    %spritemapEntry(0, $1FC, $F0, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4E:
    dw $0002                                                             ;93EEC8;
    %spritemapEntry(0, $1F6, $FC, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1FE, $FC, 0, 1, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4F:
    dw $0004                                                             ;93EED4;
    %spritemapEntry(0, $1F2, $00, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1FA, $00, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1FA, $F8, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $02, $F8, 0, 1, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_50:
    dw $0006                                                             ;93EEEA;
    %spritemapEntry(0, $1EE, $04, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F6, $04, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F6, $FC, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1FE, $FC, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1FE, $F4, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $06, $F4, 0, 1, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_51:
    dw $0001                                                             ;93EF0A;
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 6, $30)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_52:
    dw $0002                                                             ;93EF11;
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EF1D:
    dw $0003                                                             ;93EF1D;
    %spritemapEntry(0, $04, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $1F4, $FC, 0, 1, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EF2E:
    dw $0004                                                             ;93EF2E;
    %spritemapEntry(0, $1F0, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $08, $FC, 0, 1, 2, 6, $30)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_53:
    dw $0002                                                             ;93EF44;
    %spritemapEntry(0, $1F6, $FC, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1FE, $FC, 1, 1, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_54:
    dw $0004                                                             ;93EF50;
    %spritemapEntry(0, $1F2, $F8, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1FA, $F8, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1FA, $00, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $02, $00, 1, 1, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EF66:
    dw $0006                                                             ;93EF66;
    %spritemapEntry(0, $1EE, $F4, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1F6, $F4, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1F6, $FC, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1FE, $FC, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1FE, $04, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $06, $04, 1, 1, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_55:
    dw $0001                                                             ;93EF86;
    %spritemapEntry(0, $1FC, $FC, 1, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_56:
    dw $0002                                                             ;93EF8D;
    %spritemapEntry(0, $1FC, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 1, 0, 2, 6, $33)

UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EF99:
    dw $0003                                                             ;93EF99;
    %spritemapEntry(0, $1FC, $04, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F4, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $FC, 1, 0, 2, 6, $33)

UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EFAA:
    dw $0004                                                             ;93EFAA;
    %spritemapEntry(0, $1FC, $08, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F0, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 1, 0, 2, 6, $33)

UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EFC0:
    dw $0002                                                             ;93EFC0;
    %spritemapEntry(0, $1F6, $FC, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1FE, $FC, 1, 1, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EFCC:
    dw $0004                                                             ;93EFCC;
    %spritemapEntry(0, $1F2, $F8, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1FA, $F8, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1FA, $00, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $02, $00, 1, 1, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EFE2:
    dw $0006                                                             ;93EFE2;
    %spritemapEntry(0, $1EE, $F4, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1F6, $F4, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1F6, $FC, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1FE, $FC, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1FE, $04, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $06, $04, 1, 1, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_57:
    dw $0001                                                             ;93F002;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_58:
    dw $0002                                                             ;93F009;
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $34)

UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93F015:
    dw $0003                                                             ;93F015;
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 6, $34)

UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93F026:
    dw $0004                                                             ;93F026;
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_59:
    dw $0002                                                             ;93F03C;
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $1FC, $00, 1, 1, 2, 6, $36)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5A:
    dw $0004                                                             ;93F048;
    %spritemapEntry(0, $00, $FC, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $00, $04, 1, 1, 2, 6, $36)
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $35)

UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93F05E:
    dw $0006                                                             ;93F05E;
    %spritemapEntry(0, $04, $08, 1, 1, 2, 6, $36)
    %spritemapEntry(0, $1F4, $F0, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $04, $00, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1FC, $F8, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1F4, $F8, 0, 0, 2, 6, $35)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5B:
    dw $0001                                                             ;93F07E;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $37)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5C:
    dw $0002                                                             ;93F085;
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $37)

UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93F091:
    dw $0003                                                             ;93F091;
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 6, $37)

UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93F0A2:
    dw $0004                                                             ;93F0A2;
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 2, 6, $37)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5D:
    dw $0002                                                             ;93F0B8;
    %spritemapEntry(0, $1FC, $F8, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $1FC, $00, 1, 0, 2, 6, $36)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5E:
    dw $0004                                                             ;93F0C4;
    %spritemapEntry(0, $1F8, $FC, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1F8, $04, 1, 0, 2, 6, $36)
    %spritemapEntry(0, $00, $F4, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 6, $35)

UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93F0DA:
    dw $0006                                                             ;93F0DA;
    %spritemapEntry(0, $1F4, $08, 1, 0, 2, 6, $36)
    %spritemapEntry(0, $04, $F0, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $1F4, $00, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1FC, $00, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $1FC, $F8, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $04, $F8, 0, 1, 2, 6, $35)

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_0:
    dw $0001                                                             ;93F0FA;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F101:
    dw $0002                                                             ;93F101;
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1:
    dw $0003                                                             ;93F10D;
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F11E:
    dw $0004                                                             ;93F11E;
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F134:
    dw $0005                                                             ;93F134;
    %spritemapEntry(0, $0C, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1EC, $FC, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_2:
    dw $0006                                                             ;93F14F;
    %spritemapEntry(0, $10, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1E8, $FC, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_3:
    dw $0007                                                             ;93F16F;
    %spritemapEntry(0, $14, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $0C, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1EC, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1E4, $FC, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_4:
    dw $0001                                                             ;93F194;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $33)

UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F19B:
    dw $0002                                                             ;93F19B;
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_5:
    dw $0003                                                             ;93F1A7;
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 6, $33)

UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F1B8:
    dw $0004                                                             ;93F1B8;
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 2, 6, $33)

UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F1CE:
    dw $0005                                                             ;93F1CE;
    %spritemapEntry(0, $1FC, $0C, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $EC, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_6:
    dw $0006                                                             ;93F1E9;
    %spritemapEntry(0, $1FC, $10, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $E8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_7:
    dw $0007                                                             ;93F209;
    %spritemapEntry(0, $1FC, $14, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $0C, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $EC, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $E4, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_8:
    dw $0002                                                             ;93F22E;
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_9:
    dw $0004                                                             ;93F23A;
    %spritemapEntry(0, $04, $00, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F4, $F8, 0, 0, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F250:
    dw $0006                                                             ;93F250;
    %spritemapEntry(0, $08, $04, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $00, $04, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F0, $F4, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_A:
    dw $0008                                                             ;93F270;
    %spritemapEntry(0, $0C, $08, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $04, $08, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $04, $00, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F4, $F8, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1F4, $F0, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1EC, $F0, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_B:
    dw $000A                                                             ;93F29A;
    %spritemapEntry(0, $10, $0C, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $08, $0C, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $08, $04, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $00, $04, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F0, $F4, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1F0, $EC, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1E8, $EC, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_C:
    dw $0002                                                             ;93F2CE;
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_D:
    dw $0004                                                             ;93F2DA;
    %spritemapEntry(0, $1F4, $00, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1FC, $00, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1FC, $F8, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $04, $F8, 0, 1, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F2F0:
    dw $0006                                                             ;93F2F0;
    %spritemapEntry(0, $1F0, $04, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F8, $04, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $00, $F4, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $08, $F4, 0, 1, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_E:
    dw $0008                                                             ;93F310;
    %spritemapEntry(0, $1EC, $08, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F4, $08, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F4, $00, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1FC, $00, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1FC, $F8, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $04, $F8, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $04, $F0, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $0C, $F0, 0, 1, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_F:
    dw $000A                                                             ;93F33A;
    %spritemapEntry(0, $1E8, $0C, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F0, $0C, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F0, $04, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F8, $04, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $00, $F4, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $08, $F4, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $08, $EC, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $10, $EC, 0, 1, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_10:
    dw $0001                                                             ;93F36E;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $34)

UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F375:
    dw $0002                                                             ;93F375;
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_11:
    dw $0003                                                             ;93F381;
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 6, $34)

UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F392:
    dw $0004                                                             ;93F392;
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 6, $34)

UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F3A8:
    dw $0005                                                             ;93F3A8;
    %spritemapEntry(0, $0C, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1EC, $FC, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_12:
    dw $0006                                                             ;93F3C3;
    %spritemapEntry(0, $10, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1E8, $FC, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_13:
    dw $0007                                                             ;93F3E3;
    %spritemapEntry(0, $14, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $0C, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1EC, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1E4, $FC, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_14:
    dw $0001                                                             ;93F408;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $37)

UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F40F:
    dw $0002                                                             ;93F40F;
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $37)

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_15:
    dw $0003                                                             ;93F41B;
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 6, $37)

UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F42C:
    dw $0004                                                             ;93F42C;
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 2, 6, $37)

UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F442:
    dw $0005                                                             ;93F442;
    %spritemapEntry(0, $1FC, $0C, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $EC, 0, 0, 2, 6, $37)

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_16:
    dw $0006                                                             ;93F45D;
    %spritemapEntry(0, $1FC, $10, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $E8, 0, 0, 2, 6, $37)

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_17:
    dw $0007                                                             ;93F47D;
    %spritemapEntry(0, $1FC, $14, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $0C, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $EC, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $E4, 0, 0, 2, 6, $37)

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_18:
    dw $0002                                                             ;93F4A2;
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $1FC, $00, 1, 1, 2, 6, $36)

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_19:
    dw $0004                                                             ;93F4AE;
    %spritemapEntry(0, $00, $04, 1, 1, 2, 6, $36)
    %spritemapEntry(0, $00, $FC, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $35)

UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F4C4:
    dw $0006                                                             ;93F4C4;
    %spritemapEntry(0, $1FC, $F8, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $04, $00, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $04, $08, 1, 1, 2, 6, $36)
    %spritemapEntry(0, $1F4, $F0, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1F4, $F8, 0, 0, 2, 6, $35)

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1A:
    dw $0008                                                             ;93F4E4;
    %spritemapEntry(0, $08, $04, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1F8, $F4, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $00, $FC, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $08, $0C, 1, 1, 2, 6, $36)
    %spritemapEntry(0, $1F0, $EC, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $00, $04, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1F0, $F4, 0, 0, 2, 6, $35)

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1B:
    dw $000A                                                             ;93F50E;
    %spritemapEntry(0, $0C, $10, 1, 1, 2, 6, $36)
    %spritemapEntry(0, $1EC, $E8, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $0C, $08, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $04, $00, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1FC, $F8, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1F4, $F0, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $04, $08, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1F4, $F8, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1EC, $F0, 0, 0, 2, 6, $35)

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1C:
    dw $0002                                                             ;93F542;
    %spritemapEntry(0, $1FC, $F8, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $1FC, $00, 1, 0, 2, 6, $36)

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1D:
    dw $0004                                                             ;93F54E;
    %spritemapEntry(0, $1F8, $04, 1, 0, 2, 6, $36)
    %spritemapEntry(0, $1F8, $FC, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $00, $F4, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 6, $35)

UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F564:
    dw $0006                                                             ;93F564;
    %spritemapEntry(0, $1FC, $F8, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1F4, $00, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1F4, $08, 1, 0, 2, 6, $36)
    %spritemapEntry(0, $04, $F0, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $1FC, $00, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $04, $F8, 0, 1, 2, 6, $35)

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1E:
    dw $0008                                                             ;93F584;
    %spritemapEntry(0, $1F0, $04, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $00, $F4, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1F8, $FC, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1F0, $0C, 1, 0, 2, 6, $36)
    %spritemapEntry(0, $08, $EC, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $1F8, $04, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $08, $F4, 0, 1, 2, 6, $35)

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1F:
    dw $000A                                                             ;93F5AE;
    %spritemapEntry(0, $1EC, $10, 1, 0, 2, 6, $36)
    %spritemapEntry(0, $0C, $E8, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $1EC, $08, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1F4, $00, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1FC, $F8, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $04, $F0, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1F4, $08, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $1FC, $00, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $04, $F8, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $0C, $F0, 0, 1, 2, 6, $35)

UNUSED_DrawShinesparkWindupEffectSprite_93F5E2:
    PHP                                                                  ;93F5E2;
    PHB                                                                  ;93F5E3;
    PHK                                                                  ;93F5E4;
    PLB                                                                  ;93F5E5;
    REP #$30                                                             ;93F5E6;
    LDA.W $0A1C                                                          ;93F5E8;
    CMP.W #$00C7                                                         ;93F5EB;
    BEQ .verticalShinesparkWindup                                        ;93F5EE;
    CMP.W #$00C8                                                         ;93F5F0;
    BNE .return                                                          ;93F5F3;

.verticalShinesparkWindup:
    LDA.W $05B6                                                          ;93F5F5;
    BIT.W #$0001                                                         ;93F5F8;
    BNE .return                                                          ;93F5FB;
    LDA.W $0AF6                                                          ;93F5FD;
    SEC                                                                  ;93F600;
    SBC.W $0911                                                          ;93F601;
    STA.B $14                                                            ;93F604;
    LDA.W $0AFA                                                          ;93F606;
    SEC                                                                  ;93F609;
    SBC.W $0915                                                          ;93F60A;
    STA.B $12                                                            ;93F60D;
    LDA.W #$003C                                                         ;93F60F;
    CLC                                                                  ;93F612;
    ADC.W #$0002                                                         ;93F613;
    JSL.L AddSpritemapFrom_93A1A1_TableToOAM                             ;93F616;

.return:
    PLB                                                                  ;93F61A;
    PLP                                                                  ;93F61B;
    RTL                                                                  ;93F61C;


Freespace_Bank93_F61D:                                                   ;93F61D;
; $9E3 bytes
