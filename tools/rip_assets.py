#!/usr/bin/env python3
#
# Copyright (c) 2022 yuriks
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import argparse
import hashlib
from pathlib import Path
import sys
import zlib


SM_NTSC_CRC32 = 0xD63ED5F8
SM_NTSC_SHA256 = "12b77c4bc9c1832cee8881244659065ee1d84c70c3d29e6eaf92e6798cc2ca72"


def make_argument_parser():
    parser = argparse.ArgumentParser(
            description="Splits out data from an SM ROM into separate data files for use with the disassembly.")
    parser.add_argument('rom_file', type=argparse.FileType('rb'),
            help="Path to input ROM file. Must be an unheadered SM NTSC or PAL ROM.")
    parser.add_argument('--pal', action='store_true',
            help="Rip assets for PAL build from PAL ROM")
    group = parser.add_mutually_exclusive_group(required=True)
    group.add_argument('--output', '-o', type=Path,
            help="Directory to output split files to. Will be created if it doesn't exist.")
    group.add_argument('--check', '-c', action='store_true',
            help="Simply check validity of the file instead of splitting anything.")

    return parser


def addr_to_lorom_offset(addr):
    bank = addr >> 16
    bank_offset = (addr & 0xFFFF) - 0x8000

    if bank < 0x80 or bank_offset < 0:
        raise ValueError(f"{addr:X} is not a valid LoROM address")

    return (bank - 0x80) * 0x8000 + bank_offset


def rom_valid(rom_data):
    if len(rom_data) != 0x300000: # 3MB
        print("Unexpected size: " + str(len(rom_data)))
        return False

    if zlib.crc32(rom_data) != SM_NTSC_CRC32:
        print("Unexpected CRC32: " + hex(zlib.crc32(rom_data))[2:].upper())
        return False

    if hashlib.sha256(rom_data).hexdigest() != SM_NTSC_SHA256:
        print("Unexpected SHA256: " + hashlib.sha256(rom_data).hexdigest())
        return False

    return True


def write_file(path, data):
    try:
        print(f"Writing {path}...", file=sys.stderr)
        path.write_bytes(data)
    except FileNotFoundError:
        # Try to create parent directory and try again
        print(f"Creating {path.parent}...")
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(data)


def dump_rom(rom_data, output_path, is_pal):
    def dump_range(lorom_addr_start, lorom_addr_end, filename):
        offset_start = addr_to_lorom_offset(lorom_addr_start)
        offset_end = addr_to_lorom_offset(lorom_addr_end) # inclusive end
        dump(lorom_addr_start, offset_end + 1 - offset_start, filename)

    def dump(lorom_addr, length, filename):
        hex2snes = lambda address: address << 1 & 0xFF0000 | address & 0xFFFF | 0x808000
        
        offset_start = addr_to_lorom_offset(lorom_addr)
        offset_end = offset_start + length
        if offset_end > len(rom_data):
            raise ValueError("File offset out of bounds")

        data_to_dump = rom_data[offset_start:offset_end]
        write_file(output_path / filename, data_to_dump)
        
        return hex2snes(offset_end)


#    dump(0x80_8000, 0x8000, "bank_80.bin") # System routines
#    dump(0x81_8000, 0x8000, "bank_81.bin") # SRAM, spritemap processing & menus
#    dump(0x82_8000, 0x8000, "bank_82.bin") # Top level main game routines
#    dump(0x83_8000, 0x8000, "bank_83.bin") # FX and door definitions
#    dump(0x84_8000, 0x8000, "bank_84.bin") # PLMs
#    dump(0x85_8000, 0x8000, "bank_85.bin") # Message boxes

#    dump(0x86_8000, 0x8000, "bank_86.bin") # Enemy projectiles
    if not is_pal:
        dump(0x86_A9BD, 0x0080, "Tiles_EnemyProj_QuestionMark.bin") # Enemy projectiles
    else:
        dump(0x86_A9F9, 0x0080, "Tiles_EnemyProj_QuestionMark.bin") # Enemy projectiles

#    dump(0x87_8000, 0x8000, "bank_87.bin") # Animated tiles
    dump(0x87_8564, 0x0200, "AnimatedTiles_CrateriaLake_0.bin")
    dump(0x87_8764, 0x0200, "AnimatedTiles_CrateriaLake_1.bin")
    dump(0x87_8964, 0x0200, "AnimatedTiles_CrateriaLake_2.bin")
    dump(0x87_8B64, 0x00C0, "UNUSED_AnimatedTiles_CrateriaLava_0.bin")
    dump(0x87_8C24, 0x00C0, "UNUSED_AnimatedTiles_CrateriaLava_1.bin")
    dump(0x87_8CE4, 0x00C0, "UNUSED_AnimatedTiles_CrateriaLava_2.bin")
    dump(0x87_8DA4, 0x00C0, "UNUSED_AnimatedTiles_CrateriaLava_3.bin")
    dump(0x87_8E64, 0x0020, "AnimatedTiles_WreckedShipTreadmill_0.bin")
    dump(0x87_8E84, 0x0020, "AnimatedTiles_WreckedShipTreadmill_1.bin")
    dump(0x87_8EA4, 0x0020, "AnimatedTiles_WreckedShipTreadmill_2.bin")
    dump(0x87_8EC4, 0x0020, "AnimatedTiles_WreckedShipTreadmill_3.bin")
    dump(0x87_8EE4, 0x0080, "AnimatedTiles_WreckedShipScreen_0.bin")
    dump(0x87_8F64, 0x0080, "AnimatedTiles_WreckedShipScreen_1.bin")
    dump(0x87_8FE4, 0x0080, "AnimatedTiles_WreckedShipScreen_2.bin")
    dump(0x87_9064, 0x0100, "AnimatedTiles_X_879064.bin")
    dump(0x87_9164, 0x0020, "AnimatedTiles_MaridiaSandFalling_0.bin")
    dump(0x87_9184, 0x0020, "AnimatedTiles_MaridiaSandFalling_1.bin")
    dump(0x87_91A4, 0x0020, "AnimatedTiles_MaridiaSandFalling_2.bin")
    dump(0x87_91C4, 0x0020, "AnimatedTiles_MaridiaSandFalling_3.bin")
    dump(0x87_91E4, 0x0040, "AnimatedTiles_MaridiaSandCeiling_0.bin")
    dump(0x87_9224, 0x0040, "AnimatedTiles_MaridiaSandCeiling_1.bin")
    dump(0x87_9264, 0x0040, "AnimatedTiles_MaridiaSandCeiling_2.bin")
    dump(0x87_92A4, 0x0040, "AnimatedTiles_MaridiaSandCeiling_3.bin")
    dump(0x87_92E4, 0x0080, "AnimatedTiles_X_8792E4.bin")
    dump(0x87_9364, 0x0080, "AnimatedTiles_PhantoonStatue_0.bin")
    dump(0x87_93E4, 0x0080, "AnimatedTiles_PhantoonStatue_1.bin")
    dump(0x87_9464, 0x0080, "AnimatedTiles_PhantoonStatue_2.bin")
    dump(0x87_94E4, 0x0040, "AnimatedTiles_RidleyStatue_0.bin")
    dump(0x87_9524, 0x0040, "AnimatedTiles_RidleyStatue_1.bin")
    dump(0x87_9564, 0x0040, "AnimatedTiles_RidleyStatue_2.bin")
    dump(0x87_95A4, 0x0080, "AnimatedTiles_DraygonStatue_0.bin")
    dump(0x87_9624, 0x0080, "AnimatedTiles_DraygonStatue_1.bin")
    dump(0x87_96A4, 0x0080, "AnimatedTiles_DraygonStatue_2.bin")
    dump(0x87_9724, 0x0040, "AnimatedTiles_KraidStatue_0.bin")
    dump(0x87_9764, 0x0040, "AnimatedTiles_KraidStatue_1.bin")
    dump(0x87_97A4, 0x0040, "AnimatedTiles_KraidStatue_2.bin")
    dump(0x87_97E4, 0x0080, "AnimatedTiles_PhantoonStatue_Other.bin")
    dump(0x87_9864, 0x0040, "AnimatedTiles_RidleyStatue_Other.bin")
    dump(0x87_98A4, 0x0040, "AnimatedTiles_DraygonStatue_Other.bin")
    dump(0x87_98E4, 0x0080, "AnimatedTiles_KraidStatue_Other.bin")
    dump(0x87_9964, 0x00E0, "AnimatedTiles_BrinstarMouth_0.bin")
    dump(0x87_9A44, 0x00E0, "AnimatedTiles_BrinstarMouth_1.bin")
    dump(0x87_9B24, 0x00E0, "AnimatedTiles_BrinstarMouth_2.bin")
    dump(0x87_9C04, 0x0080, "AnimatedTiles_VerticalSpikes_0.bin")
    dump(0x87_9C84, 0x0080, "AnimatedTiles_VerticalSpikes_1.bin")
    dump(0x87_9D04, 0x0080, "AnimatedTiles_VerticalSpikes_2.bin")
    dump(0x87_9D84, 0x0080, "AnimatedTiles_HorizontalSpikes_0.bin")
    dump(0x87_9E04, 0x0080, "AnimatedTiles_HorizontalSpikes_1.bin")
    dump(0x87_9E84, 0x0080, "AnimatedTiles_HorizontalSpikes_2.bin")
    dump(0x87_9F04, 0x0660, "AnimatedTiles_X_879F04.bin")
    dump(0x87_A564, 0x0040, "AnimatedTiles_Lava_0.bin")
    dump(0x87_A5A4, 0x0040, "AnimatedTiles_Lava_1.bin")
    dump(0x87_A5E4, 0x0040, "AnimatedTiles_Lava_2.bin")
    dump(0x87_A624, 0x0040, "AnimatedTiles_Lava_3.bin")
    dump(0x87_A664, 0x0040, "AnimatedTiles_Lava_4.bin")
    dump(0x87_A6A4, 0x0040, "AnimatedTiles_Acid_0.bin")
    dump(0x87_A6E4, 0x0040, "AnimatedTiles_Acid_1.bin")
    dump(0x87_A724, 0x0040, "AnimatedTiles_Acid_2.bin")
    dump(0x87_A764, 0x0040, "AnimatedTiles_Acid_3.bin")
    dump(0x87_A7A4, 0x0040, "AnimatedTiles_Acid_4.bin")
    dump(0x87_A7E4, 0x0030, "AnimatedTiles_Spores_0.bin")
    dump(0x87_A814, 0x0030, "AnimatedTiles_Spores_1.bin")
    dump(0x87_A844, 0x0030, "AnimatedTiles_Spores_2.bin")
    dump(0x87_A874, 0x0050, "AnimatedTiles_Rain_0.bin")
    dump(0x87_A8C4, 0x0050, "AnimatedTiles_Rain_1.bin")
    dump(0x87_A914, 0x0050, "AnimatedTiles_Rain_2.bin")
    dump(0x87_A964, 0x0050, "AnimatedTiles_Rain_3.bin")
    dump(0x87_A9B4, 0x0050, "AnimatedTiles_Rain_4.bin")
    dump(0x87_AD64, 0x0600, "Tiles_TourianEntranceStatueGhost.bin")
    dump(0x87_B364, 0x1600, "Tiles_TourianEntranceStatue.bin")

#    dump(0x88_8000, 0x8000, "bank_88.bin") # HDMA

#    dump(0x89_8000, 0x8000, "bank_89.bin") # Item PLM graphics, FX loader
    dump(0x89_8000, 0x0100, "ItemPLMGraphics_Bombs.bin")
    dump(0x89_8100, 0x0100, "ItemPLMGraphics_GravitySuit.bin")
    dump(0x89_8200, 0x0100, "ItemPLMGraphics_SpringBall.bin")
    dump(0x89_8300, 0x0100, "ItemPLMGraphics_VariaSuit.bin")
    dump(0x89_8400, 0x0100, "ItemPLMGraphics_HiJumpBoots.bin")
    dump(0x89_8500, 0x0100, "ItemPLMGraphics_ScrewAttack.bin")
    dump(0x89_8600, 0x0100, "ItemPLMGraphics_SpaceJump.bin")
    dump(0x89_8700, 0x0100, "ItemPLMGraphics_MorphBall.bin")
    dump(0x89_8800, 0x0100, "ItemPLMGraphics_GrappleBeam.bin")
    dump(0x89_8900, 0x0100, "ItemPLMGraphics_XrayScope.bin")
    dump(0x89_8A00, 0x0100, "ItemPLMGraphics_SpeedBooster.bin")
    dump(0x89_8B00, 0x0100, "ItemPLMGraphics_ChargeBeam.bin")
    dump(0x89_8C00, 0x0100, "ItemPLMGraphics_IceBeam.bin")
    dump(0x89_8D00, 0x0100, "ItemPLMGraphics_WaveBeam.bin")
    dump(0x89_8E00, 0x0100, "ItemPLMGraphics_PlasmaBeam.bin")
    dump(0x89_8F00, 0x0100, "ItemPLMGraphics_Spazer.bin")
    dump(0x89_9000, 0x0100, "ItemPLMGraphics_ReserveTank.bin")

#    dump(0x8A_8000, 0x8000, "bank_8a.bin") # FX tilemaps
#    dump(0x8B_8000, 0x8000, "bank_8b.bin") # Non gameplay routines
#    dump(0x8C_8000, 0x8000, "bank_8c.bin") # Title sequence and intro
#    dump(0x8D_8000, 0x8000, "bank_8d.bin") # Enemy projectile spritemaps, palette FX objects

#    dump(0x8E_8000, 0x8000, "bank_8e.bin") # Menu tiles
    dump(0x8E_8000, 0x5600, "Tiles_Menu_BG1_BG2.bin")
    dump(0x8E_D600, 0x0600, "Tiles_Beta_Minimap_Area_Select_BG3.bin")

#    dump(0x8F_8000, 0x8000, "bank_8f.bin") # Rooms definitions
#    dump(0x90_8000, 0x8000, "bank_90.bin") # Samus
#    dump(0x91_8000, 0x8000, "bank_91.bin") # Aran
#    dump(0x92_8000, 0x8000, "bank_92.bin") # Samus animations
#    dump(0x93_8000, 0x8000, "bank_93.bin") # Projectiles

#    dump(0x94_8000, 0x8000, "bank_94.bin") # Block properties, some cutscene graphics
    dump(0x94_C800, 0x1400, "Tiles_GunshipLiftoffDustClouds.bin")
    
    p = 0x94_E000
    p = dump(p, 0x20D8, "Tiles_Title_Background_Mode7.bin")

#    dump(0x95_8000, 0x8000, "bank_95.bin") # Cutscene graphics
    p = dump(p, 0x2509, "Tiles_Title_Sprite.bin")
    p = dump(p, 0x024E, "Tiles_Baby_Metroid_Mode7.bin")
    p = dump(p, 0x285A, "Tiles_Gunship_Ceres_Mode7.bin")
    if not is_pal:
        p = dump(p, 0x068A, "Tiles_Font1_BG3.bin")
        p = dump(p, 0x0DAF, "Tiles_Font2_BG3.bin")
    else:
        p = dump(p, 0x07E5, "Tiles_Font1_BG3_PAL.bin")
        p = dump(p, 0x0709, "Intro_BG3_Text_Tilemap_PAL.bin")

    p = dump(p, 0x144C, "Tiles_Intro_Sprite.bin")
    p = dump(p, 0x57FC, "Tiles_Intro_BG1_BG2.bin")

#    dump(0x96_8000, 0x8000, "bank_96.bin") # Cutscene graphics
    if not is_pal:
        p = dump(p, 0x1B6C, "Tiles_Space_Ceres.bin")
        p = dump(p, 0x0F8E, "Tiles_Zebes.bin")
    else:
        p = dump(p, 0x1CE9, "Tiles_Space_Ceres_PAL.bin")
        p = dump(p, 0x109A, "Tiles_Zebes_PAL.bin")

    p = dump(p, 0x0265, "Title_Mode7_Tilemap.bin")
    p = dump(p, 0x00AB, "Gunship_Ceres_Tilemap.bin")
    p = dump(p, 0x09B8, "Intro_BG1_MotherBrainsRoom_Tilemap.bin")

#    dump(0x97_8000, 0x8000, "bank_97.bin") # Cutscene graphics
    p = dump(p, 0x020F, "Intro_BG2_SamusHead_Tilemap.bin")
    p = dump(p, 0x0237, "Zebes_Tilemap.bin")
    p = dump(p, 0x00E2, "Intro_BG3_TheLastMetroidIsInCaptivity_Tilemap.bin")
    if not is_pal:
        p = dump(p, 0x01D9, "GameOptionsMenu_OptionsScreen_Tilemap.bin")
    else:
        p = dump(p, 0x019E, "GameOptionsMenu_OptionsScreen_Tilemap_PAL.bin")

    p = dump(p, 0x01F7, "GameOptionsMenu_ControllerSettings_English_Tilemap.bin")
    p = dump(p, 0x01C9, "GameOptionsMenu_ControllerSettings_Japanese_Tilemap.bin")
    p = dump(p, 0x01AD, "GameOptionsMenu_SpecialSettings_English_Tilemap.bin")
    p = dump(p, 0x01BA, "GameOptionsMenu_SpecialSettings_Japanese_Tilemap.bin")
    p = dump(p, 0x010F, "Samus_Waiting_for_Credits_to_End_Tilemap.bin")
    p = dump(p, 0x2154, "Tiles_Samus_Waiting_for_Credits_to_End.bin")
    p = dump(p, 0x1EA5, "Tiles_PostCredits_SuitlessSamus.bin")
    p = dump(p, 0x0FE2, "Tiles_PostCredits_Samus_Shooting_the_Screen.bin")
    if not is_pal:
        p = dump(p, 0x0721, "Tiles_Font3_Background.bin")
        p = dump(p, 0x0A88, "Credits_Tilemap.bin")
    else:
        p = dump(p, 0x08A5, "Tiles_Font3_Background_PAL.bin")
        p = dump(p, 0x0A88, "Credits_Tilemap_PAL.bin")

    p = dump(p, 0x097D, "InterleavedTilesTilemapPostCreditsSamusBeamMode7.bin")

#    dump(0x98_8000, 0x8000, "bank_98.bin") # Cutscene graphics
    p = dump(p, 0x32BD, "Tiles_Zebes_Explosion.bin")
    p = dump(p, 0x0296, "Wide_Part_of_Zebes_Explosion_Tilemap.bin")
    p = dump(p, 0x0296, "Concentric_Wide_Part_of_Zebes_Explosion_Tilemap.bin")
    p = dump(p, 0x01E0, "Eclipse_of_Zebes_during_Explosion_Tilemap.bin")
    p = dump(p, 0x0009, "Blank_BG2_Tilemap.bin")
    p = dump(p, 0x3079, "Tiles_Zebes_Being_Zoomed_Out_during_Zebes_Explosion_Mode7.bin")
    p = dump(p, 0x23B2, "Tiles_Grey_Clouds_during_Zebes_Explosion_Mode7.bin")

#    dump(0x99_8000, 0x8000, "bank_99.bin") # Cutscene graphics
    p = dump(p, 0x146E, "Tiles_Big_Zebes_during_Zebes_Explosion.bin")
    p = dump(p, 0x2C0F, "Tiles_Yellow_Clouds_during_Zebes_Explosion.bin")
    p = dump(p, 0x04DD, "InterleavedTilesTilemap_ZebesBeingZoomedOutExplosion_Mode7.bin")
    p = dump(p, 0x02D7, "InterleavedTilesTilemap_GreyCloudsDuringZebesExplosion_Mode7.bin")
    p = dump(p, 0x016D, "InterleavedTilesTilemap_BigZebesDuringZebesExplosion_Mode7.bin")
    p = dump(p, 0x0012, "Tiles_PostCredits_Samus_Transformation_Effect.bin")
    p = dump(p, 0x05D8, "PostCredits_Samus_Transformation_Effect_Tilemap.bin")
    p = dump(p, 0x0C3B, "Tiles_PostCredits_SuperMetroid_Icon.bin")
    dump(p, 0x015D, "PostCredits_SuperMetroid_Icon_Tilemap.bin")

#    dump(0x9A_8000, 0x8000, "bank_9a.bin") # Projectile and map graphics
    dump(0x9A_8200, 0x0800, "Tiles_GrappleBeam_Horizontal_Beam.bin")
    dump(0x9A_8A00, 0x0800, "Tiles_GrappleBeam_Diagonal_Beam.bin")
    dump(0x9A_9200, 0x0800, "Tiles_GrappleBeam_Vertical_Beam.bin")
    dump(0x9A_9A00, 0x0200, "Tiles_NonClosed_ArmCannon_Vertical_0.bin")
    dump(0x9A_9C00, 0x0200, "Tiles_NonClosed_ArmCannon_Vertical_1.bin")
    dump(0x9A_9E00, 0x0200, "Tiles_NonClosed_ArmCannon_Vertical_2.bin")
    dump(0x9A_A000, 0x0200, "Tiles_NonClosed_ArmCannon_Horizontal_0.bin")
    dump(0x9A_A200, 0x0200, "Tiles_NonClosed_ArmCannon_Horizontal_1.bin")
    dump(0x9A_A400, 0x0200, "Tiles_NonClosed_ArmCannon_Horizontal_2.bin")
    dump(0x9A_A600, 0x0200, "Tiles_NonClosed_ArmCannon_DownwardsDiagonal_0.bin")
    dump(0x9A_A800, 0x0200, "Tiles_NonClosed_ArmCannon_DownwardsDiagonal_1.bin")
    dump(0x9A_AA00, 0x0200, "Tiles_NonClosed_ArmCannon_DownwardsDiagonal_2.bin")
    dump(0x9A_AC00, 0x0200, "Tiles_NonClosed_ArmCannon_UpwardsDiagonal_0.bin")
    dump(0x9A_AE00, 0x0200, "Tiles_NonClosed_ArmCannon_UpwardsDiagonal_1.bin")
    dump(0x9A_B000, 0x0200, "Tiles_NonClosed_ArmCannon_UpwardsDiagonal_2.bin")
    dump(0x9A_B200, 0x1000, "Tiles_Standard_BG3.bin")
    dump(0x9A_D200, 0x1800, "Tiles_Standard_Sprite_0.bin")
    dump(0x9A_EA00, 0x0800, "Tiles_Standard_Sprite_1.bin")
    dump(0x9A_F200, 0x0200, "Tiles_PowerBeam.bin")
    dump(0x9A_F400, 0x0200, "Tiles_IceBeam.bin")
    dump(0x9A_F600, 0x0200, "Tiles_WaveBeam.bin")
    dump(0x9A_F800, 0x0200, "Tiles_PlasmaBeam.bin")
    dump(0x9A_FA00, 0x0200, "Tiles_Spazer.bin")

#    dump(0x9B_8000, 0x8000, "bank_9b.bin") # Grapple beam and Samus graphics
    dump(0x9B_8000, 0x1400, "Tiles_SamusDeathSequence.bin")
    dump(0x9B_E000, 0x0020, "SamusTiles_Top_Set8_Entry0.bin")
    dump(0x9B_E020, 0x0020, "SamusTiles_Top_Set8_Entry1.bin")
    dump(0x9B_E040, 0x0120, "SamusTiles_Top_Set8_Entry2.bin")
    dump(0x9B_E160, 0x00E0, "SamusTiles_Top_Set8_Entry3.bin")
    dump(0x9B_E240, 0x0160, "SamusTiles_Top_Set8_Entry4.bin")
    dump(0x9B_E3A0, 0x01E0, "SamusTiles_Top_Set8_Entry5.bin")
    dump(0x9B_E580, 0x0100, "SamusTiles_Top_Set8_Entry6.bin")
    dump(0x9B_E680, 0x0140, "SamusTiles_Top_Set8_Entry7.bin")
    dump(0x9B_E7C0, 0x0160, "SamusTiles_Top_Set8_Entry8.bin")
    dump(0x9B_E920, 0x00E0, "SamusTiles_Top_Set8_Entry9.bin")
    dump(0x9B_EA00, 0x0200, "SamusTiles_Bottom_Set8_Entry0.bin")
    dump(0x9B_EC00, 0x0200, "SamusTiles_Bottom_Set8_Entry1.bin")
    dump(0x9B_EE00, 0x0020, "SamusTiles_Bottom_Set8_Entry2.bin")
    dump(0x9B_EE20, 0x00C0, "SamusTiles_Top_Set9_Entry0.bin")
    dump(0x9B_EEE0, 0x00C0, "SamusTiles_Top_Set9_Entry1.bin")
    dump(0x9B_EFA0, 0x00E0, "SamusTiles_Top_Set9_Entry2.bin")
    dump(0x9B_F080, 0x0100, "SamusTiles_Top_Set9_Entry3.bin")
    dump(0x9B_F180, 0x00C0, "SamusTiles_Top_Set9_Entry4.bin")
    dump(0x9B_F240, 0x00E0, "SamusTiles_Top_Set9_Entry5.bin")
    dump(0x9B_F320, 0x0100, "SamusTiles_Top_Set9_Entry6.bin")
    dump(0x9B_F420, 0x0100, "SamusTiles_Top_Set9_Entry7.bin")
    dump(0x9B_F520, 0x0120, "SamusTiles_Top_Set9_Entry8.bin")
    dump(0x9B_F640, 0x0120, "SamusTiles_Top_Set9_Entry9.bin")
    dump(0x9B_F760, 0x0100, "SamusTiles_Top_Set9_EntryA.bin")
    dump(0x9B_F860, 0x0140, "SamusTiles_Top_Set9_EntryB.bin")
    dump(0x9B_F9A0, 0x0100, "SamusTiles_Top_Set9_EntryC.bin")
    dump(0x9B_FAA0, 0x0140, "SamusTiles_Top_Set9_EntryD.bin")
    dump(0x9B_FBE0, 0x00C0, "SamusTiles_Top_Set9_EntryE.bin")
    dump(0x9B_FCA0, 0x0100, "SamusTiles_Top_Set9_EntryF.bin")

#    dump(0x9C_8000, 0x8000, "bank_9c.bin") # Samus graphics
    dump(0x9C_8000, 0x00A0, "SamusTiles_Top_SetA_Entry0.bin")
    dump(0x9C_80A0, 0x00A0, "SamusTiles_Top_SetA_Entry1.bin")
    dump(0x9C_8140, 0x00A0, "SamusTiles_Top_SetA_Entry2.bin")
    dump(0x9C_81E0, 0x00A0, "SamusTiles_Top_SetA_Entry3.bin")
    dump(0x9C_8280, 0x00A0, "SamusTiles_Top_SetA_Entry4.bin")
    dump(0x9C_8320, 0x00A0, "SamusTiles_Top_SetA_Entry5.bin")
    dump(0x9C_83C0, 0x00A0, "SamusTiles_Top_SetA_Entry6.bin")
    dump(0x9C_8460, 0x00A0, "SamusTiles_Top_SetA_Entry7.bin")
    dump(0x9C_8500, 0x0100, "SamusTiles_Top_SetA_Entry8.bin")
    dump(0x9C_8600, 0x0200, "SamusTiles_Top_SetA_Entry9.bin")
    dump(0x9C_8800, 0x0100, "SamusTiles_Top_SetA_EntryA.bin")
    dump(0x9C_8900, 0x0200, "SamusTiles_Top_SetA_EntryB.bin")
    dump(0x9C_8B00, 0x0100, "SamusTiles_Top_SetA_EntryC.bin")
    dump(0x9C_8C00, 0x0200, "SamusTiles_Top_SetA_EntryD.bin")
    dump(0x9C_8E00, 0x0100, "SamusTiles_Top_SetA_EntryE.bin")
    dump(0x9C_8F00, 0x0200, "SamusTiles_Top_SetA_EntryF.bin")
    dump(0x9C_9100, 0x0140, "SamusTiles_Top_SetA_Entry10.bin")
    dump(0x9C_9240, 0x0160, "SamusTiles_Top_SetA_Entry11.bin")
    dump(0x9C_93A0, 0x0160, "SamusTiles_Top_SetA_Entry12.bin")
    dump(0x9C_9500, 0x0100, "SamusTiles_Top_SetA_Entry13.bin")
    dump(0x9C_9600, 0x0020, "SamusTiles_Top_SetA_Entry14.bin")
    dump(0x9C_9620, 0x0020, "SamusTiles_Top_SetB_Entry0.bin")
    dump(0x9C_9640, 0x00A0, "SamusTiles_Top_SetB_Entry1.bin")
    dump(0x9C_96E0, 0x00A0, "SamusTiles_Top_SetB_Entry2.bin")
    dump(0x9C_9780, 0x00C0, "SamusTiles_Top_SetB_Entry3.bin")
    dump(0x9C_9840, 0x0100, "SamusTiles_Top_SetB_Entry4.bin")
    dump(0x9C_9940, 0x00C0, "SamusTiles_Top_SetB_Entry5.bin")
    dump(0x9C_9A00, 0x0100, "SamusTiles_Top_SetB_Entry6.bin")
    dump(0x9C_9B00, 0x0140, "SamusTiles_Top_Set3_Entry0.bin")
    dump(0x9C_9C40, 0x0140, "SamusTiles_Top_Set3_Entry1.bin")
    dump(0x9C_9D80, 0x0180, "SamusTiles_Top_Set3_Entry2.bin")
    dump(0x9C_9F00, 0x0180, "SamusTiles_Top_Set3_Entry3.bin")
    dump(0x9C_A080, 0x0180, "SamusTiles_Top_Set3_Entry4.bin")
    dump(0x9C_A200, 0x0180, "SamusTiles_Top_Set3_Entry5.bin")
    dump(0x9C_A380, 0x0180, "SamusTiles_Top_Set3_Entry6.bin")
    dump(0x9C_A500, 0x0140, "SamusTiles_Top_Set3_Entry7.bin")
    dump(0x9C_A640, 0x0140, "SamusTiles_Top_Set3_Entry8.bin")
    dump(0x9C_A780, 0x0140, "SamusTiles_Top_Set3_Entry9.bin")
    dump(0x9C_A8C0, 0x0180, "SamusTiles_Top_Set3_EntryA.bin")
    dump(0x9C_AA40, 0x0180, "SamusTiles_Top_Set3_EntryB.bin")
    dump(0x9C_ABC0, 0x0180, "SamusTiles_Top_Set3_EntryC.bin")
    dump(0x9C_AD40, 0x0180, "SamusTiles_Top_Set3_EntryD.bin")
    dump(0x9C_AEC0, 0x0180, "SamusTiles_Top_Set3_EntryE.bin")
    dump(0x9C_B040, 0x0140, "SamusTiles_Top_Set3_EntryF.bin")
    dump(0x9C_B180, 0x0140, "SamusTiles_Top_Set3_Entry10.bin")
    dump(0x9C_B2C0, 0x01C0, "SamusTiles_Top_Set4_Entry0.bin")
    dump(0x9C_B480, 0x01C0, "SamusTiles_Top_Set4_Entry1.bin")
    dump(0x9C_B640, 0x0200, "SamusTiles_Top_Set4_Entry2.bin")
    dump(0x9C_B840, 0x0200, "SamusTiles_Top_Set4_Entry3.bin")
    dump(0x9C_BA40, 0x01E0, "SamusTiles_Top_Set4_Entry4.bin")
    dump(0x9C_BC20, 0x01E0, "SamusTiles_Top_Set4_Entry5.bin")
    dump(0x9C_BE00, 0x01E0, "SamusTiles_Top_Set4_Entry6.bin")
    dump(0x9C_BFE0, 0x01C0, "SamusTiles_Top_Set4_Entry7.bin")
    dump(0x9C_C1A0, 0x01C0, "SamusTiles_Top_Set4_Entry8.bin")
    dump(0x9C_C360, 0x01C0, "SamusTiles_Top_Set4_Entry9.bin")
    dump(0x9C_C520, 0x01E0, "SamusTiles_Top_Set4_EntryA.bin")
    dump(0x9C_C700, 0x0200, "SamusTiles_Top_Set4_EntryB.bin")
    dump(0x9C_C900, 0x0200, "SamusTiles_Top_Set4_EntryC.bin")
    dump(0x9C_CB00, 0x0200, "SamusTiles_Top_Set4_EntryD.bin")
    dump(0x9C_CD00, 0x0200, "SamusTiles_Top_Set4_EntryE.bin")
    dump(0x9C_CF00, 0x01E0, "SamusTiles_Top_Set4_EntryF.bin")
    dump(0x9C_D0E0, 0x01E0, "SamusTiles_Top_Set4_Entry10.bin")
    dump(0x9C_D2C0, 0x0120, "SamusTiles_Top_Set7_Entry0.bin")
    dump(0x9C_D3E0, 0x0120, "SamusTiles_Top_Set7_Entry1.bin")
    dump(0x9C_D500, 0x0120, "SamusTiles_Top_Set7_Entry2.bin")
    dump(0x9C_D620, 0x0140, "SamusTiles_Top_Set7_Entry3.bin")
    dump(0x9C_D760, 0x0140, "SamusTiles_Top_Set7_Entry4.bin")
    dump(0x9C_D8A0, 0x0140, "SamusTiles_Top_Set7_Entry5.bin")
    dump(0x9C_D9E0, 0x0120, "SamusTiles_Top_Set7_Entry6.bin")
    dump(0x9C_DB00, 0x0120, "SamusTiles_Top_Set7_Entry7.bin")
    dump(0x9C_DC20, 0x0120, "SamusTiles_Top_Set7_Entry8.bin")
    dump(0x9C_DD40, 0x0140, "SamusTiles_Top_Set7_Entry9.bin")
    dump(0x9C_DE80, 0x0140, "SamusTiles_Top_Set7_EntryA.bin")
    dump(0x9C_DFC0, 0x0140, "SamusTiles_Top_Set7_EntryB.bin")
    dump(0x9C_E100, 0x0140, "SamusTiles_Top_Set7_EntryC.bin")
    dump(0x9C_E240, 0x0140, "SamusTiles_Top_Set7_EntryD.bin")
    dump(0x9C_E380, 0x0140, "SamusTiles_Top_Set7_EntryE.bin")
    dump(0x9C_E4C0, 0x0140, "SamusTiles_Top_Set7_EntryF.bin")
    dump(0x9C_E600, 0x0140, "SamusTiles_Top_Set7_Entry10.bin")
    dump(0x9C_E740, 0x0140, "SamusTiles_Top_Set7_Entry11.bin")
    dump(0x9C_E880, 0x0100, "SamusTiles_Top_Set7_Entry12.bin")
    dump(0x9C_E980, 0x0100, "SamusTiles_Top_Set7_Entry13.bin")
    dump(0x9C_EA80, 0x0200, "SamusTiles_Bottom_Set9_Entry0.bin")
    dump(0x9C_EC80, 0x0200, "SamusTiles_Bottom_Set9_Entry1.bin")
    dump(0x9C_EE80, 0x0200, "SamusTiles_Bottom_Set9_Entry2.bin")
    dump(0x9C_F080, 0x0200, "SamusTiles_Bottom_Set9_Entry3.bin")
    dump(0x9C_F280, 0x0200, "SamusTiles_Bottom_Set9_Entry4.bin")
    dump(0x9C_F480, 0x0200, "SamusTiles_Bottom_Set9_Entry5.bin")
    dump(0x9C_F680, 0x0200, "SamusTiles_Bottom_Set9_Entry6.bin")
    dump(0x9C_F880, 0x0200, "SamusTiles_Bottom_Set9_Entry7.bin")

#    dump(0x9D_8000, 0x8000, "bank_9d.bin") # Samus graphics
    dump(0x9D_8000, 0x0100, "SamusTiles_Bottom_Set0_Entry0.bin")
    dump(0x9D_8100, 0x0160, "SamusTiles_Bottom_Set0_Entry1.bin")
    dump(0x9D_8260, 0x01A0, "SamusTiles_Bottom_Set0_Entry2.bin")
    dump(0x9D_8400, 0x0100, "SamusTiles_Bottom_Set0_Entry3.bin")
    dump(0x9D_8500, 0x0180, "SamusTiles_Bottom_Set0_Entry4.bin")
    dump(0x9D_8680, 0x01A0, "SamusTiles_Bottom_Set0_Entry5.bin")
    dump(0x9D_8820, 0x0180, "SamusTiles_Bottom_Set0_Entry6.bin")
    dump(0x9D_89A0, 0x0100, "SamusTiles_Bottom_Set0_Entry7.bin")
    dump(0x9D_8AA0, 0x0140, "SamusTiles_Bottom_Set0_Entry8.bin")
    dump(0x9D_8BE0, 0x0180, "SamusTiles_Bottom_Set0_Entry9.bin")
    dump(0x9D_8D60, 0x0140, "SamusTiles_Bottom_Set0_EntryA.bin")
    dump(0x9D_8EA0, 0x0180, "SamusTiles_Bottom_Set0_EntryB.bin")
    dump(0x9D_9020, 0x01C0, "SamusTiles_Bottom_Set0_EntryC.bin")
    dump(0x9D_91E0, 0x01C0, "SamusTiles_Bottom_Set0_EntryD.bin")
    dump(0x9D_93A0, 0x0180, "SamusTiles_Bottom_Set0_EntryE.bin")
    dump(0x9D_9520, 0x0180, "SamusTiles_Bottom_Set0_EntryF.bin")
    dump(0x9D_96A0, 0x0180, "SamusTiles_Bottom_Set0_Entry10.bin")
    dump(0x9D_9820, 0x00E0, "SamusTiles_Bottom_Set0_Entry11.bin")
    dump(0x9D_9900, 0x00E0, "SamusTiles_Bottom_Set0_Entry12.bin")
    dump(0x9D_99E0, 0x0120, "SamusTiles_Bottom_Set0_Entry13.bin")
    dump(0x9D_9B00, 0x0120, "SamusTiles_Bottom_Set0_Entry14.bin")
    dump(0x9D_9C20, 0x0120, "SamusTiles_Bottom_Set0_Entry15.bin")
    dump(0x9D_9D40, 0x0120, "SamusTiles_Bottom_Set0_Entry16.bin")
    dump(0x9D_9E60, 0x00C0, "SamusTiles_Bottom_Set0_Entry17.bin")
    dump(0x9D_9F20, 0x00C0, "SamusTiles_Bottom_Set0_Entry18.bin")
    dump(0x9D_9FE0, 0x0100, "SamusTiles_Bottom_Set0_Entry19.bin")
    dump(0x9D_A0E0, 0x0100, "SamusTiles_Bottom_Set0_Entry1A.bin")
    dump(0x9D_A1E0, 0x0140, "SamusTiles_Bottom_Set0_Entry1B.bin")
    dump(0x9D_A320, 0x0140, "SamusTiles_Bottom_Set0_Entry1C.bin")
    dump(0x9D_A460, 0x0180, "SamusTiles_Bottom_Set0_Entry1D.bin")
    dump(0x9D_A5E0, 0x0100, "SamusTiles_Bottom_Set0_Entry1E.bin")
    dump(0x9D_A6E0, 0x0100, "SamusTiles_Bottom_Set0_Entry1F.bin")
    dump(0x9D_A7E0, 0x0140, "SamusTiles_Bottom_Set1_Entry0.bin")
    dump(0x9D_A920, 0x0100, "SamusTiles_Bottom_Set1_Entry1.bin")
    dump(0x9D_AA20, 0x0080, "SamusTiles_Bottom_Set1_Entry2.bin")
    dump(0x9D_AAA0, 0x0140, "SamusTiles_Bottom_Set1_Entry3.bin")
    dump(0x9D_ABE0, 0x0100, "SamusTiles_Bottom_Set1_Entry4.bin")
    dump(0x9D_ACE0, 0x0100, "SamusTiles_Bottom_Set1_Entry5.bin")
    dump(0x9D_ADE0, 0x0140, "SamusTiles_Bottom_Set1_Entry6.bin")
    dump(0x9D_AF20, 0x0140, "SamusTiles_Bottom_Set1_Entry7.bin")
    dump(0x9D_B060, 0x0120, "SamusTiles_Bottom_Set1_Entry8.bin")
    dump(0x9D_B180, 0x0120, "SamusTiles_Bottom_Set1_Entry9.bin")
    dump(0x9D_B2A0, 0x0120, "SamusTiles_Bottom_Set1_EntryA.bin")
    dump(0x9D_B3C0, 0x0120, "SamusTiles_Bottom_Set1_EntryB.bin")
    dump(0x9D_B4E0, 0x0100, "SamusTiles_Bottom_Set1_EntryC.bin")
    dump(0x9D_B5E0, 0x0100, "SamusTiles_Bottom_Set1_EntryD.bin")
    dump(0x9D_B6E0, 0x0100, "SamusTiles_Bottom_Set1_EntryE.bin")
    dump(0x9D_B7E0, 0x0100, "SamusTiles_Bottom_Set1_EntryF.bin")
    dump(0x9D_B8E0, 0x0020, "SamusTiles_Bottom_Set1_Entry10.bin")
    dump(0x9D_B900, 0x0120, "SamusTiles_Bottom_Set1_Entry11.bin")
    dump(0x9D_BA20, 0x0120, "SamusTiles_Bottom_Set1_Entry12.bin")
    dump(0x9D_BB40, 0x0140, "SamusTiles_Bottom_Set1_Entry13.bin")
    dump(0x9D_BC80, 0x0100, "SamusTiles_Bottom_Set1_Entry14.bin")
    dump(0x9D_BD80, 0x0120, "SamusTiles_Bottom_Set1_Entry15.bin")
    dump(0x9D_BEA0, 0x0120, "SamusTiles_Bottom_Set1_Entry16.bin")
    dump(0x9D_BFC0, 0x0120, "SamusTiles_Bottom_Set1_Entry17.bin")
    dump(0x9D_C0E0, 0x0120, "SamusTiles_Bottom_Set1_Entry18.bin")
    dump(0x9D_C200, 0x0160, "SamusTiles_Bottom_Set1_Entry19.bin")
    dump(0x9D_C360, 0x0160, "SamusTiles_Bottom_Set1_Entry1A.bin")
    dump(0x9D_C4C0, 0x0140, "SamusTiles_Bottom_Set1_Entry1B.bin")
    dump(0x9D_C600, 0x0140, "SamusTiles_Bottom_Set1_Entry1C.bin")
    dump(0x9D_C740, 0x0100, "SamusTiles_Bottom_Set1_Entry1D.bin")
    dump(0x9D_C840, 0x00A0, "SamusTiles_Bottom_Set1_Entry1E.bin")
    dump(0x9D_C8E0, 0x00A0, "SamusTiles_Bottom_Set1_Entry1F.bin")
    dump(0x9D_C980, 0x0140, "SamusTiles_Top_Set5_Entry0.bin")
    dump(0x9D_CAC0, 0x0140, "SamusTiles_Top_Set5_Entry1.bin")
    dump(0x9D_CC00, 0x0180, "SamusTiles_Top_Set5_Entry2.bin")
    dump(0x9D_CD80, 0x0180, "SamusTiles_Top_Set5_Entry3.bin")
    dump(0x9D_CF00, 0x0180, "SamusTiles_Top_Set5_Entry4.bin")
    dump(0x9D_D080, 0x0180, "SamusTiles_Top_Set5_Entry5.bin")
    dump(0x9D_D200, 0x0180, "SamusTiles_Top_Set5_Entry6.bin")
    dump(0x9D_D380, 0x0140, "SamusTiles_Top_Set5_Entry7.bin")
    dump(0x9D_D4C0, 0x0140, "SamusTiles_Top_Set5_Entry8.bin")
    dump(0x9D_D600, 0x0140, "SamusTiles_Top_Set5_Entry9.bin")
    dump(0x9D_D740, 0x0180, "SamusTiles_Top_Set5_EntryA.bin")
    dump(0x9D_D8C0, 0x0180, "SamusTiles_Top_Set5_EntryB.bin")
    dump(0x9D_DA40, 0x0180, "SamusTiles_Top_Set5_EntryC.bin")
    dump(0x9D_DBC0, 0x0180, "SamusTiles_Top_Set5_EntryD.bin")
    dump(0x9D_DD40, 0x0180, "SamusTiles_Top_Set5_EntryE.bin")
    dump(0x9D_DEC0, 0x0140, "SamusTiles_Top_Set5_EntryF.bin")
    dump(0x9D_E000, 0x0140, "SamusTiles_Top_Set5_Entry10.bin")
    dump(0x9D_E140, 0x01C0, "SamusTiles_Top_Set6_Entry0.bin")
    dump(0x9D_E300, 0x01C0, "SamusTiles_Top_Set6_Entry1.bin")
    dump(0x9D_E4C0, 0x0200, "SamusTiles_Top_Set6_Entry2.bin")
    dump(0x9D_E6C0, 0x0200, "SamusTiles_Top_Set6_Entry3.bin")
    dump(0x9D_E8C0, 0x01E0, "SamusTiles_Top_Set6_Entry4.bin")
    dump(0x9D_EAA0, 0x01E0, "SamusTiles_Top_Set6_Entry5.bin")
    dump(0x9D_EC80, 0x01E0, "SamusTiles_Top_Set6_Entry6.bin")
    dump(0x9D_EE60, 0x01C0, "SamusTiles_Top_Set6_Entry7.bin")
    dump(0x9D_F020, 0x01C0, "SamusTiles_Top_Set6_Entry8.bin")
    dump(0x9D_F1E0, 0x01C0, "SamusTiles_Top_Set6_Entry9.bin")
    dump(0x9D_F3A0, 0x01E0, "SamusTiles_Top_Set6_EntryA.bin")
    dump(0x9D_F580, 0x0200, "SamusTiles_Top_Set6_EntryB.bin")

#    dump(0x9E_8000, 0x8000, "bank_9e.bin") # Samus graphics
    dump(0x9E_8000, 0x0100, "SamusTiles_Top_Set0_Entry0.bin")
    dump(0x9E_8100, 0x0100, "SamusTiles_Top_Set0_Entry1.bin")
    dump(0x9E_8200, 0x0120, "SamusTiles_Top_Set0_Entry2.bin")
    dump(0x9E_8320, 0x0120, "SamusTiles_Top_Set0_Entry3.bin")
    dump(0x9E_8440, 0x0100, "SamusTiles_Top_Set0_Entry4.bin")
    dump(0x9E_8540, 0x0180, "SamusTiles_Top_Set0_Entry5.bin")
    dump(0x9E_86C0, 0x0100, "SamusTiles_Top_Set0_Entry6.bin")
    dump(0x9E_87C0, 0x0100, "SamusTiles_Top_Set0_Entry7.bin")
    dump(0x9E_88C0, 0x0180, "SamusTiles_Top_Set0_Entry8.bin")
    dump(0x9E_8A40, 0x0180, "SamusTiles_Top_Set0_Entry9.bin")
    dump(0x9E_8BC0, 0x0100, "SamusTiles_Top_Set0_EntryA.bin")
    dump(0x9E_8CC0, 0x0120, "SamusTiles_Top_Set0_EntryB.bin")
    dump(0x9E_8DE0, 0x0120, "SamusTiles_Top_Set0_EntryC.bin")
    dump(0x9E_8F00, 0x0120, "SamusTiles_Top_Set0_EntryD.bin")
    dump(0x9E_9020, 0x0160, "SamusTiles_Top_Set0_EntryE.bin")
    dump(0x9E_9180, 0x0160, "SamusTiles_Top_Set0_EntryF.bin")
    dump(0x9E_92E0, 0x0100, "SamusTiles_Top_Set0_Entry10.bin")
    dump(0x9E_93E0, 0x0100, "SamusTiles_Top_Set0_Entry11.bin")
    dump(0x9E_94E0, 0x0140, "SamusTiles_Top_Set0_Entry12.bin")
    dump(0x9E_9620, 0x0140, "SamusTiles_Top_Set0_Entry13.bin")
    dump(0x9E_9760, 0x0120, "SamusTiles_Top_Set0_Entry14.bin")
    dump(0x9E_9880, 0x0180, "SamusTiles_Top_Set0_Entry15.bin")
    dump(0x9E_9A00, 0x0100, "SamusTiles_Top_Set0_Entry16.bin")
    dump(0x9E_9B00, 0x0100, "SamusTiles_Top_Set0_Entry17.bin")
    dump(0x9E_9C00, 0x0120, "SamusTiles_Top_Set0_Entry18.bin")
    dump(0x9E_9D20, 0x0120, "SamusTiles_Top_Set0_Entry19.bin")
    dump(0x9E_9E40, 0x0100, "SamusTiles_Top_Set0_Entry1A.bin")
    dump(0x9E_9F40, 0x0120, "SamusTiles_Top_Set0_Entry1B.bin")
    dump(0x9E_A060, 0x01C0, "SamusTiles_Top_Set0_Entry1C.bin")
    dump(0x9E_A220, 0x01C0, "SamusTiles_Top_Set0_Entry1D.bin")
    dump(0x9E_A3E0, 0x0140, "SamusTiles_Top_Set0_Entry1E.bin")
    dump(0x9E_A520, 0x0140, "SamusTiles_Top_Set0_Entry1F.bin")
    dump(0x9E_A660, 0x0140, "SamusTiles_Top_Set1_Entry0.bin")
    dump(0x9E_A7A0, 0x0140, "SamusTiles_Top_Set1_Entry1.bin")
    dump(0x9E_A8E0, 0x01A0, "SamusTiles_Top_Set1_Entry2.bin")
    dump(0x9E_AA80, 0x01C0, "SamusTiles_Top_Set1_Entry3.bin")
    dump(0x9E_AC40, 0x0020, "SamusTiles_Top_Set1_Entry4.bin")
    dump(0x9E_AC60, 0x0080, "SamusTiles_Top_Set1_Entry5.bin")
    dump(0x9E_ACE0, 0x0140, "SamusTiles_Top_Set1_Entry6.bin")
    dump(0x9E_AE20, 0x0140, "SamusTiles_Top_Set1_Entry7.bin")
    dump(0x9E_AF60, 0x0120, "SamusTiles_Top_Set1_Entry8.bin")
    dump(0x9E_B080, 0x0100, "SamusTiles_Top_Set1_Entry9.bin")
    dump(0x9E_B180, 0x01A0, "SamusTiles_Top_Set1_EntryA.bin")
    dump(0x9E_B320, 0x0180, "SamusTiles_Top_Set1_EntryB.bin")
    dump(0x9E_B4A0, 0x0180, "SamusTiles_Top_Set1_EntryC.bin")
    dump(0x9E_B620, 0x0100, "SamusTiles_Top_Set1_EntryD.bin")
    dump(0x9E_B720, 0x0100, "SamusTiles_Top_Set1_EntryE.bin")
    dump(0x9E_B820, 0x0100, "SamusTiles_Top_Set1_EntryF.bin")
    dump(0x9E_B920, 0x0100, "SamusTiles_Top_Set1_Entry10.bin")
    dump(0x9E_BA20, 0x0100, "SamusTiles_Top_Set1_Entry11.bin")
    dump(0x9E_BB20, 0x0100, "SamusTiles_Top_Set1_Entry12.bin")
    dump(0x9E_BC20, 0x0100, "SamusTiles_Top_Set1_Entry13.bin")
    dump(0x9E_BD20, 0x01C0, "SamusTiles_Top_Set1_Entry14.bin")
    dump(0x9E_BEE0, 0x01C0, "SamusTiles_Top_Set1_Entry15.bin")
    dump(0x9E_C0A0, 0x0020, "SamusTiles_Top_Set1_Entry16.bin")
    dump(0x9E_C0C0, 0x0020, "SamusTiles_Top_Set1_Entry17.bin")
    dump(0x9E_C0E0, 0x0120, "SamusTiles_Top_Set1_Entry18.bin")
    dump(0x9E_C200, 0x0120, "SamusTiles_Top_Set1_Entry19.bin")
    dump(0x9E_C320, 0x0140, "SamusTiles_Top_Set1_Entry1A.bin")
    dump(0x9E_C460, 0x0140, "SamusTiles_Top_Set1_Entry1B.bin")
    dump(0x9E_C5A0, 0x0140, "SamusTiles_Top_Set1_Entry1C.bin")
    dump(0x9E_C6E0, 0x0140, "SamusTiles_Top_Set1_Entry1D.bin")
    dump(0x9E_C820, 0x00C0, "SamusTiles_Top_Set2_Entry0.bin")
    dump(0x9E_C8E0, 0x0100, "SamusTiles_Top_Set2_Entry1.bin")
    dump(0x9E_C9E0, 0x0140, "SamusTiles_Top_Set2_Entry2.bin")
    dump(0x9E_CB20, 0x0100, "SamusTiles_Top_Set2_Entry3.bin")
    dump(0x9E_CC20, 0x00C0, "SamusTiles_Top_Set2_Entry4.bin")
    dump(0x9E_CCE0, 0x0100, "SamusTiles_Top_Set2_Entry5.bin")
    dump(0x9E_CDE0, 0x0120, "SamusTiles_Top_Set2_Entry6.bin")
    dump(0x9E_CF00, 0x0120, "SamusTiles_Top_Set2_Entry7.bin")
    dump(0x9E_D020, 0x0100, "SamusTiles_Top_Set2_Entry8.bin")
    dump(0x9E_D120, 0x0100, "SamusTiles_Top_Set2_Entry9.bin")
    dump(0x9E_D220, 0x0100, "SamusTiles_Top_Set2_EntryA.bin")
    dump(0x9E_D320, 0x0100, "SamusTiles_Top_Set2_EntryB.bin")
    dump(0x9E_D420, 0x0100, "SamusTiles_Top_Set2_EntryC.bin")
    dump(0x9E_D520, 0x0100, "SamusTiles_Top_Set2_EntryD.bin")
    dump(0x9E_D620, 0x0100, "SamusTiles_Top_Set2_EntryE.bin")
    dump(0x9E_D720, 0x0100, "SamusTiles_Top_Set2_EntryF.bin")
    dump(0x9E_D820, 0x0100, "SamusTiles_Top_Set2_Entry10.bin")
    dump(0x9E_D920, 0x0120, "SamusTiles_Top_Set2_Entry11.bin")
    dump(0x9E_DA40, 0x0140, "SamusTiles_Top_Set2_Entry12.bin")
    dump(0x9E_DB80, 0x0140, "SamusTiles_Top_Set2_Entry13.bin")
    dump(0x9E_DCC0, 0x0140, "SamusTiles_Top_Set2_Entry14.bin")
    dump(0x9E_DE00, 0x0140, "SamusTiles_Top_Set2_Entry15.bin")
    dump(0x9E_DF40, 0x0100, "SamusTiles_Top_Set2_Entry16.bin")
    dump(0x9E_E040, 0x0120, "SamusTiles_Top_Set2_Entry17.bin")
    dump(0x9E_E160, 0x0120, "SamusTiles_Top_Set2_Entry18.bin")
    dump(0x9E_E280, 0x0120, "SamusTiles_Top_Set2_Entry19.bin")
    dump(0x9E_E3A0, 0x0100, "SamusTiles_Top_Set2_Entry1A.bin")
    dump(0x9E_E4A0, 0x0100, "SamusTiles_Top_Set2_Entry1B.bin")
    dump(0x9E_E5A0, 0x0120, "SamusTiles_Top_Set2_Entry1C.bin")
    dump(0x9E_E6C0, 0x0100, "SamusTiles_Top_Set2_Entry1D.bin")
    dump(0x9E_E7C0, 0x0100, "SamusTiles_Top_Set2_Entry1E.bin")
    dump(0x9E_E8C0, 0x0100, "SamusTiles_Top_Set2_Entry1F.bin")
    dump(0x9E_E9C0, 0x0080, "UNUSED_SamusTiles_Bottom_Set3_Entry0_9EE9C0.bin")
    dump(0x9E_EA40, 0x0100, "UNUSED_SamusTiles_Bottom_Set3_Entry1_9EEA40.bin")
    dump(0x9E_EB40, 0x0080, "UNUSED_SamusTiles_Bottom_Set3_Entry2_9EEB40.bin")
    dump(0x9E_EBC0, 0x0100, "UNUSED_SamusTiles_Bottom_Set3_Entry3_9EEBC0.bin")
    dump(0x9E_ECC0, 0x0080, "UNUSED_SamusTiles_Bottom_Set3_Entry4_9EECC0.bin")
    dump(0x9E_ED40, 0x0100, "UNUSED_SamusTiles_Bottom_Set3_Entry5_9EED40.bin")
    dump(0x9E_EE40, 0x0080, "UNUSED_SamusTiles_Bottom_Set3_Entry6_9EEE40.bin")
    dump(0x9E_EEC0, 0x0100, "UNUSED_SamusTiles_Bottom_Set3_Entry7_9EEEC0.bin")
    dump(0x9E_EFC0, 0x0080, "UNUSED_SamusTiles_Bottom_Set3_Entry8_9EEFC0.bin")
    dump(0x9E_F040, 0x0100, "UNUSED_SamusTiles_Bottom_Set3_Entry9_9EF040.bin")
    dump(0x9E_F140, 0x0080, "UNUSED_SamusTiles_Bottom_Set3_EntryA_9EF140.bin")
    dump(0x9E_F1C0, 0x0100, "UNUSED_SamusTiles_Bottom_Set3_EntryB_9EF1C0.bin")
    dump(0x9E_F2C0, 0x0080, "UNUSED_SamusTiles_Bottom_Set3_EntryC_9EF2C0.bin")
    dump(0x9E_F340, 0x0100, "UNUSED_SamusTiles_Bottom_Set3_EntryD_9EF340.bin")
    dump(0x9E_F440, 0x0080, "UNUSED_SamusTiles_Bottom_Set3_EntryE_9EF440.bin")
    dump(0x9E_F4C0, 0x0100, "UNUSED_SamusTiles_Bottom_Set3_EntryF_9EF4C0.bin")
    dump(0x9E_F5C0, 0x0100, "UNUSED_SamusTiles_Bottom_Set3_Entry10_9EF5C0.bin")

#    dump(0x9F_8000, 0x8000, "bank_9f.bin") # Samus graphics
    dump(0x9F_8000, 0x00C0, "SamusTiles_Bottom_Set2_Entry0.bin")
    dump(0x9F_80C0, 0x0120, "SamusTiles_Bottom_Set2_Entry1.bin")
    dump(0x9F_81E0, 0x0120, "SamusTiles_Bottom_Set2_Entry2.bin")
    dump(0x9F_8300, 0x00E0, "SamusTiles_Bottom_Set2_Entry3.bin")
    dump(0x9F_83E0, 0x0100, "SamusTiles_Bottom_Set2_Entry4.bin")
    dump(0x9F_84E0, 0x0100, "SamusTiles_Bottom_Set2_Entry5.bin")
    dump(0x9F_85E0, 0x00C0, "SamusTiles_Bottom_Set2_Entry6.bin")
    dump(0x9F_86A0, 0x00E0, "SamusTiles_Bottom_Set2_Entry7.bin")
    dump(0x9F_8780, 0x00E0, "SamusTiles_Bottom_Set2_Entry8.bin")
    dump(0x9F_8860, 0x0100, "SamusTiles_Bottom_Set2_Entry9.bin")
    dump(0x9F_8960, 0x0120, "SamusTiles_Bottom_Set2_EntryA.bin")
    dump(0x9F_8A80, 0x0100, "SamusTiles_Bottom_Set2_EntryB.bin")
    dump(0x9F_8B80, 0x0100, "SamusTiles_Bottom_Set2_EntryC.bin")
    dump(0x9F_8C80, 0x0100, "SamusTiles_Bottom_Set2_EntryD.bin")
    dump(0x9F_8D80, 0x00E0, "SamusTiles_Bottom_Set2_EntryE.bin")
    dump(0x9F_8E60, 0x0100, "SamusTiles_Bottom_Set2_EntryF.bin")
    dump(0x9F_8F60, 0x0100, "SamusTiles_Bottom_Set2_Entry10.bin")
    dump(0x9F_9060, 0x00E0, "SamusTiles_Bottom_Set2_Entry11.bin")
    dump(0x9F_9140, 0x0100, "SamusTiles_Bottom_Set2_Entry12.bin")
    dump(0x9F_9240, 0x0100, "SamusTiles_Bottom_Set2_Entry13.bin")
    dump(0x9F_9340, 0x0100, "SamusTiles_Bottom_Set2_Entry14.bin")
    dump(0x9F_9440, 0x0140, "SamusTiles_Bottom_Set2_Entry15.bin")
    dump(0x9F_9580, 0x0100, "SamusTiles_Bottom_Set2_Entry16.bin")
    dump(0x9F_9680, 0x0100, "SamusTiles_Bottom_Set2_Entry17.bin")
    dump(0x9F_9780, 0x00C0, "SamusTiles_Bottom_Set4_Entry0.bin")
    dump(0x9F_9840, 0x0120, "SamusTiles_Bottom_Set4_Entry1.bin")
    dump(0x9F_9960, 0x0120, "SamusTiles_Bottom_Set4_Entry2.bin")
    dump(0x9F_9A80, 0x00E0, "SamusTiles_Bottom_Set4_Entry3.bin")
    dump(0x9F_9B60, 0x0100, "SamusTiles_Bottom_Set4_Entry4.bin")
    dump(0x9F_9C60, 0x0100, "SamusTiles_Bottom_Set4_Entry5.bin")
    dump(0x9F_9D60, 0x00C0, "SamusTiles_Bottom_Set4_Entry6.bin")
    dump(0x9F_9E20, 0x00E0, "SamusTiles_Bottom_Set4_Entry7.bin")
    dump(0x9F_9F00, 0x00E0, "SamusTiles_Bottom_Set4_Entry8.bin")
    dump(0x9F_9FE0, 0x0100, "SamusTiles_Bottom_Set4_Entry9.bin")
    dump(0x9F_A0E0, 0x0120, "SamusTiles_Bottom_Set4_EntryA.bin")
    dump(0x9F_A200, 0x0100, "SamusTiles_Bottom_Set4_EntryB.bin")
    dump(0x9F_A300, 0x0100, "SamusTiles_Bottom_Set4_EntryC.bin")
    dump(0x9F_A400, 0x0100, "SamusTiles_Bottom_Set4_EntryD.bin")
    dump(0x9F_A500, 0x00E0, "SamusTiles_Bottom_Set4_EntryE.bin")
    dump(0x9F_A5E0, 0x0100, "SamusTiles_Bottom_Set4_EntryF.bin")
    dump(0x9F_A6E0, 0x0100, "SamusTiles_Bottom_Set4_Entry10.bin")
    dump(0x9F_A7E0, 0x00E0, "SamusTiles_Bottom_Set4_Entry11.bin")
    dump(0x9F_A8C0, 0x0100, "SamusTiles_Bottom_Set4_Entry12.bin")
    dump(0x9F_A9C0, 0x0100, "SamusTiles_Bottom_Set4_Entry13.bin")
    dump(0x9F_AAC0, 0x0100, "SamusTiles_Bottom_Set4_Entry14.bin")
    dump(0x9F_ABC0, 0x0100, "SamusTiles_Bottom_Set4_Entry15.bin")
    dump(0x9F_ACC0, 0x0100, "SamusTiles_Bottom_Set4_Entry16.bin")
    dump(0x9F_ADC0, 0x00C0, "SamusTiles_Bottom_Set5_Entry0.bin")
    dump(0x9F_AE80, 0x0120, "SamusTiles_Bottom_Set5_Entry1.bin")
    dump(0x9F_AFA0, 0x0120, "SamusTiles_Bottom_Set5_Entry2.bin")
    dump(0x9F_B0C0, 0x00E0, "SamusTiles_Bottom_Set5_Entry3.bin")
    dump(0x9F_B1A0, 0x0100, "SamusTiles_Bottom_Set5_Entry4.bin")
    dump(0x9F_B2A0, 0x0100, "SamusTiles_Bottom_Set5_Entry5.bin")
    dump(0x9F_B3A0, 0x00C0, "SamusTiles_Bottom_Set5_Entry6.bin")
    dump(0x9F_B460, 0x00E0, "SamusTiles_Bottom_Set5_Entry7.bin")
    dump(0x9F_B540, 0x00E0, "SamusTiles_Bottom_Set5_Entry8.bin")
    dump(0x9F_B620, 0x0100, "SamusTiles_Bottom_Set5_Entry9.bin")
    dump(0x9F_B720, 0x0120, "SamusTiles_Bottom_Set5_EntryA.bin")
    dump(0x9F_B840, 0x0100, "SamusTiles_Bottom_Set5_EntryB.bin")
    dump(0x9F_B940, 0x0100, "SamusTiles_Bottom_Set5_EntryC.bin")
    dump(0x9F_BA40, 0x0100, "SamusTiles_Bottom_Set5_EntryD.bin")
    dump(0x9F_BB40, 0x00E0, "SamusTiles_Bottom_Set5_EntryE.bin")
    dump(0x9F_BC20, 0x0100, "SamusTiles_Bottom_Set5_EntryF.bin")
    dump(0x9F_BD20, 0x0100, "SamusTiles_Bottom_Set5_Entry10.bin")
    dump(0x9F_BE20, 0x00E0, "SamusTiles_Bottom_Set5_Entry11.bin")
    dump(0x9F_BF00, 0x0100, "SamusTiles_Bottom_Set5_Entry12.bin")
    dump(0x9F_C000, 0x0100, "SamusTiles_Bottom_Set5_Entry13.bin")
    dump(0x9F_C100, 0x0100, "SamusTiles_Bottom_Set5_Entry14.bin")
    dump(0x9F_C200, 0x0140, "SamusTiles_Bottom_Set5_Entry15.bin")
    dump(0x9F_C340, 0x0100, "SamusTiles_Bottom_Set5_Entry16.bin")
    dump(0x9F_C440, 0x0100, "SamusTiles_Bottom_Set5_Entry17.bin")
    dump(0x9F_C540, 0x00C0, "SamusTiles_Bottom_Set6_Entry0.bin")
    dump(0x9F_C600, 0x0120, "SamusTiles_Bottom_Set6_Entry1.bin")
    dump(0x9F_C720, 0x0120, "SamusTiles_Bottom_Set6_Entry2.bin")
    dump(0x9F_C840, 0x00E0, "SamusTiles_Bottom_Set6_Entry3.bin")
    dump(0x9F_C920, 0x0100, "SamusTiles_Bottom_Set6_Entry4.bin")
    dump(0x9F_CA20, 0x0100, "SamusTiles_Bottom_Set6_Entry5.bin")
    dump(0x9F_CB20, 0x00C0, "SamusTiles_Bottom_Set6_Entry6.bin")
    dump(0x9F_CBE0, 0x00E0, "SamusTiles_Bottom_Set6_Entry7.bin")
    dump(0x9F_CCC0, 0x00E0, "SamusTiles_Bottom_Set6_Entry8.bin")
    dump(0x9F_CDA0, 0x0100, "SamusTiles_Bottom_Set6_Entry9.bin")
    dump(0x9F_CEA0, 0x0120, "SamusTiles_Bottom_Set6_EntryA.bin")
    dump(0x9F_CFC0, 0x0100, "SamusTiles_Bottom_Set6_EntryB.bin")
    dump(0x9F_D0C0, 0x0100, "SamusTiles_Bottom_Set6_EntryC.bin")
    dump(0x9F_D1C0, 0x0100, "SamusTiles_Bottom_Set6_EntryD.bin")
    dump(0x9F_D2C0, 0x00E0, "SamusTiles_Bottom_Set6_EntryE.bin")
    dump(0x9F_D3A0, 0x0100, "SamusTiles_Bottom_Set6_EntryF.bin")
    dump(0x9F_D4A0, 0x0100, "SamusTiles_Bottom_Set6_Entry10.bin")
    dump(0x9F_D5A0, 0x00E0, "SamusTiles_Bottom_Set6_Entry11.bin")
    dump(0x9F_D680, 0x0100, "SamusTiles_Bottom_Set6_Entry12.bin")
    dump(0x9F_D780, 0x0100, "SamusTiles_Bottom_Set6_Entry13.bin")
    dump(0x9F_D880, 0x0100, "SamusTiles_Bottom_Set6_Entry14.bin")
    dump(0x9F_D980, 0x0100, "SamusTiles_Bottom_Set6_Entry15.bin")
    dump(0x9F_DA80, 0x0100, "SamusTiles_Bottom_Set6_Entry16.bin")
    dump(0x9F_DB80, 0x01C0, "SamusTiles_Top_SetC_Entry0.bin")
    dump(0x9F_DD40, 0x01C0, "SamusTiles_Top_SetC_Entry1.bin")
    dump(0x9F_DF00, 0x0140, "SamusTiles_Top_SetC_Entry2.bin")
    dump(0x9F_E040, 0x0140, "SamusTiles_Top_SetC_Entry3.bin")
    dump(0x9F_E180, 0x0140, "SamusTiles_Top_SetC_Entry4.bin")
    dump(0x9F_E2C0, 0x0140, "SamusTiles_Top_SetC_Entry5.bin")
    dump(0x9F_E400, 0x0140, "SamusTiles_Top_SetC_Entry6.bin")
    dump(0x9F_E540, 0x0140, "SamusTiles_Top_SetC_Entry7.bin")
    dump(0x9F_E680, 0x0080, "SamusTiles_Bottom_Set7_Entry0.bin")
    dump(0x9F_E700, 0x0200, "SamusTiles_Bottom_Set7_Entry1.bin")
    dump(0x9F_E900, 0x0200, "SamusTiles_Bottom_Set7_Entry2.bin")
    dump(0x9F_EB00, 0x0140, "SamusTiles_Bottom_SetA_Entry0.bin")
    dump(0x9F_EC40, 0x0140, "SamusTiles_Bottom_SetA_Entry1.bin")
    dump(0x9F_ED80, 0x0200, "SamusTiles_Top_Set6_EntryC.bin")
    dump(0x9F_EF80, 0x0200, "SamusTiles_Top_Set6_EntryD.bin")
    dump(0x9F_F180, 0x0200, "SamusTiles_Top_Set6_EntryE.bin")
    dump(0x9F_F380, 0x01E0, "SamusTiles_Top_Set6_EntryF.bin")
    dump(0x9F_F560, 0x01E0, "SamusTiles_Top_Set6_Entry10.bin")

#    dump(0xA0_8000, 0x8000, "bank_a0.bin") # Enemies
#    dump(0xA1_8000, 0x8000, "bank_a1.bin") # Enemy population
#    dump(0xA2_8000, 0x8000, "bank_a2.bin") # Enemy AI - inc. gunship & shutters
#    dump(0xA3_8000, 0x8000, "bank_a3.bin") # Enemy AI - inc. elevator & metroid

#    dump(0xA4_8000, 0x8000, "bank_a4.bin") # Enemy AI - Crocomire
    if not is_pal:
        p = 0xA4_A07D
    else:
        p = 0xA4_A096
    
    p = dump(p, 0x0C00, "Tiles_Crocomire_Melting1.bin")
    dump(p, 0x0C00, "Tiles_Crocomire_Melting2.bin")

#    dump(0xA5_8000, 0x8000, "bank_a5.bin") # Enemy AI - Draygon & Spore Spawn
#    dump(0xA6_8000, 0x8000, "bank_a6.bin") # Enemy AI - inc. Ridley & zebetites
#    dump(0xA7_8000, 0x8000, "bank_a7.bin") # Enemy AI - inc. Kraid & Phantoon
    if not is_pal:
        dump(0xA7_A716, 0x0200, "Tiles_KraidRoomBackground.bin")
    else:
        dump(0xA7_A726, 0x0200, "Tiles_KraidRoomBackground.bin")

#    dump(0xA8_8000, 0x8000, "bank_a8.bin") # Enemy AI - inc. ki-hunter
#    dump(0xA9_8000, 0x8000, "bank_a9.bin") # Enemy AI - Mother Brain, Shitroid & dead monsters
#    dump(0xAA_8000, 0x8000, "bank_aa.bin") # Enemy AI - inc. Torizo & Tourian statue
    if not is_pal:
        dump(0xAA_B279, 0x0600, "Tiles_Torizo.bin")
    else:
        dump(0xAA_B289, 0x0600, "Tiles_Torizo.bin")

#    dump(0xAB_8000, 0x8000, "bank_ab.bin") # Enemy graphics - inc. Kraid
    dump(0xAB_8000, 0x1000, "Tiles_MiniKraid.bin")
    dump(0xAB_9000, 0x0800, "Tiles_Hibashi_Puromi.bin")
    dump(0xAB_9800, 0x0400, "Tiles_Kzan.bin")
    dump(0xAB_9C00, 0x1000, "Tiles_Boulder.bin")
    dump(0xAB_AC00, 0x0400, "Tiles_Sidehopper.bin")
    dump(0xAB_B000, 0x0400, "Tiles_Dessgeega.bin")
    dump(0xAB_B400, 0x1800, "Tiles_NoobTubeCrack.bin")
    dump(0xAB_CC00, 0x1E00, "Tiles_Kraid.bin")
    dump(0xAB_EA00, 0x0A00, "Tiles_DebuggerFont.bin")
    dump(0xAB_F400, 0x0400, "Tiles_MotherBrainExplodedEscapeDoorParticles.bin")

#    dump(0xAC_8000, 0x8000, "bank_ac.bin") # Enemy graphics - inc. Spore Spawn & Phantoon
    dump(0xAC_8000, 0x0200, "Tiles_Sbug.bin")
    dump(0xAC_8200, 0x0600, "Tiles_Etecoon.bin")
    dump(0xAC_8800, 0x0C00, "Tiles_Dachora.bin")
    dump(0xAC_9400, 0x0400, "Tiles_Mochtroid.bin")
    dump(0xAC_9800, 0x0400, "Tiles_Tripper.bin")
    dump(0xAC_9C00, 0x0E00, "Tiles_SporeSpawn.bin")
    dump(0xAC_AA00, 0x0C00, "Tiles_Phantoon.bin")
    dump(0xAC_B600, 0x0400, "Tiles_Boyon.bin")
    dump(0xAC_BA00, 0x0400, "Tiles_Shutter.bin")
    dump(0xAC_BE00, 0x1200, "Tiles_Chozo.bin")
    dump(0xAC_D000, 0x0400, "Tiles_Stoke.bin")
    dump(0xAC_D400, 0x0C00, "Tiles_MamaTurtle_BabyTurtle.bin")
    dump(0xAC_E000, 0x0400, "Tiles_Choot.bin")
    dump(0xAC_E400, 0x0200, "Tiles_Puyo.bin")
    dump(0xAC_E600, 0x0400, "Tiles_Cacatac.bin")
    dump(0xAC_EA00, 0x0400, "Tiles_Owtch.bin")

#    dump(0xAD_8000, 0x8000, "bank_ad.bin") # Enemy graphics - Crocomire, gunship & space pirates; extra Mother Brain code 
    dump(0xAD_8000, 0x2600, "Tiles_Crocomire.bin")
    dump(0xAD_A600, 0x0200, "Tiles_CrocomireSkeleton_0.bin")
    dump(0xAD_A800, 0x0200, "Tiles_CrocomireSkeleton_1.bin")
    dump(0xAD_AA00, 0x0200, "Tiles_CrocomireSkeleton_2.bin")
    dump(0xAD_AC00, 0x0200, "Tiles_CrocomireSkeleton_3.bin")
    dump(0xAD_AE00, 0x0200, "Tiles_CrocomireSkeleton_4.bin")
    dump(0xAD_B000, 0x0200, "Tiles_CrocomireSkeleton_5.bin")
    dump(0xAD_B200, 0x0400, "Tiles_BombTorizosCrumblingChozo.bin")
    dump(0xAD_B600, 0x1000, "Tiles_Ship.bin")
    dump(0xAD_C600, 0x1800, "Tiles_SpacePirate.bin")

#    dump(0xAE_8000, 0x8000, "bank_ae.bin") # Enemy graphics
    dump(0xAE_8000, 0x0600, "Tiles_Zoomer.bin")
    dump(0xAE_8600, 0x0600, "Tiles_Waver.bin")
    dump(0xAE_8C00, 0x0400, "Tiles_Skree.bin")
    dump(0xAE_9000, 0x1000, "Tiles_Metroid.bin")
    dump(0xAE_A000, 0x0600, "Tiles_Dragon.bin")
    dump(0xAE_A600, 0x0400, "Tiles_Mellow.bin")
    dump(0xAE_AA00, 0x0600, "Tiles_SidehopperLarge.bin")
    dump(0xAE_B000, 0x0400, "Tiles_Rio.bin")
    dump(0xAE_B400, 0x0400, "Tiles_Multiviola.bin")
    dump(0xAE_B800, 0x0520, "Tiles_Polyp_Rinka.bin")
    dump(0xAE_BD20, 0x0400, "Tiles_Squeept.bin")
    dump(0xAE_C120, 0x0400, "Tiles_Zeb.bin")
    dump(0xAE_C520, 0x0400, "Tiles_Ripper.bin")
    dump(0xAE_C920, 0x0400, "Tiles_Mella.bin")
    dump(0xAE_CD20, 0x0400, "Tiles_Menu.bin")
    dump(0xAE_D120, 0x0400, "Tiles_DessgeegaLarge.bin")
    dump(0xAE_D520, 0x0400, "Tiles_Geruta.bin")
    dump(0xAE_D920, 0x0800, "Tiles_Holtz.bin")
    dump(0xAE_E120, 0x0400, "Tiles_Geega.bin")
    dump(0xAE_E520, 0x0400, "Tiles_Zebbo.bin")
    dump(0xAE_E920, 0x0400, "Tiles_Gamet.bin")
    dump(0xAE_ED20, 0x0600, "Tiles_Zeela.bin")
    dump(0xAE_F320, 0x0600, "Tiles_Sova.bin")
    dump(0xAE_F920, 0x0400, "Tiles_Viola.bin")

#    dump(0xAF_8000, 0x8000, "bank_af.bin") # Enemy graphics - inc. Torizo
    dump(0xAF_8000, 0x0800, "Tiles_Oum.bin")
    dump(0xAF_8800, 0x0A00, "UNUSED_Tiles_Gravy_AF8800.bin")
    dump(0xAF_9200, 0x0600, "Tiles_Metaree.bin")
    dump(0xAF_9800, 0x1000, "Tiles_Bang.bin")
    dump(0xAF_A800, 0x0600, "Tiles_Fireflea.bin")
    dump(0xAF_AE00, 0x0600, "Tiles_Reflec.bin")
    dump(0xAF_B400, 0x0800, "Tiles_Yard.bin")
    dump(0xAF_BC00, 0x0600, "Tiles_Skultera.bin")
    dump(0xAF_C200, 0x2000, "Tiles_BombTorizo_GoldenTorizo.bin")
    dump(0xAF_E200, 0x0600, "Tiles_GoldenTorizoEgg.bin")
    dump(0xAF_E800, 0x0400, "Tiles_Zoa.bin")

#    dump(0xB0_8000, 0x8000, "bank_b0.bin") # Enemy graphics - inc. Ridley, Draygon & Mother Brain
    dump(0xB0_8000, 0x1000, "Tiles_Debug_PaletteViewer.bin")
    dump(0xB0_9000, 0x0400, "UNUSED_Tiles_SolidColor_B09000.bin")
    dump(0xB0_9400, 0x0440, "Tiles_Ridley_0.bin")
    dump(0xB0_9840, 0x0200, "Tiles_Ridley_1.bin")
    dump(0xB0_9A40, 0x0F40, "Tiles_Ridley_2.bin")
    dump(0xB0_A980, 0x0200, "Tiles_Ridley_3.bin")
    dump(0xB0_AB80, 0x0880, "Tiles_Ridley_4.bin")
    dump(0xB0_B400, 0x0400, "Tiles_RidleyExplosion.bin")
    dump(0xB0_B800, 0x0040, "Tiles_RidleysRibsAndClaws_0.bin")
    dump(0xB0_B840, 0x0040, "Tiles_RidleysRibsAndClaws_1.bin")
    dump(0xB0_B880, 0x0080, "Tiles_RidleysRibsAndClaws_2.bin")
    dump(0xB0_B900, 0x0040, "Tiles_RidleysRibsAndClaws_3.bin")
    dump(0xB0_B940, 0x0040, "Tiles_RidleysRibsAndClaws_4.bin")
    dump(0xB0_B980, 0x0080, "Tiles_RidleysRibsAndClaws_5.bin")
    dump(0xB0_BA00, 0x0200, "Tiles_CeresDoor_0.bin")
    dump(0xB0_BC00, 0x0200, "Tiles_CeresDoor_1.bin")
    dump(0xB0_BE00, 0x0200, "Tiles_CeresDoor_2.bin")
    dump(0xB0_C000, 0x0200, "Tiles_EscapeTimer_0.bin")
    dump(0xB0_C200, 0x0200, "Tiles_EscapeTimer_1.bin")
    dump(0xB0_C400, 0x0400, "Tiles_CeresElevatorRoomDoor.bin")
    dump(0xB0_C800, 0x2000, "Tiles_Draygon.bin")
    dump(0xB0_E800, 0x0600, "Tiles_MotherBrainBody.bin")

#    dump(0xB1_8000, 0x8000, "bank_b1.bin") # Enemy graphics - inc. Shitroid & ki-hunter
    dump(0xB1_8000, 0x0400, "Tiles_Kamer.bin")
    dump(0xB1_8400, 0x0C00, "Tiles_BabyMetroid.bin")
    dump(0xB1_9000, 0x0400, "Tiles_Shaktool.bin")
    dump(0xB1_9400, 0x0600, "Tiles_Evir.bin")
    dump(0xB1_9A00, 0x0400, "Tiles_Eye.bin")
    dump(0xB1_9E00, 0x0800, "Tiles_Fune_Namihe.bin")
    dump(0xB1_A600, 0x0400, "Tiles_Coven.bin")
    dump(0xB1_AA00, 0x0400, "Tiles_YappingMaw.bin")
    dump(0xB1_AE00, 0x0800, "Tiles_Kago.bin")
    dump(0xB1_B600, 0x0400, "Tiles_Sciser.bin")
    dump(0xB1_BA00, 0x0200, "Tiles_FaceBlock.bin")
    dump(0xB1_BC00, 0x0600, "Tiles_Magdollite.bin")
    dump(0xB1_C200, 0x0600, "Tiles_Beetom.bin")
    dump(0xB1_C800, 0x0400, "Tiles_Zero.bin")
    dump(0xB1_CC00, 0x0400, "Tiles_Powamp.bin")
    dump(0xB1_D000, 0x0C00, "Tiles_Robot.bin")
    dump(0xB1_DC00, 0x0600, "Tiles_Bull.bin")
    dump(0xB1_E200, 0x0800, "Tiles_Alcoon.bin")
    dump(0xB1_EA00, 0x0200, "Tiles_Spark.bin")
    dump(0xB1_EC00, 0x1000, "Tiles_Kihunter.bin")
    dump(0xB1_FC00, 0x0400, "Tiles_Atomic.bin")

#    dump(0xB2_8000, 0x8000, "bank_b2.bin") # Enemy AI - space pirates
#    dump(0xB3_8000, 0x8000, "bank_b3.bin") # Enemy AI - inc. Botwoon
#    dump(0xB4_8000, 0x8000, "bank_b4.bin") # Enemy instructions, sets, drop chances, resistances
#    dump(0xB5_8000, 0x8000, "bank_b5.bin") # Region maps

#    dump(0xB6_8000, 0x8000, "bank_b6.bin") # Pause screen graphics
    dump(0xB6_8000, 0x4000, "Tiles_PauseScreen_BG1_BG2.bin")
    dump(0xB6_C000, 0x2000, "Tiles_Menu_PauseScreen_Sprites.bin")

#    dump(0xB7_8000, 0x8000, "bank_b7.bin") # Enemy graphics - inc. dead enemies, Botwoon & Mother Brain
    dump(0xB7_8000, 0x1000, "Tiles_MotherBrainHead.bin")
    dump(0xB7_9000, 0x1000, "Tiles_MotherBrainLegs.bin")
    dump(0xB7_A000, 0x0800, "Tiles_MotherBrain_BombShells_DeathBeam_UnusedGFX.bin")
    dump(0xB7_A800, 0x1800, "Tiles_CorpseTorizo.bin")
    dump(0xB7_C000, 0x0E00, "Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree.bin")
    dump(0xB7_CE00, 0x0C00, "Tiles_CorpseMotherBrain.bin")
    
    p = 0xB7_DA00
    if not is_pal:
        p = dump(p, 0x0200, "Tiles_EscapeTimerText_0.bin")
        p = dump(p, 0x0200, "Tiles_EscapeTimerText_1.bin")
        p = dump(p, 0x0200, "Tiles_EscapeTimerText_2.bin")
        p = dump(p, 0x0200, "Tiles_EscapeTimerText_3.bin")
        p = dump(p, 0x0100, "Tiles_EscapeTimerText_4.bin")
    else:
        p = dump(p, 0x01C0, "Tiles_EscapeTimerText_0_PAL.bin")
        p = dump(p, 0x0200, "Tiles_EscapeTimerText_1_PAL.bin")
        p = dump(p, 0x0200, "Tiles_EscapeTimerText_2_PAL.bin")
        p = dump(p, 0x0200, "Tiles_EscapeTimerText_3_PAL.bin")
        p = dump(p, 0x0200, "Tiles_EscapeTimerText_4_PAL.bin")
        p = dump(p, 0x0200, "Tiles_EscapeTimerText_5_PAL.bin")
        
    p = dump(p, 0x1800, "Tiles_Botwoon.bin")
    dump(p, 0x0200, "UNUSED_Tiles_SpinningTurtleEye_B7FB00.bin")

    # Bank B8 is unused (apparently extra dev RAM)

    # Banks B9..CE: CRE, background images, tile graphics, tile tables, palettes, level data
    #dump_range(0xB9_8000, 0xCE_FFFF, "bank_data.bin")
#    dump(0xB9_8000, 0x8000, "bank_b9.bin") # CRE, background images, tile graphics, tile tables, palettes, level data
    dump(0xB9_8000, 0x209D, "CRE_Tiles_Compressed.bin")
    dump(0xB9_A09D, 0x0597, "CRE_TileTable_Compressed.bin")
    dump(0xB9_A634, 0x00E0, "Background_Norfair_9_A_SmallPatternBrownPurple_Bright.bin")
    dump(0xB9_A714, 0x004A, "Background_Norfair_9_A_SmallPatternBrownPurple_0.bin")
    dump(0xB9_A75E, 0x004A, "Background_Norfair_9_A_SmallPatternBrownPurple_1.bin")
    dump(0xB9_A7A8, 0x0092, "Background_Norfair_9_HorizontalPatternBrick.bin")
    dump(0xB9_A83A, 0x0449, "Background_Norfair_9_VerticalPatternBrick.bin")
    dump(0xB9_AC83, 0x027C, "Background_Norfair_9_A_CavernStalactites.bin")
    dump(0xB9_AEFF, 0x03F1, "Background_Norfair_9_A_CavernVertical.bin")
    dump(0xB9_B2F0, 0x03CB, "Background_Norfair_9_CavernHorizontalRuins.bin")
    dump(0xB9_B6BB, 0x04EA, "Background_Norfair_9_CavernVerticalRuins.bin")
    dump(0xB9_BBA5, 0x0396, "Background_Norfair_9_CavernRoomPillars.bin")
    dump(0xB9_BF3B, 0x0334, "Background_Norfair_9_RoomStatues.bin")
    dump(0xB9_C26F, 0x0359, "Background_Norfair_9_PurplePatches.bin")
    dump(0xB9_C5C8, 0x03AA, "Background_Norfair_9_Bubbles.bin")
    dump(0xB9_C972, 0x038F, "Background_Brinstar_6_Vertical_GlowPatches.bin")
    dump(0xB9_CD01, 0x019E, "Background_Brinstar_6_Horizontal_GlowPatches.bin")
    dump(0xB9_CE9F, 0x0159, "Background_Brinstar_6_LargeHorizontalPattern.bin")
    dump(0xB9_CFF8, 0x0203, "Background_Brinstar_6_MediumHorizontalPattern.bin")
    dump(0xB9_D1FB, 0x0194, "Background_Brinstar_6_ThinHorizontalPattern.bin")
    dump(0xB9_D38F, 0x0036, "Background_Brinstar_6_SmallPattern.bin")
    dump(0xB9_D3C5, 0x0036, "Background_Brinstar_6_SpheresPattern.bin")
    dump(0xB9_D3FB, 0x016F, "Background_Brinstar_6_SmallPattern_Variety_0.bin")
    dump(0xB9_D56A, 0x0037, "Background_Brinstar_6_SmallPattern_Variety_1.bin")
    dump(0xB9_D5A1, 0x0037, "Background_Brinstar_6_SmallPattern_Variety_2.bin")
    dump(0xB9_D5D8, 0x013D, "Background_Brinstar_6_DarkPattern.bin")
    dump(0xB9_D715, 0x0287, "Background_Brinstar_7_WideVerticalTower_Brick_0.bin")
    dump(0xB9_D99C, 0x0475, "Background_Brinstar_7_WideVerticalTower_Brick_1.bin")
    dump(0xB9_DE11, 0x03A2, "Background_Brinstar_7_WideVerticalTower_Brick_2.bin")
    dump(0xB9_E1B3, 0x0469, "Background_Brinstar_7_VerticalTower.bin")
    dump(0xB9_E61C, 0x0269, "Background_Brinstar_7_NarrowVerticalTower_Brick.bin")
    dump(0xB9_E885, 0x00CA, "Background_Brinstar_7_VerticalBrick_0.bin")
    dump(0xB9_E94F, 0x0131, "Background_Brinstar_7_VerticalBrick_1.bin")
    dump(0xB9_EA80, 0x0147, "Background_Brinstar_7_MechanicalRoom_SpikeFloor.bin")
    dump(0xB9_EBC7, 0x028B, "Background_Brinstar_7_MechanicalRoom.bin")
    dump(0xB9_EE52, 0x02CB, "Background_Brinstar_7_NarrowVerticalTower_Brick_Vines_0.bin")
    dump(0xB9_F11D, 0x00AB, "Background_Brinstar_7_NarrowVerticalTower_Brick_Vines_1.bin")
    dump(0xB9_F1C8, 0x0545, "Background_Brinstar_8_NarrowVerticalTower_Brick_Grey_0.bin")
    dump(0xB9_F70D, 0x0021, "Background_Brinstar_8_NarrowVerticalTower_Brick_Grey_1.bin")
    dump(0xB9_F72E, 0x0221, "Background_Brinstar_8_NarrowVerticalTower_Brick_Grey_2.bin")
    dump(0xB9_F94F, 0x00E9, "Background_Brinstar_7_BlueGridBlocks.bin")
    dump(0xB9_FA38, 0x0406, "Background_Brinstar_1A_Kraid_Upper.bin")
    dump(0xB9_FE3E, 0x0110, "Background_Brinstar_1A_Kraid_Lower_0.bin")
    dump(0xB9_FF4E, 0x0130, "Background_Brinstar_1A_Kraid_Lower_1.bin")

#    dump(0xBA_8000, 0x8000, "bank_ba.bin") # CRE, background images, tile graphics, tile tables, palettes, level data
    dump(0xBA_807E, 0x0246, "Background_Crateria_0_VerticalPatternRocks.bin")
    dump(0xBA_82C4, 0x0173, "Background_Crateria_0_HorizontalPatternRocks.bin")
    dump(0xBA_8437, 0x0183, "Background_Crateria_0_Rocks.bin")
    dump(0xBA_85BA, 0x0142, "Background_Crateria_2_PurpleRocks.bin")
    dump(0xBA_86FC, 0x0084, "Background_Crateria_2_BrickRoom_WallArt_Dark.bin")
    dump(0xBA_8780, 0x02C9, "Background_Crateria_2_3_Mechanical.bin")
    dump(0xBA_8A49, 0x0084, "Background_Crateria_2_BrickRoom_WallArt.bin")
    dump(0xBA_8ACD, 0x02F0, "Background_Crateria_2_Elevator.bin")
    dump(0xBA_8DBD, 0x002A, "Background_Crateria_2_BrickRoom.bin")
    dump(0xBA_8DE7, 0x023C, "Background_WreckedShip_4_5_EntranceHall_0.bin")
    dump(0xBA_9023, 0x0363, "Background_WreckedShip_4_5_EntranceHall_1.bin")
    dump(0xBA_9386, 0x0507, "Background_WreckedShip_4_5_Columns_Tubes.bin")
    dump(0xBA_988D, 0x03A8, "Background_WreckedShip_4_5_ExperimentRoom.bin")
    dump(0xBA_9C35, 0x02DD, "Background_WreckedShip_4_5_Panels_Vents.bin")
    dump(0xBA_9F12, 0x0207, "Background_WreckedShip_4_5_Panels_Vents_Horizontal.bin")
    dump(0xBA_A119, 0x035C, "Background_WreckedShip_4_5_Panels_Vents_Vertical.bin")
    dump(0xBA_A475, 0x022A, "Background_Maridia_B_BrownWall.bin")
    dump(0xBA_A69F, 0x03D9, "Background_Maridia_C_GreenWall.bin")
    dump(0xBA_AA78, 0x0378, "Background_Tourian_D_MechanicalRoom.bin")
    dump(0xBA_ADF0, 0x01F6, "Background_Tourian_D_MechanicalRoom_Letterbox.bin")
    dump(0xBA_AFE6, 0x0385, "Background_Tourian_D_VerticalStructures.bin")
    dump(0xBA_B36B, 0x026D, "Background_Tourian_D_PipeRoom_Letterbox.bin")
    dump(0xBA_B5D8, 0x03CB, "Background_Tourian_D_PipeRoom_VerticalSeparation.bin")
    dump(0xBA_B9A3, 0x0436, "Background_Tourian_D_PipeRoom.bin")
    dump(0xBA_BDD9, 0x0451, "Background_Tourian_E_PipeRoom_Dark.bin")
    dump(0xBA_C22A, 0x0292, "Background_Tourian_D_E_StatueHall.bin")
    dump(0xBA_C4BC, 0x0164, "Background_Tourian_15_Statues.bin")
    dump(0xBA_C620, 0x0009, "Background_Blank.bin")
    dump(0xBA_C629, 0x32E8, "Tiles_0_1_UpperCrateria.bin")
    dump(0xBA_F911, 0x358D, "Tiles_2_3_LowerCrateria.bin")

#    dump(0xBB_8000, 0x8000, "bank_bb.bin") # CRE, background images, tile graphics, tile tables, palettes, level data
    dump(0xBB_AE9E, 0x3812, "Tiles_4_5_WreckedShip.bin")
    dump(0xBB_E6B0, 0x3EFA, "Tiles_6_GreenBlueBrinstar.bin")

#    dump(0xBC_8000, 0x8000, "bank_bc.bin") # CRE, background images, tile graphics, tile tables, palettes, level data
    dump(0xBC_A5AA, 0x3A46, "Tiles_7_8_RedBrinstar_Kraid_StatuesHall.bin")
    dump(0xBC_DFF0, 0x6409, "Tiles_1A_Kraid.bin")

#    dump(0xBD_8000, 0x8000, "bank_bd.bin") # CRE, background images, tile graphics, tile tables, palettes, level data
    dump(0xBD_C3F9, 0x3A31, "Tiles_9_A_Norfair.bin")
    dump(0xBD_FE2A, 0x3306, "Tiles_1B_Crocomire.bin")

#    dump(0xBE_8000, 0x8000, "bank_be.bin") # CRE, background images, tile graphics, tile tables, palettes, level data
    dump(0xBE_B130, 0x365D, "Tiles_B_SandlessMaridia.bin")
    dump(0xBE_E78D, 0x365D, "Tiles_C_SandyMaridia.bin")

#    dump(0xBF_8000, 0x8000, "bank_bf.bin") # CRE, background images, tile graphics, tile tables, palettes, level data
    dump(0xBF_9DEA, 0x362A, "Tiles_1C_Draygon.bin")
    dump(0xBF_D414, 0x31F7, "Tiles_D_E_Tourian.bin")

#    dump(0xC0_8000, 0x8000, "bank_c0.bin") # CRE, background images, tile graphics, tile tables, palettes, level data
    dump(0xC0_860B, 0x29F9, "Tiles_15_16_17_18_19_UtilityRoom_Statues.bin")
    dump(0xC0_B004, 0x3226, "Tiles_F_10_Ceres.bin")
    dump(0xC0_E22A, 0x2B7F, "Tiles_11_12_CeresElevator.bin")

#    dump(0xC1_8000, 0x8000, "bank_c1.bin") # CRE, background images, tile graphics, tile tables, palettes, level data
    dump(0xC1_8DA9, 0x294D, "Tiles_13_14_CeresRidley.bin")
    dump(0xC1_B6F6, 0x07F8, "TileTables_0_1_UpperCrateria.bin")
    dump(0xC1_BEEE, 0x06E1, "TileTables_2_3_LowerCrateria.bin")
    dump(0xC1_C5CF, 0x09D7, "TileTables_4_5_WreckedShip.bin")
    dump(0xC1_CFA6, 0x0936, "TileTables_6_GreenBlueBrinstar.bin")
    dump(0xC1_D8DC, 0x08AD, "TileTables_7_8_RedBrinstar_Kraid_StatuesHall.bin")
    dump(0xC1_E189, 0x01D8, "TileTables_1A_Kraid.bin")
    dump(0xC1_E361, 0x104E, "TileTables_9_A_Norfair.bin")
    dump(0xC1_F3AF, 0x0102, "TileTables_1B_Crocomire.bin")
    dump(0xC1_F4B1, 0x10AE, "TileTables_B_SandlessMaridia.bin")

#    dump(0xC2_8000, 0x8000, "bank_c2.bin") # CRE, background images, tile graphics, tile tables, palettes, level data

    dump(0xC2_855F, 0x10AE, "TileTables_C_SandyMaridia.bin")
    dump(0xC2_960D, 0x04F4, "TileTables_1C_Draygon.bin")
    dump(0xC2_9B01, 0x077A, "TileTables_D_E_Tourian.bin")
    dump(0xC2_A27B, 0x04E3, "TileTables_15_16_17_18_19_UtilityRoom_Statues.bin")
    dump(0xC2_A75E, 0x061E, "TileTables_F_10_11_12_13_14_Ceres.bin")
    dump(0xC2_AD7C, 0x00E1, "Palettes_0_UpperCrateria.bin")
    dump(0xC2_AE5D, 0x00E6, "Palettes_1_RedCrateria.bin")
    dump(0xC2_AF43, 0x00D2, "Palettes_2_LowerCrateria.bin")
    dump(0xC2_B015, 0x00D2, "Palettes_3_OldTourian.bin")
    dump(0xC2_B0E7, 0x00BF, "Palettes_4_WreckedShip_PowerOn.bin")
    dump(0xC2_B1A6, 0x00BE, "Palettes_5_WreckedShip_PowerOff.bin")
    dump(0xC2_B264, 0x00FB, "Palettes_6_GreenBlueBrinstar.bin")
    dump(0xC2_B35F, 0x00E8, "Palettes_7_RedBrinstar_Kraid.bin")
    dump(0xC2_B447, 0x00C9, "Palettes_8_StatuesHall.bin")
    dump(0xC2_B510, 0x00D4, "Palettes_1A_Kraid.bin")
    dump(0xC2_B5E4, 0x00D7, "Palettes_9_HeatedNorfair.bin")
    dump(0xC2_B6BB, 0x00DD, "Palettes_A_UnheatedNorfair.bin")
    dump(0xC2_B798, 0x00A4, "Palettes_1B_Crocomire.bin")
    dump(0xC2_B83C, 0x00F2, "Palettes_B_SandlessMaridia.bin")
    dump(0xC2_B92E, 0x00FE, "Palettes_C_SandyMaridia.bin")
    dump(0xC2_BA2C, 0x00C1, "Palettes_1C_Draygon.bin")
    dump(0xC2_BAED, 0x00D4, "Palettes_D_Tourian.bin")
    dump(0xC2_BBC1, 0x00DB, "Palettes_E_MotherBrain.bin")
    dump(0xC2_BC9C, 0x00DF, "Palettes_Map_Statues.bin")
    dump(0xC2_BD7B, 0x00DD, "Palettes_16_WreckedShipMap_PowerOff.bin")
    dump(0xC2_BE58, 0x00E5, "Palettes_17_BlueRefill.bin")
    dump(0xC2_BF3D, 0x00E4, "Palettes_18_YellowRefill.bin")
    dump(0xC2_C021, 0x00E3, "Palettes_19_SaveStation.bin")
    dump(0xC2_C104, 0x00DF, "Palettes_F_11_13_BlueCeres.bin")
    dump(0xC2_C1E3, 0x00D8, "Palettes_10_12_14_WhiteCeres.bin")
    dump(0xC2_C2BB, 0x142D, "LevelData_LandingSite.bin")
    dump(0xC2_D6E8, 0x04DC, "LevelData_GauntletEntrance.bin")
    dump(0xC2_DBC4, 0x0DB3, "LevelData_Parlor.bin")
    dump(0xC2_E977, 0x01CE, "LevelData_CrateriaPowerBombs.bin")
    dump(0xC2_EB45, 0x22DA, "LevelData_WestOcean.bin")

#    dump(0xC3_8000, 0x8000, "bank_c3.bin") # CRE, background images, tile graphics, tile tables, palettes, level data
    dump(0xC3_8E1F, 0x01DF, "LevelData_BowlingAlleyPath.bin")
    dump(0xC3_8FFE, 0x0BFE, "LevelData_CrateriaKihunter.bin")
    dump(0xC3_9BFC, 0x01BC, "LevelData_ForgottenHighwayElev.bin")
    dump(0xC3_9DB8, 0x0F23, "LevelData_EastOcean.bin")
    dump(0xC3_ACDB, 0x04DF, "LevelData_ForgottenHighwayKagos.bin")
    dump(0xC3_B1BA, 0x09E1, "LevelData_CrabMaze.bin")
    dump(0xC3_BB9B, 0x0137, "LevelData_ForgottenHighwayElbow.bin")
    dump(0xC3_BCD2, 0x009B, "LevelData_CrateriaTube.bin")
    dump(0xC3_BD6D, 0x03D8, "LevelData_Moat.bin")
    dump(0xC3_C145, 0x01BC, "LevelData_RedBinstarElev.bin")
    dump(0xC3_C301, 0x050B, "LevelData_GauntletETank.bin")
    dump(0xC3_C80C, 0x018C, "LevelData_PreBowling.bin")
    dump(0xC3_C998, 0x105F, "LevelData_Climb.bin")
    dump(0xC3_D9F7, 0x052C, "LevelData_Pit.bin")
    dump(0xC3_DF23, 0x01AD, "LevelData_ElevToBlueBrinstar.bin")
    dump(0xC3_E0D0, 0x009E, "LevelData_BombTorizo.bin")
    dump(0xC3_E16E, 0x00C4, "LevelData_Flyway.bin")
    dump(0xC3_E232, 0x00CA, "LevelData_PreMapFlyway.bin")
    dump(0xC3_E2FC, 0x0689, "LevelData_Terminator.bin")
    dump(0xC3_E985, 0x01B0, "LevelData_GreenBrinstarElev.bin")
    dump(0xC3_EB35, 0x032B, "LevelData_LowerMushrooms.bin")
    dump(0xC3_EE60, 0x0673, "LevelData_GreenPiratesShaft.bin")
    dump(0xC3_F4D3, 0x0C4B, "LevelData_CrateriaSuper.bin")

#    dump(0xC4_8000, 0x8000, "bank_c4.bin") # CRE, background images, tile graphics, tile tables, palettes, level data
    dump(0xC4_811E, 0x0114, "LevelData_FinalMissileBombway.bin")
    dump(0xC4_8232, 0x00F0, "LevelData_FinalMissile.bin")
    dump(0xC4_8322, 0x1A0C, "LevelData_BowlingAlley.bin")
    dump(0xC4_9D2E, 0x0180, "LevelData_WreckedShipEntrance.bin")
    dump(0xC4_9EAE, 0x0439, "LevelData_Attic_State0.bin")
    dump(0xC4_A2E7, 0x0439, "LevelData_Attic_State1.bin")
    dump(0xC4_A720, 0x028C, "LevelData_AssemblyLine.bin")
    dump(0xC4_A9AC, 0x1414, "LevelData_WreckedShipMainShaft_State0.bin")
    dump(0xC4_BDC0, 0x13C7, "LevelData_WreckedShipMainShaft_State1.bin")
    dump(0xC4_D187, 0x0267, "LevelData_SpikyDeath.bin")
    dump(0xC4_D3EE, 0x0495, "LevelData_ElectricDeath.bin")
    dump(0xC4_D883, 0x08CB, "LevelData_WreckedShipETank.bin")
    dump(0xC4_E14E, 0x043E, "LevelData_Basement.bin")
    dump(0xC4_E58C, 0x0119, "LevelData_Phantoon.bin")
    dump(0xC4_E6A5, 0x02A9, "LevelData_SpongeBath.bin")
    dump(0xC4_E94E, 0x0141, "LevelData_WSWestSuper.bin")
    dump(0xC4_EA8F, 0x0309, "LevelData_WSEastSuper_State0.bin")
    dump(0xC4_ED98, 0x0309, "LevelData_WSEastSuper_State1.bin")
    dump(0xC4_F0A1, 0x012D, "LevelData_GravitySuit.bin")
    dump(0xC4_F1CE, 0x1A07, "LevelData_GreenBrinstarMainShaft.bin")

#    dump(0xC5_8000, 0x8000, "bank_c5.bin") # CRE, background images, tile graphics, tile tables, palettes, level data
    dump(0xC5_8BD5, 0x0A6D, "LevelData_SporeSpawnSuper.bin")
    dump(0xC5_9642, 0x0113, "LevelData_BrinstarPreMap.bin")
    dump(0xC5_9755, 0x03AB, "LevelData_EarlySupers.bin")
    dump(0xC5_9B00, 0x01AC, "LevelData_BrinstarReserveTank.bin")
    dump(0xC5_9CAC, 0x04B3, "LevelData_GreenBrinstarFirefleas.bin")
    dump(0xC5_A15F, 0x13EE, "LevelData_Dachora.bin")
    dump(0xC5_B54D, 0x165A, "LevelData_BigPink.bin")
    dump(0xC5_CBA7, 0x028D, "LevelData_SporeSpawnKihunters.bin")
    dump(0xC5_CE34, 0x035B, "LevelData_SporeSpawn.bin")
    dump(0xC5_D18F, 0x03CA, "LevelData_PinkBrinstarPowerBombs.bin")
    dump(0xC5_D559, 0x097C, "LevelData_GreenHillZone.bin")
    dump(0xC5_DED5, 0x0765, "LevelData_MorphBall.bin")
    dump(0xC5_E63A, 0x0235, "LevelData_ConstructionZone.bin")
    dump(0xC5_E86F, 0x043F, "LevelData_BlueBrinstarETank.bin")
    dump(0xC5_ECAE, 0x02C3, "LevelData_NoobBridge.bin")
    dump(0xC5_EF71, 0x00E6, "LevelData_GreenBrinstarBeetoms.bin")
    dump(0xC5_F057, 0x03E7, "LevelData_EtecoonETank.bin")
    dump(0xC5_F43E, 0x008B, "LevelData_EtecoonSuper.bin")
    dump(0xC5_F4C9, 0x02AF, "LevelData_SporeSpawnFarming.bin")
    dump(0xC5_F778, 0x05D8, "LevelData_WaterwayETank.bin")
    dump(0xC5_FD50, 0x00CB, "LevelData_FirstMissile.bin")
    dump(0xC5_FE1B, 0x03A7, "LevelData_PinkBrinstarHoppers.bin")

#    dump(0xC6_8000, 0x8000, "bank_c6.bin") # CRE, background images, tile graphics, tile tables, palettes, level data
    dump(0xC6_81C2, 0x0156, "LevelData_HopperETank.bin")
    dump(0xC6_8318, 0x011F, "LevelData_BlueBrinstarBoulders.bin")
    dump(0xC6_8437, 0x00B7, "LevelData_BillyMays.bin")
    dump(0xC6_84EE, 0x0CF5, "LevelData_RedTower.bin")
    dump(0xC6_91E3, 0x0A16, "LevelData_RedBrinstarFirefleas.bin")
    dump(0xC6_9BF9, 0x0177, "LevelData_XrayScope.bin")
    dump(0xC6_9D70, 0x01DB, "LevelData_Hellway.bin")
    dump(0xC6_9F4B, 0x13D4, "LevelData_Caterpillar.bin")
    dump(0xC6_B31F, 0x026D, "LevelData_BetaPowerBomb.bin")
    dump(0xC6_B58C, 0x01AD, "LevelData_AlphaPowerBomb.bin")
    dump(0xC6_B739, 0x01E3, "LevelData_SkreeBoost.bin")
    dump(0xC6_B91C, 0x03AB, "LevelData_BelowSpazer.bin")
    dump(0xC6_BCC7, 0x00BC, "LevelData_Spazer.bin")
    dump(0xC6_BD83, 0x06E6, "LevelData_WarehouseZeela.bin")
    dump(0xC6_C469, 0x01C7, "LevelData_WarehouseETank.bin")
    dump(0xC6_C630, 0x0789, "LevelData_WarehouseKihunter.bin")
    dump(0xC6_CDB9, 0x0512, "LevelData_MiniKraid.bin")
    dump(0xC6_D2CB, 0x0355, "LevelData_KraidEyeDoor.bin")
    dump(0xC6_D620, 0x026D, "LevelData_Kraid.bin")
    dump(0xC6_D88D, 0x04EA, "LevelData_StatuesHallway.bin")
    dump(0xC6_DD77, 0x0169, "UNUSED_LevelData_C6DD77.bin")
    dump(0xC6_DEE0, 0x0475, "LevelData_WarehouseEntrance.bin")
    dump(0xC6_E355, 0x014F, "LevelData_VariaSuit.bin")
    dump(0xC6_E4A4, 0x0151, "LevelData_IceBeamAcid.bin")
    dump(0xC6_E5F5, 0x06C4, "LevelData_Cathedral.bin")
    dump(0xC6_ECB9, 0x0628, "LevelData_CathedralEntrance.bin")
    dump(0xC6_F2E1, 0x05E0, "LevelData_BusinessCenter.bin")
    dump(0xC6_F8C1, 0x0A2C, "LevelData_IceBeamGate.bin")

#    dump(0xC7_8000, 0x8000, "bank_c7.bin") # CRE, background images, tile graphics, tile tables, palettes, level data
    dump(0xC7_82ED, 0x01B6, "LevelData_IceBeamTutorial.bin")
    dump(0xC7_84A3, 0x0133, "LevelData_IceBeam.bin")
    dump(0xC7_85D6, 0x0471, "LevelData_IceBeamSnake.bin")
    dump(0xC7_8A47, 0x02B3, "LevelData_CrumbleShaft.bin")
    dump(0xC7_8CFA, 0x1077, "LevelData_CrocomireSpeedway.bin")
    dump(0xC7_9D71, 0x02C5, "LevelData_Crocomire.bin")
    dump(0xC7_A036, 0x0157, "LevelData_HiJumpBoots.bin")
    dump(0xC7_A18D, 0x08E3, "LevelData_CrocomireEscape.bin")
    dump(0xC7_AA70, 0x0443, "LevelData_HiJumpETank.bin")
    dump(0xC7_AEB3, 0x03D8, "LevelData_PostCrocFarming.bin")
    dump(0xC7_B28B, 0x015C, "LevelData_PostCrocPowerBombs.bin")
    dump(0xC7_B3E7, 0x0399, "LevelData_PostCrocShaft.bin")
    dump(0xC7_B780, 0x03EB, "LevelData_PostCrocMissile.bin")
    dump(0xC7_BB6B, 0x0360, "LevelData_GrappleTutorial3.bin")
    dump(0xC7_BECB, 0x0EC6, "LevelData_PostCrocJump.bin")
    dump(0xC7_CD91, 0x023C, "LevelData_GrappleTutorial2.bin")
    dump(0xC7_CFCD, 0x016F, "LevelData_GrappleTutorial1.bin")
    dump(0xC7_D13C, 0x03C2, "LevelData_GrappleBeam.bin")
    dump(0xC7_D4FE, 0x0171, "LevelData_NorfairReserveTank.bin")
    dump(0xC7_D66F, 0x0226, "LevelData_GreenBubblesMissiles.bin")
    dump(0xC7_D895, 0x07F7, "LevelData_BubbleMountain.bin")
    dump(0xC7_E08C, 0x0A1C, "LevelData_SpeedBoosterHall.bin")
    dump(0xC7_EAA8, 0x015B, "LevelData_SpeedBooster.bin")
    dump(0xC7_EC03, 0x12FF, "LevelData_SingleChamber.bin")
    dump(0xC7_FF02, 0x0630, "LevelData_DoubleChamber.bin")

#    dump(0xC8_8000, 0x8000, "bank_c8.bin") # CRE, background images, tile graphics, tile tables, palettes, level data
    dump(0xC8_8532, 0x012A, "LevelData_WaveBeam.bin")
    dump(0xC8_865C, 0x02F7, "LevelData_SpikyPlatformsTunnel.bin")
    dump(0xC8_8953, 0x0AE7, "LevelData_Volcano.bin")
    dump(0xC8_943A, 0x0923, "LevelData_KronicBoost.bin")
    dump(0xC8_9D5D, 0x0286, "LevelData_MagdolliteTunnel.bin")
    dump(0xC8_9FE3, 0x02EC, "LevelData_PurpleShaft.bin")
    dump(0xC8_A2CF, 0x07BA, "LevelData_LavaDive.bin")
    dump(0xC8_AA89, 0x0164, "LevelData_LowerNorfairElev.bin")
    dump(0xC8_ABED, 0x056E, "LevelData_UpperNorfairFarming.bin")
    dump(0xC8_B15B, 0x039E, "LevelData_RisingTide.bin")
    dump(0xC8_B4F9, 0x035A, "LevelData_AcidSnakesTunnel.bin")
    dump(0xC8_B853, 0x017C, "LevelData_SpikyAcidSnakesTunnel.bin")
    dump(0xC8_B9CF, 0x0152, "LevelData_PurpleFarming.bin")
    dump(0xC8_BB21, 0x02C7, "LevelData_BatCave.bin")
    dump(0xC8_BDE8, 0x037D, "LevelData_FrogSpeedway.bin")
    dump(0xC8_C165, 0x036E, "LevelData_RedPirateShaft.bin")
    dump(0xC8_C4D3, 0x08D6, "LevelData_AcidStatue.bin")
    dump(0xC8_CDA9, 0x07F3, "UNUSED_LevelData_C8CDA9.bin")
    dump(0xC8_D59C, 0x0B01, "LevelData_MainHall.bin")
    dump(0xC8_E09D, 0x0863, "LevelData_GoldenTorizo.bin")
    dump(0xC8_E900, 0x02FD, "LevelData_FastRipper.bin")
    dump(0xC8_EBFD, 0x01D1, "LevelData_Ridley.bin")
    dump(0xC8_EDCE, 0x0251, "LevelData_LNFarming.bin")
    dump(0xC8_F01F, 0x03EC, "LevelData_FastPillarsSetup.bin")
    dump(0xC8_F40B, 0x0180, "UNUSED_LevelData_C8F40B.bin")
    dump(0xC8_F58B, 0x073A, "LevelData_MickeyMouse.bin")
    dump(0xC8_FCC5, 0x055D, "LevelData_Pillar.bin")

#    dump(0xC9_8000, 0x8000, "bank_c9.bin") # CRE, background images, tile graphics, tile tables, palettes, level data
    dump(0xC9_8222, 0x02B1, "LevelData_Plowerhouse.bin")
    dump(0xC9_84D3, 0x04CC, "LevelData_WorstRoomInTheGame.bin")
    dump(0xC9_899F, 0x0B1B, "LevelData_Amphitheatre.bin")
    dump(0xC9_94BA, 0x0828, "LevelData_LNSpringBallMaze.bin")
    dump(0xC9_9CE2, 0x0199, "LevelData_LNEscapePowerBombs.bin")
    dump(0xC9_9E7B, 0x0A11, "LevelData_RedKihunterShaft.bin")
    dump(0xC9_A88C, 0x093B, "LevelData_Wasteland.bin")
    dump(0xC9_B1C7, 0x02E4, "LevelData_MetalPirates.bin")
    dump(0xC9_B4AB, 0x0E62, "LevelData_ThreeMusketeers.bin")
    dump(0xC9_C30D, 0x011B, "LevelData_RidleyETank.bin")
    dump(0xC9_C428, 0x02DE, "LevelData_ScrewAttack.bin")
    dump(0xC9_C706, 0x144C, "LevelData_LNFireflea.bin")
    dump(0xC9_DB52, 0x05D7, "LevelData_GlassTunnel_State0.bin")
    dump(0xC9_E129, 0x0585, "LevelData_GlassTunnel_State1.bin")
    dump(0xC9_E6AE, 0x015B, "LevelData_WestTunnel.bin")
    dump(0xC9_E809, 0x0A1C, "LevelData_EastTunnel.bin")
    dump(0xC9_F225, 0x1CDA, "LevelData_MainStreet.bin")

#    dump(0xCA_8000, 0x8000, "bank_ca.bin") # CRE, background images, tile graphics, tile tables, palettes, level data
    dump(0xCA_8EFF, 0x1214, "LevelData_FishTank.bin")
    dump(0xCA_A113, 0x0E86, "LevelData_MamaTurtle.bin")
    dump(0xCA_AF99, 0x02B6, "LevelData_CrabTunnel.bin")
    dump(0xCA_B24F, 0x1BF3, "LevelData_MtEverest.bin")
    dump(0xCA_CE42, 0x0632, "LevelData_RedFish.bin")
    dump(0xCA_D474, 0x0754, "LevelData_WateringHole.bin")
    dump(0xCA_DBC8, 0x0890, "LevelData_NWestMaridiaBug.bin")
    dump(0xCA_E458, 0x1144, "LevelData_CrabShaft.bin")
    dump(0xCA_F59C, 0x0E3F, "LevelData_PseudoPlasmaSpark.bin")

#    dump(0xCB_8000, 0x8000, "bank_cb.bin") # CRE, background images, tile graphics, tile tables, palettes, level data
    dump(0xCB_83DB, 0x045F, "LevelData_CrabHole.bin")
    dump(0xCB_883A, 0x01A6, "LevelData_WestSandHallTunnel.bin")
    dump(0xCB_89E0, 0x01F4, "LevelData_PlasmaTutorial.bin")
    dump(0xCB_8BD4, 0x0BBE, "LevelData_Plasma.bin")
    dump(0xCB_9792, 0x093E, "LevelData_ThreadTheNeedle.bin")
    dump(0xCB_A0D0, 0x07A8, "LevelData_MaridiaElev.bin")
    dump(0xCB_A878, 0x1DD7, "LevelData_PlasmaSpark.bin")
    dump(0xCB_C64F, 0x0750, "LevelData_Kassiuz.bin")
    dump(0xCB_CD9F, 0x0F54, "LevelData_Toilet.bin")
    dump(0xCB_DCF3, 0x019C, "LevelData_BugSandHole.bin")
    dump(0xCB_DE8F, 0x05E3, "LevelData_WestSandHall.bin")
    dump(0xCB_E472, 0x0427, "LevelData_Oasis.bin")
    dump(0xCB_E899, 0x0399, "LevelData_EastSandHall.bin")
    dump(0xCB_EC32, 0x094E, "LevelData_WestSandHole.bin")
    dump(0xCB_F580, 0x0948, "LevelData_EastSandHole.bin")
    dump(0xCB_FEC8, 0x01F0, "LevelData_WestAqueductQuicksand.bin")

#    dump(0xCC_8000, 0x8000, "bank_cc.bin") # CRE, background images, tile graphics, tile tables, palettes, level data
    dump(0xCC_80B8, 0x01F0, "LevelData_EastAqueductQuicksand.bin")
    dump(0xCC_82A8, 0x1E93, "LevelData_Aqueduct.bin")
    dump(0xCC_A13B, 0x020F, "LevelData_Butterfly.bin")
    dump(0xCC_A34A, 0x08FE, "LevelData_BotwoonHallway.bin")
    dump(0xCC_AC48, 0x0BFB, "LevelData_Pants.bin")
    dump(0xCC_B843, 0x04EE, "LevelData_EastPants.bin")
    dump(0xCC_BD31, 0x04FE, "LevelData_Springball.bin")
    dump(0xCC_C22F, 0x07C2, "LevelData_BelowBotwoonETank.bin")
    dump(0xCC_C9F1, 0x1BC0, "LevelData_Colosseum.bin")
    dump(0xCC_E5B1, 0x085B, "LevelData_ThePrecious.bin")
    dump(0xCC_EE0C, 0x0C81, "LevelData_BotwoonETank.bin")
    dump(0xCC_FA8D, 0x00FB, "LevelData_PlasmaBeachQuicksand.bin")
    dump(0xCC_FB88, 0x01ED, "LevelData_BotwoonQuicksand.bin")
    dump(0xCC_FD75, 0x068F, "LevelData_Shaktool_State0.bin")

#    dump(0xCD_8000, 0x8000, "bank_cd.bin") # CRE, background images, tile graphics, tile tables, palettes, level data
    dump(0xCD_8404, 0x0633, "LevelData_Shaktool_State1.bin")
    dump(0xCD_8A37, 0x0AD7, "LevelData_HalfieClimb.bin")
    dump(0xCD_950E, 0x0410, "LevelData_Botwoon.bin")
    dump(0xCD_991E, 0x020A, "LevelData_SpaceJump.bin")
    dump(0xCD_9B28, 0x04E5, "LevelData_WestCactusAlley.bin")
    dump(0xCD_A00D, 0x1190, "LevelData_EastCactusAlley.bin")
    dump(0xCD_B19D, 0x06A9, "LevelData_Draygon.bin")
    dump(0xCD_B846, 0x03B8, "LevelData_CeresElev.bin")
    dump(0xCD_BBFE, 0x017A, "LevelData_FallingTile.bin")
    dump(0xCD_BD78, 0x0251, "LevelData_MagnetStairs.bin")
    dump(0xCD_BFC9, 0x0367, "LevelData_DeadScientist.bin")
    dump(0xCD_C330, 0x010F, "LevelData_58Escape.bin")
    dump(0xCD_C43F, 0x00BF, "LevelData_CeresRidley.bin")
    dump(0xCD_C4FE, 0x03DE, "LevelData_TourianFirst.bin")
    dump(0xCD_C8DC, 0x04C4, "LevelData_Metroids1.bin")
    dump(0xCD_CDA0, 0x028D, "LevelData_Metroids2.bin")
    dump(0xCD_D02D, 0x03B8, "LevelData_Metroids3.bin")
    dump(0xCD_D3E5, 0x0206, "LevelData_Metroids4.bin")
    dump(0xCD_D5EB, 0x01D9, "LevelData_BlueHopper.bin")
    dump(0xCD_D7C4, 0x016C, "LevelData_DustTorizo.bin")
    dump(0xCD_D930, 0x02C8, "LevelData_BigBoy.bin")
    dump(0xCD_DBF8, 0x02E6, "LevelData_Seaweed.bin")
    dump(0xCD_DEDE, 0x0331, "LevelData_MotherBrain.bin")
    dump(0xCD_E20F, 0x0309, "LevelData_TourianEyeDoor.bin")
    dump(0xCD_E518, 0x03FC, "LevelData_RinkaShaft.bin")
    dump(0xCD_E914, 0x0247, "LevelData_TourianEscape1.bin")
    dump(0xCD_EB5B, 0x021F, "LevelData_TourianEscape2.bin")
    dump(0xCD_ED7A, 0x07BA, "LevelData_TourianEscape3.bin")
    dump(0xCD_F534, 0x0E8F, "LevelData_TourianEscape4.bin")

#    dump(0xCE_8000, 0x8000, "bank_ce.bin") # CRE, background images, tile graphics, tile tables, palettes, level data
    dump(0xCE_83C3, 0x02FA, "LevelData_MapStation_RightSideDoor.bin")
    dump(0xCE_86BD, 0x02F9, "LevelData_MapStation_LeftSideDoor.bin")
    dump(0xCE_89B6, 0x02FD, "LevelData_EnergyRefill_RightSideDoor.bin")
    dump(0xCE_8CB3, 0x02F3, "LevelData_MissileRefill_RightSideDoor.bin")
    dump(0xCE_8FA6, 0x0325, "LevelData_EnergyRefill_BothDoors.bin")
    dump(0xCE_92CB, 0x02F7, "LevelData_SaveStation_RightSideDoor.bin")
    dump(0xCE_95C2, 0x031A, "LevelData_SaveStation_LeftSideDoor.bin")
    dump(0xCE_98DC, 0x030D, "LevelData_EnergyRefill_LeftSideDoor.bin")
    dump(0xCE_9BE9, 0x030D, "LevelData_Statues.bin")
    dump(0xCE_9EF6, 0x030B, "LevelData_SaveStation_BothDoors.bin")
    dump(0xCE_A201, 0x0302, "LevelData_RefillStation_LeftSideDoor.bin")
    dump(0xCE_A503, 0x0320, "UNUSED_LevelData_CEA503.bin")
    dump(0xCE_A823, 0x030E, "LevelData_RefillStation_RightSideDoor.bin")
    dump(0xCE_AB31, 0x030D, "LevelData_MissileRefill_LeftSideDoor.bin")
    dump(0xCE_AE3E, 0x03F0, "LevelData_DebugRoom.bin")

    # Banks CF..DF: Music
    p = 0xCF_8000
    if not is_pal:
        p = dump(p, 0xE20D, "SPCEngine.bin")
    else:
        p = dump(p, 0xE1CF, "SPCEngine_PAL.bin")

    if not is_pal:
        p = dump(p, 0x541D, "Music_TitleSequence.bin")
    else:
        p = dump(p, 0x541F, "Music_TitleSequence_PAL.bin")

    p = dump(p, 0x52A0, "Music_EmptyCrateria.bin")

    if not is_pal:
        p = dump(p, 0x50EC, "Music_LowerCrateria.bin")
    else:
        p = dump(p, 0x50EC, "Music_LowerCrateria_PAL.bin")
        
    p = dump(p, 0x3986, "Music_UpperCrateria.bin")

    p = dump(p, 0x54D6, "Music_GreenBrinstar.bin")
    p = dump(p, 0x505A, "Music_RedBrinstar.bin")

    p = dump(p, 0x3BB4, "Music_UpperNorfair.bin")
    p = dump(p, 0x5424, "Music_LowerNorfair.bin")

    p = dump(p, 0x5073, "Music_Maridia.bin")

    p = dump(p, 0x56E6, "Music_Tourian.bin")
    p = dump(p, 0x4FD6, "Music_MotherBrain.bin")

    if not is_pal:
        p = dump(p, 0x5A3F, "Music_BossFight1.bin")
    else:
        p = dump(p, 0x5A47, "Music_BossFight1_PAL.bin")

    p = dump(p, 0x50D9, "Music_BossFight2.bin")
    p = dump(p, 0x4BF0, "Music_MiniBossFight.bin")

    p = dump(p, 0x3F62, "Music_Ceres.bin")
    p = dump(p, 0x4073, "Music_WreckedShip.bin")

    p = dump(p, 0x1FEB, "Music_ZebesExplosion.bin")
    p = dump(p, 0x4DD4, "Music_Intro.bin")

    p = dump(p, 0x3B40, "Music_Death.bin")
    p = dump(p, 0x501D, "Music_Credits.bin")

    p = dump(p, 0x4B5B, "Music_TheLastMetroidIsInCaptivity.bin")
    p = dump(p, 0x363D, "Music_TheGalaxyIsAtPeace.bin")

    p = dump(p, 0x50BD, "Music_BabyMetroid_BossFight2.bin")

    dump(p, 0x4FFF, "Music_SamusTheme_UpperCrateria.bin")

    dump(0xDF_8000, 0x54DF, "UNUSED_Music_DF8000.bin")


ROM_CHECKSUMS = {
    # (CRC32, SHA256)
    "NTSC": (0xD63ED5F8, "12b77c4bc9c1832cee8881244659065ee1d84c70c3d29e6eaf92e6798cc2ca72"),
    "PAL": (0xAD2CBF9C, "640ACB63DAE038AD6F0AE65E103416F5A1F84D4A37DDAEEAB5046122DEF774D5"),
}

def rom_valid(rom_data, variant):
    if len(rom_data) != 0x300000: # 3MB
        print("Unexpected size: " + str(len(rom_data)))
        return False

    expected_crc32, expected_sha256 = ROM_CHECKSUMS[variant]
    if zlib.crc32(rom_data) != expected_crc32:
        print("Unexpected CRC32: " + hex(zlib.crc32(rom_data))[2:].upper())
        return False

    if hashlib.sha256(rom_data).hexdigest() != expected_sha256:
        print("Unexpected SHA256: " + hashlib.sha256(rom_data).hexdigest())
        return False

    return True

def main():
    # ...
    variant = "NTSC" if not args.pal else "PAL"
    if not rom_valid(rom_data, variant):
        expected_crc32, expected_sha256 = ROM_CHECKSUMS[variant]
        print(f"Invalid ROM. Ensure it's unheadered and the {variant} version:\n"
              "Expected size: 3145728 (3 MB)\n"
              f"Expected CRC32: {expected_crc32:X}\n"
              "Expected SHA256:", expected_sha256,
              file=sys.stderr)
        sys.exit(1) 
    # ...

    if not args.check:
        dump_rom(rom_data, args.output, args.pal)


if __name__ == "__main__":
    main()
