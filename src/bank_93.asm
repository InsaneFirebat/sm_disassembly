
org $938000


;;; $8000: Initialise projectile ;;;
InitializeProjectile:
;; Parameters:
;;     X: Projectile index

; Used for beam (uncharged / charged / hyper), (super) missile, ice SBA
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W SamusProjectile_Directions,X : AND.W #$000F : ASL : STA.B DP_Temp12
    LDA.W SamusProjectile_Types,X : BIT.W #$0F00 : BNE .notBeam
    BIT.W #$0010 : BNE .charged
    AND.W #$000F : ASL : TAY
    LDA.W SamusProjectileDataPointers_UnchargedBeams,Y : TAY
    BRA .merge

  .charged:
    AND.W #$000F : ASL : TAY
    LDA.W SamusProjectileDataPointers_ChargedBeams,Y : TAY
    BRA .merge

  .notBeam:
    XBA : AND.W #$000F : ASL : TAY
    LDA.W SamusProjectileDataPointers_NonBeam,Y : TAY

  .merge:
    LDA.W $0000,Y : STA.W SamusProjectile_Damages,X : BPL .dontCrash
    JML Crash_Handler

  .dontCrash:
    INY #2
    TYA : CLC : ADC.B DP_Temp12 : TAY
    LDA.W $0000,Y : STA.W SamusProjectile_InstructionPointers,X
    TAY
    LDA.W $0004,Y : AND.W #$00FF : STA.W SamusProjectile_XRadii,X
    LDA.W $0005,Y : AND.W #$00FF : STA.W SamusProjectile_YRadii,X
    LDA.W #$0001 : STA.W SamusProjectile_InstructionTimers,X
    PLB : PLP
    RTL


;;; $8071: Initialise super missile link ;;;
InitializeSuperMissileLink:
; Instruction list is InstList_SamusProjectile_SuperMissileLink (loop of single instruction with 8x8 radius and dummy empty spritemap)
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W SamusProjectile_Types+1,X : AND.W #$000F : ASL : TAY
    LDA.W SamusProjectileDataPointers_SuperMissileLink,Y : TAY
    LDA.W $0000,Y : STA.W SamusProjectile_Damages,X : BPL .dontCrash
    JML Crash_Handler

  .dontCrash:
    INY #2
    LDA.W $0000,Y : STA.W SamusProjectile_InstructionPointers,X
    LDA.W #$0001 : STA.W SamusProjectile_InstructionTimers,X
    PLB : PLP
    RTL


;;; $80A0: Initialise (power) bomb ;;;
InitializeBomb:
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W SamusProjectile_Types+1,X : AND.W #$000F : ASL : TAY
    LDA.W SamusProjectileDataPointers_NonBeam,Y : TAY
    LDA.W $0000,Y : STA.W SamusProjectile_Damages,X : BPL .dontCrash
    JML Crash_Handler

  .dontCrash:
    INY #2
    LDA.W $0000,Y : STA.W SamusProjectile_InstructionPointers,X
    LDA.W #$0001 : STA.W SamusProjectile_InstructionTimers,X
    PLB : PLP
    RTL


;;; $80CF: Part of kill projectile - queue sound effect and set instruction ;;;
PartOfKillProjectile_QueueSFX_SetInstruction:
; Called by Kill_Projectile
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W SamusProjectile_Types,X : BIT.W #$0F00 : BNE .notBeam
    LDA.W SamusProjectile_Types,X : AND.W #$F0FF : ORA.W #$0700 : STA.W SamusProjectile_Types,X
    LDA.W ProjectileDataTable_NonBeam_BeamExplosion_pointer : STA.W SamusProjectile_InstructionPointers,X
    LDA.W #$000C
    JSL QueueSound_Lib2_Max6
    BRA .return

  .notBeam:
    LDA.W CinematicFunction : BNE .setExplosion
    LDA.W #$0007
    JSL QueueSound_Lib2_Max6

  .setExplosion:
    LDA.W SamusProjectile_Types,X : PHA
    AND.W #$F0FF : ORA.W #$0800 : STA.W SamusProjectile_Types,X
    PLA : BIT.W #$0200 : BNE .superMissile
    LDA.W ProjectileDataTable_NonBeam_MissileExplosion_pointer : STA.W SamusProjectile_InstructionPointers,X
    BRA .setCooldown

  .superMissile:
    LDA.W ProjectileDataTable_NonBeam_SuperMissileExplosion_pointer : STA.W SamusProjectile_InstructionPointers,X
    LDA.W #$0014 : STA.W EarthquakeType
    LDA.W #$001E : STA.W EarthquakeTimer

  .setCooldown:
    LDA.W SamusProjectile_CooldownTimer : CMP.W #$0015 : BMI .return
    LDA.W #$0014 : STA.W SamusProjectile_CooldownTimer

  .return:
    LDA.W #$0001 : STA.W SamusProjectile_InstructionTimers,X
    LDA.W #$0008 : STA.W SamusProjectile_Damages,X
    PLB : PLP
    RTL


;;; $814E: Initialise bomb explosion ;;;
Initialize_Bomb_Explosion:
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W ProjectileDataTable_NonBeam_BombExplosion_pointer : STA.W SamusProjectile_InstructionPointers,X
    LDA.W #$0001 : STA.W SamusProjectile_InstructionTimers,X
    PLB : PLP
    RTL


;;; $8163: Initialise shinespark echo or spazer SBA trail projectile ;;;
Initialize_ShinesparkEcho_or_SpazerSBATrailProjectile:
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W SamusProjectile_Directions,X : AND.W #$000F : ASL : STA.B DP_Temp12
    LDA.W SamusProjectile_Types,X : AND.W #$00FF : SEC : SBC.W #$0022 : ASL : TAY
    LDA.W SamusProjectileDataPointers_ShinesparkEcho_SpazerSBATrail,Y : TAY
    LDA.W $0000,Y : STA.W SamusProjectile_Damages,X : BPL .dontCrash
    JML Crash_Handler

  .dontCrash:
    INY #2
    TYA : CLC : ADC.B DP_Temp12 : TAY
    LDA.W $0000,Y : STA.W SamusProjectile_InstructionPointers,X
    LDA.W #$0001 : STA.W SamusProjectile_InstructionTimers,X
    PLB : PLP
    RTL


;;; $81A4: Initialise SBA projectile ;;;
InitializeSBAProjectile:
; Excluding ice SBA, which is run as a regular projectile
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W SamusProjectile_Types,X : AND.W #$000F : ASL : TAY
    LDA.W SamusProjectileDataPointers_SBA,Y : TAY
    LDA.W $0000,Y : STA.W SamusProjectile_Damages,X : BPL .dontCrash
    JML Crash_Handler

  .dontCrash:
    LDA.W $0002,Y : STA.W SamusProjectile_InstructionPointers,X
    LDA.W #$0001 : STA.W SamusProjectile_InstructionTimers,X
    PLB : PLP
    RTL


;;; $81D1: $16 = projectile trail frame ;;;
Get_ProjectileTrailFrame:
    PHP : PHB
    PHK : PLB
    REP #$30
    PHY
    LDA.W SamusProjectile_InstructionPointers,X : SEC : SBC.W #$0008 : TAY
    LDA.W $0006,Y : STA.B DP_Temp16
    PLY : PLB : PLP
    RTL


;;; $81E9: Projectile instruction handler ;;;
ProjectileInstructionHandler:
; Called by Handle_Projectiles
    PHP : PHB
    PHK : PLB
    REP #$30
    LDX.W ProjectileIndex
    DEC.W SamusProjectile_InstructionTimers,X : BNE .return
    LDY.W SamusProjectile_InstructionPointers,X

  .loop:
    LDA.W $0000,Y : BPL .timer
    STA.B DP_Temp12
    INY #2
    PEA .loop-1
    JMP.W (DP_Temp12)

  .timer:
    STA.W SamusProjectile_InstructionTimers,X
    LDA.W $0002,Y : STA.W SamusProjectile_SpritemapPointers,X
    LDA.W $0004,Y : AND.W #$00FF : STA.W SamusProjectile_XRadii,X
    LDA.W $0005,Y : AND.W #$00FF : STA.W SamusProjectile_YRadii,X
    TYA : CLC : ADC.W #$0008 : STA.W SamusProjectile_InstructionPointers,X

  .return:
    PLB : PLP
    RTL


;;; $822F: Instruction - delete ;;;
Instruction_SamusProjectile_Delete:
    REP #$30
    JSL Clear_Projectile
    PLA : PLB : PLP
    RTL


;;; $8239: Instruction - go to [[Y]] ;;;
Instruction_SamusProjectile_GotoY:
    REP #$30
    LDA.W $0000,Y : TAY
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $8240: Unused. Instruction - go to [[Y] + 2] if [bomb timer] <= [[Y]] else go to [[Y] + 4] ;;;
UNUSED_Instruction_SamusProj_GotoY_BasedOnBombTimer_938240:
    REP #$30
    LDA.W $0000,Y : CMP.W SamusProjectile_Variables,X : BPL .lessThanY
    LDA.W $0004,Y : TAY
    RTS

  .lessThanY:
    LDA.W $0002,Y : TAY
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8254: Draw projectiles ;;;
DrawProjectiles:
    PHP
    REP #$30
    LDX.W #$0008 : STX.W ProjectileIndex

  .loop:
    LDA.W SamusProjectile_InstructionPointers,X : BNE +
    JMP .next

+   LDA.W SamusProjectile_Types,X : BIT.W #$0F10 : BNE .noFlickering
    BIT.W #$000C : BNE .spazerPlasma
    TXA : BIT.W #$0002 : BNE +
    LDA.W NMI_FrameCounter : BIT.W #$0001 : BNE .draw
    BRA .next

+   LDA.W NMI_FrameCounter : BIT.W #$0001 : BNE .next
    BRA .draw

  .spazerPlasma:
    TXA : BIT.W #$0002 : BNE +
    LDA.W NMI_FrameCounter : BIT.W #$0002 : BNE .next
    BRA .draw

+   LDA.W NMI_FrameCounter : BIT.W #$0002 : BEQ .next
    BRA .draw

  .noFlickering:
    AND.W #$0F00 : CMP.W #$0300 : BPL .next

  .draw:
    LDA.W CeresStatus : BPL .noRotation
    JSL Calculate_ProjectilePosition_InRotatingElevatorRoom
    LDA.B DP_Temp12
    BRA .positionCalculated

  .noRotation:
    LDA.W SamusProjectile_XPositions,X : SEC : SBC.W Layer1XPosition : STA.B DP_Temp14
    LDA.W SamusProjectile_YPositions,X : SEC : SBC.W Layer1YPosition : STA.B DP_Temp12

  .positionCalculated:
    AND.W #$FF00 : BNE +
    LDA.W SamusProjectile_SpritemapPointers,X : BPL .loadIndex
    JSL AddProjectileSpritemapToOAM
    BRA .loadIndex

+   LDA.W SamusProjectile_SpritemapPointers,X : BPL .loadIndex
    JSL RTL_818AB7

  .loadIndex:
    LDX.W ProjectileIndex

  .next:
    DEX #2 : STX.W ProjectileIndex : BMI .echoes
    JMP .loop

  .echoes:
    JSL DrawShinesparkCrashEchoProjectiles
    JSL HandleProjectileTrails
    PLP
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $82FD: Unused. Partial draw projectiles ;;;
UNUSED_PartialDrawProjectiles_9982FD:
; Compared to DrawProjectiles, this routine doesn't handle flickering,
; doesn't draw shinespark crash echoes, and doesn't handle Ceres elevator room rotation.
; It also randomly subtracts 8 from the projectile's Y position.
    PHP
    REP #$30
    LDX.W #$0008 : STX.W ProjectileIndex

  .loop:
    LDA.W SamusProjectile_InstructionPointers,X : BEQ .next
    LDA.W SamusProjectile_XPositions,X : SEC : SBC.W Layer1XPosition : STA.B DP_Temp14
    LDA.W SamusProjectile_YPositions,X : SEC : SBC.W #$0008 : SEC : SBC.W Layer1YPosition : STA.B DP_Temp12
    AND.W #$FF00 : BNE +
    LDA.W SamusProjectile_SpritemapPointers,X : BPL .getIndex
    JSL AddProjectileSpritemapToOAM
    BRA .getIndex

+   LDA.W SamusProjectile_SpritemapPointers,X : BPL .getIndex
    JSL RTL_818AB7

  .getIndex:
    LDX.W ProjectileIndex

  .next:
    DEX #2 : STX.W ProjectileIndex : BMI .timerExpired
    JMP .loop

  .timerExpired:
    JSL HandleProjectileTrails
    PLP
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $834D: Draw bombs and projectile explosions ;;;
DrawBombsAndProjectileExplosions:
    PHP
    REP #$30
    LDX.W #$0012 : STX.W ProjectileIndex

  .loop:
    LDA.W SamusProjectile_InstructionPointers,X : BEQ .next
    LDA.W SamusProjectile_Types,X : AND.W #$0F00 : CMP.W #$0300 : BMI .next
    BEQ .powerBomb
    CMP.W #$0500 : BEQ .normalPositionCalculation
    LDA.W CeresStatus : BPL .normalPositionCalculation
    JSL Calculate_ProjectilePosition_InRotatingElevatorRoom
    LDA.B DP_Temp12
    BRA .calculatedPosition

  .powerBomb:
    LDA.W SamusProjectile_Variables,X : BEQ .next

  .normalPositionCalculation:
    LDA.W SamusProjectile_XPositions,X : SEC : SBC.W Layer1XPosition : STA.B DP_Temp14
    CMP.W #$0130 : BPL .next
    CMP.W #$FFD0 : BMI .next
    LDA.W SamusProjectile_YPositions,X : SEC : SBC.W Layer1YPosition : STA.B DP_Temp12

  .calculatedPosition:
    AND.W #$FF00 : BNE .offScreen
    LDA.W SamusProjectile_SpritemapPointers,X
    JSL AddProjectileSpritemapToOAM
    LDX.W ProjectileIndex
    BRA .next

  .offScreen:
    LDA.W SamusProjectile_SpritemapPointers,X
    JSL RTL_818AB7
    LDX.W ProjectileIndex

  .next:
    DEX #2 : STX.W ProjectileIndex : BPL .loop
    PLP
    RTL


;;; $83BF: Hyper beam damage value ;;;
HyperBeamDamageValue:
    dw $03E8


;;; $83C1: Projectile damage and instruction list table pointers ;;;
SamusProjectileDataPointers_UnchargedBeams:
; Uncharged beams. Indexed by beam type
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
; Charged beams. Indexed by beam type. Used by ice SBA
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
; Non-beam projectiles. Indexed by projectile type. Used for (super) missile, (power) bomb
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
; Shinespark echo and spazer SBA trail projectile. Indexed by projectile type - 22h
    dw $0000
    dw $0000
    dw ProjectileDataTable_NonBeam_SpazerSBATrail
    dw UNUSED_ProjectileDataTable_NonBeam_Projectile25_938695
    dw ProjectileDataTable_NonBeam_SpazerSBATrail
    dw UNUSED_ProjectileDataTable_NonBeam_Projectile27_9386D7
    dw $0000
    dw ProjectileDataTable_NonBeam_ShinesparkEcho

SamusProjectileDataPointers_SBA:
; Non-ice SBA projectiles. Indexed by beam type
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
; Super missile link. Indexed by projectile type (always 2)
    dw $0000
    dw $0000
    dw ProjectileDataTable_NonBeam_SuperMissileLink


;;; $8431: Projectile damage and instruction list tables ;;;
ProjectileDataTable_Uncharged_Power:
    dw $0014                                                             ; Damage
    dw InstList_SamusProjectile_Power_Up                                 ; Up, facing right
    dw InstList_SamusProjectile_Power_UpRight                            ; Up-right
    dw InstList_SamusProjectile_Power_Right                              ; Right
    dw InstList_SamusProjectile_Power_DownRight                          ; Down-right
    dw InstList_SamusProjectile_Power_Down                               ; Down, facing right
    dw InstList_SamusProjectile_Power_Down                               ; Down, facing left
    dw InstList_SamusProjectile_Power_DownLeft                           ; Down-left
    dw InstList_SamusProjectile_Power_Left                               ; Left
    dw InstList_SamusProjectile_Power_UpLeft                             ; Up-left
    dw InstList_SamusProjectile_Power_Up                                 ; Up, facing left

ProjectileDataTable_Uncharged_Spazer:
    dw $0028                                                             ; Damage
    dw InstList_SamusProjectile_Spazer_SpazerIce_Up_0                    ; Up, facing right
    dw InstList_SamusProjectile_Spazer_SpazerIce_UpRight_0               ; Up-right
    dw InstList_SamusProjectile_Spazer_SpazerIce_Right_0                 ; Right
    dw InstList_SamusProjectile_Spazer_SpazerIce_DownRight_0             ; Down-right
    dw InstList_SamusProjectile_Spazer_SpazerIce_Down_0                  ; Down, facing right
    dw InstList_SamusProjectile_Spazer_SpazerIce_Down_0                  ; Down, facing left
    dw InstList_SamusProjectile_Spazer_SpazerIce_DownLeft_0              ; Down-left
    dw InstList_SamusProjectile_Spazer_SpazerIce_Left_0                  ; Left
    dw InstList_SamusProjectile_Spazer_SpazerIce_UpLeft_0                ; Up-left
    dw InstList_SamusProjectile_Spazer_SpazerIce_Up_0                    ; Up, facing left

ProjectileDataTable_Uncharged_SpazerIce:
    dw $003C                                                             ; Damage
    dw InstList_SamusProjectile_Spazer_SpazerIce_Up_0                    ; Up, facing right
    dw InstList_SamusProjectile_Spazer_SpazerIce_UpRight_0               ; Up-right
    dw InstList_SamusProjectile_Spazer_SpazerIce_Right_0                 ; Right
    dw InstList_SamusProjectile_Spazer_SpazerIce_DownRight_0             ; Down-right
    dw InstList_SamusProjectile_Spazer_SpazerIce_Down_0                  ; Down, facing right
    dw InstList_SamusProjectile_Spazer_SpazerIce_Down_0                  ; Down, facing left
    dw InstList_SamusProjectile_Spazer_SpazerIce_DownLeft_0              ; Down-left
    dw InstList_SamusProjectile_Spazer_SpazerIce_Left_0                  ; Left
    dw InstList_SamusProjectile_Spazer_SpazerIce_UpLeft_0                ; Up-left
    dw InstList_SamusProjectile_Spazer_SpazerIce_Up_0                    ; Up, facing left

ProjectileDataTable_Uncharged_SpazerIceWave:
    dw $0064                                                             ; Damage
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Up              ; Up, facing right
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_UpRight         ; Up-right
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Right           ; Right
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_DownRight       ; Down-right
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Down            ; Down, facing right
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Down            ; Down, facing left
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_DownLeft        ; Down-left
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Left            ; Left
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_UpLeft          ; Up-left
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Up              ; Up, facing left

ProjectileDataTable_Uncharged_PlasmaIceWave:
    dw $012C                                                             ; Damage
    dw InstList_SamusProjectile_PlasmaIceWave_Down_Up                    ; Up, facing right
    dw InstList_SamusProjectile_PlasmaIceWave_DownLeft_UpRight           ; Up-right
    dw InstList_SamusProj_PlasmaWave_PlasmaIceWave_Left_Right_0          ; Right
    dw InstList_SamusProjectile_PlasmaIceWave_DownRight_UpLeft           ; Down-right
    dw InstList_SamusProjectile_PlasmaIceWave_Down_Up                    ; Down, facing right
    dw InstList_SamusProjectile_PlasmaIceWave_Down_Up                    ; Down, facing left
    dw InstList_SamusProjectile_PlasmaIceWave_DownLeft_UpRight           ; Down-left
    dw InstList_SamusProj_PlasmaWave_PlasmaIceWave_Left_Right_0          ; Left
    dw InstList_SamusProjectile_PlasmaIceWave_DownRight_UpLeft           ; Up-left
    dw InstList_SamusProjectile_PlasmaIceWave_Down_Up                    ; Up, facing left

ProjectileDataTable_Uncharged_Ice:
    dw $001E                                                             ; Damage
    dw InstList_SamusProjectile_Ice                                      ; Up, facing right
    dw InstList_SamusProjectile_Ice                                      ; Up-right
    dw InstList_SamusProjectile_Ice                                      ; Right
    dw InstList_SamusProjectile_Ice                                      ; Down-right
    dw InstList_SamusProjectile_Ice                                      ; Down, facing right
    dw InstList_SamusProjectile_Ice                                      ; Down, facing left
    dw InstList_SamusProjectile_Ice                                      ; Down-left
    dw InstList_SamusProjectile_Ice                                      ; Left
    dw InstList_SamusProjectile_Ice                                      ; Up-left
    dw InstList_SamusProjectile_Ice                                      ; Up, facing left

ProjectileDataTable_Uncharged_Wave:
    dw $0032                                                             ; Damage
    dw InstList_SamusProjectile_Wave_IceWave_Up                          ; Up, facing right
    dw InstList_SamusProjectile_Wave_IceWave_DownLeft_UpRight            ; Up-right
    dw InstList_SamusProjectile_Wave_IceWave_Left_Right                  ; Right
    dw InstList_SamusProjectile_Wave_IceWave_DownRight_UpLeft            ; Down-right
    dw InstList_SamusProjectile_Wave_IceWave_Down                        ; Down, facing right
    dw InstList_SamusProjectile_Wave_IceWave_Down                        ; Down, facing left
    dw InstList_SamusProjectile_Wave_IceWave_DownLeft_UpRight            ; Down-left
    dw InstList_SamusProjectile_Wave_IceWave_Left_Right                  ; Left
    dw InstList_SamusProjectile_Wave_IceWave_DownRight_UpLeft            ; Up-left
    dw InstList_SamusProjectile_Wave_IceWave_Up                          ; Up, facing left

ProjectileDataTable_Uncharged_Plasma:
    dw $0096                                                             ; Damage
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Down_Up_0               ; Up, facing right
    dw InstList_SamusProjectile_Plasma_PlasmaIce_DownLeft_UpRight_0      ; Up-right
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Left_Right_0            ; Right
    dw InstList_SamusProjectile_Plasma_PlasmaIce_DownRight_UpLeft_0      ; Down-right
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Down_Up_0               ; Down, facing right
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Down_Up_0               ; Down, facing left
    dw InstList_SamusProjectile_Plasma_PlasmaIce_DownLeft_UpRight_0      ; Down-left
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Left_Right_0            ; Left
    dw InstList_SamusProjectile_Plasma_PlasmaIce_DownRight_UpLeft_0      ; Up-left
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Down_Up_0               ; Up, facing left

ProjectileDataTable_Uncharged_IceWave:
    dw $003C                                                             ; Damage
    dw InstList_SamusProjectile_Wave_IceWave_Up                          ; Up, facing right
    dw InstList_SamusProjectile_Wave_IceWave_DownLeft_UpRight            ; Up-right
    dw InstList_SamusProjectile_Wave_IceWave_Left_Right                  ; Right
    dw InstList_SamusProjectile_Wave_IceWave_DownRight_UpLeft            ; Down-right
    dw InstList_SamusProjectile_Wave_IceWave_Down                        ; Down, facing right
    dw InstList_SamusProjectile_Wave_IceWave_Down                        ; Down, facing left
    dw InstList_SamusProjectile_Wave_IceWave_DownLeft_UpRight            ; Down-left
    dw InstList_SamusProjectile_Wave_IceWave_Left_Right                  ; Left
    dw InstList_SamusProjectile_Wave_IceWave_DownRight_UpLeft            ; Up-left
    dw InstList_SamusProjectile_Wave_IceWave_Up                          ; Up, facing left

ProjectileDataTable_Uncharged_SpazerWave:
    dw $0046                                                             ; Damage
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Up              ; Up, facing right
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_UpRight         ; Up-right
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Right           ; Right
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_DownRight       ; Down-right
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Down            ; Down, facing right
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Down            ; Down, facing left
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_DownLeft        ; Down-left
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Left            ; Left
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_UpLeft          ; Up-left
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Up              ; Up, facing left

ProjectileDataTable_Uncharged_PlasmaWave:
    dw $00FA                                                             ; Damage
    dw InstList_SamusProjectile_PlasmaWave_Down_Up                       ; Up, facing right
    dw InstList_SamusProjectile_PlasmaWave_DownLeft_UpRight              ; Up-right
    dw InstList_SamusProj_PlasmaWave_PlasmaIceWave_Left_Right_0          ; Right
    dw InstList_SamusProjectile_PlasmaWave_DownRight_UpLeft              ; Down-right
    dw InstList_SamusProjectile_PlasmaWave_Down_Up                       ; Down, facing right
    dw InstList_SamusProjectile_PlasmaWave_Down_Up                       ; Down, facing left
    dw InstList_SamusProjectile_PlasmaWave_DownLeft_UpRight              ; Down-left
    dw InstList_SamusProj_PlasmaWave_PlasmaIceWave_Left_Right_0          ; Left
    dw InstList_SamusProjectile_PlasmaWave_DownRight_UpLeft              ; Up-left
    dw InstList_SamusProjectile_PlasmaWave_Down_Up                       ; Up, facing left

ProjectileDataTable_Uncharged_PlasmaIce:
    dw $00C8                                                             ; Damage
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Down_Up_0               ; Up, facing right
    dw InstList_SamusProjectile_Plasma_PlasmaIce_DownLeft_UpRight_0      ; Up-right
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Left_Right_0            ; Right
    dw InstList_SamusProjectile_Plasma_PlasmaIce_DownRight_UpLeft_0      ; Down-right
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Down_Up_0               ; Down, facing right
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Down_Up_0               ; Down, facing left
    dw InstList_SamusProjectile_Plasma_PlasmaIce_DownLeft_UpRight_0      ; Down-left
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Left_Right_0            ; Left
    dw InstList_SamusProjectile_Plasma_PlasmaIce_DownRight_UpLeft_0      ; Up-left
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Down_Up_0               ; Up, facing left

ProjectileDataTable_Charged_Power:
    dw $003C                                                             ; Damage
    dw InstList_SamusProjectile_Charged_Power_Up                         ; Up, facing right
    dw InstList_SamusProjectile_Charged_Power_UpRight                    ; Up-right
    dw InstList_SamusProjectile_Charged_Power_Right                      ; Right
    dw InstList_SamusProjectile_Charged_Power_DownRight                  ; Down-right
    dw InstList_SamusProjectile_Charged_Power_Down                       ; Down, facing right
    dw InstList_SamusProjectile_Charged_Power_Down                       ; Down, facing left
    dw InstList_SamusProjectile_Charged_Power_DownLeft                   ; Down-left
    dw InstList_SamusProjectile_Charged_Power_Left                       ; Left
    dw InstList_SamusProjectile_Charged_Power_UpLeft                     ; Up-left
    dw InstList_SamusProjectile_Charged_Power_Up                         ; Up, facing left

ProjectileDataTable_Charged_Spazer:
    dw $0078                                                             ; Damage
    dw InstList_SamusProjectile_Charged_S_SI_Down_Up_0                   ; Up, facing right
    dw InstList_SamusProjectile_Charged_S_SI_DownLeft_UpRight_0          ; Up-right
    dw InstList_SamusProjectile_Charged_S_SI_Left_Right_0                ; Right
    dw InstList_SamusProjectile_Charged_S_SI_DownRight_UpLeft_0          ; Down-right
    dw InstList_SamusProjectile_Charged_S_SI_Down_Up_0                   ; Down, facing right
    dw InstList_SamusProjectile_Charged_S_SI_Down_Up_0                   ; Down, facing left
    dw InstList_SamusProjectile_Charged_S_SI_DownLeft_UpRight_0          ; Down-left
    dw InstList_SamusProjectile_Charged_S_SI_Left_Right_0                ; Left
    dw InstList_SamusProjectile_Charged_S_SI_DownRight_UpLeft_0          ; Up-left
    dw InstList_SamusProjectile_Charged_S_SI_Down_Up_0                   ; Up, facing left

ProjectileDataTable_Charged_SpazerIce:
    dw $00B4                                                             ; Damage
    dw InstList_SamusProjectile_Charged_S_SI_Down_Up_0                   ; Up, facing right
    dw InstList_SamusProjectile_Charged_S_SI_DownLeft_UpRight_0          ; Up-right
    dw InstList_SamusProjectile_Charged_S_SI_Left_Right_0                ; Right
    dw InstList_SamusProjectile_Charged_S_SI_DownRight_UpLeft_0          ; Down-right
    dw InstList_SamusProjectile_Charged_S_SI_Down_Up_0                   ; Down, facing right
    dw InstList_SamusProjectile_Charged_S_SI_Down_Up_0                   ; Down, facing left
    dw InstList_SamusProjectile_Charged_S_SI_DownLeft_UpRight_0          ; Down-left
    dw InstList_SamusProjectile_Charged_S_SI_Left_Right_0                ; Left
    dw InstList_SamusProjectile_Charged_S_SI_DownRight_UpLeft_0          ; Up-left
    dw InstList_SamusProjectile_Charged_S_SI_Down_Up_0                   ; Up, facing left

ProjectileDataTable_Charged_SpazerIceWave:
    dw $012C                                                             ; Damage
    dw InstList_SamusProjectile_Charged_SW_SIW_Up_0                      ; Up, facing right
    dw InstList_SamusProjectile_Charged_SW_SIW_UpRight_0                 ; Up-right
    dw InstList_SamusProjectile_Charged_SW_SIW_Right_0                   ; Right
    dw InstList_SamusProjectile_Charged_SW_SIW_DownRight_0               ; Down-right
    dw InstList_SamusProjectile_Charged_SW_SIW_Down_0                    ; Down, facing right
    dw InstList_SamusProjectile_Charged_SW_SIW_Down_0                    ; Down, facing left
    dw InstList_SamusProjectile_Charged_SW_SIW_DownLeft_0                ; Down-left
    dw InstList_SamusProjectile_Charged_SW_SIW_Left_0                    ; Left
    dw InstList_SamusProjectile_Charged_SW_SIW_UpLeft_0                  ; Up-left
    dw InstList_SamusProjectile_Charged_SW_SIW_Up_0                      ; Up, facing left

ProjectileDataTable_Charged_PlasmaIceWave:
    dw $0384                                                             ; Damage
    dw InstList_SamusProjectile_Charged_PW_PIW_Down_Up_0                 ; Up, facing right
    dw InstList_SamusProjectile_Charged_PW_PIW_DownLeft_UpRight_0        ; Up-right
    dw InstList_SamusProjectile_Charged_PW_PIW_Left_Right_0              ; Right
    dw InstList_SamusProjectile_Charged_PW_PIW_DownRight_UpLeft_0        ; Down-right
    dw InstList_SamusProjectile_Charged_PW_PIW_Down_Up_0                 ; Down, facing right
    dw InstList_SamusProjectile_Charged_PW_PIW_Down_Up_0                 ; Down, facing left
    dw InstList_SamusProjectile_Charged_PW_PIW_DownLeft_UpRight_0        ; Down-left
    dw InstList_SamusProjectile_Charged_PW_PIW_Left_Right_0              ; Left
    dw InstList_SamusProjectile_Charged_PW_PIW_DownRight_UpLeft_0        ; Up-left
    dw InstList_SamusProjectile_Charged_PW_PIW_Down_Up_0                 ; Up, facing left

ProjectileDataTable_Charged_Ice:
    dw $005A                                                             ; Damage
    dw InstList_SamusProjectile_Charged_Ice                              ; Up, facing right
    dw InstList_SamusProjectile_Charged_Ice                              ; Up-right
    dw InstList_SamusProjectile_Charged_Ice                              ; Right
    dw InstList_SamusProjectile_Charged_Ice                              ; Down-right
    dw InstList_SamusProjectile_Charged_Ice                              ; Down, facing right
    dw InstList_SamusProjectile_Charged_Ice                              ; Down, facing left
    dw InstList_SamusProjectile_Charged_Ice                              ; Down-left
    dw InstList_SamusProjectile_Charged_Ice                              ; Left
    dw InstList_SamusProjectile_Charged_Ice                              ; Up-left
    dw InstList_SamusProjectile_Charged_Ice                              ; Up, facing left

ProjectileDataTable_Charged_Plasma:
    dw $01C2                                                             ; Damage
    dw InstList_SamusProjectile_Charged_P_PI_Down_Up_0                   ; Up, facing right
    dw InstList_SamusProjectile_Charged_P_PI_DownLeft_UpRight_0          ; Up-right
    dw InstList_SamusProjectile_Charged_P_PI_Left_Right_0                ; Right
    dw InstList_SamusProjectile_Charged_P_PI_DownRight_UpLeft_0          ; Down-right
    dw InstList_SamusProjectile_Charged_P_PI_Down_Up_0                   ; Down, facing right
    dw InstList_SamusProjectile_Charged_P_PI_Down_Up_0                   ; Down, facing left
    dw InstList_SamusProjectile_Charged_P_PI_DownLeft_UpRight_0          ; Down-left
    dw InstList_SamusProjectile_Charged_P_PI_Left_Right_0                ; Left
    dw InstList_SamusProjectile_Charged_P_PI_DownRight_UpLeft_0          ; Up-left
    dw InstList_SamusProjectile_Charged_P_PI_Down_Up_0                   ; Up, facing left

ProjectileDataTable_Charged_Wave:
    dw $0096                                                             ; Damage
    dw InstList_SamusProjectile_Charged_Wave_Up                          ; Up, facing right
    dw InstList_SamusProjectile_Charged_Wave_DownLeft_UpRight            ; Up-right
    dw InstList_SamusProjectile_Charged_Wave_Left_Right                  ; Right
    dw InstList_SamusProjectile_Charged_Wave_DownRight_UpLeft            ; Down-right
    dw InstList_SamusProjectile_Charged_Wave_Down                        ; Down, facing right
    dw InstList_SamusProjectile_Charged_Wave_Down                        ; Down, facing left
    dw InstList_SamusProjectile_Charged_Wave_DownLeft_UpRight            ; Down-left
    dw InstList_SamusProjectile_Charged_Wave_Left_Right                  ; Left
    dw InstList_SamusProjectile_Charged_Wave_DownRight_UpLeft            ; Up-left
    dw InstList_SamusProjectile_Charged_Wave_Up                          ; Up, facing left

ProjectileDataTable_Charged_IceWave:
    dw $00B4                                                             ; Damage
    dw InstList_SamusProjectile_Charged_IW_Up                            ; Up, facing right
    dw InstList_SamusProjectile_Charged_IW_DownLeft_UpRight              ; Up-right
    dw InstList_SamusProjectile_Charged_IW_Left_Right                    ; Right
    dw InstList_SamusProjectile_Charged_IW_DownRight_UpLeft              ; Down-right
    dw InstList_SamusProjectile_Charged_IW_Down                          ; Down, facing right
    dw InstList_SamusProjectile_Charged_IW_Down                          ; Down, facing left
    dw InstList_SamusProjectile_Charged_IW_DownLeft_UpRight              ; Down-left
    dw InstList_SamusProjectile_Charged_IW_Left_Right                    ; Left
    dw InstList_SamusProjectile_Charged_IW_DownRight_UpLeft              ; Up-left
    dw InstList_SamusProjectile_Charged_IW_Up                            ; Up, facing left

ProjectileDataTable_Charged_SpazerWave:
    dw $00D2                                                             ; Damage
    dw InstList_SamusProjectile_Charged_SW_SIW_Up_0                      ; Up, facing right
    dw InstList_SamusProjectile_Charged_SW_SIW_UpRight_0                 ; Up-right
    dw InstList_SamusProjectile_Charged_SW_SIW_Right_0                   ; Right
    dw InstList_SamusProjectile_Charged_SW_SIW_DownRight_0               ; Down-right
    dw InstList_SamusProjectile_Charged_SW_SIW_Down_0                    ; Down, facing right
    dw InstList_SamusProjectile_Charged_SW_SIW_Down_0                    ; Down, facing left
    dw InstList_SamusProjectile_Charged_SW_SIW_DownLeft_0                ; Down-left
    dw InstList_SamusProjectile_Charged_SW_SIW_Left_0                    ; Left
    dw InstList_SamusProjectile_Charged_SW_SIW_UpLeft_0                  ; Up-left
    dw InstList_SamusProjectile_Charged_SW_SIW_Up_0                      ; Up, facing left

ProjectileDataTable_Charged_PlasmaIce:
    dw $0258                                                             ; Damage
    dw InstList_SamusProjectile_Charged_P_PI_Down_Up_0                   ; Up, facing right
    dw InstList_SamusProjectile_Charged_P_PI_DownLeft_UpRight_0          ; Up-right
    dw InstList_SamusProjectile_Charged_P_PI_Left_Right_0                ; Right
    dw InstList_SamusProjectile_Charged_P_PI_DownRight_UpLeft_0          ; Down-right
    dw InstList_SamusProjectile_Charged_P_PI_Down_Up_0                   ; Down, facing right
    dw InstList_SamusProjectile_Charged_P_PI_Down_Up_0                   ; Down, facing left
    dw InstList_SamusProjectile_Charged_P_PI_DownLeft_UpRight_0          ; Down-left
    dw InstList_SamusProjectile_Charged_P_PI_Left_Right_0                ; Left
    dw InstList_SamusProjectile_Charged_P_PI_DownRight_UpLeft_0          ; Up-left
    dw InstList_SamusProjectile_Charged_P_PI_Down_Up_0                   ; Up, facing left

ProjectileDataTable_Charged_PlasmaWave:
    dw $02EE                                                             ; Damage
    dw InstList_SamusProjectile_Charged_PW_PIW_Down_Up_0                 ; Up, facing right
    dw InstList_SamusProjectile_Charged_PW_PIW_DownLeft_UpRight_0        ; Up-right
    dw InstList_SamusProjectile_Charged_PW_PIW_Left_Right_0              ; Right
    dw InstList_SamusProjectile_Charged_PW_PIW_DownRight_UpLeft_0        ; Down-right
    dw InstList_SamusProjectile_Charged_PW_PIW_Down_Up_0                 ; Down, facing right
    dw InstList_SamusProjectile_Charged_PW_PIW_Down_Up_0                 ; Down, facing left
    dw InstList_SamusProjectile_Charged_PW_PIW_DownLeft_UpRight_0        ; Down-left
    dw InstList_SamusProjectile_Charged_PW_PIW_Left_Right_0              ; Left
    dw InstList_SamusProjectile_Charged_PW_PIW_DownRight_UpLeft_0        ; Up-left
    dw InstList_SamusProjectile_Charged_PW_PIW_Down_Up_0                 ; Up, facing left

ProjectileDataTable_NonBeam_Missile:
    dw $0064                                                             ; Damage
    dw InstList_SamusProjectile_Missiles_Up                              ; Up, facing right
    dw InstList_SamusProjectile_Missiles_UpRight                         ; Up-right
    dw InstList_SamusProjectile_Missiles_Right                           ; Right
    dw InstList_SamusProjectile_Missiles_DownRight                       ; Down-right
    dw InstList_SamusProjectile_Missiles_Down                            ; Down, facing right
    dw InstList_SamusProjectile_Missiles_Down                            ; Down, facing left
    dw InstList_SamusProjectile_Missiles_DownLeft                        ; Down-left
    dw InstList_SamusProjectile_Missiles_Left                            ; Left
    dw InstList_SamusProjectile_Missiles_UpLeft                          ; Up-left
    dw InstList_SamusProjectile_Missiles_Up                              ; Up, facing left

ProjectileDataTable_NonBeam_SuperMissile:
    dw $012C                                                             ; Damage
    dw InstList_SamusProjectile_SuperMissiles_Up                         ; Up, facing right
    dw InstList_SamusProjectile_SuperMissiles_UpRight                    ; Up-right
    dw InstList_SamusProjectile_SuperMissiles_Right                      ; Right
    dw InstList_SamusProjectile_SuperMissiles_DownRight                  ; Down-right
    dw InstList_SamusProjectile_SuperMissiles_Down                       ; Down, facing right
    dw InstList_SamusProjectile_SuperMissiles_Down                       ; Down, facing left
    dw InstList_SamusProjectile_SuperMissiles_DownLeft                   ; Down-left
    dw InstList_SamusProjectile_SuperMissiles_Left                       ; Left
    dw InstList_SamusProjectile_SuperMissiles_UpLeft                     ; Up-left
    dw InstList_SamusProjectile_SuperMissiles_Up                         ; Up, facing left

ProjectileDataTable_NonBeam_SuperMissileLink:
    dw $012C                                                             ; Damage
    dw InstList_SamusProjectile_SuperMissileLink

ProjectileDataTable_NonBeam_PowerBomb:
    dw $00C8                                                             ; Damage
    dw InstList_SamusProjectile_PowerBomb

ProjectileDataTable_NonBeam_Bomb:
    dw $001E                                                             ; Damage
    dw InstList_SamusProjectile_Bomb

ProjectileDataTable_NonBeam_BeamExplosion:
    dw $0008                                                             ; Damage is ignored
  .pointer:
    dw InstList_SamusProjectile_BeamExplosion

ProjectileDataTable_NonBeam_MissileExplosion:
    dw $0008                                                             ; Damage is ignored
  .pointer:
    dw InstList_SamusProjectile_MissileExplosion

ProjectileDataTable_NonBeam_BombExplosion:
    dw $0000                                                             ; Damage is ignored
  .pointer:
    dw InstList_SamusProjectile_BombExplosion

ProjectileDataTable_NonBeam_PlasmaSBA:
    dw $012C                                                             ; Damage
    dw InstList_SamusProjectile_PlasmaSBA

ProjectileDataTable_NonBeam_WaveSBA:
    dw $012C                                                             ; Damage
    dw InstList_SamusProjectile_WaveSBA

ProjectileDataTable_NonBeam_SpazerSBA:
    dw $012C                                                             ; Damage
    dw InstList_SamusProjectile_Spazer_SpazerIce_Up_0

ProjectileDataTable_NonBeam_SuperMissileExplosion:
    dw $0008                                                             ; Damage is ignored
  .pointer:
    dw InstList_SamusProjectile_SuperMissileExplosion

UNUSED_ProjectileDataTable_NonBeam_Projectile25_938695:
    dw $F000                                                             ; Damage
    dw UNUSED_InstList_SamusProjectile_Projectile25_93A0F3               ; Up, facing right
    dw UNUSED_InstList_SamusProjectile_Projectile25_93A0F3               ; Up-right
    dw UNUSED_InstList_SamusProjectile_Projectile25_93A0F3               ; Right
    dw UNUSED_InstList_SamusProjectile_Projectile25_93A0F3               ; Down-right
    dw UNUSED_InstList_SamusProjectile_Projectile25_93A0F3               ; Down, facing right
    dw UNUSED_InstList_SamusProjectile_Projectile25_93A0F3               ; Down, facing left
    dw UNUSED_InstList_SamusProjectile_Projectile25_93A0F3               ; Down-left
    dw UNUSED_InstList_SamusProjectile_Projectile25_93A0F3               ; Left
    dw UNUSED_InstList_SamusProjectile_Projectile25_93A0F3               ; Up-left
    dw UNUSED_InstList_SamusProjectile_Projectile25_93A0F3               ; Up, facing left

ProjectileDataTable_NonBeam_SpazerSBATrail:
    dw $012C                                                             ; Damage
    dw InstList_SamusProjectile_SpazerSBATrail_0                         ; Up, facing right
    dw InstList_SamusProjectile_SpazerSBATrail_0                         ; Up-right
    dw InstList_SamusProjectile_SpazerSBATrail_0                         ; Right
    dw InstList_SamusProjectile_SpazerSBATrail_0                         ; Down-right
    dw InstList_SamusProjectile_SpazerSBATrail_0                         ; Down, facing right
    dw InstList_SamusProjectile_SpazerSBATrail_0                         ; Down, facing left
    dw InstList_SamusProjectile_SpazerSBATrail_0                         ; Down-left
    dw InstList_SamusProjectile_SpazerSBATrail_0                         ; Left
    dw InstList_SamusProjectile_SpazerSBATrail_0                         ; Up-left
    dw InstList_SamusProjectile_SpazerSBATrail_0                         ; Up, facing left

ProjectileDataTable_NonBeam_ShinesparkEcho:
    dw $1000                                                             ; Damage
    dw InstList_SamusProjectile_ShinesparkEcho                           ; Up, facing right
    dw InstList_SamusProjectile_ShinesparkEcho                           ; Up-right
    dw InstList_SamusProjectile_ShinesparkEcho                           ; Right
    dw InstList_SamusProjectile_ShinesparkEcho                           ; Down-right
    dw InstList_SamusProjectile_ShinesparkEcho                           ; Down, facing right
    dw InstList_SamusProjectile_ShinesparkEcho                           ; Down, facing left
    dw InstList_SamusProjectile_ShinesparkEcho                           ; Down-left
    dw InstList_SamusProjectile_ShinesparkEcho                           ; Left
    dw InstList_SamusProjectile_ShinesparkEcho                           ; Up-left
    dw InstList_SamusProjectile_ShinesparkEcho                           ; Up, facing left

UNUSED_ProjectileDataTable_NonBeam_Projectile27_9386D7:
    dw $0000
    dw UNUSED_InstList_SamusProjectile_Projectile27_93A16D

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
    dw $000F,ProjectileFlareSpritemaps_Power_2
    db $04,$04 : dw $0000
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Power_Up


;;; $86E7: Instruction list - power - up-right ;;;
InstList_SamusProjectile_Power_UpRight:
    dw $000F,ProjectileFlareSpritemaps_Power_3
    db $08,$04 : dw $0000
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Power_UpRight


;;; $86F3: Instruction list - power - right ;;;
InstList_SamusProjectile_Power_Right:
    dw $000F,ProjectileFlareSpritemaps_Power_4
    db $08,$04 : dw $0000
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Power_Right


;;; $86FF: Instruction list - power - down-right ;;;
InstList_SamusProjectile_Power_DownRight:
    dw $000F,ProjectileFlareSpritemaps_Power_5
    db $08,$04 : dw $0000
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Power_DownRight


;;; $870B: Instruction list - power - down ;;;
InstList_SamusProjectile_Power_Down:
    dw $000F,ProjectileFlareSpritemaps_Power_6
    db $04,$04 : dw $0000
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Power_Down


;;; $8717: Instruction list - power - down-left ;;;
InstList_SamusProjectile_Power_DownLeft:
    dw $000F,ProjectileFlareSpritemaps_Power_7
    db $08,$04 : dw $0000
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Power_DownLeft


;;; $8723: Instruction list - power - left ;;;
InstList_SamusProjectile_Power_Left:
    dw $000F,ProjectileFlareSpritemaps_Power_0
    db $08,$04 : dw $0000
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Power_Left


;;; $872F: Instruction list - power - up-left ;;;
InstList_SamusProjectile_Power_UpLeft:
    dw $000F,ProjectileFlareSpritemaps_Power_1
    db $08,$04 : dw $0000
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Power_UpLeft


;;; $873B: Instruction list - wave / ice + wave - up ;;;
InstList_SamusProjectile_Wave_IceWave_Up:
    dw $0004,Spritemap_Nothing_93A117
    db $0C,$04 : dw $0000


;;; $8743: Instruction list - wave / ice + wave - down ;;;
InstList_SamusProjectile_Wave_IceWave_Down:
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_0
    db $0C,$04 : dw $0000
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_11
    db $0C,$04 : dw $0001
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_12
    db $0C,$04 : dw $0002
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_13
    db $10,$04 : dw $0003
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_14
    db $14,$04 : dw $0004
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_13
    db $10,$04 : dw $0005
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_12
    db $0C,$04 : dw $0006
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_11
    db $0C,$04 : dw $0007
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_0
    db $0C,$04 : dw $0008
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_15
    db $0C,$04 : dw $0009
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_16
    db $0C,$04 : dw $000A
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_17
    db $10,$04 : dw $000B
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_18
    db $14,$04 : dw $000C
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_17
    db $10,$04 : dw $000D
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_16
    db $0C,$04 : dw $000E
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_15
    db $0C,$04 : dw $000F
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Wave_IceWave_Down


;;; $87C7: Instruction list - wave / ice + wave - down-left / up-right ;;;
InstList_SamusProjectile_Wave_IceWave_DownLeft_UpRight:
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_0
    db $08,$08 : dw $0000
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_19
    db $08,$08 : dw $0001
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_1A
    db $08,$08 : dw $0002
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_1B
    db $0A,$0A : dw $0003
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_1C
    db $0C,$0C : dw $0004
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_1B
    db $0A,$0A : dw $0005
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_1A
    db $08,$08 : dw $0006
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_19
    db $06,$06 : dw $0007
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_0
    db $04,$04 : dw $0008
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_1D
    db $06,$06 : dw $0009
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_1E
    db $08,$08 : dw $000A
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_1F
    db $0A,$0A : dw $000B
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_20
    db $0C,$0C : dw $000C
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_1F
    db $0A,$0A : dw $000D
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_1E
    db $08,$08 : dw $000E
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_1D
    db $08,$08 : dw $000F
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Wave_IceWave_DownLeft_UpRight


;;; $884B: Instruction list - wave / ice + wave - left / right ;;;
InstList_SamusProjectile_Wave_IceWave_Left_Right:
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_0
    db $04,$0C : dw $0000
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_1
    db $04,$0C : dw $0001
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_2
    db $04,$0C : dw $0002
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_3
    db $04,$10 : dw $0003
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_4
    db $04,$14 : dw $0004
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_3
    db $04,$10 : dw $0005
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_2
    db $04,$0C : dw $0006
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_1
    db $04,$0C : dw $0007
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_0
    db $04,$0C : dw $0008
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_5
    db $04,$0C : dw $0009
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_6
    db $04,$0C : dw $000A
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_7
    db $04,$10 : dw $000B
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_8
    db $04,$14 : dw $000C
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_7
    db $04,$10 : dw $000D
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_6
    db $04,$0C : dw $000E
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_5
    db $04,$0C : dw $000F
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Wave_IceWave_Left_Right


;;; $88CF: Instruction list - wave / ice + wave - down-right / up-left ;;;
InstList_SamusProjectile_Wave_IceWave_DownRight_UpLeft:
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_0
    db $08,$08 : dw $0000
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_9
    db $08,$08 : dw $0001
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_A
    db $08,$08 : dw $0002
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_B
    db $0A,$0A : dw $0003
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_C
    db $0C,$0C : dw $0004
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_B
    db $0A,$0A : dw $0005
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_A
    db $08,$08 : dw $0006
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_9
    db $06,$06 : dw $0007
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_0
    db $04,$04 : dw $0008
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_D
    db $06,$06 : dw $0009
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_E
    db $08,$08 : dw $000A
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_F
    db $0A,$0A : dw $000B
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_10
    db $0C,$0C : dw $000C
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_F
    db $0A,$0A : dw $000D
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_E
    db $08,$08 : dw $000E
    dw $0001,ProjectileFlareSpritemaps_Wave_IceWave_D
    db $08,$08 : dw $000F
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Wave_IceWave_DownRight_UpLeft


;;; $8953: Instruction list - ice ;;;
InstList_SamusProjectile_Ice:
    dw $0001,ProjectileFlareSpritemaps_Ice_0
    db $08,$08 : dw $0000
    dw $0001,ProjectileFlareSpritemaps_Ice_1
    db $08,$08 : dw $0001
    dw $0001,ProjectileFlareSpritemaps_Ice_2
    db $08,$08 : dw $0002
    dw $0001,ProjectileFlareSpritemaps_Ice_3
    db $08,$08 : dw $0003
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Ice


;;; $8977: Instruction list - spazer / spazer + ice - up ;;;
InstList_SamusProjectile_Spazer_SpazerIce_Up_0:
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_23
    db $0C,$08 : dw $0000
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_25
    db $0C,$08 : dw $0001

InstList_SamusProjectile_Spazer_SpazerIce_Up_1:
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_28
    db $14,$08 : dw $0002
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Spazer_SpazerIce_Up_1


;;; $8993: Instruction list - spazer / spazer + ice - up-right ;;;
InstList_SamusProjectile_Spazer_SpazerIce_UpRight_0:
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_0
    db $08,$08 : dw $0000
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_1
    db $0C,$0C : dw $0001

InstList_SamusProjectile_Spazer_SpazerIce_UpRight_1:
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_4
    db $10,$10 : dw $0002
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Spazer_SpazerIce_UpRight_1


;;; $89AF: Instruction list - spazer / spazer + ice - right ;;;
InstList_SamusProjectile_Spazer_SpazerIce_Right_0:
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_29
    db $08,$0C : dw $0000
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_2B
    db $08,$0C : dw $0001

InstList_SamusProjectile_Spazer_SpazerIce_Right_1:
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_2E
    db $08,$14 : dw $0002
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Spazer_SpazerIce_Right_1


;;; $89CB: Instruction list - spazer / spazer + ice - down-right ;;;
InstList_SamusProjectile_Spazer_SpazerIce_DownRight_0:
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_6
    db $08,$08 : dw $0000
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_7
    db $0C,$0C : dw $0001

InstList_SamusProjectile_Spazer_SpazerIce_DownRight_1:
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_A
    db $10,$10 : dw $0002
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Spazer_SpazerIce_DownRight_1


;;; $89E7: Instruction list - spazer / spazer + ice - down ;;;
InstList_SamusProjectile_Spazer_SpazerIce_Down_0:
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_17
    db $0C,$08 : dw $0000
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_19
    db $0C,$08 : dw $0001

InstList_SamusProjectile_Spazer_SpazerIce_Down_1:
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_1C
    db $14,$08 : dw $0002
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Spazer_SpazerIce_Down_1


;;; $8A03: Instruction list - spazer / spazer + ice - down-left ;;;
InstList_SamusProjectile_Spazer_SpazerIce_DownLeft_0:
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_C
    db $08,$08 : dw $0000
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_D
    db $0C,$0C : dw $0001

InstList_SamusProjectile_Spazer_SpazerIce_DownLeft_1:
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_10
    db $10,$10 : dw $0002
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Spazer_SpazerIce_DownLeft_1


;;; $8A1F: Instruction list - spazer / spazer + ice - left ;;;
InstList_SamusProjectile_Spazer_SpazerIce_Left_0:
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_1D
    db $08,$0C : dw $0000
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_1F
    db $08,$0C : dw $0001

InstList_SamusProjectile_Spazer_SpazerIce_Left_1:
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_22
    db $08,$14 : dw $0002
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Spazer_SpazerIce_Left_1


;;; $8A3B: Instruction list - spazer / spazer + ice - up-left ;;;
InstList_SamusProjectile_Spazer_SpazerIce_UpLeft_0:
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_11
    db $08,$08 : dw $0000
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_12
    db $0C,$0C : dw $0001

InstList_SamusProjectile_Spazer_SpazerIce_UpLeft_1:
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_15
    db $10,$10 : dw $0002
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Spazer_SpazerIce_UpLeft_1


;;; $8A57: Instruction list - spazer + wave / spazer + ice + wave - up ;;;
InstList_SamusProjectile_SpazerWave_SpazerIceWave_Up:
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_23
    db $0C,$08 : dw $0000
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_24
    db $0C,$08 : dw $0001
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_25
    db $0C,$08 : dw $0002
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_26
    db $11,$08 : dw $0003
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_27
    db $13,$08 : dw $0004
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_28
    db $14,$08 : dw $0005
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_27
    db $13,$08 : dw $0006
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_26
    db $11,$08 : dw $0007
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_25
    db $0C,$08 : dw $0008
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_24
    db $0C,$08 : dw $0009
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Up


;;; $8AAB: Instruction list - spazer + wave / spazer + ice + wave - up-right ;;;
InstList_SamusProjectile_SpazerWave_SpazerIceWave_UpRight:
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_0
    db $08,$08 : dw $0000
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_5
    db $08,$08 : dw $0001
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_1
    db $0C,$0C : dw $0002
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_2
    db $10,$10 : dw $0003
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_3
    db $10,$10 : dw $0004
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_4
    db $10,$10 : dw $0005
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_3
    db $10,$10 : dw $0006
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_2
    db $10,$10 : dw $0007
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_1
    db $0C,$0C : dw $0008
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_5
    db $08,$08 : dw $0009
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_UpRight


;;; $8AFF: Instruction list - spazer + wave / spazer + ice + wave - right ;;;
InstList_SamusProjectile_SpazerWave_SpazerIceWave_Right:
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_29
    db $08,$0C : dw $0000
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_2A
    db $08,$0C : dw $0001
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_2B
    db $08,$0C : dw $0002
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_2C
    db $08,$11 : dw $0003
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_2D
    db $08,$13 : dw $0004
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_2E
    db $08,$14 : dw $0005
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_2D
    db $08,$13 : dw $0006
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_2C
    db $08,$11 : dw $0007
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_2B
    db $08,$0C : dw $0008
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_2A
    db $08,$0C : dw $0009
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Right


;;; $8B53: Instruction list - spazer + wave / spazer + ice + wave - down-right ;;;
InstList_SamusProjectile_SpazerWave_SpazerIceWave_DownRight:
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_6
    db $08,$08 : dw $0000
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_B
    db $08,$08 : dw $0001
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_7
    db $0C,$0C : dw $0002
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_8
    db $10,$10 : dw $0003
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_9
    db $10,$10 : dw $0004
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_A
    db $10,$10 : dw $0005
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_9
    db $10,$10 : dw $0006
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_8
    db $10,$10 : dw $0007
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_7
    db $0C,$0C : dw $0008
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_B
    db $08,$08 : dw $0009
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_DownRight


;;; $8BA7: Instruction list - spazer + wave / spazer + ice + wave - down ;;;
InstList_SamusProjectile_SpazerWave_SpazerIceWave_Down:
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_17
    db $0C,$08 : dw $0000
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_18
    db $0C,$08 : dw $0001
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_19
    db $0C,$08 : dw $0002
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_1A
    db $11,$08 : dw $0003
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_1B
    db $13,$08 : dw $0004
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_1C
    db $14,$08 : dw $0005
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_1B
    db $13,$08 : dw $0006
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_1A
    db $11,$08 : dw $0007
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_19
    db $0C,$08 : dw $0008
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_18
    db $0C,$08 : dw $0009
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Down


;;; $8BFB: Instruction list - spazer + wave / spazer + ice + wave - down-left ;;;
InstList_SamusProjectile_SpazerWave_SpazerIceWave_DownLeft:
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_C
    db $08,$08 : dw $0000
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_D
    db $08,$08 : dw $0001
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_E
    db $0C,$0C : dw $0002
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_F
    db $10,$10 : dw $0003
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_10
    db $10,$10 : dw $0004
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_10
    db $10,$10 : dw $0005
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_10
    db $10,$10 : dw $0006
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_F
    db $10,$10 : dw $0007
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_E
    db $0C,$0C : dw $0008
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_D
    db $08,$08 : dw $0009
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_DownLeft


;;; $8C4F: Instruction list - spazer + wave / spazer + ice + wave - left ;;;
InstList_SamusProjectile_SpazerWave_SpazerIceWave_Left:
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_1D
    db $08,$0C : dw $0000
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_1E
    db $08,$0C : dw $0001
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_1F
    db $08,$0C : dw $0002
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_20
    db $08,$11 : dw $0003
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_21
    db $08,$13 : dw $0004
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_22
    db $08,$14 : dw $0005
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_21
    db $08,$13 : dw $0006
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_20
    db $08,$11 : dw $0007
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_1F
    db $08,$0C : dw $0008
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_1E
    db $08,$0C : dw $0009
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_Left


;;; $8CA3: Instruction list - spazer + wave / spazer + ice + wave - up-left ;;;
InstList_SamusProjectile_SpazerWave_SpazerIceWave_UpLeft:
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_11
    db $08,$08 : dw $0000
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_16
    db $08,$08 : dw $0001
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_12
    db $0C,$0C : dw $0002
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_13
    db $10,$10 : dw $0003
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_14
    db $10,$10 : dw $0004
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_15
    db $10,$10 : dw $0005
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_14
    db $10,$10 : dw $0006
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_13
    db $10,$10 : dw $0007
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_12
    db $0C,$0C : dw $0008
    dw $0002,ProjectileFlareSpritemaps_S_SI_SW_SIW_16
    db $08,$08 : dw $0009
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_SpazerWave_SpazerIceWave_UpLeft


;;; $8CF7: Instruction list - plasma / plasma + ice - down / up ;;;
InstList_SamusProjectile_Plasma_PlasmaIce_Down_Up_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_4
    db $08,$10 : dw $0000

InstList_SamusProjectile_Plasma_PlasmaIce_Down_Up_1:
    dw $000F,ProjectileFlareSpritemaps_Plasma_PlasmaIce_2
    db $08,$10 : dw $0001
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Down_Up_1


;;; $8D0B: Instruction list - plasma / plasma + ice - down-left / up-right ;;;
InstList_SamusProjectile_Plasma_PlasmaIce_DownLeft_UpRight_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_C
    db $08,$08 : dw $0000

InstList_SamusProjectile_Plasma_PlasmaIce_DownLeft_UpRight_1:
    dw $000F,ProjectileFlareSpritemaps_Plasma_PlasmaIce_3
    db $08,$08 : dw $0001
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Plasma_PlasmaIce_DownLeft_UpRight_1


;;; $8D1F: Instruction list - plasma / plasma + ice - left / right ;;;
InstList_SamusProjectile_Plasma_PlasmaIce_Left_Right_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_0
    db $08,$08 : dw $0000

InstList_SamusProjectile_Plasma_PlasmaIce_Left_Right_1:
    dw $000F,ProjectileFlareSpritemaps_Plasma_PlasmaIce_0
    db $10,$08 : dw $0001
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Plasma_PlasmaIce_Left_Right_1


;;; $8D33: Instruction list - plasma / plasma + ice - down-right / up-left ;;;
InstList_SamusProjectile_Plasma_PlasmaIce_DownRight_UpLeft_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_8
    db $08,$08 : dw $0000

InstList_SamusProjectile_Plasma_PlasmaIce_DownRight_UpLeft_1:
    dw $000F,ProjectileFlareSpritemaps_Plasma_PlasmaIce_1
    db $08,$08 : dw $0001
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Plasma_PlasmaIce_DownRight_UpLeft_1


;;; $8D47: Instruction list - plasma + ice + wave - down / up ;;;
InstList_SamusProjectile_PlasmaIceWave_Down_Up:
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_4
    db $0C,$10 : dw $0000


;;; $8D4F: Instruction list - plasma + wave - down / up ;;;
InstList_SamusProjectile_PlasmaWave_Down_Up:
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_14
    db $0C,$10 : dw $0001
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_15
    db $0C,$10 : dw $0002
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_16
    db $11,$10 : dw $0003
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_17
    db $13,$10 : dw $0004
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_18
    db $14,$10 : dw $0005
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_17
    db $13,$10 : dw $0006
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_16
    db $11,$10 : dw $0007
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_15
    db $0C,$10 : dw $0008
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_PlasmaWave_Down_Up


;;; $8D93: Instruction list - plasma + ice + wave - down-left / up-right ;;;
InstList_SamusProjectile_PlasmaIceWave_DownLeft_UpRight:
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_C
    db $08,$08 : dw $0000


;;; $8D9B: Instruction list - plasma + wave - down-left / up-right ;;;
InstList_SamusProjectile_PlasmaWave_DownLeft_UpRight:
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_32
    db $08,$08 : dw $0001
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_33
    db $0C,$0C : dw $0002
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_34
    db $10,$10 : dw $0003
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_35
    db $10,$10 : dw $0004
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_36
    db $14,$14 : dw $0005
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_35
    db $10,$10 : dw $0006
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_34
    db $10,$10 : dw $0007
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_33
    db $0C,$0C : dw $0008
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_PlasmaWave_DownLeft_UpRight


;;; $8DDF: Instruction list - plasma + wave / plasma + ice + wave - left / right ;;;
InstList_SamusProj_PlasmaWave_PlasmaIceWave_Left_Right_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_0
    db $08,$0C : dw $0000

InstList_SamusProj_PlasmaWave_PlasmaIceWave_Left_Right_1:
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_0
    db $10,$0C : dw $0001
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_1
    db $10,$0C : dw $0002
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_2
    db $10,$11 : dw $0003
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_3
    db $10,$13 : dw $0004
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_4
    db $10,$14 : dw $0005
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_3
    db $10,$13 : dw $0006
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_2
    db $10,$11 : dw $0007
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_1
    db $10,$0C : dw $0008
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProj_PlasmaWave_PlasmaIceWave_Left_Right_1


;;; $8E2B: Instruction list - plasma + ice + wave - down-right / up-left ;;;
InstList_SamusProjectile_PlasmaIceWave_DownRight_UpLeft:
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_8
    db $08,$08 : dw $0000


;;; $8E33: Instruction list - plasma + wave - down-right / up-left ;;;
InstList_SamusProjectile_PlasmaWave_DownRight_UpLeft:
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_A
    db $08,$08 : dw $0001
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_B
    db $0C,$0C : dw $0002
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_C
    db $10,$10 : dw $0003
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_D
    db $10,$10 : dw $0004
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_E
    db $14,$14 : dw $0005
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_D
    db $10,$10 : dw $0006
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_C
    db $10,$10 : dw $0007
    dw $0002,ProjectileFlareSpritemaps_Charged_PW_PIW_B
    db $0C,$0C : dw $0008
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_PlasmaWave_DownRight_UpLeft


;;; $8E77: Instruction list - charged power - up ;;;
InstList_SamusProjectile_Charged_Power_Up:
    dw $0001,ProjectileFlareSpritemaps_Charged_Power_2
    db $08,$08 : dw $0000
    dw $0001,ProjectileFlareSpritemaps_Charged_Power_A
    db $08,$08 : dw $0001
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Charged_Power_Up


;;; $8E8B: Instruction list - charged power - up-right ;;;
InstList_SamusProjectile_Charged_Power_UpRight:
    dw $0001,ProjectileFlareSpritemaps_Charged_Power_3
    db $08,$08 : dw $0000
    dw $0001,ProjectileFlareSpritemaps_Charged_Power_B
    db $08,$08 : dw $0001
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Charged_Power_UpRight


;;; $8E9F: Instruction list - charged power - right ;;;
InstList_SamusProjectile_Charged_Power_Right:
    dw $0001,ProjectileFlareSpritemaps_Charged_Power_4
    db $08,$08 : dw $0000
    dw $0001,ProjectileFlareSpritemaps_Charged_Power_C
    db $08,$08 : dw $0001
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Charged_Power_Right


;;; $8EB3: Instruction list - charged power - down-right ;;;
InstList_SamusProjectile_Charged_Power_DownRight:
    dw $0001,ProjectileFlareSpritemaps_Charged_Power_5
    db $08,$08 : dw $0000
    dw $0001,ProjectileFlareSpritemaps_Charged_Power_D
    db $08,$08 : dw $0001
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Charged_Power_DownRight


;;; $8EC7: Instruction list - charged power - down ;;;
InstList_SamusProjectile_Charged_Power_Down:
    dw $0001,ProjectileFlareSpritemaps_Charged_Power_6
    db $08,$08 : dw $0000
    dw $0001,ProjectileFlareSpritemaps_Charged_Power_E
    db $08,$08 : dw $0001
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Charged_Power_Down


;;; $8EDB: Instruction list - charged power - down-left ;;;
InstList_SamusProjectile_Charged_Power_DownLeft:
    dw $0001,ProjectileFlareSpritemaps_Charged_Power_7
    db $08,$08 : dw $0000
    dw $0001,ProjectileFlareSpritemaps_Charged_Power_F
    db $08,$08 : dw $0001
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Charged_Power_DownLeft


;;; $8EEF: Instruction list - charged power - left ;;;
InstList_SamusProjectile_Charged_Power_Left:
    dw $0001,ProjectileFlareSpritemaps_Charged_Power_0
    db $08,$08 : dw $0000
    dw $0001,ProjectileFlareSpritemaps_Charged_Power_8
    db $08,$08 : dw $0001
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Charged_Power_Left


;;; $8F03: Instruction list - charged power - up-left ;;;
InstList_SamusProjectile_Charged_Power_UpLeft:
    dw $0001,ProjectileFlareSpritemaps_Charged_Power_1
    db $08,$08 : dw $0000
    dw $0001,ProjectileFlareSpritemaps_Charged_Power_9
    db $08,$08 : dw $0001
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Charged_Power_UpLeft


;;; $8F17: Instruction list - charged wave - up ;;;
InstList_SamusProjectile_Charged_Wave_Up:
    dw $0003,Spritemap_Nothing_93A117
    db $0C,$08 : dw $0000


;;; $8F1F: Instruction list - charged wave - down ;;;
InstList_SamusProjectile_Charged_Wave_Down:
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_0
    db $0C,$08 : dw $0000
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1
    db $0C,$08 : dw $0001
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1A
    db $10,$08 : dw $0002
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1B
    db $10,$08 : dw $0003
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1C
    db $14,$08 : dw $0004
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1D
    db $14,$08 : dw $0005
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1E
    db $17,$08 : dw $0006
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1F
    db $17,$08 : dw $0007
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_20
    db $18,$08 : dw $0008
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_21
    db $18,$08 : dw $0009
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1E
    db $17,$08 : dw $000A
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1F
    db $17,$08 : dw $000B
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1C
    db $14,$08 : dw $000C
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1D
    db $14,$08 : dw $000D
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1B
    db $10,$08 : dw $000E
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1A
    db $10,$08 : dw $000F
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Charged_Wave_Down


;;; $8FA3: Instruction list - charged wave - down-left / up-right ;;;
InstList_SamusProjectile_Charged_Wave_DownLeft_UpRight:
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_0
    db $08,$08 : dw $0000
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1
    db $08,$08 : dw $0001
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_12
    db $0C,$0C : dw $0002
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_13
    db $0C,$0C : dw $0003
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_14
    db $10,$10 : dw $0004
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_15
    db $10,$10 : dw $0005
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_16
    db $11,$11 : dw $0006
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_17
    db $11,$11 : dw $0007
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_18
    db $12,$12 : dw $0008
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_19
    db $12,$12 : dw $0009
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_16
    db $11,$11 : dw $000A
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_17
    db $11,$11 : dw $000B
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_14
    db $10,$10 : dw $000C
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_15
    db $10,$10 : dw $000D
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_12
    db $0C,$0C : dw $000E
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_13
    db $0C,$0C : dw $000F
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Charged_Wave_DownLeft_UpRight


;;; $9027: Instruction list - charged wave - left / right ;;;
InstList_SamusProjectile_Charged_Wave_Left_Right:
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_0
    db $08,$0C : dw $0000
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1
    db $08,$0C : dw $0001
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_2
    db $08,$10 : dw $0002
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_3
    db $08,$10 : dw $0003
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_4
    db $08,$14 : dw $0004
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_5
    db $08,$14 : dw $0005
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_6
    db $08,$17 : dw $0006
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_7
    db $08,$17 : dw $0007
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_8
    db $08,$18 : dw $0008
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_9
    db $08,$18 : dw $0009
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_6
    db $08,$17 : dw $000A
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_7
    db $08,$17 : dw $000B
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_4
    db $08,$14 : dw $000C
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_5
    db $08,$14 : dw $000D
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_3
    db $08,$10 : dw $000E
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_2
    db $08,$10 : dw $000F
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Charged_Wave_Left_Right


;;; $90AB: Instruction list - charged wave - down-right / up-left ;;;
InstList_SamusProjectile_Charged_Wave_DownRight_UpLeft:
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_0
    db $08,$08 : dw $0000
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1
    db $08,$08 : dw $0001
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_A
    db $0C,$0C : dw $0002
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_B
    db $0C,$0C : dw $0003
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_C
    db $10,$10 : dw $0004
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_D
    db $10,$10 : dw $0005
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_E
    db $11,$11 : dw $0006
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_F
    db $11,$11 : dw $0007
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_10
    db $12,$12 : dw $0008
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_11
    db $12,$12 : dw $0009
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_E
    db $11,$11 : dw $000A
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_F
    db $11,$11 : dw $000B
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_C
    db $10,$10 : dw $000C
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_D
    db $10,$10 : dw $000D
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_A
    db $0C,$0C : dw $000E
    dw $0001,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_B
    db $0C,$0C : dw $000F
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Charged_Wave_DownRight_UpLeft


;;; $912F: Instruction list - charged ice ;;;
InstList_SamusProjectile_Charged_Ice:
    dw $0001,ProjectileFlareSpritemaps_Charged_Ice_0
    db $08,$08 : dw $0000
    dw $0001,ProjectileFlareSpritemaps_Charged_Ice_1
    db $08,$08 : dw $0001
    dw $0001,ProjectileFlareSpritemaps_Charged_Ice_2
    db $08,$08 : dw $0002
    dw $0001,ProjectileFlareSpritemaps_Charged_Ice_3
    db $08,$08 : dw $0003
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Charged_Ice


;;; $9153: Instruction list - charged ice + wave - up ;;;
InstList_SamusProjectile_Charged_IW_Up:
    dw $0003,Spritemap_Nothing_93A117
    db $0C,$08 : dw $0000


;;; $915B: Instruction list - charged ice + wave - down ;;;
InstList_SamusProjectile_Charged_IW_Down:
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_0
    db $0C,$08 : dw $0000
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_1
    db $0C,$08 : dw $0001
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_1C
    db $10,$08 : dw $0002
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_1D
    db $10,$08 : dw $0003
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_1E
    db $14,$08 : dw $0004
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_1F
    db $14,$08 : dw $0005
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_20
    db $17,$08 : dw $0006
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_21
    db $17,$08 : dw $0007
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_22
    db $18,$08 : dw $0008
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_23
    db $18,$08 : dw $0009
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_20
    db $17,$08 : dw $000A
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_21
    db $17,$08 : dw $000B
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_1E
    db $14,$08 : dw $000C
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_1F
    db $14,$08 : dw $000D
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_1D
    db $10,$08 : dw $000E
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_1C
    db $10,$08 : dw $000F
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Charged_IW_Down


;;; $91DF: Instruction list - charged ice + wave - down-left / up-right ;;;
InstList_SamusProjectile_Charged_IW_DownLeft_UpRight:
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_0
    db $08,$08 : dw $0000
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_1
    db $08,$08 : dw $0001
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_12
    db $0C,$0C : dw $0002
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_13
    db $0C,$0C : dw $0003
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_14
    db $10,$10 : dw $0004
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_15
    db $10,$10 : dw $0005
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_16
    db $11,$11 : dw $0006
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_17
    db $11,$11 : dw $0007
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_18
    db $12,$12 : dw $0008
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_19
    db $12,$12 : dw $0009
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_16
    db $11,$11 : dw $000A
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_17
    db $11,$11 : dw $000B
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_14
    db $10,$10 : dw $000C
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_15
    db $10,$10 : dw $000D
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_12
    db $0C,$0C : dw $000E
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_13
    db $0C,$0C : dw $000F
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Charged_IW_DownLeft_UpRight


;;; $9263: Instruction list - charged ice + wave - left / right ;;;
InstList_SamusProjectile_Charged_IW_Left_Right:
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_0
    db $08,$0C : dw $0000
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_1
    db $08,$0C : dw $0001
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_2
    db $08,$10 : dw $0002
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_3
    db $08,$10 : dw $0003
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_4
    db $08,$14 : dw $0004
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_5
    db $08,$14 : dw $0005
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_6
    db $08,$17 : dw $0006
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_7
    db $08,$17 : dw $0007
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_8
    db $08,$18 : dw $0008
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_9
    db $08,$18 : dw $0009
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_6
    db $08,$17 : dw $000A
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_7
    db $08,$17 : dw $000B
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_4
    db $08,$14 : dw $000C
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_5
    db $08,$14 : dw $000D
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_3
    db $08,$10 : dw $000E
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_2
    db $08,$10 : dw $000F
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Charged_IW_Left_Right


;;; $92E7: Instruction list - charged ice + wave - down-right / up-left ;;;
InstList_SamusProjectile_Charged_IW_DownRight_UpLeft:
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_0
    db $08,$08 : dw $0000
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_1
    db $08,$08 : dw $0001
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_A
    db $0C,$0C : dw $0002
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_B
    db $0C,$0C : dw $0003
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_C
    db $10,$10 : dw $0004
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_D
    db $10,$10 : dw $0005
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_E
    db $11,$11 : dw $0006
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_F
    db $11,$11 : dw $0007
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_10
    db $12,$12 : dw $0008
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_11
    db $12,$12 : dw $0009
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_E
    db $11,$11 : dw $000A
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_F
    db $11,$11 : dw $000B
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_C
    db $10,$10 : dw $000C
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_D
    db $10,$10 : dw $000D
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_A
    db $0C,$0C : dw $000E
    dw $0001,ProjectileFlareSpritemaps_ChargedIceWave_B
    db $0C,$0C : dw $000F
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Charged_IW_DownRight_UpLeft


;;; $936B: Instruction list - charged spazer / spazer + ice - down / up ;;;
InstList_SamusProjectile_Charged_S_SI_Down_Up_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4C
    db $0C,$08 : dw $0000
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5B
    db $0C,$08 : dw $0001
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4D
    db $0C,$08 : dw $0002
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5C
    db $0C,$08 : dw $0003
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3C
    db $0C,$10 : dw $0004
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_6
    db $0C,$10 : dw $0005
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3E
    db $0C,$10 : dw $0006
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_8
    db $0C,$10 : dw $0007

InstList_SamusProjectile_Charged_S_SI_Down_Up_1:
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_41
    db $14,$10 : dw $0008
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_B
    db $14,$10 : dw $0009
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Charged_S_SI_Down_Up_1


;;; $93BF: Instruction list - charged spazer / spazer + ice - down-left / up-right ;;;
InstList_SamusProjectile_Charged_S_SI_DownLeft_UpRight_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4E
    db $08,$08 : dw $0000
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5D
    db $08,$08 : dw $0001
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4F
    db $08,$08 : dw $0002
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5E
    db $08,$08 : dw $0003
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_18
    db $0C,$0C : dw $0004
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_12
    db $0C,$0C : dw $0005
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_19
    db $10,$10 : dw $0006
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_14
    db $10,$10 : dw $0007

InstList_SamusProjectile_Charged_S_SI_DownLeft_UpRight_1:
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1C
    db $14,$14 : dw $0008
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_17
    db $14,$14 : dw $0009
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Charged_S_SI_DownLeft_UpRight_1


;;; $9413: Instruction list - charged spazer / spazer + ice - left / right ;;;
InstList_SamusProjectile_Charged_S_SI_Left_Right_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_51
    db $08,$0C : dw $0000
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_57
    db $08,$0C : dw $0001
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_52
    db $08,$0C : dw $0002
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_58
    db $08,$0C : dw $0003
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_36
    db $10,$0C : dw $0004
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_0
    db $10,$0C : dw $0005
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_38
    db $10,$0C : dw $0006
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2
    db $10,$0C : dw $0007

InstList_SamusProjectile_Charged_S_SI_Left_Right_1:
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3B
    db $10,$14 : dw $0008
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5
    db $10,$14 : dw $0009
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Charged_S_SI_Left_Right_1


;;; $9467: Instruction list - charged spazer / spazer + ice - down-right / up-left ;;;
InstList_SamusProjectile_Charged_S_SI_DownRight_UpLeft_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_53
    db $08,$08 : dw $0000
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_59
    db $08,$08 : dw $0001
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_54
    db $08,$08 : dw $0002
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5A
    db $08,$08 : dw $0003
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1E
    db $0C,$0C : dw $0004
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_C
    db $0C,$0C : dw $0005
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1F
    db $10,$10 : dw $0006
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_E
    db $10,$10 : dw $0007

InstList_SamusProjectile_Charged_S_SI_DownRight_UpLeft_1:
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_22
    db $14,$14 : dw $0008
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_11
    db $14,$14 : dw $0009
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Charged_S_SI_DownRight_UpLeft_1


;;; $94BB: Instruction list - charged spazer + wave / spazer + ice + wave - up ;;;
InstList_SamusProjectile_Charged_SW_SIW_Up_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4C
    db $0C,$08 : dw $0000
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5B
    db $0C,$08 : dw $0001
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4D
    db $0C,$08 : dw $0002
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5C
    db $0C,$08 : dw $0003

InstList_SamusProjectile_Charged_SW_SIW_Up_1:
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3C
    db $0C,$10 : dw $0004
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_6
    db $0C,$10 : dw $0005
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3D
    db $0C,$10 : dw $0006
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_7
    db $0C,$10 : dw $0007
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3E
    db $0C,$10 : dw $0008
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_8
    db $0C,$10 : dw $0009
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3F
    db $10,$10 : dw $000A
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_9
    db $10,$10 : dw $000B
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_40
    db $12,$10 : dw $000C
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_A
    db $12,$10 : dw $000D
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_41
    db $14,$10 : dw $000E
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_B
    db $14,$10 : dw $000F
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_40
    db $12,$10 : dw $0010
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_A
    db $12,$10 : dw $0011
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3F
    db $10,$10 : dw $0012
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_9
    db $10,$10 : dw $0013
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3E
    db $0C,$10 : dw $0014
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_8
    db $0C,$10 : dw $0015
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3D
    db $08,$10 : dw $0016
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_7
    db $08,$10 : dw $0017
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Charged_SW_SIW_Up_1


;;; $957F: Instruction list - charged spazer + wave / spazer + ice + wave - up-right ;;;
InstList_SamusProjectile_Charged_SW_SIW_UpRight_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4E
    db $08,$08 : dw $0000
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5D
    db $08,$08 : dw $0001
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4F
    db $08,$08 : dw $0002
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5E
    db $08,$08 : dw $0003

InstList_SamusProjectile_Charged_SW_SIW_UpRight_1:
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_18
    db $0C,$0C : dw $0004
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_12
    db $0C,$0C : dw $0005
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1D
    db $0C,$0C : dw $0006
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_13
    db $0C,$0C : dw $0007
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_19
    db $10,$10 : dw $0008
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_14
    db $10,$10 : dw $0009
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1A
    db $10,$10 : dw $000A
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_15
    db $10,$10 : dw $000B
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1B
    db $10,$10 : dw $000C
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_16
    db $10,$10 : dw $000D
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1C
    db $14,$14 : dw $000E
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_17
    db $14,$14 : dw $000F
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1B
    db $10,$10 : dw $0010
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_16
    db $10,$10 : dw $0011
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1A
    db $10,$10 : dw $0012
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_15
    db $10,$10 : dw $0013
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_19
    db $10,$10 : dw $0014
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_14
    db $10,$10 : dw $0015
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1D
    db $0C,$0C : dw $0016
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_13
    db $0C,$0C : dw $0017
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Charged_SW_SIW_UpRight_1


;;; $9643: Instruction list - charged spazer + wave / spazer + ice + wave - right ;;;
InstList_SamusProjectile_Charged_SW_SIW_Right_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_51
    db $08,$0C : dw $0000
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_57
    db $08,$0C : dw $0001
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_52
    db $08,$0C : dw $0002
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_58
    db $08,$0C : dw $0003

InstList_SamusProjectile_Charged_SW_SIW_Right_1:
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_42
    db $10,$0C : dw $0004
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_0
    db $10,$0C : dw $0005
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_43
    db $10,$0C : dw $0006
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1
    db $10,$0C : dw $0007
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_44
    db $10,$0C : dw $0008
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2
    db $10,$0C : dw $0009
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_45
    db $10,$10 : dw $000A
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3
    db $10,$10 : dw $000B
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_46
    db $10,$12 : dw $000C
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4
    db $10,$12 : dw $000D
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_47
    db $10,$14 : dw $000E
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5
    db $10,$14 : dw $000F
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_46
    db $10,$12 : dw $0010
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4
    db $10,$12 : dw $0011
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_45
    db $10,$10 : dw $0012
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3
    db $10,$10 : dw $0013
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_44
    db $10,$0C : dw $0014
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2
    db $10,$0C : dw $0015
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_43
    db $10,$08 : dw $0016
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1
    db $10,$08 : dw $0017
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Charged_SW_SIW_Right_1


;;; $9707: Instruction list - charged spazer + wave / spazer + ice + wave - down-right ;;;
InstList_SamusProjectile_Charged_SW_SIW_DownRight_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_53
    db $08,$08 : dw $0000
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_59
    db $08,$08 : dw $0001
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_54
    db $08,$08 : dw $0002
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5A
    db $08,$08 : dw $0003

InstList_SamusProjectile_Charged_SW_SIW_DownRight_1:
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1E
    db $0C,$0C : dw $0004
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_C
    db $0C,$0C : dw $0005
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_23
    db $0C,$0C : dw $0006
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_D
    db $0C,$0C : dw $0007
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1F
    db $10,$10 : dw $0008
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_E
    db $10,$10 : dw $0009
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_20
    db $10,$10 : dw $000A
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_F
    db $10,$10 : dw $000B
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_21
    db $10,$10 : dw $000C
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_10
    db $10,$10 : dw $000D
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_22
    db $14,$14 : dw $000E
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_11
    db $14,$14 : dw $000F
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_21
    db $10,$10 : dw $0010
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_10
    db $10,$10 : dw $0011
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_20
    db $10,$10 : dw $0012
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_F
    db $10,$10 : dw $0013
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1F
    db $10,$10 : dw $0014
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_E
    db $10,$10 : dw $0015
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_23
    db $0C,$0C : dw $0016
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_D
    db $0C,$0C : dw $0017
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Charged_SW_SIW_DownRight_1


;;; $97CB: Instruction list - charged spazer + wave / spazer + ice + wave - down ;;;
InstList_SamusProjectile_Charged_SW_SIW_Down_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_55
    db $0C,$08 : dw $0000
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5B
    db $0C,$08 : dw $0001
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_56
    db $0C,$08 : dw $0002
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5C
    db $0C,$08 : dw $0003

InstList_SamusProjectile_Charged_SW_SIW_Down_1:
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_30
    db $0C,$10 : dw $0004
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_6
    db $0C,$10 : dw $0005
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_31
    db $0C,$10 : dw $0006
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_7
    db $0C,$10 : dw $0007
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_32
    db $0C,$10 : dw $0008
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_8
    db $0C,$10 : dw $0009
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_33
    db $10,$10 : dw $000A
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_9
    db $10,$10 : dw $000B
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_34
    db $12,$10 : dw $000C
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_A
    db $12,$10 : dw $000D
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_35
    db $14,$10 : dw $000E
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_B
    db $14,$10 : dw $000F
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_34
    db $12,$10 : dw $0010
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_A
    db $12,$10 : dw $0011
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_33
    db $10,$10 : dw $0012
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_9
    db $10,$10 : dw $0013
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_32
    db $0C,$10 : dw $0014
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_8
    db $0C,$10 : dw $0015
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_31
    db $08,$10 : dw $0016
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_7
    db $08,$10 : dw $0017
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Charged_SW_SIW_Down_1


;;; $988F: Instruction list - charged spazer + wave / spazer + ice + wave - down-left ;;;
InstList_SamusProjectile_Charged_SW_SIW_DownLeft_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4E
    db $08,$08 : dw $0000
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5D
    db $08,$08 : dw $0001
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4F
    db $08,$08 : dw $0002
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5E
    db $08,$08 : dw $0003

InstList_SamusProjectile_Charged_SW_SIW_DownLeft_1:
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_24
    db $0C,$0C : dw $0004
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_12
    db $0C,$0C : dw $0005
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_29
    db $0C,$0C : dw $0006
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_13
    db $0C,$0C : dw $0007
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_25
    db $10,$10 : dw $0008
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_14
    db $10,$10 : dw $0009
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_26
    db $10,$10 : dw $000A
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_15
    db $10,$10 : dw $000B
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_27
    db $10,$10 : dw $000C
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_16
    db $10,$10 : dw $000D
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_28
    db $14,$14 : dw $000E
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_17
    db $14,$14 : dw $000F
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_27
    db $10,$10 : dw $0010
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_16
    db $10,$10 : dw $0011
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_26
    db $10,$10 : dw $0012
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_15
    db $10,$10 : dw $0013
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_25
    db $10,$10 : dw $0014
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_14
    db $10,$10 : dw $0015
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_29
    db $0C,$0C : dw $0016
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_13
    db $0C,$0C : dw $0017
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Charged_SW_SIW_DownLeft_1


;;; $9953: Instruction list - charged spazer + wave / spazer + ice + wave - left ;;;
InstList_SamusProjectile_Charged_SW_SIW_Left_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_48
    db $08,$0C : dw $0000
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_57
    db $08,$0C : dw $0001
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_49
    db $08,$0C : dw $0002
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_58
    db $08,$0C : dw $0003

InstList_SamusProjectile_Charged_SW_SIW_Left_1:
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_36
    db $10,$0C : dw $0004
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_0
    db $10,$0C : dw $0005
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_37
    db $10,$0C : dw $0006
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1
    db $10,$0C : dw $0007
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_38
    db $10,$0C : dw $0008
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2
    db $10,$0C : dw $0009
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_39
    db $10,$10 : dw $000A
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3
    db $10,$10 : dw $000B
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3A
    db $10,$12 : dw $000C
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4
    db $10,$12 : dw $000D
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3B
    db $10,$14 : dw $000E
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5
    db $10,$14 : dw $000F
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3A
    db $10,$12 : dw $0010
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4
    db $10,$12 : dw $0011
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_39
    db $10,$10 : dw $0012
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3
    db $10,$10 : dw $0013
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_38
    db $10,$0C : dw $0014
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2
    db $10,$0C : dw $0015
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_37
    db $10,$08 : dw $0016
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1
    db $10,$08 : dw $0017
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Charged_SW_SIW_Left_1


;;; $9A17: Instruction list - charged spazer + wave / spazer + ice + wave - up-left ;;;
InstList_SamusProjectile_Charged_SW_SIW_UpLeft_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4A
    db $08,$08 : dw $0000
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_59
    db $08,$08 : dw $0001
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4B
    db $08,$08 : dw $0002
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5A
    db $08,$08 : dw $0003

InstList_SamusProjectile_Charged_SW_SIW_UpLeft_1:
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2A
    db $0C,$0C : dw $0004
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_C
    db $0C,$0C : dw $0005
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2F
    db $0C,$0C : dw $0006
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_D
    db $0C,$0C : dw $0007
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2B
    db $10,$10 : dw $0008
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_E
    db $10,$10 : dw $0009
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2C
    db $10,$10 : dw $000A
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_F
    db $10,$10 : dw $000B
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2D
    db $10,$10 : dw $000C
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_10
    db $10,$10 : dw $000D
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2E
    db $14,$14 : dw $000E
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_11
    db $14,$14 : dw $000F
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2D
    db $10,$10 : dw $0010
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_10
    db $10,$10 : dw $0011
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2C
    db $10,$10 : dw $0012
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_F
    db $10,$10 : dw $0013
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2B
    db $10,$10 : dw $0014
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_E
    db $10,$10 : dw $0015
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2F
    db $0C,$0C : dw $0016
    dw $0001,ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_D
    db $0C,$0C : dw $0017
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Charged_SW_SIW_UpLeft_1


;;; $9ADB: Instruction list - charged plasma / plasma + ice - down / up ;;;
InstList_SamusProjectile_Charged_P_PI_Down_Up_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_4
    db $08,$08 : dw $0000
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_14
    db $08,$08 : dw $0001
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_5
    db $08,$10 : dw $0002
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_15
    db $08,$10 : dw $0003
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_6
    db $08,$18 : dw $0004
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_16
    db $08,$18 : dw $0005

InstList_SamusProjectile_Charged_P_PI_Down_Up_1:
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_7
    db $08,$1C : dw $0006
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_17
    db $08,$1C : dw $0007
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Charged_P_PI_Down_Up_1


;;; $9B1F: Instruction list - charged plasma / plasma + ice - down-left / up-right ;;;
InstList_SamusProjectile_Charged_P_PI_DownLeft_UpRight_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_C
    db $08,$08 : dw $0000
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1C
    db $08,$08 : dw $0001
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_D
    db $0C,$0C : dw $0002
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1D
    db $0C,$0C : dw $0003
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_E
    db $10,$10 : dw $0004
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1E
    db $10,$10 : dw $0005

InstList_SamusProjectile_Charged_P_PI_DownLeft_UpRight_1:
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_F
    db $14,$14 : dw $0006
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1F
    db $14,$14 : dw $0007
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Charged_P_PI_DownLeft_UpRight_1


;;; $9B63: Instruction list - charged plasma / plasma + ice - left / right ;;;
InstList_SamusProjectile_Charged_P_PI_Left_Right_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_0
    db $08,$08 : dw $0000
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_10
    db $08,$08 : dw $0001
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1
    db $10,$08 : dw $0002
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_11
    db $10,$08 : dw $0003
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_2
    db $18,$08 : dw $0004
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_12
    db $18,$08 : dw $0005

InstList_SamusProjectile_Charged_P_PI_Left_Right_1:
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_3
    db $1C,$08 : dw $0006
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_13
    db $1C,$08 : dw $0007
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Charged_P_PI_Left_Right_1


;;; $9BA7: Instruction list - charged plasma / plasma + ice - down-right / up-left ;;;
InstList_SamusProjectile_Charged_P_PI_DownRight_UpLeft_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_8
    db $08,$08 : dw $0000
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_18
    db $08,$08 : dw $0001
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_9
    db $0C,$0C : dw $0002
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_19
    db $0C,$0C : dw $0003
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_A
    db $10,$10 : dw $0004
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1A
    db $10,$10 : dw $0005

InstList_SamusProjectile_Charged_P_PI_DownRight_UpLeft_1:
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_B
    db $14,$14 : dw $0006
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1B
    db $14,$14 : dw $0007
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Charged_P_PI_DownRight_UpLeft_1


;;; $9BEB: Instruction list - charged plasma + wave / plasma + ice + wave - down / up ;;;
InstList_SamusProjectile_Charged_PW_PIW_Down_Up_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_4
    db $0C,$08 : dw $0000
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_14
    db $0C,$08 : dw $0001
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_5
    db $0C,$08 : dw $0002
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_15
    db $0C,$08 : dw $0003
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_6
    db $0C,$18 : dw $0004
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_16
    db $0C,$18 : dw $0005

InstList_SamusProjectile_Charged_PW_PIW_Down_Up_1:
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_19
    db $0C,$1E : dw $0006
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_28
    db $0C,$1E : dw $0007
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_1A
    db $0C,$1E : dw $0008
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_29
    db $0C,$1E : dw $0009
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_1B
    db $11,$1E : dw $000A
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_2A
    db $11,$1E : dw $000B
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_1C
    db $13,$1E : dw $000C
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_2B
    db $13,$1E : dw $000D
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_1D
    db $14,$1E : dw $000E
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_2C
    db $14,$1E : dw $000F
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_1C
    db $13,$1E : dw $0010
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_2B
    db $13,$1E : dw $0011
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_1B
    db $11,$1E : dw $0012
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_2A
    db $11,$1E : dw $0013
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_1A
    db $0C,$1E : dw $0014
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_29
    db $0C,$1E : dw $0015
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Charged_PW_PIW_Down_Up_1


;;; $9C9F: Instruction list - charged plasma + wave / plasma + ice + wave - down-left / up-right ;;;
InstList_SamusProjectile_Charged_PW_PIW_DownLeft_UpRight_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_C
    db $08,$08 : dw $0000
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1C
    db $08,$08 : dw $0001
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_D
    db $08,$08 : dw $0002
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1D
    db $08,$08 : dw $0003
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_E
    db $0C,$0C : dw $0004
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1E
    db $0C,$0C : dw $0005

InstList_SamusProjectile_Charged_PW_PIW_DownLeft_UpRight_1:
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_37
    db $0C,$0C : dw $0006
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_2D
    db $0C,$0C : dw $0007
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_38
    db $10,$10 : dw $0008
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_2E
    db $10,$10 : dw $0009
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_39
    db $11,$11 : dw $000A
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_2F
    db $11,$11 : dw $000B
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_3A
    db $14,$14 : dw $000C
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_30
    db $14,$14 : dw $000D
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_3B
    db $18,$18 : dw $000E
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_31
    db $18,$18 : dw $000F
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_3A
    db $14,$14 : dw $0010
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_30
    db $14,$14 : dw $0011
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_39
    db $11,$11 : dw $0012
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_2F
    db $11,$11 : dw $0013
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_38
    db $10,$10 : dw $0014
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_2E
    db $10,$10 : dw $0015
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Charged_PW_PIW_DownLeft_UpRight_1


;;; $9D53: Instruction list - charged plasma + wave / plasma + ice + wave - left / right ;;;
InstList_SamusProjectile_Charged_PW_PIW_Left_Right_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_0
    db $08,$0C : dw $0000
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_10
    db $08,$0C : dw $0001
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1
    db $08,$0C : dw $0002
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_11
    db $08,$0C : dw $0003
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_2
    db $18,$0C : dw $0004
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_12
    db $18,$0C : dw $0005

InstList_SamusProjectile_Charged_PW_PIW_Left_Right_1:
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_5
    db $1C,$0C : dw $0006
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_1E
    db $1C,$0C : dw $0007
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_6
    db $1C,$0C : dw $0008
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_1F
    db $1C,$0C : dw $0009
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_7
    db $1C,$11 : dw $000A
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_20
    db $1C,$11 : dw $000B
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_8
    db $1C,$13 : dw $000C
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_21
    db $1C,$13 : dw $000D
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_9
    db $1C,$14 : dw $000E
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_22
    db $1C,$14 : dw $000F
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_8
    db $1C,$13 : dw $0010
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_21
    db $1C,$13 : dw $0011
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_7
    db $1C,$11 : dw $0012
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_20
    db $1C,$11 : dw $0013
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_6
    db $1C,$0C : dw $0014
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_1F
    db $1C,$0C : dw $0015
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Charged_PW_PIW_Left_Right_1


;;; $9E07: Instruction list - charged plasma + wave / plasma + ice + wave - down-right / up-left ;;;
InstList_SamusProjectile_Charged_PW_PIW_DownRight_UpLeft_0:
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_8
    db $08,$08 : dw $0000
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_18
    db $08,$08 : dw $0001
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_9
    db $08,$08 : dw $0002
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_19
    db $08,$08 : dw $0003
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_A
    db $0C,$0C : dw $0004
    dw $0001,ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1A
    db $0C,$0C : dw $0005

InstList_SamusProjectile_Charged_PW_PIW_DownRight_UpLeft_1:
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_F
    db $0C,$0C : dw $0006
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_23
    db $0C,$0C : dw $0007
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_10
    db $10,$10 : dw $0008
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_24
    db $10,$10 : dw $0009
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_11
    db $11,$11 : dw $000A
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_25
    db $11,$11 : dw $000B
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_12
    db $14,$14 : dw $000C
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_26
    db $14,$14 : dw $000D
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_13
    db $18,$18 : dw $000E
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_27
    db $18,$18 : dw $000F
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_12
    db $14,$14 : dw $0010
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_26
    db $14,$14 : dw $0011
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_11
    db $11,$11 : dw $0012
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_25
    db $11,$11 : dw $0013
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_10
    db $10,$10 : dw $0014
    dw $0001,ProjectileFlareSpritemaps_Charged_PW_PIW_24
    db $10,$10 : dw $0015
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Charged_PW_PIW_DownRight_UpLeft_1


;;; $9EBB: Instruction list - missiles - up ;;;
InstList_SamusProjectile_Missiles_Up:
    dw $000F,ProjectileFlareSpritemaps_Missile_2
    db $04,$04 : dw $0000
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Missiles_Up


;;; $9EC7: Instruction list - missiles - up-right ;;;
InstList_SamusProjectile_Missiles_UpRight:
    dw $000F,ProjectileFlareSpritemaps_Missile_3
    db $04,$04 : dw $0000
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Missiles_UpRight


;;; $9ED3: Instruction list - missiles - right ;;;
InstList_SamusProjectile_Missiles_Right:
    dw $000F,ProjectileFlareSpritemaps_Missile_4
    db $04,$04 : dw $0000
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Missiles_Right


;;; $9EDF: Instruction list - missiles - down-right ;;;
InstList_SamusProjectile_Missiles_DownRight:
    dw $000F,ProjectileFlareSpritemaps_Missile_5
    db $04,$04 : dw $0000
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Missiles_DownRight


;;; $9EEB: Instruction list - missiles - down ;;;
InstList_SamusProjectile_Missiles_Down:
    dw $000F,ProjectileFlareSpritemaps_Missile_6
    db $04,$04 : dw $0000
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Missiles_Down


;;; $9EF7: Instruction list - missiles - down-left ;;;
InstList_SamusProjectile_Missiles_DownLeft:
    dw $000F,ProjectileFlareSpritemaps_Missile_7
    db $04,$04 : dw $0000
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Missiles_DownLeft


;;; $9F03: Instruction list - missiles - left ;;;
InstList_SamusProjectile_Missiles_Left:
    dw $000F,ProjectileFlareSpritemaps_Missile_0
    db $04,$04 : dw $0000
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Missiles_Left


;;; $9F0F: Instruction list - missiles - up-left ;;;
InstList_SamusProjectile_Missiles_UpLeft:
    dw $000F,ProjectileFlareSpritemaps_Missile_1
    db $04,$04 : dw $0000
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Missiles_UpLeft


;;; $9F1B: Instruction list - super missile - up ;;;
InstList_SamusProjectile_SuperMissiles_Up:
    dw $000F,ProjectileFlareSpritemaps_SuperMissile_2
    db $08,$08 : dw $0000
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_SuperMissiles_Up


;;; $9F27: Instruction list - super missile - up-right ;;;
InstList_SamusProjectile_SuperMissiles_UpRight:
    dw $000F,ProjectileFlareSpritemaps_SuperMissile_3
    db $08,$08 : dw $0000
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_SuperMissiles_UpRight


;;; $9F33: Instruction list - super missile - right ;;;
InstList_SamusProjectile_SuperMissiles_Right:
    dw $000F,ProjectileFlareSpritemaps_SuperMissile_4
    db $08,$08 : dw $0000
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_SuperMissiles_Right


;;; $9F3F: Instruction list - super missile - down-right ;;;
InstList_SamusProjectile_SuperMissiles_DownRight:
    dw $000F,ProjectileFlareSpritemaps_SuperMissile_5
    db $08,$08 : dw $0000
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_SuperMissiles_DownRight


;;; $9F4B: Instruction list - super missile - down ;;;
InstList_SamusProjectile_SuperMissiles_Down:
    dw $000F,ProjectileFlareSpritemaps_SuperMissile_6
    db $08,$08 : dw $0000
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_SuperMissiles_Down


;;; $9F57: Instruction list - super missile - down-left ;;;
InstList_SamusProjectile_SuperMissiles_DownLeft:
    dw $000F,ProjectileFlareSpritemaps_SuperMissile_7
    db $08,$08 : dw $0000
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_SuperMissiles_DownLeft


;;; $9F63: Instruction list - super missile - left ;;;
InstList_SamusProjectile_SuperMissiles_Left:
    dw $000F,ProjectileFlareSpritemaps_SuperMissile_0
    db $08,$08 : dw $0000
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_SuperMissiles_Left


;;; $9F6F: Instruction list - super missile - up-left ;;;
InstList_SamusProjectile_SuperMissiles_UpLeft:
    dw $000F,ProjectileFlareSpritemaps_SuperMissile_1
    db $08,$08 : dw $0000
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_SuperMissiles_UpLeft


;;; $9F7B: Instruction list - super missile link ;;;
InstList_SamusProjectile_SuperMissileLink:
    dw $000F,Spritemap_Nothing_93A117
    db $08,$08 : dw $0000
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_SuperMissileLink


;;; $9F87: Instruction list - power bomb ;;;
InstList_SamusProjectile_PowerBomb:
    dw $0005,ProjectileFlareSpritemaps_PowerBomb_0
    db $04,$04 : dw $0000
    dw $0005,ProjectileFlareSpritemaps_PowerBomb_1
    db $04,$04 : dw $0000
    dw $0005,ProjectileFlareSpritemaps_PowerBomb_2
    db $04,$04 : dw $0000
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_PowerBomb

InstList_SamusProjectile_PowerBomb_FastAnimation:
; Fast animation. Plays when bomb timer reaches Fh (see $90:C157)
    dw $0001
    dw ProjectileFlareSpritemaps_PowerBomb_0
    db $04,$04 : dw $0000
    dw $0001,ProjectileFlareSpritemaps_PowerBomb_1
    db $04,$04 : dw $0000
    dw $0001,ProjectileFlareSpritemaps_PowerBomb_2
    db $04,$04 : dw $0000
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_PowerBomb_FastAnimation


;;; $9FBF: Instruction list - bomb ;;;
InstList_SamusProjectile_Bomb:
    dw $0005,ProjectileFlareSpritemaps_Bomb_0
    db $04,$04 : dw $0000
    dw $0005,ProjectileFlareSpritemaps_Bomb_1
    db $04,$04 : dw $0000
    dw $0005,ProjectileFlareSpritemaps_Bomb_2
    db $04,$04 : dw $0000
    dw $0005,ProjectileFlareSpritemaps_Bomb_3
    db $04,$04 : dw $0000
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Bomb

; Fast animation. Plays when bomb timer reaches Fh (see $90:C128)
InstList_SamusProjectile_Bomb_FastAnimation:
    dw $0001,ProjectileFlareSpritemaps_Bomb_0
    db $04,$04 : dw $0000
    dw $0001,ProjectileFlareSpritemaps_Bomb_1
    db $04,$04 : dw $0000
    dw $0001,ProjectileFlareSpritemaps_Bomb_2
    db $04,$04 : dw $0000
    dw $0001,ProjectileFlareSpritemaps_Bomb_3
    db $04,$04 : dw $0000
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_Bomb_FastAnimation


;;; $A007: Instruction list - beam explosion ;;;
InstList_SamusProjectile_BeamExplosion:
    dw $0003,ProjectileFlareSpritemaps_BeamExplosion_0
    db $00,$00 : dw $0000
    dw $0003,ProjectileFlareSpritemaps_BeamExplosion_1
    db $00,$00 : dw $0000
    dw $0003,ProjectileFlareSpritemaps_BeamExplosion_2
    db $00,$00 : dw $0000
    dw $0003,ProjectileFlareSpritemaps_BeamExplosion_3
    db $00,$00 : dw $0000
    dw $0003,ProjectileFlareSpritemaps_BeamExplosion_4
    db $00,$00 : dw $0000
    dw $0003,ProjectileFlareSpritemaps_BeamExplosion_5
    db $00,$00 : dw $0000
    dw Instruction_SamusProjectile_Delete


;;; $A039: Instruction list - missile explosion ;;;
InstList_SamusProjectile_MissileExplosion:
    dw $0003,ProjectileFlareSpritemaps_MissileExplosion_0
    db $08,$08 : dw $0000
    dw $0003,ProjectileFlareSpritemaps_MissileExplosion_1
    db $08,$08 : dw $0000
    dw $0003,ProjectileFlareSpritemaps_MissileExplosion_2
    db $08,$08 : dw $0000
    dw $0003,ProjectileFlareSpritemaps_MissileExplosion_3
    db $08,$08 : dw $0000
    dw $0003,ProjectileFlareSpritemaps_MissileExplosion_4
    db $08,$08 : dw $0000
    dw $0003,ProjectileFlareSpritemaps_MissileExplosion_5
    db $08,$08 : dw $0000
    dw Instruction_SamusProjectile_Delete


;;; $A06B: Instruction list - bomb explosion ;;;
InstList_SamusProjectile_BombExplosion:
    dw $0002,ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_0
    db $08,$08 : dw $0000
    dw $0002,ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_1
    db $0C,$0C : dw $0000
    dw $0002,ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_2
    db $10,$10 : dw $0000
    dw $0002,ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_3
    db $10,$10 : dw $0000
    dw $0002,ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_4
    db $10,$10 : dw $0000
    dw Instruction_SamusProjectile_Delete


;;; $A095: Instruction list - plasma SBA ;;;
InstList_SamusProjectile_PlasmaSBA:
    dw $0002,ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_0
    db $08,$08 : dw $0000
    dw $0002,ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_1
    db $0C,$0C : dw $0000
    dw $0002,ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_2
    db $10,$10 : dw $0000
    dw $0002,ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_3
    db $10,$10 : dw $0000
    dw $0002,ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_4
    db $10,$10 : dw $0000
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_PlasmaSBA


;;; $A0C1: Instruction list - super missile explosion ;;;
InstList_SamusProjectile_SuperMissileExplosion:
    dw $0005,ProjectileFlareSpritemaps_SuperMissileExplosion_0
    db $08,$08 : dw $0000
    dw $0005,ProjectileFlareSpritemaps_SuperMissileExplosion_1
    db $0C,$0C : dw $0000
    dw $0005,ProjectileFlareSpritemaps_SuperMissileExplosion_2
    db $10,$10 : dw $0000
    dw $0005,ProjectileFlareSpritemaps_SuperMissileExplosion_3
    db $10,$10 : dw $0000
    dw $0005,ProjectileFlareSpritemaps_SuperMissileExplosion_4
    db $10,$10 : dw $0000
    dw $0005,ProjectileFlareSpritemaps_SuperMissileExplosion_5
    db $10,$10 : dw $0000
    dw Instruction_SamusProjectile_Delete


;;; $A0F3: Instruction list - unused projectile 25h ;;;
UNUSED_InstList_SamusProjectile_Projectile25_93A0F3:
    dw $0002,Spritemap_Nothing_93A117
    db $10,$20 : dw $0000
    dw $0002,Spritemap_Nothing_93A117
    db $10,$20 : dw $0001
    dw $0002,Spritemap_Nothing_93A117
    db $10,$20 : dw $0002
    dw $0002,Spritemap_Nothing_93A117
    db $10,$20 : dw $0003
    dw Instruction_SamusProjectile_GotoY
    dw UNUSED_InstList_SamusProjectile_Projectile25_93A0F3


;;; $A117: Spritemap - nothing ;;;
Spritemap_Nothing_93A117:
    dw $0000


;;; $A119: Instruction list - shinespark echoes ;;;
InstList_SamusProjectile_ShinesparkEcho:
    dw $0002,Spritemap_Nothing_93A117
    db $20,$20 : dw $0000
    dw $0002,Spritemap_Nothing_93A117
    db $20,$20 : dw $0001
    dw $0002,Spritemap_Nothing_93A117
    db $20,$20 : dw $0002
    dw $0002,Spritemap_Nothing_93A117
    db $20,$20 : dw $0003
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_ShinesparkEcho


;;; $A13D: Instruction list - spazer SBA trail ;;;
InstList_SamusProjectile_SpazerSBATrail_0:
    dw $0002,Spritemap_Nothing_93A117
    db $04,$08 : dw $0000
    dw $0002,Spritemap_Nothing_93A117
    db $0C,$08 : dw $0001

InstList_SamusProjectile_SpazerSBATrail_1:
    dw $0002,Spritemap_Nothing_93A117
    db $14,$08 : dw $0002
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_SpazerSBATrail_1


;;; $A159: Instruction list - wave SBA ;;;
InstList_SamusProjectile_WaveSBA:
    dw $0008,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_0
    db $04,$04 : dw $0000
    dw $0008,ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1
    db $04,$04 : dw $0001
    dw Instruction_SamusProjectile_GotoY
    dw InstList_SamusProjectile_WaveSBA


;;; $A16D: Instruction list - unused shinespark beam (projectile 27h) ;;;
UNUSED_InstList_SamusProjectile_Projectile27_93A16D:
    dw $0003,ProjectileFlareSpritemaps_BeamExplosion_0
    db $00,$00 : dw $0000
    dw $0003,ProjectileFlareSpritemaps_BeamExplosion_1
    db $00,$00 : dw $0000
    dw $0003,ProjectileFlareSpritemaps_BeamExplosion_2
    db $00,$00 : dw $0000
    dw $0003,ProjectileFlareSpritemaps_BeamExplosion_3
    db $00,$00 : dw $0000
    dw $0003,ProjectileFlareSpritemaps_BeamExplosion_4
    db $00,$00 : dw $0000
    dw $0003,ProjectileFlareSpritemaps_BeamExplosion_5
    db $00,$00 : dw $0000
    dw Instruction_SamusProjectile_GotoY
    dw UNUSED_InstList_SamusProjectile_Projectile27_93A16D


;;; $A1A1: Flare spritemap pointers ;;;
FlareSpritemapPointers:
; Index 3Eh is used for a shinespark windup effect by unused function UNUSED_DrawShinesparkWindupEffectSprite_93F5E2
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


;;; $A225: Flare spritemap table index offsets ;;;
FlareSpritemapTable_IndexOffsets:
;        _______________ Flare (charge beam / hyper beam / grapple beam)
;       |      _________ Flare slow sparks (charge beam / hyper beam)
;       |     |      ___ Flare fast sparks (charge beam / hyper beam)
;       |     |     |
  .facingRight:
    dw $0000,$001E,$0024
  .facingLeft:
    dw $0000,$002A,$0030


;;; $A231: Projectile / flare spritemaps ;;;
if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_93A231:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $2B)

UNUSED_ProjectileFlareSpritemaps_93A238:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $2A)

UNUSED_ProjectileFlareSpritemaps_93A23F:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $29)

UNUSED_ProjectileFlareSpritemaps_93A246:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $28)
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Power_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Power_1:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Power_2:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $32)

ProjectileFlareSpritemaps_Power_3:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 6, $31)

ProjectileFlareSpritemaps_Power_4:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 1, 2, 6, $30)

ProjectileFlareSpritemaps_Power_5:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 1, 2, 6, $31)

ProjectileFlareSpritemaps_Power_6:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 0, 2, 6, $32)

ProjectileFlareSpritemaps_Power_7:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 0, 2, 6, $31)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_93A285:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_93A28C:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_93A293:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $32)

UNUSED_ProjectileFlareSpritemaps_93A29A:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $32)

UNUSED_ProjectileFlareSpritemaps_93A2A1:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_93A2A8:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_93A2AF:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $32)

UNUSED_ProjectileFlareSpritemaps_93A2B6:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_93A2BD:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_93A2C4:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 1, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_93A2CB:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 0, 2, 6, $32)

UNUSED_ProjectileFlareSpritemaps_93A2D2:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 0, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_93A2D9:
    dw $0002
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_93A2E5:
    dw $0004
    %spritemapEntry(0, $06, $00, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FE, $00, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1FE, $F8, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F6, $F8, 0, 0, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_93A2FB:
    dw $0002
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $33)

UNUSED_ProjectileFlareSpritemaps_93A307:
    dw $0004
    %spritemapEntry(0, $1F2, $00, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1FA, $00, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1FA, $F8, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $02, $F8, 0, 1, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_93A31D:
    dw $0002
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_93A329:
    dw $0004
    %spritemapEntry(0, $1F2, $F8, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1FA, $F8, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1FA, $00, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $02, $00, 1, 1, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_93A33F:
    dw $0002
    %spritemapEntry(0, $1FC, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 1, 0, 2, 6, $33)

UNUSED_ProjectileFlareSpritemaps_93A34B:
    dw $0004
    %spritemapEntry(0, $1F2, $00, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1FA, $00, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1FA, $F8, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $02, $F8, 0, 1, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_93A361:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $38)

UNUSED_ProjectileFlareSpritemaps_93A368:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $39)

UNUSED_ProjectileFlareSpritemaps_93A36F:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $3A)

UNUSED_ProjectileFlareSpritemaps_93A376:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $3B)
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Plasma_PlasmaIce_0:
    dw $0004
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Plasma_PlasmaIce_1:
    dw $0006
    %spritemapEntry(0, $08, $04, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $00, $04, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F0, $F4, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Plasma_PlasmaIce_2:
    dw $0004
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Plasma_PlasmaIce_3:
    dw $0006
    %spritemapEntry(0, $1F0, $04, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F8, $04, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $00, $F4, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $08, $F4, 0, 1, 2, 6, $31)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_93A3E9:
    dw $0004
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_93A3FF:
    dw $0006
    %spritemapEntry(0, $0A, $04, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $02, $04, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FA, $FC, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1FA, $F4, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F2, $F4, 0, 0, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_93A41F:
    dw $0004
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $33)

UNUSED_ProjectileFlareSpritemaps_93A435:
    dw $0006
    %spritemapEntry(0, $1EE, $04, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F6, $04, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F6, $FC, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1FE, $FC, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1FE, $F4, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $06, $F4, 0, 1, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_93A455:
    dw $0004
    %spritemapEntry(0, $1F0, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $08, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_93A46B:
    dw $0006
    %spritemapEntry(0, $1EE, $F4, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1F6, $F4, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1F6, $FC, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1FE, $FC, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1FE, $04, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $06, $04, 1, 1, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_93A48B:
    dw $0004
    %spritemapEntry(0, $1FC, $F0, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $08, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 1, 0, 2, 6, $33)

UNUSED_ProjectileFlareSpritemaps_93A4A1:
    dw $0006
    %spritemapEntry(0, $0A, $F4, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $02, $F4, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $02, $FC, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1FA, $FC, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $1FA, $04, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1F2, $04, 1, 0, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_93A4C1:
    dw $0007
    %spritemapEntry(0, $14, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1E4, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1EC, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $0C, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_93A4E6:
    dw $000A
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
    dw $0007
    %spritemapEntry(0, $1FC, $14, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $0C, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $EC, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $E4, 0, 0, 2, 6, $33)

UNUSED_ProjectileFlareSpritemaps_93A53F:
    dw $000A
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
    dw $0007
    %spritemapEntry(0, $14, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1E4, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $0C, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1EC, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 6, $34)

UNUSED_ProjectileFlareSpritemaps_93A598:
    dw $000A
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
    dw $0007
    %spritemapEntry(0, $1FC, $14, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $0C, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $E4, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $EC, 0, 0, 2, 6, $37)

UNUSED_ProjectileFlareSpritemaps_93A5F1:
    dw $000A
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
    dw $0004
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 6, $34)

UNUSED_ProjectileFlareSpritemaps_93A63B:
    dw $0006
    %spritemapEntry(0, $08, $04, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $00, $04, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $1F0, $F4, 0, 0, 2, 6, $35)

UNUSED_ProjectileFlareSpritemaps_93A65B:
    dw $0004
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 2, 6, $37)

UNUSED_ProjectileFlareSpritemaps_93A671:
    dw $0006
    %spritemapEntry(0, $1F0, $04, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $1F8, $04, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $00, $F4, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $08, $F4, 0, 1, 2, 6, $35)

UNUSED_ProjectileFlareSpritemaps_93A691:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $34)

UNUSED_ProjectileFlareSpritemaps_93A6A7:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $33)

UNUSED_ProjectileFlareSpritemaps_93A6BD:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $35)

UNUSED_ProjectileFlareSpritemaps_93A6C4:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $36)

UNUSED_ProjectileFlareSpritemaps_93A6CB:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $37)

UNUSED_ProjectileFlareSpritemaps_93A6D2:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $53)

UNUSED_ProjectileFlareSpritemaps_93A6D9:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $52)

UNUSED_ProjectileFlareSpritemaps_93A6E0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $51)

UNUSED_ProjectileFlareSpritemaps_93A6E7:
    dw $0004
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 6, $50)
    %spritemapEntry(0, $00, $00, 1, 1, 3, 6, $50)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 6, $50)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 6, $50)
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_FlareSlowSparks_FacingRight_0:
    dw $0003
    %spritemapEntry(0, $00, $0C, 0, 0, 2, 5, $5B)
    %spritemapEntry(0, $08, $EC, 0, 0, 2, 5, $5B)
    %spritemapEntry(0, $1F0, $F4, 0, 0, 2, 5, $5B)

ProjectileFlareSpritemaps_FlareSlowSparks_FacingRight_1:
    dw $0003
    %spritemapEntry(0, $1FD, $0A, 0, 0, 2, 5, $5C)
    %spritemapEntry(0, $06, $EE, 0, 0, 2, 5, $5C)
    %spritemapEntry(0, $1F2, $F6, 0, 0, 2, 5, $5C)

ProjectileFlareSpritemaps_FlareSlowSparks_FacingRight_2:
    dw $0003
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 5, $5C)
    %spritemapEntry(0, $04, $F0, 0, 0, 2, 5, $5C)
    %spritemapEntry(0, $1F4, $F8, 0, 0, 2, 5, $5C)

ProjectileFlareSpritemaps_FlareSlowSparks_FacingRight_3:
    dw $0003
    %spritemapEntry(0, $02, $F2, 0, 0, 2, 5, $5D)
    %spritemapEntry(0, $1FB, $06, 0, 0, 2, 5, $5D)
    %spritemapEntry(0, $1F6, $FA, 0, 0, 2, 5, $5D)

ProjectileFlareSpritemaps_FlareSlowSparks_FacingRight_4:
    dw $0003
    %spritemapEntry(0, $1FB, $04, 0, 0, 2, 5, $5D)
    %spritemapEntry(0, $1F8, $FB, 0, 0, 2, 5, $5D)
    %spritemapEntry(0, $00, $F4, 0, 0, 2, 5, $5D)

ProjectileFlareSpritemaps_FlareSlowSparks_FacingRight_5:
    dw $0003
    %spritemapEntry(0, $1FB, $02, 0, 0, 2, 5, $5D)
    %spritemapEntry(0, $1FA, $FA, 0, 0, 2, 5, $5D)
    %spritemapEntry(0, $00, $F6, 0, 0, 2, 5, $5D)

ProjectileFlareSpritemaps_FlareFastSparks_FacingRight_0:
    dw $0003
    %spritemapEntry(0, $00, $EC, 1, 0, 2, 5, $5B)
    %spritemapEntry(0, $08, $0C, 1, 0, 2, 5, $5B)
    %spritemapEntry(0, $1F0, $04, 1, 0, 2, 5, $5B)

ProjectileFlareSpritemaps_FlareFastSparks_FacingRight_1:
    dw $0003
    %spritemapEntry(0, $1FE, $EE, 1, 0, 2, 5, $5C)
    %spritemapEntry(0, $06, $0A, 1, 0, 2, 5, $5C)
    %spritemapEntry(0, $1F2, $02, 1, 0, 2, 5, $5C)

ProjectileFlareSpritemaps_FlareFastSparks_FacingRight_2:
    dw $0003
    %spritemapEntry(0, $04, $08, 1, 0, 2, 5, $5C)
    %spritemapEntry(0, $1F4, $00, 1, 0, 2, 5, $5C)
    %spritemapEntry(0, $1FD, $F0, 1, 0, 2, 5, $5C)

ProjectileFlareSpritemaps_FlareFastSparks_FacingRight_3:
    dw $0003
    %spritemapEntry(0, $02, $06, 1, 0, 2, 5, $5D)
    %spritemapEntry(0, $1FC, $F2, 1, 0, 2, 5, $5D)
    %spritemapEntry(0, $1F6, $FE, 1, 0, 2, 5, $5D)

ProjectileFlareSpritemaps_FlareFastSparks_FacingRight_4:
    dw $0003
    %spritemapEntry(0, $1FC, $F4, 1, 0, 2, 5, $5D)
    %spritemapEntry(0, $1F8, $FC, 1, 0, 2, 5, $5D)
    %spritemapEntry(0, $00, $04, 1, 0, 2, 5, $5D)

ProjectileFlareSpritemaps_FlareFastSparks_FacingRight_5:
    dw $0003
    %spritemapEntry(0, $1FC, $F6, 1, 0, 2, 5, $5D)
    %spritemapEntry(0, $1FA, $FD, 1, 0, 2, 5, $5D)
    %spritemapEntry(0, $00, $02, 1, 0, 2, 5, $5D)

ProjectileFlareSpritemaps_MissileExplosion_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $5F)

ProjectileFlareSpritemaps_MissileExplosion_1:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $8A)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $8A)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $8A)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $8A)

ProjectileFlareSpritemaps_MissileExplosion_2:
    dw $0004
    %spritemapEntry(1, $4200, $00, 1, 1, 3, 5, $90)
    %spritemapEntry(1, $43F0, $00, 1, 0, 3, 5, $90)
    %spritemapEntry(1, $4200, $F0, 0, 1, 3, 5, $90)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 5, $90)

ProjectileFlareSpritemaps_MissileExplosion_3:
    dw $0004
    %spritemapEntry(1, $4200, $00, 1, 1, 3, 5, $92)
    %spritemapEntry(1, $43F0, $00, 1, 0, 3, 5, $92)
    %spritemapEntry(1, $4200, $F0, 0, 1, 3, 5, $92)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 5, $92)

ProjectileFlareSpritemaps_MissileExplosion_4:
    dw $0004
    %spritemapEntry(1, $4200, $00, 1, 1, 3, 5, $94)
    %spritemapEntry(1, $43F0, $00, 1, 0, 3, 5, $94)
    %spritemapEntry(1, $4200, $F0, 0, 1, 3, 5, $94)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 5, $94)

ProjectileFlareSpritemaps_MissileExplosion_5:
    dw $0004
    %spritemapEntry(1, $4200, $00, 1, 1, 3, 5, $96)
    %spritemapEntry(1, $43F0, $00, 1, 0, 3, 5, $96)
    %spritemapEntry(1, $4200, $F0, 0, 1, 3, 5, $96)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 5, $96)

ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_0:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $8B)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $8B)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $8B)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $8B)

ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_1:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $7A)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $7A)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $7A)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $7A)

ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_2:
    dw $0004
    %spritemapEntry(1, $4200, $00, 1, 1, 3, 5, $70)
    %spritemapEntry(1, $43F0, $00, 1, 0, 3, 5, $70)
    %spritemapEntry(1, $4200, $F0, 0, 1, 3, 5, $70)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 5, $70)

ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_3:
    dw $0004
    %spritemapEntry(1, $4200, $00, 1, 1, 3, 5, $72)
    %spritemapEntry(1, $43F0, $00, 1, 0, 3, 5, $72)
    %spritemapEntry(1, $4200, $F0, 0, 1, 3, 5, $72)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 5, $72)

ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_4:
    dw $0004
    %spritemapEntry(1, $4200, $00, 1, 1, 3, 5, $74)
    %spritemapEntry(1, $43F0, $00, 1, 0, 3, 5, $74)
    %spritemapEntry(1, $4200, $F0, 0, 1, 3, 5, $74)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 5, $74)

ProjectileFlareSpritemaps_BombExplosion_PlasmaSBA_5:
    dw $0004
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 5, $5E)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 5, $5E)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 5, $5E)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $5E)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_93A8C2:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $38)

UNUSED_ProjectileFlareSpritemaps_93A8C9:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $39)

UNUSED_ProjectileFlareSpritemaps_93A8D0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $3A)

UNUSED_ProjectileFlareSpritemaps_93A8D7:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $3B)
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_FlareSlowSparks_FacingLeft_0:
    dw $0003
    %spritemapEntry(0, $1F8, $0C, 0, 1, 2, 6, $5B)
    %spritemapEntry(0, $1F0, $EC, 0, 1, 2, 6, $5B)
    %spritemapEntry(0, $08, $F4, 0, 1, 2, 6, $5B)

ProjectileFlareSpritemaps_FlareSlowSparks_FacingLeft_1:
    dw $0003
    %spritemapEntry(0, $1FB, $0A, 0, 1, 2, 6, $5C)
    %spritemapEntry(0, $1F2, $EE, 0, 1, 2, 6, $5C)
    %spritemapEntry(0, $06, $F6, 0, 1, 2, 6, $5C)

ProjectileFlareSpritemaps_FlareSlowSparks_FacingLeft_2:
    dw $0003
    %spritemapEntry(0, $1FC, $08, 0, 1, 2, 6, $5C)
    %spritemapEntry(0, $1F4, $F0, 0, 1, 2, 6, $5C)
    %spritemapEntry(0, $04, $F8, 0, 1, 2, 6, $5C)

ProjectileFlareSpritemaps_FlareSlowSparks_FacingLeft_3:
    dw $0003
    %spritemapEntry(0, $1F6, $F2, 0, 1, 2, 6, $5D)
    %spritemapEntry(0, $1FD, $06, 0, 1, 2, 6, $5D)
    %spritemapEntry(0, $02, $FA, 0, 1, 2, 6, $5D)

ProjectileFlareSpritemaps_FlareSlowSparks_FacingLeft_4:
    dw $0003
    %spritemapEntry(0, $1FD, $04, 0, 1, 2, 6, $5D)
    %spritemapEntry(0, $00, $FB, 0, 1, 2, 6, $5D)
    %spritemapEntry(0, $1F8, $F4, 0, 1, 2, 6, $5D)

ProjectileFlareSpritemaps_FlareSlowSparks_FacingLeft_5:
    dw $0003
    %spritemapEntry(0, $1FD, $02, 0, 1, 2, 6, $5D)
    %spritemapEntry(0, $1FE, $FA, 0, 1, 2, 6, $5D)
    %spritemapEntry(0, $1F8, $F6, 0, 1, 2, 6, $5D)

ProjectileFlareSpritemaps_FlareFastSparks_FacingLeft_0:
    dw $0003
    %spritemapEntry(0, $1F8, $EC, 1, 1, 2, 6, $5B)
    %spritemapEntry(0, $1F0, $0C, 1, 1, 2, 6, $5B)
    %spritemapEntry(0, $08, $04, 1, 1, 2, 6, $5B)

ProjectileFlareSpritemaps_FlareFastSparks_FacingLeft_1:
    dw $0003
    %spritemapEntry(0, $1FA, $EE, 1, 1, 2, 6, $5C)
    %spritemapEntry(0, $1F2, $0A, 1, 1, 2, 6, $5C)
    %spritemapEntry(0, $06, $02, 1, 1, 2, 6, $5C)

ProjectileFlareSpritemaps_FlareFastSparks_FacingLeft_2:
    dw $0003
    %spritemapEntry(0, $1F4, $08, 1, 1, 2, 6, $5C)
    %spritemapEntry(0, $04, $00, 1, 1, 2, 6, $5C)
    %spritemapEntry(0, $1FB, $F0, 1, 1, 2, 6, $5C)

ProjectileFlareSpritemaps_FlareFastSparks_FacingLeft_3:
    dw $0003
    %spritemapEntry(0, $1F6, $06, 1, 1, 2, 6, $5D)
    %spritemapEntry(0, $1FC, $F2, 1, 1, 2, 6, $5D)
    %spritemapEntry(0, $02, $FE, 1, 1, 2, 6, $5D)

ProjectileFlareSpritemaps_FlareFastSparks_FacingLeft_4:
    dw $0003
    %spritemapEntry(0, $1FC, $F4, 1, 1, 2, 6, $5D)
    %spritemapEntry(0, $00, $FC, 1, 1, 2, 6, $5D)
    %spritemapEntry(0, $1F8, $04, 1, 1, 2, 6, $5D)

ProjectileFlareSpritemaps_FlareFastSparks_FacingLeft_5:
    dw $0003
    %spritemapEntry(0, $1FC, $F6, 1, 1, 2, 6, $5D)
    %spritemapEntry(0, $1FE, $FD, 1, 1, 2, 6, $5D)
    %spritemapEntry(0, $1F8, $02, 1, 1, 2, 6, $5D)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_93A9AA:
    dw $0001
    %spritemapEntry(0, $1F7, $F7, 0, 0, 3, 5, $48)

UNUSED_ProjectileFlareSpritemaps_93A9B1:
    dw $0002
    %spritemapEntry(0, $01, $01, 0, 0, 3, 5, $48)
    %spritemapEntry(1, $43F3, $F3, 0, 0, 3, 5, $7C)

UNUSED_ProjectileFlareSpritemaps_93A9BD:
    dw $0003
    %spritemapEntry(1, $43FD, $FD, 0, 0, 3, 5, $7C)
    %spritemapEntry(0, $1F7, $01, 0, 0, 3, 5, $48)
    %spritemapEntry(1, $43F3, $F3, 0, 0, 3, 5, $7E)

UNUSED_ProjectileFlareSpritemaps_93A9CE:
    dw $0004
    %spritemapEntry(0, $01, $F7, 0, 0, 3, 5, $48)
    %spritemapEntry(1, $43FD, $FD, 0, 0, 3, 5, $7E)
    %spritemapEntry(1, $43F3, $FD, 0, 0, 3, 5, $7C)
    %spritemapEntry(1, $43F3, $F3, 0, 0, 3, 5, $9A)

UNUSED_ProjectileFlareSpritemaps_93A9E4:
    dw $0004
    %spritemapEntry(1, $43FD, $F3, 0, 0, 3, 5, $7C)
    %spritemapEntry(1, $43FD, $FD, 0, 0, 3, 5, $9A)
    %spritemapEntry(1, $43F3, $FD, 0, 0, 3, 5, $7E)
    %spritemapEntry(1, $43F3, $F3, 0, 0, 3, 5, $9C)

UNUSED_ProjectileFlareSpritemaps_93A9FA:
    dw $0003
    %spritemapEntry(1, $43FD, $F3, 0, 0, 3, 5, $7E)
    %spritemapEntry(1, $43FD, $FD, 0, 0, 3, 5, $9C)
    %spritemapEntry(1, $43F3, $FD, 0, 0, 3, 5, $9A)

UNUSED_ProjectileFlareSpritemaps_93AA0B:
    dw $0002
    %spritemapEntry(1, $43FD, $F3, 0, 0, 3, 5, $9A)
    %spritemapEntry(1, $43F3, $FD, 0, 0, 3, 5, $9C)

UNUSED_ProjectileFlareSpritemaps_93AA17:
    dw $0001
    %spritemapEntry(1, $43FD, $F3, 0, 0, 3, 5, $9C)

UNUSED_ProjectileFlareSpritemaps_93AA1E:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $5E)

UNUSED_ProjectileFlareSpritemaps_93AA25:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $5F)

UNUSED_ProjectileFlareSpritemaps_93AA2C:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 6, $60)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 6, $60)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 6, $60)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 6, $60)

UNUSED_ProjectileFlareSpritemaps_93AA42:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 6, $61)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 6, $61)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 6, $61)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 6, $61)

UNUSED_ProjectileFlareSpritemaps_93AA58:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 6, $62)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 6, $62)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 6, $62)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 6, $62)

UNUSED_ProjectileFlareSpritemaps_93AA6E:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 6, $63)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 6, $63)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 6, $63)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 6, $63)
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_SuperMissileExplosion_0:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $8A)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $8A)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $8A)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $8A)

ProjectileFlareSpritemaps_SuperMissileExplosion_1:
    dw $0004
    %spritemapEntry(1, $4200, $00, 1, 1, 3, 5, $90)
    %spritemapEntry(1, $4200, $F0, 0, 1, 3, 5, $90)
    %spritemapEntry(1, $43F0, $00, 1, 0, 3, 5, $90)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 5, $90)

ProjectileFlareSpritemaps_SuperMissileExplosion_2:
    dw $0004
    %spritemapEntry(1, $4200, $00, 1, 1, 3, 5, $92)
    %spritemapEntry(1, $43F0, $00, 1, 0, 3, 5, $92)
    %spritemapEntry(1, $4200, $F0, 0, 1, 3, 5, $92)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 5, $92)

ProjectileFlareSpritemaps_SuperMissileExplosion_3:
    dw $000C
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
    dw $0008
    %spritemapEntry(1, $4208, $00, 1, 1, 3, 5, $B5)
    %spritemapEntry(1, $4200, $08, 1, 1, 3, 5, $B3)
    %spritemapEntry(1, $43E8, $00, 1, 0, 3, 5, $B5)
    %spritemapEntry(1, $43F0, $08, 1, 0, 3, 5, $B3)
    %spritemapEntry(1, $4208, $F0, 0, 1, 3, 5, $B5)
    %spritemapEntry(1, $4200, $E8, 0, 1, 3, 5, $B3)
    %spritemapEntry(1, $43E8, $F0, 0, 0, 3, 5, $B5)
    %spritemapEntry(1, $43F0, $E8, 0, 0, 3, 5, $B3)

ProjectileFlareSpritemaps_SuperMissileExplosion_5:
    dw $000C
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
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $53)

ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_1:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $52)

ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_2:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $51)

ProjectileFlareSpritemaps_Flare_Charge_Hyper_Grapple_3:
    dw $0004
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $50)
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $50)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $50)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $50)

ProjectileFlareSpritemaps_PowerBomb_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $26)

ProjectileFlareSpritemaps_PowerBomb_1:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $27)

ProjectileFlareSpritemaps_PowerBomb_2:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $7B)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_93ABAC:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $5F)
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_BeamExplosion_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $53)

ProjectileFlareSpritemaps_BeamExplosion_1:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $51)

ProjectileFlareSpritemaps_BeamExplosion_2:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 6, $60)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 6, $60)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 6, $60)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 6, $60)

ProjectileFlareSpritemaps_BeamExplosion_3:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 6, $61)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 6, $61)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 6, $61)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 6, $61)

ProjectileFlareSpritemaps_BeamExplosion_4:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 6, $62)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 6, $62)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 6, $62)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 6, $62)

ProjectileFlareSpritemaps_BeamExplosion_5:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 6, $63)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 6, $63)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 6, $63)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 6, $63)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_93AC19:
    dw $0004
    %spritemapEntry(0, $1F2, $FC, 0, 1, 3, 5, $6C)
    %spritemapEntry(0, $06, $FC, 0, 1, 3, 5, $6C)
    %spritemapEntry(0, $00, $FC, 0, 1, 3, 5, $6C)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 5, $6C)

UNUSED_ProjectileFlareSpritemaps_93AC2F:
    dw $0004
    %spritemapEntry(0, $00, $FC, 0, 1, 3, 5, $6E)
    %spritemapEntry(0, $08, $FC, 0, 1, 3, 5, $6D)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 5, $6E)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 3, 5, $6D)

UNUSED_ProjectileFlareSpritemaps_93AC45:
    dw $0004
    %spritemapEntry(0, $1F0, $FE, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $08, $FE, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $00, $FE, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F8, $FE, 0, 0, 3, 5, $6F)

UNUSED_ProjectileFlareSpritemaps_93AC5B:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 5, $7C)

UNUSED_ProjectileFlareSpritemaps_93AC62:
    dw $0001
    %spritemapEntry(1, $43F8, $F6, 0, 0, 3, 5, $7E)

UNUSED_ProjectileFlareSpritemaps_93AC69:
    dw $0001
    %spritemapEntry(1, $43F8, $F4, 0, 0, 3, 5, $9A)

UNUSED_ProjectileFlareSpritemaps_93AC70:
    dw $0001
    %spritemapEntry(1, $43F8, $F2, 0, 0, 3, 5, $9C)

UNUSED_ProjectileFlareSpritemaps_93AC77:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 5, $48)

UNUSED_ProjectileFlareSpritemaps_93AC7E:
    dw $0001
    %spritemapEntry(0, $1FC, $FA, 0, 0, 2, 5, $49)

UNUSED_ProjectileFlareSpritemaps_93AC85:
    dw $0001
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 5, $4A)

UNUSED_ProjectileFlareSpritemaps_93AC8C:
    dw $0001
    %spritemapEntry(0, $1FC, $F6, 0, 0, 2, 5, $4B)

UNUSED_ProjectileFlareSpritemaps_93AC93:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $2C)

UNUSED_ProjectileFlareSpritemaps_93AC9A:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $2D)

UNUSED_ProjectileFlareSpritemaps_93ACA1:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $2E)

UNUSED_ProjectileFlareSpritemaps_93ACA8:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $2F)

UNUSED_ProjectileFlareSpritemaps_93ACAF:
    dw $0001
    %spritemapEntry(1, $43F8, $F6, 0, 0, 3, 5, $76)

UNUSED_ProjectileFlareSpritemaps_93ACB6:
    dw $0001
    %spritemapEntry(1, $43F8, $F4, 0, 0, 3, 5, $78)

UNUSED_ProjectileFlareSpritemaps_93ACBD:
    dw $0001
    %spritemapEntry(1, $43F8, $F2, 0, 0, 3, 5, $98)

UNUSED_ProjectileFlareSpritemaps_93ACC4:
    dw $0001
    %spritemapEntry(1, $43F8, $F0, 0, 0, 3, 5, $9E)

UNUSED_ProjectileFlareSpritemaps_93ACCB:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $25)

UNUSED_ProjectileFlareSpritemaps_93ACD2:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $43)

UNUSED_ProjectileFlareSpritemaps_93ACD9:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $40)

UNUSED_ProjectileFlareSpritemaps_93ACE0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $3E)

UNUSED_ProjectileFlareSpritemaps_93ACE7:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $3D)

UNUSED_ProjectileFlareSpritemaps_93ACEE:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $41)

UNUSED_ProjectileFlareSpritemaps_93ACF5:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $42)

UNUSED_ProjectileFlareSpritemaps_93ACFC:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $44)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $44)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $44)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $44)

UNUSED_ProjectileFlareSpritemaps_93AC12:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $45)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $45)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $45)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $45)

UNUSED_ProjectileFlareSpritemaps_93AC28:
    dw $0004
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $46)
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $46)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $46)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $46)

UNUSED_ProjectileFlareSpritemaps_93AC3E:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $42)
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Bomb_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $4C)

ProjectileFlareSpritemaps_Bomb_1:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $4D)

ProjectileFlareSpritemaps_Bomb_2:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $4E)

ProjectileFlareSpritemaps_Bomb_3:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $4F)

ProjectileFlareSpritemaps_Missile_0:
    dw $0002
    %spritemapEntry(0, $1FF, $FC, 0, 0, 2, 5, $55)
    %spritemapEntry(0, $1F7, $FC, 0, 0, 2, 5, $54)

ProjectileFlareSpritemaps_Missile_1:
    dw $0003
    %spritemapEntry(0, $1F8, $F5, 0, 0, 2, 5, $56)
    %spritemapEntry(0, $00, $FD, 0, 0, 2, 5, $58)
    %spritemapEntry(0, $1F8, $FD, 0, 0, 2, 5, $57)

ProjectileFlareSpritemaps_Missile_2:
    dw $0002
    %spritemapEntry(0, $1FC, $F7, 0, 0, 2, 5, $59)
    %spritemapEntry(0, $1FC, $FF, 0, 0, 2, 5, $5A)

ProjectileFlareSpritemaps_Missile_3:
    dw $0003
    %spritemapEntry(0, $00, $F5, 0, 1, 2, 5, $56)
    %spritemapEntry(0, $1F8, $FD, 0, 1, 2, 5, $58)
    %spritemapEntry(0, $00, $FD, 0, 1, 2, 5, $57)

ProjectileFlareSpritemaps_Missile_4:
    dw $0002
    %spritemapEntry(0, $1F9, $FC, 0, 1, 2, 5, $55)
    %spritemapEntry(0, $01, $FC, 0, 1, 2, 5, $54)

ProjectileFlareSpritemaps_Missile_5:
    dw $0003
    %spritemapEntry(0, $00, $03, 1, 1, 2, 5, $56)
    %spritemapEntry(0, $1F8, $FB, 1, 1, 2, 5, $58)
    %spritemapEntry(0, $00, $FB, 1, 1, 2, 5, $57)

ProjectileFlareSpritemaps_Missile_6:
    dw $0002
    %spritemapEntry(0, $1FD, $01, 1, 0, 2, 5, $59)
    %spritemapEntry(0, $1FD, $F9, 1, 0, 2, 5, $5A)

ProjectileFlareSpritemaps_Missile_7:
    dw $0003
    %spritemapEntry(0, $1F8, $03, 1, 0, 2, 5, $56)
    %spritemapEntry(0, $00, $FB, 1, 0, 2, 5, $58)
    %spritemapEntry(0, $1F8, $FB, 1, 0, 2, 5, $57)

ProjectileFlareSpritemaps_SuperMissile_0:
    dw $0002
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 5, $65)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 5, $64)

ProjectileFlareSpritemaps_SuperMissile_1:
    dw $0003
    %spritemapEntry(0, $02, $FE, 0, 0, 2, 5, $68)
    %spritemapEntry(0, $1FA, $FE, 0, 0, 2, 5, $67)
    %spritemapEntry(0, $1FA, $F6, 0, 0, 2, 5, $66)

ProjectileFlareSpritemaps_SuperMissile_2:
    dw $0002
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 5, $69)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 5, $6A)

ProjectileFlareSpritemaps_SuperMissile_3:
    dw $0003
    %spritemapEntry(0, $1F6, $FE, 0, 1, 2, 5, $68)
    %spritemapEntry(0, $1FE, $FE, 0, 1, 2, 5, $67)
    %spritemapEntry(0, $1FE, $F6, 0, 1, 2, 5, $66)

ProjectileFlareSpritemaps_SuperMissile_4:
    dw $0002
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 5, $65)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 5, $64)

ProjectileFlareSpritemaps_SuperMissile_5:
    dw $0003
    %spritemapEntry(0, $1F6, $FA, 1, 1, 2, 5, $68)
    %spritemapEntry(0, $1FE, $FA, 1, 1, 2, 5, $67)
    %spritemapEntry(0, $1FE, $02, 1, 1, 2, 5, $66)

ProjectileFlareSpritemaps_SuperMissile_6:
    dw $0002
    %spritemapEntry(0, $1FC, $00, 1, 0, 2, 5, $69)
    %spritemapEntry(0, $1FC, $F8, 1, 0, 2, 5, $6A)

ProjectileFlareSpritemaps_SuperMissile_7:
    dw $0003
    %spritemapEntry(0, $02, $FA, 1, 0, 2, 5, $68)
    %spritemapEntry(0, $1FA, $FA, 1, 0, 2, 5, $67)
    %spritemapEntry(0, $1FA, $02, 1, 0, 2, 5, $66)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_93AE49:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $3C)

UNUSED_ProjectileFlareSpritemaps_93AE50:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $3D)

UNUSED_ProjectileFlareSpritemaps_93AE57:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $3E)

UNUSED_ProjectileFlareSpritemaps_93AE5E:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $3F)
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Wave_IceWave_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Wave_IceWave_1:
    dw $0001
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Wave_IceWave_2:
    dw $0001
    %spritemapEntry(0, $1FC, $EF, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Wave_IceWave_3:
    dw $0001
    %spritemapEntry(0, $1FC, $ED, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Wave_IceWave_4:
    dw $0001
    %spritemapEntry(0, $1FC, $EC, 0, 0, 2, 6, $32)

ProjectileFlareSpritemaps_Wave_IceWave_5:
    dw $0001
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Wave_IceWave_6:
    dw $0001
    %spritemapEntry(0, $1FC, $09, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Wave_IceWave_7:
    dw $0001
    %spritemapEntry(0, $1FC, $0B, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Wave_IceWave_8:
    dw $0001
    %spritemapEntry(0, $1FC, $0C, 0, 0, 2, 6, $32)

ProjectileFlareSpritemaps_Wave_IceWave_9:
    dw $0001
    %spritemapEntry(0, $02, $F6, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Wave_IceWave_A:
    dw $0001
    %spritemapEntry(0, $05, $F3, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Wave_IceWave_B:
    dw $0001
    %spritemapEntry(0, $07, $F1, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Wave_IceWave_C:
    dw $0001
    %spritemapEntry(0, $08, $F0, 0, 0, 2, 6, $32)

ProjectileFlareSpritemaps_Wave_IceWave_D:
    dw $0001
    %spritemapEntry(0, $1F6, $02, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Wave_IceWave_E:
    dw $0001
    %spritemapEntry(0, $1F3, $05, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Wave_IceWave_F:
    dw $0001
    %spritemapEntry(0, $1F1, $07, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Wave_IceWave_10:
    dw $0001
    %spritemapEntry(0, $1F0, $08, 0, 0, 2, 6, $32)

ProjectileFlareSpritemaps_Wave_IceWave_11:
    dw $0001
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Wave_IceWave_12:
    dw $0001
    %spritemapEntry(0, $09, $FC, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Wave_IceWave_13:
    dw $0001
    %spritemapEntry(0, $0B, $FC, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Wave_IceWave_14:
    dw $0001
    %spritemapEntry(0, $0C, $FC, 0, 0, 2, 6, $32)

ProjectileFlareSpritemaps_Wave_IceWave_15:
    dw $0001
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Wave_IceWave_16:
    dw $0001
    %spritemapEntry(0, $1EF, $FC, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Wave_IceWave_17:
    dw $0001
    %spritemapEntry(0, $1ED, $FC, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Wave_IceWave_18:
    dw $0001
    %spritemapEntry(0, $1EC, $FC, 0, 0, 2, 6, $32)

ProjectileFlareSpritemaps_Wave_IceWave_19:
    dw $0001
    %spritemapEntry(0, $1F6, $F6, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Wave_IceWave_1A:
    dw $0001
    %spritemapEntry(0, $1F3, $F3, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Wave_IceWave_1B:
    dw $0001
    %spritemapEntry(0, $1F1, $F1, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Wave_IceWave_1C:
    dw $0001
    %spritemapEntry(0, $1F0, $F0, 0, 0, 2, 6, $32)

ProjectileFlareSpritemaps_Wave_IceWave_1D:
    dw $0001
    %spritemapEntry(0, $02, $02, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Wave_IceWave_1E:
    dw $0001
    %spritemapEntry(0, $05, $05, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Wave_IceWave_1F:
    dw $0001
    %spritemapEntry(0, $07, $07, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Wave_IceWave_20:
    dw $0001
    %spritemapEntry(0, $08, $08, 0, 0, 2, 6, $32)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_0:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_2:
    dw $0008
    %spritemapEntry(0, $00, $08, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $08, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $00, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $F8, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F8, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $F0, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_3:
    dw $0008
    %spritemapEntry(0, $00, $08, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $08, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $00, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $F8, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $F0, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_4:
    dw $0008
    %spritemapEntry(0, $00, $0D, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $0D, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $05, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $05, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $F3, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F3, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $EB, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $EB, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_5:
    dw $0008
    %spritemapEntry(0, $00, $0D, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $0D, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $05, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $05, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $F3, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F3, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $EB, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $EB, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_6:
    dw $0008
    %spritemapEntry(0, $00, $0F, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $0F, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $07, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $07, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $F1, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F1, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $E9, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $E9, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_7:
    dw $0008
    %spritemapEntry(0, $00, $0F, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $0F, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $07, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $07, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $F1, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F1, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $E9, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $E9, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_8:
    dw $0008
    %spritemapEntry(0, $00, $10, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $10, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $08, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $08, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $F0, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F0, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $E8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $E8, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_9:
    dw $0008
    %spritemapEntry(0, $00, $10, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $10, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $08, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $08, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $F0, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F0, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $E8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $E8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_A:
    dw $0008
    %spritemapEntry(0, $05, $FB, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1FD, $FB, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $05, $F3, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1FD, $F3, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1FB, $05, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F3, $05, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FB, $FD, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F3, $FD, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_B:
    dw $0008
    %spritemapEntry(0, $04, $FC, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1FC, $FC, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $04, $F4, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $04, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F4, $04, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_C:
    dw $0008
    %spritemapEntry(0, $1F9, $07, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F1, $07, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F9, $FF, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F1, $FF, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $07, $F9, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1FF, $F9, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $07, $F1, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1FF, $F1, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_D:
    dw $0008
    %spritemapEntry(0, $1F9, $07, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F1, $07, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1F9, $FF, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F1, $FF, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $07, $F9, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1FF, $F9, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $07, $F1, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1FF, $F1, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_E:
    dw $0008
    %spritemapEntry(0, $1F7, $09, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1EF, $09, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F7, $01, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1EF, $01, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $09, $F7, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $01, $F7, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $09, $EF, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $01, $EF, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_F:
    dw $0008
    %spritemapEntry(0, $1F7, $09, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1EF, $09, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1F7, $01, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1EF, $01, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $09, $F7, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $01, $F7, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $09, $EF, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $01, $EF, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_10:
    dw $0008
    %spritemapEntry(0, $1F6, $0A, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1EE, $0A, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F6, $02, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1EE, $02, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0A, $F6, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $02, $F6, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $0A, $EE, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $02, $EE, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_11:
    dw $0008
    %spritemapEntry(0, $1F6, $0A, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1EE, $0A, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1F6, $02, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1EE, $02, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $0A, $F6, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $02, $F6, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $0A, $EE, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $02, $EE, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_12:
    dw $0008
    %spritemapEntry(0, $1F3, $FB, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1FB, $FB, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F3, $F3, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1FB, $F3, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1FD, $05, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $05, $05, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1FD, $FD, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $05, $FD, 0, 1, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_13:
    dw $0008
    %spritemapEntry(0, $1F4, $FC, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $FC, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F4, $F4, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F4, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1FC, $04, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $04, $04, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $04, $FC, 0, 1, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_14:
    dw $0008
    %spritemapEntry(0, $1FF, $07, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $07, $07, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1FF, $FF, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $07, $FF, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F1, $F9, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1F9, $F9, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F1, $F1, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F9, $F1, 0, 1, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_15:
    dw $0008
    %spritemapEntry(0, $1FF, $07, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $07, $07, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1FF, $FF, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $07, $FF, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F1, $F9, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F9, $F9, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F1, $F1, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1F9, $F1, 0, 1, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_16:
    dw $0008
    %spritemapEntry(0, $01, $09, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $09, $09, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $01, $01, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $09, $01, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1EF, $F7, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1F7, $F7, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1EF, $EF, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F7, $EF, 0, 1, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_17:
    dw $0008
    %spritemapEntry(0, $01, $09, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $09, $09, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $01, $01, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $09, $01, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1EF, $F7, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F7, $F7, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1EF, $EF, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1F7, $EF, 0, 1, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_18:
    dw $0008
    %spritemapEntry(0, $02, $0A, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $0A, $0A, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $02, $02, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0A, $02, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1EE, $F6, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1F6, $F6, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1EE, $EE, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F6, $EE, 0, 1, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_19:
    dw $0008
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
    dw $0004
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $34)

UNUSED_ProjectileFlareSpritemaps_ChargedWave_WaveSBA_93B37E:
    dw $0004
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $33)
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1A:
    dw $0008
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F0, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $08, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $00, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $08, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1B:
    dw $0008
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F0, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $08, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $00, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $08, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1C:
    dw $0008
    %spritemapEntry(0, $1F3, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F3, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1EB, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1EB, $F8, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $0D, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $05, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $0D, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $05, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1D:
    dw $0008
    %spritemapEntry(0, $1F3, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F3, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1EB, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1EB, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0D, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $05, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $0D, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $05, $F8, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1E:
    dw $0008
    %spritemapEntry(0, $1F1, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F1, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1E9, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1E9, $F8, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $0F, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $07, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $0F, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $07, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_1F:
    dw $0008
    %spritemapEntry(0, $1F1, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F1, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1E9, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1E9, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0F, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $07, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $0F, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $07, $F8, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_20:
    dw $0008
    %spritemapEntry(0, $1F0, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F0, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1E8, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $10, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $08, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $10, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $08, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedWave_WaveSBA_21:
    dw $0008
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
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_93B4EB:
    dw $0002
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_93B4F7:
    dw $0002
    %spritemapEntry(0, $1FC, $09, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $1FC, $EF, 0, 0, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_93B503:
    dw $0002
    %spritemapEntry(0, $1FC, $0B, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $ED, 0, 0, 2, 6, $32)

UNUSED_ProjectileFlareSpritemaps_93B50F:
    dw $0002
    %spritemapEntry(0, $1FC, $0C, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1FC, $EC, 0, 0, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_93B51B:
    dw $0002
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_93B527:
    dw $0002
    %spritemapEntry(0, $1FC, $EF, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1FC, $09, 0, 0, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_93B533:
    dw $0002
    %spritemapEntry(0, $1FC, $0B, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FC, $ED, 0, 0, 2, 6, $36)

UNUSED_ProjectileFlareSpritemaps_93B53F:
    dw $0002
    %spritemapEntry(0, $1FC, $EC, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $0C, 0, 0, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_93B54B:
    dw $0002
    %spritemapEntry(0, $1F6, $02, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $02, $F6, 0, 0, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_93B557:
    dw $0002
    %spritemapEntry(0, $1F3, $05, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $05, $F3, 0, 0, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_93B563:
    dw $0002
    %spritemapEntry(0, $1F1, $07, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $07, $F1, 0, 0, 2, 6, $32)

UNUSED_ProjectileFlareSpritemaps_93B56F:
    dw $0002
    %spritemapEntry(0, $08, $F0, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F0, $08, 0, 0, 2, 6, $35)

UNUSED_ProjectileFlareSpritemaps_93B57B:
    dw $0002
    %spritemapEntry(0, $02, $F6, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1F6, $02, 0, 0, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_93B587:
    dw $0002
    %spritemapEntry(0, $05, $F3, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $1F3, $05, 0, 0, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_93B593:
    dw $0002
    %spritemapEntry(0, $07, $F1, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1F1, $07, 0, 0, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_93B59F:
    dw $0002
    %spritemapEntry(0, $1F0, $08, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $08, $F0, 0, 0, 2, 6, $35)

UNUSED_ProjectileFlareSpritemaps_93B5AB:
    dw $0002
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_93B5B7:
    dw $0002
    %spritemapEntry(0, $1F1, $FC, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $09, $FC, 0, 0, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_93B5C3:
    dw $0002
    %spritemapEntry(0, $1ED, $FC, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $0B, $FC, 0, 0, 2, 6, $32)

UNUSED_ProjectileFlareSpritemaps_93B5CF:
    dw $0002
    %spritemapEntry(0, $0C, $FC, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1EC, $FC, 0, 0, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_93B5DB:
    dw $0002
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 6, $37)

UNUSED_ProjectileFlareSpritemaps_93B5E7:
    dw $0002
    %spritemapEntry(0, $09, $FC, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $1EF, $FC, 0, 0, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_93B5F3:
    dw $0002
    %spritemapEntry(0, $0C, $FC, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1ED, $FC, 0, 0, 2, 6, $32)

UNUSED_ProjectileFlareSpritemaps_93B5FF:
    dw $0002
    %spritemapEntry(0, $1EC, $FC, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $0D, $FC, 0, 0, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_93B60B:
    dw $0002
    %spritemapEntry(0, $02, $02, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1F6, $F6, 0, 0, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_93B617:
    dw $0002
    %spritemapEntry(0, $05, $05, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $1F3, $F3, 0, 0, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_93B623:
    dw $0002
    %spritemapEntry(0, $07, $07, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1F1, $F1, 0, 0, 2, 6, $32)

UNUSED_ProjectileFlareSpritemaps_93B62F:
    dw $0002
    %spritemapEntry(0, $08, $08, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1F0, $F0, 0, 0, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_93B63B:
    dw $0002
    %spritemapEntry(0, $1F6, $F6, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $02, $02, 0, 0, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_93B647:
    dw $0002
    %spritemapEntry(0, $1F3, $F3, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $05, $05, 0, 0, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_93B653:
    dw $0002
    %spritemapEntry(0, $1F1, $F1, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $07, $07, 0, 0, 2, 6, $32)

UNUSED_ProjectileFlareSpritemaps_93B65F:
    dw $0002
    %spritemapEntry(0, $1F0, $F0, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $08, $08, 0, 0, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_93B66B:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $30)
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_ChargedIceWave_0:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedIceWave_1:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedIceWave_2:
    dw $0008
    %spritemapEntry(0, $00, $08, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $08, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $00, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $F8, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F8, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $F0, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedIceWave_3:
    dw $0008
    %spritemapEntry(0, $00, $08, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $08, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $00, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $F8, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $F0, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedIceWave_4:
    dw $0008
    %spritemapEntry(0, $00, $0D, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $0D, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $05, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $05, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $F3, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F3, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $EB, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $EB, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedIceWave_5:
    dw $0008
    %spritemapEntry(0, $00, $0D, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $0D, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $05, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $05, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $F3, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F3, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $EB, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $EB, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedIceWave_6:
    dw $0008
    %spritemapEntry(0, $00, $0F, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $0F, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $07, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $07, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $F1, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F1, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $E9, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $E9, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedIceWave_7:
    dw $0008
    %spritemapEntry(0, $00, $0F, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $0F, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $07, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $07, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $F1, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F1, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $E9, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $E9, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedIceWave_8:
    dw $0008
    %spritemapEntry(0, $00, $10, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $10, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $08, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $08, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $F0, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F0, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $E8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $E8, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedIceWave_9:
    dw $0008
    %spritemapEntry(0, $00, $10, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $10, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $08, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $08, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $F0, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F0, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $E8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $E8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedIceWave_A:
    dw $0008
    %spritemapEntry(0, $05, $FB, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1FD, $FB, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $05, $F3, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1FD, $F3, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1FB, $05, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F3, $05, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FB, $FD, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F3, $FD, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedIceWave_B:
    dw $0008
    %spritemapEntry(0, $04, $FC, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1FC, $FC, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $04, $F4, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $04, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F4, $04, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedIceWave_C:
    dw $0008
    %spritemapEntry(0, $1F9, $07, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F1, $07, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F9, $FF, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F1, $FF, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $07, $F9, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1FF, $F9, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $07, $F1, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1FF, $F1, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedIceWave_D:
    dw $0008
    %spritemapEntry(0, $1F9, $07, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F1, $07, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1F9, $FF, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F1, $FF, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $07, $F9, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1FF, $F9, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $07, $F1, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1FF, $F1, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedIceWave_E:
    dw $0008
    %spritemapEntry(0, $1F7, $09, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1EF, $09, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F7, $01, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1EF, $01, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $09, $F7, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $01, $F7, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $09, $EF, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $01, $EF, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedIceWave_F:
    dw $0008
    %spritemapEntry(0, $1F7, $09, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1EF, $09, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1F7, $01, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1EF, $01, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $09, $F7, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $01, $F7, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $09, $EF, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $01, $EF, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedIceWave_10:
    dw $0008
    %spritemapEntry(0, $1F6, $0A, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1EE, $0A, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F6, $02, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1EE, $02, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0A, $F6, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $02, $F6, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $0A, $EE, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $02, $EE, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedIceWave_11:
    dw $0008
    %spritemapEntry(0, $1F6, $0A, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1EE, $0A, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1F6, $02, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1EE, $02, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $0A, $F6, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $02, $F6, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $0A, $EE, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $02, $EE, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedIceWave_12:
    dw $0008
    %spritemapEntry(0, $1F3, $FB, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1FB, $FB, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F3, $F3, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1FB, $F3, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1FD, $05, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $05, $05, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1FD, $FD, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $05, $FD, 0, 1, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedIceWave_13:
    dw $0008
    %spritemapEntry(0, $1F4, $FC, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $FC, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F4, $F4, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F4, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1FC, $04, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $04, $04, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $04, $FC, 0, 1, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedIceWave_14:
    dw $0008
    %spritemapEntry(0, $1FF, $07, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $07, $07, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1FF, $FF, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $07, $FF, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F1, $F9, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1F9, $F9, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F1, $F1, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F9, $F1, 0, 1, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedIceWave_15:
    dw $0008
    %spritemapEntry(0, $1FF, $07, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $07, $07, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1FF, $FF, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $07, $FF, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F1, $F9, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F9, $F9, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F1, $F1, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1F9, $F1, 0, 1, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedIceWave_16:
    dw $0008
    %spritemapEntry(0, $01, $09, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $09, $09, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $01, $01, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $09, $01, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1EF, $F7, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1F7, $F7, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1EF, $EF, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F7, $EF, 0, 1, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedIceWave_17:
    dw $0008
    %spritemapEntry(0, $01, $09, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $09, $09, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $01, $01, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $09, $01, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1EF, $F7, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F7, $F7, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1EF, $EF, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1F7, $EF, 0, 1, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedIceWave_18:
    dw $0008
    %spritemapEntry(0, $02, $0A, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $0A, $0A, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $02, $02, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0A, $02, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1EE, $F6, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1F6, $F6, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1EE, $EE, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F6, $EE, 0, 1, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedIceWave_19:
    dw $0008
    %spritemapEntry(0, $02, $0A, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $0A, $0A, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $02, $02, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $0A, $02, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1EE, $F6, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F6, $F6, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1EE, $EE, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1F6, $EE, 0, 1, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedIceWave_1A:
    dw $0004
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedIceWave_1B:
    dw $0004
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedIceWave_1C:
    dw $0008
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F0, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $08, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $00, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $08, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedIceWave_1D:
    dw $0008
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F0, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $08, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $00, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $08, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedIceWave_1E:
    dw $0008
    %spritemapEntry(0, $1F3, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F3, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1EB, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1EB, $F8, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $0D, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $05, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $0D, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $05, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedIceWave_1F:
    dw $0008
    %spritemapEntry(0, $1F3, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F3, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1EB, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1EB, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0D, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $05, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $0D, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $05, $F8, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedIceWave_20:
    dw $0008
    %spritemapEntry(0, $1F1, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F1, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1E9, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1E9, $F8, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $0F, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $07, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $0F, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $07, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedIceWave_21:
    dw $0008
    %spritemapEntry(0, $1F1, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F1, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1E9, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1E9, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0F, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $07, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $0F, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $07, $F8, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_ChargedIceWave_22:
    dw $0008
    %spritemapEntry(0, $1F0, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F0, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1E8, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $10, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $08, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $10, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $08, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_ChargedIceWave_23:
    dw $0008
    %spritemapEntry(0, $1F0, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F0, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1E8, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $10, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $08, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $10, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $08, $F8, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_Charged_PW_PIW_0:
    dw $0004
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Charged_PW_PIW_1:
    dw $0008
    %spritemapEntry(0, $08, $04, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $04, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $04, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F0, $04, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $08, $F4, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $F4, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F0, $F4, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Charged_PW_PIW_2:
    dw $0008
    %spritemapEntry(0, $08, $09, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $09, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $09, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F0, $09, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $08, $EF, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $EF, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $EF, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F0, $EF, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Charged_PW_PIW_3:
    dw $0008
    %spritemapEntry(0, $08, $0B, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $0B, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $0B, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F0, $0B, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $08, $ED, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $ED, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $ED, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F0, $ED, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Charged_PW_PIW_4:
    dw $0008
    %spritemapEntry(0, $08, $0C, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $0C, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $0C, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F0, $0C, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $08, $EC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $EC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $EC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F0, $EC, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Charged_PW_PIW_5:
    dw $0007
    %spritemapEntry(0, $14, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1E4, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $0C, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1EC, $FC, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Charged_PW_PIW_6:
    dw $000E
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
    dw $000E
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
    dw $000E
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
    dw $000E
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
    dw $0006
    %spritemapEntry(0, $08, $04, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $00, $04, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F0, $F4, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_PW_PIW_B:
    dw $000C
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
    dw $000C
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
    dw $000C
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
    dw $000C
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
    dw $000A
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
    dw $0014
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
    dw $0014
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
    dw $0014
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
    dw $0014
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
    dw $0004
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_PW_PIW_15:
    dw $0008
    %spritemapEntry(0, $04, $08, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $04, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $04, $F0, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $04, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1F5, $08, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1F5, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1F5, $F0, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1F5, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_PW_PIW_16:
    dw $0008
    %spritemapEntry(0, $09, $08, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $09, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $09, $F0, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $09, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1EF, $08, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1EF, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1EF, $F0, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1EF, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_PW_PIW_17:
    dw $0008
    %spritemapEntry(0, $0B, $08, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0B, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0B, $F0, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0B, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1EE, $08, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1EE, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1EE, $F0, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1EE, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_PW_PIW_18:
    dw $0008
    %spritemapEntry(0, $0C, $08, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0C, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0C, $F0, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0C, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1ED, $08, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1ED, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1ED, $F0, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1ED, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_PW_PIW_19:
    dw $0007
    %spritemapEntry(0, $1FC, $14, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $0C, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $E4, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $EC, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_PW_PIW_1A:
    dw $000E
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
    dw $000E
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
    dw $000E
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
    dw $000E
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
    dw $0004
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 6, $34)

UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C30A:
    dw $0008
    %spritemapEntry(0, $08, $04, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $04, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $04, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F0, $04, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $08, $F4, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $F4, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F0, $F4, 0, 0, 2, 6, $34)

UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C334:
    dw $0008
    %spritemapEntry(0, $08, $09, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $09, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $09, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F0, $09, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $08, $EF, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $EF, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $EF, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F0, $EF, 0, 0, 2, 6, $34)

UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C35E:
    dw $0008
    %spritemapEntry(0, $08, $0B, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $0B, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $0B, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F0, $0B, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $08, $ED, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $ED, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $ED, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F0, $ED, 0, 0, 2, 6, $34)

UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C388:
    dw $0008
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
    dw $0007
    %spritemapEntry(0, $14, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1E4, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $0C, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1EC, $FC, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_Charged_PW_PIW_1F:
    dw $000E
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
    dw $000E
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
    dw $000E
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
    dw $000E
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
    dw $0008
    %spritemapEntry(0, $08, $0C, 1, 1, 2, 6, $36)
    %spritemapEntry(0, $1F0, $EC, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $08, $04, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $00, $FC, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1F8, $F4, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $00, $04, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1F0, $F4, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $35)

UNSUED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C521:
    dw $0010
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
    dw $0010
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
    dw $0010
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
    dw $0010
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
    dw $000C
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
    dw $0018
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
    dw $0018
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
    dw $0018
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
    dw $0018
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
    dw $0004
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $37)

UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C8A5:
    dw $0008
    %spritemapEntry(0, $04, $08, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $04, $00, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $04, $F0, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $04, $F8, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1F5, $08, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1F5, $00, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1F5, $F0, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1F5, $F8, 0, 0, 2, 6, $37)

UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C8CF:
    dw $0008
    %spritemapEntry(0, $09, $08, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $09, $00, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $09, $F0, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $09, $F8, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1EF, $08, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1EF, $00, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1EF, $F0, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1EF, $F8, 0, 0, 2, 6, $37)

UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C8F9:
    dw $0008
    %spritemapEntry(0, $0B, $08, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $0B, $00, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $0B, $F0, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $0B, $F8, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1EE, $08, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1EE, $00, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1EE, $F0, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1EE, $F8, 0, 0, 2, 6, $37)

UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93C923:
    dw $0008
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
    dw $0007
    %spritemapEntry(0, $1FC, $14, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $0C, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $E4, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $EC, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 6, $37)

ProjectileFlareSpritemaps_Charged_PW_PIW_29:
    dw $000E
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
    dw $000E
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
    dw $000E
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
    dw $000E
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
    dw $0008
    %spritemapEntry(0, $1F0, $0C, 1, 0, 2, 6, $36)
    %spritemapEntry(0, $08, $EC, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $1F0, $04, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1F8, $FC, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $00, $F4, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1F8, $04, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $08, $F4, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 6, $35)

UNUSED_ProjectileFlareSpritemaps_Charged_PW_PIW_93CABC:
    dw $0010
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
    dw $0010
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
    dw $0010
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
    dw $0010
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
    dw $000C
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
    dw $0018
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
    dw $0018
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
    dw $0018
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
    dw $0018
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
    dw $0006
    %spritemapEntry(0, $1F0, $04, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F8, $04, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $00, $F4, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $08, $F4, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_PW_PIW_33:
    dw $000C
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
    dw $000C
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
    dw $000C
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
    dw $000C
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
    dw $000A
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
    dw $0014
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
    dw $0014
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
    dw $0014
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
    dw $0014
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
    dw $0004
    %spritemapEntry(0, $1F2, $00, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1FA, $00, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1FA, $F8, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $02, $F8, 0, 1, 2, 6, $31)

ProjectileFlareSpritemaps_S_SI_SW_SIW_1:
    dw $000C
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
    dw $000C
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
    dw $000C
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
    dw $000C
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
    dw $000C
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
    dw $0004
    %spritemapEntry(0, $1F2, $F8, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1FA, $F8, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1FA, $00, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $02, $00, 1, 1, 2, 6, $31)

ProjectileFlareSpritemaps_S_SI_SW_SIW_7:
    dw $000C
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
    dw $000C
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
    dw $000C
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
    dw $000C
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
    dw $000C
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
    dw $0004
    %spritemapEntry(0, $06, $F8, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1FE, $F8, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $1FE, $00, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1F6, $00, 1, 0, 2, 6, $31)

ProjectileFlareSpritemaps_S_SI_SW_SIW_D:
    dw $000C
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
    dw $000C
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
    dw $000C
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
    dw $000C
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
    dw $000C
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
    dw $0004
    %spritemapEntry(0, $06, $00, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FE, $00, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1FE, $F8, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F6, $F8, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_S_SI_SW_SIW_12:
    dw $000C
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
    dw $000C
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
    dw $000C
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
    dw $000C
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
    dw $000C
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
    dw $0002
    %spritemapEntry(0, $1FC, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 1, 0, 2, 6, $33)

ProjectileFlareSpritemaps_S_SI_SW_SIW_18:
    dw $0006
    %spritemapEntry(0, $00, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 1, 0, 2, 6, $33)

ProjectileFlareSpritemaps_S_SI_SW_SIW_19:
    dw $0006
    %spritemapEntry(0, $04, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $04, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F4, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F4, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 1, 0, 2, 6, $33)

ProjectileFlareSpritemaps_S_SI_SW_SIW_1A:
    dw $0006
    %spritemapEntry(0, $09, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $09, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1EF, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1EF, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 1, 0, 2, 6, $33)

ProjectileFlareSpritemaps_S_SI_SW_SIW_1B:
    dw $0006
    %spritemapEntry(0, $0B, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $0B, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1ED, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1ED, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 1, 0, 2, 6, $33)

ProjectileFlareSpritemaps_S_SI_SW_SIW_1C:
    dw $0006
    %spritemapEntry(0, $0C, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $0C, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1EC, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1EC, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 1, 0, 2, 6, $33)

ProjectileFlareSpritemaps_S_SI_SW_SIW_1D:
    dw $0002
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_S_SI_SW_SIW_1E:
    dw $0006
    %spritemapEntry(0, $00, $00, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_S_SI_SW_SIW_1F:
    dw $0006
    %spritemapEntry(0, $00, $F4, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $04, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $04, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_S_SI_SW_SIW_20:
    dw $0006
    %spritemapEntry(0, $00, $EF, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $09, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $09, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $EF, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_S_SI_SW_SIW_21:
    dw $0006
    %spritemapEntry(0, $00, $ED, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $0B, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $0B, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $ED, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_S_SI_SW_SIW_22:
    dw $0006
    %spritemapEntry(0, $00, $EC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $0C, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $0C, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $EC, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_S_SI_SW_SIW_23:
    dw $0002
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_S_SI_SW_SIW_24:
    dw $0006
    %spritemapEntry(0, $00, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_S_SI_SW_SIW_25:
    dw $0006
    %spritemapEntry(0, $04, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $04, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1F4, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1F4, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_S_SI_SW_SIW_26:
    dw $0006
    %spritemapEntry(0, $09, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $09, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1EF, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1EF, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_S_SI_SW_SIW_27:
    dw $0006
    %spritemapEntry(0, $0B, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0B, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1ED, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1ED, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_S_SI_SW_SIW_28:
    dw $0006
    %spritemapEntry(0, $0C, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $0C, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1EC, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1EC, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_S_SI_SW_SIW_29:
    dw $0002
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 6, $30)

ProjectileFlareSpritemaps_S_SI_SW_SIW_2A:
    dw $0006
    %spritemapEntry(0, $00, $00, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_S_SI_SW_SIW_2B:
    dw $0006
    %spritemapEntry(0, $1F8, $F4, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $1F8, $04, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $00, $04, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $00, $F4, 0, 1, 2, 6, $30)

ProjectileFlareSpritemaps_S_SI_SW_SIW_2C:
    dw $0006
    %spritemapEntry(0, $1F8, $EF, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $1F8, $09, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $00, $09, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $00, $EF, 0, 1, 2, 6, $30)

ProjectileFlareSpritemaps_S_SI_SW_SIW_2D:
    dw $0006
    %spritemapEntry(0, $1F8, $ED, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $1F8, $0B, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $00, $0B, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $00, $ED, 0, 1, 2, 6, $30)

ProjectileFlareSpritemaps_S_SI_SW_SIW_2E:
    dw $0006
    %spritemapEntry(0, $1F8, $EC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $1F8, $0C, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $00, $0C, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $00, $EC, 0, 1, 2, 6, $30)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_0:
    dw $0004
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1:
    dw $000C
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
    dw $000C
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
    dw $000C
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
    dw $000C
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
    dw $000C
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
    dw $0004
    %spritemapEntry(0, $1FC, $F0, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $37)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_7:
    dw $000C
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
    dw $000C
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
    dw $000C
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
    dw $000C
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
    dw $000C
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
    dw $0006
    %spritemapEntry(0, $04, $08, 1, 1, 2, 6, $36)
    %spritemapEntry(0, $1F4, $F0, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $1FC, $F8, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $04, $00, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1F4, $F8, 0, 0, 2, 6, $35)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_D:
    dw $0012
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
    dw $0012
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
    dw $0012
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
    dw $0012
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
    dw $0012
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
    dw $0006
    %spritemapEntry(0, $1F4, $08, 1, 0, 2, 6, $36)
    %spritemapEntry(0, $04, $F0, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $1FC, $F8, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1F4, $00, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1FC, $00, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $04, $F8, 0, 1, 2, 6, $35)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_13:
    dw $0012
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
    dw $0012
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
    dw $0012
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
    dw $0012
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
    dw $0012
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
    dw $0006
    %spritemapEntry(0, $1FE, $F4, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $06, $F4, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1EE, $04, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F6, $04, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F6, $FC, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1FE, $FC, 0, 1, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_19:
    dw $0012
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
    dw $0012
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
    dw $0012
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
    dw $0012
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
    dw $0012
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
    dw $0006
    %spritemapEntry(0, $1FE, $04, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $06, $04, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1EE, $F4, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1F6, $F4, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1F6, $FC, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1FE, $FC, 1, 1, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_1F:
    dw $0012
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
    dw $0012
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
    dw $0012
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
    dw $0012
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
    dw $0012
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
    dw $0006
    %spritemapEntry(0, $1FA, $04, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1F2, $04, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $0A, $F4, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $02, $F4, 1, 0, 2, 6, $31)
    %spritemapEntry(0, $02, $FC, 1, 0, 2, 6, $32)
    %spritemapEntry(0, $1FA, $FC, 1, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_25:
    dw $0012
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
    dw $0012
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
    dw $0012
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
    dw $0012
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
    dw $0012
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
    dw $0006
    %spritemapEntry(0, $0A, $04, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $02, $04, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FA, $FC, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1FA, $F4, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F2, $F4, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_2B:
    dw $0012
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
    dw $0012
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
    dw $0012
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
    dw $0012
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
    dw $0012
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
    dw $0004
    %spritemapEntry(0, $1FC, $F0, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $08, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 1, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_31:
    dw $000C
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
    dw $000C
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
    dw $000C
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
    dw $000C
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
    dw $000C
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
    dw $0004
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_37:
    dw $000C
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
    dw $000C
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
    dw $000C
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
    dw $000C
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
    dw $000C
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
    dw $0004
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_3D:
    dw $000C
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
    dw $000C
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
    dw $000C
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
    dw $000C
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
    dw $000C
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
    dw $0004
    %spritemapEntry(0, $1F0, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $08, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 6, $30)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_43:
    dw $000C
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
    dw $000C
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
    dw $000C
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
    dw $000C
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
    dw $000C
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
    dw $0004
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_Power_1:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_Power_2:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_Power_3:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_Power_4:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_Power_5:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_Power_6:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_Power_7:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_Power_8:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_Charged_Power_9:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_Charged_Power_A:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_Charged_Power_B:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_Charged_Power_C:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_Charged_Power_D:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_Charged_Power_E:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_Charged_Power_F:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_Charged_Ice_0:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_Ice_1:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_Charged_Ice_2:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $33)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_Ice_3:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $34)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_Ice_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Ice_1:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Ice_2:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $32)

ProjectileFlareSpritemaps_Ice_3:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_48:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_49:
    dw $0002
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $30)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EE25:
    dw $0003
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EE36:
    dw $0004
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 6, $30)
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4A:
    dw $0002
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FA, $FC, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4B:
    dw $0004
    %spritemapEntry(0, $06, $00, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FE, $00, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1FE, $F8, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F6, $F8, 0, 0, 2, 6, $31)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EE6E:
    dw $0006
    %spritemapEntry(0, $0A, $04, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $02, $04, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FA, $FC, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1FA, $F4, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F2, $F4, 0, 0, 2, 6, $31)
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4C:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4D:
    dw $0002
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $33)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EEA1:
    dw $0003
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $33)

UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EEB2:
    dw $0004
    %spritemapEntry(0, $1FC, $F0, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $33)
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4E:
    dw $0002
    %spritemapEntry(0, $1F6, $FC, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1FE, $FC, 0, 1, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_4F:
    dw $0004
    %spritemapEntry(0, $1F2, $00, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1FA, $00, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1FA, $F8, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $02, $F8, 0, 1, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_50:
    dw $0006
    %spritemapEntry(0, $1EE, $04, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F6, $04, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F6, $FC, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1FE, $FC, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1FE, $F4, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $06, $F4, 0, 1, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_51:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 6, $30)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_52:
    dw $0002
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 6, $30)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EF1D:
    dw $0003
    %spritemapEntry(0, $04, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $1F4, $FC, 0, 1, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EF2E:
    dw $0004
    %spritemapEntry(0, $1F0, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 6, $30)
    %spritemapEntry(0, $08, $FC, 0, 1, 2, 6, $30)
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_53:
    dw $0002
    %spritemapEntry(0, $1F6, $FC, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1FE, $FC, 1, 1, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_54:
    dw $0004
    %spritemapEntry(0, $1F2, $F8, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1FA, $F8, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1FA, $00, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $02, $00, 1, 1, 2, 6, $31)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EF66:
    dw $0006
    %spritemapEntry(0, $1EE, $F4, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1F6, $F4, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1F6, $FC, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1FE, $FC, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1FE, $04, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $06, $04, 1, 1, 2, 6, $31)
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_55:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_56:
    dw $0002
    %spritemapEntry(0, $1FC, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 1, 0, 2, 6, $33)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EF99:
    dw $0003
    %spritemapEntry(0, $1FC, $04, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F4, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $FC, 1, 0, 2, 6, $33)

UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EFAA:
    dw $0004
    %spritemapEntry(0, $1FC, $08, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F0, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 1, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 1, 0, 2, 6, $33)

UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EFC0:
    dw $0002
    %spritemapEntry(0, $1F6, $FC, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1FE, $FC, 1, 1, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EFCC:
    dw $0004
    %spritemapEntry(0, $1F2, $F8, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1FA, $F8, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1FA, $00, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $02, $00, 1, 1, 2, 6, $31)

UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93EFE2:
    dw $0006
    %spritemapEntry(0, $1EE, $F4, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1F6, $F4, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1F6, $FC, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $1FE, $FC, 1, 1, 2, 6, $31)
    %spritemapEntry(0, $1FE, $04, 1, 1, 2, 6, $32)
    %spritemapEntry(0, $06, $04, 1, 1, 2, 6, $31)
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_57:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_58:
    dw $0002
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $34)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93F015:
    dw $0003
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 6, $34)

UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93F026:
    dw $0004
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 6, $34)
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_59:
    dw $0002
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $1FC, $00, 1, 1, 2, 6, $36)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5A:
    dw $0004
    %spritemapEntry(0, $00, $FC, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $00, $04, 1, 1, 2, 6, $36)
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $35)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93F05E:
    dw $0006
    %spritemapEntry(0, $04, $08, 1, 1, 2, 6, $36)
    %spritemapEntry(0, $1F4, $F0, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $04, $00, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1FC, $F8, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1F4, $F8, 0, 0, 2, 6, $35)
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5B:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $37)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5C:
    dw $0002
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $37)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93F091:
    dw $0003
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 6, $37)

UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93F0A2:
    dw $0004
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 2, 6, $37)
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5D:
    dw $0002
    %spritemapEntry(0, $1FC, $F8, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $1FC, $00, 1, 0, 2, 6, $36)

ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_5E:
    dw $0004
    %spritemapEntry(0, $1F8, $FC, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1F8, $04, 1, 0, 2, 6, $36)
    %spritemapEntry(0, $00, $F4, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 6, $35)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_S_SI_SW_SIW_93F0DA:
    dw $0006
    %spritemapEntry(0, $1F4, $08, 1, 0, 2, 6, $36)
    %spritemapEntry(0, $04, $F0, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $1F4, $00, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1FC, $00, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $1FC, $F8, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $04, $F8, 0, 1, 2, 6, $35)
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $30)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F101:
    dw $0002
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $30)
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1:
    dw $0003
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 6, $30)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F11E:
    dw $0004
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 6, $30)

UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F134:
    dw $0005
    %spritemapEntry(0, $0C, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1EC, $FC, 0, 0, 2, 6, $30)
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_2:
    dw $0006
    %spritemapEntry(0, $10, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1E8, $FC, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_3:
    dw $0007
    %spritemapEntry(0, $14, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $0C, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1EC, $FC, 0, 0, 2, 6, $30)
    %spritemapEntry(0, $1E4, $FC, 0, 0, 2, 6, $30)

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_4:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $33)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F19B:
    dw $0002
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $33)
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_5:
    dw $0003
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 6, $33)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F1B8:
    dw $0004
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 2, 6, $33)

UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F1CE:
    dw $0005
    %spritemapEntry(0, $1FC, $0C, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $EC, 0, 0, 2, 6, $33)
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_6:
    dw $0006
    %spritemapEntry(0, $1FC, $10, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $E8, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_7:
    dw $0007
    %spritemapEntry(0, $1FC, $14, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $0C, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $EC, 0, 0, 2, 6, $33)
    %spritemapEntry(0, $1FC, $E4, 0, 0, 2, 6, $33)

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_8:
    dw $0002
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_9:
    dw $0004
    %spritemapEntry(0, $04, $00, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F4, $F8, 0, 0, 2, 6, $31)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F250:
    dw $0006
    %spritemapEntry(0, $08, $04, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $00, $04, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F0, $F4, 0, 0, 2, 6, $31)
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_A:
    dw $0008
    %spritemapEntry(0, $0C, $08, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $04, $08, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $04, $00, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1F4, $F8, 0, 0, 2, 6, $31)
    %spritemapEntry(0, $1F4, $F0, 0, 0, 2, 6, $32)
    %spritemapEntry(0, $1EC, $F0, 0, 0, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_B:
    dw $000A
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
    dw $0002
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_D:
    dw $0004
    %spritemapEntry(0, $1F4, $00, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1FC, $00, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1FC, $F8, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $04, $F8, 0, 1, 2, 6, $31)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F2F0:
    dw $0006
    %spritemapEntry(0, $1F0, $04, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F8, $04, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $00, $F4, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $08, $F4, 0, 1, 2, 6, $31)
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_E:
    dw $0008
    %spritemapEntry(0, $1EC, $08, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1F4, $08, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1F4, $00, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $1FC, $00, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $1FC, $F8, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $04, $F8, 0, 1, 2, 6, $31)
    %spritemapEntry(0, $04, $F0, 0, 1, 2, 6, $32)
    %spritemapEntry(0, $0C, $F0, 0, 1, 2, 6, $31)

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_F:
    dw $000A
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
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $34)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F375:
    dw $0002
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $34)
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_11:
    dw $0003
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 6, $34)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F392:
    dw $0004
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 6, $34)

UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F3A8:
    dw $0005
    %spritemapEntry(0, $0C, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1EC, $FC, 0, 0, 2, 6, $34)
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_12:
    dw $0006
    %spritemapEntry(0, $10, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1E8, $FC, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_13:
    dw $0007
    %spritemapEntry(0, $14, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $0C, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1EC, $FC, 0, 0, 2, 6, $34)
    %spritemapEntry(0, $1E4, $FC, 0, 0, 2, 6, $34)

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_14:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $37)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F40F:
    dw $0002
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $37)
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_15:
    dw $0003
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 6, $37)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F42C:
    dw $0004
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 2, 6, $37)

UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F442:
    dw $0005
    %spritemapEntry(0, $1FC, $0C, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $EC, 0, 0, 2, 6, $37)
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_16:
    dw $0006
    %spritemapEntry(0, $1FC, $10, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $E8, 0, 0, 2, 6, $37)

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_17:
    dw $0007
    %spritemapEntry(0, $1FC, $14, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $0C, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $EC, 0, 0, 2, 6, $37)
    %spritemapEntry(0, $1FC, $E4, 0, 0, 2, 6, $37)

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_18:
    dw $0002
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $1FC, $00, 1, 1, 2, 6, $36)

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_19:
    dw $0004
    %spritemapEntry(0, $00, $04, 1, 1, 2, 6, $36)
    %spritemapEntry(0, $00, $FC, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $35)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F4C4:
    dw $0006
    %spritemapEntry(0, $1FC, $F8, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $04, $00, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $04, $08, 1, 1, 2, 6, $36)
    %spritemapEntry(0, $1F4, $F0, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1F4, $F8, 0, 0, 2, 6, $35)
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1A:
    dw $0008
    %spritemapEntry(0, $08, $04, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $1F8, $F4, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $00, $FC, 1, 1, 2, 6, $35)
    %spritemapEntry(0, $08, $0C, 1, 1, 2, 6, $36)
    %spritemapEntry(0, $1F0, $EC, 0, 0, 2, 6, $36)
    %spritemapEntry(0, $00, $04, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 6, $35)
    %spritemapEntry(0, $1F0, $F4, 0, 0, 2, 6, $35)

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1B:
    dw $000A
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
    dw $0002
    %spritemapEntry(0, $1FC, $F8, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $1FC, $00, 1, 0, 2, 6, $36)

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1D:
    dw $0004
    %spritemapEntry(0, $1F8, $04, 1, 0, 2, 6, $36)
    %spritemapEntry(0, $1F8, $FC, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $00, $F4, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 6, $35)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_93F564:
    dw $0006
    %spritemapEntry(0, $1FC, $F8, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1F4, $00, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1F4, $08, 1, 0, 2, 6, $36)
    %spritemapEntry(0, $04, $F0, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $1FC, $00, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $04, $F8, 0, 1, 2, 6, $35)
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1E:
    dw $0008
    %spritemapEntry(0, $1F0, $04, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $00, $F4, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1F8, $FC, 1, 0, 2, 6, $35)
    %spritemapEntry(0, $1F0, $0C, 1, 0, 2, 6, $36)
    %spritemapEntry(0, $08, $EC, 0, 1, 2, 6, $36)
    %spritemapEntry(0, $1F8, $04, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 6, $35)
    %spritemapEntry(0, $08, $F4, 0, 1, 2, 6, $35)

ProjectileFlareSpritemaps_Charged_P_PI_PW_PIW_1F:
    dw $000A
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
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W Pose : CMP.W #$00C7 : BEQ .verticalShinesparkWindup
    CMP.W #$00C8 : BNE .return

  .verticalShinesparkWindup:
    LDA.W NMI_FrameCounter : BIT.W #$0001 : BNE .return
    LDA.W SamusXPosition : SEC : SBC.W Layer1XPosition : STA.B DP_Temp14
    LDA.W SamusYPosition : SEC : SBC.W Layer1YPosition : STA.B DP_Temp12
    LDA.W #$003C : CLC : ADC.W #$0002
    JSL AddSpritemapFrom_93A1A1_TableToOAM

  .return:
    PLB : PLP
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


Freespace_Bank93_F61D:
; $9E3 bytes
