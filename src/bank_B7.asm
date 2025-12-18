
; Enemy graphics

org $B78000


;;; $8000: Tiles - enemy $EC3F (Mother Brain brain) ;;;
Tiles_MotherBrainHead:
incbin "../data/Tiles_MotherBrainHead.bin" ; $1000 bytes


;;; $9000: Tiles - Mother Brain's legs ;;;
Tiles_MotherBrainLegs:
incbin "../data/Tiles_MotherBrainLegs.bin" ; $1000 bytes


;;; $A000: Tiles - Mother Brain - bomb shells, death beam, unused graphics ;;;
Tiles_MotherBrain_BombShells_DeathBeam_UnusedGFX:
incbin "../data/Tiles_MotherBrain_BombShells_DeathBeam_UnusedGFX.bin" ; $800 bytes


;;; $A800: Tiles - enemy $ED3F (torizo corpse) ;;;
Tiles_CorpseTorizo:
incbin "../data/Tiles_CorpseTorizo.bin" ; $1800 bytes


;;; $C000: Tiles - enemy $ED7F (sidehopper corpse / zoomer corpse / ripper corpse / skree corpse) ;;;
Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree:
incbin "../data/Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree.bin" ; $E00 bytes


;;; $CE00: Tiles - Mother Brain's corpse ;;;
Tiles_CorpseMotherBrain:
incbin "../data/Tiles_CorpseMotherBrain.bin" ; $E00 bytes


;;; $DA00: Tiles - escape timer text ;;;
Tiles_EscapeTimerText:
Tiles_EscapeTimerText_0:
if !PAL == 0
incbin "../data/Tiles_EscapeTimerText_0.bin" ; $200 bytes
else
incbin "../data/Tiles_EscapeTimerText_0_PAL.bin" ; $1C0 bytes
endif

Tiles_EscapeTimerText_1:
if !PAL == 0
incbin "../data/Tiles_EscapeTimerText_1.bin" ; $200 bytes
else
incbin "../data/Tiles_EscapeTimerText_1_PAL.bin" ; $200 bytes
endif

Tiles_EscapeTimerText_2:
if !PAL == 0
incbin "../data/Tiles_EscapeTimerText_2.bin" ; $200 bytes
else
incbin "../data/Tiles_EscapeTimerText_2_PAL.bin" ; $200 bytes
endif

Tiles_EscapeTimerText_3:
if !PAL == 0
incbin "../data/Tiles_EscapeTimerText_3.bin" ; $200 bytes
else
incbin "../data/Tiles_EscapeTimerText_3_PAL.bin" ; $200 bytes
endif

Tiles_EscapeTimerText_4:
if !PAL == 0
incbin "../data/Tiles_EscapeTimerText_4.bin" ; $100 bytes
else
incbin "../data/Tiles_EscapeTimerText_4_PAL.bin" ; $200 bytes
endif

if !PAL != 0
Tiles_EscapeTimerText_5:
incbin "../data/Tiles_EscapeTimerText_5_PAL.bin" ; $200 bytes
endif

Tiles_EscapeTimerText_end:


;;; $E300: Tiles - enemy $F293 (Botwoon) ;;;
Tiles_Botwoon:
incbin "../data/Tiles_Botwoon.bin" ; $1800 bytes


;;; $FB00: Tiles - enemy $F153 (unused spinning turtle eye) ;;;
UNUSED_Tiles_SpinningTurtleEye_B7FB00:
incbin "../data/UNUSED_Tiles_SpinningTurtleEye_B7FB00.bin" ; $200 bytes


Freespace_BankB7_FD00:                                                   ;B7FD00;
; $300 bytes
