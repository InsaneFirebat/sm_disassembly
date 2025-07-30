
; Cutscene graphics

org $94E000


check bankcross off

;;; $E000: Tiles - title BG (mode 7) ;;;
Tiles_Title_Background_Mode7:
; Spills over to next bank
; Decompressed to $7F:0000..3FFF around $8B:9BB7, then transferred to VRAM $0000..3FFF through $2119
incbin "../data/Tiles_Title_Background_Mode7.bin" ; $10D7 bytes


;;; $95:80D8: Tiles - title sprites ;;;
Tiles_Title_Sprite:
; Decompressed to $7F:5000..8FFF around $8B:92A4/9BD9, then transferred to VRAM $6000..7FFF (sprite tiles)
incbin "../data/Tiles_Title_Sprite.bin" ; $2509 bytes


;;; $95:A5E1: Tiles - baby metroid (mode 7) ;;;
Tiles_Baby_Metroid_Mode7:
; Decompressed to $7F:9000..3FF around $8B:9BEA, then transferred to VRAM $3800..FF through $2119 in frames of 100h bytes
incbin "../data/Tiles_Baby_Metroid_Mode7.bin" ; $24E bytes


;;; $95:A82F: Tiles - gunship/Ceres (mode 7) ;;;
Tiles_Gunship_Ceres_Mode7:
; Decompressed to $7F:0000..3FFF around $8B:BCCD/D58D, then transferred to VRAM $0000..3FFF through $2119
incbin "../data/Tiles_Gunship_Ceres_Mode7.bin" ; $285A bytes


;;; $95:D089: Tiles - font 1 ;;;
Tiles_Font1_BG3:
; Decompressed to $7F:8000..88FF around $8B:A410, then transferred to VRAM $4000..447F (BG3 tiles)
incbin "../data/Tiles_Font1_BG3.bin" ; $68A bytes


;;; $95:D713: Tiles - font 2 ;;;
Tiles_Font2_BG3:
; Decompressed to $7F:A000..B1FF around $8B:A549, and then loaded via $8B:8D23 to the $7E:4000..45FF tilemap (and transferred to VRAM $4180..447F)
; 2bpp, Japanese text
incbin "../data/Tiles_Font2_BG3.bin" ; $DAF bytes


;;; $95:E4C2: Tiles - intro sprites ;;;
Tiles_Intro_Sprite:
; Decompressed to $7F:B800..DBFF around $8B:A443, then transferred to VRAM $6E00..7FFF (sprite tiles)
incbin "../data/Tiles_Intro_Sprite.bin" ; $144C bytes


;;; $95:F90E: Tiles - intro BG1/2 ;;;
Tiles_Intro_BG1_BG2:
; Decompressed to $7F:0000..7FFF around $8B:A3FF, then transferred to VRAM $0000..3FFF (BG1/2 tiles)
incbin "../data/Tiles_Intro_BG1_BG2.bin" ; $57FC bytes


;;; $96:D10A: Tiles - space/Ceres ;;;
Tiles_Space_Ceres:
; Decompressed to $7F:5000..8FFF around $8B:BCEF/C187, then transferred to VRAM $6000..7FFF (sprite tiles)
incbin "../data/Tiles_Space_Ceres.bin" ; $1B6C bytes


;;; $96:EC76: Tiles - Zebes ;;;
Tiles_Zebes:
; Decompressed to $7F:5000..8FFF around $8B:C6CF, then transferred to VRAM $6000..7FFF (sprite tiles)
incbin "../data/Tiles_Zebes.bin" ; $F8E bytes


;;; $96:FC04: Tilemap - title (mode 7) ;;;
Title_Mode7_Tilemap:
; Decompressed to $7F:4000..4FFF around $8B:9BC8, then transferred to VRAM $0000..0FFF through $2118
incbin "../data/Title_Mode7_Tilemap.bin" ; $265 bytes


;;; $96:FE69: Tilemaps - gunship/Ceres (mode 7) ;;;
Gunship_Ceres_Tilemap:
; Decompressed to $7F:4000..4FFF around $8B:BCDE/C176/D59E, then transferred to VRAM $0000..02FF/05FF through $2118
; Two frames of 300h bytes for the gunship during the distress signal, reused for the gunship flying to Zebes, first frame is used when flying from Zebes too
; One frame of 600h bytes for Ceres blowing up and the gunship flying to Zebes
; One 400h byte clear tilemap (with tile 8Ch)
incbin "../data/Gunship_Ceres_Tilemap.bin" ; $AB bytes


;;; $96:FF14: Tilemaps - intro BG1 ;;;
Intro_BG1_MotherBrainsRoom_Tilemap:
; Decompressed to $7F:9800..B7FF around $8B:A432, then transferred to VRAM $5000..5FFF (BG1 tilemap)
; One frame of 800h bytes for old Mother Brain's room
; One frame of 800h bytes for baby metroid discovery
; One frame of 800h bytes for baby metroid being delivered
; One frame of 800h bytes for baby metroid being examined
incbin "../data/Intro_BG1_MotherBrainsRoom_Tilemap.bin" ; $9B7 bytes


;;; $97:88CC: Tilemap - intro BG2 (Samus head) ;;;
Intro_BG2_SamusHead_Tilemap:
; Decompressed to $7F:9000..97FF around $8B:A421, then transferred to VRAM $4800..4BFF (BG2 tilemap)
incbin "../data/Intro_BG2_SamusHead_Tilemap.bin" ; $20F bytes


;;; $97:8ADB: Tilemap - Zebes ;;;
Zebes_Tilemap:
; Decompressed to $7F:9000..97FF around $8B:C6BE, then transferred to VRAM $5C00..5FFF (BG1 tilemap)
incbin "../data/Zebes_Tilemap.bin" ; $237 bytes


;;; $97:8D12: Tilemap - intro BG3 (the last Metroid is in captivity) ;;;
Intro_BG3_TheLastMetroidIsInCaptivity_Tilemap:
; Decompressed to $7F:E000..E7FF around $8B:A454, then transferred to VRAM $4C00..4FFF (BG3 tilemap)
incbin "../data/Intro_BG3_TheLastMetroidIsInCaptivity_Tilemap.bin" ; $E2 bytes


;;; $97:8DF4: Tilemap - game options menu - options screen ;;;
GameOptionsMenu_OptionsScreen_Tilemap:
; Decompressed to $7F:C000..C7FF around $82:EC77, eventually copied to $7E:3000..37FF and transferred to VRAM $5000 (BG1 tilemap)
incbin "../data/GameOptionsMenu_OptionsScreen_Tilemap.bin" ; $1D9 bytes


;;; $97:8FCD: Tilemap - game options menu - controller settings - English ;;;
GameOptionsMenu_ControllerSettings_English_Tilemap:
; Decompressed to $7F:C800..CFFF around $82:EC88, eventually copied to $7E:3000..37FF and transferred to VRAM $5000 (BG1 tilemap)
incbin "../data/GameOptionsMenu_ControllerSettings_English_Tilemap.bin" ; $1F7 bytes


;;; $97:91C4: Tilemap - game options menu - controller settings - Japanese ;;;
GameOptionsMenu_ControllerSettings_Japanese_Tilemap:
; Decompressed to $7F:D000..D7FF around $82:EC99, eventually copied to $7E:3000..37FF and transferred to VRAM $5000 (BG1 tilemap)
incbin "../data/GameOptionsMenu_ControllerSettings_Japanese_Tilemap.bin" ; $1C9 bytes


;;; $97:938D: Tilemap - game options menu - special settings - English ;;;
GameOptionsMenu_SpecialSettings_English_Tilemap:
; Decompressed to $7F:D800..DFFF around $82:ECAA, eventually copied to $7E:3000..37FF and transferred to VRAM $5000 (BG1 tilemap)
incbin "../data/GameOptionsMenu_SpecialSettings_English_Tilemap.bin" ; $1AD bytes


;;; $97:953A: Tilemap - game options menu - special settings - Japanese ;;;
GameOptionsMenu_SpecialSettings_Japanese_Tilemap:
; Decompressed to $7F:E000..E7FF around $82:ECBB, eventually copied to $7E:3000..37FF and transferred to VRAM $5000 (BG1 tilemap)
incbin "../data/GameOptionsMenu_SpecialSettings_Japanese_Tilemap.bin" ; $1BA bytes


;;; $97:96F4: Tilemap - Samus waiting for the credits to end ;;;
Samus_Waiting_for_Credits_to_End_Tilemap:
; Decompressed to $7F:E000..E7FF around $8B:DEF1, then transferred to VRAM $4C00..4FFF (BG2 tilemap)
incbin "../data/Samus_Waiting_for_Credits_to_End_Tilemap.bin" ; $10F bytes


;;; $97:9803: Tiles - Samus waiting for the credits to end ;;;
Tiles_Samus_Waiting_for_Credits_to_End:
; Decompressed to $7F:0000..3FFF around $8B:DEAD, then transferred to VRAM $5000..5FFF (BG2 tiles)
; First frame is always loaded
; Both frames are loaded to VRAM $0000..1FFF if player got the bad ending
incbin "../data/Tiles_Samus_Waiting_for_Credits_to_End.bin" ; $2154 bytes


;;; $97:B957: Tiles - post-credits suitless Samus ;;;
Tiles_PostCredits_SuitlessSamus:
; Decompressed to $7E:2000..5FFF around $8B:DEBE, then transferred to VRAM $0000..1FFF (sprite tiles)
incbin "../data/Tiles_PostCredits_SuitlessSamus.bin" ; $1EA5 bytes


;;; $97:D7FC: Tiles - post-credits Samus shooting the screen ;;;
Tiles_PostCredits_Samus_Shooting_the_Screen:
; Decompressed to $7E:6000..9FFF around $8B:DECF, then transferred to VRAM $6000..7FFF (sprite tiles)
incbin "../data/Tiles_PostCredits_Samus_Shooting_the_Screen.bin" ; $FE2 bytes


;;; $97:E7DE: Tiles - font 3 ;;;
Tiles_Font3_Background:
; Decompressed to $7E:A000..B7FF / $7F:C000..D7FF around $8B:D604/$DEE0/$E41F, then transferred to VRAM $5000..57FF / $4000..47FF / $4800..49FF (BG tiles)
incbin "../data/Tiles_Font3_Background.bin" ; $721 bytes


;;; $97:EEFF: Tilemap - credits ;;;
Credits_Tilemap:
; Decompressed to $7F:0000..1FFF around $8B:E0CE, eventually copied to $7E:3000..37FF and transferred to VRAM $4800 (BG1 tilemap)
incbin "../data/Credits_Tilemap.bin" ; $A88 bytes


;;; $97:F987: Interleaved tiles/tilemap - post-credits Samus beam (mode 7) ;;;
InterleavedTilesTilemapPostCreditsSamusBeamMode7:
; Decompressed to $7F:4000..BFFF around $8B:DF02, transferred to VRAM $0000..3FFF
incbin "../data/InterleavedTilesTilemapPostCreditsSamusBeamMode7.bin" ; $97C bytes


;;; $98:8304: Tiles - Zebes explosion ;;;
Tiles_Zebes_Explosion:
; Decompressed to $7F:8000..DFFF around $8B:D57C, then transferred to VRAM $4000..6FFF (BG1/BG2/sprite tiles)
incbin "../data/Tiles_Zebes_Explosion.bin" ; $32BD bytes


;;; $98:B5C1: Tilemap - wide part of Zebes explosion ;;;
Wide_Part_of_Zebes_Explosion_Tilemap:
; Decompressed to $7F:E000..E7FF around $8B:D5C0, then transferred to VRAM $7000..73FF (BG1 tilemap)
incbin "../data/Wide_Part_of_Zebes_Explosion_Tilemap.bin" ; $296 bytes


;;; $98:B857: Tilemap - concentric wide part of Zebes explosion ;;;
Concentric_Wide_Part_of_Zebes_Explosion_Tilemap:
; Decompressed to $7F:E800..EFFF around $8B:D5D1, then transferred to VRAM $7400..77FF (BG1 tilemap)
incbin "../data/Concentric_Wide_Part_of_Zebes_Explosion_Tilemap.bin" ; $296 bytes


;;; $98:BAED: Tilemap - eclipse of Zebes during explosion ;;;
Eclipse_of_Zebes_during_Explosion_Tilemap:
; Decompressed to $7F:F000..F7FF around $8B:D5E2, then transferred to VRAM $7800..7BFF (BG2 tilemap)
incbin "../data/Eclipse_of_Zebes_during_Explosion_Tilemap.bin" ; $1E0 bytes


;;; $98:BCCD: Tilemap - blank ;;;
Blank_BG2_Tilemap:
; Decompressed to $7F:F800..FFFF around $8B:D5F3, then transferred to VRAM $7C00..7FFF (BG2 tilemap)
incbin "../data/Blank_BG2_Tilemap.bin" ; $9 bytes


;;; $98:BCD6: Tiles - Zebes being zoomed out during Zebes explosion (mode 7) ;;;
Tiles_Zebes_Being_Zoomed_Out_during_Zebes_Explosion_Mode7:
; Decompressed to $7F:0000..3FFF around $8B:D4C5, then transferred to VRAM $0000..3FFF through $2119
incbin "../data/Tiles_Zebes_Being_Zoomed_Out_during_Zebes_Explosion_Mode7.bin" ; $3079 bytes


;;; $98:ED4F: Tiles - grey clouds during Zebes explosion (mode 7) ;;;
Tiles_Grey_Clouds_during_Zebes_Explosion_Mode7:
; Decompressed to $7E:2000..5FFF around $8B:D786, then transferred to VRAM $0000..3FFF through $2119
incbin "../data/Tiles_Grey_Clouds_during_Zebes_Explosion_Mode7.bin" ; $23B1 bytes


;;; $99:9101: Tiles - big Zebes during Zebes explosion (mode 7) ;;;
Tiles_Big_Zebes_during_Zebes_Explosion:
; Decompressed to $7E:6000..9FFF around $8B:D88C, then transferred to VRAM $0000..3FFF through $2119
incbin "../data/Tiles_Big_Zebes_during_Zebes_Explosion.bin" ; $146E bytes


;;; $99:A56F: Tiles - yellow clouds during Zebes explosion ;;;
Tiles_Yellow_Clouds_during_Zebes_Explosion:
; Decompressed to $7F:4000..7FFF around $8B:D4D6, then transferred to VRAM $6000..7FFF (sprite tiles)
incbin "../data/Tiles_Yellow_Clouds_during_Zebes_Explosion.bin" ; $2C0F bytes


;;; $99:D17E: Interleaved tiles/tilemap - Zebes being zoomed out during Zebes explosion tilemap (mode 7) ;;;
InterleavedTilesTilemap_ZebesBeingZoomedOutExplosion_Mode7:
; Decompressed to $7F:8000..BFFF around $8B:D4E7, then transferred to VRAM $0000..1FFF and $2000..3FFF
; The tiles bytes are zero/ignored >_<;
incbin "../data/InterleavedTilesTilemap_ZebesBeingZoomedOutExplosion_Mode7.bin" ; $4DD bytes


;;; $99:D65B: Interleaved tiles/tilemap - grey clouds during Zebes explosion tilemap (mode 7) ;;;
InterleavedTilesTilemap_GreyCloudsDuringZebesExplosion_Mode7:
; Decompressed to $7E:2000..5FFF around $8B:D615, then transferred to VRAM $0000..1FFF and $2000..3FFF
; The tiles bytes are zero/ignored >_<;
incbin "../data/InterleavedTilesTilemap_GreyCloudsDuringZebesExplosion_Mode7.bin" ; $2D7 bytes


;;; $99:D932: Interleaved tiles/tilemap - big Zebes during Zebes explosion tilemap (mode 7) ;;;
InterleavedTilesTilemap_BigZebesDuringZebesExplosion_Mode7:
; Decompressed to $7E:6000..9FFF around $8B:D626, then transferred to VRAM $0000..1FFF and $2000..3FFF
; The tiles bytes are zero/ignored >_<;
incbin "../data/InterleavedTilesTilemap_BigZebesDuringZebesExplosion_Mode7.bin" ; $16D bytes


;;; $99:DA9F: Tiles - post-credits Samus transformation effect ;;;
Tiles_PostCredits_Samus_Transformation_Effect:
; Decompressed to $7F:E800..FF around $8B:DF13, then transferred to VRAM $2000..7F (BG3 tiles)
incbin "../data/Tiles_PostCredits_Samus_Transformation_Effect.bin" ; $12 bytes


;;; $99:DAB1: Tilemap - post-credits Samus transformation effect ;;;
PostCredits_Samus_Transformation_Effect_Tilemap:
; Decompressed to $7F:F000..F7FF around $8B:DF24, then transferred to VRAM $2400..27FF (BG3 tilemap)
incbin "../data/PostCredits_Samus_Transformation_Effect_Tilemap.bin" ; $5D8 bytes


;;; $99:E089: Tiles - post-credits Super Metroid icon ;;;
Tiles_PostCredits_SuperMetroid_Icon:
; Decompressed to $7E:6000..7FFF around $8B:DFF9, then transferred to VRAM $6000..6FFF (BG2/sprite tiles)
incbin "../data/Tiles_PostCredits_SuperMetroid_Icon.bin" ; $C3B bytes


;;; $99:ECC4: Tilemap - post-credits Super Metroid icon ;;;
PostCredits_SuperMetroid_Icon_Tilemap:
; Decompressed to $7E:8000..87FF around $8B:E00A, then transferred to VRAM $5400..57FF
incbin "../data/PostCredits_SuperMetroid_Icon_Tilemap.bin" ; $15D bytes

check bankcross on


Freespace_Bank99_EE21:                                                   ;99EE21;
; $11DF bytes
