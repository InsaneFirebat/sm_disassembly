
lorom
math pri on

; -------------
; Build options
; -------------

; Defaults will build vanilla Super Metroid.sfc

!FEATURE_KEEP_UNREFERENCED ?= 1

if !FEATURE_KEEP_UNREFERENCED
    print "KEEP UNREFERENCED ASSEMBLY"
else
    print "REMOVE UNREFERENCED ASSEMBLY"
endif

; Fixes labels to their vanilla asm locations using the %anchor macros. Useful
; to prevent unrelated things from moving around, which would bloat IPS patches
; or break pointers in SMART for example.
!ANCHOR_LABELS ?= 1

incsrc "macros.asm"
incsrc "bank_80.asm"
incsrc "bank_81.asm"
incsrc "bank_82.asm"
incsrc "bank_83.asm"
incsrc "bank_84.asm"
incsrc "bank_85.asm"
incsrc "bank_86.asm"
incsrc "bank_87.asm"
incsrc "bank_88.asm"
incsrc "bank_89.asm"
incsrc "bank_8A.asm"
incsrc "bank_8B.asm"
incsrc "bank_8C.asm"
incsrc "bank_8D.asm"
incsrc "bank_8E.asm"
incsrc "bank_8F.asm"
incsrc "bank_90.asm"
incsrc "bank_91.asm"
incsrc "bank_92.asm"
incsrc "bank_93.asm"
incsrc "bank_94.asm"
incsrc "bank_94..99.asm"
incsrc "bank_9A.asm"
incsrc "bank_9B.asm"
incsrc "bank_9C.asm"
incsrc "bank_9D.asm"
incsrc "bank_9E.asm"
incsrc "bank_9F.asm"
incsrc "bank_A0.asm"
incsrc "bank_A1.asm"
incsrc "bank_A2.asm"
incsrc "bank_A3.asm"
incsrc "bank_A4.asm"
incsrc "bank_A5.asm"
incsrc "bank_A6.asm"
incsrc "bank_A7.asm"
incsrc "bank_A8.asm"
incsrc "bank_A9.asm"
incsrc "bank_AA.asm"
incsrc "bank_AB.asm"
incsrc "bank_AC.asm"
incsrc "bank_AD.asm"
incsrc "bank_AE.asm"
incsrc "bank_AF.asm"
incsrc "bank_B0.asm"
incsrc "bank_B1.asm"
incsrc "bank_B2.asm"
incsrc "bank_B3.asm"
incsrc "bank_B4.asm"
incsrc "bank_B5.asm"
incsrc "bank_B6.asm"
incsrc "bank_B7.asm"
incsrc "bank_B8.asm"
incsrc "bank_B9..CE.asm"
incsrc "bank_CF..DE.asm"
incsrc "bank_DF.asm"
incsrc "constants.asm"
incsrc "structs.asm"

print "Assembly complete. Total bytes written: ", bytes
