
; Samus graphics

org $9E8000


;;; $8000: Samus top tiles - set 0 - entry 0 ;;;
SamusTiles_Top_Set0_Entry0:
; 9: Moving right - not aiming - frame 0
; 9: Moving right - not aiming - frame 5
; 4Dh: Facing right - normal jump - not aiming - not moving - gun not extended - frame 3
; C7h: Facing right - vertical shinespark windup - frame 3
; F0h: Facing right - grabbed by Draygon - moving - frame 2
; F0h: Facing right - grabbed by Draygon - moving - frame 5
incbin "../data/SamusTiles_Top_Set0_Entry0.bin" ; $100 bytes


;;; $8100: Samus top tiles - set 0 - entry 1 ;;;
SamusTiles_Top_Set0_Entry1:
; 9: Moving right - not aiming - frame 4
; 4Dh: Facing right - normal jump - not aiming - not moving - gun not extended - frame 4
; C7h: Facing right - vertical shinespark windup - frame 4
; F0h: Facing right - grabbed by Draygon - moving - frame 0
incbin "../data/SamusTiles_Top_Set0_Entry1.bin" ; $100 bytes


;;; $8200: Samus top tiles - set 0 - entry 2 ;;;
SamusTiles_Top_Set0_Entry2:
; 9: Moving right - not aiming - frame 2
; F0h: Facing right - grabbed by Draygon - moving - frame 1
incbin "../data/SamusTiles_Top_Set0_Entry2.bin" ; $120 bytes


;;; $8320: Samus top tiles - set 0 - entry 3 ;;;
SamusTiles_Top_Set0_Entry3:
; 9: Moving right - not aiming - frame 3
incbin "../data/SamusTiles_Top_Set0_Entry3.bin" ; $120 bytes


;;; $8440: Samus top tiles - set 0 - entry 4 ;;;
SamusTiles_Top_Set0_Entry4:
; 9: Moving right - not aiming - frame 9
; 4Dh: Facing right - normal jump - not aiming - not moving - gun not extended - frame 0
; 4Dh: Facing right - normal jump - not aiming - not moving - gun not extended - frame 2
; C7h: Facing right - vertical shinespark windup - frame 0
; C7h: Facing right - vertical shinespark windup - frame 2
; F0h: Facing right - grabbed by Draygon - moving - frame 3
incbin "../data/SamusTiles_Top_Set0_Entry4.bin" ; $100 bytes


;;; $8540: Samus top tiles - set 0 - entry 5 ;;;
SamusTiles_Top_Set0_Entry5:
; 9: Moving right - not aiming - frame 7
; 4Dh: Facing right - normal jump - not aiming - not moving - gun not extended - frame 1
; C7h: Facing right - vertical shinespark windup - frame 1
; F0h: Facing right - grabbed by Draygon - moving - frame 4
incbin "../data/SamusTiles_Top_Set0_Entry5.bin" ; $120 bytes


;;; $86C0: Samus top tiles - set 0 - entry 6 ;;;
SamusTiles_Top_Set0_Entry6:
; Ah: Moving left  - not aiming - frame 0
; Ah: Moving left  - not aiming - frame 5
; 4Eh: Facing left  - normal jump - not aiming - not moving - gun not extended - frame 3
; BEh: Facing left  - grabbed by Draygon - moving - frame 2
; BEh: Facing left  - grabbed by Draygon - moving - frame 5
; C8h: Facing left  - vertical shinespark windup - frame 3
incbin "../data/SamusTiles_Top_Set0_Entry6.bin" ; $100 bytes


;;; $87C0: Samus top tiles - set 0 - entry 7 ;;;
SamusTiles_Top_Set0_Entry7:
; Ah: Moving left  - not aiming - frame 4
; 4Eh: Facing left  - normal jump - not aiming - not moving - gun not extended - frame 4
; BEh: Facing left  - grabbed by Draygon - moving - frame 0
; C8h: Facing left  - vertical shinespark windup - frame 4
incbin "../data/SamusTiles_Top_Set0_Entry7.bin" ; $100 bytes


;;; $88C0: Samus top tiles - set 0 - entry 8 ;;;
SamusTiles_Top_Set0_Entry8:
; Ah: Moving left  - not aiming - frame 2
; BEh: Facing left  - grabbed by Draygon - moving - frame 1
incbin "../data/SamusTiles_Top_Set0_Entry8.bin" ; $180 bytes


;;; $8A40: Samus top tiles - set 0 - entry 9 ;;;
SamusTiles_Top_Set0_Entry9:
; Ah: Moving left  - not aiming - frame 3
incbin "../data/SamusTiles_Top_Set0_Entry9.bin" ; $180 bytes


;;; $8BC0: Samus top tiles - set 0 - entry Ah ;;;
SamusTiles_Top_Set0_EntryA:
; Ah: Moving left  - not aiming - frame 9
; 4Eh: Facing left  - normal jump - not aiming - not moving - gun not extended - frame 0
; 4Eh: Facing left  - normal jump - not aiming - not moving - gun not extended - frame 2
; BEh: Facing left  - grabbed by Draygon - moving - frame 3
; C8h: Facing left  - vertical shinespark windup - frame 0
; C8h: Facing left  - vertical shinespark windup - frame 2
incbin "../data/SamusTiles_Top_Set0_EntryA.bin" ; $100 bytes


;;; $8CC0: Samus top tiles - set 0 - entry Bh ;;;
SamusTiles_Top_Set0_EntryB:
; Ah: Moving left  - not aiming - frame 7
; 4Eh: Facing left  - normal jump - not aiming - not moving - gun not extended - frame 1
; BEh: Facing left  - grabbed by Draygon - moving - frame 4
; C8h: Facing left  - vertical shinespark windup - frame 1
incbin "../data/SamusTiles_Top_Set0_EntryB.bin" ; $120 bytes


;;; $8DE0: Samus top tiles - set 0 - entry Ch ;;;
SamusTiles_Top_Set0_EntryC:
; 11h: Moving right - aiming down-right - frames 0..1
; 11h: Moving right - aiming down-right - frames 5..6
; 17h: Facing right - normal jump - aiming down - frame 0
; 2Dh: Facing right - falling - aiming down - frame 0
; 6Bh: Facing right - normal jump - aiming down-right - frames 0..1
; 6Fh: Facing right - falling - aiming down-right - frames 0..2
; 78h: Facing right - moonwalk - aiming down-right - frame 0
; 78h: Facing right - moonwalk - aiming down-right - frame 3
; AEh: Unused. Facing right - grappling - in air - aiming down - frame 0
; B0h: Unused. Facing right - grappling - in air - aiming down-right - frames 0..1
; EFh: Facing right - grabbed by Draygon - not moving - aiming down-right - frame 0
incbin "../data/SamusTiles_Top_Set0_EntryC.bin" ; $120 bytes


;;; $8F00: Samus top tiles - set 0 - entry Dh ;;;
SamusTiles_Top_Set0_EntryD:
; 12h: Moving left  - aiming down-left - frames 0..1
; 12h: Moving left  - aiming down-left - frames 5..6
; 18h: Facing left  - normal jump - aiming down - frame 0
; 2Eh: Facing left  - falling - aiming down - frame 0
; 6Ch: Facing left  - normal jump - aiming down-left - frames 0..1
; 70h: Facing left  - falling - aiming down-left - frames 0..2
; 77h: Facing left  - moonwalk - aiming down-left - frame 0
; 77h: Facing left  - moonwalk - aiming down-left - frame 3
; AFh: Unused. Facing left  - grappling - in air - aiming down - frame 0
; B1h: Unused. Facing left  - grappling - in air - aiming down-left - frames 0..1
; BDh: Facing left  - grabbed by Draygon - not moving - aiming down-left - frame 0
incbin "../data/SamusTiles_Top_Set0_EntryD.bin" ; $120 bytes


;;; $9020: Samus top tiles - set 0 - entry Eh ;;;
SamusTiles_Top_Set0_EntryE:
; 7: Facing right - aiming down-right - frame 0
; 59h: Facing right - normal jump transition - aiming down-right - frame 0
; 73h: Facing right - crouching - aiming down-right - frame 0
; AAh: Facing right - grappling - aiming down-right - frame 0
; B6h: Facing right - grappling - crouching - aiming down-right - frame 0
; D1h: Facing right - ran into a wall - aiming down-right - frame 0
; E4h: Facing right - landing from normal jump - aiming down-right - frames 0..1
; F5h: Facing right - crouching transition - aiming down-right - frame 0
; FBh: Facing right - standing transition - aiming down-right - frame 0
incbin "../data/SamusTiles_Top_Set0_EntryE.bin" ; $160 bytes


;;; $9180: Samus top tiles - set 0 - entry Fh ;;;
SamusTiles_Top_Set0_EntryF:
; 8: Facing left  - aiming down-left - frame 0
; 5Ah: Facing left  - normal jump transition - aiming down-left - frame 0
; 74h: Facing left  - crouching - aiming down-left - frame 0
; ABh: Facing left  - grappling - aiming down-left - frame 0
; B7h: Facing left  - grappling - crouching - aiming down-left - frame 0
; D2h: Facing left  - ran into a wall - aiming down-left - frame 0
; E5h: Facing left  - landing from normal jump - aiming down-left - frames 0..1
; F6h: Facing left  - crouching transition - aiming down-left - frame 0
; FCh: Facing left  - standing transition - aiming down-left - frame 0
incbin "../data/SamusTiles_Top_Set0_EntryF.bin" ; $160 bytes


;;; $92E0: Samus top tiles - set 0 - entry 10h ;;;
SamusTiles_Top_Set0_Entry10:
; 13h: Facing right - normal jump - not aiming - not moving - gun extended - frames 0..1
; 35h: Facing right - crouching transition - frame 0
; 3Bh: Facing right - standing transition - frame 0
; 4Ah: Facing right - moonwalk - frame 0
; 4Ah: Facing right - moonwalk - frame 3
; 51h: Facing right - normal jump - not aiming - moving forward - frames 0..1
; 67h: Facing right - falling - gun extended - frames 0..2
; 67h: Facing right - falling - gun extended - frames 5..6
; ACh: Unused. Facing right - grappling - in air - frames 0..1
; D3h: Facing right - crystal flash - frame Eh
; D5h: Facing right - x-ray - standing - frame 2
; D7h: Facing right - crystal flash ending - frame 3
; D9h: Facing right - x-ray - crouching - frame 2
; DBh: Unused - frame 0
; DDh: Unused - frame 2
; E6h: Facing right - landing from normal jump - firing - frames 0..1
; E8h: Facing right - Samus drained - crouching/falling - frame Eh
; EAh: Facing right - Samus drained - standing - frame 5
; EEh: Facing right - grabbed by Draygon - firing - frame 0
incbin "../data/SamusTiles_Top_Set0_Entry10.bin" ; $100 bytes


;;; $93E0: Samus top tiles - set 0 - entry 11h ;;;
SamusTiles_Top_Set0_Entry11:
; 14h: Facing left  - normal jump - not aiming - not moving - gun extended - frames 0..1
; 36h: Facing left  - crouching transition - frame 0
; 3Ch: Facing left  - standing transition - frame 0
; 49h: Facing left  - moonwalk - frame 0
; 49h: Facing left  - moonwalk - frame 3
; 52h: Facing left  - normal jump - not aiming - moving forward - frames 0..1
; 68h: Facing left  - falling - gun extended - frames 0..2
; 68h: Facing left  - falling - gun extended - frames 5..6
; ADh: Unused. Facing left  - grappling - in air - frames 0..1
; BCh: Facing left  - grabbed by Draygon - firing - frame 0
; D4h: Facing left  - crystal flash - frame Eh
; D6h: Facing left  - x-ray - standing - frame 2
; D8h: Facing left  - crystal flash ending - frame 3
; DAh: Facing left  - x-ray - crouching - frame 2
; DCh: Unused - frame 0
; DEh: Unused - frame 2
; E7h: Facing left  - landing from normal jump - firing - frames 0..1
; EBh: Facing left  - Samus drained - standing - frame 5
incbin "../data/SamusTiles_Top_Set0_Entry11.bin" ; $100 bytes


;;; $94E0: Samus top tiles - set 0 - entry 12h ;;;
SamusTiles_Top_Set0_Entry12:
; 3: Facing right - aiming up - frame 0
; 5: Facing right - aiming up-right - frame 0
; 15h: Facing right - normal jump - aiming up - frame 0
; 2Bh: Facing right - falling - aiming up - frame 0
; 57h: Facing right - normal jump transition - aiming up-right - frame 0
; 71h: Facing right - crouching - aiming up-right - frame 0
; 85h: Facing right - crouching - aiming up - frame 0
; CFh: Facing right - ran into a wall - aiming up-right - frame 0
; E2h: Facing right - landing from normal jump - aiming up-right - frames 0..1
; F3h: Facing right - crouching transition - aiming up-right - frame 0
; F9h: Facing right - standing transition - aiming up-right - frame 0
incbin "../data/SamusTiles_Top_Set0_Entry12.bin" ; $140 bytes


;;; $9620: Samus top tiles - set 0 - entry 13h ;;;
SamusTiles_Top_Set0_Entry13:
; 4: Facing left  - aiming up - frame 0
; 6: Facing left  - aiming up-left - frame 0
; 16h: Facing left  - normal jump - aiming up - frame 0
; 2Ch: Facing left  - falling - aiming up - frame 0
; 58h: Facing left  - normal jump transition - aiming up-left - frame 0
; 72h: Facing left  - crouching - aiming up-left - frame 0
; 86h: Facing left  - crouching - aiming up - frame 0
; D0h: Facing left  - ran into a wall - aiming up-left - frame 0
; E3h: Facing left  - landing from normal jump - aiming up-left - frames 0..1
; F4h: Facing left  - crouching transition - aiming up-left - frame 0
; FAh: Facing left  - standing transition - aiming up-left - frame 0
incbin "../data/SamusTiles_Top_Set0_Entry13.bin" ; $140 bytes


;;; $9760: Samus top tiles - set 0 - entry 14h ;;;
SamusTiles_Top_Set0_Entry14:
; 4Dh: Facing right - normal jump - not aiming - not moving - gun not extended - frame 5
; C7h: Facing right - vertical shinespark windup - frame 5
incbin "../data/SamusTiles_Top_Set0_Entry14.bin" ; $120 bytes


;;; $9880: Samus top tiles - set 0 - entry 15h ;;;
SamusTiles_Top_Set0_Entry15:
; 4Eh: Facing left  - normal jump - not aiming - not moving - gun not extended - frame 5
; C8h: Facing left  - vertical shinespark windup - frame 5
incbin "../data/SamusTiles_Top_Set0_Entry15.bin" ; $120 bytes


;;; $9A00: Samus top tiles - set 0 - entry 16h ;;;
SamusTiles_Top_Set0_Entry16:
; 3: Facing right - aiming up - frame 1
; Dh: Moving right - aiming up (unused) - frames 0..1
; Dh: Moving right - aiming up (unused) - frames 5..6
; 15h: Facing right - normal jump - aiming up - frame 1
; 2Bh: Facing right - falling - aiming up - frames 1..2
; 55h: Facing right - normal jump transition - aiming up - frame 0
; 85h: Facing right - crouching - aiming up - frame 1
; E0h: Facing right - landing from normal jump - aiming up - frames 0..1
; F1h: Facing right - crouching transition - aiming up - frame 0
; F7h: Facing right - standing transition - aiming up - frame 0
incbin "../data/SamusTiles_Top_Set0_Entry16.bin" ; $100 bytes


;;; $9B00: Samus top tiles - set 0 - entry 17h ;;;
SamusTiles_Top_Set0_Entry17:
; 4: Facing left  - aiming up - frame 1
; Eh: Moving left  - aiming up (unused) - frames 0..1
; Eh: Moving left  - aiming up (unused) - frames 5..6
; 16h: Facing left  - normal jump - aiming up - frame 1
; 2Ch: Facing left  - falling - aiming up - frames 1..2
; 56h: Facing left  - normal jump transition - aiming up - frame 0
; 86h: Facing left  - crouching - aiming up - frame 1
; E1h: Facing left  - landing from normal jump - aiming up - frames 0..1
; F2h: Facing left  - crouching transition - aiming up - frame 0
; F8h: Facing left  - standing transition - aiming up - frame 0
incbin "../data/SamusTiles_Top_Set0_Entry17.bin" ; $100 bytes


;;; $9C00: Samus top tiles - set 0 - entry 18h ;;;
SamusTiles_Top_Set0_Entry18:
; 9: Moving right - not aiming - frame 8
incbin "../data/SamusTiles_Top_Set0_Entry18.bin" ; $120 bytes


;;; $9D20: Samus top tiles - set 0 - entry 19h ;;;
SamusTiles_Top_Set0_Entry19:
; Ah: Moving left  - not aiming - frame 8
incbin "../data/SamusTiles_Top_Set0_Entry19.bin" ; $120 bytes


;;; $9E40: Samus top tiles - set 0 - entry 1Ah ;;;
SamusTiles_Top_Set0_Entry1A:
; Fh: Moving right - aiming up-right - frames 0..1
; Fh: Moving right - aiming up-right - frames 5..6
; 69h: Facing right - normal jump - aiming up-right - frames 0..1
; 6Dh: Facing right - falling - aiming up-right - frames 0..2
; 76h: Facing right - moonwalk - aiming up-right - frame 0
; 76h: Facing right - moonwalk - aiming up-right - frame 3
; EDh: Facing right - grabbed by Draygon - not moving - aiming up-right - frame 0
incbin "../data/SamusTiles_Top_Set0_Entry1A.bin" ; $100 bytes


;;; $9F40: Samus top tiles - set 0 - entry 1Bh ;;;
SamusTiles_Top_Set0_Entry1B:
; 10h: Moving left  - aiming up-left - frames 0..1
; 10h: Moving left  - aiming up-left - frames 5..6
; 6Ah: Facing left  - normal jump - aiming up-left - frames 0..1
; 6Eh: Facing left  - falling - aiming up-left - frames 0..2
; 75h: Facing left  - moonwalk - aiming up-left - frame 0
; 75h: Facing left  - moonwalk - aiming up-left - frame 3
; BBh: Facing left  - grabbed by Draygon - not moving - aiming up-left - frame 0
incbin "../data/SamusTiles_Top_Set0_Entry1B.bin" ; $120 bytes


;;; $A060: Samus top tiles - set 0 - entry 1Ch ;;;
SamusTiles_Top_Set0_Entry1C:
; 54h: Facing left  - knockback - frames 0..1
; D8h: Facing left  - crystal flash ending - frames 4..5
; E9h: Facing left  - Samus drained - crouching/falling - frames 2..6
incbin "../data/SamusTiles_Top_Set0_Entry1C.bin" ; $1C0 bytes


;;; $A220: Samus top tiles - set 0 - entry 1Dh ;;;
SamusTiles_Top_Set0_Entry1D:
; 53h: Facing right - knockback - frames 0..1
; D7h: Facing right - crystal flash ending - frames 4..5
; E8h: Facing right - Samus drained - crouching/falling - frames 3..7
incbin "../data/SamusTiles_Top_Set0_Entry1D.bin" ; $1C0 bytes


;;; $A3E0: Samus top tiles - set 0 - entry 1Eh ;;;
SamusTiles_Top_Set0_Entry1E:
; Unused
incbin "../data/SamusTiles_Top_Set0_Entry1E.bin" ; $140 bytes


;;; $A520: Samus top tiles - set 0 - entry 1Fh ;;;
SamusTiles_Top_Set0_Entry1F:
; Unused
incbin "../data/SamusTiles_Top_Set0_Entry1F.bin" ; $140 bytes


;;; $A660..C81F: Samus top tiles - set 1 (general) ;;;
SamusTiles_Top_Set1_Entry0:
;;; $A660: Samus top tiles - set 1 - entry 0 ;;;
incbin "../data/SamusTiles_Top_Set1_Entry0.bin" ; $140 bytes


;;; $A7A0: Samus top tiles - set 1 - entry 1 ;;;
SamusTiles_Top_Set1_Entry1:
; Unused
incbin "../data/SamusTiles_Top_Set1_Entry1.bin" ; $140 bytes


;;; $A8E0: Samus top tiles - set 1 - entry 2 ;;;
SamusTiles_Top_Set1_Entry2:
; 8Bh: Facing right - turning - standing - aiming up - frame 1
; 8Ch: Facing left  - turning - standing - aiming up - frame 1
; 8Fh: Facing right - turning - in air - aiming up - frame 1
; 90h: Facing left  - turning - in air - aiming up - frame 1
; 93h: Facing right - turning - falling - aiming up - frame 1
; 94h: Facing left  - turning - falling - aiming up - frame 1
; 97h: Facing right - turning - crouching - aiming up - frame 1
; 98h: Facing left  - turning - crouching - aiming up - frame 1
; 9Ch: Facing right - turning - standing - aiming up-right - frame 1
; 9Dh: Facing left  - turning - standing - aiming up-left - frame 1
; 9Eh: Facing right - turning - in air - aiming up-right - frame 1
; 9Fh: Facing left  - turning - in air - aiming up-left - frame 1
; A0h: Facing right - turning - falling - aiming up-right - frame 1
; A1h: Facing left  - turning - falling - aiming up-left - frame 1
; A2h: Facing right - turning - crouching - aiming up-right - frame 1
; A3h: Facing left  - turning - crouching - aiming up-left - frame 1
; C1h: Facing right - moonwalking - turn/jump left  - aiming up-right - frame 1
; C2h: Facing left  - moonwalking - turn/jump right - aiming up-left - frame 1
incbin "../data/SamusTiles_Top_Set1_Entry2.bin" ; $1A0 bytes


;;; $AA80: Samus top tiles - set 1 - entry 3 ;;;
SamusTiles_Top_Set1_Entry3:
; 8Dh: Facing right - turning - standing - aiming down-right - frame 1
; 8Eh: Facing left  - turning - standing - aiming down-left - frame 1
; 91h: Facing right - turning - in air - aiming down/down-right - frame 1
; 92h: Facing left  - turning - in air - aiming down/down-left - frame 1
; 95h: Facing right - turning - falling - aiming down/down-right - frame 1
; 96h: Facing left  - turning - falling - aiming down/down-left - frame 1
; 99h: Facing right - turning - crouching - aiming down/down-right - frame 1
; 9Ah: Facing left  - turning - crouching - aiming down/down-left - frame 1
; C3h: Facing right - moonwalking - turn/jump left  - aiming down-right - frame 1
; C4h: Facing left  - moonwalking - turn/jump right - aiming down-left - frame 1
incbin "../data/SamusTiles_Top_Set1_Entry3.bin" ; $1C0 bytes


;;; $AC40: Samus top tiles - set 1 - entry 4 ;;;
SamusTiles_Top_Set1_Entry4:
; Unused
incbin "../data/SamusTiles_Top_Set1_Entry4.bin" ; $20 bytes


;;; $AC60: Samus top tiles - set 1 - entry 5 ;;;
SamusTiles_Top_Set1_Entry5:
; 9Bh: Facing forward - varia/gravity suit - frame 0
incbin "../data/SamusTiles_Top_Set1_Entry5.bin" ; $80 bytes


;;; $ACE0: Samus top tiles - set 1 - entry 6 ;;;
SamusTiles_Top_Set1_Entry6:
; 25h: Facing right - turning - standing - frame 2
; 26h: Facing left  - turning - standing - frame 0
; 2Fh: Facing right - turning - jumping - frame 2
; 30h: Facing left  - turning - jumping - frame 0
; 43h: Facing right - turning - crouching - frame 2
; 44h: Facing left  - turning - crouching - frame 0
; 87h: Facing right - turning - falling - frame 2
; 88h: Facing left  - turning - falling - frame 0
; BFh: Facing right - moonwalking - turn/jump left - frame 2
; C0h: Facing left  - moonwalking - turn/jump right - frame 0
; C6h: Unused - frame 2
incbin "../data/SamusTiles_Top_Set1_Entry6.bin" ; $140 bytes


;;; $AE20: Samus top tiles - set 1 - entry 7 ;;;
SamusTiles_Top_Set1_Entry7:
; 25h: Facing right - turning - standing - frame 0
; 26h: Facing left  - turning - standing - frame 2
; 2Fh: Facing right - turning - jumping - frame 0
; 30h: Facing left  - turning - jumping - frame 2
; 43h: Facing right - turning - crouching - frame 0
; 44h: Facing left  - turning - crouching - frame 2
; 87h: Facing right - turning - falling - frame 0
; 88h: Facing left  - turning - falling - frame 2
; BFh: Facing right - moonwalking - turn/jump left - frame 0
; C0h: Facing left  - moonwalking - turn/jump right - frame 2
; C6h: Unused - frame 0
incbin "../data/SamusTiles_Top_Set1_Entry7.bin" ; $140 bytes


;;; $AF60: Samus top tiles - set 1 - entry 8 ;;;
SamusTiles_Top_Set1_Entry8:
; 8Bh: Facing right - turning - standing - aiming up - frame 2
; 8Ch: Facing left  - turning - standing - aiming up - frame 0
; 8Fh: Facing right - turning - in air - aiming up - frame 2
; 90h: Facing left  - turning - in air - aiming up - frame 0
; 93h: Facing right - turning - falling - aiming up - frame 2
; 94h: Facing left  - turning - falling - aiming up - frame 0
; 97h: Facing right - turning - crouching - aiming up - frame 2
; 98h: Facing left  - turning - crouching - aiming up - frame 0
; 9Ch: Facing right - turning - standing - aiming up-right - frame 2
; 9Dh: Facing left  - turning - standing - aiming up-left - frame 0
; 9Eh: Facing right - turning - in air - aiming up-right - frame 2
; 9Fh: Facing left  - turning - in air - aiming up-left - frame 0
; A0h: Facing right - turning - falling - aiming up-right - frame 2
; A1h: Facing left  - turning - falling - aiming up-left - frame 0
; A2h: Facing right - turning - crouching - aiming up-right - frame 2
; A3h: Facing left  - turning - crouching - aiming up-left - frame 0
; C1h: Facing right - moonwalking - turn/jump left  - aiming up-right - frame 2
; C2h: Facing left  - moonwalking - turn/jump right - aiming up-left - frame 0
incbin "../data/SamusTiles_Top_Set1_Entry8.bin" ; $120 bytes


;;; $B080: Samus top tiles - set 1 - entry 9 ;;;
SamusTiles_Top_Set1_Entry9:
; 8Bh: Facing right - turning - standing - aiming up - frame 0
; 8Ch: Facing left  - turning - standing - aiming up - frame 2
; 8Fh: Facing right - turning - in air - aiming up - frame 0
; 90h: Facing left  - turning - in air - aiming up - frame 2
; 93h: Facing right - turning - falling - aiming up - frame 0
; 94h: Facing left  - turning - falling - aiming up - frame 2
; 97h: Facing right - turning - crouching - aiming up - frame 0
; 98h: Facing left  - turning - crouching - aiming up - frame 2
; 9Ch: Facing right - turning - standing - aiming up-right - frame 0
; 9Dh: Facing left  - turning - standing - aiming up-left - frame 2
; 9Eh: Facing right - turning - in air - aiming up-right - frame 0
; 9Fh: Facing left  - turning - in air - aiming up-left - frame 2
; A0h: Facing right - turning - falling - aiming up-right - frame 0
; A1h: Facing left  - turning - falling - aiming up-left - frame 2
; A2h: Facing right - turning - crouching - aiming up-right - frame 0
; A3h: Facing left  - turning - crouching - aiming up-left - frame 2
; C1h: Facing right - moonwalking - turn/jump left  - aiming up-right - frame 0
; C2h: Facing left  - moonwalking - turn/jump right - aiming up-left - frame 2
incbin "../data/SamusTiles_Top_Set1_Entry9.bin" ; $140 bytes


;;; $B180: Samus top tiles - set 1 - entry Ah ;;;
SamusTiles_Top_Set1_EntryA:
; 25h: Facing right - turning - standing - frame 1
; 26h: Facing left  - turning - standing - frame 1
; 2Fh: Facing right - turning - jumping - frame 1
; 30h: Facing left  - turning - jumping - frame 1
; 43h: Facing right - turning - crouching - frame 1
; 44h: Facing left  - turning - crouching - frame 1
; 87h: Facing right - turning - falling - frame 1
; 88h: Facing left  - turning - falling - frame 1
; BFh: Facing right - moonwalking - turn/jump left - frame 1
; C0h: Facing left  - moonwalking - turn/jump right - frame 1
; C6h: Unused - frame 1
incbin "../data/SamusTiles_Top_Set1_EntryA.bin" ; $1A0 bytes


;;; $B320: Samus top tiles - set 1 - entry Bh ;;;
SamusTiles_Top_Set1_EntryB:
; 5Ch: Unused - frame 0
; 64h: Unused. Related to movement type Dh - frame 1
; B9h: Facing right - grapple wall jump pose - frame 0
incbin "../data/SamusTiles_Top_Set1_EntryB.bin" ; $180 bytes


;;; $B4A0: Samus top tiles - set 1 - entry Ch ;;;
SamusTiles_Top_Set1_EntryC:
; 45h: Unused - frame 0
; 46h: Unused - frame 0
; 5Bh: Unused - frame 0
; 63h: Unused. Related to movement type Dh - frame 1
; B8h: Facing left  - grapple wall jump pose - frame 0
incbin "../data/SamusTiles_Top_Set1_EntryC.bin" ; $180 bytes


;;; $B620: Samus top tiles - set 1 - entry Dh ;;;
SamusTiles_Top_Set1_EntryD:
; 9: Moving right - not aiming - frame 1
incbin "../data/SamusTiles_Top_Set1_EntryD.bin" ; $100 bytes


;;; $B720: Samus top tiles - set 1 - entry Eh ;;;
SamusTiles_Top_Set1_EntryE:
; 9: Moving right - not aiming - frame 6
incbin "../data/SamusTiles_Top_Set1_EntryE.bin" ; $100 bytes


;;; $B820: Samus top tiles - set 1 - entry Fh ;;;
SamusTiles_Top_Set1_EntryF:
; Ah: Moving left  - not aiming - frame 1
incbin "../data/SamusTiles_Top_Set1_EntryF.bin" ; $100 bytes


;;; $B920: Samus top tiles - set 1 - entry 10h ;;;
SamusTiles_Top_Set1_Entry10:
; Ah: Moving left  - not aiming - frame 6
incbin "../data/SamusTiles_Top_Set1_Entry10.bin" ; $100 bytes


;;; $BA20: Samus top tiles - set 1 - entry 11h ;;;
SamusTiles_Top_Set1_Entry11:
; 0: Facing forward - power suit - frame 0
incbin "../data/SamusTiles_Top_Set1_Entry11.bin" ; $100 bytes


;;; $BB20: Samus top tiles - set 1 - entry 12h ;;;
SamusTiles_Top_Set1_Entry12:
; 65h: Unused. Related to movement type Dh - frame 0
; 83h: Facing right - wall jump - frame 0
incbin "../data/SamusTiles_Top_Set1_Entry12.bin" ; $100 bytes


;;; $BC20: Samus top tiles - set 1 - entry 13h ;;;
SamusTiles_Top_Set1_Entry13:
; 66h: Unused. Related to movement type Dh - frame 0
; 84h: Facing left  - wall jump - frame 0
incbin "../data/SamusTiles_Top_Set1_Entry13.bin" ; $100 bytes


;;; $BD20: Samus top tiles - set 1 - entry 14h ;;;
SamusTiles_Top_Set1_Entry14:
; 63h: Unused. Related to movement type Dh - frame 0
; C9h: Facing right - shinespark - horizontal - frame 0
; CDh: Facing right - shinespark - diagonal - frame 0
incbin "../data/SamusTiles_Top_Set1_Entry14.bin" ; $1C0 bytes


;;; $BEE0: Samus top tiles - set 1 - entry 15h ;;;
SamusTiles_Top_Set1_Entry15:
; 64h: Unused. Related to movement type Dh - frame 0
; CAh: Facing left  - shinespark - horizontal - frame 0
; CEh: Facing left  - shinespark - diagonal - frame 0
incbin "../data/SamusTiles_Top_Set1_Entry15.bin" ; $1C0 bytes


;;; $C0A0: Samus top tiles - set 1 - entry 16h ;;;
SamusTiles_Top_Set1_Entry16:
; Unused
incbin "../data/SamusTiles_Top_Set1_Entry16.bin" ; $20 bytes


;;; $C0C0: Samus top tiles - set 1 - entry 17h ;;;
SamusTiles_Top_Set1_Entry17:
; Unused
incbin "../data/SamusTiles_Top_Set1_Entry17.bin" ; $20 bytes


;;; $C0E0: Samus top tiles - set 1 - entry 18h ;;;
SamusTiles_Top_Set1_Entry18:
; 8Dh: Facing right - turning - standing - aiming down-right - frame 2
; 8Eh: Facing left  - turning - standing - aiming down-left - frame 0
; 91h: Facing right - turning - in air - aiming down/down-right - frame 2
; 92h: Facing left  - turning - in air - aiming down/down-left - frame 0
; 95h: Facing right - turning - falling - aiming down/down-right - frame 2
; 96h: Facing left  - turning - falling - aiming down/down-left - frame 0
; 99h: Facing right - turning - crouching - aiming down/down-right - frame 2
; 9Ah: Facing left  - turning - crouching - aiming down/down-left - frame 0
; C3h: Facing right - moonwalking - turn/jump left  - aiming down-right - frame 2
; C4h: Facing left  - moonwalking - turn/jump right - aiming down-left - frame 0
incbin "../data/SamusTiles_Top_Set1_Entry18.bin" ; $120 bytes


;;; $C200: Samus top tiles - set 1 - entry 19h ;;;
SamusTiles_Top_Set1_Entry19:
; 8Dh: Facing right - turning - standing - aiming down-right - frame 0
; 8Eh: Facing left  - turning - standing - aiming down-left - frame 2
; 91h: Facing right - turning - in air - aiming down/down-right - frame 0
; 92h: Facing left  - turning - in air - aiming down/down-left - frame 2
; 95h: Facing right - turning - falling - aiming down/down-right - frame 0
; 96h: Facing left  - turning - falling - aiming down/down-left - frame 2
; 99h: Facing right - turning - crouching - aiming down/down-right - frame 0
; 9Ah: Facing left  - turning - crouching - aiming down/down-left - frame 2
; C3h: Facing right - moonwalking - turn/jump left  - aiming down-right - frame 0
; C4h: Facing left  - moonwalking - turn/jump right - aiming down-left - frame 2
incbin "../data/SamusTiles_Top_Set1_Entry19.bin" ; $120 bytes


;;; $C320: Samus top tiles - set 1 - entry 1Ah ;;;
SamusTiles_Top_Set1_Entry1A:
; 17h: Facing right - normal jump - aiming down - frame 1
; 2Dh: Facing right - falling - aiming down - frame 1
; AEh: Unused. Facing right - grappling - in air - aiming down - frame 1
incbin "../data/SamusTiles_Top_Set1_Entry1A.bin" ; $140 bytes


;;; $C460: Samus top tiles - set 1 - entry 1Bh ;;;
SamusTiles_Top_Set1_Entry1B:
; 18h: Facing left  - normal jump - aiming down - frame 1
; 2Eh: Facing left  - falling - aiming down - frame 1
; AFh: Unused. Facing left  - grappling - in air - aiming down - frame 1
incbin "../data/SamusTiles_Top_Set1_Entry1B.bin" ; $140 bytes


;;; $C5A0: Samus top tiles - set 1 - entry 1Ch ;;;
SamusTiles_Top_Set1_Entry1C:
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
incbin "../data/SamusTiles_Top_Set1_Entry1C.bin" ; $140 bytes


;;; $C6E0: Samus top tiles - set 1 - entry 1Dh ;;;
SamusTiles_Top_Set1_Entry1D:
; 1Ah: Facing left  - spin jump - frame Bh
; 1Ch: Facing left  - space jump - frame Bh
; 82h: Facing left  - screw attack - frame 1Bh
incbin "../data/SamusTiles_Top_Set1_Entry1D.bin" ; $140 bytes


;;; $C820: Samus top tiles - set 2 - entry 0 ;;;
SamusTiles_Top_Set2_Entry0:
; 4Bh: Facing right - normal jump transition - frame 0
; A4h: Facing right - landing from normal jump - frame 0
; A6h: Facing right - landing from spin jump - frame 1
incbin "../data/SamusTiles_Top_Set2_Entry0.bin" ; $C0 bytes


;;; $C8E0: Samus top tiles - set 2 - entry 1 ;;;
SamusTiles_Top_Set2_Entry1:
; 4Ch: Facing left  - normal jump transition - frame 0
; A5h: Facing left  - landing from normal jump - frame 0
; A7h: Facing left  - landing from spin jump - frame 1
incbin "../data/SamusTiles_Top_Set2_Entry1.bin" ; $100 bytes


;;; $C9E0: Samus top tiles - set 2 - entry 2 ;;;
SamusTiles_Top_Set2_Entry2:
; Unused
incbin "../data/SamusTiles_Top_Set2_Entry2.bin" ; $140 bytes


;;; $CB20: Samus top tiles - set 2 - entry 3 ;;;
SamusTiles_Top_Set2_Entry3:
; E9h: Facing left  - Samus drained - crouching/falling - frame 10h
; E9h: Facing left  - Samus drained - crouching/falling - frame 15h
incbin "../data/SamusTiles_Top_Set2_Entry3.bin" ; $100 bytes


;;; $CC20: Samus top tiles - set 2 - entry 4 ;;;
SamusTiles_Top_Set2_Entry4:
; 19h: Facing right - spin jump - frame 0
; 1Bh: Facing right - space jump - frame 0
; 20h: Unused - frame 0
; 21h: Unused - frame 0
; 22h: Unused - frame 0
; 23h: Unused - frame 0
; 24h: Unused - frame 0
; 29h: Facing right - falling - frame 0
; 29h: Facing right - falling - frame 6
; 33h: Unused - frame 0
; 34h: Unused - frame 0
; 39h: Unused - frame 0
; 3Ah: Unused - frame 0
; 42h: Unused - frame 0
; 50h: Facing right - damage boost - frames 0..1
; 81h: Facing right - screw attack - frame 0
; 83h: Facing right - wall jump - frame 1
; A4h: Facing right - landing from normal jump - frame 1
; A6h: Facing right - landing from spin jump - frame 0
; A6h: Facing right - landing from spin jump - frame 2
; ECh: Facing right - grabbed by Draygon - not moving - not aiming - frame 0
incbin "../data/SamusTiles_Top_Set2_Entry4.bin" ; $C0 bytes


;;; $CCE0: Samus top tiles - set 2 - entry 5 ;;;
SamusTiles_Top_Set2_Entry5:
; 1Ah: Facing left  - spin jump - frame 0
; 1Ch: Facing left  - space jump - frame 0
; 2Ah: Facing left  - falling - frame 0
; 2Ah: Facing left  - falling - frame 6
; 4Fh: Facing left  - damage boost - frames 0..1
; 82h: Facing left  - screw attack - frame 0
; 84h: Facing left  - wall jump - frame 1
; A5h: Facing left  - landing from normal jump - frame 1
; A7h: Facing left  - landing from spin jump - frame 0
; A7h: Facing left  - landing from spin jump - frame 2
; BAh: Facing left  - grabbed by Draygon - not moving - not aiming - frame 0
incbin "../data/SamusTiles_Top_Set2_Entry5.bin" ; $100 bytes


;;; $CDE0: Samus top tiles - set 2 - entry 6 ;;;
SamusTiles_Top_Set2_Entry6:
; 11h: Moving right - aiming down-right - frame 2
; 11h: Moving right - aiming down-right - frame 4
; 11h: Moving right - aiming down-right - frame 7
; 11h: Moving right - aiming down-right - frame 9
; 78h: Facing right - moonwalk - aiming down-right - frames 1..2
; 78h: Facing right - moonwalk - aiming down-right - frames 4..5
incbin "../data/SamusTiles_Top_Set2_Entry6.bin" ; $120 bytes


;;; $CF00: Samus top tiles - set 2 - entry 7 ;;;
SamusTiles_Top_Set2_Entry7:
; 12h: Moving left  - aiming down-left - frame 2
; 12h: Moving left  - aiming down-left - frame 4
; 12h: Moving left  - aiming down-left - frame 7
; 12h: Moving left  - aiming down-left - frame 9
; 77h: Facing left  - moonwalk - aiming down-left - frames 1..2
; 77h: Facing left  - moonwalk - aiming down-left - frames 4..5
incbin "../data/SamusTiles_Top_Set2_Entry7.bin" ; $120 bytes


;;; $D020: Samus top tiles - set 2 - entry 8 ;;;
SamusTiles_Top_Set2_Entry8:
; D5h: Facing right - x-ray - standing - frame 1
; D9h: Facing right - x-ray - crouching - frame 1
incbin "../data/SamusTiles_Top_Set2_Entry8.bin" ; $100 bytes


;;; $D120: Samus top tiles - set 2 - entry 9 ;;;
SamusTiles_Top_Set2_Entry9:
; D5h: Facing right - x-ray - standing - frame 0
; D9h: Facing right - x-ray - crouching - frame 0
incbin "../data/SamusTiles_Top_Set2_Entry9.bin" ; $100 bytes


;;; $D220: Samus top tiles - set 2 - entry Ah ;;;
SamusTiles_Top_Set2_EntryA:
; D5h: Facing right - x-ray - standing - frame 3
; D9h: Facing right - x-ray - crouching - frame 3
incbin "../data/SamusTiles_Top_Set2_EntryA.bin" ; $100 bytes


;;; $D320: Samus top tiles - set 2 - entry Bh ;;;
SamusTiles_Top_Set2_EntryB:
; D5h: Facing right - x-ray - standing - frame 4
; D9h: Facing right - x-ray - crouching - frame 4
incbin "../data/SamusTiles_Top_Set2_EntryB.bin" ; $100 bytes


;;; $D420: Samus top tiles - set 2 - entry Ch ;;;
SamusTiles_Top_Set2_EntryC:
; D6h: Facing left  - x-ray - standing - frame 1
; DAh: Facing left  - x-ray - crouching - frame 1
incbin "../data/SamusTiles_Top_Set2_EntryC.bin" ; $100 bytes


;;; $D520: Samus top tiles - set 2 - entry Dh ;;;
SamusTiles_Top_Set2_EntryD:
; D6h: Facing left  - x-ray - standing - frame 0
; DAh: Facing left  - x-ray - crouching - frame 0
incbin "../data/SamusTiles_Top_Set2_EntryD.bin" ; $100 bytes


;;; $D620: Samus top tiles - set 2 - entry Eh ;;;
SamusTiles_Top_Set2_EntryE:
; Dh: Moving right - aiming up (unused) - frame 2
; Dh: Moving right - aiming up (unused) - frame 4
; Dh: Moving right - aiming up (unused) - frame 7
; Dh: Moving right - aiming up (unused) - frame 9
; D6h: Facing left  - x-ray - standing - frame 3
; DAh: Facing left  - x-ray - crouching - frame 3
incbin "../data/SamusTiles_Top_Set2_EntryE.bin" ; $100 bytes


;;; $D720: Samus top tiles - set 2 - entry Fh ;;;
SamusTiles_Top_Set2_EntryF:
; Eh: Moving left  - aiming up (unused) - frame 2
; Eh: Moving left  - aiming up (unused) - frame 4
; Eh: Moving left  - aiming up (unused) - frame 7
; Eh: Moving left  - aiming up (unused) - frame 9
; D6h: Facing left  - x-ray - standing - frame 4
; DAh: Facing left  - x-ray - crouching - frame 4
incbin "../data/SamusTiles_Top_Set2_EntryF.bin" ; $100 bytes


;;; $D820: Samus top tiles - set 2 - entry 10h ;;;
SamusTiles_Top_Set2_Entry10:
; Fh: Moving right - aiming up-right - frame 2
; Fh: Moving right - aiming up-right - frame 4
; Fh: Moving right - aiming up-right - frame 7
; Fh: Moving right - aiming up-right - frame 9
; 76h: Facing right - moonwalk - aiming up-right - frames 1..2
; 76h: Facing right - moonwalk - aiming up-right - frames 4..5
incbin "../data/SamusTiles_Top_Set2_Entry10.bin" ; $100 bytes


;;; $D920: Samus top tiles - set 2 - entry 11h ;;;
SamusTiles_Top_Set2_Entry11:
; 10h: Moving left  - aiming up-left - frame 2
; 10h: Moving left  - aiming up-left - frame 4
; 10h: Moving left  - aiming up-left - frame 7
; 10h: Moving left  - aiming up-left - frame 9
; 75h: Facing left  - moonwalk - aiming up-left - frames 1..2
; 75h: Facing left  - moonwalk - aiming up-left - frames 4..5
incbin "../data/SamusTiles_Top_Set2_Entry11.bin" ; $120 bytes


;;; $DA40: Samus top tiles - set 2 - entry 12h ;;;
SamusTiles_Top_Set2_Entry12:
; Unused
incbin "../data/SamusTiles_Top_Set2_Entry12.bin" ; $140 bytes


;;; $DB80: Samus top tiles - set 2 - entry 13h ;;;
SamusTiles_Top_Set2_Entry13:
; Unused
incbin "../data/SamusTiles_Top_Set2_Entry13.bin" ; $140 bytes


;;; $DCC0: Samus top tiles - set 2 - entry 14h ;;;
SamusTiles_Top_Set2_Entry14:
; Unused
incbin "../data/SamusTiles_Top_Set2_Entry14.bin" ; $140 bytes


;;; $DE00: Samus top tiles - set 2 - entry 15h ;;;
SamusTiles_Top_Set2_Entry15:
; Unused
incbin "../data/SamusTiles_Top_Set2_Entry15.bin" ; $140 bytes


;;; $DF40: Samus top tiles - set 2 - entry 16h ;;;
SamusTiles_Top_Set2_Entry16:
; Fh: Moving right - aiming up-right - frame 3
; Fh: Moving right - aiming up-right - frame 8
incbin "../data/SamusTiles_Top_Set2_Entry16.bin" ; $100 bytes


;;; $E040: Samus top tiles - set 2 - entry 17h ;;;
SamusTiles_Top_Set2_Entry17:
; 10h: Moving left  - aiming up-left - frame 3
; 10h: Moving left  - aiming up-left - frame 8
incbin "../data/SamusTiles_Top_Set2_Entry17.bin" ; $120 bytes


;;; $E160: Samus top tiles - set 2 - entry 18h ;;;
SamusTiles_Top_Set2_Entry18:
; 11h: Moving right - aiming down-right - frame 3
; 11h: Moving right - aiming down-right - frame 8
incbin "../data/SamusTiles_Top_Set2_Entry18.bin" ; $120 bytes


;;; $E280: Samus top tiles - set 2 - entry 19h ;;;
SamusTiles_Top_Set2_Entry19:
; 12h: Moving left  - aiming down-left - frame 3
; 12h: Moving left  - aiming down-left - frame 8
incbin "../data/SamusTiles_Top_Set2_Entry19.bin" ; $120 bytes


;;; $E3A0: Samus top tiles - set 2 - entry 1Ah ;;;
SamusTiles_Top_Set2_Entry1A:
; 4Ah: Facing right - moonwalk - frames 1..2
; 4Ah: Facing right - moonwalk - frames 4..5
incbin "../data/SamusTiles_Top_Set2_Entry1A.bin" ; $100 bytes


;;; $E4A0: Samus top tiles - set 2 - entry 1Bh ;;;
SamusTiles_Top_Set2_Entry1B:
; 49h: Facing left  - moonwalk - frames 1..2
; 49h: Facing left  - moonwalk - frames 4..5
incbin "../data/SamusTiles_Top_Set2_Entry1B.bin" ; $100 bytes


;;; $E5A0: Samus top tiles - set 2 - entry 1Ch ;;;
SamusTiles_Top_Set2_Entry1C:
; 29h: Facing right - falling - frame 1
; 29h: Facing right - falling - frame 5
incbin "../data/SamusTiles_Top_Set2_Entry1C.bin" ; $120 bytes


;;; $E6C0: Samus top tiles - set 2 - entry 1Dh ;;;
SamusTiles_Top_Set2_Entry1D:
; 29h: Facing right - falling - frame 2
; 50h: Facing right - damage boost - frame 9
incbin "../data/SamusTiles_Top_Set2_Entry1D.bin" ; $100 bytes


;;; $E7C0: Samus top tiles - set 2 - entry 1Eh ;;;
SamusTiles_Top_Set2_Entry1E:
; Dh: Moving right - aiming up (unused) - frame 3
; Dh: Moving right - aiming up (unused) - frame 8
; 2Ah: Facing left  - falling - frame 1
; 2Ah: Facing left  - falling - frame 5
incbin "../data/SamusTiles_Top_Set2_Entry1E.bin" ; $100 bytes


;;; $E8C0: Samus top tiles - set 2 - entry 1Fh ;;;
SamusTiles_Top_Set2_Entry1F:
; Eh: Moving left  - aiming up (unused) - frame 3
; Eh: Moving left  - aiming up (unused) - frame 8
; 2Ah: Facing left  - falling - frame 2
; 4Fh: Facing left  - damage boost - frame 9
incbin "../data/SamusTiles_Top_Set2_Entry1F.bin" ; $100 bytes


;;; $E9C0: Samus bottom tiles - set 3 - entry 0 ;;;
UNUSED_SamusTiles_Bottom_Set3_Entry0_9EE9C0:
; Unused
incbin "../data/UNUSED_SamusTiles_Bottom_Set3_Entry0_9EE9C0.bin" ; $80 bytes


if !FEATURE_KEEP_UNREFERENCED
;;; $EA40: Samus bottom tiles - set 3 - entry 1 ;;;
UNUSED_SamusTiles_Bottom_Set3_Entry1_9EEA40:
; Unused
incbin "../data/UNUSED_SamusTiles_Bottom_Set3_Entry1_9EEA40.bin" ; $100 bytes


;;; $EB40: Samus bottom tiles - set 3 - entry 2 ;;;
UNUSED_SamusTiles_Bottom_Set3_Entry2_9EEB40:
; Unused
incbin "../data/UNUSED_SamusTiles_Bottom_Set3_Entry2_9EEB40.bin" ; $80 bytes


;;; $EBC0: Samus bottom tiles - set 3 - entry 3 ;;;
UNUSED_SamusTiles_Bottom_Set3_Entry3_9EEBC0:
; Unused
incbin "../data/UNUSED_SamusTiles_Bottom_Set3_Entry3_9EEBC0.bin" ; $100 bytes


;;; $ECC0: Samus bottom tiles - set 3 - entry 4 ;;;
UNUSED_SamusTiles_Bottom_Set3_Entry4_9EECC0:
incbin "../data/UNUSED_SamusTiles_Bottom_Set3_Entry4_9EECC0.bin" ; $80 bytes


;;; $ED40: Samus bottom tiles - set 3 - entry 5 ;;;
UNUSED_SamusTiles_Bottom_Set3_Entry5_9EED40:
; Unused
incbin "../data/UNUSED_SamusTiles_Bottom_Set3_Entry5_9EED40.bin" ; $100 bytes


;;; $EE40: Samus bottom tiles - set 3 - entry 6 ;;;
UNUSED_SamusTiles_Bottom_Set3_Entry6_9EEE40:
; Unused
incbin "../data/UNUSED_SamusTiles_Bottom_Set3_Entry6_9EEE40.bin" ; $80 bytes


;;; $EEC0: Samus bottom tiles - set 3 - entry 7 ;;;
UNUSED_SamusTiles_Bottom_Set3_Entry7_9EEEC0:
; Unused
incbin "../data/UNUSED_SamusTiles_Bottom_Set3_Entry7_9EEEC0.bin" ; $100 bytes


;;; $EFC0: Samus bottom tiles - set 3 - entry 8 ;;;
UNUSED_SamusTiles_Bottom_Set3_Entry8_9EEFC0:
; Unused
incbin "../data/UNUSED_SamusTiles_Bottom_Set3_Entry8_9EEFC0.bin" ; $80 bytes


;;; $F040: Samus bottom tiles - set 3 - entry 9 ;;;
UNUSED_SamusTiles_Bottom_Set3_Entry9_9EF040:
; Unused
incbin "../data/UNUSED_SamusTiles_Bottom_Set3_Entry9_9EF040.bin" ; $100 bytes


;;; $F140: Samus bottom tiles - set 3 - entry Ah ;;;
UNUSED_SamusTiles_Bottom_Set3_EntryA_9EF140:
; Unused
incbin "../data/UNUSED_SamusTiles_Bottom_Set3_EntryA_9EF140.bin" ; $80 bytes


;;; $F1C0: Samus bottom tiles - set 3 - entry Bh ;;;
UNUSED_SamusTiles_Bottom_Set3_EntryB_9EF1C0:
; Unused
incbin "../data/UNUSED_SamusTiles_Bottom_Set3_EntryB_9EF1C0.bin" ; $100 bytes


;;; $F2C0: Samus bottom tiles - set 3 - entry Ch ;;;
UNUSED_SamusTiles_Bottom_Set3_EntryC_9EF2C0:
; Unused
incbin "../data/UNUSED_SamusTiles_Bottom_Set3_EntryC_9EF2C0.bin" ; $80 bytes


;;; $F340: Samus bottom tiles - set 3 - entry Dh ;;;
UNUSED_SamusTiles_Bottom_Set3_EntryD_9EF340:
; Unused
incbin "../data/UNUSED_SamusTiles_Bottom_Set3_EntryD_9EF340.bin" ; $100 bytes


;;; $F440: Samus bottom tiles - set 3 - entry Eh ;;;
UNUSED_SamusTiles_Bottom_Set3_EntryE_9EF440:
; Unused
incbin "../data/UNUSED_SamusTiles_Bottom_Set3_EntryE_9EF440.bin" ; $80 bytes


;;; $F4C0: Samus bottom tiles - set 3 - entry Fh ;;;
UNUSED_SamusTiles_Bottom_Set3_EntryF_9EF4C0:
; Unused
incbin "../data/UNUSED_SamusTiles_Bottom_Set3_EntryF_9EF4C0.bin" ; $100 bytes


;;; $F5C0: Samus bottom tiles - set 3 - entry 10h ;;;
UNUSED_SamusTiles_Bottom_Set3_Entry10_9EF5C0:
; Unused
incbin "../data/UNUSED_SamusTiles_Bottom_Set3_Entry10_9EF5C0.bin" ; $100 bytes
endif ; !FEATURE_KEEP_UNREFERENCED


Freespace_Bank9E_F6C0:                                                   ;9EF6C0;
; $940 bytes
