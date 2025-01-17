
org $8D8000


EnemyProjSpritemaps:
EnemyProjSpritemaps_Blank_Default:
    dw $0000,$0000 
    db $00 
    dw $00DF 

EnemyProjSpritemaps_EyeDoorProjectile_0:
    dw $0001,$C3F8 
    db $F8 
    dw $2A76 

EnemyProjSpritemaps_EyeDoorProjectile_1:
    dw $0001,$C3F8 
    db $F8 
    dw $2A78 

EnemyProjSpritemaps_EyeDoorProjectile_2:
    dw $0001,$C3F8 
    db $F8 
    dw $2A98 

EnemyProjSpritemaps_EyeDoorProjectile_3:
    dw $0001,$C3F8 
    db $F8 
    dw $2A9E 

EnemyProjSpritemaps_SkreeParticle:
    dw $0001,$01FC 
    db $FC 
    dw $2115 

EnemyProjSpritemaps_CrocomiresProjectile_0:
    dw $0004,$0000 
    db $F8 
    dw $70D0,$0000 
    db $00 
    dw $F0D0,$01F8 
    db $00 
    dw $B0D0,$01F8 
    db $F8 
    dw $30D0 

EnemyProjSpritemaps_CrocomiresProjectile_1:
    dw $0004,$0000 
    db $F8 
    dw $70D1,$0000 
    db $00 
    dw $F0D1,$01F8 
    db $00 
    dw $B0D1,$01F8 
    db $F8 
    dw $30D1 

EnemyProjSpritemaps_CrocomiresProjectile_2:
    dw $0004,$0000 
    db $00 
    dw $F0D2,$0000 
    db $F8 
    dw $70D2,$01F8 
    db $00 
    dw $B0D2,$01F8 
    db $F8 
    dw $30D2 

EnemyProjSpritemaps_CrocomiresProjectile_3:
    dw $0004,$0000 
    db $00 
    dw $F0D3,$0000 
    db $F8 
    dw $70D3,$01F8 
    db $00 
    dw $B0D3,$01F8 
    db $F8 
    dw $30D3 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_OldCrocomiresProjectile_0_8D8082:
    dw $0004,$0000 
    db $00 
    dw $E3C2,$01F8 
    db $00 
    dw $A3C2,$0000 
    db $F8 
    dw $63C2,$01F8 
    db $F8 
    dw $23C2 

UNUSED_EnemyProjSpritemaps_OldCrocomiresProjectile_1_8D8098:
    dw $0004,$0000 
    db $F8 
    dw $63D2,$0000 
    db $00 
    dw $E3D2,$01F8 
    db $00 
    dw $A3D2,$01F8 
    db $F8 
    dw $23D2 

UNUSED_EnemyProjSpritemaps_0_8D80AE:
    dw $0001,$01F8 
    db $F8 
    dw $3177 

UNUSED_EnemyProjSpritemaps_1_8D80B5:
    dw $0001,$01F8 
    db $F8 
    dw $F17B 

UNUSED_EnemyProjSpritemaps_2_8D80BC:
    dw $0001,$01F8 
    db $F8 
    dw $F177 

UNUSED_EnemyProjSpritemaps_3_8D80C3:
    dw $0001,$01F8 
    db $F8 
    dw $317B 
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_RidleysFireball_0:
    dw $0001,$C3F8 
    db $F8 
    dw $31C8 

EnemyProjSpritemaps_RidleysFireball_1:
    dw $0001,$C3F8 
    db $F8 
    dw $F1CA 

EnemyProjSpritemaps_RidleysFireball_2:
    dw $0001,$C3F8 
    db $F8 
    dw $F1C8 

EnemyProjSpritemaps_RidleysFireball_3:
    dw $0001,$C3F8 
    db $F8 
    dw $31CA 

EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_0:
    dw $0001,$01FC 
    db $FC 
    dw $3A5F 

EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_1:
    dw $0001,$C3F8 
    db $F7 
    dw $3A76 

EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_2:
    dw $0001,$C3F8 
    db $F6 
    dw $3A78 

EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_3:
    dw $0001,$C3F8 
    db $F5 
    dw $3A98 

EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_4:
    dw $0001,$C3F8 
    db $F4 
    dw $3A9E 

EnemyProjSpritemaps_CrocomiresBridgeCrumbling:
    dw $0001,$C3FC 
    db $FC 
    dw $21CC 

EnemyProjSpritemaps_CrocomiresSpikeWallPieces:
    dw $0002,$C208 
    db $F8 
    dw $27EE,$C3F8 
    db $F8 
    dw $65CC 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_8D811C:
    dw $0004,$0000 
    db $00 
    dw $21F1,$01F8 
    db $00 
    dw $21F0,$0000 
    db $F8 
    dw $21E1,$01F8 
    db $F8 
    dw $21E0 

UNUSED_EnemyProjSpritemaps_CrocomireBridgeCrumbling_0_8D8132:
    dw $0002,$0000 
    db $10 
    dw $61E0,$01F8 
    db $10 
    dw $21E0 

UNUSED_EnemyProjSpritemaps_CrocomireBridgeCrumbling_1_8D813E:
    dw $0006,$0004 
    db $08 
    dw $61DB,$0004 
    db $00 
    dw $61CB,$01FC 
    db $08 
    dw $21DC,$01F4 
    db $08 
    dw $21DB,$01FC 
    db $00 
    dw $21CC,$01F4 
    db $00 
    dw $21CB 

UNUSED_EnemyProjSpritemaps_CrocomireBridgeCrumbling_2_8D815E:
    dw $000C,$0000 
    db $F0 
    dw $61DF,$0008 
    db $F0 
    dw $61CF,$0000 
    db $00 
    dw $61DE,$0008 
    db $00 
    dw $61DD,$0000 
    db $F8 
    dw $61CE,$0008 
    db $F8 
    dw $61CD,$01F8 
    db $F0 
    dw $21DF,$01F0 
    db $F0 
    dw $21CF,$01F8 
    db $00 
    dw $21DE,$01F0 
    db $00 
    dw $21DD,$01F8 
    db $F8 
    dw $21CE,$01F0 
    db $F8 
    dw $21CD 
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_PhantoonFlames_0:
    dw $0002,$C3F8 
    db $00 
    dw $3F06,$C3F8 
    db $F0 
    dw $3F00 

EnemyProjSpritemaps_PhantoonFlames_1:
    dw $0002,$C3F8 
    db $00 
    dw $3F08,$C3F8 
    db $F0 
    dw $3F02 

EnemyProjSpritemaps_PhantoonFlames_2:
    dw $0002,$C3F8 
    db $00 
    dw $3F0A,$C3F8 
    db $F0 
    dw $3F04 

EnemyProjSpritemaps_PhantoonFlames_3:
    dw $0002,$C200 
    db $F8 
    dw $3F0E,$C3F0 
    db $F8 
    dw $3F0C 

EnemyProjSpritemaps_PhantoonFlames_4:
    dw $0002,$C3F8 
    db $FE 
    dw $3F28,$C3F8 
    db $EE 
    dw $3F20 

EnemyProjSpritemaps_PhantoonFlames_5:
    dw $0002,$C3F8 
    db $FC 
    dw $3F2A,$C3F8 
    db $EC 
    dw $3F22 

EnemyProjSpritemaps_PhantoonFlames_6:
    dw $0002,$C3F8 
    db $FA 
    dw $3F2C,$C3F8 
    db $EA 
    dw $3F24 

EnemyProjSpritemaps_PhantoonFlames_7:
    dw $0002,$C3F8 
    db $F8 
    dw $3F2E,$C3F8 
    db $E8 
    dw $3F26 

EnemyProjSpritemaps_PhantoonFlames_8:
    dw $0002,$C3F8 
    db $F0 
    dw $3F00,$C3F8 
    db $00 
    dw $3F40 

EnemyProjSpritemaps_PhantoonFlames_9:
    dw $0002,$C3F8 
    db $F0 
    dw $3F02,$C3F8 
    db $00 
    dw $3F42 

EnemyProjSpritemaps_PhantoonFlames_A:
    dw $0002,$C3F8 
    db $F0 
    dw $3F04,$C3F8 
    db $00 
    dw $3F44 

EnemyProjSpritemaps_PhantoonStartingFlames_0:
    dw $0002,$C3F8 
    db $00 
    dw $3F46,$C3F8 
    db $F0 
    dw $3F00 

EnemyProjSpritemaps_PhantoonStartingFlames_1:
    dw $0002,$C3F8 
    db $00 
    dw $3F48,$C3F8 
    db $F0 
    dw $3F02 

EnemyProjSpritemaps_PhantoonStartingFlames_2:
    dw $0002,$C3F8 
    db $00 
    dw $3F4A,$C3F8 
    db $F0 
    dw $3F04 

EnemyProjSpritemaps_PhantoonStartingFlames_3:
    dw $0002,$C3F8 
    db $00 
    dw $3F4C,$C3F8 
    db $F0 
    dw $3F00 

EnemyProjSpritemaps_PhantoonStartingFlames_4:
    dw $0002,$C3F8 
    db $00 
    dw $3F4E,$C3F8 
    db $F0 
    dw $3F02 

EnemyProjSpritemaps_PhantoonStartingFlames_5:
    dw $0002,$C3F8 
    db $00 
    dw $3F4A,$C3F8 
    db $F0 
    dw $3F04 

EnemyProjSpritemaps_KraidRocks_KagoBugs:
    dw $0001,$81F8 
    db $F8 
    dw $31D0 

EnemyProjSpritemaps_KraidRisingRocks_Right:
    dw $0001,$01FC 
    db $FC 
    dw $31D2 

EnemyProjSpritemaps_MotherBrainOnionRings_0:
    dw $0001,$01FC 
    db $FC 
    dw $35AD 

EnemyProjSpritemaps_MotherBrainOnionRings_1:
    dw $0001,$C3F8 
    db $F8 
    dw $35A7 

EnemyProjSpritemaps_MotherBrainOnionRings_2:
    dw $0004,$C3FB 
    db $FB 
    dw $F5A9,$C3F5 
    db $FB 
    dw $B5A9,$C3FB 
    db $F5 
    dw $75A9,$C3F5 
    db $F5 
    dw $35A9 

EnemyProjSpritemaps_MotherBrainOnionRings_3:
    dw $0004,$C3FC 
    db $FC 
    dw $F5A9,$C3F4 
    db $FC 
    dw $B5A9,$C3FC 
    db $F4 
    dw $75A9,$C3F4 
    db $F4 
    dw $35A9 

EnemyProjSpritemaps_MotherBrainOnionRings_4:
    dw $0004,$C3FF 
    db $FF 
    dw $F5AB,$C3F1 
    db $FF 
    dw $B5AB,$C3FF 
    db $F1 
    dw $75AB,$C3F1 
    db $F1 
    dw $35AB 

EnemyProjSpritemaps_MotherBrainOnionRings_5:
    dw $0004,$C200 
    db $00 
    dw $F5AB,$C3F0 
    db $00 
    dw $B5AB,$C200 
    db $F0 
    dw $75AB,$C3F0 
    db $F0 
    dw $35AB 

EnemyProjSpritemaps_MotherBrainsBomb_0:
    dw $0002,$C3F8 
    db $F8 
    dw $35CE,$01FC 
    db $FC 
    dw $35AE 

EnemyProjSpritemaps_MotherBrainsBomb_1:
    dw $0002,$C3F8 
    db $F8 
    dw $35CE,$01FC 
    db $FC 
    dw $35AF 

EnemyProjSpritemaps_MotherBrainsBomb_2:
    dw $0002,$C3F8 
    db $F8 
    dw $35CE,$01FC 
    db $FC 
    dw $35BD 

EnemyProjSpritemaps_MotherBrainsBomb_3:
    dw $0002,$C3F8 
    db $F8 
    dw $35CE,$01FC 
    db $FC 
    dw $35BE 

EnemyProjSpritemaps_MotherBrainsBomb_4:
    dw $0002,$C3F8 
    db $F8 
    dw $35CE,$01FC 
    db $FC 
    dw $35BF 

EnemyProjSpritemaps_MotherBrainsBomb_5:
    dw $0002,$C3F8 
    db $F8 
    dw $35CE,$01FC 
    db $FC 
    dw $75BF 

EnemyProjSpritemaps_MotherBrainsBomb_6:
    dw $0002,$C3F8 
    db $F8 
    dw $35CE,$01FC 
    db $FC 
    dw $75BE 

EnemyProjSpritemaps_MotherBrainsBomb_7:
    dw $0002,$C3F8 
    db $F8 
    dw $35CE,$01FC 
    db $FC 
    dw $75BD 

EnemyProjSpritemaps_MotherBrainsBomb_8:
    dw $0002,$C3F8 
    db $F8 
    dw $35CE,$01FC 
    db $FC 
    dw $75AF 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_0_8D8348:
    dw $0001,$01FC 
    db $FC 
    dw $35E0 

UNUSED_EnemyProjSpritemaps_1_8D834F:
    dw $0001,$01FC 
    db $FC 
    dw $35E1 

UNUSED_EnemyProjSpritemaps_2_8D8356:
    dw $0001,$01FC 
    db $FC 
    dw $35E2 
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_MotherBrainsRedBeam_0:
    dw $0001,$01FC 
    db $FC 
    dw $35E3 

EnemyProjSpritemaps_MotherBrainsRedBeam_1:
    dw $0001,$C3F8 
    db $F8 
    dw $35E4 

EnemyProjSpritemaps_MotherBrainsRedBeam_2:
    dw $0001,$C3F8 
    db $F8 
    dw $35E6 

EnemyProjSpritemaps_MotherBrainsRedBeam_3:
    dw $0001,$C3F8 
    db $F8 
    dw $35E8 

EnemyProjSpritemaps_MotherBrainsRedBeam_4:
    dw $0001,$C3F8 
    db $F8 
    dw $35EA 

EnemyProjSpritemaps_MotherBrainsRedBeam_5:
    dw $0001,$C3F8 
    db $F8 
    dw $35EC 

EnemyProjSpritemaps_MotherBrainsRedBeam_6:
    dw $0001,$C3F8 
    db $F8 
    dw $35EE 

EnemyProjSpritemaps_MotherBrainsTubeFalling_TopRight:
    dw $0004,$C3FC 
    db $E8 
    dw $AF5E,$0000 
    db $F8 
    dw $2F51,$01F8 
    db $F8 
    dw $2F50,$C3F8 
    db $00 
    dw $EF42 

EnemyProjSpritemaps_MotherBrainsTubeFalling_TopLeft:
    dw $0004,$C3F4 
    db $E8 
    dw $EF5E,$01F8 
    db $F8 
    dw $6F51,$0000 
    db $F8 
    dw $6F50,$C3F8 
    db $00 
    dw $AF42 

EnemyProjSpritemaps_MotherBrainsTubeFalling_TopMiddleLeft:
    dw $0007,$C3FA 
    db $DC 
    dw $AF5E,$C3F8 
    db $1C 
    dw $2F5E,$C3F8 
    db $14 
    dw $2F4E,$C3F8 
    db $04 
    dw $AF40,$C3F8 
    db $F4 
    dw $2F4B,$0000 
    db $EC 
    dw $2F6D,$01F8 
    db $EC 
    dw $2F6D 

EnemyProjSpritemaps_MotherBrainsTubeFalling_TopMiddleRight:
    dw $0007,$C3F6 
    db $DC 
    dw $EF5E,$C3F8 
    db $1C 
    dw $6F5E,$C3F8 
    db $14 
    dw $6F4E,$C3F8 
    db $04 
    dw $EF40,$C3F8 
    db $F4 
    dw $2F4B,$01F8 
    db $EC 
    dw $6F6D,$0000 
    db $EC 
    dw $6F6D 

EnemyProjSpritemaps_AlcoonFireball_0:
    dw $0001,$01FC 
    db $FC 
    dw $212C 

EnemyProjSpritemaps_AlcoonFireball_1:
    dw $0001,$01FC 
    db $FC 
    dw $A12D 

EnemyProjSpritemaps_AlcoonFireball_2:
    dw $0001,$01FC 
    db $FC 
    dw $E12C 

EnemyProjSpritemaps_AlcoonFireball_3:
    dw $0001,$01FC 
    db $FC 
    dw $612D 

EnemyProjSpritemaps_MiniKraidSpit:
    dw $0001,$01FD 
    db $FD 
    dw $231F 

EnemyProjSpritemaps_MiniKraidSpikes_Left:
    dw $0001,$01FC 
    db $FC 
    dw $230F 

EnemyProjSpritemaps_MiniKraidSpikes_Right:
    dw $0001,$01FC 
    db $FC 
    dw $630F 

EnemyProjSpritemaps_MetareeParticle:
    dw $0001,$01FC 
    db $FC 
    dw $312B 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_0_8D343C:
    dw $0001,$C3F8 
    db $F8 
    dw $3A7C 

UNUSED_EnemyProjSpritemaps_1_8D3443:
    dw $0001,$C3F8 
    db $F6 
    dw $3A7E 

UNUSED_EnemyProjSpritemaps_2_8D344A:
    dw $0001,$C3F8 
    db $F4 
    dw $3A9A 

UNUSED_EnemyProjSpritemaps_3_8D3451:
    dw $0001,$C3F8 
    db $F2 
    dw $3A9C 
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_KagoBugs_0:
    dw $0001,$01FC 
    db $FC 
    dw $2128 

EnemyProjSpritemaps_KagoBugs_1:
    dw $0001,$01FC 
    db $FC 
    dw $2129 

EnemyProjSpritemaps_KagoBugs_2:
    dw $0001,$01FC 
    db $FC 
    dw $212A 

EnemyProjSpritemaps_CeresElevatorPadLevelDataConcealer:
    dw $0004,$0008 
    db $FC 
    dw $3A20,$0000 
    db $FC 
    dw $3A20,$01F8 
    db $FC 
    dw $3A20,$01F0 
    db $FC 
    dw $3A20 

EnemyProjSpritemaps_GunshipLiftoffDustClouds_0:
    dw $0001,$C3F8 
    db $F8 
    dw $3B68 

EnemyProjSpritemaps_GunshipLiftoffDustClouds_1:
    dw $0003,$C202 
    db $EE 
    dw $3B68,$C3F2 
    db $E6 
    dw $3B68,$C3FA 
    db $F6 
    dw $3B6A 

EnemyProjSpritemaps_GunshipLiftoffDustClouds_2:
    dw $0004,$C204 
    db $E4 
    dw $3B68,$C3F4 
    db $E3 
    dw $3B6A,$C204 
    db $EB 
    dw $3B6A,$C3FC 
    db $F3 
    dw $3B6C 

EnemyProjSpritemaps_GunshipLiftoffDustClouds_3:
    dw $0005,$C3FE 
    db $D6 
    dw $3B68,$C206 
    db $E2 
    dw $3B6A,$C3F6 
    db $E0 
    dw $3B6C,$C206 
    db $E8 
    dw $3B6C,$C3FE 
    db $F0 
    dw $3B6E 

EnemyProjSpritemaps_GunshipLiftoffDustClouds_4:
    dw $0005,$C200 
    db $D4 
    dw $3B6A,$C208 
    db $E0 
    dw $3B6C,$C208 
    db $E5 
    dw $3B6E,$C3F8 
    db $DD 
    dw $3B6E,$C200 
    db $ED 
    dw $3BE4 

EnemyProjSpritemaps_GunshipLiftoffDustClouds_5:
    dw $0004,$C202 
    db $D2 
    dw $3B6C,$C20A 
    db $DE 
    dw $3B6E,$C20A 
    db $E2 
    dw $3BE4,$C3FA 
    db $DA 
    dw $3BE4 

EnemyProjSpritemaps_GunshipLiftoffDustClouds_6:
    dw $0002,$C204 
    db $D0 
    dw $3B6E,$C20C 
    db $DC 
    dw $3BE4 

EnemyProjSpritemaps_GunshipLiftoffDustClouds_7:
    dw $0001,$C206 
    db $CE 
    dw $3BE4 

EnemyProjSpritemaps_GunshipLiftoffDustClouds_8:
    dw $0001,$C3F8 
    db $F8 
    dw $3BC4 

EnemyProjSpritemaps_GunshipLiftoffDustClouds_9:
    dw $0003,$C3FA 
    db $F6 
    dw $3BC6,$C202 
    db $EE 
    dw $3BC4,$C3F2 
    db $E6 
    dw $3BC4 

EnemyProjSpritemaps_GunshipLiftoffDustClouds_A:
    dw $0004,$C3FC 
    db $F4 
    dw $3BC8,$C204 
    db $EC 
    dw $3BC6,$C3F4 
    db $E4 
    dw $3BC6,$C204 
    db $E4 
    dw $3BC4 

EnemyProjSpritemaps_GunshipLiftoffDustClouds_B:
    dw $0005,$C3FE 
    db $F2 
    dw $3BCA,$C3F6 
    db $E2 
    dw $3BC8,$C206 
    db $E2 
    dw $3BC6,$C3FE 
    db $D6 
    dw $3BC4,$C206 
    db $EA 
    dw $3B6C 

EnemyProjSpritemaps_GunshipLiftoffDustClouds_C:
    dw $0005,$C200 
    db $F0 
    dw $3BCC,$C208 
    db $E8 
    dw $3BCA,$C3F8 
    db $E0 
    dw $3BCA,$C208 
    db $E0 
    dw $3BC8,$C200 
    db $D4 
    dw $3BC6 

EnemyProjSpritemaps_GunshipLiftoffDustClouds_D:
    dw $0004,$C3FA 
    db $DE 
    dw $3BCC,$C20A 
    db $E6 
    dw $3BCC,$C20A 
    db $DE 
    dw $3BCA,$C202 
    db $D2 
    dw $3BC8 

EnemyProjSpritemaps_GunshipLiftoffDustClouds_E:
    dw $0002,$C20C 
    db $DC 
    dw $3BCC,$C204 
    db $D0 
    dw $3BCA 

EnemyProjSpritemaps_GunshipLiftoffDustClouds_F:
    dw $0001,$C206 
    db $CE 
    dw $3BCC 

EnemyProjSpritemaps_GunshipLiftoffDustClouds_10:
    dw $0006,$01FC 
    db $04 
    dw $3BA1,$01F4 
    db $04 
    dw $3BA0,$0004 
    db $04 
    dw $3BA2,$0004 
    db $FC 
    dw $3B92,$0004 
    db $F4 
    dw $3B82,$C3F4 
    db $F4 
    dw $3B80 

EnemyProjSpritemaps_GunshipLiftoffDustClouds_11:
    dw $000A,$01F0 
    db $F2 
    dw $3BA1,$01E8 
    db $F2 
    dw $3BA0,$01F8 
    db $F2 
    dw $3BA2,$01F8 
    db $EA 
    dw $3B92,$01F8 
    db $E2 
    dw $3B82,$C3E8 
    db $E2 
    dw $3B80,$C204 
    db $FE 
    dw $3BA5,$C3F4 
    db $FE 
    dw $3BA3,$C204 
    db $EE 
    dw $3B85,$C3F4 
    db $EE 
    dw $3B83 

EnemyProjSpritemaps_GunshipLiftoffDustClouds_12:
    dw $000E,$0014 
    db $F8 
    dw $3BA1,$000C 
    db $F8 
    dw $3BA0,$001C 
    db $F8 
    dw $3BA2,$001C 
    db $F0 
    dw $3B92,$001C 
    db $E8 
    dw $3B82,$C20C 
    db $E8 
    dw $3B80,$C3F8 
    db $EC 
    dw $3BA5,$C3E8 
    db $EC 
    dw $3BA3,$C3F8 
    db $DC 
    dw $3B85,$C3E8 
    db $DC 
    dw $3B83,$C208 
    db $FC 
    dw $3BA9,$C3F8 
    db $FC 
    dw $3BA7,$C208 
    db $EC 
    dw $3B89,$C3F8 
    db $EC 
    dw $3B87 

EnemyProjSpritemaps_GunshipLiftoffDustClouds_13:
    dw $000C,$C3FC 
    db $EA 
    dw $3BA9,$C3EC 
    db $EA 
    dw $3BA7,$C3FC 
    db $DA 
    dw $3B89,$C3EC 
    db $DA 
    dw $3B87,$C21C 
    db $F2 
    dw $3BA5,$C20C 
    db $F2 
    dw $3BA3,$C21C 
    db $E2 
    dw $3B85,$C20C 
    db $E2 
    dw $3B83,$C20C 
    db $FA 
    dw $3BAD,$C3FC 
    db $FA 
    dw $3BAB,$C20C 
    db $EA 
    dw $3B8D,$C3FC 
    db $EA 
    dw $3B8B 

EnemyProjSpritemaps_GunshipLiftoffDustClouds_14:
    dw $000C,$C220 
    db $F0 
    dw $3BA9,$C210 
    db $F0 
    dw $3BA7,$C220 
    db $E0 
    dw $3B89,$C210 
    db $E0 
    dw $3B87,$C200 
    db $E8 
    dw $3BAD,$C3F0 
    db $E8 
    dw $3BAB,$C200 
    db $D8 
    dw $3B8D,$C3F0 
    db $D8 
    dw $3B8B,$C210 
    db $F8 
    dw $3BE2,$C200 
    db $F8 
    dw $3BE0,$C210 
    db $E8 
    dw $3BC2,$C200 
    db $E8 
    dw $3BC0 

EnemyProjSpritemaps_GunshipLiftoffDustClouds_15:
    dw $0008,$C204 
    db $E6 
    dw $3BE2,$C3F4 
    db $E6 
    dw $3BE0,$C204 
    db $D6 
    dw $3BC2,$C3F4 
    db $D6 
    dw $3BC0,$C224 
    db $EE 
    dw $3BAD,$C214 
    db $EE 
    dw $3BAB,$C224 
    db $DE 
    dw $3B8D,$C214 
    db $DE 
    dw $3B8B 

EnemyProjSpritemaps_GunshipLiftoffDustClouds_16:
    dw $0004,$C228 
    db $EC 
    dw $3BE2,$C218 
    db $EC 
    dw $3BE0,$C228 
    db $DC 
    dw $3BC2,$C218 
    db $DC 
    dw $3BC0 

EnemyProjSpritemaps_GunshipLiftoffDustClouds_17:
    dw $0001,$C3F8 
    db $F8 
    dw $7B68 

EnemyProjSpritemaps_GunshipLiftoffDustClouds_18:
    dw $0003,$C3EE 
    db $EE 
    dw $7B68,$C3FE 
    db $E6 
    dw $7B68,$C3F6 
    db $F6 
    dw $7B6A 

EnemyProjSpritemaps_GunshipLiftoffDustClouds_19:
    dw $0004,$C3EC 
    db $E4 
    dw $7B68,$C3FC 
    db $E3 
    dw $7B6A,$C3EC 
    db $EB 
    dw $7B6A,$C3F4 
    db $F3 
    dw $7B6C 

EnemyProjSpritemaps_GunshipLiftoffDustClouds_1A:
    dw $0005,$C3F2 
    db $D6 
    dw $7B68,$C3EA 
    db $E2 
    dw $7B6A,$C3FA 
    db $E0 
    dw $7B6C,$C3EA 
    db $E8 
    dw $7B6C,$C3F2 
    db $F0 
    dw $7B6E 

EnemyProjSpritemaps_GunshipLiftoffDustClouds_1B:
    dw $0005,$C3F0 
    db $D4 
    dw $7B6A,$C3E8 
    db $E0 
    dw $7B6C,$C3E8 
    db $E5 
    dw $7B6E,$C3F8 
    db $DD 
    dw $7B6E,$C3F0 
    db $ED 
    dw $7BE4 

EnemyProjSpritemaps_GunshipLiftoffDustClouds_1C:
    dw $0004,$C3EE 
    db $D2 
    dw $7B6C,$C3E6 
    db $DE 
    dw $7B6E,$C3E6 
    db $E2 
    dw $7BE4,$C3F6 
    db $DA 
    dw $7BE4 

EnemyProjSpritemaps_GunshipLiftoffDustClouds_1D:
    dw $0002,$C3EC 
    db $D0 
    dw $7B6E,$C3E4 
    db $DC 
    dw $7BE4 

EnemyProjSpritemaps_GunshipLiftoffDustClouds_1E:
    dw $0001,$C3EA 
    db $CE 
    dw $7BE4 

EnemyProjSpritemaps_GunshipLiftoffDustClouds_1F:
    dw $0001,$C3F8 
    db $F8 
    dw $7BC4 

EnemyProjSpritemaps_GunshipLiftoffDustClouds_20:
    dw $0003,$C3F6 
    db $F6 
    dw $7BC6,$C3EE 
    db $EE 
    dw $7BC4,$C3FE 
    db $E6 
    dw $7BC4 

EnemyProjSpritemaps_GunshipLiftoffDustClouds_21:
    dw $0004,$C3F4 
    db $F4 
    dw $7BC8,$C3EC 
    db $EC 
    dw $7BC6,$C3FC 
    db $E4 
    dw $7BC6,$C3EC 
    db $E4 
    dw $7BC4 

EnemyProjSpritemaps_GunshipLiftoffDustClouds_22:
    dw $0005,$C3F2 
    db $F2 
    dw $7BCA,$C3FA 
    db $E2 
    dw $7BC8,$C3EA 
    db $E2 
    dw $7BC6,$C3F2 
    db $D6 
    dw $7BC4,$C3EA 
    db $EA 
    dw $7B6C 

EnemyProjSpritemaps_GunshipLiftoffDustClouds_23:
    dw $0005,$C3F0 
    db $F0 
    dw $7BCC,$C3E8 
    db $E8 
    dw $7BCA,$C3F8 
    db $E0 
    dw $7BCA,$C3E8 
    db $E0 
    dw $7BC8,$C3F0 
    db $D4 
    dw $7BC6 

EnemyProjSpritemaps_GunshipLiftoffDustClouds_24:
    dw $0004,$C3F6 
    db $DE 
    dw $7BCC,$C3E6 
    db $E6 
    dw $7BCC,$C3E6 
    db $DE 
    dw $7BCA,$C3EE 
    db $D2 
    dw $7BC8 

EnemyProjSpritemaps_GunshipLiftoffDustClouds_25:
    dw $0002,$C3E4 
    db $DC 
    dw $7BCC,$C3EC 
    db $D0 
    dw $7BCA 

EnemyProjSpritemaps_GunshipLiftoffDustClouds_26:
    dw $0001,$C3EA 
    db $CE 
    dw $7BCC 

EnemyProjSpritemaps_GunshipLiftoffDustClouds_27:
    dw $0006,$01FC 
    db $04 
    dw $7BA1,$0004 
    db $04 
    dw $7BA0,$01F4 
    db $04 
    dw $7BA2,$01F4 
    db $FC 
    dw $7B92,$01F4 
    db $F4 
    dw $7B82,$C3FC 
    db $F4 
    dw $7B80 

EnemyProjSpritemaps_GunshipLiftoffDustClouds_28:
    dw $000A,$0008 
    db $F2 
    dw $7BA1,$0010 
    db $F2 
    dw $7BA0,$0000 
    db $F2 
    dw $7BA2,$0000 
    db $EA 
    dw $7B92,$0000 
    db $E2 
    dw $7B82,$C208 
    db $E2 
    dw $7B80,$C3EC 
    db $FE 
    dw $7BA5,$C3FC 
    db $FE 
    dw $7BA3,$C3EC 
    db $EE 
    dw $7B85,$C3FC 
    db $EE 
    dw $7B83 

EnemyProjSpritemaps_GunshipLiftoffDustClouds_29:
    dw $000E,$01E4 
    db $F8 
    dw $7BA1,$01EC 
    db $F8 
    dw $7BA0,$01DC 
    db $F8 
    dw $7BA2,$01DC 
    db $F0 
    dw $7B92,$01DC 
    db $E8 
    dw $7B82,$C3E4 
    db $E8 
    dw $7B80,$C3F8 
    db $EC 
    dw $7BA5,$C208 
    db $EC 
    dw $7BA3,$C3F8 
    db $DC 
    dw $7B85,$C208 
    db $DC 
    dw $7B83,$C3E8 
    db $FC 
    dw $7BA9,$C3F8 
    db $FC 
    dw $7BA7,$C3E8 
    db $EC 
    dw $7B89,$C3F8 
    db $EC 
    dw $7B87 

EnemyProjSpritemaps_GunshipLiftoffDustClouds_2A:
    dw $000C,$C3F4 
    db $EA 
    dw $7BA9,$C204 
    db $EA 
    dw $7BA7,$C3F4 
    db $DA 
    dw $7B89,$C204 
    db $DA 
    dw $7B87,$C3D4 
    db $F2 
    dw $7BA5,$C3E4 
    db $F2 
    dw $7BA3,$C3D4 
    db $E2 
    dw $7B85,$C3E4 
    db $E2 
    dw $7B83,$C3E4 
    db $FA 
    dw $7BAD,$C3F4 
    db $FA 
    dw $7BAB,$C3E4 
    db $EA 
    dw $7B8D,$C3F4 
    db $EA 
    dw $7B8B 

EnemyProjSpritemaps_GunshipLiftoffDustClouds_2B:
    dw $000C,$C3D0 
    db $F0 
    dw $7BA9,$C3E0 
    db $F0 
    dw $7BA7,$C3D0 
    db $E0 
    dw $7B89,$C3E0 
    db $E0 
    dw $7B87,$C3F0 
    db $E8 
    dw $7BAD,$C200 
    db $E8 
    dw $7BAB,$C3F0 
    db $D8 
    dw $7B8D,$C200 
    db $D8 
    dw $7B8B,$C3E0 
    db $F8 
    dw $7BE2,$C3F0 
    db $F8 
    dw $7BE0,$C3E0 
    db $E8 
    dw $7BC2,$C3F0 
    db $E8 
    dw $7BC0 

EnemyProjSpritemaps_GunshipLiftoffDustClouds_2C:
    dw $0008,$C3EC 
    db $E6 
    dw $7BE2,$C3FC 
    db $E6 
    dw $7BE0,$C3EC 
    db $D6 
    dw $7BC2,$C3FC 
    db $D6 
    dw $7BC0,$C3CC 
    db $EE 
    dw $7BAD,$C3DC 
    db $EE 
    dw $7BAB,$C3CC 
    db $DE 
    dw $7B8D,$C3DC 
    db $DE 
    dw $7B8B 

EnemyProjSpritemaps_GunshipLiftoffDustClouds_2D:
    dw $0004,$C3C8 
    db $EC 
    dw $7BE2,$C3D8 
    db $EC 
    dw $7BE0,$C3C8 
    db $DC 
    dw $7BC2,$C3D8 
    db $DC 
    dw $7BC0 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_Draygon_0_8D8967:
    dw $0001,$01FC 
    db $FC 
    dw $3100 

UNUSED_EnemyProjSpritemaps_Draygon_1_8D896E:
    dw $0001,$01FC 
    db $FC 
    dw $3101 

UNUSED_EnemyProjSpritemaps_Draygon_2_8D8975:
    dw $0001,$01FC 
    db $FC 
    dw $3102 

UNUSED_EnemyProjSpritemaps_0_8D897C:
    dw $0001,$01FC 
    db $FC 
    dw $3103 

UNUSED_EnemyProjSpritemaps_1_8D8983:
    dw $0001,$01FC 
    db $FC 
    dw $3104 

UNUSED_EnemyProjSpritemaps_2_8D898A:
    dw $0001,$01FC 
    db $FC 
    dw $3105 

UNUSED_EnemyProjSpritemaps_0_8D8991:
    dw $0001,$01FC 
    db $FC 
    dw $3106 

UNUSED_EnemyProjSpritemaps_1_8D8998:
    dw $0001,$01FC 
    db $FC 
    dw $3107 

UNUSED_EnemyProjSpritemaps_2_8D899F:
    dw $0001,$01FC 
    db $FC 
    dw $3108 

UNUSED_EnemyProjSpritemaps_0_8D89A6:
    dw $0001,$01FC 
    db $FC 
    dw $B103 

UNUSED_EnemyProjSpritemaps_1_8D89AD:
    dw $0001,$01FC 
    db $FC 
    dw $B104 

UNUSED_EnemyProjSpritemaps_2_8D89B4:
    dw $0001,$01FC 
    db $FC 
    dw $B105 

UNUSED_EnemyProjSpritemaps_0_8D89BB:
    dw $0001,$01FC 
    db $FC 
    dw $B100 

UNUSED_EnemyProjSpritemaps_1_8D89C2:
    dw $0001,$01FC 
    db $FC 
    dw $B101 

UNUSED_EnemyProjSpritemaps_2_8D89C9:
    dw $0001,$01FC 
    db $FC 
    dw $B102 

UNUSED_EnemyProjSpritemaps_0_8D89D0:
    dw $0001,$01FC 
    db $FC 
    dw $F103 

UNUSED_EnemyProjSpritemaps_1_8D89D7:
    dw $0001,$01FC 
    db $FC 
    dw $F104 

UNUSED_EnemyProjSpritemaps_2_8D89DE:
    dw $0001,$01FC 
    db $FC 
    dw $F105 

UNUSED_EnemyProjSpritemaps_0_8D89E5:
    dw $0001,$01FC 
    db $FC 
    dw $7106 

UNUSED_EnemyProjSpritemaps_1_8D89EC:
    dw $0001,$01FC 
    db $FC 
    dw $7107 

UNUSED_EnemyProjSpritemaps_2_8D89F3:
    dw $0001,$01FC 
    db $FC 
    dw $7108 

UNUSED_EnemyProjSpritemaps_0_8D89FA:
    dw $0001,$01FC 
    db $FC 
    dw $7103 

UNUSED_EnemyProjSpritemaps_1_8D8A01:
    dw $0001,$01FC 
    db $FC 
    dw $7104 

UNUSED_EnemyProjSpritemaps_2_8D8A08:
    dw $0001,$01FC 
    db $FC 
    dw $7105 

UNUSED_EnemyProjSpritemaps_Draygon_8D8A0F:
    dw $0001,$81F8 
    db $F8 
    dw $2164 
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_DraygonGoop_0:
    dw $0001,$81F8 
    db $F8 
    dw $116A 

EnemyProjSpritemaps_DraygonGoop_1:
    dw $0001,$81F8 
    db $F8 
    dw $115E 

EnemyProjSpritemaps_DraygonGoop_2:
    dw $0001,$81F8 
    db $F8 
    dw $115C 

EnemyProjSpritemaps_DraygonGoop_3:
    dw $0001,$81F8 
    db $F8 
    dw $114A 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_Draygon_0_8D8A32:
    dw $0001,$01FC 
    db $FC 
    dw $217E 

UNUSED_EnemyProjSpritemaps_Draygon_1_8D8A39:
    dw $0001,$01FC 
    db $FC 
    dw $217D 

UNUSED_EnemyProjSpritemaps_Draygon_2_8D8A40:
    dw $0001,$01FC 
    db $FC 
    dw $217C 

UNUSED_EnemyProjSpritemaps_Draygon_3_8D8A47:
    dw $0001,$81F8 
    db $F8 
    dw $218A 

UNUSED_EnemyProjSpritemaps_Draygon_4_8D8A4E:
    dw $0001,$01FC 
    db $FC 
    dw $217F 

UNUSED_EnemyProjSpritemaps_Draygon_5_8D8A55:
    dw $0001,$01FC 
    db $FC 
    dw $2177 

UNUSED_EnemyProjSpritemaps_Draygon_6_8D8A5C:
    dw $0001,$01FC 
    db $FC 
    dw $2176 

UNUSED_EnemyProjSpritemaps_0_8D8A63:
    dw $0001,$81F8 
    db $F8 
    dw $218C 

UNUSED_EnemyProjSpritemaps_1_8D8A6A:
    dw $0001,$81F8 
    db $F8 
    dw $218E 
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_DraygonsWallTurretProjectile_0:
    dw $0001,$01FC 
    db $FC 
    dw $3B7E 

EnemyProjSpritemaps_DraygonsWallTurretProjectile_1:
    dw $0001,$01FC 
    db $FC 
    dw $3B7D 

EnemyProjSpritemaps_DraygonsWallTurretProjectile_2:
    dw $0001,$01FC 
    db $FC 
    dw $3B7C 

EnemyProjSpritemaps_DraygonsWallTurretProjectile_3:
    dw $0001,$81F8 
    db $F8 
    dw $3B8A 

EnemyProjSpritemaps_DraygonGoop_4:
    dw $0001,$81F8 
    db $F8 
    dw $338C 

EnemyProjSpritemaps_DraygonGoop_5:
    dw $0004,$0002 
    db $02 
    dw $339F,$01F6 
    db $02 
    dw $339E,$0002 
    db $F6 
    dw $338F,$01F6 
    db $F6 
    dw $338E 

EnemyProjSpritemaps_DraygonsWallTurretProjectile_4:
    dw $0001,$81F8 
    db $F8 
    dw $3BCA 

EnemyProjSpritemaps_DraygonsWallTurretProjectile_5:
    dw $0001,$81F8 
    db $F8 
    dw $3BCC 

EnemyProjSpritemaps_DraygonsWallTurretProjectile_6:
    dw $0001,$81F8 
    db $F8 
    dw $3BCE 

EnemyProjSpritemaps_CeresFallingTile_Light:
    dw $0001,$C3F8 
    db $F8 
    dw $20EA 

EnemyProjSpritemaps_CeresFallingTile_Dark:
    dw $0001,$C3F8 
    db $F8 
    dw $20EC 

EnemyProjSpritemaps_PirateClaw_0:
    dw $0003,$0004 
    db $FC 
    dw $314C,$01FC 
    db $FC 
    dw $314B,$01F4 
    db $FC 
    dw $314A 

EnemyProjSpritemaps_PirateClaw_1:
    dw $0002,$81FC 
    db $F8 
    dw $3128,$81F4 
    db $F8 
    dw $3127 

EnemyProjSpritemaps_PirateClaw_2:
    dw $0003,$01FC 
    db $F4 
    dw $F14D,$01FC 
    db $FC 
    dw $F13D,$01FC 
    db $04 
    dw $F12D 

EnemyProjSpritemaps_PirateClaw_3:
    dw $0002,$81F4 
    db $F8 
    dw $F12B,$81FC 
    db $F8 
    dw $F12A 

EnemyProjSpritemaps_PirateClaw_4:
    dw $0003,$01F4 
    db $FC 
    dw $F14C,$01FC 
    db $FC 
    dw $F14B,$0004 
    db $FC 
    dw $F14A 

EnemyProjSpritemaps_PirateClaw_5:
    dw $0002,$81F4 
    db $F8 
    dw $F128,$81FC 
    db $F8 
    dw $F127 

EnemyProjSpritemaps_PirateClaw_6:
    dw $0003,$01FC 
    db $04 
    dw $314D,$01FC 
    db $FC 
    dw $313D,$01FC 
    db $F4 
    dw $312D 

EnemyProjSpritemaps_PirateClaw_7:
    dw $0002,$81FC 
    db $F8 
    dw $312B,$81F4 
    db $F8 
    dw $312A 

EnemyProjSpritemaps_PirateClaw_8:
    dw $0003,$01F4 
    db $FC 
    dw $714C,$01FC 
    db $FC 
    dw $714B,$0004 
    db $FC 
    dw $714A 

EnemyProjSpritemaps_PirateClaw_9:
    dw $0002,$81F4 
    db $F8 
    dw $7128,$81FC 
    db $F8 
    dw $7127 

EnemyProjSpritemaps_PirateClaw_A:
    dw $0003,$01FC 
    db $F4 
    dw $B14D,$01FC 
    db $FC 
    dw $B13D,$01FC 
    db $04 
    dw $B12D 

EnemyProjSpritemaps_PirateClaw_B:
    dw $0002,$81FC 
    db $F8 
    dw $B12B,$81F4 
    db $F8 
    dw $B12A 

EnemyProjSpritemaps_PirateClaw_C:
    dw $0003,$0004 
    db $FC 
    dw $B14C,$01FC 
    db $FC 
    dw $B14B,$01F4 
    db $FC 
    dw $B14A 

EnemyProjSpritemaps_PirateClaw_D:
    dw $0002,$81FC 
    db $F8 
    dw $B128,$81F4 
    db $F8 
    dw $B127 

EnemyProjSpritemaps_PirateClaw_E:
    dw $0003,$01FC 
    db $04 
    dw $714D,$01FC 
    db $FC 
    dw $713D,$01FC 
    db $F4 
    dw $712D 

EnemyProjSpritemaps_PirateClaw_F:
    dw $0002,$81F4 
    db $F8 
    dw $712B,$81FC 
    db $F8 
    dw $712A 

EnemyProjSpritemaps_Pirate_MotherBrain_Laser_0:
    dw $0001,$01FC 
    db $FC 
    dw $3A6F 

EnemyProjSpritemaps_Pirate_MotherBrain_Laser_1:
    dw $0001,$01FC 
    db $FC 
    dw $3A6B 

EnemyProjSpritemaps_Pirate_MotherBrain_Laser_2:
    dw $0002,$0000 
    db $FC 
    dw $7A6F,$01F8 
    db $FC 
    dw $3A6F 

EnemyProjSpritemaps_Pirate_MotherBrain_Laser_3:
    dw $0002,$0000 
    db $FC 
    dw $7A6B,$01F8 
    db $FC 
    dw $3A6B 

EnemyProjSpritemaps_Pirate_MotherBrain_Laser_4:
    dw $0003,$0004 
    db $FC 
    dw $7ACD,$01FC 
    db $FC 
    dw $7A6F,$01F4 
    db $FC 
    dw $3A6F 

EnemyProjSpritemaps_Pirate_MotherBrain_Laser_5:
    dw $0003,$0004 
    db $FC 
    dw $7A6B,$01FC 
    db $FC 
    dw $3A6B,$01F4 
    db $FC 
    dw $3A6B 

EnemyProjSpritemaps_Pirate_MotherBrain_Laser_6:
    dw $0004,$0008 
    db $FC 
    dw $7ACD,$01F0 
    db $FC 
    dw $3ACD,$0000 
    db $FC 
    dw $7A6F,$01F8 
    db $FC 
    dw $3A6F 

EnemyProjSpritemaps_Pirate_MotherBrain_Laser_7:
    dw $0004,$0008 
    db $FC 
    dw $FA6B,$0000 
    db $FC 
    dw $FA6B,$01F8 
    db $FC 
    dw $BA6B,$01F0 
    db $FC 
    dw $BA6B 

EnemyProjSpritemaps_Pirate_MotherBrain_Laser_8:
    dw $0001,$01FC 
    db $FC 
    dw $3A53 

EnemyProjSpritemaps_Pirate_MotherBrain_Laser_9:
    dw $0001,$01FC 
    db $FC 
    dw $3A51 

EnemyProjSpritemaps_Pirate_MotherBrain_Laser_A:
    dw $0004,$0000 
    db $00 
    dw $FA60,$0000 
    db $F8 
    dw $7A60,$01F8 
    db $00 
    dw $BA60,$01F8 
    db $F8 
    dw $3A60 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_QuestionMark_8D8C4D:
    dw $0001,$C3F8 
    db $F8 
    dw $2AE0 
endif ; !FEATURE_KEEP_UNREFERENCED

UNUSED_EnemyProjSpritemaps_BombTorizoLowHealthDrool_0_8D8C54:
    dw $0001,$01FC 
    db $FC 
    dw $6B70 

UNUSED_EnemyProjSpritemaps_BombTorizoLowHealthDrool_1_8D8C5B:
    dw $0001,$01FC 
    db $FC 
    dw $6B63 

UNUSED_EnemyProjSpritemaps_BombTorizoLowHealthDrool_2_8D8C62:
    dw $0001,$01FC 
    db $FC 
    dw $6B67 

UNUSED_EnemyProjSpritemaps_BombTorizoLowHealthDrool_3_8D8C69:
    dw $0001,$01FC 
    db $FC 
    dw $6B6A 

EnemyProjSpritemaps_TorizoChozoOrbs_0:
    dw $0001,$C3F8 
    db $F8 
    dw $672C 

EnemyProjSpritemaps_TorizoChozoOrbs_1:
    dw $0001,$C3F8 
    db $F8 
    dw $272C 

EnemyProjSpritemaps_TorizoChozoOrbs_GoldenTorizoEyeBeam_0:
    dw $0001,$C3F8 
    db $F8 
    dw $6B2E 

EnemyProjSpritemaps_TorizoChozoOrbs_GoldenTorizoEyeBeam_1:
    dw $0002,$01F8 
    db $00 
    dw $2B80,$0000 
    db $00 
    dw $6B80 

EnemyProjSpritemaps_TorizoChozoOrbs_GoldenTorizoEyeBeam_2:
    dw $0004,$01F8 
    db $00 
    dw $2B90,$01F8 
    db $F8 
    dw $2B80,$0000 
    db $00 
    dw $6B90,$0000 
    db $F8 
    dw $6B80 

EnemyProjSpritemaps_TorizoChozoOrbs_GoldenTorizoEyeBeam_3:
    dw $0003,$C3F8 
    db $F0 
    dw $6B80,$01F8 
    db $00 
    dw $2B99,$0000 
    db $00 
    dw $6B99 

EnemyProjSpritemaps_TorizoChozoOrbs_GoldenTorizoEyeBeam_4:
    dw $0003,$0000 
    db $00 
    dw $6B80,$01F8 
    db $00 
    dw $2B80,$C3F8 
    db $EC 
    dw $2B2E 

EnemyProjSpritemaps_TorizoChozoOrbs_GoldenTorizoEyeBeam_5:
    dw $0006,$01F8 
    db $00 
    dw $EB52,$0000 
    db $00 
    dw $AB52,$01F8 
    db $F0 
    dw $2B92,$01F8 
    db $E8 
    dw $2B82,$0000 
    db $F0 
    dw $6B92,$0000 
    db $E8 
    dw $6B82 

EnemyProjSpritemaps_TorizoSonicBoom_0:
    dw $0004,$0000 
    db $00 
    dw $AB5E,$01F8 
    db $00 
    dw $AB5D,$0000 
    db $F8 
    dw $2B5E,$01F8 
    db $F8 
    dw $2B5D 

EnemyProjSpritemaps_TorizoSonicBoom_1:
    dw $0006,$01F8 
    db $00 
    dw $ABBE,$0000 
    db $08 
    dw $ABBD,$01F8 
    db $08 
    dw $ABBC,$01F8 
    db $F8 
    dw $2BBE,$0000 
    db $F0 
    dw $2BBD,$01F8 
    db $F0 
    dw $2BBC 

EnemyProjSpritemaps_TorizoSonicBoom_2:
    dw $0006,$01FC 
    db $00 
    dw $ABBF,$01FC 
    db $08 
    dw $AB65,$01FC 
    db $10 
    dw $AB49,$01FC 
    db $F8 
    dw $2BBF,$01FC 
    db $F0 
    dw $2B65,$01FC 
    db $E8 
    dw $2B49 

EnemyProjSpritemaps_TorizoSonicBoom_3:
    dw $0004,$01F8 
    db $00 
    dw $EB5E,$0000 
    db $00 
    dw $EB5D,$01F8 
    db $F8 
    dw $6B5E,$0000 
    db $F8 
    dw $6B5D 

EnemyProjSpritemaps_TorizoSonicBoom_4:
    dw $0006,$0000 
    db $00 
    dw $EBBE,$01F8 
    db $08 
    dw $EBBD,$0000 
    db $08 
    dw $EBBC,$0000 
    db $F8 
    dw $6BBE,$01F8 
    db $F0 
    dw $6BBD,$0000 
    db $F0 
    dw $6BBC 

EnemyProjSpritemaps_TorizoSonicBoom_5:
    dw $0006,$01FC 
    db $00 
    dw $EBBF,$01FC 
    db $08 
    dw $EB65,$01FC 
    db $10 
    dw $EB49,$01FC 
    db $F8 
    dw $6BBF,$01FC 
    db $F0 
    dw $6B65,$01FC 
    db $E8 
    dw $6B49 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_8D8D95:
    dw $0001,$01FC 
    db $FC 
    dw $2A5E 
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_Common_0:
    dw $0001,$01FC 
    db $FC 
    dw $2A5F 

EnemyProjSpritemaps_Common_1:
    dw $0004,$0000 
    db $00 
    dw $EA60,$0000 
    db $F8 
    dw $6A60,$01F8 
    db $00 
    dw $AA60,$01F8 
    db $F8 
    dw $2A60 

EnemyProjSpritemaps_Common_2:
    dw $0004,$0000 
    db $00 
    dw $EA61,$0000 
    db $F8 
    dw $6A61,$01F8 
    db $00 
    dw $AA61,$01F8 
    db $F8 
    dw $2A61 

EnemyProjSpritemaps_Common_3:
    dw $0004,$0000 
    db $00 
    dw $EA62,$0000 
    db $F8 
    dw $6A62,$01F8 
    db $00 
    dw $AA62,$01F8 
    db $F8 
    dw $2A62 

EnemyProjSpritemaps_Common_4:
    dw $0004,$0000 
    db $00 
    dw $EA63,$0000 
    db $F8 
    dw $6A63,$01F8 
    db $00 
    dw $AA63,$01F8 
    db $F8 
    dw $2A63 

EnemyProjSpritemaps_BombTorizoChozoBreaking_0:
    dw $0001,$C3F8 
    db $F8 
    dw $2EE0 

EnemyProjSpritemaps_BombTorizoChozoBreaking_1:
    dw $0001,$C3F8 
    db $F8 
    dw $2EE2 

EnemyProjSpritemaps_BombTorizoChozoBreaking_2:
    dw $0001,$C3F8 
    db $F8 
    dw $2EE4 

EnemyProjSpritemaps_BombTorizoChozoBreaking_3:
    dw $0001,$C3F8 
    db $F8 
    dw $2EE6 

EnemyProjSpritemaps_BombTorizoChozoBreaking_4:
    dw $0001,$C3F8 
    db $F8 
    dw $2EE8 

EnemyProjSpritemaps_BombTorizoChozoBreaking_5:
    dw $0001,$C3F8 
    db $F8 
    dw $2EEA 

EnemyProjSpritemaps_BombTorizoChozoBreaking_6:
    dw $0001,$C3F8 
    db $F8 
    dw $2EEC 

EnemyProjSpritemaps_BombTorizoChozoBreaking_7:
    dw $0001,$C3F8 
    db $F8 
    dw $2EEE 

EnemyProjSpritemaps_BombTorizoChozoBreaking_8:
    dw $0001,$C3F8 
    db $F8 
    dw $6EE0 

EnemyProjSpritemaps_BombTorizoChozoBreaking_9:
    dw $0001,$C3F8 
    db $F8 
    dw $6EE2 

EnemyProjSpritemaps_BombTorizoChozoBreaking_A:
    dw $0001,$C3F8 
    db $F8 
    dw $6EE4 

EnemyProjSpritemaps_BombTorizoChozoBreaking_B:
    dw $0001,$C3F8 
    db $F8 
    dw $6EE6 

EnemyProjSpritemaps_BombTorizoChozoBreaking_C:
    dw $0001,$C3F8 
    db $F8 
    dw $6EE8 

EnemyProjSpritemaps_BombTorizoChozoBreaking_D:
    dw $0001,$C3F8 
    db $F8 
    dw $6EEA 

EnemyProjSpritemaps_BombTorizoChozoBreaking_E:
    dw $0001,$C3F8 
    db $F8 
    dw $6EEC 

EnemyProjSpritemaps_BombTorizoChozoBreaking_F:
    dw $0001,$C3F8 
    db $F8 
    dw $6EEE 

EnemyProjSpritemaps_GoldenTorizoSuperMissile_0:
    dw $0002,$0000 
    db $FC 
    dw $2A65,$01F8 
    db $FC 
    dw $2A64 

EnemyProjSpritemaps_GoldenTorizoSuperMissile_1:
    dw $0003,$0003 
    db $FF 
    dw $2A68,$01FB 
    db $FF 
    dw $2A67,$01FB 
    db $F7 
    dw $2A66 

EnemyProjSpritemaps_GoldenTorizoSuperMissile_2:
    dw $0002,$01FC 
    db $00 
    dw $2A6A,$01FC 
    db $F8 
    dw $2A69 

EnemyProjSpritemaps_GoldenTorizoSuperMissile_3:
    dw $0003,$01F5 
    db $FF 
    dw $6A68,$01FD 
    db $FF 
    dw $6A67,$01FD 
    db $F7 
    dw $6A66 

EnemyProjSpritemaps_GoldenTorizoSuperMissile_4:
    dw $0002,$01F8 
    db $FC 
    dw $6A65,$0000 
    db $FC 
    dw $6A64 

EnemyProjSpritemaps_GoldenTorizoSuperMissile_5:
    dw $0003,$01F5 
    db $F9 
    dw $EA68,$01FD 
    db $F9 
    dw $EA67,$01FD 
    db $01 
    dw $EA66 

EnemyProjSpritemaps_GoldenTorizoSuperMissile_6:
    dw $0002,$01FC 
    db $F8 
    dw $AA6A,$01FC 
    db $00 
    dw $AA69 

EnemyProjSpritemaps_GoldenTorizoSuperMissile_7:
    dw $0003,$0003 
    db $F9 
    dw $AA68,$01FB 
    db $F9 
    dw $AA67,$01FB 
    db $01 
    dw $AA66 

EnemyProjSpritemaps_TorizoLandingDustCloud_Right_0:
    dw $0001,$01FC 
    db $FC 
    dw $2A48 

EnemyProjSpritemaps_TorizoLandingDustCloud_Right_1:
    dw $0001,$01FC 
    db $FC 
    dw $2A49 

EnemyProjSpritemaps_TorizoLandingDustCloud_Right_2:
    dw $0001,$01FC 
    db $FC 
    dw $2A4A 

EnemyProjSpritemaps_TorizoLandingDustCloud_Right_3:
    dw $0001,$01FC 
    db $FC 
    dw $2A4B 

EnemyProjSpritemaps_TorizoLandingDustCloud_Left_0:
    dw $0001,$01FC 
    db $FC 
    dw $6A48 

EnemyProjSpritemaps_TorizoLandingDustCloud_Left_1:
    dw $0001,$01FC 
    db $FC 
    dw $6A49 

EnemyProjSpritemaps_TorizoLandingDustCloud_Left_2:
    dw $0001,$01FC 
    db $FC 
    dw $6A4A 

EnemyProjSpritemaps_TorizoLandingDustCloud_Left_3:
    dw $0001,$01FC 
    db $FC 
    dw $6A4B 

EnemyProjSpritemaps_GoldenTorizoEgg_0:
    dw $0001,$C3F8 
    db $F8 
    dw $2B04 

EnemyProjSpritemaps_GoldenTorizoEgg_1:
    dw $0001,$C3F8 
    db $F8 
    dw $2B8C 

EnemyProjSpritemaps_GoldenTorizoEgg_2:
    dw $0001,$C3F8 
    db $F8 
    dw $2BCC 

EnemyProjSpritemaps_GoldenTorizoEgg_3:
    dw $0001,$C3F8 
    db $F8 
    dw $2AD0 

EnemyProjSpritemaps_GoldenTorizoEgg_4:
    dw $0001,$C3F8 
    db $F6 
    dw $22D2 

EnemyProjSpritemaps_GoldenTorizoEgg_5:
    dw $0001,$C3F8 
    db $F6 
    dw $22D4 

EnemyProjSpritemaps_GoldenTorizoEgg_6:
    dw $0001,$C3F8 
    db $F6 
    dw $22D6 

EnemyProjSpritemaps_GoldenTorizoEgg_7:
    dw $0001,$C3F8 
    db $F6 
    dw $22D8 

EnemyProjSpritemaps_GoldenTorizoEgg_8:
    dw $0001,$C3F8 
    db $F6 
    dw $22DA 

EnemyProjSpritemaps_GoldenTorizoEgg_9:
    dw $0001,$C3F8 
    db $F6 
    dw $22DC 

EnemyProjSpritemaps_GoldenTorizoEgg_A:
    dw $0002,$0000 
    db $FE 
    dw $22EF,$01F8 
    db $FE 
    dw $22EE 

EnemyProjSpritemaps_GoldenTorizoEgg_B:
    dw $0002,$0000 
    db $FE 
    dw $22DF,$01F8 
    db $FE 
    dw $22DE 

EnemyProjSpritemaps_GoldenTorizoEgg_C:
    dw $0001,$C3F8 
    db $F8 
    dw $6B04 

EnemyProjSpritemaps_GoldenTorizoEgg_D:
    dw $0001,$C3F8 
    db $F8 
    dw $6B8C 

EnemyProjSpritemaps_GoldenTorizoEgg_E:
    dw $0001,$C3F8 
    db $F8 
    dw $6BCC 

EnemyProjSpritemaps_GoldenTorizoEgg_F:
    dw $0001,$C3F8 
    db $F8 
    dw $6AD0 

EnemyProjSpritemaps_GoldenTorizoEgg_10:
    dw $0001,$C3F8 
    db $F6 
    dw $62D2 

EnemyProjSpritemaps_GoldenTorizoEgg_11:
    dw $0001,$C3F8 
    db $F6 
    dw $62D4 

EnemyProjSpritemaps_GoldenTorizoEgg_12:
    dw $0001,$C3F8 
    db $F6 
    dw $62D6 

EnemyProjSpritemaps_GoldenTorizoEgg_13:
    dw $0001,$C3F8 
    db $F6 
    dw $62D8 

EnemyProjSpritemaps_GoldenTorizoEgg_14:
    dw $0001,$C3F8 
    db $F6 
    dw $62DA 

EnemyProjSpritemaps_GoldenTorizoEgg_15:
    dw $0001,$C3F8 
    db $F6 
    dw $62DC 

EnemyProjSpritemaps_GoldenTorizoEgg_16:
    dw $0002,$0000 
    db $FE 
    dw $62EF,$01F8 
    db $FE 
    dw $62EE 

EnemyProjSpritemaps_GoldenTorizoEgg_17:
    dw $0002,$0000 
    db $FE 
    dw $62DF,$01F8 
    db $FE 
    dw $62DE 

EnemyProjSpritemaps_DragonFireball_0:
    dw $0001,$01FC 
    db $FC 
    dw $2122 

EnemyProjSpritemaps_DragonFireball_1:
    dw $0001,$01FC 
    db $FC 
    dw $2123 

EnemyProjSpritemaps_DragonFireball_2:
    dw $0001,$01FC 
    db $FC 
    dw $A122 

EnemyProjSpritemaps_DragonFireball_3:
    dw $0001,$01FC 
    db $FC 
    dw $A123 

EnemyProjSpritemaps_DragonFireball_4:
    dw $0001,$01FC 
    db $FC 
    dw $6122 

EnemyProjSpritemaps_DragonFireball_5:
    dw $0001,$01FC 
    db $FC 
    dw $6123 

EnemyProjSpritemaps_DragonFireball_6:
    dw $0001,$01FC 
    db $FC 
    dw $E122 

EnemyProjSpritemaps_DragonFireball_7:
    dw $0001,$01FC 
    db $FC 
    dw $E123 

EnemyProjSpritemaps_EyeDoorProjectile_4:
    dw $0004,$01F8 
    db $F8 
    dw $2C63,$0000 
    db $F8 
    dw $6C63,$01F8 
    db $00 
    dw $AC63,$0000 
    db $00 
    dw $EC63 

EnemyProjSpritemaps_EyeDoorProjectile_5:
    dw $0004,$01F8 
    db $F8 
    dw $2C62,$0000 
    db $F8 
    dw $6C62,$01F8 
    db $00 
    dw $AC62,$0000 
    db $00 
    dw $EC62 

EnemyProjSpritemaps_EyeDoorProjectile_6:
    dw $0004,$01F8 
    db $F8 
    dw $2C61,$0000 
    db $F8 
    dw $6C61,$01F8 
    db $00 
    dw $AC61,$0000 
    db $00 
    dw $EC61 

EnemyProjSpritemaps_EyeDoorProjectile_7:
    dw $0004,$01F8 
    db $F8 
    dw $2C60,$0000 
    db $F8 
    dw $6C60,$01F8 
    db $00 
    dw $AC60,$0000 
    db $00 
    dw $EC60 

EnemyProjSpritemaps_EyeDoorSweat_0:
    dw $0001,$01FC 
    db $FC 
    dw $2A43 

EnemyProjSpritemaps_EyeDoorSweat_1:
    dw $0001,$01FC 
    db $FC 
    dw $2A2C 

EnemyProjSpritemaps_EyeDoorSweat_2:
    dw $0001,$01FC 
    db $FC 
    dw $2A2D 

EnemyProjSpritemaps_EyeDoorSweat_3:
    dw $0001,$01FC 
    db $FC 
    dw $2A2E 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_8D907F:
    dw $0001,$01FC 
    db $FC 
    dw $2A2F 
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_TourianStatueUnlockParticleWaterSplash_0:
    dw $0001,$01FC 
    db $FC 
    dw $7E2C 

EnemyProjSpritemaps_TourianStatueUnlockParticleWaterSplash_1:
    dw $0001,$01FC 
    db $FC 
    dw $7E2D 

EnemyProjSpritemaps_TourianStatueUnlockParticleWaterSplash_2:
    dw $0001,$01FC 
    db $FC 
    dw $7E2E 

EnemyProjSpritemaps_TourianStatueUnlockParticleWaterSplash_3:
    dw $0001,$01FC 
    db $FC 
    dw $7E2F 

EnemyProjSpritemaps_TourianStatueUnlockingParticleTail_0:
    dw $0001,$01FC 
    db $FC 
    dw $3EDA 

EnemyProjSpritemaps_TourianStatueUnlockingParticleTail_1:
    dw $0001,$01FC 
    db $FC 
    dw $3EDB 

EnemyProjSpritemaps_TourianStatueUnlockingParticleTail_2:
    dw $0001,$01FC 
    db $FC 
    dw $3EDC 

EnemyProjSpritemaps_TourianStatueUnlockingParticleTail_3:
    dw $0001,$01FC 
    db $FC 
    dw $3EDD 

EnemyProjSpritemaps_TourianStatueEyeGlow_0:
    dw $0001,$01FC 
    db $FC 
    dw $3ED0 

EnemyProjSpritemaps_TourianStatueEyeGlow_1:
    dw $0001,$01FC 
    db $FC 
    dw $3ED1 

EnemyProjSpritemaps_TourianStatueEyeGlow_2:
    dw $0001,$01FC 
    db $FC 
    dw $3ED2 

EnemyProjSpritemaps_TourianStatueEyeGlow_3:
    dw $0001,$C3F8 
    db $F8 
    dw $3EE2 

EnemyProjSpritemaps_TourianStatueEyeGlow_4:
    dw $0001,$C3F8 
    db $F8 
    dw $3EE4 

EnemyProjSpritemaps_TourianStatueEyeGlow_5:
    dw $0001,$C3F8 
    db $F8 
    dw $3EE6 

EnemyProjSpritemaps_TourianStatueEyeGlow_6:
    dw $0001,$C3F8 
    db $F8 
    dw $3EE8 

EnemyProjSpritemaps_TourianStatueEyeGlow_7:
    dw $0006,$0003 
    db $04 
    dw $FEEA,$0003 
    db $FC 
    dw $7EFA,$0003 
    db $F4 
    dw $7EEA,$01FC 
    db $04 
    dw $BEEB,$01F4 
    db $04 
    dw $BEEA,$C3F4 
    db $F4 
    dw $3EEA 

EnemyProjSpritemaps_TourianStatueEyeGlow_8:
    dw $0004,$C200 
    db $00 
    dw $7EEE,$C3F0 
    db $00 
    dw $3EEE,$C200 
    db $F0 
    dw $7EEC,$C3F0 
    db $F0 
    dw $3EEC 

EnemyProjSpritemaps_TourianStatueUnlockingParticle_0:
    dw $0001,$01FC 
    db $FC 
    dw $3ED3 

EnemyProjSpritemaps_TourianStatueUnlockingParticle_1:
    dw $0001,$01FC 
    db $FC 
    dw $7ED3 

EnemyProjSpritemaps_TourianStatueUnlockingParticle_2:
    dw $0001,$01FC 
    db $FC 
    dw $BED3 

EnemyProjSpritemaps_TourianStatueUnlockingParticle_3:
    dw $0001,$01FC 
    db $FC 
    dw $FED3 

EnemyProjSpritemaps_TourianStatuesSoul_0:
    dw $0004,$0000 
    db $00 
    dw $3ED6,$01F8 
    db $00 
    dw $3ED5,$01FC 
    db $08 
    dw $3ED4,$C3F8 
    db $F8 
    dw $3EE0 

EnemyProjSpritemaps_TourianStatuesSoul_1:
    dw $0004,$01FC 
    db $08 
    dw $3ED9,$0000 
    db $00 
    dw $3ED8,$01F8 
    db $00 
    dw $3ED7,$C3F8 
    db $F8 
    dw $3EE0 

EnemyProjSpritemaps_TourianStatueBaseDecoration:
    dw $0007,$C228 
    db $F8 
    dw $1F9C,$C218 
    db $F8 
    dw $1F9A,$C208 
    db $F8 
    dw $1F98,$C3F8 
    db $F8 
    dw $1F96,$C3E8 
    db $F8 
    dw $1F94,$C3D8 
    db $F8 
    dw $1F92,$C3C8 
    db $F8 
    dw $1F90 

EnemyProjSpritemaps_TourianStatueRidley:
    dw $0017,$C3E5 
    db $18 
    dw $2344,$C3E5 
    db $08 
    dw $232C,$C3F5 
    db $18 
    dw $2346,$000D 
    db $20 
    dw $237D,$000D 
    db $18 
    dw $236D,$0005 
    db $18 
    dw $2348,$C215 
    db $08 
    dw $2342,$C205 
    db $08 
    dw $2340,$C3F5 
    db $08 
    dw $232E,$C3D5 
    db $08 
    dw $232A,$C215 
    db $F8 
    dw $2328,$C205 
    db $F8 
    dw $2326,$C3F5 
    db $F8 
    dw $2324,$C3E5 
    db $F8 
    dw $2322,$C3D5 
    db $F8 
    dw $2320,$C215 
    db $E8 
    dw $230E,$C205 
    db $E8 
    dw $230C,$C3F5 
    db $E8 
    dw $230A,$C3E5 
    db $E8 
    dw $2308,$C215 
    db $D8 
    dw $2306,$C205 
    db $D8 
    dw $2304,$C3F5 
    db $D8 
    dw $2302,$C3E5 
    db $D8 
    dw $2300 

EnemyProjSpritemaps_TourianStatuePhantoon:
    dw $0013,$0008 
    db $1C 
    dw $2587,$0000 
    db $1C 
    dw $2586,$01F8 
    db $1C 
    dw $2585,$01F0 
    db $1C 
    dw $2584,$0000 
    db $04 
    dw $2583,$0000 
    db $FC 
    dw $2581,$01F8 
    db $04 
    dw $2582,$01F8 
    db $FC 
    dw $2580,$C208 
    db $EC 
    dw $2561,$C3E8 
    db $EC 
    dw $254D,$C208 
    db $FC 
    dw $2565,$C208 
    db $0C 
    dw $256B,$C3F8 
    db $0C 
    dw $2569,$C3E8 
    db $0C 
    dw $2567,$C3E8 
    db $FC 
    dw $2563,$C200 
    db $EC 
    dw $2560,$C3F0 
    db $EC 
    dw $254E,$C200 
    db $DC 
    dw $254B,$C3F0 
    db $DC 
    dw $2549 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_0_8D9268:
    dw $0001,$81F9 
    db $F9 
    dw $230E 

UNUSED_EnemyProjSpritemaps_1_8D926F:
    dw $0001,$81FD 
    db $F5 
    dw $2320 

UNUSED_EnemyProjSpritemaps_2_8D9276:
    dw $0001,$8003 
    db $EE 
    dw $2304 

UNUSED_EnemyProjSpritemaps_3_8D927D:
    dw $0001,$8005 
    db $EC 
    dw $2308 

UNUSED_EnemyProjSpritemaps_4_8D9284:
    dw $0001,$8005 
    db $EC 
    dw $230C 

UNUSED_EnemyProjSpritemaps_5_8D928B:
    dw $0001,$8005 
    db $EC 
    dw $2326 

UNUSED_EnemyProjSpritemaps_6_8D9292:
    dw $0001,$8005 
    db $EC 
    dw $232E 

UNUSED_EnemyProjSpritemaps_7_8D9299:
    dw $0001,$81F8 
    db $F9 
    dw $630E 

UNUSED_EnemyProjSpritemaps_8_8D92A0:
    dw $0001,$81F4 
    db $F5 
    dw $6320 

UNUSED_EnemyProjSpritemaps_9_8D92A7:
    dw $0001,$81EE 
    db $EE 
    dw $6304 

UNUSED_EnemyProjSpritemaps_A_8D92AE:
    dw $0001,$81EC 
    db $EC 
    dw $6308 

UNUSED_EnemyProjSpritemaps_B_8D92B5:
    dw $0001,$81EC 
    db $EC 
    dw $630C 

UNUSED_EnemyProjSpritemaps_C_8D92BC:
    dw $0001,$81EC 
    db $EC 
    dw $6326 

UNUSED_EnemyProjSpritemaps_D_8D92C3:
    dw $0001,$81EB 
    db $EC 
    dw $232E 

UNUSED_EnemyProjSpritemaps_E_8D92CA:
    dw $0002,$01F1 
    db $F8 
    dw $6334,$0008 
    db $F8 
    dw $2334 

UNUSED_EnemyProjSpritemaps_F_8D92D6:
    dw $0002,$01F1 
    db $F8 
    dw $6324,$0008 
    db $F8 
    dw $2324 

UNUSED_EnemyProjSpritemaps_10_8D92E2:
    dw $0002,$81E9 
    db $F0 
    dw $6328,$8008 
    db $F0 
    dw $2328 

UNUSED_EnemyProjSpritemaps_11_8D92EE:
    dw $0002,$81E9 
    db $F0 
    dw $632C,$8008 
    db $F0 
    dw $232C 

UNUSED_EnemyProjSpritemaps_12_8D92FA:
    dw $0002,$81E8 
    db $F0 
    dw $632A,$8009 
    db $F0 
    dw $232A 
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_PuromiBody_0:
    dw $0001,$81F9 
    db $F8 
    dw $230A 

EnemyProjSpritemaps_PuromiBody_1:
    dw $0001,$81F9 
    db $F8 
    dw $2308 

EnemyProjSpritemaps_PuromiBody_2:
    dw $0001,$81F8 
    db $F8 
    dw $E30A 

EnemyProjSpritemaps_PuromiBody_3:
    dw $0001,$81F8 
    db $F8 
    dw $E308 

EnemyProjSpritemaps_PuromiBody_4:
    dw $0001,$81F9 
    db $F8 
    dw $2306 

EnemyProjSpritemaps_PuromiBody_5:
    dw $0001,$81F9 
    db $F8 
    dw $2322 

EnemyProjSpritemaps_PuromiBody_6:
    dw $0001,$81F8 
    db $F8 
    dw $E306 

EnemyProjSpritemaps_PuromiBody_7:
    dw $0001,$81F8 
    db $F8 
    dw $E322 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_8D933E:
    dw $0000 
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_LavaquakeRocks:
    dw $0001,$01FC 
    db $FC 
    dw $210A 

EnemyProjSpritemaps_ShaktoolsAttack:
    dw $0001,$01FC 
    db $FC 
    dw $2053 

EnemyProjSpritemaps_ShaktoolsAttack_FrontMiddleCircle:
    dw $0001,$01FC 
    db $FC 
    dw $2051 

EnemyProjSpritemaps_ShaktoolsAttack_FrontCircle:
    dw $0004,$0000 
    db $00 
    dw $E060,$0000 
    db $F8 
    dw $6060,$01F8 
    db $00 
    dw $A060,$01F8 
    db $F8 
    dw $2060 

EnemyProjSpritemaps_MotherBrainsTurrets_Left:
    dw $0001,$01EF 
    db $F3 
    dw $259A 

EnemyProjSpritemaps_MotherBrainsTurrets_DownLeft:
    dw $0001,$01F2 
    db $FD 
    dw $258B 

EnemyProjSpritemaps_MotherBrainsTurrets_Down:
    dw $0001,$01FC 
    db $FF 
    dw $259B 

EnemyProjSpritemaps_MotherBrainsTurrets_DownRight:
    dw $0001,$0006 
    db $FD 
    dw $658B 

EnemyProjSpritemaps_MotherBrainsTurrets_Right:
    dw $0001,$0009 
    db $F3 
    dw $659A 

EnemyProjSpritemaps_MotherBrainsTurrets_UpRight:
    dw $0001,$0006 
    db $EB 
    dw $E58B 

EnemyProjSpritemaps_MotherBrainsTurrets_Up:
    dw $0001,$01FC 
    db $E7 
    dw $A59B 

EnemyProjSpritemaps_MotherBrainsTurrets_UpLeft:
    dw $0001,$01F2 
    db $EB 
    dw $A58B 

EnemyProjSpritemaps_MotherBrainsTurretBullets_Left:
    dw $0001,$01FC 
    db $FC 
    dw $25A8 

EnemyProjSpritemaps_MotherBrainsTurretBullets_DownLeft:
    dw $0001,$01FC 
    db $FC 
    dw $25A6 

EnemyProjSpritemaps_MotherBrainsTurretBullets_Down:
    dw $0001,$01FC 
    db $FC 
    dw $25A7 

EnemyProjSpritemaps_MotherBrainsTurretBullets_DownRight:
    dw $0001,$01FC 
    db $FC 
    dw $65A6 

EnemyProjSpritemaps_MotherBrainsTurretBullets_Right:
    dw $0001,$01FC 
    db $FC 
    dw $65A8 

EnemyProjSpritemaps_MotherBrainsTurretBullets_UpRight:
    dw $0001,$01FC 
    db $FC 
    dw $E5A6 

EnemyProjSpritemaps_MotherBrainsTurretBullets_Up:
    dw $0001,$01FC 
    db $FC 
    dw $A5A7 

EnemyProjSpritemaps_MotherBrainsTurretBullets_UpLeft:
    dw $0001,$01FC 
    db $FC 
    dw $A5A6 

EnemyProjSpritemaps_MotherBrainsRainbowBeamCharging_0:
    dw $000B,$01FC 
    db $E5 
    dw $3AED,$000E 
    db $EF 
    dw $3AFC,$01EA 
    db $EF 
    dw $7AFC,$0025 
    db $F8 
    dw $3AEC,$001A 
    db $D6 
    dw $3AEC,$01DF 
    db $D6 
    dw $3AEC,$01D3 
    db $F8 
    dw $3AEC,$01ED 
    db $F8 
    dw $3AEB,$000C 
    db $F8 
    dw $3AEB,$0004 
    db $ED 
    dw $3AEB,$01F5 
    db $ED 
    dw $3AEB 

EnemyProjSpritemaps_MotherBrainsRainbowBeamCharging_1:
    dw $0007,$01FC 
    db $E1 
    dw $3AEE,$0011 
    db $ED 
    dw $3AFD,$01E7 
    db $ED 
    dw $7AFD,$01F0 
    db $E8 
    dw $7AFC,$01E8 
    db $F8 
    dw $7ADD,$0010 
    db $F8 
    dw $3ADD,$0008 
    db $E8 
    dw $3AFC 

EnemyProjSpritemaps_MotherBrainsRainbowBeamCharging_2:
    dw $0007,$01FC 
    db $DE 
    dw $3AEF,$0018 
    db $E8 
    dw $3AFE,$01E0 
    db $E8 
    dw $7AFE,$01E5 
    db $F8 
    dw $7ADE,$0014 
    db $F8 
    dw $3ADE,$000A 
    db $E6 
    dw $3AFD,$01EE 
    db $E6 
    dw $7AFD 

EnemyProjSpritemaps_MotherBrainsRainbowBeamCharging_3:
    dw $0007,$01FC 
    db $DA 
    dw $3AFF,$001D 
    db $E6 
    dw $3AFF,$01DC 
    db $E6 
    dw $7AFF,$01DE 
    db $F8 
    dw $7ADF,$001B 
    db $F8 
    dw $3ADF,$0010 
    db $E0 
    dw $3AFE,$01E8 
    db $E0 
    dw $7AFE 

EnemyProjSpritemaps_MotherBrainsRainbowBeamCharging_4:
    dw $000A,$000A 
    db $F3 
    dw $3AEA,$01FC 
    db $EC 
    dw $3AEA,$01FC 
    db $D4 
    dw $3AEC,$0020 
    db $E4 
    dw $3AEC,$01F0 
    db $F3 
    dw $3AEA,$01DA 
    db $E4 
    dw $3AEC,$01D8 
    db $F8 
    dw $7AFF,$0020 
    db $F8 
    dw $3AFF,$0014 
    db $DC 
    dw $3AFF,$01E4 
    db $DC 
    dw $7AFF 

EnemyProjSpritemaps_MotherBrainsRainbowBeamCharging_5:
    dw $000E,$01FC 
    db $EA 
    dw $3AEB,$0022 
    db $E3 
    dw $3AEC,$000A 
    db $F3 
    dw $3AEB,$01EF 
    db $F3 
    dw $3AEB,$01D8 
    db $E3 
    dw $3AEC,$01E1 
    db $D8 
    dw $3AEC,$01EC 
    db $F8 
    dw $3AEA,$01F4 
    db $EC 
    dw $3AEA,$0005 
    db $EC 
    dw $3AEA,$000C 
    db $F8 
    dw $3AEA,$0023 
    db $F8 
    dw $3AEC,$0018 
    db $D8 
    dw $3AEC,$01FC 
    db $D1 
    dw $3AEC,$01D5 
    db $F8 
    dw $3AEC 

EnemyProjSpritemaps_MotherBrainsDrool_0:
    dw $0001,$01FC 
    db $FA 
    dw $3AF0 

EnemyProjSpritemaps_MotherBrainsDrool_1:
    dw $0001,$01FC 
    db $FB 
    dw $3AF1 

EnemyProjSpritemaps_MotherBrainsDrool_2:
    dw $0001,$01FC 
    db $FC 
    dw $3AF2 

EnemyProjSpritemaps_MotherBrainsDrool_3:
    dw $0001,$01FC 
    db $FC 
    dw $3AF3 

EnemyProjSpritemaps_MotherBrainsDrool_4:
    dw $0001,$01FC 
    db $FC 
    dw $3AF4 

EnemyProjSpritemaps_MotherBrainsDrool_5:
    dw $0001,$01FC 
    db $FC 
    dw $3AF5 

EnemyProjSpritemaps_MotherBrainsDrool_6:
    dw $0001,$01FC 
    db $FC 
    dw $3AF6 

EnemyProjSpritemaps_MotherBrainsDrool_7:
    dw $0001,$01FC 
    db $FC 
    dw $3ADA 

EnemyProjSpritemaps_MotherBrainsDrool_8:
    dw $0002,$01FC 
    db $00 
    dw $3ADC,$01FC 
    db $FC 
    dw $3ADB 

EnemyProjSpritemaps_MotherBrainsDrool_9:
    dw $0002,$01FC 
    db $04 
    dw $3ADC,$01FC 
    db $FC 
    dw $3ADB 

EnemyProjSpritemaps_MotherBrainsPurpleBreath_Big_0:
    dw $0002,$01EE 
    db $F2 
    dw $3AF7,$C3F8 
    db $F8 
    dw $3AD0 

EnemyProjSpritemaps_MotherBrainsPurpleBreath_Big_1:
    dw $0004,$01EC 
    db $EE 
    dw $3AF7,$01EE 
    db $F1 
    dw $3AF8,$C200 
    db $00 
    dw $7AD0,$C3F8 
    db $F7 
    dw $3AD2 

EnemyProjSpritemaps_MotherBrainsPurpleBreath_Big_2:
    dw $0007,$01E8 
    db $E8 
    dw $3AF9,$01EE 
    db $EA 
    dw $3AF7,$01EC 
    db $ED 
    dw $3AF8,$01EE 
    db $F0 
    dw $3AF9,$C208 
    db $08 
    dw $FAD0,$C200 
    db $01 
    dw $3AD2,$C3F8 
    db $F6 
    dw $3AD4 

EnemyProjSpritemaps_MotherBrainsPurpleBreath_Big_3:
    dw $0008,$01E8 
    db $E6 
    dw $3AF7,$01EE 
    db $E9 
    dw $3AF8,$01EC 
    db $EC 
    dw $3AF9,$01EE 
    db $EF 
    dw $3AFA,$C210 
    db $0E 
    dw $7AD0,$C208 
    db $07 
    dw $3AD2,$C200 
    db $00 
    dw $3AD4,$C3F8 
    db $F4 
    dw $3AD6 

EnemyProjSpritemaps_MotherBrainsPurpleBreath_Big_4:
    dw $0007,$01E8 
    db $E5 
    dw $3AF8,$01EE 
    db $E8 
    dw $3AF9,$01EC 
    db $EB 
    dw $3AFA,$C213 
    db $0D 
    dw $3AD2,$C208 
    db $06 
    dw $3AD4,$C200 
    db $FE 
    dw $3AD6,$C3F8 
    db $F1 
    dw $3AD8 

EnemyProjSpritemaps_MotherBrainsPurpleBreath_Big_5:
    dw $0006,$01E8 
    db $E4 
    dw $3AF9,$01EF 
    db $E7 
    dw $3AFA,$01EC 
    db $EA 
    dw $3AFB,$C212 
    db $0C 
    dw $3AD4,$C208 
    db $02 
    dw $3AD6,$C200 
    db $FB 
    dw $3AD8 

EnemyProjSpritemaps_MotherBrainsPurpleBreath_Big_6:
    dw $0004,$01E8 
    db $E3 
    dw $3AFA,$01F0 
    db $E6 
    dw $3AFB,$C212 
    db $0A 
    dw $3AD6,$C208 
    db $FF 
    dw $3AD8 

EnemyProjSpritemaps_MotherBrainsPurpleBreath_Big_7:
    dw $0002,$01E8 
    db $E3 
    dw $3AFB,$C212 
    db $07 
    dw $3AD8 

EnemyProjSpritemaps_MotherBrainsPurpleBreath_Small_0:
    dw $0001,$01FC 
    db $F8 
    dw $3AF7 

EnemyProjSpritemaps_MotherBrainsPurpleBreath_Small_1:
    dw $0002,$01FA 
    db $F4 
    dw $3AF7,$01FC 
    db $F7 
    dw $3AF8 

EnemyProjSpritemaps_MotherBrainsPurpleBreath_Small_2:
    dw $0004,$01F6 
    db $EE 
    dw $3AF9,$01FC 
    db $F0 
    dw $3AF7,$01FA 
    db $F3 
    dw $3AF8,$01FC 
    db $F6 
    dw $3AF9 

EnemyProjSpritemaps_MotherBrainsPurpleBreath_Small_3:
    dw $0004,$01F6 
    db $EC 
    dw $3AF7,$01FC 
    db $EF 
    dw $3AF8,$01FA 
    db $F2 
    dw $3AF9,$01FC 
    db $F5 
    dw $3AFA 

EnemyProjSpritemaps_MotherBrainsPurpleBreath_Small_4:
    dw $0003,$01F6 
    db $EB 
    dw $3AF8,$01FC 
    db $EE 
    dw $3AF9,$01FA 
    db $F1 
    dw $3AFA 

EnemyProjSpritemaps_MotherBrainsPurpleBreath_Small_5:
    dw $0003,$01F6 
    db $EA 
    dw $3AF9,$01FD 
    db $ED 
    dw $3AFA,$01FA 
    db $F0 
    dw $3AFB 

EnemyProjSpritemaps_MotherBrainsPurpleBreath_Small_6:
    dw $0002,$01F6 
    db $E9 
    dw $3AFA,$01FE 
    db $EC 
    dw $3AFB 

EnemyProjSpritemaps_MotherBrainsPurpleBreath_Small_7:
    dw $0001,$01F6 
    db $E9 
    dw $3AFB 

EnemyProjSpritemaps_MotherBrainExplodedEscapeDoorParticles_0:
    dw $0001,$01FC 
    db $FC 
    dw $3302 

EnemyProjSpritemaps_MotherBrainExplodedEscapeDoorParticles_1:
    dw $0001,$C3F8 
    db $F8 
    dw $3303 

EnemyProjSpritemaps_MotherBrainExplodedEscapeDoorParticles_2:
    dw $0001,$01FC 
    db $FC 
    dw $3312 

EnemyProjSpritemaps_MotherBrainExplodedEscapeDoorParticles_3:
    dw $0001,$C3F8 
    db $F8 
    dw $3305 

EnemyProjSpritemaps_MotherBrainExplodedEscapeDoorParticles_4:
    dw $0001,$01FC 
    db $FC 
    dw $3307 

EnemyProjSpritemaps_MotherBrainExplodedEscapeDoorParticles_5:
    dw $0001,$C3F8 
    db $F8 
    dw $3308 

EnemyProjSpritemaps_MotherBrainExplodedEscapeDoorParticles_6:
    dw $0001,$01FC 
    db $FC 
    dw $3317 

EnemyProjSpritemaps_MotherBrainExplodedEscapeDoorParticles_7:
    dw $0001,$C3F8 
    db $F8 
    dw $330A 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_0_8D96D3:
    dw $0001,$01FC 
    db $FC 
    dw $330C 

UNUSED_EnemyProjSpritemaps_1_8D96DA:
    dw $0001,$01FC 
    db $FC 
    dw $330D 

UNUSED_EnemyProjSpritemaps_2_8D96E1:
    dw $0001,$01FC 
    db $FC 
    dw $330E 

UNUSED_EnemyProjSpritemaps_3_8D96E8:
    dw $0001,$01FC 
    db $FC 
    dw $330F 

UNUSED_EnemyProjSpritemaps_4_8D96EF:
    dw $0001,$01FC 
    db $FC 
    dw $331C 

UNUSED_EnemyProjSpritemaps_5_8D96F6:
    dw $0001,$01FC 
    db $FC 
    dw $331D 

UNUSED_EnemyProjSpritemaps_6_8D96FD:
    dw $0001,$01FC 
    db $FC 
    dw $331E 

UNUSED_EnemyProjSpritemaps_7_8D9704:
    dw $0001,$01FC 
    db $FC 
    dw $331F 
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_TimeBombSetJapanSet:
    dw $000C,$0008 
    db $08 
    dw $35C9,$0008 
    db $00 
    dw $35C8,$0000 
    db $08 
    dw $35C7,$01F8 
    db $08 
    dw $35C6,$0000 
    db $00 
    dw $35C5,$01F8 
    db $00 
    dw $35C4,$C3E8 
    db $00 
    dw $35AD,$0018 
    db $F8 
    dw $35C9,$0018 
    db $F0 
    dw $35C8,$C208 
    db $F0 
    dw $35A6,$C3F8 
    db $F0 
    dw $35A2,$C3E8 
    db $F0 
    dw $35A0 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_0:
    dw $0001,$01FC 
    db $FD 
    dw $3121 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_1:
    dw $0001,$01FC 
    db $FC 
    dw $3122 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_2:
    dw $0001,$01FC 
    db $FB 
    dw $3123 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_3:
    dw $0001,$01FC 
    db $FD 
    dw $3124 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_4:
    dw $0001,$01FC 
    db $FE 
    dw $B121 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_5:
    dw $0001,$01FC 
    db $FD 
    dw $3125 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_6:
    dw $0001,$01FC 
    db $FB 
    dw $3126 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_7:
    dw $0001,$01FC 
    db $FD 
    dw $3127 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_8:
    dw $0001,$01FB 
    db $FC 
    dw $3131 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_9:
    dw $0001,$01FC 
    db $FC 
    dw $3132 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_A:
    dw $0001,$01FE 
    db $FC 
    dw $3133 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_B:
    dw $0001,$01FB 
    db $FC 
    dw $3134 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_C:
    dw $0001,$01FA 
    db $FC 
    dw $7131 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_D:
    dw $0001,$01FB 
    db $FC 
    dw $3135 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_E:
    dw $0001,$01FC 
    db $FC 
    dw $3136 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_F:
    dw $0001,$01FB 
    db $FC 
    dw $3137 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_10:
    dw $0001,$01FC 
    db $FC 
    dw $3138 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_11:
    dw $0001,$01FC 
    db $FB 
    dw $3139 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_12:
    dw $0001,$01FC 
    db $FC 
    dw $313A 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_13:
    dw $0001,$01FC 
    db $FC 
    dw $313B 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_14:
    dw $0001,$01FC 
    db $FC 
    dw $F138 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_15:
    dw $0001,$01FB 
    db $FD 
    dw $313C 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_16:
    dw $0001,$01FD 
    db $FB 
    dw $313D 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_17:
    dw $0001,$01FC 
    db $FC 
    dw $313E 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_18:
    dw $0001,$01FC 
    db $FC 
    dw $B138 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_19:
    dw $0001,$01FC 
    db $FB 
    dw $B139 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_1A:
    dw $0001,$01FC 
    db $FC 
    dw $B13A 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_1B:
    dw $0001,$01FC 
    db $FC 
    dw $B13B 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_1C:
    dw $0001,$01FC 
    db $FC 
    dw $7138 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_1D:
    dw $0001,$01FB 
    db $FD 
    dw $B13C 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_1E:
    dw $0001,$01FD 
    db $FB 
    dw $B13D 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_1F:
    dw $0001,$01FC 
    db $FC 
    dw $B13E 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_20:
    dw $0001,$01FC 
    db $FB 
    dw $B121 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_21:
    dw $0001,$01FC 
    db $FC 
    dw $B122 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_22:
    dw $0001,$01FC 
    db $FB 
    dw $B123 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_23:
    dw $0001,$01FC 
    db $FC 
    dw $B124 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_24:
    dw $0001,$01FC 
    db $FC 
    dw $3121 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_25:
    dw $0001,$01FC 
    db $FC 
    dw $B125 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_26:
    dw $0001,$01FC 
    db $FC 
    dw $B126 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_27:
    dw $0001,$01FC 
    db $FB 
    dw $B127 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_28:
    dw $0001,$01FC 
    db $FC 
    dw $7131 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_29:
    dw $0001,$01FD 
    db $FC 
    dw $7132 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_2A:
    dw $0001,$01FC 
    db $FC 
    dw $7133 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_2B:
    dw $0001,$01FC 
    db $FC 
    dw $7134 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_2C:
    dw $0001,$01FB 
    db $FC 
    dw $3131 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_2D:
    dw $0001,$01FC 
    db $FC 
    dw $7135 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_2E:
    dw $0001,$01FC 
    db $FC 
    dw $7136 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_2F:
    dw $0001,$01FC 
    db $FC 
    dw $7137 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_30:
    dw $0001,$01FC 
    db $FC 
    dw $F138 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_31:
    dw $0001,$01FC 
    db $FC 
    dw $F139 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_32:
    dw $0001,$01FC 
    db $FC 
    dw $F13A 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_33:
    dw $0001,$01FC 
    db $FC 
    dw $F13B 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_34:
    dw $0001,$01FC 
    db $FD 
    dw $3138 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_35:
    dw $0001,$01FC 
    db $FC 
    dw $F13C 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_36:
    dw $0001,$01FC 
    db $FC 
    dw $F13D 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_37:
    dw $0001,$01FB 
    db $FD 
    dw $F13E 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_38:
    dw $0001,$01FC 
    db $FC 
    dw $7138 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_39:
    dw $0001,$01FC 
    db $FC 
    dw $7139 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_3A:
    dw $0001,$01FC 
    db $FC 
    dw $713A 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_3B:
    dw $0001,$01FD 
    db $FD 
    dw $713B 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_3C:
    dw $0001,$01FC 
    db $FC 
    dw $B138 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_3D:
    dw $0001,$01FC 
    db $FD 
    dw $713C 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_3E:
    dw $0001,$01FC 
    db $FC 
    dw $B13D 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_3F:
    dw $0001,$01FC 
    db $FC 
    dw $B13E 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Sparkle_0:
    dw $0001,$01FC 
    db $FC 
    dw $3528 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Sparkle_1:
    dw $0001,$01FC 
    db $FC 
    dw $3529 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Sparkle_2:
    dw $0001,$01FC 
    db $FC 
    dw $352A 

EnemyProjSpritemaps_MotherBrainsGlassShattering_Sparkle_3:
    dw $0001,$01FC 
    db $FC 
    dw $352B 

EnemyProjSpritemaps_KihunterAcidSpit_Left_0:
    dw $0001,$01F8 
    db $FC 
    dw $3165 

EnemyProjSpritemaps_KihunterAcidSpit_Left_1:
    dw $0002,$01F0 
    db $FC 
    dw $3174,$01F8 
    db $FC 
    dw $3175 

EnemyProjSpritemaps_KihunterAcidSpit_Left_2:
    dw $0001,$C3F0 
    db $F8 
    dw $3166 

EnemyProjSpritemaps_KihunterAcidSpit_Left_3:
    dw $0002,$C3E8 
    db $F8 
    dw $314B,$C3F0 
    db $F8 
    dw $314C 

EnemyProjSpritemaps_KihunterAcidSpit_Left_4:
    dw $0002,$01F8 
    db $FC 
    dw $3164,$C3E8 
    db $F8 
    dw $312A 

EnemyProjSpritemaps_KihunterAcidSpit_Left_5:
    dw $0001,$C3F8 
    db $F8 
    dw $312A 

EnemyProjSpritemaps_KihunterAcidSpit_0:
    dw $0001,$C3F9 
    db $F8 
    dw $316C 

EnemyProjSpritemaps_KihunterAcidSpit_1:
    dw $0003,$0004 
    db $00 
    dw $317B,$01F4 
    db $00 
    dw $3179,$01FC 
    db $00 
    dw $317A 

EnemyProjSpritemaps_KihunterAcidSpit_2:
    dw $0004,$01F2 
    db $00 
    dw $316A,$0006 
    db $00 
    dw $316B,$01FE 
    db $00 
    dw $316A,$01FA 
    db $00 
    dw $316B 

EnemyProjSpritemaps_KihunterAcidSpit_3:
    dw $0004,$01FE 
    db $00 
    dw $3168,$0006 
    db $00 
    dw $3169,$01FA 
    db $00 
    dw $3169,$01F2 
    db $00 
    dw $3168 

EnemyProjSpritemaps_KihunterAcidSpit_4:
    dw $0002,$0002 
    db $00 
    dw $3178,$01F6 
    db $00 
    dw $3178 

EnemyProjSpritemaps_KihunterAcidSpit_Right_0:
    dw $0001,$0000 
    db $FC 
    dw $7165 

EnemyProjSpritemaps_KihunterAcidSpit_Right_1:
    dw $0002,$0008 
    db $FC 
    dw $7174,$0000 
    db $FC 
    dw $7175 

EnemyProjSpritemaps_KihunterAcidSpit_Right_2:
    dw $0001,$C200 
    db $F8 
    dw $7166 

EnemyProjSpritemaps_KihunterAcidSpit_Right_3:
    dw $0002,$C208 
    db $F8 
    dw $714B,$C200 
    db $F8 
    dw $714C 

EnemyProjSpritemaps_KihunterAcidSpit_Right_4:
    dw $0002,$0000 
    db $FC 
    dw $7164,$C208 
    db $F8 
    dw $712A 

EnemyProjSpritemaps_KihunterAcidSpit_Right_5:
    dw $0001,$C3F8 
    db $F8 
    dw $712A 

EnemyProjSpritemaps_PowampSpikes_0:
    dw $0001,$01FC 
    db $FC 
    dw $210F 

EnemyProjSpritemaps_PowampSpikes_1:
    dw $0001,$01FC 
    db $FC 
    dw $211B 

EnemyProjSpritemaps_PowampSpikes_2:
    dw $0001,$01FC 
    db $FC 
    dw $211C 

EnemyProjSpritemaps_WorkRobotLaser_0:
    dw $0001,$01FC 
    db $FC 
    dw $2A53 

EnemyProjSpritemaps_WorkRobotLaser_1:
    dw $0001,$01FC 
    db $FC 
    dw $2A51 

EnemyProjSpritemaps_WorkRobotLaser_2:
    dw $0004,$0000 
    db $00 
    dw $EA60,$0000 
    db $F8 
    dw $6A60,$01F8 
    db $00 
    dw $AA60,$01F8 
    db $F8 
    dw $2A60 

EnemyProjSpritemaps_WorkRobotLaser_3:
    dw $0004,$0000 
    db $00 
    dw $EA61,$0000 
    db $F8 
    dw $6A61,$01F8 
    db $00 
    dw $AA61,$01F8 
    db $F8 
    dw $2A61 

EnemyProjSpritemaps_WorkRobotLaser_4:
    dw $0004,$0000 
    db $00 
    dw $EA62,$0000 
    db $F8 
    dw $6A62,$01F8 
    db $00 
    dw $AA62,$01F8 
    db $F8 
    dw $2A62 

EnemyProjSpritemaps_WorkRobotLaser_5:
    dw $0004,$0000 
    db $00 
    dw $EA63,$0000 
    db $F8 
    dw $6A63,$01F8 
    db $00 
    dw $AA63,$01F8 
    db $F8 
    dw $2A63 

EnemyProjSpritemaps_NoobTubeCrack_0:
    dw $0008,$0000 
    db $00 
    dw $734D,$0008 
    db $00 
    dw $734C,$0000 
    db $F8 
    dw $7359,$0000 
    db $F0 
    dw $7349,$01F9 
    db $08 
    dw $335D,$01F9 
    db $00 
    dw $334D,$01F9 
    db $F8 
    dw $3359,$01F1 
    db $F8 
    dw $3358 

EnemyProjSpritemaps_NoobTubeCrack_1:
    dw $000E,$01F9 
    db $18 
    dw $3371,$01F1 
    db $10 
    dw $3360,$01F9 
    db $10 
    dw $3361,$0010 
    db $08 
    dw $735B,$0018 
    db $08 
    dw $735A,$0010 
    db $00 
    dw $734B,$0008 
    db $E0 
    dw $7328,$0000 
    db $E8 
    dw $7339,$0008 
    db $E8 
    dw $7338,$C3E1 
    db $F0 
    dw $3346,$C200 
    db $00 
    dw $734C,$C200 
    db $F0 
    dw $7348,$C3F1 
    db $00 
    dw $334C,$C3F1 
    db $F0 
    dw $3348 

EnemyProjSpritemaps_NoobTubeCrack_2:
    dw $001E,$0008 
    db $10 
    dw $7360,$0000 
    db $10 
    dw $7361,$0020 
    db $F8 
    dw $7355,$0020 
    db $00 
    dw $730F,$01E1 
    db $08 
    dw $335A,$01E1 
    db $E8 
    dw $3336,$01E9 
    db $E8 
    dw $3337,$01F9 
    db $E0 
    dw $3329,$01F1 
    db $E8 
    dw $3338,$01F9 
    db $E8 
    dw $3339,$0028 
    db $18 
    dw $733E,$0020 
    db $10 
    dw $732F,$0010 
    db $10 
    dw $734F,$0018 
    db $10 
    dw $734E,$01E1 
    db $10 
    dw $334E,$01E9 
    db $10 
    dw $334F,$01E9 
    db $08 
    dw $335B,$01E9 
    db $00 
    dw $334B,$0010 
    db $D8 
    dw $7317,$C210 
    db $F0 
    dw $7346,$C200 
    db $D0 
    dw $7308,$C3D1 
    db $E8 
    dw $3334,$C3F1 
    db $10 
    dw $3360,$C3E1 
    db $F0 
    dw $3346,$C210 
    db $00 
    dw $734A,$C200 
    db $E0 
    dw $7328,$C200 
    db $00 
    dw $734C,$C200 
    db $F0 
    dw $7348,$C3F1 
    db $00 
    dw $334C,$C3F1 
    db $F0 
    dw $3348 

EnemyProjSpritemaps_NoobTubeCrack_3:
    dw $0027,$01E1 
    db $D8 
    dw $3316,$01D1 
    db $F8 
    dw $3354,$01D9 
    db $F8 
    dw $3355,$01D9 
    db $18 
    dw $333F,$C230 
    db $00 
    dw $730C,$C230 
    db $10 
    dw $732C,$C220 
    db $F0 
    dw $7344,$C220 
    db $00 
    dw $730E,$01D1 
    db $18 
    dw $333E,$01D9 
    db $10 
    dw $332F,$0020 
    db $E8 
    dw $7335,$01D9 
    db $00 
    dw $330F,$0020 
    db $D8 
    dw $7315,$01D9 
    db $E0 
    dw $3325,$01E9 
    db $D8 
    dw $3317,$01C9 
    db $F0 
    dw $3343,$01C1 
    db $E8 
    dw $3332,$01C9 
    db $E8 
    dw $3333,$C3D1 
    db $E8 
    dw $3334,$C3F1 
    db $D0 
    dw $3308,$C210 
    db $D0 
    dw $7306,$C210 
    db $E0 
    dw $7326,$C3E1 
    db $10 
    dw $334E,$C210 
    db $F0 
    dw $7346,$C3F1 
    db $E0 
    dw $3328,$C3E1 
    db $E0 
    dw $3326,$C220 
    db $10 
    dw $732E,$C3E1 
    db $00 
    dw $334A,$C210 
    db $10 
    dw $734E,$C200 
    db $D0 
    dw $7308,$C200 
    db $10 
    dw $7360,$C3F1 
    db $10 
    dw $3360,$C3E1 
    db $F0 
    dw $3346,$C210 
    db $00 
    dw $734A,$C200 
    db $E0 
    dw $7328,$C200 
    db $00 
    dw $734C,$C200 
    db $F0 
    dw $7348,$C3F1 
    db $00 
    dw $334C,$C3F1 
    db $F0 
    dw $3348 

EnemyProjSpritemaps_NoobTubeCrack_4:
    dw $0032,$C3B1 
    db $F0 
    dw $3340,$01C1 
    db $E0 
    dw $3322,$01C9 
    db $E0 
    dw $3323,$0030 
    db $D8 
    dw $7313,$01C1 
    db $10 
    dw $332C,$01B9 
    db $08 
    dw $331B,$01D9 
    db $E0 
    dw $3325,$C3D1 
    db $E8 
    dw $3334,$C3C1 
    db $E8 
    dw $3332,$0040 
    db $F0 
    dw $7341,$0030 
    db $E8 
    dw $7333,$0038 
    db $E8 
    dw $7332,$C230 
    db $F0 
    dw $7342,$C240 
    db $08 
    dw $731A,$C240 
    db $10 
    dw $732A,$C230 
    db $00 
    dw $730C,$C3C1 
    db $00 
    dw $330C,$C3C9 
    db $10 
    dw $332D,$C3D1 
    db $00 
    dw $330E,$C3C1 
    db $F0 
    dw $3342,$C3E1 
    db $D0 
    dw $3306,$C3D1 
    db $D0 
    dw $3304,$C3B1 
    db $E0 
    dw $3320,$C220 
    db $E0 
    dw $7324,$C220 
    db $D0 
    dw $7304,$C220 
    db $00 
    dw $730E,$C3F1 
    db $D0 
    dw $3308,$C210 
    db $D0 
    dw $7306,$C220 
    db $F0 
    dw $7344,$C210 
    db $E0 
    dw $7326,$C230 
    db $10 
    dw $732C,$C3D1 
    db $10 
    dw $332E,$C3E1 
    db $10 
    dw $334E,$C3D1 
    db $F0 
    dw $3344,$C210 
    db $F0 
    dw $7346,$C3F1 
    db $E0 
    dw $3328,$C3E1 
    db $E0 
    dw $3326,$C220 
    db $10 
    dw $732E,$C3E1 
    db $00 
    dw $334A,$C210 
    db $10 
    dw $734E,$C200 
    db $D0 
    dw $7308,$C200 
    db $10 
    dw $7360,$C3F1 
    db $10 
    dw $3360,$C3E1 
    db $F0 
    dw $3346,$C210 
    db $00 
    dw $734A,$C200 
    db $E0 
    dw $7328,$C200 
    db $00 
    dw $734C,$C200 
    db $F0 
    dw $7348,$C3F1 
    db $00 
    dw $334C,$C3F1 
    db $F0 
    dw $3348 

EnemyProjSpritemaps_NoobTubeCrack_5:
    dw $0032,$C210 
    db $10 
    dw $734E,$C200 
    db $10 
    dw $7360,$C200 
    db $00 
    dw $734C,$C210 
    db $00 
    dw $734A,$C220 
    db $10 
    dw $732E,$C230 
    db $10 
    dw $732C,$C240 
    db $10 
    dw $732A,$C220 
    db $00 
    dw $730E,$C230 
    db $00 
    dw $730C,$C240 
    db $00 
    dw $730A,$C200 
    db $F0 
    dw $7348,$C210 
    db $F0 
    dw $7346,$C220 
    db $F0 
    dw $7344,$C230 
    db $F0 
    dw $7342,$C240 
    db $F0 
    dw $7340,$C200 
    db $E0 
    dw $7328,$C210 
    db $E0 
    dw $7326,$C220 
    db $E0 
    dw $7324,$C230 
    db $E0 
    dw $7322,$C240 
    db $E0 
    dw $7320,$C200 
    db $D0 
    dw $7308,$C210 
    db $D0 
    dw $7306,$C220 
    db $D0 
    dw $7304,$C230 
    db $D0 
    dw $7302,$C240 
    db $D0 
    dw $7300,$C3E1 
    db $10 
    dw $334E,$C3F1 
    db $10 
    dw $3360,$C3F1 
    db $00 
    dw $334C,$C3E1 
    db $00 
    dw $334A,$C3D1 
    db $10 
    dw $332E,$C3C1 
    db $10 
    dw $332C,$C3B1 
    db $10 
    dw $332A,$C3D1 
    db $00 
    dw $330E,$C3C1 
    db $00 
    dw $330C,$C3B1 
    db $00 
    dw $330A,$C3F1 
    db $F0 
    dw $3348,$C3E1 
    db $F0 
    dw $3346,$C3D1 
    db $F0 
    dw $3344,$C3C1 
    db $F0 
    dw $3342,$C3B1 
    db $F0 
    dw $3340,$C3F1 
    db $E0 
    dw $3328,$C3E1 
    db $E0 
    dw $3326,$C3D1 
    db $E0 
    dw $3324,$C3C1 
    db $E0 
    dw $3322,$C3B1 
    db $E0 
    dw $3320,$C3F1 
    db $D0 
    dw $3308,$C3E1 
    db $D0 
    dw $3306,$C3D1 
    db $D0 
    dw $3304,$C3C1 
    db $D0 
    dw $3302,$C3B1 
    db $D0 
    dw $3300 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_8D9E29:
    dw $000E,$C200 
    db $EF 
    dw $7363,$C208 
    db $EF 
    dw $7362,$C200 
    db $00 
    dw $736B,$C208 
    db $00 
    dw $736A,$C200 
    db $F9 
    dw $7368,$C208 
    db $F9 
    dw $7367,$C218 
    db $F9 
    dw $7365,$C3F1 
    db $EF 
    dw $3363,$C3E9 
    db $EF 
    dw $3362,$C3F1 
    db $00 
    dw $336B,$C3E9 
    db $00 
    dw $336A,$C3F1 
    db $F9 
    dw $3368,$C3E9 
    db $F9 
    dw $3367,$C3D9 
    db $F9 
    dw $3365 
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_NoobTubeCrack_6:
    dw $000E,$C20C 
    db $E7 
    dw $7363,$C214 
    db $E7 
    dw $7362,$C20C 
    db $08 
    dw $736B,$C214 
    db $08 
    dw $736A,$C210 
    db $F9 
    dw $7368,$C218 
    db $F9 
    dw $7367,$C228 
    db $F9 
    dw $7365,$C3E5 
    db $E7 
    dw $3363,$C3DD 
    db $E7 
    dw $3362,$C3E5 
    db $08 
    dw $336B,$C3DD 
    db $08 
    dw $336A,$C3E1 
    db $F9 
    dw $3368,$C3D9 
    db $F9 
    dw $3367,$C3C9 
    db $F9 
    dw $3365 

EnemyProjSpritemaps_NoobTubeCrack_7:
    dw $000E,$C218 
    db $DF 
    dw $7363,$C220 
    db $DF 
    dw $7362,$C218 
    db $10 
    dw $736B,$C220 
    db $10 
    dw $736A,$C220 
    db $F9 
    dw $7368,$C228 
    db $F9 
    dw $7367,$C238 
    db $F9 
    dw $7365,$C3D9 
    db $DF 
    dw $3363,$C3D1 
    db $DF 
    dw $3362,$C3D9 
    db $10 
    dw $336B,$C3D1 
    db $10 
    dw $336A,$C3D1 
    db $F9 
    dw $3368,$C3C9 
    db $F9 
    dw $3367,$C3B9 
    db $F9 
    dw $3365 

EnemyProjSpritemaps_NoobTubeCrack_8:
    dw $000E,$C230 
    db $F9 
    dw $7368,$C238 
    db $F9 
    dw $7367,$C248 
    db $F9 
    dw $7365,$C224 
    db $D7 
    dw $7363,$C22C 
    db $D7 
    dw $7362,$C228 
    db $18 
    dw $736B,$C230 
    db $18 
    dw $736A,$C3CD 
    db $D7 
    dw $3363,$C3C5 
    db $D7 
    dw $3362,$C3C9 
    db $18 
    dw $336B,$C3C1 
    db $18 
    dw $336A,$C3C1 
    db $F9 
    dw $3368,$C3B9 
    db $F9 
    dw $3367,$C3A9 
    db $F9 
    dw $3365 

EnemyProjSpritemaps_NoobTubeCrack_9:
    dw $000E,$C240 
    db $F9 
    dw $7368,$C248 
    db $F9 
    dw $7367,$C258 
    db $F9 
    dw $7365,$C230 
    db $CF 
    dw $7363,$C238 
    db $CF 
    dw $7362,$C238 
    db $20 
    dw $736B,$C240 
    db $20 
    dw $736A,$C3C1 
    db $CF 
    dw $3363,$C3B9 
    db $CF 
    dw $3362,$C3B9 
    db $20 
    dw $336B,$C3B1 
    db $20 
    dw $336A,$C3B1 
    db $F9 
    dw $3368,$C3A9 
    db $F9 
    dw $3367,$C399 
    db $F9 
    dw $3365 

EnemyProjSpritemaps_NoobTubeCrack_A:
    dw $000E,$C248 
    db $F9 
    dw $7368,$C250 
    db $F9 
    dw $7367,$C260 
    db $F9 
    dw $7365,$C234 
    db $CD 
    dw $7363,$C23C 
    db $CD 
    dw $7362,$C23C 
    db $22 
    dw $736B,$C244 
    db $22 
    dw $736A,$C3BD 
    db $CD 
    dw $3363,$C3B5 
    db $CD 
    dw $3362,$C3B1 
    db $24 
    dw $336B,$C3A9 
    db $24 
    dw $336A,$C3A9 
    db $F9 
    dw $3368,$C3A1 
    db $F9 
    dw $3367,$C391 
    db $F9 
    dw $3365 

EnemyProjSpritemaps_NoobTubeCrack_B:
    dw $000E,$C24E 
    db $F9 
    dw $7368,$C256 
    db $F9 
    dw $7367,$C266 
    db $F9 
    dw $7365,$C236 
    db $CC 
    dw $7363,$C23E 
    db $CC 
    dw $7362,$C23E 
    db $23 
    dw $736B,$C246 
    db $23 
    dw $736A,$C3BB 
    db $CC 
    dw $3363,$C3B3 
    db $CC 
    dw $3362,$C3AB 
    db $27 
    dw $336B,$C3A3 
    db $27 
    dw $336A,$C3A3 
    db $F9 
    dw $3368,$C39B 
    db $F9 
    dw $3367,$C38B 
    db $F9 
    dw $3365 

EnemyProjSpritemaps_NoobTubeCrack_C:
    dw $000E,$C252 
    db $F9 
    dw $7368,$C25A 
    db $F9 
    dw $7367,$C26A 
    db $F9 
    dw $7365,$C237 
    db $CD 
    dw $7363,$C23F 
    db $CD 
    dw $7362,$C23E 
    db $24 
    dw $736B,$C246 
    db $24 
    dw $736A,$C3B9 
    db $CD 
    dw $3363,$C3B1 
    db $CD 
    dw $3362,$C3AC 
    db $28 
    dw $336B,$C3A4 
    db $28 
    dw $336A,$C39F 
    db $F9 
    dw $3368,$C397 
    db $F9 
    dw $3367,$C387 
    db $F9 
    dw $3365 

EnemyProjSpritemaps_NoobTubeCrack_D:
    dw $000E,$C254 
    db $F9 
    dw $7368,$C25C 
    db $F9 
    dw $7367,$C26C 
    db $F9 
    dw $7365,$C238 
    db $CE 
    dw $7363,$C240 
    db $CE 
    dw $7362,$C23D 
    db $25 
    dw $736B,$C245 
    db $25 
    dw $736A,$C3B8 
    db $CE 
    dw $3363,$C3B0 
    db $CE 
    dw $3362,$C3AB 
    db $2A 
    dw $336B,$C3A3 
    db $2A 
    dw $336A,$C39D 
    db $F9 
    dw $3368,$C395 
    db $F9 
    dw $3367,$C385 
    db $F9 
    dw $3365 

EnemyProjSpritemaps_NoobTubeCrack_E:
    dw $000E,$C256 
    db $FB 
    dw $7368,$C25E 
    db $FB 
    dw $7367,$C26E 
    db $FB 
    dw $7365,$C239 
    db $D0 
    dw $7363,$C241 
    db $D0 
    dw $7362,$C23E 
    db $26 
    dw $736B,$C246 
    db $26 
    dw $736A,$C3B7 
    db $D0 
    dw $3363,$C3AF 
    db $D0 
    dw $3362,$C3AA 
    db $2C 
    dw $336B,$C3A2 
    db $2C 
    dw $336A,$C39B 
    db $FA 
    dw $3368,$C393 
    db $FA 
    dw $3367,$C383 
    db $FA 
    dw $3365 

EnemyProjSpritemaps_NoobTubeCrack_F:
    dw $000E,$C258 
    db $FD 
    dw $7368,$C260 
    db $FD 
    dw $7367,$C270 
    db $FD 
    dw $7365,$C239 
    db $D1 
    dw $7363,$C241 
    db $D1 
    dw $7362,$C23F 
    db $27 
    dw $736B,$C247 
    db $27 
    dw $736A,$C3B8 
    db $D2 
    dw $3363,$C3B0 
    db $D2 
    dw $3362,$C3AB 
    db $2E 
    dw $336B,$C3A3 
    db $2E 
    dw $336A,$C399 
    db $FB 
    dw $3368,$C391 
    db $FB 
    dw $3367,$C381 
    db $FB 
    dw $3365 

EnemyProjSpritemaps_NoobTubeCrack_10:
    dw $000E,$C3AC 
    db $30 
    dw $336B,$C3A4 
    db $30 
    dw $336A,$C258 
    db $00 
    dw $7368,$C260 
    db $00 
    dw $7367,$C270 
    db $00 
    dw $7365,$C238 
    db $D2 
    dw $7363,$C240 
    db $D2 
    dw $7362,$C23E 
    db $28 
    dw $736B,$C246 
    db $28 
    dw $736A,$C3B7 
    db $D4 
    dw $3363,$C3AF 
    db $D4 
    dw $3362,$C399 
    db $FC 
    dw $3368,$C391 
    db $FC 
    dw $3367,$C381 
    db $FC 
    dw $3365 

EnemyProjSpritemaps_NoobTubeCrack_11:
    dw $000E,$C3AB 
    db $32 
    dw $336B,$C3A3 
    db $32 
    dw $336A,$C257 
    db $03 
    dw $7368,$C25F 
    db $03 
    dw $7367,$C26F 
    db $03 
    dw $7365,$C239 
    db $D3 
    dw $7363,$C241 
    db $D3 
    dw $7362,$C23D 
    db $29 
    dw $736B,$C245 
    db $29 
    dw $736A,$C3B6 
    db $D6 
    dw $3363,$C3AE 
    db $D6 
    dw $3362,$C39A 
    db $FD 
    dw $3368,$C392 
    db $FD 
    dw $3367,$C382 
    db $FD 
    dw $3365 

EnemyProjSpritemaps_NoobTubeCrack_12:
    dw $000E,$C3AA 
    db $34 
    dw $336B,$C3A2 
    db $34 
    dw $336A,$C258 
    db $06 
    dw $7368,$C260 
    db $06 
    dw $7367,$C270 
    db $06 
    dw $7365,$C23A 
    db $D4 
    dw $7363,$C242 
    db $D4 
    dw $7362,$C23E 
    db $2A 
    dw $736B,$C246 
    db $2A 
    dw $736A,$C3B7 
    db $D8 
    dw $3363,$C3AF 
    db $D8 
    dw $3362,$C399 
    db $FE 
    dw $3368,$C391 
    db $FE 
    dw $3367,$C381 
    db $FE 
    dw $3365 

EnemyProjSpritemaps_NoobTubeCrack_13:
    dw $000E,$C3AB 
    db $36 
    dw $336B,$C3A3 
    db $36 
    dw $336A,$C257 
    db $09 
    dw $7368,$C25F 
    db $09 
    dw $7367,$C26F 
    db $09 
    dw $7365,$C239 
    db $D5 
    dw $7363,$C241 
    db $D5 
    dw $7362,$C23F 
    db $2B 
    dw $736B,$C247 
    db $2B 
    dw $736A,$C3B8 
    db $DA 
    dw $3363,$C3B0 
    db $DA 
    dw $3362,$C39A 
    db $FF 
    dw $3368,$C392 
    db $FF 
    dw $3367,$C382 
    db $FF 
    dw $3365 

EnemyProjSpritemaps_NoobTubeCrack_14:
    dw $000E,$C3AC 
    db $38 
    dw $336B,$C3A4 
    db $38 
    dw $336A,$C258 
    db $0C 
    dw $7368,$C260 
    db $0C 
    dw $7367,$C270 
    db $0C 
    dw $7365,$C238 
    db $D6 
    dw $7363,$C240 
    db $D6 
    dw $7362,$C23E 
    db $2C 
    dw $736B,$C246 
    db $2C 
    dw $736A,$C3B7 
    db $DC 
    dw $3363,$C3AF 
    db $DC 
    dw $3362,$C399 
    db $00 
    dw $3368,$C391 
    db $00 
    dw $3367,$C381 
    db $00 
    dw $3365 

EnemyProjSpritemaps_NoobTubeCrack_15:
    dw $000E,$C3AB 
    db $3A 
    dw $336B,$C3A3 
    db $3A 
    dw $336A,$C39A 
    db $01 
    dw $3368,$C392 
    db $01 
    dw $3367,$C382 
    db $01 
    dw $3365,$C257 
    db $0F 
    dw $7368,$C25F 
    db $0F 
    dw $7367,$C26F 
    db $0F 
    dw $7365,$C239 
    db $D7 
    dw $7363,$C241 
    db $D7 
    dw $7362,$C23D 
    db $2D 
    dw $736B,$C245 
    db $2D 
    dw $736A,$C3B6 
    db $DE 
    dw $3363,$C3AE 
    db $DE 
    dw $3362 

EnemyProjSpritemaps_NoobTubeCrack_16:
    dw $000E,$C3AA 
    db $3C 
    dw $336B,$C3A2 
    db $3C 
    dw $336A,$C399 
    db $02 
    dw $3368,$C391 
    db $02 
    dw $3367,$C381 
    db $02 
    dw $3365,$C258 
    db $12 
    dw $7368,$C260 
    db $12 
    dw $7367,$C270 
    db $12 
    dw $7365,$C23A 
    db $D8 
    dw $7363,$C242 
    db $D8 
    dw $7362,$C23E 
    db $2E 
    dw $736B,$C246 
    db $2E 
    dw $736A,$C3B7 
    db $E0 
    dw $3363,$C3AF 
    db $E0 
    dw $3362 

EnemyProjSpritemaps_NoobTubeCrack_17:
    dw $000E,$C3AB 
    db $3E 
    dw $336B,$C3A3 
    db $3E 
    dw $336A,$C39A 
    db $03 
    dw $3368,$C392 
    db $03 
    dw $3367,$C382 
    db $03 
    dw $3365,$C257 
    db $15 
    dw $7368,$C25F 
    db $15 
    dw $7367,$C26F 
    db $15 
    dw $7365,$C239 
    db $D9 
    dw $7363,$C241 
    db $D9 
    dw $7362,$C23F 
    db $2F 
    dw $736B,$C247 
    db $2F 
    dw $736A,$C3B8 
    db $E2 
    dw $3363,$C3B0 
    db $E2 
    dw $3362 

EnemyProjSpritemaps_NoobTubeCrack_18:
    dw $000E,$C3AC 
    db $40 
    dw $336B,$C3A4 
    db $40 
    dw $336A,$C399 
    db $04 
    dw $3368,$C391 
    db $04 
    dw $3367,$C381 
    db $04 
    dw $3365,$C258 
    db $18 
    dw $7368,$C260 
    db $18 
    dw $7367,$C270 
    db $18 
    dw $7365,$C238 
    db $DA 
    dw $7363,$C240 
    db $DA 
    dw $7362,$C23E 
    db $30 
    dw $736B,$C246 
    db $30 
    dw $736A,$C3B7 
    db $E4 
    dw $3363,$C3AF 
    db $E4 
    dw $3362 

EnemyProjSpritemaps_NoobTubeCrack_19:
    dw $000E,$C3AB 
    db $42 
    dw $336B,$C3A3 
    db $42 
    dw $336A,$C39A 
    db $05 
    dw $3368,$C392 
    db $05 
    dw $3367,$C382 
    db $05 
    dw $3365,$C257 
    db $1B 
    dw $7368,$C25F 
    db $1B 
    dw $7367,$C26F 
    db $1B 
    dw $7365,$C239 
    db $DB 
    dw $7363,$C241 
    db $DB 
    dw $7362,$C23D 
    db $31 
    dw $736B,$C245 
    db $31 
    dw $736A,$C3B6 
    db $E6 
    dw $3363,$C3AE 
    db $E6 
    dw $3362 

EnemyProjSpritemaps_NoobTubeCrack_1A:
    dw $000E,$C3AA 
    db $44 
    dw $336B,$C3A2 
    db $44 
    dw $336A,$C399 
    db $06 
    dw $3368,$C391 
    db $06 
    dw $3367,$C381 
    db $06 
    dw $3365,$C258 
    db $1E 
    dw $7368,$C260 
    db $1E 
    dw $7367,$C270 
    db $1E 
    dw $7365,$C23A 
    db $DC 
    dw $7363,$C242 
    db $DC 
    dw $7362,$C23E 
    db $32 
    dw $736B,$C246 
    db $32 
    dw $736A,$C3B7 
    db $E8 
    dw $3363,$C3AF 
    db $E8 
    dw $3362 

EnemyProjSpritemaps_NoobTubeCrack_1B:
    dw $000E,$C3AB 
    db $46 
    dw $336B,$C3A3 
    db $46 
    dw $336A,$C39A 
    db $07 
    dw $3368,$C392 
    db $07 
    dw $3367,$C382 
    db $07 
    dw $3365,$C257 
    db $21 
    dw $7368,$C25F 
    db $21 
    dw $7367,$C26F 
    db $21 
    dw $7365,$C239 
    db $DD 
    dw $7363,$C241 
    db $DD 
    dw $7362,$C23F 
    db $33 
    dw $736B,$C247 
    db $33 
    dw $736A,$C3B8 
    db $EA 
    dw $3363,$C3B0 
    db $EA 
    dw $3362 

EnemyProjSpritemaps_NoobTubeCrack_1C:
    dw $000E,$C3AC 
    db $48 
    dw $336B,$C3A4 
    db $48 
    dw $336A,$C399 
    db $08 
    dw $3368,$C391 
    db $08 
    dw $3367,$C381 
    db $08 
    dw $3365,$C258 
    db $24 
    dw $7368,$C260 
    db $24 
    dw $7367,$C270 
    db $24 
    dw $7365,$C238 
    db $DE 
    dw $7363,$C240 
    db $DE 
    dw $7362,$C23E 
    db $34 
    dw $736B,$C246 
    db $34 
    dw $736A,$C3B7 
    db $EC 
    dw $3363,$C3AF 
    db $EC 
    dw $3362 

EnemyProjSpritemaps_NoobTubeCrack_1D:
    dw $000E,$C3AB 
    db $4A 
    dw $336B,$C3A3 
    db $4A 
    dw $336A,$C257 
    db $27 
    dw $7368,$C25F 
    db $27 
    dw $7367,$C26F 
    db $27 
    dw $7365,$C239 
    db $DF 
    dw $7363,$C241 
    db $DF 
    dw $7362,$C23D 
    db $35 
    dw $736B,$C245 
    db $35 
    dw $736A,$C3B6 
    db $EE 
    dw $3363,$C3AE 
    db $EE 
    dw $3362,$C39A 
    db $09 
    dw $3368,$C392 
    db $09 
    dw $3367,$C382 
    db $09 
    dw $3365 

EnemyProjSpritemaps_NoobTubeCrack_1E:
    dw $000E,$C3AA 
    db $4C 
    dw $336B,$C3A2 
    db $4C 
    dw $336A,$C258 
    db $2A 
    dw $7368,$C260 
    db $2A 
    dw $7367,$C270 
    db $2A 
    dw $7365,$C23A 
    db $E0 
    dw $7363,$C242 
    db $E0 
    dw $7362,$C23E 
    db $36 
    dw $736B,$C246 
    db $36 
    dw $736A,$C3B7 
    db $F0 
    dw $3363,$C3AF 
    db $F0 
    dw $3362,$C399 
    db $0A 
    dw $3368,$C391 
    db $0A 
    dw $3367,$C381 
    db $0A 
    dw $3365 

EnemyProjSpritemaps_NoobTubeCrack_1F:
    dw $000E,$C3AB 
    db $4E 
    dw $336B,$C3A3 
    db $4E 
    dw $336A,$C257 
    db $2D 
    dw $7368,$C25F 
    db $2D 
    dw $7367,$C26F 
    db $2D 
    dw $7365,$C239 
    db $E1 
    dw $7363,$C241 
    db $E1 
    dw $7362,$C23F 
    db $37 
    dw $736B,$C247 
    db $37 
    dw $736A,$C3B8 
    db $F2 
    dw $3363,$C3B0 
    db $F2 
    dw $3362,$C39A 
    db $0B 
    dw $3368,$C392 
    db $0B 
    dw $3367,$C382 
    db $0B 
    dw $3365 

EnemyProjSpritemaps_NoobTubeCrack_20:
    dw $000E,$C3AC 
    db $50 
    dw $336B,$C3A4 
    db $50 
    dw $336A,$C258 
    db $30 
    dw $7368,$C260 
    db $30 
    dw $7367,$C270 
    db $30 
    dw $7365,$C238 
    db $E2 
    dw $7363,$C240 
    db $E2 
    dw $7362,$C23E 
    db $38 
    dw $736B,$C246 
    db $38 
    dw $736A,$C3B7 
    db $F4 
    dw $3363,$C3AF 
    db $F4 
    dw $3362,$C399 
    db $0C 
    dw $3368,$C391 
    db $0C 
    dw $3367,$C381 
    db $0C 
    dw $3365 

EnemyProjSpritemaps_NoobTubeCrack_21:
    dw $000E,$C3AB 
    db $52 
    dw $336B,$C3A3 
    db $52 
    dw $336A,$C257 
    db $33 
    dw $7368,$C25F 
    db $33 
    dw $7367,$C26F 
    db $33 
    dw $7365,$C239 
    db $E3 
    dw $7363,$C241 
    db $E3 
    dw $7362,$C23D 
    db $39 
    dw $736B,$C245 
    db $39 
    dw $736A,$C3B6 
    db $F6 
    dw $3363,$C3AE 
    db $F6 
    dw $3362,$C39A 
    db $0D 
    dw $3368,$C392 
    db $0D 
    dw $3367,$C382 
    db $0D 
    dw $3365 

EnemyProjSpritemaps_NoobTubeCrack_22:
    dw $000E,$C3AA 
    db $54 
    dw $336B,$C3A2 
    db $54 
    dw $336A,$C399 
    db $0E 
    dw $3368,$C391 
    db $0E 
    dw $3367,$C381 
    db $0E 
    dw $3365,$C258 
    db $36 
    dw $7368,$C260 
    db $36 
    dw $7367,$C270 
    db $36 
    dw $7365,$C23A 
    db $E4 
    dw $7363,$C242 
    db $E4 
    dw $7362,$C23E 
    db $3A 
    dw $736B,$C246 
    db $3A 
    dw $736A,$C3B7 
    db $F8 
    dw $3363,$C3AF 
    db $F8 
    dw $3362 

EnemyProjSpritemaps_NoobTubeCrack_23:
    dw $000E,$C3AB 
    db $54 
    dw $336B,$C3A3 
    db $54 
    dw $336A,$C39A 
    db $0E 
    dw $3368,$C392 
    db $0E 
    dw $3367,$C382 
    db $0E 
    dw $3365,$C257 
    db $36 
    dw $7368,$C25F 
    db $36 
    dw $7367,$C26F 
    db $36 
    dw $7365,$C239 
    db $E4 
    dw $7363,$C241 
    db $E4 
    dw $7362,$C23F 
    db $3A 
    dw $736B,$C247 
    db $3A 
    dw $736A,$C3B8 
    db $F8 
    dw $3363,$C3B0 
    db $F8 
    dw $3362 

EnemyProjSpritemaps_NoobTubeShards_0:
    dw $0002,$C3F3 
    db $FA 
    dw $F3A2,$C203 
    db $FA 
    dw $F3A0 

EnemyProjSpritemaps_NoobTubeShards_1:
    dw $0002,$C3FE 
    db $FA 
    dw $B3A2,$C3EE 
    db $FA 
    dw $B3A0 

EnemyProjSpritemaps_NoobTubeShards_2:
    dw $0002,$C3FD 
    db $FD 
    dw $33A6,$C3F5 
    db $F5 
    dw $33A4 

EnemyProjSpritemaps_NoobTubeShards_3:
    dw $0002,$C3F4 
    db $FD 
    dw $73A6,$C3FC 
    db $F5 
    dw $73A4 

EnemyProjSpritemaps_NoobTubeShards_4:
    dw $0001,$C3F7 
    db $F8 
    dw $33A8 

EnemyProjSpritemaps_NoobTubeShards_5:
    dw $0001,$C3FA 
    db $F8 
    dw $73A8 

EnemyProjSpritemaps_NoobTubeShards_6:
    dw $0002,$C3EC 
    db $F9 
    dw $73AC,$C3FC 
    db $F9 
    dw $73AA 

EnemyProjSpritemaps_NoobTubeShards_7:
    dw $0002,$C205 
    db $F9 
    dw $33AC,$C3F5 
    db $F9 
    dw $33AA 

EnemyProjSpritemaps_NoobTubeShards_8:
    dw $0002,$C3F3 
    db $FB 
    dw $73AE,$C203 
    db $FB 
    dw $738E 

EnemyProjSpritemaps_NoobTubeShards_9:
    dw $0002,$C3FE 
    db $FB 
    dw $33AE,$C3EE 
    db $FB 
    dw $338E 

EnemyProjSpritemaps_NoobTubeShards_A:
    dw $0002,$C3F3 
    db $F6 
    dw $F3AE,$C203 
    db $F6 
    dw $F38E 

EnemyProjSpritemaps_NoobTubeShards_B:
    dw $0002,$C3FE 
    db $F6 
    dw $B3AE,$C3EE 
    db $F6 
    dw $B38E 

EnemyProjSpritemaps_NoobTubeShards_C:
    dw $0002,$C200 
    db $F8 
    dw $3388,$C3F0 
    db $F8 
    dw $3386 

EnemyProjSpritemaps_NoobTubeShards_D:
    dw $0002,$C3F1 
    db $F8 
    dw $7388,$C201 
    db $F8 
    dw $7386 

EnemyProjSpritemaps_NoobTubeShards_E:
    dw $0002,$C201 
    db $F8 
    dw $338C,$C3F1 
    db $F8 
    dw $338A 

EnemyProjSpritemaps_NoobTubeShards_F:
    dw $0002,$C3F0 
    db $F8 
    dw $738C,$C200 
    db $F8 
    dw $738A 

EnemyProjSpritemaps_NoobTubeShards_10:
    dw $0002,$C3F8 
    db $F4 
    dw $3382,$C3F8 
    db $FC 
    dw $3384 

EnemyProjSpritemaps_NoobTubeShards_11:
    dw $0002,$C3F4 
    db $F0 
    dw $336D,$C3F4 
    db $00 
    dw $3380 

EnemyProjSpritemaps_NoobTubeShards_12:
    dw $0002,$C3FC 
    db $00 
    dw $7380,$C3FC 
    db $F0 
    dw $736D 

EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_0:
    dw $0001,$C3F8 
    db $F8 
    dw $3A7C 

EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_1:
    dw $0002,$C3F8 
    db $F8 
    dw $3A7C,$C3F8 
    db $00 
    dw $3A7E 

EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_2:
    dw $0003,$C3F8 
    db $F8 
    dw $3A7C,$C3F8 
    db $00 
    dw $3A7E,$C3F8 
    db $08 
    dw $3A9A 

EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_3:
    dw $0004,$C3F8 
    db $F8 
    dw $3A7C,$C3F8 
    db $00 
    dw $3A7E,$C3F8 
    db $08 
    dw $3A9A,$C3F8 
    db $10 
    dw $3A9C 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_8DA7F5:
    dw $C3F8 
    db $C0 
    dw $3A9C 
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_4:
    dw $0007,$01FD 
    db $F2 
    dw $3A43,$01FF 
    db $F3 
    dw $3A43,$01FA 
    db $F4 
    dw $3A43,$01FA 
    db $F9 
    dw $3A43,$C3F8 
    db $F8 
    dw $3A7E,$C3F8 
    db $00 
    dw $3A9A,$C3F8 
    db $08 
    dw $3A9C 

EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_5:
    dw $0007,$01FE 
    db $F2 
    dw $3A43,$0000 
    db $F3 
    dw $3A43,$01FB 
    db $F4 
    dw $3A43,$01FB 
    db $F9 
    dw $3A43,$C3F8 
    db $F8 
    dw $3A7E,$C3F8 
    db $00 
    dw $3A9A,$C3F8 
    db $08 
    dw $3A9C 

EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_6:
    dw $0006,$01FA 
    db $F4 
    dw $3A25,$01FD 
    db $F2 
    dw $3A25,$01FA 
    db $F9 
    dw $3A25,$01FF 
    db $F3 
    dw $3A25,$C3F8 
    db $F8 
    dw $3A9A,$C3F8 
    db $00 
    dw $3A9C 

EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_7:
    dw $0006,$01FC 
    db $EC 
    dw $3A25,$01F8 
    db $F2 
    dw $3A25,$01FC 
    db $F5 
    dw $3A25,$0000 
    db $F0 
    dw $3A25,$C3F8 
    db $F8 
    dw $3A9A,$C3F8 
    db $00 
    dw $3A9C 

EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_8:
    dw $0005,$01FC 
    db $E8 
    dw $3A25,$01F7 
    db $EF 
    dw $3A25,$01FB 
    db $F5 
    dw $3A25,$0001 
    db $EE 
    dw $3A25,$C3F8 
    db $F8 
    dw $3A9C 

EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_9:
    dw $0005,$01FC 
    db $E8 
    dw $3A25,$01F8 
    db $F0 
    dw $3A25,$01FD 
    db $F5 
    dw $3A25,$0002 
    db $EE 
    dw $3A25,$C3F8 
    db $F8 
    dw $3A9C 

EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_A:
    dw $0004,$01FC 
    db $E8 
    dw $3A25,$01F8 
    db $F0 
    dw $3A25,$01FD 
    db $F5 
    dw $3A25,$0002 
    db $ED 
    dw $3A25 

EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_B:
    dw $0004,$0002 
    db $ED 
    dw $3A25,$01FC 
    db $E8 
    dw $3A25,$01FD 
    db $F5 
    dw $3A43,$01F8 
    db $F0 
    dw $3A43 

EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_C:
    dw $0004,$0002 
    db $ED 
    dw $3A43,$01FC 
    db $E8 
    dw $3A43,$01FD 
    db $F5 
    dw $3A40,$01F8 
    db $F0 
    dw $3A40 

EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_D:
    dw $0002,$0002 
    db $ED 
    dw $3A40,$01FC 
    db $E8 
    dw $3A40 

EnemyProjSpritemaps_CacatacSpikes_0:
    dw $0001,$01FC 
    db $FC 
    dw $311B 

EnemyProjSpritemaps_CacatacSpikes_1:
    dw $0001,$01FC 
    db $FC 
    dw $310E 

EnemyProjSpritemaps_CacatacSpikes_2:
    dw $0001,$01FC 
    db $FC 
    dw $310F 

EnemyProjSpritemaps_CacatacSpikes_3:
    dw $0001,$01FC 
    db $FC 
    dw $710E 

EnemyProjSpritemaps_CacatacSpikes_4:
    dw $0001,$01FC 
    db $FC 
    dw $711B 

EnemyProjSpritemaps_CacatacSpikes_5:
    dw $0001,$01FC 
    db $FC 
    dw $B11B 

EnemyProjSpritemaps_CacatacSpikes_6:
    dw $0001,$01FC 
    db $FC 
    dw $B10E 

EnemyProjSpritemaps_CacatacSpikes_7:
    dw $0001,$01FC 
    db $FC 
    dw $B10F 

EnemyProjSpritemaps_CacatacSpikes_8:
    dw $0001,$01FC 
    db $FC 
    dw $F10E 

EnemyProjSpritemaps_CacatacSpikes_9:
    dw $0001,$01FC 
    db $FC 
    dw $F11B 

UNUSED_EnemyProjSpritemaps_StokeProjectile_0_8DA94E:
    dw $0001,$01FC 
    db $FC 
    dw $311E 

UNUSED_EnemyProjSpritemaps_StokeProjectile_1_8DA955:
    dw $0001,$01FC 
    db $FC 
    dw $311D 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_0_8DA95C:
    dw $0001,$C3F8 
    db $F8 
    dw $3126 

UNUSED_EnemyProjSpritemaps_1_8DA963:
    dw $0001,$C3F8 
    db $F8 
    dw $3128 

UNUSED_EnemyProjSpritemaps_2_8DA96A:
    dw $0001,$C3F8 
    db $F8 
    dw $310C 

UNUSED_EnemyProjSpritemaps_3_8DA971:
    dw $0001,$C3F8 
    db $F8 
    dw $310E 

UNUSED_EnemyProjSpritemaps_4_8DA978:
    dw $0001,$C3F8 
    db $F8 
    dw $312C 

UNUSED_EnemyProjSpritemaps_5_8DA97F:
    dw $0001,$01FC 
    db $FC 
    dw $313E 

UNUSED_EnemyProjSpritemaps_6_8DA986:
    dw $0001,$01FC 
    db $FC 
    dw $312F 

UNUSED_EnemyProjSpritemaps_7_8DA98D:
    dw $0001,$01FC 
    db $FC 
    dw $312E 
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_SporeSpawnsStalk:
    dw $0001,$81F8 
    db $F8 
    dw $3340 

EnemyProjSpritemaps_SporeSpawners_0:
    dw $0001,$81F8 
    db $F8 
    dw $210C 

EnemyProjSpritemaps_SporeSpawners_1:
    dw $0001,$81F8 
    db $F8 
    dw $210E 

EnemyProjSpritemaps_SporeSpawners_2:
    dw $0001,$81F8 
    db $F8 
    dw $212C 

EnemyProjSpritemaps_Spores_0:
    dw $0001,$01FC 
    db $FC 
    dw $2F3E 

EnemyProjSpritemaps_Spores_1:
    dw $0001,$01FC 
    db $FC 
    dw $2F2F 

EnemyProjSpritemaps_Spores_2:
    dw $0001,$01FC 
    db $FC 
    dw $2F2E 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_0_8DA9C5:
    dw $0018,$8000 
    db $26 
    dw $614E,$8010 
    db $26 
    dw $614C,$8020 
    db $26 
    dw $614A,$8000 
    db $16 
    dw $6148,$8010 
    db $16 
    dw $6146,$8020 
    db $16 
    dw $6144,$81F0 
    db $26 
    dw $214E,$81E0 
    db $26 
    dw $214C,$81D0 
    db $26 
    dw $214A,$81F0 
    db $16 
    dw $2148,$81E0 
    db $16 
    dw $2146,$81D0 
    db $16 
    dw $2144,$8000 
    db $DA 
    dw $6124,$8010 
    db $DA 
    dw $6122,$8020 
    db $DA 
    dw $6120,$8000 
    db $CA 
    dw $6104,$8010 
    db $CA 
    dw $6102,$8020 
    db $CA 
    dw $6100,$81F0 
    db $DA 
    dw $2124,$81E0 
    db $DA 
    dw $2122,$81D0 
    db $DA 
    dw $2120,$81F0 
    db $CA 
    dw $2104,$81E0 
    db $CA 
    dw $2102,$81D0 
    db $CA 
    dw $2100 

UNUSED_EnemyProjSpritemaps_1_8DA93F:
    dw $0018,$8000 
    db $28 
    dw $614E,$8010 
    db $28 
    dw $614C,$8020 
    db $28 
    dw $614A,$8000 
    db $18 
    dw $6148,$8010 
    db $18 
    dw $6146,$8020 
    db $18 
    dw $6144,$81F0 
    db $28 
    dw $214E,$81E0 
    db $28 
    dw $214C,$81D0 
    db $28 
    dw $214A,$81F0 
    db $18 
    dw $2148,$81E0 
    db $18 
    dw $2146,$81D0 
    db $18 
    dw $2144,$8000 
    db $D8 
    dw $6124,$8010 
    db $D8 
    dw $6122,$8020 
    db $D8 
    dw $6120,$8000 
    db $C8 
    dw $6104,$8010 
    db $C8 
    dw $6102,$8020 
    db $C8 
    dw $6100,$81F0 
    db $D8 
    dw $2124,$81E0 
    db $D8 
    dw $2122,$81D0 
    db $D8 
    dw $2120,$81F0 
    db $C8 
    dw $2104,$81E0 
    db $C8 
    dw $2102,$81D0 
    db $C8 
    dw $2100 
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_Namihe_Fune_Fireball_0:
    dw $0001,$81F8 
    db $F8 
    dw $210A 

EnemyProjSpritemaps_Namihe_Fune_Fireball_1:
    dw $0001,$81F8 
    db $F8 
    dw $210C 

EnemyProjSpritemaps_Namihe_Fune_Fireball_2:
    dw $0001,$81F8 
    db $F8 
    dw $210E 

EnemyProjSpritemaps_Namihe_Fune_Fireball_3:
    dw $0001,$81F8 
    db $F8 
    dw $610A 

EnemyProjSpritemaps_Namihe_Fune_Fireball_4:
    dw $0001,$81F8 
    db $F8 
    dw $610C 

EnemyProjSpritemaps_Namihe_Fune_Fireball_5:
    dw $0001,$81F8 
    db $F8 
    dw $610E 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_0_8DAAE3:
    dw $0004,$01F8 
    db $00 
    dw $612F,$0000 
    db $00 
    dw $612E,$01F8 
    db $F8 
    dw $612D,$0000 
    db $F8 
    dw $612C 

UNUSED_EnemyProjSpritemaps_1_8DAAF9:
    dw $0004,$0000 
    db $00 
    dw $212F,$01F8 
    db $00 
    dw $212E,$0000 
    db $F8 
    dw $212D,$01F8 
    db $F8 
    dw $212C 
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_MagdolliteFlame_0:
    dw $0004,$0000 
    db $00 
    dw $212F,$01F8 
    db $00 
    dw $212E,$0000 
    db $F8 
    dw $212D,$01F8 
    db $F8 
    dw $212C 

EnemyProjSpritemaps_MagdolliteFlame_1:
    dw $0004,$01F8 
    db $00 
    dw $612F,$0000 
    db $00 
    dw $612E,$01F8 
    db $F8 
    dw $612D,$0000 
    db $F8 
    dw $612C 

EnemyProjSpritemaps_DustCloud_Explosion_0:
    dw $0004,$0000 
    db $F8 
    dw $7A2B,$0000 
    db $00 
    dw $7A2B,$01F8 
    db $00 
    dw $3A2B,$01F8 
    db $F8 
    dw $3A2B 

EnemyProjSpritemaps_DustCloud_Explosion_1:
    dw $0004,$0002 
    db $F3 
    dw $7A2B,$0001 
    db $FF 
    dw $7A2B,$01F7 
    db $FF 
    dw $3A2B,$01F6 
    db $F3 
    dw $3A2B 

EnemyProjSpritemaps_DustCloud_Explosion_2:
    dw $0004,$0005 
    db $EE 
    dw $7A2B,$0003 
    db $FD 
    dw $7A2B,$01F5 
    db $FD 
    dw $3A2B,$01F3 
    db $EE 
    dw $3A2B 

EnemyProjSpritemaps_DustCloud_Explosion_3:
    dw $0004,$0007 
    db $EC 
    dw $7A2B,$0005 
    db $FB 
    dw $7A2B,$01F3 
    db $FB 
    dw $3A2B,$01F1 
    db $EC 
    dw $3A2B 

EnemyProjSpritemaps_DustCloud_Explosion_4:
    dw $0004,$0009 
    db $EA 
    dw $7A2B,$0007 
    db $FA 
    dw $7A2B,$01F1 
    db $FA 
    dw $3A2B,$01EF 
    db $EA 
    dw $3A2B 

EnemyProjSpritemaps_DustCloud_Explosion_5:
    dw $0004,$000A 
    db $EA 
    dw $7A2B,$0008 
    db $F9 
    dw $7A2B,$01F0 
    db $F9 
    dw $3A2B,$01EE 
    db $EA 
    dw $3A2B 

EnemyProjSpritemaps_DustCloud_Explosion_6:
    dw $0004,$000C 
    db $EB 
    dw $7A2A,$0009 
    db $FA 
    dw $7A2A,$01EF 
    db $FA 
    dw $3A2A,$01EC 
    db $EB 
    dw $3A2A 

EnemyProjSpritemaps_DustCloud_Explosion_7:
    dw $0004,$000E 
    db $EC 
    dw $7A2A,$000A 
    db $FC 
    dw $7A2A,$01EE 
    db $FC 
    dw $3A2A,$01EA 
    db $EC 
    dw $3A2A 

EnemyProjSpritemaps_DustCloud_Explosion_8:
    dw $0004,$0010 
    db $ED 
    dw $7A29,$000B 
    db $FE 
    dw $7A29,$01ED 
    db $FE 
    dw $3A29,$01E8 
    db $ED 
    dw $3A29 

EnemyProjSpritemaps_DustCloud_Explosion_9:
    dw $0004,$0012 
    db $EE 
    dw $7A29,$000C 
    db $00 
    dw $7A29,$01EC 
    db $00 
    dw $3A29,$01E6 
    db $EE 
    dw $3A29 

EnemyProjSpritemaps_DustCloud_Explosion_A:
    dw $0004,$0013 
    db $F0 
    dw $7A28,$000D 
    db $02 
    dw $7A28,$01E5 
    db $F0 
    dw $3A28,$01EB 
    db $02 
    dw $3A28 

EnemyProjSpritemaps_DustCloud_Explosion_B:
    dw $0004,$0014 
    db $F2 
    dw $7A28,$000E 
    db $04 
    dw $7A28,$01E4 
    db $F2 
    dw $3A28,$01EA 
    db $04 
    dw $3A28 

EnemyProjSpritemaps_DustCloud_Explosion_C:
    dw $0004,$0015 
    db $F5 
    dw $7A28,$000F 
    db $07 
    dw $7A28,$01E3 
    db $F5 
    dw $3A28,$01E9 
    db $07 
    dw $3A28 

EnemyProjSpritemaps_DustCloud_Explosion_D:
    dw $0004,$0016 
    db $F9 
    dw $7A28,$0010 
    db $0B 
    dw $7A28,$01E2 
    db $F9 
    dw $3A28,$01E8 
    db $0B 
    dw $3A28 

EnemyProjSpritemaps_DustCloud_Explosion_E:
    dw $0004,$0017 
    db $03 
    dw $7A28,$0011 
    db $11 
    dw $7A28,$01E1 
    db $03 
    dw $3A28,$01E7 
    db $11 
    dw $3A28 

EnemyProjSpritemaps_DustCloud_Explosion_F:
    dw $0004,$0018 
    db $0A 
    dw $7A28,$0012 
    db $18 
    dw $7A28,$01E0 
    db $0A 
    dw $3A28,$01E6 
    db $18 
    dw $3A28 

EnemyProjSpritemaps_Common_BigDustCloud_0:
    dw $0001,$01F7 
    db $F7 
    dw $3A48 

EnemyProjSpritemaps_Common_BigDustCloud_1:
    dw $0002,$0001 
    db $01 
    dw $3A48,$81F3 
    db $F3 
    dw $3A7C 

EnemyProjSpritemaps_Common_BigDustCloud_2:
    dw $0003,$81FD 
    db $FD 
    dw $3A7C,$01F7 
    db $01 
    dw $3A48,$81F3 
    db $F3 
    dw $3A7E 

EnemyProjSpritemaps_Common_BigDustCloud_3:
    dw $0004,$0001 
    db $F7 
    dw $3A48,$81FD 
    db $FD 
    dw $3A7E,$81F3 
    db $FD 
    dw $3A7C,$81F3 
    db $F3 
    dw $3A9A 

EnemyProjSpritemaps_DustCloud_Explosion_10:
    dw $0004,$81FD 
    db $F3 
    dw $3A7C,$81FD 
    db $FD 
    dw $3A9A,$81F3 
    db $FD 
    dw $3A7E,$81F3 
    db $F3 
    dw $3A9C 

EnemyProjSpritemaps_DustCloud_Explosion_11:
    dw $0003,$81FD 
    db $F3 
    dw $3A7E,$81FD 
    db $FD 
    dw $3A9C,$81F3 
    db $FD 
    dw $3A9A 

EnemyProjSpritemaps_DustCloud_Explosion_12:
    dw $0002,$81FD 
    db $F3 
    dw $3A9A,$81F3 
    db $FD 
    dw $3A9C 

EnemyProjSpritemaps_DustCloud_Explosion_13:
    dw $0001,$81FD 
    db $F3 
    dw $3A9C 

EnemyProjSpritemaps_DustCloud_Explosion_14:
    dw $0001,$01FC 
    db $FC 
    dw $3A6B 

EnemyProjSpritemaps_DustCloud_Explosion_15:
    dw $0001,$01FC 
    db $FC 
    dw $3A6C 

EnemyProjSpritemaps_DustCloud_Explosion_16:
    dw $0002,$01F8 
    db $FC 
    dw $3A6B,$0000 
    db $FC 
    dw $3A6B 

EnemyProjSpritemaps_DustCloud_Explosion_17:
    dw $0002,$01F8 
    db $FC 
    dw $3A6C,$0000 
    db $FC 
    dw $3A6C 

EnemyProjSpritemaps_DustCloud_Explosion_18:
    dw $0003,$01F4 
    db $FC 
    dw $3A6C,$0004 
    db $FC 
    dw $3A6C,$01FC 
    db $FC 
    dw $3A6C 

EnemyProjSpritemaps_DustCloud_Explosion_19:
    dw $0003,$0004 
    db $FC 
    dw $3A6B,$01F4 
    db $FC 
    dw $3A6B,$01FC 
    db $FC 
    dw $3A6B 

EnemyProjSpritemaps_DustCloud_Explosion_1A:
    dw $0004,$0008 
    db $FC 
    dw $3A6C,$0000 
    db $FC 
    dw $3A6C,$01F8 
    db $FC 
    dw $3A6C,$01F0 
    db $FC 
    dw $3A6C 

EnemyProjSpritemaps_DustCloud_Explosion_1B:
    dw $0004,$0008 
    db $FC 
    dw $3A6B,$0000 
    db $FC 
    dw $3A6B,$01F8 
    db $FC 
    dw $3A6B,$01F0 
    db $FC 
    dw $3A6B 

EnemyProjSpritemaps_DustCloud_Explosion_1C:
    dw $0001,$01FC 
    db $FC 
    dw $3A25 

EnemyProjSpritemaps_DustCloud_Explosion_1D:
    dw $0003,$0000 
    db $F8 
    dw $3A25,$01FA 
    db $F6 
    dw $3A25,$01FC 
    db $FB 
    dw $3A25 

EnemyProjSpritemaps_DustCloud_Explosion_1E:
    dw $0003,$0001 
    db $F7 
    dw $3A25,$01F9 
    db $F4 
    dw $3A25,$01FB 
    db $FA 
    dw $3A25 

EnemyProjSpritemaps_DustCloud_Explosion_1F:
    dw $0003,$0001 
    db $F5 
    dw $3A43,$01FC 
    db $F8 
    dw $3A43,$01FA 
    db $F1 
    dw $3A43 

EnemyProjSpritemaps_DustCloud_Explosion_20:
    dw $0003,$0001 
    db $F3 
    dw $3A43,$01FC 
    db $F5 
    dw $3A43,$01FA 
    db $EE 
    dw $3A43 

EnemyProjSpritemaps_DustCloud_Explosion_21:
    dw $0003,$0000 
    db $F0 
    dw $3A40,$01FC 
    db $F4 
    dw $3A40,$01FA 
    db $ED 
    dw $3A40 

EnemyProjSpritemaps_DustCloud_Explosion_22:
    dw $0003,$0000 
    db $EE 
    dw $3A40,$01FC 
    db $F2 
    dw $3A40,$01FA 
    db $EC 
    dw $3A40 

EnemyProjSpritemaps_DustCloud_Explosion_23:
    dw $0002,$0000 
    db $EC 
    dw $3A40,$01FC 
    db $F0 
    dw $3A40 

EnemyProjSpritemaps_DustCloud_Explosion_24:
    dw $0001,$01FC 
    db $EE 
    dw $3A40 

EnemyProjSpritemaps_DustCloud_Explosion_25:
    dw $0004,$0008 
    db $E0 
    dw $3A6F,$0000 
    db $E0 
    dw $3A6F,$01F8 
    db $E0 
    dw $3A6F,$01F0 
    db $E0 
    dw $3A6F 

EnemyProjSpritemaps_DustCloud_Explosion_26:
    dw $0004,$0008 
    db $E8 
    dw $3A6F,$0000 
    db $E8 
    dw $3A6F,$01F8 
    db $E8 
    dw $3A6F,$01F0 
    db $E8 
    dw $3A6F 

EnemyProjSpritemaps_DustCloud_Explosion_27:
    dw $0004,$0008 
    db $F0 
    dw $3A6F,$0000 
    db $F0 
    dw $3A6F,$01F8 
    db $F0 
    dw $3A6F,$01F0 
    db $F0 
    dw $3A6F 

EnemyProjSpritemaps_DustCloud_Explosion_28:
    dw $0004,$0008 
    db $F8 
    dw $3A6F,$0000 
    db $F8 
    dw $3A6F,$01F8 
    db $F8 
    dw $3A6F,$01F0 
    db $F8 
    dw $3A6F 

EnemyProjSpritemaps_DustCloud_Explosion_29:
    dw $0004,$0008 
    db $00 
    dw $3A6F,$0000 
    db $00 
    dw $3A6F,$01F8 
    db $00 
    dw $3A6F,$01F0 
    db $00 
    dw $3A6F 

EnemyProjSpritemaps_DustCloud_Explosion_2A:
    dw $0004,$0008 
    db $08 
    dw $3A6F,$0000 
    db $08 
    dw $3A6F,$01F8 
    db $08 
    dw $3A6F,$01F0 
    db $08 
    dw $3A6F 

EnemyProjSpritemaps_DustCloud_Explosion_2B:
    dw $0004,$0008 
    db $10 
    dw $3A6F,$0000 
    db $10 
    dw $3A6F,$01F8 
    db $10 
    dw $3A6F,$01F0 
    db $10 
    dw $3A6F 

EnemyProjSpritemaps_DustCloud_Explosion_2C:
    dw $0004,$0008 
    db $18 
    dw $3A6F,$0000 
    db $18 
    dw $3A6F,$01F8 
    db $18 
    dw $3A6F,$01F0 
    db $18 
    dw $3A6F 

EnemyProjSpritemaps_DustCloud_Explosion_2D:
    dw $0002,$0000 
    db $FC 
    dw $3ABF,$01F8 
    db $FC 
    dw $3ABE 

EnemyProjSpritemaps_DustCloud_Explosion_2E:
    dw $0001,$81F8 
    db $F8 
    dw $3ABE 

EnemyProjSpritemaps_DustCloud_Explosion_2F:
    dw $0002,$81F8 
    db $FC 
    dw $3ABE,$81F8 
    db $F4 
    dw $3ABE 

EnemyProjSpritemaps_DustCloud_Explosion_30:
    dw $0002,$81F8 
    db $00 
    dw $3ABE,$81F8 
    db $F0 
    dw $3ABE 

EnemyProjSpritemaps_DustCloud_Explosion_31:
    dw $0003,$81F8 
    db $04 
    dw $3ABE,$81F8 
    db $F8 
    dw $3ABE,$81F8 
    db $EC 
    dw $3ABE 

EnemyProjSpritemaps_DustCloud_Explosion_32:
    dw $0003,$81F8 
    db $08 
    dw $3ABE,$81F8 
    db $F8 
    dw $3ABE,$81F8 
    db $E8 
    dw $3ABE 

EnemyProjSpritemaps_DustCloud_Explosion_33:
    dw $0004,$81F8 
    db $0C 
    dw $3ABE,$81F8 
    db $00 
    dw $3ABE,$81F8 
    db $F0 
    dw $3ABE,$81F8 
    db $E4 
    dw $3ABE 

EnemyProjSpritemaps_DustCloud_Explosion_34:
    dw $0004,$81F8 
    db $10 
    dw $3ABE,$81F8 
    db $00 
    dw $3ABE,$81F8 
    db $F0 
    dw $3ABE,$81F8 
    db $E0 
    dw $3ABE 

EnemyProjSpritemaps_DustCloud_Explosion_35:
    dw $0001,$01FC 
    db $FC 
    dw $3C53 

EnemyProjSpritemaps_DustCloud_Explosion_36:
    dw $0001,$01FC 
    db $FC 
    dw $3C52 

EnemyProjSpritemaps_DustCloud_Explosion_37:
    dw $0001,$01FC 
    db $FC 
    dw $3C51 

EnemyProjSpritemaps_DustCloud_Explosion_38:
    dw $0004,$01F8 
    db $00 
    dw $BC50,$0000 
    db $00 
    dw $FC50,$0000 
    db $F8 
    dw $7C50,$01F8 
    db $F8 
    dw $3C50 

EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_0:
    dw $0003,$0000 
    db $0C 
    dw $3A5B,$0008 
    db $EC 
    dw $3A5B,$01F0 
    db $F4 
    dw $3A5B 

EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_1:
    dw $0003,$01FD 
    db $0A 
    dw $3A5C,$0006 
    db $EE 
    dw $3A5C,$01F2 
    db $F6 
    dw $3A5C 

EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_2:
    dw $0003,$01FC 
    db $08 
    dw $3A5C,$0004 
    db $F0 
    dw $3A5C,$01F4 
    db $F8 
    dw $3A5C 

EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_3:
    dw $0003,$0002 
    db $F2 
    dw $3A5D,$01FB 
    db $06 
    dw $3A5D,$01F6 
    db $FA 
    dw $3A5D 

EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_4:
    dw $0003,$01FB 
    db $04 
    dw $3A5D,$01F8 
    db $FB 
    dw $3A5D,$0000 
    db $F4 
    dw $3A5D 

EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_5:
    dw $0003,$01FB 
    db $02 
    dw $3A5D,$01FA 
    db $FA 
    dw $3A5D,$0000 
    db $F6 
    dw $3A5D 

EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_6:
    dw $0003,$0000 
    db $EC 
    dw $BA5B,$0008 
    db $0C 
    dw $BA5B,$01F0 
    db $04 
    dw $BA5B 

EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_7:
    dw $0003,$01FE 
    db $EE 
    dw $BA5C,$0006 
    db $0A 
    dw $BA5C,$01F2 
    db $02 
    dw $BA5C 

EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_8:
    dw $0003,$0004 
    db $08 
    dw $BA5C,$01F4 
    db $00 
    dw $BA5C,$01FD 
    db $F0 
    dw $BA5C 

EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_9:
    dw $0003,$0002 
    db $06 
    dw $BA5D,$01FC 
    db $F2 
    dw $BA5D,$01F6 
    db $FE 
    dw $BA5D 

EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_A:
    dw $0003,$01FC 
    db $F4 
    dw $BA5D,$01F8 
    db $FC 
    dw $BA5D,$0000 
    db $04 
    dw $BA5D 

EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_B:
    dw $0003,$01FC 
    db $F6 
    dw $BA5D,$01FA 
    db $FD 
    dw $BA5D,$0000 
    db $02 
    dw $BA5D 

EnemyProjSpritemaps_Common_SmallExplosion_0:
    dw $0001,$01FC 
    db $FC 
    dw $3A5F 

EnemyProjSpritemaps_Common_SmallExplosion_1:
    dw $0004,$0000 
    db $00 
    dw $FA8A,$01F8 
    db $00 
    dw $BA8A,$0000 
    db $F8 
    dw $7A8A,$01F8 
    db $F8 
    dw $3A8A 

EnemyProjSpritemaps_Common_SmallExplosion_2:
    dw $0004,$8000 
    db $00 
    dw $FA90,$81F0 
    db $00 
    dw $BA90,$8000 
    db $F0 
    dw $7A90,$81F0 
    db $F0 
    dw $3A90 

EnemyProjSpritemaps_Common_SmallExplosion_3:
    dw $0004,$8000 
    db $00 
    dw $FA92,$81F0 
    db $00 
    dw $BA92,$8000 
    db $F0 
    dw $7A92,$81F0 
    db $F0 
    dw $3A92 

EnemyProjSpritemaps_Common_SmallExplosion_4:
    dw $0004,$8000 
    db $00 
    dw $FA94,$81F0 
    db $00 
    dw $BA94,$8000 
    db $F0 
    dw $7A94,$81F0 
    db $F0 
    dw $3A94 

EnemyProjSpritemaps_Common_SmallExplosion_5:
    dw $0004,$8000 
    db $00 
    dw $FA96,$81F0 
    db $00 
    dw $BA96,$8000 
    db $F0 
    dw $7A96,$81F0 
    db $F0 
    dw $3A96 

EnemyProjSpritemaps_DustCloud_Explosion_39:
    dw $0004,$0000 
    db $00 
    dw $FA8B,$01F8 
    db $00 
    dw $BA8B,$0000 
    db $F8 
    dw $7A8B,$01F8 
    db $F8 
    dw $3A8B 

EnemyProjSpritemaps_DustCloud_Explosion_3A:
    dw $0004,$0000 
    db $00 
    dw $FA7A,$01F8 
    db $00 
    dw $BA7A,$0000 
    db $F8 
    dw $7A7A,$01F8 
    db $F8 
    dw $3A7A 

EnemyProjSpritemaps_DustCloud_Explosion_3B:
    dw $0004,$8000 
    db $00 
    dw $FA70,$81F0 
    db $00 
    dw $BA70,$8000 
    db $F0 
    dw $7A70,$81F0 
    db $F0 
    dw $3A70 

EnemyProjSpritemaps_DustCloud_Explosion_3C:
    dw $0004,$8000 
    db $00 
    dw $FA72,$81F0 
    db $00 
    dw $BA72,$8000 
    db $F0 
    dw $7A72,$81F0 
    db $F0 
    dw $3A72 

EnemyProjSpritemaps_DustCloud_Explosion_3D:
    dw $0004,$8000 
    db $00 
    dw $FA74,$81F0 
    db $00 
    dw $BA74,$8000 
    db $F0 
    dw $7A74,$81F0 
    db $F0 
    dw $3A74 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_8DB106:
    dw $0004,$01F8 
    db $00 
    dw $3A5E,$0000 
    db $00 
    dw $3A5E,$0000 
    db $F8 
    dw $3A5E,$01F8 
    db $F8 
    dw $3A5E 
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_DustCloud_Explosion_3E:
    dw $0001,$01FC 
    db $FC 
    dw $3C38 

EnemyProjSpritemaps_DustCloud_Explosion_3F:
    dw $0001,$01FC 
    db $FC 
    dw $3C39 

EnemyProjSpritemaps_DustCloud_Explosion_40:
    dw $0001,$01FC 
    db $FC 
    dw $3C3A 

EnemyProjSpritemaps_DustCloud_Explosion_41:
    dw $0001,$01FC 
    db $FC 
    dw $3C3B 

EnemyProjSpritemaps_DustCloud_Explosion_42:
    dw $0001,$01FC 
    db $FC 
    dw $3A26 

EnemyProjSpritemaps_DustCloud_Explosion_43:
    dw $0001,$01FC 
    db $FC 
    dw $3A27 

EnemyProjSpritemaps_DustCloud_Explosion_44:
    dw $0001,$01FC 
    db $FC 
    dw $3A7B 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_8DB14D:
    dw $0001,$01FC 
    db $FC 
    dw $3A5F 
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_DustCloud_Explosion_45:
    dw $0001,$01FC 
    db $FC 
    dw $3A53 

EnemyProjSpritemaps_DustCloud_Explosion_46:
    dw $0001,$01FC 
    db $FC 
    dw $3A51 

EnemyProjSpritemaps_DustCloud_Explosion_47:
    dw $0004,$0000 
    db $00 
    dw $FA60,$0000 
    db $F8 
    dw $7A60,$01F8 
    db $00 
    dw $BA60,$01F8 
    db $F8 
    dw $3A60 

EnemyProjSpritemaps_DustCloud_Explosion_48:
    dw $0004,$0000 
    db $00 
    dw $FA61,$0000 
    db $F8 
    dw $7A61,$01F8 
    db $00 
    dw $BA61,$01F8 
    db $F8 
    dw $3A61 

EnemyProjSpritemaps_DustCloud_Explosion_49:
    dw $0004,$0000 
    db $00 
    dw $FA62,$0000 
    db $F8 
    dw $7A62,$01F8 
    db $00 
    dw $BA62,$01F8 
    db $F8 
    dw $3A62 

EnemyProjSpritemaps_DustCloud_Explosion_4A:
    dw $0004,$0000 
    db $00 
    dw $FA63,$0000 
    db $F8 
    dw $7A63,$01F8 
    db $00 
    dw $BA63,$01F8 
    db $F8 
    dw $3A63 

EnemyProjSpritemaps_CeresElevatorPad_DustCloud_Explosion_0:
    dw $0004,$01F2 
    db $FC 
    dw $7A6C,$0006 
    db $FC 
    dw $7A6C,$0000 
    db $FC 
    dw $7A6C,$01F8 
    db $FC 
    dw $3A6C 

EnemyProjSpritemaps_CeresElevatorPad_DustCloud_Explosion_1:
    dw $0004,$0000 
    db $FC 
    dw $7A6E,$0008 
    db $FC 
    dw $7A6D,$01F8 
    db $FC 
    dw $3A6E,$01F0 
    db $FC 
    dw $3A6D 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_8DB1E6:
    dw $0004,$01F0 
    db $FE 
    dw $3A6F,$0008 
    db $FE 
    dw $3A6F,$0000 
    db $FE 
    dw $3A6F,$01F8 
    db $FE 
    dw $3A6F 
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_DustCloud_Explosion_4B:
    dw $0001,$81F8 
    db $F8 
    dw $3A7C 

EnemyProjSpritemaps_DustCloud_Explosion_4C:
    dw $0001,$81F8 
    db $F6 
    dw $3A7E 

EnemyProjSpritemaps_DustCloud_Explosion_4D:
    dw $0001,$81F8 
    db $F4 
    dw $3A9A 

EnemyProjSpritemaps_DustCloud_Explosion_4E:
    dw $0001,$81F8 
    db $F2 
    dw $3A9C 

EnemyProjSpritemaps_DustCloud_Explosion_4F:
    dw $0001,$01FC 
    db $FC 
    dw $3A48 

EnemyProjSpritemaps_DustCloud_Explosion_50:
    dw $0001,$01FC 
    db $FA 
    dw $3A49 

EnemyProjSpritemaps_DustCloud_Explosion_51:
    dw $0001,$01FC 
    db $F8 
    dw $3A4A 

EnemyProjSpritemaps_DustCloud_Explosion_52:
    dw $0001,$01FC 
    db $F6 
    dw $3A4B 

EnemyProjSpritemaps_DustCloud_Explosion_53:
    dw $0001,$01FC 
    db $FC 
    dw $3A2C 

EnemyProjSpritemaps_DustCloud_Explosion_54:
    dw $0001,$01FC 
    db $FC 
    dw $3A2D 

EnemyProjSpritemaps_DustCloud_Explosion_55:
    dw $0001,$01FC 
    db $FC 
    dw $3A2E 

EnemyProjSpritemaps_DustCloud_Explosion_56:
    dw $0001,$01FC 
    db $FC 
    dw $3A2F 

EnemyProjSpritemaps_Common_Smoke_0:
    dw $0001,$81F8 
    db $F6 
    dw $3A76 

EnemyProjSpritemaps_Common_Smoke_1:
    dw $0001,$81F8 
    db $F4 
    dw $3A78 

EnemyProjSpritemaps_Common_Smoke_2:
    dw $0001,$81F8 
    db $F2 
    dw $3A98 

EnemyProjSpritemaps_Common_Smoke_3:
    dw $0001,$81F8 
    db $F0 
    dw $3A9E 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_0_8DB26C:
    dw $0001,$01FC 
    db $FC 
    dw $3A25 

UNUSED_EnemyProjSpritemaps_1_8DB273:
    dw $0001,$01FC 
    db $FC 
    dw $3A43 
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_MotherBrainsTurretBullets:
    dw $0001,$01FC 
    db $FC 
    dw $3A40 

EnemyProjSpritemaps_DustCloud_Explosion_57:
    dw $0001,$01FC 
    db $FC 
    dw $3A3E 

EnemyProjSpritemaps_DustCloud_Explosion_58:
    dw $0001,$01FC 
    db $FC 
    dw $3A3D 

EnemyProjSpritemaps_DustCloud_Explosion_59:
    dw $0001,$01FC 
    db $FC 
    dw $3A41 

EnemyProjSpritemaps_DustCloud_Explosion_5A:
    dw $0001,$01FC 
    db $FC 
    dw $3A42 

EnemyProjSpritemaps_DustCloud_Explosion_5B:
    dw $0004,$0000 
    db $00 
    dw $FA44,$01F8 
    db $00 
    dw $BA44,$0000 
    db $F8 
    dw $7A44,$01F8 
    db $F8 
    dw $3A44 

EnemyProjSpritemaps_DustCloud_Explosion_5C:
    dw $0004,$0000 
    db $00 
    dw $FA45,$0000 
    db $F8 
    dw $7A45,$01F8 
    db $00 
    dw $BA45,$01F8 
    db $F8 
    dw $3A45 

EnemyProjSpritemaps_DustCloud_Explosion_5D:
    dw $0004,$01F8 
    db $00 
    dw $BA46,$0000 
    db $00 
    dw $FA46,$0000 
    db $F8 
    dw $7A46,$01F8 
    db $F8 
    dw $3A46 

EnemyProjSpritemaps_DustCloud_Explosion_5E:
    dw $0001,$01FC 
    db $FC 
    dw $3A42 

EnemyProjSpritemaps_DustCloud_Explosion_5F:
    dw $0001,$01FC 
    db $FC 
    dw $3A4C 

EnemyProjSpritemaps_DustCloud_Explosion_60:
    dw $0001,$01FC 
    db $FC 
    dw $3A4D 

EnemyProjSpritemaps_DustCloud_Explosion_61:
    dw $0001,$01FC 
    db $FC 
    dw $3A4E 

EnemyProjSpritemaps_DustCloud_Explosion_62:
    dw $0001,$01FC 
    db $FC 
    dw $3A4F 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_0_8DB302:
    dw $0002,$01FF 
    db $FC 
    dw $3A55,$01F7 
    db $FC 
    dw $3A54 

UNUSED_EnemyProjSpritemaps_1_8DB30E:
    dw $0003,$01FA 
    db $F5 
    dw $3A56,$0002 
    db $FD 
    dw $3A58,$01FA 
    db $FD 
    dw $3A57 

UNUSED_EnemyProjSpritemaps_2_8DB31F:
    dw $0002,$01FD 
    db $F7 
    dw $3A59,$01FD 
    db $FF 
    dw $3A5A 

UNUSED_EnemyProjSpritemaps_3_8DB32B:
    dw $0003,$01FE 
    db $F5 
    dw $7A56,$01F6 
    db $FD 
    dw $7A58,$01FE 
    db $FD 
    dw $7A57 

UNUSED_EnemyProjSpritemaps_4_8DB33C:
    dw $0002,$01F9 
    db $FC 
    dw $7A55,$0001 
    db $FC 
    dw $7A54 

UNUSED_EnemyProjSpritemaps_5_8DB348:
    dw $0003,$01FE 
    db $03 
    dw $FA56,$01F6 
    db $FB 
    dw $FA58,$01FE 
    db $FB 
    dw $FA57 

UNUSED_EnemyProjSpritemaps_6_8DB359:
    dw $0002,$01FD 
    db $01 
    dw $BA59,$01FD 
    db $F9 
    dw $BA5A 

UNUSED_EnemyProjSpritemaps_7_8DB365:
    dw $0003,$01FA 
    db $03 
    dw $BA56,$0002 
    db $FB 
    dw $BA58,$01FA 
    db $FB 
    dw $BA57 

UNUSED_EnemyProjSpritemaps_8_8DB376:
    dw $0002,$0000 
    db $FC 
    dw $3A65,$01F8 
    db $FC 
    dw $3A64 

UNUSED_EnemyProjSpritemaps_9_8DB382:
    dw $0003,$0002 
    db $FE 
    dw $3A68,$01FA 
    db $FE 
    dw $3A67,$01FA 
    db $F6 
    dw $3A66 

UNUSED_EnemyProjSpritemaps_A_8DB393:
    dw $0002,$01FC 
    db $F8 
    dw $3A69,$01FC 
    db $00 
    dw $3A6A 

UNUSED_EnemyProjSpritemaps_B_8DB39F:
    dw $0003,$01F6 
    db $FE 
    dw $7A68,$01FE 
    db $FE 
    dw $7A67,$01FE 
    db $F6 
    dw $7A66 

UNUSED_EnemyProjSpritemaps_C_8DB3B0:
    dw $0002,$01F8 
    db $FC 
    dw $7A65,$0000 
    db $FC 
    dw $7A64 

UNUSED_EnemyProjSpritemaps_D_8DB3BC:
    dw $0003,$01F6 
    db $FA 
    dw $FA68,$01FE 
    db $FA 
    dw $FA67,$01FE 
    db $02 
    dw $FA66 

UNUSED_EnemyProjSpritemaps_E_8DB3CD:
    dw $0002,$01FC 
    db $00 
    dw $BA69,$01FC 
    db $F8 
    dw $BA6A 

UNUSED_EnemyProjSpritemaps_F_8DB3D9:
    dw $0003,$0002 
    db $FA 
    dw $BA68,$01FA 
    db $FA 
    dw $BA67,$01FA 
    db $02 
    dw $BA66 
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_DustCloud_Explosion_63:
    dw $0001,$01FC 
    db $FC 
    dw $3A3C 

EnemyProjSpritemaps_DustCloud_Explosion_64:
    dw $0001,$01FC 
    db $FC 
    dw $3A3D 

EnemyProjSpritemaps_DustCloud_Explosion_65:
    dw $0001,$01FC 
    db $FC 
    dw $3A3E 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_8DB3FF:
    dw $0001,$01FC 
    db $FC 
    dw $3A3F 
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_Common_BigExplosion_0:
    dw $0004,$0000 
    db $00 
    dw $FA8A,$01F8 
    db $00 
    dw $BA8A,$0000 
    db $F8 
    dw $7A8A,$01F8 
    db $F8 
    dw $3A8A 

EnemyProjSpritemaps_Common_BigExplosion_1:
    dw $0004,$C200 
    db $00 
    dw $FA90,$C200 
    db $F0 
    dw $7A90,$C3F0 
    db $00 
    dw $BA90,$C3F0 
    db $F0 
    dw $3A90 

EnemyProjSpritemaps_Common_BigExplosion_2:
    dw $0004,$C200 
    db $00 
    dw $FA92,$C3F0 
    db $00 
    dw $BA92,$C200 
    db $F0 
    dw $7A92,$C3F0 
    db $F0 
    dw $3A92 

EnemyProjSpritemaps_Common_BigExplosion_3:
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

EnemyProjSpritemaps_Common_BigExplosion_4:
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

EnemyProjSpritemaps_Common_BigExplosion_5:
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

EnemyProjSpritemaps_DownwardsShotGate_0:
    dw $0001,$C200 
    db $00 
    dw $2ABE 

EnemyProjSpritemaps_DownwardsShotGate_1:
    dw $0002,$C200 
    db $00 
    dw $2ABE,$C200 
    db $F0 
    dw $2ABE 

EnemyProjSpritemaps_DownwardsShotGate_2:
    dw $0003,$C200 
    db $00 
    dw $2ABE,$C200 
    db $F0 
    dw $2ABE,$C200 
    db $E0 
    dw $2ABE 

EnemyProjSpritemaps_DownwardsShotGate_3:
    dw $0004,$C200 
    db $00 
    dw $2ABE,$C200 
    db $F0 
    dw $2ABE,$C200 
    db $E0 
    dw $2ABE,$C200 
    db $D0 
    dw $2ABE 

EnemyProjSpritemaps_UpwardsShotGate_0:
    dw $0001,$C200 
    db $FF 
    dw $2ABE 

EnemyProjSpritemaps_UpwardsShotGate_1:
    dw $0002,$C200 
    db $0F 
    dw $2ABE,$C200 
    db $FF 
    dw $2ABE 

EnemyProjSpritemaps_UpwardsShotGate_2:
    dw $0003,$C200 
    db $1F 
    dw $2ABE,$C200 
    db $0F 
    dw $2ABE,$C200 
    db $FF 
    dw $2ABE 

EnemyProjSpritemaps_UpwardsShotGate_3:
    dw $0004,$C200 
    db $2F 
    dw $2ABE,$C200 
    db $1F 
    dw $2ABE,$C200 
    db $0F 
    dw $2ABE,$C200 
    db $FF 
    dw $2ABE 

EnemyProjSpritemaps_SaveStationElectricity_0:
    dw $0004,$0008 
    db $E0 
    dw $7ACD,$0000 
    db $E0 
    dw $7A6F,$01F0 
    db $E0 
    dw $3ACD,$01F8 
    db $E0 
    dw $3A6F 

EnemyProjSpritemaps_SaveStationElectricity_1:
    dw $0004,$0008 
    db $E8 
    dw $7ACD,$0000 
    db $E8 
    dw $7A6F,$01F0 
    db $E8 
    dw $3ACD,$01F8 
    db $E8 
    dw $3A6F 

EnemyProjSpritemaps_SaveStationElectricity_2:
    dw $0004,$0008 
    db $F0 
    dw $7ACD,$0000 
    db $F0 
    dw $7A6F,$01F0 
    db $F0 
    dw $3ACD,$01F8 
    db $F0 
    dw $3A6F 

EnemyProjSpritemaps_SaveStationElectricity_3:
    dw $0004,$0008 
    db $F8 
    dw $7ACD,$0000 
    db $F8 
    dw $7A6F,$01F0 
    db $F8 
    dw $3ACD,$01F8 
    db $F8 
    dw $3A6F 

EnemyProjSpritemaps_SaveStationElectricity_4:
    dw $0004,$0008 
    db $00 
    dw $7ACD,$0000 
    db $00 
    dw $7A6F,$01F0 
    db $00 
    dw $3ACD,$01F8 
    db $00 
    dw $3A6F 

EnemyProjSpritemaps_SaveStationElectricity_5:
    dw $0004,$0008 
    db $08 
    dw $7ACD,$0000 
    db $08 
    dw $7A6F,$01F0 
    db $08 
    dw $3ACD,$01F8 
    db $08 
    dw $3A6F 

EnemyProjSpritemaps_SaveStationElectricity_6:
    dw $0004,$0008 
    db $10 
    dw $7ACD,$0000 
    db $10 
    dw $7A6F,$01F0 
    db $10 
    dw $3ACD,$01F8 
    db $10 
    dw $3A6F 

EnemyProjSpritemaps_SaveStationElectricity_7:
    dw $0004,$0008 
    db $18 
    dw $7ACD,$0000 
    db $18 
    dw $7A6F,$01F0 
    db $18 
    dw $3ACD,$01F8 
    db $18 
    dw $3A6F 

EnemyProjSpritemaps_BotwoonsBody_UpFacingLeft_0:
    dw $0001,$81F8 
    db $F8 
    dw $2128 

EnemyProjSpritemaps_BotwoonsBody_UpFacingLeft_1:
    dw $0001,$81F8 
    db $F8 
    dw $212A 

EnemyProjSpritemaps_BotwoonsBody_UpFacingLeft_2:
    dw $0001,$81F8 
    db $F8 
    dw $212C 

EnemyProjSpritemaps_BotwoonsBody_UpFacingLeft_3:
    dw $0001,$81F8 
    db $F8 
    dw $212E 

EnemyProjSpritemaps_BotwoonsBody_0:
    dw $0001,$81F8 
    db $F8 
    dw $2148 

EnemyProjSpritemaps_BotwoonsBody_1:
    dw $0001,$81F8 
    db $F8 
    dw $214A 

EnemyProjSpritemaps_BotwoonsBody_2:
    dw $0001,$81F8 
    db $F8 
    dw $214C 

EnemyProjSpritemaps_BotwoonsBody_3:
    dw $0001,$81F8 
    db $F8 
    dw $214E 

EnemyProjSpritemaps_BotwoonsBody_4:
    dw $0001,$81F8 
    db $F8 
    dw $2140 

EnemyProjSpritemaps_BotwoonsBody_5:
    dw $0001,$81F8 
    db $F8 
    dw $2142 

EnemyProjSpritemaps_BotwoonsBody_6:
    dw $0001,$81F8 
    db $F8 
    dw $2144 

EnemyProjSpritemaps_BotwoonsBody_7:
    dw $0001,$81F8 
    db $F8 
    dw $2146 

EnemyProjSpritemaps_BotwoonsBody_8:
    dw $0001,$81F8 
    db $F8 
    dw $2160 

EnemyProjSpritemaps_BotwoonsBody_9:
    dw $0001,$81F8 
    db $F8 
    dw $2162 

EnemyProjSpritemaps_BotwoonsBody_A:
    dw $0001,$81F8 
    db $F8 
    dw $2164 

EnemyProjSpritemaps_BotwoonsBody_B:
    dw $0001,$81F8 
    db $F8 
    dw $2166 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemap_BotwoonsBody_DownFacingLeft_8DB682:
    dw $0001,$81F8 
    db $F8 
    dw $2168 

UNUSED_EnemyProjSpritemap_BotwoonsBody_DownFacingLeft_8DB689:
    dw $0001,$81F8 
    db $F8 
    dw $216A 

UNUSED_EnemyProjSpritemap_BotwoonsBody_DownFacingLeft_8DB690:
    dw $0001,$81F8 
    db $F8 
    dw $216C 

UNUSED_EnemyProjSpritemap_BotwoonsBody_DownFacingLeft_8DB697:
    dw $0001,$81F8 
    db $F8 
    dw $216E 
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_BotwoonsBody_C:
    dw $0001,$81F8 
    db $F8 
    dw $6168 

EnemyProjSpritemaps_BotwoonsBody_D:
    dw $0001,$81F8 
    db $F8 
    dw $616A 

EnemyProjSpritemaps_BotwoonsBody_E:
    dw $0001,$81F8 
    db $F8 
    dw $616C 

EnemyProjSpritemaps_BotwoonsBody_F:
    dw $0001,$81F8 
    db $F8 
    dw $616E 

EnemyProjSpritemaps_BotwoonsBody_10:
    dw $0001,$81F8 
    db $F8 
    dw $6160 

EnemyProjSpritemaps_BotwoonsBody_11:
    dw $0001,$81F8 
    db $F8 
    dw $6162 

EnemyProjSpritemaps_BotwoonsBody_12:
    dw $0001,$81F8 
    db $F8 
    dw $6164 

EnemyProjSpritemaps_BotwoonsBody_13:
    dw $0001,$81F8 
    db $F8 
    dw $6166 

EnemyProjSpritemaps_BotwoonsBody_14:
    dw $0001,$81F8 
    db $F8 
    dw $6140 

EnemyProjSpritemaps_BotwoonsBody_15:
    dw $0001,$81F8 
    db $F8 
    dw $6142 

EnemyProjSpritemaps_BotwoonsBody_16:
    dw $0001,$81F8 
    db $F8 
    dw $6144 

EnemyProjSpritemaps_BotwoonsBody_17:
    dw $0001,$81F8 
    db $F8 
    dw $6146 

EnemyProjSpritemaps_BotwoonsBody_18:
    dw $0001,$81F8 
    db $F8 
    dw $6148 

EnemyProjSpritemaps_BotwoonsBody_19:
    dw $0001,$81F8 
    db $F8 
    dw $614A 

EnemyProjSpritemaps_BotwoonsBody_1A:
    dw $0001,$81F8 
    db $F8 
    dw $614C 

EnemyProjSpritemaps_BotwoonsBody_1B:
    dw $0001,$81F8 
    db $F8 
    dw $614E 

EnemyProjSpritemaps_BotwoonsBody_1C:
    dw $0001,$81F8 
    db $F8 
    dw $6128 

EnemyProjSpritemaps_BotwoonsBody_1D:
    dw $0001,$81F8 
    db $F8 
    dw $612A 

EnemyProjSpritemaps_BotwoonsBody_1E:
    dw $0001,$81F8 
    db $F8 
    dw $612C 

EnemyProjSpritemaps_BotwoonsBody_1F:
    dw $0001,$81F8 
    db $F8 
    dw $612E 

EnemyProjSpritemaps_BotwoonsBody_20:
    dw $0001,$81F8 
    db $F8 
    dw $21A4 

EnemyProjSpritemaps_BotwoonsBody_21:
    dw $0001,$81F8 
    db $F8 
    dw $21A2 

EnemyProjSpritemaps_BotwoonsBody_22:
    dw $0001,$81F8 
    db $F8 
    dw $21A0 

EnemyProjSpritemaps_BotwoonsBody_23:
    dw $0001,$81F8 
    db $F8 
    dw $A1A2 

EnemyProjSpritemaps_BotwoonsBody_24:
    dw $0001,$81F8 
    db $F8 
    dw $A1A4 

EnemyProjSpritemaps_BotwoonsBody_25:
    dw $0001,$81F8 
    db $F8 
    dw $E1A2 

EnemyProjSpritemaps_BotwoonsBody_26:
    dw $0001,$81F8 
    db $F8 
    dw $61A0 

EnemyProjSpritemaps_BotwoonsBody_27:
    dw $0001,$81F8 
    db $F8 
    dw $61A2 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_0_8DB762:
    dw $0001,$81F8 
    db $F8 
    dw $0128 

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_1_8DB769:
    dw $0001,$81F8 
    db $F8 
    dw $012A 

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_2_8DB770:
    dw $0001,$81F8 
    db $F8 
    dw $012C 

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_3_8DB777:
    dw $0001,$81F8 
    db $F8 
    dw $012E 

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_4_8DB77E:
    dw $0001,$81F8 
    db $F8 
    dw $0148 

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_5_8DB785:
    dw $0001,$81F8 
    db $F8 
    dw $014A 

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_6_8DB78C:
    dw $0001,$81F8 
    db $F8 
    dw $014C 

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_7_8DB793:
    dw $0001,$81F8 
    db $F8 
    dw $014E 

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_8_8DB79A:
    dw $0001,$81F8 
    db $F8 
    dw $0140 

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_9_8DB7A1:
    dw $0001,$81F8 
    db $F8 
    dw $0142 

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_A_8DB7A8:
    dw $0001,$81F8 
    db $F8 
    dw $0144 

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_B_8DB7AF:
    dw $0001,$81F8 
    db $F8 
    dw $0146 

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_C_8DB7B6:
    dw $0001,$81F8 
    db $F8 
    dw $0160 

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_D_8DB7BD:
    dw $0001,$81F8 
    db $F8 
    dw $0162 

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_E_8DB7C4:
    dw $0001,$81F8 
    db $F8 
    dw $0164 

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_F_8DB7CB:
    dw $0001,$81F8 
    db $F8 
    dw $0166 

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_10_8DB7D2:
    dw $0001,$81F8 
    db $F8 
    dw $0168 

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_11_8DB7D9:
    dw $0001,$81F8 
    db $F8 
    dw $016A 

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_12_8DB7E0:
    dw $0001,$81F8 
    db $F8 
    dw $016C 

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_13_8DB7E7:
    dw $0001,$81F8 
    db $F8 
    dw $016E 

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_14_8DB7EE:
    dw $0001,$81F8 
    db $F8 
    dw $4168 

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_15_8DB7F5:
    dw $0001,$81F8 
    db $F8 
    dw $416A 

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_16_8DB7FC:
    dw $0001,$81F8 
    db $F8 
    dw $416C 

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_17_8DB803:
    dw $0001,$81F8 
    db $F8 
    dw $416E 

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_18_8DB80A:
    dw $0001,$81F8 
    db $F8 
    dw $4160 

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_19_8DB811:
    dw $0001,$81F8 
    db $F8 
    dw $4162 

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_1A_8DB818:
    dw $0001,$81F8 
    db $F8 
    dw $4164 

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_1B_8DB81F:
    dw $0001,$81F8 
    db $F8 
    dw $4166 

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_1C_8DB826:
    dw $0001,$81F8 
    db $F8 
    dw $4140 

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_1D_8DB82D:
    dw $0001,$81F8 
    db $F8 
    dw $4142 

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_1E_8DB834:
    dw $0001,$81F8 
    db $F8 
    dw $4144 

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_1F_8DB83B:
    dw $0001,$81F8 
    db $F8 
    dw $4146 

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_20_8DB842:
    dw $0001,$81F8 
    db $F8 
    dw $4148 

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_21_8DB849:
    dw $0001,$81F8 
    db $F8 
    dw $414A 

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_22_8DB850:
    dw $0001,$81F8 
    db $F8 
    dw $414C 

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_23_8DB857:
    dw $0001,$81F8 
    db $F8 
    dw $414E 

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_24_8DB85E:
    dw $0001,$81F8 
    db $F8 
    dw $4128 

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_25_8DB865:
    dw $0001,$81F8 
    db $F8 
    dw $412A 

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_26_8DB86C:
    dw $0001,$81F8 
    db $F8 
    dw $412C 

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_27_8DB873:
    dw $0001,$81F8 
    db $F8 
    dw $412E 

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_28_8DB87A:
    dw $0001,$81F8 
    db $F8 
    dw $01A4 

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_29_8DB881:
    dw $0001,$81F8 
    db $F8 
    dw $01A2 

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_2A_8DB888:
    dw $0001,$81F8 
    db $F8 
    dw $01A0 

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_2B_8DB88F:
    dw $0001,$81F8 
    db $F8 
    dw $81A2 

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_2C_8DB896:
    dw $0001,$81F8 
    db $F8 
    dw $81A4 

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_2D_8DB89D:
    dw $0001,$81F8 
    db $F8 
    dw $C1A2 

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_2E_8DB8A4:
    dw $0001,$81F8 
    db $F8 
    dw $41A0 

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_2F_8DB8AB:
    dw $0001,$81F8 
    db $F8 
    dw $41A2 
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_BotwoonsBody_28:
    dw $0000 

EnemyProjSpritemaps_BotwoonsSpit_0:
    dw $0001,$01FC 
    db $FC 
    dw $33A8 

EnemyProjSpritemaps_BotwoonsSpit_1:
    dw $0001,$01FC 
    db $FC 
    dw $33A9 

EnemyProjSpritemaps_BotwoonsSpit_2:
    dw $0001,$01FC 
    db $FC 
    dw $33AA 

EnemyProjSpritemaps_BotwoonsSpit_3:
    dw $0001,$01FC 
    db $FC 
    dw $33AB 

EnemyProjSpritemaps_BotwoonsSpit_4:
    dw $0001,$01FC 
    db $FC 
    dw $33AC 

EnemyProjSpritemaps_YappingMawsBody_0:
    dw $0001,$81F8 
    db $F8 
    dw $210A 

EnemyProjSpritemaps_YappingMawsBody_1:
    dw $0001,$81F8 
    db $F8 
    dw $A10A 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_0_8DB8E5:
    dw $0003,$81F0 
    db $00 
    dw $3A76,$81F0 
    db $F0 
    dw $3A76,$8000 
    db $F8 
    dw $3A76 

UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_1_8DB8F6:
    dw $0003,$8004 
    db $F8 
    dw $7A78,$81EC 
    db $04 
    dw $FA78,$81EC 
    db $EC 
    dw $3A78 

UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_2_8DB907:
    dw $0007,$01EB 
    db $E2 
    dw $3A2B,$800C 
    db $F8 
    dw $7A98,$81E8 
    db $08 
    dw $BA98,$81E8 
    db $E8 
    dw $3A98,$000D 
    db $E2 
    dw $7A2B,$0003 
    db $03 
    dw $7A2B,$01F5 
    db $03 
    dw $3A2B 

UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_3_8DB92C:
    dw $0007,$01E5 
    db $DC 
    dw $3A2B,$8010 
    db $F8 
    dw $7A9E,$81E4 
    db $0C 
    dw $BA9E,$81E4 
    db $E4 
    dw $3A9E,$0013 
    db $DC 
    dw $7A2B,$0007 
    db $FD 
    dw $7A2B,$01F1 
    db $FD 
    dw $3A2B 

UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_4_8DB951:
    dw $0007,$01E3 
    db $DA 
    dw $3A2B,$81E0 
    db $E0 
    dw $3A9A,$8014 
    db $F8 
    dw $7A9A,$81E0 
    db $10 
    dw $BA9A,$0015 
    db $DA 
    dw $7A2B,$000B 
    db $FA 
    dw $7A2B,$01ED 
    db $FA 
    dw $3A2B 

UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_5_8DB976:
    dw $0007,$01E2 
    db $DA 
    dw $3A2B,$8018 
    db $F8 
    dw $7A9C,$81DC 
    db $14 
    dw $BA9C,$81DC 
    db $DC 
    dw $3A9C,$0016 
    db $DA 
    dw $7A2B,$000E 
    db $F9 
    dw $7A2B,$01EA 
    db $F9 
    dw $3A2B 

UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_6_8DB99B:
    dw $0004,$0018 
    db $DB 
    dw $7A2A,$0011 
    db $FC 
    dw $7A2A,$01E7 
    db $FC 
    dw $3A2A,$01E0 
    db $DB 
    dw $3A2A 

UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_7_8DB9B1:
    dw $0004,$001A 
    db $DC 
    dw $7A2A,$0012 
    db $FC 
    dw $7A2A,$01E6 
    db $FC 
    dw $3A2A,$01DE 
    db $DC 
    dw $3A2A 

UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_8_8DB9C7:
    dw $0004,$001C 
    db $DD 
    dw $7A29,$0013 
    db $FE 
    dw $7A29,$01E5 
    db $FE 
    dw $3A29,$01DC 
    db $DD 
    dw $3A29 

UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_9_8DB9DD:
    dw $0004,$001E 
    db $DE 
    dw $7A29,$0014 
    db $00 
    dw $7A29,$01E4 
    db $00 
    dw $3A29,$01DA 
    db $DE 
    dw $3A29 

UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_A_8DB9F3:
    dw $0004,$001F 
    db $E0 
    dw $7A28,$0015 
    db $02 
    dw $7A28,$01D9 
    db $E0 
    dw $3A28,$01E3 
    db $02 
    dw $3A28 

UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_B_8DBA09:
    dw $0004,$0020 
    db $E2 
    dw $7A28,$0016 
    db $04 
    dw $7A28,$01D8 
    db $E2 
    dw $3A28,$01E2 
    db $04 
    dw $3A28 

UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_C_8DBA1F:
    dw $0004,$0021 
    db $E9 
    dw $3A28,$0017 
    db $0B 
    dw $3A28,$01E1 
    db $0B 
    dw $3A28,$01D7 
    db $E9 
    dw $3A28 

UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_D_8DBA35:
    dw $0004,$0022 
    db $F1 
    dw $3A28,$0018 
    db $13 
    dw $3A28,$01E0 
    db $13 
    dw $3A28,$01D6 
    db $F1 
    dw $3A28 

UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_E_8DBA4B:
    dw $0004,$0023 
    db $FB 
    dw $3A28,$0019 
    db $19 
    dw $3A28,$01DF 
    db $19 
    dw $3A28,$01D5 
    db $FB 
    dw $3A28 

UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_F_8DBA61:
    dw $0004,$01D4 
    db $06 
    dw $3A28,$01DE 
    db $24 
    dw $3A28,$001A 
    db $24 
    dw $3A28,$0024 
    db $06 
    dw $3A28 

UNUSED_EnemyProjSpritemaps_0_8DBA77:
    dw $0001,$01F7 
    db $F7 
    dw $3A48 

UNUSED_EnemyProjSpritemaps_1_8DBA7E:
    dw $0002,$0001 
    db $01 
    dw $3A48,$81F3 
    db $F3 
    dw $3A7C 

UNUSED_EnemyProjSpritemaps_2_8DBA8A:
    dw $0003,$81FD 
    db $FD 
    dw $3A7C,$01F7 
    db $01 
    dw $3A48,$81F3 
    db $F3 
    dw $3A7E 

UNUSED_EnemyProjSpritemaps_3_8DBA9B:
    dw $0004,$0001 
    db $F7 
    dw $3A48,$81FD 
    db $FD 
    dw $3A7E,$81F3 
    db $FD 
    dw $3A7C,$81F3 
    db $F3 
    dw $3A9A 

UNUSED_EnemyProjSpritemaps_4_8DBAB1:
    dw $0004,$81FD 
    db $F3 
    dw $3A7C,$81FD 
    db $FD 
    dw $3A9A,$81F3 
    db $FD 
    dw $3A7E,$81F3 
    db $F3 
    dw $3A9C 

UNUSED_EnemyProjSpritemaps_5_8DBAC7:
    dw $0003,$81FD 
    db $F3 
    dw $3A7E,$81FD 
    db $FD 
    dw $3A9C,$81F3 
    db $FD 
    dw $3A9A 

UNUSED_EnemyProjSpritemaps_6_8DBAD8:
    dw $0002,$81FD 
    db $F3 
    dw $3A9A,$81F3 
    db $FD 
    dw $3A9C 

UNUSED_EnemyProjSpritemaps_7_8DBAE4:
    dw $0001,$81FD 
    db $F3 
    dw $3A9C 

UNUSED_EnemyProjSpritemaps_8_8DBAEB:
    dw $0001,$01FC 
    db $FC 
    dw $3A6B 

UNUSED_EnemyProjSpritemaps_9_8DBAF2:
    dw $0001,$01FC 
    db $FC 
    dw $3A6C 

UNUSED_EnemyProjSpritemaps_A_8DBAF9:
    dw $0002,$01F8 
    db $FC 
    dw $3A6B,$0000 
    db $FC 
    dw $3A6B 

UNUSED_EnemyProjSpritemaps_B_8DBB05:
    dw $0002,$01F8 
    db $FC 
    dw $3A6C,$0000 
    db $FC 
    dw $3A6C 

UNUSED_EnemyProjSpritemaps_C_8DBB11:
    dw $0003,$01F4 
    db $FC 
    dw $3A6C,$0004 
    db $FC 
    dw $3A6C,$01FC 
    db $FC 
    dw $3A6C 

UNUSED_EnemyProjSpritemaps_D_8DBB22:
    dw $0003,$0004 
    db $FC 
    dw $3A6B,$01F4 
    db $FC 
    dw $3A6B,$01FC 
    db $FC 
    dw $3A6B 

UNUSED_EnemyProjSpritemaps_E_8DBB33:
    dw $0004,$0008 
    db $FC 
    dw $3A6C,$0000 
    db $FC 
    dw $3A6C,$01F8 
    db $FC 
    dw $3A6C,$01F0 
    db $FC 
    dw $3A6C 

UNUSED_EnemyProjSpritemaps_F_8DBB49:
    dw $0004,$0008 
    db $FC 
    dw $3A6B,$0000 
    db $FC 
    dw $3A6B,$01F8 
    db $FC 
    dw $3A6B,$01F0 
    db $FC 
    dw $3A6B 

UNUSED_EnemyProjSpritemaps_10_8DBB5F:
    dw $0001,$01FC 
    db $FC 
    dw $3A25 

UNUSED_EnemyProjSpritemaps_11_8DBB66:
    dw $0003,$0000 
    db $F8 
    dw $3A25,$01FA 
    db $F6 
    dw $3A25,$01FC 
    db $FB 
    dw $3A25 

UNUSED_EnemyProjSpritemaps_12_8DBB77:
    dw $0003,$0001 
    db $F7 
    dw $3A25,$01F9 
    db $F4 
    dw $3A25,$01FB 
    db $FA 
    dw $3A25 

UNUSED_EnemyProjSpritemaps_13_8DBB88:
    dw $0003,$0001 
    db $F5 
    dw $3A43,$01FC 
    db $F8 
    dw $3A43,$01FA 
    db $F1 
    dw $3A43 

UNUSED_EnemyProjSpritemaps_14_8DBB99:
    dw $0003,$0001 
    db $F3 
    dw $3A43,$01FC 
    db $F5 
    dw $3A43,$01FA 
    db $EE 
    dw $3A43 

UNUSED_EnemyProjSpritemaps_15_8DBBAA:
    dw $0003,$0000 
    db $F0 
    dw $3A40,$01FC 
    db $F4 
    dw $3A40,$01FA 
    db $ED 
    dw $3A40 

UNUSED_EnemyProjSpritemaps_16_8DBBBB:
    dw $0003,$0000 
    db $EE 
    dw $3A40,$01FC 
    db $F2 
    dw $3A40,$01FA 
    db $EC 
    dw $3A40 

UNUSED_EnemyProjSpritemaps_17_8DBBCC:
    dw $0002,$0000 
    db $EC 
    dw $3A40,$01FC 
    db $F0 
    dw $3A40 

UNUSED_EnemyProjSpritemaps_18_8DBBD8:
    dw $0001,$01FC 
    db $EE 
    dw $3A40 

UNUSED_EnemyProjSpritemaps_19_8DBBDF:
    dw $0004,$0008 
    db $E0 
    dw $3A6F,$0000 
    db $E0 
    dw $3A6F,$01F8 
    db $E0 
    dw $3A6F,$01F0 
    db $E0 
    dw $3A6F 

UNUSED_EnemyProjSpritemaps_1A_8DBBF5:
    dw $0004,$0008 
    db $E8 
    dw $3A6F,$0000 
    db $E8 
    dw $3A6F,$01F8 
    db $E8 
    dw $3A6F,$01F0 
    db $E8 
    dw $3A6F 

UNUSED_EnemyProjSpritemaps_1B_8DBC0B:
    dw $0004,$0008 
    db $F0 
    dw $3A6F,$0000 
    db $F0 
    dw $3A6F,$01F8 
    db $F0 
    dw $3A6F,$01F0 
    db $F0 
    dw $3A6F 

UNUSED_EnemyProjSpritemaps_1C_8DBC21:
    dw $0004,$0008 
    db $F8 
    dw $3A6F,$0000 
    db $F8 
    dw $3A6F,$01F8 
    db $F8 
    dw $3A6F,$01F0 
    db $F8 
    dw $3A6F 

UNUSED_EnemyProjSpritemaps_1D_8DBC37:
    dw $0004,$0008 
    db $00 
    dw $3A6F,$0000 
    db $00 
    dw $3A6F,$01F8 
    db $00 
    dw $3A6F,$01F0 
    db $00 
    dw $3A6F 

UNUSED_EnemyProjSpritemaps_1E_8DBC4D:
    dw $0004,$0008 
    db $08 
    dw $3A6F,$0000 
    db $08 
    dw $3A6F,$01F8 
    db $08 
    dw $3A6F,$01F0 
    db $08 
    dw $3A6F 

UNUSED_EnemyProjSpritemaps_1F_8DBC63:
    dw $0004,$0008 
    db $10 
    dw $3A6F,$0000 
    db $10 
    dw $3A6F,$01F8 
    db $10 
    dw $3A6F,$01F0 
    db $10 
    dw $3A6F 

UNUSED_EnemyProjSpritemaps_20_8DBC79:
    dw $0004,$0008 
    db $18 
    dw $3A6F,$0000 
    db $18 
    dw $3A6F,$01F8 
    db $18 
    dw $3A6F,$01F0 
    db $18 
    dw $3A6F 

UNUSED_EnemyProjSpritemaps_21_8DBC8F:
    dw $0002,$0000 
    db $FC 
    dw $3ABF,$01F8 
    db $FC 
    dw $3ABE 

UNUSED_EnemyProjSpritemaps_22_8DBC9B:
    dw $0001,$81F8 
    db $F8 
    dw $3ABE 

UNUSED_EnemyProjSpritemaps_23_8DBCA2:
    dw $0002,$81F8 
    db $FC 
    dw $3ABE,$81F8 
    db $F4 
    dw $3ABE 

UNUSED_EnemyProjSpritemaps_24_8DBCAE:
    dw $0002,$81F8 
    db $00 
    dw $3ABE,$81F8 
    db $F0 
    dw $3ABE 

UNUSED_EnemyProjSpritemaps_25_8DBCBA:
    dw $0003,$81F8 
    db $04 
    dw $3ABE,$81F8 
    db $F8 
    dw $3ABE,$81F8 
    db $EC 
    dw $3ABE 

UNUSED_EnemyProjSpritemaps_26_8DBCCB:
    dw $0003,$81F8 
    db $08 
    dw $3ABE,$81F8 
    db $F8 
    dw $3ABE,$81F8 
    db $E8 
    dw $3ABE 

UNUSED_EnemyProjSpritemaps_27_8DBCDC:
    dw $0004,$81F8 
    db $0C 
    dw $3ABE,$81F8 
    db $00 
    dw $3ABE,$81F8 
    db $F0 
    dw $3ABE,$81F8 
    db $E4 
    dw $3ABE 

UNUSED_EnemyProjSpritemaps_28_8DBCF2:
    dw $0004,$81F8 
    db $10 
    dw $3ABE,$81F8 
    db $00 
    dw $3ABE,$81F8 
    db $F0 
    dw $3ABE,$81F8 
    db $E0 
    dw $3ABE 

UNUSED_EnemyProjSpritemaps_29_8DBD08:
    dw $0001,$01FC 
    db $FC 
    dw $3C53 

UNUSED_EnemyProjSpritemaps_2A_8DBD0F:
    dw $0001,$01FC 
    db $FC 
    dw $3C52 

UNUSED_EnemyProjSpritemaps_2B_8DBD16:
    dw $0001,$01FC 
    db $FC 
    dw $3C51 

UNUSED_EnemyProjSpritemaps_2C_8DBD1D:
    dw $0004,$01F8 
    db $00 
    dw $BC50,$0000 
    db $00 
    dw $FC50,$0000 
    db $F8 
    dw $7C50,$01F8 
    db $F8 
    dw $3C50 

UNUSED_EnemyProjSpritemaps_2D_8DBD33:
    dw $0003,$0000 
    db $0C 
    dw $3A5B,$0008 
    db $EC 
    dw $3A5B,$01F0 
    db $F4 
    dw $3A5B 

UNUSED_EnemyProjSpritemaps_2E_8DBD44:
    dw $0003,$01FD 
    db $0A 
    dw $3A5C,$0006 
    db $EE 
    dw $3A5C,$01F2 
    db $F6 
    dw $3A5C 

UNUSED_EnemyProjSpritemaps_2F_8DBD55:
    dw $0003,$01FC 
    db $08 
    dw $3A5C,$0004 
    db $F0 
    dw $3A5C,$01F4 
    db $F8 
    dw $3A5C 

UNUSED_EnemyProjSpritemaps_30_8DBD66:
    dw $0003,$0002 
    db $F2 
    dw $3A5D,$01FB 
    db $06 
    dw $3A5D,$01F6 
    db $FA 
    dw $3A5D 

UNUSED_EnemyProjSpritemaps_31_8DBD77:
    dw $0003,$01FB 
    db $04 
    dw $3A5D,$01F8 
    db $FB 
    dw $3A5D,$0000 
    db $F4 
    dw $3A5D 

UNUSED_EnemyProjSpritemaps_32_8DBD88:
    dw $0003,$01FB 
    db $02 
    dw $3A5D,$01FA 
    db $FA 
    dw $3A5D,$0000 
    db $F6 
    dw $3A5D 

UNUSED_EnemyProjSpritemaps_33_8DBD99:
    dw $0003,$0000 
    db $EC 
    dw $BA5B,$0008 
    db $0C 
    dw $BA5B,$01F0 
    db $04 
    dw $BA5B 

UNUSED_EnemyProjSpritemaps_34_8DBDAA:
    dw $0003,$01FE 
    db $EE 
    dw $BA5C,$0006 
    db $0A 
    dw $BA5C,$01F2 
    db $02 
    dw $BA5C 

UNUSED_EnemyProjSpritemaps_35_8DBDBB:
    dw $0003,$0004 
    db $08 
    dw $BA5C,$01F4 
    db $00 
    dw $BA5C,$01FD 
    db $F0 
    dw $BA5C 

UNUSED_EnemyProjSpritemaps_36_8DBDCC:
    dw $0003,$0002 
    db $06 
    dw $BA5D,$01FC 
    db $F2 
    dw $BA5D,$01F6 
    db $FE 
    dw $BA5D 

UNUSED_EnemyProjSpritemaps_37_8DBDDD:
    dw $0003,$01FC 
    db $F4 
    dw $BA5D,$01F8 
    db $FC 
    dw $BA5D,$0000 
    db $04 
    dw $BA5D 

UNUSED_EnemyProjSpritemaps_38_8DBDEE:
    dw $0003,$01FC 
    db $F6 
    dw $BA5D,$01FA 
    db $FD 
    dw $BA5D,$0000 
    db $02 
    dw $BA5D 
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_EnemyDeathExplosion_0:
    dw $0001,$01FC 
    db $FC 
    dw $3A5F 

EnemyProjSpritemaps_EnemyDeathExplosion_1:
    dw $0004,$0000 
    db $00 
    dw $FA8A,$01F8 
    db $00 
    dw $BA8A,$0000 
    db $F8 
    dw $7A8A,$01F8 
    db $F8 
    dw $3A8A 

EnemyProjSpritemaps_EnemyDeathExplosion_2:
    dw $0004,$8000 
    db $00 
    dw $FA90,$81F0 
    db $00 
    dw $BA90,$8000 
    db $F0 
    dw $7A90,$81F0 
    db $F0 
    dw $3A90 

EnemyProjSpritemaps_EnemyDeathExplosion_3:
    dw $0004,$8000 
    db $00 
    dw $FA92,$81F0 
    db $00 
    dw $BA92,$8000 
    db $F0 
    dw $7A92,$81F0 
    db $F0 
    dw $3A92 

EnemyProjSpritemaps_EnemyDeathExplosion_4:
    dw $0004,$8000 
    db $00 
    dw $FA94,$81F0 
    db $00 
    dw $BA94,$8000 
    db $F0 
    dw $7A94,$81F0 
    db $F0 
    dw $3A94 

EnemyProjSpritemaps_EnemyDeathExplosion_5:
    dw $0004,$8000 
    db $00 
    dw $FA96,$81F0 
    db $00 
    dw $BA96,$8000 
    db $F0 
    dw $7A96,$81F0 
    db $F0 
    dw $3A96 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_0_8DBE74:
    dw $0004,$0000 
    db $00 
    dw $FA8B,$01F8 
    db $00 
    dw $BA8B,$0000 
    db $F8 
    dw $7A8B,$01F8 
    db $F8 
    dw $3A8B 

UNUSED_EnemyProjSpritemaps_1_8DBE8A:
    dw $0004,$0000 
    db $00 
    dw $FA7A,$01F8 
    db $00 
    dw $BA7A,$0000 
    db $F8 
    dw $7A7A,$01F8 
    db $F8 
    dw $3A7A 

UNUSED_EnemyProjSpritemaps_2_8DBEA0:
    dw $0004,$8000 
    db $00 
    dw $FA70,$81F0 
    db $00 
    dw $BA70,$8000 
    db $F0 
    dw $7A70,$81F0 
    db $F0 
    dw $3A70 

UNUSED_EnemyProjSpritemaps_3_8DBEB6:
    dw $0004,$8000 
    db $00 
    dw $FA72,$81F0 
    db $00 
    dw $BA72,$8000 
    db $F0 
    dw $7A72,$81F0 
    db $F0 
    dw $3A72 

UNUSED_EnemyProjSpritemaps_4_8DBECC:
    dw $0004,$8000 
    db $00 
    dw $FA74,$81F0 
    db $00 
    dw $BA74,$8000 
    db $F0 
    dw $7A74,$81F0 
    db $F0 
    dw $3A74 

UNUSED_EnemyProjSpritemaps_5_8DBEE2:
    dw $0004,$01F8 
    db $00 
    dw $3A5E,$0000 
    db $00 
    dw $3A5E,$0000 
    db $F8 
    dw $3A5E,$01F8 
    db $F8 
    dw $3A5E 

UNUSED_EnemyProjSpritemaps_6_8DBEF8:
    dw $0001,$01FC 
    db $FC 
    dw $3C38 

UNUSED_EnemyProjSpritemaps_7_8DBEFF:
    dw $0001,$01FC 
    db $FC 
    dw $3C39 

UNUSED_EnemyProjSpritemaps_8_8DBF06:
    dw $0001,$01FC 
    db $FC 
    dw $3C3A 

UNUSED_EnemyProjSpritemaps_9_8DBF0D:
    dw $0001,$01FC 
    db $FC 
    dw $3C3B 
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_0:
    dw $0001,$01FC 
    db $FC 
    dw $3A26 

EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_1:
    dw $0001,$01FC 
    db $FC 
    dw $3A27 

EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_2:
    dw $0001,$01FC 
    db $FC 
    dw $3A7B 

EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_3:
    dw $0001,$01FC 
    db $FC 
    dw $307B 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_0_8DBF30:
    dw $0001,$01FC 
    db $FC 
    dw $3A5F 

UNUSED_EnemyProjSpritemaps_1_8DBF37:
    dw $0001,$01FC 
    db $FC 
    dw $3C53 

UNUSED_EnemyProjSpritemaps_2_8DBF3E:
    dw $0001,$01FC 
    db $FC 
    dw $3C51 

UNUSED_EnemyProjSpritemaps_3_8DBF45:
    dw $0004,$0000 
    db $00 
    dw $FC60,$0000 
    db $F8 
    dw $7C60,$01F8 
    db $00 
    dw $BC60,$01F8 
    db $F8 
    dw $3C60 

UNUSED_EnemyProjSpritemaps_4_8DBF5B:
    dw $0004,$0000 
    db $00 
    dw $FC61,$0000 
    db $F8 
    dw $7C61,$01F8 
    db $00 
    dw $BC61,$01F8 
    db $F8 
    dw $3C61 

UNUSED_EnemyProjSpritemaps_5_8DBF71:
    dw $0004,$0000 
    db $00 
    dw $FC62,$0000 
    db $F8 
    dw $7C62,$01F8 
    db $00 
    dw $BC62,$01F8 
    db $F8 
    dw $3C62 

UNUSED_EnemyProjSpritemaps_6_8DBF87:
    dw $0004,$0000 
    db $00 
    dw $FC63,$0000 
    db $F8 
    dw $7C63,$01F8 
    db $00 
    dw $BC63,$01F8 
    db $F8 
    dw $3C63 

UNUSED_EnemyProjSpritemaps_7_8DBF9D:
    dw $0004,$01F2 
    db $FC 
    dw $7A6C,$0006 
    db $FC 
    dw $7A6C,$0000 
    db $FC 
    dw $7A6C,$01F8 
    db $FC 
    dw $3A6C 

UNUSED_EnemyProjSpritemaps_8_8DBFB3:
    dw $0004,$0000 
    db $FC 
    dw $7A6E,$0008 
    db $FC 
    dw $7A6D,$01F8 
    db $FC 
    dw $3A6E,$01F0 
    db $FC 
    dw $3A6D 

UNUSED_EnemyProjSpritemaps_9_8DBFC9:
    dw $0004,$01F0 
    db $FE 
    dw $3A6F,$0008 
    db $FE 
    dw $3A6F,$0000 
    db $FE 
    dw $3A6F,$01F8 
    db $FE 
    dw $3A6F 

UNUSED_EnemyProjSpritemaps_A_8DBFDF:
    dw $0001,$81F8 
    db $F8 
    dw $3A7C 

UNUSED_EnemyProjSpritemaps_B_8DBFE6:
    dw $0001,$81F8 
    db $F6 
    dw $3A7E 

UNUSED_EnemyProjSpritemaps_C_8DBFED:
    dw $0001,$81F8 
    db $F4 
    dw $3A9A 

UNUSED_EnemyProjSpritemaps_D_8DBFF4:
    dw $0001,$81F8 
    db $F2 
    dw $3A9C 

UNUSED_EnemyProjSpritemaps_E_8DBFFB:
    dw $0001,$01FC 
    db $FC 
    dw $3A48 

UNUSED_EnemyProjSpritemaps_F_8DC002:
    dw $0001,$01FC 
    db $FA 
    dw $3A49 

UNUSED_EnemyProjSpritemaps_10_8DC009:
    dw $0001,$01FC 
    db $F8 
    dw $3A4A 

UNUSED_EnemyProjSpritemaps_11_8DC010:
    dw $0001,$01FC 
    db $F6 
    dw $3A4B 

UNUSED_EnemyProjSpritemaps_12_8DC017:
    dw $0001,$01FC 
    db $FC 
    dw $3A2C 

UNUSED_EnemyProjSpritemaps_13_8DC01E:
    dw $0001,$01FC 
    db $FC 
    dw $3A2D 

UNUSED_EnemyProjSpritemaps_14_8DC025:
    dw $0001,$01FC 
    db $FC 
    dw $3A2E 

UNUSED_EnemyProjSpritemaps_15_8DC02C:
    dw $0001,$01FC 
    db $FC 
    dw $3A2F 

UNUSED_EnemyProjSpritemaps_16_8DC033:
    dw $0001,$81F8 
    db $F6 
    dw $3A76 

UNUSED_EnemyProjSpritemaps_17_8DC03A:
    dw $0001,$81F8 
    db $F4 
    dw $3A78 

UNUSED_EnemyProjSpritemaps_18_8DC041:
    dw $0001,$81F8 
    db $F2 
    dw $3A98 

UNUSED_EnemyProjSpritemaps_19_8DC048:
    dw $0001,$81F8 
    db $F0 
    dw $3A9E 

UNUSED_EnemyProjSpritemaps_1A_8DC04F:
    dw $0001,$01FC 
    db $FC 
    dw $3A25 

UNUSED_EnemyProjSpritemaps_1B_8DC056:
    dw $0001,$01FC 
    db $FC 
    dw $3A43 

UNUSED_EnemyProjSpritemaps_1C_8DC05D:
    dw $0001,$01FC 
    db $FC 
    dw $3A40 
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_4:
    dw $0001,$01FC 
    db $FC 
    dw $3A3E 

EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_5:
    dw $0001,$01FC 
    db $FC 
    dw $3A3D 

EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_6:
    dw $0001,$01FC 
    db $FC 
    dw $3A41 

EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_7:
    dw $0001,$01FC 
    db $FC 
    dw $3A42 

EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_8:
    dw $0004,$0000 
    db $00 
    dw $FA44,$01F8 
    db $00 
    dw $BA44,$0000 
    db $F8 
    dw $7A44,$01F8 
    db $F8 
    dw $3A44 

EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_9:
    dw $0004,$0000 
    db $00 
    dw $FA45,$0000 
    db $F8 
    dw $7A45,$01F8 
    db $00 
    dw $BA45,$01F8 
    db $F8 
    dw $3A45 

EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_A:
    dw $0004,$01F8 
    db $00 
    dw $BA46,$0000 
    db $00 
    dw $FA46,$0000 
    db $F8 
    dw $7A46,$01F8 
    db $F8 
    dw $3A46 

EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_B:
    dw $0001,$01FC 
    db $FC 
    dw $3A42 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_Pickup_Bombs_0_8DC0C9:
    dw $0001,$01FC 
    db $FC 
    dw $3A4C 

UNUSED_EnemyProjSpritemaps_Pickup_Bombs_1_8DC0D0:
    dw $0001,$01FC 
    db $FC 
    dw $3A4D 

UNUSED_EnemyProjSpritemaps_Pickup_Bombs_2_8DC0D7:
    dw $0001,$01FC 
    db $FC 
    dw $3A4E 

UNUSED_EnemyProjSpritemaps_Pickup_Bombs_3_8DC0DE:
    dw $0001,$01FC 
    db $FC 
    dw $3A4F 

UNUSED_EnemyProjSpritemaps_0_8DC0E5:
    dw $0002,$01FF 
    db $FC 
    dw $3A55,$01F7 
    db $FC 
    dw $3A54 

UNUSED_EnemyProjSpritemaps_1_8DC0F1:
    dw $0003,$01FA 
    db $F5 
    dw $3A56,$0002 
    db $FD 
    dw $3A58,$01FA 
    db $FD 
    dw $3A57 
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_C:
    dw $0002,$01FD 
    db $F7 
    dw $3A59,$01FD 
    db $FF 
    dw $3A5A 

EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_D:
    dw $0002,$01FD 
    db $F7 
    dw $3059,$01FD 
    db $FF 
    dw $305A 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_0_8DC11A:
    dw $0003,$01FE 
    db $F5 
    dw $7A56,$01F6 
    db $FD 
    dw $7A58,$01FE 
    db $FD 
    dw $7A57 

UNUSED_EnemyProjSpritemaps_1_8DC12B:
    dw $0002,$01F9 
    db $FC 
    dw $7A55,$0001 
    db $FC 
    dw $7A54 

UNUSED_EnemyProjSpritemaps_2_8DC137:
    dw $0003,$01FE 
    db $03 
    dw $FA56,$01F6 
    db $FB 
    dw $FA58,$01FE 
    db $FB 
    dw $FA57 

UNUSED_EnemyProjSpritemaps_3_8DC148:
    dw $0002,$01FD 
    db $01 
    dw $BA59,$01FD 
    db $F9 
    dw $BA5A 

UNUSED_EnemyProjSpritemaps_4_8DC154:
    dw $0003,$01FA 
    db $03 
    dw $BA56,$0002 
    db $FB 
    dw $BA58,$01FA 
    db $FB 
    dw $BA57 

UNUSED_EnemyProjSpritemaps_5_8DC165:
    dw $0002,$0000 
    db $FC 
    dw $3A65,$01F8 
    db $FC 
    dw $3A64 

UNUSED_EnemyProjSpritemaps_6_8DC171:
    dw $0003,$0002 
    db $FE 
    dw $3A68,$01FA 
    db $FE 
    dw $3A67,$01FA 
    db $F6 
    dw $3A66 
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_E:
    dw $0002,$01FC 
    db $F8 
    dw $3A69,$01FC 
    db $00 
    dw $3A6A 

EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_F:
    dw $0002,$01FC 
    db $F8 
    dw $3069,$01FC 
    db $00 
    dw $306A 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyProjSpritemaps_0_8DC19A:
    dw $0003,$01F6 
    db $FE 
    dw $7A68,$01FE 
    db $FE 
    dw $7A67,$01FE 
    db $F6 
    dw $7A66 

UNUSED_EnemyProjSpritemaps_1_8DC1AB:
    dw $0002,$01F8 
    db $FC 
    dw $7A65,$0000 
    db $FC 
    dw $7A64 

UNUSED_EnemyProjSpritemaps_2_8DC1B7:
    dw $0003,$01F6 
    db $FA 
    dw $FA68,$01FE 
    db $FA 
    dw $FA67,$01FE 
    db $02 
    dw $FA66 

UNUSED_EnemyProjSpritemaps_3_8DC1C8:
    dw $0002,$01FC 
    db $00 
    dw $BA69,$01FC 
    db $F8 
    dw $BA6A 

UNUSED_EnemyProjSpritemaps_4_8DC1D4:
    dw $0003,$0002 
    db $FA 
    dw $BA68,$01FA 
    db $FA 
    dw $BA67,$01FA 
    db $02 
    dw $BA66 

UNUSED_EnemyProjSpritemaps_5_8DC1E5:
    dw $0001,$01FC 
    db $FC 
    dw $3A3C 

UNUSED_EnemyProjSpritemaps_6_8DC1EC:
    dw $0001,$01FC 
    db $FC 
    dw $3A3D 

UNUSED_EnemyProjSpritemaps_7_8DC1F3:
    dw $0001,$01FC 
    db $FC 
    dw $3A3E 

UNUSED_EnemyProjSpritemaps_8_8DC1FA:
    dw $0001,$01FC 
    db $FC 
    dw $3A3F 

UNUSED_EnemyProjSpritemaps_9_8DC201:
    dw $0004,$0000 
    db $00 
    dw $FA8A,$01F8 
    db $00 
    dw $BA8A,$0000 
    db $F8 
    dw $7A8A,$01F8 
    db $F8 
    dw $3A8A 

UNUSED_EnemyProjSpritemaps_A_8DC217:
    dw $0004,$C200 
    db $00 
    dw $FA90,$C200 
    db $F0 
    dw $7A90,$C3F0 
    db $00 
    dw $BA90,$C3F0 
    db $F0 
    dw $3A90 

UNUSED_EnemyProjSpritemaps_B_8DC22D:
    dw $0004,$C200 
    db $00 
    dw $FA92,$C3F0 
    db $00 
    dw $BA92,$C200 
    db $F0 
    dw $7A92,$C3F0 
    db $F0 
    dw $3A92 

UNUSED_EnemyProjSpritemaps_C_8DC243:
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

UNUSED_EnemyProjSpritemaps_D_8DC281:
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

UNUSED_EnemyProjSpritemaps_E_8DC2AB:
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
endif ; !FEATURE_KEEP_UNREFERENCED

EnemyProjSpritemaps_EnemyDeathExplosion_6:
    dw $0004,$8000 
    db $00 
    dw $FA90,$81F0 
    db $00 
    dw $BA90,$8000 
    db $F0 
    dw $7A90,$81F0 
    db $F0 
    dw $3A90 

EnemyProjSpritemaps_EnemyDeathExplosion_7:
    dw $0008,$81EB 
    db $EB 
    dw $3A76,$81EB 
    db $05 
    dw $BA76,$8005 
    db $05 
    dw $FA76,$8006 
    db $EB 
    dw $7A76,$8000 
    db $00 
    dw $FA92,$81FF 
    db $F0 
    dw $7A92,$81F0 
    db $00 
    dw $BA92,$81F0 
    db $F0 
    dw $3A92 

EnemyProjSpritemaps_EnemyDeathExplosion_8:
    dw $0008,$8000 
    db $00 
    dw $FA94,$81F0 
    db $00 
    dw $BA94,$8000 
    db $F0 
    dw $7A94,$81F0 
    db $F0 
    dw $3A94,$81E2 
    db $E2 
    dw $3A78,$800E 
    db $E2 
    dw $7A78,$81E2 
    db $0E 
    dw $BA78,$800E 
    db $0E 
    dw $FA78 

EnemyProjSpritemaps_EnemyDeathExplosion_9:
    dw $0008,$8000 
    db $00 
    dw $FA96,$8000 
    db $F0 
    dw $7A96,$81F0 
    db $00 
    dw $BA96,$81F0 
    db $F0 
    dw $3A96,$8014 
    db $DC 
    dw $7A98,$81DC 
    db $DC 
    dw $3A98,$81DC 
    db $14 
    dw $BA98,$8014 
    db $14 
    dw $FA98 

EnemyProjSpritemaps_EnemyDeathExplosion_A:
    dw $0008,$01EF 
    db $FA 
    dw $3A2B,$0009 
    db $FA 
    dw $3A2B,$000C 
    db $EC 
    dw $3A2B,$01EC 
    db $EC 
    dw $3A2B,$81D8 
    db $D8 
    dw $3A9E,$81D8 
    db $18 
    dw $BA9E,$8018 
    db $18 
    dw $FA9E,$8018 
    db $D8 
    dw $7A9E 

EnemyProjSpritemaps_EnemyDeathExplosion_B:
    dw $0008,$81D6 
    db $D6 
    dw $3A9C,$801A 
    db $D6 
    dw $7A9C,$81D6 
    db $1A 
    dw $BA9C,$801A 
    db $1A 
    dw $FA9C,$0012 
    db $E8 
    dw $3A2B,$000C 
    db $F9 
    dw $3A2B,$01EC 
    db $F9 
    dw $3A2B,$01E6 
    db $E8 
    dw $3A2B 

EnemyProjSpritemaps_EnemyDeathExplosion_C:
    dw $0004,$0017 
    db $E7 
    dw $7A2A,$000D 
    db $FA 
    dw $7A2A,$01EB 
    db $FA 
    dw $3A2A,$01E1 
    db $E7 
    dw $3A2A 

EnemyProjSpritemaps_EnemyDeathExplosion_D:
    dw $0004,$001B 
    db $E8 
    dw $7A2A,$000E 
    db $FC 
    dw $7A2A,$01EA 
    db $FC 
    dw $3A2A,$01DD 
    db $E8 
    dw $3A2A 

EnemyProjSpritemaps_EnemyDeathExplosion_E:
    dw $0004,$001E 
    db $E9 
    dw $7A29,$000F 
    db $FE 
    dw $7A29,$01E9 
    db $FE 
    dw $3A29,$01DA 
    db $E9 
    dw $3A29 

EnemyProjSpritemaps_EnemyDeathExplosion_F:
    dw $0004,$0020 
    db $EA 
    dw $7A29,$0010 
    db $00 
    dw $7A29,$01E8 
    db $00 
    dw $3A29,$01D8 
    db $EA 
    dw $3A29 

EnemyProjSpritemaps_EnemyDeathExplosion_10:
    dw $0004,$0023 
    db $EC 
    dw $7A28,$0011 
    db $02 
    dw $7A28,$01D5 
    db $EC 
    dw $3A28,$01E7 
    db $02 
    dw $3A28 

EnemyProjSpritemaps_EnemyDeathExplosion_11:
    dw $0004,$0027 
    db $EE 
    dw $7A28,$0012 
    db $04 
    dw $7A28,$01D1 
    db $EE 
    dw $3A28,$01E6 
    db $04 
    dw $3A28 

EnemyProjSpritemaps_EnemyDeathExplosion_12:
    dw $0004,$0029 
    db $F1 
    dw $7A28,$0013 
    db $07 
    dw $7A28,$01CF 
    db $F1 
    dw $3A28,$01E5 
    db $07 
    dw $3A28 

EnemyProjSpritemaps_EnemyDeathExplosion_13:
    dw $0004,$002D 
    db $F5 
    dw $7A28,$0014 
    db $0B 
    dw $7A28,$01CB 
    db $F5 
    dw $3A28,$01E4 
    db $0B 
    dw $3A28 

EnemyProjSpritemaps_EnemyDeathExplosion_14:
    dw $0004,$0033 
    db $FF 
    dw $7A28,$0015 
    db $11 
    dw $7A28,$01C5 
    db $FF 
    dw $3A28,$01E3 
    db $11 
    dw $3A28 

EnemyProjSpritemaps_EnemyDeathExplosion_15:
    dw $0004,$0039 
    db $0A 
    dw $7A28,$0018 
    db $22 
    dw $7A28,$01BF 
    db $0A 
    dw $3A28,$01E0 
    db $22 
    dw $3A28 

EnemyProjSpritemaps_Sparks_0:
    dw $0001,$01FC 
    db $FC 
    dw $210B 

EnemyProjSpritemaps_Sparks_1:
    dw $0001,$01FC 
    db $FC 
    dw $210C 

EnemyProjSpritemaps_Sparks_2:
    dw $0001,$01FC 
    db $FC 
    dw $210D 

Enable_PaletteFXObjects:
    PHP 
    REP #$20 
    LDA.W #$8000 
    TSB.W $1E79 
    PLP 
    RTL 


Disable_PaletteFXObjects:
    PHP 
    REP #$20 
    LDA.W #$8000 
    TRB.W $1E79 
    PLP 
    RTL 


Clear_PaletteFXObjects:
    PHP 
    REP #$30 
    PHX 
    LDX.W #$000E 

.loop:
    STZ.W $1E7D,X 
    DEX #2
    BPL .loop 
    PLX 
    PLP 
    RTL 


Spawn_PaletteFXObject:
    PHP 
    PHB 
    PHX 
    PHK 
    PLB 
    LDX.W #$000E 

.loop:
    LDA.W $1E7D,X 
    BEQ .zero 
    DEX #2
    BPL .loop 
    PLX 
    PLB 
    PLP 
    SEC 
    RTL 


.zero:
    TYA 
    STA.W $1E7D,X 
    STZ.W $1E8D,X 
    LDA.W #RTS_8DC526 : STA.W $1EAD,X 
    LDA.W $0002,Y : STA.W $1EBD,X 
    LDA.W #$0001 : STA.W $1ECD,X 
    STZ.W $1EDD,X 
    TXA 
    TYX 
    TAY 
    JSR.W ($0000,X) 
    PLX 
    PLB 
    PLP 
    CLC 
    RTL 


RTS_8DC526:
    RTS 


PaletteFXObject_Handler:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    BIT.W $1E79 
    BPL .return 
    LDX.W #$000E 

.loop:
    STX.W $1E7B 
    LDA.W $1E7D,X 
    BEQ .next 
    JSR.W Process_PaleteFXObject 
    LDX.W $1E7B 

.next:
    DEX #2
    BPL .loop 

.return:
    PLB 
    PLP 
    RTL 


Process_PaleteFXObject:
    REP #$30 
    JSR.W ($1EAD,X) 
    LDX.W $1E7B 
    DEC.W $1ECD,X 
    BNE Process_PaleteFXObject_return 
    LDA.W $1EBD,X 
    TAY 

.loopDetermineColorIndex:
    LDA.W $0000,Y 
    BPL .timer 
    STA.B $12 
    INY #2
    PEA.W .loopDetermineColorIndex-1 
    JMP.W ($0012) 


.timer:
    STA.W $1ECD,X 
    LDA.W $1E8D,X 
    TAX 

.loopWriteColors:
    LDA.W $0002,Y 
    BPL .storeColor 
    STA.B $12 
    PEA.W .loopWriteColors-1 
    JMP.W ($0012) 


.storeColor:
    STA.L $7EC000,X 
    INX #2
    INY #2
    JMP.W .loopWriteColors 


Process_PaleteFXObject_done:
    LDX.W $1E7B 
    TYA 
    CLC : ADC.W #$0004 
    STA.W $1EBD,X 

Process_PaleteFXObject_return:
    RTS 


Instruction_PaletteFXObject_Done:
    PLA 
    JMP.W Process_PaleteFXObject_done 


Instruction_PaletteFXObject_ColorIndex_Plus4:
    TXA 
    CLC : ADC.W #$0004 
    TAX 
    INY #2
    RTS 


Instruction_PaletteFXObject_ColorIndex_Plus6:
    TXA 
    CLC : ADC.W #$0006 
    TAX 
    INY #2
    RTS 


Instruction_PaletteFXObject_ColorIndex_Plus8:
    TXA 
    CLC : ADC.W #$0008 
    TAX 
    INY #2
    RTS 


Instruction_PaletteFXObject_ColorIndex_Plus10:
    TXA 
    CLC : ADC.W #$0010 
    TAX 
    INY #2
    RTS 


Instruction_PaletteFXObject_ColorIndex_Plus12:
    TXA 
    CLC : ADC.W #$0012 
    TAX 
    INY #2
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_PaletteFXObject_ColorIndex_Plus1E_8DC5C6:
    TXA 
    CLC : ADC.W #$001E 
    TAX 
    INY #2
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_Delete_8DC5CF:
    STZ.W $1E7D,X 
    PLA 
    RTS 


Instruction_PaletteFXObject_PreInstructionInY:
    LDA.W $0000,Y : STA.W $1EAD,X 
    INY #2
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Inst_PaletteFXObject_ClearPreInstruction_8DC5DD:
    LDA.W #RTS_8DC5E3 : STA.W $1EAD,X 
endif ; !FEATURE_KEEP_UNREFERENCED

RTS_8DC5E3:
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Inst_PaletteFXObject_CallExternalFunctionInY_8DC5E4:
    LDA.W $0000,Y : STA.B $12 
    LDA.W $0001,Y : STA.B $13 
    PHY 
    JSL.L .externalFunction 
    PLY 
    LDX.W $1E7B 
    INY #3
    RTS 


.externalFunction:
    JML.W [$0012] 


UNUSED_Inst_PaletteFXObject_CallExternalFuncInYWithA_8DC5FE:
    LDA.W $0000,Y : STA.B $12 
    LDA.W $0001,Y : STA.B $13 
    LDA.W $0003,Y 
    PHY 
    JSL.L .externalFunction 
    PLY 
    LDX.W $1E7B 
    TYA 
    CLC : ADC.W #$0005 
    TAY 
    RTS 


.externalFunction:
    JML.W [$0012] 
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_PaletteFXObject_GotoY:
    LDA.W $0000,Y 
    TAY 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_PaletteFXObject_GotoYPlusY_8DC623:
    STY.B $12 
    DEY 
    LDA.W $0000,Y 
    XBA 
    BMI .highByte 
    AND.W #$00FF 
    BRA + 


.highByte:
    ORA.W #$FF00 

  + CLC : ADC.B $12 
    TAY 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero:
    DEC.W $1EDD,X 
    BNE Instruction_PaletteFXObject_GotoY 
    INY #2
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Inst_PaletteFXObject_DecTimer_GotoYIfNonZero_8DC641:
    DEC.W $1EDD,X 
    BNE UNUSED_Instruction_PaletteFXObject_GotoYPlusY_8DC623 
    INY 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_PaletteFXObject_TimerInY:
    SEP #$20 
    LDA.W $0000,Y : STA.W $1EDD,X 
    REP #$20 
    INY 
    RTS 


RTS_8DC654:
    RTS 


Instruction_PaletteFXObject_ColorIndexInY:
    LDA.W $0000,Y : STA.W $1E8D,X 
    INY #2
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_PaletteFXObject_QueueMusicTrackInY_8DC65E:
    LDA.W $0000,Y 
    AND.W #$00FF 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    INY 
    RTS 


UNUSED_Inst_PaletteFXObject_QueueSoundInY_Lib1_Max6_8DC66A:
    LDA.W $0000,Y 
    JSL.L QueueSound_Lib1_Max6 
    INY 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


UNUSED_Inst_PaletteFXObject_QueueSoundInY_Lib2_Max6_8DC673:
    LDA.W $0000,Y 
    JSL.L QueueSound_Lib2_Max6 
    INY 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Inst_PaletteFXObject_QueueSoundInY_Lib3_Max6_8DC67C:
    LDA.W $0000,Y 
    JSL.L QueueSound_Lib3_Max6 
    INY 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


RTS_8DC685:
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_8DC686:
; Looks like garbage data
    dw $1000,$C690,$C595,$C61E,$C686,$0180,$0000,$0000 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_PaletteFXObject_FadeInSuperMetroidTitleLogo:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0142 
    dw $0003
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $1084,$0084,$0064,$0064,$0044,$0024,$0004,$0004
    dw $0003,$0002,$0401,$0400,$0C63,$0421,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $2108,$0508,$00E8,$00C8,$0088,$0048,$0028,$0008
    dw $0006,$0405,$0803,$0C01,$18C6,$0C42,$0400
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $35AD,$05AD,$056D,$052D,$00CD,$008D,$004D,$000D
    dw $000A,$0407,$0C05,$1422,$2529,$1484,$0400
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $4631,$0A31,$05D1,$0591,$0531,$00B1,$0051,$0011
    dw $000D,$080A,$1026,$1823,$318C,$1CA5,$0800
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $5AD6,$0AD6,$0A56,$09F6,$0576,$00F6,$0076,$0016
    dw $0011,$080C,$1428,$2044,$3DEF,$24E7,$0800
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $6B5A,$0F5A,$0ADA,$0A5A,$05BA,$011A,$009A,$001A
    dw $0014,$0C0F,$182A,$2845,$4A52,$2D08,$0C00
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $7FFF,$13FF,$0F5F,$0EBF,$0A1F,$055F,$04BF,$001F
    dw $0018,$1032,$204C,$3066,$5AB5,$354A,$1000
    dw Instruction_PaletteFXObject_Done
    dw Instruction_Delete_8DC5CF

InstList_PaletteFXObject_FadeInNintendoBootLogo:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0132 

InstList_PaletteFXObject_Common_FadeInLogo:
    dw $0003 
    dw $0C63,$0C20
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $1CE7,$1C60
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $2D6B,$2C80
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $3DEF,$3CC0
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $4E73,$4CE0
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $5EF7,$5D20
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $6F7B,$6D40
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $7FFF,$7D80
    dw Instruction_PaletteFXObject_Done
    dw Instruction_Delete_8DC5CF

InstList_PaletteFXObject_FadeInNintendoCopyright:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0192 
    dw Instruction_PaletteFXObject_GotoY 
    dw InstList_PaletteFXObject_Common_FadeInLogo 

InstList_PaletteFXObject_TitleScreenBabyMetroidTubeLight_0:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0054 

InstList_PaletteFXObject_TitleScreenBabyMetroidTubeLight_1:
    dw $000A 
    dw $0113,$000F,$175C,$0299
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $00B0,$000C,$0AF9,$0236
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $006D,$0009,$0296,$01D3
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $000A,$0006,$0233,$0170
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $0007,$0003,$01D0,$010D
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $000A,$0006,$0233,$0170
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $006D,$0009,$0296,$01D3
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $00B0,$000C,$0AF9,$0236
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_TitleScreenBabyMetroidTubeLight_1

InstList_PaletteFXObject_TitleScreenFlickeringDisplays_0:
    dw Instruction_PaletteFXObject_ColorIndexInY,$005C 

InstList_PaletteFXObject_TitleScreenFlickeringDisplays_1:
    dw $0001 
    dw $13FF,$0BB1
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $00AC,$0145
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_TitleScreenFlickeringDisplays_1

InstList_PaletteFXObject_CutsceneGunshipEngineFlicker_0:
    dw Instruction_PaletteFXObject_ColorIndexInY,$00BE 

InstList_PaletteFXObject_CutsceneGunshipEngineFlicker_1:
    dw $0001 
    dw $7FFF
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $0000
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_CutsceneGunshipEngineFlicker_1

InstList_PaletteFXObject_CutsceneCeresNavigationLight_Sprite:
    dw Instruction_PaletteFXObject_ColorIndexInY,$01DA 

InstList_PaletteFXObject_Common_CeresNavigationLights:
    dw $0004 
    dw $001F,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $001B,$0004
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $0016,$0009
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $0012,$000D
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $000D,$0012
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $0009,$0016
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $0004,$001B
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $0000,$001F
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $0004,$001B
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $0009,$0016
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $000D,$0012
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $0012,$000D
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $0016,$0009
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $001B,$0004
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_Common_CeresNavigationLights

InstList_PaletteFXObject_CutsceneCeresNavigationLights_BG:
    dw Instruction_PaletteFXObject_ColorIndexInY,$00DA 
    dw Instruction_PaletteFXObject_GotoY 
    dw InstList_PaletteFXObject_Common_CeresNavigationLights 

InstList_PaletteFXObject_FadeInPlanetZebesText:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0102 
    dw $0003
    dw $0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $1084,$0C63,$0421
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $2529,$1CE7,$0C63
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $35AD,$294A,$1084
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $4A52,$39CE,$18C6
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $5AD6,$4631,$1CE7
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $6F7B,$56B5,$2529
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $7FFF,$6318,$294A
    dw Instruction_PaletteFXObject_Done
    dw Instruction_Delete_8DC5CF

InstList_PaletteFXObject_FadeOutPlanetZebesText:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0102 
    dw $0003
    dw $7FFF,$6318,$294A
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $6F7B,$56B5,$2529
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $5AD6,$4631,$1CE7
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $4A52,$39CE,$18C6
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $35AD,$294A,$1084
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $2529,$1CE7,$0C63
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $1084,$0C63,$0421
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw Instruction_Delete_8DC5CF

InstList_PaletteFXObject_OldMotherBrainFightBGLights_0:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0028 

InstList_PaletteFXObject_OldMotherBrainFightBGLights_1:
    dw $0006 
    dw $7FFF,$6318,$294A
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $6F7B,$56B5,$2529
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $5AD6,$4631,$1CE7
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $4A52,$39CE,$18C6
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $35AD,$294A,$1084
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $2529,$1CE7,$0C63
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $1084,$0C63,$0421
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $1084,$0C63,$0421
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $2529,$1CE7,$0C63
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $35AD,$294A,$1084
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $4A52,$39CE,$18C6
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $5AD6,$4631,$1CE7
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $6F7B,$56B5,$2529
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_OldMotherBrainFightBGLights_1

InstList_PaletteFXObject_GunshipGlow_0:
    dw Instruction_PaletteFXObject_ColorIndexInY,$01FE 

InstList_PaletteFXObject_GunshipGlow_1:
    dw $0005 
    dw $0000
    dw Instruction_PaletteFXObject_Done
    dw $0005
    dw $0402
    dw Instruction_PaletteFXObject_Done
    dw $0005
    dw $0404
    dw Instruction_PaletteFXObject_Done
    dw $0005
    dw $0806
    dw Instruction_PaletteFXObject_Done
    dw $0005
    dw $0C08
    dw Instruction_PaletteFXObject_Done
    dw $0005
    dw $0C0A
    dw Instruction_PaletteFXObject_Done
    dw $0005
    dw $100C
    dw Instruction_PaletteFXObject_Done
    dw $0005
    dw $180E
    dw Instruction_PaletteFXObject_Done
    dw $0005
    dw $100C
    dw Instruction_PaletteFXObject_Done
    dw $0005
    dw $0C0A
    dw Instruction_PaletteFXObject_Done
    dw $0005
    dw $0C08
    dw Instruction_PaletteFXObject_Done
    dw $0005
    dw $0806
    dw Instruction_PaletteFXObject_Done
    dw $0005
    dw $0404
    dw Instruction_PaletteFXObject_Done
    dw $0005
    dw $0402
    dw Instruction_PaletteFXObject_Done 
    dw Instruction_PaletteFXObject_GotoY 
    dw InstList_PaletteFXObject_GunshipGlow_1 

InstList_PaletteFXObject_FadeOutZoomedOutExplodingZebes:
    dw Instruction_PaletteFXObject_ColorIndexInY,$01E0 
    dw $0008
    dw $2003,$0E9A,$05F9,$0596,$0133,$008E,$0009,$0005
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $2003,$01F5,$0154,$00F0,$008E,$0009,$0004,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $0000,$0150,$00AF,$004B,$0009,$0004,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $0000,$00AB,$000A,$0006,$0004,$0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $0000,$0006,$0005,$0001,$0000,$0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $0000,$0001,$0000,$0000,$0000,$0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw Instruction_Delete_8DC5CF

InstList_PaletteFXObject_WidePartOfZebesExplosion_Foreground:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0002 
    dw $0004
    dw $7C00,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $7CA0,$7CA0,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $7DE0,$7DE0,$7DE0,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $003C
    dw $7DE0,$7DE0,$7DE0,$7DE0,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $7E80,$7E80,$7E80,$7E80,$7E80,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $7F20,$7F20,$7F20,$7F20,$7F20,$7F20,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $7FFD,$7FE9,$7FE9,$7FE9,$7FE9,$7FE9,$7FE9,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $7FFD,$7FFD,$7FF3,$7FF3,$7FF3,$7FF3,$7FF3,$7FE9,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $7FFD,$7FFD,$7FFD,$7FF8,$7FF8,$7FF8,$7FF8,$7FE9,$2940,$0000,$0000,$0000,$0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $7FFD,$7FFD,$7FFD,$7FFD,$7FFD,$7FFD,$7FF8,$7FF8,$7FE9,$2940,$0000,$0000,$0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FE9,$2940,$0000,$0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FE9,$2940,$0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FE9,$2940,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FE9,$2940,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FE9,$6B40
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FF7
    dw Instruction_PaletteFXObject_Done
    dw Instruction_Delete_8DC5CF

InstList_PaletteFXObject_ZebesExplosionFinale:
    dw Instruction_PaletteFXObject_ColorIndexInY 
    dw $0002
    dw $0002
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$77BD
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$77BD,$6F7B
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$77BD,$6F7B,$6318
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$77BD,$6F7B,$6318,$5AD6
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210,$35AD
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210,$35AD,$2D6B
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210,$35AD,$2D6B,$2529
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $7FFF,$7FFF,$7FFF,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210,$35AD,$2D6B,$2529,$1CE7
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $7FFF,$7FFF,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210,$35AD,$2D6B,$2529,$1CE7,$14A5
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $7FFF,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210,$35AD,$2D6B,$2529,$1CE7,$14A5,$0842
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210,$35AD,$2D6B,$2529,$1CE7,$14A5,$0842,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210,$35AD,$2D6B,$2529,$1CE7,$14A5,$0842,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $0000,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210,$35AD,$2D6B,$2529,$1CE7,$14A5,$0842
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $0842,$0000,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210,$35AD,$2D6B,$2529,$1CE7,$14A5
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $14A5,$0842,$0000,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210,$35AD,$2D6B,$2529,$1CE7
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $1CE7,$14A5,$0842,$0000,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210,$35AD,$2D6B,$2529
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $2529,$1CE7,$14A5,$0842,$0000,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210,$35AD,$2D6B
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $2D6B,$2529,$1CE7,$14A5,$0842,$0000,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210,$35AD
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $35AD,$2D6B,$2529,$1CE7,$14A5,$0842,$0000,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $4A52,$35AD,$2D6B,$2529,$1CE7,$14A5,$0842,$0000,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $5294,$4A52,$35AD,$2D6B,$2529,$1CE7,$14A5,$0842,$0000,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $5AD6,$5294,$4A52,$35AD,$2D6B,$2529,$1CE7,$14A5,$0842,$0000,$7FFF,$77BD,$6F7B,$6318,$5AD6
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $6318,$5AD6,$5294,$4A52,$35AD,$2D6B,$2529,$1CE7,$14A5,$0842,$0000,$7FFF,$77BD,$6F7B,$6318
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $6F7B,$6318,$5AD6,$5294,$4A52,$35AD,$2D6B,$2529,$1CE7,$14A5,$0842,$0000,$7FFF,$77BD,$6F7B
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$35AD,$2D6B,$2529,$1CE7,$14A5,$0842,$0000,$7FFF,$77BD
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$35AD,$2D6B,$2529,$1CE7,$14A5,$0842,$0000,$7FFF
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210,$35AD,$2D6B,$2529,$1CE7,$14A5,$0842,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $7FFF,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210,$35AD,$2D6B,$2529,$1CE7,$14A5,$0842
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $7FFF,$7FFF,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210,$35AD,$2D6B,$2529,$1CE7,$14A5
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $7FFF,$7FFF,$7FFF,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210,$35AD,$2D6B,$2529,$1CE7
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210,$35AD,$2D6B,$2529
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210,$35AD,$2D6B
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210,$35AD
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52,$4210
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$77BD,$6F7B,$6318,$5AD6
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$77BD,$6F7B,$6318
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$77BD,$6F7B
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$77BD
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF
    dw Instruction_PaletteFXObject_Done
    dw Instruction_Delete_8DC5CF

InstList_PaletteFXObject_WidePartOfZebesExplosion_Background:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0022 
    dw Instruction_PaletteFXObject_GotoY 
    dw InstList_PaletteFXObject_Common_ZebesExplosion 

InstList_PaletteFXObject_WhiteOutSpaceDuringZebesExplosion:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0000 

InstList_PaletteFXObject_Common_ZebesExplosion:
    dw $000E 
    dw $0000
    dw Instruction_PaletteFXObject_Done
    dw $000E
    dw $0842
    dw Instruction_PaletteFXObject_Done
    dw $000E
    dw $1084
    dw Instruction_PaletteFXObject_Done
    dw $000E
    dw $1CE7
    dw Instruction_PaletteFXObject_Done
    dw $000E
    dw $2529
    dw Instruction_PaletteFXObject_Done
    dw $000E
    dw $2D6B
    dw Instruction_PaletteFXObject_Done
    dw $000E
    dw $35AD
    dw Instruction_PaletteFXObject_Done
    dw $000E
    dw $3DEF
    dw Instruction_PaletteFXObject_Done
    dw $000E
    dw $4A52
    dw Instruction_PaletteFXObject_Done
    dw $000E
    dw $5294
    dw Instruction_PaletteFXObject_Done
    dw $000E
    dw $5AD6
    dw Instruction_PaletteFXObject_Done
    dw $000E
    dw $6318
    dw Instruction_PaletteFXObject_Done
    dw $000E
    dw $6B5A
    dw Instruction_PaletteFXObject_Done
    dw $000E
    dw $77BD
    dw Instruction_PaletteFXObject_Done
    dw $000E
    dw $7FFF
    dw Instruction_PaletteFXObject_Done
    dw Instruction_Delete_8DC5CF

InstList_PaletteFXObject_ZebesExplosionPlanetAfterGlow_0:
    dw Instruction_PaletteFXObject_ColorIndexInY,$01C2 

InstList_PaletteFXObject_ZebesExplosionPlanetAfterGlow_1:
    dw $0010 
    dw $6B9C,$5EBB,$49FA,$3D58,$2CD4,$408F,$288A,$1C47
    dw Instruction_PaletteFXObject_Done
    dw $0010
    dw $77FF,$6B1E,$565D,$49BB,$3516,$44B0,$288B,$1C48
    dw Instruction_PaletteFXObject_Done
    dw $0010
    dw $7FFF,$777F,$62BF,$561E,$3937,$48D1,$288C,$1C49
    dw Instruction_PaletteFXObject_Done
    dw $0010
    dw $7FFF,$7FDF,$7F7F,$6ABF,$3D58,$5113,$2CAE,$206B
    dw Instruction_PaletteFXObject_Done
    dw $0010
    dw $7FFF,$777F,$62BF,$561E,$3937,$48D1,$288C,$1C49
    dw Instruction_PaletteFXObject_Done
    dw $0010
    dw $77FF,$6B1E,$565D,$49BB,$3516,$44B0,$288B,$1C48
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_ZebesExplosionPlanetAfterGlow_1

InstList_PaletteFXObject_ExplodingZebesLava_0:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0080 

InstList_PaletteFXObject_ExplodingZebesLava_1:
    dw $0009 
    dw $0012
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $000F
    dw Instruction_PaletteFXObject_Done
    dw $0007
    dw $000C
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $0009
    dw Instruction_PaletteFXObject_Done
    dw $0005
    dw $0006
    dw Instruction_PaletteFXObject_Done
    dw $0005
    dw $0003
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $0006
    dw Instruction_PaletteFXObject_Done
    dw $0007
    dw $0009
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $000C
    dw Instruction_PaletteFXObject_Done
    dw $0009
    dw $000F
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_ExplodingZebesLava_1

InstList_PaletteFXObject_FadeOutExplodingZebesCrust:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0082 
    dw $0014
    dw $0864,$0884,$0CA6,$10C7,$0CC8,$0D07,$0D0A,$0CEC,$0D2C,$112C,$118E,$0D70,$11F4,$1633,$1698
    dw Instruction_PaletteFXObject_Done
    dw $0014
    dw $0443,$0463,$0885,$0CA6,$08A7,$08E6,$08E8,$08CA,$08EA,$0CEA,$0D4C,$092E,$0DB1,$11D0,$1235
    dw Instruction_PaletteFXObject_Done
    dw $0014
    dw $0443,$0463,$0864,$0C85,$0886,$08C5,$08C7,$08A9,$08C9,$0CC9,$0D2A,$090C,$0D6F,$0D8E,$0DF2
    dw Instruction_PaletteFXObject_Done
    dw $0014
    dw $0422,$0442,$0463,$0864,$0465,$04A4,$04A6,$0487,$04A7,$08A7,$08E8,$04CA,$092C,$0D4B,$0D8F
    dw Instruction_PaletteFXObject_Done
    dw $0014
    dw $0422,$0442,$0443,$0863,$0464,$0483,$0485,$0466,$0486,$0886,$08C7,$04A8,$08EA,$0909,$094C
    dw Instruction_PaletteFXObject_Done
    dw $0014
    dw $0021,$0021,$0422,$0442,$0443,$0462,$0463,$0444,$0464,$0464,$0485,$0486,$04A7,$04C7,$04E9
    dw Instruction_PaletteFXObject_Done
    dw $0014
    dw $0001,$0021,$0021,$0421,$0022,$0041,$0042,$0023,$0043,$0443,$0463,$0044,$0465,$0484,$04A6
    dw Instruction_PaletteFXObject_Done
    dw $0014
    dw $0000,$0000,$0000,$0000,$0001,$0020,$0021,$0001,$0021,$0021,$0021,$0022,$0022,$0042,$0043
    dw Instruction_PaletteFXObject_Done
    dw Instruction_Delete_8DC5CF

InstList_PaletteFXObject_FadeOutExplodingZebesGreyClouds:
    dw Instruction_PaletteFXObject_ColorIndexInY,$00A2 
    dw $000E
    dw $0842,$0C63,$1084,$14A5,$18C6,$1CE7,$2108,$2529,$2D6B,$318C,$39CE,$4631,$4A52,$5294,$6318
    dw Instruction_PaletteFXObject_Done
    dw $000E
    dw $0421,$0842,$0C63,$1084,$14A5,$18C6,$1CE7,$1CE7,$2529,$294A,$318C,$39CE,$3DEF,$4631,$56B5
    dw Instruction_PaletteFXObject_Done
    dw $000E
    dw $0421,$0842,$0C63,$0C63,$1084,$14A5,$18C6,$18C6,$2108,$2529,$294A,$318C,$35AD,$3DEF,$4A52
    dw Instruction_PaletteFXObject_Done
    dw $000E
    dw $0421,$0421,$0842,$0C63,$0C63,$1084,$14A5,$14A5,$18C6,$1CE7,$2108,$294A,$2D6B,$318C,$3DEF
    dw Instruction_PaletteFXObject_Done
    dw $000E
    dw $0421,$0421,$0842,$0842,$0C63,$0C63,$1084,$1084,$14A5,$18C6,$1CE7,$2108,$2529,$294A,$318C
    dw Instruction_PaletteFXObject_Done
    dw $000E
    dw $0000,$0421,$0421,$0421,$0842,$0842,$0C63,$0C63,$1084,$1084,$14A5,$18C6,$18C6,$1CE7,$2529
    dw Instruction_PaletteFXObject_Done
    dw $000E
    dw $0000,$0000,$0421,$0421,$0421,$0421,$0842,$0842,$0842,$0C63,$0C63,$1084,$1084,$14A5,$18C6
    dw Instruction_PaletteFXObject_Done
    dw $000E
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0421,$0421,$0421,$0421,$0421,$0842,$0842,$0842,$0C63
    dw Instruction_PaletteFXObject_Done
    dw Instruction_Delete_8DC5CF

InstList_PaletteFXObject_GunshipEmergingFromZebesExplosion:
    dw Instruction_PaletteFXObject_ColorIndexInY,$00A0 
    dw $0018
    dw $0000,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF
    dw Instruction_PaletteFXObject_Done
    dw $0018
    dw $0000,$6F7B,$6B7B,$6B5A,$6B5A,$6B7B,$6B7B,$6B7B,$6B5B,$6F7A,$6B7A,$6B7A,$6F7B,$6F5A,$6B5A,$6B5B
    dw Instruction_PaletteFXObject_Done
    dw $0018
    dw $0000,$5F18,$5AF8,$5AD6,$5AD6,$5B18,$5AF7,$5AF7,$5AD7,$5F16,$5AF6,$5AF6,$5EF7,$5ED6,$5AD6,$5AD7
    dw Instruction_PaletteFXObject_Done
    dw $0018
    dw $0000,$4EB5,$4694,$4652,$4631,$4A94,$4674,$4673,$4653,$4EB1,$4A71,$4A71,$4E73,$4E52,$4A52,$4A33
    dw Instruction_PaletteFXObject_Done
    dw $0018
    dw $0000,$4231,$3611,$35CE,$35AD,$3631,$3610,$35F0,$35CF,$3E2D,$3A0D,$35ED,$41EF,$3DCE,$39AD,$35AF
    dw Instruction_PaletteFXObject_Done
    dw $0018
    dw $0000,$31CE,$21AD,$214A,$2108,$25AD,$218D,$216C,$214B,$2DC8,$2988,$2568,$316B,$2D4A,$2929,$250B
    dw Instruction_PaletteFXObject_Done
    dw $0018
    dw $0000,$216B,$112A,$10C6,$1084,$154A,$1109,$10E8,$10C7,$1D64,$1904,$14E4,$20E7,$1CC6,$18A5,$1487
    dw Instruction_PaletteFXObject_Done
    dw $0018
    dw $0000,$1508,$00C7,$0042,$0000,$04E7,$00A6,$0085,$0043,$1100,$08A0,$0460,$1484,$0C42,$0821,$0404
    dw Instruction_PaletteFXObject_Done
    dw $0018
    dw $0000,$1508,$00C7,$0042,$0000,$04E7,$00A6,$0085,$0043,$1100,$08A0,$0460,$1484,$0C42,$0821,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0018
    dw $0000,$1D6B,$010A,$0063,$0000,$094A,$00E8,$00C7,$0064,$1560,$0CE0,$0880,$1CC6,$1063,$0C42,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0018
    dw $0000,$25CE,$014C,$0064,$0000,$098C,$012B,$00E9,$0086,$1DE0,$1120,$08C0,$24E7,$1884,$1042,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0018
    dw $0000,$2E31,$018F,$0085,$0000,$0DEF,$016D,$012B,$00A7,$2240,$1560,$0CE0,$2D29,$1CA5,$1463,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0018
    dw $0000,$3295,$05F1,$00A7,$0000,$0E32,$01AF,$014C,$00E9,$2AA0,$19C0,$0D00,$314A,$20C6,$1463,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0018
    dw $0000,$3AF8,$0634,$00C8,$0000,$1295,$01F1,$018E,$010A,$2F00,$1E00,$1120,$398C,$24E7,$1884,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0018
    dw $0000,$435B,$0676,$00C9,$0000,$12D7,$0234,$01B0,$012C,$3780,$2240,$1160,$41AD,$2D08,$1C84,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0018
    dw $0000,$4BBE,$06B9,$00EA,$0000,$173A,$0276,$01F2,$014D,$3BE0,$2680,$1580,$49EF,$3129,$20A5,$0000
    dw Instruction_PaletteFXObject_Done
    dw Instruction_Delete_8DC5CF

InstList_PaletteFXObject_HyperBeam_0:
    dw Instruction_PaletteFXObject_ColorIndexInY,$01C2 

InstList_PaletteFXObject_HyperBeam_1:
    dw $0002 
    dw $7FFF,$661F,$351F,$001F,$673F,$4E7F,$319F,$18DF
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $7FFF,$36BD,$1D9B,$00D9,$6B9F,$4F3F,$2EDF,$0E7F
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $7FFF,$033B,$0216,$0173,$6BFF,$4BFF,$2BFF,$03FF
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $7FFF,$1F8E,$164B,$0D8A,$6BFD,$4BF9,$2BF5,$03F0
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $7FFF,$3BE0,$2680,$1580,$6BFA,$4BF2,$2BEA,$03E0
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $7FFF,$5F60,$4A40,$3540,$77B4,$5F8E,$4B28,$3301
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $7FFF,$7EC0,$6DE0,$54E0,$7F6E,$730A,$6665,$5E22
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $7FFF,$7D70,$650B,$4486,$7F37,$7A75,$71B2,$652E
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $7FFF,$7C1F,$5816,$300C,$7EDF,$7DDF,$7CDF,$681A
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $7FFF,$711F,$489B,$1816,$731F,$663F,$593F,$407D
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_HyperBeam_1

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_PaletteFXObject_8DD9D0:
    dw Instruction_PaletteFXObject_ColorIndexInY,$00A0 
    dw $0002
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $739C,$77BD,$73BD,$73BD,$739C,$77BD,$73BD,$73BD,$73BD,$77BC,$77BC,$77BC,$77BD,$77BD,$77BD,$77BD
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $6B5A,$6F9C,$6B7B,$6B7B,$6B5A,$6F7B,$6B7B,$6B7B,$6B7B,$6F9A,$6F7A,$6F7A,$6F7B,$6F7B,$6F7B,$739C
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $6318,$675A,$635A,$6339,$6318,$675A,$635A,$6339,$6339,$6758,$6758,$6738,$6739,$6739,$6739,$6B5A
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $5AD6,$6339,$5B18,$5AF7,$5AD6,$5F18,$5B18,$5AF8,$5AF7,$5F36,$5F16,$5EF6,$62F7,$5EF7,$5EF7,$6739
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $5294,$5AF7,$52D7,$52B5,$5294,$56F7,$52D7,$52D6,$52B6,$5AF4,$56D4,$56B4,$5AD6,$56B5,$56B5,$5EF7
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $4A52,$52D6,$4AB5,$4A73,$4A52,$4EB5,$4AB5,$4A94,$4A74,$52D2,$4EB2,$4E72,$5294,$4E73,$4E73,$5AD6
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $4210,$4A94,$4274,$4231,$4210,$4694,$4273,$4252,$4232,$4A90,$4670,$4630,$4A52,$4631,$4631,$5294
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $39CE,$4673,$3A32,$39F0,$39CE,$3E52,$3A32,$3A11,$3A10,$426E,$3E2E,$3E0E,$4610,$41EF,$3DEF,$4E73
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $318C,$3E31,$3211,$31AE,$318C,$3631,$3210,$31CF,$31CE,$3A2C,$360C,$35CC,$3DCE,$39AD,$35AD,$4631
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $294A,$3610,$29CF,$296C,$294A,$2DEF,$29CF,$29AD,$298D,$360A,$2DCA,$2D8A,$35AD,$316B,$2D6B,$4210
    dw Instruction_PaletteFXObject_Done
    dw Instruction_Delete_8DC5CF
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_PaletteFXObject_SamusLoading_PowerSuit_0:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0180 
    dw Instruction_PaletteFXObject_TimerInY : db $24 

InstList_PaletteFXObject_SamusLoading_PowerSuit_1:
    dw $0003 
    dw $3800,$0108,$03BD,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$02B5,$016B,$0252,$1104,$0074,$000D
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $0000,$52AE,$5FBD,$65E5,$7FE0,$7388,$7FFF,$7FF2,$7FEE,$569B,$5F55,$5E0B,$53F6,$62E4,$5254,$51ED
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero
    dw InstList_PaletteFXObject_SamusLoading_PowerSuit_1
    dw Instruction_PaletteFXObject_TimerInY : db $03

InstList_PaletteFXObject_SamusLoading_PowerSuit_2:
    dw $0003 
    dw $3800,$0108,$03BD,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$02B5,$016B,$0252,$1104,$0074,$000D
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $0000,$52AE,$5FBD,$65E5,$7FE0,$7388,$7FFF,$7FF2,$7FEE,$569B,$5F55,$5E0B,$53F6,$62E4,$5254,$51ED
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero
    dw InstList_PaletteFXObject_SamusLoading_PowerSuit_2
    dw Instruction_PaletteFXObject_TimerInY : db $03

InstList_PaletteFXObject_SamusLoading_PowerSuit_3:
    dw $0003
    dw $3800,$0108,$03BD,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$02B5,$016B,$0252,$1104,$0074,$000D
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $2003,$516E,$4BBD,$64A5,$7FE0,$7248,$7FFF,$7F72,$7EEE,$555B,$4AB5,$496B,$52B6,$61A4,$5114,$50AD
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero
    dw InstList_PaletteFXObject_SamusLoading_PowerSuit_3
    dw Instruction_PaletteFXObject_TimerInY : db $02

InstList_PaletteFXObject_SamusLoading_PowerSuit_4:
    dw $0003
    dw $3800,$0108,$03BD,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$02B5,$016B,$0252,$1104,$0074,$000D
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $2003,$28CE,$37BD,$3C05,$63E0,$49A8,$7F9F,$72D2,$624E,$28BB,$36B5,$356B,$2A16,$3904,$2874,$280D
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero
    dw InstList_PaletteFXObject_SamusLoading_PowerSuit_4
    dw $0001
    dw $3800,$0108,$03BD,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$02B5,$016B,$0252,$1104,$0074,$000D
    dw Instruction_PaletteFXObject_Done
    dw Instruction_Delete_8DC5CF

InstList_PaletteFXObject_SamusLoading_VairaSuit_0:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0180 
    dw Instruction_PaletteFXObject_TimerInY : db $24 

InstList_PaletteFXObject_SamusLoading_VairaSuit_1:
    dw $0003 
    dw $0000,$0108,$02FF,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$01BE,$008E,$0252,$1104,$0074,$000D
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $0000,$79A8,$7B9F,$65E5,$7FE0,$7388,$7FFF,$7FF2,$7FEE,$569B,$765E,$752E,$524D,$62E4,$5254,$51ED
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero
    dw InstList_PaletteFXObject_SamusLoading_VairaSuit_1
    dw Instruction_PaletteFXObject_TimerInY : db $03

InstList_PaletteFXObject_SamusLoading_VairaSuit_2:
    dw $0003
    dw $0000,$0108,$02FF,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$01BE,$008E,$0252,$1104,$0074,$000D
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $0000,$79A8,$7B9F,$65E5,$7FE0,$7388,$7FFF,$7FF2,$7FEE,$569B,$765E,$752E,$524D,$62E4,$5254,$51ED
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero
    dw InstList_PaletteFXObject_SamusLoading_VairaSuit_2
    dw Instruction_PaletteFXObject_TimerInY : db $03

InstList_PaletteFXObject_SamusLoading_VairaSuit_3:
    dw $0003
    dw $0000,$0108,$02FF,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$01BE,$008E,$0252,$1104,$0074,$000D
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $2003,$5108,$52FF,$64A5,$7FE0,$7248,$7FFF,$7F72,$7EEE,$555B,$51BE,$508E,$3E4D,$61A4,$5114,$50AD
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero
    dw InstList_PaletteFXObject_SamusLoading_VairaSuit_3
    dw Instruction_PaletteFXObject_TimerInY : db $02

InstList_PaletteFXObject_SamusLoading_VairaSuit_4:
    dw $0003
    dw $0000,$0108,$02FF,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$01BE,$008E,$0252,$1104,$0074,$000D
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $2003,$2908,$2AFF,$3C05,$63E0,$49A8,$7F9F,$72D2,$624E,$28BB,$29BE,$288E,$2A4D,$3904,$2874,$280D
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero
    dw InstList_PaletteFXObject_SamusLoading_VairaSuit_4
    dw $0001
    dw $0000,$0108,$02FF,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$01BE,$008E,$0252,$1104,$0074,$000D
    dw Instruction_PaletteFXObject_Done
    dw Instruction_Delete_8DC5CF

InstList_PaletteFXObject_SamusLoading_GravitySuit_0:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0180 
    dw Instruction_PaletteFXObject_TimerInY : db $24 

InstList_PaletteFXObject_SamusLoading_GravitySuit_1:
    dw $0003 
    dw $3800,$0108,$421F,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$5914,$30AA,$0274,$1104,$0074,$000D
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $0000,$52AE,$7FFF,$65E5,$7FE0,$7388,$7FFF,$7FF2,$7FEE,$569B,$7EF4,$7E8A,$53F6,$62E4,$5254,$51ED
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero
    dw InstList_PaletteFXObject_SamusLoading_GravitySuit_1
    dw Instruction_PaletteFXObject_TimerInY : db $03

InstList_PaletteFXObject_SamusLoading_GravitySuit_2:
    dw $0003
    dw $3800,$0108,$421F,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$5914,$30AA,$0274,$1104,$0074,$000D
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $0000,$52AE,$7FFF,$65E5,$7FE0,$7388,$7FFF,$7FF2,$7FEE,$569B,$7EF4,$7E8A,$53F6,$62E4,$5254,$51ED
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero
    dw InstList_PaletteFXObject_SamusLoading_GravitySuit_2
    dw Instruction_PaletteFXObject_TimerInY : db $03

InstList_PaletteFXObject_SamusLoading_GravitySuit_3:
    dw $0003
    dw $3800,$0108,$421F,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$5914,$30AA,$0274,$1104,$0074,$000D
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $2003,$516E,$7EBF,$64A5,$7FE0,$7248,$7FFF,$7F72,$7EEE,$555B,$7DB4,$7D4A,$52B6,$61A4,$5114,$50AD
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero
    dw InstList_PaletteFXObject_SamusLoading_GravitySuit_3
    dw Instruction_PaletteFXObject_TimerInY : db $02

InstList_PaletteFXObject_SamusLoading_GravitySuit_4:
    dw $0003
    dw $3800,$0108,$421F,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$5914,$30AA,$0274,$1104,$0074,$000D
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $2003,$28CE,$6E1F,$3C05,$63E0,$49A8,$7F9F,$72D2,$624E,$28BB,$7D14,$58AA,$2A16,$3904,$2874,$280D
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero
    dw InstList_PaletteFXObject_SamusLoading_GravitySuit_4
    dw $0001
    dw $3800,$0108,$421F,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$5914,$30AA,$0274,$1104,$0074,$000D
    dw Instruction_PaletteFXObject_Done
    dw Instruction_Delete_8DC5CF

InstList_PaletteFXObject_PostCreditsSuperMetroidIconGlare:
    dw Instruction_PaletteFXObject_ColorIndexInY,$01E0 
    dw $0001
    dw $2DEB,$119F,$10B2,$1088,$127F,$1153,$10AC,$135F,$11D3,$10EC,$7BE4,$79C4,$4C84,$4BFF,$13FF,$28E7
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $3A4E,$21FF,$2134,$210C,$22BF,$21B5,$212F,$237F,$2235,$216F,$7BE8,$7A28,$5508,$53FF,$23FF,$356B
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $4691,$365F,$35B6,$35B0,$36FF,$3637,$35B2,$379F,$3697,$35F2,$7BED,$7A8D,$5DAD,$5BFF,$37FF,$45EF
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $56F5,$46BF,$4658,$4633,$473F,$4699,$4655,$479F,$46D9,$4675,$7BF1,$7AD1,$6631,$63FF,$47FF,$5273
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $6338,$5B1F,$5ADA,$5AD7,$5B7F,$5B1B,$5AD8,$5BBF,$5B3B,$5AF8,$7BF6,$7B36,$6ED6,$6BFF,$5BFF,$62F7
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $6F9B,$6B7F,$6B5C,$6B5B,$6BBF,$6B7D,$6B5B,$6BDF,$6B9D,$6B7B,$7BFA,$7B9A,$775A,$73FF,$6BFF,$6F7B
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $6F9B,$6B7F,$6B5C,$6B5B,$6BBF,$6B7D,$6B5B,$6BDF,$6B9D,$6B7B,$7BFA,$7B9A,$775A,$73FF,$6BFF,$6F7B
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $6338,$5B1F,$5ADA,$5AD7,$5B7F,$5B1B,$5AD8,$5BBF,$5B3B,$5AF8,$7BF6,$7B36,$6ED6,$6BFF,$5BFF,$62F7
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $56F5,$46BF,$4658,$4633,$473F,$4699,$4655,$479F,$46D9,$4675,$7BF1,$7AD1,$6631,$63FF,$47FF,$5273
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $4691,$365F,$35B6,$35B0,$36FF,$3637,$35B2,$379F,$3697,$35F2,$7BED,$7A8D,$5DAD,$5BFF,$37FF,$45EF
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $3A4E,$21FF,$2134,$210C,$22BF,$21B5,$212F,$237F,$2235,$216F,$7BE8,$7A28,$5508,$53FF,$23FF,$356B
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $2DEB,$119F,$10B2,$1088,$127F,$1153,$10AC,$135F,$11D3,$10EC,$7BE4,$79C4,$4C84,$4BFF,$13FF,$28E7
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $21A8,$013F,$0030,$0005,$025F,$00F2,$0029,$035F,$0192,$0089,$7BE0,$7980,$4400,$43FF,$03FF,$1C84
    dw Instruction_PaletteFXObject_Done
    dw Instruction_Delete_8DC5CF

InstList_PaletteFXObject_Delete:
    dw Instruction_Delete_8DC5CF 

PaletteFXObjects_FadeInSuperMetroidTitleLogo:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_FadeInSuperMetroidTitleLogo 

if !FEATURE_KEEP_UNREFERENCED
PaletteFXObjects_FadeInNintendoBootLogoForUnusedCode:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_FadeInNintendoBootLogo 
endif ; !FEATURE_KEEP_UNREFERENCED

PaletteFXObjects_FadeInNintendoCopyright:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_FadeInNintendoCopyright 

PaletteFXObjects_TitleScreenBabyMetroidTubeLight:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_TitleScreenBabyMetroidTubeLight_0 

PaletteFXObjects_TitleScreenFlickeringDisplays:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_TitleScreenFlickeringDisplays_0 

PaletteFXObjects_CutsceneGunshipEngineFlicker:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_CutsceneGunshipEngineFlicker_0 

PaletteFXObjects_CutsceneCeresNavigationLights_SpriteCeres:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_CutsceneCeresNavigationLight_Sprite 

PaletteFXObjects_FadeInPlanetZebesText:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_FadeInPlanetZebesText 

PaletteFXObjects_FadeOutPlanetZebesText:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_FadeOutPlanetZebesText 

PaletteFXObjects_CutsceneCeresNavigationLights_BGCeres:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_CutsceneCeresNavigationLights_BG 

PaletteFXObjects_OldMotherBrainFightBackgroundLights:
    dw Setup_PaletteFXObject_OldMotherBrainFightBackgroundLights 
    dw InstList_PaletteFXObject_OldMotherBrainFightBGLights_0 

PaletteFXObjects_GunshipGlow:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_GunshipGlow_0 

PaletteFXObjects_FadeOutZoomedOutExplodingZebes:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_FadeOutZoomedOutExplodingZebes 

PaletteFXObjects_WidePartOfZebesExplosion_Foreground:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_WidePartOfZebesExplosion_Foreground 

PaletteFXObjects_ZebesExplosionFinale:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_ZebesExplosionFinale 

PaletteFXObjects_WhiteOutSpaceDuringZebesExplosion:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_WhiteOutSpaceDuringZebesExplosion 

PaletteFXObjects_ZebesExplosionPlanetAfterglow:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_ZebesExplosionPlanetAfterGlow_0 

PaletteFXObjects_ExplodingZebesLava:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_ExplodingZebesLava_0 

PaletteFXObjects_FadeOutExplodingZebesCrust:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_FadeOutExplodingZebesCrust 

PaletteFXObjects_FadeOutExplodingZebesGreyClouds:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_FadeOutExplodingZebesGreyClouds 

PaletteFXObjects_GunshipEmergineFromZebesExplosion:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_GunshipEmergingFromZebesExplosion 

PaletteFXObjects_WidePartOfZebesExplosion_Background:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_WidePartOfZebesExplosion_Background 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_PaletteFXObjects_8DE1EC:
    dw RTS_8DC685 
    dw UNUSED_InstList_PaletteFXObject_8DD9D0 
endif ; !FEATURE_KEEP_UNREFERENCED

PaletteFXObjects_HyperBeam:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_HyperBeam_0 

PaletteFXObjects_SamusLoading_PowerSuit:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_SamusLoading_PowerSuit_0 

PaletteFXObjects_SamusLoading_VariaSuit:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_SamusLoading_VairaSuit_0 

PaletteFXObjects_SamusLoading_GravitySuit:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_SamusLoading_GravitySuit_0 

PaletteFXObjects_PostCreditsSuperMetroidIcon:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_PostCreditsSuperMetroidIconGlare 

Setup_PaletteFXObject_OldMotherBrainFightBackgroundLights:
    LDA.W #PreInstruction_PaletteFXObject_DeleteIfIntroPage2IsActive : STA.W $1EAD,Y 
    RTS 


PreInstruction_PaletteFXObject_DeleteIfIntroPage2IsActive:
    LDA.W $1F51 
    CMP.W #CinematicFunction_Intro_Page2 
    BNE .return 
    LDA.W #InstList_PaletteFXObject_Delete : STA.W $1EBD,X 
    LDA.W #$0001 : STA.W $1ECD,X 

.return:
    RTS 


InstList_PaletteFXObject_Nothing:
    dw Instruction_Delete_8DC5CF 

InstList_PaletteFXObject_GreyOutTourianStatue_Draygon:
    dw Instruction_PaletteFXObject_ColorIndexInY,$00C0 
    dw Instruction_PaletteFXObject_GotoY 
    dw InstList_PaletteFXObject_Common_GreyOutTourianStatue 

InstList_PaletteFXObject_GreyOutTourianStatue_Kraid:
    dw Instruction_PaletteFXObject_ColorIndexInY,$00E0 
    dw Instruction_PaletteFXObject_GotoY 
    dw InstList_PaletteFXObject_Common_GreyOutTourianStatue 

InstList_PaletteFXObject_GreyOutTourianStatue_Ridley:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0120 
    dw Instruction_PaletteFXObject_GotoY 
    dw InstList_PaletteFXObject_Common_GreyOutTourianStatue 

InstList_PaletteFXObject_GreyOutTourianStatue_Phantoon:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0140 

InstList_PaletteFXObject_Common_GreyOutTourianStatue:
    dw $0008 
    dw $0000,$57FF,$2BFF,$1F3C,$0278,$01B0,$010B,$0087
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $3800,$5BDE,$33DE,$271A,$0E57,$09AF,$050A,$0486
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $3800,$63DD,$3F9C,$2EF9,$1655,$118E,$0D0A,$0486
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $3800,$67BC,$477B,$36D7,$2234,$198D,$1109,$0885
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $3800,$6F9B,$5359,$42D6,$2A32,$1D8D,$14E9,$0885
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $3800,$737A,$5B38,$4AB4,$3611,$258C,$18E8,$0C84
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $3800,$7B79,$66F6,$5293,$3E0F,$2D6B,$20E8,$0C84
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $3800,$7F58,$6ED5,$5A71,$49EE,$356A,$24E7,$1083
    dw Instruction_PaletteFXObject_Done
    dw Instruction_Delete_8DC5CF

PreInstruction_PaletteFXObject_DeleteIfEnemy0Died:
    LDA.W $0F8C 
    BNE .return 
    STZ.W $1E7D,X 

.return:
    RTS 


InstList_PaletteFXObject_BombTorizoBelly_0:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0132 
    dw Instruction_PaletteFXObject_PreInstructionInY 
    dw PreInstruction_PaletteFXObject_DeleteIfEnemy0Died 

InstList_PaletteFXObject_BombTorizoBelly_1:
    dw $000A 
    dw $6F7F,$51F8,$410E
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $56BC,$3935,$284B
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $4639,$28B2,$1828
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $2D74,$100D,$0403
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $4639,$28B2,$1828
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $56BC,$3935,$284B
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_BombTorizoBelly_1

InstList_PaletteFXObject_GoldenTorizoBelly_0:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0132 
    dw Instruction_PaletteFXObject_PreInstructionInY 
    dw PreInstruction_PaletteFXObject_DeleteIfEnemy0Died 

InstList_PaletteFXObject_GoldenTorizoBelly_1:
    dw $000A 
    dw $73E0,$4F20,$2A20
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $5380,$2E20,$0920
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $3AC0,$1560,$0480
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $2200,$00A0,$0020
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $3AC0,$1560,$0480
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $5380,$2E20,$0920
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_GoldenTorizoBelly_1

PreInstruction_PaletteFXObject_SamusInHeat:
    LDA.W $09A2 
    AND.W #$0021 
    BNE + 
    LDA.W $0A4E 
    CLC : ADC.W #$4000 
    STA.W $0A4E 
    LDA.W $0A50 
    ADC.W #$0000 
    STA.W $0A50 
    LDA.W $05B6 
    BIT.W #$0007 
    BNE + 
    LDA.W #$0046 
    CMP.W $09C2 
    BCS + 
    LDA.W #$002D 
    JSL.L QueueSound_Lib3_Max6 

  + LDA.W $1EED 
    CMP.W $1EEF 
    BEQ .return 
    STA.W $1EEF 
    ASL A 
    TAY 
    LDA.W #$0001 : STA.W $1ECD,X 
    LDA.W $09A2 
    BIT.W #$0020 
    BEQ .checkVaria 
    LDA.W #.InstListPointers_gravity 
    BRA .setInstListPointer 


.checkVaria:
    BIT.W #$0001 
    BEQ .powerSuit 
    LDA.W #.InstListPointers_varia 
    BRA .setInstListPointer 


.powerSuit:
    LDA.W #.InstListPointers_power 

.setInstListPointer:
    STA.B $12 
    LDA.B ($12),Y : STA.W $1EBD,X 

.return:
    RTS 


  .InstListPointers
  ..gravity:
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_2 
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_3 
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_4 
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_5 
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_6 
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_7 
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_8 
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_9 
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_A 
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_B 
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_C 
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_D 
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_E 
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_F 
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_10 
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_11 

  ..varia:
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_2 
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_3 
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_4 
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_5 
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_6 
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_7 
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_8 
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_9 
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_A 
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_B 
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_C 
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_D 
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_E 
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_F 
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_10 
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_11 

  ..power:
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_1 
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_2 
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_3 
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_4 
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_5 
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_6 
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_7 
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_8 
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_9 
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_A 
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_B 
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_C 
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_D 
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_E 
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_F 
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_10 

Setup_PaletteFXObject_Norfair1_Tourian1:
    LDA.W $09A2 
    BIT.W #$0020 
    BEQ .checkVaria 
    LDA.W #InstList_PaletteFXObject_SamusInHeat_GravitySuit_0 
    BRA + 


.checkVaria:
    BIT.W #$0001 
    BEQ .powerSuit 
    LDA.W #InstList_PaletteFXObject_SamusInHeat_VariaSuit_0 
    BRA + 


.powerSuit:
    LDA.W #InstList_PaletteFXObject_SamusInHeat_PowerSuit_0 

  + STA.W $1EBD,Y 
    RTS 


InstList_PaletteFXObject_SamusInHeat_PowerSuit_0:
    dw Instruction_PaletteFXObject_PreInstructionInY 
    dw PreInstruction_PaletteFXObject_SamusInHeat 
    dw Instruction_PaletteFXObject_ColorIndexInY,$0182 

InstList_PaletteFXObject_SamusInHeat_PowerSuit_1:
    dw $0010 
    dw $0108,$03BD,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$02B5,$016B,$0252,$1104,$0074,$000D
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_PowerSuit_2:
    dw $0004 
    dw $0109,$03BD,$1406,$3BE1,$25CA,$579F,$4AD3,$3A4F,$00BC,$02B6,$016C,$0253,$1105,$0075,$000E
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_PowerSuit_3:
    dw $0004 
    dw $0109,$03BD,$1406,$3BE1,$25CA,$579F,$4AD3,$3A4F,$00BC,$02B6,$016C,$0253,$1105,$0075,$000E
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_PowerSuit_4:
    dw $0005 
    dw $010A,$03BE,$1407,$3BE2,$25CC,$579F,$4AD4,$3A50,$00BC,$02B7,$016D,$0254,$1106,$0076,$000F
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_PowerSuit_5:
    dw $0006 
    dw $010A,$03BE,$1407,$3BE2,$25CC,$579F,$4AD4,$3A50,$00BC,$02B7,$016D,$0254,$1106,$0076,$000F
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_PowerSuit_6:
    dw $0007 
    dw $010B,$03BE,$1408,$3BE3,$29EE,$579F,$4AD5,$3A51,$00BD,$02B8,$016E,$0255,$1107,$0077,$0010
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_PowerSuit_7:
    dw $0008 
    dw $010B,$03BE,$1408,$3BE3,$29EE,$579F,$4AD5,$3A51,$00BD,$02B8,$016E,$0255,$1107,$0077,$0010
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_PowerSuit_8:
    dw $0008 
    dw $010D,$03BE,$140A,$3BE5,$2E0F,$579F,$4AD7,$3A53,$00BD,$02BA,$0170,$0257,$1109,$0079,$0012
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_PowerSuit_9:
    dw $0008 
    dw $010D,$03BE,$140A,$3BE5,$2E0F,$579F,$4AD7,$3A53,$00BD,$02BA,$0170,$0257,$1109,$0079,$0012
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_PowerSuit_A:
    dw $0008 
    dw $010B,$03BE,$1408,$3BE3,$29EE,$579F,$4AD5,$3A51,$00BD,$02B8,$016E,$0255,$1107,$0077,$0010
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_PowerSuit_B:
    dw $0007 
    dw $010B,$03BE,$1408,$3BE3,$29EE,$579F,$4AD5,$3A51,$00BD,$02B8,$016E,$0255,$1107,$0077,$0010
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_PowerSuit_C:
    dw $0006 
    dw $010A,$03BE,$1407,$3BE2,$25CC,$579F,$4AD4,$3A50,$00BC,$02B7,$016D,$0254,$1106,$0076,$000F
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_PowerSuit_D:
    dw $0005 
    dw $010A,$03BE,$1407,$3BE2,$25CC,$579F,$4AD4,$3A50,$00BC,$02B7,$016D,$0254,$1106,$0076,$000F
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_PowerSuit_E:
    dw $0004 
    dw $0109,$03BD,$1406,$3BE1,$25CA,$579F,$4AD3,$3A4F,$00BC,$02B6,$016C,$0253,$1105,$0075,$000E
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_PowerSuit_F:
    dw $0004 
    dw $0109,$03BD,$1406,$3BE1,$25CA,$579F,$4AD3,$3A4F,$00BC,$02B6,$016C,$0253,$1105,$0075,$000E
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_PowerSuit_10:
    dw $0003 
    dw $0109,$03BD,$1406,$3BE1,$25CA,$579F,$4AD3,$3A4F,$00BC,$02B6,$016C,$0253,$1105,$0075,$000E
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_PowerSuit_11:
    dw Instruction_PaletteFXObject_GotoY 
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_1 

InstList_PaletteFXObject_SamusInHeat_VariaSuit_0:
    dw Instruction_PaletteFXObject_PreInstructionInY 
    dw PreInstruction_PaletteFXObject_SamusInHeat 

InstList_PaletteFXObject_SamusInHeat_VariaSuit_1:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0182 

InstList_PaletteFXObject_SamusInHeat_VariaSuit_2:
    dw $0010 
    dw $0108,$02FF,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$01BE,$008E,$0252,$1104,$0074,$000D
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_VariaSuit_3:
    dw $0004 
    dw $0109,$02FF,$1406,$3BE1,$25CA,$579F,$4AD3,$3A4F,$00BC,$01BE,$008F,$0253,$1105,$0075,$000E
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_VariaSuit_4:
    dw $0004 
    dw $0109,$02FF,$1406,$3BE1,$25CA,$579F,$4AD3,$3A4F,$00BC,$01BE,$008F,$0253,$1105,$0075,$000E
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_VariaSuit_5:
    dw $0005 
    dw $010A,$02FF,$1407,$3BE2,$25CC,$579F,$4AD4,$3A50,$00BC,$01BE,$0090,$0254,$1106,$0076,$000F
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_VariaSuit_6:
    dw $0006 
    dw $010A,$02FF,$1407,$3BE2,$25CC,$579F,$4AD4,$3A50,$00BC,$01BE,$0090,$0254,$1106,$0076,$000F
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_VariaSuit_7:
    dw $0007 
    dw $010B,$02FF,$1408,$3BE3,$29EE,$579F,$4AD5,$3A51,$00BD,$01BE,$0091,$0255,$1107,$0077,$0010
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_VariaSuit_8:
    dw $0008 
    dw $010B,$02FF,$1408,$3BE3,$29EE,$579F,$4AD5,$3A51,$00BD,$01BE,$0091,$0255,$1107,$0077,$0010
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_VariaSuit_9:
    dw $0008 
    dw $010D,$02FF,$140A,$3BE5,$2E0F,$579F,$4AD7,$3A53,$00BD,$01BF,$0093,$0257,$1109,$0079,$0012
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_VariaSuit_A:
    dw $0008 
    dw $010D,$02FF,$140A,$3BE5,$2E0F,$579F,$4AD7,$3A53,$00BD,$01BF,$0093,$0257,$1109,$0079,$0012
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_VariaSuit_B:
    dw $0008 
    dw $010B,$02FF,$1408,$3BE3,$29EE,$579F,$4AD5,$3A51,$00BD,$01BE,$0091,$0255,$1107,$0077,$0010
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_VariaSuit_C:
    dw $0007 
    dw $010B,$02FF,$1408,$3BE3,$29EE,$579F,$4AD5,$3A51,$00BD,$01BE,$0091,$0255,$1107,$0077,$0010
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_VariaSuit_D:
    dw $0006 
    dw $010A,$02FF,$1407,$3BE2,$25CC,$579F,$4AD4,$3A50,$00BC,$01BE,$0090,$0254,$1106,$0076,$000F
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_VariaSuit_E:
    dw $0005 
    dw $010A,$02FF,$1407,$3BE2,$25CC,$579F,$4AD4,$3A50,$00BC,$01BE,$0090,$0254,$1106,$0076,$000F
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_VariaSuit_F:
    dw $0004 
    dw $0109,$02FF,$1406,$3BE1,$25CA,$579F,$4AD3,$3A4F,$00BC,$01BE,$008F,$0253,$1105,$0075,$000E
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_VariaSuit_10:
    dw $0004 
    dw $0109,$02FF,$1406,$3BE1,$25CA,$579F,$4AD3,$3A4F,$00BC,$01BE,$008F,$0253,$1105,$0075,$000E
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_VariaSuit_11:
    dw $0010 
    dw $0108,$02FF,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$01BE,$008E,$0252,$1104,$0074,$000D
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_VariaSuit_12:
    dw Instruction_PaletteFXObject_GotoY 
    dw InstList_PaletteFXObject_SamusInHeat_VariaSuit_2 

InstList_PaletteFXObject_SamusInHeat_GravitySuit_0:
    dw Instruction_PaletteFXObject_PreInstructionInY 
    dw PreInstruction_PaletteFXObject_SamusInHeat 

InstList_PaletteFXObject_SamusInHeat_GravitySuit_1:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0182 

InstList_PaletteFXObject_SamusInHeat_GravitySuit_2:
    dw $0010 
    dw $0108,$421F,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$5914,$30AA,$0274,$1104,$0074,$000D
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_GravitySuit_3:
    dw $0004 
    dw $0109,$421F,$1406,$3BE1,$25CA,$579F,$4AD3,$3A4F,$00BC,$5915,$30AB,$0253,$1105,$0075,$000E
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_GravitySuit_4:
    dw $0004 
    dw $0109,$421F,$1406,$3BE1,$25CA,$579F,$4AD3,$3A4F,$00BC,$5915,$30AB,$0253,$1105,$0075,$000E
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_GravitySuit_5:
    dw $0005 
    dw $010A,$421F,$1407,$3BE2,$25CC,$579F,$4AD4,$3A50,$00BC,$5916,$30AC,$0254,$1106,$0076,$000F
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_GravitySuit_6:
    dw $0006 
    dw $010A,$421F,$1407,$3BE2,$25CC,$579F,$4AD4,$3A50,$00BC,$5916,$30AC,$0254,$1106,$0076,$000F
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_GravitySuit_7:
    dw $0007 
    dw $010B,$421F,$1408,$3BE3,$29EE,$579F,$4AD5,$3A51,$00BD,$5917,$30AD,$0255,$1107,$0077,$0010
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_GravitySuit_8:
    dw $0008 
    dw $010B,$421F,$1408,$3BE3,$29EE,$579F,$4AD5,$3A51,$00BD,$5917,$30AD,$0255,$1107,$0077,$0010
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_GravitySuit_9:
    dw $0008 
    dw $010D,$421F,$140A,$3BE5,$2E0F,$579F,$4AD7,$3A53,$00BD,$5919,$30AF,$0257,$1109,$0079,$0012
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_GravitySuit_A:
    dw $0008 
    dw $010D,$421F,$140A,$3BE5,$2E0F,$579F,$4AD7,$3A53,$00BD,$5919,$30AF,$0257,$1109,$0079,$0012
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_GravitySuit_B:
    dw $0008 
    dw $010B,$421F,$1408,$3BE3,$29EE,$579F,$4AD5,$3A51,$00BD,$5917,$30AD,$0255,$1107,$0077,$0010
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_GravitySuit_C:
    dw $0007 
    dw $010B,$421F,$1408,$3BE3,$29EE,$579F,$4AD5,$3A51,$00BD,$5917,$30AD,$0255,$1107,$0077,$0010
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_GravitySuit_D:
    dw $0006 
    dw $010A,$421F,$1407,$3BE2,$25CC,$579F,$4AD4,$3A50,$00BC,$5916,$30AC,$0254,$1106,$0076,$000F
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_GravitySuit_E:
    dw $0005 
    dw $010A,$421F,$1407,$3BE2,$25CC,$579F,$4AD4,$3A50,$00BC,$5916,$30AC,$0254,$1106,$0076,$000F
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_GravitySuit_F:
    dw $0004 
    dw $0109,$421F,$1406,$3BE1,$25CA,$579F,$4AD3,$3A4F,$00BC,$5915,$30AB,$0253,$1105,$0075,$000E
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_GravitySuit_10:
    dw $0004 
    dw $0109,$421F,$1406,$3BE1,$25CA,$579F,$4AD3,$3A4F,$00BC,$5915,$30AB,$0253,$1105,$0075,$000E
    dw Instruction_PaletteFXObject_Done

InstList_PaletteFXObject_SamusInHeat_GravitySuit_11:
    dw $0010 
    dw $0108,$421F,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$5914,$30AA,$0274,$1104,$0074,$000D
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_SamusInHeat_GravitySuit_2

InstList_PaletteFXObject_WreckedShip1_0:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0098 

InstList_PaletteFXObject_WreckedShip1_1:
    dw $000A 
    dw $1EA9,$0BB1                                                 
    dw Instruction_PaletteFXObject_Done                            
    dw $000A
    dw $1667,$034E                                                 
    dw Instruction_PaletteFXObject_Done                            
    dw $000A
    dw $0E25,$02EB                                                 
    dw Instruction_PaletteFXObject_Done                            
    dw $000A
    dw $05E3,$0288                                                 
    dw Instruction_PaletteFXObject_Done                            
    dw $000A
    dw $01A1,$0225                                                 
    dw Instruction_PaletteFXObject_Done                            
    dw $000A
    dw $05E3,$0288                                                 
    dw Instruction_PaletteFXObject_Done                            
    dw $000A
    dw $0E25,$02EB                                                 
    dw Instruction_PaletteFXObject_Done                            
    dw $000A
    dw $1667,$034E                                                 
    dw Instruction_PaletteFXObject_Done                            
    dw Instruction_PaletteFXObject_GotoY                           
    dw InstList_PaletteFXObject_WreckedShip1_1                     

if !FEATURE_KEEP_UNREFERENCED
UNUSED_PreInstruction_PaletteFXObject_WaitUntilAreBossIsDead:
    LDA.W #$0001 
    JSL.L CheckIfBossBitsForCurrentAreaMatchAnyBitsInA 
    BCS .return 
    PLA 
    LDA.W #$0001 : STA.W $1ECD,X 

.return:
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


InstList_PaletteFXObject_Crateria1_0:
    dw Instruction_PaletteFXObject_PreInstructionInY 
    dw PreInst_PaletteFXObject_RestartCrateria1IfSamusIsntLowEnough 
    dw Instruction_PaletteFXObject_ColorIndexInY 
    dw $00A8 

InstList_PaletteFXObject_Crateria1_1:
    dw $00F0,$2D6C,$294B,$252A,$2109,$1CE8,$18C7,$14A6 
    dw $1085 
    dw Instruction_PaletteFXObject_Done 
    dw Instruction_PaletteFXObject_TimerInY 
    db $02 

InstList_PaletteFXObject_Crateria1_2:
    dw $0002,$4632,$4211,$3DF0,$39CF,$35AE,$318D,$2D6C 
    dw $294B 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$5EF8,$5AD7,$56B6,$5295,$4E74,$4A53,$4632 
    dw $4211 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$77BE,$739D,$6F7C,$6B5B,$673A,$6319,$5EF8 
    dw $5AD7 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF 
    dw $7FFF 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$77BE,$739D,$6F7C,$6B5B,$673A,$6319,$5EF8 
    dw $5AD7 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$5EF8,$5AD7,$56B6,$5295,$4E74,$4A53,$4632 
    dw $4211 
    dw Instruction_PaletteFXObject_Done 
    dw $0002,$4632,$4211,$3DF0,$39CF,$35AE,$318D,$2D6C 
    dw $294B 
    dw Instruction_PaletteFXObject_Done 
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero 
    dw InstList_PaletteFXObject_Crateria1_2 
    dw $00F0,$2D6C,$294B,$252A,$2109,$1CE8,$18C7,$14A6 
    dw $1085 
    dw Instruction_PaletteFXObject_Done 
    dw Instruction_PaletteFXObject_TimerInY 
    db $01 

InstList_PaletteFXObject_Crateria1_3:
    dw $0001,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF 
    dw $7FFF 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$77BE,$739D,$6F7C,$6B5B,$673A,$6319,$5EF8 
    dw $5AD7 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$5EF8,$5AD7,$56B6,$5295,$4E74,$4A53,$4632 
    dw $4211 
    dw Instruction_PaletteFXObject_Done 
    dw $0002,$4632,$4211,$3DF0,$39CF,$35AE,$318D,$2D6C 
    dw $294B 
    dw Instruction_PaletteFXObject_Done 
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero 
    dw InstList_PaletteFXObject_Crateria1_3 
    dw Instruction_PaletteFXObject_GotoY 
    dw InstList_PaletteFXObject_Crateria1_1 

PreInst_PaletteFXObject_RestartCrateria1IfSamusIsntLowEnough:
    LDA.W $0AFA 
    CMP.W #$0380 
    BCS .return 
    LDA.W #$0001 : STA.W $1ECD,X 
    LDA.W #InstList_PaletteFXObject_Crateria1_1 : STA.W $1EBD,X 

.return:
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_PaletteFXObject_DarkLightning_0_8DEC6E:
    dw Instruction_PaletteFXObject_PreInstructionInY 
    dw UNUSED_PreInst_PalFXObj_RestartDarkLightningIfSamus_8DED84 
    dw Instruction_PaletteFXObject_ColorIndexInY 
    dw $0082 

UNUSED_InstList_PaletteFXObject_DarkLightning_1_8DEC76:
    dw $00F0,$262B,$1548,$08E5,$1594,$14ED,$10A9,$0C86 
    dw Instruction_PaletteFXObject_Done 
    dw Instruction_PaletteFXObject_TimerInY 
    db $02 

UNUSED_InstList_PaletteFXObject_DarkLightning_2_8DEC8B:
    dw $0002,$1186,$00A3,$0040,$00EF,$0048,$0004,$0001 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$00E1,$0000,$0000,$004A,$0003,$0000,$0000 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$0040,$0000,$0000,$0005,$0000,$0000,$0000 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$0000,$0000,$0000,$0000,$0000,$0000,$0000 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$0040,$0000,$0000,$0005,$0000,$0000,$0000 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$00E1,$0000,$0000,$004A,$0003,$0000,$0000 
    dw Instruction_PaletteFXObject_Done 
    dw $0002,$1186,$00A3,$0040,$00EF,$0048,$0004,$0001 
    dw Instruction_PaletteFXObject_Done 
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero 
    dw UNUSED_InstList_PaletteFXObject_DarkLightning_2_8DEC8B 
    dw $00F0,$262B,$1548,$08E5,$1594,$14ED,$10A9,$0C86 
    dw Instruction_PaletteFXObject_Done 
    dw $00F0,$262B,$1548,$08E5,$1594,$14ED,$10A9,$0C86 
    dw Instruction_PaletteFXObject_Done 
    dw Instruction_PaletteFXObject_TimerInY 
    db $01 

UNUSED_InstList_PaletteFXObject_DarkLightning_3_8DED34:
    dw $0001,$0000,$0000,$0000,$0000,$0000,$0000,$0000 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$0040,$0000,$0000,$0005,$0000,$0000,$0000 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$00E1,$0000,$0000,$004A,$0003,$0000,$0000 
    dw Instruction_PaletteFXObject_Done 
    dw $0002,$1186,$00A3,$0040,$00EF,$0048,$0004,$0001 
    dw Instruction_PaletteFXObject_Done 
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero 
    dw UNUSED_InstList_PaletteFXObject_DarkLightning_3_8DED34 
    dw Instruction_PaletteFXObject_GotoY 
    dw UNUSED_InstList_PaletteFXObject_DarkLightning_1_8DEC76 

UNUSED_PreInst_PalFXObj_RestartDarkLightningIfSamus_8DED84:
    LDA.W $0AFA 
    CMP.W #$0380 
    BCS .return 
    LDA.W #$0001 : STA.W $1ECD,X 
    LDA.W #UNUSED_InstList_PaletteFXObject_DarkLightning_1_8DEC76 : STA.W $1EBD,X 

.return:
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


InstList_PaletteFXObject_Brinstar1_0:
    dw Instruction_PaletteFXObject_ColorIndexInY 
    dw $00E2 

InstList_PaletteFXObject_Brinstar1_1:
    dw $000A,$5D22,$4463,$1840 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$5901,$4042,$1420 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$54E0,$3C21,$1000 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$50C0,$3C21,$1000 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$4CA0,$3800,$0C00 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$4880,$3800,$0C00 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$4460,$3400,$0800 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$4040,$3400,$0800 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$4460,$3400,$0800 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$4880,$3800,$0C00 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$4CA0,$3800,$0C00 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$50C0,$3C21,$1000 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$54E0,$3C21,$1000 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$5901,$4042,$1420 
    dw Instruction_PaletteFXObject_Done 
    dw Instruction_PaletteFXObject_GotoY 
    dw InstList_PaletteFXObject_Brinstar1_1 

InstList_PaletteFXObject_Brinstar8_0:
    dw Instruction_PaletteFXObject_PreInstructionInY 
    dw PreInstruction_PaletteFXObject_DeleteIfAreaMiniBossIsDead 
    dw Instruction_PaletteFXObject_ColorIndexInY 
    dw $00E2 

InstList_PaletteFXObject_Brinstar8_1:
    dw $000A,$5D22,$4463,$1840 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$5901,$4042,$1420 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$54E0,$3C21,$1000 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$50C0,$3C21,$1000 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$4CA0,$3800,$0C00 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$4880,$3800,$0C00 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$4460,$3400,$0800 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$4040,$3400,$0800 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$4460,$3400,$0800 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$4880,$3800,$0C00 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$4CA0,$3800,$0C00 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$50C0,$3C21,$1000 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$54E0,$3C21,$1000 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$5901,$4042,$1420 
    dw Instruction_PaletteFXObject_Done 
    dw Instruction_PaletteFXObject_GotoY 
    dw InstList_PaletteFXObject_Brinstar8_1 

PreInstruction_PaletteFXObject_DeleteIfAreaMiniBossIsDead:
    PHX 
    LDX.W $079F 
    LDA.L $7ED828,X 
    PLX 
    AND.W #$0002 
    BEQ .return 
    STZ.W $1E7D,X 

.return:
    RTS 


InstList_PaletteFXObject_Brinstar2_0:
    dw Instruction_PaletteFXObject_ColorIndexInY 
    dw $00C8 

InstList_PaletteFXObject_Brinstar2_1:
    dw $000A,$4C17,$280F,$2409,$1C07,$1405,$0C03,$0802 
    dw $0401 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$4816,$240E,$2008,$1806,$1004,$0802,$0401 
    dw $0000 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$4415,$200D,$1C07,$1405,$0C03,$0401,$0000 
    dw $0000 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$4014,$1C0C,$1806,$1004,$0802,$0000,$0000 
    dw $0000 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$3C13,$180B,$1405,$0C03,$0401,$0000,$0000 
    dw $0000 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$3812,$140A,$1004,$0802,$0000,$0000,$0000 
    dw $0000 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$3411,$1009,$0C03,$0401,$0000,$0000,$0000 
    dw $0000 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$3010,$0C08,$0802,$0000,$0000,$0000,$0000 
    dw $0000 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$3411,$1009,$0C03,$0401,$0000,$0000,$0000 
    dw $0000 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$3812,$140A,$1004,$0802,$0000,$0000,$0000 
    dw $0000 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$3C13,$180B,$1405,$0C03,$0401,$0000,$0000 
    dw $0000 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$4014,$1C0C,$1806,$1004,$0802,$0000,$0000 
    dw $0000 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$4415,$200D,$1C07,$1405,$0C03,$0401,$0000 
    dw $0000 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$4816,$240E,$2008,$1806,$1004,$0802,$0401 
    dw $0000 
    dw Instruction_PaletteFXObject_Done 
    dw Instruction_PaletteFXObject_GotoY 
    dw InstList_PaletteFXObject_Brinstar2_1 

InstList_PaletteFXObject_Crateria80_Brinstar4_0:
    dw Instruction_PaletteFXObject_ColorIndexInY 
    dw $00E2 

InstList_PaletteFXObject_Crateria80_Brinstar4_1:
    dw $000A,$02BF,$017F,$0015 
    dw Instruction_PaletteFXObject_ColorIndex_Plus12 
    dw $7FFF 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$023B,$00FB,$0011 
    dw Instruction_PaletteFXObject_ColorIndex_Plus12 
    dw $739C 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$01D8,$0098,$000E 
    dw Instruction_PaletteFXObject_ColorIndex_Plus12 
    dw $5AD6 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$0154,$0055,$000B 
    dw Instruction_PaletteFXObject_ColorIndex_Plus12 
    dw $4E73 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$00D0,$0010,$0007 
    dw Instruction_PaletteFXObject_ColorIndex_Plus12 
    dw $4631 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$00AA,$000B,$0004 
    dw Instruction_PaletteFXObject_ColorIndex_Plus12 
    dw $3DEF 
    dw Instruction_PaletteFXObject_Done 
    dw UNUSED_Inst_PaletteFXObject_QueueSoundInY_Lib2_Max6_8DC673 
    db $18 
    dw $000A,$00D0,$0010,$0007 
    dw Instruction_PaletteFXObject_ColorIndex_Plus12 
    dw $4631 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$0154,$0055,$000B 
    dw Instruction_PaletteFXObject_ColorIndex_Plus12 
    dw $4E73 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$01D8,$0098,$000E 
    dw Instruction_PaletteFXObject_ColorIndex_Plus12 
    dw $5AD6 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$023B,$00FB,$0011 
    dw Instruction_PaletteFXObject_ColorIndex_Plus12 
    dw $739C 
    dw Instruction_PaletteFXObject_Done 
    dw Instruction_PaletteFXObject_GotoY 
    dw InstList_PaletteFXObject_Crateria80_Brinstar4_1 

InstList_PaletteFXObject_Norfair2_0:
    dw Instruction_PaletteFXObject_ColorIndexInY 
    dw $006A 

InstList_PaletteFXObject_Norfair2_1:
    dw Instruction_PaletteFXObject_1EED_InY 
    db $00 
    dw $0010,$09FD,$093B,$0459 
    dw Instruction_PaletteFXObject_ColorIndex_Plus8 
    dw $09FD,$4A52 
    dw Instruction_PaletteFXObject_Done 
    dw Instruction_PaletteFXObject_1EED_InY 
    db $01 
    dw $0004,$0E3D,$0D7C,$089A 
    dw Instruction_PaletteFXObject_ColorIndex_Plus8 
    dw $0E3D,$4214 
    dw Instruction_PaletteFXObject_Done 
    dw Instruction_PaletteFXObject_1EED_InY 
    db $02 
    dw $0004,$165E,$0DBC,$08FB 
    dw Instruction_PaletteFXObject_ColorIndex_Plus8 
    dw $165E,$39F5 
    dw Instruction_PaletteFXObject_Done 
    dw Instruction_PaletteFXObject_1EED_InY 
    db $03 
    dw $0005,$1A9E,$11FD,$0D3C 
    dw Instruction_PaletteFXObject_ColorIndex_Plus8 
    dw $1A9E,$31D7 
    dw Instruction_PaletteFXObject_Done 
    dw Instruction_PaletteFXObject_1EED_InY 
    db $04 
    dw $0006,$1EBE,$161D,$119C 
    dw Instruction_PaletteFXObject_ColorIndex_Plus8 
    dw $1EBE,$29D9 
    dw Instruction_PaletteFXObject_Done 
    dw Instruction_PaletteFXObject_1EED_InY 
    db $05 
    dw $0007,$22FE,$1A5E,$15DD 
    dw Instruction_PaletteFXObject_ColorIndex_Plus8 
    dw $22FE,$21BA 
    dw Instruction_PaletteFXObject_Done 
    dw Instruction_PaletteFXObject_1EED_InY 
    db $06 
    dw $0008,$2B1F,$1A9E,$163E 
    dw Instruction_PaletteFXObject_ColorIndex_Plus8 
    dw $2B1F,$199C 
    dw Instruction_PaletteFXObject_Done 
    dw Instruction_PaletteFXObject_1EED_InY 
    db $07 
    dw $0008,$2F5F,$1EDF,$1A7F 
    dw Instruction_PaletteFXObject_ColorIndex_Plus8 
    dw $2F5F,$0D7F 
    dw Instruction_PaletteFXObject_Done 
    dw Instruction_PaletteFXObject_1EED_InY 
    db $08 
    dw $0008,$2F5F,$1EDF,$1A7F 
    dw Instruction_PaletteFXObject_ColorIndex_Plus8 
    dw $2F5F,$0D7F 
    dw Instruction_PaletteFXObject_Done 
    dw Instruction_PaletteFXObject_1EED_InY 
    db $09 
    dw $0008,$2B1F,$1A9E,$163E 
    dw Instruction_PaletteFXObject_ColorIndex_Plus8 
    dw $2B1F,$199C 
    dw Instruction_PaletteFXObject_Done 
    dw Instruction_PaletteFXObject_1EED_InY 
    db $0A 
    dw $0007,$22FE,$1A5E,$15DD 
    dw Instruction_PaletteFXObject_ColorIndex_Plus8 
    dw $22FE,$21BA 
    dw Instruction_PaletteFXObject_Done 
    dw Instruction_PaletteFXObject_1EED_InY 
    db $0B 
    dw $0006,$1EBE,$161D,$119C 
    dw Instruction_PaletteFXObject_ColorIndex_Plus8 
    dw $1EBE,$29D9 
    dw Instruction_PaletteFXObject_Done 
    dw Instruction_PaletteFXObject_1EED_InY 
    db $0C 
    dw $0005,$1A9E,$11FD,$0D3C 
    dw Instruction_PaletteFXObject_ColorIndex_Plus8 
    dw $1A9E,$31D7 
    dw Instruction_PaletteFXObject_Done 
    dw Instruction_PaletteFXObject_1EED_InY 
    db $0D 
    dw $0004,$165E,$0DBC,$08FB 
    dw Instruction_PaletteFXObject_ColorIndex_Plus8 
    dw $165E,$39F5 
    dw Instruction_PaletteFXObject_Done 
    dw Instruction_PaletteFXObject_1EED_InY 
    db $0E 
    dw $0004,$0E3D,$0D7C,$089A 
    dw Instruction_PaletteFXObject_ColorIndex_Plus8 
    dw $0E3D,$4214 
    dw Instruction_PaletteFXObject_Done 
    dw Instruction_PaletteFXObject_1EED_InY 
    db $0F 
    dw $0010,$09FD,$093B,$0459 
    dw Instruction_PaletteFXObject_ColorIndex_Plus8 
    dw $09FD,$4A52 
    dw Instruction_PaletteFXObject_Done 
    dw Instruction_PaletteFXObject_GotoY 
    dw InstList_PaletteFXObject_Norfair2_1 

Instruction_PaletteFXObject_1EED_InY:
    LDA.W $0000,Y 
    AND.W #$00FF 
    STA.W $1EED 
    INY 
    RTS 


InstList_PaletteFXObject_Norfair4_0:
    dw Instruction_PaletteFXObject_ColorIndexInY 
    dw $0082 

InstList_PaletteFXObject_Norfair4_1:
    dw $0010,$09FD,$093B,$0459 
    dw Instruction_PaletteFXObject_ColorIndex_Plus10 
    dw $4309,$0C77 
    dw Instruction_PaletteFXObject_Done 
    dw $0004,$0E3D,$0D7C,$089A 
    dw Instruction_PaletteFXObject_ColorIndex_Plus10 
    dw $36AC,$0CB8 
    dw Instruction_PaletteFXObject_Done 
    dw $0004,$165E,$0DBC,$08FB 
    dw Instruction_PaletteFXObject_ColorIndex_Plus10 
    dw $328F,$1119 
    dw Instruction_PaletteFXObject_Done 
    dw $0005,$1A9E,$11FD,$0D3C 
    dw Instruction_PaletteFXObject_ColorIndex_Plus10 
    dw $2A52,$157A 
    dw Instruction_PaletteFXObject_Done 
    dw $0006,$1EBE,$161D,$119C 
    dw Instruction_PaletteFXObject_ColorIndex_Plus10 
    dw $2214,$15BB 
    dw Instruction_PaletteFXObject_Done 
    dw $0007,$22FE,$1A5E,$15DD 
    dw Instruction_PaletteFXObject_ColorIndex_Plus10 
    dw $1DF7,$1A1C 
    dw Instruction_PaletteFXObject_Done 
    dw $0008,$2B1F,$1A9E,$163E 
    dw Instruction_PaletteFXObject_ColorIndex_Plus10 
    dw $15BA,$1E7D 
    dw Instruction_PaletteFXObject_Done 
    dw $0008,$2F5F,$1EDF,$1A7F 
    dw Instruction_PaletteFXObject_ColorIndex_Plus10 
    dw $0D7F,$22FF 
    dw Instruction_PaletteFXObject_Done 
    dw $0008,$2F5F,$1EDF,$1A7F 
    dw Instruction_PaletteFXObject_ColorIndex_Plus10 
    dw $0D7F,$22FF 
    dw Instruction_PaletteFXObject_Done 
    dw $0008,$2B1F,$1A9E,$163E 
    dw Instruction_PaletteFXObject_ColorIndex_Plus10 
    dw $15BA,$1E7D 
    dw Instruction_PaletteFXObject_Done 
    dw $0007,$22FE,$1A5E,$15DD 
    dw Instruction_PaletteFXObject_ColorIndex_Plus10 
    dw $1DF7,$1A1C 
    dw Instruction_PaletteFXObject_Done 
    dw $0006,$1EBE,$161D,$119C 
    dw Instruction_PaletteFXObject_ColorIndex_Plus10 
    dw $2214,$15BB 
    dw Instruction_PaletteFXObject_Done 
    dw $0005,$1A9E,$11FD,$0D3C 
    dw Instruction_PaletteFXObject_ColorIndex_Plus10 
    dw $2A52,$157A 
    dw Instruction_PaletteFXObject_Done 
    dw $0004,$165E,$0DBC,$08FB 
    dw Instruction_PaletteFXObject_ColorIndex_Plus10 
    dw $328F,$1119 
    dw Instruction_PaletteFXObject_Done 
    dw $0004,$0E3D,$0D7C,$089A 
    dw Instruction_PaletteFXObject_ColorIndex_Plus10 
    dw $36AC,$0CB8 
    dw Instruction_PaletteFXObject_Done 
    dw $0010,$09FD,$093B,$0459 
    dw Instruction_PaletteFXObject_ColorIndex_Plus10 
    dw $4309,$0C77 
    dw Instruction_PaletteFXObject_Done 
    dw Instruction_PaletteFXObject_GotoY 
    dw InstList_PaletteFXObject_Norfair4_1 

InstList_PaletteFXObject_Norfair8_0:
    dw Instruction_PaletteFXObject_ColorIndexInY 
    dw $00A2 

InstList_PaletteFXObject_Norfair8_1:
    dw $0010,$09FD,$093B,$0459 
    dw Instruction_PaletteFXObject_ColorIndex_Plus10 
    dw $2DB3,$38CF 
    dw Instruction_PaletteFXObject_Done 
    dw $0004,$0E3D,$0D7C,$089A 
    dw Instruction_PaletteFXObject_ColorIndex_Plus10 
    dw $2594,$30D1 
    dw Instruction_PaletteFXObject_Done 
    dw $0004,$165E,$0DBC,$08FB 
    dw Instruction_PaletteFXObject_ColorIndex_Plus10 
    dw $2176,$28D3 
    dw Instruction_PaletteFXObject_Done 
    dw $0005,$1A9E,$11FD,$0D3C 
    dw Instruction_PaletteFXObject_ColorIndex_Plus10 
    dw $1D57,$24D5 
    dw Instruction_PaletteFXObject_Done 
    dw $0006,$1EBE,$161D,$119C 
    dw Instruction_PaletteFXObject_ColorIndex_Plus10 
    dw $1959,$20F7 
    dw Instruction_PaletteFXObject_Done 
    dw $0007,$22FE,$1A5E,$15DD 
    dw Instruction_PaletteFXObject_ColorIndex_Plus10 
    dw $153B,$18F9 
    dw Instruction_PaletteFXObject_Done 
    dw $0008,$2B1F,$1A9E,$163E 
    dw Instruction_PaletteFXObject_ColorIndex_Plus10 
    dw $111C,$14FB 
    dw Instruction_PaletteFXObject_Done 
    dw $0008,$2F5F,$1EDF,$1A7F 
    dw Instruction_PaletteFXObject_ColorIndex_Plus10 
    dw $0D1F,$0D1F 
    dw Instruction_PaletteFXObject_Done 
    dw $0008,$2F5F,$1EDF,$1A7F 
    dw Instruction_PaletteFXObject_ColorIndex_Plus10 
    dw $0D1F,$0D1F 
    dw Instruction_PaletteFXObject_Done 
    dw $0008,$2B1F,$1A9E,$163E 
    dw Instruction_PaletteFXObject_ColorIndex_Plus10 
    dw $111C,$14FB 
    dw Instruction_PaletteFXObject_Done 
    dw $0007,$22FE,$1A5E,$15DD 
    dw Instruction_PaletteFXObject_ColorIndex_Plus10 
    dw $153B,$18F9 
    dw Instruction_PaletteFXObject_Done 
    dw $0006,$1EBE,$161D,$119C 
    dw Instruction_PaletteFXObject_ColorIndex_Plus10 
    dw $1959,$20F7 
    dw Instruction_PaletteFXObject_Done 
    dw $0005,$1A9E,$11FD,$0D3C 
    dw Instruction_PaletteFXObject_ColorIndex_Plus10 
    dw $1D57,$24D5 
    dw Instruction_PaletteFXObject_Done 
    dw $0004,$165E,$0DBC,$08FB 
    dw Instruction_PaletteFXObject_ColorIndex_Plus10 
    dw $2176,$28D3 
    dw Instruction_PaletteFXObject_Done 
    dw $0004,$0E3D,$0D7C,$089A 
    dw Instruction_PaletteFXObject_ColorIndex_Plus10 
    dw $2594,$30D1 
    dw Instruction_PaletteFXObject_Done 
    dw $0010,$09FD,$093B,$0459 
    dw Instruction_PaletteFXObject_ColorIndex_Plus10 
    dw $2DB3,$38CF 
    dw Instruction_PaletteFXObject_Done 
    dw Instruction_PaletteFXObject_GotoY 
    dw InstList_PaletteFXObject_Norfair8_1 

InstList_PaletteFXObject_Norfair10_0:
    dw Instruction_PaletteFXObject_ColorIndexInY 
    dw $00C2 

InstList_PaletteFXObject_Norfair10_1:
    dw $0010,$09DA,$091A,$087A 
    dw Instruction_PaletteFXObject_ColorIndex_Plus10 
    dw $08A8,$0C05 
    dw Instruction_PaletteFXObject_Done 
    dw $0004,$0DDA,$093A,$089A 
    dw Instruction_PaletteFXObject_ColorIndex_Plus10 
    dw $08AA,$0828 
    dw Instruction_PaletteFXObject_Done 
    dw $0004,$0DFA,$0D5A,$08BA 
    dw Instruction_PaletteFXObject_ColorIndex_Plus10 
    dw $08AC,$084A 
    dw Instruction_PaletteFXObject_Done 
    dw $0005,$11FA,$0D7A,$08FA 
    dw Instruction_PaletteFXObject_ColorIndex_Plus10 
    dw $08CF,$086D 
    dw Instruction_PaletteFXObject_Done 
    dw $0006,$161A,$119A,$0D1A 
    dw Instruction_PaletteFXObject_ColorIndex_Plus10 
    dw $08D1,$0890 
    dw Instruction_PaletteFXObject_Done 
    dw $0007,$1A1A,$11BA,$0D3A 
    dw Instruction_PaletteFXObject_ColorIndex_Plus10 
    dw $08F4,$08B3 
    dw Instruction_PaletteFXObject_Done 
    dw $0008,$1A3A,$15DA,$0D7A 
    dw Instruction_PaletteFXObject_ColorIndex_Plus10 
    dw $08F6,$08D5 
    dw Instruction_PaletteFXObject_Done 
    dw $0008,$225A,$1A1A,$11BA 
    dw Instruction_PaletteFXObject_ColorIndex_Plus10 
    dw $091A,$091A 
    dw Instruction_PaletteFXObject_Done 
    dw $0008,$225A,$1A1A,$11BA 
    dw Instruction_PaletteFXObject_ColorIndex_Plus10 
    dw $091A,$091A 
    dw Instruction_PaletteFXObject_Done 
    dw $0008,$1A3A,$15DA,$0D7A 
    dw Instruction_PaletteFXObject_ColorIndex_Plus10 
    dw $08F6,$08D5 
    dw Instruction_PaletteFXObject_Done 
    dw $0007,$1A1A,$11BA,$0D3A 
    dw Instruction_PaletteFXObject_ColorIndex_Plus10 
    dw $08F4,$08B3 
    dw Instruction_PaletteFXObject_Done 
    dw $0006,$161A,$119A,$0D1A 
    dw Instruction_PaletteFXObject_ColorIndex_Plus10 
    dw $08D1,$0890 
    dw Instruction_PaletteFXObject_Done 
    dw $0005,$11FA,$0D7A,$08FA 
    dw Instruction_PaletteFXObject_ColorIndex_Plus10 
    dw $08CF,$086D 
    dw Instruction_PaletteFXObject_Done 
    dw $0004,$0DFA,$0D5A,$08BA 
    dw Instruction_PaletteFXObject_ColorIndex_Plus10 
    dw $08AC,$084A 
    dw Instruction_PaletteFXObject_Done 
    dw $0004,$0DDA,$093A,$089A 
    dw Instruction_PaletteFXObject_ColorIndex_Plus10 
    dw $08AA,$0828 
    dw Instruction_PaletteFXObject_Done 
    dw $0010,$09DA,$091A,$087A 
    dw Instruction_PaletteFXObject_ColorIndex_Plus10 
    dw $08A8,$0C05 
    dw Instruction_PaletteFXObject_Done 
    dw Instruction_PaletteFXObject_GotoY 
    dw InstList_PaletteFXObject_Norfair10_1 

InstList_PaletteFXObject_Maridia1_0:
    dw Instruction_PaletteFXObject_ColorIndexInY 
    dw $0048 

InstList_PaletteFXObject_Maridia1_1:
    dw $000A,$3ED9,$2E57,$2A35,$25F3,$25D2,$1DB0,$196E 
    dw $112E 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$2E57,$2A35,$25F3,$3ED9,$1DB0,$196E,$112E 
    dw $25D2 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$2A35,$25F3,$3ED9,$2E57,$196E,$112E,$25D2 
    dw $1DB0 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$25F3,$3ED9,$2E57,$2A35,$112E,$25D2,$1DB0 
    dw $196E 
    dw Instruction_PaletteFXObject_Done 
    dw Instruction_PaletteFXObject_GotoY 
    dw InstList_PaletteFXObject_Maridia1_1 

InstList_PaletteFXObject_Maridia2_0:
    dw Instruction_PaletteFXObject_ColorIndexInY 
    dw $0050 

InstList_PaletteFXObject_Maridia2_1:
    dw $000A,$25D2,$1DB0,$196E,$112E 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$1DB0,$196E,$112E,$25D2 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$196E,$112E,$25D2,$1DB0 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$112E,$25D2,$1DB0,$196E 
    dw Instruction_PaletteFXObject_Done 
    dw Instruction_PaletteFXObject_GotoY 
    dw InstList_PaletteFXObject_Maridia2_1 

InstList_PaletteFXObject_Maridia4_0:
    dw Instruction_PaletteFXObject_ColorIndexInY 
    dw $0068 

InstList_PaletteFXObject_Maridia4_1:
    dw $0002,$0400,$0C22,$1864,$2086,$2CC9,$1C65,$1043 
    dw $0821 
    dw Instruction_PaletteFXObject_Done 
    dw $0002,$0C22,$1864,$2086,$2CC9,$1C65,$1043,$0821 
    dw $0400 
    dw Instruction_PaletteFXObject_Done 
    dw $0002,$1864,$2086,$2CC9,$1C65,$1043,$0821,$0400 
    dw $0C22 
    dw Instruction_PaletteFXObject_Done 
    dw $0002,$2086,$2CC9,$1C65,$1043,$0821,$0400,$0C22 
    dw $1864 
    dw Instruction_PaletteFXObject_Done 
    dw $0002,$2CC9,$1C65,$1043,$0821,$0400,$0C22,$1864 
    dw $2086 
    dw Instruction_PaletteFXObject_Done 
    dw $0002,$1C65,$1043,$0821,$0400,$0C22,$1864,$2086 
    dw $2CC9 
    dw Instruction_PaletteFXObject_Done 
    dw $0002,$1043,$0821,$0400,$0C22,$1864,$2086,$2CC9 
    dw $1C65 
    dw Instruction_PaletteFXObject_Done 
    dw $0002,$0821,$0400,$0C22,$1864,$2086,$2CC9,$1C65 
    dw $1043 
    dw Instruction_PaletteFXObject_Done 
    dw Instruction_PaletteFXObject_GotoY 
    dw InstList_PaletteFXObject_Maridia4_1 

PreInstruction_PaletteFXObject_DeleteIf2MoreObjectsSpawned:
    LDA.W $1E79,X 
    BEQ .return 
    STZ.W $1E7D,X 

.return:
    RTS 


InstList_PaletteFXObject_Tourian4:
    dw Instruction_PaletteFXObject_ColorIndexInY 
    dw $00E8 
    dw Instruction_PaletteFXObject_GotoY 
    dw InstList_PaletteFXObject_Common_Tourian2_Tourian4_0 

InstList_PaletteFXObject_Tourian2:
    dw Instruction_PaletteFXObject_ColorIndexInY 
    dw $00E8 

InstList_PaletteFXObject_Common_Tourian2_Tourian4_0:
    dw Instruction_PaletteFXObject_PreInstructionInY 
    dw PreInstruction_PaletteFXObject_DeleteIf2MoreObjectsSpawned 

InstList_PaletteFXObject_Common_Tourian2_Tourian4_1:
    dw $000A,$5294 
    dw Instruction_PaletteFXObject_ColorIndex_Plus6 
    dw $0019,$0012,$5C00,$4000,$1084,$197F,$7FFF 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$4A52 
    dw Instruction_PaletteFXObject_ColorIndex_Plus6 
    dw $0016,$000F,$5000,$3400,$1084,$0D1C,$739C 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$4210 
    dw Instruction_PaletteFXObject_ColorIndex_Plus6 
    dw $0013,$000C,$4400,$2800,$1084,$00B9,$6739 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$39CE 
    dw Instruction_PaletteFXObject_ColorIndex_Plus6 
    dw $0010,$0009,$3800,$1C00,$1084,$0056,$5AD6 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$318C 
    dw Instruction_PaletteFXObject_ColorIndex_Plus6 
    dw $000D,$0006,$2C00,$1000,$1084,$0013,$4E73 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$294A 
    dw Instruction_PaletteFXObject_ColorIndex_Plus6 
    dw $000A,$0003,$2000,$0400,$1084,$0010,$4210 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$294A 
    dw Instruction_PaletteFXObject_ColorIndex_Plus6 
    dw $000A,$0003,$2000,$0400,$1084,$0010,$4210 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$318C 
    dw Instruction_PaletteFXObject_ColorIndex_Plus6 
    dw $000D,$0006,$2C00,$1000,$1084,$0013,$4E73 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$39CE 
    dw Instruction_PaletteFXObject_ColorIndex_Plus6 
    dw $0010,$0009,$3800,$1C00,$1084,$0056,$5AD6 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$4210 
    dw Instruction_PaletteFXObject_ColorIndex_Plus6 
    dw $0013,$000C,$4400,$2800,$1084,$00B9,$6739 
    dw Instruction_PaletteFXObject_Done 
    dw $000A,$4A52 
    dw Instruction_PaletteFXObject_ColorIndex_Plus6 
    dw $0016,$000F,$5000,$3400,$1084,$0D1C,$739C 
    dw Instruction_PaletteFXObject_Done 
    dw Instruction_PaletteFXObject_GotoY 
    dw InstList_PaletteFXObject_Common_Tourian2_Tourian4_1 

Setup_PaletteFXObject_Brinstar8:
    PHX 
    LDX.W $079F 
    LDA.L $7ED828,X 
    PLX 
    AND.W #$0002 
    BEQ .return 
    LDA.W #$0000 : STA.W $1E7D,Y 

.return:
    RTS 


PaletteFXObjects_Nothing:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_Nothing 

PaletteFXObjects_GreyOutTourianStatue_Draygon:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_GreyOutTourianStatue_Draygon 

PaletteFXObjects_GreyOutTourianStatue_Kraid:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_GreyOutTourianStatue_Kraid 

PaletteFXObjects_GreyOutTourianStatue_Ridley:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_GreyOutTourianStatue_Ridley 

PaletteFXObjects_GreyOutTourianStatue_Phantoon:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_GreyOutTourianStatue_Phantoon 

PaletteFXObjects_BombTorizoBelly:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_BombTorizoBelly_0 

PaletteFXObjects_GoldenTorizoBelly:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_GoldenTorizoBelly_0 

PaletteFXObjects_Norfair1_Tourian1:
    dw Setup_PaletteFXObject_Norfair1_Tourian1 
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_0 

PaletteFXObjects_Crateria1_Lightning:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_Crateria1_0 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_PaletteFXObjects_DarkLightning_8DF769:
    dw RTS_8DC685 
    dw UNUSED_InstList_PaletteFXObject_DarkLightning_0_8DEC6E 
endif ; !FEATURE_KEEP_UNREFERENCED

PaletteFXObjects_WreckedShip1_GreenLights:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_WreckedShip1_0 

PaletteFXObjects_WreckedShip1_GreenLights_duplicate:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_WreckedShip1_0 

PaletteFXObjects_Brinstar1_BlueBackgroundSpores:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_Brinstar1_0 

PaletteFXObjects_Brinstar8_SporeSpawnBlueBackgroundSpores:
    dw Setup_PaletteFXObject_Brinstar8 
    dw InstList_PaletteFXObject_Brinstar8_0 

PaletteFXObjects_Brinstar2_RedBackgroundGlow:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_Brinstar2_0 

PaletteFXObjects_Crateria80_Brinstar4_BeaconFlashing:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_Crateria80_Brinstar4_0 

PaletteFXObjects_Norfair2:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_Norfair2_0 

PaletteFXObjects_Norfair4:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_Norfair4_0 

PaletteFXObjects_Norfair8:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_Norfair8_0 

PaletteFXObjects_Norfair10:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_Norfair10_0 

PaletteFXObjects_Maridia1_SandPits:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_Maridia1_0 

PaletteFXObjects_Maridia2_SandFalls:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_Maridia2_0 

PaletteFXObjects_Maridia4_BackgroundWaterfalls:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_Maridia4_0 

PaletteFXObjects_Tourian2_GlowingArkanoidBlocksAndRedOrbs:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_Tourian2 

UNUSED_PaletteFXObjects_Tourian4_8DF7A5:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_Tourian4 

InstList_PaletteFXObject_Tourian8_0:
    dw Instruction_PaletteFXObject_ColorIndexInY 
    dw $0132 

InstList_PaletteFXObject_Tourian8_1:
    dw $0002,$5294,$4210,$318C,$2108,$1084,$7FFF 
    dw Instruction_PaletteFXObject_Done 
    dw $0002,$4E75,$3DF1,$2D6D,$1CE8,$0C64,$77BF 
    dw Instruction_PaletteFXObject_Done 
    dw $0002,$4A55,$39D1,$2D6D,$1CE8,$0C64,$739F 
    dw Instruction_PaletteFXObject_Done 
    dw $0002,$4636,$35B2,$294D,$18C9,$0844,$6B5F 
    dw Instruction_PaletteFXObject_Done 
    dw $0002,$3DF6,$3192,$252D,$14A9,$0844,$673F 
    dw Instruction_PaletteFXObject_Done 
    dw $0002,$39D7,$2D72,$210E,$1089,$0424,$5EFF 
    dw Instruction_PaletteFXObject_Done 
    dw $0002,$35B7,$2952,$1CEE,$1089,$0424,$5ADF 
    dw Instruction_PaletteFXObject_Done 
    dw $0002,$3198,$2533,$18CE,$0C69,$0004,$529F 
    dw Instruction_PaletteFXObject_Done 
    dw $0002,$35B7,$2952,$1CEE,$1089,$0424,$5ADF 
    dw Instruction_PaletteFXObject_Done 
    dw $0002,$39D7,$2D72,$210E,$1089,$0424,$5EFF 
    dw Instruction_PaletteFXObject_Done 
    dw $0002,$3DF6,$3192,$252D,$14A9,$0844,$673F 
    dw Instruction_PaletteFXObject_Done 
    dw $0002,$4636,$35B2,$294D,$18C9,$0844,$6B5F 
    dw Instruction_PaletteFXObject_Done 
    dw $0002,$4A55,$39D1,$2D6D,$1CE8,$0C64,$739F 
    dw Instruction_PaletteFXObject_Done 
    dw $0002,$4E75,$3DF1,$2D6D,$1CE8,$0C64,$77BF 
    dw Instruction_PaletteFXObject_Done 
    dw Instruction_PaletteFXObject_GotoY 
    dw InstList_PaletteFXObject_Tourian8_1 

InstList_PaletteFXObject_Tourian10_0:
    dw Instruction_PaletteFXObject_ColorIndexInY 
    dw $0070 

InstList_PaletteFXObject_Tourian10_1:
    dw $0004,$081A,$0812,$042B,$0423 
    dw Instruction_PaletteFXObject_Done 
    dw $0004,$0C37,$0C30,$042A,$0423 
    dw Instruction_PaletteFXObject_Done 
    dw $0004,$1054,$0C2E,$0849,$0422 
    dw Instruction_PaletteFXObject_Done 
    dw $0004,$1471,$104C,$0848,$0422 
    dw Instruction_PaletteFXObject_Done 
    dw $0004,$148E,$106A,$0C66,$0842 
    dw Instruction_PaletteFXObject_Done 
    dw $0004,$18AB,$1488,$0C65,$0842 
    dw Instruction_PaletteFXObject_Done 
    dw $0004,$1CC8,$1486,$1084,$0841 
    dw Instruction_PaletteFXObject_Done 
    dw $0004,$20E5,$18A4,$1083,$0841 
    dw Instruction_PaletteFXObject_Done 
    dw $0004,$1CC8,$1486,$1084,$0841 
    dw Instruction_PaletteFXObject_Done 
    dw $0004,$18AB,$1488,$0C65,$0842 
    dw Instruction_PaletteFXObject_Done 
    dw $0004,$148E,$106A,$0C66,$0842 
    dw Instruction_PaletteFXObject_Done 
    dw $0004,$1471,$104C,$0848,$0422 
    dw Instruction_PaletteFXObject_Done 
    dw $0004,$1054,$0C2E,$0849,$0422 
    dw Instruction_PaletteFXObject_Done 
    dw $0004,$0C37,$0C30,$042A,$0423 
    dw Instruction_PaletteFXObject_Done 
    dw Instruction_PaletteFXObject_GotoY 
    dw InstList_PaletteFXObject_Tourian10_1 

InstList_PaletteFXObject_Tourian20:
    dw Instruction_PaletteFXObject_ColorIndexInY 
    dw $00A8 
    dw Instruction_PaletteFXObject_GotoY 
    dw InstList_PaletteFXObject_Common_Tourian20_Tourian40 

InstList_PaletteFXObject_Tourian40:
    dw Instruction_PaletteFXObject_ColorIndexInY 
    dw $00E8 

InstList_PaletteFXObject_Common_Tourian20_Tourian40:
    dw $0002,$5294,$39CE,$2108,$1084,$0019,$0012 
    dw Instruction_PaletteFXObject_ColorIndex_Plus8 
    dw $7FFF 
    dw Instruction_PaletteFXObject_Done 
    dw $0002,$4E75,$35AF,$1CE8,$0C64,$080D,$0809 
    dw Instruction_PaletteFXObject_ColorIndex_Plus8 
    dw $77BF 
    dw Instruction_PaletteFXObject_Done 
    dw $0002,$4A55,$318F,$1CE9,$0C64,$1000,$1000 
    dw Instruction_PaletteFXObject_ColorIndex_Plus8 
    dw $739F 
    dw Instruction_PaletteFXObject_Done 
    dw $0002,$4636,$2D70,$18C9,$0844,$080D,$0809 
    dw Instruction_PaletteFXObject_ColorIndex_Plus8 
    dw $6B5F 
    dw Instruction_PaletteFXObject_Done 
    dw $0002,$3DF6,$2D70,$18CA,$0844,$0019,$0012 
    dw Instruction_PaletteFXObject_ColorIndex_Plus8 
    dw $673F 
    dw Instruction_PaletteFXObject_Done 
    dw $0002,$39D7,$2951,$14AA,$0424,$080D,$0809 
    dw Instruction_PaletteFXObject_ColorIndex_Plus8 
    dw $5EFF 
    dw Instruction_PaletteFXObject_Done 
    dw $0002,$35B7,$2531,$14AB,$0424,$1000,$1000 
    dw Instruction_PaletteFXObject_ColorIndex_Plus8 
    dw $5ADF 
    dw Instruction_PaletteFXObject_Done 
    dw $0002,$3198,$2112,$108B,$0004,$080D,$0809 
    dw Instruction_PaletteFXObject_ColorIndex_Plus8 
    dw $529F 
    dw Instruction_PaletteFXObject_Done 
    dw $0002,$35B7,$2531,$14AB,$0424,$1000,$1000 
    dw Instruction_PaletteFXObject_ColorIndex_Plus8 
    dw $5ADF 
    dw Instruction_PaletteFXObject_Done 
    dw $0002,$39D7,$2951,$14AA,$0424,$080D,$0809 
    dw Instruction_PaletteFXObject_ColorIndex_Plus8 
    dw $5EFF 
    dw Instruction_PaletteFXObject_Done 
    dw $0002,$3DF6,$2D70,$18CA,$0844,$0019,$0012 
    dw Instruction_PaletteFXObject_ColorIndex_Plus8 
    dw $673F 
    dw Instruction_PaletteFXObject_Done 
    dw $0002,$4636,$2D70,$18C9,$0844,$080D,$0809 
    dw Instruction_PaletteFXObject_ColorIndex_Plus8 
    dw $6B5F 
    dw Instruction_PaletteFXObject_Done 
    dw $0002,$4A55,$318F,$1CE9,$0C64,$1000,$1000 
    dw Instruction_PaletteFXObject_ColorIndex_Plus8 
    dw $739F 
    dw Instruction_PaletteFXObject_Done 
    dw $0002,$4E75,$35AF,$1CE8,$0C64,$080D,$0809 
    dw Instruction_PaletteFXObject_ColorIndex_Plus8 
    dw $77BF 
    dw Instruction_PaletteFXObject_Done 
    dw Instruction_PaletteFXObject_GotoY 
    dw InstList_PaletteFXObject_Common_Tourian20_Tourian40 

InstList_PaletteFXObject_Crateria8_0:
    dw Instruction_PaletteFXObject_ColorIndexInY 
    dw $00A2 

InstList_PaletteFXObject_Crateria8_1:
    dw $0003,$5A73,$41AD,$28E7 
    dw Instruction_PaletteFXObject_ColorIndex_Plus8 
    dw $0019,$0012,$3460,$0C20 
    dw Instruction_PaletteFXObject_ColorIndex_Plus4 
    dw $7F9C 
    dw Instruction_PaletteFXObject_Done 
    dw $0003,$4E14,$396E,$24C8 
    dw Instruction_PaletteFXObject_ColorIndex_Plus8 
    dw $0014,$000E,$4900,$1C60 
    dw Instruction_PaletteFXObject_ColorIndex_Plus4 
    dw $6F3C 
    dw Instruction_PaletteFXObject_Done 
    dw $0003,$41D5,$312E,$1CA8 
    dw Instruction_PaletteFXObject_ColorIndex_Plus8 
    dw $000F,$000A,$5980,$2CA0 
    dw Instruction_PaletteFXObject_ColorIndex_Plus4 
    dw $62FD 
    dw Instruction_PaletteFXObject_Done 
    dw $0003,$3576,$28EF,$1889 
    dw Instruction_PaletteFXObject_ColorIndex_Plus8 
    dw $000A,$0005,$6E20,$38C0 
    dw Instruction_PaletteFXObject_ColorIndex_Plus4 
    dw $529D 
    dw Instruction_PaletteFXObject_Done 
    dw $0003,$2D17,$20D0,$1489 
    dw Instruction_PaletteFXObject_ColorIndex_Plus8 
    dw $0005,$0001,$7EA0,$4900 
    dw Instruction_PaletteFXObject_ColorIndex_Plus4 
    dw $423E 
    dw Instruction_PaletteFXObject_Done 
    dw $0003,$20B8,$1891,$106A 
    dw Instruction_PaletteFXObject_ColorIndex_Plus8 
    dw $000A,$0005,$6E20,$38C0 
    dw Instruction_PaletteFXObject_ColorIndex_Plus4 
    dw $31DE 
    dw Instruction_PaletteFXObject_Done 
    dw $0003,$1479,$1051,$084A 
    dw Instruction_PaletteFXObject_ColorIndex_Plus8 
    dw $000F,$000A,$5980,$2CA0 
    dw Instruction_PaletteFXObject_ColorIndex_Plus4 
    dw $259F 
    dw Instruction_PaletteFXObject_Done 
    dw $0003,$081A,$0812,$042B 
    dw Instruction_PaletteFXObject_ColorIndex_Plus8 
    dw $0014,$000E,$4900,$1C60 
    dw Instruction_PaletteFXObject_ColorIndex_Plus4 
    dw $153F 
    dw Instruction_PaletteFXObject_Done 
    dw $0003,$1479,$1051,$084A 
    dw Instruction_PaletteFXObject_ColorIndex_Plus8 
    dw $000F,$000A,$5980,$2CA0 
    dw Instruction_PaletteFXObject_ColorIndex_Plus4 
    dw $259F 
    dw Instruction_PaletteFXObject_Done 
    dw $0003,$20B8,$1891,$106A 
    dw Instruction_PaletteFXObject_ColorIndex_Plus8 
    dw $000A,$0005,$6E20,$38C0 
    dw Instruction_PaletteFXObject_ColorIndex_Plus4 
    dw $31DE 
    dw Instruction_PaletteFXObject_Done 
    dw $0003,$2D17,$20D0,$1489 
    dw Instruction_PaletteFXObject_ColorIndex_Plus8 
    dw $0005,$0001,$7EA0,$4900 
    dw Instruction_PaletteFXObject_ColorIndex_Plus4 
    dw $423E 
    dw Instruction_PaletteFXObject_Done 
    dw $0003,$3576,$28EF,$1889 
    dw Instruction_PaletteFXObject_ColorIndex_Plus8 
    dw $000A,$0005,$6E20,$38C0 
    dw Instruction_PaletteFXObject_ColorIndex_Plus4 
    dw $529D 
    dw Instruction_PaletteFXObject_Done 
    dw $0003,$41D5,$312E,$1CA8 
    dw Instruction_PaletteFXObject_ColorIndex_Plus8 
    dw $000F,$000A,$5980,$2CA0 
    dw Instruction_PaletteFXObject_ColorIndex_Plus4 
    dw $62FD 
    dw Instruction_PaletteFXObject_Done 
    dw $0003,$4E14,$396E,$24C8 
    dw Instruction_PaletteFXObject_ColorIndex_Plus8 
    dw $0014,$000E,$4900,$1C60 
    dw Instruction_PaletteFXObject_ColorIndex_Plus4 
    dw $6F3C 
    dw Instruction_PaletteFXObject_Done 
    dw Instruction_PaletteFXObject_GotoY 
    dw InstList_PaletteFXObject_Crateria8_1 

InstList_PaletteFXObject_Crateria10_0:
    dw Instruction_PaletteFXObject_ColorIndexInY 
    dw $00D2 

InstList_PaletteFXObject_Crateria10_1:
    dw $0010,$35AD,$1CE7,$0C63 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$29D0,$150A,$0885 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$1E14,$114D,$08A7 
    dw Instruction_PaletteFXObject_Done 
    dw $0002,$0E37,$096F,$04A8 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$025A,$0192,$00CA 
    dw Instruction_PaletteFXObject_Done 
    dw $0002,$35AD,$1CE7,$0C63 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$29D0,$150A,$0885 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$1E14,$114D,$08A7 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$0E37,$096F,$04A8 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$025A,$0192,$00CA 
    dw Instruction_PaletteFXObject_Done 
    dw $0020,$35AD,$1CE7,$0C63 
    dw Instruction_PaletteFXObject_Done 
    dw $0002,$29D0,$150A,$0885 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$1E14,$114D,$08A7 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$0E37,$096F,$04A8 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$025A,$0192,$00CA 
    dw Instruction_PaletteFXObject_Done 
    dw Instruction_PaletteFXObject_GotoY 
    dw InstList_PaletteFXObject_Crateria10_1 

InstList_PaletteFXObject_Crateria20_0:
    dw Instruction_PaletteFXObject_ColorIndexInY 
    dw $00AA 

InstList_PaletteFXObject_Crateria20_1:
    dw $0010,$28C8,$2484,$1C61 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$398E,$296B,$1549 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$4A74,$2E52,$1230 
    dw Instruction_PaletteFXObject_Done 
    dw $0002,$5739,$3318,$0B18 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$67FF,$43FF,$03FF 
    dw Instruction_PaletteFXObject_Done 
    dw $0002,$28C8,$2484,$1C61 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$398E,$296B,$1549 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$4A74,$2E52,$1230 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$5739,$3318,$0B18 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$67FF,$43FF,$03FF 
    dw Instruction_PaletteFXObject_Done 
    dw $0020,$28C8,$2484,$1C61 
    dw Instruction_PaletteFXObject_Done 
    dw $0002,$398E,$296B,$1549 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$4A74,$2E52,$1230 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$5739,$3318,$0B18 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$67FF,$43FF,$03FF 
    dw Instruction_PaletteFXObject_Done 
    dw Instruction_PaletteFXObject_GotoY 
    dw InstList_PaletteFXObject_Crateria20_1 

InstList_PaletteFXObject_Crateria2_0:
    dw Instruction_PaletteFXObject_ColorIndexInY 
    dw $0082 

InstList_PaletteFXObject_Crateria2_1:
    dw $0008,$1D89,$0D06,$0CA3,$2D0E,$2D09,$28C5,$0C81 
    dw Instruction_PaletteFXObject_Done 
    dw $0007,$1D8A,$0D07,$0CA4,$2D0E,$2D09,$28C5,$0421 
    dw Instruction_PaletteFXObject_Done 
    dw $0006,$1D8A,$0D28,$0CC4,$2D0F,$2D0A,$28C6,$0423 
    dw Instruction_PaletteFXObject_Done 
    dw $0005,$1D8B,$0D29,$0CC5,$2D0F,$2D0A,$28C6,$0424 
    dw Instruction_PaletteFXObject_Done 
    dw $0004,$1DAB,$1149,$10C5,$2D0F,$2D0B,$28C7,$0845 
    dw Instruction_PaletteFXObject_Done 
    dw $0003,$1DAC,$114A,$10C6,$2D0F,$2D0B,$28C7,$0846 
    dw Instruction_PaletteFXObject_Done 
    dw $0002,$1DAC,$116B,$10E6,$2D10,$2D0C,$28C8,$0848 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$1DAD,$116C,$10E7,$2D10,$2D0C,$28C8,$0015 
    dw Instruction_PaletteFXObject_Done 
    dw $0002,$1DAC,$116B,$10E6,$2D10,$2D0C,$28C8,$0848 
    dw Instruction_PaletteFXObject_Done 
    dw $0003,$1DAC,$114A,$10C6,$2D0F,$2D0B,$28C7,$0846 
    dw Instruction_PaletteFXObject_Done 
    dw $0004,$1DAB,$1149,$10C5,$2D0F,$2D0B,$28C7,$0845 
    dw Instruction_PaletteFXObject_Done 
    dw $0005,$1D8B,$0D29,$0CC5,$2D0F,$2D0A,$28C6,$0424 
    dw Instruction_PaletteFXObject_Done 
    dw $0006,$1D8A,$0D28,$0CC4,$2D0F,$2D0A,$28C6,$0423 
    dw Instruction_PaletteFXObject_Done 
    dw $0007,$1D8A,$0D07,$0CA4,$2D0E,$2D09,$28C5,$0421 
    dw Instruction_PaletteFXObject_Done 
    dw Instruction_PaletteFXObject_GotoY 
    dw InstList_PaletteFXObject_Crateria2_1 

InstList_PaletteFXObject_Crateria4_0:
    dw Instruction_PaletteFXObject_ColorIndexInY 
    dw $00A2 

InstList_PaletteFXObject_Crateria4_1:
    dw $0031,$48D5,$38B0,$286A,$2488,$2067,$1846,$1425 
    dw $1024,$0C23,$0C03,$0802 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$3DD8,$31D5,$2991,$25B0,$218F,$1D8E,$0C23 
    dw $0C23,$0822,$0802,$0401 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$32FC,$2EDA,$26D8,$26D7,$26D7,$22B7,$0802 
    dw $0401,$0401,$0401,$0401 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$27FF,$27FF,$27FF,$27FF,$27FF,$27FF,$0000 
    dw $0000,$0401,$0000,$0000 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$32FC,$2EDA,$26D8,$26D7,$26D7,$22B7,$0802 
    dw $0401,$0401,$0401,$0401 
    dw Instruction_PaletteFXObject_Done 
    dw $0011,$48D5,$38B0,$286A,$2488,$2067,$1846,$1425 
    dw $1024,$0C23,$0C03,$0802 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$32FC,$2EDA,$26D8,$26D7,$26D7,$22B7,$0802 
    dw $0401,$0401,$0401,$0401 
    dw Instruction_PaletteFXObject_Done 
    dw $0018,$48D5,$38B0,$286A,$2488,$2067,$1846,$1425 
    dw $1024,$0C23,$0C03,$0802 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$32FC,$2EDA,$26D8,$26D7,$26D7,$22B7,$0802 
    dw $0401,$0401,$0401,$0401 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$27FF,$27FF,$27FF,$27FF,$27FF,$27FF,$0000 
    dw $0000,$0401,$0000,$0000 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$32FC,$2EDA,$26D8,$26D7,$26D7,$22B7,$0802 
    dw $0401,$0401,$0401,$0401 
    dw Instruction_PaletteFXObject_Done 
    dw Instruction_PaletteFXObject_GotoY 
    dw InstList_PaletteFXObject_Crateria4_1 

InstList_PaletteFXObject_Crateria40_0:
    dw Instruction_PaletteFXObject_ColorIndexInY 
    dw $00AE 

InstList_PaletteFXObject_Crateria40_1:
    dw $0031,$1425,$1024,$0C23,$0C03,$0802 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$0C23,$0C23,$0822,$0802,$0401 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$0802,$0401,$0401,$0401,$0401 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$0000,$0000,$0401,$0000,$0000 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$0802,$0401,$0401,$0401,$0401 
    dw Instruction_PaletteFXObject_Done 
    dw $0011,$1425,$1024,$0C23,$0C03,$0802 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$0802,$0401,$0401,$0401,$0401 
    dw Instruction_PaletteFXObject_Done 
    dw $0018,$1425,$1024,$0C23,$0C03,$0802 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$0802,$0401,$0401,$0401,$0401 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$0000,$0000,$0401,$0000,$0000 
    dw Instruction_PaletteFXObject_Done 
    dw $0001,$0802,$0401,$0401,$0401,$0401 
    dw Instruction_PaletteFXObject_Done 
    dw Instruction_PaletteFXObject_GotoY 
    dw InstList_PaletteFXObject_Crateria40_1 

PaletteFXObjects_Tourian8_ShutterRedFlashing:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_Tourian8_0 

PaletteFXObjects_Tourian10_BackgroundRedFlashing:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_Tourian10_0 

PaletteFXObjects_Tourian20_GeneralLevelRedFlashing:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_Tourian20 

PaletteFXObjects_Tourian40_RedFlashingArkanoidBlocksRedOrbs:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_Tourian40 

PaletteFXObjects_Crateria8_OldTourianRedFlashing:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_Crateria8_0 

PaletteFXObjects_Crateria10_OldTourianBGRailingsFlashYellow:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_Crateria10_0 

PaletteFXObjects_Crateria20_OldTourianBGPanelsFlashYellow:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_Crateria20_0 

PaletteFXObjects_Crateria2_UpperCrateriaRedFlashing:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_Crateria2_0 

PaletteFXObjects_Crateria4_YellowLightning:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_Crateria4_0 

PaletteFXObjects_Crateria40_SlightlyModifiesAPixelInCREBlock:
    dw RTS_8DC685 
    dw InstList_PaletteFXObject_Crateria40_0 

Freespace_Bank8D_FFF1: 
; $F bytes
