
org $B08000


;;; $8000: Debug. Tiles - palette viewer ;;;
Tiles_Debug_PaletteViewer:
incbin "../data/Tiles_Debug_PaletteViewer.bin" ; $1000 bytes


if !FEATURE_KEEP_UNREFERENCED
;;; $9000: Unused. Tiles - solid colour ;;;
UNUSED_Tiles_SolidColor_B09000:
; Unknown bits-per-pixel
incbin "../data/UNUSED_Tiles_SolidColor_B09000.bin" ; $400 bytes
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $9400: Tiles - enemy $E13F (Ridley) ;;;
Tiles_Ridley_0:
incbin "../data/Tiles_Ridley_0.bin" ; $440 bytes

Tiles_Ridley_1:
incbin "../data/Tiles_Ridley_1.bin" ; $200 bytes

Tiles_Ridley_2:
incbin "../data/Tiles_Ridley_2.bin" ; $F40 bytes

Tiles_Ridley_3:
incbin "../data/Tiles_Ridley_3.bin" ; $200 bytes

Tiles_Ridley_4:
incbin "../data/Tiles_Ridley_4.bin" ; $880 bytes


;;; $B400: Tiles - enemy $E1BF (Ridley explosion) ;;;
Tiles_RidleyExplosion:
incbin "../data/Tiles_RidleyExplosion.bin" ; $400 bytes


;;; $B800: Tiles - Ridley's ribs and claws ;;;
; Rib tiles used for breathing animation
; Claw tiles used for Samus grabbing animation
Tiles_RidleysRibsAndClaws_0:
incbin "../data/Tiles_RidleysRibsAndClaws_0.bin" ; $40 bytes

Tiles_RidleysRibsAndClaws_1:
incbin "../data/Tiles_RidleysRibsAndClaws_1.bin" ; $40 bytes

Tiles_RidleysRibsAndClaws_2:
incbin "../data/Tiles_RidleysRibsAndClaws_2.bin" ; $80 bytes

Tiles_RidleysRibsAndClaws_3:
incbin "../data/Tiles_RidleysRibsAndClaws_3.bin" ; $40 bytes

Tiles_RidleysRibsAndClaws_4:
incbin "../data/Tiles_RidleysRibsAndClaws_4.bin" ; $40 bytes

Tiles_RidleysRibsAndClaws_5:
incbin "../data/Tiles_RidleysRibsAndClaws_5.bin" ; $80 bytes


;;; $BA00: Tiles - enemy $E23F (Ceres door) ;;;
Tiles_CeresDoor_0:
incbin "../data/Tiles_CeresDoor_0.bin" ; $200 bytes

Tiles_CeresDoor_1:
incbin "../data/Tiles_CeresDoor_1.bin" ; $200 bytes

Tiles_CeresDoor_2:
incbin "../data/Tiles_CeresDoor_2.bin" ; $200 bytes


;;; $C000: Tiles - escape timer numbers ;;;
Tiles_EscapeTimer_0:
incbin "../data/Tiles_EscapeTimer_0.bin" ; $200 bytes

Tiles_EscapeTimer_1:
incbin "../data/Tiles_EscapeTimer_1.bin" ; $200 bytes


;;; $C400: Tiles - Ceres door - elevator room ;;;
Tiles_CeresElevatorRoomDoor:
; Sprite tiles used for level design during mode 7 in the elevator room
; Loaded to VRAM $7000 when Ceres door parameter 1 = 2
incbin "../data/Tiles_CeresElevatorRoomDoor.bin" ; $400 bytes


;;; $C800: Tiles - enemy $DE7F (Draygon) ;;;
Tiles_Draygon:
incbin "../data/Tiles_Draygon.bin" ; $2000 bytes


;;; $E800: Tiles - enemy $EC7F (Mother Brain body) ;;;
Tiles_MotherBrainBody:
incbin "../data/Tiles_MotherBrainBody.bin" ; $600 bytes


Freespace_BankB0_EE00:
; $1200 bytes
