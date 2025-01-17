
org $938000


InitializeProjectile:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W $0C04,X 
    AND.W #$000F 
    ASL A 
    STA.B $12 
    LDA.W $0C18,X 
    BIT.W #$0F00 
    BNE .notBeam 
    BIT.W #$0010 
    BNE .charged 
    AND.W #$000F 
    ASL A 
    TAY 
    LDA.W SamusProjectileDataPointers_UnchargedBeams,Y 
    TAY 
    BRA .merge 


.charged:
    AND.W #$000F 
    ASL A 
    TAY 
    LDA.W SamusProjectileDataPointers_ChargedBeams,Y 
    TAY 
    BRA .merge 


.notBeam:
    XBA 
    AND.W #$000F 
    ASL A 
    TAY 
    LDA.W SamusProjectileDataPointers_NonBeam,Y 
    TAY 

.merge:
    LDA.W $0000,Y : STA.W $0C2C,X 
    BPL .dontCrash 
    JML.L Crash_Handler 


.dontCrash:
    INY #2
    TYA 
    CLC : ADC.B $12 : TAY 
    LDA.W $0000,Y : STA.W $0C40,X 
    TAY 
    LDA.W $0004,Y : AND.W #$00FF : STA.W $0BB4,X 
    LDA.W $0005,Y : AND.W #$00FF : STA.W $0BC8,X 
    LDA.W #$0001 : STA.W $0C54,X 
    PLB 
    PLP 
    RTL 


InitializeSuperMissileLink:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W $0C19,X 
    AND.W #$000F 
    ASL A 
    TAY 
    LDA.W SamusProjectileDataPointers_SuperMissileLink,Y 
    TAY 
    LDA.W $0000,Y : STA.W $0C2C,X 
    BPL .dontCrash 
    JML.L Crash_Handler 


.dontCrash:
    INY #2
    LDA.W $0000,Y : STA.W $0C40,X 
    LDA.W #$0001 : STA.W $0C54,X 
    PLB 
    PLP 
    RTL 


InitializeBomb:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W $0C19,X 
    AND.W #$000F 
    ASL A 
    TAY 
    LDA.W SamusProjectileDataPointers_NonBeam,Y 
    TAY 
    LDA.W $0000,Y : STA.W $0C2C,X 
    BPL .dontCrash 
    JML.L Crash_Handler 


.dontCrash:
    INY #2
    LDA.W $0000,Y : STA.W $0C40,X 
    LDA.W #$0001 : STA.W $0C54,X 
    PLB 
    PLP 
    RTL 


PartOfKillProjectile_QueueSFX_SetInstruction:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W $0C18,X 
    BIT.W #$0F00 
    BNE .notBeam 
    LDA.W $0C18,X 
    AND.W #$F0FF 
    ORA.W #$0700 
    STA.W $0C18,X 
    LDA.W ProjectileDataTable_NonBeam_BeamExplosion_pointer : STA.W $0C40,X 
    LDA.W #$000C 
    JSL.L QueueSound_Lib2_Max6 
    BRA .return 


.notBeam:
    LDA.W $1F51 
    BNE .setExplosion 
    LDA.W #$0007 
    JSL.L QueueSound_Lib2_Max6 

.setExplosion:
    LDA.W $0C18,X 
    PHA 
    AND.W #$F0FF 
    ORA.W #$0800 
    STA.W $0C18,X 
    PLA 
    BIT.W #$0200 
    BNE .superMissile 
    LDA.W ProjectileDataTable_NonBeam_MissileExplosion_pointer : STA.W $0C40,X 
    BRA .setCooldown 


.superMissile:
    LDA.W ProjectileDataTable_NonBeam_SuperMissileExplosion_pointer : STA.W $0C40,X 
    LDA.W #$0014 : STA.W $183E 
    LDA.W #$001E : STA.W $1840 

.setCooldown:
    LDA.W $0CCC 
    CMP.W #$0015 
    BMI .return 
    LDA.W #$0014 : STA.W $0CCC 

.return:
    LDA.W #$0001 : STA.W $0C54,X 
    LDA.W #$0008 : STA.W $0C2C,X 
    PLB 
    PLP 
    RTL 


Initialize_Bomb_Explosion:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W ProjectileDataTable_NonBeam_BombExplosion_pointer : STA.W $0C40,X 
    LDA.W #$0001 : STA.W $0C54,X 
    PLB 
    PLP 
    RTL 


Initialize_ShinesparkEcho_or_SpazerSBATrailProjectile:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W $0C04,X 
    AND.W #$000F 
    ASL A 
    STA.B $12 
    LDA.W $0C18,X 
    AND.W #$00FF 
    SEC : SBC.W #$0022 : ASL A 
    TAY 
    LDA.W SamusProjectileDataPointers_ShinesparkEcho_SpazerSBATrail,Y 
    TAY 
    LDA.W $0000,Y : STA.W $0C2C,X 
    BPL .dontCrash 
    JML.L Crash_Handler 


.dontCrash:
    INY #2
    TYA 
    CLC : ADC.B $12 : TAY 
    LDA.W $0000,Y : STA.W $0C40,X 
    LDA.W #$0001 : STA.W $0C54,X 
    PLB 
    PLP 
    RTL 


InitializeSBAProjectile:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W $0C18,X 
    AND.W #$000F 
    ASL A 
    TAY 
    LDA.W SamusProjectileDataPointers_SBA,Y 
    TAY 
    LDA.W $0000,Y : STA.W $0C2C,X 
    BPL .dontCrash 
    JML.L Crash_Handler 


.dontCrash:
    LDA.W $0002,Y : STA.W $0C40,X 
    LDA.W #$0001 : STA.W $0C54,X 
    PLB 
    PLP 
    RTL 


Get_ProjectileTrailFrame:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    PHY 
    LDA.W $0C40,X : SEC : SBC.W #$0008 : TAY 
    LDA.W $0006,Y : STA.B $16 
    PLY 
    PLB 
    PLP 
    RTL 


ProjectileInstructionHandler:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDX.W $0DDE 
    DEC.W $0C54,X 
    BNE .return 
    LDY.W $0C40,X 

.loop:
    LDA.W $0000,Y 
    BPL .timer 
    STA.B $12 
    INY #2
    PEA.W .loop-1 
    JMP.W ($0012) 


.timer:
    STA.W $0C54,X 
    LDA.W $0002,Y : STA.W $0CB8,X 
    LDA.W $0004,Y : AND.W #$00FF : STA.W $0BB4,X 
    LDA.W $0005,Y : AND.W #$00FF : STA.W $0BC8,X 
    TYA 
    CLC : ADC.W #$0008 : STA.W $0C40,X 

.return:
    PLB 
    PLP 
    RTL 


Instruction_SamusProjectile_Delete:
    REP #$30 
    JSL.L Clear_Projectile 
    PLA 
    PLB 
    PLP 
    RTL 


Instruction_SamusProjectile_GotoY:
    REP #$30 
    LDA.W $0000,Y 
    TAY 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_SamusProj_GotoY_BasedOnBombTimer_938240:
    REP #$30 
    LDA.W $0000,Y 
    CMP.W $0C7C,X 
    BPL .lessThanY 
    LDA.W $0004,Y 
    TAY 
    RTS 


.lessThanY:
    LDA.W $0002,Y 
    TAY 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


DrawProjectiles:
    PHP 
    REP #$30 
    LDX.W #$0008 
    STX.W $0DDE 

.loop:
    LDA.W $0C40,X 
    BNE + 
    JMP.W .next 


  + LDA.W $0C18,X 
    BIT.W #$0F10 
    BNE .noFlickering 
    BIT.W #$000C 
    BNE .spazerPlasma 
    TXA 
    BIT.W #$0002 
    BNE + 
    LDA.W $05B6 
    BIT.W #$0001 
    BNE .draw 
    BRA .next 


  + LDA.W $05B6 
    BIT.W #$0001 
    BNE .next 
    BRA .draw 


.spazerPlasma:
    TXA 
    BIT.W #$0002 
    BNE + 
    LDA.W $05B6 
    BIT.W #$0002 
    BNE .next 
    BRA .draw 


  + LDA.W $05B6 
    BIT.W #$0002 
    BEQ .next 
    BRA .draw 


.noFlickering:
    AND.W #$0F00 
    CMP.W #$0300 
    BPL .next 

.draw:
    LDA.W $093F 
    BPL .noRotation 
    JSL.L Calculate_ProjectilePosition_InRotatingElevatorRoom 
    LDA.B $12 
    BRA .positionCalculated 


.noRotation:
    LDA.W $0B64,X : SEC : SBC.W $0911 : STA.B $14 
    LDA.W $0B78,X : SEC : SBC.W $0915 : STA.B $12 

.positionCalculated:
    AND.W #$FF00 
    BNE + 
    LDA.W $0CB8,X 
    BPL .loadIndex 
    JSL.L AddProjectileSpritemapToOAM 
    BRA .loadIndex 


  + LDA.W $0CB8,X 
    BPL .loadIndex 
    JSL.L RTL_818AB7 

.loadIndex:
    LDX.W $0DDE 

.next:
    DEX #2
    STX.W $0DDE 
    BMI .echoes 
    JMP.W .loop 


.echoes:
    JSL.L DrawShinesparkCrashEchoProjectiles 
    JSL.L HandleProjectileTrails 
    PLP 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_PartialDrawProjectiles_9282FD:
    PHP 
    REP #$30 
    LDX.W #$0008 
    STX.W $0DDE 

.loop:
    LDA.W $0C40,X 
    BEQ .next 
    LDA.W $0B64,X : SEC : SBC.W $0911 : STA.B $14 
    LDA.W $0B78,X : SEC : SBC.W #$0008 : SEC : SBC.W $0915 : STA.B $12 
    AND.W #$FF00 
    BNE + 
    LDA.W $0CB8,X 
    BPL .getIndex 
    JSL.L AddProjectileSpritemapToOAM 
    BRA .getIndex 


  + LDA.W $0CB8,X 
    BPL .getIndex 
    JSL.L RTL_818AB7 

.getIndex:
    LDX.W $0DDE 

.next:
    DEX #2
    STX.W $0DDE 
    BMI .timerExpired 
    JMP.W .loop 


.timerExpired:
    JSL.L HandleProjectileTrails 
    PLP 
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


DrawBombsAndProjectileExplosions:
    PHP 
    REP #$30 
    LDX.W #$0012 
    STX.W $0DDE 

.loop:
    LDA.W $0C40,X 
    BEQ .next 
    LDA.W $0C18,X 
    AND.W #$0F00 
    CMP.W #$0300 
    BMI .next 
    BEQ .powerBomb 
    CMP.W #$0500 
    BEQ .normalPositionCalculation 
    LDA.W $093F 
    BPL .normalPositionCalculation 
    JSL.L Calculate_ProjectilePosition_InRotatingElevatorRoom 
    LDA.B $12 
    BRA .calculatedPosition 


.powerBomb:
    LDA.W $0C7C,X 
    BEQ .next 

.normalPositionCalculation:
    LDA.W $0B64,X : SEC : SBC.W $0911 : STA.B $14 
    CMP.W #$0130 
    BPL .next 
    CMP.W #$FFD0 
    BMI .next 
    LDA.W $0B78,X : SEC : SBC.W $0915 : STA.B $12 

.calculatedPosition:
    AND.W #$FF00 
    BNE .offScreen 
    LDA.W $0CB8,X 
    JSL.L AddProjectileSpritemapToOAM 
    LDX.W $0DDE 
    BRA .next 


.offScreen:
    LDA.W $0CB8,X 
    JSL.L RTL_818AB7 
    LDX.W $0DDE 

.next:
    DEX #2
    STX.W $0DDE 
    BPL .loop 
    PLP 
    RTL 


HyperBeamDamageValue:
    dw $03E8 

SamusProjectileDataPointers_UnchargedBeams:
    dw ProjectileDataTable_Uncharged_Power 
    dw ProjectileDataTable_Uncharged_Wave 
    dw ProjectileDataTable_Uncharged_Ice 
    dw ProjectileDataTable_Uncharged_IceWave 
    dw ProjectileDataTable_Uncharged_Spazer 
    dw ProjectileDataTable_Uncharged_SpazerWave 
    dw ProjectileDataTable_Uncharged_SpazerIce 
    dw ProjectileDataTable_Uncharged_SpazerIceWave 
    dw ProjectileDataTable_Uncharged_Plasma 
    dw ProjectileDataTable_Uncharged_PlasmaWave 
    dw ProjectileDataTable_Uncharged_PlasmaIce 
    dw ProjectileDataTable_Uncharged_PlasmaIceWave 

SamusProjectileDataPointers_ChargedBeams:
    dw ProjectileDataTable_Charged_Power 
    dw ProjectileDataTable_Charged_Wave 
    dw ProjectileDataTable_Charged_Ice 
    dw ProjectileDataTable_Charged_IceWave 
    dw ProjectileDataTable_Charged_Spazer 
    dw ProjectileDataTable_Charged_SpazerWave 
    dw ProjectileDataTable_Charged_SpazerIce 
    dw ProjectileDataTable_Charged_SpazerIceWave 
    dw ProjectileDataTable_Charged_Plasma 
    dw ProjectileDataTable_Charged_PlasmaWave 
    dw ProjectileDataTable_Charged_PlasmaIce 
    dw ProjectileDataTable_Charged_PlasmaIceWave 

SamusProjectileDataPointers_NonBeam:
    dw ProjectileDataTable_NonBeam_Missile 
    dw ProjectileDataTable_NonBeam_Missile 
    dw ProjectileDataTable_NonBeam_SuperMissile 
    dw ProjectileDataTable_NonBeam_PowerBomb 
    dw ProjectileDataTable_NonBeam_Missile 
    dw ProjectileDataTable_NonBeam_Bomb 
    dw ProjectileDataTable_NonBeam_Missile 
    dw ProjectileDataTable_NonBeam_BeamExplosion 
    dw ProjectileDataTable_NonBeam_MissileExplosion 

SamusProjectileDataPointers_ShinesparkEcho_SpazerSBATrail:
    dw $0000 
    dw $0000 
    dw ProjectileDataTable_NonBeam_SpazerSBATrail 
    dw UNUSED_ProjectileDataTable_NonBeam_Projectile25_938695 
    dw ProjectileDataTable_NonBeam_SpazerSBATrail 
    dw UNUSED_ProjectileDataTable_NonBeam_Projectile27_9386D7 
    dw $0000 
    dw ProjectileDataTable_NonBeam_ShinesparkEcho 

SamusProjectileDataPointers_SBA:
    dw $0000 
    dw ProjectileDataTable_NonBeam_WaveSBA 
    dw $0000 
    dw $0000 
    dw ProjectileDataTable_NonBeam_SpazerSBA 
    dw ProjectileDataTable_NonBeam_SpazerSBA 
    dw $0000 
    dw $0000 
    dw ProjectileDataTable_NonBeam_PlasmaSBA 
    dw ProjectileDataTable_NonBeam_PlasmaSBA 
    dw $0000 
    dw $0000 

SamusProjectileDataPointers_SuperMissileLink:
    dw $0000 
    dw $0000 
    dw ProjectileDataTable_NonBeam_SuperMissileLink 

ProjectileDataTable_Uncharged_Power:
    dw $0014 
    dw InstList_SamusProjectile_Power_Up 
    dw InstList_SamusProjectile_Power_UpRight 
    dw InstList_SamusProjectile_Power_Right 
    dw InstList_SamusProjectile_Power_DownRight 
    dw InstList_SamusProjectile_Power_Down 
    dw InstList_SamusProjectile_Power_Down 
    dw InstList_SamusProjectile_Power_DownLeft 
    dw InstList_SamusProjectile_Power_Left 
    dw InstList_SamusProjectile_Power_UpLeft 
    dw InstList_SamusProjectile_Power_Up 

ProjectileDataTable_Uncharged_Spazer:
    dw $0028 
    dw InstList_SamusProjectile_Spazer_SpazerIce_Up_0 
    dw InstList_SamusProjectile_Spazer_SpazerIce_UpRight_0 
    dw InstList_SamusProjectile_Spazer_SpazerIce_Right_0 
    dw InstList_SamusProjectile_Spazer_SpazerIce_DownRight_0 
    dw InstList_SamusProjectile_Spazer_SpazerIce_Down_0 
    dw InstList_SamusProjectile_Spazer_SpazerIce_Down_0 
    dw InstList_SamusProjectile_Spazer_SpazerIce_DownLeft_0 
    dw InstList_SamusProjectile_Spazer_SpazerIce_Left_0 
    dw InstList_SamusProjectile_Spazer_SpazerIce_UpLeft_0 
    dw InstList_SamusProjectile_Spazer_SpazerIce_Up_0 

ProjectileDataTable_Uncharged_SpazerIce:
    dw $003C 
    dw InstList_SamusProjectile_Spazer_SpazerIce_Up_0 
    dw InstList_SamusProjectile_Spazer_SpazerIce_UpRight_0 
    dw InstList_SamusProjectile_Spazer_SpazerIce_Right_0 
    dw InstList_SamusProjectile_Spazer_SpazerIce_DownRight_0 
    dw InstList_SamusProjectile_Spazer_SpazerIce_Down_0 
    dw InstList_SamusProjectile_Spazer_SpazerIce_Down_0 
    dw InstList_SamusProjectile_Spazer_SpazerIce_DownLeft_0 
    dw InstList_SamusProjectile_Spazer_SpazerIce_Left_0 
    dw InstList_SamusProjectile_Spazer_SpazerIce_UpLeft_0 
    dw InstList_SamusProjectile_Spazer_SpazerIce_Up_0 

ProjectileDataTable_Uncharged_SpazerIceWave:
    dw $0064 
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Up 
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_UpRight 
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Right 
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_DownRight 
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Down 
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Down 
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_DownLeft 
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Left 
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_UpLeft 
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Up 

ProjectileDataTable_Uncharged_PlasmaIceWave:
    dw $012C 
    dw InstList_SamusProjectile_PlasmaIceWave_Down_Up 
    dw InstList_SamusProjectile_PlasmaIceWave_DownLeft_UpRight 
    dw InstList_SamusProj_PlasmaWave_PlasmaIceWave_Left_Right_0 
    dw InstList_SamusProjectile_PlasmaIceWave_DownRight_UpLeft 
    dw InstList_SamusProjectile_PlasmaIceWave_Down_Up 
    dw InstList_SamusProjectile_PlasmaIceWave_Down_Up 
    dw InstList_SamusProjectile_PlasmaIceWave_DownLeft_UpRight 
    dw InstList_SamusProj_PlasmaWave_PlasmaIceWave_Left_Right_0 
    dw InstList_SamusProjectile_PlasmaIceWave_DownRight_UpLeft 
    dw InstList_SamusProjectile_PlasmaIceWave_Down_Up 

ProjectileDataTable_Uncharged_Ice:
    dw $001E 
    dw InstList_SamusProjectile_Ice 
    dw InstList_SamusProjectile_Ice 
    dw InstList_SamusProjectile_Ice 
    dw InstList_SamusProjectile_Ice 
    dw InstList_SamusProjectile_Ice 
    dw InstList_SamusProjectile_Ice 
    dw InstList_SamusProjectile_Ice 
    dw InstList_SamusProjectile_Ice 
    dw InstList_SamusProjectile_Ice 
    dw InstList_SamusProjectile_Ice 

ProjectileDataTable_Uncharged_Wave:
    dw $0032 
    dw InstList_SamusProjectile_Wave_IceWave_Up 
    dw InstList_SamusProjectile_Wave_IceWave_DownLeft_UpRight 
    dw InstList_SamusProjectile_Wave_IceWave_Left_Right 
    dw InstList_SamusProjectile_Wave_IceWave_DownRight_UpLeft 
    dw InstList_SamusProjectile_Wave_IceWave_Down 
    dw InstList_SamusProjectile_Wave_IceWave_Down 
    dw InstList_SamusProjectile_Wave_IceWave_DownLeft_UpRight 
    dw InstList_SamusProjectile_Wave_IceWave_Left_Right 
    dw InstList_SamusProjectile_Wave_IceWave_DownRight_UpLeft 
    dw InstList_SamusProjectile_Wave_IceWave_Up 

ProjectileDataTable_Uncharged_Plasma:
    dw $0096 
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Down_Up_0 
    dw InstList_SamusProjectile_Plasma_PlasmaIce_DownLeft_UpRight_0 
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Left_Right_0 
    dw InstList_SamusProjectile_Plasma_PlasmaIce_DownRight_UpLeft_0 
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Down_Up_0 
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Down_Up_0 
    dw InstList_SamusProjectile_Plasma_PlasmaIce_DownLeft_UpRight_0 
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Left_Right_0 
    dw InstList_SamusProjectile_Plasma_PlasmaIce_DownRight_UpLeft_0 
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Down_Up_0 

ProjectileDataTable_Uncharged_IceWave:
    dw $003C 
    dw InstList_SamusProjectile_Wave_IceWave_Up 
    dw InstList_SamusProjectile_Wave_IceWave_DownLeft_UpRight 
    dw InstList_SamusProjectile_Wave_IceWave_Left_Right 
    dw InstList_SamusProjectile_Wave_IceWave_DownRight_UpLeft 
    dw InstList_SamusProjectile_Wave_IceWave_Down 
    dw InstList_SamusProjectile_Wave_IceWave_Down 
    dw InstList_SamusProjectile_Wave_IceWave_DownLeft_UpRight 
    dw InstList_SamusProjectile_Wave_IceWave_Left_Right 
    dw InstList_SamusProjectile_Wave_IceWave_DownRight_UpLeft 
    dw InstList_SamusProjectile_Wave_IceWave_Up 

ProjectileDataTable_Uncharged_SpazerWave:
    dw $0046 
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Up 
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_UpRight 
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Right 
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_DownRight 
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Down 
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Down 
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_DownLeft 
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Left 
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_UpLeft 
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Up 

ProjectileDataTable_Uncharged_PlasmaWave:
    dw $00FA 
    dw InstList_SamusProjectile_PlasmaWave_Down_Up 
    dw InstList_SamusProjectile_PlasmaWave_DownLeft_UpRight 
    dw InstList_SamusProj_PlasmaWave_PlasmaIceWave_Left_Right_0 
    dw InstList_SamusProjectile_PlasmaWave_DownRight_UpLeft 
    dw InstList_SamusProjectile_PlasmaWave_Down_Up 
    dw InstList_SamusProjectile_PlasmaWave_Down_Up 
    dw InstList_SamusProjectile_PlasmaWave_DownLeft_UpRight 
    dw InstList_SamusProj_PlasmaWave_PlasmaIceWave_Left_Right_0 
    dw InstList_SamusProjectile_PlasmaWave_DownRight_UpLeft 
    dw InstList_SamusProjectile_PlasmaWave_Down_Up 

ProjectileDataTable_Uncharged_PlasmaIce:
    dw $00C8 
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Down_Up_0 
    dw InstList_SamusProjectile_Plasma_PlasmaIce_DownLeft_UpRight_0 
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Left_Right_0 
    dw InstList_SamusProjectile_Plasma_PlasmaIce_DownRight_UpLeft_0 
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Down_Up_0 
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Down_Up_0 
    dw InstList_SamusProjectile_Plasma_PlasmaIce_DownLeft_UpRight_0 
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Left_Right_0 
    dw InstList_SamusProjectile_Plasma_PlasmaIce_DownRight_UpLeft_0 
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Down_Up_0 

ProjectileDataTable_Charged_Power:
    dw $003C 
    dw InstList_SamusProjectile_Charged_Power_Up 
    dw InstList_SamusProjectile_Charged_Power_UpRight 
    dw InstList_SamusProjectile_Charged_Power_Right 
    dw InstList_SamusProjectile_Charged_Power_DownRight 
    dw InstList_SamusProjectile_Charged_Power_Down 
    dw InstList_SamusProjectile_Charged_Power_Down 
    dw InstList_SamusProjectile_Charged_Power_DownLeft 
    dw InstList_SamusProjectile_Charged_Power_Left 
    dw InstList_SamusProjectile_Charged_Power_UpLeft 
    dw InstList_SamusProjectile_Charged_Power_Up 

ProjectileDataTable_Charged_Spazer:
    dw $0078 
    dw InstList_SamusProjectile_Charged_S_SI_Down_Up_0 
    dw InstList_SamusProjectile_Charged_S_SI_DownLeft_UpRight_0 
    dw InstList_SamusProjectile_Charged_S_SI_Left_Right_0 
    dw InstList_SamusProjectile_Charged_S_SI_DownRight_UpLeft_0 
    dw InstList_SamusProjectile_Charged_S_SI_Down_Up_0 
    dw InstList_SamusProjectile_Charged_S_SI_Down_Up_0 
    dw InstList_SamusProjectile_Charged_S_SI_DownLeft_UpRight_0 
    dw InstList_SamusProjectile_Charged_S_SI_Left_Right_0 
    dw InstList_SamusProjectile_Charged_S_SI_DownRight_UpLeft_0 
    dw InstList_SamusProjectile_Charged_S_SI_Down_Up_0 

ProjectileDataTable_Charged_SpazerIce:
    dw $00B4 
    dw InstList_SamusProjectile_Charged_S_SI_Down_Up_0 
    dw InstList_SamusProjectile_Charged_S_SI_DownLeft_UpRight_0 
    dw InstList_SamusProjectile_Charged_S_SI_Left_Right_0 
    dw InstList_SamusProjectile_Charged_S_SI_DownRight_UpLeft_0 
    dw InstList_SamusProjectile_Charged_S_SI_Down_Up_0 
    dw InstList_SamusProjectile_Charged_S_SI_Down_Up_0 
    dw InstList_SamusProjectile_Charged_S_SI_DownLeft_UpRight_0 
    dw InstList_SamusProjectile_Charged_S_SI_Left_Right_0 
    dw InstList_SamusProjectile_Charged_S_SI_DownRight_UpLeft_0 
    dw InstList_SamusProjectile_Charged_S_SI_Down_Up_0 

ProjectileDataTable_Charged_SpazerIceWave:
    dw $012C 
    dw InstList_SamusProjectile_Charged_SW_SIW_Up_0 
    dw InstList_SamusProjectile_Charged_SW_SIW_UpRight_0 
    dw InstList_SamusProjectile_Charged_SW_SIW_Right_0 
    dw InstList_SamusProjectile_Charged_SW_SIW_DownRight_0 
    dw InstList_SamusProjectile_Charged_SW_SIW_Down_0 
    dw InstList_SamusProjectile_Charged_SW_SIW_Down_0 
    dw InstList_SamusProjectile_Charged_SW_SIW_DownLeft_0 
    dw InstList_SamusProjectile_Charged_SW_SIW_Left_0 
    dw InstList_SamusProjectile_Charged_SW_SIW_UpLeft_0 
    dw InstList_SamusProjectile_Charged_SW_SIW_Up_0 

ProjectileDataTable_Charged_PlasmaIceWave:
    dw $0384 
    dw InstList_SamusProjectile_Charged_PW_PIW_Down_Up_0 
    dw InstList_SamusProjectile_Charged_PW_PIW_DownLeft_UpRight_0 
    dw InstList_SamusProjectile_Charged_PW_PIW_Left_Right_0 
    dw InstList_SamusProjectile_Charged_PW_PIW_DownRight_UpLeft_0 
    dw InstList_SamusProjectile_Charged_PW_PIW_Down_Up_0 
    dw InstList_SamusProjectile_Charged_PW_PIW_Down_Up_0 
    dw InstList_SamusProjectile_Charged_PW_PIW_DownLeft_UpRight_0 
    dw InstList_SamusProjectile_Charged_PW_PIW_Left_Right_0 
    dw InstList_SamusProjectile_Charged_PW_PIW_DownRight_UpLeft_0 
    dw InstList_SamusProjectile_Charged_PW_PIW_Down_Up_0 

ProjectileDataTable_Charged_Ice:
    dw $005A 
    dw InstList_SamusProjectile_Charged_Ice 
    dw InstList_SamusProjectile_Charged_Ice 
    dw InstList_SamusProjectile_Charged_Ice 
    dw InstList_SamusProjectile_Charged_Ice 
    dw InstList_SamusProjectile_Charged_Ice 
    dw InstList_SamusProjectile_Charged_Ice 
    dw InstList_SamusProjectile_Charged_Ice 
    dw InstList_SamusProjectile_Charged_Ice 
    dw InstList_SamusProjectile_Charged_Ice 
    dw InstList_SamusProjectile_Charged_Ice 

ProjectileDataTable_Charged_Plasma:
    dw $01C2 
    dw InstList_SamusProjectile_Charged_P_PI_Down_Up_0 
    dw InstList_SamusProjectile_Charged_P_PI_DownLeft_UpRight_0 
    dw InstList_SamusProjectile_Charged_P_PI_Left_Right_0 
    dw InstList_SamusProjectile_Charged_P_PI_DownRight_UpLeft_0 
    dw InstList_SamusProjectile_Charged_P_PI_Down_Up_0 
    dw InstList_SamusProjectile_Charged_P_PI_Down_Up_0 
    dw InstList_SamusProjectile_Charged_P_PI_DownLeft_UpRight_0 
    dw InstList_SamusProjectile_Charged_P_PI_Left_Right_0 
    dw InstList_SamusProjectile_Charged_P_PI_DownRight_UpLeft_0 
    dw InstList_SamusProjectile_Charged_P_PI_Down_Up_0 

ProjectileDataTable_Charged_Wave:
    dw $0096 
    dw InstList_SamusProjectile_Charged_Wave_Up 
    dw InstList_SamusProjectile_Charged_Wave_DownLeft_UpRight 
    dw InstList_SamusProjectile_Charged_Wave_Left_Right 
    dw InstList_SamusProjectile_Charged_Wave_DownRight_UpLeft 
    dw InstList_SamusProjectile_Charged_Wave_Down 
    dw InstList_SamusProjectile_Charged_Wave_Down 
    dw InstList_SamusProjectile_Charged_Wave_DownLeft_UpRight 
    dw InstList_SamusProjectile_Charged_Wave_Left_Right 
    dw InstList_SamusProjectile_Charged_Wave_DownRight_UpLeft 
    dw InstList_SamusProjectile_Charged_Wave_Up 

ProjectileDataTable_Charged_IceWave:
    dw $00B4 
    dw InstList_SamusProjectile_Charged_IW_Up 
    dw InstList_SamusProjectile_Charged_IW_DownLeft_UpRight 
    dw InstList_SamusProjectile_Charged_IW_Left_Right 
    dw InstList_SamusProjectile_Charged_IW_DownRight_UpLeft 
    dw InstList_SamusProjectile_Charged_IW_Down 
    dw InstList_SamusProjectile_Charged_IW_Down 
    dw InstList_SamusProjectile_Charged_IW_DownLeft_UpRight 
    dw InstList_SamusProjectile_Charged_IW_Left_Right 
    dw InstList_SamusProjectile_Charged_IW_DownRight_UpLeft 
    dw InstList_SamusProjectile_Charged_IW_Up 

ProjectileDataTable_Charged_SpazerWave:
    dw $00D2 
    dw InstList_SamusProjectile_Charged_SW_SIW_Up_0 
    dw InstList_SamusProjectile_Charged_SW_SIW_UpRight_0 
    dw InstList_SamusProjectile_Charged_SW_SIW_Right_0 
    dw InstList_SamusProjectile_Charged_SW_SIW_DownRight_0 
    dw InstList_SamusProjectile_Charged_SW_SIW_Down_0 
    dw InstList_SamusProjectile_Charged_SW_SIW_Down_0 
    dw InstList_SamusProjectile_Charged_SW_SIW_DownLeft_0 
    dw InstList_SamusProjectile_Charged_SW_SIW_Left_0 
    dw InstList_SamusProjectile_Charged_SW_SIW_UpLeft_0 
    dw InstList_SamusProjectile_Charged_SW_SIW_Up_0 

ProjectileDataTable_Charged_PlasmaIce:
    dw $0258 
    dw InstList_SamusProjectile_Charged_P_PI_Down_Up_0 
    dw InstList_SamusProjectile_Charged_P_PI_DownLeft_UpRight_0 
    dw InstList_SamusProjectile_Charged_P_PI_Left_Right_0 
    dw InstList_SamusProjectile_Charged_P_PI_DownRight_UpLeft_0 
    dw InstList_SamusProjectile_Charged_P_PI_Down_Up_0 
    dw InstList_SamusProjectile_Charged_P_PI_Down_Up_0 
    dw InstList_SamusProjectile_Charged_P_PI_DownLeft_UpRight_0 
    dw InstList_SamusProjectile_Charged_P_PI_Left_Right_0 
    dw InstList_SamusProjectile_Charged_P_PI_DownRight_UpLeft_0 
    dw InstList_SamusProjectile_Charged_P_PI_Down_Up_0 

ProjectileDataTable_Charged_PlasmaWave:
    dw $02EE 
    dw InstList_SamusProjectile_Charged_PW_PIW_Down_Up_0 
    dw InstList_SamusProjectile_Charged_PW_PIW_DownLeft_UpRight_0 
    dw InstList_SamusProjectile_Charged_PW_PIW_Left_Right_0 
    dw InstList_SamusProjectile_Charged_PW_PIW_DownRight_UpLeft_0 
    dw InstList_SamusProjectile_Charged_PW_PIW_Down_Up_0 
    dw InstList_SamusProjectile_Charged_PW_PIW_Down_Up_0 
    dw InstList_SamusProjectile_Charged_PW_PIW_DownLeft_UpRight_0 
    dw InstList_SamusProjectile_Charged_PW_PIW_Left_Right_0 
    dw InstList_SamusProjectile_Charged_PW_PIW_DownRight_UpLeft_0 
    dw InstList_SamusProjectile_Charged_PW_PIW_Down_Up_0 

ProjectileDataTable_NonBeam_Missile:
    dw $0064 
    dw InstList_SamusProjectile_Missiles_Up 
    dw InstList_SamusProjectile_Missiles_UpRight 
    dw InstList_SamusProjectile_Missiles_Right 
    dw InstList_SamusProjectile_Missiles_DownRight 
    dw InstList_SamusProjectile_Missiles_Down 
    dw InstList_SamusProjectile_Missiles_Down 
    dw InstList_SamusProjectile_Missiles_DownLeft 
    dw InstList_SamusProjectile_Missiles_Left 
    dw InstList_SamusProjectile_Missiles_UpLeft 
    dw InstList_SamusProjectile_Missiles_Up 

ProjectileDataTable_NonBeam_SuperMissile:
    dw $012C 
    dw InstList_SamusProjectile_SuperMissiles_Up 
    dw InstList_SamusProjectile_SuperMissiles_UpRight 
    dw InstList_SamusProjectile_SuperMissiles_Right 
    dw InstList_SamusProjectile_SuperMissiles_DownRight 
    dw InstList_SamusProjectile_SuperMissiles_Down 
    dw InstList_SamusProjectile_SuperMissiles_Down 
    dw InstList_SamusProjectile_SuperMissiles_DownLeft 
    dw InstList_SamusProjectile_SuperMissiles_Left 
    dw InstList_SamusProjectile_SuperMissiles_UpLeft 
    dw InstList_SamusProjectile_SuperMissiles_Up 

ProjectileDataTable_NonBeam_SuperMissileLink:
    dw $012C 
    dw InstList_SamusProjectile_SuperMissileLink_ 

ProjectileDataTable_NonBeam_PowerBomb:
    dw $00C8 
    dw InstList_SamusProjectile_PowerBomb 

ProjectileDataTable_NonBeam_Bomb:
    dw $001E 
    dw InstList_SamusProjectile_Bomb 

ProjectileDataTable_NonBeam_BeamExplosion:
    dw $0008 

ProjectileDataTable_NonBeam_BeamExplosion_pointer:
    dw InstList_SamusProjectile_BeamExplosion 

ProjectileDataTable_NonBeam_MissileExplosion:
    dw $0008 

ProjectileDataTable_NonBeam_MissileExplosion_pointer:
    dw InstList_SamusProjectile_MissileExplosion 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileDataTable_NonBeam_BombExplosion_938681:
    dw $0000 
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileDataTable_NonBeam_BombExplosion_pointer:
    dw InstList_SamusProjectile_BombExplosion 

ProjectileDataTable_NonBeam_PlasmaSBA:
    dw $012C 
    dw InstList_SamusProjectile_PlasmaSBA 

ProjectileDataTable_NonBeam_WaveSBA:
    dw $012C 
    dw InstList_SamusProjectile_WaveSBA 

ProjectileDataTable_NonBeam_SpazerSBA:
    dw $012C 
    dw InstList_SamusProjectile_Spazer_SpazerIce_Up_0 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjDataTable_NonBeam_SuperMissileExplosion_938691:
    dw $0008 
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileDataTable_NonBeam_SuperMissileExplosion_pointer:
    dw InstList_SamusProjectile_SuperMissileExplosion 

UNUSED_ProjectileDataTable_NonBeam_Projectile25_938695:
    dw $F000 
    dw UNUSED_InstList_SamusProjectile_Projectile25_93A0F3 
    dw UNUSED_InstList_SamusProjectile_Projectile25_93A0F3 
    dw UNUSED_InstList_SamusProjectile_Projectile25_93A0F3 
    dw UNUSED_InstList_SamusProjectile_Projectile25_93A0F3 
    dw UNUSED_InstList_SamusProjectile_Projectile25_93A0F3 
    dw UNUSED_InstList_SamusProjectile_Projectile25_93A0F3 
    dw UNUSED_InstList_SamusProjectile_Projectile25_93A0F3 
    dw UNUSED_InstList_SamusProjectile_Projectile25_93A0F3 
    dw UNUSED_InstList_SamusProjectile_Projectile25_93A0F3 
    dw UNUSED_InstList_SamusProjectile_Projectile25_93A0F3 

ProjectileDataTable_NonBeam_SpazerSBATrail:
    dw $012C 
    dw InstList_SamusProjectile_SpazerSBATrail_0 
    dw InstList_SamusProjectile_SpazerSBATrail_0 
    dw InstList_SamusProjectile_SpazerSBATrail_0 
    dw InstList_SamusProjectile_SpazerSBATrail_0 
    dw InstList_SamusProjectile_SpazerSBATrail_0 
    dw InstList_SamusProjectile_SpazerSBATrail_0 
    dw InstList_SamusProjectile_SpazerSBATrail_0 
    dw InstList_SamusProjectile_SpazerSBATrail_0 
    dw InstList_SamusProjectile_SpazerSBATrail_0 
    dw InstList_SamusProjectile_SpazerSBATrail_0 

ProjectileDataTable_NonBeam_ShinesparkEcho:
    dw $1000 
    dw InstList_SamusProjectile_ShinesparkEcho 
    dw InstList_SamusProjectile_ShinesparkEcho 
    dw InstList_SamusProjectile_ShinesparkEcho 
    dw InstList_SamusProjectile_ShinesparkEcho 
    dw InstList_SamusProjectile_ShinesparkEcho 
    dw InstList_SamusProjectile_ShinesparkEcho 
    dw InstList_SamusProjectile_ShinesparkEcho 
    dw InstList_SamusProjectile_ShinesparkEcho 
    dw InstList_SamusProjectile_ShinesparkEcho 
    dw InstList_SamusProjectile_ShinesparkEcho 

UNUSED_ProjectileDataTable_NonBeam_Projectile27_9386D7:
    dw $0000 
    dw UNUSED_InstList_SamusProjectile_Projectile27_93A16D 

InstList_SamusProjectile_Power_Up:
    dw $000F 
    dw ProjectileFlareSpritemaps_Power_2 
    db $04,$04 
    dw $0000 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Power_Up 

InstList_SamusProjectile_Power_UpRight:
    dw $000F 
    dw ProjectileFlareSpritemaps_Power_3 
    db $08,$04 
    dw $0000 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Power_UpRight 

InstList_SamusProjectile_Power_Right:
    dw $000F 
    dw ProjectileFlareSpritemaps_Power_4 
    db $08,$04 
    dw $0000 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Power_Right 

InstList_SamusProjectile_Power_DownRight:
    dw $000F 
    dw ProjectileFlareSpritemaps_Power_5 
    db $08,$04 
    dw $0000 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Power_DownRight 

InstList_SamusProjectile_Power_Down:
    dw $000F 
    dw ProjectileFlareSpritemaps_Power_6 
    db $04,$04 
    dw $0000 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Power_Down 

InstList_SamusProjectile_Power_DownLeft:
    dw $000F 
    dw ProjectileFlareSpritemaps_Power_7 
    db $08,$04 
    dw $0000 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Power_DownLeft 

InstList_SamusProjectile_Power_Left:
    dw $000F 
    dw ProjectileFlareSpritemaps_Power_0 
    db $08,$04 
    dw $0000 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Power_Left 

InstList_SamusProjectile_Power_UpLeft:
    dw $000F 
    dw ProjectileFlareSpritemaps_Power_1 
    db $08,$04 
    dw $0000 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Power_UpLeft 

InstList_SamusProjectile_Wave_IceWave_Up:
    dw $0004 
    dw Spritemap_Nothing_93A117 
    db $0C,$04 
    dw $0000 

InstList_SamusProjectile_Wave_IceWave_Down:
    dw $0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_0 
    db $0C,$04 
    dw $0000,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_11 
    db $0C,$04 
    dw $0001,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_12 
    db $0C,$04 
    dw $0002,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_13 
    db $10,$04 
    dw $0003,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_14 
    db $14,$04 
    dw $0004,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_13 
    db $10,$04 
    dw $0005,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_12 
    db $0C,$04 
    dw $0006,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_11 
    db $0C,$04 
    dw $0007,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_0 
    db $0C,$04 
    dw $0008,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_15 
    db $0C,$04 
    dw $0009,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_16 
    db $0C,$04 
    dw $000A,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_17 
    db $10,$04 
    dw $000B,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_18 
    db $14,$04 
    dw $000C,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_17 
    db $10,$04 
    dw $000D,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_16 
    db $0C,$04 
    dw $000E,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_15 
    db $0C,$04 
    dw $000F 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Wave_IceWave_Down 

InstList_SamusProjectile_Wave_IceWave_DownLeft_UpRight:
    dw $0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_0 
    db $08,$08 
    dw $0000,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_19 
    db $08,$08 
    dw $0001,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_1A 
    db $08,$08 
    dw $0002,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_1B 
    db $0A,$0A 
    dw $0003,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_1C 
    db $0C,$0C 
    dw $0004,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_1B 
    db $0A,$0A 
    dw $0005,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_1A 
    db $08,$08 
    dw $0006,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_19 
    db $06,$06 
    dw $0007,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_0 
    db $04,$04 
    dw $0008,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_1D 
    db $06,$06 
    dw $0009,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_1E 
    db $08,$08 
    dw $000A,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_1F 
    db $0A,$0A 
    dw $000B,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_20 
    db $0C,$0C 
    dw $000C,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_1F 
    db $0A,$0A 
    dw $000D,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_1E 
    db $08,$08 
    dw $000E,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_1D 
    db $08,$08 
    dw $000F 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Wave_IceWave_DownLeft_UpRight 

InstList_SamusProjectile_Wave_IceWave_Left_Right:
    dw $0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_0 
    db $04,$0C 
    dw $0000,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_1 
    db $04,$0C 
    dw $0001,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_2 
    db $04,$0C 
    dw $0002,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_3 
    db $04,$10 
    dw $0003,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_4 
    db $04,$14 
    dw $0004,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_3 
    db $04,$10 
    dw $0005,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_2 
    db $04,$0C 
    dw $0006,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_1 
    db $04,$0C 
    dw $0007,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_0 
    db $04,$0C 
    dw $0008,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_5 
    db $04,$0C 
    dw $0009,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_6 
    db $04,$0C 
    dw $000A,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_7 
    db $04,$10 
    dw $000B,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_8 
    db $04,$14 
    dw $000C,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_7 
    db $04,$10 
    dw $000D,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_6 
    db $04,$0C 
    dw $000E,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_5 
    db $04,$0C 
    dw $000F 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Wave_IceWave_Left_Right 

InstList_SamusProjectile_Wave_IceWave_DownRight_UpLeft:
    dw $0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_0 
    db $08,$08 
    dw $0000,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_9 
    db $08,$08 
    dw $0001,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_A 
    db $08,$08 
    dw $0002,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_B 
    db $0A,$0A 
    dw $0003,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_C 
    db $0C,$0C 
    dw $0004,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_B 
    db $0A,$0A 
    dw $0005,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_A 
    db $08,$08 
    dw $0006,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_9 
    db $06,$06 
    dw $0007,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_0 
    db $04,$04 
    dw $0008,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_D 
    db $06,$06 
    dw $0009,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_E 
    db $08,$08 
    dw $000A,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_F 
    db $0A,$0A 
    dw $000B,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_10 
    db $0C,$0C 
    dw $000C,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_F 
    db $0A,$0A 
    dw $000D,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_E 
    db $08,$08 
    dw $000E,$0001 
    dw ProjectileFlareSpritemaps_Wave_IceWave_D 
    db $08,$08 
    dw $000F 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Wave_IceWave_DownRight_UpLeft 

InstList_SamusProjectile_Ice:
    dw $0001 
    dw ProjectileFlareSpritemaps_Ice_0 
    db $08,$08 
    dw $0000,$0001 
    dw ProjectileFlareSpritemaps_Ice_1 
    db $08,$08 
    dw $0001,$0001 
    dw ProjectileFlareSpritemaps_Ice_2 
    db $08,$08 
    dw $0002,$0001 
    dw ProjectileFlareSpritemaps_Ice_3 
    db $08,$08 
    dw $0003 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Ice 

InstList_SamusProjectile_Spazer_SpazerIce_Up_0:
    dw $0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_23 
    db $0C,$08 
    dw $0000,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_25 
    db $0C,$08 
    dw $0001 

InstList_SamusProjectile_Spazer_SpazerIce_Up_1:
    dw $0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_28 
    db $14,$08 
    dw $0002 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Spazer_SpazerIce_Up_1 

InstList_SamusProjectile_Spazer_SpazerIce_UpRight_0:
    dw $0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_0 
    db $08,$08 
    dw $0000,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_1 
    db $0C,$0C 
    dw $0001 

InstList_SamusProjectile_Spazer_SpazerIce_UpRight_1:
    dw $0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_4 
    db $10,$10 
    dw $0002 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Spazer_SpazerIce_UpRight_1 

InstList_SamusProjectile_Spazer_SpazerIce_Right_0:
    dw $0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_29 
    db $08,$0C 
    dw $0000,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_2B 
    db $08,$0C 
    dw $0001 

InstList_SamusProjectile_Spazer_SpazerIce_Right_1:
    dw $0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_2E 
    db $08,$14 
    dw $0002 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Spazer_SpazerIce_Right_1 

InstList_SamusProjectile_Spazer_SpazerIce_DownRight_0:
    dw $0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_6 
    db $08,$08 
    dw $0000,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_7 
    db $0C,$0C 
    dw $0001 

InstList_SamusProjectile_Spazer_SpazerIce_DownRight_1:
    dw $0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_A 
    db $10,$10 
    dw $0002 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Spazer_SpazerIce_DownRight_1 

InstList_SamusProjectile_Spazer_SpazerIce_Down_0:
    dw $0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_17 
    db $0C,$08 
    dw $0000,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_19 
    db $0C,$08 
    dw $0001 

InstList_SamusProjectile_Spazer_SpazerIce_Down_1:
    dw $0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_1C 
    db $14,$08 
    dw $0002 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Spazer_SpazerIce_Down_1 

InstList_SamusProjectile_Spazer_SpazerIce_DownLeft_0:
    dw $0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_C 
    db $08,$08 
    dw $0000,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_D 
    db $0C,$0C 
    dw $0001 

InstList_SamusProjectile_Spazer_SpazerIce_DownLeft_1:
    dw $0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_10 
    db $10,$10 
    dw $0002 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Spazer_SpazerIce_DownLeft_1 

InstList_SamusProjectile_Spazer_SpazerIce_Left_0:
    dw $0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_1D 
    db $08,$0C 
    dw $0000,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_1F 
    db $08,$0C 
    dw $0001 

InstList_SamusProjectile_Spazer_SpazerIce_Left_1:
    dw $0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_22 
    db $08,$14 
    dw $0002 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Spazer_SpazerIce_Left_1 

InstList_SamusProjectile_Spazer_SpazerIce_UpLeft_0:
    dw $0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_11 
    db $08,$08 
    dw $0000,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_12 
    db $0C,$0C 
    dw $0001 

InstList_SamusProjectile_Spazer_SpazerIce_UpLeft_1:
    dw $0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_15 
    db $10,$10 
    dw $0002 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Spazer_SpazerIce_UpLeft_1 

InstList_SamusProjectile_SpazerWave_SpazerIceWave_Up:
    dw $0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_23 
    db $0C,$08 
    dw $0000,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_24 
    db $0C,$08 
    dw $0001,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_25 
    db $0C,$08 
    dw $0002,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_26 
    db $11,$08 
    dw $0003,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_27 
    db $13,$08 
    dw $0004,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_28 
    db $14,$08 
    dw $0005,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_27 
    db $13,$08 
    dw $0006,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_26 
    db $11,$08 
    dw $0007,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_25 
    db $0C,$08 
    dw $0008,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_24 
    db $0C,$08 
    dw $0009 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Up 

InstList_SamusProjectile_SpazerWave_SpazerIceWave_UpRight:
    dw $0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_0 
    db $08,$08 
    dw $0000,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_5 
    db $08,$08 
    dw $0001,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_1 
    db $0C,$0C 
    dw $0002,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_2 
    db $10,$10 
    dw $0003,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_3 
    db $10,$10 
    dw $0004,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_4 
    db $10,$10 
    dw $0005,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_3 
    db $10,$10 
    dw $0006,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_2 
    db $10,$10 
    dw $0007,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_1 
    db $0C,$0C 
    dw $0008,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_5 
    db $08,$08 
    dw $0009 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_UpRight 

InstList_SamusProjectile_SpazerWave_SpazerIceWave_Right:
    dw $0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_29 
    db $08,$0C 
    dw $0000,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_2A 
    db $08,$0C 
    dw $0001,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_2B 
    db $08,$0C 
    dw $0002,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_2C 
    db $08,$11 
    dw $0003,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_2D 
    db $08,$13 
    dw $0004,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_2E 
    db $08,$14 
    dw $0005,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_2D 
    db $08,$13 
    dw $0006,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_2C 
    db $08,$11 
    dw $0007,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_2B 
    db $08,$0C 
    dw $0008,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_2A 
    db $08,$0C 
    dw $0009 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Right 

InstList_SamusProjectile_SpazerWave_SpazerIceWave_DownRight:
    dw $0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_6 
    db $08,$08 
    dw $0000,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_B 
    db $08,$08 
    dw $0001,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_7 
    db $0C,$0C 
    dw $0002,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_8 
    db $10,$10 
    dw $0003,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_9 
    db $10,$10 
    dw $0004,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_A 
    db $10,$10 
    dw $0005,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_9 
    db $10,$10 
    dw $0006,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_8 
    db $10,$10 
    dw $0007,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_7 
    db $0C,$0C 
    dw $0008,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_B 
    db $08,$08 
    dw $0009 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_DownRight 

InstList_SamusProjectile_SpazerWave_SpazerIceWave_Down:
    dw $0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_17 
    db $0C,$08 
    dw $0000,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_18 
    db $0C,$08 
    dw $0001,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_19 
    db $0C,$08 
    dw $0002,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_1A 
    db $11,$08 
    dw $0003,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_1B 
    db $13,$08 
    dw $0004,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_1C 
    db $14,$08 
    dw $0005,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_1B 
    db $13,$08 
    dw $0006,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_1A 
    db $11,$08 
    dw $0007,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_19 
    db $0C,$08 
    dw $0008,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_18 
    db $0C,$08 
    dw $0009 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Down 

InstList_SamusProjectile_SpazerWave_SpazerIceWave_DownLeft:
    dw $0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_C 
    db $08,$08 
    dw $0000,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_D 
    db $08,$08 
    dw $0001,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_E 
    db $0C,$0C 
    dw $0002,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_F 
    db $10,$10 
    dw $0003,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_10 
    db $10,$10 
    dw $0004,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_10 
    db $10,$10 
    dw $0005,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_10 
    db $10,$10 
    dw $0006,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_F 
    db $10,$10 
    dw $0007,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_E 
    db $0C,$0C 
    dw $0008,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_D 
    db $08,$08 
    dw $0009 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_DownLeft 

InstList_SamusProjectile_SpazerWave_SpazerIceWave_Left:
    dw $0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_1D 
    db $08,$0C 
    dw $0000,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_1E 
    db $08,$0C 
    dw $0001,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_1F 
    db $08,$0C 
    dw $0002,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_20 
    db $08,$11 
    dw $0003,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_21 
    db $08,$13 
    dw $0004,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_22 
    db $08,$14 
    dw $0005,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_21 
    db $08,$13 
    dw $0006,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_20 
    db $08,$11 
    dw $0007,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_1F 
    db $08,$0C 
    dw $0008,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_1E 
    db $08,$0C 
    dw $0009 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Left 

InstList_SamusProjectile_SpazerWave_SpazerIceWave_UpLeft:
    dw $0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_11 
    db $08,$08 
    dw $0000,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_16 
    db $08,$08 
    dw $0001,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_12 
    db $0C,$0C 
    dw $0002,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_13 
    db $10,$10 
    dw $0003,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_14 
    db $10,$10 
    dw $0004,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_15 
    db $10,$10 
    dw $0005,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_14 
    db $10,$10 
    dw $0006,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_13 
    db $10,$10 
    dw $0007,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_12 
    db $0C,$0C 
    dw $0008,$0002 
    dw ProjectileFlareSpritemaps_S_SI_SW_SIW_16 
    db $08,$08 
    dw $0009 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_UpLeft 

InstList_SamusProjectile_Plasma_PlasmaIce_Down_Up_0:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_4 
    db $08,$10 
    dw $0000 

InstList_SamusProjectile_Plasma_PlasmaIce_Down_Up_1:
    dw $000F 
    dw ProjectileFlareSpritemaps_Plasma_PlasmaIce_2 
    db $08,$10 
    dw $0001 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Down_Up_1 

InstList_SamusProjectile_Plasma_PlasmaIce_DownLeft_UpRight_0:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_C 
    db $08,$08 
    dw $0000 

InstList_SamusProjectile_Plasma_PlasmaIce_DownLeft_UpRight_1:
    dw $000F 
    dw ProjectileFlareSpritemaps_Plasma_PlasmaIce_3 
    db $08,$08 
    dw $0001 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Plasma_PlasmaIce_DownLeft_UpRight_1 

InstList_SamusProjectile_Plasma_PlasmaIce_Left_Right_0:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_0 
    db $08,$08 
    dw $0000 

InstList_SamusProjectile_Plasma_PlasmaIce_Left_Right_1:
    dw $000F 
    dw ProjectileFlareSpritemaps_Plasma_PlasmaIce_0 
    db $10,$08 
    dw $0001 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Left_Right_1 

InstList_SamusProjectile_Plasma_PlasmaIce_DownRight_UpLeft_0:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_8 
    db $08,$08 
    dw $0000 

InstList_SamusProjectile_Plasma_PlasmaIce_DownRight_UpLeft_1:
    dw $000F 
    dw ProjectileFlareSpritemaps_Plasma_PlasmaIce_1 
    db $08,$08 
    dw $0001 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Plasma_PlasmaIce_DownRight_UpLeft_1 

InstList_SamusProjectile_PlasmaIceWave_Down_Up:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_4 
    db $0C,$10 
    dw $0000 

InstList_SamusProjectile_PlasmaWave_Down_Up:
    dw $0002 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_14 
    db $0C,$10 
    dw $0001,$0002 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_15 
    db $0C,$10 
    dw $0002,$0002 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_16 
    db $11,$10 
    dw $0003,$0002 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_17 
    db $13,$10 
    dw $0004,$0002 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_18 
    db $14,$10 
    dw $0005,$0002 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_17 
    db $13,$10 
    dw $0006,$0002 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_16 
    db $11,$10 
    dw $0007,$0002 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_15 
    db $0C,$10 
    dw $0008 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_PlasmaWave_Down_Up 

InstList_SamusProjectile_PlasmaIceWave_DownLeft_UpRight:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_C 
    db $08,$08 
    dw $0000 

InstList_SamusProjectile_PlasmaWave_DownLeft_UpRight:
    dw $0002 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_32 
    db $08,$08 
    dw $0001,$0002 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_33 
    db $0C,$0C 
    dw $0002,$0002 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_34 
    db $10,$10 
    dw $0003,$0002 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_35 
    db $10,$10 
    dw $0004,$0002 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_36 
    db $14,$14 
    dw $0005,$0002 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_35 
    db $10,$10 
    dw $0006,$0002 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_34 
    db $10,$10 
    dw $0007,$0002 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_33 
    db $0C,$0C 
    dw $0008 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_PlasmaWave_DownLeft_UpRight 

InstList_SamusProj_PlasmaWave_PlasmaIceWave_Left_Right_0:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_0 
    db $08,$0C 
    dw $0000 

InstList_SamusProj_PlasmaWave_PlasmaIceWave_Left_Right_1:
    dw $0002 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_0 
    db $10,$0C 
    dw $0001,$0002 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_1 
    db $10,$0C 
    dw $0002,$0002 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_2 
    db $10,$11 
    dw $0003,$0002 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_3 
    db $10,$13 
    dw $0004,$0002 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_4 
    db $10,$14 
    dw $0005,$0002 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_3 
    db $10,$13 
    dw $0006,$0002 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_2 
    db $10,$11 
    dw $0007,$0002 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_1 
    db $10,$0C 
    dw $0008 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProj_PlasmaWave_PlasmaIceWave_Left_Right_1 

InstList_SamusProjectile_PlasmaIceWave_DownRight_UpLeft:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_8 
    db $08,$08 
    dw $0000 

InstList_SamusProjectile_PlasmaWave_DownRight_UpLeft:
    dw $0002 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_A 
    db $08,$08 
    dw $0001,$0002 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_B 
    db $0C,$0C 
    dw $0002,$0002 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_C 
    db $10,$10 
    dw $0003,$0002 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_D 
    db $10,$10 
    dw $0004,$0002 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_E 
    db $14,$14 
    dw $0005,$0002 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_D 
    db $10,$10 
    dw $0006,$0002 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_C 
    db $10,$10 
    dw $0007,$0002 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_B 
    db $0C,$0C 
    dw $0008 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_PlasmaWave_DownRight_UpLeft 

InstList_SamusProjectile_Charged_Power_Up:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_Power_2 
    db $08,$08 
    dw $0000,$0001 
    dw ProjectileFlareSpritemaps_Charged_Power_A 
    db $08,$08 
    dw $0001 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Charged_Power_Up 

InstList_SamusProjectile_Charged_Power_UpRight:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_Power_3 
    db $08,$08 
    dw $0000,$0001 
    dw ProjectileFlareSpritemaps_Charged_Power_B 
    db $08,$08 
    dw $0001 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Charged_Power_UpRight 

InstList_SamusProjectile_Charged_Power_Right:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_Power_4 
    db $08,$08 
    dw $0000,$0001 
    dw ProjectileFlareSpritemaps_Charged_Power_C 
    db $08,$08 
    dw $0001 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Charged_Power_Right 

InstList_SamusProjectile_Charged_Power_DownRight:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_Power_5 
    db $08,$08 
    dw $0000,$0001 
    dw ProjectileFlareSpritemaps_Charged_Power_D 
    db $08,$08 
    dw $0001 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Charged_Power_DownRight 

InstList_SamusProjectile_Charged_Power_Down:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_Power_6 
    db $08,$08 
    dw $0000,$0001 
    dw ProjectileFlareSpritemaps_Charged_Power_E 
    db $08,$08 
    dw $0001 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Charged_Power_Down 

InstList_SamusProjectile_Charged_Power_DownLeft:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_Power_7 
    db $08,$08 
    dw $0000,$0001 
    dw ProjectileFlareSpritemaps_Charged_Power_F 
    db $08,$08 
    dw $0001 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Charged_Power_DownLeft 

InstList_SamusProjectile_Charged_Power_Left:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_Power_0 
    db $08,$08 
    dw $0000,$0001 
    dw ProjectileFlareSpritemaps_Charged_Power_8 
    db $08,$08 
    dw $0001 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Charged_Power_Left 

InstList_SamusProjectile_Charged_Power_UpLeft:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_Power_1 
    db $08,$08 
    dw $0000,$0001 
    dw ProjectileFlareSpritemaps_Charged_Power_9 
    db $08,$08 
    dw $0001 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Charged_Power_UpLeft 

InstList_SamusProjectile_Charged_Wave_Up:
    dw $0003 
    dw Spritemap_Nothing_93A117 
    db $0C,$08 
    dw $0000 

InstList_SamusProjectile_Charged_Wave_Down:
    dw $0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_0 
    db $0C,$08 
    dw $0000,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1 
    db $0C,$08 
    dw $0001,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1A 
    db $10,$08 
    dw $0002,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1B 
    db $10,$08 
    dw $0003,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1C 
    db $14,$08 
    dw $0004,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1D 
    db $14,$08 
    dw $0005,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1E 
    db $17,$08 
    dw $0006,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1F 
    db $17,$08 
    dw $0007,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_20 
    db $18,$08 
    dw $0008,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_21 
    db $18,$08 
    dw $0009,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1E 
    db $17,$08 
    dw $000A,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1F 
    db $17,$08 
    dw $000B,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1C 
    db $14,$08 
    dw $000C,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1D 
    db $14,$08 
    dw $000D,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1B 
    db $10,$08 
    dw $000E,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1A 
    db $10,$08 
    dw $000F 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Charged_Wave_Down 

InstList_SamusProjectile_Charged_Wave_DownLeft_UpRight:
    dw $0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_0 
    db $08,$08 
    dw $0000,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1 
    db $08,$08 
    dw $0001,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_12 
    db $0C,$0C 
    dw $0002,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_13 
    db $0C,$0C 
    dw $0003,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_14 
    db $10,$10 
    dw $0004,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_15 
    db $10,$10 
    dw $0005,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_16 
    db $11,$11 
    dw $0006,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_17 
    db $11,$11 
    dw $0007,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_18 
    db $12,$12 
    dw $0008,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_19 
    db $12,$12 
    dw $0009,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_16 
    db $11,$11 
    dw $000A,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_17 
    db $11,$11 
    dw $000B,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_14 
    db $10,$10 
    dw $000C,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_15 
    db $10,$10 
    dw $000D,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_12 
    db $0C,$0C 
    dw $000E,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_13 
    db $0C,$0C 
    dw $000F 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Charged_Wave_DownLeft_UpRight 

InstList_SamusProjectile_Charged_Wave_Left_Right:
    dw $0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_0 
    db $08,$0C 
    dw $0000,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1 
    db $08,$0C 
    dw $0001,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_2 
    db $08,$10 
    dw $0002,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_3 
    db $08,$10 
    dw $0003,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_4 
    db $08,$14 
    dw $0004,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_5 
    db $08,$14 
    dw $0005,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_6 
    db $08,$17 
    dw $0006,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_7 
    db $08,$17 
    dw $0007,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_8 
    db $08,$18 
    dw $0008,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_9 
    db $08,$18 
    dw $0009,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_6 
    db $08,$17 
    dw $000A,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_7 
    db $08,$17 
    dw $000B,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_4 
    db $08,$14 
    dw $000C,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_5 
    db $08,$14 
    dw $000D,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_3 
    db $08,$10 
    dw $000E,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_2 
    db $08,$10 
    dw $000F 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Charged_Wave_Left_Right 

InstList_SamusProjectile_Charged_Wave_DownRight_UpLeft:
    dw $0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_0 
    db $08,$08 
    dw $0000,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1 
    db $08,$08 
    dw $0001,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_A 
    db $0C,$0C 
    dw $0002,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_B 
    db $0C,$0C 
    dw $0003,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_C 
    db $10,$10 
    dw $0004,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_D 
    db $10,$10 
    dw $0005,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_E 
    db $11,$11 
    dw $0006,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_F 
    db $11,$11 
    dw $0007,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_10 
    db $12,$12 
    dw $0008,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_11 
    db $12,$12 
    dw $0009,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_E 
    db $11,$11 
    dw $000A,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_F 
    db $11,$11 
    dw $000B,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_C 
    db $10,$10 
    dw $000C,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_D 
    db $10,$10 
    dw $000D,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_A 
    db $0C,$0C 
    dw $000E,$0001 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_B 
    db $0C,$0C 
    dw $000F 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Charged_Wave_DownRight_UpLeft 

InstList_SamusProjectile_Charged_Ice:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_Ice_0 
    db $08,$08 
    dw $0000,$0001 
    dw ProjectileFlareSpritemaps_Charged_Ice_1 
    db $08,$08 
    dw $0001,$0001 
    dw ProjectileFlareSpritemaps_Charged_Ice_2 
    db $08,$08 
    dw $0002,$0001 
    dw ProjectileFlareSpritemaps_Charged_Ice_3 
    db $08,$08 
    dw $0003 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Charged_Ice 

InstList_SamusProjectile_Charged_IW_Up:
    dw $0003 
    dw Spritemap_Nothing_93A117 
    db $0C,$08 
    dw $0000 

InstList_SamusProjectile_Charged_IW_Down:
    dw $0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_0 
    db $0C,$08 
    dw $0000,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_1 
    db $0C,$08 
    dw $0001,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_1C 
    db $10,$08 
    dw $0002,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_1D 
    db $10,$08 
    dw $0003,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_1E 
    db $14,$08 
    dw $0004,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_1F 
    db $14,$08 
    dw $0005,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_20 
    db $17,$08 
    dw $0006,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_21 
    db $17,$08 
    dw $0007,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_22 
    db $18,$08 
    dw $0008,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_23 
    db $18,$08 
    dw $0009,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_20 
    db $17,$08 
    dw $000A,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_21 
    db $17,$08 
    dw $000B,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_1E 
    db $14,$08 
    dw $000C,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_1F 
    db $14,$08 
    dw $000D,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_1D 
    db $10,$08 
    dw $000E,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_1C 
    db $10,$08 
    dw $000F 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Charged_IW_Down 

InstList_SamusProjectile_Charged_IW_DownLeft_UpRight:
    dw $0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_0 
    db $08,$08 
    dw $0000,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_1 
    db $08,$08 
    dw $0001,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_12 
    db $0C,$0C 
    dw $0002,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_13 
    db $0C,$0C 
    dw $0003,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_14 
    db $10,$10 
    dw $0004,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_15 
    db $10,$10 
    dw $0005,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_16 
    db $11,$11 
    dw $0006,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_17 
    db $11,$11 
    dw $0007,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_18 
    db $12,$12 
    dw $0008,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_19 
    db $12,$12 
    dw $0009,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_16 
    db $11,$11 
    dw $000A,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_17 
    db $11,$11 
    dw $000B,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_14 
    db $10,$10 
    dw $000C,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_15 
    db $10,$10 
    dw $000D,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_12 
    db $0C,$0C 
    dw $000E,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_13 
    db $0C,$0C 
    dw $000F 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Charged_IW_DownLeft_UpRight 

InstList_SamusProjectile_Charged_IW_Left_Right:
    dw $0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_0 
    db $08,$0C 
    dw $0000,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_1 
    db $08,$0C 
    dw $0001,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_2 
    db $08,$10 
    dw $0002,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_3 
    db $08,$10 
    dw $0003,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_4 
    db $08,$14 
    dw $0004,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_5 
    db $08,$14 
    dw $0005,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_6 
    db $08,$17 
    dw $0006,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_7 
    db $08,$17 
    dw $0007,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_8 
    db $08,$18 
    dw $0008,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_9 
    db $08,$18 
    dw $0009,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_6 
    db $08,$17 
    dw $000A,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_7 
    db $08,$17 
    dw $000B,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_4 
    db $08,$14 
    dw $000C,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_5 
    db $08,$14 
    dw $000D,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_3 
    db $08,$10 
    dw $000E,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_2 
    db $08,$10 
    dw $000F 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Charged_IW_Left_Right 

InstList_SamusProjectile_Charged_IW_DownRight_UpLeft:
    dw $0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_0 
    db $08,$08 
    dw $0000,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_1 
    db $08,$08 
    dw $0001,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_A 
    db $0C,$0C 
    dw $0002,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_B 
    db $0C,$0C 
    dw $0003,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_C 
    db $10,$10 
    dw $0004,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_D 
    db $10,$10 
    dw $0005,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_E 
    db $11,$11 
    dw $0006,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_F 
    db $11,$11 
    dw $0007,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_10 
    db $12,$12 
    dw $0008,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_11 
    db $12,$12 
    dw $0009,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_E 
    db $11,$11 
    dw $000A,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_F 
    db $11,$11 
    dw $000B,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_C 
    db $10,$10 
    dw $000C,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_D 
    db $10,$10 
    dw $000D,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_A 
    db $0C,$0C 
    dw $000E,$0001 
    dw ProjectileFlareSpritemaps_ChargedIceWave_B 
    db $0C,$0C 
    dw $000F 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Charged_IW_DownRight_UpLeft 

InstList_SamusProjectile_Charged_S_SI_Down_Up_0:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4C 
    db $0C,$08 
    dw $0000,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5B 
    db $0C,$08 
    dw $0001,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4D 
    db $0C,$08 
    dw $0002,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5C 
    db $0C,$08 
    dw $0003,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3C 
    db $0C,$10 
    dw $0004,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_6 
    db $0C,$10 
    dw $0005,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3E 
    db $0C,$10 
    dw $0006,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_8 
    db $0C,$10 
    dw $0007 

InstList_SamusProjectile_Charged_S_SI_Down_Up_1:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_41 
    db $14,$10 
    dw $0008,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_B 
    db $14,$10 
    dw $0009 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Charged_S_SI_Down_Up_1 

InstList_SamusProjectile_Charged_S_SI_DownLeft_UpRight_0:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4E 
    db $08,$08 
    dw $0000,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5D 
    db $08,$08 
    dw $0001,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4F 
    db $08,$08 
    dw $0002,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5E 
    db $08,$08 
    dw $0003,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_18 
    db $0C,$0C 
    dw $0004,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_12 
    db $0C,$0C 
    dw $0005,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_19 
    db $10,$10 
    dw $0006,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_14 
    db $10,$10 
    dw $0007 

InstList_SamusProjectile_Charged_S_SI_DownLeft_UpRight_1:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1C 
    db $14,$14 
    dw $0008,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_17 
    db $14,$14 
    dw $0009 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Charged_S_SI_DownLeft_UpRight_1 

InstList_SamusProjectile_Charged_S_SI_Left_Right_0:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_51 
    db $08,$0C 
    dw $0000,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_57 
    db $08,$0C 
    dw $0001,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_52 
    db $08,$0C 
    dw $0002,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_58 
    db $08,$0C 
    dw $0003,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_36 
    db $10,$0C 
    dw $0004,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_0 
    db $10,$0C 
    dw $0005,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_38 
    db $10,$0C 
    dw $0006,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2 
    db $10,$0C 
    dw $0007 

InstList_SamusProjectile_Charged_S_SI_Left_Right_1:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3B 
    db $10,$14 
    dw $0008,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5 
    db $10,$14 
    dw $0009 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Charged_S_SI_Left_Right_1 

InstList_SamusProjectile_Charged_S_SI_DownRight_UpLeft_0:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_53 
    db $08,$08 
    dw $0000,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_59 
    db $08,$08 
    dw $0001,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_54 
    db $08,$08 
    dw $0002,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5A 
    db $08,$08 
    dw $0003,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1E 
    db $0C,$0C 
    dw $0004,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_C 
    db $0C,$0C 
    dw $0005,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1F 
    db $10,$10 
    dw $0006,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_E 
    db $10,$10 
    dw $0007 

InstList_SamusProjectile_Charged_S_SI_DownRight_UpLeft_1:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_22 
    db $14,$14 
    dw $0008,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_11 
    db $14,$14 
    dw $0009 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Charged_S_SI_DownRight_UpLeft_1 

InstList_SamusProjectile_Charged_SW_SIW_Up_0:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4C 
    db $0C,$08 
    dw $0000,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5B 
    db $0C,$08 
    dw $0001,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4D 
    db $0C,$08 
    dw $0002,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5C 
    db $0C,$08 
    dw $0003 

InstList_SamusProjectile_Charged_SW_SIW_Up_1:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3C 
    db $0C,$10 
    dw $0004,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_6 
    db $0C,$10 
    dw $0005,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3D 
    db $0C,$10 
    dw $0006,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_7 
    db $0C,$10 
    dw $0007,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3E 
    db $0C,$10 
    dw $0008,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_8 
    db $0C,$10 
    dw $0009,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3F 
    db $10,$10 
    dw $000A,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_9 
    db $10,$10 
    dw $000B,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_40 
    db $12,$10 
    dw $000C,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_A 
    db $12,$10 
    dw $000D,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_41 
    db $14,$10 
    dw $000E,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_B 
    db $14,$10 
    dw $000F,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_40 
    db $12,$10 
    dw $0010,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_A 
    db $12,$10 
    dw $0011,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3F 
    db $10,$10 
    dw $0012,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_9 
    db $10,$10 
    dw $0013,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3E 
    db $0C,$10 
    dw $0014,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_8 
    db $0C,$10 
    dw $0015,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3D 
    db $08,$10 
    dw $0016,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_7 
    db $08,$10 
    dw $0017 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Charged_SW_SIW_Up_1 

InstList_SamusProjectile_Charged_SW_SIW_UpRight_0:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4E 
    db $08,$08 
    dw $0000,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5D 
    db $08,$08 
    dw $0001,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4F 
    db $08,$08 
    dw $0002,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5E 
    db $08,$08 
    dw $0003 

InstList_SamusProjectile_Charged_SW_SIW_UpRight_1:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_18 
    db $0C,$0C 
    dw $0004,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_12 
    db $0C,$0C 
    dw $0005,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1D 
    db $0C,$0C 
    dw $0006,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_13 
    db $0C,$0C 
    dw $0007,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_19 
    db $10,$10 
    dw $0008,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_14 
    db $10,$10 
    dw $0009,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1A 
    db $10,$10 
    dw $000A,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_15 
    db $10,$10 
    dw $000B,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1B 
    db $10,$10 
    dw $000C,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_16 
    db $10,$10 
    dw $000D,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1C 
    db $14,$14 
    dw $000E,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_17 
    db $14,$14 
    dw $000F,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1B 
    db $10,$10 
    dw $0010,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_16 
    db $10,$10 
    dw $0011,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1A 
    db $10,$10 
    dw $0012,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_15 
    db $10,$10 
    dw $0013,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_19 
    db $10,$10 
    dw $0014,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_14 
    db $10,$10 
    dw $0015,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1D 
    db $0C,$0C 
    dw $0016,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_13 
    db $0C,$0C 
    dw $0017 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Charged_SW_SIW_UpRight_1 

InstList_SamusProjectile_Charged_SW_SIW_Right_0:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_51 
    db $08,$0C 
    dw $0000,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_57 
    db $08,$0C 
    dw $0001,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_52 
    db $08,$0C 
    dw $0002,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_58 
    db $08,$0C 
    dw $0003 

InstList_SamusProjectile_Charged_SW_SIW_Right_1:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_42 
    db $10,$0C 
    dw $0004,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_0 
    db $10,$0C 
    dw $0005,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_43 
    db $10,$0C 
    dw $0006,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1 
    db $10,$0C 
    dw $0007,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_44 
    db $10,$0C 
    dw $0008,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2 
    db $10,$0C 
    dw $0009,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_45 
    db $10,$10 
    dw $000A,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3 
    db $10,$10 
    dw $000B,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_46 
    db $10,$12 
    dw $000C,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4 
    db $10,$12 
    dw $000D,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_47 
    db $10,$14 
    dw $000E,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5 
    db $10,$14 
    dw $000F,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_46 
    db $10,$12 
    dw $0010,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4 
    db $10,$12 
    dw $0011,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_45 
    db $10,$10 
    dw $0012,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3 
    db $10,$10 
    dw $0013,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_44 
    db $10,$0C 
    dw $0014,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2 
    db $10,$0C 
    dw $0015,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_43 
    db $10,$08 
    dw $0016,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1 
    db $10,$08 
    dw $0017 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Charged_SW_SIW_Right_1 

InstList_SamusProjectile_Charged_SW_SIW_DownRight_0:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_53 
    db $08,$08 
    dw $0000,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_59 
    db $08,$08 
    dw $0001,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_54 
    db $08,$08 
    dw $0002,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5A 
    db $08,$08 
    dw $0003 

InstList_SamusProjectile_Charged_SW_SIW_DownRight_1:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1E 
    db $0C,$0C 
    dw $0004,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_C 
    db $0C,$0C 
    dw $0005,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_23 
    db $0C,$0C 
    dw $0006,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_D 
    db $0C,$0C 
    dw $0007,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1F 
    db $10,$10 
    dw $0008,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_E 
    db $10,$10 
    dw $0009,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_20 
    db $10,$10 
    dw $000A,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_F 
    db $10,$10 
    dw $000B,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_21 
    db $10,$10 
    dw $000C,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_10 
    db $10,$10 
    dw $000D,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_22 
    db $14,$14 
    dw $000E,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_11 
    db $14,$14 
    dw $000F,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_21 
    db $10,$10 
    dw $0010,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_10 
    db $10,$10 
    dw $0011,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_20 
    db $10,$10 
    dw $0012,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_F 
    db $10,$10 
    dw $0013,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1F 
    db $10,$10 
    dw $0014,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_E 
    db $10,$10 
    dw $0015,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_23 
    db $0C,$0C 
    dw $0016,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_D 
    db $0C,$0C 
    dw $0017 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Charged_SW_SIW_DownRight_1 

InstList_SamusProjectile_Charged_SW_SIW_Down_0:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_55 
    db $0C,$08 
    dw $0000,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5B 
    db $0C,$08 
    dw $0001,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_56 
    db $0C,$08 
    dw $0002,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5C 
    db $0C,$08 
    dw $0003 

InstList_SamusProjectile_Charged_SW_SIW_Down_1:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_30 
    db $0C,$10 
    dw $0004,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_6 
    db $0C,$10 
    dw $0005,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_31 
    db $0C,$10 
    dw $0006,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_7 
    db $0C,$10 
    dw $0007,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_32 
    db $0C,$10 
    dw $0008,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_8 
    db $0C,$10 
    dw $0009,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_33 
    db $10,$10 
    dw $000A,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_9 
    db $10,$10 
    dw $000B,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_34 
    db $12,$10 
    dw $000C,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_A 
    db $12,$10 
    dw $000D,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_35 
    db $14,$10 
    dw $000E,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_B 
    db $14,$10 
    dw $000F,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_34 
    db $12,$10 
    dw $0010,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_A 
    db $12,$10 
    dw $0011,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_33 
    db $10,$10 
    dw $0012,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_9 
    db $10,$10 
    dw $0013,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_32 
    db $0C,$10 
    dw $0014,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_8 
    db $0C,$10 
    dw $0015,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_31 
    db $08,$10 
    dw $0016,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_7 
    db $08,$10 
    dw $0017 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Charged_SW_SIW_Down_1 

InstList_SamusProjectile_Charged_SW_SIW_DownLeft_0:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4E 
    db $08,$08 
    dw $0000,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5D 
    db $08,$08 
    dw $0001,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4F 
    db $08,$08 
    dw $0002,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5E 
    db $08,$08 
    dw $0003 

InstList_SamusProjectile_Charged_SW_SIW_DownLeft_1:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_24 
    db $0C,$0C 
    dw $0004,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_12 
    db $0C,$0C 
    dw $0005,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_29 
    db $0C,$0C 
    dw $0006,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_13 
    db $0C,$0C 
    dw $0007,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_25 
    db $10,$10 
    dw $0008,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_14 
    db $10,$10 
    dw $0009,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_26 
    db $10,$10 
    dw $000A,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_15 
    db $10,$10 
    dw $000B,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_27 
    db $10,$10 
    dw $000C,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_16 
    db $10,$10 
    dw $000D,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_28 
    db $14,$14 
    dw $000E,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_17 
    db $14,$14 
    dw $000F,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_27 
    db $10,$10 
    dw $0010,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_16 
    db $10,$10 
    dw $0011,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_26 
    db $10,$10 
    dw $0012,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_15 
    db $10,$10 
    dw $0013,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_25 
    db $10,$10 
    dw $0014,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_14 
    db $10,$10 
    dw $0015,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_29 
    db $0C,$0C 
    dw $0016,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_13 
    db $0C,$0C 
    dw $0017 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Charged_SW_SIW_DownLeft_1 

InstList_SamusProjectile_Charged_SW_SIW_Left_0:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_48 
    db $08,$0C 
    dw $0000,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_57 
    db $08,$0C 
    dw $0001,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_49 
    db $08,$0C 
    dw $0002,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_58 
    db $08,$0C 
    dw $0003 

InstList_SamusProjectile_Charged_SW_SIW_Left_1:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_36 
    db $10,$0C 
    dw $0004,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_0 
    db $10,$0C 
    dw $0005,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_37 
    db $10,$0C 
    dw $0006,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1 
    db $10,$0C 
    dw $0007,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_38 
    db $10,$0C 
    dw $0008,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2 
    db $10,$0C 
    dw $0009,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_39 
    db $10,$10 
    dw $000A,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3 
    db $10,$10 
    dw $000B,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3A 
    db $10,$12 
    dw $000C,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4 
    db $10,$12 
    dw $000D,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3B 
    db $10,$14 
    dw $000E,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5 
    db $10,$14 
    dw $000F,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3A 
    db $10,$12 
    dw $0010,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4 
    db $10,$12 
    dw $0011,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_39 
    db $10,$10 
    dw $0012,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3 
    db $10,$10 
    dw $0013,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_38 
    db $10,$0C 
    dw $0014,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2 
    db $10,$0C 
    dw $0015,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_37 
    db $10,$08 
    dw $0016,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1 
    db $10,$08 
    dw $0017 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Charged_SW_SIW_Left_1 

InstList_SamusProjectile_Charged_SW_SIW_UpLeft_0:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4A 
    db $08,$08 
    dw $0000,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_59 
    db $08,$08 
    dw $0001,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4B 
    db $08,$08 
    dw $0002,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5A 
    db $08,$08 
    dw $0003 

InstList_SamusProjectile_Charged_SW_SIW_UpLeft_1:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2A 
    db $0C,$0C 
    dw $0004,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_C 
    db $0C,$0C 
    dw $0005,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2F 
    db $0C,$0C 
    dw $0006,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_D 
    db $0C,$0C 
    dw $0007,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2B 
    db $10,$10 
    dw $0008,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_E 
    db $10,$10 
    dw $0009,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2C 
    db $10,$10 
    dw $000A,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_F 
    db $10,$10 
    dw $000B,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2D 
    db $10,$10 
    dw $000C,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_10 
    db $10,$10 
    dw $000D,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2E 
    db $14,$14 
    dw $000E,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_11 
    db $14,$14 
    dw $000F,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2D 
    db $10,$10 
    dw $0010,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_10 
    db $10,$10 
    dw $0011,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2C 
    db $10,$10 
    dw $0012,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_F 
    db $10,$10 
    dw $0013,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2B 
    db $10,$10 
    dw $0014,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_E 
    db $10,$10 
    dw $0015,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2F 
    db $0C,$0C 
    dw $0016,$0001 
    dw ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_D 
    db $0C,$0C 
    dw $0017 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Charged_SW_SIW_UpLeft_1 

InstList_SamusProjectile_Charged_P_PI_Down_Up_0:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_4 
    db $08,$08 
    dw $0000,$0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_14 
    db $08,$08 
    dw $0001,$0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_5 
    db $08,$10 
    dw $0002,$0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_15 
    db $08,$10 
    dw $0003,$0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_6 
    db $08,$18 
    dw $0004,$0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_16 
    db $08,$18 
    dw $0005 

InstList_SamusProjectile_Charged_P_PI_Down_Up_1:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_7 
    db $08,$1C 
    dw $0006,$0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_17 
    db $08,$1C 
    dw $0007 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Charged_P_PI_Down_Up_1 

InstList_SamusProjectile_Charged_P_PI_DownLeft_UpRight_0:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_C 
    db $08,$08 
    dw $0000,$0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1C 
    db $08,$08 
    dw $0001,$0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_D 
    db $0C,$0C 
    dw $0002,$0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1D 
    db $0C,$0C 
    dw $0003,$0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_E 
    db $10,$10 
    dw $0004,$0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1E 
    db $10,$10 
    dw $0005 

InstList_SamusProjectile_Charged_P_PI_DownLeft_UpRight_1:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_F 
    db $14,$14 
    dw $0006,$0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1F 
    db $14,$14 
    dw $0007 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Charged_P_PI_DownLeft_UpRight_1 

InstList_SamusProjectile_Charged_P_PI_Left_Right_0:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_0 
    db $08,$08 
    dw $0000,$0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_10 
    db $08,$08 
    dw $0001,$0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1 
    db $10,$08 
    dw $0002,$0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_11 
    db $10,$08 
    dw $0003,$0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_2 
    db $18,$08 
    dw $0004,$0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_12 
    db $18,$08 
    dw $0005 

InstList_SamusProjectile_Charged_P_PI_Left_Right_1:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_3 
    db $1C,$08 
    dw $0006,$0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_13 
    db $1C,$08 
    dw $0007 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Charged_P_PI_Left_Right_1 

InstList_SamusProjectile_Charged_P_PI_DownRight_UpLeft_0:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_8 
    db $08,$08 
    dw $0000,$0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_18 
    db $08,$08 
    dw $0001,$0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_9 
    db $0C,$0C 
    dw $0002,$0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_19 
    db $0C,$0C 
    dw $0003,$0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_A 
    db $10,$10 
    dw $0004,$0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1A 
    db $10,$10 
    dw $0005 

InstList_SamusProjectile_Charged_P_PI_DownRight_UpLeft_1:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_B 
    db $14,$14 
    dw $0006,$0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1B 
    db $14,$14 
    dw $0007 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Charged_P_PI_DownRight_UpLeft_1 

InstList_SamusProjectile_Charged_PW_PIW_Down_Up_0:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_4 
    db $0C,$08 
    dw $0000,$0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_14 
    db $0C,$08 
    dw $0001,$0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_5 
    db $0C,$08 
    dw $0002,$0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_15 
    db $0C,$08 
    dw $0003,$0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_6 
    db $0C,$18 
    dw $0004,$0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_16 
    db $0C,$18 
    dw $0005 

InstList_SamusProjectile_Charged_PW_PIW_Down_Up_1:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_19 
    db $0C,$1E 
    dw $0006,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_28 
    db $0C,$1E 
    dw $0007,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_1A 
    db $0C,$1E 
    dw $0008,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_29 
    db $0C,$1E 
    dw $0009,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_1B 
    db $11,$1E 
    dw $000A,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_2A 
    db $11,$1E 
    dw $000B,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_1C 
    db $13,$1E 
    dw $000C,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_2B 
    db $13,$1E 
    dw $000D,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_1D 
    db $14,$1E 
    dw $000E,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_2C 
    db $14,$1E 
    dw $000F,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_1C 
    db $13,$1E 
    dw $0010,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_2B 
    db $13,$1E 
    dw $0011,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_1B 
    db $11,$1E 
    dw $0012,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_2A 
    db $11,$1E 
    dw $0013,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_1A 
    db $0C,$1E 
    dw $0014,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_29 
    db $0C,$1E 
    dw $0015 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Charged_PW_PIW_Down_Up_1 

InstList_SamusProjectile_Charged_PW_PIW_DownLeft_UpRight_0:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_C 
    db $08,$08 
    dw $0000,$0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1C 
    db $08,$08 
    dw $0001,$0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_D 
    db $08,$08 
    dw $0002,$0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1D 
    db $08,$08 
    dw $0003,$0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_E 
    db $0C,$0C 
    dw $0004,$0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1E 
    db $0C,$0C 
    dw $0005 

InstList_SamusProjectile_Charged_PW_PIW_DownLeft_UpRight_1:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_37 
    db $0C,$0C 
    dw $0006,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_2D 
    db $0C,$0C 
    dw $0007,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_38 
    db $10,$10 
    dw $0008,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_2E 
    db $10,$10 
    dw $0009,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_39 
    db $11,$11 
    dw $000A,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_2F 
    db $11,$11 
    dw $000B,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_3A 
    db $14,$14 
    dw $000C,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_30 
    db $14,$14 
    dw $000D,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_3B 
    db $18,$18 
    dw $000E,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_31 
    db $18,$18 
    dw $000F,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_3A 
    db $14,$14 
    dw $0010,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_30 
    db $14,$14 
    dw $0011,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_39 
    db $11,$11 
    dw $0012,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_2F 
    db $11,$11 
    dw $0013,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_38 
    db $10,$10 
    dw $0014,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_2E 
    db $10,$10 
    dw $0015 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Charged_PW_PIW_DownLeft_UpRight_1 

InstList_SamusProjectile_Charged_PW_PIW_Left_Right_0:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_0 
    db $08,$0C 
    dw $0000,$0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_10 
    db $08,$0C 
    dw $0001,$0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1 
    db $08,$0C 
    dw $0002,$0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_11 
    db $08,$0C 
    dw $0003,$0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_2 
    db $18,$0C 
    dw $0004,$0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_12 
    db $18,$0C 
    dw $0005 

InstList_SamusProjectile_Charged_PW_PIW_Left_Right_1:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_5 
    db $1C,$0C 
    dw $0006,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_1E 
    db $1C,$0C 
    dw $0007,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_6 
    db $1C,$0C 
    dw $0008,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_1F 
    db $1C,$0C 
    dw $0009,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_7 
    db $1C,$11 
    dw $000A,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_20 
    db $1C,$11 
    dw $000B,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_8 
    db $1C,$13 
    dw $000C,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_21 
    db $1C,$13 
    dw $000D,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_9 
    db $1C,$14 
    dw $000E,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_22 
    db $1C,$14 
    dw $000F,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_8 
    db $1C,$13 
    dw $0010,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_21 
    db $1C,$13 
    dw $0011,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_7 
    db $1C,$11 
    dw $0012,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_20 
    db $1C,$11 
    dw $0013,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_6 
    db $1C,$0C 
    dw $0014,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_1F 
    db $1C,$0C 
    dw $0015 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Charged_PW_PIW_Left_Right_1 

InstList_SamusProjectile_Charged_PW_PIW_DownRight_UpLeft_0:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_8 
    db $08,$08 
    dw $0000,$0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_18 
    db $08,$08 
    dw $0001,$0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_9 
    db $08,$08 
    dw $0002,$0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_19 
    db $08,$08 
    dw $0003,$0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_A 
    db $0C,$0C 
    dw $0004,$0001 
    dw ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1A 
    db $0C,$0C 
    dw $0005 

InstList_SamusProjectile_Charged_PW_PIW_DownRight_UpLeft_1:
    dw $0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_F 
    db $0C,$0C 
    dw $0006,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_23 
    db $0C,$0C 
    dw $0007,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_10 
    db $10,$10 
    dw $0008,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_24 
    db $10,$10 
    dw $0009,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_11 
    db $11,$11 
    dw $000A,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_25 
    db $11,$11 
    dw $000B,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_12 
    db $14,$14 
    dw $000C,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_26 
    db $14,$14 
    dw $000D,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_13 
    db $18,$18 
    dw $000E,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_27 
    db $18,$18 
    dw $000F,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_12 
    db $14,$14 
    dw $0010,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_26 
    db $14,$14 
    dw $0011,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_11 
    db $11,$11 
    dw $0012,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_25 
    db $11,$11 
    dw $0013,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_10 
    db $10,$10 
    dw $0014,$0001 
    dw ProjectileFlareSpritemaps_Charged_PW_PIW_24 
    db $10,$10 
    dw $0015 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Charged_PW_PIW_DownRight_UpLeft_1 

InstList_SamusProjectile_Missiles_Up:
    dw $000F 
    dw ProjectileFlareSpritemaps_Missile_2 
    db $04,$04 
    dw $0000 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Missiles_Up 

InstList_SamusProjectile_Missiles_UpRight:
    dw $000F 
    dw ProjectileFlareSpritemaps_Missile_3 
    db $04,$04 
    dw $0000 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Missiles_UpRight 

InstList_SamusProjectile_Missiles_Right:
    dw $000F 
    dw ProjectileFlareSpritemaps_Missile_4 
    db $04,$04 
    dw $0000 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Missiles_Right 

InstList_SamusProjectile_Missiles_DownRight:
    dw $000F 
    dw ProjectileFlareSpritemaps_Missile_5 
    db $04,$04 
    dw $0000 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Missiles_DownRight 

InstList_SamusProjectile_Missiles_Down:
    dw $000F 
    dw ProjectileFlareSpritemaps_Missile_6 
    db $04,$04 
    dw $0000 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Missiles_Down 

InstList_SamusProjectile_Missiles_DownLeft:
    dw $000F 
    dw ProjectileFlareSpritemaps_Missile_7 
    db $04,$04 
    dw $0000 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Missiles_DownLeft 

InstList_SamusProjectile_Missiles_Left:
    dw $000F 
    dw ProjectileFlareSpritemaps_Missile_0 
    db $04,$04 
    dw $0000 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Missiles_Left 

InstList_SamusProjectile_Missiles_UpLeft:
    dw $000F 
    dw ProjectileFlareSpritemaps_Missile_1 
    db $04,$04 
    dw $0000 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Missiles_UpLeft 

InstList_SamusProjectile_SuperMissiles_Up:
    dw $000F 
    dw ProjectileFlareSpritemaps_SuperMissile_2 
    db $08,$08 
    dw $0000 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_SuperMissiles_Up 

InstList_SamusProjectile_SuperMissiles_UpRight:
    dw $000F 
    dw ProjectileFlareSpritemaps_SuperMissile_3 
    db $08,$08 
    dw $0000 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_SuperMissiles_UpRight 

InstList_SamusProjectile_SuperMissiles_Right:
    dw $000F 
    dw ProjectileFlareSpritemaps_SuperMissile_4 
    db $08,$08 
    dw $0000 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_SuperMissiles_Right 

InstList_SamusProjectile_SuperMissiles_DownRight:
    dw $000F 
    dw ProjectileFlareSpritemaps_SuperMissile_5 
    db $08,$08 
    dw $0000 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_SuperMissiles_DownRight 

InstList_SamusProjectile_SuperMissiles_Down:
    dw $000F 
    dw ProjectileFlareSpritemaps_SuperMissile_6 
    db $08,$08 
    dw $0000 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_SuperMissiles_Down 

InstList_SamusProjectile_SuperMissiles_DownLeft:
    dw $000F 
    dw ProjectileFlareSpritemaps_SuperMissile_7 
    db $08,$08 
    dw $0000 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_SuperMissiles_DownLeft 

InstList_SamusProjectile_SuperMissiles_Left:
    dw $000F 
    dw ProjectileFlareSpritemaps_SuperMissile_0 
    db $08,$08 
    dw $0000 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_SuperMissiles_Left 

InstList_SamusProjectile_SuperMissiles_UpLeft:
    dw $000F 
    dw ProjectileFlareSpritemaps_SuperMissile_1 
    db $08,$08 
    dw $0000 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_SuperMissiles_UpLeft 

InstList_SamusProjectile_SuperMissileLink_:
    dw $000F 
    dw Spritemap_Nothing_93A117 
    db $08,$08 
    dw $0000 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_SuperMissileLink_ 

InstList_SamusProjectile_PowerBomb:
    dw $0005 
    dw ProjectileFlareSpritemaps_PowerBomb_0 
    db $04,$04 
    dw $0000,$0005 
    dw ProjectileFlareSpritemaps_PowerBomb_1 
    db $04,$04 
    dw $0000,$0005 
    dw ProjectileFlareSpritemaps_PowerBomb_2 
    db $04,$04 
    dw $0000 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_PowerBomb 

InstList_SamusProjectile_PowerBomb_FastAnimation:
    dw $0001 
    dw ProjectileFlareSpritemaps_PowerBomb_0 
    db $04,$04 
    dw $0000,$0001 
    dw ProjectileFlareSpritemaps_PowerBomb_1 
    db $04,$04 
    dw $0000,$0001 
    dw ProjectileFlareSpritemaps_PowerBomb_2 
    db $04,$04 
    dw $0000 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_PowerBomb_FastAnimation 

InstList_SamusProjectile_Bomb:
    dw $0005 
    dw ProjectileFlareSpritemaps_Bomb_0 
    db $04,$04 
    dw $0000,$0005 
    dw ProjectileFlareSpritemaps_Bomb_1 
    db $04,$04 
    dw $0000,$0005 
    dw ProjectileFlareSpritemaps_Bomb_2 
    db $04,$04 
    dw $0000,$0005 
    dw ProjectileFlareSpritemaps_Bomb_3 
    db $04,$04 
    dw $0000 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Bomb 

InstList_SamusProjectile_Bomb_FastAnimation:
    dw $0001 
    dw ProjectileFlareSpritemaps_Bomb_0 
    db $04,$04 
    dw $0000,$0001 
    dw ProjectileFlareSpritemaps_Bomb_1 
    db $04,$04 
    dw $0000,$0001 
    dw ProjectileFlareSpritemaps_Bomb_2 
    db $04,$04 
    dw $0000,$0001 
    dw ProjectileFlareSpritemaps_Bomb_3 
    db $04,$04 
    dw $0000 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_Bomb_FastAnimation 

InstList_SamusProjectile_BeamExplosion:
    dw $0003 
    dw ProjectileFlareSpritemaps_BeamExplosion_0 
    db $00,$00 
    dw $0000,$0003 
    dw ProjectileFlareSpritemaps_BeamExplosion_1 
    db $00,$00 
    dw $0000,$0003 
    dw ProjectileFlareSpritemaps_BeamExplosion_2 
    db $00,$00 
    dw $0000,$0003 
    dw ProjectileFlareSpritemaps_BeamExplosion_3 
    db $00,$00 
    dw $0000,$0003 
    dw ProjectileFlareSpritemaps_BeamExplosion_4 
    db $00,$00 
    dw $0000,$0003 
    dw ProjectileFlareSpritemaps_BeamExplosion_5 
    db $00,$00 
    dw $0000 
    dw Instruction_SamusProjectile_Delete 

InstList_SamusProjectile_MissileExplosion:
    dw $0003 
    dw ProjectileFlareSpritemaps_MissileExplosion_0 
    db $08,$08 
    dw $0000,$0003 
    dw ProjectileFlareSpritemaps_MissileExplosion_1 
    db $08,$08 
    dw $0000,$0003 
    dw ProjectileFlareSpritemaps_MissileExplosion_2 
    db $08,$08 
    dw $0000,$0003 
    dw ProjectileFlareSpritemaps_MissileExplosion_3 
    db $08,$08 
    dw $0000,$0003 
    dw ProjectileFlareSpritemaps_MissileExplosion_4 
    db $08,$08 
    dw $0000,$0003 
    dw ProjectileFlareSpritemaps_MissileExplosion_5 
    db $08,$08 
    dw $0000 
    dw Instruction_SamusProjectile_Delete 

InstList_SamusProjectile_BombExplosion:
    dw $0002 
    dw ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_0 
    db $08,$08 
    dw $0000,$0002 
    dw ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_1 
    db $0C,$0C 
    dw $0000,$0002 
    dw ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_2 
    db $10,$10 
    dw $0000,$0002 
    dw ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_3 
    db $10,$10 
    dw $0000,$0002 
    dw ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_4 
    db $10,$10 
    dw $0000 
    dw Instruction_SamusProjectile_Delete 

InstList_SamusProjectile_PlasmaSBA:
    dw $0002 
    dw ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_0 
    db $08,$08 
    dw $0000,$0002 
    dw ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_1 
    db $0C,$0C 
    dw $0000,$0002 
    dw ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_2 
    db $10,$10 
    dw $0000,$0002 
    dw ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_3 
    db $10,$10 
    dw $0000,$0002 
    dw ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_4 
    db $10,$10 
    dw $0000 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_PlasmaSBA 

InstList_SamusProjectile_SuperMissileExplosion:
    dw $0005 
    dw ProjectileFlareSpritemaps_SuperMissileExplosion_0 
    db $08,$08 
    dw $0000,$0005 
    dw ProjectileFlareSpritemaps_SuperMissileExplosion_1 
    db $0C,$0C 
    dw $0000,$0005 
    dw ProjectileFlareSpritemaps_SuperMissileExplosion_2 
    db $10,$10 
    dw $0000,$0005 
    dw ProjectileFlareSpritemaps_SuperMissileExplosion_3 
    db $10,$10 
    dw $0000,$0005 
    dw ProjectileFlareSpritemaps_SuperMissileExplosion_4 
    db $10,$10 
    dw $0000,$0005 
    dw ProjectileFlareSpritemaps_SuperMissileExplosion_5 
    db $10,$10 
    dw $0000 
    dw Instruction_SamusProjectile_Delete 

UNUSED_InstList_SamusProjectile_Projectile25_93A0F3:
    dw $0002 
    dw Spritemap_Nothing_93A117 
    db $10,$20 
    dw $0000,$0002 
    dw Spritemap_Nothing_93A117 
    db $10,$20 
    dw $0001,$0002 
    dw Spritemap_Nothing_93A117 
    db $10,$20 
    dw $0002,$0002 
    dw Spritemap_Nothing_93A117 
    db $10,$20 
    dw $0003 
    dw Instruction_SamusProjectile_GotoY 
    dw UNUSED_InstList_SamusProjectile_Projectile25_93A0F3 

Spritemap_Nothing_93A117:
    dw $0000 

InstList_SamusProjectile_ShinesparkEcho:
    dw $0002 
    dw Spritemap_Nothing_93A117 
    db $20,$20 
    dw $0000,$0002 
    dw Spritemap_Nothing_93A117 
    db $20,$20 
    dw $0001,$0002 
    dw Spritemap_Nothing_93A117 
    db $20,$20 
    dw $0002,$0002 
    dw Spritemap_Nothing_93A117 
    db $20,$20 
    dw $0003 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_ShinesparkEcho 

InstList_SamusProjectile_SpazerSBATrail_0:
    dw $0002 
    dw Spritemap_Nothing_93A117 
    db $04,$08 
    dw $0000,$0002 
    dw Spritemap_Nothing_93A117 
    db $0C,$08 
    dw $0001 

InstList_SamusProjectile_SpazerSBATrail_1:
    dw $0002 
    dw Spritemap_Nothing_93A117 
    db $14,$08 
    dw $0002 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_SpazerSBATrail_1 

InstList_SamusProjectile_WaveSBA:
    dw $0008 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_0 
    db $04,$04 
    dw $0000,$0008 
    dw ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1 
    db $04,$04 
    dw $0001 
    dw Instruction_SamusProjectile_GotoY 
    dw InstList_SamusProjectile_WaveSBA 

UNUSED_InstList_SamusProjectile_Projectile27_93A16D:
    dw $0003 
    dw ProjectileFlareSpritemaps_BeamExplosion_0 
    db $00,$00 
    dw $0000,$0003 
    dw ProjectileFlareSpritemaps_BeamExplosion_1 
    db $00,$00 
    dw $0000,$0003 
    dw ProjectileFlareSpritemaps_BeamExplosion_2 
    db $00,$00 
    dw $0000,$0003 
    dw ProjectileFlareSpritemaps_BeamExplosion_3 
    db $00,$00 
    dw $0000,$0003 
    dw ProjectileFlareSpritemaps_BeamExplosion_4 
    db $00,$00 
    dw $0000,$0003 
    dw ProjectileFlareSpritemaps_BeamExplosion_5 
    db $00,$00 
    dw $0000 
    dw Instruction_SamusProjectile_GotoY 
    dw UNUSED_InstList_SamusProjectile_Projectile27_93A16D 

FlareSpritemapPointers:
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_0 
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_1 
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_0 
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_1 
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_0 
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_1 
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_0 
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_1 
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_2 
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_1 
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_2 
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_1 
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_2 
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_1 
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_2 
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_1 
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_2 
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_3 
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_2 
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_3 
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_2 
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_3 
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_2 
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_3 
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_2 
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_3 
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_2 
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_3 
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_2 
    dw ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_3 
    dw ProjectileFlareSpritemaps_FlareSlowSparks_FacingRight_0 
    dw ProjectileFlareSpritemaps_FlareSlowSparks_FacingRight_1 
    dw ProjectileFlareSpritemaps_FlareSlowSparks_FacingRight_2 
    dw ProjectileFlareSpritemaps_FlareSlowSparks_FacingRight_3 
    dw ProjectileFlareSpritemaps_FlareSlowSparks_FacingRight_4 
    dw ProjectileFlareSpritemaps_FlareSlowSparks_FacingRight_5 
    dw ProjectileFlareSpritemaps_FlareFastSparks_FacingRight_0 
    dw ProjectileFlareSpritemaps_FlareFastSparks_FacingRight_1 
    dw ProjectileFlareSpritemaps_FlareFastSparks_FacingRight_2 
    dw ProjectileFlareSpritemaps_FlareFastSparks_FacingRight_3 
    dw ProjectileFlareSpritemaps_FlareFastSparks_FacingRight_4 
    dw ProjectileFlareSpritemaps_FlareFastSparks_FacingRight_5 
    dw ProjectileFlareSpritemaps_FlareSlowSparks_FacingLeft_0 
    dw ProjectileFlareSpritemaps_FlareSlowSparks_FacingLeft_1 
    dw ProjectileFlareSpritemaps_FlareSlowSparks_FacingLeft_2 
    dw ProjectileFlareSpritemaps_FlareSlowSparks_FacingLeft_3 
    dw ProjectileFlareSpritemaps_FlareSlowSparks_FacingLeft_4 
    dw ProjectileFlareSpritemaps_FlareSlowSparks_FacingLeft_5 
    dw ProjectileFlareSpritemaps_FlareFastSparks_FacingLeft_0 
    dw ProjectileFlareSpritemaps_FlareFastSparks_FacingLeft_1 
    dw ProjectileFlareSpritemaps_FlareFastSparks_FacingLeft_2 
    dw ProjectileFlareSpritemaps_FlareFastSparks_FacingLeft_3 
    dw ProjectileFlareSpritemaps_FlareFastSparks_FacingLeft_4 
    dw ProjectileFlareSpritemaps_FlareFastSparks_FacingLeft_5 
    dw ProjectileFlareSpritemaps_BeamExplosion_0 
    dw ProjectileFlareSpritemaps_BeamExplosion_1 
    dw ProjectileFlareSpritemaps_BeamExplosion_2 
    dw ProjectileFlareSpritemaps_BeamExplosion_3 
    dw ProjectileFlareSpritemaps_BeamExplosion_4 
    dw ProjectileFlareSpritemaps_BeamExplosion_5 
    dw ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_0 
    dw ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_1 
    dw ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_2 
    dw ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_3 
    dw ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_4 
    dw ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_5 

FlareSpritemapTable_IndexOffsets_facingRight:
    dw $0000,$001E,$0024 

FlareSpritemapTable_IndexOffsets_facingLeft:
    dw $0000,$002A,$0030 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_93A231:
    dw $0001,$01FC 
    db $FC 
    dw $3A2B 

UNUSED_ProjectileFlareSpritemaps_93A238:
    dw $0001,$01FC 
    db $FC 
    dw $3A2A 

UNUSED_ProjectileFlareSpritemaps_93A23F:
    dw $0001,$01FC 
    db $FC 
    dw $3A29 

UNUSED_ProjectileFlareSpritemaps_93A246:
    dw $0001,$01FC 
    db $FC 
    dw $3A28 
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Power_0:
    dw $0001,$01FC 
    db $FC 
    dw $2C30 

ProjectileFlareSpritemaps_Power_1:
    dw $0001,$01FC 
    db $FC 
    dw $2C31 

ProjectileFlareSpritemaps_Power_2:
    dw $0001,$01FC 
    db $FC 
    dw $2C32 

ProjectileFlareSpritemaps_Power_3:
    dw $0001,$01FC 
    db $FC 
    dw $6C31 

ProjectileFlareSpritemaps_Power_4:
    dw $0001,$01FC 
    db $FC 
    dw $EC30 

ProjectileFlareSpritemaps_Power_5:
    dw $0001,$01FC 
    db $FC 
    dw $EC31 

ProjectileFlareSpritemaps_Power_6:
    dw $0001,$01FC 
    db $FC 
    dw $AC32 

ProjectileFlareSpritemaps_Power_7:
    dw $0001,$01FC 
    db $FC 
    dw $AC31 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_93A285:
    dw $0001,$01FC 
    db $FC 
    dw $2C30 

UNUSED_ProjectileFlareSpritemaps_93A28C:
    dw $0001,$01FC 
    db $FC 
    dw $2C31 

UNUSED_ProjectileFlareSpritemaps_93A293:
    dw $0001,$01FC 
    db $FC 
    dw $2C32 

UNUSED_ProjectileFlareSpritemaps_93A29A:
    dw $0001,$01FC 
    db $FC 
    dw $2C32 

UNUSED_ProjectileFlareSpritemaps_93A2A1:
    dw $0001,$01FC 
    db $FC 
    dw $2C30 

UNUSED_ProjectileFlareSpritemaps_93A2A8:
    dw $0001,$01FC 
    db $FC 
    dw $2C31 

UNUSED_ProjectileFlareSpritemaps_93A2AF:
    dw $0001,$01FC 
    db $FC 
    dw $2C32 

UNUSED_ProjectileFlareSpritemaps_93A2B6:
    dw $0001,$01FC 
    db $FC 
    dw $6C31 

UNUSED_ProjectileFlareSpritemaps_93A2BD:
    dw $0001,$01FC 
    db $FC 
    dw $6C30 

UNUSED_ProjectileFlareSpritemaps_93A2C4:
    dw $0001,$01FC 
    db $FC 
    dw $EC31 

UNUSED_ProjectileFlareSpritemaps_93A2CB:
    dw $0001,$01FC 
    db $FC 
    dw $AC32 

UNUSED_ProjectileFlareSpritemaps_93A2D2:
    dw $0001,$01FC 
    db $FC 
    dw $AC31 

UNUSED_ProjectileFlareSpritemaps_93A2D9:
    dw $0002,$0000 
    db $FC 
    dw $2C30,$01F8 
    db $FC 
    dw $2C30 

UNUSED_ProjectileFlareSpritemaps_93A2E5:
    dw $0004,$0006 
    db $00 
    dw $2C32,$01FE 
    db $00 
    dw $2C31,$01FE 
    db $F8 
    dw $2C32,$01F6 
    db $F8 
    dw $2C31 

UNUSED_ProjectileFlareSpritemaps_93A2FB:
    dw $0002,$01FC 
    db $00 
    dw $2C33,$01FC 
    db $F8 
    dw $2C33 

UNUSED_ProjectileFlareSpritemaps_93A307:
    dw $0004,$01F2 
    db $00 
    dw $6C32,$01FA 
    db $00 
    dw $6C31,$01FA 
    db $F8 
    dw $6C32,$0002 
    db $F8 
    dw $6C31 

UNUSED_ProjectileFlareSpritemaps_93A31D:
    dw $0002,$01F8 
    db $FC 
    dw $6C30,$0000 
    db $FC 
    dw $6C30 

UNUSED_ProjectileFlareSpritemaps_93A329:
    dw $0004,$01F2 
    db $F8 
    dw $EC32,$01FA 
    db $F8 
    dw $EC31,$01FA 
    db $00 
    dw $EC32,$0002 
    db $00 
    dw $EC31 

UNUSED_ProjectileFlareSpritemaps_93A33F:
    dw $0002,$01FC 
    db $F8 
    dw $AC33,$01FC 
    db $00 
    dw $AC33 

UNUSED_ProjectileFlareSpritemaps_93A34B:
    dw $0004,$01F2 
    db $00 
    dw $6C32,$01FA 
    db $00 
    dw $6C31,$01FA 
    db $F8 
    dw $6C32,$0002 
    db $F8 
    dw $6C31 

UNUSED_ProjectileFlareSpritemaps_93A361:
    dw $0001,$01FC 
    db $FC 
    dw $2C38 

UNUSED_ProjectileFlareSpritemaps_93A368:
    dw $0001,$01FC 
    db $FC 
    dw $2C39 

UNUSED_ProjectileFlareSpritemaps_93A36F:
    dw $0001,$01FC 
    db $FC 
    dw $2C3A 

UNUSED_ProjectileFlareSpritemaps_93A376:
    dw $0001,$01FC 
    db $FC 
    dw $2C3B 
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Plasma_PlasmaIce_0:
    dw $0004,$0008 
    db $FC 
    dw $2C30,$01F0 
    db $FC 
    dw $2C30,$0000 
    db $FC 
    dw $2C30,$01F8 
    db $FC 
    dw $2C30 

ProjectileFlareSpritemaps_Plasma_PlasmaIce_1:
    dw $0006,$0008 
    db $04 
    dw $2C32,$0000 
    db $04 
    dw $2C31,$0000 
    db $FC 
    dw $2C32,$01F8 
    db $FC 
    dw $2C31,$01F8 
    db $F4 
    dw $2C32,$01F0 
    db $F4 
    dw $2C31 

ProjectileFlareSpritemaps_Plasma_PlasmaIce_2:
    dw $0004,$01FC 
    db $08 
    dw $2C33,$01FC 
    db $00 
    dw $2C33,$01FC 
    db $F8 
    dw $2C33,$01FC 
    db $F0 
    dw $2C33 

ProjectileFlareSpritemaps_Plasma_PlasmaIce_3:
    dw $0006,$01F0 
    db $04 
    dw $6C32,$01F8 
    db $04 
    dw $6C31,$01F8 
    db $FC 
    dw $6C32,$0000 
    db $FC 
    dw $6C31,$0000 
    db $F4 
    dw $6C32,$0008 
    db $F4 
    dw $6C31 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_93A3E9:
    dw $0004,$0008 
    db $FC 
    dw $2C30,$01F0 
    db $FC 
    dw $2C30,$0000 
    db $FC 
    dw $2C30,$01F8 
    db $FC 
    dw $2C30 

UNUSED_ProjectileFlareSpritemaps_93A3FF:
    dw $0006,$000A 
    db $04 
    dw $2C32,$0002 
    db $04 
    dw $2C31,$0002 
    db $FC 
    dw $2C32,$01FA 
    db $FC 
    dw $2C31,$01FA 
    db $F4 
    dw $2C32,$01F2 
    db $F4 
    dw $2C31 

UNUSED_ProjectileFlareSpritemaps_93A41F:
    dw $0004,$01FC 
    db $08 
    dw $2C33,$01FC 
    db $F0 
    dw $2C33,$01FC 
    db $00 
    dw $2C33,$01FC 
    db $F8 
    dw $2C33 

UNUSED_ProjectileFlareSpritemaps_93A435:
    dw $0006,$01EE 
    db $04 
    dw $6C32,$01F6 
    db $04 
    dw $6C31,$01F6 
    db $FC 
    dw $6C32,$01FE 
    db $FC 
    dw $6C31,$01FE 
    db $F4 
    dw $6C32,$0006 
    db $F4 
    dw $6C31 

UNUSED_ProjectileFlareSpritemaps_93A455:
    dw $0004,$01F0 
    db $FC 
    dw $6C30,$0008 
    db $FC 
    dw $6C30,$01F8 
    db $FC 
    dw $6C30,$0000 
    db $FC 
    dw $6C30 

UNUSED_ProjectileFlareSpritemaps_93A46B:
    dw $0006,$01EE 
    db $F4 
    dw $EC32,$01F6 
    db $F4 
    dw $EC31,$01F6 
    db $FC 
    dw $EC32,$01FE 
    db $FC 
    dw $EC31,$01FE 
    db $04 
    dw $EC32,$0006 
    db $04 
    dw $EC31 

UNUSED_ProjectileFlareSpritemaps_93A48B:
    dw $0004,$01FC 
    db $F0 
    dw $AC33,$01FC 
    db $08 
    dw $AC33,$01FC 
    db $F8 
    dw $AC33,$01FC 
    db $00 
    dw $AC33 

UNUSED_ProjectileFlareSpritemaps_93A4A1:
    dw $0006,$000A 
    db $F4 
    dw $AC32,$0002 
    db $F4 
    dw $AC31,$0002 
    db $FC 
    dw $AC32,$01FA 
    db $FC 
    dw $AC31,$01FA 
    db $04 
    dw $AC32,$01F2 
    db $04 
    dw $AC31 

UNUSED_ProjectileFlareSpritemaps_93A4C1:
    dw $0007,$0014 
    db $FC 
    dw $2C30,$01E4 
    db $FC 
    dw $2C30,$01EC 
    db $FC 
    dw $2C30,$000C 
    db $FC 
    dw $2C30,$0004 
    db $FC 
    dw $2C30,$01FC 
    db $FC 
    dw $2C30,$01F4 
    db $FC 
    dw $2C30 

UNUSED_ProjectileFlareSpritemaps_93A4E6:
    dw $000A,$0010 
    db $0C 
    dw $2C32,$0008 
    db $0C 
    dw $2C31,$0008 
    db $04 
    dw $2C32,$0000 
    db $04 
    dw $2C31,$0000 
    db $FC 
    dw $2C32,$01F8 
    db $FC 
    dw $2C31,$01F8 
    db $F4 
    dw $2C32,$01F0 
    db $F4 
    dw $2C31,$01F0 
    db $EC 
    dw $2C32,$01E8 
    db $EC 
    dw $2C31 

UNUSED_ProjectileFlareSpritemaps_93A51A:
    dw $0007,$01FC 
    db $14 
    dw $2C33,$01FC 
    db $0C 
    dw $2C33,$01FC 
    db $04 
    dw $2C33,$01FC 
    db $FC 
    dw $2C33,$01FC 
    db $F4 
    dw $2C33,$01FC 
    db $EC 
    dw $2C33,$01FC 
    db $E4 
    dw $2C33 

UNUSED_ProjectileFlareSpritemaps_93A53F:
    dw $000A,$0008 
    db $EC 
    dw $6C32,$0010 
    db $EC 
    dw $6C31,$01E8 
    db $0C 
    dw $6C32,$01F0 
    db $0C 
    dw $6C31,$01F0 
    db $04 
    dw $6C32,$01F8 
    db $04 
    dw $6C31,$01F8 
    db $FC 
    dw $6C32,$0000 
    db $FC 
    dw $6C31,$0000 
    db $F4 
    dw $6C32,$0008 
    db $F4 
    dw $6C31 

UNUSED_ProjectileFlareSpritemaps_93A573:
    dw $0007,$0014 
    db $FC 
    dw $2C34,$01E4 
    db $FC 
    dw $2C34,$000C 
    db $FC 
    dw $2C34,$01EC 
    db $FC 
    dw $2C34,$0004 
    db $FC 
    dw $2C34,$01FC 
    db $FC 
    dw $2C34,$01F4 
    db $FC 
    dw $2C34 

UNUSED_ProjectileFlareSpritemaps_93A598:
    dw $000A,$0010 
    db $0C 
    dw $2C36,$0008 
    db $0C 
    dw $2C35,$01F0 
    db $EC 
    dw $2C36,$01E8 
    db $EC 
    dw $2C35,$01F8 
    db $F4 
    dw $2C36,$01F0 
    db $F4 
    dw $2C35,$0008 
    db $04 
    dw $2C36,$0000 
    db $04 
    dw $2C35,$0000 
    db $FC 
    dw $2C36,$01F8 
    db $FC 
    dw $2C35 

UNUSED_ProjectileFlareSpritemaps_93A5CC:
    dw $0007,$01FC 
    db $14 
    dw $2C37,$01FC 
    db $0C 
    dw $2C37,$01FC 
    db $E4 
    dw $2C37,$01FC 
    db $04 
    dw $2C37,$01FC 
    db $FC 
    dw $2C37,$01FC 
    db $F4 
    dw $2C37,$01FC 
    db $EC 
    dw $2C37 

UNUSED_ProjectileFlareSpritemaps_93A5F1:
    dw $000A,$01E8 
    db $0C 
    dw $6C36,$01F0 
    db $0C 
    dw $6C35,$01F0 
    db $04 
    dw $6C36,$01F8 
    db $04 
    dw $6C35,$0008 
    db $EC 
    dw $6C36,$0010 
    db $EC 
    dw $6C35,$01F8 
    db $FC 
    dw $6C36,$0000 
    db $FC 
    dw $6C35,$0000 
    db $F4 
    dw $6C36,$0008 
    db $F4 
    dw $6C35 

UNUSED_ProjectileFlareSpritemaps_93A625:
    dw $0004,$0008 
    db $FC 
    dw $2C34,$0000 
    db $FC 
    dw $2C34,$01F8 
    db $FC 
    dw $2C34,$01F0 
    db $FC 
    dw $2C34 

UNUSED_ProjectileFlareSpritemaps_93A63B:
    dw $0006,$0008 
    db $04 
    dw $2C36,$0000 
    db $04 
    dw $2C35,$0000 
    db $FC 
    dw $2C36,$01F8 
    db $FC 
    dw $2C35,$01F8 
    db $F4 
    dw $2C36,$01F0 
    db $F4 
    dw $2C35 

UNUSED_ProjectileFlareSpritemaps_93A65B:
    dw $0004,$01FC 
    db $08 
    dw $2C37,$01FC 
    db $00 
    dw $2C37,$01FC 
    db $F8 
    dw $2C37,$01FC 
    db $F0 
    dw $2C37 

UNUSED_ProjectileFlareSpritemaps_93A671:
    dw $0006,$01F0 
    db $04 
    dw $6C36,$01F8 
    db $04 
    dw $6C35,$01F8 
    db $FC 
    dw $6C36,$0000 
    db $FC 
    dw $6C35,$0000 
    db $F4 
    dw $6C36,$0008 
    db $F4 
    dw $6C35 

UNUSED_ProjectileFlareSpritemaps_93A691:
    dw $0004,$0000 
    db $00 
    dw $EC34,$01F8 
    db $00 
    dw $AC34,$0000 
    db $F8 
    dw $6C34,$01F8 
    db $F8 
    dw $2C34 

UNUSED_ProjectileFlareSpritemaps_93A6A7:
    dw $0004,$0000 
    db $00 
    dw $EC33,$01F8 
    db $00 
    dw $AC33,$0000 
    db $F8 
    dw $6C33,$01F8 
    db $F8 
    dw $2C33 

UNUSED_ProjectileFlareSpritemaps_93A6BD:
    dw $0001,$01FC 
    db $FC 
    dw $2C35 

UNUSED_ProjectileFlareSpritemaps_93A6C4:
    dw $0001,$01FC 
    db $FC 
    dw $2C36 

UNUSED_ProjectileFlareSpritemaps_93A6CB:
    dw $0001,$01FC 
    db $FC 
    dw $2C37 

UNUSED_ProjectileFlareSpritemaps_93A6D2:
    dw $0001,$01FC 
    db $FC 
    dw $3C53 

UNUSED_ProjectileFlareSpritemaps_93A6D9:
    dw $0001,$01FC 
    db $FC 
    dw $3C52 

UNUSED_ProjectileFlareSpritemaps_93A6E0:
    dw $0001,$01FC 
    db $FC 
    dw $3C51 

UNUSED_ProjectileFlareSpritemaps_93A6E7:
    dw $0004,$01F8 
    db $00 
    dw $BC50,$0000 
    db $00 
    dw $FC50,$0000 
    db $F8 
    dw $7C50,$01F8 
    db $F8 
    dw $3C50 
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_FlareSlowSparks_FacingRight_0:
    dw $0003,$0000 
    db $0C 
    dw $2A5B,$0008 
    db $EC 
    dw $2A5B,$01F0 
    db $F4 
    dw $2A5B 

ProjectileFlareSpritemaps_FlareSlowSparks_FacingRight_1:
    dw $0003,$01FD 
    db $0A 
    dw $2A5C,$0006 
    db $EE 
    dw $2A5C,$01F2 
    db $F6 
    dw $2A5C 

ProjectileFlareSpritemaps_FlareSlowSparks_FacingRight_2:
    dw $0003,$01FC 
    db $08 
    dw $2A5C,$0004 
    db $F0 
    dw $2A5C,$01F4 
    db $F8 
    dw $2A5C 

ProjectileFlareSpritemaps_FlareSlowSparks_FacingRight_3:
    dw $0003,$0002 
    db $F2 
    dw $2A5D,$01FB 
    db $06 
    dw $2A5D,$01F6 
    db $FA 
    dw $2A5D 

ProjectileFlareSpritemaps_FlareSlowSparks_FacingRight_4:
    dw $0003,$01FB 
    db $04 
    dw $2A5D,$01F8 
    db $FB 
    dw $2A5D,$0000 
    db $F4 
    dw $2A5D 

ProjectileFlareSpritemaps_FlareSlowSparks_FacingRight_5:
    dw $0003,$01FB 
    db $02 
    dw $2A5D,$01FA 
    db $FA 
    dw $2A5D,$0000 
    db $F6 
    dw $2A5D 

ProjectileFlareSpritemaps_FlareFastSparks_FacingRight_0:
    dw $0003,$0000 
    db $EC 
    dw $AA5B,$0008 
    db $0C 
    dw $AA5B,$01F0 
    db $04 
    dw $AA5B 

ProjectileFlareSpritemaps_FlareFastSparks_FacingRight_1:
    dw $0003,$01FE 
    db $EE 
    dw $AA5C,$0006 
    db $0A 
    dw $AA5C,$01F2 
    db $02 
    dw $AA5C 

ProjectileFlareSpritemaps_FlareFastSparks_FacingRight_2:
    dw $0003,$0004 
    db $08 
    dw $AA5C,$01F4 
    db $00 
    dw $AA5C,$01FD 
    db $F0 
    dw $AA5C 

ProjectileFlareSpritemaps_FlareFastSparks_FacingRight_3:
    dw $0003,$0002 
    db $06 
    dw $AA5D,$01FC 
    db $F2 
    dw $AA5D,$01F6 
    db $FE 
    dw $AA5D 

ProjectileFlareSpritemaps_FlareFastSparks_FacingRight_4:
    dw $0003,$01FC 
    db $F4 
    dw $AA5D,$01F8 
    db $FC 
    dw $AA5D,$0000 
    db $04 
    dw $AA5D 

ProjectileFlareSpritemaps_FlareFastSparks_FacingRight_5:
    dw $0003,$01FC 
    db $F6 
    dw $AA5D,$01FA 
    db $FD 
    dw $AA5D,$0000 
    db $02 
    dw $AA5D 

ProjectileFlareSpritemaps_MissileExplosion_0:
    dw $0001,$01FC 
    db $FC 
    dw $3A5F 

ProjectileFlareSpritemaps_MissileExplosion_1:
    dw $0004,$0000 
    db $00 
    dw $FA8A,$01F8 
    db $00 
    dw $BA8A,$0000 
    db $F8 
    dw $7A8A,$01F8 
    db $F8 
    dw $3A8A 

ProjectileFlareSpritemaps_MissileExplosion_2:
    dw $0004,$C200 
    db $00 
    dw $FA90,$C3F0 
    db $00 
    dw $BA90,$C200 
    db $F0 
    dw $7A90,$C3F0 
    db $F0 
    dw $3A90 

ProjectileFlareSpritemaps_MissileExplosion_3:
    dw $0004,$C200 
    db $00 
    dw $FA92,$C3F0 
    db $00 
    dw $BA92,$C200 
    db $F0 
    dw $7A92,$C3F0 
    db $F0 
    dw $3A92 

ProjectileFlareSpritemaps_MissileExplosion_4:
    dw $0004,$C200 
    db $00 
    dw $FA94,$C3F0 
    db $00 
    dw $BA94,$C200 
    db $F0 
    dw $7A94,$C3F0 
    db $F0 
    dw $3A94 

ProjectileFlareSpritemaps_MissileExplosion_5:
    dw $0004,$C200 
    db $00 
    dw $FA96,$C3F0 
    db $00 
    dw $BA96,$C200 
    db $F0 
    dw $7A96,$C3F0 
    db $F0 
    dw $3A96 

ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_0:
    dw $0004,$0000 
    db $00 
    dw $FA8B,$01F8 
    db $00 
    dw $BA8B,$0000 
    db $F8 
    dw $7A8B,$01F8 
    db $F8 
    dw $3A8B 

ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_1:
    dw $0004,$0000 
    db $00 
    dw $FA7A,$01F8 
    db $00 
    dw $BA7A,$0000 
    db $F8 
    dw $7A7A,$01F8 
    db $F8 
    dw $3A7A 

ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_2:
    dw $0004,$C200 
    db $00 
    dw $FA70,$C3F0 
    db $00 
    dw $BA70,$C200 
    db $F0 
    dw $7A70,$C3F0 
    db $F0 
    dw $3A70 

ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_3:
    dw $0004,$C200 
    db $00 
    dw $FA72,$C3F0 
    db $00 
    dw $BA72,$C200 
    db $F0 
    dw $7A72,$C3F0 
    db $F0 
    dw $3A72 

ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_4:
    dw $0004,$C200 
    db $00 
    dw $FA74,$C3F0 
    db $00 
    dw $BA74,$C200 
    db $F0 
    dw $7A74,$C3F0 
    db $F0 
    dw $3A74 

ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_5:
    dw $0004,$01F8 
    db $00 
    dw $3A5E,$0000 
    db $00 
    dw $3A5E,$0000 
    db $F8 
    dw $3A5E,$01F8 
    db $F8 
    dw $3A5E 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_93A8C2:
    dw $0001,$01FC 
    db $FC 
    dw $3C38 

UNUSED_ProjectileFlareSpritemaps_93A8C9:
    dw $0001,$01FC 
    db $FC 
    dw $3C39 

UNUSED_ProjectileFlareSpritemaps_93A8D0:
    dw $0001,$01FC 
    db $FC 
    dw $3C3A 

UNUSED_ProjectileFlareSpritemaps_93A8D7:
    dw $0001,$01FC 
    db $FC 
    dw $3C3B 
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_FlareSlowSparks_FacingLeft_0:
    dw $0003,$01F8 
    db $0C 
    dw $6C5B,$01F0 
    db $EC 
    dw $6C5B,$0008 
    db $F4 
    dw $6C5B 

ProjectileFlareSpritemaps_FlareSlowSparks_FacingLeft_1:
    dw $0003,$01FB 
    db $0A 
    dw $6C5C,$01F2 
    db $EE 
    dw $6C5C,$0006 
    db $F6 
    dw $6C5C 

ProjectileFlareSpritemaps_FlareSlowSparks_FacingLeft_2:
    dw $0003,$01FC 
    db $08 
    dw $6C5C,$01F4 
    db $F0 
    dw $6C5C,$0004 
    db $F8 
    dw $6C5C 

ProjectileFlareSpritemaps_FlareSlowSparks_FacingLeft_3:
    dw $0003,$01F6 
    db $F2 
    dw $6C5D,$01FD 
    db $06 
    dw $6C5D,$0002 
    db $FA 
    dw $6C5D 

ProjectileFlareSpritemaps_FlareSlowSparks_FacingLeft_4:
    dw $0003,$01FD 
    db $04 
    dw $6C5D,$0000 
    db $FB 
    dw $6C5D,$01F8 
    db $F4 
    dw $6C5D 

ProjectileFlareSpritemaps_FlareSlowSparks_FacingLeft_5:
    dw $0003,$01FD 
    db $02 
    dw $6C5D,$01FE 
    db $FA 
    dw $6C5D,$01F8 
    db $F6 
    dw $6C5D 

ProjectileFlareSpritemaps_FlareFastSparks_FacingLeft_0:
    dw $0003,$01F8 
    db $EC 
    dw $EC5B,$01F0 
    db $0C 
    dw $EC5B,$0008 
    db $04 
    dw $EC5B 

ProjectileFlareSpritemaps_FlareFastSparks_FacingLeft_1:
    dw $0003,$01FA 
    db $EE 
    dw $EC5C,$01F2 
    db $0A 
    dw $EC5C,$0006 
    db $02 
    dw $EC5C 

ProjectileFlareSpritemaps_FlareFastSparks_FacingLeft_2:
    dw $0003,$01F4 
    db $08 
    dw $EC5C,$0004 
    db $00 
    dw $EC5C,$01FB 
    db $F0 
    dw $EC5C 

ProjectileFlareSpritemaps_FlareFastSparks_FacingLeft_3:
    dw $0003,$01F6 
    db $06 
    dw $EC5D,$01FC 
    db $F2 
    dw $EC5D,$0002 
    db $FE 
    dw $EC5D 

ProjectileFlareSpritemaps_FlareFastSparks_FacingLeft_4:
    dw $0003,$01FC 
    db $F4 
    dw $EC5D,$0000 
    db $FC 
    dw $EC5D,$01F8 
    db $04 
    dw $EC5D 

ProjectileFlareSpritemaps_FlareFastSparks_FacingLeft_5:
    dw $0003,$01FC 
    db $F6 
    dw $EC5D,$01FE 
    db $FD 
    dw $EC5D,$01F8 
    db $02 
    dw $EC5D 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_93A9AA:
    dw $0001,$01F7 
    db $F7 
    dw $3A48 

UNUSED_ProjectileFlareSpritemaps_93A9B1:
    dw $0002,$0001 
    db $01 
    dw $3A48,$C3F3 
    db $F3 
    dw $3A7C 

UNUSED_ProjectileFlareSpritemaps_93A9BD:
    dw $0003,$C3FD 
    db $FD 
    dw $3A7C,$01F7 
    db $01 
    dw $3A48,$C3F3 
    db $F3 
    dw $3A7E 

UNUSED_ProjectileFlareSpritemaps_93A9CE:
    dw $0004,$0001 
    db $F7 
    dw $3A48,$C3FD 
    db $FD 
    dw $3A7E,$C3F3 
    db $FD 
    dw $3A7C,$C3F3 
    db $F3 
    dw $3A9A 

UNUSED_ProjectileFlareSpritemaps_93A9E4:
    dw $0004,$C3FD 
    db $F3 
    dw $3A7C,$C3FD 
    db $FD 
    dw $3A9A,$C3F3 
    db $FD 
    dw $3A7E,$C3F3 
    db $F3 
    dw $3A9C 

UNUSED_ProjectileFlareSpritemaps_93A9FA:
    dw $0003,$C3FD 
    db $F3 
    dw $3A7E,$C3FD 
    db $FD 
    dw $3A9C,$C3F3 
    db $FD 
    dw $3A9A 

UNUSED_ProjectileFlareSpritemaps_93AA0B:
    dw $0002,$C3FD 
    db $F3 
    dw $3A9A,$C3F3 
    db $FD 
    dw $3A9C 

UNUSED_ProjectileFlareSpritemaps_93AA17:
    dw $0001,$C3FD 
    db $F3 
    dw $3A9C 

UNUSED_ProjectileFlareSpritemaps_93AA1E:
    dw $0001,$01FC 
    db $FC 
    dw $3C5E 

UNUSED_ProjectileFlareSpritemaps_93AA25:
    dw $0001,$01FC 
    db $FC 
    dw $3C5F 

UNUSED_ProjectileFlareSpritemaps_93AA2C:
    dw $0004,$0000 
    db $00 
    dw $FC60,$0000 
    db $F8 
    dw $7C60,$01F8 
    db $00 
    dw $BC60,$01F8 
    db $F8 
    dw $3C60 

UNUSED_ProjectileFlareSpritemaps_93AA42:
    dw $0004,$0000 
    db $00 
    dw $FC61,$0000 
    db $F8 
    dw $7C61,$01F8 
    db $00 
    dw $BC61,$01F8 
    db $F8 
    dw $3C61 

UNUSED_ProjectileFlareSpritemaps_93AA58:
    dw $0004,$0000 
    db $00 
    dw $FC62,$0000 
    db $F8 
    dw $7C62,$01F8 
    db $00 
    dw $BC62,$01F8 
    db $F8 
    dw $3C62 

UNUSED_ProjectileFlareSpritemaps_93AA6E:
    dw $0004,$0000 
    db $00 
    dw $FC63,$0000 
    db $F8 
    dw $7C63,$01F8 
    db $00 
    dw $BC63,$01F8 
    db $F8 
    dw $3C63 
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_SuperMissileExplosion_0:
    dw $0004,$0000 
    db $00 
    dw $FA8A,$01F8 
    db $00 
    dw $BA8A,$0000 
    db $F8 
    dw $7A8A,$01F8 
    db $F8 
    dw $3A8A 

ProjectileFlareSpritemaps_SuperMissileExplosion_1:
    dw $0004,$C200 
    db $00 
    dw $FA90,$C200 
    db $F0 
    dw $7A90,$C3F0 
    db $00 
    dw $BA90,$C3F0 
    db $F0 
    dw $3A90 

ProjectileFlareSpritemaps_SuperMissileExplosion_2:
    dw $0004,$C200 
    db $00 
    dw $FA92,$C3F0 
    db $00 
    dw $BA92,$C200 
    db $F0 
    dw $7A92,$C3F0 
    db $F0 
    dw $3A92 

ProjectileFlareSpritemaps_SuperMissileExplosion_3:
    dw $000C,$0010 
    db $00 
    dw $FAC2,$0010 
    db $F8 
    dw $7AC2,$0000 
    db $10 
    dw $FAB2,$01F8 
    db $10 
    dw $BAB2,$01E8 
    db $00 
    dw $BAC2,$01E8 
    db $F8 
    dw $3AC2,$0000 
    db $E8 
    dw $7AB2,$01F8 
    db $E8 
    dw $3AB2,$C200 
    db $00 
    dw $FAB0,$C200 
    db $F0 
    dw $7AB0,$C3F0 
    db $00 
    dw $BAB0,$C3F0 
    db $F0 
    dw $3AB0 

ProjectileFlareSpritemaps_SuperMissileExplosion_4:
    dw $0008,$C208 
    db $00 
    dw $FAB5,$C200 
    db $08 
    dw $FAB3,$C3E8 
    db $00 
    dw $BAB5,$C3F0 
    db $08 
    dw $BAB3,$C208 
    db $F0 
    dw $7AB5,$C200 
    db $E8 
    dw $7AB3,$C3E8 
    db $F0 
    dw $3AB5,$C3F0 
    db $E8 
    dw $3AB3 

ProjectileFlareSpritemaps_SuperMissileExplosion_5:
    dw $000C,$0000 
    db $10 
    dw $FABB,$01F8 
    db $10 
    dw $BABB,$0000 
    db $E8 
    dw $7ABB,$01F8 
    db $E8 
    dw $3ABB,$0010 
    db $00 
    dw $FAB7,$0010 
    db $F8 
    dw $7AB7,$01E8 
    db $00 
    dw $BAB7,$01E8 
    db $F8 
    dw $3AB7,$C208 
    db $08 
    dw $FAB8,$C3E8 
    db $08 
    dw $BAB8,$C208 
    db $E8 
    dw $7AB8,$C3E8 
    db $E8 
    dw $3AB8 

ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_0:
    dw $0001,$01FC 
    db $FC 
    dw $2C53 

ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_1:
    dw $0001,$01FC 
    db $FC 
    dw $2C52 

ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_2:
    dw $0001,$01FC 
    db $FC 
    dw $2C51 

ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_3:
    dw $0004,$01F8 
    db $00 
    dw $AC50,$0000 
    db $00 
    dw $EC50,$0000 
    db $F8 
    dw $6C50,$01F8 
    db $F8 
    dw $2C50 

ProjectileFlareSpritemaps_PowerBomb_0:
    dw $0001,$01FC 
    db $FC 
    dw $3A26 

ProjectileFlareSpritemaps_PowerBomb_1:
    dw $0001,$01FC 
    db $FC 
    dw $3A27 

ProjectileFlareSpritemaps_PowerBomb_2:
    dw $0001,$01FC 
    db $FC 
    dw $3A7B 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_93ABAC:
    dw $0001,$01FC 
    db $FC 
    dw $3A5F 
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_BeamExplosion_0:
    dw $0001,$01FC 
    db $FC 
    dw $3C53 

ProjectileFlareSpritemaps_BeamExplosion_1:
    dw $0001,$01FC 
    db $FC 
    dw $3C51 

ProjectileFlareSpritemaps_BeamExplosion_2:
    dw $0004,$0000 
    db $00 
    dw $FC60,$0000 
    db $F8 
    dw $7C60,$01F8 
    db $00 
    dw $BC60,$01F8 
    db $F8 
    dw $3C60 

ProjectileFlareSpritemaps_BeamExplosion_3:
    dw $0004,$0000 
    db $00 
    dw $FC61,$0000 
    db $F8 
    dw $7C61,$01F8 
    db $00 
    dw $BC61,$01F8 
    db $F8 
    dw $3C61 

ProjectileFlareSpritemaps_BeamExplosion_4:
    dw $0004,$0000 
    db $00 
    dw $FC62,$0000 
    db $F8 
    dw $7C62,$01F8 
    db $00 
    dw $BC62,$01F8 
    db $F8 
    dw $3C62 

ProjectileFlareSpritemaps_BeamExplosion_5:
    dw $0004,$0000 
    db $00 
    dw $FC63,$0000 
    db $F8 
    dw $7C63,$01F8 
    db $00 
    dw $BC63,$01F8 
    db $F8 
    dw $3C63 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_93AC19:
    dw $0004,$01F2 
    db $FC 
    dw $7A6C,$0006 
    db $FC 
    dw $7A6C,$0000 
    db $FC 
    dw $7A6C,$01F8 
    db $FC 
    dw $3A6C 

UNUSED_ProjectileFlareSpritemaps_93AC2F:
    dw $0004,$0000 
    db $FC 
    dw $7A6E,$0008 
    db $FC 
    dw $7A6D,$01F8 
    db $FC 
    dw $3A6E,$01F0 
    db $FC 
    dw $3A6D 

UNUSED_ProjectileFlareSpritemaps_93AC45:
    dw $0004,$01F0 
    db $FE 
    dw $3A6F,$0008 
    db $FE 
    dw $3A6F,$0000 
    db $FE 
    dw $3A6F,$01F8 
    db $FE 
    dw $3A6F 

UNUSED_ProjectileFlareSpritemaps_93AC5B:
    dw $0001,$C3F8 
    db $F8 
    dw $3A7C 

UNUSED_ProjectileFlareSpritemaps_93AC62:
    dw $0001,$C3F8 
    db $F6 
    dw $3A7E 

UNUSED_ProjectileFlareSpritemaps_93AC69:
    dw $0001,$C3F8 
    db $F4 
    dw $3A9A 

UNUSED_ProjectileFlareSpritemaps_93AC70:
    dw $0001,$C3F8 
    db $F2 
    dw $3A9C 

UNUSED_ProjectileFlareSpritemaps_93AC77:
    dw $0001,$01FC 
    db $FC 
    dw $2A48 

UNUSED_ProjectileFlareSpritemaps_93AC7E:
    dw $0001,$01FC 
    db $FA 
    dw $2A49 

UNUSED_ProjectileFlareSpritemaps_93AC85:
    dw $0001,$01FC 
    db $F8 
    dw $2A4A 

UNUSED_ProjectileFlareSpritemaps_93AC8C:
    dw $0001,$01FC 
    db $F6 
    dw $2A4B 

UNUSED_ProjectileFlareSpritemaps_93AC93:
    dw $0001,$01FC 
    db $FC 
    dw $3A2C 

UNUSED_ProjectileFlareSpritemaps_93AC9A:
    dw $0001,$01FC 
    db $FC 
    dw $3A2D 

UNUSED_ProjectileFlareSpritemaps_93ACA1:
    dw $0001,$01FC 
    db $FC 
    dw $3A2E 

UNUSED_ProjectileFlareSpritemaps_93ACA8:
    dw $0001,$01FC 
    db $FC 
    dw $3A2F 

UNUSED_ProjectileFlareSpritemaps_93ACAF:
    dw $0001,$C3F8 
    db $F6 
    dw $3A76 

UNUSED_ProjectileFlareSpritemaps_93ACB6:
    dw $0001,$C3F8 
    db $F4 
    dw $3A78 

UNUSED_ProjectileFlareSpritemaps_93ACBD:
    dw $0001,$C3F8 
    db $F2 
    dw $3A98 

UNUSED_ProjectileFlareSpritemaps_93ACC4:
    dw $0001,$C3F8 
    db $F0 
    dw $3A9E 

UNUSED_ProjectileFlareSpritemaps_93ACCB:
    dw $0001,$01FC 
    db $FC 
    dw $3A25 

UNUSED_ProjectileFlareSpritemaps_93ACD2:
    dw $0001,$01FC 
    db $FC 
    dw $3A43 

UNUSED_ProjectileFlareSpritemaps_93ACD9:
    dw $0001,$01FC 
    db $FC 
    dw $3A40 

UNUSED_ProjectileFlareSpritemaps_93ACE0:
    dw $0001,$01FC 
    db $FC 
    dw $3A3E 

UNUSED_ProjectileFlareSpritemaps_93ACE7:
    dw $0001,$01FC 
    db $FC 
    dw $3A3D 

UNUSED_ProjectileFlareSpritemaps_93ACEE:
    dw $0001,$01FC 
    db $FC 
    dw $3A41 

UNUSED_ProjectileFlareSpritemaps_93ACF5:
    dw $0001,$01FC 
    db $FC 
    dw $3A42 

UNUSED_ProjectileFlareSpritemaps_93ACFC:
    dw $0004,$0000 
    db $00 
    dw $FA44,$01F8 
    db $00 
    dw $BA44,$0000 
    db $F8 
    dw $7A44,$01F8 
    db $F8 
    dw $3A44 

UNUSED_ProjectileFlareSpritemaps_93AC12:
    dw $0004,$0000 
    db $00 
    dw $FA45,$0000 
    db $F8 
    dw $7A45,$01F8 
    db $00 
    dw $BA45,$01F8 
    db $F8 
    dw $3A45 

UNUSED_ProjectileFlareSpritemaps_93AC28:
    dw $0004,$01F8 
    db $00 
    dw $BA46,$0000 
    db $00 
    dw $FA46,$0000 
    db $F8 
    dw $7A46,$01F8 
    db $F8 
    dw $3A46 

UNUSED_ProjectileFlareSpritemaps_93AC3E:
    dw $0001,$01FC 
    db $FC 
    dw $3A42 
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Bomb_0:
    dw $0001,$01FC 
    db $FC 
    dw $3A4C 

ProjectileFlareSpritemaps_Bomb_1:
    dw $0001,$01FC 
    db $FC 
    dw $3A4D 

ProjectileFlareSpritemaps_Bomb_2:
    dw $0001,$01FC 
    db $FC 
    dw $3A4E 

ProjectileFlareSpritemaps_Bomb_3:
    dw $0001,$01FC 
    db $FC 
    dw $3A4F 

ProjectileFlareSpritemaps_Missile_0:
    dw $0002,$01FF 
    db $FC 
    dw $2A55,$01F7 
    db $FC 
    dw $2A54 

ProjectileFlareSpritemaps_Missile_1:
    dw $0003,$01F8 
    db $F5 
    dw $2A56,$0000 
    db $FD 
    dw $2A58,$01F8 
    db $FD 
    dw $2A57 

ProjectileFlareSpritemaps_Missile_2:
    dw $0002,$01FC 
    db $F7 
    dw $2A59,$01FC 
    db $FF 
    dw $2A5A 

ProjectileFlareSpritemaps_Missile_3:
    dw $0003,$0000 
    db $F5 
    dw $6A56,$01F8 
    db $FD 
    dw $6A58,$0000 
    db $FD 
    dw $6A57 

ProjectileFlareSpritemaps_Missile_4:
    dw $0002,$01F9 
    db $FC 
    dw $6A55,$0001 
    db $FC 
    dw $6A54 

ProjectileFlareSpritemaps_Missile_5:
    dw $0003,$0000 
    db $03 
    dw $EA56,$01F8 
    db $FB 
    dw $EA58,$0000 
    db $FB 
    dw $EA57 

ProjectileFlareSpritemaps_Missile_6:
    dw $0002,$01FD 
    db $01 
    dw $AA59,$01FD 
    db $F9 
    dw $AA5A 

ProjectileFlareSpritemaps_Missile_7:
    dw $0003,$01F8 
    db $03 
    dw $AA56,$0000 
    db $FB 
    dw $AA58,$01F8 
    db $FB 
    dw $AA57 

ProjectileFlareSpritemaps_SuperMissile_0:
    dw $0002,$0000 
    db $FC 
    dw $2A65,$01F8 
    db $FC 
    dw $2A64 

ProjectileFlareSpritemaps_SuperMissile_1:
    dw $0003,$0002 
    db $FE 
    dw $2A68,$01FA 
    db $FE 
    dw $2A67,$01FA 
    db $F6 
    dw $2A66 

ProjectileFlareSpritemaps_SuperMissile_2:
    dw $0002,$01FC 
    db $F8 
    dw $2A69,$01FC 
    db $00 
    dw $2A6A 

ProjectileFlareSpritemaps_SuperMissile_3:
    dw $0003,$01F6 
    db $FE 
    dw $6A68,$01FE 
    db $FE 
    dw $6A67,$01FE 
    db $F6 
    dw $6A66 

ProjectileFlareSpritemaps_SuperMissile_4:
    dw $0002,$01F8 
    db $FC 
    dw $6A65,$0000 
    db $FC 
    dw $6A64 

ProjectileFlareSpritemaps_SuperMissile_5:
    dw $0003,$01F6 
    db $FA 
    dw $EA68,$01FE 
    db $FA 
    dw $EA67,$01FE 
    db $02 
    dw $EA66 

ProjectileFlareSpritemaps_SuperMissile_6:
    dw $0002,$01FC 
    db $00 
    dw $AA69,$01FC 
    db $F8 
    dw $AA6A 

ProjectileFlareSpritemaps_SuperMissile_7:
    dw $0003,$0002 
    db $FA 
    dw $AA68,$01FA 
    db $FA 
    dw $AA67,$01FA 
    db $02 
    dw $AA66 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_93AE49:
    dw $0001,$01FC 
    db $FC 
    dw $3A3C 

UNUSED_ProjectileFlareSpritemaps_93AE50:
    dw $0001,$01FC 
    db $FC 
    dw $3A3D 

UNUSED_ProjectileFlareSpritemaps_93AE57:
    dw $0001,$01FC 
    db $FC 
    dw $3A3E 

UNUSED_ProjectileFlareSpritemaps_93AE5E:
    dw $0001,$01FC 
    db $FC 
    dw $3A3F 
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Wave_IceWave_0:
    dw $0001,$01FC 
    db $FC 
    dw $2C30 

ProjectileFlareSpritemaps_Wave_IceWave_1:
    dw $0001,$01FC 
    db $F4 
    dw $2C30 

ProjectileFlareSpritemaps_Wave_IceWave_2:
    dw $0001,$01FC 
    db $EF 
    dw $2C31 

ProjectileFlareSpritemaps_Wave_IceWave_3:
    dw $0001,$01FC 
    db $ED 
    dw $2C31 

ProjectileFlareSpritemaps_Wave_IceWave_4:
    dw $0001,$01FC 
    db $EC 
    dw $2C32 

ProjectileFlareSpritemaps_Wave_IceWave_5:
    dw $0001,$01FC 
    db $04 
    dw $2C30 

ProjectileFlareSpritemaps_Wave_IceWave_6:
    dw $0001,$01FC 
    db $09 
    dw $2C31 

ProjectileFlareSpritemaps_Wave_IceWave_7:
    dw $0001,$01FC 
    db $0B 
    dw $2C31 

ProjectileFlareSpritemaps_Wave_IceWave_8:
    dw $0001,$01FC 
    db $0C 
    dw $2C32 

ProjectileFlareSpritemaps_Wave_IceWave_9:
    dw $0001,$0002 
    db $F6 
    dw $2C30 

ProjectileFlareSpritemaps_Wave_IceWave_A:
    dw $0001,$0005 
    db $F3 
    dw $2C31 

ProjectileFlareSpritemaps_Wave_IceWave_B:
    dw $0001,$0007 
    db $F1 
    dw $2C31 

ProjectileFlareSpritemaps_Wave_IceWave_C:
    dw $0001,$0008 
    db $F0 
    dw $2C32 

ProjectileFlareSpritemaps_Wave_IceWave_D:
    dw $0001,$01F6 
    db $02 
    dw $2C30 

ProjectileFlareSpritemaps_Wave_IceWave_E:
    dw $0001,$01F3 
    db $05 
    dw $2C31 

ProjectileFlareSpritemaps_Wave_IceWave_F:
    dw $0001,$01F1 
    db $07 
    dw $2C31 

ProjectileFlareSpritemaps_Wave_IceWave_10:
    dw $0001,$01F0 
    db $08 
    dw $2C32 

ProjectileFlareSpritemaps_Wave_IceWave_11:
    dw $0001,$0004 
    db $FC 
    dw $2C30 

ProjectileFlareSpritemaps_Wave_IceWave_12:
    dw $0001,$0009 
    db $FC 
    dw $2C31 

ProjectileFlareSpritemaps_Wave_IceWave_13:
    dw $0001,$000B 
    db $FC 
    dw $2C31 

ProjectileFlareSpritemaps_Wave_IceWave_14:
    dw $0001,$000C 
    db $FC 
    dw $2C32 

ProjectileFlareSpritemaps_Wave_IceWave_15:
    dw $0001,$01F4 
    db $FC 
    dw $2C30 

ProjectileFlareSpritemaps_Wave_IceWave_16:
    dw $0001,$01EF 
    db $FC 
    dw $2C31 

ProjectileFlareSpritemaps_Wave_IceWave_17:
    dw $0001,$01ED 
    db $FC 
    dw $2C31 

ProjectileFlareSpritemaps_Wave_IceWave_18:
    dw $0001,$01EC 
    db $FC 
    dw $2C32 

ProjectileFlareSpritemaps_Wave_IceWave_19:
    dw $0001,$01F6 
    db $F6 
    dw $2C30 

ProjectileFlareSpritemaps_Wave_IceWave_1A:
    dw $0001,$01F3 
    db $F3 
    dw $2C31 

ProjectileFlareSpritemaps_Wave_IceWave_1B:
    dw $0001,$01F1 
    db $F1 
    dw $2C31 

ProjectileFlareSpritemaps_Wave_IceWave_1C:
    dw $0001,$01F0 
    db $F0 
    dw $2C32 

ProjectileFlareSpritemaps_Wave_IceWave_1D:
    dw $0001,$0002 
    db $02 
    dw $2C30 

ProjectileFlareSpritemaps_Wave_IceWave_1E:
    dw $0001,$0005 
    db $05 
    dw $2C31 

ProjectileFlareSpritemaps_Wave_IceWave_1F:
    dw $0001,$0007 
    db $07 
    dw $2C31 

ProjectileFlareSpritemaps_Wave_IceWave_20:
    dw $0001,$0008 
    db $08 
    dw $2C32 

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_0:
    dw $0004,$0000 
    db $00 
    dw $EC34,$01F8 
    db $00 
    dw $AC34,$0000 
    db $F8 
    dw $6C34,$01F8 
    db $F8 
    dw $2C34 

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1:
    dw $0004,$0000 
    db $00 
    dw $EC33,$01F8 
    db $00 
    dw $AC33,$0000 
    db $F8 
    dw $6C33,$01F8 
    db $F8 
    dw $2C33 

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_2:
    dw $0008,$0000 
    db $08 
    dw $EC33,$01F8 
    db $08 
    dw $AC33,$0000 
    db $00 
    dw $6C33,$01F8 
    db $00 
    dw $2C33,$0000 
    db $F8 
    dw $EC34,$01F8 
    db $F8 
    dw $AC34,$0000 
    db $F0 
    dw $6C34,$01F8 
    db $F0 
    dw $2C34 

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_3:
    dw $0008,$0000 
    db $08 
    dw $EC34,$01F8 
    db $08 
    dw $AC34,$0000 
    db $00 
    dw $6C34,$01F8 
    db $00 
    dw $2C34,$0000 
    db $F8 
    dw $EC33,$01F8 
    db $F8 
    dw $AC33,$0000 
    db $F0 
    dw $6C33,$01F8 
    db $F0 
    dw $2C33 

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_4:
    dw $0008,$0000 
    db $0D 
    dw $EC33,$01F8 
    db $0D 
    dw $AC33,$0000 
    db $05 
    dw $6C33,$01F8 
    db $05 
    dw $2C33,$0000 
    db $F3 
    dw $EC34,$01F8 
    db $F3 
    dw $AC34,$0000 
    db $EB 
    dw $6C34,$01F8 
    db $EB 
    dw $2C34 

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_5:
    dw $0008,$0000 
    db $0D 
    dw $EC34,$01F8 
    db $0D 
    dw $AC34,$0000 
    db $05 
    dw $6C34,$01F8 
    db $05 
    dw $2C34,$0000 
    db $F3 
    dw $EC33,$01F8 
    db $F3 
    dw $AC33,$0000 
    db $EB 
    dw $6C33,$01F8 
    db $EB 
    dw $2C33 

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_6:
    dw $0008,$0000 
    db $0F 
    dw $EC33,$01F8 
    db $0F 
    dw $AC33,$0000 
    db $07 
    dw $6C33,$01F8 
    db $07 
    dw $2C33,$0000 
    db $F1 
    dw $EC34,$01F8 
    db $F1 
    dw $AC34,$0000 
    db $E9 
    dw $6C34,$01F8 
    db $E9 
    dw $2C34 

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_7:
    dw $0008,$0000 
    db $0F 
    dw $EC34,$01F8 
    db $0F 
    dw $AC34,$0000 
    db $07 
    dw $6C34,$01F8 
    db $07 
    dw $2C34,$0000 
    db $F1 
    dw $EC33,$01F8 
    db $F1 
    dw $AC33,$0000 
    db $E9 
    dw $6C33,$01F8 
    db $E9 
    dw $2C33 

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_8:
    dw $0008,$0000 
    db $10 
    dw $EC33,$01F8 
    db $10 
    dw $AC33,$0000 
    db $08 
    dw $6C33,$01F8 
    db $08 
    dw $2C33,$0000 
    db $F0 
    dw $EC34,$01F8 
    db $F0 
    dw $AC34,$0000 
    db $E8 
    dw $6C34,$01F8 
    db $E8 
    dw $2C34 

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_9:
    dw $0008,$0000 
    db $10 
    dw $EC34,$01F8 
    db $10 
    dw $AC34,$0000 
    db $08 
    dw $6C34,$01F8 
    db $08 
    dw $2C34,$0000 
    db $F0 
    dw $EC33,$01F8 
    db $F0 
    dw $AC33,$0000 
    db $E8 
    dw $6C33,$01F8 
    db $E8 
    dw $2C33 

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_A:
    dw $0008,$0005 
    db $FB 
    dw $EC34,$01FD 
    db $FB 
    dw $AC34,$0005 
    db $F3 
    dw $6C34,$01FD 
    db $F3 
    dw $2C34,$01FB 
    db $05 
    dw $EC33,$01F3 
    db $05 
    dw $AC33,$01FB 
    db $FD 
    dw $6C33,$01F3 
    db $FD 
    dw $2C33 

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_B:
    dw $0008,$0004 
    db $FC 
    dw $EC33,$01FC 
    db $FC 
    dw $AC33,$0004 
    db $F4 
    dw $6C33,$01FC 
    db $F4 
    dw $2C33,$01FC 
    db $04 
    dw $EC34,$01F4 
    db $04 
    dw $AC34,$01FC 
    db $FC 
    dw $6C34,$01F4 
    db $FC 
    dw $2C34 

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_C:
    dw $0008,$01F9 
    db $07 
    dw $EC33,$01F1 
    db $07 
    dw $AC33,$01F9 
    db $FF 
    dw $6C33,$01F1 
    db $FF 
    dw $2C33,$0007 
    db $F9 
    dw $EC34,$01FF 
    db $F9 
    dw $AC34,$0007 
    db $F1 
    dw $6C34,$01FF 
    db $F1 
    dw $2C34 

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_D:
    dw $0008,$01F9 
    db $07 
    dw $EC34,$01F1 
    db $07 
    dw $AC34,$01F9 
    db $FF 
    dw $6C34,$01F1 
    db $FF 
    dw $2C34,$0007 
    db $F9 
    dw $EC33,$01FF 
    db $F9 
    dw $AC33,$0007 
    db $F1 
    dw $6C33,$01FF 
    db $F1 
    dw $2C33 

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_E:
    dw $0008,$01F7 
    db $09 
    dw $EC33,$01EF 
    db $09 
    dw $AC33,$01F7 
    db $01 
    dw $6C33,$01EF 
    db $01 
    dw $2C33,$0009 
    db $F7 
    dw $EC34,$0001 
    db $F7 
    dw $AC34,$0009 
    db $EF 
    dw $6C34,$0001 
    db $EF 
    dw $2C34 

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_F:
    dw $0008,$01F7 
    db $09 
    dw $EC34,$01EF 
    db $09 
    dw $AC34,$01F7 
    db $01 
    dw $6C34,$01EF 
    db $01 
    dw $2C34,$0009 
    db $F7 
    dw $EC33,$0001 
    db $F7 
    dw $AC33,$0009 
    db $EF 
    dw $6C33,$0001 
    db $EF 
    dw $2C33 

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_10:
    dw $0008,$01F6 
    db $0A 
    dw $EC33,$01EE 
    db $0A 
    dw $AC33,$01F6 
    db $02 
    dw $6C33,$01EE 
    db $02 
    dw $2C33,$000A 
    db $F6 
    dw $EC34,$0002 
    db $F6 
    dw $AC34,$000A 
    db $EE 
    dw $6C34,$0002 
    db $EE 
    dw $2C34 

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_11:
    dw $0008,$01F6 
    db $0A 
    dw $EC34,$01EE 
    db $0A 
    dw $AC34,$01F6 
    db $02 
    dw $6C34,$01EE 
    db $02 
    dw $2C34,$000A 
    db $F6 
    dw $EC33,$0002 
    db $F6 
    dw $AC33,$000A 
    db $EE 
    dw $6C33,$0002 
    db $EE 
    dw $2C33 

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_12:
    dw $0008,$01F3 
    db $FB 
    dw $AC34,$01FB 
    db $FB 
    dw $EC34,$01F3 
    db $F3 
    dw $2C34,$01FB 
    db $F3 
    dw $6C34,$01FD 
    db $05 
    dw $AC33,$0005 
    db $05 
    dw $EC33,$01FD 
    db $FD 
    dw $2C33,$0005 
    db $FD 
    dw $6C33 

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_13:
    dw $0008,$01F4 
    db $FC 
    dw $AC33,$01FC 
    db $FC 
    dw $EC33,$01F4 
    db $F4 
    dw $2C33,$01FC 
    db $F4 
    dw $6C33,$01FC 
    db $04 
    dw $AC34,$0004 
    db $04 
    dw $EC34,$01FC 
    db $FC 
    dw $2C34,$0004 
    db $FC 
    dw $6C34 

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_14:
    dw $0008,$01FF 
    db $07 
    dw $AC33,$0007 
    db $07 
    dw $EC33,$01FF 
    db $FF 
    dw $2C33,$0007 
    db $FF 
    dw $6C33,$01F1 
    db $F9 
    dw $AC34,$01F9 
    db $F9 
    dw $EC34,$01F1 
    db $F1 
    dw $2C34,$01F9 
    db $F1 
    dw $6C34 

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_15:
    dw $0008,$01FF 
    db $07 
    dw $AC34,$0007 
    db $07 
    dw $EC34,$01FF 
    db $FF 
    dw $2C34,$0007 
    db $FF 
    dw $6C34,$01F1 
    db $F9 
    dw $AC33,$01F9 
    db $F9 
    dw $EC33,$01F1 
    db $F1 
    dw $2C33,$01F9 
    db $F1 
    dw $6C33 

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_16:
    dw $0008,$0001 
    db $09 
    dw $AC33,$0009 
    db $09 
    dw $EC33,$0001 
    db $01 
    dw $2C33,$0009 
    db $01 
    dw $6C33,$01EF 
    db $F7 
    dw $AC34,$01F7 
    db $F7 
    dw $EC34,$01EF 
    db $EF 
    dw $2C34,$01F7 
    db $EF 
    dw $6C34 

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_17:
    dw $0008,$0001 
    db $09 
    dw $AC34,$0009 
    db $09 
    dw $EC34,$0001 
    db $01 
    dw $2C34,$0009 
    db $01 
    dw $6C34,$01EF 
    db $F7 
    dw $AC33,$01F7 
    db $F7 
    dw $EC33,$01EF 
    db $EF 
    dw $2C33,$01F7 
    db $EF 
    dw $6C33 

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_18:
    dw $0008,$0002 
    db $0A 
    dw $AC33,$000A 
    db $0A 
    dw $EC33,$0002 
    db $02 
    dw $2C33,$000A 
    db $02 
    dw $6C33,$01EE 
    db $F6 
    dw $AC34,$01F6 
    db $F6 
    dw $EC34,$01EE 
    db $EE 
    dw $2C34,$01F6 
    db $EE 
    dw $6C34 

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_19:
    dw $0008,$0002 
    db $0A 
    dw $AC34,$000A 
    db $0A 
    dw $EC34,$0002 
    db $02 
    dw $2C34,$000A 
    db $02 
    dw $6C34,$01EE 
    db $F6 
    dw $AC33,$01F6 
    db $F6 
    dw $EC33,$01EE 
    db $EE 
    dw $2C33,$01F6 
    db $EE 
    dw $6C33 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_ChargedWave_WaveSBA_93B368:
    dw $0004,$0000 
    db $F8 
    dw $6C34,$0000 
    db $00 
    dw $EC34,$01F8 
    db $00 
    dw $AC34,$01F8 
    db $F8 
    dw $2C34 

UNUSED_ProjectileFlareSpritemaps_ChargedWave_WaveSBA_93B37E:
    dw $0004,$0000 
    db $F8 
    dw $6C33,$0000 
    db $00 
    dw $EC33,$01F8 
    db $00 
    dw $AC33,$01F8 
    db $F8 
    dw $2C33 
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1A:
    dw $0008,$01F8 
    db $F8 
    dw $6C34,$01F8 
    db $00 
    dw $EC34,$01F0 
    db $00 
    dw $AC34,$01F0 
    db $F8 
    dw $2C34,$0008 
    db $00 
    dw $EC33,$0000 
    db $00 
    dw $AC33,$0008 
    db $F8 
    dw $6C33,$0000 
    db $F8 
    dw $2C33 

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1B:
    dw $0008,$01F8 
    db $F8 
    dw $6C33,$01F8 
    db $00 
    dw $EC33,$01F0 
    db $00 
    dw $AC33,$01F0 
    db $F8 
    dw $2C33,$0008 
    db $00 
    dw $EC34,$0000 
    db $00 
    dw $AC34,$0008 
    db $F8 
    dw $6C34,$0000 
    db $F8 
    dw $2C34 

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1C:
    dw $0008,$01F3 
    db $F8 
    dw $6C34,$01F3 
    db $00 
    dw $EC34,$01EB 
    db $00 
    dw $AC34,$01EB 
    db $F8 
    dw $2C34,$000D 
    db $00 
    dw $EC33,$0005 
    db $00 
    dw $AC33,$000D 
    db $F8 
    dw $6C33,$0005 
    db $F8 
    dw $2C33 

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1D:
    dw $0008,$01F3 
    db $F8 
    dw $6C33,$01F3 
    db $00 
    dw $EC33,$01EB 
    db $00 
    dw $AC33,$01EB 
    db $F8 
    dw $2C33,$000D 
    db $00 
    dw $EC34,$0005 
    db $00 
    dw $AC34,$000D 
    db $F8 
    dw $6C34,$0005 
    db $F8 
    dw $2C34 

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1E:
    dw $0008,$01F1 
    db $F8 
    dw $6C34,$01F1 
    db $00 
    dw $EC34,$01E9 
    db $00 
    dw $AC34,$01E9 
    db $F8 
    dw $2C34,$000F 
    db $00 
    dw $EC33,$0007 
    db $00 
    dw $AC33,$000F 
    db $F8 
    dw $6C33,$0007 
    db $F8 
    dw $2C33 

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1F:
    dw $0008,$01F1 
    db $F8 
    dw $6C33,$01F1 
    db $00 
    dw $EC33,$01E9 
    db $00 
    dw $AC33,$01E9 
    db $F8 
    dw $2C33,$000F 
    db $00 
    dw $EC34,$0007 
    db $00 
    dw $AC34,$000F 
    db $F8 
    dw $6C34,$0007 
    db $F8 
    dw $2C34 

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_20:
    dw $0008,$01F0 
    db $F8 
    dw $6C34,$01F0 
    db $00 
    dw $EC34,$01E8 
    db $00 
    dw $AC34,$01E8 
    db $F8 
    dw $2C34,$0010 
    db $00 
    dw $EC33,$0008 
    db $00 
    dw $AC33,$0010 
    db $F8 
    dw $6C33,$0008 
    db $F8 
    dw $2C33 

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_21:
    dw $0008,$01F0 
    db $F8 
    dw $6C33,$01F0 
    db $00 
    dw $EC33,$01E8 
    db $00 
    dw $AC33,$01E8 
    db $F8 
    dw $2C33,$0010 
    db $00 
    dw $EC34,$0008 
    db $00 
    dw $AC34,$0010 
    db $F8 
    dw $6C34,$0008 
    db $F8 
    dw $2C34 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_93B4E4:
    dw $0001,$01FC 
    db $FC 
    dw $2C30 

UNUSED_ProjectileFlareSpritemaps_93B4EB:
    dw $0002,$01FC 
    db $04 
    dw $2C37,$01FC 
    db $F4 
    dw $2C30 

UNUSED_ProjectileFlareSpritemaps_93B4F7:
    dw $0002,$01FC 
    db $09 
    dw $2C36,$01FC 
    db $EF 
    dw $2C31 

UNUSED_ProjectileFlareSpritemaps_93B503:
    dw $0002,$01FC 
    db $0B 
    dw $2C37,$01FC 
    db $ED 
    dw $2C32 

UNUSED_ProjectileFlareSpritemaps_93B50F:
    dw $0002,$01FC 
    db $0C 
    dw $2C35,$01FC 
    db $EC 
    dw $2C30 

UNUSED_ProjectileFlareSpritemaps_93B51B:
    dw $0002,$01FC 
    db $F4 
    dw $2C37,$01FC 
    db $04 
    dw $2C30 

UNUSED_ProjectileFlareSpritemaps_93B527:
    dw $0002,$01FC 
    db $EF 
    dw $2C35,$01FC 
    db $09 
    dw $2C31 

UNUSED_ProjectileFlareSpritemaps_93B533:
    dw $0002,$01FC 
    db $0B 
    dw $2C32,$01FC 
    db $ED 
    dw $2C36 

UNUSED_ProjectileFlareSpritemaps_93B53F:
    dw $0002,$01FC 
    db $EC 
    dw $2C37,$01FC 
    db $0C 
    dw $2C30 

UNUSED_ProjectileFlareSpritemaps_93B54B:
    dw $0002,$01F6 
    db $02 
    dw $2C37,$0002 
    db $F6 
    dw $2C30 

UNUSED_ProjectileFlareSpritemaps_93B557:
    dw $0002,$01F3 
    db $05 
    dw $2C36,$0005 
    db $F3 
    dw $2C31 

UNUSED_ProjectileFlareSpritemaps_93B563:
    dw $0002,$01F1 
    db $07 
    dw $2C37,$0007 
    db $F1 
    dw $2C32 

UNUSED_ProjectileFlareSpritemaps_93B56F:
    dw $0002,$0008 
    db $F0 
    dw $2C30,$01F0 
    db $08 
    dw $2C35 

UNUSED_ProjectileFlareSpritemaps_93B57B:
    dw $0002,$0002 
    db $F6 
    dw $2C35,$01F6 
    db $02 
    dw $2C30 

UNUSED_ProjectileFlareSpritemaps_93B587:
    dw $0002,$0005 
    db $F3 
    dw $2C36,$01F3 
    db $05 
    dw $2C31 

UNUSED_ProjectileFlareSpritemaps_93B593:
    dw $0002,$0007 
    db $F1 
    dw $2C37,$01F1 
    db $07 
    dw $2C30 

UNUSED_ProjectileFlareSpritemaps_93B59F:
    dw $0002,$01F0 
    db $08 
    dw $2C31,$0008 
    db $F0 
    dw $2C35 

UNUSED_ProjectileFlareSpritemaps_93B5AB:
    dw $0002,$01F4 
    db $FC 
    dw $2C37,$0004 
    db $FC 
    dw $2C30 

UNUSED_ProjectileFlareSpritemaps_93B5B7:
    dw $0002,$01F1 
    db $FC 
    dw $2C36,$0009 
    db $FC 
    dw $2C31 

UNUSED_ProjectileFlareSpritemaps_93B5C3:
    dw $0002,$01ED 
    db $FC 
    dw $2C37,$000B 
    db $FC 
    dw $2C32 

UNUSED_ProjectileFlareSpritemaps_93B5CF:
    dw $0002,$000C 
    db $FC 
    dw $2C35,$01EC 
    db $FC 
    dw $2C31 

UNUSED_ProjectileFlareSpritemaps_93B5DB:
    dw $0002,$01F4 
    db $FC 
    dw $2C30,$0004 
    db $FC 
    dw $2C37 

UNUSED_ProjectileFlareSpritemaps_93B5E7:
    dw $0002,$0009 
    db $FC 
    dw $2C36,$01EF 
    db $FC 
    dw $2C31 

UNUSED_ProjectileFlareSpritemaps_93B5F3:
    dw $0002,$000C 
    db $FC 
    dw $2C35,$01ED 
    db $FC 
    dw $2C32 

UNUSED_ProjectileFlareSpritemaps_93B5FF:
    dw $0002,$01EC 
    db $FC 
    dw $2C37,$000D 
    db $FC 
    dw $2C30 

UNUSED_ProjectileFlareSpritemaps_93B60B:
    dw $0002,$0002 
    db $02 
    dw $2C37,$01F6 
    db $F6 
    dw $2C30 

UNUSED_ProjectileFlareSpritemaps_93B617:
    dw $0002,$0005 
    db $05 
    dw $2C36,$01F3 
    db $F3 
    dw $2C31 

UNUSED_ProjectileFlareSpritemaps_93B623:
    dw $0002,$0007 
    db $07 
    dw $2C35,$01F1 
    db $F1 
    dw $2C32 

UNUSED_ProjectileFlareSpritemaps_93B62F:
    dw $0002,$0008 
    db $08 
    dw $2C37,$01F0 
    db $F0 
    dw $2C31 

UNUSED_ProjectileFlareSpritemaps_93B63B:
    dw $0002,$01F6 
    db $F6 
    dw $2C37,$0002 
    db $02 
    dw $2C30 

UNUSED_ProjectileFlareSpritemaps_93B647:
    dw $0002,$01F3 
    db $F3 
    dw $2C36,$0005 
    db $05 
    dw $2C31 

UNUSED_ProjectileFlareSpritemaps_93B653:
    dw $0002,$01F1 
    db $F1 
    dw $2C35,$0007 
    db $07 
    dw $2C32 

UNUSED_ProjectileFlareSpritemaps_93B65F:
    dw $0002,$01F0 
    db $F0 
    dw $2C37,$0008 
    db $08 
    dw $2C30 

UNUSED_ProjectileFlareSpritemaps_93B66B:
    dw $0001,$01FC 
    db $FC 
    dw $2C30 
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_ChargedIceWave_0:
    dw $0004,$0000 
    db $00 
    dw $EC34,$01F8 
    db $00 
    dw $AC34,$0000 
    db $F8 
    dw $6C34,$01F8 
    db $F8 
    dw $2C34 

ProjectileFlareSpritemaps_ChargedIceWave_1:
    dw $0004,$0000 
    db $00 
    dw $EC33,$01F8 
    db $00 
    dw $AC33,$0000 
    db $F8 
    dw $6C33,$01F8 
    db $F8 
    dw $2C33 

ProjectileFlareSpritemaps_ChargedIceWave_2:
    dw $0008,$0000 
    db $08 
    dw $EC33,$01F8 
    db $08 
    dw $AC33,$0000 
    db $00 
    dw $6C33,$01F8 
    db $00 
    dw $2C33,$0000 
    db $F8 
    dw $EC34,$01F8 
    db $F8 
    dw $AC34,$0000 
    db $F0 
    dw $6C34,$01F8 
    db $F0 
    dw $2C34 

ProjectileFlareSpritemaps_ChargedIceWave_3:
    dw $0008,$0000 
    db $08 
    dw $EC34,$01F8 
    db $08 
    dw $AC34,$0000 
    db $00 
    dw $6C34,$01F8 
    db $00 
    dw $2C34,$0000 
    db $F8 
    dw $EC33,$01F8 
    db $F8 
    dw $AC33,$0000 
    db $F0 
    dw $6C33,$01F8 
    db $F0 
    dw $2C33 

ProjectileFlareSpritemaps_ChargedIceWave_4:
    dw $0008,$0000 
    db $0D 
    dw $EC33,$01F8 
    db $0D 
    dw $AC33,$0000 
    db $05 
    dw $6C33,$01F8 
    db $05 
    dw $2C33,$0000 
    db $F3 
    dw $EC34,$01F8 
    db $F3 
    dw $AC34,$0000 
    db $EB 
    dw $6C34,$01F8 
    db $EB 
    dw $2C34 

ProjectileFlareSpritemaps_ChargedIceWave_5:
    dw $0008,$0000 
    db $0D 
    dw $EC34,$01F8 
    db $0D 
    dw $AC34,$0000 
    db $05 
    dw $6C34,$01F8 
    db $05 
    dw $2C34,$0000 
    db $F3 
    dw $EC33,$01F8 
    db $F3 
    dw $AC33,$0000 
    db $EB 
    dw $6C33,$01F8 
    db $EB 
    dw $2C33 

ProjectileFlareSpritemaps_ChargedIceWave_6:
    dw $0008,$0000 
    db $0F 
    dw $EC33,$01F8 
    db $0F 
    dw $AC33,$0000 
    db $07 
    dw $6C33,$01F8 
    db $07 
    dw $2C33,$0000 
    db $F1 
    dw $EC34,$01F8 
    db $F1 
    dw $AC34,$0000 
    db $E9 
    dw $6C34,$01F8 
    db $E9 
    dw $2C34 

ProjectileFlareSpritemaps_ChargedIceWave_7:
    dw $0008,$0000 
    db $0F 
    dw $EC34,$01F8 
    db $0F 
    dw $AC34,$0000 
    db $07 
    dw $6C34,$01F8 
    db $07 
    dw $2C34,$0000 
    db $F1 
    dw $EC33,$01F8 
    db $F1 
    dw $AC33,$0000 
    db $E9 
    dw $6C33,$01F8 
    db $E9 
    dw $2C33 

ProjectileFlareSpritemaps_ChargedIceWave_8:
    dw $0008,$0000 
    db $10 
    dw $EC33,$01F8 
    db $10 
    dw $AC33,$0000 
    db $08 
    dw $6C33,$01F8 
    db $08 
    dw $2C33,$0000 
    db $F0 
    dw $EC34,$01F8 
    db $F0 
    dw $AC34,$0000 
    db $E8 
    dw $6C34,$01F8 
    db $E8 
    dw $2C34 

ProjectileFlareSpritemaps_ChargedIceWave_9:
    dw $0008,$0000 
    db $10 
    dw $EC34,$01F8 
    db $10 
    dw $AC34,$0000 
    db $08 
    dw $6C34,$01F8 
    db $08 
    dw $2C34,$0000 
    db $F0 
    dw $EC33,$01F8 
    db $F0 
    dw $AC33,$0000 
    db $E8 
    dw $6C33,$01F8 
    db $E8 
    dw $2C33 

ProjectileFlareSpritemaps_ChargedIceWave_A:
    dw $0008,$0005 
    db $FB 
    dw $EC34,$01FD 
    db $FB 
    dw $AC34,$0005 
    db $F3 
    dw $6C34,$01FD 
    db $F3 
    dw $2C34,$01FB 
    db $05 
    dw $EC33,$01F3 
    db $05 
    dw $AC33,$01FB 
    db $FD 
    dw $6C33,$01F3 
    db $FD 
    dw $2C33 

ProjectileFlareSpritemaps_ChargedIceWave_B:
    dw $0008,$0004 
    db $FC 
    dw $EC33,$01FC 
    db $FC 
    dw $AC33,$0004 
    db $F4 
    dw $6C33,$01FC 
    db $F4 
    dw $2C33,$01FC 
    db $04 
    dw $EC34,$01F4 
    db $04 
    dw $AC34,$01FC 
    db $FC 
    dw $6C34,$01F4 
    db $FC 
    dw $2C34 

ProjectileFlareSpritemaps_ChargedIceWave_C:
    dw $0008,$01F9 
    db $07 
    dw $EC33,$01F1 
    db $07 
    dw $AC33,$01F9 
    db $FF 
    dw $6C33,$01F1 
    db $FF 
    dw $2C33,$0007 
    db $F9 
    dw $EC34,$01FF 
    db $F9 
    dw $AC34,$0007 
    db $F1 
    dw $6C34,$01FF 
    db $F1 
    dw $2C34 

ProjectileFlareSpritemaps_ChargedIceWave_D:
    dw $0008,$01F9 
    db $07 
    dw $EC34,$01F1 
    db $07 
    dw $AC34,$01F9 
    db $FF 
    dw $6C34,$01F1 
    db $FF 
    dw $2C34,$0007 
    db $F9 
    dw $EC33,$01FF 
    db $F9 
    dw $AC33,$0007 
    db $F1 
    dw $6C33,$01FF 
    db $F1 
    dw $2C33 

ProjectileFlareSpritemaps_ChargedIceWave_E:
    dw $0008,$01F7 
    db $09 
    dw $EC33,$01EF 
    db $09 
    dw $AC33,$01F7 
    db $01 
    dw $6C33,$01EF 
    db $01 
    dw $2C33,$0009 
    db $F7 
    dw $EC34,$0001 
    db $F7 
    dw $AC34,$0009 
    db $EF 
    dw $6C34,$0001 
    db $EF 
    dw $2C34 

ProjectileFlareSpritemaps_ChargedIceWave_F:
    dw $0008,$01F7 
    db $09 
    dw $EC34,$01EF 
    db $09 
    dw $AC34,$01F7 
    db $01 
    dw $6C34,$01EF 
    db $01 
    dw $2C34,$0009 
    db $F7 
    dw $EC33,$0001 
    db $F7 
    dw $AC33,$0009 
    db $EF 
    dw $6C33,$0001 
    db $EF 
    dw $2C33 

ProjectileFlareSpritemaps_ChargedIceWave_10:
    dw $0008,$01F6 
    db $0A 
    dw $EC33,$01EE 
    db $0A 
    dw $AC33,$01F6 
    db $02 
    dw $6C33,$01EE 
    db $02 
    dw $2C33,$000A 
    db $F6 
    dw $EC34,$0002 
    db $F6 
    dw $AC34,$000A 
    db $EE 
    dw $6C34,$0002 
    db $EE 
    dw $2C34 

ProjectileFlareSpritemaps_ChargedIceWave_11:
    dw $0008,$01F6 
    db $0A 
    dw $EC34,$01EE 
    db $0A 
    dw $AC34,$01F6 
    db $02 
    dw $6C34,$01EE 
    db $02 
    dw $2C34,$000A 
    db $F6 
    dw $EC33,$0002 
    db $F6 
    dw $AC33,$000A 
    db $EE 
    dw $6C33,$0002 
    db $EE 
    dw $2C33 

ProjectileFlareSpritemaps_ChargedIceWave_12:
    dw $0008,$01F3 
    db $FB 
    dw $AC34,$01FB 
    db $FB 
    dw $EC34,$01F3 
    db $F3 
    dw $2C34,$01FB 
    db $F3 
    dw $6C34,$01FD 
    db $05 
    dw $AC33,$0005 
    db $05 
    dw $EC33,$01FD 
    db $FD 
    dw $2C33,$0005 
    db $FD 
    dw $6C33 

ProjectileFlareSpritemaps_ChargedIceWave_13:
    dw $0008,$01F4 
    db $FC 
    dw $AC33,$01FC 
    db $FC 
    dw $EC33,$01F4 
    db $F4 
    dw $2C33,$01FC 
    db $F4 
    dw $6C33,$01FC 
    db $04 
    dw $AC34,$0004 
    db $04 
    dw $EC34,$01FC 
    db $FC 
    dw $2C34,$0004 
    db $FC 
    dw $6C34 

ProjectileFlareSpritemaps_ChargedIceWave_14:
    dw $0008,$01FF 
    db $07 
    dw $AC33,$0007 
    db $07 
    dw $EC33,$01FF 
    db $FF 
    dw $2C33,$0007 
    db $FF 
    dw $6C33,$01F1 
    db $F9 
    dw $AC34,$01F9 
    db $F9 
    dw $EC34,$01F1 
    db $F1 
    dw $2C34,$01F9 
    db $F1 
    dw $6C34 

ProjectileFlareSpritemaps_ChargedIceWave_15:
    dw $0008,$01FF 
    db $07 
    dw $AC34,$0007 
    db $07 
    dw $EC34,$01FF 
    db $FF 
    dw $2C34,$0007 
    db $FF 
    dw $6C34,$01F1 
    db $F9 
    dw $AC33,$01F9 
    db $F9 
    dw $EC33,$01F1 
    db $F1 
    dw $2C33,$01F9 
    db $F1 
    dw $6C33 

ProjectileFlareSpritemaps_ChargedIceWave_16:
    dw $0008,$0001 
    db $09 
    dw $AC33,$0009 
    db $09 
    dw $EC33,$0001 
    db $01 
    dw $2C33,$0009 
    db $01 
    dw $6C33,$01EF 
    db $F7 
    dw $AC34,$01F7 
    db $F7 
    dw $EC34,$01EF 
    db $EF 
    dw $2C34,$01F7 
    db $EF 
    dw $6C34 

ProjectileFlareSpritemaps_ChargedIceWave_17:
    dw $0008,$0001 
    db $09 
    dw $AC34,$0009 
    db $09 
    dw $EC34,$0001 
    db $01 
    dw $2C34,$0009 
    db $01 
    dw $6C34,$01EF 
    db $F7 
    dw $AC33,$01F7 
    db $F7 
    dw $EC33,$01EF 
    db $EF 
    dw $2C33,$01F7 
    db $EF 
    dw $6C33 

ProjectileFlareSpritemaps_ChargedIceWave_18:
    dw $0008,$0002 
    db $0A 
    dw $AC33,$000A 
    db $0A 
    dw $EC33,$0002 
    db $02 
    dw $2C33,$000A 
    db $02 
    dw $6C33,$01EE 
    db $F6 
    dw $AC34,$01F6 
    db $F6 
    dw $EC34,$01EE 
    db $EE 
    dw $2C34,$01F6 
    db $EE 
    dw $6C34 

ProjectileFlareSpritemaps_ChargedIceWave_19:
    dw $0008,$0002 
    db $0A 
    dw $AC34,$000A 
    db $0A 
    dw $EC34,$0002 
    db $02 
    dw $2C34,$000A 
    db $02 
    dw $6C34,$01EE 
    db $F6 
    dw $AC33,$01F6 
    db $F6 
    dw $EC33,$01EE 
    db $EE 
    dw $2C33,$01F6 
    db $EE 
    dw $6C33 

ProjectileFlareSpritemaps_ChargedIceWave_1A:
    dw $0004,$0000 
    db $F8 
    dw $6C34,$0000 
    db $00 
    dw $EC34,$01F8 
    db $00 
    dw $AC34,$01F8 
    db $F8 
    dw $2C34 

ProjectileFlareSpritemaps_ChargedIceWave_1B:
    dw $0004,$0000 
    db $F8 
    dw $6C33,$0000 
    db $00 
    dw $EC33,$01F8 
    db $00 
    dw $AC33,$01F8 
    db $F8 
    dw $2C33 

ProjectileFlareSpritemaps_ChargedIceWave_1C:
    dw $0008,$01F8 
    db $F8 
    dw $6C34,$01F8 
    db $00 
    dw $EC34,$01F0 
    db $00 
    dw $AC34,$01F0 
    db $F8 
    dw $2C34,$0008 
    db $00 
    dw $EC33,$0000 
    db $00 
    dw $AC33,$0008 
    db $F8 
    dw $6C33,$0000 
    db $F8 
    dw $2C33 

ProjectileFlareSpritemaps_ChargedIceWave_1D:
    dw $0008,$01F8 
    db $F8 
    dw $6C33,$01F8 
    db $00 
    dw $EC33,$01F0 
    db $00 
    dw $AC33,$01F0 
    db $F8 
    dw $2C33,$0008 
    db $00 
    dw $EC34,$0000 
    db $00 
    dw $AC34,$0008 
    db $F8 
    dw $6C34,$0000 
    db $F8 
    dw $2C34 

ProjectileFlareSpritemaps_ChargedIceWave_1E:
    dw $0008,$01F3 
    db $F8 
    dw $6C34,$01F3 
    db $00 
    dw $EC34,$01EB 
    db $00 
    dw $AC34,$01EB 
    db $F8 
    dw $2C34,$000D 
    db $00 
    dw $EC33,$0005 
    db $00 
    dw $AC33,$000D 
    db $F8 
    dw $6C33,$0005 
    db $F8 
    dw $2C33 

ProjectileFlareSpritemaps_ChargedIceWave_1F:
    dw $0008,$01F3 
    db $F8 
    dw $6C33,$01F3 
    db $00 
    dw $EC33,$01EB 
    db $00 
    dw $AC33,$01EB 
    db $F8 
    dw $2C33,$000D 
    db $00 
    dw $EC34,$0005 
    db $00 
    dw $AC34,$000D 
    db $F8 
    dw $6C34,$0005 
    db $F8 
    dw $2C34 

ProjectileFlareSpritemaps_ChargedIceWave_20:
    dw $0008,$01F1 
    db $F8 
    dw $6C34,$01F1 
    db $00 
    dw $EC34,$01E9 
    db $00 
    dw $AC34,$01E9 
    db $F8 
    dw $2C34,$000F 
    db $00 
    dw $EC33,$0007 
    db $00 
    dw $AC33,$000F 
    db $F8 
    dw $6C33,$0007 
    db $F8 
    dw $2C33 

ProjectileFlareSpritemaps_ChargedIceWave_21:
    dw $0008,$01F1 
    db $F8 
    dw $6C33,$01F1 
    db $00 
    dw $EC33,$01E9 
    db $00 
    dw $AC33,$01E9 
    db $F8 
    dw $2C33,$000F 
    db $00 
    dw $EC34,$0007 
    db $00 
    dw $AC34,$000F 
    db $F8 
    dw $6C34,$0007 
    db $F8 
    dw $2C34 

ProjectileFlareSpritemaps_ChargedIceWave_22:
    dw $0008,$01F0 
    db $F8 
    dw $6C34,$01F0 
    db $00 
    dw $EC34,$01E8 
    db $00 
    dw $AC34,$01E8 
    db $F8 
    dw $2C34,$0010 
    db $00 
    dw $EC33,$0008 
    db $00 
    dw $AC33,$0010 
    db $F8 
    dw $6C33,$0008 
    db $F8 
    dw $2C33 

ProjectileFlareSpritemaps_ChargedIceWave_23:
    dw $0008,$01F0 
    db $F8 
    dw $6C33,$01F0 
    db $00 
    dw $EC33,$01E8 
    db $00 
    dw $AC33,$01E8 
    db $F8 
    dw $2C33,$0010 
    db $00 
    dw $EC34,$0008 
    db $00 
    dw $AC34,$0010 
    db $F8 
    dw $6C34,$0008 
    db $F8 
    dw $2C34 

ProjectileFlareSpritemaps_Charged_PW_PIW_0:
    dw $0004,$0008 
    db $FC 
    dw $2C30,$0000 
    db $FC 
    dw $2C30,$01F8 
    db $FC 
    dw $2C30,$01F0 
    db $FC 
    dw $2C30 

ProjectileFlareSpritemaps_Charged_PW_PIW_1:
    dw $0008,$0008 
    db $04 
    dw $2C30,$0000 
    db $04 
    dw $2C30,$01F8 
    db $04 
    dw $2C30,$01F0 
    db $04 
    dw $2C30,$0008 
    db $F4 
    dw $2C30,$0000 
    db $F4 
    dw $2C30,$01F8 
    db $F4 
    dw $2C30,$01F0 
    db $F4 
    dw $2C30 

ProjectileFlareSpritemaps_Charged_PW_PIW_2:
    dw $0008,$0008 
    db $09 
    dw $2C30,$0000 
    db $09 
    dw $2C30,$01F8 
    db $09 
    dw $2C30,$01F0 
    db $09 
    dw $2C30,$0008 
    db $EF 
    dw $2C30,$0000 
    db $EF 
    dw $2C30,$01F8 
    db $EF 
    dw $2C30,$01F0 
    db $EF 
    dw $2C30 

ProjectileFlareSpritemaps_Charged_PW_PIW_3:
    dw $0008,$0008 
    db $0B 
    dw $2C30,$0000 
    db $0B 
    dw $2C30,$01F8 
    db $0B 
    dw $2C30,$01F0 
    db $0B 
    dw $2C30,$0008 
    db $ED 
    dw $2C30,$0000 
    db $ED 
    dw $2C30,$01F8 
    db $ED 
    dw $2C30,$01F0 
    db $ED 
    dw $2C30 

ProjectileFlareSpritemaps_Charged_PW_PIW_4:
    dw $0008,$0008 
    db $0C 
    dw $2C30,$0000 
    db $0C 
    dw $2C30,$01F8 
    db $0C 
    dw $2C30,$01F0 
    db $0C 
    dw $2C30,$0008 
    db $EC 
    dw $2C30,$0000 
    db $EC 
    dw $2C30,$01F8 
    db $EC 
    dw $2C30,$01F0 
    db $EC 
    dw $2C30 

ProjectileFlareSpritemaps_Charged_PW_PIW_5:
    dw $0007,$0014 
    db $FC 
    dw $2C30,$01E4 
    db $FC 
    dw $2C30,$000C 
    db $FC 
    dw $2C30,$0004 
    db $FC 
    dw $2C30,$01FC 
    db $FC 
    dw $2C30,$01F4 
    db $FC 
    dw $2C30,$01EC 
    db $FC 
    dw $2C30 

ProjectileFlareSpritemaps_Charged_PW_PIW_6:
    dw $000E,$0014 
    db $04 
    dw $2C30,$0014 
    db $F4 
    dw $2C30,$000C 
    db $04 
    dw $2C30,$01E4 
    db $04 
    dw $2C30,$01E4 
    db $F4 
    dw $2C30,$000C 
    db $F4 
    dw $2C30,$0004 
    db $04 
    dw $2C30,$01FC 
    db $04 
    dw $2C30,$01F4 
    db $04 
    dw $2C30,$01EC 
    db $04 
    dw $2C30,$0004 
    db $F4 
    dw $2C30,$01FC 
    db $F4 
    dw $2C30,$01F4 
    db $F4 
    dw $2C30,$01EC 
    db $F4 
    dw $2C30 

ProjectileFlareSpritemaps_Charged_PW_PIW_7:
    dw $000E,$0014 
    db $09 
    dw $2C30,$0014 
    db $EF 
    dw $2C30,$000C 
    db $09 
    dw $2C30,$01E4 
    db $09 
    dw $2C30,$01E4 
    db $EF 
    dw $2C30,$000C 
    db $EF 
    dw $2C30,$0004 
    db $09 
    dw $2C30,$01FC 
    db $09 
    dw $2C30,$01F4 
    db $09 
    dw $2C30,$01EC 
    db $09 
    dw $2C30,$0004 
    db $EF 
    dw $2C30,$01FC 
    db $EF 
    dw $2C30,$01F4 
    db $EF 
    dw $2C30,$01EC 
    db $EF 
    dw $2C30 

ProjectileFlareSpritemaps_Charged_PW_PIW_8:
    dw $000E,$0014 
    db $0B 
    dw $2C30,$0014 
    db $ED 
    dw $2C30,$000C 
    db $0B 
    dw $2C30,$01E4 
    db $0B 
    dw $2C30,$01E4 
    db $ED 
    dw $2C30,$000C 
    db $ED 
    dw $2C30,$0004 
    db $0B 
    dw $2C30,$01FC 
    db $0B 
    dw $2C30,$01F4 
    db $0B 
    dw $2C30,$01EC 
    db $0B 
    dw $2C30,$0004 
    db $ED 
    dw $2C30,$01FC 
    db $ED 
    dw $2C30,$01F4 
    db $ED 
    dw $2C30,$01EC 
    db $ED 
    dw $2C30 

ProjectileFlareSpritemaps_Charged_PW_PIW_9:
    dw $000E,$0014 
    db $0C 
    dw $2C30,$0014 
    db $EC 
    dw $2C30,$000C 
    db $0C 
    dw $2C30,$01E4 
    db $0C 
    dw $2C30,$01E4 
    db $EC 
    dw $2C30,$000C 
    db $EC 
    dw $2C30,$0004 
    db $0C 
    dw $2C30,$01FC 
    db $0C 
    dw $2C30,$01F4 
    db $0C 
    dw $2C30,$01EC 
    db $0C 
    dw $2C30,$0004 
    db $EC 
    dw $2C30,$01FC 
    db $EC 
    dw $2C30,$01F4 
    db $EC 
    dw $2C30,$01EC 
    db $EC 
    dw $2C30 

ProjectileFlareSpritemaps_Charged_PW_PIW_A:
    dw $0006,$0008 
    db $04 
    dw $2C32,$0000 
    db $04 
    dw $2C31,$01F8 
    db $F4 
    dw $2C32,$01F0 
    db $F4 
    dw $2C31,$0000 
    db $FC 
    dw $2C32,$01F8 
    db $FC 
    dw $2C31 

ProjectileFlareSpritemaps_Charged_PW_PIW_B:
    dw $000C,$000F 
    db $FE 
    dw $2C32,$0007 
    db $FE 
    dw $2C31,$01FF 
    db $EE 
    dw $2C32,$01F7 
    db $EE 
    dw $2C31,$0007 
    db $F6 
    dw $2C32,$01FF 
    db $F6 
    dw $2C31,$0002 
    db $0A 
    dw $2C32,$01FA 
    db $0A 
    dw $2C31,$01F2 
    db $FA 
    dw $2C32,$01EA 
    db $FA 
    dw $2C31,$01FA 
    db $02 
    dw $2C32,$01F2 
    db $02 
    dw $2C31 

ProjectileFlareSpritemaps_Charged_PW_PIW_C:
    dw $000C,$0012 
    db $FB 
    dw $2C32,$000A 
    db $FB 
    dw $2C31,$0002 
    db $EB 
    dw $2C32,$01FA 
    db $EB 
    dw $2C31,$000A 
    db $F3 
    dw $2C32,$0002 
    db $F3 
    dw $2C31,$01FF 
    db $0D 
    dw $2C32,$01F7 
    db $0D 
    dw $2C31,$01EF 
    db $FD 
    dw $2C32,$01E7 
    db $FD 
    dw $2C31,$01F7 
    db $05 
    dw $2C32,$01EF 
    db $05 
    dw $2C31 

ProjectileFlareSpritemaps_Charged_PW_PIW_D:
    dw $000C,$0014 
    db $F9 
    dw $2C32,$000C 
    db $F9 
    dw $2C31,$0004 
    db $E9 
    dw $2C32,$01FC 
    db $E9 
    dw $2C31,$000C 
    db $F1 
    dw $2C32,$0004 
    db $F1 
    dw $2C31,$01FD 
    db $0F 
    dw $2C32,$01F5 
    db $0F 
    dw $2C31,$01ED 
    db $FF 
    dw $2C32,$01E5 
    db $FF 
    dw $2C31,$01F5 
    db $07 
    dw $2C32,$01ED 
    db $07 
    dw $2C31 

ProjectileFlareSpritemaps_Charged_PW_PIW_E:
    dw $000C,$0015 
    db $F8 
    dw $2C32,$000D 
    db $F8 
    dw $2C31,$0005 
    db $E8 
    dw $2C32,$01FD 
    db $E8 
    dw $2C31,$000D 
    db $F0 
    dw $2C32,$0005 
    db $F0 
    dw $2C31,$01FC 
    db $10 
    dw $2C32,$01F4 
    db $10 
    dw $2C31,$01EC 
    db $00 
    dw $2C32,$01E4 
    db $00 
    dw $2C31,$01F4 
    db $08 
    dw $2C32,$01EC 
    db $08 
    dw $2C31 

ProjectileFlareSpritemaps_Charged_PW_PIW_F:
    dw $000A,$01F0 
    db $EC 
    dw $2C32,$01E8 
    db $EC 
    dw $2C31,$0010 
    db $0C 
    dw $2C32,$0008 
    db $0C 
    dw $2C31,$0008 
    db $04 
    dw $2C32,$0000 
    db $04 
    dw $2C31,$01F8 
    db $F4 
    dw $2C32,$01F0 
    db $F4 
    dw $2C31,$0000 
    db $FC 
    dw $2C32,$01F8 
    db $FC 
    dw $2C31 

ProjectileFlareSpritemaps_Charged_PW_PIW_10:
    dw $0014,$01F7 
    db $E6 
    dw $2C32,$01EF 
    db $E6 
    dw $2C31,$01EA 
    db $F2 
    dw $2C32,$01E2 
    db $F2 
    dw $2C31,$000A 
    db $12 
    dw $2C32,$0002 
    db $12 
    dw $2C31,$0017 
    db $06 
    dw $2C32,$000F 
    db $06 
    dw $2C31,$000F 
    db $FE 
    dw $2C32,$0007 
    db $FE 
    dw $2C31,$01FF 
    db $EE 
    dw $2C32,$01F7 
    db $EE 
    dw $2C31,$0007 
    db $F6 
    dw $2C32,$01FF 
    db $F6 
    dw $2C31,$0002 
    db $0A 
    dw $2C32,$01FA 
    db $0A 
    dw $2C31,$01F2 
    db $FA 
    dw $2C32,$01EA 
    db $FA 
    dw $2C31,$01FA 
    db $02 
    dw $2C32,$01F2 
    db $02 
    dw $2C31 

ProjectileFlareSpritemaps_Charged_PW_PIW_11:
    dw $0014,$01FA 
    db $E3 
    dw $2C32,$01F2 
    db $E3 
    dw $2C31,$001A 
    db $03 
    dw $2C32,$0012 
    db $03 
    dw $2C31,$01E7 
    db $F5 
    dw $2C32,$01DF 
    db $F5 
    dw $2C31,$0007 
    db $15 
    dw $2C32,$01FF 
    db $15 
    dw $2C31,$0012 
    db $FB 
    dw $2C32,$000A 
    db $FB 
    dw $2C31,$0002 
    db $EB 
    dw $2C32,$01FA 
    db $EB 
    dw $2C31,$000A 
    db $F3 
    dw $2C32,$0002 
    db $F3 
    dw $2C31,$01FF 
    db $0D 
    dw $2C32,$01F7 
    db $0D 
    dw $2C31,$01EF 
    db $FD 
    dw $2C32,$01E7 
    db $FD 
    dw $2C31,$01F7 
    db $05 
    dw $2C32,$01EF 
    db $05 
    dw $2C31 

ProjectileFlareSpritemaps_Charged_PW_PIW_12:
    dw $0014,$01E5 
    db $F7 
    dw $2C32,$01DD 
    db $F7 
    dw $2C31,$01FC 
    db $E1 
    dw $2C32,$01F4 
    db $E1 
    dw $2C31,$0005 
    db $17 
    dw $2C32,$01FD 
    db $17 
    dw $2C31,$001B 
    db $00 
    dw $2C32,$0013 
    db $00 
    dw $2C31,$0014 
    db $F9 
    dw $2C32,$000C 
    db $F9 
    dw $2C31,$0004 
    db $E9 
    dw $2C32,$01FC 
    db $E9 
    dw $2C31,$000C 
    db $F1 
    dw $2C32,$0004 
    db $F1 
    dw $2C31,$01FD 
    db $0F 
    dw $2C32,$01F5 
    db $0F 
    dw $2C31,$01ED 
    db $FF 
    dw $2C32,$01E5 
    db $FF 
    dw $2C31,$01F5 
    db $07 
    dw $2C32,$01ED 
    db $07 
    dw $2C31 

ProjectileFlareSpritemaps_Charged_PW_PIW_13:
    dw $0014,$01E4 
    db $F8 
    dw $2C32,$01DC 
    db $F8 
    dw $2C31,$01FD 
    db $E0 
    dw $2C32,$01F5 
    db $E0 
    dw $2C31,$0004 
    db $18 
    dw $2C32,$01FC 
    db $18 
    dw $2C31,$001D 
    db $00 
    dw $2C32,$0015 
    db $00 
    dw $2C31,$0015 
    db $F8 
    dw $2C32,$000D 
    db $F8 
    dw $2C31,$0005 
    db $E8 
    dw $2C32,$01FD 
    db $E8 
    dw $2C31,$000D 
    db $F0 
    dw $2C32,$0005 
    db $F0 
    dw $2C31,$01FC 
    db $10 
    dw $2C32,$01F4 
    db $10 
    dw $2C31,$01EC 
    db $00 
    dw $2C32,$01E4 
    db $00 
    dw $2C31,$01F4 
    db $08 
    dw $2C32,$01EC 
    db $08 
    dw $2C31 

ProjectileFlareSpritemaps_Charged_PW_PIW_14:
    dw $0004,$01FC 
    db $08 
    dw $2C33,$01FC 
    db $00 
    dw $2C33,$01FC 
    db $F0 
    dw $2C33,$01FC 
    db $F8 
    dw $2C33 

ProjectileFlareSpritemaps_Charged_PW_PIW_15:
    dw $0008,$0004 
    db $08 
    dw $2C33,$0004 
    db $00 
    dw $2C33,$0004 
    db $F0 
    dw $2C33,$0004 
    db $F8 
    dw $2C33,$01F5 
    db $08 
    dw $2C33,$01F5 
    db $00 
    dw $2C33,$01F5 
    db $F0 
    dw $2C33,$01F5 
    db $F8 
    dw $2C33 

ProjectileFlareSpritemaps_Charged_PW_PIW_16:
    dw $0008,$0009 
    db $08 
    dw $2C33,$0009 
    db $00 
    dw $2C33,$0009 
    db $F0 
    dw $2C33,$0009 
    db $F8 
    dw $2C33,$01EF 
    db $08 
    dw $2C33,$01EF 
    db $00 
    dw $2C33,$01EF 
    db $F0 
    dw $2C33,$01EF 
    db $F8 
    dw $2C33 

ProjectileFlareSpritemaps_Charged_PW_PIW_17:
    dw $0008,$000B 
    db $08 
    dw $2C33,$000B 
    db $00 
    dw $2C33,$000B 
    db $F0 
    dw $2C33,$000B 
    db $F8 
    dw $2C33,$01EE 
    db $08 
    dw $2C33,$01EE 
    db $00 
    dw $2C33,$01EE 
    db $F0 
    dw $2C33,$01EE 
    db $F8 
    dw $2C33 

ProjectileFlareSpritemaps_Charged_PW_PIW_18:
    dw $0008,$000C 
    db $08 
    dw $2C33,$000C 
    db $00 
    dw $2C33,$000C 
    db $F0 
    dw $2C33,$000C 
    db $F8 
    dw $2C33,$01ED 
    db $08 
    dw $2C33,$01ED 
    db $00 
    dw $2C33,$01ED 
    db $F0 
    dw $2C33,$01ED 
    db $F8 
    dw $2C33 

ProjectileFlareSpritemaps_Charged_PW_PIW_19:
    dw $0007,$01FC 
    db $14 
    dw $2C33,$01FC 
    db $0C 
    dw $2C33,$01FC 
    db $E4 
    dw $2C33,$01FC 
    db $04 
    dw $2C33,$01FC 
    db $FC 
    dw $2C33,$01FC 
    db $EC 
    dw $2C33,$01FC 
    db $F4 
    dw $2C33 

ProjectileFlareSpritemaps_Charged_PW_PIW_1A:
    dw $000E,$0004 
    db $14 
    dw $2C33,$0004 
    db $0C 
    dw $2C33,$01F5 
    db $14 
    dw $2C33,$01F5 
    db $0C 
    dw $2C33,$01F5 
    db $E4 
    dw $2C33,$0004 
    db $E4 
    dw $2C33,$0004 
    db $04 
    dw $2C33,$0004 
    db $FC 
    dw $2C33,$0004 
    db $EC 
    dw $2C33,$0004 
    db $F4 
    dw $2C33,$01F5 
    db $04 
    dw $2C33,$01F5 
    db $FC 
    dw $2C33,$01F5 
    db $EC 
    dw $2C33,$01F5 
    db $F4 
    dw $2C33 

ProjectileFlareSpritemaps_Charged_PW_PIW_1B:
    dw $000E,$01EF 
    db $14 
    dw $2C33,$01EF 
    db $0C 
    dw $2C33,$0009 
    db $14 
    dw $2C33,$0009 
    db $0C 
    dw $2C33,$0009 
    db $E4 
    dw $2C33,$01EF 
    db $E4 
    dw $2C33,$0009 
    db $04 
    dw $2C33,$0009 
    db $FC 
    dw $2C33,$0009 
    db $EC 
    dw $2C33,$0009 
    db $F4 
    dw $2C33,$01EF 
    db $04 
    dw $2C33,$01EF 
    db $FC 
    dw $2C33,$01EF 
    db $EC 
    dw $2C33,$01EF 
    db $F4 
    dw $2C33 

ProjectileFlareSpritemaps_Charged_PW_PIW_1C:
    dw $000E,$01EE 
    db $14 
    dw $2C33,$01EE 
    db $0C 
    dw $2C33,$000B 
    db $14 
    dw $2C33,$000B 
    db $0C 
    dw $2C33,$000B 
    db $E4 
    dw $2C33,$01EE 
    db $E4 
    dw $2C33,$000B 
    db $04 
    dw $2C33,$000B 
    db $FC 
    dw $2C33,$000B 
    db $EC 
    dw $2C33,$000B 
    db $F4 
    dw $2C33,$01EE 
    db $04 
    dw $2C33,$01EE 
    db $FC 
    dw $2C33,$01EE 
    db $EC 
    dw $2C33,$01EE 
    db $F4 
    dw $2C33 

ProjectileFlareSpritemaps_Charged_PW_PIW_1D:
    dw $000E,$01ED 
    db $14 
    dw $2C33,$01ED 
    db $0C 
    dw $2C33,$000C 
    db $14 
    dw $2C33,$000C 
    db $0C 
    dw $2C33,$000C 
    db $E4 
    dw $2C33,$01ED 
    db $E4 
    dw $2C33,$000C 
    db $04 
    dw $2C33,$000C 
    db $FC 
    dw $2C33,$000C 
    db $EC 
    dw $2C33,$000C 
    db $F4 
    dw $2C33,$01ED 
    db $04 
    dw $2C33,$01ED 
    db $FC 
    dw $2C33,$01ED 
    db $EC 
    dw $2C33,$01ED 
    db $F4 
    dw $2C33 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C2F4:
    dw $0004,$0008 
    db $FC 
    dw $2C34,$0000 
    db $FC 
    dw $2C34,$01F8 
    db $FC 
    dw $2C34,$01F0 
    db $FC 
    dw $2C34 

UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C30A:
    dw $0008,$0008 
    db $04 
    dw $2C34,$0000 
    db $04 
    dw $2C34,$01F8 
    db $04 
    dw $2C34,$01F0 
    db $04 
    dw $2C34,$0008 
    db $F4 
    dw $2C34,$0000 
    db $F4 
    dw $2C34,$01F8 
    db $F4 
    dw $2C34,$01F0 
    db $F4 
    dw $2C34 

UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C334:
    dw $0008,$0008 
    db $09 
    dw $2C34,$0000 
    db $09 
    dw $2C34,$01F8 
    db $09 
    dw $2C34,$01F0 
    db $09 
    dw $2C34,$0008 
    db $EF 
    dw $2C34,$0000 
    db $EF 
    dw $2C34,$01F8 
    db $EF 
    dw $2C34,$01F0 
    db $EF 
    dw $2C34 

UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C35E:
    dw $0008,$0008 
    db $0B 
    dw $2C34,$0000 
    db $0B 
    dw $2C34,$01F8 
    db $0B 
    dw $2C34,$01F0 
    db $0B 
    dw $2C34,$0008 
    db $ED 
    dw $2C34,$0000 
    db $ED 
    dw $2C34,$01F8 
    db $ED 
    dw $2C34,$01F0 
    db $ED 
    dw $2C34 

UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C388:
    dw $0008,$0008 
    db $0C 
    dw $2C34,$0000 
    db $0C 
    dw $2C34,$01F8 
    db $0C 
    dw $2C34,$01F0 
    db $0C 
    dw $2C34,$0008 
    db $EC 
    dw $2C34,$0000 
    db $EC 
    dw $2C34,$01F8 
    db $EC 
    dw $2C34,$01F0 
    db $EC 
    dw $2C34 
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_PW_PIW_1E:
    dw $0007,$0014 
    db $FC 
    dw $2C34,$01E4 
    db $FC 
    dw $2C34,$000C 
    db $FC 
    dw $2C34,$0004 
    db $FC 
    dw $2C34,$01FC 
    db $FC 
    dw $2C34,$01F4 
    db $FC 
    dw $2C34,$01EC 
    db $FC 
    dw $2C34 

ProjectileFlareSpritemaps_Charged_PW_PIW_1F:
    dw $000E,$0014 
    db $04 
    dw $2C34,$0014 
    db $F4 
    dw $2C34,$000C 
    db $04 
    dw $2C34,$01E4 
    db $04 
    dw $2C34,$01E4 
    db $F4 
    dw $2C34,$000C 
    db $F4 
    dw $2C34,$0004 
    db $04 
    dw $2C34,$01FC 
    db $04 
    dw $2C34,$01F4 
    db $04 
    dw $2C34,$01EC 
    db $04 
    dw $2C34,$0004 
    db $F4 
    dw $2C34,$01FC 
    db $F4 
    dw $2C34,$01F4 
    db $F4 
    dw $2C34,$01EC 
    db $F4 
    dw $2C34 

ProjectileFlareSpritemaps_Charged_PW_PIW_20:
    dw $000E,$0014 
    db $09 
    dw $2C34,$0014 
    db $EF 
    dw $2C34,$000C 
    db $09 
    dw $2C34,$01E4 
    db $09 
    dw $2C34,$01E4 
    db $EF 
    dw $2C34,$000C 
    db $EF 
    dw $2C34,$0004 
    db $09 
    dw $2C34,$01FC 
    db $09 
    dw $2C34,$01F4 
    db $09 
    dw $2C34,$01EC 
    db $09 
    dw $2C34,$0004 
    db $EF 
    dw $2C34,$01FC 
    db $EF 
    dw $2C34,$01F4 
    db $EF 
    dw $2C34,$01EC 
    db $EF 
    dw $2C34 

ProjectileFlareSpritemaps_Charged_PW_PIW_21:
    dw $000E,$0014 
    db $0B 
    dw $2C34,$0014 
    db $ED 
    dw $2C34,$000C 
    db $0B 
    dw $2C34,$01E4 
    db $0B 
    dw $2C34,$01E4 
    db $ED 
    dw $2C34,$000C 
    db $ED 
    dw $2C34,$0004 
    db $0B 
    dw $2C34,$01FC 
    db $0B 
    dw $2C34,$01F4 
    db $0B 
    dw $2C34,$01EC 
    db $0B 
    dw $2C34,$0004 
    db $ED 
    dw $2C34,$01FC 
    db $ED 
    dw $2C34,$01F4 
    db $ED 
    dw $2C34,$01EC 
    db $ED 
    dw $2C34 

ProjectileFlareSpritemaps_Charged_PW_PIW_22:
    dw $000E,$0014 
    db $0C 
    dw $2C34,$0014 
    db $EC 
    dw $2C34,$000C 
    db $0C 
    dw $2C34,$01E4 
    db $0C 
    dw $2C34,$01E4 
    db $EC 
    dw $2C34,$000C 
    db $EC 
    dw $2C34,$0004 
    db $0C 
    dw $2C34,$01FC 
    db $0C 
    dw $2C34,$01F4 
    db $0C 
    dw $2C34,$01EC 
    db $0C 
    dw $2C34,$0004 
    db $EC 
    dw $2C34,$01FC 
    db $EC 
    dw $2C34,$01F4 
    db $EC 
    dw $2C34,$01EC 
    db $EC 
    dw $2C34 

UNSUED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C4F7:
    dw $0008,$0008 
    db $0C 
    dw $EC36,$01F0 
    db $EC 
    dw $2C36,$0008 
    db $04 
    dw $EC35,$0000 
    db $FC 
    dw $EC35,$01F8 
    db $F4 
    dw $EC35,$0000 
    db $04 
    dw $2C35,$01F0 
    db $F4 
    dw $2C35,$01F8 
    db $FC 
    dw $2C35 

UNSUED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C521:
    dw $0010,$000F 
    db $06 
    dw $EC36,$0002 
    db $12 
    dw $EC36,$01F7 
    db $E6 
    dw $2C36,$01EA 
    db $F2 
    dw $2C36,$01FF 
    db $EE 
    dw $EC35,$0007 
    db $F6 
    dw $EC35,$000F 
    db $FE 
    dw $EC35,$0002 
    db $0A 
    dw $EC35,$01FA 
    db $02 
    dw $EC35,$01F2 
    db $FA 
    dw $EC35,$0007 
    db $FE 
    dw $2C35,$01F7 
    db $EE 
    dw $2C35,$01FF 
    db $F6 
    dw $2C35,$01FA 
    db $0A 
    dw $2C35,$01EA 
    db $FA 
    dw $2C35,$01F2 
    db $02 
    dw $2C35 

UNSUED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C573:
    dw $0010,$01FF 
    db $15 
    dw $EC36,$0012 
    db $03 
    dw $EC36,$01E7 
    db $F5 
    dw $2C36,$01FA 
    db $E3 
    dw $2C36,$0012 
    db $FB 
    dw $EC35,$000A 
    db $F3 
    dw $EC35,$0002 
    db $EB 
    dw $EC35,$01FF 
    db $0D 
    dw $EC35,$01F7 
    db $05 
    dw $EC35,$01EF 
    db $FD 
    dw $EC35,$000A 
    db $FB 
    dw $2C35,$01FA 
    db $EB 
    dw $2C35,$0002 
    db $F3 
    dw $2C35,$01F7 
    db $0D 
    dw $2C35,$01E7 
    db $FD 
    dw $2C35,$01EF 
    db $05 
    dw $2C35 

UNSUED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C5C5:
    dw $0010,$01FD 
    db $17 
    dw $EC36,$0014 
    db $01 
    dw $EC36,$01E5 
    db $F7 
    dw $2C36,$01FC 
    db $E1 
    dw $2C36,$0014 
    db $F9 
    dw $EC35,$000C 
    db $F1 
    dw $EC35,$0004 
    db $E9 
    dw $EC35,$01FD 
    db $0F 
    dw $EC35,$01F5 
    db $07 
    dw $EC35,$01ED 
    db $FF 
    dw $EC35,$000C 
    db $F9 
    dw $2C35,$01FC 
    db $E9 
    dw $2C35,$0004 
    db $F1 
    dw $2C35,$01F5 
    db $0F 
    dw $2C35,$01E5 
    db $FF 
    dw $2C35,$01ED 
    db $07 
    dw $2C35 

UNSUED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C617:
    dw $0010,$01FC 
    db $18 
    dw $EC36,$0015 
    db $00 
    dw $EC36,$01FD 
    db $E0 
    dw $2C36,$01E4 
    db $F8 
    dw $2C36,$0015 
    db $F8 
    dw $EC35,$000D 
    db $F0 
    dw $EC35,$0005 
    db $E8 
    dw $EC35,$01FC 
    db $10 
    dw $EC35,$01F4 
    db $08 
    dw $EC35,$01EC 
    db $00 
    dw $EC35,$000D 
    db $F8 
    dw $2C35,$01FD 
    db $E8 
    dw $2C35,$0005 
    db $F0 
    dw $2C35,$01F4 
    db $10 
    dw $2C35,$01E4 
    db $00 
    dw $2C35,$01EC 
    db $08 
    dw $2C35 

ProjectileFlareSpritemaps_Charged_PW_PIW_23:
    dw $000C,$0010 
    db $14 
    dw $EC36,$01E8 
    db $E4 
    dw $2C36,$0010 
    db $0C 
    dw $EC35,$0008 
    db $04 
    dw $EC35,$0000 
    db $FC 
    dw $EC35,$01F8 
    db $F4 
    dw $EC35,$01F0 
    db $EC 
    dw $EC35,$01E8 
    db $EC 
    dw $2C35,$0008 
    db $0C 
    dw $2C35,$0000 
    db $04 
    dw $2C35,$01F0 
    db $F4 
    dw $2C35,$01F8 
    db $FC 
    dw $2C35 

ProjectileFlareSpritemaps_Charged_PW_PIW_24:
    dw $0018,$000A 
    db $1A 
    dw $EC36,$0017 
    db $0E 
    dw $EC36,$01E2 
    db $EA 
    dw $2C36,$01EF 
    db $DE 
    dw $2C36,$01F7 
    db $E6 
    dw $EC35,$01FF 
    db $EE 
    dw $EC35,$0007 
    db $F6 
    dw $EC35,$000F 
    db $FE 
    dw $EC35,$0017 
    db $06 
    dw $EC35,$000A 
    db $12 
    dw $EC35,$0002 
    db $0A 
    dw $EC35,$01FA 
    db $02 
    dw $EC35,$01F2 
    db $FA 
    dw $EC35,$01EA 
    db $F2 
    dw $EC35,$01EF 
    db $E6 
    dw $2C35,$01E2 
    db $F2 
    dw $2C35,$0002 
    db $12 
    dw $2C35,$000F 
    db $06 
    dw $2C35,$0007 
    db $FE 
    dw $2C35,$01F7 
    db $EE 
    dw $2C35,$01FF 
    db $F6 
    dw $2C35,$01FA 
    db $0A 
    dw $2C35,$01EA 
    db $FA 
    dw $2C35,$01F2 
    db $02 
    dw $2C35 

ProjectileFlareSpritemaps_Charged_PW_PIW_25:
    dw $0018,$01DF 
    db $ED 
    dw $2C36,$01F2 
    db $DB 
    dw $2C36,$0007 
    db $1D 
    dw $EC36,$001A 
    db $0B 
    dw $EC36,$01FA 
    db $E3 
    dw $EC35,$0002 
    db $EB 
    dw $EC35,$000A 
    db $F3 
    dw $EC35,$0012 
    db $FB 
    dw $EC35,$001A 
    db $03 
    dw $EC35,$0007 
    db $15 
    dw $EC35,$01FF 
    db $0D 
    dw $EC35,$01F7 
    db $05 
    dw $EC35,$01EF 
    db $FD 
    dw $EC35,$01E7 
    db $F5 
    dw $EC35,$01F2 
    db $E3 
    dw $2C35,$0012 
    db $03 
    dw $2C35,$01DF 
    db $F5 
    dw $2C35,$01FF 
    db $15 
    dw $2C35,$000A 
    db $FB 
    dw $2C35,$01FA 
    db $EB 
    dw $2C35,$0002 
    db $F3 
    dw $2C35,$01F7 
    db $0D 
    dw $2C35,$01E7 
    db $FD 
    dw $2C35,$01EF 
    db $05 
    dw $2C35 

ProjectileFlareSpritemaps_Charged_PW_PIW_26:
    dw $0018,$01DD 
    db $EF 
    dw $2C36,$01F4 
    db $D9 
    dw $2C36,$0005 
    db $1F 
    dw $EC36,$001B 
    db $08 
    dw $EC36,$01FC 
    db $E1 
    dw $EC35,$0004 
    db $E9 
    dw $EC35,$000C 
    db $F1 
    dw $EC35,$0014 
    db $F9 
    dw $EC35,$001B 
    db $00 
    dw $EC35,$0005 
    db $17 
    dw $EC35,$01FD 
    db $0F 
    dw $EC35,$01F5 
    db $07 
    dw $EC35,$01ED 
    db $FF 
    dw $EC35,$01E5 
    db $F7 
    dw $EC35,$01DD 
    db $F7 
    dw $2C35,$01F4 
    db $E1 
    dw $2C35,$01FD 
    db $17 
    dw $2C35,$0013 
    db $00 
    dw $2C35,$000C 
    db $F9 
    dw $2C35,$01FC 
    db $E9 
    dw $2C35,$0004 
    db $F1 
    dw $2C35,$01F5 
    db $0F 
    dw $2C35,$01E5 
    db $FF 
    dw $2C35,$01ED 
    db $07 
    dw $2C35 

ProjectileFlareSpritemaps_Charged_PW_PIW_27:
    dw $0018,$0004 
    db $20 
    dw $EC36,$001D 
    db $08 
    dw $EC36,$01DC 
    db $F0 
    dw $2C36,$01F5 
    db $D8 
    dw $2C36,$01E4 
    db $F8 
    dw $EC35,$01EC 
    db $00 
    dw $EC35,$01F4 
    db $08 
    dw $EC35,$01FC 
    db $10 
    dw $EC35,$0004 
    db $18 
    dw $EC35,$001D 
    db $00 
    dw $EC35,$0015 
    db $F8 
    dw $EC35,$000D 
    db $F0 
    dw $EC35,$0005 
    db $E8 
    dw $EC35,$01FD 
    db $E0 
    dw $EC35,$01DC 
    db $F8 
    dw $2C35,$01F5 
    db $E0 
    dw $2C35,$01FC 
    db $18 
    dw $2C35,$0015 
    db $00 
    dw $2C35,$000D 
    db $F8 
    dw $2C35,$01FD 
    db $E8 
    dw $2C35,$0005 
    db $F0 
    dw $2C35,$01F4 
    db $10 
    dw $2C35,$01E4 
    db $00 
    dw $2C35,$01EC 
    db $08 
    dw $2C35 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C88F:
    dw $0004,$01FC 
    db $08 
    dw $2C37,$01FC 
    db $00 
    dw $2C37,$01FC 
    db $F0 
    dw $2C37,$01FC 
    db $F8 
    dw $2C37 

UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C8A5:
    dw $0008,$0004 
    db $08 
    dw $2C37,$0004 
    db $00 
    dw $2C37,$0004 
    db $F0 
    dw $2C37,$0004 
    db $F8 
    dw $2C37,$01F5 
    db $08 
    dw $2C37,$01F5 
    db $00 
    dw $2C37,$01F5 
    db $F0 
    dw $2C37,$01F5 
    db $F8 
    dw $2C37 

UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C8CF:
    dw $0008,$0009 
    db $08 
    dw $2C37,$0009 
    db $00 
    dw $2C37,$0009 
    db $F0 
    dw $2C37,$0009 
    db $F8 
    dw $2C37,$01EF 
    db $08 
    dw $2C37,$01EF 
    db $00 
    dw $2C37,$01EF 
    db $F0 
    dw $2C37,$01EF 
    db $F8 
    dw $2C37 

UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C8F9:
    dw $0008,$000B 
    db $08 
    dw $2C37,$000B 
    db $00 
    dw $2C37,$000B 
    db $F0 
    dw $2C37,$000B 
    db $F8 
    dw $2C37,$01EE 
    db $08 
    dw $2C37,$01EE 
    db $00 
    dw $2C37,$01EE 
    db $F0 
    dw $2C37,$01EE 
    db $F8 
    dw $2C37 

UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C923:
    dw $0008,$000C 
    db $08 
    dw $2C37,$000C 
    db $00 
    dw $2C37,$000C 
    db $F0 
    dw $2C37,$000C 
    db $F8 
    dw $2C37,$01ED 
    db $08 
    dw $2C37,$01ED 
    db $00 
    dw $2C37,$01ED 
    db $F0 
    dw $2C37,$01ED 
    db $F8 
    dw $2C37 
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_PW_PIW_28:
    dw $0007,$01FC 
    db $14 
    dw $2C37,$01FC 
    db $0C 
    dw $2C37,$01FC 
    db $E4 
    dw $2C37,$01FC 
    db $04 
    dw $2C37,$01FC 
    db $FC 
    dw $2C37,$01FC 
    db $EC 
    dw $2C37,$01FC 
    db $F4 
    dw $2C37 

ProjectileFlareSpritemaps_Charged_PW_PIW_29:
    dw $000E,$0004 
    db $14 
    dw $2C37,$0004 
    db $0C 
    dw $2C37,$01F5 
    db $14 
    dw $2C37,$01F5 
    db $0C 
    dw $2C37,$01F5 
    db $E4 
    dw $2C37,$0004 
    db $E4 
    dw $2C37,$0004 
    db $04 
    dw $2C37,$0004 
    db $FC 
    dw $2C37,$0004 
    db $EC 
    dw $2C37,$0004 
    db $F4 
    dw $2C37,$01F5 
    db $04 
    dw $2C37,$01F5 
    db $FC 
    dw $2C37,$01F5 
    db $EC 
    dw $2C37,$01F5 
    db $F4 
    dw $2C37 

ProjectileFlareSpritemaps_Charged_PW_PIW_2A:
    dw $000E,$01EF 
    db $14 
    dw $2C37,$01EF 
    db $0C 
    dw $2C37,$0009 
    db $14 
    dw $2C37,$0009 
    db $0C 
    dw $2C37,$0009 
    db $E4 
    dw $2C37,$01EF 
    db $E4 
    dw $2C37,$0009 
    db $04 
    dw $2C37,$0009 
    db $FC 
    dw $2C37,$0009 
    db $EC 
    dw $2C37,$0009 
    db $F4 
    dw $2C37,$01EF 
    db $04 
    dw $2C37,$01EF 
    db $FC 
    dw $2C37,$01EF 
    db $EC 
    dw $2C37,$01EF 
    db $F4 
    dw $2C37 

ProjectileFlareSpritemaps_Charged_PW_PIW_2B:
    dw $000E,$01EE 
    db $14 
    dw $2C37,$01EE 
    db $0C 
    dw $2C37,$000B 
    db $14 
    dw $2C37,$000B 
    db $0C 
    dw $2C37,$000B 
    db $E4 
    dw $2C37,$01EE 
    db $E4 
    dw $2C37,$000B 
    db $04 
    dw $2C37,$000B 
    db $FC 
    dw $2C37,$000B 
    db $EC 
    dw $2C37,$000B 
    db $F4 
    dw $2C37,$01EE 
    db $04 
    dw $2C37,$01EE 
    db $FC 
    dw $2C37,$01EE 
    db $EC 
    dw $2C37,$01EE 
    db $F4 
    dw $2C37 

ProjectileFlareSpritemaps_Charged_PW_PIW_2C:
    dw $000E,$01ED 
    db $14 
    dw $2C37,$01ED 
    db $0C 
    dw $2C37,$000C 
    db $14 
    dw $2C37,$000C 
    db $0C 
    dw $2C37,$000C 
    db $E4 
    dw $2C37,$01ED 
    db $E4 
    dw $2C37,$000C 
    db $04 
    dw $2C37,$000C 
    db $FC 
    dw $2C37,$000C 
    db $EC 
    dw $2C37,$000C 
    db $F4 
    dw $2C37,$01ED 
    db $04 
    dw $2C37,$01ED 
    db $FC 
    dw $2C37,$01ED 
    db $EC 
    dw $2C37,$01ED 
    db $F4 
    dw $2C37 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93CA92:
    dw $0008,$01F0 
    db $0C 
    dw $AC36,$0008 
    db $EC 
    dw $6C36,$01F0 
    db $04 
    dw $AC35,$01F8 
    db $FC 
    dw $AC35,$0000 
    db $F4 
    dw $AC35,$01F8 
    db $04 
    dw $6C35,$0008 
    db $F4 
    dw $6C35,$0000 
    db $FC 
    dw $6C35 

UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93CABC:
    dw $0010,$01E9 
    db $06 
    dw $AC36,$01F6 
    db $12 
    dw $AC36,$0001 
    db $E6 
    dw $6C36,$000E 
    db $F2 
    dw $6C36,$01F9 
    db $EE 
    dw $AC35,$01F1 
    db $F6 
    dw $AC35,$01E9 
    db $FE 
    dw $AC35,$01F6 
    db $0A 
    dw $AC35,$01FE 
    db $02 
    dw $AC35,$0006 
    db $FA 
    dw $AC35,$01F1 
    db $FE 
    dw $6C35,$0001 
    db $EE 
    dw $6C35,$01F9 
    db $F6 
    dw $6C35,$01FE 
    db $0A 
    dw $6C35,$000E 
    db $FA 
    dw $6C35,$0006 
    db $02 
    dw $6C35 

UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93CB0E:
    dw $0010,$01F9 
    db $15 
    dw $AC36,$01E6 
    db $03 
    dw $AC36,$0011 
    db $F5 
    dw $6C36,$01FE 
    db $E3 
    dw $6C36,$01E6 
    db $FB 
    dw $AC35,$01EE 
    db $F3 
    dw $AC35,$01F6 
    db $EB 
    dw $AC35,$01F9 
    db $0D 
    dw $AC35,$0001 
    db $05 
    dw $AC35,$0009 
    db $FD 
    dw $AC35,$01EE 
    db $FB 
    dw $6C35,$01FE 
    db $EB 
    dw $6C35,$01F6 
    db $F3 
    dw $6C35,$0001 
    db $0D 
    dw $6C35,$0011 
    db $FD 
    dw $6C35,$0009 
    db $05 
    dw $6C35 

UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93CB60:
    dw $0010,$01FB 
    db $17 
    dw $AC36,$01E4 
    db $01 
    dw $AC36,$0013 
    db $F7 
    dw $6C36,$01FC 
    db $E1 
    dw $6C36,$01E4 
    db $F9 
    dw $AC35,$01EC 
    db $F1 
    dw $AC35,$01F4 
    db $E9 
    dw $AC35,$01FB 
    db $0F 
    dw $AC35,$0003 
    db $07 
    dw $AC35,$000B 
    db $FF 
    dw $AC35,$01EC 
    db $F9 
    dw $6C35,$01FC 
    db $E9 
    dw $6C35,$01F4 
    db $F1 
    dw $6C35,$0003 
    db $0F 
    dw $6C35,$0013 
    db $FF 
    dw $6C35,$000B 
    db $07 
    dw $6C35 

UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93CBB2:
    dw $0010,$01FC 
    db $18 
    dw $AC36,$01E3 
    db $00 
    dw $AC36,$01FB 
    db $E0 
    dw $6C36,$0014 
    db $F8 
    dw $6C36,$01E3 
    db $F8 
    dw $AC35,$01EB 
    db $F0 
    dw $AC35,$01F3 
    db $E8 
    dw $AC35,$01FC 
    db $10 
    dw $AC35,$0004 
    db $08 
    dw $AC35,$000C 
    db $00 
    dw $AC35,$01EB 
    db $F8 
    dw $6C35,$01FB 
    db $E8 
    dw $6C35,$01F3 
    db $F0 
    dw $6C35,$0004 
    db $10 
    dw $6C35,$0014 
    db $00 
    dw $6C35,$000C 
    db $08 
    dw $6C35 
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_PW_PIW_2D:
    dw $000C,$01E8 
    db $14 
    dw $AC36,$0010 
    db $E4 
    dw $6C36,$01E8 
    db $0C 
    dw $AC35,$01F0 
    db $04 
    dw $AC35,$01F8 
    db $FC 
    dw $AC35,$0000 
    db $F4 
    dw $AC35,$0008 
    db $EC 
    dw $AC35,$0010 
    db $EC 
    dw $6C35,$01F0 
    db $0C 
    dw $6C35,$01F8 
    db $04 
    dw $6C35,$0008 
    db $F4 
    dw $6C35,$0000 
    db $FC 
    dw $6C35 

ProjectileFlareSpritemaps_Charged_PW_PIW_2E:
    dw $0018,$01EE 
    db $1A 
    dw $AC36,$01E1 
    db $0E 
    dw $AC36,$0016 
    db $EA 
    dw $6C36,$0009 
    db $DE 
    dw $6C36,$0001 
    db $E6 
    dw $AC35,$01F9 
    db $EE 
    dw $AC35,$01F1 
    db $F6 
    dw $AC35,$01E9 
    db $FE 
    dw $AC35,$01E1 
    db $06 
    dw $AC35,$01EE 
    db $12 
    dw $AC35,$01F6 
    db $0A 
    dw $AC35,$01FE 
    db $02 
    dw $AC35,$0006 
    db $FA 
    dw $AC35,$000E 
    db $F2 
    dw $AC35,$0009 
    db $E6 
    dw $6C35,$0016 
    db $F2 
    dw $6C35,$01F6 
    db $12 
    dw $6C35,$01E9 
    db $06 
    dw $6C35,$01F1 
    db $FE 
    dw $6C35,$0001 
    db $EE 
    dw $6C35,$01F9 
    db $F6 
    dw $6C35,$01FE 
    db $0A 
    dw $6C35,$000E 
    db $FA 
    dw $6C35,$0006 
    db $02 
    dw $6C35 

ProjectileFlareSpritemaps_Charged_PW_PIW_2F:
    dw $0018,$0019 
    db $ED 
    dw $6C36,$0006 
    db $DB 
    dw $6C36,$01F1 
    db $1D 
    dw $AC36,$01DE 
    db $0B 
    dw $AC36,$01FE 
    db $E3 
    dw $AC35,$01F6 
    db $EB 
    dw $AC35,$01EE 
    db $F3 
    dw $AC35,$01E6 
    db $FB 
    dw $AC35,$01DE 
    db $03 
    dw $AC35,$01F1 
    db $15 
    dw $AC35,$01F9 
    db $0D 
    dw $AC35,$0001 
    db $05 
    dw $AC35,$0009 
    db $FD 
    dw $AC35,$0011 
    db $F5 
    dw $AC35,$0006 
    db $E3 
    dw $6C35,$01E6 
    db $03 
    dw $6C35,$0019 
    db $F5 
    dw $6C35,$01F9 
    db $15 
    dw $6C35,$01EE 
    db $FB 
    dw $6C35,$01FE 
    db $EB 
    dw $6C35,$01F6 
    db $F3 
    dw $6C35,$0001 
    db $0D 
    dw $6C35,$0011 
    db $FD 
    dw $6C35,$0009 
    db $05 
    dw $6C35 

ProjectileFlareSpritemaps_Charged_PW_PIW_30:
    dw $0018,$001B 
    db $EF 
    dw $6C36,$0004 
    db $D9 
    dw $6C36,$01F3 
    db $1F 
    dw $AC36,$01DD 
    db $08 
    dw $AC36,$01FC 
    db $E1 
    dw $AC35,$01F4 
    db $E9 
    dw $AC35,$01EC 
    db $F1 
    dw $AC35,$01E4 
    db $F9 
    dw $AC35,$01DD 
    db $00 
    dw $AC35,$01F3 
    db $17 
    dw $AC35,$01FB 
    db $0F 
    dw $AC35,$0003 
    db $07 
    dw $AC35,$000B 
    db $FF 
    dw $AC35,$0013 
    db $F7 
    dw $AC35,$001B 
    db $F7 
    dw $6C35,$0004 
    db $E1 
    dw $6C35,$01FB 
    db $17 
    dw $6C35,$01E5 
    db $00 
    dw $6C35,$01EC 
    db $F9 
    dw $6C35,$01FC 
    db $E9 
    dw $6C35,$01F4 
    db $F1 
    dw $6C35,$0003 
    db $0F 
    dw $6C35,$0013 
    db $FF 
    dw $6C35,$000B 
    db $07 
    dw $6C35 

ProjectileFlareSpritemaps_Charged_PW_PIW_31:
    dw $0018,$01F4 
    db $20 
    dw $AC36,$01DB 
    db $08 
    dw $AC36,$001C 
    db $F0 
    dw $6C36,$0003 
    db $D8 
    dw $6C36,$0014 
    db $F8 
    dw $AC35,$000C 
    db $00 
    dw $AC35,$0004 
    db $08 
    dw $AC35,$01FC 
    db $10 
    dw $AC35,$01F4 
    db $18 
    dw $AC35,$01DB 
    db $00 
    dw $AC35,$01E3 
    db $F8 
    dw $AC35,$01EB 
    db $F0 
    dw $AC35,$01F3 
    db $E8 
    dw $AC35,$01FB 
    db $E0 
    dw $AC35,$001C 
    db $F8 
    dw $6C35,$0003 
    db $E0 
    dw $6C35,$01FC 
    db $18 
    dw $6C35,$01E3 
    db $00 
    dw $6C35,$01EB 
    db $F8 
    dw $6C35,$01FB 
    db $E8 
    dw $6C35,$01F3 
    db $F0 
    dw $6C35,$0004 
    db $10 
    dw $6C35,$0014 
    db $00 
    dw $6C35,$000C 
    db $08 
    dw $6C35 

ProjectileFlareSpritemaps_Charged_PW_PIW_32:
    dw $0006,$01F0 
    db $04 
    dw $6C32,$01F8 
    db $04 
    dw $6C31,$0000 
    db $F4 
    dw $6C32,$0008 
    db $F4 
    dw $6C31,$01F8 
    db $FC 
    dw $6C32,$0000 
    db $FC 
    dw $6C31 

ProjectileFlareSpritemaps_Charged_PW_PIW_33:
    dw $000C,$01E9 
    db $FE 
    dw $6C32,$01F1 
    db $FE 
    dw $6C31,$01F9 
    db $EE 
    dw $6C32,$0001 
    db $EE 
    dw $6C31,$01F1 
    db $F6 
    dw $6C32,$01F9 
    db $F6 
    dw $6C31,$01F6 
    db $0A 
    dw $6C32,$01FE 
    db $0A 
    dw $6C31,$0006 
    db $FA 
    dw $6C32,$000E 
    db $FA 
    dw $6C31,$01FE 
    db $02 
    dw $6C32,$0006 
    db $02 
    dw $6C31 

ProjectileFlareSpritemaps_Charged_PW_PIW_34:
    dw $000C,$01E6 
    db $FB 
    dw $6C32,$01EE 
    db $FB 
    dw $6C31,$01F6 
    db $EB 
    dw $6C32,$01FE 
    db $EB 
    dw $6C31,$01EE 
    db $F3 
    dw $6C32,$01F6 
    db $F3 
    dw $6C31,$01F9 
    db $0D 
    dw $6C32,$0001 
    db $0D 
    dw $6C31,$0009 
    db $FD 
    dw $6C32,$0011 
    db $FD 
    dw $6C31,$0001 
    db $05 
    dw $6C32,$0009 
    db $05 
    dw $6C31 

ProjectileFlareSpritemaps_Charged_PW_PIW_35:
    dw $000C,$01E4 
    db $F9 
    dw $6C32,$01EC 
    db $F9 
    dw $6C31,$01F4 
    db $E9 
    dw $6C32,$01FC 
    db $E9 
    dw $6C31,$01EC 
    db $F1 
    dw $6C32,$01F4 
    db $F1 
    dw $6C31,$01FB 
    db $0F 
    dw $6C32,$0003 
    db $0F 
    dw $6C31,$000B 
    db $FF 
    dw $6C32,$0013 
    db $FF 
    dw $6C31,$0003 
    db $07 
    dw $6C32,$000B 
    db $07 
    dw $6C31 

ProjectileFlareSpritemaps_Charged_PW_PIW_36:
    dw $000C,$01E3 
    db $F8 
    dw $6C32,$01EB 
    db $F8 
    dw $6C31,$01F3 
    db $E8 
    dw $6C32,$01FB 
    db $E8 
    dw $6C31,$01EB 
    db $F0 
    dw $6C32,$01F3 
    db $F0 
    dw $6C31,$01FC 
    db $10 
    dw $6C32,$0004 
    db $10 
    dw $6C31,$000C 
    db $00 
    dw $6C32,$0014 
    db $00 
    dw $6C31,$0004 
    db $08 
    dw $6C32,$000C 
    db $08 
    dw $6C31 

ProjectileFlareSpritemaps_Charged_PW_PIW_37:
    dw $000A,$0008 
    db $EC 
    dw $6C32,$0010 
    db $EC 
    dw $6C31,$01E8 
    db $0C 
    dw $6C32,$01F0 
    db $0C 
    dw $6C31,$01F0 
    db $04 
    dw $6C32,$01F8 
    db $04 
    dw $6C31,$0000 
    db $F4 
    dw $6C32,$0008 
    db $F4 
    dw $6C31,$01F8 
    db $FC 
    dw $6C32,$0000 
    db $FC 
    dw $6C31 

ProjectileFlareSpritemaps_Charged_PW_PIW_38:
    dw $0014,$0001 
    db $E6 
    dw $6C32,$0009 
    db $E6 
    dw $6C31,$000E 
    db $F2 
    dw $6C32,$0016 
    db $F2 
    dw $6C31,$01EE 
    db $12 
    dw $6C32,$01F6 
    db $12 
    dw $6C31,$01E1 
    db $06 
    dw $6C32,$01E9 
    db $06 
    dw $6C31,$01E9 
    db $FE 
    dw $6C32,$01F1 
    db $FE 
    dw $6C31,$01F9 
    db $EE 
    dw $6C32,$0001 
    db $EE 
    dw $6C31,$01F1 
    db $F6 
    dw $6C32,$01F9 
    db $F6 
    dw $6C31,$01F6 
    db $0A 
    dw $6C32,$01FE 
    db $0A 
    dw $6C31,$0006 
    db $FA 
    dw $6C32,$000E 
    db $FA 
    dw $6C31,$01FE 
    db $02 
    dw $6C32,$0006 
    db $02 
    dw $6C31 

ProjectileFlareSpritemaps_Charged_PW_PIW_39:
    dw $0014,$01FE 
    db $E3 
    dw $6C32,$0006 
    db $E3 
    dw $6C31,$01DE 
    db $03 
    dw $6C32,$01E6 
    db $03 
    dw $6C31,$0011 
    db $F5 
    dw $6C32,$0019 
    db $F5 
    dw $6C31,$01F1 
    db $15 
    dw $6C32,$01F9 
    db $15 
    dw $6C31,$01E6 
    db $FB 
    dw $6C32,$01EE 
    db $FB 
    dw $6C31,$01F6 
    db $EB 
    dw $6C32,$01FE 
    db $EB 
    dw $6C31,$01EE 
    db $F3 
    dw $6C32,$01F6 
    db $F3 
    dw $6C31,$01F9 
    db $0D 
    dw $6C32,$0001 
    db $0D 
    dw $6C31,$0009 
    db $FD 
    dw $6C32,$0011 
    db $FD 
    dw $6C31,$0001 
    db $05 
    dw $6C32,$0009 
    db $05 
    dw $6C31 

ProjectileFlareSpritemaps_Charged_PW_PIW_3A:
    dw $0014,$0013 
    db $F7 
    dw $6C32,$001B 
    db $F7 
    dw $6C31,$01FC 
    db $E1 
    dw $6C32,$0004 
    db $E1 
    dw $6C31,$01F3 
    db $17 
    dw $6C32,$01FB 
    db $17 
    dw $6C31,$01DD 
    db $00 
    dw $6C32,$01E5 
    db $00 
    dw $6C31,$01E4 
    db $F9 
    dw $6C32,$01EC 
    db $F9 
    dw $6C31,$01F4 
    db $E9 
    dw $6C32,$01FC 
    db $E9 
    dw $6C31,$01EC 
    db $F1 
    dw $6C32,$01F4 
    db $F1 
    dw $6C31,$01FB 
    db $0F 
    dw $6C32,$0003 
    db $0F 
    dw $6C31,$000B 
    db $FF 
    dw $6C32,$0013 
    db $FF 
    dw $6C31,$0003 
    db $07 
    dw $6C32,$000B 
    db $07 
    dw $6C31 

ProjectileFlareSpritemaps_Charged_PW_PIW_3B:
    dw $0014,$0014 
    db $F8 
    dw $6C32,$001C 
    db $F8 
    dw $6C31,$01FB 
    db $E0 
    dw $6C32,$0003 
    db $E0 
    dw $6C31,$01F4 
    db $18 
    dw $6C32,$01FC 
    db $18 
    dw $6C31,$01DB 
    db $00 
    dw $6C32,$01E3 
    db $00 
    dw $6C31,$01E3 
    db $F8 
    dw $6C32,$01EB 
    db $F8 
    dw $6C31,$01F3 
    db $E8 
    dw $6C32,$01FB 
    db $E8 
    dw $6C31,$01EB 
    db $F0 
    dw $6C32,$01F3 
    db $F0 
    dw $6C31,$01FC 
    db $10 
    dw $6C32,$0004 
    db $10 
    dw $6C31,$000C 
    db $00 
    dw $6C32,$0014 
    db $00 
    dw $6C31,$0004 
    db $08 
    dw $6C32,$000C 
    db $08 
    dw $6C31 

ProjectileFlareSpritemaps_S_SI_SW_SIW_0:
    dw $0004,$01F2 
    db $00 
    dw $6C32,$01FA 
    db $00 
    dw $6C31,$01FA 
    db $F8 
    dw $6C32,$0002 
    db $F8 
    dw $6C31 

ProjectileFlareSpritemaps_S_SI_SW_SIW_1:
    dw $000C,$01F2 
    db $00 
    dw $6C32,$01FA 
    db $00 
    dw $6C31,$01FA 
    db $F8 
    dw $6C32,$0002 
    db $F8 
    dw $6C31,$01EC 
    db $FA 
    dw $6C32,$01F4 
    db $FA 
    dw $6C31,$01F4 
    db $F2 
    dw $6C32,$01FC 
    db $F2 
    dw $6C31,$01F8 
    db $06 
    dw $6C32,$0000 
    db $06 
    dw $6C31,$0000 
    db $FE 
    dw $6C32,$0008 
    db $FE 
    dw $6C31 

ProjectileFlareSpritemaps_S_SI_SW_SIW_2:
    dw $000C,$01F2 
    db $00 
    dw $6C32,$01FA 
    db $00 
    dw $6C31,$01FA 
    db $F8 
    dw $6C32,$0002 
    db $F8 
    dw $6C31,$01E9 
    db $F7 
    dw $6C32,$01F1 
    db $F7 
    dw $6C31,$01F1 
    db $EF 
    dw $6C32,$01F9 
    db $EF 
    dw $6C31,$01FB 
    db $09 
    dw $6C32,$0003 
    db $09 
    dw $6C31,$0003 
    db $01 
    dw $6C32,$000B 
    db $01 
    dw $6C31 

ProjectileFlareSpritemaps_S_SI_SW_SIW_3:
    dw $000C,$01F2 
    db $00 
    dw $6C32,$01FA 
    db $00 
    dw $6C31,$01FA 
    db $F8 
    dw $6C32,$0002 
    db $F8 
    dw $6C31,$01E7 
    db $F5 
    dw $6C32,$01EF 
    db $F5 
    dw $6C31,$01EF 
    db $ED 
    dw $6C32,$01F7 
    db $ED 
    dw $6C31,$01FD 
    db $0B 
    dw $6C32,$0005 
    db $0B 
    dw $6C31,$0005 
    db $03 
    dw $6C32,$000D 
    db $03 
    dw $6C31 

ProjectileFlareSpritemaps_S_SI_SW_SIW_4:
    dw $000C,$01F2 
    db $00 
    dw $6C32,$01FA 
    db $00 
    dw $6C31,$01FA 
    db $F8 
    dw $6C32,$0002 
    db $F8 
    dw $6C31,$01E6 
    db $F4 
    dw $6C32,$01EE 
    db $F4 
    dw $6C31,$01EE 
    db $EC 
    dw $6C32,$01F6 
    db $EC 
    dw $6C31,$01FE 
    db $0C 
    dw $6C32,$0006 
    db $0C 
    dw $6C31,$0006 
    db $04 
    dw $6C32,$000E 
    db $04 
    dw $6C31 

ProjectileFlareSpritemaps_S_SI_SW_SIW_5:
    dw $000C,$01EF 
    db $FE 
    dw $6C32,$01F7 
    db $FE 
    dw $6C31,$01F7 
    db $F6 
    dw $6C32,$01FF 
    db $F6 
    dw $6C31,$01F4 
    db $03 
    dw $6C32,$01FC 
    db $03 
    dw $6C31,$01FC 
    db $FB 
    dw $6C32,$0004 
    db $FB 
    dw $6C31,$01F2 
    db $00 
    dw $6C32,$01FA 
    db $00 
    dw $6C31,$01FA 
    db $F8 
    dw $6C32,$0002 
    db $F8 
    dw $6C31 

ProjectileFlareSpritemaps_S_SI_SW_SIW_6:
    dw $0004,$01F2 
    db $F8 
    dw $EC32,$01FA 
    db $F8 
    dw $EC31,$01FA 
    db $00 
    dw $EC32,$0002 
    db $00 
    dw $EC31 

ProjectileFlareSpritemaps_S_SI_SW_SIW_7:
    dw $000C,$01F2 
    db $F8 
    dw $EC32,$01FA 
    db $F8 
    dw $EC31,$01FA 
    db $00 
    dw $EC32,$0002 
    db $00 
    dw $EC31,$01EC 
    db $FE 
    dw $EC32,$01F4 
    db $FE 
    dw $EC31,$01F4 
    db $06 
    dw $EC32,$01FC 
    db $06 
    dw $EC31,$01F8 
    db $F2 
    dw $EC32,$0000 
    db $F2 
    dw $EC31,$0000 
    db $FA 
    dw $EC32,$0008 
    db $FA 
    dw $EC31 

ProjectileFlareSpritemaps_S_SI_SW_SIW_8:
    dw $000C,$01F2 
    db $F8 
    dw $EC32,$01FA 
    db $F8 
    dw $EC31,$01FA 
    db $00 
    dw $EC32,$0002 
    db $00 
    dw $EC31,$01E9 
    db $01 
    dw $EC32,$01F1 
    db $01 
    dw $EC31,$01F1 
    db $09 
    dw $EC32,$01F9 
    db $09 
    dw $EC31,$01FB 
    db $EF 
    dw $EC32,$0003 
    db $EF 
    dw $EC31,$0003 
    db $F7 
    dw $EC32,$000B 
    db $F7 
    dw $EC31 

ProjectileFlareSpritemaps_S_SI_SW_SIW_9:
    dw $000C,$01F2 
    db $F8 
    dw $EC32,$01FA 
    db $F8 
    dw $EC31,$01FA 
    db $00 
    dw $EC32,$0002 
    db $00 
    dw $EC31,$01E7 
    db $03 
    dw $EC32,$01EF 
    db $03 
    dw $EC31,$01EF 
    db $0B 
    dw $EC32,$01F7 
    db $0B 
    dw $EC31,$01FD 
    db $ED 
    dw $EC32,$0005 
    db $ED 
    dw $EC31,$0005 
    db $F5 
    dw $EC32,$000D 
    db $F5 
    dw $EC31 

ProjectileFlareSpritemaps_S_SI_SW_SIW_A:
    dw $000C,$01F2 
    db $F8 
    dw $EC32,$01FA 
    db $F8 
    dw $EC31,$01FA 
    db $00 
    dw $EC32,$0002 
    db $00 
    dw $EC31,$01E6 
    db $04 
    dw $EC32,$01EE 
    db $04 
    dw $EC31,$01EE 
    db $0C 
    dw $EC32,$01F6 
    db $0C 
    dw $EC31,$01FE 
    db $EC 
    dw $EC32,$0006 
    db $EC 
    dw $EC31,$0006 
    db $F4 
    dw $EC32,$000E 
    db $F4 
    dw $EC31 

ProjectileFlareSpritemaps_S_SI_SW_SIW_B:
    dw $000C,$01EF 
    db $FA 
    dw $EC32,$01F7 
    db $FA 
    dw $EC31,$01F7 
    db $02 
    dw $EC32,$01FF 
    db $02 
    dw $EC31,$01F4 
    db $F5 
    dw $EC32,$01FC 
    db $F5 
    dw $EC31,$01FC 
    db $FD 
    dw $EC32,$0004 
    db $FD 
    dw $EC31,$01F2 
    db $F8 
    dw $EC32,$01FA 
    db $F8 
    dw $EC31,$01FA 
    db $00 
    dw $EC32,$0002 
    db $00 
    dw $EC31 

ProjectileFlareSpritemaps_S_SI_SW_SIW_C:
    dw $0004,$0006 
    db $F8 
    dw $AC32,$01FE 
    db $F8 
    dw $AC31,$01FE 
    db $00 
    dw $AC32,$01F6 
    db $00 
    dw $AC31 

ProjectileFlareSpritemaps_S_SI_SW_SIW_D:
    dw $000C,$0006 
    db $F8 
    dw $AC32,$01FE 
    db $F8 
    dw $AC31,$01FE 
    db $00 
    dw $AC32,$01F6 
    db $00 
    dw $AC31,$000C 
    db $FE 
    dw $AC32,$0004 
    db $FE 
    dw $AC31,$0004 
    db $06 
    dw $AC32,$01FC 
    db $06 
    dw $AC31,$0000 
    db $F2 
    dw $AC32,$01F8 
    db $F2 
    dw $AC31,$01F8 
    db $FA 
    dw $AC32,$01F0 
    db $FA 
    dw $AC31 

ProjectileFlareSpritemaps_S_SI_SW_SIW_E:
    dw $000C,$0006 
    db $F8 
    dw $AC32,$01FE 
    db $F8 
    dw $AC31,$01FE 
    db $00 
    dw $AC32,$01F6 
    db $00 
    dw $AC31,$000F 
    db $01 
    dw $AC32,$0007 
    db $01 
    dw $AC31,$0007 
    db $09 
    dw $AC32,$01FF 
    db $09 
    dw $AC31,$01FD 
    db $EF 
    dw $AC32,$01F5 
    db $EF 
    dw $AC31,$01F5 
    db $F7 
    dw $AC32,$01ED 
    db $F7 
    dw $AC31 

ProjectileFlareSpritemaps_S_SI_SW_SIW_F:
    dw $000C,$0006 
    db $F8 
    dw $AC32,$01FE 
    db $F8 
    dw $AC31,$01FE 
    db $00 
    dw $AC32,$01F6 
    db $00 
    dw $AC31,$0011 
    db $03 
    dw $AC32,$0009 
    db $03 
    dw $AC31,$0009 
    db $0B 
    dw $AC32,$0001 
    db $0B 
    dw $AC31,$01FB 
    db $ED 
    dw $AC32,$01F3 
    db $ED 
    dw $AC31,$01F3 
    db $F5 
    dw $AC32,$01EB 
    db $F5 
    dw $AC31 

ProjectileFlareSpritemaps_S_SI_SW_SIW_10:
    dw $000C,$0006 
    db $F8 
    dw $AC32,$01FE 
    db $F8 
    dw $AC31,$01FE 
    db $00 
    dw $AC32,$01F6 
    db $00 
    dw $AC31,$0012 
    db $04 
    dw $AC32,$000A 
    db $04 
    dw $AC31,$000A 
    db $0C 
    dw $AC32,$0002 
    db $0C 
    dw $AC31,$01FA 
    db $EC 
    dw $AC32,$01F2 
    db $EC 
    dw $AC31,$01F2 
    db $F4 
    dw $AC32,$01EA 
    db $F4 
    dw $AC31 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_S_SI_SW_SIW_93D4B4:
    dw $000C,$0009 
    db $FA 
    dw $AC32,$0001 
    db $FA 
    dw $AC31,$0001 
    db $02 
    dw $AC32,$01F9 
    db $02 
    dw $AC31,$0004 
    db $F5 
    dw $AC32,$01FC 
    db $F5 
    dw $AC31,$01FC 
    db $FD 
    dw $AC32,$01F4 
    db $FD 
    dw $AC31,$0006 
    db $F8 
    dw $AC32,$01FE 
    db $F8 
    dw $AC31,$01FE 
    db $00 
    dw $AC32,$01F6 
    db $00 
    dw $AC31 
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_S_SI_SW_SIW_11:
    dw $0004,$0006 
    db $00 
    dw $2C32,$01FE 
    db $00 
    dw $2C31,$01FE 
    db $F8 
    dw $2C32,$01F6 
    db $F8 
    dw $2C31 

ProjectileFlareSpritemaps_S_SI_SW_SIW_12:
    dw $000C,$0006 
    db $00 
    dw $2C32,$01FE 
    db $00 
    dw $2C31,$01FE 
    db $F8 
    dw $2C32,$01F6 
    db $F8 
    dw $2C31,$000C 
    db $FA 
    dw $2C32,$0004 
    db $FA 
    dw $2C31,$0004 
    db $F2 
    dw $2C32,$01FC 
    db $F2 
    dw $2C31,$0000 
    db $06 
    dw $2C32,$01F8 
    db $06 
    dw $2C31,$01F8 
    db $FE 
    dw $2C32,$01F0 
    db $FE 
    dw $2C31 

ProjectileFlareSpritemaps_S_SI_SW_SIW_13:
    dw $000C,$0006 
    db $00 
    dw $2C32,$01FE 
    db $00 
    dw $2C31,$01FE 
    db $F8 
    dw $2C32,$01F6 
    db $F8 
    dw $2C31,$000F 
    db $F7 
    dw $2C32,$0007 
    db $F7 
    dw $2C31,$0007 
    db $EF 
    dw $2C32,$01FF 
    db $EF 
    dw $2C31,$01FD 
    db $09 
    dw $2C32,$01F5 
    db $09 
    dw $2C31,$01F5 
    db $01 
    dw $2C32,$01ED 
    db $01 
    dw $2C31 

ProjectileFlareSpritemaps_S_SI_SW_SIW_14:
    dw $000C,$0006 
    db $00 
    dw $2C32,$01FE 
    db $00 
    dw $2C31,$01FE 
    db $F8 
    dw $2C32,$01F6 
    db $F8 
    dw $2C31,$0011 
    db $F5 
    dw $2C32,$0009 
    db $F5 
    dw $2C31,$0009 
    db $ED 
    dw $2C32,$0001 
    db $ED 
    dw $2C31,$01FB 
    db $0B 
    dw $2C32,$01F3 
    db $0B 
    dw $2C31,$01F3 
    db $03 
    dw $2C32,$01EB 
    db $03 
    dw $2C31 

ProjectileFlareSpritemaps_S_SI_SW_SIW_15:
    dw $000C,$0006 
    db $00 
    dw $2C32,$01FE 
    db $00 
    dw $2C31,$01FE 
    db $F8 
    dw $2C32,$01F6 
    db $F8 
    dw $2C31,$0012 
    db $F4 
    dw $2C32,$000A 
    db $F4 
    dw $2C31,$000A 
    db $EC 
    dw $2C32,$0002 
    db $EC 
    dw $2C31,$01FA 
    db $0C 
    dw $2C32,$01F2 
    db $0C 
    dw $2C31,$01F2 
    db $04 
    dw $2C32,$01EA 
    db $04 
    dw $2C31 

ProjectileFlareSpritemaps_S_SI_SW_SIW_16:
    dw $000C,$0009 
    db $FE 
    dw $2C32,$0001 
    db $FE 
    dw $2C31,$0001 
    db $F6 
    dw $2C32,$01F9 
    db $F6 
    dw $2C31,$0004 
    db $03 
    dw $2C32,$01FC 
    db $03 
    dw $2C31,$01FC 
    db $FB 
    dw $2C32,$01F4 
    db $FB 
    dw $2C31,$0006 
    db $00 
    dw $2C32,$01FE 
    db $00 
    dw $2C31,$01FE 
    db $F8 
    dw $2C32,$01F6 
    db $F8 
    dw $2C31 

ProjectileFlareSpritemaps_S_SI_SW_SIW_17:
    dw $0002,$01FC 
    db $F8 
    dw $AC33,$01FC 
    db $00 
    dw $AC33 

ProjectileFlareSpritemaps_S_SI_SW_SIW_18:
    dw $0006,$0000 
    db $F8 
    dw $AC33,$0000 
    db $00 
    dw $AC33,$01F8 
    db $F8 
    dw $AC33,$01F8 
    db $00 
    dw $AC33,$01FC 
    db $F8 
    dw $AC33,$01FC 
    db $00 
    dw $AC33 

ProjectileFlareSpritemaps_S_SI_SW_SIW_19:
    dw $0006,$0004 
    db $F8 
    dw $AC33,$0004 
    db $00 
    dw $AC33,$01F4 
    db $F8 
    dw $AC33,$01F4 
    db $00 
    dw $AC33,$01FC 
    db $F8 
    dw $AC33,$01FC 
    db $00 
    dw $AC33 

ProjectileFlareSpritemaps_S_SI_SW_SIW_1A:
    dw $0006,$0009 
    db $F8 
    dw $AC33,$0009 
    db $00 
    dw $AC33,$01EF 
    db $F8 
    dw $AC33,$01EF 
    db $00 
    dw $AC33,$01FC 
    db $F8 
    dw $AC33,$01FC 
    db $00 
    dw $AC33 

ProjectileFlareSpritemaps_S_SI_SW_SIW_1B:
    dw $0006,$000B 
    db $F8 
    dw $AC33,$000B 
    db $00 
    dw $AC33,$01ED 
    db $F8 
    dw $AC33,$01ED 
    db $00 
    dw $AC33,$01FC 
    db $F8 
    dw $AC33,$01FC 
    db $00 
    dw $AC33 

ProjectileFlareSpritemaps_S_SI_SW_SIW_1C:
    dw $0006,$000C 
    db $F8 
    dw $AC33,$000C 
    db $00 
    dw $AC33,$01EC 
    db $F8 
    dw $AC33,$01EC 
    db $00 
    dw $AC33,$01FC 
    db $F8 
    dw $AC33,$01FC 
    db $00 
    dw $AC33 

ProjectileFlareSpritemaps_S_SI_SW_SIW_1D:
    dw $0002,$0000 
    db $FC 
    dw $2C30,$01F8 
    db $FC 
    dw $2C30 

ProjectileFlareSpritemaps_S_SI_SW_SIW_1E:
    dw $0006,$0000 
    db $00 
    dw $2C30,$01F8 
    db $00 
    dw $2C30,$0000 
    db $FC 
    dw $2C30,$01F8 
    db $FC 
    dw $2C30,$0000 
    db $F8 
    dw $2C30,$01F8 
    db $F8 
    dw $2C30 

ProjectileFlareSpritemaps_S_SI_SW_SIW_1F:
    dw $0006,$0000 
    db $F4 
    dw $2C30,$0000 
    db $FC 
    dw $2C30,$0000 
    db $04 
    dw $2C30,$01F8 
    db $04 
    dw $2C30,$01F8 
    db $FC 
    dw $2C30,$01F8 
    db $F4 
    dw $2C30 

ProjectileFlareSpritemaps_S_SI_SW_SIW_20:
    dw $0006,$0000 
    db $EF 
    dw $2C30,$0000 
    db $FC 
    dw $2C30,$0000 
    db $09 
    dw $2C30,$01F8 
    db $09 
    dw $2C30,$01F8 
    db $FC 
    dw $2C30,$01F8 
    db $EF 
    dw $2C30 

ProjectileFlareSpritemaps_S_SI_SW_SIW_21:
    dw $0006,$0000 
    db $ED 
    dw $2C30,$0000 
    db $FC 
    dw $2C30,$0000 
    db $0B 
    dw $2C30,$01F8 
    db $0B 
    dw $2C30,$01F8 
    db $FC 
    dw $2C30,$01F8 
    db $ED 
    dw $2C30 

ProjectileFlareSpritemaps_S_SI_SW_SIW_22:
    dw $0006,$0000 
    db $EC 
    dw $2C30,$0000 
    db $FC 
    dw $2C30,$0000 
    db $0C 
    dw $2C30,$01F8 
    db $0C 
    dw $2C30,$01F8 
    db $FC 
    dw $2C30,$01F8 
    db $EC 
    dw $2C30 

ProjectileFlareSpritemaps_S_SI_SW_SIW_23:
    dw $0002,$01FC 
    db $00 
    dw $2C33,$01FC 
    db $F8 
    dw $2C33 

ProjectileFlareSpritemaps_S_SI_SW_SIW_24:
    dw $0006,$0000 
    db $00 
    dw $2C33,$0000 
    db $F8 
    dw $2C33,$01F8 
    db $00 
    dw $2C33,$01F8 
    db $F8 
    dw $2C33,$01FC 
    db $00 
    dw $2C33,$01FC 
    db $F8 
    dw $2C33 

ProjectileFlareSpritemaps_S_SI_SW_SIW_25:
    dw $0006,$0004 
    db $00 
    dw $2C33,$0004 
    db $F8 
    dw $2C33,$01F4 
    db $00 
    dw $2C33,$01F4 
    db $F8 
    dw $2C33,$01FC 
    db $00 
    dw $2C33,$01FC 
    db $F8 
    dw $2C33 

ProjectileFlareSpritemaps_S_SI_SW_SIW_26:
    dw $0006,$0009 
    db $00 
    dw $2C33,$0009 
    db $F8 
    dw $2C33,$01EF 
    db $00 
    dw $2C33,$01EF 
    db $F8 
    dw $2C33,$01FC 
    db $00 
    dw $2C33,$01FC 
    db $F8 
    dw $2C33 

ProjectileFlareSpritemaps_S_SI_SW_SIW_27:
    dw $0006,$000B 
    db $00 
    dw $2C33,$000B 
    db $F8 
    dw $2C33,$01ED 
    db $00 
    dw $2C33,$01ED 
    db $F8 
    dw $2C33,$01FC 
    db $00 
    dw $2C33,$01FC 
    db $F8 
    dw $2C33 

ProjectileFlareSpritemaps_S_SI_SW_SIW_28:
    dw $0006,$000C 
    db $00 
    dw $2C33,$000C 
    db $F8 
    dw $2C33,$01EC 
    db $00 
    dw $2C33,$01EC 
    db $F8 
    dw $2C33,$01FC 
    db $00 
    dw $2C33,$01FC 
    db $F8 
    dw $2C33 

ProjectileFlareSpritemaps_S_SI_SW_SIW_29:
    dw $0002,$01F8 
    db $FC 
    dw $6C30,$0000 
    db $FC 
    dw $6C30 

ProjectileFlareSpritemaps_S_SI_SW_SIW_2A:
    dw $0006,$0000 
    db $00 
    dw $2C30,$01F8 
    db $00 
    dw $2C30,$0000 
    db $FC 
    dw $2C30,$01F8 
    db $FC 
    dw $2C30,$0000 
    db $F8 
    dw $2C30,$01F8 
    db $F8 
    dw $2C30 

ProjectileFlareSpritemaps_S_SI_SW_SIW_2B:
    dw $0006,$01F8 
    db $F4 
    dw $6C30,$01F8 
    db $FC 
    dw $6C30,$01F8 
    db $04 
    dw $6C30,$0000 
    db $04 
    dw $6C30,$0000 
    db $FC 
    dw $6C30,$0000 
    db $F4 
    dw $6C30 

ProjectileFlareSpritemaps_S_SI_SW_SIW_2C:
    dw $0006,$01F8 
    db $EF 
    dw $6C30,$01F8 
    db $FC 
    dw $6C30,$01F8 
    db $09 
    dw $6C30,$0000 
    db $09 
    dw $6C30,$0000 
    db $FC 
    dw $6C30,$0000 
    db $EF 
    dw $6C30 

ProjectileFlareSpritemaps_S_SI_SW_SIW_2D:
    dw $0006,$01F8 
    db $ED 
    dw $6C30,$01F8 
    db $FC 
    dw $6C30,$01F8 
    db $0B 
    dw $6C30,$0000 
    db $0B 
    dw $6C30,$0000 
    db $FC 
    dw $6C30,$0000 
    db $ED 
    dw $6C30 

ProjectileFlareSpritemaps_S_SI_SW_SIW_2E:
    dw $0006,$01F8 
    db $EC 
    dw $6C30,$01F8 
    db $FC 
    dw $6C30,$01F8 
    db $0C 
    dw $6C30,$0000 
    db $0C 
    dw $6C30,$0000 
    db $FC 
    dw $6C30,$0000 
    db $EC 
    dw $6C30 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_0:
    dw $0004,$0008 
    db $FC 
    dw $2C34,$0000 
    db $FC 
    dw $2C34,$01F8 
    db $FC 
    dw $2C34,$01F0 
    db $FC 
    dw $2C34 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1:
    dw $000C,$0008 
    db $FC 
    dw $2C34,$0000 
    db $FC 
    dw $2C34,$01F8 
    db $FC 
    dw $2C34,$01F0 
    db $FC 
    dw $2C34,$0008 
    db $00 
    dw $2C34,$0000 
    db $00 
    dw $2C34,$01F8 
    db $00 
    dw $2C34,$01F0 
    db $00 
    dw $2C34,$0008 
    db $F8 
    dw $2C34,$0000 
    db $F8 
    dw $2C34,$01F8 
    db $F8 
    dw $2C34,$01F0 
    db $F8 
    dw $2C34 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2:
    dw $000C,$0008 
    db $04 
    dw $2C34,$0000 
    db $04 
    dw $2C34,$01F8 
    db $04 
    dw $2C34,$01F0 
    db $04 
    dw $2C34,$0008 
    db $FC 
    dw $2C34,$0000 
    db $FC 
    dw $2C34,$01F8 
    db $FC 
    dw $2C34,$01F0 
    db $FC 
    dw $2C34,$0008 
    db $F4 
    dw $2C34,$0000 
    db $F4 
    dw $2C34,$01F8 
    db $F4 
    dw $2C34,$01F0 
    db $F4 
    dw $2C34 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3:
    dw $000C,$0008 
    db $09 
    dw $2C34,$0000 
    db $09 
    dw $2C34,$01F8 
    db $09 
    dw $2C34,$01F0 
    db $09 
    dw $2C34,$0008 
    db $FC 
    dw $2C34,$0000 
    db $FC 
    dw $2C34,$01F8 
    db $FC 
    dw $2C34,$01F0 
    db $FC 
    dw $2C34,$0008 
    db $EF 
    dw $2C34,$0000 
    db $EF 
    dw $2C34,$01F8 
    db $EF 
    dw $2C34,$01F0 
    db $EF 
    dw $2C34 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4:
    dw $000C,$0008 
    db $0B 
    dw $2C34,$0000 
    db $0B 
    dw $2C34,$01F8 
    db $0B 
    dw $2C34,$01F0 
    db $0B 
    dw $2C34,$0008 
    db $FC 
    dw $2C34,$0000 
    db $FC 
    dw $2C34,$01F8 
    db $FC 
    dw $2C34,$01F0 
    db $FC 
    dw $2C34,$0008 
    db $ED 
    dw $2C34,$0000 
    db $ED 
    dw $2C34,$01F8 
    db $ED 
    dw $2C34,$01F0 
    db $ED 
    dw $2C34 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5:
    dw $000C,$0008 
    db $0C 
    dw $2C34,$0000 
    db $0C 
    dw $2C34,$01F8 
    db $0C 
    dw $2C34,$01F0 
    db $0C 
    dw $2C34,$0008 
    db $FC 
    dw $2C34,$0000 
    db $FC 
    dw $2C34,$01F8 
    db $FC 
    dw $2C34,$01F0 
    db $FC 
    dw $2C34,$0008 
    db $EC 
    dw $2C34,$0000 
    db $EC 
    dw $2C34,$01F8 
    db $EC 
    dw $2C34,$01F0 
    db $EC 
    dw $2C34 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_6:
    dw $0004,$01FC 
    db $F0 
    dw $2C37,$01FC 
    db $08 
    dw $2C37,$01FC 
    db $00 
    dw $2C37,$01FC 
    db $F8 
    dw $2C37 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_7:
    dw $000C,$01FC 
    db $F0 
    dw $2C37,$01FC 
    db $F8 
    dw $2C37,$01FC 
    db $00 
    dw $2C37,$01FC 
    db $08 
    dw $2C37,$0000 
    db $08 
    dw $2C37,$0000 
    db $00 
    dw $2C37,$0000 
    db $F8 
    dw $2C37,$0000 
    db $F0 
    dw $2C37,$01F8 
    db $F0 
    dw $2C37,$01F8 
    db $08 
    dw $2C37,$01F8 
    db $00 
    dw $2C37,$01F8 
    db $F8 
    dw $2C37 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_8:
    dw $000C,$0008 
    db $08 
    dw $2C37,$0008 
    db $00 
    dw $2C37,$0008 
    db $F8 
    dw $2C37,$0008 
    db $F0 
    dw $2C37,$01F0 
    db $08 
    dw $2C37,$01F0 
    db $00 
    dw $2C37,$01F0 
    db $F8 
    dw $2C37,$01F0 
    db $F0 
    dw $2C37,$01FC 
    db $08 
    dw $2C37,$01FC 
    db $00 
    dw $2C37,$01FC 
    db $F8 
    dw $2C37,$01FC 
    db $F0 
    dw $2C37 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_9:
    dw $000C,$000D 
    db $08 
    dw $2C37,$000D 
    db $00 
    dw $2C37,$000D 
    db $F8 
    dw $2C37,$000D 
    db $F0 
    dw $2C37,$01EB 
    db $08 
    dw $2C37,$01EB 
    db $00 
    dw $2C37,$01EB 
    db $F8 
    dw $2C37,$01EB 
    db $F0 
    dw $2C37,$01FC 
    db $08 
    dw $2C37,$01FC 
    db $00 
    dw $2C37,$01FC 
    db $F8 
    dw $2C37,$01FC 
    db $F0 
    dw $2C37 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_A:
    dw $000C,$000F 
    db $08 
    dw $2C37,$000F 
    db $00 
    dw $2C37,$000F 
    db $F8 
    dw $2C37,$000F 
    db $F0 
    dw $2C37,$01E9 
    db $08 
    dw $2C37,$01E9 
    db $00 
    dw $2C37,$01E9 
    db $F8 
    dw $2C37,$01E9 
    db $F0 
    dw $2C37,$01FC 
    db $08 
    dw $2C37,$01FC 
    db $00 
    dw $2C37,$01FC 
    db $F8 
    dw $2C37,$01FC 
    db $F0 
    dw $2C37 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_B:
    dw $000C,$0010 
    db $08 
    dw $2C37,$0010 
    db $00 
    dw $2C37,$0010 
    db $F8 
    dw $2C37,$0010 
    db $F0 
    dw $2C37,$01E8 
    db $08 
    dw $2C37,$01E8 
    db $00 
    dw $2C37,$01E8 
    db $F8 
    dw $2C37,$01E8 
    db $F0 
    dw $2C37,$01FC 
    db $08 
    dw $2C37,$01FC 
    db $00 
    dw $2C37,$01FC 
    db $F8 
    dw $2C37,$01FC 
    db $F0 
    dw $2C37 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_C:
    dw $0006,$0004 
    db $08 
    dw $EC36,$01F4 
    db $F0 
    dw $2C36,$01FC 
    db $F8 
    dw $EC35,$0004 
    db $00 
    dw $EC35,$01FC 
    db $00 
    dw $2C35,$01F4 
    db $F8 
    dw $2C35 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_D:
    dw $0012,$0004 
    db $08 
    dw $EC36,$01F4 
    db $F0 
    dw $2C36,$01FC 
    db $F8 
    dw $EC35,$0004 
    db $00 
    dw $EC35,$01FC 
    db $00 
    dw $2C35,$01F4 
    db $F8 
    dw $2C35,$0006 
    db $05 
    dw $EC36,$01F6 
    db $ED 
    dw $2C36,$01FE 
    db $F5 
    dw $EC35,$0006 
    db $FD 
    dw $EC35,$01FE 
    db $FD 
    dw $2C35,$01F6 
    db $F5 
    dw $2C35,$0002 
    db $0B 
    dw $EC36,$01F2 
    db $F3 
    dw $2C36,$01FA 
    db $FB 
    dw $EC35,$0002 
    db $03 
    dw $EC35,$01FA 
    db $03 
    dw $2C35,$01F2 
    db $FB 
    dw $2C35 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_E:
    dw $0012,$0004 
    db $08 
    dw $EC36,$01F4 
    db $F0 
    dw $2C36,$01FC 
    db $F8 
    dw $EC35,$0004 
    db $00 
    dw $EC35,$01FC 
    db $00 
    dw $2C35,$01F4 
    db $F8 
    dw $2C35,$01FE 
    db $0F 
    dw $EC36,$01EE 
    db $F7 
    dw $2C36,$01F6 
    db $FF 
    dw $EC35,$01FE 
    db $07 
    dw $EC35,$01F6 
    db $07 
    dw $2C35,$01EE 
    db $FF 
    dw $2C35,$000A 
    db $01 
    dw $EC36,$01FA 
    db $E9 
    dw $2C36,$0002 
    db $F1 
    dw $EC35,$000A 
    db $F9 
    dw $EC35,$0002 
    db $F9 
    dw $2C35,$01FA 
    db $F1 
    dw $2C35 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_F:
    dw $0012,$0004 
    db $08 
    dw $EC36,$01F4 
    db $F0 
    dw $2C36,$01FC 
    db $F8 
    dw $EC35,$0004 
    db $00 
    dw $EC35,$01FC 
    db $00 
    dw $2C35,$01F4 
    db $F8 
    dw $2C35,$01FB 
    db $12 
    dw $EC36,$01EB 
    db $FA 
    dw $2C36,$01F3 
    db $02 
    dw $EC35,$01FB 
    db $0A 
    dw $EC35,$01F3 
    db $0A 
    dw $2C35,$01EB 
    db $02 
    dw $2C35,$000D 
    db $FE 
    dw $EC36,$01FD 
    db $E6 
    dw $2C36,$0005 
    db $EE 
    dw $EC35,$000D 
    db $F6 
    dw $EC35,$0005 
    db $F6 
    dw $2C35,$01FD 
    db $EE 
    dw $2C35 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_10:
    dw $0012,$0004 
    db $08 
    dw $EC36,$01F4 
    db $F0 
    dw $2C36,$01FC 
    db $F8 
    dw $EC35,$0004 
    db $00 
    dw $EC35,$01FC 
    db $00 
    dw $2C35,$01F4 
    db $F8 
    dw $2C35,$01F7 
    db $17 
    dw $EC36,$01E7 
    db $FF 
    dw $2C36,$01EF 
    db $07 
    dw $EC35,$01F7 
    db $0F 
    dw $EC35,$01EF 
    db $0F 
    dw $2C35,$01E7 
    db $07 
    dw $2C35,$0011 
    db $F9 
    dw $EC36,$0001 
    db $E1 
    dw $2C36,$0009 
    db $E9 
    dw $EC35,$0011 
    db $F1 
    dw $EC35,$0009 
    db $F1 
    dw $2C35,$0001 
    db $E9 
    dw $2C35 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_11:
    dw $0012,$0004 
    db $08 
    dw $EC36,$01F4 
    db $F0 
    dw $2C36,$01FC 
    db $F8 
    dw $EC35,$0004 
    db $00 
    dw $EC35,$01FC 
    db $00 
    dw $2C35,$01F4 
    db $F8 
    dw $2C35,$01F6 
    db $17 
    dw $EC36,$01E6 
    db $FF 
    dw $2C36,$01EE 
    db $07 
    dw $EC35,$01F6 
    db $0F 
    dw $EC35,$01EE 
    db $0F 
    dw $2C35,$01E6 
    db $07 
    dw $2C35,$0012 
    db $F9 
    dw $EC36,$0002 
    db $E1 
    dw $2C36,$000A 
    db $E9 
    dw $EC35,$0012 
    db $F1 
    dw $EC35,$000A 
    db $F1 
    dw $2C35,$0002 
    db $E9 
    dw $2C35 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_12:
    dw $0006,$01F4 
    db $08 
    dw $AC36,$0004 
    db $F0 
    dw $6C36,$01FC 
    db $F8 
    dw $AC35,$01F4 
    db $00 
    dw $AC35,$01FC 
    db $00 
    dw $6C35,$0004 
    db $F8 
    dw $6C35 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_13:
    dw $0012,$01F4 
    db $08 
    dw $AC36,$0004 
    db $F0 
    dw $6C36,$01FC 
    db $F8 
    dw $AC35,$01F4 
    db $00 
    dw $AC35,$01FC 
    db $00 
    dw $6C35,$0004 
    db $F8 
    dw $6C35,$01F2 
    db $06 
    dw $AC36,$0002 
    db $EE 
    dw $6C36,$01FA 
    db $F6 
    dw $AC35,$01F2 
    db $FE 
    dw $AC35,$01FA 
    db $FE 
    dw $6C35,$0002 
    db $F6 
    dw $6C35,$01F6 
    db $0B 
    dw $AC36,$0006 
    db $F3 
    dw $6C36,$01FE 
    db $FB 
    dw $AC35,$01F6 
    db $03 
    dw $AC35,$01FE 
    db $03 
    dw $6C35,$0006 
    db $FB 
    dw $6C35 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_14:
    dw $0012,$01F4 
    db $08 
    dw $AC36,$0004 
    db $F0 
    dw $6C36,$01FC 
    db $F8 
    dw $AC35,$01F4 
    db $00 
    dw $AC35,$01FC 
    db $00 
    dw $6C35,$0004 
    db $F8 
    dw $6C35,$01FA 
    db $0F 
    dw $AC36,$000A 
    db $F7 
    dw $6C36,$0002 
    db $FF 
    dw $AC35,$01FA 
    db $07 
    dw $AC35,$0002 
    db $07 
    dw $6C35,$000A 
    db $FF 
    dw $6C35,$01EE 
    db $01 
    dw $AC36,$01FE 
    db $E9 
    dw $6C36,$01F6 
    db $F1 
    dw $AC35,$01EE 
    db $F9 
    dw $AC35,$01F6 
    db $F9 
    dw $6C35,$01FE 
    db $F1 
    dw $6C35 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_15:
    dw $0012,$01F4 
    db $08 
    dw $AC36,$0004 
    db $F0 
    dw $6C36,$01FC 
    db $F8 
    dw $AC35,$01F4 
    db $00 
    dw $AC35,$01FC 
    db $00 
    dw $6C35,$0004 
    db $F8 
    dw $6C35,$01FD 
    db $12 
    dw $AC36,$000D 
    db $FA 
    dw $6C36,$0005 
    db $02 
    dw $AC35,$01FD 
    db $0A 
    dw $AC35,$0005 
    db $0A 
    dw $6C35,$000D 
    db $02 
    dw $6C35,$01EB 
    db $FE 
    dw $AC36,$01FB 
    db $E6 
    dw $6C36,$01F3 
    db $EE 
    dw $AC35,$01EB 
    db $F6 
    dw $AC35,$01F3 
    db $F6 
    dw $6C35,$01FB 
    db $EE 
    dw $6C35 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_16:
    dw $0012,$01F4 
    db $08 
    dw $AC36,$0004 
    db $F0 
    dw $6C36,$01FC 
    db $F8 
    dw $AC35,$01F4 
    db $00 
    dw $AC35,$01FC 
    db $00 
    dw $6C35,$0004 
    db $F8 
    dw $6C35,$0001 
    db $16 
    dw $AC36,$0011 
    db $FE 
    dw $6C36,$0009 
    db $06 
    dw $AC35,$0001 
    db $0E 
    dw $AC35,$0009 
    db $0E 
    dw $6C35,$0011 
    db $06 
    dw $6C35,$01E7 
    db $FA 
    dw $AC36,$01F7 
    db $E2 
    dw $6C36,$01EF 
    db $EA 
    dw $AC35,$01E7 
    db $F2 
    dw $AC35,$01EF 
    db $F2 
    dw $6C35,$01F7 
    db $EA 
    dw $6C35 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_17:
    dw $0012,$01F4 
    db $08 
    dw $AC36,$0004 
    db $F0 
    dw $6C36,$01FC 
    db $F8 
    dw $AC35,$01F4 
    db $00 
    dw $AC35,$01FC 
    db $00 
    dw $6C35,$0004 
    db $F8 
    dw $6C35,$0002 
    db $17 
    dw $AC36,$0012 
    db $FF 
    dw $6C36,$000A 
    db $07 
    dw $AC35,$0002 
    db $0F 
    dw $AC35,$000A 
    db $0F 
    dw $6C35,$0012 
    db $07 
    dw $6C35,$01E6 
    db $F9 
    dw $AC36,$01F6 
    db $E1 
    dw $6C36,$01EE 
    db $E9 
    dw $AC35,$01E6 
    db $F1 
    dw $AC35,$01EE 
    db $F1 
    dw $6C35,$01F6 
    db $E9 
    dw $6C35 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_18:
    dw $0006,$01FE 
    db $F4 
    dw $6C32,$0006 
    db $F4 
    dw $6C31,$01EE 
    db $04 
    dw $6C32,$01F6 
    db $04 
    dw $6C31,$01F6 
    db $FC 
    dw $6C32,$01FE 
    db $FC 
    dw $6C31 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_19:
    dw $0012,$01F8 
    db $EE 
    dw $6C32,$0000 
    db $EE 
    dw $6C31,$01FE 
    db $F4 
    dw $6C32,$0006 
    db $F4 
    dw $6C31,$0004 
    db $FA 
    dw $6C32,$000C 
    db $FA 
    dw $6C31,$01EE 
    db $04 
    dw $6C32,$01F6 
    db $04 
    dw $6C31,$01F6 
    db $FC 
    dw $6C32,$01FE 
    db $FC 
    dw $6C31,$01E8 
    db $FE 
    dw $6C32,$01F0 
    db $FE 
    dw $6C31,$01F0 
    db $F6 
    dw $6C32,$01F8 
    db $F6 
    dw $6C31,$01F4 
    db $0A 
    dw $6C32,$01FC 
    db $0A 
    dw $6C31,$01FC 
    db $02 
    dw $6C32,$0004 
    db $02 
    dw $6C31 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1A:
    dw $0012,$0007 
    db $FD 
    dw $6C32,$000F 
    db $FD 
    dw $6C31,$01FE 
    db $F4 
    dw $6C32,$0006 
    db $F4 
    dw $6C31,$01F5 
    db $EB 
    dw $6C32,$01FD 
    db $EB 
    dw $6C31,$01EE 
    db $04 
    dw $6C32,$01F6 
    db $04 
    dw $6C31,$01F6 
    db $FC 
    dw $6C32,$01FE 
    db $FC 
    dw $6C31,$01E5 
    db $FB 
    dw $6C32,$01ED 
    db $FB 
    dw $6C31,$01ED 
    db $F3 
    dw $6C32,$01F5 
    db $F3 
    dw $6C31,$01F7 
    db $0D 
    dw $6C32,$01FF 
    db $0D 
    dw $6C31,$01FF 
    db $05 
    dw $6C32,$0007 
    db $05 
    dw $6C31 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1B:
    dw $0012,$0009 
    db $FF 
    dw $6C32,$0011 
    db $FF 
    dw $6C31,$01F3 
    db $E9 
    dw $6C32,$01FB 
    db $E9 
    dw $6C31,$01FE 
    db $F4 
    dw $6C32,$0006 
    db $F4 
    dw $6C31,$01EE 
    db $04 
    dw $6C32,$01F6 
    db $04 
    dw $6C31,$01F6 
    db $FC 
    dw $6C32,$01FE 
    db $FC 
    dw $6C31,$01E3 
    db $F9 
    dw $6C32,$01EB 
    db $F9 
    dw $6C31,$01EB 
    db $F1 
    dw $6C32,$01F3 
    db $F1 
    dw $6C31,$01F9 
    db $0F 
    dw $6C32,$0001 
    db $0F 
    dw $6C31,$0001 
    db $07 
    dw $6C32,$0009 
    db $07 
    dw $6C31 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1C:
    dw $0012,$01F2 
    db $E8 
    dw $6C32,$01FA 
    db $E8 
    dw $6C31,$000A 
    db $00 
    dw $6C32,$0012 
    db $00 
    dw $6C31,$01FE 
    db $F4 
    dw $6C32,$0006 
    db $F4 
    dw $6C31,$01EE 
    db $04 
    dw $6C32,$01F6 
    db $04 
    dw $6C31,$01F6 
    db $FC 
    dw $6C32,$01FE 
    db $FC 
    dw $6C31,$01E2 
    db $F8 
    dw $6C32,$01EA 
    db $F8 
    dw $6C31,$01EA 
    db $F0 
    dw $6C32,$01F2 
    db $F0 
    dw $6C31,$01FA 
    db $10 
    dw $6C32,$0002 
    db $10 
    dw $6C31,$0002 
    db $08 
    dw $6C32,$000A 
    db $08 
    dw $6C31 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1D:
    dw $0012,$0000 
    db $F7 
    dw $6C32,$0008 
    db $F7 
    dw $6C31,$01FE 
    db $F4 
    dw $6C32,$0006 
    db $F4 
    dw $6C31,$01FB 
    db $F2 
    dw $6C32,$0003 
    db $F2 
    dw $6C31,$01EB 
    db $02 
    dw $6C32,$01F3 
    db $02 
    dw $6C31,$01F3 
    db $FA 
    dw $6C32,$01FB 
    db $FA 
    dw $6C31,$01F0 
    db $07 
    dw $6C32,$01F8 
    db $07 
    dw $6C31,$01F8 
    db $FF 
    dw $6C32,$0000 
    db $FF 
    dw $6C31,$01EE 
    db $04 
    dw $6C32,$01F6 
    db $04 
    dw $6C31,$01F6 
    db $FC 
    dw $6C32,$01FE 
    db $FC 
    dw $6C31 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1E:
    dw $0006,$01FE 
    db $04 
    dw $EC32,$0006 
    db $04 
    dw $EC31,$01EE 
    db $F4 
    dw $EC32,$01F6 
    db $F4 
    dw $EC31,$01F6 
    db $FC 
    dw $EC32,$01FE 
    db $FC 
    dw $EC31 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1F:
    dw $0012,$0004 
    db $FE 
    dw $EC32,$000C 
    db $FE 
    dw $EC31,$01FE 
    db $04 
    dw $EC32,$0006 
    db $04 
    dw $EC31,$01F8 
    db $0A 
    dw $EC32,$0000 
    db $0A 
    dw $EC31,$01EE 
    db $F4 
    dw $EC32,$01F6 
    db $F4 
    dw $EC31,$01F6 
    db $FC 
    dw $EC32,$01FE 
    db $FC 
    dw $EC31,$01E8 
    db $FA 
    dw $EC32,$01F0 
    db $FA 
    dw $EC31,$01F0 
    db $02 
    dw $EC32,$01F8 
    db $02 
    dw $EC31,$01F4 
    db $EE 
    dw $EC32,$01FC 
    db $EE 
    dw $EC31,$01FC 
    db $F6 
    dw $EC32,$0004 
    db $F6 
    dw $EC31 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_20:
    dw $0012,$01F5 
    db $0D 
    dw $EC32,$01FD 
    db $0D 
    dw $EC31,$0007 
    db $FB 
    dw $EC32,$000F 
    db $FB 
    dw $EC31,$01FE 
    db $04 
    dw $EC32,$0006 
    db $04 
    dw $EC31,$01EE 
    db $F4 
    dw $EC32,$01F6 
    db $F4 
    dw $EC31,$01F6 
    db $FC 
    dw $EC32,$01FE 
    db $FC 
    dw $EC31,$01E5 
    db $FD 
    dw $EC32,$01ED 
    db $FD 
    dw $EC31,$01ED 
    db $05 
    dw $EC32,$01F5 
    db $05 
    dw $EC31,$01F7 
    db $EB 
    dw $EC32,$01FF 
    db $EB 
    dw $EC31,$01FF 
    db $F3 
    dw $EC32,$0007 
    db $F3 
    dw $EC31 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_21:
    dw $0012,$01F3 
    db $0F 
    dw $EC32,$01FB 
    db $0F 
    dw $EC31,$0009 
    db $F9 
    dw $EC32,$0011 
    db $F9 
    dw $EC31,$01FE 
    db $04 
    dw $EC32,$0006 
    db $04 
    dw $EC31,$01EE 
    db $F4 
    dw $EC32,$01F6 
    db $F4 
    dw $EC31,$01F6 
    db $FC 
    dw $EC32,$01FE 
    db $FC 
    dw $EC31,$01E3 
    db $FF 
    dw $EC32,$01EB 
    db $FF 
    dw $EC31,$01EB 
    db $07 
    dw $EC32,$01F3 
    db $07 
    dw $EC31,$01F9 
    db $E9 
    dw $EC32,$0001 
    db $E9 
    dw $EC31,$0001 
    db $F1 
    dw $EC32,$0009 
    db $F1 
    dw $EC31 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_22:
    dw $0012,$01F2 
    db $10 
    dw $EC32,$01FA 
    db $10 
    dw $EC31,$01FE 
    db $04 
    dw $EC32,$0006 
    db $04 
    dw $EC31,$000A 
    db $F8 
    dw $EC32,$0012 
    db $F8 
    dw $EC31,$01EE 
    db $F4 
    dw $EC32,$01F6 
    db $F4 
    dw $EC31,$01F6 
    db $FC 
    dw $EC32,$01FE 
    db $FC 
    dw $EC31,$01E2 
    db $00 
    dw $EC32,$01EA 
    db $00 
    dw $EC31,$01EA 
    db $08 
    dw $EC32,$01F2 
    db $08 
    dw $EC31,$01FA 
    db $E8 
    dw $EC32,$0002 
    db $E8 
    dw $EC31,$0002 
    db $F0 
    dw $EC32,$000A 
    db $F0 
    dw $EC31 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_23:
    dw $0012,$01FE 
    db $04 
    dw $EC32,$0006 
    db $04 
    dw $EC31,$0000 
    db $01 
    dw $EC32,$0008 
    db $01 
    dw $EC31,$01FB 
    db $06 
    dw $EC32,$0003 
    db $06 
    dw $EC31,$01EB 
    db $F6 
    dw $EC32,$01F3 
    db $F6 
    dw $EC31,$01F3 
    db $FE 
    dw $EC32,$01FB 
    db $FE 
    dw $EC31,$01F0 
    db $F1 
    dw $EC32,$01F8 
    db $F1 
    dw $EC31,$01F8 
    db $F9 
    dw $EC32,$0000 
    db $F9 
    dw $EC31,$01EE 
    db $F4 
    dw $EC32,$01F6 
    db $F4 
    dw $EC31,$01F6 
    db $FC 
    dw $EC32,$01FE 
    db $FC 
    dw $EC31 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_24:
    dw $0006,$01FA 
    db $04 
    dw $AC32,$01F2 
    db $04 
    dw $AC31,$000A 
    db $F4 
    dw $AC32,$0002 
    db $F4 
    dw $AC31,$0002 
    db $FC 
    dw $AC32,$01FA 
    db $FC 
    dw $AC31 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_25:
    dw $0012,$01F4 
    db $FE 
    dw $AC32,$01EC 
    db $FE 
    dw $AC31,$01FA 
    db $04 
    dw $AC32,$01F2 
    db $04 
    dw $AC31,$0000 
    db $0A 
    dw $AC32,$01F8 
    db $0A 
    dw $AC31,$000A 
    db $F4 
    dw $AC32,$0002 
    db $F4 
    dw $AC31,$0002 
    db $FC 
    dw $AC32,$01FA 
    db $FC 
    dw $AC31,$0010 
    db $FA 
    dw $AC32,$0008 
    db $FA 
    dw $AC31,$0008 
    db $02 
    dw $AC32,$0000 
    db $02 
    dw $AC31,$0004 
    db $EE 
    dw $AC32,$01FC 
    db $EE 
    dw $AC31,$01FC 
    db $F6 
    dw $AC32,$01F4 
    db $F6 
    dw $AC31 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_26:
    dw $0012,$0003 
    db $0D 
    dw $AC32,$01FB 
    db $0D 
    dw $AC31,$01FA 
    db $04 
    dw $AC32,$01F2 
    db $04 
    dw $AC31,$01F1 
    db $FB 
    dw $AC32,$01E9 
    db $FB 
    dw $AC31,$000A 
    db $F4 
    dw $AC32,$0002 
    db $F4 
    dw $AC31,$0002 
    db $FC 
    dw $AC32,$01FA 
    db $FC 
    dw $AC31,$0013 
    db $FD 
    dw $AC32,$000B 
    db $FD 
    dw $AC31,$000B 
    db $05 
    dw $AC32,$0003 
    db $05 
    dw $AC31,$0001 
    db $EB 
    dw $AC32,$01F9 
    db $EB 
    dw $AC31,$01F9 
    db $F3 
    dw $AC32,$01F1 
    db $F3 
    dw $AC31 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_27:
    dw $0012,$0005 
    db $0F 
    dw $AC32,$01FD 
    db $0F 
    dw $AC31,$01FA 
    db $04 
    dw $AC32,$01F2 
    db $04 
    dw $AC31,$01EF 
    db $F9 
    dw $AC32,$01E7 
    db $F9 
    dw $AC31,$000A 
    db $F4 
    dw $AC32,$0002 
    db $F4 
    dw $AC31,$0002 
    db $FC 
    dw $AC32,$01FA 
    db $FC 
    dw $AC31,$0015 
    db $FF 
    dw $AC32,$000D 
    db $FF 
    dw $AC31,$000D 
    db $07 
    dw $AC32,$0005 
    db $07 
    dw $AC31,$01FF 
    db $E9 
    dw $AC32,$01F7 
    db $E9 
    dw $AC31,$01F7 
    db $F1 
    dw $AC32,$01EF 
    db $F1 
    dw $AC31 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_28:
    dw $0012,$01EE 
    db $F8 
    dw $AC32,$01E6 
    db $F8 
    dw $AC31,$0006 
    db $10 
    dw $AC32,$01FE 
    db $10 
    dw $AC31,$01FA 
    db $04 
    dw $AC32,$01F2 
    db $04 
    dw $AC31,$000A 
    db $F4 
    dw $AC32,$0002 
    db $F4 
    dw $AC31,$0002 
    db $FC 
    dw $AC32,$01FA 
    db $FC 
    dw $AC31,$0016 
    db $00 
    dw $AC32,$000E 
    db $00 
    dw $AC31,$000E 
    db $08 
    dw $AC32,$0006 
    db $08 
    dw $AC31,$01FE 
    db $E8 
    dw $AC32,$01F6 
    db $E8 
    dw $AC31,$01F6 
    db $F0 
    dw $AC32,$01EE 
    db $F0 
    dw $AC31 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_29:
    dw $0012,$01F8 
    db $01 
    dw $AC32,$01F0 
    db $01 
    dw $AC31,$01FA 
    db $04 
    dw $AC32,$01F2 
    db $04 
    dw $AC31,$01FD 
    db $06 
    dw $AC32,$01F5 
    db $06 
    dw $AC31,$000D 
    db $F6 
    dw $AC32,$0005 
    db $F6 
    dw $AC31,$0005 
    db $FE 
    dw $AC32,$01FD 
    db $FE 
    dw $AC31,$0008 
    db $F1 
    dw $AC32,$0000 
    db $F1 
    dw $AC31,$0000 
    db $F9 
    dw $AC32,$01F8 
    db $F9 
    dw $AC31,$000A 
    db $F4 
    dw $AC32,$0002 
    db $F4 
    dw $AC31,$0002 
    db $FC 
    dw $AC32,$01FA 
    db $FC 
    dw $AC31 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2A:
    dw $0006,$000A 
    db $04 
    dw $2C32,$0002 
    db $04 
    dw $2C31,$0002 
    db $FC 
    dw $2C32,$01FA 
    db $FC 
    dw $2C31,$01FA 
    db $F4 
    dw $2C32,$01F2 
    db $F4 
    dw $2C31 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2B:
    dw $0012,$0004 
    db $0A 
    dw $2C32,$01FC 
    db $0A 
    dw $2C31,$000A 
    db $04 
    dw $2C32,$0002 
    db $04 
    dw $2C31,$0010 
    db $FE 
    dw $2C32,$0008 
    db $FE 
    dw $2C31,$0002 
    db $FC 
    dw $2C32,$01FA 
    db $FC 
    dw $2C31,$01FA 
    db $F4 
    dw $2C32,$01F2 
    db $F4 
    dw $2C31,$0008 
    db $F6 
    dw $2C32,$0000 
    db $F6 
    dw $2C31,$0000 
    db $EE 
    dw $2C32,$01F8 
    db $EE 
    dw $2C31,$01FC 
    db $02 
    dw $2C32,$01F4 
    db $02 
    dw $2C31,$01F4 
    db $FA 
    dw $2C32,$01EC 
    db $FA 
    dw $2C31 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2C:
    dw $0012,$0001 
    db $0D 
    dw $2C32,$01F9 
    db $0D 
    dw $2C31,$000A 
    db $04 
    dw $2C32,$0002 
    db $04 
    dw $2C31,$0013 
    db $FB 
    dw $2C32,$000B 
    db $FB 
    dw $2C31,$0002 
    db $FC 
    dw $2C32,$01FA 
    db $FC 
    dw $2C31,$01FA 
    db $F4 
    dw $2C32,$01F2 
    db $F4 
    dw $2C31,$000B 
    db $F3 
    dw $2C32,$0003 
    db $F3 
    dw $2C31,$0003 
    db $EB 
    dw $2C32,$01FB 
    db $EB 
    dw $2C31,$01F9 
    db $05 
    dw $2C32,$01F1 
    db $05 
    dw $2C31,$01F1 
    db $FD 
    dw $2C32,$01E9 
    db $FD 
    dw $2C31 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2D:
    dw $0012,$01FF 
    db $0F 
    dw $2C32,$01F7 
    db $0F 
    dw $2C31,$000A 
    db $04 
    dw $2C32,$0002 
    db $04 
    dw $2C31,$0015 
    db $F9 
    dw $2C32,$000D 
    db $F9 
    dw $2C31,$0002 
    db $FC 
    dw $2C32,$01FA 
    db $FC 
    dw $2C31,$01FA 
    db $F4 
    dw $2C32,$01F2 
    db $F4 
    dw $2C31,$000D 
    db $F1 
    dw $2C32,$0005 
    db $F1 
    dw $2C31,$0005 
    db $E9 
    dw $2C32,$01FD 
    db $E9 
    dw $2C31,$01F7 
    db $07 
    dw $2C32,$01EF 
    db $07 
    dw $2C31,$01EF 
    db $FF 
    dw $2C32,$01E7 
    db $FF 
    dw $2C31 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2E:
    dw $0012,$0016 
    db $F8 
    dw $2C32,$000E 
    db $F8 
    dw $2C31,$01FE 
    db $10 
    dw $2C32,$01F6 
    db $10 
    dw $2C31,$000A 
    db $04 
    dw $2C32,$0002 
    db $04 
    dw $2C31,$0002 
    db $FC 
    dw $2C32,$01FA 
    db $FC 
    dw $2C31,$01FA 
    db $F4 
    dw $2C32,$01F2 
    db $F4 
    dw $2C31,$000E 
    db $F0 
    dw $2C32,$0006 
    db $F0 
    dw $2C31,$0006 
    db $E8 
    dw $2C32,$01FE 
    db $E8 
    dw $2C31,$01F6 
    db $08 
    dw $2C32,$01EE 
    db $08 
    dw $2C31,$01EE 
    db $00 
    dw $2C32,$01E6 
    db $00 
    dw $2C31 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2F:
    dw $0012,$000D 
    db $02 
    dw $2C32,$0005 
    db $02 
    dw $2C31,$000A 
    db $04 
    dw $2C32,$0002 
    db $04 
    dw $2C31,$0008 
    db $07 
    dw $2C32,$0000 
    db $07 
    dw $2C31,$0005 
    db $FA 
    dw $2C32,$01FD 
    db $FA 
    dw $2C31,$01FD 
    db $F2 
    dw $2C32,$01F5 
    db $F2 
    dw $2C31,$0000 
    db $FF 
    dw $2C32,$01F8 
    db $FF 
    dw $2C31,$01F8 
    db $F7 
    dw $2C32,$01F0 
    db $F7 
    dw $2C31,$0002 
    db $FC 
    dw $2C32,$01FA 
    db $FC 
    dw $2C31,$01FA 
    db $F4 
    dw $2C32,$01F2 
    db $F4 
    dw $2C31 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_30:
    dw $0004,$01FC 
    db $F0 
    dw $AC33,$01FC 
    db $08 
    dw $AC33,$01FC 
    db $F8 
    dw $AC33,$01FC 
    db $00 
    dw $AC33 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_31:
    dw $000C,$01FC 
    db $F0 
    dw $AC33,$0000 
    db $F0 
    dw $AC33,$01F8 
    db $F0 
    dw $AC33,$01F8 
    db $08 
    dw $AC33,$0000 
    db $08 
    dw $AC33,$01FC 
    db $08 
    dw $AC33,$0000 
    db $F8 
    dw $AC33,$0000 
    db $00 
    dw $AC33,$01F8 
    db $F8 
    dw $AC33,$01F8 
    db $00 
    dw $AC33,$01FC 
    db $F8 
    dw $AC33,$01FC 
    db $00 
    dw $AC33 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_32:
    dw $000C,$01F4 
    db $08 
    dw $AC33,$01F4 
    db $F0 
    dw $AC33,$01F4 
    db $F8 
    dw $AC33,$01F4 
    db $00 
    dw $AC33,$0004 
    db $F0 
    dw $AC33,$0004 
    db $08 
    dw $AC33,$0004 
    db $F8 
    dw $AC33,$0004 
    db $00 
    dw $AC33,$01FC 
    db $08 
    dw $AC33,$01FC 
    db $F0 
    dw $AC33,$01FC 
    db $F8 
    dw $AC33,$01FC 
    db $00 
    dw $AC33 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_33:
    dw $000C,$0009 
    db $F0 
    dw $AC33,$0009 
    db $08 
    dw $AC33,$01FC 
    db $08 
    dw $AC33,$01EF 
    db $08 
    dw $AC33,$01EF 
    db $F0 
    dw $AC33,$01FC 
    db $F0 
    dw $AC33,$0009 
    db $F8 
    dw $AC33,$0009 
    db $00 
    dw $AC33,$01EF 
    db $F8 
    dw $AC33,$01EF 
    db $00 
    dw $AC33,$01FC 
    db $F8 
    dw $AC33,$01FC 
    db $00 
    dw $AC33 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_34:
    dw $000C,$000B 
    db $F0 
    dw $AC33,$01ED 
    db $F0 
    dw $AC33,$01FC 
    db $F0 
    dw $AC33,$000B 
    db $08 
    dw $AC33,$01ED 
    db $08 
    dw $AC33,$01FC 
    db $08 
    dw $AC33,$000B 
    db $F8 
    dw $AC33,$000B 
    db $00 
    dw $AC33,$01ED 
    db $F8 
    dw $AC33,$01ED 
    db $00 
    dw $AC33,$01FC 
    db $F8 
    dw $AC33,$01FC 
    db $00 
    dw $AC33 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_35:
    dw $000C,$000C 
    db $08 
    dw $AC33,$01EC 
    db $08 
    dw $AC33,$01FC 
    db $08 
    dw $AC33,$000C 
    db $F0 
    dw $AC33,$01EC 
    db $F0 
    dw $AC33,$01FC 
    db $F0 
    dw $AC33,$000C 
    db $F8 
    dw $AC33,$000C 
    db $00 
    dw $AC33,$01EC 
    db $F8 
    dw $AC33,$01EC 
    db $00 
    dw $AC33,$01FC 
    db $F8 
    dw $AC33,$01FC 
    db $00 
    dw $AC33 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_36:
    dw $0004,$01F0 
    db $FC 
    dw $2C30,$0008 
    db $FC 
    dw $2C30,$0000 
    db $FC 
    dw $2C30,$01F8 
    db $FC 
    dw $2C30 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_37:
    dw $000C,$01F0 
    db $00 
    dw $2C30,$01F0 
    db $FC 
    dw $2C30,$01F0 
    db $F8 
    dw $2C30,$0008 
    db $00 
    dw $2C30,$0008 
    db $FC 
    dw $2C30,$0008 
    db $F8 
    dw $2C30,$0000 
    db $00 
    dw $2C30,$01F8 
    db $00 
    dw $2C30,$0000 
    db $FC 
    dw $2C30,$01F8 
    db $FC 
    dw $2C30,$0000 
    db $F8 
    dw $2C30,$01F8 
    db $F8 
    dw $2C30 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_38:
    dw $000C,$01F0 
    db $FC 
    dw $2C30,$01F0 
    db $04 
    dw $2C30,$01F0 
    db $F4 
    dw $2C30,$0008 
    db $04 
    dw $2C30,$0008 
    db $FC 
    dw $2C30,$0008 
    db $F4 
    dw $2C30,$0000 
    db $F4 
    dw $2C30,$0000 
    db $FC 
    dw $2C30,$0000 
    db $04 
    dw $2C30,$01F8 
    db $04 
    dw $2C30,$01F8 
    db $FC 
    dw $2C30,$01F8 
    db $F4 
    dw $2C30 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_39:
    dw $000C,$01F0 
    db $EF 
    dw $2C30,$01F0 
    db $FC 
    dw $2C30,$01F0 
    db $09 
    dw $2C30,$0008 
    db $EF 
    dw $2C30,$0008 
    db $FC 
    dw $2C30,$0008 
    db $09 
    dw $2C30,$0000 
    db $EF 
    dw $2C30,$0000 
    db $FC 
    dw $2C30,$0000 
    db $09 
    dw $2C30,$01F8 
    db $09 
    dw $2C30,$01F8 
    db $FC 
    dw $2C30,$01F8 
    db $EF 
    dw $2C30 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3A:
    dw $000C,$0008 
    db $0B 
    dw $2C30,$01F0 
    db $0B 
    dw $2C30,$0008 
    db $ED 
    dw $2C30,$0008 
    db $FC 
    dw $2C30,$01F0 
    db $FC 
    dw $2C30,$01F0 
    db $ED 
    dw $2C30,$0000 
    db $ED 
    dw $2C30,$0000 
    db $FC 
    dw $2C30,$0000 
    db $0B 
    dw $2C30,$01F8 
    db $0B 
    dw $2C30,$01F8 
    db $FC 
    dw $2C30,$01F8 
    db $ED 
    dw $2C30 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3B:
    dw $000C,$01F0 
    db $EC 
    dw $2C30,$01F0 
    db $FC 
    dw $2C30,$01F0 
    db $0C 
    dw $2C30,$0008 
    db $EC 
    dw $2C30,$0008 
    db $FC 
    dw $2C30,$0008 
    db $0C 
    dw $2C30,$0000 
    db $EC 
    dw $2C30,$0000 
    db $FC 
    dw $2C30,$0000 
    db $0C 
    dw $2C30,$01F8 
    db $0C 
    dw $2C30,$01F8 
    db $FC 
    dw $2C30,$01F8 
    db $EC 
    dw $2C30 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3C:
    dw $0004,$01FC 
    db $08 
    dw $2C33,$01FC 
    db $F0 
    dw $2C33,$01FC 
    db $00 
    dw $2C33,$01FC 
    db $F8 
    dw $2C33 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3D:
    dw $000C,$01FC 
    db $08 
    dw $2C33,$01FC 
    db $F0 
    dw $2C33,$0000 
    db $08 
    dw $2C33,$01F8 
    db $08 
    dw $2C33,$0000 
    db $F0 
    dw $2C33,$01F8 
    db $F0 
    dw $2C33,$0000 
    db $00 
    dw $2C33,$0000 
    db $F8 
    dw $2C33,$01F8 
    db $00 
    dw $2C33,$01F8 
    db $F8 
    dw $2C33,$01FC 
    db $00 
    dw $2C33,$01FC 
    db $F8 
    dw $2C33 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3E:
    dw $000C,$0004 
    db $08 
    dw $2C33,$01F4 
    db $08 
    dw $2C33,$01FC 
    db $08 
    dw $2C33,$0004 
    db $F0 
    dw $2C33,$01F4 
    db $F0 
    dw $2C33,$01FC 
    db $F0 
    dw $2C33,$0004 
    db $00 
    dw $2C33,$0004 
    db $F8 
    dw $2C33,$01F4 
    db $00 
    dw $2C33,$01F4 
    db $F8 
    dw $2C33,$01FC 
    db $00 
    dw $2C33,$01FC 
    db $F8 
    dw $2C33 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3F:
    dw $000C,$0009 
    db $08 
    dw $2C33,$01EF 
    db $08 
    dw $2C33,$01FC 
    db $08 
    dw $2C33,$0009 
    db $F0 
    dw $2C33,$01EF 
    db $F0 
    dw $2C33,$01FC 
    db $F0 
    dw $2C33,$0009 
    db $00 
    dw $2C33,$0009 
    db $F8 
    dw $2C33,$01EF 
    db $00 
    dw $2C33,$01EF 
    db $F8 
    dw $2C33,$01FC 
    db $00 
    dw $2C33,$01FC 
    db $F8 
    dw $2C33 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_40:
    dw $000C,$000B 
    db $08 
    dw $2C33,$01ED 
    db $08 
    dw $2C33,$01FC 
    db $08 
    dw $2C33,$000B 
    db $F0 
    dw $2C33,$01ED 
    db $F0 
    dw $2C33,$01FC 
    db $F0 
    dw $2C33,$000B 
    db $00 
    dw $2C33,$000B 
    db $F8 
    dw $2C33,$01ED 
    db $00 
    dw $2C33,$01ED 
    db $F8 
    dw $2C33,$01FC 
    db $00 
    dw $2C33,$01FC 
    db $F8 
    dw $2C33 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_41:
    dw $000C,$01EC 
    db $08 
    dw $2C33,$01FC 
    db $08 
    dw $2C33,$000C 
    db $08 
    dw $2C33,$000C 
    db $F0 
    dw $2C33,$01FC 
    db $F0 
    dw $2C33,$01EC 
    db $F0 
    dw $2C33,$000C 
    db $00 
    dw $2C33,$000C 
    db $F8 
    dw $2C33,$01EC 
    db $00 
    dw $2C33,$01EC 
    db $F8 
    dw $2C33,$01FC 
    db $00 
    dw $2C33,$01FC 
    db $F8 
    dw $2C33 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_42:
    dw $0004,$01F0 
    db $FC 
    dw $6C30,$0008 
    db $FC 
    dw $6C30,$01F8 
    db $FC 
    dw $6C30,$0000 
    db $FC 
    dw $6C30 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_43:
    dw $000C,$01F0 
    db $00 
    dw $2C30,$01F0 
    db $FC 
    dw $2C30,$01F0 
    db $F8 
    dw $2C30,$0008 
    db $00 
    dw $2C30,$0008 
    db $FC 
    dw $2C30,$0008 
    db $F8 
    dw $2C30,$0000 
    db $00 
    dw $2C30,$01F8 
    db $00 
    dw $2C30,$0000 
    db $FC 
    dw $2C30,$01F8 
    db $FC 
    dw $2C30,$0000 
    db $F8 
    dw $2C30,$01F8 
    db $F8 
    dw $2C30 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_44:
    dw $000C,$01F0 
    db $04 
    dw $6C30,$01F0 
    db $FC 
    dw $6C30,$01F0 
    db $F4 
    dw $6C30,$0008 
    db $04 
    dw $6C30,$0008 
    db $FC 
    dw $6C30,$0008 
    db $F4 
    dw $6C30,$01F8 
    db $F4 
    dw $6C30,$01F8 
    db $FC 
    dw $6C30,$01F8 
    db $04 
    dw $6C30,$0000 
    db $04 
    dw $6C30,$0000 
    db $FC 
    dw $6C30,$0000 
    db $F4 
    dw $6C30 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_45:
    dw $000C,$01F0 
    db $09 
    dw $6C30,$01F0 
    db $FC 
    dw $6C30,$01F0 
    db $EF 
    dw $6C30,$0008 
    db $09 
    dw $6C30,$0008 
    db $FC 
    dw $6C30,$0008 
    db $EF 
    dw $6C30,$01F8 
    db $EF 
    dw $6C30,$01F8 
    db $FC 
    dw $6C30,$01F8 
    db $09 
    dw $6C30,$0000 
    db $09 
    dw $6C30,$0000 
    db $FC 
    dw $6C30,$0000 
    db $EF 
    dw $6C30 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_46:
    dw $000C,$01F0 
    db $0B 
    dw $6C30,$01F0 
    db $FC 
    dw $6C30,$01F0 
    db $ED 
    dw $6C30,$0008 
    db $0B 
    dw $6C30,$0008 
    db $FC 
    dw $6C30,$0008 
    db $ED 
    dw $6C30,$01F8 
    db $ED 
    dw $6C30,$01F8 
    db $FC 
    dw $6C30,$01F8 
    db $0B 
    dw $6C30,$0000 
    db $0B 
    dw $6C30,$0000 
    db $FC 
    dw $6C30,$0000 
    db $ED 
    dw $6C30 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_47:
    dw $000C,$01F0 
    db $0C 
    dw $6C30,$01F0 
    db $FC 
    dw $6C30,$01F0 
    db $EC 
    dw $6C30,$0008 
    db $0C 
    dw $6C30,$0008 
    db $FC 
    dw $6C30,$0008 
    db $EC 
    dw $6C30,$01F8 
    db $EC 
    dw $6C30,$01F8 
    db $FC 
    dw $6C30,$01F8 
    db $0C 
    dw $6C30,$0000 
    db $0C 
    dw $6C30,$0000 
    db $FC 
    dw $6C30,$0000 
    db $EC 
    dw $6C30 

ProjectileFlareSpritemaps_Charged_Power_0:
    dw $0004,$0000 
    db $F8 
    dw $6C33,$0000 
    db $00 
    dw $EC33,$01F8 
    db $00 
    dw $AC33,$01F8 
    db $F8 
    dw $2C33 

ProjectileFlareSpritemaps_Charged_Power_1:
    dw $0004,$0000 
    db $00 
    dw $EC33,$0000 
    db $F8 
    dw $6C33,$01F8 
    db $00 
    dw $AC33,$01F8 
    db $F8 
    dw $2C33 

ProjectileFlareSpritemaps_Charged_Power_2:
    dw $0004,$0000 
    db $00 
    dw $EC33,$0000 
    db $F8 
    dw $6C33,$01F8 
    db $00 
    dw $AC33,$01F8 
    db $F8 
    dw $2C33 

ProjectileFlareSpritemaps_Charged_Power_3:
    dw $0004,$0000 
    db $00 
    dw $EC33,$0000 
    db $F8 
    dw $6C33,$01F8 
    db $00 
    dw $AC33,$01F8 
    db $F8 
    dw $2C33 

ProjectileFlareSpritemaps_Charged_Power_4:
    dw $0004,$0000 
    db $00 
    dw $EC33,$0000 
    db $F8 
    dw $6C33,$01F8 
    db $00 
    dw $AC33,$01F8 
    db $F8 
    dw $2C33 

ProjectileFlareSpritemaps_Charged_Power_5:
    dw $0004,$0000 
    db $00 
    dw $EC33,$0000 
    db $F8 
    dw $6C33,$01F8 
    db $00 
    dw $AC33,$01F8 
    db $F8 
    dw $2C33 

ProjectileFlareSpritemaps_Charged_Power_6:
    dw $0004,$0000 
    db $00 
    dw $EC33,$0000 
    db $F8 
    dw $6C33,$01F8 
    db $00 
    dw $AC33,$01F8 
    db $F8 
    dw $2C33 

ProjectileFlareSpritemaps_Charged_Power_7:
    dw $0004,$0000 
    db $00 
    dw $EC33,$0000 
    db $F8 
    dw $6C33,$01F8 
    db $00 
    dw $AC33,$01F8 
    db $F8 
    dw $2C33 

ProjectileFlareSpritemaps_Charged_Power_8:
    dw $0004,$0000 
    db $00 
    dw $EC34,$0000 
    db $F8 
    dw $6C34,$01F8 
    db $00 
    dw $AC34,$01F8 
    db $F8 
    dw $2C34 

ProjectileFlareSpritemaps_Charged_Power_9:
    dw $0004,$0000 
    db $00 
    dw $EC34,$0000 
    db $F8 
    dw $6C34,$01F8 
    db $00 
    dw $AC34,$01F8 
    db $F8 
    dw $2C34 

ProjectileFlareSpritemaps_Charged_Power_A:
    dw $0004,$0000 
    db $00 
    dw $EC34,$0000 
    db $F8 
    dw $6C34,$01F8 
    db $00 
    dw $AC34,$01F8 
    db $F8 
    dw $2C34 

ProjectileFlareSpritemaps_Charged_Power_B:
    dw $0004,$0000 
    db $00 
    dw $EC34,$0000 
    db $F8 
    dw $6C34,$01F8 
    db $00 
    dw $AC34,$01F8 
    db $F8 
    dw $2C34 

ProjectileFlareSpritemaps_Charged_Power_C:
    dw $0004,$0000 
    db $00 
    dw $EC34,$0000 
    db $F8 
    dw $6C34,$01F8 
    db $00 
    dw $AC34,$01F8 
    db $F8 
    dw $2C34 

ProjectileFlareSpritemaps_Charged_Power_D:
    dw $0004,$0000 
    db $00 
    dw $EC34,$0000 
    db $F8 
    dw $6C34,$01F8 
    db $00 
    dw $AC34,$01F8 
    db $F8 
    dw $2C34 

ProjectileFlareSpritemaps_Charged_Power_E:
    dw $0004,$0000 
    db $00 
    dw $EC34,$0000 
    db $F8 
    dw $6C34,$01F8 
    db $00 
    dw $AC34,$01F8 
    db $F8 
    dw $2C34 

ProjectileFlareSpritemaps_Charged_Power_F:
    dw $0004,$0000 
    db $00 
    dw $EC34,$0000 
    db $F8 
    dw $6C34,$01F8 
    db $00 
    dw $AC34,$01F8 
    db $F8 
    dw $2C34 

ProjectileFlareSpritemaps_Charged_Ice_0:
    dw $0004,$0000 
    db $00 
    dw $EC33,$01F8 
    db $00 
    dw $AC33,$0000 
    db $F8 
    dw $6C33,$01F8 
    db $F8 
    dw $2C33 

ProjectileFlareSpritemaps_Charged_Ice_1:
    dw $0004,$0000 
    db $00 
    dw $EC34,$01F8 
    db $00 
    dw $AC34,$0000 
    db $F8 
    dw $6C34,$01F8 
    db $F8 
    dw $2C34 

ProjectileFlareSpritemaps_Charged_Ice_2:
    dw $0004,$0000 
    db $00 
    dw $EC33,$01F8 
    db $00 
    dw $AC33,$0000 
    db $F8 
    dw $6C33,$01F8 
    db $F8 
    dw $2C33 

ProjectileFlareSpritemaps_Charged_Ice_3:
    dw $0004,$0000 
    db $00 
    dw $EC34,$01F8 
    db $00 
    dw $AC34,$0000 
    db $F8 
    dw $6C34,$01F8 
    db $F8 
    dw $2C34 

ProjectileFlareSpritemaps_Ice_0:
    dw $0001,$01FC 
    db $FC 
    dw $2C30 

ProjectileFlareSpritemaps_Ice_1:
    dw $0001,$01FC 
    db $FC 
    dw $2C31 

ProjectileFlareSpritemaps_Ice_2:
    dw $0001,$01FC 
    db $FC 
    dw $2C32 

ProjectileFlareSpritemaps_Ice_3:
    dw $0001,$01FC 
    db $FC 
    dw $6C31 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_48:
    dw $0001,$01FC 
    db $FC 
    dw $2C30 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_49:
    dw $0002,$01F8 
    db $FC 
    dw $2C30,$0000 
    db $FC 
    dw $2C30 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EE25:
    dw $0003,$01F4 
    db $FC 
    dw $2C30,$01FC 
    db $FC 
    dw $2C30,$0004 
    db $FC 
    dw $2C30 

UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EE36:
    dw $0004,$0008 
    db $FC 
    dw $2C30,$0000 
    db $FC 
    dw $2C30,$01F8 
    db $FC 
    dw $2C30,$01F0 
    db $FC 
    dw $2C30 
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4A:
    dw $0002,$0002 
    db $FC 
    dw $2C32,$01FA 
    db $FC 
    dw $2C31 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4B:
    dw $0004,$0006 
    db $00 
    dw $2C32,$01FE 
    db $00 
    dw $2C31,$01FE 
    db $F8 
    dw $2C32,$01F6 
    db $F8 
    dw $2C31 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EE6E:
    dw $0006,$000A 
    db $04 
    dw $2C32,$0002 
    db $04 
    dw $2C31,$0002 
    db $FC 
    dw $2C32,$01FA 
    db $FC 
    dw $2C31,$01FA 
    db $F4 
    dw $2C32,$01F2 
    db $F4 
    dw $2C31 
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4C:
    dw $0001,$01FC 
    db $FC 
    dw $2C33 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4D:
    dw $0002,$01FC 
    db $00 
    dw $2C33,$01FC 
    db $F8 
    dw $2C33 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EEA1:
    dw $0003,$01FC 
    db $F4 
    dw $2C33,$01FC 
    db $04 
    dw $2C33,$01FC 
    db $FC 
    dw $2C33 

UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EEB2:
    dw $0004,$01FC 
    db $F0 
    dw $2C33,$01FC 
    db $08 
    dw $2C33,$01FC 
    db $00 
    dw $2C33,$01FC 
    db $F8 
    dw $2C33 
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4E:
    dw $0002,$01F6 
    db $FC 
    dw $6C32,$01FE 
    db $FC 
    dw $6C31 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4F:
    dw $0004,$01F2 
    db $00 
    dw $6C32,$01FA 
    db $00 
    dw $6C31,$01FA 
    db $F8 
    dw $6C32,$0002 
    db $F8 
    dw $6C31 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_50:
    dw $0006,$01EE 
    db $04 
    dw $6C32,$01F6 
    db $04 
    dw $6C31,$01F6 
    db $FC 
    dw $6C32,$01FE 
    db $FC 
    dw $6C31,$01FE 
    db $F4 
    dw $6C32,$0006 
    db $F4 
    dw $6C31 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_51:
    dw $0001,$01FC 
    db $FC 
    dw $6C30 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_52:
    dw $0002,$0000 
    db $FC 
    dw $6C30,$01F8 
    db $FC 
    dw $6C30 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EF1D:
    dw $0003,$0004 
    db $FC 
    dw $6C30,$01FC 
    db $FC 
    dw $6C30,$01F4 
    db $FC 
    dw $6C30 

UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EF2E:
    dw $0004,$01F0 
    db $FC 
    dw $6C30,$01F8 
    db $FC 
    dw $6C30,$0000 
    db $FC 
    dw $6C30,$0008 
    db $FC 
    dw $6C30 
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_53:
    dw $0002,$01F6 
    db $FC 
    dw $EC32,$01FE 
    db $FC 
    dw $EC31 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_54:
    dw $0004,$01F2 
    db $F8 
    dw $EC32,$01FA 
    db $F8 
    dw $EC31,$01FA 
    db $00 
    dw $EC32,$0002 
    db $00 
    dw $EC31 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EF66:
    dw $0006,$01EE 
    db $F4 
    dw $EC32,$01F6 
    db $F4 
    dw $EC31,$01F6 
    db $FC 
    dw $EC32,$01FE 
    db $FC 
    dw $EC31,$01FE 
    db $04 
    dw $EC32,$0006 
    db $04 
    dw $EC31 
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_55:
    dw $0001,$01FC 
    db $FC 
    dw $AC33 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_56:
    dw $0002,$01FC 
    db $F8 
    dw $AC33,$01FC 
    db $00 
    dw $AC33 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EF99:
    dw $0003,$01FC 
    db $04 
    dw $AC33,$01FC 
    db $F4 
    dw $AC33,$01FC 
    db $FC 
    dw $AC33 

UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EFAA:
    dw $0004,$01FC 
    db $08 
    dw $AC33,$01FC 
    db $F0 
    dw $AC33,$01FC 
    db $F8 
    dw $AC33,$01FC 
    db $00 
    dw $AC33 

UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EFC0:
    dw $0002,$01F6 
    db $FC 
    dw $EC32,$01FE 
    db $FC 
    dw $EC31 

UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EFCC:
    dw $0004,$01F2 
    db $F8 
    dw $EC32,$01FA 
    db $F8 
    dw $EC31,$01FA 
    db $00 
    dw $EC32,$0002 
    db $00 
    dw $EC31 

UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EFE2:
    dw $0006,$01EE 
    db $F4 
    dw $EC32,$01F6 
    db $F4 
    dw $EC31,$01F6 
    db $FC 
    dw $EC32,$01FE 
    db $FC 
    dw $EC31,$01FE 
    db $04 
    dw $EC32,$0006 
    db $04 
    dw $EC31 
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_57:
    dw $0001,$01FC 
    db $FC 
    dw $2C34 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_58:
    dw $0002,$01F8 
    db $FC 
    dw $2C34,$0000 
    db $FC 
    dw $2C34 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93F015:
    dw $0003,$01F4 
    db $FC 
    dw $2C34,$01FC 
    db $FC 
    dw $2C34,$0004 
    db $FC 
    dw $2C34 

UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93F026:
    dw $0004,$0008 
    db $FC 
    dw $2C34,$0000 
    db $FC 
    dw $2C34,$01F8 
    db $FC 
    dw $2C34,$01F0 
    db $FC 
    dw $2C34 
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_59:
    dw $0002,$01FC 
    db $F8 
    dw $2C36,$01FC 
    db $00 
    dw $EC36 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5A:
    dw $0004,$0000 
    db $FC 
    dw $EC35,$0000 
    db $04 
    dw $EC36,$01F8 
    db $F4 
    dw $2C36,$01F8 
    db $FC 
    dw $2C35 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93F05E:
    dw $0006,$0004 
    db $08 
    dw $EC36,$01F4 
    db $F0 
    dw $2C36,$0004 
    db $00 
    dw $EC35,$01FC 
    db $00 
    dw $2C35,$01FC 
    db $F8 
    dw $EC35,$01F4 
    db $F8 
    dw $2C35 
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5B:
    dw $0001,$01FC 
    db $FC 
    dw $2C37 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5C:
    dw $0002,$01FC 
    db $00 
    dw $2C37,$01FC 
    db $F8 
    dw $2C37 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93F091:
    dw $0003,$01FC 
    db $04 
    dw $2C37,$01FC 
    db $FC 
    dw $2C37,$01FC 
    db $F4 
    dw $2C37 

UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93F0A2:
    dw $0004,$01FC 
    db $08 
    dw $2C37,$01FC 
    db $00 
    dw $2C37,$01FC 
    db $F8 
    dw $2C37,$01FC 
    db $F0 
    dw $2C37 
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5D:
    dw $0002,$01FC 
    db $F8 
    dw $6C36,$01FC 
    db $00 
    dw $AC36 

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5E:
    dw $0004,$01F8 
    db $FC 
    dw $AC35,$01F8 
    db $04 
    dw $AC36,$0000 
    db $F4 
    dw $6C36,$0000 
    db $FC 
    dw $6C35 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93F0DA:
    dw $0006,$01F4 
    db $08 
    dw $AC36,$0004 
    db $F0 
    dw $6C36,$01F4 
    db $00 
    dw $AC35,$01FC 
    db $00 
    dw $6C35,$01FC 
    db $F8 
    dw $AC35,$0004 
    db $F8 
    dw $6C35 
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_0:
    dw $0001,$01FC 
    db $FC 
    dw $2C30 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F101:
    dw $0002,$01F8 
    db $FC 
    dw $2C30,$0000 
    db $FC 
    dw $2C30 
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1:
    dw $0003,$01F4 
    db $FC 
    dw $2C30,$01FC 
    db $FC 
    dw $2C30,$0004 
    db $FC 
    dw $2C30 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F11E:
    dw $0004,$01F0 
    db $FC 
    dw $2C30,$01F8 
    db $FC 
    dw $2C30,$0000 
    db $FC 
    dw $2C30,$0008 
    db $FC 
    dw $2C30 

UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F134:
    dw $0005,$000C 
    db $FC 
    dw $2C30,$0004 
    db $FC 
    dw $2C30,$01FC 
    db $FC 
    dw $2C30,$01F4 
    db $FC 
    dw $2C30,$01EC 
    db $FC 
    dw $2C30 
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_2:
    dw $0006,$0010 
    db $FC 
    dw $2C30,$0008 
    db $FC 
    dw $2C30,$0000 
    db $FC 
    dw $2C30,$01F8 
    db $FC 
    dw $2C30,$01F0 
    db $FC 
    dw $2C30,$01E8 
    db $FC 
    dw $2C30 

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_3:
    dw $0007,$0014 
    db $FC 
    dw $2C30,$000C 
    db $FC 
    dw $2C30,$0004 
    db $FC 
    dw $2C30,$01FC 
    db $FC 
    dw $2C30,$01F4 
    db $FC 
    dw $2C30,$01EC 
    db $FC 
    dw $2C30,$01E4 
    db $FC 
    dw $2C30 

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_4:
    dw $0001,$01FC 
    db $FC 
    dw $2C33 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F19B:
    dw $0002,$01FC 
    db $00 
    dw $2C33,$01FC 
    db $F8 
    dw $2C33 
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_5:
    dw $0003,$01FC 
    db $04 
    dw $2C33,$01FC 
    db $FC 
    dw $2C33,$01FC 
    db $F4 
    dw $2C33 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F1B8:
    dw $0004,$01FC 
    db $08 
    dw $2C33,$01FC 
    db $00 
    dw $2C33,$01FC 
    db $F8 
    dw $2C33,$01FC 
    db $F0 
    dw $2C33 

UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F1CE:
    dw $0005,$01FC 
    db $0C 
    dw $2C33,$01FC 
    db $04 
    dw $2C33,$01FC 
    db $FC 
    dw $2C33,$01FC 
    db $F4 
    dw $2C33,$01FC 
    db $EC 
    dw $2C33 
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_6:
    dw $0006,$01FC 
    db $10 
    dw $2C33,$01FC 
    db $08 
    dw $2C33,$01FC 
    db $00 
    dw $2C33,$01FC 
    db $F8 
    dw $2C33,$01FC 
    db $F0 
    dw $2C33,$01FC 
    db $E8 
    dw $2C33 

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_7:
    dw $0007,$01FC 
    db $14 
    dw $2C33,$01FC 
    db $0C 
    dw $2C33,$01FC 
    db $04 
    dw $2C33,$01FC 
    db $FC 
    dw $2C33,$01FC 
    db $F4 
    dw $2C33,$01FC 
    db $EC 
    dw $2C33,$01FC 
    db $E4 
    dw $2C33 

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_8:
    dw $0002,$0000 
    db $FC 
    dw $2C32,$01F8 
    db $FC 
    dw $2C31 

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_9:
    dw $0004,$0004 
    db $00 
    dw $2C32,$01FC 
    db $00 
    dw $2C31,$01FC 
    db $F8 
    dw $2C32,$01F4 
    db $F8 
    dw $2C31 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F250:
    dw $0006,$0008 
    db $04 
    dw $2C32,$0000 
    db $04 
    dw $2C31,$0000 
    db $FC 
    dw $2C32,$01F8 
    db $FC 
    dw $2C31,$01F8 
    db $F4 
    dw $2C32,$01F0 
    db $F4 
    dw $2C31 
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_A:
    dw $0008,$000C 
    db $08 
    dw $2C32,$0004 
    db $08 
    dw $2C31,$0004 
    db $00 
    dw $2C32,$01FC 
    db $00 
    dw $2C31,$01FC 
    db $F8 
    dw $2C32,$01F4 
    db $F8 
    dw $2C31,$01F4 
    db $F0 
    dw $2C32,$01EC 
    db $F0 
    dw $2C31 

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_B:
    dw $000A,$0010 
    db $0C 
    dw $2C32,$0008 
    db $0C 
    dw $2C31,$0008 
    db $04 
    dw $2C32,$0000 
    db $04 
    dw $2C31,$0000 
    db $FC 
    dw $2C32,$01F8 
    db $FC 
    dw $2C31,$01F8 
    db $F4 
    dw $2C32,$01F0 
    db $F4 
    dw $2C31,$01F0 
    db $EC 
    dw $2C32,$01E8 
    db $EC 
    dw $2C31 

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_C:
    dw $0002,$01F8 
    db $FC 
    dw $6C32,$0000 
    db $FC 
    dw $6C31 

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_D:
    dw $0004,$01F4 
    db $00 
    dw $6C32,$01FC 
    db $00 
    dw $6C31,$01FC 
    db $F8 
    dw $6C32,$0004 
    db $F8 
    dw $6C31 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F2F0:
    dw $0006,$01F0 
    db $04 
    dw $6C32,$01F8 
    db $04 
    dw $6C31,$01F8 
    db $FC 
    dw $6C32,$0000 
    db $FC 
    dw $6C31,$0000 
    db $F4 
    dw $6C32,$0008 
    db $F4 
    dw $6C31 
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_E:
    dw $0008,$01EC 
    db $08 
    dw $6C32,$01F4 
    db $08 
    dw $6C31,$01F4 
    db $00 
    dw $6C32,$01FC 
    db $00 
    dw $6C31,$01FC 
    db $F8 
    dw $6C32,$0004 
    db $F8 
    dw $6C31,$0004 
    db $F0 
    dw $6C32,$000C 
    db $F0 
    dw $6C31 

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_F:
    dw $000A,$01E8 
    db $0C 
    dw $6C32,$01F0 
    db $0C 
    dw $6C31,$01F0 
    db $04 
    dw $6C32,$01F8 
    db $04 
    dw $6C31,$01F8 
    db $FC 
    dw $6C32,$0000 
    db $FC 
    dw $6C31,$0000 
    db $F4 
    dw $6C32,$0008 
    db $F4 
    dw $6C31,$0008 
    db $EC 
    dw $6C32,$0010 
    db $EC 
    dw $6C31 

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_10:
    dw $0001,$01FC 
    db $FC 
    dw $2C34 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F375:
    dw $0002,$0000 
    db $FC 
    dw $2C34,$01F8 
    db $FC 
    dw $2C34 
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_11:
    dw $0003,$0004 
    db $FC 
    dw $2C34,$01FC 
    db $FC 
    dw $2C34,$01F4 
    db $FC 
    dw $2C34 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F392:
    dw $0004,$0008 
    db $FC 
    dw $2C34,$0000 
    db $FC 
    dw $2C34,$01F8 
    db $FC 
    dw $2C34,$01F0 
    db $FC 
    dw $2C34 

UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F3A8:
    dw $0005,$000C 
    db $FC 
    dw $2C34,$0004 
    db $FC 
    dw $2C34,$01FC 
    db $FC 
    dw $2C34,$01F4 
    db $FC 
    dw $2C34,$01EC 
    db $FC 
    dw $2C34 
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_12:
    dw $0006,$0010 
    db $FC 
    dw $2C34,$0008 
    db $FC 
    dw $2C34,$0000 
    db $FC 
    dw $2C34,$01F8 
    db $FC 
    dw $2C34,$01F0 
    db $FC 
    dw $2C34,$01E8 
    db $FC 
    dw $2C34 

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_13:
    dw $0007,$0014 
    db $FC 
    dw $2C34,$000C 
    db $FC 
    dw $2C34,$0004 
    db $FC 
    dw $2C34,$01FC 
    db $FC 
    dw $2C34,$01F4 
    db $FC 
    dw $2C34,$01EC 
    db $FC 
    dw $2C34,$01E4 
    db $FC 
    dw $2C34 

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_14:
    dw $0001,$01FC 
    db $FC 
    dw $2C37 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F40F:
    dw $0002,$01FC 
    db $00 
    dw $2C37,$01FC 
    db $F8 
    dw $2C37 
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_15:
    dw $0003,$01FC 
    db $04 
    dw $2C37,$01FC 
    db $FC 
    dw $2C37,$01FC 
    db $F4 
    dw $2C37 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F42C:
    dw $0004,$01FC 
    db $08 
    dw $2C37,$01FC 
    db $00 
    dw $2C37,$01FC 
    db $F8 
    dw $2C37,$01FC 
    db $F0 
    dw $2C37 

UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F442:
    dw $0005,$01FC 
    db $0C 
    dw $2C37,$01FC 
    db $04 
    dw $2C37,$01FC 
    db $FC 
    dw $2C37,$01FC 
    db $F4 
    dw $2C37,$01FC 
    db $EC 
    dw $2C37 
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_16:
    dw $0006,$01FC 
    db $10 
    dw $2C37,$01FC 
    db $08 
    dw $2C37,$01FC 
    db $00 
    dw $2C37,$01FC 
    db $F8 
    dw $2C37,$01FC 
    db $F0 
    dw $2C37,$01FC 
    db $E8 
    dw $2C37 

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_17:
    dw $0007,$01FC 
    db $14 
    dw $2C37,$01FC 
    db $0C 
    dw $2C37,$01FC 
    db $04 
    dw $2C37,$01FC 
    db $FC 
    dw $2C37,$01FC 
    db $F4 
    dw $2C37,$01FC 
    db $EC 
    dw $2C37,$01FC 
    db $E4 
    dw $2C37 

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_18:
    dw $0002,$01FC 
    db $F8 
    dw $2C36,$01FC 
    db $00 
    dw $EC36 

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_19:
    dw $0004,$0000 
    db $04 
    dw $EC36,$0000 
    db $FC 
    dw $EC35,$01F8 
    db $F4 
    dw $2C36,$01F8 
    db $FC 
    dw $2C35 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F4C4:
    dw $0006,$01FC 
    db $F8 
    dw $EC35,$0004 
    db $00 
    dw $EC35,$0004 
    db $08 
    dw $EC36,$01F4 
    db $F0 
    dw $2C36,$01FC 
    db $00 
    dw $2C35,$01F4 
    db $F8 
    dw $2C35 
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1A:
    dw $0008,$0008 
    db $04 
    dw $EC35,$01F8 
    db $F4 
    dw $EC35,$0000 
    db $FC 
    dw $EC35,$0008 
    db $0C 
    dw $EC36,$01F0 
    db $EC 
    dw $2C36,$0000 
    db $04 
    dw $2C35,$01F8 
    db $FC 
    dw $2C35,$01F0 
    db $F4 
    dw $2C35 

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1B:
    dw $000A,$000C 
    db $10 
    dw $EC36,$01EC 
    db $E8 
    dw $2C36,$000C 
    db $08 
    dw $EC35,$0004 
    db $00 
    dw $EC35,$01FC 
    db $F8 
    dw $EC35,$01F4 
    db $F0 
    dw $EC35,$0004 
    db $08 
    dw $2C35,$01FC 
    db $00 
    dw $2C35,$01F4 
    db $F8 
    dw $2C35,$01EC 
    db $F0 
    dw $2C35 

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1C:
    dw $0002,$01FC 
    db $F8 
    dw $6C36,$01FC 
    db $00 
    dw $AC36 

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1D:
    dw $0004,$01F8 
    db $04 
    dw $AC36,$01F8 
    db $FC 
    dw $AC35,$0000 
    db $F4 
    dw $6C36,$0000 
    db $FC 
    dw $6C35 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F564:
    dw $0006,$01FC 
    db $F8 
    dw $AC35,$01F4 
    db $00 
    dw $AC35,$01F4 
    db $08 
    dw $AC36,$0004 
    db $F0 
    dw $6C36,$01FC 
    db $00 
    dw $6C35,$0004 
    db $F8 
    dw $6C35 
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1E:
    dw $0008,$01F0 
    db $04 
    dw $AC35,$0000 
    db $F4 
    dw $AC35,$01F8 
    db $FC 
    dw $AC35,$01F0 
    db $0C 
    dw $AC36,$0008 
    db $EC 
    dw $6C36,$01F8 
    db $04 
    dw $6C35,$0000 
    db $FC 
    dw $6C35,$0008 
    db $F4 
    dw $6C35 

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1F:
    dw $000A,$01EC 
    db $10 
    dw $AC36,$000C 
    db $E8 
    dw $6C36,$01EC 
    db $08 
    dw $AC35,$01F4 
    db $00 
    dw $AC35,$01FC 
    db $F8 
    dw $AC35,$0004 
    db $F0 
    dw $AC35,$01F4 
    db $08 
    dw $6C35,$01FC 
    db $00 
    dw $6C35,$0004 
    db $F8 
    dw $6C35,$000C 
    db $F0 
    dw $6C35 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_DrawShinesparkWindupEffectSprite_93F5E2:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W $0A1C 
    CMP.W #$00C7 
    BEQ .verticalShinesparkWindup 
    CMP.W #$00C8 
    BNE .return 

.verticalShinesparkWindup:
    LDA.W $05B6 
    BIT.W #$0001 
    BNE .return 
    LDA.W $0AF6 : SEC : SBC.W $0911 : STA.B $14 
    LDA.W $0AFA : SEC : SBC.W $0915 : STA.B $12 
    LDA.W #$003C : CLC : ADC.W #$0002 : JSL.L AddSpritemapFrom_93A1A1_TableToOAM 

.return:
    PLB 
    PLP 
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


Freespace_Bank93_F61D: 
; $9E3 bytes
