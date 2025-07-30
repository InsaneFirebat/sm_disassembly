
; Enemy graphics

org $AF8000


;;; $8000: Tiles - enemy $D37F (oum) ;;;
Tiles_Oum:
incbin "../data/Tiles_Oum.bin" ; $800 bytes


if !FEATURE_KEEP_UNREFERENCED
;;; $8800: Unused. Tiles ;;;
UNUSED_Tiles_Gravy_AF8800:
; Gravy?
incbin "../data/UNUSED_Tiles_Gravy_AF8800.bin" ; $A00 bytes
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $9200: Tiles - enemy $D67F (metaree) ;;;
Tiles_Metaree:
incbin "../data/Tiles_Metaree.bin" ; $600 bytes


;;; $9800: Tiles - enemy $DB3F (bang) ;;;
Tiles_Bang:
incbin "../data/Tiles_Bang.bin" ; $1000 bytes


;;; $A800: Tiles - enemy $D6BF (fireflea) ;;;
Tiles_Fireflea:
incbin "../data/Tiles_Fireflea.bin" ; $600 bytes


;;; $AE00: Tiles - enemy $DBFF (reflec) ;;;
Tiles_Reflec:
incbin "../data/Tiles_Reflec.bin" ; $600 bytes


;;; $B400: Tiles - enemy $DBBF (yard) ;;;
Tiles_Yard:
incbin "../data/Tiles_Yard.bin" ; $800 bytes


;;; $BC00: Tiles - enemy $D6FF (skultera) ;;;
Tiles_Skultera:
incbin "../data/Tiles_Skultera.bin" ; $600 bytes


;;; $C200: Tiles - enemy $EEFF/$EF3F (torizos) ;;;
Tiles_BombTorizo_GoldenTorizo:
incbin "../data/Tiles_BombTorizo_GoldenTorizo.bin" ; $2000 bytes


;;; $E200: Tiles - Golden Torizo egg ;;;
Tiles_GoldenTorizoEgg:
incbin "../data/Tiles_GoldenTorizoEgg.bin" ; $600 bytes


;;; $E800: Tiles - enemy $DA7F (zoa) ;;;
Tiles_Zoa:
incbin "../data/Tiles_Zoa.bin" ; $400 bytes


Freespace_BankAF_EC00:                                                   ;AFEC00;
; $1400 bytes
