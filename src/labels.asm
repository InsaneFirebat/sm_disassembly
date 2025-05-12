
org $830000
DoorHeaders:
  .destRoomHeader: skip 2 ; 0: Destination room header pointer (bank $8F)
  .elevatorProperties: skip 1 ; 2: Elevator properties
  .direction: skip 1 ; 3: Direction
  .doorcapXBlocks: skip 1 ; 4: Doorcap X position in blocks
  .doorcapYBlocks: skip 1 ; 5: Doorcap Y position in blocks
  .XScreen: skip 1 ; 6: X screen
  .YScreen: skip 1 ; 7: Y screen
  .spawnDistance: skip 2 ; 8: Distance from door to spawn Samus
  .doorASM: skip 2 ; Ah: Custom door ASM to execute (bank $8F)


org $830000
FXHeaders:


org $840000
PLMEntries:
  .setup: skip 2 ; 0: Setup pointer
  .instList: skip 2 ; 2: Instruction list pointer
  .instList2: skip 2 ; 4: Instruction list pointer 2

org $860000
EnemyProjectiles:
  .initAI: skip 2 ; 0: Initialisation AI
  .initialPreInstruction: skip 2 ; 2: Initial pre-instruction
  .initialInstList: skip 2 ; 4: Initial instruction list
  .XRadius: skip 2 ; 6: X radius
  .YRadius: skip 2 ; 8: Y radius
  .properties: skip 2 ; Ah: Properties 
  .hitInstList: skip 2 ; Ch: Hit instruction list 
  .shotInstList: skip 2 ; Eh: Shot instruction list 


org $8C0000
CinematicBGObjectInstLists:


org $8C0000
IndirectInstructions:


org $8C0000
CreditsInstLists:


org $8F0000
RoomHeaders:
  .room: skip 1 ; 0: Room index
  .area: skip 1 ; 1: Area index
  .X: skip 1 ; 2: X
  .Y: skip 1 ; 3: Y
  .width: skip 1 ; 4: Width
  .height: skip 1 ; 5: Height
  .upScroller: skip 1 ; 6: Up scroller
  .downScroller: skip 1 ; 7: Down scroller
  .CRE: skip 1 ; 8: CRE bitset
  .doors: skip 2 ; 9: Door list
  .eventHeaders: skip 2 ; Bh: Event headers


org $8F0000
RoomStates:
  .levelData: skip 3 ; 0: Level data
  .tileset: skip 1 ; 3: Tileset
  .musicData: skip 1 ; 4: Music data index
  .musicTrack: skip 1 ; 5: Music track
  .FX: skip 2 ; 6: FX (bank $83)
  .enemyPopulation: skip 2 ; 8: Enemy population (bank $A1)
  .enemySet: skip 2 ; Ah: Enemy set (bank $B4)
  .layer2Scroll: skip 2 ; Ch: Layer 2 scroll
  .scroll: skip 2 ; Eh: Scroll
  .XrayBlocks: skip 2 ; 10h: Special x-ray blocks
  .mainASM: skip 2 ; 12h: Main ASM
  .PLMPopulation: skip 2 ; 14h: PLM population
  .libraryBackground: skip 2 ; 16h: Library background
  .setupASM: skip 2 ; 18h: Setup ASM


org $8F0000
RoomVars:
  .XPosition: skip 1 ; 0: X position
  .YPosition: skip 1 ; 1: Y position
  .block: skip 2 ; 2: Block


org $8F0000
PLMPopulations:
  .PLM: skip 2 ; 0: PLM ID
  .X: skip 1 ; 2: X position
  .Y: skip 1 ; 3: Y position
  .param: skip 2 ; 4: Parameter


org $8F0000
RoomDoors:


org $900000
BeamTrailInstLists:
  .timer: skip 2 ; 0: Timer
  .data: skip 2 ; 2: Data


org $A00000
EnemyHeaders:
  .tileDataSize: skip 2 ; 0: Tile data size
  .palette: skip 2 ; 2: Palette
  .health: skip 2 ; 4: Health
  .damage: skip 2 ; 6: Damage
  .width: skip 2 ; 8: Width
  .height: skip 2 ; Ah: Height
  .bank: skip 1 ; Ch: Bank
  .hurtAITime: skip 1 ; Dh: Hurt AI time
  .cry: skip 2 ; Eh: Cry
  .bossID: skip 2 ; 10h: Boss ID
  .initAI: skip 2 ; 12h: Initialisation AI
  .numberOfParts: skip 2 ; 14h: Number of parts
  .unused16: skip 2 ; 16h: Unused. Set to 1 by zoomer, stone zoomer, red ninja space pirate
  .mainAI: skip 2 ; 18h: Main AI
  .grappleAI: skip 2 ; 1Ah: Grapple AI
  .hurtAI: skip 2 ; 1Ch: Hurt AI
  .frozenAI: skip 2 ; 1Eh: Frozen AI
  .timeIsFrozenAI: skip 2 ; 20h: Time is frozen AI
  .deathAnimation: skip 2 ; 22h: Death animation
  .unused24: skip 4 ; 24h: Unused
  .powerBombReaction: skip 2 ; 28h: Power bomb reaction
  .sidehopperVariantIndex: skip 2 ; 2Ah: Sidehopper variant index. Unused proto instruction list (see $A0:AE7C) for flies, (multi)viola, ripper (ii), Ceres door
  .unused2C: skip 4 ; 2Ch: Unused
  .enemyTouch: skip 2 ; 30h: Enemy touch
  .enemyShot: skip 2 ; 32h: Enemy shot
  .unused34SpritemapPointerTable: skip 2 ; 34h: Unused. Spritemap pointer tables for flies, ripper, skultera, Ceres door (whose table is missing)
  .tileData: skip 3 ; 36h: Tile data
  .layer: skip 1 ; 39h: Layer
  .dropChances: skip 2 ; 3Ah: Drop chances (bank $B4)
  .vulnerabilities: skip 2 ; 3Ch: Vulnerabilities (bank $B4)
  .name: skip 2 ; 3Eh: Enemy name (bank $B4)


ORG $A10000
EnemyPopulations:
  .ID: skip 2 ; 0: Enemy ID
  .XPosition: skip 2 ; 2: X position
  .YPosition: skip 2 ; 4: Y position
  .init: skip 2 ; 6: Initialisation parameter (orientation in SMILE)
  .properties: skip 2 ; 8: Properties (special in SMILE)
  .extraProperties: skip 2 ; Ah: Extra properties (special graphics bitset in SMILE)
  .param1: skip 2 ; Ch: Parameter 1 (speed in SMILE)
  .param2: skip 2 ; Eh: Parameter 2 (speed2 in SMILE)


org $B40000
EnemySetNames:


org $B40000
EnemySets:
  .ID: skip 2 ; 0: Enemy ID
  .palette: skip 2 ; 2: Palette index


org $B40000
EnemyNames:
  .name: skip 10 ; 0: Enemy name in ASCII
  .population: skip 2 ; Ah: Enemy population pointer (for debug enemy spawner)
  .spritemap: skip 2 ; Ch: Enemy name debug spritemap index (add 30h to index $A201)


org $B40000
EnemyVulnerabilities:
  .power: skip 1 ; 0: Power
  .wave: skip 1 ; 1: Wave
  .ice: skip 1 ; 2: Ice
  .iceWave: skip 1 ; 3: Ice + wave
  .spazer: skip 1 ; 4: Spazer
  .spazerWave: skip 1 ; 5: Spazer + wave
  .spazerIce: skip 1 ; 6: Spazer + ice
  .spazerIceWave: skip 1 ; 7: Spazer + ice + wave
  .plasma: skip 1 ; 8: Plasma
  .plasmaWave: skip 1 ; 9: Plasma + wave / shinespark echo
  .plasmaIce: skip 1 ; Ah: Plasma + ice
  .plasmaIceWave: skip 1 ; Bh: Plasma + ice + wave
  .missile: skip 1 ; Ch: Missile
  .superMissile: skip 1 ; Dh: Super missile
  .bomb: skip 1 ; Eh: Bomb
  .powerBomb: skip 1 ; Fh: Power bomb
  .speedBooster: skip 1 ; 10h: Speed booster
  .shinespark: skip 1 ; 11h: Shinespark
  .screwAttack: skip 1 ; 12h: Screw attack
  .chargedBeam: skip 1 ; 13h: Charged beam (including SBA)
  .pseudoScrew: skip 1 ; 14h: Pseudo screw attack
  .unused: skip 1 ; 15h: Unused


org $B40000
EnemyDropChances:
  .smallEnergy: skip 1 ; 0: Small health
  .bigEnergy: skip 1 ; 1: Big health
  .missiles: skip 1 ; 2: Missiles
  .nothing: skip 1 ; 3: Nothing
  .superMissiles: skip 1 ; 4: Super missiles
  .powerBombs: skip 1 ; 5: Power bombs


org $B88000
DemoRecorder:
  .input: skip 2 ; 0: Controller 1 input
  .new: skip 2 ; 2: Newly pressed controller 1 input
  .layer1X: skip 2 ; 4: Layer 1 X position
  .layer1Y: skip 2 ; 6: Layer 1 Y position
  .SamusX: skip 2 ; 8: Samus X position
  .SamusY: skip 2 ; Ah: Samus Y position
skip $7EF4
  .doorBTS: skip 2 ; FF00h: Door BTS
  .area: skip 2 ; FF02h: Area index
