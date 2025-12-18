
lorom
math pri on

; -------------
; Build options
; -------------

; Defaults will build vanilla NTSC Super Metroid

!FEATURE_KEEP_UNREFERENCED ?= 1

if !FEATURE_KEEP_UNREFERENCED
print "KEEP UNREFERENCED ASSEMBLY"
else
print "REMOVE UNREFERENCED ASSEMBLY"
endif

!DEBUG ?= 1

if !DEBUG
print "DEBUG FEATURES ENABLED"
else
print "DEBUG FEATURES REMOVED"
endif

!PAL ?= 1

if !PAL
print "PAL VERSION"
!FPS = 5/6 ; Multiplier to convert 60fps time to 50fps time. E.g. 1s = 60 frames NTSC = 50 frames PAL
!SPF = 6/5 ; Multiplier to convert 60fps speed to 50fps speed. E.g. 50 px/frame NTSC = 60 px/frame PAL
else
print "NTSC VERSION"
!FPS = 1
!SPF = 1
endif

; Fixes labels to their vanilla asm locations using the %anchor macros. Useful
; to prevent unrelated things from moving around, which would bloat IPS patches
; or break pointers in SMART for example.
!ANCHOR_LABELS ?= 1

incsrc macros.asm ; All macros are defined here
incsrc bank_80.asm ; Game engine
incsrc bank_81.asm ; SRAM, spritemap handling
incsrc bank_82.asm ; Gameplay
incsrc bank_83.asm ; Doors, FX headers
incsrc bank_84.asm ; PLMs (Post-Load Modification blocks)
incsrc bank_85.asm ; Message boxes
incsrc bank_86.asm ; Enemy projectiles
incsrc bank_87.asm ; Animated tiles
incsrc bank_88.asm ; HDMA
incsrc bank_89.asm ; Item graphics, palette blends, FX handler
incsrc bank_8A.asm ; FX tilemaps, scrolling sky tilemaps
incsrc bank_8B.asm ; Cinematics/Cutscenes, credits
incsrc bank_8C.asm ; Cinematic/Cutscene data
incsrc bank_8D.asm ; Enemy projectile spritemaps, Palette FX
incsrc bank_8E.asm ; Menu tiles/palettes
incsrc bank_8F.asm ; PLM populations, room/state headers, room/door ASM, library backgrounds
incsrc bank_90.asm ; Samus drawing, movement, projectile handling, minimap
incsrc bank_91.asm ; Samus, demos, transition tables, X-ray, pose handling
incsrc bank_92.asm ; Samus spritemaps, animation
incsrc bank_93.asm ; Samus projectiles
incsrc bank_94.asm ; Block collision, grapple
incsrc bank_94..99.asm ; Cutscene graphics
incsrc bank_9A.asm ; Projectile graphics, map graphics
incsrc bank_9B.asm ; Grapple, Samus graphics
incsrc bank_9C.asm ; Samus graphics
incsrc bank_9D.asm ; Samus graphics
incsrc bank_9E.asm ; Samus graphics
incsrc bank_9F.asm ; Samus graphics
incsrc bank_A0.asm ; Enemy handlers
incsrc bank_A1.asm ; Enemy populations
incsrc bank_A2.asm ; Enemy AI: Boyon, Stoke, Mama Turtle, Baby Turtle, Puyo, Cacatac, Owtch, Ship, Mellow, Mella, Memu, Multiviola, Polyp, Rinka, Rio, Squeept, Geruta, Holtz, Oum, Choot, Gripper, Ripper II, Dragon, Shutters
incsrc bank_A3.asm ; Enemy AI: Waver, Metaree, Fireflea, Skultera, Elevator, Sciser, Zero, Tripper, Sbug, Mochtroid, Sidehoppers, Zoa, Viola, Bang, Skree, Yard, Reflec, HZoomer, MZoomer, Zoomer, Zeela, Sova, Metroid
incsrc bank_A4.asm ; Enemy AI: Crocomire
incsrc bank_A5.asm ; Enemy AI: Draygon, Spore Spawn
incsrc bank_A6.asm ; Enemy AI: Ridley, Boulder, Kzan, Hibashi, Puromi, MiniKraid, Steam, Ceres door, Zebetite
incsrc bank_A7.asm ; Enemy AI: Kraid, Phantoon, Etecoon, Dachora
incsrc bank_A8.asm ; Enemy AI: Evir, Morph Ball Eye, Fune, Namihe, Coven, Yapping Maw, Kago, Magdollite, Beetom, Powamp, Work Robot, Bull, Alcoon, Atomic, Spark, Face Block, Kihunter
incsrc bank_A9.asm ; Enemy AI: Mother Brain, Baby Metroid, Torizo corpse, Sidehopper corpse, Zoomer corpse, Ripper corpse, Skree corpse
incsrc bank_AA.asm ; Enemy AI: Bomb/Golden Torizo, Tourian statue, Shaktool, Maridia tube, Chozo statue
incsrc bank_AB.asm ; Enemy graphics
incsrc bank_AC.asm ; Enemy graphics
incsrc bank_AD.asm ; Enemy graphics
incsrc bank_AE.asm ; Enemy graphics
incsrc bank_AF.asm ; Enemy graphics
incsrc bank_B0.asm ; Enemy graphics
incsrc bank_B1.asm ; Enemy graphics
incsrc bank_B2.asm ; Enemy AI: Space pirates
incsrc bank_B3.asm ; Enemy AI: Zeb, Zebbo, Gamet, Geega, Botwoon, escape Etecoon, escape Dachora
incsrc bank_B4.asm ; Debug handling, enemy sets/vulnerabilities/drops, sprite objects
incsrc bank_B5.asm ; Area maps
incsrc bank_B6.asm ; Pause menu graphics
incsrc bank_B7.asm ; Enemy graphics
incsrc bank_B8.asm ; Empty (debug demo recorder writes here)
incsrc bank_B9..CE.asm ; CRE, backgrounds, palettes, level data
incsrc bank_CF..DE.asm ; SPC engine
incsrc bank_DF.asm ; Unused music track
incsrc labels.asm ; Labels that don't point directly to ROM/RAM
incsrc memory.asm ; Memory labels

print "Assembly complete. Total bytes written: ", bytes
