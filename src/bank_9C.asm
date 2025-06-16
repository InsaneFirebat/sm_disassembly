
org $9C8000


;;; $8000: Samus top tiles - set Ah - entry 0 ;;;
SamusTiles_Top_SetA_Entry0:
; 1Dh: Facing right - morph ball - no springball - on ground - frame 0
; 1Eh: Moving right - morph ball - no springball - on ground - frame 0
; 1Fh: Moving left  - morph ball - no springball - on ground - frame 7
; 31h: Facing right - morph ball - no springball - in air - frame 0
; 32h: Facing left  - morph ball - no springball - in air - frame 0
; 3Fh: Unused - frame 0
; 40h: Unused - frame 0
; 41h: Facing left  - morph ball - no springball - on ground - frame 7
; 79h: Facing right - morph ball - spring ball - on ground - frame 0
; 7Ah: Facing left  - morph ball - spring ball - on ground - frame 7
; 7Bh: Moving right - morph ball - spring ball - on ground - frame 0
; 7Ch: Moving left  - morph ball - spring ball - on ground - frame 7
; 7Dh: Facing right - morph ball - spring ball - falling - frame 0
; 7Eh: Facing left  - morph ball - spring ball - falling - frame 7
; 7Fh: Facing right - morph ball - spring ball - in air - frame 0
; 80h: Facing left  - morph ball - spring ball - in air - frame 7
; C5h: Unused - frame 7
; D7h: Facing right - crystal flash ending - frame 0
; DFh: Unused. Related to Draygon - frame 7
; E8h: Facing right - Samus drained - crouching/falling - frame 0
incbin "../data/SamusTiles_Top_SetA_Entry0.bin" ; $A0 bytes


;;; $80A0: Samus top tiles - set Ah - entry 1 ;;;
SamusTiles_Top_SetA_Entry1:
; 1Dh: Facing right - morph ball - no springball - on ground - frame 2
; 1Eh: Moving right - morph ball - no springball - on ground - frame 2
; 1Fh: Moving left  - morph ball - no springball - on ground - frame 5
; 31h: Facing right - morph ball - no springball - in air - frame 2
; 32h: Facing left  - morph ball - no springball - in air - frame 2
; 3Fh: Unused - frame 2
; 40h: Unused - frame 2
; 41h: Facing left  - morph ball - no springball - on ground - frame 5
; 79h: Facing right - morph ball - spring ball - on ground - frame 2
; 7Ah: Facing left  - morph ball - spring ball - on ground - frame 5
; 7Bh: Moving right - morph ball - spring ball - on ground - frame 2
; 7Ch: Moving left  - morph ball - spring ball - on ground - frame 5
; 7Dh: Facing right - morph ball - spring ball - falling - frame 2
; 7Eh: Facing left  - morph ball - spring ball - falling - frame 5
; 7Fh: Facing right - morph ball - spring ball - in air - frame 2
; 80h: Facing left  - morph ball - spring ball - in air - frame 5
; C5h: Unused - frame 5
; DFh: Unused. Related to Draygon - frame 5
incbin "../data/SamusTiles_Top_SetA_Entry1.bin" ; $A0 bytes


;;; $8140: Samus top tiles - set Ah - entry 2 ;;;
SamusTiles_Top_SetA_Entry2:
; 1Dh: Facing right - morph ball - no springball - on ground - frame 4
; 1Eh: Moving right - morph ball - no springball - on ground - frame 4
; 1Fh: Moving left  - morph ball - no springball - on ground - frame 3
; 31h: Facing right - morph ball - no springball - in air - frame 4
; 32h: Facing left  - morph ball - no springball - in air - frame 4
; 3Fh: Unused - frame 4
; 40h: Unused - frame 4
; 41h: Facing left  - morph ball - no springball - on ground - frame 3
; 79h: Facing right - morph ball - spring ball - on ground - frame 4
; 7Ah: Facing left  - morph ball - spring ball - on ground - frame 3
; 7Bh: Moving right - morph ball - spring ball - on ground - frame 4
; 7Ch: Moving left  - morph ball - spring ball - on ground - frame 3
; 7Dh: Facing right - morph ball - spring ball - falling - frame 4
; 7Eh: Facing left  - morph ball - spring ball - falling - frame 3
; 7Fh: Facing right - morph ball - spring ball - in air - frame 4
; 80h: Facing left  - morph ball - spring ball - in air - frame 3
; C5h: Unused - frame 3
; DFh: Unused. Related to Draygon - frame 3
incbin "../data/SamusTiles_Top_SetA_Entry2.bin" ; $A0 bytes


;;; $81E0: Samus top tiles - set Ah - entry 3 ;;;
SamusTiles_Top_SetA_Entry3:
; 1Dh: Facing right - morph ball - no springball - on ground - frame 6
; 1Eh: Moving right - morph ball - no springball - on ground - frame 6
; 1Fh: Moving left  - morph ball - no springball - on ground - frame 1
; 31h: Facing right - morph ball - no springball - in air - frame 6
; 32h: Facing left  - morph ball - no springball - in air - frame 6
; 3Fh: Unused - frame 6
; 40h: Unused - frame 6
; 41h: Facing left  - morph ball - no springball - on ground - frame 1
; 79h: Facing right - morph ball - spring ball - on ground - frame 6
; 7Ah: Facing left  - morph ball - spring ball - on ground - frame 1
; 7Bh: Moving right - morph ball - spring ball - on ground - frame 6
; 7Ch: Moving left  - morph ball - spring ball - on ground - frame 1
; 7Dh: Facing right - morph ball - spring ball - falling - frame 6
; 7Eh: Facing left  - morph ball - spring ball - falling - frame 1
; 7Fh: Facing right - morph ball - spring ball - in air - frame 6
; 80h: Facing left  - morph ball - spring ball - in air - frame 1
; C5h: Unused - frame 1
; DFh: Unused. Related to Draygon - frame 1
incbin "../data/SamusTiles_Top_SetA_Entry3.bin" ; $A0 bytes


;;; $8280: Samus top tiles - set Ah - entry 4 ;;;
SamusTiles_Top_SetA_Entry4:
; 1Dh: Facing right - morph ball - no springball - on ground - frame 1
; 1Eh: Moving right - morph ball - no springball - on ground - frame 1
; 1Fh: Moving left  - morph ball - no springball - on ground - frame 6
; 31h: Facing right - morph ball - no springball - in air - frame 1
; 32h: Facing left  - morph ball - no springball - in air - frame 1
; 3Fh: Unused - frame 1
; 40h: Unused - frame 1
; 41h: Facing left  - morph ball - no springball - on ground - frame 6
; 79h: Facing right - morph ball - spring ball - on ground - frame 1
; 7Ah: Facing left  - morph ball - spring ball - on ground - frame 6
; 7Bh: Moving right - morph ball - spring ball - on ground - frame 1
; 7Ch: Moving left  - morph ball - spring ball - on ground - frame 6
; 7Dh: Facing right - morph ball - spring ball - falling - frame 1
; 7Eh: Facing left  - morph ball - spring ball - falling - frame 6
; 7Fh: Facing right - morph ball - spring ball - in air - frame 1
; 80h: Facing left  - morph ball - spring ball - in air - frame 6
; C5h: Unused - frame 6
; DFh: Unused. Related to Draygon - frame 6
incbin "../data/SamusTiles_Top_SetA_Entry4.bin" ; $A0 bytes


;;; $8320: Samus top tiles - set Ah - entry 5 ;;;
SamusTiles_Top_SetA_Entry5:
; 1Dh: Facing right - morph ball - no springball - on ground - frame 3
; 1Eh: Moving right - morph ball - no springball - on ground - frame 3
; 1Fh: Moving left  - morph ball - no springball - on ground - frame 4
; 31h: Facing right - morph ball - no springball - in air - frame 3
; 32h: Facing left  - morph ball - no springball - in air - frame 3
; 3Fh: Unused - frame 3
; 40h: Unused - frame 3
; 41h: Facing left  - morph ball - no springball - on ground - frame 4
; 79h: Facing right - morph ball - spring ball - on ground - frame 3
; 7Ah: Facing left  - morph ball - spring ball - on ground - frame 4
; 7Bh: Moving right - morph ball - spring ball - on ground - frame 3
; 7Ch: Moving left  - morph ball - spring ball - on ground - frame 4
; 7Dh: Facing right - morph ball - spring ball - falling - frame 3
; 7Eh: Facing left  - morph ball - spring ball - falling - frame 4
; 7Fh: Facing right - morph ball - spring ball - in air - frame 3
; 80h: Facing left  - morph ball - spring ball - in air - frame 4
; C5h: Unused - frame 4
; DFh: Unused. Related to Draygon - frame 4
incbin "../data/SamusTiles_Top_SetA_Entry5.bin" ; $A0 bytes


;;; $83C0: Samus top tiles - set Ah - entry 6 ;;;
SamusTiles_Top_SetA_Entry6:
; 1Dh: Facing right - morph ball - no springball - on ground - frame 5
; 1Eh: Moving right - morph ball - no springball - on ground - frame 5
; 1Fh: Moving left  - morph ball - no springball - on ground - frame 2
; 31h: Facing right - morph ball - no springball - in air - frame 5
; 32h: Facing left  - morph ball - no springball - in air - frame 5
; 3Fh: Unused - frame 5
; 40h: Unused - frame 5
; 41h: Facing left  - morph ball - no springball - on ground - frame 2
; 79h: Facing right - morph ball - spring ball - on ground - frame 5
; 7Ah: Facing left  - morph ball - spring ball - on ground - frame 2
; 7Bh: Moving right - morph ball - spring ball - on ground - frame 5
; 7Ch: Moving left  - morph ball - spring ball - on ground - frame 2
; 7Dh: Facing right - morph ball - spring ball - falling - frame 5
; 7Eh: Facing left  - morph ball - spring ball - falling - frame 2
; 7Fh: Facing right - morph ball - spring ball - in air - frame 5
; 80h: Facing left  - morph ball - spring ball - in air - frame 2
; C5h: Unused - frame 2
; DFh: Unused. Related to Draygon - frame 2
incbin "../data/SamusTiles_Top_SetA_Entry6.bin" ; $A0 bytes


;;; $8460: Samus top tiles - set Ah - entry 7 ;;;
SamusTiles_Top_SetA_Entry7:
; 1Dh: Facing right - morph ball - no springball - on ground - frame 7
; 1Eh: Moving right - morph ball - no springball - on ground - frame 7
; 1Fh: Moving left  - morph ball - no springball - on ground - frame 0
; 31h: Facing right - morph ball - no springball - in air - frame 7
; 32h: Facing left  - morph ball - no springball - in air - frame 7
; 3Fh: Unused - frame 7
; 40h: Unused - frame 7
; 41h: Facing left  - morph ball - no springball - on ground - frame 0
; 79h: Facing right - morph ball - spring ball - on ground - frame 7
; 7Ah: Facing left  - morph ball - spring ball - on ground - frame 0
; 7Bh: Moving right - morph ball - spring ball - on ground - frame 7
; 7Ch: Moving left  - morph ball - spring ball - on ground - frame 0
; 7Dh: Facing right - morph ball - spring ball - falling - frame 7
; 7Eh: Facing left  - morph ball - spring ball - falling - frame 0
; 7Fh: Facing right - morph ball - spring ball - in air - frame 7
; 80h: Facing left  - morph ball - spring ball - in air - frame 0
; C5h: Unused - frame 0
; DFh: Unused. Related to Draygon - frame 0
incbin "../data/SamusTiles_Top_SetA_Entry7.bin" ; $A0 bytes


;;; $8500: Samus top tiles - set Ah - entry 8 ;;;
SamusTiles_Top_SetA_Entry8:
; 19h: Facing right - spin jump - frame 1
; 1Ah: Facing left  - spin jump - frame 1
; 20h: Unused - frame 1
; 21h: Unused - frame 1
; 22h: Unused - frame 1
; 23h: Unused - frame 1
; 24h: Unused - frame 1
; 33h: Unused - frame 1
; 34h: Unused - frame 1
; 39h: Unused - frame 1
; 3Ah: Unused - frame 1
; 42h: Unused - frame 1
; 83h: Facing right - wall jump - frame 3
; 84h: Facing left  - wall jump - frame 3
incbin "../data/SamusTiles_Top_SetA_Entry8.bin" ; $100 bytes


;;; $8600: Samus top tiles - set Ah - entry 9 ;;;
SamusTiles_Top_SetA_Entry9:
; 19h: Facing right - spin jump - frame 2
; 1Ah: Facing left  - spin jump - frame 2
; 20h: Unused - frame 2
; 21h: Unused - frame 2
; 22h: Unused - frame 2
; 23h: Unused - frame 2
; 24h: Unused - frame 2
; 33h: Unused - frame 2
; 34h: Unused - frame 2
; 39h: Unused - frame 2
; 3Ah: Unused - frame 2
; 42h: Unused - frame 2
; 4Fh: Facing left  - damage boost - frame 8
; 50h: Facing right - damage boost - frame 8
; 83h: Facing right - wall jump - frame 4
; 84h: Facing left  - wall jump - frame 4
incbin "../data/SamusTiles_Top_SetA_Entry9.bin" ; $200 bytes


;;; $8800: Samus top tiles - set Ah - entry Ah ;;;
SamusTiles_Top_SetA_EntryA:
; 19h: Facing right - spin jump - frame 3
; 1Ah: Facing left  - spin jump - frame 3
; 20h: Unused - frame 3
; 21h: Unused - frame 3
; 22h: Unused - frame 3
; 23h: Unused - frame 3
; 24h: Unused - frame 3
; 33h: Unused - frame 3
; 34h: Unused - frame 3
; 39h: Unused - frame 3
; 3Ah: Unused - frame 3
; 42h: Unused - frame 3
; 4Fh: Facing left  - damage boost - frame 7
; 50h: Facing right - damage boost - frame 7
; 83h: Facing right - wall jump - frame 5
; 84h: Facing left  - wall jump - frame 5
incbin "../data/SamusTiles_Top_SetA_EntryA.bin" ; $100 bytes


;;; $8900: Samus top tiles - set Ah - entry Bh ;;;
SamusTiles_Top_SetA_EntryB:
; 19h: Facing right - spin jump - frame 4
; 1Ah: Facing left  - spin jump - frame 4
; 20h: Unused - frame 4
; 21h: Unused - frame 4
; 22h: Unused - frame 4
; 23h: Unused - frame 4
; 24h: Unused - frame 4
; 33h: Unused - frame 4
; 34h: Unused - frame 4
; 39h: Unused - frame 4
; 3Ah: Unused - frame 4
; 42h: Unused - frame 4
; 4Fh: Facing left  - damage boost - frame 6
; 50h: Facing right - damage boost - frame 6
; 83h: Facing right - wall jump - frame 6
; 84h: Facing left  - wall jump - frame 6
incbin "../data/SamusTiles_Top_SetA_EntryB.bin" ; $200 bytes


;;; $8B00: Samus top tiles - set Ah - entry Ch ;;;
SamusTiles_Top_SetA_EntryC:
; 19h: Facing right - spin jump - frame 5
; 1Ah: Facing left  - spin jump - frame 5
; 20h: Unused - frame 5
; 21h: Unused - frame 5
; 22h: Unused - frame 5
; 23h: Unused - frame 5
; 24h: Unused - frame 5
; 33h: Unused - frame 5
; 34h: Unused - frame 5
; 39h: Unused - frame 5
; 3Ah: Unused - frame 5
; 42h: Unused - frame 5
; 4Fh: Facing left  - damage boost - frame 5
; 50h: Facing right - damage boost - frame 5
; 83h: Facing right - wall jump - frame 7
; 84h: Facing left  - wall jump - frame 7
incbin "../data/SamusTiles_Top_SetA_EntryC.bin" ; $100 bytes


;;; $8C00: Samus top tiles - set Ah - entry Dh ;;;
SamusTiles_Top_SetA_EntryD:
; 19h: Facing right - spin jump - frame 6
; 1Ah: Facing left  - spin jump - frame 6
; 20h: Unused - frame 6
; 21h: Unused - frame 6
; 22h: Unused - frame 6
; 23h: Unused - frame 6
; 24h: Unused - frame 6
; 33h: Unused - frame 6
; 34h: Unused - frame 6
; 39h: Unused - frame 6
; 3Ah: Unused - frame 6
; 42h: Unused - frame 6
; 4Fh: Facing left  - damage boost - frame 4
; 50h: Facing right - damage boost - frame 4
; 83h: Facing right - wall jump - frame 8
; 84h: Facing left  - wall jump - frame 8
incbin "../data/SamusTiles_Top_SetA_EntryD.bin" ; $200 bytes


;;; $8E00: Samus top tiles - set Ah - entry Eh ;;;
SamusTiles_Top_SetA_EntryE:
; 19h: Facing right - spin jump - frame 7
; 1Ah: Facing left  - spin jump - frame 7
; 20h: Unused - frame 7
; 21h: Unused - frame 7
; 22h: Unused - frame 7
; 23h: Unused - frame 7
; 24h: Unused - frame 7
; 33h: Unused - frame 7
; 34h: Unused - frame 7
; 39h: Unused - frame 7
; 3Ah: Unused - frame 7
; 42h: Unused - frame 7
; 4Fh: Facing left  - damage boost - frame 3
; 50h: Facing right - damage boost - frame 3
; 83h: Facing right - wall jump - frame 9
; 84h: Facing left  - wall jump - frame 9
incbin "../data/SamusTiles_Top_SetA_EntryE.bin" ; $100 bytes


;;; $8F00: Samus top tiles - set Ah - entry Fh ;;;
SamusTiles_Top_SetA_EntryF:
; 19h: Facing right - spin jump - frame 8
; 1Ah: Facing left  - spin jump - frame 8
; 20h: Unused - frame 8
; 21h: Unused - frame 8
; 22h: Unused - frame 8
; 23h: Unused - frame 8
; 24h: Unused - frame 8
; 33h: Unused - frame 8
; 34h: Unused - frame 8
; 39h: Unused - frame 8
; 3Ah: Unused - frame 8
; 42h: Unused - frame 8
; 4Fh: Facing left  - damage boost - frame 2
; 50h: Facing right - damage boost - frame 2
; 83h: Facing right - wall jump - frame Ah
; 84h: Facing left  - wall jump - frame Ah
incbin "../data/SamusTiles_Top_SetA_EntryF.bin" ; $200 bytes


;;; $9100: Samus top tiles - set Ah - entry 10h ;;;
SamusTiles_Top_SetA_Entry10:
; 65h: Unused. Related to movement type Dh - frame 1
; 66h: Unused. Related to movement type Dh - frame 1
; 81h: Facing right - screw attack - frames 1..3
; 82h: Facing left  - screw attack - frames 1..3
; 83h: Facing right - wall jump - frames 17h..19h
; 84h: Facing left  - wall jump - frames 17h..19h
incbin "../data/SamusTiles_Top_SetA_Entry10.bin" ; $140 bytes


;;; $9240: Samus top tiles - set Ah - entry 11h ;;;
SamusTiles_Top_SetA_Entry11:
; 65h: Unused. Related to movement type Dh - frame 2
; 66h: Unused. Related to movement type Dh - frame 2
; 81h: Facing right - screw attack - frames 7..9
; 82h: Facing left  - screw attack - frames 7..9
; 83h: Facing right - wall jump - frames 1Dh..1Fh
; 84h: Facing left  - wall jump - frames 1Dh..1Fh
incbin "../data/SamusTiles_Top_SetA_Entry11.bin" ; $160 bytes


;;; $93A0: Samus top tiles - set Ah - entry 12h ;;;
SamusTiles_Top_SetA_Entry12:
; 65h: Unused. Related to movement type Dh - frame 3
; 66h: Unused. Related to movement type Dh - frame 3
; 81h: Facing right - screw attack - frames Dh..Fh
; 82h: Facing left  - screw attack - frames Dh..Fh
; 83h: Facing right - wall jump - frames 23h..25h
; 84h: Facing left  - wall jump - frames 23h..25h
incbin "../data/SamusTiles_Top_SetA_Entry12.bin" ; $160 bytes


;;; $9500: Samus top tiles - set Ah - entry 13h ;;;
SamusTiles_Top_SetA_Entry13:
; 65h: Unused. Related to movement type Dh - frame 4
; 66h: Unused. Related to movement type Dh - frame 4
; 81h: Facing right - screw attack - frames 13h..15h
; 82h: Facing left  - screw attack - frames 13h..15h
; 83h: Facing right - wall jump - frames 29h..2Bh
; 84h: Facing left  - wall jump - frames 29h..2Bh
incbin "../data/SamusTiles_Top_SetA_Entry13.bin" ; $100 bytes


;;; $9600: Samus top tiles - set Ah - entry 14h ;;;
SamusTiles_Top_SetA_Entry14:
; 1Bh: Facing right - space jump - frames 1..8
; 1Ch: Facing left  - space jump - frames 1..8
; 65h: Unused. Related to movement type Dh - frame 5
; 66h: Unused. Related to movement type Dh - frame 5
; 81h: Facing right - screw attack - frames 4..6
; 81h: Facing right - screw attack - frames Ah..Ch
; 81h: Facing right - screw attack - frames 10h..12h
; 81h: Facing right - screw attack - frames 16h..18h
; 82h: Facing left  - screw attack - frames 4..6
; 82h: Facing left  - screw attack - frames Ah..Ch
; 82h: Facing left  - screw attack - frames 10h..12h
; 82h: Facing left  - screw attack - frames 16h..18h
; 83h: Facing right - wall jump - frames Dh..14h
; 83h: Facing right - wall jump - frames 1Ah..1Ch
; 83h: Facing right - wall jump - frames 20h..22h
; 83h: Facing right - wall jump - frames 26h..28h
; 83h: Facing right - wall jump - frames 2Ch..2Eh
; 84h: Facing left  - wall jump - frames Dh..14h
; 84h: Facing left  - wall jump - frames 1Ah..1Ch
; 84h: Facing left  - wall jump - frames 20h..22h
; 84h: Facing left  - wall jump - frames 26h..28h
; 84h: Facing left  - wall jump - frames 2Ch..2Eh
incbin "../data/SamusTiles_Top_SetA_Entry14.bin" ; $20 bytes


;;; $9620: Samus top tiles - set Bh - entry 0 ;;;
SamusTiles_Top_SetB_Entry0:
; Unused
incbin "../data/SamusTiles_Top_SetB_Entry0.bin" ; $20 bytes


;;; $9640: Samus top tiles - set Bh - entry 1 ;;;
SamusTiles_Top_SetB_Entry1:
; 1Dh: Facing right - morph ball - no springball - on ground - frame 9
; 1Eh: Moving right - morph ball - no springball - on ground - frame 9
; 1Fh: Moving left  - morph ball - no springball - on ground - frame 9
; 31h: Facing right - morph ball - no springball - in air - frame 9
; 32h: Facing left  - morph ball - no springball - in air - frame 9
; 3Fh: Unused - frame 9
; 40h: Unused - frame 9
; 41h: Facing left  - morph ball - no springball - on ground - frame 9
; 79h: Facing right - morph ball - spring ball - on ground - frame 9
; 7Ah: Facing left  - morph ball - spring ball - on ground - frame 9
; 7Bh: Moving right - morph ball - spring ball - on ground - frame 9
; 7Ch: Moving left  - morph ball - spring ball - on ground - frame 9
; 7Dh: Facing right - morph ball - spring ball - falling - frame 9
; 7Eh: Facing left  - morph ball - spring ball - falling - frame 9
; 7Fh: Facing right - morph ball - spring ball - in air - frame 9
; 80h: Facing left  - morph ball - spring ball - in air - frame 9
; C5h: Unused - frame 9
; DFh: Unused. Related to Draygon - frame 9
incbin "../data/SamusTiles_Top_SetB_Entry1.bin" ; $A0 bytes


;;; $96E0: Samus top tiles - set Bh - entry 2 ;;;
SamusTiles_Top_SetB_Entry2:
; Unused
incbin "../data/SamusTiles_Top_SetB_Entry2.bin" ; $A0 bytes


;;; $9780: Samus top tiles - set Bh - entry 3 ;;;
SamusTiles_Top_SetB_Entry3:
; 38h: Facing left  - morphing transition - frame 1
; 3Eh: Facing left  - unmorphing transition - frame 0
; D4h: Facing left  - crystal flash - frame 0
; D8h: Facing left  - crystal flash ending - frame 1
; DCh: Unused - frame 2
; DEh: Unused - frame 0
; E9h: Facing left  - Samus drained - crouching/falling - frame 0
incbin "../data/SamusTiles_Top_SetB_Entry3.bin" ; $C0 bytes


;;; $9840: Samus top tiles - set Bh - entry 4 ;;;
SamusTiles_Top_SetB_Entry4:
; 38h: Facing left  - morphing transition - frame 0
; 3Eh: Facing left  - unmorphing transition - frame 1
; D4h: Facing left  - crystal flash - frame 1
; D4h: Facing left  - crystal flash - frame 3
; D4h: Facing left  - crystal flash - frames Ch..Dh
; D8h: Facing left  - crystal flash ending - frame 2
; DCh: Unused - frame 1
; DEh: Unused - frame 1
; E9h: Facing left  - Samus drained - crouching/falling - frame 1
incbin "../data/SamusTiles_Top_SetB_Entry4.bin" ; $100 bytes


;;; $9940: Samus top tiles - set Bh - entry 5 ;;;
SamusTiles_Top_SetB_Entry5:
; 37h: Facing right - morphing transition - frame 1
; 3Dh: Facing right - unmorphing transition - frame 0
; D3h: Facing right - crystal flash - frame 0
; D7h: Facing right - crystal flash ending - frame 1
; DBh: Unused - frame 2
; DDh: Unused - frame 0
; E8h: Facing right - Samus drained - crouching/falling - frame 1
incbin "../data/SamusTiles_Top_SetB_Entry5.bin" ; $C0 bytes


;;; $9A00: Samus top tiles - set Bh - entry 6 ;;;
SamusTiles_Top_SetB_Entry6:
; 37h: Facing right - morphing transition - frame 0
; 3Dh: Facing right - unmorphing transition - frame 1
; D3h: Facing right - crystal flash - frame 1
; D3h: Facing right - crystal flash - frame 3
; D3h: Facing right - crystal flash - frames Ch..Dh
; D7h: Facing right - crystal flash ending - frame 2
; DBh: Unused - frame 1
; DDh: Unused - frame 1
; E8h: Facing right - Samus drained - crouching/falling - frame 2
incbin "../data/SamusTiles_Top_SetB_Entry6.bin" ; $100 bytes


;;; $9B00: Samus top tiles - set 3 - entry 0 ;;;
SamusTiles_Top_Set3_Entry0:
; 5Dh: Unused - frame 18h
; 5Dh: Unused - frame 38h
; 5Eh: Unused - frame 18h
; 5Eh: Unused - frame 38h
; 5Fh: Unused - frame 18h
; 5Fh: Unused - frame 38h
; 60h: Unused - frame 18h
; 60h: Unused - frame 38h
; 61h: Unused - frame 18h
; 61h: Unused - frame 38h
; B2h: Facing clockwise     - grapple swinging - frame 18h
; B2h: Facing clockwise     - grapple swinging - frame 38h
incbin "../data/SamusTiles_Top_Set3_Entry0.bin" ; $140 bytes


;;; $9C40: Samus top tiles - set 3 - entry 1 ;;;
SamusTiles_Top_Set3_Entry1:
; 5Dh: Unused - frame 17h
; 5Dh: Unused - frame 37h
; 5Eh: Unused - frame 17h
; 5Eh: Unused - frame 37h
; 5Fh: Unused - frame 17h
; 5Fh: Unused - frame 37h
; 60h: Unused - frame 17h
; 60h: Unused - frame 37h
; 61h: Unused - frame 17h
; 61h: Unused - frame 37h
; B2h: Facing clockwise     - grapple swinging - frame 17h
; B2h: Facing clockwise     - grapple swinging - frame 37h
incbin "../data/SamusTiles_Top_Set3_Entry1.bin" ; $140 bytes


;;; $9D80: Samus top tiles - set 3 - entry 2 ;;;
SamusTiles_Top_Set3_Entry2:
; 5Dh: Unused - frame 16h
; 5Dh: Unused - frame 36h
; 5Eh: Unused - frame 16h
; 5Eh: Unused - frame 36h
; 5Fh: Unused - frame 16h
; 5Fh: Unused - frame 36h
; 60h: Unused - frame 16h
; 60h: Unused - frame 36h
; 61h: Unused - frame 16h
; 61h: Unused - frame 36h
; B2h: Facing clockwise     - grapple swinging - frame 16h
; B2h: Facing clockwise     - grapple swinging - frame 36h
incbin "../data/SamusTiles_Top_Set3_Entry2.bin" ; $180 bytes


;;; $9F00: Samus top tiles - set 3 - entry 3 ;;;
SamusTiles_Top_Set3_Entry3:
; 5Dh: Unused - frame 15h
; 5Dh: Unused - frame 35h
; 5Eh: Unused - frame 15h
; 5Eh: Unused - frame 35h
; 5Fh: Unused - frame 15h
; 5Fh: Unused - frame 35h
; 60h: Unused - frame 15h
; 60h: Unused - frame 35h
; 61h: Unused - frame 15h
; 61h: Unused - frame 35h
; B2h: Facing clockwise     - grapple swinging - frame 15h
; B2h: Facing clockwise     - grapple swinging - frame 35h
incbin "../data/SamusTiles_Top_Set3_Entry3.bin" ; $180 bytes


;;; $A080: Samus top tiles - set 3 - entry 4 ;;;
SamusTiles_Top_Set3_Entry4:
; 5Dh: Unused - frame 14h
; 5Dh: Unused - frame 34h
; 5Eh: Unused - frame 14h
; 5Eh: Unused - frame 34h
; 5Fh: Unused - frame 14h
; 5Fh: Unused - frame 34h
; 60h: Unused - frame 14h
; 60h: Unused - frame 34h
; 61h: Unused - frame 14h
; 61h: Unused - frame 34h
; B2h: Facing clockwise     - grapple swinging - frame 14h
; B2h: Facing clockwise     - grapple swinging - frame 34h
incbin "../data/SamusTiles_Top_Set3_Entry4.bin" ; $180 bytes


;;; $A200: Samus top tiles - set 3 - entry 5 ;;;
SamusTiles_Top_Set3_Entry5:
; 5Dh: Unused - frame 13h
; 5Dh: Unused - frame 33h
; 5Eh: Unused - frame 13h
; 5Eh: Unused - frame 33h
; 5Fh: Unused - frame 13h
; 5Fh: Unused - frame 33h
; 60h: Unused - frame 13h
; 60h: Unused - frame 33h
; 61h: Unused - frame 13h
; 61h: Unused - frame 33h
; B2h: Facing clockwise     - grapple swinging - frame 13h
; B2h: Facing clockwise     - grapple swinging - frame 33h
incbin "../data/SamusTiles_Top_Set3_Entry5.bin" ; $180 bytes


;;; $A380: Samus top tiles - set 3 - entry 6 ;;;
SamusTiles_Top_Set3_Entry6:
; 5Dh: Unused - frame 12h
; 5Dh: Unused - frame 32h
; 5Eh: Unused - frame 12h
; 5Eh: Unused - frame 32h
; 5Fh: Unused - frame 12h
; 5Fh: Unused - frame 32h
; 60h: Unused - frame 12h
; 60h: Unused - frame 32h
; 61h: Unused - frame 12h
; 61h: Unused - frame 32h
; B2h: Facing clockwise     - grapple swinging - frame 12h
; B2h: Facing clockwise     - grapple swinging - frame 32h
incbin "../data/SamusTiles_Top_Set3_Entry6.bin" ; $180 bytes


;;; $A500: Samus top tiles - set 3 - entry 7 ;;;
SamusTiles_Top_Set3_Entry7:
; 5Dh: Unused - frame 11h
; 5Dh: Unused - frame 31h
; 5Eh: Unused - frame 11h
; 5Eh: Unused - frame 31h
; 5Fh: Unused - frame 11h
; 5Fh: Unused - frame 31h
; 60h: Unused - frame 11h
; 60h: Unused - frame 31h
; 61h: Unused - frame 11h
; 61h: Unused - frame 31h
; B2h: Facing clockwise     - grapple swinging - frame 11h
; B2h: Facing clockwise     - grapple swinging - frame 31h
incbin "../data/SamusTiles_Top_Set3_Entry7.bin" ; $140 bytes


;;; $A640: Samus top tiles - set 3 - entry 8 ;;;
SamusTiles_Top_Set3_Entry8:
; 5Dh: Unused - frame 10h
; 5Dh: Unused - frame 30h
; 5Dh: Unused - frames 40h..41h
; 5Eh: Unused - frame 10h
; 5Eh: Unused - frame 30h
; 5Eh: Unused - frames 40h..41h
; 5Fh: Unused - frame 10h
; 5Fh: Unused - frame 30h
; 5Fh: Unused - frames 40h..41h
; 60h: Unused - frame 10h
; 60h: Unused - frame 30h
; 60h: Unused - frames 40h..41h
; 61h: Unused - frame 10h
; 61h: Unused - frame 30h
; 61h: Unused - frames 40h..41h
; B2h: Facing clockwise     - grapple swinging - frame 10h
; B2h: Facing clockwise     - grapple swinging - frame 30h
; B2h: Facing clockwise     - grapple swinging - frames 40h..41h
incbin "../data/SamusTiles_Top_Set3_Entry8.bin" ; $140 bytes


;;; $A780: Samus top tiles - set 3 - entry 9 ;;;
SamusTiles_Top_Set3_Entry9:
; 5Dh: Unused - frame Fh
; 5Dh: Unused - frame 2Fh
; 5Eh: Unused - frame Fh
; 5Eh: Unused - frame 2Fh
; 5Fh: Unused - frame Fh
; 5Fh: Unused - frame 2Fh
; 60h: Unused - frame Fh
; 60h: Unused - frame 2Fh
; 61h: Unused - frame Fh
; 61h: Unused - frame 2Fh
; B2h: Facing clockwise     - grapple swinging - frame Fh
; B2h: Facing clockwise     - grapple swinging - frame 2Fh
incbin "../data/SamusTiles_Top_Set3_Entry9.bin" ; $140 bytes


;;; $A8C0: Samus top tiles - set 3 - entry Ah ;;;
SamusTiles_Top_Set3_EntryA:
; 5Dh: Unused - frame Eh
; 5Dh: Unused - frame 2Eh
; 5Eh: Unused - frame Eh
; 5Eh: Unused - frame 2Eh
; 5Fh: Unused - frame Eh
; 5Fh: Unused - frame 2Eh
; 60h: Unused - frame Eh
; 60h: Unused - frame 2Eh
; 61h: Unused - frame Eh
; 61h: Unused - frame 2Eh
; B2h: Facing clockwise     - grapple swinging - frame Eh
; B2h: Facing clockwise     - grapple swinging - frame 2Eh
incbin "../data/SamusTiles_Top_Set3_EntryA.bin" ; $180 bytes


;;; $AA40: Samus top tiles - set 3 - entry Bh ;;;
SamusTiles_Top_Set3_EntryB:
; 5Dh: Unused - frame Dh
; 5Dh: Unused - frame 2Dh
; 5Eh: Unused - frame Dh
; 5Eh: Unused - frame 2Dh
; 5Fh: Unused - frame Dh
; 5Fh: Unused - frame 2Dh
; 60h: Unused - frame Dh
; 60h: Unused - frame 2Dh
; 61h: Unused - frame Dh
; 61h: Unused - frame 2Dh
; B2h: Facing clockwise     - grapple swinging - frame Dh
; B2h: Facing clockwise     - grapple swinging - frame 2Dh
incbin "../data/SamusTiles_Top_Set3_EntryB.bin" ; $180 bytes


;;; $ABC0: Samus top tiles - set 3 - entry Ch ;;;
SamusTiles_Top_Set3_EntryC:
; 5Dh: Unused - frame Ch
; 5Dh: Unused - frame 2Ch
; 5Eh: Unused - frame Ch
; 5Eh: Unused - frame 2Ch
; 5Fh: Unused - frame Ch
; 5Fh: Unused - frame 2Ch
; 60h: Unused - frame Ch
; 60h: Unused - frame 2Ch
; 61h: Unused - frame Ch
; 61h: Unused - frame 2Ch
; B2h: Facing clockwise     - grapple swinging - frame Ch
; B2h: Facing clockwise     - grapple swinging - frame 2Ch
incbin "../data/SamusTiles_Top_Set3_EntryC.bin" ; $180 bytes


;;; $AD40: Samus top tiles - set 3 - entry Dh ;;;
SamusTiles_Top_Set3_EntryD:
; 5Dh: Unused - frame Bh
; 5Dh: Unused - frame 2Bh
; 5Eh: Unused - frame Bh
; 5Eh: Unused - frame 2Bh
; 5Fh: Unused - frame Bh
; 5Fh: Unused - frame 2Bh
; 60h: Unused - frame Bh
; 60h: Unused - frame 2Bh
; 61h: Unused - frame Bh
; 61h: Unused - frame 2Bh
; B2h: Facing clockwise     - grapple swinging - frame Bh
; B2h: Facing clockwise     - grapple swinging - frame 2Bh
incbin "../data/SamusTiles_Top_Set3_EntryD.bin" ; $180 bytes


;;; $AEC0: Samus top tiles - set 3 - entry Eh ;;;
SamusTiles_Top_Set3_EntryE:
; 5Dh: Unused - frame Ah
; 5Dh: Unused - frame 2Ah
; 5Eh: Unused - frame Ah
; 5Eh: Unused - frame 2Ah
; 5Fh: Unused - frame Ah
; 5Fh: Unused - frame 2Ah
; 60h: Unused - frame Ah
; 60h: Unused - frame 2Ah
; 61h: Unused - frame Ah
; 61h: Unused - frame 2Ah
; B2h: Facing clockwise     - grapple swinging - frame Ah
; B2h: Facing clockwise     - grapple swinging - frame 2Ah
incbin "../data/SamusTiles_Top_Set3_EntryE.bin" ; $180 bytes


;;; $B040: Samus top tiles - set 3 - entry Fh ;;;
SamusTiles_Top_Set3_EntryF:
; 5Dh: Unused - frame 9
; 5Dh: Unused - frame 29h
; 5Eh: Unused - frame 9
; 5Eh: Unused - frame 29h
; 5Fh: Unused - frame 9
; 5Fh: Unused - frame 29h
; 60h: Unused - frame 9
; 60h: Unused - frame 29h
; 61h: Unused - frame 9
; 61h: Unused - frame 29h
; B2h: Facing clockwise     - grapple swinging - frame 9
; B2h: Facing clockwise     - grapple swinging - frame 29h
incbin "../data/SamusTiles_Top_Set3_EntryF.bin" ; $140 bytes


;;; $B180: Samus top tiles - set 3 - entry 10h ;;;
SamusTiles_Top_Set3_Entry10:
; Unused
incbin "../data/SamusTiles_Top_Set3_Entry10.bin" ; $140 bytes


;;; $B2C0..D2BF: Samus top tiles - set 4 (facing anticlockwise - grappling - in air - upside up) ;;;
SamusTiles_Top_Set4_Entry0:
; 62h: Unused - frame 8
; 62h: Unused - frame 28h
; B3h: Facing anticlockwise - grapple swinging - frame 8
; B3h: Facing anticlockwise - grapple swinging - frame 28h
incbin "../data/SamusTiles_Top_Set4_Entry0.bin" ; $1C0 bytes


;;; $B480: Samus top tiles - set 4 - entry 1 ;;;
SamusTiles_Top_Set4_Entry1:
; 62h: Unused - frame 9
; 62h: Unused - frame 29h
; B3h: Facing anticlockwise - grapple swinging - frame 9
; B3h: Facing anticlockwise - grapple swinging - frame 29h
incbin "../data/SamusTiles_Top_Set4_Entry1.bin" ; $140 bytes


;;; $B640: Samus top tiles - set 4 - entry 2 ;;;
SamusTiles_Top_Set4_Entry2:
; 62h: Unused - frame Ah
; 62h: Unused - frame 2Ah
; B3h: Facing anticlockwise - grapple swinging - frame Ah
; B3h: Facing anticlockwise - grapple swinging - frame 2Ah
incbin "../data/SamusTiles_Top_Set4_Entry2.bin" ; $180 bytes


;;; $B840: Samus top tiles - set 4 - entry 3 ;;;
SamusTiles_Top_Set4_Entry3:
; 62h: Unused - frame Bh
; 62h: Unused - frame 2Bh
; B3h: Facing anticlockwise - grapple swinging - frame Bh
; B3h: Facing anticlockwise - grapple swinging - frame 2Bh
incbin "../data/SamusTiles_Top_Set4_Entry3.bin" ; $200 bytes


;;; $BA40: Samus top tiles - set 4 - entry 4 ;;;
SamusTiles_Top_Set4_Entry4:
; 62h: Unused - frame Ch
; 62h: Unused - frame 2Ch
; B3h: Facing anticlockwise - grapple swinging - frame Ch
; B3h: Facing anticlockwise - grapple swinging - frame 2Ch
incbin "../data/SamusTiles_Top_Set4_Entry4.bin" ; $1E0 bytes


;;; $BC20: Samus top tiles - set 4 - entry 5 ;;;
SamusTiles_Top_Set4_Entry5:
; 62h: Unused - frame Dh
; 62h: Unused - frame 2Dh
; B3h: Facing anticlockwise - grapple swinging - frame Dh
; B3h: Facing anticlockwise - grapple swinging - frame 2Dh
incbin "../data/SamusTiles_Top_Set4_Entry5.bin" ; $1E0 bytes


;;; $BE00: Samus top tiles - set 4 - entry 6 ;;;
SamusTiles_Top_Set4_Entry6:
; 62h: Unused - frame Eh
; 62h: Unused - frame 2Eh
; B3h: Facing anticlockwise - grapple swinging - frame Eh
; B3h: Facing anticlockwise - grapple swinging - frame 2Eh
incbin "../data/SamusTiles_Top_Set4_Entry6.bin" ; $1E0 bytes


;;; $BFE0: Samus top tiles - set 4 - entry 7 ;;;
SamusTiles_Top_Set4_Entry7:
; 62h: Unused - frame Fh
; 62h: Unused - frame 2Fh
; B3h: Facing anticlockwise - grapple swinging - frame Fh
; B3h: Facing anticlockwise - grapple swinging - frame 2Fh
incbin "../data/SamusTiles_Top_Set4_Entry7.bin" ; $1C0 bytes


;;; $C1A0: Samus top tiles - set 4 - entry 8 ;;;
SamusTiles_Top_Set4_Entry8:
; 62h: Unused - frame 10h
; 62h: Unused - frame 30h
; 62h: Unused - frames 40h..41h
; B3h: Facing anticlockwise - grapple swinging - frame 10h
; B3h: Facing anticlockwise - grapple swinging - frame 30h
; B3h: Facing anticlockwise - grapple swinging - frames 40h..41h
incbin "../data/SamusTiles_Top_Set4_Entry8.bin" ; $1C0 bytes


;;; $C360: Samus top tiles - set 4 - entry 9 ;;;
SamusTiles_Top_Set4_Entry9:
; 62h: Unused - frame 11h
; 62h: Unused - frame 31h
; B3h: Facing anticlockwise - grapple swinging - frame 11h
; B3h: Facing anticlockwise - grapple swinging - frame 31h
incbin "../data/SamusTiles_Top_Set4_Entry9.bin" ; $1C0 bytes


;;; $C520: Samus top tiles - set 4 - entry Ah ;;;
SamusTiles_Top_Set4_EntryA:
; 62h: Unused - frame 12h
; 62h: Unused - frame 32h
; B3h: Facing anticlockwise - grapple swinging - frame 12h
; B3h: Facing anticlockwise - grapple swinging - frame 32h
incbin "../data/SamusTiles_Top_Set4_EntryA.bin" ; $1E0 bytes


;;; $C700: Samus top tiles - set 4 - entry Bh ;;;
SamusTiles_Top_Set4_EntryB:
; 62h: Unused - frame 13h
; 62h: Unused - frame 33h
; B3h: Facing anticlockwise - grapple swinging - frame 13h
; B3h: Facing anticlockwise - grapple swinging - frame 33h
incbin "../data/SamusTiles_Top_Set4_EntryB.bin" ; $200 bytes


;;; $C900: Samus top tiles - set 4 - entry Ch ;;;
SamusTiles_Top_Set4_EntryC:
; 62h: Unused - frame 14h
; 62h: Unused - frame 34h
; B3h: Facing anticlockwise - grapple swinging - frame 14h
; B3h: Facing anticlockwise - grapple swinging - frame 34h
incbin "../data/SamusTiles_Top_Set4_EntryC.bin" ; $200 bytes


;;; $CB00: Samus top tiles - set 4 - entry Dh ;;;
SamusTiles_Top_Set4_EntryD:
; 62h: Unused - frame 15h
; 62h: Unused - frame 35h
; B3h: Facing anticlockwise - grapple swinging - frame 15h
; B3h: Facing anticlockwise - grapple swinging - frame 35h
incbin "../data/SamusTiles_Top_Set4_EntryD.bin" ; $200 bytes


;;; $CD00: Samus top tiles - set 4 - entry Eh ;;;
SamusTiles_Top_Set4_EntryE:
; 62h: Unused - frame 16h
; 62h: Unused - frame 36h
; B3h: Facing anticlockwise - grapple swinging - frame 16h
; B3h: Facing anticlockwise - grapple swinging - frame 36h
incbin "../data/SamusTiles_Top_Set4_EntryE.bin" ; $200 bytes


;;; $CF00: Samus top tiles - set 4 - entry Fh ;;;
SamusTiles_Top_Set4_EntryF:
; 62h: Unused - frame 17h
; 62h: Unused - frame 37h
; B3h: Facing anticlockwise - grapple swinging - frame 17h
; B3h: Facing anticlockwise - grapple swinging - frame 37h
incbin "../data/SamusTiles_Top_Set4_EntryF.bin" ; $200 bytes


;;; $D0E0: Samus top tiles - set 4 - entry 10h ;;;
SamusTiles_Top_Set4_Entry10:
; Unused
incbin "../data/SamusTiles_Top_Set4_Entry10.bin" ; $1E0 bytes


;;; $D2C0: Samus top tiles - set 7 - entry 0 ;;;
SamusTiles_Top_Set7_Entry0:
; E9h: Facing left  - Samus drained - crouching/falling - frame 8
; E9h: Facing left  - Samus drained - crouching/falling - frame 1Ah
; E9h: Facing left  - Samus drained - crouching/falling - frame 1Dh
incbin "../data/SamusTiles_Top_Set7_Entry0.bin" ; $120 bytes


;;; $D3E0: Samus top tiles - set 7 - entry 1 ;;;
SamusTiles_Top_Set7_Entry1:
; E9h: Facing left  - Samus drained - crouching/falling - frame 7
; E9h: Facing left  - Samus drained - crouching/falling - frame 9
; E9h: Facing left  - Samus drained - crouching/falling - frame Bh
; E9h: Facing left  - Samus drained - crouching/falling - frame Eh
; E9h: Facing left  - Samus drained - crouching/falling - frame 13h
; E9h: Facing left  - Samus drained - crouching/falling - frame 17h
incbin "../data/SamusTiles_Top_Set7_Entry1.bin" ; $120 bytes


;;; $D500: Samus top tiles - set 7 - entry 2 ;;;
SamusTiles_Top_Set7_Entry2:
; E9h: Facing left  - Samus drained - crouching/falling - frame Ah
incbin "../data/SamusTiles_Top_Set7_Entry2.bin" ; $120 bytes


;;; $D620: Samus top tiles - set 7 - entry 3 ;;;
SamusTiles_Top_Set7_Entry3:
; E8h: Facing right - Samus drained - crouching/falling - frame 8
incbin "../data/SamusTiles_Top_Set7_Entry3.bin" ; $140 bytes


;;; $D760: Samus top tiles - set 7 - entry 4 ;;;
SamusTiles_Top_Set7_Entry4:
; E8h: Facing right - Samus drained - crouching/falling - frame 9
; E8h: Facing right - Samus drained - crouching/falling - frame Bh
incbin "../data/SamusTiles_Top_Set7_Entry4.bin" ; $140 bytes


;;; $D8A0: Samus top tiles - set 7 - entry 5 ;;;
SamusTiles_Top_Set7_Entry5:
; E8h: Facing right - Samus drained - crouching/falling - frame Ah
incbin "../data/SamusTiles_Top_Set7_Entry5.bin" ; $140 bytes


;;; $D9E0: Samus top tiles - set 7 - entry 6 ;;;
SamusTiles_Top_Set7_Entry6:
; EBh: Facing left  - Samus drained - standing - frame 0
incbin "../data/SamusTiles_Top_Set7_Entry6.bin" ; $120 bytes


;;; $DB00: Samus top tiles - set 7 - entry 7 ;;;
SamusTiles_Top_Set7_Entry7:
; E9h: Facing left  - Samus drained - crouching/falling - frame Fh
; E9h: Facing left  - Samus drained - crouching/falling - frame 14h
; E9h: Facing left  - Samus drained - crouching/falling - frame 16h
; EBh: Facing left  - Samus drained - standing - frame 1
; EBh: Facing left  - Samus drained - standing - frame 3
incbin "../data/SamusTiles_Top_Set7_Entry7.bin" ; $120 bytes


;;; $DC20: Samus top tiles - set 7 - entry 8 ;;;
SamusTiles_Top_Set7_Entry8:
; EBh: Facing left  - Samus drained - standing - frame 2
incbin "../data/SamusTiles_Top_Set7_Entry8.bin" ; $120 bytes


;;; $DD40: Samus top tiles - set 7 - entry 9 ;;;
SamusTiles_Top_Set7_Entry9:
; EAh: Facing right - Samus drained - standing - frame 0
incbin "../data/SamusTiles_Top_Set7_Entry9.bin" ; $140 bytes


;;; $DE80: Samus top tiles - set 7 - entry Ah ;;;
SamusTiles_Top_Set7_EntryA:
; EAh: Facing right - Samus drained - standing - frame 1
; EAh: Facing right - Samus drained - standing - frame 3
incbin "../data/SamusTiles_Top_Set7_EntryA.bin" ; $140 bytes


;;; $DFC0: Samus top tiles - set 7 - entry Bh ;;;
SamusTiles_Top_Set7_EntryB:
; EAh: Facing right - Samus drained - standing - frame 2
incbin "../data/SamusTiles_Top_Set7_EntryB.bin" ; $140 bytes


;;; $E100: Samus top tiles - set 7 - entry Ch ;;;
SamusTiles_Top_Set7_EntryC:
; 1: Facing right - normal - frame 0
; 1: Facing right - normal - frame 5
; 27h: Facing right - crouching - frame 0
; 27h: Facing right - crouching - frame 5
; 47h: Unused - frame 0
; 47h: Unused - frame 5
; 89h: Facing right - ran into a wall - frame 0
; 89h: Facing right - ran into a wall - frame 5
; A8h: Facing right - grappling - frame 0
; A8h: Facing right - grappling - frame 5
; B4h: Facing right - grappling - crouching - frame 0
; B4h: Facing right - grappling - crouching - frame 5
incbin "../data/SamusTiles_Top_Set7_EntryC.bin" ; $140 bytes


;;; $E240: Samus top tiles - set 7 - entry Dh ;;;
SamusTiles_Top_Set7_EntryD:
; 1: Facing right - normal - frame 1
; 1: Facing right - normal - frame 3
; 1: Facing right - normal - frame 6
; 1: Facing right - normal - frame 8
; 27h: Facing right - crouching - frame 1
; 27h: Facing right - crouching - frame 3
; 27h: Facing right - crouching - frame 6
; 27h: Facing right - crouching - frame 8
; 47h: Unused - frame 1
; 47h: Unused - frame 3
; 47h: Unused - frame 6
; 47h: Unused - frame 8
; 89h: Facing right - ran into a wall - frame 1
; 89h: Facing right - ran into a wall - frame 3
; 89h: Facing right - ran into a wall - frame 6
; 89h: Facing right - ran into a wall - frame 8
; A8h: Facing right - grappling - frame 1
; A8h: Facing right - grappling - frame 3
; A8h: Facing right - grappling - frame 6
; A8h: Facing right - grappling - frame 8
; B4h: Facing right - grappling - crouching - frame 1
; B4h: Facing right - grappling - crouching - frame 3
; B4h: Facing right - grappling - crouching - frame 6
; B4h: Facing right - grappling - crouching - frame 8
incbin "../data/SamusTiles_Top_Set7_EntryD.bin" ; $140 bytes


;;; $E380: Samus top tiles - set 7 - entry Eh ;;;
SamusTiles_Top_Set7_EntryE:
; 1: Facing right - normal - frame 2
; 27h: Facing right - crouching - frame 2
; 47h: Unused - frame 2
; 89h: Facing right - ran into a wall - frame 2
; A8h: Facing right - grappling - frame 2
; B4h: Facing right - grappling - crouching - frame 2
incbin "../data/SamusTiles_Top_Set7_EntryE.bin" ; $140 bytes


;;; $E4C0: Samus top tiles - set 7 - entry Fh ;;;
SamusTiles_Top_Set7_EntryF:
; 2: Facing left  - normal - frame 0
; 2: Facing left  - normal - frame 5
; 28h: Facing left  - crouching - frame 0
; 28h: Facing left  - crouching - frame 5
; 48h: Unused - frame 0
; 48h: Unused - frame 5
; 8Ah: Facing left  - ran into a wall - frame 0
; 8Ah: Facing left  - ran into a wall - frame 5
; A9h: Facing left  - grappling - frame 0
; A9h: Facing left  - grappling - frame 5
; B5h: Facing left  - grappling - crouching - frame 0
; B5h: Facing left  - grappling - crouching - frame 5
incbin "../data/SamusTiles_Top_Set7_EntryF.bin" ; $140 bytes


;;; $E600: Samus top tiles - set 7 - entry 10h ;;;
SamusTiles_Top_Set7_Entry10:
; 2: Facing left  - normal - frame 1
; 2: Facing left  - normal - frame 3
; 2: Facing left  - normal - frame 6
; 2: Facing left  - normal - frame 8
; 28h: Facing left  - crouching - frame 1
; 28h: Facing left  - crouching - frame 3
; 28h: Facing left  - crouching - frame 6
; 28h: Facing left  - crouching - frame 8
; 48h: Unused - frame 1
; 48h: Unused - frame 3
; 48h: Unused - frame 6
; 48h: Unused - frame 8
; 8Ah: Facing left  - ran into a wall - frame 1
; 8Ah: Facing left  - ran into a wall - frame 3
; 8Ah: Facing left  - ran into a wall - frame 6
; 8Ah: Facing left  - ran into a wall - frame 8
; A9h: Facing left  - grappling - frame 1
; A9h: Facing left  - grappling - frame 3
; A9h: Facing left  - grappling - frame 6
; A9h: Facing left  - grappling - frame 8
; B5h: Facing left  - grappling - crouching - frame 1
; B5h: Facing left  - grappling - crouching - frame 3
; B5h: Facing left  - grappling - crouching - frame 6
; B5h: Facing left  - grappling - crouching - frame 8
incbin "../data/SamusTiles_Top_Set7_Entry10.bin" ; $140 bytes


;;; $E740: Samus top tiles - set 7 - entry 11h ;;;
SamusTiles_Top_Set7_Entry11:
; 2: Facing left  - normal - frame 2
; 28h: Facing left  - crouching - frame 2
; 48h: Unused - frame 2
; 8Ah: Facing left  - ran into a wall - frame 2
; A9h: Facing left  - grappling - frame 2
; B5h: Facing left  - grappling - crouching - frame 2
incbin "../data/SamusTiles_Top_Set7_Entry11.bin" ; $140 bytes


;;; $E880: Samus top tiles - set 7 - entry 12h ;;;
SamusTiles_Top_Set7_Entry12:
; 1: Facing right - normal - frame 7
; 27h: Facing right - crouching - frame 7
; 47h: Unused - frame 7
; 89h: Facing right - ran into a wall - frame 7
; A8h: Facing right - grappling - frame 7
; B4h: Facing right - grappling - crouching - frame 7
incbin "../data/SamusTiles_Top_Set7_Entry12.bin" ; $100 bytes


;;; $E980: Samus top tiles - set 7 - entry 13h ;;;
SamusTiles_Top_Set7_Entry13:
; 2: Facing left  - normal - frame 7
; 28h: Facing left  - crouching - frame 7
; 48h: Unused - frame 7
; 8Ah: Facing left  - ran into a wall - frame 7
; A9h: Facing left  - grappling - frame 7
; B5h: Facing left  - grappling - crouching - frame 7
incbin "../data/SamusTiles_Top_Set7_Entry13.bin" ; $100 bytes


;;; $EA80: Samus bottom tiles - set 9 - entry 0 ;;;
SamusTiles_Bottom_Set9_Entry0:
; 1Bh: Facing right - space jump - frame 1
; 1Ch: Facing left  - space jump - frame 1
; 81h: Facing right - screw attack - frame 1
; 81h: Facing right - screw attack - frame 9
; 81h: Facing right - screw attack - frame 11h
; 82h: Facing left  - screw attack - frame 1
; 82h: Facing left  - screw attack - frame 9
; 82h: Facing left  - screw attack - frame 11h
; 83h: Facing right - wall jump - frame Dh
; 83h: Facing right - wall jump - frame 17h
; 83h: Facing right - wall jump - frame 1Fh
; 83h: Facing right - wall jump - frame 27h
; 84h: Facing left  - wall jump - frame Dh
; 84h: Facing left  - wall jump - frame 17h
; 84h: Facing left  - wall jump - frame 1Fh
; 84h: Facing left  - wall jump - frame 27h
incbin "../data/SamusTiles_Bottom_Set9_Entry0.bin" ; $200 bytes


;;; $EC80: Samus bottom tiles - set 9 - entry 1 ;;;
SamusTiles_Bottom_Set9_Entry1:
; 1Bh: Facing right - space jump - frame 2
; 1Ch: Facing left  - space jump - frame 2
; 81h: Facing right - screw attack - frame 2
; 81h: Facing right - screw attack - frame Ah
; 81h: Facing right - screw attack - frame 12h
; 82h: Facing left  - screw attack - frame 2
; 82h: Facing left  - screw attack - frame Ah
; 82h: Facing left  - screw attack - frame 12h
; 83h: Facing right - wall jump - frame Eh
; 83h: Facing right - wall jump - frame 18h
; 83h: Facing right - wall jump - frame 20h
; 83h: Facing right - wall jump - frame 28h
; 84h: Facing left  - wall jump - frame Eh
; 84h: Facing left  - wall jump - frame 18h
; 84h: Facing left  - wall jump - frame 20h
; 84h: Facing left  - wall jump - frame 28h
incbin "../data/SamusTiles_Bottom_Set9_Entry1.bin" ; $200 bytes


;;; $EE80: Samus bottom tiles - set 9 - entry 2 ;;;
SamusTiles_Bottom_Set9_Entry2:
; 1Bh: Facing right - space jump - frame 3
; 1Ch: Facing left  - space jump - frame 3
; 81h: Facing right - screw attack - frame 3
; 81h: Facing right - screw attack - frame Bh
; 81h: Facing right - screw attack - frame 13h
; 82h: Facing left  - screw attack - frame 3
; 82h: Facing left  - screw attack - frame Bh
; 82h: Facing left  - screw attack - frame 13h
; 83h: Facing right - wall jump - frame Fh
; 83h: Facing right - wall jump - frame 19h
; 83h: Facing right - wall jump - frame 21h
; 83h: Facing right - wall jump - frame 29h
; 84h: Facing left  - wall jump - frame Fh
; 84h: Facing left  - wall jump - frame 19h
; 84h: Facing left  - wall jump - frame 21h
; 84h: Facing left  - wall jump - frame 29h
incbin "../data/SamusTiles_Bottom_Set9_Entry2.bin" ; $200 bytes


;;; $F080: Samus bottom tiles - set 9 - entry 3 ;;;
SamusTiles_Bottom_Set9_Entry3:
; 1Bh: Facing right - space jump - frame 4
; 1Ch: Facing left  - space jump - frame 4
; 81h: Facing right - screw attack - frame 4
; 81h: Facing right - screw attack - frame Ch
; 81h: Facing right - screw attack - frame 14h
; 82h: Facing left  - screw attack - frame 4
; 82h: Facing left  - screw attack - frame Ch
; 82h: Facing left  - screw attack - frame 14h
; 83h: Facing right - wall jump - frame 10h
; 83h: Facing right - wall jump - frame 1Ah
; 83h: Facing right - wall jump - frame 22h
; 83h: Facing right - wall jump - frame 2Ah
; 84h: Facing left  - wall jump - frame 10h
; 84h: Facing left  - wall jump - frame 1Ah
; 84h: Facing left  - wall jump - frame 22h
; 84h: Facing left  - wall jump - frame 2Ah
incbin "../data/SamusTiles_Bottom_Set9_Entry3.bin" ; $200 bytes


;;; $F280: Samus bottom tiles - set 9 - entry 4 ;;;
SamusTiles_Bottom_Set9_Entry4:
; 1Bh: Facing right - space jump - frame 5
; 1Ch: Facing left  - space jump - frame 5
; 81h: Facing right - screw attack - frame 5
; 81h: Facing right - screw attack - frame Dh
; 81h: Facing right - screw attack - frame 15h
; 82h: Facing left  - screw attack - frame 5
; 82h: Facing left  - screw attack - frame Dh
; 82h: Facing left  - screw attack - frame 15h
; 83h: Facing right - wall jump - frame 11h
; 83h: Facing right - wall jump - frame 1Bh
; 83h: Facing right - wall jump - frame 23h
; 83h: Facing right - wall jump - frame 2Bh
; 84h: Facing left  - wall jump - frame 11h
; 84h: Facing left  - wall jump - frame 1Bh
; 84h: Facing left  - wall jump - frame 23h
; 84h: Facing left  - wall jump - frame 2Bh
incbin "../data/SamusTiles_Bottom_Set9_Entry4.bin" ; $200 bytes


;;; $F480: Samus bottom tiles - set 9 - entry 5 ;;;
SamusTiles_Bottom_Set9_Entry5:
; 1Bh: Facing right - space jump - frame 6
; 1Ch: Facing left  - space jump - frame 6
; 81h: Facing right - screw attack - frame 6
; 81h: Facing right - screw attack - frame Eh
; 81h: Facing right - screw attack - frame 16h
; 82h: Facing left  - screw attack - frame 6
; 82h: Facing left  - screw attack - frame Eh
; 82h: Facing left  - screw attack - frame 16h
; 83h: Facing right - wall jump - frame 12h
; 83h: Facing right - wall jump - frame 1Ch
; 83h: Facing right - wall jump - frame 24h
; 83h: Facing right - wall jump - frame 2Ch
; 84h: Facing left  - wall jump - frame 12h
; 84h: Facing left  - wall jump - frame 1Ch
; 84h: Facing left  - wall jump - frame 24h
; 84h: Facing left  - wall jump - frame 2Ch
incbin "../data/SamusTiles_Bottom_Set9_Entry5.bin" ; $200 bytes


;;; $F680: Samus bottom tiles - set 9 - entry 6 ;;;
SamusTiles_Bottom_Set9_Entry6:
; 1Bh: Facing right - space jump - frame 7
; 1Ch: Facing left  - space jump - frame 7
; 81h: Facing right - screw attack - frame 7
; 81h: Facing right - screw attack - frame Fh
; 81h: Facing right - screw attack - frame 17h
; 82h: Facing left  - screw attack - frame 7
; 82h: Facing left  - screw attack - frame Fh
; 82h: Facing left  - screw attack - frame 17h
; 83h: Facing right - wall jump - frame 13h
; 83h: Facing right - wall jump - frame 1Dh
; 83h: Facing right - wall jump - frame 25h
; 83h: Facing right - wall jump - frame 2Dh
; 84h: Facing left  - wall jump - frame 13h
; 84h: Facing left  - wall jump - frame 1Dh
; 84h: Facing left  - wall jump - frame 25h
; 84h: Facing left  - wall jump - frame 2Dh
incbin "../data/SamusTiles_Bottom_Set9_Entry6.bin" ; $200 bytes


;;; $F880: Samus bottom tiles - set 9 - entry 7 ;;;
SamusTiles_Bottom_Set9_Entry7:
; 1Bh: Facing right - space jump - frame 8
; 1Ch: Facing left  - space jump - frame 8
; 81h: Facing right - screw attack - frame 8
; 81h: Facing right - screw attack - frame 10h
; 81h: Facing right - screw attack - frame 18h
; 82h: Facing left  - screw attack - frame 8
; 82h: Facing left  - screw attack - frame 10h
; 82h: Facing left  - screw attack - frame 18h
; 83h: Facing right - wall jump - frame 14h
; 83h: Facing right - wall jump - frame 1Eh
; 83h: Facing right - wall jump - frame 26h
; 83h: Facing right - wall jump - frame 2Eh
; 84h: Facing left  - wall jump - frame 14h
; 84h: Facing left  - wall jump - frame 1Eh
; 84h: Facing left  - wall jump - frame 26h
; 84h: Facing left  - wall jump - frame 2Eh
incbin "../data/SamusTiles_Bottom_Set9_Entry7.bin" ; $200 bytes


Freespace_Bank9C_FA80:
; $580 bytes
