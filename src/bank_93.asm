
; Samus projectiles

org $938000


;;; $8000: Initialise projectile ;;;
InitializeProjectile:
;; Parameters:
;;     X: Projectile index

; Used for beam (uncharged / charged / hyper), (super) missile, ice SBA
    PHP                                                                  ;938000;
    PHB                                                                  ;938001;
    PHK                                                                  ;938002;
    PLB                                                                  ;938003;
    REP #$30                                                             ;938004;
    LDA.W SamusProjectile_Directions,X                                   ;938006;
    AND.W #$000F                                                         ;938009;
    ASL                                                                  ;93800C;
    STA.B DP_Temp12                                                      ;93800D;
    LDA.W SamusProjectile_Types,X                                        ;93800F;
    BIT.W #$0F00                                                         ;938012;
    BNE .notBeam                                                         ;938015;
    BIT.W #$0010                                                         ;938017;
    BNE .charged                                                         ;93801A;
    AND.W #$000F                                                         ;93801C;
    ASL                                                                  ;93801F;
    TAY                                                                  ;938020;
    LDA.W SamusProjectileDataPointers_UnchargedBeams,Y                   ;938021;
    TAY                                                                  ;938024;
    BRA .merge                                                           ;938025;

  .charged:
    AND.W #$000F                                                         ;938027;
    ASL                                                                  ;93802A;
    TAY                                                                  ;93802B;
    LDA.W SamusProjectileDataPointers_ChargedBeams,Y                     ;93802C;
    TAY                                                                  ;93802F;
    BRA .merge                                                           ;938030;

  .notBeam:
    XBA                                                                  ;938032;
    AND.W #$000F                                                         ;938033;
    ASL                                                                  ;938036;
    TAY                                                                  ;938037;
    LDA.W SamusProjectileDataPointers_NonBeam,Y                          ;938038;
    TAY                                                                  ;93803B;

  .merge:
    LDA.W $0000,Y                                                        ;93803C;
    STA.W SamusProjectile_Damages,X                                      ;93803F;
    BPL .dontCrash                                                       ;938042;
    JML.L Crash_Handler                                                  ;938044;

  .dontCrash:
    INY                                                                  ;938048;
    INY                                                                  ;938049;
    TYA                                                                  ;93804A;
    CLC                                                                  ;93804B;
    ADC.B DP_Temp12                                                      ;93804C;
    TAY                                                                  ;93804E;
    LDA.W $0000,Y                                                        ;93804F;
    STA.W SamusProjectile_InstructionPointers,X                          ;938052;
    TAY                                                                  ;938055;
    LDA.W $0004,Y                                                        ;938056;
    AND.W #$00FF                                                         ;938059;
    STA.W SamusProjectile_XRadii,X                                       ;93805C;
    LDA.W $0005,Y                                                        ;93805F;
    AND.W #$00FF                                                         ;938062;
    STA.W SamusProjectile_YRadii,X                                       ;938065;
    LDA.W #$0001                                                         ;938068;
    STA.W SamusProjectile_InstructionTimers,X                            ;93806B;
    PLB                                                                  ;93806E;
    PLP                                                                  ;93806F;
    RTL                                                                  ;938070;


;;; $8071: Initialise super missile link ;;;
InitializeSuperMissileLink:
; Instruction list is InstList_SamusProjectile_SuperMissileLink (loop of single instruction with 8x8 radius and dummy empty spritemap)
    PHP                                                                  ;938071;
    PHB                                                                  ;938072;
    PHK                                                                  ;938073;
    PLB                                                                  ;938074;
    REP #$30                                                             ;938075;
    LDA.W SamusProjectile_Types+1,X                                      ;938077;
    AND.W #$000F                                                         ;93807A;
    ASL                                                                  ;93807D;
    TAY                                                                  ;93807E;
    LDA.W SamusProjectileDataPointers_SuperMissileLink,Y                 ;93807F;
    TAY                                                                  ;938082;
    LDA.W $0000,Y                                                        ;938083;
    STA.W SamusProjectile_Damages,X                                      ;938086;
    BPL .dontCrash                                                       ;938089;
    JML.L Crash_Handler                                                  ;93808B;

  .dontCrash:
    INY                                                                  ;93808F;
    INY                                                                  ;938090;
    LDA.W $0000,Y                                                        ;938091;
    STA.W SamusProjectile_InstructionPointers,X                          ;938094;
    LDA.W #$0001                                                         ;938097;
    STA.W SamusProjectile_InstructionTimers,X                            ;93809A;
    PLB                                                                  ;93809D;
    PLP                                                                  ;93809E;
    RTL                                                                  ;93809F;


;;; $80A0: Initialise (power) bomb ;;;
InitializeBomb:
    PHP                                                                  ;9380A0;
    PHB                                                                  ;9380A1;
    PHK                                                                  ;9380A2;
    PLB                                                                  ;9380A3;
    REP #$30                                                             ;9380A4;
    LDA.W SamusProjectile_Types+1,X                                      ;9380A6;
    AND.W #$000F                                                         ;9380A9;
    ASL                                                                  ;9380AC;
    TAY                                                                  ;9380AD;
    LDA.W SamusProjectileDataPointers_NonBeam,Y                          ;9380AE;
    TAY                                                                  ;9380B1;
    LDA.W $0000,Y                                                        ;9380B2;
    STA.W SamusProjectile_Damages,X                                      ;9380B5;
    BPL .dontCrash                                                       ;9380B8;
    JML.L Crash_Handler                                                  ;9380BA;

  .dontCrash:
    INY                                                                  ;9380BE;
    INY                                                                  ;9380BF;
    LDA.W $0000,Y                                                        ;9380C0;
    STA.W SamusProjectile_InstructionPointers,X                          ;9380C3;
    LDA.W #$0001                                                         ;9380C6;
    STA.W SamusProjectile_InstructionTimers,X                            ;9380C9;
    PLB                                                                  ;9380CC;
    PLP                                                                  ;9380CD;
    RTL                                                                  ;9380CE;


;;; $80CF: Part of kill projectile - queue sound effect and set instruction ;;;
PartOfKillProjectile_QueueSFX_SetInstruction:
; Called by Kill_Projectile
    PHP                                                                  ;9380CF;
    PHB                                                                  ;9380D0;
    PHK                                                                  ;9380D1;
    PLB                                                                  ;9380D2;
    REP #$30                                                             ;9380D3;
    LDA.W SamusProjectile_Types,X                                        ;9380D5;
    BIT.W #$0F00                                                         ;9380D8;
    BNE .notBeam                                                         ;9380DB;
    LDA.W SamusProjectile_Types,X                                        ;9380DD;
    AND.W #$F0FF                                                         ;9380E0;
    ORA.W #$0700                                                         ;9380E3;
    STA.W SamusProjectile_Types,X                                        ;9380E6;
    LDA.W ProjectileDataTable_NonBeam_BeamExplosion_pointer              ;9380E9;
    STA.W SamusProjectile_InstructionPointers,X                          ;9380EC;
    LDA.W #$000C                                                         ;9380EF;
    JSL.L QueueSound_Lib2_Max6                                           ;9380F2;
    BRA .return                                                          ;9380F6;

  .notBeam:
    LDA.W CinematicFunction                                              ;9380F8;
    BNE .setExplosion                                                    ;9380FB;
    LDA.W #$0007                                                         ;9380FD;
    JSL.L QueueSound_Lib2_Max6                                           ;938100;

  .setExplosion:
    LDA.W SamusProjectile_Types,X                                        ;938104;
    PHA                                                                  ;938107;
    AND.W #$F0FF                                                         ;938108;
    ORA.W #$0800                                                         ;93810B;
    STA.W SamusProjectile_Types,X                                        ;93810E;
    PLA                                                                  ;938111;
    BIT.W #$0200                                                         ;938112;
    BNE .superMissile                                                    ;938115;
    LDA.W ProjectileDataTable_NonBeam_MissileExplosion_pointer           ;938117;
    STA.W SamusProjectile_InstructionPointers,X                          ;93811A;
    BRA .setCooldown                                                     ;93811D;

  .superMissile:
    LDA.W ProjectileDataTable_NonBeam_SuperMissileExplosion_pointer      ;93811F;
    STA.W SamusProjectile_InstructionPointers,X                          ;938122;
    LDA.W #$0014                                                         ;938125;
    STA.W EarthquakeType                                                 ;938128;
    LDA.W #$001E                                                         ;93812B;
    STA.W EarthquakeTimer                                                ;93812E;

  .setCooldown:
    LDA.W SamusProjectile_CooldownTimer                                  ;938131;
    CMP.W #$0015                                                         ;938134;
    BMI .return                                                          ;938137;
    LDA.W #$0014                                                         ;938139;
    STA.W SamusProjectile_CooldownTimer                                  ;93813C;

  .return:
    LDA.W #$0001                                                         ;93813F;
    STA.W SamusProjectile_InstructionTimers,X                            ;938142;
    LDA.W #$0008                                                         ;938145;
    STA.W SamusProjectile_Damages,X                                      ;938148;
    PLB                                                                  ;93814B;
    PLP                                                                  ;93814C;
    RTL                                                                  ;93814D;


;;; $814E: Initialise bomb explosion ;;;
Initialize_Bomb_Explosion:
; conditional %rumble
    PHP                                                                  ;93814E;
    PHB                                                                  ;93814F;
    PHK                                                                  ;938150;
    PLB                                                                  ;938151;
    SEP #$20
    LDA.b RumbleData : BNE +
    LDA #$11 : STA.b RumbleData
    LDA.b RumbleTime : CMP #$04 : BPL +
    LDA #$04 : STA.b RumbleTime
+   REP #$30                                                             ;938152;
    LDA.W ProjectileDataTable_NonBeam_BombExplosion_pointer              ;938154;
    STA.W SamusProjectile_InstructionPointers,X                          ;938157;
    LDA.W #$0001                                                         ;93815A;
    STA.W SamusProjectile_InstructionTimers,X                            ;93815D;
    PLB                                                                  ;938160;
    PLP                                                                  ;938161;
    RTL                                                                  ;938162;


;;; $8163: Initialise shinespark echo or spazer SBA trail projectile ;;;
Initialize_ShinesparkEcho_or_SpazerSBATrailProjectile:
    PHP                                                                  ;938163;
    PHB                                                                  ;938164;
    PHK                                                                  ;938165;
    PLB                                                                  ;938166;
    REP #$30                                                             ;938167;
    LDA.W SamusProjectile_Directions,X                                   ;938169;
    AND.W #$000F                                                         ;93816C;
    ASL                                                                  ;93816F;
    STA.B DP_Temp12                                                      ;938170;
    LDA.W SamusProjectile_Types,X                                        ;938172;
    AND.W #$00FF                                                         ;938175;
    SEC                                                                  ;938178;
    SBC.W #$0022                                                         ;938179;
    ASL                                                                  ;93817C;
    TAY                                                                  ;93817D;
    LDA.W SamusProjectileDataPointers_ShinesparkEcho_SpazerSBATrail,Y    ;93817E;
    TAY                                                                  ;938181;
    LDA.W $0000,Y                                                        ;938182;
    STA.W SamusProjectile_Damages,X                                      ;938185;
    BPL .dontCrash                                                       ;938188;
    JML.L Crash_Handler                                                  ;93818A;

  .dontCrash:
    INY                                                                  ;93818E;
    INY                                                                  ;93818F;
    TYA                                                                  ;938190;
    CLC                                                                  ;938191;
    ADC.B DP_Temp12                                                      ;938192;
    TAY                                                                  ;938194;
    LDA.W $0000,Y                                                        ;938195;
    STA.W SamusProjectile_InstructionPointers,X                          ;938198;
    LDA.W #$0001                                                         ;93819B;
    STA.W SamusProjectile_InstructionTimers,X                            ;93819E;
    PLB                                                                  ;9381A1;
    PLP                                                                  ;9381A2;
    RTL                                                                  ;9381A3;


;;; $81A4: Initialise SBA projectile ;;;
InitializeSBAProjectile:
; Excluding ice SBA, which is run as a regular projectile
    PHP                                                                  ;9381A4;
    PHB                                                                  ;9381A5;
    PHK                                                                  ;9381A6;
    PLB                                                                  ;9381A7;
    REP #$30                                                             ;9381A8;
    LDA.W SamusProjectile_Types,X                                        ;9381AA;
    AND.W #$000F                                                         ;9381AD;
    ASL                                                                  ;9381B0;
    TAY                                                                  ;9381B1;
    LDA.W SamusProjectileDataPointers_SBA,Y                              ;9381B2;
    TAY                                                                  ;9381B5;
    LDA.W $0000,Y                                                        ;9381B6;
    STA.W SamusProjectile_Damages,X                                      ;9381B9;
    BPL .dontCrash                                                       ;9381BC;
    JML.L Crash_Handler                                                  ;9381BE;

  .dontCrash:
    LDA.W $0002,Y                                                        ;9381C2;
    STA.W SamusProjectile_InstructionPointers,X                          ;9381C5;
    LDA.W #$0001                                                         ;9381C8;
    STA.W SamusProjectile_InstructionTimers,X                            ;9381CB;
    PLB                                                                  ;9381CE;
    PLP                                                                  ;9381CF;
    RTL                                                                  ;9381D0;


;;; $81D1: $16 = projectile trail frame ;;;
Get_ProjectileTrailFrame:
    PHP                                                                  ;9381D1;
    PHB                                                                  ;9381D2;
    PHK                                                                  ;9381D3;
    PLB                                                                  ;9381D4;
    REP #$30                                                             ;9381D5;
    PHY                                                                  ;9381D7;
    LDA.W SamusProjectile_InstructionPointers,X                          ;9381D8;
    SEC                                                                  ;9381DB;
    SBC.W #$0008                                                         ;9381DC;
    TAY                                                                  ;9381DF;
    LDA.W $0006,Y                                                        ;9381E0;
    STA.B DP_Temp16                                                      ;9381E3;
    PLY                                                                  ;9381E5;
    PLB                                                                  ;9381E6;
    PLP                                                                  ;9381E7;
    RTL                                                                  ;9381E8;


;;; $81E9: Projectile instruction handler ;;;
ProjectileInstructionHandler:
; Called by Handle_Projectiles
    PHP                                                                  ;9381E9;
    PHB                                                                  ;9381EA;
    PHK                                                                  ;9381EB;
    PLB                                                                  ;9381EC;
    REP #$30                                                             ;9381ED;
    LDX.W ProjectileIndex                                                ;9381EF;
    DEC.W SamusProjectile_InstructionTimers,X                            ;9381F2;
    BNE .return                                                          ;9381F5;
    LDY.W SamusProjectile_InstructionPointers,X                          ;9381F7;

  .loop:
    LDA.W $0000,Y                                                        ;9381FA;
    BPL .timer                                                           ;9381FD;
    STA.B DP_Temp12                                                      ;9381FF;
    INY                                                                  ;938201;
    INY                                                                  ;938202;
    PEA.W .loop-1                                                        ;938203;
    JMP.W (DP_Temp12)                                                    ;938206;

  .timer:
    STA.W SamusProjectile_InstructionTimers,X                            ;938209;
    LDA.W $0002,Y                                                        ;93820C;
    STA.W SamusProjectile_SpritemapPointers,X                            ;93820F;
    LDA.W $0004,Y                                                        ;938212;
    AND.W #$00FF                                                         ;938215;
    STA.W SamusProjectile_XRadii,X                                       ;938218;
    LDA.W $0005,Y                                                        ;93821B;
    AND.W #$00FF                                                         ;93821E;
    STA.W SamusProjectile_YRadii,X                                       ;938221;
    TYA                                                                  ;938224;
    CLC                                                                  ;938225;
    ADC.W #$0008                                                         ;938226;
    STA.W SamusProjectile_InstructionPointers,X                          ;938229;

  .return:
    PLB                                                                  ;93822C;
    PLP                                                                  ;93822D;
    RTL                                                                  ;93822E;


;;; $822F: Instruction - delete ;;;
Instruction_SamusProjectile_Delete:
    REP #$30                                                             ;93822F;
    JSL.L Clear_Projectile                                               ;938231;
    PLA                                                                  ;938235;
    PLB                                                                  ;938236;
    PLP                                                                  ;938237;
    RTL                                                                  ;938238;


;;; $8239: Instruction - go to [[Y]] ;;;
Instruction_SamusProjectile_GotoY:
    REP #$30                                                             ;938239;
    LDA.W $0000,Y                                                        ;93823B;
    TAY                                                                  ;93823E;
    RTS                                                                  ;93823F;


if !FEATURE_KEEP_UNREFERENCED
;;; $8240: Unused. Instruction - go to [[Y] + 2] if [bomb timer] <= [[Y]] else go to [[Y] + 4] ;;;
UNUSED_Instruction_SamusProj_GotoY_BasedOnBombTimer_938240:
    REP #$30                                                             ;938240;
    LDA.W $0000,Y                                                        ;938242;
    CMP.W SamusProjectile_Variables,X                                    ;938245;
    BPL .lessThanY                                                       ;938248;
    LDA.W $0004,Y                                                        ;93824A;
    TAY                                                                  ;93824D;
    RTS                                                                  ;93824E;

  .lessThanY:
    LDA.W $0002,Y                                                        ;93824F;
    TAY                                                                  ;938252;
    RTS                                                                  ;938253;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8254: Draw projectiles ;;;
DrawProjectiles:
    PHP                                                                  ;938254;
    REP #$30                                                             ;938255;
    LDX.W #$0008                                                         ;938257;
    STX.W ProjectileIndex                                                ;93825A;

  .loop:
    LDA.W SamusProjectile_InstructionPointers,X                          ;93825D;
    BNE +                                                                ;938260;
    JMP.W .next                                                          ;938262;

+   LDA.W SamusProjectile_Types,X                                        ;938265;
    BIT.W #$0F10                                                         ;938268;
    BNE .noFlickering                                                    ;93826B;
    BIT.W #$000C                                                         ;93826D;
    BNE .spazerPlasma                                                    ;938270;
    TXA                                                                  ;938272;
    BIT.W #$0002                                                         ;938273;
    BNE +                                                                ;938276;
    LDA.W NMI_FrameCounter                                               ;938278;
    BIT.W #$0001                                                         ;93827B;
    BNE .draw                                                            ;93827E;
    BRA .next                                                            ;938280;

+   LDA.W NMI_FrameCounter                                               ;938282;
    BIT.W #$0001                                                         ;938285;
    BNE .next                                                            ;938288;
    BRA .draw                                                            ;93828A;

  .spazerPlasma:
    TXA                                                                  ;93828C;
    BIT.W #$0002                                                         ;93828D;
    BNE +                                                                ;938290;
    LDA.W NMI_FrameCounter                                               ;938292;
    BIT.W #$0002                                                         ;938295;
    BNE .next                                                            ;938298;
    BRA .draw                                                            ;93829A;

+   LDA.W NMI_FrameCounter                                               ;93829C;
    BIT.W #$0002                                                         ;93829F;
    BEQ .next                                                            ;9382A2;
    BRA .draw                                                            ;9382A4;

  .noFlickering:
    AND.W #$0F00                                                         ;9382A6;
    CMP.W #$0300                                                         ;9382A9;
    BPL .next                                                            ;9382AC;

  .draw:
    LDA.W CeresStatus                                                    ;9382AE;
    BPL .noRotation                                                      ;9382B1;
    JSL.L Calculate_ProjectilePosition_InRotatingElevatorRoom            ;9382B3;
    LDA.B DP_Temp12                                                      ;9382B7;
    BRA .positionCalculated                                              ;9382B9;

  .noRotation:
    LDA.W SamusProjectile_XPositions,X                                   ;9382BB;
    SEC                                                                  ;9382BE;
    SBC.W Layer1XPosition                                                ;9382BF;
    STA.B DP_Temp14                                                      ;9382C2;
    LDA.W SamusProjectile_YPositions,X                                   ;9382C4;
    SEC                                                                  ;9382C7;
    SBC.W Layer1YPosition                                                ;9382C8;
    STA.B DP_Temp12                                                      ;9382CB;

  .positionCalculated:
    AND.W #$FF00                                                         ;9382CD;
    BNE +                                                                ;9382D0;
    LDA.W SamusProjectile_SpritemapPointers,X                            ;9382D2;
    BPL .loadIndex                                                       ;9382D5;
    JSL.L AddProjectileSpritemapToOAM                                    ;9382D7;
    BRA .loadIndex                                                       ;9382DB;

+   LDA.W SamusProjectile_SpritemapPointers,X                            ;9382DD;
    BPL .loadIndex                                                       ;9382E0;
    JSL.L RTL_818AB7                                                     ;9382E2;

  .loadIndex:
    LDX.W ProjectileIndex                                                ;9382E6;

  .next:
    DEX                                                                  ;9382E9;
    DEX                                                                  ;9382EA;
    STX.W ProjectileIndex                                                ;9382EB;
    BMI .echoes                                                          ;9382EE;
    JMP.W .loop                                                          ;9382F0;

  .echoes:
    JSL.L DrawShinesparkCrashEchoProjectiles                             ;9382F3;
    JSL.L HandleProjectileTrails                                         ;9382F7;
    PLP                                                                  ;9382FB;
    RTL                                                                  ;9382FC;


if !FEATURE_KEEP_UNREFERENCED
;;; $82FD: Unused. Partial draw projectiles ;;;
UNUSED_PartialDrawProjectiles_9982FD:
; Compared to DrawProjectiles, this routine doesn't handle flickering,
; doesn't draw shinespark crash echoes, and doesn't handle Ceres elevator room rotation.
; It also randomly subtracts 8 from the projectile's Y position.
    PHP                                                                  ;9382FD;
    REP #$30                                                             ;9382FE;
    LDX.W #$0008                                                         ;938300;
    STX.W ProjectileIndex                                                ;938303;

  .loop:
    LDA.W SamusProjectile_InstructionPointers,X                          ;938306;
    BEQ .next                                                            ;938309;
    LDA.W SamusProjectile_XPositions,X                                   ;93830B;
    SEC                                                                  ;93830E;
    SBC.W Layer1XPosition                                                ;93830F;
    STA.B DP_Temp14                                                      ;938312;
    LDA.W SamusProjectile_YPositions,X                                   ;938314;
    SEC                                                                  ;938317;
    SBC.W #$0008                                                         ;938318;
    SEC                                                                  ;93831B;
    SBC.W Layer1YPosition                                                ;93831C;
    STA.B DP_Temp12                                                      ;93831F;
    AND.W #$FF00                                                         ;938321;
    BNE +                                                                ;938324;
    LDA.W SamusProjectile_SpritemapPointers,X                            ;938326;
    BPL .getIndex                                                        ;938329;
    JSL.L AddProjectileSpritemapToOAM                                    ;93832B;
    BRA .getIndex                                                        ;93832F;

+   LDA.W SamusProjectile_SpritemapPointers,X                            ;938331;
    BPL .getIndex                                                        ;938334;
    JSL.L RTL_818AB7                                                     ;938336;

  .getIndex:
    LDX.W ProjectileIndex                                                ;93833A;

  .next:
    DEX                                                                  ;93833D;
    DEX                                                                  ;93833E;
    STX.W ProjectileIndex                                                ;93833F;
    BMI .timerExpired                                                    ;938342;
    JMP.W .loop                                                          ;938344;

  .timerExpired:
    JSL.L HandleProjectileTrails                                         ;938347;
    PLP                                                                  ;93834B;
    RTL                                                                  ;93834C;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $834D: Draw bombs and projectile explosions ;;;
DrawBombsAndProjectileExplosions:
    PHP                                                                  ;93834D;
    REP #$30                                                             ;93834E;
    LDX.W #$0012                                                         ;938350;
    STX.W ProjectileIndex                                                ;938353;

  .loop:
    LDA.W SamusProjectile_InstructionPointers,X                          ;938356;
    BEQ .next                                                            ;938359;
    LDA.W SamusProjectile_Types,X                                        ;93835B;
    AND.W #$0F00                                                         ;93835E;
    CMP.W #$0300                                                         ;938361;
    BMI .next                                                            ;938364;
    BEQ .powerBomb                                                       ;938366;
    CMP.W #$0500                                                         ;938368;
    BEQ .normalPositionCalculation                                       ;93836B;
    LDA.W CeresStatus                                                    ;93836D;
    BPL .normalPositionCalculation                                       ;938370;
    JSL.L Calculate_ProjectilePosition_InRotatingElevatorRoom            ;938372;
    LDA.B DP_Temp12                                                      ;938376;
    BRA .calculatedPosition                                              ;938378;

  .powerBomb:
    LDA.W SamusProjectile_Variables,X                                    ;93837A;
    BEQ .next                                                            ;93837D;

  .normalPositionCalculation:
    LDA.W SamusProjectile_XPositions,X                                   ;93837F;
    SEC                                                                  ;938382;
    SBC.W Layer1XPosition                                                ;938383;
    STA.B DP_Temp14                                                      ;938386;
    CMP.W #$0130                                                         ;938388;
    BPL .next                                                            ;93838B;
    CMP.W #$FFD0                                                         ;93838D;
    BMI .next                                                            ;938390;
    LDA.W SamusProjectile_YPositions,X                                   ;938392;
    SEC                                                                  ;938395;
    SBC.W Layer1YPosition                                                ;938396;
    STA.B DP_Temp12                                                      ;938399;

  .calculatedPosition:
    AND.W #$FF00                                                         ;93839B;
    BNE .offScreen                                                       ;93839E;
    LDA.W SamusProjectile_SpritemapPointers,X                            ;9383A0;
    JSL.L AddProjectileSpritemapToOAM                                    ;9383A3;
    LDX.W ProjectileIndex                                                ;9383A7;
    BRA .next                                                            ;9383AA;

  .offScreen:
    LDA.W SamusProjectile_SpritemapPointers,X                            ;9383AC;
    JSL.L RTL_818AB7                                                     ;9383AF;
    LDX.W ProjectileIndex                                                ;9383B3;

  .next:
    DEX                                                                  ;9383B6;
    DEX                                                                  ;9383B7;
    STX.W ProjectileIndex                                                ;9383B8;
    BPL .loop                                                            ;9383BB;
    PLP                                                                  ;9383BD;
    RTL                                                                  ;9383BE;


;;; $83BF: Hyper beam damage value ;;;
HyperBeamDamageValue:
    dw $03E8                                                             ;9383BF;


;;; $83C1: Projectile damage and instruction list table pointers ;;;
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


;;; $8431: Projectile damage and instruction list tables ;;;
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
  .pointer:
    dw InstList_SamusProjectile_BeamExplosion                            ;93867B;

ProjectileDataTable_NonBeam_MissileExplosion:
    dw $0008                                                             ;93867D; Damage is ignored
  .pointer:
    dw InstList_SamusProjectile_MissileExplosion                         ;93867F;

ProjectileDataTable_NonBeam_BombExplosion:
    dw $0000                                                             ;938681; Damage is ignored
  .pointer:
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
  .pointer:
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

; Instruction format:
;     If t & 8000h = 0:
;         tttt ssss xx yy ffff
;         t: Timer
;         s: Spritemap pointer
;         x: Projectile X radius
;         y: Projectile Y radius
;         f: Projectile trail frame. Used to index beam trail offset table, see BeamTrailOffsets_uncharged
;     If p & 8000h != 0:
;         pppp
;         p: Pointer to function

;;; $86DB: Instruction list - power - up ;;;
InstList_SamusProjectile_Power_Up:
    dw $000F,ProjectileFlareSpritemaps_Power_2                           ;9386DB;
    db $04,$04 : dw $0000                                                ;9386DF;
    dw Instruction_SamusProjectile_GotoY                                 ;9386E3;
    dw InstList_SamusProjectile_Power_Up                                 ;9386E5;


;;; $86E7: Instruction list - power - up-right ;;;
InstList_SamusProjectile_Power_UpRight:
    dw $000F,ProjectileFlareSpritemaps_Power_3                           ;9386E7;
    db $08,$04 : dw $0000                                                ;9386EB;
    dw Instruction_SamusProjectile_GotoY                                 ;9386EF;
    dw InstList_SamusProjectile_Power_UpRight                            ;9386F1;


;;; $86F3: Instruction list - power - right ;;;
InstList_SamusProjectile_Power_Right:
    dw $000F,ProjectileFlareSpritemaps_Power_4                           ;9386F3;
    db $08,$04 : dw $0000                                                ;9386F7;
    dw Instruction_SamusProjectile_GotoY                                 ;9386FB;
    dw InstList_SamusProjectile_Power_Right                              ;9386FD;


;;; $86FF: Instruction list - power - down-right ;;;
InstList_SamusProjectile_Power_DownRight:
    dw $000F,ProjectileFlareSpritemaps_Power_5                           ;9386FF;
    db $08,$04 : dw $0000                                                ;938703;
    dw Instruction_SamusProjectile_GotoY                                 ;938707;
    dw InstList_SamusProjectile_Power_DownRight                          ;938709;


;;; $870B: Instruction list - power - down ;;;
InstList_SamusProjectile_Power_Down:
    dw $000F,ProjectileFlareSpritemaps_Power_6                           ;93870B;
    db $04,$04 : dw $0000                                                ;93870F;
    dw Instruction_SamusProjectile_GotoY                                 ;938713;
    dw InstList_SamusProjectile_Power_Down                               ;938715;


;;; $8717: Instruction list - power - down-left ;;;
InstList_SamusProjectile_Power_DownLeft:
    dw $000F,ProjectileFlareSpritemaps_Power_7                           ;938717;
    db $08,$04 : dw $0000                                                ;93871B;
    dw Instruction_SamusProjectile_GotoY                                 ;93871F;
    dw InstList_SamusProjectile_Power_DownLeft                           ;938721;


;;; $8723: Instruction list - power - left ;;;
InstList_SamusProjectile_Power_Left:
    dw $000F,ProjectileFlareSpritemaps_Power_0                           ;938723;
    db $08,$04 : dw $0000                                                ;938727;
    dw Instruction_SamusProjectile_GotoY                                 ;93872B;
    dw InstList_SamusProjectile_Power_Left                               ;93872D;


;;; $872F: Instruction list - power - up-left ;;;
InstList_SamusProjectile_Power_UpLeft:
    dw $000F,ProjectileFlareSpritemaps_Power_1                           ;93872F;
    db $08,$04 : dw $0000                                                ;938733;
    dw Instruction_SamusProjectile_GotoY                                 ;938737;
    dw InstList_SamusProjectile_Power_UpLeft                             ;938739;


;;; $873B: Instruction list - wave / ice + wave - up ;;;
InstList_SamusProjectile_Wave_IceWave_Up:
    dw $0004,Spritemap_Nothing_93A117                                    ;93873B;
    db $0C,$04 : dw $0000                                                ;93873F;


;;; $8743: Instruction list - wave / ice + wave - down ;;;
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


;;; $87C7: Instruction list - wave / ice + wave - down-left / up-right ;;;
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


;;; $884B: Instruction list - wave / ice + wave - left / right ;;;
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


;;; $88CF: Instruction list - wave / ice + wave - down-right / up-left ;;;
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


;;; $8953: Instruction list - ice ;;;
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


;;; $8977: Instruction list - spazer / spazer + ice - up ;;;
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


;;; $8993: Instruction list - spazer / spazer + ice - up-right ;;;
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


;;; $89AF: Instruction list - spazer / spazer + ice - right ;;;
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


;;; $89CB: Instruction list - spazer / spazer + ice - down-right ;;;
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


;;; $89E7: Instruction list - spazer / spazer + ice - down ;;;
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


;;; $8A03: Instruction list - spazer / spazer + ice - down-left ;;;
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


;;; $8A1F: Instruction list - spazer / spazer + ice - left ;;;
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


;;; $8A3B: Instruction list - spazer / spazer + ice - up-left ;;;
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


;;; $8A57: Instruction list - spazer + wave / spazer + ice + wave - up ;;;
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


;;; $8AAB: Instruction list - spazer + wave / spazer + ice + wave - up-right ;;;
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


;;; $8AFF: Instruction list - spazer + wave / spazer + ice + wave - right ;;;
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


;;; $8B53: Instruction list - spazer + wave / spazer + ice + wave - down-right ;;;
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


;;; $8BA7: Instruction list - spazer + wave / spazer + ice + wave - down ;;;
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


;;; $8BFB: Instruction list - spazer + wave / spazer + ice + wave - down-left ;;;
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


;;; $8C4F: Instruction list - spazer + wave / spazer + ice + wave - left ;;;
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


;;; $8CA3: Instruction list - spazer + wave / spazer + ice + wave - up-left ;;;
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


;;; $8CF7: Instruction list - plasma / plasma + ice - down / up ;;;
InstList_SamusProjectile_Plasma_PlasmaIce_Down_Up_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_4             ;938CF7;
    db $08,$10 : dw $0000                                                ;938CFB;

InstList_SamusProjectile_Plasma_PlasmaIce_Down_Up_1:
    dw $000F,ProjectileFlareSpritemaps_Plasma_PlasmaIce_2                ;938CFF;
    db $08,$10 : dw $0001                                                ;938D03;
    dw Instruction_SamusProjectile_GotoY                                 ;938D07;
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Down_Up_1               ;938D09;


;;; $8D0B: Instruction list - plasma / plasma + ice - down-left / up-right ;;;
InstList_SamusProjectile_Plasma_PlasmaIce_DownLeft_UpRight_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_C             ;938D0B;
    db $08,$08 : dw $0000                                                ;938D0F;

InstList_SamusProjectile_Plasma_PlasmaIce_DownLeft_UpRight_1:
    dw $000F,ProjectileFlareSpritemaps_Plasma_PlasmaIce_3                ;938D13;
    db $08,$08 : dw $0001                                                ;938D17;
    dw Instruction_SamusProjectile_GotoY                                 ;938D1B;
    dw InstList_SamusProjectile_Plasma_PlasmaIce_DownLeft_UpRight_1      ;938D1D;


;;; $8D1F: Instruction list - plasma / plasma + ice - left / right ;;;
InstList_SamusProjectile_Plasma_PlasmaIce_Left_Right_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_0             ;938D1F;
    db $08,$08 : dw $0000                                                ;938D23;

InstList_SamusProjectile_Plasma_PlasmaIce_Left_Right_1:
    dw $000F,ProjectileFlareSpritemaps_Plasma_PlasmaIce_0                ;938D27;
    db $10,$08 : dw $0001                                                ;938D2B;
    dw Instruction_SamusProjectile_GotoY                                 ;938D2F;
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Left_Right_1            ;938D31;


;;; $8D33: Instruction list - plasma / plasma + ice - down-right / up-left ;;;
InstList_SamusProjectile_Plasma_PlasmaIce_DownRight_UpLeft_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_8             ;938D33;
    db $08,$08 : dw $0000                                                ;938D37;

InstList_SamusProjectile_Plasma_PlasmaIce_DownRight_UpLeft_1:
    dw $000F,ProjectileFlareSpritemaps_Plasma_PlasmaIce_1                ;938D3B;
    db $08,$08 : dw $0001                                                ;938D3F;
    dw Instruction_SamusProjectile_GotoY                                 ;938D43;
    dw InstList_SamusProjectile_Plasma_PlasmaIce_DownRight_UpLeft_1      ;938D45;


;;; $8D47: Instruction list - plasma + ice + wave - down / up ;;;
InstList_SamusProjectile_PlasmaIceWave_Down_Up:
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_4             ;938D47;
    db $0C,$10 : dw $0000                                                ;938D4B;


;;; $8D4F: Instruction list - plasma + wave - down / up ;;;
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


;;; $8D93: Instruction list - plasma + ice + wave - down-left / up-right ;;;
InstList_SamusProjectile_PlasmaIceWave_DownLeft_UpRight:
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_C             ;938D93;
    db $08,$08 : dw $0000                                                ;938D97;


;;; $8D9B: Instruction list - plasma + wave - down-left / up-right ;;;
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


;;; $8DDF: Instruction list - plasma + wave / plasma + ice + wave - left / right ;;;
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


;;; $8E2B: Instruction list - plasma + ice + wave - down-right / up-left ;;;
InstList_SamusProjectile_PlasmaIceWave_DownRight_UpLeft:
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_8             ;938E2B;
    db $08,$08 : dw $0000                                                ;938E2F;


;;; $8E33: Instruction list - plasma + wave - down-right / up-left ;;;
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


;;; $8E77: Instruction list - charged power - up ;;;
InstList_SamusProjectile_Charged_Power_Up:
    dw $0001,ProjectileFlareSpritemaps_Charged_Power_2                   ;938E77;
    db $08,$08 : dw $0000                                                ;938E7B;
    dw $0001,ProjectileFlareSpritemaps_Charged_Power_A                   ;938E7D;
    db $08,$08 : dw $0001                                                ;938E83;
    dw Instruction_SamusProjectile_GotoY                                 ;938E87;
    dw InstList_SamusProjectile_Charged_Power_Up                         ;938E89;


;;; $8E8B: Instruction list - charged power - up-right ;;;
InstList_SamusProjectile_Charged_Power_UpRight:
    dw $0001,ProjectileFlareSpritemaps_Charged_Power_3                   ;938E8B;
    db $08,$08 : dw $0000                                                ;938E8F;
    dw $0001,ProjectileFlareSpritemaps_Charged_Power_B                   ;938E91;
    db $08,$08 : dw $0001                                                ;938E97;
    dw Instruction_SamusProjectile_GotoY                                 ;938E9B;
    dw InstList_SamusProjectile_Charged_Power_UpRight                    ;938E9D;


;;; $8E9F: Instruction list - charged power - right ;;;
InstList_SamusProjectile_Charged_Power_Right:
    dw $0001,ProjectileFlareSpritemaps_Charged_Power_4                   ;938E9F;
    db $08,$08 : dw $0000                                                ;938EA3;
    dw $0001,ProjectileFlareSpritemaps_Charged_Power_C                   ;938EA5;
    db $08,$08 : dw $0001                                                ;938EAB;
    dw Instruction_SamusProjectile_GotoY                                 ;938EAF;
    dw InstList_SamusProjectile_Charged_Power_Right                      ;938EB1;


;;; $8EB3: Instruction list - charged power - down-right ;;;
InstList_SamusProjectile_Charged_Power_DownRight:
    dw $0001,ProjectileFlareSpritemaps_Charged_Power_5                   ;938EB3;
    db $08,$08 : dw $0000                                                ;938EB7;
    dw $0001,ProjectileFlareSpritemaps_Charged_Power_D                   ;938EB9;
    db $08,$08 : dw $0001                                                ;938EBF;
    dw Instruction_SamusProjectile_GotoY                                 ;938EC3;
    dw InstList_SamusProjectile_Charged_Power_DownRight                  ;938EC5;


;;; $8EC7: Instruction list - charged power - down ;;;
InstList_SamusProjectile_Charged_Power_Down:
    dw $0001,ProjectileFlareSpritemaps_Charged_Power_6                   ;938EC7;
    db $08,$08 : dw $0000                                                ;938ECB;
    dw $0001,ProjectileFlareSpritemaps_Charged_Power_E                   ;938ECD;
    db $08,$08 : dw $0001                                                ;938ED3;
    dw Instruction_SamusProjectile_GotoY                                 ;938ED7;
    dw InstList_SamusProjectile_Charged_Power_Down                       ;938ED9;


;;; $8EDB: Instruction list - charged power - down-left ;;;
InstList_SamusProjectile_Charged_Power_DownLeft:
    dw $0001,ProjectileFlareSpritemaps_Charged_Power_7                   ;938EDB;
    db $08,$08 : dw $0000                                                ;938EDF;
    dw $0001,ProjectileFlareSpritemaps_Charged_Power_F                   ;938EE1;
    db $08,$08 : dw $0001                                                ;938EE7;
    dw Instruction_SamusProjectile_GotoY                                 ;938EEB;
    dw InstList_SamusProjectile_Charged_Power_DownLeft                   ;938EED;


;;; $8EEF: Instruction list - charged power - left ;;;
InstList_SamusProjectile_Charged_Power_Left:
    dw $0001,ProjectileFlareSpritemaps_Charged_Power_0                   ;938EEF;
    db $08,$08 : dw $0000                                                ;938EF3;
    dw $0001,ProjectileFlareSpritemaps_Charged_Power_8                   ;938EF5;
    db $08,$08 : dw $0001                                                ;938EFB;
    dw Instruction_SamusProjectile_GotoY                                 ;938EFF;
    dw InstList_SamusProjectile_Charged_Power_Left                       ;938F01;


;;; $8F03: Instruction list - charged power - up-left ;;;
InstList_SamusProjectile_Charged_Power_UpLeft:
    dw $0001,ProjectileFlareSpritemaps_Charged_Power_1                   ;938F03;
    db $08,$08 : dw $0000                                                ;938F07;
    dw $0001,ProjectileFlareSpritemaps_Charged_Power_9                   ;938F09;
    db $08,$08 : dw $0001                                                ;938F0F;
    dw Instruction_SamusProjectile_GotoY                                 ;938F13;
    dw InstList_SamusProjectile_Charged_Power_UpLeft                     ;938F15;


;;; $8F17: Instruction list - charged wave - up ;;;
InstList_SamusProjectile_Charged_Wave_Up:
    dw $0003,Spritemap_Nothing_93A117                                    ;938F17;
    db $0C,$08 : dw $0000                                                ;938F1B;


;;; $8F1F: Instruction list - charged wave - down ;;;
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


;;; $8FA3: Instruction list - charged wave - down-left / up-right ;;;
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


;;; $9027: Instruction list - charged wave - left / right ;;;
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


;;; $90AB: Instruction list - charged wave - down-right / up-left ;;;
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


;;; $912F: Instruction list - charged ice ;;;
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


;;; $9153: Instruction list - charged ice + wave - up ;;;
InstList_SamusProjectile_Charged_IW_Up:
    dw $0003,Spritemap_Nothing_93A117                                    ;939153;
    db $0C,$08 : dw $0000                                                ;939157;


;;; $915B: Instruction list - charged ice + wave - down ;;;
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


;;; $91DF: Instruction list - charged ice + wave - down-left / up-right ;;;
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


;;; $9263: Instruction list - charged ice + wave - left / right ;;;
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


;;; $92E7: Instruction list - charged ice + wave - down-right / up-left ;;;
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


;;; $936B: Instruction list - charged spazer / spazer + ice - down / up ;;;
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


;;; $93BF: Instruction list - charged spazer / spazer + ice - down-left / up-right ;;;
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


;;; $9413: Instruction list - charged spazer / spazer + ice - left / right ;;;
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


;;; $9467: Instruction list - charged spazer / spazer + ice - down-right / up-left ;;;
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


;;; $94BB: Instruction list - charged spazer + wave / spazer + ice + wave - up ;;;
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


;;; $957F: Instruction list - charged spazer + wave / spazer + ice + wave - up-right ;;;
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


;;; $9643: Instruction list - charged spazer + wave / spazer + ice + wave - right ;;;
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


;;; $9707: Instruction list - charged spazer + wave / spazer + ice + wave - down-right ;;;
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


;;; $97CB: Instruction list - charged spazer + wave / spazer + ice + wave - down ;;;
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


;;; $988F: Instruction list - charged spazer + wave / spazer + ice + wave - down-left ;;;
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


;;; $9953: Instruction list - charged spazer + wave / spazer + ice + wave - left ;;;
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


;;; $9A17: Instruction list - charged spazer + wave / spazer + ice + wave - up-left ;;;
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


;;; $9ADB: Instruction list - charged plasma / plasma + ice - down / up ;;;
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


;;; $9B1F: Instruction list - charged plasma / plasma + ice - down-left / up-right ;;;
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


;;; $9B63: Instruction list - charged plasma / plasma + ice - left / right ;;;
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


;;; $9BA7: Instruction list - charged plasma / plasma + ice - down-right / up-left ;;;
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


;;; $9BEB: Instruction list - charged plasma + wave / plasma + ice + wave - down / up ;;;
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


;;; $9C9F: Instruction list - charged plasma + wave / plasma + ice + wave - down-left / up-right ;;;
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


;;; $9D53: Instruction list - charged plasma + wave / plasma + ice + wave - left / right ;;;
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


;;; $9E07: Instruction list - charged plasma + wave / plasma + ice + wave - down-right / up-left ;;;
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


;;; $9EBB: Instruction list - missiles - up ;;;
InstList_SamusProjectile_Missiles_Up:
    dw $000F,ProjectileFlareSpritemaps_Missile_2                         ;939EBB;
    db $04,$04 : dw $0000                                                ;939EBF;
    dw Instruction_SamusProjectile_GotoY                                 ;939EC3;
    dw InstList_SamusProjectile_Missiles_Up                              ;939EC5;


;;; $9EC7: Instruction list - missiles - up-right ;;;
InstList_SamusProjectile_Missiles_UpRight:
    dw $000F,ProjectileFlareSpritemaps_Missile_3                         ;939EC7;
    db $04,$04 : dw $0000                                                ;939ECB;
    dw Instruction_SamusProjectile_GotoY                                 ;939ECF;
    dw InstList_SamusProjectile_Missiles_UpRight                         ;939ED1;


;;; $9ED3: Instruction list - missiles - right ;;;
InstList_SamusProjectile_Missiles_Right:
    dw $000F,ProjectileFlareSpritemaps_Missile_4                         ;939ED3;
    db $04,$04 : dw $0000                                                ;939ED7;
    dw Instruction_SamusProjectile_GotoY                                 ;939EDB;
    dw InstList_SamusProjectile_Missiles_Right                           ;939EDD;


;;; $9EDF: Instruction list - missiles - down-right ;;;
InstList_SamusProjectile_Missiles_DownRight:
    dw $000F,ProjectileFlareSpritemaps_Missile_5                         ;939EDF;
    db $04,$04 : dw $0000                                                ;939EE3;
    dw Instruction_SamusProjectile_GotoY                                 ;939EE7;
    dw InstList_SamusProjectile_Missiles_DownRight                       ;939EE9;


;;; $9EEB: Instruction list - missiles - down ;;;
InstList_SamusProjectile_Missiles_Down:
    dw $000F,ProjectileFlareSpritemaps_Missile_6                         ;939EEB;
    db $04,$04 : dw $0000                                                ;939EEF;
    dw Instruction_SamusProjectile_GotoY                                 ;939EF3;
    dw InstList_SamusProjectile_Missiles_Down                            ;939EF5;


;;; $9EF7: Instruction list - missiles - down-left ;;;
InstList_SamusProjectile_Missiles_DownLeft:
    dw $000F,ProjectileFlareSpritemaps_Missile_7                         ;939EF7;
    db $04,$04 : dw $0000                                                ;939EFB;
    dw Instruction_SamusProjectile_GotoY                                 ;939EFF;
    dw InstList_SamusProjectile_Missiles_DownLeft                        ;939F01;


;;; $9F03: Instruction list - missiles - left ;;;
InstList_SamusProjectile_Missiles_Left:
    dw $000F,ProjectileFlareSpritemaps_Missile_0                         ;939F03;
    db $04,$04 : dw $0000                                                ;939F07;
    dw Instruction_SamusProjectile_GotoY                                 ;939F0B;
    dw InstList_SamusProjectile_Missiles_Left                            ;939F0D;


;;; $9F0F: Instruction list - missiles - up-left ;;;
InstList_SamusProjectile_Missiles_UpLeft:
    dw $000F,ProjectileFlareSpritemaps_Missile_1                         ;939F0F;
    db $04,$04 : dw $0000                                                ;939F13;
    dw Instruction_SamusProjectile_GotoY                                 ;939F17;
    dw InstList_SamusProjectile_Missiles_UpLeft                          ;939F19;


;;; $9F1B: Instruction list - super missile - up ;;;
InstList_SamusProjectile_SuperMissiles_Up:
    dw $000F,ProjectileFlareSpritemaps_SuperMissile_2                    ;939F1B;
    db $08,$08 : dw $0000                                                ;939F1F;
    dw Instruction_SamusProjectile_GotoY                                 ;939F23;
    dw InstList_SamusProjectile_SuperMissiles_Up                         ;939F25;


;;; $9F27: Instruction list - super missile - up-right ;;;
InstList_SamusProjectile_SuperMissiles_UpRight:
    dw $000F,ProjectileFlareSpritemaps_SuperMissile_3                    ;939F27;
    db $08,$08 : dw $0000                                                ;939F2B;
    dw Instruction_SamusProjectile_GotoY                                 ;939F2F;
    dw InstList_SamusProjectile_SuperMissiles_UpRight                    ;939F31;


;;; $9F33: Instruction list - super missile - right ;;;
InstList_SamusProjectile_SuperMissiles_Right:
    dw $000F,ProjectileFlareSpritemaps_SuperMissile_4                    ;939F33;
    db $08,$08 : dw $0000                                                ;939F37;
    dw Instruction_SamusProjectile_GotoY                                 ;939F3B;
    dw InstList_SamusProjectile_SuperMissiles_Right                      ;939F3D;


;;; $9F3F: Instruction list - super missile - down-right ;;;
InstList_SamusProjectile_SuperMissiles_DownRight:
    dw $000F,ProjectileFlareSpritemaps_SuperMissile_5                    ;939F3F;
    db $08,$08 : dw $0000                                                ;939F43;
    dw Instruction_SamusProjectile_GotoY                                 ;939F47;
    dw InstList_SamusProjectile_SuperMissiles_DownRight                  ;939F49;


;;; $9F4B: Instruction list - super missile - down ;;;
InstList_SamusProjectile_SuperMissiles_Down:
    dw $000F,ProjectileFlareSpritemaps_SuperMissile_6                    ;939F4B;
    db $08,$08 : dw $0000                                                ;939F4F;
    dw Instruction_SamusProjectile_GotoY                                 ;939F53;
    dw InstList_SamusProjectile_SuperMissiles_Down                       ;939F55;


;;; $9F57: Instruction list - super missile - down-left ;;;
InstList_SamusProjectile_SuperMissiles_DownLeft:
    dw $000F,ProjectileFlareSpritemaps_SuperMissile_7                    ;939F57;
    db $08,$08 : dw $0000                                                ;939F5B;
    dw Instruction_SamusProjectile_GotoY                                 ;939F5F;
    dw InstList_SamusProjectile_SuperMissiles_DownLeft                   ;939F61;


;;; $9F63: Instruction list - super missile - left ;;;
InstList_SamusProjectile_SuperMissiles_Left:
    dw $000F,ProjectileFlareSpritemaps_SuperMissile_0                    ;939F63;
    db $08,$08 : dw $0000                                                ;939F67;
    dw Instruction_SamusProjectile_GotoY                                 ;939F6B;
    dw InstList_SamusProjectile_SuperMissiles_Left                       ;939F6D;


;;; $9F6F: Instruction list - super missile - up-left ;;;
InstList_SamusProjectile_SuperMissiles_UpLeft:
    dw $000F,ProjectileFlareSpritemaps_SuperMissile_1                    ;939F6F;
    db $08,$08 : dw $0000                                                ;939F73;
    dw Instruction_SamusProjectile_GotoY                                 ;939F77;
    dw InstList_SamusProjectile_SuperMissiles_UpLeft                     ;939F79;


;;; $9F7B: Instruction list - super missile link ;;;
InstList_SamusProjectile_SuperMissileLink:
    dw $000F,Spritemap_Nothing_93A117                                    ;939F7B;
    db $08,$08 : dw $0000                                                ;939F7F;
    dw Instruction_SamusProjectile_GotoY                                 ;939F83;
    dw InstList_SamusProjectile_SuperMissileLink                         ;939F85;


;;; $9F87: Instruction list - power bomb ;;;
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
; Fast animation. Plays when bomb timer reaches Fh (see $90:C157)
    dw $0001                                                             ;939FA3;
    dw ProjectileFlareSpritemaps_PowerBomb_0                             ;939FA5;
    db $04,$04 : dw $0000                                                ;939FA7;
    dw $0001,ProjectileFlareSpritemaps_PowerBomb_1                       ;939FA9;
    db $04,$04 : dw $0000                                                ;939FAF;
    dw $0001,ProjectileFlareSpritemaps_PowerBomb_2                       ;939FB1;
    db $04,$04 : dw $0000                                                ;939FB7;
    dw Instruction_SamusProjectile_GotoY                                 ;939FBB;
    dw InstList_SamusProjectile_PowerBomb_FastAnimation                  ;939FBD;


;;; $9FBF: Instruction list - bomb ;;;
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

; Fast animation. Plays when bomb timer reaches Fh (see $90:C128)
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


;;; $A007: Instruction list - beam explosion ;;;
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


;;; $A039: Instruction list - missile explosion ;;;
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


;;; $A06B: Instruction list - bomb explosion ;;;
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


;;; $A095: Instruction list - plasma SBA ;;;
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


;;; $A0C1: Instruction list - super missile explosion ;;;
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


;;; $A0F3: Instruction list - unused projectile 25h ;;;
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


;;; $A117: Spritemap - nothing ;;;
Spritemap_Nothing_93A117:
    dw $0000                                                             ;93A117;


;;; $A119: Instruction list - shinespark echoes ;;;
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


;;; $A13D: Instruction list - spazer SBA trail ;;;
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


;;; $A159: Instruction list - wave SBA ;;;
InstList_SamusProjectile_WaveSBA:
    dw $0008,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_0             ;93A159;
    db $04,$04 : dw $0000                                                ;93A15D;
    dw $0008,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1             ;93A15F;
    db $04,$04 : dw $0001                                                ;93A165;
    dw Instruction_SamusProjectile_GotoY                                 ;93A169;
    dw InstList_SamusProjectile_WaveSBA                                  ;93A16B;


;;; $A16D: Instruction list - unused shinespark beam (projectile 27h) ;;;
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


;;; $A1A1: Flare spritemap pointers ;;;
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


;;; $A225: Flare spritemap table index offsets ;;;
FlareSpritemapTable_IndexOffsets:
;        _______________ Flare (charge beam / hyper beam / grapple beam)
;       |      _________ Flare slow sparks (charge beam / hyper beam)
;       |     |      ___ Flare fast sparks (charge beam / hyper beam)
;       |     |     |
  .facingRight:
    dw $0000,$001E,$0024                                                 ;93A225;
  .facingLeft:
    dw $0000,$002A,$0030                                                 ;93A22B;


;;; $A231: Projectile / flare spritemaps ;;;
if !FEATURE_KEEP_UNREFERENCED
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
endif ; !FEATURE_KEEP_UNREFERENCED

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

if !FEATURE_KEEP_UNREFERENCED
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
endif ; !FEATURE_KEEP_UNREFERENCED

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

if !FEATURE_KEEP_UNREFERENCED
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
endif ; !FEATURE_KEEP_UNREFERENCED

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

if !FEATURE_KEEP_UNREFERENCED
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
endif ; !FEATURE_KEEP_UNREFERENCED

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

if !FEATURE_KEEP_UNREFERENCED
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
endif ; !FEATURE_KEEP_UNREFERENCED

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

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_93ABAC:
    dw $0001                                                             ;93ABAC;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $5F)
endif ; !FEATURE_KEEP_UNREFERENCED

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

if !FEATURE_KEEP_UNREFERENCED
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
endif ; !FEATURE_KEEP_UNREFERENCED

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

if !FEATURE_KEEP_UNREFERENCED
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
endif ; !FEATURE_KEEP_UNREFERENCED

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

if !FEATURE_KEEP_UNREFERENCED
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
endif ; !FEATURE_KEEP_UNREFERENCED

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

if !FEATURE_KEEP_UNREFERENCED
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
endif ; !FEATURE_KEEP_UNREFERENCED

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

if !FEATURE_KEEP_UNREFERENCED
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
endif ; !FEATURE_KEEP_UNREFERENCED

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

if !FEATURE_KEEP_UNREFERENCED
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
endif ; !FEATURE_KEEP_UNREFERENCED

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

if !FEATURE_KEEP_UNREFERENCED
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
endif ; !FEATURE_KEEP_UNREFERENCED

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

if !FEATURE_KEEP_UNREFERENCED
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
endif ; !FEATURE_KEEP_UNREFERENCED

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

if !FEATURE_KEEP_UNREFERENCED
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
endif ; !FEATURE_KEEP_UNREFERENCED

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

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EE6E:
    dw $0006                                                             ;93EE6E;
    %spritemapEntry(0, $0A, $04, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $02, $04, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FA, $FC, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1FA, $F4, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F2, $F4, 0, 0, 2, 6, $31)
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4C:
    dw $0001                                                             ;93EE8E;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4D:
    dw $0002                                                             ;93EE95;
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $33)

if !FEATURE_KEEP_UNREFERENCED
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
endif ; !FEATURE_KEEP_UNREFERENCED

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

if !FEATURE_KEEP_UNREFERENCED
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
endif ; !FEATURE_KEEP_UNREFERENCED

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

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EF66:
    dw $0006                                                             ;93EF66;
    %spritemapEntry(0, $1EE, $F4, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1F6, $F4, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1F6, $FC, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1FE, $FC, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1FE, $04, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $06, $04, 1, 1, 2, 6, $31)
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_55:
    dw $0001                                                             ;93EF86;
    %spritemapEntry(0, $1FC, $FC, 1, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_56:
    dw $0002                                                             ;93EF8D;
    %spritemapEntry(0, $1FC, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 1, 0, 2, 6, $33)

if !FEATURE_KEEP_UNREFERENCED
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
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_57:
    dw $0001                                                             ;93F002;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_58:
    dw $0002                                                             ;93F009;
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $34)

if !FEATURE_KEEP_UNREFERENCED
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
endif ; !FEATURE_KEEP_UNREFERENCED

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

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93F05E:
    dw $0006                                                             ;93F05E;
    %spritemapEntry(0, $04, $08, 1, 1, 2, 6, $36)
    %spritemapEntry(0, $1F4, $F0, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $04, $00, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1FC, $F8, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1F4, $F8, 0, 0, 2, 6, $35)
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5B:
    dw $0001                                                             ;93F07E;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $37)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5C:
    dw $0002                                                             ;93F085;
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $37)

if !FEATURE_KEEP_UNREFERENCED
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
endif ; !FEATURE_KEEP_UNREFERENCED

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

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93F0DA:
    dw $0006                                                             ;93F0DA;
    %spritemapEntry(0, $1F4, $08, 1, 0, 2, 6, $36)
    %spritemapEntry(0, $04, $F0, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $1F4, $00, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1FC, $00, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $1FC, $F8, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $04, $F8, 0, 1, 2, 6, $35)
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_0:
    dw $0001                                                             ;93F0FA;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $30)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F101:
    dw $0002                                                             ;93F101;
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $30)
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1:
    dw $0003                                                             ;93F10D;
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 6, $30)

if !FEATURE_KEEP_UNREFERENCED
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
endif ; !FEATURE_KEEP_UNREFERENCED

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

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F19B:
    dw $0002                                                             ;93F19B;
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $33)
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_5:
    dw $0003                                                             ;93F1A7;
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 6, $33)

if !FEATURE_KEEP_UNREFERENCED
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
endif ; !FEATURE_KEEP_UNREFERENCED

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

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F250:
    dw $0006                                                             ;93F250;
    %spritemapEntry(0, $08, $04, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $00, $04, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F0, $F4, 0, 0, 2, 6, $31)
endif ; !FEATURE_KEEP_UNREFERENCED

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

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F2F0:
    dw $0006                                                             ;93F2F0;
    %spritemapEntry(0, $1F0, $04, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F8, $04, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $00, $F4, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $08, $F4, 0, 1, 2, 6, $31)
endif ; !FEATURE_KEEP_UNREFERENCED

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

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F375:
    dw $0002                                                             ;93F375;
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $34)
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_11:
    dw $0003                                                             ;93F381;
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 6, $34)

if !FEATURE_KEEP_UNREFERENCED
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
endif ; !FEATURE_KEEP_UNREFERENCED

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

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F40F:
    dw $0002                                                             ;93F40F;
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $37)
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_15:
    dw $0003                                                             ;93F41B;
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 6, $37)

if !FEATURE_KEEP_UNREFERENCED
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
endif ; !FEATURE_KEEP_UNREFERENCED

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

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F4C4:
    dw $0006                                                             ;93F4C4;
    %spritemapEntry(0, $1FC, $F8, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $04, $00, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $04, $08, 1, 1, 2, 6, $36)
    %spritemapEntry(0, $1F4, $F0, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1F4, $F8, 0, 0, 2, 6, $35)
endif ; !FEATURE_KEEP_UNREFERENCED

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

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F564:
    dw $0006                                                             ;93F564;
    %spritemapEntry(0, $1FC, $F8, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1F4, $00, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1F4, $08, 1, 0, 2, 6, $36)
    %spritemapEntry(0, $04, $F0, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $1FC, $00, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $04, $F8, 0, 1, 2, 6, $35)
endif ; !FEATURE_KEEP_UNREFERENCED

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


;;; $F5E2: Unused. Draw shinespark windup effect sprite ;;;
if !FEATURE_KEEP_UNREFERENCED
UNUSED_DrawShinesparkWindupEffectSprite_93F5E2:
    PHP                                                                  ;93F5E2;
    PHB                                                                  ;93F5E3;
    PHK                                                                  ;93F5E4;
    PLB                                                                  ;93F5E5;
    REP #$30                                                             ;93F5E6;
    LDA.W Pose                                                           ;93F5E8;
    CMP.W #$00C7                                                         ;93F5EB;
    BEQ .verticalShinesparkWindup                                        ;93F5EE;
    CMP.W #$00C8                                                         ;93F5F0;
    BNE .return                                                          ;93F5F3;

  .verticalShinesparkWindup:
    LDA.W NMI_FrameCounter                                               ;93F5F5;
    BIT.W #$0001                                                         ;93F5F8;
    BNE .return                                                          ;93F5FB;
    LDA.W SamusXPosition                                                 ;93F5FD;
    SEC                                                                  ;93F600;
    SBC.W Layer1XPosition                                                ;93F601;
    STA.B DP_Temp14                                                      ;93F604;
    LDA.W SamusYPosition                                                 ;93F606;
    SEC                                                                  ;93F609;
    SBC.W Layer1YPosition                                                ;93F60A;
    STA.B DP_Temp12                                                      ;93F60D;
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
