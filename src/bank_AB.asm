
org $AB8000


;;; $8000: Tiles - enemy $E0FF (fake Kraid) ;;;
Tiles_MiniKraid:
incbin "../data/Tiles_MiniKraid.bin" ; $1000 bytes


;;; $9000: Tiles - enemy $E07F/$E0BF (fire pillar / fire arc) ;;;
Tiles_Hibashi_Puromi:
incbin "../data/Tiles_Hibashi_Puromi.bin" ; $800 bytes


;;; $9800: Tiles - enemy $E03F/$DFFF (spike platform) ;;;
Tiles_Kzan:
incbin "../data/Tiles_Kzan.bin" ; $400 bytes


;;; $9C00: Tiles - enemy $DFBF (boulder) ;;;
Tiles_Boulder:
incbin "../data/Tiles_Boulder.bin" ; $1000 bytes


;;; $AC00: Tiles - enemy $D93F (sidehopper) ;;;
Tiles_Sidehopper:
incbin "../data/Tiles_Sidehopper.bin" ; $400 bytes


;;; $B000: Tiles - enemy $D97F (desgeega) ;;;
Tiles_Dessgeega:
incbin "../data/Tiles_Dessgeega.bin" ; $400 bytes


;;; $B400: Tiles - enemy $F0BF (n00b tube cracks) ;;;
Tiles_NoobTubeCrack:
incbin "../data/Tiles_NoobTubeCrack.bin" ; $1800 bytes


;;; $CC00: Tiles - enemy $E2BF/$E2FF/$E33F/$E37F/$E3BF/$E3FF/$E43F/$E47F (Kraid) ;;;
Tiles_Kraid:
incbin "../data/Tiles_Kraid.bin" ; $1E00 bytes


;;; $EA00: Tiles - debugger font ;;;
Tiles_DebuggerFont:
incbin "../data/Tiles_DebuggerFont.bin" ; $A00 bytes


;;; $F400: Tiles - Mother Brain exploded escape door particles ;;;
Tiles_MotherBrainExplodedEscapeDoorParticles:
incbin "../data/Tiles_MotherBrainExplodedEscapeDoorParticles.bin" ; $400 bytes


Freespace_BankAB_F800:
; $800 bytes
