
org $9B8000


;;; $8000: Tiles - Samus death sequence ;;;
Tiles_SamusDeathSequence:
incbin "../data/Tiles_SamusDeathSequence.bin" ; $1400 bytes


;;; $9400: Samus palettes ;;;
SamusPalettes_PowerSuit:
    dw $3800,$0108,$03BD,$1405,$3BE0,$21A8,$579F,$4AD2
    dw $3A4E,$00BB,$02B5,$016B,$0252,$1104,$0074,$000D

SamusPalettes_DeathSequence_YellowFlash:
    dw $03FF,$03FF,$03FF,$03FF,$03FF,$03FF,$03FF,$03FF
    dw $03FF,$03FF,$03FF,$03FF,$03FF,$03FF,$03FF,$03FF

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusPalettes_9B9440:
    dw $3800,$02FF,$0217,$0150,$0089,$00BB,$3A9F,$2A19
    dw $1DB4,$114F,$090B,$3BE0,$033F,$021B,$010E,$0074

UNUSED_SamusPalettes_9B9460:
    dw $3800,$1B1F,$1A78,$19D3,$192D,$155B,$46DF,$3A7A
    dw $2E16,$25D2,$1D8E,$5FE0,$13BF,$129B,$0192,$00F8

UNUSED_SamusPalettes_9B9480:
    dw $3800,$3B5F,$3AFA,$3A77,$3A13,$21BB,$573F,$4EFB
    dw $4AB9,$4276,$3E54,$6FE8,$13FF,$231B,$0216,$017C

UNUSED_SamusPalettes_9B94A0:
    dw $3800,$5B9F,$5B7C,$5B3B,$5AF8,$365B,$6B7F,$677D
    dw $635B,$5F3A,$5B19,$7FF4,$53FF,$339F,$333F,$2A9F

UNUSED_SamusPalettes_9B94C0:
    dw $3800,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF

UNUSED_SamusPalettes_9B94E0:
    dw $7D00,$7D00,$7D00,$7D00,$7D00,$7D00,$7D00,$7D00
    dw $7D00,$7D00,$7D00,$7D00,$7D00,$7D00,$7D00,$7D00

UNUSED_SamusPalettes_9B9500:
; Used by unused routine UNUSED_SetSamusPaletteToSolidWhite_91DD4C, test palette perhaps
    dw $3800,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF
endif ; !FEATURE_KEEP_UNREFERENCED

SamusPalettes_VariaSuit:
    dw $0000,$0108,$02FF,$1405,$3BE0,$21A8,$579F,$4AD2
    dw $3A4E,$00BB,$01BE,$008E,$0252,$1104,$0074,$000D

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusPalettes_9B9540:
    dw $14E0,$00CE,$421F,$1405,$3BE0,$21A8,$579F,$4AD2
    dw $3A4E,$00BB,$5914,$30AA,$0216,$1104,$0074,$000D

UNUSED_SamusPalettes_9B9560:
    dw $2003,$28CE,$6E1F,$3C05,$63E0,$49A8,$7F9F,$72D2
    dw $624E,$28BB,$7D14,$58AA,$2A16,$3904,$2874,$280D

UNUSED_SamusPalettes_9B9580:
    dw $2003,$516E,$7EBF,$64A5,$7FE0,$7248,$7FFF,$7F72
    dw $7EEE,$555B,$7DB4,$7D4A,$52B6,$61A4,$5114,$50AD

UNUSED_SamusPalettes_9B95A0:
    dw $0000,$52AE,$7FFF,$65E5,$7FE0,$7388,$7FFF,$7FF2
    dw $7FEE,$569B,$7EF4,$7E8A,$53F6,$62E4,$5254,$51ED

UNUSED_SamusPalettes_9B95C0:
    dw $3800,$00CE,$421F,$1405,$3BE0,$21A8,$579F,$4AD2
    dw $3A4E,$00BB,$5914,$30AA,$0216,$1104,$0074,$000D

UNUSED_SamusPalettes_9B95E0:
    dw $3800,$1618,$575F,$294F,$4FEA,$36F2,$6BFF,$5FFC
    dw $4798,$15FF,$6E5E,$45F4,$175F,$264E,$15BE,$1557

UNUSED_SamusPalettes_9B9600:
    dw $3800,$02DE,$43FF,$1615,$3BF0,$23B8,$57FF,$4BFF
    dw $3BFE,$02BF,$5B1F,$32BA,$03FF,$1314,$027F,$021D

UNUSED_SamusPalettes_9B9620:
    dw $3800,$2BFF,$6BFF,$3F5F,$63FA,$4BFF,$7FFF,$73FF
    dw $63FF,$2BFF,$7FFF,$5BFF,$2BFF,$3BFE,$2BBF,$2B5F

UNUSED_SamusPalettes_9B9640:
    dw $3800,$00CE,$421F,$1405,$3BE0,$21A8,$579F,$4AD2
    dw $3A4E,$00BB,$5914,$30AA,$0216,$1104,$0074,$000D

UNUSED_SamusPalettes_9B9660:
    dw $3800,$020E,$435F,$1545,$43E0,$22E8,$57FF,$4BF2
    dw $3B8E,$01FB,$5A54,$31EA,$0356,$1244,$01B4,$014D

UNUSED_SamusPalettes_9B9680:
    dw $3800,$034E,$43FF,$1685,$4FE0,$23E8,$57FF,$4BF2
    dw $3BEE,$033B,$5B94,$332A,$03F6,$1384,$02F4,$028D

UNUSED_SamusPalettes_9B96A0:
    dw $3800,$2BEE,$6BFF,$3FC5,$63E0,$4BE8,$7FFF,$73F2
    dw $63EE,$2BFB,$7FF4,$5BEA,$2BF6,$3BE4,$2BF4,$2BED
endif ; !FEATURE_KEEP_UNREFERENCED

SamusPalettes_CrystalFlash_0:
; Crystal flash Samus. Colours 0..9 = Samus colours, Ah..Fh = bubble colours
; These two parts are loaded independently / asynchronously
    dw $3800,$4210,$4210,$4210,$4210,$4210,$4210,$4210
    dw $4210,$4210

SamusPalettes_CrystalFlash_0_bubble:
    dw $7FFF,$7BDF,$77BF,$6F7F,$6B5F,$673F

SamusPalettes_CrystalFlash_1:
    dw $3800,$4E73,$4E73,$4E73,$4E73,$4E73,$4E73,$4E73
    dw $4E73,$4E73

SamusPalettes_CrystalFlash_1_bubble:
    dw $673F,$7FFF,$7BDF,$77BF,$6F7F,$6B5F

SamusPalettes_CrystalFlash_2:
    dw $3800,$5EF7,$5EF7,$5EF7,$5EF7,$5EF7,$5EF7,$5EF7
    dw $5EF7,$5EF7

SamusPalettes_CrystalFlash_2_bubble:
    dw $6B5F,$673F,$7FFF,$7BDF,$77BF,$6F7F

SamusPalettes_CrystalFlash_3:
    dw $3800,$6F7B,$6F7B,$6F7B,$6F7B,$6F7B,$6F7B,$6F7B
    dw $6F7B,$6F7B

SamusPalettes_CrystalFlash_3_bubble:
    dw $6F7F,$6B5F,$673F,$7FFF,$7BDF,$77BF

SamusPalettes_CrystalFlash_4:
    dw $3800,$5EF7,$5EF7,$5EF7,$5EF7,$5EF7,$5EF7,$5EF7
    dw $5EF7,$5EF7

SamusPalettes_CrystalFlash_4_bubble:
    dw $77BF,$6F7F,$6B5F,$673F,$7FFF,$7BDF

SamusPalettes_CrystalFlash_5:
    dw $3800,$4E73,$4E73,$4E73,$4E73,$4E73,$4E73,$4E73
    dw $4E73,$4E73

SamusPalettes_CrystalFlash_5_bubble:
    dw $7FFF,$77BF,$6F7F,$6B5F,$673F,$7FFF

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusPalettes_9B9780:
    dw $0000,$00CE,$421F,$1405,$3BE0,$21A8,$579F,$4AD2
    dw $3A4E,$00BB,$5914,$30AA,$0216,$1104,$0074,$000D

UNUSED_SamusPalettes_9B97A0:
    dw $0000,$21D6,$56BF,$28AA,$4FE5,$364D,$63BF,$5B36
    dw $52D4,$155C,$65B8,$454F,$16B9,$25A9,$1518,$14B2

UNUSED_SamusPalettes_9B97C0:
    dw $0000,$2E39,$6B5F,$4170,$67EB,$4F13,$73DF,$6F9B
    dw $6779,$2E1E,$727B,$5E15,$2F5C,$3E6F,$2DDB,$2D78

UNUSED_SamusPalettes_9B97E0:
    dw $0000,$42DE,$7FFF,$5615,$7BF0,$63B8,$7FFF,$7FFF
    dw $7BFE,$42BF,$7F1F,$72BA,$43FF,$5314,$427F,$421D
endif ; !FEATURE_KEEP_UNREFERENCED

SamusPalettes_GravitySuit:
    dw $3800,$0108,$421F,$1405,$3BE0,$21A8,$579F,$4AD2
    dw $3A4E,$00BB,$5914,$30AA,$0274,$1104,$0074,$000D

SamusPalettes_PowerSuit_DeathSequence_BeamCharging_0:
; Power suit - death sequence (eight frames) / beam charging (first four frames)
    dw $0000,$0108,$03BD,$1405,$3BE0,$21A8,$579F,$4AD2
    dw $3A4E,$00BB,$02B5,$016B,$0252,$1104,$0074,$000D

SamusPalettes_PowerSuit_DeathSequence_BeamCharging_1:
    dw $0C63,$0D4A,$0FBD,$2068,$43E3,$29EA,$5B9F,$4EF3
    dw $4270,$0D1B,$0ED6,$0DAD,$0E73,$1D47,$0CD5,$0C6F

SamusPalettes_PowerSuit_DeathSequence_BeamCharging_2:
    dw $1CE7,$1DAD,$1FBD,$2CEB,$4BE7,$362D,$5F9F,$5715
    dw $4AB2,$1D7C,$1EF7,$1E10,$1EB5,$29AA,$1D56,$1CF1

SamusPalettes_PowerSuit_DeathSequence_BeamCharging_3:
    dw $2D6B,$2E10,$2FBD,$396E,$53EB,$4270,$63BF,$5B36
    dw $52D4,$2DDC,$2F18,$2E52,$2ED6,$3A0E,$2DB8,$2D73

SamusPalettes_PowerSuit_DeathSequence_4:
    dw $3DEF,$3E73,$3FDE,$49F2,$5BEF,$4ED3,$6BBF,$6358
    dw $5B16,$3E5D,$3F5A,$3EB5,$3F18,$4671,$3E39,$3DF6

SamusPalettes_PowerSuit_DeathSequence_5:
    dw $4E73,$4ED6,$4FDE,$5675,$63F3,$5B16,$6FBF,$6B7A
    dw $6358,$4EBD,$4F7B,$4EF7,$4F5A,$52D4,$4E9A,$4E78

SamusPalettes_PowerSuit_DeathSequence_6:
    dw $5EF7,$5F39,$5FDE,$62F8,$6BF7,$6759,$73DF,$6F9B
    dw $6B7A,$5F1E,$5F9C,$5F5A,$5F7B,$6338,$5F1C,$5EFA

SamusPalettes_PowerSuit_DeathSequence_7:
    dw $6F7B,$6F9C,$6FDE,$6F7B,$73FB,$739C,$77DF,$77BD
    dw $73BC,$6F7E,$6FBD,$6F9C,$6FBD,$6F9B,$6F7D,$6F7C

SamusPalettes_VariaSuit_DeathSequence_BeamCharging_0:
; Varia suit - death sequence (eight frames) / beam charging (first four frames)
    dw $0000,$0108,$02FF,$1405,$3BE0,$21A8,$579F,$4AD2
    dw $3A4E,$00BB,$01BE,$008E,$0252,$1104,$0074,$000D

SamusPalettes_VariaSuit_DeathSequence_BeamCharging_1:
    dw $0C63,$0D4A,$0F1F,$2068,$43E3,$29EA,$5B9F,$4EF3
    dw $4270,$0D1B,$0DFE,$0CF0,$0E73,$1D47,$0CD5,$0C6F

SamusPalettes_VariaSuit_DeathSequence_BeamCharging_2:
    dw $1CE7,$1DAD,$1F3F,$2CEB,$4BE7,$362D,$5F9F,$5715
    dw $4AB2,$1D7C,$1E3E,$1D52,$1EB5,$29AA,$1D56,$1CF1

SamusPalettes_VariaSuit_DeathSequence_BeamCharging_3:
    dw $2D6B,$2E10,$2F5F,$396E,$53EB,$4270,$63BF,$5B36
    dw $52D4,$2DDC,$2E7E,$2DD4,$2ED6,$3A0E,$2DB8,$2D73

SamusPalettes_VariaSuit_DeathSequence_4:
    dw $3DEF,$3E73,$3F7F,$49F2,$5BEF,$4ED3,$6BBF,$6358
    dw $5B16,$3E5D,$3EDE,$3E36,$3F18,$4671,$3E39,$3DF6

SamusPalettes_VariaSuit_DeathSequence_5:
    dw $4E73,$4ED6,$4F9F,$5675,$63F3,$5B16,$6FBF,$6B7A
    dw $6358,$4EBD,$4F1E,$4E98,$4F5A,$52D4,$4E9A,$4E78

SamusPalettes_VariaSuit_DeathSequence_6:
    dw $5EF7,$5F39,$5FBF,$62F8,$6BF7,$6759,$73DF,$6F9B
    dw $6B7A,$5F1E,$5F5E,$5F1A,$5F7B,$6338,$5F1C,$5EFA

SamusPalettes_VariaSuit_DeathSequence_7:
    dw $6F7B,$6F9C,$6FDF,$6F7B,$73FB,$739C,$77DF,$77BD
    dw $73BC,$6F7E,$6F9E,$6F7C,$6FBD,$6F9B,$6F7D,$6F7C

SamusPalettes_GravitySuit_DeathSequence_BeamCharging_0:
; Gravity suit - death sequence (eight frames) / beam charging (first four frames)
    dw $14E0,$00CE,$421F,$1405,$3BE0,$21A8,$579F,$4AD2
    dw $3A4E,$00BB,$5914,$30AA,$0216,$1104,$0074,$000D

SamusPalettes_GravitySuit_DeathSequence_BeamCharging_1:
    dw $2143,$0D30,$463F,$2068,$43E3,$29EA,$5B9F,$4EF3
    dw $4270,$0D1B,$5D55,$390C,$0E37,$1D47,$0CD5,$0C6F

SamusPalettes_GravitySuit_DeathSequence_BeamCharging_2:
    dw $2DA7,$1D92,$4E7F,$2CEB,$4BE7,$362D,$5F9F,$5715
    dw $4AB2,$1D7C,$61B6,$416F,$1E78,$29AA,$1D56,$1CF1

SamusPalettes_GravitySuit_DeathSequence_BeamCharging_3:
    dw $3A0B,$2DF4,$56BF,$396E,$53EB,$4270,$63BF,$5B36
    dw $52D4,$2DDC,$6618,$4DD1,$2EB9,$3A0E,$2DB8,$2D73

SamusPalettes_GravitySuit_DeathSequence_4:
    dw $4A6F,$3E56,$5EFF,$49F2,$5BEF,$4ED3,$6BBF,$6358
    dw $5B16,$3E5D,$6A79,$5654,$3EFA,$4671,$3E39,$3DF6

SamusPalettes_GravitySuit_DeathSequence_5:
    dw $56D3,$4EB8,$673F,$5675,$63F3,$5B16,$6FBF,$6B7A
    dw $6358,$4EBD,$6EDA,$5EB7,$4F3B,$52D4,$4E9A,$4E78

SamusPalettes_GravitySuit_DeathSequence_6:
    dw $6337,$5F1A,$6F7F,$62F8,$6BF7,$6759,$73DF,$6F9B
    dw $6B7A,$5F1E,$733C,$6B19,$5F7C,$6338,$5F1C,$5EFA

SamusPalettes_GravitySuit_DeathSequence_7:
    dw $6F9B,$6F7C,$77BF,$6F7B,$73FB,$739C,$77DF,$77BD
    dw $73BC,$6F7E,$779D,$737C,$6FBD,$6F9B,$6F7D,$6F7C

SamusPalettes_PowerSuit_SpeedBoosting_BabyMetroidDrain_0:
; SamusPalettes_PowerSuit_SpeedBoosting_BabyMetroidDrain_3 also used for metroid drain blue
    dw $0000,$0108,$03BD,$1405,$3BE0,$21A8,$579F,$4AD2
    dw $3A4E,$00BB,$02B5,$016B,$0252,$1104,$0074,$000D

SamusPalettes_PowerSuit_SpeedBoosting_BabyMetroidDrain_1:
    dw $2003,$28CE,$37BD,$3C05,$63E0,$49A8,$7F9F,$72D2
    dw $624E,$28BB,$36B5,$356B,$2A16,$3904,$2874,$280D

SamusPalettes_PowerSuit_SpeedBoosting_BabyMetroidDrain_2:
    dw $2003,$516E,$4BBD,$64A5,$7FE0,$7248,$7FFF,$7F72
    dw $7EEE,$555B,$4AB5,$496B,$52B6,$61A4,$5114,$50AD

SamusPalettes_PowerSuit_SpeedBoosting_BabyMetroidDrain_3:
    dw $0000,$52AE,$5FBD,$65E5,$7FE0,$7388,$7FFF,$7FF2
    dw $7FEE,$569B,$5F55,$5E0B,$53F6,$62E4,$5254,$51ED

SamusPalettes_PowerSuit_SpeedBoosterShine_0:
    dw $0000,$0108,$03BD,$1405,$3BE0,$21A8,$579F,$4AD2
    dw $3A4E,$00BB,$02B5,$016B,$0252,$1104,$0074,$000D

SamusPalettes_PowerSuit_SpeedBoosterShine_1:
    dw $0000,$1DAD,$1FBD,$2CEB,$4BE7,$362D,$5F9F,$5715
    dw $4AB2,$1D7C,$1EF7,$1E10,$1EB5,$29AA,$1D56,$1CF1

SamusPalettes_PowerSuit_SpeedBoosterShine_2:
    dw $0000,$3E73,$3FDE,$49F2,$5BEF,$4ED3,$6BBF,$6358
    dw $5B16,$3E5D,$3F5A,$3EB5,$3F18,$4671,$3E39,$3DF6

SamusPalettes_PowerSuit_SpeedBoosterShine_3:
    dw $0000,$5F39,$5FDE,$62F8,$6BF7,$6759,$73DF,$6F9B
    dw $6B7A,$5F1E,$5F9C,$5F5A,$5F7B,$6338,$5F1C,$5EFA

SamusPalettes_PowerSuit_Shinespark_PseudoScrewAttack_0:
; SamusPalettes_PowerSuit_Shinespark_PseudoScrewAttack_3 also used for power suit pseudo screw attack
    dw $3800,$0108,$03BD,$1405,$3BE0,$21A8,$579F,$4AD2
    dw $3A4E,$00BB,$02B5,$016B,$0252,$1104,$0074,$000D

SamusPalettes_PowerSuit_Shinespark_PseudoScrewAttack_1:
    dw $3800,$01AD,$03FF,$294F,$4FEA,$36F2,$6BFF,$5FFC
    dw $4798,$017C,$0318,$0210,$02B5,$264E,$15BE,$1557

SamusPalettes_PowerSuit_Shinespark_PseudoScrewAttack_2:
    dw $3800,$0273,$17FF,$1615,$3BF0,$23B8,$57FF,$4BFF
    dw $3BFE,$025D,$037B,$02B5,$0318,$1314,$027F,$021D

SamusPalettes_PowerSuit_Shinespark_PseudoScrewAttack_3:
    dw $3800,$0339,$23FF,$3F5F,$63FA,$4BFF,$7FFF,$73FF
    dw $63FF,$031E,$03DE,$035A,$037B,$3BFE,$2BBF,$2B5F

SamusPalettes_PowerSuit_ScrewAttack_0:
    dw $3800,$0108,$03BD,$1405,$3BE0,$21A8,$579F,$4AD2
    dw $3A4E,$00BB,$02B5,$016B,$0252,$1104,$0074,$000D

SamusPalettes_PowerSuit_ScrewAttack_1:
    dw $3800,$01A8,$03F8,$1545,$43E0,$22E8,$57FF,$4BF2
    dw $3B8E,$01FB,$0355,$020B,$0356,$1244,$01B4,$014D

SamusPalettes_PowerSuit_ScrewAttack_2:
    dw $3800,$0248,$03F3,$1685,$4FE0,$23E8,$57FF,$4BF2
    dw $3BEE,$033B,$03F5,$02AB,$03F6,$1384,$02F4,$028D

SamusPalettes_PowerSuit_ScrewAttack_3:
    dw $3800,$02E8,$03EE,$3FC5,$63E0,$4BE8,$7FFF,$73F2
    dw $63EE,$2BFB,$03F0,$034B,$2BF6,$3BE4,$2BF4,$2BED

SamusPalettes_VariaSuit_SpeedBoosting_BabyMetroidDrain_0:
; SamusPalettes_VariaSuit_SpeedBoosting_BabyMetroidDrain_3 also used for metroid drain blue
    dw $0000,$0108,$02FF,$1405,$3BE0,$21A8,$579F,$4AD2
    dw $3A4E,$00BB,$01BE,$008E,$0252,$1104,$0074,$000D

SamusPalettes_VariaSuit_SpeedBoosting_BabyMetroidDrain_1:
    dw $2003,$2908,$2AFF,$3C05,$63E0,$49A8,$7F9F,$72D2
    dw $624E,$28BB,$29BE,$288E,$2A4D,$3904,$2874,$280D

SamusPalettes_VariaSuit_SpeedBoosting_BabyMetroidDrain_2:
    dw $2003,$5108,$52FF,$64A5,$7FE0,$7248,$7FFF,$7F72
    dw $7EEE,$555B,$51BE,$508E,$3E4D,$61A4,$5114,$50AD

SamusPalettes_VariaSuit_SpeedBoosting_BabyMetroidDrain_3:
    dw $0000,$79A8,$7B9F,$65E5,$7FE0,$7388,$7FFF,$7FF2
    dw $7FEE,$569B,$765E,$752E,$524D,$62E4,$5254,$51ED

SamusPalettes_VariaSuit_SpeedBoosterShine_0:
    dw $0000,$0108,$02FF,$1405,$3BE0,$21A8,$579F,$4AD2
    dw $3A4E,$00BB,$01BE,$008E,$0252,$1104,$0074,$000D

SamusPalettes_VariaSuit_SpeedBoosterShine_1:
    dw $0000,$1DAD,$1F3F,$2CEB,$4BE7,$362D,$5F9F,$5715
    dw $4AB2,$1D7C,$1E3E,$1D52,$1EB5,$29AA,$1D56,$1CF1

SamusPalettes_VariaSuit_SpeedBoosterShine_2:
    dw $0000,$3E73,$3F7F,$49F2,$5BEF,$4ED3,$6BBF,$6358
    dw $5B16,$3E5D,$3EDE,$3E36,$3F18,$4671,$3E39,$3DF6

SamusPalettes_VariaSuit_SpeedBoosterShine_3:
    dw $0000,$5F39,$5FBF,$62F8,$6BF7,$6759,$73DF,$6F9B
    dw $6B7A,$5F1E,$5F5E,$5F1A,$5F7B,$6338,$5F1C,$5EFA

SamusPalettes_VariaSuit_Shinespark_PseudoScrewAttack_0:
; SamusPalettes_VariaSuit_Shinespark_PseudoScrewAttack_3 also used for varia suit pseudo screw attack
    dw $3800,$0108,$02FF,$1405,$3BE0,$21A8,$579F,$4AD2
    dw $3A4E,$00BB,$01BE,$008E,$0252,$1104,$0074,$000D

SamusPalettes_VariaSuit_Shinespark_PseudoScrewAttack_1:
    dw $3800,$01AD,$039F,$294F,$4FEA,$36F2,$6BFF,$5FFC
    dw $4798,$15FF,$025E,$0133,$02F7,$264E,$15BE,$1557

SamusPalettes_VariaSuit_Shinespark_PseudoScrewAttack_2:
    dw $3800,$0252,$03FF,$1615,$3BF0,$23B8,$57FF,$4BFF
    dw $3BFE,$02BF,$02FE,$01D8,$039C,$1314,$027F,$021D

SamusPalettes_VariaSuit_Shinespark_PseudoScrewAttack_3:
    dw $3800,$02F7,$17FF,$3F5F,$63FA,$4BFF,$7FFF,$73FF
    dw $63FF,$2BFF,$039E,$027D,$03FF,$3BFE,$2BBF,$2B5F

SamusPalettes_VariaSuit_ScrewAttack_0:
    dw $3800,$0108,$02FF,$1405,$3BE0,$21A8,$579F,$4AD2
    dw $3A4E,$00BB,$01BE,$008E,$0252,$1104,$0074,$000D

SamusPalettes_VariaSuit_ScrewAttack_1:
    dw $3800,$01A8,$039F,$1545,$43E0,$22E8,$57FF,$4BF2
    dw $3B8E,$01FB,$025E,$012E,$02F2,$1244,$01B4,$014D

SamusPalettes_VariaSuit_ScrewAttack_2:
    dw $3800,$0248,$039A,$1685,$4FE0,$23E8,$57FF,$4BF2
    dw $3BEE,$033B,$02FE,$01CE,$0392,$1384,$02F4,$028D

SamusPalettes_VariaSuit_ScrewAttack_3:
    dw $3800,$02E8,$0394,$3FC5,$63E0,$4BE8,$7FFF,$73F2
    dw $63EE,$2BFB,$039E,$026E,$03F2,$3BE4,$2BF4,$2BED

SamusPalettes_GravitySuit_SpeedBoosting_BabyMetroidDrain_0:
; SamusPalettes_GravitySuit_SpeedBoosting_BabyMetroidDrain_3 also used for metroid drain blue
    dw $14E0,$00CE,$421F,$1405,$3BE0,$21A8,$579F,$4AD2
    dw $3A4E,$00BB,$5914,$30AA,$0216,$1104,$0074,$000D

SamusPalettes_GravitySuit_SpeedBoosting_BabyMetroidDrain_1:
    dw $2003,$28CE,$6E1F,$3C05,$63E0,$49A8,$7F9F,$72D2
    dw $624E,$28BB,$7D14,$58AA,$2A16,$3904,$2874,$280D

SamusPalettes_GravitySuit_SpeedBoosting_BabyMetroidDrain_2:
    dw $2003,$516E,$7EBF,$64A5,$7FE0,$7248,$7FFF,$7F72
    dw $7EEE,$555B,$7DB4,$7D4A,$52B6,$61A4,$5114,$50AD

SamusPalettes_GravitySuit_SpeedBoosting_BabyMetroidDrain_3:
    dw $0000,$52AE,$7FFF,$65E5,$7FE0,$7388,$7FFF,$7FF2
    dw $7FEE,$569B,$7EF4,$7E8A,$53F6,$62E4,$5254,$51ED

SamusPalettes_GravitySuit_SpeedBoosterShine_0:
    dw $0000,$00CE,$421F,$1405,$3BE0,$21A8,$579F,$4AD2
    dw $3A4E,$00BB,$5914,$30AA,$0216,$1104,$0074,$000D

SamusPalettes_GravitySuit_SpeedBoosterShine_1:
    dw $0000,$1D92,$4E7F,$2CEB,$4BE7,$362D,$5F9F,$5715
    dw $4AB2,$1D7C,$61B6,$416F,$1E78,$29AA,$1D56,$1CF1

SamusPalettes_GravitySuit_SpeedBoosterShine_2:
    dw $0000,$3E56,$5EFF,$49F2,$5BEF,$4ED3,$6BBF,$6358
    dw $5B16,$3E5D,$6A79,$5654,$3EFA,$4671,$3E39,$3DF6

SamusPalettes_GravitySuit_SpeedBoosterShine_3:
    dw $0000,$5F1A,$6F7F,$62F8,$6BF7,$6759,$73DF,$6F9B
    dw $6B7A,$5F1E,$733C,$6B19,$5F7C,$6338,$5F1C,$5EFA

SamusPalettes_GravitySuit_Shinespark_0:
; SamusPalettes_GravitySuit_Shinespark_3 also used for gravity suit pseudo screw attack
    dw $3800,$00CE,$421F,$1405,$3BE0,$21A8,$579F,$4AD2
    dw $3A4E,$00BB,$5914,$30AA,$0216,$1104,$0074,$000D

SamusPalettes_GravitySuit_Shinespark_1:
    dw $3800,$1618,$575F,$294F,$4FEA,$36F2,$6BFF,$5FFC
    dw $4798,$15FF,$6E5E,$45F4,$175F,$264E,$15BE,$1557

SamusPalettes_GravitySuit_Shinespark_2:
    dw $3800,$02DE,$43FF,$1615,$3BF0,$23B8,$57FF,$4BFF
    dw $3BFE,$02BF,$5B1F,$32BA,$03FF,$1314,$027F,$021D

SamusPalettes_GravitySuit_Shinespark_3:
    dw $3800,$2BFF,$6BFF,$3F5F,$63FA,$4BFF,$7FFF,$73FF
    dw $63FF,$2BFF,$7FFF,$5BFF,$2BFF,$3BFE,$2BBF,$2B5F

SamusPalettes_GravitySuit_ScrewAttack_0:
    dw $3800,$00CE,$421F,$1405,$3BE0,$21A8,$579F,$4AD2
    dw $3A4E,$00BB,$5914,$30AA,$0216,$1104,$0074,$000D

SamusPalettes_GravitySuit_ScrewAttack_1:
    dw $3800,$020E,$435F,$1545,$43E0,$22E8,$57FF,$4BF2
    dw $3B8E,$01FB,$5A54,$31EA,$0356,$1244,$01B4,$014D

SamusPalettes_GravitySuit_ScrewAttack_2:
    dw $3800,$034E,$43FF,$1685,$4FE0,$23E8,$57FF,$4BF2
    dw $3BEE,$033B,$5B94,$332A,$03F6,$1384,$02F4,$028D

SamusPalettes_GravitySuit_ScrewAttack_3:
    dw $3800,$2BEE,$6BFF,$3FC5,$63E0,$4BE8,$7FFF,$73F2
    dw $63EE,$2BFB,$7FF4,$5BEA,$2BF6,$3BE4,$2BF4,$2BED

SamusPalettes_DeathSequence_SuitlessSamus_0:
    dw $21A8,$02FF,$0217,$0150,$0089,$7FFF,$3A9F,$2A19
    dw $1DB4,$114F,$090B,$4E73,$4210,$318C,$2108,$1084

SamusPalettes_DeathSequence_SuitlessSamus_1:
    dw $29EA,$0F1F,$0E38,$0D91,$0CEB,$7FFF,$42BF,$3239
    dw $29F5,$1D91,$154D,$5294,$4631,$39CE,$294A,$1CE7

SamusPalettes_DeathSequence_SuitlessSamus_2:
    dw $362D,$1F3F,$1E79,$1DF3,$1D4E,$7FFF,$4ADF,$3E7A
    dw $3636,$29F3,$25B0,$5AD6,$4E73,$4210,$35AD,$294A

SamusPalettes_DeathSequence_SuitlessSamus_3:
    dw $4270,$2F5F,$2EBA,$2E35,$2DD1,$7FFF,$531F,$46BB
    dw $4278,$3A35,$3212,$5EF7,$56B5,$4E73,$4210,$39CE

SamusPalettes_DeathSequence_SuitlessSamus_4:
    dw $4ED3,$3F7F,$3EFB,$3E97,$3E34,$7FFF,$5B3F,$52FC
    dw $4ED9,$4697,$4275,$6739,$5EF7,$56B5,$4E73,$4631

SamusPalettes_DeathSequence_SuitlessSamus_5:
    dw $5B16,$4F9F,$4F3C,$4EF9,$4E96,$7FFF,$635F,$5F3C
    dw $5B1A,$52F9,$52D7,$6B5A,$6739,$5EF7,$5AD6,$5294

SamusPalettes_DeathSequence_SuitlessSamus_6:
    dw $6759,$5FBF,$5F7D,$5F3B,$5F19,$7FFF,$6B9F,$677D
    dw $675C,$633B,$5F3A,$739C,$6F7B,$6B5A,$6739,$6318

SamusPalettes_DeathSequence_SuitlessSamus_7:
    dw $739C,$6FDF,$6FBE,$6F9D,$6F7C,$7FFF,$73BF,$73BE
    dw $739D,$6F9D,$6F9C,$77BD,$77BD,$739C,$739C,$6F7B

SamusPalettes_DeathSequence_SuitlessSamus_8:
    dw $77BD,$77BD,$77BD,$77BD,$77BD,$77BD,$77BD,$77BD
    dw $77BD,$77BD,$77BD,$77BD,$77BD,$77BD,$77BD,$77BD

SamusPalettes_HyperBeam_0:
    dw $0000,$2119,$319E,$1096,$35BF,$1CF9,$319E,$2D7D
    dw $295B,$253B,$211A,$18D7,$211A,$14B7,$18D8,$1096

SamusPalettes_HyperBeam_1:
    dw $0000,$1639,$2ABE,$09B6,$2EDF,$1619,$2ABE,$26BD
    dw $1E7B,$1E5B,$1A3A,$0DF7,$1A3A,$0DD7,$11F8,$09B6

SamusPalettes_HyperBeam_2:
    dw $0000,$0F39,$23DE,$02D6,$23FF,$0B39,$23DE,$1FBD
    dw $177B,$137B,$135A,$06F7,$135A,$02F7,$0B18,$02D6

SamusPalettes_HyperBeam_3:
    dw $0000,$0F2F,$23D3,$02CB,$23F4,$0B2E,$23D3,$1FB2
    dw $1771,$1370,$134F,$06ED,$134F,$02EC,$0B0D,$02CB

SamusPalettes_HyperBeam_4:
    dw $0000,$0F23,$23C8,$02C0,$23E8,$0B22,$23C8,$1FA7
    dw $1765,$1364,$1344,$06E1,$1344,$02E0,$0B02,$02C0

SamusPalettes_HyperBeam_5:
    dw $0000,$3284,$4329,$2221,$4749,$2E83,$4329,$4308
    dw $3AC6,$36C5,$32A5,$2A42,$32A5,$2641,$2A63,$2221

SamusPalettes_HyperBeam_6:
    dw $0400,$51E5,$6289,$4181,$66AA,$4DE4,$6289,$5E68
    dw $5A27,$5626,$5205,$49A3,$5205,$45A2,$49C3,$4181

SamusPalettes_HyperBeam_7:
    dw $0000,$554D,$69D2,$48CA,$69F2,$512C,$69D2,$65B1
    dw $5D8F,$596E,$594E,$4D0B,$594E,$48EA,$510C,$48CA

SamusPalettes_HyperBeam_8:
    dw $7FFF,$5876,$691A,$4812,$6D1B,$5455,$691A,$68FA
    dw $60B8,$5C97,$5896,$5034,$5896,$4C13,$5054,$4812

SamusPalettes_HyperBeam_9:
    dw $3800,$3CB8,$4D5D,$2C55,$517D,$38B7,$4D5D,$493C
    dw $44FA,$40F9,$3CD9,$3476,$3CD9,$3075,$3497,$2C55

SamusPalettes_HurtFlash:
    dw $0000,$6739,$6F9C,$5EF7,$7BFF,$6739,$77BD,$6F9C
    dw $6B7B,$6B7B,$6B7B,$5F18,$6B7B,$5F18,$6739,$5F18

SamusPalettes_Intro:
; Intro Samus (greyscale)
    dw $3800,$2DAD,$52D6,$1084,$77FF,$2DAD,$677B,$52D6
    dw $4252,$4252,$4252,$1908,$4252,$1908,$2DAD,$1908

SamusPalettes_Visor:
    dw $3BE0,$5FF0,$7FFF ; Palette transition when x-ray is widening
    dw $43FF,$2F5A,$1AB5 ; Full x-ray beam, or in room with layer blending configuration = 28h/2Ah (with colour math backdrop)


;;; $A3CC: Set projectile trail position ;;;
SetProjectileTrailPosition:
;; Parameters:
;;     X: Projectile index
;;     Y: Projectile trail index
    PHP : PHB
    PHK : PLB
    REP #$30
    JSL Get_ProjectileTrailFrame
    LDA.W CeresStatus : BPL .notRotatingRoom
    JSL Calculate_ProjectilePosition_InRotatingElevatorRoom
    LDA.B DP_Temp12 : PHA
    LDA.B DP_Temp14 : CLC : ADC.W Layer1XPosition : STA.B DP_Temp12
    PLA : CLC : ADC.W Layer1YPosition : STA.B DP_Temp14
    BRA +

  .notRotatingRoom:
    LDA.W SamusProjectile_XPositions,X : STA.B DP_Temp12
    LDA.W SamusProjectile_YPositions,X : STA.B DP_Temp14

+   PHY
    LDA.W SamusProjectile_Types,X : BIT.W #$0020 : BNE .SBATrail
    BIT.W #$0010 : BNE .getOffset
    AND.W #$000F : ASL : TAY
    LDA.W SamusProjectile_Directions,X : AND.W #$000F
    ASL : CLC : ADC.W BeamTrailOffsets_uncharged,Y
    BRA .merge

  .getOffset:
    AND.W #$000F : ASL : TAY
    LDA.W SamusProjectile_Directions,X : AND.W #$000F
    ASL : CLC : ADC.W BeamTrailOffsets_charged,Y
    BRA .merge

  .SBATrail:
    AND.W #$000F : ASL : TAY
    LDA.W SamusProjectile_Directions,X : AND.W #$000F
    ASL : CLC : ADC.W BeamTrailOffsets_spazerSBA,Y

  .merge:
    TAY
    LDA.B DP_Temp16 : ASL #2 : CLC : ADC.W $0000,Y : TAY
    PLX
    LDA.W $0000,Y : XBA : BMI .leftYHighByte
    AND.W #$00FF
    BRA +

  .leftYHighByte:
    ORA.W #$FF00

+   CLC : ADC.B DP_Temp14
    SEC : SBC.W #$0004 : STA.L ProjectileTrail_LeftYPosition,X
    DEY
    LDA.W $0000,Y : XBA : BMI .leftXHighByte
    AND.W #$00FF
    BRA +

  .leftXHighByte:
    ORA.W #$FF00

+   CLC : ADC.B DP_Temp12
    SEC : SBC.W #$0004 : STA.L ProjectileTrail_LeftXPosition,X
    INY
    LDA.W $0002,Y : XBA : BMI .rightYHighByte
    AND.W #$00FF
    BRA +

  .rightYHighByte:
    ORA.W #$FF00

+   CLC : ADC.B DP_Temp14
    SEC : SBC.W #$0004 : STA.L ProjectileTrail_RightYPosition,X
    LDA.W $0001,Y : XBA : BMI .rightXHighByte
    AND.W #$00FF
    BRA +

  .rightXHighByte:
    ORA.W #$FF00

+   CLC : ADC.B DP_Temp12
    SEC : SBC.W #$0004 : STA.L ProjectileTrail_RightXPosition,X
    PLB : PLP
    RTL


;;; $A4B3..B3A6: Beam trail offsets ;;;
BeamTrailOffsets_uncharged:
    dw UnchargedBeamTrails_Default
    dw UnchargedBeamTrails_Wave_WaveIce
    dw UnchargedBeamTrails_Default
    dw UnchargedBeamTrails_Wave_WaveIce
    dw UnchargedBeamTrails_Default
    dw UnchargedBeamTrails_Default
    dw UnchargedBeamTrails_IceSpazer
    dw UnchargedBeamTrails_WaveIceSpazer
    dw UnchargedBeamTrails_Default
    dw UnchargedBeamTrails_Default
    dw UnchargedBeamTrails_IcePlasma
    dw UnchargedBeamTrails_WaveIcePlasma

BeamTrailOffsets_charged:
    dw ChargedBeamTrails_Default
    dw ChargedBeamTrails_Wave_WaveIce
    dw ChargedBeamTrails_Default
    dw ChargedBeamTrails_Wave_WaveIce
    dw ChargedBeamTrails_Default
    dw ChargedBeamTrails_Default
    dw ChargedBeamTrails_IceSpazer
    dw ChargedBeamTrails_WaveIceSpazer
    dw ChargedBeamTrails_Default
    dw ChargedBeamTrails_Default
    dw ChargedBeamTrails_IcePlasma
    dw ChargedBeamTrails_WaveIcePlasma

BeamTrailOffsets_spazerSBA:
    dw $0000
    dw $0000
    dw $0000
    dw $0000
    dw UNSUED_SpazerSBATrail_Spazer_IceSpazer_9BB37B
    dw SpazerSBATrail_WaveSpazer
    dw UNSUED_SpazerSBATrail_Spazer_IceSpazer_9BB37B
    dw $0000
    dw $0000
    dw $0000


;;; $A4F7: Uncharged beams ;;;
UnchargedBeamTrails_Wave_WaveIce:
    dw UnchargedBeamTrails_Wave_WaveIce_0
    dw UnchargedBeamTrails_Wave_WaveIce_2
    dw UnchargedBeamTrails_Wave_WaveIce_1
    dw UnchargedBeamTrails_Wave_WaveIce_3
    dw UnchargedBeamTrails_Wave_WaveIce_0
    dw UnchargedBeamTrails_Wave_WaveIce_0
    dw UnchargedBeamTrails_Wave_WaveIce_2
    dw UnchargedBeamTrails_Wave_WaveIce_1
    dw UnchargedBeamTrails_Wave_WaveIce_3
    dw UnchargedBeamTrails_Wave_WaveIce_0

UnchargedBeamTrails_Default:
    dw UnchargedBeamTrails_Default_0
    dw UnchargedBeamTrails_Default_0
    dw UnchargedBeamTrails_Default_0
    dw UnchargedBeamTrails_Default_0
    dw UnchargedBeamTrails_Default_0
    dw UnchargedBeamTrails_Default_0
    dw UnchargedBeamTrails_Default_0
    dw UnchargedBeamTrails_Default_0
    dw UnchargedBeamTrails_Default_0
    dw UnchargedBeamTrails_Default_0

UnchargedBeamTrails_IceSpazer:
    dw UnchargedBeamTrails_IceSpazer_0
    dw UnchargedBeamTrails_IceSpazer_2
    dw UnchargedBeamTrails_IceSpazer_3
    dw UnchargedBeamTrails_IceSpazer_4
    dw UnchargedBeamTrails_IceSpazer_1
    dw UnchargedBeamTrails_IceSpazer_1
    dw UnchargedBeamTrails_IceSpazer_5
    dw UnchargedBeamTrails_IceSpazer_6
    dw UnchargedBeamTrails_IceSpazer_7
    dw UnchargedBeamTrails_IceSpazer_0

UnchargedBeamTrails_WaveIceSpazer:
    dw UnchargedBeamTrails_WaveIceSpazer_0
    dw UnchargedBeamTrails_WaveIceSpazer_1
    dw UnchargedBeamTrails_WaveIceSpazer_2
    dw UnchargedBeamTrails_WaveIceSpazer_3
    dw UnchargedBeamTrails_WaveIceSpazer_4
    dw UnchargedBeamTrails_WaveIceSpazer_4
    dw UnchargedBeamTrails_WaveIceSpazer_5
    dw UnchargedBeamTrails_WaveIceSpazer_6
    dw UnchargedBeamTrails_WaveIceSpazer_7
    dw UnchargedBeamTrails_WaveIceSpazer_0

UnchargedBeamTrails_IcePlasma:
    dw UnchargedBeamTrails_IcePlasma_0
    dw UnchargedBeamTrails_IcePlasma_1
    dw UnchargedBeamTrails_IcePlasma_2
    dw UnchargedBeamTrails_IcePlasma_3
    dw UnchargedBeamTrails_IcePlasma_4
    dw UnchargedBeamTrails_IcePlasma_4
    dw UnchargedBeamTrails_IcePlasma_5
    dw UnchargedBeamTrails_IcePlasma_6
    dw UnchargedBeamTrails_IcePlasma_7
    dw UnchargedBeamTrails_IcePlasma_0

UnchargedBeamTrails_WaveIcePlasma:
    dw UnchargedBeamTrails_WaveIcePlasma_0
    dw UnchargedBeamTrails_WaveIcePlasma_1
    dw UnchargedBeamTrails_WaveIcePlasma_2
    dw UnchargedBeamTrails_WaveIcePlasma_3
    dw UnchargedBeamTrails_WaveIcePlasma_4
    dw UnchargedBeamTrails_WaveIcePlasma_4
    dw UnchargedBeamTrails_WaveIcePlasma_5
    dw UnchargedBeamTrails_WaveIcePlasma_6
    dw UnchargedBeamTrails_WaveIcePlasma_7
    dw UnchargedBeamTrails_WaveIcePlasma_0

; Format:
;     x,y,X,Y
;     x: Left trail X offset
;     y: Left trail Y offset
;     X: Right trail X offset
;     Y: Right trail Y offset

; Indexed by [[projectile instruction pointer] - 2] * 4
UnchargedBeamTrails_Default_0:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

UnchargedBeamTrails_Wave_WaveIce_0:
    db $00,$00,$00,$00,$08,$00,$00,$00,$0C,$00,$00,$00,$10,$00,$00,$00
    db $14,$00,$00,$00,$10,$00,$00,$00,$0C,$00,$00,$00,$08,$00,$00,$00
    db $00,$00,$00,$00,$F8,$00,$00,$00,$F4,$00,$00,$00,$F0,$00,$00,$00
    db $EC,$00,$00,$00,$F0,$00,$00,$00,$F4,$00,$00,$00,$F8,$00,$00,$00

UnchargedBeamTrails_Wave_WaveIce_1:
    db $00,$00,$00,$00,$00,$F8,$00,$00,$00,$F4,$00,$00,$00,$F0,$00,$00
    db $00,$EC,$00,$00,$00,$F0,$00,$00,$00,$F4,$00,$00,$00,$F8,$00,$00
    db $00,$00,$00,$00,$00,$08,$00,$00,$00,$0C,$00,$00,$00,$10,$00,$00
    db $00,$14,$00,$00,$00,$10,$00,$00,$00,$0C,$00,$00,$00,$08,$00,$00

UnchargedBeamTrails_Wave_WaveIce_2:
    db $00,$00,$00,$00,$FC,$FC,$00,$00,$F8,$F8,$00,$00,$F6,$F6,$00,$00
    db $F4,$F4,$00,$00,$F6,$F6,$00,$00,$F8,$F8,$00,$00,$FC,$FC,$00,$00
    db $00,$00,$00,$00,$04,$04,$00,$00,$08,$08,$00,$00,$0A,$0A,$00,$00
    db $0C,$0C,$00,$00,$0A,$0A,$00,$00,$08,$08,$00,$00,$04,$04,$00,$00

UnchargedBeamTrails_Wave_WaveIce_3:
    db $00,$00,$00,$00,$04,$FC,$00,$00,$08,$F8,$00,$00,$0A,$F6,$00,$00
    db $0C,$F4,$00,$00,$0A,$F6,$00,$00,$08,$F8,$00,$00,$04,$FC,$00,$00
    db $00,$00,$00,$00,$FC,$04,$00,$00,$F8,$08,$00,$00,$F6,$0A,$00,$00
    db $F4,$0C,$00,$00,$F6,$0A,$00,$00,$F8,$08,$00,$00,$FC,$04,$00,$00

UnchargedBeamTrails_IceSpazer_0:
    db $00,$00,$00,$00,$F8,$08,$08,$08,$F0,$08,$10,$08

UnchargedBeamTrails_IceSpazer_1:
    db $00,$00,$00,$00,$F8,$F8,$08,$F8,$F0,$F8,$10,$F8

UnchargedBeamTrails_IceSpazer_2:
    db $F8,$08,$F8,$08,$F2,$02,$FE,$0E,$EC,$FC,$02,$14

UnchargedBeamTrails_IceSpazer_3:
    db $F8,$00,$F8,$00,$F8,$F8,$F8,$08,$F8,$F0,$F8,$10

UnchargedBeamTrails_IceSpazer_4:
    db $F8,$F8,$F8,$F8,$FE,$F0,$F0,$FE,$04,$EC,$EC,$04

UnchargedBeamTrails_IceSpazer_5:
    db $08,$F8,$08,$F8,$0E,$FE,$02,$F2,$14,$04,$FE,$EC

UnchargedBeamTrails_IceSpazer_6:
    db $08,$00,$08,$00,$08,$08,$08,$F8,$08,$10,$08,$F0

UnchargedBeamTrails_IceSpazer_7:
    db $08,$08,$08,$08,$02,$10,$10,$02,$FC,$14,$14,$FC

UnchargedBeamTrails_WaveIceSpazer_0:
    db $00,$00,$00,$00,$FC,$08,$04,$08,$F8,$08,$08,$08,$F4,$08,$0C,$08
    db $F0,$08,$10,$08,$F0,$08,$10,$08,$F0,$08,$10,$08,$F4,$08,$0C,$08
    db $F8,$08,$08,$08,$FC,$08,$04,$08

UnchargedBeamTrails_WaveIceSpazer_1:
    db $00,$00,$00,$00,$F4,$06,$FA,$0C,$F2,$02,$FE,$0E,$F0,$00,$00,$10
    db $EE,$FE,$02,$12,$EC,$FC,$02,$14,$EE,$FE,$02,$12,$F0,$00,$00,$10
    db $F2,$02,$FE,$0E,$F4,$06,$FA,$0C

UnchargedBeamTrails_WaveIceSpazer_2:
    db $00,$00,$00,$00,$F8,$FC,$F8,$04,$F8,$F8,$F8,$08,$F8,$F4,$F8,$0C
    db $F8,$F0,$F8,$10,$F8,$F0,$F8,$10,$F8,$F0,$F8,$10,$F8,$F4,$F8,$0C
    db $F8,$F8,$F8,$08,$F8,$FC,$F8,$04

UnchargedBeamTrails_WaveIceSpazer_3:
    db $00,$00,$00,$00,$F4,$FA,$FA,$F4,$FE,$F0,$F0,$FE,$F0,$00,$00,$F0
    db $EE,$02,$02,$EE,$04,$EC,$EC,$04,$EE,$02,$02,$EE,$F0,$00,$00,$F0
    db $FE,$F0,$F0,$FE,$F4,$FA,$FA,$F4

UnchargedBeamTrails_WaveIceSpazer_4:
    db $00,$00,$00,$00,$FC,$F8,$04,$F8,$F8,$F8,$08,$F8,$F4,$F8,$0C,$F8
    db $F0,$F8,$10,$F8,$F0,$F8,$10,$F8,$F0,$F8,$10,$F8,$F4,$F8,$0C,$F8
    db $F8,$F8,$08,$F8,$FC,$F8,$04,$F8

UnchargedBeamTrails_WaveIceSpazer_5:
    db $00,$00,$00,$00,$02,$F2,$0E,$FE,$00,$F0,$10,$00,$FE,$EE,$12,$02
    db $FE,$EC,$14,$04,$FE,$EC,$14,$04,$FE,$EC,$14,$04,$FE,$EE,$12,$02
    db $00,$F0,$10,$00,$02,$F2,$0E,$FE

UnchargedBeamTrails_WaveIceSpazer_6:
    db $00,$00,$00,$00,$08,$FC,$08,$04,$08,$F8,$08,$08,$08,$F4,$08,$0C
    db $08,$F0,$08,$10,$08,$F0,$08,$10,$08,$F0,$08,$10,$08,$F4,$08,$0C
    db $08,$F8,$08,$08,$08,$FC,$08,$04

UnchargedBeamTrails_WaveIceSpazer_7:
    db $00,$00,$00,$00,$06,$0A,$0A,$06,$02,$10,$10,$02,$00,$10,$10,$00
    db $FE,$12,$12,$FE,$FC,$14,$14,$FC,$FE,$12,$12,$FE,$00,$10,$10,$00
    db $02,$10,$10,$02,$06,$0A,$0A,$06

UnchargedBeamTrails_IcePlasma_0:
    db $00,$00,$00,$00,$00,$10,$00,$10

UnchargedBeamTrails_IcePlasma_1:
    db $00,$00,$00,$00,$F4,$0C,$F4,$0C

UnchargedBeamTrails_IcePlasma_2:
    db $00,$00,$00,$00,$F0,$00,$F0,$00

UnchargedBeamTrails_IcePlasma_3:
    db $00,$00,$00,$00,$F4,$F4,$F4,$F4

UnchargedBeamTrails_IcePlasma_4:
    db $00,$00,$00,$00,$00,$F0,$00,$F0

UnchargedBeamTrails_IcePlasma_5:
    db $00,$00,$00,$00,$0C,$F4,$0C,$F4

UnchargedBeamTrails_IcePlasma_6:
    db $00,$00,$00,$00,$10,$00,$10,$00

UnchargedBeamTrails_IcePlasma_7:
    db $00,$00,$00,$00,$0C,$0C,$0C,$0C

UnchargedBeamTrails_WaveIcePlasma_0:
    db $00,$00,$00,$00,$00,$10,$00,$10,$F8,$10,$08,$10,$F0,$10,$10,$10
    db $F0,$10,$10,$10,$F0,$10,$10,$10,$F0,$10,$10,$10,$F0,$10,$10,$10
    db $F8,$10,$08,$10

UnchargedBeamTrails_WaveIcePlasma_1:
    db $00,$00,$00,$00,$F4,$0C,$F4,$0C,$EC,$08,$F8,$12,$E8,$02,$FE,$14
    db $E8,$00,$00,$18,$E8,$00,$00,$18,$E8,$00,$00,$18,$E8,$02,$FE,$14
    db $EC,$08,$F8,$12

UnchargedBeamTrails_WaveIcePlasma_2:
    db $00,$00,$00,$00,$F0,$00,$F0,$00,$F0,$F8,$F0,$08,$F0,$F4,$F0,$0C
    db $F0,$F0,$F0,$10,$F0,$F0,$F0,$10,$F0,$F0,$F0,$10,$F0,$F4,$F0,$0C
    db $F0,$F8,$F0,$08

UnchargedBeamTrails_WaveIcePlasma_3:
    db $00,$00,$00,$00,$F4,$F4,$F4,$F4,$EE,$FA,$FA,$EE,$EC,$FE,$FE,$EC
    db $E8,$00,$00,$E8,$E8,$00,$00,$E8,$E8,$00,$00,$E8,$EC,$FE,$FE,$EC
    db $EE,$FA,$FA,$EE

UnchargedBeamTrails_WaveIcePlasma_4:
    db $00,$00,$00,$00,$00,$F0,$00,$F0,$F8,$F0,$08,$F0,$F0,$F0,$10,$F0
    db $F0,$F0,$10,$F0,$F0,$F0,$10,$F0,$F0,$F0,$10,$F0,$F0,$F0,$10,$F0
    db $F8,$F0,$08,$F0

UnchargedBeamTrails_WaveIcePlasma_5:
    db $00,$00,$00,$00,$0C,$F4,$0C,$F4,$14,$F8,$08,$EE,$18,$FE,$02,$EC
    db $18,$00,$00,$E8,$18,$00,$00,$E8,$18,$00,$00,$E8,$18,$FE,$02,$EC
    db $14,$F8,$08,$EE

UnchargedBeamTrails_WaveIcePlasma_6:
    db $00,$00,$00,$00,$10,$00,$10,$00,$10,$F8,$10,$08,$10,$F4,$10,$0C
    db $10,$F0,$10,$10,$10,$F0,$10,$10,$10,$F0,$10,$10,$10,$F4,$10,$0C
    db $10,$F8,$10,$08

UnchargedBeamTrails_WaveIcePlasma_7:
    db $00,$00,$00,$00,$0C,$0C,$0C,$0C,$12,$06,$06,$12,$14,$02,$02,$14
    db $18,$00,$00,$18,$18,$00,$00,$18,$18,$00,$00,$18,$14,$02,$02,$14
    db $12,$06,$06,$12


;;; $A98F: Charged beams ;;;
ChargedBeamTrails_Default:
    dw ChargedBeamTrails_Default_0                                       ; Up, facing right
    dw ChargedBeamTrails_Default_0                                       ; Up-right
    dw ChargedBeamTrails_Default_0                                       ; Right
    dw ChargedBeamTrails_Default_0                                       ; Down-right
    dw ChargedBeamTrails_Default_0                                       ; Down, facing right
    dw ChargedBeamTrails_Default_0                                       ; Down, facing left
    dw ChargedBeamTrails_Default_0                                       ; Down-left
    dw ChargedBeamTrails_Default_0                                       ; Left
    dw ChargedBeamTrails_Default_0                                       ; Up-left
    dw ChargedBeamTrails_Default_0                                       ; Up, facing left

ChargedBeamTrails_Wave_WaveIce:
    dw ChargedBeamTrails_Wave_WaveIce_0                                  ; Up, facing right
    dw ChargedBeamTrails_Wave_WaveIce_2                                  ; Up-right
    dw ChargedBeamTrails_Wave_WaveIce_1                                  ; Right
    dw ChargedBeamTrails_Wave_WaveIce_3                                  ; Down-right
    dw ChargedBeamTrails_Wave_WaveIce_0                                  ; Down, facing right
    dw ChargedBeamTrails_Wave_WaveIce_0                                  ; Down, facing left
    dw ChargedBeamTrails_Wave_WaveIce_2                                  ; Down-left
    dw ChargedBeamTrails_Wave_WaveIce_1                                  ; Left
    dw ChargedBeamTrails_Wave_WaveIce_3                                  ; Up-left
    dw ChargedBeamTrails_Wave_WaveIce_0                                  ; Up, facing left

ChargedBeamTrails_IceSpazer:
    dw ChargedBeamTrails_IceSpazer_0                                     ; Up, facing right
    dw ChargedBeamTrails_IceSpazer_1                                     ; Up-right
    dw ChargedBeamTrails_IceSpazer_2                                     ; Right
    dw ChargedBeamTrails_IceSpazer_3                                     ; Down-right
    dw ChargedBeamTrails_IceSpazer_4                                     ; Down, facing right
    dw ChargedBeamTrails_IceSpazer_4                                     ; Down, facing left
    dw ChargedBeamTrails_IceSpazer_5                                     ; Down-left
    dw ChargedBeamTrails_IceSpazer_6                                     ; Left
    dw ChargedBeamTrails_IceSpazer_7                                     ; Up-left
    dw ChargedBeamTrails_IceSpazer_0                                     ; Up, facing left

ChargedBeamTrails_WaveIceSpazer:
    dw ChargedBeamTrails_WaveIceSpazer_0                                 ; Up, facing right
    dw ChargedBeamTrails_WaveIceSpazer_1                                 ; Up-right
    dw ChargedBeamTrails_WaveIceSpazer_2                                 ; Right
    dw ChargedBeamTrails_WaveIceSpazer_3                                 ; Down-right
    dw ChargedBeamTrails_WaveIceSpazer_4                                 ; Down, facing right
    dw ChargedBeamTrails_WaveIceSpazer_4                                 ; Down, facing left
    dw ChargedBeamTrails_WaveIceSpazer_5                                 ; Down-left
    dw ChargedBeamTrails_WaveIceSpazer_6                                 ; Left
    dw ChargedBeamTrails_WaveIceSpazer_7                                 ; Up-left
    dw ChargedBeamTrails_WaveIceSpazer_0                                 ; Up, facing left

ChargedBeamTrails_IcePlasma:
    dw ChargedBeamTrails_IcePlasma_0                                     ; Up, facing right
    dw ChargedBeamTrails_IcePlasma_1                                     ; Up-right
    dw ChargedBeamTrails_IcePlasma_2                                     ; Right
    dw ChargedBeamTrails_IcePlasma_3                                     ; Down-right
    dw ChargedBeamTrails_IcePlasma_4                                     ; Down, facing right
    dw ChargedBeamTrails_IcePlasma_4                                     ; Down, facing left
    dw ChargedBeamTrails_IcePlasma_5                                     ; Down-left
    dw ChargedBeamTrails_IcePlasma_6                                     ; Left
    dw ChargedBeamTrails_IcePlasma_7                                     ; Up-left
    dw ChargedBeamTrails_IcePlasma_0                                     ; Up, facing left

ChargedBeamTrails_WaveIcePlasma:
    dw ChargedBeamTrails_WaveIcePlasma_0                                 ; Up, facing right
    dw ChargedBeamTrails_WaveIcePlasma_1                                 ; Up-right
    dw ChargedBeamTrails_WaveIcePlasma_2                                 ; Right
    dw ChargedBeamTrails_WaveIcePlasma_3                                 ; Down-right
    dw ChargedBeamTrails_WaveIcePlasma_4                                 ; Down, facing right
    dw ChargedBeamTrails_WaveIcePlasma_4                                 ; Down, facing left
    dw ChargedBeamTrails_WaveIcePlasma_5                                 ; Down-left
    dw ChargedBeamTrails_WaveIcePlasma_6                                 ; Left
    dw ChargedBeamTrails_WaveIcePlasma_7                                 ; Up-left
    dw ChargedBeamTrails_WaveIcePlasma_0                                 ; Up, facing left

; Format:
;     x,y,X,Y
;     x: Left trail X offset
;     y: Left trail Y offset
;     X: Right trail X offset
;     Y: Right trail Y offset

; Indexed by [[projectile instruction pointer] - 2] * 4

ChargedBeamTrails_Default_0:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

ChargedBeamTrails_Wave_WaveIce_0:
    db $00,$00,$00,$00,$00,$00,$00,$00,$F8,$00,$08,$00,$F8,$00,$08,$00
    db $F4,$00,$0C,$00,$F4,$00,$0C,$00,$F0,$00,$10,$00,$F0,$00,$10,$00
    db $F0,$00,$10,$00,$F0,$00,$10,$00,$F0,$00,$10,$00,$F0,$00,$10,$00
    db $F4,$00,$0C,$00,$F4,$00,$0C,$00,$F8,$00,$08,$00,$F8,$00,$08,$00

ChargedBeamTrails_Wave_WaveIce_1:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$F8,$00,$08,$00,$F8,$00,$08
    db $00,$F4,$00,$0C,$00,$F4,$00,$0C,$00,$F0,$00,$10,$00,$F0,$00,$10
    db $00,$F0,$00,$10,$00,$F0,$00,$10,$00,$F0,$00,$10,$00,$F0,$00,$10
    db $00,$F4,$00,$0C,$00,$F4,$00,$0C,$00,$F8,$00,$08,$00,$F8,$00,$08

ChargedBeamTrails_Wave_WaveIce_2:
    db $00,$00,$00,$00,$00,$00,$00,$00,$FC,$FC,$04,$04,$FC,$FC,$04,$04
    db $F8,$F8,$08,$08,$F8,$F8,$08,$08,$F8,$F8,$08,$08,$F8,$F8,$08,$08
    db $F6,$F6,$0A,$0A,$F6,$F6,$0A,$0A,$F8,$F8,$08,$08,$F8,$F8,$08,$08
    db $F8,$F8,$08,$08,$F8,$F8,$08,$08,$FC,$FC,$04,$04,$FC,$FC,$04,$04

ChargedBeamTrails_Wave_WaveIce_3:
    db $00,$00,$00,$00,$00,$00,$00,$00,$FC,$04,$04,$FC,$FC,$04,$04,$FC
    db $F8,$08,$08,$F8,$F8,$08,$08,$F8,$F8,$08,$08,$F8,$F8,$08,$08,$F8
    db $F6,$0A,$0A,$F6,$F6,$0A,$0A,$F6,$F8,$08,$08,$F8,$F8,$08,$08,$F8
    db $F8,$08,$08,$F8,$F8,$08,$08,$F8,$FC,$04,$04,$FC,$FC,$04,$04,$FC

ChargedBeamTrails_IceSpazer_0:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$08,$00,$08,$00,$08,$00,$08
    db $00,$10,$00,$10,$00,$10,$00,$10,$F8,$10,$08,$10,$F8,$10,$08,$10
    db $F0,$10,$10,$10,$F0,$10,$10,$10

ChargedBeamTrails_IceSpazer_1:
    db $00,$00,$00,$00,$00,$00,$00,$00,$F8,$08,$F8,$08,$F8,$08,$F8,$08
    db $F4,$0C,$F4,$0C,$F4,$0C,$F4,$0C,$F0,$08,$F8,$10,$F0,$08,$F8,$10
    db $E8,$00,$00,$18,$E8,$00,$00,$18

ChargedBeamTrails_IceSpazer_2:
    db $00,$00,$00,$00,$00,$00,$00,$00,$F8,$08,$F8,$08,$F8,$08,$F8,$08
    db $F0,$00,$F0,$00,$F0,$00,$F0,$00,$F0,$F8,$F0,$08,$F0,$F8,$F0,$08
    db $F0,$F0,$F0,$10,$F0,$F0,$F0,$10

ChargedBeamTrails_IceSpazer_3:
    db $00,$00,$00,$00,$00,$00,$00,$00,$F8,$F8,$F8,$F8,$F8,$F8,$F8,$F8
    db $F4,$F4,$F4,$F4,$F4,$F4,$F4,$F4,$F0,$F8,$F8,$F0,$F0,$F8,$F8,$F0
    db $E8,$00,$00,$E8,$E8,$00,$00,$E8

ChargedBeamTrails_IceSpazer_4:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$F8,$00,$F8,$00,$F8,$00,$F8
    db $00,$F0,$00,$F0,$00,$F0,$00,$F0,$F8,$F0,$08,$F0,$F8,$F0,$08,$F0
    db $F0,$F0,$10,$F0,$F0,$F0,$10,$F0

ChargedBeamTrails_IceSpazer_5:
    db $00,$00,$00,$00,$00,$00,$00,$00,$08,$F8,$08,$F8,$08,$F8,$08,$F8
    db $0C,$F4,$0C,$F4,$0C,$F4,$0C,$F4,$10,$F8,$08,$F0,$10,$F8,$08,$F0
    db $18,$00,$00,$E8,$18,$00,$00,$E8

ChargedBeamTrails_IceSpazer_6:
    db $00,$00,$00,$00,$00,$00,$00,$00,$08,$00,$08,$00,$08,$00,$08,$00
    db $10,$00,$10,$00,$10,$00,$10,$00,$10,$F8,$10,$08,$10,$F8,$10,$08
    db $10,$F0,$10,$10,$10,$F0,$10,$10

ChargedBeamTrails_IceSpazer_7:
    db $00,$00,$00,$00,$00,$00,$00,$00,$08,$08,$08,$08,$08,$08,$08,$08
    db $0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C,$10,$08,$08,$10,$10,$08,$08,$10
    db $18,$00,$00,$18,$18,$00,$00,$18

ChargedBeamTrails_WaveIceSpazer_0:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$08,$00,$08,$00,$08,$00,$08
    db $00,$10,$00,$10,$00,$10,$00,$10,$FC,$10,$04,$10,$FC,$10,$04,$10
    db $F8,$10,$08,$10,$F8,$10,$08,$10,$F4,$10,$0C,$10,$F4,$10,$0C,$10
    db $F0,$10,$10,$10,$F0,$10,$10,$10,$F0,$10,$10,$10,$F0,$10,$10,$10
    db $F0,$10,$10,$10,$F0,$10,$10,$10,$F4,$10,$0C,$10,$F4,$10,$0C,$10
    db $F8,$10,$08,$10,$F8,$10,$08,$10,$FC,$10,$04,$10,$FC,$10,$04,$10

ChargedBeamTrails_WaveIceSpazer_1:
    db $00,$00,$00,$00,$00,$00,$00,$00,$F8,$08,$F8,$08,$F8,$08,$F8,$08
    db $F4,$0C,$F4,$0C,$F4,$0C,$F4,$0C,$F0,$08,$F8,$10,$F0,$08,$F8,$10
    db $F0,$08,$F8,$10,$F0,$08,$F8,$10,$F0,$08,$F8,$10,$F0,$08,$F8,$10
    db $E8,$00,$00,$18,$E8,$00,$00,$18,$E8,$00,$00,$18,$E8,$00,$00,$18
    db $E8,$00,$00,$18,$E8,$00,$00,$18,$F0,$08,$F8,$10,$F0,$08,$F8,$10
    db $F0,$08,$F8,$10,$F0,$08,$F8,$10,$F0,$08,$F8,$10,$F0,$08,$F8,$10

ChargedBeamTrails_WaveIceSpazer_2:
    db $00,$00,$00,$00,$00,$00,$00,$00,$F8,$00,$F8,$00,$F8,$00,$F8,$00
    db $F0,$00,$F0,$00,$F0,$00,$F0,$00,$F0,$FC,$F0,$04,$F0,$FC,$F0,$04
    db $F0,$F8,$F0,$08,$F0,$F8,$F0,$08,$F0,$F4,$F0,$0C,$F0,$F4,$F0,$0C
    db $F0,$F0,$F0,$10,$F0,$F0,$F0,$10,$F0,$F0,$F0,$10,$F0,$F0,$F0,$10
    db $F0,$F0,$F0,$10,$F0,$F0,$F0,$10,$F0,$F4,$F0,$0C,$F0,$F4,$F0,$0C
    db $F0,$F8,$F0,$08,$F0,$F8,$F0,$08,$F0,$FC,$F0,$04,$F0,$FC,$F0,$04

ChargedBeamTrails_WaveIceSpazer_3:
    db $00,$00,$00,$00,$00,$00,$00,$00,$F8,$F8,$F8,$F8,$F8,$F8,$F8,$F8
    db $F4,$F4,$F4,$F4,$F4,$F4,$F4,$F4,$F0,$F8,$F8,$F0,$F0,$F8,$F8,$F0
    db $F0,$F8,$F8,$F0,$F0,$F8,$F8,$F0,$EC,$FC,$FC,$EC,$EC,$FC,$FC,$EC
    db $E8,$00,$00,$E8,$E8,$00,$00,$E8,$E8,$00,$00,$E8,$E8,$00,$00,$E8
    db $E8,$00,$00,$E8,$E8,$00,$00,$E8,$EC,$FC,$FC,$EC,$EC,$FC,$FC,$EC
    db $F0,$F8,$F8,$F0,$F0,$F8,$F8,$F0,$F0,$F8,$F8,$F0,$F0,$F8,$F8,$F0

ChargedBeamTrails_WaveIceSpazer_4:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$F8,$00,$F8,$00,$F8,$00,$F8
    db $00,$F0,$00,$F0,$00,$F0,$00,$F0,$FC,$F0,$04,$F0,$FC,$F0,$04,$F0
    db $F8,$F0,$08,$F0,$F8,$F0,$08,$F0,$F4,$F0,$0C,$F0,$F4,$F0,$0C,$F0
    db $F0,$F0,$10,$F0,$F0,$F0,$10,$F0,$F0,$F0,$10,$F0,$F0,$F0,$10,$F0
    db $F0,$F0,$10,$F0,$F0,$F0,$10,$F0,$F4,$F0,$0C,$F0,$F4,$F0,$0C,$F0
    db $F8,$F0,$08,$F0,$F8,$F0,$08,$F0,$FC,$F0,$04,$F0,$FC,$F0,$04,$F0

ChargedBeamTrails_WaveIceSpazer_5:
    db $00,$00,$00,$00,$00,$00,$00,$00,$08,$F8,$08,$F8,$08,$F8,$08,$F8
    db $0C,$F4,$0C,$F4,$0C,$F4,$0C,$F4,$08,$F0,$10,$F8,$08,$F0,$10,$F8
    db $08,$F0,$10,$F8,$08,$F0,$10,$F8,$04,$EC,$14,$FC,$04,$EC,$14,$FC
    db $00,$E8,$18,$00,$00,$E8,$18,$00,$00,$E8,$18,$00,$00,$E8,$18,$00
    db $00,$E8,$18,$00,$00,$E8,$18,$00,$04,$EC,$14,$FC,$04,$EC,$14,$FC
    db $08,$F0,$10,$F8,$08,$F0,$10,$F8,$08,$F0,$10,$F8,$08,$F0,$10,$F8

ChargedBeamTrails_WaveIceSpazer_6:
    db $00,$00,$00,$00,$00,$00,$00,$00,$08,$00,$08,$00,$08,$00,$08,$00
    db $10,$00,$10,$00,$10,$00,$10,$00,$10,$FC,$10,$04,$10,$FC,$10,$04
    db $10,$F8,$10,$08,$10,$F8,$10,$08,$10,$F4,$10,$0C,$10,$F4,$10,$0C
    db $10,$F0,$10,$10,$10,$F0,$10,$10,$10,$F0,$10,$10,$10,$F0,$10,$10
    db $10,$F0,$10,$10,$10,$F0,$10,$10,$10,$F4,$10,$0C,$10,$F4,$10,$0C
    db $10,$F8,$10,$08,$10,$F8,$10,$08,$10,$FC,$10,$04,$10,$FC,$10,$04

ChargedBeamTrails_WaveIceSpazer_7:
    db $00,$00,$00,$00,$00,$00,$00,$00,$08,$08,$08,$08,$08,$08,$08,$08
    db $0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C,$08,$10,$10,$08,$08,$10,$10,$08
    db $08,$10,$10,$08,$08,$10,$10,$08,$04,$14,$14,$04,$04,$14,$14,$04
    db $00,$18,$18,$00,$00,$18,$18,$00,$00,$18,$18,$00,$00,$18,$18,$00
    db $00,$18,$18,$00,$00,$18,$18,$00,$04,$14,$14,$04,$04,$14,$14,$04
    db $08,$10,$10,$08,$08,$10,$10,$08,$08,$10,$10,$08,$08,$10,$10,$08

ChargedBeamTrails_IcePlasma_0:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$0C,$00,$0C,$00,$0C,$00,$0C
    db $00,$18,$00,$18,$00,$18,$00,$18,$00,$1C,$00,$1C,$00,$1C,$00,$1C

ChargedBeamTrails_IcePlasma_1:
    db $00,$00,$00,$00,$00,$00,$00,$00,$F8,$08,$F8,$08,$F8,$08,$F8,$08
    db $F0,$10,$F0,$10,$F0,$10,$F0,$10,$E8,$18,$E8,$18,$E8,$18,$E8,$18

ChargedBeamTrails_IcePlasma_2:
    db $00,$00,$00,$00,$00,$00,$00,$00,$F4,$00,$F4,$00,$F4,$00,$F4,$00
    db $E8,$00,$E8,$00,$E8,$00,$E8,$00,$E4,$00,$E4,$00,$E4,$00,$E4,$00

ChargedBeamTrails_IcePlasma_3:
    db $00,$00,$00,$00,$00,$00,$00,$00,$F8,$F8,$F8,$F8,$F8,$F8,$F8,$F8
    db $F0,$F0,$F0,$F0,$F0,$F0,$F0,$F0,$E8,$E8,$E8,$E8,$E8,$E8,$E8,$E8

ChargedBeamTrails_IcePlasma_4:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$F4,$00,$F4,$00,$F4,$00,$F4
    db $00,$E8,$00,$E8,$00,$E8,$00,$E8,$00,$E4,$00,$E4,$00,$E4,$00,$E4

ChargedBeamTrails_IcePlasma_5:
    db $00,$00,$00,$00,$00,$00,$00,$00,$08,$F8,$08,$F8,$08,$F8,$08,$F8
    db $10,$F0,$10,$F0,$10,$F0,$10,$F0,$18,$E8,$18,$E8,$18,$E8,$18,$E8

ChargedBeamTrails_IcePlasma_6:
    db $00,$00,$00,$00,$00,$00,$00,$00,$0C,$00,$0C,$00,$0C,$00,$0C,$00
    db $18,$00,$18,$00,$18,$00,$18,$00,$1C,$00,$1C,$00,$1C,$00,$1C,$00

ChargedBeamTrails_IcePlasma_7:
    db $00,$00,$00,$00,$00,$00,$00,$00,$08,$08,$08,$08,$08,$08,$08,$08
    db $10,$10,$10,$10,$10,$10,$10,$10,$18,$18,$18,$18,$18,$18,$18,$18

ChargedBeamTrails_WaveIcePlasma_0:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$0C,$00,$0C,$00,$0C,$00,$0C
    db $00,$18,$00,$18,$00,$18,$00,$18,$00,$1C,$00,$1C,$00,$1C,$00,$1C
    db $F8,$1C,$08,$1C,$F8,$1C,$08,$1C,$F4,$1C,$0C,$1C,$F4,$1C,$0C,$1C
    db $F0,$1C,$10,$1C,$F0,$1C,$10,$1C,$F0,$1C,$10,$1C,$F0,$1C,$10,$1C
    db $F0,$1C,$10,$1C,$F0,$1C,$10,$1C,$F4,$1C,$0C,$1C,$F4,$1C,$0C,$1C
    db $F8,$1C,$08,$1C,$F8,$1C,$08,$1C

ChargedBeamTrails_WaveIcePlasma_1:
    db $00,$00,$00,$00,$00,$00,$00,$00,$F8,$08,$F8,$08,$F8,$08,$F8,$08
    db $F0,$10,$F0,$10,$F0,$10,$F0,$10,$EC,$14,$EC,$14,$EC,$14,$EC,$14
    db $E4,$0C,$F0,$18,$E4,$0C,$F0,$18,$E0,$0C,$F4,$1C,$E0,$0C,$F4,$1C
    db $E0,$08,$F8,$20,$E0,$08,$F8,$20,$E0,$08,$F8,$20,$E0,$08,$F8,$20
    db $E0,$08,$F8,$20,$E0,$08,$F8,$20,$E0,$0C,$F4,$1C,$E0,$0C,$F4,$1C
    db $E4,$0C,$F0,$18,$E4,$0C,$F0,$18

ChargedBeamTrails_WaveIcePlasma_2:
    db $00,$00,$00,$00,$00,$00,$00,$00,$F4,$00,$F4,$00,$F4,$00,$F4,$00
    db $E8,$00,$E8,$00,$E8,$00,$E8,$00,$E4,$00,$E4,$00,$E4,$00,$E4,$00
    db $E4,$F8,$E4,$08,$E4,$F8,$E4,$08,$E4,$F4,$E4,$0C,$E4,$F4,$E4,$0C
    db $E4,$F0,$E4,$10,$E4,$F0,$E4,$10,$E4,$F0,$E4,$10,$E4,$F0,$E4,$10
    db $E4,$F0,$E4,$10,$E4,$F0,$E4,$10,$E4,$F4,$E4,$0C,$E4,$F4,$E4,$0C
    db $E4,$F8,$E4,$08,$E4,$F8,$E4,$08

ChargedBeamTrails_WaveIcePlasma_3:
    db $00,$00,$00,$00,$00,$00,$00,$00,$F8,$F8,$F8,$F8,$F8,$F8,$F8,$F8
    db $F0,$F0,$F0,$F0,$F0,$F0,$F0,$F0,$EC,$EC,$EC,$EC,$EC,$EC,$EC,$EC
    db $E8,$F0,$F0,$E8,$E8,$F0,$F0,$E8,$E0,$F4,$F4,$E0,$E0,$F4,$F4,$E0
    db $E0,$F8,$F8,$E0,$E0,$F8,$F8,$E0,$E0,$F8,$F8,$E0,$E0,$F8,$F8,$E0
    db $E0,$F8,$F8,$E0,$E0,$F8,$F8,$E0,$E0,$F4,$F4,$E0,$E0,$F4,$F4,$E0
    db $E8,$F0,$F0,$E8,$E8,$F0,$F0,$E8

ChargedBeamTrails_WaveIcePlasma_4:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$F4,$00,$F4,$00,$F4,$00,$F4
    db $00,$E8,$00,$E8,$00,$E8,$00,$E8,$00,$E4,$00,$E4,$00,$E4,$00,$E4
    db $F8,$E4,$08,$E4,$F8,$E4,$08,$E4,$F4,$E4,$0C,$E4,$F4,$E4,$0C,$E4
    db $F0,$E4,$10,$E4,$F0,$E4,$10,$E4,$F0,$E4,$10,$E4,$F0,$E4,$10,$E4
    db $F0,$E4,$10,$E4,$F0,$E4,$10,$E4,$F4,$E4,$0C,$E4,$F4,$E4,$0C,$E4
    db $F8,$E4,$08,$E4,$F8,$E4,$08,$E4

ChargedBeamTrails_WaveIcePlasma_5:
    db $00,$00,$00,$00,$00,$00,$00,$00,$08,$F8,$08,$F8,$08,$F8,$08,$F8
    db $10,$F0,$10,$F0,$10,$F0,$10,$F0,$14,$EC,$14,$EC,$14,$EC,$14,$EC
    db $1C,$F4,$10,$E8,$1C,$F4,$10,$E8,$20,$F4,$0C,$E4,$20,$F4,$0C,$E4
    db $20,$F8,$08,$E0,$20,$F8,$08,$E0,$20,$F8,$08,$E0,$20,$F8,$08,$E0
    db $20,$F8,$08,$E0,$20,$F8,$08,$E0,$20,$F4,$0C,$E4,$20,$F4,$0C,$E4
    db $1C,$F4,$10,$E8,$1C,$F4,$10,$E8

ChargedBeamTrails_WaveIcePlasma_6:
    db $00,$00,$00,$00,$00,$00,$00,$00,$0C,$00,$0C,$00,$0C,$00,$0C,$00
    db $18,$00,$18,$00,$18,$00,$18,$00,$1C,$00,$1C,$00,$1C,$00,$1C,$00
    db $1C,$F8,$1C,$08,$1C,$F8,$1C,$08,$1C,$F4,$1C,$0C,$1C,$F4,$1C,$0C
    db $1C,$F0,$1C,$10,$1C,$F0,$1C,$10,$1C,$F0,$1C,$10,$1C,$F0,$1C,$10
    db $1C,$F0,$1C,$10,$1C,$F0,$1C,$10,$1C,$F4,$1C,$0C,$1C,$F4,$1C,$0C
    db $1C,$F8,$1C,$08,$1C,$F8,$1C,$08

ChargedBeamTrails_WaveIcePlasma_7:
    db $00,$00,$00,$00,$00,$00,$00,$00,$08,$08,$08,$08,$08,$08,$08,$08
    db $10,$10,$10,$10,$10,$10,$10,$10,$14,$14,$14,$14,$14,$14,$14,$14
    db $18,$10,$10,$18,$18,$10,$10,$18,$20,$0C,$0C,$20,$20,$0C,$0C,$20
    db $20,$08,$08,$20,$20,$08,$08,$20,$20,$08,$08,$20,$20,$08,$08,$20
    db $20,$08,$08,$20,$20,$08,$08,$20,$20,$0C,$0C,$20,$20,$0C,$0C,$20
    db $18,$10,$10,$18,$18,$10,$10,$18


;;; $B327: Spazer SBA trail ;;;
SpazerSBATrail_WaveSpazer:
    dw SpazerSBATrail_WaveSpazer_0                                       ; Up, facing right
    dw SpazerSBATrail_WaveSpazer_1                                       ; Up-right
    dw SpazerSBATrail_WaveSpazer_2                                       ; Right
    dw SpazerSBATrail_WaveSpazer_3                                       ; Down-right
    dw SpazerSBATrail_WaveSpazer_0                                       ; Down, facing right
    dw SpazerSBATrail_WaveSpazer_0                                       ; Down, facing left
    dw SpazerSBATrail_WaveSpazer_1                                       ; Down-left
    dw SpazerSBATrail_WaveSpazer_2                                       ; Left
    dw SpazerSBATrail_WaveSpazer_3                                       ; Up-left
    dw SpazerSBATrail_WaveSpazer_0                                       ; Up, facing left

; Format:
;     x,y,X,Y
;     x: Left trail X offset
;     y: Left trail Y offset
;     X: Right trail X offset
;     Y: Right trail Y offset

; Indexed by [[projectile instruction pointer] - 2] * 4
SpazerSBATrail_WaveSpazer_0:
    db $00,$00,$00,$00, $10,$00,$F0,$00, $00,$00,$00,$00, $F0,$00,$10,$00

SpazerSBATrail_WaveSpazer_1:
    db $00,$00,$00,$00, $F6,$F6,$0A,$0A, $00,$00,$00,$00, $0A,$0A,$F6,$F6

SpazerSBATrail_WaveSpazer_2:
    db $00,$00,$00,$00, $00,$F0,$00,$10, $00,$00,$00,$00, $00,$10,$00,$F0

SpazerSBATrail_WaveSpazer_3:
    db $00,$00,$00,$00, $0A,$F6,$F6,$0A, $00,$00,$00,$00, $F6,$0A,$0A,$F6

UNSUED_SpazerSBATrail_Spazer_IceSpazer_9BB37B:
    dw UNSUED_SpazerSBATrail_Spazer_IceSpazer_0_9BB38F
    dw UNSUED_SpazerSBATrail_Spazer_IceSpazer_0_9BB38F
    dw UNSUED_SpazerSBATrail_Spazer_IceSpazer_0_9BB38F
    dw UNSUED_SpazerSBATrail_Spazer_IceSpazer_0_9BB38F
    dw UNSUED_SpazerSBATrail_Spazer_IceSpazer_1_9BB39B
    dw UNSUED_SpazerSBATrail_Spazer_IceSpazer_1_9BB39B
    dw UNSUED_SpazerSBATrail_Spazer_IceSpazer_0_9BB38F
    dw UNSUED_SpazerSBATrail_Spazer_IceSpazer_0_9BB38F
    dw UNSUED_SpazerSBATrail_Spazer_IceSpazer_0_9BB38F
    dw UNSUED_SpazerSBATrail_Spazer_IceSpazer_0_9BB38F

UNSUED_SpazerSBATrail_Spazer_IceSpazer_0_9BB38F:
    db $00,$00,$00,$00, $F8,$08,$08,$08, $F0,$08,$10,$08

UNSUED_SpazerSBATrail_Spazer_IceSpazer_1_9BB39B:
    db $00,$00,$00,$00, $F8,$F8,$08,$F8, $F0,$F8,$10,$F8


;;; $B3A7: Set Samus death sequence pose ;;;
SetSamusDeathSequencePose:
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W MovementType : AND.W #$00FF : PHA
    CMP.W #$0003 : BNE .noSpinJumpSFX
    LDA.W #$0032
    JSL QueueSound_Lib1_Max6

  .noSpinJumpSFX:
    PLA : TAX
    LDA.W .animationFrames,X : AND.W #$00FF : PHA
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.W #$00D7 : STA.W Pose
    BRA .initPose

  .facingLeft:
    LDA.W #$00D8 : STA.W Pose

  .initPose:
    JSL InitializeSamusPose_1
    JSL Set_Samus_AnimationFrame_if_PoseChanged
    LDA.W PreviousPose : STA.W LastDifferentPose
    LDA.W PreviousPoseXDirection : STA.W LastDifferentPoseXDirection
    LDA.W Pose : STA.W PreviousPose
    LDA.W PoseXDirection : STA.W PreviousPoseXDirection
    STZ.W NewPoseSamusAnimationFrame
    PLA : STA.W SamusAnimationFrame
    LDA.W SamusXPosition : SEC : SBC.W Layer1XPosition : STA.W SamusXPosition
    LDA.W SamusYPosition : SEC : SBC.W Layer1YPosition : STA.W SamusYPosition
    PLB : PLP
    RTL

  .animationFrames:
    db $05 ; 0: Standing
    db $05 ; 1: Running
    db $05 ; 2: Normal jumping
    db $05 ; 3: Spin jumping
    db $01 ; 4: Morph ball - on ground
    db $05 ; 5: Crouching
    db $05 ; 6: Falling
    db $00 ; 7: Unused
    db $01 ; 8: Morph ball - falling
    db $00 ; 9: Unused
    db $05 ; Ah: Knockback / crystal flash ending
    db $05 ; Bh: Unused
    db $05 ; Ch: Unused
    db $05 ; Dh: Unused
    db $05 ; Eh: Turning around - on ground
    db $05 ; Fh: Crouching/standing/morphing/unmorphing transition
    db $05 ; 10h: Moonwalking
    db $01 ; 11h: Spring ball - on ground
    db $01 ; 12h: Spring ball - in air
    db $01 ; 13h: Spring ball - falling
    db $05 ; 14h: Wall jumping
    db $05 ; 15h: Ran into a wall
    db $05 ; 16h: Grappling
    db $05 ; 17h: Turning around - jumping
    db $05 ; 18h: Turning around - falling
    db $05 ; 19h: Damage boost
    db $05 ; 1Ah: Grabbed by Draygon
    db $05 ; 1Bh: Shinespark / crystal flash / drained by metroid / damaged by MB's attacks


;;; $B43C: Draw Samus starting death animation ;;;
Draw_Samus_Starting_Death_Animation_JSL:
    JSL Draw_Samus_Starting_Death_Animation
    RTL


;;; $B441: Handle death animation flashing ;;;
Handle_Death_Animation_Flashing:
;; Returns:
;;     A: 1 if flashing has ended, 0 otherwise
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W DeathAnimation_Counter : CMP.W #$0004 : BPL .timerGreaterThan3
    ASL : TAY
    JSR QueueTransferOfSegmentOfSamusDeathSequenceToVRAM

  .timerGreaterThan3:
    LDA.W DeathAnimation_Counter : INC : STA.W DeathAnimation_Counter
    CMP.W #$003C : BPL .end
    LDA.W DeathAnimation_Timer : DEC : STA.W DeathAnimation_Timer : BEQ .timerExpired ; >.<
    BPL .returnFlashing

  .timerExpired:
    LDA.W DeathAnimation_Index : BEQ .zeroIndex
    LDA.W #$0000 : STA.W DeathAnimation_Index
    LDA.W #$0003 : STA.W DeathAnimation_Timer
    BRA +

  .zeroIndex:
    LDA.W #$0001 : STA.W DeathAnimation_Index
    LDA.W #$0001 : STA.W DeathAnimation_Timer

+   LDA.W DeathAnimation_Index : ASL : TAX
    JSR WriteDeathAnimationSpritePalettes

  .returnFlashing:
    LDA.W #$0000
    PLB : PLP
    RTL

  .end:
    JSR FinishDeathAnimationFlashing
    LDA.B DP_Controller2Input : AND.W #$00B0 : CMP.W #$00B0 : BNE .debug
    LDA.W #$0001 : STA.W DebugDeathAnimationFlag
    BRA .returnFlashingEnded

  .debug:
    STZ.W $0DEC

  .returnFlashingEnded:
    LDA.W #$0001
    PLB : PLP
    RTL


;;; $B4B6: Finish death animation flashing ;;;
FinishDeathAnimationFlashing:
; Writes the first frame of beam charging palette for Samus to end the last yellow frame, I guess(?)
; Also writes background colours (in preparation?) for the fade-to-white(?)
    PHP
    REP #$30
    LDY.W SuitPaletteIndex
    LDA.W .suitPalettes,Y : TAX
    LDA.W $0000,X : TAX
    PHB
    PEA SamusPalettes_PowerSuit>>8&$FF00 : PLB : PLB
    LDA.W $0000,X : STA.L Palettes_SpriteP4C0
    LDA.W $0002,X : STA.L Palettes_SpriteP4C1
    LDA.W $0004,X : STA.L Palettes_SpriteP4C2
    LDA.W $0006,X : STA.L Palettes_SpriteP4C3
    LDA.W $0008,X : STA.L Palettes_SpriteP4C4
    LDA.W $000A,X : STA.L Palettes_SpriteP4C5
    LDA.W $000C,X : STA.L Palettes_SpriteP4C6
    LDA.W $000E,X : STA.L Palettes_SpriteP4C7
    LDA.W $0010,X : STA.L Palettes_SpriteP4C8
    LDA.W $0012,X : STA.L Palettes_SpriteP4C9
    LDA.W $0014,X : STA.L Palettes_SpriteP4CA
    LDA.W $0016,X : STA.L Palettes_SpriteP4CB
    LDA.W $0018,X : STA.L Palettes_SpriteP4CC
    LDA.W $001A,X : STA.L Palettes_SpriteP4CD
    LDA.W $001C,X : STA.L Palettes_SpriteP4CE
    LDA.W $001E,X : STA.L Palettes_SpriteP4CF
    LDX.W #SamusPalettes_DeathSequence_SuitlessSamus_0
    LDA.W $0000,X : STA.L Palettes_SpriteP7
    LDA.W $0002,X : STA.L Palettes_SpriteP7+2
    LDA.W $0004,X : STA.L Palettes_SpriteP7+4
    LDA.W $0006,X : STA.L Palettes_SpriteP7+6
    LDA.W $0008,X : STA.L Palettes_SpriteP7+8
    LDA.W $000A,X : STA.L Palettes_SpriteP7+$A
    LDA.W $000C,X : STA.L Palettes_SpriteP7+$C
    LDA.W $000E,X : STA.L Palettes_SpriteP7+$E
    LDA.W $0010,X : STA.L Palettes_SpriteP7+$10
    LDA.W $0012,X : STA.L Palettes_SpriteP7+$12
    LDA.W $0014,X : STA.L Palettes_SpriteP7+$14
    LDA.W $0016,X : STA.L Palettes_SpriteP7+$16
    LDA.W $0018,X : STA.L Palettes_SpriteP7+$18
    LDA.W $001A,X : STA.L Palettes_SpriteP7+$1A
    LDA.W $001C,X : STA.L Palettes_SpriteP7+$1C
    LDA.W $001E,X : STA.L Palettes_SpriteP7+$1E
    PLB
    LDY.W #$0008
    JSR QueueTransferOfSegmentOfSamusDeathSequenceToVRAM
    LDA.W DeathSequenceSuitExplosionPaletteIndexTable_timer : AND.W #$00FF : STA.W DeathAnimation_Timer
    STZ.W DeathAnimation_Index : STZ.W DeathAnimation_Counter
    JSR HandleDeathSequenceSuitExplosion
    PLP
    RTS

  .suitPalettes:
    dw SamusDeathSequencePalettePointers_Suit_power
    dw SamusDeathSequencePalettePointers_Suit_varia
    dw SamusDeathSequencePalettePointers_Suit_gravity


;;; $B5CE: Write death animation sprite palettes ;;;
WriteDeathAnimationSpritePalettes:
;; Parameters:
;;     X: Death animation palette table index
    PHP
    REP #$30
    LDY.W SuitPaletteIndex
    LDA.W .suitPalettes,Y : STA.B DP_Temp14
    LDA.W SamusDeathSequencePalettePointers_Suitless,X : STA.B DP_Temp12
    TXA : CLC : ADC.B DP_Temp14 : TAX
    LDA.W $0000,X : TAX
    PHB
    PEA SamusPalettes_PowerSuit>>8&$FF00 : PLB : PLB
    LDA.W $0000,X : STA.L Palettes_SpriteP4C0
    LDA.W $0002,X : STA.L Palettes_SpriteP4C1
    LDA.W $0004,X : STA.L Palettes_SpriteP4C2
    LDA.W $0006,X : STA.L Palettes_SpriteP4C3
    LDA.W $0008,X : STA.L Palettes_SpriteP4C4
    LDA.W $000A,X : STA.L Palettes_SpriteP4C5
    LDA.W $000C,X : STA.L Palettes_SpriteP4C6
    LDA.W $000E,X : STA.L Palettes_SpriteP4C7
    LDA.W $0010,X : STA.L Palettes_SpriteP4C8
    LDA.W $0012,X : STA.L Palettes_SpriteP4C9
    LDA.W $0014,X : STA.L Palettes_SpriteP4CA
    LDA.W $0016,X : STA.L Palettes_SpriteP4CB
    LDA.W $0018,X : STA.L Palettes_SpriteP4CC
    LDA.W $001A,X : STA.L Palettes_SpriteP4CD
    LDA.W $001C,X : STA.L Palettes_SpriteP4CE
    LDA.W $001E,X : STA.L Palettes_SpriteP4CF
    LDX.B DP_Temp12
    LDA.W $0000,X : STA.L Palettes_SpriteP7
    LDA.W $0002,X : STA.L Palettes_SpriteP7+2
    LDA.W $0004,X : STA.L Palettes_SpriteP7+4
    LDA.W $0006,X : STA.L Palettes_SpriteP7+6
    LDA.W $0008,X : STA.L Palettes_SpriteP7+8
    LDA.W $000A,X : STA.L Palettes_SpriteP7+$A
    LDA.W $000C,X : STA.L Palettes_SpriteP7+$C
    LDA.W $000E,X : STA.L Palettes_SpriteP7+$E
    LDA.W $0010,X : STA.L Palettes_SpriteP7+$10
    LDA.W $0012,X : STA.L Palettes_SpriteP7+$12
    LDA.W $0014,X : STA.L Palettes_SpriteP7+$14
    LDA.W $0016,X : STA.L Palettes_SpriteP7+$16
    LDA.W $0018,X : STA.L Palettes_SpriteP7+$18
    LDA.W $001A,X : STA.L Palettes_SpriteP7+$1A
    LDA.W $001C,X : STA.L Palettes_SpriteP7+$1C
    LDA.W $001E,X : STA.L Palettes_SpriteP7+$1E
    PLB : PLP
    RTS

  .suitPalettes:
    dw SamusDeathSequencePalettePointers_Suit_power
    dw SamusDeathSequencePalettePointers_Suit_varia
    dw SamusDeathSequencePalettePointers_Suit_gravity


;;; $B6D8: Queue transfer of segment of Samus death sequence to VRAM ;;;
QueueTransferOfSegmentOfSamusDeathSequenceToVRAM:
;; Parameters:
;;     Y: Samus death sequence segment index
    PHP
    REP #$30
    LDX.W VRAMWriteStack
    LDA.W #$0400 : STA.B VRAMWrite.size,X
    INX #2
    LDA.W SamusDeathSequencePointers_Source,Y : STA.B VRAMWrite.size,X
    INX #2
    SEP #$20
    LDA.B #SamusDeathSequencePointers_Destination>>16 : STA.B VRAMWrite.size,X
    REP #$20
    INX
    LDA.W SamusDeathSequencePointers_Destination,Y : STA.B VRAMWrite.size,X
    INX #2 : STX.W VRAMWriteStack
    PLP
    RTS


;;; $B701: Handle death sequence suit explosion white out ;;;
Handle_DeathSequence_SuitExplosionWhiteOut:
;; Returns:
;;     A: 1 if finished, 0 otherwise
    PHP : PHB
    PHK : PLB
    REP #$30
    JSR HandleDeathSequenceWhiteOut
    JSR HandleDeathSequenceSuitExplosion
    PLB : PLP
    RTL


;;; $B710: Handle death sequence white out ;;;
HandleDeathSequenceWhiteOut:
    PHP
    REP #$30
    LDA.W #Palettes>>8&$FF00 : STA.B DP_Temp01
    LDA.W DebugDeathAnimationFlag : BNE .return
    LDA.W DeathAnimation_Index : BEQ .return
    LDA.W DeathAnimation_Counter : ASL : TAX
    LDA.W #Palettes : STA.B DP_Temp00
    LDY.W #$0000

  .loopFirstFourPalettes:
    LDA.W ShadesOfWhite,X : STA.B [DP_Temp00],Y
    INY #2 : CPY.W #$0180 : BMI .loopFirstFourPalettes
    LDY.W #$01A0

  .loopLastFourPalettes:
    LDA.W ShadesOfWhite,X : STA.B [DP_Temp00],Y
    INY #2 : CPY.W #$01E0 : BMI .loopLastFourPalettes
    LDA.W DeathAnimation_Counter : CMP.W #$0014 : BPL .return
    INC : STA.W DeathAnimation_Counter

  .return:
    PLP
    RTS


;;; $B758: Handle death sequence suit explosion ;;;
HandleDeathSequenceSuitExplosion:
;; Returns:
;;     A: 1 if suit explosion has ended, 0 otherwise
    PHP
    REP #$30
    LDA.W DeathAnimation_Timer : DEC : STA.W DeathAnimation_Timer : BEQ .timerExpired
    BPL .notFinished

  .timerExpired:
    LDA.W DeathAnimation_Index : INC : STA.W DeathAnimation_Index
    CMP.W #$0009 : BMI .lessThan9
    LDA.W #$0015 : STA.W DeathAnimation_Counter
    JSR HandleDeathSequenceWhiteOut
    STZ.W DebugDeathAnimationFlag
    LDA.W #$0001
    BRA .return

  .lessThan9:
    LDA.W DebugDeathAnimationFlag : BEQ .lessThan2
    LDA.W DeathAnimation_Index : CMP.W #$0002 : BMI .lessThan2
    ASL : TAX
    LDA.W DeathSequenceSuitExplosionPaletteIndexTable_timer,X : AND.W #$00FF : STA.W DeathAnimation_Timer
    BRA .notFinished

  .lessThan2:
    LDA.W DeathAnimation_Index : ASL : TAX
    LDA.W DeathSequenceSuitExplosionPaletteIndexTable_timer,X : AND.W #$00FF : STA.W DeathAnimation_Timer
    LDA.W DeathSequenceSuitExplosionPaletteIndexTable_index,X : AND.W #$00FF : ASL : TAX
    JSR WriteDeathAnimationSpritePalettes

  .notFinished:
    JSL DrawSamusSuitExploding
    LDA.W #$0000

  .return:
    PLP
    RTS


;;; $B7BF: Samus death sequence segment source pointers ;;;
SamusDeathSequencePointers_Source:
    dw $8400,$8800,$8C00,$9000,$8000


;;; $B7C9: Samus death sequence segment destination pointers ;;;
SamusDeathSequencePointers_Destination:
    dw $6200,$6400,$6600,$6800,$6000


;;; $B7D3: Death sequence palette pointers - suit ;;;
SamusDeathSequencePalettePointers_Suit:
  .power:
    dw SamusPalettes_PowerSuit_DeathSequence_BeamCharging_0
    dw SamusPalettes_DeathSequence_YellowFlash
    dw SamusPalettes_PowerSuit_DeathSequence_BeamCharging_1
    dw SamusPalettes_PowerSuit_DeathSequence_BeamCharging_2
    dw SamusPalettes_PowerSuit_DeathSequence_BeamCharging_3
    dw SamusPalettes_PowerSuit_DeathSequence_4
    dw SamusPalettes_PowerSuit_DeathSequence_5
    dw SamusPalettes_PowerSuit_DeathSequence_6
    dw SamusPalettes_PowerSuit_DeathSequence_7
    dw SamusPalettes_DeathSequence_SuitlessSamus_8

  .varia:
    dw SamusPalettes_VariaSuit_DeathSequence_BeamCharging_0
    dw SamusPalettes_DeathSequence_YellowFlash
    dw SamusPalettes_VariaSuit_DeathSequence_BeamCharging_1
    dw SamusPalettes_VariaSuit_DeathSequence_BeamCharging_2
    dw SamusPalettes_VariaSuit_DeathSequence_BeamCharging_3
    dw SamusPalettes_VariaSuit_DeathSequence_4
    dw SamusPalettes_VariaSuit_DeathSequence_5
    dw SamusPalettes_VariaSuit_DeathSequence_6
    dw SamusPalettes_VariaSuit_DeathSequence_7
    dw SamusPalettes_DeathSequence_SuitlessSamus_8

  .gravity:
    dw SamusPalettes_GravitySuit_DeathSequence_BeamCharging_0
    dw SamusPalettes_DeathSequence_YellowFlash
    dw SamusPalettes_GravitySuit_DeathSequence_BeamCharging_1
    dw SamusPalettes_GravitySuit_DeathSequence_BeamCharging_2
    dw SamusPalettes_GravitySuit_DeathSequence_BeamCharging_3
    dw SamusPalettes_GravitySuit_DeathSequence_4
    dw SamusPalettes_GravitySuit_DeathSequence_5
    dw SamusPalettes_GravitySuit_DeathSequence_6
    dw SamusPalettes_GravitySuit_DeathSequence_7
    dw SamusPalettes_DeathSequence_SuitlessSamus_8


;;; $B80F: Death sequence palette pointers - suitless Samus ;;;
SamusDeathSequencePalettePointers_Suitless:
    dw SamusPalettes_DeathSequence_SuitlessSamus_0
    dw SamusPalettes_DeathSequence_SuitlessSamus_0
    dw SamusPalettes_DeathSequence_SuitlessSamus_1
    dw SamusPalettes_DeathSequence_SuitlessSamus_2
    dw SamusPalettes_DeathSequence_SuitlessSamus_3
    dw SamusPalettes_DeathSequence_SuitlessSamus_4
    dw SamusPalettes_DeathSequence_SuitlessSamus_5
    dw SamusPalettes_DeathSequence_SuitlessSamus_6
    dw SamusPalettes_DeathSequence_SuitlessSamus_7
    dw SamusPalettes_DeathSequence_SuitlessSamus_8


;;; $B823: Death sequence suit explosion palette index table ;;;
DeathSequenceSuitExplosionPaletteIndexTable:
; Used by HandleDeathSequenceSuitExplosion
;        _____ Timer
;       |    _ Palette table index (for SamusDeathSequencePalettePointers_Suit_power and SamusDeathSequencePalettePointers_Suitless)
;       |   |
  .timer:
    db $15
  .index:
    db     $00
    db $06,$02
    db $03,$03
    db $04,$04
    db $05,$05
    db $05,$06
    db $06,$07
    db $06,$08
    db $50,$09


;;; $B835: Shades of white ;;;
ShadesOfWhite:
    dw $0421,$0C63,$14A5,$1CE7,$2529,$2D6B,$35AD,$4210
    dw $4A52,$4E73,$5294,$56B5,$5AD6,$5EF7,$6318,$6739
    dw $6B5A,$6F7B,$739C,$77BD,$7BDE,$7FFF


;;; $B861: Cancel grapple beam if in incompatible pose ;;;
CancelGrappleBeamIfInIncompatiblePose:
    LDA.W MovementType : AND.W #$00FF : TAX
    LDA.W .poses,X : AND.W #$00FF : BEQ .grappleAllowed

  .cancelGrapple:
    LDA.W GrappleBeam_Function : CMP.W #GrappleBeamFunction_Inactive : BEQ .return
    LDA.W #GrappleBeamFunction_HitNothing_Cancel : STA.W GrappleBeam_Function

  .return:
    RTS

  .grappleAllowed:
    LDA.W GrappleBeam_Function : CMP.W #GrappleBeamFunction_Inactive : BEQ .return
    CMP.W #GrappleBeamFunction_Connected_LockedInPlace : BPL .return
    LDA.W Pose : ASL #3 : TAX
    LDA.L PoseDefinitions_directionShotsFired,X : AND.W #$00FF : BIT.W #$00F0 : BNE .cancelGrapple
    CMP.W GrappleBeam_DirectionFired : BNE +
    RTS

+   LDA.W GrappleBeam_PoseChangeAutoFireTimer : BEQ .cancelGrapple
    LDA.W #$0007
    JSL QueueSound_Lib1_Max6
    LDA.W #GrappleBeamFunction_Fire_GotoCancel : STA.W GrappleBeam_Function
    RTS

  .poses:
; Indexed by Samus movement type, 1 = cancel grapple beam
    db $00 ;  0: Standing
    db $00 ;  1: Running
    db $00 ;  2: Normal jumping
    db $01 ; *3: Spin jumping
    db $01 ; *4: Morph ball - on ground
    db $00 ;  5: Crouching
    db $00 ;  6: Falling
    db $01 ; *7: Unused
    db $01 ; *8: Morph ball - falling
    db $01 ; *9: Unused
    db $01 ; *Ah: Knockback / crystal flash ending
    db $00 ;  Bh: Unused
    db $00 ;  Ch: Unused
    db $01 ; *Dh: Unused
    db $01 ; *Eh: Turning around - on ground
    db $01 ; *Fh: Crouching/standing/morphing/unmorphing transition
    db $00 ;  10h: Moonwalking
    db $01 ; *11h: Spring ball - on ground
    db $01 ; *12h: Spring ball - in air
    db $01 ; *13h: Spring ball - falling
    db $01 ; *14h: Wall jumping
    db $00 ;  15h: Ran into a wall
    db $00 ;  16h: Grappling
    db $01 ; *17h: Turning around - jumping
    db $01 ; *18h: Turning around - falling
    db $01 ; *19h: Damage boost
    db $00 ;  1Ah: Grabbed by Draygon
    db $01 ; *1Bh: Shinespark / crystal flash / drained by metroid / damaged by MB's attacks


;;; $B8D4: RTS ;;;
RTS_9BB8D4:
; Looks like RTS'd out code
    RTS

; Load direction grapple is fired from pose definitions
    LDA.W Pose : ASL #3 : TAX
    LDA.L PoseDefinitions_directionShotsFired,X : AND.W #$00FF : BIT.W #$00F0 : BNE .return
    CMP.W GrappleBeam_DirectionFired : BEQ .return
    STA.W GrappleBeam_DirectionFired

  .return:
    RTS


;;; $B8F1: Check if grapple is connected to block ;;;
CheckIfGrappleIsConnectedToBlock:
;; Returns:
;;     Carry: Set if grapple is connected, clear otherwise
    STZ.W GrappleBeam_ExtensionXSubVelocity : STZ.W GrappleBeam_ExtensionYSubVelocity
    JSL BlockGrappleReaction
    BCC .returnNotConnected
    LDA.W #$0001 : STA.W GrappleConnectedFlags
    SEC
    RTS

  .returnNotConnected:
    CLC
    RTS


;;; $B907: Process enemy / grapple beam collision result ;;;
ProcessEnemyGrappleBeamCollisionResult:
;; Parameters:
;;     A: Grapple reaction index
;;     {
;;         0: Otherwise
;;         1: Enemy grapple AI = $8005 - Samus latches on
;;         2: Enemy grapple AI = $800A - kill enemy
;;         3: Enemy grapple AI = $800F - cancel grapple beam
;;         4: Enemy grapple AI = $8014 - Samus latches on - no invincibility
;;         5: Enemy grapple AI = $8019 - Samus latches on - paralyse enemy
;;         6: Enemy grapple AI = $801E - hurt Samus
;;     }
;;     $12: Collided enemy ID
;; Returns:
;;     A: If carry is set: non-zero to cancel grapple beam
;;     Carry: Set if enemy collision occurred
    ASL : TAX
    JMP.W (.pointers,X)

  .pointers:
    dw CLCRTS_9BB91A
    dw ReturnZero_SECRTS_9BB91C
    dw CLCRTS_9BB921
    dw ReturnOne_SECRTS_9BB923
    dw ReturnZero_SECRTS_9BB928
    dw ReturnZero_SECRTS_9BB92D
    dw ProcessEnemyGrappleBeamCollisionResult_HurtSamus


;;; $B91A: Process enemy / grapple beam collision result - grapple reaction index = 0 (default) - clear carry ;;;
CLCRTS_9BB91A:
    CLC
    RTS


;;; $B91C: Process enemy / grapple beam collision result - grapple reaction index = 1 (Samus latches on) - set carry, A = 0 ;;;
ReturnZero_SECRTS_9BB91C:
    LDA.W #$0000
    SEC
    RTS


;;; $B921: Process enemy / grapple beam collision result - grapple reaction index = 2 (kill enemy) - clear carry ;;;
CLCRTS_9BB921:
    CLC
    RTS


;;; $B923: Process enemy / grapple beam collision result - grapple reaction index = 3 (cancel grapple beam) - set carry, A = 1 ;;;
ReturnOne_SECRTS_9BB923:
    LDA.W #$0001
    SEC
    RTS


;;; $B928: Process enemy / grapple beam collision result - grapple reaction index = 4 (Samus latches on - no invincibility) - set carry, A = 0 ;;;
ReturnZero_SECRTS_9BB928:
    LDA.W #$0000
    SEC
    RTS


;;; $B92D: Process enemy / grapple beam collision result - grapple reaction index = 5 (Samus latches on - paralyse enemy) - set carry, A = 0 ;;;
ReturnZero_SECRTS_9BB92D:
    LDA.W #$0000
    SEC
    RTS


;;; $B932: Process enemy / grapple beam collision result - grapple reaction index = 6 (hurt Samus) - hurt Samus, set carry, A = 1 ;;;
ProcessEnemyGrappleBeamCollisionResult_HurtSamus:
    LDX.B DP_Temp12
    LDA.L EnemyHeaders_damage,X : STA.B DP_Temp12
    LDA.W EquippedItems : BIT.W #$0020 : BNE .gravitySuit
    LSR : BCC .suitless
    LSR.B DP_Temp12

  .suitless:
    LDA.B DP_Temp12
    BRA .damageSamus

  .gravitySuit:
    LSR.B DP_Temp12 : LSR.B DP_Temp12
    LDA.B DP_Temp12

  .damageSamus:
    JSL Deal_A_Damage_to_Samus
    LDA.W #$0060 : STA.W SamusInvincibilityTimer
    LDA.W #$0005 : STA.W SamusKnockbackTimer
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    STZ.W KnockbackXDirection
    BRA .returnOneCarrySet

  .facingLeft:
    LDA.W #$0001 : STA.W KnockbackXDirection

  .returnOneCarrySet:
    LDA.W #$0001
    SEC
    RTS


;;; $B97C: Handle connecting grapple ;;;
HandleConnectingGrapple:
    LDA.W MovementType : AND.W #$00FF : CMP.W #$001A : BNE .notGrabbedByDraygon
    LDA.W #GrappleBeamFunction_Connected_LockedInPlace : STA.W GrappleBeam_Function
    STZ.W GrappleBeam_LengthDelta
    RTS

  .notGrabbedByDraygon:
    LDA.W GrappleBeam_DirectionFired : ASL #2 : TAX
    LDA.W SamusYSpeed : BNE .movingVertically
    LDA.W SamusYSubSpeed : BNE .movingVertically
    LDA.W MovementType : AND.W #$00FF : CMP.W #$0005 : BEQ .crouching
    LDA.W ConnectingToGrappleBlockPointerTable_Default_next,X : STA.W GrappleBeam_Function
    LDA.W ConnectingToGrappleBlockPointerTable_Default_function,X : STA.W GrappleCollision_JumpAddress
    JMP.W (GrappleCollision_JumpAddress)

  .crouching:
    LDA.W ConnectingToGrappleBlockPointerTable_Crouching_next,X : STA.W GrappleBeam_Function
    LDA.W ConnectingToGrappleBlockPointerTable_Crouching_function,X : STA.W GrappleCollision_JumpAddress
    JMP.W (GrappleCollision_JumpAddress)

  .movingVertically:
    LDA.W ConnectingToGrappleBlockPointerTable_MovingVertically_next,X : STA.W GrappleBeam_Function
    LDA.W ConnectingToGrappleBlockPointerTable_MovingVertically_function,X : STA.W GrappleCollision_JumpAddress
    JMP.W (GrappleCollision_JumpAddress)


;;; $B9D9: Handle connecting grapple - swinging clockwise ;;;
HandleConnectingGrapple_SwingingClockwise:
    LDA.W #$00B2 : STA.W SpecialProspectivePose
    JMP HandleConnectingGrapple_Swinging


;;; $B9E2: Handle connecting grapple - swinging anticlockwise ;;;
HandleConnectingGrapple_SwingingAntiClockwise:
    LDA.W #$00B3 : STA.W SpecialProspectivePose
    BRA HandleConnectingGrapple_Swinging


;;; $B9EA: Handle connecting grapple - standing - aiming right ;;;
HandleConnectingGrapple_Standing_AimingRight:
    LDA.W #$00A8 : STA.W SpecialProspectivePose
    JMP HandleConnectingGrapple_StuckInPlace


;;; $B9F3: Handle connecting grapple - standing - aiming down-right ;;;
HandleConnectingGrapple_Standing_AimingDownRight:
    LDA.W #$00AA : STA.W SpecialProspectivePose
    JMP HandleConnectingGrapple_StuckInPlace


;;; $B9FC: Handle connecting grapple - standing - aiming down-left ;;;
HandleConnectingGrapple_Standing_AimingDownLeft:
    LDA.W #$00AB : STA.W SpecialProspectivePose
    JMP HandleConnectingGrapple_StuckInPlace


;;; $BA05: Handle connecting grapple - standing - aiming left ;;;
HandleConnectingGrapple_Standing_AimingLeft:
    LDA.W #$00A9 : STA.W SpecialProspectivePose
    JMP HandleConnectingGrapple_StuckInPlace


;;; $BA0E: Handle connecting grapple - crouching - aiming right ;;;
HandleConnectingGrapple_Crouching_AimingRight:
    LDA.W #$00B4 : STA.W SpecialProspectivePose
    JMP HandleConnectingGrapple_StuckInPlace


;;; $BA17: Handle connecting grapple - crouching - aiming down-right ;;;
HandleConnectingGrapple_Crouching_AimingDownRight:
    LDA.W #$00B6 : STA.W SpecialProspectivePose
    JMP HandleConnectingGrapple_StuckInPlace


;;; $BA20: Handle connecting grapple - crouching - aiming down-left ;;;
HandleConnectingGrapple_Crouching_AimingDownLeft:
    LDA.W #$00B7 : STA.W SpecialProspectivePose
    JMP HandleConnectingGrapple_StuckInPlace


;;; $BA29: Handle connecting grapple - crouching - aiming left ;;;
HandleConnectingGrapple_Crouching_AimingLeft:
    LDA.W #$00B5 : STA.W SpecialProspectivePose
    BRA HandleConnectingGrapple_StuckInPlace


if !FEATURE_KEEP_UNREFERENCED
;;; $BA31: Unused. Handle connecting grapple - in air - aiming right ;;;
UNUSED_HandleConnectingGrapple_InAir_AimingRight_9BBA31:
    LDA.W #$00AC : STA.W SpecialProspectivePose
    BRA HandleConnectingGrapple_StuckInPlace


;;; $BA39: Unused. Handle connecting grapple - in air - aiming down-right ;;;
UNUSED_HandleConnectingGrapple_InAir_AimingDownRight_9BBA39:
    LDA.W #$00B0 : STA.W SpecialProspectivePose
    BRA HandleConnectingGrapple_StuckInPlace


;;; $BA41: Unused. Handle connecting grapple - in air - aiming down, facing right ;;;
UNUSED_HandleConnectingGrapple_InAir_AimingDown_FaceR_9BBA41:
    LDA.W #$00AE : STA.W SpecialProspectivePose
    BRA HandleConnectingGrapple_StuckInPlace


;;; $BA49: Unused. Handle connecting grapple - in air - aiming down, facing left ;;;
UNUSED_HandleConnectingGrapple_InAir_AimingDown_FaceL_9BBA49:
    LDA.W #$00AF : STA.W SpecialProspectivePose
    BRA HandleConnectingGrapple_StuckInPlace


;;; $BA51: Unused. Handle connecting grapple - in air - aiming down-left ;;;
UNUSED_HandleConnectingGrapple_InAir_AimingDownLeft_9BBA51:
    LDA.W #$00B1 : STA.W SpecialProspectivePose
    BRA HandleConnectingGrapple_StuckInPlace


;;; $BA59: Unused. Handle connecting grapple - in air - aiming left ;;;
UNUSED_HandleConnectingGrapple_InAir_AimingLeft_9BBA59:
    LDA.W #$00AD : STA.W SpecialProspectivePose
    BRA HandleConnectingGrapple_StuckInPlace
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $BA61: Handle connecting grapple - swinging ;;;
HandleConnectingGrapple_Swinging:
    LDA.W #$0009 : STA.W SpecialProspectivePoseChangeCommand
    LDA.W SamusXPosition : SEC : SBC.W GrappleBeam_EndXPosition : STA.B DP_Temp12
    LDA.W SamusYPosition : SEC : SBC.W GrappleBeam_EndYPosition : STA.B DP_Temp14
    JSL CalculateAngleOf_12_14_Offset
    XBA : STA.W GrappleBeam_EndAngle : STA.W GrappleBeam_EndAngleMirror
    STZ.W GrappleBeam_LengthDelta
    LDA.W GrappleBeam_Length : CMP.W #$0040 : BMI .lessThan40
    SEC : SBC.W #$0018 : STA.W GrappleBeam_Length

  .lessThan40:
    JSL UpdateGrappleBeamStartPositionDuringGrappleSwinging
    RTS


;;; $BA9B: Handle connecting grapple - stuck in place ;;;
HandleConnectingGrapple_StuckInPlace:
    LDA.W #$000A : STA.W SpecialProspectivePoseChangeCommand
    LDA.W SamusXPosition : SEC : SBC.W GrappleBeam_EndXPosition : STA.B DP_Temp12
    LDA.W SamusYPosition : SEC : SBC.W GrappleBeam_EndYPosition : STA.B DP_Temp14
    JSL CalculateAngleOf_12_14_Offset
    XBA : STA.W GrappleBeam_EndAngle : STA.W GrappleBeam_EndAngleMirror
    STZ.W GrappleBeam_LengthDelta
    LDA.W GrappleBeam_Length : CMP.W #$0040 : BMI .lessThan40
    SEC : SBC.W #$0018 : STA.W GrappleBeam_Length

  .lessThan40:
    JSL UpdateGrappleBeamStartPositionDuringGrappleSwinging
    RTS


;;; $BAD5: Handle special grapple beam angles ;;;
HandleSpecialGrappleBeamAngles:
;; Returns:
;;     Carry: set if handled special grapple beam angle

; Angles:
;     8D.80h: Wallgrab facing right
;     96.80h: Wallgrab facing left
;     B3.80h: Locked in place - crouching - aiming down-right
;     D6.80h: Locked in place - crouching - aiming down-right
;     2A.80h: Locked in place - crouching - aiming down-left
;     4D.80h: Locked in place - crouching - aiming down-left
;     6A.80h: Wallgrab facing right
;     73.80h: Wallgrab facing left
    LDX.W #$0046

  .loop:
    LDA.W GrappleBeam_EndAngle : CMP.W GrappleBeamSpecialAngles_angle,X : BEQ .specialAngle
    TXA : SEC : SBC.W #$000A : TAX : BPL .loop
    CLC
    RTS

  .specialAngle:
    LDA.W GrappleBeamSpecialAngles_pose,X : STA.W SpecialProspectivePose
    LDA.W GrappleBeamSpecialAngles_XOffset,X : CLC : ADC.W GrappleBeam_EndXPosition : STA.W SamusXPosition
    LDA.W GrappleBeamSpecialAngles_YOffset,X : CLC : ADC.W GrappleBeam_EndYPosition : STA.W SamusYPosition
    LDA.W GrappleBeamSpecialAngles_grappleFunction,X : STA.W GrappleBeam_Function
    STZ.W SpecialProspectivePoseChangeCommand : STZ.W GrappleBeam_SlowScrollingFlag
    LDA.W SamusXPosition : SEC : SBC.W SamusPreviousXPosition : BMI .checkNegativeX
    CMP.W #$000D : BMI +
    LDA.W SamusXPosition : SEC : SBC.W #$000C : STA.W SamusPreviousXPosition
    BRA +

  .checkNegativeX:
    CMP.W #$FFF4 : BPL +
    LDA.W SamusXPosition : CLC : ADC.W #$000C : STA.W SamusPreviousXPosition

+   LDA.W SamusYPosition : SEC : SBC.W SamusPreviousYPosition : BMI .checkNegativeY
    CMP.W #$000D : BMI .returnCarrySet
    LDA.W SamusYPosition : SEC : SBC.W #$000C : STA.W SamusPreviousYPosition
    BRA .returnCarrySet

  .checkNegativeY:
    CMP.W #$FFF4 : BPL .returnCarrySet
    LDA.W SamusYPosition : CLC : ADC.W #$000C : STA.W SamusPreviousYPosition

  .returnCarrySet:
    SEC
    RTS


;;; $BB64: Handle grapple d-pad input ;;;
HandleGrappleDpadInput:
    LDA.B DP_Controller1New : BIT.W #$0800 : BNE .decreaseLength
    BIT.W #$0400 : BNE .increaseLength

  .gotoAdjustLengthEnd:
    BRA .adjustLengthEnd

  .fullyLengthened:
    LDA.W #$0040 : STA.W GrappleBeam_Length
    BRA .adjustLengthEnd

  .increaseLength:
    LDA.W GrappleBeam_Length : CMP.W #$0040 : BPL .fullyLengthened
    LDA.W #$0002 : STA.W GrappleBeam_LengthDelta
    BRA .adjustLengthEnd

  .decreaseLength:
    LDA.W GrappleBeam_Length : BEQ .gotoAdjustLengthEnd
    LDA.W #$0002 : EOR.W #$FFFF : INC : STA.W GrappleBeam_LengthDelta

  .adjustLengthEnd:
    LDA.W GrappleBeam_EndAngle : AND.W #$FF00 : CMP.W #$4000 : BMI .resetAccel
    CMP.W #$C000 : BPL .resetAccel
    LDA.B DP_Controller1Input : BIT.W #$0200 : BNE .left
    BIT.W #$0100 : BNE .right

  .resetAccel:
    STZ.W GrappleBeam_SwingAngularAccelerationDueToButtonInput
    RTS

  .right:
    LDA.W GrappleBeam_EndAngle : AND.W #$FF00 : CMP.W #$8000 : BNE .checkLiquidPhysics
    LDA.W GrappleBeam_SwingAngularVelocity : BNE .checkLiquidPhysics
    LDA.W #$FF00 : STA.W GrappleBeam_SwingAngularVelocity

  .checkLiquidPhysics:
    LDA.W GrappleBeam_Flags : BEQ .minusC
    BIT.W #$0001 : BEQ .minusC
    LDA.W GrappleSwingConstants_AccelerationDueToButtonInput : LSR
    EOR.W #$FFFF : INC : STA.W GrappleBeam_SwingAngularAccelerationDueToButtonInput
    RTS

  .minusC:
    LDA.W GrappleSwingConstants_AccelerationDueToButtonInput : EOR.W #$FFFF : INC : STA.W GrappleBeam_SwingAngularAccelerationDueToButtonInput
    RTS

  .left:
    LDA.W GrappleBeam_EndAngle : AND.W #$FF00 : CMP.W #$8000 : BNE ..accellerate
    LDA.W GrappleBeam_SwingAngularVelocity : BNE ..accellerate
    LDA.W #$0100 : STA.W GrappleBeam_SwingAngularVelocity

  ..accellerate:
    LDA.W GrappleBeam_Flags : BEQ ..plusC
    BIT.W #$0001 : BEQ ..plusC
    LDA.W GrappleSwingConstants_AccelerationDueToButtonInput : LSR : STA.W GrappleBeam_SwingAngularAccelerationDueToButtonInput
    RTS

  ..plusC:
    LDA.W GrappleSwingConstants_AccelerationDueToButtonInput : STA.W GrappleBeam_SwingAngularAccelerationDueToButtonInput
    RTS


;;; $BC1F: Determine grapple swing angular acceleration due to angle of swing ;;;
DetermineGrappleSwingAngularAccelerationDueToAngleOfSwing:
    LDA.W GrappleBeam_EndAngle : AND.W #$C000 : CMP.W #$C000 : BEQ .gotoUpLeft
    BIT.W #$8000 : BNE .downLeft
    BIT.W #$4000 : BNE .downRight
    LDA.W GrappleSwingConstants_Deceleration : LSR #2 : STA.W GrappleBeam_SwingAngularDeceleration
    LDA.W GrappleBeam_Flags : BEQ +
    BIT.W #$0001 : BEQ +
    LDA.W GrappleSwingConstants_AccelerationDueToAngleOfSwing : LSR #3 : STA.W GrappleBeam_SwingAngularAccelerationDueToAngleOfSwing
    RTS

; Up right
+   LDA.W GrappleSwingConstants_AccelerationDueToAngleOfSwing : LSR #2 : STA.W GrappleBeam_SwingAngularAccelerationDueToAngleOfSwing
    RTS

  .gotoUpLeft:
    JMP .upLeft

  .downRight:
    LDA.W GrappleSwingConstants_Deceleration : STA.W GrappleBeam_SwingAngularDeceleration
    LDA.W GrappleBeam_Flags : BEQ +
    BIT.W #$0001 : BEQ +
    LDA.W GrappleSwingConstants_AccelerationDueToAngleOfSwing : LSR : STA.W GrappleBeam_SwingAngularAccelerationDueToAngleOfSwing
    RTS

+   LDA.W GrappleSwingConstants_AccelerationDueToAngleOfSwing : STA.W GrappleBeam_SwingAngularAccelerationDueToAngleOfSwing
    RTS

  .downLeft:
    LDA.W GrappleBeam_EndAngle : AND.W #$FF00 : CMP.W #$8000 : BEQ .straightDown
    LDA.W GrappleSwingConstants_Deceleration : EOR.W #$FFFF : INC : STA.W GrappleBeam_SwingAngularDeceleration
    LDA.W GrappleBeam_Flags : BEQ +
    BIT.W #$0001 : BEQ +
    LDA.W GrappleSwingConstants_AccelerationDueToAngleOfSwing : LSR
    EOR.W #$FFFF : INC : STA.W GrappleBeam_SwingAngularAccelerationDueToAngleOfSwing
    RTS

+   LDA.W GrappleSwingConstants_AccelerationDueToAngleOfSwing : EOR.W #$FFFF : INC : STA.W GrappleBeam_SwingAngularAccelerationDueToAngleOfSwing
    RTS

  .straightDown:
    STZ.W GrappleBeam_SwingAngularAccelerationDueToAngleOfSwing : STZ.W GrappleBeam_SwingAngularDeceleration
    LDA.W GrappleBeam_SwingAngularVelocity : BPL +
    DEC : EOR.W #$FFFF

+   XBA : AND.W #$00FF : CMP.W #$0001 : BMI .resetAngularVelocity
    RTS

  .resetAngularVelocity:
    STZ.W GrappleBeam_SwingAngularVelocity
    RTS

  .upLeft:
    LDA.W GrappleSwingConstants_Deceleration : LSR #2 : EOR.W #$FFFF : INC : STA.W GrappleBeam_SwingAngularDeceleration
    LDA.W GrappleBeam_Flags : BEQ .minus6
    BIT.W #$0001 : BEQ .minus6
    LDA.W GrappleSwingConstants_AccelerationDueToAngleOfSwing : LSR #3
    EOR.W #$FFFF : INC : STA.W GrappleBeam_SwingAngularAccelerationDueToAngleOfSwing
    RTS

  .minus6:
    LDA.W GrappleSwingConstants_AccelerationDueToAngleOfSwing : LSR #2
    EOR.W #$FFFF : INC : STA.W GrappleBeam_SwingAngularAccelerationDueToAngleOfSwing
    RTS


;;; $BCFF: Update grapple swing angular velocity ;;;
UpdateGrappleSwingAngularVelocity:
    LDA.W GrappleBeam_SwingAngularVelocity : CLC : ADC.W GrappleBeam_SwingAngularAccelerationDueToAngleOfSwing
    CLC : ADC.W GrappleBeam_SwingAngularAccelerationDueToButtonInput : STA.W GrappleBeam_SwingAngularVelocity
    LDA.W GrappleBeam_EndAngle : EOR.W GrappleBeam_SwingAngularVelocity : BPL .notRising
    LDA.W GrappleBeam_SwingAngularVelocity : CLC : ADC.W GrappleBeam_SwingAngularDeceleration : STA.W GrappleBeam_SwingAngularVelocity

  .notRising:
    LDA.W GrappleBeam_SwingAngularVelocity : BPL .positiveAngularVelocity
    EOR.W #$FFFF : INC : CMP.W GrappleSwingConstants_AbsoluteAngularVelocity : BCC .return
    LDA.W GrappleSwingConstants_AbsoluteAngularVelocity : EOR.W #$FFFF : INC : STA.W GrappleBeam_SwingAngularVelocity
    RTS

  .positiveAngularVelocity:
    CMP.W GrappleSwingConstants_AbsoluteAngularVelocity : BCC .return
    LDA.W GrappleSwingConstants_AbsoluteAngularVelocity : STA.W GrappleBeam_SwingAngularVelocity

  .return:
    RTS


;;; $BD44: Handle grapple kick ;;;
HandleGrappleKick:
    LDA.W GrappleBeam_KickCooldownTimer : BEQ .return
    LDA.B DP_Controller1New : BIT.W JumpBinding : BEQ .return
    LDA.W GrappleBeam_SwingAngularVelocity : BNE .nonZeroAngularVelocity
    STZ.W GrappleBeam_ExtraSwingAngularVelocity

  .return:
    RTS

  .nonZeroAngularVelocity:
    BMI .antiClockwise
    LDA.W GrappleBeam_Flags : BEQ .notLiquidPhysics
    BIT.W #$0001 : BEQ .notLiquidPhysics
    LDA.W GrappleSwingConstants_ExtraAngularVelocity_GrappleKick : LSR : STA.W GrappleBeam_ExtraSwingAngularVelocity
    RTS

  .notLiquidPhysics:
    LDA.W GrappleSwingConstants_ExtraAngularVelocity_GrappleKick : STA.W GrappleBeam_ExtraSwingAngularVelocity
    RTS

  .antiClockwise:
    LDA.W GrappleBeam_Flags : BEQ ..notLiquidPhysics
    BIT.W #$0001 : BEQ ..notLiquidPhysics
    LDA.W GrappleSwingConstants_ExtraAngularVelocity_GrappleKick : LSR
    EOR.W #$FFFF : INC : STA.W GrappleBeam_ExtraSwingAngularVelocity
    RTS

  ..notLiquidPhysics:
    LDA.W GrappleSwingConstants_ExtraAngularVelocity_GrappleKick : EOR.W #$FFFF : INC : STA.W GrappleBeam_ExtraSwingAngularVelocity
    RTS


;;; $BD95: Set Samus animation frame and position during grapple swinging ;;;
SetSamusAnimationFrameAndPositionDuringGrappleSwinging:
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W GrappleBeam_SwingAngularVelocity : BPL +
    EOR.W #$FFFF : INC

+   CMP.W #$0040 : BMI .slowGrapple
    LDA.W #$0001 : STA.W GrappleBeam_SlowScrollingFlag
    BRA .setSwingingAnimationFrame

  .slowGrapple:
    STZ.W GrappleBeam_SlowScrollingFlag
    LDA.W GrappleBeam_EndAngle : AND.W #$FF00 : CMP.W #$8000 : BNE .setSwingingAnimationFrame
    LDA.W SamusAnimationFrame : CMP.W #$0040 : BPL .straightDown
    LDA.W #$0008 : STA.W SamusAnimationFrameTimer
    LDA.W #$0040 : STA.W SamusAnimationFrame

  .straightDown:
    LDA.W GrappleBeam_EndAngleMirror+1 : AND.W #$00FF : TAX
    LDA.W GrappleSwingSamusXYOffsets,X : AND.W #$00FF
    BRA .merge

  .setSwingingAnimationFrame:
    LDA.W #$000F : STA.W SamusAnimationFrameTimer
    LDA.W GrappleBeam_EndAngleMirror+1 : AND.W #$00FF : TAX
    LDA.W GrappleSwingSamusXYOffsets,X : AND.W #$00FF : STA.W SamusAnimationFrame

  .merge:
    ASL : TAX
    LDA.W GrappleBeam_ExtraSwingAngularVelocity : BPL +
    EOR.W #$FFFF : INC

+   AND.W #$FF00 : CMP.W #$0100 : BNE .notGrappleKicking
    LDA.W SamusAnimationFrame : CMP.W #$0040 : BMI .grappleKicking
    LDA.W #$0010

  .grappleKicking:
    CLC : ADC.W #$0020 : STA.W SamusAnimationFrame

  .notGrappleKicking:
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .right
    LDA.W GrappleSwingSamusXYOffsets_Right-1,X : AND.W #$FF00 : XBA : BPL +
    ORA.W #$FF00

+   CLC : ADC.W GrappleBeam_StartXPosition : STA.W SamusXPosition
    LDA.W GrappleSwingSamusXYOffsets_Right,X : AND.W #$FF00 : XBA : BPL +
    ORA.W #$FF00

+   CLC : ADC.W GrappleBeam_StartYPosition : STA.W SamusYPosition
    LDA.W GrappleBeam_StartXPosition : STA.W GrappleBeam_FlareXPosition
    LDA.W GrappleBeam_StartYPosition : STA.W GrappleBeam_FlareYPosition
    JSR ClampScrollingSpeed
    PLB : PLP
    RTL

  .right:
    LDA.W GrappleSwingSamusXYOffsets_Left-1,X : AND.W #$FF00 : XBA : BPL +
    ORA.W #$FF00

+   CLC : ADC.W GrappleBeam_StartXPosition : STA.W SamusXPosition
    LDA.W GrappleSwingSamusXYOffsets_Left,X : AND.W #$FF00 : XBA : BPL +
    ORA.W #$FF00

+   CLC : ADC.W GrappleBeam_StartYPosition : STA.W SamusYPosition
    LDA.W GrappleBeam_StartXPosition : STA.W GrappleBeam_FlareXPosition
    LDA.W GrappleBeam_StartYPosition : STA.W GrappleBeam_FlareYPosition
    JSR ClampScrollingSpeed
    PLB : PLP
    RTL


;;; $BE98: Clamp scrolling speed ;;;
ClampScrollingSpeed:
    LDA.W SamusXPosition : SEC : SBC.W SamusPreviousXPosition : BMI +
    CMP.W #$000D : BMI .previousY
    LDA.W SamusXPosition : SEC : SBC.W #$000C : STA.W SamusPreviousXPosition
    BRA .previousY

+   CMP.W #$FFF4 : BPL .previousY
    LDA.W SamusXPosition : CLC : ADC.W #$000C : STA.W SamusPreviousXPosition

  .previousY:
    LDA.W SamusYPosition : SEC : SBC.W SamusPreviousYPosition : BMI +
    CMP.W #$000D : BMI .return
    LDA.W SamusYPosition : SEC : SBC.W #$000C : STA.W SamusPreviousYPosition
    BRA .return

+   CMP.W #$FFF4 : BPL .return
    LDA.W SamusYPosition : CLC : ADC.W #$000C : STA.W SamusPreviousYPosition

  .return:
    RTS


;;; $BEEB: Set Samus animation frame and position for connecting grapple stuck in place ;;;
SetSamusAnimationFrameAndPositionForConnectingGrapple_Stuck:
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W GrappleBeam_DirectionFired : ASL : TAX
    LDA.W GrappleBeam_StartXPosition : SEC : SBC.W GrappleBeamFireOffsets_NotRunning_OriginX,X : STA.W SamusXPosition
    CLC : ADC.W GrappleBeamFireOffsets_NotRunning_FlareX,X : STA.W GrappleBeam_FlareXPosition
    LDA.W GrappleBeam_StartYPosition : SEC : SBC.W GrappleBeamFireOffsets_NotRunning_OriginY,X : STA.W SamusYPosition
    CLC : ADC.W GrappleBeamFireOffsets_NotRunning_FlareY,X : STA.W GrappleBeam_FlareYPosition
    PLB : PLP
    RTL


;;; $BF1B: Update grapple beam start position during grapple fire ;;;
UpdateGrappleBeamStartPositionDuringGrappleFire:
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W Pose : ASL #3 : TAX
    LDA.L PoseDefinitions_YOffset,X : AND.W #$00FF : STA.B DP_Temp16
    LDA.W GrappleBeam_DirectionFired : ASL : TAX
    LDA.W Pose : CMP.W #$0049 : BEQ .moonwalking
    CMP.W #$004A : BEQ .moonwalking
    LDA.W MovementType : AND.W #$00FF : CMP.W #$0001 : BEQ .running

  .moonwalking:
    LDA.W SamusXPosition : PHA
    CLC : ADC.W GrappleBeamFireOffsets_NotRunning_OriginX,X : STA.W GrappleBeam_StartXPosition
    PLA : CLC : ADC.W GrappleBeamFireOffsets_NotRunning_FlareX,X : STA.W GrappleBeam_FlareXPosition
    LDA.W SamusYPosition : SEC : SBC.B DP_Temp16 : PHA
    CLC : ADC.W GrappleBeamFireOffsets_NotRunning_OriginY,X : STA.W GrappleBeam_StartYPosition
    PLA : CLC : ADC.W GrappleBeamFireOffsets_NotRunning_FlareY,X : STA.W GrappleBeam_FlareYPosition
    BRA .return

  .running:
    LDA.W SamusXPosition : PHA
    CLC : ADC.W GrappleBeamFireOffsets_Running_OriginX,X : STA.W GrappleBeam_StartXPosition
    PLA : CLC : ADC.W GrappleBeamFireOffsets_Running_FlareX,X : STA.W GrappleBeam_FlareXPosition
    LDA.W SamusYPosition : SEC : SBC.B DP_Temp16 : PHA
    CLC : ADC.W GrappleBeamFireOffsets_Running_OriginY,X : STA.W GrappleBeam_StartYPosition
    PLA : CLC : ADC.W GrappleBeamFireOffsets_Running_FlareY,X : STA.W GrappleBeam_FlareYPosition

  .return:
    PLB : PLP
    RTL


;;; $BFA5: Update grapple beam tiles and increment flare counter ;;;
UpdateGrappleBeamTiles_IncrementFlareCounter:
    PHP : PHB
    PHK : PLB
    REP #$30
    JSR UpdateGrappleBeamTiles
    LDA.W SamusProjectile_FlareCounter : CMP.W #$0078 : BPL .return
    INC : STA.W SamusProjectile_FlareCounter

  .return:
    PLB : PLP
    RTL


;;; $BFBD: Update grapple beam tiles ;;;
UpdateGrappleBeamTiles:
    LDA.W GrappleBeam_StartAnimationTimer : DEC : STA.W GrappleBeam_StartAnimationTimer : BPL .timerNotExpired
    LDA.W #$0005 : STA.W GrappleBeam_StartAnimationTimer
    LDA.W GrappleBeam_StartAnimationTilePointer : CLC : ADC.W #$0200 : STA.W GrappleBeam_StartAnimationTilePointer
    CMP.W GrappleBeamStartTilesBeginEndPointers_1 : BMI .timerNotExpired
    LDA.W GrappleBeamStartTilesBeginEndPointers_0 : STA.W GrappleBeam_StartAnimationTilePointer

  .timerNotExpired:
    LDX.W VRAMWriteStack
    LDA.W #$0020 : STA.B VRAMWrite.size,X
    INX #2
    LDA.W GrappleBeam_StartAnimationTilePointer : STA.B VRAMWrite.size,X
    INX #2
    SEP #$20
    LDA.B #Tiles_GrappleBeam_Horizontal_Beam>>16 : STA.B VRAMWrite.size,X
    REP #$20
    INX
    LDA.W #$6200 : STA.B VRAMWrite.size,X
    INX #2 : STX.W VRAMWriteStack
    LDA.W GrappleBeam_EndAngle : AND.W #$FF00 : XBA : LSR : AND.W #$00FE : TAY
    LDX.W VRAMWriteStack
    LDA.W #$0080 : STA.B VRAMWrite.size,X
    INX #2
    LDA.W GrappleBeamTilesPointers,Y : STA.B VRAMWrite.size,X
    INX #2
    SEP #$20
    LDA.B #Tiles_GrappleBeam_Horizontal_Beam>>16 : STA.B VRAMWrite.size,X
    REP #$20
    INX
    LDA.W #$6210 : STA.B VRAMWrite.size,X
    INX #2 : STX.W VRAMWriteStack
    RTS


;;; $C036: Handle grapple beam flare ;;;
HandleGrappleBeamFlare:
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W SamusProjectile_FlareCounter : BNE .nonZeroCounter
    PLB : PLP
    RTL

  .nonZeroCounter:
    CMP.W #$0001 : BNE .greaterThan1
    LDA.W #$0010 : STA.W SamusProjectile_FlareAnimationFrame
    LDA.W #$0003 : STA.W SamusProjectile_FlareAnimationTimer

  .greaterThan1:
    LDA.W SamusProjectile_FlareAnimationTimer : DEC : STA.W SamusProjectile_FlareAnimationTimer : BPL .positive
    LDA.W SamusProjectile_FlareAnimationFrame : INC : STA.W SamusProjectile_FlareAnimationFrame : TAX
    LDA.L FlareAnimationDelays_MainFlare,X : AND.W #$00FF : CMP.W #$00FE : BEQ .frameFE
    BRA .setAnimationTimer

  .frameFE:
    INX
    LDA.L FlareAnimationDelays_MainFlare,X : AND.W #$00FF : STA.B DP_Temp12
    LDA.W SamusProjectile_FlareAnimationFrame : SEC : SBC.B DP_Temp12 : STA.W SamusProjectile_FlareAnimationFrame
    TAX

  .setAnimationTimer:
    LDA.L FlareAnimationDelays_MainFlare,X : AND.W #$00FF : STA.W SamusProjectile_FlareAnimationTimer

  .positive:
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.L FlareSpritemapTable_IndexOffsets_facingRight : CLC : ADC.W SamusProjectile_FlareAnimationFrame : STA.B DP_Temp16
    BRA +

  .facingLeft:
    LDA.L FlareSpritemapTable_IndexOffsets_facingLeft : CLC : ADC.W SamusProjectile_FlareAnimationFrame : STA.B DP_Temp16

+   LDA.W GrappleBeam_FlareXPosition : SEC : SBC.W Layer1XPosition : STA.B DP_Temp14
    LDA.W GrappleBeam_FlareYPosition : SEC : SBC.W Layer1YPosition : STA.B DP_Temp12
    AND.W #$FF00 : BNE +
    LDA.B DP_Temp16
    JSL AddSpritemapFrom_93A1A1_TableToOAM
    BRA .return

+   LDA.B DP_Temp16
    JSL RTL_818AB7

  .return:
    PLB : PLP
    RTL


;;; $C0DB: Grapple beam fire velocity table ;;;
GrappleBeamFireVelocityTable:
;        _______________________________________________________ 0: Up, facing right
;       |      _________________________________________________ 1: Up-right
;       |     |      ___________________________________________ 2: Right
;       |     |     |      _____________________________________ 3: Down-right
;       |     |     |     |      _______________________________ 4: Down, facing right
;       |     |     |     |     |      _________________________ 5: Down, facing left
;       |     |     |     |     |     |      ___________________ 6: Down-left
;       |     |     |     |     |     |     |      _____________ 7: Left
;       |     |     |     |     |     |     |     |      _______ 8: Up-left
;       |     |     |     |     |     |     |     |     |      _ 9: Up, facing left
;       |     |     |     |     |     |     |     |     |     |
  .X:
; Grapple beam extension X velocity * 100h (must be multiple of 4)
    dw $0000,$087C,$0BF4,$087C,$0000,$0000,$F784,$F40C,$F784,$0000

  .Y:
; Grapple beam extension X velocity * 100h (must be multiple of 4)
    dw $F40C,$F784,$0000,$087C,$0BF4,$0BF4,$087C,$0000,$F784,$F40C


if !FEATURE_KEEP_UNREFERENCED
;;; $C103: Unused ;;;
UNUSED_9BC103:
    db $80
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C104: Grapple beam fire angles ;;;
GrappleBeamFireAngles:
;        _______________________________________________________ 0: Up, facing right
;       |      _________________________________________________ 1: Up-right
;       |     |      ___________________________________________ 2: Right
;       |     |     |      _____________________________________ 3: Down-right
;       |     |     |     |      _______________________________ 4: Down, facing right
;       |     |     |     |     |      _________________________ 5: Down, facing left
;       |     |     |     |     |     |      ___________________ 6: Down-left
;       |     |     |     |     |     |     |      _____________ 7: Left
;       |     |     |     |     |     |     |     |      _______ 8: Up-left
;       |     |     |     |     |     |     |     |     |      _ 9: Up, facing left
;       |     |     |     |     |     |     |     |     |     |
; Indexed by [direction grapple is fired] * 2
    dw $8000,$A000,$C000,$E000,$0000,$0000,$2000,$4000,$6000,$8000


;;; $C118: Grapple swing constants ;;;
GrappleSwingConstants_AccelerationDueToAngleOfSwing:
; Grapple swing Samus base acceleration due to angle of swing
    dw $0018

GrappleSwingConstants_AccelerationDueToButtonInput:
; Grapple swing Samus base acceleration due to button input
    dw $000C

GrappleSwingConstants_Deceleration:
; Grapple swing Samus base deceleration
    dw $0005

GrappleSwingConstants_AbsoluteAngularVelocity:
; Absolute grapple swing angular velocity
    dw $0480

GrappleSwingConstants_ExtraAngularVelocity_GrappleKick:
; Extra grapple swing angular velocity (for grapple kick)
    dw $0300


;;; $C122: Grapple beam fire offsets ;;;
; Indexed by [direction grapple is fired] * 2
;        _______________________________________________________ 0: Up, facing right
;       |      _________________________________________________ 1: Up-right
;       |     |      ___________________________________________ 2: Right
;       |     |     |      _____________________________________ 3: Down-right
;       |     |     |     |      _______________________________ 4: Down, facing right
;       |     |     |     |     |      _________________________ 5: Down, facing left
;       |     |     |     |     |     |      ___________________ 6: Down-left
;       |     |     |     |     |     |     |      _____________ 7: Left
;       |     |     |     |     |     |     |     |      _______ 8: Up-left
;       |     |     |     |     |     |     |     |     |      _ 9: Up, facing left
;       |     |     |     |     |     |     |     |     |     |
GrappleBeamFireOffsets_NotRunning_OriginX:
    dw $0002,$000A,$0002,$000A,$0003,$FFFC,$FFF6,$FFFE,$FFF6,$FFFE

GrappleBeamFireOffsets_NotRunning_OriginY:
    dw $FFF0,$FFF4,$0002,$0000,$0006,$0006,$0000,$0002,$FFF4,$FFF0

GrappleBeamFireOffsets_NotRunning_FlareX:
    dw $0002,$0012,$000F,$0011,$0003,$FFFC,$FFEF,$FFF1,$FFEE,$FFFE

GrappleBeamFireOffsets_NotRunning_FlareY:
    dw $FFE4,$FFED,$0001,$0006,$0011,$0011,$0006,$0001,$FFEC,$FFE4

GrappleBeamFireOffsets_Running_OriginX:
    dw $0002,$000A,$0002,$000A,$0003,$FFFC,$FFF6,$FFFE,$FFF6,$FFFE

GrappleBeamFireOffsets_Running_OriginY:
    dw $FFF0,$FFF4,$FFFE,$0000,$0006,$0006,$0000,$FFFE,$FFF4,$FFF0

GrappleBeamFireOffsets_Running_FlareX:
    dw $0002,$0013,$0014,$0012,$0003,$FFFC,$FFEE,$FFEC,$FFED,$FFFE

GrappleBeamFireOffsets_Running_FlareY:
    dw $FFE0,$FFEA,$FFFD,$0006,$0019,$0019,$0006,$FFFD,$FFEC,$FFE0


;;; $C1C2: Grapple swing Samus X/Y offsets ;;;
GrappleSwingSamusXYOffsets:
; Indices into $C2C2/C302 tables. Indexed by [grapple beam end angle] / 100h
    db $00,$00,$00,$00,$01,$01,$01,$01,$01,$01,$01,$01,$02,$02,$02,$02
    db $02,$02,$02,$02,$03,$03,$03,$03,$03,$03,$03,$03,$04,$04,$04,$04
    db $04,$04,$04,$04,$05,$05,$05,$05,$05,$05,$05,$05,$06,$06,$06,$06
    db $06,$06,$06,$06,$07,$07,$07,$07,$07,$07,$07,$07,$08,$08,$08,$08
    db $08,$08,$08,$08,$09,$09,$09,$09,$09,$09,$09,$09,$0A,$0A,$0A,$0A
    db $0A,$0A,$0A,$0A,$0B,$0B,$0B,$0B,$0B,$0B,$0B,$0B,$0C,$0C,$0C,$0C
    db $0C,$0C,$0C,$0C,$0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D,$0E,$0E,$0E,$0E
    db $0E,$0E,$0E,$0E,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$10,$10,$10,$10
    db $10,$10,$10,$10,$11,$11,$11,$11,$11,$11,$11,$11,$12,$12,$12,$12
    db $12,$12,$12,$12,$13,$13,$13,$13,$13,$13,$13,$13,$14,$14,$14,$14
    db $14,$14,$14,$14,$15,$15,$15,$15,$15,$15,$15,$15,$16,$16,$16,$16
    db $16,$16,$16,$16,$17,$17,$17,$17,$17,$17,$17,$17,$18,$18,$18,$18
    db $18,$18,$18,$18,$19,$19,$19,$19,$19,$19,$19,$19,$1A,$1A,$1A,$1A
    db $1A,$1A,$1A,$1A,$1B,$1B,$1B,$1B,$1B,$1B,$1B,$1B,$1C,$1C,$1C,$1C
    db $1C,$1C,$1C,$1C,$1D,$1D,$1D,$1D,$1D,$1D,$1D,$1D,$1E,$1E,$1E,$1E
    db $1E,$1E,$1E,$1E,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$00,$00,$00,$00

; X/Y offsets of Samus from grapple beam start position
GrappleSwingSamusXYOffsets_Left:
; Swinging left
    db $00,$F1, $07,$F2, $0C,$F5, $12,$F6, $16,$FA, $1A,$02, $1D,$05, $1F,$0A
    db $1F,$11, $1E,$16, $1B,$1B, $1A,$1F, $15,$26, $10,$29, $10,$2C, $08,$2E
    db $00,$2F, $F9,$2E, $F4,$2B, $EE,$2A, $EA,$26, $E6,$1E, $E3,$1B, $E1,$16
    db $E1,$0F, $E2,$0A, $E5,$05, $E6,$01, $EB,$FA, $F0,$F7, $F0,$F4, $F8,$F2

GrappleSwingSamusXYOffsets_Right:
; Swinging right
    db $00,$F2, $09,$F3, $10,$F6, $12,$F8, $15,$FB, $1A,$02, $1C,$06, $1E,$0A
    db $1E,$10, $1E,$17, $1B,$1C, $1A,$21, $15,$25, $10,$29, $0B,$2B, $05,$2D
    db $00,$2E, $F7,$2D, $F0,$2A, $EE,$28, $EB,$25, $E6,$1E, $E4,$1A, $E2,$16
    db $E1,$0F, $E2,$09, $E5,$04, $E6,$FF, $EB,$FB, $F0,$F7, $F5,$F5, $FB,$F3


;;; $C342: Grapple beam start tiles begin/end pointers ;;;
; Bank $9A
GrappleBeamStartTilesBeginEndPointers_0:
    dw Tiles_GrappleBeam_Horizontal_Beam

GrappleBeamStartTilesBeginEndPointers_1:
    dw Tiles_GrappleBeam_Diagonal_Beam


;;; $C346: Grapple beam tiles pointers ;;;
GrappleBeamTilesPointers:
; Bank $9A
    dw Tiles_GrappleBeam_Vertical_Beam+$20
    dw Tiles_GrappleBeam_Vertical_Beam+$20
    dw Tiles_GrappleBeam_Vertical_Beam+$20
    dw Tiles_GrappleBeam_Diagonal_Beam+$20
    dw Tiles_GrappleBeam_Diagonal_Beam+$20
    dw Tiles_GrappleBeam_Diagonal_Beam+$20
    dw Tiles_GrappleBeam_Diagonal_Beam+$20
    dw Tiles_GrappleBeam_Diagonal_Beam+$20
    dw Tiles_GrappleBeam_Diagonal_Beam+$20
    dw Tiles_GrappleBeam_Diagonal_Beam+$20
    dw Tiles_GrappleBeam_Diagonal_Beam+$20
    dw Tiles_GrappleBeam_Horizontal_Beam+$20
    dw Tiles_GrappleBeam_Horizontal_Beam+$20
    dw Tiles_GrappleBeam_Horizontal_Beam+$20
    dw Tiles_GrappleBeam_Horizontal_Beam+$20
    dw Tiles_GrappleBeam_Horizontal_Beam+$20
    dw Tiles_GrappleBeam_Horizontal_Beam+$20
    dw Tiles_GrappleBeam_Horizontal_Beam+$20
    dw Tiles_GrappleBeam_Horizontal_Beam+$20
    dw Tiles_GrappleBeam_Horizontal_Beam+$20
    dw Tiles_GrappleBeam_Horizontal_Beam+$20
    dw Tiles_GrappleBeam_Diagonal_Beam+$20
    dw Tiles_GrappleBeam_Diagonal_Beam+$20
    dw Tiles_GrappleBeam_Diagonal_Beam+$20
    dw Tiles_GrappleBeam_Diagonal_Beam+$20
    dw Tiles_GrappleBeam_Diagonal_Beam+$20
    dw Tiles_GrappleBeam_Diagonal_Beam+$20
    dw Tiles_GrappleBeam_Diagonal_Beam+$20
    dw Tiles_GrappleBeam_Diagonal_Beam+$20
    dw Tiles_GrappleBeam_Vertical_Beam+$20
    dw Tiles_GrappleBeam_Vertical_Beam+$20
    dw Tiles_GrappleBeam_Vertical_Beam+$20
    dw Tiles_GrappleBeam_Vertical_Beam+$20
    dw Tiles_GrappleBeam_Vertical_Beam+$20
    dw Tiles_GrappleBeam_Vertical_Beam+$20
    dw Tiles_GrappleBeam_Diagonal_Beam+$20
    dw Tiles_GrappleBeam_Diagonal_Beam+$20
    dw Tiles_GrappleBeam_Diagonal_Beam+$20
    dw Tiles_GrappleBeam_Diagonal_Beam+$20
    dw Tiles_GrappleBeam_Diagonal_Beam+$20
    dw Tiles_GrappleBeam_Diagonal_Beam+$20
    dw Tiles_GrappleBeam_Diagonal_Beam+$20
    dw Tiles_GrappleBeam_Diagonal_Beam+$20
    dw Tiles_GrappleBeam_Horizontal_Beam+$20
    dw Tiles_GrappleBeam_Horizontal_Beam+$20
    dw Tiles_GrappleBeam_Horizontal_Beam+$20
    dw Tiles_GrappleBeam_Horizontal_Beam+$20
    dw Tiles_GrappleBeam_Horizontal_Beam+$20
    dw Tiles_GrappleBeam_Horizontal_Beam+$20
    dw Tiles_GrappleBeam_Horizontal_Beam+$20
    dw Tiles_GrappleBeam_Horizontal_Beam+$20
    dw Tiles_GrappleBeam_Horizontal_Beam+$20
    dw Tiles_GrappleBeam_Horizontal_Beam+$20
    dw Tiles_GrappleBeam_Diagonal_Beam+$20
    dw Tiles_GrappleBeam_Diagonal_Beam+$20
    dw Tiles_GrappleBeam_Diagonal_Beam+$20
    dw Tiles_GrappleBeam_Diagonal_Beam+$20
    dw Tiles_GrappleBeam_Diagonal_Beam+$20
    dw Tiles_GrappleBeam_Diagonal_Beam+$20
    dw Tiles_GrappleBeam_Diagonal_Beam+$20
    dw Tiles_GrappleBeam_Diagonal_Beam+$20
    dw Tiles_GrappleBeam_Vertical_Beam+$20
    dw Tiles_GrappleBeam_Vertical_Beam+$20
    dw Tiles_GrappleBeam_Vertical_Beam+$20


;;; $C3C6: Connecting to grapple block pointer table ;;;
ConnectingToGrappleBlockPointerTable_Default:
; Indexed by [direction grapple is fired] * 4.
; Next grapple beam functions:
;     $C77E: Connected - locked in place
;     $C79D: Connected - swinging
  .next: ; Next grapple beam function
    dw GrappleBeamFunction_Connected_Swinging
  .function: ; Function to execute
    dw HandleConnectingGrapple_SwingingClockwise
    dw GrappleBeamFunction_Connected_Swinging
    dw HandleConnectingGrapple_SwingingClockwise
    dw GrappleBeamFunction_Connected_LockedInPlace
    dw HandleConnectingGrapple_Standing_AimingRight
    dw GrappleBeamFunction_Connected_LockedInPlace
    dw HandleConnectingGrapple_Standing_AimingDownRight
    dw GrappleBeamFunction_Connected_LockedInPlace
    dw HandleConnectingGrapple_Standing_AimingDownLeft
    dw GrappleBeamFunction_Connected_LockedInPlace
    dw HandleConnectingGrapple_Standing_AimingDownLeft
    dw GrappleBeamFunction_Connected_LockedInPlace
    dw HandleConnectingGrapple_Standing_AimingDownLeft
    dw GrappleBeamFunction_Connected_LockedInPlace
    dw HandleConnectingGrapple_Standing_AimingLeft
    dw GrappleBeamFunction_Connected_Swinging
    dw HandleConnectingGrapple_SwingingAntiClockwise
    dw GrappleBeamFunction_Connected_Swinging
    dw HandleConnectingGrapple_SwingingAntiClockwise

ConnectingToGrappleBlockPointerTable_MovingVertically:
  .next:
    dw GrappleBeamFunction_Connected_Swinging
  .function:
    dw HandleConnectingGrapple_SwingingClockwise
    dw GrappleBeamFunction_Connected_Swinging
    dw HandleConnectingGrapple_SwingingClockwise
    dw GrappleBeamFunction_Connected_Swinging
    dw HandleConnectingGrapple_SwingingClockwise
    dw GrappleBeamFunction_Connected_Swinging
    dw HandleConnectingGrapple_SwingingClockwise
    dw GrappleBeamFunction_Connected_Swinging
    dw HandleConnectingGrapple_SwingingClockwise
    dw GrappleBeamFunction_Connected_Swinging
    dw HandleConnectingGrapple_SwingingAntiClockwise
    dw GrappleBeamFunction_Connected_Swinging
    dw HandleConnectingGrapple_SwingingAntiClockwise
    dw GrappleBeamFunction_Connected_Swinging
    dw HandleConnectingGrapple_SwingingAntiClockwise
    dw GrappleBeamFunction_Connected_Swinging
    dw HandleConnectingGrapple_SwingingAntiClockwise
    dw GrappleBeamFunction_Connected_Swinging
    dw HandleConnectingGrapple_SwingingAntiClockwise

ConnectingToGrappleBlockPointerTable_Crouching:
  .next:
    dw GrappleBeamFunction_Connected_Swinging
  .function:
    dw HandleConnectingGrapple_SwingingClockwise
    dw GrappleBeamFunction_Connected_Swinging
    dw HandleConnectingGrapple_SwingingClockwise
    dw GrappleBeamFunction_Connected_LockedInPlace
    dw HandleConnectingGrapple_Crouching_AimingRight
    dw GrappleBeamFunction_Connected_LockedInPlace
    dw HandleConnectingGrapple_Crouching_AimingDownRight
    dw GrappleBeamFunction_Connected_LockedInPlace
    dw HandleConnectingGrapple_Standing_AimingDownLeft
    dw GrappleBeamFunction_Connected_LockedInPlace
    dw HandleConnectingGrapple_Standing_AimingDownLeft
    dw GrappleBeamFunction_Connected_LockedInPlace
    dw HandleConnectingGrapple_Crouching_AimingDownLeft
    dw GrappleBeamFunction_Connected_LockedInPlace
    dw HandleConnectingGrapple_Crouching_AimingLeft
    dw GrappleBeamFunction_Connected_Swinging
    dw HandleConnectingGrapple_SwingingAntiClockwise
    dw GrappleBeamFunction_Connected_Swinging
    dw HandleConnectingGrapple_SwingingAntiClockwise


;;; $C43E: Grapple beam special angles ;;;
GrappleBeamSpecialAngles:
; Samus poses:
;     B6h: Facing right - grappling - crouching - aiming down-right
;     B7h: Facing left  - grappling - crouching - aiming down-left
;     B8h: Facing left  - grapple wall jump pose
;     B9h: Facing right - grapple wall jump pose

; Grapple functions
;     C77E: Connected - locked in place
;     C814: Wallgrab

;        __________________________ Angle. Unit pi/8000h radians
;       |      ____________________ Samus pose
;       |     |      ______________ X offset
;       |     |     |      ________ Y offset
;       |     |     |     |
  .angle:
    dw $D680
  .pose:
    dw       $00B6
  .XOffset:
    dw             $FFE2
  .YOffset:
    dw                   $FFE8
  .grappleFunction:
    dw GrappleBeamFunction_Connected_LockedInPlace
    dw $2A80,$00B7,$001E,$FFE8
    dw GrappleBeamFunction_Connected_LockedInPlace
    dw $B380,$00B6,$FFE4,$FFF8
    dw GrappleBeamFunction_Connected_LockedInPlace
    dw $4D80,$00B7,$001C,$FFF8
    dw GrappleBeamFunction_Connected_LockedInPlace
    dw $6A80,$00B9,$0018,$0010
    dw GrappleBeamFunction_WallGrab
    dw $9680,$00B8,$FFE8,$0010
    dw GrappleBeamFunction_WallGrab
    dw $7380,$00B8,$FFF8,$0010
    dw GrappleBeamFunction_WallGrab
    dw $8D80,$00B9,$0008,$0010
    dw GrappleBeamFunction_WallGrab


if !FEATURE_KEEP_UNREFERENCED
;;; $C48E: Unused ;;;
UNUSED_9BC48E:
    db $20,$3A
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C490: Grapple beam handler ;;;
GrappleBeamHandler:
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W GrappleBeam_PoseChangeAutoFireTimer : BEQ +
    DEC : STA.W GrappleBeam_PoseChangeAutoFireTimer

+   LDA.W GrappleConnectedFlags : AND.W #$FFFE : STA.W GrappleConnectedFlags
    JSR CancelGrappleBeamIfInIncompatiblePose
    PEA .manualReturn-1
    JMP.W (GrappleBeam_Function)

  .manualReturn:
    LDA.W GrappleBeam_Function : CMP.W #GrappleBeamFunction_Inactive : BEQ .clearLiquidPhysics
    CMP.W #GrappleBeamFunction_HitNothing_Cancel : BPL .clearLiquidPhysics
    LDA.W SuitPaletteIndex : BIT.W #$0004 : BNE .clearLiquidPhysics
    LDA.W FX_Type : BEQ .clearLiquidPhysics
    JSL Get_Samus_BottomTop_Boundary
    LDA.W FX_YPosition : BMI .clearLiquidPhysics
    CMP.B DP_Temp12 : BPL .clearLiquidPhysics
    LDA.W GrappleBeam_Flags : ORA.W #$0001 : STA.W GrappleBeam_Flags
    PLB : PLP
    RTL

  .clearLiquidPhysics:
    LDA.W GrappleBeam_Flags : AND.W #$FFFE : STA.W GrappleBeam_Flags
    PLB : PLP
    RTL


;;; $C4F0: Grapple beam function - inactive ;;;
GrappleBeamFunction_Inactive:
    LDA.B DP_Controller1New : BIT.W ShotBinding : BNE GrappleBeamFunction_Fire_GotoCancel
    LDA.W PreviousController1NewDrawing : BIT.W ShotBinding : BNE GrappleBeamFunction_Fire_GotoCancel
    LDA.W SamusProjectile_FlareCounter : BEQ .return
    STZ.W SamusProjectile_FlareCounter : STZ.W SamusProjectile_FlareAnimationFrame
    STZ.W SamusProjectile_FlareSlowSparksAnimationFrame0CD8 : STZ.W SamusProjectile_FlareFastSparksAnimationFrame0CDA
    STZ.W SamusProjectile_FlareAnimationTimer
    STZ.W SamusProjectile_FlareSlowSparksAnimationFrame0CDE : STZ.W SamusProjectile_FlareFastSparksAnimationFrame0CE0
    JSL LoadSamusSuitPalette

  .return:
    RTS


;;; $C51E: Grapple beam function - fire / go to cancel ;;;
GrappleBeamFunction_Fire_GotoCancel:
; Act as if fire was just pressed. This is often used to *cancel* the beam during no-fire conditions
    LDA.W Pose : CMP.W #$00F0 : BEQ .draygon
    CMP.W #$00BE : BEQ .draygon
    ASL #3 : TAX
    LDA.L PoseDefinitions_YOffset,X : AND.W #$00FF : STA.B DP_Temp16
    LDA.L PoseDefinitions_directionShotsFired,X : AND.W #$00FF : BIT.W #$00F0 : BEQ .fire

  .cancel:
    LDA.W #GrappleBeamFunction_HitNothing_Cancel : STA.W GrappleBeam_Function
    RTS

  .draygon:
    JSR GetDirectionGrappleIsFiredWhenHeldByDraygon
    BCC .cancel

  .fire:
    STA.W GrappleBeam_DirectionFired
    ASL : TAX
    LDA.W GrappleBeamFireVelocityTable_X,X : STA.W GrappleBeam_ExtensionXSubVelocity
    LDA.W GrappleBeamFireVelocityTable_Y,X : STA.W GrappleBeam_ExtensionYSubVelocity
    LDA.W GrappleBeamFireAngles,X : STA.W GrappleBeam_EndAngle : STA.W GrappleBeam_EndAngleMirror
    LDA.W #$000A : STA.W GrappleBeam_PoseChangeAutoFireTimer
    LDA.W Pose : CMP.W #$0049 : BEQ .moonwalkingNotRunning
    CMP.W #$004A : BEQ .moonwalkingNotRunning
    LDA.W MovementType : AND.W #$00FF : CMP.W #$0001 : BEQ .running

  .moonwalkingNotRunning:
; Samus is moonwalking or not running
    LDA.W GrappleBeamFireOffsets_NotRunning_OriginX,X : STA.W GrappleBeam_OriginXOffset
    LDA.W GrappleBeamFireOffsets_NotRunning_OriginY,X : SEC : SBC.B DP_Temp16 : STA.W GrappleBeam_OriginYOffset
    LDA.W SamusXPosition : PHA
    CLC : ADC.W GrappleBeamFireOffsets_NotRunning_OriginX,X : STA.W GrappleBeam_EndXPosition : STA.W GrappleBeam_StartXPosition
    PLA : CLC : ADC.W GrappleBeamFireOffsets_NotRunning_FlareX,X : STA.W GrappleBeam_FlareXPosition
    LDA.W SamusYPosition : SEC : SBC.B DP_Temp16 : PHA
    CLC : ADC.W GrappleBeamFireOffsets_NotRunning_OriginY,X : STA.W GrappleBeam_EndYPosition : STA.W GrappleBeam_StartYPosition
    PLA : CLC : ADC.W GrappleBeamFireOffsets_NotRunning_FlareY,X : STA.W GrappleBeam_FlareYPosition
    BRA .merge

  .running:
    LDA.W GrappleBeamFireOffsets_Running_OriginX,X : STA.W GrappleBeam_OriginXOffset
    LDA.W GrappleBeamFireOffsets_Running_OriginY,X : SEC : SBC.B DP_Temp16 : STA.W GrappleBeam_OriginYOffset
    LDA.W SamusXPosition : PHA
    CLC : ADC.W GrappleBeamFireOffsets_Running_OriginX,X : STA.W GrappleBeam_EndXPosition : STA.W GrappleBeam_StartXPosition
    PLA : CLC : ADC.W GrappleBeamFireOffsets_Running_FlareX,X : STA.W GrappleBeam_FlareXPosition
    LDA.W SamusYPosition : SEC : SBC.B DP_Temp16 : PHA
    CLC : ADC.W GrappleBeamFireOffsets_Running_OriginY,X : STA.W GrappleBeam_EndYPosition : STA.W GrappleBeam_StartYPosition
    PLA : CLC : ADC.W GrappleBeamFireOffsets_Running_FlareY,X : STA.W GrappleBeam_FlareYPosition

  .merge:
    STZ.W GrappleBeam_EndXSubPosition : STZ.W GrappleBeam_EndYSubPosition
    STZ.W GrappleBeam_EndXSubOffset : STZ.W GrappleBeam_EndXOffset
    STZ.W GrappleBeam_EndYSubOffset : STZ.W GrappleBeam_EndYOffset
    STZ.W GrappleBeam_Flags
    LDA.W #$000C : STA.W GrappleBeam_LengthDelta
    STZ.W GrappleBeam_Length : STZ.W GrappleBeam_SwingAngularVelocity
    STZ.W GrappleBeam_SwingAngularAccelerationDueToAngleOfSwing : STZ.W GrappleBeam_SwingAngularAccelerationDueToButtonInput
    STZ.W GrappleBeam_SwingAngularDeceleration : STZ.W GrappleBeam_ExtraSwingAngularVelocity
    STZ.W GrappleBeam_KickCooldownTimer
    STZ.W GrappleBeam_neverRead0D1E : STZ.W GrappleBeam_neverRead0D20
    LDA.W #$0002 : STA.W GrappleBeam_NeverRead0D3A
    STZ.W GrappleBeam_NeverRead0D3C
    LDA.W #$0005 : STA.W GrappleBeam_StartAnimationTimer
    LDA.W GrappleBeamStartTilesBeginEndPointers_0 : STA.W GrappleBeam_StartAnimationTilePointer
    STZ.W GrappleCollision_XQuarterSubVelocity : STZ.W GrappleCollision_XQuarterVelocity
    STZ.W GrappleCollision_YQuarterSubVelocity : STZ.W GrappleCollision_YQuarterVelocity
    STZ.W GrappleCollision_LoopCounter : STZ.W GrappleCollision_TargetLength
    STZ.W GrappleCollision_SamusFrontBoundaryOffset : STZ.W GrappleCollision_XPosition
    STZ.W GrappleBeam_FailedSwingMovementCounter : STZ.W GrappleBeam_SpecialAngleHandlingFlag
    STZ.W GrappleBeam_SlowScrollingFlag
    JSL InitializeGrappleSegmentAnimations
    LDA.W #SamusDrawingHandler_FiringGrappleBeam : STA.W DrawingHandler
    STZ.W GrappleWalljumpTimer
    LDA.W #$0002
    JSL Load_Beam_Palette_External
    LDA.W #$7F91 : STA.L Palettes_SpriteP5+$1E
    LDA.W #GrappleBeamFunction_Firing : STA.W GrappleBeam_Function
    LDA.W #$0005
    JSL QueueSound_Lib1_Max1
    LDA.W #$0001 : STA.W SamusProjectile_FlareCounter
    STZ.W ResumeChargingBeamSFXFlag
    LDA.W MovementHandler : CMP.W #SamusMovementHandler_ReleasedFromGrappleSwing : BNE .return
    LDA.W #SamusMovementHandler_Normal : STA.W MovementHandler

  .return:
    RTS


;;; $C6B2: A = direction grapple is fired when held by Draygon ;;;
GetDirectionGrappleIsFiredWhenHeldByDraygon:
;; Parameters:
;;     A: Samus pose
;; Returns:
;;     Carry: Set
;;     A: Direction grapple is fired
;;     $16: 6. Y offset of Samus projectile origin

; Gets directions for Samus aiming when held by Draygon
    CMP.W #$00BE : BEQ .facingLeft
    LDA.W #$0006 : STA.B DP_Temp16
    LDA.B DP_Controller1Input : BIT.W #$0100 : BEQ .right
    BIT.W #$0400 : BNE .downRight
    BIT.W #$0800 : BNE .upRight

  .right:
    LDA.W #$0002
    SEC
    RTS

  .upRight:
    LDA.W #$0001
    SEC
    RTS

  .downRight:
    LDA.W #$0003
    SEC
    RTS

  .facingLeft:
    LDA.W #$0006 : STA.B DP_Temp16
    LDA.B DP_Controller1Input : BIT.W #$0200 : BEQ .left
    BIT.W #$0400 : BNE .downLeft
    BIT.W #$0800 : BNE .upLeft

  .left:
    LDA.W #$0007
    SEC
    RTS

  .upLeft:
    LDA.W #$0008
    SEC
    RTS

  .downLeft:
    LDA.W #$0006
    SEC
    RTS


if !FEATURE_KEEP_UNREFERENCED
UNUSED_CLCRTS_9B7C01:
; Nothing points here
    CLC
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C703: Grapple beam function - firing ;;;
GrappleBeamFunction_Firing:
    LDA.B DP_Controller1Input : BIT.W ShotBinding : BNE .firing

  .cancel:
    LDA.W #GrappleBeamFunction_HitNothing_Cancel : STA.W GrappleBeam_Function
    RTS

  .firing:
    JSR RTS_9BB8D4
    LDA.W GrappleBeam_Length : CLC : ADC.W GrappleBeam_LengthDelta : STA.W GrappleBeam_Length
    CMP.W #$0080 : BMI .enemyCollisionCheck

  .gotoCancel:
    BRA .cancel ; >.<

  .enemyCollisionCheck:
    JSL EnemyGrappleBeamCollisionDetection
    JSR ProcessEnemyGrappleBeamCollisionResult
    BCC .blockCollisionCheck
    TAY : BNE .gotoCancel
    BRA .connected

  .blockCollisionCheck:
    JSL GrappleBeamBlockCollisionDetection
    BCC .return
    BVC .gotoCancel

  .connected:
    LDA.W #$0006
    JSL QueueSound_Lib1_Max6
    JSR HandleConnectingGrapple
    LDA.W #$0008 : EOR.W #$FFFF : INC : STA.W GrappleBeam_LengthDelta
    LDA.W GrappleConnectedFlags : ORA.W #$0001 : STA.W GrappleConnectedFlags

  .return:
    RTS


;;; $C759: Unused. Grapple beam function - unfiring ;;;
UNUSED_GrappleBeamFunction_Unfiring_9BC759:
    LDA.B DP_Controller1Input : BIT.W ShotBinding : BNE .firing

  .cancel:
    LDA.W #GrappleBeamFunction_HitNothing_Cancel : STA.W GrappleBeam_Function
    RTS

  .firing:
    JSR RTS_9BB8D4
    LDA.W GrappleBeam_Length : SEC : SBC.W GrappleBeam_LengthDelta : STA.W GrappleBeam_Length
    CMP.W #$000D : BMI .cancel
    JSL GrappleBeamBlockCollisionDetection
    RTS


;;; $C77E: Grapple beam function - connected - locked in place ;;;
GrappleBeamFunction_Connected_LockedInPlace:
    LDA.B DP_Controller1Input : BIT.W ShotBinding : BNE .firing

  .cancel:
    LDA.W #GrappleBeamFunction_HitNothing_Cancel : STA.W GrappleBeam_Function
    RTS

  .firing:
    JSL EnemyGrappleBeamCollisionDetection
    TAY : BNE .returnCarryClear
    JSR CheckIfGrappleIsConnectedToBlock
    BCC .cancel

  .returnCarryClear:
    JSL CLCRTL_94AF0B
    RTS


;;; $C79D: Grapple beam function - connected - swinging ;;;
GrappleBeamFunction_Connected_Swinging:
    LDA.B DP_Controller1Input : BIT.W ShotBinding : BNE .firing

  .cancel:
    LDA.W GrappleBeam_SwingAngularVelocity : BNE .propelSamus
    LDA.W GrappleBeam_EndAngle : CMP.W #$8000 : BNE .propelSamus
    LDA.W #GrappleBeamFunction_Dropped : STA.W GrappleBeam_Function
    RTS

  .propelSamus:
    JSR PropelSamusFromGrappleSwing
    LDA.W #GrappleBeamFunction_ReleasedFromSwing : STA.W GrappleBeam_Function
    LDA.W #SamusMovementHandler_ReleasedFromGrappleSwing : STA.W MovementHandler
    RTS

  .firing:
    JSR HandleGrappleDpadInput
    LDA.W GrappleBeam_LengthDelta : BEQ .handleSwinging
    JSL HandleGrappleBeamLengthChange

  .handleSwinging:
    JSR DetermineGrappleSwingAngularAccelerationDueToAngleOfSwing
    JSR UpdateGrappleSwingAngularVelocity
    JSR HandleGrappleKick
    JSL HandleGrappleBeamSwingingMovement
    LDA.W GrappleBeam_SpecialAngleHandlingFlag : BPL .enemyCollision
    JSR HandleSpecialGrappleBeamAngles
    BCC .enemyCollision
    JSL CLCRTL_94AF0B
    RTS

  .enemyCollision:
    JSL EnemyGrappleBeamCollisionDetection
    TAY : BEQ .blockCollision
    LDA.W GrappleBeam_Flags : ORA.W #$8000 : STA.W GrappleBeam_Flags
    BRA +

  .blockCollision:
    JSR CheckIfGrappleIsConnectedToBlock
    BCC .cancel

+   JSL UpdateGrappleBeamStartPositionDuringGrappleSwinging
    JSL CLCRTL_94AF0B
    JSL SetSamusAnimationFrameAndPositionDuringGrappleSwinging
    RTS


;;; $C814: Grapple beam function - wallgrab ;;;
GrappleBeamFunction_WallGrab:
    LDA.B DP_Controller1Input : BIT.W ShotBinding : BNE .firing

  .cancel:
    LDA.W #$001E : STA.W GrappleWalljumpTimer
    LDA.W #GrappleBeamFunction_WallGrabRelease : STA.W GrappleBeam_Function
    RTS

  .firing:
    JSR CheckIfGrappleIsConnectedToBlock
    BCC .cancel
    JSL CLCRTL_94AF0B
    RTS


;;; $C832: Grapple beam function - wallgrab release ;;;
GrappleBeamFunction_WallGrabRelease:
    LDA.W GrappleWalljumpTimer : DEC : STA.W GrappleWalljumpTimer : BPL .timerNotExpired
    LDA.W #GrappleBeamFunction_Dropped : STA.W GrappleBeam_Function
    RTS

  .timerNotExpired:
    LDA.W #$0010 : STA.B DP_Temp12
    STZ.B DP_Temp14
    JSL Grapple_WallJump_Check
    BCC .return
    LDA.W #GrappleBeamFunction_WallJumping : STA.W GrappleBeam_Function

  .return:
    RTS


;;; $C856: Grapple beam function - hit nothing / cancel ;;;
GrappleBeamFunction_HitNothing_Cancel:
    LDA.W #$0007
    JSL QueueSound
    LDA.W MovementType : AND.W #$00FF : CMP.W #$0016 : BNE .notGrappling
    JSL HandleTransitionTableLookupFailure
    BRA +

  .notGrappling:
    LDA.W #$001C
    JSL Run_Samus_Command

+   STZ.W GrappleBeam_neverRead0D1E : STZ.W GrappleBeam_neverRead0D20
    STZ.W GrappleBeam_DirectionFired : STZ.W GrappleBeam_SpecialAngleHandlingFlag
    STZ.W GrappleWalljumpTimer : STZ.W GrappleBeam_SlowScrollingFlag
    STZ.W GrappleBeam_PoseChangeAutoFireTimer : STZ.W GrappleBeam_Flags
    STZ.W SamusProjectile_FlareCounter : STZ.W SamusProjectile_FlareAnimationFrame
    STZ.W SamusProjectile_FlareSlowSparksAnimationFrame0CD8 : STZ.W SamusProjectile_FlareFastSparksAnimationFrame0CDA
    STZ.W SamusProjectile_FlareAnimationTimer
    STZ.W SamusProjectile_FlareSlowSparksAnimationFrame0CDE : STZ.W SamusProjectile_FlareFastSparksAnimationFrame0CE0
    LDA.W EquippedBeams
    JSL Load_Beam_Palette_External
    LDA.W #GrappleBeamFunction_Inactive : STA.W GrappleBeam_Function
    LDA.W #SamusDrawingHandler_Default : STA.W DrawingHandler
    JSL PostGrappleCollisionDetection
    LDA.W AutoCancelHUDItemIndex : BEQ .return
    STZ.W SelectedHUDItem : STZ.W AutoCancelHUDItemIndex

  .return:
    RTS


;;; $C8C5: Grapple beam function - dropped ;;;
GrappleBeamFunction_Dropped:
; Dropped down from swinging with no momentum or missed grapple walljump
    LDA.W #$0007
    JSL QueueSound
    LDA.W Pose : CMP.W #$00B2 : BEQ .clockwise
    CMP.W #$00B3 : BEQ .antiClockwise
    BRA .notSwinging

  .cancel:
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .antiClockwise

  .clockwise:
    LDA.W #$0001 : STA.W SuperSpecialProspectivePose
    BRA .merge

  .antiClockwise:
    LDA.W #$0002 : STA.W SuperSpecialProspectivePose
    BRA .merge

  .notSwinging:
    LDA.W SamusYRadius : CMP.W #$0011 : BMI .crouching
    LDA.W Pose : ASL #3 : TAX
    LDA.L PoseDefinitions_directionShotsFired,X : AND.W #$00FF : TAX
    BIT.W #$00F0 : BNE .cancel
    LDA.W .standingPoses,X : AND.W #$00FF : STA.W SuperSpecialProspectivePose
    BRA .merge

  .crouching:
    LDA.W Pose : ASL #3 : TAX
    LDA.L PoseDefinitions_directionShotsFired,X : AND.W #$00FF : TAX
    BIT.W #$00F0 : BNE .checkDirection
    LDA.W .crouchingPoses,X : AND.W #$00FF : STA.W SuperSpecialProspectivePose
    BRA .merge

  .checkDirection:
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BEQ .facingLeft
    LDA.W #$0027 : STA.W SuperSpecialProspectivePose
    BRA .merge

  .facingLeft:
    LDA.W #$0028 : STA.W SuperSpecialProspectivePose

  .merge:
    STZ.W SuperSpecialProspectivePoseChangeCommand
    LDA.W #$0001 : STA.W SamusSolidVerticalCollisionResult
    STZ.W SamusXBaseSpeed : STZ.W SamusXBaseSubSpeed
    STZ.W SamusYSubSpeed : STZ.W SamusYSpeed
    STZ.W GrappleBeam_neverRead0D1E : STZ.W GrappleBeam_neverRead0D20
    STZ.W GrappleBeam_DirectionFired : STZ.W GrappleBeam_SpecialAngleHandlingFlag
    STZ.W GrappleWalljumpTimer : STZ.W GrappleBeam_SlowScrollingFlag
    STZ.W GrappleBeam_PoseChangeAutoFireTimer : STZ.W GrappleBeam_Flags
    STZ.W SamusProjectile_FlareCounter : STZ.W SamusProjectile_FlareAnimationFrame
    STZ.W SamusProjectile_FlareSlowSparksAnimationFrame0CD8 : STZ.W SamusProjectile_FlareFastSparksAnimationFrame0CDA
    STZ.W SamusProjectile_FlareAnimationTimer
    STZ.W SamusProjectile_FlareSlowSparksAnimationFrame0CDE : STZ.W SamusProjectile_FlareFastSparksAnimationFrame0CE0
    LDA.W EquippedBeams
    JSL Load_Beam_Palette_External
    LDA.W #GrappleBeamFunction_Inactive : STA.W GrappleBeam_Function
    LDA.W #SamusDrawingHandler_Default : STA.W DrawingHandler
    JSL PostGrappleCollisionDetection
    LDA.W AutoCancelHUDItemIndex : BEQ .return
    STZ.W SelectedHUDItem : STZ.W AutoCancelHUDItemIndex

  .return:
    RTS

  .standingPoses:
    db $03,$05,$01,$07,$01,$02,$08,$02,$06,$04

  .crouchingPoses:
    db $85,$71,$27,$73,$27,$28,$74,$28,$72,$86


;;; $C9CE: Grapple beam function - wall jumping ;;;
GrappleBeamFunction_WallJumping:
    LDA.W #$0007
    JSL QueueSound
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0008 : BEQ .right
    LDA.W #$0083 : STA.W SuperSpecialProspectivePose
    BRA +

  .right:
    LDA.W #$0084 : STA.W SuperSpecialProspectivePose

+   LDA.W #$0006 : STA.W SuperSpecialProspectivePoseChangeCommand
    STZ.W SamusXAccelerationMode : STZ.W SamusXSpeedKilledDueToCollisionFlag
    STZ.W SamusIsFallingFlag
    STZ.W neverRead0B1A : STZ.W neverRead0B2A
    STZ.W SamusYSubSpeed : STZ.W SamusYSpeed
    STZ.W SamusYDirection : STZ.W neverRead0B38
    STZ.W SamusXBaseSpeed : STZ.W SamusXBaseSubSpeed
    STZ.W GrappleBeam_neverRead0D1E : STZ.W GrappleBeam_neverRead0D20
    STZ.W GrappleBeam_DirectionFired : STZ.W GrappleBeam_SpecialAngleHandlingFlag
    STZ.W GrappleWalljumpTimer : STZ.W GrappleBeam_SlowScrollingFlag
    STZ.W GrappleBeam_PoseChangeAutoFireTimer : STZ.W GrappleBeam_Flags
    STZ.W SamusProjectile_FlareCounter : STZ.W SamusProjectile_FlareAnimationFrame
    STZ.W SamusProjectile_FlareSlowSparksAnimationFrame0CD8 : STZ.W SamusProjectile_FlareFastSparksAnimationFrame0CDA
    STZ.W SamusProjectile_FlareAnimationTimer
    STZ.W SamusProjectile_FlareSlowSparksAnimationFrame0CDE : STZ.W SamusProjectile_FlareFastSparksAnimationFrame0CE0
    LDA.W EquippedBeams
    JSL Load_Beam_Palette_External
    LDA.W #GrappleBeamFunction_Inactive : STA.W GrappleBeam_Function
    LDA.W #SamusDrawingHandler_Default : STA.W DrawingHandler
    JSL PostGrappleCollisionDetection
    LDA.W AutoCancelHUDItemIndex : BEQ .return
    STZ.W SelectedHUDItem : STZ.W AutoCancelHUDItemIndex

  .return:
    RTS


;;; $CA65: Propel Samus from grapple swing ;;;
PropelSamusFromGrappleSwing:
; Note the extra angular velocity due to grapple kick isn't included in this calculation, which feels like an oversight to me
    LDA.W GrappleBeam_SwingAngularVelocity : BMI .negativeVelocity
    JMP .positive

  .negativeVelocity:
    EOR.W #$FFFF : INC : ASL : TAY
    LDA.W GrappleBeam_EndAngle : XBA : AND.W #$00FF : ASL : TAX
    LDA.L SineCosineTables_8bitSine_SignExtended,X : BMI .negativeAngle
    PHY
    JSL A_Y_16bit_UnsignedMultiplication
    PLY
    LDA.W MultiplicationResult : STA.W SamusYSubSpeed
    LDA.W MultiplicationResult+2 : STA.W SamusYSpeed
    LDA.W #$0001 : STA.W SamusYDirection
    BRA .decelerating

  .negativeAngle:
    EOR.W #$FFFF : INC
    PHY
    JSL A_Y_16bit_UnsignedMultiplication
    PLY
    LDA.W MultiplicationResult : STA.W SamusYSubSpeed
    LDA.W MultiplicationResult+2 : STA.W SamusYSpeed
    LDA.W #$0002 : STA.W SamusYDirection

  .decelerating:
    LDA.W #$0002 : STA.W SamusXAccelerationMode
    TYA : LSR : XBA : AND.W #$00FF : STA.B DP_Temp12
    ASL : CLC : ADC.B DP_Temp12 : STA.B DP_Temp12
    LDA.W #$0040 : SEC : SBC.B DP_Temp12 : STA.B DP_Temp12
    LDA.W GrappleBeam_EndAngle : XBA
    AND.W #$00FF : SEC : SBC.B DP_Temp12
    AND.W #$00FF : ASL : TAX
    LDA.L SineCosineTables_8bitSine_SignExtended,X : BPL +
    EOR.W #$FFFF : INC

+   JSL A_Y_16bit_UnsignedMultiplication
    LDA.W MultiplicationResult : STA.W SamusXBaseSubSpeed
    LDA.W MultiplicationResult+2 : STA.W SamusXBaseSpeed
    RTS

  .positive:
    ASL : TAY
    LDA.W GrappleBeam_EndAngle : XBA : AND.W #$00FF : ASL : TAX
    LDA.L SineCosineTables_8bitSine_SignExtended,X : BPL +
    EOR.W #$FFFF : INC
    PHY
    JSL A_Y_16bit_UnsignedMultiplication
    PLY
    LDA.W MultiplicationResult : STA.W SamusYSubSpeed
    LDA.W MultiplicationResult+2 : STA.W SamusYSpeed
    LDA.W #$0001 : STA.W SamusYDirection
    BRA ..decelerating

+   PHY
    JSL A_Y_16bit_UnsignedMultiplication
    PLY
    LDA.W MultiplicationResult : STA.W SamusYSubSpeed
    LDA.W MultiplicationResult+2 : STA.W SamusYSpeed
    LDA.W #$0002 : STA.W SamusYDirection

  ..decelerating:
    LDA.W #$0002 : STA.W SamusXAccelerationMode
    TYA : LSR : XBA : AND.W #$00FF : STA.B DP_Temp12
    ASL : CLC : ADC.B DP_Temp12 : STA.B DP_Temp12
    LDA.W #$0040 : SEC : SBC.B DP_Temp12 : STA.B DP_Temp12
    LDA.W GrappleBeam_EndAngle : XBA : AND.W #$00FF
    SEC : SBC.B DP_Temp12 : AND.W #$00FF : ASL : TAX
    LDA.L SineCosineTables_8bitSine_SignExtended,X : BPL +
    EOR.W #$FFFF : INC

+   JSL A_Y_16bit_UnsignedMultiplication
    LDA.W MultiplicationResult : STA.W SamusXBaseSubSpeed
    LDA.W MultiplicationResult+2 : STA.W SamusXBaseSpeed
    RTS


;;; $CB8B: Grapple beam function - released from swing ;;;
GrappleBeamFunction_ReleasedFromSwing:
    LDA.W #$0007
    JSL QueueSound
    LDA.W GrappleBeam_SwingAngularVelocity : BPL .facingLeft
    LDA.W #$0051 : STA.W SuperSpecialProspectivePose
    BRA +

  .facingLeft:
    LDA.W #$0052 : STA.W SuperSpecialProspectivePose

+   LDA.W #$0007 : STA.W SuperSpecialProspectivePoseChangeCommand
    STZ.W GrappleBeam_neverRead0D1E : STZ.W GrappleBeam_neverRead0D20
    STZ.W GrappleBeam_DirectionFired : STZ.W GrappleBeam_SpecialAngleHandlingFlag
    STZ.W GrappleWalljumpTimer : STZ.W GrappleBeam_SlowScrollingFlag
    STZ.W GrappleBeam_PoseChangeAutoFireTimer : STZ.W GrappleBeam_Flags
    STZ.W SamusProjectile_FlareCounter : STZ.W SamusProjectile_FlareAnimationFrame
    STZ.W SamusProjectile_FlareSlowSparksAnimationFrame0CD8 : STZ.W SamusProjectile_FlareFastSparksAnimationFrame0CDA
    STZ.W SamusProjectile_FlareAnimationTimer
    STZ.W SamusProjectile_FlareSlowSparksAnimationFrame0CDE : STZ.W SamusProjectile_FlareFastSparksAnimationFrame0CE0
    LDA.W EquippedBeams
    JSL Load_Beam_Palette_External
    LDA.W #GrappleBeamFunction_Inactive : STA.W GrappleBeam_Function
    LDA.W #SamusDrawingHandler_Default : STA.W DrawingHandler
    JSL PostGrappleCollisionDetection
    LDA.W AutoCancelHUDItemIndex : BEQ .return
    STZ.W SelectedHUDItem : STZ.W AutoCancelHUDItemIndex

  .return:
    RTS


Freespace_Bank9B_CBFB:
; $1405 bytes


warnpc $9BE000
ORG $9BE000


;;; $E000: Samus top tiles - set 8 - entry 0 ;;;
SamusTiles_Top_Set8_Entry0:
; 0: Facing forward - power suit - frame 3
; 0: Facing forward - power suit - frame 5
; 0: Facing forward - power suit - frame 7
; 0: Facing forward - power suit - frame 9
; 0: Facing forward - power suit - frame Bh
; 0: Facing forward - power suit - frame Dh
; 0: Facing forward - power suit - frame Fh
; 0: Facing forward - power suit - frame 11h
; 0: Facing forward - power suit - frame 13h
; 0: Facing forward - power suit - frame 15h
; 0: Facing forward - power suit - frame 17h
; 0: Facing forward - power suit - frame 19h
; 0: Facing forward - power suit - frame 1Bh
; 0: Facing forward - power suit - frame 1Dh
; 0: Facing forward - power suit - frame 1Fh
; 0: Facing forward - power suit - frame 21h
; 0: Facing forward - power suit - frame 23h
; 0: Facing forward - power suit - frame 25h
; 0: Facing forward - power suit - frame 27h
; 0: Facing forward - power suit - frame 29h
; 0: Facing forward - power suit - frame 2Bh
; 0: Facing forward - power suit - frame 2Dh
; 0: Facing forward - power suit - frame 2Fh
; 0: Facing forward - power suit - frame 31h
; 0: Facing forward - power suit - frame 33h
; 0: Facing forward - power suit - frame 35h
; 0: Facing forward - power suit - frame 37h
; 0: Facing forward - power suit - frame 39h
; 0: Facing forward - power suit - frame 3Bh
; 0: Facing forward - power suit - frame 3Dh
; 0: Facing forward - power suit - frame 3Fh
; 0: Facing forward - power suit - frame 41h
; 0: Facing forward - power suit - frame 43h
; 0: Facing forward - power suit - frame 45h
; 0: Facing forward - power suit - frame 47h
; 0: Facing forward - power suit - frame 49h
; 0: Facing forward - power suit - frame 4Bh
; 0: Facing forward - power suit - frame 4Dh
; 0: Facing forward - power suit - frame 4Fh
; 0: Facing forward - power suit - frame 51h
; 0: Facing forward - power suit - frame 53h
; 0: Facing forward - power suit - frame 55h
; 0: Facing forward - power suit - frame 57h
; 0: Facing forward - power suit - frame 59h
; 0: Facing forward - power suit - frame 5Bh
; 0: Facing forward - power suit - frame 5Dh
; 0: Facing forward - power suit - frame 5Fh
; 9Bh: Facing forward - varia/gravity suit - frame 3
; 9Bh: Facing forward - varia/gravity suit - frame 5
; 9Bh: Facing forward - varia/gravity suit - frame 7
; 9Bh: Facing forward - varia/gravity suit - frame 9
; 9Bh: Facing forward - varia/gravity suit - frame Bh
; 9Bh: Facing forward - varia/gravity suit - frame Dh
; 9Bh: Facing forward - varia/gravity suit - frame Fh
; 9Bh: Facing forward - varia/gravity suit - frame 11h
; 9Bh: Facing forward - varia/gravity suit - frame 13h
; 9Bh: Facing forward - varia/gravity suit - frame 15h
; 9Bh: Facing forward - varia/gravity suit - frame 17h
; 9Bh: Facing forward - varia/gravity suit - frame 19h
; 9Bh: Facing forward - varia/gravity suit - frame 1Bh
; 9Bh: Facing forward - varia/gravity suit - frame 1Dh
; 9Bh: Facing forward - varia/gravity suit - frame 1Fh
; 9Bh: Facing forward - varia/gravity suit - frame 21h
; 9Bh: Facing forward - varia/gravity suit - frame 23h
; 9Bh: Facing forward - varia/gravity suit - frame 25h
; 9Bh: Facing forward - varia/gravity suit - frame 27h
; 9Bh: Facing forward - varia/gravity suit - frame 29h
; 9Bh: Facing forward - varia/gravity suit - frame 2Bh
; 9Bh: Facing forward - varia/gravity suit - frame 2Dh
; 9Bh: Facing forward - varia/gravity suit - frame 2Fh
; 9Bh: Facing forward - varia/gravity suit - frame 31h
; 9Bh: Facing forward - varia/gravity suit - frame 33h
; 9Bh: Facing forward - varia/gravity suit - frame 35h
; 9Bh: Facing forward - varia/gravity suit - frame 37h
; 9Bh: Facing forward - varia/gravity suit - frame 39h
; 9Bh: Facing forward - varia/gravity suit - frame 3Bh
; 9Bh: Facing forward - varia/gravity suit - frame 3Dh
; 9Bh: Facing forward - varia/gravity suit - frame 3Fh
; 9Bh: Facing forward - varia/gravity suit - frame 41h
; 9Bh: Facing forward - varia/gravity suit - frame 43h
; 9Bh: Facing forward - varia/gravity suit - frame 45h
; 9Bh: Facing forward - varia/gravity suit - frame 47h
; 9Bh: Facing forward - varia/gravity suit - frame 49h
; 9Bh: Facing forward - varia/gravity suit - frame 4Bh
; 9Bh: Facing forward - varia/gravity suit - frame 4Dh
; 9Bh: Facing forward - varia/gravity suit - frame 4Fh
; 9Bh: Facing forward - varia/gravity suit - frame 51h
; 9Bh: Facing forward - varia/gravity suit - frame 53h
; 9Bh: Facing forward - varia/gravity suit - frame 55h
; 9Bh: Facing forward - varia/gravity suit - frame 57h
; 9Bh: Facing forward - varia/gravity suit - frame 59h
; 9Bh: Facing forward - varia/gravity suit - frame 5Bh
; 9Bh: Facing forward - varia/gravity suit - frame 5Dh
; 9Bh: Facing forward - varia/gravity suit - frame 5Fh
incbin "../data/SamusTiles_Top_Set8_Entry0.bin" ; $20 bytes


;;; $E020: Samus top tiles - set 8 - entry 1 ;;;
SamusTiles_Top_Set8_Entry1:
; Unused
incbin "../data/SamusTiles_Top_Set8_Entry1.bin" ; $20 bytes


;;; $E040: Samus top tiles - set 8 - entry 2 ;;;
SamusTiles_Top_Set8_Entry2:
; 0: Facing forward - power suit - frame 2
; 0: Facing forward - power suit - frame 8
; 0: Facing forward - power suit - frame Eh
; 0: Facing forward - power suit - frame 14h
; 0: Facing forward - power suit - frame 1Ah
; 0: Facing forward - power suit - frame 20h
; 0: Facing forward - power suit - frame 26h
; 0: Facing forward - power suit - frame 2Ch
; 0: Facing forward - power suit - frame 32h
; 0: Facing forward - power suit - frame 38h
; 0: Facing forward - power suit - frame 3Eh
; 0: Facing forward - power suit - frame 44h
; 0: Facing forward - power suit - frame 4Ah
; 9Bh: Facing forward - varia/gravity suit - frame 2
; 9Bh: Facing forward - varia/gravity suit - frame 8
; 9Bh: Facing forward - varia/gravity suit - frame Eh
; 9Bh: Facing forward - varia/gravity suit - frame 14h
; 9Bh: Facing forward - varia/gravity suit - frame 1Ah
; 9Bh: Facing forward - varia/gravity suit - frame 20h
; 9Bh: Facing forward - varia/gravity suit - frame 26h
; 9Bh: Facing forward - varia/gravity suit - frame 2Ch
; 9Bh: Facing forward - varia/gravity suit - frame 32h
; 9Bh: Facing forward - varia/gravity suit - frame 38h
; 9Bh: Facing forward - varia/gravity suit - frame 3Eh
; 9Bh: Facing forward - varia/gravity suit - frame 44h
; 9Bh: Facing forward - varia/gravity suit - frame 4Ah
incbin "../data/SamusTiles_Top_Set8_Entry2.bin" ; $120 bytes


;;; $E160: Samus top tiles - set 8 - entry 3 ;;;
SamusTiles_Top_Set8_Entry3:
; 0: Facing forward - power suit - frame 4
; 0: Facing forward - power suit - frame Ah
; 0: Facing forward - power suit - frame 10h
; 0: Facing forward - power suit - frame 16h
; 0: Facing forward - power suit - frame 1Ch
; 0: Facing forward - power suit - frame 22h
; 0: Facing forward - power suit - frame 28h
; 0: Facing forward - power suit - frame 2Eh
; 0: Facing forward - power suit - frame 34h
; 0: Facing forward - power suit - frame 3Ah
; 0: Facing forward - power suit - frame 40h
; 0: Facing forward - power suit - frame 46h
; 0: Facing forward - power suit - frame 4Ch
; 9Bh: Facing forward - varia/gravity suit - frame 4
; 9Bh: Facing forward - varia/gravity suit - frame Ah
; 9Bh: Facing forward - varia/gravity suit - frame 10h
; 9Bh: Facing forward - varia/gravity suit - frame 16h
; 9Bh: Facing forward - varia/gravity suit - frame 1Ch
; 9Bh: Facing forward - varia/gravity suit - frame 22h
; 9Bh: Facing forward - varia/gravity suit - frame 28h
; 9Bh: Facing forward - varia/gravity suit - frame 2Eh
; 9Bh: Facing forward - varia/gravity suit - frame 34h
; 9Bh: Facing forward - varia/gravity suit - frame 3Ah
; 9Bh: Facing forward - varia/gravity suit - frame 40h
; 9Bh: Facing forward - varia/gravity suit - frame 46h
; 9Bh: Facing forward - varia/gravity suit - frame 4Ch
incbin "../data/SamusTiles_Top_Set8_Entry3.bin" ; $E0 bytes


;;; $E240: Samus top tiles - set 8 - entry 4 ;;;
SamusTiles_Top_Set8_Entry4:
; 0: Facing forward - power suit - frame 6
; 0: Facing forward - power suit - frame Ch
; 0: Facing forward - power suit - frame 12h
; 0: Facing forward - power suit - frame 18h
; 0: Facing forward - power suit - frame 1Eh
; 0: Facing forward - power suit - frame 24h
; 0: Facing forward - power suit - frame 2Ah
; 0: Facing forward - power suit - frame 30h
; 0: Facing forward - power suit - frame 36h
; 0: Facing forward - power suit - frame 3Ch
; 0: Facing forward - power suit - frame 42h
; 0: Facing forward - power suit - frame 48h
; 0: Facing forward - power suit - frame 4Eh
; 9Bh: Facing forward - varia/gravity suit - frame 6
; 9Bh: Facing forward - varia/gravity suit - frame Ch
; 9Bh: Facing forward - varia/gravity suit - frame 12h
; 9Bh: Facing forward - varia/gravity suit - frame 18h
; 9Bh: Facing forward - varia/gravity suit - frame 1Eh
; 9Bh: Facing forward - varia/gravity suit - frame 24h
; 9Bh: Facing forward - varia/gravity suit - frame 2Ah
; 9Bh: Facing forward - varia/gravity suit - frame 30h
; 9Bh: Facing forward - varia/gravity suit - frame 36h
; 9Bh: Facing forward - varia/gravity suit - frame 3Ch
; 9Bh: Facing forward - varia/gravity suit - frame 42h
; 9Bh: Facing forward - varia/gravity suit - frame 48h
; 9Bh: Facing forward - varia/gravity suit - frame 4Eh
incbin "../data/SamusTiles_Top_Set8_Entry4.bin" ; $160 bytes


;;; $E3A0: Samus top tiles - set 8 - entry 5 ;;;
SamusTiles_Top_Set8_Entry5:
; 0: Facing forward - power suit - frame 50h
; 9Bh: Facing forward - varia/gravity suit - frame 50h
incbin "../data/SamusTiles_Top_Set8_Entry5.bin" ; $1E0 bytes


;;; $E580: Samus top tiles - set 8 - entry 6 ;;;
SamusTiles_Top_Set8_Entry6:
; 0: Facing forward - power suit - frame 52h
; 9Bh: Facing forward - varia/gravity suit - frame 52h
incbin "../data/SamusTiles_Top_Set8_Entry6.bin" ; $100 bytes


;;; $E680: Samus top tiles - set 8 - entry 7 ;;;
SamusTiles_Top_Set8_Entry7:
; 0: Facing forward - power suit - frame 54h
; 0: Facing forward - power suit - frame 5Ah
; 9Bh: Facing forward - varia/gravity suit - frame 54h
; 9Bh: Facing forward - varia/gravity suit - frame 5Ah
incbin "../data/SamusTiles_Top_Set8_Entry7.bin" ; $140 bytes


;;; $E7C0: Samus top tiles - set 8 - entry 8 ;;;
SamusTiles_Top_Set8_Entry8:
; 0: Facing forward - power suit - frame 56h
; 0: Facing forward - power suit - frame 5Ch
; 9Bh: Facing forward - varia/gravity suit - frame 56h
; 9Bh: Facing forward - varia/gravity suit - frame 5Ch
incbin "../data/SamusTiles_Top_Set8_Entry8.bin" ; $160 bytes


;;; $E920: Samus top tiles - set 8 - entry 9 ;;;
SamusTiles_Top_Set8_Entry9:
; 0: Facing forward - power suit - frame 58h
; 0: Facing forward - power suit - frame 5Eh
; 9Bh: Facing forward - varia/gravity suit - frame 58h
; 9Bh: Facing forward - varia/gravity suit - frame 5Eh
incbin "../data/SamusTiles_Top_Set8_Entry9.bin" ; $E0 bytes


;;; $EA00: Samus bottom tiles - set 8 - entry 0 ;;;
SamusTiles_Bottom_Set8_Entry0:
; 0: Facing forward - power suit - frames 2..5Fh
incbin "../data/SamusTiles_Bottom_Set8_Entry0.bin" ; $200 bytes


;;; $EC00: Samus bottom tiles - set 8 - entry 1 ;;;
SamusTiles_Bottom_Set8_Entry1:
; 9Bh: Facing forward - varia/gravity suit - frames 2..5Fh
incbin "../data/SamusTiles_Bottom_Set8_Entry1.bin" ; $200 bytes


;;; $EE00: Samus bottom tiles - set 8 - entry 2 ;;;
SamusTiles_Bottom_Set8_Entry2:
; Unused
incbin "../data/SamusTiles_Bottom_Set8_Entry2.bin" ; $20 bytes


;;; $EE20: Samus top tiles - set 9 - entry 0 ;;;
SamusTiles_Top_Set9_Entry0:
; Bh: Moving right - gun extended - frame 0
; Bh: Moving right - gun extended - frame 5
incbin "../data/SamusTiles_Top_Set9_Entry0.bin" ; $C0 bytes


;;; $EEE0: Samus top tiles - set 9 - entry 1 ;;;
SamusTiles_Top_Set9_Entry1:
; Bh: Moving right - gun extended - frame 4
incbin "../data/SamusTiles_Top_Set9_Entry1.bin" ; $C0 bytes


;;; $EFA0: Samus top tiles - set 9 - entry 2 ;;;
SamusTiles_Top_Set9_Entry2:
; Bh: Moving right - gun extended - frame 2
incbin "../data/SamusTiles_Top_Set9_Entry2.bin" ; $E0 bytes


;;; $F080: Samus top tiles - set 9 - entry 3 ;;;
SamusTiles_Top_Set9_Entry3:
; Bh: Moving right - gun extended - frame 3
incbin "../data/SamusTiles_Top_Set9_Entry3.bin" ; $100 bytes


;;; $F180: Samus top tiles - set 9 - entry 4 ;;;
SamusTiles_Top_Set9_Entry4:
; Bh: Moving right - gun extended - frame 6
; Bh: Moving right - gun extended - frame 9
incbin "../data/SamusTiles_Top_Set9_Entry4.bin" ; $C0 bytes


;;; $F240: Samus top tiles - set 9 - entry 5 ;;;
SamusTiles_Top_Set9_Entry5:
; Bh: Moving right - gun extended - frame 7
incbin "../data/SamusTiles_Top_Set9_Entry5.bin" ; $E0 bytes


;;; $F320: Samus top tiles - set 9 - entry 6 ;;;
SamusTiles_Top_Set9_Entry6:
; Ch: Moving left  - gun extended - frame 0
; Ch: Moving left  - gun extended - frame 5
incbin "../data/SamusTiles_Top_Set9_Entry6.bin" ; $100 bytes


;;; $F420: Samus top tiles - set 9 - entry 7 ;;;
SamusTiles_Top_Set9_Entry7:
; Ch: Moving left  - gun extended - frame 4
incbin "../data/SamusTiles_Top_Set9_Entry7.bin" ; $100 bytes


;;; $F520: Samus top tiles - set 9 - entry 8 ;;;
SamusTiles_Top_Set9_Entry8:
; Ch: Moving left  - gun extended - frame 3
incbin "../data/SamusTiles_Top_Set9_Entry8.bin" ; $120 bytes


;;; $F640: Samus top tiles - set 9 - entry 9 ;;;
SamusTiles_Top_Set9_Entry9:
; Ch: Moving left  - gun extended - frame 2
incbin "../data/SamusTiles_Top_Set9_Entry9.bin" ; $120 bytes


;;; $F760: Samus top tiles - set 9 - entry Ah ;;;
SamusTiles_Top_Set9_EntryA:
; Ch: Moving left  - gun extended - frame 6
; Ch: Moving left  - gun extended - frame 9
incbin "../data/SamusTiles_Top_Set9_EntryA.bin" ; $100 bytes


;;; $F860: Samus top tiles - set 9 - entry Bh ;;;
SamusTiles_Top_Set9_EntryB:
; Ch: Moving left  - gun extended - frame 8
incbin "../data/SamusTiles_Top_Set9_EntryB.bin" ; $140 bytes


;;; $F9A0: Samus top tiles - set 9 - entry Ch ;;;
SamusTiles_Top_Set9_EntryC:
; Bh: Moving right - gun extended - frame 8
incbin "../data/SamusTiles_Top_Set9_EntryC.bin" ; $E0 bytes


;;; $FAA0: Samus top tiles - set 9 - entry Dh ;;;
SamusTiles_Top_Set9_EntryD:
; Ch: Moving left  - gun extended - frame 7
incbin "../data/SamusTiles_Top_Set9_EntryD.bin" ; $140 bytes


;;; $FBE0: Samus top tiles - set 9 - entry Eh ;;;
SamusTiles_Top_Set9_EntryE:
; Bh: Moving right - gun extended - frame 1
incbin "../data/SamusTiles_Top_Set9_EntryE.bin" ; $C0 bytes


;;; $FCA0: Samus top tiles - set 9 - entry Fh ;;;
SamusTiles_Top_Set9_EntryF:
; Ch: Moving left  - gun extended - frame 1
incbin "../data/SamusTiles_Top_Set9_EntryF.bin" ; $100 bytes


Freespace_Bank9B_FDA0:
; $260 bytes
