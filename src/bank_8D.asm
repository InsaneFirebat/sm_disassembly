
org $8D8000


;;; $8000: Enemy projectile spritemaps ;;;
EnemyProjSpritemaps:
EnemyProjSpritemaps_Blank_Default:
    dw $0000
    %spritemapEntry(0, $00, $00, 0, 0, 0, 0, $DF)

EnemyProjSpritemaps_EyeDoorProjectile_0:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 5, $76)

EnemyProjSpritemaps_EyeDoorProjectile_1:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 5, $78)

EnemyProjSpritemaps_EyeDoorProjectile_2:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 5, $98)

EnemyProjSpritemaps_EyeDoorProjectile_3:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 5, $9E)

EnemyProjSpritemaps_SkreeParticle:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $115)

EnemyProjSpritemaps_CrocomiresProjectile_0:
    dw $0004
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 0, $D0)
    %spritemapEntry(0, $00, $00, 1, 1, 3, 0, $D0)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 0, $D0)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $D0)

EnemyProjSpritemaps_CrocomiresProjectile_1:
    dw $0004
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 0, $D1)
    %spritemapEntry(0, $00, $00, 1, 1, 3, 0, $D1)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 0, $D1)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $D1)

EnemyProjSpritemaps_CrocomiresProjectile_2:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 0, $D2)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 0, $D2)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 0, $D2)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $D2)

EnemyProjSpritemaps_CrocomiresProjectile_3:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 0, $D3)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 0, $D3)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 0, $D3)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $D3)

UNUSED_EnemyProjSpritemaps_OldCrocomiresProjectile_0_8D8082:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 2, 1, $1C2)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 1, $1C2)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 1, $1C2)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 1, $1C2)

UNUSED_EnemyProjSpritemaps_OldCrocomiresProjectile_1_8D8098:
    dw $0004
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 1, $1D2)
    %spritemapEntry(0, $00, $00, 1, 1, 2, 1, $1D2)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 1, $1D2)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 1, $1D2)

UNUSED_EnemyProjSpritemaps_0_8D80AE:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $177)

UNUSED_EnemyProjSpritemaps_1_8D80B5:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 1, 1, 3, 0, $17B)

UNUSED_EnemyProjSpritemaps_2_8D80BC:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 1, 1, 3, 0, $177)

UNUSED_EnemyProjSpritemaps_3_8D80C3:
    dw $0001
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $17B)

EnemyProjSpritemaps_RidleysFireball_0:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $1C8)

EnemyProjSpritemaps_RidleysFireball_1:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 1, 1, 3, 0, $1CA)

EnemyProjSpritemaps_RidleysFireball_2:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 1, 1, 3, 0, $1C8)

EnemyProjSpritemaps_RidleysFireball_3:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $1CA)

EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $5F)

EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_1:
    dw $0001
    %spritemapEntry(1, $43F8, $F7, 0, 0, 3, 5, $76)

EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_2:
    dw $0001
    %spritemapEntry(1, $43F8, $F6, 0, 0, 3, 5, $78)

EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_3:
    dw $0001
    %spritemapEntry(1, $43F8, $F5, 0, 0, 3, 5, $98)

EnemyProjSpritemaps_RidleysFireball_MBBombExplosion_4:
    dw $0001
    %spritemapEntry(1, $43F8, $F4, 0, 0, 3, 5, $9E)

EnemyProjSpritemaps_CrocomiresBridgeCrumbling:
    dw $0001
    %spritemapEntry(1, $43FC, $FC, 0, 0, 2, 0, $1CC)

EnemyProjSpritemaps_CrocomiresSpikeWallPieces:
    dw $0002
    %spritemapEntry(1, $4208, $F8, 0, 0, 2, 3, $1EE)
    %spritemapEntry(1, $43F8, $F8, 0, 1, 2, 2, $1CC)

UNUSED_EnemyProjSpritemaps_8D811C:
    dw $0004
    %spritemapEntry(0, $00, $00, 0, 0, 2, 0, $1F1)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 0, $1F0)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $1E1)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $1E0)

UNUSED_EnemyProjSpritemaps_CrocomireBridgeCrumbling_0_8D8132:
    dw $0002
    %spritemapEntry(0, $00, $10, 0, 1, 2, 0, $1E0)
    %spritemapEntry(0, $1F8, $10, 0, 0, 2, 0, $1E0)

UNUSED_EnemyProjSpritemaps_CrocomireBridgeCrumbling_1_8D813E:
    dw $0006
    %spritemapEntry(0, $04, $08, 0, 1, 2, 0, $1DB)
    %spritemapEntry(0, $04, $00, 0, 1, 2, 0, $1CB)
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 0, $1DC)
    %spritemapEntry(0, $1F4, $08, 0, 0, 2, 0, $1DB)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 0, $1CC)
    %spritemapEntry(0, $1F4, $00, 0, 0, 2, 0, $1CB)

UNUSED_EnemyProjSpritemaps_CrocomireBridgeCrumbling_2_8D815E:
    dw $000C
    %spritemapEntry(0, $00, $F0, 0, 1, 2, 0, $1DF)
    %spritemapEntry(0, $08, $F0, 0, 1, 2, 0, $1CF)
    %spritemapEntry(0, $00, $00, 0, 1, 2, 0, $1DE)
    %spritemapEntry(0, $08, $00, 0, 1, 2, 0, $1DD)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $1CE)
    %spritemapEntry(0, $08, $F8, 0, 1, 2, 0, $1CD)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 2, 0, $1DF)
    %spritemapEntry(0, $1F0, $F0, 0, 0, 2, 0, $1CF)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 0, $1DE)
    %spritemapEntry(0, $1F0, $00, 0, 0, 2, 0, $1DD)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $1CE)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 2, 0, $1CD)

EnemyProjSpritemaps_PhantoonFlames_0:
    dw $0002
    %spritemapEntry(1, $43F8, $00, 0, 0, 3, 7, $106)
    %spritemapEntry(1, $43F8, $F0, 0, 0, 3, 7, $100)

EnemyProjSpritemaps_PhantoonFlames_1:
    dw $0002
    %spritemapEntry(1, $43F8, $00, 0, 0, 3, 7, $108)
    %spritemapEntry(1, $43F8, $F0, 0, 0, 3, 7, $102)

EnemyProjSpritemaps_PhantoonFlames_2:
    dw $0002
    %spritemapEntry(1, $43F8, $00, 0, 0, 3, 7, $10A)
    %spritemapEntry(1, $43F8, $F0, 0, 0, 3, 7, $104)

EnemyProjSpritemaps_PhantoonFlames_3:
    dw $0002
    %spritemapEntry(1, $4200, $F8, 0, 0, 3, 7, $10E)
    %spritemapEntry(1, $43F0, $F8, 0, 0, 3, 7, $10C)

EnemyProjSpritemaps_PhantoonFlames_4:
    dw $0002
    %spritemapEntry(1, $43F8, $FE, 0, 0, 3, 7, $128)
    %spritemapEntry(1, $43F8, $EE, 0, 0, 3, 7, $120)

EnemyProjSpritemaps_PhantoonFlames_5:
    dw $0002
    %spritemapEntry(1, $43F8, $FC, 0, 0, 3, 7, $12A)
    %spritemapEntry(1, $43F8, $EC, 0, 0, 3, 7, $122)

EnemyProjSpritemaps_PhantoonFlames_6:
    dw $0002
    %spritemapEntry(1, $43F8, $FA, 0, 0, 3, 7, $12C)
    %spritemapEntry(1, $43F8, $EA, 0, 0, 3, 7, $124)

EnemyProjSpritemaps_PhantoonFlames_7:
    dw $0002
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 7, $12E)
    %spritemapEntry(1, $43F8, $E8, 0, 0, 3, 7, $126)

EnemyProjSpritemaps_PhantoonFlames_8:
    dw $0002
    %spritemapEntry(1, $43F8, $F0, 0, 0, 3, 7, $100)
    %spritemapEntry(1, $43F8, $00, 0, 0, 3, 7, $140)

EnemyProjSpritemaps_PhantoonFlames_9:
    dw $0002
    %spritemapEntry(1, $43F8, $F0, 0, 0, 3, 7, $102)
    %spritemapEntry(1, $43F8, $00, 0, 0, 3, 7, $142)

EnemyProjSpritemaps_PhantoonFlames_A:
    dw $0002
    %spritemapEntry(1, $43F8, $F0, 0, 0, 3, 7, $104)
    %spritemapEntry(1, $43F8, $00, 0, 0, 3, 7, $144)

EnemyProjSpritemaps_PhantoonStartingFlames_0:
    dw $0002
    %spritemapEntry(1, $43F8, $00, 0, 0, 3, 7, $146)
    %spritemapEntry(1, $43F8, $F0, 0, 0, 3, 7, $100)

EnemyProjSpritemaps_PhantoonStartingFlames_1:
    dw $0002
    %spritemapEntry(1, $43F8, $00, 0, 0, 3, 7, $148)
    %spritemapEntry(1, $43F8, $F0, 0, 0, 3, 7, $102)

EnemyProjSpritemaps_PhantoonStartingFlames_2:
    dw $0002
    %spritemapEntry(1, $43F8, $00, 0, 0, 3, 7, $14A)
    %spritemapEntry(1, $43F8, $F0, 0, 0, 3, 7, $104)

EnemyProjSpritemaps_PhantoonStartingFlames_3:
    dw $0002
    %spritemapEntry(1, $43F8, $00, 0, 0, 3, 7, $14C)
    %spritemapEntry(1, $43F8, $F0, 0, 0, 3, 7, $100)

EnemyProjSpritemaps_PhantoonStartingFlames_4:
    dw $0002
    %spritemapEntry(1, $43F8, $00, 0, 0, 3, 7, $14E)
    %spritemapEntry(1, $43F8, $F0, 0, 0, 3, 7, $102)

EnemyProjSpritemaps_PhantoonStartingFlames_5:
    dw $0002
    %spritemapEntry(1, $43F8, $00, 0, 0, 3, 7, $14A)
    %spritemapEntry(1, $43F8, $F0, 0, 0, 3, 7, $104)

EnemyProjSpritemaps_KraidRocks_KagoBugs:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 0, $1D0)

EnemyProjSpritemaps_KraidRisingRocks_Right:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $1D2)

EnemyProjSpritemaps_MotherBrainOnionRings_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 2, $1AD)

EnemyProjSpritemaps_MotherBrainOnionRings_1:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 2, $1A7)

EnemyProjSpritemaps_MotherBrainOnionRings_2:
    dw $0004
    %spritemapEntry(1, $43FB, $FB, 1, 1, 3, 2, $1A9)
    %spritemapEntry(1, $43F5, $FB, 1, 0, 3, 2, $1A9)
    %spritemapEntry(1, $43FB, $F5, 0, 1, 3, 2, $1A9)
    %spritemapEntry(1, $43F5, $F5, 0, 0, 3, 2, $1A9)

EnemyProjSpritemaps_MotherBrainOnionRings_3:
    dw $0004
    %spritemapEntry(1, $43FC, $FC, 1, 1, 3, 2, $1A9)
    %spritemapEntry(1, $43F4, $FC, 1, 0, 3, 2, $1A9)
    %spritemapEntry(1, $43FC, $F4, 0, 1, 3, 2, $1A9)
    %spritemapEntry(1, $43F4, $F4, 0, 0, 3, 2, $1A9)

EnemyProjSpritemaps_MotherBrainOnionRings_4:
    dw $0004
    %spritemapEntry(1, $43FF, $FF, 1, 1, 3, 2, $1AB)
    %spritemapEntry(1, $43F1, $FF, 1, 0, 3, 2, $1AB)
    %spritemapEntry(1, $43FF, $F1, 0, 1, 3, 2, $1AB)
    %spritemapEntry(1, $43F1, $F1, 0, 0, 3, 2, $1AB)

EnemyProjSpritemaps_MotherBrainOnionRings_5:
    dw $0004
    %spritemapEntry(1, $4200, $00, 1, 1, 3, 2, $1AB)
    %spritemapEntry(1, $43F0, $00, 1, 0, 3, 2, $1AB)
    %spritemapEntry(1, $4200, $F0, 0, 1, 3, 2, $1AB)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 2, $1AB)

EnemyProjSpritemaps_MotherBrainsBomb_0:
    dw $0002
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 2, $1CE)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 2, $1AE)

EnemyProjSpritemaps_MotherBrainsBomb_1:
    dw $0002
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 2, $1CE)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 2, $1AF)

EnemyProjSpritemaps_MotherBrainsBomb_2:
    dw $0002
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 2, $1CE)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 2, $1BD)

EnemyProjSpritemaps_MotherBrainsBomb_3:
    dw $0002
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 2, $1CE)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 2, $1BE)

EnemyProjSpritemaps_MotherBrainsBomb_4:
    dw $0002
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 2, $1CE)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 2, $1BF)

EnemyProjSpritemaps_MotherBrainsBomb_5:
    dw $0002
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 2, $1CE)
    %spritemapEntry(0, $1FC, $FC, 0, 1, 3, 2, $1BF)

EnemyProjSpritemaps_MotherBrainsBomb_6:
    dw $0002
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 2, $1CE)
    %spritemapEntry(0, $1FC, $FC, 0, 1, 3, 2, $1BE)

EnemyProjSpritemaps_MotherBrainsBomb_7:
    dw $0002
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 2, $1CE)
    %spritemapEntry(0, $1FC, $FC, 0, 1, 3, 2, $1BD)

EnemyProjSpritemaps_MotherBrainsBomb_8:
    dw $0002
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 2, $1CE)
    %spritemapEntry(0, $1FC, $FC, 0, 1, 3, 2, $1AF)

UNUSED_EnemyProjSpritemaps_0_8D8348:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 2, $1E0)

UNUSED_EnemyProjSpritemaps_1_8D834F:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 2, $1E1)

UNUSED_EnemyProjSpritemaps_2_8D8356:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 2, $1E2)

EnemyProjSpritemaps_MotherBrainsRedBeam_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 2, $1E3)

EnemyProjSpritemaps_MotherBrainsRedBeam_1:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 2, $1E4)

EnemyProjSpritemaps_MotherBrainsRedBeam_2:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 2, $1E6)

EnemyProjSpritemaps_MotherBrainsRedBeam_3:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 2, $1E8)

EnemyProjSpritemaps_MotherBrainsRedBeam_4:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 2, $1EA)

EnemyProjSpritemaps_MotherBrainsRedBeam_5:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 2, $1EC)

EnemyProjSpritemaps_MotherBrainsRedBeam_6:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 2, $1EE)

EnemyProjSpritemaps_MotherBrainsTubeFalling_TopRight:
    dw $0004
    %spritemapEntry(1, $43FC, $E8, 1, 0, 2, 7, $15E)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 7, $151)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 7, $150)
    %spritemapEntry(1, $43F8, $00, 1, 1, 2, 7, $142)

EnemyProjSpritemaps_MotherBrainsTubeFalling_TopLeft:
    dw $0004
    %spritemapEntry(1, $43F4, $E8, 1, 1, 2, 7, $15E)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 7, $151)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 7, $150)
    %spritemapEntry(1, $43F8, $00, 1, 0, 2, 7, $142)

EnemyProjSpritemaps_MotherBrainsTubeFalling_TopMiddleLeft:
    dw $0007
    %spritemapEntry(1, $43FA, $DC, 1, 0, 2, 7, $15E)
    %spritemapEntry(1, $43F8, $1C, 0, 0, 2, 7, $15E)
    %spritemapEntry(1, $43F8, $14, 0, 0, 2, 7, $14E)
    %spritemapEntry(1, $43F8, $04, 1, 0, 2, 7, $140)
    %spritemapEntry(1, $43F8, $F4, 0, 0, 2, 7, $14B)
    %spritemapEntry(0, $00, $EC, 0, 0, 2, 7, $16D)
    %spritemapEntry(0, $1F8, $EC, 0, 0, 2, 7, $16D)

EnemyProjSpritemaps_MotherBrainsTubeFalling_TopMiddleRight:
    dw $0007
    %spritemapEntry(1, $43F6, $DC, 1, 1, 2, 7, $15E)
    %spritemapEntry(1, $43F8, $1C, 0, 1, 2, 7, $15E)
    %spritemapEntry(1, $43F8, $14, 0, 1, 2, 7, $14E)
    %spritemapEntry(1, $43F8, $04, 1, 1, 2, 7, $140)
    %spritemapEntry(1, $43F8, $F4, 0, 0, 2, 7, $14B)
    %spritemapEntry(0, $1F8, $EC, 0, 1, 2, 7, $16D)
    %spritemapEntry(0, $00, $EC, 0, 1, 2, 7, $16D)

EnemyProjSpritemaps_AlcoonFireball_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $12C)

EnemyProjSpritemaps_AlcoonFireball_1:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 0, 2, 0, $12D)

EnemyProjSpritemaps_AlcoonFireball_2:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 1, 2, 0, $12C)

EnemyProjSpritemaps_AlcoonFireball_3:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 0, $12D)

EnemyProjSpritemaps_MiniKraidSpit:
    dw $0001
    %spritemapEntry(0, $1FD, $FD, 0, 0, 2, 1, $11F)

EnemyProjSpritemaps_MiniKraidSpikes_Left:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 1, $10F)

EnemyProjSpritemaps_MiniKraidSpikes_Right:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 1, $10F)

EnemyProjSpritemaps_MetareeParticle:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $12B)

UNUSED_EnemyProjSpritemaps_0_8D343C:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 5, $7C)

UNUSED_EnemyProjSpritemaps_1_8D3443:
    dw $0001
    %spritemapEntry(1, $43F8, $F6, 0, 0, 3, 5, $7E)

UNUSED_EnemyProjSpritemaps_2_8D344A:
    dw $0001
    %spritemapEntry(1, $43F8, $F4, 0, 0, 3, 5, $9A)

UNUSED_EnemyProjSpritemaps_3_8D3451:
    dw $0001
    %spritemapEntry(1, $43F8, $F2, 0, 0, 3, 5, $9C)

EnemyProjSpritemaps_KagoBugs_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $128)

EnemyProjSpritemaps_KagoBugs_1:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $129)

EnemyProjSpritemaps_KagoBugs_2:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $12A)

EnemyProjSpritemaps_CeresElevatorPadLevelDataConcealer:
    dw $0004
    %spritemapEntry(0, $08, $FC, 0, 0, 3, 5, $20)
    %spritemapEntry(0, $00, $FC, 0, 0, 3, 5, $20)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 5, $20)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 3, 5, $20)

EnemyProjSpritemaps_GunshipLiftoffDustClouds_0:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 5, $168)

EnemyProjSpritemaps_GunshipLiftoffDustClouds_1:
    dw $0003
    %spritemapEntry(1, $4202, $EE, 0, 0, 3, 5, $168)
    %spritemapEntry(1, $43F2, $E6, 0, 0, 3, 5, $168)
    %spritemapEntry(1, $43FA, $F6, 0, 0, 3, 5, $16A)

EnemyProjSpritemaps_GunshipLiftoffDustClouds_2:
    dw $0004
    %spritemapEntry(1, $4204, $E4, 0, 0, 3, 5, $168)
    %spritemapEntry(1, $43F4, $E3, 0, 0, 3, 5, $16A)
    %spritemapEntry(1, $4204, $EB, 0, 0, 3, 5, $16A)
    %spritemapEntry(1, $43FC, $F3, 0, 0, 3, 5, $16C)

EnemyProjSpritemaps_GunshipLiftoffDustClouds_3:
    dw $0005
    %spritemapEntry(1, $43FE, $D6, 0, 0, 3, 5, $168)
    %spritemapEntry(1, $4206, $E2, 0, 0, 3, 5, $16A)
    %spritemapEntry(1, $43F6, $E0, 0, 0, 3, 5, $16C)
    %spritemapEntry(1, $4206, $E8, 0, 0, 3, 5, $16C)
    %spritemapEntry(1, $43FE, $F0, 0, 0, 3, 5, $16E)

EnemyProjSpritemaps_GunshipLiftoffDustClouds_4:
    dw $0005
    %spritemapEntry(1, $4200, $D4, 0, 0, 3, 5, $16A)
    %spritemapEntry(1, $4208, $E0, 0, 0, 3, 5, $16C)
    %spritemapEntry(1, $4208, $E5, 0, 0, 3, 5, $16E)
    %spritemapEntry(1, $43F8, $DD, 0, 0, 3, 5, $16E)
    %spritemapEntry(1, $4200, $ED, 0, 0, 3, 5, $1E4)

EnemyProjSpritemaps_GunshipLiftoffDustClouds_5:
    dw $0004
    %spritemapEntry(1, $4202, $D2, 0, 0, 3, 5, $16C)
    %spritemapEntry(1, $420A, $DE, 0, 0, 3, 5, $16E)
    %spritemapEntry(1, $420A, $E2, 0, 0, 3, 5, $1E4)
    %spritemapEntry(1, $43FA, $DA, 0, 0, 3, 5, $1E4)

EnemyProjSpritemaps_GunshipLiftoffDustClouds_6:
    dw $0002
    %spritemapEntry(1, $4204, $D0, 0, 0, 3, 5, $16E)
    %spritemapEntry(1, $420C, $DC, 0, 0, 3, 5, $1E4)

EnemyProjSpritemaps_GunshipLiftoffDustClouds_7:
    dw $0001
    %spritemapEntry(1, $4206, $CE, 0, 0, 3, 5, $1E4)

EnemyProjSpritemaps_GunshipLiftoffDustClouds_8:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 5, $1C4)

EnemyProjSpritemaps_GunshipLiftoffDustClouds_9:
    dw $0003
    %spritemapEntry(1, $43FA, $F6, 0, 0, 3, 5, $1C6)
    %spritemapEntry(1, $4202, $EE, 0, 0, 3, 5, $1C4)
    %spritemapEntry(1, $43F2, $E6, 0, 0, 3, 5, $1C4)

EnemyProjSpritemaps_GunshipLiftoffDustClouds_A:
    dw $0004
    %spritemapEntry(1, $43FC, $F4, 0, 0, 3, 5, $1C8)
    %spritemapEntry(1, $4204, $EC, 0, 0, 3, 5, $1C6)
    %spritemapEntry(1, $43F4, $E4, 0, 0, 3, 5, $1C6)
    %spritemapEntry(1, $4204, $E4, 0, 0, 3, 5, $1C4)

EnemyProjSpritemaps_GunshipLiftoffDustClouds_B:
    dw $0005
    %spritemapEntry(1, $43FE, $F2, 0, 0, 3, 5, $1CA)
    %spritemapEntry(1, $43F6, $E2, 0, 0, 3, 5, $1C8)
    %spritemapEntry(1, $4206, $E2, 0, 0, 3, 5, $1C6)
    %spritemapEntry(1, $43FE, $D6, 0, 0, 3, 5, $1C4)
    %spritemapEntry(1, $4206, $EA, 0, 0, 3, 5, $16C)

EnemyProjSpritemaps_GunshipLiftoffDustClouds_C:
    dw $0005
    %spritemapEntry(1, $4200, $F0, 0, 0, 3, 5, $1CC)
    %spritemapEntry(1, $4208, $E8, 0, 0, 3, 5, $1CA)
    %spritemapEntry(1, $43F8, $E0, 0, 0, 3, 5, $1CA)
    %spritemapEntry(1, $4208, $E0, 0, 0, 3, 5, $1C8)
    %spritemapEntry(1, $4200, $D4, 0, 0, 3, 5, $1C6)

EnemyProjSpritemaps_GunshipLiftoffDustClouds_D:
    dw $0004
    %spritemapEntry(1, $43FA, $DE, 0, 0, 3, 5, $1CC)
    %spritemapEntry(1, $420A, $E6, 0, 0, 3, 5, $1CC)
    %spritemapEntry(1, $420A, $DE, 0, 0, 3, 5, $1CA)
    %spritemapEntry(1, $4202, $D2, 0, 0, 3, 5, $1C8)

EnemyProjSpritemaps_GunshipLiftoffDustClouds_E:
    dw $0002
    %spritemapEntry(1, $420C, $DC, 0, 0, 3, 5, $1CC)
    %spritemapEntry(1, $4204, $D0, 0, 0, 3, 5, $1CA)

EnemyProjSpritemaps_GunshipLiftoffDustClouds_F:
    dw $0001
    %spritemapEntry(1, $4206, $CE, 0, 0, 3, 5, $1CC)

EnemyProjSpritemaps_GunshipLiftoffDustClouds_10:
    dw $0006
    %spritemapEntry(0, $1FC, $04, 0, 0, 3, 5, $1A1)
    %spritemapEntry(0, $1F4, $04, 0, 0, 3, 5, $1A0)
    %spritemapEntry(0, $04, $04, 0, 0, 3, 5, $1A2)
    %spritemapEntry(0, $04, $FC, 0, 0, 3, 5, $192)
    %spritemapEntry(0, $04, $F4, 0, 0, 3, 5, $182)
    %spritemapEntry(1, $43F4, $F4, 0, 0, 3, 5, $180)

EnemyProjSpritemaps_GunshipLiftoffDustClouds_11:
    dw $000A
    %spritemapEntry(0, $1F0, $F2, 0, 0, 3, 5, $1A1)
    %spritemapEntry(0, $1E8, $F2, 0, 0, 3, 5, $1A0)
    %spritemapEntry(0, $1F8, $F2, 0, 0, 3, 5, $1A2)
    %spritemapEntry(0, $1F8, $EA, 0, 0, 3, 5, $192)
    %spritemapEntry(0, $1F8, $E2, 0, 0, 3, 5, $182)
    %spritemapEntry(1, $43E8, $E2, 0, 0, 3, 5, $180)
    %spritemapEntry(1, $4204, $FE, 0, 0, 3, 5, $1A5)
    %spritemapEntry(1, $43F4, $FE, 0, 0, 3, 5, $1A3)
    %spritemapEntry(1, $4204, $EE, 0, 0, 3, 5, $185)
    %spritemapEntry(1, $43F4, $EE, 0, 0, 3, 5, $183)

EnemyProjSpritemaps_GunshipLiftoffDustClouds_12:
    dw $000E
    %spritemapEntry(0, $14, $F8, 0, 0, 3, 5, $1A1)
    %spritemapEntry(0, $0C, $F8, 0, 0, 3, 5, $1A0)
    %spritemapEntry(0, $1C, $F8, 0, 0, 3, 5, $1A2)
    %spritemapEntry(0, $1C, $F0, 0, 0, 3, 5, $192)
    %spritemapEntry(0, $1C, $E8, 0, 0, 3, 5, $182)
    %spritemapEntry(1, $420C, $E8, 0, 0, 3, 5, $180)
    %spritemapEntry(1, $43F8, $EC, 0, 0, 3, 5, $1A5)
    %spritemapEntry(1, $43E8, $EC, 0, 0, 3, 5, $1A3)
    %spritemapEntry(1, $43F8, $DC, 0, 0, 3, 5, $185)
    %spritemapEntry(1, $43E8, $DC, 0, 0, 3, 5, $183)
    %spritemapEntry(1, $4208, $FC, 0, 0, 3, 5, $1A9)
    %spritemapEntry(1, $43F8, $FC, 0, 0, 3, 5, $1A7)
    %spritemapEntry(1, $4208, $EC, 0, 0, 3, 5, $189)
    %spritemapEntry(1, $43F8, $EC, 0, 0, 3, 5, $187)

EnemyProjSpritemaps_GunshipLiftoffDustClouds_13:
    dw $000C
    %spritemapEntry(1, $43FC, $EA, 0, 0, 3, 5, $1A9)
    %spritemapEntry(1, $43EC, $EA, 0, 0, 3, 5, $1A7)
    %spritemapEntry(1, $43FC, $DA, 0, 0, 3, 5, $189)
    %spritemapEntry(1, $43EC, $DA, 0, 0, 3, 5, $187)
    %spritemapEntry(1, $421C, $F2, 0, 0, 3, 5, $1A5)
    %spritemapEntry(1, $420C, $F2, 0, 0, 3, 5, $1A3)
    %spritemapEntry(1, $421C, $E2, 0, 0, 3, 5, $185)
    %spritemapEntry(1, $420C, $E2, 0, 0, 3, 5, $183)
    %spritemapEntry(1, $420C, $FA, 0, 0, 3, 5, $1AD)
    %spritemapEntry(1, $43FC, $FA, 0, 0, 3, 5, $1AB)
    %spritemapEntry(1, $420C, $EA, 0, 0, 3, 5, $18D)
    %spritemapEntry(1, $43FC, $EA, 0, 0, 3, 5, $18B)

EnemyProjSpritemaps_GunshipLiftoffDustClouds_14:
    dw $000C
    %spritemapEntry(1, $4220, $F0, 0, 0, 3, 5, $1A9)
    %spritemapEntry(1, $4210, $F0, 0, 0, 3, 5, $1A7)
    %spritemapEntry(1, $4220, $E0, 0, 0, 3, 5, $189)
    %spritemapEntry(1, $4210, $E0, 0, 0, 3, 5, $187)
    %spritemapEntry(1, $4200, $E8, 0, 0, 3, 5, $1AD)
    %spritemapEntry(1, $43F0, $E8, 0, 0, 3, 5, $1AB)
    %spritemapEntry(1, $4200, $D8, 0, 0, 3, 5, $18D)
    %spritemapEntry(1, $43F0, $D8, 0, 0, 3, 5, $18B)
    %spritemapEntry(1, $4210, $F8, 0, 0, 3, 5, $1E2)
    %spritemapEntry(1, $4200, $F8, 0, 0, 3, 5, $1E0)
    %spritemapEntry(1, $4210, $E8, 0, 0, 3, 5, $1C2)
    %spritemapEntry(1, $4200, $E8, 0, 0, 3, 5, $1C0)

EnemyProjSpritemaps_GunshipLiftoffDustClouds_15:
    dw $0008
    %spritemapEntry(1, $4204, $E6, 0, 0, 3, 5, $1E2)
    %spritemapEntry(1, $43F4, $E6, 0, 0, 3, 5, $1E0)
    %spritemapEntry(1, $4204, $D6, 0, 0, 3, 5, $1C2)
    %spritemapEntry(1, $43F4, $D6, 0, 0, 3, 5, $1C0)
    %spritemapEntry(1, $4224, $EE, 0, 0, 3, 5, $1AD)
    %spritemapEntry(1, $4214, $EE, 0, 0, 3, 5, $1AB)
    %spritemapEntry(1, $4224, $DE, 0, 0, 3, 5, $18D)
    %spritemapEntry(1, $4214, $DE, 0, 0, 3, 5, $18B)

EnemyProjSpritemaps_GunshipLiftoffDustClouds_16:
    dw $0004
    %spritemapEntry(1, $4228, $EC, 0, 0, 3, 5, $1E2)
    %spritemapEntry(1, $4218, $EC, 0, 0, 3, 5, $1E0)
    %spritemapEntry(1, $4228, $DC, 0, 0, 3, 5, $1C2)
    %spritemapEntry(1, $4218, $DC, 0, 0, 3, 5, $1C0)

EnemyProjSpritemaps_GunshipLiftoffDustClouds_17:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 1, 3, 5, $168)

EnemyProjSpritemaps_GunshipLiftoffDustClouds_18:
    dw $0003
    %spritemapEntry(1, $43EE, $EE, 0, 1, 3, 5, $168)
    %spritemapEntry(1, $43FE, $E6, 0, 1, 3, 5, $168)
    %spritemapEntry(1, $43F6, $F6, 0, 1, 3, 5, $16A)

EnemyProjSpritemaps_GunshipLiftoffDustClouds_19:
    dw $0004
    %spritemapEntry(1, $43EC, $E4, 0, 1, 3, 5, $168)
    %spritemapEntry(1, $43FC, $E3, 0, 1, 3, 5, $16A)
    %spritemapEntry(1, $43EC, $EB, 0, 1, 3, 5, $16A)
    %spritemapEntry(1, $43F4, $F3, 0, 1, 3, 5, $16C)

EnemyProjSpritemaps_GunshipLiftoffDustClouds_1A:
    dw $0005
    %spritemapEntry(1, $43F2, $D6, 0, 1, 3, 5, $168)
    %spritemapEntry(1, $43EA, $E2, 0, 1, 3, 5, $16A)
    %spritemapEntry(1, $43FA, $E0, 0, 1, 3, 5, $16C)
    %spritemapEntry(1, $43EA, $E8, 0, 1, 3, 5, $16C)
    %spritemapEntry(1, $43F2, $F0, 0, 1, 3, 5, $16E)

EnemyProjSpritemaps_GunshipLiftoffDustClouds_1B:
    dw $0005
    %spritemapEntry(1, $43F0, $D4, 0, 1, 3, 5, $16A)
    %spritemapEntry(1, $43E8, $E0, 0, 1, 3, 5, $16C)
    %spritemapEntry(1, $43E8, $E5, 0, 1, 3, 5, $16E)
    %spritemapEntry(1, $43F8, $DD, 0, 1, 3, 5, $16E)
    %spritemapEntry(1, $43F0, $ED, 0, 1, 3, 5, $1E4)

EnemyProjSpritemaps_GunshipLiftoffDustClouds_1C:
    dw $0004
    %spritemapEntry(1, $43EE, $D2, 0, 1, 3, 5, $16C)
    %spritemapEntry(1, $43E6, $DE, 0, 1, 3, 5, $16E)
    %spritemapEntry(1, $43E6, $E2, 0, 1, 3, 5, $1E4)
    %spritemapEntry(1, $43F6, $DA, 0, 1, 3, 5, $1E4)

EnemyProjSpritemaps_GunshipLiftoffDustClouds_1D:
    dw $0002
    %spritemapEntry(1, $43EC, $D0, 0, 1, 3, 5, $16E)
    %spritemapEntry(1, $43E4, $DC, 0, 1, 3, 5, $1E4)

EnemyProjSpritemaps_GunshipLiftoffDustClouds_1E:
    dw $0001
    %spritemapEntry(1, $43EA, $CE, 0, 1, 3, 5, $1E4)

EnemyProjSpritemaps_GunshipLiftoffDustClouds_1F:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 1, 3, 5, $1C4)

EnemyProjSpritemaps_GunshipLiftoffDustClouds_20:
    dw $0003
    %spritemapEntry(1, $43F6, $F6, 0, 1, 3, 5, $1C6)
    %spritemapEntry(1, $43EE, $EE, 0, 1, 3, 5, $1C4)
    %spritemapEntry(1, $43FE, $E6, 0, 1, 3, 5, $1C4)

EnemyProjSpritemaps_GunshipLiftoffDustClouds_21:
    dw $0004
    %spritemapEntry(1, $43F4, $F4, 0, 1, 3, 5, $1C8)
    %spritemapEntry(1, $43EC, $EC, 0, 1, 3, 5, $1C6)
    %spritemapEntry(1, $43FC, $E4, 0, 1, 3, 5, $1C6)
    %spritemapEntry(1, $43EC, $E4, 0, 1, 3, 5, $1C4)

EnemyProjSpritemaps_GunshipLiftoffDustClouds_22:
    dw $0005
    %spritemapEntry(1, $43F2, $F2, 0, 1, 3, 5, $1CA)
    %spritemapEntry(1, $43FA, $E2, 0, 1, 3, 5, $1C8)
    %spritemapEntry(1, $43EA, $E2, 0, 1, 3, 5, $1C6)
    %spritemapEntry(1, $43F2, $D6, 0, 1, 3, 5, $1C4)
    %spritemapEntry(1, $43EA, $EA, 0, 1, 3, 5, $16C)

EnemyProjSpritemaps_GunshipLiftoffDustClouds_23:
    dw $0005
    %spritemapEntry(1, $43F0, $F0, 0, 1, 3, 5, $1CC)
    %spritemapEntry(1, $43E8, $E8, 0, 1, 3, 5, $1CA)
    %spritemapEntry(1, $43F8, $E0, 0, 1, 3, 5, $1CA)
    %spritemapEntry(1, $43E8, $E0, 0, 1, 3, 5, $1C8)
    %spritemapEntry(1, $43F0, $D4, 0, 1, 3, 5, $1C6)

EnemyProjSpritemaps_GunshipLiftoffDustClouds_24:
    dw $0004
    %spritemapEntry(1, $43F6, $DE, 0, 1, 3, 5, $1CC)
    %spritemapEntry(1, $43E6, $E6, 0, 1, 3, 5, $1CC)
    %spritemapEntry(1, $43E6, $DE, 0, 1, 3, 5, $1CA)
    %spritemapEntry(1, $43EE, $D2, 0, 1, 3, 5, $1C8)

EnemyProjSpritemaps_GunshipLiftoffDustClouds_25:
    dw $0002
    %spritemapEntry(1, $43E4, $DC, 0, 1, 3, 5, $1CC)
    %spritemapEntry(1, $43EC, $D0, 0, 1, 3, 5, $1CA)

EnemyProjSpritemaps_GunshipLiftoffDustClouds_26:
    dw $0001
    %spritemapEntry(1, $43EA, $CE, 0, 1, 3, 5, $1CC)

EnemyProjSpritemaps_GunshipLiftoffDustClouds_27:
    dw $0006
    %spritemapEntry(0, $1FC, $04, 0, 1, 3, 5, $1A1)
    %spritemapEntry(0, $04, $04, 0, 1, 3, 5, $1A0)
    %spritemapEntry(0, $1F4, $04, 0, 1, 3, 5, $1A2)
    %spritemapEntry(0, $1F4, $FC, 0, 1, 3, 5, $192)
    %spritemapEntry(0, $1F4, $F4, 0, 1, 3, 5, $182)
    %spritemapEntry(1, $43FC, $F4, 0, 1, 3, 5, $180)

EnemyProjSpritemaps_GunshipLiftoffDustClouds_28:
    dw $000A
    %spritemapEntry(0, $08, $F2, 0, 1, 3, 5, $1A1)
    %spritemapEntry(0, $10, $F2, 0, 1, 3, 5, $1A0)
    %spritemapEntry(0, $00, $F2, 0, 1, 3, 5, $1A2)
    %spritemapEntry(0, $00, $EA, 0, 1, 3, 5, $192)
    %spritemapEntry(0, $00, $E2, 0, 1, 3, 5, $182)
    %spritemapEntry(1, $4208, $E2, 0, 1, 3, 5, $180)
    %spritemapEntry(1, $43EC, $FE, 0, 1, 3, 5, $1A5)
    %spritemapEntry(1, $43FC, $FE, 0, 1, 3, 5, $1A3)
    %spritemapEntry(1, $43EC, $EE, 0, 1, 3, 5, $185)
    %spritemapEntry(1, $43FC, $EE, 0, 1, 3, 5, $183)

EnemyProjSpritemaps_GunshipLiftoffDustClouds_29:
    dw $000E
    %spritemapEntry(0, $1E4, $F8, 0, 1, 3, 5, $1A1)
    %spritemapEntry(0, $1EC, $F8, 0, 1, 3, 5, $1A0)
    %spritemapEntry(0, $1DC, $F8, 0, 1, 3, 5, $1A2)
    %spritemapEntry(0, $1DC, $F0, 0, 1, 3, 5, $192)
    %spritemapEntry(0, $1DC, $E8, 0, 1, 3, 5, $182)
    %spritemapEntry(1, $43E4, $E8, 0, 1, 3, 5, $180)
    %spritemapEntry(1, $43F8, $EC, 0, 1, 3, 5, $1A5)
    %spritemapEntry(1, $4208, $EC, 0, 1, 3, 5, $1A3)
    %spritemapEntry(1, $43F8, $DC, 0, 1, 3, 5, $185)
    %spritemapEntry(1, $4208, $DC, 0, 1, 3, 5, $183)
    %spritemapEntry(1, $43E8, $FC, 0, 1, 3, 5, $1A9)
    %spritemapEntry(1, $43F8, $FC, 0, 1, 3, 5, $1A7)
    %spritemapEntry(1, $43E8, $EC, 0, 1, 3, 5, $189)
    %spritemapEntry(1, $43F8, $EC, 0, 1, 3, 5, $187)

EnemyProjSpritemaps_GunshipLiftoffDustClouds_2A:
    dw $000C
    %spritemapEntry(1, $43F4, $EA, 0, 1, 3, 5, $1A9)
    %spritemapEntry(1, $4204, $EA, 0, 1, 3, 5, $1A7)
    %spritemapEntry(1, $43F4, $DA, 0, 1, 3, 5, $189)
    %spritemapEntry(1, $4204, $DA, 0, 1, 3, 5, $187)
    %spritemapEntry(1, $43D4, $F2, 0, 1, 3, 5, $1A5)
    %spritemapEntry(1, $43E4, $F2, 0, 1, 3, 5, $1A3)
    %spritemapEntry(1, $43D4, $E2, 0, 1, 3, 5, $185)
    %spritemapEntry(1, $43E4, $E2, 0, 1, 3, 5, $183)
    %spritemapEntry(1, $43E4, $FA, 0, 1, 3, 5, $1AD)
    %spritemapEntry(1, $43F4, $FA, 0, 1, 3, 5, $1AB)
    %spritemapEntry(1, $43E4, $EA, 0, 1, 3, 5, $18D)
    %spritemapEntry(1, $43F4, $EA, 0, 1, 3, 5, $18B)

EnemyProjSpritemaps_GunshipLiftoffDustClouds_2B:
    dw $000C
    %spritemapEntry(1, $43D0, $F0, 0, 1, 3, 5, $1A9)
    %spritemapEntry(1, $43E0, $F0, 0, 1, 3, 5, $1A7)
    %spritemapEntry(1, $43D0, $E0, 0, 1, 3, 5, $189)
    %spritemapEntry(1, $43E0, $E0, 0, 1, 3, 5, $187)
    %spritemapEntry(1, $43F0, $E8, 0, 1, 3, 5, $1AD)
    %spritemapEntry(1, $4200, $E8, 0, 1, 3, 5, $1AB)
    %spritemapEntry(1, $43F0, $D8, 0, 1, 3, 5, $18D)
    %spritemapEntry(1, $4200, $D8, 0, 1, 3, 5, $18B)
    %spritemapEntry(1, $43E0, $F8, 0, 1, 3, 5, $1E2)
    %spritemapEntry(1, $43F0, $F8, 0, 1, 3, 5, $1E0)
    %spritemapEntry(1, $43E0, $E8, 0, 1, 3, 5, $1C2)
    %spritemapEntry(1, $43F0, $E8, 0, 1, 3, 5, $1C0)

EnemyProjSpritemaps_GunshipLiftoffDustClouds_2C:
    dw $0008
    %spritemapEntry(1, $43EC, $E6, 0, 1, 3, 5, $1E2)
    %spritemapEntry(1, $43FC, $E6, 0, 1, 3, 5, $1E0)
    %spritemapEntry(1, $43EC, $D6, 0, 1, 3, 5, $1C2)
    %spritemapEntry(1, $43FC, $D6, 0, 1, 3, 5, $1C0)
    %spritemapEntry(1, $43CC, $EE, 0, 1, 3, 5, $1AD)
    %spritemapEntry(1, $43DC, $EE, 0, 1, 3, 5, $1AB)
    %spritemapEntry(1, $43CC, $DE, 0, 1, 3, 5, $18D)
    %spritemapEntry(1, $43DC, $DE, 0, 1, 3, 5, $18B)

EnemyProjSpritemaps_GunshipLiftoffDustClouds_2D:
    dw $0004
    %spritemapEntry(1, $43C8, $EC, 0, 1, 3, 5, $1E2)
    %spritemapEntry(1, $43D8, $EC, 0, 1, 3, 5, $1E0)
    %spritemapEntry(1, $43C8, $DC, 0, 1, 3, 5, $1C2)
    %spritemapEntry(1, $43D8, $DC, 0, 1, 3, 5, $1C0)

UNUSED_EnemyProjSpritemaps_Draygon_0_8D8967:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $100)

UNUSED_EnemyProjSpritemaps_Draygon_1_8D896E:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $101)

UNUSED_EnemyProjSpritemaps_Draygon_2_8D8975:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $102)

UNUSED_EnemyProjSpritemaps_0_8D897C:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $103)

UNUSED_EnemyProjSpritemaps_1_8D8983:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $104)

UNUSED_EnemyProjSpritemaps_2_8D898A:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $105)

UNUSED_EnemyProjSpritemaps_0_8D8991:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $106)

UNUSED_EnemyProjSpritemaps_1_8D8998:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $107)

UNUSED_EnemyProjSpritemaps_2_8D899F:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $108)

UNUSED_EnemyProjSpritemaps_0_8D89A6:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 0, 3, 0, $103)

UNUSED_EnemyProjSpritemaps_1_8D89AD:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 0, 3, 0, $104)

UNUSED_EnemyProjSpritemaps_2_8D89B4:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 0, 3, 0, $105)

UNUSED_EnemyProjSpritemaps_0_8D89BB:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 0, 3, 0, $100)

UNUSED_EnemyProjSpritemaps_1_8D89C2:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 0, 3, 0, $101)

UNUSED_EnemyProjSpritemaps_2_8D89C9:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 0, 3, 0, $102)

UNUSED_EnemyProjSpritemaps_0_8D89D0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 1, 3, 0, $103)

UNUSED_EnemyProjSpritemaps_1_8D89D7:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 1, 3, 0, $104)

UNUSED_EnemyProjSpritemaps_2_8D89DE:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 1, 3, 0, $105)

UNUSED_EnemyProjSpritemaps_0_8D89E5:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 3, 0, $106)

UNUSED_EnemyProjSpritemaps_1_8D89EC:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 3, 0, $107)

UNUSED_EnemyProjSpritemaps_2_8D89F3:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 3, 0, $108)

UNUSED_EnemyProjSpritemaps_0_8D89FA:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 3, 0, $103)

UNUSED_EnemyProjSpritemaps_1_8D8A01:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 3, 0, $104)

UNUSED_EnemyProjSpritemaps_2_8D8A08:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 3, 0, $105)

UNUSED_EnemyProjSpritemaps_Draygon_8D8A0F:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $164)

EnemyProjSpritemaps_DraygonGoop_0:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 1, 0, $16A)

EnemyProjSpritemaps_DraygonGoop_1:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 1, 0, $15E)

EnemyProjSpritemaps_DraygonGoop_2:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 1, 0, $15C)

EnemyProjSpritemaps_DraygonGoop_3:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 1, 0, $14A)

UNUSED_EnemyProjSpritemaps_Draygon_0_8D8A32:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $17E)

UNUSED_EnemyProjSpritemaps_Draygon_1_8D8A39:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $17D)

UNUSED_EnemyProjSpritemaps_Draygon_2_8D8A40:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $17C)

UNUSED_EnemyProjSpritemaps_Draygon_3_8D8A47:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $18A)

UNUSED_EnemyProjSpritemaps_Draygon_4_8D8A4E:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $17F)

UNUSED_EnemyProjSpritemaps_Draygon_5_8D8A55:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $177)

UNUSED_EnemyProjSpritemaps_Draygon_6_8D8A5C:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $176)

UNUSED_EnemyProjSpritemaps_0_8D8A63:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $18C)

UNUSED_EnemyProjSpritemaps_1_8D8A6A:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $18E)

EnemyProjSpritemaps_DraygonsWallTurretProjectile_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $17E)

EnemyProjSpritemaps_DraygonsWallTurretProjectile_1:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $17D)

EnemyProjSpritemaps_DraygonsWallTurretProjectile_2:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $17C)

EnemyProjSpritemaps_DraygonsWallTurretProjectile_3:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 5, $18A)

EnemyProjSpritemaps_DraygonGoop_4:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 1, $18C)

EnemyProjSpritemaps_DraygonGoop_5:
    dw $0004
    %spritemapEntry(0, $02, $02, 0, 0, 3, 1, $19F)
    %spritemapEntry(0, $1F6, $02, 0, 0, 3, 1, $19E)
    %spritemapEntry(0, $02, $F6, 0, 0, 3, 1, $18F)
    %spritemapEntry(0, $1F6, $F6, 0, 0, 3, 1, $18E)

EnemyProjSpritemaps_DraygonsWallTurretProjectile_4:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 5, $1CA)

EnemyProjSpritemaps_DraygonsWallTurretProjectile_5:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 5, $1CC)

EnemyProjSpritemaps_DraygonsWallTurretProjectile_6:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 5, $1CE)

EnemyProjSpritemaps_CeresFallingTile_Light:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $EA)

EnemyProjSpritemaps_CeresFallingTile_Dark:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $EC)

EnemyProjSpritemaps_PirateClaw_0:
    dw $0003
    %spritemapEntry(0, $04, $FC, 0, 0, 3, 0, $14C)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $14B)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 3, 0, $14A)

EnemyProjSpritemaps_PirateClaw_1:
    dw $0002
    %spritemapEntry(1, $1FC, $F8, 0, 0, 3, 0, $128)
    %spritemapEntry(1, $1F4, $F8, 0, 0, 3, 0, $127)

EnemyProjSpritemaps_PirateClaw_2:
    dw $0003
    %spritemapEntry(0, $1FC, $F4, 1, 1, 3, 0, $14D)
    %spritemapEntry(0, $1FC, $FC, 1, 1, 3, 0, $13D)
    %spritemapEntry(0, $1FC, $04, 1, 1, 3, 0, $12D)

EnemyProjSpritemaps_PirateClaw_3:
    dw $0002
    %spritemapEntry(1, $1F4, $F8, 1, 1, 3, 0, $12B)
    %spritemapEntry(1, $1FC, $F8, 1, 1, 3, 0, $12A)

EnemyProjSpritemaps_PirateClaw_4:
    dw $0003
    %spritemapEntry(0, $1F4, $FC, 1, 1, 3, 0, $14C)
    %spritemapEntry(0, $1FC, $FC, 1, 1, 3, 0, $14B)
    %spritemapEntry(0, $04, $FC, 1, 1, 3, 0, $14A)

EnemyProjSpritemaps_PirateClaw_5:
    dw $0002
    %spritemapEntry(1, $1F4, $F8, 1, 1, 3, 0, $128)
    %spritemapEntry(1, $1FC, $F8, 1, 1, 3, 0, $127)

EnemyProjSpritemaps_PirateClaw_6:
    dw $0003
    %spritemapEntry(0, $1FC, $04, 0, 0, 3, 0, $14D)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $13D)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 3, 0, $12D)

EnemyProjSpritemaps_PirateClaw_7:
    dw $0002
    %spritemapEntry(1, $1FC, $F8, 0, 0, 3, 0, $12B)
    %spritemapEntry(1, $1F4, $F8, 0, 0, 3, 0, $12A)

EnemyProjSpritemaps_PirateClaw_8:
    dw $0003
    %spritemapEntry(0, $1F4, $FC, 0, 1, 3, 0, $14C)
    %spritemapEntry(0, $1FC, $FC, 0, 1, 3, 0, $14B)
    %spritemapEntry(0, $04, $FC, 0, 1, 3, 0, $14A)

EnemyProjSpritemaps_PirateClaw_9:
    dw $0002
    %spritemapEntry(1, $1F4, $F8, 0, 1, 3, 0, $128)
    %spritemapEntry(1, $1FC, $F8, 0, 1, 3, 0, $127)

EnemyProjSpritemaps_PirateClaw_A:
    dw $0003
    %spritemapEntry(0, $1FC, $F4, 1, 0, 3, 0, $14D)
    %spritemapEntry(0, $1FC, $FC, 1, 0, 3, 0, $13D)
    %spritemapEntry(0, $1FC, $04, 1, 0, 3, 0, $12D)

EnemyProjSpritemaps_PirateClaw_B:
    dw $0002
    %spritemapEntry(1, $1FC, $F8, 1, 0, 3, 0, $12B)
    %spritemapEntry(1, $1F4, $F8, 1, 0, 3, 0, $12A)

EnemyProjSpritemaps_PirateClaw_C:
    dw $0003
    %spritemapEntry(0, $04, $FC, 1, 0, 3, 0, $14C)
    %spritemapEntry(0, $1FC, $FC, 1, 0, 3, 0, $14B)
    %spritemapEntry(0, $1F4, $FC, 1, 0, 3, 0, $14A)

EnemyProjSpritemaps_PirateClaw_D:
    dw $0002
    %spritemapEntry(1, $1FC, $F8, 1, 0, 3, 0, $128)
    %spritemapEntry(1, $1F4, $F8, 1, 0, 3, 0, $127)

EnemyProjSpritemaps_PirateClaw_E:
    dw $0003
    %spritemapEntry(0, $1FC, $04, 0, 1, 3, 0, $14D)
    %spritemapEntry(0, $1FC, $FC, 0, 1, 3, 0, $13D)
    %spritemapEntry(0, $1FC, $F4, 0, 1, 3, 0, $12D)

EnemyProjSpritemaps_PirateClaw_F:
    dw $0002
    %spritemapEntry(1, $1F4, $F8, 0, 1, 3, 0, $12B)
    %spritemapEntry(1, $1FC, $F8, 0, 1, 3, 0, $12A)

EnemyProjSpritemaps_Pirate_MotherBrain_Laser_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $6F)

EnemyProjSpritemaps_Pirate_MotherBrain_Laser_1:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $6B)

EnemyProjSpritemaps_Pirate_MotherBrain_Laser_2:
    dw $0002
    %spritemapEntry(0, $00, $FC, 0, 1, 3, 5, $6F)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 5, $6F)

EnemyProjSpritemaps_Pirate_MotherBrain_Laser_3:
    dw $0002
    %spritemapEntry(0, $00, $FC, 0, 1, 3, 5, $6B)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 5, $6B)

EnemyProjSpritemaps_Pirate_MotherBrain_Laser_4:
    dw $0003
    %spritemapEntry(0, $04, $FC, 0, 1, 3, 5, $CD)
    %spritemapEntry(0, $1FC, $FC, 0, 1, 3, 5, $6F)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 3, 5, $6F)

EnemyProjSpritemaps_Pirate_MotherBrain_Laser_5:
    dw $0003
    %spritemapEntry(0, $04, $FC, 0, 1, 3, 5, $6B)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $6B)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 3, 5, $6B)

EnemyProjSpritemaps_Pirate_MotherBrain_Laser_6:
    dw $0004
    %spritemapEntry(0, $08, $FC, 0, 1, 3, 5, $CD)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 3, 5, $CD)
    %spritemapEntry(0, $00, $FC, 0, 1, 3, 5, $6F)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 5, $6F)

EnemyProjSpritemaps_Pirate_MotherBrain_Laser_7:
    dw $0004
    %spritemapEntry(0, $08, $FC, 1, 1, 3, 5, $6B)
    %spritemapEntry(0, $00, $FC, 1, 1, 3, 5, $6B)
    %spritemapEntry(0, $1F8, $FC, 1, 0, 3, 5, $6B)
    %spritemapEntry(0, $1F0, $FC, 1, 0, 3, 5, $6B)

EnemyProjSpritemaps_Pirate_MotherBrain_Laser_8:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $53)

EnemyProjSpritemaps_Pirate_MotherBrain_Laser_9:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $51)

EnemyProjSpritemaps_Pirate_MotherBrain_Laser_A:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $60)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $60)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $60)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $60)

UNUSED_EnemyProjSpritemaps_QuestionMark_8D8C4D:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 5, $E0)

UNUSED_EnemyProjSpritemaps_BombTorizoLowHealthDrool_0_8D8C54:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 5, $170)

UNUSED_EnemyProjSpritemaps_BombTorizoLowHealthDrool_1_8D8C5B:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 5, $163)

UNUSED_EnemyProjSpritemaps_BombTorizoLowHealthDrool_2_8D8C62:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 5, $167)

UNUSED_EnemyProjSpritemaps_BombTorizoLowHealthDrool_3_8D8C69:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 5, $16A)

EnemyProjSpritemaps_TorizoChozoOrbs_0:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 1, 2, 3, $12C)

EnemyProjSpritemaps_TorizoChozoOrbs_1:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 3, $12C)

EnemyProjSpritemaps_TorizoChozoOrbs_GoldenTorizoEyeBeam_0:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 1, 2, 5, $12E)

EnemyProjSpritemaps_TorizoChozoOrbs_GoldenTorizoEyeBeam_1:
    dw $0002
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 5, $180)
    %spritemapEntry(0, $00, $00, 0, 1, 2, 5, $180)

EnemyProjSpritemaps_TorizoChozoOrbs_GoldenTorizoEyeBeam_2:
    dw $0004
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 5, $190)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 5, $180)
    %spritemapEntry(0, $00, $00, 0, 1, 2, 5, $190)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 5, $180)

EnemyProjSpritemaps_TorizoChozoOrbs_GoldenTorizoEyeBeam_3:
    dw $0003
    %spritemapEntry(1, $43F8, $F0, 0, 1, 2, 5, $180)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 5, $199)
    %spritemapEntry(0, $00, $00, 0, 1, 2, 5, $199)

EnemyProjSpritemaps_TorizoChozoOrbs_GoldenTorizoEyeBeam_4:
    dw $0003
    %spritemapEntry(0, $00, $00, 0, 1, 2, 5, $180)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 5, $180)
    %spritemapEntry(1, $43F8, $EC, 0, 0, 2, 5, $12E)

EnemyProjSpritemaps_TorizoChozoOrbs_GoldenTorizoEyeBeam_5:
    dw $0006
    %spritemapEntry(0, $1F8, $00, 1, 1, 2, 5, $152)
    %spritemapEntry(0, $00, $00, 1, 0, 2, 5, $152)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 2, 5, $192)
    %spritemapEntry(0, $1F8, $E8, 0, 0, 2, 5, $182)
    %spritemapEntry(0, $00, $F0, 0, 1, 2, 5, $192)
    %spritemapEntry(0, $00, $E8, 0, 1, 2, 5, $182)

EnemyProjSpritemaps_TorizoSonicBoom_0:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 0, 2, 5, $15E)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 5, $15D)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 5, $15E)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 5, $15D)

EnemyProjSpritemaps_TorizoSonicBoom_1:
    dw $0006
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 5, $1BE)
    %spritemapEntry(0, $00, $08, 1, 0, 2, 5, $1BD)
    %spritemapEntry(0, $1F8, $08, 1, 0, 2, 5, $1BC)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 5, $1BE)
    %spritemapEntry(0, $00, $F0, 0, 0, 2, 5, $1BD)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 2, 5, $1BC)

EnemyProjSpritemaps_TorizoSonicBoom_2:
    dw $0006
    %spritemapEntry(0, $1FC, $00, 1, 0, 2, 5, $1BF)
    %spritemapEntry(0, $1FC, $08, 1, 0, 2, 5, $165)
    %spritemapEntry(0, $1FC, $10, 1, 0, 2, 5, $149)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 5, $1BF)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 2, 5, $165)
    %spritemapEntry(0, $1FC, $E8, 0, 0, 2, 5, $149)

EnemyProjSpritemaps_TorizoSonicBoom_3:
    dw $0004
    %spritemapEntry(0, $1F8, $00, 1, 1, 2, 5, $15E)
    %spritemapEntry(0, $00, $00, 1, 1, 2, 5, $15D)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 5, $15E)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 5, $15D)

EnemyProjSpritemaps_TorizoSonicBoom_4:
    dw $0006
    %spritemapEntry(0, $00, $00, 1, 1, 2, 5, $1BE)
    %spritemapEntry(0, $1F8, $08, 1, 1, 2, 5, $1BD)
    %spritemapEntry(0, $00, $08, 1, 1, 2, 5, $1BC)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 5, $1BE)
    %spritemapEntry(0, $1F8, $F0, 0, 1, 2, 5, $1BD)
    %spritemapEntry(0, $00, $F0, 0, 1, 2, 5, $1BC)

EnemyProjSpritemaps_TorizoSonicBoom_5:
    dw $0006
    %spritemapEntry(0, $1FC, $00, 1, 1, 2, 5, $1BF)
    %spritemapEntry(0, $1FC, $08, 1, 1, 2, 5, $165)
    %spritemapEntry(0, $1FC, $10, 1, 1, 2, 5, $149)
    %spritemapEntry(0, $1FC, $F8, 0, 1, 2, 5, $1BF)
    %spritemapEntry(0, $1FC, $F0, 0, 1, 2, 5, $165)
    %spritemapEntry(0, $1FC, $E8, 0, 1, 2, 5, $149)

UNUSED_EnemyProjSpritemaps_8D8D95:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 5, $5E)

EnemyProjSpritemaps_Common_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 5, $5F)

EnemyProjSpritemaps_Common_1:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 2, 5, $60)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 5, $60)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 5, $60)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 5, $60)

EnemyProjSpritemaps_Common_2:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 2, 5, $61)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 5, $61)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 5, $61)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 5, $61)

EnemyProjSpritemaps_Common_3:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 2, 5, $62)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 5, $62)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 5, $62)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 5, $62)

EnemyProjSpritemaps_Common_4:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 2, 5, $63)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 5, $63)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 5, $63)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 5, $63)

EnemyProjSpritemaps_BombTorizoChozoBreaking_0:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 7, $E0)

EnemyProjSpritemaps_BombTorizoChozoBreaking_1:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 7, $E2)

EnemyProjSpritemaps_BombTorizoChozoBreaking_2:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 7, $E4)

EnemyProjSpritemaps_BombTorizoChozoBreaking_3:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 7, $E6)

EnemyProjSpritemaps_BombTorizoChozoBreaking_4:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 7, $E8)

EnemyProjSpritemaps_BombTorizoChozoBreaking_5:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 7, $EA)

EnemyProjSpritemaps_BombTorizoChozoBreaking_6:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 7, $EC)

EnemyProjSpritemaps_BombTorizoChozoBreaking_7:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 7, $EE)

EnemyProjSpritemaps_BombTorizoChozoBreaking_8:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 1, 2, 7, $E0)

EnemyProjSpritemaps_BombTorizoChozoBreaking_9:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 1, 2, 7, $E2)

EnemyProjSpritemaps_BombTorizoChozoBreaking_A:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 1, 2, 7, $E4)

EnemyProjSpritemaps_BombTorizoChozoBreaking_B:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 1, 2, 7, $E6)

EnemyProjSpritemaps_BombTorizoChozoBreaking_C:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 1, 2, 7, $E8)

EnemyProjSpritemaps_BombTorizoChozoBreaking_D:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 1, 2, 7, $EA)

EnemyProjSpritemaps_BombTorizoChozoBreaking_E:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 1, 2, 7, $EC)

EnemyProjSpritemaps_BombTorizoChozoBreaking_F:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 1, 2, 7, $EE)

EnemyProjSpritemaps_GoldenTorizoSuperMissile_0:
    dw $0002
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 5, $65)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 5, $64)

EnemyProjSpritemaps_GoldenTorizoSuperMissile_1:
    dw $0003
    %spritemapEntry(0, $03, $FF, 0, 0, 2, 5, $68)
    %spritemapEntry(0, $1FB, $FF, 0, 0, 2, 5, $67)
    %spritemapEntry(0, $1FB, $F7, 0, 0, 2, 5, $66)

EnemyProjSpritemaps_GoldenTorizoSuperMissile_2:
    dw $0002
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 5, $6A)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 5, $69)

EnemyProjSpritemaps_GoldenTorizoSuperMissile_3:
    dw $0003
    %spritemapEntry(0, $1F5, $FF, 0, 1, 2, 5, $68)
    %spritemapEntry(0, $1FD, $FF, 0, 1, 2, 5, $67)
    %spritemapEntry(0, $1FD, $F7, 0, 1, 2, 5, $66)

EnemyProjSpritemaps_GoldenTorizoSuperMissile_4:
    dw $0002
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 5, $65)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 5, $64)

EnemyProjSpritemaps_GoldenTorizoSuperMissile_5:
    dw $0003
    %spritemapEntry(0, $1F5, $F9, 1, 1, 2, 5, $68)
    %spritemapEntry(0, $1FD, $F9, 1, 1, 2, 5, $67)
    %spritemapEntry(0, $1FD, $01, 1, 1, 2, 5, $66)

EnemyProjSpritemaps_GoldenTorizoSuperMissile_6:
    dw $0002
    %spritemapEntry(0, $1FC, $F8, 1, 0, 2, 5, $6A)
    %spritemapEntry(0, $1FC, $00, 1, 0, 2, 5, $69)

EnemyProjSpritemaps_GoldenTorizoSuperMissile_7:
    dw $0003
    %spritemapEntry(0, $03, $F9, 1, 0, 2, 5, $68)
    %spritemapEntry(0, $1FB, $F9, 1, 0, 2, 5, $67)
    %spritemapEntry(0, $1FB, $01, 1, 0, 2, 5, $66)

EnemyProjSpritemaps_TorizoLandingDustCloud_Right_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 5, $48)

EnemyProjSpritemaps_TorizoLandingDustCloud_Right_1:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 5, $49)

EnemyProjSpritemaps_TorizoLandingDustCloud_Right_2:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 5, $4A)

EnemyProjSpritemaps_TorizoLandingDustCloud_Right_3:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 5, $4B)

EnemyProjSpritemaps_TorizoLandingDustCloud_Left_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 5, $48)

EnemyProjSpritemaps_TorizoLandingDustCloud_Left_1:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 5, $49)

EnemyProjSpritemaps_TorizoLandingDustCloud_Left_2:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 5, $4A)

EnemyProjSpritemaps_TorizoLandingDustCloud_Left_3:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 5, $4B)

EnemyProjSpritemaps_GoldenTorizoEgg_0:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 5, $104)

EnemyProjSpritemaps_GoldenTorizoEgg_1:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 5, $18C)

EnemyProjSpritemaps_GoldenTorizoEgg_2:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 5, $1CC)

EnemyProjSpritemaps_GoldenTorizoEgg_3:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 5, $D0)

EnemyProjSpritemaps_GoldenTorizoEgg_4:
    dw $0001
    %spritemapEntry(1, $43F8, $F6, 0, 0, 2, 1, $D2)

EnemyProjSpritemaps_GoldenTorizoEgg_5:
    dw $0001
    %spritemapEntry(1, $43F8, $F6, 0, 0, 2, 1, $D4)

EnemyProjSpritemaps_GoldenTorizoEgg_6:
    dw $0001
    %spritemapEntry(1, $43F8, $F6, 0, 0, 2, 1, $D6)

EnemyProjSpritemaps_GoldenTorizoEgg_7:
    dw $0001
    %spritemapEntry(1, $43F8, $F6, 0, 0, 2, 1, $D8)

EnemyProjSpritemaps_GoldenTorizoEgg_8:
    dw $0001
    %spritemapEntry(1, $43F8, $F6, 0, 0, 2, 1, $DA)

EnemyProjSpritemaps_GoldenTorizoEgg_9:
    dw $0001
    %spritemapEntry(1, $43F8, $F6, 0, 0, 2, 1, $DC)

EnemyProjSpritemaps_GoldenTorizoEgg_A:
    dw $0002
    %spritemapEntry(0, $00, $FE, 0, 0, 2, 1, $EF)
    %spritemapEntry(0, $1F8, $FE, 0, 0, 2, 1, $EE)

EnemyProjSpritemaps_GoldenTorizoEgg_B:
    dw $0002
    %spritemapEntry(0, $00, $FE, 0, 0, 2, 1, $DF)
    %spritemapEntry(0, $1F8, $FE, 0, 0, 2, 1, $DE)

EnemyProjSpritemaps_GoldenTorizoEgg_C:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 1, 2, 5, $104)

EnemyProjSpritemaps_GoldenTorizoEgg_D:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 1, 2, 5, $18C)

EnemyProjSpritemaps_GoldenTorizoEgg_E:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 1, 2, 5, $1CC)

EnemyProjSpritemaps_GoldenTorizoEgg_F:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 1, 2, 5, $D0)

EnemyProjSpritemaps_GoldenTorizoEgg_10:
    dw $0001
    %spritemapEntry(1, $43F8, $F6, 0, 1, 2, 1, $D2)

EnemyProjSpritemaps_GoldenTorizoEgg_11:
    dw $0001
    %spritemapEntry(1, $43F8, $F6, 0, 1, 2, 1, $D4)

EnemyProjSpritemaps_GoldenTorizoEgg_12:
    dw $0001
    %spritemapEntry(1, $43F8, $F6, 0, 1, 2, 1, $D6)

EnemyProjSpritemaps_GoldenTorizoEgg_13:
    dw $0001
    %spritemapEntry(1, $43F8, $F6, 0, 1, 2, 1, $D8)

EnemyProjSpritemaps_GoldenTorizoEgg_14:
    dw $0001
    %spritemapEntry(1, $43F8, $F6, 0, 1, 2, 1, $DA)

EnemyProjSpritemaps_GoldenTorizoEgg_15:
    dw $0001
    %spritemapEntry(1, $43F8, $F6, 0, 1, 2, 1, $DC)

EnemyProjSpritemaps_GoldenTorizoEgg_16:
    dw $0002
    %spritemapEntry(0, $00, $FE, 0, 1, 2, 1, $EF)
    %spritemapEntry(0, $1F8, $FE, 0, 1, 2, 1, $EE)

EnemyProjSpritemaps_GoldenTorizoEgg_17:
    dw $0002
    %spritemapEntry(0, $00, $FE, 0, 1, 2, 1, $DF)
    %spritemapEntry(0, $1F8, $FE, 0, 1, 2, 1, $DE)

EnemyProjSpritemaps_DragonFireball_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $122)

EnemyProjSpritemaps_DragonFireball_1:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $123)

EnemyProjSpritemaps_DragonFireball_2:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 0, 2, 0, $122)

EnemyProjSpritemaps_DragonFireball_3:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 0, 2, 0, $123)

EnemyProjSpritemaps_DragonFireball_4:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 0, $122)

EnemyProjSpritemaps_DragonFireball_5:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 0, $123)

EnemyProjSpritemaps_DragonFireball_6:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 1, 2, 0, $122)

EnemyProjSpritemaps_DragonFireball_7:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 1, 2, 0, $123)

EnemyProjSpritemaps_EyeDoorProjectile_4:
    dw $0004
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $63)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $63)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $63)
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $63)

EnemyProjSpritemaps_EyeDoorProjectile_5:
    dw $0004
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $62)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $62)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $62)
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $62)

EnemyProjSpritemaps_EyeDoorProjectile_6:
    dw $0004
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $61)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $61)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $61)
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $61)

EnemyProjSpritemaps_EyeDoorProjectile_7:
    dw $0004
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 6, $60)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 6, $60)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 6, $60)
    %spritemapEntry(0, $00, $00, 1, 1, 2, 6, $60)

EnemyProjSpritemaps_EyeDoorSweat_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 5, $43)

EnemyProjSpritemaps_EyeDoorSweat_1:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 5, $2C)

EnemyProjSpritemaps_EyeDoorSweat_2:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 5, $2D)

EnemyProjSpritemaps_EyeDoorSweat_3:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 5, $2E)

UNUSED_EnemyProjSpritemaps_8D907F:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 5, $2F)

EnemyProjSpritemaps_TourianStatueUnlockParticleWaterSplash_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 3, 7, $2C)

EnemyProjSpritemaps_TourianStatueUnlockParticleWaterSplash_1:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 3, 7, $2D)

EnemyProjSpritemaps_TourianStatueUnlockParticleWaterSplash_2:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 3, 7, $2E)

EnemyProjSpritemaps_TourianStatueUnlockParticleWaterSplash_3:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 3, 7, $2F)

EnemyProjSpritemaps_TourianStatueUnlockingParticleTail_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 7, $DA)

EnemyProjSpritemaps_TourianStatueUnlockingParticleTail_1:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 7, $DB)

EnemyProjSpritemaps_TourianStatueUnlockingParticleTail_2:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 7, $DC)

EnemyProjSpritemaps_TourianStatueUnlockingParticleTail_3:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 7, $DD)

EnemyProjSpritemaps_TourianStatueEyeGlow_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 7, $D0)

EnemyProjSpritemaps_TourianStatueEyeGlow_1:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 7, $D1)

EnemyProjSpritemaps_TourianStatueEyeGlow_2:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 7, $D2)

EnemyProjSpritemaps_TourianStatueEyeGlow_3:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 7, $E2)

EnemyProjSpritemaps_TourianStatueEyeGlow_4:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 7, $E4)

EnemyProjSpritemaps_TourianStatueEyeGlow_5:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 7, $E6)

EnemyProjSpritemaps_TourianStatueEyeGlow_6:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 7, $E8)

EnemyProjSpritemaps_TourianStatueEyeGlow_7:
    dw $0006
    %spritemapEntry(0, $03, $04, 1, 1, 3, 7, $EA)
    %spritemapEntry(0, $03, $FC, 0, 1, 3, 7, $FA)
    %spritemapEntry(0, $03, $F4, 0, 1, 3, 7, $EA)
    %spritemapEntry(0, $1FC, $04, 1, 0, 3, 7, $EB)
    %spritemapEntry(0, $1F4, $04, 1, 0, 3, 7, $EA)
    %spritemapEntry(1, $43F4, $F4, 0, 0, 3, 7, $EA)

EnemyProjSpritemaps_TourianStatueEyeGlow_8:
    dw $0004
    %spritemapEntry(1, $4200, $00, 0, 1, 3, 7, $EE)
    %spritemapEntry(1, $43F0, $00, 0, 0, 3, 7, $EE)
    %spritemapEntry(1, $4200, $F0, 0, 1, 3, 7, $EC)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 7, $EC)

EnemyProjSpritemaps_TourianStatueUnlockingParticle_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 7, $D3)

EnemyProjSpritemaps_TourianStatueUnlockingParticle_1:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 3, 7, $D3)

EnemyProjSpritemaps_TourianStatueUnlockingParticle_2:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 0, 3, 7, $D3)

EnemyProjSpritemaps_TourianStatueUnlockingParticle_3:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 1, 3, 7, $D3)

EnemyProjSpritemaps_TourianStatuesSoul_0:
    dw $0004
    %spritemapEntry(0, $00, $00, 0, 0, 3, 7, $D6)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 7, $D5)
    %spritemapEntry(0, $1FC, $08, 0, 0, 3, 7, $D4)
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 7, $E0)

EnemyProjSpritemaps_TourianStatuesSoul_1:
    dw $0004
    %spritemapEntry(0, $1FC, $08, 0, 0, 3, 7, $D9)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 7, $D8)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 7, $D7)
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 7, $E0)

EnemyProjSpritemaps_TourianStatueBaseDecoration:
    dw $0007
    %spritemapEntry(1, $4228, $F8, 0, 0, 1, 7, $19C)
    %spritemapEntry(1, $4218, $F8, 0, 0, 1, 7, $19A)
    %spritemapEntry(1, $4208, $F8, 0, 0, 1, 7, $198)
    %spritemapEntry(1, $43F8, $F8, 0, 0, 1, 7, $196)
    %spritemapEntry(1, $43E8, $F8, 0, 0, 1, 7, $194)
    %spritemapEntry(1, $43D8, $F8, 0, 0, 1, 7, $192)
    %spritemapEntry(1, $43C8, $F8, 0, 0, 1, 7, $190)

EnemyProjSpritemaps_TourianStatueRidley:
    dw $0017
    %spritemapEntry(1, $43E5, $18, 0, 0, 2, 1, $144)
    %spritemapEntry(1, $43E5, $08, 0, 0, 2, 1, $12C)
    %spritemapEntry(1, $43F5, $18, 0, 0, 2, 1, $146)
    %spritemapEntry(0, $0D, $20, 0, 0, 2, 1, $17D)
    %spritemapEntry(0, $0D, $18, 0, 0, 2, 1, $16D)
    %spritemapEntry(0, $05, $18, 0, 0, 2, 1, $148)
    %spritemapEntry(1, $4215, $08, 0, 0, 2, 1, $142)
    %spritemapEntry(1, $4205, $08, 0, 0, 2, 1, $140)
    %spritemapEntry(1, $43F5, $08, 0, 0, 2, 1, $12E)
    %spritemapEntry(1, $43D5, $08, 0, 0, 2, 1, $12A)
    %spritemapEntry(1, $4215, $F8, 0, 0, 2, 1, $128)
    %spritemapEntry(1, $4205, $F8, 0, 0, 2, 1, $126)
    %spritemapEntry(1, $43F5, $F8, 0, 0, 2, 1, $124)
    %spritemapEntry(1, $43E5, $F8, 0, 0, 2, 1, $122)
    %spritemapEntry(1, $43D5, $F8, 0, 0, 2, 1, $120)
    %spritemapEntry(1, $4215, $E8, 0, 0, 2, 1, $10E)
    %spritemapEntry(1, $4205, $E8, 0, 0, 2, 1, $10C)
    %spritemapEntry(1, $43F5, $E8, 0, 0, 2, 1, $10A)
    %spritemapEntry(1, $43E5, $E8, 0, 0, 2, 1, $108)
    %spritemapEntry(1, $4215, $D8, 0, 0, 2, 1, $106)
    %spritemapEntry(1, $4205, $D8, 0, 0, 2, 1, $104)
    %spritemapEntry(1, $43F5, $D8, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $43E5, $D8, 0, 0, 2, 1, $100)

EnemyProjSpritemaps_TourianStatuePhantoon:
    dw $0013
    %spritemapEntry(0, $08, $1C, 0, 0, 2, 2, $187)
    %spritemapEntry(0, $00, $1C, 0, 0, 2, 2, $186)
    %spritemapEntry(0, $1F8, $1C, 0, 0, 2, 2, $185)
    %spritemapEntry(0, $1F0, $1C, 0, 0, 2, 2, $184)
    %spritemapEntry(0, $00, $04, 0, 0, 2, 2, $183)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 2, $181)
    %spritemapEntry(0, $1F8, $04, 0, 0, 2, 2, $182)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 2, $180)
    %spritemapEntry(1, $4208, $EC, 0, 0, 2, 2, $161)
    %spritemapEntry(1, $43E8, $EC, 0, 0, 2, 2, $14D)
    %spritemapEntry(1, $4208, $FC, 0, 0, 2, 2, $165)
    %spritemapEntry(1, $4208, $0C, 0, 0, 2, 2, $16B)
    %spritemapEntry(1, $43F8, $0C, 0, 0, 2, 2, $169)
    %spritemapEntry(1, $43E8, $0C, 0, 0, 2, 2, $167)
    %spritemapEntry(1, $43E8, $FC, 0, 0, 2, 2, $163)
    %spritemapEntry(1, $4200, $EC, 0, 0, 2, 2, $160)
    %spritemapEntry(1, $43F0, $EC, 0, 0, 2, 2, $14E)
    %spritemapEntry(1, $4200, $DC, 0, 0, 2, 2, $14B)
    %spritemapEntry(1, $43F0, $DC, 0, 0, 2, 2, $149)

UNUSED_EnemyProjSpritemaps_0_8D9268:
    dw $0001
    %spritemapEntry(1, $1F9, $F9, 0, 0, 2, 1, $10E)

UNUSED_EnemyProjSpritemaps_1_8D926F:
    dw $0001
    %spritemapEntry(1, $1FD, $F5, 0, 0, 2, 1, $120)

UNUSED_EnemyProjSpritemaps_2_8D9276:
    dw $0001
    %spritemapEntry(1, $03, $EE, 0, 0, 2, 1, $104)

UNUSED_EnemyProjSpritemaps_3_8D927D:
    dw $0001
    %spritemapEntry(1, $05, $EC, 0, 0, 2, 1, $108)

UNUSED_EnemyProjSpritemaps_4_8D9284:
    dw $0001
    %spritemapEntry(1, $05, $EC, 0, 0, 2, 1, $10C)

UNUSED_EnemyProjSpritemaps_5_8D928B:
    dw $0001
    %spritemapEntry(1, $05, $EC, 0, 0, 2, 1, $126)

UNUSED_EnemyProjSpritemaps_6_8D9292:
    dw $0001
    %spritemapEntry(1, $05, $EC, 0, 0, 2, 1, $12E)

UNUSED_EnemyProjSpritemaps_7_8D9299:
    dw $0001
    %spritemapEntry(1, $1F8, $F9, 0, 1, 2, 1, $10E)

UNUSED_EnemyProjSpritemaps_8_8D92A0:
    dw $0001
    %spritemapEntry(1, $1F4, $F5, 0, 1, 2, 1, $120)

UNUSED_EnemyProjSpritemaps_9_8D92A7:
    dw $0001
    %spritemapEntry(1, $1EE, $EE, 0, 1, 2, 1, $104)

UNUSED_EnemyProjSpritemaps_A_8D92AE:
    dw $0001
    %spritemapEntry(1, $1EC, $EC, 0, 1, 2, 1, $108)

UNUSED_EnemyProjSpritemaps_B_8D92B5:
    dw $0001
    %spritemapEntry(1, $1EC, $EC, 0, 1, 2, 1, $10C)

UNUSED_EnemyProjSpritemaps_C_8D92BC:
    dw $0001
    %spritemapEntry(1, $1EC, $EC, 0, 1, 2, 1, $126)

UNUSED_EnemyProjSpritemaps_D_8D92C3:
    dw $0001
    %spritemapEntry(1, $1EB, $EC, 0, 0, 2, 1, $12E)

UNUSED_EnemyProjSpritemaps_E_8D92CA:
    dw $0002
    %spritemapEntry(0, $1F1, $F8, 0, 1, 2, 1, $134)
    %spritemapEntry(0, $08, $F8, 0, 0, 2, 1, $134)

UNUSED_EnemyProjSpritemaps_F_8D92D6:
    dw $0002
    %spritemapEntry(0, $1F1, $F8, 0, 1, 2, 1, $124)
    %spritemapEntry(0, $08, $F8, 0, 0, 2, 1, $124)

UNUSED_EnemyProjSpritemaps_10_8D92E2:
    dw $0002
    %spritemapEntry(1, $1E9, $F0, 0, 1, 2, 1, $128)
    %spritemapEntry(1, $08, $F0, 0, 0, 2, 1, $128)

UNUSED_EnemyProjSpritemaps_11_8D92EE:
    dw $0002
    %spritemapEntry(1, $1E9, $F0, 0, 1, 2, 1, $12C)
    %spritemapEntry(1, $08, $F0, 0, 0, 2, 1, $12C)

UNUSED_EnemyProjSpritemaps_12_8D92FA:
    dw $0002
    %spritemapEntry(1, $1E8, $F0, 0, 1, 2, 1, $12A)
    %spritemapEntry(1, $09, $F0, 0, 0, 2, 1, $12A)

EnemyProjSpritemaps_PuromiBody_0:
    dw $0001
    %spritemapEntry(1, $1F9, $F8, 0, 0, 2, 1, $10A)

EnemyProjSpritemaps_PuromiBody_1:
    dw $0001
    %spritemapEntry(1, $1F9, $F8, 0, 0, 2, 1, $108)

EnemyProjSpritemaps_PuromiBody_2:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 1, 1, 2, 1, $10A)

EnemyProjSpritemaps_PuromiBody_3:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 1, 1, 2, 1, $108)

EnemyProjSpritemaps_PuromiBody_4:
    dw $0001
    %spritemapEntry(1, $1F9, $F8, 0, 0, 2, 1, $106)

EnemyProjSpritemaps_PuromiBody_5:
    dw $0001
    %spritemapEntry(1, $1F9, $F8, 0, 0, 2, 1, $122)

EnemyProjSpritemaps_PuromiBody_6:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 1, 1, 2, 1, $106)

EnemyProjSpritemaps_PuromiBody_7:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 1, 1, 2, 1, $122)

UNUSED_EnemyProjSpritemaps_8D933E:
    dw $0000

EnemyProjSpritemaps_LavaquakeRocks:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $10A)

EnemyProjSpritemaps_ShaktoolsAttack:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $53)

EnemyProjSpritemaps_ShaktoolsAttack_FrontMiddleCircle:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $51)

EnemyProjSpritemaps_ShaktoolsAttack_FrontCircle:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 2, 0, $60)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $60)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 0, $60)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $60)

EnemyProjSpritemaps_MotherBrainsTurrets_Left:
    dw $0001
    %spritemapEntry(0, $1EF, $F3, 0, 0, 2, 2, $19A)

EnemyProjSpritemaps_MotherBrainsTurrets_DownLeft:
    dw $0001
    %spritemapEntry(0, $1F2, $FD, 0, 0, 2, 2, $18B)

EnemyProjSpritemaps_MotherBrainsTurrets_Down:
    dw $0001
    %spritemapEntry(0, $1FC, $FF, 0, 0, 2, 2, $19B)

EnemyProjSpritemaps_MotherBrainsTurrets_DownRight:
    dw $0001
    %spritemapEntry(0, $06, $FD, 0, 1, 2, 2, $18B)

EnemyProjSpritemaps_MotherBrainsTurrets_Right:
    dw $0001
    %spritemapEntry(0, $09, $F3, 0, 1, 2, 2, $19A)

EnemyProjSpritemaps_MotherBrainsTurrets_UpRight:
    dw $0001
    %spritemapEntry(0, $06, $EB, 1, 1, 2, 2, $18B)

EnemyProjSpritemaps_MotherBrainsTurrets_Up:
    dw $0001
    %spritemapEntry(0, $1FC, $E7, 1, 0, 2, 2, $19B)

EnemyProjSpritemaps_MotherBrainsTurrets_UpLeft:
    dw $0001
    %spritemapEntry(0, $1F2, $EB, 1, 0, 2, 2, $18B)

EnemyProjSpritemaps_MotherBrainsTurretBullets_Left:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 2, $1A8)

EnemyProjSpritemaps_MotherBrainsTurretBullets_DownLeft:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 2, $1A6)

EnemyProjSpritemaps_MotherBrainsTurretBullets_Down:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 2, $1A7)

EnemyProjSpritemaps_MotherBrainsTurretBullets_DownRight:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 2, $1A6)

EnemyProjSpritemaps_MotherBrainsTurretBullets_Right:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 2, $1A8)

EnemyProjSpritemaps_MotherBrainsTurretBullets_UpRight:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 1, 2, 2, $1A6)

EnemyProjSpritemaps_MotherBrainsTurretBullets_Up:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 0, 2, 2, $1A7)

EnemyProjSpritemaps_MotherBrainsTurretBullets_UpLeft:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 0, 2, 2, $1A6)

EnemyProjSpritemaps_MotherBrainsRainbowBeamCharging_0:
    dw $000B
    %spritemapEntry(0, $1FC, $E5, 0, 0, 3, 5, $ED)
    %spritemapEntry(0, $0E, $EF, 0, 0, 3, 5, $FC)
    %spritemapEntry(0, $1EA, $EF, 0, 1, 3, 5, $FC)
    %spritemapEntry(0, $25, $F8, 0, 0, 3, 5, $EC)
    %spritemapEntry(0, $1A, $D6, 0, 0, 3, 5, $EC)
    %spritemapEntry(0, $1DF, $D6, 0, 0, 3, 5, $EC)
    %spritemapEntry(0, $1D3, $F8, 0, 0, 3, 5, $EC)
    %spritemapEntry(0, $1ED, $F8, 0, 0, 3, 5, $EB)
    %spritemapEntry(0, $0C, $F8, 0, 0, 3, 5, $EB)
    %spritemapEntry(0, $04, $ED, 0, 0, 3, 5, $EB)
    %spritemapEntry(0, $1F5, $ED, 0, 0, 3, 5, $EB)

EnemyProjSpritemaps_MotherBrainsRainbowBeamCharging_1:
    dw $0007
    %spritemapEntry(0, $1FC, $E1, 0, 0, 3, 5, $EE)
    %spritemapEntry(0, $11, $ED, 0, 0, 3, 5, $FD)
    %spritemapEntry(0, $1E7, $ED, 0, 1, 3, 5, $FD)
    %spritemapEntry(0, $1F0, $E8, 0, 1, 3, 5, $FC)
    %spritemapEntry(0, $1E8, $F8, 0, 1, 3, 5, $DD)
    %spritemapEntry(0, $10, $F8, 0, 0, 3, 5, $DD)
    %spritemapEntry(0, $08, $E8, 0, 0, 3, 5, $FC)

EnemyProjSpritemaps_MotherBrainsRainbowBeamCharging_2:
    dw $0007
    %spritemapEntry(0, $1FC, $DE, 0, 0, 3, 5, $EF)
    %spritemapEntry(0, $18, $E8, 0, 0, 3, 5, $FE)
    %spritemapEntry(0, $1E0, $E8, 0, 1, 3, 5, $FE)
    %spritemapEntry(0, $1E5, $F8, 0, 1, 3, 5, $DE)
    %spritemapEntry(0, $14, $F8, 0, 0, 3, 5, $DE)
    %spritemapEntry(0, $0A, $E6, 0, 0, 3, 5, $FD)
    %spritemapEntry(0, $1EE, $E6, 0, 1, 3, 5, $FD)

EnemyProjSpritemaps_MotherBrainsRainbowBeamCharging_3:
    dw $0007
    %spritemapEntry(0, $1FC, $DA, 0, 0, 3, 5, $FF)
    %spritemapEntry(0, $1D, $E6, 0, 0, 3, 5, $FF)
    %spritemapEntry(0, $1DC, $E6, 0, 1, 3, 5, $FF)
    %spritemapEntry(0, $1DE, $F8, 0, 1, 3, 5, $DF)
    %spritemapEntry(0, $1B, $F8, 0, 0, 3, 5, $DF)
    %spritemapEntry(0, $10, $E0, 0, 0, 3, 5, $FE)
    %spritemapEntry(0, $1E8, $E0, 0, 1, 3, 5, $FE)

EnemyProjSpritemaps_MotherBrainsRainbowBeamCharging_4:
    dw $000A
    %spritemapEntry(0, $0A, $F3, 0, 0, 3, 5, $EA)
    %spritemapEntry(0, $1FC, $EC, 0, 0, 3, 5, $EA)
    %spritemapEntry(0, $1FC, $D4, 0, 0, 3, 5, $EC)
    %spritemapEntry(0, $20, $E4, 0, 0, 3, 5, $EC)
    %spritemapEntry(0, $1F0, $F3, 0, 0, 3, 5, $EA)
    %spritemapEntry(0, $1DA, $E4, 0, 0, 3, 5, $EC)
    %spritemapEntry(0, $1D8, $F8, 0, 1, 3, 5, $FF)
    %spritemapEntry(0, $20, $F8, 0, 0, 3, 5, $FF)
    %spritemapEntry(0, $14, $DC, 0, 0, 3, 5, $FF)
    %spritemapEntry(0, $1E4, $DC, 0, 1, 3, 5, $FF)

EnemyProjSpritemaps_MotherBrainsRainbowBeamCharging_5:
    dw $000E
    %spritemapEntry(0, $1FC, $EA, 0, 0, 3, 5, $EB)
    %spritemapEntry(0, $22, $E3, 0, 0, 3, 5, $EC)
    %spritemapEntry(0, $0A, $F3, 0, 0, 3, 5, $EB)
    %spritemapEntry(0, $1EF, $F3, 0, 0, 3, 5, $EB)
    %spritemapEntry(0, $1D8, $E3, 0, 0, 3, 5, $EC)
    %spritemapEntry(0, $1E1, $D8, 0, 0, 3, 5, $EC)
    %spritemapEntry(0, $1EC, $F8, 0, 0, 3, 5, $EA)
    %spritemapEntry(0, $1F4, $EC, 0, 0, 3, 5, $EA)
    %spritemapEntry(0, $05, $EC, 0, 0, 3, 5, $EA)
    %spritemapEntry(0, $0C, $F8, 0, 0, 3, 5, $EA)
    %spritemapEntry(0, $23, $F8, 0, 0, 3, 5, $EC)
    %spritemapEntry(0, $18, $D8, 0, 0, 3, 5, $EC)
    %spritemapEntry(0, $1FC, $D1, 0, 0, 3, 5, $EC)
    %spritemapEntry(0, $1D5, $F8, 0, 0, 3, 5, $EC)

EnemyProjSpritemaps_MotherBrainsDrool_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FA, 0, 0, 3, 5, $F0)

EnemyProjSpritemaps_MotherBrainsDrool_1:
    dw $0001
    %spritemapEntry(0, $1FC, $FB, 0, 0, 3, 5, $F1)

EnemyProjSpritemaps_MotherBrainsDrool_2:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $F2)

EnemyProjSpritemaps_MotherBrainsDrool_3:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $F3)

EnemyProjSpritemaps_MotherBrainsDrool_4:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $F4)

EnemyProjSpritemaps_MotherBrainsDrool_5:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $F5)

EnemyProjSpritemaps_MotherBrainsDrool_6:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $F6)

EnemyProjSpritemaps_MotherBrainsDrool_7:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $DA)

EnemyProjSpritemaps_MotherBrainsDrool_8:
    dw $0002
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 5, $DC)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $DB)

EnemyProjSpritemaps_MotherBrainsDrool_9:
    dw $0002
    %spritemapEntry(0, $1FC, $04, 0, 0, 3, 5, $DC)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $DB)

EnemyProjSpritemaps_MotherBrainsPurpleBreath_Big_0:
    dw $0002
    %spritemapEntry(0, $1EE, $F2, 0, 0, 3, 5, $F7)
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 5, $D0)

EnemyProjSpritemaps_MotherBrainsPurpleBreath_Big_1:
    dw $0004
    %spritemapEntry(0, $1EC, $EE, 0, 0, 3, 5, $F7)
    %spritemapEntry(0, $1EE, $F1, 0, 0, 3, 5, $F8)
    %spritemapEntry(1, $4200, $00, 0, 1, 3, 5, $D0)
    %spritemapEntry(1, $43F8, $F7, 0, 0, 3, 5, $D2)

EnemyProjSpritemaps_MotherBrainsPurpleBreath_Big_2:
    dw $0007
    %spritemapEntry(0, $1E8, $E8, 0, 0, 3, 5, $F9)
    %spritemapEntry(0, $1EE, $EA, 0, 0, 3, 5, $F7)
    %spritemapEntry(0, $1EC, $ED, 0, 0, 3, 5, $F8)
    %spritemapEntry(0, $1EE, $F0, 0, 0, 3, 5, $F9)
    %spritemapEntry(1, $4208, $08, 1, 1, 3, 5, $D0)
    %spritemapEntry(1, $4200, $01, 0, 0, 3, 5, $D2)
    %spritemapEntry(1, $43F8, $F6, 0, 0, 3, 5, $D4)

EnemyProjSpritemaps_MotherBrainsPurpleBreath_Big_3:
    dw $0008
    %spritemapEntry(0, $1E8, $E6, 0, 0, 3, 5, $F7)
    %spritemapEntry(0, $1EE, $E9, 0, 0, 3, 5, $F8)
    %spritemapEntry(0, $1EC, $EC, 0, 0, 3, 5, $F9)
    %spritemapEntry(0, $1EE, $EF, 0, 0, 3, 5, $FA)
    %spritemapEntry(1, $4210, $0E, 0, 1, 3, 5, $D0)
    %spritemapEntry(1, $4208, $07, 0, 0, 3, 5, $D2)
    %spritemapEntry(1, $4200, $00, 0, 0, 3, 5, $D4)
    %spritemapEntry(1, $43F8, $F4, 0, 0, 3, 5, $D6)

EnemyProjSpritemaps_MotherBrainsPurpleBreath_Big_4:
    dw $0007
    %spritemapEntry(0, $1E8, $E5, 0, 0, 3, 5, $F8)
    %spritemapEntry(0, $1EE, $E8, 0, 0, 3, 5, $F9)
    %spritemapEntry(0, $1EC, $EB, 0, 0, 3, 5, $FA)
    %spritemapEntry(1, $4213, $0D, 0, 0, 3, 5, $D2)
    %spritemapEntry(1, $4208, $06, 0, 0, 3, 5, $D4)
    %spritemapEntry(1, $4200, $FE, 0, 0, 3, 5, $D6)
    %spritemapEntry(1, $43F8, $F1, 0, 0, 3, 5, $D8)

EnemyProjSpritemaps_MotherBrainsPurpleBreath_Big_5:
    dw $0006
    %spritemapEntry(0, $1E8, $E4, 0, 0, 3, 5, $F9)
    %spritemapEntry(0, $1EF, $E7, 0, 0, 3, 5, $FA)
    %spritemapEntry(0, $1EC, $EA, 0, 0, 3, 5, $FB)
    %spritemapEntry(1, $4212, $0C, 0, 0, 3, 5, $D4)
    %spritemapEntry(1, $4208, $02, 0, 0, 3, 5, $D6)
    %spritemapEntry(1, $4200, $FB, 0, 0, 3, 5, $D8)

EnemyProjSpritemaps_MotherBrainsPurpleBreath_Big_6:
    dw $0004
    %spritemapEntry(0, $1E8, $E3, 0, 0, 3, 5, $FA)
    %spritemapEntry(0, $1F0, $E6, 0, 0, 3, 5, $FB)
    %spritemapEntry(1, $4212, $0A, 0, 0, 3, 5, $D6)
    %spritemapEntry(1, $4208, $FF, 0, 0, 3, 5, $D8)

EnemyProjSpritemaps_MotherBrainsPurpleBreath_Big_7:
    dw $0002
    %spritemapEntry(0, $1E8, $E3, 0, 0, 3, 5, $FB)
    %spritemapEntry(1, $4212, $07, 0, 0, 3, 5, $D8)

EnemyProjSpritemaps_MotherBrainsPurpleBreath_Small_0:
    dw $0001
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 5, $F7)

EnemyProjSpritemaps_MotherBrainsPurpleBreath_Small_1:
    dw $0002
    %spritemapEntry(0, $1FA, $F4, 0, 0, 3, 5, $F7)
    %spritemapEntry(0, $1FC, $F7, 0, 0, 3, 5, $F8)

EnemyProjSpritemaps_MotherBrainsPurpleBreath_Small_2:
    dw $0004
    %spritemapEntry(0, $1F6, $EE, 0, 0, 3, 5, $F9)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 3, 5, $F7)
    %spritemapEntry(0, $1FA, $F3, 0, 0, 3, 5, $F8)
    %spritemapEntry(0, $1FC, $F6, 0, 0, 3, 5, $F9)

EnemyProjSpritemaps_MotherBrainsPurpleBreath_Small_3:
    dw $0004
    %spritemapEntry(0, $1F6, $EC, 0, 0, 3, 5, $F7)
    %spritemapEntry(0, $1FC, $EF, 0, 0, 3, 5, $F8)
    %spritemapEntry(0, $1FA, $F2, 0, 0, 3, 5, $F9)
    %spritemapEntry(0, $1FC, $F5, 0, 0, 3, 5, $FA)

EnemyProjSpritemaps_MotherBrainsPurpleBreath_Small_4:
    dw $0003
    %spritemapEntry(0, $1F6, $EB, 0, 0, 3, 5, $F8)
    %spritemapEntry(0, $1FC, $EE, 0, 0, 3, 5, $F9)
    %spritemapEntry(0, $1FA, $F1, 0, 0, 3, 5, $FA)

EnemyProjSpritemaps_MotherBrainsPurpleBreath_Small_5:
    dw $0003
    %spritemapEntry(0, $1F6, $EA, 0, 0, 3, 5, $F9)
    %spritemapEntry(0, $1FD, $ED, 0, 0, 3, 5, $FA)
    %spritemapEntry(0, $1FA, $F0, 0, 0, 3, 5, $FB)

EnemyProjSpritemaps_MotherBrainsPurpleBreath_Small_6:
    dw $0002
    %spritemapEntry(0, $1F6, $E9, 0, 0, 3, 5, $FA)
    %spritemapEntry(0, $1FE, $EC, 0, 0, 3, 5, $FB)

EnemyProjSpritemaps_MotherBrainsPurpleBreath_Small_7:
    dw $0001
    %spritemapEntry(0, $1F6, $E9, 0, 0, 3, 5, $FB)

EnemyProjSpritemaps_MotherBrainExplodedEscapeDoorParticles_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 1, $102)

EnemyProjSpritemaps_MotherBrainExplodedEscapeDoorParticles_1:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 1, $103)

EnemyProjSpritemaps_MotherBrainExplodedEscapeDoorParticles_2:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 1, $112)

EnemyProjSpritemaps_MotherBrainExplodedEscapeDoorParticles_3:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 1, $105)

EnemyProjSpritemaps_MotherBrainExplodedEscapeDoorParticles_4:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 1, $107)

EnemyProjSpritemaps_MotherBrainExplodedEscapeDoorParticles_5:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 1, $108)

EnemyProjSpritemaps_MotherBrainExplodedEscapeDoorParticles_6:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 1, $117)

EnemyProjSpritemaps_MotherBrainExplodedEscapeDoorParticles_7:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 1, $10A)

UNUSED_EnemyProjSpritemaps_0_8D96D3:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 1, $10C)

UNUSED_EnemyProjSpritemaps_1_8D96DA:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 1, $10D)

UNUSED_EnemyProjSpritemaps_2_8D96E1:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 1, $10E)

UNUSED_EnemyProjSpritemaps_3_8D96E8:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 1, $10F)

UNUSED_EnemyProjSpritemaps_4_8D96EF:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 1, $11C)

UNUSED_EnemyProjSpritemaps_5_8D96F6:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 1, $11D)

UNUSED_EnemyProjSpritemaps_6_8D96FD:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 1, $11E)

UNUSED_EnemyProjSpritemaps_7_8D9704:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 1, $11F)

EnemyProjSpritemaps_TimeBombSetJapanSet:
    dw $000C
    %spritemapEntry(0, $08, $08, 0, 0, 3, 2, $1C9)
    %spritemapEntry(0, $08, $00, 0, 0, 3, 2, $1C8)
    %spritemapEntry(0, $00, $08, 0, 0, 3, 2, $1C7)
    %spritemapEntry(0, $1F8, $08, 0, 0, 3, 2, $1C6)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 2, $1C5)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 2, $1C4)
    %spritemapEntry(1, $43E8, $00, 0, 0, 3, 2, $1AD)
    %spritemapEntry(0, $18, $F8, 0, 0, 3, 2, $1C9)
    %spritemapEntry(0, $18, $F0, 0, 0, 3, 2, $1C8)
    %spritemapEntry(1, $4208, $F0, 0, 0, 3, 2, $1A6)
    %spritemapEntry(1, $43F8, $F0, 0, 0, 3, 2, $1A2)
    %spritemapEntry(1, $43E8, $F0, 0, 0, 3, 2, $1A0)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FD, 0, 0, 3, 0, $121)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_1:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $122)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_2:
    dw $0001
    %spritemapEntry(0, $1FC, $FB, 0, 0, 3, 0, $123)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_3:
    dw $0001
    %spritemapEntry(0, $1FC, $FD, 0, 0, 3, 0, $124)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_4:
    dw $0001
    %spritemapEntry(0, $1FC, $FE, 1, 0, 3, 0, $121)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_5:
    dw $0001
    %spritemapEntry(0, $1FC, $FD, 0, 0, 3, 0, $125)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_6:
    dw $0001
    %spritemapEntry(0, $1FC, $FB, 0, 0, 3, 0, $126)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_7:
    dw $0001
    %spritemapEntry(0, $1FC, $FD, 0, 0, 3, 0, $127)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_8:
    dw $0001
    %spritemapEntry(0, $1FB, $FC, 0, 0, 3, 0, $131)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_9:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $132)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_A:
    dw $0001
    %spritemapEntry(0, $1FE, $FC, 0, 0, 3, 0, $133)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_B:
    dw $0001
    %spritemapEntry(0, $1FB, $FC, 0, 0, 3, 0, $134)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_C:
    dw $0001
    %spritemapEntry(0, $1FA, $FC, 0, 1, 3, 0, $131)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_D:
    dw $0001
    %spritemapEntry(0, $1FB, $FC, 0, 0, 3, 0, $135)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_E:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $136)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_F:
    dw $0001
    %spritemapEntry(0, $1FB, $FC, 0, 0, 3, 0, $137)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_10:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $138)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_11:
    dw $0001
    %spritemapEntry(0, $1FC, $FB, 0, 0, 3, 0, $139)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_12:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $13A)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_13:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $13B)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_14:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 1, 3, 0, $138)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_15:
    dw $0001
    %spritemapEntry(0, $1FB, $FD, 0, 0, 3, 0, $13C)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_16:
    dw $0001
    %spritemapEntry(0, $1FD, $FB, 0, 0, 3, 0, $13D)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_17:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $13E)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_18:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 0, 3, 0, $138)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_19:
    dw $0001
    %spritemapEntry(0, $1FC, $FB, 1, 0, 3, 0, $139)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_1A:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 0, 3, 0, $13A)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_1B:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 0, 3, 0, $13B)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_1C:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 3, 0, $138)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_1D:
    dw $0001
    %spritemapEntry(0, $1FB, $FD, 1, 0, 3, 0, $13C)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_1E:
    dw $0001
    %spritemapEntry(0, $1FD, $FB, 1, 0, 3, 0, $13D)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_1F:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 0, 3, 0, $13E)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_20:
    dw $0001
    %spritemapEntry(0, $1FC, $FB, 1, 0, 3, 0, $121)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_21:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 0, 3, 0, $122)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_22:
    dw $0001
    %spritemapEntry(0, $1FC, $FB, 1, 0, 3, 0, $123)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_23:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 0, 3, 0, $124)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_24:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $121)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_25:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 0, 3, 0, $125)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_26:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 0, 3, 0, $126)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_27:
    dw $0001
    %spritemapEntry(0, $1FC, $FB, 1, 0, 3, 0, $127)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_28:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 3, 0, $131)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_29:
    dw $0001
    %spritemapEntry(0, $1FD, $FC, 0, 1, 3, 0, $132)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_2A:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 3, 0, $133)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_2B:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 3, 0, $134)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_2C:
    dw $0001
    %spritemapEntry(0, $1FB, $FC, 0, 0, 3, 0, $131)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_2D:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 3, 0, $135)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_2E:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 3, 0, $136)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_2F:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 3, 0, $137)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_30:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 1, 3, 0, $138)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_31:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 1, 3, 0, $139)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_32:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 1, 3, 0, $13A)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_33:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 1, 3, 0, $13B)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_34:
    dw $0001
    %spritemapEntry(0, $1FC, $FD, 0, 0, 3, 0, $138)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_35:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 1, 3, 0, $13C)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_36:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 1, 3, 0, $13D)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_37:
    dw $0001
    %spritemapEntry(0, $1FB, $FD, 1, 1, 3, 0, $13E)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_38:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 3, 0, $138)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_39:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 3, 0, $139)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_3A:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 3, 0, $13A)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_3B:
    dw $0001
    %spritemapEntry(0, $1FD, $FD, 0, 1, 3, 0, $13B)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_3C:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 0, 3, 0, $138)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_3D:
    dw $0001
    %spritemapEntry(0, $1FC, $FD, 0, 1, 3, 0, $13C)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_3E:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 0, 3, 0, $13D)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Shard_3F:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 0, 3, 0, $13E)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Sparkle_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 2, $128)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Sparkle_1:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 2, $129)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Sparkle_2:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 2, $12A)

EnemyProjSpritemaps_MotherBrainsGlassShattering_Sparkle_3:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 2, $12B)

EnemyProjSpritemaps_KihunterAcidSpit_Left_0:
    dw $0001
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 0, $165)

EnemyProjSpritemaps_KihunterAcidSpit_Left_1:
    dw $0002
    %spritemapEntry(0, $1F0, $FC, 0, 0, 3, 0, $174)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 0, $175)

EnemyProjSpritemaps_KihunterAcidSpit_Left_2:
    dw $0001
    %spritemapEntry(1, $43F0, $F8, 0, 0, 3, 0, $166)

EnemyProjSpritemaps_KihunterAcidSpit_Left_3:
    dw $0002
    %spritemapEntry(1, $43E8, $F8, 0, 0, 3, 0, $14B)
    %spritemapEntry(1, $43F0, $F8, 0, 0, 3, 0, $14C)

EnemyProjSpritemaps_KihunterAcidSpit_Left_4:
    dw $0002
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 0, $164)
    %spritemapEntry(1, $43E8, $F8, 0, 0, 3, 0, $12A)

EnemyProjSpritemaps_KihunterAcidSpit_Left_5:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $12A)

EnemyProjSpritemaps_KihunterAcidSpit_0:
    dw $0001
    %spritemapEntry(1, $43F9, $F8, 0, 0, 3, 0, $16C)

EnemyProjSpritemaps_KihunterAcidSpit_1:
    dw $0003
    %spritemapEntry(0, $04, $00, 0, 0, 3, 0, $17B)
    %spritemapEntry(0, $1F4, $00, 0, 0, 3, 0, $179)
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 0, $17A)

EnemyProjSpritemaps_KihunterAcidSpit_2:
    dw $0004
    %spritemapEntry(0, $1F2, $00, 0, 0, 3, 0, $16A)
    %spritemapEntry(0, $06, $00, 0, 0, 3, 0, $16B)
    %spritemapEntry(0, $1FE, $00, 0, 0, 3, 0, $16A)
    %spritemapEntry(0, $1FA, $00, 0, 0, 3, 0, $16B)

EnemyProjSpritemaps_KihunterAcidSpit_3:
    dw $0004
    %spritemapEntry(0, $1FE, $00, 0, 0, 3, 0, $168)
    %spritemapEntry(0, $06, $00, 0, 0, 3, 0, $169)
    %spritemapEntry(0, $1FA, $00, 0, 0, 3, 0, $169)
    %spritemapEntry(0, $1F2, $00, 0, 0, 3, 0, $168)

EnemyProjSpritemaps_KihunterAcidSpit_4:
    dw $0002
    %spritemapEntry(0, $02, $00, 0, 0, 3, 0, $178)
    %spritemapEntry(0, $1F6, $00, 0, 0, 3, 0, $178)

EnemyProjSpritemaps_KihunterAcidSpit_Right_0:
    dw $0001
    %spritemapEntry(0, $00, $FC, 0, 1, 3, 0, $165)

EnemyProjSpritemaps_KihunterAcidSpit_Right_1:
    dw $0002
    %spritemapEntry(0, $08, $FC, 0, 1, 3, 0, $174)
    %spritemapEntry(0, $00, $FC, 0, 1, 3, 0, $175)

EnemyProjSpritemaps_KihunterAcidSpit_Right_2:
    dw $0001
    %spritemapEntry(1, $4200, $F8, 0, 1, 3, 0, $166)

EnemyProjSpritemaps_KihunterAcidSpit_Right_3:
    dw $0002
    %spritemapEntry(1, $4208, $F8, 0, 1, 3, 0, $14B)
    %spritemapEntry(1, $4200, $F8, 0, 1, 3, 0, $14C)

EnemyProjSpritemaps_KihunterAcidSpit_Right_4:
    dw $0002
    %spritemapEntry(0, $00, $FC, 0, 1, 3, 0, $164)
    %spritemapEntry(1, $4208, $F8, 0, 1, 3, 0, $12A)

EnemyProjSpritemaps_KihunterAcidSpit_Right_5:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 1, 3, 0, $12A)

EnemyProjSpritemaps_PowampSpikes_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $10F)

EnemyProjSpritemaps_PowampSpikes_1:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $11B)

EnemyProjSpritemaps_PowampSpikes_2:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $11C)

EnemyProjSpritemaps_WorkRobotLaser_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 5, $53)

EnemyProjSpritemaps_WorkRobotLaser_1:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 5, $51)

EnemyProjSpritemaps_WorkRobotLaser_2:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 2, 5, $60)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 5, $60)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 5, $60)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 5, $60)

EnemyProjSpritemaps_WorkRobotLaser_3:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 2, 5, $61)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 5, $61)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 5, $61)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 5, $61)

EnemyProjSpritemaps_WorkRobotLaser_4:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 2, 5, $62)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 5, $62)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 5, $62)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 5, $62)

EnemyProjSpritemaps_WorkRobotLaser_5:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 2, 5, $63)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 5, $63)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 5, $63)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 5, $63)

EnemyProjSpritemaps_NoobTubeCrack_0:
    dw $0008
    %spritemapEntry(0, $00, $00, 0, 1, 3, 1, $14D)
    %spritemapEntry(0, $08, $00, 0, 1, 3, 1, $14C)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 1, $159)
    %spritemapEntry(0, $00, $F0, 0, 1, 3, 1, $149)
    %spritemapEntry(0, $1F9, $08, 0, 0, 3, 1, $15D)
    %spritemapEntry(0, $1F9, $00, 0, 0, 3, 1, $14D)
    %spritemapEntry(0, $1F9, $F8, 0, 0, 3, 1, $159)
    %spritemapEntry(0, $1F1, $F8, 0, 0, 3, 1, $158)

EnemyProjSpritemaps_NoobTubeCrack_1:
    dw $000E
    %spritemapEntry(0, $1F9, $18, 0, 0, 3, 1, $171)
    %spritemapEntry(0, $1F1, $10, 0, 0, 3, 1, $160)
    %spritemapEntry(0, $1F9, $10, 0, 0, 3, 1, $161)
    %spritemapEntry(0, $10, $08, 0, 1, 3, 1, $15B)
    %spritemapEntry(0, $18, $08, 0, 1, 3, 1, $15A)
    %spritemapEntry(0, $10, $00, 0, 1, 3, 1, $14B)
    %spritemapEntry(0, $08, $E0, 0, 1, 3, 1, $128)
    %spritemapEntry(0, $00, $E8, 0, 1, 3, 1, $139)
    %spritemapEntry(0, $08, $E8, 0, 1, 3, 1, $138)
    %spritemapEntry(1, $43E1, $F0, 0, 0, 3, 1, $146)
    %spritemapEntry(1, $4200, $00, 0, 1, 3, 1, $14C)
    %spritemapEntry(1, $4200, $F0, 0, 1, 3, 1, $148)
    %spritemapEntry(1, $43F1, $00, 0, 0, 3, 1, $14C)
    %spritemapEntry(1, $43F1, $F0, 0, 0, 3, 1, $148)

EnemyProjSpritemaps_NoobTubeCrack_2:
    dw $001E
    %spritemapEntry(0, $08, $10, 0, 1, 3, 1, $160)
    %spritemapEntry(0, $00, $10, 0, 1, 3, 1, $161)
    %spritemapEntry(0, $20, $F8, 0, 1, 3, 1, $155)
    %spritemapEntry(0, $20, $00, 0, 1, 3, 1, $10F)
    %spritemapEntry(0, $1E1, $08, 0, 0, 3, 1, $15A)
    %spritemapEntry(0, $1E1, $E8, 0, 0, 3, 1, $136)
    %spritemapEntry(0, $1E9, $E8, 0, 0, 3, 1, $137)
    %spritemapEntry(0, $1F9, $E0, 0, 0, 3, 1, $129)
    %spritemapEntry(0, $1F1, $E8, 0, 0, 3, 1, $138)
    %spritemapEntry(0, $1F9, $E8, 0, 0, 3, 1, $139)
    %spritemapEntry(0, $28, $18, 0, 1, 3, 1, $13E)
    %spritemapEntry(0, $20, $10, 0, 1, 3, 1, $12F)
    %spritemapEntry(0, $10, $10, 0, 1, 3, 1, $14F)
    %spritemapEntry(0, $18, $10, 0, 1, 3, 1, $14E)
    %spritemapEntry(0, $1E1, $10, 0, 0, 3, 1, $14E)
    %spritemapEntry(0, $1E9, $10, 0, 0, 3, 1, $14F)
    %spritemapEntry(0, $1E9, $08, 0, 0, 3, 1, $15B)
    %spritemapEntry(0, $1E9, $00, 0, 0, 3, 1, $14B)
    %spritemapEntry(0, $10, $D8, 0, 1, 3, 1, $117)
    %spritemapEntry(1, $4210, $F0, 0, 1, 3, 1, $146)
    %spritemapEntry(1, $4200, $D0, 0, 1, 3, 1, $108)
    %spritemapEntry(1, $43D1, $E8, 0, 0, 3, 1, $134)
    %spritemapEntry(1, $43F1, $10, 0, 0, 3, 1, $160)
    %spritemapEntry(1, $43E1, $F0, 0, 0, 3, 1, $146)
    %spritemapEntry(1, $4210, $00, 0, 1, 3, 1, $14A)
    %spritemapEntry(1, $4200, $E0, 0, 1, 3, 1, $128)
    %spritemapEntry(1, $4200, $00, 0, 1, 3, 1, $14C)
    %spritemapEntry(1, $4200, $F0, 0, 1, 3, 1, $148)
    %spritemapEntry(1, $43F1, $00, 0, 0, 3, 1, $14C)
    %spritemapEntry(1, $43F1, $F0, 0, 0, 3, 1, $148)

EnemyProjSpritemaps_NoobTubeCrack_3:
    dw $0027
    %spritemapEntry(0, $1E1, $D8, 0, 0, 3, 1, $116)
    %spritemapEntry(0, $1D1, $F8, 0, 0, 3, 1, $154)
    %spritemapEntry(0, $1D9, $F8, 0, 0, 3, 1, $155)
    %spritemapEntry(0, $1D9, $18, 0, 0, 3, 1, $13F)
    %spritemapEntry(1, $4230, $00, 0, 1, 3, 1, $10C)
    %spritemapEntry(1, $4230, $10, 0, 1, 3, 1, $12C)
    %spritemapEntry(1, $4220, $F0, 0, 1, 3, 1, $144)
    %spritemapEntry(1, $4220, $00, 0, 1, 3, 1, $10E)
    %spritemapEntry(0, $1D1, $18, 0, 0, 3, 1, $13E)
    %spritemapEntry(0, $1D9, $10, 0, 0, 3, 1, $12F)
    %spritemapEntry(0, $20, $E8, 0, 1, 3, 1, $135)
    %spritemapEntry(0, $1D9, $00, 0, 0, 3, 1, $10F)
    %spritemapEntry(0, $20, $D8, 0, 1, 3, 1, $115)
    %spritemapEntry(0, $1D9, $E0, 0, 0, 3, 1, $125)
    %spritemapEntry(0, $1E9, $D8, 0, 0, 3, 1, $117)
    %spritemapEntry(0, $1C9, $F0, 0, 0, 3, 1, $143)
    %spritemapEntry(0, $1C1, $E8, 0, 0, 3, 1, $132)
    %spritemapEntry(0, $1C9, $E8, 0, 0, 3, 1, $133)
    %spritemapEntry(1, $43D1, $E8, 0, 0, 3, 1, $134)
    %spritemapEntry(1, $43F1, $D0, 0, 0, 3, 1, $108)
    %spritemapEntry(1, $4210, $D0, 0, 1, 3, 1, $106)
    %spritemapEntry(1, $4210, $E0, 0, 1, 3, 1, $126)
    %spritemapEntry(1, $43E1, $10, 0, 0, 3, 1, $14E)
    %spritemapEntry(1, $4210, $F0, 0, 1, 3, 1, $146)
    %spritemapEntry(1, $43F1, $E0, 0, 0, 3, 1, $128)
    %spritemapEntry(1, $43E1, $E0, 0, 0, 3, 1, $126)
    %spritemapEntry(1, $4220, $10, 0, 1, 3, 1, $12E)
    %spritemapEntry(1, $43E1, $00, 0, 0, 3, 1, $14A)
    %spritemapEntry(1, $4210, $10, 0, 1, 3, 1, $14E)
    %spritemapEntry(1, $4200, $D0, 0, 1, 3, 1, $108)
    %spritemapEntry(1, $4200, $10, 0, 1, 3, 1, $160)
    %spritemapEntry(1, $43F1, $10, 0, 0, 3, 1, $160)
    %spritemapEntry(1, $43E1, $F0, 0, 0, 3, 1, $146)
    %spritemapEntry(1, $4210, $00, 0, 1, 3, 1, $14A)
    %spritemapEntry(1, $4200, $E0, 0, 1, 3, 1, $128)
    %spritemapEntry(1, $4200, $00, 0, 1, 3, 1, $14C)
    %spritemapEntry(1, $4200, $F0, 0, 1, 3, 1, $148)
    %spritemapEntry(1, $43F1, $00, 0, 0, 3, 1, $14C)
    %spritemapEntry(1, $43F1, $F0, 0, 0, 3, 1, $148)

EnemyProjSpritemaps_NoobTubeCrack_4:
    dw $0032
    %spritemapEntry(1, $43B1, $F0, 0, 0, 3, 1, $140)
    %spritemapEntry(0, $1C1, $E0, 0, 0, 3, 1, $122)
    %spritemapEntry(0, $1C9, $E0, 0, 0, 3, 1, $123)
    %spritemapEntry(0, $30, $D8, 0, 1, 3, 1, $113)
    %spritemapEntry(0, $1C1, $10, 0, 0, 3, 1, $12C)
    %spritemapEntry(0, $1B9, $08, 0, 0, 3, 1, $11B)
    %spritemapEntry(0, $1D9, $E0, 0, 0, 3, 1, $125)
    %spritemapEntry(1, $43D1, $E8, 0, 0, 3, 1, $134)
    %spritemapEntry(1, $43C1, $E8, 0, 0, 3, 1, $132)
    %spritemapEntry(0, $40, $F0, 0, 1, 3, 1, $141)
    %spritemapEntry(0, $30, $E8, 0, 1, 3, 1, $133)
    %spritemapEntry(0, $38, $E8, 0, 1, 3, 1, $132)
    %spritemapEntry(1, $4230, $F0, 0, 1, 3, 1, $142)
    %spritemapEntry(1, $4240, $08, 0, 1, 3, 1, $11A)
    %spritemapEntry(1, $4240, $10, 0, 1, 3, 1, $12A)
    %spritemapEntry(1, $4230, $00, 0, 1, 3, 1, $10C)
    %spritemapEntry(1, $43C1, $00, 0, 0, 3, 1, $10C)
    %spritemapEntry(1, $43C9, $10, 0, 0, 3, 1, $12D)
    %spritemapEntry(1, $43D1, $00, 0, 0, 3, 1, $10E)
    %spritemapEntry(1, $43C1, $F0, 0, 0, 3, 1, $142)
    %spritemapEntry(1, $43E1, $D0, 0, 0, 3, 1, $106)
    %spritemapEntry(1, $43D1, $D0, 0, 0, 3, 1, $104)
    %spritemapEntry(1, $43B1, $E0, 0, 0, 3, 1, $120)
    %spritemapEntry(1, $4220, $E0, 0, 1, 3, 1, $124)
    %spritemapEntry(1, $4220, $D0, 0, 1, 3, 1, $104)
    %spritemapEntry(1, $4220, $00, 0, 1, 3, 1, $10E)
    %spritemapEntry(1, $43F1, $D0, 0, 0, 3, 1, $108)
    %spritemapEntry(1, $4210, $D0, 0, 1, 3, 1, $106)
    %spritemapEntry(1, $4220, $F0, 0, 1, 3, 1, $144)
    %spritemapEntry(1, $4210, $E0, 0, 1, 3, 1, $126)
    %spritemapEntry(1, $4230, $10, 0, 1, 3, 1, $12C)
    %spritemapEntry(1, $43D1, $10, 0, 0, 3, 1, $12E)
    %spritemapEntry(1, $43E1, $10, 0, 0, 3, 1, $14E)
    %spritemapEntry(1, $43D1, $F0, 0, 0, 3, 1, $144)
    %spritemapEntry(1, $4210, $F0, 0, 1, 3, 1, $146)
    %spritemapEntry(1, $43F1, $E0, 0, 0, 3, 1, $128)
    %spritemapEntry(1, $43E1, $E0, 0, 0, 3, 1, $126)
    %spritemapEntry(1, $4220, $10, 0, 1, 3, 1, $12E)
    %spritemapEntry(1, $43E1, $00, 0, 0, 3, 1, $14A)
    %spritemapEntry(1, $4210, $10, 0, 1, 3, 1, $14E)
    %spritemapEntry(1, $4200, $D0, 0, 1, 3, 1, $108)
    %spritemapEntry(1, $4200, $10, 0, 1, 3, 1, $160)
    %spritemapEntry(1, $43F1, $10, 0, 0, 3, 1, $160)
    %spritemapEntry(1, $43E1, $F0, 0, 0, 3, 1, $146)
    %spritemapEntry(1, $4210, $00, 0, 1, 3, 1, $14A)
    %spritemapEntry(1, $4200, $E0, 0, 1, 3, 1, $128)
    %spritemapEntry(1, $4200, $00, 0, 1, 3, 1, $14C)
    %spritemapEntry(1, $4200, $F0, 0, 1, 3, 1, $148)
    %spritemapEntry(1, $43F1, $00, 0, 0, 3, 1, $14C)
    %spritemapEntry(1, $43F1, $F0, 0, 0, 3, 1, $148)

EnemyProjSpritemaps_NoobTubeCrack_5:
    dw $0032
    %spritemapEntry(1, $4210, $10, 0, 1, 3, 1, $14E)
    %spritemapEntry(1, $4200, $10, 0, 1, 3, 1, $160)
    %spritemapEntry(1, $4200, $00, 0, 1, 3, 1, $14C)
    %spritemapEntry(1, $4210, $00, 0, 1, 3, 1, $14A)
    %spritemapEntry(1, $4220, $10, 0, 1, 3, 1, $12E)
    %spritemapEntry(1, $4230, $10, 0, 1, 3, 1, $12C)
    %spritemapEntry(1, $4240, $10, 0, 1, 3, 1, $12A)
    %spritemapEntry(1, $4220, $00, 0, 1, 3, 1, $10E)
    %spritemapEntry(1, $4230, $00, 0, 1, 3, 1, $10C)
    %spritemapEntry(1, $4240, $00, 0, 1, 3, 1, $10A)
    %spritemapEntry(1, $4200, $F0, 0, 1, 3, 1, $148)
    %spritemapEntry(1, $4210, $F0, 0, 1, 3, 1, $146)
    %spritemapEntry(1, $4220, $F0, 0, 1, 3, 1, $144)
    %spritemapEntry(1, $4230, $F0, 0, 1, 3, 1, $142)
    %spritemapEntry(1, $4240, $F0, 0, 1, 3, 1, $140)
    %spritemapEntry(1, $4200, $E0, 0, 1, 3, 1, $128)
    %spritemapEntry(1, $4210, $E0, 0, 1, 3, 1, $126)
    %spritemapEntry(1, $4220, $E0, 0, 1, 3, 1, $124)
    %spritemapEntry(1, $4230, $E0, 0, 1, 3, 1, $122)
    %spritemapEntry(1, $4240, $E0, 0, 1, 3, 1, $120)
    %spritemapEntry(1, $4200, $D0, 0, 1, 3, 1, $108)
    %spritemapEntry(1, $4210, $D0, 0, 1, 3, 1, $106)
    %spritemapEntry(1, $4220, $D0, 0, 1, 3, 1, $104)
    %spritemapEntry(1, $4230, $D0, 0, 1, 3, 1, $102)
    %spritemapEntry(1, $4240, $D0, 0, 1, 3, 1, $100)
    %spritemapEntry(1, $43E1, $10, 0, 0, 3, 1, $14E)
    %spritemapEntry(1, $43F1, $10, 0, 0, 3, 1, $160)
    %spritemapEntry(1, $43F1, $00, 0, 0, 3, 1, $14C)
    %spritemapEntry(1, $43E1, $00, 0, 0, 3, 1, $14A)
    %spritemapEntry(1, $43D1, $10, 0, 0, 3, 1, $12E)
    %spritemapEntry(1, $43C1, $10, 0, 0, 3, 1, $12C)
    %spritemapEntry(1, $43B1, $10, 0, 0, 3, 1, $12A)
    %spritemapEntry(1, $43D1, $00, 0, 0, 3, 1, $10E)
    %spritemapEntry(1, $43C1, $00, 0, 0, 3, 1, $10C)
    %spritemapEntry(1, $43B1, $00, 0, 0, 3, 1, $10A)
    %spritemapEntry(1, $43F1, $F0, 0, 0, 3, 1, $148)
    %spritemapEntry(1, $43E1, $F0, 0, 0, 3, 1, $146)
    %spritemapEntry(1, $43D1, $F0, 0, 0, 3, 1, $144)
    %spritemapEntry(1, $43C1, $F0, 0, 0, 3, 1, $142)
    %spritemapEntry(1, $43B1, $F0, 0, 0, 3, 1, $140)
    %spritemapEntry(1, $43F1, $E0, 0, 0, 3, 1, $128)
    %spritemapEntry(1, $43E1, $E0, 0, 0, 3, 1, $126)
    %spritemapEntry(1, $43D1, $E0, 0, 0, 3, 1, $124)
    %spritemapEntry(1, $43C1, $E0, 0, 0, 3, 1, $122)
    %spritemapEntry(1, $43B1, $E0, 0, 0, 3, 1, $120)
    %spritemapEntry(1, $43F1, $D0, 0, 0, 3, 1, $108)
    %spritemapEntry(1, $43E1, $D0, 0, 0, 3, 1, $106)
    %spritemapEntry(1, $43D1, $D0, 0, 0, 3, 1, $104)
    %spritemapEntry(1, $43C1, $D0, 0, 0, 3, 1, $102)
    %spritemapEntry(1, $43B1, $D0, 0, 0, 3, 1, $100)

UNUSED_EnemyProjSpritemaps_8D9E29:
    dw $000E
    %spritemapEntry(1, $4200, $EF, 0, 1, 3, 1, $163)
    %spritemapEntry(1, $4208, $EF, 0, 1, 3, 1, $162)
    %spritemapEntry(1, $4200, $00, 0, 1, 3, 1, $16B)
    %spritemapEntry(1, $4208, $00, 0, 1, 3, 1, $16A)
    %spritemapEntry(1, $4200, $F9, 0, 1, 3, 1, $168)
    %spritemapEntry(1, $4208, $F9, 0, 1, 3, 1, $167)
    %spritemapEntry(1, $4218, $F9, 0, 1, 3, 1, $165)
    %spritemapEntry(1, $43F1, $EF, 0, 0, 3, 1, $163)
    %spritemapEntry(1, $43E9, $EF, 0, 0, 3, 1, $162)
    %spritemapEntry(1, $43F1, $00, 0, 0, 3, 1, $16B)
    %spritemapEntry(1, $43E9, $00, 0, 0, 3, 1, $16A)
    %spritemapEntry(1, $43F1, $F9, 0, 0, 3, 1, $168)
    %spritemapEntry(1, $43E9, $F9, 0, 0, 3, 1, $167)
    %spritemapEntry(1, $43D9, $F9, 0, 0, 3, 1, $165)

EnemyProjSpritemaps_NoobTubeCrack_6:
    dw $000E
    %spritemapEntry(1, $420C, $E7, 0, 1, 3, 1, $163)
    %spritemapEntry(1, $4214, $E7, 0, 1, 3, 1, $162)
    %spritemapEntry(1, $420C, $08, 0, 1, 3, 1, $16B)
    %spritemapEntry(1, $4214, $08, 0, 1, 3, 1, $16A)
    %spritemapEntry(1, $4210, $F9, 0, 1, 3, 1, $168)
    %spritemapEntry(1, $4218, $F9, 0, 1, 3, 1, $167)
    %spritemapEntry(1, $4228, $F9, 0, 1, 3, 1, $165)
    %spritemapEntry(1, $43E5, $E7, 0, 0, 3, 1, $163)
    %spritemapEntry(1, $43DD, $E7, 0, 0, 3, 1, $162)
    %spritemapEntry(1, $43E5, $08, 0, 0, 3, 1, $16B)
    %spritemapEntry(1, $43DD, $08, 0, 0, 3, 1, $16A)
    %spritemapEntry(1, $43E1, $F9, 0, 0, 3, 1, $168)
    %spritemapEntry(1, $43D9, $F9, 0, 0, 3, 1, $167)
    %spritemapEntry(1, $43C9, $F9, 0, 0, 3, 1, $165)

EnemyProjSpritemaps_NoobTubeCrack_7:
    dw $000E
    %spritemapEntry(1, $4218, $DF, 0, 1, 3, 1, $163)
    %spritemapEntry(1, $4220, $DF, 0, 1, 3, 1, $162)
    %spritemapEntry(1, $4218, $10, 0, 1, 3, 1, $16B)
    %spritemapEntry(1, $4220, $10, 0, 1, 3, 1, $16A)
    %spritemapEntry(1, $4220, $F9, 0, 1, 3, 1, $168)
    %spritemapEntry(1, $4228, $F9, 0, 1, 3, 1, $167)
    %spritemapEntry(1, $4238, $F9, 0, 1, 3, 1, $165)
    %spritemapEntry(1, $43D9, $DF, 0, 0, 3, 1, $163)
    %spritemapEntry(1, $43D1, $DF, 0, 0, 3, 1, $162)
    %spritemapEntry(1, $43D9, $10, 0, 0, 3, 1, $16B)
    %spritemapEntry(1, $43D1, $10, 0, 0, 3, 1, $16A)
    %spritemapEntry(1, $43D1, $F9, 0, 0, 3, 1, $168)
    %spritemapEntry(1, $43C9, $F9, 0, 0, 3, 1, $167)
    %spritemapEntry(1, $43B9, $F9, 0, 0, 3, 1, $165)

EnemyProjSpritemaps_NoobTubeCrack_8:
    dw $000E
    %spritemapEntry(1, $4230, $F9, 0, 1, 3, 1, $168)
    %spritemapEntry(1, $4238, $F9, 0, 1, 3, 1, $167)
    %spritemapEntry(1, $4248, $F9, 0, 1, 3, 1, $165)
    %spritemapEntry(1, $4224, $D7, 0, 1, 3, 1, $163)
    %spritemapEntry(1, $422C, $D7, 0, 1, 3, 1, $162)
    %spritemapEntry(1, $4228, $18, 0, 1, 3, 1, $16B)
    %spritemapEntry(1, $4230, $18, 0, 1, 3, 1, $16A)
    %spritemapEntry(1, $43CD, $D7, 0, 0, 3, 1, $163)
    %spritemapEntry(1, $43C5, $D7, 0, 0, 3, 1, $162)
    %spritemapEntry(1, $43C9, $18, 0, 0, 3, 1, $16B)
    %spritemapEntry(1, $43C1, $18, 0, 0, 3, 1, $16A)
    %spritemapEntry(1, $43C1, $F9, 0, 0, 3, 1, $168)
    %spritemapEntry(1, $43B9, $F9, 0, 0, 3, 1, $167)
    %spritemapEntry(1, $43A9, $F9, 0, 0, 3, 1, $165)

EnemyProjSpritemaps_NoobTubeCrack_9:
    dw $000E
    %spritemapEntry(1, $4240, $F9, 0, 1, 3, 1, $168)
    %spritemapEntry(1, $4248, $F9, 0, 1, 3, 1, $167)
    %spritemapEntry(1, $4258, $F9, 0, 1, 3, 1, $165)
    %spritemapEntry(1, $4230, $CF, 0, 1, 3, 1, $163)
    %spritemapEntry(1, $4238, $CF, 0, 1, 3, 1, $162)
    %spritemapEntry(1, $4238, $20, 0, 1, 3, 1, $16B)
    %spritemapEntry(1, $4240, $20, 0, 1, 3, 1, $16A)
    %spritemapEntry(1, $43C1, $CF, 0, 0, 3, 1, $163)
    %spritemapEntry(1, $43B9, $CF, 0, 0, 3, 1, $162)
    %spritemapEntry(1, $43B9, $20, 0, 0, 3, 1, $16B)
    %spritemapEntry(1, $43B1, $20, 0, 0, 3, 1, $16A)
    %spritemapEntry(1, $43B1, $F9, 0, 0, 3, 1, $168)
    %spritemapEntry(1, $43A9, $F9, 0, 0, 3, 1, $167)
    %spritemapEntry(1, $4399, $F9, 0, 0, 3, 1, $165)

EnemyProjSpritemaps_NoobTubeCrack_A:
    dw $000E
    %spritemapEntry(1, $4248, $F9, 0, 1, 3, 1, $168)
    %spritemapEntry(1, $4250, $F9, 0, 1, 3, 1, $167)
    %spritemapEntry(1, $4260, $F9, 0, 1, 3, 1, $165)
    %spritemapEntry(1, $4234, $CD, 0, 1, 3, 1, $163)
    %spritemapEntry(1, $423C, $CD, 0, 1, 3, 1, $162)
    %spritemapEntry(1, $423C, $22, 0, 1, 3, 1, $16B)
    %spritemapEntry(1, $4244, $22, 0, 1, 3, 1, $16A)
    %spritemapEntry(1, $43BD, $CD, 0, 0, 3, 1, $163)
    %spritemapEntry(1, $43B5, $CD, 0, 0, 3, 1, $162)
    %spritemapEntry(1, $43B1, $24, 0, 0, 3, 1, $16B)
    %spritemapEntry(1, $43A9, $24, 0, 0, 3, 1, $16A)
    %spritemapEntry(1, $43A9, $F9, 0, 0, 3, 1, $168)
    %spritemapEntry(1, $43A1, $F9, 0, 0, 3, 1, $167)
    %spritemapEntry(1, $4391, $F9, 0, 0, 3, 1, $165)

EnemyProjSpritemaps_NoobTubeCrack_B:
    dw $000E
    %spritemapEntry(1, $424E, $F9, 0, 1, 3, 1, $168)
    %spritemapEntry(1, $4256, $F9, 0, 1, 3, 1, $167)
    %spritemapEntry(1, $4266, $F9, 0, 1, 3, 1, $165)
    %spritemapEntry(1, $4236, $CC, 0, 1, 3, 1, $163)
    %spritemapEntry(1, $423E, $CC, 0, 1, 3, 1, $162)
    %spritemapEntry(1, $423E, $23, 0, 1, 3, 1, $16B)
    %spritemapEntry(1, $4246, $23, 0, 1, 3, 1, $16A)
    %spritemapEntry(1, $43BB, $CC, 0, 0, 3, 1, $163)
    %spritemapEntry(1, $43B3, $CC, 0, 0, 3, 1, $162)
    %spritemapEntry(1, $43AB, $27, 0, 0, 3, 1, $16B)
    %spritemapEntry(1, $43A3, $27, 0, 0, 3, 1, $16A)
    %spritemapEntry(1, $43A3, $F9, 0, 0, 3, 1, $168)
    %spritemapEntry(1, $439B, $F9, 0, 0, 3, 1, $167)
    %spritemapEntry(1, $438B, $F9, 0, 0, 3, 1, $165)

EnemyProjSpritemaps_NoobTubeCrack_C:
    dw $000E
    %spritemapEntry(1, $4252, $F9, 0, 1, 3, 1, $168)
    %spritemapEntry(1, $425A, $F9, 0, 1, 3, 1, $167)
    %spritemapEntry(1, $426A, $F9, 0, 1, 3, 1, $165)
    %spritemapEntry(1, $4237, $CD, 0, 1, 3, 1, $163)
    %spritemapEntry(1, $423F, $CD, 0, 1, 3, 1, $162)
    %spritemapEntry(1, $423E, $24, 0, 1, 3, 1, $16B)
    %spritemapEntry(1, $4246, $24, 0, 1, 3, 1, $16A)
    %spritemapEntry(1, $43B9, $CD, 0, 0, 3, 1, $163)
    %spritemapEntry(1, $43B1, $CD, 0, 0, 3, 1, $162)
    %spritemapEntry(1, $43AC, $28, 0, 0, 3, 1, $16B)
    %spritemapEntry(1, $43A4, $28, 0, 0, 3, 1, $16A)
    %spritemapEntry(1, $439F, $F9, 0, 0, 3, 1, $168)
    %spritemapEntry(1, $4397, $F9, 0, 0, 3, 1, $167)
    %spritemapEntry(1, $4387, $F9, 0, 0, 3, 1, $165)

EnemyProjSpritemaps_NoobTubeCrack_D:
    dw $000E
    %spritemapEntry(1, $4254, $F9, 0, 1, 3, 1, $168)
    %spritemapEntry(1, $425C, $F9, 0, 1, 3, 1, $167)
    %spritemapEntry(1, $426C, $F9, 0, 1, 3, 1, $165)
    %spritemapEntry(1, $4238, $CE, 0, 1, 3, 1, $163)
    %spritemapEntry(1, $4240, $CE, 0, 1, 3, 1, $162)
    %spritemapEntry(1, $423D, $25, 0, 1, 3, 1, $16B)
    %spritemapEntry(1, $4245, $25, 0, 1, 3, 1, $16A)
    %spritemapEntry(1, $43B8, $CE, 0, 0, 3, 1, $163)
    %spritemapEntry(1, $43B0, $CE, 0, 0, 3, 1, $162)
    %spritemapEntry(1, $43AB, $2A, 0, 0, 3, 1, $16B)
    %spritemapEntry(1, $43A3, $2A, 0, 0, 3, 1, $16A)
    %spritemapEntry(1, $439D, $F9, 0, 0, 3, 1, $168)
    %spritemapEntry(1, $4395, $F9, 0, 0, 3, 1, $167)
    %spritemapEntry(1, $4385, $F9, 0, 0, 3, 1, $165)

EnemyProjSpritemaps_NoobTubeCrack_E:
    dw $000E
    %spritemapEntry(1, $4256, $FB, 0, 1, 3, 1, $168)
    %spritemapEntry(1, $425E, $FB, 0, 1, 3, 1, $167)
    %spritemapEntry(1, $426E, $FB, 0, 1, 3, 1, $165)
    %spritemapEntry(1, $4239, $D0, 0, 1, 3, 1, $163)
    %spritemapEntry(1, $4241, $D0, 0, 1, 3, 1, $162)
    %spritemapEntry(1, $423E, $26, 0, 1, 3, 1, $16B)
    %spritemapEntry(1, $4246, $26, 0, 1, 3, 1, $16A)
    %spritemapEntry(1, $43B7, $D0, 0, 0, 3, 1, $163)
    %spritemapEntry(1, $43AF, $D0, 0, 0, 3, 1, $162)
    %spritemapEntry(1, $43AA, $2C, 0, 0, 3, 1, $16B)
    %spritemapEntry(1, $43A2, $2C, 0, 0, 3, 1, $16A)
    %spritemapEntry(1, $439B, $FA, 0, 0, 3, 1, $168)
    %spritemapEntry(1, $4393, $FA, 0, 0, 3, 1, $167)
    %spritemapEntry(1, $4383, $FA, 0, 0, 3, 1, $165)

EnemyProjSpritemaps_NoobTubeCrack_F:
    dw $000E
    %spritemapEntry(1, $4258, $FD, 0, 1, 3, 1, $168)
    %spritemapEntry(1, $4260, $FD, 0, 1, 3, 1, $167)
    %spritemapEntry(1, $4270, $FD, 0, 1, 3, 1, $165)
    %spritemapEntry(1, $4239, $D1, 0, 1, 3, 1, $163)
    %spritemapEntry(1, $4241, $D1, 0, 1, 3, 1, $162)
    %spritemapEntry(1, $423F, $27, 0, 1, 3, 1, $16B)
    %spritemapEntry(1, $4247, $27, 0, 1, 3, 1, $16A)
    %spritemapEntry(1, $43B8, $D2, 0, 0, 3, 1, $163)
    %spritemapEntry(1, $43B0, $D2, 0, 0, 3, 1, $162)
    %spritemapEntry(1, $43AB, $2E, 0, 0, 3, 1, $16B)
    %spritemapEntry(1, $43A3, $2E, 0, 0, 3, 1, $16A)
    %spritemapEntry(1, $4399, $FB, 0, 0, 3, 1, $168)
    %spritemapEntry(1, $4391, $FB, 0, 0, 3, 1, $167)
    %spritemapEntry(1, $4381, $FB, 0, 0, 3, 1, $165)

EnemyProjSpritemaps_NoobTubeCrack_10:
    dw $000E
    %spritemapEntry(1, $43AC, $30, 0, 0, 3, 1, $16B)
    %spritemapEntry(1, $43A4, $30, 0, 0, 3, 1, $16A)
    %spritemapEntry(1, $4258, $00, 0, 1, 3, 1, $168)
    %spritemapEntry(1, $4260, $00, 0, 1, 3, 1, $167)
    %spritemapEntry(1, $4270, $00, 0, 1, 3, 1, $165)
    %spritemapEntry(1, $4238, $D2, 0, 1, 3, 1, $163)
    %spritemapEntry(1, $4240, $D2, 0, 1, 3, 1, $162)
    %spritemapEntry(1, $423E, $28, 0, 1, 3, 1, $16B)
    %spritemapEntry(1, $4246, $28, 0, 1, 3, 1, $16A)
    %spritemapEntry(1, $43B7, $D4, 0, 0, 3, 1, $163)
    %spritemapEntry(1, $43AF, $D4, 0, 0, 3, 1, $162)
    %spritemapEntry(1, $4399, $FC, 0, 0, 3, 1, $168)
    %spritemapEntry(1, $4391, $FC, 0, 0, 3, 1, $167)
    %spritemapEntry(1, $4381, $FC, 0, 0, 3, 1, $165)

EnemyProjSpritemaps_NoobTubeCrack_11:
    dw $000E
    %spritemapEntry(1, $43AB, $32, 0, 0, 3, 1, $16B)
    %spritemapEntry(1, $43A3, $32, 0, 0, 3, 1, $16A)
    %spritemapEntry(1, $4257, $03, 0, 1, 3, 1, $168)
    %spritemapEntry(1, $425F, $03, 0, 1, 3, 1, $167)
    %spritemapEntry(1, $426F, $03, 0, 1, 3, 1, $165)
    %spritemapEntry(1, $4239, $D3, 0, 1, 3, 1, $163)
    %spritemapEntry(1, $4241, $D3, 0, 1, 3, 1, $162)
    %spritemapEntry(1, $423D, $29, 0, 1, 3, 1, $16B)
    %spritemapEntry(1, $4245, $29, 0, 1, 3, 1, $16A)
    %spritemapEntry(1, $43B6, $D6, 0, 0, 3, 1, $163)
    %spritemapEntry(1, $43AE, $D6, 0, 0, 3, 1, $162)
    %spritemapEntry(1, $439A, $FD, 0, 0, 3, 1, $168)
    %spritemapEntry(1, $4392, $FD, 0, 0, 3, 1, $167)
    %spritemapEntry(1, $4382, $FD, 0, 0, 3, 1, $165)

EnemyProjSpritemaps_NoobTubeCrack_12:
    dw $000E
    %spritemapEntry(1, $43AA, $34, 0, 0, 3, 1, $16B)
    %spritemapEntry(1, $43A2, $34, 0, 0, 3, 1, $16A)
    %spritemapEntry(1, $4258, $06, 0, 1, 3, 1, $168)
    %spritemapEntry(1, $4260, $06, 0, 1, 3, 1, $167)
    %spritemapEntry(1, $4270, $06, 0, 1, 3, 1, $165)
    %spritemapEntry(1, $423A, $D4, 0, 1, 3, 1, $163)
    %spritemapEntry(1, $4242, $D4, 0, 1, 3, 1, $162)
    %spritemapEntry(1, $423E, $2A, 0, 1, 3, 1, $16B)
    %spritemapEntry(1, $4246, $2A, 0, 1, 3, 1, $16A)
    %spritemapEntry(1, $43B7, $D8, 0, 0, 3, 1, $163)
    %spritemapEntry(1, $43AF, $D8, 0, 0, 3, 1, $162)
    %spritemapEntry(1, $4399, $FE, 0, 0, 3, 1, $168)
    %spritemapEntry(1, $4391, $FE, 0, 0, 3, 1, $167)
    %spritemapEntry(1, $4381, $FE, 0, 0, 3, 1, $165)

EnemyProjSpritemaps_NoobTubeCrack_13:
    dw $000E
    %spritemapEntry(1, $43AB, $36, 0, 0, 3, 1, $16B)
    %spritemapEntry(1, $43A3, $36, 0, 0, 3, 1, $16A)
    %spritemapEntry(1, $4257, $09, 0, 1, 3, 1, $168)
    %spritemapEntry(1, $425F, $09, 0, 1, 3, 1, $167)
    %spritemapEntry(1, $426F, $09, 0, 1, 3, 1, $165)
    %spritemapEntry(1, $4239, $D5, 0, 1, 3, 1, $163)
    %spritemapEntry(1, $4241, $D5, 0, 1, 3, 1, $162)
    %spritemapEntry(1, $423F, $2B, 0, 1, 3, 1, $16B)
    %spritemapEntry(1, $4247, $2B, 0, 1, 3, 1, $16A)
    %spritemapEntry(1, $43B8, $DA, 0, 0, 3, 1, $163)
    %spritemapEntry(1, $43B0, $DA, 0, 0, 3, 1, $162)
    %spritemapEntry(1, $439A, $FF, 0, 0, 3, 1, $168)
    %spritemapEntry(1, $4392, $FF, 0, 0, 3, 1, $167)
    %spritemapEntry(1, $4382, $FF, 0, 0, 3, 1, $165)

EnemyProjSpritemaps_NoobTubeCrack_14:
    dw $000E
    %spritemapEntry(1, $43AC, $38, 0, 0, 3, 1, $16B)
    %spritemapEntry(1, $43A4, $38, 0, 0, 3, 1, $16A)
    %spritemapEntry(1, $4258, $0C, 0, 1, 3, 1, $168)
    %spritemapEntry(1, $4260, $0C, 0, 1, 3, 1, $167)
    %spritemapEntry(1, $4270, $0C, 0, 1, 3, 1, $165)
    %spritemapEntry(1, $4238, $D6, 0, 1, 3, 1, $163)
    %spritemapEntry(1, $4240, $D6, 0, 1, 3, 1, $162)
    %spritemapEntry(1, $423E, $2C, 0, 1, 3, 1, $16B)
    %spritemapEntry(1, $4246, $2C, 0, 1, 3, 1, $16A)
    %spritemapEntry(1, $43B7, $DC, 0, 0, 3, 1, $163)
    %spritemapEntry(1, $43AF, $DC, 0, 0, 3, 1, $162)
    %spritemapEntry(1, $4399, $00, 0, 0, 3, 1, $168)
    %spritemapEntry(1, $4391, $00, 0, 0, 3, 1, $167)
    %spritemapEntry(1, $4381, $00, 0, 0, 3, 1, $165)

EnemyProjSpritemaps_NoobTubeCrack_15:
    dw $000E
    %spritemapEntry(1, $43AB, $3A, 0, 0, 3, 1, $16B)
    %spritemapEntry(1, $43A3, $3A, 0, 0, 3, 1, $16A)
    %spritemapEntry(1, $439A, $01, 0, 0, 3, 1, $168)
    %spritemapEntry(1, $4392, $01, 0, 0, 3, 1, $167)
    %spritemapEntry(1, $4382, $01, 0, 0, 3, 1, $165)
    %spritemapEntry(1, $4257, $0F, 0, 1, 3, 1, $168)
    %spritemapEntry(1, $425F, $0F, 0, 1, 3, 1, $167)
    %spritemapEntry(1, $426F, $0F, 0, 1, 3, 1, $165)
    %spritemapEntry(1, $4239, $D7, 0, 1, 3, 1, $163)
    %spritemapEntry(1, $4241, $D7, 0, 1, 3, 1, $162)
    %spritemapEntry(1, $423D, $2D, 0, 1, 3, 1, $16B)
    %spritemapEntry(1, $4245, $2D, 0, 1, 3, 1, $16A)
    %spritemapEntry(1, $43B6, $DE, 0, 0, 3, 1, $163)
    %spritemapEntry(1, $43AE, $DE, 0, 0, 3, 1, $162)

EnemyProjSpritemaps_NoobTubeCrack_16:
    dw $000E
    %spritemapEntry(1, $43AA, $3C, 0, 0, 3, 1, $16B)
    %spritemapEntry(1, $43A2, $3C, 0, 0, 3, 1, $16A)
    %spritemapEntry(1, $4399, $02, 0, 0, 3, 1, $168)
    %spritemapEntry(1, $4391, $02, 0, 0, 3, 1, $167)
    %spritemapEntry(1, $4381, $02, 0, 0, 3, 1, $165)
    %spritemapEntry(1, $4258, $12, 0, 1, 3, 1, $168)
    %spritemapEntry(1, $4260, $12, 0, 1, 3, 1, $167)
    %spritemapEntry(1, $4270, $12, 0, 1, 3, 1, $165)
    %spritemapEntry(1, $423A, $D8, 0, 1, 3, 1, $163)
    %spritemapEntry(1, $4242, $D8, 0, 1, 3, 1, $162)
    %spritemapEntry(1, $423E, $2E, 0, 1, 3, 1, $16B)
    %spritemapEntry(1, $4246, $2E, 0, 1, 3, 1, $16A)
    %spritemapEntry(1, $43B7, $E0, 0, 0, 3, 1, $163)
    %spritemapEntry(1, $43AF, $E0, 0, 0, 3, 1, $162)

EnemyProjSpritemaps_NoobTubeCrack_17:
    dw $000E
    %spritemapEntry(1, $43AB, $3E, 0, 0, 3, 1, $16B)
    %spritemapEntry(1, $43A3, $3E, 0, 0, 3, 1, $16A)
    %spritemapEntry(1, $439A, $03, 0, 0, 3, 1, $168)
    %spritemapEntry(1, $4392, $03, 0, 0, 3, 1, $167)
    %spritemapEntry(1, $4382, $03, 0, 0, 3, 1, $165)
    %spritemapEntry(1, $4257, $15, 0, 1, 3, 1, $168)
    %spritemapEntry(1, $425F, $15, 0, 1, 3, 1, $167)
    %spritemapEntry(1, $426F, $15, 0, 1, 3, 1, $165)
    %spritemapEntry(1, $4239, $D9, 0, 1, 3, 1, $163)
    %spritemapEntry(1, $4241, $D9, 0, 1, 3, 1, $162)
    %spritemapEntry(1, $423F, $2F, 0, 1, 3, 1, $16B)
    %spritemapEntry(1, $4247, $2F, 0, 1, 3, 1, $16A)
    %spritemapEntry(1, $43B8, $E2, 0, 0, 3, 1, $163)
    %spritemapEntry(1, $43B0, $E2, 0, 0, 3, 1, $162)

EnemyProjSpritemaps_NoobTubeCrack_18:
    dw $000E
    %spritemapEntry(1, $43AC, $40, 0, 0, 3, 1, $16B)
    %spritemapEntry(1, $43A4, $40, 0, 0, 3, 1, $16A)
    %spritemapEntry(1, $4399, $04, 0, 0, 3, 1, $168)
    %spritemapEntry(1, $4391, $04, 0, 0, 3, 1, $167)
    %spritemapEntry(1, $4381, $04, 0, 0, 3, 1, $165)
    %spritemapEntry(1, $4258, $18, 0, 1, 3, 1, $168)
    %spritemapEntry(1, $4260, $18, 0, 1, 3, 1, $167)
    %spritemapEntry(1, $4270, $18, 0, 1, 3, 1, $165)
    %spritemapEntry(1, $4238, $DA, 0, 1, 3, 1, $163)
    %spritemapEntry(1, $4240, $DA, 0, 1, 3, 1, $162)
    %spritemapEntry(1, $423E, $30, 0, 1, 3, 1, $16B)
    %spritemapEntry(1, $4246, $30, 0, 1, 3, 1, $16A)
    %spritemapEntry(1, $43B7, $E4, 0, 0, 3, 1, $163)
    %spritemapEntry(1, $43AF, $E4, 0, 0, 3, 1, $162)

EnemyProjSpritemaps_NoobTubeCrack_19:
    dw $000E
    %spritemapEntry(1, $43AB, $42, 0, 0, 3, 1, $16B)
    %spritemapEntry(1, $43A3, $42, 0, 0, 3, 1, $16A)
    %spritemapEntry(1, $439A, $05, 0, 0, 3, 1, $168)
    %spritemapEntry(1, $4392, $05, 0, 0, 3, 1, $167)
    %spritemapEntry(1, $4382, $05, 0, 0, 3, 1, $165)
    %spritemapEntry(1, $4257, $1B, 0, 1, 3, 1, $168)
    %spritemapEntry(1, $425F, $1B, 0, 1, 3, 1, $167)
    %spritemapEntry(1, $426F, $1B, 0, 1, 3, 1, $165)
    %spritemapEntry(1, $4239, $DB, 0, 1, 3, 1, $163)
    %spritemapEntry(1, $4241, $DB, 0, 1, 3, 1, $162)
    %spritemapEntry(1, $423D, $31, 0, 1, 3, 1, $16B)
    %spritemapEntry(1, $4245, $31, 0, 1, 3, 1, $16A)
    %spritemapEntry(1, $43B6, $E6, 0, 0, 3, 1, $163)
    %spritemapEntry(1, $43AE, $E6, 0, 0, 3, 1, $162)

EnemyProjSpritemaps_NoobTubeCrack_1A:
    dw $000E
    %spritemapEntry(1, $43AA, $44, 0, 0, 3, 1, $16B)
    %spritemapEntry(1, $43A2, $44, 0, 0, 3, 1, $16A)
    %spritemapEntry(1, $4399, $06, 0, 0, 3, 1, $168)
    %spritemapEntry(1, $4391, $06, 0, 0, 3, 1, $167)
    %spritemapEntry(1, $4381, $06, 0, 0, 3, 1, $165)
    %spritemapEntry(1, $4258, $1E, 0, 1, 3, 1, $168)
    %spritemapEntry(1, $4260, $1E, 0, 1, 3, 1, $167)
    %spritemapEntry(1, $4270, $1E, 0, 1, 3, 1, $165)
    %spritemapEntry(1, $423A, $DC, 0, 1, 3, 1, $163)
    %spritemapEntry(1, $4242, $DC, 0, 1, 3, 1, $162)
    %spritemapEntry(1, $423E, $32, 0, 1, 3, 1, $16B)
    %spritemapEntry(1, $4246, $32, 0, 1, 3, 1, $16A)
    %spritemapEntry(1, $43B7, $E8, 0, 0, 3, 1, $163)
    %spritemapEntry(1, $43AF, $E8, 0, 0, 3, 1, $162)

EnemyProjSpritemaps_NoobTubeCrack_1B:
    dw $000E
    %spritemapEntry(1, $43AB, $46, 0, 0, 3, 1, $16B)
    %spritemapEntry(1, $43A3, $46, 0, 0, 3, 1, $16A)
    %spritemapEntry(1, $439A, $07, 0, 0, 3, 1, $168)
    %spritemapEntry(1, $4392, $07, 0, 0, 3, 1, $167)
    %spritemapEntry(1, $4382, $07, 0, 0, 3, 1, $165)
    %spritemapEntry(1, $4257, $21, 0, 1, 3, 1, $168)
    %spritemapEntry(1, $425F, $21, 0, 1, 3, 1, $167)
    %spritemapEntry(1, $426F, $21, 0, 1, 3, 1, $165)
    %spritemapEntry(1, $4239, $DD, 0, 1, 3, 1, $163)
    %spritemapEntry(1, $4241, $DD, 0, 1, 3, 1, $162)
    %spritemapEntry(1, $423F, $33, 0, 1, 3, 1, $16B)
    %spritemapEntry(1, $4247, $33, 0, 1, 3, 1, $16A)
    %spritemapEntry(1, $43B8, $EA, 0, 0, 3, 1, $163)
    %spritemapEntry(1, $43B0, $EA, 0, 0, 3, 1, $162)

EnemyProjSpritemaps_NoobTubeCrack_1C:
    dw $000E
    %spritemapEntry(1, $43AC, $48, 0, 0, 3, 1, $16B)
    %spritemapEntry(1, $43A4, $48, 0, 0, 3, 1, $16A)
    %spritemapEntry(1, $4399, $08, 0, 0, 3, 1, $168)
    %spritemapEntry(1, $4391, $08, 0, 0, 3, 1, $167)
    %spritemapEntry(1, $4381, $08, 0, 0, 3, 1, $165)
    %spritemapEntry(1, $4258, $24, 0, 1, 3, 1, $168)
    %spritemapEntry(1, $4260, $24, 0, 1, 3, 1, $167)
    %spritemapEntry(1, $4270, $24, 0, 1, 3, 1, $165)
    %spritemapEntry(1, $4238, $DE, 0, 1, 3, 1, $163)
    %spritemapEntry(1, $4240, $DE, 0, 1, 3, 1, $162)
    %spritemapEntry(1, $423E, $34, 0, 1, 3, 1, $16B)
    %spritemapEntry(1, $4246, $34, 0, 1, 3, 1, $16A)
    %spritemapEntry(1, $43B7, $EC, 0, 0, 3, 1, $163)
    %spritemapEntry(1, $43AF, $EC, 0, 0, 3, 1, $162)

EnemyProjSpritemaps_NoobTubeCrack_1D:
    dw $000E
    %spritemapEntry(1, $43AB, $4A, 0, 0, 3, 1, $16B)
    %spritemapEntry(1, $43A3, $4A, 0, 0, 3, 1, $16A)
    %spritemapEntry(1, $4257, $27, 0, 1, 3, 1, $168)
    %spritemapEntry(1, $425F, $27, 0, 1, 3, 1, $167)
    %spritemapEntry(1, $426F, $27, 0, 1, 3, 1, $165)
    %spritemapEntry(1, $4239, $DF, 0, 1, 3, 1, $163)
    %spritemapEntry(1, $4241, $DF, 0, 1, 3, 1, $162)
    %spritemapEntry(1, $423D, $35, 0, 1, 3, 1, $16B)
    %spritemapEntry(1, $4245, $35, 0, 1, 3, 1, $16A)
    %spritemapEntry(1, $43B6, $EE, 0, 0, 3, 1, $163)
    %spritemapEntry(1, $43AE, $EE, 0, 0, 3, 1, $162)
    %spritemapEntry(1, $439A, $09, 0, 0, 3, 1, $168)
    %spritemapEntry(1, $4392, $09, 0, 0, 3, 1, $167)
    %spritemapEntry(1, $4382, $09, 0, 0, 3, 1, $165)

EnemyProjSpritemaps_NoobTubeCrack_1E:
    dw $000E
    %spritemapEntry(1, $43AA, $4C, 0, 0, 3, 1, $16B)
    %spritemapEntry(1, $43A2, $4C, 0, 0, 3, 1, $16A)
    %spritemapEntry(1, $4258, $2A, 0, 1, 3, 1, $168)
    %spritemapEntry(1, $4260, $2A, 0, 1, 3, 1, $167)
    %spritemapEntry(1, $4270, $2A, 0, 1, 3, 1, $165)
    %spritemapEntry(1, $423A, $E0, 0, 1, 3, 1, $163)
    %spritemapEntry(1, $4242, $E0, 0, 1, 3, 1, $162)
    %spritemapEntry(1, $423E, $36, 0, 1, 3, 1, $16B)
    %spritemapEntry(1, $4246, $36, 0, 1, 3, 1, $16A)
    %spritemapEntry(1, $43B7, $F0, 0, 0, 3, 1, $163)
    %spritemapEntry(1, $43AF, $F0, 0, 0, 3, 1, $162)
    %spritemapEntry(1, $4399, $0A, 0, 0, 3, 1, $168)
    %spritemapEntry(1, $4391, $0A, 0, 0, 3, 1, $167)
    %spritemapEntry(1, $4381, $0A, 0, 0, 3, 1, $165)

EnemyProjSpritemaps_NoobTubeCrack_1F:
    dw $000E
    %spritemapEntry(1, $43AB, $4E, 0, 0, 3, 1, $16B)
    %spritemapEntry(1, $43A3, $4E, 0, 0, 3, 1, $16A)
    %spritemapEntry(1, $4257, $2D, 0, 1, 3, 1, $168)
    %spritemapEntry(1, $425F, $2D, 0, 1, 3, 1, $167)
    %spritemapEntry(1, $426F, $2D, 0, 1, 3, 1, $165)
    %spritemapEntry(1, $4239, $E1, 0, 1, 3, 1, $163)
    %spritemapEntry(1, $4241, $E1, 0, 1, 3, 1, $162)
    %spritemapEntry(1, $423F, $37, 0, 1, 3, 1, $16B)
    %spritemapEntry(1, $4247, $37, 0, 1, 3, 1, $16A)
    %spritemapEntry(1, $43B8, $F2, 0, 0, 3, 1, $163)
    %spritemapEntry(1, $43B0, $F2, 0, 0, 3, 1, $162)
    %spritemapEntry(1, $439A, $0B, 0, 0, 3, 1, $168)
    %spritemapEntry(1, $4392, $0B, 0, 0, 3, 1, $167)
    %spritemapEntry(1, $4382, $0B, 0, 0, 3, 1, $165)

EnemyProjSpritemaps_NoobTubeCrack_20:
    dw $000E
    %spritemapEntry(1, $43AC, $50, 0, 0, 3, 1, $16B)
    %spritemapEntry(1, $43A4, $50, 0, 0, 3, 1, $16A)
    %spritemapEntry(1, $4258, $30, 0, 1, 3, 1, $168)
    %spritemapEntry(1, $4260, $30, 0, 1, 3, 1, $167)
    %spritemapEntry(1, $4270, $30, 0, 1, 3, 1, $165)
    %spritemapEntry(1, $4238, $E2, 0, 1, 3, 1, $163)
    %spritemapEntry(1, $4240, $E2, 0, 1, 3, 1, $162)
    %spritemapEntry(1, $423E, $38, 0, 1, 3, 1, $16B)
    %spritemapEntry(1, $4246, $38, 0, 1, 3, 1, $16A)
    %spritemapEntry(1, $43B7, $F4, 0, 0, 3, 1, $163)
    %spritemapEntry(1, $43AF, $F4, 0, 0, 3, 1, $162)
    %spritemapEntry(1, $4399, $0C, 0, 0, 3, 1, $168)
    %spritemapEntry(1, $4391, $0C, 0, 0, 3, 1, $167)
    %spritemapEntry(1, $4381, $0C, 0, 0, 3, 1, $165)

EnemyProjSpritemaps_NoobTubeCrack_21:
    dw $000E
    %spritemapEntry(1, $43AB, $52, 0, 0, 3, 1, $16B)
    %spritemapEntry(1, $43A3, $52, 0, 0, 3, 1, $16A)
    %spritemapEntry(1, $4257, $33, 0, 1, 3, 1, $168)
    %spritemapEntry(1, $425F, $33, 0, 1, 3, 1, $167)
    %spritemapEntry(1, $426F, $33, 0, 1, 3, 1, $165)
    %spritemapEntry(1, $4239, $E3, 0, 1, 3, 1, $163)
    %spritemapEntry(1, $4241, $E3, 0, 1, 3, 1, $162)
    %spritemapEntry(1, $423D, $39, 0, 1, 3, 1, $16B)
    %spritemapEntry(1, $4245, $39, 0, 1, 3, 1, $16A)
    %spritemapEntry(1, $43B6, $F6, 0, 0, 3, 1, $163)
    %spritemapEntry(1, $43AE, $F6, 0, 0, 3, 1, $162)
    %spritemapEntry(1, $439A, $0D, 0, 0, 3, 1, $168)
    %spritemapEntry(1, $4392, $0D, 0, 0, 3, 1, $167)
    %spritemapEntry(1, $4382, $0D, 0, 0, 3, 1, $165)

EnemyProjSpritemaps_NoobTubeCrack_22:
    dw $000E
    %spritemapEntry(1, $43AA, $54, 0, 0, 3, 1, $16B)
    %spritemapEntry(1, $43A2, $54, 0, 0, 3, 1, $16A)
    %spritemapEntry(1, $4399, $0E, 0, 0, 3, 1, $168)
    %spritemapEntry(1, $4391, $0E, 0, 0, 3, 1, $167)
    %spritemapEntry(1, $4381, $0E, 0, 0, 3, 1, $165)
    %spritemapEntry(1, $4258, $36, 0, 1, 3, 1, $168)
    %spritemapEntry(1, $4260, $36, 0, 1, 3, 1, $167)
    %spritemapEntry(1, $4270, $36, 0, 1, 3, 1, $165)
    %spritemapEntry(1, $423A, $E4, 0, 1, 3, 1, $163)
    %spritemapEntry(1, $4242, $E4, 0, 1, 3, 1, $162)
    %spritemapEntry(1, $423E, $3A, 0, 1, 3, 1, $16B)
    %spritemapEntry(1, $4246, $3A, 0, 1, 3, 1, $16A)
    %spritemapEntry(1, $43B7, $F8, 0, 0, 3, 1, $163)
    %spritemapEntry(1, $43AF, $F8, 0, 0, 3, 1, $162)

EnemyProjSpritemaps_NoobTubeCrack_23:
    dw $000E
    %spritemapEntry(1, $43AB, $54, 0, 0, 3, 1, $16B)
    %spritemapEntry(1, $43A3, $54, 0, 0, 3, 1, $16A)
    %spritemapEntry(1, $439A, $0E, 0, 0, 3, 1, $168)
    %spritemapEntry(1, $4392, $0E, 0, 0, 3, 1, $167)
    %spritemapEntry(1, $4382, $0E, 0, 0, 3, 1, $165)
    %spritemapEntry(1, $4257, $36, 0, 1, 3, 1, $168)
    %spritemapEntry(1, $425F, $36, 0, 1, 3, 1, $167)
    %spritemapEntry(1, $426F, $36, 0, 1, 3, 1, $165)
    %spritemapEntry(1, $4239, $E4, 0, 1, 3, 1, $163)
    %spritemapEntry(1, $4241, $E4, 0, 1, 3, 1, $162)
    %spritemapEntry(1, $423F, $3A, 0, 1, 3, 1, $16B)
    %spritemapEntry(1, $4247, $3A, 0, 1, 3, 1, $16A)
    %spritemapEntry(1, $43B8, $F8, 0, 0, 3, 1, $163)
    %spritemapEntry(1, $43B0, $F8, 0, 0, 3, 1, $162)

EnemyProjSpritemaps_NoobTubeShards_0:
    dw $0002
    %spritemapEntry(1, $43F3, $FA, 1, 1, 3, 1, $1A2)
    %spritemapEntry(1, $4203, $FA, 1, 1, 3, 1, $1A0)

EnemyProjSpritemaps_NoobTubeShards_1:
    dw $0002
    %spritemapEntry(1, $43FE, $FA, 1, 0, 3, 1, $1A2)
    %spritemapEntry(1, $43EE, $FA, 1, 0, 3, 1, $1A0)

EnemyProjSpritemaps_NoobTubeShards_2:
    dw $0002
    %spritemapEntry(1, $43FD, $FD, 0, 0, 3, 1, $1A6)
    %spritemapEntry(1, $43F5, $F5, 0, 0, 3, 1, $1A4)

EnemyProjSpritemaps_NoobTubeShards_3:
    dw $0002
    %spritemapEntry(1, $43F4, $FD, 0, 1, 3, 1, $1A6)
    %spritemapEntry(1, $43FC, $F5, 0, 1, 3, 1, $1A4)

EnemyProjSpritemaps_NoobTubeShards_4:
    dw $0001
    %spritemapEntry(1, $43F7, $F8, 0, 0, 3, 1, $1A8)

EnemyProjSpritemaps_NoobTubeShards_5:
    dw $0001
    %spritemapEntry(1, $43FA, $F8, 0, 1, 3, 1, $1A8)

EnemyProjSpritemaps_NoobTubeShards_6:
    dw $0002
    %spritemapEntry(1, $43EC, $F9, 0, 1, 3, 1, $1AC)
    %spritemapEntry(1, $43FC, $F9, 0, 1, 3, 1, $1AA)

EnemyProjSpritemaps_NoobTubeShards_7:
    dw $0002
    %spritemapEntry(1, $4205, $F9, 0, 0, 3, 1, $1AC)
    %spritemapEntry(1, $43F5, $F9, 0, 0, 3, 1, $1AA)

EnemyProjSpritemaps_NoobTubeShards_8:
    dw $0002
    %spritemapEntry(1, $43F3, $FB, 0, 1, 3, 1, $1AE)
    %spritemapEntry(1, $4203, $FB, 0, 1, 3, 1, $18E)

EnemyProjSpritemaps_NoobTubeShards_9:
    dw $0002
    %spritemapEntry(1, $43FE, $FB, 0, 0, 3, 1, $1AE)
    %spritemapEntry(1, $43EE, $FB, 0, 0, 3, 1, $18E)

EnemyProjSpritemaps_NoobTubeShards_A:
    dw $0002
    %spritemapEntry(1, $43F3, $F6, 1, 1, 3, 1, $1AE)
    %spritemapEntry(1, $4203, $F6, 1, 1, 3, 1, $18E)

EnemyProjSpritemaps_NoobTubeShards_B:
    dw $0002
    %spritemapEntry(1, $43FE, $F6, 1, 0, 3, 1, $1AE)
    %spritemapEntry(1, $43EE, $F6, 1, 0, 3, 1, $18E)

EnemyProjSpritemaps_NoobTubeShards_C:
    dw $0002
    %spritemapEntry(1, $4200, $F8, 0, 0, 3, 1, $188)
    %spritemapEntry(1, $43F0, $F8, 0, 0, 3, 1, $186)

EnemyProjSpritemaps_NoobTubeShards_D:
    dw $0002
    %spritemapEntry(1, $43F1, $F8, 0, 1, 3, 1, $188)
    %spritemapEntry(1, $4201, $F8, 0, 1, 3, 1, $186)

EnemyProjSpritemaps_NoobTubeShards_E:
    dw $0002
    %spritemapEntry(1, $4201, $F8, 0, 0, 3, 1, $18C)
    %spritemapEntry(1, $43F1, $F8, 0, 0, 3, 1, $18A)

EnemyProjSpritemaps_NoobTubeShards_F:
    dw $0002
    %spritemapEntry(1, $43F0, $F8, 0, 1, 3, 1, $18C)
    %spritemapEntry(1, $4200, $F8, 0, 1, 3, 1, $18A)

EnemyProjSpritemaps_NoobTubeShards_10:
    dw $0002
    %spritemapEntry(1, $43F8, $F4, 0, 0, 3, 1, $182)
    %spritemapEntry(1, $43F8, $FC, 0, 0, 3, 1, $184)

EnemyProjSpritemaps_NoobTubeShards_11:
    dw $0002
    %spritemapEntry(1, $43F4, $F0, 0, 0, 3, 1, $16D)
    %spritemapEntry(1, $43F4, $00, 0, 0, 3, 1, $180)

EnemyProjSpritemaps_NoobTubeShards_12:
    dw $0002
    %spritemapEntry(1, $43FC, $00, 0, 1, 3, 1, $180)
    %spritemapEntry(1, $43FC, $F0, 0, 1, 3, 1, $16D)

EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_0:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 5, $7C)

EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_1:
    dw $0002
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 5, $7C)
    %spritemapEntry(1, $43F8, $00, 0, 0, 3, 5, $7E)

EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_2:
    dw $0003
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 5, $7C)
    %spritemapEntry(1, $43F8, $00, 0, 0, 3, 5, $7E)
    %spritemapEntry(1, $43F8, $08, 0, 0, 3, 5, $9A)

EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_3:
    dw $0004 ; BUG: should be 5
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 5, $7C)
    %spritemapEntry(1, $43F8, $00, 0, 0, 3, 5, $7E)
    %spritemapEntry(1, $43F8, $08, 0, 0, 3, 5, $9A)
    %spritemapEntry(1, $43F8, $10, 0, 0, 3, 5, $9C)

UNUSED_EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_8DA7F5:
    %spritemapEntry(1, $43F8, $C0, 0, 0, 3, 5, $9C)

EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_4:
    dw $0007
    %spritemapEntry(0, $1FD, $F2, 0, 0, 3, 5, $43)
    %spritemapEntry(0, $1FF, $F3, 0, 0, 3, 5, $43)
    %spritemapEntry(0, $1FA, $F4, 0, 0, 3, 5, $43)
    %spritemapEntry(0, $1FA, $F9, 0, 0, 3, 5, $43)
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 5, $7E)
    %spritemapEntry(1, $43F8, $00, 0, 0, 3, 5, $9A)
    %spritemapEntry(1, $43F8, $08, 0, 0, 3, 5, $9C)

EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_5:
    dw $0007
    %spritemapEntry(0, $1FE, $F2, 0, 0, 3, 5, $43)
    %spritemapEntry(0, $00, $F3, 0, 0, 3, 5, $43)
    %spritemapEntry(0, $1FB, $F4, 0, 0, 3, 5, $43)
    %spritemapEntry(0, $1FB, $F9, 0, 0, 3, 5, $43)
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 5, $7E)
    %spritemapEntry(1, $43F8, $00, 0, 0, 3, 5, $9A)
    %spritemapEntry(1, $43F8, $08, 0, 0, 3, 5, $9C)

EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_6:
    dw $0006
    %spritemapEntry(0, $1FA, $F4, 0, 0, 3, 5, $25)
    %spritemapEntry(0, $1FD, $F2, 0, 0, 3, 5, $25)
    %spritemapEntry(0, $1FA, $F9, 0, 0, 3, 5, $25)
    %spritemapEntry(0, $1FF, $F3, 0, 0, 3, 5, $25)
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 5, $9A)
    %spritemapEntry(1, $43F8, $00, 0, 0, 3, 5, $9C)

EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_7:
    dw $0006
    %spritemapEntry(0, $1FC, $EC, 0, 0, 3, 5, $25)
    %spritemapEntry(0, $1F8, $F2, 0, 0, 3, 5, $25)
    %spritemapEntry(0, $1FC, $F5, 0, 0, 3, 5, $25)
    %spritemapEntry(0, $00, $F0, 0, 0, 3, 5, $25)
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 5, $9A)
    %spritemapEntry(1, $43F8, $00, 0, 0, 3, 5, $9C)

EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_8:
    dw $0005
    %spritemapEntry(0, $1FC, $E8, 0, 0, 3, 5, $25)
    %spritemapEntry(0, $1F7, $EF, 0, 0, 3, 5, $25)
    %spritemapEntry(0, $1FB, $F5, 0, 0, 3, 5, $25)
    %spritemapEntry(0, $01, $EE, 0, 0, 3, 5, $25)
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 5, $9C)

EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_9:
    dw $0005
    %spritemapEntry(0, $1FC, $E8, 0, 0, 3, 5, $25)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 3, 5, $25)
    %spritemapEntry(0, $1FD, $F5, 0, 0, 3, 5, $25)
    %spritemapEntry(0, $02, $EE, 0, 0, 3, 5, $25)
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 5, $9C)

EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_A:
    dw $0004
    %spritemapEntry(0, $1FC, $E8, 0, 0, 3, 5, $25)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 3, 5, $25)
    %spritemapEntry(0, $1FD, $F5, 0, 0, 3, 5, $25)
    %spritemapEntry(0, $02, $ED, 0, 0, 3, 5, $25)

EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_B:
    dw $0004
    %spritemapEntry(0, $02, $ED, 0, 0, 3, 5, $25)
    %spritemapEntry(0, $1FC, $E8, 0, 0, 3, 5, $25)
    %spritemapEntry(0, $1FD, $F5, 0, 0, 3, 5, $43)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 3, 5, $43)

EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_C:
    dw $0004
    %spritemapEntry(0, $02, $ED, 0, 0, 3, 5, $43)
    %spritemapEntry(0, $1FC, $E8, 0, 0, 3, 5, $43)
    %spritemapEntry(0, $1FD, $F5, 0, 0, 3, 5, $40)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 3, 5, $40)

EnemyProjSpritemaps_NoobTubeReleasedAirBubbles_D:
    dw $0002
    %spritemapEntry(0, $02, $ED, 0, 0, 3, 5, $40)
    %spritemapEntry(0, $1FC, $E8, 0, 0, 3, 5, $40)

EnemyProjSpritemaps_CacatacSpikes_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $11B)

EnemyProjSpritemaps_CacatacSpikes_1:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $10E)

EnemyProjSpritemaps_CacatacSpikes_2:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $10F)

EnemyProjSpritemaps_CacatacSpikes_3:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 3, 0, $10E)

EnemyProjSpritemaps_CacatacSpikes_4:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 3, 0, $11B)

EnemyProjSpritemaps_CacatacSpikes_5:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 0, 3, 0, $11B)

EnemyProjSpritemaps_CacatacSpikes_6:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 0, 3, 0, $10E)

EnemyProjSpritemaps_CacatacSpikes_7:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 0, 3, 0, $10F)

EnemyProjSpritemaps_CacatacSpikes_8:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 1, 3, 0, $10E)

EnemyProjSpritemaps_CacatacSpikes_9:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 1, 3, 0, $11B)

UNUSED_EnemyProjSpritemaps_StokeProjectile_0_8DA94E:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $11E)

UNUSED_EnemyProjSpritemaps_StokeProjectile_1_8DA955:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $11D)

UNUSED_EnemyProjSpritemaps_0_8DA95C:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $126)

UNUSED_EnemyProjSpritemaps_1_8DA963:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $128)

UNUSED_EnemyProjSpritemaps_2_8DA96A:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $10C)

UNUSED_EnemyProjSpritemaps_3_8DA971:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $10E)

UNUSED_EnemyProjSpritemaps_4_8DA978:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $12C)

UNUSED_EnemyProjSpritemaps_5_8DA97F:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $13E)

UNUSED_EnemyProjSpritemaps_6_8DA986:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $12F)

UNUSED_EnemyProjSpritemaps_7_8DA98D:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $12E)

EnemyProjSpritemaps_SporeSpawnsStalk:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 1, $140)

EnemyProjSpritemaps_SporeSpawners_0:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10C)

EnemyProjSpritemaps_SporeSpawners_1:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10E)

EnemyProjSpritemaps_SporeSpawners_2:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $12C)

EnemyProjSpritemaps_Spores_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 7, $13E)

EnemyProjSpritemaps_Spores_1:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 7, $12F)

EnemyProjSpritemaps_Spores_2:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 7, $12E)

UNUSED_EnemyProjSpritemaps_0_8DA9C5:
    dw $0018
    %spritemapEntry(1, $00, $26, 0, 1, 2, 0, $14E)
    %spritemapEntry(1, $10, $26, 0, 1, 2, 0, $14C)
    %spritemapEntry(1, $20, $26, 0, 1, 2, 0, $14A)
    %spritemapEntry(1, $00, $16, 0, 1, 2, 0, $148)
    %spritemapEntry(1, $10, $16, 0, 1, 2, 0, $146)
    %spritemapEntry(1, $20, $16, 0, 1, 2, 0, $144)
    %spritemapEntry(1, $1F0, $26, 0, 0, 2, 0, $14E)
    %spritemapEntry(1, $1E0, $26, 0, 0, 2, 0, $14C)
    %spritemapEntry(1, $1D0, $26, 0, 0, 2, 0, $14A)
    %spritemapEntry(1, $1F0, $16, 0, 0, 2, 0, $148)
    %spritemapEntry(1, $1E0, $16, 0, 0, 2, 0, $146)
    %spritemapEntry(1, $1D0, $16, 0, 0, 2, 0, $144)
    %spritemapEntry(1, $00, $DA, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $10, $DA, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $20, $DA, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $00, $CA, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $10, $CA, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $20, $CA, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1F0, $DA, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $1E0, $DA, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1D0, $DA, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F0, $CA, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1E0, $CA, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1D0, $CA, 0, 0, 2, 0, $100)

UNUSED_EnemyProjSpritemaps_1_8DA93F:
    dw $0018
    %spritemapEntry(1, $00, $28, 0, 1, 2, 0, $14E)
    %spritemapEntry(1, $10, $28, 0, 1, 2, 0, $14C)
    %spritemapEntry(1, $20, $28, 0, 1, 2, 0, $14A)
    %spritemapEntry(1, $00, $18, 0, 1, 2, 0, $148)
    %spritemapEntry(1, $10, $18, 0, 1, 2, 0, $146)
    %spritemapEntry(1, $20, $18, 0, 1, 2, 0, $144)
    %spritemapEntry(1, $1F0, $28, 0, 0, 2, 0, $14E)
    %spritemapEntry(1, $1E0, $28, 0, 0, 2, 0, $14C)
    %spritemapEntry(1, $1D0, $28, 0, 0, 2, 0, $14A)
    %spritemapEntry(1, $1F0, $18, 0, 0, 2, 0, $148)
    %spritemapEntry(1, $1E0, $18, 0, 0, 2, 0, $146)
    %spritemapEntry(1, $1D0, $18, 0, 0, 2, 0, $144)
    %spritemapEntry(1, $00, $D8, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $10, $D8, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $20, $D8, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $00, $C8, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $10, $C8, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $20, $C8, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1F0, $D8, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $1E0, $D8, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1D0, $D8, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F0, $C8, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1E0, $C8, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1D0, $C8, 0, 0, 2, 0, $100)

EnemyProjSpritemaps_Namihe_Fune_Fireball_0:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10A)

EnemyProjSpritemaps_Namihe_Fune_Fireball_1:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10C)

EnemyProjSpritemaps_Namihe_Fune_Fireball_2:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10E)

EnemyProjSpritemaps_Namihe_Fune_Fireball_3:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $10A)

EnemyProjSpritemaps_Namihe_Fune_Fireball_4:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $10C)

EnemyProjSpritemaps_Namihe_Fune_Fireball_5:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $10E)

UNUSED_EnemyProjSpritemaps_0_8DAAE3:
    dw $0004
    %spritemapEntry(0, $1F8, $00, 0, 1, 2, 0, $12F)
    %spritemapEntry(0, $00, $00, 0, 1, 2, 0, $12E)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $12D)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $12C)

UNUSED_EnemyProjSpritemaps_1_8DAAF9:
    dw $0004
    %spritemapEntry(0, $00, $00, 0, 0, 2, 0, $12F)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 0, $12E)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $12D)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $12C)

EnemyProjSpritemaps_MagdolliteFlame_0:
    dw $0004
    %spritemapEntry(0, $00, $00, 0, 0, 2, 0, $12F)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 0, $12E)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $12D)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $12C)

EnemyProjSpritemaps_MagdolliteFlame_1:
    dw $0004
    %spritemapEntry(0, $1F8, $00, 0, 1, 2, 0, $12F)
    %spritemapEntry(0, $00, $00, 0, 1, 2, 0, $12E)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $12D)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $12C)

EnemyProjSpritemaps_DustCloud_Explosion_0:
    dw $0004
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $00, $00, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 5, $2B)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $2B)

EnemyProjSpritemaps_DustCloud_Explosion_1:
    dw $0004
    %spritemapEntry(0, $02, $F3, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $01, $FF, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $1F7, $FF, 0, 0, 3, 5, $2B)
    %spritemapEntry(0, $1F6, $F3, 0, 0, 3, 5, $2B)

EnemyProjSpritemaps_DustCloud_Explosion_2:
    dw $0004
    %spritemapEntry(0, $05, $EE, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $03, $FD, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $1F5, $FD, 0, 0, 3, 5, $2B)
    %spritemapEntry(0, $1F3, $EE, 0, 0, 3, 5, $2B)

EnemyProjSpritemaps_DustCloud_Explosion_3:
    dw $0004
    %spritemapEntry(0, $07, $EC, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $05, $FB, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $1F3, $FB, 0, 0, 3, 5, $2B)
    %spritemapEntry(0, $1F1, $EC, 0, 0, 3, 5, $2B)

EnemyProjSpritemaps_DustCloud_Explosion_4:
    dw $0004
    %spritemapEntry(0, $09, $EA, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $07, $FA, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $1F1, $FA, 0, 0, 3, 5, $2B)
    %spritemapEntry(0, $1EF, $EA, 0, 0, 3, 5, $2B)

EnemyProjSpritemaps_DustCloud_Explosion_5:
    dw $0004
    %spritemapEntry(0, $0A, $EA, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $08, $F9, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $1F0, $F9, 0, 0, 3, 5, $2B)
    %spritemapEntry(0, $1EE, $EA, 0, 0, 3, 5, $2B)

EnemyProjSpritemaps_DustCloud_Explosion_6:
    dw $0004
    %spritemapEntry(0, $0C, $EB, 0, 1, 3, 5, $2A)
    %spritemapEntry(0, $09, $FA, 0, 1, 3, 5, $2A)
    %spritemapEntry(0, $1EF, $FA, 0, 0, 3, 5, $2A)
    %spritemapEntry(0, $1EC, $EB, 0, 0, 3, 5, $2A)

EnemyProjSpritemaps_DustCloud_Explosion_7:
    dw $0004
    %spritemapEntry(0, $0E, $EC, 0, 1, 3, 5, $2A)
    %spritemapEntry(0, $0A, $FC, 0, 1, 3, 5, $2A)
    %spritemapEntry(0, $1EE, $FC, 0, 0, 3, 5, $2A)
    %spritemapEntry(0, $1EA, $EC, 0, 0, 3, 5, $2A)

EnemyProjSpritemaps_DustCloud_Explosion_8:
    dw $0004
    %spritemapEntry(0, $10, $ED, 0, 1, 3, 5, $29)
    %spritemapEntry(0, $0B, $FE, 0, 1, 3, 5, $29)
    %spritemapEntry(0, $1ED, $FE, 0, 0, 3, 5, $29)
    %spritemapEntry(0, $1E8, $ED, 0, 0, 3, 5, $29)

EnemyProjSpritemaps_DustCloud_Explosion_9:
    dw $0004
    %spritemapEntry(0, $12, $EE, 0, 1, 3, 5, $29)
    %spritemapEntry(0, $0C, $00, 0, 1, 3, 5, $29)
    %spritemapEntry(0, $1EC, $00, 0, 0, 3, 5, $29)
    %spritemapEntry(0, $1E6, $EE, 0, 0, 3, 5, $29)

EnemyProjSpritemaps_DustCloud_Explosion_A:
    dw $0004
    %spritemapEntry(0, $13, $F0, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $0D, $02, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $1E5, $F0, 0, 0, 3, 5, $28)
    %spritemapEntry(0, $1EB, $02, 0, 0, 3, 5, $28)

EnemyProjSpritemaps_DustCloud_Explosion_B:
    dw $0004
    %spritemapEntry(0, $14, $F2, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $0E, $04, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $1E4, $F2, 0, 0, 3, 5, $28)
    %spritemapEntry(0, $1EA, $04, 0, 0, 3, 5, $28)

EnemyProjSpritemaps_DustCloud_Explosion_C:
    dw $0004
    %spritemapEntry(0, $15, $F5, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $0F, $07, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $1E3, $F5, 0, 0, 3, 5, $28)
    %spritemapEntry(0, $1E9, $07, 0, 0, 3, 5, $28)

EnemyProjSpritemaps_DustCloud_Explosion_D:
    dw $0004
    %spritemapEntry(0, $16, $F9, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $10, $0B, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $1E2, $F9, 0, 0, 3, 5, $28)
    %spritemapEntry(0, $1E8, $0B, 0, 0, 3, 5, $28)

EnemyProjSpritemaps_DustCloud_Explosion_E:
    dw $0004
    %spritemapEntry(0, $17, $03, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $11, $11, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $1E1, $03, 0, 0, 3, 5, $28)
    %spritemapEntry(0, $1E7, $11, 0, 0, 3, 5, $28)

EnemyProjSpritemaps_DustCloud_Explosion_F:
    dw $0004
    %spritemapEntry(0, $18, $0A, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $12, $18, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $1E0, $0A, 0, 0, 3, 5, $28)
    %spritemapEntry(0, $1E6, $18, 0, 0, 3, 5, $28)

EnemyProjSpritemaps_Common_BigDustCloud_0:
    dw $0001
    %spritemapEntry(0, $1F7, $F7, 0, 0, 3, 5, $48)

EnemyProjSpritemaps_Common_BigDustCloud_1:
    dw $0002
    %spritemapEntry(0, $01, $01, 0, 0, 3, 5, $48)
    %spritemapEntry(1, $1F3, $F3, 0, 0, 3, 5, $7C)

EnemyProjSpritemaps_Common_BigDustCloud_2:
    dw $0003
    %spritemapEntry(1, $1FD, $FD, 0, 0, 3, 5, $7C)
    %spritemapEntry(0, $1F7, $01, 0, 0, 3, 5, $48)
    %spritemapEntry(1, $1F3, $F3, 0, 0, 3, 5, $7E)

EnemyProjSpritemaps_Common_BigDustCloud_3:
    dw $0004
    %spritemapEntry(0, $01, $F7, 0, 0, 3, 5, $48)
    %spritemapEntry(1, $1FD, $FD, 0, 0, 3, 5, $7E)
    %spritemapEntry(1, $1F3, $FD, 0, 0, 3, 5, $7C)
    %spritemapEntry(1, $1F3, $F3, 0, 0, 3, 5, $9A)

EnemyProjSpritemaps_DustCloud_Explosion_10:
    dw $0004
    %spritemapEntry(1, $1FD, $F3, 0, 0, 3, 5, $7C)
    %spritemapEntry(1, $1FD, $FD, 0, 0, 3, 5, $9A)
    %spritemapEntry(1, $1F3, $FD, 0, 0, 3, 5, $7E)
    %spritemapEntry(1, $1F3, $F3, 0, 0, 3, 5, $9C)

EnemyProjSpritemaps_DustCloud_Explosion_11:
    dw $0003
    %spritemapEntry(1, $1FD, $F3, 0, 0, 3, 5, $7E)
    %spritemapEntry(1, $1FD, $FD, 0, 0, 3, 5, $9C)
    %spritemapEntry(1, $1F3, $FD, 0, 0, 3, 5, $9A)

EnemyProjSpritemaps_DustCloud_Explosion_12:
    dw $0002
    %spritemapEntry(1, $1FD, $F3, 0, 0, 3, 5, $9A)
    %spritemapEntry(1, $1F3, $FD, 0, 0, 3, 5, $9C)

EnemyProjSpritemaps_DustCloud_Explosion_13:
    dw $0001
    %spritemapEntry(1, $1FD, $F3, 0, 0, 3, 5, $9C)

EnemyProjSpritemaps_DustCloud_Explosion_14:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $6B)

EnemyProjSpritemaps_DustCloud_Explosion_15:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $6C)

EnemyProjSpritemaps_DustCloud_Explosion_16:
    dw $0002
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 5, $6B)
    %spritemapEntry(0, $00, $FC, 0, 0, 3, 5, $6B)

EnemyProjSpritemaps_DustCloud_Explosion_17:
    dw $0002
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 5, $6C)
    %spritemapEntry(0, $00, $FC, 0, 0, 3, 5, $6C)

EnemyProjSpritemaps_DustCloud_Explosion_18:
    dw $0003
    %spritemapEntry(0, $1F4, $FC, 0, 0, 3, 5, $6C)
    %spritemapEntry(0, $04, $FC, 0, 0, 3, 5, $6C)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $6C)

EnemyProjSpritemaps_DustCloud_Explosion_19:
    dw $0003
    %spritemapEntry(0, $04, $FC, 0, 0, 3, 5, $6B)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 3, 5, $6B)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $6B)

EnemyProjSpritemaps_DustCloud_Explosion_1A:
    dw $0004
    %spritemapEntry(0, $08, $FC, 0, 0, 3, 5, $6C)
    %spritemapEntry(0, $00, $FC, 0, 0, 3, 5, $6C)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 5, $6C)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 3, 5, $6C)

EnemyProjSpritemaps_DustCloud_Explosion_1B:
    dw $0004
    %spritemapEntry(0, $08, $FC, 0, 0, 3, 5, $6B)
    %spritemapEntry(0, $00, $FC, 0, 0, 3, 5, $6B)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 5, $6B)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 3, 5, $6B)

EnemyProjSpritemaps_DustCloud_Explosion_1C:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $25)

EnemyProjSpritemaps_DustCloud_Explosion_1D:
    dw $0003
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 5, $25)
    %spritemapEntry(0, $1FA, $F6, 0, 0, 3, 5, $25)
    %spritemapEntry(0, $1FC, $FB, 0, 0, 3, 5, $25)

EnemyProjSpritemaps_DustCloud_Explosion_1E:
    dw $0003
    %spritemapEntry(0, $01, $F7, 0, 0, 3, 5, $25)
    %spritemapEntry(0, $1F9, $F4, 0, 0, 3, 5, $25)
    %spritemapEntry(0, $1FB, $FA, 0, 0, 3, 5, $25)

EnemyProjSpritemaps_DustCloud_Explosion_1F:
    dw $0003
    %spritemapEntry(0, $01, $F5, 0, 0, 3, 5, $43)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 5, $43)
    %spritemapEntry(0, $1FA, $F1, 0, 0, 3, 5, $43)

EnemyProjSpritemaps_DustCloud_Explosion_20:
    dw $0003
    %spritemapEntry(0, $01, $F3, 0, 0, 3, 5, $43)
    %spritemapEntry(0, $1FC, $F5, 0, 0, 3, 5, $43)
    %spritemapEntry(0, $1FA, $EE, 0, 0, 3, 5, $43)

EnemyProjSpritemaps_DustCloud_Explosion_21:
    dw $0003
    %spritemapEntry(0, $00, $F0, 0, 0, 3, 5, $40)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 3, 5, $40)
    %spritemapEntry(0, $1FA, $ED, 0, 0, 3, 5, $40)

EnemyProjSpritemaps_DustCloud_Explosion_22:
    dw $0003
    %spritemapEntry(0, $00, $EE, 0, 0, 3, 5, $40)
    %spritemapEntry(0, $1FC, $F2, 0, 0, 3, 5, $40)
    %spritemapEntry(0, $1FA, $EC, 0, 0, 3, 5, $40)

EnemyProjSpritemaps_DustCloud_Explosion_23:
    dw $0002
    %spritemapEntry(0, $00, $EC, 0, 0, 3, 5, $40)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 3, 5, $40)

EnemyProjSpritemaps_DustCloud_Explosion_24:
    dw $0001
    %spritemapEntry(0, $1FC, $EE, 0, 0, 3, 5, $40)

EnemyProjSpritemaps_DustCloud_Explosion_25:
    dw $0004
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 5, $6F)

EnemyProjSpritemaps_DustCloud_Explosion_26:
    dw $0004
    %spritemapEntry(0, $08, $E8, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $00, $E8, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F8, $E8, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F0, $E8, 0, 0, 3, 5, $6F)

EnemyProjSpritemaps_DustCloud_Explosion_27:
    dw $0004
    %spritemapEntry(0, $08, $F0, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $00, $F0, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F0, $F0, 0, 0, 3, 5, $6F)

EnemyProjSpritemaps_DustCloud_Explosion_28:
    dw $0004
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 5, $6F)

EnemyProjSpritemaps_DustCloud_Explosion_29:
    dw $0004
    %spritemapEntry(0, $08, $00, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F0, $00, 0, 0, 3, 5, $6F)

EnemyProjSpritemaps_DustCloud_Explosion_2A:
    dw $0004
    %spritemapEntry(0, $08, $08, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $00, $08, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F8, $08, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F0, $08, 0, 0, 3, 5, $6F)

EnemyProjSpritemaps_DustCloud_Explosion_2B:
    dw $0004
    %spritemapEntry(0, $08, $10, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $00, $10, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F8, $10, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F0, $10, 0, 0, 3, 5, $6F)

EnemyProjSpritemaps_DustCloud_Explosion_2C:
    dw $0004
    %spritemapEntry(0, $08, $18, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $00, $18, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F8, $18, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F0, $18, 0, 0, 3, 5, $6F)

EnemyProjSpritemaps_DustCloud_Explosion_2D:
    dw $0002
    %spritemapEntry(0, $00, $FC, 0, 0, 3, 5, $BF)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 5, $BE)

EnemyProjSpritemaps_DustCloud_Explosion_2E:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 5, $BE)

EnemyProjSpritemaps_DustCloud_Explosion_2F:
    dw $0002
    %spritemapEntry(1, $1F8, $FC, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $F4, 0, 0, 3, 5, $BE)

EnemyProjSpritemaps_DustCloud_Explosion_30:
    dw $0002
    %spritemapEntry(1, $1F8, $00, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 3, 5, $BE)

EnemyProjSpritemaps_DustCloud_Explosion_31:
    dw $0003
    %spritemapEntry(1, $1F8, $04, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $EC, 0, 0, 3, 5, $BE)

EnemyProjSpritemaps_DustCloud_Explosion_32:
    dw $0003
    %spritemapEntry(1, $1F8, $08, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $E8, 0, 0, 3, 5, $BE)

EnemyProjSpritemaps_DustCloud_Explosion_33:
    dw $0004
    %spritemapEntry(1, $1F8, $0C, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $00, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $E4, 0, 0, 3, 5, $BE)

EnemyProjSpritemaps_DustCloud_Explosion_34:
    dw $0004
    %spritemapEntry(1, $1F8, $10, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $00, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $E0, 0, 0, 3, 5, $BE)

EnemyProjSpritemaps_DustCloud_Explosion_35:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $53)

EnemyProjSpritemaps_DustCloud_Explosion_36:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $52)

EnemyProjSpritemaps_DustCloud_Explosion_37:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $51)

EnemyProjSpritemaps_DustCloud_Explosion_38:
    dw $0004
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 6, $50)
    %spritemapEntry(0, $00, $00, 1, 1, 3, 6, $50)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 6, $50)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 6, $50)

EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_0:
    dw $0003
    %spritemapEntry(0, $00, $0C, 0, 0, 3, 5, $5B)
    %spritemapEntry(0, $08, $EC, 0, 0, 3, 5, $5B)
    %spritemapEntry(0, $1F0, $F4, 0, 0, 3, 5, $5B)

EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_1:
    dw $0003
    %spritemapEntry(0, $1FD, $0A, 0, 0, 3, 5, $5C)
    %spritemapEntry(0, $06, $EE, 0, 0, 3, 5, $5C)
    %spritemapEntry(0, $1F2, $F6, 0, 0, 3, 5, $5C)

EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_2:
    dw $0003
    %spritemapEntry(0, $1FC, $08, 0, 0, 3, 5, $5C)
    %spritemapEntry(0, $04, $F0, 0, 0, 3, 5, $5C)
    %spritemapEntry(0, $1F4, $F8, 0, 0, 3, 5, $5C)

EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_3:
    dw $0003
    %spritemapEntry(0, $02, $F2, 0, 0, 3, 5, $5D)
    %spritemapEntry(0, $1FB, $06, 0, 0, 3, 5, $5D)
    %spritemapEntry(0, $1F6, $FA, 0, 0, 3, 5, $5D)

EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_4:
    dw $0003
    %spritemapEntry(0, $1FB, $04, 0, 0, 3, 5, $5D)
    %spritemapEntry(0, $1F8, $FB, 0, 0, 3, 5, $5D)
    %spritemapEntry(0, $00, $F4, 0, 0, 3, 5, $5D)

EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_5:
    dw $0003
    %spritemapEntry(0, $1FB, $02, 0, 0, 3, 5, $5D)
    %spritemapEntry(0, $1FA, $FA, 0, 0, 3, 5, $5D)
    %spritemapEntry(0, $00, $F6, 0, 0, 3, 5, $5D)

EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_6:
    dw $0003
    %spritemapEntry(0, $00, $EC, 1, 0, 3, 5, $5B)
    %spritemapEntry(0, $08, $0C, 1, 0, 3, 5, $5B)
    %spritemapEntry(0, $1F0, $04, 1, 0, 3, 5, $5B)

EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_7:
    dw $0003
    %spritemapEntry(0, $1FE, $EE, 1, 0, 3, 5, $5C)
    %spritemapEntry(0, $06, $0A, 1, 0, 3, 5, $5C)
    %spritemapEntry(0, $1F2, $02, 1, 0, 3, 5, $5C)

EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_8:
    dw $0003
    %spritemapEntry(0, $04, $08, 1, 0, 3, 5, $5C)
    %spritemapEntry(0, $1F4, $00, 1, 0, 3, 5, $5C)
    %spritemapEntry(0, $1FD, $F0, 1, 0, 3, 5, $5C)

EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_9:
    dw $0003
    %spritemapEntry(0, $02, $06, 1, 0, 3, 5, $5D)
    %spritemapEntry(0, $1FC, $F2, 1, 0, 3, 5, $5D)
    %spritemapEntry(0, $1F6, $FE, 1, 0, 3, 5, $5D)

EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_A:
    dw $0003
    %spritemapEntry(0, $1FC, $F4, 1, 0, 3, 5, $5D)
    %spritemapEntry(0, $1F8, $FC, 1, 0, 3, 5, $5D)
    %spritemapEntry(0, $00, $04, 1, 0, 3, 5, $5D)

EnemyProjSpritemaps_DrayTurretProj_DustCloud_Explosion_B:
    dw $0003
    %spritemapEntry(0, $1FC, $F6, 1, 0, 3, 5, $5D)
    %spritemapEntry(0, $1FA, $FD, 1, 0, 3, 5, $5D)
    %spritemapEntry(0, $00, $02, 1, 0, 3, 5, $5D)

EnemyProjSpritemaps_Common_SmallExplosion_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $5F)

EnemyProjSpritemaps_Common_SmallExplosion_1:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $8A)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $8A)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $8A)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $8A)

EnemyProjSpritemaps_Common_SmallExplosion_2:
    dw $0004
    %spritemapEntry(1, $00, $00, 1, 1, 3, 5, $90)
    %spritemapEntry(1, $1F0, $00, 1, 0, 3, 5, $90)
    %spritemapEntry(1, $00, $F0, 0, 1, 3, 5, $90)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 5, $90)

EnemyProjSpritemaps_Common_SmallExplosion_3:
    dw $0004
    %spritemapEntry(1, $00, $00, 1, 1, 3, 5, $92)
    %spritemapEntry(1, $1F0, $00, 1, 0, 3, 5, $92)
    %spritemapEntry(1, $00, $F0, 0, 1, 3, 5, $92)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 5, $92)

EnemyProjSpritemaps_Common_SmallExplosion_4:
    dw $0004
    %spritemapEntry(1, $00, $00, 1, 1, 3, 5, $94)
    %spritemapEntry(1, $1F0, $00, 1, 0, 3, 5, $94)
    %spritemapEntry(1, $00, $F0, 0, 1, 3, 5, $94)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 5, $94)

EnemyProjSpritemaps_Common_SmallExplosion_5:
    dw $0004
    %spritemapEntry(1, $00, $00, 1, 1, 3, 5, $96)
    %spritemapEntry(1, $1F0, $00, 1, 0, 3, 5, $96)
    %spritemapEntry(1, $00, $F0, 0, 1, 3, 5, $96)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 5, $96)

EnemyProjSpritemaps_DustCloud_Explosion_39:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $8B)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $8B)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $8B)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $8B)

EnemyProjSpritemaps_DustCloud_Explosion_3A:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $7A)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $7A)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $7A)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $7A)

EnemyProjSpritemaps_DustCloud_Explosion_3B:
    dw $0004
    %spritemapEntry(1, $00, $00, 1, 1, 3, 5, $70)
    %spritemapEntry(1, $1F0, $00, 1, 0, 3, 5, $70)
    %spritemapEntry(1, $00, $F0, 0, 1, 3, 5, $70)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 5, $70)

EnemyProjSpritemaps_DustCloud_Explosion_3C:
    dw $0004
    %spritemapEntry(1, $00, $00, 1, 1, 3, 5, $72)
    %spritemapEntry(1, $1F0, $00, 1, 0, 3, 5, $72)
    %spritemapEntry(1, $00, $F0, 0, 1, 3, 5, $72)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 5, $72)

EnemyProjSpritemaps_DustCloud_Explosion_3D:
    dw $0004
    %spritemapEntry(1, $00, $00, 1, 1, 3, 5, $74)
    %spritemapEntry(1, $1F0, $00, 1, 0, 3, 5, $74)
    %spritemapEntry(1, $00, $F0, 0, 1, 3, 5, $74)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 5, $74)

UNUSED_EnemyProjSpritemaps_8DB106:
    dw $0004
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 5, $5E)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 5, $5E)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 5, $5E)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $5E)

EnemyProjSpritemaps_DustCloud_Explosion_3E:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $38)

EnemyProjSpritemaps_DustCloud_Explosion_3F:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $39)

EnemyProjSpritemaps_DustCloud_Explosion_40:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $3A)

EnemyProjSpritemaps_DustCloud_Explosion_41:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $3B)

EnemyProjSpritemaps_DustCloud_Explosion_42:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $26)

EnemyProjSpritemaps_DustCloud_Explosion_43:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $27)

EnemyProjSpritemaps_DustCloud_Explosion_44:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $7B)

UNUSED_EnemyProjSpritemaps_8DB14D:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $5F)

EnemyProjSpritemaps_DustCloud_Explosion_45:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $53)

EnemyProjSpritemaps_DustCloud_Explosion_46:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $51)

EnemyProjSpritemaps_DustCloud_Explosion_47:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $60)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $60)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $60)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $60)

EnemyProjSpritemaps_DustCloud_Explosion_48:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $61)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $61)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $61)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $61)

EnemyProjSpritemaps_DustCloud_Explosion_49:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $62)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $62)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $62)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $62)

EnemyProjSpritemaps_DustCloud_Explosion_4A:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $63)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $63)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $63)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $63)

EnemyProjSpritemaps_CeresElevatorPad_DustCloud_Explosion_0:
    dw $0004
    %spritemapEntry(0, $1F2, $FC, 0, 1, 3, 5, $6C)
    %spritemapEntry(0, $06, $FC, 0, 1, 3, 5, $6C)
    %spritemapEntry(0, $00, $FC, 0, 1, 3, 5, $6C)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 5, $6C)

EnemyProjSpritemaps_CeresElevatorPad_DustCloud_Explosion_1:
    dw $0004
    %spritemapEntry(0, $00, $FC, 0, 1, 3, 5, $6E)
    %spritemapEntry(0, $08, $FC, 0, 1, 3, 5, $6D)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 5, $6E)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 3, 5, $6D)

UNUSED_EnemyProjSpritemaps_8DB1E6:
    dw $0004
    %spritemapEntry(0, $1F0, $FE, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $08, $FE, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $00, $FE, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F8, $FE, 0, 0, 3, 5, $6F)

EnemyProjSpritemaps_DustCloud_Explosion_4B:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 5, $7C)

EnemyProjSpritemaps_DustCloud_Explosion_4C:
    dw $0001
    %spritemapEntry(1, $1F8, $F6, 0, 0, 3, 5, $7E)

EnemyProjSpritemaps_DustCloud_Explosion_4D:
    dw $0001
    %spritemapEntry(1, $1F8, $F4, 0, 0, 3, 5, $9A)

EnemyProjSpritemaps_DustCloud_Explosion_4E:
    dw $0001
    %spritemapEntry(1, $1F8, $F2, 0, 0, 3, 5, $9C)

EnemyProjSpritemaps_DustCloud_Explosion_4F:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $48)

EnemyProjSpritemaps_DustCloud_Explosion_50:
    dw $0001
    %spritemapEntry(0, $1FC, $FA, 0, 0, 3, 5, $49)

EnemyProjSpritemaps_DustCloud_Explosion_51:
    dw $0001
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 5, $4A)

EnemyProjSpritemaps_DustCloud_Explosion_52:
    dw $0001
    %spritemapEntry(0, $1FC, $F6, 0, 0, 3, 5, $4B)

EnemyProjSpritemaps_DustCloud_Explosion_53:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $2C)

EnemyProjSpritemaps_DustCloud_Explosion_54:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $2D)

EnemyProjSpritemaps_DustCloud_Explosion_55:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $2E)

EnemyProjSpritemaps_DustCloud_Explosion_56:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $2F)

EnemyProjSpritemaps_Common_Smoke_0:
    dw $0001
    %spritemapEntry(1, $1F8, $F6, 0, 0, 3, 5, $76)

EnemyProjSpritemaps_Common_Smoke_1:
    dw $0001
    %spritemapEntry(1, $1F8, $F4, 0, 0, 3, 5, $78)

EnemyProjSpritemaps_Common_Smoke_2:
    dw $0001
    %spritemapEntry(1, $1F8, $F2, 0, 0, 3, 5, $98)

EnemyProjSpritemaps_Common_Smoke_3:
    dw $0001
    %spritemapEntry(1, $1F8, $F0, 0, 0, 3, 5, $9E)

UNUSED_EnemyProjSpritemaps_0_8DB26C:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $25)

UNUSED_EnemyProjSpritemaps_1_8DB273:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $43)

EnemyProjSpritemaps_MotherBrainsTurretBullets:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $40)

EnemyProjSpritemaps_DustCloud_Explosion_57:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $3E)

EnemyProjSpritemaps_DustCloud_Explosion_58:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $3D)

EnemyProjSpritemaps_DustCloud_Explosion_59:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $41)

EnemyProjSpritemaps_DustCloud_Explosion_5A:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $42)

EnemyProjSpritemaps_DustCloud_Explosion_5B:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $44)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $44)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $44)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $44)

EnemyProjSpritemaps_DustCloud_Explosion_5C:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $45)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $45)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $45)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $45)

EnemyProjSpritemaps_DustCloud_Explosion_5D:
    dw $0004
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $46)
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $46)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $46)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $46)

EnemyProjSpritemaps_DustCloud_Explosion_5E:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $42)

EnemyProjSpritemaps_DustCloud_Explosion_5F:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $4C)

EnemyProjSpritemaps_DustCloud_Explosion_60:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $4D)

EnemyProjSpritemaps_DustCloud_Explosion_61:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $4E)

EnemyProjSpritemaps_DustCloud_Explosion_62:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $4F)

UNUSED_EnemyProjSpritemaps_0_8DB302:
    dw $0002
    %spritemapEntry(0, $1FF, $FC, 0, 0, 3, 5, $55)
    %spritemapEntry(0, $1F7, $FC, 0, 0, 3, 5, $54)

UNUSED_EnemyProjSpritemaps_1_8DB30E:
    dw $0003
    %spritemapEntry(0, $1FA, $F5, 0, 0, 3, 5, $56)
    %spritemapEntry(0, $02, $FD, 0, 0, 3, 5, $58)
    %spritemapEntry(0, $1FA, $FD, 0, 0, 3, 5, $57)

UNUSED_EnemyProjSpritemaps_2_8DB31F:
    dw $0002
    %spritemapEntry(0, $1FD, $F7, 0, 0, 3, 5, $59)
    %spritemapEntry(0, $1FD, $FF, 0, 0, 3, 5, $5A)

UNUSED_EnemyProjSpritemaps_3_8DB32B:
    dw $0003
    %spritemapEntry(0, $1FE, $F5, 0, 1, 3, 5, $56)
    %spritemapEntry(0, $1F6, $FD, 0, 1, 3, 5, $58)
    %spritemapEntry(0, $1FE, $FD, 0, 1, 3, 5, $57)

UNUSED_EnemyProjSpritemaps_4_8DB33C:
    dw $0002
    %spritemapEntry(0, $1F9, $FC, 0, 1, 3, 5, $55)
    %spritemapEntry(0, $01, $FC, 0, 1, 3, 5, $54)

UNUSED_EnemyProjSpritemaps_5_8DB348:
    dw $0003
    %spritemapEntry(0, $1FE, $03, 1, 1, 3, 5, $56)
    %spritemapEntry(0, $1F6, $FB, 1, 1, 3, 5, $58)
    %spritemapEntry(0, $1FE, $FB, 1, 1, 3, 5, $57)

UNUSED_EnemyProjSpritemaps_6_8DB359:
    dw $0002
    %spritemapEntry(0, $1FD, $01, 1, 0, 3, 5, $59)
    %spritemapEntry(0, $1FD, $F9, 1, 0, 3, 5, $5A)

UNUSED_EnemyProjSpritemaps_7_8DB365:
    dw $0003
    %spritemapEntry(0, $1FA, $03, 1, 0, 3, 5, $56)
    %spritemapEntry(0, $02, $FB, 1, 0, 3, 5, $58)
    %spritemapEntry(0, $1FA, $FB, 1, 0, 3, 5, $57)

UNUSED_EnemyProjSpritemaps_8_8DB376:
    dw $0002
    %spritemapEntry(0, $00, $FC, 0, 0, 3, 5, $65)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 5, $64)

UNUSED_EnemyProjSpritemaps_9_8DB382:
    dw $0003
    %spritemapEntry(0, $02, $FE, 0, 0, 3, 5, $68)
    %spritemapEntry(0, $1FA, $FE, 0, 0, 3, 5, $67)
    %spritemapEntry(0, $1FA, $F6, 0, 0, 3, 5, $66)

UNUSED_EnemyProjSpritemaps_A_8DB393:
    dw $0002
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 5, $69)
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 5, $6A)

UNUSED_EnemyProjSpritemaps_B_8DB39F:
    dw $0003
    %spritemapEntry(0, $1F6, $FE, 0, 1, 3, 5, $68)
    %spritemapEntry(0, $1FE, $FE, 0, 1, 3, 5, $67)
    %spritemapEntry(0, $1FE, $F6, 0, 1, 3, 5, $66)

UNUSED_EnemyProjSpritemaps_C_8DB3B0:
    dw $0002
    %spritemapEntry(0, $1F8, $FC, 0, 1, 3, 5, $65)
    %spritemapEntry(0, $00, $FC, 0, 1, 3, 5, $64)

UNUSED_EnemyProjSpritemaps_D_8DB3BC:
    dw $0003
    %spritemapEntry(0, $1F6, $FA, 1, 1, 3, 5, $68)
    %spritemapEntry(0, $1FE, $FA, 1, 1, 3, 5, $67)
    %spritemapEntry(0, $1FE, $02, 1, 1, 3, 5, $66)

UNUSED_EnemyProjSpritemaps_E_8DB3CD:
    dw $0002
    %spritemapEntry(0, $1FC, $00, 1, 0, 3, 5, $69)
    %spritemapEntry(0, $1FC, $F8, 1, 0, 3, 5, $6A)

UNUSED_EnemyProjSpritemaps_F_8DB3D9:
    dw $0003
    %spritemapEntry(0, $02, $FA, 1, 0, 3, 5, $68)
    %spritemapEntry(0, $1FA, $FA, 1, 0, 3, 5, $67)
    %spritemapEntry(0, $1FA, $02, 1, 0, 3, 5, $66)

EnemyProjSpritemaps_DustCloud_Explosion_63:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $3C)

EnemyProjSpritemaps_DustCloud_Explosion_64:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $3D)

EnemyProjSpritemaps_DustCloud_Explosion_65:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $3E)

UNUSED_EnemyProjSpritemaps_8DB3FF:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $3F)

EnemyProjSpritemaps_Common_BigExplosion_0:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $8A)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $8A)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $8A)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $8A)

EnemyProjSpritemaps_Common_BigExplosion_1:
    dw $0004
    %spritemapEntry(1, $4200, $00, 1, 1, 3, 5, $90)
    %spritemapEntry(1, $4200, $F0, 0, 1, 3, 5, $90)
    %spritemapEntry(1, $43F0, $00, 1, 0, 3, 5, $90)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 5, $90)

EnemyProjSpritemaps_Common_BigExplosion_2:
    dw $0004
    %spritemapEntry(1, $4200, $00, 1, 1, 3, 5, $92)
    %spritemapEntry(1, $43F0, $00, 1, 0, 3, 5, $92)
    %spritemapEntry(1, $4200, $F0, 0, 1, 3, 5, $92)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 5, $92)

EnemyProjSpritemaps_Common_BigExplosion_3:
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

EnemyProjSpritemaps_Common_BigExplosion_4:
    dw $0008
    %spritemapEntry(1, $4208, $00, 1, 1, 3, 5, $B5)
    %spritemapEntry(1, $4200, $08, 1, 1, 3, 5, $B3)
    %spritemapEntry(1, $43E8, $00, 1, 0, 3, 5, $B5)
    %spritemapEntry(1, $43F0, $08, 1, 0, 3, 5, $B3)
    %spritemapEntry(1, $4208, $F0, 0, 1, 3, 5, $B5)
    %spritemapEntry(1, $4200, $E8, 0, 1, 3, 5, $B3)
    %spritemapEntry(1, $43E8, $F0, 0, 0, 3, 5, $B5)
    %spritemapEntry(1, $43F0, $E8, 0, 0, 3, 5, $B3)

EnemyProjSpritemaps_Common_BigExplosion_5:
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

EnemyProjSpritemaps_DownwardsShotGate_0:
    dw $0001
    %spritemapEntry(1, $4200, $00, 0, 0, 2, 5, $BE)

EnemyProjSpritemaps_DownwardsShotGate_1:
    dw $0002
    %spritemapEntry(1, $4200, $00, 0, 0, 2, 5, $BE)
    %spritemapEntry(1, $4200, $F0, 0, 0, 2, 5, $BE)

EnemyProjSpritemaps_DownwardsShotGate_2:
    dw $0003
    %spritemapEntry(1, $4200, $00, 0, 0, 2, 5, $BE)
    %spritemapEntry(1, $4200, $F0, 0, 0, 2, 5, $BE)
    %spritemapEntry(1, $4200, $E0, 0, 0, 2, 5, $BE)

EnemyProjSpritemaps_DownwardsShotGate_3:
    dw $0004
    %spritemapEntry(1, $4200, $00, 0, 0, 2, 5, $BE)
    %spritemapEntry(1, $4200, $F0, 0, 0, 2, 5, $BE)
    %spritemapEntry(1, $4200, $E0, 0, 0, 2, 5, $BE)
    %spritemapEntry(1, $4200, $D0, 0, 0, 2, 5, $BE)

EnemyProjSpritemaps_UpwardsShotGate_0:
    dw $0001
    %spritemapEntry(1, $4200, $FF, 0, 0, 2, 5, $BE)

EnemyProjSpritemaps_UpwardsShotGate_1:
    dw $0002
    %spritemapEntry(1, $4200, $0F, 0, 0, 2, 5, $BE)
    %spritemapEntry(1, $4200, $FF, 0, 0, 2, 5, $BE)

EnemyProjSpritemaps_UpwardsShotGate_2:
    dw $0003
    %spritemapEntry(1, $4200, $1F, 0, 0, 2, 5, $BE)
    %spritemapEntry(1, $4200, $0F, 0, 0, 2, 5, $BE)
    %spritemapEntry(1, $4200, $FF, 0, 0, 2, 5, $BE)

EnemyProjSpritemaps_UpwardsShotGate_3:
    dw $0004
    %spritemapEntry(1, $4200, $2F, 0, 0, 2, 5, $BE)
    %spritemapEntry(1, $4200, $1F, 0, 0, 2, 5, $BE)
    %spritemapEntry(1, $4200, $0F, 0, 0, 2, 5, $BE)
    %spritemapEntry(1, $4200, $FF, 0, 0, 2, 5, $BE)

EnemyProjSpritemaps_SaveStationElectricity_0:
    dw $0004
    %spritemapEntry(0, $08, $E0, 0, 1, 3, 5, $CD)
    %spritemapEntry(0, $00, $E0, 0, 1, 3, 5, $6F)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 5, $CD)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 5, $6F)

EnemyProjSpritemaps_SaveStationElectricity_1:
    dw $0004
    %spritemapEntry(0, $08, $E8, 0, 1, 3, 5, $CD)
    %spritemapEntry(0, $00, $E8, 0, 1, 3, 5, $6F)
    %spritemapEntry(0, $1F0, $E8, 0, 0, 3, 5, $CD)
    %spritemapEntry(0, $1F8, $E8, 0, 0, 3, 5, $6F)

EnemyProjSpritemaps_SaveStationElectricity_2:
    dw $0004
    %spritemapEntry(0, $08, $F0, 0, 1, 3, 5, $CD)
    %spritemapEntry(0, $00, $F0, 0, 1, 3, 5, $6F)
    %spritemapEntry(0, $1F0, $F0, 0, 0, 3, 5, $CD)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 3, 5, $6F)

EnemyProjSpritemaps_SaveStationElectricity_3:
    dw $0004
    %spritemapEntry(0, $08, $F8, 0, 1, 3, 5, $CD)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $6F)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 5, $CD)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $6F)

EnemyProjSpritemaps_SaveStationElectricity_4:
    dw $0004
    %spritemapEntry(0, $08, $00, 0, 1, 3, 5, $CD)
    %spritemapEntry(0, $00, $00, 0, 1, 3, 5, $6F)
    %spritemapEntry(0, $1F0, $00, 0, 0, 3, 5, $CD)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 5, $6F)

EnemyProjSpritemaps_SaveStationElectricity_5:
    dw $0004
    %spritemapEntry(0, $08, $08, 0, 1, 3, 5, $CD)
    %spritemapEntry(0, $00, $08, 0, 1, 3, 5, $6F)
    %spritemapEntry(0, $1F0, $08, 0, 0, 3, 5, $CD)
    %spritemapEntry(0, $1F8, $08, 0, 0, 3, 5, $6F)

EnemyProjSpritemaps_SaveStationElectricity_6:
    dw $0004
    %spritemapEntry(0, $08, $10, 0, 1, 3, 5, $CD)
    %spritemapEntry(0, $00, $10, 0, 1, 3, 5, $6F)
    %spritemapEntry(0, $1F0, $10, 0, 0, 3, 5, $CD)
    %spritemapEntry(0, $1F8, $10, 0, 0, 3, 5, $6F)

EnemyProjSpritemaps_SaveStationElectricity_7:
    dw $0004
    %spritemapEntry(0, $08, $18, 0, 1, 3, 5, $CD)
    %spritemapEntry(0, $00, $18, 0, 1, 3, 5, $6F)
    %spritemapEntry(0, $1F0, $18, 0, 0, 3, 5, $CD)
    %spritemapEntry(0, $1F8, $18, 0, 0, 3, 5, $6F)

EnemyProjSpritemaps_BotwoonsBody_UpFacingLeft_0:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $128)

EnemyProjSpritemaps_BotwoonsBody_UpFacingLeft_1:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $12A)

EnemyProjSpritemaps_BotwoonsBody_UpFacingLeft_2:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $12C)

EnemyProjSpritemaps_BotwoonsBody_UpFacingLeft_3:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $12E)

EnemyProjSpritemaps_BotwoonsBody_0:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $148)

EnemyProjSpritemaps_BotwoonsBody_1:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $14A)

EnemyProjSpritemaps_BotwoonsBody_2:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $14C)

EnemyProjSpritemaps_BotwoonsBody_3:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $14E)

EnemyProjSpritemaps_BotwoonsBody_4:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $140)

EnemyProjSpritemaps_BotwoonsBody_5:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $142)

EnemyProjSpritemaps_BotwoonsBody_6:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $144)

EnemyProjSpritemaps_BotwoonsBody_7:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $146)

EnemyProjSpritemaps_BotwoonsBody_8:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $160)

EnemyProjSpritemaps_BotwoonsBody_9:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $162)

EnemyProjSpritemaps_BotwoonsBody_A:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $164)

EnemyProjSpritemaps_BotwoonsBody_B:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $166)

UNUSED_EnemyProjSpritemap_BotwoonsBody_DownFacingLeft_8DB682:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $168)

UNUSED_EnemyProjSpritemap_BotwoonsBody_DownFacingLeft_8DB689:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $16A)

UNUSED_EnemyProjSpritemap_BotwoonsBody_DownFacingLeft_8DB690:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $16C)

UNUSED_EnemyProjSpritemap_BotwoonsBody_DownFacingLeft_8DB697:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $16E)

EnemyProjSpritemaps_BotwoonsBody_C:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $168)

EnemyProjSpritemaps_BotwoonsBody_D:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $16A)

EnemyProjSpritemaps_BotwoonsBody_E:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $16C)

EnemyProjSpritemaps_BotwoonsBody_F:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $16E)

EnemyProjSpritemaps_BotwoonsBody_10:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $160)

EnemyProjSpritemaps_BotwoonsBody_11:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $162)

EnemyProjSpritemaps_BotwoonsBody_12:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $164)

EnemyProjSpritemaps_BotwoonsBody_13:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $166)

EnemyProjSpritemaps_BotwoonsBody_14:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $140)

EnemyProjSpritemaps_BotwoonsBody_15:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $142)

EnemyProjSpritemaps_BotwoonsBody_16:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $144)

EnemyProjSpritemaps_BotwoonsBody_17:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $146)

EnemyProjSpritemaps_BotwoonsBody_18:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $148)

EnemyProjSpritemaps_BotwoonsBody_19:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $14A)

EnemyProjSpritemaps_BotwoonsBody_1A:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $14C)

EnemyProjSpritemaps_BotwoonsBody_1B:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $14E)

EnemyProjSpritemaps_BotwoonsBody_1C:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $128)

EnemyProjSpritemaps_BotwoonsBody_1D:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $12A)

EnemyProjSpritemaps_BotwoonsBody_1E:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $12C)

EnemyProjSpritemaps_BotwoonsBody_1F:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $12E)

EnemyProjSpritemaps_BotwoonsBody_20:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $1A4)

EnemyProjSpritemaps_BotwoonsBody_21:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $1A2)

EnemyProjSpritemaps_BotwoonsBody_22:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $1A0)

EnemyProjSpritemaps_BotwoonsBody_23:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 1, 0, 2, 0, $1A2)

EnemyProjSpritemaps_BotwoonsBody_24:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 1, 0, 2, 0, $1A4)

EnemyProjSpritemaps_BotwoonsBody_25:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 1, 1, 2, 0, $1A2)

EnemyProjSpritemaps_BotwoonsBody_26:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $1A0)

EnemyProjSpritemaps_BotwoonsBody_27:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $1A2)

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_0_8DB762:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 0, 0, $128)

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_1_8DB769:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 0, 0, $12A)

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_2_8DB770:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 0, 0, $12C)

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_3_8DB777:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 0, 0, $12E)

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_4_8DB77E:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 0, 0, $148)

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_5_8DB785:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 0, 0, $14A)

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_6_8DB78C:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 0, 0, $14C)

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_7_8DB793:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 0, 0, $14E)

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_8_8DB79A:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 0, 0, $140)

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_9_8DB7A1:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 0, 0, $142)

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_A_8DB7A8:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 0, 0, $144)

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_B_8DB7AF:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 0, 0, $146)

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_C_8DB7B6:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 0, 0, $160)

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_D_8DB7BD:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 0, 0, $162)

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_E_8DB7C4:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 0, 0, $164)

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_F_8DB7CB:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 0, 0, $166)

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_10_8DB7D2:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 0, 0, $168)

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_11_8DB7D9:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 0, 0, $16A)

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_12_8DB7E0:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 0, 0, $16C)

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_13_8DB7E7:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 0, 0, $16E)

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_14_8DB7EE:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 0, 0, $168)

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_15_8DB7F5:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 0, 0, $16A)

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_16_8DB7FC:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 0, 0, $16C)

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_17_8DB803:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 0, 0, $16E)

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_18_8DB80A:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 0, 0, $160)

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_19_8DB811:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 0, 0, $162)

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_1A_8DB818:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 0, 0, $164)

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_1B_8DB81F:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 0, 0, $166)

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_1C_8DB826:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 0, 0, $140)

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_1D_8DB82D:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 0, 0, $142)

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_1E_8DB834:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 0, 0, $144)

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_1F_8DB83B:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 0, 0, $146)

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_20_8DB842:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 0, 0, $148)

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_21_8DB849:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 0, 0, $14A)

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_22_8DB850:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 0, 0, $14C)

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_23_8DB857:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 0, 0, $14E)

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_24_8DB85E:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 0, 0, $128)

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_25_8DB865:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 0, 0, $12A)

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_26_8DB86C:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 0, 0, $12C)

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_27_8DB873:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 0, 0, $12E)

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_28_8DB87A:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 0, 0, $1A4)

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_29_8DB881:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 0, 0, $1A2)

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_2A_8DB888:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 0, 0, $1A0)

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_2B_8DB88F:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 1, 0, 0, 0, $1A2)

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_2C_8DB896:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 1, 0, 0, 0, $1A4)

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_2D_8DB89D:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 1, 1, 0, 0, $1A2)

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_2E_8DB8A4:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 0, 0, $1A0)

UNUSED_EnemyProjSpritemaps_BotwoonsBodyTail_2F_8DB8AB:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 0, 0, $1A2)

EnemyProjSpritemaps_BotwoonsBody_28:
    dw $0000

EnemyProjSpritemaps_BotwoonsSpit_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 1, $1A8)

EnemyProjSpritemaps_BotwoonsSpit_1:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 1, $1A9)

EnemyProjSpritemaps_BotwoonsSpit_2:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 1, $1AA)

EnemyProjSpritemaps_BotwoonsSpit_3:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 1, $1AB)

EnemyProjSpritemaps_BotwoonsSpit_4:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 1, $1AC)

EnemyProjSpritemaps_YappingMawsBody_0:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10A)

EnemyProjSpritemaps_YappingMawsBody_1:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 1, 0, 2, 0, $10A)

UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_0_8DB8E5:
    dw $0003
    %spritemapEntry(1, $1F0, $00, 0, 0, 3, 5, $76)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 5, $76)
    %spritemapEntry(1, $00, $F8, 0, 0, 3, 5, $76)

UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_1_8DB8F6:
    dw $0003
    %spritemapEntry(1, $04, $F8, 0, 1, 3, 5, $78)
    %spritemapEntry(1, $1EC, $04, 1, 1, 3, 5, $78)
    %spritemapEntry(1, $1EC, $EC, 0, 0, 3, 5, $78)

UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_2_8DB907:
    dw $0007
    %spritemapEntry(0, $1EB, $E2, 0, 0, 3, 5, $2B)
    %spritemapEntry(1, $0C, $F8, 0, 1, 3, 5, $98)
    %spritemapEntry(1, $1E8, $08, 1, 0, 3, 5, $98)
    %spritemapEntry(1, $1E8, $E8, 0, 0, 3, 5, $98)
    %spritemapEntry(0, $0D, $E2, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $03, $03, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $1F5, $03, 0, 0, 3, 5, $2B)

UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_3_8DB92C:
    dw $0007
    %spritemapEntry(0, $1E5, $DC, 0, 0, 3, 5, $2B)
    %spritemapEntry(1, $10, $F8, 0, 1, 3, 5, $9E)
    %spritemapEntry(1, $1E4, $0C, 1, 0, 3, 5, $9E)
    %spritemapEntry(1, $1E4, $E4, 0, 0, 3, 5, $9E)
    %spritemapEntry(0, $13, $DC, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $07, $FD, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $1F1, $FD, 0, 0, 3, 5, $2B)

UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_4_8DB951:
    dw $0007
    %spritemapEntry(0, $1E3, $DA, 0, 0, 3, 5, $2B)
    %spritemapEntry(1, $1E0, $E0, 0, 0, 3, 5, $9A)
    %spritemapEntry(1, $14, $F8, 0, 1, 3, 5, $9A)
    %spritemapEntry(1, $1E0, $10, 1, 0, 3, 5, $9A)
    %spritemapEntry(0, $15, $DA, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $0B, $FA, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $1ED, $FA, 0, 0, 3, 5, $2B)

UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_5_8DB976:
    dw $0007
    %spritemapEntry(0, $1E2, $DA, 0, 0, 3, 5, $2B)
    %spritemapEntry(1, $18, $F8, 0, 1, 3, 5, $9C)
    %spritemapEntry(1, $1DC, $14, 1, 0, 3, 5, $9C)
    %spritemapEntry(1, $1DC, $DC, 0, 0, 3, 5, $9C)
    %spritemapEntry(0, $16, $DA, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $0E, $F9, 0, 1, 3, 5, $2B)
    %spritemapEntry(0, $1EA, $F9, 0, 0, 3, 5, $2B)

UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_6_8DB99B:
    dw $0004
    %spritemapEntry(0, $18, $DB, 0, 1, 3, 5, $2A)
    %spritemapEntry(0, $11, $FC, 0, 1, 3, 5, $2A)
    %spritemapEntry(0, $1E7, $FC, 0, 0, 3, 5, $2A)
    %spritemapEntry(0, $1E0, $DB, 0, 0, 3, 5, $2A)

UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_7_8DB9B1:
    dw $0004
    %spritemapEntry(0, $1A, $DC, 0, 1, 3, 5, $2A)
    %spritemapEntry(0, $12, $FC, 0, 1, 3, 5, $2A)
    %spritemapEntry(0, $1E6, $FC, 0, 0, 3, 5, $2A)
    %spritemapEntry(0, $1DE, $DC, 0, 0, 3, 5, $2A)

UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_8_8DB9C7:
    dw $0004
    %spritemapEntry(0, $1C, $DD, 0, 1, 3, 5, $29)
    %spritemapEntry(0, $13, $FE, 0, 1, 3, 5, $29)
    %spritemapEntry(0, $1E5, $FE, 0, 0, 3, 5, $29)
    %spritemapEntry(0, $1DC, $DD, 0, 0, 3, 5, $29)

UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_9_8DB9DD:
    dw $0004
    %spritemapEntry(0, $1E, $DE, 0, 1, 3, 5, $29)
    %spritemapEntry(0, $14, $00, 0, 1, 3, 5, $29)
    %spritemapEntry(0, $1E4, $00, 0, 0, 3, 5, $29)
    %spritemapEntry(0, $1DA, $DE, 0, 0, 3, 5, $29)

UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_A_8DB9F3:
    dw $0004
    %spritemapEntry(0, $1F, $E0, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $15, $02, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $1D9, $E0, 0, 0, 3, 5, $28)
    %spritemapEntry(0, $1E3, $02, 0, 0, 3, 5, $28)

UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_B_8DBA09:
    dw $0004
    %spritemapEntry(0, $20, $E2, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $16, $04, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $1D8, $E2, 0, 0, 3, 5, $28)
    %spritemapEntry(0, $1E2, $04, 0, 0, 3, 5, $28)

UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_C_8DBA1F:
    dw $0004
    %spritemapEntry(0, $21, $E9, 0, 0, 3, 5, $28)
    %spritemapEntry(0, $17, $0B, 0, 0, 3, 5, $28)
    %spritemapEntry(0, $1E1, $0B, 0, 0, 3, 5, $28)
    %spritemapEntry(0, $1D7, $E9, 0, 0, 3, 5, $28)

UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_D_8DBA35:
    dw $0004
    %spritemapEntry(0, $22, $F1, 0, 0, 3, 5, $28)
    %spritemapEntry(0, $18, $13, 0, 0, 3, 5, $28)
    %spritemapEntry(0, $1E0, $13, 0, 0, 3, 5, $28)
    %spritemapEntry(0, $1D6, $F1, 0, 0, 3, 5, $28)

UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_E_8DBA4B:
    dw $0004
    %spritemapEntry(0, $23, $FB, 0, 0, 3, 5, $28)
    %spritemapEntry(0, $19, $19, 0, 0, 3, 5, $28)
    %spritemapEntry(0, $1DF, $19, 0, 0, 3, 5, $28)
    %spritemapEntry(0, $1D5, $FB, 0, 0, 3, 5, $28)

UNUSED_EnemyProjSpritemaps_EDeathExplo_KillContact_F_8DBA61:
    dw $0004
    %spritemapEntry(0, $1D4, $06, 0, 0, 3, 5, $28)
    %spritemapEntry(0, $1DE, $24, 0, 0, 3, 5, $28)
    %spritemapEntry(0, $1A, $24, 0, 0, 3, 5, $28)
    %spritemapEntry(0, $24, $06, 0, 0, 3, 5, $28)

UNUSED_EnemyProjSpritemaps_0_8DBA77:
    dw $0001
    %spritemapEntry(0, $1F7, $F7, 0, 0, 3, 5, $48)

UNUSED_EnemyProjSpritemaps_1_8DBA7E:
    dw $0002
    %spritemapEntry(0, $01, $01, 0, 0, 3, 5, $48)
    %spritemapEntry(1, $1F3, $F3, 0, 0, 3, 5, $7C)

UNUSED_EnemyProjSpritemaps_2_8DBA8A:
    dw $0003
    %spritemapEntry(1, $1FD, $FD, 0, 0, 3, 5, $7C)
    %spritemapEntry(0, $1F7, $01, 0, 0, 3, 5, $48)
    %spritemapEntry(1, $1F3, $F3, 0, 0, 3, 5, $7E)

UNUSED_EnemyProjSpritemaps_3_8DBA9B:
    dw $0004
    %spritemapEntry(0, $01, $F7, 0, 0, 3, 5, $48)
    %spritemapEntry(1, $1FD, $FD, 0, 0, 3, 5, $7E)
    %spritemapEntry(1, $1F3, $FD, 0, 0, 3, 5, $7C)
    %spritemapEntry(1, $1F3, $F3, 0, 0, 3, 5, $9A)

UNUSED_EnemyProjSpritemaps_4_8DBAB1:
    dw $0004
    %spritemapEntry(1, $1FD, $F3, 0, 0, 3, 5, $7C)
    %spritemapEntry(1, $1FD, $FD, 0, 0, 3, 5, $9A)
    %spritemapEntry(1, $1F3, $FD, 0, 0, 3, 5, $7E)
    %spritemapEntry(1, $1F3, $F3, 0, 0, 3, 5, $9C)

UNUSED_EnemyProjSpritemaps_5_8DBAC7:
    dw $0003
    %spritemapEntry(1, $1FD, $F3, 0, 0, 3, 5, $7E)
    %spritemapEntry(1, $1FD, $FD, 0, 0, 3, 5, $9C)
    %spritemapEntry(1, $1F3, $FD, 0, 0, 3, 5, $9A)

UNUSED_EnemyProjSpritemaps_6_8DBAD8:
    dw $0002
    %spritemapEntry(1, $1FD, $F3, 0, 0, 3, 5, $9A)
    %spritemapEntry(1, $1F3, $FD, 0, 0, 3, 5, $9C)

UNUSED_EnemyProjSpritemaps_7_8DBAE4:
    dw $0001
    %spritemapEntry(1, $1FD, $F3, 0, 0, 3, 5, $9C)

UNUSED_EnemyProjSpritemaps_8_8DBAEB:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $6B)

UNUSED_EnemyProjSpritemaps_9_8DBAF2:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $6C)

UNUSED_EnemyProjSpritemaps_A_8DBAF9:
    dw $0002
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 5, $6B)
    %spritemapEntry(0, $00, $FC, 0, 0, 3, 5, $6B)

UNUSED_EnemyProjSpritemaps_B_8DBB05:
    dw $0002
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 5, $6C)
    %spritemapEntry(0, $00, $FC, 0, 0, 3, 5, $6C)

UNUSED_EnemyProjSpritemaps_C_8DBB11:
    dw $0003
    %spritemapEntry(0, $1F4, $FC, 0, 0, 3, 5, $6C)
    %spritemapEntry(0, $04, $FC, 0, 0, 3, 5, $6C)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $6C)

UNUSED_EnemyProjSpritemaps_D_8DBB22:
    dw $0003
    %spritemapEntry(0, $04, $FC, 0, 0, 3, 5, $6B)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 3, 5, $6B)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $6B)

UNUSED_EnemyProjSpritemaps_E_8DBB33:
    dw $0004
    %spritemapEntry(0, $08, $FC, 0, 0, 3, 5, $6C)
    %spritemapEntry(0, $00, $FC, 0, 0, 3, 5, $6C)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 5, $6C)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 3, 5, $6C)

UNUSED_EnemyProjSpritemaps_F_8DBB49:
    dw $0004
    %spritemapEntry(0, $08, $FC, 0, 0, 3, 5, $6B)
    %spritemapEntry(0, $00, $FC, 0, 0, 3, 5, $6B)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 5, $6B)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 3, 5, $6B)

UNUSED_EnemyProjSpritemaps_10_8DBB5F:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $25)

UNUSED_EnemyProjSpritemaps_11_8DBB66:
    dw $0003
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 5, $25)
    %spritemapEntry(0, $1FA, $F6, 0, 0, 3, 5, $25)
    %spritemapEntry(0, $1FC, $FB, 0, 0, 3, 5, $25)

UNUSED_EnemyProjSpritemaps_12_8DBB77:
    dw $0003
    %spritemapEntry(0, $01, $F7, 0, 0, 3, 5, $25)
    %spritemapEntry(0, $1F9, $F4, 0, 0, 3, 5, $25)
    %spritemapEntry(0, $1FB, $FA, 0, 0, 3, 5, $25)

UNUSED_EnemyProjSpritemaps_13_8DBB88:
    dw $0003
    %spritemapEntry(0, $01, $F5, 0, 0, 3, 5, $43)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 5, $43)
    %spritemapEntry(0, $1FA, $F1, 0, 0, 3, 5, $43)

UNUSED_EnemyProjSpritemaps_14_8DBB99:
    dw $0003
    %spritemapEntry(0, $01, $F3, 0, 0, 3, 5, $43)
    %spritemapEntry(0, $1FC, $F5, 0, 0, 3, 5, $43)
    %spritemapEntry(0, $1FA, $EE, 0, 0, 3, 5, $43)

UNUSED_EnemyProjSpritemaps_15_8DBBAA:
    dw $0003
    %spritemapEntry(0, $00, $F0, 0, 0, 3, 5, $40)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 3, 5, $40)
    %spritemapEntry(0, $1FA, $ED, 0, 0, 3, 5, $40)

UNUSED_EnemyProjSpritemaps_16_8DBBBB:
    dw $0003
    %spritemapEntry(0, $00, $EE, 0, 0, 3, 5, $40)
    %spritemapEntry(0, $1FC, $F2, 0, 0, 3, 5, $40)
    %spritemapEntry(0, $1FA, $EC, 0, 0, 3, 5, $40)

UNUSED_EnemyProjSpritemaps_17_8DBBCC:
    dw $0002
    %spritemapEntry(0, $00, $EC, 0, 0, 3, 5, $40)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 3, 5, $40)

UNUSED_EnemyProjSpritemaps_18_8DBBD8:
    dw $0001
    %spritemapEntry(0, $1FC, $EE, 0, 0, 3, 5, $40)

UNUSED_EnemyProjSpritemaps_19_8DBBDF:
    dw $0004
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 5, $6F)

UNUSED_EnemyProjSpritemaps_1A_8DBBF5:
    dw $0004
    %spritemapEntry(0, $08, $E8, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $00, $E8, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F8, $E8, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F0, $E8, 0, 0, 3, 5, $6F)

UNUSED_EnemyProjSpritemaps_1B_8DBC0B:
    dw $0004
    %spritemapEntry(0, $08, $F0, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $00, $F0, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F0, $F0, 0, 0, 3, 5, $6F)

UNUSED_EnemyProjSpritemaps_1C_8DBC21:
    dw $0004
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 5, $6F)

UNUSED_EnemyProjSpritemaps_1D_8DBC37:
    dw $0004
    %spritemapEntry(0, $08, $00, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F0, $00, 0, 0, 3, 5, $6F)

UNUSED_EnemyProjSpritemaps_1E_8DBC4D:
    dw $0004
    %spritemapEntry(0, $08, $08, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $00, $08, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F8, $08, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F0, $08, 0, 0, 3, 5, $6F)

UNUSED_EnemyProjSpritemaps_1F_8DBC63:
    dw $0004
    %spritemapEntry(0, $08, $10, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $00, $10, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F8, $10, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F0, $10, 0, 0, 3, 5, $6F)

UNUSED_EnemyProjSpritemaps_20_8DBC79:
    dw $0004
    %spritemapEntry(0, $08, $18, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $00, $18, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F8, $18, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F0, $18, 0, 0, 3, 5, $6F)

UNUSED_EnemyProjSpritemaps_21_8DBC8F:
    dw $0002
    %spritemapEntry(0, $00, $FC, 0, 0, 3, 5, $BF)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 5, $BE)

UNUSED_EnemyProjSpritemaps_22_8DBC9B:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 5, $BE)

UNUSED_EnemyProjSpritemaps_23_8DBCA2:
    dw $0002
    %spritemapEntry(1, $1F8, $FC, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $F4, 0, 0, 3, 5, $BE)

UNUSED_EnemyProjSpritemaps_24_8DBCAE:
    dw $0002
    %spritemapEntry(1, $1F8, $00, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 3, 5, $BE)

UNUSED_EnemyProjSpritemaps_25_8DBCBA:
    dw $0003
    %spritemapEntry(1, $1F8, $04, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $EC, 0, 0, 3, 5, $BE)

UNUSED_EnemyProjSpritemaps_26_8DBCCB:
    dw $0003
    %spritemapEntry(1, $1F8, $08, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $E8, 0, 0, 3, 5, $BE)

UNUSED_EnemyProjSpritemaps_27_8DBCDC:
    dw $0004
    %spritemapEntry(1, $1F8, $0C, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $00, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $E4, 0, 0, 3, 5, $BE)

UNUSED_EnemyProjSpritemaps_28_8DBCF2:
    dw $0004
    %spritemapEntry(1, $1F8, $10, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $00, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $1F8, $E0, 0, 0, 3, 5, $BE)

UNUSED_EnemyProjSpritemaps_29_8DBD08:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $53)

UNUSED_EnemyProjSpritemaps_2A_8DBD0F:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $52)

UNUSED_EnemyProjSpritemaps_2B_8DBD16:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $51)

UNUSED_EnemyProjSpritemaps_2C_8DBD1D:
    dw $0004
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 6, $50)
    %spritemapEntry(0, $00, $00, 1, 1, 3, 6, $50)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 6, $50)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 6, $50)

UNUSED_EnemyProjSpritemaps_2D_8DBD33:
    dw $0003
    %spritemapEntry(0, $00, $0C, 0, 0, 3, 5, $5B)
    %spritemapEntry(0, $08, $EC, 0, 0, 3, 5, $5B)
    %spritemapEntry(0, $1F0, $F4, 0, 0, 3, 5, $5B)

UNUSED_EnemyProjSpritemaps_2E_8DBD44:
    dw $0003
    %spritemapEntry(0, $1FD, $0A, 0, 0, 3, 5, $5C)
    %spritemapEntry(0, $06, $EE, 0, 0, 3, 5, $5C)
    %spritemapEntry(0, $1F2, $F6, 0, 0, 3, 5, $5C)

UNUSED_EnemyProjSpritemaps_2F_8DBD55:
    dw $0003
    %spritemapEntry(0, $1FC, $08, 0, 0, 3, 5, $5C)
    %spritemapEntry(0, $04, $F0, 0, 0, 3, 5, $5C)
    %spritemapEntry(0, $1F4, $F8, 0, 0, 3, 5, $5C)

UNUSED_EnemyProjSpritemaps_30_8DBD66:
    dw $0003
    %spritemapEntry(0, $02, $F2, 0, 0, 3, 5, $5D)
    %spritemapEntry(0, $1FB, $06, 0, 0, 3, 5, $5D)
    %spritemapEntry(0, $1F6, $FA, 0, 0, 3, 5, $5D)

UNUSED_EnemyProjSpritemaps_31_8DBD77:
    dw $0003
    %spritemapEntry(0, $1FB, $04, 0, 0, 3, 5, $5D)
    %spritemapEntry(0, $1F8, $FB, 0, 0, 3, 5, $5D)
    %spritemapEntry(0, $00, $F4, 0, 0, 3, 5, $5D)

UNUSED_EnemyProjSpritemaps_32_8DBD88:
    dw $0003
    %spritemapEntry(0, $1FB, $02, 0, 0, 3, 5, $5D)
    %spritemapEntry(0, $1FA, $FA, 0, 0, 3, 5, $5D)
    %spritemapEntry(0, $00, $F6, 0, 0, 3, 5, $5D)

UNUSED_EnemyProjSpritemaps_33_8DBD99:
    dw $0003
    %spritemapEntry(0, $00, $EC, 1, 0, 3, 5, $5B)
    %spritemapEntry(0, $08, $0C, 1, 0, 3, 5, $5B)
    %spritemapEntry(0, $1F0, $04, 1, 0, 3, 5, $5B)

UNUSED_EnemyProjSpritemaps_34_8DBDAA:
    dw $0003
    %spritemapEntry(0, $1FE, $EE, 1, 0, 3, 5, $5C)
    %spritemapEntry(0, $06, $0A, 1, 0, 3, 5, $5C)
    %spritemapEntry(0, $1F2, $02, 1, 0, 3, 5, $5C)

UNUSED_EnemyProjSpritemaps_35_8DBDBB:
    dw $0003
    %spritemapEntry(0, $04, $08, 1, 0, 3, 5, $5C)
    %spritemapEntry(0, $1F4, $00, 1, 0, 3, 5, $5C)
    %spritemapEntry(0, $1FD, $F0, 1, 0, 3, 5, $5C)

UNUSED_EnemyProjSpritemaps_36_8DBDCC:
    dw $0003
    %spritemapEntry(0, $02, $06, 1, 0, 3, 5, $5D)
    %spritemapEntry(0, $1FC, $F2, 1, 0, 3, 5, $5D)
    %spritemapEntry(0, $1F6, $FE, 1, 0, 3, 5, $5D)

UNUSED_EnemyProjSpritemaps_37_8DBDDD:
    dw $0003
    %spritemapEntry(0, $1FC, $F4, 1, 0, 3, 5, $5D)
    %spritemapEntry(0, $1F8, $FC, 1, 0, 3, 5, $5D)
    %spritemapEntry(0, $00, $04, 1, 0, 3, 5, $5D)

UNUSED_EnemyProjSpritemaps_38_8DBDEE:
    dw $0003
    %spritemapEntry(0, $1FC, $F6, 1, 0, 3, 5, $5D)
    %spritemapEntry(0, $1FA, $FD, 1, 0, 3, 5, $5D)
    %spritemapEntry(0, $00, $02, 1, 0, 3, 5, $5D)

EnemyProjSpritemaps_EnemyDeathExplosion_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $5F)

EnemyProjSpritemaps_EnemyDeathExplosion_1:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $8A)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $8A)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $8A)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $8A)

EnemyProjSpritemaps_EnemyDeathExplosion_2:
    dw $0004
    %spritemapEntry(1, $00, $00, 1, 1, 3, 5, $90)
    %spritemapEntry(1, $1F0, $00, 1, 0, 3, 5, $90)
    %spritemapEntry(1, $00, $F0, 0, 1, 3, 5, $90)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 5, $90)

EnemyProjSpritemaps_EnemyDeathExplosion_3:
    dw $0004
    %spritemapEntry(1, $00, $00, 1, 1, 3, 5, $92)
    %spritemapEntry(1, $1F0, $00, 1, 0, 3, 5, $92)
    %spritemapEntry(1, $00, $F0, 0, 1, 3, 5, $92)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 5, $92)

EnemyProjSpritemaps_EnemyDeathExplosion_4:
    dw $0004
    %spritemapEntry(1, $00, $00, 1, 1, 3, 5, $94)
    %spritemapEntry(1, $1F0, $00, 1, 0, 3, 5, $94)
    %spritemapEntry(1, $00, $F0, 0, 1, 3, 5, $94)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 5, $94)

EnemyProjSpritemaps_EnemyDeathExplosion_5:
    dw $0004
    %spritemapEntry(1, $00, $00, 1, 1, 3, 5, $96)
    %spritemapEntry(1, $1F0, $00, 1, 0, 3, 5, $96)
    %spritemapEntry(1, $00, $F0, 0, 1, 3, 5, $96)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 5, $96)

UNUSED_EnemyProjSpritemaps_0_8DBE74:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $8B)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $8B)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $8B)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $8B)

UNUSED_EnemyProjSpritemaps_1_8DBE8A:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $7A)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $7A)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $7A)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $7A)

UNUSED_EnemyProjSpritemaps_2_8DBEA0:
    dw $0004
    %spritemapEntry(1, $00, $00, 1, 1, 3, 5, $70)
    %spritemapEntry(1, $1F0, $00, 1, 0, 3, 5, $70)
    %spritemapEntry(1, $00, $F0, 0, 1, 3, 5, $70)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 5, $70)

UNUSED_EnemyProjSpritemaps_3_8DBEB6:
    dw $0004
    %spritemapEntry(1, $00, $00, 1, 1, 3, 5, $72)
    %spritemapEntry(1, $1F0, $00, 1, 0, 3, 5, $72)
    %spritemapEntry(1, $00, $F0, 0, 1, 3, 5, $72)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 5, $72)

UNUSED_EnemyProjSpritemaps_4_8DBECC:
    dw $0004
    %spritemapEntry(1, $00, $00, 1, 1, 3, 5, $74)
    %spritemapEntry(1, $1F0, $00, 1, 0, 3, 5, $74)
    %spritemapEntry(1, $00, $F0, 0, 1, 3, 5, $74)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 5, $74)

UNUSED_EnemyProjSpritemaps_5_8DBEE2:
    dw $0004
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 5, $5E)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 5, $5E)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 5, $5E)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $5E)

UNUSED_EnemyProjSpritemaps_6_8DBEF8:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $38)

UNUSED_EnemyProjSpritemaps_7_8DBEFF:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $39)

UNUSED_EnemyProjSpritemaps_8_8DBF06:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $3A)

UNUSED_EnemyProjSpritemaps_9_8DBF0D:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $3B)

EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $26)

EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_1:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $27)

EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_2:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $7B)

EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_3:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $7B)

UNUSED_EnemyProjSpritemaps_0_8DBF30:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $5F)

UNUSED_EnemyProjSpritemaps_1_8DBF37:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $53)

UNUSED_EnemyProjSpritemaps_2_8DBF3E:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 6, $51)

UNUSED_EnemyProjSpritemaps_3_8DBF45:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 6, $60)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 6, $60)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 6, $60)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 6, $60)

UNUSED_EnemyProjSpritemaps_4_8DBF5B:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 6, $61)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 6, $61)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 6, $61)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 6, $61)

UNUSED_EnemyProjSpritemaps_5_8DBF71:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 6, $62)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 6, $62)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 6, $62)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 6, $62)

UNUSED_EnemyProjSpritemaps_6_8DBF87:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 6, $63)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 6, $63)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 6, $63)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 6, $63)

UNUSED_EnemyProjSpritemaps_7_8DBF9D:
    dw $0004
    %spritemapEntry(0, $1F2, $FC, 0, 1, 3, 5, $6C)
    %spritemapEntry(0, $06, $FC, 0, 1, 3, 5, $6C)
    %spritemapEntry(0, $00, $FC, 0, 1, 3, 5, $6C)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 5, $6C)

UNUSED_EnemyProjSpritemaps_8_8DBFB3:
    dw $0004
    %spritemapEntry(0, $00, $FC, 0, 1, 3, 5, $6E)
    %spritemapEntry(0, $08, $FC, 0, 1, 3, 5, $6D)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 5, $6E)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 3, 5, $6D)

UNUSED_EnemyProjSpritemaps_9_8DBFC9:
    dw $0004
    %spritemapEntry(0, $1F0, $FE, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $08, $FE, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $00, $FE, 0, 0, 3, 5, $6F)
    %spritemapEntry(0, $1F8, $FE, 0, 0, 3, 5, $6F)

UNUSED_EnemyProjSpritemaps_A_8DBFDF:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 5, $7C)

UNUSED_EnemyProjSpritemaps_B_8DBFE6:
    dw $0001
    %spritemapEntry(1, $1F8, $F6, 0, 0, 3, 5, $7E)

UNUSED_EnemyProjSpritemaps_C_8DBFED:
    dw $0001
    %spritemapEntry(1, $1F8, $F4, 0, 0, 3, 5, $9A)

UNUSED_EnemyProjSpritemaps_D_8DBFF4:
    dw $0001
    %spritemapEntry(1, $1F8, $F2, 0, 0, 3, 5, $9C)

UNUSED_EnemyProjSpritemaps_E_8DBFFB:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $48)

UNUSED_EnemyProjSpritemaps_F_8DC002:
    dw $0001
    %spritemapEntry(0, $1FC, $FA, 0, 0, 3, 5, $49)

UNUSED_EnemyProjSpritemaps_10_8DC009:
    dw $0001
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 5, $4A)

UNUSED_EnemyProjSpritemaps_11_8DC010:
    dw $0001
    %spritemapEntry(0, $1FC, $F6, 0, 0, 3, 5, $4B)

UNUSED_EnemyProjSpritemaps_12_8DC017:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $2C)

UNUSED_EnemyProjSpritemaps_13_8DC01E:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $2D)

UNUSED_EnemyProjSpritemaps_14_8DC025:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $2E)

UNUSED_EnemyProjSpritemaps_15_8DC02C:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $2F)

UNUSED_EnemyProjSpritemaps_16_8DC033:
    dw $0001
    %spritemapEntry(1, $1F8, $F6, 0, 0, 3, 5, $76)

UNUSED_EnemyProjSpritemaps_17_8DC03A:
    dw $0001
    %spritemapEntry(1, $1F8, $F4, 0, 0, 3, 5, $78)

UNUSED_EnemyProjSpritemaps_18_8DC041:
    dw $0001
    %spritemapEntry(1, $1F8, $F2, 0, 0, 3, 5, $98)

UNUSED_EnemyProjSpritemaps_19_8DC048:
    dw $0001
    %spritemapEntry(1, $1F8, $F0, 0, 0, 3, 5, $9E)

UNUSED_EnemyProjSpritemaps_1A_8DC04F:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $25)

UNUSED_EnemyProjSpritemaps_1B_8DC056:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $43)

UNUSED_EnemyProjSpritemaps_1C_8DC05D:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $40)

EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_4:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $3E)

EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_5:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $3D)

EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_6:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $41)

EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_7:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $42)

EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_8:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $44)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $44)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $44)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $44)

EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_9:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $45)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $45)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $45)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $45)

EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_A:
    dw $0004
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $46)
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $46)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $46)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $46)

EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_B:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $42)

UNUSED_EnemyProjSpritemaps_Pickup_Bombs_0_8DC0C9:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $4C)

UNUSED_EnemyProjSpritemaps_Pickup_Bombs_1_8DC0D0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $4D)

UNUSED_EnemyProjSpritemaps_Pickup_Bombs_2_8DC0D7:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $4E)

UNUSED_EnemyProjSpritemaps_Pickup_Bombs_3_8DC0DE:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $4F)

UNUSED_EnemyProjSpritemaps_0_8DC0E5:
    dw $0002
    %spritemapEntry(0, $1FF, $FC, 0, 0, 3, 5, $55)
    %spritemapEntry(0, $1F7, $FC, 0, 0, 3, 5, $54)

UNUSED_EnemyProjSpritemaps_1_8DC0F1:
    dw $0003
    %spritemapEntry(0, $1FA, $F5, 0, 0, 3, 5, $56)
    %spritemapEntry(0, $02, $FD, 0, 0, 3, 5, $58)
    %spritemapEntry(0, $1FA, $FD, 0, 0, 3, 5, $57)

EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_C:
    dw $0002
    %spritemapEntry(0, $1FD, $F7, 0, 0, 3, 5, $59)
    %spritemapEntry(0, $1FD, $FF, 0, 0, 3, 5, $5A)

EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_D:
    dw $0002
    %spritemapEntry(0, $1FD, $F7, 0, 0, 3, 0, $59)
    %spritemapEntry(0, $1FD, $FF, 0, 0, 3, 0, $5A)

UNUSED_EnemyProjSpritemaps_0_8DC11A:
    dw $0003
    %spritemapEntry(0, $1FE, $F5, 0, 1, 3, 5, $56)
    %spritemapEntry(0, $1F6, $FD, 0, 1, 3, 5, $58)
    %spritemapEntry(0, $1FE, $FD, 0, 1, 3, 5, $57)

UNUSED_EnemyProjSpritemaps_1_8DC12B:
    dw $0002
    %spritemapEntry(0, $1F9, $FC, 0, 1, 3, 5, $55)
    %spritemapEntry(0, $01, $FC, 0, 1, 3, 5, $54)

UNUSED_EnemyProjSpritemaps_2_8DC137:
    dw $0003
    %spritemapEntry(0, $1FE, $03, 1, 1, 3, 5, $56)
    %spritemapEntry(0, $1F6, $FB, 1, 1, 3, 5, $58)
    %spritemapEntry(0, $1FE, $FB, 1, 1, 3, 5, $57)

UNUSED_EnemyProjSpritemaps_3_8DC148:
    dw $0002
    %spritemapEntry(0, $1FD, $01, 1, 0, 3, 5, $59)
    %spritemapEntry(0, $1FD, $F9, 1, 0, 3, 5, $5A)

UNUSED_EnemyProjSpritemaps_4_8DC154:
    dw $0003
    %spritemapEntry(0, $1FA, $03, 1, 0, 3, 5, $56)
    %spritemapEntry(0, $02, $FB, 1, 0, 3, 5, $58)
    %spritemapEntry(0, $1FA, $FB, 1, 0, 3, 5, $57)

UNUSED_EnemyProjSpritemaps_5_8DC165:
    dw $0002
    %spritemapEntry(0, $00, $FC, 0, 0, 3, 5, $65)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 5, $64)

UNUSED_EnemyProjSpritemaps_6_8DC171:
    dw $0003
    %spritemapEntry(0, $02, $FE, 0, 0, 3, 5, $68)
    %spritemapEntry(0, $1FA, $FE, 0, 0, 3, 5, $67)
    %spritemapEntry(0, $1FA, $F6, 0, 0, 3, 5, $66)

EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_E:
    dw $0002
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 5, $69)
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 5, $6A)

EnemyProjSpritemaps_Pickup_EnemyDeathExplosion_F:
    dw $0002
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 0, $69)
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 0, $6A)

UNUSED_EnemyProjSpritemaps_0_8DC19A:
    dw $0003
    %spritemapEntry(0, $1F6, $FE, 0, 1, 3, 5, $68)
    %spritemapEntry(0, $1FE, $FE, 0, 1, 3, 5, $67)
    %spritemapEntry(0, $1FE, $F6, 0, 1, 3, 5, $66)

UNUSED_EnemyProjSpritemaps_1_8DC1AB:
    dw $0002
    %spritemapEntry(0, $1F8, $FC, 0, 1, 3, 5, $65)
    %spritemapEntry(0, $00, $FC, 0, 1, 3, 5, $64)

UNUSED_EnemyProjSpritemaps_2_8DC1B7:
    dw $0003
    %spritemapEntry(0, $1F6, $FA, 1, 1, 3, 5, $68)
    %spritemapEntry(0, $1FE, $FA, 1, 1, 3, 5, $67)
    %spritemapEntry(0, $1FE, $02, 1, 1, 3, 5, $66)

UNUSED_EnemyProjSpritemaps_3_8DC1C8:
    dw $0002
    %spritemapEntry(0, $1FC, $00, 1, 0, 3, 5, $69)
    %spritemapEntry(0, $1FC, $F8, 1, 0, 3, 5, $6A)

UNUSED_EnemyProjSpritemaps_4_8DC1D4:
    dw $0003
    %spritemapEntry(0, $02, $FA, 1, 0, 3, 5, $68)
    %spritemapEntry(0, $1FA, $FA, 1, 0, 3, 5, $67)
    %spritemapEntry(0, $1FA, $02, 1, 0, 3, 5, $66)

UNUSED_EnemyProjSpritemaps_5_8DC1E5:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $3C)

UNUSED_EnemyProjSpritemaps_6_8DC1EC:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $3D)

UNUSED_EnemyProjSpritemaps_7_8DC1F3:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $3E)

UNUSED_EnemyProjSpritemaps_8_8DC1FA:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $3F)

UNUSED_EnemyProjSpritemaps_9_8DC201:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $8A)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $8A)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $8A)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $8A)

UNUSED_EnemyProjSpritemaps_A_8DC217:
    dw $0004
    %spritemapEntry(1, $4200, $00, 1, 1, 3, 5, $90)
    %spritemapEntry(1, $4200, $F0, 0, 1, 3, 5, $90)
    %spritemapEntry(1, $43F0, $00, 1, 0, 3, 5, $90)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 5, $90)

UNUSED_EnemyProjSpritemaps_B_8DC22D:
    dw $0004
    %spritemapEntry(1, $4200, $00, 1, 1, 3, 5, $92)
    %spritemapEntry(1, $43F0, $00, 1, 0, 3, 5, $92)
    %spritemapEntry(1, $4200, $F0, 0, 1, 3, 5, $92)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 5, $92)

UNUSED_EnemyProjSpritemaps_C_8DC243:
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

UNUSED_EnemyProjSpritemaps_D_8DC281:
    dw $0008
    %spritemapEntry(1, $4208, $00, 1, 1, 3, 5, $B5)
    %spritemapEntry(1, $4200, $08, 1, 1, 3, 5, $B3)
    %spritemapEntry(1, $43E8, $00, 1, 0, 3, 5, $B5)
    %spritemapEntry(1, $43F0, $08, 1, 0, 3, 5, $B3)
    %spritemapEntry(1, $4208, $F0, 0, 1, 3, 5, $B5)
    %spritemapEntry(1, $4200, $E8, 0, 1, 3, 5, $B3)
    %spritemapEntry(1, $43E8, $F0, 0, 0, 3, 5, $B5)
    %spritemapEntry(1, $43F0, $E8, 0, 0, 3, 5, $B3)

UNUSED_EnemyProjSpritemaps_E_8DC2AB:
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

EnemyProjSpritemaps_EnemyDeathExplosion_6:
    dw $0004
    %spritemapEntry(1, $00, $00, 1, 1, 3, 5, $90)
    %spritemapEntry(1, $1F0, $00, 1, 0, 3, 5, $90)
    %spritemapEntry(1, $00, $F0, 0, 1, 3, 5, $90)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 5, $90)

EnemyProjSpritemaps_EnemyDeathExplosion_7:
    dw $0008
    %spritemapEntry(1, $1EB, $EB, 0, 0, 3, 5, $76)
    %spritemapEntry(1, $1EB, $05, 1, 0, 3, 5, $76)
    %spritemapEntry(1, $05, $05, 1, 1, 3, 5, $76)
    %spritemapEntry(1, $06, $EB, 0, 1, 3, 5, $76)
    %spritemapEntry(1, $00, $00, 1, 1, 3, 5, $92)
    %spritemapEntry(1, $1FF, $F0, 0, 1, 3, 5, $92)
    %spritemapEntry(1, $1F0, $00, 1, 0, 3, 5, $92)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 5, $92)

EnemyProjSpritemaps_EnemyDeathExplosion_8:
    dw $0008
    %spritemapEntry(1, $00, $00, 1, 1, 3, 5, $94)
    %spritemapEntry(1, $1F0, $00, 1, 0, 3, 5, $94)
    %spritemapEntry(1, $00, $F0, 0, 1, 3, 5, $94)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 5, $94)
    %spritemapEntry(1, $1E2, $E2, 0, 0, 3, 5, $78)
    %spritemapEntry(1, $0E, $E2, 0, 1, 3, 5, $78)
    %spritemapEntry(1, $1E2, $0E, 1, 0, 3, 5, $78)
    %spritemapEntry(1, $0E, $0E, 1, 1, 3, 5, $78)

EnemyProjSpritemaps_EnemyDeathExplosion_9:
    dw $0008
    %spritemapEntry(1, $00, $00, 1, 1, 3, 5, $96)
    %spritemapEntry(1, $00, $F0, 0, 1, 3, 5, $96)
    %spritemapEntry(1, $1F0, $00, 1, 0, 3, 5, $96)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 5, $96)
    %spritemapEntry(1, $14, $DC, 0, 1, 3, 5, $98)
    %spritemapEntry(1, $1DC, $DC, 0, 0, 3, 5, $98)
    %spritemapEntry(1, $1DC, $14, 1, 0, 3, 5, $98)
    %spritemapEntry(1, $14, $14, 1, 1, 3, 5, $98)

EnemyProjSpritemaps_EnemyDeathExplosion_A:
    dw $0008
    %spritemapEntry(0, $1EF, $FA, 0, 0, 3, 5, $2B)
    %spritemapEntry(0, $09, $FA, 0, 0, 3, 5, $2B)
    %spritemapEntry(0, $0C, $EC, 0, 0, 3, 5, $2B)
    %spritemapEntry(0, $1EC, $EC, 0, 0, 3, 5, $2B)
    %spritemapEntry(1, $1D8, $D8, 0, 0, 3, 5, $9E)
    %spritemapEntry(1, $1D8, $18, 1, 0, 3, 5, $9E)
    %spritemapEntry(1, $18, $18, 1, 1, 3, 5, $9E)
    %spritemapEntry(1, $18, $D8, 0, 1, 3, 5, $9E)

EnemyProjSpritemaps_EnemyDeathExplosion_B:
    dw $0008
    %spritemapEntry(1, $1D6, $D6, 0, 0, 3, 5, $9C)
    %spritemapEntry(1, $1A, $D6, 0, 1, 3, 5, $9C)
    %spritemapEntry(1, $1D6, $1A, 1, 0, 3, 5, $9C)
    %spritemapEntry(1, $1A, $1A, 1, 1, 3, 5, $9C)
    %spritemapEntry(0, $12, $E8, 0, 0, 3, 5, $2B)
    %spritemapEntry(0, $0C, $F9, 0, 0, 3, 5, $2B)
    %spritemapEntry(0, $1EC, $F9, 0, 0, 3, 5, $2B)
    %spritemapEntry(0, $1E6, $E8, 0, 0, 3, 5, $2B)

EnemyProjSpritemaps_EnemyDeathExplosion_C:
    dw $0004
    %spritemapEntry(0, $17, $E7, 0, 1, 3, 5, $2A)
    %spritemapEntry(0, $0D, $FA, 0, 1, 3, 5, $2A)
    %spritemapEntry(0, $1EB, $FA, 0, 0, 3, 5, $2A)
    %spritemapEntry(0, $1E1, $E7, 0, 0, 3, 5, $2A)

EnemyProjSpritemaps_EnemyDeathExplosion_D:
    dw $0004
    %spritemapEntry(0, $1B, $E8, 0, 1, 3, 5, $2A)
    %spritemapEntry(0, $0E, $FC, 0, 1, 3, 5, $2A)
    %spritemapEntry(0, $1EA, $FC, 0, 0, 3, 5, $2A)
    %spritemapEntry(0, $1DD, $E8, 0, 0, 3, 5, $2A)

EnemyProjSpritemaps_EnemyDeathExplosion_E:
    dw $0004
    %spritemapEntry(0, $1E, $E9, 0, 1, 3, 5, $29)
    %spritemapEntry(0, $0F, $FE, 0, 1, 3, 5, $29)
    %spritemapEntry(0, $1E9, $FE, 0, 0, 3, 5, $29)
    %spritemapEntry(0, $1DA, $E9, 0, 0, 3, 5, $29)

EnemyProjSpritemaps_EnemyDeathExplosion_F:
    dw $0004
    %spritemapEntry(0, $20, $EA, 0, 1, 3, 5, $29)
    %spritemapEntry(0, $10, $00, 0, 1, 3, 5, $29)
    %spritemapEntry(0, $1E8, $00, 0, 0, 3, 5, $29)
    %spritemapEntry(0, $1D8, $EA, 0, 0, 3, 5, $29)

EnemyProjSpritemaps_EnemyDeathExplosion_10:
    dw $0004
    %spritemapEntry(0, $23, $EC, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $11, $02, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $1D5, $EC, 0, 0, 3, 5, $28)
    %spritemapEntry(0, $1E7, $02, 0, 0, 3, 5, $28)

EnemyProjSpritemaps_EnemyDeathExplosion_11:
    dw $0004
    %spritemapEntry(0, $27, $EE, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $12, $04, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $1D1, $EE, 0, 0, 3, 5, $28)
    %spritemapEntry(0, $1E6, $04, 0, 0, 3, 5, $28)

EnemyProjSpritemaps_EnemyDeathExplosion_12:
    dw $0004
    %spritemapEntry(0, $29, $F1, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $13, $07, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $1CF, $F1, 0, 0, 3, 5, $28)
    %spritemapEntry(0, $1E5, $07, 0, 0, 3, 5, $28)

EnemyProjSpritemaps_EnemyDeathExplosion_13:
    dw $0004
    %spritemapEntry(0, $2D, $F5, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $14, $0B, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $1CB, $F5, 0, 0, 3, 5, $28)
    %spritemapEntry(0, $1E4, $0B, 0, 0, 3, 5, $28)

EnemyProjSpritemaps_EnemyDeathExplosion_14:
    dw $0004
    %spritemapEntry(0, $33, $FF, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $15, $11, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $1C5, $FF, 0, 0, 3, 5, $28)
    %spritemapEntry(0, $1E3, $11, 0, 0, 3, 5, $28)

EnemyProjSpritemaps_EnemyDeathExplosion_15:
    dw $0004
    %spritemapEntry(0, $39, $0A, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $18, $22, 0, 1, 3, 5, $28)
    %spritemapEntry(0, $1BF, $0A, 0, 0, 3, 5, $28)
    %spritemapEntry(0, $1E0, $22, 0, 0, 3, 5, $28)

EnemyProjSpritemaps_Sparks_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $10B)

EnemyProjSpritemaps_Sparks_1:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $10C)

EnemyProjSpritemaps_Sparks_2:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $10D)


;;; $C4C2: Enable palette FX objects ;;;
Enable_PaletteFXObjects:
    PHP
    REP #$20
    LDA.W #$8000 : TSB.W PaletteFXObject_Enable
    PLP
    RTL


;;; $C4CD: Disable palette FX objects ;;;
Disable_PaletteFXObjects:
    PHP
    REP #$20
    LDA.W #$8000 : TRB.W PaletteFXObject_Enable
    PLP
    RTL


;;; $C4D8: Clear palette FX objects ;;;
Clear_PaletteFXObjects:
    PHP
    REP #$30
    PHX
    LDX.W #$000E

  .loop:
    STZ.W PaletteFXObject_IDs,X
    DEX #2 : BPL .loop
    PLX : PLP
    RTL


;;; $C4E9: Spawn palette FX object ;;;
Spawn_PaletteFXObject:
;; Parameter:
;;     Y: Palette FX object ID
;; Returns:
;;     Y: Palette FX object index if carry clear
;;     Carry: Clear if palette FX object spawned, otherwise set
    PHP : PHB : PHX
    PHK : PLB
    LDX.W #$000E

  .loop:
    LDA.W PaletteFXObject_IDs,X : BEQ .zero
    DEX #2 : BPL .loop
    PLX : PLB : PLP
    SEC
    RTL

  .zero:
    TYA : STA.W PaletteFXObject_IDs,X
    STZ.W PaletteFXObject_ColorIndices,X
    LDA.W #RTS_8DC526 : STA.W PaletteFXObject_PreInstructions,X
    LDA.W $0002,Y : STA.W PaletteFXObject_InstListPointers,X
    LDA.W #$0001 : STA.W PaletteFXObject_InstructionTimers,X
    STZ.W PaletteFXObject_Timers,X
    TXA : TYX : TAY
    JSR.W ($0000,X)
    PLX : PLB : PLP
    CLC
    RTL


;;; $C526: RTS ;;;
RTS_8DC526:
    RTS


;;; $C527: Palette FX object handler ;;;
PaletteFXObject_Handler:
    PHP : PHB
    PHK : PLB
    REP #$30
    BIT.W PaletteFXObject_Enable : BPL .return
    LDX.W #$000E

  .loop:
    STX.W PaletteFXObject_Index
    LDA.W PaletteFXObject_IDs,X : BEQ .next
    JSR Process_PaleteFXObject
    LDX.W PaletteFXObject_Index

  .next:
    DEX #2 : BPL .loop

  .return:
    PLB : PLP
    RTL


;;; $C54A: Process palette FX object ;;;
Process_PaleteFXObject:
    REP #$30
    JSR.W (PaletteFXObject_PreInstructions,X)
    LDX.W PaletteFXObject_Index
    DEC.W PaletteFXObject_InstructionTimers,X : BNE Process_PaleteFXObject_return
    LDA.W PaletteFXObject_InstListPointers,X : TAY

  .loopDetermineColorIndex:
    LDA.W $0000,Y : BPL .timer
    STA.B DP_Temp12
    INY #2
    PEA .loopDetermineColorIndex-1
    JMP.W (DP_Temp12)

  .timer:
    STA.W PaletteFXObject_InstructionTimers,X
    LDA.W PaletteFXObject_ColorIndices,X : TAX

  .loopWriteColors:
    LDA.W $0002,Y : BPL .storeColor
    STA.B DP_Temp12
    PEA .loopWriteColors-1
    JMP.W (DP_Temp12)

  .storeColor:
    STA.L Palettes,X
    INX #2
    INY #2
    JMP .loopWriteColors

  .done:
; Eventually, the ASM processing will jump here (via $C595)
    LDX.W PaletteFXObject_Index
    TYA : CLC : ADC.W #$0004 : STA.W PaletteFXObject_InstListPointers,X

  .return:
    RTS


;;; $C595: Instruction - done ;;;
Instruction_PaletteFXObject_Done:
    PLA
    JMP Process_PaleteFXObject_done


;;; $C599: Instruction - colour index += 4 ;;;
Instruction_PaletteFXObject_ColorIndex_Plus4:
    TXA : CLC : ADC.W #$0004 : TAX
    INY #2
    RTS


;;; $C5A2: Instruction - colour index += 6 ;;;
Instruction_PaletteFXObject_ColorIndex_Plus6:
    TXA : CLC : ADC.W #$0006 : TAX
    INY #2
    RTS


;;; $C5AB: Instruction - colour index += 8 ;;;
Instruction_PaletteFXObject_ColorIndex_Plus8:
    TXA : CLC : ADC.W #$0008 : TAX
    INY #2
    RTS


;;; $C5B4: Instruction - colour index += 10h ;;;
Instruction_PaletteFXObject_ColorIndex_Plus10:
    TXA : CLC : ADC.W #$0010 : TAX
    INY #2
    RTS


;;; $C5BD: Instruction - colour index += 12h ;;;
Instruction_PaletteFXObject_ColorIndex_Plus12:
    TXA : CLC : ADC.W #$0012 : TAX
    INY #2
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $C5C6: Unused. Instruction - colour index += 1Eh ;;;
UNUSED_Instruction_PaletteFXObject_ColorIndex_Plus1E_8DC5C6:
    TXA : CLC : ADC.W #$001E : TAX
    INY #2
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C5CF: Instruction - delete ;;;
Instruction_Delete_8DC5CF:
    STZ.W PaletteFXObject_IDs,X
    PLA
    RTS


;;; $C5D4: Instruction - pre-instruction = [[Y]] ;;;
Instruction_PaletteFXObject_PreInstructionInY:
    LDA.W $0000,Y : STA.W PaletteFXObject_PreInstructions,X
    INY #2
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $C5DD: Unused. Instruction - clear pre-instruction ;;;
UNUSED_Inst_PaletteFXObject_ClearPreInstruction_8DC5DD:
    LDA.W #.return : STA.W PaletteFXObject_PreInstructions,X

  .return:
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


if !FEATURE_KEEP_UNREFERENCED
;;; $C5E4: Unused. Instruction - call external function [[Y]] ;;;
UNUSED_Inst_PaletteFXObject_CallExternalFunctionInY_8DC5E4:
    LDA.W $0000,Y : STA.B DP_Temp12
    LDA.W $0001,Y : STA.B DP_Temp13
    PHY
    JSL .externalFunction
    PLY
    LDX.W PaletteFXObject_Index
    INY #3
    RTS

  .externalFunction:
    JML.W [DP_Temp12]


;;; $C5FE: Unused. Instruction - call external function [[Y]] with A = [[Y] + 3] ;;;
UNUSED_Inst_PaletteFXObject_CallExternalFuncInYWithA_8DC5FE:
    LDA.W $0000,Y : STA.B DP_Temp12
    LDA.W $0001,Y : STA.B DP_Temp13
    LDA.W $0003,Y
    PHY
    JSL .externalFunction
    PLY
    LDX.W PaletteFXObject_Index
    TYA : CLC : ADC.W #$0005 : TAY
    RTS

  .externalFunction:
    JML.W [DP_Temp12]
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C61E: Instruction - go to [[Y]] ;;;
Instruction_PaletteFXObject_GotoY:
    LDA.W $0000,Y : TAY
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $C623: Unused. Instruction - go to [Y] + ±[[Y]] ;;;
UNUSED_Instruction_PaletteFXObject_GotoYPlusY_8DC623:
    STY.B DP_Temp12
    DEY
    LDA.W $0000,Y : XBA : BMI .highByte
    AND.W #$00FF
    BRA +

  .highByte:
    ORA.W #$FF00

+   CLC : ADC.B DP_Temp12 : TAY
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C639: Instruction - decrement timer and go to [[Y]] if non-zero ;;;
Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero:
    DEC.W PaletteFXObject_Timers,X : BNE Instruction_PaletteFXObject_GotoY
    INY #2
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $C641: Unused. Instruction - decrement timer and go to [Y] + ±[[Y]] if non-zero ;;;
UNUSED_Inst_PaletteFXObject_DecTimer_GotoYIfNonZero_8DC641:
    DEC.W PaletteFXObject_Timers,X : BNE UNUSED_Instruction_PaletteFXObject_GotoYPlusY_8DC623
    INY
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C648: Instruction - timer = [[Y]] ;;;
Instruction_PaletteFXObject_TimerInY:
    SEP #$20
    LDA.W $0000,Y : STA.W PaletteFXObject_Timers,X
    REP #$20
    INY
    RTS


;;; $C654: Unused. RTS ;;;
RTS_8DC654:
    RTS


;;; $C655: Instruction - palette FX object colour index = [[Y]] ;;;
Instruction_PaletteFXObject_ColorIndexInY:
    LDA.W $0000,Y : STA.W PaletteFXObject_ColorIndices,X
    INY #2
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $C65E: Unused. Instruction - queue music track [[Y]] ;;;
UNUSED_Instruction_PaletteFXObject_QueueMusicTrackInY_8DC65E:
    LDA.W $0000,Y : AND.W #$00FF
    JSL QueueMusicDataOrTrack_8FrameDelay
    INY
    RTS


;;; $C66A: Unused. Instruction - queue sound [[Y]], sound library 1, max queued sounds allowed = 6 ;;;
UNUSED_Inst_PaletteFXObject_QueueSoundInY_Lib1_Max6_8DC66A:
    LDA.W $0000,Y
    JSL QueueSound_Lib1_Max6
    INY
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C673: Instruction - queue sound [[Y]], sound library 2, max queued sounds allowed = 6 ;;;
UNUSED_Inst_PaletteFXObject_QueueSoundInY_Lib2_Max6_8DC673:
    LDA.W $0000,Y
    JSL QueueSound_Lib2_Max6
    INY
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $C67C: Unused. Instruction - queue sound [[Y]], sound library 3, max queued sounds allowed = 6 ;;;
UNUSED_Inst_PaletteFXObject_QueueSoundInY_Lib3_Max6_8DC67C:
    LDA.W $0000,Y
    JSL QueueSound_Lib3_Max6
    INY
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C685: RTS ;;;
RTS_8DC685:
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $C686: Unused ;;;
UNUSED_8DC686:
; Looks like garbage data
    dw $1000,$C690,$C595,$C61E,$C686,$0180,$0000,$0000
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C696: Instruction list - palette FX object $E194 (fade in Super Metroid title logo) ;;;
InstList_PaletteFXObject_FadeInSuperMetroidTitleLogo:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0142
    dw $0003
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $1084,$0084,$0064,$0064,$0044,$0024,$0004,$0004,$0003,$0002,$0401,$0400,$0C63,$0421,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $2108,$0508,$00E8,$00C8,$0088,$0048,$0028,$0008,$0006,$0405,$0803,$0C01,$18C6,$0C42,$0400
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $35AD,$05AD,$056D,$052D,$00CD,$008D,$004D,$000D,$000A,$0407,$0C05,$1422,$2529,$1484,$0400
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $4631,$0A31,$05D1,$0591,$0531,$00B1,$0051,$0011,$000D,$080A,$1026,$1823,$318C,$1CA5,$0800
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $5AD6,$0AD6,$0A56,$09F6,$0576,$00F6,$0076,$0016,$0011,$080C,$1428,$2044,$3DEF,$24E7,$0800
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $6B5A,$0F5A,$0ADA,$0A5A,$05BA,$011A,$009A,$001A,$0014,$0C0F,$182A,$2845,$4A52,$2D08,$0C00
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $7FFF,$13FF,$0F5F,$0EBF,$0A1F,$055F,$04BF,$001F,$0018,$1032,$204C,$3066,$5AB5,$354A,$1000
    dw Instruction_PaletteFXObject_Done
    dw Instruction_Delete_8DC5CF


;;; $C7AC: Instruction list - palette FX object $E198 (fade in Nintendo boot logo) ;;;
InstList_PaletteFXObject_FadeInNintendoBootLogo:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0132


;;; $C7B0: Instruction list - common section of $C7AC / $C7F2 ;;;
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


;;; $C7F2: Instruction list - palette FX object $E19C (fade in Nintendo copyright) ;;;
InstList_PaletteFXObject_FadeInNintendoCopyright:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0192
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_Common_FadeInLogo


;;; $C7FA: Instruction list - palette FX object $E1A0 (title screen baby metroid tube light) ;;;
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


;;; $C862: Instruction list - palette FX object $E1A4 (title screen flickering displays) ;;;
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


;;; $C87A: Instruction list - palette FX object $E1A8 (cutscene gunship engine flicker) ;;;
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


;;; $C88E: Instruction list - palette FX object $E1AC (cutscene Ceres navigation lights - sprite Ceres) ;;;
InstList_PaletteFXObject_CutsceneCeresNavigationLight_Sprite:
    dw Instruction_PaletteFXObject_ColorIndexInY,$01DA


;;; $C892: Instruction list - common section of $C88E / $C906 ;;;
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


;;; $C906: Instruction list - palette FX object $E1B8 (cutscene Ceres navigation lights - BG Ceres) ;;;
InstList_PaletteFXObject_CutsceneCeresNavigationLights_BG:
    dw Instruction_PaletteFXObject_ColorIndexInY,$00DA
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_Common_CeresNavigationLights


;;; $C90E: Instruction list - palette FX object $E1B0 (fade in PLANET ZEBES text) ;;;
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


;;; $C964: Instruction list - palette FX object $E1B4 (fade out PLANET ZEBES text) ;;;
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


;;; $C9BA: Instruction list - palette FX object $E1BC (old Mother Brain fight background lights) ;;;
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


;;; $CA4E: Instruction list - palette FX object $E1C0 (gunship glow) ;;;
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


;;; $CAAA: Instruction list - palette FX object $E1C4 (fade out zoomed out exploding Zebes) ;;;
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


;;; $CB3C: Instruction list - palette FX object $E1C8 (wide part of Zebes explosion - foreground) ;;;
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


;;; $CD62: Instruction list - palette FX object $E1CC (Zebes explosion finale) ;;;
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


;;; $D362: Instruction list - palette FX object $E1E8 (wide part of Zebes explosion - background) ;;;
InstList_PaletteFXObject_WidePartOfZebesExplosion_Background:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0022
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_Common_ZebesExplosion


;;; $D36A: Instruction list - palette FX object $E1D0 (white out space during Zebes explosion) ;;;
InstList_PaletteFXObject_WhiteOutSpaceDuringZebesExplosion:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0000


;;; $D36E: Instruction list - common section of $D362 / $D36A ;;;
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


;;; $D3CA: Instruction list - palette FX object $E1D4 (Zebes explosion planet afterglow) ;;;
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


;;; $D44A: Instruction list - palette FX object $E1D8 (exploding Zebes lava) ;;;
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


;;; $D48E: Instruction list - palette FX object $E1DC (fade out exploding Zebes crust) ;;;
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


;;; $D5A4: Instruction list - palette FX object $E1E0 (fade out exploding Zebes grey clouds) ;;;
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


;;; $D6BA: Instruction list - palette FX object $E1E4 (gunship emerging from Zebes explosion) ;;;
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


;;; $D900: Instruction list - palette FX object $E1F0 (hyper beam) ;;;
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
;;; $D9D0: Instruction list - palette FX object $E1EC (unused) ;;;
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


;;; $DB62: Instruction list - palette FX object $E1F4 (Samus loading - power suit) ;;;
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


;;; $DCC8: Instruction list - palette FX object $E1F8 (Samus loading - varia suit) ;;;
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


;;; $DE2E: Instruction list - palette FX object $E1FC (Samus loading - gravity suit) ;;;
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


;;; $DF94: Instruction list - palette FX object $E200 (post-credits Super Metroid icon glare) ;;;
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


;;; $E192: Instruction list - delete ;;;
InstList_PaletteFXObject_Delete:
    dw Instruction_Delete_8DC5CF


;;; $E194: Palette FX objects ;;;
PaletteFXObjects_FadeInSuperMetroidTitleLogo:
; Fade in Super Metroid title logo
    dw RTS_8DC685
    dw InstList_PaletteFXObject_FadeInSuperMetroidTitleLogo

if !FEATURE_KEEP_UNREFERENCED
PaletteFXObjects_FadeInNintendoBootLogoForUnusedCode:
; Fade in Nintendo boot logo (for unused code)
    dw RTS_8DC685
    dw InstList_PaletteFXObject_FadeInNintendoBootLogo
endif ; !FEATURE_KEEP_UNREFERENCED

PaletteFXObjects_FadeInNintendoCopyright:
; Fade in Nintendo copyright
    dw RTS_8DC685
    dw InstList_PaletteFXObject_FadeInNintendoCopyright

PaletteFXObjects_TitleScreenBabyMetroidTubeLight:
; Title screen baby metroid tube light
    dw RTS_8DC685
    dw InstList_PaletteFXObject_TitleScreenBabyMetroidTubeLight_0

PaletteFXObjects_TitleScreenFlickeringDisplays:
; Title screen flickering displays
    dw RTS_8DC685
    dw InstList_PaletteFXObject_TitleScreenFlickeringDisplays_0

PaletteFXObjects_CutsceneGunshipEngineFlicker:
; Cutscene gunship engine flicker
    dw RTS_8DC685
    dw InstList_PaletteFXObject_CutsceneGunshipEngineFlicker_0

PaletteFXObjects_CutsceneCeresNavigationLights_SpriteCeres:
; Cutscene Ceres navigation lights - sprite Ceres
    dw RTS_8DC685
    dw InstList_PaletteFXObject_CutsceneCeresNavigationLight_Sprite

PaletteFXObjects_FadeInPlanetZebesText:
; Fade in PLANET ZEBES text
    dw RTS_8DC685
    dw InstList_PaletteFXObject_FadeInPlanetZebesText

PaletteFXObjects_FadeOutPlanetZebesText:
; Fade out PLANET ZEBES text
    dw RTS_8DC685
    dw InstList_PaletteFXObject_FadeOutPlanetZebesText

PaletteFXObjects_CutsceneCeresNavigationLights_BGCeres:
; Cutscene Ceres navigation lights - BG Ceres
    dw RTS_8DC685
    dw InstList_PaletteFXObject_CutsceneCeresNavigationLights_BG

PaletteFXObjects_OldMotherBrainFightBackgroundLights:
; Old Mother Brain fight background lights
    dw Setup_PaletteFXObject_OldMotherBrainFightBackgroundLights
    dw InstList_PaletteFXObject_OldMotherBrainFightBGLights_0

PaletteFXObjects_GunshipGlow:
; Gunship glow
    dw RTS_8DC685
    dw InstList_PaletteFXObject_GunshipGlow_0

PaletteFXObjects_FadeOutZoomedOutExplodingZebes:
; Fade out zoomed out exploding Zebes
    dw RTS_8DC685
    dw InstList_PaletteFXObject_FadeOutZoomedOutExplodingZebes

PaletteFXObjects_WidePartOfZebesExplosion_Foreground:
; Wide part of Zebes explosion - foreground
    dw RTS_8DC685
    dw InstList_PaletteFXObject_WidePartOfZebesExplosion_Foreground

PaletteFXObjects_ZebesExplosionFinale:
; Zebes explosion finale
    dw RTS_8DC685
    dw InstList_PaletteFXObject_ZebesExplosionFinale

PaletteFXObjects_WhiteOutSpaceDuringZebesExplosion:
; White out space during Zebes explosion
    dw RTS_8DC685
    dw InstList_PaletteFXObject_WhiteOutSpaceDuringZebesExplosion

PaletteFXObjects_ZebesExplosionPlanetAfterglow:
; Zebes explosion planet afterglow
    dw RTS_8DC685
    dw InstList_PaletteFXObject_ZebesExplosionPlanetAfterGlow_0

PaletteFXObjects_ExplodingZebesLava:
; Exploding Zebes lava
    dw RTS_8DC685
    dw InstList_PaletteFXObject_ExplodingZebesLava_0

PaletteFXObjects_FadeOutExplodingZebesCrust:
; Fade out exploding Zebes crust
    dw RTS_8DC685
    dw InstList_PaletteFXObject_FadeOutExplodingZebesCrust

PaletteFXObjects_FadeOutExplodingZebesGreyClouds:
; Fade out exploding Zebes grey clouds
    dw RTS_8DC685
    dw InstList_PaletteFXObject_FadeOutExplodingZebesGreyClouds

PaletteFXObjects_GunshipEmergineFromZebesExplosion:
; Gunship emerging from Zebes explosion
    dw RTS_8DC685
    dw InstList_PaletteFXObject_GunshipEmergingFromZebesExplosion

PaletteFXObjects_WidePartOfZebesExplosion_Background:
; Wide part of Zebes explosion - background
    dw RTS_8DC685
    dw InstList_PaletteFXObject_WidePartOfZebesExplosion_Background

if !FEATURE_KEEP_UNREFERENCED
UNUSED_PaletteFXObjects_8DE1EC:
    dw RTS_8DC685
    dw UNUSED_InstList_PaletteFXObject_8DD9D0
endif ; !FEATURE_KEEP_UNREFERENCED

PaletteFXObjects_HyperBeam:
; Hyper beam
    dw RTS_8DC685
    dw InstList_PaletteFXObject_HyperBeam_0

PaletteFXObjects_SamusLoading_PowerSuit:
; Samus loading - power suit
    dw RTS_8DC685
    dw InstList_PaletteFXObject_SamusLoading_PowerSuit_0

PaletteFXObjects_SamusLoading_VariaSuit:
; Samus loading - varia suit
    dw RTS_8DC685
    dw InstList_PaletteFXObject_SamusLoading_VairaSuit_0

PaletteFXObjects_SamusLoading_GravitySuit:
; Samus loading - gravity suit
    dw RTS_8DC685
    dw InstList_PaletteFXObject_SamusLoading_GravitySuit_0

PaletteFXObjects_PostCreditsSuperMetroidIcon:
; Post-credits Super Metroid icon
    dw RTS_8DC685
    dw InstList_PaletteFXObject_PostCreditsSuperMetroidIconGlare


;;; $E204: Setup - palette FX object $E1BC (old Mother Brain fight background lights) ;;;
Setup_PaletteFXObject_OldMotherBrainFightBackgroundLights:
    LDA.W #PreInstruction_PaletteFXObject_DeleteIfIntroPage2IsActive : STA.W PaletteFXObject_PreInstructions,Y
    RTS


;;; $E20B: Pre-instruction - delete if intro page 2 is active ;;;
PreInstruction_PaletteFXObject_DeleteIfIntroPage2IsActive:
    LDA.W CinematicFunction : CMP.W #CinematicFunction_Intro_Page2 : BNE .return
    LDA.W #InstList_PaletteFXObject_Delete : STA.W PaletteFXObject_InstListPointers,X
    LDA.W #$0001 : STA.W PaletteFXObject_InstructionTimers,X

  .return:
    RTS


;;; $E220: Instruction list - palette FX object $F745 (nothing) ;;;
InstList_PaletteFXObject_Nothing:
    dw Instruction_Delete_8DC5CF


;;; $E222: Instruction list - palette FX object $F749 (grey out Tourian entrance statue - Draygon) ;;;
InstList_PaletteFXObject_GreyOutTourianStatue_Draygon:
    dw Instruction_PaletteFXObject_ColorIndexInY,$00C0
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_Common_GreyOutTourianStatue


;;; $E22A: Instruction list - palette FX object $F74D (grey out Tourian entrance statue - Kraid) ;;;
InstList_PaletteFXObject_GreyOutTourianStatue_Kraid:
    dw Instruction_PaletteFXObject_ColorIndexInY,$00E0
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_Common_GreyOutTourianStatue


;;; $E232: Instruction list - palette FX object $F751 (grey out Tourian entrance statue - Ridley) ;;;
InstList_PaletteFXObject_GreyOutTourianStatue_Ridley:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0120
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_Common_GreyOutTourianStatue


;;; $E23A: Instruction list - palette FX object $F755 (grey out Tourian entrance statue - Phantoon) ;;;
InstList_PaletteFXObject_GreyOutTourianStatue_Phantoon:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0140


;;; $E23E: Instruction list - common section of above instruction lists ;;;
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


;;; $E2E0: Pre-instruction - delete if enemy 0 died ;;;
PreInstruction_PaletteFXObject_DeleteIfEnemy0Died:
    LDA.W Enemy.health : BNE .return
    STZ.W PaletteFXObject_IDs,X

  .return:
    RTS


;;; $E2E9: Instruction list - palette FX object $F759 (Bomb Torizo belly) ;;;
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


;;; $E331: Instruction list - palette FX object $F75D (Golden Torizo belly) ;;;
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


;;; $E379: Pre-instruction - Samus in heat ;;;
PreInstruction_PaletteFXObject_SamusInHeat:
; Contains heat damage check
    LDA.W EquippedItems : AND.W #$0021 : BNE +
    LDA.W PeriodicSubDamage : CLC : ADC.W #$4000 : STA.W PeriodicSubDamage
    LDA.W PeriodicDamage : ADC.W #$0000 : STA.W PeriodicDamage
    LDA.W NMI_FrameCounter : BIT.W #$0007 : BNE +
    LDA.W #$0046 : CMP.W Energy : BCS +
    LDA.W #$002D
    JSL QueueSound_Lib3_Max6

+   LDA.W PaletteFXObject_SamusInHeatIndex : CMP.W PaletteFXObject_PreviousSamusInHeatIndex : BEQ .return
    STA.W PaletteFXObject_PreviousSamusInHeatIndex
    ASL : TAY
    LDA.W #$0001 : STA.W PaletteFXObject_InstructionTimers,X
    LDA.W EquippedItems : BIT.W #$0020 : BEQ .checkVaria
    LDA.W #.InstListPointers_gravity
    BRA .setInstListPointer

  .checkVaria:
    BIT.W #$0001 : BEQ .powerSuit
    LDA.W #.InstListPointers_varia
    BRA .setInstListPointer

  .powerSuit:
    LDA.W #.InstListPointers_power

  .setInstListPointer:
    STA.B DP_Temp12
    LDA.B (DP_Temp12),Y : STA.W PaletteFXObject_InstListPointers,X

  .return:
    RTS

  .InstListPointers:
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


;;; $E440: Setup - palette FX object $F761 (Norfair 1 / Tourian 1) ;;;
Setup_PaletteFXObject_Norfair1_Tourian1:
    LDA.W EquippedItems : BIT.W #$0020 : BEQ .checkVaria
    LDA.W #InstList_PaletteFXObject_SamusInHeat_GravitySuit_0
    BRA +

  .checkVaria:
    BIT.W #$0001 : BEQ .powerSuit
    LDA.W #InstList_PaletteFXObject_SamusInHeat_VariaSuit_0
    BRA +

  .powerSuit:
    LDA.W #InstList_PaletteFXObject_SamusInHeat_PowerSuit_0

+   STA.W PaletteFXObject_InstListPointers,Y
    RTS


;;; $E45E: Instruction list - Samus in heat - power suit ;;;
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


;;; $E68A: Instruction list - Samus in heat - varia suit ;;;
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


;;; $E8B6: Instruction list - Samus in heat - gravity suit ;;;
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


;;; $EAE2: Instruction list - palette FX object $F76D/$F771 (Wrecked Ship 1 - green lights) ;;;
InstList_PaletteFXObject_WreckedShip1_0:
; Green lights (BG1/2 palette 4 colours Ch..Dh)
; Used by most Wrecked Ship rooms in powered on state
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
;;; $EB2A: Unused. Pre-instruction - wait until area boss is dead ;;;
UNUSED_PreInstruction_PaletteFXObject_WaitUntilAreBossIsDead:
    LDA.W #$0001
    JSL CheckIfBossBitsForCurrentAreaMatchAnyBitsInA
    BCS .return
    PLA
    LDA.W #$0001 : STA.W PaletteFXObject_InstructionTimers,X

  .return:
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $EB3B: Instruction list - palette FX object $F765 (Crateria 1 - lightning) ;;;
InstList_PaletteFXObject_Crateria1_0:
; Lightning (BG1/2 palette 5 colours 4..Bh)
; Used by landing site prior to acquiring power bombs
    dw Instruction_PaletteFXObject_PreInstructionInY
    dw PreInst_PaletteFXObject_RestartCrateria1IfSamusIsntLowEnough
    dw Instruction_PaletteFXObject_ColorIndexInY,$00A8

InstList_PaletteFXObject_Crateria1_1:
    dw $00F0
    dw $2D6C,$294B,$252A,$2109,$1CE8,$18C7,$14A6,$1085
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_TimerInY : db $02

InstList_PaletteFXObject_Crateria1_2:
    dw $0002
    dw $4632,$4211,$3DF0,$39CF,$35AE,$318D,$2D6C,$294B
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $5EF8,$5AD7,$56B6,$5295,$4E74,$4A53,$4632,$4211
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $77BE,$739D,$6F7C,$6B5B,$673A,$6319,$5EF8,$5AD7
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $77BE,$739D,$6F7C,$6B5B,$673A,$6319,$5EF8,$5AD7
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $5EF8,$5AD7,$56B6,$5295,$4E74,$4A53,$4632,$4211
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $4632,$4211,$3DF0,$39CF,$35AE,$318D,$2D6C,$294B
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero
    dw InstList_PaletteFXObject_Crateria1_2
    dw $00F0
    dw $2D6C,$294B,$252A,$2109,$1CE8,$18C7,$14A6,$1085
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_TimerInY : db $01

InstList_PaletteFXObject_Crateria1_3:
    dw $0001
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $77BE,$739D,$6F7C,$6B5B,$673A,$6319,$5EF8,$5AD7
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $5EF8,$5AD7,$56B6,$5295,$4E74,$4A53,$4632,$4211
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $4632,$4211,$3DF0,$39CF,$35AE,$318D,$2D6C,$294B
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero
    dw InstList_PaletteFXObject_Crateria1_3
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_Crateria1_1


;;; $EC59: Pre-instruction - restart Crateria 1 instruction list if Samus isn't low enough ;;;
PreInst_PaletteFXObject_RestartCrateria1IfSamusIsntLowEnough:
    LDA.W SamusYPosition : CMP.W #$0380 : BCS .return
    LDA.W #$0001 : STA.W PaletteFXObject_InstructionTimers,X
    LDA.W #InstList_PaletteFXObject_Crateria1_1 : STA.W PaletteFXObject_InstListPointers,X

  .return:
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $EC6E: Instruction list - palette FX object $F769 (unused. Dark lightning) ;;;
UNUSED_InstList_PaletteFXObject_DarkLightning_0_8DEC6E:
    dw Instruction_PaletteFXObject_PreInstructionInY
    dw UNUSED_PreInst_PalFXObj_RestartDarkLightningIfSamus_8DED84
    dw Instruction_PaletteFXObject_ColorIndexInY,$0082

UNUSED_InstList_PaletteFXObject_DarkLightning_1_8DEC76:
    dw $00F0
    dw $262B,$1548,$08E5,$1594,$14ED,$10A9,$0C86
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_TimerInY : db $02

UNUSED_InstList_PaletteFXObject_DarkLightning_2_8DEC8B:
    dw $0002
    dw $1186,$00A3,$0040,$00EF,$0048,$0004,$0001
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $00E1,$0000,$0000,$004A,$0003,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $0040,$0000,$0000,$0005,$0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $0040,$0000,$0000,$0005,$0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $00E1,$0000,$0000,$004A,$0003,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $1186,$00A3,$0040,$00EF,$0048,$0004,$0001
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero
    dw UNUSED_InstList_PaletteFXObject_DarkLightning_2_8DEC8B
    dw $00F0
    dw $262B,$1548,$08E5,$1594,$14ED,$10A9,$0C86
    dw Instruction_PaletteFXObject_Done
    dw $00F0
    dw $262B,$1548,$08E5,$1594,$14ED,$10A9,$0C86
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_TimerInY : db $01

UNUSED_InstList_PaletteFXObject_DarkLightning_3_8DED34:
    dw $0001
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $0040,$0000,$0000,$0005,$0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $00E1,$0000,$0000,$004A,$0003,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $1186,$00A3,$0040,$00EF,$0048,$0004,$0001
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_DecrementTimer_GotoYIfNonZero
    dw UNUSED_InstList_PaletteFXObject_DarkLightning_3_8DED34
    dw Instruction_PaletteFXObject_GotoY
    dw UNUSED_InstList_PaletteFXObject_DarkLightning_1_8DEC76


;;; $ED84: Pre-instruction - restart dark lightning instruction list if Samus isn't low enough ;;;
UNUSED_PreInst_PalFXObj_RestartDarkLightningIfSamus_8DED84:
    LDA.W SamusYPosition : CMP.W #$0380 : BCS .return
    LDA.W #$0001 : STA.W PaletteFXObject_InstructionTimers,X
    LDA.W #UNUSED_InstList_PaletteFXObject_DarkLightning_1_8DEC76 : STA.W PaletteFXObject_InstListPointers,X

  .return:
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $ED99: Instruction list - palette FX object $F775 (Brinstar 1 - blue background spores) ;;;
InstList_PaletteFXObject_Brinstar1_0:
; Blue background spores (BG1/2 palette 7 colours 1..3)
; Used by Brinstar rooms with the blue spores background (e.g. Green Brinstar mainstreet, n00b bridge)
    dw Instruction_PaletteFXObject_ColorIndexInY,$00E2

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


;;; $EE2D: Instruction list - palette FX object $F779 (Brinstar 8 - Spore Spawn blue background spores) ;;;
InstList_PaletteFXObject_Brinstar8_0:
; Spore Spawn blue background spores (BG1/2 palette 7 colours 1..3)
; Used by Spore Spawn's room
; Clone of Brinstar 1 except pre-instruction is set
    dw Instruction_PaletteFXObject_PreInstructionInY
    dw PreInstruction_PaletteFXObject_DeleteIfAreaMiniBossIsDead
    dw Instruction_PaletteFXObject_ColorIndexInY,$00E2

InstList_PaletteFXObject_Brinstar8_1:
    dw $000A
    dw $5D22,$4463,$1840
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $5901,$4042,$1420
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $54E0,$3C21,$1000
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $50C0,$3C21,$1000
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $4CA0,$3800,$0C00
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $4880,$3800,$0C00
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $4460,$3400,$0800
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $4040,$3400,$0800
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $4460,$3400,$0800
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $4880,$3800,$0C00
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $4CA0,$3800,$0C00
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $50C0,$3C21,$1000
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $54E0,$3C21,$1000
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $5901,$4042,$1420
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_Brinstar8_1


;;; $EEC5: Pre-instruction - delete palette FX object if area mini-boss is dead ;;;
PreInstruction_PaletteFXObject_DeleteIfAreaMiniBossIsDead:
    PHX
    LDX.W AreaIndex
    LDA.L SRAMMirror_Boss,X
    PLX
    AND.W #$0002 : BEQ .return
    STZ.W PaletteFXObject_IDs,X

  .return:
    RTS


;;; $EED7: Instruction list - palette FX object $F77D (Brinstar 2 - red background glow) ;;;
InstList_PaletteFXObject_Brinstar2_0:
; Red background glow (BG1/2 palette 6 colours 4..Bh)
; Used by Red Brinstar rooms with red background (mainstreet, damage boost hall, -> Crateria elevator)
    dw Instruction_PaletteFXObject_ColorIndexInY,$00C8

InstList_PaletteFXObject_Brinstar2_1:
    dw $000A
    dw $4C17,$280F,$2409,$1C07,$1405,$0C03,$0802,$0401
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $4816,$240E,$2008,$1806,$1004,$0802,$0401,$0000
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $4415,$200D,$1C07,$1405,$0C03,$0401,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $4014,$1C0C,$1806,$1004,$0802,$0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $3C13,$180B,$1405,$0C03,$0401,$0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $3812,$140A,$1004,$0802,$0000,$0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $3411,$1009,$0C03,$0401,$0000,$0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $3010,$0C08,$0802,$0000,$0000,$0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $3411,$1009,$0C03,$0401,$0000,$0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $3812,$140A,$1004,$0802,$0000,$0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $3C13,$180B,$1405,$0C03,$0401,$0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $4014,$1C0C,$1806,$1004,$0802,$0000,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $4415,$200D,$1C07,$1405,$0C03,$0401,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $4816,$240E,$2008,$1806,$1004,$0802,$0401,$0000
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_Brinstar2_1


;;; $EFF7: Instruction list - palette FX object $F781 (Crateria 80h / Brinstar 4 - beacon flashing) ;;;
InstList_PaletteFXObject_Crateria80_Brinstar4_0:
; Beacon flashing (BG1/2 palette 7 colours 1..3 / Dh)
; Used by pre Tourian hall, red Brinstar mainstreet, red Brinstar -> Crateria elevator and the first three rooms of Kraid's lair
    dw Instruction_PaletteFXObject_ColorIndexInY,$00E2

InstList_PaletteFXObject_Crateria80_Brinstar4_1:
    dw $000A
    dw $02BF,$017F,$0015
    dw Instruction_PaletteFXObject_ColorIndex_Plus12
    dw $7FFF
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $023B,$00FB,$0011
    dw Instruction_PaletteFXObject_ColorIndex_Plus12
    dw $739C
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $01D8,$0098,$000E
    dw Instruction_PaletteFXObject_ColorIndex_Plus12
    dw $5AD6
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $0154,$0055,$000B
    dw Instruction_PaletteFXObject_ColorIndex_Plus12
    dw $4E73
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $00D0,$0010,$0007
    dw Instruction_PaletteFXObject_ColorIndex_Plus12
    dw $4631
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $00AA,$000B,$0004
    dw Instruction_PaletteFXObject_ColorIndex_Plus12
    dw $3DEF
    dw Instruction_PaletteFXObject_Done
    dw UNUSED_Inst_PaletteFXObject_QueueSoundInY_Lib2_Max6_8DC673 : db $18
    dw $000A
    dw $00D0,$0010,$0007
    dw Instruction_PaletteFXObject_ColorIndex_Plus12
    dw $4631
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $0154,$0055,$000B
    dw Instruction_PaletteFXObject_ColorIndex_Plus12
    dw $4E73
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $01D8,$0098,$000E
    dw Instruction_PaletteFXObject_ColorIndex_Plus12
    dw $5AD6
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $023B,$00FB,$0011
    dw Instruction_PaletteFXObject_ColorIndex_Plus12
    dw $739C
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_Crateria80_Brinstar4_1


;;; $F08E: Instruction list - palette FX object $F785 (Norfair 2) ;;;
InstList_PaletteFXObject_Norfair2_0:
    dw Instruction_PaletteFXObject_ColorIndexInY,$006A

InstList_PaletteFXObject_Norfair2_1:
    dw Instruction_PaletteFXObject_1EED_InY : db $00
    dw $0010
    dw $09FD,$093B,$0459
    dw Instruction_PaletteFXObject_ColorIndex_Plus8
    dw $09FD,$4A52
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_1EED_InY : db $01
    dw $0004
    dw $0E3D,$0D7C,$089A
    dw Instruction_PaletteFXObject_ColorIndex_Plus8
    dw $0E3D,$4214
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_1EED_InY : db $02
    dw $0004
    dw $165E,$0DBC,$08FB
    dw Instruction_PaletteFXObject_ColorIndex_Plus8
    dw $165E,$39F5
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_1EED_InY : db $03
    dw $0005
    dw $1A9E,$11FD,$0D3C
    dw Instruction_PaletteFXObject_ColorIndex_Plus8
    dw $1A9E,$31D7
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_1EED_InY : db $04
    dw $0006
    dw $1EBE,$161D,$119C
    dw Instruction_PaletteFXObject_ColorIndex_Plus8
    dw $1EBE,$29D9
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_1EED_InY : db $05
    dw $0007
    dw $22FE,$1A5E,$15DD
    dw Instruction_PaletteFXObject_ColorIndex_Plus8
    dw $22FE,$21BA
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_1EED_InY : db $06
    dw $0008
    dw $2B1F,$1A9E,$163E
    dw Instruction_PaletteFXObject_ColorIndex_Plus8
    dw $2B1F,$199C
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_1EED_InY : db $07
    dw $0008
    dw $2F5F,$1EDF,$1A7F
    dw Instruction_PaletteFXObject_ColorIndex_Plus8
    dw $2F5F,$0D7F
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_1EED_InY : db $08
    dw $0008
    dw $2F5F,$1EDF,$1A7F
    dw Instruction_PaletteFXObject_ColorIndex_Plus8
    dw $2F5F,$0D7F
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_1EED_InY : db $09
    dw $0008
    dw $2B1F,$1A9E,$163E
    dw Instruction_PaletteFXObject_ColorIndex_Plus8
    dw $2B1F,$199C
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_1EED_InY : db $0A
    dw $0007
    dw $22FE,$1A5E,$15DD
    dw Instruction_PaletteFXObject_ColorIndex_Plus8
    dw $22FE,$21BA
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_1EED_InY : db $0B
    dw $0006
    dw $1EBE,$161D,$119C
    dw Instruction_PaletteFXObject_ColorIndex_Plus8
    dw $1EBE,$29D9
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_1EED_InY : db $0C
    dw $0005
    dw $1A9E,$11FD,$0D3C
    dw Instruction_PaletteFXObject_ColorIndex_Plus8
    dw $1A9E,$31D7
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_1EED_InY : db $0D
    dw $0004
    dw $165E,$0DBC,$08FB
    dw Instruction_PaletteFXObject_ColorIndex_Plus8
    dw $165E,$39F5
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_1EED_InY : db $0E
    dw $0004
    dw $0E3D,$0D7C,$089A
    dw Instruction_PaletteFXObject_ColorIndex_Plus8
    dw $0E3D,$4214
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_1EED_InY : db $0F
    dw $0010
    dw $09FD,$093B,$0459
    dw Instruction_PaletteFXObject_ColorIndex_Plus8
    dw $09FD,$4A52
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_Norfair2_1


;;; $F1C6: Instruction - PaletteFXObject_SamusInHeatIndex = [[Y]] ;;;
Instruction_PaletteFXObject_1EED_InY:
    LDA.W $0000,Y : AND.W #$00FF : STA.W PaletteFXObject_SamusInHeatIndex
    INY
    RTS


;;; $F1D1: Instruction list - palette FX object $F789 (Norfair 4) ;;;
InstList_PaletteFXObject_Norfair4_0:
    dw Instruction_PaletteFXObject_ColorIndexInY,$0082

InstList_PaletteFXObject_Norfair4_1:
    dw $0010
    dw $09FD,$093B,$0459
    dw Instruction_PaletteFXObject_ColorIndex_Plus10
    dw $4309,$0C77
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $0E3D,$0D7C,$089A
    dw Instruction_PaletteFXObject_ColorIndex_Plus10
    dw $36AC,$0CB8
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $165E,$0DBC,$08FB
    dw Instruction_PaletteFXObject_ColorIndex_Plus10
    dw $328F,$1119
    dw Instruction_PaletteFXObject_Done
    dw $0005
    dw $1A9E,$11FD,$0D3C
    dw Instruction_PaletteFXObject_ColorIndex_Plus10
    dw $2A52,$157A
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $1EBE,$161D,$119C
    dw Instruction_PaletteFXObject_ColorIndex_Plus10
    dw $2214,$15BB
    dw Instruction_PaletteFXObject_Done
    dw $0007
    dw $22FE,$1A5E,$15DD
    dw Instruction_PaletteFXObject_ColorIndex_Plus10
    dw $1DF7,$1A1C
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $2B1F,$1A9E,$163E
    dw Instruction_PaletteFXObject_ColorIndex_Plus10
    dw $15BA,$1E7D
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $2F5F,$1EDF,$1A7F
    dw Instruction_PaletteFXObject_ColorIndex_Plus10
    dw $0D7F,$22FF
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $2F5F,$1EDF,$1A7F
    dw Instruction_PaletteFXObject_ColorIndex_Plus10
    dw $0D7F,$22FF
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $2B1F,$1A9E,$163E
    dw Instruction_PaletteFXObject_ColorIndex_Plus10
    dw $15BA,$1E7D
    dw Instruction_PaletteFXObject_Done
    dw $0007
    dw $22FE,$1A5E,$15DD
    dw Instruction_PaletteFXObject_ColorIndex_Plus10
    dw $1DF7,$1A1C
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $1EBE,$161D,$119C
    dw Instruction_PaletteFXObject_ColorIndex_Plus10
    dw $2214,$15BB
    dw Instruction_PaletteFXObject_Done
    dw $0005
    dw $1A9E,$11FD,$0D3C
    dw Instruction_PaletteFXObject_ColorIndex_Plus10
    dw $2A52,$157A
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $165E,$0DBC,$08FB
    dw Instruction_PaletteFXObject_ColorIndex_Plus10
    dw $328F,$1119
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $0E3D,$0D7C,$089A
    dw Instruction_PaletteFXObject_ColorIndex_Plus10
    dw $36AC,$0CB8
    dw Instruction_PaletteFXObject_Done
    dw $0010
    dw $09FD,$093B,$0459
    dw Instruction_PaletteFXObject_ColorIndex_Plus10
    dw $4309,$0C77
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_Norfair4_1


;;; $F2D9: Instruction list - palette FX object $F78D (Norfair 8) ;;;
InstList_PaletteFXObject_Norfair8_0:
    dw Instruction_PaletteFXObject_ColorIndexInY,$00A2

InstList_PaletteFXObject_Norfair8_1:
    dw $0010
    dw $09FD,$093B,$0459
    dw Instruction_PaletteFXObject_ColorIndex_Plus10
    dw $2DB3,$38CF
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $0E3D,$0D7C,$089A
    dw Instruction_PaletteFXObject_ColorIndex_Plus10
    dw $2594,$30D1
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $165E,$0DBC,$08FB
    dw Instruction_PaletteFXObject_ColorIndex_Plus10
    dw $2176,$28D3
    dw Instruction_PaletteFXObject_Done
    dw $0005
    dw $1A9E,$11FD,$0D3C
    dw Instruction_PaletteFXObject_ColorIndex_Plus10
    dw $1D57,$24D5
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $1EBE,$161D,$119C
    dw Instruction_PaletteFXObject_ColorIndex_Plus10
    dw $1959,$20F7
    dw Instruction_PaletteFXObject_Done
    dw $0007
    dw $22FE,$1A5E,$15DD
    dw Instruction_PaletteFXObject_ColorIndex_Plus10
    dw $153B,$18F9
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $2B1F,$1A9E,$163E
    dw Instruction_PaletteFXObject_ColorIndex_Plus10
    dw $111C,$14FB
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $2F5F,$1EDF,$1A7F
    dw Instruction_PaletteFXObject_ColorIndex_Plus10
    dw $0D1F,$0D1F
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $2F5F,$1EDF,$1A7F
    dw Instruction_PaletteFXObject_ColorIndex_Plus10
    dw $0D1F,$0D1F
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $2B1F,$1A9E,$163E
    dw Instruction_PaletteFXObject_ColorIndex_Plus10
    dw $111C,$14FB
    dw Instruction_PaletteFXObject_Done
    dw $0007
    dw $22FE,$1A5E,$15DD
    dw Instruction_PaletteFXObject_ColorIndex_Plus10
    dw $153B,$18F9
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $1EBE,$161D,$119C
    dw Instruction_PaletteFXObject_ColorIndex_Plus10
    dw $1959,$20F7
    dw Instruction_PaletteFXObject_Done
    dw $0005
    dw $1A9E,$11FD,$0D3C
    dw Instruction_PaletteFXObject_ColorIndex_Plus10
    dw $1D57,$24D5
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $165E,$0DBC,$08FB
    dw Instruction_PaletteFXObject_ColorIndex_Plus10
    dw $2176,$28D3
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $0E3D,$0D7C,$089A
    dw Instruction_PaletteFXObject_ColorIndex_Plus10
    dw $2594,$30D1
    dw Instruction_PaletteFXObject_Done
    dw $0010
    dw $09FD,$093B,$0459
    dw Instruction_PaletteFXObject_ColorIndex_Plus10
    dw $2DB3,$38CF
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_Norfair8_1


;;; $F3E1: Instruction list - palette FX object $F791 (Norfair 10h) ;;;
InstList_PaletteFXObject_Norfair10_0:
    dw Instruction_PaletteFXObject_ColorIndexInY,$00C2

InstList_PaletteFXObject_Norfair10_1:
    dw $0010
    dw $09DA,$091A,$087A
    dw Instruction_PaletteFXObject_ColorIndex_Plus10
    dw $08A8,$0C05
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $0DDA,$093A,$089A
    dw Instruction_PaletteFXObject_ColorIndex_Plus10
    dw $08AA,$0828
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $0DFA,$0D5A,$08BA
    dw Instruction_PaletteFXObject_ColorIndex_Plus10
    dw $08AC,$084A
    dw Instruction_PaletteFXObject_Done
    dw $0005
    dw $11FA,$0D7A,$08FA
    dw Instruction_PaletteFXObject_ColorIndex_Plus10
    dw $08CF,$086D
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $161A,$119A,$0D1A
    dw Instruction_PaletteFXObject_ColorIndex_Plus10
    dw $08D1,$0890
    dw Instruction_PaletteFXObject_Done
    dw $0007
    dw $1A1A,$11BA,$0D3A
    dw Instruction_PaletteFXObject_ColorIndex_Plus10
    dw $08F4,$08B3
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $1A3A,$15DA,$0D7A
    dw Instruction_PaletteFXObject_ColorIndex_Plus10
    dw $08F6,$08D5
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $225A,$1A1A,$11BA
    dw Instruction_PaletteFXObject_ColorIndex_Plus10
    dw $091A,$091A
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $225A,$1A1A,$11BA
    dw Instruction_PaletteFXObject_ColorIndex_Plus10
    dw $091A,$091A
    dw Instruction_PaletteFXObject_Done
    dw $0008
    dw $1A3A,$15DA,$0D7A
    dw Instruction_PaletteFXObject_ColorIndex_Plus10
    dw $08F6,$08D5
    dw Instruction_PaletteFXObject_Done
    dw $0007
    dw $1A1A,$11BA,$0D3A
    dw Instruction_PaletteFXObject_ColorIndex_Plus10
    dw $08F4,$08B3
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $161A,$119A,$0D1A
    dw Instruction_PaletteFXObject_ColorIndex_Plus10
    dw $08D1,$0890
    dw Instruction_PaletteFXObject_Done
    dw $0005
    dw $11FA,$0D7A,$08FA
    dw Instruction_PaletteFXObject_ColorIndex_Plus10
    dw $08CF,$086D
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $0DFA,$0D5A,$08BA
    dw Instruction_PaletteFXObject_ColorIndex_Plus10
    dw $08AC,$084A
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $0DDA,$093A,$089A
    dw Instruction_PaletteFXObject_ColorIndex_Plus10
    dw $08AA,$0828
    dw Instruction_PaletteFXObject_Done
    dw $0010
    dw $09DA,$091A,$087A
    dw Instruction_PaletteFXObject_ColorIndex_Plus10
    dw $08A8,$0C05
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_Norfair10_1


;;; $F4E9: Instruction list - palette FX object $F795 (Maridia 1 - sand pits) ;;;
InstList_PaletteFXObject_Maridia1_0:
; Sand pits (BG1/2 palette 2 colours 4..Bh)
; Used by rooms with sand pits
    dw Instruction_PaletteFXObject_ColorIndexInY,$0048

InstList_PaletteFXObject_Maridia1_1:
    dw $000A
    dw $3ED9,$2E57,$2A35,$25F3,$25D2,$1DB0,$196E,$112E
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $2E57,$2A35,$25F3,$3ED9,$1DB0,$196E,$112E,$25D2
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $2A35,$25F3,$3ED9,$2E57,$196E,$112E,$25D2,$1DB0
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $25F3,$3ED9,$2E57,$2A35,$112E,$25D2,$1DB0,$196E
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_Maridia1_1


;;; $F541: Instruction list - palette FX object $F799 (Maridia 2) ;;;
InstList_PaletteFXObject_Maridia2_0:
; Sand falls (BG1/2 palette 2 colours 8..Bh)
; Used by sand fall rooms, snail room save station and Botwoon's room
    dw Instruction_PaletteFXObject_ColorIndexInY,$0050

InstList_PaletteFXObject_Maridia2_1:
    dw $000A
    dw $25D2,$1DB0,$196E,$112E
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $1DB0,$196E,$112E,$25D2
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $196E,$112E,$25D2,$1DB0
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $112E,$25D2,$1DB0,$196E
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_Maridia2_1


;;; $F579: Instruction list - palette FX object $F79D (Maridia 4 - background waterfalls) ;;;
InstList_PaletteFXObject_Maridia4_0:
; Background waterfalls (BG1/2 palette 3 colours 8..Fh)
; Used by the spike room and two grapple rooms near Draygon
    dw Instruction_PaletteFXObject_ColorIndexInY,$0068

InstList_PaletteFXObject_Maridia4_1:
    dw $0002
    dw $0400,$0C22,$1864,$2086,$2CC9,$1C65,$1043,$0821
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $0C22,$1864,$2086,$2CC9,$1C65,$1043,$0821,$0400
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $1864,$2086,$2CC9,$1C65,$1043,$0821,$0400,$0C22
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $2086,$2CC9,$1C65,$1043,$0821,$0400,$0C22,$1864
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $2CC9,$1C65,$1043,$0821,$0400,$0C22,$1864,$2086
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $1C65,$1043,$0821,$0400,$0C22,$1864,$2086,$2CC9
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $1043,$0821,$0400,$0C22,$1864,$2086,$2CC9,$1C65
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $0821,$0400,$0C22,$1864,$2086,$2CC9,$1C65,$1043
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_Maridia4_1


;;; $F621: Pre-instruction - delete if two more palette FX objects are spawned ;;;
PreInstruction_PaletteFXObject_DeleteIf2MoreObjectsSpawned:
; Huh. Weird...
    LDA.W PaletteFXObject_Enable,X : BEQ .return
    STZ.W PaletteFXObject_IDs,X

  .return:
    RTS


;;; $F62A: Instruction list - palette FX object $F7A5 (Tourian 4 - unused clone of Tourian 2) ;;;
InstList_PaletteFXObject_Tourian4:
; Clone of Tourian 2
    dw Instruction_PaletteFXObject_ColorIndexInY,$00E8
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_Common_Tourian2_Tourian4_0


;;; $F632: Instruction list - palette FX object $F7A1 (Tourian 2 - glowing arkanoid blocks and red orbs) ;;;
InstList_PaletteFXObject_Tourian2:
; Glowing arkanoid blocks and red orbs (BG1/2 palette 7 colours 4 / 8..Eh)
; Used by most Tourian rooms
    dw Instruction_PaletteFXObject_ColorIndexInY,$00E8


;;; $F636: Instruction list - common section of Tourian 2 / 4 ;;;
InstList_PaletteFXObject_Common_Tourian2_Tourian4_0:
    dw Instruction_PaletteFXObject_PreInstructionInY
    dw PreInstruction_PaletteFXObject_DeleteIf2MoreObjectsSpawned

InstList_PaletteFXObject_Common_Tourian2_Tourian4_1:
    dw $000A
    dw $5294
    dw Instruction_PaletteFXObject_ColorIndex_Plus6
    dw $0019,$0012,$5C00,$4000,$1084,$197F,$7FFF
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $4A52
    dw Instruction_PaletteFXObject_ColorIndex_Plus6
    dw $0016,$000F,$5000,$3400,$1084,$0D1C,$739C
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $4210
    dw Instruction_PaletteFXObject_ColorIndex_Plus6
    dw $0013,$000C,$4400,$2800,$1084,$00B9,$6739
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $39CE
    dw Instruction_PaletteFXObject_ColorIndex_Plus6
    dw $0010,$0009,$3800,$1C00,$1084,$0056,$5AD6
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $318C
    dw Instruction_PaletteFXObject_ColorIndex_Plus6
    dw $000D,$0006,$2C00,$1000,$1084,$0013,$4E73
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $294A
    dw Instruction_PaletteFXObject_ColorIndex_Plus6
    dw $000A,$0003,$2000,$0400,$1084,$0010,$4210
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $294A
    dw Instruction_PaletteFXObject_ColorIndex_Plus6
    dw $000A,$0003,$2000,$0400,$1084,$0010,$4210
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $318C
    dw Instruction_PaletteFXObject_ColorIndex_Plus6
    dw $000D,$0006,$2C00,$1000,$1084,$0013,$4E73
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $39CE
    dw Instruction_PaletteFXObject_ColorIndex_Plus6
    dw $0010,$0009,$3800,$1C00,$1084,$0056,$5AD6
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $4210
    dw Instruction_PaletteFXObject_ColorIndex_Plus6
    dw $0013,$000C,$4400,$2800,$1084,$00B9,$6739
    dw Instruction_PaletteFXObject_Done
    dw $000A
    dw $4A52
    dw Instruction_PaletteFXObject_ColorIndex_Plus6
    dw $0016,$000F,$5000,$3400,$1084,$0D1C,$739C
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_Common_Tourian2_Tourian4_1


;;; $F730: Setup - palette FX object $F779 (Brinstar 8 - Spore Spawn blue background spores) ;;;
Setup_PaletteFXObject_Brinstar8:
    PHX
    LDX.W AreaIndex
    LDA.L SRAMMirror_Boss,X
    PLX
    AND.W #$0002 : BEQ .return
    LDA.W #$0000 : STA.W PaletteFXObject_IDs,Y

  .return:
    RTS


;;; $F745: Palette FX objects - Tourian entrance statue / torizo belly ;;;
PaletteFXObjects_Nothing:
; Nothing
    dw RTS_8DC685
    dw InstList_PaletteFXObject_Nothing

PaletteFXObjects_GreyOutTourianStatue_Draygon:
; Grey out Tourian entrance statue - Draygon
    dw RTS_8DC685
    dw InstList_PaletteFXObject_GreyOutTourianStatue_Draygon

PaletteFXObjects_GreyOutTourianStatue_Kraid:
; Grey out Tourian entrance statue - Kraid
    dw RTS_8DC685
    dw InstList_PaletteFXObject_GreyOutTourianStatue_Kraid

PaletteFXObjects_GreyOutTourianStatue_Ridley:
; Grey out Tourian entrance statue - Ridley
    dw RTS_8DC685
    dw InstList_PaletteFXObject_GreyOutTourianStatue_Ridley

PaletteFXObjects_GreyOutTourianStatue_Phantoon:
; Grey out Tourian entrance statue - Phantoon
    dw RTS_8DC685
    dw InstList_PaletteFXObject_GreyOutTourianStatue_Phantoon

PaletteFXObjects_BombTorizoBelly:
; Bomb Torizo belly
    dw RTS_8DC685
    dw InstList_PaletteFXObject_BombTorizoBelly_0

PaletteFXObjects_GoldenTorizoBelly:
; Golden Torizo belly
    dw RTS_8DC685
    dw InstList_PaletteFXObject_GoldenTorizoBelly_0


;;; $F761: Palette FX objects - FX - non escape sequence ;;;
PaletteFXObjects_Norfair1_Tourian1:
; Norfair 1 / Tourian 1
    dw Setup_PaletteFXObject_Norfair1_Tourian1
    dw InstList_PaletteFXObject_SamusInHeat_PowerSuit_0

PaletteFXObjects_Crateria1_Lightning:
; Crateria 1 - lightning
    dw RTS_8DC685
    dw InstList_PaletteFXObject_Crateria1_0

if !FEATURE_KEEP_UNREFERENCED
UNUSED_PaletteFXObjects_DarkLightning_8DF769:
; Unused. Dark lightning
    dw RTS_8DC685
    dw UNUSED_InstList_PaletteFXObject_DarkLightning_0_8DEC6E
endif ; !FEATURE_KEEP_UNREFERENCED

PaletteFXObjects_WreckedShip1_GreenLights:
; Wrecked Ship 1 - green lights
    dw RTS_8DC685
    dw InstList_PaletteFXObject_WreckedShip1_0

if !FEATURE_KEEP_UNREFERENCED
UNUSED_PaletteFXObjects_WreckedShip1_GreenLights_dup_8DF771:
    dw RTS_8DC685
    dw InstList_PaletteFXObject_WreckedShip1_0
endif ; !FEATURE_KEEP_UNREFERENCED

PaletteFXObjects_Brinstar1_BlueBackgroundSpores:
; Brinstar 1 - blue background spores
    dw RTS_8DC685
    dw InstList_PaletteFXObject_Brinstar1_0

PaletteFXObjects_Brinstar8_SporeSpawnBlueBackgroundSpores:
; Brinstar 8 - Spore Spawn blue background spores
    dw Setup_PaletteFXObject_Brinstar8
    dw InstList_PaletteFXObject_Brinstar8_0

PaletteFXObjects_Brinstar2_RedBackgroundGlow:
; Brinstar 2 - red background glow
    dw RTS_8DC685
    dw InstList_PaletteFXObject_Brinstar2_0

PaletteFXObjects_Crateria80_Brinstar4_BeaconFlashing:
; Crateria 80h / Brinstar 4 - beacon flashing
    dw RTS_8DC685
    dw InstList_PaletteFXObject_Crateria80_Brinstar4_0

PaletteFXObjects_Norfair2:
; Norfair 2
    dw RTS_8DC685
    dw InstList_PaletteFXObject_Norfair2_0

PaletteFXObjects_Norfair4:
; Norfair 4
    dw RTS_8DC685
    dw InstList_PaletteFXObject_Norfair4_0

PaletteFXObjects_Norfair8:
; Norfair 8
    dw RTS_8DC685
    dw InstList_PaletteFXObject_Norfair8_0

PaletteFXObjects_Norfair10:
; Norfair 10h
    dw RTS_8DC685
    dw InstList_PaletteFXObject_Norfair10_0

PaletteFXObjects_Maridia1_SandPits:
; Maridia 1 - sand pits
    dw RTS_8DC685
    dw InstList_PaletteFXObject_Maridia1_0

PaletteFXObjects_Maridia2_SandFalls:
; Maridia 2 - sand falls
    dw RTS_8DC685
    dw InstList_PaletteFXObject_Maridia2_0

PaletteFXObjects_Maridia4_BackgroundWaterfalls:
; Maridia 4 - background waterfalls
    dw RTS_8DC685
    dw InstList_PaletteFXObject_Maridia4_0

PaletteFXObjects_Tourian2_GlowingArkanoidBlocksAndRedOrbs:
; Tourian 2 - glowing arkanoid blocks and red orbs
    dw RTS_8DC685
    dw InstList_PaletteFXObject_Tourian2

UNUSED_PaletteFXObjects_Tourian4_8DF7A5:
; Tourian 4 - unused clone of Tourian 2
    dw RTS_8DC685
    dw InstList_PaletteFXObject_Tourian4


;;; $F7A9: Instruction list - palette FX object $FFC9 (Tourian 8 - shutter red flashing) ;;;
InstList_PaletteFXObject_Tourian8_0:
; Shutter red flashing (sprite palette 1 colours 9..Eh)
; Used by escape room 1
    dw Instruction_PaletteFXObject_ColorIndexInY,$0132

InstList_PaletteFXObject_Tourian8_1:
    dw $0002
    dw $5294,$4210,$318C,$2108,$1084,$7FFF
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $4E75,$3DF1,$2D6D,$1CE8,$0C64,$77BF
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $4A55,$39D1,$2D6D,$1CE8,$0C64,$739F
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $4636,$35B2,$294D,$18C9,$0844,$6B5F
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $3DF6,$3192,$252D,$14A9,$0844,$673F
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $39D7,$2D72,$210E,$1089,$0424,$5EFF
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $35B7,$2952,$1CEE,$1089,$0424,$5ADF
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $3198,$2533,$18CE,$0C69,$0004,$529F
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $35B7,$2952,$1CEE,$1089,$0424,$5ADF
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $39D7,$2D72,$210E,$1089,$0424,$5EFF
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $3DF6,$3192,$252D,$14A9,$0844,$673F
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $4636,$35B2,$294D,$18C9,$0844,$6B5F
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $4A55,$39D1,$2D6D,$1CE8,$0C64,$739F
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $4E75,$3DF1,$2D6D,$1CE8,$0C64,$77BF
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_Tourian8_1


;;; $F891: Instruction list - palette FX object $FFCD (Tourian 10h - background red flashing) ;;;
InstList_PaletteFXObject_Tourian10_0:
; Background red flashing (BG1/2 palette 3 colours 8..Bh)
    dw Instruction_PaletteFXObject_ColorIndexInY,$0070

InstList_PaletteFXObject_Tourian10_1:
    dw $0004
    dw $081A,$0812,$042B,$0423
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $0C37,$0C30,$042A,$0423
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $1054,$0C2E,$0849,$0422
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $1471,$104C,$0848,$0422
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $148E,$106A,$0C66,$0842
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $18AB,$1488,$0C65,$0842
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $1CC8,$1486,$1084,$0841
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $20E5,$18A4,$1083,$0841
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $1CC8,$1486,$1084,$0841
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $18AB,$1488,$0C65,$0842
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $148E,$106A,$0C66,$0842
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $1471,$104C,$0848,$0422
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $1054,$0C2E,$0849,$0422
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $0C37,$0C30,$042A,$0423
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_Tourian10_1


;;; $F941: Instruction list - palette FX object $FFD1 (Tourian 20h - general level red flashing) ;;;
InstList_PaletteFXObject_Tourian20:
; General level red flashing (BG1/2 palette 5 colours 4..9 / Eh)
; Used by Tourian escape rooms
    dw Instruction_PaletteFXObject_ColorIndexInY,$00A8
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_Common_Tourian20_Tourian40


;;; $F949: Instruction list - palette FX object $FFD5 (Tourian 40h - red flashing arkanoid blocks and red orbs) ;;;
InstList_PaletteFXObject_Tourian40:
; Red flashing arkanoid blocks and red orbs (BG1/2 palette 7 colours 4..9 / Eh)
; Used by Tourian escape rooms
    dw Instruction_PaletteFXObject_ColorIndexInY,$00E8


;;; $F94D: Instruction list - common section of Tourian 20h / 40h ;;;
InstList_PaletteFXObject_Common_Tourian20_Tourian40:
    dw $0002
    dw $5294,$39CE,$2108,$1084,$0019,$0012
    dw Instruction_PaletteFXObject_ColorIndex_Plus8
    dw $7FFF
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $4E75,$35AF,$1CE8,$0C64,$080D,$0809
    dw Instruction_PaletteFXObject_ColorIndex_Plus8
    dw $77BF
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $4A55,$318F,$1CE9,$0C64,$1000,$1000
    dw Instruction_PaletteFXObject_ColorIndex_Plus8
    dw $739F
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $4636,$2D70,$18C9,$0844,$080D,$0809
    dw Instruction_PaletteFXObject_ColorIndex_Plus8
    dw $6B5F
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $3DF6,$2D70,$18CA,$0844,$0019,$0012
    dw Instruction_PaletteFXObject_ColorIndex_Plus8
    dw $673F
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $39D7,$2951,$14AA,$0424,$080D,$0809
    dw Instruction_PaletteFXObject_ColorIndex_Plus8
    dw $5EFF
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $35B7,$2531,$14AB,$0424,$1000,$1000
    dw Instruction_PaletteFXObject_ColorIndex_Plus8
    dw $5ADF
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $3198,$2112,$108B,$0004,$080D,$0809
    dw Instruction_PaletteFXObject_ColorIndex_Plus8
    dw $529F
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $35B7,$2531,$14AB,$0424,$1000,$1000
    dw Instruction_PaletteFXObject_ColorIndex_Plus8
    dw $5ADF
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $39D7,$2951,$14AA,$0424,$080D,$0809
    dw Instruction_PaletteFXObject_ColorIndex_Plus8
    dw $5EFF
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $3DF6,$2D70,$18CA,$0844,$0019,$0012
    dw Instruction_PaletteFXObject_ColorIndex_Plus8
    dw $673F
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $4636,$2D70,$18C9,$0844,$080D,$0809
    dw Instruction_PaletteFXObject_ColorIndex_Plus8
    dw $6B5F
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $4A55,$318F,$1CE9,$0C64,$1000,$1000
    dw Instruction_PaletteFXObject_ColorIndex_Plus8
    dw $739F
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $4E75,$35AF,$1CE8,$0C64,$080D,$0809
    dw Instruction_PaletteFXObject_ColorIndex_Plus8
    dw $77BF
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_Common_Tourian20_Tourian40


;;; $FA69: Instruction list - palette FX object $FFD9 (Crateria 8) ;;;
InstList_PaletteFXObject_Crateria8_0:
; Old Tourian red flashing (BG1/2 palette 5 colours 1..3 / 8..Bh / Eh)
; Used by old Tourian escape shaft during escape
    dw Instruction_PaletteFXObject_ColorIndexInY,$00A2

InstList_PaletteFXObject_Crateria8_1:
    dw $0003
    dw $5A73,$41AD,$28E7
    dw Instruction_PaletteFXObject_ColorIndex_Plus8
    dw $0019,$0012,$3460,$0C20
    dw Instruction_PaletteFXObject_ColorIndex_Plus4
    dw $7F9C
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $4E14,$396E,$24C8
    dw Instruction_PaletteFXObject_ColorIndex_Plus8
    dw $0014,$000E,$4900,$1C60
    dw Instruction_PaletteFXObject_ColorIndex_Plus4
    dw $6F3C
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $41D5,$312E,$1CA8
    dw Instruction_PaletteFXObject_ColorIndex_Plus8
    dw $000F,$000A,$5980,$2CA0
    dw Instruction_PaletteFXObject_ColorIndex_Plus4
    dw $62FD
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $3576,$28EF,$1889
    dw Instruction_PaletteFXObject_ColorIndex_Plus8
    dw $000A,$0005,$6E20,$38C0
    dw Instruction_PaletteFXObject_ColorIndex_Plus4
    dw $529D
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $2D17,$20D0,$1489
    dw Instruction_PaletteFXObject_ColorIndex_Plus8
    dw $0005,$0001,$7EA0,$4900
    dw Instruction_PaletteFXObject_ColorIndex_Plus4
    dw $423E
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $20B8,$1891,$106A
    dw Instruction_PaletteFXObject_ColorIndex_Plus8
    dw $000A,$0005,$6E20,$38C0
    dw Instruction_PaletteFXObject_ColorIndex_Plus4
    dw $31DE
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $1479,$1051,$084A
    dw Instruction_PaletteFXObject_ColorIndex_Plus8
    dw $000F,$000A,$5980,$2CA0
    dw Instruction_PaletteFXObject_ColorIndex_Plus4
    dw $259F
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $081A,$0812,$042B
    dw Instruction_PaletteFXObject_ColorIndex_Plus8
    dw $0014,$000E,$4900,$1C60
    dw Instruction_PaletteFXObject_ColorIndex_Plus4
    dw $153F
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $1479,$1051,$084A
    dw Instruction_PaletteFXObject_ColorIndex_Plus8
    dw $000F,$000A,$5980,$2CA0
    dw Instruction_PaletteFXObject_ColorIndex_Plus4
    dw $259F
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $20B8,$1891,$106A
    dw Instruction_PaletteFXObject_ColorIndex_Plus8
    dw $000A,$0005,$6E20,$38C0
    dw Instruction_PaletteFXObject_ColorIndex_Plus4
    dw $31DE
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $2D17,$20D0,$1489
    dw Instruction_PaletteFXObject_ColorIndex_Plus8
    dw $0005,$0001,$7EA0,$4900
    dw Instruction_PaletteFXObject_ColorIndex_Plus4
    dw $423E
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $3576,$28EF,$1889
    dw Instruction_PaletteFXObject_ColorIndex_Plus8
    dw $000A,$0005,$6E20,$38C0
    dw Instruction_PaletteFXObject_ColorIndex_Plus4
    dw $529D
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $41D5,$312E,$1CA8
    dw Instruction_PaletteFXObject_ColorIndex_Plus8
    dw $000F,$000A,$5980,$2CA0
    dw Instruction_PaletteFXObject_ColorIndex_Plus4
    dw $62FD
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $4E14,$396E,$24C8
    dw Instruction_PaletteFXObject_ColorIndex_Plus8
    dw $0014,$000E,$4900,$1C60
    dw Instruction_PaletteFXObject_ColorIndex_Plus4
    dw $6F3C
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_Crateria8_1


;;; $FBC1: Instruction list - palette FX object $FFDD (Crateria 10h - old Tourian background railings flash orange) ;;;
InstList_PaletteFXObject_Crateria10_0:
; Old Tourian background railings flash orange (BG1/2 palette 6 colours 9..Bh)
; Used by old Tourian escape shaft during escape
    dw Instruction_PaletteFXObject_ColorIndexInY,$00D2

InstList_PaletteFXObject_Crateria10_1:
    dw $0010
    dw $35AD,$1CE7,$0C63
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $29D0,$150A,$0885
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $1E14,$114D,$08A7
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $0E37,$096F,$04A8
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $025A,$0192,$00CA
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $35AD,$1CE7,$0C63
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $29D0,$150A,$0885
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $1E14,$114D,$08A7
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $0E37,$096F,$04A8
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $025A,$0192,$00CA
    dw Instruction_PaletteFXObject_Done
    dw $0020
    dw $35AD,$1CE7,$0C63
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $29D0,$150A,$0885
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $1E14,$114D,$08A7
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $0E37,$096F,$04A8
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $025A,$0192,$00CA
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_Crateria10_1


;;; $FC5F: Instruction list - palette FX object $FFE1 (Crateria 20h - old Tourian background panels flash yellow) ;;;
InstList_PaletteFXObject_Crateria20_0:
; Used by old Tourian escape shaft during escape
    dw Instruction_PaletteFXObject_ColorIndexInY,$00AA

InstList_PaletteFXObject_Crateria20_1:
    dw $0010
    dw $28C8,$2484,$1C61
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $398E,$296B,$1549
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $4A74,$2E52,$1230
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $5739,$3318,$0B18
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $67FF,$43FF,$03FF
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $28C8,$2484,$1C61
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $398E,$296B,$1549
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $4A74,$2E52,$1230
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $5739,$3318,$0B18
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $67FF,$43FF,$03FF
    dw Instruction_PaletteFXObject_Done
    dw $0020
    dw $28C8,$2484,$1C61
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $398E,$296B,$1549
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $4A74,$2E52,$1230
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $5739,$3318,$0B18
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $67FF,$43FF,$03FF
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_Crateria20_1


;;; $FCFD: Instruction list - palette FX object $FFE5 (Crateria 2 - upper Crateria red flashing) ;;;
InstList_PaletteFXObject_Crateria2_0:
; Upper Crateria red flashing (BG1/2 palette 4 colours 1..7)
; Used by landing site and Crateria mainstreet during escape
    dw Instruction_PaletteFXObject_ColorIndexInY,$0082

InstList_PaletteFXObject_Crateria2_1:
    dw $0008
    dw $1D89,$0D06,$0CA3,$2D0E,$2D09,$28C5,$0C81
    dw Instruction_PaletteFXObject_Done
    dw $0007
    dw $1D8A,$0D07,$0CA4,$2D0E,$2D09,$28C5,$0421
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $1D8A,$0D28,$0CC4,$2D0F,$2D0A,$28C6,$0423
    dw Instruction_PaletteFXObject_Done
    dw $0005
    dw $1D8B,$0D29,$0CC5,$2D0F,$2D0A,$28C6,$0424
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $1DAB,$1149,$10C5,$2D0F,$2D0B,$28C7,$0845
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $1DAC,$114A,$10C6,$2D0F,$2D0B,$28C7,$0846
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $1DAC,$116B,$10E6,$2D10,$2D0C,$28C8,$0848
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $1DAD,$116C,$10E7,$2D10,$2D0C,$28C8,$0015
    dw Instruction_PaletteFXObject_Done
    dw $0002
    dw $1DAC,$116B,$10E6,$2D10,$2D0C,$28C8,$0848
    dw Instruction_PaletteFXObject_Done
    dw $0003
    dw $1DAC,$114A,$10C6,$2D0F,$2D0B,$28C7,$0846
    dw Instruction_PaletteFXObject_Done
    dw $0004
    dw $1DAB,$1149,$10C5,$2D0F,$2D0B,$28C7,$0845
    dw Instruction_PaletteFXObject_Done
    dw $0005
    dw $1D8B,$0D29,$0CC5,$2D0F,$2D0A,$28C6,$0424
    dw Instruction_PaletteFXObject_Done
    dw $0006
    dw $1D8A,$0D28,$0CC4,$2D0F,$2D0A,$28C6,$0423
    dw Instruction_PaletteFXObject_Done
    dw $0007
    dw $1D8A,$0D07,$0CA4,$2D0E,$2D09,$28C5,$0421
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_Crateria2_1


;;; $FE01: Instruction list - palette FX object $FFE9 (Crateria 4 - yellow lightning) ;;;
InstList_PaletteFXObject_Crateria4_0:
; Yellow lightning (BG1/2 palette 5 colours 1..Bh)
; Used by landing site during escape
    dw Instruction_PaletteFXObject_ColorIndexInY,$00A2

InstList_PaletteFXObject_Crateria4_1:
    dw $0031
    dw $48D5,$38B0,$286A,$2488,$2067,$1846,$1425,$1024,$0C23,$0C03,$0802
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $3DD8,$31D5,$2991,$25B0,$218F,$1D8E,$0C23,$0C23,$0822,$0802,$0401
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $32FC,$2EDA,$26D8,$26D7,$26D7,$22B7,$0802,$0401,$0401,$0401,$0401
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $27FF,$27FF,$27FF,$27FF,$27FF,$27FF,$0000,$0000,$0401,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $32FC,$2EDA,$26D8,$26D7,$26D7,$22B7,$0802,$0401,$0401,$0401,$0401
    dw Instruction_PaletteFXObject_Done
    dw $0011
    dw $48D5,$38B0,$286A,$2488,$2067,$1846,$1425,$1024,$0C23,$0C03,$0802
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $32FC,$2EDA,$26D8,$26D7,$26D7,$22B7,$0802,$0401,$0401,$0401,$0401
    dw Instruction_PaletteFXObject_Done
    dw $0018
    dw $48D5,$38B0,$286A,$2488,$2067,$1846,$1425,$1024,$0C23,$0C03,$0802
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $32FC,$2EDA,$26D8,$26D7,$26D7,$22B7,$0802,$0401,$0401,$0401,$0401
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $27FF,$27FF,$27FF,$27FF,$27FF,$27FF,$0000,$0000,$0401,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $32FC,$2EDA,$26D8,$26D7,$26D7,$22B7,$0802,$0401,$0401,$0401,$0401
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_Crateria4_1


;;; $FF27: Instruction list - palette FX object $FFED (Crateria 40h - slightly modifies an unnoticeable pixel in a CRE block) ;;;
InstList_PaletteFXObject_Crateria40_0:
; Slightly modifies an unnoticeable pixel in a CRE block (BG1/2 palette 5 colours 7..Bh)
; Used by Crateria mainstreet during escape
    dw Instruction_PaletteFXObject_ColorIndexInY,$00AE

InstList_PaletteFXObject_Crateria40_1:
    dw $0031
    dw $1425,$1024,$0C23,$0C03,$0802
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $0C23,$0C23,$0822,$0802,$0401
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $0802,$0401,$0401,$0401,$0401
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $0000,$0000,$0401,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $0802,$0401,$0401,$0401,$0401
    dw Instruction_PaletteFXObject_Done
    dw $0011
    dw $1425,$1024,$0C23,$0C03,$0802
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $0802,$0401,$0401,$0401,$0401
    dw Instruction_PaletteFXObject_Done
    dw $0018
    dw $1425,$1024,$0C23,$0C03,$0802
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $0802,$0401,$0401,$0401,$0401
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $0000,$0000,$0401,$0000,$0000
    dw Instruction_PaletteFXObject_Done
    dw $0001
    dw $0802,$0401,$0401,$0401,$0401
    dw Instruction_PaletteFXObject_Done
    dw Instruction_PaletteFXObject_GotoY
    dw InstList_PaletteFXObject_Crateria40_1


;;; $FFC9: Palette FX objects - escape sequence ;;;
PaletteFXObjects_Tourian8_ShutterRedFlashing:
; Tourian 8 - shutter red flashing
    dw RTS_8DC685
    dw InstList_PaletteFXObject_Tourian8_0

PaletteFXObjects_Tourian10_BackgroundRedFlashing:
; Tourian 10h - background red flashing
    dw RTS_8DC685
    dw InstList_PaletteFXObject_Tourian10_0

PaletteFXObjects_Tourian20_GeneralLevelRedFlashing:
; Tourian 20h - general level red flashing
    dw RTS_8DC685
    dw InstList_PaletteFXObject_Tourian20

PaletteFXObjects_Tourian40_RedFlashingArkanoidBlocksRedOrbs:
; Tourian 40h - red flashing arkanoid blocks and red orbs
    dw RTS_8DC685
    dw InstList_PaletteFXObject_Tourian40

PaletteFXObjects_Crateria8_OldTourianRedFlashing:
; Crateria 8 - old Tourian red flashing
    dw RTS_8DC685
    dw InstList_PaletteFXObject_Crateria8_0

PaletteFXObjects_Crateria10_OldTourianBGRailingsFlashYellow:
; Crateria 10h - old Tourian background railings flash orange
    dw RTS_8DC685
    dw InstList_PaletteFXObject_Crateria10_0

PaletteFXObjects_Crateria20_OldTourianBGPanelsFlashYellow:
; Crateria 20h - old Tourian background panels flash yellow
    dw RTS_8DC685
    dw InstList_PaletteFXObject_Crateria20_0

PaletteFXObjects_Crateria2_UpperCrateriaRedFlashing:
; Crateria 2 - upper Crateria red flashing
    dw RTS_8DC685
    dw InstList_PaletteFXObject_Crateria2_0

PaletteFXObjects_Crateria4_YellowLightning:
; Crateria 4 - yellow lightning
    dw RTS_8DC685
    dw InstList_PaletteFXObject_Crateria4_0

PaletteFXObjects_Crateria40_SlightlyModifiesAPixelInCREBlock:
; Crateria 40h - slightly modifies an unnoticeable pixel in a CRE block
    dw RTS_8DC685
    dw InstList_PaletteFXObject_Crateria40_0


Freespace_Bank8D_FFF1:
; $F bytes
