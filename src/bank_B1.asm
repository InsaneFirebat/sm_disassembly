
; Enemy graphics

org $B18000


;;; $8000: Tiles - enemy $D5FF/$D83F (up/down mover platform / suspensor platform) ;;;
Tiles_Kamer:
incbin "../data/Tiles_Kamer.bin" ; $400 bytes


;;; $8400: Tiles - enemy $ECBF/$EEBF (Shitroid) ;;;
Tiles_BabyMetroid:
incbin "../data/Tiles_BabyMetroid.bin" ; $C00 bytes


;;; $9000: Tiles - enemy $F07F (Shaktool) ;;;
Tiles_Shaktool:
incbin "../data/Tiles_Shaktool.bin" ; $400 bytes


;;; $9400: Tiles - enemy $E63F (evir) ;;;
Tiles_Evir:
incbin "../data/Tiles_Evir.bin" ; $600 bytes


;;; $9A00: Tiles - enemy $E6BF (morph ball eye) ;;;
Tiles_Eye:
incbin "../data/Tiles_Eye.bin" ; $400 bytes


;;; $9E00: Tiles - enemy $E6FF/$E73F (fune / namihe) ;;;
Tiles_Fune_Namihe:
incbin "../data/Tiles_Fune_Namihe.bin" ; $800 bytes


;;; $A600: Tiles - enemy $E77F (coven) ;;;
Tiles_Coven:
incbin "../data/Tiles_Coven.bin" ; $400 bytes


;;; $AA00: Tiles - enemy $E7BF (yapping maw) ;;;
Tiles_YappingMaw:
incbin "../data/Tiles_YappingMaw.bin" ; $400 bytes


;;; $AE00: Tiles - enemy $E7FF (kago) ;;;
Tiles_Kago:
incbin "../data/Tiles_Kago.bin" ; $800 bytes


;;; $B600: Tiles - enemy $D77F (sciser) ;;;
Tiles_Sciser:
incbin "../data/Tiles_Sciser.bin" ; $400 bytes


;;; $BA00: Tiles - enemy $EA7F (blue Brinstar face block) ;;;
Tiles_FaceBlock:
incbin "../data/Tiles_FaceBlock.bin" ; $200 bytes


;;; $BC00: Tiles - enemy $E83F (magdollite) ;;;
Tiles_Magdollite:
incbin "../data/Tiles_Magdollite.bin" ; $600 bytes


;;; $C200: Tiles - enemy $E87F (beetom) ;;;
Tiles_Beetom:
incbin "../data/Tiles_Beetom.bin" ; $600 bytes


;;; $C800: Tiles - enemy $D7BF (zero) ;;;
Tiles_Zero:
incbin "../data/Tiles_Zero.bin" ; $400 bytes


;;; $CC00: Tiles - enemy $E8BF (powamp) ;;;
Tiles_Powamp:
incbin "../data/Tiles_Powamp.bin" ; $400 bytes


;;; $D000: Tiles - enemy $E8FF/$E93F (work robot) ;;;
Tiles_Robot:
incbin "../data/Tiles_Robot.bin" ; $C00 bytes


;;; $DC00: Tiles - enemy $E97F (bull) ;;;
Tiles_Bull:
incbin "../data/Tiles_Bull.bin" ; $600 bytes


;;; $E200: Tiles - enemy $E9BF (alcoon) ;;;
Tiles_Alcoon:
incbin "../data/Tiles_Alcoon.bin" ; $800 bytes


;;; $EA00: Tiles - enemy $EA3F (Wrecked Ship spark) ;;;
Tiles_Spark:
incbin "../data/Tiles_Spark.bin" ; $200 bytes


;;; $EC00: Tiles - enemy $EAFF/$EB7F/$EBFF/$EABF/$EB3F/$EBBF (ki-hunter) ;;;
Tiles_Kihunter:
incbin "../data/Tiles_Kihunter.bin" ; $1000 bytes


;;; $FC00: Tiles - enemy $E9FF (atomic) ;;;
Tiles_Atomic:
incbin "../data/Tiles_Atomic.bin" ; $400 bytes
