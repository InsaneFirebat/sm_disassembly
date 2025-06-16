
org $8C8000


if !FEATURE_KEEP_UNREFERENCED
;;; $8000: Unused. Beta Metroid logo ;;;
UNUSED_TitleSequenceSpritemaps_BetaMetroidLogo_8C8000:
; The "4 METROID" title logo
    dw $0025
    %spritemapEntry(0, $50, $E8, 0, 0, 3, 0, $1C0)
    %spritemapEntry(0, $50, $10, 0, 0, 3, 0, $1B6)
    %spritemapEntry(0, $50, $08, 0, 0, 3, 0, $1A6)
    %spritemapEntry(0, $50, $00, 0, 0, 3, 0, $196)
    %spritemapEntry(0, $50, $F8, 0, 0, 3, 0, $186)
    %spritemapEntry(1, $4240, $08, 0, 0, 3, 0, $1A4)
    %spritemapEntry(1, $4230, $08, 0, 0, 3, 0, $1A2)
    %spritemapEntry(1, $4220, $08, 0, 0, 3, 0, $1A0)
    %spritemapEntry(1, $4240, $F8, 0, 0, 3, 0, $184)
    %spritemapEntry(1, $4230, $F8, 0, 0, 3, 0, $182)
    %spritemapEntry(1, $4220, $F8, 0, 0, 3, 0, $180)
    %spritemapEntry(1, $4240, $E8, 0, 0, 3, 0, $164)
    %spritemapEntry(1, $4230, $E8, 0, 0, 3, 0, $162)
    %spritemapEntry(1, $4220, $E8, 0, 0, 3, 0, $160)
    %spritemapEntry(1, $4210, $E8, 0, 0, 3, 0, $10E)
    %spritemapEntry(1, $4200, $E8, 0, 0, 3, 0, $10C)
    %spritemapEntry(1, $43F0, $E8, 0, 0, 3, 0, $10A)
    %spritemapEntry(1, $43E0, $E8, 0, 0, 3, 0, $108)
    %spritemapEntry(1, $43D0, $E8, 0, 0, 3, 0, $106)
    %spritemapEntry(1, $43C0, $E8, 0, 0, 3, 0, $104)
    %spritemapEntry(1, $43B0, $E8, 0, 0, 3, 0, $102)
    %spritemapEntry(1, $4210, $08, 0, 0, 3, 0, $14E)
    %spritemapEntry(1, $4200, $08, 0, 0, 3, 0, $14C)
    %spritemapEntry(1, $43F0, $08, 0, 0, 3, 0, $14A)
    %spritemapEntry(1, $43E0, $08, 0, 0, 3, 0, $148)
    %spritemapEntry(1, $43D0, $08, 0, 0, 3, 0, $146)
    %spritemapEntry(1, $43C0, $08, 0, 0, 3, 0, $144)
    %spritemapEntry(1, $43B0, $08, 0, 0, 3, 0, $142)
    %spritemapEntry(1, $43A0, $08, 0, 0, 3, 0, $140)
    %spritemapEntry(1, $4210, $F8, 0, 0, 3, 0, $12E)
    %spritemapEntry(1, $4200, $F8, 0, 0, 3, 0, $12C)
    %spritemapEntry(1, $43F0, $F8, 0, 0, 3, 0, $12A)
    %spritemapEntry(1, $43E0, $F8, 0, 0, 3, 0, $128)
    %spritemapEntry(1, $43D0, $F8, 0, 0, 3, 0, $126)
    %spritemapEntry(1, $43C0, $F8, 0, 0, 3, 0, $124)
    %spritemapEntry(1, $43B0, $F8, 0, 0, 3, 0, $122)
    %spritemapEntry(1, $43A0, $F8, 0, 0, 3, 0, $120)
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $80BB: Nintendo boot logo ;;;
TitleSequenceSpritemaps_NintendoBootLogo:
;  _________
; (Nintendo®️)
;  ¯¯¯¯¯¯¯¯¯
    dw $000E
    %spritemapEntry(1, $4230, $00, 0, 0, 3, 0, $CC)
    %spritemapEntry(1, $4220, $00, 0, 0, 3, 0, $CA)
    %spritemapEntry(1, $4210, $00, 0, 0, 3, 0, $C8)
    %spritemapEntry(1, $4200, $00, 0, 0, 3, 0, $C6)
    %spritemapEntry(1, $43F0, $00, 0, 0, 3, 0, $C4)
    %spritemapEntry(1, $43E0, $00, 0, 0, 3, 0, $C2)
    %spritemapEntry(1, $43D0, $00, 0, 0, 3, 0, $C0)
    %spritemapEntry(1, $4230, $F0, 0, 0, 3, 0, $AC)
    %spritemapEntry(1, $4220, $F0, 0, 0, 3, 0, $AA)
    %spritemapEntry(1, $4210, $F0, 0, 0, 3, 0, $A8)
    %spritemapEntry(1, $4200, $F0, 0, 0, 3, 0, $A6)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 0, $A4)
    %spritemapEntry(1, $43E0, $F0, 0, 0, 3, 0, $A2)
    %spritemapEntry(1, $43D0, $F0, 0, 0, 3, 0, $A0)


;;; $8103: Nintendo copyright ;;;
TitleSequenceSpritemaps_NintendoCopyright:
; '©️ 1994 Nintendo'
    dw $000A
    %spritemapEntry(0, $20, $FC, 0, 0, 3, 0, $1CA)
    %spritemapEntry(0, $18, $FC, 0, 0, 3, 0, $1C9)
    %spritemapEntry(0, $10, $FC, 0, 0, 3, 0, $1C8)
    %spritemapEntry(0, $08, $FC, 0, 0, 3, 0, $1C7)
    %spritemapEntry(0, $00, $FC, 0, 0, 3, 0, $1C6)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 0, $1C5)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 3, 0, $1C4)
    %spritemapEntry(0, $1E8, $FC, 0, 0, 3, 0, $1C3)
    %spritemapEntry(0, $1E0, $FC, 0, 0, 3, 0, $1C2)
    %spritemapEntry(0, $1D8, $FC, 0, 0, 3, 0, $1C1)


if !FEATURE_KEEP_UNREFERENCED
;;; $8137: Unused. '1993 R&D1 PRODUCE' ;;;
UNUSED_TitleSequenceSpritemaps_1993RandD1Produce_8C8137:
    dw $001E
    %spritemapEntry(0, $1D4, $00, 0, 0, 3, 1, $111)
    %spritemapEntry(0, $1D4, $F8, 0, 0, 3, 1, $101)
    %spritemapEntry(0, $3C, $00, 0, 0, 3, 1, $17B)
    %spritemapEntry(0, $3C, $F8, 0, 0, 3, 1, $16B)
    %spritemapEntry(0, $34, $00, 0, 0, 3, 1, $179)
    %spritemapEntry(0, $34, $F8, 0, 0, 3, 1, $169)
    %spritemapEntry(0, $2C, $00, 0, 0, 3, 1, $1B9)
    %spritemapEntry(0, $2C, $F8, 0, 0, 3, 1, $1A9)
    %spritemapEntry(0, $24, $00, 0, 0, 3, 1, $17A)
    %spritemapEntry(0, $24, $F8, 0, 0, 3, 1, $16A)
    %spritemapEntry(0, $1C, $00, 0, 0, 3, 1, $19C)
    %spritemapEntry(0, $1C, $F8, 0, 0, 3, 1, $18C)
    %spritemapEntry(0, $14, $00, 0, 0, 3, 1, $19F)
    %spritemapEntry(0, $14, $F8, 0, 0, 3, 1, $18F)
    %spritemapEntry(0, $0C, $00, 0, 0, 3, 1, $19D)
    %spritemapEntry(0, $0C, $F8, 0, 0, 3, 1, $18D)
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 1, $110)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 1, $100)
    %spritemapEntry(0, $1F4, $00, 0, 0, 3, 1, $17A)
    %spritemapEntry(0, $1F4, $F8, 0, 0, 3, 1, $16A)
    %spritemapEntry(0, $1EC, $00, 0, 0, 3, 1, $1BF)
    %spritemapEntry(0, $1EC, $F8, 0, 0, 3, 1, $1AF)
    %spritemapEntry(0, $1E4, $00, 0, 0, 3, 1, $19F)
    %spritemapEntry(0, $1E4, $F8, 0, 0, 3, 1, $18F)
    %spritemapEntry(0, $1CC, $00, 0, 0, 3, 1, $176)
    %spritemapEntry(0, $1CC, $F8, 0, 0, 3, 1, $166)
    %spritemapEntry(0, $1C4, $00, 0, 0, 3, 1, $176)
    %spritemapEntry(0, $1C4, $F8, 0, 0, 3, 1, $166)
    %spritemapEntry(0, $1BC, $00, 0, 0, 3, 1, $110)
    %spritemapEntry(0, $1BC, $F8, 0, 0, 3, 1, $100)


;;; $81CF: Unused. 'PROJECT SAMUS FEATURED IN' ;;;
UNUSED_TitleSequenceSpritemaps_ProjectSamusFeaturedIn_8C81CF:
    dw $002C
    %spritemapEntry(0, $4F, $F8, 0, 0, 3, 1, $17A)
    %spritemapEntry(0, $4F, $F0, 0, 0, 3, 1, $16A)
    %spritemapEntry(0, $48, $F8, 0, 0, 3, 1, $17B)
    %spritemapEntry(0, $48, $F0, 0, 0, 3, 1, $16B)
    %spritemapEntry(0, $40, $F8, 0, 0, 3, 1, $19F)
    %spritemapEntry(0, $40, $F0, 0, 0, 3, 1, $18F)
    %spritemapEntry(0, $38, $F8, 0, 0, 3, 1, $1B9)
    %spritemapEntry(0, $38, $F0, 0, 0, 3, 1, $1A9)
    %spritemapEntry(0, $30, $F8, 0, 0, 3, 1, $1B8)
    %spritemapEntry(0, $30, $F0, 0, 0, 3, 1, $1A8)
    %spritemapEntry(0, $2A, $F8, 0, 0, 3, 1, $177)
    %spritemapEntry(0, $2A, $F0, 0, 0, 3, 1, $167)
    %spritemapEntry(0, $23, $F8, 0, 0, 3, 1, $17B)
    %spritemapEntry(0, $23, $F0, 0, 0, 3, 1, $16B)
    %spritemapEntry(0, $1C, $F8, 0, 0, 3, 1, $17C)
    %spritemapEntry(0, $1C, $F0, 0, 0, 3, 1, $16C)
    %spritemapEntry(0, $1FF, $10, 0, 0, 3, 1, $19B)
    %spritemapEntry(0, $1FF, $08, 0, 0, 3, 1, $18B)
    %spritemapEntry(0, $1F9, $10, 0, 0, 3, 1, $17F)
    %spritemapEntry(0, $1F9, $08, 0, 0, 3, 1, $16F)
    %spritemapEntry(0, $0C, $F8, 0, 0, 3, 1, $1B7)
    %spritemapEntry(0, $0C, $F0, 0, 0, 3, 1, $1A7)
    %spritemapEntry(0, $04, $F8, 0, 0, 3, 1, $1B9)
    %spritemapEntry(0, $04, $F0, 0, 0, 3, 1, $1A9)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 1, $19A)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 3, 1, $18A)
    %spritemapEntry(0, $1F4, $F8, 0, 0, 3, 1, $177)
    %spritemapEntry(0, $1F4, $F0, 0, 0, 3, 1, $167)
    %spritemapEntry(0, $1EC, $F8, 0, 0, 3, 1, $1B7)
    %spritemapEntry(0, $1EC, $F0, 0, 0, 3, 1, $1A7)
    %spritemapEntry(0, $1DC, $F8, 0, 0, 3, 1, $1B8)
    %spritemapEntry(0, $1DC, $F0, 0, 0, 3, 1, $1A8)
    %spritemapEntry(0, $1D5, $F8, 0, 0, 3, 1, $179)
    %spritemapEntry(0, $1D5, $F0, 0, 0, 3, 1, $169)
    %spritemapEntry(0, $1CE, $F8, 0, 0, 3, 1, $17B)
    %spritemapEntry(0, $1CE, $F0, 0, 0, 3, 1, $16B)
    %spritemapEntry(0, $1C6, $F8, 0, 0, 3, 1, $197)
    %spritemapEntry(0, $1C6, $F0, 0, 0, 3, 1, $187)
    %spritemapEntry(0, $1BF, $F8, 0, 0, 3, 1, $19C)
    %spritemapEntry(0, $1BF, $F0, 0, 0, 3, 1, $18C)
    %spritemapEntry(0, $1B7, $F8, 0, 0, 3, 1, $19F)
    %spritemapEntry(0, $1B7, $F0, 0, 0, 3, 1, $18F)
    %spritemapEntry(0, $1AF, $F8, 0, 0, 3, 1, $19D)
    %spritemapEntry(0, $1AF, $F0, 0, 0, 3, 1, $18D)


;;; $82AD: Unused. 'METROID 3' ;;;
UNUSED_TitleSequenceSpritemaps_Metroid3_8C82AD:
    dw $0010
    %spritemapEntry(0, $18, $00, 0, 0, 3, 1, $111)
    %spritemapEntry(0, $18, $F8, 0, 0, 3, 1, $101)
    %spritemapEntry(0, $09, $00, 0, 0, 3, 1, $17A)
    %spritemapEntry(0, $09, $F8, 0, 0, 3, 1, $16A)
    %spritemapEntry(0, $03, $00, 0, 0, 3, 1, $17F)
    %spritemapEntry(0, $03, $F8, 0, 0, 3, 1, $16F)
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 1, $19C)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 1, $18C)
    %spritemapEntry(0, $1F4, $00, 0, 0, 3, 1, $19F)
    %spritemapEntry(0, $1F4, $F8, 0, 0, 3, 1, $18F)
    %spritemapEntry(0, $1EC, $00, 0, 0, 3, 1, $1B8)
    %spritemapEntry(0, $1EC, $F8, 0, 0, 3, 1, $1A8)
    %spritemapEntry(0, $1E6, $00, 0, 0, 3, 1, $17B)
    %spritemapEntry(0, $1E6, $F8, 0, 0, 3, 1, $16B)
    %spritemapEntry(0, $1DE, $00, 0, 0, 3, 1, $19A)
    %spritemapEntry(0, $1DE, $F8, 0, 0, 3, 1, $18A)


;;; $82FF: Unused. '-Nintendo- presents' ;;;
UNUSED_TitleSequenceSpritemaps_NintendoPresents:
    dw $000C
    %spritemapEntry(0, $18, $F8, 0, 0, 3, 0, $1CF)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 0, $1CF)
    %spritemapEntry(0, $08, $00, 0, 0, 3, 0, $1CE)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $1CD)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 0, $1CC)
    %spritemapEntry(0, $1F0, $00, 0, 0, 3, 0, $1CB)
    %spritemapEntry(0, $10, $F8, 0, 0, 3, 0, $1CA)
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 0, $1C9)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $1C8)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $1C7)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 0, $1C6)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 0, $1C5)


;;; $833D: Unused. Incomplete Super Metroid title logo ;;;
UNUSED_TitleSequenceSpritemaps_IncompleteTitleLogo_8C833D:
; Almost identical to TitleSequenceSpritemaps_SuperMetroidTitleLogo, except there's a blank tile placed by the top of the D instead of the TM by the bottom
    dw $0026
    %spritemapEntry(1, $4248, $F0, 0, 0, 3, 2, $0E)
    %spritemapEntry(1, $4238, $F0, 0, 0, 3, 2, $0C)
    %spritemapEntry(1, $4248, $10, 0, 0, 3, 2, $8A)
    %spritemapEntry(1, $4238, $10, 0, 0, 3, 2, $88)
    %spritemapEntry(1, $4228, $10, 0, 0, 3, 2, $86)
    %spritemapEntry(1, $4250, $00, 0, 0, 3, 2, $84)
    %spritemapEntry(1, $4240, $00, 0, 0, 3, 2, $82)
    %spritemapEntry(1, $4230, $00, 0, 0, 3, 2, $80)
    %spritemapEntry(1, $4218, $10, 0, 0, 3, 2, $6E)
    %spritemapEntry(1, $4208, $10, 0, 0, 3, 2, $6C)
    %spritemapEntry(1, $43F8, $10, 0, 0, 3, 2, $6A)
    %spritemapEntry(1, $43E8, $10, 0, 0, 3, 2, $68)
    %spritemapEntry(1, $43D8, $10, 0, 0, 3, 2, $66)
    %spritemapEntry(1, $43C8, $10, 0, 0, 3, 2, $64)
    %spritemapEntry(1, $43B8, $10, 0, 0, 3, 2, $62)
    %spritemapEntry(1, $43A8, $10, 0, 0, 3, 2, $60)
    %spritemapEntry(1, $4220, $00, 0, 0, 3, 2, $4E)
    %spritemapEntry(1, $4210, $00, 0, 0, 3, 2, $4C)
    %spritemapEntry(1, $4200, $00, 0, 0, 3, 2, $4A)
    %spritemapEntry(1, $43F0, $00, 0, 0, 3, 2, $48)
    %spritemapEntry(1, $43E0, $00, 0, 0, 3, 2, $46)
    %spritemapEntry(1, $43D0, $00, 0, 0, 3, 2, $44)
    %spritemapEntry(1, $43C0, $00, 0, 0, 3, 2, $42)
    %spritemapEntry(1, $43B0, $00, 0, 0, 3, 2, $40)
    %spritemapEntry(1, $4228, $F0, 0, 0, 3, 2, $2E)
    %spritemapEntry(1, $4218, $F0, 0, 0, 3, 2, $2C)
    %spritemapEntry(1, $4208, $F0, 0, 0, 3, 2, $2A)
    %spritemapEntry(1, $43F8, $F0, 0, 0, 3, 2, $28)
    %spritemapEntry(1, $43E8, $F0, 0, 0, 3, 2, $26)
    %spritemapEntry(1, $43D8, $F0, 0, 0, 3, 2, $24)
    %spritemapEntry(1, $43C8, $F0, 0, 0, 3, 2, $22)
    %spritemapEntry(1, $43B8, $F0, 0, 0, 3, 2, $20)
    %spritemapEntry(1, $4220, $E0, 0, 0, 3, 2, $0A)
    %spritemapEntry(1, $4210, $E0, 0, 0, 3, 2, $08)
    %spritemapEntry(1, $4200, $E0, 0, 0, 3, 2, $06)
    %spritemapEntry(1, $43F0, $E0, 0, 0, 3, 2, $04)
    %spritemapEntry(1, $43E0, $E0, 0, 0, 3, 2, $02)
    %spritemapEntry(1, $43D0, $E0, 0, 0, 3, 2, $00)


;;; $83FD: Unused. 2x2 tile region ;;;
UNUSED_TitleSequenceSpritemaps_2x2TileRegion_8C83FD:
; Uses the blank rows of the title screen graphics
    dw $0004
    %spritemapEntry(0, $00, $00, 0, 0, 3, 3, $F1)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 3, $F0)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 3, $E1)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 3, $E0)


;;; $8413: Unused. 2x2 tile region ;;;
UNUSED_TitleSequenceSpritemaps_2x2TileRegion_8C8413:
; Uses the blank rows of the title screen graphics
    dw $0004
    %spritemapEntry(0, $00, $00, 0, 0, 3, 3, $F3)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 3, $F2)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 3, $E3)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 3, $E2)


;;; $8429: Unused. 2x2 tile region ;;;
UNUSED_TitleSequenceSpritemaps_2x2TileRegio_8C8429:
; Uses the blank rows of the title screen graphics
    dw $0004
    %spritemapEntry(0, $00, $00, 0, 0, 3, 3, $F5)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 3, $F4)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 3, $E5)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 3, $E4)


;;; $843F: Unused. 5x5 tile region ;;;
UNUSED_TitleSequenceSpritemaps_5x5TileRegion_8C843F:
; If title screen graphics are loaded, co-incidentally overlaps with the right half of the Nintendo boot logo,
; but almost certainly referring to removed graphics
    dw $0019
    %spritemapEntry(0, $10, $08, 0, 0, 3, 2, $FB)
    %spritemapEntry(0, $08, $08, 0, 0, 3, 2, $FA)
    %spritemapEntry(0, $00, $08, 0, 0, 3, 2, $F9)
    %spritemapEntry(0, $1F8, $08, 0, 0, 3, 2, $F8)
    %spritemapEntry(0, $1F0, $08, 0, 0, 3, 2, $F7)
    %spritemapEntry(0, $10, $00, 0, 0, 3, 2, $EB)
    %spritemapEntry(0, $08, $00, 0, 0, 3, 2, $EA)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 2, $E9)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 2, $E8)
    %spritemapEntry(0, $1F0, $00, 0, 0, 3, 2, $E7)
    %spritemapEntry(0, $10, $F8, 0, 0, 3, 2, $DB)
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 2, $DA)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 2, $D9)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 2, $D8)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 2, $D7)
    %spritemapEntry(0, $10, $F0, 0, 0, 3, 2, $CB)
    %spritemapEntry(0, $08, $F0, 0, 0, 3, 2, $CA)
    %spritemapEntry(0, $00, $F0, 0, 0, 3, 2, $C9)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 3, 2, $C8)
    %spritemapEntry(0, $1F0, $F0, 0, 0, 3, 2, $C7)
    %spritemapEntry(0, $10, $E8, 0, 0, 3, 2, $BB)
    %spritemapEntry(0, $08, $E8, 0, 0, 3, 2, $BA)
    %spritemapEntry(0, $00, $E8, 0, 0, 3, 2, $B9)
    %spritemapEntry(0, $1F8, $E8, 0, 0, 3, 2, $B8)
    %spritemapEntry(0, $1F0, $E8, 0, 0, 3, 2, $B7)


;;; $84BE: Unused. 4x5 tile region ;;;
UNUSED_TitleSequenceSpritemaps_4x5TileRegion_8C84BE:
; Uses the blank columns of the title screen graphics
    dw $0014
    %spritemapEntry(0, $08, $08, 0, 0, 3, 2, $FF)
    %spritemapEntry(0, $00, $08, 0, 0, 3, 2, $FE)
    %spritemapEntry(0, $1F8, $08, 0, 0, 3, 2, $FD)
    %spritemapEntry(0, $1F0, $08, 0, 0, 3, 2, $FC)
    %spritemapEntry(0, $08, $00, 0, 0, 3, 2, $EF)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 2, $EE)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 2, $ED)
    %spritemapEntry(0, $1F0, $00, 0, 0, 3, 2, $EC)
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 2, $DF)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 2, $DE)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 2, $DD)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 2, $DC)
    %spritemapEntry(0, $08, $F0, 0, 0, 3, 2, $CF)
    %spritemapEntry(0, $00, $F0, 0, 0, 3, 2, $CE)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 3, 2, $CD)
    %spritemapEntry(0, $1F0, $F0, 0, 0, 3, 2, $CC)
    %spritemapEntry(0, $08, $E8, 0, 0, 3, 2, $BF)
    %spritemapEntry(0, $00, $E8, 0, 0, 3, 2, $BE)
    %spritemapEntry(0, $1F8, $E8, 0, 0, 3, 2, $BD)
    %spritemapEntry(0, $1F0, $E8, 0, 0, 3, 2, $BC)


;;; $8524: Unused. 4x4 tile region ;;;
UNUSED_TitleSequenceSpritemaps_4x4TileRegion:
; If title screen graphics are loaded, co-incidentally overlaps with some of the Super Metroid logo tiles,
; but almost certainly referring to removed graphics
    dw $0010
    %spritemapEntry(0, $08, $08, 0, 0, 3, 2, $93)
    %spritemapEntry(0, $00, $08, 0, 0, 3, 2, $92)
    %spritemapEntry(0, $1F8, $08, 0, 0, 3, 2, $91)
    %spritemapEntry(0, $1F0, $08, 0, 0, 3, 2, $90)
    %spritemapEntry(0, $08, $00, 0, 0, 3, 2, $83)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 2, $82)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 2, $81)
    %spritemapEntry(0, $1F0, $00, 0, 0, 3, 2, $80)
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 2, $73)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 2, $72)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 2, $71)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 2, $70)
    %spritemapEntry(0, $08, $F0, 0, 0, 3, 2, $63)
    %spritemapEntry(0, $00, $F0, 0, 0, 3, 2, $62)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 3, 2, $61)
    %spritemapEntry(0, $1F0, $F0, 0, 0, 3, 2, $60)


;;; $8576: Unused. 4x4 tile region ;;;
UNUSED_TitleSequenceSpritemaps_4x4TileRegion_8C8576:
; If title screen graphics are loaded, co-incidentally overlaps with the left half of the Nintendo boot logo,
; but almost certainly referring to removed graphics
    dw $0010
    %spritemapEntry(0, $08, $08, 0, 0, 3, 2, $D3)
    %spritemapEntry(0, $00, $08, 0, 0, 3, 2, $D2)
    %spritemapEntry(0, $1F8, $08, 0, 0, 3, 2, $D1)
    %spritemapEntry(0, $1F0, $08, 0, 0, 3, 2, $D0)
    %spritemapEntry(0, $08, $00, 0, 0, 3, 2, $C3)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 2, $C2)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 2, $C1)
    %spritemapEntry(0, $1F0, $00, 0, 0, 3, 2, $C0)
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 2, $B3)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 2, $B2)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 2, $B1)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 2, $B0)
    %spritemapEntry(0, $08, $F0, 0, 0, 3, 2, $A3)
    %spritemapEntry(0, $00, $F0, 0, 0, 3, 2, $A2)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 3, 2, $A1)
    %spritemapEntry(0, $1F0, $F0, 0, 0, 3, 2, $A0)
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $85C8: '     METR' ;;;
TitleSequenceSpritemaps_METR:
    dw $0008
    %spritemapEntry(0, $1C, $00, 0, 0, 3, 1, $19F)
    %spritemapEntry(0, $1C, $F8, 0, 0, 3, 1, $18F)
    %spritemapEntry(0, $14, $00, 0, 0, 3, 1, $1B8)
    %spritemapEntry(0, $14, $F8, 0, 0, 3, 1, $1A8)
    %spritemapEntry(0, $0C, $00, 0, 0, 3, 1, $17B)
    %spritemapEntry(0, $0C, $F8, 0, 0, 3, 1, $16B)
    %spritemapEntry(0, $04, $00, 0, 0, 3, 1, $19A)
    %spritemapEntry(0, $04, $F8, 0, 0, 3, 1, $18A)


;;; $85F2: '    METRO' ;;;
TitleSequenceSpritemaps_METRO:
    dw $000A
    %spritemapEntry(0, $1C, $00, 0, 0, 3, 1, $19C)
    %spritemapEntry(0, $1C, $F8, 0, 0, 3, 1, $18C)
    %spritemapEntry(0, $14, $00, 0, 0, 3, 1, $19F)
    %spritemapEntry(0, $14, $F8, 0, 0, 3, 1, $18F)
    %spritemapEntry(0, $0C, $00, 0, 0, 3, 1, $1B8)
    %spritemapEntry(0, $0C, $F8, 0, 0, 3, 1, $1A8)
    %spritemapEntry(0, $04, $00, 0, 0, 3, 1, $17B)
    %spritemapEntry(0, $04, $F8, 0, 0, 3, 1, $16B)
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 1, $19A)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 1, $18A)


if !FEATURE_KEEP_UNREFERENCED
;;; $8626: Unused. Debug Nintendo copyright ;;;
UNUSED_TitleSequenceSpritemaps_DebugNintendoCopyright:
; '©️ 1994 Nintendo'
;    'Ver. 2.00'
    dw $0011
    %spritemapEntry(0, $03, $08, 0, 0, 3, 0, $1F6)
    %spritemapEntry(0, $15, $08, 0, 0, 3, 0, $1F4)
    %spritemapEntry(0, $0D, $08, 0, 0, 3, 0, $1F4)
    %spritemapEntry(0, $08, $08, 0, 0, 3, 0, $1F3)
    %spritemapEntry(0, $1F4, $08, 0, 0, 3, 0, $1F2)
    %spritemapEntry(0, $1EC, $08, 0, 0, 3, 0, $1F1)
    %spritemapEntry(0, $1E4, $08, 0, 0, 3, 0, $1F0)
    %spritemapEntry(0, $20, $FC, 0, 0, 3, 0, $1CA)
    %spritemapEntry(0, $18, $FC, 0, 0, 3, 0, $1C9)
    %spritemapEntry(0, $10, $FC, 0, 0, 3, 0, $1C8)
    %spritemapEntry(0, $08, $FC, 0, 0, 3, 0, $1C7)
    %spritemapEntry(0, $00, $FC, 0, 0, 3, 0, $1C6)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 0, $1C5)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 3, 0, $1C4)
    %spritemapEntry(0, $1E8, $FC, 0, 0, 3, 0, $1C3)
    %spritemapEntry(0, $1E0, $FC, 0, 0, 3, 0, $1C2)
    %spritemapEntry(0, $1D8, $FC, 0, 0, 3, 0, $1C1)
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $867D: '   METROI' ;;;
TitleSequenceSpritemaps_METROI:
    dw $000C
    %spritemapEntry(0, $1C, $00, 0, 0, 3, 1, $17F)
    %spritemapEntry(0, $1C, $F8, 0, 0, 3, 1, $16F)
    %spritemapEntry(0, $14, $00, 0, 0, 3, 1, $19C)
    %spritemapEntry(0, $14, $F8, 0, 0, 3, 1, $18C)
    %spritemapEntry(0, $0C, $00, 0, 0, 3, 1, $19F)
    %spritemapEntry(0, $0C, $F8, 0, 0, 3, 1, $18F)
    %spritemapEntry(0, $04, $00, 0, 0, 3, 1, $1B8)
    %spritemapEntry(0, $04, $F8, 0, 0, 3, 1, $1A8)
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 1, $17B)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 1, $16B)
    %spritemapEntry(0, $1F4, $00, 0, 0, 3, 1, $19A)
    %spritemapEntry(0, $1F4, $F8, 0, 0, 3, 1, $18A)


;;; $86BB: '  METROID' ;;;
TitleSequenceSpritemaps_METROID:
    dw $000E
    %spritemapEntry(0, $1C, $00, 0, 0, 3, 1, $17A)
    %spritemapEntry(0, $1C, $F8, 0, 0, 3, 1, $16A)
    %spritemapEntry(0, $14, $00, 0, 0, 3, 1, $17F)
    %spritemapEntry(0, $14, $F8, 0, 0, 3, 1, $16F)
    %spritemapEntry(0, $0C, $00, 0, 0, 3, 1, $19C)
    %spritemapEntry(0, $0C, $F8, 0, 0, 3, 1, $18C)
    %spritemapEntry(0, $04, $00, 0, 0, 3, 1, $19F)
    %spritemapEntry(0, $04, $F8, 0, 0, 3, 1, $18F)
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 1, $1B8)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 1, $1A8)
    %spritemapEntry(0, $1F4, $00, 0, 0, 3, 1, $17B)
    %spritemapEntry(0, $1F4, $F8, 0, 0, 3, 1, $16B)
    %spritemapEntry(0, $1EC, $00, 0, 0, 3, 1, $19A)
    %spritemapEntry(0, $1EC, $F8, 0, 0, 3, 1, $18A)


;;; $8703: ' METROID ' ;;;
TitleSequenceSpritemaps_METROID_:
    dw $000E
    %spritemapEntry(0, $14, $00, 0, 0, 3, 1, $17A)
    %spritemapEntry(0, $14, $F8, 0, 0, 3, 1, $16A)
    %spritemapEntry(0, $0C, $00, 0, 0, 3, 1, $17F)
    %spritemapEntry(0, $0C, $F8, 0, 0, 3, 1, $16F)
    %spritemapEntry(0, $04, $00, 0, 0, 3, 1, $19C)
    %spritemapEntry(0, $04, $F8, 0, 0, 3, 1, $18C)
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 1, $19F)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 1, $18F)
    %spritemapEntry(0, $1F4, $00, 0, 0, 3, 1, $1B8)
    %spritemapEntry(0, $1F4, $F8, 0, 0, 3, 1, $1A8)
    %spritemapEntry(0, $1EC, $00, 0, 0, 3, 1, $17B)
    %spritemapEntry(0, $1EC, $F8, 0, 0, 3, 1, $16B)
    %spritemapEntry(0, $1E4, $00, 0, 0, 3, 1, $19A)
    %spritemapEntry(0, $1E4, $F8, 0, 0, 3, 1, $18A)


;;; $874B: 'METROID 3' ;;;
TitleSequenceSpritemaps_METROID3:
    dw $0010
    %spritemapEntry(0, $1C, $00, 0, 0, 3, 1, $111)
    %spritemapEntry(0, $1C, $F8, 0, 0, 3, 1, $101)
    %spritemapEntry(0, $0C, $00, 0, 0, 3, 1, $17A)
    %spritemapEntry(0, $0C, $F8, 0, 0, 3, 1, $16A)
    %spritemapEntry(0, $04, $00, 0, 0, 3, 1, $17F)
    %spritemapEntry(0, $04, $F8, 0, 0, 3, 1, $16F)
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 1, $19C)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 1, $18C)
    %spritemapEntry(0, $1F4, $00, 0, 0, 3, 1, $19F)
    %spritemapEntry(0, $1F4, $F8, 0, 0, 3, 1, $18F)
    %spritemapEntry(0, $1EC, $00, 0, 0, 3, 1, $1B8)
    %spritemapEntry(0, $1EC, $F8, 0, 0, 3, 1, $1A8)
    %spritemapEntry(0, $1E4, $00, 0, 0, 3, 1, $17B)
    %spritemapEntry(0, $1E4, $F8, 0, 0, 3, 1, $16B)
    %spritemapEntry(0, $1DC, $00, 0, 0, 3, 1, $19A)
    %spritemapEntry(0, $1DC, $F8, 0, 0, 3, 1, $18A)


;;; $879D: Super Metroid title logo ;;;
TitleSequenceSpritemaps_SuperMetroidTitleLogo:
    dw $0027
    %spritemapEntry(0, $58, $18, 0, 0, 3, 2, $9C)
    %spritemapEntry(0, $48, $F8, 0, 0, 3, 2, $1E)
    %spritemapEntry(1, $4238, $F0, 0, 0, 3, 2, $0C)
    %spritemapEntry(1, $4248, $10, 0, 0, 3, 2, $8A)
    %spritemapEntry(1, $4238, $10, 0, 0, 3, 2, $88)
    %spritemapEntry(1, $4228, $10, 0, 0, 3, 2, $86)
    %spritemapEntry(1, $4250, $00, 0, 0, 3, 2, $84)
    %spritemapEntry(1, $4240, $00, 0, 0, 3, 2, $82)
    %spritemapEntry(1, $4230, $00, 0, 0, 3, 2, $80)
    %spritemapEntry(1, $4218, $10, 0, 0, 3, 2, $6E)
    %spritemapEntry(1, $4208, $10, 0, 0, 3, 2, $6C)
    %spritemapEntry(1, $43F8, $10, 0, 0, 3, 2, $6A)
    %spritemapEntry(1, $43E8, $10, 0, 0, 3, 2, $68)
    %spritemapEntry(1, $43D8, $10, 0, 0, 3, 2, $66)
    %spritemapEntry(1, $43C8, $10, 0, 0, 3, 2, $64)
    %spritemapEntry(1, $43B8, $10, 0, 0, 3, 2, $62)
    %spritemapEntry(1, $43A8, $10, 0, 0, 3, 2, $60)
    %spritemapEntry(1, $4220, $00, 0, 0, 3, 2, $4E)
    %spritemapEntry(1, $4210, $00, 0, 0, 3, 2, $4C)
    %spritemapEntry(1, $4200, $00, 0, 0, 3, 2, $4A)
    %spritemapEntry(1, $43F0, $00, 0, 0, 3, 2, $48)
    %spritemapEntry(1, $43E0, $00, 0, 0, 3, 2, $46)
    %spritemapEntry(1, $43D0, $00, 0, 0, 3, 2, $44)
    %spritemapEntry(1, $43C0, $00, 0, 0, 3, 2, $42)
    %spritemapEntry(1, $43B0, $00, 0, 0, 3, 2, $40)
    %spritemapEntry(1, $4228, $F0, 0, 0, 3, 2, $2E)
    %spritemapEntry(1, $4218, $F0, 0, 0, 3, 2, $2C)
    %spritemapEntry(1, $4208, $F0, 0, 0, 3, 2, $2A)
    %spritemapEntry(1, $43F8, $F0, 0, 0, 3, 2, $28)
    %spritemapEntry(1, $43E8, $F0, 0, 0, 3, 2, $26)
    %spritemapEntry(1, $43D8, $F0, 0, 0, 3, 2, $24)
    %spritemapEntry(1, $43C8, $F0, 0, 0, 3, 2, $22)
    %spritemapEntry(1, $43B8, $F0, 0, 0, 3, 2, $20)
    %spritemapEntry(1, $4220, $E0, 0, 0, 3, 2, $0A)
    %spritemapEntry(1, $4210, $E0, 0, 0, 3, 2, $08)
    %spritemapEntry(1, $4200, $E0, 0, 0, 3, 2, $06)
    %spritemapEntry(1, $43F0, $E0, 0, 0, 3, 2, $04)
    %spritemapEntry(1, $43E0, $E0, 0, 0, 3, 2, $02)
    %spritemapEntry(1, $43D0, $E0, 0, 0, 3, 2, $00)


;;; $8862: '   1' ;;;
TitleSequenceSpritemaps_1:
    dw $0002
    %spritemapEntry(0, $08, $00, 0, 0, 3, 1, $110)
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 1, $100)


;;; $886E: '  19' ;;;
TitleSequenceSpritemaps_19:
    dw $0004
    %spritemapEntry(0, $08, $00, 0, 0, 3, 1, $176)
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 1, $166)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 1, $110)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 1, $100)


;;; $8884: ' 199' ;;;
TitleSequenceSpritemaps_199:
    dw $0006
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 1, $110)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 1, $100)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 1, $176)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 1, $166)
    %spritemapEntry(0, $08, $00, 0, 0, 3, 1, $176)
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 1, $166)


;;; $88A4: '1994' ;;;
TitleSequenceSpritemaps_1994:
    dw $0008
    %spritemapEntry(0, $08, $00, 0, 0, 3, 1, $130)
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 1, $120)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 1, $176)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 1, $166)
    %spritemapEntry(0, $1F0, $00, 0, 0, 3, 1, $110)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 1, $100)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 1, $176)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 1, $166)


;;; $88CE: '       N' ;;;
TitleSequenceSpritemaps_N:
    dw $0002
    %spritemapEntry(0, $18, $00, 0, 0, 3, 1, $19B)
    %spritemapEntry(0, $18, $F8, 0, 0, 3, 1, $18B)


;;; $88DA: '      NI' ;;;
TitleSequenceSpritemaps_NI:
    dw $0004
    %spritemapEntry(0, $18, $00, 0, 0, 3, 1, $17F)
    %spritemapEntry(0, $18, $F8, 0, 0, 3, 1, $16F)
    %spritemapEntry(0, $10, $00, 0, 0, 3, 1, $19B)
    %spritemapEntry(0, $10, $F8, 0, 0, 3, 1, $18B)


;;; $88F0: '     NIN' ;;;
TitleSequenceSpritemaps_NIN:
    dw $0006
    %spritemapEntry(0, $18, $00, 0, 0, 3, 1, $19B)
    %spritemapEntry(0, $18, $F8, 0, 0, 3, 1, $18B)
    %spritemapEntry(0, $10, $00, 0, 0, 3, 1, $17F)
    %spritemapEntry(0, $10, $F8, 0, 0, 3, 1, $16F)
    %spritemapEntry(0, $08, $00, 0, 0, 3, 1, $19B)
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 1, $18B)


;;; $8910: '    NINT' ;;;
TitleSequenceSpritemaps_NINT:
    dw $0008
    %spritemapEntry(0, $18, $00, 0, 0, 3, 1, $1B8)
    %spritemapEntry(0, $18, $F8, 0, 0, 3, 1, $1A8)
    %spritemapEntry(0, $10, $00, 0, 0, 3, 1, $19B)
    %spritemapEntry(0, $10, $F8, 0, 0, 3, 1, $18B)
    %spritemapEntry(0, $08, $00, 0, 0, 3, 1, $17F)
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 1, $16F)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 1, $19B)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 1, $18B)


;;; $893A: '   NINTE' ;;;
TitleSequenceSpritemaps_NINTE:
    dw $000A
    %spritemapEntry(0, $18, $00, 0, 0, 3, 1, $17B)
    %spritemapEntry(0, $18, $F8, 0, 0, 3, 1, $16B)
    %spritemapEntry(0, $10, $00, 0, 0, 3, 1, $1B8)
    %spritemapEntry(0, $10, $F8, 0, 0, 3, 1, $1A8)
    %spritemapEntry(0, $08, $00, 0, 0, 3, 1, $19B)
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 1, $18B)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 1, $17F)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 1, $16F)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 1, $19B)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 1, $18B)


;;; $896E: '  NINTEN' ;;;
TitleSequenceSpritemaps_NINTEN:
    dw $000C
    %spritemapEntry(0, $18, $00, 0, 0, 3, 1, $19B)
    %spritemapEntry(0, $18, $F8, 0, 0, 3, 1, $18B)
    %spritemapEntry(0, $10, $00, 0, 0, 3, 1, $17B)
    %spritemapEntry(0, $10, $F8, 0, 0, 3, 1, $16B)
    %spritemapEntry(0, $08, $00, 0, 0, 3, 1, $1B8)
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 1, $1A8)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 1, $19B)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 1, $18B)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 1, $17F)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 1, $16F)
    %spritemapEntry(0, $1F0, $00, 0, 0, 3, 1, $19B)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 1, $18B)


;;; $89AC: ' NINTEND' ;;;
TitleSequenceSpritemaps_NINTEND:
    dw $000E
    %spritemapEntry(0, $18, $00, 0, 0, 3, 1, $17A)
    %spritemapEntry(0, $18, $F8, 0, 0, 3, 1, $16A)
    %spritemapEntry(0, $10, $00, 0, 0, 3, 1, $19B)
    %spritemapEntry(0, $10, $F8, 0, 0, 3, 1, $18B)
    %spritemapEntry(0, $08, $00, 0, 0, 3, 1, $17B)
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 1, $16B)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 1, $1B8)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 1, $1A8)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 1, $19B)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 1, $18B)
    %spritemapEntry(0, $1F0, $00, 0, 0, 3, 1, $17F)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 1, $16F)
    %spritemapEntry(0, $1E8, $00, 0, 0, 3, 1, $19B)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 1, $18B)


;;; $89F4: 'NINTENDO' ;;;
TitleSequenceSpritemaps_NINTENDO:
    dw $0010
    %spritemapEntry(0, $18, $00, 0, 0, 3, 1, $19C)
    %spritemapEntry(0, $18, $F8, 0, 0, 3, 1, $18C)
    %spritemapEntry(0, $10, $00, 0, 0, 3, 1, $17A)
    %spritemapEntry(0, $10, $F8, 0, 0, 3, 1, $16A)
    %spritemapEntry(0, $08, $00, 0, 0, 3, 1, $19B)
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 1, $18B)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 1, $17B)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 1, $16B)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 1, $1B8)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 1, $1A8)
    %spritemapEntry(0, $1F0, $00, 0, 0, 3, 1, $19B)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 1, $18B)
    %spritemapEntry(0, $1E8, $00, 0, 0, 3, 1, $17F)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 1, $16F)
    %spritemapEntry(0, $1E0, $00, 0, 0, 3, 1, $19B)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 1, $18B)


;;; $8A46: '       P' ;;;
TitleSequenceSpritemaps_P:
    dw $0002
    %spritemapEntry(0, $18, $00, 0, 0, 3, 1, $19D)
    %spritemapEntry(0, $18, $F8, 0, 0, 3, 1, $18D)


;;; $8A52: '      PR' ;;;
TitleSequenceSpritemaps_PR:
    dw $0004
    %spritemapEntry(0, $18, $00, 0, 0, 3, 1, $19F)
    %spritemapEntry(0, $18, $F8, 0, 0, 3, 1, $18F)
    %spritemapEntry(0, $10, $00, 0, 0, 3, 1, $19D)
    %spritemapEntry(0, $10, $F8, 0, 0, 3, 1, $18D)


;;; $8A68: '     PRE' ;;;
TitleSequenceSpritemaps_PRE:
    dw $0006
    %spritemapEntry(0, $18, $00, 0, 0, 3, 1, $17B)
    %spritemapEntry(0, $18, $F8, 0, 0, 3, 1, $16B)
    %spritemapEntry(0, $10, $00, 0, 0, 3, 1, $19F)
    %spritemapEntry(0, $10, $F8, 0, 0, 3, 1, $18F)
    %spritemapEntry(0, $08, $00, 0, 0, 3, 1, $19D)
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 1, $18D)


;;; $8A88: '    PRES' ;;;
TitleSequenceSpritemaps_PRES:
    dw $0008
    %spritemapEntry(0, $18, $00, 0, 0, 3, 1, $1B7)
    %spritemapEntry(0, $18, $F8, 0, 0, 3, 1, $1A7)
    %spritemapEntry(0, $10, $00, 0, 0, 3, 1, $17B)
    %spritemapEntry(0, $10, $F8, 0, 0, 3, 1, $16B)
    %spritemapEntry(0, $08, $00, 0, 0, 3, 1, $19F)
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 1, $18F)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 1, $19D)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 1, $18D)


;;; $8AB2: '   PRESE' ;;;
TitleSequenceSpritemaps_PRESE:
    dw $000A
    %spritemapEntry(0, $18, $00, 0, 0, 3, 1, $17B)
    %spritemapEntry(0, $18, $F8, 0, 0, 3, 1, $16B)
    %spritemapEntry(0, $10, $00, 0, 0, 3, 1, $1B7)
    %spritemapEntry(0, $10, $F8, 0, 0, 3, 1, $1A7)
    %spritemapEntry(0, $08, $00, 0, 0, 3, 1, $17B)
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 1, $16B)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 1, $19F)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 1, $18F)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 1, $19D)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 1, $18D)


;;; $8AE6: '  PRESEN' ;;;
TitleSequenceSpritemaps_PRESEN:
    dw $000C
    %spritemapEntry(0, $18, $00, 0, 0, 3, 1, $19B)
    %spritemapEntry(0, $18, $F8, 0, 0, 3, 1, $18B)
    %spritemapEntry(0, $10, $00, 0, 0, 3, 1, $17B)
    %spritemapEntry(0, $10, $F8, 0, 0, 3, 1, $16B)
    %spritemapEntry(0, $08, $00, 0, 0, 3, 1, $1B7)
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 1, $1A7)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 1, $17B)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 1, $16B)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 1, $19F)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 1, $18F)
    %spritemapEntry(0, $1F0, $00, 0, 0, 3, 1, $19D)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 1, $18D)


;;; $8B24: ' PRESENT' ;;;
TitleSequenceSpritemaps_PRESENT:
    dw $000E
    %spritemapEntry(0, $18, $00, 0, 0, 3, 1, $1B8)
    %spritemapEntry(0, $18, $F8, 0, 0, 3, 1, $1A8)
    %spritemapEntry(0, $10, $00, 0, 0, 3, 1, $19B)
    %spritemapEntry(0, $10, $F8, 0, 0, 3, 1, $18B)
    %spritemapEntry(0, $08, $00, 0, 0, 3, 1, $17B)
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 1, $16B)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 1, $1B7)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 1, $1A7)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 1, $17B)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 1, $16B)
    %spritemapEntry(0, $1F0, $00, 0, 0, 3, 1, $19F)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 1, $18F)
    %spritemapEntry(0, $1E8, $00, 0, 0, 3, 1, $19D)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 1, $18D)


;;; $8B6C: 'PRESENTS' ;;;
TitleSequenceSpritemaps_PRESENTS:
    dw $0010
    %spritemapEntry(0, $18, $00, 0, 0, 3, 1, $1B7)
    %spritemapEntry(0, $18, $F8, 0, 0, 3, 1, $1A7)
    %spritemapEntry(0, $10, $00, 0, 0, 3, 1, $1B8)
    %spritemapEntry(0, $10, $F8, 0, 0, 3, 1, $1A8)
    %spritemapEntry(0, $08, $00, 0, 0, 3, 1, $19B)
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 1, $18B)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 1, $17B)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 1, $16B)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 1, $1B7)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 1, $1A7)
    %spritemapEntry(0, $1F0, $00, 0, 0, 3, 1, $17B)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 1, $16B)
    %spritemapEntry(0, $1E8, $00, 0, 0, 3, 1, $19F)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 1, $18F)
    %spritemapEntry(0, $1E0, $00, 0, 0, 3, 1, $19D)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 1, $18D)


;;; $8BBE: '        M' ;;;
TitleSequenceSpritemaps_M:
    dw $0002
    %spritemapEntry(0, $1C, $00, 0, 0, 3, 1, $19A)
    %spritemapEntry(0, $1C, $F8, 0, 0, 3, 1, $18A)


;;; $8BCA: '       ME' ;;;
TitleSequenceSpritemaps_ME:
    dw $0004
    %spritemapEntry(0, $1C, $00, 0, 0, 3, 1, $17B)
    %spritemapEntry(0, $1C, $F8, 0, 0, 3, 1, $16B)
    %spritemapEntry(0, $14, $00, 0, 0, 3, 1, $19A)
    %spritemapEntry(0, $14, $F8, 0, 0, 3, 1, $18A)


;;; $8BE0: '      MET' ;;;
TitleSequenceSpritemaps_MET:
    dw $0006
    %spritemapEntry(0, $1C, $00, 0, 0, 3, 1, $1B8)
    %spritemapEntry(0, $1C, $F8, 0, 0, 3, 1, $1A8)
    %spritemapEntry(0, $14, $00, 0, 0, 3, 1, $17B)
    %spritemapEntry(0, $14, $F8, 0, 0, 3, 1, $16B)
    %spritemapEntry(0, $0C, $00, 0, 0, 3, 1, $19A)
    %spritemapEntry(0, $0C, $F8, 0, 0, 3, 1, $18A)


;;; $8C00: Intro Mother Brain (frame 1) ;;;
IntroCeresExplosionSpritemaps_MotherBrainFrame1:
    dw $0009
    %spritemapEntry(1, $4208, $08, 0, 0, 3, 7, $194)
    %spritemapEntry(1, $43F8, $08, 0, 0, 3, 7, $192)
    %spritemapEntry(1, $43E8, $08, 0, 0, 3, 7, $190)
    %spritemapEntry(1, $4208, $F8, 0, 0, 3, 7, $174)
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 7, $172)
    %spritemapEntry(1, $43E8, $F8, 0, 0, 3, 7, $170)
    %spritemapEntry(1, $4208, $E8, 0, 0, 3, 7, $154)
    %spritemapEntry(1, $43F8, $E8, 0, 0, 3, 7, $152)
    %spritemapEntry(1, $43E8, $E8, 0, 0, 3, 7, $150)


;;; $8C2F: Intro Mother Brain (frame 2) ;;;
IntroCeresExplosionSpritemaps_MotherBrainFrame2:
    dw $0009
    %spritemapEntry(1, $4208, $F8, 0, 0, 3, 7, $17A)
    %spritemapEntry(1, $43E8, $F8, 0, 0, 3, 7, $176)
    %spritemapEntry(1, $4208, $E8, 0, 0, 3, 7, $15A)
    %spritemapEntry(1, $43F8, $E8, 0, 0, 3, 7, $158)
    %spritemapEntry(1, $43E8, $E8, 0, 0, 3, 7, $156)
    %spritemapEntry(1, $4208, $08, 0, 0, 3, 7, $194)
    %spritemapEntry(1, $43F8, $08, 0, 0, 3, 7, $192)
    %spritemapEntry(1, $43E8, $08, 0, 0, 3, 7, $190)
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 7, $172)


;;; $8C5E: Intro Mother Brain (frame 3) ;;;
IntroCeresExplosionSpritemaps_MotherBrainFrame3:
    dw $0009
    %spritemapEntry(1, $4208, $E8, 0, 0, 3, 7, $178)
    %spritemapEntry(1, $4208, $F8, 0, 0, 3, 7, $17E)
    %spritemapEntry(1, $43E8, $F8, 0, 0, 3, 7, $17C)
    %spritemapEntry(1, $43F8, $E8, 0, 0, 3, 7, $15E)
    %spritemapEntry(1, $43E8, $E8, 0, 0, 3, 7, $15C)
    %spritemapEntry(1, $4208, $08, 0, 0, 3, 7, $194)
    %spritemapEntry(1, $43F8, $08, 0, 0, 3, 7, $192)
    %spritemapEntry(1, $43E8, $08, 0, 0, 3, 7, $190)
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 7, $172)


;;; $8C8D: Intro rinka (frame 1) ;;;
IntroCeresExplosionSpritemaps_RinkaFrame1:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 7, $196)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 7, $196)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 7, $196)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 7, $196)


;;; $8CA3: Intro rinka (frame 2) ;;;
IntroCeresExplosionSpritemaps_RinkaFrame2:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 7, $197)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 7, $197)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 7, $197)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 7, $197)


;;; $8CB9: Intro rinka (frame 3) ;;;
IntroCeresExplosionSpritemaps_RinkaFrame3:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 7, $198)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 7, $198)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 7, $198)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 7, $198)


;;; $8CCF: Intro Japanese text next-page arrow (frame 1) ;;;
IntroCeresExplosionSpritemaps_JapanTextNextPageArrowFrame1:
    dw $0002
    %spritemapEntry(0, $1FF, $00, 0, 1, 3, 6, $1A8)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 6, $1A8)


;;; $8CDB: Intro Japanese text next-page arrow (frame 2) ;;;
IntroCeresExplosionSpritemaps_JapanTextNextPageArrowFrame2:
    dw $0002
    %spritemapEntry(0, $1FF, $00, 0, 1, 3, 6, $19F)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 6, $19F)


;;; $8CE7: Intro Japanese text next-page arrow (frame 3) ;;;
IntroCeresExplosionSpritemaps_JapanTextNextPageArrowFrame3:
    dw $0002
    %spritemapEntry(0, $1FF, $00, 0, 1, 3, 6, $1AF)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 6, $1AF)


;;; $8CF3: Baby metroid being delivered (frame 1) ;;;
IntroCeresExplosionSpritemaps_BabyMetroidDeliveredFrame1:
    dw $0006
    %spritemapEntry(0, $04, $F4, 0, 0, 3, 6, $EB)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 3, 6, $EA)
    %spritemapEntry(0, $1F4, $F4, 0, 0, 3, 6, $E9)
    %spritemapEntry(0, $04, $04, 0, 0, 3, 6, $F2)
    %spritemapEntry(0, $04, $FC, 0, 0, 3, 6, $E2)
    %spritemapEntry(1, $43F4, $FC, 0, 0, 3, 6, $E0)


;;; $8D13: Baby metroid being delivered (frame 2) ;;;
IntroCeresExplosionSpritemaps_BabyMetroidDeliveredFrame2:
    dw $0006
    %spritemapEntry(0, $04, $F4, 0, 0, 3, 6, $EE)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 3, 6, $ED)
    %spritemapEntry(0, $1F4, $F4, 0, 0, 3, 6, $EC)
    %spritemapEntry(0, $1F4, $04, 0, 0, 3, 6, $F3)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 3, 6, $E3)
    %spritemapEntry(1, $43FC, $FC, 0, 0, 3, 6, $E4)


;;; $8D33: Baby metroid being delivered (frame 3) ;;;
IntroCeresExplosionSpritemaps_BabyMetroidDeliveredFrame3:
    dw $0006
    %spritemapEntry(0, $04, $F4, 0, 0, 3, 6, $FB)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 3, 6, $FA)
    %spritemapEntry(0, $1F4, $F4, 0, 0, 3, 6, $F9)
    %spritemapEntry(0, $04, $04, 0, 0, 3, 6, $F8)
    %spritemapEntry(0, $04, $FC, 0, 0, 3, 6, $E8)
    %spritemapEntry(1, $43F4, $FC, 0, 0, 3, 6, $E6)


;;; $8D53: Baby metroid being examined (frame 1) ;;;
IntroCeresExplosionSpritemaps_BabyMetroidExaminedFrame1:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 6, $199)


;;; $8D5A: Baby metroid being examined (frame 2) ;;;
IntroCeresExplosionSpritemaps_BabyMetroidExaminedFrame2:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 6, $19B)


;;; $8D61: Baby metroid being examined (frame 3) ;;;
IntroCeresExplosionSpritemaps_BabyMetroidExaminedFrame3:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 6, $19D)


;;; $8D68: The blinking typewriter block ;;;
IntroCeresExplosionSpritemaps_BlinkingTypewriterBlock:
    dw $0001
    %spritemapEntry(0, $00, $FF, 0, 0, 3, 6, $FC)


;;; $8D6F: Metroid egg hatching (frame 1) ;;;
IntroCeresExplosionSpritemaps_MetroidEggHatchingFrame1:
    dw $0006
    %spritemapEntry(0, $04, $F4, 0, 0, 3, 7, $124)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 3, 7, $123)
    %spritemapEntry(0, $1F4, $F4, 0, 0, 3, 7, $122)
    %spritemapEntry(1, $43F4, $FC, 0, 0, 3, 7, $110)
    %spritemapEntry(0, $04, $04, 0, 0, 3, 7, $101)
    %spritemapEntry(0, $04, $FC, 0, 0, 3, 7, $100)


;;; $8D8F: Metroid egg hatching (frame 2) ;;;
IntroCeresExplosionSpritemaps_MetroidEggHatchingFrame2:
    dw $0009
    %spritemapEntry(0, $01, $F4, 0, 0, 3, 7, $124)
    %spritemapEntry(0, $1F9, $F4, 0, 0, 3, 7, $123)
    %spritemapEntry(0, $1F1, $F4, 0, 0, 3, 7, $122)
    %spritemapEntry(0, $03, $04, 0, 0, 3, 7, $101)
    %spritemapEntry(0, $02, $FC, 0, 0, 3, 7, $100)
    %spritemapEntry(0, $1FB, $04, 0, 0, 3, 7, $121)
    %spritemapEntry(0, $1F3, $04, 0, 0, 3, 7, $120)
    %spritemapEntry(0, $1FA, $FC, 0, 0, 3, 7, $111)
    %spritemapEntry(0, $1F2, $FC, 0, 0, 3, 7, $110)


;;; $8DBE: Metroid egg hatching (frame 3) ;;;
IntroCeresExplosionSpritemaps_MetroidEggHatchingFrame3:
    dw $0009
    %spritemapEntry(0, $07, $F4, 0, 0, 3, 7, $124)
    %spritemapEntry(0, $1FF, $F4, 0, 0, 3, 7, $123)
    %spritemapEntry(0, $1F7, $F4, 0, 0, 3, 7, $122)
    %spritemapEntry(0, $05, $04, 0, 0, 3, 7, $101)
    %spritemapEntry(0, $06, $FC, 0, 0, 3, 7, $100)
    %spritemapEntry(0, $1FD, $04, 0, 0, 3, 7, $121)
    %spritemapEntry(0, $1F5, $04, 0, 0, 3, 7, $120)
    %spritemapEntry(0, $1FE, $FC, 0, 0, 3, 7, $111)
    %spritemapEntry(0, $1F6, $FC, 0, 0, 3, 7, $110)


;;; $8DED: Metroid egg hatching (frame 4) ;;;
IntroCeresExplosionSpritemaps_MetroidEggHatchingFrame4:
    dw $0009
    %spritemapEntry(0, $1F4, $F4, 0, 0, 3, 7, $102)
    %spritemapEntry(0, $04, $04, 0, 0, 3, 7, $101)
    %spritemapEntry(0, $04, $FC, 0, 0, 3, 7, $100)
    %spritemapEntry(0, $04, $F4, 0, 0, 3, 7, $124)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 3, 7, $123)
    %spritemapEntry(0, $1FC, $04, 0, 0, 3, 7, $121)
    %spritemapEntry(0, $1F4, $04, 0, 0, 3, 7, $120)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 7, $111)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 3, 7, $110)


;;; $8E1C: Metroid egg hatching (frame 5) ;;;
IntroCeresExplosionSpritemaps_MetroidEggHatchingFrame5:
    dw $0009
    %spritemapEntry(0, $1F4, $F4, 0, 0, 3, 7, $102)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 3, 7, $103)
    %spritemapEntry(0, $04, $04, 0, 0, 3, 7, $101)
    %spritemapEntry(0, $04, $FC, 0, 0, 3, 7, $100)
    %spritemapEntry(0, $04, $F4, 0, 0, 3, 7, $124)
    %spritemapEntry(0, $1FC, $04, 0, 0, 3, 7, $121)
    %spritemapEntry(0, $1F4, $04, 0, 0, 3, 7, $120)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 7, $111)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 3, 7, $110)


;;; $8E4B: Metroid egg hatching (frame 6) ;;;
IntroCeresExplosionSpritemaps_MetroidEggHatchingFrame6:
    dw $0009
    %spritemapEntry(0, $1F4, $FC, 0, 0, 3, 7, $112)
    %spritemapEntry(0, $1F4, $F4, 0, 0, 3, 7, $102)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 3, 7, $103)
    %spritemapEntry(0, $04, $04, 0, 0, 3, 7, $101)
    %spritemapEntry(0, $04, $FC, 0, 0, 3, 7, $100)
    %spritemapEntry(0, $04, $F4, 0, 0, 3, 7, $124)
    %spritemapEntry(0, $1FC, $04, 0, 0, 3, 7, $121)
    %spritemapEntry(0, $1F4, $04, 0, 0, 3, 7, $120)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 7, $111)


;;; $8E7A: Metroid egg hatching (frame 7) ;;;
IntroCeresExplosionSpritemaps_MetroidEggHatchingFrame7:
    dw $0009
    %spritemapEntry(0, $04, $F4, 0, 0, 3, 7, $104)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 3, 7, $112)
    %spritemapEntry(0, $1F4, $F4, 0, 0, 3, 7, $102)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 3, 7, $103)
    %spritemapEntry(0, $04, $04, 0, 0, 3, 7, $101)
    %spritemapEntry(0, $04, $FC, 0, 0, 3, 7, $100)
    %spritemapEntry(0, $1FC, $04, 0, 0, 3, 7, $121)
    %spritemapEntry(0, $1F4, $04, 0, 0, 3, 7, $120)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 7, $111)


;;; $8EA9: Metroid egg hatching (frame 8) ;;;
IntroCeresExplosionSpritemaps_MetroidEggHatchingFrame8:
    dw $0009
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 7, $111)
    %spritemapEntry(0, $04, $FC, 0, 0, 3, 7, $114)
    %spritemapEntry(0, $04, $F4, 0, 0, 3, 7, $104)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 3, 7, $112)
    %spritemapEntry(0, $1F4, $F4, 0, 0, 3, 7, $102)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 3, 7, $103)
    %spritemapEntry(0, $04, $04, 0, 0, 3, 7, $101)
    %spritemapEntry(0, $1FC, $04, 0, 0, 3, 7, $121)
    %spritemapEntry(0, $1F4, $04, 0, 0, 3, 7, $120)


;;; $8ED8: Metroid egg hatching (frame 9) ;;;
IntroCeresExplosionSpritemaps_MetroidEggHatchingFrame9:
    dw $0009
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 7, $113)
    %spritemapEntry(0, $04, $FC, 0, 0, 3, 7, $114)
    %spritemapEntry(0, $04, $F4, 0, 0, 3, 7, $104)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 3, 7, $112)
    %spritemapEntry(0, $1F4, $F4, 0, 0, 3, 7, $102)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 3, 7, $103)
    %spritemapEntry(0, $04, $04, 0, 0, 3, 7, $101)
    %spritemapEntry(0, $1FC, $04, 0, 0, 3, 7, $121)
    %spritemapEntry(0, $1F4, $04, 0, 0, 3, 7, $120)


;;; $8F07: Metroid egg hatched (frame 1) ;;;
IntroCeresExplosionSpritemaps_MetroidEggHatchedFrame1:
    dw $0003
    %spritemapEntry(0, $04, $04, 0, 0, 3, 7, $108)
    %spritemapEntry(0, $04, $FC, 0, 0, 3, 7, $107)
    %spritemapEntry(1, $43F4, $FC, 0, 0, 3, 7, $117)


;;; $8F18: Metroid egg hatched (frame 2) ;;;
IntroCeresExplosionSpritemaps_MetroidEggHatchedFrame2:
    dw $0003
    %spritemapEntry(0, $04, $04, 0, 0, 3, 7, $108)
    %spritemapEntry(0, $04, $FC, 0, 0, 3, 7, $109)
    %spritemapEntry(1, $43F4, $FC, 0, 0, 3, 7, $119)


;;; $8F29: Metroid egg hatched (frame 3) ;;;
IntroCeresExplosionSpritemaps_MetroidEggHatchedFrame3:
    dw $0003
    %spritemapEntry(0, $04, $04, 0, 0, 3, 7, $10C)
    %spritemapEntry(0, $04, $FC, 0, 0, 3, 7, $10B)
    %spritemapEntry(1, $43F4, $FC, 0, 0, 3, 7, $11B)


;;; $8F3A: Metroid egg hatched (frame 4) ;;;
IntroCeresExplosionSpritemaps_MetroidEggHatchedFrame4:
    dw $0003
    %spritemapEntry(0, $04, $04, 0, 0, 3, 7, $142)
    %spritemapEntry(0, $04, $FC, 0, 0, 3, 7, $132)
    %spritemapEntry(1, $43F4, $FC, 0, 0, 3, 7, $130)


;;; $8F4B: Metroid egg hatched (frame 5) ;;;
IntroCeresExplosionSpritemaps_MetroidEggHatchedFrame5:
    dw $0003
    %spritemapEntry(0, $04, $04, 0, 0, 3, 7, $145)
    %spritemapEntry(0, $04, $FC, 0, 0, 3, 7, $135)
    %spritemapEntry(1, $43F4, $FC, 0, 0, 3, 7, $133)


;;; $8F5C: Metroid egg hatched (frame 6) ;;;
IntroCeresExplosionSpritemaps_MetroidEggHatchedFrame6:
    dw $0003
    %spritemapEntry(0, $04, $04, 0, 0, 3, 7, $148)
    %spritemapEntry(0, $04, $FC, 0, 0, 3, 7, $138)
    %spritemapEntry(1, $43F4, $FC, 0, 0, 3, 7, $136)


;;; $8F6D: Metroid egg hatched (frame 7) ;;;
IntroCeresExplosionSpritemaps_MetroidEggHatchedFrame7:
    dw $0003
    %spritemapEntry(0, $04, $04, 0, 0, 3, 7, $14B)
    %spritemapEntry(0, $04, $FC, 0, 0, 3, 7, $13B)
    %spritemapEntry(1, $43F4, $FC, 0, 0, 3, 7, $139)


;;; $8F7E: Metroid egg's particle 1 ;;;
IntroCeresExplosionSpritemaps_MetroidEggsParticle1:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 7, $105)


;;; $8F85: Metroid egg's particle 2 ;;;
IntroCeresExplosionSpritemaps_MetroidEggsParticle2:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 7, $106)


;;; $8F8C: Metroid egg's particle 3 ;;;
IntroCeresExplosionSpritemaps_MetroidEggsParticle3:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 7, $115)


;;; $8F93: Metroid egg's particle 4 ;;;
IntroCeresExplosionSpritemaps_MetroidEggsParticle4:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 7, $116)


;;; $8F9A: Metroid egg's particle 5 ;;;
IntroCeresExplosionSpritemaps_MetroidEggsParticle5:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 7, $125)


;;; $8FA1: Metroid egg's particle 6 ;;;
IntroCeresExplosionSpritemaps_MetroidEggsParticle6:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 7, $126)


;;; $8FA8: Metroid egg's slime drops (frame 1) ;;;
IntroCeresExplosionSpritemaps_MetroidEggsSlimeDropsFrame1:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 7, $10D)


;;; $8FAF: Metroid egg's slime drops (frame 2) ;;;
IntroCeresExplosionSpritemaps_MetroidEggsSlimeDropsFrame2:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 7, $10E)


;;; $8FB6: Metroid egg's slime drops (frame 3) ;;;
IntroCeresExplosionSpritemaps_MetroidEggsSlimeDropsFrame3:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 7, $10F)


;;; $8FBD: Metroid egg's slime drops (frame 4) ;;;
IntroCeresExplosionSpritemaps_MetroidEggsSlimeDropsFrame4:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 7, $11D)


;;; $8FC4: Metroid egg's slime drops (frame 5) ;;;
IntroCeresExplosionSpritemaps_MetroidEggsSlimeDropsFrame5:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 7, $12D)


;;; $8FCB: Confused baby metroid (frame 1) ;;;
IntroCeresExplosionSpritemaps_ConfusedBabyMetroidFrame1:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 7, $11E)


;;; $8FD2: Confused baby metroid (frame 2) ;;;
IntroCeresExplosionSpritemaps_ConfusedBabyMetroidFrame2:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 7, $13C)


;;; $8FD9: Confused baby metroid (frame 3) ;;;
IntroCeresExplosionSpritemaps_ConfusedBabyMetroidFrame3:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 7, $13E)


;;; $8FE0: Metroid egg projectile ;;;
IntroCeresExplosionSpritemaps_MetroidEggProjectile:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 7, $10A)


;;; $8FE7: Ceres purple space vortex (frame 1) ;;;
SpaceSpritemaps_CeresPurpleVortexFrame1:
    dw $0024
    %spritemapEntry(0, $6E, $E0, 0, 0, 0, 4, $1E6)
    %spritemapEntry(0, $66, $E0, 0, 0, 0, 4, $1E6)
    %spritemapEntry(0, $1E9, $34, 0, 0, 0, 4, $1EA)
    %spritemapEntry(0, $10, $F4, 0, 0, 0, 4, $1EA)
    %spritemapEntry(0, $56, $FB, 0, 0, 0, 4, $1E8)
    %spritemapEntry(0, $22, $B4, 0, 0, 0, 4, $1E8)
    %spritemapEntry(0, $1B8, $79, 0, 0, 0, 4, $1E8)
    %spritemapEntry(0, $3C, $E7, 0, 0, 0, 4, $1EC)
    %spritemapEntry(0, $75, $22, 0, 0, 0, 4, $1EC)
    %spritemapEntry(0, $76, $6F, 0, 0, 0, 4, $1E8)
    %spritemapEntry(0, $197, $6C, 0, 0, 0, 4, $1E9)
    %spritemapEntry(0, $1D3, $50, 0, 0, 0, 4, $1E9)
    %spritemapEntry(0, $6C, $5E, 0, 0, 0, 4, $1E8)
    %spritemapEntry(0, $4E, $5D, 0, 0, 0, 4, $1EA)
    %spritemapEntry(0, $1E1, $C0, 0, 0, 0, 4, $1E8)
    %spritemapEntry(0, $4C, $4A, 0, 0, 0, 4, $1E9)
    %spritemapEntry(0, $1BB, $B9, 0, 0, 0, 4, $1E9)
    %spritemapEntry(0, $1C1, $69, 0, 0, 0, 4, $1E8)
    %spritemapEntry(1, $4256, $E0, 0, 0, 0, 4, $1E4)
    %spritemapEntry(1, $4246, $E0, 0, 0, 0, 4, $1E2)
    %spritemapEntry(1, $4266, $D0, 0, 0, 0, 4, $1E0)
    %spritemapEntry(1, $4256, $D0, 0, 0, 0, 4, $1CE)
    %spritemapEntry(1, $4246, $D0, 0, 0, 0, 4, $1CC)
    %spritemapEntry(1, $4266, $C0, 0, 0, 0, 4, $1CA)
    %spritemapEntry(1, $4256, $C0, 0, 0, 0, 4, $1C8)
    %spritemapEntry(1, $4246, $C0, 0, 0, 0, 4, $1C6)
    %spritemapEntry(1, $4266, $B0, 0, 0, 0, 4, $1C4)
    %spritemapEntry(1, $4256, $B0, 0, 0, 0, 4, $1C2)
    %spritemapEntry(1, $4246, $B0, 0, 0, 0, 4, $1C0)
    %spritemapEntry(0, $2F, $23, 0, 0, 0, 4, $1EA)
    %spritemapEntry(0, $46, $7A, 0, 0, 0, 4, $1EA)
    %spritemapEntry(0, $00, $E4, 0, 0, 0, 4, $1EB)
    %spritemapEntry(0, $6C, $2E, 0, 0, 0, 4, $1EB)
    %spritemapEntry(0, $1D3, $E6, 0, 0, 0, 4, $1E9)
    %spritemapEntry(0, $03, $CD, 0, 0, 0, 4, $1EA)
    %spritemapEntry(0, $1B1, $E2, 0, 0, 0, 4, $1E8)


;;; $909D: Ceres under attack large asteroids ;;;
SpaceSpritemaps_CeresUnderAttackLargeAsteroids:
    dw $0013
    %spritemapEntry(1, $43A7, $CF, 0, 0, 3, 4, $183)
    %spritemapEntry(1, $43A7, $BF, 0, 0, 3, 4, $163)
    %spritemapEntry(1, $439F, $CF, 0, 0, 3, 4, $182)
    %spritemapEntry(1, $438F, $CF, 0, 0, 3, 4, $180)
    %spritemapEntry(1, $439F, $BF, 0, 0, 3, 4, $162)
    %spritemapEntry(1, $438F, $BF, 0, 0, 3, 4, $160)
    %spritemapEntry(0, $58, $FC, 0, 0, 3, 4, $1A9)
    %spritemapEntry(1, $4260, $F4, 0, 0, 3, 4, $19A)
    %spritemapEntry(1, $4270, $DC, 0, 0, 3, 4, $16C)
    %spritemapEntry(1, $4268, $EC, 0, 0, 3, 4, $18B)
    %spritemapEntry(1, $4258, $EC, 0, 0, 3, 4, $189)
    %spritemapEntry(1, $4268, $DC, 0, 0, 3, 4, $16B)
    %spritemapEntry(1, $4258, $DC, 0, 0, 3, 4, $169)
    %spritemapEntry(1, $4210, $28, 0, 0, 3, 4, $1A7)
    %spritemapEntry(1, $4200, $28, 0, 0, 3, 4, $1A5)
    %spritemapEntry(1, $4210, $18, 0, 0, 3, 4, $187)
    %spritemapEntry(1, $4200, $18, 0, 0, 3, 4, $185)
    %spritemapEntry(1, $4210, $08, 0, 0, 3, 4, $167)
    %spritemapEntry(1, $4200, $08, 0, 0, 3, 4, $165)


;;; $90FE: Ceres small asteroids ;;;
SpaceSpritemaps_CeresSmallAsteroids:
    dw $0010
    %spritemapEntry(1, $4380, $E2, 1, 0, 0, 4, $17E)
    %spritemapEntry(1, $4380, $EA, 1, 0, 0, 4, $16E)
    %spritemapEntry(1, $43DE, $05, 0, 0, 0, 4, $17E)
    %spritemapEntry(1, $43DE, $FD, 0, 0, 0, 4, $16E)
    %spritemapEntry(1, $420B, $22, 0, 0, 0, 4, $1A1)
    %spritemapEntry(1, $4203, $22, 0, 0, 0, 4, $1A0)
    %spritemapEntry(0, $63, $FB, 0, 0, 0, 4, $19D)
    %spritemapEntry(1, $426B, $FB, 0, 0, 0, 4, $19E)
    %spritemapEntry(1, $4263, $03, 0, 0, 0, 4, $1AD)
    %spritemapEntry(1, $4236, $EC, 1, 0, 0, 4, $17E)
    %spritemapEntry(1, $4236, $F4, 1, 0, 0, 4, $16E)
    %spritemapEntry(1, $43A4, $14, 0, 0, 0, 4, $1A1)
    %spritemapEntry(1, $439C, $14, 0, 0, 0, 4, $1A0)
    %spritemapEntry(0, $16, $EF, 1, 0, 0, 4, $19D)
    %spritemapEntry(1, $421E, $E7, 1, 0, 0, 4, $19E)
    %spritemapEntry(1, $4216, $DF, 1, 0, 0, 4, $1AD)


;;; $9150: Ceres under attack ;;;
SpaceSpritemaps_CeresUnderAttack:
    dw $0029
    %spritemapEntry(0, $1E6, $D8, 0, 0, 0, 6, $F4)
    %spritemapEntry(1, $43EE, $D0, 0, 0, 0, 6, $E5)
    %spritemapEntry(1, $4216, $10, 0, 0, 0, 6, $149)
    %spritemapEntry(0, $2E, $00, 0, 0, 0, 6, $F0)
    %spritemapEntry(0, $16, $20, 0, 0, 0, 6, $F2)
    %spritemapEntry(0, $0E, $20, 0, 0, 0, 6, $F1)
    %spritemapEntry(0, $1FE, $28, 0, 0, 0, 6, $F3)
    %spritemapEntry(0, $06, $20, 0, 0, 0, 6, $15C)
    %spritemapEntry(0, $1FE, $20, 0, 0, 0, 6, $15B)
    %spritemapEntry(0, $1E6, $28, 0, 0, 0, 6, $15D)
    %spritemapEntry(0, $1E6, $20, 0, 0, 0, 6, $14D)
    %spritemapEntry(0, $1DE, $20, 0, 0, 0, 6, $14C)
    %spritemapEntry(0, $1D6, $20, 0, 0, 0, 6, $14B)
    %spritemapEntry(1, $43EE, $20, 0, 0, 0, 6, $14E)
    %spritemapEntry(1, $420E, $10, 0, 0, 0, 6, $148)
    %spritemapEntry(1, $43FE, $10, 0, 0, 0, 6, $146)
    %spritemapEntry(1, $43EE, $10, 0, 0, 0, 6, $144)
    %spritemapEntry(1, $43DE, $10, 0, 0, 0, 6, $142)
    %spritemapEntry(1, $43CE, $10, 0, 0, 0, 6, $140)
    %spritemapEntry(1, $421E, $00, 0, 0, 0, 6, $12E)
    %spritemapEntry(1, $420E, $00, 0, 0, 0, 6, $12C)
    %spritemapEntry(1, $43FE, $00, 0, 0, 0, 6, $12A)
    %spritemapEntry(1, $43EE, $00, 0, 0, 0, 6, $128)
    %spritemapEntry(1, $43DE, $00, 0, 0, 0, 6, $126)
    %spritemapEntry(1, $43CE, $00, 0, 0, 0, 6, $124)
    %spritemapEntry(1, $4226, $F0, 0, 0, 0, 6, $122)
    %spritemapEntry(1, $4216, $F0, 0, 0, 0, 6, $120)
    %spritemapEntry(1, $4206, $F0, 0, 0, 0, 6, $10E)
    %spritemapEntry(1, $43FE, $F0, 0, 0, 0, 6, $10D)
    %spritemapEntry(1, $43EE, $F0, 0, 0, 0, 6, $10B)
    %spritemapEntry(1, $43DE, $F0, 0, 0, 0, 6, $109)
    %spritemapEntry(1, $43CE, $F0, 0, 0, 0, 6, $107)
    %spritemapEntry(1, $421E, $E0, 0, 0, 0, 6, $105)
    %spritemapEntry(1, $4216, $E0, 0, 0, 0, 6, $104)
    %spritemapEntry(1, $4206, $E0, 0, 0, 0, 6, $102)
    %spritemapEntry(1, $43F6, $E0, 0, 0, 0, 6, $100)
    %spritemapEntry(1, $43E6, $E0, 0, 0, 0, 6, $EE)
    %spritemapEntry(1, $43D6, $E0, 0, 0, 0, 6, $EC)
    %spritemapEntry(1, $4216, $D0, 0, 0, 0, 6, $EA)
    %spritemapEntry(1, $4206, $D0, 0, 0, 0, 6, $E8)
    %spritemapEntry(1, $43F6, $D0, 0, 0, 0, 6, $E6)


if !FEATURE_KEEP_UNREFERENCED
;;; $921F: Unused. 'SPACE COLONY' ;;;
UNUSED_SpaceSpritemaps_SPACECOLONY_8C921F:
    dw $000B
    %spritemapEntry(0, $28, $FC, 0, 0, 3, 0, $1B9)
    %spritemapEntry(0, $20, $FC, 0, 0, 3, 0, $1FB)
    %spritemapEntry(0, $18, $FC, 0, 0, 3, 0, $1F9)
    %spritemapEntry(0, $10, $FC, 0, 0, 3, 0, $1FA)
    %spritemapEntry(0, $08, $FC, 0, 0, 3, 0, $1F9)
    %spritemapEntry(0, $00, $FC, 0, 0, 3, 0, $1F7)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 3, 0, $1F8)
    %spritemapEntry(0, $1E8, $FC, 0, 0, 3, 0, $1F7)
    %spritemapEntry(0, $1E0, $FC, 0, 0, 3, 0, $1EF)
    %spritemapEntry(0, $1D8, $FC, 0, 0, 3, 0, $1EE)
    %spritemapEntry(0, $1D0, $FC, 0, 0, 3, 0, $1ED)


;;; $9258: Unused. 'スペースコロニー' ;;;
UNUSED_SpaceSpritemaps_JapanText_SPACECOLONY_8C9258:
    dw $0010
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 0, $E2)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 0, $1BA)
    %spritemapEntry(0, $1C, $00, 0, 0, 3, 0, $1B4)
    %spritemapEntry(0, $1C, $F8, 0, 0, 3, 0, $1B3)
    %spritemapEntry(0, $14, $00, 0, 0, 3, 0, $1A4)
    %spritemapEntry(0, $14, $F8, 0, 0, 3, 0, $E1)
    %spritemapEntry(0, $0C, $F8, 0, 0, 3, 0, $E0)
    %spritemapEntry(0, $0C, $00, 0, 0, 3, 0, $1A3)
    %spritemapEntry(0, $04, $00, 0, 0, 3, 0, $E4)
    %spritemapEntry(0, $04, $F8, 0, 0, 3, 0, $1BC)
    %spritemapEntry(0, $1EC, $00, 0, 0, 3, 0, $E3)
    %spritemapEntry(0, $1E4, $00, 0, 0, 3, 0, $E2)
    %spritemapEntry(0, $1F4, $00, 0, 0, 3, 0, $1B4)
    %spritemapEntry(0, $1F4, $F8, 0, 0, 3, 0, $1B3)
    %spritemapEntry(0, $1EC, $F8, 0, 0, 3, 0, $1BB)
    %spritemapEntry(0, $1E4, $F8, 0, 0, 3, 0, $1BA)


;;; $92AA: Unused. 'S' ;;;
UNUSED_SpaceSpritemaps_S_8C92AA:
    dw $0001
    %spritemapEntry(0, $1D0, $FC, 0, 0, 3, 0, $1ED)


;;; $92B1: Unused. 'SP' ;;;
UNUSED_SpaceSpritemaps_SP_8C92B1:
    dw $0002
    %spritemapEntry(0, $1D8, $FC, 0, 0, 3, 0, $1EE)
    %spritemapEntry(0, $1D0, $FC, 0, 0, 3, 0, $1ED)


;;; $92BD: Unused. 'SPA' ;;;
UNUSED_SpaceSpritemaps_SPA_8C92BD:
    dw $0003
    %spritemapEntry(0, $1E0, $FC, 0, 0, 3, 0, $1EF)
    %spritemapEntry(0, $1D8, $FC, 0, 0, 3, 0, $1EE)
    %spritemapEntry(0, $1D0, $FC, 0, 0, 3, 0, $1ED)


;;; $92CE: Unused. 'SPAC' ;;;
UNUSED_SpaceSpritemaps_SPAC_8C92CE:
    dw $0004
    %spritemapEntry(0, $1E8, $FC, 0, 0, 3, 0, $1F7)
    %spritemapEntry(0, $1E0, $FC, 0, 0, 3, 0, $1EF)
    %spritemapEntry(0, $1D8, $FC, 0, 0, 3, 0, $1EE)
    %spritemapEntry(0, $1D0, $FC, 0, 0, 3, 0, $1ED)


;;; $92E4: Unused. 'SPACE' ;;;
UNUSED_SpaceSpritemaps_SPACE_8C92E4:
    dw $0005
    %spritemapEntry(0, $1F0, $FC, 0, 0, 3, 0, $1F8)
    %spritemapEntry(0, $1E8, $FC, 0, 0, 3, 0, $1F7)
    %spritemapEntry(0, $1E0, $FC, 0, 0, 3, 0, $1EF)
    %spritemapEntry(0, $1D8, $FC, 0, 0, 3, 0, $1EE)
    %spritemapEntry(0, $1D0, $FC, 0, 0, 3, 0, $1ED)


;;; $92FF: Unused. 'SPACE C' ;;;
UNUSED_SpaceSpritemaps_SPACEC_8C92FF:
    dw $0006
    %spritemapEntry(0, $00, $FC, 0, 0, 3, 0, $1F7)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 3, 0, $1F8)
    %spritemapEntry(0, $1E8, $FC, 0, 0, 3, 0, $1F7)
    %spritemapEntry(0, $1E0, $FC, 0, 0, 3, 0, $1EF)
    %spritemapEntry(0, $1D8, $FC, 0, 0, 3, 0, $1EE)
    %spritemapEntry(0, $1D0, $FC, 0, 0, 3, 0, $1ED)


;;; $931F: Unused. 'SPACE CO' ;;;
UNUSED_SpaceSpritemaps_SPACECO_8C931F:
    dw $0007
    %spritemapEntry(0, $08, $FC, 0, 0, 3, 0, $1F9)
    %spritemapEntry(0, $00, $FC, 0, 0, 3, 0, $1F7)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 3, 0, $1F8)
    %spritemapEntry(0, $1E8, $FC, 0, 0, 3, 0, $1F7)
    %spritemapEntry(0, $1E0, $FC, 0, 0, 3, 0, $1EF)
    %spritemapEntry(0, $1D8, $FC, 0, 0, 3, 0, $1EE)
    %spritemapEntry(0, $1D0, $FC, 0, 0, 3, 0, $1ED)


;;; $9344: Unused. 'SPACE COL' ;;;
UNUSED_SpaceSpritemaps_SPACECOL_8C9344:
    dw $0008
    %spritemapEntry(0, $10, $FC, 0, 0, 3, 0, $1FA)
    %spritemapEntry(0, $08, $FC, 0, 0, 3, 0, $1F9)
    %spritemapEntry(0, $00, $FC, 0, 0, 3, 0, $1F7)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 3, 0, $1F8)
    %spritemapEntry(0, $1E8, $FC, 0, 0, 3, 0, $1F7)
    %spritemapEntry(0, $1E0, $FC, 0, 0, 3, 0, $1EF)
    %spritemapEntry(0, $1D8, $FC, 0, 0, 3, 0, $1EE)
    %spritemapEntry(0, $1D0, $FC, 0, 0, 3, 0, $1ED)


;;; $936E: Unused. 'SPACE COLO' ;;;
UNUSED_SpaceSpritemaps_SPACECOLO_9C936E:
    dw $0009
    %spritemapEntry(0, $18, $FC, 0, 0, 3, 0, $1F9)
    %spritemapEntry(0, $10, $FC, 0, 0, 3, 0, $1FA)
    %spritemapEntry(0, $08, $FC, 0, 0, 3, 0, $1F9)
    %spritemapEntry(0, $00, $FC, 0, 0, 3, 0, $1F7)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 3, 0, $1F8)
    %spritemapEntry(0, $1E8, $FC, 0, 0, 3, 0, $1F7)
    %spritemapEntry(0, $1E0, $FC, 0, 0, 3, 0, $1EF)
    %spritemapEntry(0, $1D8, $FC, 0, 0, 3, 0, $1EE)
    %spritemapEntry(0, $1D0, $FC, 0, 0, 3, 0, $1ED)


;;; $939D: Unused. 'SPACE COLON' ;;;
UNUSED_SpaceSpritemaps_SPACECOLON_8C939D:
    dw $000A
    %spritemapEntry(0, $20, $FC, 0, 0, 3, 0, $1FB)
    %spritemapEntry(0, $18, $FC, 0, 0, 3, 0, $1F9)
    %spritemapEntry(0, $10, $FC, 0, 0, 3, 0, $1FA)
    %spritemapEntry(0, $08, $FC, 0, 0, 3, 0, $1F9)
    %spritemapEntry(0, $00, $FC, 0, 0, 3, 0, $1F7)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 3, 0, $1F8)
    %spritemapEntry(0, $1E8, $FC, 0, 0, 3, 0, $1F7)
    %spritemapEntry(0, $1E0, $FC, 0, 0, 3, 0, $1EF)
    %spritemapEntry(0, $1D8, $FC, 0, 0, 3, 0, $1EE)
    %spritemapEntry(0, $1D0, $FC, 0, 0, 3, 0, $1ED)
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $93D1: Ceres purple space vortex (frame 2) ;;;
SpaceSpritemaps_CeresPurpleVortexFrame2:
    dw $0021
    %spritemapEntry(0, $10, $E4, 0, 0, 0, 4, $1E8)
    %spritemapEntry(0, $1B1, $C6, 0, 0, 0, 4, $1EA)
    %spritemapEntry(0, $1CD, $CB, 0, 0, 0, 4, $1EA)
    %spritemapEntry(0, $6E, $E0, 0, 0, 0, 4, $1E6)
    %spritemapEntry(0, $66, $E0, 0, 0, 0, 4, $1E6)
    %spritemapEntry(0, $1AA, $66, 0, 0, 0, 4, $1EC)
    %spritemapEntry(0, $192, $52, 0, 0, 0, 4, $1E8)
    %spritemapEntry(0, $35, $5B, 0, 0, 0, 4, $1E8)
    %spritemapEntry(0, $1A3, $E8, 0, 0, 0, 4, $1EA)
    %spritemapEntry(0, $194, $B8, 0, 0, 0, 4, $1E8)
    %spritemapEntry(0, $1B0, $59, 0, 0, 0, 4, $1E9)
    %spritemapEntry(0, $1E7, $A5, 0, 0, 0, 4, $1E8)
    %spritemapEntry(1, $4256, $E0, 0, 0, 0, 4, $1E4)
    %spritemapEntry(1, $4246, $E0, 0, 0, 0, 4, $1E2)
    %spritemapEntry(1, $4266, $D0, 0, 0, 0, 4, $1E0)
    %spritemapEntry(1, $4256, $D0, 0, 0, 0, 4, $1CE)
    %spritemapEntry(1, $4246, $D0, 0, 0, 0, 4, $1CC)
    %spritemapEntry(1, $4266, $C0, 0, 0, 0, 4, $1CA)
    %spritemapEntry(1, $4256, $C0, 0, 0, 0, 4, $1C8)
    %spritemapEntry(1, $4246, $C0, 0, 0, 0, 4, $1C6)
    %spritemapEntry(1, $4266, $B0, 0, 0, 0, 4, $1C4)
    %spritemapEntry(1, $4256, $B0, 0, 0, 0, 4, $1C2)
    %spritemapEntry(1, $4246, $B0, 0, 0, 0, 4, $1C0)
    %spritemapEntry(0, $1EC, $CC, 0, 0, 0, 4, $1E8)
    %spritemapEntry(0, $6E, $07, 0, 0, 0, 4, $1EA)
    %spritemapEntry(0, $1BF, $3A, 0, 0, 0, 4, $1EB)
    %spritemapEntry(0, $38, $34, 0, 0, 0, 4, $1E8)
    %spritemapEntry(0, $2E, $44, 0, 0, 0, 4, $1E9)
    %spritemapEntry(0, $49, $29, 0, 0, 0, 4, $1E9)
    %spritemapEntry(0, $1B8, $FF, 0, 0, 0, 4, $1EA)
    %spritemapEntry(0, $19E, $12, 0, 0, 0, 4, $1E8)
    %spritemapEntry(0, $1D0, $24, 0, 0, 0, 4, $1EA)
    %spritemapEntry(0, $1E0, $04, 0, 0, 0, 4, $1E9)


;;; $9478: Ceres stars ;;;
SpaceSpritemaps_CeresStars:
    dw $0019
    %spritemapEntry(0, $192, $D0, 0, 1, 0, 4, $1EB)
    %spritemapEntry(0, $1A2, $B0, 0, 1, 0, 4, $1E8)
    %spritemapEntry(0, $0F, $34, 0, 1, 0, 4, $1EA)
    %spritemapEntry(0, $1E8, $F4, 0, 1, 0, 4, $1EA)
    %spritemapEntry(0, $1A2, $FB, 0, 1, 0, 4, $1E8)
    %spritemapEntry(0, $1D6, $B4, 0, 1, 0, 4, $1E8)
    %spritemapEntry(0, $40, $79, 0, 1, 0, 4, $1E8)
    %spritemapEntry(0, $1BC, $E7, 0, 1, 0, 4, $1EC)
    %spritemapEntry(0, $183, $22, 0, 1, 0, 4, $1EC)
    %spritemapEntry(0, $182, $6F, 0, 1, 0, 4, $1E8)
    %spritemapEntry(0, $61, $6C, 0, 1, 0, 4, $1E9)
    %spritemapEntry(0, $25, $50, 0, 1, 0, 4, $1E9)
    %spritemapEntry(0, $18C, $5E, 0, 1, 0, 4, $1E8)
    %spritemapEntry(0, $1AA, $5D, 0, 1, 0, 4, $1EA)
    %spritemapEntry(0, $17, $C0, 0, 1, 0, 4, $1E8)
    %spritemapEntry(0, $1AC, $4A, 0, 1, 0, 4, $1E9)
    %spritemapEntry(0, $3D, $B9, 0, 1, 0, 4, $1E9)
    %spritemapEntry(0, $37, $69, 0, 1, 0, 4, $1E8)
    %spritemapEntry(0, $1C9, $23, 0, 1, 0, 4, $1EA)
    %spritemapEntry(0, $1B2, $7A, 0, 1, 0, 4, $1EA)
    %spritemapEntry(0, $1F8, $E4, 0, 1, 0, 4, $1EB)
    %spritemapEntry(0, $18C, $2E, 0, 1, 0, 4, $1EB)
    %spritemapEntry(0, $25, $E6, 0, 1, 0, 4, $1E9)
    %spritemapEntry(0, $1F5, $CD, 0, 1, 0, 4, $1EA)
    %spritemapEntry(0, $47, $E2, 0, 1, 0, 4, $1E8)


;;; $94F7: Ceres explosion large asteroids ;;;
SpaceSpritemaps_CeresExplosionLargeAsteroids:
    dw $0013
    %spritemapEntry(1, $43A7, $CF, 0, 0, 0, 4, $183)
    %spritemapEntry(1, $43A7, $BF, 0, 0, 0, 4, $163)
    %spritemapEntry(1, $439F, $CF, 0, 0, 0, 4, $182)
    %spritemapEntry(1, $438F, $CF, 0, 0, 0, 4, $180)
    %spritemapEntry(1, $439F, $BF, 0, 0, 0, 4, $162)
    %spritemapEntry(1, $438F, $BF, 0, 0, 0, 4, $160)
    %spritemapEntry(0, $58, $FC, 0, 0, 0, 4, $1A9)
    %spritemapEntry(1, $4260, $F4, 0, 0, 0, 4, $19A)
    %spritemapEntry(1, $4270, $DC, 0, 0, 0, 4, $16C)
    %spritemapEntry(1, $4268, $EC, 0, 0, 0, 4, $18B)
    %spritemapEntry(1, $4258, $EC, 0, 0, 0, 4, $189)
    %spritemapEntry(1, $4268, $DC, 0, 0, 0, 4, $16B)
    %spritemapEntry(1, $4258, $DC, 0, 0, 0, 4, $169)
    %spritemapEntry(1, $4210, $28, 0, 0, 0, 4, $1A7)
    %spritemapEntry(1, $4200, $28, 0, 0, 0, 4, $1A5)
    %spritemapEntry(1, $4210, $18, 0, 0, 0, 4, $187)
    %spritemapEntry(1, $4200, $18, 0, 0, 0, 4, $185)
    %spritemapEntry(1, $4210, $08, 0, 0, 0, 4, $167)
    %spritemapEntry(1, $4200, $08, 0, 0, 0, 4, $165)


;;; $9558: Zebes ;;;
SpaceSpritemaps_Zebes:
    dw $0032
    %spritemapEntry(0, $1C8, $10, 0, 0, 0, 7, $6D)
    %spritemapEntry(0, $1D8, $C8, 0, 0, 0, 7, $11)
    %spritemapEntry(0, $1D0, $C8, 0, 0, 0, 7, $10)
    %spritemapEntry(0, $1D8, $C0, 0, 0, 0, 7, $01)
    %spritemapEntry(0, $1C0, $D8, 0, 0, 0, 7, $19)
    %spritemapEntry(0, $08, $20, 0, 0, 0, 7, $8E)
    %spritemapEntry(0, $00, $20, 0, 0, 0, 7, $8D)
    %spritemapEntry(0, $1F8, $20, 0, 0, 0, 7, $8C)
    %spritemapEntry(0, $1F0, $20, 0, 0, 0, 7, $8B)
    %spritemapEntry(0, $1E8, $20, 0, 0, 0, 7, $8A)
    %spritemapEntry(0, $1E0, $20, 0, 0, 0, 7, $89)
    %spritemapEntry(0, $1D8, $20, 0, 0, 0, 7, $88)
    %spritemapEntry(0, $10, $18, 0, 0, 0, 7, $96)
    %spritemapEntry(0, $18, $10, 0, 0, 0, 7, $87)
    %spritemapEntry(0, $10, $10, 0, 0, 0, 7, $86)
    %spritemapEntry(1, $4200, $10, 0, 0, 0, 7, $84)
    %spritemapEntry(1, $43F0, $10, 0, 0, 0, 7, $82)
    %spritemapEntry(1, $43E0, $10, 0, 0, 0, 7, $80)
    %spritemapEntry(1, $43D0, $10, 0, 0, 0, 7, $6E)
    %spritemapEntry(1, $4218, $00, 0, 0, 0, 7, $6B)
    %spritemapEntry(1, $4210, $00, 0, 0, 0, 7, $6A)
    %spritemapEntry(1, $4200, $00, 0, 0, 0, 7, $68)
    %spritemapEntry(1, $43F0, $00, 0, 0, 0, 7, $66)
    %spritemapEntry(1, $43E0, $00, 0, 0, 0, 7, $64)
    %spritemapEntry(1, $43D0, $00, 0, 0, 0, 7, $62)
    %spritemapEntry(1, $43C0, $00, 0, 0, 0, 7, $60)
    %spritemapEntry(1, $4218, $F0, 0, 0, 0, 7, $4E)
    %spritemapEntry(1, $4210, $F0, 0, 0, 0, 7, $4D)
    %spritemapEntry(1, $4200, $F0, 0, 0, 0, 7, $4B)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 0, 7, $49)
    %spritemapEntry(1, $43E0, $F0, 0, 0, 0, 7, $47)
    %spritemapEntry(1, $43D0, $F0, 0, 0, 0, 7, $45)
    %spritemapEntry(1, $43C0, $F0, 0, 0, 0, 7, $43)
    %spritemapEntry(1, $4218, $E0, 0, 0, 0, 7, $41)
    %spritemapEntry(1, $4210, $E0, 0, 0, 0, 7, $2E) ; <-- Tiling error when flying to Zebes, tile index should be 2Fh
    %spritemapEntry(1, $4200, $E0, 0, 0, 0, 7, $2D)
    %spritemapEntry(1, $43F0, $E0, 0, 0, 0, 7, $2B)
    %spritemapEntry(1, $43E0, $E0, 0, 0, 0, 7, $29)
    %spritemapEntry(1, $43D0, $E0, 0, 0, 0, 7, $27)
    %spritemapEntry(1, $43C0, $E0, 0, 0, 0, 7, $25)
    %spritemapEntry(0, $10, $C8, 0, 0, 0, 7, $18)
    %spritemapEntry(1, $4210, $D0, 0, 0, 0, 7, $23)
    %spritemapEntry(1, $4208, $D0, 0, 0, 0, 7, $22)
    %spritemapEntry(1, $43F8, $D0, 0, 0, 0, 7, $20)
    %spritemapEntry(1, $43E8, $D0, 0, 0, 0, 7, $0E)
    %spritemapEntry(1, $43D8, $D0, 0, 0, 0, 7, $0C)
    %spritemapEntry(1, $43C8, $D0, 0, 0, 0, 7, $0A)
    %spritemapEntry(1, $4200, $C0, 0, 0, 0, 7, $06)
    %spritemapEntry(1, $43F0, $C0, 0, 0, 0, 7, $04)
    %spritemapEntry(1, $43E0, $C0, 0, 0, 0, 7, $02)


;;; $9654: 'Planet Zebes' ;;;
SpaceSpritemaps_PlanetZebes:
    dw $000B
    %spritemapEntry(0, $28, $F8, 0, 0, 0, 0, $9E)
    %spritemapEntry(0, $20, $F8, 0, 0, 0, 0, $9A)
    %spritemapEntry(0, $18, $F8, 0, 0, 0, 0, $9D)
    %spritemapEntry(0, $10, $F8, 0, 0, 0, 0, $9A)
    %spritemapEntry(0, $08, $F8, 0, 0, 0, 0, $9C)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 0, 0, $9B)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 0, 0, $9A)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 0, 0, $99)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 0, 0, $98)
    %spritemapEntry(0, $1D8, $F8, 0, 0, 0, 0, $97)
    %spritemapEntry(0, $1D0, $F8, 0, 0, 0, 0, $8F)


;;; $968D: '惑星ゼーベス' ;;;
SpaceSpritemaps_JapanText_PlanetZebes:
    dw $000C
    %spritemapEntry(0, $10, $00, 0, 0, 0, 0, $AA)
    %spritemapEntry(0, $08, $00, 0, 0, 0, 0, $A9)
    %spritemapEntry(0, $00, $00, 0, 0, 0, 0, $A8)
    %spritemapEntry(0, $1F8, $00, 0, 0, 0, 0, $A7)
    %spritemapEntry(0, $1F0, $00, 0, 0, 0, 0, $A6)
    %spritemapEntry(0, $1E8, $00, 0, 0, 0, 0, $A5)
    %spritemapEntry(0, $10, $F8, 0, 0, 0, 0, $A4)
    %spritemapEntry(0, $08, $F8, 0, 0, 0, 0, $A3)
    %spritemapEntry(0, $00, $F8, 0, 0, 0, 0, $A2)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 0, 0, $A1)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 0, 0, $A0)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 0, 0, $9F)


if !FEATURE_KEEP_UNREFERENCED
;;; $96CB: Unused. Zebes stars 1 ;;;
UNUSED_SpaceSpritemaps_ZebesStars1_8C96CB:
    dw $001D
    %spritemapEntry(0, $1F0, $38, 0, 0, 0, 4, $09)
    %spritemapEntry(0, $00, $50, 0, 0, 0, 4, $09)
    %spritemapEntry(0, $60, $48, 0, 0, 0, 4, $09)
    %spritemapEntry(0, $30, $48, 0, 0, 0, 4, $08)
    %spritemapEntry(0, $38, $20, 0, 0, 0, 4, $08)
    %spritemapEntry(0, $48, $30, 0, 0, 0, 4, $50)
    %spritemapEntry(0, $70, $28, 0, 0, 0, 4, $00)
    %spritemapEntry(0, $70, $10, 0, 0, 0, 4, $08)
    %spritemapEntry(0, $50, $F0, 0, 0, 0, 4, $40)
    %spritemapEntry(0, $68, $D8, 0, 0, 0, 4, $AB)
    %spritemapEntry(0, $38, $B8, 0, 0, 0, 4, $08)
    %spritemapEntry(0, $60, $A8, 0, 0, 0, 4, $50)
    %spritemapEntry(0, $48, $88, 0, 0, 0, 4, $00)
    %spritemapEntry(0, $70, $88, 0, 0, 0, 4, $09)
    %spritemapEntry(0, $1B8, $20, 0, 0, 0, 4, $40)
    %spritemapEntry(0, $190, $38, 0, 0, 0, 4, $09)
    %spritemapEntry(0, $1E8, $88, 0, 0, 0, 4, $40)
    %spritemapEntry(0, $1F0, $98, 0, 0, 0, 4, $09)
    %spritemapEntry(0, $1D8, $A8, 0, 0, 0, 4, $09)
    %spritemapEntry(0, $1C8, $90, 0, 0, 0, 4, $09)
    %spritemapEntry(0, $188, $10, 0, 0, 0, 4, $00)
    %spritemapEntry(0, $198, $E8, 0, 0, 0, 4, $09)
    %spritemapEntry(0, $1B0, $D8, 0, 0, 0, 4, $08)
    %spritemapEntry(0, $188, $D8, 0, 0, 0, 4, $40)
    %spritemapEntry(0, $1B0, $B8, 0, 0, 0, 4, $AB)
    %spritemapEntry(0, $1A8, $A0, 0, 0, 0, 4, $00)
    %spritemapEntry(0, $198, $A8, 0, 0, 0, 4, $40)
    %spritemapEntry(0, $188, $B0, 0, 0, 0, 4, $09)
    %spritemapEntry(0, $190, $88, 0, 0, 0, 4, $00)
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $975E: Zebes stars 2 ;;;
SpaceSpritemaps_ZebesStars2:
    dw $000C
    %spritemapEntry(0, $38, $D8, 0, 0, 0, 4, $40)
    %spritemapEntry(0, $40, $E8, 0, 0, 0, 4, $09)
    %spritemapEntry(0, $28, $F8, 0, 0, 0, 4, $09)
    %spritemapEntry(0, $18, $E0, 0, 0, 0, 4, $09)
    %spritemapEntry(0, $1E8, $38, 0, 0, 0, 4, $09)
    %spritemapEntry(0, $00, $28, 0, 0, 0, 4, $08)
    %spritemapEntry(0, $1D8, $28, 0, 0, 0, 4, $40)
    %spritemapEntry(0, $00, $08, 0, 0, 0, 4, $AB)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 0, 4, $00)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 0, 4, $40)
    %spritemapEntry(0, $1D8, $00, 0, 0, 0, 4, $09)
    %spritemapEntry(0, $1E0, $D8, 0, 0, 0, 4, $00)


;;; $979C: Zebes stars 3 ;;;
SpaceSpritemaps_ZebesStars3:
    dw $0006
    %spritemapEntry(0, $00, $40, 0, 0, 0, 4, $40)
    %spritemapEntry(0, $18, $28, 0, 0, 0, 4, $AB)
    %spritemapEntry(0, $1E8, $08, 0, 0, 0, 4, $08)
    %spritemapEntry(0, $10, $F8, 0, 0, 0, 4, $50)
    %spritemapEntry(0, $1F8, $D8, 0, 0, 0, 4, $00)
    %spritemapEntry(0, $20, $D8, 0, 0, 0, 4, $09)


;;; $97BC: Zebes stars 4 ;;;
SpaceSpritemaps_ZebesStars4:
    dw $0004
    %spritemapEntry(0, $40, $E8, 0, 0, 0, 4, $09)
    %spritemapEntry(0, $08, $D0, 0, 0, 0, 4, $40)
    %spritemapEntry(0, $1E0, $E8, 0, 0, 0, 4, $09)
    %spritemapEntry(0, $1D8, $C0, 0, 0, 0, 4, $00)


;;; $97D2: Zebes stars 5 ;;;
SpaceSpritemaps_ZebesStars5:
    dw $0007
    %spritemapEntry(0, $1B0, $00, 0, 0, 0, 4, $09)
    %spritemapEntry(0, $10, $F8, 0, 0, 0, 4, $09)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 0, 4, $08)
    %spritemapEntry(0, $1E8, $D0, 0, 0, 0, 4, $08)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 0, 4, $50)
    %spritemapEntry(0, $20, $D8, 0, 0, 0, 4, $00)
    %spritemapEntry(0, $20, $C0, 0, 0, 0, 4, $08)


;;; $97F7: Intro Mother Brain explosion - small (frame 1) ;;;
SpaceSpritemaps_IntroMotherBrainExplosionSmallFrame1:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $53)


;;; $97FE: Intro Mother Brain explosion - small (frame 2) ;;;
SpaceSpritemaps_IntroMotherBrainExplosionSmallFrame2:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $51)


;;; $9805: Intro Mother Brain explosion - small (frame 3) ;;;
SpaceSpritemaps_IntroMotherBrainExplosionSmallFrame3:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $60)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $60)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $60)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $60)


;;; $981B: Intro Mother Brain explosion - small (frame 4) ;;;
SpaceSpritemaps_IntroMotherBrainExplosionSmallFrame4:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $61)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $61)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $61)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $61)


;;; $9831: Intro Mother Brain explosion - small (frame 5) ;;;
SpaceSpritemaps_IntroMotherBrainExplosionSmallFrame5:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $62)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $62)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $62)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $62)


;;; $9847: Intro Mother Brain explosion - small (frame 6) ;;;
SpaceSpritemaps_IntroMotherBrainExplosionSmallFrame6:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $63)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $63)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $63)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $63)


;;; $985D: Intro Mother Brain explosion - big (frame 1) ;;;
SpaceSpritemaps_IntroMotherBrainExplosionBigFrame1:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $5F)


;;; $9864: Intro Mother Brain explosion - big (frame 2) ;;;
SpaceSpritemaps_IntroMotherBrainExplosionBigFrame2:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $8A)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $8A)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $8A)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $8A)


;;; $987A: Intro Mother Brain explosion - big (frame 3) ;;;
SpaceSpritemaps_IntroMotherBrainExplosionBigFrame3:
    dw $0004
    %spritemapEntry(1, $4200, $00, 1, 1, 3, 5, $90)
    %spritemapEntry(1, $43F0, $00, 1, 0, 3, 5, $90)
    %spritemapEntry(1, $4200, $F0, 0, 1, 3, 5, $90)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 5, $90)


;;; $9890: Intro Mother Brain explosion - big (frame 4) ;;;
SpaceSpritemaps_IntroMotherBrainExplosionBigFrame4:
    dw $0004
    %spritemapEntry(1, $4200, $00, 1, 1, 3, 5, $92)
    %spritemapEntry(1, $43F0, $00, 1, 0, 3, 5, $92)
    %spritemapEntry(1, $4200, $F0, 0, 1, 3, 5, $92)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 5, $92)


;;; $98A6: Intro Mother Brain explosion - big (frame 5) ;;;
SpaceSpritemaps_IntroMotherBrainExplosionBigFrame5:
    dw $0004
    %spritemapEntry(1, $4200, $00, 1, 1, 3, 5, $94)
    %spritemapEntry(1, $43F0, $00, 1, 0, 3, 5, $94)
    %spritemapEntry(1, $4200, $F0, 0, 1, 3, 5, $94)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 5, $94)


;;; $98BC: Intro Mother Brain explosion - big (frame 6) ;;;
SpaceSpritemaps_IntroMotherBrainExplosionBigFrame6:
    dw $0004
    %spritemapEntry(1, $4200, $00, 1, 1, 3, 5, $96)
    %spritemapEntry(1, $43F0, $00, 1, 0, 3, 5, $96)
    %spritemapEntry(1, $4200, $F0, 0, 1, 3, 5, $96)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 5, $96)


;;; $98D2: Ceres explosion 3 frame 1 ;;;
SpaceSpritemaps_CeresExplosionFrame1:
    dw $0001
    %spritemapEntry(1, $43F8, $F6, 0, 0, 3, 5, $76)


;;; $98D9: Ceres explosion 3 frame 2 ;;;
SpaceSpritemaps_CeresExplosionFrame2:
    dw $0001
    %spritemapEntry(1, $43F8, $F4, 0, 0, 3, 5, $78)


;;; $98E0: Ceres explosion 3 frame 3 ;;;
SpaceSpritemaps_CeresExplosionFrame3:
    dw $0001
    %spritemapEntry(1, $43F8, $F2, 0, 0, 3, 5, $98)


;;; $98E7: Ceres explosion 3 frame 4 ;;;
SpaceSpritemaps_CeresExplosionFrame4:
    dw $0001
    %spritemapEntry(1, $43F8, $F0, 0, 0, 3, 5, $9E)


;;; $98EE: Ceres final explosion (frame 1) ;;;
SpaceSpritemaps_CeresFinalExplosionFrame1:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $8A)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 5, $8A)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 5, $8A)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 5, $8A)


;;; $9904: Ceres final explosion (frame 2) ;;;
SpaceSpritemaps_CeresFinalExplosionFrame2:
    dw $0004
    %spritemapEntry(1, $4200, $00, 1, 1, 3, 5, $90)
    %spritemapEntry(1, $4200, $F0, 0, 1, 3, 5, $90)
    %spritemapEntry(1, $43F0, $00, 1, 0, 3, 5, $90)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 5, $90)


;;; $991A: Ceres final explosion (frame 3) ;;;
SpaceSpritemaps_CeresFinalExplosionFrame3:
    dw $0004
    %spritemapEntry(1, $4200, $00, 1, 1, 3, 5, $92)
    %spritemapEntry(1, $43F0, $00, 1, 0, 3, 5, $92)
    %spritemapEntry(1, $4200, $F0, 0, 1, 3, 5, $92)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 5, $92)


;;; $9930: Ceres final explosion (frame 4) ;;;
SpaceSpritemaps_CeresFinalExplosionFrame4:
    dw $000C
    %spritemapEntry(0, $10, $00, 1, 1, 3, 5, $C2)
    %spritemapEntry(0, $10, $F8, 0, 1, 3, 5, $C2)
    %spritemapEntry(0, $00, $10, 1, 1, 3, 5, $B2)
    %spritemapEntry(0, $1F8, $10, 1, 0, 3, 5, $B2)
    %spritemapEntry(0, $1E8, $00, 1, 0, 3, 5, $C2)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 5, $C2)
    %spritemapEntry(0, $00, $E8, 0, 1, 3, 5, $B2)
    %spritemapEntry(0, $1F8, $E8, 0, 0, 3, 5, $B2)
    %spritemapEntry(1, $4200, $00, 1, 1, 3, 5, $B0)
    %spritemapEntry(1, $4200, $F0, 0, 1, 3, 5, $B0)
    %spritemapEntry(1, $43F0, $00, 1, 0, 3, 5, $B0)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 5, $B0)


;;; $996E: Ceres final explosion (frame 5) ;;;
SpaceSpritemaps_CeresFinalExplosionFrame5:
    dw $0008
    %spritemapEntry(1, $4208, $00, 1, 1, 3, 5, $B5)
    %spritemapEntry(1, $4200, $08, 1, 1, 3, 5, $B3)
    %spritemapEntry(1, $43E8, $00, 1, 0, 3, 5, $B5)
    %spritemapEntry(1, $43F0, $08, 1, 0, 3, 5, $B3)
    %spritemapEntry(1, $4208, $F0, 0, 1, 3, 5, $B5)
    %spritemapEntry(1, $4200, $E8, 0, 1, 3, 5, $B3)
    %spritemapEntry(1, $43E8, $F0, 0, 0, 3, 5, $B5)
    %spritemapEntry(1, $43F0, $E8, 0, 0, 3, 5, $B3)


;;; $9998: Ceres final explosion (frame 6) ;;;
SpaceSpritemaps_CeresFinalExplosionFrame6:
    dw $000C
    %spritemapEntry(0, $00, $10, 1, 1, 3, 5, $BB)
    %spritemapEntry(0, $1F8, $10, 1, 0, 3, 5, $BB)
    %spritemapEntry(0, $00, $E8, 0, 1, 3, 5, $BB)
    %spritemapEntry(0, $1F8, $E8, 0, 0, 3, 5, $BB)
    %spritemapEntry(0, $10, $00, 1, 1, 3, 5, $B7)
    %spritemapEntry(0, $10, $F8, 0, 1, 3, 5, $B7)
    %spritemapEntry(0, $1E8, $00, 1, 0, 3, 5, $B7)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 5, $B7)
    %spritemapEntry(1, $4208, $08, 1, 1, 3, 5, $B8)
    %spritemapEntry(1, $43E8, $08, 1, 0, 3, 5, $B8)
    %spritemapEntry(1, $4208, $E8, 0, 1, 3, 5, $B8)
    %spritemapEntry(1, $43E8, $E8, 0, 0, 3, 5, $B8)


;;; $99D6: Large Samus from ending (standing) ;;;
EndingSequenceSpritemaps_LargeSamusFromEndingStanding:
    dw $0022
    %spritemapEntry(1, $4210, $08, 0, 0, 3, 6, $BE)
    %spritemapEntry(1, $4210, $F8, 0, 0, 3, 6, $9E)
    %spritemapEntry(1, $4210, $E8, 0, 0, 3, 6, $7E)
    %spritemapEntry(1, $4210, $D8, 0, 0, 3, 6, $5E)
    %spritemapEntry(0, $18, $38, 0, 0, 3, 6, $E6)
    %spritemapEntry(0, $18, $30, 0, 0, 3, 6, $D6)
    %spritemapEntry(1, $4208, $30, 0, 0, 3, 6, $D4)
    %spritemapEntry(0, $18, $D8, 0, 0, 3, 6, $26)
    %spritemapEntry(0, $18, $D0, 0, 0, 3, 6, $16)
    %spritemapEntry(0, $18, $C8, 0, 0, 3, 6, $06)
    %spritemapEntry(0, $1F0, $10, 0, 0, 3, 6, $91)
    %spritemapEntry(0, $1F0, $08, 0, 0, 3, 6, $81)
    %spritemapEntry(0, $1E8, $08, 0, 0, 3, 6, $80)
    %spritemapEntry(0, $1F0, $28, 0, 0, 3, 6, $C1)
    %spritemapEntry(1, $43F8, $30, 0, 0, 3, 6, $D2)
    %spritemapEntry(1, $43E8, $30, 0, 0, 3, 6, $D0)
    %spritemapEntry(1, $4208, $28, 0, 0, 3, 6, $C4)
    %spritemapEntry(1, $43F8, $28, 0, 0, 3, 6, $C2)
    %spritemapEntry(1, $4208, $18, 0, 0, 3, 6, $A4)
    %spritemapEntry(1, $43F8, $18, 0, 0, 3, 6, $A2)
    %spritemapEntry(1, $4208, $08, 0, 0, 3, 6, $84)
    %spritemapEntry(1, $43F8, $08, 0, 0, 3, 6, $82)
    %spritemapEntry(1, $4208, $F8, 0, 0, 3, 6, $64)
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 6, $62)
    %spritemapEntry(1, $43E8, $F8, 0, 0, 3, 6, $60)
    %spritemapEntry(1, $4208, $E8, 0, 0, 3, 6, $44)
    %spritemapEntry(1, $43F8, $E8, 0, 0, 3, 6, $42)
    %spritemapEntry(1, $43E8, $E8, 0, 0, 3, 6, $40)
    %spritemapEntry(1, $4208, $D8, 0, 0, 3, 6, $24)
    %spritemapEntry(1, $43F8, $D8, 0, 0, 3, 6, $22)
    %spritemapEntry(1, $43E8, $D8, 0, 0, 3, 6, $20)
    %spritemapEntry(1, $4208, $C8, 0, 0, 3, 6, $04)
    %spritemapEntry(1, $43F8, $C8, 0, 0, 3, 6, $02)
    %spritemapEntry(1, $43E8, $C8, 0, 0, 3, 6, $00)


;;; $9A82: Large Samus from ending (preparing to jump) ;;;
EndingSequenceSpritemaps_LargeSamusFromEndingPreparingToJump:
    dw $0016
    %spritemapEntry(0, $1DA, $DD, 0, 0, 3, 6, $100)
    %spritemapEntry(1, $43DA, $E5, 0, 0, 3, 6, $110)
    %spritemapEntry(0, $12, $D5, 0, 0, 3, 6, $F7)
    %spritemapEntry(0, $0A, $D5, 0, 0, 3, 6, $F6)
    %spritemapEntry(0, $1F2, $D5, 0, 0, 3, 6, $F3)
    %spritemapEntry(0, $1EA, $D5, 0, 0, 3, 6, $F2)
    %spritemapEntry(0, $1E2, $D5, 0, 0, 3, 6, $F1)
    %spritemapEntry(0, $1EA, $ED, 0, 0, 3, 6, $122)
    %spritemapEntry(1, $4212, $ED, 0, 0, 3, 6, $127)
    %spritemapEntry(1, $4202, $2D, 0, 0, 3, 6, $1A5)
    %spritemapEntry(1, $4202, $1D, 0, 0, 3, 6, $185)
    %spritemapEntry(1, $43F2, $1D, 0, 0, 3, 6, $183)
    %spritemapEntry(1, $4202, $0D, 0, 0, 3, 6, $165)
    %spritemapEntry(1, $43F2, $0D, 0, 0, 3, 6, $163)
    %spritemapEntry(1, $4202, $FD, 0, 0, 3, 6, $145)
    %spritemapEntry(1, $43F2, $FD, 0, 0, 3, 6, $143)
    %spritemapEntry(1, $4202, $ED, 0, 0, 3, 6, $125)
    %spritemapEntry(1, $43F2, $ED, 0, 0, 3, 6, $123)
    %spritemapEntry(1, $4212, $DD, 0, 0, 3, 6, $107)
    %spritemapEntry(1, $4202, $DD, 0, 0, 3, 6, $105)
    %spritemapEntry(1, $43F2, $DD, 0, 0, 3, 6, $103)
    %spritemapEntry(1, $43E2, $DD, 0, 0, 3, 6, $101)


;;; $9AF2: Large Samus from ending (jumping) ;;;
EndingSequenceSpritemaps_LargeSamusFromEndingJumping:
    dw $0014
    %spritemapEntry(1, $43FC, $CB, 0, 0, 3, 6, $1B)
    %spritemapEntry(1, $4213, $D3, 0, 0, 3, 6, $2E)
    %spritemapEntry(1, $4213, $C3, 0, 0, 3, 6, $0E)
    %spritemapEntry(1, $43E5, $C2, 0, 0, 3, 6, $08)
    %spritemapEntry(1, $43DC, $D4, 0, 0, 3, 6, $27)
    %spritemapEntry(1, $43DC, $CC, 0, 0, 3, 6, $17)
    %spritemapEntry(1, $420C, $DB, 0, 0, 3, 6, $3D)
    %spritemapEntry(1, $43FC, $DB, 0, 0, 3, 6, $3B)
    %spritemapEntry(1, $43EC, $DB, 0, 0, 3, 6, $39)
    %spritemapEntry(1, $420C, $CB, 0, 0, 3, 6, $1D)
    %spritemapEntry(1, $43EC, $CB, 0, 0, 3, 6, $19)
    %spritemapEntry(1, $4200, $EB, 0, 0, 3, 6, $5C)
    %spritemapEntry(1, $43F0, $EB, 0, 0, 3, 6, $5A)
    %spritemapEntry(0, $00, $33, 0, 0, 3, 6, $EC)
    %spritemapEntry(1, $4200, $23, 0, 0, 3, 6, $CC)
    %spritemapEntry(1, $4200, $13, 0, 0, 3, 6, $AC)
    %spritemapEntry(1, $4200, $03, 0, 0, 3, 6, $8C)
    %spritemapEntry(1, $43F0, $03, 0, 0, 3, 6, $8A)
    %spritemapEntry(1, $4200, $F3, 0, 0, 3, 6, $6C)
    %spritemapEntry(1, $43F0, $F3, 0, 0, 3, 6, $6A)


;;; $9B58: Large Samus helmet from ending (frame 1) ;;;
EndingSequenceSpritemaps_LargeSamusHelmetFromEndingFrame1:
    dw $0005
    %spritemapEntry(0, $04, $03, 0, 0, 3, 6, $98)
    %spritemapEntry(0, $1FC, $03, 0, 0, 3, 6, $97)
    %spritemapEntry(0, $1F4, $03, 0, 0, 3, 6, $96)
    %spritemapEntry(1, $43F4, $F3, 0, 0, 3, 6, $76)
    %spritemapEntry(1, $43FC, $F3, 0, 0, 3, 6, $77)


;;; $9B73: Large Samus helmet from ending (frame 2) ;;;
EndingSequenceSpritemaps_LargeSamusHelmetFromEndingFrame2:
    dw $0005
    %spritemapEntry(1, $43FC, $FA, 0, 0, 3, 6, $57)
    %spritemapEntry(0, $04, $F2, 0, 0, 3, 6, $48)
    %spritemapEntry(0, $1FC, $F2, 0, 0, 3, 6, $47)
    %spritemapEntry(0, $1F4, $F2, 0, 0, 3, 6, $46)
    %spritemapEntry(1, $43F4, $FA, 0, 0, 3, 6, $56)


;;; $9B8E: Jumping Samus head from ending ;;;
EndingSequenceSpritemaps_JumpingSamusHeadFromEnding:
    dw $0003
    %spritemapEntry(0, $00, $F2, 0, 0, 3, 5, $148)
    %spritemapEntry(0, $1F8, $F2, 0, 0, 3, 5, $147)
    %spritemapEntry(1, $43F8, $FA, 0, 0, 3, 5, $157)


;;; $9B9F: Samus arm from ending (frame 1) ;;;
EndingSequenceSpritemaps_SamusArmFromEndingFrame1:
    dw $0005
    %spritemapEntry(1, $420C, $F5, 0, 0, 3, 6, $EE)
    %spritemapEntry(1, $4211, $ED, 0, 0, 3, 6, $E9)
    %spritemapEntry(1, $4210, $DE, 0, 0, 3, 6, $159)
    %spritemapEntry(0, $18, $D6, 0, 0, 3, 6, $14A)
    %spritemapEntry(0, $10, $D6, 0, 0, 3, 6, $149)


;;; $9BBA: Samus arm from ending (frame 2) ;;;
EndingSequenceSpritemaps_SamusArmFromEndingFrame2:
    dw $0006
    %spritemapEntry(0, $08, $F4, 0, 0, 3, 6, $11D)
    %spritemapEntry(0, $08, $EC, 0, 0, 3, 6, $10D)
    %spritemapEntry(1, $4210, $EC, 0, 0, 3, 6, $10E)
    %spritemapEntry(1, $4210, $DF, 0, 0, 3, 6, $159)
    %spritemapEntry(0, $18, $D7, 0, 0, 3, 6, $14A)
    %spritemapEntry(0, $10, $D7, 0, 0, 3, 6, $149)


;;; $9BDA: Samus arm from ending (frame 3) ;;;
EndingSequenceSpritemaps_SamusArmFromEndingFrame3:
    dw $0005
    %spritemapEntry(1, $4209, $E8, 0, 0, 3, 6, $129)
    %spritemapEntry(1, $4213, $E8, 0, 0, 3, 6, $109)
    %spritemapEntry(1, $4210, $DF, 0, 0, 3, 6, $159)
    %spritemapEntry(0, $18, $D7, 0, 0, 3, 6, $14A)
    %spritemapEntry(0, $10, $D7, 0, 0, 3, 6, $149)


;;; $9BF5: Samus arm from ending (frame 4) ;;;
EndingSequenceSpritemaps_SamusArmFromEndingFrame4:
    dw $0005
    %spritemapEntry(1, $420A, $E6, 0, 0, 3, 6, $129)
    %spritemapEntry(1, $4214, $E7, 0, 0, 3, 6, $109)
    %spritemapEntry(1, $4211, $DF, 0, 0, 3, 6, $159)
    %spritemapEntry(0, $19, $D7, 0, 0, 3, 6, $14A)
    %spritemapEntry(0, $11, $D7, 0, 0, 3, 6, $149)


;;; $9C10: Samus arm from ending (frame 5) ;;;
EndingSequenceSpritemaps_SamusArmFromEndingFrame5:
    dw $0005
    %spritemapEntry(1, $420D, $E5, 0, 0, 3, 6, $129)
    %spritemapEntry(1, $4214, $E8, 0, 0, 3, 6, $109)
    %spritemapEntry(1, $4211, $DF, 0, 0, 3, 6, $159)
    %spritemapEntry(0, $19, $D7, 0, 0, 3, 6, $14A)
    %spritemapEntry(0, $11, $D7, 0, 0, 3, 6, $149)


;;; $9C2B: Samus arm from ending (frame 6) ;;;
EndingSequenceSpritemaps_SamusArmFromEndingFrame6:
    dw $0005
    %spritemapEntry(1, $420E, $E4, 0, 0, 3, 6, $12B)
    %spritemapEntry(1, $4213, $E7, 0, 0, 3, 6, $10B)
    %spritemapEntry(1, $4211, $DF, 0, 0, 3, 6, $159)
    %spritemapEntry(0, $19, $D7, 0, 0, 3, 6, $14A)
    %spritemapEntry(0, $11, $D7, 0, 0, 3, 6, $149)


;;; $9C46: Samus arm from ending (frame 7) ;;;
EndingSequenceSpritemaps_SamusArmFromEndingFrame7:
    dw $0005
    %spritemapEntry(1, $420E, $E8, 0, 0, 3, 6, $12B)
    %spritemapEntry(1, $4213, $E9, 0, 0, 3, 6, $10B)
    %spritemapEntry(1, $4211, $DF, 0, 0, 3, 6, $159)
    %spritemapEntry(0, $19, $D7, 0, 0, 3, 6, $14A)
    %spritemapEntry(0, $11, $D7, 0, 0, 3, 6, $149)


;;; $9C61: Samus arm from ending (frame 8) ;;;
EndingSequenceSpritemaps_SamusArmFromEndingFrame8:
    dw $0005
    %spritemapEntry(1, $420E, $E9, 0, 0, 3, 6, $12B)
    %spritemapEntry(1, $4213, $E9, 0, 0, 3, 6, $10B)
    %spritemapEntry(1, $4211, $DF, 0, 0, 3, 6, $159)
    %spritemapEntry(0, $19, $D7, 0, 0, 3, 6, $14A)
    %spritemapEntry(0, $11, $D7, 0, 0, 3, 6, $149)


;;; $9C7C: Samus head from ending (frame 1) ;;;
EndingSequenceSpritemaps_SamusHeadFromEndingFrame1:
    dw $0002
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 5, $188)
    %spritemapEntry(1, $43F8, $F0, 0, 0, 3, 5, $178)


;;; $9C88: Samus head from ending (frame 2) ;;;
EndingSequenceSpritemaps_SamusHeadFromEndingFrame2:
    dw $0002
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 5, $18A)
    %spritemapEntry(1, $43F8, $F0, 0, 0, 3, 5, $178)


;;; $9C94: Samus head from ending (frame 3) ;;;
EndingSequenceSpritemaps_SamusHeadFromEndingFrame3:
    dw $0002
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 5, $18C)
    %spritemapEntry(1, $43F8, $F0, 0, 0, 3, 5, $178)


;;; $9CA0: Samus head from ending (frame 4) ;;;
EndingSequenceSpritemaps_SamusHeadFromEndingFrame4:
    dw $0002
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 5, $18E)
    %spritemapEntry(1, $43F8, $F0, 0, 0, 3, 5, $178)


;;; $9CAC: Samus head with helmet from ending ;;;
EndingSequenceSpritemaps_SamusHeadWithHelmetFromEnding:
    dw $0004
    %spritemapEntry(0, $1FC, $04, 0, 0, 3, 6, $1C9)
    %spritemapEntry(0, $1F4, $04, 0, 0, 3, 6, $1C8)
    %spritemapEntry(1, $43FC, $F4, 0, 0, 3, 6, $1A9)
    %spritemapEntry(1, $43F4, $F4, 0, 0, 3, 6, $1A8)


;;; $9CC2: Headless, armless, suited Samus ;;;
EndingSequenceSpritemaps_HeadlessArmlessSuitedSamus:
    dw $001E
    %spritemapEntry(0, $18, $38, 0, 0, 3, 6, $E6)
    %spritemapEntry(0, $18, $30, 0, 0, 3, 6, $D6)
    %spritemapEntry(1, $4208, $30, 0, 0, 3, 6, $D4)
    %spritemapEntry(0, $18, $D8, 0, 0, 3, 6, $26)
    %spritemapEntry(0, $18, $D0, 0, 0, 3, 6, $16)
    %spritemapEntry(0, $18, $C8, 0, 0, 3, 6, $06)
    %spritemapEntry(0, $1F0, $10, 0, 0, 3, 6, $91)
    %spritemapEntry(0, $1F0, $08, 0, 0, 3, 6, $81)
    %spritemapEntry(0, $1E8, $08, 0, 0, 3, 6, $80)
    %spritemapEntry(0, $1F0, $28, 0, 0, 3, 6, $C1)
    %spritemapEntry(1, $43F8, $30, 0, 0, 3, 6, $D2)
    %spritemapEntry(1, $43E8, $30, 0, 0, 3, 6, $D0)
    %spritemapEntry(1, $4208, $28, 0, 0, 3, 6, $C4)
    %spritemapEntry(1, $43F8, $28, 0, 0, 3, 6, $C2)
    %spritemapEntry(1, $4208, $18, 0, 0, 3, 6, $A4)
    %spritemapEntry(1, $43F8, $18, 0, 0, 3, 6, $A2)
    %spritemapEntry(1, $4208, $08, 0, 0, 3, 6, $84)
    %spritemapEntry(1, $43F8, $08, 0, 0, 3, 6, $82)
    %spritemapEntry(1, $4208, $F8, 0, 0, 3, 6, $64)
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 6, $62)
    %spritemapEntry(1, $43E8, $F8, 0, 0, 3, 6, $60)
    %spritemapEntry(1, $4208, $E8, 0, 0, 3, 6, $44)
    %spritemapEntry(1, $43F8, $E8, 0, 0, 3, 6, $42)
    %spritemapEntry(1, $43E8, $E8, 0, 0, 3, 6, $40)
    %spritemapEntry(1, $4208, $D8, 0, 0, 3, 6, $24)
    %spritemapEntry(1, $43F8, $D8, 0, 0, 3, 6, $22)
    %spritemapEntry(1, $43E8, $D8, 0, 0, 3, 6, $20)
    %spritemapEntry(1, $4208, $C8, 0, 0, 3, 6, $04)
    %spritemapEntry(1, $43F8, $C8, 0, 0, 3, 6, $02)
    %spritemapEntry(1, $43E8, $C8, 0, 0, 3, 6, $00)


;;; $9D5A: Samus - falling ;;;
EndingSequenceSpritemaps_SamusFalling:
    dw $000F
    %spritemapEntry(0, $08, $08, 0, 0, 0, 6, $54)
    %spritemapEntry(0, $08, $00, 0, 0, 0, 6, $44)
    %spritemapEntry(0, $08, $F8, 0, 0, 0, 6, $34)
    %spritemapEntry(0, $00, $20, 0, 0, 0, 6, $83)
    %spritemapEntry(0, $00, $18, 0, 0, 0, 6, $73)
    %spritemapEntry(0, $00, $10, 0, 0, 0, 6, $63)
    %spritemapEntry(0, $1F0, $F0, 0, 0, 0, 6, $21)
    %spritemapEntry(0, $1E8, $F0, 0, 0, 0, 6, $20)
    %spritemapEntry(0, $10, $F0, 0, 0, 0, 6, $25)
    %spritemapEntry(0, $08, $F0, 0, 0, 0, 6, $24)
    %spritemapEntry(1, $43E8, $E0, 0, 0, 0, 6, $00)
    %spritemapEntry(1, $4208, $E0, 0, 0, 0, 6, $04)
    %spritemapEntry(1, $43F8, $00, 0, 0, 0, 6, $42)
    %spritemapEntry(1, $43F8, $F0, 0, 0, 0, 6, $22)
    %spritemapEntry(1, $43F8, $E0, 0, 0, 0, 6, $02)


;;; $9DA7: Samus - landing ;;;
EndingSequenceSpritemaps_SamusLanding:
    dw $000D
    %spritemapEntry(0, $1F8, $17, 0, 0, 0, 6, $78)
    %spritemapEntry(0, $08, $1F, 0, 0, 0, 6, $8A)
    %spritemapEntry(0, $00, $1F, 0, 0, 0, 6, $89)
    %spritemapEntry(1, $4200, $0F, 0, 0, 0, 6, $69)
    %spritemapEntry(1, $4200, $FF, 0, 0, 0, 6, $49)
    %spritemapEntry(0, $10, $F7, 0, 0, 0, 6, $3B)
    %spritemapEntry(0, $08, $F7, 0, 0, 0, 6, $3A)
    %spritemapEntry(1, $43E8, $EF, 0, 0, 0, 6, $26)
    %spritemapEntry(0, $1F0, $E7, 0, 0, 0, 6, $17)
    %spritemapEntry(1, $4208, $E7, 0, 0, 0, 6, $1A)
    %spritemapEntry(1, $43F8, $07, 0, 0, 0, 6, $58)
    %spritemapEntry(1, $43F8, $F7, 0, 0, 0, 6, $38)
    %spritemapEntry(1, $43F8, $E7, 0, 0, 0, 6, $18)


;;; $9DEA: Samus - landed ;;;
EndingSequenceSpritemaps_SamusLanded:
    dw $0015
    %spritemapEntry(0, $1E8, $E8, 0, 0, 0, 6, $B0)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 0, 6, $A0)
    %spritemapEntry(0, $10, $D8, 0, 0, 0, 6, $95)
    %spritemapEntry(1, $4208, $E0, 0, 0, 0, 6, $A4)
    %spritemapEntry(0, $1F8, $20, 0, 0, 0, 6, $122)
    %spritemapEntry(0, $1F0, $20, 0, 0, 0, 6, $121)
    %spritemapEntry(0, $10, $20, 0, 0, 0, 6, $125)
    %spritemapEntry(0, $08, $20, 0, 0, 0, 6, $124)
    %spritemapEntry(0, $00, $20, 0, 0, 0, 6, $123)
    %spritemapEntry(1, $4200, $10, 0, 0, 0, 6, $103)
    %spritemapEntry(1, $43F0, $10, 0, 0, 0, 6, $101)
    %spritemapEntry(0, $08, $08, 0, 0, 0, 6, $F4)
    %spritemapEntry(0, $00, $08, 0, 0, 0, 6, $F3)
    %spritemapEntry(0, $1F8, $08, 0, 0, 0, 6, $F2)
    %spritemapEntry(0, $1F0, $08, 0, 0, 0, 6, $F1)
    %spritemapEntry(1, $4200, $F8, 0, 0, 0, 6, $D3)
    %spritemapEntry(1, $43F0, $F8, 0, 0, 0, 6, $D1)
    %spritemapEntry(1, $4200, $E8, 0, 0, 0, 6, $B3)
    %spritemapEntry(1, $43F0, $E8, 0, 0, 0, 6, $B1)
    %spritemapEntry(1, $4200, $D8, 0, 0, 0, 6, $93)
    %spritemapEntry(1, $43F0, $D8, 0, 0, 0, 6, $91)


;;; $9E55: Samus - shooting ;;;
EndingSequenceSpritemaps_SamusShooting:
    dw $000F
    %spritemapEntry(0, $14, $20, 0, 0, 0, 6, $12C)
    %spritemapEntry(1, $4204, $18, 0, 0, 0, 6, $11A)
    %spritemapEntry(0, $1F4, $18, 0, 0, 0, 6, $118)
    %spritemapEntry(1, $43E4, $18, 0, 0, 0, 6, $116)
    %spritemapEntry(0, $1EC, $08, 0, 0, 0, 6, $F7)
    %spritemapEntry(1, $4204, $10, 0, 0, 0, 6, $10A)
    %spritemapEntry(1, $43EC, $10, 0, 0, 0, 6, $107)
    %spritemapEntry(1, $4204, $00, 0, 0, 0, 6, $EA)
    %spritemapEntry(1, $43F4, $00, 0, 0, 0, 6, $E8)
    %spritemapEntry(1, $4204, $E0, 0, 0, 0, 6, $AA)
    %spritemapEntry(0, $0C, $F0, 0, 0, 0, 6, $CB)
    %spritemapEntry(1, $43FC, $F0, 0, 0, 0, 6, $C9)
    %spritemapEntry(1, $43EC, $F0, 0, 0, 0, 6, $C7)
    %spritemapEntry(1, $43FC, $E0, 0, 0, 0, 6, $A9)
    %spritemapEntry(1, $43EC, $E0, 0, 0, 0, 6, $A7)


;;; $9EA2: Suitless Samus - standing ;;;
EndingSequenceSpritemaps_SuitlessSamusStanding:
    dw $001C
    %spritemapEntry(0, $10, $28, 0, 0, 3, 1, $A4)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 1, $10)
    %spritemapEntry(0, $1F0, $40, 0, 0, 3, 1, $D0)
    %spritemapEntry(0, $08, $D8, 0, 0, 3, 1, $03)
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 1, $13)
    %spritemapEntry(1, $4208, $00, 0, 0, 3, 1, $12E)
    %spritemapEntry(0, $1F0, $18, 0, 0, 3, 1, $15D)
    %spritemapEntry(0, $1F0, $10, 0, 0, 3, 1, $14D)
    %spritemapEntry(0, $1F0, $08, 0, 0, 3, 1, $13D)
    %spritemapEntry(0, $1F0, $00, 0, 0, 3, 1, $12D)
    %spritemapEntry(1, $4208, $F0, 0, 0, 3, 1, $33)
    %spritemapEntry(0, $10, $30, 0, 0, 3, 1, $B4)
    %spritemapEntry(0, $18, $40, 0, 0, 3, 1, $D5)
    %spritemapEntry(1, $4208, $38, 0, 0, 3, 1, $C3)
    %spritemapEntry(1, $4200, $28, 0, 0, 3, 1, $A2)
    %spritemapEntry(1, $4200, $18, 0, 0, 3, 1, $82)
    %spritemapEntry(1, $4200, $08, 0, 0, 3, 1, $62)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 1, $40)
    %spritemapEntry(0, $1F0, $F0, 0, 0, 3, 1, $30)
    %spritemapEntry(0, $1F0, $E8, 0, 0, 3, 1, $20)
    %spritemapEntry(1, $4208, $E8, 0, 0, 3, 1, $23)
    %spritemapEntry(1, $43F8, $38, 0, 0, 3, 1, $C1)
    %spritemapEntry(1, $43F8, $28, 0, 0, 3, 1, $A1)
    %spritemapEntry(1, $43F8, $18, 0, 0, 3, 1, $81)
    %spritemapEntry(1, $43F8, $08, 0, 0, 3, 1, $61)
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 1, $41)
    %spritemapEntry(1, $43F8, $E8, 0, 0, 3, 1, $21)
    %spritemapEntry(1, $43F8, $D8, 0, 0, 3, 1, $01)


;;; $9F30: Suitless Samus - preparing to jump ;;;
EndingSequenceSpritemaps_SuitlessSamusPreparingToJump:
    dw $0014
    %spritemapEntry(0, $1F0, $08, 0, 0, 3, 1, $56)
    %spritemapEntry(0, $1F0, $00, 0, 0, 3, 1, $46)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 1, $36)
    %spritemapEntry(0, $1F0, $F0, 0, 0, 3, 1, $26)
    %spritemapEntry(0, $1F0, $E8, 0, 0, 3, 1, $16)
    %spritemapEntry(0, $08, $E8, 0, 0, 3, 1, $19)
    %spritemapEntry(0, $1F0, $20, 0, 0, 3, 1, $86)
    %spritemapEntry(1, $4200, $40, 0, 0, 3, 1, $C8)
    %spritemapEntry(1, $4200, $30, 0, 0, 3, 1, $A8)
    %spritemapEntry(1, $4200, $20, 0, 0, 3, 1, $88)
    %spritemapEntry(1, $4208, $10, 0, 0, 3, 1, $69)
    %spritemapEntry(1, $43E8, $10, 0, 0, 3, 1, $65)
    %spritemapEntry(1, $4208, $00, 0, 0, 3, 1, $49)
    %spritemapEntry(1, $4208, $F0, 0, 0, 3, 1, $29)
    %spritemapEntry(1, $43F8, $30, 0, 0, 3, 1, $A7)
    %spritemapEntry(1, $43F8, $20, 0, 0, 3, 1, $87)
    %spritemapEntry(1, $43F8, $10, 0, 0, 3, 1, $67)
    %spritemapEntry(1, $43F8, $00, 0, 0, 3, 1, $47)
    %spritemapEntry(1, $43F8, $F0, 0, 0, 3, 1, $27)
    %spritemapEntry(1, $43F8, $E0, 0, 0, 3, 1, $07)


;;; $9F96: Suitless Samus - jumping ;;;
EndingSequenceSpritemaps_SuitlessSamusJumping:
    dw $0013
    %spritemapEntry(0, $10, $F0, 0, 0, 3, 1, $BB)
    %spritemapEntry(0, $10, $E8, 0, 0, 3, 1, $AB)
    %spritemapEntry(0, $10, $E0, 0, 0, 3, 1, $9B)
    %spritemapEntry(0, $10, $D8, 0, 0, 3, 1, $8B)
    %spritemapEntry(0, $1E8, $E8, 0, 0, 3, 1, $2B)
    %spritemapEntry(0, $1E8, $E0, 0, 0, 3, 1, $1B)
    %spritemapEntry(0, $1E8, $D8, 0, 0, 3, 1, $0B)
    %spritemapEntry(1, $4200, $38, 0, 0, 3, 1, $CE)
    %spritemapEntry(1, $4200, $28, 0, 0, 3, 1, $AE)
    %spritemapEntry(1, $4200, $18, 0, 0, 3, 1, $8E)
    %spritemapEntry(1, $43F0, $18, 0, 0, 3, 1, $8C)
    %spritemapEntry(1, $4200, $08, 0, 0, 3, 1, $6E)
    %spritemapEntry(1, $43F0, $08, 0, 0, 3, 1, $6C)
    %spritemapEntry(1, $4200, $F8, 0, 0, 3, 1, $4E)
    %spritemapEntry(1, $43F0, $F8, 0, 0, 3, 1, $4C)
    %spritemapEntry(1, $4200, $E8, 0, 0, 3, 1, $2E)
    %spritemapEntry(1, $43F0, $E8, 0, 0, 3, 1, $2C)
    %spritemapEntry(1, $4200, $D8, 0, 0, 3, 1, $0E)
    %spritemapEntry(1, $43F0, $D8, 0, 0, 3, 1, $0C)


;;; $9FF7: Suitless Samus - standing, arms straight ;;;
EndingSequenceSpritemaps_SuitlessSamusStandingArmsStraight:
    dw $001C
    %spritemapEntry(0, $09, $E0, 0, 0, 3, 1, $193)
    %spritemapEntry(0, $08, $18, 0, 0, 3, 1, $1B5)
    %spritemapEntry(0, $08, $10, 0, 0, 3, 1, $1A5)
    %spritemapEntry(0, $08, $08, 0, 0, 3, 1, $195)
    %spritemapEntry(0, $08, $00, 0, 0, 3, 1, $185)
    %spritemapEntry(0, $08, $18, 0, 0, 3, 1, $83)
    %spritemapEntry(0, $08, $10, 0, 0, 3, 1, $73)
    %spritemapEntry(0, $08, $08, 0, 0, 3, 1, $63)
    %spritemapEntry(0, $1F0, $40, 0, 0, 3, 1, $D0)
    %spritemapEntry(0, $18, $40, 0, 0, 3, 1, $D5)
    %spritemapEntry(1, $43F8, $38, 0, 0, 3, 1, $C1)
    %spritemapEntry(1, $4208, $38, 0, 0, 3, 1, $C3)
    %spritemapEntry(1, $4208, $30, 0, 0, 3, 1, $B3)
    %spritemapEntry(1, $4208, $20, 0, 0, 3, 1, $93)
    %spritemapEntry(1, $43F8, $30, 0, 0, 3, 1, $B1)
    %spritemapEntry(1, $43F8, $20, 0, 0, 3, 1, $91)
    %spritemapEntry(1, $43F8, $10, 0, 0, 3, 1, $71)
    %spritemapEntry(1, $43F8, $00, 0, 0, 3, 1, $51)
    %spritemapEntry(0, $1F1, $E8, 0, 0, 3, 1, $1A0)
    %spritemapEntry(0, $09, $E8, 0, 0, 3, 1, $1A3)
    %spritemapEntry(1, $43F9, $E8, 0, 0, 3, 1, $1A1)
    %spritemapEntry(0, $1F3, $18, 0, 0, 3, 1, $1B4)
    %spritemapEntry(0, $1F3, $10, 0, 0, 3, 1, $1A4)
    %spritemapEntry(0, $1F3, $08, 0, 0, 3, 1, $194)
    %spritemapEntry(0, $1F3, $00, 0, 0, 3, 1, $184)
    %spritemapEntry(1, $4201, $F0, 0, 0, 3, 1, $1B2)
    %spritemapEntry(1, $43F1, $F0, 0, 0, 3, 1, $1B0)
    %spritemapEntry(1, $43F9, $D8, 0, 0, 3, 1, $181)


;;; $A085: Suitless Samus opening hair (frame 1) ;;;
EndingSequenceSpritemaps_SuitlessSamusOpeningHairFrame1:
    dw $0009
    %spritemapEntry(0, $09, $E0, 0, 0, 3, 1, $193)
    %spritemapEntry(0, $09, $E8, 0, 0, 3, 1, $1A3)
    %spritemapEntry(0, $01, $D8, 0, 0, 3, 1, $182)
    %spritemapEntry(0, $1F9, $D8, 0, 0, 3, 1, $181)
    %spritemapEntry(1, $43F9, $E0, 0, 0, 3, 1, $191)
    %spritemapEntry(0, $08, $00, 0, 0, 3, 1, $1A9)
    %spritemapEntry(0, $1F0, $00, 0, 0, 3, 1, $1A6)
    %spritemapEntry(1, $4200, $F0, 0, 0, 3, 1, $188)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 1, $186)


;;; $A0B4: Suitless Samus opening hair (frame 2) ;;;
EndingSequenceSpritemaps_SuitlessSamusOpeningHairFrame2:
    dw $000A
    %spritemapEntry(1, $43F8, $D8, 0, 0, 3, 1, $E1)
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 1, $F3)
    %spritemapEntry(1, $43EF, $E8, 0, 0, 3, 1, $1B6)
    %spritemapEntry(1, $4202, $E7, 0, 0, 3, 1, $1B8)
    %spritemapEntry(0, $08, $D8, 0, 0, 3, 1, $E3)
    %spritemapEntry(1, $43F0, $E8, 0, 0, 3, 1, $100)
    %spritemapEntry(1, $4200, $E8, 0, 0, 3, 1, $102)
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 1, $123)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 1, $122)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 1, $121)


;;; $A0E8: Suitless Samus opening hair (frame 3) ;;;
EndingSequenceSpritemaps_SuitlessSamusOpeningHairFrame3:
    dw $000A
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 1, $F3)
    %spritemapEntry(1, $43F8, $D8, 0, 0, 3, 1, $E1)
    %spritemapEntry(1, $43EE, $E8, 0, 0, 3, 1, $1B6)
    %spritemapEntry(1, $4203, $E7, 0, 0, 3, 1, $1B8)
    %spritemapEntry(0, $08, $D8, 0, 0, 3, 1, $E3)
    %spritemapEntry(1, $43F0, $E8, 0, 0, 3, 1, $100)
    %spritemapEntry(1, $4200, $E8, 0, 0, 3, 1, $102)
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 1, $123)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 1, $122)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 1, $121)


;;; $A11C: Suitless Samus opening hair (frame 4) ;;;
EndingSequenceSpritemaps_SuitlessSamusOpeningHairFrame4:
    dw $000A
    %spritemapEntry(1, $43F8, $D8, 0, 0, 3, 1, $E1)
    %spritemapEntry(0, $08, $E0, 0, 0, 3, 1, $F3)
    %spritemapEntry(1, $43EE, $E7, 0, 0, 3, 1, $1B6)
    %spritemapEntry(1, $4203, $E6, 0, 0, 3, 1, $1B8)
    %spritemapEntry(0, $08, $D8, 0, 0, 3, 1, $E3)
    %spritemapEntry(1, $43F0, $E8, 0, 0, 3, 1, $100)
    %spritemapEntry(1, $4200, $E8, 0, 0, 3, 1, $102)
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 1, $123)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 1, $122)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 1, $121)


;;; $A150: Suitless Samus opening hair (frame 5) ;;;
EndingSequenceSpritemaps_SuitlessSamusOpeningHairFrame5:
    dw $0009
    %spritemapEntry(0, $1F0, $E8, 0, 0, 3, 1, $104)
    %spritemapEntry(1, $4208, $E8, 0, 0, 3, 1, $107)
    %spritemapEntry(1, $4200, $D8, 0, 0, 3, 1, $E6)
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 1, $127)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 1, $126)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 1, $125)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 1, $114)
    %spritemapEntry(1, $43F8, $E8, 0, 0, 3, 1, $105)
    %spritemapEntry(1, $43F8, $D8, 0, 0, 3, 1, $E5)


;;; $A17F: Suitless Samus opening hair (frame 6) ;;;
EndingSequenceSpritemaps_SuitlessSamusOpeningHairFrame6:
    dw $000A
    %spritemapEntry(0, $1F0, $00, 0, 0, 3, 1, $129)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 1, $119)
    %spritemapEntry(0, $1F0, $F0, 0, 0, 3, 1, $109)
    %spritemapEntry(1, $4208, $F0, 0, 0, 3, 1, $10C)
    %spritemapEntry(1, $4208, $E0, 0, 0, 3, 1, $EC)
    %spritemapEntry(0, $1F0, $E8, 0, 0, 3, 1, $F9)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 3, 1, $E9)
    %spritemapEntry(1, $43F8, $D8, 0, 0, 3, 1, $DA)
    %spritemapEntry(1, $43F8, $F0, 0, 0, 3, 1, $10A)
    %spritemapEntry(1, $43F8, $E0, 0, 0, 3, 1, $EA)


;;; $A1B3: Suitless Samus opening hair (frame 7) ;;;
EndingSequenceSpritemaps_SuitlessSamusOpeningHairFrame7:
    dw $000F
    %spritemapEntry(0, $1F0, $18, 0, 0, 3, 1, $15D)
    %spritemapEntry(0, $1F0, $10, 0, 0, 3, 1, $14D)
    %spritemapEntry(0, $1F0, $08, 0, 0, 3, 1, $13D)
    %spritemapEntry(0, $1F0, $00, 0, 0, 3, 1, $12D)
    %spritemapEntry(0, $10, $F8, 0, 0, 3, 1, $174)
    %spritemapEntry(0, $20, $F0, 0, 0, 3, 1, $166)
    %spritemapEntry(0, $20, $E8, 0, 0, 3, 1, $156)
    %spritemapEntry(0, $20, $E0, 0, 0, 3, 1, $146)
    %spritemapEntry(1, $4210, $E8, 0, 0, 3, 1, $154)
    %spritemapEntry(1, $4210, $D8, 0, 0, 3, 1, $134)
    %spritemapEntry(1, $43F8, $D8, 0, 0, 3, 1, $131)
    %spritemapEntry(1, $4200, $F0, 0, 0, 3, 1, $162)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 1, $160)
    %spritemapEntry(1, $4200, $E0, 0, 0, 3, 1, $142)
    %spritemapEntry(1, $43F0, $E0, 0, 0, 3, 1, $140)


;;; $A200: Suitless Samus opening hair (frame 8) ;;;
EndingSequenceSpritemaps_SuitlessSamusOpeningHairFrame8:
    dw $000D
    %spritemapEntry(0, $1F0, $18, 0, 0, 3, 1, $15D)
    %spritemapEntry(0, $1F0, $10, 0, 0, 3, 1, $14D)
    %spritemapEntry(0, $1F0, $08, 0, 0, 3, 1, $13D)
    %spritemapEntry(0, $1F0, $00, 0, 0, 3, 1, $12D)
    %spritemapEntry(0, $08, $D8, 0, 0, 3, 1, $13A)
    %spritemapEntry(0, $00, $D8, 0, 0, 3, 1, $139)
    %spritemapEntry(0, $1F8, $D8, 0, 0, 3, 1, $138)
    %spritemapEntry(1, $4210, $F0, 0, 0, 3, 1, $16B)
    %spritemapEntry(1, $4210, $E0, 0, 0, 3, 1, $14B)
    %spritemapEntry(1, $4200, $F0, 0, 0, 3, 1, $169)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 1, $167)
    %spritemapEntry(1, $4200, $E0, 0, 0, 3, 1, $149)
    %spritemapEntry(1, $43F0, $E0, 0, 0, 3, 1, $147)


;;; $A243: Suitless Samus lower body ;;;
EndingSequenceSpritemaps_SuitlessSamusLowerBody:
    dw $000E
    %spritemapEntry(0, $08, $00, 0, 0, 3, 1, $53)
    %spritemapEntry(0, $1F0, $40, 0, 0, 3, 1, $D0)
    %spritemapEntry(0, $18, $40, 0, 0, 3, 1, $D5)
    %spritemapEntry(1, $43F8, $38, 0, 0, 3, 1, $C1)
    %spritemapEntry(1, $4208, $38, 0, 0, 3, 1, $C3)
    %spritemapEntry(0, $08, $18, 0, 0, 3, 1, $83)
    %spritemapEntry(0, $08, $10, 0, 0, 3, 1, $73)
    %spritemapEntry(0, $08, $08, 0, 0, 3, 1, $63)
    %spritemapEntry(1, $4208, $30, 0, 0, 3, 1, $B3)
    %spritemapEntry(1, $4208, $20, 0, 0, 3, 1, $93)
    %spritemapEntry(1, $43F8, $30, 0, 0, 3, 1, $B1)
    %spritemapEntry(1, $43F8, $20, 0, 0, 3, 1, $91)
    %spritemapEntry(1, $43F8, $10, 0, 0, 3, 1, $71)
    %spritemapEntry(1, $43F8, $00, 0, 0, 3, 1, $51)


;;; $A28B: Zebes boom starry background ;;;
EndingSequenceSpritemaps_ZebesBoomStarryBackground:
    dw $0035
    %spritemapEntry(1, $43AB, $3C, 0, 0, 0, 7, $ED)
    %spritemapEntry(1, $43BB, $D3, 0, 0, 0, 7, $ED)
    %spritemapEntry(1, $425C, $4E, 0, 0, 0, 7, $ED)
    %spritemapEntry(0, $75, $C6, 0, 0, 0, 7, $FA)
    %spritemapEntry(0, $68, $DB, 0, 0, 0, 7, $F9)
    %spritemapEntry(0, $42, $CA, 0, 0, 0, 7, $F9)
    %spritemapEntry(0, $1E, $D7, 0, 0, 0, 7, $F9)
    %spritemapEntry(0, $1CD, $CE, 0, 0, 0, 7, $F9)
    %spritemapEntry(0, $1FE, $54, 0, 0, 0, 7, $FB)
    %spritemapEntry(0, $1A7, $30, 0, 0, 0, 7, $F8)
    %spritemapEntry(0, $1EC, $D2, 0, 0, 0, 7, $F8)
    %spritemapEntry(0, $14, $29, 0, 0, 0, 7, $FA)
    %spritemapEntry(0, $16, $F4, 0, 0, 0, 7, $FA)
    %spritemapEntry(0, $1A2, $58, 0, 0, 0, 7, $FA)
    %spritemapEntry(0, $19E, $12, 0, 0, 0, 7, $FB)
    %spritemapEntry(0, $1ED, $74, 0, 0, 0, 7, $FA)
    %spritemapEntry(0, $22, $61, 0, 0, 0, 7, $FA)
    %spritemapEntry(0, $38, $34, 0, 0, 0, 7, $FA)
    %spritemapEntry(0, $49, $29, 0, 0, 0, 7, $FA)
    %spritemapEntry(0, $1D0, $5C, 0, 0, 0, 7, $FA)
    %spritemapEntry(0, $1BA, $33, 0, 0, 0, 7, $FA)
    %spritemapEntry(0, $19A, $40, 0, 0, 0, 7, $FA)
    %spritemapEntry(0, $1AA, $20, 0, 0, 0, 7, $FA)
    %spritemapEntry(0, $194, $B8, 0, 0, 0, 7, $FB)
    %spritemapEntry(0, $1AC, $A6, 0, 0, 0, 7, $F9)
    %spritemapEntry(0, $59, $9D, 0, 0, 0, 7, $F9)
    %spritemapEntry(0, $5E, $B7, 0, 0, 0, 7, $F9)
    %spritemapEntry(0, $1E7, $A5, 0, 0, 0, 7, $FB)
    %spritemapEntry(0, $1B8, $FF, 0, 0, 0, 7, $FB)
    %spritemapEntry(0, $2E, $44, 0, 0, 0, 7, $FB)
    %spritemapEntry(0, $1E0, $04, 0, 0, 0, 7, $F9)
    %spritemapEntry(0, $1D0, $24, 0, 0, 0, 7, $FC)
    %spritemapEntry(0, $1E9, $34, 0, 0, 0, 7, $FA)
    %spritemapEntry(0, $56, $FB, 0, 0, 0, 7, $F8)
    %spritemapEntry(0, $22, $B4, 0, 0, 0, 7, $F8)
    %spritemapEntry(0, $1B8, $79, 0, 0, 0, 7, $F8)
    %spritemapEntry(0, $3C, $E7, 0, 0, 0, 7, $FC)
    %spritemapEntry(0, $75, $22, 0, 0, 0, 7, $FC)
    %spritemapEntry(0, $76, $6F, 0, 0, 0, 7, $F8)
    %spritemapEntry(0, $1D3, $50, 0, 0, 0, 7, $F9)
    %spritemapEntry(0, $6C, $5E, 0, 0, 0, 7, $F8)
    %spritemapEntry(0, $4E, $5D, 0, 0, 0, 7, $FA)
    %spritemapEntry(0, $1E1, $C0, 0, 0, 0, 7, $F8)
    %spritemapEntry(0, $4C, $4A, 0, 0, 0, 7, $F9)
    %spritemapEntry(0, $1BB, $B9, 0, 0, 0, 7, $F9)
    %spritemapEntry(0, $1C1, $69, 0, 0, 0, 7, $F8)
    %spritemapEntry(0, $2F, $23, 0, 0, 0, 7, $FA)
    %spritemapEntry(0, $46, $7A, 0, 0, 0, 7, $FA)
    %spritemapEntry(0, $00, $E7, 0, 0, 0, 7, $FB)
    %spritemapEntry(0, $6C, $2E, 0, 0, 0, 7, $FB)
    %spritemapEntry(0, $1D3, $E6, 0, 0, 0, 7, $F9)
    %spritemapEntry(0, $03, $CD, 0, 0, 0, 7, $FA)
    %spritemapEntry(0, $1B1, $E2, 0, 0, 0, 7, $F8)


;;; $A396: Exploding Planet Zebes (frame 1) ;;;
EndingSequenceSpritemaps_ExplodingPlanetZebesFrame1:
    dw $0004
    %spritemapEntry(1, $4200, $00, 0, 0, 0, 7, $22)
    %spritemapEntry(1, $43F0, $00, 0, 0, 0, 7, $20)
    %spritemapEntry(1, $4200, $F0, 0, 0, 0, 7, $02)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 0, 7, $00)


;;; $A3AC: Exploding Planet Zebes (frame 2) ;;;
EndingSequenceSpritemaps_ExplodingPlanetZebesFrame2:
    dw $0004
    %spritemapEntry(1, $4200, $00, 0, 0, 0, 7, $26)
    %spritemapEntry(1, $43F0, $00, 0, 0, 0, 7, $24)
    %spritemapEntry(1, $4200, $F0, 0, 0, 0, 7, $06)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 0, 7, $04)


;;; $A3C2: Exploding Planet Zebes (frame 3) ;;;
EndingSequenceSpritemaps_ExplodingPlanetZebesFrame3:
    dw $0004
    %spritemapEntry(1, $4200, $00, 0, 0, 0, 7, $2A)
    %spritemapEntry(1, $43F0, $00, 0, 0, 0, 7, $28)
    %spritemapEntry(1, $4200, $F0, 0, 0, 0, 7, $0A)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 0, 7, $08)


;;; $A3D8: Exploding Planet Zebes (frame 4) ;;;
EndingSequenceSpritemaps_ExplodingPlanetZebesFrame4:
    dw $0004
    %spritemapEntry(1, $4200, $00, 0, 0, 0, 7, $2E)
    %spritemapEntry(1, $43F0, $00, 0, 0, 0, 7, $2C)
    %spritemapEntry(1, $4200, $F0, 0, 0, 0, 7, $0E)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 0, 7, $0C)


;;; $A3EE: Exploding Planet Zebes (frame 5) ;;;
EndingSequenceSpritemaps_ExplodingPlanetZebesFrame5:
    dw $0004
    %spritemapEntry(1, $4200, $00, 0, 0, 0, 7, $62)
    %spritemapEntry(1, $43F0, $00, 0, 0, 0, 7, $60)
    %spritemapEntry(1, $4200, $F0, 0, 0, 0, 7, $42)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 0, 7, $40)


;;; $A404: Exploding Planet Zebes (frame 6) ;;;
EndingSequenceSpritemaps_ExplodingPlanetZebesFrame6:
    dw $0004
    %spritemapEntry(1, $4200, $00, 0, 0, 0, 7, $66)
    %spritemapEntry(1, $43F0, $00, 0, 0, 0, 7, $64)
    %spritemapEntry(1, $4200, $F0, 0, 0, 0, 7, $46)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 0, 7, $44)


;;; $A41A: Exploding Planet Zebes (frame 7) ;;;
EndingSequenceSpritemaps_ExplodingPlanetZebesFrame7:
    dw $0004
    %spritemapEntry(1, $4200, $00, 0, 0, 0, 7, $6A)
    %spritemapEntry(1, $43F0, $00, 0, 0, 0, 7, $68)
    %spritemapEntry(1, $4200, $F0, 0, 0, 0, 7, $4A)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 0, 7, $48)


;;; $A430: Exploding Planet Zebes (frame 8) ;;;
EndingSequenceSpritemaps_ExplodingPlanetZebesFrame8:
    dw $0004
    %spritemapEntry(1, $4200, $00, 0, 0, 0, 7, $6E)
    %spritemapEntry(1, $43F0, $00, 0, 0, 0, 7, $6C)
    %spritemapEntry(1, $4200, $F0, 0, 0, 0, 7, $4E)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 0, 7, $4C)


;;; $A446: Exploding Planet Zebes core (frame 1) ;;;
EndingSequenceSpritemaps_ExplodingPlanetZebesCoreFrame1:
    dw $0004
    %spritemapEntry(1, $4200, $00, 1, 1, 0, 5, $99)
    %spritemapEntry(1, $43F0, $00, 1, 0, 0, 5, $99)
    %spritemapEntry(1, $4200, $F0, 0, 1, 0, 5, $99)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 0, 5, $99)


;;; $A45C: Exploding Planet Zebes core (frame 2) ;;;
EndingSequenceSpritemaps_ExplodingPlanetZebesCoreFrame2:
    dw $0004
    %spritemapEntry(1, $4200, $00, 1, 1, 0, 5, $9B)
    %spritemapEntry(1, $4200, $F0, 0, 1, 0, 5, $9B)
    %spritemapEntry(1, $43F0, $00, 1, 0, 0, 5, $9B)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 0, 5, $9B)


;;; $A472: Exploding Planet Zebes glow ;;;
EndingSequenceSpritemaps_ExplodingPlanetZebesGlow:
    dw $000C
    %spritemapEntry(1, $4200, $E8, 0, 1, 0, 7, $81)
    %spritemapEntry(1, $4208, $F0, 0, 1, 0, 7, $90)
    %spritemapEntry(1, $4200, $F0, 0, 1, 0, 7, $91)
    %spritemapEntry(1, $4200, $08, 1, 1, 0, 7, $81)
    %spritemapEntry(1, $4208, $00, 1, 1, 0, 7, $90)
    %spritemapEntry(1, $4200, $00, 1, 1, 0, 7, $91)
    %spritemapEntry(1, $43F0, $08, 1, 0, 0, 7, $81)
    %spritemapEntry(1, $43E8, $00, 1, 0, 0, 7, $90)
    %spritemapEntry(1, $43F0, $00, 1, 0, 0, 7, $91)
    %spritemapEntry(1, $43F0, $E8, 0, 0, 0, 7, $81)
    %spritemapEntry(1, $43E8, $F0, 0, 0, 0, 7, $90)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 0, 7, $91)


;;; $A4B0: The Zebes Supernova (part 1) ;;;
EndingSequenceSpritemaps_ZebesSupernovaPart1:
    dw $0014
    %spritemapEntry(0, $10, $F8, 0, 1, 0, 7, $A3)
    %spritemapEntry(0, $10, $F0, 0, 1, 0, 7, $93)
    %spritemapEntry(0, $00, $E8, 0, 1, 0, 7, $85)
    %spritemapEntry(0, $08, $E8, 0, 1, 0, 7, $84)
    %spritemapEntry(1, $4200, $F0, 0, 1, 0, 7, $94)
    %spritemapEntry(0, $10, $00, 1, 1, 0, 7, $A3)
    %spritemapEntry(0, $10, $08, 1, 1, 0, 7, $93)
    %spritemapEntry(0, $00, $10, 1, 1, 0, 7, $85)
    %spritemapEntry(0, $08, $10, 1, 1, 0, 7, $84)
    %spritemapEntry(1, $4200, $00, 1, 1, 0, 7, $94)
    %spritemapEntry(0, $1E8, $00, 1, 0, 0, 7, $A3)
    %spritemapEntry(0, $1E8, $08, 1, 0, 0, 7, $93)
    %spritemapEntry(0, $1F8, $10, 1, 0, 0, 7, $85)
    %spritemapEntry(0, $1F0, $10, 1, 0, 0, 7, $84)
    %spritemapEntry(1, $43F0, $00, 1, 0, 0, 7, $94)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 0, 7, $A3)
    %spritemapEntry(0, $1E8, $F0, 0, 0, 0, 7, $93)
    %spritemapEntry(0, $1F8, $E8, 0, 0, 0, 7, $85)
    %spritemapEntry(0, $1F0, $E8, 0, 0, 0, 7, $84)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 0, 7, $94)


;;; $A516: The Zebes Supernova (part 2) ;;;
EndingSequenceSpritemaps_ZebesSupernovaPart2:
    dw $0014
    %spritemapEntry(0, $1E8, $F8, 0, 0, 0, 7, $A6)
    %spritemapEntry(0, $1E8, $F0, 0, 0, 0, 7, $96)
    %spritemapEntry(0, $1F8, $E8, 0, 0, 0, 7, $88)
    %spritemapEntry(0, $1F0, $E8, 0, 0, 0, 7, $87)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 0, 7, $97)
    %spritemapEntry(0, $10, $F8, 0, 1, 0, 7, $A6)
    %spritemapEntry(0, $10, $F0, 0, 1, 0, 7, $96)
    %spritemapEntry(0, $00, $E8, 0, 1, 0, 7, $88)
    %spritemapEntry(0, $08, $E8, 0, 1, 0, 7, $87)
    %spritemapEntry(1, $4200, $F0, 0, 1, 0, 7, $97)
    %spritemapEntry(0, $10, $00, 1, 1, 0, 7, $A6)
    %spritemapEntry(0, $10, $08, 1, 1, 0, 7, $96)
    %spritemapEntry(0, $00, $10, 1, 1, 0, 7, $88)
    %spritemapEntry(0, $08, $10, 1, 1, 0, 7, $87)
    %spritemapEntry(1, $4200, $00, 1, 1, 0, 7, $97)
    %spritemapEntry(0, $1E8, $00, 1, 0, 0, 7, $A6)
    %spritemapEntry(0, $1E8, $08, 1, 0, 0, 7, $96)
    %spritemapEntry(0, $1F8, $10, 1, 0, 0, 7, $88)
    %spritemapEntry(0, $1F0, $10, 1, 0, 0, 7, $87)
    %spritemapEntry(1, $43F0, $00, 1, 0, 0, 7, $97)


;;; $A57C: The Zebes Supernova (part 3) ;;;
EndingSequenceSpritemaps_ZebesSupernovaPart3:
    dw $0014
    %spritemapEntry(1, $4200, $08, 0, 0, 3, 5, $CC)
    %spritemapEntry(1, $4210, $08, 0, 0, 3, 5, $CE)
    %spritemapEntry(0, $00, $18, 0, 0, 3, 5, $EC)
    %spritemapEntry(1, $43E0, $10, 0, 0, 3, 5, $D8)
    %spritemapEntry(1, $4210, $00, 0, 0, 3, 5, $BE)
    %spritemapEntry(1, $4200, $00, 0, 0, 3, 5, $BC)
    %spritemapEntry(1, $43F0, $00, 0, 0, 3, 5, $BA)
    %spritemapEntry(1, $43E0, $00, 0, 0, 3, 5, $B8)
    %spritemapEntry(1, $4210, $F0, 0, 0, 3, 5, $E6)
    %spritemapEntry(1, $4200, $F0, 0, 0, 3, 5, $E4)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 5, $E2)
    %spritemapEntry(1, $43E0, $F0, 0, 0, 3, 5, $E0)
    %spritemapEntry(1, $4210, $E8, 0, 0, 3, 5, $D6)
    %spritemapEntry(1, $4200, $E8, 0, 0, 3, 5, $D4)
    %spritemapEntry(1, $43F0, $E8, 0, 0, 3, 5, $D2)
    %spritemapEntry(1, $43E0, $E8, 0, 0, 3, 5, $D0)
    %spritemapEntry(1, $4210, $D8, 0, 0, 3, 5, $B6)
    %spritemapEntry(1, $4200, $D8, 0, 0, 3, 5, $B4)
    %spritemapEntry(1, $43F0, $D8, 0, 0, 3, 5, $B2)
    %spritemapEntry(1, $43E0, $D8, 0, 0, 3, 5, $B0)


;;; $A5E2: The Zebes Supernova (part 4) ;;;
EndingSequenceSpritemaps_ZebesSupernovaPart4:
    dw $0025
    %spritemapEntry(0, $1F0, $20, 0, 0, 0, 6, $18C)
    %spritemapEntry(0, $08, $20, 0, 0, 0, 6, $18F)
    %spritemapEntry(0, $00, $20, 0, 0, 0, 6, $18E)
    %spritemapEntry(0, $1F8, $20, 0, 0, 0, 6, $18D)
    %spritemapEntry(0, $1E0, $18, 0, 0, 0, 6, $1E4)
    %spritemapEntry(0, $10, $18, 0, 0, 0, 6, $1EA)
    %spritemapEntry(0, $1E8, $18, 0, 0, 0, 6, $1E5)
    %spritemapEntry(1, $4200, $10, 0, 0, 0, 6, $1D8)
    %spritemapEntry(1, $43F0, $10, 0, 0, 0, 6, $1D6)
    %spritemapEntry(0, $08, $E0, 0, 0, 0, 6, $183)
    %spritemapEntry(0, $00, $E0, 0, 0, 0, 6, $182)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 0, 6, $181)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 0, 6, $180)
    %spritemapEntry(1, $4230, $00, 0, 0, 0, 6, $1BE)
    %spritemapEntry(1, $43C0, $00, 0, 0, 0, 6, $1B0)
    %spritemapEntry(0, $1D8, $F0, 0, 0, 0, 6, $193)
    %spritemapEntry(0, $1D0, $F0, 0, 0, 0, 6, $192)
    %spritemapEntry(0, $28, $F0, 0, 0, 0, 6, $19D)
    %spritemapEntry(0, $20, $F0, 0, 0, 0, 6, $19C)
    %spritemapEntry(1, $4210, $E8, 0, 0, 0, 6, $18A)
    %spritemapEntry(1, $4200, $E8, 0, 0, 0, 6, $188)
    %spritemapEntry(1, $43F0, $E8, 0, 0, 0, 6, $186)
    %spritemapEntry(1, $43E0, $E8, 0, 0, 0, 6, $184)
    %spritemapEntry(1, $4220, $08, 0, 0, 0, 6, $1CC)
    %spritemapEntry(1, $4210, $08, 0, 0, 0, 6, $1CA)
    %spritemapEntry(1, $4200, $08, 0, 0, 0, 6, $1C8)
    %spritemapEntry(1, $43F0, $08, 0, 0, 0, 6, $1C6)
    %spritemapEntry(1, $43E0, $08, 0, 0, 0, 6, $1C4)
    %spritemapEntry(1, $43D0, $08, 0, 0, 0, 6, $1C2)
    %spritemapEntry(1, $4230, $F8, 0, 0, 0, 6, $1AE)
    %spritemapEntry(1, $4220, $F8, 0, 0, 0, 6, $1AC)
    %spritemapEntry(1, $4210, $F8, 0, 0, 0, 6, $1AA)
    %spritemapEntry(1, $4200, $F8, 0, 0, 0, 6, $1A8)
    %spritemapEntry(1, $43F0, $F8, 0, 0, 0, 6, $1A6)
    %spritemapEntry(1, $43E0, $F8, 0, 0, 0, 6, $1A4)
    %spritemapEntry(1, $43D0, $F8, 0, 0, 0, 6, $1A2)
    %spritemapEntry(1, $43C0, $F8, 0, 0, 0, 6, $1A0)


;;; $A69D: 'T' ;;;
EndingSequenceSpritemaps_T:
    dw $0002
    %spritemapEntry(0, $1B8, $00, 0, 0, 3, 0, $153)
    %spritemapEntry(0, $1B8, $F8, 0, 0, 3, 0, $143)


;;; $A6A9: 'TH' ;;;
EndingSequenceSpritemaps_TH:
    dw $0004
    %spritemapEntry(0, $1C0, $00, 0, 0, 3, 0, $137)
    %spritemapEntry(0, $1C0, $F8, 0, 0, 3, 0, $127)
    %spritemapEntry(0, $1B8, $00, 0, 0, 3, 0, $153)
    %spritemapEntry(0, $1B8, $F8, 0, 0, 3, 0, $143)


;;; $A6BF: 'THE' ;;;
EndingSequenceSpritemaps_THE:
    dw $0006
    %spritemapEntry(0, $1C8, $00, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1C8, $F8, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1C0, $00, 0, 0, 3, 0, $137)
    %spritemapEntry(0, $1C0, $F8, 0, 0, 3, 0, $127)
    %spritemapEntry(0, $1B8, $00, 0, 0, 3, 0, $153)
    %spritemapEntry(0, $1B8, $F8, 0, 0, 3, 0, $143)


;;; $A6DF: 'THE O' ;;;
EndingSequenceSpritemaps_THEO:
    dw $0008
    %spritemapEntry(0, $1D8, $00, 0, 0, 3, 0, $13E)
    %spritemapEntry(0, $1D8, $F8, 0, 0, 3, 0, $12E)
    %spritemapEntry(0, $1C8, $00, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1C8, $F8, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1C0, $00, 0, 0, 3, 0, $137)
    %spritemapEntry(0, $1C0, $F8, 0, 0, 3, 0, $127)
    %spritemapEntry(0, $1B8, $00, 0, 0, 3, 0, $153)
    %spritemapEntry(0, $1B8, $F8, 0, 0, 3, 0, $143)


;;; $A709: 'THE OP' ;;;
EndingSequenceSpritemaps_THEOP:
    dw $000A
    %spritemapEntry(0, $1E0, $00, 0, 0, 3, 0, $13F)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 0, $12F)
    %spritemapEntry(0, $1D8, $00, 0, 0, 3, 0, $13E)
    %spritemapEntry(0, $1D8, $F8, 0, 0, 3, 0, $12E)
    %spritemapEntry(0, $1C8, $00, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1C8, $F8, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1C0, $00, 0, 0, 3, 0, $137)
    %spritemapEntry(0, $1C0, $F8, 0, 0, 3, 0, $127)
    %spritemapEntry(0, $1B8, $00, 0, 0, 3, 0, $153)
    %spritemapEntry(0, $1B8, $F8, 0, 0, 3, 0, $143)


;;; $A73D: 'THE OPE' ;;;
EndingSequenceSpritemaps_THEOPE:
    dw $000C
    %spritemapEntry(0, $1E8, $00, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1E0, $00, 0, 0, 3, 0, $13F)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 0, $12F)
    %spritemapEntry(0, $1D8, $00, 0, 0, 3, 0, $13E)
    %spritemapEntry(0, $1D8, $F8, 0, 0, 3, 0, $12E)
    %spritemapEntry(0, $1C8, $00, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1C8, $F8, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1C0, $00, 0, 0, 3, 0, $137)
    %spritemapEntry(0, $1C0, $F8, 0, 0, 3, 0, $127)
    %spritemapEntry(0, $1B8, $00, 0, 0, 3, 0, $153)
    %spritemapEntry(0, $1B8, $F8, 0, 0, 3, 0, $143)


;;; $A77B: 'THE OPER' ;;;
EndingSequenceSpritemaps_THEOPER:
    dw $000E
    %spritemapEntry(0, $1F0, $00, 0, 0, 3, 0, $151)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 0, $141)
    %spritemapEntry(0, $1E8, $00, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1E0, $00, 0, 0, 3, 0, $13F)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 0, $12F)
    %spritemapEntry(0, $1D8, $00, 0, 0, 3, 0, $13E)
    %spritemapEntry(0, $1D8, $F8, 0, 0, 3, 0, $12E)
    %spritemapEntry(0, $1C8, $00, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1C8, $F8, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1C0, $00, 0, 0, 3, 0, $137)
    %spritemapEntry(0, $1C0, $F8, 0, 0, 3, 0, $127)
    %spritemapEntry(0, $1B8, $00, 0, 0, 3, 0, $153)
    %spritemapEntry(0, $1B8, $F8, 0, 0, 3, 0, $143)


;;; $A7C3: 'THE OPERA' ;;;
EndingSequenceSpritemaps_THEOPERA:
    dw $0010
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 0, $130)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $120)
    %spritemapEntry(0, $1F0, $00, 0, 0, 3, 0, $151)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 0, $141)
    %spritemapEntry(0, $1E8, $00, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1E0, $00, 0, 0, 3, 0, $13F)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 0, $12F)
    %spritemapEntry(0, $1D8, $00, 0, 0, 3, 0, $13E)
    %spritemapEntry(0, $1D8, $F8, 0, 0, 3, 0, $12E)
    %spritemapEntry(0, $1C8, $00, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1C8, $F8, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1C0, $00, 0, 0, 3, 0, $137)
    %spritemapEntry(0, $1C0, $F8, 0, 0, 3, 0, $127)
    %spritemapEntry(0, $1B8, $00, 0, 0, 3, 0, $153)
    %spritemapEntry(0, $1B8, $F8, 0, 0, 3, 0, $143)


;;; $A815: 'THE OPERAT' ;;;
EndingSequenceSpritemaps_THEOPERAT:
    dw $0012
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $153)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $143)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 0, $130)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $120)
    %spritemapEntry(0, $1F0, $00, 0, 0, 3, 0, $151)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 0, $141)
    %spritemapEntry(0, $1E8, $00, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1E0, $00, 0, 0, 3, 0, $13F)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 0, $12F)
    %spritemapEntry(0, $1D8, $00, 0, 0, 3, 0, $13E)
    %spritemapEntry(0, $1D8, $F8, 0, 0, 3, 0, $12E)
    %spritemapEntry(0, $1C8, $00, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1C8, $F8, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1C0, $00, 0, 0, 3, 0, $137)
    %spritemapEntry(0, $1C0, $F8, 0, 0, 3, 0, $127)
    %spritemapEntry(0, $1B8, $00, 0, 0, 3, 0, $153)
    %spritemapEntry(0, $1B8, $F8, 0, 0, 3, 0, $143)


;;; $A871: 'THE OPERATI' ;;;
EndingSequenceSpritemaps_THEOPERATI:
    dw $0014
    %spritemapEntry(0, $08, $00, 0, 0, 3, 0, $138)
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 0, $128)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $153)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $143)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 0, $130)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $120)
    %spritemapEntry(0, $1F0, $00, 0, 0, 3, 0, $151)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 0, $141)
    %spritemapEntry(0, $1E8, $00, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1E0, $00, 0, 0, 3, 0, $13F)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 0, $12F)
    %spritemapEntry(0, $1D8, $00, 0, 0, 3, 0, $13E)
    %spritemapEntry(0, $1D8, $F8, 0, 0, 3, 0, $12E)
    %spritemapEntry(0, $1C8, $00, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1C8, $F8, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1C0, $00, 0, 0, 3, 0, $137)
    %spritemapEntry(0, $1C0, $F8, 0, 0, 3, 0, $127)
    %spritemapEntry(0, $1B8, $00, 0, 0, 3, 0, $153)
    %spritemapEntry(0, $1B8, $F8, 0, 0, 3, 0, $143)


;;; $A8D7: 'THE OPERATIO ;;;
EndingSequenceSpritemaps_THEOPERATIO:
    dw $0016
    %spritemapEntry(0, $10, $00, 0, 0, 3, 0, $13E)
    %spritemapEntry(0, $10, $F8, 0, 0, 3, 0, $12E)
    %spritemapEntry(0, $08, $00, 0, 0, 3, 0, $138)
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 0, $128)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $153)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $143)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 0, $130)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $120)
    %spritemapEntry(0, $1F0, $00, 0, 0, 3, 0, $151)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 0, $141)
    %spritemapEntry(0, $1E8, $00, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1E0, $00, 0, 0, 3, 0, $13F)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 0, $12F)
    %spritemapEntry(0, $1D8, $00, 0, 0, 3, 0, $13E)
    %spritemapEntry(0, $1D8, $F8, 0, 0, 3, 0, $12E)
    %spritemapEntry(0, $1C8, $00, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1C8, $F8, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1C0, $00, 0, 0, 3, 0, $137)
    %spritemapEntry(0, $1C0, $F8, 0, 0, 3, 0, $127)
    %spritemapEntry(0, $1B8, $00, 0, 0, 3, 0, $153)
    %spritemapEntry(0, $1B8, $F8, 0, 0, 3, 0, $143)


;;; $A947: 'THE OPERATION' ;;;
EndingSequenceSpritemaps_THEOPERATION:
    dw $0018
    %spritemapEntry(0, $18, $00, 0, 0, 3, 0, $13D)
    %spritemapEntry(0, $18, $F8, 0, 0, 3, 0, $12D)
    %spritemapEntry(0, $10, $00, 0, 0, 3, 0, $13E)
    %spritemapEntry(0, $10, $F8, 0, 0, 3, 0, $12E)
    %spritemapEntry(0, $08, $00, 0, 0, 3, 0, $138)
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 0, $128)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $153)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $143)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 0, $130)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $120)
    %spritemapEntry(0, $1F0, $00, 0, 0, 3, 0, $151)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 0, $141)
    %spritemapEntry(0, $1E8, $00, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1E0, $00, 0, 0, 3, 0, $13F)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 0, $12F)
    %spritemapEntry(0, $1D8, $00, 0, 0, 3, 0, $13E)
    %spritemapEntry(0, $1D8, $F8, 0, 0, 3, 0, $12E)
    %spritemapEntry(0, $1C8, $00, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1C8, $F8, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1C0, $00, 0, 0, 3, 0, $137)
    %spritemapEntry(0, $1C0, $F8, 0, 0, 3, 0, $127)
    %spritemapEntry(0, $1B8, $00, 0, 0, 3, 0, $153)
    %spritemapEntry(0, $1B8, $F8, 0, 0, 3, 0, $143)


;;; $A9C1: 'THE OPERATION W' ;;;
EndingSequenceSpritemaps_THEOPERATIONW:
    dw $001A
    %spritemapEntry(0, $28, $00, 0, 0, 3, 0, $156)
    %spritemapEntry(0, $28, $F8, 0, 0, 3, 0, $146)
    %spritemapEntry(0, $18, $00, 0, 0, 3, 0, $13D)
    %spritemapEntry(0, $18, $F8, 0, 0, 3, 0, $12D)
    %spritemapEntry(0, $10, $00, 0, 0, 3, 0, $13E)
    %spritemapEntry(0, $10, $F8, 0, 0, 3, 0, $12E)
    %spritemapEntry(0, $08, $00, 0, 0, 3, 0, $138)
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 0, $128)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $153)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $143)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 0, $130)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $120)
    %spritemapEntry(0, $1F0, $00, 0, 0, 3, 0, $151)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 0, $141)
    %spritemapEntry(0, $1E8, $00, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1E0, $00, 0, 0, 3, 0, $13F)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 0, $12F)
    %spritemapEntry(0, $1D8, $00, 0, 0, 3, 0, $13E)
    %spritemapEntry(0, $1D8, $F8, 0, 0, 3, 0, $12E)
    %spritemapEntry(0, $1C8, $00, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1C8, $F8, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1C0, $00, 0, 0, 3, 0, $137)
    %spritemapEntry(0, $1C0, $F8, 0, 0, 3, 0, $127)
    %spritemapEntry(0, $1B8, $00, 0, 0, 3, 0, $153)
    %spritemapEntry(0, $1B8, $F8, 0, 0, 3, 0, $143)


;;; $AA45: 'THE OPERATION WA' ;;;
EndingSequenceSpritemaps_THEOPERATIONWA:
    dw $001C
    %spritemapEntry(0, $30, $00, 0, 0, 3, 0, $130)
    %spritemapEntry(0, $30, $F8, 0, 0, 3, 0, $120)
    %spritemapEntry(0, $28, $00, 0, 0, 3, 0, $156)
    %spritemapEntry(0, $28, $F8, 0, 0, 3, 0, $146)
    %spritemapEntry(0, $18, $00, 0, 0, 3, 0, $13D)
    %spritemapEntry(0, $18, $F8, 0, 0, 3, 0, $12D)
    %spritemapEntry(0, $10, $00, 0, 0, 3, 0, $13E)
    %spritemapEntry(0, $10, $F8, 0, 0, 3, 0, $12E)
    %spritemapEntry(0, $08, $00, 0, 0, 3, 0, $138)
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 0, $128)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $153)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $143)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 0, $130)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $120)
    %spritemapEntry(0, $1F0, $00, 0, 0, 3, 0, $151)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 0, $141)
    %spritemapEntry(0, $1E8, $00, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1E0, $00, 0, 0, 3, 0, $13F)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 0, $12F)
    %spritemapEntry(0, $1D8, $00, 0, 0, 3, 0, $13E)
    %spritemapEntry(0, $1D8, $F8, 0, 0, 3, 0, $12E)
    %spritemapEntry(0, $1C8, $00, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1C8, $F8, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1C0, $00, 0, 0, 3, 0, $137)
    %spritemapEntry(0, $1C0, $F8, 0, 0, 3, 0, $127)
    %spritemapEntry(0, $1B8, $00, 0, 0, 3, 0, $153)
    %spritemapEntry(0, $1B8, $F8, 0, 0, 3, 0, $143)


;;; $AAD3: 'THE OPERATION WAS' ;;;
EndingSequenceSpritemaps_THEOPERATIONWAS:
    dw $001E
    %spritemapEntry(0, $38, $00, 0, 0, 3, 0, $152)
    %spritemapEntry(0, $38, $F8, 0, 0, 3, 0, $142)
    %spritemapEntry(0, $30, $00, 0, 0, 3, 0, $130)
    %spritemapEntry(0, $30, $F8, 0, 0, 3, 0, $120)
    %spritemapEntry(0, $28, $00, 0, 0, 3, 0, $156)
    %spritemapEntry(0, $28, $F8, 0, 0, 3, 0, $146)
    %spritemapEntry(0, $18, $00, 0, 0, 3, 0, $13D)
    %spritemapEntry(0, $18, $F8, 0, 0, 3, 0, $12D)
    %spritemapEntry(0, $10, $00, 0, 0, 3, 0, $13E)
    %spritemapEntry(0, $10, $F8, 0, 0, 3, 0, $12E)
    %spritemapEntry(0, $08, $00, 0, 0, 3, 0, $138)
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 0, $128)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $153)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $143)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 0, $130)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $120)
    %spritemapEntry(0, $1F0, $00, 0, 0, 3, 0, $151)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 0, $141)
    %spritemapEntry(0, $1E8, $00, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1E0, $00, 0, 0, 3, 0, $13F)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 0, $12F)
    %spritemapEntry(0, $1D8, $00, 0, 0, 3, 0, $13E)
    %spritemapEntry(0, $1D8, $F8, 0, 0, 3, 0, $12E)
    %spritemapEntry(0, $1C8, $00, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1C8, $F8, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1C0, $00, 0, 0, 3, 0, $137)
    %spritemapEntry(0, $1C0, $F8, 0, 0, 3, 0, $127)
    %spritemapEntry(0, $1B8, $00, 0, 0, 3, 0, $153)
    %spritemapEntry(0, $1B8, $F8, 0, 0, 3, 0, $143)


;;; $AB6B: 'C' ;;;
EndingSequenceSpritemaps_C_ompleted:
    dw $0002
    %spritemapEntry(0, $1A8, $18, 0, 0, 3, 0, $132)
    %spritemapEntry(0, $1A8, $10, 0, 0, 3, 0, $122)


;;; $AB77: 'CO' ;;;
EndingSequenceSpritemaps_CO:
    dw $0004
    %spritemapEntry(0, $1B0, $18, 0, 0, 3, 0, $13E)
    %spritemapEntry(0, $1B0, $10, 0, 0, 3, 0, $12E)
    %spritemapEntry(0, $1A8, $18, 0, 0, 3, 0, $132)
    %spritemapEntry(0, $1A8, $10, 0, 0, 3, 0, $122)


;;; $AB8D: 'COM' ;;;
EndingSequenceSpritemaps_COM:
    dw $0006
    %spritemapEntry(0, $1B8, $18, 0, 0, 3, 0, $13C)
    %spritemapEntry(0, $1B8, $10, 0, 0, 3, 0, $12C)
    %spritemapEntry(0, $1B0, $18, 0, 0, 3, 0, $13E)
    %spritemapEntry(0, $1B0, $10, 0, 0, 3, 0, $12E)
    %spritemapEntry(0, $1A8, $18, 0, 0, 3, 0, $132)
    %spritemapEntry(0, $1A8, $10, 0, 0, 3, 0, $122)


;;; $ABAD: 'COMP' ;;;
EndingSequenceSpritemaps_COMP:
    dw $0008
    %spritemapEntry(0, $1C0, $18, 0, 0, 3, 0, $13F)
    %spritemapEntry(0, $1C0, $10, 0, 0, 3, 0, $12F)
    %spritemapEntry(0, $1B8, $18, 0, 0, 3, 0, $13C)
    %spritemapEntry(0, $1B8, $10, 0, 0, 3, 0, $12C)
    %spritemapEntry(0, $1B0, $18, 0, 0, 3, 0, $13E)
    %spritemapEntry(0, $1B0, $10, 0, 0, 3, 0, $12E)
    %spritemapEntry(0, $1A8, $18, 0, 0, 3, 0, $132)
    %spritemapEntry(0, $1A8, $10, 0, 0, 3, 0, $122)


;;; $ABD7: 'COMPL' ;;;
EndingSequenceSpritemaps_COMPL:
    dw $000A
    %spritemapEntry(0, $1C8, $18, 0, 0, 3, 0, $13B)
    %spritemapEntry(0, $1C8, $10, 0, 0, 3, 0, $12B)
    %spritemapEntry(0, $1C0, $18, 0, 0, 3, 0, $13F)
    %spritemapEntry(0, $1C0, $10, 0, 0, 3, 0, $12F)
    %spritemapEntry(0, $1B8, $18, 0, 0, 3, 0, $13C)
    %spritemapEntry(0, $1B8, $10, 0, 0, 3, 0, $12C)
    %spritemapEntry(0, $1B0, $18, 0, 0, 3, 0, $13E)
    %spritemapEntry(0, $1B0, $10, 0, 0, 3, 0, $12E)
    %spritemapEntry(0, $1A8, $18, 0, 0, 3, 0, $132)
    %spritemapEntry(0, $1A8, $10, 0, 0, 3, 0, $122)


;;; $AC0B: 'COMPLE' ;;;
EndingSequenceSpritemaps_COMPLE:
    dw $000C
    %spritemapEntry(0, $1D0, $18, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1D0, $10, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1C8, $18, 0, 0, 3, 0, $13B)
    %spritemapEntry(0, $1C8, $10, 0, 0, 3, 0, $12B)
    %spritemapEntry(0, $1C0, $18, 0, 0, 3, 0, $13F)
    %spritemapEntry(0, $1C0, $10, 0, 0, 3, 0, $12F)
    %spritemapEntry(0, $1B8, $18, 0, 0, 3, 0, $13C)
    %spritemapEntry(0, $1B8, $10, 0, 0, 3, 0, $12C)
    %spritemapEntry(0, $1B0, $18, 0, 0, 3, 0, $13E)
    %spritemapEntry(0, $1B0, $10, 0, 0, 3, 0, $12E)
    %spritemapEntry(0, $1A8, $18, 0, 0, 3, 0, $132)
    %spritemapEntry(0, $1A8, $10, 0, 0, 3, 0, $122)


;;; $AC49: 'COMPLET' ;;;
EndingSequenceSpritemaps_COMPLET:
    dw $000E
    %spritemapEntry(0, $1D8, $18, 0, 0, 3, 0, $153)
    %spritemapEntry(0, $1D8, $10, 0, 0, 3, 0, $143)
    %spritemapEntry(0, $1D0, $18, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1D0, $10, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1C8, $18, 0, 0, 3, 0, $13B)
    %spritemapEntry(0, $1C8, $10, 0, 0, 3, 0, $12B)
    %spritemapEntry(0, $1C0, $18, 0, 0, 3, 0, $13F)
    %spritemapEntry(0, $1C0, $10, 0, 0, 3, 0, $12F)
    %spritemapEntry(0, $1B8, $18, 0, 0, 3, 0, $13C)
    %spritemapEntry(0, $1B8, $10, 0, 0, 3, 0, $12C)
    %spritemapEntry(0, $1B0, $18, 0, 0, 3, 0, $13E)
    %spritemapEntry(0, $1B0, $10, 0, 0, 3, 0, $12E)
    %spritemapEntry(0, $1A8, $18, 0, 0, 3, 0, $132)
    %spritemapEntry(0, $1A8, $10, 0, 0, 3, 0, $122)


;;; $AC91: 'COMPLETE' ;;;
EndingSequenceSpritemaps_COMPLETE:
    dw $0010
    %spritemapEntry(0, $1E0, $18, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1E0, $10, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1D8, $18, 0, 0, 3, 0, $153)
    %spritemapEntry(0, $1D8, $10, 0, 0, 3, 0, $143)
    %spritemapEntry(0, $1D0, $18, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1D0, $10, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1C8, $18, 0, 0, 3, 0, $13B)
    %spritemapEntry(0, $1C8, $10, 0, 0, 3, 0, $12B)
    %spritemapEntry(0, $1C0, $18, 0, 0, 3, 0, $13F)
    %spritemapEntry(0, $1C0, $10, 0, 0, 3, 0, $12F)
    %spritemapEntry(0, $1B8, $18, 0, 0, 3, 0, $13C)
    %spritemapEntry(0, $1B8, $10, 0, 0, 3, 0, $12C)
    %spritemapEntry(0, $1B0, $18, 0, 0, 3, 0, $13E)
    %spritemapEntry(0, $1B0, $10, 0, 0, 3, 0, $12E)
    %spritemapEntry(0, $1A8, $18, 0, 0, 3, 0, $132)
    %spritemapEntry(0, $1A8, $10, 0, 0, 3, 0, $122)


;;; $ACE3: 'COMPLETED' ;;;
EndingSequenceSpritemaps_COMPLETED:
    dw $0012
    %spritemapEntry(0, $1E8, $18, 0, 0, 3, 0, $133)
    %spritemapEntry(0, $1E8, $10, 0, 0, 3, 0, $123)
    %spritemapEntry(0, $1E0, $18, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1E0, $10, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1D8, $18, 0, 0, 3, 0, $153)
    %spritemapEntry(0, $1D8, $10, 0, 0, 3, 0, $143)
    %spritemapEntry(0, $1D0, $18, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1D0, $10, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1C8, $18, 0, 0, 3, 0, $13B)
    %spritemapEntry(0, $1C8, $10, 0, 0, 3, 0, $12B)
    %spritemapEntry(0, $1C0, $18, 0, 0, 3, 0, $13F)
    %spritemapEntry(0, $1C0, $10, 0, 0, 3, 0, $12F)
    %spritemapEntry(0, $1B8, $18, 0, 0, 3, 0, $13C)
    %spritemapEntry(0, $1B8, $10, 0, 0, 3, 0, $12C)
    %spritemapEntry(0, $1B0, $18, 0, 0, 3, 0, $13E)
    %spritemapEntry(0, $1B0, $10, 0, 0, 3, 0, $12E)
    %spritemapEntry(0, $1A8, $18, 0, 0, 3, 0, $132)
    %spritemapEntry(0, $1A8, $10, 0, 0, 3, 0, $122)


;;; $AD3F: 'COMPLETED S' ;;;
EndingSequenceSpritemaps_COMPLETEDS:
    dw $0014
    %spritemapEntry(0, $1F8, $18, 0, 0, 3, 0, $152)
    %spritemapEntry(0, $1F8, $10, 0, 0, 3, 0, $142)
    %spritemapEntry(0, $1E8, $18, 0, 0, 3, 0, $133)
    %spritemapEntry(0, $1E8, $10, 0, 0, 3, 0, $123)
    %spritemapEntry(0, $1E0, $18, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1E0, $10, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1D8, $18, 0, 0, 3, 0, $153)
    %spritemapEntry(0, $1D8, $10, 0, 0, 3, 0, $143)
    %spritemapEntry(0, $1D0, $18, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1D0, $10, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1C8, $18, 0, 0, 3, 0, $13B)
    %spritemapEntry(0, $1C8, $10, 0, 0, 3, 0, $12B)
    %spritemapEntry(0, $1C0, $18, 0, 0, 3, 0, $13F)
    %spritemapEntry(0, $1C0, $10, 0, 0, 3, 0, $12F)
    %spritemapEntry(0, $1B8, $18, 0, 0, 3, 0, $13C)
    %spritemapEntry(0, $1B8, $10, 0, 0, 3, 0, $12C)
    %spritemapEntry(0, $1B0, $18, 0, 0, 3, 0, $13E)
    %spritemapEntry(0, $1B0, $10, 0, 0, 3, 0, $12E)
    %spritemapEntry(0, $1A8, $18, 0, 0, 3, 0, $132)
    %spritemapEntry(0, $1A8, $10, 0, 0, 3, 0, $122)


;;; $ADA5: 'COMPLETED SU' ;;;
EndingSequenceSpritemaps_COMPLETEDSU:
    dw $0016
    %spritemapEntry(0, $00, $18, 0, 0, 3, 0, $154)
    %spritemapEntry(0, $00, $10, 0, 0, 3, 0, $144)
    %spritemapEntry(0, $1F8, $18, 0, 0, 3, 0, $152)
    %spritemapEntry(0, $1F8, $10, 0, 0, 3, 0, $142)
    %spritemapEntry(0, $1E8, $18, 0, 0, 3, 0, $133)
    %spritemapEntry(0, $1E8, $10, 0, 0, 3, 0, $123)
    %spritemapEntry(0, $1E0, $18, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1E0, $10, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1D8, $18, 0, 0, 3, 0, $153)
    %spritemapEntry(0, $1D8, $10, 0, 0, 3, 0, $143)
    %spritemapEntry(0, $1D0, $18, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1D0, $10, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1C8, $18, 0, 0, 3, 0, $13B)
    %spritemapEntry(0, $1C8, $10, 0, 0, 3, 0, $12B)
    %spritemapEntry(0, $1C0, $18, 0, 0, 3, 0, $13F)
    %spritemapEntry(0, $1C0, $10, 0, 0, 3, 0, $12F)
    %spritemapEntry(0, $1B8, $18, 0, 0, 3, 0, $13C)
    %spritemapEntry(0, $1B8, $10, 0, 0, 3, 0, $12C)
    %spritemapEntry(0, $1B0, $18, 0, 0, 3, 0, $13E)
    %spritemapEntry(0, $1B0, $10, 0, 0, 3, 0, $12E)
    %spritemapEntry(0, $1A8, $18, 0, 0, 3, 0, $132)
    %spritemapEntry(0, $1A8, $10, 0, 0, 3, 0, $122)


;;; $AE15: 'COMPLETED SUC' ;;;
EndingSequenceSpritemaps_COMPLETEDSUC:
    dw $0018
    %spritemapEntry(0, $08, $18, 0, 0, 3, 0, $132)
    %spritemapEntry(0, $08, $10, 0, 0, 3, 0, $122)
    %spritemapEntry(0, $00, $18, 0, 0, 3, 0, $154)
    %spritemapEntry(0, $00, $10, 0, 0, 3, 0, $144)
    %spritemapEntry(0, $1F8, $18, 0, 0, 3, 0, $152)
    %spritemapEntry(0, $1F8, $10, 0, 0, 3, 0, $142)
    %spritemapEntry(0, $1E8, $18, 0, 0, 3, 0, $133)
    %spritemapEntry(0, $1E8, $10, 0, 0, 3, 0, $123)
    %spritemapEntry(0, $1E0, $18, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1E0, $10, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1D8, $18, 0, 0, 3, 0, $153)
    %spritemapEntry(0, $1D8, $10, 0, 0, 3, 0, $143)
    %spritemapEntry(0, $1D0, $18, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1D0, $10, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1C8, $18, 0, 0, 3, 0, $13B)
    %spritemapEntry(0, $1C8, $10, 0, 0, 3, 0, $12B)
    %spritemapEntry(0, $1C0, $18, 0, 0, 3, 0, $13F)
    %spritemapEntry(0, $1C0, $10, 0, 0, 3, 0, $12F)
    %spritemapEntry(0, $1B8, $18, 0, 0, 3, 0, $13C)
    %spritemapEntry(0, $1B8, $10, 0, 0, 3, 0, $12C)
    %spritemapEntry(0, $1B0, $18, 0, 0, 3, 0, $13E)
    %spritemapEntry(0, $1B0, $10, 0, 0, 3, 0, $12E)
    %spritemapEntry(0, $1A8, $18, 0, 0, 3, 0, $132)
    %spritemapEntry(0, $1A8, $10, 0, 0, 3, 0, $122)


;;; $AE8F: 'COMPLETED SUCC' ;;;
EndingSequenceSpritemaps_COMPLETEDSUCC:
    dw $001A
    %spritemapEntry(0, $10, $18, 0, 0, 3, 0, $132)
    %spritemapEntry(0, $10, $10, 0, 0, 3, 0, $122)
    %spritemapEntry(0, $08, $18, 0, 0, 3, 0, $132)
    %spritemapEntry(0, $08, $10, 0, 0, 3, 0, $122)
    %spritemapEntry(0, $00, $18, 0, 0, 3, 0, $154)
    %spritemapEntry(0, $00, $10, 0, 0, 3, 0, $144)
    %spritemapEntry(0, $1F8, $18, 0, 0, 3, 0, $152)
    %spritemapEntry(0, $1F8, $10, 0, 0, 3, 0, $142)
    %spritemapEntry(0, $1E8, $18, 0, 0, 3, 0, $133)
    %spritemapEntry(0, $1E8, $10, 0, 0, 3, 0, $123)
    %spritemapEntry(0, $1E0, $18, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1E0, $10, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1D8, $18, 0, 0, 3, 0, $153)
    %spritemapEntry(0, $1D8, $10, 0, 0, 3, 0, $143)
    %spritemapEntry(0, $1D0, $18, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1D0, $10, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1C8, $18, 0, 0, 3, 0, $13B)
    %spritemapEntry(0, $1C8, $10, 0, 0, 3, 0, $12B)
    %spritemapEntry(0, $1C0, $18, 0, 0, 3, 0, $13F)
    %spritemapEntry(0, $1C0, $10, 0, 0, 3, 0, $12F)
    %spritemapEntry(0, $1B8, $18, 0, 0, 3, 0, $13C)
    %spritemapEntry(0, $1B8, $10, 0, 0, 3, 0, $12C)
    %spritemapEntry(0, $1B0, $18, 0, 0, 3, 0, $13E)
    %spritemapEntry(0, $1B0, $10, 0, 0, 3, 0, $12E)
    %spritemapEntry(0, $1A8, $18, 0, 0, 3, 0, $132)
    %spritemapEntry(0, $1A8, $10, 0, 0, 3, 0, $122)


;;; $AF13: 'COMPLETED SUCCE' ;;;
EndingSequenceSpritemaps_COMPLETEDSUCCE:
    dw $001C
    %spritemapEntry(0, $18, $18, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $18, $10, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $10, $18, 0, 0, 3, 0, $132)
    %spritemapEntry(0, $10, $10, 0, 0, 3, 0, $122)
    %spritemapEntry(0, $08, $18, 0, 0, 3, 0, $132)
    %spritemapEntry(0, $08, $10, 0, 0, 3, 0, $122)
    %spritemapEntry(0, $00, $18, 0, 0, 3, 0, $154)
    %spritemapEntry(0, $00, $10, 0, 0, 3, 0, $144)
    %spritemapEntry(0, $1F8, $18, 0, 0, 3, 0, $152)
    %spritemapEntry(0, $1F8, $10, 0, 0, 3, 0, $142)
    %spritemapEntry(0, $1E8, $18, 0, 0, 3, 0, $133)
    %spritemapEntry(0, $1E8, $10, 0, 0, 3, 0, $123)
    %spritemapEntry(0, $1E0, $18, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1E0, $10, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1D8, $18, 0, 0, 3, 0, $153)
    %spritemapEntry(0, $1D8, $10, 0, 0, 3, 0, $143)
    %spritemapEntry(0, $1D0, $18, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1D0, $10, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1C8, $18, 0, 0, 3, 0, $13B)
    %spritemapEntry(0, $1C8, $10, 0, 0, 3, 0, $12B)
    %spritemapEntry(0, $1C0, $18, 0, 0, 3, 0, $13F)
    %spritemapEntry(0, $1C0, $10, 0, 0, 3, 0, $12F)
    %spritemapEntry(0, $1B8, $18, 0, 0, 3, 0, $13C)
    %spritemapEntry(0, $1B8, $10, 0, 0, 3, 0, $12C)
    %spritemapEntry(0, $1B0, $18, 0, 0, 3, 0, $13E)
    %spritemapEntry(0, $1B0, $10, 0, 0, 3, 0, $12E)
    %spritemapEntry(0, $1A8, $18, 0, 0, 3, 0, $132)
    %spritemapEntry(0, $1A8, $10, 0, 0, 3, 0, $122)


;;; $AFA1: 'COMPLETED SUCCES' ;;;
EndingSequenceSpritemaps_COMPLETEDSUCCES:
    dw $001E
    %spritemapEntry(0, $20, $18, 0, 0, 3, 0, $152)
    %spritemapEntry(0, $20, $10, 0, 0, 3, 0, $142)
    %spritemapEntry(0, $18, $18, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $18, $10, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $10, $18, 0, 0, 3, 0, $132)
    %spritemapEntry(0, $10, $10, 0, 0, 3, 0, $122)
    %spritemapEntry(0, $08, $18, 0, 0, 3, 0, $132)
    %spritemapEntry(0, $08, $10, 0, 0, 3, 0, $122)
    %spritemapEntry(0, $00, $18, 0, 0, 3, 0, $154)
    %spritemapEntry(0, $00, $10, 0, 0, 3, 0, $144)
    %spritemapEntry(0, $1F8, $18, 0, 0, 3, 0, $152)
    %spritemapEntry(0, $1F8, $10, 0, 0, 3, 0, $142)
    %spritemapEntry(0, $1E8, $18, 0, 0, 3, 0, $133)
    %spritemapEntry(0, $1E8, $10, 0, 0, 3, 0, $123)
    %spritemapEntry(0, $1E0, $18, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1E0, $10, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1D8, $18, 0, 0, 3, 0, $153)
    %spritemapEntry(0, $1D8, $10, 0, 0, 3, 0, $143)
    %spritemapEntry(0, $1D0, $18, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1D0, $10, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1C8, $18, 0, 0, 3, 0, $13B)
    %spritemapEntry(0, $1C8, $10, 0, 0, 3, 0, $12B)
    %spritemapEntry(0, $1C0, $18, 0, 0, 3, 0, $13F)
    %spritemapEntry(0, $1C0, $10, 0, 0, 3, 0, $12F)
    %spritemapEntry(0, $1B8, $18, 0, 0, 3, 0, $13C)
    %spritemapEntry(0, $1B8, $10, 0, 0, 3, 0, $12C)
    %spritemapEntry(0, $1B0, $18, 0, 0, 3, 0, $13E)
    %spritemapEntry(0, $1B0, $10, 0, 0, 3, 0, $12E)
    %spritemapEntry(0, $1A8, $18, 0, 0, 3, 0, $132)
    %spritemapEntry(0, $1A8, $10, 0, 0, 3, 0, $122)


;;; $B039: 'COMPLETED SUCCESS' ;;;
EndingSequenceSpritemaps_COMPLETEDSUCCESS:
    dw $0020
    %spritemapEntry(0, $28, $18, 0, 0, 3, 0, $152)
    %spritemapEntry(0, $28, $10, 0, 0, 3, 0, $142)
    %spritemapEntry(0, $20, $18, 0, 0, 3, 0, $152)
    %spritemapEntry(0, $20, $10, 0, 0, 3, 0, $142)
    %spritemapEntry(0, $18, $18, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $18, $10, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $10, $18, 0, 0, 3, 0, $132)
    %spritemapEntry(0, $10, $10, 0, 0, 3, 0, $122)
    %spritemapEntry(0, $08, $18, 0, 0, 3, 0, $132)
    %spritemapEntry(0, $08, $10, 0, 0, 3, 0, $122)
    %spritemapEntry(0, $00, $18, 0, 0, 3, 0, $154)
    %spritemapEntry(0, $00, $10, 0, 0, 3, 0, $144)
    %spritemapEntry(0, $1F8, $18, 0, 0, 3, 0, $152)
    %spritemapEntry(0, $1F8, $10, 0, 0, 3, 0, $142)
    %spritemapEntry(0, $1E8, $18, 0, 0, 3, 0, $133)
    %spritemapEntry(0, $1E8, $10, 0, 0, 3, 0, $123)
    %spritemapEntry(0, $1E0, $18, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1E0, $10, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1D8, $18, 0, 0, 3, 0, $153)
    %spritemapEntry(0, $1D8, $10, 0, 0, 3, 0, $143)
    %spritemapEntry(0, $1D0, $18, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1D0, $10, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1C8, $18, 0, 0, 3, 0, $13B)
    %spritemapEntry(0, $1C8, $10, 0, 0, 3, 0, $12B)
    %spritemapEntry(0, $1C0, $18, 0, 0, 3, 0, $13F)
    %spritemapEntry(0, $1C0, $10, 0, 0, 3, 0, $12F)
    %spritemapEntry(0, $1B8, $18, 0, 0, 3, 0, $13C)
    %spritemapEntry(0, $1B8, $10, 0, 0, 3, 0, $12C)
    %spritemapEntry(0, $1B0, $18, 0, 0, 3, 0, $13E)
    %spritemapEntry(0, $1B0, $10, 0, 0, 3, 0, $12E)
    %spritemapEntry(0, $1A8, $18, 0, 0, 3, 0, $132)
    %spritemapEntry(0, $1A8, $10, 0, 0, 3, 0, $122)


;;; $B0DB: 'COMPLETED SUCCESSF' ;;;
EndingSequenceSpritemaps_COMPLETEDSUCCESSF:
    dw $0022
    %spritemapEntry(0, $30, $18, 0, 0, 3, 0, $135)
    %spritemapEntry(0, $30, $10, 0, 0, 3, 0, $125)
    %spritemapEntry(0, $28, $18, 0, 0, 3, 0, $152)
    %spritemapEntry(0, $28, $10, 0, 0, 3, 0, $142)
    %spritemapEntry(0, $20, $18, 0, 0, 3, 0, $152)
    %spritemapEntry(0, $20, $10, 0, 0, 3, 0, $142)
    %spritemapEntry(0, $18, $18, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $18, $10, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $10, $18, 0, 0, 3, 0, $132)
    %spritemapEntry(0, $10, $10, 0, 0, 3, 0, $122)
    %spritemapEntry(0, $08, $18, 0, 0, 3, 0, $132)
    %spritemapEntry(0, $08, $10, 0, 0, 3, 0, $122)
    %spritemapEntry(0, $00, $18, 0, 0, 3, 0, $154)
    %spritemapEntry(0, $00, $10, 0, 0, 3, 0, $144)
    %spritemapEntry(0, $1F8, $18, 0, 0, 3, 0, $152)
    %spritemapEntry(0, $1F8, $10, 0, 0, 3, 0, $142)
    %spritemapEntry(0, $1E8, $18, 0, 0, 3, 0, $133)
    %spritemapEntry(0, $1E8, $10, 0, 0, 3, 0, $123)
    %spritemapEntry(0, $1E0, $18, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1E0, $10, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1D8, $18, 0, 0, 3, 0, $153)
    %spritemapEntry(0, $1D8, $10, 0, 0, 3, 0, $143)
    %spritemapEntry(0, $1D0, $18, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1D0, $10, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1C8, $18, 0, 0, 3, 0, $13B)
    %spritemapEntry(0, $1C8, $10, 0, 0, 3, 0, $12B)
    %spritemapEntry(0, $1C0, $18, 0, 0, 3, 0, $13F)
    %spritemapEntry(0, $1C0, $10, 0, 0, 3, 0, $12F)
    %spritemapEntry(0, $1B8, $18, 0, 0, 3, 0, $13C)
    %spritemapEntry(0, $1B8, $10, 0, 0, 3, 0, $12C)
    %spritemapEntry(0, $1B0, $18, 0, 0, 3, 0, $13E)
    %spritemapEntry(0, $1B0, $10, 0, 0, 3, 0, $12E)
    %spritemapEntry(0, $1A8, $18, 0, 0, 3, 0, $132)
    %spritemapEntry(0, $1A8, $10, 0, 0, 3, 0, $122)


;;; $B187: 'COMPLETED SUCCESSFU' ;;;
EndingSequenceSpritemaps_COMPLETEDSUCCESSFU:
    dw $0024
    %spritemapEntry(0, $38, $18, 0, 0, 3, 0, $154)
    %spritemapEntry(0, $38, $10, 0, 0, 3, 0, $144)
    %spritemapEntry(0, $30, $18, 0, 0, 3, 0, $135)
    %spritemapEntry(0, $30, $10, 0, 0, 3, 0, $125)
    %spritemapEntry(0, $28, $18, 0, 0, 3, 0, $152)
    %spritemapEntry(0, $28, $10, 0, 0, 3, 0, $142)
    %spritemapEntry(0, $20, $18, 0, 0, 3, 0, $152)
    %spritemapEntry(0, $20, $10, 0, 0, 3, 0, $142)
    %spritemapEntry(0, $18, $18, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $18, $10, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $10, $18, 0, 0, 3, 0, $132)
    %spritemapEntry(0, $10, $10, 0, 0, 3, 0, $122)
    %spritemapEntry(0, $08, $18, 0, 0, 3, 0, $132)
    %spritemapEntry(0, $08, $10, 0, 0, 3, 0, $122)
    %spritemapEntry(0, $00, $18, 0, 0, 3, 0, $154)
    %spritemapEntry(0, $00, $10, 0, 0, 3, 0, $144)
    %spritemapEntry(0, $1F8, $18, 0, 0, 3, 0, $152)
    %spritemapEntry(0, $1F8, $10, 0, 0, 3, 0, $142)
    %spritemapEntry(0, $1E8, $18, 0, 0, 3, 0, $133)
    %spritemapEntry(0, $1E8, $10, 0, 0, 3, 0, $123)
    %spritemapEntry(0, $1E0, $18, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1E0, $10, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1D8, $18, 0, 0, 3, 0, $153)
    %spritemapEntry(0, $1D8, $10, 0, 0, 3, 0, $143)
    %spritemapEntry(0, $1D0, $18, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1D0, $10, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1C8, $18, 0, 0, 3, 0, $13B)
    %spritemapEntry(0, $1C8, $10, 0, 0, 3, 0, $12B)
    %spritemapEntry(0, $1C0, $18, 0, 0, 3, 0, $13F)
    %spritemapEntry(0, $1C0, $10, 0, 0, 3, 0, $12F)
    %spritemapEntry(0, $1B8, $18, 0, 0, 3, 0, $13C)
    %spritemapEntry(0, $1B8, $10, 0, 0, 3, 0, $12C)
    %spritemapEntry(0, $1B0, $18, 0, 0, 3, 0, $13E)
    %spritemapEntry(0, $1B0, $10, 0, 0, 3, 0, $12E)
    %spritemapEntry(0, $1A8, $18, 0, 0, 3, 0, $132)
    %spritemapEntry(0, $1A8, $10, 0, 0, 3, 0, $122)


;;; $B23D: 'COMPLETED SUCCESSFUL' ;;;
EndingSequenceSpritemaps_COMPLETEDSUCCESSFUL:
    dw $0026
    %spritemapEntry(0, $40, $18, 0, 0, 3, 0, $13B)
    %spritemapEntry(0, $40, $10, 0, 0, 3, 0, $12B)
    %spritemapEntry(0, $38, $18, 0, 0, 3, 0, $154)
    %spritemapEntry(0, $38, $10, 0, 0, 3, 0, $144)
    %spritemapEntry(0, $30, $18, 0, 0, 3, 0, $135)
    %spritemapEntry(0, $30, $10, 0, 0, 3, 0, $125)
    %spritemapEntry(0, $28, $18, 0, 0, 3, 0, $152)
    %spritemapEntry(0, $28, $10, 0, 0, 3, 0, $142)
    %spritemapEntry(0, $20, $18, 0, 0, 3, 0, $152)
    %spritemapEntry(0, $20, $10, 0, 0, 3, 0, $142)
    %spritemapEntry(0, $18, $18, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $18, $10, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $10, $18, 0, 0, 3, 0, $132)
    %spritemapEntry(0, $10, $10, 0, 0, 3, 0, $122)
    %spritemapEntry(0, $08, $18, 0, 0, 3, 0, $132)
    %spritemapEntry(0, $08, $10, 0, 0, 3, 0, $122)
    %spritemapEntry(0, $00, $18, 0, 0, 3, 0, $154)
    %spritemapEntry(0, $00, $10, 0, 0, 3, 0, $144)
    %spritemapEntry(0, $1F8, $18, 0, 0, 3, 0, $152)
    %spritemapEntry(0, $1F8, $10, 0, 0, 3, 0, $142)
    %spritemapEntry(0, $1E8, $18, 0, 0, 3, 0, $133)
    %spritemapEntry(0, $1E8, $10, 0, 0, 3, 0, $123)
    %spritemapEntry(0, $1E0, $18, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1E0, $10, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1D8, $18, 0, 0, 3, 0, $153)
    %spritemapEntry(0, $1D8, $10, 0, 0, 3, 0, $143)
    %spritemapEntry(0, $1D0, $18, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1D0, $10, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1C8, $18, 0, 0, 3, 0, $13B)
    %spritemapEntry(0, $1C8, $10, 0, 0, 3, 0, $12B)
    %spritemapEntry(0, $1C0, $18, 0, 0, 3, 0, $13F)
    %spritemapEntry(0, $1C0, $10, 0, 0, 3, 0, $12F)
    %spritemapEntry(0, $1B8, $18, 0, 0, 3, 0, $13C)
    %spritemapEntry(0, $1B8, $10, 0, 0, 3, 0, $12C)
    %spritemapEntry(0, $1B0, $18, 0, 0, 3, 0, $13E)
    %spritemapEntry(0, $1B0, $10, 0, 0, 3, 0, $12E)
    %spritemapEntry(0, $1A8, $18, 0, 0, 3, 0, $132)
    %spritemapEntry(0, $1A8, $10, 0, 0, 3, 0, $122)


;;; $B2FD: 'COMPLETED SUCCESSFULL' ;;;
EndingSequenceSpritemaps_COMPLETEDSUCCESSFULL:
    dw $0028
    %spritemapEntry(0, $48, $18, 0, 0, 3, 0, $13B)
    %spritemapEntry(0, $48, $10, 0, 0, 3, 0, $12B)
    %spritemapEntry(0, $40, $18, 0, 0, 3, 0, $13B)
    %spritemapEntry(0, $40, $10, 0, 0, 3, 0, $12B)
    %spritemapEntry(0, $38, $18, 0, 0, 3, 0, $154)
    %spritemapEntry(0, $38, $10, 0, 0, 3, 0, $144)
    %spritemapEntry(0, $30, $18, 0, 0, 3, 0, $135)
    %spritemapEntry(0, $30, $10, 0, 0, 3, 0, $125)
    %spritemapEntry(0, $28, $18, 0, 0, 3, 0, $152)
    %spritemapEntry(0, $28, $10, 0, 0, 3, 0, $142)
    %spritemapEntry(0, $20, $18, 0, 0, 3, 0, $152)
    %spritemapEntry(0, $20, $10, 0, 0, 3, 0, $142)
    %spritemapEntry(0, $18, $18, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $18, $10, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $10, $18, 0, 0, 3, 0, $132)
    %spritemapEntry(0, $10, $10, 0, 0, 3, 0, $122)
    %spritemapEntry(0, $08, $18, 0, 0, 3, 0, $132)
    %spritemapEntry(0, $08, $10, 0, 0, 3, 0, $122)
    %spritemapEntry(0, $00, $18, 0, 0, 3, 0, $154)
    %spritemapEntry(0, $00, $10, 0, 0, 3, 0, $144)
    %spritemapEntry(0, $1F8, $18, 0, 0, 3, 0, $152)
    %spritemapEntry(0, $1F8, $10, 0, 0, 3, 0, $142)
    %spritemapEntry(0, $1E8, $18, 0, 0, 3, 0, $133)
    %spritemapEntry(0, $1E8, $10, 0, 0, 3, 0, $123)
    %spritemapEntry(0, $1E0, $18, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1E0, $10, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1D8, $18, 0, 0, 3, 0, $153)
    %spritemapEntry(0, $1D8, $10, 0, 0, 3, 0, $143)
    %spritemapEntry(0, $1D0, $18, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1D0, $10, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1C8, $18, 0, 0, 3, 0, $13B)
    %spritemapEntry(0, $1C8, $10, 0, 0, 3, 0, $12B)
    %spritemapEntry(0, $1C0, $18, 0, 0, 3, 0, $13F)
    %spritemapEntry(0, $1C0, $10, 0, 0, 3, 0, $12F)
    %spritemapEntry(0, $1B8, $18, 0, 0, 3, 0, $13C)
    %spritemapEntry(0, $1B8, $10, 0, 0, 3, 0, $12C)
    %spritemapEntry(0, $1B0, $18, 0, 0, 3, 0, $13E)
    %spritemapEntry(0, $1B0, $10, 0, 0, 3, 0, $12E)
    %spritemapEntry(0, $1A8, $18, 0, 0, 3, 0, $132)
    %spritemapEntry(0, $1A8, $10, 0, 0, 3, 0, $122)


;;; $B3C7: 'COMPLETED SUCCESSFULLY' ;;;
EndingSequenceSpritemaps_COMPLETEDSUCCESSFULLY:
    dw $002A
    %spritemapEntry(0, $50, $18, 0, 0, 3, 0, $158)
    %spritemapEntry(0, $50, $10, 0, 0, 3, 0, $148)
    %spritemapEntry(0, $48, $18, 0, 0, 3, 0, $13B)
    %spritemapEntry(0, $48, $10, 0, 0, 3, 0, $12B)
    %spritemapEntry(0, $40, $18, 0, 0, 3, 0, $13B)
    %spritemapEntry(0, $40, $10, 0, 0, 3, 0, $12B)
    %spritemapEntry(0, $38, $18, 0, 0, 3, 0, $154)
    %spritemapEntry(0, $38, $10, 0, 0, 3, 0, $144)
    %spritemapEntry(0, $30, $18, 0, 0, 3, 0, $135)
    %spritemapEntry(0, $30, $10, 0, 0, 3, 0, $125)
    %spritemapEntry(0, $28, $18, 0, 0, 3, 0, $152)
    %spritemapEntry(0, $28, $10, 0, 0, 3, 0, $142)
    %spritemapEntry(0, $20, $18, 0, 0, 3, 0, $152)
    %spritemapEntry(0, $20, $10, 0, 0, 3, 0, $142)
    %spritemapEntry(0, $18, $18, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $18, $10, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $10, $18, 0, 0, 3, 0, $132)
    %spritemapEntry(0, $10, $10, 0, 0, 3, 0, $122)
    %spritemapEntry(0, $08, $18, 0, 0, 3, 0, $132)
    %spritemapEntry(0, $08, $10, 0, 0, 3, 0, $122)
    %spritemapEntry(0, $00, $18, 0, 0, 3, 0, $154)
    %spritemapEntry(0, $00, $10, 0, 0, 3, 0, $144)
    %spritemapEntry(0, $1F8, $18, 0, 0, 3, 0, $152)
    %spritemapEntry(0, $1F8, $10, 0, 0, 3, 0, $142)
    %spritemapEntry(0, $1E8, $18, 0, 0, 3, 0, $133)
    %spritemapEntry(0, $1E8, $10, 0, 0, 3, 0, $123)
    %spritemapEntry(0, $1E0, $18, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1E0, $10, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1D8, $18, 0, 0, 3, 0, $153)
    %spritemapEntry(0, $1D8, $10, 0, 0, 3, 0, $143)
    %spritemapEntry(0, $1D0, $18, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1D0, $10, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1C8, $18, 0, 0, 3, 0, $13B)
    %spritemapEntry(0, $1C8, $10, 0, 0, 3, 0, $12B)
    %spritemapEntry(0, $1C0, $18, 0, 0, 3, 0, $13F)
    %spritemapEntry(0, $1C0, $10, 0, 0, 3, 0, $12F)
    %spritemapEntry(0, $1B8, $18, 0, 0, 3, 0, $13C)
    %spritemapEntry(0, $1B8, $10, 0, 0, 3, 0, $12C)
    %spritemapEntry(0, $1B0, $18, 0, 0, 3, 0, $13E)
    %spritemapEntry(0, $1B0, $10, 0, 0, 3, 0, $12E)
    %spritemapEntry(0, $1A8, $18, 0, 0, 3, 0, $132)
    %spritemapEntry(0, $1A8, $10, 0, 0, 3, 0, $122)


;;; $B49B: 'C' ;;;
EndingSequenceSpritemaps_C_lear:
    dw $0002
    %spritemapEntry(0, $1C0, $00, 0, 0, 3, 0, $132)
    %spritemapEntry(0, $1C0, $F8, 0, 0, 3, 0, $122)


;;; $B4A7: 'CL' ;;;
EndingSequenceSpritemaps_CL:
    dw $0004
    %spritemapEntry(0, $1C8, $00, 0, 0, 3, 0, $13B)
    %spritemapEntry(0, $1C8, $F8, 0, 0, 3, 0, $12B)
    %spritemapEntry(0, $1C0, $00, 0, 0, 3, 0, $132)
    %spritemapEntry(0, $1C0, $F8, 0, 0, 3, 0, $122)


;;; $B4BD: 'CLE' ;;;
EndingSequenceSpritemaps_CLE:
    dw $0006
    %spritemapEntry(0, $1D0, $00, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1D0, $F8, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1C8, $00, 0, 0, 3, 0, $13B)
    %spritemapEntry(0, $1C8, $F8, 0, 0, 3, 0, $12B)
    %spritemapEntry(0, $1C0, $00, 0, 0, 3, 0, $132)
    %spritemapEntry(0, $1C0, $F8, 0, 0, 3, 0, $122)


;;; $B4DD: 'CLEA' ;;;
EndingSequenceSpritemaps_CLEA:
    dw $0008
    %spritemapEntry(0, $1D8, $00, 0, 0, 3, 0, $130)
    %spritemapEntry(0, $1D8, $F8, 0, 0, 3, 0, $120)
    %spritemapEntry(0, $1D0, $00, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1D0, $F8, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1C8, $00, 0, 0, 3, 0, $13B)
    %spritemapEntry(0, $1C8, $F8, 0, 0, 3, 0, $12B)
    %spritemapEntry(0, $1C0, $00, 0, 0, 3, 0, $132)
    %spritemapEntry(0, $1C0, $F8, 0, 0, 3, 0, $122)


;;; $B507: 'CLEAR' ;;;
EndingSequenceSpritemaps_CLEAR:
    dw $000A
    %spritemapEntry(0, $1E0, $00, 0, 0, 3, 0, $151)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 0, $141)
    %spritemapEntry(0, $1D8, $00, 0, 0, 3, 0, $130)
    %spritemapEntry(0, $1D8, $F8, 0, 0, 3, 0, $120)
    %spritemapEntry(0, $1D0, $00, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1D0, $F8, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1C8, $00, 0, 0, 3, 0, $13B)
    %spritemapEntry(0, $1C8, $F8, 0, 0, 3, 0, $12B)
    %spritemapEntry(0, $1C0, $00, 0, 0, 3, 0, $132)
    %spritemapEntry(0, $1C0, $F8, 0, 0, 3, 0, $122)


;;; $B53B: 'CLEAR T' ;;;
EndingSequenceSpritemaps_CLEART:
    dw $000C
    %spritemapEntry(0, $1F0, $00, 0, 0, 3, 0, $153)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 0, $143)
    %spritemapEntry(0, $1E0, $00, 0, 0, 3, 0, $151)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 0, $141)
    %spritemapEntry(0, $1D8, $00, 0, 0, 3, 0, $130)
    %spritemapEntry(0, $1D8, $F8, 0, 0, 3, 0, $120)
    %spritemapEntry(0, $1D0, $00, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1D0, $F8, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1C8, $00, 0, 0, 3, 0, $13B)
    %spritemapEntry(0, $1C8, $F8, 0, 0, 3, 0, $12B)
    %spritemapEntry(0, $1C0, $00, 0, 0, 3, 0, $132)
    %spritemapEntry(0, $1C0, $F8, 0, 0, 3, 0, $122)


;;; $B579: 'CLEAR TI' ;;;
EndingSequenceSpritemaps_CLEARTI:
    dw $000E
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 0, $138)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $128)
    %spritemapEntry(0, $1F0, $00, 0, 0, 3, 0, $153)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 0, $143)
    %spritemapEntry(0, $1E0, $00, 0, 0, 3, 0, $151)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 0, $141)
    %spritemapEntry(0, $1D8, $00, 0, 0, 3, 0, $130)
    %spritemapEntry(0, $1D8, $F8, 0, 0, 3, 0, $120)
    %spritemapEntry(0, $1D0, $00, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1D0, $F8, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1C8, $00, 0, 0, 3, 0, $13B)
    %spritemapEntry(0, $1C8, $F8, 0, 0, 3, 0, $12B)
    %spritemapEntry(0, $1C0, $00, 0, 0, 3, 0, $132)
    %spritemapEntry(0, $1C0, $F8, 0, 0, 3, 0, $122)


;;; $B5C1: 'CLEAR TIM' ;;;
EndingSequenceSpritemaps_CLEARTIM:
    dw $0010
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $13C)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $12C)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 0, $138)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $128)
    %spritemapEntry(0, $1F0, $00, 0, 0, 3, 0, $153)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 0, $143)
    %spritemapEntry(0, $1E0, $00, 0, 0, 3, 0, $151)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 0, $141)
    %spritemapEntry(0, $1D8, $00, 0, 0, 3, 0, $130)
    %spritemapEntry(0, $1D8, $F8, 0, 0, 3, 0, $120)
    %spritemapEntry(0, $1D0, $00, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1D0, $F8, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1C8, $00, 0, 0, 3, 0, $13B)
    %spritemapEntry(0, $1C8, $F8, 0, 0, 3, 0, $12B)
    %spritemapEntry(0, $1C0, $00, 0, 0, 3, 0, $132)
    %spritemapEntry(0, $1C0, $F8, 0, 0, 3, 0, $122)


;;; $B613: 'CLEAR TIME' ;;;
EndingSequenceSpritemaps_CLEARTIME:
    dw $0012
    %spritemapEntry(0, $08, $00, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $08, $F8, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $13C)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $12C)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 0, $138)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $128)
    %spritemapEntry(0, $1F0, $00, 0, 0, 3, 0, $153)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 0, $143)
    %spritemapEntry(0, $1E0, $00, 0, 0, 3, 0, $151)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 0, $141)
    %spritemapEntry(0, $1D8, $00, 0, 0, 3, 0, $130)
    %spritemapEntry(0, $1D8, $F8, 0, 0, 3, 0, $120)
    %spritemapEntry(0, $1D0, $00, 0, 0, 3, 0, $134)
    %spritemapEntry(0, $1D0, $F8, 0, 0, 3, 0, $124)
    %spritemapEntry(0, $1C8, $00, 0, 0, 3, 0, $13B)
    %spritemapEntry(0, $1C8, $F8, 0, 0, 3, 0, $12B)
    %spritemapEntry(0, $1C0, $00, 0, 0, 3, 0, $132)
    %spritemapEntry(0, $1C0, $F8, 0, 0, 3, 0, $122)


;;; $B66F: ':' ;;;
EndingSequenceSpritemaps_Colon:
    dw $0002
    %spritemapEntry(0, $1FC, $00, 1, 0, 3, 0, $15A)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 0, $15A)


;;; $B67B: '0' ;;;
EndingSequenceSpritemaps_0:
    dw $0002
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 0, $170)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 0, $160)


;;; $B687: '1' ;;;
EndingSequenceSpritemaps_1:
    dw $0002
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 0, $171)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 0, $161)


;;; $B693: '2' ;;;
EndingSequenceSpritemaps_2:
    dw $0002
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 0, $172)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 0, $162)


;;; $B69F: '3' ;;;
EndingSequenceSpritemaps_3:
    dw $0002
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 0, $173)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 0, $163)


;;; $B6AB: '4' ;;;
EndingSequenceSpritemaps_4:
    dw $0002
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 0, $174)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 0, $164)


;;; $B6B7: '5' ;;;
EndingSequenceSpritemaps_5:
    dw $0002
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 0, $175)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 0, $165)


;;; $B6C3: '6' ;;;
EndingSequenceSpritemaps_6:
    dw $0002
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 0, $176)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 0, $166)


;;; $B6CF: '7' ;;;
EndingSequenceSpritemaps_7:
    dw $0002
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 0, $177)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 0, $167)


;;; $B6DB: '8' ;;;
EndingSequenceSpritemaps_8:
    dw $0002
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 0, $178)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 0, $168)


;;; $B6E7: '9' ;;;
EndingSequenceSpritemaps_9:
    dw $0002
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 0, $179)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 0, $169)


;;; $B6F3: Ending cutscene - bottom clouds pattern ;;;
EndingSequenceSpritemaps_EndingCutsceneBottomCloudsPattern:
    dw $0010
    %spritemapEntry(0, $60, $00, 0, 0, 3, 5, $CC)
    %spritemapEntry(0, $40, $00, 0, 0, 3, 5, $C8)
    %spritemapEntry(0, $20, $00, 0, 0, 3, 5, $C4)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 5, $C0)
    %spritemapEntry(0, $60, $E0, 0, 0, 3, 5, $8C)
    %spritemapEntry(0, $40, $E0, 0, 0, 3, 5, $88)
    %spritemapEntry(0, $20, $E0, 0, 0, 3, 5, $84)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 5, $80)
    %spritemapEntry(0, $1E0, $00, 0, 0, 3, 5, $CC)
    %spritemapEntry(0, $1C0, $00, 0, 0, 3, 5, $C8)
    %spritemapEntry(0, $1A0, $00, 0, 0, 3, 5, $C4)
    %spritemapEntry(0, $180, $00, 0, 0, 3, 5, $C0)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 5, $8C)
    %spritemapEntry(0, $1C0, $E0, 0, 0, 3, 5, $88)
    %spritemapEntry(0, $1A0, $E0, 0, 0, 3, 5, $84)
    %spritemapEntry(0, $180, $E0, 0, 0, 3, 5, $80)


;;; $B745: Ending cutscene - top clouds pattern ;;;
EndingSequenceSpritemaps_EndingCutsceneTopCloudsPattern:
    dw $0010
    %spritemapEntry(0, $180, $E0, 1, 1, 3, 5, $CC)
    %spritemapEntry(0, $1A0, $E0, 1, 1, 3, 5, $C8)
    %spritemapEntry(0, $1C0, $E0, 1, 1, 3, 5, $C4)
    %spritemapEntry(0, $1E0, $E0, 1, 1, 3, 5, $C0)
    %spritemapEntry(0, $180, $00, 1, 1, 3, 5, $8C)
    %spritemapEntry(0, $1A0, $00, 1, 1, 3, 5, $88)
    %spritemapEntry(0, $1C0, $00, 1, 1, 3, 5, $84)
    %spritemapEntry(0, $1E0, $00, 1, 1, 3, 5, $80)
    %spritemapEntry(0, $00, $E0, 1, 1, 3, 5, $CC)
    %spritemapEntry(0, $20, $E0, 1, 1, 3, 5, $C8)
    %spritemapEntry(0, $40, $E0, 1, 1, 3, 5, $C4)
    %spritemapEntry(0, $60, $E0, 1, 1, 3, 5, $C0)
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $8C)
    %spritemapEntry(0, $20, $00, 1, 1, 3, 5, $88)
    %spritemapEntry(0, $40, $00, 1, 1, 3, 5, $84)
    %spritemapEntry(0, $60, $00, 1, 1, 3, 5, $80)


;;; $B797: Ending cutscene - bottom clouds edge ;;;
EndingSequenceSpritemaps_EndingCutsceneBottomCloudsEdge:
    dw $0010
    %spritemapEntry(0, $60, $00, 0, 0, 3, 5, $4C)
    %spritemapEntry(0, $40, $00, 0, 0, 3, 5, $48)
    %spritemapEntry(0, $20, $00, 0, 0, 3, 5, $44)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 5, $40)
    %spritemapEntry(0, $60, $E0, 0, 0, 3, 5, $0C)
    %spritemapEntry(0, $40, $E0, 0, 0, 3, 5, $08)
    %spritemapEntry(0, $20, $E0, 0, 0, 3, 5, $04)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 5, $00)
    %spritemapEntry(0, $1E0, $00, 0, 0, 3, 5, $4C)
    %spritemapEntry(0, $1C0, $00, 0, 0, 3, 5, $48)
    %spritemapEntry(0, $1A0, $00, 0, 0, 3, 5, $44)
    %spritemapEntry(0, $180, $00, 0, 0, 3, 5, $40)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 3, 5, $0C)
    %spritemapEntry(0, $1C0, $E0, 0, 0, 3, 5, $08)
    %spritemapEntry(0, $1A0, $E0, 0, 0, 3, 5, $04)
    %spritemapEntry(0, $180, $E0, 0, 0, 3, 5, $00)


;;; $B7E9: Ending cutscene - top clouds edge ;;;
EndingSequenceSpritemaps_EndingCutsceneTopCloudsEdge:
    dw $0010
    %spritemapEntry(0, $180, $E0, 1, 1, 3, 5, $4C)
    %spritemapEntry(0, $1A0, $E0, 1, 1, 3, 5, $48)
    %spritemapEntry(0, $1C0, $E0, 1, 1, 3, 5, $44)
    %spritemapEntry(0, $1E0, $E0, 1, 1, 3, 5, $40)
    %spritemapEntry(0, $180, $00, 1, 1, 3, 5, $0C)
    %spritemapEntry(0, $1A0, $00, 1, 1, 3, 5, $08)
    %spritemapEntry(0, $1C0, $00, 1, 1, 3, 5, $04)
    %spritemapEntry(0, $1E0, $00, 1, 1, 3, 5, $00)
    %spritemapEntry(0, $00, $E0, 1, 1, 3, 5, $4C)
    %spritemapEntry(0, $20, $E0, 1, 1, 3, 5, $48)
    %spritemapEntry(0, $40, $E0, 1, 1, 3, 5, $44)
    %spritemapEntry(0, $60, $E0, 1, 1, 3, 5, $40)
    %spritemapEntry(0, $00, $00, 1, 1, 3, 5, $0C)
    %spritemapEntry(0, $20, $00, 1, 1, 3, 5, $08)
    %spritemapEntry(0, $40, $00, 1, 1, 3, 5, $04)
    %spritemapEntry(0, $60, $00, 1, 1, 3, 5, $00)


;;; $B83B: Ending cutscene - right clouds ;;;
EndingSequenceSpritemaps_EndingCutsceneRightClouds:
    dw $0020
    %spritemapEntry(0, $60, $60, 0, 0, 3, 5, $1CC)
    %spritemapEntry(0, $40, $60, 0, 0, 3, 5, $1C8)
    %spritemapEntry(0, $20, $60, 0, 0, 3, 5, $1C4)
    %spritemapEntry(0, $00, $60, 0, 0, 3, 5, $1C0)
    %spritemapEntry(0, $60, $40, 0, 0, 3, 5, $18C)
    %spritemapEntry(0, $40, $40, 0, 0, 3, 5, $188)
    %spritemapEntry(0, $20, $40, 0, 0, 3, 5, $184)
    %spritemapEntry(0, $00, $40, 0, 0, 3, 5, $180)
    %spritemapEntry(0, $60, $20, 0, 0, 3, 5, $14C)
    %spritemapEntry(0, $40, $20, 0, 0, 3, 5, $148)
    %spritemapEntry(0, $20, $20, 0, 0, 3, 5, $144)
    %spritemapEntry(0, $00, $20, 0, 0, 3, 5, $140)
    %spritemapEntry(0, $60, $00, 0, 0, 3, 5, $10C)
    %spritemapEntry(0, $40, $00, 0, 0, 3, 5, $108)
    %spritemapEntry(0, $20, $00, 0, 0, 3, 5, $104)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 5, $100)
    %spritemapEntry(0, $60, $E0, 0, 0, 3, 5, $1CC)
    %spritemapEntry(0, $40, $E0, 0, 0, 3, 5, $1C8)
    %spritemapEntry(0, $20, $E0, 0, 0, 3, 5, $1C4)
    %spritemapEntry(0, $00, $E0, 0, 0, 3, 5, $1C0)
    %spritemapEntry(0, $60, $C0, 0, 0, 3, 5, $18C)
    %spritemapEntry(0, $40, $C0, 0, 0, 3, 5, $188)
    %spritemapEntry(0, $20, $C0, 0, 0, 3, 5, $184)
    %spritemapEntry(0, $00, $C0, 0, 0, 3, 5, $180)
    %spritemapEntry(0, $60, $A0, 0, 0, 3, 5, $14C)
    %spritemapEntry(0, $40, $A0, 0, 0, 3, 5, $148)
    %spritemapEntry(0, $20, $A0, 0, 0, 3, 5, $144)
    %spritemapEntry(0, $00, $A0, 0, 0, 3, 5, $140)
    %spritemapEntry(0, $60, $80, 0, 0, 3, 5, $10C)
    %spritemapEntry(0, $40, $80, 0, 0, 3, 5, $108)
    %spritemapEntry(0, $20, $80, 0, 0, 3, 5, $104)
    %spritemapEntry(0, $00, $80, 0, 0, 3, 5, $100)


;;; $B8DD: Ending cutscene - left clouds ;;;
EndingSequenceSpritemaps_EndingCutsceneLeftClouds:
    dw $0020
    %spritemapEntry(0, $180, $60, 0, 1, 3, 5, $1CC)
    %spritemapEntry(0, $1A0, $60, 0, 1, 3, 5, $1C8)
    %spritemapEntry(0, $1C0, $60, 0, 1, 3, 5, $1C4)
    %spritemapEntry(0, $1E0, $60, 0, 1, 3, 5, $1C0)
    %spritemapEntry(0, $180, $40, 0, 1, 3, 5, $18C)
    %spritemapEntry(0, $1A0, $40, 0, 1, 3, 5, $188)
    %spritemapEntry(0, $1C0, $40, 0, 1, 3, 5, $184)
    %spritemapEntry(0, $1E0, $40, 0, 1, 3, 5, $180)
    %spritemapEntry(0, $180, $20, 0, 1, 3, 5, $14C)
    %spritemapEntry(0, $1A0, $20, 0, 1, 3, 5, $148)
    %spritemapEntry(0, $1C0, $20, 0, 1, 3, 5, $144)
    %spritemapEntry(0, $1E0, $20, 0, 1, 3, 5, $140)
    %spritemapEntry(0, $180, $00, 0, 1, 3, 5, $10C)
    %spritemapEntry(0, $1A0, $00, 0, 1, 3, 5, $108)
    %spritemapEntry(0, $1C0, $00, 0, 1, 3, 5, $104)
    %spritemapEntry(0, $1E0, $00, 0, 1, 3, 5, $100)
    %spritemapEntry(0, $180, $E0, 0, 1, 3, 5, $1CC)
    %spritemapEntry(0, $1A0, $E0, 0, 1, 3, 5, $1C8)
    %spritemapEntry(0, $1C0, $E0, 0, 1, 3, 5, $1C4)
    %spritemapEntry(0, $1E0, $E0, 0, 1, 3, 5, $1C0)
    %spritemapEntry(0, $180, $C0, 0, 1, 3, 5, $18C)
    %spritemapEntry(0, $1A0, $C0, 0, 1, 3, 5, $188)
    %spritemapEntry(0, $1C0, $C0, 0, 1, 3, 5, $184)
    %spritemapEntry(0, $1E0, $C0, 0, 1, 3, 5, $180)
    %spritemapEntry(0, $180, $A0, 0, 1, 3, 5, $14C)
    %spritemapEntry(0, $1A0, $A0, 0, 1, 3, 5, $148)
    %spritemapEntry(0, $1C0, $A0, 0, 1, 3, 5, $144)
    %spritemapEntry(0, $1E0, $A0, 0, 1, 3, 5, $140)
    %spritemapEntry(0, $180, $80, 0, 1, 3, 5, $10C)
    %spritemapEntry(0, $1A0, $80, 0, 1, 3, 5, $108)
    %spritemapEntry(0, $1C0, $80, 0, 1, 3, 5, $104)
    %spritemapEntry(0, $1E0, $80, 0, 1, 3, 5, $100)


;;; $B97F: Ending screw attack symbol - upper part ;;;
EndingSequenceSpritemaps_ScrewAttackSymbolUpperPart:
    dw $000E
    %spritemapEntry(1, $43EA, $09, 0, 0, 3, 7, $64)
    %spritemapEntry(1, $43DA, $09, 0, 0, 3, 7, $62)
    %spritemapEntry(0, $1A, $D1, 0, 0, 3, 7, $18)
    %spritemapEntry(0, $1A, $C9, 0, 0, 3, 7, $08)
    %spritemapEntry(1, $43FA, $F9, 0, 0, 3, 7, $82)
    %spritemapEntry(1, $43EA, $F9, 0, 0, 3, 7, $80)
    %spritemapEntry(1, $420A, $C9, 0, 0, 3, 7, $06)
    %spritemapEntry(1, $420A, $D9, 0, 0, 3, 7, $26)
    %spritemapEntry(1, $43FA, $D9, 0, 0, 3, 7, $24)
    %spritemapEntry(1, $43EA, $D9, 0, 0, 3, 7, $22)
    %spritemapEntry(1, $43FA, $E9, 0, 0, 3, 7, $44)
    %spritemapEntry(1, $43EA, $E9, 0, 0, 3, 7, $42)
    %spritemapEntry(1, $43DA, $F9, 0, 0, 3, 7, $60)
    %spritemapEntry(1, $43DA, $E9, 0, 0, 3, 7, $40)


;;; $B9C7: Ending screw attack symbol - lower part ;;;
EndingSequenceSpritemaps_ScrewAttackSymbolLowerPart:
    dw $000E
    %spritemapEntry(1, $4206, $E7, 1, 1, 3, 7, $64)
    %spritemapEntry(1, $4216, $E7, 1, 1, 3, 7, $62)
    %spritemapEntry(0, $1DE, $27, 1, 1, 3, 7, $18)
    %spritemapEntry(0, $1DE, $2F, 1, 1, 3, 7, $08)
    %spritemapEntry(1, $43F6, $F7, 1, 1, 3, 7, $82)
    %spritemapEntry(1, $4206, $F7, 1, 1, 3, 7, $80)
    %spritemapEntry(1, $43E6, $27, 1, 1, 3, 7, $06)
    %spritemapEntry(1, $43E6, $17, 1, 1, 3, 7, $26)
    %spritemapEntry(1, $43F6, $17, 1, 1, 3, 7, $24)
    %spritemapEntry(1, $4206, $17, 1, 1, 3, 7, $22)
    %spritemapEntry(1, $43F6, $07, 1, 1, 3, 7, $44)
    %spritemapEntry(1, $4206, $07, 1, 1, 3, 7, $42)
    %spritemapEntry(1, $4216, $F7, 1, 1, 3, 7, $60)
    %spritemapEntry(1, $4216, $07, 1, 1, 3, 7, $40)


;;; $BA0F: Ending screw attack symbol - right wrap frame 1 ;;;
EndingSequenceSpritemaps_ScrewAttackSymbolRightWrapFrame1:
    dw $000C
    %spritemapEntry(1, $4218, $E0, 0, 0, 3, 7, $49)
    %spritemapEntry(1, $4210, $E0, 0, 0, 3, 7, $48)
    %spritemapEntry(0, $08, $E8, 0, 0, 3, 7, $48)
    %spritemapEntry(1, $4200, $F0, 0, 0, 3, 7, $4C)
    %spritemapEntry(1, $4210, $F0, 0, 0, 3, 7, $4E)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 7, $5B)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 7, $6B)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 7, $6A)
    %spritemapEntry(0, $28, $F8, 0, 0, 3, 7, $79)
    %spritemapEntry(0, $20, $F8, 0, 0, 3, 7, $78)
    %spritemapEntry(0, $28, $F0, 0, 0, 3, 7, $69)
    %spritemapEntry(0, $20, $F0, 0, 0, 3, 7, $68)


;;; $BA4D: Ending screw attack symbol - right wrap frame 2 ;;;
EndingSequenceSpritemaps_ScrewAttackSymbolRightWrapFrame2:
    dw $0012
    %spritemapEntry(1, $4218, $E0, 0, 0, 3, 7, $49)
    %spritemapEntry(1, $4210, $E0, 0, 0, 3, 7, $48)
    %spritemapEntry(0, $08, $E8, 0, 0, 3, 7, $48)
    %spritemapEntry(1, $4200, $F0, 0, 0, 3, 7, $4C)
    %spritemapEntry(1, $4210, $F0, 0, 0, 3, 7, $4E)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 7, $5B)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 7, $6B)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 7, $6A)
    %spritemapEntry(0, $28, $F8, 0, 0, 3, 7, $79)
    %spritemapEntry(0, $20, $F8, 0, 0, 3, 7, $78)
    %spritemapEntry(0, $28, $F0, 0, 0, 3, 7, $69)
    %spritemapEntry(0, $20, $F0, 0, 0, 3, 7, $68)
    %spritemapEntry(1, $4220, $18, 0, 0, 3, 7, $20)
    %spritemapEntry(0, $18, $08, 0, 0, 3, 7, $6C)
    %spritemapEntry(0, $18, $00, 0, 0, 3, 7, $10)
    %spritemapEntry(0, $18, $F8, 0, 0, 3, 7, $00)
    %spritemapEntry(1, $4220, $08, 0, 0, 3, 7, $6D)
    %spritemapEntry(1, $4220, $F8, 0, 0, 3, 7, $01)


;;; $BAA9: Ending screw attack symbol - right wrap frame 3 ;;;
EndingSequenceSpritemaps_ScrewAttackSymbolRightWrapFrame3:
    dw $0019
    %spritemapEntry(0, $07, $21, 1, 1, 3, 7, $2C)
    %spritemapEntry(0, $1EF, $31, 1, 1, 3, 7, $0F)
    %spritemapEntry(1, $4217, $29, 1, 1, 3, 7, $09)
    %spritemapEntry(1, $43F7, $29, 1, 1, 3, 7, $0D)
    %spritemapEntry(1, $4207, $29, 1, 1, 3, 7, $0B)
    %spritemapEntry(0, $0F, $21, 1, 1, 3, 7, $2B)
    %spritemapEntry(1, $4217, $19, 1, 1, 3, 7, $29)
    %spritemapEntry(1, $4218, $E0, 0, 0, 3, 7, $49)
    %spritemapEntry(1, $4210, $E0, 0, 0, 3, 7, $48)
    %spritemapEntry(0, $08, $E8, 0, 0, 3, 7, $48)
    %spritemapEntry(1, $4200, $F0, 0, 0, 3, 7, $4C)
    %spritemapEntry(1, $4210, $F0, 0, 0, 3, 7, $4E)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 7, $5B)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 7, $6B)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 7, $6A)
    %spritemapEntry(0, $28, $F8, 0, 0, 3, 7, $79)
    %spritemapEntry(0, $20, $F8, 0, 0, 3, 7, $78)
    %spritemapEntry(0, $28, $F0, 0, 0, 3, 7, $69)
    %spritemapEntry(0, $20, $F0, 0, 0, 3, 7, $68)
    %spritemapEntry(1, $4220, $18, 0, 0, 3, 7, $20)
    %spritemapEntry(0, $18, $08, 0, 0, 3, 7, $6C)
    %spritemapEntry(0, $18, $00, 0, 0, 3, 7, $10)
    %spritemapEntry(0, $18, $F8, 0, 0, 3, 7, $00)
    %spritemapEntry(1, $4220, $08, 0, 0, 3, 7, $6D)
    %spritemapEntry(1, $4220, $F8, 0, 0, 3, 7, $01)


;;; $BB28: Ending screw attack symbol - left wrap frame 1 ;;;
EndingSequenceSpritemaps_ScrewAttackSymbolLeftWrapFrame1:
    dw $000C
    %spritemapEntry(1, $43D8, $10, 1, 1, 3, 7, $49)
    %spritemapEntry(1, $43E0, $10, 1, 1, 3, 7, $48)
    %spritemapEntry(0, $1F0, $10, 1, 1, 3, 7, $48)
    %spritemapEntry(1, $43F0, $00, 1, 1, 3, 7, $4C)
    %spritemapEntry(1, $43E0, $00, 1, 1, 3, 7, $4E)
    %spritemapEntry(0, $00, $00, 1, 1, 3, 7, $5B)
    %spritemapEntry(0, $1F8, $F8, 1, 1, 3, 7, $6B)
    %spritemapEntry(0, $00, $F8, 1, 1, 3, 7, $6A)
    %spritemapEntry(0, $1D0, $00, 1, 1, 3, 7, $79)
    %spritemapEntry(0, $1D8, $00, 1, 1, 3, 7, $78)
    %spritemapEntry(0, $1D0, $08, 1, 1, 3, 7, $69)
    %spritemapEntry(0, $1D8, $08, 1, 1, 3, 7, $68)


;;; $BB66: Ending screw attack symbol - left wrap frame 2 ;;;
EndingSequenceSpritemaps_ScrewAttackSymbolLeftWrapFrame2:
    dw $0012
    %spritemapEntry(1, $43D8, $10, 1, 1, 3, 7, $49)
    %spritemapEntry(1, $43E0, $10, 1, 1, 3, 7, $48)
    %spritemapEntry(0, $1F0, $10, 1, 1, 3, 7, $48)
    %spritemapEntry(1, $43F0, $00, 1, 1, 3, 7, $4C)
    %spritemapEntry(1, $43E0, $00, 1, 1, 3, 7, $4E)
    %spritemapEntry(0, $00, $00, 1, 1, 3, 7, $5B)
    %spritemapEntry(0, $1F8, $F8, 1, 1, 3, 7, $6B)
    %spritemapEntry(0, $00, $F8, 1, 1, 3, 7, $6A)
    %spritemapEntry(0, $1D0, $00, 1, 1, 3, 7, $79)
    %spritemapEntry(0, $1D8, $00, 1, 1, 3, 7, $78)
    %spritemapEntry(0, $1D0, $08, 1, 1, 3, 7, $69)
    %spritemapEntry(0, $1D8, $08, 1, 1, 3, 7, $68)
    %spritemapEntry(1, $43D0, $D8, 1, 1, 3, 7, $20)
    %spritemapEntry(0, $1E0, $F0, 1, 1, 3, 7, $6C)
    %spritemapEntry(0, $1E0, $F8, 1, 1, 3, 7, $10)
    %spritemapEntry(0, $1E0, $00, 1, 1, 3, 7, $00)
    %spritemapEntry(1, $43D0, $E8, 1, 1, 3, 7, $6D)
    %spritemapEntry(1, $43D0, $F8, 1, 1, 3, 7, $01)


;;; $BBC2: Ending screw attack symbol - left wrap frame 3 ;;;
EndingSequenceSpritemaps_ScrewAttackSymbolLeftWrapFrame3:
    dw $0019
    %spritemapEntry(0, $1F1, $D7, 0, 0, 3, 7, $2C)
    %spritemapEntry(0, $09, $C7, 0, 0, 3, 7, $0F)
    %spritemapEntry(1, $43D9, $C7, 0, 0, 3, 7, $09)
    %spritemapEntry(1, $43F9, $C7, 0, 0, 3, 7, $0D)
    %spritemapEntry(1, $43E9, $C7, 0, 0, 3, 7, $0B)
    %spritemapEntry(0, $1E9, $D7, 0, 0, 3, 7, $2B)
    %spritemapEntry(1, $43D9, $D7, 0, 0, 3, 7, $29)
    %spritemapEntry(1, $43D8, $10, 1, 1, 3, 7, $49)
    %spritemapEntry(1, $43E0, $10, 1, 1, 3, 7, $48)
    %spritemapEntry(0, $1F0, $10, 1, 1, 3, 7, $48)
    %spritemapEntry(1, $43F0, $00, 1, 1, 3, 7, $4C)
    %spritemapEntry(1, $43E0, $00, 1, 1, 3, 7, $4E)
    %spritemapEntry(0, $00, $00, 1, 1, 3, 7, $5B)
    %spritemapEntry(0, $1F8, $F8, 1, 1, 3, 7, $6B)
    %spritemapEntry(0, $00, $F8, 1, 1, 3, 7, $6A)
    %spritemapEntry(0, $1D0, $00, 1, 1, 3, 7, $79)
    %spritemapEntry(0, $1D8, $00, 1, 1, 3, 7, $78)
    %spritemapEntry(0, $1D0, $08, 1, 1, 3, 7, $69)
    %spritemapEntry(0, $1D8, $08, 1, 1, 3, 7, $68)
    %spritemapEntry(1, $43D0, $D8, 1, 1, 3, 7, $20)
    %spritemapEntry(0, $1E0, $F0, 1, 1, 3, 7, $6C)
    %spritemapEntry(0, $1E0, $F8, 1, 1, 3, 7, $10)
    %spritemapEntry(0, $1E0, $00, 1, 1, 3, 7, $00)
    %spritemapEntry(1, $43D0, $E8, 1, 1, 3, 7, $6D)
    %spritemapEntry(1, $43D0, $F8, 1, 1, 3, 7, $01)


;;; $BC41: Critters escape pod (frame 1) ;;;
EndingSequenceSpritemaps_CrittersEscapePodFrame1:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 7, $1E0)


;;; $BC48: Critters escape pod (frame 2) ;;;
EndingSequenceSpritemaps_CrittersEscapePodFrame2:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 7, $1E1)


;;; $BC4F: Critters escape pod (frame 3) ;;;
EndingSequenceSpritemaps_CrittersEscapePodFrame3:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 7, $1E2)


;;; $BC56: Critters escape pod (frame 4) ;;;
EndingSequenceSpritemaps_CrittersEscapePodFrame4:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 7, $1E3)


;;; $BC5D: Title sequence HDMA tables ;;;
TitleSequenceHDMATables:
; Pointer to HDMA tables for colour math subscreen backdrop colour
; Table entries correspond to title sequence zoom level: later entries => more zoomed out (see $198F)
    dw TitleSequenceHDMATables_0
    dw TitleSequenceHDMATables_0
    dw TitleSequenceHDMATables_0
    dw TitleSequenceHDMATables_0
    dw TitleSequenceHDMATables_1
    dw TitleSequenceHDMATables_2
    dw TitleSequenceHDMATables_3
    dw TitleSequenceHDMATables_4
    dw TitleSequenceHDMATables_5
    dw TitleSequenceHDMATables_6
    dw TitleSequenceHDMATables_7
    dw TitleSequenceHDMATables_8
    dw TitleSequenceHDMATables_9
    dw TitleSequenceHDMATables_A
    dw TitleSequenceHDMATables_B
    dw TitleSequenceHDMATables_C

; Colour math subscreen backdrop colour HDMA tables, first 7Ah lines are subtractive, remaining 80h lines are additive, (given here as two separate lines)
TitleSequenceHDMATables_0:
    db $04,$EF,$04,$EE,$04,$ED,$04,$EC,$04,$EB,$04,$EA,$04,$E9,$04,$E8
    db $04,$E7,$04,$E6,$05,$E5,$06,$E4,$08,$E3,$09,$E2,$09,$E1,$33,$E0
    db $04,$C0,$0C,$C1,$0A,$C2,$0A,$C3,$07,$C4,$06,$C5,$05,$C6,$05,$C7
    db $05,$C8,$05,$C9,$06,$CA,$05,$CB,$05,$CC,$05,$CD,$05,$CE,$01,$CF
    db $00,$00

TitleSequenceHDMATables_1:
    db $40,$C0,$40,$C0,$10,$C0,$30,$C1,$28,$C2,$28,$C3,$1C,$C4,$18,$C5
    db $14,$C6,$14,$C7,$14,$C8,$14,$C9,$18,$CA,$14,$CB,$14,$CC,$14,$CD
    db $14,$CE,$04,$CF,$00,$00

TitleSequenceHDMATables_2:
    db $40,$C0,$40,$C0,$0E,$C0,$2A,$C1,$23,$C2,$23,$C3,$19,$C4,$15,$C5
    db $12,$C6,$12,$C7,$12,$C8,$12,$C9,$15,$CA,$12,$CB,$12,$CC,$12,$CD
    db $12,$CE,$04,$CF,$00,$00

TitleSequenceHDMATables_3:
    db $40,$C0,$40,$C0,$0C,$C0,$24,$C1,$1E,$C2,$1E,$C3,$15,$C4,$12,$C5
    db $0F,$C6,$0F,$C7,$0F,$C8,$0F,$C9,$12,$CA,$0F,$CB,$0F,$CC,$0F,$CD
    db $0F,$CE,$03,$CF,$00,$00

TitleSequenceHDMATables_4:
    db $40,$C0,$40,$C0,$0A,$C0,$1E,$C1,$19,$C2,$19,$C3,$12,$C4,$0F,$C5
    db $0D,$C6,$0D,$C7,$0D,$C8,$0D,$C9,$0F,$CA,$0D,$CB,$0D,$CC,$0D,$CD
    db $0D,$CE,$03,$CF,$00,$00

TitleSequenceHDMATables_5:
    db $08,$E2,$12,$E1,$64,$E0,$02,$E0,$08,$C0,$18,$C1,$14,$C2,$14,$C3
    db $0E,$C4,$0C,$C5,$0A,$C6,$0A,$C7,$0A,$C8,$0A,$C9,$0C,$CA,$0A,$CB
    db $0A,$CC,$0A,$CD,$0A,$CE,$02,$CF,$00,$00

TitleSequenceHDMATables_6:
    db $08,$E2,$12,$E1,$64,$E0,$02,$E0,$08,$C0,$17,$C1,$13,$C2,$13,$C3
    db $0E,$C4,$0C,$C5,$0A,$C6,$0A,$C7,$0A,$C8,$0A,$C9,$0C,$CA,$0A,$CB
    db $0A,$CC,$0A,$CD,$0A,$CE,$02,$CF,$00,$00

TitleSequenceHDMATables_7:
    db $06,$E3,$10,$E2,$10,$E1,$5A,$E0,$07,$C0,$15,$C1,$12,$C2,$12,$C3
    db $0D,$C4,$0B,$C5,$09,$C6,$09,$C7,$09,$C8,$09,$C9,$0B,$CA,$09,$CB
    db $09,$CC,$09,$CD,$09,$CE,$02,$CF,$00,$00

TitleSequenceHDMATables_8:
    db $06,$E3,$10,$E2,$10,$E1,$5A,$E0,$07,$C0,$14,$C1,$11,$C2,$11,$C3
    db $0C,$C4,$0A,$C5,$09,$C6,$09,$C7,$09,$C8,$09,$C9,$0A,$CA,$09,$CB
    db $09,$CC,$09,$CD,$09,$CE,$02,$CF,$00,$00

TitleSequenceHDMATables_9:
    db $02,$E5,$09,$E4,$0C,$E3,$0E,$E2,$0E,$E1,$4D,$E0,$06,$C0,$12,$C1
    db $0F,$C2,$0F,$C3,$0B,$C4,$09,$C5,$08,$C6,$08,$C7,$08,$C8,$08,$C9
    db $09,$CA,$08,$CB,$08,$CC,$08,$CD,$08,$CE,$02,$CF,$00,$00

TitleSequenceHDMATables_A:
    db $02,$E5,$09,$E4,$0C,$E3,$0E,$E2,$0E,$E1,$4D,$E0,$06,$C0,$11,$C1
    db $0E,$C2,$0E,$C3,$0A,$C4,$09,$C5,$08,$C6,$08,$C7,$08,$C8,$08,$C9
    db $09,$CA,$08,$CB,$08,$CC,$08,$CD,$08,$CE,$02,$CF,$00,$00

TitleSequenceHDMATables_B:
    db $05,$E8,$05,$E7,$05,$E6,$07,$E5,$08,$E4,$0A,$E3,$0C,$E2,$0C,$E1
    db $40,$E0,$05,$C0,$0F,$C1,$0D,$C2,$0D,$C3,$09,$C4,$08,$C5,$07,$C6
    db $07,$C7,$07,$C8,$07,$C9,$08,$CA,$07,$CB,$07,$CC,$07,$CD,$07,$CE
    db $02,$CF,$00,$00

TitleSequenceHDMATables_C:
    db $05,$E8,$05,$E7,$05,$E6,$07,$E5,$08,$E4,$0A,$E3,$0C,$E2,$0C,$E1
    db $40,$E0,$05,$C0,$0E,$C1,$0C,$C2,$0C,$C3,$08,$C4,$07,$C5,$06,$C6
    db $06,$C7,$06,$C8,$06,$C9,$07,$CA,$06,$CB,$06,$CC,$06,$CD,$06,$CE
    db $02,$CF,$00,$00


;;; $BEC3: Level data - old Mother Brain room from cutscene ;;;
LevelData_OldMotherBrainRoomFromCutscene:
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
    dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
    dw $8000,$8000,$8000,$8000,$8000,$8000,$0000,$0000
    dw $0000,$8000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $8000,$8000,$8000,$8000,$8000,$8000,$0000,$0000
    dw $8000,$8000,$8000,$0000,$0000,$0000,$0000,$0000
    dw $8000,$8000,$8000,$8000,$8000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $8000,$8000,$8000,$8000,$8000,$8000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $8000,$8000,$8000,$8000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $8000,$8000,$8000,$8000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $8000,$8000,$8000,$8000,$0000,$0000,$0000,$0000
    dw $0000,$1000,$0000,$0000,$1000,$1000,$1000,$1000
    dw $8000,$8000,$8000,$8000,$8000,$8000,$0000,$0000
    dw $0000,$8000,$0000,$0000,$8000,$8000,$8000,$8000
    dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$0000
    dw $0000,$8000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$0000
    dw $0000,$8000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$0000
    dw $0000,$8000,$8000,$0000,$0000,$0000,$0000,$0000
    dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
    dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000


;;; $C083: Level data - room with Baby Metroid hatching from cutscene ;;;
LevelData_RoomWithBabyMetroidHatchingFromCutscene:
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
    dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
    dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
    dw $1000,$1000,$1000,$1000,$1000,$1000,$1000,$1000
    dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
    dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
    dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000
    dw $8000,$8000,$8000,$8000,$8000,$8000,$8000,$8000


;;; $C383: Intro text - page 1 ;;;
CinematicBGObjectInstLists_IntroTextPage1:
; I FIRST BATTLED THE METROIDS
; ON PLANET ZEBES. IT WAS THERE
; THAT I FOILED THE PLANS OF
; THE SPACE PIRATE LEADER
; MOTHER BRAIN TO USE THE
; CREATURES TO ATTACK
; GALACTIC CIVILIZATION...
    dw Instruction_HandleCreatingJapanText_Page1
    dw $0001
    db $01,$01
    dw IndirectInstructions_IntroText_Nothing
    dw $0005
    db $01,$04
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $02,$04
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $03,$04
    dw IndirectInstructions_IntroText_F                                  ; "F"
    dw $0005
    db $04,$04
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $05,$04
    dw IndirectInstructions_IntroText_R                                  ; "R"
    dw $0005
    db $06,$04
    dw IndirectInstructions_IntroText_S                                  ; "S"
    dw $0005
    db $07,$04
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $08,$04
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $09,$04
    dw IndirectInstructions_IntroText_B                                  ; "B"
    dw $0005
    db $0A,$04
    dw IndirectInstructions_IntroText_A                                  ; "A"
    dw $0005
    db $0B,$04
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $0C,$04
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $0D,$04
    dw IndirectInstructions_IntroText_L                                  ; "L"
    dw $0005
    db $0E,$04
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $0F,$04
    dw IndirectInstructions_IntroText_D                                  ; "D"
    dw $0005
    db $10,$04
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $11,$04
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $12,$04
    dw IndirectInstructions_IntroText_H                                  ; "H"
    dw $0005
    db $13,$04
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $14,$04
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $15,$04
    dw IndirectInstructions_IntroText_M                                  ; "M"
    dw $0005
    db $16,$04
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $17,$04
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $18,$04
    dw IndirectInstructions_IntroText_R                                  ; "R"
    dw $0005
    db $19,$04
    dw IndirectInstructions_IntroText_O                                  ; "O"
    dw $0005
    db $1A,$04
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $1B,$04
    dw IndirectInstructions_IntroText_D                                  ; "D"
    dw $0005
    db $1C,$04
    dw IndirectInstructions_IntroText_S                                  ; "S"
    dw $0005
    db $01,$06
    dw IndirectInstructions_IntroText_O                                  ; "O"
    dw $0005
    db $02,$06
    dw IndirectInstructions_IntroText_N                                  ; "N"
    dw $0005
    db $03,$06
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $04,$06
    dw IndirectInstructions_IntroText_P                                  ; "P"
    dw $0005
    db $05,$06
    dw IndirectInstructions_IntroText_L                                  ; "L"
    dw $0005
    db $06,$06
    dw IndirectInstructions_IntroText_A                                  ; "A"
    dw $0005
    db $07,$06
    dw IndirectInstructions_IntroText_N                                  ; "N"
    dw $0005
    db $08,$06
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $09,$06
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $0A,$06
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $0B,$06
    dw IndirectInstructions_IntroText_Z                                  ; "Z"
    dw $0005
    db $0C,$06
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $0D,$06
    dw IndirectInstructions_IntroText_B                                  ; "B"
    dw $0005
    db $0E,$06
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $0F,$06
    dw IndirectInstructions_IntroText_S                                  ; "S"
    dw $0005
    db $10,$06
    dw IndirectInstructions_IntroText_Period                             ; "."
    dw $0005
    db $11,$06
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $12,$06
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $13,$06
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $14,$06
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $15,$06
    dw IndirectInstructions_IntroText_W                                  ; "W"
    dw $0005
    db $16,$06
    dw IndirectInstructions_IntroText_A                                  ; "A"
    dw $0005
    db $17,$06
    dw IndirectInstructions_IntroText_S                                  ; "S"
    dw $0005
    db $18,$06
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $19,$06
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $1A,$06
    dw IndirectInstructions_IntroText_H                                  ; "H"
    dw $0005
    db $1B,$06
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $1C,$06
    dw IndirectInstructions_IntroText_R                                  ; "R"
    dw $0005
    db $1D,$06
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $01,$08
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $02,$08
    dw IndirectInstructions_IntroText_H                                  ; "H"
    dw $0005
    db $03,$08
    dw IndirectInstructions_IntroText_A                                  ; "A"
    dw $0005
    db $04,$08
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $05,$08
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $06,$08
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $07,$08
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $08,$08
    dw IndirectInstructions_IntroText_F                                  ; "F"
    dw $0005
    db $09,$08
    dw IndirectInstructions_IntroText_O                                  ; "O"
    dw $0005
    db $0A,$08
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $0B,$08
    dw IndirectInstructions_IntroText_L                                  ; "L"
    dw $0005
    db $0C,$08
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $0D,$08
    dw IndirectInstructions_IntroText_D                                  ; "D"
    dw $0005
    db $0E,$08
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $0F,$08
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $10,$08
    dw IndirectInstructions_IntroText_H                                  ; "H"
    dw $0005
    db $11,$08
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $12,$08
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $13,$08
    dw IndirectInstructions_IntroText_P                                  ; "P"
    dw $0005
    db $14,$08
    dw IndirectInstructions_IntroText_L                                  ; "L"
    dw $0005
    db $15,$08
    dw IndirectInstructions_IntroText_A                                  ; "A"
    dw $0005
    db $16,$08
    dw IndirectInstructions_IntroText_N                                  ; "N"
    dw $0005
    db $17,$08
    dw IndirectInstructions_IntroText_S                                  ; "S"
    dw $0005
    db $18,$08
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $19,$08
    dw IndirectInstructions_IntroText_O                                  ; "O"
    dw $0005
    db $1A,$08
    dw IndirectInstructions_IntroText_F                                  ; "F"
    dw $0005
    db $01,$0A
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $02,$0A
    dw IndirectInstructions_IntroText_H                                  ; "H"
    dw $0005
    db $03,$0A
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $04,$0A
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $05,$0A
    dw IndirectInstructions_IntroText_S                                  ; "S"
    dw $0005
    db $06,$0A
    dw IndirectInstructions_IntroText_P                                  ; "P"
    dw $0005
    db $07,$0A
    dw IndirectInstructions_IntroText_A                                  ; "A"
    dw $0005
    db $08,$0A
    dw IndirectInstructions_IntroText_C                                  ; "C"
    dw $0005
    db $09,$0A
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $0A,$0A
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $0B,$0A
    dw IndirectInstructions_IntroText_P                                  ; "P"
    dw $0005
    db $0C,$0A
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $0D,$0A
    dw IndirectInstructions_IntroText_R                                  ; "R"
    dw $0005
    db $0E,$0A
    dw IndirectInstructions_IntroText_A                                  ; "A"
    dw $0005
    db $0F,$0A
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $10,$0A
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $11,$0A
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $12,$0A
    dw IndirectInstructions_IntroText_L                                  ; "L"
    dw $0005
    db $13,$0A
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $14,$0A
    dw IndirectInstructions_IntroText_A                                  ; "A"
    dw $0005
    db $15,$0A
    dw IndirectInstructions_IntroText_D                                  ; "D"
    dw $0005
    db $16,$0A
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $17,$0A
    dw IndirectInstructions_IntroText_R                                  ; "R"
    dw $0005
    db $01,$0C
    dw IndirectInstructions_IntroText_M                                  ; "M"
    dw $0005
    db $02,$0C
    dw IndirectInstructions_IntroText_O                                  ; "O"
    dw $0005
    db $03,$0C
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $04,$0C
    dw IndirectInstructions_IntroText_H                                  ; "H"
    dw $0005
    db $05,$0C
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $06,$0C
    dw IndirectInstructions_IntroText_R                                  ; "R"
    dw $0005
    db $07,$0C
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $08,$0C
    dw IndirectInstructions_IntroText_B                                  ; "B"
    dw $0005
    db $09,$0C
    dw IndirectInstructions_IntroText_R                                  ; "R"
    dw $0005
    db $0A,$0C
    dw IndirectInstructions_IntroText_A                                  ; "A"
    dw $0005
    db $0B,$0C
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $0C,$0C
    dw IndirectInstructions_IntroText_N                                  ; "N"
    dw $0005
    db $0D,$0C
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $0E,$0C
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $0F,$0C
    dw IndirectInstructions_IntroText_O                                  ; "O"
    dw $0005
    db $10,$0C
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $11,$0C
    dw IndirectInstructions_IntroText_U                                  ; "U"
    dw $0005
    db $12,$0C
    dw IndirectInstructions_IntroText_S                                  ; "S"
    dw $0005
    db $13,$0C
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $14,$0C
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $15,$0C
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $16,$0C
    dw IndirectInstructions_IntroText_H                                  ; "H"
    dw $0005
    db $17,$0C
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $01,$0E
    dw IndirectInstructions_IntroText_C                                  ; "C"
    dw $0005
    db $02,$0E
    dw IndirectInstructions_IntroText_R                                  ; "R"
    dw $0005
    db $03,$0E
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $04,$0E
    dw IndirectInstructions_IntroText_A                                  ; "A"
    dw $0005
    db $05,$0E
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $06,$0E
    dw IndirectInstructions_IntroText_U                                  ; "U"
    dw $0005
    db $07,$0E
    dw IndirectInstructions_IntroText_R                                  ; "R"
    dw $0005
    db $08,$0E
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $09,$0E
    dw IndirectInstructions_IntroText_S                                  ; "S"
    dw $0005
    db $0A,$0E
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $0B,$0E
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $0C,$0E
    dw IndirectInstructions_IntroText_O                                  ; "O"
    dw $0005
    db $0D,$0E
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $0E,$0E
    dw IndirectInstructions_IntroText_A                                  ; "A"
    dw $0005
    db $0F,$0E
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $10,$0E
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $11,$0E
    dw IndirectInstructions_IntroText_A                                  ; "A"
    dw $0005
    db $12,$0E
    dw IndirectInstructions_IntroText_C                                  ; "C"
    dw $0005
    db $13,$0E
    dw IndirectInstructions_IntroText_K                                  ; "K"
    dw $0005
    db $01,$10
    dw IndirectInstructions_IntroText_G                                  ; "G"
    dw $0005
    db $02,$10
    dw IndirectInstructions_IntroText_A                                  ; "A"
    dw $0005
    db $03,$10
    dw IndirectInstructions_IntroText_L                                  ; "L"
    dw $0005
    db $04,$10
    dw IndirectInstructions_IntroText_A                                  ; "A"
    dw $0005
    db $05,$10
    dw IndirectInstructions_IntroText_C                                  ; "C"
    dw $0005
    db $06,$10
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $07,$10
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $08,$10
    dw IndirectInstructions_IntroText_C                                  ; "C"
    dw $0005
    db $09,$10
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $0A,$10
    dw IndirectInstructions_IntroText_C                                  ; "C"
    dw $0005
    db $0B,$10
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $0C,$10
    dw IndirectInstructions_IntroText_V                                  ; "V"
    dw $0005
    db $0D,$10
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $0E,$10
    dw IndirectInstructions_IntroText_L                                  ; "L"
    dw $0005
    db $0F,$10
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $10,$10
    dw IndirectInstructions_IntroText_Z                                  ; "Z"
    dw $0005
    db $11,$10
    dw IndirectInstructions_IntroText_A                                  ; "A"
    dw $0005
    db $12,$10
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $13,$10
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $14,$10
    dw IndirectInstructions_IntroText_O                                  ; "O"
    dw $0005
    db $15,$10
    dw IndirectInstructions_IntroText_N                                  ; "N"
    dw $0005
    db $16,$10
    dw IndirectInstructions_IntroText_Period                             ; "."
    dw $0005
    db $17,$10
    dw IndirectInstructions_IntroText_Period                             ; "."
    dw $0005
    db $18,$10
    dw IndirectInstructions_IntroText_Period                             ; "."
    dw Instruction_SpawnBlinkingMarkers_WaitForInput_Page1
    dw CinematicBGObject_Instruction_Delete


;;; $C797: Intro text - page 2 ;;;
CinematicBGObjectInstLists_IntroTextPage2:
; I NEXT FOUGHT THE METROIDS ON
; THEIR HOMEWORLD, SR388. I
; COMPLETELY ERADICATED THEM
; EXCEPT FOR A LARVA, WHICH
; AFTER HATCHING FOLLOWED ME
; LIKE A CONFUSED CHILD...
    dw Instruction_HandleCreatingJapanText_Page2
    dw $0001
    db $01,$01
    dw IndirectInstructions_IntroText_Nothing
    dw $0005
    db $01,$04
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $02,$04
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $03,$04
    dw IndirectInstructions_IntroText_N                                  ; "N"
    dw $0005
    db $04,$04
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $05,$04
    dw IndirectInstructions_IntroText_X                                  ; "X"
    dw $0005
    db $06,$04
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $07,$04
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $08,$04
    dw IndirectInstructions_IntroText_F                                  ; "F"
    dw $0005
    db $09,$04
    dw IndirectInstructions_IntroText_O                                  ; "O"
    dw $0005
    db $0A,$04
    dw IndirectInstructions_IntroText_U                                  ; "U"
    dw $0005
    db $0B,$04
    dw IndirectInstructions_IntroText_G                                  ; "G"
    dw $0005
    db $0C,$04
    dw IndirectInstructions_IntroText_H                                  ; "H"
    dw $0005
    db $0D,$04
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $0E,$04
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $0F,$04
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $10,$04
    dw IndirectInstructions_IntroText_H                                  ; "H"
    dw $0005
    db $11,$04
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $12,$04
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $13,$04
    dw IndirectInstructions_IntroText_M                                  ; "M"
    dw $0005
    db $14,$04
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $15,$04
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $16,$04
    dw IndirectInstructions_IntroText_R                                  ; "R"
    dw $0005
    db $17,$04
    dw IndirectInstructions_IntroText_O                                  ; "O"
    dw $0005
    db $18,$04
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $19,$04
    dw IndirectInstructions_IntroText_D                                  ; "D"
    dw $0005
    db $1A,$04
    dw IndirectInstructions_IntroText_S                                  ; "S"
    dw $0005
    db $1B,$04
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $1C,$04
    dw IndirectInstructions_IntroText_O                                  ; "O"
    dw $0005
    db $1D,$04
    dw IndirectInstructions_IntroText_N                                  ; "N"
    dw $0005
    db $01,$06
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $02,$06
    dw IndirectInstructions_IntroText_H                                  ; "H"
    dw $0005
    db $03,$06
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $04,$06
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $05,$06
    dw IndirectInstructions_IntroText_R                                  ; "R"
    dw $0005
    db $06,$06
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $07,$06
    dw IndirectInstructions_IntroText_H                                  ; "H"
    dw $0005
    db $08,$06
    dw IndirectInstructions_IntroText_O                                  ; "O"
    dw $0005
    db $09,$06
    dw IndirectInstructions_IntroText_M                                  ; "M"
    dw $0005
    db $0A,$06
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $0B,$06
    dw IndirectInstructions_IntroText_W                                  ; "W"
    dw $0005
    db $0C,$06
    dw IndirectInstructions_IntroText_O                                  ; "O"
    dw $0005
    db $0D,$06
    dw IndirectInstructions_IntroText_R                                  ; "R"
    dw $0005
    db $0E,$06
    dw IndirectInstructions_IntroText_L                                  ; "L"
    dw $0005
    db $0F,$06
    dw IndirectInstructions_IntroText_D                                  ; "D"
    dw $0005
    db $10,$06
    dw IndirectInstructions_IntroText_Comma                              ; ","
    dw $0005
    db $11,$06
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $12,$06
    dw IndirectInstructions_IntroText_S                                  ; "S"
    dw $0005
    db $13,$06
    dw IndirectInstructions_IntroText_R                                  ; "R"
    dw $0005
    db $14,$06
    dw IndirectInstructions_IntroText_3                                  ; "3"
    dw $0005
    db $15,$06
    dw IndirectInstructions_IntroText_8                                  ; "8"
    dw $0005
    db $16,$06
    dw IndirectInstructions_IntroText_8                                  ; "8"
    dw $0005
    db $17,$06
    dw IndirectInstructions_IntroText_Period                             ; "."
    dw $0005
    db $18,$06
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $19,$06
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $01,$08
    dw IndirectInstructions_IntroText_C                                  ; "C"
    dw $0005
    db $02,$08
    dw IndirectInstructions_IntroText_O                                  ; "O"
    dw $0005
    db $03,$08
    dw IndirectInstructions_IntroText_M                                  ; "M"
    dw $0005
    db $04,$08
    dw IndirectInstructions_IntroText_P                                  ; "P"
    dw $0005
    db $05,$08
    dw IndirectInstructions_IntroText_L                                  ; "L"
    dw $0005
    db $06,$08
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $07,$08
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $08,$08
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $09,$08
    dw IndirectInstructions_IntroText_L                                  ; "L"
    dw $0005
    db $0A,$08
    dw IndirectInstructions_IntroText_Y                                  ; "Y"
    dw $0005
    db $0B,$08
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $0C,$08
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $0D,$08
    dw IndirectInstructions_IntroText_R                                  ; "R"
    dw $0005
    db $0E,$08
    dw IndirectInstructions_IntroText_A                                  ; "A"
    dw $0005
    db $0F,$08
    dw IndirectInstructions_IntroText_D                                  ; "D"
    dw $0005
    db $10,$08
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $11,$08
    dw IndirectInstructions_IntroText_C                                  ; "C"
    dw $0005
    db $12,$08
    dw IndirectInstructions_IntroText_A                                  ; "A"
    dw $0005
    db $13,$08
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $14,$08
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $15,$08
    dw IndirectInstructions_IntroText_D                                  ; "D"
    dw $0005
    db $16,$08
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $17,$08
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $18,$08
    dw IndirectInstructions_IntroText_H                                  ; "H"
    dw $0005
    db $19,$08
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $1A,$08
    dw IndirectInstructions_IntroText_M                                  ; "M"
    dw $0005
    db $01,$0A
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $02,$0A
    dw IndirectInstructions_IntroText_X                                  ; "X"
    dw $0005
    db $03,$0A
    dw IndirectInstructions_IntroText_C                                  ; "C"
    dw $0005
    db $04,$0A
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $05,$0A
    dw IndirectInstructions_IntroText_P                                  ; "P"
    dw $0005
    db $06,$0A
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $07,$0A
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $08,$0A
    dw IndirectInstructions_IntroText_F                                  ; "F"
    dw $0005
    db $09,$0A
    dw IndirectInstructions_IntroText_O                                  ; "O"
    dw $0005
    db $0A,$0A
    dw IndirectInstructions_IntroText_R                                  ; "R"
    dw $0005
    db $0B,$0A
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $0C,$0A
    dw IndirectInstructions_IntroText_A                                  ; "A"
    dw $0005
    db $0D,$0A
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $0E,$0A
    dw IndirectInstructions_IntroText_L                                  ; "L"
    dw $0005
    db $0F,$0A
    dw IndirectInstructions_IntroText_A                                  ; "A"
    dw $0005
    db $10,$0A
    dw IndirectInstructions_IntroText_R                                  ; "R"
    dw $0005
    db $11,$0A
    dw IndirectInstructions_IntroText_V                                  ; "V"
    dw $0005
    db $12,$0A
    dw IndirectInstructions_IntroText_A                                  ; "A"
    dw $0005
    db $13,$0A
    dw IndirectInstructions_IntroText_Comma                              ; ","
    dw $0005
    db $14,$0A
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $15,$0A
    dw IndirectInstructions_IntroText_W                                  ; "W"
    dw $0005
    db $16,$0A
    dw IndirectInstructions_IntroText_H                                  ; "H"
    dw $0005
    db $17,$0A
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $18,$0A
    dw IndirectInstructions_IntroText_C                                  ; "C"
    dw $0005
    db $19,$0A
    dw IndirectInstructions_IntroText_H                                  ; "H"
    dw $0005
    db $01,$0C
    dw IndirectInstructions_IntroText_A                                  ; "A"
    dw $0005
    db $02,$0C
    dw IndirectInstructions_IntroText_F                                  ; "F"
    dw $0005
    db $03,$0C
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $04,$0C
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $05,$0C
    dw IndirectInstructions_IntroText_R                                  ; "R"
    dw $0005
    db $06,$0C
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $07,$0C
    dw IndirectInstructions_IntroText_H                                  ; "H"
    dw $0005
    db $08,$0C
    dw IndirectInstructions_IntroText_A                                  ; "A"
    dw $0005
    db $09,$0C
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $0A,$0C
    dw IndirectInstructions_IntroText_C                                  ; "C"
    dw $0005
    db $0B,$0C
    dw IndirectInstructions_IntroText_H                                  ; "H"
    dw $0005
    db $0C,$0C
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $0D,$0C
    dw IndirectInstructions_IntroText_N                                  ; "N"
    dw $0005
    db $0E,$0C
    dw IndirectInstructions_IntroText_G                                  ; "G"
    dw $0005
    db $0F,$0C
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $10,$0C
    dw IndirectInstructions_IntroText_F                                  ; "F"
    dw $0005
    db $11,$0C
    dw IndirectInstructions_IntroText_O                                  ; "O"
    dw $0005
    db $12,$0C
    dw IndirectInstructions_IntroText_L                                  ; "L"
    dw $0005
    db $13,$0C
    dw IndirectInstructions_IntroText_L                                  ; "L"
    dw $0005
    db $14,$0C
    dw IndirectInstructions_IntroText_O                                  ; "O"
    dw $0005
    db $15,$0C
    dw IndirectInstructions_IntroText_W                                  ; "W"
    dw $0005
    db $16,$0C
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $17,$0C
    dw IndirectInstructions_IntroText_D                                  ; "D"
    dw $0005
    db $18,$0C
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $19,$0C
    dw IndirectInstructions_IntroText_M                                  ; "M"
    dw $0005
    db $1A,$0C
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $01,$0E
    dw IndirectInstructions_IntroText_L                                  ; "L"
    dw $0005
    db $02,$0E
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $03,$0E
    dw IndirectInstructions_IntroText_K                                  ; "K"
    dw $0005
    db $04,$0E
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $05,$0E
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $06,$0E
    dw IndirectInstructions_IntroText_A                                  ; "A"
    dw $0005
    db $07,$0E
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $08,$0E
    dw IndirectInstructions_IntroText_C                                  ; "C"
    dw $0005
    db $09,$0E
    dw IndirectInstructions_IntroText_O                                  ; "O"
    dw $0005
    db $0A,$0E
    dw IndirectInstructions_IntroText_N                                  ; "N"
    dw $0005
    db $0B,$0E
    dw IndirectInstructions_IntroText_F                                  ; "F"
    dw $0005
    db $0C,$0E
    dw IndirectInstructions_IntroText_U                                  ; "U"
    dw $0005
    db $0D,$0E
    dw IndirectInstructions_IntroText_S                                  ; "S"
    dw $0005
    db $0E,$0E
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $0F,$0E
    dw IndirectInstructions_IntroText_D                                  ; "D"
    dw $0005
    db $10,$0E
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $11,$0E
    dw IndirectInstructions_IntroText_C                                  ; "C"
    dw $0005
    db $12,$0E
    dw IndirectInstructions_IntroText_H                                  ; "H"
    dw $0005
    db $13,$0E
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $14,$0E
    dw IndirectInstructions_IntroText_L                                  ; "L"
    dw $0005
    db $15,$0E
    dw IndirectInstructions_IntroText_D                                  ; "D"
    dw $0005
    db $16,$0E
    dw IndirectInstructions_IntroText_Period                             ; "."
    dw $0005
    db $17,$0E
    dw IndirectInstructions_IntroText_Period                             ; "."
    dw $0005
    db $18,$0E
    dw IndirectInstructions_IntroText_Period                             ; "."
    dw Instruction_SpawnBlinkingMarkers_WaitForInput_Page2
    dw CinematicBGObject_Instruction_Delete


;;; $CB45: Intro text - page 3 ;;;
CinematicBGObjectInstLists_IntroTextPage3:
; I PERSONALLY DELIVERED IT TO
; THE GALACTIC RESEARCH STATION
; AT CERES SO SCIENTISTS COULD
; STUDY ITS ENERGY PRODUCING
; QUALITIES...
    dw Instruction_HandleCreatingJapanText_Page3
    dw $0001
    db $01,$01
    dw IndirectInstructions_IntroText_Nothing
    dw $0005
    db $01,$04
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $02,$04
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $03,$04
    dw IndirectInstructions_IntroText_P                                  ; "P"
    dw $0005
    db $04,$04
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $05,$04
    dw IndirectInstructions_IntroText_R                                  ; "R"
    dw $0005
    db $06,$04
    dw IndirectInstructions_IntroText_S                                  ; "S"
    dw $0005
    db $07,$04
    dw IndirectInstructions_IntroText_O                                  ; "O"
    dw $0005
    db $08,$04
    dw IndirectInstructions_IntroText_N                                  ; "N"
    dw $0005
    db $09,$04
    dw IndirectInstructions_IntroText_A                                  ; "A"
    dw $0005
    db $0A,$04
    dw IndirectInstructions_IntroText_L                                  ; "L"
    dw $0005
    db $0B,$04
    dw IndirectInstructions_IntroText_L                                  ; "L"
    dw $0005
    db $0C,$04
    dw IndirectInstructions_IntroText_Y                                  ; "Y"
    dw $0005
    db $0D,$04
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $0E,$04
    dw IndirectInstructions_IntroText_D                                  ; "D"
    dw $0005
    db $0F,$04
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $10,$04
    dw IndirectInstructions_IntroText_L                                  ; "L"
    dw $0005
    db $11,$04
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $12,$04
    dw IndirectInstructions_IntroText_V                                  ; "V"
    dw $0005
    db $13,$04
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $14,$04
    dw IndirectInstructions_IntroText_R                                  ; "R"
    dw $0005
    db $15,$04
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $16,$04
    dw IndirectInstructions_IntroText_D                                  ; "D"
    dw $0005
    db $17,$04
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $18,$04
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $19,$04
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $1A,$04
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $1B,$04
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $1C,$04
    dw IndirectInstructions_IntroText_O                                  ; "O"
    dw $0005
    db $01,$06
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $02,$06
    dw IndirectInstructions_IntroText_H                                  ; "H"
    dw $0005
    db $03,$06
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $04,$06
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $05,$06
    dw IndirectInstructions_IntroText_G                                  ; "G"
    dw $0005
    db $06,$06
    dw IndirectInstructions_IntroText_A                                  ; "A"
    dw $0005
    db $07,$06
    dw IndirectInstructions_IntroText_L                                  ; "L"
    dw $0005
    db $08,$06
    dw IndirectInstructions_IntroText_A                                  ; "A"
    dw $0005
    db $09,$06
    dw IndirectInstructions_IntroText_C                                  ; "C"
    dw $0005
    db $0A,$06
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $0B,$06
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $0C,$06
    dw IndirectInstructions_IntroText_C                                  ; "C"
    dw $0005
    db $0D,$06
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $0E,$06
    dw IndirectInstructions_IntroText_R                                  ; "R"
    dw $0005
    db $0F,$06
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $10,$06
    dw IndirectInstructions_IntroText_S                                  ; "S"
    dw $0005
    db $11,$06
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $12,$06
    dw IndirectInstructions_IntroText_A                                  ; "A"
    dw $0005
    db $13,$06
    dw IndirectInstructions_IntroText_R                                  ; "R"
    dw $0005
    db $14,$06
    dw IndirectInstructions_IntroText_C                                  ; "C"
    dw $0005
    db $15,$06
    dw IndirectInstructions_IntroText_H                                  ; "H"
    dw $0005
    db $16,$06
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $17,$06
    dw IndirectInstructions_IntroText_S                                  ; "S"
    dw $0005
    db $18,$06
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $19,$06
    dw IndirectInstructions_IntroText_A                                  ; "A"
    dw $0005
    db $1A,$06
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $1B,$06
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $1C,$06
    dw IndirectInstructions_IntroText_O                                  ; "O"
    dw $0005
    db $1D,$06
    dw IndirectInstructions_IntroText_N                                  ; "N"
    dw $0005
    db $01,$08
    dw IndirectInstructions_IntroText_A                                  ; "A"
    dw $0005
    db $02,$08
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $03,$08
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $04,$08
    dw IndirectInstructions_IntroText_C                                  ; "C"
    dw $0005
    db $05,$08
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $06,$08
    dw IndirectInstructions_IntroText_R                                  ; "R"
    dw $0005
    db $07,$08
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $08,$08
    dw IndirectInstructions_IntroText_S                                  ; "S"
    dw $0005
    db $09,$08
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $0A,$08
    dw IndirectInstructions_IntroText_S                                  ; "S"
    dw $0005
    db $0B,$08
    dw IndirectInstructions_IntroText_O                                  ; "O"
    dw $0005
    db $0C,$08
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $0D,$08
    dw IndirectInstructions_IntroText_S                                  ; "S"
    dw $0005
    db $0E,$08
    dw IndirectInstructions_IntroText_C                                  ; "C"
    dw $0005
    db $0F,$08
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $10,$08
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $11,$08
    dw IndirectInstructions_IntroText_N                                  ; "N"
    dw $0005
    db $12,$08
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $13,$08
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $14,$08
    dw IndirectInstructions_IntroText_S                                  ; "S"
    dw $0005
    db $15,$08
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $16,$08
    dw IndirectInstructions_IntroText_S                                  ; "S"
    dw $0005
    db $17,$08
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $18,$08
    dw IndirectInstructions_IntroText_C                                  ; "C"
    dw $0005
    db $19,$08
    dw IndirectInstructions_IntroText_O                                  ; "O"
    dw $0005
    db $1A,$08
    dw IndirectInstructions_IntroText_U                                  ; "U"
    dw $0005
    db $1B,$08
    dw IndirectInstructions_IntroText_L                                  ; "L"
    dw $0005
    db $1C,$08
    dw IndirectInstructions_IntroText_D                                  ; "D"
    dw $0005
    db $01,$0A
    dw IndirectInstructions_IntroText_S                                  ; "S"
    dw $0005
    db $02,$0A
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $03,$0A
    dw IndirectInstructions_IntroText_U                                  ; "U"
    dw $0005
    db $04,$0A
    dw IndirectInstructions_IntroText_D                                  ; "D"
    dw $0005
    db $05,$0A
    dw IndirectInstructions_IntroText_Y                                  ; "Y"
    dw $0005
    db $06,$0A
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $07,$0A
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $08,$0A
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $09,$0A
    dw IndirectInstructions_IntroText_S                                  ; "S"
    dw $0005
    db $0A,$0A
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $0B,$0A
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $0C,$0A
    dw IndirectInstructions_IntroText_N                                  ; "N"
    dw $0005
    db $0D,$0A
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $0E,$0A
    dw IndirectInstructions_IntroText_R                                  ; "R"
    dw $0005
    db $0F,$0A
    dw IndirectInstructions_IntroText_G                                  ; "G"
    dw $0005
    db $10,$0A
    dw IndirectInstructions_IntroText_Y                                  ; "Y"
    dw $0005
    db $11,$0A
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $12,$0A
    dw IndirectInstructions_IntroText_P                                  ; "P"
    dw $0005
    db $13,$0A
    dw IndirectInstructions_IntroText_R                                  ; "R"
    dw $0005
    db $14,$0A
    dw IndirectInstructions_IntroText_O                                  ; "O"
    dw $0005
    db $15,$0A
    dw IndirectInstructions_IntroText_D                                  ; "D"
    dw $0005
    db $16,$0A
    dw IndirectInstructions_IntroText_U                                  ; "U"
    dw $0005
    db $17,$0A
    dw IndirectInstructions_IntroText_C                                  ; "C"
    dw $0005
    db $18,$0A
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $19,$0A
    dw IndirectInstructions_IntroText_N                                  ; "N"
    dw $0005
    db $1A,$0A
    dw IndirectInstructions_IntroText_G                                  ; "G"
    dw $0005
    db $01,$0C
    dw IndirectInstructions_IntroText_Q                                  ; "Q"
    dw $0005
    db $02,$0C
    dw IndirectInstructions_IntroText_U                                  ; "U"
    dw $0005
    db $03,$0C
    dw IndirectInstructions_IntroText_A                                  ; "A"
    dw $0005
    db $04,$0C
    dw IndirectInstructions_IntroText_L                                  ; "L"
    dw $0005
    db $05,$0C
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $06,$0C
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $07,$0C
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $08,$0C
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $09,$0C
    dw IndirectInstructions_IntroText_S                                  ; "S"
    dw $0005
    db $0A,$0C
    dw IndirectInstructions_IntroText_Period                             ; "."
    dw $0005
    db $0B,$0C
    dw IndirectInstructions_IntroText_Period                             ; "."
    dw $0005
    db $0C,$0C
    dw IndirectInstructions_IntroText_Period                             ; "."
    dw Instruction_SpawnBlinkingMarkers_WaitForInput_Page3
    dw CinematicBGObject_Instruction_Delete


;;; $CE33: Intro text - page 4 ;;;
CinematicBGObjectInstLists_IntroTextPage4:
; THE SCIENTISTS' FINDINGS WERE
; ASTOUNDING! THEY DISCOVERED
; THAT THE POWERS OF THE
; METROID MIGHT BE HARNESSED
; FOR THE GOOD OF CIVILIZATION!
    dw Instruction_HandleCreatingJapanText_Page4
    dw $0001
    db $01,$01
    dw IndirectInstructions_IntroText_Nothing
    dw $0005
    db $01,$04
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $02,$04
    dw IndirectInstructions_IntroText_H                                  ; "H"
    dw $0005
    db $03,$04
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $04,$04
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $05,$04
    dw IndirectInstructions_IntroText_S                                  ; "S"
    dw $0005
    db $06,$04
    dw IndirectInstructions_IntroText_C                                  ; "C"
    dw $0005
    db $07,$04
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $08,$04
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $09,$04
    dw IndirectInstructions_IntroText_N                                  ; "N"
    dw $0005
    db $0A,$04
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $0B,$04
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $0C,$04
    dw IndirectInstructions_IntroText_S                                  ; "S"
    dw $0005
    db $0D,$04
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $0E,$04
    dw IndirectInstructions_IntroText_S                                  ; "S"
    dw $0005
    db $0F,$04
    dw IndirectInstructions_IntroText_Apostrophe                         ; "'"
    dw $0005
    db $10,$04
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $11,$04
    dw IndirectInstructions_IntroText_F                                  ; "F"
    dw $0005
    db $12,$04
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $13,$04
    dw IndirectInstructions_IntroText_N                                  ; "N"
    dw $0005
    db $14,$04
    dw IndirectInstructions_IntroText_D                                  ; "D"
    dw $0005
    db $15,$04
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $16,$04
    dw IndirectInstructions_IntroText_N                                  ; "N"
    dw $0005
    db $17,$04
    dw IndirectInstructions_IntroText_G                                  ; "G"
    dw $0005
    db $18,$04
    dw IndirectInstructions_IntroText_S                                  ; "S"
    dw $0005
    db $19,$04
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $1A,$04
    dw IndirectInstructions_IntroText_W                                  ; "W"
    dw $0005
    db $1B,$04
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $1C,$04
    dw IndirectInstructions_IntroText_R                                  ; "R"
    dw $0005
    db $1D,$04
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $01,$06
    dw IndirectInstructions_IntroText_A                                  ; "A"
    dw $0005
    db $02,$06
    dw IndirectInstructions_IntroText_S                                  ; "S"
    dw $0005
    db $03,$06
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $04,$06
    dw IndirectInstructions_IntroText_O                                  ; "O"
    dw $0005
    db $05,$06
    dw IndirectInstructions_IntroText_U                                  ; "U"
    dw $0005
    db $06,$06
    dw IndirectInstructions_IntroText_N                                  ; "N"
    dw $0005
    db $07,$06
    dw IndirectInstructions_IntroText_D                                  ; "D"
    dw $0005
    db $08,$06
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $09,$06
    dw IndirectInstructions_IntroText_N                                  ; "N"
    dw $0005
    db $0A,$06
    dw IndirectInstructions_IntroText_G                                  ; "G"
    dw $0005
    db $0B,$06
    dw IndirectInstructions_IntroText_ExclamationPoint                   ; "!"
    dw $0005
    db $0C,$06
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $0D,$06
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $0E,$06
    dw IndirectInstructions_IntroText_H                                  ; "H"
    dw $0005
    db $0F,$06
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $10,$06
    dw IndirectInstructions_IntroText_Y                                  ; "Y"
    dw $0005
    db $11,$06
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $12,$06
    dw IndirectInstructions_IntroText_D                                  ; "D"
    dw $0005
    db $13,$06
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $14,$06
    dw IndirectInstructions_IntroText_S                                  ; "S"
    dw $0005
    db $15,$06
    dw IndirectInstructions_IntroText_C                                  ; "C"
    dw $0005
    db $16,$06
    dw IndirectInstructions_IntroText_O                                  ; "O"
    dw $0005
    db $17,$06
    dw IndirectInstructions_IntroText_V                                  ; "V"
    dw $0005
    db $18,$06
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $19,$06
    dw IndirectInstructions_IntroText_R                                  ; "R"
    dw $0005
    db $1A,$06
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $1B,$06
    dw IndirectInstructions_IntroText_D                                  ; "D"
    dw $0005
    db $01,$08
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $02,$08
    dw IndirectInstructions_IntroText_H                                  ; "H"
    dw $0005
    db $03,$08
    dw IndirectInstructions_IntroText_A                                  ; "A"
    dw $0005
    db $04,$08
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $05,$08
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $06,$08
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $07,$08
    dw IndirectInstructions_IntroText_H                                  ; "H"
    dw $0005
    db $08,$08
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $09,$08
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $0A,$08
    dw IndirectInstructions_IntroText_P                                  ; "P"
    dw $0005
    db $0B,$08
    dw IndirectInstructions_IntroText_O                                  ; "O"
    dw $0005
    db $0C,$08
    dw IndirectInstructions_IntroText_W                                  ; "W"
    dw $0005
    db $0D,$08
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $0E,$08
    dw IndirectInstructions_IntroText_R                                  ; "R"
    dw $0005
    db $0F,$08
    dw IndirectInstructions_IntroText_S                                  ; "S"
    dw $0005
    db $10,$08
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $11,$08
    dw IndirectInstructions_IntroText_O                                  ; "O"
    dw $0005
    db $12,$08
    dw IndirectInstructions_IntroText_F                                  ; "F"
    dw $0005
    db $13,$08
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $14,$08
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $15,$08
    dw IndirectInstructions_IntroText_H                                  ; "H"
    dw $0005
    db $16,$08
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $01,$0A
    dw IndirectInstructions_IntroText_M                                  ; "M"
    dw $0005
    db $02,$0A
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $03,$0A
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $04,$0A
    dw IndirectInstructions_IntroText_R                                  ; "R"
    dw $0005
    db $05,$0A
    dw IndirectInstructions_IntroText_O                                  ; "O"
    dw $0005
    db $06,$0A
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $07,$0A
    dw IndirectInstructions_IntroText_D                                  ; "D"
    dw $0005
    db $08,$0A
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $09,$0A
    dw IndirectInstructions_IntroText_M                                  ; "M"
    dw $0005
    db $0A,$0A
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $0B,$0A
    dw IndirectInstructions_IntroText_G                                  ; "G"
    dw $0005
    db $0C,$0A
    dw IndirectInstructions_IntroText_H                                  ; "H"
    dw $0005
    db $0D,$0A
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $0E,$0A
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $0F,$0A
    dw IndirectInstructions_IntroText_B                                  ; "B"
    dw $0005
    db $10,$0A
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $11,$0A
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $12,$0A
    dw IndirectInstructions_IntroText_H                                  ; "H"
    dw $0005
    db $13,$0A
    dw IndirectInstructions_IntroText_A                                  ; "A"
    dw $0005
    db $14,$0A
    dw IndirectInstructions_IntroText_R                                  ; "R"
    dw $0005
    db $15,$0A
    dw IndirectInstructions_IntroText_N                                  ; "N"
    dw $0005
    db $16,$0A
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $17,$0A
    dw IndirectInstructions_IntroText_S                                  ; "S"
    dw $0005
    db $18,$0A
    dw IndirectInstructions_IntroText_S                                  ; "S"
    dw $0005
    db $19,$0A
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $1A,$0A
    dw IndirectInstructions_IntroText_D                                  ; "D"
    dw $0005
    db $01,$0C
    dw IndirectInstructions_IntroText_F                                  ; "F"
    dw $0005
    db $02,$0C
    dw IndirectInstructions_IntroText_O                                  ; "O"
    dw $0005
    db $03,$0C
    dw IndirectInstructions_IntroText_R                                  ; "R"
    dw $0005
    db $04,$0C
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $05,$0C
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $06,$0C
    dw IndirectInstructions_IntroText_H                                  ; "H"
    dw $0005
    db $07,$0C
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $08,$0C
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $09,$0C
    dw IndirectInstructions_IntroText_G                                  ; "G"
    dw $0005
    db $0A,$0C
    dw IndirectInstructions_IntroText_O                                  ; "O"
    dw $0005
    db $0B,$0C
    dw IndirectInstructions_IntroText_O                                  ; "O"
    dw $0005
    db $0C,$0C
    dw IndirectInstructions_IntroText_D                                  ; "D"
    dw $0005
    db $0D,$0C
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $0E,$0C
    dw IndirectInstructions_IntroText_O                                  ; "O"
    dw $0005
    db $0F,$0C
    dw IndirectInstructions_IntroText_F                                  ; "F"
    dw $0005
    db $10,$0C
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $11,$0C
    dw IndirectInstructions_IntroText_C                                  ; "C"
    dw $0005
    db $12,$0C
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $13,$0C
    dw IndirectInstructions_IntroText_V                                  ; "V"
    dw $0005
    db $14,$0C
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $15,$0C
    dw IndirectInstructions_IntroText_L                                  ; "L"
    dw $0005
    db $16,$0C
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $17,$0C
    dw IndirectInstructions_IntroText_Z                                  ; "Z"
    dw $0005
    db $18,$0C
    dw IndirectInstructions_IntroText_A                                  ; "A"
    dw $0005
    db $19,$0C
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $1A,$0C
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $1B,$0C
    dw IndirectInstructions_IntroText_O                                  ; "O"
    dw $0005
    db $1C,$0C
    dw IndirectInstructions_IntroText_N                                  ; "N"
    dw $0005
    db $1D,$0C
    dw IndirectInstructions_IntroText_ExclamationPoint                   ; "!"
    dw Instruction_SpawnBlinkingMarkers_WaitForInput_Page4
    dw CinematicBGObject_Instruction_Delete


;;; $D15D: Intro text - page 5 ;;;
CinematicBGObjectInstLists_IntroTextPage5:
; SATISFIED THAT ALL WAS WELL,
; I LEFT THE STATION TO SEEK A
; NEW BOUNTY TO HUNT. BUT, I
; HAD HARDLY GONE BEYOND THE
; ASTEROID BELT WHEN I PICKED
; UP A DISTRESS SIGNAL!
    dw Instruction_HandleCreatingJapanText_Page5
    dw $0001
    db $01,$01
    dw IndirectInstructions_IntroText_Nothing
    dw $0005
    db $01,$04
    dw IndirectInstructions_IntroText_S                                  ; "S"
    dw $0005
    db $02,$04
    dw IndirectInstructions_IntroText_A                                  ; "A"
    dw $0005
    db $03,$04
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $04,$04
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $05,$04
    dw IndirectInstructions_IntroText_S                                  ; "S"
    dw $0005
    db $06,$04
    dw IndirectInstructions_IntroText_F                                  ; "F"
    dw $0005
    db $07,$04
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $08,$04
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $09,$04
    dw IndirectInstructions_IntroText_D                                  ; "D"
    dw $0005
    db $0A,$04
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $0B,$04
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $0C,$04
    dw IndirectInstructions_IntroText_H                                  ; "H"
    dw $0005
    db $0D,$04
    dw IndirectInstructions_IntroText_A                                  ; "A"
    dw $0005
    db $0E,$04
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $0F,$04
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $10,$04
    dw IndirectInstructions_IntroText_A                                  ; "A"
    dw $0005
    db $11,$04
    dw IndirectInstructions_IntroText_L                                  ; "L"
    dw $0005
    db $12,$04
    dw IndirectInstructions_IntroText_L                                  ; "L"
    dw $0005
    db $13,$04
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $14,$04
    dw IndirectInstructions_IntroText_W                                  ; "W"
    dw $0005
    db $15,$04
    dw IndirectInstructions_IntroText_A                                  ; "A"
    dw $0005
    db $16,$04
    dw IndirectInstructions_IntroText_S                                  ; "S"
    dw $0005
    db $17,$04
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $18,$04
    dw IndirectInstructions_IntroText_W                                  ; "W"
    dw $0005
    db $19,$04
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $1A,$04
    dw IndirectInstructions_IntroText_L                                  ; "L"
    dw $0005
    db $1B,$04
    dw IndirectInstructions_IntroText_L                                  ; "L"
    dw $0005
    db $1C,$04
    dw IndirectInstructions_IntroText_Comma                              ; ","
    dw $0005
    db $01,$06
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $02,$06
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $03,$06
    dw IndirectInstructions_IntroText_L                                  ; "L"
    dw $0005
    db $04,$06
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $05,$06
    dw IndirectInstructions_IntroText_F                                  ; "F"
    dw $0005
    db $06,$06
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $07,$06
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $08,$06
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $09,$06
    dw IndirectInstructions_IntroText_H                                  ; "H"
    dw $0005
    db $0A,$06
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $0B,$06
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $0C,$06
    dw IndirectInstructions_IntroText_S                                  ; "S"
    dw $0005
    db $0D,$06
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $0E,$06
    dw IndirectInstructions_IntroText_A                                  ; "A"
    dw $0005
    db $0F,$06
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $10,$06
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $11,$06
    dw IndirectInstructions_IntroText_O                                  ; "O"
    dw $0005
    db $12,$06
    dw IndirectInstructions_IntroText_N                                  ; "N"
    dw $0005
    db $13,$06
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $14,$06
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $15,$06
    dw IndirectInstructions_IntroText_O                                  ; "O"
    dw $0005
    db $16,$06
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $17,$06
    dw IndirectInstructions_IntroText_S                                  ; "S"
    dw $0005
    db $18,$06
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $19,$06
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $1A,$06
    dw IndirectInstructions_IntroText_K                                  ; "K"
    dw $0005
    db $1B,$06
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $1C,$06
    dw IndirectInstructions_IntroText_A                                  ; "A"
    dw $0005
    db $01,$08
    dw IndirectInstructions_IntroText_N                                  ; "N"
    dw $0005
    db $02,$08
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $03,$08
    dw IndirectInstructions_IntroText_W                                  ; "W"
    dw $0005
    db $04,$08
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $05,$08
    dw IndirectInstructions_IntroText_B                                  ; "B"
    dw $0005
    db $06,$08
    dw IndirectInstructions_IntroText_O                                  ; "O"
    dw $0005
    db $07,$08
    dw IndirectInstructions_IntroText_U                                  ; "U"
    dw $0005
    db $08,$08
    dw IndirectInstructions_IntroText_N                                  ; "N"
    dw $0005
    db $09,$08
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $0A,$08
    dw IndirectInstructions_IntroText_Y                                  ; "Y"
    dw $0005
    db $0B,$08
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $0C,$08
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $0D,$08
    dw IndirectInstructions_IntroText_O                                  ; "O"
    dw $0005
    db $0E,$08
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $0F,$08
    dw IndirectInstructions_IntroText_H                                  ; "H"
    dw $0005
    db $10,$08
    dw IndirectInstructions_IntroText_U                                  ; "U"
    dw $0005
    db $11,$08
    dw IndirectInstructions_IntroText_N                                  ; "N"
    dw $0005
    db $12,$08
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $13,$08
    dw IndirectInstructions_IntroText_Period                             ; "."
    dw $0005
    db $14,$08
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $15,$08
    dw IndirectInstructions_IntroText_B                                  ; "B"
    dw $0005
    db $16,$08
    dw IndirectInstructions_IntroText_U                                  ; "U"
    dw $0005
    db $17,$08
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $18,$08
    dw IndirectInstructions_IntroText_Comma                              ; ","
    dw $0005
    db $19,$08
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $1A,$08
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $01,$0A
    dw IndirectInstructions_IntroText_H                                  ; "H"
    dw $0005
    db $02,$0A
    dw IndirectInstructions_IntroText_A                                  ; "A"
    dw $0005
    db $03,$0A
    dw IndirectInstructions_IntroText_D                                  ; "D"
    dw $0005
    db $04,$0A
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $05,$0A
    dw IndirectInstructions_IntroText_H                                  ; "H"
    dw $0005
    db $06,$0A
    dw IndirectInstructions_IntroText_A                                  ; "A"
    dw $0005
    db $07,$0A
    dw IndirectInstructions_IntroText_R                                  ; "R"
    dw $0005
    db $08,$0A
    dw IndirectInstructions_IntroText_D                                  ; "D"
    dw $0005
    db $09,$0A
    dw IndirectInstructions_IntroText_L                                  ; "L"
    dw $0005
    db $0A,$0A
    dw IndirectInstructions_IntroText_Y                                  ; "Y"
    dw $0005
    db $0B,$0A
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $0C,$0A
    dw IndirectInstructions_IntroText_G                                  ; "G"
    dw $0005
    db $0D,$0A
    dw IndirectInstructions_IntroText_O                                  ; "O"
    dw $0005
    db $0E,$0A
    dw IndirectInstructions_IntroText_N                                  ; "N"
    dw $0005
    db $0F,$0A
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $10,$0A
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $11,$0A
    dw IndirectInstructions_IntroText_B                                  ; "B"
    dw $0005
    db $12,$0A
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $13,$0A
    dw IndirectInstructions_IntroText_Y                                  ; "Y"
    dw $0005
    db $14,$0A
    dw IndirectInstructions_IntroText_O                                  ; "O"
    dw $0005
    db $15,$0A
    dw IndirectInstructions_IntroText_N                                  ; "N"
    dw $0005
    db $16,$0A
    dw IndirectInstructions_IntroText_D                                  ; "D"
    dw $0005
    db $17,$0A
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $18,$0A
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $19,$0A
    dw IndirectInstructions_IntroText_H                                  ; "H"
    dw $0005
    db $1A,$0A
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $01,$0C
    dw IndirectInstructions_IntroText_A                                  ; "A"
    dw $0005
    db $02,$0C
    dw IndirectInstructions_IntroText_S                                  ; "S"
    dw $0005
    db $03,$0C
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $04,$0C
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $05,$0C
    dw IndirectInstructions_IntroText_R                                  ; "R"
    dw $0005
    db $06,$0C
    dw IndirectInstructions_IntroText_O                                  ; "O"
    dw $0005
    db $07,$0C
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $08,$0C
    dw IndirectInstructions_IntroText_D                                  ; "D"
    dw $0005
    db $09,$0C
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $0A,$0C
    dw IndirectInstructions_IntroText_B                                  ; "B"
    dw $0005
    db $0B,$0C
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $0C,$0C
    dw IndirectInstructions_IntroText_L                                  ; "L"
    dw $0005
    db $0D,$0C
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $0E,$0C
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $0F,$0C
    dw IndirectInstructions_IntroText_W                                  ; "W"
    dw $0005
    db $10,$0C
    dw IndirectInstructions_IntroText_H                                  ; "H"
    dw $0005
    db $11,$0C
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $12,$0C
    dw IndirectInstructions_IntroText_N                                  ; "N"
    dw $0005
    db $13,$0C
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $14,$0C
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $15,$0C
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $16,$0C
    dw IndirectInstructions_IntroText_P                                  ; "P"
    dw $0005
    db $17,$0C
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $18,$0C
    dw IndirectInstructions_IntroText_C                                  ; "C"
    dw $0005
    db $19,$0C
    dw IndirectInstructions_IntroText_K                                  ; "K"
    dw $0005
    db $1A,$0C
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $1B,$0C
    dw IndirectInstructions_IntroText_D                                  ; "D"
    dw $0005
    db $01,$0E
    dw IndirectInstructions_IntroText_U                                  ; "U"
    dw $0005
    db $02,$0E
    dw IndirectInstructions_IntroText_P                                  ; "P"
    dw $0005
    db $03,$0E
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $04,$0E
    dw IndirectInstructions_IntroText_A                                  ; "A"
    dw $0005
    db $05,$0E
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $06,$0E
    dw IndirectInstructions_IntroText_D                                  ; "D"
    dw $0005
    db $07,$0E
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $08,$0E
    dw IndirectInstructions_IntroText_S                                  ; "S"
    dw $0005
    db $09,$0E
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $0A,$0E
    dw IndirectInstructions_IntroText_R                                  ; "R"
    dw $0005
    db $0B,$0E
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $0C,$0E
    dw IndirectInstructions_IntroText_S                                  ; "S"
    dw $0005
    db $0D,$0E
    dw IndirectInstructions_IntroText_S                                  ; "S"
    dw $0005
    db $0E,$0E
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $0F,$0E
    dw IndirectInstructions_IntroText_S                                  ; "S"
    dw $0005
    db $10,$0E
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $11,$0E
    dw IndirectInstructions_IntroText_G                                  ; "G"
    dw $0005
    db $12,$0E
    dw IndirectInstructions_IntroText_N                                  ; "N"
    dw $0005
    db $13,$0E
    dw IndirectInstructions_IntroText_A                                  ; "A"
    dw $0005
    db $14,$0E
    dw IndirectInstructions_IntroText_L                                  ; "L"
    dw $0005
    db $15,$0E
    dw IndirectInstructions_IntroText_ExclamationPoint                   ; "!"
    dw Instruction_SpawnBlinkingMarkers_WaitForInput_Page5
    dw CinematicBGObject_Instruction_Delete


;;; $D511: Intro text - page 6 ;;;
CinematicBGObjectInstLists_IntroTextPage6:
; CERES STATION WAS UNDER
; ATTACK!!
    dw Instruction_HandleCreatingJapanText_Page6
    dw $0001
    db $01,$01
    dw IndirectInstructions_IntroText_Nothing
    dw $0005
    db $01,$04
    dw IndirectInstructions_IntroText_C                                  ; "C"
    dw $0005
    db $02,$04
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $03,$04
    dw IndirectInstructions_IntroText_R                                  ; "R"
    dw $0005
    db $04,$04
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $05,$04
    dw IndirectInstructions_IntroText_S                                  ; "S"
    dw $0005
    db $06,$04
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $07,$04
    dw IndirectInstructions_IntroText_S                                  ; "S"
    dw $0005
    db $08,$04
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $09,$04
    dw IndirectInstructions_IntroText_A                                  ; "A"
    dw $0005
    db $0A,$04
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $0B,$04
    dw IndirectInstructions_IntroText_I                                  ; "I"
    dw $0005
    db $0C,$04
    dw IndirectInstructions_IntroText_O                                  ; "O"
    dw $0005
    db $0D,$04
    dw IndirectInstructions_IntroText_N                                  ; "N"
    dw $0005
    db $0E,$04
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $0F,$04
    dw IndirectInstructions_IntroText_W                                  ; "W"
    dw $0005
    db $10,$04
    dw IndirectInstructions_IntroText_A                                  ; "A"
    dw $0005
    db $11,$04
    dw IndirectInstructions_IntroText_S                                  ; "S"
    dw $0005
    db $12,$04
    dw IndirectInstructions_IntroText_Space                              ; " "
    dw $0005
    db $13,$04
    dw IndirectInstructions_IntroText_U                                  ; "U"
    dw $0005
    db $14,$04
    dw IndirectInstructions_IntroText_N                                  ; "N"
    dw $0005
    db $15,$04
    dw IndirectInstructions_IntroText_D                                  ; "D"
    dw $0005
    db $16,$04
    dw IndirectInstructions_IntroText_E                                  ; "E"
    dw $0005
    db $17,$04
    dw IndirectInstructions_IntroText_R                                  ; "R"
    dw $0005
    db $01,$06
    dw IndirectInstructions_IntroText_A                                  ; "A"
    dw $0005
    db $02,$06
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $03,$06
    dw IndirectInstructions_IntroText_T                                  ; "T"
    dw $0005
    db $04,$06
    dw IndirectInstructions_IntroText_A                                  ; "A"
    dw $0005
    db $05,$06
    dw IndirectInstructions_IntroText_C                                  ; "C"
    dw $0005
    db $06,$06
    dw IndirectInstructions_IntroText_K                                  ; "K"
    dw $0005
    db $07,$06
    dw IndirectInstructions_IntroText_ExclamationPoint                   ; "!"
    dw $0005
    db $08,$06
    dw IndirectInstructions_IntroText_ExclamationPoint                   ; "!"
    dw Instruction_SetCaretToBlink
    dw $0080
    db $01,$01
    dw IndirectInstructions_IntroText_Nothing
    dw Instruction_FinishIntro
    dw CinematicBGObject_Instruction_Delete


;;; $D5DF: Samus blinking ;;;
CinematicBGObjectInstLists_SamusBlinking:
; Pages 1..5
    dw $0080
    db $11,$0D
    dw IndirectInstructions_IntroText_SamusEyesOpen
    dw $000A
    db $11,$0D
    dw IndirectInstructions_IntroText_SamusEyesHalfOpen
    dw $000A
    db $11,$0D
    dw IndirectInstructions_IntroText_SamusEyesClosed
    dw $000A
    db $11,$0D
    dw IndirectInstructions_IntroText_SamusEyesHalfOpen
    dw $0050
    db $11,$0D
    dw IndirectInstructions_IntroText_SamusEyesOpen
    dw $0008
    db $11,$0D
    dw IndirectInstructions_IntroText_SamusEyesHalfOpen
    dw $0008
    db $11,$0D
    dw IndirectInstructions_IntroText_SamusEyesClosed
    dw $0008
    db $11,$0D
    dw IndirectInstructions_IntroText_SamusEyesHalfOpen
    dw CinematicBGObject_Instruction_GotoY
    dw CinematicBGObjectInstLists_SamusBlinking

CinematicBGObjectInstLists_SamusBlinkingPage6:
; Page 6
    dw $0040
    db $11,$0D
    dw IndirectInstructions_IntroText_SamusEyesClosed
    dw $0008
    db $11,$0D
    dw IndirectInstructions_IntroText_SamusEyesHalfOpen

CinematicBGObjectInstLists_SamusBlinkingDeadpan:
    dw $0010
    db $11,$0D
    dw IndirectInstructions_IntroText_SamusEyesDeadpan
    dw CinematicBGObject_Instruction_GotoY
    dw CinematicBGObjectInstLists_SamusBlinkingDeadpan


;;; $D629: Space colony ;;;
CinematicBGObjectInstLists_SpaceColony:
    dw $0010
    db $0A,$18
    dw IndirectInstructions_IntroText_SpaceColony_S                      ; "S"
    dw $0010
    db $0B,$18
    dw IndirectInstructions_IntroText_SpaceColony_P                      ; "P"
    dw $0010
    db $0C,$18
    dw IndirectInstructions_IntroText_SpaceColony_A                      ; "A"
    dw $0010
    db $0D,$18
    dw IndirectInstructions_IntroText_SpaceColony_C                      ; "C"
    dw $0010
    db $0E,$18
    dw IndirectInstructions_IntroText_SpaceColony_E                      ; "E"
    dw $0010
    db $10,$18
    dw IndirectInstructions_IntroText_SpaceColony_C                      ; "C"
    dw $0010
    db $11,$18
    dw IndirectInstructions_IntroText_SpaceColony_O                      ; "O"
    dw $0010
    db $12,$18
    dw IndirectInstructions_IntroText_SpaceColony_L                      ; "L"
    dw $0010
    db $13,$18
    dw IndirectInstructions_IntroText_SpaceColony_O                      ; "O"
    dw $0010
    db $14,$18
    dw IndirectInstructions_IntroText_SpaceColony_N                      ; "N"
    dw $0010
    db $15,$18
    dw IndirectInstructions_IntroText_SpaceColony_Y                      ; "Y"
    dw Instruction_SkipNextInstructionIfEnglishText
    dw $0001
    db $0C,$1A
    dw IndirectInstructions_IntroText_JapanText_SpaceColony
    dw $0080
    db $01,$01
    dw IndirectInstructions_IntroText_Nothing
    dw Instruction_FinishFlyToCeres
    dw CinematicBGObject_Instruction_Delete


;;; $D67D: Indirect instructions - intro text ;;;
IndirectInstructions_IntroText_Space:
    dw IndirectInstructionFunction_DrawTextCharacter
    db $01,$01
    dw $002F

IndirectInstructions_IntroText_Nothing:
    dw IndirectInstructionFunction_Nothing

IndirectInstructions_IntroText_A:
    dw IndirectInstructionFunction_DrawTextCharacter
    db $01,$01
    dw $2000

IndirectInstructions_IntroText_B:
    dw IndirectInstructionFunction_DrawTextCharacter
    db $01,$01
    dw $2001

IndirectInstructions_IntroText_C:
    dw IndirectInstructionFunction_DrawTextCharacter
    db $01,$01
    dw $2002

IndirectInstructions_IntroText_D:
    dw IndirectInstructionFunction_DrawTextCharacter
    db $01,$01
    dw $2003

IndirectInstructions_IntroText_E:
    dw IndirectInstructionFunction_DrawTextCharacter
    db $01,$01
    dw $2004

IndirectInstructions_IntroText_F:
    dw IndirectInstructionFunction_DrawTextCharacter
    db $01,$01
    dw $2005

IndirectInstructions_IntroText_G:
    dw IndirectInstructionFunction_DrawTextCharacter
    db $01,$01
    dw $2006

IndirectInstructions_IntroText_H:
    dw IndirectInstructionFunction_DrawTextCharacter
    db $01,$01
    dw $2007

IndirectInstructions_IntroText_I:
    dw IndirectInstructionFunction_DrawTextCharacter
    db $01,$01
    dw $2008

IndirectInstructions_IntroText_J:
    dw IndirectInstructionFunction_DrawTextCharacter
    db $01,$01
    dw $2009

IndirectInstructions_IntroText_K:
    dw IndirectInstructionFunction_DrawTextCharacter
    db $01,$01
    dw $200A

IndirectInstructions_IntroText_L:
    dw IndirectInstructionFunction_DrawTextCharacter
    db $01,$01
    dw $200B

IndirectInstructions_IntroText_M:
    dw IndirectInstructionFunction_DrawTextCharacter
    db $01,$01
    dw $200C

IndirectInstructions_IntroText_N:
    dw IndirectInstructionFunction_DrawTextCharacter
    db $01,$01
    dw $200D

IndirectInstructions_IntroText_O:
    dw IndirectInstructionFunction_DrawTextCharacter
    db $01,$01
    dw $200E

IndirectInstructions_IntroText_P:
    dw IndirectInstructionFunction_DrawTextCharacter
    db $01,$01
    dw $200F

IndirectInstructions_IntroText_Q:
    dw IndirectInstructionFunction_DrawTextCharacter
    db $01,$01
    dw $2010

IndirectInstructions_IntroText_R:
    dw IndirectInstructionFunction_DrawTextCharacter
    db $01,$01
    dw $2011

IndirectInstructions_IntroText_S:
    dw IndirectInstructionFunction_DrawTextCharacter
    db $01,$01
    dw $2012

IndirectInstructions_IntroText_T:
    dw IndirectInstructionFunction_DrawTextCharacter
    db $01,$01
    dw $2013

IndirectInstructions_IntroText_U:
    dw IndirectInstructionFunction_DrawTextCharacter
    db $01,$01
    dw $2014

IndirectInstructions_IntroText_V:
    dw IndirectInstructionFunction_DrawTextCharacter
    db $01,$01
    dw $2015

IndirectInstructions_IntroText_W:
    dw IndirectInstructionFunction_DrawTextCharacter
    db $01,$01
    dw $2016

IndirectInstructions_IntroText_X:
    dw IndirectInstructionFunction_DrawTextCharacter
    db $01,$01
    dw $2017

IndirectInstructions_IntroText_Y:
    dw IndirectInstructionFunction_DrawTextCharacter
    db $01,$01
    dw $2018

IndirectInstructions_IntroText_Z:
    dw IndirectInstructionFunction_DrawTextCharacter
    db $01,$01
    dw $2019

IndirectInstructions_IntroText_0:
    dw IndirectInstructionFunction_DrawTextCharacter
    db $01,$01
    dw $201A

IndirectInstructions_IntroText_1:
    dw IndirectInstructionFunction_DrawTextCharacter
    db $01,$01
    dw $201B

IndirectInstructions_IntroText_2:
    dw IndirectInstructionFunction_DrawTextCharacter
    db $01,$01
    dw $201C

IndirectInstructions_IntroText_3:
    dw IndirectInstructionFunction_DrawTextCharacter
    db $01,$01
    dw $201D

IndirectInstructions_IntroText_4:
    dw IndirectInstructionFunction_DrawTextCharacter
    db $01,$01
    dw $201E

IndirectInstructions_IntroText_5:
    dw IndirectInstructionFunction_DrawTextCharacter
    db $01,$01
    dw $201F

IndirectInstructions_IntroText_6:
    dw IndirectInstructionFunction_DrawTextCharacter
    db $01,$01
    dw $2020

IndirectInstructions_IntroText_7:
    dw IndirectInstructionFunction_DrawTextCharacter
    db $01,$01
    dw $2021

IndirectInstructions_IntroText_8:
    dw IndirectInstructionFunction_DrawTextCharacter
    db $01,$01
    dw $2022

IndirectInstructions_IntroText_9:
    dw IndirectInstructionFunction_DrawTextCharacter
    db $01,$01
    dw $2023

IndirectInstructions_IntroText_Period:
    dw IndirectInstructionFunction_DrawTextCharacter
    db $01,$01
    dw $2024

IndirectInstructions_IntroText_Comma:
    dw IndirectInstructionFunction_DrawTextCharacter
    db $01,$01
    dw $2025

IndirectInstructions_IntroText_DecimalPoint:
    dw IndirectInstructionFunction_DrawTextCharacter
    db $01,$01
    dw $2026

IndirectInstructions_IntroText_Apostrophe:
    dw IndirectInstructionFunction_DrawTextCharacter
    db $01,$01
    dw $2027

IndirectInstructions_IntroText_Colon:
    dw IndirectInstructionFunction_DrawTextCharacter
    db $01,$01
    dw $2028

IndirectInstructions_IntroText_ExclamationPoint:
    dw IndirectInstructionFunction_DrawTextCharacter
    db $01,$01
    dw $202A

IndirectInstructions_IntroText_SamusEyesOpen:
    dw IndirectInstructionFunction_DrawSamusEyesToTilemap
    db $03,$02
    dw $0F89,$0F8A,$0F8B,$0F99,$0F9A,$0F9B

IndirectInstructions_IntroText_SamusEyesHalfOpen:
    dw IndirectInstructionFunction_DrawSamusEyesToTilemap
    db $03,$02
    dw $0F1D,$0F1E,$0F1F,$0F2D,$0F2E,$0F2F

IndirectInstructions_IntroText_SamusEyesClosed:
    dw IndirectInstructionFunction_DrawSamusEyesToTilemap
    db $03,$02
    dw $0F3A,$0F3B,$0F3C,$0F4A,$0F4B,$0F4C

IndirectInstructions_IntroText_SamusEyesDeadpan:
    dw IndirectInstructionFunction_DrawSamusEyesToTilemap
    db $03,$02
    dw $0F3D,$0F3E,$0F3F,$0F4D,$0F4E,$0F4F

IndirectInstructions_IntroText_SpaceColony_S:
    dw IndirectInstructionFunction_DrawTextToTilemap
    db $01,$01
    dw $21ED

IndirectInstructions_IntroText_SpaceColony_P:
    dw IndirectInstructionFunction_DrawTextToTilemap
    db $01,$01
    dw $21EE

IndirectInstructions_IntroText_SpaceColony_A:
    dw IndirectInstructionFunction_DrawTextToTilemap
    db $01,$01
    dw $21EF

IndirectInstructions_IntroText_SpaceColony_C:
    dw IndirectInstructionFunction_DrawTextToTilemap
    db $01,$01
    dw $21F7

IndirectInstructions_IntroText_SpaceColony_E:
    dw IndirectInstructionFunction_DrawTextToTilemap
    db $01,$01
    dw $21F8

IndirectInstructions_IntroText_SpaceColony_O:
    dw IndirectInstructionFunction_DrawTextToTilemap
    db $01,$01
    dw $21F9

IndirectInstructions_IntroText_SpaceColony_L:
    dw IndirectInstructionFunction_DrawTextToTilemap
    db $01,$01
    dw $21FA

IndirectInstructions_IntroText_SpaceColony_N:
    dw IndirectInstructionFunction_DrawTextToTilemap
    db $01,$01
    dw $21FB

IndirectInstructions_IntroText_SpaceColony_Y:
    dw IndirectInstructionFunction_DrawTextToTilemap
    db $01,$01
    dw $21B9

IndirectInstructions_IntroText_JapanText_SpaceColony:
; "スペースコロニー" (space colony)
    dw IndirectInstructionFunction_DrawTextToTilemap
    db $08,$02
    dw $21BA,$21BB,$21B3,$21BA,$21BC,$20E0,$20E1,$21B3
    dw $20E2,$20E3,$21B4,$20E2,$20E4,$21A3,$21A4,$21B4


;;; $D81B: Initial intro Japanese text tilemap ;;;
InitialIntroJapanTextTilemap:
; 最後のメトロイドが 獲えられ (the last metroid was captured)
; 銀河宇宙に平和が訪れた... (peace came to the Milky Way...)
    dw $002F,$002F,$002F,$002F,$002F,$002F,$002F,$002F
    dw $002F,$105A,$105B,$105C,$105D,$105E,$105F,$1070
    dw $1071,$1072,$002F,$1073,$1074,$1075,$1076,$002F
    dw $002F,$002F,$002F,$002F,$002F,$002F,$002F,$002F
    dw $002F,$002F,$002F,$002F,$002F,$002F,$002F,$002F
    dw $002F,$106A,$106B,$106C,$106D,$106E,$106F,$1080
    dw $1081,$1082,$002F,$1083,$1084,$1085,$1086,$002F
    dw $002F,$002F,$002F,$002F,$002F,$002F,$002F,$002F
    dw $002F,$002F,$002F,$002F,$002F,$002F,$002F,$002F
    dw $002F,$1077,$1078,$1079,$107A,$107B,$107C,$107D
    dw $1072,$107E,$1076,$107F,$002F,$002F,$002F,$002F
    dw $002F,$002F,$002F,$002F,$002F,$002F,$002F,$002F
    dw $002F,$002F,$002F,$002F,$002F,$002F,$002F,$002F
    dw $002F,$1087,$1088,$1089,$108A,$108B,$108C,$108D
    dw $1082,$108E,$1086,$108F,$1026,$1026,$1026,$002F
    dw $002F,$002F,$002F,$002F,$002F,$002F,$002F,$002F


;;; $D91B: Instruction list - credits ;;;
InstList_Credits_Start:
; Negative instructions are ASM instructions (as per usual)
; For positive instructions, the first word is ignored, the second word is an offset to a row of credits tilemap to load
; Offsets are a multiple of 40h that index $7F:0000 (which is decompressed from $97:EEFF)
; A positive instruction will be processed only when a new tilemap row needs copying (which is once every 10h frames)

; Strangely (to me), this doesn't just load the credits tilemap in the original order,
; but actually rearranges some sections and omits(!) some credits
    dw Instruction_CreditsObject_TimerInY,$0008

InstList_Credits_SuperMetroidStaff:
    dw $0000,$1FC0
    dw Instruction_CreditsObject_DecrementTimer_GotoYIfNonZero
    dw InstList_Credits_SuperMetroidStaff
    dw $0000,$0000
    dw Instruction_CreditsObject_TimerInY,$0010

InstList_Credits_Producer:
    dw $0000,$1FC0
    dw Instruction_CreditsObject_DecrementTimer_GotoYIfNonZero
    dw InstList_Credits_Producer
    dw $0000,$0100
    dw $0000,$1FC0
    dw $0000,$01C0
    dw $0000,$0200
    dw Instruction_CreditsObject_TimerInY,$0010

InstList_Credits_Director:
    dw $0000,$1FC0
    dw Instruction_CreditsObject_DecrementTimer_GotoYIfNonZero
    dw InstList_Credits_Director
    dw $0000,$0240
    dw $0000,$1FC0
    dw $0000,$0280
    dw $0000,$02C0
    dw Instruction_CreditsObject_TimerInY,$0010

InstList_Credits_BackgroundDesigners:
    dw $0000,$1FC0
    dw Instruction_CreditsObject_DecrementTimer_GotoYIfNonZero
    dw InstList_Credits_BackgroundDesigners
    dw $0000,$0300
    dw $0000,$1FC0
    dw $0000,$0340
    dw $0000,$0380
    dw $0000,$1FC0
    dw $0000,$03C0
    dw $0000,$0400
    dw $0000,$1FC0
    dw $0000,$0440
    dw $0000,$0480
    dw Instruction_CreditsObject_TimerInY,$0010

InstList_Credits_ObjectDesigners:
    dw $0000,$1FC0
    dw Instruction_CreditsObject_DecrementTimer_GotoYIfNonZero
    dw InstList_Credits_ObjectDesigners
    dw $0000,$04C0
    dw $0000,$1FC0
    dw $0000,$0500
    dw $0000,$0540
    dw $0000,$1FC0
    dw $0000,$0580
    dw $0000,$05C0
    dw Instruction_CreditsObject_TimerInY,$0010

InstList_Credits_SamusOriginalDesigner:
    dw $0000,$1FC0
    dw Instruction_CreditsObject_DecrementTimer_GotoYIfNonZero
    dw InstList_Credits_SamusOriginalDesigner
    dw $0000,$0600
    dw $0000,$1FC0
    dw $0000,$0640
    dw $0000,$0680
    dw Instruction_CreditsObject_TimerInY,$0010

InstList_Credits_SamusDesigner:
    dw $0000,$1FC0
    dw Instruction_CreditsObject_DecrementTimer_GotoYIfNonZero
    dw InstList_Credits_SamusDesigner
    dw $0000,$06C0
    dw $0000,$1FC0
    dw $0000,$0700
    dw $0000,$0740
    dw Instruction_CreditsObject_TimerInY,$0010

InstList_Credits_SoundProgram:
    dw $0000,$1FC0
    dw Instruction_CreditsObject_DecrementTimer_GotoYIfNonZero
    dw InstList_Credits_SoundProgram
    dw $0000,$14C0
    dw $0000,$1AC0
    dw $0000,$1FC0
    dw $0000,$1500
    dw $0000,$1540
    dw Instruction_CreditsObject_TimerInY,$0010

InstList_Credits_MusicComposers:
    dw $0000,$1FC0
    dw Instruction_CreditsObject_DecrementTimer_GotoYIfNonZero
    dw InstList_Credits_MusicComposers
    dw $0000,$1580
    dw $0000,$1FC0
    dw $0000,$1500
    dw $0000,$1540
    dw $0000,$1FC0
    dw $0000,$15C0
    dw $0000,$1600
    dw Instruction_CreditsObject_TimerInY,$0010

InstList_Credits_ProgramDirector:
    dw $0000,$1FC0
    dw Instruction_CreditsObject_DecrementTimer_GotoYIfNonZero
    dw InstList_Credits_ProgramDirector
    dw $0000,$0780
    dw $0000,$1FC0
    dw $0000,$07C0
    dw $0000,$1000
    dw Instruction_CreditsObject_TimerInY,$0010

InstList_Credits_SystemCoordinator:
    dw $0000,$1FC0
    dw Instruction_CreditsObject_DecrementTimer_GotoYIfNonZero
    dw InstList_Credits_SystemCoordinator
    dw $0000,$1040
    dw $0000,$1FC0
    dw $0000,$1080
    dw $0000,$10C0
    dw Instruction_CreditsObject_TimerInY,$0010

InstList_Credits_SystemProgrammer:
    dw $0000,$1FC0
    dw Instruction_CreditsObject_DecrementTimer_GotoYIfNonZero
    dw InstList_Credits_SystemProgrammer
    dw $0000,$1100
    dw $0000,$1FC0
    dw $0000,$1140
    dw $0000,$1180
    dw Instruction_CreditsObject_TimerInY,$0010

InstList_Credits_SamusProgrammer:
    dw $0000,$1FC0
    dw Instruction_CreditsObject_DecrementTimer_GotoYIfNonZero
    dw InstList_Credits_SamusProgrammer
    dw $0000,$11C0
    dw $0000,$1FC0
    dw $0000,$1200
    dw $0000,$1240
    dw Instruction_CreditsObject_TimerInY,$0010

InstList_Credits_EventProgrammer:
    dw $0000,$1FC0
    dw Instruction_CreditsObject_DecrementTimer_GotoYIfNonZero
    dw InstList_Credits_EventProgrammer
    dw $0000,$1280
    dw $0000,$1FC0
    dw $0000,$12C0
    dw $0000,$1300
    dw Instruction_CreditsObject_TimerInY,$0010

InstList_Credits_EnemyProgrammer:
    dw $0000,$1FC0
    dw Instruction_CreditsObject_DecrementTimer_GotoYIfNonZero
    dw InstList_Credits_EnemyProgrammer
    dw $0000,$1340
    dw $0000,$1FC0
    dw $0000,$1380
    dw $0000,$13C0
    dw Instruction_CreditsObject_TimerInY,$0010

InstList_Credits_MapProgrammer:
    dw $0000,$1FC0
    dw Instruction_CreditsObject_DecrementTimer_GotoYIfNonZero
    dw InstList_Credits_MapProgrammer
    dw $0000,$1400
    dw $0000,$1FC0
    dw $0000,$1440
    dw $0000,$1480
    dw Instruction_CreditsObject_TimerInY,$0010

InstList_Credits_AssistantProgrammer:
    dw $0000,$1FC0
    dw Instruction_CreditsObject_DecrementTimer_GotoYIfNonZero
    dw InstList_Credits_AssistantProgrammer
    dw $0000,$1940
    dw $0000,$1FC0
    dw $0000,$1980
    dw $0000,$19C0
    dw Instruction_CreditsObject_TimerInY,$0010

InstList_Credits_Coordinators:
    dw $0000,$1FC0
    dw Instruction_CreditsObject_DecrementTimer_GotoYIfNonZero
    dw InstList_Credits_Coordinators
    dw $0000,$1A00
    dw $0000,$1FC0
    dw $0000,$1A40
    dw $0000,$1A80
    dw $0000,$1FC0
    dw $0000,$0FC0
    dw $0000,$1800
    dw Instruction_CreditsObject_TimerInY,$0010

InstList_Credits_PrintedArtWork:
    dw $0000,$1FC0
    dw Instruction_CreditsObject_DecrementTimer_GotoYIfNonZero
    dw InstList_Credits_PrintedArtWork
    dw $0000,$1640
    dw $0000,$1FC0
    dw $0000,$1680
    dw $0000,$16C0
    dw $0000,$1FC0
    dw $0000,$1700
    dw $0000,$1740
    dw $0000,$1FC0
    dw $0000,$1780
    dw $0000,$17C0
    dw $0000,$1FC0
    dw $0000,$18C0
    dw $0000,$1900
    dw $0000,$1FC0
    dw $0000,$1B00
    dw $0000,$1B40
    dw $0000,$1FC0
    dw $0000,$1B80
    dw $0000,$1BC0
    dw Instruction_CreditsObject_TimerInY,$0010

InstList_Credits_SpecialThanksTo:
    dw $0000,$1FC0
    dw Instruction_CreditsObject_DecrementTimer_GotoYIfNonZero
    dw InstList_Credits_SpecialThanksTo
    dw $0000,$0800
    dw $0000,$1FC0
    dw $0000,$0840
    dw $0000,$0880
    dw $0000,$1FC0
    dw $0000,$08C0
    dw $0000,$0900
    dw $0000,$1FC0
    dw $0000,$09C0
    dw $0000,$0A00
    dw $0000,$1FC0
    dw $0000,$0AC0
    dw $0000,$0B00
    dw $0000,$1FC0
    dw $0000,$0BC0
    dw $0000,$0C00
    dw $0000,$1FC0
    dw $0000,$0C40
    dw $0000,$0C80
    dw $0000,$1FC0
    dw $0000,$0CC0
    dw $0000,$0D00
    dw $0000,$1FC0
    dw $0000,$0D40
    dw $0000,$0D80
    dw $0000,$1FC0
    dw $0000,$0E40
    dw $0000,$0E80
    dw $0000,$1FC0
    dw $0000,$0EC0
    dw $0000,$0F00
    dw $0000,$1FC0
    dw $0000,$0F40
    dw $0000,$0F80
    dw $0000,$1FC0
    dw $0000,$1840
    dw $0000,$1880
    dw $0000,$1FC0
    dw $0000,$1E80
    dw $0000,$1EC0
    dw $0000,$1FC0
    dw $0000,$1F00
    dw $0000,$1F40
    dw $0000,$1FC0
    dw $0000,$0B40
    dw $0000,$0B80
    dw $0000,$1FC0
    dw $0000,$1C00
    dw $0000,$1C40
    dw Instruction_CreditsObject_TimerInY,$0010

InstList_Credits_GeneralManager:
    dw $0000,$1FC0
    dw Instruction_CreditsObject_DecrementTimer_GotoYIfNonZero
    dw InstList_Credits_GeneralManager
    dw $0000,$1C80
    dw $0000,$1FC0
    dw $0000,$0140
    dw $0000,$0180
    dw Instruction_CreditsObject_TimerInY,$0023

InstList_Credits_End:
    dw $0000,$1FC0
    dw Instruction_CreditsObject_DecrementTimer_GotoYIfNonZero
    dw InstList_Credits_End
    dw Instruction_EndCredits
    dw Instruction_CreditsObject_Delete


;;; $DC9B: Tilemap - post-credits - Deer Force ;;;
Tilemap_PostCredits_DeeRForCe:
    dw $004F,$004F,$004F,$004F,$004F,$004F,$004F,$004F
    dw $004F,$004F,$000F,$0011,$000E,$0003,$0014,$0002
    dw $0004,$0003,$004F,$0001,$0018,$004F,$004F,$004F
    dw $004F,$004F,$004F,$004F,$004F,$004F,$004F,$004F
    dw $004F,$004F,$004F,$004F,$004F,$004F,$004F,$004F
    dw $004F,$004F,$004F,$004F,$004F,$004F,$004F,$004F
    dw $004F,$004F,$004F,$004F,$004F,$004F,$004F,$004F
    dw $004F,$004F,$004F,$004F,$004F,$004F,$004F,$004F
    dw $004F,$004F,$004F,$004F,$004F,$004F,$004F,$004F
    dw $004F,$004F,$004F,$1823,$1824,$1824,$1841,$004F
    dw $1825,$182E,$1841,$1822,$1824,$004F,$004F,$004F
    dw $004F,$004F,$004F,$004F,$004F,$004F,$004F,$004F
    dw $004F,$004F,$004F,$004F,$004F,$004F,$004F,$004F
    dw $004F,$004F,$004F,$1833,$1834,$1834,$1851,$004F
    dw $1835,$183E,$1851,$1832,$1834,$004F,$004F,$004F
    dw $004F,$004F,$004F,$004F,$004F,$004F,$004F,$004F
    dw $004F,$004F,$004F,$004F,$004F,$004F,$004F,$004F
    dw $004F,$004F,$004F,$004F,$004F,$004F,$004F,$004F
    dw $004F,$004F,$004F,$004F,$004F,$004F,$004F,$004F
    dw $004F,$004F,$004F,$004F,$004F,$004F,$004F,$004F
    dw $004F,$004F,$004F,$004F,$004F,$004F,$004F,$004F
    dw $004F,$004F,$004F,$004F,$004F,$004F,$004F,$000E
    dw $0005,$004F,$004F,$004F,$004F,$004F,$004F,$004F
    dw $004F,$004F,$004F,$004F,$004F,$004F,$004F,$004F
    dw $004F,$004F,$004F,$004F,$004F,$004F,$004F,$004F
    dw $004F,$004F,$004F,$004F,$004F,$004F,$004F,$004F
    dw $004F,$004F,$004F,$004F,$004F,$004F,$004F,$004F
    dw $004F,$004F,$004F,$004F,$004F,$004F,$004F,$004F
    dw $004F,$004F,$004F,$004F,$004F,$004F,$004F,$004F
    dw $004F,$1C43,$1C24,$1C20,$1C2C,$004F,$1C42,$1C27
    dw $1C28,$1C2A,$1C20,$1C2C,$1C20,$1C41,$1C44,$004F
    dw $004F,$004F,$004F,$004F,$004F,$004F,$004F,$004F
    dw $004F,$004F,$004F,$004F,$004F,$004F,$004F,$004F
    dw $004F,$1C53,$1C34,$1C30,$1C3C,$004F,$1C52,$1C37
    dw $1C38,$1C3A,$1C30,$1C3C,$1C30,$1C51,$1C54,$004F
    dw $004F,$004F,$004F,$004F,$004F,$004F,$004F,$004F


;;; $DEDB: Tilemap - post-credits - 1994 Nintendo ;;;
Tilemap_PostCredits_1994Nintendo:
    dw $007F,$007F,$007F,$007F,$007F,$007F,$007F,$007F
    dw $007F,$0061,$0069,$0069,$0064,$007F,$007F,$002D
    dw $0028,$002D,$0043,$0024,$002D,$0023,$002E,$007F
    dw $007F,$007F,$007F,$007F,$007F,$007F,$007F,$007F
    dw $007F,$007F,$007F,$007F,$007F,$007F,$007F,$007F
    dw $007F,$0071,$0079,$0079,$0074,$007F,$007F,$003D
    dw $0038,$003D,$0053,$0034,$003D,$0033,$003E,$007F
    dw $007F,$007F,$007F,$007F,$007F,$007F,$007F,$007F


;;; $DF5B: Tilemap - post-credits - item percentage Japanese text ;;;
Tilemap_PostCredits_ItemPercentageJapanText:
; アイテム発見パーセンテージ (percentage of items discovered)
    dw $004F,$004F,$004F,$004F,$004F,$004F,$004F,$004F
    dw $004F,$005B,$005C,$005D,$005E,$005F,$0080,$0081
    dw $0082,$0083,$0084,$0085,$0086,$0087,$004F,$004F
    dw $004F,$004F,$004F,$004F,$004F,$004F,$004F,$004F
    dw $004F,$004F,$004F,$004F,$004F,$004F,$004F,$004F
    dw $004F,$006B,$006C,$006D,$006E,$006F,$0090,$0091
    dw $0092,$0093,$0094,$0095,$0096,$0097,$004F,$004F
    dw $004F,$004F,$004F,$004F,$004F,$004F,$004F,$004F


;;; $DFDB: Item percentage ;;;
CinematicBGObjectInstLists_Ending_ItemPercentage:
;    YOUR RATE FOR
; COLLECTING ITEMS IS
    dw $0040
    db $00,$00
    dw IndirectInstructions_Ending_Nothing
    dw $0004
    db $09,$0A
    dw IndirectInstructions_EndingSmall_Y                                ; "Y"
    dw $0004
    db $0A,$0A
    dw IndirectInstructions_EndingSmall_O                                ; "O"
    dw $0004
    db $0B,$0A
    dw IndirectInstructions_EndingSmall_U                                ; "U"
    dw $0004
    db $0C,$0A
    dw IndirectInstructions_EndingSmall_R                                ; "R"
    dw $0004
    db $0D,$0A
    dw IndirectInstructions_EndingSmall_Space                            ; " "
    dw $0004
    db $0E,$0A
    dw IndirectInstructions_EndingSmall_R                                ; "R"
    dw $0004
    db $0F,$0A
    dw IndirectInstructions_EndingSmall_A                                ; "A"
    dw $0004
    db $10,$0A
    dw IndirectInstructions_EndingSmall_T                                ; "T"
    dw $0004
    db $11,$0A
    dw IndirectInstructions_EndingSmall_E                                ; "E"
    dw $0004
    db $12,$0A
    dw IndirectInstructions_EndingSmall_Space                            ; " "
    dw $0004
    db $13,$0A
    dw IndirectInstructions_EndingSmall_F                                ; "F"
    dw $0004
    db $14,$0A
    dw IndirectInstructions_EndingSmall_O                                ; "O"
    dw $0004
    db $15,$0A
    dw IndirectInstructions_EndingSmall_R                                ; "R"
    dw $0004
    db $06,$0C
    dw IndirectInstructions_EndingSmall_C                                ; "C"
    dw $0004
    db $07,$0C
    dw IndirectInstructions_EndingSmall_O                                ; "O"
    dw $0004
    db $08,$0C
    dw IndirectInstructions_EndingSmall_L                                ; "L"
    dw $0004
    db $09,$0C
    dw IndirectInstructions_EndingSmall_L                                ; "L"
    dw $0004
    db $0A,$0C
    dw IndirectInstructions_EndingSmall_E                                ; "E"
    dw $0004
    db $0B,$0C
    dw IndirectInstructions_EndingSmall_C                                ; "C"
    dw $0004
    db $0C,$0C
    dw IndirectInstructions_EndingSmall_T                                ; "T"
    dw $0004
    db $0D,$0C
    dw IndirectInstructions_EndingSmall_I                                ; "I"
    dw $0004
    db $0E,$0C
    dw IndirectInstructions_EndingSmall_N                                ; "N"
    dw $0004
    db $0F,$0C
    dw IndirectInstructions_EndingSmall_G                                ; "G"
    dw $0004
    db $10,$0C
    dw IndirectInstructions_EndingSmall_Space                            ; " "
    dw $0004
    db $11,$0C
    dw IndirectInstructions_EndingSmall_I                                ; "I"
    dw $0004
    db $12,$0C
    dw IndirectInstructions_EndingSmall_T                                ; "T"
    dw $0004
    db $13,$0C
    dw IndirectInstructions_EndingSmall_E                                ; "E"
    dw $0004
    db $14,$0C
    dw IndirectInstructions_EndingSmall_M                                ; "M"
    dw $0004
    db $15,$0C
    dw IndirectInstructions_EndingSmall_S                                ; "S"
    dw $0004
    db $16,$0C
    dw IndirectInstructions_EndingSmall_Space                            ; " "
    dw $0004
    db $17,$0C
    dw IndirectInstructions_EndingSmall_I                                ; "I"
    dw $0004
    db $18,$0C
    dw IndirectInstructions_EndingSmall_S                                ; "S"
    dw Instruction_DrawItemPercentageCount
    dw Instruction_DrawItemPercentageJapanText
    dw $0080
    db $00,$00
    dw IndirectInstructions_Ending_Nothing
    dw Instruction_ClearItemPercentageJapanText
    dw CinematicBGObject_Instruction_Delete


;;; $E0AF: See you next mission ;;;
CinematicBGObjectInstLists_Ending_SeeYouNextMission:
    dw $0040
    db $00,$00
    dw IndirectInstructions_Ending_Nothing
    dw $0004
    db $06,$02
    dw IndirectInstructions_Ending_S                                     ; "S"
    dw $0004
    db $07,$02
    dw IndirectInstructions_Ending_E                                     ; "E"
    dw $0004
    db $08,$02
    dw IndirectInstructions_Ending_E                                     ; "E"
    dw $0004
    db $09,$02
    dw IndirectInstructions_Ending_Space                                 ; " "
    dw $0004
    db $0A,$02
    dw IndirectInstructions_Ending_Y                                     ; "Y"
    dw $0004
    db $0B,$02
    dw IndirectInstructions_Ending_O                                     ; "O"
    dw $0004
    db $0C,$02
    dw IndirectInstructions_Ending_U                                     ; "U"
    dw $0004
    db $0D,$02
    dw IndirectInstructions_Ending_Space                                 ; " "
    dw $0004
    db $0E,$02
    dw IndirectInstructions_Ending_N                                     ; "N"
    dw $0004
    db $0F,$02
    dw IndirectInstructions_Ending_E                                     ; "E"
    dw $0004
    db $10,$02
    dw IndirectInstructions_Ending_X                                     ; "X"
    dw $0004
    db $11,$02
    dw IndirectInstructions_Ending_T                                     ; "T"
    dw $0004
    db $12,$02
    dw IndirectInstructions_Ending_Space                                 ; " "
    dw $0004
    db $13,$02
    dw IndirectInstructions_Ending_M                                     ; "M"
    dw $0004
    db $14,$02
    dw IndirectInstructions_Ending_I                                     ; "I"
    dw $0004
    db $15,$02
    dw IndirectInstructions_Ending_S                                     ; "S"
    dw $0004
    db $16,$02
    dw IndirectInstructions_Ending_S                                     ; "S"
    dw $0004
    db $17,$02
    dw IndirectInstructions_Ending_I                                     ; "I"
    dw $0004
    db $18,$02
    dw IndirectInstructions_Ending_O                                     ; "O"
    dw $0004
    db $19,$02
    dw IndirectInstructions_Ending_N                                     ; "N"
    dw CinematicBGObject_Instruction_Delete


;;; $E12F: Indirect instructions - ending ;;;
IndirectInstructions_Ending_Nothing:
    dw IndirectInstructionFunction_Nothing

IndirectInstructions_Ending_Space:
    dw IndirectInstructionFunction_DrawTextToTilemap
    db $01,$02
    dw $207F,$207F

IndirectInstructions_Ending_S:
    dw IndirectInstructionFunction_DrawTextToTilemap
    db $01,$02
    dw $2042,$2052

IndirectInstructions_Ending_E:
    dw IndirectInstructionFunction_DrawTextToTilemap
    db $01,$02
    dw $2024,$2034

IndirectInstructions_Ending_Y:
    dw IndirectInstructionFunction_DrawTextToTilemap
    db $01,$02
    dw $2048,$2058

IndirectInstructions_Ending_O:
    dw IndirectInstructionFunction_DrawTextToTilemap
    db $01,$02
    dw $202E,$203E

IndirectInstructions_Ending_U:
    dw IndirectInstructionFunction_DrawTextToTilemap
    db $01,$02
    dw $2044,$2054

IndirectInstructions_Ending_N:
    dw IndirectInstructionFunction_DrawTextToTilemap
    db $01,$02
    dw $202D,$203D

IndirectInstructions_Ending_X:
    dw IndirectInstructionFunction_DrawTextToTilemap
    db $01,$02
    dw $2047,$2057

IndirectInstructions_Ending_T:
    dw IndirectInstructionFunction_DrawTextToTilemap
    db $01,$02
    dw $2043,$2053

IndirectInstructions_Ending_M:
    dw IndirectInstructionFunction_DrawTextToTilemap
    db $01,$02
    dw $202C,$203C

IndirectInstructions_Ending_I:
    dw IndirectInstructionFunction_DrawTextToTilemap
    db $01,$02
    dw $2028,$2038

IndirectInstructions_EndingSmall_A:
    dw IndirectInstructionFunction_DrawTextToTilemap
    db $01,$01
    dw $3C00

IndirectInstructions_EndingSmall_C:
    dw IndirectInstructionFunction_DrawTextToTilemap
    db $01,$01
    dw $3C02

IndirectInstructions_EndingSmall_E:
    dw IndirectInstructionFunction_DrawTextToTilemap
    db $01,$01
    dw $3C04

IndirectInstructions_EndingSmall_F:
    dw IndirectInstructionFunction_DrawTextToTilemap
    db $01,$01
    dw $3C05

IndirectInstructions_EndingSmall_G:
    dw IndirectInstructionFunction_DrawTextToTilemap
    db $01,$01
    dw $3C06

IndirectInstructions_EndingSmall_I:
    dw IndirectInstructionFunction_DrawTextToTilemap
    db $01,$01
    dw $3C08

IndirectInstructions_EndingSmall_L:
    dw IndirectInstructionFunction_DrawTextToTilemap
    db $01,$01
    dw $3C0B

IndirectInstructions_EndingSmall_M:
    dw IndirectInstructionFunction_DrawTextToTilemap
    db $01,$01
    dw $3C0C

IndirectInstructions_EndingSmall_N:
    dw IndirectInstructionFunction_DrawTextToTilemap
    db $01,$01
    dw $3C0D

IndirectInstructions_EndingSmall_O:
    dw IndirectInstructionFunction_DrawTextToTilemap
    db $01,$01
    dw $3C0E

IndirectInstructions_EndingSmall_R:
    dw IndirectInstructionFunction_DrawTextToTilemap
    db $01,$01
    dw $3C11

IndirectInstructions_EndingSmall_S:
    dw IndirectInstructionFunction_DrawTextToTilemap
    db $01,$01
    dw $3C12

IndirectInstructions_EndingSmall_T:
    dw IndirectInstructionFunction_DrawTextToTilemap
    db $01,$01
    dw $3C13

IndirectInstructions_EndingSmall_U:
    dw IndirectInstructionFunction_DrawTextToTilemap
    db $01,$01
    dw $3C14

IndirectInstructions_EndingSmall_Y:
    dw IndirectInstructionFunction_DrawTextToTilemap
    db $01,$01
    dw $3C18

IndirectInstructions_EndingSmall_Space:
    dw IndirectInstructionFunction_DrawTextToTilemap
    db $01,$01
    dw $207F


;;; $E1E9: Palettes - title screen ;;;
Palettes_TitleScreen:
    dw $0000,$02DF,$01D7,$00AC,$5EBB,$3DB3,$292E,$1486
    dw $48FB,$48FB,$7FFF,$0000,$7FFF,$44E5,$7FFF,$0000
    dw $1000,$0BB1,$1EA9,$0145,$5EBB,$3DB3,$292E,$1486
    dw $6318,$4A52,$318C,$0000,$6318,$02DF,$7FFF,$0000
    dw $1000,$7E20,$6560,$2060,$1000,$7940,$5D00,$4CA0
    dw $3CA0,$7FFF,$0113,$000F,$175C,$0299,$13FF,$0BB1
    dw $1000,$6BF5,$2E41,$2DA1,$2D01,$5E5F,$183F,$1014
    dw $080A,$0404,$4F9F,$3ED8,$2E12,$6F70,$7FFF,$5EE0
    dw $1000,$7C00,$5800,$3400,$1000,$6C00,$4800,$2400
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $1000,$3570,$24CB,$0402,$0401,$312E,$1889,$1026
    dw $0C04,$43FF,$0118,$0014,$16FF,$023E,$017B,$5EE0
    dw $1000,$72F2,$6A4D,$4524,$1400,$5E5F,$2C3F,$2414
    dw $1C0A,$6B5E,$4E78,$2991,$6A99,$4174,$400F,$0040
    dw $1000,$033B,$001F,$0174,$080A,$7FFF,$0D66,$00E2
    dw $0299,$0000,$0000,$0000,$0000,$0000,$7FFF,$0000
    dw $1000,$7FFF,$13FF,$131D,$121F,$093F,$00BF,$0017
    dw $0C8C,$7FFF,$7D80,$6F5A,$5AB5,$4A10,$354A,$1000
    dw $1000,$7FFF,$13FF,$131D,$121F,$093F,$00BF,$0017
    dw $0C8C,$001F,$2000,$6F5A,$5AB5,$4A10,$354A,$1000
    dw $1000,$7FFF,$13FF,$0F5F,$0EBF,$0A1F,$055F,$04BF
    dw $001F,$0018,$1032,$204C,$3066,$5AB5,$354A,$1000
    dw $1000,$6BF5,$2E41,$2DA1,$2D01,$5E5F,$183F,$1014
    dw $080A,$0404,$4F9F,$3ED8,$2E12,$6F70,$7FFF,$5EE0
    dw $1000,$7C00,$5800,$3400,$1000,$6C00,$4800,$2400
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $1000,$3570,$24CB,$0402,$0401,$312E,$1889,$1026
    dw $0C04,$43FF,$0118,$0014,$16FF,$023E,$017B,$5EE0
    dw $1000,$72F2,$6A4D,$4524,$1400,$5E5F,$2C3F,$2414
    dw $1C0A,$6B5E,$4E78,$2991,$0299,$0174,$000F,$0040
    dw $1000,$033B,$001F,$0174,$080A,$7FFF,$0D66,$00E2
    dw $0299,$0000,$0000,$0000,$0000,$0000,$7FFF,$0000


;;; $E3E9: Palettes - intro ;;;
Palettes_Intro:
    dw $0000,$03E0,$6318,$0340,$3BE0,$03E0,$6318,$0280
    dw $2680,$03E0,$6318,$0200,$1580,$03E0,$6318,$0160
    dw $0000

Palettes_Intro_nonExistentIntroText1:
    dw $7FFF

Palettes_Intro_nonExistentIntroText2:
    dw $0000

Palettes_Intro_nonExistentIntroText3:
    dw $294A,$7FFF,$6318,$294A,$6318,$6318,$6318,$6318
    dw $6318,$6318,$6318,$0000,$6318,$0000,$77FF,$677B
    dw $52D6,$4252,$2DAD,$1908,$10C6,$0884,$6318,$6318
    dw $6318,$6318,$6318,$6318,$0000,$0000,$1400,$15AA
    dw $0000,$5B80,$2501,$14A2,$568D,$3DC7,$14B8,$1840
    dw $3140,$1C42,$24A0,$146D,$1405,$0000,$6318,$6318
    dw $6318,$6318,$6318,$6318,$6318,$6318,$6318,$6318
    dw $6318,$6318,$6318,$6318,$6318,$0000,$6318,$6318
    dw $6318,$6318,$6318,$6318,$6318,$6318,$6318,$6318
    dw $6318,$6318,$6318,$6318,$6318,$0000,$6318,$6318
    dw $6318,$6318,$6318,$6318,$6318,$6318,$6318,$6318
    dw $6318,$6318,$6318,$6318,$6318,$0000,$77BD,$4252
    dw $18E7,$1084,$5318,$2DCE,$2529,$18C6,$5318,$2DEF
    dw $194A,$10C6,$77FF,$77FF,$0000,$3800,$7FFF,$7BDE
    dw $77BD,$739C,$7FFF,$7BDE,$77BD,$739C,$7FFF,$7BDE
    dw $77BD,$739C,$7FFF,$7BDE,$77BD,$3800,$5318,$2DCE
    dw $1929,$10C6,$5318,$2DCE,$1929,$10C6,$0404,$5318
    dw $2DCE,$1929,$5318,$77FF,$5318,$3800,$6318,$6318
    dw $6318,$6318,$6318,$6318,$6318,$6318,$6318,$6318
    dw $6318,$6318,$6318,$6318,$6318,$3800,$6318,$6318
    dw $6318,$6318,$6318,$6318,$6318,$6318,$6318,$6318
    dw $6318,$6318,$6318,$6318,$6318,$3800,$2DAD,$52D6
    dw $1084,$77FF,$2DAD,$677B,$52D6,$4252,$4252,$4252
    dw $1908,$4252,$1908,$2DAD,$1908,$3800,$77FF,$4294
    dw $2DCE,$1908,$4294,$2DCE,$1908,$4294,$2DCE,$1908
    dw $4294,$2DCE,$1908,$1084,$77FF

Palettes_Intro_CrossFade:
    dw $3800,$77FF,$677B,$52D6,$4252,$2DAD,$1908,$10C6
    dw $0884,$7C00,$5800,$3400,$1000,$03E0,$15C0,$0000

Palettes_Intro_MotherBrain:
    dw $3800,$77FF,$4252,$1084,$0842,$5739,$2DCE,$2108
    dw $14A5,$5318,$2DEF,$194A,$10C6,$77FF,$77FF,$0000


;;; $E5E9: Palettes - space/gunship/Ceres ;;;
Palettes_SpaceGunshipCeres:
    dw $0000,$7FFF,$6318,$294A,$6318,$6318,$6318,$6318
    dw $6318,$6318,$6318,$6318,$6318,$6318,$6318,$6318
    dw $1580,$6318,$6318,$6318,$6318,$6318,$6318,$6318
    dw $6318,$6318,$6318,$6318,$6318,$6318,$6318,$6318
    dw $1580,$6318,$6318,$6318,$6318,$6318,$6318,$6318
    dw $6318,$6318,$6318,$6318,$6318,$6318,$6318,$6318
    dw $1580,$6318,$6318,$6318,$6318,$6318,$6318,$6318
    dw $6318,$6318,$6318,$6318,$6318,$6318,$6318,$6318
    dw $1580,$373F,$2E9E,$2E3B,$25D8,$1D33,$14AE,$144A
    dw $0803,$7DFF,$6819,$5413,$340A,$2004,$1403,$0000
    dw $1580,$4BBE,$06B9,$00EA,$0000,$173A,$0276,$01F2
    dw $014D,$3BE0,$2680,$1580,$49EF,$3129,$20A5,$7FFF
    dw $1580,$631F,$56BB,$4E36,$41D2,$354D,$28E9,$2064
    dw $1400,$1580,$1580,$1580,$1580,$001F,$001F,$0000
    dw $1580,$233F,$1A9E,$1A3B,$11D8,$0933,$00AE,$004A
    dw $0001,$7DFF,$6819,$5413,$340A,$2004,$0404,$0000
    dw $3800,$7FFF,$6318,$294A,$6318,$6318,$6318,$6318
    dw $6318,$6318,$6318,$6318,$6318,$6318,$6318,$6318
    dw $3800,$6318,$6318,$6318,$6318,$6318,$6318,$6318
    dw $6318,$6318,$6318,$6318,$6318,$6318,$6318,$6318
    dw $3800,$6318,$6318,$6318,$6318,$6318,$6318,$6318
    dw $6318,$6318,$6318,$6318,$6318,$6318,$6318,$6318
    dw $3800,$6318,$6318,$6318,$6318,$6318,$6318,$6318
    dw $6318,$6318,$6318,$6318,$6318,$6318,$6318,$6318
    dw $3800,$373F,$2E9E,$2E3B,$25D8,$1D33,$14AE,$144A
    dw $0803,$7DFF,$6819,$5413,$340A,$2004,$1403,$0000
    dw $3800,$7F5A,$033B,$0216,$0113,$7C1D,$5814,$300A
    dw $3BE0,$2680,$1580,$5294,$39CE,$2108,$2484,$03E0
    dw $3800,$631F,$56BB,$4E36,$41D2,$354D,$28E9,$2064
    dw $1400,$1580,$1580,$1580,$1580,$001F,$001F,$0000
    dw $3800,$233F,$1A9E,$1A3B,$11D8,$0933,$00AE,$004A
    dw $0001,$7F20,$75A0,$5500,$3840,$2020,$0404,$0000


;;; $E7E9: Palettes - post-credits ;;;
Palettes_PostCredits:
    dw $0420,$7FFF,$7FFF,$7FFF,$7FFF,$03E0,$001F,$7C00
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF
    dw $2003,$02FF,$0217,$0150,$0089,$5F9F,$3A9F,$2A19
    dw $1DB4,$114F,$090B,$0457,$4E73,$3106,$24A3,$0842
    dw $2003,$00CE,$421F,$1405,$3BE0,$21A8,$579F,$4AD2
    dw $3A4E,$00BB,$5914,$30AA,$0216,$1104,$0074,$000D
    dw $0000,$701C,$0C03,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$061F,$0063,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$7FDF,$7319,$5A32,$51AD,$4529,$3884,$2C00
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$039C,$00C6,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$4380,$0060,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $3800,$7FFF,$6F7B,$5AD6,$4A52,$35AD,$2529,$1084
    dw $0C20,$0420,$0420,$0420,$0420,$0420,$0420,$0420
    dw $3800,$0420,$0420,$0420,$0420,$7E3F,$5816,$300A
    dw $3BE0,$2680,$1580,$5294,$39CE,$2108,$2484,$7C1F
    dw $3800,$0420,$0420,$0420,$0420,$0420,$0420,$0420
    dw $0420,$0420,$0420,$0420,$0420,$0420,$0420,$0420
    dw $3800,$0420,$0420,$0420,$0420,$0420,$0420,$0420
    dw $0420,$0420,$0420,$0420,$0420,$0420,$0420,$0420
    dw $3800,$7F5A,$033B,$0216,$0113,$7FE0,$7E00,$7CA0
    dw $3BE0,$2680,$1580,$5294,$39CE,$2108,$2484,$7EA0
    dw $3800,$02FF,$0217,$0150,$0089,$5F9F,$3A9F,$2A19
    dw $1DB4,$114F,$090B,$0457,$4E73,$3106,$24A3,$0842
    dw $3800,$00CE,$421F,$1405,$3BE0,$21A8,$579F,$4AD2
    dw $3A4E,$00BB,$5914,$30AA,$0216,$1104,$0074,$000D
    dw $3800,$28E7,$76F7,$1405,$63E0,$28E7,$579F,$66D6
    dw $4D8C,$62B5,$454A,$1C84,$6273,$28E7,$354A,$1C84


;;; $E9E9: Palettes - credits ;;;
Palettes_Credits:
    dw $0000,$739C,$28C6,$6318,$6318,$6318,$6318,$6318
    dw $6318,$6318,$6318,$6318,$6318,$6318,$6318,$6318
    dw $0000,$039C,$00C6,$6318,$6318,$6318,$6318,$6318
    dw $6318,$6318,$6318,$6318,$6318,$6318,$6318,$6318
    dw $0000,$7380,$0C60,$6318,$6318,$6318,$6318,$6318
    dw $6318,$6318,$6318,$6318,$6318,$6318,$6318,$6318
    dw $0000,$4380,$0060,$6318,$6318,$6318,$6318,$6318
    dw $6318,$6318,$6318,$6318,$6318,$6318,$6318,$6318
    dw $0000,$701C,$0C03,$6318,$6318,$6318,$6318,$6318
    dw $6318,$6318,$6318,$6318,$6318,$6318,$6318,$6318
    dw $0000,$7E00,$0420,$6318,$6318,$6318,$6318,$6318
    dw $6318,$6318,$6318,$6318,$6318,$6318,$6318,$6318
    dw $0000,$061F,$0063,$6318,$6318,$6318,$6318,$6318
    dw $6318,$6318,$6318,$6318,$6318,$6318,$6318,$6318
    dw $0000,$7D34,$0C03,$6318,$6318,$6318,$6318,$6318
    dw $6318,$6318,$6318,$6318,$6318,$6318,$6318,$6318
    dw $3800,$7FFF,$7BDE,$77BD,$739C,$7FFF,$7BDE,$77BD
    dw $739C,$7FFF,$7BDE,$77BD,$739C,$7FFF,$7BDE,$77BD
    dw $3800,$5318,$2DCE,$1929,$10C6,$5318,$2DCE,$1929
    dw $10C6,$0404,$5318,$2DCE,$1929,$5318,$77FF,$5318
    dw $3800,$6318,$6318,$6318,$6318,$6318,$6318,$6318
    dw $6318,$6318,$6318,$6318,$6318,$6318,$6318,$6318
    dw $3800,$6318,$6318,$6318,$6318,$6318,$6318,$6318
    dw $6318,$6318,$6318,$6318,$6318,$6318,$6318,$6318
    dw $3800,$2DAD,$52D6,$1084,$77FF,$2DAD,$677B,$52D6
    dw $4252,$4252,$4252,$1908,$4252,$1908,$2DAD,$1908
    dw $3800,$77FF,$4294,$2DCE,$1908,$4294,$2DCE,$1908
    dw $4294,$2DCE,$1908,$4294,$2DCE,$1908,$1084,$77FF
    dw $3800,$77FF,$677B,$52D6,$4252,$2DAD,$1908,$10C6
    dw $0884,$7C00,$5800,$3400,$1000,$03E0,$15C0,$0000
    dw $3800,$77FF,$4252,$1084,$0842,$5739,$2DCE,$2108
    dw $14A5,$5318,$2DEF,$194A,$10C6,$77FF,$77FF,$0000


;;; $EBE9: Palettes - Zebes explosion scene ;;;
Palettes_ZebesExplosionScene:
    dw $0000,$7FFF,$77BD,$6F7B,$6318,$5AD6,$5294,$4A52
    dw $4210,$35AD,$2D6B,$2529,$1CE7,$14A5,$0842,$0000
    dw $1580,$7FFF,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $1580,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $1580,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $1580,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0800
    dw $1580,$4BBE,$06B9,$00EA,$0000,$173A,$0276,$01F2
    dw $014D,$3BE0,$2680,$1580,$49EF,$3129,$20A5,$7FFF
    dw $1580,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0800
    dw $1580,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0800
    dw $3800,$7FFF,$2108,$3DEF,$3DEF,$3DEF,$3DEF,$3DEF
    dw $3DEF,$3DEF,$3DEF,$3DEF,$3DEF,$3DEF,$3DEF,$3DEF
    dw $3800,$039C,$00C6,$3DEF,$3DEF,$3DEF,$3DEF,$3DEF
    dw $3DEF,$3DEF,$3DEF,$3DEF,$3DEF,$3DEF,$3DEF,$3DEF
    dw $3800,$4380,$0060,$3DEF,$3DEF,$3DEF,$3DEF,$3DEF
    dw $3DEF,$3DEF,$3DEF,$3DEF,$3DEF,$3DEF,$3DEF,$3DEF
    dw $3800,$3DEF,$3DEF,$3DEF,$3DEF,$3DEF,$3DEF,$3DEF
    dw $3DEF,$3DEF,$3DEF,$3DEF,$3DEF,$3DEF,$3DEF,$3DEF
    dw $3800,$3DEF,$3DEF,$3DEF,$3DEF,$3DEF,$3DEF,$3DEF
    dw $3DEF,$3DEF,$3DEF,$3DEF,$3DEF,$3DEF,$3DEF,$3DEF
    dw $3800,$029F,$017D,$0055,$0010,$000A,$0005,$0000
    dw $0001,$2108,$35AD,$4631,$5AD6,$6B5A,$0000,$0000
    dw $3800,$6B9C,$5EBB,$45B8,$3D58,$2CD4,$408F,$288A
    dw $1C47,$4E73,$4E73,$0800,$4E73,$2003,$1002,$0800
    dw $3800,$233F,$1A9E,$1A3B,$11D8,$0933,$00AE,$004A
    dw $0001,$7DFF,$6819,$5413,$340A,$2004,$1403,$0000


;;; $EDE9: Palettes - cloud sprites in Zebes explosion scene ;;;
Palettes_CloudSpritesInZebesExplosionScene:
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $2823,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $2823,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $2823,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $2823,$0864,$0884,$0CA6,$10C7,$0CC8,$0D07,$0D0A
    dw $0CEC,$0D2C,$112C,$118E,$0D70,$11F4,$1633,$1698
    dw $2823,$0842,$0C63,$1084,$14A5,$18C6,$1CE7,$2108
    dw $2529,$2D6B,$318C,$39CE,$4631,$4A52,$5294,$6318
    dw $2823,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $2823,$233F,$1A9E,$1A3B,$11D8,$0933,$00AE,$004A
    dw $0001,$7DFF,$6819,$5413,$340A,$2004,$0404,$0000
    dw $3800,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $3800,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $3800,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $3800,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $3800,$0023,$0465,$0CA7,$10E9,$190A,$1D4C,$258E
    dw $29D0,$3212,$3654,$3E96,$42B7,$46F9,$4F3B,$537D
    dw $3800,$0CA7,$10E9,$190A,$1D4C,$258D,$29CF,$2DF1
    dw $3632,$3A74,$4295,$46D7,$4B19,$535A,$577C,$5BBD
    dw $3800,$0842,$0C63,$1084,$14A5,$18C6,$1CE7,$2108
    dw $2529,$2D6B,$318C,$39CE,$4631,$4A52,$5294,$6318
    dw $3800,$233F,$1A9E,$1A3B,$11D8,$0933,$00AE,$004A
    dw $0001,$7DFF,$6819,$5413,$340A,$2004,$1403,$0000


;;; $EFE9: Palettes - ending Super Metroid icon fading to grey - sprite palettes ;;;
Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_0:
    dw $0000,$013F,$0030,$0005,$025F,$00F2,$0029,$035F
    dw $0192,$0089,$7BE0,$7980,$4400,$43FF,$03FF

Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_1:
    dw $1C84,$0000,$011D,$002F,$0004,$021D,$00D0,$0028
    dw $031D,$0170,$0068,$73A0,$7160,$3C00,$3FBD,$03BD

Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_2:
    dw $1863,$0000,$00FA,$000D,$0004,$01FA,$00CF,$0007
    dw $02DA,$014F,$0067,$6B40,$6940,$3800,$375A,$035A

Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_3:
    dw $1863,$0000,$00F8,$000C,$0004,$01D8,$00AE,$0007
    dw $0298,$012E,$0067,$6300,$6120,$3400,$3318,$0318

Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_4:
    dw $1463,$0000,$00D6,$000B,$0003,$01B6,$00AD,$0006
    dw $0276,$010D,$0066,$5AC0,$5900,$3000,$2ED6,$02D6

Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_5:
    dw $1463,$0000,$00D4,$000A,$0003,$0194,$008C,$0006
    dw $0234,$010C,$0046,$5280,$5100,$2C00,$2A94,$0294

Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_6:
    dw $1042,$0000,$00B2,$0009,$0003,$0152,$008A,$0005
    dw $01F2,$00EA,$0045,$4A40,$48E0,$2800,$2652,$0252

Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_7:
    dw $1042,$0000,$0090,$0008,$0002,$0130,$0069,$0004
    dw $01B0,$00C9,$0044,$4200,$40C0,$2400,$2210,$0210

Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_8:
    dw $0C42,$0000,$008E,$0007,$0002,$010E,$0068,$0004
    dw $018E,$00A8,$0024,$39C0,$38A0,$2000,$1DCE,$01CE

Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_9:
    dw $0C21,$0000,$006C,$0006,$0002,$00EC,$0047,$0003
    dw $014C,$0087,$0023,$3180,$3080,$1800,$198C,$018C

Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_A:
    dw $0821,$0000,$006A,$0005,$0001,$00CA,$0046,$0003
    dw $010A,$0086,$0023,$2940,$2880,$1400,$154A,$014A

Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_B:
    dw $0821,$0000,$0048,$0004,$0001,$0088,$0024,$0002
    dw $00E8,$0064,$0022,$2100,$2060,$1000,$1108,$0108

Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_C:
    dw $0421,$0000,$0026,$0003,$0001,$0066,$0023,$0001
    dw $00A6,$0043,$0001,$18C0,$1840,$0C00,$0CC6,$00C6

Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_D:
    dw $0400,$0000,$0024,$0002,$0000,$0044,$0022,$0001
    dw $0064,$0022,$0001,$1080,$1020,$0800,$0884,$0084

Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_E:
    dw $0400,$0000,$0002,$0001,$0000,$0022,$0001,$0000
    dw $0022,$0001,$0000,$0840,$0800,$0400,$0442,$0042

Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_F:
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_10:
    dw $0000


;;; $F1E9: Palettes - ending Super Metroid icon fading to grey - BG palettes ;;;
; This table is read from the bottom upwards
Palettes_EndingSuperMetroidIconFadingToGrey_BG_0:
    dw $0000,$6B5A,$5EF7,$5294,$4631,$35AD,$294A,$1CE7
    dw $1084,$0000,$0000,$0000,$0000,$0000,$0000

Palettes_EndingSuperMetroidIconFadingToGrey_BG_1:
    dw $0000,$0000,$6318,$56B5,$4A52,$3DEF,$318C,$2529
    dw $18C6,$0C63,$0000,$0000,$0000,$0000,$0000,$0000

Palettes_EndingSuperMetroidIconFadingToGrey_BG_2:
    dw $0000,$0000,$5AD6,$5294,$4631,$39CE,$2D6B,$2108
    dw $18C6,$0C63,$0000,$0000,$0000,$0000,$0000,$0000

Palettes_EndingSuperMetroidIconFadingToGrey_BG_3:
    dw $0000,$0000,$5294,$4A52,$4210,$35AD,$294A,$2108
    dw $14A5,$0C63,$0000,$0000,$0000,$0000,$0000,$0000

Palettes_EndingSuperMetroidIconFadingToGrey_BG_4:
    dw $0000,$0000,$4E73,$4210,$39CE,$318C,$2529,$1CE7
    dw $14A5,$0C63,$0000,$0000,$0000,$0000,$0000,$0000

Palettes_EndingSuperMetroidIconFadingToGrey_BG_5:
    dw $0000,$0000,$4631,$3DEF,$35AD,$2D6B,$2108,$18C6
    dw $1084,$0842,$0000,$0000,$0000,$0000,$0000,$0000

Palettes_EndingSuperMetroidIconFadingToGrey_BG_6:
    dw $0000,$0000,$3DEF,$35AD,$318C,$294A,$1CE7,$18C6
    dw $1084,$0842,$0000,$0000,$0000,$0000,$0000,$0000

Palettes_EndingSuperMetroidIconFadingToGrey_BG_7:
    dw $0000,$0000,$35AD,$318C,$294A,$2529,$1CE7,$14A5
    dw $0C63,$0842,$0000,$0000,$0000,$0000,$0000,$0000

Palettes_EndingSuperMetroidIconFadingToGrey_BG_8:
    dw $0000,$0000,$318C,$294A,$2529,$2108,$18C6,$1084
    dw $0C63,$0421,$0000,$0000,$0000,$0000,$0000,$0000

Palettes_EndingSuperMetroidIconFadingToGrey_BG_9:
    dw $0000,$0000,$294A,$2529,$2108,$18C6,$14A5,$1084
    dw $0842,$0421,$0000,$0000,$0000,$0000,$0000,$0000

Palettes_EndingSuperMetroidIconFadingToGrey_BG_A:
    dw $0000,$0000,$2108,$1CE7,$18C6,$14A5,$1084,$0C63
    dw $0842,$0421,$0000,$0000,$0000,$0000,$0000,$0000

Palettes_EndingSuperMetroidIconFadingToGrey_BG_B:
    dw $0000,$0000,$1CE7,$18C6,$14A5,$1084,$0C63,$0842
    dw $0421,$0421,$0000,$0000,$0000,$0000,$0000,$0000

Palettes_EndingSuperMetroidIconFadingToGrey_BG_C:
    dw $0000,$0000,$14A5,$1084,$1084,$0C63,$0842,$0842
    dw $0421,$0000,$0000,$0000,$0000,$0000,$0000,$0000

Palettes_EndingSuperMetroidIconFadingToGrey_BG_D:
    dw $0000,$0000,$0C63,$0C63,$0842,$0842,$0421,$0421
    dw $0421,$0000,$0000,$0000,$0000,$0000,$0000,$0000

Palettes_EndingSuperMetroidIconFadingToGrey_BG_E:
    dw $0000,$0000,$0421,$0421,$0421,$0421,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

Palettes_EndingSuperMetroidIconFadingToGrey_BG_F:
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

Palettes_EndingSuperMetroidIconFadingToGrey_BG_10:
    dw $0000


Freespace_Bank8C_F3E9:
; $C17 bytes
