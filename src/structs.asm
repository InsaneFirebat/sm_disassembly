struct Equipment $09A2 ; TODO change hardcoded address
  .start:
  .equippedItems: skip 2 ; $09A2
  .collectedItems: skip 2 ; $09A4
  .equippedBeams: skip 2 ; $09A6
  .collectedBeams: skip 2 ; $09A8
  .upBinding: skip 2 ; $09AA
  .downBinding: skip 2 ; $09AC
  .leftBinding: skip 2 ; $09AE
  .rightBinding: skip 2 ; $09B0
  .shootBinding: skip 2 ; $09B2
  .jumpBinding: skip 2 ; $09B4
  .runBinding: skip 2 ; $09B6
  .itemCancelBinding: skip 2 ; $09B8
  .itemSelectBinding: skip 2 ; $09BA
  .aimDownBinding: skip 2 ; $09BC
  .aimUpBinding: skip 2 ; $09BE
  .reserveTankMode: skip 2 ; $09C0
  .currentEnergy: skip 2 ; $09C2
  .maxEnergy: skip 2 ; $09C4
  .currentMissiles: skip 2 ; $09C6
  .maxMissiles: skip 2 ; $09C8
  .currentSuperMissiles: skip 2 ; $09CA
  .maxSuperMissiles: skip 2 ; $09CC
  .currentPowerBombs: skip 2 ; $09CE
  .maxPowerBombs: skip 2 ; $09D0
  .selectedHudItem: skip 2 ; $09D2
  .maxReserveEnergy: skip 2 ; $09D4
  .currentReserveEnergy: skip 2 ; $09D6
  .currentReserveMissiles: skip 2 ; $09D8
  .igtFrames: skip 2 ; $09DA
  .igtSeconds: skip 2 ; $09DC
  .igtMinutes: skip 2 ; $09DE
  .igtHours: skip 2 ; $09E0
  .japaneseSubtitles: skip 2 ; $09E2
  .moonwalkEnabled: skip 2 ; $09E4
  .debug_disableSamusPlacementMode: skip 2 ; $09E6
  .unk09E8: skip 2
  .itemCancelInDoorTransition: skip 2 ; $09EA
  .unused09EC: skip 2
  .unused09EE: skip 2
  .unused09F0: skip 2
  .unused09F2: skip 2
  .unused09F4: skip 2
  .unused09F6: skip 2
  .unused09F8: skip 2
  .unused09FA: skip 2
  .unused09FC: skip 2
  .unused09FE: skip 2
  .unused0A00: skip 2
endstruct

struct EnemyHeader EnemyHeaders&$FF0000
  .gfxSize: skip 2 ; $00
  .pPal: skip 2 ; $02
  .health: skip 2 ; $04
  .damage: skip 2 ; $06
  .width: skip 2 ; $08
  .height: skip 2 ; $0A
  .bank: skip 1 ; $0C
  .stunnedTime: skip 1 ; $0D
  .cry: skip 2 ; $0E
  .bossId: skip 2 ; $10
  .pInit: skip 2 ; $12
  .numberOfParts: skip 2 ; $14
  .unused16: skip 2 ; $16
  .pMain: skip 2 ; $18
  .pGrappled: skip 2 ; $1A
  .pStunned: skip 2 ; $1C
  .pFrozen: skip 2 ; $1E
  .pTimeIsFrozen: skip 2 ; $20
  .deathAnimation: skip 2 ; $22
  .unused24: skip 4 ; $24
  .pPowerBombed: skip 2 ; $28
  .sidehopperVariantIndex: skip 2 ; $2A
  .unused2C: skip 4 ; $2C
  .pTouched: skip 2 ; $30
  .pShot: skip 2 ; $32
  .unused34SpritemapPointerTable: skip 2 ; $34
  .pGfx: skip 3 ; $36
  .layer: skip 1 ; $39
  .dropChances: skip 2 ; $3A
  .vulnerabilities: skip 2 ; $3C
  .name: skip 2 ; $3E
endstruct

struct EnemyData $0F78 ; TODO change hardcoded address
  .pId: skip 2 ; $0F78
  .xPosition: skip 2 ; $0F7A
  .xSubPosition: skip 2 ; $0F7C
  .yPosition: skip 2 ; $0F7E
  .ySubPosition: skip 2 ; $0F80
  .xHitboxRadius: skip 2 ; $0F82
  .yHitboxRadius: skip 2 ; $0F84
  .properties: skip 2 ; $0F86
  .properties2: skip 2 ; $0F88
  .ai: skip 2 ; $0F8A
  .health: skip 2 ; $0F8C
  .pSpritemap: skip 2 ; $0F8E
  .loopCounter: skip 2 ; $0F90
  .pInstList: skip 2 ; $0F92, also an init param only when initializing the enemy
  .instTimer: skip 2 ; $0F94
  .palette: skip 2 ; $0F96
  .gfxOffset: skip 2 ; $0F98
  .layer: skip 2 ; $0F9A
  .flashTimer: skip 2 ; $0F9C
  .freezeTimer: skip 2 ; $0F9E
  .invincibilityTimer: skip 2 ; $0FA0
  .shakeTimer: skip 2 ; $0FA2
  .frameCounter: skip 2 ; $0FA4
  .bank: skip 2 ; $0FA6
  .work0: skip 2 ; $0FA8
  .work1: skip 2 ; $0FAA
  .work2: skip 2 ; $0FAC
  .work3: skip 2 ; $0FAE
  .work4: skip 2 ; $0FB0
  .work5: skip 2 ; $0FB2
  .initParam0: skip 2 ; $0FB4
  .initParam1: skip 2 ; $0FB6
endstruct

struct EnemySetEntry EnemySets&$FF0000
  .pId: skip 2
  .properties: skip 2
endstruct

; Vulnerability format:
;     v = f000dddd
;     If v = FFh:
;         Freeze, no damage
;     Else:
;         d: Damage multiplier * 2
;         f: Does not freeze
struct EnemyVulnerabilities AllEnemyVulnerabilities&$FF0000
  .all:
  .beams: skip 12 ; $00
  .missile: skip 1 ; $0C
  .superMissile: skip 1 ; $0D
  .bomb: skip 1 ; $0E
  .powerBomb: skip 1 ; $0F
  .speedBooster: skip 1 ; $10
  .shinespark: skip 1 ; $11
  .screwAttack: skip 1 ; $12
  .chargeBeam: skip 1 ; $13
  .sudoScrew: skip 1 ; $14
  .unused15: skip 1 ; $15
endstruct

; They must add up to 255
struct EnemyDropChances AllEnemyDropChances&$FF0000
  .smallEnergy: skip 1
  .bigEnergy: skip 1
  .missiles: skip 1
  .nothing: skip 1
  .superMissiles: skip 1
  .powerBombs: skip 1
endstruct
