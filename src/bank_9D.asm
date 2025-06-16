
org $9D8000


;;; $8000: Samus bottom tiles - set 0 - entry 0 ;;;
SamusTiles_Bottom_Set0_Entry0:
; 9: Moving right - not aiming - frame 0
; Ah: Moving left  - not aiming - frame 0
; Bh: Moving right - gun extended - frame 0
; Ch: Moving left  - gun extended - frame 0
; Dh: Moving right - aiming up (unused) - frame 0
; Eh: Moving left  - aiming up (unused) - frame 0
; Fh: Moving right - aiming up-right - frame 0
; 10h: Moving left  - aiming up-left - frame 0
; 11h: Moving right - aiming down-right - frame 0
; 12h: Moving left  - aiming down-left - frame 0
incbin "../data/SamusTiles_Bottom_Set0_Entry0.bin" ; $100 bytes


;;; $8100: Samus bottom tiles - set 0 - entry 1 ;;;
SamusTiles_Bottom_Set0_Entry1:
; 9: Moving right - not aiming - frame 2
; Ah: Moving left  - not aiming - frame 2
; Bh: Moving right - gun extended - frame 2
; Ch: Moving left  - gun extended - frame 2
; Dh: Moving right - aiming up (unused) - frame 2
; Eh: Moving left  - aiming up (unused) - frame 2
; Fh: Moving right - aiming up-right - frame 2
; 10h: Moving left  - aiming up-left - frame 2
; 11h: Moving right - aiming down-right - frame 2
; 12h: Moving left  - aiming down-left - frame 2
incbin "../data/SamusTiles_Bottom_Set0_Entry1.bin" ; $160 bytes


;;; $8260: Samus bottom tiles - set 0 - entry 2 ;;;
SamusTiles_Bottom_Set0_Entry2:
; 9: Moving right - not aiming - frame 4
; Ah: Moving left  - not aiming - frame 4
; Bh: Moving right - gun extended - frame 4
; Ch: Moving left  - gun extended - frame 4
; Dh: Moving right - aiming up (unused) - frame 4
; Eh: Moving left  - aiming up (unused) - frame 4
; Fh: Moving right - aiming up-right - frame 4
; 10h: Moving left  - aiming up-left - frame 4
; 11h: Moving right - aiming down-right - frame 4
; 12h: Moving left  - aiming down-left - frame 4
incbin "../data/SamusTiles_Bottom_Set0_Entry2.bin" ; $1A0 bytes


;;; $8400: Samus bottom tiles - set 0 - entry 3 ;;;
SamusTiles_Bottom_Set0_Entry3:
; 9: Moving right - not aiming - frame 5
; Ah: Moving left  - not aiming - frame 5
; Bh: Moving right - gun extended - frame 5
; Ch: Moving left  - gun extended - frame 5
; Dh: Moving right - aiming up (unused) - frame 5
; Eh: Moving left  - aiming up (unused) - frame 5
; Fh: Moving right - aiming up-right - frame 5
; 10h: Moving left  - aiming up-left - frame 5
; 11h: Moving right - aiming down-right - frame 5
; 12h: Moving left  - aiming down-left - frame 5
; 4Dh: Facing right - normal jump - not aiming - not moving - gun not extended - frame 0
; 4Eh: Facing left  - normal jump - not aiming - not moving - gun not extended - frame 0
; C7h: Facing right - vertical shinespark windup - frame 0
; C8h: Facing left  - vertical shinespark windup - frame 0
incbin "../data/SamusTiles_Bottom_Set0_Entry3.bin" ; $100 bytes


;;; $8500: Samus bottom tiles - set 0 - entry 4 ;;;
SamusTiles_Bottom_Set0_Entry4:
; 9: Moving right - not aiming - frame 7
; Ah: Moving left  - not aiming - frame 7
; Bh: Moving right - gun extended - frame 7
; Ch: Moving left  - gun extended - frame 7
; Dh: Moving right - aiming up (unused) - frame 7
; Eh: Moving left  - aiming up (unused) - frame 7
; Fh: Moving right - aiming up-right - frame 7
; 10h: Moving left  - aiming up-left - frame 7
; 11h: Moving right - aiming down-right - frame 7
; 12h: Moving left  - aiming down-left - frame 7
incbin "../data/SamusTiles_Bottom_Set0_Entry4.bin" ; $180 bytes


;;; $8680: Samus bottom tiles - set 0 - entry 5 ;;;
SamusTiles_Bottom_Set0_Entry5:
; 9: Moving right - not aiming - frame 9
; Ah: Moving left  - not aiming - frame 9
; Bh: Moving right - gun extended - frame 9
; Ch: Moving left  - gun extended - frame 9
; Dh: Moving right - aiming up (unused) - frame 9
; Eh: Moving left  - aiming up (unused) - frame 9
; Fh: Moving right - aiming up-right - frame 9
; 10h: Moving left  - aiming up-left - frame 9
; 11h: Moving right - aiming down-right - frame 9
; 12h: Moving left  - aiming down-left - frame 9
incbin "../data/SamusTiles_Bottom_Set0_Entry5.bin" ; $1A0 bytes


;;; $8820: Samus bottom tiles - set 0 - entry 6 ;;;
SamusTiles_Bottom_Set0_Entry6:
; 1: Facing right - normal - frame 0
; 1: Facing right - normal - frame 5
; 2: Facing left  - normal - frame 0
; 2: Facing left  - normal - frame 5
; 47h: Unused - frame 0
; 47h: Unused - frame 5
; 48h: Unused - frame 0
; 48h: Unused - frame 5
; 89h: Facing right - ran into a wall - frame 0
; 89h: Facing right - ran into a wall - frame 5
; 8Ah: Facing left  - ran into a wall - frame 0
; 8Ah: Facing left  - ran into a wall - frame 5
; A4h: Facing right - landing from normal jump - frame 1
; A5h: Facing left  - landing from normal jump - frame 1
; A6h: Facing right - landing from spin jump - frame 2
; A7h: Facing left  - landing from spin jump - frame 2
; A8h: Facing right - grappling - frame 0
; A8h: Facing right - grappling - frame 5
; A9h: Facing left  - grappling - frame 0
; A9h: Facing left  - grappling - frame 5
; D5h: Facing right - x-ray - standing - frames 0..4
; D6h: Facing left  - x-ray - standing - frames 0..4
; E0h: Facing right - landing from normal jump - aiming up - frame 1
; E1h: Facing left  - landing from normal jump - aiming up - frame 1
; E2h: Facing right - landing from normal jump - aiming up-right - frame 1
; E3h: Facing left  - landing from normal jump - aiming up-left - frame 1
; E4h: Facing right - landing from normal jump - aiming down-right - frame 1
; E5h: Facing left  - landing from normal jump - aiming down-left - frame 1
; E6h: Facing right - landing from normal jump - firing - frame 1
; E7h: Facing left  - landing from normal jump - firing - frame 1
incbin "../data/SamusTiles_Bottom_Set0_Entry6.bin" ; $180 bytes


;;; $89A0: Samus bottom tiles - set 0 - entry 7 ;;;
SamusTiles_Bottom_Set0_Entry7:
; 27h: Facing right - crouching - frames 0..3
; 27h: Facing right - crouching - frames 5..8
; 28h: Facing left  - crouching - frames 0..3
; 28h: Facing left  - crouching - frames 5..8
; 71h: Facing right - crouching - aiming up-right - frame 0
; 72h: Facing left  - crouching - aiming up-left - frame 0
; 73h: Facing right - crouching - aiming down-right - frame 0
; 74h: Facing left  - crouching - aiming down-left - frame 0
; 85h: Facing right - crouching - aiming up - frames 0..1
; 86h: Facing left  - crouching - aiming up - frames 0..1
; B4h: Facing right - grappling - crouching - frames 0..3
; B4h: Facing right - grappling - crouching - frames 5..8
; B5h: Facing left  - grappling - crouching - frames 0..3
; B5h: Facing left  - grappling - crouching - frames 5..8
; B6h: Facing right - grappling - crouching - aiming down-right - frame 0
; B7h: Facing left  - grappling - crouching - aiming down-left - frame 0
; D9h: Facing right - x-ray - crouching - frames 0..4
; DAh: Facing left  - x-ray - crouching - frames 0..4
incbin "../data/SamusTiles_Bottom_Set0_Entry7.bin" ; $100 bytes


;;; $8AA0: Samus bottom tiles - set 0 - entry 8 ;;;
SamusTiles_Bottom_Set0_Entry8:
; 9: Moving right - not aiming - frame 1
; Ah: Moving left  - not aiming - frame 1
; Bh: Moving right - gun extended - frame 1
; Ch: Moving left  - gun extended - frame 1
; Dh: Moving right - aiming up (unused) - frame 1
; Eh: Moving left  - aiming up (unused) - frame 1
; Fh: Moving right - aiming up-right - frame 1
; 10h: Moving left  - aiming up-left - frame 1
; 11h: Moving right - aiming down-right - frame 1
; 12h: Moving left  - aiming down-left - frame 1
incbin "../data/SamusTiles_Bottom_Set0_Entry8.bin" ; $140 bytes


;;; $8BE0: Samus bottom tiles - set 0 - entry 9 ;;;
SamusTiles_Bottom_Set0_Entry9:
; 9: Moving right - not aiming - frame 3
; Ah: Moving left  - not aiming - frame 3
; Bh: Moving right - gun extended - frame 3
; Ch: Moving left  - gun extended - frame 3
; Dh: Moving right - aiming up (unused) - frame 3
; Eh: Moving left  - aiming up (unused) - frame 3
; Fh: Moving right - aiming up-right - frame 3
; 10h: Moving left  - aiming up-left - frame 3
; 11h: Moving right - aiming down-right - frame 3
; 12h: Moving left  - aiming down-left - frame 3
incbin "../data/SamusTiles_Bottom_Set0_Entry9.bin" ; $180 bytes


;;; $8D60: Samus bottom tiles - set 0 - entry Ah ;;;
SamusTiles_Bottom_Set0_EntryA:
; 9: Moving right - not aiming - frame 6
; Ah: Moving left  - not aiming - frame 6
; Bh: Moving right - gun extended - frame 6
; Ch: Moving left  - gun extended - frame 6
; Dh: Moving right - aiming up (unused) - frame 6
; Eh: Moving left  - aiming up (unused) - frame 6
; Fh: Moving right - aiming up-right - frame 6
; 10h: Moving left  - aiming up-left - frame 6
; 11h: Moving right - aiming down-right - frame 6
; 12h: Moving left  - aiming down-left - frame 6
incbin "../data/SamusTiles_Bottom_Set0_EntryA.bin" ; $140 bytes


;;; $8EA0: Samus bottom tiles - set 0 - entry Bh ;;;
SamusTiles_Bottom_Set0_EntryB:
; 9: Moving right - not aiming - frame 8
; Ah: Moving left  - not aiming - frame 8
; Bh: Moving right - gun extended - frame 8
; Ch: Moving left  - gun extended - frame 8
; Dh: Moving right - aiming up (unused) - frame 8
; Eh: Moving left  - aiming up (unused) - frame 8
; Fh: Moving right - aiming up-right - frame 8
; 10h: Moving left  - aiming up-left - frame 8
; 11h: Moving right - aiming down-right - frame 8
; 12h: Moving left  - aiming down-left - frame 8
incbin "../data/SamusTiles_Bottom_Set0_EntryB.bin" ; $180 bytes


;;; $9020: Samus bottom tiles - set 0 - entry Ch ;;;
SamusTiles_Bottom_Set0_EntryC:
; 0: Facing forward - power suit - frame 0
incbin "../data/SamusTiles_Bottom_Set0_EntryC.bin" ; $1C0 bytes


;;; $91E0: Samus bottom tiles - set 0 - entry Dh ;;;
SamusTiles_Bottom_Set0_EntryD:
; 9Bh: Facing forward - varia/gravity suit - frame 0
incbin "../data/SamusTiles_Bottom_Set0_EntryD.bin" ; $1C0 bytes


;;; $93A0: Samus bottom tiles - set 0 - entry Eh ;;;
SamusTiles_Bottom_Set0_EntryE:
; 1: Facing right - normal - frame 1
; 1: Facing right - normal - frame 3
; 1: Facing right - normal - frame 6
; 1: Facing right - normal - frame 8
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
incbin "../data/SamusTiles_Bottom_Set0_EntryE.bin" ; $180 bytes


;;; $9520: Samus bottom tiles - set 0 - entry Fh ;;;
SamusTiles_Bottom_Set0_EntryF:
; 1: Facing right - normal - frame 2
; 1: Facing right - normal - frame 7
; 47h: Unused - frame 2
; 47h: Unused - frame 7
; 89h: Facing right - ran into a wall - frame 2
; 89h: Facing right - ran into a wall - frame 7
; A8h: Facing right - grappling - frame 2
; A8h: Facing right - grappling - frame 7
incbin "../data/SamusTiles_Bottom_Set0_EntryF.bin" ; $180 bytes


;;; $96A0: Samus bottom tiles - set 0 - entry 10h ;;;
SamusTiles_Bottom_Set0_Entry10:
; 2: Facing left  - normal - frame 1
; 2: Facing left  - normal - frame 3
; 2: Facing left  - normal - frame 6
; 2: Facing left  - normal - frame 8
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
incbin "../data/SamusTiles_Bottom_Set0_Entry10.bin" ; $180 bytes


;;; $9820: Samus bottom tiles - set 0 - entry 11h ;;;
SamusTiles_Bottom_Set0_Entry11:
; 4Fh: Facing left  - damage boost - frame 0
incbin "../data/SamusTiles_Bottom_Set0_Entry11.bin" ; $E0 bytes


;;; $9900: Samus bottom tiles - set 0 - entry 12h ;;;
SamusTiles_Bottom_Set0_Entry12:
; 50h: Facing right - damage boost - frame 0
incbin "../data/SamusTiles_Bottom_Set0_Entry12.bin" ; $E0 bytes


;;; $99E0: Samus bottom tiles - set 0 - entry 13h ;;;
SamusTiles_Bottom_Set0_Entry13:
; 15h: Facing right - normal jump - aiming up - frame 1
; 69h: Facing right - normal jump - aiming up-right - frame 1
incbin "../data/SamusTiles_Bottom_Set0_Entry13.bin" ; $120 bytes


;;; $9B00: Samus bottom tiles - set 0 - entry 14h ;;;
SamusTiles_Bottom_Set0_Entry14:
; 16h: Facing left  - normal jump - aiming up - frame 1
; 6Ah: Facing left  - normal jump - aiming up-left - frame 1
incbin "../data/SamusTiles_Bottom_Set0_Entry14.bin" ; $120 bytes


;;; $9C20: Samus bottom tiles - set 0 - entry 15h ;;;
SamusTiles_Bottom_Set0_Entry15:
; 25h: Facing right - turning - standing - frame 2
; 26h: Facing left  - turning - standing - frame 0
; 8Bh: Facing right - turning - standing - aiming up - frame 2
; 8Ch: Facing left  - turning - standing - aiming up - frame 0
; 8Dh: Facing right - turning - standing - aiming down-right - frame 2
; 8Eh: Facing left  - turning - standing - aiming down-left - frame 0
; 9Ch: Facing right - turning - standing - aiming up-right - frame 2
; 9Dh: Facing left  - turning - standing - aiming up-left - frame 0
; BFh: Facing right - moonwalking - turn/jump left - frame 2
; C0h: Facing left  - moonwalking - turn/jump right - frame 0
; C1h: Facing right - moonwalking - turn/jump left  - aiming up-right - frame 2
; C2h: Facing left  - moonwalking - turn/jump right - aiming up-left - frame 0
; C3h: Facing right - moonwalking - turn/jump left  - aiming down-right - frame 2
; C4h: Facing left  - moonwalking - turn/jump right - aiming down-left - frame 0
; C6h: Unused - frame 2
incbin "../data/SamusTiles_Bottom_Set0_Entry15.bin" ; $120 bytes


;;; $9D40: Samus bottom tiles - set 0 - entry 16h ;;;
SamusTiles_Bottom_Set0_Entry16:
; 25h: Facing right - turning - standing - frame 0
; 26h: Facing left  - turning - standing - frame 2
; 8Bh: Facing right - turning - standing - aiming up - frame 0
; 8Ch: Facing left  - turning - standing - aiming up - frame 2
; 8Dh: Facing right - turning - standing - aiming down-right - frame 0
; 8Eh: Facing left  - turning - standing - aiming down-left - frame 2
; 9Ch: Facing right - turning - standing - aiming up-right - frame 0
; 9Dh: Facing left  - turning - standing - aiming up-left - frame 2
; BFh: Facing right - moonwalking - turn/jump left - frame 0
; C0h: Facing left  - moonwalking - turn/jump right - frame 2
; C1h: Facing right - moonwalking - turn/jump left  - aiming up-right - frame 0
; C2h: Facing left  - moonwalking - turn/jump right - aiming up-left - frame 2
; C3h: Facing right - moonwalking - turn/jump left  - aiming down-right - frame 0
; C4h: Facing left  - moonwalking - turn/jump right - aiming down-left - frame 2
; C6h: Unused - frame 0
incbin "../data/SamusTiles_Bottom_Set0_Entry16.bin" ; $120 bytes


;;; $9E60: Samus bottom tiles - set 0 - entry 17h ;;;
SamusTiles_Bottom_Set0_Entry17:
; 2Fh: Facing right - turning - jumping - frame 2
; 30h: Facing left  - turning - jumping - frame 0
; 43h: Facing right - turning - crouching - frame 2
; 44h: Facing left  - turning - crouching - frame 0
; 87h: Facing right - turning - falling - frame 2
; 88h: Facing left  - turning - falling - frame 0
; 8Fh: Facing right - turning - in air - aiming up - frame 2
; 90h: Facing left  - turning - in air - aiming up - frame 0
; 91h: Facing right - turning - in air - aiming down/down-right - frame 2
; 92h: Facing left  - turning - in air - aiming down/down-left - frame 0
; 93h: Facing right - turning - falling - aiming up - frame 2
; 94h: Facing left  - turning - falling - aiming up - frame 0
; 95h: Facing right - turning - falling - aiming down/down-right - frame 2
; 96h: Facing left  - turning - falling - aiming down/down-left - frame 0
; 97h: Facing right - turning - crouching - aiming up - frame 2
; 98h: Facing left  - turning - crouching - aiming up - frame 0
; 99h: Facing right - turning - crouching - aiming down/down-right - frame 2
; 9Ah: Facing left  - turning - crouching - aiming down/down-left - frame 0
; 9Eh: Facing right - turning - in air - aiming up-right - frame 2
; 9Fh: Facing left  - turning - in air - aiming up-left - frame 0
; A0h: Facing right - turning - falling - aiming up-right - frame 2
; A1h: Facing left  - turning - falling - aiming up-left - frame 0
; A2h: Facing right - turning - crouching - aiming up-right - frame 2
; A3h: Facing left  - turning - crouching - aiming up-left - frame 0
incbin "../data/SamusTiles_Bottom_Set0_Entry17.bin" ; $C0 bytes


;;; $9F20: Samus bottom tiles - set 0 - entry 18h ;;;
SamusTiles_Bottom_Set0_Entry18:
; 2Fh: Facing right - turning - jumping - frame 0
; 30h: Facing left  - turning - jumping - frame 2
; 43h: Facing right - turning - crouching - frame 0
; 44h: Facing left  - turning - crouching - frame 2
; 87h: Facing right - turning - falling - frame 0
; 88h: Facing left  - turning - falling - frame 2
; 8Fh: Facing right - turning - in air - aiming up - frame 0
; 90h: Facing left  - turning - in air - aiming up - frame 2
; 91h: Facing right - turning - in air - aiming down/down-right - frame 0
; 92h: Facing left  - turning - in air - aiming down/down-left - frame 2
; 93h: Facing right - turning - falling - aiming up - frame 0
; 94h: Facing left  - turning - falling - aiming up - frame 2
; 95h: Facing right - turning - falling - aiming down/down-right - frame 0
; 96h: Facing left  - turning - falling - aiming down/down-left - frame 2
; 97h: Facing right - turning - crouching - aiming up - frame 0
; 98h: Facing left  - turning - crouching - aiming up - frame 2
; 99h: Facing right - turning - crouching - aiming down/down-right - frame 0
; 9Ah: Facing left  - turning - crouching - aiming down/down-left - frame 2
; 9Eh: Facing right - turning - in air - aiming up-right - frame 0
; 9Fh: Facing left  - turning - in air - aiming up-left - frame 2
; A0h: Facing right - turning - falling - aiming up-right - frame 0
; A1h: Facing left  - turning - falling - aiming up-left - frame 2
; A2h: Facing right - turning - crouching - aiming up-right - frame 0
; A3h: Facing left  - turning - crouching - aiming up-left - frame 2
incbin "../data/SamusTiles_Bottom_Set0_Entry18.bin" ; $C0 bytes


;;; $9FE0: Samus bottom tiles - set 0 - entry 19h ;;;
SamusTiles_Bottom_Set0_Entry19:
; 5Ch: Unused - frame 0
; 64h: Unused. Related to movement type Dh - frame 1
; B9h: Facing right - grapple wall jump pose - frame 0
incbin "../data/SamusTiles_Bottom_Set0_Entry19.bin" ; $100 bytes


;;; $A0E0: Samus bottom tiles - set 0 - entry 1Ah ;;;
SamusTiles_Bottom_Set0_Entry1A:
; 45h: Unused - frame 0
; 46h: Unused - frame 0
; 5Bh: Unused - frame 0
; 63h: Unused. Related to movement type Dh - frame 1
; B8h: Facing left  - grapple wall jump pose - frame 0
incbin "../data/SamusTiles_Bottom_Set0_Entry1A.bin" ; $100 bytes


;;; $A1E0: Samus bottom tiles - set 0 - entry 1Bh ;;;
SamusTiles_Bottom_Set0_Entry1B:
; C9h: Facing right - shinespark - horizontal - frame 0
; CDh: Facing right - shinespark - diagonal - frame 0
incbin "../data/SamusTiles_Bottom_Set0_Entry1B.bin" ; $140 bytes


;;; $A320: Samus bottom tiles - set 0 - entry 1Ch ;;;
SamusTiles_Bottom_Set0_Entry1C:
; CAh: Facing left  - shinespark - horizontal - frame 0
; CEh: Facing left  - shinespark - diagonal - frame 0
incbin "../data/SamusTiles_Bottom_Set0_Entry1C.bin" ; $140 bytes


;;; $A460: Samus bottom tiles - set 0 - entry 1Dh ;;;
SamusTiles_Bottom_Set0_Entry1D:
; 2: Facing left  - normal - frame 2
; 2: Facing left  - normal - frame 7
; 48h: Unused - frame 2
; 48h: Unused - frame 7
; 8Ah: Facing left  - ran into a wall - frame 2
; 8Ah: Facing left  - ran into a wall - frame 7
; A9h: Facing left  - grappling - frame 2
; A9h: Facing left  - grappling - frame 7
incbin "../data/SamusTiles_Bottom_Set0_Entry1D.bin" ; $180 bytes


;;; $A5E0: Samus bottom tiles - set 0 - entry 1Eh ;;;
SamusTiles_Bottom_Set0_Entry1E:
; 19h: Facing right - spin jump - frame Bh
; 1Bh: Facing right - space jump - frame Bh
; 20h: Unused - frame Bh
; 21h: Unused - frame Bh
; 22h: Unused - frame Bh
; 23h: Unused - frame Bh
; 24h: Unused - frame Bh
; 33h: Unused - frame Bh
; 34h: Unused - frame Bh
; 39h: Unused - frame Bh
; 3Ah: Unused - frame Bh
; 42h: Unused - frame Bh
; 81h: Facing right - screw attack - frame 1Bh
incbin "../data/SamusTiles_Bottom_Set0_Entry1E.bin" ; $100 bytes


;;; $A6E0: Samus bottom tiles - set 0 - entry 1Fh ;;;
SamusTiles_Bottom_Set0_Entry1F:
; 1Ah: Facing left  - spin jump - frame Bh
; 1Ch: Facing left  - space jump - frame Bh
; 82h: Facing left  - screw attack - frame 1Bh
incbin "../data/SamusTiles_Bottom_Set0_Entry1F.bin" ; $100 bytes


;;; $A7E0: Samus bottom tiles - set 1 - entry 0 ;;;
SamusTiles_Bottom_Set1_Entry0:
; 49h: Facing left  - moonwalk - frame 3
; 4Ah: Facing right - moonwalk - frame 3
; 75h: Facing left  - moonwalk - aiming up-left - frame 3
; 76h: Facing right - moonwalk - aiming up-right - frame 3
; 77h: Facing left  - moonwalk - aiming down-left - frame 3
; 78h: Facing right - moonwalk - aiming down-right - frame 3
incbin "../data/SamusTiles_Bottom_Set1_Entry0.bin" ; $140 bytes


;;; $A920: Samus bottom tiles - set 1 - entry 1 ;;;
SamusTiles_Bottom_Set1_Entry1:
; 25h: Facing right - turning - standing - frame 1
; 26h: Facing left  - turning - standing - frame 1
; 8Bh: Facing right - turning - standing - aiming up - frame 1
; 8Ch: Facing left  - turning - standing - aiming up - frame 1
; 8Dh: Facing right - turning - standing - aiming down-right - frame 1
; 8Eh: Facing left  - turning - standing - aiming down-left - frame 1
; 9Ch: Facing right - turning - standing - aiming up-right - frame 1
; 9Dh: Facing left  - turning - standing - aiming up-left - frame 1
; BFh: Facing right - moonwalking - turn/jump left - frame 1
; C0h: Facing left  - moonwalking - turn/jump right - frame 1
; C1h: Facing right - moonwalking - turn/jump left  - aiming up-right - frame 1
; C2h: Facing left  - moonwalking - turn/jump right - aiming up-left - frame 1
; C3h: Facing right - moonwalking - turn/jump left  - aiming down-right - frame 1
; C4h: Facing left  - moonwalking - turn/jump right - aiming down-left - frame 1
; C6h: Unused - frame 1
incbin "../data/SamusTiles_Bottom_Set1_Entry1.bin" ; $100 bytes


;;; $AA20: Samus bottom tiles - set 1 - entry 2 ;;;
SamusTiles_Bottom_Set1_Entry2:
; 2Fh: Facing right - turning - jumping - frame 1
; 30h: Facing left  - turning - jumping - frame 1
; 43h: Facing right - turning - crouching - frame 1
; 44h: Facing left  - turning - crouching - frame 1
; 87h: Facing right - turning - falling - frame 1
; 88h: Facing left  - turning - falling - frame 1
; 8Fh: Facing right - turning - in air - aiming up - frame 1
; 90h: Facing left  - turning - in air - aiming up - frame 1
; 91h: Facing right - turning - in air - aiming down/down-right - frame 1
; 92h: Facing left  - turning - in air - aiming down/down-left - frame 1
; 93h: Facing right - turning - falling - aiming up - frame 1
; 94h: Facing left  - turning - falling - aiming up - frame 1
; 95h: Facing right - turning - falling - aiming down/down-right - frame 1
; 96h: Facing left  - turning - falling - aiming down/down-left - frame 1
; 97h: Facing right - turning - crouching - aiming up - frame 1
; 98h: Facing left  - turning - crouching - aiming up - frame 1
; 99h: Facing right - turning - crouching - aiming down/down-right - frame 1
; 9Ah: Facing left  - turning - crouching - aiming down/down-left - frame 1
; 9Eh: Facing right - turning - in air - aiming up-right - frame 1
; 9Fh: Facing left  - turning - in air - aiming up-left - frame 1
; A0h: Facing right - turning - falling - aiming up-right - frame 1
; A1h: Facing left  - turning - falling - aiming up-left - frame 1
; A2h: Facing right - turning - crouching - aiming up-right - frame 1
; A3h: Facing left  - turning - crouching - aiming up-left - frame 1
incbin "../data/SamusTiles_Bottom_Set1_Entry2.bin" ; $80 bytes


;;; $AAA0: Samus bottom tiles - set 1 - entry 3 ;;;
SamusTiles_Bottom_Set1_Entry3:
; 49h: Facing left  - moonwalk - frame 0
; 4Ah: Facing right - moonwalk - frame 0
; 75h: Facing left  - moonwalk - aiming up-left - frame 0
; 76h: Facing right - moonwalk - aiming up-right - frame 0
; 77h: Facing left  - moonwalk - aiming down-left - frame 0
; 78h: Facing right - moonwalk - aiming down-right - frame 0
incbin "../data/SamusTiles_Bottom_Set1_Entry3.bin" ; $140 bytes


;;; $ABE0: Samus bottom tiles - set 1 - entry 4 ;;;
SamusTiles_Bottom_Set1_Entry4:
; 49h: Facing left  - moonwalk - frame 1
; 4Ah: Facing right - moonwalk - frame 1
; 75h: Facing left  - moonwalk - aiming up-left - frame 1
; 76h: Facing right - moonwalk - aiming up-right - frame 1
; 77h: Facing left  - moonwalk - aiming down-left - frame 1
; 78h: Facing right - moonwalk - aiming down-right - frame 1
incbin "../data/SamusTiles_Bottom_Set1_Entry4.bin" ; $100 bytes


;;; $ACE0: Samus bottom tiles - set 1 - entry 5 ;;;
SamusTiles_Bottom_Set1_Entry5:
; 49h: Facing left  - moonwalk - frame 4
; 4Ah: Facing right - moonwalk - frame 4
; 75h: Facing left  - moonwalk - aiming up-left - frame 4
; 76h: Facing right - moonwalk - aiming up-right - frame 4
; 77h: Facing left  - moonwalk - aiming down-left - frame 4
; 78h: Facing right - moonwalk - aiming down-right - frame 4
incbin "../data/SamusTiles_Bottom_Set1_Entry5.bin" ; $100 bytes


;;; $ADE0: Samus bottom tiles - set 1 - entry 6 ;;;
SamusTiles_Bottom_Set1_Entry6:
; 35h: Facing right - crouching transition - frame 0
; 3Bh: Facing right - standing transition - frame 0
; 4Bh: Facing right - normal jump transition - frame 0
; 55h: Facing right - normal jump transition - aiming up - frame 0
; 57h: Facing right - normal jump transition - aiming up-right - frame 0
; 59h: Facing right - normal jump transition - aiming down-right - frame 0
; A4h: Facing right - landing from normal jump - frame 0
; A6h: Facing right - landing from spin jump - frame 1
; D3h: Facing right - crystal flash - frame Eh
; D7h: Facing right - crystal flash ending - frames 0..3
; D8h: Facing left  - crystal flash ending - frames 0..2
; DBh: Unused - frame 0
; DCh: Unused - frame 0
; DDh: Unused - frame 2
; DEh: Unused - frame 2
; E0h: Facing right - landing from normal jump - aiming up - frame 0
; E2h: Facing right - landing from normal jump - aiming up-right - frame 0
; E4h: Facing right - landing from normal jump - aiming down-right - frame 0
; E6h: Facing right - landing from normal jump - firing - frame 0
; E8h: Facing right - Samus drained - crouching/falling - frames 0..2
; E8h: Facing right - Samus drained - crouching/falling - frame Eh
; E9h: Facing left  - Samus drained - crouching/falling - frames 0..1
; EAh: Facing right - Samus drained - standing - frame 5
; F1h: Facing right - crouching transition - aiming up - frame 0
; F3h: Facing right - crouching transition - aiming up-right - frame 0
; F5h: Facing right - crouching transition - aiming down-right - frame 0
; F7h: Facing right - standing transition - aiming up - frame 0
; F9h: Facing right - standing transition - aiming up-right - frame 0
; FBh: Facing right - standing transition - aiming down-right - frame 0
incbin "../data/SamusTiles_Bottom_Set1_Entry6.bin" ; $140 bytes


;;; $AF20: Samus bottom tiles - set 1 - entry 7 ;;;
SamusTiles_Bottom_Set1_Entry7:
; 36h: Facing left  - crouching transition - frame 0
; 3Ch: Facing left  - standing transition - frame 0
; 4Ch: Facing left  - normal jump transition - frame 0
; 56h: Facing left  - normal jump transition - aiming up - frame 0
; 58h: Facing left  - normal jump transition - aiming up-left - frame 0
; 5Ah: Facing left  - normal jump transition - aiming down-left - frame 0
; A5h: Facing left  - landing from normal jump - frame 0
; A7h: Facing left  - landing from spin jump - frame 1
; D4h: Facing left  - crystal flash - frame Eh
; D8h: Facing left  - crystal flash ending - frame 3
; E1h: Facing left  - landing from normal jump - aiming up - frame 0
; E3h: Facing left  - landing from normal jump - aiming up-left - frame 0
; E5h: Facing left  - landing from normal jump - aiming down-left - frame 0
; E7h: Facing left  - landing from normal jump - firing - frame 0
; E9h: Facing left  - Samus drained - crouching/falling - frame 7
; E9h: Facing left  - Samus drained - crouching/falling - frame Fh
; E9h: Facing left  - Samus drained - crouching/falling - frame 14h
; E9h: Facing left  - Samus drained - crouching/falling - frame 16h
; EBh: Facing left  - Samus drained - standing - frame 5
; F2h: Facing left  - crouching transition - aiming up - frame 0
; F4h: Facing left  - crouching transition - aiming up-left - frame 0
; F6h: Facing left  - crouching transition - aiming down-left - frame 0
; F8h: Facing left  - standing transition - aiming up - frame 0
; FAh: Facing left  - standing transition - aiming up-left - frame 0
; FCh: Facing left  - standing transition - aiming down-left - frame 0
incbin "../data/SamusTiles_Bottom_Set1_Entry7.bin" ; $140 bytes


;;; $B060: Samus bottom tiles - set 1 - entry 8 ;;;
SamusTiles_Bottom_Set1_Entry8:
; 4Dh: Facing right - normal jump - not aiming - not moving - gun not extended - frames 2..3
; C7h: Facing right - vertical shinespark windup - frames 2..3
; F0h: Facing right - grabbed by Draygon - moving - frame 5
incbin "../data/SamusTiles_Bottom_Set1_Entry8.bin" ; $140 bytes


;;; $B180: Samus bottom tiles - set 1 - entry 9 ;;;
SamusTiles_Bottom_Set1_Entry9:
; 4Eh: Facing left  - normal jump - not aiming - not moving - gun not extended - frames 2..3
; BEh: Facing left  - grabbed by Draygon - moving - frame 5
; C8h: Facing left  - vertical shinespark windup - frames 2..3
incbin "../data/SamusTiles_Bottom_Set1_Entry9.bin" ; $120 bytes


;;; $B2A0: Samus bottom tiles - set 1 - entry Ah ;;;
SamusTiles_Bottom_Set1_EntryA:
; 13h: Facing right - normal jump - not aiming - not moving - gun extended - frame 0
; 15h: Facing right - normal jump - aiming up - frame 0
; 17h: Facing right - normal jump - aiming down - frame 0
; 29h: Facing right - falling - frame 0
; 29h: Facing right - falling - frame 5
; 2Bh: Facing right - falling - aiming up - frame 0
; 2Dh: Facing right - falling - aiming down - frame 0
; 4Dh: Facing right - normal jump - not aiming - not moving - gun not extended - frame 4
; 50h: Facing right - damage boost - frame 1
; 51h: Facing right - normal jump - not aiming - moving forward - frame 0
; 67h: Facing right - falling - gun extended - frame 0
; 67h: Facing right - falling - gun extended - frame 5
; 69h: Facing right - normal jump - aiming up-right - frame 0
; 6Bh: Facing right - normal jump - aiming down-right - frame 0
; 6Dh: Facing right - falling - aiming up-right - frame 0
; 6Fh: Facing right - falling - aiming down-right - frame 0
; ACh: Unused. Facing right - grappling - in air - frame 0
; AEh: Unused. Facing right - grappling - in air - aiming down - frame 0
; B0h: Unused. Facing right - grappling - in air - aiming down-right - frame 0
; C7h: Facing right - vertical shinespark windup - frame 4
incbin "../data/SamusTiles_Bottom_Set1_EntryA.bin" ; $120 bytes


;;; $B3C0: Samus bottom tiles - set 1 - entry Bh ;;;
SamusTiles_Bottom_Set1_EntryB:
; 14h: Facing left  - normal jump - not aiming - not moving - gun extended - frame 0
; 16h: Facing left  - normal jump - aiming up - frame 0
; 18h: Facing left  - normal jump - aiming down - frame 0
; 2Ah: Facing left  - falling - frame 0
; 2Ah: Facing left  - falling - frame 5
; 2Ch: Facing left  - falling - aiming up - frame 0
; 2Eh: Facing left  - falling - aiming down - frame 0
; 4Eh: Facing left  - normal jump - not aiming - not moving - gun not extended - frame 4
; 4Fh: Facing left  - damage boost - frame 1
; 52h: Facing left  - normal jump - not aiming - moving forward - frame 0
; 68h: Facing left  - falling - gun extended - frame 0
; 68h: Facing left  - falling - gun extended - frame 5
; 6Ah: Facing left  - normal jump - aiming up-left - frame 0
; 6Ch: Facing left  - normal jump - aiming down-left - frame 0
; 6Eh: Facing left  - falling - aiming up-left - frame 0
; 70h: Facing left  - falling - aiming down-left - frame 0
; ADh: Unused. Facing left  - grappling - in air - frame 0
; AFh: Unused. Facing left  - grappling - in air - aiming down - frame 0
; B1h: Unused. Facing left  - grappling - in air - aiming down-left - frame 0
; C8h: Facing left  - vertical shinespark windup - frame 4
incbin "../data/SamusTiles_Bottom_Set1_EntryB.bin" ; $120 bytes


;;; $B4E0: Samus bottom tiles - set 1 - entry Ch ;;;
SamusTiles_Bottom_Set1_EntryC:
; 29h: Facing right - falling - frames 1..2
; 2Bh: Facing right - falling - aiming up - frame 1
; 4Dh: Facing right - normal jump - not aiming - not moving - gun not extended - frame 5
; 53h: Facing right - knockback - frame 0
; 67h: Facing right - falling - gun extended - frames 1..2
; 6Dh: Facing right - falling - aiming up-right - frame 1
; 6Fh: Facing right - falling - aiming down-right - frame 1
; C7h: Facing right - vertical shinespark windup - frame 5
; D7h: Facing right - crystal flash ending - frame 4
; E8h: Facing right - Samus drained - crouching/falling - frames 3..7
; F0h: Facing right - grabbed by Draygon - moving - frame 0
; F0h: Facing right - grabbed by Draygon - moving - frame 3
incbin "../data/SamusTiles_Bottom_Set1_EntryC.bin" ; $120 bytes


;;; $B5E0: Samus bottom tiles - set 1 - entry Dh ;;;
SamusTiles_Bottom_Set1_EntryD:
; 2Ah: Facing left  - falling - frames 1..2
; 2Ch: Facing left  - falling - aiming up - frame 1
; 4Eh: Facing left  - normal jump - not aiming - not moving - gun not extended - frame 5
; 54h: Facing left  - knockback - frame 0
; 68h: Facing left  - falling - gun extended - frames 1..2
; 6Eh: Facing left  - falling - aiming up-left - frame 1
; 70h: Facing left  - falling - aiming down-left - frame 1
; BEh: Facing left  - grabbed by Draygon - moving - frame 0
; BEh: Facing left  - grabbed by Draygon - moving - frame 3
; C8h: Facing left  - vertical shinespark windup - frame 5
; D8h: Facing left  - crystal flash ending - frame 4
; E9h: Facing left  - Samus drained - crouching/falling - frames 2..6
incbin "../data/SamusTiles_Bottom_Set1_EntryD.bin" ; $100 bytes


;;; $B6E0: Samus bottom tiles - set 1 - entry Eh ;;;
SamusTiles_Bottom_Set1_EntryE:
; 4Dh: Facing right - normal jump - not aiming - not moving - gun not extended - frame 1
; C7h: Facing right - vertical shinespark windup - frame 1
; F0h: Facing right - grabbed by Draygon - moving - frame 4
incbin "../data/SamusTiles_Bottom_Set1_EntryE.bin" ; $100 bytes


;;; $B7E0: Samus bottom tiles - set 1 - entry Fh ;;;
SamusTiles_Bottom_Set1_EntryF:
; 4Eh: Facing left  - normal jump - not aiming - not moving - gun not extended - frame 1
; BEh: Facing left  - grabbed by Draygon - moving - frame 4
; C8h: Facing left  - vertical shinespark windup - frame 1
incbin "../data/SamusTiles_Bottom_Set1_EntryF.bin" ; $100 bytes


;;; $B8E0: Samus bottom tiles - set 1 - entry 10h ;;;
SamusTiles_Bottom_Set1_Entry10:
; Unused
incbin "../data/SamusTiles_Bottom_Set1_Entry10.bin" ; $20 bytes


;;; $B900: Samus bottom tiles - set 1 - entry 11h ;;;
SamusTiles_Bottom_Set1_Entry11:
; 17h: Facing right - normal jump - aiming down - frame 1
; 2Dh: Facing right - falling - aiming down - frame 1
; AEh: Unused. Facing right - grappling - in air - aiming down - frame 1
incbin "../data/SamusTiles_Bottom_Set1_Entry11.bin" ; $120 bytes


;;; $BA20: Samus bottom tiles - set 1 - entry 12h ;;;
SamusTiles_Bottom_Set1_Entry12:
; 18h: Facing left  - normal jump - aiming down - frame 1
; 2Eh: Facing left  - falling - aiming down - frame 1
; AFh: Unused. Facing left  - grappling - in air - aiming down - frame 1
incbin "../data/SamusTiles_Bottom_Set1_Entry12.bin" ; $120 bytes


;;; $BB40: Samus bottom tiles - set 1 - entry 13h ;;;
SamusTiles_Bottom_Set1_Entry13:
; 65h: Unused. Related to movement type Dh - frame 0
; 83h: Facing right - wall jump - frame 0
incbin "../data/SamusTiles_Bottom_Set1_Entry13.bin" ; $140 bytes


;;; $BC80: Samus bottom tiles - set 1 - entry 14h ;;;
SamusTiles_Bottom_Set1_Entry14:
; 66h: Unused. Related to movement type Dh - frame 0
; 84h: Facing left  - wall jump - frame 0
incbin "../data/SamusTiles_Bottom_Set1_Entry14.bin" ; $100 bytes


;;; $BD80: Samus bottom tiles - set 1 - entry 15h ;;;
SamusTiles_Bottom_Set1_Entry15:
; 49h: Facing left  - moonwalk - frame 2
; 63h: Unused. Related to movement type Dh - frame 0
incbin "../data/SamusTiles_Bottom_Set1_Entry15.bin" ; $120 bytes


;;; $BEA0: Samus bottom tiles - set 1 - entry 16h ;;;
SamusTiles_Bottom_Set1_Entry16:
; 49h: Facing left  - moonwalk - frame 5
; 64h: Unused. Related to movement type Dh - frame 0
incbin "../data/SamusTiles_Bottom_Set1_Entry16.bin" ; $120 bytes


;;; $BFC0: Samus bottom tiles - set 1 - entry 17h ;;;
SamusTiles_Bottom_Set1_Entry17:
; 4Ah: Facing right - moonwalk - frame 2
; 75h: Facing left  - moonwalk - aiming up-left - frame 2
; 76h: Facing right - moonwalk - aiming up-right - frame 2
; 77h: Facing left  - moonwalk - aiming down-left - frame 2
; 78h: Facing right - moonwalk - aiming down-right - frame 2
incbin "../data/SamusTiles_Bottom_Set1_Entry17.bin" ; $120 bytes


;;; $C0E0: Samus bottom tiles - set 1 - entry 18h ;;;
SamusTiles_Bottom_Set1_Entry18:
; 4Ah: Facing right - moonwalk - frame 5
; 75h: Facing left  - moonwalk - aiming up-left - frame 5
; 76h: Facing right - moonwalk - aiming up-right - frame 5
; 77h: Facing left  - moonwalk - aiming down-left - frame 5
; 78h: Facing right - moonwalk - aiming down-right - frame 5
incbin "../data/SamusTiles_Bottom_Set1_Entry18.bin" ; $120 bytes


;;; $C200: Samus bottom tiles - set 1 - entry 19h ;;;
SamusTiles_Bottom_Set1_Entry19:
; 13h: Facing right - normal jump - not aiming - not moving - gun extended - frame 1
; 19h: Facing right - spin jump - frame 0
; 1Bh: Facing right - space jump - frame 0
; 20h: Unused - frame 0
; 21h: Unused - frame 0
; 22h: Unused - frame 0
; 23h: Unused - frame 0
; 24h: Unused - frame 0
; 29h: Facing right - falling - frame 6
; 2Bh: Facing right - falling - aiming up - frame 2
; 33h: Unused - frame 0
; 34h: Unused - frame 0
; 39h: Unused - frame 0
; 3Ah: Unused - frame 0
; 42h: Unused - frame 0
; 50h: Facing right - damage boost - frame 9
; 51h: Facing right - normal jump - not aiming - moving forward - frame 1
; 67h: Facing right - falling - gun extended - frame 6
; 6Bh: Facing right - normal jump - aiming down-right - frame 1
; 6Dh: Facing right - falling - aiming up-right - frame 2
; 6Fh: Facing right - falling - aiming down-right - frame 2
; 81h: Facing right - screw attack - frame 0
; 83h: Facing right - wall jump - frame 1
; A6h: Facing right - landing from spin jump - frame 0
; ACh: Unused. Facing right - grappling - in air - frame 1
; B0h: Unused. Facing right - grappling - in air - aiming down-right - frame 1
; F0h: Facing right - grabbed by Draygon - moving - frame 2
incbin "../data/SamusTiles_Bottom_Set1_Entry19.bin" ; $160 bytes


;;; $C360: Samus bottom tiles - set 1 - entry 1Ah ;;;
SamusTiles_Bottom_Set1_Entry1A:
; 14h: Facing left  - normal jump - not aiming - not moving - gun extended - frame 1
; 1Ah: Facing left  - spin jump - frame 0
; 1Ch: Facing left  - space jump - frame 0
; 2Ah: Facing left  - falling - frame 6
; 2Ch: Facing left  - falling - aiming up - frame 2
; 4Fh: Facing left  - damage boost - frame 9
; 52h: Facing left  - normal jump - not aiming - moving forward - frame 1
; 68h: Facing left  - falling - gun extended - frame 6
; 6Ch: Facing left  - normal jump - aiming down-left - frame 1
; 6Eh: Facing left  - falling - aiming up-left - frame 2
; 70h: Facing left  - falling - aiming down-left - frame 2
; 82h: Facing left  - screw attack - frame 0
; 84h: Facing left  - wall jump - frame 1
; A7h: Facing left  - landing from spin jump - frame 0
; ADh: Unused. Facing left  - grappling - in air - frame 1
; B1h: Unused. Facing left  - grappling - in air - aiming down-left - frame 1
; BEh: Facing left  - grabbed by Draygon - moving - frame 2
; E9h: Facing left  - Samus drained - crouching/falling - frame Eh
; E9h: Facing left  - Samus drained - crouching/falling - frame 13h
; E9h: Facing left  - Samus drained - crouching/falling - frame 17h
incbin "../data/SamusTiles_Bottom_Set1_Entry1A.bin" ; $160 bytes


;;; $C4C0: Samus bottom tiles - set 1 - entry 1Bh ;;;
SamusTiles_Bottom_Set1_Entry1B:
; 53h: Facing right - knockback - frame 1
; D7h: Facing right - crystal flash ending - frame 5
; ECh: Facing right - grabbed by Draygon - not moving - not aiming - frame 0
; EDh: Facing right - grabbed by Draygon - not moving - aiming up-right - frame 0
; EEh: Facing right - grabbed by Draygon - firing - frame 0
; EFh: Facing right - grabbed by Draygon - not moving - aiming down-right - frame 0
; F0h: Facing right - grabbed by Draygon - moving - frame 1
incbin "../data/SamusTiles_Bottom_Set1_Entry1B.bin" ; $140 bytes


;;; $C600: Samus bottom tiles - set 1 - entry 1Ch ;;;
SamusTiles_Bottom_Set1_Entry1C:
; 54h: Facing left  - knockback - frame 1
; BAh: Facing left  - grabbed by Draygon - not moving - not aiming - frame 0
; BBh: Facing left  - grabbed by Draygon - not moving - aiming up-left - frame 0
; BCh: Facing left  - grabbed by Draygon - firing - frame 0
; BDh: Facing left  - grabbed by Draygon - not moving - aiming down-left - frame 0
; BEh: Facing left  - grabbed by Draygon - moving - frame 1
; D8h: Facing left  - crystal flash ending - frame 5
incbin "../data/SamusTiles_Bottom_Set1_Entry1C.bin" ; $140 bytes


;;; $C740: Samus bottom tiles - set 1 - entry 1Dh ;;;
SamusTiles_Bottom_Set1_Entry1D:
; Unused
incbin "../data/SamusTiles_Bottom_Set1_Entry1D.bin" ; $100 bytes


;;; $C840: Samus bottom tiles - set 1 - entry 1Eh ;;;
SamusTiles_Bottom_Set1_Entry1E:
; E9h: Facing left  - Samus drained - crouching/falling - frames 8..Bh
; E9h: Facing left  - Samus drained - crouching/falling - frame 1Ah
; E9h: Facing left  - Samus drained - crouching/falling - frame 1Dh
; EBh: Facing left  - Samus drained - standing - frames 0..3
incbin "../data/SamusTiles_Bottom_Set1_Entry1E.bin" ; $A0 bytes


;;; $C8E0: Samus bottom tiles - set 1 - entry 1Fh ;;;
SamusTiles_Bottom_Set1_Entry1F:
; E8h: Facing right - Samus drained - crouching/falling - frames 8..Bh
; EAh: Facing right - Samus drained - standing - frames 0..3
incbin "../data/SamusTiles_Bottom_Set1_Entry1F.bin" ; $A0 bytes


;;; $C980: Samus top tiles - set 5 - entry 0 ;;;
SamusTiles_Top_Set5_Entry0:
; 5Dh: Unused - frame 8
; 5Dh: Unused - frame 28h
; 5Eh: Unused - frame 8
; 5Eh: Unused - frame 28h
; 5Fh: Unused - frame 8
; 5Fh: Unused - frame 28h
; 60h: Unused - frame 8
; 60h: Unused - frame 28h
; 61h: Unused - frame 8
; 61h: Unused - frame 28h
; B2h: Facing clockwise     - grapple swinging - frame 8
; B2h: Facing clockwise     - grapple swinging - frame 28h
incbin "../data/SamusTiles_Top_Set5_Entry0.bin" ; $140 bytes


;;; $CAC0: Samus top tiles - set 5 - entry 1 ;;;
SamusTiles_Top_Set5_Entry1:
; 5Dh: Unused - frame 7
; 5Dh: Unused - frame 27h
; 5Eh: Unused - frame 7
; 5Eh: Unused - frame 27h
; 5Fh: Unused - frame 7
; 5Fh: Unused - frame 27h
; 60h: Unused - frame 7
; 60h: Unused - frame 27h
; 61h: Unused - frame 7
; 61h: Unused - frame 27h
; B2h: Facing clockwise     - grapple swinging - frame 7
; B2h: Facing clockwise     - grapple swinging - frame 27h
incbin "../data/SamusTiles_Top_Set5_Entry1.bin" ; $140 bytes


;;; $CC00: Samus top tiles - set 5 - entry 2 ;;;
SamusTiles_Top_Set5_Entry2:
; 5Dh: Unused - frame 6
; 5Dh: Unused - frame 26h
; 5Eh: Unused - frame 6
; 5Eh: Unused - frame 26h
; 5Fh: Unused - frame 6
; 5Fh: Unused - frame 26h
; 60h: Unused - frame 6
; 60h: Unused - frame 26h
; 61h: Unused - frame 6
; 61h: Unused - frame 26h
; B2h: Facing clockwise     - grapple swinging - frame 6
; B2h: Facing clockwise     - grapple swinging - frame 26h
incbin "../data/SamusTiles_Top_Set5_Entry2.bin" ; $180 bytes


;;; $CD80: Samus top tiles - set 5 - entry 3 ;;;
SamusTiles_Top_Set5_Entry3:
; 5Dh: Unused - frame 5
; 5Dh: Unused - frame 25h
; 5Eh: Unused - frame 5
; 5Eh: Unused - frame 25h
; 5Fh: Unused - frame 5
; 5Fh: Unused - frame 25h
; 60h: Unused - frame 5
; 60h: Unused - frame 25h
; 61h: Unused - frame 5
; 61h: Unused - frame 25h
; B2h: Facing clockwise     - grapple swinging - frame 5
; B2h: Facing clockwise     - grapple swinging - frame 25h
incbin "../data/SamusTiles_Top_Set5_Entry3.bin" ; $180 bytes


;;; $CF00: Samus top tiles - set 5 - entry 4 ;;;
SamusTiles_Top_Set5_Entry4:
; 5Dh: Unused - frame 4
; 5Dh: Unused - frame 24h
; 5Eh: Unused - frame 4
; 5Eh: Unused - frame 24h
; 5Fh: Unused - frame 4
; 5Fh: Unused - frame 24h
; 60h: Unused - frame 4
; 60h: Unused - frame 24h
; 61h: Unused - frame 4
; 61h: Unused - frame 24h
; B2h: Facing clockwise     - grapple swinging - frame 4
; B2h: Facing clockwise     - grapple swinging - frame 24h
incbin "../data/SamusTiles_Top_Set5_Entry4.bin" ; $180 bytes


;;; $D080: Samus top tiles - set 5 - entry 5 ;;;
SamusTiles_Top_Set5_Entry5:
; 5Dh: Unused - frame 3
; 5Dh: Unused - frame 23h
; 5Eh: Unused - frame 3
; 5Eh: Unused - frame 23h
; 5Fh: Unused - frame 3
; 5Fh: Unused - frame 23h
; 60h: Unused - frame 3
; 60h: Unused - frame 23h
; 61h: Unused - frame 3
; 61h: Unused - frame 23h
; B2h: Facing clockwise     - grapple swinging - frame 3
; B2h: Facing clockwise     - grapple swinging - frame 23h
incbin "../data/SamusTiles_Top_Set5_Entry5.bin" ; $180 bytes


;;; $D200: Samus top tiles - set 5 - entry 6 ;;;
SamusTiles_Top_Set5_Entry6:
; 5Dh: Unused - frame 2
; 5Dh: Unused - frame 22h
; 5Eh: Unused - frame 2
; 5Eh: Unused - frame 22h
; 5Fh: Unused - frame 2
; 5Fh: Unused - frame 22h
; 60h: Unused - frame 2
; 60h: Unused - frame 22h
; 61h: Unused - frame 2
; 61h: Unused - frame 22h
; B2h: Facing clockwise     - grapple swinging - frame 2
; B2h: Facing clockwise     - grapple swinging - frame 22h
incbin "../data/SamusTiles_Top_Set5_Entry6.bin" ; $180 bytes


;;; $D380: Samus top tiles - set 5 - entry 7 ;;;
SamusTiles_Top_Set5_Entry7:
; 5Dh: Unused - frame 1
; 5Dh: Unused - frame 21h
; 5Eh: Unused - frame 1
; 5Eh: Unused - frame 21h
; 5Fh: Unused - frame 1
; 5Fh: Unused - frame 21h
; 60h: Unused - frame 1
; 60h: Unused - frame 21h
; 61h: Unused - frame 1
; 61h: Unused - frame 21h
; B2h: Facing clockwise     - grapple swinging - frame 1
; B2h: Facing clockwise     - grapple swinging - frame 21h
incbin "../data/SamusTiles_Top_Set5_Entry7.bin" ; $140 bytes


;;; $D4C0: Samus top tiles - set 5 - entry 8 ;;;
SamusTiles_Top_Set5_Entry8:
; 5Dh: Unused - frame 0
; 5Dh: Unused - frame 20h
; 5Eh: Unused - frame 0
; 5Eh: Unused - frame 20h
; 5Fh: Unused - frame 0
; 5Fh: Unused - frame 20h
; 60h: Unused - frame 0
; 60h: Unused - frame 20h
; 61h: Unused - frame 0
; 61h: Unused - frame 20h
; B2h: Facing clockwise     - grapple swinging - frame 0
; B2h: Facing clockwise     - grapple swinging - frame 20h
incbin "../data/SamusTiles_Top_Set5_Entry8.bin" ; $140 bytes


;;; $D600: Samus top tiles - set 5 - entry 9 ;;;
SamusTiles_Top_Set5_Entry9:
; 5Dh: Unused - frame 1Fh
; 5Dh: Unused - frame 3Fh
; 5Eh: Unused - frame 1Fh
; 5Eh: Unused - frame 3Fh
; 5Fh: Unused - frame 1Fh
; 5Fh: Unused - frame 3Fh
; 60h: Unused - frame 1Fh
; 60h: Unused - frame 3Fh
; 61h: Unused - frame 1Fh
; 61h: Unused - frame 3Fh
; B2h: Facing clockwise     - grapple swinging - frame 1Fh
; B2h: Facing clockwise     - grapple swinging - frame 3Fh
incbin "../data/SamusTiles_Top_Set5_Entry9.bin" ; $140 bytes


;;; $D740: Samus top tiles - set 5 - entry Ah ;;;
SamusTiles_Top_Set5_EntryA:
; 5Dh: Unused - frame 1Eh
; 5Dh: Unused - frame 3Eh
; 5Eh: Unused - frame 1Eh
; 5Eh: Unused - frame 3Eh
; 5Fh: Unused - frame 1Eh
; 5Fh: Unused - frame 3Eh
; 60h: Unused - frame 1Eh
; 60h: Unused - frame 3Eh
; 61h: Unused - frame 1Eh
; 61h: Unused - frame 3Eh
; B2h: Facing clockwise     - grapple swinging - frame 1Eh
; B2h: Facing clockwise     - grapple swinging - frame 3Eh
incbin "../data/SamusTiles_Top_Set5_EntryA.bin" ; $180 bytes


;;; $D8C0: Samus top tiles - set 5 - entry Bh ;;;
SamusTiles_Top_Set5_EntryB:
; 5Dh: Unused - frame 1Dh
; 5Dh: Unused - frame 3Dh
; 5Eh: Unused - frame 1Dh
; 5Eh: Unused - frame 3Dh
; 5Fh: Unused - frame 1Dh
; 5Fh: Unused - frame 3Dh
; 60h: Unused - frame 1Dh
; 60h: Unused - frame 3Dh
; 61h: Unused - frame 1Dh
; 61h: Unused - frame 3Dh
; B2h: Facing clockwise     - grapple swinging - frame 1Dh
; B2h: Facing clockwise     - grapple swinging - frame 3Dh
incbin "../data/SamusTiles_Top_Set5_EntryB.bin" ; $180 bytes


;;; $DA40: Samus top tiles - set 5 - entry Ch ;;;
SamusTiles_Top_Set5_EntryC:
; 5Dh: Unused - frame 1Ch
; 5Dh: Unused - frame 3Ch
; 5Eh: Unused - frame 1Ch
; 5Eh: Unused - frame 3Ch
; 5Fh: Unused - frame 1Ch
; 5Fh: Unused - frame 3Ch
; 60h: Unused - frame 1Ch
; 60h: Unused - frame 3Ch
; 61h: Unused - frame 1Ch
; 61h: Unused - frame 3Ch
; B2h: Facing clockwise     - grapple swinging - frame 1Ch
; B2h: Facing clockwise     - grapple swinging - frame 3Ch
incbin "../data/SamusTiles_Top_Set5_EntryC.bin" ; $180 bytes


;;; $DBC0: Samus top tiles - set 5 - entry Dh ;;;
SamusTiles_Top_Set5_EntryD:
; 5Dh: Unused - frame 1Bh
; 5Dh: Unused - frame 3Bh
; 5Eh: Unused - frame 1Bh
; 5Eh: Unused - frame 3Bh
; 5Fh: Unused - frame 1Bh
; 5Fh: Unused - frame 3Bh
; 60h: Unused - frame 1Bh
; 60h: Unused - frame 3Bh
; 61h: Unused - frame 1Bh
; 61h: Unused - frame 3Bh
; B2h: Facing clockwise     - grapple swinging - frame 1Bh
; B2h: Facing clockwise     - grapple swinging - frame 3Bh
incbin "../data/SamusTiles_Top_Set5_EntryD.bin" ; $180 bytes


;;; $DD40: Samus top tiles - set 5 - entry Eh ;;;
SamusTiles_Top_Set5_EntryE:
; 5Dh: Unused - frame 1Ah
; 5Dh: Unused - frame 3Ah
; 5Eh: Unused - frame 1Ah
; 5Eh: Unused - frame 3Ah
; 5Fh: Unused - frame 1Ah
; 5Fh: Unused - frame 3Ah
; 60h: Unused - frame 1Ah
; 60h: Unused - frame 3Ah
; 61h: Unused - frame 1Ah
; 61h: Unused - frame 3Ah
; B2h: Facing clockwise     - grapple swinging - frame 1Ah
; B2h: Facing clockwise     - grapple swinging - frame 3Ah
incbin "../data/SamusTiles_Top_Set5_EntryE.bin" ; $180 bytes


;;; $DEC0: Samus top tiles - set 5 - entry Fh ;;;
SamusTiles_Top_Set5_EntryF:
; 5Dh: Unused - frame 19h
; 5Dh: Unused - frame 39h
; 5Eh: Unused - frame 19h
; 5Eh: Unused - frame 39h
; 5Fh: Unused - frame 19h
; 5Fh: Unused - frame 39h
; 60h: Unused - frame 19h
; 60h: Unused - frame 39h
; 61h: Unused - frame 19h
; 61h: Unused - frame 39h
; B2h: Facing clockwise     - grapple swinging - frame 19h
; B2h: Facing clockwise     - grapple swinging - frame 39h
incbin "../data/SamusTiles_Top_Set5_EntryF.bin" ; $140 bytes


;;; $E000: Samus top tiles - set 5 - entry 10h ;;;
SamusTiles_Top_Set5_Entry10:
; Unused
incbin "../data/SamusTiles_Top_Set5_Entry10.bin" ; $140 bytes


;;; $E140: Samus top tiles - set 6 - entry 0 ;;;
SamusTiles_Top_Set6_Entry0:
; 62h: Unused - frame 18h
; 62h: Unused - frame 38h
; B3h: Facing anticlockwise - grapple swinging - frame 18h
; B3h: Facing anticlockwise - grapple swinging - frame 38h
incbin "../data/SamusTiles_Top_Set6_Entry0.bin" ; $1C0 bytes


;;; $E300: Samus top tiles - set 6 - entry 1 ;;;
SamusTiles_Top_Set6_Entry1:
; 62h: Unused - frame 19h
; 62h: Unused - frame 39h
; B3h: Facing anticlockwise - grapple swinging - frame 19h
; B3h: Facing anticlockwise - grapple swinging - frame 39h
incbin "../data/SamusTiles_Top_Set6_Entry1.bin" ; $1C0 bytes


;;; $E4C0: Samus top tiles - set 6 - entry 2 ;;;
SamusTiles_Top_Set6_Entry2:
; 62h: Unused - frame 1Ah
; 62h: Unused - frame 3Ah
; B3h: Facing anticlockwise - grapple swinging - frame 1Ah
; B3h: Facing anticlockwise - grapple swinging - frame 3Ah
incbin "../data/SamusTiles_Top_Set6_Entry2.bin" ; $200 bytes


;;; $E6C0: Samus top tiles - set 6 - entry 3 ;;;
SamusTiles_Top_Set6_Entry3:
; 62h: Unused - frame 1Bh
; 62h: Unused - frame 3Bh
; B3h: Facing anticlockwise - grapple swinging - frame 1Bh
; B3h: Facing anticlockwise - grapple swinging - frame 3Bh
incbin "../data/SamusTiles_Top_Set6_Entry3.bin" ; $200 bytes


;;; $E8C0: Samus top tiles - set 6 - entry 4 ;;;
SamusTiles_Top_Set6_Entry4:
; 62h: Unused - frame 1Ch
; 62h: Unused - frame 3Ch
; B3h: Facing anticlockwise - grapple swinging - frame 1Ch
; B3h: Facing anticlockwise - grapple swinging - frame 3Ch
incbin "../data/SamusTiles_Top_Set6_Entry4.bin" ; $1E0 bytes


;;; $EAA0: Samus top tiles - set 6 - entry 5 ;;;
SamusTiles_Top_Set6_Entry5:
; 62h: Unused - frame 1Dh
; 62h: Unused - frame 3Dh
; B3h: Facing anticlockwise - grapple swinging - frame 1Dh
; B3h: Facing anticlockwise - grapple swinging - frame 3Dh
incbin "../data/SamusTiles_Top_Set6_Entry5.bin" ; $1E0 bytes


;;; $EC80: Samus top tiles - set 6 - entry 6 ;;;
SamusTiles_Top_Set6_Entry6:
; 62h: Unused - frame 1Eh
; 62h: Unused - frame 3Eh
; B3h: Facing anticlockwise - grapple swinging - frame 1Eh
; B3h: Facing anticlockwise - grapple swinging - frame 3Eh
incbin "../data/SamusTiles_Top_Set6_Entry6.bin" ; $1E0 bytes


;;; $EE60: Samus top tiles - set 6 - entry 7 ;;;
SamusTiles_Top_Set6_Entry7:
; 62h: Unused - frame 1Fh
; 62h: Unused - frame 3Fh
; B3h: Facing anticlockwise - grapple swinging - frame 1Fh
; B3h: Facing anticlockwise - grapple swinging - frame 3Fh
incbin "../data/SamusTiles_Top_Set6_Entry7.bin" ; $1C0 bytes


;;; $F020: Samus top tiles - set 6 - entry 8 ;;;
SamusTiles_Top_Set6_Entry8:
; 62h: Unused - frame 0
; 62h: Unused - frame 20h
; B3h: Facing anticlockwise - grapple swinging - frame 0
; B3h: Facing anticlockwise - grapple swinging - frame 20h
incbin "../data/SamusTiles_Top_Set6_Entry8.bin" ; $1C0 bytes


;;; $F1E0: Samus top tiles - set 6 - entry 9 ;;;
SamusTiles_Top_Set6_Entry9:
; 62h: Unused - frame 1
; 62h: Unused - frame 21h
; B3h: Facing anticlockwise - grapple swinging - frame 1
; B3h: Facing anticlockwise - grapple swinging - frame 21h
incbin "../data/SamusTiles_Top_Set6_Entry9.bin" ; $1C0 bytes


;;; $F3A0: Samus top tiles - set 6 - entry Ah ;;;
SamusTiles_Top_Set6_EntryA:
; 62h: Unused - frame 2
; 62h: Unused - frame 22h
; B3h: Facing anticlockwise - grapple swinging - frame 2
; B3h: Facing anticlockwise - grapple swinging - frame 22h
incbin "../data/SamusTiles_Top_Set6_EntryA.bin" ; $1E0 bytes


;;; $F580: Samus top tiles - set 6 - entry Bh ;;;
SamusTiles_Top_Set6_EntryB:
; 62h: Unused - frame 3
; 62h: Unused - frame 23h
; B3h: Facing anticlockwise - grapple swinging - frame 3
; B3h: Facing anticlockwise - grapple swinging - frame 23h
incbin "../data/SamusTiles_Top_Set6_EntryB.bin" ; $200 bytes


Freespace_Bank9D_F780:
; $880 bytes
