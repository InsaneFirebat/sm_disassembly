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
