
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


if !FEATURE_KEEP_UNREFERENCED
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
endif ; !FEATURE_KEEP_UNREFERENCED


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


if !FEATURE_KEEP_UNREFERENCED
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
endif ; !FEATURE_KEEP_UNREFERENCED


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
; Uncharged beams. Indexed by beam type
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
; Charged beams. Indexed by beam type. Used by ice SBA
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
; Non-beam projectiles. Indexed by projectile type. Used for (super) missile, (power) bomb
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
; Shinespark echo and spazer SBA trail projectile. Indexed by projectile type - 22h
    dw $0000                                                             ;938403;
    dw $0000                                                             ;938405;
    dw ProjectileDataTable_NonBeam_SpazerSBATrail                        ;938407;
    dw UNUSED_ProjectileDataTable_NonBeam_Projectile25_938695            ;938409;
    dw ProjectileDataTable_NonBeam_SpazerSBATrail                        ;93840B;
    dw UNUSED_ProjectileDataTable_NonBeam_Projectile27_9386D7            ;93840D;
    dw $0000                                                             ;93840F;
    dw ProjectileDataTable_NonBeam_ShinesparkEcho                        ;938411;

SamusProjectileDataPointers_SBA:
; Non-ice SBA projectiles. Indexed by beam type
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
; Super missile link. Indexed by projectile type (always 2)
    dw $0000                                                             ;93842B;
    dw $0000                                                             ;93842D;
    dw ProjectileDataTable_NonBeam_SuperMissileLink                      ;93842F;

ProjectileDataTable_Uncharged_Power:
    dw $0014                                                             ;938431; Damage
    dw InstList_SamusProjectile_Power_Up                                 ;938433; Up, facing right
    dw InstList_SamusProjectile_Power_UpRight                            ;938435; Up-right
    dw InstList_SamusProjectile_Power_Right                              ;938437; Right
    dw InstList_SamusProjectile_Power_DownRight                          ;938439; Down-right
    dw InstList_SamusProjectile_Power_Down                               ;93843B; Down, facing right
    dw InstList_SamusProjectile_Power_Down                               ;93843D; Down, facing left
    dw InstList_SamusProjectile_Power_DownLeft                           ;93843F; Down-left
    dw InstList_SamusProjectile_Power_Left                               ;938441; Left
    dw InstList_SamusProjectile_Power_UpLeft                             ;938443; Up-left
    dw InstList_SamusProjectile_Power_Up                                 ;938445; Up, facing left

ProjectileDataTable_Uncharged_Spazer:
    dw $0028                                                             ;938447; Damage
    dw InstList_SamusProjectile_Spazer_SpazerIce_Up_0                    ;938449; Up, facing right
    dw InstList_SamusProjectile_Spazer_SpazerIce_UpRight_0               ;93844B; Up-right
    dw InstList_SamusProjectile_Spazer_SpazerIce_Right_0                 ;93844D; Right
    dw InstList_SamusProjectile_Spazer_SpazerIce_DownRight_0             ;93844F; Down-right
    dw InstList_SamusProjectile_Spazer_SpazerIce_Down_0                  ;938451; Down, facing right
    dw InstList_SamusProjectile_Spazer_SpazerIce_Down_0                  ;938453; Down, facing left
    dw InstList_SamusProjectile_Spazer_SpazerIce_DownLeft_0              ;938455; Down-left
    dw InstList_SamusProjectile_Spazer_SpazerIce_Left_0                  ;938457; Left
    dw InstList_SamusProjectile_Spazer_SpazerIce_UpLeft_0                ;938459; Up-left
    dw InstList_SamusProjectile_Spazer_SpazerIce_Up_0                    ;93845B; Up, facing left

ProjectileDataTable_Uncharged_SpazerIce:
    dw $003C                                                             ;93845D; Damage
    dw InstList_SamusProjectile_Spazer_SpazerIce_Up_0                    ;93845F; Up, facing right
    dw InstList_SamusProjectile_Spazer_SpazerIce_UpRight_0               ;938461; Up-right
    dw InstList_SamusProjectile_Spazer_SpazerIce_Right_0                 ;938463; Right
    dw InstList_SamusProjectile_Spazer_SpazerIce_DownRight_0             ;938465; Down-right
    dw InstList_SamusProjectile_Spazer_SpazerIce_Down_0                  ;938467; Down, facing right
    dw InstList_SamusProjectile_Spazer_SpazerIce_Down_0                  ;938469; Down, facing left
    dw InstList_SamusProjectile_Spazer_SpazerIce_DownLeft_0              ;93846B; Down-left
    dw InstList_SamusProjectile_Spazer_SpazerIce_Left_0                  ;93846D; Left
    dw InstList_SamusProjectile_Spazer_SpazerIce_UpLeft_0                ;93846F; Up-left
    dw InstList_SamusProjectile_Spazer_SpazerIce_Up_0                    ;938471; Up, facing left

ProjectileDataTable_Uncharged_SpazerIceWave:
    dw $0064                                                             ;938473; Damage
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Up              ;938475; Up, facing right
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_UpRight         ;938477; Up-right
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Right           ;938479; Right
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_DownRight       ;93847B; Down-right
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Down            ;93847D; Down, facing right
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Down            ;93847F; Down, facing left
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_DownLeft        ;938481; Down-left
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Left            ;938483; Left
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_UpLeft          ;938485; Up-left
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Up              ;938487; Up, facing left

ProjectileDataTable_Uncharged_PlasmaIceWave:
    dw $012C                                                             ;938489; Damage
    dw InstList_SamusProjectile_PlasmaIceWave_Down_Up                    ;93848B; Up, facing right
    dw InstList_SamusProjectile_PlasmaIceWave_DownLeft_UpRight           ;93848D; Up-right
    dw InstList_SamusProj_PlasmaWave_PlasmaIceWave_Left_Right_0          ;93848F; Right
    dw InstList_SamusProjectile_PlasmaIceWave_DownRight_UpLeft           ;938491; Down-right
    dw InstList_SamusProjectile_PlasmaIceWave_Down_Up                    ;938493; Down, facing right
    dw InstList_SamusProjectile_PlasmaIceWave_Down_Up                    ;938495; Down, facing left
    dw InstList_SamusProjectile_PlasmaIceWave_DownLeft_UpRight           ;938497; Down-left
    dw InstList_SamusProj_PlasmaWave_PlasmaIceWave_Left_Right_0          ;938499; Left
    dw InstList_SamusProjectile_PlasmaIceWave_DownRight_UpLeft           ;93849B; Up-left
    dw InstList_SamusProjectile_PlasmaIceWave_Down_Up                    ;93849D; Up, facing left

ProjectileDataTable_Uncharged_Ice:
    dw $001E                                                             ;93849F; Damage
    dw InstList_SamusProjectile_Ice                                      ;9384A1; Up, facing right
    dw InstList_SamusProjectile_Ice                                      ;9384A3; Up-right
    dw InstList_SamusProjectile_Ice                                      ;9384A5; Right
    dw InstList_SamusProjectile_Ice                                      ;9384A7; Down-right
    dw InstList_SamusProjectile_Ice                                      ;9384A9; Down, facing right
    dw InstList_SamusProjectile_Ice                                      ;9384AB; Down, facing left
    dw InstList_SamusProjectile_Ice                                      ;9384AD; Down-left
    dw InstList_SamusProjectile_Ice                                      ;9384AF; Left
    dw InstList_SamusProjectile_Ice                                      ;9384B1; Up-left
    dw InstList_SamusProjectile_Ice                                      ;9384B3; Up, facing left

ProjectileDataTable_Uncharged_Wave:
    dw $0032                                                             ;9384B5; Damage
    dw InstList_SamusProjectile_Wave_IceWave_Up                          ;9384B7; Up, facing right
    dw InstList_SamusProjectile_Wave_IceWave_DownLeft_UpRight            ;9384B9; Up-right
    dw InstList_SamusProjectile_Wave_IceWave_Left_Right                  ;9384BB; Right
    dw InstList_SamusProjectile_Wave_IceWave_DownRight_UpLeft            ;9384BD; Down-right
    dw InstList_SamusProjectile_Wave_IceWave_Down                        ;9384BF; Down, facing right
    dw InstList_SamusProjectile_Wave_IceWave_Down                        ;9384C1; Down, facing left
    dw InstList_SamusProjectile_Wave_IceWave_DownLeft_UpRight            ;9384C3; Down-left
    dw InstList_SamusProjectile_Wave_IceWave_Left_Right                  ;9384C5; Left
    dw InstList_SamusProjectile_Wave_IceWave_DownRight_UpLeft            ;9384C7; Up-left
    dw InstList_SamusProjectile_Wave_IceWave_Up                          ;9384C9; Up, facing left

ProjectileDataTable_Uncharged_Plasma:
    dw $0096                                                             ;9384CB; Damage
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Down_Up_0               ;9384CD; Up, facing right
    dw InstList_SamusProjectile_Plasma_PlasmaIce_DownLeft_UpRight_0      ;9384CF; Up-right
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Left_Right_0            ;9384D1; Right
    dw InstList_SamusProjectile_Plasma_PlasmaIce_DownRight_UpLeft_0      ;9384D3; Down-right
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Down_Up_0               ;9384D5; Down, facing right
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Down_Up_0               ;9384D7; Down, facing left
    dw InstList_SamusProjectile_Plasma_PlasmaIce_DownLeft_UpRight_0      ;9384D9; Down-left
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Left_Right_0            ;9384DB; Left
    dw InstList_SamusProjectile_Plasma_PlasmaIce_DownRight_UpLeft_0      ;9384DD; Up-left
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Down_Up_0               ;9384DF; Up, facing left

ProjectileDataTable_Uncharged_IceWave:
    dw $003C                                                             ;9384E1; Damage
    dw InstList_SamusProjectile_Wave_IceWave_Up                          ;9384E3; Up, facing right
    dw InstList_SamusProjectile_Wave_IceWave_DownLeft_UpRight            ;9384E5; Up-right
    dw InstList_SamusProjectile_Wave_IceWave_Left_Right                  ;9384E7; Right
    dw InstList_SamusProjectile_Wave_IceWave_DownRight_UpLeft            ;9384E9; Down-right
    dw InstList_SamusProjectile_Wave_IceWave_Down                        ;9384EB; Down, facing right
    dw InstList_SamusProjectile_Wave_IceWave_Down                        ;9384ED; Down, facing left
    dw InstList_SamusProjectile_Wave_IceWave_DownLeft_UpRight            ;9384EF; Down-left
    dw InstList_SamusProjectile_Wave_IceWave_Left_Right                  ;9384F1; Left
    dw InstList_SamusProjectile_Wave_IceWave_DownRight_UpLeft            ;9384F3; Up-left
    dw InstList_SamusProjectile_Wave_IceWave_Up                          ;9384F5; Up, facing left

ProjectileDataTable_Uncharged_SpazerWave:
    dw $0046                                                             ;9384F7; Damage
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Up              ;9384F9; Up, facing right
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_UpRight         ;9384FB; Up-right
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Right           ;9384FD; Right
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_DownRight       ;9384FF; Down-right
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Down            ;938501; Down, facing right
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Down            ;938503; Down, facing left
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_DownLeft        ;938505; Down-left
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Left            ;938507; Left
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_UpLeft          ;938509; Up-left
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Up              ;93850B; Up, facing left

ProjectileDataTable_Uncharged_PlasmaWave:
    dw $00FA                                                             ;93850D; Damage
    dw InstList_SamusProjectile_PlasmaWave_Down_Up                       ;93850F; Up, facing right
    dw InstList_SamusProjectile_PlasmaWave_DownLeft_UpRight              ;938511; Up-right
    dw InstList_SamusProj_PlasmaWave_PlasmaIceWave_Left_Right_0          ;938513; Right
    dw InstList_SamusProjectile_PlasmaWave_DownRight_UpLeft              ;938515; Down-right
    dw InstList_SamusProjectile_PlasmaWave_Down_Up                       ;938517; Down, facing right
    dw InstList_SamusProjectile_PlasmaWave_Down_Up                       ;938519; Down, facing left
    dw InstList_SamusProjectile_PlasmaWave_DownLeft_UpRight              ;93851B; Down-left
    dw InstList_SamusProj_PlasmaWave_PlasmaIceWave_Left_Right_0          ;93851D; Left
    dw InstList_SamusProjectile_PlasmaWave_DownRight_UpLeft              ;93851F; Up-left
    dw InstList_SamusProjectile_PlasmaWave_Down_Up                       ;938521; Up, facing left

ProjectileDataTable_Uncharged_PlasmaIce:
    dw $00C8                                                             ;938523; Damage
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Down_Up_0               ;938525; Up, facing right
    dw InstList_SamusProjectile_Plasma_PlasmaIce_DownLeft_UpRight_0      ;938527; Up-right
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Left_Right_0            ;938529; Right
    dw InstList_SamusProjectile_Plasma_PlasmaIce_DownRight_UpLeft_0      ;93852B; Down-right
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Down_Up_0               ;93852D; Down, facing right
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Down_Up_0               ;93852F; Down, facing left
    dw InstList_SamusProjectile_Plasma_PlasmaIce_DownLeft_UpRight_0      ;938531; Down-left
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Left_Right_0            ;938533; Left
    dw InstList_SamusProjectile_Plasma_PlasmaIce_DownRight_UpLeft_0      ;938535; Up-left
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Down_Up_0               ;938537; Up, facing left

ProjectileDataTable_Charged_Power:
    dw $003C                                                             ;938539; Damage
    dw InstList_SamusProjectile_Charged_Power_Up                         ;93853B; Up, facing right
    dw InstList_SamusProjectile_Charged_Power_UpRight                    ;93853D; Up-right
    dw InstList_SamusProjectile_Charged_Power_Right                      ;93853F; Right
    dw InstList_SamusProjectile_Charged_Power_DownRight                  ;938541; Down-right
    dw InstList_SamusProjectile_Charged_Power_Down                       ;938543; Down, facing right
    dw InstList_SamusProjectile_Charged_Power_Down                       ;938545; Down, facing left
    dw InstList_SamusProjectile_Charged_Power_DownLeft                   ;938547; Down-left
    dw InstList_SamusProjectile_Charged_Power_Left                       ;938549; Left
    dw InstList_SamusProjectile_Charged_Power_UpLeft                     ;93854B; Up-left
    dw InstList_SamusProjectile_Charged_Power_Up                         ;93854D; Up, facing left

ProjectileDataTable_Charged_Spazer:
    dw $0078                                                             ;93854F; Damage
    dw InstList_SamusProjectile_Charged_S_SI_Down_Up_0                   ;938551; Up, facing right
    dw InstList_SamusProjectile_Charged_S_SI_DownLeft_UpRight_0          ;938553; Up-right
    dw InstList_SamusProjectile_Charged_S_SI_Left_Right_0                ;938555; Right
    dw InstList_SamusProjectile_Charged_S_SI_DownRight_UpLeft_0          ;938557; Down-right
    dw InstList_SamusProjectile_Charged_S_SI_Down_Up_0                   ;938559; Down, facing right
    dw InstList_SamusProjectile_Charged_S_SI_Down_Up_0                   ;93855B; Down, facing left
    dw InstList_SamusProjectile_Charged_S_SI_DownLeft_UpRight_0          ;93855D; Down-left
    dw InstList_SamusProjectile_Charged_S_SI_Left_Right_0                ;93855F; Left
    dw InstList_SamusProjectile_Charged_S_SI_DownRight_UpLeft_0          ;938561; Up-left
    dw InstList_SamusProjectile_Charged_S_SI_Down_Up_0                   ;938563; Up, facing left

ProjectileDataTable_Charged_SpazerIce:
    dw $00B4                                                             ;938565; Damage
    dw InstList_SamusProjectile_Charged_S_SI_Down_Up_0                   ;938567; Up, facing right
    dw InstList_SamusProjectile_Charged_S_SI_DownLeft_UpRight_0          ;938569; Up-right
    dw InstList_SamusProjectile_Charged_S_SI_Left_Right_0                ;93856B; Right
    dw InstList_SamusProjectile_Charged_S_SI_DownRight_UpLeft_0          ;93856D; Down-right
    dw InstList_SamusProjectile_Charged_S_SI_Down_Up_0                   ;93856F; Down, facing right
    dw InstList_SamusProjectile_Charged_S_SI_Down_Up_0                   ;938571; Down, facing left
    dw InstList_SamusProjectile_Charged_S_SI_DownLeft_UpRight_0          ;938573; Down-left
    dw InstList_SamusProjectile_Charged_S_SI_Left_Right_0                ;938575; Left
    dw InstList_SamusProjectile_Charged_S_SI_DownRight_UpLeft_0          ;938577; Up-left
    dw InstList_SamusProjectile_Charged_S_SI_Down_Up_0                   ;938579; Up, facing left

ProjectileDataTable_Charged_SpazerIceWave:
    dw $012C                                                             ;93857B; Damage
    dw InstList_SamusProjectile_Charged_SW_SIW_Up_0                      ;93857D; Up, facing right
    dw InstList_SamusProjectile_Charged_SW_SIW_UpRight_0                 ;93857F; Up-right
    dw InstList_SamusProjectile_Charged_SW_SIW_Right_0                   ;938581; Right
    dw InstList_SamusProjectile_Charged_SW_SIW_DownRight_0               ;938583; Down-right
    dw InstList_SamusProjectile_Charged_SW_SIW_Down_0                    ;938585; Down, facing right
    dw InstList_SamusProjectile_Charged_SW_SIW_Down_0                    ;938587; Down, facing left
    dw InstList_SamusProjectile_Charged_SW_SIW_DownLeft_0                ;938589; Down-left
    dw InstList_SamusProjectile_Charged_SW_SIW_Left_0                    ;93858B; Left
    dw InstList_SamusProjectile_Charged_SW_SIW_UpLeft_0                  ;93858D; Up-left
    dw InstList_SamusProjectile_Charged_SW_SIW_Up_0                      ;93858F; Up, facing left

ProjectileDataTable_Charged_PlasmaIceWave:
    dw $0384                                                             ;938591; Damage
    dw InstList_SamusProjectile_Charged_PW_PIW_Down_Up_0                 ;938593; Up, facing right
    dw InstList_SamusProjectile_Charged_PW_PIW_DownLeft_UpRight_0        ;938595; Up-right
    dw InstList_SamusProjectile_Charged_PW_PIW_Left_Right_0              ;938597; Right
    dw InstList_SamusProjectile_Charged_PW_PIW_DownRight_UpLeft_0        ;938599; Down-right
    dw InstList_SamusProjectile_Charged_PW_PIW_Down_Up_0                 ;93859B; Down, facing right
    dw InstList_SamusProjectile_Charged_PW_PIW_Down_Up_0                 ;93859D; Down, facing left
    dw InstList_SamusProjectile_Charged_PW_PIW_DownLeft_UpRight_0        ;93859F; Down-left
    dw InstList_SamusProjectile_Charged_PW_PIW_Left_Right_0              ;9385A1; Left
    dw InstList_SamusProjectile_Charged_PW_PIW_DownRight_UpLeft_0        ;9385A3; Up-left
    dw InstList_SamusProjectile_Charged_PW_PIW_Down_Up_0                 ;9385A5; Up, facing left

ProjectileDataTable_Charged_Ice:
    dw $005A                                                             ;9385A7; Damage
    dw InstList_SamusProjectile_Charged_Ice                              ;9385A9; Up, facing right
    dw InstList_SamusProjectile_Charged_Ice                              ;9385AB; Up-right
    dw InstList_SamusProjectile_Charged_Ice                              ;9385AD; Right
    dw InstList_SamusProjectile_Charged_Ice                              ;9385AF; Down-right
    dw InstList_SamusProjectile_Charged_Ice                              ;9385B1; Down, facing right
    dw InstList_SamusProjectile_Charged_Ice                              ;9385B3; Down, facing left
    dw InstList_SamusProjectile_Charged_Ice                              ;9385B5; Down-left
    dw InstList_SamusProjectile_Charged_Ice                              ;9385B7; Left
    dw InstList_SamusProjectile_Charged_Ice                              ;9385B9; Up-left
    dw InstList_SamusProjectile_Charged_Ice                              ;9385BB; Up, facing left

ProjectileDataTable_Charged_Plasma:
    dw $01C2                                                             ;9385BD; Damage
    dw InstList_SamusProjectile_Charged_P_PI_Down_Up_0                   ;9385BF; Up, facing right
    dw InstList_SamusProjectile_Charged_P_PI_DownLeft_UpRight_0          ;9385C1; Up-right
    dw InstList_SamusProjectile_Charged_P_PI_Left_Right_0                ;9385C3; Right
    dw InstList_SamusProjectile_Charged_P_PI_DownRight_UpLeft_0          ;9385C5; Down-right
    dw InstList_SamusProjectile_Charged_P_PI_Down_Up_0                   ;9385C7; Down, facing right
    dw InstList_SamusProjectile_Charged_P_PI_Down_Up_0                   ;9385C9; Down, facing left
    dw InstList_SamusProjectile_Charged_P_PI_DownLeft_UpRight_0          ;9385CB; Down-left
    dw InstList_SamusProjectile_Charged_P_PI_Left_Right_0                ;9385CD; Left
    dw InstList_SamusProjectile_Charged_P_PI_DownRight_UpLeft_0          ;9385CF; Up-left
    dw InstList_SamusProjectile_Charged_P_PI_Down_Up_0                   ;9385D1; Up, facing left

ProjectileDataTable_Charged_Wave:
    dw $0096                                                             ;9385D3; Damage
    dw InstList_SamusProjectile_Charged_Wave_Up                          ;9385D5; Up, facing right
    dw InstList_SamusProjectile_Charged_Wave_DownLeft_UpRight            ;9385D7; Up-right
    dw InstList_SamusProjectile_Charged_Wave_Left_Right                  ;9385D9; Right
    dw InstList_SamusProjectile_Charged_Wave_DownRight_UpLeft            ;9385DB; Down-right
    dw InstList_SamusProjectile_Charged_Wave_Down                        ;9385DD; Down, facing right
    dw InstList_SamusProjectile_Charged_Wave_Down                        ;9385DF; Down, facing left
    dw InstList_SamusProjectile_Charged_Wave_DownLeft_UpRight            ;9385E1; Down-left
    dw InstList_SamusProjectile_Charged_Wave_Left_Right                  ;9385E3; Left
    dw InstList_SamusProjectile_Charged_Wave_DownRight_UpLeft            ;9385E5; Up-left
    dw InstList_SamusProjectile_Charged_Wave_Up                          ;9385E7; Up, facing left

ProjectileDataTable_Charged_IceWave:
    dw $00B4                                                             ;9385E9; Damage
    dw InstList_SamusProjectile_Charged_IW_Up                            ;9385EB; Up, facing right
    dw InstList_SamusProjectile_Charged_IW_DownLeft_UpRight              ;9385ED; Up-right
    dw InstList_SamusProjectile_Charged_IW_Left_Right                    ;9385EF; Right
    dw InstList_SamusProjectile_Charged_IW_DownRight_UpLeft              ;9385F1; Down-right
    dw InstList_SamusProjectile_Charged_IW_Down                          ;9385F3; Down, facing right
    dw InstList_SamusProjectile_Charged_IW_Down                          ;9385F5; Down, facing left
    dw InstList_SamusProjectile_Charged_IW_DownLeft_UpRight              ;9385F7; Down-left
    dw InstList_SamusProjectile_Charged_IW_Left_Right                    ;9385F9; Left
    dw InstList_SamusProjectile_Charged_IW_DownRight_UpLeft              ;9385FB; Up-left
    dw InstList_SamusProjectile_Charged_IW_Up                            ;9385FD; Up, facing left

ProjectileDataTable_Charged_SpazerWave:
    dw $00D2                                                             ;9385FF; Damage
    dw InstList_SamusProjectile_Charged_SW_SIW_Up_0                      ;938601; Up, facing right
    dw InstList_SamusProjectile_Charged_SW_SIW_UpRight_0                 ;938603; Up-right
    dw InstList_SamusProjectile_Charged_SW_SIW_Right_0                   ;938605; Right
    dw InstList_SamusProjectile_Charged_SW_SIW_DownRight_0               ;938607; Down-right
    dw InstList_SamusProjectile_Charged_SW_SIW_Down_0                    ;938609; Down, facing right
    dw InstList_SamusProjectile_Charged_SW_SIW_Down_0                    ;93860B; Down, facing left
    dw InstList_SamusProjectile_Charged_SW_SIW_DownLeft_0                ;93860D; Down-left
    dw InstList_SamusProjectile_Charged_SW_SIW_Left_0                    ;93860F; Left
    dw InstList_SamusProjectile_Charged_SW_SIW_UpLeft_0                  ;938611; Up-left
    dw InstList_SamusProjectile_Charged_SW_SIW_Up_0                      ;938613; Up, facing left

ProjectileDataTable_Charged_PlasmaIce:
    dw $0258                                                             ;938615; Damage
    dw InstList_SamusProjectile_Charged_P_PI_Down_Up_0                   ;938617; Up, facing right
    dw InstList_SamusProjectile_Charged_P_PI_DownLeft_UpRight_0          ;938619; Up-right
    dw InstList_SamusProjectile_Charged_P_PI_Left_Right_0                ;93861B; Right
    dw InstList_SamusProjectile_Charged_P_PI_DownRight_UpLeft_0          ;93861D; Down-right
    dw InstList_SamusProjectile_Charged_P_PI_Down_Up_0                   ;93861F; Down, facing right
    dw InstList_SamusProjectile_Charged_P_PI_Down_Up_0                   ;938621; Down, facing left
    dw InstList_SamusProjectile_Charged_P_PI_DownLeft_UpRight_0          ;938623; Down-left
    dw InstList_SamusProjectile_Charged_P_PI_Left_Right_0                ;938625; Left
    dw InstList_SamusProjectile_Charged_P_PI_DownRight_UpLeft_0          ;938627; Up-left
    dw InstList_SamusProjectile_Charged_P_PI_Down_Up_0                   ;938629; Up, facing left

ProjectileDataTable_Charged_PlasmaWave:
    dw $02EE                                                             ;93862B; Damage
    dw InstList_SamusProjectile_Charged_PW_PIW_Down_Up_0                 ;93862D; Up, facing right
    dw InstList_SamusProjectile_Charged_PW_PIW_DownLeft_UpRight_0        ;93862F; Up-right
    dw InstList_SamusProjectile_Charged_PW_PIW_Left_Right_0              ;938631; Right
    dw InstList_SamusProjectile_Charged_PW_PIW_DownRight_UpLeft_0        ;938633; Down-right
    dw InstList_SamusProjectile_Charged_PW_PIW_Down_Up_0                 ;938635; Down, facing right
    dw InstList_SamusProjectile_Charged_PW_PIW_Down_Up_0                 ;938637; Down, facing left
    dw InstList_SamusProjectile_Charged_PW_PIW_DownLeft_UpRight_0        ;938639; Down-left
    dw InstList_SamusProjectile_Charged_PW_PIW_Left_Right_0              ;93863B; Left
    dw InstList_SamusProjectile_Charged_PW_PIW_DownRight_UpLeft_0        ;93863D; Up-left
    dw InstList_SamusProjectile_Charged_PW_PIW_Down_Up_0                 ;93863F; Up, facing left

ProjectileDataTable_NonBeam_Missile:
    dw $0064                                                             ;938641; Damage
    dw InstList_SamusProjectile_Missiles_Up                              ;938643; Up, facing right
    dw InstList_SamusProjectile_Missiles_UpRight                         ;938645; Up-right
    dw InstList_SamusProjectile_Missiles_Right                           ;938647; Right
    dw InstList_SamusProjectile_Missiles_DownRight                       ;938649; Down-right
    dw InstList_SamusProjectile_Missiles_Down                            ;93864B; Down, facing right
    dw InstList_SamusProjectile_Missiles_Down                            ;93864D; Down, facing left
    dw InstList_SamusProjectile_Missiles_DownLeft                        ;93864F; Down-left
    dw InstList_SamusProjectile_Missiles_Left                            ;938651; Left
    dw InstList_SamusProjectile_Missiles_UpLeft                          ;938653; Up-left
    dw InstList_SamusProjectile_Missiles_Up                              ;938655; Up, facing left

ProjectileDataTable_NonBeam_SuperMissile:
    dw $012C                                                             ;938657; Damage
    dw InstList_SamusProjectile_SuperMissiles_Up                         ;938659; Up, facing right
    dw InstList_SamusProjectile_SuperMissiles_UpRight                    ;93865B; Up-right
    dw InstList_SamusProjectile_SuperMissiles_Right                      ;93865D; Right
    dw InstList_SamusProjectile_SuperMissiles_DownRight                  ;93865F; Down-right
    dw InstList_SamusProjectile_SuperMissiles_Down                       ;938661; Down, facing right
    dw InstList_SamusProjectile_SuperMissiles_Down                       ;938663; Down, facing left
    dw InstList_SamusProjectile_SuperMissiles_DownLeft                   ;938665; Down-left
    dw InstList_SamusProjectile_SuperMissiles_Left                       ;938667; Left
    dw InstList_SamusProjectile_SuperMissiles_UpLeft                     ;938669; Up-left
    dw InstList_SamusProjectile_SuperMissiles_Up                         ;93866B; Up, facing left

ProjectileDataTable_NonBeam_SuperMissileLink:
    dw $012C                                                             ;93866D; Damage
    dw InstList_SamusProjectile_SuperMissileLink                         ;93866F;

ProjectileDataTable_NonBeam_PowerBomb:
    dw $00C8                                                             ;938671; Damage
    dw InstList_SamusProjectile_PowerBomb                                ;938673;

ProjectileDataTable_NonBeam_Bomb:
    dw $001E                                                             ;938675; Damage
    dw InstList_SamusProjectile_Bomb                                     ;938677;

ProjectileDataTable_NonBeam_BeamExplosion:
    dw $0008                                                             ;938679; Damage is ignored
  .pointer
    dw InstList_SamusProjectile_BeamExplosion                            ;93867B;

ProjectileDataTable_NonBeam_MissileExplosion:
    dw $0008                                                             ;93867D; Damage is ignored
  .pointer
    dw InstList_SamusProjectile_MissileExplosion                         ;93867F;

ProjectileDataTable_NonBeam_BombExplosion:
    dw $0000                                                             ;938681; Damage is ignored
  .pointer
    dw InstList_SamusProjectile_BombExplosion                            ;938683;

ProjectileDataTable_NonBeam_PlasmaSBA:
    dw $012C                                                             ;938685; Damage
    dw InstList_SamusProjectile_PlasmaSBA                                ;938687;

ProjectileDataTable_NonBeam_WaveSBA:
    dw $012C                                                             ;938689; Damage
    dw InstList_SamusProjectile_WaveSBA                                  ;93868B;

ProjectileDataTable_NonBeam_SpazerSBA:
    dw $012C                                                             ;93868D; Damage
    dw InstList_SamusProjectile_Spazer_SpazerIce_Up_0                    ;93868F;

ProjectileDataTable_NonBeam_SuperMissileExplosion:
    dw $0008                                                             ;938691; Damage is ignored
  .pointer
    dw InstList_SamusProjectile_SuperMissileExplosion                    ;938693;

UNUSED_ProjectileDataTable_NonBeam_Projectile25_938695:
    dw $F000                                                             ;938695; Damage
    dw UNUSED_InstList_SamusProjectile_Projectile25_93A0F3               ;938697; Up, facing right
    dw UNUSED_InstList_SamusProjectile_Projectile25_93A0F3               ;938699; Up-right
    dw UNUSED_InstList_SamusProjectile_Projectile25_93A0F3               ;93869B; Right
    dw UNUSED_InstList_SamusProjectile_Projectile25_93A0F3               ;93869D; Down-right
    dw UNUSED_InstList_SamusProjectile_Projectile25_93A0F3               ;93869F; Down, facing right
    dw UNUSED_InstList_SamusProjectile_Projectile25_93A0F3               ;9386A1; Down, facing left
    dw UNUSED_InstList_SamusProjectile_Projectile25_93A0F3               ;9386A3; Down-left
    dw UNUSED_InstList_SamusProjectile_Projectile25_93A0F3               ;9386A5; Left
    dw UNUSED_InstList_SamusProjectile_Projectile25_93A0F3               ;9386A7; Up-left
    dw UNUSED_InstList_SamusProjectile_Projectile25_93A0F3               ;9386A9; Up, facing left

ProjectileDataTable_NonBeam_SpazerSBATrail:
    dw $012C                                                             ;9386AB; Damage
    dw InstList_SamusProjectile_SpazerSBATrail_0                         ;9386AD; Up, facing right
    dw InstList_SamusProjectile_SpazerSBATrail_0                         ;9386AF; Up-right
    dw InstList_SamusProjectile_SpazerSBATrail_0                         ;9386B1; Right
    dw InstList_SamusProjectile_SpazerSBATrail_0                         ;9386B3; Down-right
    dw InstList_SamusProjectile_SpazerSBATrail_0                         ;9386B5; Down, facing right
    dw InstList_SamusProjectile_SpazerSBATrail_0                         ;9386B7; Down, facing left
    dw InstList_SamusProjectile_SpazerSBATrail_0                         ;9386B9; Down-left
    dw InstList_SamusProjectile_SpazerSBATrail_0                         ;9386BB; Left
    dw InstList_SamusProjectile_SpazerSBATrail_0                         ;9386BD; Up-left
    dw InstList_SamusProjectile_SpazerSBATrail_0                         ;9386BF; Up, facing left

ProjectileDataTable_NonBeam_ShinesparkEcho:
    dw $1000                                                             ;9386C1; Damage
    dw InstList_SamusProjectile_ShinesparkEcho                           ;9386C3; Up, facing right
    dw InstList_SamusProjectile_ShinesparkEcho                           ;9386C5; Up-right
    dw InstList_SamusProjectile_ShinesparkEcho                           ;9386C7; Right
    dw InstList_SamusProjectile_ShinesparkEcho                           ;9386C9; Down-right
    dw InstList_SamusProjectile_ShinesparkEcho                           ;9386CB; Down, facing right
    dw InstList_SamusProjectile_ShinesparkEcho                           ;9386CD; Down, facing left
    dw InstList_SamusProjectile_ShinesparkEcho                           ;9386CF; Down-left
    dw InstList_SamusProjectile_ShinesparkEcho                           ;9386D1; Left
    dw InstList_SamusProjectile_ShinesparkEcho                           ;9386D3; Up-left
    dw InstList_SamusProjectile_ShinesparkEcho                           ;9386D5; Up, facing left

UNUSED_ProjectileDataTable_NonBeam_Projectile27_9386D7:
    dw $0000                                                             ;9386D7;
    dw UNUSED_InstList_SamusProjectile_Projectile27_93A16D               ;9386D9;

InstList_SamusProjectile_Power_Up:
    dw $000F,ProjectileFlareSpritemaps_Power_2                           ;9386DB;
    db $04,$04 : dw $0000                                                ;9386DF;
    dw Instruction_SamusProjectile_GotoY                                 ;9386E3;
    dw InstList_SamusProjectile_Power_Up                                 ;9386E5;

InstList_SamusProjectile_Power_UpRight:
    dw $000F,ProjectileFlareSpritemaps_Power_3                           ;9386E7;
    db $08,$04 : dw $0000                                                ;9386EB;
    dw Instruction_SamusProjectile_GotoY                                 ;9386EF;
    dw InstList_SamusProjectile_Power_UpRight                            ;9386F1;

InstList_SamusProjectile_Power_Right:
    dw $000F,ProjectileFlareSpritemaps_Power_4                           ;9386F3;
    db $08,$04 : dw $0000                                                ;9386F7;
    dw Instruction_SamusProjectile_GotoY                                 ;9386FB;
    dw InstList_SamusProjectile_Power_Right                              ;9386FD;

InstList_SamusProjectile_Power_DownRight:
    dw $000F,ProjectileFlareSpritemaps_Power_5                           ;9386FF;
    db $08,$04 : dw $0000                                                ;938703;
    dw Instruction_SamusProjectile_GotoY                                 ;938707;
    dw InstList_SamusProjectile_Power_DownRight                          ;938709;

InstList_SamusProjectile_Power_Down:
    dw $000F,ProjectileFlareSpritemaps_Power_6                           ;93870B;
    db $04,$04 : dw $0000                                                ;93870F;
    dw Instruction_SamusProjectile_GotoY                                 ;938713;
    dw InstList_SamusProjectile_Power_Down                               ;938715;

InstList_SamusProjectile_Power_DownLeft:
    dw $000F,ProjectileFlareSpritemaps_Power_7                           ;938717;
    db $08,$04 : dw $0000                                                ;93871B;
    dw Instruction_SamusProjectile_GotoY                                 ;93871F;
    dw InstList_SamusProjectile_Power_DownLeft                           ;938721;

InstList_SamusProjectile_Power_Left:
    dw $000F,ProjectileFlareSpritemaps_Power_0                           ;938723;
    db $08,$04 : dw $0000                                                ;938727;
    dw Instruction_SamusProjectile_GotoY                                 ;93872B;
    dw InstList_SamusProjectile_Power_Left                               ;93872D;

InstList_SamusProjectile_Power_UpLeft:
    dw $000F,ProjectileFlareSpritemaps_Power_1                           ;93872F;
    db $08,$04 : dw $0000                                                ;938733;
    dw Instruction_SamusProjectile_GotoY                                 ;938737;
    dw InstList_SamusProjectile_Power_UpLeft                             ;938739;

InstList_SamusProjectile_Wave_IceWave_Up:
    dw $0004,Spritemap_Nothing_93A117                                    ;93873B;
    db $0C,$04 : dw $0000                                                ;93873F;

InstList_SamusProjectile_Wave_IceWave_Down:
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_0                    ;938743;
    db $0C,$04 : dw $0000                                                ;938747;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_11                   ;93874B;
    db $0C,$04 : dw $0001                                                ;93874F;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_12                   ;938751;
    db $0C,$04 : dw $0002                                                ;938757;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_13                   ;938759;
    db $10,$04 : dw $0003                                                ;93875F;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_14                   ;938761;
    db $14,$04 : dw $0004                                                ;938767;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_13                   ;938769;
    db $10,$04 : dw $0005                                                ;93876F;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_12                   ;938771;
    db $0C,$04 : dw $0006                                                ;938777;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_11                   ;938779;
    db $0C,$04 : dw $0007                                                ;93877F;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_0                    ;938781;
    db $0C,$04 : dw $0008                                                ;938787;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_15                   ;938789;
    db $0C,$04 : dw $0009                                                ;93878F;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_16                   ;938791;
    db $0C,$04 : dw $000A                                                ;938797;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_17                   ;938799;
    db $10,$04 : dw $000B                                                ;93879F;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_18                   ;9387A1;
    db $14,$04 : dw $000C                                                ;9387A7;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_17                   ;9387A9;
    db $10,$04 : dw $000D                                                ;9387AF;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_16                   ;9387B1;
    db $0C,$04 : dw $000E                                                ;9387B7;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_15                   ;9387B9;
    db $0C,$04 : dw $000F                                                ;9387BF;
    dw Instruction_SamusProjectile_GotoY                                 ;9387C3;
    dw InstList_SamusProjectile_Wave_IceWave_Down                        ;9387C5;

InstList_SamusProjectile_Wave_IceWave_DownLeft_UpRight:
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_0                    ;9387C7;
    db $08,$08 : dw $0000                                                ;9387CB;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_19                   ;9387CD;
    db $08,$08 : dw $0001                                                ;9387D3;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_1A                   ;9387D5;
    db $08,$08 : dw $0002                                                ;9387DB;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_1B                   ;9387DD;
    db $0A,$0A : dw $0003                                                ;9387E3;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_1C                   ;9387E5;
    db $0C,$0C : dw $0004                                                ;9387EB;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_1B                   ;9387ED;
    db $0A,$0A : dw $0005                                                ;9387F3;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_1A                   ;9387F5;
    db $08,$08 : dw $0006                                                ;9387FB;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_19                   ;9387FD;
    db $06,$06 : dw $0007                                                ;938803;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_0                    ;938805;
    db $04,$04 : dw $0008                                                ;93880B;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_1D                   ;93880D;
    db $06,$06 : dw $0009                                                ;938813;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_1E                   ;938815;
    db $08,$08 : dw $000A                                                ;93881B;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_1F                   ;93881D;
    db $0A,$0A : dw $000B                                                ;938823;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_20                   ;938825;
    db $0C,$0C : dw $000C                                                ;93882B;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_1F                   ;93882D;
    db $0A,$0A : dw $000D                                                ;938833;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_1E                   ;938835;
    db $08,$08 : dw $000E                                                ;93883B;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_1D                   ;93883D;
    db $08,$08 : dw $000F                                                ;938843;
    dw Instruction_SamusProjectile_GotoY                                 ;938847;
    dw InstList_SamusProjectile_Wave_IceWave_DownLeft_UpRight            ;938849;

InstList_SamusProjectile_Wave_IceWave_Left_Right:
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_0                    ;93884B;
    db $04,$0C : dw $0000                                                ;93884F;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_1                    ;938851;
    db $04,$0C : dw $0001                                                ;938857;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_2                    ;938859;
    db $04,$0C : dw $0002                                                ;93885F;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_3                    ;938861;
    db $04,$10 : dw $0003                                                ;938867;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_4                    ;938869;
    db $04,$14 : dw $0004                                                ;93886F;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_3                    ;938871;
    db $04,$10 : dw $0005                                                ;938877;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_2                    ;938879;
    db $04,$0C : dw $0006                                                ;93887F;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_1                    ;938881;
    db $04,$0C : dw $0007                                                ;938887;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_0                    ;938889;
    db $04,$0C : dw $0008                                                ;93888F;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_5                    ;938891;
    db $04,$0C : dw $0009                                                ;938897;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_6                    ;938899;
    db $04,$0C : dw $000A                                                ;93889F;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_7                    ;9388A1;
    db $04,$10 : dw $000B                                                ;9388A7;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_8                    ;9388A9;
    db $04,$14 : dw $000C                                                ;9388AF;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_7                    ;9388B1;
    db $04,$10 : dw $000D                                                ;9388B7;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_6                    ;9388B9;
    db $04,$0C : dw $000E                                                ;9388BF;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_5                    ;9388C1;
    db $04,$0C : dw $000F                                                ;9388C7;
    dw Instruction_SamusProjectile_GotoY                                 ;9388CB;
    dw InstList_SamusProjectile_Wave_IceWave_Left_Right                  ;9388CD;

InstList_SamusProjectile_Wave_IceWave_DownRight_UpLeft:
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_0                    ;9388CF;
    db $08,$08 : dw $0000                                                ;9388D3;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_9                    ;9388D5;
    db $08,$08 : dw $0001                                                ;9388DB;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_A                    ;9388DD;
    db $08,$08 : dw $0002                                                ;9388E3;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_B                    ;9388E5;
    db $0A,$0A : dw $0003                                                ;9388EB;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_C                    ;9388ED;
    db $0C,$0C : dw $0004                                                ;9388F3;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_B                    ;9388F5;
    db $0A,$0A : dw $0005                                                ;9388FB;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_A                    ;9388FD;
    db $08,$08 : dw $0006                                                ;938903;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_9                    ;938905;
    db $06,$06 : dw $0007                                                ;93890B;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_0                    ;93890D;
    db $04,$04 : dw $0008                                                ;938913;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_D                    ;938915;
    db $06,$06 : dw $0009                                                ;93891B;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_E                    ;93891D;
    db $08,$08 : dw $000A                                                ;938923;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_F                    ;938925;
    db $0A,$0A : dw $000B                                                ;93892B;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_10                   ;93892D;
    db $0C,$0C : dw $000C                                                ;938933;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_F                    ;938935;
    db $0A,$0A : dw $000D                                                ;93893B;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_E                    ;93893D;
    db $08,$08 : dw $000E                                                ;938943;
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_D                    ;938945;
    db $08,$08 : dw $000F                                                ;93894B;
    dw Instruction_SamusProjectile_GotoY                                 ;93894F;
    dw InstList_SamusProjectile_Wave_IceWave_DownRight_UpLeft            ;938951;

InstList_SamusProjectile_Ice:
    dw $0001,ProjectileFlareSpritemaps_Ice_0                             ;938953;
    db $08,$08 : dw $0000                                                ;938957;
    dw $0001,ProjectileFlareSpritemaps_Ice_1                             ;938959;
    db $08,$08 : dw $0001                                                ;93895F;
    dw $0001,ProjectileFlareSpritemaps_Ice_2                             ;938961;
    db $08,$08 : dw $0002                                                ;938967;
    dw $0001,ProjectileFlareSpritemaps_Ice_3                             ;938969;
    db $08,$08 : dw $0003                                                ;93896F;
    dw Instruction_SamusProjectile_GotoY                                 ;938973;
    dw InstList_SamusProjectile_Ice                                      ;938975;

InstList_SamusProjectile_Spazer_SpazerIce_Up_0:
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_23                    ;938977;
    db $0C,$08 : dw $0000                                                ;93897B;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_25                    ;93897D;
    db $0C,$08 : dw $0001                                                ;938983;

InstList_SamusProjectile_Spazer_SpazerIce_Up_1:
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_28                    ;938987;
    db $14,$08 : dw $0002                                                ;93898B;
    dw Instruction_SamusProjectile_GotoY                                 ;93898F;
    dw InstList_SamusProjectile_Spazer_SpazerIce_Up_1                    ;938991;

InstList_SamusProjectile_Spazer_SpazerIce_UpRight_0:
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_0                     ;938993;
    db $08,$08 : dw $0000                                                ;938997;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_1                     ;938999;
    db $0C,$0C : dw $0001                                                ;93899F;

InstList_SamusProjectile_Spazer_SpazerIce_UpRight_1:
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_4                     ;9389A3;
    db $10,$10 : dw $0002                                                ;9389A7;
    dw Instruction_SamusProjectile_GotoY                                 ;9389AB;
    dw InstList_SamusProjectile_Spazer_SpazerIce_UpRight_1               ;9389AD;

InstList_SamusProjectile_Spazer_SpazerIce_Right_0:
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_29                    ;9389AF;
    db $08,$0C : dw $0000                                                ;9389B3;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_2B                    ;9389B5;
    db $08,$0C : dw $0001                                                ;9389BB;

InstList_SamusProjectile_Spazer_SpazerIce_Right_1:
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_2E                    ;9389BF;
    db $08,$14 : dw $0002                                                ;9389C3;
    dw Instruction_SamusProjectile_GotoY                                 ;9389C7;
    dw InstList_SamusProjectile_Spazer_SpazerIce_Right_1                 ;9389C9;

InstList_SamusProjectile_Spazer_SpazerIce_DownRight_0:
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_6                     ;9389CB;
    db $08,$08 : dw $0000                                                ;9389CF;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_7                     ;9389D1;
    db $0C,$0C : dw $0001                                                ;9389D7;

InstList_SamusProjectile_Spazer_SpazerIce_DownRight_1:
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_A                     ;9389DB;
    db $10,$10 : dw $0002                                                ;9389DF;
    dw Instruction_SamusProjectile_GotoY                                 ;9389E3;
    dw InstList_SamusProjectile_Spazer_SpazerIce_DownRight_1             ;9389E5;

InstList_SamusProjectile_Spazer_SpazerIce_Down_0:
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_17                    ;9389E7;
    db $0C,$08 : dw $0000                                                ;9389EB;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_19                    ;9389ED;
    db $0C,$08 : dw $0001                                                ;9389F3;

InstList_SamusProjectile_Spazer_SpazerIce_Down_1:
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_1C                    ;9389F7;
    db $14,$08 : dw $0002                                                ;9389FB;
    dw Instruction_SamusProjectile_GotoY                                 ;9389FF;
    dw InstList_SamusProjectile_Spazer_SpazerIce_Down_1                  ;938A01;

InstList_SamusProjectile_Spazer_SpazerIce_DownLeft_0:
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_C                     ;938A03;
    db $08,$08 : dw $0000                                                ;938A07;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_D                     ;938A0D;
    db $0C,$0C : dw $0001                                                ;938A0F;

InstList_SamusProjectile_Spazer_SpazerIce_DownLeft_1:
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_10                    ;938A13;
    db $10,$10 : dw $0002                                                ;938A17;
    dw Instruction_SamusProjectile_GotoY                                 ;938A1B;
    dw InstList_SamusProjectile_Spazer_SpazerIce_DownLeft_1              ;938A1D;

InstList_SamusProjectile_Spazer_SpazerIce_Left_0:
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_1D                    ;938A1F;
    db $08,$0C : dw $0000                                                ;938A23;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_1F                    ;938A29;
    db $08,$0C : dw $0001                                                ;938A2B;

InstList_SamusProjectile_Spazer_SpazerIce_Left_1:
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_22                    ;938A2F;
    db $08,$14 : dw $0002                                                ;938A33;
    dw Instruction_SamusProjectile_GotoY                                 ;938A37;
    dw InstList_SamusProjectile_Spazer_SpazerIce_Left_1                  ;938A39;

InstList_SamusProjectile_Spazer_SpazerIce_UpLeft_0:
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_11                    ;938A3B;
    db $08,$08 : dw $0000                                                ;938A3F;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_12                    ;938A41;
    db $0C,$0C : dw $0001                                                ;938A47;

InstList_SamusProjectile_Spazer_SpazerIce_UpLeft_1:
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_15                    ;938A4B;
    db $10,$10 : dw $0002                                                ;938A4F;
    dw Instruction_SamusProjectile_GotoY                                 ;938A53;
    dw InstList_SamusProjectile_Spazer_SpazerIce_UpLeft_1                ;938A55;

InstList_SamusProjectile_SpazerWave_SpazerIceWave_Up:
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_23                    ;938A57;
    db $0C,$08 : dw $0000                                                ;938A5B;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_24                    ;938A5D;
    db $0C,$08 : dw $0001                                                ;938A63;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_25                    ;938A65;
    db $0C,$08 : dw $0002                                                ;938A6B;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_26                    ;938A6D;
    db $11,$08 : dw $0003                                                ;938A73;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_27                    ;938A75;
    db $13,$08 : dw $0004                                                ;938A7B;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_28                    ;938A7D;
    db $14,$08 : dw $0005                                                ;938A83;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_27                    ;938A85;
    db $13,$08 : dw $0006                                                ;938A8B;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_26                    ;938A8D;
    db $11,$08 : dw $0007                                                ;938A93;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_25                    ;938A95;
    db $0C,$08 : dw $0008                                                ;938A9B;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_24                    ;938A9D;
    db $0C,$08 : dw $0009                                                ;938AA3;
    dw Instruction_SamusProjectile_GotoY                                 ;938AA7;
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Up              ;938AA9;

InstList_SamusProjectile_SpazerWave_SpazerIceWave_UpRight:
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_0                     ;938AAB;
    db $08,$08 : dw $0000                                                ;938AAF;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_5                     ;938AB1;
    db $08,$08 : dw $0001                                                ;938AB7;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_1                     ;938AB9;
    db $0C,$0C : dw $0002                                                ;938ABF;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_2                     ;938AC1;
    db $10,$10 : dw $0003                                                ;938AC7;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_3                     ;938AC9;
    db $10,$10 : dw $0004                                                ;938ACF;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_4                     ;938AD1;
    db $10,$10 : dw $0005                                                ;938AD7;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_3                     ;938AD9;
    db $10,$10 : dw $0006                                                ;938ADF;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_2                     ;938AE1;
    db $10,$10 : dw $0007                                                ;938AE7;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_1                     ;938AE9;
    db $0C,$0C : dw $0008                                                ;938AEF;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_5                     ;938AF1;
    db $08,$08 : dw $0009                                                ;938AF7;
    dw Instruction_SamusProjectile_GotoY                                 ;938AFB;
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_UpRight         ;938AFD;

InstList_SamusProjectile_SpazerWave_SpazerIceWave_Right:
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_29                    ;938AFF;
    db $08,$0C : dw $0000                                                ;938B03;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_2A                    ;938B05;
    db $08,$0C : dw $0001                                                ;938B0B;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_2B                    ;938B0D;
    db $08,$0C : dw $0002                                                ;938B13;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_2C                    ;938B15;
    db $08,$11 : dw $0003                                                ;938B1B;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_2D                    ;938B1D;
    db $08,$13 : dw $0004                                                ;938B23;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_2E                    ;938B25;
    db $08,$14 : dw $0005                                                ;938B2B;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_2D                    ;938B2D;
    db $08,$13 : dw $0006                                                ;938B33;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_2C                    ;938B35;
    db $08,$11 : dw $0007                                                ;938B3B;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_2B                    ;938B3D;
    db $08,$0C : dw $0008                                                ;938B43;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_2A                    ;938B45;
    db $08,$0C : dw $0009                                                ;938B4B;
    dw Instruction_SamusProjectile_GotoY                                 ;938B4F;
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Right           ;938B51;

InstList_SamusProjectile_SpazerWave_SpazerIceWave_DownRight:
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_6                     ;938B53;
    db $08,$08 : dw $0000                                                ;938B57;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_B                     ;938B59;
    db $08,$08 : dw $0001                                                ;938B5F;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_7                     ;938B61;
    db $0C,$0C : dw $0002                                                ;938B67;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_8                     ;938B69;
    db $10,$10 : dw $0003                                                ;938B6F;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_9                     ;938B71;
    db $10,$10 : dw $0004                                                ;938B77;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_A                     ;938B79;
    db $10,$10 : dw $0005                                                ;938B7F;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_9                     ;938B81;
    db $10,$10 : dw $0006                                                ;938B87;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_8                     ;938B89;
    db $10,$10 : dw $0007                                                ;938B8F;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_7                     ;938B91;
    db $0C,$0C : dw $0008                                                ;938B97;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_B                     ;938B99;
    db $08,$08 : dw $0009                                                ;938B9F;
    dw Instruction_SamusProjectile_GotoY                                 ;938BA3;
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_DownRight       ;938BA5;

InstList_SamusProjectile_SpazerWave_SpazerIceWave_Down:
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_17                    ;938BA7;
    db $0C,$08 : dw $0000                                                ;938BAB;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_18                    ;938BAD;
    db $0C,$08 : dw $0001                                                ;938BB3;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_19                    ;938BB5;
    db $0C,$08 : dw $0002                                                ;938BBB;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_1A                    ;938BBD;
    db $11,$08 : dw $0003                                                ;938BC3;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_1B                    ;938BC5;
    db $13,$08 : dw $0004                                                ;938BCB;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_1C                    ;938BCD;
    db $14,$08 : dw $0005                                                ;938BD3;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_1B                    ;938BD5;
    db $13,$08 : dw $0006                                                ;938BDB;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_1A                    ;938BDD;
    db $11,$08 : dw $0007                                                ;938BE3;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_19                    ;938BE5;
    db $0C,$08 : dw $0008                                                ;938BEB;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_18                    ;938BED;
    db $0C,$08 : dw $0009                                                ;938BF3;
    dw Instruction_SamusProjectile_GotoY                                 ;938BF7;
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Down            ;938BF9;

InstList_SamusProjectile_SpazerWave_SpazerIceWave_DownLeft:
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_C                     ;938BFB;
    db $08,$08 : dw $0000                                                ;938BFF;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_D                     ;938C01;
    db $08,$08 : dw $0001                                                ;938C07;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_E                     ;938C09;
    db $0C,$0C : dw $0002                                                ;938C0F;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_F                     ;938C11;
    db $10,$10 : dw $0003                                                ;938C17;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_10                    ;938C19;
    db $10,$10 : dw $0004                                                ;938C1F;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_10                    ;938C21;
    db $10,$10 : dw $0005                                                ;938C27;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_10                    ;938C29;
    db $10,$10 : dw $0006                                                ;938C2F;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_F                     ;938C31;
    db $10,$10 : dw $0007                                                ;938C37;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_E                     ;938C39;
    db $0C,$0C : dw $0008                                                ;938C3F;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_D                     ;938C41;
    db $08,$08 : dw $0009                                                ;938C47;
    dw Instruction_SamusProjectile_GotoY                                 ;938C4B;
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_DownLeft        ;938C4D;

InstList_SamusProjectile_SpazerWave_SpazerIceWave_Left:
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_1D                    ;938C4F;
    db $08,$0C : dw $0000                                                ;938C53;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_1E                    ;938C55;
    db $08,$0C : dw $0001                                                ;938C5B;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_1F                    ;938C5D;
    db $08,$0C : dw $0002                                                ;938C63;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_20                    ;938C65;
    db $08,$11 : dw $0003                                                ;938C6B;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_21                    ;938C6D;
    db $08,$13 : dw $0004                                                ;938C73;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_22                    ;938C75;
    db $08,$14 : dw $0005                                                ;938C7B;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_21                    ;938C7D;
    db $08,$13 : dw $0006                                                ;938C83;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_20                    ;938C85;
    db $08,$11 : dw $0007                                                ;938C8B;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_1F                    ;938C8D;
    db $08,$0C : dw $0008                                                ;938C93;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_1E                    ;938C95;
    db $08,$0C : dw $0009                                                ;938C9B;
    dw Instruction_SamusProjectile_GotoY                                 ;938C9F;
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Left            ;938CA1;

InstList_SamusProjectile_SpazerWave_SpazerIceWave_UpLeft:
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_11                    ;938CA3;
    db $08,$08 : dw $0000                                                ;938CA7;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_16                    ;938CA9;
    db $08,$08 : dw $0001                                                ;938CAF;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_12                    ;938CB1;
    db $0C,$0C : dw $0002                                                ;938CB7;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_13                    ;938CB9;
    db $10,$10 : dw $0003                                                ;938CBF;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_14                    ;938CC1;
    db $10,$10 : dw $0004                                                ;938CC7;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_15                    ;938CC9;
    db $10,$10 : dw $0005                                                ;938CCF;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_14                    ;938CD1;
    db $10,$10 : dw $0006                                                ;938CD7;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_13                    ;938CD9;
    db $10,$10 : dw $0007                                                ;938CDF;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_12                    ;938CE1;
    db $0C,$0C : dw $0008                                                ;938CE7;
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_16                    ;938CE9;
    db $08,$08 : dw $0009                                                ;938CEF;
    dw Instruction_SamusProjectile_GotoY                                 ;938CF3;
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_UpLeft          ;938CF5;

InstList_SamusProjectile_Plasma_PlasmaIce_Down_Up_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_4             ;938CF7;
    db $08,$10 : dw $0000                                                ;938CFB;

InstList_SamusProjectile_Plasma_PlasmaIce_Down_Up_1:
    dw $000F,ProjectileFlareSpritemaps_Plasma_PlasmaIce_2                ;938CFF;
    db $08,$10 : dw $0001                                                ;938D03;
    dw Instruction_SamusProjectile_GotoY                                 ;938D07;
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Down_Up_1               ;938D09;

InstList_SamusProjectile_Plasma_PlasmaIce_DownLeft_UpRight_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_C             ;938D0B;
    db $08,$08 : dw $0000                                                ;938D0F;

InstList_SamusProjectile_Plasma_PlasmaIce_DownLeft_UpRight_1:
    dw $000F,ProjectileFlareSpritemaps_Plasma_PlasmaIce_3                ;938D13;
    db $08,$08 : dw $0001                                                ;938D17;
    dw Instruction_SamusProjectile_GotoY                                 ;938D1B;
    dw InstList_SamusProjectile_Plasma_PlasmaIce_DownLeft_UpRight_1      ;938D1D;

InstList_SamusProjectile_Plasma_PlasmaIce_Left_Right_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_0             ;938D1F;
    db $08,$08 : dw $0000                                                ;938D23;

InstList_SamusProjectile_Plasma_PlasmaIce_Left_Right_1:
    dw $000F,ProjectileFlareSpritemaps_Plasma_PlasmaIce_0                ;938D27;
    db $10,$08 : dw $0001                                                ;938D2B;
    dw Instruction_SamusProjectile_GotoY                                 ;938D2F;
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Left_Right_1            ;938D31;

InstList_SamusProjectile_Plasma_PlasmaIce_DownRight_UpLeft_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_8             ;938D33;
    db $08,$08 : dw $0000                                                ;938D37;

InstList_SamusProjectile_Plasma_PlasmaIce_DownRight_UpLeft_1:
    dw $000F,ProjectileFlareSpritemaps_Plasma_PlasmaIce_1                ;938D3B;
    db $08,$08 : dw $0001                                                ;938D3F;
    dw Instruction_SamusProjectile_GotoY                                 ;938D43;
    dw InstList_SamusProjectile_Plasma_PlasmaIce_DownRight_UpLeft_1      ;938D45;

InstList_SamusProjectile_PlasmaIceWave_Down_Up:
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_4             ;938D47;
    db $0C,$10 : dw $0000                                                ;938D4B;

InstList_SamusProjectile_PlasmaWave_Down_Up:
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_14                 ;938D4F;
    db $0C,$10 : dw $0001                                                ;938D53;
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_15                 ;938D55;
    db $0C,$10 : dw $0002                                                ;938D5B;
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_16                 ;938D5D;
    db $11,$10 : dw $0003                                                ;938D63;
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_17                 ;938D65;
    db $13,$10 : dw $0004                                                ;938D6B;
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_18                 ;938D6D;
    db $14,$10 : dw $0005                                                ;938D73;
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_17                 ;938D75;
    db $13,$10 : dw $0006                                                ;938D7B;
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_16                 ;938D7D;
    db $11,$10 : dw $0007                                                ;938D83;
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_15                 ;938D85;
    db $0C,$10 : dw $0008                                                ;938D8B;
    dw Instruction_SamusProjectile_GotoY                                 ;938D8F;
    dw InstList_SamusProjectile_PlasmaWave_Down_Up                       ;938D91;

InstList_SamusProjectile_PlasmaIceWave_DownLeft_UpRight:
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_C             ;938D93;
    db $08,$08 : dw $0000                                                ;938D97;

InstList_SamusProjectile_PlasmaWave_DownLeft_UpRight:
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_32                 ;938D9B;
    db $08,$08 : dw $0001                                                ;938D9F;
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_33                 ;938DA1;
    db $0C,$0C : dw $0002                                                ;938DA7;
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_34                 ;938DA9;
    db $10,$10 : dw $0003                                                ;938DAF;
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_35                 ;938DB1;
    db $10,$10 : dw $0004                                                ;938DB7;
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_36                 ;938DB9;
    db $14,$14 : dw $0005                                                ;938DBF;
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_35                 ;938DC1;
    db $10,$10 : dw $0006                                                ;938DC7;
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_34                 ;938DC9;
    db $10,$10 : dw $0007                                                ;938DCF;
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_33                 ;938DD1;
    db $0C,$0C : dw $0008                                                ;938DD7;
    dw Instruction_SamusProjectile_GotoY                                 ;938DDB;
    dw InstList_SamusProjectile_PlasmaWave_DownLeft_UpRight              ;938DDD;

InstList_SamusProj_PlasmaWave_PlasmaIceWave_Left_Right_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_0             ;938DDF;
    db $08,$0C : dw $0000                                                ;938DE3;

InstList_SamusProj_PlasmaWave_PlasmaIceWave_Left_Right_1:
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_0                  ;938DE7;
    db $10,$0C : dw $0001                                                ;938DEB;
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_1                  ;938DED;
    db $10,$0C : dw $0002                                                ;938DF3;
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_2                  ;938DF5;
    db $10,$11 : dw $0003                                                ;938DFB;
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_3                  ;938DFD;
    db $10,$13 : dw $0004                                                ;938E03;
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_4                  ;938E05;
    db $10,$14 : dw $0005                                                ;938E0B;
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_3                  ;938E0D;
    db $10,$13 : dw $0006                                                ;938E13;
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_2                  ;938E15;
    db $10,$11 : dw $0007                                                ;938E1B;
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_1                  ;938E1D;
    db $10,$0C : dw $0008                                                ;938E23;
    dw Instruction_SamusProjectile_GotoY                                 ;938E27;
    dw InstList_SamusProj_PlasmaWave_PlasmaIceWave_Left_Right_1          ;938E29;

InstList_SamusProjectile_PlasmaIceWave_DownRight_UpLeft:
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_8             ;938E2B;
    db $08,$08 : dw $0000                                                ;938E2F;

InstList_SamusProjectile_PlasmaWave_DownRight_UpLeft:
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_A                  ;938E33;
    db $08,$08 : dw $0001                                                ;938E37;
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_B                  ;938E39;
    db $0C,$0C : dw $0002                                                ;938E3F;
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_C                  ;938E41;
    db $10,$10 : dw $0003                                                ;938E47;
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_D                  ;938E49;
    db $10,$10 : dw $0004                                                ;938E4F;
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_E                  ;938E51;
    db $14,$14 : dw $0005                                                ;938E57;
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_D                  ;938E59;
    db $10,$10 : dw $0006                                                ;938E5F;
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_C                  ;938E61;
    db $10,$10 : dw $0007                                                ;938E67;
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_B                  ;938E69;
    db $0C,$0C : dw $0008                                                ;938E6F;
    dw Instruction_SamusProjectile_GotoY                                 ;938E73;
    dw InstList_SamusProjectile_PlasmaWave_DownRight_UpLeft              ;938E75;

InstList_SamusProjectile_Charged_Power_Up:
    dw $0001,ProjectileFlareSpritemaps_Charged_Power_2                   ;938E77;
    db $08,$08 : dw $0000                                                ;938E7B;
    dw $0001,ProjectileFlareSpritemaps_Charged_Power_A                   ;938E7D;
    db $08,$08 : dw $0001                                                ;938E83;
    dw Instruction_SamusProjectile_GotoY                                 ;938E87;
    dw InstList_SamusProjectile_Charged_Power_Up                         ;938E89;

InstList_SamusProjectile_Charged_Power_UpRight:
    dw $0001,ProjectileFlareSpritemaps_Charged_Power_3                   ;938E8B;
    db $08,$08 : dw $0000                                                ;938E8F;
    dw $0001,ProjectileFlareSpritemaps_Charged_Power_B                   ;938E91;
    db $08,$08 : dw $0001                                                ;938E97;
    dw Instruction_SamusProjectile_GotoY                                 ;938E9B;
    dw InstList_SamusProjectile_Charged_Power_UpRight                    ;938E9D;

InstList_SamusProjectile_Charged_Power_Right:
    dw $0001,ProjectileFlareSpritemaps_Charged_Power_4                   ;938E9F;
    db $08,$08 : dw $0000                                                ;938EA3;
    dw $0001,ProjectileFlareSpritemaps_Charged_Power_C                   ;938EA5;
    db $08,$08 : dw $0001                                                ;938EAB;
    dw Instruction_SamusProjectile_GotoY                                 ;938EAF;
    dw InstList_SamusProjectile_Charged_Power_Right                      ;938EB1;

InstList_SamusProjectile_Charged_Power_DownRight:
    dw $0001,ProjectileFlareSpritemaps_Charged_Power_5                   ;938EB3;
    db $08,$08 : dw $0000                                                ;938EB7;
    dw $0001,ProjectileFlareSpritemaps_Charged_Power_D                   ;938EB9;
    db $08,$08 : dw $0001                                                ;938EBF;
    dw Instruction_SamusProjectile_GotoY                                 ;938EC3;
    dw InstList_SamusProjectile_Charged_Power_DownRight                  ;938EC5;

InstList_SamusProjectile_Charged_Power_Down:
    dw $0001,ProjectileFlareSpritemaps_Charged_Power_6                   ;938EC7;
    db $08,$08 : dw $0000                                                ;938ECB;
    dw $0001,ProjectileFlareSpritemaps_Charged_Power_E                   ;938ECD;
    db $08,$08 : dw $0001                                                ;938ED3;
    dw Instruction_SamusProjectile_GotoY                                 ;938ED7;
    dw InstList_SamusProjectile_Charged_Power_Down                       ;938ED9;

InstList_SamusProjectile_Charged_Power_DownLeft:
    dw $0001,ProjectileFlareSpritemaps_Charged_Power_7                   ;938EDB;
    db $08,$08 : dw $0000                                                ;938EDF;
    dw $0001,ProjectileFlareSpritemaps_Charged_Power_F                   ;938EE1;
    db $08,$08 : dw $0001                                                ;938EE7;
    dw Instruction_SamusProjectile_GotoY                                 ;938EEB;
    dw InstList_SamusProjectile_Charged_Power_DownLeft                   ;938EED;

InstList_SamusProjectile_Charged_Power_Left:
    dw $0001,ProjectileFlareSpritemaps_Charged_Power_0                   ;938EEF;
    db $08,$08 : dw $0000                                                ;938EF3;
    dw $0001,ProjectileFlareSpritemaps_Charged_Power_8                   ;938EF5;
    db $08,$08 : dw $0001                                                ;938EFB;
    dw Instruction_SamusProjectile_GotoY                                 ;938EFF;
    dw InstList_SamusProjectile_Charged_Power_Left                       ;938F01;

InstList_SamusProjectile_Charged_Power_UpLeft:
    dw $0001,ProjectileFlareSpritemaps_Charged_Power_1                   ;938F03;
    db $08,$08 : dw $0000                                                ;938F07;
    dw $0001,ProjectileFlareSpritemaps_Charged_Power_9                   ;938F09;
    db $08,$08 : dw $0001                                                ;938F0F;
    dw Instruction_SamusProjectile_GotoY                                 ;938F13;
    dw InstList_SamusProjectile_Charged_Power_UpLeft                     ;938F15;

InstList_SamusProjectile_Charged_Wave_Up:
    dw $0003,Spritemap_Nothing_93A117                                    ;938F17;
    db $0C,$08 : dw $0000                                                ;938F1B;

InstList_SamusProjectile_Charged_Wave_Down:
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_0             ;938F1F;
    db $0C,$08 : dw $0000                                                ;938F23;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1            ;938F25;
    db $0C,$08 : dw $0001                                                ;938F2B;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1A            ;938F2D;
    db $10,$08 : dw $0002                                                ;938F33;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1B            ;938F35;
    db $10,$08 : dw $0003                                                ;938F3B;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1C            ;938F3D;
    db $14,$08 : dw $0004                                                ;938F43;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1D            ;938F45;
    db $14,$08 : dw $0005                                                ;938F4B;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1E            ;938F4D;
    db $17,$08 : dw $0006                                                ;938F53;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1F            ;938F55;
    db $17,$08 : dw $0007                                                ;938F5B;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_20            ;938F5D;
    db $18,$08 : dw $0008                                                ;938F63;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_21            ;938F65;
    db $18,$08 : dw $0009                                                ;938F6B;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1E            ;938F6D;
    db $17,$08 : dw $000A                                                ;938F73;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1F            ;938F75;
    db $17,$08 : dw $000B                                                ;938F7B;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1C            ;938F7D;
    db $14,$08 : dw $000C                                                ;938F83;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1D            ;938F85;
    db $14,$08 : dw $000D                                                ;938F8B;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1B            ;938F8D;
    db $10,$08 : dw $000E                                                ;938F93;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1A            ;938F95;
    db $10,$08 : dw $000F                                                ;938F9B;
    dw Instruction_SamusProjectile_GotoY                                 ;938F9F;
    dw InstList_SamusProjectile_Charged_Wave_Down                        ;938FA1;

InstList_SamusProjectile_Charged_Wave_DownLeft_UpRight:
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_0             ;938FA3;
    db $08,$08 : dw $0000                                                ;938FA7;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1             ;938FA9;
    db $08,$08 : dw $0001                                                ;938FAF;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_12            ;938FB1;
    db $0C,$0C : dw $0002                                                ;938FB7;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_13            ;938FB9;
    db $0C,$0C : dw $0003                                                ;938FBF;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_14            ;938FC1;
    db $10,$10 : dw $0004                                                ;938FC7;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_15            ;938FC9;
    db $10,$10 : dw $0005                                                ;938FCF;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_16            ;938FD1;
    db $11,$11 : dw $0006                                                ;938FD7;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_17            ;938FD9;
    db $11,$11 : dw $0007                                                ;938FDF;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_18            ;938FE1;
    db $12,$12 : dw $0008                                                ;938FE7;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_19            ;938FE9;
    db $12,$12 : dw $0009                                                ;938FEF;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_16            ;938FF1;
    db $11,$11 : dw $000A                                                ;938FF7;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_17            ;938FF9;
    db $11,$11 : dw $000B                                                ;938FFF;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_14            ;939001;
    db $10,$10 : dw $000C                                                ;939007;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_15            ;939009;
    db $10,$10 : dw $000D                                                ;93900F;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_12            ;939011;
    db $0C,$0C : dw $000E                                                ;939017;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_13            ;939019;
    db $0C,$0C : dw $000F                                                ;93901F;
    dw Instruction_SamusProjectile_GotoY                                 ;939023;
    dw InstList_SamusProjectile_Charged_Wave_DownLeft_UpRight            ;939025;

InstList_SamusProjectile_Charged_Wave_Left_Right:
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_0             ;939027;
    db $08,$0C : dw $0000                                                ;93902B;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1             ;93902D;
    db $08,$0C : dw $0001                                                ;939033;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_2             ;939035;
    db $08,$10 : dw $0002                                                ;93903B;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_3             ;93903D;
    db $08,$10 : dw $0003                                                ;939043;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_4             ;939045;
    db $08,$14 : dw $0004                                                ;93904B;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_5             ;93904D;
    db $08,$14 : dw $0005                                                ;939053;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_6             ;939055;
    db $08,$17 : dw $0006                                                ;93905B;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_7             ;93905D;
    db $08,$17 : dw $0007                                                ;939063;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_8             ;939065;
    db $08,$18 : dw $0008                                                ;93906B;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_9             ;93906D;
    db $08,$18 : dw $0009                                                ;939073;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_6             ;939075;
    db $08,$17 : dw $000A                                                ;93907B;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_7             ;93907D;
    db $08,$17 : dw $000B                                                ;939083;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_4             ;939085;
    db $08,$14 : dw $000C                                                ;93908B;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_5             ;93908D;
    db $08,$14 : dw $000D                                                ;939093;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_3             ;939095;
    db $08,$10 : dw $000E                                                ;93909B;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_2             ;93909D;
    db $08,$10 : dw $000F                                                ;9390A3;
    dw Instruction_SamusProjectile_GotoY                                 ;9390A7;
    dw InstList_SamusProjectile_Charged_Wave_Left_Right                  ;9390A9;

InstList_SamusProjectile_Charged_Wave_DownRight_UpLeft:
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_0             ;9390AB;
    db $08,$08 : dw $0000                                                ;9390AF;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1             ;9390B1;
    db $08,$08 : dw $0001                                                ;9390B7;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_A             ;9390B9;
    db $0C,$0C : dw $0002                                                ;9390BF;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_B             ;9390C1;
    db $0C,$0C : dw $0003                                                ;9390C7;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_C             ;9390C9;
    db $10,$10 : dw $0004                                                ;9390CF;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_D             ;9390D1;
    db $10,$10 : dw $0005                                                ;9390D7;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_E             ;9390D9;
    db $11,$11 : dw $0006                                                ;9390DF;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_F             ;9390E1;
    db $11,$11 : dw $0007                                                ;9390E7;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_10            ;9390E9;
    db $12,$12 : dw $0008                                                ;9390EF;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_11            ;9390F1;
    db $12,$12 : dw $0009                                                ;9390F7;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_E             ;9390F9;
    db $11,$11 : dw $000A                                                ;9390FF;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_F             ;939101;
    db $11,$11 : dw $000B                                                ;939107;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_C             ;939109;
    db $10,$10 : dw $000C                                                ;93910F;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_D             ;939111;
    db $10,$10 : dw $000D                                                ;939117;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_A             ;939119;
    db $0C,$0C : dw $000E                                                ;93911F;
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_B             ;939121;
    db $0C,$0C : dw $000F                                                ;939127;
    dw Instruction_SamusProjectile_GotoY                                 ;93912B;
    dw InstList_SamusProjectile_Charged_Wave_DownRight_UpLeft            ;93912D;

InstList_SamusProjectile_Charged_Ice:
    dw $0001,ProjectileFlareSpritemaps_Charged_Ice_0                     ;93912F;
    db $08,$08 : dw $0000                                                ;939133;
    dw $0001,ProjectileFlareSpritemaps_Charged_Ice_1                     ;939135;
    db $08,$08 : dw $0001                                                ;93913B;
    dw $0001,ProjectileFlareSpritemaps_Charged_Ice_2                     ;93913D;
    db $08,$08 : dw $0002                                                ;939143;
    dw $0001,ProjectileFlareSpritemaps_Charged_Ice_3                     ;939145;
    db $08,$08 : dw $0003                                                ;93914B;
    dw Instruction_SamusProjectile_GotoY                                 ;93914F;
    dw InstList_SamusProjectile_Charged_Ice                              ;939151;

InstList_SamusProjectile_Charged_IW_Up:
    dw $0003,Spritemap_Nothing_93A117                                    ;939153;
    db $0C,$08 : dw $0000                                                ;939157;

InstList_SamusProjectile_Charged_IW_Down:
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_0                  ;93915B;
    db $0C,$08 : dw $0000                                                ;93915F;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_1                  ;939161;
    db $0C,$08 : dw $0001                                                ;939167;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_1C                 ;939169;
    db $10,$08 : dw $0002                                                ;93916F;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_1D                 ;939171;
    db $10,$08 : dw $0003                                                ;939177;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_1E                 ;939179;
    db $14,$08 : dw $0004                                                ;93917F;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_1F                 ;939181;
    db $14,$08 : dw $0005                                                ;939187;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_20                 ;939189;
    db $17,$08 : dw $0006                                                ;93918F;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_21                 ;939191;
    db $17,$08 : dw $0007                                                ;939197;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_22                 ;939199;
    db $18,$08 : dw $0008                                                ;93919F;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_23                 ;9391A1;
    db $18,$08 : dw $0009                                                ;9391A7;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_20                 ;9391A9;
    db $17,$08 : dw $000A                                                ;9391AF;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_21                 ;9391B1;
    db $17,$08 : dw $000B                                                ;9391B7;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_1E                 ;9391B9;
    db $14,$08 : dw $000C                                                ;9391BF;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_1F                 ;9391C1;
    db $14,$08 : dw $000D                                                ;9391C7;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_1D                 ;9391C9;
    db $10,$08 : dw $000E                                                ;9391CF;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_1C                 ;9391D1;
    db $10,$08 : dw $000F                                                ;9391D7;
    dw Instruction_SamusProjectile_GotoY                                 ;9391DB;
    dw InstList_SamusProjectile_Charged_IW_Down                          ;9391DD;

InstList_SamusProjectile_Charged_IW_DownLeft_UpRight:
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_0                  ;9391DF;
    db $08,$08 : dw $0000                                                ;9391E3;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_1                  ;9391E5;
    db $08,$08 : dw $0001                                                ;9391EB;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_12                 ;9391ED;
    db $0C,$0C : dw $0002                                                ;9391F3;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_13                 ;9391F5;
    db $0C,$0C : dw $0003                                                ;9391FB;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_14                 ;9391FD;
    db $10,$10 : dw $0004                                                ;939203;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_15                 ;939205;
    db $10,$10 : dw $0005                                                ;93920B;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_16                 ;93920D;
    db $11,$11 : dw $0006                                                ;939213;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_17                 ;939215;
    db $11,$11 : dw $0007                                                ;93921B;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_18                 ;93921D;
    db $12,$12 : dw $0008                                                ;939223;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_19                 ;939225;
    db $12,$12 : dw $0009                                                ;93922B;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_16                 ;93922D;
    db $11,$11 : dw $000A                                                ;939233;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_17                 ;939235;
    db $11,$11 : dw $000B                                                ;93923B;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_14                 ;93923D;
    db $10,$10 : dw $000C                                                ;939243;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_15                 ;939245;
    db $10,$10 : dw $000D                                                ;93924B;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_12                 ;93924D;
    db $0C,$0C : dw $000E                                                ;939253;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_13                 ;939255;
    db $0C,$0C : dw $000F                                                ;93925B;
    dw Instruction_SamusProjectile_GotoY                                 ;93925F;
    dw InstList_SamusProjectile_Charged_IW_DownLeft_UpRight              ;939261;

InstList_SamusProjectile_Charged_IW_Left_Right:
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_0                  ;939263;
    db $08,$0C : dw $0000                                                ;939267;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_1                  ;939269;
    db $08,$0C : dw $0001                                                ;93926F;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_2                  ;939271;
    db $08,$10 : dw $0002                                                ;939277;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_3                  ;939279;
    db $08,$10 : dw $0003                                                ;93927F;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_4                  ;939281;
    db $08,$14 : dw $0004                                                ;939287;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_5                  ;939289;
    db $08,$14 : dw $0005                                                ;93928F;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_6                  ;939291;
    db $08,$17 : dw $0006                                                ;939297;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_7                  ;939299;
    db $08,$17 : dw $0007                                                ;93929F;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_8                  ;9392A1;
    db $08,$18 : dw $0008                                                ;9392A7;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_9                  ;9392A9;
    db $08,$18 : dw $0009                                                ;9392AF;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_6                  ;9392B1;
    db $08,$17 : dw $000A                                                ;9392B7;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_7                  ;9392B9;
    db $08,$17 : dw $000B                                                ;9392BF;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_4                  ;9392C1;
    db $08,$14 : dw $000C                                                ;9392C7;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_5                  ;9392C9;
    db $08,$14 : dw $000D                                                ;9392CF;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_3                  ;9392D1;
    db $08,$10 : dw $000E                                                ;9392D7;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_2                  ;9392D9;
    db $08,$10 : dw $000F                                                ;9392DF;
    dw Instruction_SamusProjectile_GotoY                                 ;9392E3;
    dw InstList_SamusProjectile_Charged_IW_Left_Right                    ;9392E5;

InstList_SamusProjectile_Charged_IW_DownRight_UpLeft:
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_0                  ;9392E7;
    db $08,$08 : dw $0000                                                ;9392EB;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_1                  ;9392ED;
    db $08,$08 : dw $0001                                                ;9392F3;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_A                  ;9392F5;
    db $0C,$0C : dw $0002                                                ;9392FB;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_B                  ;9392FD;
    db $0C,$0C : dw $0003                                                ;939303;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_C                  ;939305;
    db $10,$10 : dw $0004                                                ;93930B;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_D                  ;93930D;
    db $10,$10 : dw $0005                                                ;939313;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_E                  ;939315;
    db $11,$11 : dw $0006                                                ;93931B;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_F                  ;93931D;
    db $11,$11 : dw $0007                                                ;939323;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_10                 ;939325;
    db $12,$12 : dw $0008                                                ;93932B;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_11                 ;93932D;
    db $12,$12 : dw $0009                                                ;939333;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_E                  ;939335;
    db $11,$11 : dw $000A                                                ;93933B;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_F                  ;93933D;
    db $11,$11 : dw $000B                                                ;939343;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_C                  ;939345;
    db $10,$10 : dw $000C                                                ;93934B;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_D                  ;93934D;
    db $10,$10 : dw $000D                                                ;939353;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_A                  ;939355;
    db $0C,$0C : dw $000E                                                ;93935B;
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_B                  ;93935D;
    db $0C,$0C : dw $000F                                                ;939363;
    dw Instruction_SamusProjectile_GotoY                                 ;939367;
    dw InstList_SamusProjectile_Charged_IW_DownRight_UpLeft              ;939369;

InstList_SamusProjectile_Charged_S_SI_Down_Up_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4C            ;93936B;
    db $0C,$08 : dw $0000                                                ;93936F;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5B            ;939371;
    db $0C,$08 : dw $0001                                                ;939377;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4D            ;939379;
    db $0C,$08 : dw $0002                                                ;93937F;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5C            ;939381;
    db $0C,$08 : dw $0003                                                ;939387;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3C            ;939389;
    db $0C,$10 : dw $0004                                                ;93938F;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_6             ;939391;
    db $0C,$10 : dw $0005                                                ;939397;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3E            ;939399;
    db $0C,$10 : dw $0006                                                ;93939F;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_8             ;9393A1;
    db $0C,$10 : dw $0007                                                ;9393A7;

InstList_SamusProjectile_Charged_S_SI_Down_Up_1:
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_41            ;9393AB;
    db $14,$10 : dw $0008                                                ;9393AF;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_B             ;9393B1;
    db $14,$10 : dw $0009                                                ;9393B7;
    dw Instruction_SamusProjectile_GotoY                                 ;9393BB;
    dw InstList_SamusProjectile_Charged_S_SI_Down_Up_1                   ;9393BD;

InstList_SamusProjectile_Charged_S_SI_DownLeft_UpRight_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4E            ;9393BF;
    db $08,$08 : dw $0000                                                ;9393C3;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5D            ;9393C5;
    db $08,$08 : dw $0001                                                ;9393CB;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4F            ;9393CD;
    db $08,$08 : dw $0002                                                ;9393D3;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5E            ;9393D5;
    db $08,$08 : dw $0003                                                ;9393DB;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_18            ;9393DD;
    db $0C,$0C : dw $0004                                                ;9393E3;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_12            ;9393E5;
    db $0C,$0C : dw $0005                                                ;9393EB;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_19            ;9393ED;
    db $10,$10 : dw $0006                                                ;9393F3;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_14            ;9393F5;
    db $10,$10 : dw $0007                                                ;9393FB;

InstList_SamusProjectile_Charged_S_SI_DownLeft_UpRight_1:
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1C            ;9393FF;
    db $14,$14 : dw $0008                                                ;939403;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_17            ;939405;
    db $14,$14 : dw $0009                                                ;93940B;
    dw Instruction_SamusProjectile_GotoY                                 ;93940F;
    dw InstList_SamusProjectile_Charged_S_SI_DownLeft_UpRight_1          ;939411;

InstList_SamusProjectile_Charged_S_SI_Left_Right_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_51            ;939413;
    db $08,$0C : dw $0000                                                ;939417;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_57            ;939419;
    db $08,$0C : dw $0001                                                ;93941F;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_52            ;939421;
    db $08,$0C : dw $0002                                                ;939427;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_58            ;939429;
    db $08,$0C : dw $0003                                                ;93942F;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_36            ;939431;
    db $10,$0C : dw $0004                                                ;939437;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_0             ;939439;
    db $10,$0C : dw $0005                                                ;93943F;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_38            ;939441;
    db $10,$0C : dw $0006                                                ;939447;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2             ;939449;
    db $10,$0C : dw $0007                                                ;93944F;

InstList_SamusProjectile_Charged_S_SI_Left_Right_1:
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3B            ;939453;
    db $10,$14 : dw $0008                                                ;939457;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5             ;939459;
    db $10,$14 : dw $0009                                                ;93945F;
    dw Instruction_SamusProjectile_GotoY                                 ;939463;
    dw InstList_SamusProjectile_Charged_S_SI_Left_Right_1                ;939465;

InstList_SamusProjectile_Charged_S_SI_DownRight_UpLeft_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_53            ;939467;
    db $08,$08 : dw $0000                                                ;93946B;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_59            ;93946D;
    db $08,$08 : dw $0001                                                ;939473;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_54            ;939475;
    db $08,$08 : dw $0002                                                ;93947B;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5A            ;93947D;
    db $08,$08 : dw $0003                                                ;939483;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1E            ;939485;
    db $0C,$0C : dw $0004                                                ;93948B;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_C             ;93948D;
    db $0C,$0C : dw $0005                                                ;939493;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1F            ;939495;
    db $10,$10 : dw $0006                                                ;93949B;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_E             ;93949D;
    db $10,$10 : dw $0007                                                ;9394A3;

InstList_SamusProjectile_Charged_S_SI_DownRight_UpLeft_1:
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_22            ;9394A7;
    db $14,$14 : dw $0008                                                ;9394AB;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_11            ;9394AD;
    db $14,$14 : dw $0009                                                ;9394B3;
    dw Instruction_SamusProjectile_GotoY                                 ;9394B7;
    dw InstList_SamusProjectile_Charged_S_SI_DownRight_UpLeft_1          ;9394B9;

InstList_SamusProjectile_Charged_SW_SIW_Up_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4C            ;9394BB;
    db $0C,$08 : dw $0000                                                ;9394BF;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5B            ;9394C1;
    db $0C,$08 : dw $0001                                                ;9394C7;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4D            ;9394C9;
    db $0C,$08 : dw $0002                                                ;9394CF;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5C            ;9394D1;
    db $0C,$08 : dw $0003                                                ;9394D7;

InstList_SamusProjectile_Charged_SW_SIW_Up_1:
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3C            ;9394DB;
    db $0C,$10 : dw $0004                                                ;9394DF;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_6             ;9394E1;
    db $0C,$10 : dw $0005                                                ;9394E7;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3D            ;9394E9;
    db $0C,$10 : dw $0006                                                ;9394EF;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_7             ;9394F1;
    db $0C,$10 : dw $0007                                                ;9394F7;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3E            ;9394F9;
    db $0C,$10 : dw $0008                                                ;9394FF;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_8             ;939501;
    db $0C,$10 : dw $0009                                                ;939507;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3F            ;939509;
    db $10,$10 : dw $000A                                                ;93950F;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_9             ;939511;
    db $10,$10 : dw $000B                                                ;939517;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_40            ;939519;
    db $12,$10 : dw $000C                                                ;93951F;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_A             ;939521;
    db $12,$10 : dw $000D                                                ;939527;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_41            ;939529;
    db $14,$10 : dw $000E                                                ;93952F;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_B             ;939531;
    db $14,$10 : dw $000F                                                ;939537;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_40            ;939539;
    db $12,$10 : dw $0010                                                ;93953F;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_A             ;939541;
    db $12,$10 : dw $0011                                                ;939547;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3F            ;939549;
    db $10,$10 : dw $0012                                                ;93954F;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_9             ;939551;
    db $10,$10 : dw $0013                                                ;939557;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3E            ;939559;
    db $0C,$10 : dw $0014                                                ;93955F;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_8             ;939561;
    db $0C,$10 : dw $0015                                                ;939567;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3D            ;939569;
    db $08,$10 : dw $0016                                                ;93956F;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_7             ;939571;
    db $08,$10 : dw $0017                                                ;939577;
    dw Instruction_SamusProjectile_GotoY                                 ;93957B;
    dw InstList_SamusProjectile_Charged_SW_SIW_Up_1                      ;93957D;

InstList_SamusProjectile_Charged_SW_SIW_UpRight_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4E            ;93957F;
    db $08,$08 : dw $0000                                                ;939583;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5D            ;939585;
    db $08,$08 : dw $0001                                                ;93958B;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4F            ;93958D;
    db $08,$08 : dw $0002                                                ;939593;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5E            ;939595;
    db $08,$08 : dw $0003                                                ;93959B;

InstList_SamusProjectile_Charged_SW_SIW_UpRight_1:
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_18            ;93959F;
    db $0C,$0C : dw $0004                                                ;9395A3;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_12            ;9395A5;
    db $0C,$0C : dw $0005                                                ;9395AB;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1D            ;9395AD;
    db $0C,$0C : dw $0006                                                ;9395B3;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_13            ;9395B5;
    db $0C,$0C : dw $0007                                                ;9395BB;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_19            ;9395BD;
    db $10,$10 : dw $0008                                                ;9395C3;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_14            ;9395C5;
    db $10,$10 : dw $0009                                                ;9395CB;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1A            ;9395CD;
    db $10,$10 : dw $000A                                                ;9395D3;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_15            ;9395D5;
    db $10,$10 : dw $000B                                                ;9395DB;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1B            ;9395DD;
    db $10,$10 : dw $000C                                                ;9395E3;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_16            ;9395E5;
    db $10,$10 : dw $000D                                                ;9395EB;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1C            ;9395ED;
    db $14,$14 : dw $000E                                                ;9395F3;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_17            ;9395F5;
    db $14,$14 : dw $000F                                                ;9395FB;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1B            ;9395FD;
    db $10,$10 : dw $0010                                                ;939603;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_16            ;939605;
    db $10,$10 : dw $0011                                                ;93960B;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1A            ;93960D;
    db $10,$10 : dw $0012                                                ;939613;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_15            ;939615;
    db $10,$10 : dw $0013                                                ;93961B;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_19            ;93961D;
    db $10,$10 : dw $0014                                                ;939623;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_14            ;939625;
    db $10,$10 : dw $0015                                                ;93962B;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1D            ;93962D;
    db $0C,$0C : dw $0016                                                ;939633;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_13            ;939635;
    db $0C,$0C : dw $0017                                                ;93963B;
    dw Instruction_SamusProjectile_GotoY                                 ;93963F;
    dw InstList_SamusProjectile_Charged_SW_SIW_UpRight_1                 ;939641;

InstList_SamusProjectile_Charged_SW_SIW_Right_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_51            ;939643;
    db $08,$0C : dw $0000                                                ;939647;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_57            ;939649;
    db $08,$0C : dw $0001                                                ;93964F;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_52            ;939651;
    db $08,$0C : dw $0002                                                ;939657;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_58            ;939659;
    db $08,$0C : dw $0003                                                ;93965F;

InstList_SamusProjectile_Charged_SW_SIW_Right_1:
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_42            ;939663;
    db $10,$0C : dw $0004                                                ;939667;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_0             ;939669;
    db $10,$0C : dw $0005                                                ;93966F;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_43            ;939671;
    db $10,$0C : dw $0006                                                ;939677;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1             ;939679;
    db $10,$0C : dw $0007                                                ;93967F;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_44            ;939681;
    db $10,$0C : dw $0008                                                ;939687;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2             ;939689;
    db $10,$0C : dw $0009                                                ;93968F;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_45            ;939691;
    db $10,$10 : dw $000A                                                ;939697;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3             ;939699;
    db $10,$10 : dw $000B                                                ;93969F;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_46            ;9396A1;
    db $10,$12 : dw $000C                                                ;9396A7;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4             ;9396A9;
    db $10,$12 : dw $000D                                                ;9396AF;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_47            ;9396B1;
    db $10,$14 : dw $000E                                                ;9396B7;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5             ;9396B9;
    db $10,$14 : dw $000F                                                ;9396BF;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_46            ;9396C1;
    db $10,$12 : dw $0010                                                ;9396C7;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4             ;9396C9;
    db $10,$12 : dw $0011                                                ;9396CF;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_45            ;9396D1;
    db $10,$10 : dw $0012                                                ;9396D7;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3             ;9396D9;
    db $10,$10 : dw $0013                                                ;9396DF;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_44            ;9396E1;
    db $10,$0C : dw $0014                                                ;9396E7;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2             ;9396E9;
    db $10,$0C : dw $0015                                                ;9396EF;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_43            ;9396F1;
    db $10,$08 : dw $0016                                                ;9396F7;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1             ;9396F9;
    db $10,$08 : dw $0017                                                ;9396FF;
    dw Instruction_SamusProjectile_GotoY                                 ;939703;
    dw InstList_SamusProjectile_Charged_SW_SIW_Right_1                   ;939705;

InstList_SamusProjectile_Charged_SW_SIW_DownRight_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_53            ;939707;
    db $08,$08 : dw $0000                                                ;93970B;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_59            ;93970D;
    db $08,$08 : dw $0001                                                ;939713;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_54            ;939715;
    db $08,$08 : dw $0002                                                ;93971B;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5A            ;93971D;
    db $08,$08 : dw $0003                                                ;939723;

InstList_SamusProjectile_Charged_SW_SIW_DownRight_1:
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1E            ;939727;
    db $0C,$0C : dw $0004                                                ;93972B;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_C             ;93972D;
    db $0C,$0C : dw $0005                                                ;939733;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_23            ;939735;
    db $0C,$0C : dw $0006                                                ;93973B;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_D             ;93973D;
    db $0C,$0C : dw $0007                                                ;939743;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1F            ;939745;
    db $10,$10 : dw $0008                                                ;93974B;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_E             ;93974D;
    db $10,$10 : dw $0009                                                ;939753;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_20            ;939755;
    db $10,$10 : dw $000A                                                ;93975B;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_F             ;93975D;
    db $10,$10 : dw $000B                                                ;939763;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_21            ;939765;
    db $10,$10 : dw $000C                                                ;93976B;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_10            ;93976D;
    db $10,$10 : dw $000D                                                ;939773;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_22            ;939775;
    db $14,$14 : dw $000E                                                ;93977B;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_11            ;93977D;
    db $14,$14 : dw $000F                                                ;939783;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_21            ;939785;
    db $10,$10 : dw $0010                                                ;93978B;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_10            ;93978D;
    db $10,$10 : dw $0011                                                ;939793;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_20            ;939795;
    db $10,$10 : dw $0012                                                ;93979B;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_F             ;93979D;
    db $10,$10 : dw $0013                                                ;9397A3;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1F            ;9397A5;
    db $10,$10 : dw $0014                                                ;9397AB;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_E             ;9397AD;
    db $10,$10 : dw $0015                                                ;9397B3;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_23            ;9397B5;
    db $0C,$0C : dw $0016                                                ;9397BB;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_D             ;9397BD;
    db $0C,$0C : dw $0017                                                ;9397C3;
    dw Instruction_SamusProjectile_GotoY                                 ;9397C7;
    dw InstList_SamusProjectile_Charged_SW_SIW_DownRight_1               ;9397C9;

InstList_SamusProjectile_Charged_SW_SIW_Down_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_55            ;9397CB;
    db $0C,$08 : dw $0000                                                ;9397CF;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5B            ;9397D1;
    db $0C,$08 : dw $0001                                                ;9397D7;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_56            ;9397D9;
    db $0C,$08 : dw $0002                                                ;9397DF;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5C            ;9397E1;
    db $0C,$08 : dw $0003                                                ;9397E7;

InstList_SamusProjectile_Charged_SW_SIW_Down_1:
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_30            ;9397EB;
    db $0C,$10 : dw $0004                                                ;9397EF;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_6             ;9397F1;
    db $0C,$10 : dw $0005                                                ;9397F7;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_31            ;9397F9;
    db $0C,$10 : dw $0006                                                ;9397FF;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_7             ;939801;
    db $0C,$10 : dw $0007                                                ;939807;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_32            ;939809;
    db $0C,$10 : dw $0008                                                ;93980F;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_8             ;939811;
    db $0C,$10 : dw $0009                                                ;939817;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_33            ;939819;
    db $10,$10 : dw $000A                                                ;93981F;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_9             ;939821;
    db $10,$10 : dw $000B                                                ;939827;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_34            ;939829;
    db $12,$10 : dw $000C                                                ;93982F;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_A             ;939831;
    db $12,$10 : dw $000D                                                ;939837;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_35            ;939839;
    db $14,$10 : dw $000E                                                ;93983F;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_B             ;939841;
    db $14,$10 : dw $000F                                                ;939847;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_34            ;939849;
    db $12,$10 : dw $0010                                                ;93984F;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_A             ;939851;
    db $12,$10 : dw $0011                                                ;939857;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_33            ;939859;
    db $10,$10 : dw $0012                                                ;93985F;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_9             ;939861;
    db $10,$10 : dw $0013                                                ;939867;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_32            ;939869;
    db $0C,$10 : dw $0014                                                ;93986F;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_8             ;939871;
    db $0C,$10 : dw $0015                                                ;939877;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_31            ;939879;
    db $08,$10 : dw $0016                                                ;93987F;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_7             ;939881;
    db $08,$10 : dw $0017                                                ;939887;
    dw Instruction_SamusProjectile_GotoY                                 ;93988B;
    dw InstList_SamusProjectile_Charged_SW_SIW_Down_1                    ;93988D;

InstList_SamusProjectile_Charged_SW_SIW_DownLeft_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4E            ;93988F;
    db $08,$08 : dw $0000                                                ;939893;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5D            ;939895;
    db $08,$08 : dw $0001                                                ;93989B;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4F            ;93989D;
    db $08,$08 : dw $0002                                                ;9398A3;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5E            ;9398A5;
    db $08,$08 : dw $0003                                                ;9398AB;

InstList_SamusProjectile_Charged_SW_SIW_DownLeft_1:
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_24            ;9398AF;
    db $0C,$0C : dw $0004                                                ;9398B3;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_12            ;9398B5;
    db $0C,$0C : dw $0005                                                ;9398BB;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_29            ;9398BD;
    db $0C,$0C : dw $0006                                                ;9398C3;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_13            ;9398C5;
    db $0C,$0C : dw $0007                                                ;9398CB;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_25            ;9398CD;
    db $10,$10 : dw $0008                                                ;9398D3;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_14            ;9398D5;
    db $10,$10 : dw $0009                                                ;9398DB;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_26            ;9398DD;
    db $10,$10 : dw $000A                                                ;9398E3;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_15            ;9398E5;
    db $10,$10 : dw $000B                                                ;9398EB;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_27            ;9398ED;
    db $10,$10 : dw $000C                                                ;9398F3;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_16            ;9398F5;
    db $10,$10 : dw $000D                                                ;9398FB;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_28            ;9398FD;
    db $14,$14 : dw $000E                                                ;939903;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_17            ;939905;
    db $14,$14 : dw $000F                                                ;93990B;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_27            ;93990D;
    db $10,$10 : dw $0010                                                ;939913;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_16            ;939915;
    db $10,$10 : dw $0011                                                ;93991B;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_26            ;93991D;
    db $10,$10 : dw $0012                                                ;939923;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_15            ;939925;
    db $10,$10 : dw $0013                                                ;93992B;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_25            ;93992D;
    db $10,$10 : dw $0014                                                ;939933;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_14            ;939935;
    db $10,$10 : dw $0015                                                ;93993B;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_29            ;93993D;
    db $0C,$0C : dw $0016                                                ;939943;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_13            ;939945;
    db $0C,$0C : dw $0017                                                ;93994B;
    dw Instruction_SamusProjectile_GotoY                                 ;93994F;
    dw InstList_SamusProjectile_Charged_SW_SIW_DownLeft_1                ;939951;

InstList_SamusProjectile_Charged_SW_SIW_Left_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_48            ;939953;
    db $08,$0C : dw $0000                                                ;939957;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_57            ;939959;
    db $08,$0C : dw $0001                                                ;93995F;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_49            ;939961;
    db $08,$0C : dw $0002                                                ;939967;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_58            ;939969;
    db $08,$0C : dw $0003                                                ;93996F;

InstList_SamusProjectile_Charged_SW_SIW_Left_1:
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_36            ;939973;
    db $10,$0C : dw $0004                                                ;939977;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_0             ;939979;
    db $10,$0C : dw $0005                                                ;93997F;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_37            ;939981;
    db $10,$0C : dw $0006                                                ;939987;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1             ;939989;
    db $10,$0C : dw $0007                                                ;93998F;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_38            ;939991;
    db $10,$0C : dw $0008                                                ;939997;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2             ;939999;
    db $10,$0C : dw $0009                                                ;93999F;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_39            ;9399A1;
    db $10,$10 : dw $000A                                                ;9399A7;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3             ;9399A9;
    db $10,$10 : dw $000B                                                ;9399AF;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3A            ;9399B1;
    db $10,$12 : dw $000C                                                ;9399B7;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4             ;9399B9;
    db $10,$12 : dw $000D                                                ;9399BF;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3B            ;9399C1;
    db $10,$14 : dw $000E                                                ;9399C7;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5             ;9399C9;
    db $10,$14 : dw $000F                                                ;9399CF;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3A            ;9399D1;
    db $10,$12 : dw $0010                                                ;9399D7;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4             ;9399D9;
    db $10,$12 : dw $0011                                                ;9399DF;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_39            ;9399E1;
    db $10,$10 : dw $0012                                                ;9399E7;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3             ;9399E9;
    db $10,$10 : dw $0013                                                ;9399EF;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_38            ;9399F1;
    db $10,$0C : dw $0014                                                ;9399F7;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2             ;9399F9;
    db $10,$0C : dw $0015                                                ;9399FF;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_37            ;939A01;
    db $10,$08 : dw $0016                                                ;939A07;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1             ;939A09;
    db $10,$08 : dw $0017                                                ;939A0F;
    dw Instruction_SamusProjectile_GotoY                                 ;939A13;
    dw InstList_SamusProjectile_Charged_SW_SIW_Left_1                    ;939A15;

InstList_SamusProjectile_Charged_SW_SIW_UpLeft_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4A            ;939A17;
    db $08,$08 : dw $0000                                                ;939A1B;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_59            ;939A1D;
    db $08,$08 : dw $0001                                                ;939A23;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4B            ;939A25;
    db $08,$08 : dw $0002                                                ;939A2B;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5A            ;939A2D;
    db $08,$08 : dw $0003                                                ;939A33;

InstList_SamusProjectile_Charged_SW_SIW_UpLeft_1:
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2A            ;939A37;
    db $0C,$0C : dw $0004                                                ;939A3B;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_C             ;939A3D;
    db $0C,$0C : dw $0005                                                ;939A43;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2F            ;939A45;
    db $0C,$0C : dw $0006                                                ;939A4B;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_D             ;939A4D;
    db $0C,$0C : dw $0007                                                ;939A53;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2B            ;939A55;
    db $10,$10 : dw $0008                                                ;939A5B;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_E             ;939A5D;
    db $10,$10 : dw $0009                                                ;939A63;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2C            ;939A65;
    db $10,$10 : dw $000A                                                ;939A6B;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_F             ;939A6D;
    db $10,$10 : dw $000B                                                ;939A73;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2D            ;939A75;
    db $10,$10 : dw $000C                                                ;939A7B;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_10            ;939A7D;
    db $10,$10 : dw $000D                                                ;939A83;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2E            ;939A85;
    db $14,$14 : dw $000E                                                ;939A8B;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_11            ;939A8D;
    db $14,$14 : dw $000F                                                ;939A93;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2D            ;939A95;
    db $10,$10 : dw $0010                                                ;939A9B;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_10            ;939A9D;
    db $10,$10 : dw $0011                                                ;939AA3;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2C            ;939AA5;
    db $10,$10 : dw $0012                                                ;939AAB;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_F             ;939AAD;
    db $10,$10 : dw $0013                                                ;939AB3;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2B            ;939AB5;
    db $10,$10 : dw $0014                                                ;939ABB;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_E             ;939ABD;
    db $10,$10 : dw $0015                                                ;939AC3;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2F            ;939AC5;
    db $0C,$0C : dw $0016                                                ;939ACB;
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_D             ;939ACD;
    db $0C,$0C : dw $0017                                                ;939AD3;
    dw Instruction_SamusProjectile_GotoY                                 ;939AD7;
    dw InstList_SamusProjectile_Charged_SW_SIW_UpLeft_1                  ;939AD9;

InstList_SamusProjectile_Charged_P_PI_Down_Up_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_4             ;939ADB;
    db $08,$08 : dw $0000                                                ;939ADF;
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_14            ;939AE1;
    db $08,$08 : dw $0001                                                ;939AE7;
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_5             ;939AE9;
    db $08,$10 : dw $0002                                                ;939AEF;
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_15            ;939AF1;
    db $08,$10 : dw $0003                                                ;939AF7;
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_6             ;939AF9;
    db $08,$18 : dw $0004                                                ;939AFF;
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_16            ;939B01;
    db $08,$18 : dw $0005                                                ;939B07;

InstList_SamusProjectile_Charged_P_PI_Down_Up_1:
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_7             ;939B0B;
    db $08,$1C : dw $0006                                                ;939B0F;
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_17            ;939B11;
    db $08,$1C : dw $0007                                                ;939B17;
    dw Instruction_SamusProjectile_GotoY                                 ;939B1B;
    dw InstList_SamusProjectile_Charged_P_PI_Down_Up_1                   ;939B1D;

InstList_SamusProjectile_Charged_P_PI_DownLeft_UpRight_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_C             ;939B1F;
    db $08,$08 : dw $0000                                                ;939B23;
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1C            ;939B25;
    db $08,$08 : dw $0001                                                ;939B2B;
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_D             ;939B2D;
    db $0C,$0C : dw $0002                                                ;939B33;
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1D            ;939B35;
    db $0C,$0C : dw $0003                                                ;939B3B;
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_E             ;939B3D;
    db $10,$10 : dw $0004                                                ;939B43;
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1E            ;939B45;
    db $10,$10 : dw $0005                                                ;939B4B;

InstList_SamusProjectile_Charged_P_PI_DownLeft_UpRight_1:
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_F             ;939B4F;
    db $14,$14 : dw $0006                                                ;939B53;
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1F            ;939B55;
    db $14,$14 : dw $0007                                                ;939B5B;
    dw Instruction_SamusProjectile_GotoY                                 ;939B5F;
    dw InstList_SamusProjectile_Charged_P_PI_DownLeft_UpRight_1          ;939B61;

InstList_SamusProjectile_Charged_P_PI_Left_Right_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_0             ;939B63;
    db $08,$08 : dw $0000                                                ;939B67;
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_10            ;939B69;
    db $08,$08 : dw $0001                                                ;939B6F;
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1             ;939B71;
    db $10,$08 : dw $0002                                                ;939B77;
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_11            ;939B79;
    db $10,$08 : dw $0003                                                ;939B7F;
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_2             ;939B81;
    db $18,$08 : dw $0004                                                ;939B87;
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_12            ;939B89;
    db $18,$08 : dw $0005                                                ;939B8F;

InstList_SamusProjectile_Charged_P_PI_Left_Right_1:
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_3             ;939B93;
    db $1C,$08 : dw $0006                                                ;939B97;
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_13            ;939B99;
    db $1C,$08 : dw $0007                                                ;939B9F;
    dw Instruction_SamusProjectile_GotoY                                 ;939BA3;
    dw InstList_SamusProjectile_Charged_P_PI_Left_Right_1                ;939BA5;

InstList_SamusProjectile_Charged_P_PI_DownRight_UpLeft_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_8             ;939BA7;
    db $08,$08 : dw $0000                                                ;939BAB;
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_18            ;939BAD;
    db $08,$08 : dw $0001                                                ;939BB3;
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_9             ;939BB5;
    db $0C,$0C : dw $0002                                                ;939BBB;
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_19            ;939BBD;
    db $0C,$0C : dw $0003                                                ;939BC3;
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_A             ;939BC5;
    db $10,$10 : dw $0004                                                ;939BCB;
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1A            ;939BCD;
    db $10,$10 : dw $0005                                                ;939BD3;

InstList_SamusProjectile_Charged_P_PI_DownRight_UpLeft_1:
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_B             ;939BD7;
    db $14,$14 : dw $0006                                                ;939BDB;
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1B            ;939BDD;
    db $14,$14 : dw $0007                                                ;939BE3;
    dw Instruction_SamusProjectile_GotoY                                 ;939BE7;
    dw InstList_SamusProjectile_Charged_P_PI_DownRight_UpLeft_1          ;939BE9;

InstList_SamusProjectile_Charged_PW_PIW_Down_Up_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_4             ;939BEB;
    db $0C,$08 : dw $0000                                                ;939BEF;
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_14            ;939BF1;
    db $0C,$08 : dw $0001                                                ;939BF7;
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_5             ;939BF9;
    db $0C,$08 : dw $0002                                                ;939BFF;
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_15            ;939C01;
    db $0C,$08 : dw $0003                                                ;939C07;
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_6             ;939C09;
    db $0C,$18 : dw $0004                                                ;939C0F;
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_16            ;939C11;
    db $0C,$18 : dw $0005                                                ;939C17;

InstList_SamusProjectile_Charged_PW_PIW_Down_Up_1:
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_19                 ;939C1B;
    db $0C,$1E : dw $0006                                                ;939C1F;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_28                 ;939C21;
    db $0C,$1E : dw $0007                                                ;939C27;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_1A                 ;939C29;
    db $0C,$1E : dw $0008                                                ;939C2F;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_29                 ;939C31;
    db $0C,$1E : dw $0009                                                ;939C37;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_1B                 ;939C39;
    db $11,$1E : dw $000A                                                ;939C3F;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_2A                 ;939C41;
    db $11,$1E : dw $000B                                                ;939C47;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_1C                 ;939C49;
    db $13,$1E : dw $000C                                                ;939C4F;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_2B                 ;939C51;
    db $13,$1E : dw $000D                                                ;939C57;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_1D                 ;939C59;
    db $14,$1E : dw $000E                                                ;939C5F;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_2C                 ;939C61;
    db $14,$1E : dw $000F                                                ;939C67;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_1C                 ;939C69;
    db $13,$1E : dw $0010                                                ;939C6F;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_2B                 ;939C71;
    db $13,$1E : dw $0011                                                ;939C77;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_1B                 ;939C79;
    db $11,$1E : dw $0012                                                ;939C7F;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_2A                 ;939C81;
    db $11,$1E : dw $0013                                                ;939C87;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_1A                 ;939C89;
    db $0C,$1E : dw $0014                                                ;939C8F;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_29                 ;939C91;
    db $0C,$1E : dw $0015                                                ;939C97;
    dw Instruction_SamusProjectile_GotoY                                 ;939C9B;
    dw InstList_SamusProjectile_Charged_PW_PIW_Down_Up_1                 ;939C9D;

InstList_SamusProjectile_Charged_PW_PIW_DownLeft_UpRight_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_C             ;939C9F;
    db $08,$08 : dw $0000                                                ;939CA3;
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1C            ;939CA5;
    db $08,$08 : dw $0001                                                ;939CAB;
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_D             ;939CAD;
    db $08,$08 : dw $0002                                                ;939CB3;
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1D            ;939CB5;
    db $08,$08 : dw $0003                                                ;939CBB;
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_E             ;939CBD;
    db $0C,$0C : dw $0004                                                ;939CC3;
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1E            ;939CC5;
    db $0C,$0C : dw $0005                                                ;939CCB;

InstList_SamusProjectile_Charged_PW_PIW_DownLeft_UpRight_1:
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_37                 ;939CCF;
    db $0C,$0C : dw $0006                                                ;939CD3;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_2D                 ;939CD5;
    db $0C,$0C : dw $0007                                                ;939CDB;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_38                 ;939CDD;
    db $10,$10 : dw $0008                                                ;939CE3;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_2E                 ;939CE5;
    db $10,$10 : dw $0009                                                ;939CEB;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_39                 ;939CED;
    db $11,$11 : dw $000A                                                ;939CF3;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_2F                 ;939CF5;
    db $11,$11 : dw $000B                                                ;939CFB;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_3A                 ;939CFD;
    db $14,$14 : dw $000C                                                ;939D03;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_30                 ;939D05;
    db $14,$14 : dw $000D                                                ;939D0B;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_3B                 ;939D0D;
    db $18,$18 : dw $000E                                                ;939D13;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_31                 ;939D15;
    db $18,$18 : dw $000F                                                ;939D1B;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_3A                 ;939D1D;
    db $14,$14 : dw $0010                                                ;939D23;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_30                 ;939D25;
    db $14,$14 : dw $0011                                                ;939D2B;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_39                 ;939D2D;
    db $11,$11 : dw $0012                                                ;939D33;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_2F                 ;939D35;
    db $11,$11 : dw $0013                                                ;939D3B;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_38                 ;939D3D;
    db $10,$10 : dw $0014                                                ;939D43;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_2E                 ;939D45;
    db $10,$10 : dw $0015                                                ;939D4B;
    dw Instruction_SamusProjectile_GotoY                                 ;939D4F;
    dw InstList_SamusProjectile_Charged_PW_PIW_DownLeft_UpRight_1        ;939D51;

InstList_SamusProjectile_Charged_PW_PIW_Left_Right_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_0             ;939D53;
    db $08,$0C : dw $0000                                                ;939D57;
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_10            ;939D59;
    db $08,$0C : dw $0001                                                ;939D5F;
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1             ;939D61;
    db $08,$0C : dw $0002                                                ;939D67;
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_11            ;939D69;
    db $08,$0C : dw $0003                                                ;939D6F;
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_2             ;939D71;
    db $18,$0C : dw $0004                                                ;939D77;
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_12            ;939D79;
    db $18,$0C : dw $0005                                                ;939D7F;

InstList_SamusProjectile_Charged_PW_PIW_Left_Right_1:
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_5                  ;939D83;
    db $1C,$0C : dw $0006                                                ;939D87;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_1E                 ;939D89;
    db $1C,$0C : dw $0007                                                ;939D8F;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_6                  ;939D91;
    db $1C,$0C : dw $0008                                                ;939D97;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_1F                 ;939D99;
    db $1C,$0C : dw $0009                                                ;939D9F;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_7                  ;939DA1;
    db $1C,$11 : dw $000A                                                ;939DA7;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_20                 ;939DA9;
    db $1C,$11 : dw $000B                                                ;939DAF;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_8                  ;939DB1;
    db $1C,$13 : dw $000C                                                ;939DB7;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_21                 ;939DB9;
    db $1C,$13 : dw $000D                                                ;939DBF;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_9                  ;939DC1;
    db $1C,$14 : dw $000E                                                ;939DC7;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_22                 ;939DC9;
    db $1C,$14 : dw $000F                                                ;939DCF;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_8                  ;939DD1;
    db $1C,$13 : dw $0010                                                ;939DD7;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_21                 ;939DD9;
    db $1C,$13 : dw $0011                                                ;939DDF;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_7                  ;939DE1;
    db $1C,$11 : dw $0012                                                ;939DE7;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_20                 ;939DE9;
    db $1C,$11 : dw $0013                                                ;939DEF;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_6                  ;939DF1;
    db $1C,$0C : dw $0014                                                ;939DF7;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_1F                 ;939DF9;
    db $1C,$0C : dw $0015                                                ;939DFF;
    dw Instruction_SamusProjectile_GotoY                                 ;939E03;
    dw InstList_SamusProjectile_Charged_PW_PIW_Left_Right_1              ;939E05;

InstList_SamusProjectile_Charged_PW_PIW_DownRight_UpLeft_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_8             ;939E07;
    db $08,$08 : dw $0000                                                ;939E0B;
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_18            ;939E0D;
    db $08,$08 : dw $0001                                                ;939E13;
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_9             ;939E15;
    db $08,$08 : dw $0002                                                ;939E1B;
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_19            ;939E1D;
    db $08,$08 : dw $0003                                                ;939E23;
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_A             ;939E25;
    db $0C,$0C : dw $0004                                                ;939E2B;
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1A            ;939E2D;
    db $0C,$0C : dw $0005                                                ;939E33;

InstList_SamusProjectile_Charged_PW_PIW_DownRight_UpLeft_1:
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_F                  ;939E37;
    db $0C,$0C : dw $0006                                                ;939E3B;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_23                 ;939E3D;
    db $0C,$0C : dw $0007                                                ;939E43;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_10                 ;939E45;
    db $10,$10 : dw $0008                                                ;939E4B;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_24                 ;939E4D;
    db $10,$10 : dw $0009                                                ;939E53;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_11                 ;939E55;
    db $11,$11 : dw $000A                                                ;939E5B;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_25                 ;939E5D;
    db $11,$11 : dw $000B                                                ;939E63;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_12                 ;939E65;
    db $14,$14 : dw $000C                                                ;939E6B;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_26                 ;939E6D;
    db $14,$14 : dw $000D                                                ;939E73;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_13                 ;939E75;
    db $18,$18 : dw $000E                                                ;939E7B;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_27                 ;939E7D;
    db $18,$18 : dw $000F                                                ;939E83;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_12                 ;939E85;
    db $14,$14 : dw $0010                                                ;939E8B;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_26                 ;939E8D;
    db $14,$14 : dw $0011                                                ;939E93;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_11                 ;939E95;
    db $11,$11 : dw $0012                                                ;939E9B;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_25                 ;939E9D;
    db $11,$11 : dw $0013                                                ;939EA3;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_10                 ;939EA5;
    db $10,$10 : dw $0014                                                ;939EAB;
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_24                 ;939EAD;
    db $10,$10 : dw $0015                                                ;939EB3;
    dw Instruction_SamusProjectile_GotoY                                 ;939EB7;
    dw InstList_SamusProjectile_Charged_PW_PIW_DownRight_UpLeft_1        ;939EB9;

InstList_SamusProjectile_Missiles_Up:
    dw $000F,ProjectileFlareSpritemaps_Missile_2                         ;939EBB;
    db $04,$04 : dw $0000                                                ;939EBF;
    dw Instruction_SamusProjectile_GotoY                                 ;939EC3;
    dw InstList_SamusProjectile_Missiles_Up                              ;939EC5;

InstList_SamusProjectile_Missiles_UpRight:
    dw $000F,ProjectileFlareSpritemaps_Missile_3                         ;939EC7;
    db $04,$04 : dw $0000                                                ;939ECB;
    dw Instruction_SamusProjectile_GotoY                                 ;939ECF;
    dw InstList_SamusProjectile_Missiles_UpRight                         ;939ED1;

InstList_SamusProjectile_Missiles_Right:
    dw $000F,ProjectileFlareSpritemaps_Missile_4                         ;939ED3;
    db $04,$04 : dw $0000                                                ;939ED7;
    dw Instruction_SamusProjectile_GotoY                                 ;939EDB;
    dw InstList_SamusProjectile_Missiles_Right                           ;939EDD;

InstList_SamusProjectile_Missiles_DownRight:
    dw $000F,ProjectileFlareSpritemaps_Missile_5                         ;939EDF;
    db $04,$04 : dw $0000                                                ;939EE3;
    dw Instruction_SamusProjectile_GotoY                                 ;939EE7;
    dw InstList_SamusProjectile_Missiles_DownRight                       ;939EE9;

InstList_SamusProjectile_Missiles_Down:
    dw $000F,ProjectileFlareSpritemaps_Missile_6                         ;939EEB;
    db $04,$04 : dw $0000                                                ;939EEF;
    dw Instruction_SamusProjectile_GotoY                                 ;939EF3;
    dw InstList_SamusProjectile_Missiles_Down                            ;939EF5;

InstList_SamusProjectile_Missiles_DownLeft:
    dw $000F,ProjectileFlareSpritemaps_Missile_7                         ;939EF7;
    db $04,$04 : dw $0000                                                ;939EFB;
    dw Instruction_SamusProjectile_GotoY                                 ;939EFF;
    dw InstList_SamusProjectile_Missiles_DownLeft                        ;939F01;

InstList_SamusProjectile_Missiles_Left:
    dw $000F,ProjectileFlareSpritemaps_Missile_0                         ;939F03;
    db $04,$04 : dw $0000                                                ;939F07;
    dw Instruction_SamusProjectile_GotoY                                 ;939F0B;
    dw InstList_SamusProjectile_Missiles_Left                            ;939F0D;

InstList_SamusProjectile_Missiles_UpLeft:
    dw $000F,ProjectileFlareSpritemaps_Missile_1                         ;939F0F;
    db $04,$04 : dw $0000                                                ;939F13;
    dw Instruction_SamusProjectile_GotoY                                 ;939F17;
    dw InstList_SamusProjectile_Missiles_UpLeft                          ;939F19;

InstList_SamusProjectile_SuperMissiles_Up:
    dw $000F,ProjectileFlareSpritemaps_SuperMissile_2                    ;939F1B;
    db $08,$08 : dw $0000                                                ;939F1F;
    dw Instruction_SamusProjectile_GotoY                                 ;939F23;
    dw InstList_SamusProjectile_SuperMissiles_Up                         ;939F25;

InstList_SamusProjectile_SuperMissiles_UpRight:
    dw $000F,ProjectileFlareSpritemaps_SuperMissile_3                    ;939F27;
    db $08,$08 : dw $0000                                                ;939F2B;
    dw Instruction_SamusProjectile_GotoY                                 ;939F2F;
    dw InstList_SamusProjectile_SuperMissiles_UpRight                    ;939F31;

InstList_SamusProjectile_SuperMissiles_Right:
    dw $000F,ProjectileFlareSpritemaps_SuperMissile_4                    ;939F33;
    db $08,$08 : dw $0000                                                ;939F37;
    dw Instruction_SamusProjectile_GotoY                                 ;939F3B;
    dw InstList_SamusProjectile_SuperMissiles_Right                      ;939F3D;

InstList_SamusProjectile_SuperMissiles_DownRight:
    dw $000F,ProjectileFlareSpritemaps_SuperMissile_5                    ;939F3F;
    db $08,$08 : dw $0000                                                ;939F43;
    dw Instruction_SamusProjectile_GotoY                                 ;939F47;
    dw InstList_SamusProjectile_SuperMissiles_DownRight                  ;939F49;

InstList_SamusProjectile_SuperMissiles_Down:
    dw $000F,ProjectileFlareSpritemaps_SuperMissile_6                    ;939F4B;
    db $08,$08 : dw $0000                                                ;939F4F;
    dw Instruction_SamusProjectile_GotoY                                 ;939F53;
    dw InstList_SamusProjectile_SuperMissiles_Down                       ;939F55;

InstList_SamusProjectile_SuperMissiles_DownLeft:
    dw $000F,ProjectileFlareSpritemaps_SuperMissile_7                    ;939F57;
    db $08,$08 : dw $0000                                                ;939F5B;
    dw Instruction_SamusProjectile_GotoY                                 ;939F5F;
    dw InstList_SamusProjectile_SuperMissiles_DownLeft                   ;939F61;

InstList_SamusProjectile_SuperMissiles_Left:
    dw $000F,ProjectileFlareSpritemaps_SuperMissile_0                    ;939F63;
    db $08,$08 : dw $0000                                                ;939F67;
    dw Instruction_SamusProjectile_GotoY                                 ;939F6B;
    dw InstList_SamusProjectile_SuperMissiles_Left                       ;939F6D;

InstList_SamusProjectile_SuperMissiles_UpLeft:
    dw $000F,ProjectileFlareSpritemaps_SuperMissile_1                    ;939F6F;
    db $08,$08 : dw $0000                                                ;939F73;
    dw Instruction_SamusProjectile_GotoY                                 ;939F77;
    dw InstList_SamusProjectile_SuperMissiles_UpLeft                     ;939F79;

InstList_SamusProjectile_SuperMissileLink:
    dw $000F,Spritemap_Nothing_93A117                                    ;939F7B;
    db $08,$08 : dw $0000                                                ;939F7F;
    dw Instruction_SamusProjectile_GotoY                                 ;939F83;
    dw InstList_SamusProjectile_SuperMissileLink                         ;939F85;

InstList_SamusProjectile_PowerBomb:
    dw $0005,ProjectileFlareSpritemaps_PowerBomb_0                       ;939F87;
    db $04,$04 : dw $0000                                                ;939F8B;
    dw $0005,ProjectileFlareSpritemaps_PowerBomb_1                       ;939F8D;
    db $04,$04 : dw $0000                                                ;939F93;
    dw $0005,ProjectileFlareSpritemaps_PowerBomb_2                       ;939F95;
    db $04,$04 : dw $0000                                                ;939F9B;
    dw Instruction_SamusProjectile_GotoY                                 ;939F9F;
    dw InstList_SamusProjectile_PowerBomb                                ;939FA1;

InstList_SamusProjectile_PowerBomb_FastAnimation:
    dw $0001                                                             ;939FA3;
    dw ProjectileFlareSpritemaps_PowerBomb_0                             ;939FA5;
    db $04,$04 : dw $0000                                                ;939FA7;
    dw $0001,ProjectileFlareSpritemaps_PowerBomb_1                       ;939FA9;
    db $04,$04 : dw $0000                                                ;939FAF;
    dw $0001,ProjectileFlareSpritemaps_PowerBomb_2                       ;939FB1;
    db $04,$04 : dw $0000                                                ;939FB7;
    dw Instruction_SamusProjectile_GotoY                                 ;939FBB;
    dw InstList_SamusProjectile_PowerBomb_FastAnimation                  ;939FBD;

InstList_SamusProjectile_Bomb:
    dw $0005,ProjectileFlareSpritemaps_Bomb_0                            ;939FBF;
    db $04,$04 : dw $0000                                                ;939FC3;
    dw $0005,ProjectileFlareSpritemaps_Bomb_1                            ;939FC5;
    db $04,$04 : dw $0000                                                ;939FCB;
    dw $0005,ProjectileFlareSpritemaps_Bomb_2                            ;939FCD;
    db $04,$04 : dw $0000                                                ;939FD3;
    dw $0005,ProjectileFlareSpritemaps_Bomb_3                            ;939FD5;
    db $04,$04 : dw $0000                                                ;939FDB;
    dw Instruction_SamusProjectile_GotoY                                 ;939FDF;
    dw InstList_SamusProjectile_Bomb                                     ;939FE1;

InstList_SamusProjectile_Bomb_FastAnimation:
    dw $0001,ProjectileFlareSpritemaps_Bomb_0                            ;939FE3;
    db $04,$04 : dw $0000                                                ;939FE7;
    dw $0001,ProjectileFlareSpritemaps_Bomb_1                            ;939FE9;
    db $04,$04 : dw $0000                                                ;939FEF;
    dw $0001,ProjectileFlareSpritemaps_Bomb_2                            ;939FF1;
    db $04,$04 : dw $0000                                                ;939FF7;
    dw $0001,ProjectileFlareSpritemaps_Bomb_3                            ;939FF9;
    db $04,$04 : dw $0000                                                ;939FFF;
    dw Instruction_SamusProjectile_GotoY                                 ;93A003;
    dw InstList_SamusProjectile_Bomb_FastAnimation                       ;93A005;

InstList_SamusProjectile_BeamExplosion:
    dw $0003,ProjectileFlareSpritemaps_BeamExplosion_0                   ;93A007;
    db $00,$00 : dw $0000                                                ;93A00B;
    dw $0003,ProjectileFlareSpritemaps_BeamExplosion_1                   ;93A00D;
    db $00,$00 : dw $0000                                                ;93A013;
    dw $0003,ProjectileFlareSpritemaps_BeamExplosion_2                   ;93A015;
    db $00,$00 : dw $0000                                                ;93A01B;
    dw $0003,ProjectileFlareSpritemaps_BeamExplosion_3                   ;93A01D;
    db $00,$00 : dw $0000                                                ;93A023;
    dw $0003,ProjectileFlareSpritemaps_BeamExplosion_4                   ;93A025;
    db $00,$00 : dw $0000                                                ;93A02B;
    dw $0003,ProjectileFlareSpritemaps_BeamExplosion_5                   ;93A02D;
    db $00,$00 : dw $0000                                                ;93A033;
    dw Instruction_SamusProjectile_Delete                                ;93A037;

InstList_SamusProjectile_MissileExplosion:
    dw $0003,ProjectileFlareSpritemaps_MissileExplosion_0                ;93A039;
    db $08,$08 : dw $0000                                                ;93A03D;
    dw $0003,ProjectileFlareSpritemaps_MissileExplosion_1                ;93A03F;
    db $08,$08 : dw $0000                                                ;93A045;
    dw $0003,ProjectileFlareSpritemaps_MissileExplosion_2                ;93A047;
    db $08,$08 : dw $0000                                                ;93A04D;
    dw $0003,ProjectileFlareSpritemaps_MissileExplosion_3                ;93A04F;
    db $08,$08 : dw $0000                                                ;93A055;
    dw $0003,ProjectileFlareSpritemaps_MissileExplosion_4                ;93A057;
    db $08,$08 : dw $0000                                                ;93A05D;
    dw $0003,ProjectileFlareSpritemaps_MissileExplosion_5                ;93A05F;
    db $08,$08 : dw $0000                                                ;93A065;
    dw Instruction_SamusProjectile_Delete                                ;93A069;

InstList_SamusProjectile_BombExplosion:
    dw $0002,ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_0         ;93A06B;
    db $08,$08 : dw $0000                                                ;93A06F;
    dw $0002,ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_1         ;93A071;
    db $0C,$0C : dw $0000                                                ;93A077;
    dw $0002,ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_2         ;93A079;
    db $10,$10 : dw $0000                                                ;93A07F;
    dw $0002,ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_3         ;93A081;
    db $10,$10 : dw $0000                                                ;93A087;
    dw $0002,ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_4         ;93A089;
    db $10,$10 : dw $0000                                                ;93A08F;
    dw Instruction_SamusProjectile_Delete                                ;93A093;

InstList_SamusProjectile_PlasmaSBA:
    dw $0002,ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_0         ;93A095;
    db $08,$08 : dw $0000                                                ;93A099;
    dw $0002,ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_1         ;93A09B;
    db $0C,$0C : dw $0000                                                ;93A0A1;
    dw $0002,ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_2         ;93A0A3;
    db $10,$10 : dw $0000                                                ;93A0A9;
    dw $0002,ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_3         ;93A0AB;
    db $10,$10 : dw $0000                                                ;93A0B1;
    dw $0002,ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_4         ;93A0B3;
    db $10,$10 : dw $0000                                                ;93A0B9;
    dw Instruction_SamusProjectile_GotoY                                 ;93A0BD;
    dw InstList_SamusProjectile_PlasmaSBA                                ;93A0BF;

InstList_SamusProjectile_SuperMissileExplosion:
    dw $0005,ProjectileFlareSpritemaps_SuperMissileExplosion_0           ;93A0C1;
    db $08,$08 : dw $0000                                                ;93A0C5;
    dw $0005,ProjectileFlareSpritemaps_SuperMissileExplosion_1           ;93A0C7;
    db $0C,$0C : dw $0000                                                ;93A0CD;
    dw $0005,ProjectileFlareSpritemaps_SuperMissileExplosion_2           ;93A0CF;
    db $10,$10 : dw $0000                                                ;93A0D5;
    dw $0005,ProjectileFlareSpritemaps_SuperMissileExplosion_3           ;93A0D7;
    db $10,$10 : dw $0000                                                ;93A0DD;
    dw $0005,ProjectileFlareSpritemaps_SuperMissileExplosion_4           ;93A0DF;
    db $10,$10 : dw $0000                                                ;93A0E5;
    dw $0005,ProjectileFlareSpritemaps_SuperMissileExplosion_5           ;93A0E7;
    db $10,$10 : dw $0000                                                ;93A0ED;
    dw Instruction_SamusProjectile_Delete                                ;93A0F1;

UNUSED_InstList_SamusProjectile_Projectile25_93A0F3:
    dw $0002,Spritemap_Nothing_93A117                                    ;93A0F3;
    db $10,$20 : dw $0000                                                ;93A0F7;
    dw $0002,Spritemap_Nothing_93A117                                    ;93A0F9;
    db $10,$20 : dw $0001                                                ;93A0FF;
    dw $0002,Spritemap_Nothing_93A117                                    ;93A101;
    db $10,$20 : dw $0002                                                ;93A107;
    dw $0002,Spritemap_Nothing_93A117                                    ;93A109;
    db $10,$20 : dw $0003                                                ;93A10F;
    dw Instruction_SamusProjectile_GotoY                                 ;93A113;
    dw UNUSED_InstList_SamusProjectile_Projectile25_93A0F3               ;93A115;

Spritemap_Nothing_93A117:
    dw $0000                                                             ;93A117;

InstList_SamusProjectile_ShinesparkEcho:
    dw $0002,Spritemap_Nothing_93A117                                    ;93A119;
    db $20,$20 : dw $0000                                                ;93A11D;
    dw $0002,Spritemap_Nothing_93A117                                    ;93A11F;
    db $20,$20 : dw $0001                                                ;93A125;
    dw $0002,Spritemap_Nothing_93A117                                    ;93A127;
    db $20,$20 : dw $0002                                                ;93A12D;
    dw $0002,Spritemap_Nothing_93A117                                    ;93A12F;
    db $20,$20 : dw $0003                                                ;93A135;
    dw Instruction_SamusProjectile_GotoY                                 ;93A139;
    dw InstList_SamusProjectile_ShinesparkEcho                           ;93A13B;

InstList_SamusProjectile_SpazerSBATrail_0:
    dw $0002,Spritemap_Nothing_93A117                                    ;93A13D;
    db $04,$08 : dw $0000                                                ;93A141;
    dw $0002,Spritemap_Nothing_93A117                                    ;93A143;
    db $0C,$08 : dw $0001                                                ;93A149;

InstList_SamusProjectile_SpazerSBATrail_1:
    dw $0002,Spritemap_Nothing_93A117                                    ;93A14D;
    db $14,$08 : dw $0002                                                ;93A151;
    dw Instruction_SamusProjectile_GotoY                                 ;93A155;
    dw InstList_SamusProjectile_SpazerSBATrail_1                         ;93A157;

InstList_SamusProjectile_WaveSBA:
    dw $0008,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_0             ;93A159;
    db $04,$04 : dw $0000                                                ;93A15D;
    dw $0008,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1             ;93A15F;
    db $04,$04 : dw $0001                                                ;93A165;
    dw Instruction_SamusProjectile_GotoY                                 ;93A169;
    dw InstList_SamusProjectile_WaveSBA                                  ;93A16B;

UNUSED_InstList_SamusProjectile_Projectile27_93A16D:
    dw $0003,ProjectileFlareSpritemaps_BeamExplosion_0                   ;93A16D;
    db $00,$00 : dw $0000                                                ;93A171;
    dw $0003,ProjectileFlareSpritemaps_BeamExplosion_1                   ;93A173;
    db $00,$00 : dw $0000                                                ;93A179;
    dw $0003,ProjectileFlareSpritemaps_BeamExplosion_2                   ;93A17B;
    db $00,$00 : dw $0000                                                ;93A181;
    dw $0003,ProjectileFlareSpritemaps_BeamExplosion_3                   ;93A183;
    db $00,$00 : dw $0000                                                ;93A189;
    dw $0003,ProjectileFlareSpritemaps_BeamExplosion_4                   ;93A18B;
    db $00,$00 : dw $0000                                                ;93A191;
    dw $0003,ProjectileFlareSpritemaps_BeamExplosion_5                   ;93A193;
    db $00,$00 : dw $0000                                                ;93A199;
    dw Instruction_SamusProjectile_GotoY                                 ;93A19D;
    dw UNUSED_InstList_SamusProjectile_Projectile27_93A16D               ;93A19F;

FlareSpritemapPointers:
; Index 3Eh is used for a shinespark windup effect by unused function UNUSED_DrawShinesparkWindupEffectSprite_93F5E2
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


FlareSpritemapTable_IndexOffsets:
;        _______________ Flare (charge beam / hyper beam / grapple beam)
;       |      _________ Flare slow sparks (charge beam / hyper beam)
;       |     |      ___ Flare fast sparks (charge beam / hyper beam)
;       |     |     |
  .facingRight
    dw $0000,$001E,$0024                                                 ;93A225;
  .facingLeft
    dw $0000,$002A,$0030                                                 ;93A22B;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_93A231:
    dw $0001,$01FC                                                       ;93A231;
    db $FC                                                               ;93A235;
    dw $3A2B                                                             ;93A236;

UNUSED_ProjectileFlareSpritemaps_93A238:
    dw $0001,$01FC                                                       ;93A238;
    db $FC                                                               ;93A23C;
    dw $3A2A                                                             ;93A23D;

UNUSED_ProjectileFlareSpritemaps_93A23F:
    dw $0001,$01FC                                                       ;93A23F;
    db $FC                                                               ;93A243;
    dw $3A29                                                             ;93A244;

UNUSED_ProjectileFlareSpritemaps_93A246:
    dw $0001,$01FC                                                       ;93A246;
    db $FC                                                               ;93A24A;
    dw $3A28                                                             ;93A24B;
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Power_0:
    dw $0001,$01FC                                                       ;93A24D;
    db $FC                                                               ;93A251;
    dw $2C30                                                             ;93A252;

ProjectileFlareSpritemaps_Power_1:
    dw $0001,$01FC                                                       ;93A254;
    db $FC                                                               ;93A258;
    dw $2C31                                                             ;93A259;

ProjectileFlareSpritemaps_Power_2:
    dw $0001,$01FC                                                       ;93A25B;
    db $FC                                                               ;93A25F;
    dw $2C32                                                             ;93A260;

ProjectileFlareSpritemaps_Power_3:
    dw $0001,$01FC                                                       ;93A262;
    db $FC                                                               ;93A266;
    dw $6C31                                                             ;93A267;

ProjectileFlareSpritemaps_Power_4:
    dw $0001,$01FC                                                       ;93A269;
    db $FC                                                               ;93A26D;
    dw $EC30                                                             ;93A26E;

ProjectileFlareSpritemaps_Power_5:
    dw $0001,$01FC                                                       ;93A270;
    db $FC                                                               ;93A274;
    dw $EC31                                                             ;93A275;

ProjectileFlareSpritemaps_Power_6:
    dw $0001,$01FC                                                       ;93A277;
    db $FC                                                               ;93A27B;
    dw $AC32                                                             ;93A27C;

ProjectileFlareSpritemaps_Power_7:
    dw $0001,$01FC                                                       ;93A27E;
    db $FC                                                               ;93A282;
    dw $AC31                                                             ;93A283;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_93A285:
    dw $0001,$01FC                                                       ;93A285;
    db $FC                                                               ;93A289;
    dw $2C30                                                             ;93A28A;

UNUSED_ProjectileFlareSpritemaps_93A28C:
    dw $0001,$01FC                                                       ;93A28C;
    db $FC                                                               ;93A290;
    dw $2C31                                                             ;93A291;

UNUSED_ProjectileFlareSpritemaps_93A293:
    dw $0001,$01FC                                                       ;93A293;
    db $FC                                                               ;93A297;
    dw $2C32                                                             ;93A298;

UNUSED_ProjectileFlareSpritemaps_93A29A:
    dw $0001,$01FC                                                       ;93A29A;
    db $FC                                                               ;93A29E;
    dw $2C32                                                             ;93A29F;

UNUSED_ProjectileFlareSpritemaps_93A2A1:
    dw $0001,$01FC                                                       ;93A2A1;
    db $FC                                                               ;93A2A5;
    dw $2C30                                                             ;93A2A6;

UNUSED_ProjectileFlareSpritemaps_93A2A8:
    dw $0001,$01FC                                                       ;93A2A8;
    db $FC                                                               ;93A2AC;
    dw $2C31                                                             ;93A2AD;

UNUSED_ProjectileFlareSpritemaps_93A2AF:
    dw $0001,$01FC                                                       ;93A2AF;
    db $FC                                                               ;93A2B3;
    dw $2C32                                                             ;93A2B4;

UNUSED_ProjectileFlareSpritemaps_93A2B6:
    dw $0001,$01FC                                                       ;93A2B6;
    db $FC                                                               ;93A2BA;
    dw $6C31                                                             ;93A2BB;

UNUSED_ProjectileFlareSpritemaps_93A2BD:
    dw $0001,$01FC                                                       ;93A2BD;
    db $FC                                                               ;93A2C1;
    dw $6C30                                                             ;93A2C2;

UNUSED_ProjectileFlareSpritemaps_93A2C4:
    dw $0001,$01FC                                                       ;93A2C4;
    db $FC                                                               ;93A2C8;
    dw $EC31                                                             ;93A2C9;

UNUSED_ProjectileFlareSpritemaps_93A2CB:
    dw $0001,$01FC                                                       ;93A2CB;
    db $FC                                                               ;93A2CF;
    dw $AC32                                                             ;93A2D0;

UNUSED_ProjectileFlareSpritemaps_93A2D2:
    dw $0001,$01FC                                                       ;93A2D2;
    db $FC                                                               ;93A2D6;
    dw $AC31                                                             ;93A2D7;

UNUSED_ProjectileFlareSpritemaps_93A2D9:
    dw $0002,$0000                                                       ;93A2D9;
    db $FC                                                               ;93A2DD;
    dw $2C30,$01F8                                                       ;93A2DE;
    db $FC                                                               ;93A2E2;
    dw $2C30                                                             ;93A2E3;

UNUSED_ProjectileFlareSpritemaps_93A2E5:
    dw $0004,$0006                                                       ;93A2E5;
    db $00                                                               ;93A2E9;
    dw $2C32,$01FE                                                       ;93A2EA;
    db $00                                                               ;93A2EE;
    dw $2C31,$01FE                                                       ;93A2EF;
    db $F8                                                               ;93A2F3;
    dw $2C32,$01F6                                                       ;93A2F4;
    db $F8                                                               ;93A2F8;
    dw $2C31                                                             ;93A2F9;

UNUSED_ProjectileFlareSpritemaps_93A2FB:
    dw $0002,$01FC                                                       ;93A2FB;
    db $00                                                               ;93A2FF;
    dw $2C33,$01FC                                                       ;93A300;
    db $F8                                                               ;93A304;
    dw $2C33                                                             ;93A305;

UNUSED_ProjectileFlareSpritemaps_93A307:
    dw $0004,$01F2                                                       ;93A307;
    db $00                                                               ;93A30B;
    dw $6C32,$01FA                                                       ;93A30C;
    db $00                                                               ;93A310;
    dw $6C31,$01FA                                                       ;93A311;
    db $F8                                                               ;93A315;
    dw $6C32,$0002                                                       ;93A316;
    db $F8                                                               ;93A31A;
    dw $6C31                                                             ;93A31B;

UNUSED_ProjectileFlareSpritemaps_93A31D:
    dw $0002,$01F8                                                       ;93A31D;
    db $FC                                                               ;93A321;
    dw $6C30,$0000                                                       ;93A322;
    db $FC                                                               ;93A326;
    dw $6C30                                                             ;93A327;

UNUSED_ProjectileFlareSpritemaps_93A329:
    dw $0004,$01F2                                                       ;93A329;
    db $F8                                                               ;93A32D;
    dw $EC32,$01FA                                                       ;93A32E;
    db $F8                                                               ;93A332;
    dw $EC31,$01FA                                                       ;93A333;
    db $00                                                               ;93A337;
    dw $EC32,$0002                                                       ;93A338;
    db $00                                                               ;93A33C;
    dw $EC31                                                             ;93A33D;

UNUSED_ProjectileFlareSpritemaps_93A33F:
    dw $0002,$01FC                                                       ;93A33F;
    db $F8                                                               ;93A343;
    dw $AC33,$01FC                                                       ;93A344;
    db $00                                                               ;93A348;
    dw $AC33                                                             ;93A349;

UNUSED_ProjectileFlareSpritemaps_93A34B:
    dw $0004,$01F2                                                       ;93A34B;
    db $00                                                               ;93A34F;
    dw $6C32,$01FA                                                       ;93A350;
    db $00                                                               ;93A354;
    dw $6C31,$01FA                                                       ;93A355;
    db $F8                                                               ;93A359;
    dw $6C32,$0002                                                       ;93A35A;
    db $F8                                                               ;93A35E;
    dw $6C31                                                             ;93A35F;

UNUSED_ProjectileFlareSpritemaps_93A361:
    dw $0001,$01FC                                                       ;93A361;
    db $FC                                                               ;93A365;
    dw $2C38                                                             ;93A366;

UNUSED_ProjectileFlareSpritemaps_93A368:
    dw $0001,$01FC                                                       ;93A368;
    db $FC                                                               ;93A36C;
    dw $2C39                                                             ;93A36D;

UNUSED_ProjectileFlareSpritemaps_93A36F:
    dw $0001,$01FC                                                       ;93A36F;
    db $FC                                                               ;93A373;
    dw $2C3A                                                             ;93A374;

UNUSED_ProjectileFlareSpritemaps_93A376:
    dw $0001,$01FC                                                       ;93A376;
    db $FC                                                               ;93A37A;
    dw $2C3B                                                             ;93A37B;
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Plasma_PlasmaIce_0:
    dw $0004,$0008                                                       ;93A37D;
    db $FC                                                               ;93A381;
    dw $2C30,$01F0                                                       ;93A382;
    db $FC                                                               ;93A386;
    dw $2C30,$0000                                                       ;93A387;
    db $FC                                                               ;93A38B;
    dw $2C30,$01F8                                                       ;93A38C;
    db $FC                                                               ;93A390;
    dw $2C30                                                             ;93A391;

ProjectileFlareSpritemaps_Plasma_PlasmaIce_1:
    dw $0006,$0008                                                       ;93A393;
    db $04                                                               ;93A397;
    dw $2C32,$0000                                                       ;93A398;
    db $04                                                               ;93A39C;
    dw $2C31,$0000                                                       ;93A39D;
    db $FC                                                               ;93A3A1;
    dw $2C32,$01F8                                                       ;93A3A2;
    db $FC                                                               ;93A3A6;
    dw $2C31,$01F8                                                       ;93A3A7;
    db $F4                                                               ;93A3AB;
    dw $2C32,$01F0                                                       ;93A3AC;
    db $F4                                                               ;93A3B0;
    dw $2C31                                                             ;93A3B1;

ProjectileFlareSpritemaps_Plasma_PlasmaIce_2:
    dw $0004,$01FC                                                       ;93A3B3;
    db $08                                                               ;93A3B7;
    dw $2C33,$01FC                                                       ;93A3B8;
    db $00                                                               ;93A3BC;
    dw $2C33,$01FC                                                       ;93A3BD;
    db $F8                                                               ;93A3C1;
    dw $2C33,$01FC                                                       ;93A3C2;
    db $F0                                                               ;93A3C6;
    dw $2C33                                                             ;93A3C7;

ProjectileFlareSpritemaps_Plasma_PlasmaIce_3:
    dw $0006,$01F0                                                       ;93A3C9;
    db $04                                                               ;93A3CD;
    dw $6C32,$01F8                                                       ;93A3CE;
    db $04                                                               ;93A3D2;
    dw $6C31,$01F8                                                       ;93A3D3;
    db $FC                                                               ;93A3D7;
    dw $6C32,$0000                                                       ;93A3D8;
    db $FC                                                               ;93A3DC;
    dw $6C31,$0000                                                       ;93A3DD;
    db $F4                                                               ;93A3E1;
    dw $6C32,$0008                                                       ;93A3E2;
    db $F4                                                               ;93A3E6;
    dw $6C31                                                             ;93A3E7;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_93A3E9:
    dw $0004,$0008                                                       ;93A3E9;
    db $FC                                                               ;93A3ED;
    dw $2C30,$01F0                                                       ;93A3EE;
    db $FC                                                               ;93A3F2;
    dw $2C30,$0000                                                       ;93A3F3;
    db $FC                                                               ;93A3F7;
    dw $2C30,$01F8                                                       ;93A3F8;
    db $FC                                                               ;93A3FC;
    dw $2C30                                                             ;93A3FD;

UNUSED_ProjectileFlareSpritemaps_93A3FF:
    dw $0006,$000A                                                       ;93A3FF;
    db $04                                                               ;93A403;
    dw $2C32,$0002                                                       ;93A404;
    db $04                                                               ;93A408;
    dw $2C31,$0002                                                       ;93A409;
    db $FC                                                               ;93A40D;
    dw $2C32,$01FA                                                       ;93A40E;
    db $FC                                                               ;93A412;
    dw $2C31,$01FA                                                       ;93A413;
    db $F4                                                               ;93A417;
    dw $2C32,$01F2                                                       ;93A418;
    db $F4                                                               ;93A41C;
    dw $2C31                                                             ;93A41D;

UNUSED_ProjectileFlareSpritemaps_93A41F:
    dw $0004,$01FC                                                       ;93A41F;
    db $08                                                               ;93A423;
    dw $2C33,$01FC                                                       ;93A424;
    db $F0                                                               ;93A428;
    dw $2C33,$01FC                                                       ;93A429;
    db $00                                                               ;93A42D;
    dw $2C33,$01FC                                                       ;93A42E;
    db $F8                                                               ;93A432;
    dw $2C33                                                             ;93A433;

UNUSED_ProjectileFlareSpritemaps_93A435:
    dw $0006,$01EE                                                       ;93A435;
    db $04                                                               ;93A439;
    dw $6C32,$01F6                                                       ;93A43A;
    db $04                                                               ;93A43E;
    dw $6C31,$01F6                                                       ;93A43F;
    db $FC                                                               ;93A443;
    dw $6C32,$01FE                                                       ;93A444;
    db $FC                                                               ;93A448;
    dw $6C31,$01FE                                                       ;93A449;
    db $F4                                                               ;93A44D;
    dw $6C32,$0006                                                       ;93A44E;
    db $F4                                                               ;93A452;
    dw $6C31                                                             ;93A453;

UNUSED_ProjectileFlareSpritemaps_93A455:
    dw $0004,$01F0                                                       ;93A455;
    db $FC                                                               ;93A459;
    dw $6C30,$0008                                                       ;93A45A;
    db $FC                                                               ;93A45E;
    dw $6C30,$01F8                                                       ;93A45F;
    db $FC                                                               ;93A463;
    dw $6C30,$0000                                                       ;93A464;
    db $FC                                                               ;93A468;
    dw $6C30                                                             ;93A469;

UNUSED_ProjectileFlareSpritemaps_93A46B:
    dw $0006,$01EE                                                       ;93A46B;
    db $F4                                                               ;93A46F;
    dw $EC32,$01F6                                                       ;93A470;
    db $F4                                                               ;93A474;
    dw $EC31,$01F6                                                       ;93A475;
    db $FC                                                               ;93A479;
    dw $EC32,$01FE                                                       ;93A47A;
    db $FC                                                               ;93A47E;
    dw $EC31,$01FE                                                       ;93A47F;
    db $04                                                               ;93A483;
    dw $EC32,$0006                                                       ;93A484;
    db $04                                                               ;93A488;
    dw $EC31                                                             ;93A489;

UNUSED_ProjectileFlareSpritemaps_93A48B:
    dw $0004,$01FC                                                       ;93A48B;
    db $F0                                                               ;93A48F;
    dw $AC33,$01FC                                                       ;93A490;
    db $08                                                               ;93A494;
    dw $AC33,$01FC                                                       ;93A495;
    db $F8                                                               ;93A499;
    dw $AC33,$01FC                                                       ;93A49A;
    db $00                                                               ;93A49E;
    dw $AC33                                                             ;93A49F;

UNUSED_ProjectileFlareSpritemaps_93A4A1:
    dw $0006,$000A                                                       ;93A4A1;
    db $F4                                                               ;93A4A5;
    dw $AC32,$0002                                                       ;93A4A6;
    db $F4                                                               ;93A4AA;
    dw $AC31,$0002                                                       ;93A4AB;
    db $FC                                                               ;93A4AF;
    dw $AC32,$01FA                                                       ;93A4B0;
    db $FC                                                               ;93A4B4;
    dw $AC31,$01FA                                                       ;93A4B5;
    db $04                                                               ;93A4B9;
    dw $AC32,$01F2                                                       ;93A4BA;
    db $04                                                               ;93A4BE;
    dw $AC31                                                             ;93A4BF;

UNUSED_ProjectileFlareSpritemaps_93A4C1:
    dw $0007,$0014                                                       ;93A4C1;
    db $FC                                                               ;93A4C5;
    dw $2C30,$01E4                                                       ;93A4C6;
    db $FC                                                               ;93A4CA;
    dw $2C30,$01EC                                                       ;93A4CB;
    db $FC                                                               ;93A4CF;
    dw $2C30,$000C                                                       ;93A4D0;
    db $FC                                                               ;93A4D4;
    dw $2C30,$0004                                                       ;93A4D5;
    db $FC                                                               ;93A4D9;
    dw $2C30,$01FC                                                       ;93A4DA;
    db $FC                                                               ;93A4DE;
    dw $2C30,$01F4                                                       ;93A4DF;
    db $FC                                                               ;93A4E3;
    dw $2C30                                                             ;93A4E4;

UNUSED_ProjectileFlareSpritemaps_93A4E6:
    dw $000A,$0010                                                       ;93A4E6;
    db $0C                                                               ;93A4EA;
    dw $2C32,$0008                                                       ;93A4EB;
    db $0C                                                               ;93A4EF;
    dw $2C31,$0008                                                       ;93A4F0;
    db $04                                                               ;93A4F4;
    dw $2C32,$0000                                                       ;93A4F5;
    db $04                                                               ;93A4F9;
    dw $2C31,$0000                                                       ;93A4FA;
    db $FC                                                               ;93A4FE;
    dw $2C32,$01F8                                                       ;93A4FF;
    db $FC                                                               ;93A503;
    dw $2C31,$01F8                                                       ;93A504;
    db $F4                                                               ;93A508;
    dw $2C32,$01F0                                                       ;93A509;
    db $F4                                                               ;93A50D;
    dw $2C31,$01F0                                                       ;93A50E;
    db $EC                                                               ;93A512;
    dw $2C32,$01E8                                                       ;93A513;
    db $EC                                                               ;93A517;
    dw $2C31                                                             ;93A518;

UNUSED_ProjectileFlareSpritemaps_93A51A:
    dw $0007,$01FC                                                       ;93A51A;
    db $14                                                               ;93A51E;
    dw $2C33,$01FC                                                       ;93A51F;
    db $0C                                                               ;93A523;
    dw $2C33,$01FC                                                       ;93A524;
    db $04                                                               ;93A528;
    dw $2C33,$01FC                                                       ;93A529;
    db $FC                                                               ;93A52D;
    dw $2C33,$01FC                                                       ;93A52E;
    db $F4                                                               ;93A532;
    dw $2C33,$01FC                                                       ;93A533;
    db $EC                                                               ;93A537;
    dw $2C33,$01FC                                                       ;93A538;
    db $E4                                                               ;93A53C;
    dw $2C33                                                             ;93A53D;

UNUSED_ProjectileFlareSpritemaps_93A53F:
    dw $000A,$0008                                                       ;93A53F;
    db $EC                                                               ;93A543;
    dw $6C32,$0010                                                       ;93A544;
    db $EC                                                               ;93A548;
    dw $6C31,$01E8                                                       ;93A549;
    db $0C                                                               ;93A54D;
    dw $6C32,$01F0                                                       ;93A54E;
    db $0C                                                               ;93A552;
    dw $6C31,$01F0                                                       ;93A553;
    db $04                                                               ;93A557;
    dw $6C32,$01F8                                                       ;93A558;
    db $04                                                               ;93A55C;
    dw $6C31,$01F8                                                       ;93A55D;
    db $FC                                                               ;93A561;
    dw $6C32,$0000                                                       ;93A562;
    db $FC                                                               ;93A566;
    dw $6C31,$0000                                                       ;93A567;
    db $F4                                                               ;93A56B;
    dw $6C32,$0008                                                       ;93A56C;
    db $F4                                                               ;93A570;
    dw $6C31                                                             ;93A571;

UNUSED_ProjectileFlareSpritemaps_93A573:
    dw $0007,$0014                                                       ;93A573;
    db $FC                                                               ;93A577;
    dw $2C34,$01E4                                                       ;93A578;
    db $FC                                                               ;93A57C;
    dw $2C34,$000C                                                       ;93A57D;
    db $FC                                                               ;93A581;
    dw $2C34,$01EC                                                       ;93A582;
    db $FC                                                               ;93A586;
    dw $2C34,$0004                                                       ;93A587;
    db $FC                                                               ;93A58B;
    dw $2C34,$01FC                                                       ;93A58C;
    db $FC                                                               ;93A590;
    dw $2C34,$01F4                                                       ;93A591;
    db $FC                                                               ;93A595;
    dw $2C34                                                             ;93A596;

UNUSED_ProjectileFlareSpritemaps_93A598:
    dw $000A,$0010                                                       ;93A598;
    db $0C                                                               ;93A59C;
    dw $2C36,$0008                                                       ;93A59D;
    db $0C                                                               ;93A5A1;
    dw $2C35,$01F0                                                       ;93A5A2;
    db $EC                                                               ;93A5A6;
    dw $2C36,$01E8                                                       ;93A5A7;
    db $EC                                                               ;93A5AB;
    dw $2C35,$01F8                                                       ;93A5AC;
    db $F4                                                               ;93A5B0;
    dw $2C36,$01F0                                                       ;93A5B1;
    db $F4                                                               ;93A5B5;
    dw $2C35,$0008                                                       ;93A5B6;
    db $04                                                               ;93A5BA;
    dw $2C36,$0000                                                       ;93A5BB;
    db $04                                                               ;93A5BF;
    dw $2C35,$0000                                                       ;93A5C0;
    db $FC                                                               ;93A5C4;
    dw $2C36,$01F8                                                       ;93A5C5;
    db $FC                                                               ;93A5C9;
    dw $2C35                                                             ;93A5CA;

UNUSED_ProjectileFlareSpritemaps_93A5CC:
    dw $0007,$01FC                                                       ;93A5CC;
    db $14                                                               ;93A5D0;
    dw $2C37,$01FC                                                       ;93A5D1;
    db $0C                                                               ;93A5D5;
    dw $2C37,$01FC                                                       ;93A5D6;
    db $E4                                                               ;93A5DA;
    dw $2C37,$01FC                                                       ;93A5DB;
    db $04                                                               ;93A5DF;
    dw $2C37,$01FC                                                       ;93A5E0;
    db $FC                                                               ;93A5E4;
    dw $2C37,$01FC                                                       ;93A5E5;
    db $F4                                                               ;93A5E9;
    dw $2C37,$01FC                                                       ;93A5EA;
    db $EC                                                               ;93A5EE;
    dw $2C37                                                             ;93A5EF;

UNUSED_ProjectileFlareSpritemaps_93A5F1:
    dw $000A,$01E8                                                       ;93A5F1;
    db $0C                                                               ;93A5F5;
    dw $6C36,$01F0                                                       ;93A5F6;
    db $0C                                                               ;93A5FA;
    dw $6C35,$01F0                                                       ;93A5FB;
    db $04                                                               ;93A5FF;
    dw $6C36,$01F8                                                       ;93A600;
    db $04                                                               ;93A604;
    dw $6C35,$0008                                                       ;93A605;
    db $EC                                                               ;93A609;
    dw $6C36,$0010                                                       ;93A60A;
    db $EC                                                               ;93A60E;
    dw $6C35,$01F8                                                       ;93A60F;
    db $FC                                                               ;93A613;
    dw $6C36,$0000                                                       ;93A614;
    db $FC                                                               ;93A618;
    dw $6C35,$0000                                                       ;93A619;
    db $F4                                                               ;93A61D;
    dw $6C36,$0008                                                       ;93A61E;
    db $F4                                                               ;93A622;
    dw $6C35                                                             ;93A623;

UNUSED_ProjectileFlareSpritemaps_93A625:
    dw $0004,$0008                                                       ;93A625;
    db $FC                                                               ;93A629;
    dw $2C34,$0000                                                       ;93A62A;
    db $FC                                                               ;93A62E;
    dw $2C34,$01F8                                                       ;93A62F;
    db $FC                                                               ;93A633;
    dw $2C34,$01F0                                                       ;93A634;
    db $FC                                                               ;93A638;
    dw $2C34                                                             ;93A639;

UNUSED_ProjectileFlareSpritemaps_93A63B:
    dw $0006,$0008                                                       ;93A63B;
    db $04                                                               ;93A63F;
    dw $2C36,$0000                                                       ;93A640;
    db $04                                                               ;93A644;
    dw $2C35,$0000                                                       ;93A645;
    db $FC                                                               ;93A649;
    dw $2C36,$01F8                                                       ;93A64A;
    db $FC                                                               ;93A64E;
    dw $2C35,$01F8                                                       ;93A64F;
    db $F4                                                               ;93A653;
    dw $2C36,$01F0                                                       ;93A654;
    db $F4                                                               ;93A658;
    dw $2C35                                                             ;93A659;

UNUSED_ProjectileFlareSpritemaps_93A65B:
    dw $0004,$01FC                                                       ;93A65B;
    db $08                                                               ;93A65F;
    dw $2C37,$01FC                                                       ;93A660;
    db $00                                                               ;93A664;
    dw $2C37,$01FC                                                       ;93A665;
    db $F8                                                               ;93A669;
    dw $2C37,$01FC                                                       ;93A66A;
    db $F0                                                               ;93A66E;
    dw $2C37                                                             ;93A66F;

UNUSED_ProjectileFlareSpritemaps_93A671:
    dw $0006,$01F0                                                       ;93A671;
    db $04                                                               ;93A675;
    dw $6C36,$01F8                                                       ;93A676;
    db $04                                                               ;93A67A;
    dw $6C35,$01F8                                                       ;93A67B;
    db $FC                                                               ;93A67F;
    dw $6C36,$0000                                                       ;93A680;
    db $FC                                                               ;93A684;
    dw $6C35,$0000                                                       ;93A685;
    db $F4                                                               ;93A689;
    dw $6C36,$0008                                                       ;93A68A;
    db $F4                                                               ;93A68E;
    dw $6C35                                                             ;93A68F;

UNUSED_ProjectileFlareSpritemaps_93A691:
    dw $0004,$0000                                                       ;93A691;
    db $00                                                               ;93A695;
    dw $EC34,$01F8                                                       ;93A696;
    db $00                                                               ;93A69A;
    dw $AC34,$0000                                                       ;93A69B;
    db $F8                                                               ;93A69F;
    dw $6C34,$01F8                                                       ;93A6A0;
    db $F8                                                               ;93A6A4;
    dw $2C34                                                             ;93A6A5;

UNUSED_ProjectileFlareSpritemaps_93A6A7:
    dw $0004,$0000                                                       ;93A6A7;
    db $00                                                               ;93A6AB;
    dw $EC33,$01F8                                                       ;93A6AC;
    db $00                                                               ;93A6B0;
    dw $AC33,$0000                                                       ;93A6B1;
    db $F8                                                               ;93A6B5;
    dw $6C33,$01F8                                                       ;93A6B6;
    db $F8                                                               ;93A6BA;
    dw $2C33                                                             ;93A6BB;

UNUSED_ProjectileFlareSpritemaps_93A6BD:
    dw $0001,$01FC                                                       ;93A6BD;
    db $FC                                                               ;93A6C1;
    dw $2C35                                                             ;93A6C2;

UNUSED_ProjectileFlareSpritemaps_93A6C4:
    dw $0001,$01FC                                                       ;93A6C4;
    db $FC                                                               ;93A6C8;
    dw $2C36                                                             ;93A6C9;

UNUSED_ProjectileFlareSpritemaps_93A6CB:
    dw $0001,$01FC                                                       ;93A6CB;
    db $FC                                                               ;93A6CF;
    dw $2C37                                                             ;93A6D0;

UNUSED_ProjectileFlareSpritemaps_93A6D2:
    dw $0001,$01FC                                                       ;93A6D2;
    db $FC                                                               ;93A6D6;
    dw $3C53                                                             ;93A6D7;

UNUSED_ProjectileFlareSpritemaps_93A6D9:
    dw $0001,$01FC                                                       ;93A6D9;
    db $FC                                                               ;93A6DD;
    dw $3C52                                                             ;93A6DE;

UNUSED_ProjectileFlareSpritemaps_93A6E0:
    dw $0001,$01FC                                                       ;93A6E0;
    db $FC                                                               ;93A6E4;
    dw $3C51                                                             ;93A6E5;

UNUSED_ProjectileFlareSpritemaps_93A6E7:
    dw $0004,$01F8                                                       ;93A6E7;
    db $00                                                               ;93A6EB;
    dw $BC50,$0000                                                       ;93A6EC;
    db $00                                                               ;93A6F0;
    dw $FC50,$0000                                                       ;93A6F1;
    db $F8                                                               ;93A6F5;
    dw $7C50,$01F8                                                       ;93A6F6;
    db $F8                                                               ;93A6FA;
    dw $3C50                                                             ;93A6FB;
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_FlareSlowSparks_FacingRight_0:
    dw $0003,$0000                                                       ;93A6FD;
    db $0C                                                               ;93A701;
    dw $2A5B,$0008                                                       ;93A702;
    db $EC                                                               ;93A706;
    dw $2A5B,$01F0                                                       ;93A707;
    db $F4                                                               ;93A70B;
    dw $2A5B                                                             ;93A70C;

ProjectileFlareSpritemaps_FlareSlowSparks_FacingRight_1:
    dw $0003,$01FD                                                       ;93A70E;
    db $0A                                                               ;93A712;
    dw $2A5C,$0006                                                       ;93A713;
    db $EE                                                               ;93A717;
    dw $2A5C,$01F2                                                       ;93A718;
    db $F6                                                               ;93A71C;
    dw $2A5C                                                             ;93A71D;

ProjectileFlareSpritemaps_FlareSlowSparks_FacingRight_2:
    dw $0003,$01FC                                                       ;93A71F;
    db $08                                                               ;93A723;
    dw $2A5C,$0004                                                       ;93A724;
    db $F0                                                               ;93A728;
    dw $2A5C,$01F4                                                       ;93A729;
    db $F8                                                               ;93A72D;
    dw $2A5C                                                             ;93A72E;

ProjectileFlareSpritemaps_FlareSlowSparks_FacingRight_3:
    dw $0003,$0002                                                       ;93A730;
    db $F2                                                               ;93A734;
    dw $2A5D,$01FB                                                       ;93A735;
    db $06                                                               ;93A739;
    dw $2A5D,$01F6                                                       ;93A73A;
    db $FA                                                               ;93A73E;
    dw $2A5D                                                             ;93A73F;

ProjectileFlareSpritemaps_FlareSlowSparks_FacingRight_4:
    dw $0003,$01FB                                                       ;93A741;
    db $04                                                               ;93A745;
    dw $2A5D,$01F8                                                       ;93A746;
    db $FB                                                               ;93A74A;
    dw $2A5D,$0000                                                       ;93A74B;
    db $F4                                                               ;93A74F;
    dw $2A5D                                                             ;93A750;

ProjectileFlareSpritemaps_FlareSlowSparks_FacingRight_5:
    dw $0003,$01FB                                                       ;93A752;
    db $02                                                               ;93A756;
    dw $2A5D,$01FA                                                       ;93A757;
    db $FA                                                               ;93A75B;
    dw $2A5D,$0000                                                       ;93A75C;
    db $F6                                                               ;93A760;
    dw $2A5D                                                             ;93A761;

ProjectileFlareSpritemaps_FlareFastSparks_FacingRight_0:
    dw $0003,$0000                                                       ;93A763;
    db $EC                                                               ;93A767;
    dw $AA5B,$0008                                                       ;93A768;
    db $0C                                                               ;93A76C;
    dw $AA5B,$01F0                                                       ;93A76D;
    db $04                                                               ;93A771;
    dw $AA5B                                                             ;93A772;

ProjectileFlareSpritemaps_FlareFastSparks_FacingRight_1:
    dw $0003,$01FE                                                       ;93A774;
    db $EE                                                               ;93A778;
    dw $AA5C,$0006                                                       ;93A779;
    db $0A                                                               ;93A77D;
    dw $AA5C,$01F2                                                       ;93A77E;
    db $02                                                               ;93A782;
    dw $AA5C                                                             ;93A783;

ProjectileFlareSpritemaps_FlareFastSparks_FacingRight_2:
    dw $0003,$0004                                                       ;93A785;
    db $08                                                               ;93A789;
    dw $AA5C,$01F4                                                       ;93A78A;
    db $00                                                               ;93A78E;
    dw $AA5C,$01FD                                                       ;93A78F;
    db $F0                                                               ;93A793;
    dw $AA5C                                                             ;93A794;

ProjectileFlareSpritemaps_FlareFastSparks_FacingRight_3:
    dw $0003,$0002                                                       ;93A796;
    db $06                                                               ;93A79A;
    dw $AA5D,$01FC                                                       ;93A79B;
    db $F2                                                               ;93A79F;
    dw $AA5D,$01F6                                                       ;93A7A0;
    db $FE                                                               ;93A7A4;
    dw $AA5D                                                             ;93A7A5;

ProjectileFlareSpritemaps_FlareFastSparks_FacingRight_4:
    dw $0003,$01FC                                                       ;93A7A7;
    db $F4                                                               ;93A7AB;
    dw $AA5D,$01F8                                                       ;93A7AC;
    db $FC                                                               ;93A7B0;
    dw $AA5D,$0000                                                       ;93A7B1;
    db $04                                                               ;93A7B5;
    dw $AA5D                                                             ;93A7B6;

ProjectileFlareSpritemaps_FlareFastSparks_FacingRight_5:
    dw $0003,$01FC                                                       ;93A7B8;
    db $F6                                                               ;93A7BC;
    dw $AA5D,$01FA                                                       ;93A7BD;
    db $FD                                                               ;93A7C1;
    dw $AA5D,$0000                                                       ;93A7C2;
    db $02                                                               ;93A7C6;
    dw $AA5D                                                             ;93A7C7;

ProjectileFlareSpritemaps_MissileExplosion_0:
    dw $0001,$01FC                                                       ;93A7C9;
    db $FC                                                               ;93A7CD;
    dw $3A5F                                                             ;93A7CE;

ProjectileFlareSpritemaps_MissileExplosion_1:
    dw $0004,$0000                                                       ;93A7D0;
    db $00                                                               ;93A7D4;
    dw $FA8A,$01F8                                                       ;93A7D5;
    db $00                                                               ;93A7D9;
    dw $BA8A,$0000                                                       ;93A7DA;
    db $F8                                                               ;93A7DE;
    dw $7A8A,$01F8                                                       ;93A7DF;
    db $F8                                                               ;93A7E3;
    dw $3A8A                                                             ;93A7E4;

ProjectileFlareSpritemaps_MissileExplosion_2:
    dw $0004,$C200                                                       ;93A7E6;
    db $00                                                               ;93A7EA;
    dw $FA90,$C3F0                                                       ;93A7EB;
    db $00                                                               ;93A7EF;
    dw $BA90,$C200                                                       ;93A7F0;
    db $F0                                                               ;93A7F4;
    dw $7A90,$C3F0                                                       ;93A7F5;
    db $F0                                                               ;93A7F9;
    dw $3A90                                                             ;93A7FA;

ProjectileFlareSpritemaps_MissileExplosion_3:
    dw $0004,$C200                                                       ;93A7FC;
    db $00                                                               ;93A800;
    dw $FA92,$C3F0                                                       ;93A801;
    db $00                                                               ;93A805;
    dw $BA92,$C200                                                       ;93A806;
    db $F0                                                               ;93A80A;
    dw $7A92,$C3F0                                                       ;93A80B;
    db $F0                                                               ;93A80F;
    dw $3A92                                                             ;93A810;

ProjectileFlareSpritemaps_MissileExplosion_4:
    dw $0004,$C200                                                       ;93A812;
    db $00                                                               ;93A816;
    dw $FA94,$C3F0                                                       ;93A817;
    db $00                                                               ;93A81B;
    dw $BA94,$C200                                                       ;93A81C;
    db $F0                                                               ;93A820;
    dw $7A94,$C3F0                                                       ;93A821;
    db $F0                                                               ;93A825;
    dw $3A94                                                             ;93A826;

ProjectileFlareSpritemaps_MissileExplosion_5:
    dw $0004,$C200                                                       ;93A828;
    db $00                                                               ;93A82C;
    dw $FA96,$C3F0                                                       ;93A82D;
    db $00                                                               ;93A831;
    dw $BA96,$C200                                                       ;93A832;
    db $F0                                                               ;93A836;
    dw $7A96,$C3F0                                                       ;93A837;
    db $F0                                                               ;93A83B;
    dw $3A96                                                             ;93A83C;

ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_0:
    dw $0004,$0000                                                       ;93A83E;
    db $00                                                               ;93A842;
    dw $FA8B,$01F8                                                       ;93A843;
    db $00                                                               ;93A847;
    dw $BA8B,$0000                                                       ;93A848;
    db $F8                                                               ;93A84C;
    dw $7A8B,$01F8                                                       ;93A84D;
    db $F8                                                               ;93A851;
    dw $3A8B                                                             ;93A852;

ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_1:
    dw $0004,$0000                                                       ;93A854;
    db $00                                                               ;93A858;
    dw $FA7A,$01F8                                                       ;93A859;
    db $00                                                               ;93A85D;
    dw $BA7A,$0000                                                       ;93A85E;
    db $F8                                                               ;93A862;
    dw $7A7A,$01F8                                                       ;93A863;
    db $F8                                                               ;93A867;
    dw $3A7A                                                             ;93A868;

ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_2:
    dw $0004,$C200                                                       ;93A86A;
    db $00                                                               ;93A86E;
    dw $FA70,$C3F0                                                       ;93A86F;
    db $00                                                               ;93A873;
    dw $BA70,$C200                                                       ;93A874;
    db $F0                                                               ;93A878;
    dw $7A70,$C3F0                                                       ;93A879;
    db $F0                                                               ;93A87D;
    dw $3A70                                                             ;93A87E;

ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_3:
    dw $0004,$C200                                                       ;93A880;
    db $00                                                               ;93A884;
    dw $FA72,$C3F0                                                       ;93A885;
    db $00                                                               ;93A889;
    dw $BA72,$C200                                                       ;93A88A;
    db $F0                                                               ;93A88E;
    dw $7A72,$C3F0                                                       ;93A88F;
    db $F0                                                               ;93A893;
    dw $3A72                                                             ;93A894;

ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_4:
    dw $0004,$C200                                                       ;93A896;
    db $00                                                               ;93A89A;
    dw $FA74,$C3F0                                                       ;93A89B;
    db $00                                                               ;93A89F;
    dw $BA74,$C200                                                       ;93A8A0;
    db $F0                                                               ;93A8A4;
    dw $7A74,$C3F0                                                       ;93A8A5;
    db $F0                                                               ;93A8A9;
    dw $3A74                                                             ;93A8AA;

ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_5:
    dw $0004,$01F8                                                       ;93A8AC;
    db $00                                                               ;93A8B0;
    dw $3A5E,$0000                                                       ;93A8B1;
    db $00                                                               ;93A8B5;
    dw $3A5E,$0000                                                       ;93A8B6;
    db $F8                                                               ;93A8BA;
    dw $3A5E,$01F8                                                       ;93A8BB;
    db $F8                                                               ;93A8BF;
    dw $3A5E                                                             ;93A8C0;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_93A8C2:
    dw $0001,$01FC                                                       ;93A8C2;
    db $FC                                                               ;93A8C6;
    dw $3C38                                                             ;93A8C7;

UNUSED_ProjectileFlareSpritemaps_93A8C9:
    dw $0001,$01FC                                                       ;93A8C9;
    db $FC                                                               ;93A8CD;
    dw $3C39                                                             ;93A8CE;

UNUSED_ProjectileFlareSpritemaps_93A8D0:
    dw $0001,$01FC                                                       ;93A8D0;
    db $FC                                                               ;93A8D4;
    dw $3C3A                                                             ;93A8D5;

UNUSED_ProjectileFlareSpritemaps_93A8D7:
    dw $0001,$01FC                                                       ;93A8D7;
    db $FC                                                               ;93A8DB;
    dw $3C3B                                                             ;93A8DC;
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_FlareSlowSparks_FacingLeft_0:
    dw $0003,$01F8                                                       ;93A8DE;
    db $0C                                                               ;93A8E2;
    dw $6C5B,$01F0                                                       ;93A8E3;
    db $EC                                                               ;93A8E7;
    dw $6C5B,$0008                                                       ;93A8E8;
    db $F4                                                               ;93A8EC;
    dw $6C5B                                                             ;93A8ED;

ProjectileFlareSpritemaps_FlareSlowSparks_FacingLeft_1:
    dw $0003,$01FB                                                       ;93A8EF;
    db $0A                                                               ;93A8F3;
    dw $6C5C,$01F2                                                       ;93A8F4;
    db $EE                                                               ;93A8F8;
    dw $6C5C,$0006                                                       ;93A8F9;
    db $F6                                                               ;93A8FD;
    dw $6C5C                                                             ;93A8FE;

ProjectileFlareSpritemaps_FlareSlowSparks_FacingLeft_2:
    dw $0003,$01FC                                                       ;93A900;
    db $08                                                               ;93A904;
    dw $6C5C,$01F4                                                       ;93A905;
    db $F0                                                               ;93A909;
    dw $6C5C,$0004                                                       ;93A90A;
    db $F8                                                               ;93A90E;
    dw $6C5C                                                             ;93A90F;

ProjectileFlareSpritemaps_FlareSlowSparks_FacingLeft_3:
    dw $0003,$01F6                                                       ;93A911;
    db $F2                                                               ;93A915;
    dw $6C5D,$01FD                                                       ;93A916;
    db $06                                                               ;93A91A;
    dw $6C5D,$0002                                                       ;93A91B;
    db $FA                                                               ;93A91F;
    dw $6C5D                                                             ;93A920;

ProjectileFlareSpritemaps_FlareSlowSparks_FacingLeft_4:
    dw $0003,$01FD                                                       ;93A922;
    db $04                                                               ;93A926;
    dw $6C5D,$0000                                                       ;93A927;
    db $FB                                                               ;93A92B;
    dw $6C5D,$01F8                                                       ;93A92C;
    db $F4                                                               ;93A930;
    dw $6C5D                                                             ;93A931;

ProjectileFlareSpritemaps_FlareSlowSparks_FacingLeft_5:
    dw $0003,$01FD                                                       ;93A933;
    db $02                                                               ;93A937;
    dw $6C5D,$01FE                                                       ;93A938;
    db $FA                                                               ;93A93C;
    dw $6C5D,$01F8                                                       ;93A93D;
    db $F6                                                               ;93A941;
    dw $6C5D                                                             ;93A942;

ProjectileFlareSpritemaps_FlareFastSparks_FacingLeft_0:
    dw $0003,$01F8                                                       ;93A944;
    db $EC                                                               ;93A948;
    dw $EC5B,$01F0                                                       ;93A949;
    db $0C                                                               ;93A94D;
    dw $EC5B,$0008                                                       ;93A94E;
    db $04                                                               ;93A952;
    dw $EC5B                                                             ;93A953;

ProjectileFlareSpritemaps_FlareFastSparks_FacingLeft_1:
    dw $0003,$01FA                                                       ;93A955;
    db $EE                                                               ;93A959;
    dw $EC5C,$01F2                                                       ;93A95A;
    db $0A                                                               ;93A95E;
    dw $EC5C,$0006                                                       ;93A95F;
    db $02                                                               ;93A963;
    dw $EC5C                                                             ;93A964;

ProjectileFlareSpritemaps_FlareFastSparks_FacingLeft_2:
    dw $0003,$01F4                                                       ;93A966;
    db $08                                                               ;93A96A;
    dw $EC5C,$0004                                                       ;93A96B;
    db $00                                                               ;93A96F;
    dw $EC5C,$01FB                                                       ;93A970;
    db $F0                                                               ;93A974;
    dw $EC5C                                                             ;93A975;

ProjectileFlareSpritemaps_FlareFastSparks_FacingLeft_3:
    dw $0003,$01F6                                                       ;93A977;
    db $06                                                               ;93A97B;
    dw $EC5D,$01FC                                                       ;93A97C;
    db $F2                                                               ;93A980;
    dw $EC5D,$0002                                                       ;93A981;
    db $FE                                                               ;93A985;
    dw $EC5D                                                             ;93A986;

ProjectileFlareSpritemaps_FlareFastSparks_FacingLeft_4:
    dw $0003,$01FC                                                       ;93A988;
    db $F4                                                               ;93A98C;
    dw $EC5D,$0000                                                       ;93A98D;
    db $FC                                                               ;93A991;
    dw $EC5D,$01F8                                                       ;93A992;
    db $04                                                               ;93A996;
    dw $EC5D                                                             ;93A997;

ProjectileFlareSpritemaps_FlareFastSparks_FacingLeft_5:
    dw $0003,$01FC                                                       ;93A999;
    db $F6                                                               ;93A99D;
    dw $EC5D,$01FE                                                       ;93A99E;
    db $FD                                                               ;93A9A2;
    dw $EC5D,$01F8                                                       ;93A9A3;
    db $02                                                               ;93A9A7;
    dw $EC5D                                                             ;93A9A8;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_93A9AA:
    dw $0001,$01F7                                                       ;93A9AA;
    db $F7                                                               ;93A9AE;
    dw $3A48                                                             ;93A9AF;

UNUSED_ProjectileFlareSpritemaps_93A9B1:
    dw $0002,$0001                                                       ;93A9B1;
    db $01                                                               ;93A9B5;
    dw $3A48,$C3F3                                                       ;93A9B6;
    db $F3                                                               ;93A9BA;
    dw $3A7C                                                             ;93A9BB;

UNUSED_ProjectileFlareSpritemaps_93A9BD:
    dw $0003,$C3FD                                                       ;93A9BD;
    db $FD                                                               ;93A9C1;
    dw $3A7C,$01F7                                                       ;93A9C2;
    db $01                                                               ;93A9C6;
    dw $3A48,$C3F3                                                       ;93A9C7;
    db $F3                                                               ;93A9CB;
    dw $3A7E                                                             ;93A9CC;

UNUSED_ProjectileFlareSpritemaps_93A9CE:
    dw $0004,$0001                                                       ;93A9CE;
    db $F7                                                               ;93A9D2;
    dw $3A48,$C3FD                                                       ;93A9D3;
    db $FD                                                               ;93A9D7;
    dw $3A7E,$C3F3                                                       ;93A9D8;
    db $FD                                                               ;93A9DC;
    dw $3A7C,$C3F3                                                       ;93A9DD;
    db $F3                                                               ;93A9E1;
    dw $3A9A                                                             ;93A9E2;

UNUSED_ProjectileFlareSpritemaps_93A9E4:
    dw $0004,$C3FD                                                       ;93A9E4;
    db $F3                                                               ;93A9E8;
    dw $3A7C,$C3FD                                                       ;93A9E9;
    db $FD                                                               ;93A9ED;
    dw $3A9A,$C3F3                                                       ;93A9EE;
    db $FD                                                               ;93A9F2;
    dw $3A7E,$C3F3                                                       ;93A9F3;
    db $F3                                                               ;93A9F7;
    dw $3A9C                                                             ;93A9F8;

UNUSED_ProjectileFlareSpritemaps_93A9FA:
    dw $0003,$C3FD                                                       ;93A9FA;
    db $F3                                                               ;93A9FE;
    dw $3A7E,$C3FD                                                       ;93A9FF;
    db $FD                                                               ;93AA03;
    dw $3A9C,$C3F3                                                       ;93AA04;
    db $FD                                                               ;93AA08;
    dw $3A9A                                                             ;93AA09;

UNUSED_ProjectileFlareSpritemaps_93AA0B:
    dw $0002,$C3FD                                                       ;93AA0B;
    db $F3                                                               ;93AA0F;
    dw $3A9A,$C3F3                                                       ;93AA10;
    db $FD                                                               ;93AA14;
    dw $3A9C                                                             ;93AA15;

UNUSED_ProjectileFlareSpritemaps_93AA17:
    dw $0001,$C3FD                                                       ;93AA17;
    db $F3                                                               ;93AA1B;
    dw $3A9C                                                             ;93AA1C;

UNUSED_ProjectileFlareSpritemaps_93AA1E:
    dw $0001,$01FC                                                       ;93AA1E;
    db $FC                                                               ;93AA22;
    dw $3C5E                                                             ;93AA23;

UNUSED_ProjectileFlareSpritemaps_93AA25:
    dw $0001,$01FC                                                       ;93AA25;
    db $FC                                                               ;93AA29;
    dw $3C5F                                                             ;93AA2A;

UNUSED_ProjectileFlareSpritemaps_93AA2C:
    dw $0004,$0000                                                       ;93AA2C;
    db $00                                                               ;93AA30;
    dw $FC60,$0000                                                       ;93AA31;
    db $F8                                                               ;93AA35;
    dw $7C60,$01F8                                                       ;93AA36;
    db $00                                                               ;93AA3A;
    dw $BC60,$01F8                                                       ;93AA3B;
    db $F8                                                               ;93AA3F;
    dw $3C60                                                             ;93AA40;

UNUSED_ProjectileFlareSpritemaps_93AA42:
    dw $0004,$0000                                                       ;93AA42;
    db $00                                                               ;93AA46;
    dw $FC61,$0000                                                       ;93AA47;
    db $F8                                                               ;93AA4B;
    dw $7C61,$01F8                                                       ;93AA4C;
    db $00                                                               ;93AA50;
    dw $BC61,$01F8                                                       ;93AA51;
    db $F8                                                               ;93AA55;
    dw $3C61                                                             ;93AA56;

UNUSED_ProjectileFlareSpritemaps_93AA58:
    dw $0004,$0000                                                       ;93AA58;
    db $00                                                               ;93AA5C;
    dw $FC62,$0000                                                       ;93AA5D;
    db $F8                                                               ;93AA61;
    dw $7C62,$01F8                                                       ;93AA62;
    db $00                                                               ;93AA66;
    dw $BC62,$01F8                                                       ;93AA67;
    db $F8                                                               ;93AA6B;
    dw $3C62                                                             ;93AA6C;

UNUSED_ProjectileFlareSpritemaps_93AA6E:
    dw $0004,$0000                                                       ;93AA6E;
    db $00                                                               ;93AA72;
    dw $FC63,$0000                                                       ;93AA73;
    db $F8                                                               ;93AA77;
    dw $7C63,$01F8                                                       ;93AA78;
    db $00                                                               ;93AA7C;
    dw $BC63,$01F8                                                       ;93AA7D;
    db $F8                                                               ;93AA81;
    dw $3C63                                                             ;93AA82;
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_SuperMissileExplosion_0:
    dw $0004,$0000                                                       ;93AA84;
    db $00                                                               ;93AA88;
    dw $FA8A,$01F8                                                       ;93AA89;
    db $00                                                               ;93AA8D;
    dw $BA8A,$0000                                                       ;93AA8E;
    db $F8                                                               ;93AA92;
    dw $7A8A,$01F8                                                       ;93AA93;
    db $F8                                                               ;93AA97;
    dw $3A8A                                                             ;93AA98;

ProjectileFlareSpritemaps_SuperMissileExplosion_1:
    dw $0004,$C200                                                       ;93AA9A;
    db $00                                                               ;93AA9E;
    dw $FA90,$C200                                                       ;93AA9F;
    db $F0                                                               ;93AAA3;
    dw $7A90,$C3F0                                                       ;93AAA4;
    db $00                                                               ;93AAA8;
    dw $BA90,$C3F0                                                       ;93AAA9;
    db $F0                                                               ;93AAAD;
    dw $3A90                                                             ;93AAAE;

ProjectileFlareSpritemaps_SuperMissileExplosion_2:
    dw $0004,$C200                                                       ;93AAB0;
    db $00                                                               ;93AAB4;
    dw $FA92,$C3F0                                                       ;93AAB5;
    db $00                                                               ;93AAB9;
    dw $BA92,$C200                                                       ;93AABA;
    db $F0                                                               ;93AABE;
    dw $7A92,$C3F0                                                       ;93AABF;
    db $F0                                                               ;93AAC3;
    dw $3A92                                                             ;93AAC4;

ProjectileFlareSpritemaps_SuperMissileExplosion_3:
    dw $000C,$0010                                                       ;93AAC6;
    db $00                                                               ;93AACA;
    dw $FAC2,$0010                                                       ;93AACB;
    db $F8                                                               ;93AACF;
    dw $7AC2,$0000                                                       ;93AAD0;
    db $10                                                               ;93AAD4;
    dw $FAB2,$01F8                                                       ;93AAD5;
    db $10                                                               ;93AAD9;
    dw $BAB2,$01E8                                                       ;93AADA;
    db $00                                                               ;93AADE;
    dw $BAC2,$01E8                                                       ;93AADF;
    db $F8                                                               ;93AAE3;
    dw $3AC2,$0000                                                       ;93AAE4;
    db $E8                                                               ;93AAE8;
    dw $7AB2,$01F8                                                       ;93AAE9;
    db $E8                                                               ;93AAED;
    dw $3AB2,$C200                                                       ;93AAEE;
    db $00                                                               ;93AAF2;
    dw $FAB0,$C200                                                       ;93AAF3;
    db $F0                                                               ;93AAF7;
    dw $7AB0,$C3F0                                                       ;93AAF8;
    db $00                                                               ;93AAFC;
    dw $BAB0,$C3F0                                                       ;93AAFD;
    db $F0                                                               ;93AB01;
    dw $3AB0                                                             ;93AB02;

ProjectileFlareSpritemaps_SuperMissileExplosion_4:
    dw $0008,$C208                                                       ;93AB04;
    db $00                                                               ;93AB08;
    dw $FAB5,$C200                                                       ;93AB09;
    db $08                                                               ;93AB0D;
    dw $FAB3,$C3E8                                                       ;93AB0E;
    db $00                                                               ;93AB12;
    dw $BAB5,$C3F0                                                       ;93AB13;
    db $08                                                               ;93AB17;
    dw $BAB3,$C208                                                       ;93AB18;
    db $F0                                                               ;93AB1C;
    dw $7AB5,$C200                                                       ;93AB1D;
    db $E8                                                               ;93AB21;
    dw $7AB3,$C3E8                                                       ;93AB22;
    db $F0                                                               ;93AB26;
    dw $3AB5,$C3F0                                                       ;93AB27;
    db $E8                                                               ;93AB2B;
    dw $3AB3                                                             ;93AB2C;

ProjectileFlareSpritemaps_SuperMissileExplosion_5:
    dw $000C,$0000                                                       ;93AB2E;
    db $10                                                               ;93AB32;
    dw $FABB,$01F8                                                       ;93AB33;
    db $10                                                               ;93AB37;
    dw $BABB,$0000                                                       ;93AB38;
    db $E8                                                               ;93AB3C;
    dw $7ABB,$01F8                                                       ;93AB3D;
    db $E8                                                               ;93AB41;
    dw $3ABB,$0010                                                       ;93AB42;
    db $00                                                               ;93AB46;
    dw $FAB7,$0010                                                       ;93AB47;
    db $F8                                                               ;93AB4B;
    dw $7AB7,$01E8                                                       ;93AB4C;
    db $00                                                               ;93AB50;
    dw $BAB7,$01E8                                                       ;93AB51;
    db $F8                                                               ;93AB55;
    dw $3AB7,$C208                                                       ;93AB56;
    db $08                                                               ;93AB5A;
    dw $FAB8,$C3E8                                                       ;93AB5B;
    db $08                                                               ;93AB5F;
    dw $BAB8,$C208                                                       ;93AB60;
    db $E8                                                               ;93AB64;
    dw $7AB8,$C3E8                                                       ;93AB65;
    db $E8                                                               ;93AB69;
    dw $3AB8                                                             ;93AB6A;

ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_0:
    dw $0001,$01FC                                                       ;93AB6C;
    db $FC                                                               ;93AB70;
    dw $2C53                                                             ;93AB71;

ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_1:
    dw $0001,$01FC                                                       ;93AB73;
    db $FC                                                               ;93AB77;
    dw $2C52                                                             ;93AB78;

ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_2:
    dw $0001,$01FC                                                       ;93AB7A;
    db $FC                                                               ;93AB7E;
    dw $2C51                                                             ;93AB7F;

ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_3:
    dw $0004,$01F8                                                       ;93AB81;
    db $00                                                               ;93AB85;
    dw $AC50,$0000                                                       ;93AB86;
    db $00                                                               ;93AB8A;
    dw $EC50,$0000                                                       ;93AB8B;
    db $F8                                                               ;93AB8F;
    dw $6C50,$01F8                                                       ;93AB90;
    db $F8                                                               ;93AB94;
    dw $2C50                                                             ;93AB95;

ProjectileFlareSpritemaps_PowerBomb_0:
    dw $0001,$01FC                                                       ;93AB97;
    db $FC                                                               ;93AB9B;
    dw $3A26                                                             ;93AB9C;

ProjectileFlareSpritemaps_PowerBomb_1:
    dw $0001,$01FC                                                       ;93AB9E;
    db $FC                                                               ;93ABA2;
    dw $3A27                                                             ;93ABA3;

ProjectileFlareSpritemaps_PowerBomb_2:
    dw $0001,$01FC                                                       ;93ABA5;
    db $FC                                                               ;93ABA9;
    dw $3A7B                                                             ;93ABAA;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_93ABAC:
    dw $0001,$01FC                                                       ;93ABAC;
    db $FC                                                               ;93ABB0;
    dw $3A5F                                                             ;93ABB1;
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_BeamExplosion_0:
    dw $0001,$01FC                                                       ;93ABB3;
    db $FC                                                               ;93ABB7;
    dw $3C53                                                             ;93ABB8;

ProjectileFlareSpritemaps_BeamExplosion_1:
    dw $0001,$01FC                                                       ;93ABBA;
    db $FC                                                               ;93ABBE;
    dw $3C51                                                             ;93ABBF;

ProjectileFlareSpritemaps_BeamExplosion_2:
    dw $0004,$0000                                                       ;93ABC1;
    db $00                                                               ;93ABC5;
    dw $FC60,$0000                                                       ;93ABC6;
    db $F8                                                               ;93ABCA;
    dw $7C60,$01F8                                                       ;93ABCB;
    db $00                                                               ;93ABCF;
    dw $BC60,$01F8                                                       ;93ABD0;
    db $F8                                                               ;93ABD4;
    dw $3C60                                                             ;93ABD5;

ProjectileFlareSpritemaps_BeamExplosion_3:
    dw $0004,$0000                                                       ;93ABD7;
    db $00                                                               ;93ABDB;
    dw $FC61,$0000                                                       ;93ABDC;
    db $F8                                                               ;93ABE0;
    dw $7C61,$01F8                                                       ;93ABE1;
    db $00                                                               ;93ABE5;
    dw $BC61,$01F8                                                       ;93ABE6;
    db $F8                                                               ;93ABEA;
    dw $3C61                                                             ;93ABEB;

ProjectileFlareSpritemaps_BeamExplosion_4:
    dw $0004,$0000                                                       ;93ABED;
    db $00                                                               ;93ABF1;
    dw $FC62,$0000                                                       ;93ABF2;
    db $F8                                                               ;93ABF6;
    dw $7C62,$01F8                                                       ;93ABF7;
    db $00                                                               ;93ABFB;
    dw $BC62,$01F8                                                       ;93ABFC;
    db $F8                                                               ;93AC00;
    dw $3C62                                                             ;93AC01;

ProjectileFlareSpritemaps_BeamExplosion_5:
    dw $0004,$0000                                                       ;93AC03;
    db $00                                                               ;93AC07;
    dw $FC63,$0000                                                       ;93AC08;
    db $F8                                                               ;93AC0C;
    dw $7C63,$01F8                                                       ;93AC0D;
    db $00                                                               ;93AC11;
    dw $BC63,$01F8                                                       ;93AC12;
    db $F8                                                               ;93AC16;
    dw $3C63                                                             ;93AC17;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_93AC19:
    dw $0004,$01F2                                                       ;93AC19;
    db $FC                                                               ;93AC1D;
    dw $7A6C,$0006                                                       ;93AC1E;
    db $FC                                                               ;93AC22;
    dw $7A6C,$0000                                                       ;93AC23;
    db $FC                                                               ;93AC27;
    dw $7A6C,$01F8                                                       ;93AC28;
    db $FC                                                               ;93AC2C;
    dw $3A6C                                                             ;93AC2D;

UNUSED_ProjectileFlareSpritemaps_93AC2F:
    dw $0004,$0000                                                       ;93AC2F;
    db $FC                                                               ;93AC33;
    dw $7A6E,$0008                                                       ;93AC34;
    db $FC                                                               ;93AC38;
    dw $7A6D,$01F8                                                       ;93AC39;
    db $FC                                                               ;93AC3D;
    dw $3A6E,$01F0                                                       ;93AC3E;
    db $FC                                                               ;93AC42;
    dw $3A6D                                                             ;93AC43;

UNUSED_ProjectileFlareSpritemaps_93AC45:
    dw $0004,$01F0                                                       ;93AC45;
    db $FE                                                               ;93AC49;
    dw $3A6F,$0008                                                       ;93AC4A;
    db $FE                                                               ;93AC4E;
    dw $3A6F,$0000                                                       ;93AC4F;
    db $FE                                                               ;93AC53;
    dw $3A6F,$01F8                                                       ;93AC54;
    db $FE                                                               ;93AC58;
    dw $3A6F                                                             ;93AC59;

UNUSED_ProjectileFlareSpritemaps_93AC5B:
    dw $0001,$C3F8                                                       ;93AC5B;
    db $F8                                                               ;93AC5F;
    dw $3A7C                                                             ;93AC60;

UNUSED_ProjectileFlareSpritemaps_93AC62:
    dw $0001,$C3F8                                                       ;93AC62;
    db $F6                                                               ;93AC66;
    dw $3A7E                                                             ;93AC67;

UNUSED_ProjectileFlareSpritemaps_93AC69:
    dw $0001,$C3F8                                                       ;93AC69;
    db $F4                                                               ;93AC6D;
    dw $3A9A                                                             ;93AC6E;

UNUSED_ProjectileFlareSpritemaps_93AC70:
    dw $0001,$C3F8                                                       ;93AC70;
    db $F2                                                               ;93AC74;
    dw $3A9C                                                             ;93AC75;

UNUSED_ProjectileFlareSpritemaps_93AC77:
    dw $0001,$01FC                                                       ;93AC77;
    db $FC                                                               ;93AC7B;
    dw $2A48                                                             ;93AC7C;

UNUSED_ProjectileFlareSpritemaps_93AC7E:
    dw $0001,$01FC                                                       ;93AC7E;
    db $FA                                                               ;93AC82;
    dw $2A49                                                             ;93AC83;

UNUSED_ProjectileFlareSpritemaps_93AC85:
    dw $0001,$01FC                                                       ;93AC85;
    db $F8                                                               ;93AC89;
    dw $2A4A                                                             ;93AC8A;

UNUSED_ProjectileFlareSpritemaps_93AC8C:
    dw $0001,$01FC                                                       ;93AC8C;
    db $F6                                                               ;93AC90;
    dw $2A4B                                                             ;93AC91;

UNUSED_ProjectileFlareSpritemaps_93AC93:
    dw $0001,$01FC                                                       ;93AC93;
    db $FC                                                               ;93AC97;
    dw $3A2C                                                             ;93AC98;

UNUSED_ProjectileFlareSpritemaps_93AC9A:
    dw $0001,$01FC                                                       ;93AC9A;
    db $FC                                                               ;93AC9E;
    dw $3A2D                                                             ;93AC9F;

UNUSED_ProjectileFlareSpritemaps_93ACA1:
    dw $0001,$01FC                                                       ;93ACA1;
    db $FC                                                               ;93ACA5;
    dw $3A2E                                                             ;93ACA6;

UNUSED_ProjectileFlareSpritemaps_93ACA8:
    dw $0001,$01FC                                                       ;93ACA8;
    db $FC                                                               ;93ACAC;
    dw $3A2F                                                             ;93ACAD;

UNUSED_ProjectileFlareSpritemaps_93ACAF:
    dw $0001,$C3F8                                                       ;93ACAF;
    db $F6                                                               ;93ACB3;
    dw $3A76                                                             ;93ACB4;

UNUSED_ProjectileFlareSpritemaps_93ACB6:
    dw $0001,$C3F8                                                       ;93ACB6;
    db $F4                                                               ;93ACBA;
    dw $3A78                                                             ;93ACBB;

UNUSED_ProjectileFlareSpritemaps_93ACBD:
    dw $0001,$C3F8                                                       ;93ACBD;
    db $F2                                                               ;93ACC1;
    dw $3A98                                                             ;93ACC2;

UNUSED_ProjectileFlareSpritemaps_93ACC4:
    dw $0001,$C3F8                                                       ;93ACC4;
    db $F0                                                               ;93ACC8;
    dw $3A9E                                                             ;93ACC9;

UNUSED_ProjectileFlareSpritemaps_93ACCB:
    dw $0001,$01FC                                                       ;93ACCB;
    db $FC                                                               ;93ACCF;
    dw $3A25                                                             ;93ACD0;

UNUSED_ProjectileFlareSpritemaps_93ACD2:
    dw $0001,$01FC                                                       ;93ACD2;
    db $FC                                                               ;93ACD6;
    dw $3A43                                                             ;93ACD7;

UNUSED_ProjectileFlareSpritemaps_93ACD9:
    dw $0001,$01FC                                                       ;93ACD9;
    db $FC                                                               ;93ACDD;
    dw $3A40                                                             ;93ACDE;

UNUSED_ProjectileFlareSpritemaps_93ACE0:
    dw $0001,$01FC                                                       ;93ACE0;
    db $FC                                                               ;93ACE4;
    dw $3A3E                                                             ;93ACE5;

UNUSED_ProjectileFlareSpritemaps_93ACE7:
    dw $0001,$01FC                                                       ;93ACE7;
    db $FC                                                               ;93ACEB;
    dw $3A3D                                                             ;93ACEC;

UNUSED_ProjectileFlareSpritemaps_93ACEE:
    dw $0001,$01FC                                                       ;93ACEE;
    db $FC                                                               ;93ACF2;
    dw $3A41                                                             ;93ACF3;

UNUSED_ProjectileFlareSpritemaps_93ACF5:
    dw $0001,$01FC                                                       ;93ACF5;
    db $FC                                                               ;93ACF9;
    dw $3A42                                                             ;93ACFA;

UNUSED_ProjectileFlareSpritemaps_93ACFC:
    dw $0004,$0000                                                       ;93ACFC;
    db $00                                                               ;93AD00;
    dw $FA44,$01F8                                                       ;93AD01;
    db $00                                                               ;93AD05;
    dw $BA44,$0000                                                       ;93AD06;
    db $F8                                                               ;93AD0A;
    dw $7A44,$01F8                                                       ;93AD0B;
    db $F8                                                               ;93AD0F;
    dw $3A44                                                             ;93AD10;

UNUSED_ProjectileFlareSpritemaps_93AC12:
    dw $0004,$0000                                                       ;93AD12;
    db $00                                                               ;93AD16;
    dw $FA45,$0000                                                       ;93AD17;
    db $F8                                                               ;93AD1B;
    dw $7A45,$01F8                                                       ;93AD1C;
    db $00                                                               ;93AD20;
    dw $BA45,$01F8                                                       ;93AD21;
    db $F8                                                               ;93AD25;
    dw $3A45                                                             ;93AD26;

UNUSED_ProjectileFlareSpritemaps_93AC28:
    dw $0004,$01F8                                                       ;93AD28;
    db $00                                                               ;93AD2C;
    dw $BA46,$0000                                                       ;93AD2D;
    db $00                                                               ;93AD31;
    dw $FA46,$0000                                                       ;93AD32;
    db $F8                                                               ;93AD36;
    dw $7A46,$01F8                                                       ;93AD37;
    db $F8                                                               ;93AD3B;
    dw $3A46                                                             ;93AD3C;

UNUSED_ProjectileFlareSpritemaps_93AC3E:
    dw $0001,$01FC                                                       ;93AD3E;
    db $FC                                                               ;93AD42;
    dw $3A42                                                             ;93AD43;
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Bomb_0:
    dw $0001,$01FC                                                       ;93AD45;
    db $FC                                                               ;93AD49;
    dw $3A4C                                                             ;93AD4A;

ProjectileFlareSpritemaps_Bomb_1:
    dw $0001,$01FC                                                       ;93AD4C;
    db $FC                                                               ;93AD50;
    dw $3A4D                                                             ;93AD51;

ProjectileFlareSpritemaps_Bomb_2:
    dw $0001,$01FC                                                       ;93AD53;
    db $FC                                                               ;93AD57;
    dw $3A4E                                                             ;93AD58;

ProjectileFlareSpritemaps_Bomb_3:
    dw $0001,$01FC                                                       ;93AD5A;
    db $FC                                                               ;93AD5E;
    dw $3A4F                                                             ;93AD5F;

ProjectileFlareSpritemaps_Missile_0:
    dw $0002,$01FF                                                       ;93AD61;
    db $FC                                                               ;93AD65;
    dw $2A55,$01F7                                                       ;93AD66;
    db $FC                                                               ;93AD6A;
    dw $2A54                                                             ;93AD6B;

ProjectileFlareSpritemaps_Missile_1:
    dw $0003,$01F8                                                       ;93AD6D;
    db $F5                                                               ;93AD71;
    dw $2A56,$0000                                                       ;93AD72;
    db $FD                                                               ;93AD76;
    dw $2A58,$01F8                                                       ;93AD77;
    db $FD                                                               ;93AD7B;
    dw $2A57                                                             ;93AD7C;

ProjectileFlareSpritemaps_Missile_2:
    dw $0002,$01FC                                                       ;93AD7E;
    db $F7                                                               ;93AD82;
    dw $2A59,$01FC                                                       ;93AD83;
    db $FF                                                               ;93AD87;
    dw $2A5A                                                             ;93AD88;

ProjectileFlareSpritemaps_Missile_3:
    dw $0003,$0000                                                       ;93AD8A;
    db $F5                                                               ;93AD8E;
    dw $6A56,$01F8                                                       ;93AD8F;
    db $FD                                                               ;93AD93;
    dw $6A58,$0000                                                       ;93AD94;
    db $FD                                                               ;93AD98;
    dw $6A57                                                             ;93AD99;

ProjectileFlareSpritemaps_Missile_4:
    dw $0002,$01F9                                                       ;93AD9B;
    db $FC                                                               ;93AD9F;
    dw $6A55,$0001                                                       ;93ADA0;
    db $FC                                                               ;93ADA4;
    dw $6A54                                                             ;93ADA5;

ProjectileFlareSpritemaps_Missile_5:
    dw $0003,$0000                                                       ;93ADA7;
    db $03                                                               ;93ADAB;
    dw $EA56,$01F8                                                       ;93ADAC;
    db $FB                                                               ;93ADB0;
    dw $EA58,$0000                                                       ;93ADB1;
    db $FB                                                               ;93ADB5;
    dw $EA57                                                             ;93ADB6;

ProjectileFlareSpritemaps_Missile_6:
    dw $0002,$01FD                                                       ;93ADB8;
    db $01                                                               ;93ADBC;
    dw $AA59,$01FD                                                       ;93ADBD;
    db $F9                                                               ;93ADC1;
    dw $AA5A                                                             ;93ADC2;

ProjectileFlareSpritemaps_Missile_7:
    dw $0003,$01F8                                                       ;93ADC4;
    db $03                                                               ;93ADC8;
    dw $AA56,$0000                                                       ;93ADC9;
    db $FB                                                               ;93ADCD;
    dw $AA58,$01F8                                                       ;93ADCE;
    db $FB                                                               ;93ADD2;
    dw $AA57                                                             ;93ADD3;

ProjectileFlareSpritemaps_SuperMissile_0:
    dw $0002,$0000                                                       ;93ADD5;
    db $FC                                                               ;93ADD9;
    dw $2A65,$01F8                                                       ;93ADDA;
    db $FC                                                               ;93ADDE;
    dw $2A64                                                             ;93ADDF;

ProjectileFlareSpritemaps_SuperMissile_1:
    dw $0003,$0002                                                       ;93ADE1;
    db $FE                                                               ;93ADE5;
    dw $2A68,$01FA                                                       ;93ADE6;
    db $FE                                                               ;93ADEA;
    dw $2A67,$01FA                                                       ;93ADEB;
    db $F6                                                               ;93ADEF;
    dw $2A66                                                             ;93ADF0;

ProjectileFlareSpritemaps_SuperMissile_2:
    dw $0002,$01FC                                                       ;93ADF2;
    db $F8                                                               ;93ADF6;
    dw $2A69,$01FC                                                       ;93ADF7;
    db $00                                                               ;93ADFB;
    dw $2A6A                                                             ;93ADFC;

ProjectileFlareSpritemaps_SuperMissile_3:
    dw $0003,$01F6                                                       ;93ADFE;
    db $FE                                                               ;93AE02;
    dw $6A68,$01FE                                                       ;93AE03;
    db $FE                                                               ;93AE07;
    dw $6A67,$01FE                                                       ;93AE08;
    db $F6                                                               ;93AE0C;
    dw $6A66                                                             ;93AE0D;

ProjectileFlareSpritemaps_SuperMissile_4:
    dw $0002,$01F8                                                       ;93AE0F;
    db $FC                                                               ;93AE13;
    dw $6A65,$0000                                                       ;93AE14;
    db $FC                                                               ;93AE18;
    dw $6A64                                                             ;93AE19;

ProjectileFlareSpritemaps_SuperMissile_5:
    dw $0003,$01F6                                                       ;93AE1B;
    db $FA                                                               ;93AE1F;
    dw $EA68,$01FE                                                       ;93AE20;
    db $FA                                                               ;93AE24;
    dw $EA67,$01FE                                                       ;93AE25;
    db $02                                                               ;93AE29;
    dw $EA66                                                             ;93AE2A;

ProjectileFlareSpritemaps_SuperMissile_6:
    dw $0002,$01FC                                                       ;93AE2C;
    db $00                                                               ;93AE30;
    dw $AA69,$01FC                                                       ;93AE31;
    db $F8                                                               ;93AE35;
    dw $AA6A                                                             ;93AE36;

ProjectileFlareSpritemaps_SuperMissile_7:
    dw $0003,$0002                                                       ;93AE38;
    db $FA                                                               ;93AE3C;
    dw $AA68,$01FA                                                       ;93AE3D;
    db $FA                                                               ;93AE41;
    dw $AA67,$01FA                                                       ;93AE42;
    db $02                                                               ;93AE46;
    dw $AA66                                                             ;93AE47;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_93AE49:
    dw $0001,$01FC                                                       ;93AE49;
    db $FC                                                               ;93AE4D;
    dw $3A3C                                                             ;93AE4E;

UNUSED_ProjectileFlareSpritemaps_93AE50:
    dw $0001,$01FC                                                       ;93AE50;
    db $FC                                                               ;93AE54;
    dw $3A3D                                                             ;93AE55;

UNUSED_ProjectileFlareSpritemaps_93AE57:
    dw $0001,$01FC                                                       ;93AE57;
    db $FC                                                               ;93AE5B;
    dw $3A3E                                                             ;93AE5C;

UNUSED_ProjectileFlareSpritemaps_93AE5E:
    dw $0001,$01FC                                                       ;93AE5E;
    db $FC                                                               ;93AE62;
    dw $3A3F                                                             ;93AE63;
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Wave_IceWave_0:
    dw $0001,$01FC                                                       ;93AE65;
    db $FC                                                               ;93AE69;
    dw $2C30                                                             ;93AE6A;

ProjectileFlareSpritemaps_Wave_IceWave_1:
    dw $0001,$01FC                                                       ;93AE6C;
    db $F4                                                               ;93AE70;
    dw $2C30                                                             ;93AE71;

ProjectileFlareSpritemaps_Wave_IceWave_2:
    dw $0001,$01FC                                                       ;93AE73;
    db $EF                                                               ;93AE77;
    dw $2C31                                                             ;93AE78;

ProjectileFlareSpritemaps_Wave_IceWave_3:
    dw $0001,$01FC                                                       ;93AE7A;
    db $ED                                                               ;93AE7E;
    dw $2C31                                                             ;93AE7F;

ProjectileFlareSpritemaps_Wave_IceWave_4:
    dw $0001,$01FC                                                       ;93AE81;
    db $EC                                                               ;93AE85;
    dw $2C32                                                             ;93AE86;

ProjectileFlareSpritemaps_Wave_IceWave_5:
    dw $0001,$01FC                                                       ;93AE88;
    db $04                                                               ;93AE8C;
    dw $2C30                                                             ;93AE8D;

ProjectileFlareSpritemaps_Wave_IceWave_6:
    dw $0001,$01FC                                                       ;93AE8F;
    db $09                                                               ;93AE93;
    dw $2C31                                                             ;93AE94;

ProjectileFlareSpritemaps_Wave_IceWave_7:
    dw $0001,$01FC                                                       ;93AE96;
    db $0B                                                               ;93AE9A;
    dw $2C31                                                             ;93AE9B;

ProjectileFlareSpritemaps_Wave_IceWave_8:
    dw $0001,$01FC                                                       ;93AE9D;
    db $0C                                                               ;93AEA1;
    dw $2C32                                                             ;93AEA2;

ProjectileFlareSpritemaps_Wave_IceWave_9:
    dw $0001,$0002                                                       ;93AEA4;
    db $F6                                                               ;93AEA8;
    dw $2C30                                                             ;93AEA9;

ProjectileFlareSpritemaps_Wave_IceWave_A:
    dw $0001,$0005                                                       ;93AEAB;
    db $F3                                                               ;93AEAF;
    dw $2C31                                                             ;93AEB0;

ProjectileFlareSpritemaps_Wave_IceWave_B:
    dw $0001,$0007                                                       ;93AEB2;
    db $F1                                                               ;93AEB6;
    dw $2C31                                                             ;93AEB7;

ProjectileFlareSpritemaps_Wave_IceWave_C:
    dw $0001,$0008                                                       ;93AEB9;
    db $F0                                                               ;93AEBD;
    dw $2C32                                                             ;93AEBE;

ProjectileFlareSpritemaps_Wave_IceWave_D:
    dw $0001,$01F6                                                       ;93AEC0;
    db $02                                                               ;93AEC4;
    dw $2C30                                                             ;93AEC5;

ProjectileFlareSpritemaps_Wave_IceWave_E:
    dw $0001,$01F3                                                       ;93AEC7;
    db $05                                                               ;93AECB;
    dw $2C31                                                             ;93AECC;

ProjectileFlareSpritemaps_Wave_IceWave_F:
    dw $0001,$01F1                                                       ;93AECE;
    db $07                                                               ;93AED2;
    dw $2C31                                                             ;93AED3;

ProjectileFlareSpritemaps_Wave_IceWave_10:
    dw $0001,$01F0                                                       ;93AED5;
    db $08                                                               ;93AED9;
    dw $2C32                                                             ;93AEDA;

ProjectileFlareSpritemaps_Wave_IceWave_11:
    dw $0001,$0004                                                       ;93AEDC;
    db $FC                                                               ;93AEE0;
    dw $2C30                                                             ;93AEE1;

ProjectileFlareSpritemaps_Wave_IceWave_12:
    dw $0001,$0009                                                       ;93AEE3;
    db $FC                                                               ;93AEE7;
    dw $2C31                                                             ;93AEE8;

ProjectileFlareSpritemaps_Wave_IceWave_13:
    dw $0001,$000B                                                       ;93AEEA;
    db $FC                                                               ;93AEEE;
    dw $2C31                                                             ;93AEEF;

ProjectileFlareSpritemaps_Wave_IceWave_14:
    dw $0001,$000C                                                       ;93AEF1;
    db $FC                                                               ;93AEF5;
    dw $2C32                                                             ;93AEF6;

ProjectileFlareSpritemaps_Wave_IceWave_15:
    dw $0001,$01F4                                                       ;93AEF8;
    db $FC                                                               ;93AEFC;
    dw $2C30                                                             ;93AEFD;

ProjectileFlareSpritemaps_Wave_IceWave_16:
    dw $0001,$01EF                                                       ;93AEFF;
    db $FC                                                               ;93AF03;
    dw $2C31                                                             ;93AF04;

ProjectileFlareSpritemaps_Wave_IceWave_17:
    dw $0001,$01ED                                                       ;93AF06;
    db $FC                                                               ;93AF0A;
    dw $2C31                                                             ;93AF0B;

ProjectileFlareSpritemaps_Wave_IceWave_18:
    dw $0001,$01EC                                                       ;93AF0D;
    db $FC                                                               ;93AF11;
    dw $2C32                                                             ;93AF12;

ProjectileFlareSpritemaps_Wave_IceWave_19:
    dw $0001,$01F6                                                       ;93AF14;
    db $F6                                                               ;93AF18;
    dw $2C30                                                             ;93AF19;

ProjectileFlareSpritemaps_Wave_IceWave_1A:
    dw $0001,$01F3                                                       ;93AF1B;
    db $F3                                                               ;93AF1F;
    dw $2C31                                                             ;93AF20;

ProjectileFlareSpritemaps_Wave_IceWave_1B:
    dw $0001,$01F1                                                       ;93AF22;
    db $F1                                                               ;93AF26;
    dw $2C31                                                             ;93AF27;

ProjectileFlareSpritemaps_Wave_IceWave_1C:
    dw $0001,$01F0                                                       ;93AF29;
    db $F0                                                               ;93AF2D;
    dw $2C32                                                             ;93AF2E;

ProjectileFlareSpritemaps_Wave_IceWave_1D:
    dw $0001,$0002                                                       ;93AF30;
    db $02                                                               ;93AF34;
    dw $2C30                                                             ;93AF35;

ProjectileFlareSpritemaps_Wave_IceWave_1E:
    dw $0001,$0005                                                       ;93AF37;
    db $05                                                               ;93AF3B;
    dw $2C31                                                             ;93AF3C;

ProjectileFlareSpritemaps_Wave_IceWave_1F:
    dw $0001,$0007                                                       ;93AF3E;
    db $07                                                               ;93AF42;
    dw $2C31                                                             ;93AF43;

ProjectileFlareSpritemaps_Wave_IceWave_20:
    dw $0001,$0008                                                       ;93AF45;
    db $08                                                               ;93AF49;
    dw $2C32                                                             ;93AF4A;

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_0:
    dw $0004,$0000                                                       ;93AF4C;
    db $00                                                               ;93AF50;
    dw $EC34,$01F8                                                       ;93AF51;
    db $00                                                               ;93AF55;
    dw $AC34,$0000                                                       ;93AF56;
    db $F8                                                               ;93AF5A;
    dw $6C34,$01F8                                                       ;93AF5B;
    db $F8                                                               ;93AF5F;
    dw $2C34                                                             ;93AF60;

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1:
    dw $0004,$0000                                                       ;93AF62;
    db $00                                                               ;93AF66;
    dw $EC33,$01F8                                                       ;93AF67;
    db $00                                                               ;93AF6B;
    dw $AC33,$0000                                                       ;93AF6C;
    db $F8                                                               ;93AF70;
    dw $6C33,$01F8                                                       ;93AF71;
    db $F8                                                               ;93AF75;
    dw $2C33                                                             ;93AF76;

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_2:
    dw $0008,$0000                                                       ;93AF78;
    db $08                                                               ;93AF7C;
    dw $EC33,$01F8                                                       ;93AF7D;
    db $08                                                               ;93AF81;
    dw $AC33,$0000                                                       ;93AF82;
    db $00                                                               ;93AF86;
    dw $6C33,$01F8                                                       ;93AF87;
    db $00                                                               ;93AF8B;
    dw $2C33,$0000                                                       ;93AF8C;
    db $F8                                                               ;93AF90;
    dw $EC34,$01F8                                                       ;93AF91;
    db $F8                                                               ;93AF95;
    dw $AC34,$0000                                                       ;93AF96;
    db $F0                                                               ;93AF9A;
    dw $6C34,$01F8                                                       ;93AF9B;
    db $F0                                                               ;93AF9F;
    dw $2C34                                                             ;93AFA0;

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_3:
    dw $0008,$0000                                                       ;93AFA2;
    db $08                                                               ;93AFA6;
    dw $EC34,$01F8                                                       ;93AFA7;
    db $08                                                               ;93AFAB;
    dw $AC34,$0000                                                       ;93AFAC;
    db $00                                                               ;93AFB0;
    dw $6C34,$01F8                                                       ;93AFB1;
    db $00                                                               ;93AFB5;
    dw $2C34,$0000                                                       ;93AFB6;
    db $F8                                                               ;93AFBA;
    dw $EC33,$01F8                                                       ;93AFBB;
    db $F8                                                               ;93AFBF;
    dw $AC33,$0000                                                       ;93AFC0;
    db $F0                                                               ;93AFC4;
    dw $6C33,$01F8                                                       ;93AFC5;
    db $F0                                                               ;93AFC9;
    dw $2C33                                                             ;93AFCA;

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_4:
    dw $0008,$0000                                                       ;93AFCC;
    db $0D                                                               ;93AFD0;
    dw $EC33,$01F8                                                       ;93AFD1;
    db $0D                                                               ;93AFD5;
    dw $AC33,$0000                                                       ;93AFD6;
    db $05                                                               ;93AFDA;
    dw $6C33,$01F8                                                       ;93AFDB;
    db $05                                                               ;93AFDF;
    dw $2C33,$0000                                                       ;93AFE0;
    db $F3                                                               ;93AFE4;
    dw $EC34,$01F8                                                       ;93AFE5;
    db $F3                                                               ;93AFE9;
    dw $AC34,$0000                                                       ;93AFEA;
    db $EB                                                               ;93AFEE;
    dw $6C34,$01F8                                                       ;93AFEF;
    db $EB                                                               ;93AFF3;
    dw $2C34                                                             ;93AFF4;

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_5:
    dw $0008,$0000                                                       ;93AFF6;
    db $0D                                                               ;93AFFA;
    dw $EC34,$01F8                                                       ;93AFFB;
    db $0D                                                               ;93AFFF;
    dw $AC34,$0000                                                       ;93B000;
    db $05                                                               ;93B004;
    dw $6C34,$01F8                                                       ;93B005;
    db $05                                                               ;93B009;
    dw $2C34,$0000                                                       ;93B00A;
    db $F3                                                               ;93B00E;
    dw $EC33,$01F8                                                       ;93B00F;
    db $F3                                                               ;93B013;
    dw $AC33,$0000                                                       ;93B014;
    db $EB                                                               ;93B018;
    dw $6C33,$01F8                                                       ;93B019;
    db $EB                                                               ;93B01D;
    dw $2C33                                                             ;93B01E;

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_6:
    dw $0008,$0000                                                       ;93B020;
    db $0F                                                               ;93B024;
    dw $EC33,$01F8                                                       ;93B025;
    db $0F                                                               ;93B029;
    dw $AC33,$0000                                                       ;93B02A;
    db $07                                                               ;93B02E;
    dw $6C33,$01F8                                                       ;93B02F;
    db $07                                                               ;93B033;
    dw $2C33,$0000                                                       ;93B034;
    db $F1                                                               ;93B038;
    dw $EC34,$01F8                                                       ;93B039;
    db $F1                                                               ;93B03D;
    dw $AC34,$0000                                                       ;93B03E;
    db $E9                                                               ;93B042;
    dw $6C34,$01F8                                                       ;93B043;
    db $E9                                                               ;93B047;
    dw $2C34                                                             ;93B048;

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_7:
    dw $0008,$0000                                                       ;93B04A;
    db $0F                                                               ;93B04E;
    dw $EC34,$01F8                                                       ;93B04F;
    db $0F                                                               ;93B053;
    dw $AC34,$0000                                                       ;93B054;
    db $07                                                               ;93B058;
    dw $6C34,$01F8                                                       ;93B059;
    db $07                                                               ;93B05D;
    dw $2C34,$0000                                                       ;93B05E;
    db $F1                                                               ;93B062;
    dw $EC33,$01F8                                                       ;93B063;
    db $F1                                                               ;93B067;
    dw $AC33,$0000                                                       ;93B068;
    db $E9                                                               ;93B06C;
    dw $6C33,$01F8                                                       ;93B06D;
    db $E9                                                               ;93B071;
    dw $2C33                                                             ;93B072;

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_8:
    dw $0008,$0000                                                       ;93B074;
    db $10                                                               ;93B078;
    dw $EC33,$01F8                                                       ;93B079;
    db $10                                                               ;93B07D;
    dw $AC33,$0000                                                       ;93B07E;
    db $08                                                               ;93B082;
    dw $6C33,$01F8                                                       ;93B083;
    db $08                                                               ;93B087;
    dw $2C33,$0000                                                       ;93B088;
    db $F0                                                               ;93B08C;
    dw $EC34,$01F8                                                       ;93B08D;
    db $F0                                                               ;93B091;
    dw $AC34,$0000                                                       ;93B092;
    db $E8                                                               ;93B096;
    dw $6C34,$01F8                                                       ;93B097;
    db $E8                                                               ;93B09B;
    dw $2C34                                                             ;93B09C;

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_9:
    dw $0008,$0000                                                       ;93B09E;
    db $10                                                               ;93B0A2;
    dw $EC34,$01F8                                                       ;93B0A3;
    db $10                                                               ;93B0A7;
    dw $AC34,$0000                                                       ;93B0A8;
    db $08                                                               ;93B0AC;
    dw $6C34,$01F8                                                       ;93B0AD;
    db $08                                                               ;93B0B1;
    dw $2C34,$0000                                                       ;93B0B2;
    db $F0                                                               ;93B0B6;
    dw $EC33,$01F8                                                       ;93B0B7;
    db $F0                                                               ;93B0BB;
    dw $AC33,$0000                                                       ;93B0BC;
    db $E8                                                               ;93B0C0;
    dw $6C33,$01F8                                                       ;93B0C1;
    db $E8                                                               ;93B0C5;
    dw $2C33                                                             ;93B0C6;

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_A:
    dw $0008,$0005                                                       ;93B0C8;
    db $FB                                                               ;93B0CC;
    dw $EC34,$01FD                                                       ;93B0CD;
    db $FB                                                               ;93B0D1;
    dw $AC34,$0005                                                       ;93B0D2;
    db $F3                                                               ;93B0D6;
    dw $6C34,$01FD                                                       ;93B0D7;
    db $F3                                                               ;93B0DB;
    dw $2C34,$01FB                                                       ;93B0DC;
    db $05                                                               ;93B0E0;
    dw $EC33,$01F3                                                       ;93B0E1;
    db $05                                                               ;93B0E5;
    dw $AC33,$01FB                                                       ;93B0E6;
    db $FD                                                               ;93B0EA;
    dw $6C33,$01F3                                                       ;93B0EB;
    db $FD                                                               ;93B0EF;
    dw $2C33                                                             ;93B0F0;

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_B:
    dw $0008,$0004                                                       ;93B0F2;
    db $FC                                                               ;93B0F6;
    dw $EC33,$01FC                                                       ;93B0F7;
    db $FC                                                               ;93B0FB;
    dw $AC33,$0004                                                       ;93B0FC;
    db $F4                                                               ;93B100;
    dw $6C33,$01FC                                                       ;93B101;
    db $F4                                                               ;93B105;
    dw $2C33,$01FC                                                       ;93B106;
    db $04                                                               ;93B10A;
    dw $EC34,$01F4                                                       ;93B10B;
    db $04                                                               ;93B10F;
    dw $AC34,$01FC                                                       ;93B110;
    db $FC                                                               ;93B114;
    dw $6C34,$01F4                                                       ;93B115;
    db $FC                                                               ;93B119;
    dw $2C34                                                             ;93B11A;

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_C:
    dw $0008,$01F9                                                       ;93B11C;
    db $07                                                               ;93B120;
    dw $EC33,$01F1                                                       ;93B121;
    db $07                                                               ;93B125;
    dw $AC33,$01F9                                                       ;93B126;
    db $FF                                                               ;93B12A;
    dw $6C33,$01F1                                                       ;93B12B;
    db $FF                                                               ;93B12F;
    dw $2C33,$0007                                                       ;93B130;
    db $F9                                                               ;93B134;
    dw $EC34,$01FF                                                       ;93B135;
    db $F9                                                               ;93B139;
    dw $AC34,$0007                                                       ;93B13A;
    db $F1                                                               ;93B13E;
    dw $6C34,$01FF                                                       ;93B13F;
    db $F1                                                               ;93B143;
    dw $2C34                                                             ;93B144;

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_D:
    dw $0008,$01F9                                                       ;93B146;
    db $07                                                               ;93B14A;
    dw $EC34,$01F1                                                       ;93B14B;
    db $07                                                               ;93B14F;
    dw $AC34,$01F9                                                       ;93B150;
    db $FF                                                               ;93B154;
    dw $6C34,$01F1                                                       ;93B155;
    db $FF                                                               ;93B159;
    dw $2C34,$0007                                                       ;93B15A;
    db $F9                                                               ;93B15E;
    dw $EC33,$01FF                                                       ;93B15F;
    db $F9                                                               ;93B163;
    dw $AC33,$0007                                                       ;93B164;
    db $F1                                                               ;93B168;
    dw $6C33,$01FF                                                       ;93B169;
    db $F1                                                               ;93B16D;
    dw $2C33                                                             ;93B16E;

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_E:
    dw $0008,$01F7                                                       ;93B170;
    db $09                                                               ;93B174;
    dw $EC33,$01EF                                                       ;93B175;
    db $09                                                               ;93B179;
    dw $AC33,$01F7                                                       ;93B17A;
    db $01                                                               ;93B17E;
    dw $6C33,$01EF                                                       ;93B17F;
    db $01                                                               ;93B183;
    dw $2C33,$0009                                                       ;93B184;
    db $F7                                                               ;93B188;
    dw $EC34,$0001                                                       ;93B189;
    db $F7                                                               ;93B18D;
    dw $AC34,$0009                                                       ;93B18E;
    db $EF                                                               ;93B192;
    dw $6C34,$0001                                                       ;93B193;
    db $EF                                                               ;93B197;
    dw $2C34                                                             ;93B198;

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_F:
    dw $0008,$01F7                                                       ;93B19A;
    db $09                                                               ;93B19E;
    dw $EC34,$01EF                                                       ;93B19F;
    db $09                                                               ;93B1A3;
    dw $AC34,$01F7                                                       ;93B1A4;
    db $01                                                               ;93B1A8;
    dw $6C34,$01EF                                                       ;93B1A9;
    db $01                                                               ;93B1AD;
    dw $2C34,$0009                                                       ;93B1AE;
    db $F7                                                               ;93B1B2;
    dw $EC33,$0001                                                       ;93B1B3;
    db $F7                                                               ;93B1B7;
    dw $AC33,$0009                                                       ;93B1B8;
    db $EF                                                               ;93B1BC;
    dw $6C33,$0001                                                       ;93B1BD;
    db $EF                                                               ;93B1C1;
    dw $2C33                                                             ;93B1C2;

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_10:
    dw $0008,$01F6                                                       ;93B1C4;
    db $0A                                                               ;93B1C8;
    dw $EC33,$01EE                                                       ;93B1C9;
    db $0A                                                               ;93B1CD;
    dw $AC33,$01F6                                                       ;93B1CE;
    db $02                                                               ;93B1D2;
    dw $6C33,$01EE                                                       ;93B1D3;
    db $02                                                               ;93B1D7;
    dw $2C33,$000A                                                       ;93B1D8;
    db $F6                                                               ;93B1DC;
    dw $EC34,$0002                                                       ;93B1DD;
    db $F6                                                               ;93B1E1;
    dw $AC34,$000A                                                       ;93B1E2;
    db $EE                                                               ;93B1E6;
    dw $6C34,$0002                                                       ;93B1E7;
    db $EE                                                               ;93B1EB;
    dw $2C34                                                             ;93B1EC;

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_11:
    dw $0008,$01F6                                                       ;93B1EE;
    db $0A                                                               ;93B1F2;
    dw $EC34,$01EE                                                       ;93B1F3;
    db $0A                                                               ;93B1F7;
    dw $AC34,$01F6                                                       ;93B1F8;
    db $02                                                               ;93B1FC;
    dw $6C34,$01EE                                                       ;93B1FD;
    db $02                                                               ;93B201;
    dw $2C34,$000A                                                       ;93B202;
    db $F6                                                               ;93B206;
    dw $EC33,$0002                                                       ;93B207;
    db $F6                                                               ;93B20B;
    dw $AC33,$000A                                                       ;93B20C;
    db $EE                                                               ;93B210;
    dw $6C33,$0002                                                       ;93B211;
    db $EE                                                               ;93B215;
    dw $2C33                                                             ;93B216;

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_12:
    dw $0008,$01F3                                                       ;93B218;
    db $FB                                                               ;93B21C;
    dw $AC34,$01FB                                                       ;93B21D;
    db $FB                                                               ;93B221;
    dw $EC34,$01F3                                                       ;93B222;
    db $F3                                                               ;93B226;
    dw $2C34,$01FB                                                       ;93B227;
    db $F3                                                               ;93B22B;
    dw $6C34,$01FD                                                       ;93B22C;
    db $05                                                               ;93B230;
    dw $AC33,$0005                                                       ;93B231;
    db $05                                                               ;93B235;
    dw $EC33,$01FD                                                       ;93B236;
    db $FD                                                               ;93B23A;
    dw $2C33,$0005                                                       ;93B23B;
    db $FD                                                               ;93B23F;
    dw $6C33                                                             ;93B240;

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_13:
    dw $0008,$01F4                                                       ;93B242;
    db $FC                                                               ;93B246;
    dw $AC33,$01FC                                                       ;93B247;
    db $FC                                                               ;93B24B;
    dw $EC33,$01F4                                                       ;93B24C;
    db $F4                                                               ;93B250;
    dw $2C33,$01FC                                                       ;93B251;
    db $F4                                                               ;93B255;
    dw $6C33,$01FC                                                       ;93B256;
    db $04                                                               ;93B25A;
    dw $AC34,$0004                                                       ;93B25B;
    db $04                                                               ;93B25F;
    dw $EC34,$01FC                                                       ;93B260;
    db $FC                                                               ;93B264;
    dw $2C34,$0004                                                       ;93B265;
    db $FC                                                               ;93B269;
    dw $6C34                                                             ;93B26A;

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_14:
    dw $0008,$01FF                                                       ;93B26C;
    db $07                                                               ;93B270;
    dw $AC33,$0007                                                       ;93B271;
    db $07                                                               ;93B275;
    dw $EC33,$01FF                                                       ;93B276;
    db $FF                                                               ;93B27A;
    dw $2C33,$0007                                                       ;93B27B;
    db $FF                                                               ;93B27F;
    dw $6C33,$01F1                                                       ;93B280;
    db $F9                                                               ;93B284;
    dw $AC34,$01F9                                                       ;93B285;
    db $F9                                                               ;93B289;
    dw $EC34,$01F1                                                       ;93B28A;
    db $F1                                                               ;93B28E;
    dw $2C34,$01F9                                                       ;93B28F;
    db $F1                                                               ;93B293;
    dw $6C34                                                             ;93B294;

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_15:
    dw $0008,$01FF                                                       ;93B296;
    db $07                                                               ;93B29A;
    dw $AC34,$0007                                                       ;93B29B;
    db $07                                                               ;93B29F;
    dw $EC34,$01FF                                                       ;93B2A0;
    db $FF                                                               ;93B2A4;
    dw $2C34,$0007                                                       ;93B2A5;
    db $FF                                                               ;93B2A9;
    dw $6C34,$01F1                                                       ;93B2AA;
    db $F9                                                               ;93B2AE;
    dw $AC33,$01F9                                                       ;93B2AF;
    db $F9                                                               ;93B2B3;
    dw $EC33,$01F1                                                       ;93B2B4;
    db $F1                                                               ;93B2B8;
    dw $2C33,$01F9                                                       ;93B2B9;
    db $F1                                                               ;93B2BD;
    dw $6C33                                                             ;93B2BE;

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_16:
    dw $0008,$0001                                                       ;93B2C0;
    db $09                                                               ;93B2C4;
    dw $AC33,$0009                                                       ;93B2C5;
    db $09                                                               ;93B2C9;
    dw $EC33,$0001                                                       ;93B2CA;
    db $01                                                               ;93B2CE;
    dw $2C33,$0009                                                       ;93B2CF;
    db $01                                                               ;93B2D3;
    dw $6C33,$01EF                                                       ;93B2D4;
    db $F7                                                               ;93B2D8;
    dw $AC34,$01F7                                                       ;93B2D9;
    db $F7                                                               ;93B2DD;
    dw $EC34,$01EF                                                       ;93B2DE;
    db $EF                                                               ;93B2E2;
    dw $2C34,$01F7                                                       ;93B2E3;
    db $EF                                                               ;93B2E7;
    dw $6C34                                                             ;93B2E8;

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_17:
    dw $0008,$0001                                                       ;93B2EA;
    db $09                                                               ;93B2EE;
    dw $AC34,$0009                                                       ;93B2EF;
    db $09                                                               ;93B2F3;
    dw $EC34,$0001                                                       ;93B2F4;
    db $01                                                               ;93B2F8;
    dw $2C34,$0009                                                       ;93B2F9;
    db $01                                                               ;93B2FD;
    dw $6C34,$01EF                                                       ;93B2FE;
    db $F7                                                               ;93B302;
    dw $AC33,$01F7                                                       ;93B303;
    db $F7                                                               ;93B307;
    dw $EC33,$01EF                                                       ;93B308;
    db $EF                                                               ;93B30C;
    dw $2C33,$01F7                                                       ;93B30D;
    db $EF                                                               ;93B311;
    dw $6C33                                                             ;93B312;

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_18:
    dw $0008,$0002                                                       ;93B314;
    db $0A                                                               ;93B318;
    dw $AC33,$000A                                                       ;93B319;
    db $0A                                                               ;93B31D;
    dw $EC33,$0002                                                       ;93B31E;
    db $02                                                               ;93B322;
    dw $2C33,$000A                                                       ;93B323;
    db $02                                                               ;93B327;
    dw $6C33,$01EE                                                       ;93B328;
    db $F6                                                               ;93B32C;
    dw $AC34,$01F6                                                       ;93B32D;
    db $F6                                                               ;93B331;
    dw $EC34,$01EE                                                       ;93B332;
    db $EE                                                               ;93B336;
    dw $2C34,$01F6                                                       ;93B337;
    db $EE                                                               ;93B33B;
    dw $6C34                                                             ;93B33C;

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_19:
    dw $0008,$0002                                                       ;93B33E;
    db $0A                                                               ;93B342;
    dw $AC34,$000A                                                       ;93B343;
    db $0A                                                               ;93B347;
    dw $EC34,$0002                                                       ;93B348;
    db $02                                                               ;93B34C;
    dw $2C34,$000A                                                       ;93B34D;
    db $02                                                               ;93B351;
    dw $6C34,$01EE                                                       ;93B352;
    db $F6                                                               ;93B356;
    dw $AC33,$01F6                                                       ;93B357;
    db $F6                                                               ;93B35B;
    dw $EC33,$01EE                                                       ;93B35C;
    db $EE                                                               ;93B360;
    dw $2C33,$01F6                                                       ;93B361;
    db $EE                                                               ;93B365;
    dw $6C33                                                             ;93B366;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_ChargedWave_WaveSBA_93B368:
    dw $0004,$0000                                                       ;93B368;
    db $F8                                                               ;93B36C;
    dw $6C34,$0000                                                       ;93B36D;
    db $00                                                               ;93B371;
    dw $EC34,$01F8                                                       ;93B372;
    db $00                                                               ;93B376;
    dw $AC34,$01F8                                                       ;93B377;
    db $F8                                                               ;93B37B;
    dw $2C34                                                             ;93B37C;

UNUSED_ProjectileFlareSpritemaps_ChargedWave_WaveSBA_93B37E:
    dw $0004,$0000                                                       ;93B37E;
    db $F8                                                               ;93B382;
    dw $6C33,$0000                                                       ;93B383;
    db $00                                                               ;93B387;
    dw $EC33,$01F8                                                       ;93B388;
    db $00                                                               ;93B38C;
    dw $AC33,$01F8                                                       ;93B38D;
    db $F8                                                               ;93B391;
    dw $2C33                                                             ;93B392;
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1A:
    dw $0008,$01F8                                                       ;93B394;
    db $F8                                                               ;93B398;
    dw $6C34,$01F8                                                       ;93B399;
    db $00                                                               ;93B39D;
    dw $EC34,$01F0                                                       ;93B39E;
    db $00                                                               ;93B3A2;
    dw $AC34,$01F0                                                       ;93B3A3;
    db $F8                                                               ;93B3A7;
    dw $2C34,$0008                                                       ;93B3A8;
    db $00                                                               ;93B3AC;
    dw $EC33,$0000                                                       ;93B3AD;
    db $00                                                               ;93B3B1;
    dw $AC33,$0008                                                       ;93B3B2;
    db $F8                                                               ;93B3B6;
    dw $6C33,$0000                                                       ;93B3B7;
    db $F8                                                               ;93B3BB;
    dw $2C33                                                             ;93B3BC;

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1B:
    dw $0008,$01F8                                                       ;93B3BE;
    db $F8                                                               ;93B3C2;
    dw $6C33,$01F8                                                       ;93B3C3;
    db $00                                                               ;93B3C7;
    dw $EC33,$01F0                                                       ;93B3C8;
    db $00                                                               ;93B3CC;
    dw $AC33,$01F0                                                       ;93B3CD;
    db $F8                                                               ;93B3D1;
    dw $2C33,$0008                                                       ;93B3D2;
    db $00                                                               ;93B3D6;
    dw $EC34,$0000                                                       ;93B3D7;
    db $00                                                               ;93B3DB;
    dw $AC34,$0008                                                       ;93B3DC;
    db $F8                                                               ;93B3E0;
    dw $6C34,$0000                                                       ;93B3E1;
    db $F8                                                               ;93B3E5;
    dw $2C34                                                             ;93B3E6;

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1C:
    dw $0008,$01F3                                                       ;93B3E8;
    db $F8                                                               ;93B3EC;
    dw $6C34,$01F3                                                       ;93B3ED;
    db $00                                                               ;93B3F1;
    dw $EC34,$01EB                                                       ;93B3F2;
    db $00                                                               ;93B3F6;
    dw $AC34,$01EB                                                       ;93B3F7;
    db $F8                                                               ;93B3FB;
    dw $2C34,$000D                                                       ;93B3FC;
    db $00                                                               ;93B400;
    dw $EC33,$0005                                                       ;93B401;
    db $00                                                               ;93B405;
    dw $AC33,$000D                                                       ;93B406;
    db $F8                                                               ;93B40A;
    dw $6C33,$0005                                                       ;93B40B;
    db $F8                                                               ;93B40F;
    dw $2C33                                                             ;93B410;

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1D:
    dw $0008,$01F3                                                       ;93B412;
    db $F8                                                               ;93B416;
    dw $6C33,$01F3                                                       ;93B417;
    db $00                                                               ;93B41B;
    dw $EC33,$01EB                                                       ;93B41C;
    db $00                                                               ;93B420;
    dw $AC33,$01EB                                                       ;93B421;
    db $F8                                                               ;93B425;
    dw $2C33,$000D                                                       ;93B426;
    db $00                                                               ;93B42A;
    dw $EC34,$0005                                                       ;93B42B;
    db $00                                                               ;93B42F;
    dw $AC34,$000D                                                       ;93B430;
    db $F8                                                               ;93B434;
    dw $6C34,$0005                                                       ;93B435;
    db $F8                                                               ;93B439;
    dw $2C34                                                             ;93B43A;

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1E:
    dw $0008,$01F1                                                       ;93B43C;
    db $F8                                                               ;93B440;
    dw $6C34,$01F1                                                       ;93B441;
    db $00                                                               ;93B445;
    dw $EC34,$01E9                                                       ;93B446;
    db $00                                                               ;93B44A;
    dw $AC34,$01E9                                                       ;93B44B;
    db $F8                                                               ;93B44F;
    dw $2C34,$000F                                                       ;93B450;
    db $00                                                               ;93B454;
    dw $EC33,$0007                                                       ;93B455;
    db $00                                                               ;93B459;
    dw $AC33,$000F                                                       ;93B45A;
    db $F8                                                               ;93B45E;
    dw $6C33,$0007                                                       ;93B45F;
    db $F8                                                               ;93B463;
    dw $2C33                                                             ;93B464;

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1F:
    dw $0008,$01F1                                                       ;93B466;
    db $F8                                                               ;93B46A;
    dw $6C33,$01F1                                                       ;93B46B;
    db $00                                                               ;93B46F;
    dw $EC33,$01E9                                                       ;93B470;
    db $00                                                               ;93B474;
    dw $AC33,$01E9                                                       ;93B475;
    db $F8                                                               ;93B479;
    dw $2C33,$000F                                                       ;93B47A;
    db $00                                                               ;93B47E;
    dw $EC34,$0007                                                       ;93B47F;
    db $00                                                               ;93B483;
    dw $AC34,$000F                                                       ;93B484;
    db $F8                                                               ;93B488;
    dw $6C34,$0007                                                       ;93B489;
    db $F8                                                               ;93B48D;
    dw $2C34                                                             ;93B48E;

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_20:
    dw $0008,$01F0                                                       ;93B490;
    db $F8                                                               ;93B494;
    dw $6C34,$01F0                                                       ;93B495;
    db $00                                                               ;93B499;
    dw $EC34,$01E8                                                       ;93B49A;
    db $00                                                               ;93B49E;
    dw $AC34,$01E8                                                       ;93B49F;
    db $F8                                                               ;93B4A3;
    dw $2C34,$0010                                                       ;93B4A4;
    db $00                                                               ;93B4A8;
    dw $EC33,$0008                                                       ;93B4A9;
    db $00                                                               ;93B4AD;
    dw $AC33,$0010                                                       ;93B4AE;
    db $F8                                                               ;93B4B2;
    dw $6C33,$0008                                                       ;93B4B3;
    db $F8                                                               ;93B4B7;
    dw $2C33                                                             ;93B4B8;

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_21:
    dw $0008,$01F0                                                       ;93B4BA;
    db $F8                                                               ;93B4BE;
    dw $6C33,$01F0                                                       ;93B4BF;
    db $00                                                               ;93B4C3;
    dw $EC33,$01E8                                                       ;93B4C4;
    db $00                                                               ;93B4C8;
    dw $AC33,$01E8                                                       ;93B4C9;
    db $F8                                                               ;93B4CD;
    dw $2C33,$0010                                                       ;93B4CE;
    db $00                                                               ;93B4D2;
    dw $EC34,$0008                                                       ;93B4D3;
    db $00                                                               ;93B4D7;
    dw $AC34,$0010                                                       ;93B4D8;
    db $F8                                                               ;93B4DC;
    dw $6C34,$0008                                                       ;93B4DD;
    db $F8                                                               ;93B4E1;
    dw $2C34                                                             ;93B4E2;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_93B4E4:
    dw $0001,$01FC                                                       ;93B4E4;
    db $FC                                                               ;93B4E8;
    dw $2C30                                                             ;93B4E9;

UNUSED_ProjectileFlareSpritemaps_93B4EB:
    dw $0002,$01FC                                                       ;93B4EB;
    db $04                                                               ;93B4EF;
    dw $2C37,$01FC                                                       ;93B4F0;
    db $F4                                                               ;93B4F4;
    dw $2C30                                                             ;93B4F5;

UNUSED_ProjectileFlareSpritemaps_93B4F7:
    dw $0002,$01FC                                                       ;93B4F7;
    db $09                                                               ;93B4FB;
    dw $2C36,$01FC                                                       ;93B4FC;
    db $EF                                                               ;93B500;
    dw $2C31                                                             ;93B501;

UNUSED_ProjectileFlareSpritemaps_93B503:
    dw $0002,$01FC                                                       ;93B503;
    db $0B                                                               ;93B507;
    dw $2C37,$01FC                                                       ;93B508;
    db $ED                                                               ;93B50C;
    dw $2C32                                                             ;93B50D;

UNUSED_ProjectileFlareSpritemaps_93B50F:
    dw $0002,$01FC                                                       ;93B50F;
    db $0C                                                               ;93B513;
    dw $2C35,$01FC                                                       ;93B514;
    db $EC                                                               ;93B518;
    dw $2C30                                                             ;93B519;

UNUSED_ProjectileFlareSpritemaps_93B51B:
    dw $0002,$01FC                                                       ;93B51B;
    db $F4                                                               ;93B51F;
    dw $2C37,$01FC                                                       ;93B520;
    db $04                                                               ;93B524;
    dw $2C30                                                             ;93B525;

UNUSED_ProjectileFlareSpritemaps_93B527:
    dw $0002,$01FC                                                       ;93B527;
    db $EF                                                               ;93B52B;
    dw $2C35,$01FC                                                       ;93B52C;
    db $09                                                               ;93B530;
    dw $2C31                                                             ;93B531;

UNUSED_ProjectileFlareSpritemaps_93B533:
    dw $0002,$01FC                                                       ;93B533;
    db $0B                                                               ;93B537;
    dw $2C32,$01FC                                                       ;93B538;
    db $ED                                                               ;93B53C;
    dw $2C36                                                             ;93B53D;

UNUSED_ProjectileFlareSpritemaps_93B53F:
    dw $0002,$01FC                                                       ;93B53F;
    db $EC                                                               ;93B543;
    dw $2C37,$01FC                                                       ;93B544;
    db $0C                                                               ;93B548;
    dw $2C30                                                             ;93B549;

UNUSED_ProjectileFlareSpritemaps_93B54B:
    dw $0002,$01F6                                                       ;93B54B;
    db $02                                                               ;93B54F;
    dw $2C37,$0002                                                       ;93B550;
    db $F6                                                               ;93B554;
    dw $2C30                                                             ;93B555;

UNUSED_ProjectileFlareSpritemaps_93B557:
    dw $0002,$01F3                                                       ;93B557;
    db $05                                                               ;93B55B;
    dw $2C36,$0005                                                       ;93B55C;
    db $F3                                                               ;93B560;
    dw $2C31                                                             ;93B561;

UNUSED_ProjectileFlareSpritemaps_93B563:
    dw $0002,$01F1                                                       ;93B563;
    db $07                                                               ;93B567;
    dw $2C37,$0007                                                       ;93B568;
    db $F1                                                               ;93B56C;
    dw $2C32                                                             ;93B56D;

UNUSED_ProjectileFlareSpritemaps_93B56F:
    dw $0002,$0008                                                       ;93B56F;
    db $F0                                                               ;93B573;
    dw $2C30,$01F0                                                       ;93B574;
    db $08                                                               ;93B578;
    dw $2C35                                                             ;93B579;

UNUSED_ProjectileFlareSpritemaps_93B57B:
    dw $0002,$0002                                                       ;93B57B;
    db $F6                                                               ;93B57F;
    dw $2C35,$01F6                                                       ;93B580;
    db $02                                                               ;93B584;
    dw $2C30                                                             ;93B585;

UNUSED_ProjectileFlareSpritemaps_93B587:
    dw $0002,$0005                                                       ;93B587;
    db $F3                                                               ;93B58B;
    dw $2C36,$01F3                                                       ;93B58C;
    db $05                                                               ;93B590;
    dw $2C31                                                             ;93B591;

UNUSED_ProjectileFlareSpritemaps_93B593:
    dw $0002,$0007                                                       ;93B593;
    db $F1                                                               ;93B597;
    dw $2C37,$01F1                                                       ;93B598;
    db $07                                                               ;93B59C;
    dw $2C30                                                             ;93B59D;

UNUSED_ProjectileFlareSpritemaps_93B59F:
    dw $0002,$01F0                                                       ;93B59F;
    db $08                                                               ;93B5A3;
    dw $2C31,$0008                                                       ;93B5A4;
    db $F0                                                               ;93B5A8;
    dw $2C35                                                             ;93B5A9;

UNUSED_ProjectileFlareSpritemaps_93B5AB:
    dw $0002,$01F4                                                       ;93B5AB;
    db $FC                                                               ;93B5AF;
    dw $2C37,$0004                                                       ;93B5B0;
    db $FC                                                               ;93B5B4;
    dw $2C30                                                             ;93B5B5;

UNUSED_ProjectileFlareSpritemaps_93B5B7:
    dw $0002,$01F1                                                       ;93B5B7;
    db $FC                                                               ;93B5BB;
    dw $2C36,$0009                                                       ;93B5BC;
    db $FC                                                               ;93B5C0;
    dw $2C31                                                             ;93B5C1;

UNUSED_ProjectileFlareSpritemaps_93B5C3:
    dw $0002,$01ED                                                       ;93B5C3;
    db $FC                                                               ;93B5C7;
    dw $2C37,$000B                                                       ;93B5C8;
    db $FC                                                               ;93B5CC;
    dw $2C32                                                             ;93B5CD;

UNUSED_ProjectileFlareSpritemaps_93B5CF:
    dw $0002,$000C                                                       ;93B5CF;
    db $FC                                                               ;93B5D3;
    dw $2C35,$01EC                                                       ;93B5D4;
    db $FC                                                               ;93B5D8;
    dw $2C31                                                             ;93B5D9;

UNUSED_ProjectileFlareSpritemaps_93B5DB:
    dw $0002,$01F4                                                       ;93B5DB;
    db $FC                                                               ;93B5DF;
    dw $2C30,$0004                                                       ;93B5E0;
    db $FC                                                               ;93B5E4;
    dw $2C37                                                             ;93B5E5;

UNUSED_ProjectileFlareSpritemaps_93B5E7:
    dw $0002,$0009                                                       ;93B5E7;
    db $FC                                                               ;93B5EB;
    dw $2C36,$01EF                                                       ;93B5EC;
    db $FC                                                               ;93B5F0;
    dw $2C31                                                             ;93B5F1;

UNUSED_ProjectileFlareSpritemaps_93B5F3:
    dw $0002,$000C                                                       ;93B5F3;
    db $FC                                                               ;93B5F7;
    dw $2C35,$01ED                                                       ;93B5F8;
    db $FC                                                               ;93B5FC;
    dw $2C32                                                             ;93B5FD;

UNUSED_ProjectileFlareSpritemaps_93B5FF:
    dw $0002,$01EC                                                       ;93B5FF;
    db $FC                                                               ;93B603;
    dw $2C37,$000D                                                       ;93B604;
    db $FC                                                               ;93B608;
    dw $2C30                                                             ;93B609;

UNUSED_ProjectileFlareSpritemaps_93B60B:
    dw $0002,$0002                                                       ;93B60B;
    db $02                                                               ;93B60F;
    dw $2C37,$01F6                                                       ;93B610;
    db $F6                                                               ;93B614;
    dw $2C30                                                             ;93B615;

UNUSED_ProjectileFlareSpritemaps_93B617:
    dw $0002,$0005                                                       ;93B617;
    db $05                                                               ;93B61B;
    dw $2C36,$01F3                                                       ;93B61C;
    db $F3                                                               ;93B620;
    dw $2C31                                                             ;93B621;

UNUSED_ProjectileFlareSpritemaps_93B623:
    dw $0002,$0007                                                       ;93B623;
    db $07                                                               ;93B627;
    dw $2C35,$01F1                                                       ;93B628;
    db $F1                                                               ;93B62C;
    dw $2C32                                                             ;93B62D;

UNUSED_ProjectileFlareSpritemaps_93B62F:
    dw $0002,$0008                                                       ;93B62F;
    db $08                                                               ;93B633;
    dw $2C37,$01F0                                                       ;93B634;
    db $F0                                                               ;93B638;
    dw $2C31                                                             ;93B639;

UNUSED_ProjectileFlareSpritemaps_93B63B:
    dw $0002,$01F6                                                       ;93B63B;
    db $F6                                                               ;93B63F;
    dw $2C37,$0002                                                       ;93B640;
    db $02                                                               ;93B644;
    dw $2C30                                                             ;93B645;

UNUSED_ProjectileFlareSpritemaps_93B647:
    dw $0002,$01F3                                                       ;93B647;
    db $F3                                                               ;93B64B;
    dw $2C36,$0005                                                       ;93B64C;
    db $05                                                               ;93B650;
    dw $2C31                                                             ;93B651;

UNUSED_ProjectileFlareSpritemaps_93B653:
    dw $0002,$01F1                                                       ;93B653;
    db $F1                                                               ;93B657;
    dw $2C35,$0007                                                       ;93B658;
    db $07                                                               ;93B65C;
    dw $2C32                                                             ;93B65D;

UNUSED_ProjectileFlareSpritemaps_93B65F:
    dw $0002,$01F0                                                       ;93B65F;
    db $F0                                                               ;93B663;
    dw $2C37,$0008                                                       ;93B664;
    db $08                                                               ;93B668;
    dw $2C30                                                             ;93B669;

UNUSED_ProjectileFlareSpritemaps_93B66B:
    dw $0001,$01FC                                                       ;93B66B;
    db $FC                                                               ;93B66F;
    dw $2C30                                                             ;93B670;
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_ChargedIceWave_0:
    dw $0004,$0000                                                       ;93B672;
    db $00                                                               ;93B676;
    dw $EC34,$01F8                                                       ;93B677;
    db $00                                                               ;93B67B;
    dw $AC34,$0000                                                       ;93B67C;
    db $F8                                                               ;93B680;
    dw $6C34,$01F8                                                       ;93B681;
    db $F8                                                               ;93B685;
    dw $2C34                                                             ;93B686;

ProjectileFlareSpritemaps_ChargedIceWave_1:
    dw $0004,$0000                                                       ;93B688;
    db $00                                                               ;93B68C;
    dw $EC33,$01F8                                                       ;93B68D;
    db $00                                                               ;93B691;
    dw $AC33,$0000                                                       ;93B692;
    db $F8                                                               ;93B696;
    dw $6C33,$01F8                                                       ;93B697;
    db $F8                                                               ;93B69B;
    dw $2C33                                                             ;93B69C;

ProjectileFlareSpritemaps_ChargedIceWave_2:
    dw $0008,$0000                                                       ;93B69E;
    db $08                                                               ;93B6A2;
    dw $EC33,$01F8                                                       ;93B6A3;
    db $08                                                               ;93B6A7;
    dw $AC33,$0000                                                       ;93B6A8;
    db $00                                                               ;93B6AC;
    dw $6C33,$01F8                                                       ;93B6AD;
    db $00                                                               ;93B6B1;
    dw $2C33,$0000                                                       ;93B6B2;
    db $F8                                                               ;93B6B6;
    dw $EC34,$01F8                                                       ;93B6B7;
    db $F8                                                               ;93B6BB;
    dw $AC34,$0000                                                       ;93B6BC;
    db $F0                                                               ;93B6C0;
    dw $6C34,$01F8                                                       ;93B6C1;
    db $F0                                                               ;93B6C5;
    dw $2C34                                                             ;93B6C6;

ProjectileFlareSpritemaps_ChargedIceWave_3:
    dw $0008,$0000                                                       ;93B6C8;
    db $08                                                               ;93B6CC;
    dw $EC34,$01F8                                                       ;93B6CD;
    db $08                                                               ;93B6D1;
    dw $AC34,$0000                                                       ;93B6D2;
    db $00                                                               ;93B6D6;
    dw $6C34,$01F8                                                       ;93B6D7;
    db $00                                                               ;93B6DB;
    dw $2C34,$0000                                                       ;93B6DC;
    db $F8                                                               ;93B6E0;
    dw $EC33,$01F8                                                       ;93B6E1;
    db $F8                                                               ;93B6E5;
    dw $AC33,$0000                                                       ;93B6E6;
    db $F0                                                               ;93B6EA;
    dw $6C33,$01F8                                                       ;93B6EB;
    db $F0                                                               ;93B6EF;
    dw $2C33                                                             ;93B6F0;

ProjectileFlareSpritemaps_ChargedIceWave_4:
    dw $0008,$0000                                                       ;93B6F2;
    db $0D                                                               ;93B6F6;
    dw $EC33,$01F8                                                       ;93B6F7;
    db $0D                                                               ;93B6FB;
    dw $AC33,$0000                                                       ;93B6FC;
    db $05                                                               ;93B700;
    dw $6C33,$01F8                                                       ;93B701;
    db $05                                                               ;93B705;
    dw $2C33,$0000                                                       ;93B706;
    db $F3                                                               ;93B70A;
    dw $EC34,$01F8                                                       ;93B70B;
    db $F3                                                               ;93B70F;
    dw $AC34,$0000                                                       ;93B710;
    db $EB                                                               ;93B714;
    dw $6C34,$01F8                                                       ;93B715;
    db $EB                                                               ;93B719;
    dw $2C34                                                             ;93B71A;

ProjectileFlareSpritemaps_ChargedIceWave_5:
    dw $0008,$0000                                                       ;93B71C;
    db $0D                                                               ;93B720;
    dw $EC34,$01F8                                                       ;93B721;
    db $0D                                                               ;93B725;
    dw $AC34,$0000                                                       ;93B726;
    db $05                                                               ;93B72A;
    dw $6C34,$01F8                                                       ;93B72B;
    db $05                                                               ;93B72F;
    dw $2C34,$0000                                                       ;93B730;
    db $F3                                                               ;93B734;
    dw $EC33,$01F8                                                       ;93B735;
    db $F3                                                               ;93B739;
    dw $AC33,$0000                                                       ;93B73A;
    db $EB                                                               ;93B73E;
    dw $6C33,$01F8                                                       ;93B73F;
    db $EB                                                               ;93B743;
    dw $2C33                                                             ;93B744;

ProjectileFlareSpritemaps_ChargedIceWave_6:
    dw $0008,$0000                                                       ;93B746;
    db $0F                                                               ;93B74A;
    dw $EC33,$01F8                                                       ;93B74B;
    db $0F                                                               ;93B74F;
    dw $AC33,$0000                                                       ;93B750;
    db $07                                                               ;93B754;
    dw $6C33,$01F8                                                       ;93B755;
    db $07                                                               ;93B759;
    dw $2C33,$0000                                                       ;93B75A;
    db $F1                                                               ;93B75E;
    dw $EC34,$01F8                                                       ;93B75F;
    db $F1                                                               ;93B763;
    dw $AC34,$0000                                                       ;93B764;
    db $E9                                                               ;93B768;
    dw $6C34,$01F8                                                       ;93B769;
    db $E9                                                               ;93B76D;
    dw $2C34                                                             ;93B76E;

ProjectileFlareSpritemaps_ChargedIceWave_7:
    dw $0008,$0000                                                       ;93B770;
    db $0F                                                               ;93B774;
    dw $EC34,$01F8                                                       ;93B775;
    db $0F                                                               ;93B779;
    dw $AC34,$0000                                                       ;93B77A;
    db $07                                                               ;93B77E;
    dw $6C34,$01F8                                                       ;93B77F;
    db $07                                                               ;93B783;
    dw $2C34,$0000                                                       ;93B784;
    db $F1                                                               ;93B788;
    dw $EC33,$01F8                                                       ;93B789;
    db $F1                                                               ;93B78D;
    dw $AC33,$0000                                                       ;93B78E;
    db $E9                                                               ;93B792;
    dw $6C33,$01F8                                                       ;93B793;
    db $E9                                                               ;93B797;
    dw $2C33                                                             ;93B798;

ProjectileFlareSpritemaps_ChargedIceWave_8:
    dw $0008,$0000                                                       ;93B79A;
    db $10                                                               ;93B79E;
    dw $EC33,$01F8                                                       ;93B79F;
    db $10                                                               ;93B7A3;
    dw $AC33,$0000                                                       ;93B7A4;
    db $08                                                               ;93B7A8;
    dw $6C33,$01F8                                                       ;93B7A9;
    db $08                                                               ;93B7AD;
    dw $2C33,$0000                                                       ;93B7AE;
    db $F0                                                               ;93B7B2;
    dw $EC34,$01F8                                                       ;93B7B3;
    db $F0                                                               ;93B7B7;
    dw $AC34,$0000                                                       ;93B7B8;
    db $E8                                                               ;93B7BC;
    dw $6C34,$01F8                                                       ;93B7BD;
    db $E8                                                               ;93B7C1;
    dw $2C34                                                             ;93B7C2;

ProjectileFlareSpritemaps_ChargedIceWave_9:
    dw $0008,$0000                                                       ;93B7C4;
    db $10                                                               ;93B7C8;
    dw $EC34,$01F8                                                       ;93B7C9;
    db $10                                                               ;93B7CD;
    dw $AC34,$0000                                                       ;93B7CE;
    db $08                                                               ;93B7D2;
    dw $6C34,$01F8                                                       ;93B7D3;
    db $08                                                               ;93B7D7;
    dw $2C34,$0000                                                       ;93B7D8;
    db $F0                                                               ;93B7DC;
    dw $EC33,$01F8                                                       ;93B7DD;
    db $F0                                                               ;93B7E1;
    dw $AC33,$0000                                                       ;93B7E2;
    db $E8                                                               ;93B7E6;
    dw $6C33,$01F8                                                       ;93B7E7;
    db $E8                                                               ;93B7EB;
    dw $2C33                                                             ;93B7EC;

ProjectileFlareSpritemaps_ChargedIceWave_A:
    dw $0008,$0005                                                       ;93B7EE;
    db $FB                                                               ;93B7F2;
    dw $EC34,$01FD                                                       ;93B7F3;
    db $FB                                                               ;93B7F7;
    dw $AC34,$0005                                                       ;93B7F8;
    db $F3                                                               ;93B7FC;
    dw $6C34,$01FD                                                       ;93B7FD;
    db $F3                                                               ;93B801;
    dw $2C34,$01FB                                                       ;93B802;
    db $05                                                               ;93B806;
    dw $EC33,$01F3                                                       ;93B807;
    db $05                                                               ;93B80B;
    dw $AC33,$01FB                                                       ;93B80C;
    db $FD                                                               ;93B810;
    dw $6C33,$01F3                                                       ;93B811;
    db $FD                                                               ;93B815;
    dw $2C33                                                             ;93B816;

ProjectileFlareSpritemaps_ChargedIceWave_B:
    dw $0008,$0004                                                       ;93B818;
    db $FC                                                               ;93B81C;
    dw $EC33,$01FC                                                       ;93B81D;
    db $FC                                                               ;93B821;
    dw $AC33,$0004                                                       ;93B822;
    db $F4                                                               ;93B826;
    dw $6C33,$01FC                                                       ;93B827;
    db $F4                                                               ;93B82B;
    dw $2C33,$01FC                                                       ;93B82C;
    db $04                                                               ;93B830;
    dw $EC34,$01F4                                                       ;93B831;
    db $04                                                               ;93B835;
    dw $AC34,$01FC                                                       ;93B836;
    db $FC                                                               ;93B83A;
    dw $6C34,$01F4                                                       ;93B83B;
    db $FC                                                               ;93B83F;
    dw $2C34                                                             ;93B840;

ProjectileFlareSpritemaps_ChargedIceWave_C:
    dw $0008,$01F9                                                       ;93B842;
    db $07                                                               ;93B846;
    dw $EC33,$01F1                                                       ;93B847;
    db $07                                                               ;93B84B;
    dw $AC33,$01F9                                                       ;93B84C;
    db $FF                                                               ;93B850;
    dw $6C33,$01F1                                                       ;93B851;
    db $FF                                                               ;93B855;
    dw $2C33,$0007                                                       ;93B856;
    db $F9                                                               ;93B85A;
    dw $EC34,$01FF                                                       ;93B85B;
    db $F9                                                               ;93B85F;
    dw $AC34,$0007                                                       ;93B860;
    db $F1                                                               ;93B864;
    dw $6C34,$01FF                                                       ;93B865;
    db $F1                                                               ;93B869;
    dw $2C34                                                             ;93B86A;

ProjectileFlareSpritemaps_ChargedIceWave_D:
    dw $0008,$01F9                                                       ;93B86C;
    db $07                                                               ;93B870;
    dw $EC34,$01F1                                                       ;93B871;
    db $07                                                               ;93B875;
    dw $AC34,$01F9                                                       ;93B876;
    db $FF                                                               ;93B87A;
    dw $6C34,$01F1                                                       ;93B87B;
    db $FF                                                               ;93B87F;
    dw $2C34,$0007                                                       ;93B880;
    db $F9                                                               ;93B884;
    dw $EC33,$01FF                                                       ;93B885;
    db $F9                                                               ;93B889;
    dw $AC33,$0007                                                       ;93B88A;
    db $F1                                                               ;93B88E;
    dw $6C33,$01FF                                                       ;93B88F;
    db $F1                                                               ;93B893;
    dw $2C33                                                             ;93B894;

ProjectileFlareSpritemaps_ChargedIceWave_E:
    dw $0008,$01F7                                                       ;93B896;
    db $09                                                               ;93B89A;
    dw $EC33,$01EF                                                       ;93B89B;
    db $09                                                               ;93B89F;
    dw $AC33,$01F7                                                       ;93B8A0;
    db $01                                                               ;93B8A4;
    dw $6C33,$01EF                                                       ;93B8A5;
    db $01                                                               ;93B8A9;
    dw $2C33,$0009                                                       ;93B8AA;
    db $F7                                                               ;93B8AE;
    dw $EC34,$0001                                                       ;93B8AF;
    db $F7                                                               ;93B8B3;
    dw $AC34,$0009                                                       ;93B8B4;
    db $EF                                                               ;93B8B8;
    dw $6C34,$0001                                                       ;93B8B9;
    db $EF                                                               ;93B8BD;
    dw $2C34                                                             ;93B8BE;

ProjectileFlareSpritemaps_ChargedIceWave_F:
    dw $0008,$01F7                                                       ;93B8C0;
    db $09                                                               ;93B8C4;
    dw $EC34,$01EF                                                       ;93B8C5;
    db $09                                                               ;93B8C9;
    dw $AC34,$01F7                                                       ;93B8CA;
    db $01                                                               ;93B8CE;
    dw $6C34,$01EF                                                       ;93B8CF;
    db $01                                                               ;93B8D3;
    dw $2C34,$0009                                                       ;93B8D4;
    db $F7                                                               ;93B8D8;
    dw $EC33,$0001                                                       ;93B8D9;
    db $F7                                                               ;93B8DD;
    dw $AC33,$0009                                                       ;93B8DE;
    db $EF                                                               ;93B8E2;
    dw $6C33,$0001                                                       ;93B8E3;
    db $EF                                                               ;93B8E7;
    dw $2C33                                                             ;93B8E8;

ProjectileFlareSpritemaps_ChargedIceWave_10:
    dw $0008,$01F6                                                       ;93B8EA;
    db $0A                                                               ;93B8EE;
    dw $EC33,$01EE                                                       ;93B8EF;
    db $0A                                                               ;93B8F3;
    dw $AC33,$01F6                                                       ;93B8F4;
    db $02                                                               ;93B8F8;
    dw $6C33,$01EE                                                       ;93B8F9;
    db $02                                                               ;93B8FD;
    dw $2C33,$000A                                                       ;93B8FE;
    db $F6                                                               ;93B902;
    dw $EC34,$0002                                                       ;93B903;
    db $F6                                                               ;93B907;
    dw $AC34,$000A                                                       ;93B908;
    db $EE                                                               ;93B90C;
    dw $6C34,$0002                                                       ;93B90D;
    db $EE                                                               ;93B911;
    dw $2C34                                                             ;93B912;

ProjectileFlareSpritemaps_ChargedIceWave_11:
    dw $0008,$01F6                                                       ;93B914;
    db $0A                                                               ;93B918;
    dw $EC34,$01EE                                                       ;93B919;
    db $0A                                                               ;93B91D;
    dw $AC34,$01F6                                                       ;93B91E;
    db $02                                                               ;93B922;
    dw $6C34,$01EE                                                       ;93B923;
    db $02                                                               ;93B927;
    dw $2C34,$000A                                                       ;93B928;
    db $F6                                                               ;93B92C;
    dw $EC33,$0002                                                       ;93B92D;
    db $F6                                                               ;93B931;
    dw $AC33,$000A                                                       ;93B932;
    db $EE                                                               ;93B936;
    dw $6C33,$0002                                                       ;93B937;
    db $EE                                                               ;93B93B;
    dw $2C33                                                             ;93B93C;

ProjectileFlareSpritemaps_ChargedIceWave_12:
    dw $0008,$01F3                                                       ;93B93E;
    db $FB                                                               ;93B942;
    dw $AC34,$01FB                                                       ;93B943;
    db $FB                                                               ;93B947;
    dw $EC34,$01F3                                                       ;93B948;
    db $F3                                                               ;93B94C;
    dw $2C34,$01FB                                                       ;93B94D;
    db $F3                                                               ;93B951;
    dw $6C34,$01FD                                                       ;93B952;
    db $05                                                               ;93B956;
    dw $AC33,$0005                                                       ;93B957;
    db $05                                                               ;93B95B;
    dw $EC33,$01FD                                                       ;93B95C;
    db $FD                                                               ;93B960;
    dw $2C33,$0005                                                       ;93B961;
    db $FD                                                               ;93B965;
    dw $6C33                                                             ;93B966;

ProjectileFlareSpritemaps_ChargedIceWave_13:
    dw $0008,$01F4                                                       ;93B968;
    db $FC                                                               ;93B96C;
    dw $AC33,$01FC                                                       ;93B96D;
    db $FC                                                               ;93B971;
    dw $EC33,$01F4                                                       ;93B972;
    db $F4                                                               ;93B976;
    dw $2C33,$01FC                                                       ;93B977;
    db $F4                                                               ;93B97B;
    dw $6C33,$01FC                                                       ;93B97C;
    db $04                                                               ;93B980;
    dw $AC34,$0004                                                       ;93B981;
    db $04                                                               ;93B985;
    dw $EC34,$01FC                                                       ;93B986;
    db $FC                                                               ;93B98A;
    dw $2C34,$0004                                                       ;93B98B;
    db $FC                                                               ;93B98F;
    dw $6C34                                                             ;93B990;

ProjectileFlareSpritemaps_ChargedIceWave_14:
    dw $0008,$01FF                                                       ;93B992;
    db $07                                                               ;93B996;
    dw $AC33,$0007                                                       ;93B997;
    db $07                                                               ;93B99B;
    dw $EC33,$01FF                                                       ;93B99C;
    db $FF                                                               ;93B9A0;
    dw $2C33,$0007                                                       ;93B9A1;
    db $FF                                                               ;93B9A5;
    dw $6C33,$01F1                                                       ;93B9A6;
    db $F9                                                               ;93B9AA;
    dw $AC34,$01F9                                                       ;93B9AB;
    db $F9                                                               ;93B9AF;
    dw $EC34,$01F1                                                       ;93B9B0;
    db $F1                                                               ;93B9B4;
    dw $2C34,$01F9                                                       ;93B9B5;
    db $F1                                                               ;93B9B9;
    dw $6C34                                                             ;93B9BA;

ProjectileFlareSpritemaps_ChargedIceWave_15:
    dw $0008,$01FF                                                       ;93B9BC;
    db $07                                                               ;93B9C0;
    dw $AC34,$0007                                                       ;93B9C1;
    db $07                                                               ;93B9C5;
    dw $EC34,$01FF                                                       ;93B9C6;
    db $FF                                                               ;93B9CA;
    dw $2C34,$0007                                                       ;93B9CB;
    db $FF                                                               ;93B9CF;
    dw $6C34,$01F1                                                       ;93B9D0;
    db $F9                                                               ;93B9D4;
    dw $AC33,$01F9                                                       ;93B9D5;
    db $F9                                                               ;93B9D9;
    dw $EC33,$01F1                                                       ;93B9DA;
    db $F1                                                               ;93B9DE;
    dw $2C33,$01F9                                                       ;93B9DF;
    db $F1                                                               ;93B9E3;
    dw $6C33                                                             ;93B9E4;

ProjectileFlareSpritemaps_ChargedIceWave_16:
    dw $0008,$0001                                                       ;93B9E6;
    db $09                                                               ;93B9EA;
    dw $AC33,$0009                                                       ;93B9EB;
    db $09                                                               ;93B9EF;
    dw $EC33,$0001                                                       ;93B9F0;
    db $01                                                               ;93B9F4;
    dw $2C33,$0009                                                       ;93B9F5;
    db $01                                                               ;93B9F9;
    dw $6C33,$01EF                                                       ;93B9FA;
    db $F7                                                               ;93B9FE;
    dw $AC34,$01F7                                                       ;93B9FF;
    db $F7                                                               ;93BA03;
    dw $EC34,$01EF                                                       ;93BA04;
    db $EF                                                               ;93BA08;
    dw $2C34,$01F7                                                       ;93BA09;
    db $EF                                                               ;93BA0D;
    dw $6C34                                                             ;93BA0E;

ProjectileFlareSpritemaps_ChargedIceWave_17:
    dw $0008,$0001                                                       ;93BA10;
    db $09                                                               ;93BA14;
    dw $AC34,$0009                                                       ;93BA15;
    db $09                                                               ;93BA19;
    dw $EC34,$0001                                                       ;93BA1A;
    db $01                                                               ;93BA1E;
    dw $2C34,$0009                                                       ;93BA1F;
    db $01                                                               ;93BA23;
    dw $6C34,$01EF                                                       ;93BA24;
    db $F7                                                               ;93BA28;
    dw $AC33,$01F7                                                       ;93BA29;
    db $F7                                                               ;93BA2D;
    dw $EC33,$01EF                                                       ;93BA2E;
    db $EF                                                               ;93BA32;
    dw $2C33,$01F7                                                       ;93BA33;
    db $EF                                                               ;93BA37;
    dw $6C33                                                             ;93BA38;

ProjectileFlareSpritemaps_ChargedIceWave_18:
    dw $0008,$0002                                                       ;93BA3A;
    db $0A                                                               ;93BA3E;
    dw $AC33,$000A                                                       ;93BA3F;
    db $0A                                                               ;93BA43;
    dw $EC33,$0002                                                       ;93BA44;
    db $02                                                               ;93BA48;
    dw $2C33,$000A                                                       ;93BA49;
    db $02                                                               ;93BA4D;
    dw $6C33,$01EE                                                       ;93BA4E;
    db $F6                                                               ;93BA52;
    dw $AC34,$01F6                                                       ;93BA53;
    db $F6                                                               ;93BA57;
    dw $EC34,$01EE                                                       ;93BA58;
    db $EE                                                               ;93BA5C;
    dw $2C34,$01F6                                                       ;93BA5D;
    db $EE                                                               ;93BA61;
    dw $6C34                                                             ;93BA62;

ProjectileFlareSpritemaps_ChargedIceWave_19:
    dw $0008,$0002                                                       ;93BA64;
    db $0A                                                               ;93BA68;
    dw $AC34,$000A                                                       ;93BA69;
    db $0A                                                               ;93BA6D;
    dw $EC34,$0002                                                       ;93BA6E;
    db $02                                                               ;93BA72;
    dw $2C34,$000A                                                       ;93BA73;
    db $02                                                               ;93BA77;
    dw $6C34,$01EE                                                       ;93BA78;
    db $F6                                                               ;93BA7C;
    dw $AC33,$01F6                                                       ;93BA7D;
    db $F6                                                               ;93BA81;
    dw $EC33,$01EE                                                       ;93BA82;
    db $EE                                                               ;93BA86;
    dw $2C33,$01F6                                                       ;93BA87;
    db $EE                                                               ;93BA8B;
    dw $6C33                                                             ;93BA8C;

ProjectileFlareSpritemaps_ChargedIceWave_1A:
    dw $0004,$0000                                                       ;93BA8E;
    db $F8                                                               ;93BA92;
    dw $6C34,$0000                                                       ;93BA93;
    db $00                                                               ;93BA97;
    dw $EC34,$01F8                                                       ;93BA98;
    db $00                                                               ;93BA9C;
    dw $AC34,$01F8                                                       ;93BA9D;
    db $F8                                                               ;93BAA1;
    dw $2C34                                                             ;93BAA2;

ProjectileFlareSpritemaps_ChargedIceWave_1B:
    dw $0004,$0000                                                       ;93BAA4;
    db $F8                                                               ;93BAA8;
    dw $6C33,$0000                                                       ;93BAA9;
    db $00                                                               ;93BAAD;
    dw $EC33,$01F8                                                       ;93BAAE;
    db $00                                                               ;93BAB2;
    dw $AC33,$01F8                                                       ;93BAB3;
    db $F8                                                               ;93BAB7;
    dw $2C33                                                             ;93BAB8;

ProjectileFlareSpritemaps_ChargedIceWave_1C:
    dw $0008,$01F8                                                       ;93BABA;
    db $F8                                                               ;93BABE;
    dw $6C34,$01F8                                                       ;93BABF;
    db $00                                                               ;93BAC3;
    dw $EC34,$01F0                                                       ;93BAC4;
    db $00                                                               ;93BAC8;
    dw $AC34,$01F0                                                       ;93BAC9;
    db $F8                                                               ;93BACD;
    dw $2C34,$0008                                                       ;93BACE;
    db $00                                                               ;93BAD2;
    dw $EC33,$0000                                                       ;93BAD3;
    db $00                                                               ;93BAD7;
    dw $AC33,$0008                                                       ;93BAD8;
    db $F8                                                               ;93BADC;
    dw $6C33,$0000                                                       ;93BADD;
    db $F8                                                               ;93BAE1;
    dw $2C33                                                             ;93BAE2;

ProjectileFlareSpritemaps_ChargedIceWave_1D:
    dw $0008,$01F8                                                       ;93BAE4;
    db $F8                                                               ;93BAE8;
    dw $6C33,$01F8                                                       ;93BAE9;
    db $00                                                               ;93BAED;
    dw $EC33,$01F0                                                       ;93BAEE;
    db $00                                                               ;93BAF2;
    dw $AC33,$01F0                                                       ;93BAF3;
    db $F8                                                               ;93BAF7;
    dw $2C33,$0008                                                       ;93BAF8;
    db $00                                                               ;93BAFC;
    dw $EC34,$0000                                                       ;93BAFD;
    db $00                                                               ;93BB01;
    dw $AC34,$0008                                                       ;93BB02;
    db $F8                                                               ;93BB06;
    dw $6C34,$0000                                                       ;93BB07;
    db $F8                                                               ;93BB0B;
    dw $2C34                                                             ;93BB0C;

ProjectileFlareSpritemaps_ChargedIceWave_1E:
    dw $0008,$01F3                                                       ;93BB0E;
    db $F8                                                               ;93BB12;
    dw $6C34,$01F3                                                       ;93BB13;
    db $00                                                               ;93BB17;
    dw $EC34,$01EB                                                       ;93BB18;
    db $00                                                               ;93BB1C;
    dw $AC34,$01EB                                                       ;93BB1D;
    db $F8                                                               ;93BB21;
    dw $2C34,$000D                                                       ;93BB22;
    db $00                                                               ;93BB26;
    dw $EC33,$0005                                                       ;93BB27;
    db $00                                                               ;93BB2B;
    dw $AC33,$000D                                                       ;93BB2C;
    db $F8                                                               ;93BB30;
    dw $6C33,$0005                                                       ;93BB31;
    db $F8                                                               ;93BB35;
    dw $2C33                                                             ;93BB36;

ProjectileFlareSpritemaps_ChargedIceWave_1F:
    dw $0008,$01F3                                                       ;93BB38;
    db $F8                                                               ;93BB3C;
    dw $6C33,$01F3                                                       ;93BB3D;
    db $00                                                               ;93BB41;
    dw $EC33,$01EB                                                       ;93BB42;
    db $00                                                               ;93BB46;
    dw $AC33,$01EB                                                       ;93BB47;
    db $F8                                                               ;93BB4B;
    dw $2C33,$000D                                                       ;93BB4C;
    db $00                                                               ;93BB50;
    dw $EC34,$0005                                                       ;93BB51;
    db $00                                                               ;93BB55;
    dw $AC34,$000D                                                       ;93BB56;
    db $F8                                                               ;93BB5A;
    dw $6C34,$0005                                                       ;93BB5B;
    db $F8                                                               ;93BB5F;
    dw $2C34                                                             ;93BB60;

ProjectileFlareSpritemaps_ChargedIceWave_20:
    dw $0008,$01F1                                                       ;93BB62;
    db $F8                                                               ;93BB66;
    dw $6C34,$01F1                                                       ;93BB67;
    db $00                                                               ;93BB6B;
    dw $EC34,$01E9                                                       ;93BB6C;
    db $00                                                               ;93BB70;
    dw $AC34,$01E9                                                       ;93BB71;
    db $F8                                                               ;93BB75;
    dw $2C34,$000F                                                       ;93BB76;
    db $00                                                               ;93BB7A;
    dw $EC33,$0007                                                       ;93BB7B;
    db $00                                                               ;93BB7F;
    dw $AC33,$000F                                                       ;93BB80;
    db $F8                                                               ;93BB84;
    dw $6C33,$0007                                                       ;93BB85;
    db $F8                                                               ;93BB89;
    dw $2C33                                                             ;93BB8A;

ProjectileFlareSpritemaps_ChargedIceWave_21:
    dw $0008,$01F1                                                       ;93BB8C;
    db $F8                                                               ;93BB90;
    dw $6C33,$01F1                                                       ;93BB91;
    db $00                                                               ;93BB95;
    dw $EC33,$01E9                                                       ;93BB96;
    db $00                                                               ;93BB9A;
    dw $AC33,$01E9                                                       ;93BB9B;
    db $F8                                                               ;93BB9F;
    dw $2C33,$000F                                                       ;93BBA0;
    db $00                                                               ;93BBA4;
    dw $EC34,$0007                                                       ;93BBA5;
    db $00                                                               ;93BBA9;
    dw $AC34,$000F                                                       ;93BBAA;
    db $F8                                                               ;93BBAE;
    dw $6C34,$0007                                                       ;93BBAF;
    db $F8                                                               ;93BBB3;
    dw $2C34                                                             ;93BBB4;

ProjectileFlareSpritemaps_ChargedIceWave_22:
    dw $0008,$01F0                                                       ;93BBB6;
    db $F8                                                               ;93BBBA;
    dw $6C34,$01F0                                                       ;93BBBB;
    db $00                                                               ;93BBBF;
    dw $EC34,$01E8                                                       ;93BBC0;
    db $00                                                               ;93BBC4;
    dw $AC34,$01E8                                                       ;93BBC5;
    db $F8                                                               ;93BBC9;
    dw $2C34,$0010                                                       ;93BBCA;
    db $00                                                               ;93BBCE;
    dw $EC33,$0008                                                       ;93BBCF;
    db $00                                                               ;93BBD3;
    dw $AC33,$0010                                                       ;93BBD4;
    db $F8                                                               ;93BBD8;
    dw $6C33,$0008                                                       ;93BBD9;
    db $F8                                                               ;93BBDD;
    dw $2C33                                                             ;93BBDE;

ProjectileFlareSpritemaps_ChargedIceWave_23:
    dw $0008,$01F0                                                       ;93BBE0;
    db $F8                                                               ;93BBE4;
    dw $6C33,$01F0                                                       ;93BBE5;
    db $00                                                               ;93BBE9;
    dw $EC33,$01E8                                                       ;93BBEA;
    db $00                                                               ;93BBEE;
    dw $AC33,$01E8                                                       ;93BBEF;
    db $F8                                                               ;93BBF3;
    dw $2C33,$0010                                                       ;93BBF4;
    db $00                                                               ;93BBF8;
    dw $EC34,$0008                                                       ;93BBF9;
    db $00                                                               ;93BBFD;
    dw $AC34,$0010                                                       ;93BBFE;
    db $F8                                                               ;93BC02;
    dw $6C34,$0008                                                       ;93BC03;
    db $F8                                                               ;93BC07;
    dw $2C34                                                             ;93BC08;

ProjectileFlareSpritemaps_Charged_PW_PIW_0:
    dw $0004,$0008                                                       ;93BC0A;
    db $FC                                                               ;93BC0E;
    dw $2C30,$0000                                                       ;93BC0F;
    db $FC                                                               ;93BC13;
    dw $2C30,$01F8                                                       ;93BC14;
    db $FC                                                               ;93BC18;
    dw $2C30,$01F0                                                       ;93BC19;
    db $FC                                                               ;93BC1D;
    dw $2C30                                                             ;93BC1E;

ProjectileFlareSpritemaps_Charged_PW_PIW_1:
    dw $0008,$0008                                                       ;93BC20;
    db $04                                                               ;93BC24;
    dw $2C30,$0000                                                       ;93BC25;
    db $04                                                               ;93BC29;
    dw $2C30,$01F8                                                       ;93BC2A;
    db $04                                                               ;93BC2E;
    dw $2C30,$01F0                                                       ;93BC2F;
    db $04                                                               ;93BC33;
    dw $2C30,$0008                                                       ;93BC34;
    db $F4                                                               ;93BC38;
    dw $2C30,$0000                                                       ;93BC39;
    db $F4                                                               ;93BC3D;
    dw $2C30,$01F8                                                       ;93BC3E;
    db $F4                                                               ;93BC42;
    dw $2C30,$01F0                                                       ;93BC43;
    db $F4                                                               ;93BC47;
    dw $2C30                                                             ;93BC48;

ProjectileFlareSpritemaps_Charged_PW_PIW_2:
    dw $0008,$0008                                                       ;93BC4A;
    db $09                                                               ;93BC4E;
    dw $2C30,$0000                                                       ;93BC4F;
    db $09                                                               ;93BC53;
    dw $2C30,$01F8                                                       ;93BC54;
    db $09                                                               ;93BC58;
    dw $2C30,$01F0                                                       ;93BC59;
    db $09                                                               ;93BC5D;
    dw $2C30,$0008                                                       ;93BC5E;
    db $EF                                                               ;93BC62;
    dw $2C30,$0000                                                       ;93BC63;
    db $EF                                                               ;93BC67;
    dw $2C30,$01F8                                                       ;93BC68;
    db $EF                                                               ;93BC6C;
    dw $2C30,$01F0                                                       ;93BC6D;
    db $EF                                                               ;93BC71;
    dw $2C30                                                             ;93BC72;

ProjectileFlareSpritemaps_Charged_PW_PIW_3:
    dw $0008,$0008                                                       ;93BC74;
    db $0B                                                               ;93BC78;
    dw $2C30,$0000                                                       ;93BC79;
    db $0B                                                               ;93BC7D;
    dw $2C30,$01F8                                                       ;93BC7E;
    db $0B                                                               ;93BC82;
    dw $2C30,$01F0                                                       ;93BC83;
    db $0B                                                               ;93BC87;
    dw $2C30,$0008                                                       ;93BC88;
    db $ED                                                               ;93BC8C;
    dw $2C30,$0000                                                       ;93BC8D;
    db $ED                                                               ;93BC91;
    dw $2C30,$01F8                                                       ;93BC92;
    db $ED                                                               ;93BC96;
    dw $2C30,$01F0                                                       ;93BC97;
    db $ED                                                               ;93BC9B;
    dw $2C30                                                             ;93BC9C;

ProjectileFlareSpritemaps_Charged_PW_PIW_4:
    dw $0008,$0008                                                       ;93BC9E;
    db $0C                                                               ;93BCA2;
    dw $2C30,$0000                                                       ;93BCA3;
    db $0C                                                               ;93BCA7;
    dw $2C30,$01F8                                                       ;93BCA8;
    db $0C                                                               ;93BCAC;
    dw $2C30,$01F0                                                       ;93BCAD;
    db $0C                                                               ;93BCB1;
    dw $2C30,$0008                                                       ;93BCB2;
    db $EC                                                               ;93BCB6;
    dw $2C30,$0000                                                       ;93BCB7;
    db $EC                                                               ;93BCBB;
    dw $2C30,$01F8                                                       ;93BCBC;
    db $EC                                                               ;93BCC0;
    dw $2C30,$01F0                                                       ;93BCC1;
    db $EC                                                               ;93BCC5;
    dw $2C30                                                             ;93BCC6;

ProjectileFlareSpritemaps_Charged_PW_PIW_5:
    dw $0007,$0014                                                       ;93BCC8;
    db $FC                                                               ;93BCCC;
    dw $2C30,$01E4                                                       ;93BCCD;
    db $FC                                                               ;93BCD1;
    dw $2C30,$000C                                                       ;93BCD2;
    db $FC                                                               ;93BCD6;
    dw $2C30,$0004                                                       ;93BCD7;
    db $FC                                                               ;93BCDB;
    dw $2C30,$01FC                                                       ;93BCDC;
    db $FC                                                               ;93BCE0;
    dw $2C30,$01F4                                                       ;93BCE1;
    db $FC                                                               ;93BCE5;
    dw $2C30,$01EC                                                       ;93BCE6;
    db $FC                                                               ;93BCEA;
    dw $2C30                                                             ;93BCEB;

ProjectileFlareSpritemaps_Charged_PW_PIW_6:
    dw $000E,$0014                                                       ;93BCED;
    db $04                                                               ;93BCF1;
    dw $2C30,$0014                                                       ;93BCF2;
    db $F4                                                               ;93BCF6;
    dw $2C30,$000C                                                       ;93BCF7;
    db $04                                                               ;93BCFB;
    dw $2C30,$01E4                                                       ;93BCFC;
    db $04                                                               ;93BD00;
    dw $2C30,$01E4                                                       ;93BD01;
    db $F4                                                               ;93BD05;
    dw $2C30,$000C                                                       ;93BD06;
    db $F4                                                               ;93BD0A;
    dw $2C30,$0004                                                       ;93BD0B;
    db $04                                                               ;93BD0F;
    dw $2C30,$01FC                                                       ;93BD10;
    db $04                                                               ;93BD14;
    dw $2C30,$01F4                                                       ;93BD15;
    db $04                                                               ;93BD19;
    dw $2C30,$01EC                                                       ;93BD1A;
    db $04                                                               ;93BD1E;
    dw $2C30,$0004                                                       ;93BD1F;
    db $F4                                                               ;93BD23;
    dw $2C30,$01FC                                                       ;93BD24;
    db $F4                                                               ;93BD28;
    dw $2C30,$01F4                                                       ;93BD29;
    db $F4                                                               ;93BD2D;
    dw $2C30,$01EC                                                       ;93BD2E;
    db $F4                                                               ;93BD32;
    dw $2C30                                                             ;93BD33;

ProjectileFlareSpritemaps_Charged_PW_PIW_7:
    dw $000E,$0014                                                       ;93BD35;
    db $09                                                               ;93BD39;
    dw $2C30,$0014                                                       ;93BD3A;
    db $EF                                                               ;93BD3E;
    dw $2C30,$000C                                                       ;93BD3F;
    db $09                                                               ;93BD43;
    dw $2C30,$01E4                                                       ;93BD44;
    db $09                                                               ;93BD48;
    dw $2C30,$01E4                                                       ;93BD49;
    db $EF                                                               ;93BD4D;
    dw $2C30,$000C                                                       ;93BD4E;
    db $EF                                                               ;93BD52;
    dw $2C30,$0004                                                       ;93BD53;
    db $09                                                               ;93BD57;
    dw $2C30,$01FC                                                       ;93BD58;
    db $09                                                               ;93BD5C;
    dw $2C30,$01F4                                                       ;93BD5D;
    db $09                                                               ;93BD61;
    dw $2C30,$01EC                                                       ;93BD62;
    db $09                                                               ;93BD66;
    dw $2C30,$0004                                                       ;93BD67;
    db $EF                                                               ;93BD6B;
    dw $2C30,$01FC                                                       ;93BD6C;
    db $EF                                                               ;93BD70;
    dw $2C30,$01F4                                                       ;93BD71;
    db $EF                                                               ;93BD75;
    dw $2C30,$01EC                                                       ;93BD76;
    db $EF                                                               ;93BD7A;
    dw $2C30                                                             ;93BD7B;

ProjectileFlareSpritemaps_Charged_PW_PIW_8:
    dw $000E,$0014                                                       ;93BD7D;
    db $0B                                                               ;93BD81;
    dw $2C30,$0014                                                       ;93BD82;
    db $ED                                                               ;93BD86;
    dw $2C30,$000C                                                       ;93BD87;
    db $0B                                                               ;93BD8B;
    dw $2C30,$01E4                                                       ;93BD8C;
    db $0B                                                               ;93BD90;
    dw $2C30,$01E4                                                       ;93BD91;
    db $ED                                                               ;93BD95;
    dw $2C30,$000C                                                       ;93BD96;
    db $ED                                                               ;93BD9A;
    dw $2C30,$0004                                                       ;93BD9B;
    db $0B                                                               ;93BD9F;
    dw $2C30,$01FC                                                       ;93BDA0;
    db $0B                                                               ;93BDA4;
    dw $2C30,$01F4                                                       ;93BDA5;
    db $0B                                                               ;93BDA9;
    dw $2C30,$01EC                                                       ;93BDAA;
    db $0B                                                               ;93BDAE;
    dw $2C30,$0004                                                       ;93BDAF;
    db $ED                                                               ;93BDB3;
    dw $2C30,$01FC                                                       ;93BDB4;
    db $ED                                                               ;93BDB8;
    dw $2C30,$01F4                                                       ;93BDB9;
    db $ED                                                               ;93BDBD;
    dw $2C30,$01EC                                                       ;93BDBE;
    db $ED                                                               ;93BDC2;
    dw $2C30                                                             ;93BDC3;

ProjectileFlareSpritemaps_Charged_PW_PIW_9:
    dw $000E,$0014                                                       ;93BDC5;
    db $0C                                                               ;93BDC9;
    dw $2C30,$0014                                                       ;93BDCA;
    db $EC                                                               ;93BDCE;
    dw $2C30,$000C                                                       ;93BDCF;
    db $0C                                                               ;93BDD3;
    dw $2C30,$01E4                                                       ;93BDD4;
    db $0C                                                               ;93BDD8;
    dw $2C30,$01E4                                                       ;93BDD9;
    db $EC                                                               ;93BDDD;
    dw $2C30,$000C                                                       ;93BDDE;
    db $EC                                                               ;93BDE2;
    dw $2C30,$0004                                                       ;93BDE3;
    db $0C                                                               ;93BDE7;
    dw $2C30,$01FC                                                       ;93BDE8;
    db $0C                                                               ;93BDEC;
    dw $2C30,$01F4                                                       ;93BDED;
    db $0C                                                               ;93BDF1;
    dw $2C30,$01EC                                                       ;93BDF2;
    db $0C                                                               ;93BDF6;
    dw $2C30,$0004                                                       ;93BDF7;
    db $EC                                                               ;93BDFB;
    dw $2C30,$01FC                                                       ;93BDFC;
    db $EC                                                               ;93BE00;
    dw $2C30,$01F4                                                       ;93BE01;
    db $EC                                                               ;93BE05;
    dw $2C30,$01EC                                                       ;93BE06;
    db $EC                                                               ;93BE0A;
    dw $2C30                                                             ;93BE0B;

ProjectileFlareSpritemaps_Charged_PW_PIW_A:
    dw $0006,$0008                                                       ;93BE0D;
    db $04                                                               ;93BE11;
    dw $2C32,$0000                                                       ;93BE12;
    db $04                                                               ;93BE16;
    dw $2C31,$01F8                                                       ;93BE17;
    db $F4                                                               ;93BE1B;
    dw $2C32,$01F0                                                       ;93BE1C;
    db $F4                                                               ;93BE20;
    dw $2C31,$0000                                                       ;93BE21;
    db $FC                                                               ;93BE25;
    dw $2C32,$01F8                                                       ;93BE26;
    db $FC                                                               ;93BE2A;
    dw $2C31                                                             ;93BE2B;

ProjectileFlareSpritemaps_Charged_PW_PIW_B:
    dw $000C,$000F                                                       ;93BE2D;
    db $FE                                                               ;93BE31;
    dw $2C32,$0007                                                       ;93BE32;
    db $FE                                                               ;93BE36;
    dw $2C31,$01FF                                                       ;93BE37;
    db $EE                                                               ;93BE3B;
    dw $2C32,$01F7                                                       ;93BE3C;
    db $EE                                                               ;93BE40;
    dw $2C31,$0007                                                       ;93BE41;
    db $F6                                                               ;93BE45;
    dw $2C32,$01FF                                                       ;93BE46;
    db $F6                                                               ;93BE4A;
    dw $2C31,$0002                                                       ;93BE4B;
    db $0A                                                               ;93BE4F;
    dw $2C32,$01FA                                                       ;93BE50;
    db $0A                                                               ;93BE54;
    dw $2C31,$01F2                                                       ;93BE55;
    db $FA                                                               ;93BE59;
    dw $2C32,$01EA                                                       ;93BE5A;
    db $FA                                                               ;93BE5E;
    dw $2C31,$01FA                                                       ;93BE5F;
    db $02                                                               ;93BE63;
    dw $2C32,$01F2                                                       ;93BE64;
    db $02                                                               ;93BE68;
    dw $2C31                                                             ;93BE69;

ProjectileFlareSpritemaps_Charged_PW_PIW_C:
    dw $000C,$0012                                                       ;93BE6B;
    db $FB                                                               ;93BE6F;
    dw $2C32,$000A                                                       ;93BE70;
    db $FB                                                               ;93BE74;
    dw $2C31,$0002                                                       ;93BE75;
    db $EB                                                               ;93BE79;
    dw $2C32,$01FA                                                       ;93BE7A;
    db $EB                                                               ;93BE7E;
    dw $2C31,$000A                                                       ;93BE7F;
    db $F3                                                               ;93BE83;
    dw $2C32,$0002                                                       ;93BE84;
    db $F3                                                               ;93BE88;
    dw $2C31,$01FF                                                       ;93BE89;
    db $0D                                                               ;93BE8D;
    dw $2C32,$01F7                                                       ;93BE8E;
    db $0D                                                               ;93BE92;
    dw $2C31,$01EF                                                       ;93BE93;
    db $FD                                                               ;93BE97;
    dw $2C32,$01E7                                                       ;93BE98;
    db $FD                                                               ;93BE9C;
    dw $2C31,$01F7                                                       ;93BE9D;
    db $05                                                               ;93BEA1;
    dw $2C32,$01EF                                                       ;93BEA2;
    db $05                                                               ;93BEA6;
    dw $2C31                                                             ;93BEA7;

ProjectileFlareSpritemaps_Charged_PW_PIW_D:
    dw $000C,$0014                                                       ;93BEA9;
    db $F9                                                               ;93BEAD;
    dw $2C32,$000C                                                       ;93BEAE;
    db $F9                                                               ;93BEB2;
    dw $2C31,$0004                                                       ;93BEB3;
    db $E9                                                               ;93BEB7;
    dw $2C32,$01FC                                                       ;93BEB8;
    db $E9                                                               ;93BEBC;
    dw $2C31,$000C                                                       ;93BEBD;
    db $F1                                                               ;93BEC1;
    dw $2C32,$0004                                                       ;93BEC2;
    db $F1                                                               ;93BEC6;
    dw $2C31,$01FD                                                       ;93BEC7;
    db $0F                                                               ;93BECB;
    dw $2C32,$01F5                                                       ;93BECC;
    db $0F                                                               ;93BED0;
    dw $2C31,$01ED                                                       ;93BED1;
    db $FF                                                               ;93BED5;
    dw $2C32,$01E5                                                       ;93BED6;
    db $FF                                                               ;93BEDA;
    dw $2C31,$01F5                                                       ;93BEDB;
    db $07                                                               ;93BEDF;
    dw $2C32,$01ED                                                       ;93BEE0;
    db $07                                                               ;93BEE4;
    dw $2C31                                                             ;93BEE5;

ProjectileFlareSpritemaps_Charged_PW_PIW_E:
    dw $000C,$0015                                                       ;93BEE7;
    db $F8                                                               ;93BEEB;
    dw $2C32,$000D                                                       ;93BEEC;
    db $F8                                                               ;93BEF0;
    dw $2C31,$0005                                                       ;93BEF1;
    db $E8                                                               ;93BEF5;
    dw $2C32,$01FD                                                       ;93BEF6;
    db $E8                                                               ;93BEFA;
    dw $2C31,$000D                                                       ;93BEFB;
    db $F0                                                               ;93BEFF;
    dw $2C32,$0005                                                       ;93BF00;
    db $F0                                                               ;93BF04;
    dw $2C31,$01FC                                                       ;93BF05;
    db $10                                                               ;93BF09;
    dw $2C32,$01F4                                                       ;93BF0A;
    db $10                                                               ;93BF0E;
    dw $2C31,$01EC                                                       ;93BF0F;
    db $00                                                               ;93BF13;
    dw $2C32,$01E4                                                       ;93BF14;
    db $00                                                               ;93BF18;
    dw $2C31,$01F4                                                       ;93BF19;
    db $08                                                               ;93BF1D;
    dw $2C32,$01EC                                                       ;93BF1E;
    db $08                                                               ;93BF22;
    dw $2C31                                                             ;93BF23;

ProjectileFlareSpritemaps_Charged_PW_PIW_F:
    dw $000A,$01F0                                                       ;93BF25;
    db $EC                                                               ;93BF29;
    dw $2C32,$01E8                                                       ;93BF2A;
    db $EC                                                               ;93BF2E;
    dw $2C31,$0010                                                       ;93BF2F;
    db $0C                                                               ;93BF33;
    dw $2C32,$0008                                                       ;93BF34;
    db $0C                                                               ;93BF38;
    dw $2C31,$0008                                                       ;93BF39;
    db $04                                                               ;93BF3D;
    dw $2C32,$0000                                                       ;93BF3E;
    db $04                                                               ;93BF42;
    dw $2C31,$01F8                                                       ;93BF43;
    db $F4                                                               ;93BF47;
    dw $2C32,$01F0                                                       ;93BF48;
    db $F4                                                               ;93BF4C;
    dw $2C31,$0000                                                       ;93BF4D;
    db $FC                                                               ;93BF51;
    dw $2C32,$01F8                                                       ;93BF52;
    db $FC                                                               ;93BF56;
    dw $2C31                                                             ;93BF57;

ProjectileFlareSpritemaps_Charged_PW_PIW_10:
    dw $0014,$01F7                                                       ;93BF59;
    db $E6                                                               ;93BF5D;
    dw $2C32,$01EF                                                       ;93BF5E;
    db $E6                                                               ;93BF62;
    dw $2C31,$01EA                                                       ;93BF63;
    db $F2                                                               ;93BF67;
    dw $2C32,$01E2                                                       ;93BF68;
    db $F2                                                               ;93BF6C;
    dw $2C31,$000A                                                       ;93BF6D;
    db $12                                                               ;93BF71;
    dw $2C32,$0002                                                       ;93BF72;
    db $12                                                               ;93BF76;
    dw $2C31,$0017                                                       ;93BF77;
    db $06                                                               ;93BF7B;
    dw $2C32,$000F                                                       ;93BF7C;
    db $06                                                               ;93BF80;
    dw $2C31,$000F                                                       ;93BF81;
    db $FE                                                               ;93BF85;
    dw $2C32,$0007                                                       ;93BF86;
    db $FE                                                               ;93BF8A;
    dw $2C31,$01FF                                                       ;93BF8B;
    db $EE                                                               ;93BF8F;
    dw $2C32,$01F7                                                       ;93BF90;
    db $EE                                                               ;93BF94;
    dw $2C31,$0007                                                       ;93BF95;
    db $F6                                                               ;93BF99;
    dw $2C32,$01FF                                                       ;93BF9A;
    db $F6                                                               ;93BF9E;
    dw $2C31,$0002                                                       ;93BF9F;
    db $0A                                                               ;93BFA3;
    dw $2C32,$01FA                                                       ;93BFA4;
    db $0A                                                               ;93BFA8;
    dw $2C31,$01F2                                                       ;93BFA9;
    db $FA                                                               ;93BFAD;
    dw $2C32,$01EA                                                       ;93BFAE;
    db $FA                                                               ;93BFB2;
    dw $2C31,$01FA                                                       ;93BFB3;
    db $02                                                               ;93BFB7;
    dw $2C32,$01F2                                                       ;93BFB8;
    db $02                                                               ;93BFBC;
    dw $2C31                                                             ;93BFBD;

ProjectileFlareSpritemaps_Charged_PW_PIW_11:
    dw $0014,$01FA                                                       ;93BFBF;
    db $E3                                                               ;93BFC3;
    dw $2C32,$01F2                                                       ;93BFC4;
    db $E3                                                               ;93BFC8;
    dw $2C31,$001A                                                       ;93BFC9;
    db $03                                                               ;93BFCD;
    dw $2C32,$0012                                                       ;93BFCE;
    db $03                                                               ;93BFD2;
    dw $2C31,$01E7                                                       ;93BFD3;
    db $F5                                                               ;93BFD7;
    dw $2C32,$01DF                                                       ;93BFD8;
    db $F5                                                               ;93BFDC;
    dw $2C31,$0007                                                       ;93BFDD;
    db $15                                                               ;93BFE1;
    dw $2C32,$01FF                                                       ;93BFE2;
    db $15                                                               ;93BFE6;
    dw $2C31,$0012                                                       ;93BFE7;
    db $FB                                                               ;93BFEB;
    dw $2C32,$000A                                                       ;93BFEC;
    db $FB                                                               ;93BFF0;
    dw $2C31,$0002                                                       ;93BFF1;
    db $EB                                                               ;93BFF5;
    dw $2C32,$01FA                                                       ;93BFF6;
    db $EB                                                               ;93BFFA;
    dw $2C31,$000A                                                       ;93BFFB;
    db $F3                                                               ;93BFFF;
    dw $2C32,$0002                                                       ;93C000;
    db $F3                                                               ;93C004;
    dw $2C31,$01FF                                                       ;93C005;
    db $0D                                                               ;93C009;
    dw $2C32,$01F7                                                       ;93C00A;
    db $0D                                                               ;93C00E;
    dw $2C31,$01EF                                                       ;93C00F;
    db $FD                                                               ;93C013;
    dw $2C32,$01E7                                                       ;93C014;
    db $FD                                                               ;93C018;
    dw $2C31,$01F7                                                       ;93C019;
    db $05                                                               ;93C01D;
    dw $2C32,$01EF                                                       ;93C01E;
    db $05                                                               ;93C022;
    dw $2C31                                                             ;93C023;

ProjectileFlareSpritemaps_Charged_PW_PIW_12:
    dw $0014,$01E5                                                       ;93C025;
    db $F7                                                               ;93C029;
    dw $2C32,$01DD                                                       ;93C02A;
    db $F7                                                               ;93C02E;
    dw $2C31,$01FC                                                       ;93C02F;
    db $E1                                                               ;93C033;
    dw $2C32,$01F4                                                       ;93C034;
    db $E1                                                               ;93C038;
    dw $2C31,$0005                                                       ;93C039;
    db $17                                                               ;93C03D;
    dw $2C32,$01FD                                                       ;93C03E;
    db $17                                                               ;93C042;
    dw $2C31,$001B                                                       ;93C043;
    db $00                                                               ;93C047;
    dw $2C32,$0013                                                       ;93C048;
    db $00                                                               ;93C04C;
    dw $2C31,$0014                                                       ;93C04D;
    db $F9                                                               ;93C051;
    dw $2C32,$000C                                                       ;93C052;
    db $F9                                                               ;93C056;
    dw $2C31,$0004                                                       ;93C057;
    db $E9                                                               ;93C05B;
    dw $2C32,$01FC                                                       ;93C05C;
    db $E9                                                               ;93C060;
    dw $2C31,$000C                                                       ;93C061;
    db $F1                                                               ;93C065;
    dw $2C32,$0004                                                       ;93C066;
    db $F1                                                               ;93C06A;
    dw $2C31,$01FD                                                       ;93C06B;
    db $0F                                                               ;93C06F;
    dw $2C32,$01F5                                                       ;93C070;
    db $0F                                                               ;93C074;
    dw $2C31,$01ED                                                       ;93C075;
    db $FF                                                               ;93C079;
    dw $2C32,$01E5                                                       ;93C07A;
    db $FF                                                               ;93C07E;
    dw $2C31,$01F5                                                       ;93C07F;
    db $07                                                               ;93C083;
    dw $2C32,$01ED                                                       ;93C084;
    db $07                                                               ;93C088;
    dw $2C31                                                             ;93C089;

ProjectileFlareSpritemaps_Charged_PW_PIW_13:
    dw $0014,$01E4                                                       ;93C08B;
    db $F8                                                               ;93C08F;
    dw $2C32,$01DC                                                       ;93C090;
    db $F8                                                               ;93C094;
    dw $2C31,$01FD                                                       ;93C095;
    db $E0                                                               ;93C099;
    dw $2C32,$01F5                                                       ;93C09A;
    db $E0                                                               ;93C09E;
    dw $2C31,$0004                                                       ;93C09F;
    db $18                                                               ;93C0A3;
    dw $2C32,$01FC                                                       ;93C0A4;
    db $18                                                               ;93C0A8;
    dw $2C31,$001D                                                       ;93C0A9;
    db $00                                                               ;93C0AD;
    dw $2C32,$0015                                                       ;93C0AE;
    db $00                                                               ;93C0B2;
    dw $2C31,$0015                                                       ;93C0B3;
    db $F8                                                               ;93C0B7;
    dw $2C32,$000D                                                       ;93C0B8;
    db $F8                                                               ;93C0BC;
    dw $2C31,$0005                                                       ;93C0BD;
    db $E8                                                               ;93C0C1;
    dw $2C32,$01FD                                                       ;93C0C2;
    db $E8                                                               ;93C0C6;
    dw $2C31,$000D                                                       ;93C0C7;
    db $F0                                                               ;93C0CB;
    dw $2C32,$0005                                                       ;93C0CC;
    db $F0                                                               ;93C0D0;
    dw $2C31,$01FC                                                       ;93C0D1;
    db $10                                                               ;93C0D5;
    dw $2C32,$01F4                                                       ;93C0D6;
    db $10                                                               ;93C0DA;
    dw $2C31,$01EC                                                       ;93C0DB;
    db $00                                                               ;93C0DF;
    dw $2C32,$01E4                                                       ;93C0E0;
    db $00                                                               ;93C0E4;
    dw $2C31,$01F4                                                       ;93C0E5;
    db $08                                                               ;93C0E9;
    dw $2C32,$01EC                                                       ;93C0EA;
    db $08                                                               ;93C0EE;
    dw $2C31                                                             ;93C0EF;

ProjectileFlareSpritemaps_Charged_PW_PIW_14:
    dw $0004,$01FC                                                       ;93C0F1;
    db $08                                                               ;93C0F5;
    dw $2C33,$01FC                                                       ;93C0F6;
    db $00                                                               ;93C0FA;
    dw $2C33,$01FC                                                       ;93C0FB;
    db $F0                                                               ;93C0FF;
    dw $2C33,$01FC                                                       ;93C100;
    db $F8                                                               ;93C104;
    dw $2C33                                                             ;93C105;

ProjectileFlareSpritemaps_Charged_PW_PIW_15:
    dw $0008,$0004                                                       ;93C107;
    db $08                                                               ;93C10B;
    dw $2C33,$0004                                                       ;93C10C;
    db $00                                                               ;93C110;
    dw $2C33,$0004                                                       ;93C111;
    db $F0                                                               ;93C115;
    dw $2C33,$0004                                                       ;93C116;
    db $F8                                                               ;93C11A;
    dw $2C33,$01F5                                                       ;93C11B;
    db $08                                                               ;93C11F;
    dw $2C33,$01F5                                                       ;93C120;
    db $00                                                               ;93C124;
    dw $2C33,$01F5                                                       ;93C125;
    db $F0                                                               ;93C129;
    dw $2C33,$01F5                                                       ;93C12A;
    db $F8                                                               ;93C12E;
    dw $2C33                                                             ;93C12F;

ProjectileFlareSpritemaps_Charged_PW_PIW_16:
    dw $0008,$0009                                                       ;93C131;
    db $08                                                               ;93C135;
    dw $2C33,$0009                                                       ;93C136;
    db $00                                                               ;93C13A;
    dw $2C33,$0009                                                       ;93C13B;
    db $F0                                                               ;93C13F;
    dw $2C33,$0009                                                       ;93C140;
    db $F8                                                               ;93C144;
    dw $2C33,$01EF                                                       ;93C145;
    db $08                                                               ;93C149;
    dw $2C33,$01EF                                                       ;93C14A;
    db $00                                                               ;93C14E;
    dw $2C33,$01EF                                                       ;93C14F;
    db $F0                                                               ;93C153;
    dw $2C33,$01EF                                                       ;93C154;
    db $F8                                                               ;93C158;
    dw $2C33                                                             ;93C159;

ProjectileFlareSpritemaps_Charged_PW_PIW_17:
    dw $0008,$000B                                                       ;93C15B;
    db $08                                                               ;93C15F;
    dw $2C33,$000B                                                       ;93C160;
    db $00                                                               ;93C164;
    dw $2C33,$000B                                                       ;93C165;
    db $F0                                                               ;93C169;
    dw $2C33,$000B                                                       ;93C16A;
    db $F8                                                               ;93C16E;
    dw $2C33,$01EE                                                       ;93C16F;
    db $08                                                               ;93C173;
    dw $2C33,$01EE                                                       ;93C174;
    db $00                                                               ;93C178;
    dw $2C33,$01EE                                                       ;93C179;
    db $F0                                                               ;93C17D;
    dw $2C33,$01EE                                                       ;93C17E;
    db $F8                                                               ;93C182;
    dw $2C33                                                             ;93C183;

ProjectileFlareSpritemaps_Charged_PW_PIW_18:
    dw $0008,$000C                                                       ;93C185;
    db $08                                                               ;93C189;
    dw $2C33,$000C                                                       ;93C18A;
    db $00                                                               ;93C18E;
    dw $2C33,$000C                                                       ;93C18F;
    db $F0                                                               ;93C193;
    dw $2C33,$000C                                                       ;93C194;
    db $F8                                                               ;93C198;
    dw $2C33,$01ED                                                       ;93C199;
    db $08                                                               ;93C19D;
    dw $2C33,$01ED                                                       ;93C19E;
    db $00                                                               ;93C1A2;
    dw $2C33,$01ED                                                       ;93C1A3;
    db $F0                                                               ;93C1A7;
    dw $2C33,$01ED                                                       ;93C1A8;
    db $F8                                                               ;93C1AC;
    dw $2C33                                                             ;93C1AD;

ProjectileFlareSpritemaps_Charged_PW_PIW_19:
    dw $0007,$01FC                                                       ;93C1AF;
    db $14                                                               ;93C1B3;
    dw $2C33,$01FC                                                       ;93C1B4;
    db $0C                                                               ;93C1B8;
    dw $2C33,$01FC                                                       ;93C1B9;
    db $E4                                                               ;93C1BD;
    dw $2C33,$01FC                                                       ;93C1BE;
    db $04                                                               ;93C1C2;
    dw $2C33,$01FC                                                       ;93C1C3;
    db $FC                                                               ;93C1C7;
    dw $2C33,$01FC                                                       ;93C1C8;
    db $EC                                                               ;93C1CC;
    dw $2C33,$01FC                                                       ;93C1CD;
    db $F4                                                               ;93C1D1;
    dw $2C33                                                             ;93C1D2;

ProjectileFlareSpritemaps_Charged_PW_PIW_1A:
    dw $000E,$0004                                                       ;93C1D4;
    db $14                                                               ;93C1D8;
    dw $2C33,$0004                                                       ;93C1D9;
    db $0C                                                               ;93C1DD;
    dw $2C33,$01F5                                                       ;93C1DE;
    db $14                                                               ;93C1E2;
    dw $2C33,$01F5                                                       ;93C1E3;
    db $0C                                                               ;93C1E7;
    dw $2C33,$01F5                                                       ;93C1E8;
    db $E4                                                               ;93C1EC;
    dw $2C33,$0004                                                       ;93C1ED;
    db $E4                                                               ;93C1F1;
    dw $2C33,$0004                                                       ;93C1F2;
    db $04                                                               ;93C1F6;
    dw $2C33,$0004                                                       ;93C1F7;
    db $FC                                                               ;93C1FB;
    dw $2C33,$0004                                                       ;93C1FC;
    db $EC                                                               ;93C200;
    dw $2C33,$0004                                                       ;93C201;
    db $F4                                                               ;93C205;
    dw $2C33,$01F5                                                       ;93C206;
    db $04                                                               ;93C20A;
    dw $2C33,$01F5                                                       ;93C20B;
    db $FC                                                               ;93C20F;
    dw $2C33,$01F5                                                       ;93C210;
    db $EC                                                               ;93C214;
    dw $2C33,$01F5                                                       ;93C215;
    db $F4                                                               ;93C219;
    dw $2C33                                                             ;93C21A;

ProjectileFlareSpritemaps_Charged_PW_PIW_1B:
    dw $000E,$01EF                                                       ;93C21C;
    db $14                                                               ;93C220;
    dw $2C33,$01EF                                                       ;93C221;
    db $0C                                                               ;93C225;
    dw $2C33,$0009                                                       ;93C226;
    db $14                                                               ;93C22A;
    dw $2C33,$0009                                                       ;93C22B;
    db $0C                                                               ;93C22F;
    dw $2C33,$0009                                                       ;93C230;
    db $E4                                                               ;93C234;
    dw $2C33,$01EF                                                       ;93C235;
    db $E4                                                               ;93C239;
    dw $2C33,$0009                                                       ;93C23A;
    db $04                                                               ;93C23E;
    dw $2C33,$0009                                                       ;93C23F;
    db $FC                                                               ;93C243;
    dw $2C33,$0009                                                       ;93C244;
    db $EC                                                               ;93C248;
    dw $2C33,$0009                                                       ;93C249;
    db $F4                                                               ;93C24D;
    dw $2C33,$01EF                                                       ;93C24E;
    db $04                                                               ;93C252;
    dw $2C33,$01EF                                                       ;93C253;
    db $FC                                                               ;93C257;
    dw $2C33,$01EF                                                       ;93C258;
    db $EC                                                               ;93C25C;
    dw $2C33,$01EF                                                       ;93C25D;
    db $F4                                                               ;93C261;
    dw $2C33                                                             ;93C262;

ProjectileFlareSpritemaps_Charged_PW_PIW_1C:
    dw $000E,$01EE                                                       ;93C264;
    db $14                                                               ;93C268;
    dw $2C33,$01EE                                                       ;93C269;
    db $0C                                                               ;93C26D;
    dw $2C33,$000B                                                       ;93C26E;
    db $14                                                               ;93C272;
    dw $2C33,$000B                                                       ;93C273;
    db $0C                                                               ;93C277;
    dw $2C33,$000B                                                       ;93C278;
    db $E4                                                               ;93C27C;
    dw $2C33,$01EE                                                       ;93C27D;
    db $E4                                                               ;93C281;
    dw $2C33,$000B                                                       ;93C282;
    db $04                                                               ;93C286;
    dw $2C33,$000B                                                       ;93C287;
    db $FC                                                               ;93C28B;
    dw $2C33,$000B                                                       ;93C28C;
    db $EC                                                               ;93C290;
    dw $2C33,$000B                                                       ;93C291;
    db $F4                                                               ;93C295;
    dw $2C33,$01EE                                                       ;93C296;
    db $04                                                               ;93C29A;
    dw $2C33,$01EE                                                       ;93C29B;
    db $FC                                                               ;93C29F;
    dw $2C33,$01EE                                                       ;93C2A0;
    db $EC                                                               ;93C2A4;
    dw $2C33,$01EE                                                       ;93C2A5;
    db $F4                                                               ;93C2A9;
    dw $2C33                                                             ;93C2AA;

ProjectileFlareSpritemaps_Charged_PW_PIW_1D:
    dw $000E,$01ED                                                       ;93C2AC;
    db $14                                                               ;93C2B0;
    dw $2C33,$01ED                                                       ;93C2B1;
    db $0C                                                               ;93C2B5;
    dw $2C33,$000C                                                       ;93C2B6;
    db $14                                                               ;93C2BA;
    dw $2C33,$000C                                                       ;93C2BB;
    db $0C                                                               ;93C2BF;
    dw $2C33,$000C                                                       ;93C2C0;
    db $E4                                                               ;93C2C4;
    dw $2C33,$01ED                                                       ;93C2C5;
    db $E4                                                               ;93C2C9;
    dw $2C33,$000C                                                       ;93C2CA;
    db $04                                                               ;93C2CE;
    dw $2C33,$000C                                                       ;93C2CF;
    db $FC                                                               ;93C2D3;
    dw $2C33,$000C                                                       ;93C2D4;
    db $EC                                                               ;93C2D8;
    dw $2C33,$000C                                                       ;93C2D9;
    db $F4                                                               ;93C2DD;
    dw $2C33,$01ED                                                       ;93C2DE;
    db $04                                                               ;93C2E2;
    dw $2C33,$01ED                                                       ;93C2E3;
    db $FC                                                               ;93C2E7;
    dw $2C33,$01ED                                                       ;93C2E8;
    db $EC                                                               ;93C2EC;
    dw $2C33,$01ED                                                       ;93C2ED;
    db $F4                                                               ;93C2F1;
    dw $2C33                                                             ;93C2F2;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C2F4:
    dw $0004,$0008                                                       ;93C2F4;
    db $FC                                                               ;93C2F8;
    dw $2C34,$0000                                                       ;93C2F9;
    db $FC                                                               ;93C2FD;
    dw $2C34,$01F8                                                       ;93C2FE;
    db $FC                                                               ;93C302;
    dw $2C34,$01F0                                                       ;93C303;
    db $FC                                                               ;93C307;
    dw $2C34                                                             ;93C308;

UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C30A:
    dw $0008,$0008                                                       ;93C30A;
    db $04                                                               ;93C30E;
    dw $2C34,$0000                                                       ;93C30F;
    db $04                                                               ;93C313;
    dw $2C34,$01F8                                                       ;93C314;
    db $04                                                               ;93C318;
    dw $2C34,$01F0                                                       ;93C319;
    db $04                                                               ;93C31D;
    dw $2C34,$0008                                                       ;93C31E;
    db $F4                                                               ;93C322;
    dw $2C34,$0000                                                       ;93C323;
    db $F4                                                               ;93C327;
    dw $2C34,$01F8                                                       ;93C328;
    db $F4                                                               ;93C32C;
    dw $2C34,$01F0                                                       ;93C32D;
    db $F4                                                               ;93C331;
    dw $2C34                                                             ;93C332;

UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C334:
    dw $0008,$0008                                                       ;93C334;
    db $09                                                               ;93C338;
    dw $2C34,$0000                                                       ;93C339;
    db $09                                                               ;93C33D;
    dw $2C34,$01F8                                                       ;93C33E;
    db $09                                                               ;93C342;
    dw $2C34,$01F0                                                       ;93C343;
    db $09                                                               ;93C347;
    dw $2C34,$0008                                                       ;93C348;
    db $EF                                                               ;93C34C;
    dw $2C34,$0000                                                       ;93C34D;
    db $EF                                                               ;93C351;
    dw $2C34,$01F8                                                       ;93C352;
    db $EF                                                               ;93C356;
    dw $2C34,$01F0                                                       ;93C357;
    db $EF                                                               ;93C35B;
    dw $2C34                                                             ;93C35C;

UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C35E:
    dw $0008,$0008                                                       ;93C35E;
    db $0B                                                               ;93C362;
    dw $2C34,$0000                                                       ;93C363;
    db $0B                                                               ;93C367;
    dw $2C34,$01F8                                                       ;93C368;
    db $0B                                                               ;93C36C;
    dw $2C34,$01F0                                                       ;93C36D;
    db $0B                                                               ;93C371;
    dw $2C34,$0008                                                       ;93C372;
    db $ED                                                               ;93C376;
    dw $2C34,$0000                                                       ;93C377;
    db $ED                                                               ;93C37B;
    dw $2C34,$01F8                                                       ;93C37C;
    db $ED                                                               ;93C380;
    dw $2C34,$01F0                                                       ;93C381;
    db $ED                                                               ;93C385;
    dw $2C34                                                             ;93C386;

UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C388:
    dw $0008,$0008                                                       ;93C388;
    db $0C                                                               ;93C38C;
    dw $2C34,$0000                                                       ;93C38D;
    db $0C                                                               ;93C391;
    dw $2C34,$01F8                                                       ;93C392;
    db $0C                                                               ;93C396;
    dw $2C34,$01F0                                                       ;93C397;
    db $0C                                                               ;93C39B;
    dw $2C34,$0008                                                       ;93C39C;
    db $EC                                                               ;93C3A0;
    dw $2C34,$0000                                                       ;93C3A1;
    db $EC                                                               ;93C3A5;
    dw $2C34,$01F8                                                       ;93C3A6;
    db $EC                                                               ;93C3AA;
    dw $2C34,$01F0                                                       ;93C3AB;
    db $EC                                                               ;93C3AF;
    dw $2C34                                                             ;93C3B0;
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_PW_PIW_1E:
    dw $0007,$0014                                                       ;93C3B2;
    db $FC                                                               ;93C3B6;
    dw $2C34,$01E4                                                       ;93C3B7;
    db $FC                                                               ;93C3BB;
    dw $2C34,$000C                                                       ;93C3BC;
    db $FC                                                               ;93C3C0;
    dw $2C34,$0004                                                       ;93C3C1;
    db $FC                                                               ;93C3C5;
    dw $2C34,$01FC                                                       ;93C3C6;
    db $FC                                                               ;93C3CA;
    dw $2C34,$01F4                                                       ;93C3CB;
    db $FC                                                               ;93C3CF;
    dw $2C34,$01EC                                                       ;93C3D0;
    db $FC                                                               ;93C3D4;
    dw $2C34                                                             ;93C3D5;

ProjectileFlareSpritemaps_Charged_PW_PIW_1F:
    dw $000E,$0014                                                       ;93C3D7;
    db $04                                                               ;93C3DB;
    dw $2C34,$0014                                                       ;93C3DC;
    db $F4                                                               ;93C3E0;
    dw $2C34,$000C                                                       ;93C3E1;
    db $04                                                               ;93C3E5;
    dw $2C34,$01E4                                                       ;93C3E6;
    db $04                                                               ;93C3EA;
    dw $2C34,$01E4                                                       ;93C3EB;
    db $F4                                                               ;93C3EF;
    dw $2C34,$000C                                                       ;93C3F0;
    db $F4                                                               ;93C3F4;
    dw $2C34,$0004                                                       ;93C3F5;
    db $04                                                               ;93C3F9;
    dw $2C34,$01FC                                                       ;93C3FA;
    db $04                                                               ;93C3FE;
    dw $2C34,$01F4                                                       ;93C3FF;
    db $04                                                               ;93C403;
    dw $2C34,$01EC                                                       ;93C404;
    db $04                                                               ;93C408;
    dw $2C34,$0004                                                       ;93C409;
    db $F4                                                               ;93C40D;
    dw $2C34,$01FC                                                       ;93C40E;
    db $F4                                                               ;93C412;
    dw $2C34,$01F4                                                       ;93C413;
    db $F4                                                               ;93C417;
    dw $2C34,$01EC                                                       ;93C418;
    db $F4                                                               ;93C41C;
    dw $2C34                                                             ;93C41D;

ProjectileFlareSpritemaps_Charged_PW_PIW_20:
    dw $000E,$0014                                                       ;93C41F;
    db $09                                                               ;93C423;
    dw $2C34,$0014                                                       ;93C424;
    db $EF                                                               ;93C428;
    dw $2C34,$000C                                                       ;93C429;
    db $09                                                               ;93C42D;
    dw $2C34,$01E4                                                       ;93C42E;
    db $09                                                               ;93C432;
    dw $2C34,$01E4                                                       ;93C433;
    db $EF                                                               ;93C437;
    dw $2C34,$000C                                                       ;93C438;
    db $EF                                                               ;93C43C;
    dw $2C34,$0004                                                       ;93C43D;
    db $09                                                               ;93C441;
    dw $2C34,$01FC                                                       ;93C442;
    db $09                                                               ;93C446;
    dw $2C34,$01F4                                                       ;93C447;
    db $09                                                               ;93C44B;
    dw $2C34,$01EC                                                       ;93C44C;
    db $09                                                               ;93C450;
    dw $2C34,$0004                                                       ;93C451;
    db $EF                                                               ;93C455;
    dw $2C34,$01FC                                                       ;93C456;
    db $EF                                                               ;93C45A;
    dw $2C34,$01F4                                                       ;93C45B;
    db $EF                                                               ;93C45F;
    dw $2C34,$01EC                                                       ;93C460;
    db $EF                                                               ;93C464;
    dw $2C34                                                             ;93C465;

ProjectileFlareSpritemaps_Charged_PW_PIW_21:
    dw $000E,$0014                                                       ;93C467;
    db $0B                                                               ;93C46B;
    dw $2C34,$0014                                                       ;93C46C;
    db $ED                                                               ;93C470;
    dw $2C34,$000C                                                       ;93C471;
    db $0B                                                               ;93C475;
    dw $2C34,$01E4                                                       ;93C476;
    db $0B                                                               ;93C47A;
    dw $2C34,$01E4                                                       ;93C47B;
    db $ED                                                               ;93C47F;
    dw $2C34,$000C                                                       ;93C480;
    db $ED                                                               ;93C484;
    dw $2C34,$0004                                                       ;93C485;
    db $0B                                                               ;93C489;
    dw $2C34,$01FC                                                       ;93C48A;
    db $0B                                                               ;93C48E;
    dw $2C34,$01F4                                                       ;93C48F;
    db $0B                                                               ;93C493;
    dw $2C34,$01EC                                                       ;93C494;
    db $0B                                                               ;93C498;
    dw $2C34,$0004                                                       ;93C499;
    db $ED                                                               ;93C49D;
    dw $2C34,$01FC                                                       ;93C49E;
    db $ED                                                               ;93C4A2;
    dw $2C34,$01F4                                                       ;93C4A3;
    db $ED                                                               ;93C4A7;
    dw $2C34,$01EC                                                       ;93C4A8;
    db $ED                                                               ;93C4AC;
    dw $2C34                                                             ;93C4AD;

ProjectileFlareSpritemaps_Charged_PW_PIW_22:
    dw $000E,$0014                                                       ;93C4AF;
    db $0C                                                               ;93C4B3;
    dw $2C34,$0014                                                       ;93C4B4;
    db $EC                                                               ;93C4B8;
    dw $2C34,$000C                                                       ;93C4B9;
    db $0C                                                               ;93C4BD;
    dw $2C34,$01E4                                                       ;93C4BE;
    db $0C                                                               ;93C4C2;
    dw $2C34,$01E4                                                       ;93C4C3;
    db $EC                                                               ;93C4C7;
    dw $2C34,$000C                                                       ;93C4C8;
    db $EC                                                               ;93C4CC;
    dw $2C34,$0004                                                       ;93C4CD;
    db $0C                                                               ;93C4D1;
    dw $2C34,$01FC                                                       ;93C4D2;
    db $0C                                                               ;93C4D6;
    dw $2C34,$01F4                                                       ;93C4D7;
    db $0C                                                               ;93C4DB;
    dw $2C34,$01EC                                                       ;93C4DC;
    db $0C                                                               ;93C4E0;
    dw $2C34,$0004                                                       ;93C4E1;
    db $EC                                                               ;93C4E5;
    dw $2C34,$01FC                                                       ;93C4E6;
    db $EC                                                               ;93C4EA;
    dw $2C34,$01F4                                                       ;93C4EB;
    db $EC                                                               ;93C4EF;
    dw $2C34,$01EC                                                       ;93C4F0;
    db $EC                                                               ;93C4F4;
    dw $2C34                                                             ;93C4F5;

UNSUED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C4F7:
    dw $0008,$0008                                                       ;93C4F7;
    db $0C                                                               ;93C4FB;
    dw $EC36,$01F0                                                       ;93C4FC;
    db $EC                                                               ;93C500;
    dw $2C36,$0008                                                       ;93C501;
    db $04                                                               ;93C505;
    dw $EC35,$0000                                                       ;93C506;
    db $FC                                                               ;93C50A;
    dw $EC35,$01F8                                                       ;93C50B;
    db $F4                                                               ;93C50F;
    dw $EC35,$0000                                                       ;93C510;
    db $04                                                               ;93C514;
    dw $2C35,$01F0                                                       ;93C515;
    db $F4                                                               ;93C519;
    dw $2C35,$01F8                                                       ;93C51A;
    db $FC                                                               ;93C51E;
    dw $2C35                                                             ;93C51F;

UNSUED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C521:
    dw $0010,$000F                                                       ;93C521;
    db $06                                                               ;93C525;
    dw $EC36,$0002                                                       ;93C526;
    db $12                                                               ;93C52A;
    dw $EC36,$01F7                                                       ;93C52B;
    db $E6                                                               ;93C52F;
    dw $2C36,$01EA                                                       ;93C530;
    db $F2                                                               ;93C534;
    dw $2C36,$01FF                                                       ;93C535;
    db $EE                                                               ;93C539;
    dw $EC35,$0007                                                       ;93C53A;
    db $F6                                                               ;93C53E;
    dw $EC35,$000F                                                       ;93C53F;
    db $FE                                                               ;93C543;
    dw $EC35,$0002                                                       ;93C544;
    db $0A                                                               ;93C548;
    dw $EC35,$01FA                                                       ;93C549;
    db $02                                                               ;93C54D;
    dw $EC35,$01F2                                                       ;93C54E;
    db $FA                                                               ;93C552;
    dw $EC35,$0007                                                       ;93C553;
    db $FE                                                               ;93C557;
    dw $2C35,$01F7                                                       ;93C558;
    db $EE                                                               ;93C55C;
    dw $2C35,$01FF                                                       ;93C55D;
    db $F6                                                               ;93C561;
    dw $2C35,$01FA                                                       ;93C562;
    db $0A                                                               ;93C566;
    dw $2C35,$01EA                                                       ;93C567;
    db $FA                                                               ;93C56B;
    dw $2C35,$01F2                                                       ;93C56C;
    db $02                                                               ;93C570;
    dw $2C35                                                             ;93C571;

UNSUED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C573:
    dw $0010,$01FF                                                       ;93C573;
    db $15                                                               ;93C577;
    dw $EC36,$0012                                                       ;93C578;
    db $03                                                               ;93C57C;
    dw $EC36,$01E7                                                       ;93C57D;
    db $F5                                                               ;93C581;
    dw $2C36,$01FA                                                       ;93C582;
    db $E3                                                               ;93C586;
    dw $2C36,$0012                                                       ;93C587;
    db $FB                                                               ;93C58B;
    dw $EC35,$000A                                                       ;93C58C;
    db $F3                                                               ;93C590;
    dw $EC35,$0002                                                       ;93C591;
    db $EB                                                               ;93C595;
    dw $EC35,$01FF                                                       ;93C596;
    db $0D                                                               ;93C59A;
    dw $EC35,$01F7                                                       ;93C59B;
    db $05                                                               ;93C59F;
    dw $EC35,$01EF                                                       ;93C5A0;
    db $FD                                                               ;93C5A4;
    dw $EC35,$000A                                                       ;93C5A5;
    db $FB                                                               ;93C5A9;
    dw $2C35,$01FA                                                       ;93C5AA;
    db $EB                                                               ;93C5AE;
    dw $2C35,$0002                                                       ;93C5AF;
    db $F3                                                               ;93C5B3;
    dw $2C35,$01F7                                                       ;93C5B4;
    db $0D                                                               ;93C5B8;
    dw $2C35,$01E7                                                       ;93C5B9;
    db $FD                                                               ;93C5BD;
    dw $2C35,$01EF                                                       ;93C5BE;
    db $05                                                               ;93C5C2;
    dw $2C35                                                             ;93C5C3;

UNSUED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C5C5:
    dw $0010,$01FD                                                       ;93C5C5;
    db $17                                                               ;93C5C9;
    dw $EC36,$0014                                                       ;93C5CA;
    db $01                                                               ;93C5CE;
    dw $EC36,$01E5                                                       ;93C5CF;
    db $F7                                                               ;93C5D3;
    dw $2C36,$01FC                                                       ;93C5D4;
    db $E1                                                               ;93C5D8;
    dw $2C36,$0014                                                       ;93C5D9;
    db $F9                                                               ;93C5DD;
    dw $EC35,$000C                                                       ;93C5DE;
    db $F1                                                               ;93C5E2;
    dw $EC35,$0004                                                       ;93C5E3;
    db $E9                                                               ;93C5E7;
    dw $EC35,$01FD                                                       ;93C5E8;
    db $0F                                                               ;93C5EC;
    dw $EC35,$01F5                                                       ;93C5ED;
    db $07                                                               ;93C5F1;
    dw $EC35,$01ED                                                       ;93C5F2;
    db $FF                                                               ;93C5F6;
    dw $EC35,$000C                                                       ;93C5F7;
    db $F9                                                               ;93C5FB;
    dw $2C35,$01FC                                                       ;93C5FC;
    db $E9                                                               ;93C600;
    dw $2C35,$0004                                                       ;93C601;
    db $F1                                                               ;93C605;
    dw $2C35,$01F5                                                       ;93C606;
    db $0F                                                               ;93C60A;
    dw $2C35,$01E5                                                       ;93C60B;
    db $FF                                                               ;93C60F;
    dw $2C35,$01ED                                                       ;93C610;
    db $07                                                               ;93C614;
    dw $2C35                                                             ;93C615;

UNSUED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C617:
    dw $0010,$01FC                                                       ;93C617;
    db $18                                                               ;93C61B;
    dw $EC36,$0015                                                       ;93C61C;
    db $00                                                               ;93C620;
    dw $EC36,$01FD                                                       ;93C621;
    db $E0                                                               ;93C625;
    dw $2C36,$01E4                                                       ;93C626;
    db $F8                                                               ;93C62A;
    dw $2C36,$0015                                                       ;93C62B;
    db $F8                                                               ;93C62F;
    dw $EC35,$000D                                                       ;93C630;
    db $F0                                                               ;93C634;
    dw $EC35,$0005                                                       ;93C635;
    db $E8                                                               ;93C639;
    dw $EC35,$01FC                                                       ;93C63A;
    db $10                                                               ;93C63E;
    dw $EC35,$01F4                                                       ;93C63F;
    db $08                                                               ;93C643;
    dw $EC35,$01EC                                                       ;93C644;
    db $00                                                               ;93C648;
    dw $EC35,$000D                                                       ;93C649;
    db $F8                                                               ;93C64D;
    dw $2C35,$01FD                                                       ;93C64E;
    db $E8                                                               ;93C652;
    dw $2C35,$0005                                                       ;93C653;
    db $F0                                                               ;93C657;
    dw $2C35,$01F4                                                       ;93C658;
    db $10                                                               ;93C65C;
    dw $2C35,$01E4                                                       ;93C65D;
    db $00                                                               ;93C661;
    dw $2C35,$01EC                                                       ;93C662;
    db $08                                                               ;93C666;
    dw $2C35                                                             ;93C667;

ProjectileFlareSpritemaps_Charged_PW_PIW_23:
    dw $000C,$0010                                                       ;93C669;
    db $14                                                               ;93C66D;
    dw $EC36,$01E8                                                       ;93C66E;
    db $E4                                                               ;93C672;
    dw $2C36,$0010                                                       ;93C673;
    db $0C                                                               ;93C677;
    dw $EC35,$0008                                                       ;93C678;
    db $04                                                               ;93C67C;
    dw $EC35,$0000                                                       ;93C67D;
    db $FC                                                               ;93C681;
    dw $EC35,$01F8                                                       ;93C682;
    db $F4                                                               ;93C686;
    dw $EC35,$01F0                                                       ;93C687;
    db $EC                                                               ;93C68B;
    dw $EC35,$01E8                                                       ;93C68C;
    db $EC                                                               ;93C690;
    dw $2C35,$0008                                                       ;93C691;
    db $0C                                                               ;93C695;
    dw $2C35,$0000                                                       ;93C696;
    db $04                                                               ;93C69A;
    dw $2C35,$01F0                                                       ;93C69B;
    db $F4                                                               ;93C69F;
    dw $2C35,$01F8                                                       ;93C6A0;
    db $FC                                                               ;93C6A4;
    dw $2C35                                                             ;93C6A5;

ProjectileFlareSpritemaps_Charged_PW_PIW_24:
    dw $0018,$000A                                                       ;93C6A7;
    db $1A                                                               ;93C6AB;
    dw $EC36,$0017                                                       ;93C6AC;
    db $0E                                                               ;93C6B0;
    dw $EC36,$01E2                                                       ;93C6B1;
    db $EA                                                               ;93C6B5;
    dw $2C36,$01EF                                                       ;93C6B6;
    db $DE                                                               ;93C6BA;
    dw $2C36,$01F7                                                       ;93C6BB;
    db $E6                                                               ;93C6BF;
    dw $EC35,$01FF                                                       ;93C6C0;
    db $EE                                                               ;93C6C4;
    dw $EC35,$0007                                                       ;93C6C5;
    db $F6                                                               ;93C6C9;
    dw $EC35,$000F                                                       ;93C6CA;
    db $FE                                                               ;93C6CE;
    dw $EC35,$0017                                                       ;93C6CF;
    db $06                                                               ;93C6D3;
    dw $EC35,$000A                                                       ;93C6D4;
    db $12                                                               ;93C6D8;
    dw $EC35,$0002                                                       ;93C6D9;
    db $0A                                                               ;93C6DD;
    dw $EC35,$01FA                                                       ;93C6DE;
    db $02                                                               ;93C6E2;
    dw $EC35,$01F2                                                       ;93C6E3;
    db $FA                                                               ;93C6E7;
    dw $EC35,$01EA                                                       ;93C6E8;
    db $F2                                                               ;93C6EC;
    dw $EC35,$01EF                                                       ;93C6ED;
    db $E6                                                               ;93C6F1;
    dw $2C35,$01E2                                                       ;93C6F2;
    db $F2                                                               ;93C6F6;
    dw $2C35,$0002                                                       ;93C6F7;
    db $12                                                               ;93C6FB;
    dw $2C35,$000F                                                       ;93C6FC;
    db $06                                                               ;93C700;
    dw $2C35,$0007                                                       ;93C701;
    db $FE                                                               ;93C705;
    dw $2C35,$01F7                                                       ;93C706;
    db $EE                                                               ;93C70A;
    dw $2C35,$01FF                                                       ;93C70B;
    db $F6                                                               ;93C70F;
    dw $2C35,$01FA                                                       ;93C710;
    db $0A                                                               ;93C714;
    dw $2C35,$01EA                                                       ;93C715;
    db $FA                                                               ;93C719;
    dw $2C35,$01F2                                                       ;93C71A;
    db $02                                                               ;93C71E;
    dw $2C35                                                             ;93C71F;

ProjectileFlareSpritemaps_Charged_PW_PIW_25:
    dw $0018,$01DF                                                       ;93C721;
    db $ED                                                               ;93C725;
    dw $2C36,$01F2                                                       ;93C726;
    db $DB                                                               ;93C72A;
    dw $2C36,$0007                                                       ;93C72B;
    db $1D                                                               ;93C72F;
    dw $EC36,$001A                                                       ;93C730;
    db $0B                                                               ;93C734;
    dw $EC36,$01FA                                                       ;93C735;
    db $E3                                                               ;93C739;
    dw $EC35,$0002                                                       ;93C73A;
    db $EB                                                               ;93C73E;
    dw $EC35,$000A                                                       ;93C73F;
    db $F3                                                               ;93C743;
    dw $EC35,$0012                                                       ;93C744;
    db $FB                                                               ;93C748;
    dw $EC35,$001A                                                       ;93C749;
    db $03                                                               ;93C74D;
    dw $EC35,$0007                                                       ;93C74E;
    db $15                                                               ;93C752;
    dw $EC35,$01FF                                                       ;93C753;
    db $0D                                                               ;93C757;
    dw $EC35,$01F7                                                       ;93C758;
    db $05                                                               ;93C75C;
    dw $EC35,$01EF                                                       ;93C75D;
    db $FD                                                               ;93C761;
    dw $EC35,$01E7                                                       ;93C762;
    db $F5                                                               ;93C766;
    dw $EC35,$01F2                                                       ;93C767;
    db $E3                                                               ;93C76B;
    dw $2C35,$0012                                                       ;93C76C;
    db $03                                                               ;93C770;
    dw $2C35,$01DF                                                       ;93C771;
    db $F5                                                               ;93C775;
    dw $2C35,$01FF                                                       ;93C776;
    db $15                                                               ;93C77A;
    dw $2C35,$000A                                                       ;93C77B;
    db $FB                                                               ;93C77F;
    dw $2C35,$01FA                                                       ;93C780;
    db $EB                                                               ;93C784;
    dw $2C35,$0002                                                       ;93C785;
    db $F3                                                               ;93C789;
    dw $2C35,$01F7                                                       ;93C78A;
    db $0D                                                               ;93C78E;
    dw $2C35,$01E7                                                       ;93C78F;
    db $FD                                                               ;93C793;
    dw $2C35,$01EF                                                       ;93C794;
    db $05                                                               ;93C798;
    dw $2C35                                                             ;93C799;

ProjectileFlareSpritemaps_Charged_PW_PIW_26:
    dw $0018,$01DD                                                       ;93C79B;
    db $EF                                                               ;93C79F;
    dw $2C36,$01F4                                                       ;93C7A0;
    db $D9                                                               ;93C7A4;
    dw $2C36,$0005                                                       ;93C7A5;
    db $1F                                                               ;93C7A9;
    dw $EC36,$001B                                                       ;93C7AA;
    db $08                                                               ;93C7AE;
    dw $EC36,$01FC                                                       ;93C7AF;
    db $E1                                                               ;93C7B3;
    dw $EC35,$0004                                                       ;93C7B4;
    db $E9                                                               ;93C7B8;
    dw $EC35,$000C                                                       ;93C7B9;
    db $F1                                                               ;93C7BD;
    dw $EC35,$0014                                                       ;93C7BE;
    db $F9                                                               ;93C7C2;
    dw $EC35,$001B                                                       ;93C7C3;
    db $00                                                               ;93C7C7;
    dw $EC35,$0005                                                       ;93C7C8;
    db $17                                                               ;93C7CC;
    dw $EC35,$01FD                                                       ;93C7CD;
    db $0F                                                               ;93C7D1;
    dw $EC35,$01F5                                                       ;93C7D2;
    db $07                                                               ;93C7D6;
    dw $EC35,$01ED                                                       ;93C7D7;
    db $FF                                                               ;93C7DB;
    dw $EC35,$01E5                                                       ;93C7DC;
    db $F7                                                               ;93C7E0;
    dw $EC35,$01DD                                                       ;93C7E1;
    db $F7                                                               ;93C7E5;
    dw $2C35,$01F4                                                       ;93C7E6;
    db $E1                                                               ;93C7EA;
    dw $2C35,$01FD                                                       ;93C7EB;
    db $17                                                               ;93C7EF;
    dw $2C35,$0013                                                       ;93C7F0;
    db $00                                                               ;93C7F4;
    dw $2C35,$000C                                                       ;93C7F5;
    db $F9                                                               ;93C7F9;
    dw $2C35,$01FC                                                       ;93C7FA;
    db $E9                                                               ;93C7FE;
    dw $2C35,$0004                                                       ;93C7FF;
    db $F1                                                               ;93C803;
    dw $2C35,$01F5                                                       ;93C804;
    db $0F                                                               ;93C808;
    dw $2C35,$01E5                                                       ;93C809;
    db $FF                                                               ;93C80D;
    dw $2C35,$01ED                                                       ;93C80E;
    db $07                                                               ;93C812;
    dw $2C35                                                             ;93C813;

ProjectileFlareSpritemaps_Charged_PW_PIW_27:
    dw $0018,$0004                                                       ;93C815;
    db $20                                                               ;93C819;
    dw $EC36,$001D                                                       ;93C81A;
    db $08                                                               ;93C81E;
    dw $EC36,$01DC                                                       ;93C81F;
    db $F0                                                               ;93C823;
    dw $2C36,$01F5                                                       ;93C824;
    db $D8                                                               ;93C828;
    dw $2C36,$01E4                                                       ;93C829;
    db $F8                                                               ;93C82D;
    dw $EC35,$01EC                                                       ;93C82E;
    db $00                                                               ;93C832;
    dw $EC35,$01F4                                                       ;93C833;
    db $08                                                               ;93C837;
    dw $EC35,$01FC                                                       ;93C838;
    db $10                                                               ;93C83C;
    dw $EC35,$0004                                                       ;93C83D;
    db $18                                                               ;93C841;
    dw $EC35,$001D                                                       ;93C842;
    db $00                                                               ;93C846;
    dw $EC35,$0015                                                       ;93C847;
    db $F8                                                               ;93C84B;
    dw $EC35,$000D                                                       ;93C84C;
    db $F0                                                               ;93C850;
    dw $EC35,$0005                                                       ;93C851;
    db $E8                                                               ;93C855;
    dw $EC35,$01FD                                                       ;93C856;
    db $E0                                                               ;93C85A;
    dw $EC35,$01DC                                                       ;93C85B;
    db $F8                                                               ;93C85F;
    dw $2C35,$01F5                                                       ;93C860;
    db $E0                                                               ;93C864;
    dw $2C35,$01FC                                                       ;93C865;
    db $18                                                               ;93C869;
    dw $2C35,$0015                                                       ;93C86A;
    db $00                                                               ;93C86E;
    dw $2C35,$000D                                                       ;93C86F;
    db $F8                                                               ;93C873;
    dw $2C35,$01FD                                                       ;93C874;
    db $E8                                                               ;93C878;
    dw $2C35,$0005                                                       ;93C879;
    db $F0                                                               ;93C87D;
    dw $2C35,$01F4                                                       ;93C87E;
    db $10                                                               ;93C882;
    dw $2C35,$01E4                                                       ;93C883;
    db $00                                                               ;93C887;
    dw $2C35,$01EC                                                       ;93C888;
    db $08                                                               ;93C88C;
    dw $2C35                                                             ;93C88D;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C88F:
    dw $0004,$01FC                                                       ;93C88F;
    db $08                                                               ;93C893;
    dw $2C37,$01FC                                                       ;93C894;
    db $00                                                               ;93C898;
    dw $2C37,$01FC                                                       ;93C899;
    db $F0                                                               ;93C89D;
    dw $2C37,$01FC                                                       ;93C89E;
    db $F8                                                               ;93C8A2;
    dw $2C37                                                             ;93C8A3;

UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C8A5:
    dw $0008,$0004                                                       ;93C8A5;
    db $08                                                               ;93C8A9;
    dw $2C37,$0004                                                       ;93C8AA;
    db $00                                                               ;93C8AE;
    dw $2C37,$0004                                                       ;93C8AF;
    db $F0                                                               ;93C8B3;
    dw $2C37,$0004                                                       ;93C8B4;
    db $F8                                                               ;93C8B8;
    dw $2C37,$01F5                                                       ;93C8B9;
    db $08                                                               ;93C8BD;
    dw $2C37,$01F5                                                       ;93C8BE;
    db $00                                                               ;93C8C2;
    dw $2C37,$01F5                                                       ;93C8C3;
    db $F0                                                               ;93C8C7;
    dw $2C37,$01F5                                                       ;93C8C8;
    db $F8                                                               ;93C8CC;
    dw $2C37                                                             ;93C8CD;

UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C8CF:
    dw $0008,$0009                                                       ;93C8CF;
    db $08                                                               ;93C8D3;
    dw $2C37,$0009                                                       ;93C8D4;
    db $00                                                               ;93C8D8;
    dw $2C37,$0009                                                       ;93C8D9;
    db $F0                                                               ;93C8DD;
    dw $2C37,$0009                                                       ;93C8DE;
    db $F8                                                               ;93C8E2;
    dw $2C37,$01EF                                                       ;93C8E3;
    db $08                                                               ;93C8E7;
    dw $2C37,$01EF                                                       ;93C8E8;
    db $00                                                               ;93C8EC;
    dw $2C37,$01EF                                                       ;93C8ED;
    db $F0                                                               ;93C8F1;
    dw $2C37,$01EF                                                       ;93C8F2;
    db $F8                                                               ;93C8F6;
    dw $2C37                                                             ;93C8F7;

UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C8F9:
    dw $0008,$000B                                                       ;93C8F9;
    db $08                                                               ;93C8FD;
    dw $2C37,$000B                                                       ;93C8FE;
    db $00                                                               ;93C902;
    dw $2C37,$000B                                                       ;93C903;
    db $F0                                                               ;93C907;
    dw $2C37,$000B                                                       ;93C908;
    db $F8                                                               ;93C90C;
    dw $2C37,$01EE                                                       ;93C90D;
    db $08                                                               ;93C911;
    dw $2C37,$01EE                                                       ;93C912;
    db $00                                                               ;93C916;
    dw $2C37,$01EE                                                       ;93C917;
    db $F0                                                               ;93C91B;
    dw $2C37,$01EE                                                       ;93C91C;
    db $F8                                                               ;93C920;
    dw $2C37                                                             ;93C921;

UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C923:
    dw $0008,$000C                                                       ;93C923;
    db $08                                                               ;93C927;
    dw $2C37,$000C                                                       ;93C928;
    db $00                                                               ;93C92C;
    dw $2C37,$000C                                                       ;93C92D;
    db $F0                                                               ;93C931;
    dw $2C37,$000C                                                       ;93C932;
    db $F8                                                               ;93C936;
    dw $2C37,$01ED                                                       ;93C937;
    db $08                                                               ;93C93B;
    dw $2C37,$01ED                                                       ;93C93C;
    db $00                                                               ;93C940;
    dw $2C37,$01ED                                                       ;93C941;
    db $F0                                                               ;93C945;
    dw $2C37,$01ED                                                       ;93C946;
    db $F8                                                               ;93C94A;
    dw $2C37                                                             ;93C94B;
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_PW_PIW_28:
    dw $0007,$01FC                                                       ;93C94D;
    db $14                                                               ;93C951;
    dw $2C37,$01FC                                                       ;93C952;
    db $0C                                                               ;93C956;
    dw $2C37,$01FC                                                       ;93C957;
    db $E4                                                               ;93C95B;
    dw $2C37,$01FC                                                       ;93C95C;
    db $04                                                               ;93C960;
    dw $2C37,$01FC                                                       ;93C961;
    db $FC                                                               ;93C965;
    dw $2C37,$01FC                                                       ;93C966;
    db $EC                                                               ;93C96A;
    dw $2C37,$01FC                                                       ;93C96B;
    db $F4                                                               ;93C96F;
    dw $2C37                                                             ;93C970;

ProjectileFlareSpritemaps_Charged_PW_PIW_29:
    dw $000E,$0004                                                       ;93C972;
    db $14                                                               ;93C976;
    dw $2C37,$0004                                                       ;93C977;
    db $0C                                                               ;93C97B;
    dw $2C37,$01F5                                                       ;93C97C;
    db $14                                                               ;93C980;
    dw $2C37,$01F5                                                       ;93C981;
    db $0C                                                               ;93C985;
    dw $2C37,$01F5                                                       ;93C986;
    db $E4                                                               ;93C98A;
    dw $2C37,$0004                                                       ;93C98B;
    db $E4                                                               ;93C98F;
    dw $2C37,$0004                                                       ;93C990;
    db $04                                                               ;93C994;
    dw $2C37,$0004                                                       ;93C995;
    db $FC                                                               ;93C999;
    dw $2C37,$0004                                                       ;93C99A;
    db $EC                                                               ;93C99E;
    dw $2C37,$0004                                                       ;93C99F;
    db $F4                                                               ;93C9A3;
    dw $2C37,$01F5                                                       ;93C9A4;
    db $04                                                               ;93C9A8;
    dw $2C37,$01F5                                                       ;93C9A9;
    db $FC                                                               ;93C9AD;
    dw $2C37,$01F5                                                       ;93C9AE;
    db $EC                                                               ;93C9B2;
    dw $2C37,$01F5                                                       ;93C9B3;
    db $F4                                                               ;93C9B7;
    dw $2C37                                                             ;93C9B8;

ProjectileFlareSpritemaps_Charged_PW_PIW_2A:
    dw $000E,$01EF                                                       ;93C9BA;
    db $14                                                               ;93C9BE;
    dw $2C37,$01EF                                                       ;93C9BF;
    db $0C                                                               ;93C9C3;
    dw $2C37,$0009                                                       ;93C9C4;
    db $14                                                               ;93C9C8;
    dw $2C37,$0009                                                       ;93C9C9;
    db $0C                                                               ;93C9CD;
    dw $2C37,$0009                                                       ;93C9CE;
    db $E4                                                               ;93C9D2;
    dw $2C37,$01EF                                                       ;93C9D3;
    db $E4                                                               ;93C9D7;
    dw $2C37,$0009                                                       ;93C9D8;
    db $04                                                               ;93C9DC;
    dw $2C37,$0009                                                       ;93C9DD;
    db $FC                                                               ;93C9E1;
    dw $2C37,$0009                                                       ;93C9E2;
    db $EC                                                               ;93C9E6;
    dw $2C37,$0009                                                       ;93C9E7;
    db $F4                                                               ;93C9EB;
    dw $2C37,$01EF                                                       ;93C9EC;
    db $04                                                               ;93C9F0;
    dw $2C37,$01EF                                                       ;93C9F1;
    db $FC                                                               ;93C9F5;
    dw $2C37,$01EF                                                       ;93C9F6;
    db $EC                                                               ;93C9FA;
    dw $2C37,$01EF                                                       ;93C9FB;
    db $F4                                                               ;93C9FF;
    dw $2C37                                                             ;93CA00;

ProjectileFlareSpritemaps_Charged_PW_PIW_2B:
    dw $000E,$01EE                                                       ;93CA02;
    db $14                                                               ;93CA06;
    dw $2C37,$01EE                                                       ;93CA07;
    db $0C                                                               ;93CA0B;
    dw $2C37,$000B                                                       ;93CA0C;
    db $14                                                               ;93CA10;
    dw $2C37,$000B                                                       ;93CA11;
    db $0C                                                               ;93CA15;
    dw $2C37,$000B                                                       ;93CA16;
    db $E4                                                               ;93CA1A;
    dw $2C37,$01EE                                                       ;93CA1B;
    db $E4                                                               ;93CA1F;
    dw $2C37,$000B                                                       ;93CA20;
    db $04                                                               ;93CA24;
    dw $2C37,$000B                                                       ;93CA25;
    db $FC                                                               ;93CA29;
    dw $2C37,$000B                                                       ;93CA2A;
    db $EC                                                               ;93CA2E;
    dw $2C37,$000B                                                       ;93CA2F;
    db $F4                                                               ;93CA33;
    dw $2C37,$01EE                                                       ;93CA34;
    db $04                                                               ;93CA38;
    dw $2C37,$01EE                                                       ;93CA39;
    db $FC                                                               ;93CA3D;
    dw $2C37,$01EE                                                       ;93CA3E;
    db $EC                                                               ;93CA42;
    dw $2C37,$01EE                                                       ;93CA43;
    db $F4                                                               ;93CA47;
    dw $2C37                                                             ;93CA48;

ProjectileFlareSpritemaps_Charged_PW_PIW_2C:
    dw $000E,$01ED                                                       ;93CA4A;
    db $14                                                               ;93CA4E;
    dw $2C37,$01ED                                                       ;93CA4F;
    db $0C                                                               ;93CA53;
    dw $2C37,$000C                                                       ;93CA54;
    db $14                                                               ;93CA58;
    dw $2C37,$000C                                                       ;93CA59;
    db $0C                                                               ;93CA5D;
    dw $2C37,$000C                                                       ;93CA5E;
    db $E4                                                               ;93CA62;
    dw $2C37,$01ED                                                       ;93CA63;
    db $E4                                                               ;93CA67;
    dw $2C37,$000C                                                       ;93CA68;
    db $04                                                               ;93CA6C;
    dw $2C37,$000C                                                       ;93CA6D;
    db $FC                                                               ;93CA71;
    dw $2C37,$000C                                                       ;93CA72;
    db $EC                                                               ;93CA76;
    dw $2C37,$000C                                                       ;93CA77;
    db $F4                                                               ;93CA7B;
    dw $2C37,$01ED                                                       ;93CA7C;
    db $04                                                               ;93CA80;
    dw $2C37,$01ED                                                       ;93CA81;
    db $FC                                                               ;93CA85;
    dw $2C37,$01ED                                                       ;93CA86;
    db $EC                                                               ;93CA8A;
    dw $2C37,$01ED                                                       ;93CA8B;
    db $F4                                                               ;93CA8F;
    dw $2C37                                                             ;93CA90;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93CA92:
    dw $0008,$01F0                                                       ;93CA92;
    db $0C                                                               ;93CA96;
    dw $AC36,$0008                                                       ;93CA97;
    db $EC                                                               ;93CA9B;
    dw $6C36,$01F0                                                       ;93CA9C;
    db $04                                                               ;93CAA0;
    dw $AC35,$01F8                                                       ;93CAA1;
    db $FC                                                               ;93CAA5;
    dw $AC35,$0000                                                       ;93CAA6;
    db $F4                                                               ;93CAAA;
    dw $AC35,$01F8                                                       ;93CAAB;
    db $04                                                               ;93CAAF;
    dw $6C35,$0008                                                       ;93CAB0;
    db $F4                                                               ;93CAB4;
    dw $6C35,$0000                                                       ;93CAB5;
    db $FC                                                               ;93CAB9;
    dw $6C35                                                             ;93CABA;

UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93CABC:
    dw $0010,$01E9                                                       ;93CABC;
    db $06                                                               ;93CAC0;
    dw $AC36,$01F6                                                       ;93CAC1;
    db $12                                                               ;93CAC5;
    dw $AC36,$0001                                                       ;93CAC6;
    db $E6                                                               ;93CACA;
    dw $6C36,$000E                                                       ;93CACB;
    db $F2                                                               ;93CACF;
    dw $6C36,$01F9                                                       ;93CAD0;
    db $EE                                                               ;93CAD4;
    dw $AC35,$01F1                                                       ;93CAD5;
    db $F6                                                               ;93CAD9;
    dw $AC35,$01E9                                                       ;93CADA;
    db $FE                                                               ;93CADE;
    dw $AC35,$01F6                                                       ;93CADF;
    db $0A                                                               ;93CAE3;
    dw $AC35,$01FE                                                       ;93CAE4;
    db $02                                                               ;93CAE8;
    dw $AC35,$0006                                                       ;93CAE9;
    db $FA                                                               ;93CAED;
    dw $AC35,$01F1                                                       ;93CAEE;
    db $FE                                                               ;93CAF2;
    dw $6C35,$0001                                                       ;93CAF3;
    db $EE                                                               ;93CAF7;
    dw $6C35,$01F9                                                       ;93CAF8;
    db $F6                                                               ;93CAFC;
    dw $6C35,$01FE                                                       ;93CAFD;
    db $0A                                                               ;93CB01;
    dw $6C35,$000E                                                       ;93CB02;
    db $FA                                                               ;93CB06;
    dw $6C35,$0006                                                       ;93CB07;
    db $02                                                               ;93CB0B;
    dw $6C35                                                             ;93CB0C;

UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93CB0E:
    dw $0010,$01F9                                                       ;93CB0E;
    db $15                                                               ;93CB12;
    dw $AC36,$01E6                                                       ;93CB13;
    db $03                                                               ;93CB17;
    dw $AC36,$0011                                                       ;93CB18;
    db $F5                                                               ;93CB1C;
    dw $6C36,$01FE                                                       ;93CB1D;
    db $E3                                                               ;93CB21;
    dw $6C36,$01E6                                                       ;93CB22;
    db $FB                                                               ;93CB26;
    dw $AC35,$01EE                                                       ;93CB27;
    db $F3                                                               ;93CB2B;
    dw $AC35,$01F6                                                       ;93CB2C;
    db $EB                                                               ;93CB30;
    dw $AC35,$01F9                                                       ;93CB31;
    db $0D                                                               ;93CB35;
    dw $AC35,$0001                                                       ;93CB36;
    db $05                                                               ;93CB3A;
    dw $AC35,$0009                                                       ;93CB3B;
    db $FD                                                               ;93CB3F;
    dw $AC35,$01EE                                                       ;93CB40;
    db $FB                                                               ;93CB44;
    dw $6C35,$01FE                                                       ;93CB45;
    db $EB                                                               ;93CB49;
    dw $6C35,$01F6                                                       ;93CB4A;
    db $F3                                                               ;93CB4E;
    dw $6C35,$0001                                                       ;93CB4F;
    db $0D                                                               ;93CB53;
    dw $6C35,$0011                                                       ;93CB54;
    db $FD                                                               ;93CB58;
    dw $6C35,$0009                                                       ;93CB59;
    db $05                                                               ;93CB5D;
    dw $6C35                                                             ;93CB5E;

UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93CB60:
    dw $0010,$01FB                                                       ;93CB60;
    db $17                                                               ;93CB64;
    dw $AC36,$01E4                                                       ;93CB65;
    db $01                                                               ;93CB69;
    dw $AC36,$0013                                                       ;93CB6A;
    db $F7                                                               ;93CB6E;
    dw $6C36,$01FC                                                       ;93CB6F;
    db $E1                                                               ;93CB73;
    dw $6C36,$01E4                                                       ;93CB74;
    db $F9                                                               ;93CB78;
    dw $AC35,$01EC                                                       ;93CB79;
    db $F1                                                               ;93CB7D;
    dw $AC35,$01F4                                                       ;93CB7E;
    db $E9                                                               ;93CB82;
    dw $AC35,$01FB                                                       ;93CB83;
    db $0F                                                               ;93CB87;
    dw $AC35,$0003                                                       ;93CB88;
    db $07                                                               ;93CB8C;
    dw $AC35,$000B                                                       ;93CB8D;
    db $FF                                                               ;93CB91;
    dw $AC35,$01EC                                                       ;93CB92;
    db $F9                                                               ;93CB96;
    dw $6C35,$01FC                                                       ;93CB97;
    db $E9                                                               ;93CB9B;
    dw $6C35,$01F4                                                       ;93CB9C;
    db $F1                                                               ;93CBA0;
    dw $6C35,$0003                                                       ;93CBA1;
    db $0F                                                               ;93CBA5;
    dw $6C35,$0013                                                       ;93CBA6;
    db $FF                                                               ;93CBAA;
    dw $6C35,$000B                                                       ;93CBAB;
    db $07                                                               ;93CBAF;
    dw $6C35                                                             ;93CBB0;

UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93CBB2:
    dw $0010,$01FC                                                       ;93CBB2;
    db $18                                                               ;93CBB6;
    dw $AC36,$01E3                                                       ;93CBB7;
    db $00                                                               ;93CBBB;
    dw $AC36,$01FB                                                       ;93CBBC;
    db $E0                                                               ;93CBC0;
    dw $6C36,$0014                                                       ;93CBC1;
    db $F8                                                               ;93CBC5;
    dw $6C36,$01E3                                                       ;93CBC6;
    db $F8                                                               ;93CBCA;
    dw $AC35,$01EB                                                       ;93CBCB;
    db $F0                                                               ;93CBCF;
    dw $AC35,$01F3                                                       ;93CBD0;
    db $E8                                                               ;93CBD4;
    dw $AC35,$01FC                                                       ;93CBD5;
    db $10                                                               ;93CBD9;
    dw $AC35,$0004                                                       ;93CBDA;
    db $08                                                               ;93CBDE;
    dw $AC35,$000C                                                       ;93CBDF;
    db $00                                                               ;93CBE3;
    dw $AC35,$01EB                                                       ;93CBE4;
    db $F8                                                               ;93CBE8;
    dw $6C35,$01FB                                                       ;93CBE9;
    db $E8                                                               ;93CBED;
    dw $6C35,$01F3                                                       ;93CBEE;
    db $F0                                                               ;93CBF2;
    dw $6C35,$0004                                                       ;93CBF3;
    db $10                                                               ;93CBF7;
    dw $6C35,$0014                                                       ;93CBF8;
    db $00                                                               ;93CBFC;
    dw $6C35,$000C                                                       ;93CBFD;
    db $08                                                               ;93CC01;
    dw $6C35                                                             ;93CC02;
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_PW_PIW_2D:
    dw $000C,$01E8                                                       ;93CC04;
    db $14                                                               ;93CC08;
    dw $AC36,$0010                                                       ;93CC09;
    db $E4                                                               ;93CC0D;
    dw $6C36,$01E8                                                       ;93CC0E;
    db $0C                                                               ;93CC12;
    dw $AC35,$01F0                                                       ;93CC13;
    db $04                                                               ;93CC17;
    dw $AC35,$01F8                                                       ;93CC18;
    db $FC                                                               ;93CC1C;
    dw $AC35,$0000                                                       ;93CC1D;
    db $F4                                                               ;93CC21;
    dw $AC35,$0008                                                       ;93CC22;
    db $EC                                                               ;93CC26;
    dw $AC35,$0010                                                       ;93CC27;
    db $EC                                                               ;93CC2B;
    dw $6C35,$01F0                                                       ;93CC2C;
    db $0C                                                               ;93CC30;
    dw $6C35,$01F8                                                       ;93CC31;
    db $04                                                               ;93CC35;
    dw $6C35,$0008                                                       ;93CC36;
    db $F4                                                               ;93CC3A;
    dw $6C35,$0000                                                       ;93CC3B;
    db $FC                                                               ;93CC3F;
    dw $6C35                                                             ;93CC40;

ProjectileFlareSpritemaps_Charged_PW_PIW_2E:
    dw $0018,$01EE                                                       ;93CC42;
    db $1A                                                               ;93CC46;
    dw $AC36,$01E1                                                       ;93CC47;
    db $0E                                                               ;93CC4B;
    dw $AC36,$0016                                                       ;93CC4C;
    db $EA                                                               ;93CC50;
    dw $6C36,$0009                                                       ;93CC51;
    db $DE                                                               ;93CC55;
    dw $6C36,$0001                                                       ;93CC56;
    db $E6                                                               ;93CC5A;
    dw $AC35,$01F9                                                       ;93CC5B;
    db $EE                                                               ;93CC5F;
    dw $AC35,$01F1                                                       ;93CC60;
    db $F6                                                               ;93CC64;
    dw $AC35,$01E9                                                       ;93CC65;
    db $FE                                                               ;93CC69;
    dw $AC35,$01E1                                                       ;93CC6A;
    db $06                                                               ;93CC6E;
    dw $AC35,$01EE                                                       ;93CC6F;
    db $12                                                               ;93CC73;
    dw $AC35,$01F6                                                       ;93CC74;
    db $0A                                                               ;93CC78;
    dw $AC35,$01FE                                                       ;93CC79;
    db $02                                                               ;93CC7D;
    dw $AC35,$0006                                                       ;93CC7E;
    db $FA                                                               ;93CC82;
    dw $AC35,$000E                                                       ;93CC83;
    db $F2                                                               ;93CC87;
    dw $AC35,$0009                                                       ;93CC88;
    db $E6                                                               ;93CC8C;
    dw $6C35,$0016                                                       ;93CC8D;
    db $F2                                                               ;93CC91;
    dw $6C35,$01F6                                                       ;93CC92;
    db $12                                                               ;93CC96;
    dw $6C35,$01E9                                                       ;93CC97;
    db $06                                                               ;93CC9B;
    dw $6C35,$01F1                                                       ;93CC9C;
    db $FE                                                               ;93CCA0;
    dw $6C35,$0001                                                       ;93CCA1;
    db $EE                                                               ;93CCA5;
    dw $6C35,$01F9                                                       ;93CCA6;
    db $F6                                                               ;93CCAA;
    dw $6C35,$01FE                                                       ;93CCAB;
    db $0A                                                               ;93CCAF;
    dw $6C35,$000E                                                       ;93CCB0;
    db $FA                                                               ;93CCB4;
    dw $6C35,$0006                                                       ;93CCB5;
    db $02                                                               ;93CCB9;
    dw $6C35                                                             ;93CCBA;

ProjectileFlareSpritemaps_Charged_PW_PIW_2F:
    dw $0018,$0019                                                       ;93CCBC;
    db $ED                                                               ;93CCC0;
    dw $6C36,$0006                                                       ;93CCC1;
    db $DB                                                               ;93CCC5;
    dw $6C36,$01F1                                                       ;93CCC6;
    db $1D                                                               ;93CCCA;
    dw $AC36,$01DE                                                       ;93CCCB;
    db $0B                                                               ;93CCCF;
    dw $AC36,$01FE                                                       ;93CCD0;
    db $E3                                                               ;93CCD4;
    dw $AC35,$01F6                                                       ;93CCD5;
    db $EB                                                               ;93CCD9;
    dw $AC35,$01EE                                                       ;93CCDA;
    db $F3                                                               ;93CCDE;
    dw $AC35,$01E6                                                       ;93CCDF;
    db $FB                                                               ;93CCE3;
    dw $AC35,$01DE                                                       ;93CCE4;
    db $03                                                               ;93CCE8;
    dw $AC35,$01F1                                                       ;93CCE9;
    db $15                                                               ;93CCED;
    dw $AC35,$01F9                                                       ;93CCEE;
    db $0D                                                               ;93CCF2;
    dw $AC35,$0001                                                       ;93CCF3;
    db $05                                                               ;93CCF7;
    dw $AC35,$0009                                                       ;93CCF8;
    db $FD                                                               ;93CCFC;
    dw $AC35,$0011                                                       ;93CCFD;
    db $F5                                                               ;93CD01;
    dw $AC35,$0006                                                       ;93CD02;
    db $E3                                                               ;93CD06;
    dw $6C35,$01E6                                                       ;93CD07;
    db $03                                                               ;93CD0B;
    dw $6C35,$0019                                                       ;93CD0C;
    db $F5                                                               ;93CD10;
    dw $6C35,$01F9                                                       ;93CD11;
    db $15                                                               ;93CD15;
    dw $6C35,$01EE                                                       ;93CD16;
    db $FB                                                               ;93CD1A;
    dw $6C35,$01FE                                                       ;93CD1B;
    db $EB                                                               ;93CD1F;
    dw $6C35,$01F6                                                       ;93CD20;
    db $F3                                                               ;93CD24;
    dw $6C35,$0001                                                       ;93CD25;
    db $0D                                                               ;93CD29;
    dw $6C35,$0011                                                       ;93CD2A;
    db $FD                                                               ;93CD2E;
    dw $6C35,$0009                                                       ;93CD2F;
    db $05                                                               ;93CD33;
    dw $6C35                                                             ;93CD34;

ProjectileFlareSpritemaps_Charged_PW_PIW_30:
    dw $0018,$001B                                                       ;93CD36;
    db $EF                                                               ;93CD3A;
    dw $6C36,$0004                                                       ;93CD3B;
    db $D9                                                               ;93CD3F;
    dw $6C36,$01F3                                                       ;93CD40;
    db $1F                                                               ;93CD44;
    dw $AC36,$01DD                                                       ;93CD45;
    db $08                                                               ;93CD49;
    dw $AC36,$01FC                                                       ;93CD4A;
    db $E1                                                               ;93CD4E;
    dw $AC35,$01F4                                                       ;93CD4F;
    db $E9                                                               ;93CD53;
    dw $AC35,$01EC                                                       ;93CD54;
    db $F1                                                               ;93CD58;
    dw $AC35,$01E4                                                       ;93CD59;
    db $F9                                                               ;93CD5D;
    dw $AC35,$01DD                                                       ;93CD5E;
    db $00                                                               ;93CD62;
    dw $AC35,$01F3                                                       ;93CD63;
    db $17                                                               ;93CD67;
    dw $AC35,$01FB                                                       ;93CD68;
    db $0F                                                               ;93CD6C;
    dw $AC35,$0003                                                       ;93CD6D;
    db $07                                                               ;93CD71;
    dw $AC35,$000B                                                       ;93CD72;
    db $FF                                                               ;93CD76;
    dw $AC35,$0013                                                       ;93CD77;
    db $F7                                                               ;93CD7B;
    dw $AC35,$001B                                                       ;93CD7C;
    db $F7                                                               ;93CD80;
    dw $6C35,$0004                                                       ;93CD81;
    db $E1                                                               ;93CD85;
    dw $6C35,$01FB                                                       ;93CD86;
    db $17                                                               ;93CD8A;
    dw $6C35,$01E5                                                       ;93CD8B;
    db $00                                                               ;93CD8F;
    dw $6C35,$01EC                                                       ;93CD90;
    db $F9                                                               ;93CD94;
    dw $6C35,$01FC                                                       ;93CD95;
    db $E9                                                               ;93CD99;
    dw $6C35,$01F4                                                       ;93CD9A;
    db $F1                                                               ;93CD9E;
    dw $6C35,$0003                                                       ;93CD9F;
    db $0F                                                               ;93CDA3;
    dw $6C35,$0013                                                       ;93CDA4;
    db $FF                                                               ;93CDA8;
    dw $6C35,$000B                                                       ;93CDA9;
    db $07                                                               ;93CDAD;
    dw $6C35                                                             ;93CDAE;

ProjectileFlareSpritemaps_Charged_PW_PIW_31:
    dw $0018,$01F4                                                       ;93CDB0;
    db $20                                                               ;93CDB4;
    dw $AC36,$01DB                                                       ;93CDB5;
    db $08                                                               ;93CDB9;
    dw $AC36,$001C                                                       ;93CDBA;
    db $F0                                                               ;93CDBE;
    dw $6C36,$0003                                                       ;93CDBF;
    db $D8                                                               ;93CDC3;
    dw $6C36,$0014                                                       ;93CDC4;
    db $F8                                                               ;93CDC8;
    dw $AC35,$000C                                                       ;93CDC9;
    db $00                                                               ;93CDCD;
    dw $AC35,$0004                                                       ;93CDCE;
    db $08                                                               ;93CDD2;
    dw $AC35,$01FC                                                       ;93CDD3;
    db $10                                                               ;93CDD7;
    dw $AC35,$01F4                                                       ;93CDD8;
    db $18                                                               ;93CDDC;
    dw $AC35,$01DB                                                       ;93CDDD;
    db $00                                                               ;93CDE1;
    dw $AC35,$01E3                                                       ;93CDE2;
    db $F8                                                               ;93CDE6;
    dw $AC35,$01EB                                                       ;93CDE7;
    db $F0                                                               ;93CDEB;
    dw $AC35,$01F3                                                       ;93CDEC;
    db $E8                                                               ;93CDF0;
    dw $AC35,$01FB                                                       ;93CDF1;
    db $E0                                                               ;93CDF5;
    dw $AC35,$001C                                                       ;93CDF6;
    db $F8                                                               ;93CDFA;
    dw $6C35,$0003                                                       ;93CDFB;
    db $E0                                                               ;93CDFF;
    dw $6C35,$01FC                                                       ;93CE00;
    db $18                                                               ;93CE04;
    dw $6C35,$01E3                                                       ;93CE05;
    db $00                                                               ;93CE09;
    dw $6C35,$01EB                                                       ;93CE0A;
    db $F8                                                               ;93CE0E;
    dw $6C35,$01FB                                                       ;93CE0F;
    db $E8                                                               ;93CE13;
    dw $6C35,$01F3                                                       ;93CE14;
    db $F0                                                               ;93CE18;
    dw $6C35,$0004                                                       ;93CE19;
    db $10                                                               ;93CE1D;
    dw $6C35,$0014                                                       ;93CE1E;
    db $00                                                               ;93CE22;
    dw $6C35,$000C                                                       ;93CE23;
    db $08                                                               ;93CE27;
    dw $6C35                                                             ;93CE28;

ProjectileFlareSpritemaps_Charged_PW_PIW_32:
    dw $0006,$01F0                                                       ;93CE2A;
    db $04                                                               ;93CE2E;
    dw $6C32,$01F8                                                       ;93CE2F;
    db $04                                                               ;93CE33;
    dw $6C31,$0000                                                       ;93CE34;
    db $F4                                                               ;93CE38;
    dw $6C32,$0008                                                       ;93CE39;
    db $F4                                                               ;93CE3D;
    dw $6C31,$01F8                                                       ;93CE3E;
    db $FC                                                               ;93CE42;
    dw $6C32,$0000                                                       ;93CE43;
    db $FC                                                               ;93CE47;
    dw $6C31                                                             ;93CE48;

ProjectileFlareSpritemaps_Charged_PW_PIW_33:
    dw $000C,$01E9                                                       ;93CE4A;
    db $FE                                                               ;93CE4E;
    dw $6C32,$01F1                                                       ;93CE4F;
    db $FE                                                               ;93CE53;
    dw $6C31,$01F9                                                       ;93CE54;
    db $EE                                                               ;93CE58;
    dw $6C32,$0001                                                       ;93CE59;
    db $EE                                                               ;93CE5D;
    dw $6C31,$01F1                                                       ;93CE5E;
    db $F6                                                               ;93CE62;
    dw $6C32,$01F9                                                       ;93CE63;
    db $F6                                                               ;93CE67;
    dw $6C31,$01F6                                                       ;93CE68;
    db $0A                                                               ;93CE6C;
    dw $6C32,$01FE                                                       ;93CE6D;
    db $0A                                                               ;93CE71;
    dw $6C31,$0006                                                       ;93CE72;
    db $FA                                                               ;93CE76;
    dw $6C32,$000E                                                       ;93CE77;
    db $FA                                                               ;93CE7B;
    dw $6C31,$01FE                                                       ;93CE7C;
    db $02                                                               ;93CE80;
    dw $6C32,$0006                                                       ;93CE81;
    db $02                                                               ;93CE85;
    dw $6C31                                                             ;93CE86;

ProjectileFlareSpritemaps_Charged_PW_PIW_34:
    dw $000C,$01E6                                                       ;93CE88;
    db $FB                                                               ;93CE8C;
    dw $6C32,$01EE                                                       ;93CE8D;
    db $FB                                                               ;93CE91;
    dw $6C31,$01F6                                                       ;93CE92;
    db $EB                                                               ;93CE96;
    dw $6C32,$01FE                                                       ;93CE97;
    db $EB                                                               ;93CE9B;
    dw $6C31,$01EE                                                       ;93CE9C;
    db $F3                                                               ;93CEA0;
    dw $6C32,$01F6                                                       ;93CEA1;
    db $F3                                                               ;93CEA5;
    dw $6C31,$01F9                                                       ;93CEA6;
    db $0D                                                               ;93CEAA;
    dw $6C32,$0001                                                       ;93CEAB;
    db $0D                                                               ;93CEAF;
    dw $6C31,$0009                                                       ;93CEB0;
    db $FD                                                               ;93CEB4;
    dw $6C32,$0011                                                       ;93CEB5;
    db $FD                                                               ;93CEB9;
    dw $6C31,$0001                                                       ;93CEBA;
    db $05                                                               ;93CEBE;
    dw $6C32,$0009                                                       ;93CEBF;
    db $05                                                               ;93CEC3;
    dw $6C31                                                             ;93CEC4;

ProjectileFlareSpritemaps_Charged_PW_PIW_35:
    dw $000C,$01E4                                                       ;93CEC6;
    db $F9                                                               ;93CECA;
    dw $6C32,$01EC                                                       ;93CECB;
    db $F9                                                               ;93CECF;
    dw $6C31,$01F4                                                       ;93CED0;
    db $E9                                                               ;93CED4;
    dw $6C32,$01FC                                                       ;93CED5;
    db $E9                                                               ;93CED9;
    dw $6C31,$01EC                                                       ;93CEDA;
    db $F1                                                               ;93CEDE;
    dw $6C32,$01F4                                                       ;93CEDF;
    db $F1                                                               ;93CEE3;
    dw $6C31,$01FB                                                       ;93CEE4;
    db $0F                                                               ;93CEE8;
    dw $6C32,$0003                                                       ;93CEE9;
    db $0F                                                               ;93CEED;
    dw $6C31,$000B                                                       ;93CEEE;
    db $FF                                                               ;93CEF2;
    dw $6C32,$0013                                                       ;93CEF3;
    db $FF                                                               ;93CEF7;
    dw $6C31,$0003                                                       ;93CEF8;
    db $07                                                               ;93CEFC;
    dw $6C32,$000B                                                       ;93CEFD;
    db $07                                                               ;93CF01;
    dw $6C31                                                             ;93CF02;

ProjectileFlareSpritemaps_Charged_PW_PIW_36:
    dw $000C,$01E3                                                       ;93CF04;
    db $F8                                                               ;93CF08;
    dw $6C32,$01EB                                                       ;93CF09;
    db $F8                                                               ;93CF0D;
    dw $6C31,$01F3                                                       ;93CF0E;
    db $E8                                                               ;93CF12;
    dw $6C32,$01FB                                                       ;93CF13;
    db $E8                                                               ;93CF17;
    dw $6C31,$01EB                                                       ;93CF18;
    db $F0                                                               ;93CF1C;
    dw $6C32,$01F3                                                       ;93CF1D;
    db $F0                                                               ;93CF21;
    dw $6C31,$01FC                                                       ;93CF22;
    db $10                                                               ;93CF26;
    dw $6C32,$0004                                                       ;93CF27;
    db $10                                                               ;93CF2B;
    dw $6C31,$000C                                                       ;93CF2C;
    db $00                                                               ;93CF30;
    dw $6C32,$0014                                                       ;93CF31;
    db $00                                                               ;93CF35;
    dw $6C31,$0004                                                       ;93CF36;
    db $08                                                               ;93CF3A;
    dw $6C32,$000C                                                       ;93CF3B;
    db $08                                                               ;93CF3F;
    dw $6C31                                                             ;93CF40;

ProjectileFlareSpritemaps_Charged_PW_PIW_37:
    dw $000A,$0008                                                       ;93CF42;
    db $EC                                                               ;93CF46;
    dw $6C32,$0010                                                       ;93CF47;
    db $EC                                                               ;93CF4B;
    dw $6C31,$01E8                                                       ;93CF4C;
    db $0C                                                               ;93CF50;
    dw $6C32,$01F0                                                       ;93CF51;
    db $0C                                                               ;93CF55;
    dw $6C31,$01F0                                                       ;93CF56;
    db $04                                                               ;93CF5A;
    dw $6C32,$01F8                                                       ;93CF5B;
    db $04                                                               ;93CF5F;
    dw $6C31,$0000                                                       ;93CF60;
    db $F4                                                               ;93CF64;
    dw $6C32,$0008                                                       ;93CF65;
    db $F4                                                               ;93CF69;
    dw $6C31,$01F8                                                       ;93CF6A;
    db $FC                                                               ;93CF6E;
    dw $6C32,$0000                                                       ;93CF6F;
    db $FC                                                               ;93CF73;
    dw $6C31                                                             ;93CF74;

ProjectileFlareSpritemaps_Charged_PW_PIW_38:
    dw $0014,$0001                                                       ;93CF76;
    db $E6                                                               ;93CF7A;
    dw $6C32,$0009                                                       ;93CF7B;
    db $E6                                                               ;93CF7F;
    dw $6C31,$000E                                                       ;93CF80;
    db $F2                                                               ;93CF84;
    dw $6C32,$0016                                                       ;93CF85;
    db $F2                                                               ;93CF89;
    dw $6C31,$01EE                                                       ;93CF8A;
    db $12                                                               ;93CF8E;
    dw $6C32,$01F6                                                       ;93CF8F;
    db $12                                                               ;93CF93;
    dw $6C31,$01E1                                                       ;93CF94;
    db $06                                                               ;93CF98;
    dw $6C32,$01E9                                                       ;93CF99;
    db $06                                                               ;93CF9D;
    dw $6C31,$01E9                                                       ;93CF9E;
    db $FE                                                               ;93CFA2;
    dw $6C32,$01F1                                                       ;93CFA3;
    db $FE                                                               ;93CFA7;
    dw $6C31,$01F9                                                       ;93CFA8;
    db $EE                                                               ;93CFAC;
    dw $6C32,$0001                                                       ;93CFAD;
    db $EE                                                               ;93CFB1;
    dw $6C31,$01F1                                                       ;93CFB2;
    db $F6                                                               ;93CFB6;
    dw $6C32,$01F9                                                       ;93CFB7;
    db $F6                                                               ;93CFBB;
    dw $6C31,$01F6                                                       ;93CFBC;
    db $0A                                                               ;93CFC0;
    dw $6C32,$01FE                                                       ;93CFC1;
    db $0A                                                               ;93CFC5;
    dw $6C31,$0006                                                       ;93CFC6;
    db $FA                                                               ;93CFCA;
    dw $6C32,$000E                                                       ;93CFCB;
    db $FA                                                               ;93CFCF;
    dw $6C31,$01FE                                                       ;93CFD0;
    db $02                                                               ;93CFD4;
    dw $6C32,$0006                                                       ;93CFD5;
    db $02                                                               ;93CFD9;
    dw $6C31                                                             ;93CFDA;

ProjectileFlareSpritemaps_Charged_PW_PIW_39:
    dw $0014,$01FE                                                       ;93CFDC;
    db $E3                                                               ;93CFE0;
    dw $6C32,$0006                                                       ;93CFE1;
    db $E3                                                               ;93CFE5;
    dw $6C31,$01DE                                                       ;93CFE6;
    db $03                                                               ;93CFEA;
    dw $6C32,$01E6                                                       ;93CFEB;
    db $03                                                               ;93CFEF;
    dw $6C31,$0011                                                       ;93CFF0;
    db $F5                                                               ;93CFF4;
    dw $6C32,$0019                                                       ;93CFF5;
    db $F5                                                               ;93CFF9;
    dw $6C31,$01F1                                                       ;93CFFA;
    db $15                                                               ;93CFFE;
    dw $6C32,$01F9                                                       ;93CFFF;
    db $15                                                               ;93D003;
    dw $6C31,$01E6                                                       ;93D004;
    db $FB                                                               ;93D008;
    dw $6C32,$01EE                                                       ;93D009;
    db $FB                                                               ;93D00D;
    dw $6C31,$01F6                                                       ;93D00E;
    db $EB                                                               ;93D012;
    dw $6C32,$01FE                                                       ;93D013;
    db $EB                                                               ;93D017;
    dw $6C31,$01EE                                                       ;93D018;
    db $F3                                                               ;93D01C;
    dw $6C32,$01F6                                                       ;93D01D;
    db $F3                                                               ;93D021;
    dw $6C31,$01F9                                                       ;93D022;
    db $0D                                                               ;93D026;
    dw $6C32,$0001                                                       ;93D027;
    db $0D                                                               ;93D02B;
    dw $6C31,$0009                                                       ;93D02C;
    db $FD                                                               ;93D030;
    dw $6C32,$0011                                                       ;93D031;
    db $FD                                                               ;93D035;
    dw $6C31,$0001                                                       ;93D036;
    db $05                                                               ;93D03A;
    dw $6C32,$0009                                                       ;93D03B;
    db $05                                                               ;93D03F;
    dw $6C31                                                             ;93D040;

ProjectileFlareSpritemaps_Charged_PW_PIW_3A:
    dw $0014,$0013                                                       ;93D042;
    db $F7                                                               ;93D046;
    dw $6C32,$001B                                                       ;93D047;
    db $F7                                                               ;93D04B;
    dw $6C31,$01FC                                                       ;93D04C;
    db $E1                                                               ;93D050;
    dw $6C32,$0004                                                       ;93D051;
    db $E1                                                               ;93D055;
    dw $6C31,$01F3                                                       ;93D056;
    db $17                                                               ;93D05A;
    dw $6C32,$01FB                                                       ;93D05B;
    db $17                                                               ;93D05F;
    dw $6C31,$01DD                                                       ;93D060;
    db $00                                                               ;93D064;
    dw $6C32,$01E5                                                       ;93D065;
    db $00                                                               ;93D069;
    dw $6C31,$01E4                                                       ;93D06A;
    db $F9                                                               ;93D06E;
    dw $6C32,$01EC                                                       ;93D06F;
    db $F9                                                               ;93D073;
    dw $6C31,$01F4                                                       ;93D074;
    db $E9                                                               ;93D078;
    dw $6C32,$01FC                                                       ;93D079;
    db $E9                                                               ;93D07D;
    dw $6C31,$01EC                                                       ;93D07E;
    db $F1                                                               ;93D082;
    dw $6C32,$01F4                                                       ;93D083;
    db $F1                                                               ;93D087;
    dw $6C31,$01FB                                                       ;93D088;
    db $0F                                                               ;93D08C;
    dw $6C32,$0003                                                       ;93D08D;
    db $0F                                                               ;93D091;
    dw $6C31,$000B                                                       ;93D092;
    db $FF                                                               ;93D096;
    dw $6C32,$0013                                                       ;93D097;
    db $FF                                                               ;93D09B;
    dw $6C31,$0003                                                       ;93D09C;
    db $07                                                               ;93D0A0;
    dw $6C32,$000B                                                       ;93D0A1;
    db $07                                                               ;93D0A5;
    dw $6C31                                                             ;93D0A6;

ProjectileFlareSpritemaps_Charged_PW_PIW_3B:
    dw $0014,$0014                                                       ;93D0A8;
    db $F8                                                               ;93D0AC;
    dw $6C32,$001C                                                       ;93D0AD;
    db $F8                                                               ;93D0B1;
    dw $6C31,$01FB                                                       ;93D0B2;
    db $E0                                                               ;93D0B6;
    dw $6C32,$0003                                                       ;93D0B7;
    db $E0                                                               ;93D0BB;
    dw $6C31,$01F4                                                       ;93D0BC;
    db $18                                                               ;93D0C0;
    dw $6C32,$01FC                                                       ;93D0C1;
    db $18                                                               ;93D0C5;
    dw $6C31,$01DB                                                       ;93D0C6;
    db $00                                                               ;93D0CA;
    dw $6C32,$01E3                                                       ;93D0CB;
    db $00                                                               ;93D0CF;
    dw $6C31,$01E3                                                       ;93D0D0;
    db $F8                                                               ;93D0D4;
    dw $6C32,$01EB                                                       ;93D0D5;
    db $F8                                                               ;93D0D9;
    dw $6C31,$01F3                                                       ;93D0DA;
    db $E8                                                               ;93D0DE;
    dw $6C32,$01FB                                                       ;93D0DF;
    db $E8                                                               ;93D0E3;
    dw $6C31,$01EB                                                       ;93D0E4;
    db $F0                                                               ;93D0E8;
    dw $6C32,$01F3                                                       ;93D0E9;
    db $F0                                                               ;93D0ED;
    dw $6C31,$01FC                                                       ;93D0EE;
    db $10                                                               ;93D0F2;
    dw $6C32,$0004                                                       ;93D0F3;
    db $10                                                               ;93D0F7;
    dw $6C31,$000C                                                       ;93D0F8;
    db $00                                                               ;93D0FC;
    dw $6C32,$0014                                                       ;93D0FD;
    db $00                                                               ;93D101;
    dw $6C31,$0004                                                       ;93D102;
    db $08                                                               ;93D106;
    dw $6C32,$000C                                                       ;93D107;
    db $08                                                               ;93D10B;
    dw $6C31                                                             ;93D10C;

ProjectileFlareSpritemaps_S_SI_SW_SIW_0:
    dw $0004,$01F2                                                       ;93D10E;
    db $00                                                               ;93D112;
    dw $6C32,$01FA                                                       ;93D113;
    db $00                                                               ;93D117;
    dw $6C31,$01FA                                                       ;93D118;
    db $F8                                                               ;93D11C;
    dw $6C32,$0002                                                       ;93D11D;
    db $F8                                                               ;93D121;
    dw $6C31                                                             ;93D122;

ProjectileFlareSpritemaps_S_SI_SW_SIW_1:
    dw $000C,$01F2                                                       ;93D124;
    db $00                                                               ;93D128;
    dw $6C32,$01FA                                                       ;93D129;
    db $00                                                               ;93D12D;
    dw $6C31,$01FA                                                       ;93D12E;
    db $F8                                                               ;93D132;
    dw $6C32,$0002                                                       ;93D133;
    db $F8                                                               ;93D137;
    dw $6C31,$01EC                                                       ;93D138;
    db $FA                                                               ;93D13C;
    dw $6C32,$01F4                                                       ;93D13D;
    db $FA                                                               ;93D141;
    dw $6C31,$01F4                                                       ;93D142;
    db $F2                                                               ;93D146;
    dw $6C32,$01FC                                                       ;93D147;
    db $F2                                                               ;93D14B;
    dw $6C31,$01F8                                                       ;93D14C;
    db $06                                                               ;93D150;
    dw $6C32,$0000                                                       ;93D151;
    db $06                                                               ;93D155;
    dw $6C31,$0000                                                       ;93D156;
    db $FE                                                               ;93D15A;
    dw $6C32,$0008                                                       ;93D15B;
    db $FE                                                               ;93D15F;
    dw $6C31                                                             ;93D160;

ProjectileFlareSpritemaps_S_SI_SW_SIW_2:
    dw $000C,$01F2                                                       ;93D162;
    db $00                                                               ;93D166;
    dw $6C32,$01FA                                                       ;93D167;
    db $00                                                               ;93D16B;
    dw $6C31,$01FA                                                       ;93D16C;
    db $F8                                                               ;93D170;
    dw $6C32,$0002                                                       ;93D171;
    db $F8                                                               ;93D175;
    dw $6C31,$01E9                                                       ;93D176;
    db $F7                                                               ;93D17A;
    dw $6C32,$01F1                                                       ;93D17B;
    db $F7                                                               ;93D17F;
    dw $6C31,$01F1                                                       ;93D180;
    db $EF                                                               ;93D184;
    dw $6C32,$01F9                                                       ;93D185;
    db $EF                                                               ;93D189;
    dw $6C31,$01FB                                                       ;93D18A;
    db $09                                                               ;93D18E;
    dw $6C32,$0003                                                       ;93D18F;
    db $09                                                               ;93D193;
    dw $6C31,$0003                                                       ;93D194;
    db $01                                                               ;93D198;
    dw $6C32,$000B                                                       ;93D199;
    db $01                                                               ;93D19D;
    dw $6C31                                                             ;93D19E;

ProjectileFlareSpritemaps_S_SI_SW_SIW_3:
    dw $000C,$01F2                                                       ;93D1A0;
    db $00                                                               ;93D1A4;
    dw $6C32,$01FA                                                       ;93D1A5;
    db $00                                                               ;93D1A9;
    dw $6C31,$01FA                                                       ;93D1AA;
    db $F8                                                               ;93D1AE;
    dw $6C32,$0002                                                       ;93D1AF;
    db $F8                                                               ;93D1B3;
    dw $6C31,$01E7                                                       ;93D1B4;
    db $F5                                                               ;93D1B8;
    dw $6C32,$01EF                                                       ;93D1B9;
    db $F5                                                               ;93D1BD;
    dw $6C31,$01EF                                                       ;93D1BE;
    db $ED                                                               ;93D1C2;
    dw $6C32,$01F7                                                       ;93D1C3;
    db $ED                                                               ;93D1C7;
    dw $6C31,$01FD                                                       ;93D1C8;
    db $0B                                                               ;93D1CC;
    dw $6C32,$0005                                                       ;93D1CD;
    db $0B                                                               ;93D1D1;
    dw $6C31,$0005                                                       ;93D1D2;
    db $03                                                               ;93D1D6;
    dw $6C32,$000D                                                       ;93D1D7;
    db $03                                                               ;93D1DB;
    dw $6C31                                                             ;93D1DC;

ProjectileFlareSpritemaps_S_SI_SW_SIW_4:
    dw $000C,$01F2                                                       ;93D1DE;
    db $00                                                               ;93D1E2;
    dw $6C32,$01FA                                                       ;93D1E3;
    db $00                                                               ;93D1E7;
    dw $6C31,$01FA                                                       ;93D1E8;
    db $F8                                                               ;93D1EC;
    dw $6C32,$0002                                                       ;93D1ED;
    db $F8                                                               ;93D1F1;
    dw $6C31,$01E6                                                       ;93D1F2;
    db $F4                                                               ;93D1F6;
    dw $6C32,$01EE                                                       ;93D1F7;
    db $F4                                                               ;93D1FB;
    dw $6C31,$01EE                                                       ;93D1FC;
    db $EC                                                               ;93D200;
    dw $6C32,$01F6                                                       ;93D201;
    db $EC                                                               ;93D205;
    dw $6C31,$01FE                                                       ;93D206;
    db $0C                                                               ;93D20A;
    dw $6C32,$0006                                                       ;93D20B;
    db $0C                                                               ;93D20F;
    dw $6C31,$0006                                                       ;93D210;
    db $04                                                               ;93D214;
    dw $6C32,$000E                                                       ;93D215;
    db $04                                                               ;93D219;
    dw $6C31                                                             ;93D21A;

ProjectileFlareSpritemaps_S_SI_SW_SIW_5:
    dw $000C,$01EF                                                       ;93D21C;
    db $FE                                                               ;93D220;
    dw $6C32,$01F7                                                       ;93D221;
    db $FE                                                               ;93D225;
    dw $6C31,$01F7                                                       ;93D226;
    db $F6                                                               ;93D22A;
    dw $6C32,$01FF                                                       ;93D22B;
    db $F6                                                               ;93D22F;
    dw $6C31,$01F4                                                       ;93D230;
    db $03                                                               ;93D234;
    dw $6C32,$01FC                                                       ;93D235;
    db $03                                                               ;93D239;
    dw $6C31,$01FC                                                       ;93D23A;
    db $FB                                                               ;93D23E;
    dw $6C32,$0004                                                       ;93D23F;
    db $FB                                                               ;93D243;
    dw $6C31,$01F2                                                       ;93D244;
    db $00                                                               ;93D248;
    dw $6C32,$01FA                                                       ;93D249;
    db $00                                                               ;93D24D;
    dw $6C31,$01FA                                                       ;93D24E;
    db $F8                                                               ;93D252;
    dw $6C32,$0002                                                       ;93D253;
    db $F8                                                               ;93D257;
    dw $6C31                                                             ;93D258;

ProjectileFlareSpritemaps_S_SI_SW_SIW_6:
    dw $0004,$01F2                                                       ;93D25A;
    db $F8                                                               ;93D25E;
    dw $EC32,$01FA                                                       ;93D25F;
    db $F8                                                               ;93D263;
    dw $EC31,$01FA                                                       ;93D264;
    db $00                                                               ;93D268;
    dw $EC32,$0002                                                       ;93D269;
    db $00                                                               ;93D26D;
    dw $EC31                                                             ;93D26E;

ProjectileFlareSpritemaps_S_SI_SW_SIW_7:
    dw $000C,$01F2                                                       ;93D270;
    db $F8                                                               ;93D274;
    dw $EC32,$01FA                                                       ;93D275;
    db $F8                                                               ;93D279;
    dw $EC31,$01FA                                                       ;93D27A;
    db $00                                                               ;93D27E;
    dw $EC32,$0002                                                       ;93D27F;
    db $00                                                               ;93D283;
    dw $EC31,$01EC                                                       ;93D284;
    db $FE                                                               ;93D288;
    dw $EC32,$01F4                                                       ;93D289;
    db $FE                                                               ;93D28D;
    dw $EC31,$01F4                                                       ;93D28E;
    db $06                                                               ;93D292;
    dw $EC32,$01FC                                                       ;93D293;
    db $06                                                               ;93D297;
    dw $EC31,$01F8                                                       ;93D298;
    db $F2                                                               ;93D29C;
    dw $EC32,$0000                                                       ;93D29D;
    db $F2                                                               ;93D2A1;
    dw $EC31,$0000                                                       ;93D2A2;
    db $FA                                                               ;93D2A6;
    dw $EC32,$0008                                                       ;93D2A7;
    db $FA                                                               ;93D2AB;
    dw $EC31                                                             ;93D2AC;

ProjectileFlareSpritemaps_S_SI_SW_SIW_8:
    dw $000C,$01F2                                                       ;93D2AE;
    db $F8                                                               ;93D2B2;
    dw $EC32,$01FA                                                       ;93D2B3;
    db $F8                                                               ;93D2B7;
    dw $EC31,$01FA                                                       ;93D2B8;
    db $00                                                               ;93D2BC;
    dw $EC32,$0002                                                       ;93D2BD;
    db $00                                                               ;93D2C1;
    dw $EC31,$01E9                                                       ;93D2C2;
    db $01                                                               ;93D2C6;
    dw $EC32,$01F1                                                       ;93D2C7;
    db $01                                                               ;93D2CB;
    dw $EC31,$01F1                                                       ;93D2CC;
    db $09                                                               ;93D2D0;
    dw $EC32,$01F9                                                       ;93D2D1;
    db $09                                                               ;93D2D5;
    dw $EC31,$01FB                                                       ;93D2D6;
    db $EF                                                               ;93D2DA;
    dw $EC32,$0003                                                       ;93D2DB;
    db $EF                                                               ;93D2DF;
    dw $EC31,$0003                                                       ;93D2E0;
    db $F7                                                               ;93D2E4;
    dw $EC32,$000B                                                       ;93D2E5;
    db $F7                                                               ;93D2E9;
    dw $EC31                                                             ;93D2EA;

ProjectileFlareSpritemaps_S_SI_SW_SIW_9:
    dw $000C,$01F2                                                       ;93D2EC;
    db $F8                                                               ;93D2F0;
    dw $EC32,$01FA                                                       ;93D2F1;
    db $F8                                                               ;93D2F5;
    dw $EC31,$01FA                                                       ;93D2F6;
    db $00                                                               ;93D2FA;
    dw $EC32,$0002                                                       ;93D2FB;
    db $00                                                               ;93D2FF;
    dw $EC31,$01E7                                                       ;93D300;
    db $03                                                               ;93D304;
    dw $EC32,$01EF                                                       ;93D305;
    db $03                                                               ;93D309;
    dw $EC31,$01EF                                                       ;93D30A;
    db $0B                                                               ;93D30E;
    dw $EC32,$01F7                                                       ;93D30F;
    db $0B                                                               ;93D313;
    dw $EC31,$01FD                                                       ;93D314;
    db $ED                                                               ;93D318;
    dw $EC32,$0005                                                       ;93D319;
    db $ED                                                               ;93D31D;
    dw $EC31,$0005                                                       ;93D31E;
    db $F5                                                               ;93D322;
    dw $EC32,$000D                                                       ;93D323;
    db $F5                                                               ;93D327;
    dw $EC31                                                             ;93D328;

ProjectileFlareSpritemaps_S_SI_SW_SIW_A:
    dw $000C,$01F2                                                       ;93D32A;
    db $F8                                                               ;93D32E;
    dw $EC32,$01FA                                                       ;93D32F;
    db $F8                                                               ;93D333;
    dw $EC31,$01FA                                                       ;93D334;
    db $00                                                               ;93D338;
    dw $EC32,$0002                                                       ;93D339;
    db $00                                                               ;93D33D;
    dw $EC31,$01E6                                                       ;93D33E;
    db $04                                                               ;93D342;
    dw $EC32,$01EE                                                       ;93D343;
    db $04                                                               ;93D347;
    dw $EC31,$01EE                                                       ;93D348;
    db $0C                                                               ;93D34C;
    dw $EC32,$01F6                                                       ;93D34D;
    db $0C                                                               ;93D351;
    dw $EC31,$01FE                                                       ;93D352;
    db $EC                                                               ;93D356;
    dw $EC32,$0006                                                       ;93D357;
    db $EC                                                               ;93D35B;
    dw $EC31,$0006                                                       ;93D35C;
    db $F4                                                               ;93D360;
    dw $EC32,$000E                                                       ;93D361;
    db $F4                                                               ;93D365;
    dw $EC31                                                             ;93D366;

ProjectileFlareSpritemaps_S_SI_SW_SIW_B:
    dw $000C,$01EF                                                       ;93D368;
    db $FA                                                               ;93D36C;
    dw $EC32,$01F7                                                       ;93D36D;
    db $FA                                                               ;93D371;
    dw $EC31,$01F7                                                       ;93D372;
    db $02                                                               ;93D376;
    dw $EC32,$01FF                                                       ;93D377;
    db $02                                                               ;93D37B;
    dw $EC31,$01F4                                                       ;93D37C;
    db $F5                                                               ;93D380;
    dw $EC32,$01FC                                                       ;93D381;
    db $F5                                                               ;93D385;
    dw $EC31,$01FC                                                       ;93D386;
    db $FD                                                               ;93D38A;
    dw $EC32,$0004                                                       ;93D38B;
    db $FD                                                               ;93D38F;
    dw $EC31,$01F2                                                       ;93D390;
    db $F8                                                               ;93D394;
    dw $EC32,$01FA                                                       ;93D395;
    db $F8                                                               ;93D399;
    dw $EC31,$01FA                                                       ;93D39A;
    db $00                                                               ;93D39E;
    dw $EC32,$0002                                                       ;93D39F;
    db $00                                                               ;93D3A3;
    dw $EC31                                                             ;93D3A4;

ProjectileFlareSpritemaps_S_SI_SW_SIW_C:
    dw $0004,$0006                                                       ;93D3A6;
    db $F8                                                               ;93D3AA;
    dw $AC32,$01FE                                                       ;93D3AB;
    db $F8                                                               ;93D3AF;
    dw $AC31,$01FE                                                       ;93D3B0;
    db $00                                                               ;93D3B4;
    dw $AC32,$01F6                                                       ;93D3B5;
    db $00                                                               ;93D3B9;
    dw $AC31                                                             ;93D3BA;

ProjectileFlareSpritemaps_S_SI_SW_SIW_D:
    dw $000C,$0006                                                       ;93D3BC;
    db $F8                                                               ;93D3C0;
    dw $AC32,$01FE                                                       ;93D3C1;
    db $F8                                                               ;93D3C5;
    dw $AC31,$01FE                                                       ;93D3C6;
    db $00                                                               ;93D3CA;
    dw $AC32,$01F6                                                       ;93D3CB;
    db $00                                                               ;93D3CF;
    dw $AC31,$000C                                                       ;93D3D0;
    db $FE                                                               ;93D3D4;
    dw $AC32,$0004                                                       ;93D3D5;
    db $FE                                                               ;93D3D9;
    dw $AC31,$0004                                                       ;93D3DA;
    db $06                                                               ;93D3DE;
    dw $AC32,$01FC                                                       ;93D3DF;
    db $06                                                               ;93D3E3;
    dw $AC31,$0000                                                       ;93D3E4;
    db $F2                                                               ;93D3E8;
    dw $AC32,$01F8                                                       ;93D3E9;
    db $F2                                                               ;93D3ED;
    dw $AC31,$01F8                                                       ;93D3EE;
    db $FA                                                               ;93D3F2;
    dw $AC32,$01F0                                                       ;93D3F3;
    db $FA                                                               ;93D3F7;
    dw $AC31                                                             ;93D3F8;

ProjectileFlareSpritemaps_S_SI_SW_SIW_E:
    dw $000C,$0006                                                       ;93D3FA;
    db $F8                                                               ;93D3FE;
    dw $AC32,$01FE                                                       ;93D3FF;
    db $F8                                                               ;93D403;
    dw $AC31,$01FE                                                       ;93D404;
    db $00                                                               ;93D408;
    dw $AC32,$01F6                                                       ;93D409;
    db $00                                                               ;93D40D;
    dw $AC31,$000F                                                       ;93D40E;
    db $01                                                               ;93D412;
    dw $AC32,$0007                                                       ;93D413;
    db $01                                                               ;93D417;
    dw $AC31,$0007                                                       ;93D418;
    db $09                                                               ;93D41C;
    dw $AC32,$01FF                                                       ;93D41D;
    db $09                                                               ;93D421;
    dw $AC31,$01FD                                                       ;93D422;
    db $EF                                                               ;93D426;
    dw $AC32,$01F5                                                       ;93D427;
    db $EF                                                               ;93D42B;
    dw $AC31,$01F5                                                       ;93D42C;
    db $F7                                                               ;93D430;
    dw $AC32,$01ED                                                       ;93D431;
    db $F7                                                               ;93D435;
    dw $AC31                                                             ;93D436;

ProjectileFlareSpritemaps_S_SI_SW_SIW_F:
    dw $000C,$0006                                                       ;93D438;
    db $F8                                                               ;93D43C;
    dw $AC32,$01FE                                                       ;93D43D;
    db $F8                                                               ;93D441;
    dw $AC31,$01FE                                                       ;93D442;
    db $00                                                               ;93D446;
    dw $AC32,$01F6                                                       ;93D447;
    db $00                                                               ;93D44B;
    dw $AC31,$0011                                                       ;93D44C;
    db $03                                                               ;93D450;
    dw $AC32,$0009                                                       ;93D451;
    db $03                                                               ;93D455;
    dw $AC31,$0009                                                       ;93D456;
    db $0B                                                               ;93D45A;
    dw $AC32,$0001                                                       ;93D45B;
    db $0B                                                               ;93D45F;
    dw $AC31,$01FB                                                       ;93D460;
    db $ED                                                               ;93D464;
    dw $AC32,$01F3                                                       ;93D465;
    db $ED                                                               ;93D469;
    dw $AC31,$01F3                                                       ;93D46A;
    db $F5                                                               ;93D46E;
    dw $AC32,$01EB                                                       ;93D46F;
    db $F5                                                               ;93D473;
    dw $AC31                                                             ;93D474;

ProjectileFlareSpritemaps_S_SI_SW_SIW_10:
    dw $000C,$0006                                                       ;93D476;
    db $F8                                                               ;93D47A;
    dw $AC32,$01FE                                                       ;93D47B;
    db $F8                                                               ;93D47F;
    dw $AC31,$01FE                                                       ;93D480;
    db $00                                                               ;93D484;
    dw $AC32,$01F6                                                       ;93D485;
    db $00                                                               ;93D489;
    dw $AC31,$0012                                                       ;93D48A;
    db $04                                                               ;93D48E;
    dw $AC32,$000A                                                       ;93D48F;
    db $04                                                               ;93D493;
    dw $AC31,$000A                                                       ;93D494;
    db $0C                                                               ;93D498;
    dw $AC32,$0002                                                       ;93D499;
    db $0C                                                               ;93D49D;
    dw $AC31,$01FA                                                       ;93D49E;
    db $EC                                                               ;93D4A2;
    dw $AC32,$01F2                                                       ;93D4A3;
    db $EC                                                               ;93D4A7;
    dw $AC31,$01F2                                                       ;93D4A8;
    db $F4                                                               ;93D4AC;
    dw $AC32,$01EA                                                       ;93D4AD;
    db $F4                                                               ;93D4B1;
    dw $AC31                                                             ;93D4B2;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_S_SI_SW_SIW_93D4B4:
    dw $000C,$0009                                                       ;93D4B4;
    db $FA                                                               ;93D4B8;
    dw $AC32,$0001                                                       ;93D4B9;
    db $FA                                                               ;93D4BD;
    dw $AC31,$0001                                                       ;93D4BE;
    db $02                                                               ;93D4C2;
    dw $AC32,$01F9                                                       ;93D4C3;
    db $02                                                               ;93D4C7;
    dw $AC31,$0004                                                       ;93D4C8;
    db $F5                                                               ;93D4CC;
    dw $AC32,$01FC                                                       ;93D4CD;
    db $F5                                                               ;93D4D1;
    dw $AC31,$01FC                                                       ;93D4D2;
    db $FD                                                               ;93D4D6;
    dw $AC32,$01F4                                                       ;93D4D7;
    db $FD                                                               ;93D4DB;
    dw $AC31,$0006                                                       ;93D4DC;
    db $F8                                                               ;93D4E0;
    dw $AC32,$01FE                                                       ;93D4E1;
    db $F8                                                               ;93D4E5;
    dw $AC31,$01FE                                                       ;93D4E6;
    db $00                                                               ;93D4EA;
    dw $AC32,$01F6                                                       ;93D4EB;
    db $00                                                               ;93D4EF;
    dw $AC31                                                             ;93D4F0;
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_S_SI_SW_SIW_11:
    dw $0004,$0006                                                       ;93D4F2;
    db $00                                                               ;93D4F6;
    dw $2C32,$01FE                                                       ;93D4F7;
    db $00                                                               ;93D4FB;
    dw $2C31,$01FE                                                       ;93D4FC;
    db $F8                                                               ;93D500;
    dw $2C32,$01F6                                                       ;93D501;
    db $F8                                                               ;93D505;
    dw $2C31                                                             ;93D506;

ProjectileFlareSpritemaps_S_SI_SW_SIW_12:
    dw $000C,$0006                                                       ;93D508;
    db $00                                                               ;93D50C;
    dw $2C32,$01FE                                                       ;93D50D;
    db $00                                                               ;93D511;
    dw $2C31,$01FE                                                       ;93D512;
    db $F8                                                               ;93D516;
    dw $2C32,$01F6                                                       ;93D517;
    db $F8                                                               ;93D51B;
    dw $2C31,$000C                                                       ;93D51C;
    db $FA                                                               ;93D520;
    dw $2C32,$0004                                                       ;93D521;
    db $FA                                                               ;93D525;
    dw $2C31,$0004                                                       ;93D526;
    db $F2                                                               ;93D52A;
    dw $2C32,$01FC                                                       ;93D52B;
    db $F2                                                               ;93D52F;
    dw $2C31,$0000                                                       ;93D530;
    db $06                                                               ;93D534;
    dw $2C32,$01F8                                                       ;93D535;
    db $06                                                               ;93D539;
    dw $2C31,$01F8                                                       ;93D53A;
    db $FE                                                               ;93D53E;
    dw $2C32,$01F0                                                       ;93D53F;
    db $FE                                                               ;93D543;
    dw $2C31                                                             ;93D544;

ProjectileFlareSpritemaps_S_SI_SW_SIW_13:
    dw $000C,$0006                                                       ;93D546;
    db $00                                                               ;93D54A;
    dw $2C32,$01FE                                                       ;93D54B;
    db $00                                                               ;93D54F;
    dw $2C31,$01FE                                                       ;93D550;
    db $F8                                                               ;93D554;
    dw $2C32,$01F6                                                       ;93D555;
    db $F8                                                               ;93D559;
    dw $2C31,$000F                                                       ;93D55A;
    db $F7                                                               ;93D55E;
    dw $2C32,$0007                                                       ;93D55F;
    db $F7                                                               ;93D563;
    dw $2C31,$0007                                                       ;93D564;
    db $EF                                                               ;93D568;
    dw $2C32,$01FF                                                       ;93D569;
    db $EF                                                               ;93D56D;
    dw $2C31,$01FD                                                       ;93D56E;
    db $09                                                               ;93D572;
    dw $2C32,$01F5                                                       ;93D573;
    db $09                                                               ;93D577;
    dw $2C31,$01F5                                                       ;93D578;
    db $01                                                               ;93D57C;
    dw $2C32,$01ED                                                       ;93D57D;
    db $01                                                               ;93D581;
    dw $2C31                                                             ;93D582;

ProjectileFlareSpritemaps_S_SI_SW_SIW_14:
    dw $000C,$0006                                                       ;93D584;
    db $00                                                               ;93D588;
    dw $2C32,$01FE                                                       ;93D589;
    db $00                                                               ;93D58D;
    dw $2C31,$01FE                                                       ;93D58E;
    db $F8                                                               ;93D592;
    dw $2C32,$01F6                                                       ;93D593;
    db $F8                                                               ;93D597;
    dw $2C31,$0011                                                       ;93D598;
    db $F5                                                               ;93D59C;
    dw $2C32,$0009                                                       ;93D59D;
    db $F5                                                               ;93D5A1;
    dw $2C31,$0009                                                       ;93D5A2;
    db $ED                                                               ;93D5A6;
    dw $2C32,$0001                                                       ;93D5A7;
    db $ED                                                               ;93D5AB;
    dw $2C31,$01FB                                                       ;93D5AC;
    db $0B                                                               ;93D5B0;
    dw $2C32,$01F3                                                       ;93D5B1;
    db $0B                                                               ;93D5B5;
    dw $2C31,$01F3                                                       ;93D5B6;
    db $03                                                               ;93D5BA;
    dw $2C32,$01EB                                                       ;93D5BB;
    db $03                                                               ;93D5BF;
    dw $2C31                                                             ;93D5C0;

ProjectileFlareSpritemaps_S_SI_SW_SIW_15:
    dw $000C,$0006                                                       ;93D5C2;
    db $00                                                               ;93D5C6;
    dw $2C32,$01FE                                                       ;93D5C7;
    db $00                                                               ;93D5CB;
    dw $2C31,$01FE                                                       ;93D5CC;
    db $F8                                                               ;93D5D0;
    dw $2C32,$01F6                                                       ;93D5D1;
    db $F8                                                               ;93D5D5;
    dw $2C31,$0012                                                       ;93D5D6;
    db $F4                                                               ;93D5DA;
    dw $2C32,$000A                                                       ;93D5DB;
    db $F4                                                               ;93D5DF;
    dw $2C31,$000A                                                       ;93D5E0;
    db $EC                                                               ;93D5E4;
    dw $2C32,$0002                                                       ;93D5E5;
    db $EC                                                               ;93D5E9;
    dw $2C31,$01FA                                                       ;93D5EA;
    db $0C                                                               ;93D5EE;
    dw $2C32,$01F2                                                       ;93D5EF;
    db $0C                                                               ;93D5F3;
    dw $2C31,$01F2                                                       ;93D5F4;
    db $04                                                               ;93D5F8;
    dw $2C32,$01EA                                                       ;93D5F9;
    db $04                                                               ;93D5FD;
    dw $2C31                                                             ;93D5FE;

ProjectileFlareSpritemaps_S_SI_SW_SIW_16:
    dw $000C,$0009                                                       ;93D600;
    db $FE                                                               ;93D604;
    dw $2C32,$0001                                                       ;93D605;
    db $FE                                                               ;93D609;
    dw $2C31,$0001                                                       ;93D60A;
    db $F6                                                               ;93D60E;
    dw $2C32,$01F9                                                       ;93D60F;
    db $F6                                                               ;93D613;
    dw $2C31,$0004                                                       ;93D614;
    db $03                                                               ;93D618;
    dw $2C32,$01FC                                                       ;93D619;
    db $03                                                               ;93D61D;
    dw $2C31,$01FC                                                       ;93D61E;
    db $FB                                                               ;93D622;
    dw $2C32,$01F4                                                       ;93D623;
    db $FB                                                               ;93D627;
    dw $2C31,$0006                                                       ;93D628;
    db $00                                                               ;93D62C;
    dw $2C32,$01FE                                                       ;93D62D;
    db $00                                                               ;93D631;
    dw $2C31,$01FE                                                       ;93D632;
    db $F8                                                               ;93D636;
    dw $2C32,$01F6                                                       ;93D637;
    db $F8                                                               ;93D63B;
    dw $2C31                                                             ;93D63C;

ProjectileFlareSpritemaps_S_SI_SW_SIW_17:
    dw $0002,$01FC                                                       ;93D63E;
    db $F8                                                               ;93D642;
    dw $AC33,$01FC                                                       ;93D643;
    db $00                                                               ;93D647;
    dw $AC33                                                             ;93D648;

ProjectileFlareSpritemaps_S_SI_SW_SIW_18:
    dw $0006,$0000                                                       ;93D64A;
    db $F8                                                               ;93D64E;
    dw $AC33,$0000                                                       ;93D64F;
    db $00                                                               ;93D653;
    dw $AC33,$01F8                                                       ;93D654;
    db $F8                                                               ;93D658;
    dw $AC33,$01F8                                                       ;93D659;
    db $00                                                               ;93D65D;
    dw $AC33,$01FC                                                       ;93D65E;
    db $F8                                                               ;93D662;
    dw $AC33,$01FC                                                       ;93D663;
    db $00                                                               ;93D667;
    dw $AC33                                                             ;93D668;

ProjectileFlareSpritemaps_S_SI_SW_SIW_19:
    dw $0006,$0004                                                       ;93D66A;
    db $F8                                                               ;93D66E;
    dw $AC33,$0004                                                       ;93D66F;
    db $00                                                               ;93D673;
    dw $AC33,$01F4                                                       ;93D674;
    db $F8                                                               ;93D678;
    dw $AC33,$01F4                                                       ;93D679;
    db $00                                                               ;93D67D;
    dw $AC33,$01FC                                                       ;93D67E;
    db $F8                                                               ;93D682;
    dw $AC33,$01FC                                                       ;93D683;
    db $00                                                               ;93D687;
    dw $AC33                                                             ;93D688;

ProjectileFlareSpritemaps_S_SI_SW_SIW_1A:
    dw $0006,$0009                                                       ;93D68A;
    db $F8                                                               ;93D68E;
    dw $AC33,$0009                                                       ;93D68F;
    db $00                                                               ;93D693;
    dw $AC33,$01EF                                                       ;93D694;
    db $F8                                                               ;93D698;
    dw $AC33,$01EF                                                       ;93D699;
    db $00                                                               ;93D69D;
    dw $AC33,$01FC                                                       ;93D69E;
    db $F8                                                               ;93D6A2;
    dw $AC33,$01FC                                                       ;93D6A3;
    db $00                                                               ;93D6A7;
    dw $AC33                                                             ;93D6A8;

ProjectileFlareSpritemaps_S_SI_SW_SIW_1B:
    dw $0006,$000B                                                       ;93D6AA;
    db $F8                                                               ;93D6AE;
    dw $AC33,$000B                                                       ;93D6AF;
    db $00                                                               ;93D6B3;
    dw $AC33,$01ED                                                       ;93D6B4;
    db $F8                                                               ;93D6B8;
    dw $AC33,$01ED                                                       ;93D6B9;
    db $00                                                               ;93D6BD;
    dw $AC33,$01FC                                                       ;93D6BE;
    db $F8                                                               ;93D6C2;
    dw $AC33,$01FC                                                       ;93D6C3;
    db $00                                                               ;93D6C7;
    dw $AC33                                                             ;93D6C8;

ProjectileFlareSpritemaps_S_SI_SW_SIW_1C:
    dw $0006,$000C                                                       ;93D6CA;
    db $F8                                                               ;93D6CE;
    dw $AC33,$000C                                                       ;93D6CF;
    db $00                                                               ;93D6D3;
    dw $AC33,$01EC                                                       ;93D6D4;
    db $F8                                                               ;93D6D8;
    dw $AC33,$01EC                                                       ;93D6D9;
    db $00                                                               ;93D6DD;
    dw $AC33,$01FC                                                       ;93D6DE;
    db $F8                                                               ;93D6E2;
    dw $AC33,$01FC                                                       ;93D6E3;
    db $00                                                               ;93D6E7;
    dw $AC33                                                             ;93D6E8;

ProjectileFlareSpritemaps_S_SI_SW_SIW_1D:
    dw $0002,$0000                                                       ;93D6EA;
    db $FC                                                               ;93D6EE;
    dw $2C30,$01F8                                                       ;93D6EF;
    db $FC                                                               ;93D6F3;
    dw $2C30                                                             ;93D6F4;

ProjectileFlareSpritemaps_S_SI_SW_SIW_1E:
    dw $0006,$0000                                                       ;93D6F6;
    db $00                                                               ;93D6FA;
    dw $2C30,$01F8                                                       ;93D6FB;
    db $00                                                               ;93D6FF;
    dw $2C30,$0000                                                       ;93D700;
    db $FC                                                               ;93D704;
    dw $2C30,$01F8                                                       ;93D705;
    db $FC                                                               ;93D709;
    dw $2C30,$0000                                                       ;93D70A;
    db $F8                                                               ;93D70E;
    dw $2C30,$01F8                                                       ;93D70F;
    db $F8                                                               ;93D713;
    dw $2C30                                                             ;93D714;

ProjectileFlareSpritemaps_S_SI_SW_SIW_1F:
    dw $0006,$0000                                                       ;93D716;
    db $F4                                                               ;93D71A;
    dw $2C30,$0000                                                       ;93D71B;
    db $FC                                                               ;93D71F;
    dw $2C30,$0000                                                       ;93D720;
    db $04                                                               ;93D724;
    dw $2C30,$01F8                                                       ;93D725;
    db $04                                                               ;93D729;
    dw $2C30,$01F8                                                       ;93D72A;
    db $FC                                                               ;93D72E;
    dw $2C30,$01F8                                                       ;93D72F;
    db $F4                                                               ;93D733;
    dw $2C30                                                             ;93D734;

ProjectileFlareSpritemaps_S_SI_SW_SIW_20:
    dw $0006,$0000                                                       ;93D736;
    db $EF                                                               ;93D73A;
    dw $2C30,$0000                                                       ;93D73B;
    db $FC                                                               ;93D73F;
    dw $2C30,$0000                                                       ;93D740;
    db $09                                                               ;93D744;
    dw $2C30,$01F8                                                       ;93D745;
    db $09                                                               ;93D749;
    dw $2C30,$01F8                                                       ;93D74A;
    db $FC                                                               ;93D74E;
    dw $2C30,$01F8                                                       ;93D74F;
    db $EF                                                               ;93D753;
    dw $2C30                                                             ;93D754;

ProjectileFlareSpritemaps_S_SI_SW_SIW_21:
    dw $0006,$0000                                                       ;93D756;
    db $ED                                                               ;93D75A;
    dw $2C30,$0000                                                       ;93D75B;
    db $FC                                                               ;93D75F;
    dw $2C30,$0000                                                       ;93D760;
    db $0B                                                               ;93D764;
    dw $2C30,$01F8                                                       ;93D765;
    db $0B                                                               ;93D769;
    dw $2C30,$01F8                                                       ;93D76A;
    db $FC                                                               ;93D76E;
    dw $2C30,$01F8                                                       ;93D76F;
    db $ED                                                               ;93D773;
    dw $2C30                                                             ;93D774;

ProjectileFlareSpritemaps_S_SI_SW_SIW_22:
    dw $0006,$0000                                                       ;93D776;
    db $EC                                                               ;93D77A;
    dw $2C30,$0000                                                       ;93D77B;
    db $FC                                                               ;93D77F;
    dw $2C30,$0000                                                       ;93D780;
    db $0C                                                               ;93D784;
    dw $2C30,$01F8                                                       ;93D785;
    db $0C                                                               ;93D789;
    dw $2C30,$01F8                                                       ;93D78A;
    db $FC                                                               ;93D78E;
    dw $2C30,$01F8                                                       ;93D78F;
    db $EC                                                               ;93D793;
    dw $2C30                                                             ;93D794;

ProjectileFlareSpritemaps_S_SI_SW_SIW_23:
    dw $0002,$01FC                                                       ;93D796;
    db $00                                                               ;93D79A;
    dw $2C33,$01FC                                                       ;93D79B;
    db $F8                                                               ;93D79F;
    dw $2C33                                                             ;93D7A0;

ProjectileFlareSpritemaps_S_SI_SW_SIW_24:
    dw $0006,$0000                                                       ;93D7A2;
    db $00                                                               ;93D7A6;
    dw $2C33,$0000                                                       ;93D7A7;
    db $F8                                                               ;93D7AB;
    dw $2C33,$01F8                                                       ;93D7AC;
    db $00                                                               ;93D7B0;
    dw $2C33,$01F8                                                       ;93D7B1;
    db $F8                                                               ;93D7B5;
    dw $2C33,$01FC                                                       ;93D7B6;
    db $00                                                               ;93D7BA;
    dw $2C33,$01FC                                                       ;93D7BB;
    db $F8                                                               ;93D7BF;
    dw $2C33                                                             ;93D7C0;

ProjectileFlareSpritemaps_S_SI_SW_SIW_25:
    dw $0006,$0004                                                       ;93D7C2;
    db $00                                                               ;93D7C6;
    dw $2C33,$0004                                                       ;93D7C7;
    db $F8                                                               ;93D7CB;
    dw $2C33,$01F4                                                       ;93D7CC;
    db $00                                                               ;93D7D0;
    dw $2C33,$01F4                                                       ;93D7D1;
    db $F8                                                               ;93D7D5;
    dw $2C33,$01FC                                                       ;93D7D6;
    db $00                                                               ;93D7DA;
    dw $2C33,$01FC                                                       ;93D7DB;
    db $F8                                                               ;93D7DF;
    dw $2C33                                                             ;93D7E0;

ProjectileFlareSpritemaps_S_SI_SW_SIW_26:
    dw $0006,$0009                                                       ;93D7E2;
    db $00                                                               ;93D7E6;
    dw $2C33,$0009                                                       ;93D7E7;
    db $F8                                                               ;93D7EB;
    dw $2C33,$01EF                                                       ;93D7EC;
    db $00                                                               ;93D7F0;
    dw $2C33,$01EF                                                       ;93D7F1;
    db $F8                                                               ;93D7F5;
    dw $2C33,$01FC                                                       ;93D7F6;
    db $00                                                               ;93D7FA;
    dw $2C33,$01FC                                                       ;93D7FB;
    db $F8                                                               ;93D7FF;
    dw $2C33                                                             ;93D800;

ProjectileFlareSpritemaps_S_SI_SW_SIW_27:
    dw $0006,$000B                                                       ;93D802;
    db $00                                                               ;93D806;
    dw $2C33,$000B                                                       ;93D807;
    db $F8                                                               ;93D80B;
    dw $2C33,$01ED                                                       ;93D80C;
    db $00                                                               ;93D810;
    dw $2C33,$01ED                                                       ;93D811;
    db $F8                                                               ;93D815;
    dw $2C33,$01FC                                                       ;93D816;
    db $00                                                               ;93D81A;
    dw $2C33,$01FC                                                       ;93D81B;
    db $F8                                                               ;93D81F;
    dw $2C33                                                             ;93D820;

ProjectileFlareSpritemaps_S_SI_SW_SIW_28:
    dw $0006,$000C                                                       ;93D822;
    db $00                                                               ;93D826;
    dw $2C33,$000C                                                       ;93D827;
    db $F8                                                               ;93D82B;
    dw $2C33,$01EC                                                       ;93D82C;
    db $00                                                               ;93D830;
    dw $2C33,$01EC                                                       ;93D831;
    db $F8                                                               ;93D835;
    dw $2C33,$01FC                                                       ;93D836;
    db $00                                                               ;93D83A;
    dw $2C33,$01FC                                                       ;93D83B;
    db $F8                                                               ;93D83F;
    dw $2C33                                                             ;93D840;

ProjectileFlareSpritemaps_S_SI_SW_SIW_29:
    dw $0002,$01F8                                                       ;93D842;
    db $FC                                                               ;93D846;
    dw $6C30,$0000                                                       ;93D847;
    db $FC                                                               ;93D84B;
    dw $6C30                                                             ;93D84C;

ProjectileFlareSpritemaps_S_SI_SW_SIW_2A:
    dw $0006,$0000                                                       ;93D84E;
    db $00                                                               ;93D852;
    dw $2C30,$01F8                                                       ;93D853;
    db $00                                                               ;93D857;
    dw $2C30,$0000                                                       ;93D858;
    db $FC                                                               ;93D85C;
    dw $2C30,$01F8                                                       ;93D85D;
    db $FC                                                               ;93D861;
    dw $2C30,$0000                                                       ;93D862;
    db $F8                                                               ;93D866;
    dw $2C30,$01F8                                                       ;93D867;
    db $F8                                                               ;93D86B;
    dw $2C30                                                             ;93D86C;

ProjectileFlareSpritemaps_S_SI_SW_SIW_2B:
    dw $0006,$01F8                                                       ;93D86E;
    db $F4                                                               ;93D872;
    dw $6C30,$01F8                                                       ;93D873;
    db $FC                                                               ;93D877;
    dw $6C30,$01F8                                                       ;93D878;
    db $04                                                               ;93D87C;
    dw $6C30,$0000                                                       ;93D87D;
    db $04                                                               ;93D881;
    dw $6C30,$0000                                                       ;93D882;
    db $FC                                                               ;93D886;
    dw $6C30,$0000                                                       ;93D887;
    db $F4                                                               ;93D88B;
    dw $6C30                                                             ;93D88C;

ProjectileFlareSpritemaps_S_SI_SW_SIW_2C:
    dw $0006,$01F8                                                       ;93D88E;
    db $EF                                                               ;93D892;
    dw $6C30,$01F8                                                       ;93D893;
    db $FC                                                               ;93D897;
    dw $6C30,$01F8                                                       ;93D898;
    db $09                                                               ;93D89C;
    dw $6C30,$0000                                                       ;93D89D;
    db $09                                                               ;93D8A1;
    dw $6C30,$0000                                                       ;93D8A2;
    db $FC                                                               ;93D8A6;
    dw $6C30,$0000                                                       ;93D8A7;
    db $EF                                                               ;93D8AB;
    dw $6C30                                                             ;93D8AC;

ProjectileFlareSpritemaps_S_SI_SW_SIW_2D:
    dw $0006,$01F8                                                       ;93D8AE;
    db $ED                                                               ;93D8B2;
    dw $6C30,$01F8                                                       ;93D8B3;
    db $FC                                                               ;93D8B7;
    dw $6C30,$01F8                                                       ;93D8B8;
    db $0B                                                               ;93D8BC;
    dw $6C30,$0000                                                       ;93D8BD;
    db $0B                                                               ;93D8C1;
    dw $6C30,$0000                                                       ;93D8C2;
    db $FC                                                               ;93D8C6;
    dw $6C30,$0000                                                       ;93D8C7;
    db $ED                                                               ;93D8CB;
    dw $6C30                                                             ;93D8CC;

ProjectileFlareSpritemaps_S_SI_SW_SIW_2E:
    dw $0006,$01F8                                                       ;93D8CE;
    db $EC                                                               ;93D8D2;
    dw $6C30,$01F8                                                       ;93D8D3;
    db $FC                                                               ;93D8D7;
    dw $6C30,$01F8                                                       ;93D8D8;
    db $0C                                                               ;93D8DC;
    dw $6C30,$0000                                                       ;93D8DD;
    db $0C                                                               ;93D8E1;
    dw $6C30,$0000                                                       ;93D8E2;
    db $FC                                                               ;93D8E6;
    dw $6C30,$0000                                                       ;93D8E7;
    db $EC                                                               ;93D8EB;
    dw $6C30                                                             ;93D8EC;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_0:
    dw $0004,$0008                                                       ;93D8EE;
    db $FC                                                               ;93D8F2;
    dw $2C34,$0000                                                       ;93D8F3;
    db $FC                                                               ;93D8F7;
    dw $2C34,$01F8                                                       ;93D8F8;
    db $FC                                                               ;93D8FC;
    dw $2C34,$01F0                                                       ;93D8FD;
    db $FC                                                               ;93D901;
    dw $2C34                                                             ;93D902;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1:
    dw $000C,$0008                                                       ;93D904;
    db $FC                                                               ;93D908;
    dw $2C34,$0000                                                       ;93D909;
    db $FC                                                               ;93D90D;
    dw $2C34,$01F8                                                       ;93D90E;
    db $FC                                                               ;93D912;
    dw $2C34,$01F0                                                       ;93D913;
    db $FC                                                               ;93D917;
    dw $2C34,$0008                                                       ;93D918;
    db $00                                                               ;93D91C;
    dw $2C34,$0000                                                       ;93D91D;
    db $00                                                               ;93D921;
    dw $2C34,$01F8                                                       ;93D922;
    db $00                                                               ;93D926;
    dw $2C34,$01F0                                                       ;93D927;
    db $00                                                               ;93D92B;
    dw $2C34,$0008                                                       ;93D92C;
    db $F8                                                               ;93D930;
    dw $2C34,$0000                                                       ;93D931;
    db $F8                                                               ;93D935;
    dw $2C34,$01F8                                                       ;93D936;
    db $F8                                                               ;93D93A;
    dw $2C34,$01F0                                                       ;93D93B;
    db $F8                                                               ;93D93F;
    dw $2C34                                                             ;93D940;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2:
    dw $000C,$0008                                                       ;93D942;
    db $04                                                               ;93D946;
    dw $2C34,$0000                                                       ;93D947;
    db $04                                                               ;93D94B;
    dw $2C34,$01F8                                                       ;93D94C;
    db $04                                                               ;93D950;
    dw $2C34,$01F0                                                       ;93D951;
    db $04                                                               ;93D955;
    dw $2C34,$0008                                                       ;93D956;
    db $FC                                                               ;93D95A;
    dw $2C34,$0000                                                       ;93D95B;
    db $FC                                                               ;93D95F;
    dw $2C34,$01F8                                                       ;93D960;
    db $FC                                                               ;93D964;
    dw $2C34,$01F0                                                       ;93D965;
    db $FC                                                               ;93D969;
    dw $2C34,$0008                                                       ;93D96A;
    db $F4                                                               ;93D96E;
    dw $2C34,$0000                                                       ;93D96F;
    db $F4                                                               ;93D973;
    dw $2C34,$01F8                                                       ;93D974;
    db $F4                                                               ;93D978;
    dw $2C34,$01F0                                                       ;93D979;
    db $F4                                                               ;93D97D;
    dw $2C34                                                             ;93D97E;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3:
    dw $000C,$0008                                                       ;93D980;
    db $09                                                               ;93D984;
    dw $2C34,$0000                                                       ;93D985;
    db $09                                                               ;93D989;
    dw $2C34,$01F8                                                       ;93D98A;
    db $09                                                               ;93D98E;
    dw $2C34,$01F0                                                       ;93D98F;
    db $09                                                               ;93D993;
    dw $2C34,$0008                                                       ;93D994;
    db $FC                                                               ;93D998;
    dw $2C34,$0000                                                       ;93D999;
    db $FC                                                               ;93D99D;
    dw $2C34,$01F8                                                       ;93D99E;
    db $FC                                                               ;93D9A2;
    dw $2C34,$01F0                                                       ;93D9A3;
    db $FC                                                               ;93D9A7;
    dw $2C34,$0008                                                       ;93D9A8;
    db $EF                                                               ;93D9AC;
    dw $2C34,$0000                                                       ;93D9AD;
    db $EF                                                               ;93D9B1;
    dw $2C34,$01F8                                                       ;93D9B2;
    db $EF                                                               ;93D9B6;
    dw $2C34,$01F0                                                       ;93D9B7;
    db $EF                                                               ;93D9BB;
    dw $2C34                                                             ;93D9BC;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4:
    dw $000C,$0008                                                       ;93D9BE;
    db $0B                                                               ;93D9C2;
    dw $2C34,$0000                                                       ;93D9C3;
    db $0B                                                               ;93D9C7;
    dw $2C34,$01F8                                                       ;93D9C8;
    db $0B                                                               ;93D9CC;
    dw $2C34,$01F0                                                       ;93D9CD;
    db $0B                                                               ;93D9D1;
    dw $2C34,$0008                                                       ;93D9D2;
    db $FC                                                               ;93D9D6;
    dw $2C34,$0000                                                       ;93D9D7;
    db $FC                                                               ;93D9DB;
    dw $2C34,$01F8                                                       ;93D9DC;
    db $FC                                                               ;93D9E0;
    dw $2C34,$01F0                                                       ;93D9E1;
    db $FC                                                               ;93D9E5;
    dw $2C34,$0008                                                       ;93D9E6;
    db $ED                                                               ;93D9EA;
    dw $2C34,$0000                                                       ;93D9EB;
    db $ED                                                               ;93D9EF;
    dw $2C34,$01F8                                                       ;93D9F0;
    db $ED                                                               ;93D9F4;
    dw $2C34,$01F0                                                       ;93D9F5;
    db $ED                                                               ;93D9F9;
    dw $2C34                                                             ;93D9FA;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5:
    dw $000C,$0008                                                       ;93D9FC;
    db $0C                                                               ;93DA00;
    dw $2C34,$0000                                                       ;93DA01;
    db $0C                                                               ;93DA05;
    dw $2C34,$01F8                                                       ;93DA06;
    db $0C                                                               ;93DA0A;
    dw $2C34,$01F0                                                       ;93DA0B;
    db $0C                                                               ;93DA0F;
    dw $2C34,$0008                                                       ;93DA10;
    db $FC                                                               ;93DA14;
    dw $2C34,$0000                                                       ;93DA15;
    db $FC                                                               ;93DA19;
    dw $2C34,$01F8                                                       ;93DA1A;
    db $FC                                                               ;93DA1E;
    dw $2C34,$01F0                                                       ;93DA1F;
    db $FC                                                               ;93DA23;
    dw $2C34,$0008                                                       ;93DA24;
    db $EC                                                               ;93DA28;
    dw $2C34,$0000                                                       ;93DA29;
    db $EC                                                               ;93DA2D;
    dw $2C34,$01F8                                                       ;93DA2E;
    db $EC                                                               ;93DA32;
    dw $2C34,$01F0                                                       ;93DA33;
    db $EC                                                               ;93DA37;
    dw $2C34                                                             ;93DA38;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_6:
    dw $0004,$01FC                                                       ;93DA3A;
    db $F0                                                               ;93DA3E;
    dw $2C37,$01FC                                                       ;93DA3F;
    db $08                                                               ;93DA43;
    dw $2C37,$01FC                                                       ;93DA44;
    db $00                                                               ;93DA48;
    dw $2C37,$01FC                                                       ;93DA49;
    db $F8                                                               ;93DA4D;
    dw $2C37                                                             ;93DA4E;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_7:
    dw $000C,$01FC                                                       ;93DA50;
    db $F0                                                               ;93DA54;
    dw $2C37,$01FC                                                       ;93DA55;
    db $F8                                                               ;93DA59;
    dw $2C37,$01FC                                                       ;93DA5A;
    db $00                                                               ;93DA5E;
    dw $2C37,$01FC                                                       ;93DA5F;
    db $08                                                               ;93DA63;
    dw $2C37,$0000                                                       ;93DA64;
    db $08                                                               ;93DA68;
    dw $2C37,$0000                                                       ;93DA69;
    db $00                                                               ;93DA6D;
    dw $2C37,$0000                                                       ;93DA6E;
    db $F8                                                               ;93DA72;
    dw $2C37,$0000                                                       ;93DA73;
    db $F0                                                               ;93DA77;
    dw $2C37,$01F8                                                       ;93DA78;
    db $F0                                                               ;93DA7C;
    dw $2C37,$01F8                                                       ;93DA7D;
    db $08                                                               ;93DA81;
    dw $2C37,$01F8                                                       ;93DA82;
    db $00                                                               ;93DA86;
    dw $2C37,$01F8                                                       ;93DA87;
    db $F8                                                               ;93DA8B;
    dw $2C37                                                             ;93DA8C;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_8:
    dw $000C,$0008                                                       ;93DA8E;
    db $08                                                               ;93DA92;
    dw $2C37,$0008                                                       ;93DA93;
    db $00                                                               ;93DA97;
    dw $2C37,$0008                                                       ;93DA98;
    db $F8                                                               ;93DA9C;
    dw $2C37,$0008                                                       ;93DA9D;
    db $F0                                                               ;93DAA1;
    dw $2C37,$01F0                                                       ;93DAA2;
    db $08                                                               ;93DAA6;
    dw $2C37,$01F0                                                       ;93DAA7;
    db $00                                                               ;93DAAB;
    dw $2C37,$01F0                                                       ;93DAAC;
    db $F8                                                               ;93DAB0;
    dw $2C37,$01F0                                                       ;93DAB1;
    db $F0                                                               ;93DAB5;
    dw $2C37,$01FC                                                       ;93DAB6;
    db $08                                                               ;93DABA;
    dw $2C37,$01FC                                                       ;93DABB;
    db $00                                                               ;93DABF;
    dw $2C37,$01FC                                                       ;93DAC0;
    db $F8                                                               ;93DAC4;
    dw $2C37,$01FC                                                       ;93DAC5;
    db $F0                                                               ;93DAC9;
    dw $2C37                                                             ;93DACA;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_9:
    dw $000C,$000D                                                       ;93DACC;
    db $08                                                               ;93DAD0;
    dw $2C37,$000D                                                       ;93DAD1;
    db $00                                                               ;93DAD5;
    dw $2C37,$000D                                                       ;93DAD6;
    db $F8                                                               ;93DADA;
    dw $2C37,$000D                                                       ;93DADB;
    db $F0                                                               ;93DADF;
    dw $2C37,$01EB                                                       ;93DAE0;
    db $08                                                               ;93DAE4;
    dw $2C37,$01EB                                                       ;93DAE5;
    db $00                                                               ;93DAE9;
    dw $2C37,$01EB                                                       ;93DAEA;
    db $F8                                                               ;93DAEE;
    dw $2C37,$01EB                                                       ;93DAEF;
    db $F0                                                               ;93DAF3;
    dw $2C37,$01FC                                                       ;93DAF4;
    db $08                                                               ;93DAF8;
    dw $2C37,$01FC                                                       ;93DAF9;
    db $00                                                               ;93DAFD;
    dw $2C37,$01FC                                                       ;93DAFE;
    db $F8                                                               ;93DB02;
    dw $2C37,$01FC                                                       ;93DB03;
    db $F0                                                               ;93DB07;
    dw $2C37                                                             ;93DB08;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_A:
    dw $000C,$000F                                                       ;93DB0A;
    db $08                                                               ;93DB0E;
    dw $2C37,$000F                                                       ;93DB0F;
    db $00                                                               ;93DB13;
    dw $2C37,$000F                                                       ;93DB14;
    db $F8                                                               ;93DB18;
    dw $2C37,$000F                                                       ;93DB19;
    db $F0                                                               ;93DB1D;
    dw $2C37,$01E9                                                       ;93DB1E;
    db $08                                                               ;93DB22;
    dw $2C37,$01E9                                                       ;93DB23;
    db $00                                                               ;93DB27;
    dw $2C37,$01E9                                                       ;93DB28;
    db $F8                                                               ;93DB2C;
    dw $2C37,$01E9                                                       ;93DB2D;
    db $F0                                                               ;93DB31;
    dw $2C37,$01FC                                                       ;93DB32;
    db $08                                                               ;93DB36;
    dw $2C37,$01FC                                                       ;93DB37;
    db $00                                                               ;93DB3B;
    dw $2C37,$01FC                                                       ;93DB3C;
    db $F8                                                               ;93DB40;
    dw $2C37,$01FC                                                       ;93DB41;
    db $F0                                                               ;93DB45;
    dw $2C37                                                             ;93DB46;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_B:
    dw $000C,$0010                                                       ;93DB48;
    db $08                                                               ;93DB4C;
    dw $2C37,$0010                                                       ;93DB4D;
    db $00                                                               ;93DB51;
    dw $2C37,$0010                                                       ;93DB52;
    db $F8                                                               ;93DB56;
    dw $2C37,$0010                                                       ;93DB57;
    db $F0                                                               ;93DB5B;
    dw $2C37,$01E8                                                       ;93DB5C;
    db $08                                                               ;93DB60;
    dw $2C37,$01E8                                                       ;93DB61;
    db $00                                                               ;93DB65;
    dw $2C37,$01E8                                                       ;93DB66;
    db $F8                                                               ;93DB6A;
    dw $2C37,$01E8                                                       ;93DB6B;
    db $F0                                                               ;93DB6F;
    dw $2C37,$01FC                                                       ;93DB70;
    db $08                                                               ;93DB74;
    dw $2C37,$01FC                                                       ;93DB75;
    db $00                                                               ;93DB79;
    dw $2C37,$01FC                                                       ;93DB7A;
    db $F8                                                               ;93DB7E;
    dw $2C37,$01FC                                                       ;93DB7F;
    db $F0                                                               ;93DB83;
    dw $2C37                                                             ;93DB84;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_C:
    dw $0006,$0004                                                       ;93DB86;
    db $08                                                               ;93DB8A;
    dw $EC36,$01F4                                                       ;93DB8B;
    db $F0                                                               ;93DB8F;
    dw $2C36,$01FC                                                       ;93DB90;
    db $F8                                                               ;93DB94;
    dw $EC35,$0004                                                       ;93DB95;
    db $00                                                               ;93DB99;
    dw $EC35,$01FC                                                       ;93DB9A;
    db $00                                                               ;93DB9E;
    dw $2C35,$01F4                                                       ;93DB9F;
    db $F8                                                               ;93DBA3;
    dw $2C35                                                             ;93DBA4;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_D:
    dw $0012,$0004                                                       ;93DBA6;
    db $08                                                               ;93DBAA;
    dw $EC36,$01F4                                                       ;93DBAB;
    db $F0                                                               ;93DBAF;
    dw $2C36,$01FC                                                       ;93DBB0;
    db $F8                                                               ;93DBB4;
    dw $EC35,$0004                                                       ;93DBB5;
    db $00                                                               ;93DBB9;
    dw $EC35,$01FC                                                       ;93DBBA;
    db $00                                                               ;93DBBE;
    dw $2C35,$01F4                                                       ;93DBBF;
    db $F8                                                               ;93DBC3;
    dw $2C35,$0006                                                       ;93DBC4;
    db $05                                                               ;93DBC8;
    dw $EC36,$01F6                                                       ;93DBC9;
    db $ED                                                               ;93DBCD;
    dw $2C36,$01FE                                                       ;93DBCE;
    db $F5                                                               ;93DBD2;
    dw $EC35,$0006                                                       ;93DBD3;
    db $FD                                                               ;93DBD7;
    dw $EC35,$01FE                                                       ;93DBD8;
    db $FD                                                               ;93DBDC;
    dw $2C35,$01F6                                                       ;93DBDD;
    db $F5                                                               ;93DBE1;
    dw $2C35,$0002                                                       ;93DBE2;
    db $0B                                                               ;93DBE6;
    dw $EC36,$01F2                                                       ;93DBE7;
    db $F3                                                               ;93DBEB;
    dw $2C36,$01FA                                                       ;93DBEC;
    db $FB                                                               ;93DBF0;
    dw $EC35,$0002                                                       ;93DBF1;
    db $03                                                               ;93DBF5;
    dw $EC35,$01FA                                                       ;93DBF6;
    db $03                                                               ;93DBFA;
    dw $2C35,$01F2                                                       ;93DBFB;
    db $FB                                                               ;93DBFF;
    dw $2C35                                                             ;93DC00;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_E:
    dw $0012,$0004                                                       ;93DC02;
    db $08                                                               ;93DC06;
    dw $EC36,$01F4                                                       ;93DC07;
    db $F0                                                               ;93DC0B;
    dw $2C36,$01FC                                                       ;93DC0C;
    db $F8                                                               ;93DC10;
    dw $EC35,$0004                                                       ;93DC11;
    db $00                                                               ;93DC15;
    dw $EC35,$01FC                                                       ;93DC16;
    db $00                                                               ;93DC1A;
    dw $2C35,$01F4                                                       ;93DC1B;
    db $F8                                                               ;93DC1F;
    dw $2C35,$01FE                                                       ;93DC20;
    db $0F                                                               ;93DC24;
    dw $EC36,$01EE                                                       ;93DC25;
    db $F7                                                               ;93DC29;
    dw $2C36,$01F6                                                       ;93DC2A;
    db $FF                                                               ;93DC2E;
    dw $EC35,$01FE                                                       ;93DC2F;
    db $07                                                               ;93DC33;
    dw $EC35,$01F6                                                       ;93DC34;
    db $07                                                               ;93DC38;
    dw $2C35,$01EE                                                       ;93DC39;
    db $FF                                                               ;93DC3D;
    dw $2C35,$000A                                                       ;93DC3E;
    db $01                                                               ;93DC42;
    dw $EC36,$01FA                                                       ;93DC43;
    db $E9                                                               ;93DC47;
    dw $2C36,$0002                                                       ;93DC48;
    db $F1                                                               ;93DC4C;
    dw $EC35,$000A                                                       ;93DC4D;
    db $F9                                                               ;93DC51;
    dw $EC35,$0002                                                       ;93DC52;
    db $F9                                                               ;93DC56;
    dw $2C35,$01FA                                                       ;93DC57;
    db $F1                                                               ;93DC5B;
    dw $2C35                                                             ;93DC5C;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_F:
    dw $0012,$0004                                                       ;93DC5E;
    db $08                                                               ;93DC62;
    dw $EC36,$01F4                                                       ;93DC63;
    db $F0                                                               ;93DC67;
    dw $2C36,$01FC                                                       ;93DC68;
    db $F8                                                               ;93DC6C;
    dw $EC35,$0004                                                       ;93DC6D;
    db $00                                                               ;93DC71;
    dw $EC35,$01FC                                                       ;93DC72;
    db $00                                                               ;93DC76;
    dw $2C35,$01F4                                                       ;93DC77;
    db $F8                                                               ;93DC7B;
    dw $2C35,$01FB                                                       ;93DC7C;
    db $12                                                               ;93DC80;
    dw $EC36,$01EB                                                       ;93DC81;
    db $FA                                                               ;93DC85;
    dw $2C36,$01F3                                                       ;93DC86;
    db $02                                                               ;93DC8A;
    dw $EC35,$01FB                                                       ;93DC8B;
    db $0A                                                               ;93DC8F;
    dw $EC35,$01F3                                                       ;93DC90;
    db $0A                                                               ;93DC94;
    dw $2C35,$01EB                                                       ;93DC95;
    db $02                                                               ;93DC99;
    dw $2C35,$000D                                                       ;93DC9A;
    db $FE                                                               ;93DC9E;
    dw $EC36,$01FD                                                       ;93DC9F;
    db $E6                                                               ;93DCA3;
    dw $2C36,$0005                                                       ;93DCA4;
    db $EE                                                               ;93DCA8;
    dw $EC35,$000D                                                       ;93DCA9;
    db $F6                                                               ;93DCAD;
    dw $EC35,$0005                                                       ;93DCAE;
    db $F6                                                               ;93DCB2;
    dw $2C35,$01FD                                                       ;93DCB3;
    db $EE                                                               ;93DCB7;
    dw $2C35                                                             ;93DCB8;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_10:
    dw $0012,$0004                                                       ;93DCBA;
    db $08                                                               ;93DCBE;
    dw $EC36,$01F4                                                       ;93DCBF;
    db $F0                                                               ;93DCC3;
    dw $2C36,$01FC                                                       ;93DCC4;
    db $F8                                                               ;93DCC8;
    dw $EC35,$0004                                                       ;93DCC9;
    db $00                                                               ;93DCCD;
    dw $EC35,$01FC                                                       ;93DCCE;
    db $00                                                               ;93DCD2;
    dw $2C35,$01F4                                                       ;93DCD3;
    db $F8                                                               ;93DCD7;
    dw $2C35,$01F7                                                       ;93DCD8;
    db $17                                                               ;93DCDC;
    dw $EC36,$01E7                                                       ;93DCDD;
    db $FF                                                               ;93DCE1;
    dw $2C36,$01EF                                                       ;93DCE2;
    db $07                                                               ;93DCE6;
    dw $EC35,$01F7                                                       ;93DCE7;
    db $0F                                                               ;93DCEB;
    dw $EC35,$01EF                                                       ;93DCEC;
    db $0F                                                               ;93DCF0;
    dw $2C35,$01E7                                                       ;93DCF1;
    db $07                                                               ;93DCF5;
    dw $2C35,$0011                                                       ;93DCF6;
    db $F9                                                               ;93DCFA;
    dw $EC36,$0001                                                       ;93DCFB;
    db $E1                                                               ;93DCFF;
    dw $2C36,$0009                                                       ;93DD00;
    db $E9                                                               ;93DD04;
    dw $EC35,$0011                                                       ;93DD05;
    db $F1                                                               ;93DD09;
    dw $EC35,$0009                                                       ;93DD0A;
    db $F1                                                               ;93DD0E;
    dw $2C35,$0001                                                       ;93DD0F;
    db $E9                                                               ;93DD13;
    dw $2C35                                                             ;93DD14;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_11:
    dw $0012,$0004                                                       ;93DD16;
    db $08                                                               ;93DD1A;
    dw $EC36,$01F4                                                       ;93DD1B;
    db $F0                                                               ;93DD1F;
    dw $2C36,$01FC                                                       ;93DD20;
    db $F8                                                               ;93DD24;
    dw $EC35,$0004                                                       ;93DD25;
    db $00                                                               ;93DD29;
    dw $EC35,$01FC                                                       ;93DD2A;
    db $00                                                               ;93DD2E;
    dw $2C35,$01F4                                                       ;93DD2F;
    db $F8                                                               ;93DD33;
    dw $2C35,$01F6                                                       ;93DD34;
    db $17                                                               ;93DD38;
    dw $EC36,$01E6                                                       ;93DD39;
    db $FF                                                               ;93DD3D;
    dw $2C36,$01EE                                                       ;93DD3E;
    db $07                                                               ;93DD42;
    dw $EC35,$01F6                                                       ;93DD43;
    db $0F                                                               ;93DD47;
    dw $EC35,$01EE                                                       ;93DD48;
    db $0F                                                               ;93DD4C;
    dw $2C35,$01E6                                                       ;93DD4D;
    db $07                                                               ;93DD51;
    dw $2C35,$0012                                                       ;93DD52;
    db $F9                                                               ;93DD56;
    dw $EC36,$0002                                                       ;93DD57;
    db $E1                                                               ;93DD5B;
    dw $2C36,$000A                                                       ;93DD5C;
    db $E9                                                               ;93DD60;
    dw $EC35,$0012                                                       ;93DD61;
    db $F1                                                               ;93DD65;
    dw $EC35,$000A                                                       ;93DD66;
    db $F1                                                               ;93DD6A;
    dw $2C35,$0002                                                       ;93DD6B;
    db $E9                                                               ;93DD6F;
    dw $2C35                                                             ;93DD70;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_12:
    dw $0006,$01F4                                                       ;93DD72;
    db $08                                                               ;93DD76;
    dw $AC36,$0004                                                       ;93DD77;
    db $F0                                                               ;93DD7B;
    dw $6C36,$01FC                                                       ;93DD7C;
    db $F8                                                               ;93DD80;
    dw $AC35,$01F4                                                       ;93DD81;
    db $00                                                               ;93DD85;
    dw $AC35,$01FC                                                       ;93DD86;
    db $00                                                               ;93DD8A;
    dw $6C35,$0004                                                       ;93DD8B;
    db $F8                                                               ;93DD8F;
    dw $6C35                                                             ;93DD90;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_13:
    dw $0012,$01F4                                                       ;93DD92;
    db $08                                                               ;93DD96;
    dw $AC36,$0004                                                       ;93DD97;
    db $F0                                                               ;93DD9B;
    dw $6C36,$01FC                                                       ;93DD9C;
    db $F8                                                               ;93DDA0;
    dw $AC35,$01F4                                                       ;93DDA1;
    db $00                                                               ;93DDA5;
    dw $AC35,$01FC                                                       ;93DDA6;
    db $00                                                               ;93DDAA;
    dw $6C35,$0004                                                       ;93DDAB;
    db $F8                                                               ;93DDAF;
    dw $6C35,$01F2                                                       ;93DDB0;
    db $06                                                               ;93DDB4;
    dw $AC36,$0002                                                       ;93DDB5;
    db $EE                                                               ;93DDB9;
    dw $6C36,$01FA                                                       ;93DDBA;
    db $F6                                                               ;93DDBE;
    dw $AC35,$01F2                                                       ;93DDBF;
    db $FE                                                               ;93DDC3;
    dw $AC35,$01FA                                                       ;93DDC4;
    db $FE                                                               ;93DDC8;
    dw $6C35,$0002                                                       ;93DDC9;
    db $F6                                                               ;93DDCD;
    dw $6C35,$01F6                                                       ;93DDCE;
    db $0B                                                               ;93DDD2;
    dw $AC36,$0006                                                       ;93DDD3;
    db $F3                                                               ;93DDD7;
    dw $6C36,$01FE                                                       ;93DDD8;
    db $FB                                                               ;93DDDC;
    dw $AC35,$01F6                                                       ;93DDDD;
    db $03                                                               ;93DDE1;
    dw $AC35,$01FE                                                       ;93DDE2;
    db $03                                                               ;93DDE6;
    dw $6C35,$0006                                                       ;93DDE7;
    db $FB                                                               ;93DDEB;
    dw $6C35                                                             ;93DDEC;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_14:
    dw $0012,$01F4                                                       ;93DDEE;
    db $08                                                               ;93DDF2;
    dw $AC36,$0004                                                       ;93DDF3;
    db $F0                                                               ;93DDF7;
    dw $6C36,$01FC                                                       ;93DDF8;
    db $F8                                                               ;93DDFC;
    dw $AC35,$01F4                                                       ;93DDFD;
    db $00                                                               ;93DE01;
    dw $AC35,$01FC                                                       ;93DE02;
    db $00                                                               ;93DE06;
    dw $6C35,$0004                                                       ;93DE07;
    db $F8                                                               ;93DE0B;
    dw $6C35,$01FA                                                       ;93DE0C;
    db $0F                                                               ;93DE10;
    dw $AC36,$000A                                                       ;93DE11;
    db $F7                                                               ;93DE15;
    dw $6C36,$0002                                                       ;93DE16;
    db $FF                                                               ;93DE1A;
    dw $AC35,$01FA                                                       ;93DE1B;
    db $07                                                               ;93DE1F;
    dw $AC35,$0002                                                       ;93DE20;
    db $07                                                               ;93DE24;
    dw $6C35,$000A                                                       ;93DE25;
    db $FF                                                               ;93DE29;
    dw $6C35,$01EE                                                       ;93DE2A;
    db $01                                                               ;93DE2E;
    dw $AC36,$01FE                                                       ;93DE2F;
    db $E9                                                               ;93DE33;
    dw $6C36,$01F6                                                       ;93DE34;
    db $F1                                                               ;93DE38;
    dw $AC35,$01EE                                                       ;93DE39;
    db $F9                                                               ;93DE3D;
    dw $AC35,$01F6                                                       ;93DE3E;
    db $F9                                                               ;93DE42;
    dw $6C35,$01FE                                                       ;93DE43;
    db $F1                                                               ;93DE47;
    dw $6C35                                                             ;93DE48;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_15:
    dw $0012,$01F4                                                       ;93DE4A;
    db $08                                                               ;93DE4E;
    dw $AC36,$0004                                                       ;93DE4F;
    db $F0                                                               ;93DE53;
    dw $6C36,$01FC                                                       ;93DE54;
    db $F8                                                               ;93DE58;
    dw $AC35,$01F4                                                       ;93DE59;
    db $00                                                               ;93DE5D;
    dw $AC35,$01FC                                                       ;93DE5E;
    db $00                                                               ;93DE62;
    dw $6C35,$0004                                                       ;93DE63;
    db $F8                                                               ;93DE67;
    dw $6C35,$01FD                                                       ;93DE68;
    db $12                                                               ;93DE6C;
    dw $AC36,$000D                                                       ;93DE6D;
    db $FA                                                               ;93DE71;
    dw $6C36,$0005                                                       ;93DE72;
    db $02                                                               ;93DE76;
    dw $AC35,$01FD                                                       ;93DE77;
    db $0A                                                               ;93DE7B;
    dw $AC35,$0005                                                       ;93DE7C;
    db $0A                                                               ;93DE80;
    dw $6C35,$000D                                                       ;93DE81;
    db $02                                                               ;93DE85;
    dw $6C35,$01EB                                                       ;93DE86;
    db $FE                                                               ;93DE8A;
    dw $AC36,$01FB                                                       ;93DE8B;
    db $E6                                                               ;93DE8F;
    dw $6C36,$01F3                                                       ;93DE90;
    db $EE                                                               ;93DE94;
    dw $AC35,$01EB                                                       ;93DE95;
    db $F6                                                               ;93DE99;
    dw $AC35,$01F3                                                       ;93DE9A;
    db $F6                                                               ;93DE9E;
    dw $6C35,$01FB                                                       ;93DE9F;
    db $EE                                                               ;93DEA3;
    dw $6C35                                                             ;93DEA4;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_16:
    dw $0012,$01F4                                                       ;93DEA6;
    db $08                                                               ;93DEAA;
    dw $AC36,$0004                                                       ;93DEAB;
    db $F0                                                               ;93DEAF;
    dw $6C36,$01FC                                                       ;93DEB0;
    db $F8                                                               ;93DEB4;
    dw $AC35,$01F4                                                       ;93DEB5;
    db $00                                                               ;93DEB9;
    dw $AC35,$01FC                                                       ;93DEBA;
    db $00                                                               ;93DEBE;
    dw $6C35,$0004                                                       ;93DEBF;
    db $F8                                                               ;93DEC3;
    dw $6C35,$0001                                                       ;93DEC4;
    db $16                                                               ;93DEC8;
    dw $AC36,$0011                                                       ;93DEC9;
    db $FE                                                               ;93DECD;
    dw $6C36,$0009                                                       ;93DECE;
    db $06                                                               ;93DED2;
    dw $AC35,$0001                                                       ;93DED3;
    db $0E                                                               ;93DED7;
    dw $AC35,$0009                                                       ;93DED8;
    db $0E                                                               ;93DEDC;
    dw $6C35,$0011                                                       ;93DEDD;
    db $06                                                               ;93DEE1;
    dw $6C35,$01E7                                                       ;93DEE2;
    db $FA                                                               ;93DEE6;
    dw $AC36,$01F7                                                       ;93DEE7;
    db $E2                                                               ;93DEEB;
    dw $6C36,$01EF                                                       ;93DEEC;
    db $EA                                                               ;93DEF0;
    dw $AC35,$01E7                                                       ;93DEF1;
    db $F2                                                               ;93DEF5;
    dw $AC35,$01EF                                                       ;93DEF6;
    db $F2                                                               ;93DEFA;
    dw $6C35,$01F7                                                       ;93DEFB;
    db $EA                                                               ;93DEFF;
    dw $6C35                                                             ;93DF00;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_17:
    dw $0012,$01F4                                                       ;93DF02;
    db $08                                                               ;93DF06;
    dw $AC36,$0004                                                       ;93DF07;
    db $F0                                                               ;93DF0B;
    dw $6C36,$01FC                                                       ;93DF0C;
    db $F8                                                               ;93DF10;
    dw $AC35,$01F4                                                       ;93DF11;
    db $00                                                               ;93DF15;
    dw $AC35,$01FC                                                       ;93DF16;
    db $00                                                               ;93DF1A;
    dw $6C35,$0004                                                       ;93DF1B;
    db $F8                                                               ;93DF1F;
    dw $6C35,$0002                                                       ;93DF20;
    db $17                                                               ;93DF24;
    dw $AC36,$0012                                                       ;93DF25;
    db $FF                                                               ;93DF29;
    dw $6C36,$000A                                                       ;93DF2A;
    db $07                                                               ;93DF2E;
    dw $AC35,$0002                                                       ;93DF2F;
    db $0F                                                               ;93DF33;
    dw $AC35,$000A                                                       ;93DF34;
    db $0F                                                               ;93DF38;
    dw $6C35,$0012                                                       ;93DF39;
    db $07                                                               ;93DF3D;
    dw $6C35,$01E6                                                       ;93DF3E;
    db $F9                                                               ;93DF42;
    dw $AC36,$01F6                                                       ;93DF43;
    db $E1                                                               ;93DF47;
    dw $6C36,$01EE                                                       ;93DF48;
    db $E9                                                               ;93DF4C;
    dw $AC35,$01E6                                                       ;93DF4D;
    db $F1                                                               ;93DF51;
    dw $AC35,$01EE                                                       ;93DF52;
    db $F1                                                               ;93DF56;
    dw $6C35,$01F6                                                       ;93DF57;
    db $E9                                                               ;93DF5B;
    dw $6C35                                                             ;93DF5C;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_18:
    dw $0006,$01FE                                                       ;93DF5E;
    db $F4                                                               ;93DF62;
    dw $6C32,$0006                                                       ;93DF63;
    db $F4                                                               ;93DF67;
    dw $6C31,$01EE                                                       ;93DF68;
    db $04                                                               ;93DF6C;
    dw $6C32,$01F6                                                       ;93DF6D;
    db $04                                                               ;93DF71;
    dw $6C31,$01F6                                                       ;93DF72;
    db $FC                                                               ;93DF76;
    dw $6C32,$01FE                                                       ;93DF77;
    db $FC                                                               ;93DF7B;
    dw $6C31                                                             ;93DF7C;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_19:
    dw $0012,$01F8                                                       ;93DF7E;
    db $EE                                                               ;93DF82;
    dw $6C32,$0000                                                       ;93DF83;
    db $EE                                                               ;93DF87;
    dw $6C31,$01FE                                                       ;93DF88;
    db $F4                                                               ;93DF8C;
    dw $6C32,$0006                                                       ;93DF8D;
    db $F4                                                               ;93DF91;
    dw $6C31,$0004                                                       ;93DF92;
    db $FA                                                               ;93DF96;
    dw $6C32,$000C                                                       ;93DF97;
    db $FA                                                               ;93DF9B;
    dw $6C31,$01EE                                                       ;93DF9C;
    db $04                                                               ;93DFA0;
    dw $6C32,$01F6                                                       ;93DFA1;
    db $04                                                               ;93DFA5;
    dw $6C31,$01F6                                                       ;93DFA6;
    db $FC                                                               ;93DFAA;
    dw $6C32,$01FE                                                       ;93DFAB;
    db $FC                                                               ;93DFAF;
    dw $6C31,$01E8                                                       ;93DFB0;
    db $FE                                                               ;93DFB4;
    dw $6C32,$01F0                                                       ;93DFB5;
    db $FE                                                               ;93DFB9;
    dw $6C31,$01F0                                                       ;93DFBA;
    db $F6                                                               ;93DFBE;
    dw $6C32,$01F8                                                       ;93DFBF;
    db $F6                                                               ;93DFC3;
    dw $6C31,$01F4                                                       ;93DFC4;
    db $0A                                                               ;93DFC8;
    dw $6C32,$01FC                                                       ;93DFC9;
    db $0A                                                               ;93DFCD;
    dw $6C31,$01FC                                                       ;93DFCE;
    db $02                                                               ;93DFD2;
    dw $6C32,$0004                                                       ;93DFD3;
    db $02                                                               ;93DFD7;
    dw $6C31                                                             ;93DFD8;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1A:
    dw $0012,$0007                                                       ;93DFDA;
    db $FD                                                               ;93DFDE;
    dw $6C32,$000F                                                       ;93DFDF;
    db $FD                                                               ;93DFE3;
    dw $6C31,$01FE                                                       ;93DFE4;
    db $F4                                                               ;93DFE8;
    dw $6C32,$0006                                                       ;93DFE9;
    db $F4                                                               ;93DFED;
    dw $6C31,$01F5                                                       ;93DFEE;
    db $EB                                                               ;93DFF2;
    dw $6C32,$01FD                                                       ;93DFF3;
    db $EB                                                               ;93DFF7;
    dw $6C31,$01EE                                                       ;93DFF8;
    db $04                                                               ;93DFFC;
    dw $6C32,$01F6                                                       ;93DFFD;
    db $04                                                               ;93E001;
    dw $6C31,$01F6                                                       ;93E002;
    db $FC                                                               ;93E006;
    dw $6C32,$01FE                                                       ;93E007;
    db $FC                                                               ;93E00B;
    dw $6C31,$01E5                                                       ;93E00C;
    db $FB                                                               ;93E010;
    dw $6C32,$01ED                                                       ;93E011;
    db $FB                                                               ;93E015;
    dw $6C31,$01ED                                                       ;93E016;
    db $F3                                                               ;93E01A;
    dw $6C32,$01F5                                                       ;93E01B;
    db $F3                                                               ;93E01F;
    dw $6C31,$01F7                                                       ;93E020;
    db $0D                                                               ;93E024;
    dw $6C32,$01FF                                                       ;93E025;
    db $0D                                                               ;93E029;
    dw $6C31,$01FF                                                       ;93E02A;
    db $05                                                               ;93E02E;
    dw $6C32,$0007                                                       ;93E02F;
    db $05                                                               ;93E033;
    dw $6C31                                                             ;93E034;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1B:
    dw $0012,$0009                                                       ;93E036;
    db $FF                                                               ;93E03A;
    dw $6C32,$0011                                                       ;93E03B;
    db $FF                                                               ;93E03F;
    dw $6C31,$01F3                                                       ;93E040;
    db $E9                                                               ;93E044;
    dw $6C32,$01FB                                                       ;93E045;
    db $E9                                                               ;93E049;
    dw $6C31,$01FE                                                       ;93E04A;
    db $F4                                                               ;93E04E;
    dw $6C32,$0006                                                       ;93E04F;
    db $F4                                                               ;93E053;
    dw $6C31,$01EE                                                       ;93E054;
    db $04                                                               ;93E058;
    dw $6C32,$01F6                                                       ;93E059;
    db $04                                                               ;93E05D;
    dw $6C31,$01F6                                                       ;93E05E;
    db $FC                                                               ;93E062;
    dw $6C32,$01FE                                                       ;93E063;
    db $FC                                                               ;93E067;
    dw $6C31,$01E3                                                       ;93E068;
    db $F9                                                               ;93E06C;
    dw $6C32,$01EB                                                       ;93E06D;
    db $F9                                                               ;93E071;
    dw $6C31,$01EB                                                       ;93E072;
    db $F1                                                               ;93E076;
    dw $6C32,$01F3                                                       ;93E077;
    db $F1                                                               ;93E07B;
    dw $6C31,$01F9                                                       ;93E07C;
    db $0F                                                               ;93E080;
    dw $6C32,$0001                                                       ;93E081;
    db $0F                                                               ;93E085;
    dw $6C31,$0001                                                       ;93E086;
    db $07                                                               ;93E08A;
    dw $6C32,$0009                                                       ;93E08B;
    db $07                                                               ;93E08F;
    dw $6C31                                                             ;93E090;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1C:
    dw $0012,$01F2                                                       ;93E092;
    db $E8                                                               ;93E096;
    dw $6C32,$01FA                                                       ;93E097;
    db $E8                                                               ;93E09B;
    dw $6C31,$000A                                                       ;93E09C;
    db $00                                                               ;93E0A0;
    dw $6C32,$0012                                                       ;93E0A1;
    db $00                                                               ;93E0A5;
    dw $6C31,$01FE                                                       ;93E0A6;
    db $F4                                                               ;93E0AA;
    dw $6C32,$0006                                                       ;93E0AB;
    db $F4                                                               ;93E0AF;
    dw $6C31,$01EE                                                       ;93E0B0;
    db $04                                                               ;93E0B4;
    dw $6C32,$01F6                                                       ;93E0B5;
    db $04                                                               ;93E0B9;
    dw $6C31,$01F6                                                       ;93E0BA;
    db $FC                                                               ;93E0BE;
    dw $6C32,$01FE                                                       ;93E0BF;
    db $FC                                                               ;93E0C3;
    dw $6C31,$01E2                                                       ;93E0C4;
    db $F8                                                               ;93E0C8;
    dw $6C32,$01EA                                                       ;93E0C9;
    db $F8                                                               ;93E0CD;
    dw $6C31,$01EA                                                       ;93E0CE;
    db $F0                                                               ;93E0D2;
    dw $6C32,$01F2                                                       ;93E0D3;
    db $F0                                                               ;93E0D7;
    dw $6C31,$01FA                                                       ;93E0D8;
    db $10                                                               ;93E0DC;
    dw $6C32,$0002                                                       ;93E0DD;
    db $10                                                               ;93E0E1;
    dw $6C31,$0002                                                       ;93E0E2;
    db $08                                                               ;93E0E6;
    dw $6C32,$000A                                                       ;93E0E7;
    db $08                                                               ;93E0EB;
    dw $6C31                                                             ;93E0EC;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1D:
    dw $0012,$0000                                                       ;93E0EE;
    db $F7                                                               ;93E0F2;
    dw $6C32,$0008                                                       ;93E0F3;
    db $F7                                                               ;93E0F7;
    dw $6C31,$01FE                                                       ;93E0F8;
    db $F4                                                               ;93E0FC;
    dw $6C32,$0006                                                       ;93E0FD;
    db $F4                                                               ;93E101;
    dw $6C31,$01FB                                                       ;93E102;
    db $F2                                                               ;93E106;
    dw $6C32,$0003                                                       ;93E107;
    db $F2                                                               ;93E10B;
    dw $6C31,$01EB                                                       ;93E10C;
    db $02                                                               ;93E110;
    dw $6C32,$01F3                                                       ;93E111;
    db $02                                                               ;93E115;
    dw $6C31,$01F3                                                       ;93E116;
    db $FA                                                               ;93E11A;
    dw $6C32,$01FB                                                       ;93E11B;
    db $FA                                                               ;93E11F;
    dw $6C31,$01F0                                                       ;93E120;
    db $07                                                               ;93E124;
    dw $6C32,$01F8                                                       ;93E125;
    db $07                                                               ;93E129;
    dw $6C31,$01F8                                                       ;93E12A;
    db $FF                                                               ;93E12E;
    dw $6C32,$0000                                                       ;93E12F;
    db $FF                                                               ;93E133;
    dw $6C31,$01EE                                                       ;93E134;
    db $04                                                               ;93E138;
    dw $6C32,$01F6                                                       ;93E139;
    db $04                                                               ;93E13D;
    dw $6C31,$01F6                                                       ;93E13E;
    db $FC                                                               ;93E142;
    dw $6C32,$01FE                                                       ;93E143;
    db $FC                                                               ;93E147;
    dw $6C31                                                             ;93E148;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1E:
    dw $0006,$01FE                                                       ;93E14A;
    db $04                                                               ;93E14E;
    dw $EC32,$0006                                                       ;93E14F;
    db $04                                                               ;93E153;
    dw $EC31,$01EE                                                       ;93E154;
    db $F4                                                               ;93E158;
    dw $EC32,$01F6                                                       ;93E159;
    db $F4                                                               ;93E15D;
    dw $EC31,$01F6                                                       ;93E15E;
    db $FC                                                               ;93E162;
    dw $EC32,$01FE                                                       ;93E163;
    db $FC                                                               ;93E167;
    dw $EC31                                                             ;93E168;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1F:
    dw $0012,$0004                                                       ;93E16A;
    db $FE                                                               ;93E16E;
    dw $EC32,$000C                                                       ;93E16F;
    db $FE                                                               ;93E173;
    dw $EC31,$01FE                                                       ;93E174;
    db $04                                                               ;93E178;
    dw $EC32,$0006                                                       ;93E179;
    db $04                                                               ;93E17D;
    dw $EC31,$01F8                                                       ;93E17E;
    db $0A                                                               ;93E182;
    dw $EC32,$0000                                                       ;93E183;
    db $0A                                                               ;93E187;
    dw $EC31,$01EE                                                       ;93E188;
    db $F4                                                               ;93E18C;
    dw $EC32,$01F6                                                       ;93E18D;
    db $F4                                                               ;93E191;
    dw $EC31,$01F6                                                       ;93E192;
    db $FC                                                               ;93E196;
    dw $EC32,$01FE                                                       ;93E197;
    db $FC                                                               ;93E19B;
    dw $EC31,$01E8                                                       ;93E19C;
    db $FA                                                               ;93E1A0;
    dw $EC32,$01F0                                                       ;93E1A1;
    db $FA                                                               ;93E1A5;
    dw $EC31,$01F0                                                       ;93E1A6;
    db $02                                                               ;93E1AA;
    dw $EC32,$01F8                                                       ;93E1AB;
    db $02                                                               ;93E1AF;
    dw $EC31,$01F4                                                       ;93E1B0;
    db $EE                                                               ;93E1B4;
    dw $EC32,$01FC                                                       ;93E1B5;
    db $EE                                                               ;93E1B9;
    dw $EC31,$01FC                                                       ;93E1BA;
    db $F6                                                               ;93E1BE;
    dw $EC32,$0004                                                       ;93E1BF;
    db $F6                                                               ;93E1C3;
    dw $EC31                                                             ;93E1C4;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_20:
    dw $0012,$01F5                                                       ;93E1C6;
    db $0D                                                               ;93E1CA;
    dw $EC32,$01FD                                                       ;93E1CB;
    db $0D                                                               ;93E1CF;
    dw $EC31,$0007                                                       ;93E1D0;
    db $FB                                                               ;93E1D4;
    dw $EC32,$000F                                                       ;93E1D5;
    db $FB                                                               ;93E1D9;
    dw $EC31,$01FE                                                       ;93E1DA;
    db $04                                                               ;93E1DE;
    dw $EC32,$0006                                                       ;93E1DF;
    db $04                                                               ;93E1E3;
    dw $EC31,$01EE                                                       ;93E1E4;
    db $F4                                                               ;93E1E8;
    dw $EC32,$01F6                                                       ;93E1E9;
    db $F4                                                               ;93E1ED;
    dw $EC31,$01F6                                                       ;93E1EE;
    db $FC                                                               ;93E1F2;
    dw $EC32,$01FE                                                       ;93E1F3;
    db $FC                                                               ;93E1F7;
    dw $EC31,$01E5                                                       ;93E1F8;
    db $FD                                                               ;93E1FC;
    dw $EC32,$01ED                                                       ;93E1FD;
    db $FD                                                               ;93E201;
    dw $EC31,$01ED                                                       ;93E202;
    db $05                                                               ;93E206;
    dw $EC32,$01F5                                                       ;93E207;
    db $05                                                               ;93E20B;
    dw $EC31,$01F7                                                       ;93E20C;
    db $EB                                                               ;93E210;
    dw $EC32,$01FF                                                       ;93E211;
    db $EB                                                               ;93E215;
    dw $EC31,$01FF                                                       ;93E216;
    db $F3                                                               ;93E21A;
    dw $EC32,$0007                                                       ;93E21B;
    db $F3                                                               ;93E21F;
    dw $EC31                                                             ;93E220;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_21:
    dw $0012,$01F3                                                       ;93E222;
    db $0F                                                               ;93E226;
    dw $EC32,$01FB                                                       ;93E227;
    db $0F                                                               ;93E22B;
    dw $EC31,$0009                                                       ;93E22C;
    db $F9                                                               ;93E230;
    dw $EC32,$0011                                                       ;93E231;
    db $F9                                                               ;93E235;
    dw $EC31,$01FE                                                       ;93E236;
    db $04                                                               ;93E23A;
    dw $EC32,$0006                                                       ;93E23B;
    db $04                                                               ;93E23F;
    dw $EC31,$01EE                                                       ;93E240;
    db $F4                                                               ;93E244;
    dw $EC32,$01F6                                                       ;93E245;
    db $F4                                                               ;93E249;
    dw $EC31,$01F6                                                       ;93E24A;
    db $FC                                                               ;93E24E;
    dw $EC32,$01FE                                                       ;93E24F;
    db $FC                                                               ;93E253;
    dw $EC31,$01E3                                                       ;93E254;
    db $FF                                                               ;93E258;
    dw $EC32,$01EB                                                       ;93E259;
    db $FF                                                               ;93E25D;
    dw $EC31,$01EB                                                       ;93E25E;
    db $07                                                               ;93E262;
    dw $EC32,$01F3                                                       ;93E263;
    db $07                                                               ;93E267;
    dw $EC31,$01F9                                                       ;93E268;
    db $E9                                                               ;93E26C;
    dw $EC32,$0001                                                       ;93E26D;
    db $E9                                                               ;93E271;
    dw $EC31,$0001                                                       ;93E272;
    db $F1                                                               ;93E276;
    dw $EC32,$0009                                                       ;93E277;
    db $F1                                                               ;93E27B;
    dw $EC31                                                             ;93E27C;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_22:
    dw $0012,$01F2                                                       ;93E27E;
    db $10                                                               ;93E282;
    dw $EC32,$01FA                                                       ;93E283;
    db $10                                                               ;93E287;
    dw $EC31,$01FE                                                       ;93E288;
    db $04                                                               ;93E28C;
    dw $EC32,$0006                                                       ;93E28D;
    db $04                                                               ;93E291;
    dw $EC31,$000A                                                       ;93E292;
    db $F8                                                               ;93E296;
    dw $EC32,$0012                                                       ;93E297;
    db $F8                                                               ;93E29B;
    dw $EC31,$01EE                                                       ;93E29C;
    db $F4                                                               ;93E2A0;
    dw $EC32,$01F6                                                       ;93E2A1;
    db $F4                                                               ;93E2A5;
    dw $EC31,$01F6                                                       ;93E2A6;
    db $FC                                                               ;93E2AA;
    dw $EC32,$01FE                                                       ;93E2AB;
    db $FC                                                               ;93E2AF;
    dw $EC31,$01E2                                                       ;93E2B0;
    db $00                                                               ;93E2B4;
    dw $EC32,$01EA                                                       ;93E2B5;
    db $00                                                               ;93E2B9;
    dw $EC31,$01EA                                                       ;93E2BA;
    db $08                                                               ;93E2BE;
    dw $EC32,$01F2                                                       ;93E2BF;
    db $08                                                               ;93E2C3;
    dw $EC31,$01FA                                                       ;93E2C4;
    db $E8                                                               ;93E2C8;
    dw $EC32,$0002                                                       ;93E2C9;
    db $E8                                                               ;93E2CD;
    dw $EC31,$0002                                                       ;93E2CE;
    db $F0                                                               ;93E2D2;
    dw $EC32,$000A                                                       ;93E2D3;
    db $F0                                                               ;93E2D7;
    dw $EC31                                                             ;93E2D8;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_23:
    dw $0012,$01FE                                                       ;93E2DA;
    db $04                                                               ;93E2DE;
    dw $EC32,$0006                                                       ;93E2DF;
    db $04                                                               ;93E2E3;
    dw $EC31,$0000                                                       ;93E2E4;
    db $01                                                               ;93E2E8;
    dw $EC32,$0008                                                       ;93E2E9;
    db $01                                                               ;93E2ED;
    dw $EC31,$01FB                                                       ;93E2EE;
    db $06                                                               ;93E2F2;
    dw $EC32,$0003                                                       ;93E2F3;
    db $06                                                               ;93E2F7;
    dw $EC31,$01EB                                                       ;93E2F8;
    db $F6                                                               ;93E2FC;
    dw $EC32,$01F3                                                       ;93E2FD;
    db $F6                                                               ;93E301;
    dw $EC31,$01F3                                                       ;93E302;
    db $FE                                                               ;93E306;
    dw $EC32,$01FB                                                       ;93E307;
    db $FE                                                               ;93E30B;
    dw $EC31,$01F0                                                       ;93E30C;
    db $F1                                                               ;93E310;
    dw $EC32,$01F8                                                       ;93E311;
    db $F1                                                               ;93E315;
    dw $EC31,$01F8                                                       ;93E316;
    db $F9                                                               ;93E31A;
    dw $EC32,$0000                                                       ;93E31B;
    db $F9                                                               ;93E31F;
    dw $EC31,$01EE                                                       ;93E320;
    db $F4                                                               ;93E324;
    dw $EC32,$01F6                                                       ;93E325;
    db $F4                                                               ;93E329;
    dw $EC31,$01F6                                                       ;93E32A;
    db $FC                                                               ;93E32E;
    dw $EC32,$01FE                                                       ;93E32F;
    db $FC                                                               ;93E333;
    dw $EC31                                                             ;93E334;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_24:
    dw $0006,$01FA                                                       ;93E336;
    db $04                                                               ;93E33A;
    dw $AC32,$01F2                                                       ;93E33B;
    db $04                                                               ;93E33F;
    dw $AC31,$000A                                                       ;93E340;
    db $F4                                                               ;93E344;
    dw $AC32,$0002                                                       ;93E345;
    db $F4                                                               ;93E349;
    dw $AC31,$0002                                                       ;93E34A;
    db $FC                                                               ;93E34E;
    dw $AC32,$01FA                                                       ;93E34F;
    db $FC                                                               ;93E353;
    dw $AC31                                                             ;93E354;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_25:
    dw $0012,$01F4                                                       ;93E356;
    db $FE                                                               ;93E35A;
    dw $AC32,$01EC                                                       ;93E35B;
    db $FE                                                               ;93E35F;
    dw $AC31,$01FA                                                       ;93E360;
    db $04                                                               ;93E364;
    dw $AC32,$01F2                                                       ;93E365;
    db $04                                                               ;93E369;
    dw $AC31,$0000                                                       ;93E36A;
    db $0A                                                               ;93E36E;
    dw $AC32,$01F8                                                       ;93E36F;
    db $0A                                                               ;93E373;
    dw $AC31,$000A                                                       ;93E374;
    db $F4                                                               ;93E378;
    dw $AC32,$0002                                                       ;93E379;
    db $F4                                                               ;93E37D;
    dw $AC31,$0002                                                       ;93E37E;
    db $FC                                                               ;93E382;
    dw $AC32,$01FA                                                       ;93E383;
    db $FC                                                               ;93E387;
    dw $AC31,$0010                                                       ;93E388;
    db $FA                                                               ;93E38C;
    dw $AC32,$0008                                                       ;93E38D;
    db $FA                                                               ;93E391;
    dw $AC31,$0008                                                       ;93E392;
    db $02                                                               ;93E396;
    dw $AC32,$0000                                                       ;93E397;
    db $02                                                               ;93E39B;
    dw $AC31,$0004                                                       ;93E39C;
    db $EE                                                               ;93E3A0;
    dw $AC32,$01FC                                                       ;93E3A1;
    db $EE                                                               ;93E3A5;
    dw $AC31,$01FC                                                       ;93E3A6;
    db $F6                                                               ;93E3AA;
    dw $AC32,$01F4                                                       ;93E3AB;
    db $F6                                                               ;93E3AF;
    dw $AC31                                                             ;93E3B0;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_26:
    dw $0012,$0003                                                       ;93E3B2;
    db $0D                                                               ;93E3B6;
    dw $AC32,$01FB                                                       ;93E3B7;
    db $0D                                                               ;93E3BB;
    dw $AC31,$01FA                                                       ;93E3BC;
    db $04                                                               ;93E3C0;
    dw $AC32,$01F2                                                       ;93E3C1;
    db $04                                                               ;93E3C5;
    dw $AC31,$01F1                                                       ;93E3C6;
    db $FB                                                               ;93E3CA;
    dw $AC32,$01E9                                                       ;93E3CB;
    db $FB                                                               ;93E3CF;
    dw $AC31,$000A                                                       ;93E3D0;
    db $F4                                                               ;93E3D4;
    dw $AC32,$0002                                                       ;93E3D5;
    db $F4                                                               ;93E3D9;
    dw $AC31,$0002                                                       ;93E3DA;
    db $FC                                                               ;93E3DE;
    dw $AC32,$01FA                                                       ;93E3DF;
    db $FC                                                               ;93E3E3;
    dw $AC31,$0013                                                       ;93E3E4;
    db $FD                                                               ;93E3E8;
    dw $AC32,$000B                                                       ;93E3E9;
    db $FD                                                               ;93E3ED;
    dw $AC31,$000B                                                       ;93E3EE;
    db $05                                                               ;93E3F2;
    dw $AC32,$0003                                                       ;93E3F3;
    db $05                                                               ;93E3F7;
    dw $AC31,$0001                                                       ;93E3F8;
    db $EB                                                               ;93E3FC;
    dw $AC32,$01F9                                                       ;93E3FD;
    db $EB                                                               ;93E401;
    dw $AC31,$01F9                                                       ;93E402;
    db $F3                                                               ;93E406;
    dw $AC32,$01F1                                                       ;93E407;
    db $F3                                                               ;93E40B;
    dw $AC31                                                             ;93E40C;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_27:
    dw $0012,$0005                                                       ;93E40E;
    db $0F                                                               ;93E412;
    dw $AC32,$01FD                                                       ;93E413;
    db $0F                                                               ;93E417;
    dw $AC31,$01FA                                                       ;93E418;
    db $04                                                               ;93E41C;
    dw $AC32,$01F2                                                       ;93E41D;
    db $04                                                               ;93E421;
    dw $AC31,$01EF                                                       ;93E422;
    db $F9                                                               ;93E426;
    dw $AC32,$01E7                                                       ;93E427;
    db $F9                                                               ;93E42B;
    dw $AC31,$000A                                                       ;93E42C;
    db $F4                                                               ;93E430;
    dw $AC32,$0002                                                       ;93E431;
    db $F4                                                               ;93E435;
    dw $AC31,$0002                                                       ;93E436;
    db $FC                                                               ;93E43A;
    dw $AC32,$01FA                                                       ;93E43B;
    db $FC                                                               ;93E43F;
    dw $AC31,$0015                                                       ;93E440;
    db $FF                                                               ;93E444;
    dw $AC32,$000D                                                       ;93E445;
    db $FF                                                               ;93E449;
    dw $AC31,$000D                                                       ;93E44A;
    db $07                                                               ;93E44E;
    dw $AC32,$0005                                                       ;93E44F;
    db $07                                                               ;93E453;
    dw $AC31,$01FF                                                       ;93E454;
    db $E9                                                               ;93E458;
    dw $AC32,$01F7                                                       ;93E459;
    db $E9                                                               ;93E45D;
    dw $AC31,$01F7                                                       ;93E45E;
    db $F1                                                               ;93E462;
    dw $AC32,$01EF                                                       ;93E463;
    db $F1                                                               ;93E467;
    dw $AC31                                                             ;93E468;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_28:
    dw $0012,$01EE                                                       ;93E46A;
    db $F8                                                               ;93E46E;
    dw $AC32,$01E6                                                       ;93E46F;
    db $F8                                                               ;93E473;
    dw $AC31,$0006                                                       ;93E474;
    db $10                                                               ;93E478;
    dw $AC32,$01FE                                                       ;93E479;
    db $10                                                               ;93E47D;
    dw $AC31,$01FA                                                       ;93E47E;
    db $04                                                               ;93E482;
    dw $AC32,$01F2                                                       ;93E483;
    db $04                                                               ;93E487;
    dw $AC31,$000A                                                       ;93E488;
    db $F4                                                               ;93E48C;
    dw $AC32,$0002                                                       ;93E48D;
    db $F4                                                               ;93E491;
    dw $AC31,$0002                                                       ;93E492;
    db $FC                                                               ;93E496;
    dw $AC32,$01FA                                                       ;93E497;
    db $FC                                                               ;93E49B;
    dw $AC31,$0016                                                       ;93E49C;
    db $00                                                               ;93E4A0;
    dw $AC32,$000E                                                       ;93E4A1;
    db $00                                                               ;93E4A5;
    dw $AC31,$000E                                                       ;93E4A6;
    db $08                                                               ;93E4AA;
    dw $AC32,$0006                                                       ;93E4AB;
    db $08                                                               ;93E4AF;
    dw $AC31,$01FE                                                       ;93E4B0;
    db $E8                                                               ;93E4B4;
    dw $AC32,$01F6                                                       ;93E4B5;
    db $E8                                                               ;93E4B9;
    dw $AC31,$01F6                                                       ;93E4BA;
    db $F0                                                               ;93E4BE;
    dw $AC32,$01EE                                                       ;93E4BF;
    db $F0                                                               ;93E4C3;
    dw $AC31                                                             ;93E4C4;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_29:
    dw $0012,$01F8                                                       ;93E4C6;
    db $01                                                               ;93E4CA;
    dw $AC32,$01F0                                                       ;93E4CB;
    db $01                                                               ;93E4CF;
    dw $AC31,$01FA                                                       ;93E4D0;
    db $04                                                               ;93E4D4;
    dw $AC32,$01F2                                                       ;93E4D5;
    db $04                                                               ;93E4D9;
    dw $AC31,$01FD                                                       ;93E4DA;
    db $06                                                               ;93E4DE;
    dw $AC32,$01F5                                                       ;93E4DF;
    db $06                                                               ;93E4E3;
    dw $AC31,$000D                                                       ;93E4E4;
    db $F6                                                               ;93E4E8;
    dw $AC32,$0005                                                       ;93E4E9;
    db $F6                                                               ;93E4ED;
    dw $AC31,$0005                                                       ;93E4EE;
    db $FE                                                               ;93E4F2;
    dw $AC32,$01FD                                                       ;93E4F3;
    db $FE                                                               ;93E4F7;
    dw $AC31,$0008                                                       ;93E4F8;
    db $F1                                                               ;93E4FC;
    dw $AC32,$0000                                                       ;93E4FD;
    db $F1                                                               ;93E501;
    dw $AC31,$0000                                                       ;93E502;
    db $F9                                                               ;93E506;
    dw $AC32,$01F8                                                       ;93E507;
    db $F9                                                               ;93E50B;
    dw $AC31,$000A                                                       ;93E50C;
    db $F4                                                               ;93E510;
    dw $AC32,$0002                                                       ;93E511;
    db $F4                                                               ;93E515;
    dw $AC31,$0002                                                       ;93E516;
    db $FC                                                               ;93E51A;
    dw $AC32,$01FA                                                       ;93E51B;
    db $FC                                                               ;93E51F;
    dw $AC31                                                             ;93E520;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2A:
    dw $0006,$000A                                                       ;93E522;
    db $04                                                               ;93E526;
    dw $2C32,$0002                                                       ;93E527;
    db $04                                                               ;93E52B;
    dw $2C31,$0002                                                       ;93E52C;
    db $FC                                                               ;93E530;
    dw $2C32,$01FA                                                       ;93E531;
    db $FC                                                               ;93E535;
    dw $2C31,$01FA                                                       ;93E536;
    db $F4                                                               ;93E53A;
    dw $2C32,$01F2                                                       ;93E53B;
    db $F4                                                               ;93E53F;
    dw $2C31                                                             ;93E540;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2B:
    dw $0012,$0004                                                       ;93E542;
    db $0A                                                               ;93E546;
    dw $2C32,$01FC                                                       ;93E547;
    db $0A                                                               ;93E54B;
    dw $2C31,$000A                                                       ;93E54C;
    db $04                                                               ;93E550;
    dw $2C32,$0002                                                       ;93E551;
    db $04                                                               ;93E555;
    dw $2C31,$0010                                                       ;93E556;
    db $FE                                                               ;93E55A;
    dw $2C32,$0008                                                       ;93E55B;
    db $FE                                                               ;93E55F;
    dw $2C31,$0002                                                       ;93E560;
    db $FC                                                               ;93E564;
    dw $2C32,$01FA                                                       ;93E565;
    db $FC                                                               ;93E569;
    dw $2C31,$01FA                                                       ;93E56A;
    db $F4                                                               ;93E56E;
    dw $2C32,$01F2                                                       ;93E56F;
    db $F4                                                               ;93E573;
    dw $2C31,$0008                                                       ;93E574;
    db $F6                                                               ;93E578;
    dw $2C32,$0000                                                       ;93E579;
    db $F6                                                               ;93E57D;
    dw $2C31,$0000                                                       ;93E57E;
    db $EE                                                               ;93E582;
    dw $2C32,$01F8                                                       ;93E583;
    db $EE                                                               ;93E587;
    dw $2C31,$01FC                                                       ;93E588;
    db $02                                                               ;93E58C;
    dw $2C32,$01F4                                                       ;93E58D;
    db $02                                                               ;93E591;
    dw $2C31,$01F4                                                       ;93E592;
    db $FA                                                               ;93E596;
    dw $2C32,$01EC                                                       ;93E597;
    db $FA                                                               ;93E59B;
    dw $2C31                                                             ;93E59C;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2C:
    dw $0012,$0001                                                       ;93E59E;
    db $0D                                                               ;93E5A2;
    dw $2C32,$01F9                                                       ;93E5A3;
    db $0D                                                               ;93E5A7;
    dw $2C31,$000A                                                       ;93E5A8;
    db $04                                                               ;93E5AC;
    dw $2C32,$0002                                                       ;93E5AD;
    db $04                                                               ;93E5B1;
    dw $2C31,$0013                                                       ;93E5B2;
    db $FB                                                               ;93E5B6;
    dw $2C32,$000B                                                       ;93E5B7;
    db $FB                                                               ;93E5BB;
    dw $2C31,$0002                                                       ;93E5BC;
    db $FC                                                               ;93E5C0;
    dw $2C32,$01FA                                                       ;93E5C1;
    db $FC                                                               ;93E5C5;
    dw $2C31,$01FA                                                       ;93E5C6;
    db $F4                                                               ;93E5CA;
    dw $2C32,$01F2                                                       ;93E5CB;
    db $F4                                                               ;93E5CF;
    dw $2C31,$000B                                                       ;93E5D0;
    db $F3                                                               ;93E5D4;
    dw $2C32,$0003                                                       ;93E5D5;
    db $F3                                                               ;93E5D9;
    dw $2C31,$0003                                                       ;93E5DA;
    db $EB                                                               ;93E5DE;
    dw $2C32,$01FB                                                       ;93E5DF;
    db $EB                                                               ;93E5E3;
    dw $2C31,$01F9                                                       ;93E5E4;
    db $05                                                               ;93E5E8;
    dw $2C32,$01F1                                                       ;93E5E9;
    db $05                                                               ;93E5ED;
    dw $2C31,$01F1                                                       ;93E5EE;
    db $FD                                                               ;93E5F2;
    dw $2C32,$01E9                                                       ;93E5F3;
    db $FD                                                               ;93E5F7;
    dw $2C31                                                             ;93E5F8;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2D:
    dw $0012,$01FF                                                       ;93E5FA;
    db $0F                                                               ;93E5FE;
    dw $2C32,$01F7                                                       ;93E5FF;
    db $0F                                                               ;93E603;
    dw $2C31,$000A                                                       ;93E604;
    db $04                                                               ;93E608;
    dw $2C32,$0002                                                       ;93E609;
    db $04                                                               ;93E60D;
    dw $2C31,$0015                                                       ;93E60E;
    db $F9                                                               ;93E612;
    dw $2C32,$000D                                                       ;93E613;
    db $F9                                                               ;93E617;
    dw $2C31,$0002                                                       ;93E618;
    db $FC                                                               ;93E61C;
    dw $2C32,$01FA                                                       ;93E61D;
    db $FC                                                               ;93E621;
    dw $2C31,$01FA                                                       ;93E622;
    db $F4                                                               ;93E626;
    dw $2C32,$01F2                                                       ;93E627;
    db $F4                                                               ;93E62B;
    dw $2C31,$000D                                                       ;93E62C;
    db $F1                                                               ;93E630;
    dw $2C32,$0005                                                       ;93E631;
    db $F1                                                               ;93E635;
    dw $2C31,$0005                                                       ;93E636;
    db $E9                                                               ;93E63A;
    dw $2C32,$01FD                                                       ;93E63B;
    db $E9                                                               ;93E63F;
    dw $2C31,$01F7                                                       ;93E640;
    db $07                                                               ;93E644;
    dw $2C32,$01EF                                                       ;93E645;
    db $07                                                               ;93E649;
    dw $2C31,$01EF                                                       ;93E64A;
    db $FF                                                               ;93E64E;
    dw $2C32,$01E7                                                       ;93E64F;
    db $FF                                                               ;93E653;
    dw $2C31                                                             ;93E654;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2E:
    dw $0012,$0016                                                       ;93E656;
    db $F8                                                               ;93E65A;
    dw $2C32,$000E                                                       ;93E65B;
    db $F8                                                               ;93E65F;
    dw $2C31,$01FE                                                       ;93E660;
    db $10                                                               ;93E664;
    dw $2C32,$01F6                                                       ;93E665;
    db $10                                                               ;93E669;
    dw $2C31,$000A                                                       ;93E66A;
    db $04                                                               ;93E66E;
    dw $2C32,$0002                                                       ;93E66F;
    db $04                                                               ;93E673;
    dw $2C31,$0002                                                       ;93E674;
    db $FC                                                               ;93E678;
    dw $2C32,$01FA                                                       ;93E679;
    db $FC                                                               ;93E67D;
    dw $2C31,$01FA                                                       ;93E67E;
    db $F4                                                               ;93E682;
    dw $2C32,$01F2                                                       ;93E683;
    db $F4                                                               ;93E687;
    dw $2C31,$000E                                                       ;93E688;
    db $F0                                                               ;93E68C;
    dw $2C32,$0006                                                       ;93E68D;
    db $F0                                                               ;93E691;
    dw $2C31,$0006                                                       ;93E692;
    db $E8                                                               ;93E696;
    dw $2C32,$01FE                                                       ;93E697;
    db $E8                                                               ;93E69B;
    dw $2C31,$01F6                                                       ;93E69C;
    db $08                                                               ;93E6A0;
    dw $2C32,$01EE                                                       ;93E6A1;
    db $08                                                               ;93E6A5;
    dw $2C31,$01EE                                                       ;93E6A6;
    db $00                                                               ;93E6AA;
    dw $2C32,$01E6                                                       ;93E6AB;
    db $00                                                               ;93E6AF;
    dw $2C31                                                             ;93E6B0;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2F:
    dw $0012,$000D                                                       ;93E6B2;
    db $02                                                               ;93E6B6;
    dw $2C32,$0005                                                       ;93E6B7;
    db $02                                                               ;93E6BB;
    dw $2C31,$000A                                                       ;93E6BC;
    db $04                                                               ;93E6C0;
    dw $2C32,$0002                                                       ;93E6C1;
    db $04                                                               ;93E6C5;
    dw $2C31,$0008                                                       ;93E6C6;
    db $07                                                               ;93E6CA;
    dw $2C32,$0000                                                       ;93E6CB;
    db $07                                                               ;93E6CF;
    dw $2C31,$0005                                                       ;93E6D0;
    db $FA                                                               ;93E6D4;
    dw $2C32,$01FD                                                       ;93E6D5;
    db $FA                                                               ;93E6D9;
    dw $2C31,$01FD                                                       ;93E6DA;
    db $F2                                                               ;93E6DE;
    dw $2C32,$01F5                                                       ;93E6DF;
    db $F2                                                               ;93E6E3;
    dw $2C31,$0000                                                       ;93E6E4;
    db $FF                                                               ;93E6E8;
    dw $2C32,$01F8                                                       ;93E6E9;
    db $FF                                                               ;93E6ED;
    dw $2C31,$01F8                                                       ;93E6EE;
    db $F7                                                               ;93E6F2;
    dw $2C32,$01F0                                                       ;93E6F3;
    db $F7                                                               ;93E6F7;
    dw $2C31,$0002                                                       ;93E6F8;
    db $FC                                                               ;93E6FC;
    dw $2C32,$01FA                                                       ;93E6FD;
    db $FC                                                               ;93E701;
    dw $2C31,$01FA                                                       ;93E702;
    db $F4                                                               ;93E706;
    dw $2C32,$01F2                                                       ;93E707;
    db $F4                                                               ;93E70B;
    dw $2C31                                                             ;93E70C;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_30:
    dw $0004,$01FC                                                       ;93E70E;
    db $F0                                                               ;93E712;
    dw $AC33,$01FC                                                       ;93E713;
    db $08                                                               ;93E717;
    dw $AC33,$01FC                                                       ;93E718;
    db $F8                                                               ;93E71C;
    dw $AC33,$01FC                                                       ;93E71D;
    db $00                                                               ;93E721;
    dw $AC33                                                             ;93E722;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_31:
    dw $000C,$01FC                                                       ;93E724;
    db $F0                                                               ;93E728;
    dw $AC33,$0000                                                       ;93E729;
    db $F0                                                               ;93E72D;
    dw $AC33,$01F8                                                       ;93E72E;
    db $F0                                                               ;93E732;
    dw $AC33,$01F8                                                       ;93E733;
    db $08                                                               ;93E737;
    dw $AC33,$0000                                                       ;93E738;
    db $08                                                               ;93E73C;
    dw $AC33,$01FC                                                       ;93E73D;
    db $08                                                               ;93E741;
    dw $AC33,$0000                                                       ;93E742;
    db $F8                                                               ;93E746;
    dw $AC33,$0000                                                       ;93E747;
    db $00                                                               ;93E74B;
    dw $AC33,$01F8                                                       ;93E74C;
    db $F8                                                               ;93E750;
    dw $AC33,$01F8                                                       ;93E751;
    db $00                                                               ;93E755;
    dw $AC33,$01FC                                                       ;93E756;
    db $F8                                                               ;93E75A;
    dw $AC33,$01FC                                                       ;93E75B;
    db $00                                                               ;93E75F;
    dw $AC33                                                             ;93E760;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_32:
    dw $000C,$01F4                                                       ;93E762;
    db $08                                                               ;93E766;
    dw $AC33,$01F4                                                       ;93E767;
    db $F0                                                               ;93E76B;
    dw $AC33,$01F4                                                       ;93E76C;
    db $F8                                                               ;93E770;
    dw $AC33,$01F4                                                       ;93E771;
    db $00                                                               ;93E775;
    dw $AC33,$0004                                                       ;93E776;
    db $F0                                                               ;93E77A;
    dw $AC33,$0004                                                       ;93E77B;
    db $08                                                               ;93E77F;
    dw $AC33,$0004                                                       ;93E780;
    db $F8                                                               ;93E784;
    dw $AC33,$0004                                                       ;93E785;
    db $00                                                               ;93E789;
    dw $AC33,$01FC                                                       ;93E78A;
    db $08                                                               ;93E78E;
    dw $AC33,$01FC                                                       ;93E78F;
    db $F0                                                               ;93E793;
    dw $AC33,$01FC                                                       ;93E794;
    db $F8                                                               ;93E798;
    dw $AC33,$01FC                                                       ;93E799;
    db $00                                                               ;93E79D;
    dw $AC33                                                             ;93E79E;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_33:
    dw $000C,$0009                                                       ;93E7A0;
    db $F0                                                               ;93E7A4;
    dw $AC33,$0009                                                       ;93E7A5;
    db $08                                                               ;93E7A9;
    dw $AC33,$01FC                                                       ;93E7AA;
    db $08                                                               ;93E7AE;
    dw $AC33,$01EF                                                       ;93E7AF;
    db $08                                                               ;93E7B3;
    dw $AC33,$01EF                                                       ;93E7B4;
    db $F0                                                               ;93E7B8;
    dw $AC33,$01FC                                                       ;93E7B9;
    db $F0                                                               ;93E7BD;
    dw $AC33,$0009                                                       ;93E7BE;
    db $F8                                                               ;93E7C2;
    dw $AC33,$0009                                                       ;93E7C3;
    db $00                                                               ;93E7C7;
    dw $AC33,$01EF                                                       ;93E7C8;
    db $F8                                                               ;93E7CC;
    dw $AC33,$01EF                                                       ;93E7CD;
    db $00                                                               ;93E7D1;
    dw $AC33,$01FC                                                       ;93E7D2;
    db $F8                                                               ;93E7D6;
    dw $AC33,$01FC                                                       ;93E7D7;
    db $00                                                               ;93E7DB;
    dw $AC33                                                             ;93E7DC;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_34:
    dw $000C,$000B                                                       ;93E7DE;
    db $F0                                                               ;93E7E2;
    dw $AC33,$01ED                                                       ;93E7E3;
    db $F0                                                               ;93E7E7;
    dw $AC33,$01FC                                                       ;93E7E8;
    db $F0                                                               ;93E7EC;
    dw $AC33,$000B                                                       ;93E7ED;
    db $08                                                               ;93E7F1;
    dw $AC33,$01ED                                                       ;93E7F2;
    db $08                                                               ;93E7F6;
    dw $AC33,$01FC                                                       ;93E7F7;
    db $08                                                               ;93E7FB;
    dw $AC33,$000B                                                       ;93E7FC;
    db $F8                                                               ;93E800;
    dw $AC33,$000B                                                       ;93E801;
    db $00                                                               ;93E805;
    dw $AC33,$01ED                                                       ;93E806;
    db $F8                                                               ;93E80A;
    dw $AC33,$01ED                                                       ;93E80B;
    db $00                                                               ;93E80F;
    dw $AC33,$01FC                                                       ;93E810;
    db $F8                                                               ;93E814;
    dw $AC33,$01FC                                                       ;93E815;
    db $00                                                               ;93E819;
    dw $AC33                                                             ;93E81A;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_35:
    dw $000C,$000C                                                       ;93E81C;
    db $08                                                               ;93E820;
    dw $AC33,$01EC                                                       ;93E821;
    db $08                                                               ;93E825;
    dw $AC33,$01FC                                                       ;93E826;
    db $08                                                               ;93E82A;
    dw $AC33,$000C                                                       ;93E82B;
    db $F0                                                               ;93E82F;
    dw $AC33,$01EC                                                       ;93E830;
    db $F0                                                               ;93E834;
    dw $AC33,$01FC                                                       ;93E835;
    db $F0                                                               ;93E839;
    dw $AC33,$000C                                                       ;93E83A;
    db $F8                                                               ;93E83E;
    dw $AC33,$000C                                                       ;93E83F;
    db $00                                                               ;93E843;
    dw $AC33,$01EC                                                       ;93E844;
    db $F8                                                               ;93E848;
    dw $AC33,$01EC                                                       ;93E849;
    db $00                                                               ;93E84D;
    dw $AC33,$01FC                                                       ;93E84E;
    db $F8                                                               ;93E852;
    dw $AC33,$01FC                                                       ;93E853;
    db $00                                                               ;93E857;
    dw $AC33                                                             ;93E858;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_36:
    dw $0004,$01F0                                                       ;93E85A;
    db $FC                                                               ;93E85E;
    dw $2C30,$0008                                                       ;93E85F;
    db $FC                                                               ;93E863;
    dw $2C30,$0000                                                       ;93E864;
    db $FC                                                               ;93E868;
    dw $2C30,$01F8                                                       ;93E869;
    db $FC                                                               ;93E86D;
    dw $2C30                                                             ;93E86E;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_37:
    dw $000C,$01F0                                                       ;93E870;
    db $00                                                               ;93E874;
    dw $2C30,$01F0                                                       ;93E875;
    db $FC                                                               ;93E879;
    dw $2C30,$01F0                                                       ;93E87A;
    db $F8                                                               ;93E87E;
    dw $2C30,$0008                                                       ;93E87F;
    db $00                                                               ;93E883;
    dw $2C30,$0008                                                       ;93E884;
    db $FC                                                               ;93E888;
    dw $2C30,$0008                                                       ;93E889;
    db $F8                                                               ;93E88D;
    dw $2C30,$0000                                                       ;93E88E;
    db $00                                                               ;93E892;
    dw $2C30,$01F8                                                       ;93E893;
    db $00                                                               ;93E897;
    dw $2C30,$0000                                                       ;93E898;
    db $FC                                                               ;93E89C;
    dw $2C30,$01F8                                                       ;93E89D;
    db $FC                                                               ;93E8A1;
    dw $2C30,$0000                                                       ;93E8A2;
    db $F8                                                               ;93E8A6;
    dw $2C30,$01F8                                                       ;93E8A7;
    db $F8                                                               ;93E8AB;
    dw $2C30                                                             ;93E8AC;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_38:
    dw $000C,$01F0                                                       ;93E8AE;
    db $FC                                                               ;93E8B2;
    dw $2C30,$01F0                                                       ;93E8B3;
    db $04                                                               ;93E8B7;
    dw $2C30,$01F0                                                       ;93E8B8;
    db $F4                                                               ;93E8BC;
    dw $2C30,$0008                                                       ;93E8BD;
    db $04                                                               ;93E8C1;
    dw $2C30,$0008                                                       ;93E8C2;
    db $FC                                                               ;93E8C6;
    dw $2C30,$0008                                                       ;93E8C7;
    db $F4                                                               ;93E8CB;
    dw $2C30,$0000                                                       ;93E8CC;
    db $F4                                                               ;93E8D0;
    dw $2C30,$0000                                                       ;93E8D1;
    db $FC                                                               ;93E8D5;
    dw $2C30,$0000                                                       ;93E8D6;
    db $04                                                               ;93E8DA;
    dw $2C30,$01F8                                                       ;93E8DB;
    db $04                                                               ;93E8DF;
    dw $2C30,$01F8                                                       ;93E8E0;
    db $FC                                                               ;93E8E4;
    dw $2C30,$01F8                                                       ;93E8E5;
    db $F4                                                               ;93E8E9;
    dw $2C30                                                             ;93E8EA;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_39:
    dw $000C,$01F0                                                       ;93E8EC;
    db $EF                                                               ;93E8F0;
    dw $2C30,$01F0                                                       ;93E8F1;
    db $FC                                                               ;93E8F5;
    dw $2C30,$01F0                                                       ;93E8F6;
    db $09                                                               ;93E8FA;
    dw $2C30,$0008                                                       ;93E8FB;
    db $EF                                                               ;93E8FF;
    dw $2C30,$0008                                                       ;93E900;
    db $FC                                                               ;93E904;
    dw $2C30,$0008                                                       ;93E905;
    db $09                                                               ;93E909;
    dw $2C30,$0000                                                       ;93E90A;
    db $EF                                                               ;93E90E;
    dw $2C30,$0000                                                       ;93E90F;
    db $FC                                                               ;93E913;
    dw $2C30,$0000                                                       ;93E914;
    db $09                                                               ;93E918;
    dw $2C30,$01F8                                                       ;93E919;
    db $09                                                               ;93E91D;
    dw $2C30,$01F8                                                       ;93E91E;
    db $FC                                                               ;93E922;
    dw $2C30,$01F8                                                       ;93E923;
    db $EF                                                               ;93E927;
    dw $2C30                                                             ;93E928;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3A:
    dw $000C,$0008                                                       ;93E92A;
    db $0B                                                               ;93E92E;
    dw $2C30,$01F0                                                       ;93E92F;
    db $0B                                                               ;93E933;
    dw $2C30,$0008                                                       ;93E934;
    db $ED                                                               ;93E938;
    dw $2C30,$0008                                                       ;93E939;
    db $FC                                                               ;93E93D;
    dw $2C30,$01F0                                                       ;93E93E;
    db $FC                                                               ;93E942;
    dw $2C30,$01F0                                                       ;93E943;
    db $ED                                                               ;93E947;
    dw $2C30,$0000                                                       ;93E948;
    db $ED                                                               ;93E94C;
    dw $2C30,$0000                                                       ;93E94D;
    db $FC                                                               ;93E951;
    dw $2C30,$0000                                                       ;93E952;
    db $0B                                                               ;93E956;
    dw $2C30,$01F8                                                       ;93E957;
    db $0B                                                               ;93E95B;
    dw $2C30,$01F8                                                       ;93E95C;
    db $FC                                                               ;93E960;
    dw $2C30,$01F8                                                       ;93E961;
    db $ED                                                               ;93E965;
    dw $2C30                                                             ;93E966;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3B:
    dw $000C,$01F0                                                       ;93E968;
    db $EC                                                               ;93E96C;
    dw $2C30,$01F0                                                       ;93E96D;
    db $FC                                                               ;93E971;
    dw $2C30,$01F0                                                       ;93E972;
    db $0C                                                               ;93E976;
    dw $2C30,$0008                                                       ;93E977;
    db $EC                                                               ;93E97B;
    dw $2C30,$0008                                                       ;93E97C;
    db $FC                                                               ;93E980;
    dw $2C30,$0008                                                       ;93E981;
    db $0C                                                               ;93E985;
    dw $2C30,$0000                                                       ;93E986;
    db $EC                                                               ;93E98A;
    dw $2C30,$0000                                                       ;93E98B;
    db $FC                                                               ;93E98F;
    dw $2C30,$0000                                                       ;93E990;
    db $0C                                                               ;93E994;
    dw $2C30,$01F8                                                       ;93E995;
    db $0C                                                               ;93E999;
    dw $2C30,$01F8                                                       ;93E99A;
    db $FC                                                               ;93E99E;
    dw $2C30,$01F8                                                       ;93E99F;
    db $EC                                                               ;93E9A3;
    dw $2C30                                                             ;93E9A4;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3C:
    dw $0004,$01FC                                                       ;93E9A6;
    db $08                                                               ;93E9AA;
    dw $2C33,$01FC                                                       ;93E9AB;
    db $F0                                                               ;93E9AF;
    dw $2C33,$01FC                                                       ;93E9B0;
    db $00                                                               ;93E9B4;
    dw $2C33,$01FC                                                       ;93E9B5;
    db $F8                                                               ;93E9B9;
    dw $2C33                                                             ;93E9BA;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3D:
    dw $000C,$01FC                                                       ;93E9BC;
    db $08                                                               ;93E9C0;
    dw $2C33,$01FC                                                       ;93E9C1;
    db $F0                                                               ;93E9C5;
    dw $2C33,$0000                                                       ;93E9C6;
    db $08                                                               ;93E9CA;
    dw $2C33,$01F8                                                       ;93E9CB;
    db $08                                                               ;93E9CF;
    dw $2C33,$0000                                                       ;93E9D0;
    db $F0                                                               ;93E9D4;
    dw $2C33,$01F8                                                       ;93E9D5;
    db $F0                                                               ;93E9D9;
    dw $2C33,$0000                                                       ;93E9DA;
    db $00                                                               ;93E9DE;
    dw $2C33,$0000                                                       ;93E9DF;
    db $F8                                                               ;93E9E3;
    dw $2C33,$01F8                                                       ;93E9E4;
    db $00                                                               ;93E9E8;
    dw $2C33,$01F8                                                       ;93E9E9;
    db $F8                                                               ;93E9ED;
    dw $2C33,$01FC                                                       ;93E9EE;
    db $00                                                               ;93E9F2;
    dw $2C33,$01FC                                                       ;93E9F3;
    db $F8                                                               ;93E9F7;
    dw $2C33                                                             ;93E9F8;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3E:
    dw $000C,$0004                                                       ;93E9FA;
    db $08                                                               ;93E9FE;
    dw $2C33,$01F4                                                       ;93E9FF;
    db $08                                                               ;93EA03;
    dw $2C33,$01FC                                                       ;93EA04;
    db $08                                                               ;93EA08;
    dw $2C33,$0004                                                       ;93EA09;
    db $F0                                                               ;93EA0D;
    dw $2C33,$01F4                                                       ;93EA0E;
    db $F0                                                               ;93EA12;
    dw $2C33,$01FC                                                       ;93EA13;
    db $F0                                                               ;93EA17;
    dw $2C33,$0004                                                       ;93EA18;
    db $00                                                               ;93EA1C;
    dw $2C33,$0004                                                       ;93EA1D;
    db $F8                                                               ;93EA21;
    dw $2C33,$01F4                                                       ;93EA22;
    db $00                                                               ;93EA26;
    dw $2C33,$01F4                                                       ;93EA27;
    db $F8                                                               ;93EA2B;
    dw $2C33,$01FC                                                       ;93EA2C;
    db $00                                                               ;93EA30;
    dw $2C33,$01FC                                                       ;93EA31;
    db $F8                                                               ;93EA35;
    dw $2C33                                                             ;93EA36;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3F:
    dw $000C,$0009                                                       ;93EA38;
    db $08                                                               ;93EA3C;
    dw $2C33,$01EF                                                       ;93EA3D;
    db $08                                                               ;93EA41;
    dw $2C33,$01FC                                                       ;93EA42;
    db $08                                                               ;93EA46;
    dw $2C33,$0009                                                       ;93EA47;
    db $F0                                                               ;93EA4B;
    dw $2C33,$01EF                                                       ;93EA4C;
    db $F0                                                               ;93EA50;
    dw $2C33,$01FC                                                       ;93EA51;
    db $F0                                                               ;93EA55;
    dw $2C33,$0009                                                       ;93EA56;
    db $00                                                               ;93EA5A;
    dw $2C33,$0009                                                       ;93EA5B;
    db $F8                                                               ;93EA5F;
    dw $2C33,$01EF                                                       ;93EA60;
    db $00                                                               ;93EA64;
    dw $2C33,$01EF                                                       ;93EA65;
    db $F8                                                               ;93EA69;
    dw $2C33,$01FC                                                       ;93EA6A;
    db $00                                                               ;93EA6E;
    dw $2C33,$01FC                                                       ;93EA6F;
    db $F8                                                               ;93EA73;
    dw $2C33                                                             ;93EA74;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_40:
    dw $000C,$000B                                                       ;93EA76;
    db $08                                                               ;93EA7A;
    dw $2C33,$01ED                                                       ;93EA7B;
    db $08                                                               ;93EA7F;
    dw $2C33,$01FC                                                       ;93EA80;
    db $08                                                               ;93EA84;
    dw $2C33,$000B                                                       ;93EA85;
    db $F0                                                               ;93EA89;
    dw $2C33,$01ED                                                       ;93EA8A;
    db $F0                                                               ;93EA8E;
    dw $2C33,$01FC                                                       ;93EA8F;
    db $F0                                                               ;93EA93;
    dw $2C33,$000B                                                       ;93EA94;
    db $00                                                               ;93EA98;
    dw $2C33,$000B                                                       ;93EA99;
    db $F8                                                               ;93EA9D;
    dw $2C33,$01ED                                                       ;93EA9E;
    db $00                                                               ;93EAA2;
    dw $2C33,$01ED                                                       ;93EAA3;
    db $F8                                                               ;93EAA7;
    dw $2C33,$01FC                                                       ;93EAA8;
    db $00                                                               ;93EAAC;
    dw $2C33,$01FC                                                       ;93EAAD;
    db $F8                                                               ;93EAB1;
    dw $2C33                                                             ;93EAB2;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_41:
    dw $000C,$01EC                                                       ;93EAB4;
    db $08                                                               ;93EAB8;
    dw $2C33,$01FC                                                       ;93EAB9;
    db $08                                                               ;93EABD;
    dw $2C33,$000C                                                       ;93EABE;
    db $08                                                               ;93EAC2;
    dw $2C33,$000C                                                       ;93EAC3;
    db $F0                                                               ;93EAC7;
    dw $2C33,$01FC                                                       ;93EAC8;
    db $F0                                                               ;93EACC;
    dw $2C33,$01EC                                                       ;93EACD;
    db $F0                                                               ;93EAD1;
    dw $2C33,$000C                                                       ;93EAD2;
    db $00                                                               ;93EAD6;
    dw $2C33,$000C                                                       ;93EAD7;
    db $F8                                                               ;93EADB;
    dw $2C33,$01EC                                                       ;93EADC;
    db $00                                                               ;93EAE0;
    dw $2C33,$01EC                                                       ;93EAE1;
    db $F8                                                               ;93EAE5;
    dw $2C33,$01FC                                                       ;93EAE6;
    db $00                                                               ;93EAEA;
    dw $2C33,$01FC                                                       ;93EAEB;
    db $F8                                                               ;93EAEF;
    dw $2C33                                                             ;93EAF0;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_42:
    dw $0004,$01F0                                                       ;93EAF2;
    db $FC                                                               ;93EAF6;
    dw $6C30,$0008                                                       ;93EAF7;
    db $FC                                                               ;93EAFB;
    dw $6C30,$01F8                                                       ;93EAFC;
    db $FC                                                               ;93EB00;
    dw $6C30,$0000                                                       ;93EB01;
    db $FC                                                               ;93EB05;
    dw $6C30                                                             ;93EB06;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_43:
    dw $000C,$01F0                                                       ;93EB08;
    db $00                                                               ;93EB0C;
    dw $2C30,$01F0                                                       ;93EB0D;
    db $FC                                                               ;93EB11;
    dw $2C30,$01F0                                                       ;93EB12;
    db $F8                                                               ;93EB16;
    dw $2C30,$0008                                                       ;93EB17;
    db $00                                                               ;93EB1B;
    dw $2C30,$0008                                                       ;93EB1C;
    db $FC                                                               ;93EB20;
    dw $2C30,$0008                                                       ;93EB21;
    db $F8                                                               ;93EB25;
    dw $2C30,$0000                                                       ;93EB26;
    db $00                                                               ;93EB2A;
    dw $2C30,$01F8                                                       ;93EB2B;
    db $00                                                               ;93EB2F;
    dw $2C30,$0000                                                       ;93EB30;
    db $FC                                                               ;93EB34;
    dw $2C30,$01F8                                                       ;93EB35;
    db $FC                                                               ;93EB39;
    dw $2C30,$0000                                                       ;93EB3A;
    db $F8                                                               ;93EB3E;
    dw $2C30,$01F8                                                       ;93EB3F;
    db $F8                                                               ;93EB43;
    dw $2C30                                                             ;93EB44;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_44:
    dw $000C,$01F0                                                       ;93EB46;
    db $04                                                               ;93EB4A;
    dw $6C30,$01F0                                                       ;93EB4B;
    db $FC                                                               ;93EB4F;
    dw $6C30,$01F0                                                       ;93EB50;
    db $F4                                                               ;93EB54;
    dw $6C30,$0008                                                       ;93EB55;
    db $04                                                               ;93EB59;
    dw $6C30,$0008                                                       ;93EB5A;
    db $FC                                                               ;93EB5E;
    dw $6C30,$0008                                                       ;93EB5F;
    db $F4                                                               ;93EB63;
    dw $6C30,$01F8                                                       ;93EB64;
    db $F4                                                               ;93EB68;
    dw $6C30,$01F8                                                       ;93EB69;
    db $FC                                                               ;93EB6D;
    dw $6C30,$01F8                                                       ;93EB6E;
    db $04                                                               ;93EB72;
    dw $6C30,$0000                                                       ;93EB73;
    db $04                                                               ;93EB77;
    dw $6C30,$0000                                                       ;93EB78;
    db $FC                                                               ;93EB7C;
    dw $6C30,$0000                                                       ;93EB7D;
    db $F4                                                               ;93EB81;
    dw $6C30                                                             ;93EB82;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_45:
    dw $000C,$01F0                                                       ;93EB84;
    db $09                                                               ;93EB88;
    dw $6C30,$01F0                                                       ;93EB89;
    db $FC                                                               ;93EB8D;
    dw $6C30,$01F0                                                       ;93EB8E;
    db $EF                                                               ;93EB92;
    dw $6C30,$0008                                                       ;93EB93;
    db $09                                                               ;93EB97;
    dw $6C30,$0008                                                       ;93EB98;
    db $FC                                                               ;93EB9C;
    dw $6C30,$0008                                                       ;93EB9D;
    db $EF                                                               ;93EBA1;
    dw $6C30,$01F8                                                       ;93EBA2;
    db $EF                                                               ;93EBA6;
    dw $6C30,$01F8                                                       ;93EBA7;
    db $FC                                                               ;93EBAB;
    dw $6C30,$01F8                                                       ;93EBAC;
    db $09                                                               ;93EBB0;
    dw $6C30,$0000                                                       ;93EBB1;
    db $09                                                               ;93EBB5;
    dw $6C30,$0000                                                       ;93EBB6;
    db $FC                                                               ;93EBBA;
    dw $6C30,$0000                                                       ;93EBBB;
    db $EF                                                               ;93EBBF;
    dw $6C30                                                             ;93EBC0;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_46:
    dw $000C,$01F0                                                       ;93EBC2;
    db $0B                                                               ;93EBC6;
    dw $6C30,$01F0                                                       ;93EBC7;
    db $FC                                                               ;93EBCB;
    dw $6C30,$01F0                                                       ;93EBCC;
    db $ED                                                               ;93EBD0;
    dw $6C30,$0008                                                       ;93EBD1;
    db $0B                                                               ;93EBD5;
    dw $6C30,$0008                                                       ;93EBD6;
    db $FC                                                               ;93EBDA;
    dw $6C30,$0008                                                       ;93EBDB;
    db $ED                                                               ;93EBDF;
    dw $6C30,$01F8                                                       ;93EBE0;
    db $ED                                                               ;93EBE4;
    dw $6C30,$01F8                                                       ;93EBE5;
    db $FC                                                               ;93EBE9;
    dw $6C30,$01F8                                                       ;93EBEA;
    db $0B                                                               ;93EBEE;
    dw $6C30,$0000                                                       ;93EBEF;
    db $0B                                                               ;93EBF3;
    dw $6C30,$0000                                                       ;93EBF4;
    db $FC                                                               ;93EBF8;
    dw $6C30,$0000                                                       ;93EBF9;
    db $ED                                                               ;93EBFD;
    dw $6C30                                                             ;93EBFE;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_47:
    dw $000C,$01F0                                                       ;93EC00;
    db $0C                                                               ;93EC04;
    dw $6C30,$01F0                                                       ;93EC05;
    db $FC                                                               ;93EC09;
    dw $6C30,$01F0                                                       ;93EC0A;
    db $EC                                                               ;93EC0E;
    dw $6C30,$0008                                                       ;93EC0F;
    db $0C                                                               ;93EC13;
    dw $6C30,$0008                                                       ;93EC14;
    db $FC                                                               ;93EC18;
    dw $6C30,$0008                                                       ;93EC19;
    db $EC                                                               ;93EC1D;
    dw $6C30,$01F8                                                       ;93EC1E;
    db $EC                                                               ;93EC22;
    dw $6C30,$01F8                                                       ;93EC23;
    db $FC                                                               ;93EC27;
    dw $6C30,$01F8                                                       ;93EC28;
    db $0C                                                               ;93EC2C;
    dw $6C30,$0000                                                       ;93EC2D;
    db $0C                                                               ;93EC31;
    dw $6C30,$0000                                                       ;93EC32;
    db $FC                                                               ;93EC36;
    dw $6C30,$0000                                                       ;93EC37;
    db $EC                                                               ;93EC3B;
    dw $6C30                                                             ;93EC3C;

ProjectileFlareSpritemaps_Charged_Power_0:
    dw $0004,$0000                                                       ;93EC3E;
    db $F8                                                               ;93EC42;
    dw $6C33,$0000                                                       ;93EC43;
    db $00                                                               ;93EC47;
    dw $EC33,$01F8                                                       ;93EC48;
    db $00                                                               ;93EC4C;
    dw $AC33,$01F8                                                       ;93EC4D;
    db $F8                                                               ;93EC51;
    dw $2C33                                                             ;93EC52;

ProjectileFlareSpritemaps_Charged_Power_1:
    dw $0004,$0000                                                       ;93EC54;
    db $00                                                               ;93EC58;
    dw $EC33,$0000                                                       ;93EC59;
    db $F8                                                               ;93EC5D;
    dw $6C33,$01F8                                                       ;93EC5E;
    db $00                                                               ;93EC62;
    dw $AC33,$01F8                                                       ;93EC63;
    db $F8                                                               ;93EC67;
    dw $2C33                                                             ;93EC68;

ProjectileFlareSpritemaps_Charged_Power_2:
    dw $0004,$0000                                                       ;93EC6A;
    db $00                                                               ;93EC6E;
    dw $EC33,$0000                                                       ;93EC6F;
    db $F8                                                               ;93EC73;
    dw $6C33,$01F8                                                       ;93EC74;
    db $00                                                               ;93EC78;
    dw $AC33,$01F8                                                       ;93EC79;
    db $F8                                                               ;93EC7D;
    dw $2C33                                                             ;93EC7E;

ProjectileFlareSpritemaps_Charged_Power_3:
    dw $0004,$0000                                                       ;93EC80;
    db $00                                                               ;93EC84;
    dw $EC33,$0000                                                       ;93EC85;
    db $F8                                                               ;93EC89;
    dw $6C33,$01F8                                                       ;93EC8A;
    db $00                                                               ;93EC8E;
    dw $AC33,$01F8                                                       ;93EC8F;
    db $F8                                                               ;93EC93;
    dw $2C33                                                             ;93EC94;

ProjectileFlareSpritemaps_Charged_Power_4:
    dw $0004,$0000                                                       ;93EC96;
    db $00                                                               ;93EC9A;
    dw $EC33,$0000                                                       ;93EC9B;
    db $F8                                                               ;93EC9F;
    dw $6C33,$01F8                                                       ;93ECA0;
    db $00                                                               ;93ECA4;
    dw $AC33,$01F8                                                       ;93ECA5;
    db $F8                                                               ;93ECA9;
    dw $2C33                                                             ;93ECAA;

ProjectileFlareSpritemaps_Charged_Power_5:
    dw $0004,$0000                                                       ;93ECAC;
    db $00                                                               ;93ECB0;
    dw $EC33,$0000                                                       ;93ECB1;
    db $F8                                                               ;93ECB5;
    dw $6C33,$01F8                                                       ;93ECB6;
    db $00                                                               ;93ECBA;
    dw $AC33,$01F8                                                       ;93ECBB;
    db $F8                                                               ;93ECBF;
    dw $2C33                                                             ;93ECC0;

ProjectileFlareSpritemaps_Charged_Power_6:
    dw $0004,$0000                                                       ;93ECC2;
    db $00                                                               ;93ECC6;
    dw $EC33,$0000                                                       ;93ECC7;
    db $F8                                                               ;93ECCB;
    dw $6C33,$01F8                                                       ;93ECCC;
    db $00                                                               ;93ECD0;
    dw $AC33,$01F8                                                       ;93ECD1;
    db $F8                                                               ;93ECD5;
    dw $2C33                                                             ;93ECD6;

ProjectileFlareSpritemaps_Charged_Power_7:
    dw $0004,$0000                                                       ;93ECD8;
    db $00                                                               ;93ECDC;
    dw $EC33,$0000                                                       ;93ECDD;
    db $F8                                                               ;93ECE1;
    dw $6C33,$01F8                                                       ;93ECE2;
    db $00                                                               ;93ECE6;
    dw $AC33,$01F8                                                       ;93ECE7;
    db $F8                                                               ;93ECEB;
    dw $2C33                                                             ;93ECEC;

ProjectileFlareSpritemaps_Charged_Power_8:
    dw $0004,$0000                                                       ;93ECEE;
    db $00                                                               ;93ECF2;
    dw $EC34,$0000                                                       ;93ECF3;
    db $F8                                                               ;93ECF7;
    dw $6C34,$01F8                                                       ;93ECF8;
    db $00                                                               ;93ECFC;
    dw $AC34,$01F8                                                       ;93ECFD;
    db $F8                                                               ;93ED01;
    dw $2C34                                                             ;93ED02;

ProjectileFlareSpritemaps_Charged_Power_9:
    dw $0004,$0000                                                       ;93ED04;
    db $00                                                               ;93ED08;
    dw $EC34,$0000                                                       ;93ED09;
    db $F8                                                               ;93ED0D;
    dw $6C34,$01F8                                                       ;93ED0E;
    db $00                                                               ;93ED12;
    dw $AC34,$01F8                                                       ;93ED13;
    db $F8                                                               ;93ED17;
    dw $2C34                                                             ;93ED18;

ProjectileFlareSpritemaps_Charged_Power_A:
    dw $0004,$0000                                                       ;93ED1A;
    db $00                                                               ;93ED1E;
    dw $EC34,$0000                                                       ;93ED1F;
    db $F8                                                               ;93ED23;
    dw $6C34,$01F8                                                       ;93ED24;
    db $00                                                               ;93ED28;
    dw $AC34,$01F8                                                       ;93ED29;
    db $F8                                                               ;93ED2D;
    dw $2C34                                                             ;93ED2E;

ProjectileFlareSpritemaps_Charged_Power_B:
    dw $0004,$0000                                                       ;93ED30;
    db $00                                                               ;93ED34;
    dw $EC34,$0000                                                       ;93ED35;
    db $F8                                                               ;93ED39;
    dw $6C34,$01F8                                                       ;93ED3A;
    db $00                                                               ;93ED3E;
    dw $AC34,$01F8                                                       ;93ED3F;
    db $F8                                                               ;93ED43;
    dw $2C34                                                             ;93ED44;

ProjectileFlareSpritemaps_Charged_Power_C:
    dw $0004,$0000                                                       ;93ED46;
    db $00                                                               ;93ED4A;
    dw $EC34,$0000                                                       ;93ED4B;
    db $F8                                                               ;93ED4F;
    dw $6C34,$01F8                                                       ;93ED50;
    db $00                                                               ;93ED54;
    dw $AC34,$01F8                                                       ;93ED55;
    db $F8                                                               ;93ED59;
    dw $2C34                                                             ;93ED5A;

ProjectileFlareSpritemaps_Charged_Power_D:
    dw $0004,$0000                                                       ;93ED5C;
    db $00                                                               ;93ED60;
    dw $EC34,$0000                                                       ;93ED61;
    db $F8                                                               ;93ED65;
    dw $6C34,$01F8                                                       ;93ED66;
    db $00                                                               ;93ED6A;
    dw $AC34,$01F8                                                       ;93ED6B;
    db $F8                                                               ;93ED6F;
    dw $2C34                                                             ;93ED70;

ProjectileFlareSpritemaps_Charged_Power_E:
    dw $0004,$0000                                                       ;93ED72;
    db $00                                                               ;93ED76;
    dw $EC34,$0000                                                       ;93ED77;
    db $F8                                                               ;93ED7B;
    dw $6C34,$01F8                                                       ;93ED7C;
    db $00                                                               ;93ED80;
    dw $AC34,$01F8                                                       ;93ED81;
    db $F8                                                               ;93ED85;
    dw $2C34                                                             ;93ED86;

ProjectileFlareSpritemaps_Charged_Power_F:
    dw $0004,$0000                                                       ;93ED88;
    db $00                                                               ;93ED8C;
    dw $EC34,$0000                                                       ;93ED8D;
    db $F8                                                               ;93ED91;
    dw $6C34,$01F8                                                       ;93ED92;
    db $00                                                               ;93ED96;
    dw $AC34,$01F8                                                       ;93ED97;
    db $F8                                                               ;93ED9B;
    dw $2C34                                                             ;93ED9C;

ProjectileFlareSpritemaps_Charged_Ice_0:
    dw $0004,$0000                                                       ;93ED9E;
    db $00                                                               ;93EDA2;
    dw $EC33,$01F8                                                       ;93EDA3;
    db $00                                                               ;93EDA7;
    dw $AC33,$0000                                                       ;93EDA8;
    db $F8                                                               ;93EDAC;
    dw $6C33,$01F8                                                       ;93EDAD;
    db $F8                                                               ;93EDB1;
    dw $2C33                                                             ;93EDB2;

ProjectileFlareSpritemaps_Charged_Ice_1:
    dw $0004,$0000                                                       ;93EDB4;
    db $00                                                               ;93EDB8;
    dw $EC34,$01F8                                                       ;93EDB9;
    db $00                                                               ;93EDBD;
    dw $AC34,$0000                                                       ;93EDBE;
    db $F8                                                               ;93EDC2;
    dw $6C34,$01F8                                                       ;93EDC3;
    db $F8                                                               ;93EDC7;
    dw $2C34                                                             ;93EDC8;

ProjectileFlareSpritemaps_Charged_Ice_2:
    dw $0004,$0000                                                       ;93EDCA;
    db $00                                                               ;93EDCE;
    dw $EC33,$01F8                                                       ;93EDCF;
    db $00                                                               ;93EDD3;
    dw $AC33,$0000                                                       ;93EDD4;
    db $F8                                                               ;93EDD8;
    dw $6C33,$01F8                                                       ;93EDD9;
    db $F8                                                               ;93EDDD;
    dw $2C33                                                             ;93EDDE;

ProjectileFlareSpritemaps_Charged_Ice_3:
    dw $0004,$0000                                                       ;93EDE0;
    db $00                                                               ;93EDE4;
    dw $EC34,$01F8                                                       ;93EDE5;
    db $00                                                               ;93EDE9;
    dw $AC34,$0000                                                       ;93EDEA;
    db $F8                                                               ;93EDEE;
    dw $6C34,$01F8                                                       ;93EDEF;
    db $F8                                                               ;93EDF3;
    dw $2C34                                                             ;93EDF4;

ProjectileFlareSpritemaps_Ice_0:
    dw $0001,$01FC                                                       ;93EDF6;
    db $FC                                                               ;93EDFA;
    dw $2C30                                                             ;93EDFB;

ProjectileFlareSpritemaps_Ice_1:
    dw $0001,$01FC                                                       ;93EDFD;
    db $FC                                                               ;93EE01;
    dw $2C31                                                             ;93EE02;

ProjectileFlareSpritemaps_Ice_2:
    dw $0001,$01FC                                                       ;93EE04;
    db $FC                                                               ;93EE08;
    dw $2C32                                                             ;93EE09;

ProjectileFlareSpritemaps_Ice_3:
    dw $0001,$01FC                                                       ;93EE0B;
    db $FC                                                               ;93EE0F;
    dw $6C31                                                             ;93EE10;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_48:
    dw $0001,$01FC                                                       ;93EE12;
    db $FC                                                               ;93EE16;
    dw $2C30                                                             ;93EE17;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_49:
    dw $0002,$01F8                                                       ;93EE19;
    db $FC                                                               ;93EE1D;
    dw $2C30,$0000                                                       ;93EE1E;
    db $FC                                                               ;93EE22;
    dw $2C30                                                             ;93EE23;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EE25:
    dw $0003,$01F4                                                       ;93EE25;
    db $FC                                                               ;93EE29;
    dw $2C30,$01FC                                                       ;93EE2A;
    db $FC                                                               ;93EE2E;
    dw $2C30,$0004                                                       ;93EE2F;
    db $FC                                                               ;93EE33;
    dw $2C30                                                             ;93EE34;

UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EE36:
    dw $0004,$0008                                                       ;93EE36;
    db $FC                                                               ;93EE3A;
    dw $2C30,$0000                                                       ;93EE3B;
    db $FC                                                               ;93EE3F;
    dw $2C30,$01F8                                                       ;93EE40;
    db $FC                                                               ;93EE44;
    dw $2C30,$01F0                                                       ;93EE45;
    db $FC                                                               ;93EE49;
    dw $2C30                                                             ;93EE4A;
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4A:
    dw $0002,$0002                                                       ;93EE4C;
    db $FC                                                               ;93EE50;
    dw $2C32,$01FA                                                       ;93EE51;
    db $FC                                                               ;93EE55;
    dw $2C31                                                             ;93EE56;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4B:
    dw $0004,$0006                                                       ;93EE58;
    db $00                                                               ;93EE5C;
    dw $2C32,$01FE                                                       ;93EE5D;
    db $00                                                               ;93EE61;
    dw $2C31,$01FE                                                       ;93EE62;
    db $F8                                                               ;93EE66;
    dw $2C32,$01F6                                                       ;93EE67;
    db $F8                                                               ;93EE6B;
    dw $2C31                                                             ;93EE6C;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EE6E:
    dw $0006,$000A                                                       ;93EE6E;
    db $04                                                               ;93EE72;
    dw $2C32,$0002                                                       ;93EE73;
    db $04                                                               ;93EE77;
    dw $2C31,$0002                                                       ;93EE78;
    db $FC                                                               ;93EE7C;
    dw $2C32,$01FA                                                       ;93EE7D;
    db $FC                                                               ;93EE81;
    dw $2C31,$01FA                                                       ;93EE82;
    db $F4                                                               ;93EE86;
    dw $2C32,$01F2                                                       ;93EE87;
    db $F4                                                               ;93EE8B;
    dw $2C31                                                             ;93EE8C;
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4C:
    dw $0001,$01FC                                                       ;93EE8E;
    db $FC                                                               ;93EE92;
    dw $2C33                                                             ;93EE93;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4D:
    dw $0002,$01FC                                                       ;93EE95;
    db $00                                                               ;93EE99;
    dw $2C33,$01FC                                                       ;93EE9A;
    db $F8                                                               ;93EE9E;
    dw $2C33                                                             ;93EE9F;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EEA1:
    dw $0003,$01FC                                                       ;93EEA1;
    db $F4                                                               ;93EEA5;
    dw $2C33,$01FC                                                       ;93EEA6;
    db $04                                                               ;93EEAA;
    dw $2C33,$01FC                                                       ;93EEAB;
    db $FC                                                               ;93EEAF;
    dw $2C33                                                             ;93EEB0;

UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EEB2:
    dw $0004,$01FC                                                       ;93EEB2;
    db $F0                                                               ;93EEB6;
    dw $2C33,$01FC                                                       ;93EEB7;
    db $08                                                               ;93EEBB;
    dw $2C33,$01FC                                                       ;93EEBC;
    db $00                                                               ;93EEC0;
    dw $2C33,$01FC                                                       ;93EEC1;
    db $F8                                                               ;93EEC5;
    dw $2C33                                                             ;93EEC6;
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4E:
    dw $0002,$01F6                                                       ;93EEC8;
    db $FC                                                               ;93EECC;
    dw $6C32,$01FE                                                       ;93EECD;
    db $FC                                                               ;93EED1;
    dw $6C31                                                             ;93EED2;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4F:
    dw $0004,$01F2                                                       ;93EED4;
    db $00                                                               ;93EED8;
    dw $6C32,$01FA                                                       ;93EED9;
    db $00                                                               ;93EEDD;
    dw $6C31,$01FA                                                       ;93EEDE;
    db $F8                                                               ;93EEE2;
    dw $6C32,$0002                                                       ;93EEE3;
    db $F8                                                               ;93EEE7;
    dw $6C31                                                             ;93EEE8;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_50:
    dw $0006,$01EE                                                       ;93EEEA;
    db $04                                                               ;93EEEE;
    dw $6C32,$01F6                                                       ;93EEEF;
    db $04                                                               ;93EEF3;
    dw $6C31,$01F6                                                       ;93EEF4;
    db $FC                                                               ;93EEF8;
    dw $6C32,$01FE                                                       ;93EEF9;
    db $FC                                                               ;93EEFD;
    dw $6C31,$01FE                                                       ;93EEFE;
    db $F4                                                               ;93EF02;
    dw $6C32,$0006                                                       ;93EF03;
    db $F4                                                               ;93EF07;
    dw $6C31                                                             ;93EF08;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_51:
    dw $0001,$01FC                                                       ;93EF0A;
    db $FC                                                               ;93EF0E;
    dw $6C30                                                             ;93EF0F;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_52:
    dw $0002,$0000                                                       ;93EF11;
    db $FC                                                               ;93EF15;
    dw $6C30,$01F8                                                       ;93EF16;
    db $FC                                                               ;93EF1A;
    dw $6C30                                                             ;93EF1B;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EF1D:
    dw $0003,$0004                                                       ;93EF1D;
    db $FC                                                               ;93EF21;
    dw $6C30,$01FC                                                       ;93EF22;
    db $FC                                                               ;93EF26;
    dw $6C30,$01F4                                                       ;93EF27;
    db $FC                                                               ;93EF2B;
    dw $6C30                                                             ;93EF2C;

UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EF2E:
    dw $0004,$01F0                                                       ;93EF2E;
    db $FC                                                               ;93EF32;
    dw $6C30,$01F8                                                       ;93EF33;
    db $FC                                                               ;93EF37;
    dw $6C30,$0000                                                       ;93EF38;
    db $FC                                                               ;93EF3C;
    dw $6C30,$0008                                                       ;93EF3D;
    db $FC                                                               ;93EF41;
    dw $6C30                                                             ;93EF42;
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_53:
    dw $0002,$01F6                                                       ;93EF44;
    db $FC                                                               ;93EF48;
    dw $EC32,$01FE                                                       ;93EF49;
    db $FC                                                               ;93EF4D;
    dw $EC31                                                             ;93EF4E;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_54:
    dw $0004,$01F2                                                       ;93EF50;
    db $F8                                                               ;93EF54;
    dw $EC32,$01FA                                                       ;93EF55;
    db $F8                                                               ;93EF59;
    dw $EC31,$01FA                                                       ;93EF5A;
    db $00                                                               ;93EF5E;
    dw $EC32,$0002                                                       ;93EF5F;
    db $00                                                               ;93EF63;
    dw $EC31                                                             ;93EF64;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EF66:
    dw $0006,$01EE                                                       ;93EF66;
    db $F4                                                               ;93EF6A;
    dw $EC32,$01F6                                                       ;93EF6B;
    db $F4                                                               ;93EF6F;
    dw $EC31,$01F6                                                       ;93EF70;
    db $FC                                                               ;93EF74;
    dw $EC32,$01FE                                                       ;93EF75;
    db $FC                                                               ;93EF79;
    dw $EC31,$01FE                                                       ;93EF7A;
    db $04                                                               ;93EF7E;
    dw $EC32,$0006                                                       ;93EF7F;
    db $04                                                               ;93EF83;
    dw $EC31                                                             ;93EF84;
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_55:
    dw $0001,$01FC                                                       ;93EF86;
    db $FC                                                               ;93EF8A;
    dw $AC33                                                             ;93EF8B;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_56:
    dw $0002,$01FC                                                       ;93EF8D;
    db $F8                                                               ;93EF91;
    dw $AC33,$01FC                                                       ;93EF92;
    db $00                                                               ;93EF96;
    dw $AC33                                                             ;93EF97;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EF99:
    dw $0003,$01FC                                                       ;93EF99;
    db $04                                                               ;93EF9D;
    dw $AC33,$01FC                                                       ;93EF9E;
    db $F4                                                               ;93EFA2;
    dw $AC33,$01FC                                                       ;93EFA3;
    db $FC                                                               ;93EFA7;
    dw $AC33                                                             ;93EFA8;

UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EFAA:
    dw $0004,$01FC                                                       ;93EFAA;
    db $08                                                               ;93EFAE;
    dw $AC33,$01FC                                                       ;93EFAF;
    db $F0                                                               ;93EFB3;
    dw $AC33,$01FC                                                       ;93EFB4;
    db $F8                                                               ;93EFB8;
    dw $AC33,$01FC                                                       ;93EFB9;
    db $00                                                               ;93EFBD;
    dw $AC33                                                             ;93EFBE;

UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EFC0:
    dw $0002,$01F6                                                       ;93EFC0;
    db $FC                                                               ;93EFC4;
    dw $EC32,$01FE                                                       ;93EFC5;
    db $FC                                                               ;93EFC9;
    dw $EC31                                                             ;93EFCA;

UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EFCC:
    dw $0004,$01F2                                                       ;93EFCC;
    db $F8                                                               ;93EFD0;
    dw $EC32,$01FA                                                       ;93EFD1;
    db $F8                                                               ;93EFD5;
    dw $EC31,$01FA                                                       ;93EFD6;
    db $00                                                               ;93EFDA;
    dw $EC32,$0002                                                       ;93EFDB;
    db $00                                                               ;93EFDF;
    dw $EC31                                                             ;93EFE0;

UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EFE2:
    dw $0006,$01EE                                                       ;93EFE2;
    db $F4                                                               ;93EFE6;
    dw $EC32,$01F6                                                       ;93EFE7;
    db $F4                                                               ;93EFEB;
    dw $EC31,$01F6                                                       ;93EFEC;
    db $FC                                                               ;93EFF0;
    dw $EC32,$01FE                                                       ;93EFF1;
    db $FC                                                               ;93EFF5;
    dw $EC31,$01FE                                                       ;93EFF6;
    db $04                                                               ;93EFFA;
    dw $EC32,$0006                                                       ;93EFFB;
    db $04                                                               ;93EFFF;
    dw $EC31                                                             ;93F000;
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_57:
    dw $0001,$01FC                                                       ;93F002;
    db $FC                                                               ;93F006;
    dw $2C34                                                             ;93F007;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_58:
    dw $0002,$01F8                                                       ;93F009;
    db $FC                                                               ;93F00D;
    dw $2C34,$0000                                                       ;93F00E;
    db $FC                                                               ;93F012;
    dw $2C34                                                             ;93F013;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93F015:
    dw $0003,$01F4                                                       ;93F015;
    db $FC                                                               ;93F019;
    dw $2C34,$01FC                                                       ;93F01A;
    db $FC                                                               ;93F01E;
    dw $2C34,$0004                                                       ;93F01F;
    db $FC                                                               ;93F023;
    dw $2C34                                                             ;93F024;

UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93F026:
    dw $0004,$0008                                                       ;93F026;
    db $FC                                                               ;93F02A;
    dw $2C34,$0000                                                       ;93F02B;
    db $FC                                                               ;93F02F;
    dw $2C34,$01F8                                                       ;93F030;
    db $FC                                                               ;93F034;
    dw $2C34,$01F0                                                       ;93F035;
    db $FC                                                               ;93F039;
    dw $2C34                                                             ;93F03A;
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_59:
    dw $0002,$01FC                                                       ;93F03C;
    db $F8                                                               ;93F040;
    dw $2C36,$01FC                                                       ;93F041;
    db $00                                                               ;93F045;
    dw $EC36                                                             ;93F046;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5A:
    dw $0004,$0000                                                       ;93F048;
    db $FC                                                               ;93F04C;
    dw $EC35,$0000                                                       ;93F04D;
    db $04                                                               ;93F051;
    dw $EC36,$01F8                                                       ;93F052;
    db $F4                                                               ;93F056;
    dw $2C36,$01F8                                                       ;93F057;
    db $FC                                                               ;93F05B;
    dw $2C35                                                             ;93F05C;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93F05E:
    dw $0006,$0004                                                       ;93F05E;
    db $08                                                               ;93F062;
    dw $EC36,$01F4                                                       ;93F063;
    db $F0                                                               ;93F067;
    dw $2C36,$0004                                                       ;93F068;
    db $00                                                               ;93F06C;
    dw $EC35,$01FC                                                       ;93F06D;
    db $00                                                               ;93F071;
    dw $2C35,$01FC                                                       ;93F072;
    db $F8                                                               ;93F076;
    dw $EC35,$01F4                                                       ;93F077;
    db $F8                                                               ;93F07B;
    dw $2C35                                                             ;93F07C;
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5B:
    dw $0001,$01FC                                                       ;93F07E;
    db $FC                                                               ;93F082;
    dw $2C37                                                             ;93F083;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5C:
    dw $0002,$01FC                                                       ;93F085;
    db $00                                                               ;93F089;
    dw $2C37,$01FC                                                       ;93F08A;
    db $F8                                                               ;93F08E;
    dw $2C37                                                             ;93F08F;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93F091:
    dw $0003,$01FC                                                       ;93F091;
    db $04                                                               ;93F095;
    dw $2C37,$01FC                                                       ;93F096;
    db $FC                                                               ;93F09A;
    dw $2C37,$01FC                                                       ;93F09B;
    db $F4                                                               ;93F09F;
    dw $2C37                                                             ;93F0A0;

UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93F0A2:
    dw $0004,$01FC                                                       ;93F0A2;
    db $08                                                               ;93F0A6;
    dw $2C37,$01FC                                                       ;93F0A7;
    db $00                                                               ;93F0AB;
    dw $2C37,$01FC                                                       ;93F0AC;
    db $F8                                                               ;93F0B0;
    dw $2C37,$01FC                                                       ;93F0B1;
    db $F0                                                               ;93F0B5;
    dw $2C37                                                             ;93F0B6;
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5D:
    dw $0002,$01FC                                                       ;93F0B8;
    db $F8                                                               ;93F0BC;
    dw $6C36,$01FC                                                       ;93F0BD;
    db $00                                                               ;93F0C1;
    dw $AC36                                                             ;93F0C2;

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5E:
    dw $0004,$01F8                                                       ;93F0C4;
    db $FC                                                               ;93F0C8;
    dw $AC35,$01F8                                                       ;93F0C9;
    db $04                                                               ;93F0CD;
    dw $AC36,$0000                                                       ;93F0CE;
    db $F4                                                               ;93F0D2;
    dw $6C36,$0000                                                       ;93F0D3;
    db $FC                                                               ;93F0D7;
    dw $6C35                                                             ;93F0D8;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93F0DA:
    dw $0006,$01F4                                                       ;93F0DA;
    db $08                                                               ;93F0DE;
    dw $AC36,$0004                                                       ;93F0DF;
    db $F0                                                               ;93F0E3;
    dw $6C36,$01F4                                                       ;93F0E4;
    db $00                                                               ;93F0E8;
    dw $AC35,$01FC                                                       ;93F0E9;
    db $00                                                               ;93F0ED;
    dw $6C35,$01FC                                                       ;93F0EE;
    db $F8                                                               ;93F0F2;
    dw $AC35,$0004                                                       ;93F0F3;
    db $F8                                                               ;93F0F7;
    dw $6C35                                                             ;93F0F8;
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_0:
    dw $0001,$01FC                                                       ;93F0FA;
    db $FC                                                               ;93F0FE;
    dw $2C30                                                             ;93F0FF;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F101:
    dw $0002,$01F8                                                       ;93F101;
    db $FC                                                               ;93F105;
    dw $2C30,$0000                                                       ;93F106;
    db $FC                                                               ;93F10A;
    dw $2C30                                                             ;93F10B;
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1:
    dw $0003,$01F4                                                       ;93F10D;
    db $FC                                                               ;93F111;
    dw $2C30,$01FC                                                       ;93F112;
    db $FC                                                               ;93F116;
    dw $2C30,$0004                                                       ;93F117;
    db $FC                                                               ;93F11B;
    dw $2C30                                                             ;93F11C;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F11E:
    dw $0004,$01F0                                                       ;93F11E;
    db $FC                                                               ;93F122;
    dw $2C30,$01F8                                                       ;93F123;
    db $FC                                                               ;93F127;
    dw $2C30,$0000                                                       ;93F128;
    db $FC                                                               ;93F12C;
    dw $2C30,$0008                                                       ;93F12D;
    db $FC                                                               ;93F131;
    dw $2C30                                                             ;93F132;

UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F134:
    dw $0005,$000C                                                       ;93F134;
    db $FC                                                               ;93F138;
    dw $2C30,$0004                                                       ;93F139;
    db $FC                                                               ;93F13D;
    dw $2C30,$01FC                                                       ;93F13E;
    db $FC                                                               ;93F142;
    dw $2C30,$01F4                                                       ;93F143;
    db $FC                                                               ;93F147;
    dw $2C30,$01EC                                                       ;93F148;
    db $FC                                                               ;93F14C;
    dw $2C30                                                             ;93F14D;
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_2:
    dw $0006,$0010                                                       ;93F14F;
    db $FC                                                               ;93F153;
    dw $2C30,$0008                                                       ;93F154;
    db $FC                                                               ;93F158;
    dw $2C30,$0000                                                       ;93F159;
    db $FC                                                               ;93F15D;
    dw $2C30,$01F8                                                       ;93F15E;
    db $FC                                                               ;93F162;
    dw $2C30,$01F0                                                       ;93F163;
    db $FC                                                               ;93F167;
    dw $2C30,$01E8                                                       ;93F168;
    db $FC                                                               ;93F16C;
    dw $2C30                                                             ;93F16D;

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_3:
    dw $0007,$0014                                                       ;93F16F;
    db $FC                                                               ;93F173;
    dw $2C30,$000C                                                       ;93F174;
    db $FC                                                               ;93F178;
    dw $2C30,$0004                                                       ;93F179;
    db $FC                                                               ;93F17D;
    dw $2C30,$01FC                                                       ;93F17E;
    db $FC                                                               ;93F182;
    dw $2C30,$01F4                                                       ;93F183;
    db $FC                                                               ;93F187;
    dw $2C30,$01EC                                                       ;93F188;
    db $FC                                                               ;93F18C;
    dw $2C30,$01E4                                                       ;93F18D;
    db $FC                                                               ;93F191;
    dw $2C30                                                             ;93F192;

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_4:
    dw $0001,$01FC                                                       ;93F194;
    db $FC                                                               ;93F198;
    dw $2C33                                                             ;93F199;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F19B:
    dw $0002,$01FC                                                       ;93F19B;
    db $00                                                               ;93F19F;
    dw $2C33,$01FC                                                       ;93F1A0;
    db $F8                                                               ;93F1A4;
    dw $2C33                                                             ;93F1A5;
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_5:
    dw $0003,$01FC                                                       ;93F1A7;
    db $04                                                               ;93F1AB;
    dw $2C33,$01FC                                                       ;93F1AC;
    db $FC                                                               ;93F1B0;
    dw $2C33,$01FC                                                       ;93F1B1;
    db $F4                                                               ;93F1B5;
    dw $2C33                                                             ;93F1B6;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F1B8:
    dw $0004,$01FC                                                       ;93F1B8;
    db $08                                                               ;93F1BC;
    dw $2C33,$01FC                                                       ;93F1BD;
    db $00                                                               ;93F1C1;
    dw $2C33,$01FC                                                       ;93F1C2;
    db $F8                                                               ;93F1C6;
    dw $2C33,$01FC                                                       ;93F1C7;
    db $F0                                                               ;93F1CB;
    dw $2C33                                                             ;93F1CC;

UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F1CE:
    dw $0005,$01FC                                                       ;93F1CE;
    db $0C                                                               ;93F1D2;
    dw $2C33,$01FC                                                       ;93F1D3;
    db $04                                                               ;93F1D7;
    dw $2C33,$01FC                                                       ;93F1D8;
    db $FC                                                               ;93F1DC;
    dw $2C33,$01FC                                                       ;93F1DD;
    db $F4                                                               ;93F1E1;
    dw $2C33,$01FC                                                       ;93F1E2;
    db $EC                                                               ;93F1E6;
    dw $2C33                                                             ;93F1E7;
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_6:
    dw $0006,$01FC                                                       ;93F1E9;
    db $10                                                               ;93F1ED;
    dw $2C33,$01FC                                                       ;93F1EE;
    db $08                                                               ;93F1F2;
    dw $2C33,$01FC                                                       ;93F1F3;
    db $00                                                               ;93F1F7;
    dw $2C33,$01FC                                                       ;93F1F8;
    db $F8                                                               ;93F1FC;
    dw $2C33,$01FC                                                       ;93F1FD;
    db $F0                                                               ;93F201;
    dw $2C33,$01FC                                                       ;93F202;
    db $E8                                                               ;93F206;
    dw $2C33                                                             ;93F207;

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_7:
    dw $0007,$01FC                                                       ;93F209;
    db $14                                                               ;93F20D;
    dw $2C33,$01FC                                                       ;93F20E;
    db $0C                                                               ;93F212;
    dw $2C33,$01FC                                                       ;93F213;
    db $04                                                               ;93F217;
    dw $2C33,$01FC                                                       ;93F218;
    db $FC                                                               ;93F21C;
    dw $2C33,$01FC                                                       ;93F21D;
    db $F4                                                               ;93F221;
    dw $2C33,$01FC                                                       ;93F222;
    db $EC                                                               ;93F226;
    dw $2C33,$01FC                                                       ;93F227;
    db $E4                                                               ;93F22B;
    dw $2C33                                                             ;93F22C;

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_8:
    dw $0002,$0000                                                       ;93F22E;
    db $FC                                                               ;93F232;
    dw $2C32,$01F8                                                       ;93F233;
    db $FC                                                               ;93F237;
    dw $2C31                                                             ;93F238;

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_9:
    dw $0004,$0004                                                       ;93F23A;
    db $00                                                               ;93F23E;
    dw $2C32,$01FC                                                       ;93F23F;
    db $00                                                               ;93F243;
    dw $2C31,$01FC                                                       ;93F244;
    db $F8                                                               ;93F248;
    dw $2C32,$01F4                                                       ;93F249;
    db $F8                                                               ;93F24D;
    dw $2C31                                                             ;93F24E;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F250:
    dw $0006,$0008                                                       ;93F250;
    db $04                                                               ;93F254;
    dw $2C32,$0000                                                       ;93F255;
    db $04                                                               ;93F259;
    dw $2C31,$0000                                                       ;93F25A;
    db $FC                                                               ;93F25E;
    dw $2C32,$01F8                                                       ;93F25F;
    db $FC                                                               ;93F263;
    dw $2C31,$01F8                                                       ;93F264;
    db $F4                                                               ;93F268;
    dw $2C32,$01F0                                                       ;93F269;
    db $F4                                                               ;93F26D;
    dw $2C31                                                             ;93F26E;
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_A:
    dw $0008,$000C                                                       ;93F270;
    db $08                                                               ;93F274;
    dw $2C32,$0004                                                       ;93F275;
    db $08                                                               ;93F279;
    dw $2C31,$0004                                                       ;93F27A;
    db $00                                                               ;93F27E;
    dw $2C32,$01FC                                                       ;93F27F;
    db $00                                                               ;93F283;
    dw $2C31,$01FC                                                       ;93F284;
    db $F8                                                               ;93F288;
    dw $2C32,$01F4                                                       ;93F289;
    db $F8                                                               ;93F28D;
    dw $2C31,$01F4                                                       ;93F28E;
    db $F0                                                               ;93F292;
    dw $2C32,$01EC                                                       ;93F293;
    db $F0                                                               ;93F297;
    dw $2C31                                                             ;93F298;

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_B:
    dw $000A,$0010                                                       ;93F29A;
    db $0C                                                               ;93F29E;
    dw $2C32,$0008                                                       ;93F29F;
    db $0C                                                               ;93F2A3;
    dw $2C31,$0008                                                       ;93F2A4;
    db $04                                                               ;93F2A8;
    dw $2C32,$0000                                                       ;93F2A9;
    db $04                                                               ;93F2AD;
    dw $2C31,$0000                                                       ;93F2AE;
    db $FC                                                               ;93F2B2;
    dw $2C32,$01F8                                                       ;93F2B3;
    db $FC                                                               ;93F2B7;
    dw $2C31,$01F8                                                       ;93F2B8;
    db $F4                                                               ;93F2BC;
    dw $2C32,$01F0                                                       ;93F2BD;
    db $F4                                                               ;93F2C1;
    dw $2C31,$01F0                                                       ;93F2C2;
    db $EC                                                               ;93F2C6;
    dw $2C32,$01E8                                                       ;93F2C7;
    db $EC                                                               ;93F2CB;
    dw $2C31                                                             ;93F2CC;

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_C:
    dw $0002,$01F8                                                       ;93F2CE;
    db $FC                                                               ;93F2D2;
    dw $6C32,$0000                                                       ;93F2D3;
    db $FC                                                               ;93F2D7;
    dw $6C31                                                             ;93F2D8;

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_D:
    dw $0004,$01F4                                                       ;93F2DA;
    db $00                                                               ;93F2DE;
    dw $6C32,$01FC                                                       ;93F2DF;
    db $00                                                               ;93F2E3;
    dw $6C31,$01FC                                                       ;93F2E4;
    db $F8                                                               ;93F2E8;
    dw $6C32,$0004                                                       ;93F2E9;
    db $F8                                                               ;93F2ED;
    dw $6C31                                                             ;93F2EE;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F2F0:
    dw $0006,$01F0                                                       ;93F2F0;
    db $04                                                               ;93F2F4;
    dw $6C32,$01F8                                                       ;93F2F5;
    db $04                                                               ;93F2F9;
    dw $6C31,$01F8                                                       ;93F2FA;
    db $FC                                                               ;93F2FE;
    dw $6C32,$0000                                                       ;93F2FF;
    db $FC                                                               ;93F303;
    dw $6C31,$0000                                                       ;93F304;
    db $F4                                                               ;93F308;
    dw $6C32,$0008                                                       ;93F309;
    db $F4                                                               ;93F30D;
    dw $6C31                                                             ;93F30E;
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_E:
    dw $0008,$01EC                                                       ;93F310;
    db $08                                                               ;93F314;
    dw $6C32,$01F4                                                       ;93F315;
    db $08                                                               ;93F319;
    dw $6C31,$01F4                                                       ;93F31A;
    db $00                                                               ;93F31E;
    dw $6C32,$01FC                                                       ;93F31F;
    db $00                                                               ;93F323;
    dw $6C31,$01FC                                                       ;93F324;
    db $F8                                                               ;93F328;
    dw $6C32,$0004                                                       ;93F329;
    db $F8                                                               ;93F32D;
    dw $6C31,$0004                                                       ;93F32E;
    db $F0                                                               ;93F332;
    dw $6C32,$000C                                                       ;93F333;
    db $F0                                                               ;93F337;
    dw $6C31                                                             ;93F338;

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_F:
    dw $000A,$01E8                                                       ;93F33A;
    db $0C                                                               ;93F33E;
    dw $6C32,$01F0                                                       ;93F33F;
    db $0C                                                               ;93F343;
    dw $6C31,$01F0                                                       ;93F344;
    db $04                                                               ;93F348;
    dw $6C32,$01F8                                                       ;93F349;
    db $04                                                               ;93F34D;
    dw $6C31,$01F8                                                       ;93F34E;
    db $FC                                                               ;93F352;
    dw $6C32,$0000                                                       ;93F353;
    db $FC                                                               ;93F357;
    dw $6C31,$0000                                                       ;93F358;
    db $F4                                                               ;93F35C;
    dw $6C32,$0008                                                       ;93F35D;
    db $F4                                                               ;93F361;
    dw $6C31,$0008                                                       ;93F362;
    db $EC                                                               ;93F366;
    dw $6C32,$0010                                                       ;93F367;
    db $EC                                                               ;93F36B;
    dw $6C31                                                             ;93F36C;

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_10:
    dw $0001,$01FC                                                       ;93F36E;
    db $FC                                                               ;93F372;
    dw $2C34                                                             ;93F373;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F375:
    dw $0002,$0000                                                       ;93F375;
    db $FC                                                               ;93F379;
    dw $2C34,$01F8                                                       ;93F37A;
    db $FC                                                               ;93F37E;
    dw $2C34                                                             ;93F37F;
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_11:
    dw $0003,$0004                                                       ;93F381;
    db $FC                                                               ;93F385;
    dw $2C34,$01FC                                                       ;93F386;
    db $FC                                                               ;93F38A;
    dw $2C34,$01F4                                                       ;93F38B;
    db $FC                                                               ;93F38F;
    dw $2C34                                                             ;93F390;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F392:
    dw $0004,$0008                                                       ;93F392;
    db $FC                                                               ;93F396;
    dw $2C34,$0000                                                       ;93F397;
    db $FC                                                               ;93F39B;
    dw $2C34,$01F8                                                       ;93F39C;
    db $FC                                                               ;93F3A0;
    dw $2C34,$01F0                                                       ;93F3A1;
    db $FC                                                               ;93F3A5;
    dw $2C34                                                             ;93F3A6;

UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F3A8:
    dw $0005,$000C                                                       ;93F3A8;
    db $FC                                                               ;93F3AC;
    dw $2C34,$0004                                                       ;93F3AD;
    db $FC                                                               ;93F3B1;
    dw $2C34,$01FC                                                       ;93F3B2;
    db $FC                                                               ;93F3B6;
    dw $2C34,$01F4                                                       ;93F3B7;
    db $FC                                                               ;93F3BB;
    dw $2C34,$01EC                                                       ;93F3BC;
    db $FC                                                               ;93F3C0;
    dw $2C34                                                             ;93F3C1;
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_12:
    dw $0006,$0010                                                       ;93F3C3;
    db $FC                                                               ;93F3C7;
    dw $2C34,$0008                                                       ;93F3C8;
    db $FC                                                               ;93F3CC;
    dw $2C34,$0000                                                       ;93F3CD;
    db $FC                                                               ;93F3D1;
    dw $2C34,$01F8                                                       ;93F3D2;
    db $FC                                                               ;93F3D6;
    dw $2C34,$01F0                                                       ;93F3D7;
    db $FC                                                               ;93F3DB;
    dw $2C34,$01E8                                                       ;93F3DC;
    db $FC                                                               ;93F3E0;
    dw $2C34                                                             ;93F3E1;

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_13:
    dw $0007,$0014                                                       ;93F3E3;
    db $FC                                                               ;93F3E7;
    dw $2C34,$000C                                                       ;93F3E8;
    db $FC                                                               ;93F3EC;
    dw $2C34,$0004                                                       ;93F3ED;
    db $FC                                                               ;93F3F1;
    dw $2C34,$01FC                                                       ;93F3F2;
    db $FC                                                               ;93F3F6;
    dw $2C34,$01F4                                                       ;93F3F7;
    db $FC                                                               ;93F3FB;
    dw $2C34,$01EC                                                       ;93F3FC;
    db $FC                                                               ;93F400;
    dw $2C34,$01E4                                                       ;93F401;
    db $FC                                                               ;93F405;
    dw $2C34                                                             ;93F406;

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_14:
    dw $0001,$01FC                                                       ;93F408;
    db $FC                                                               ;93F40C;
    dw $2C37                                                             ;93F40D;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F40F:
    dw $0002,$01FC                                                       ;93F40F;
    db $00                                                               ;93F413;
    dw $2C37,$01FC                                                       ;93F414;
    db $F8                                                               ;93F418;
    dw $2C37                                                             ;93F419;
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_15:
    dw $0003,$01FC                                                       ;93F41B;
    db $04                                                               ;93F41F;
    dw $2C37,$01FC                                                       ;93F420;
    db $FC                                                               ;93F424;
    dw $2C37,$01FC                                                       ;93F425;
    db $F4                                                               ;93F429;
    dw $2C37                                                             ;93F42A;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F42C:
    dw $0004,$01FC                                                       ;93F42C;
    db $08                                                               ;93F430;
    dw $2C37,$01FC                                                       ;93F431;
    db $00                                                               ;93F435;
    dw $2C37,$01FC                                                       ;93F436;
    db $F8                                                               ;93F43A;
    dw $2C37,$01FC                                                       ;93F43B;
    db $F0                                                               ;93F43F;
    dw $2C37                                                             ;93F440;

UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F442:
    dw $0005,$01FC                                                       ;93F442;
    db $0C                                                               ;93F446;
    dw $2C37,$01FC                                                       ;93F447;
    db $04                                                               ;93F44B;
    dw $2C37,$01FC                                                       ;93F44C;
    db $FC                                                               ;93F450;
    dw $2C37,$01FC                                                       ;93F451;
    db $F4                                                               ;93F455;
    dw $2C37,$01FC                                                       ;93F456;
    db $EC                                                               ;93F45A;
    dw $2C37                                                             ;93F45B;
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_16:
    dw $0006,$01FC                                                       ;93F45D;
    db $10                                                               ;93F461;
    dw $2C37,$01FC                                                       ;93F462;
    db $08                                                               ;93F466;
    dw $2C37,$01FC                                                       ;93F467;
    db $00                                                               ;93F46B;
    dw $2C37,$01FC                                                       ;93F46C;
    db $F8                                                               ;93F470;
    dw $2C37,$01FC                                                       ;93F471;
    db $F0                                                               ;93F475;
    dw $2C37,$01FC                                                       ;93F476;
    db $E8                                                               ;93F47A;
    dw $2C37                                                             ;93F47B;

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_17:
    dw $0007,$01FC                                                       ;93F47D;
    db $14                                                               ;93F481;
    dw $2C37,$01FC                                                       ;93F482;
    db $0C                                                               ;93F486;
    dw $2C37,$01FC                                                       ;93F487;
    db $04                                                               ;93F48B;
    dw $2C37,$01FC                                                       ;93F48C;
    db $FC                                                               ;93F490;
    dw $2C37,$01FC                                                       ;93F491;
    db $F4                                                               ;93F495;
    dw $2C37,$01FC                                                       ;93F496;
    db $EC                                                               ;93F49A;
    dw $2C37,$01FC                                                       ;93F49B;
    db $E4                                                               ;93F49F;
    dw $2C37                                                             ;93F4A0;

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_18:
    dw $0002,$01FC                                                       ;93F4A2;
    db $F8                                                               ;93F4A6;
    dw $2C36,$01FC                                                       ;93F4A7;
    db $00                                                               ;93F4AB;
    dw $EC36                                                             ;93F4AC;

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_19:
    dw $0004,$0000                                                       ;93F4AE;
    db $04                                                               ;93F4B2;
    dw $EC36,$0000                                                       ;93F4B3;
    db $FC                                                               ;93F4B7;
    dw $EC35,$01F8                                                       ;93F4B8;
    db $F4                                                               ;93F4BC;
    dw $2C36,$01F8                                                       ;93F4BD;
    db $FC                                                               ;93F4C1;
    dw $2C35                                                             ;93F4C2;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F4C4:
    dw $0006,$01FC                                                       ;93F4C4;
    db $F8                                                               ;93F4C8;
    dw $EC35,$0004                                                       ;93F4C9;
    db $00                                                               ;93F4CD;
    dw $EC35,$0004                                                       ;93F4CE;
    db $08                                                               ;93F4D2;
    dw $EC36,$01F4                                                       ;93F4D3;
    db $F0                                                               ;93F4D7;
    dw $2C36,$01FC                                                       ;93F4D8;
    db $00                                                               ;93F4DC;
    dw $2C35,$01F4                                                       ;93F4DD;
    db $F8                                                               ;93F4E1;
    dw $2C35                                                             ;93F4E2;
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1A:
    dw $0008,$0008                                                       ;93F4E4;
    db $04                                                               ;93F4E8;
    dw $EC35,$01F8                                                       ;93F4E9;
    db $F4                                                               ;93F4ED;
    dw $EC35,$0000                                                       ;93F4EE;
    db $FC                                                               ;93F4F2;
    dw $EC35,$0008                                                       ;93F4F3;
    db $0C                                                               ;93F4F7;
    dw $EC36,$01F0                                                       ;93F4F8;
    db $EC                                                               ;93F4FC;
    dw $2C36,$0000                                                       ;93F4FD;
    db $04                                                               ;93F501;
    dw $2C35,$01F8                                                       ;93F502;
    db $FC                                                               ;93F506;
    dw $2C35,$01F0                                                       ;93F507;
    db $F4                                                               ;93F50B;
    dw $2C35                                                             ;93F50C;

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1B:
    dw $000A,$000C                                                       ;93F50E;
    db $10                                                               ;93F512;
    dw $EC36,$01EC                                                       ;93F513;
    db $E8                                                               ;93F517;
    dw $2C36,$000C                                                       ;93F518;
    db $08                                                               ;93F51C;
    dw $EC35,$0004                                                       ;93F51D;
    db $00                                                               ;93F521;
    dw $EC35,$01FC                                                       ;93F522;
    db $F8                                                               ;93F526;
    dw $EC35,$01F4                                                       ;93F527;
    db $F0                                                               ;93F52B;
    dw $EC35,$0004                                                       ;93F52C;
    db $08                                                               ;93F530;
    dw $2C35,$01FC                                                       ;93F531;
    db $00                                                               ;93F535;
    dw $2C35,$01F4                                                       ;93F536;
    db $F8                                                               ;93F53A;
    dw $2C35,$01EC                                                       ;93F53B;
    db $F0                                                               ;93F53F;
    dw $2C35                                                             ;93F540;

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1C:
    dw $0002,$01FC                                                       ;93F542;
    db $F8                                                               ;93F546;
    dw $6C36,$01FC                                                       ;93F547;
    db $00                                                               ;93F54B;
    dw $AC36                                                             ;93F54C;

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1D:
    dw $0004,$01F8                                                       ;93F54E;
    db $04                                                               ;93F552;
    dw $AC36,$01F8                                                       ;93F553;
    db $FC                                                               ;93F557;
    dw $AC35,$0000                                                       ;93F558;
    db $F4                                                               ;93F55C;
    dw $6C36,$0000                                                       ;93F55D;
    db $FC                                                               ;93F561;
    dw $6C35                                                             ;93F562;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F564:
    dw $0006,$01FC                                                       ;93F564;
    db $F8                                                               ;93F568;
    dw $AC35,$01F4                                                       ;93F569;
    db $00                                                               ;93F56D;
    dw $AC35,$01F4                                                       ;93F56E;
    db $08                                                               ;93F572;
    dw $AC36,$0004                                                       ;93F573;
    db $F0                                                               ;93F577;
    dw $6C36,$01FC                                                       ;93F578;
    db $00                                                               ;93F57C;
    dw $6C35,$0004                                                       ;93F57D;
    db $F8                                                               ;93F581;
    dw $6C35                                                             ;93F582;
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1E:
    dw $0008,$01F0                                                       ;93F584;
    db $04                                                               ;93F588;
    dw $AC35,$0000                                                       ;93F589;
    db $F4                                                               ;93F58D;
    dw $AC35,$01F8                                                       ;93F58E;
    db $FC                                                               ;93F592;
    dw $AC35,$01F0                                                       ;93F593;
    db $0C                                                               ;93F597;
    dw $AC36,$0008                                                       ;93F598;
    db $EC                                                               ;93F59C;
    dw $6C36,$01F8                                                       ;93F59D;
    db $04                                                               ;93F5A1;
    dw $6C35,$0000                                                       ;93F5A2;
    db $FC                                                               ;93F5A6;
    dw $6C35,$0008                                                       ;93F5A7;
    db $F4                                                               ;93F5AB;
    dw $6C35                                                             ;93F5AC;

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1F:
    dw $000A,$01EC                                                       ;93F5AE;
    db $10                                                               ;93F5B2;
    dw $AC36,$000C                                                       ;93F5B3;
    db $E8                                                               ;93F5B7;
    dw $6C36,$01EC                                                       ;93F5B8;
    db $08                                                               ;93F5BC;
    dw $AC35,$01F4                                                       ;93F5BD;
    db $00                                                               ;93F5C1;
    dw $AC35,$01FC                                                       ;93F5C2;
    db $F8                                                               ;93F5C6;
    dw $AC35,$0004                                                       ;93F5C7;
    db $F0                                                               ;93F5CB;
    dw $AC35,$01F4                                                       ;93F5CC;
    db $08                                                               ;93F5D0;
    dw $6C35,$01FC                                                       ;93F5D1;
    db $00                                                               ;93F5D5;
    dw $6C35,$0004                                                       ;93F5D6;
    db $F8                                                               ;93F5DA;
    dw $6C35,$000C                                                       ;93F5DB;
    db $F0                                                               ;93F5DF;
    dw $6C35                                                             ;93F5E0;

if !FEATURE_KEEP_UNREFERENCED
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
endif ; !FEATURE_KEEP_UNREFERENCED


Freespace_Bank93_F61D:                                                   ;93F61D;
; $9E3 bytes
