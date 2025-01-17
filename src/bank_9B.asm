
org $9B8000


Tiles_SamusDeathSequence:
incbin "../data/Tiles_SamusDeathSequence.bin" ; $1400 bytes

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
    dw $3BE0,$5FF0,$7FFF ; Using x-ray
    dw $43FF,$2F5A,$1AB5 ; In room with layer blending configuration = 28h/2Ah (with colour math backdrops)

SetProjectileTrailPosition:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    JSL.L Get_ProjectileTrailFrame 
    LDA.W $093F 
    BPL .notRotatingRoom 
    JSL.L Calculate_ProjectilePosition_InRotatingElevatorRoom 
    LDA.B $12 
    PHA 
    LDA.B $14 
    CLC 
    ADC.W $0911 
    STA.B $12 
    PLA 
    CLC 
    ADC.W $0915 
    STA.B $14 
    BRA + 


.notRotatingRoom:
    LDA.W $0B64,X : STA.B $12 
    LDA.W $0B78,X : STA.B $14 

  + PHY 
    LDA.W $0C18,X 
    BIT.W #$0020 
    BNE .SBATrail 
    BIT.W #$0010 
    BNE .getOffset 
    AND.W #$000F 
    ASL A 
    TAY 
    LDA.W $0C04,X 
    AND.W #$000F 
    ASL A 
    CLC 
    ADC.W BeamTrailOffsets_uncharged,Y 
    BRA .merge 


.getOffset:
    AND.W #$000F 
    ASL A 
    TAY 
    LDA.W $0C04,X 
    AND.W #$000F 
    ASL A 
    CLC 
    ADC.W BeamTrailOffsets_charged,Y 
    BRA .merge 


.SBATrail:
    AND.W #$000F 
    ASL A 
    TAY 
    LDA.W $0C04,X 
    AND.W #$000F 
    ASL A 
    CLC 
    ADC.W BeamTrailOffsets_spazerSBA,Y 

.merge:
    TAY 
    LDA.B $16 
    ASL #2
    CLC 
    ADC.W $0000,Y 
    TAY 
    PLX 
    LDA.W $0000,Y 
    XBA 
    BMI .leftYHighByte 
    AND.W #$00FF 
    BRA + 


.leftYHighByte:
    ORA.W #$FF00 

  + CLC 
    ADC.B $14 
    SEC 
    SBC.W #$0004 
    STA.L $7ED778,X 
    DEY 
    LDA.W $0000,Y 
    XBA 
    BMI .leftXHighByte 
    AND.W #$00FF 
    BRA + 


.leftXHighByte:
    ORA.W #$FF00 

  + CLC 
    ADC.B $12 
    SEC 
    SBC.W #$0004 
    STA.L $7ED730,X 
    INY 
    LDA.W $0002,Y 
    XBA 
    BMI .rightYHighByte 
    AND.W #$00FF 
    BRA + 


.rightYHighByte:
    ORA.W #$FF00 

  + CLC 
    ADC.B $14 
    SEC 
    SBC.W #$0004 
    STA.L $7ED79C,X 
    LDA.W $0001,Y 
    XBA 
    BMI .rightXHighByte 
    AND.W #$00FF 
    BRA + 


.rightXHighByte:
    ORA.W #$FF00 

  + CLC 
    ADC.B $12 
    SEC 
    SBC.W #$0004 
    STA.L $7ED754,X 
    PLB 
    PLP 
    RTL 


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

ChargedBeamTrails_Default:
    dw ChargedBeamTrails_Default_0 ; Up, facing right
    dw ChargedBeamTrails_Default_0 ; Up-right
    dw ChargedBeamTrails_Default_0 ; Right
    dw ChargedBeamTrails_Default_0 ; Down-right
    dw ChargedBeamTrails_Default_0 ; Down, facing right
    dw ChargedBeamTrails_Default_0 ; Down, facing left
    dw ChargedBeamTrails_Default_0 ; Down-left
    dw ChargedBeamTrails_Default_0 ; Left
    dw ChargedBeamTrails_Default_0 ; Up-left
    dw ChargedBeamTrails_Default_0 ; Up, facing left

ChargedBeamTrails_Wave_WaveIce:
    dw ChargedBeamTrails_Wave_WaveIce_0 ; Up, facing right
    dw ChargedBeamTrails_Wave_WaveIce_2 ; Up-right
    dw ChargedBeamTrails_Wave_WaveIce_1 ; Right
    dw ChargedBeamTrails_Wave_WaveIce_3 ; Down-right
    dw ChargedBeamTrails_Wave_WaveIce_0 ; Down, facing right
    dw ChargedBeamTrails_Wave_WaveIce_0 ; Down, facing left
    dw ChargedBeamTrails_Wave_WaveIce_2 ; Down-left
    dw ChargedBeamTrails_Wave_WaveIce_1 ; Left
    dw ChargedBeamTrails_Wave_WaveIce_3 ; Up-left
    dw ChargedBeamTrails_Wave_WaveIce_0 ; Up, facing left

ChargedBeamTrails_IceSpazer:
    dw ChargedBeamTrails_IceSpazer_0 ; Up, facing right
    dw ChargedBeamTrails_IceSpazer_1 ; Up-right
    dw ChargedBeamTrails_IceSpazer_2 ; Right
    dw ChargedBeamTrails_IceSpazer_3 ; Down-right
    dw ChargedBeamTrails_IceSpazer_4 ; Down, facing right
    dw ChargedBeamTrails_IceSpazer_4 ; Down, facing left
    dw ChargedBeamTrails_IceSpazer_5 ; Down-left
    dw ChargedBeamTrails_IceSpazer_6 ; Left
    dw ChargedBeamTrails_IceSpazer_7 ; Up-left
    dw ChargedBeamTrails_IceSpazer_0 ; Up, facing left

ChargedBeamTrails_WaveIceSpazer:
    dw ChargedBeamTrails_WaveIceSpazer_0 ; Up, facing right
    dw ChargedBeamTrails_WaveIceSpazer_1 ; Up-right
    dw ChargedBeamTrails_WaveIceSpazer_2 ; Right
    dw ChargedBeamTrails_WaveIceSpazer_3 ; Down-right
    dw ChargedBeamTrails_WaveIceSpazer_4 ; Down, facing right
    dw ChargedBeamTrails_WaveIceSpazer_4 ; Down, facing left
    dw ChargedBeamTrails_WaveIceSpazer_5 ; Down-left
    dw ChargedBeamTrails_WaveIceSpazer_6 ; Left
    dw ChargedBeamTrails_WaveIceSpazer_7 ; Up-left
    dw ChargedBeamTrails_WaveIceSpazer_0 ; Up, facing left

ChargedBeamTrails_IcePlasma:
    dw ChargedBeamTrails_IcePlasma_0 ; Up, facing right
    dw ChargedBeamTrails_IcePlasma_1 ; Up-right
    dw ChargedBeamTrails_IcePlasma_2 ; Right
    dw ChargedBeamTrails_IcePlasma_3 ; Down-right
    dw ChargedBeamTrails_IcePlasma_4 ; Down, facing right
    dw ChargedBeamTrails_IcePlasma_4 ; Down, facing left
    dw ChargedBeamTrails_IcePlasma_5 ; Down-left
    dw ChargedBeamTrails_IcePlasma_6 ; Left
    dw ChargedBeamTrails_IcePlasma_7 ; Up-left
    dw ChargedBeamTrails_IcePlasma_0 ; Up, facing left

ChargedBeamTrails_WaveIcePlasma:
    dw ChargedBeamTrails_WaveIcePlasma_0 ; Up, facing right
    dw ChargedBeamTrails_WaveIcePlasma_1 ; Up-right
    dw ChargedBeamTrails_WaveIcePlasma_2 ; Right
    dw ChargedBeamTrails_WaveIcePlasma_3 ; Down-right
    dw ChargedBeamTrails_WaveIcePlasma_4 ; Down, facing right
    dw ChargedBeamTrails_WaveIcePlasma_4 ; Down, facing left
    dw ChargedBeamTrails_WaveIcePlasma_5 ; Down-left
    dw ChargedBeamTrails_WaveIcePlasma_6 ; Left
    dw ChargedBeamTrails_WaveIcePlasma_7 ; Up-left
    dw ChargedBeamTrails_WaveIcePlasma_0 ; Up, facing left

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

SpazerSBATrail_WaveSpazer:
    dw SpazerSBATrail_WaveSpazer_0 ; Up, facing right
    dw SpazerSBATrail_WaveSpazer_1 ; Up-right
    dw SpazerSBATrail_WaveSpazer_2 ; Right
    dw SpazerSBATrail_WaveSpazer_3 ; Down-right
    dw SpazerSBATrail_WaveSpazer_0 ; Down, facing right
    dw SpazerSBATrail_WaveSpazer_0 ; Down, facing left
    dw SpazerSBATrail_WaveSpazer_1 ; Down-left
    dw SpazerSBATrail_WaveSpazer_2 ; Left
    dw SpazerSBATrail_WaveSpazer_3 ; Up-left
    dw SpazerSBATrail_WaveSpazer_0 ; Up, facing left

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

SetSamusDeathSequencePose:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W $0A1F 
    AND.W #$00FF 
    PHA 
    CMP.W #$0003 
    BNE .noSpinJumpSFX 
    LDA.W #$0032 
    JSL.L QueueSound_Lib1_Max6 

.noSpinJumpSFX:
    PLA 
    TAX 
    LDA.W .animationFrames,X 
    AND.W #$00FF 
    PHA 
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingLeft 
    LDA.W #$00D7 : STA.W $0A1C 
    BRA .initPose 


.facingLeft:
    LDA.W #$00D8 : STA.W $0A1C 

.initPose:
    JSL.L InitializeSamusPose_1 
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged 
    LDA.W $0A20 : STA.W $0A24 
    LDA.W $0A22 : STA.W $0A26 
    LDA.W $0A1C : STA.W $0A20 
    LDA.W $0A1E : STA.W $0A22 
    STZ.W $0A9A 
    PLA 
    STA.W $0A96 
    LDA.W $0AF6 
    SEC 
    SBC.W $0911 
    STA.W $0AF6 
    LDA.W $0AFA 
    SEC 
    SBC.W $0915 
    STA.W $0AFA 
    PLB 
    PLP 
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

Draw_Samus_Starting_Death_Animation_JSL:
    JSL.L Draw_Samus_Starting_Death_Animation 
    RTL 


Handle_Death_Animation_Flashing:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W $0DE6 
    CMP.W #$0004 
    BPL .timerGreaterThan3 
    ASL A 
    TAY 
    JSR.W QueueTransferOfSegmentOfSamusDeathSequenceToVRAM 

.timerGreaterThan3:
    LDA.W $0DE6 
    INC A 
    STA.W $0DE6 
    CMP.W #$003C 
    BPL .end 
    LDA.W $0DE2 
    DEC A ; >.<
    STA.W $0DE2 
    BEQ .timerExpired 
    BPL .returnFlashing 

.timerExpired:
    LDA.W $0DE4 
    BEQ .zeroIndex 
    LDA.W #$0000 : STA.W $0DE4 
    LDA.W #$0003 : STA.W $0DE2 
    BRA + 


.zeroIndex:
    LDA.W #$0001 : STA.W $0DE4 
    LDA.W #$0001 : STA.W $0DE2 

  + LDA.W $0DE4 
    ASL A 
    TAX 
    JSR.W WriteDeathAnimationSpritePalettes 

.returnFlashing:
    LDA.W #$0000 
    PLB 
    PLP 
    RTL 


.end:
    JSR.W FinishDeathAnimationFlashing 
    LDA.B $8D 
    AND.W #$00B0 
    CMP.W #$00B0 
    BNE .debug 
    LDA.W #$0001 : STA.W $0DEC 
    BRA .returnFlashingEnded 


.debug:
    STZ.W $0DEC 

.returnFlashingEnded:
    LDA.W #$0001 
    PLB 
    PLP 
    RTL 


FinishDeathAnimationFlashing:
    PHP 
    REP #$30 
    LDY.W $0A74 
    LDA.W .suitPalettes,Y 
    TAX 
    LDA.W $0000,X 
    TAX 
    PHB 
    PEA.W $9B00 
    PLB 
    PLB 
    LDA.W $0000,X : STA.L $7EC180 
    LDA.W $0002,X : STA.L $7EC182 
    LDA.W $0004,X : STA.L $7EC184 
    LDA.W $0006,X : STA.L $7EC186 
    LDA.W $0008,X : STA.L $7EC188 
    LDA.W $000A,X : STA.L $7EC18A 
    LDA.W $000C,X : STA.L $7EC18C 
    LDA.W $000E,X : STA.L $7EC18E 
    LDA.W $0010,X : STA.L $7EC190 
    LDA.W $0012,X : STA.L $7EC192 
    LDA.W $0014,X : STA.L $7EC194 
    LDA.W $0016,X : STA.L $7EC196 
    LDA.W $0018,X : STA.L $7EC198 
    LDA.W $001A,X : STA.L $7EC19A 
    LDA.W $001C,X : STA.L $7EC19C 
    LDA.W $001E,X : STA.L $7EC19E 
    LDX.W #SamusPalettes_DeathSequence_SuitlessSamus_0 
    LDA.W $0000,X : STA.L $7EC1E0 
    LDA.W $0002,X : STA.L $7EC1E2 
    LDA.W $0004,X : STA.L $7EC1E4 
    LDA.W $0006,X : STA.L $7EC1E6 
    LDA.W $0008,X : STA.L $7EC1E8 
    LDA.W $000A,X : STA.L $7EC1EA 
    LDA.W $000C,X : STA.L $7EC1EC 
    LDA.W $000E,X : STA.L $7EC1EE 
    LDA.W $0010,X : STA.L $7EC1F0 
    LDA.W $0012,X : STA.L $7EC1F2 
    LDA.W $0014,X : STA.L $7EC1F4 
    LDA.W $0016,X : STA.L $7EC1F6 
    LDA.W $0018,X : STA.L $7EC1F8 
    LDA.W $001A,X : STA.L $7EC1FA 
    LDA.W $001C,X : STA.L $7EC1FC 
    LDA.W $001E,X : STA.L $7EC1FE 
    PLB 
    LDY.W #$0008 
    JSR.W QueueTransferOfSegmentOfSamusDeathSequenceToVRAM 
    LDA.W DeathSequenceSuitExplosionPaletteIndexTable_timer 
    AND.W #$00FF 
    STA.W $0DE2 
    STZ.W $0DE4 
    STZ.W $0DE6 
    JSR.W HandleDeathSequenceSuitExplosion 
    PLP 
    RTS 


.suitPalettes:
    dw SamusDeathSequencePalettePointers_Suit_power 
    dw SamusDeathSequencePalettePointers_Suit_varia 
    dw SamusDeathSequencePalettePointers_Suit_gravity 

WriteDeathAnimationSpritePalettes:
    PHP 
    REP #$30 
    LDY.W $0A74 
    LDA.W .suitPalettes,Y : STA.B $14 
    LDA.W SamusDeathSequencePalettePointers_Suitless,X : STA.B $12 
    TXA 
    CLC 
    ADC.B $14 
    TAX 
    LDA.W $0000,X 
    TAX 
    PHB 
    PEA.W $9B00 
    PLB 
    PLB 
    LDA.W $0000,X : STA.L $7EC180 
    LDA.W $0002,X : STA.L $7EC182 
    LDA.W $0004,X : STA.L $7EC184 
    LDA.W $0006,X : STA.L $7EC186 
    LDA.W $0008,X : STA.L $7EC188 
    LDA.W $000A,X : STA.L $7EC18A 
    LDA.W $000C,X : STA.L $7EC18C 
    LDA.W $000E,X : STA.L $7EC18E 
    LDA.W $0010,X : STA.L $7EC190 
    LDA.W $0012,X : STA.L $7EC192 
    LDA.W $0014,X : STA.L $7EC194 
    LDA.W $0016,X : STA.L $7EC196 
    LDA.W $0018,X : STA.L $7EC198 
    LDA.W $001A,X : STA.L $7EC19A 
    LDA.W $001C,X : STA.L $7EC19C 
    LDA.W $001E,X : STA.L $7EC19E 
    LDX.B $12 
    LDA.W $0000,X : STA.L $7EC1E0 
    LDA.W $0002,X : STA.L $7EC1E2 
    LDA.W $0004,X : STA.L $7EC1E4 
    LDA.W $0006,X : STA.L $7EC1E6 
    LDA.W $0008,X : STA.L $7EC1E8 
    LDA.W $000A,X : STA.L $7EC1EA 
    LDA.W $000C,X : STA.L $7EC1EC 
    LDA.W $000E,X : STA.L $7EC1EE 
    LDA.W $0010,X : STA.L $7EC1F0 
    LDA.W $0012,X : STA.L $7EC1F2 
    LDA.W $0014,X : STA.L $7EC1F4 
    LDA.W $0016,X : STA.L $7EC1F6 
    LDA.W $0018,X : STA.L $7EC1F8 
    LDA.W $001A,X : STA.L $7EC1FA 
    LDA.W $001C,X : STA.L $7EC1FC 
    LDA.W $001E,X : STA.L $7EC1FE 
    PLB 
    PLP 
    RTS 


.suitPalettes:
    dw SamusDeathSequencePalettePointers_Suit_power 
    dw SamusDeathSequencePalettePointers_Suit_varia 
    dw SamusDeathSequencePalettePointers_Suit_gravity 

QueueTransferOfSegmentOfSamusDeathSequenceToVRAM:
    PHP 
    REP #$30 
    LDX.W $0330 
    LDA.W #$0400 : STA.B $D0,X 
    INX #2
    LDA.W SamusDeathSequencePointers_Source,Y : STA.B $D0,X 
    INX #2
    SEP #$20 
    LDA.B #$9B : STA.B $D0,X 
    REP #$20 
    INX 
    LDA.W SamusDeathSequencePointers_Destination,Y : STA.B $D0,X 
    INX #2
    STX.W $0330 
    PLP 
    RTS 


Handle_DeathSequence_SuitExplosionWhiteOut:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    JSR.W HandleDeathSequenceWhiteOut 
    JSR.W HandleDeathSequenceSuitExplosion 
    PLB 
    PLP 
    RTL 


HandleDeathSequenceWhiteOut:
    PHP 
    REP #$30 
    LDA.W #$7E00 : STA.B $01 
    LDA.W $0DEC 
    BNE .return 
    LDA.W $0DE4 
    BEQ .return 
    LDA.W $0DE6 
    ASL A 
    TAX 
    LDA.W #$C000 : STA.B $00 
    LDY.W #$0000 

.loopFirstFourPalettes:
    LDA.W ShadesOfWhite,X : STA.B [$00],Y 
    INY #2
    CPY.W #$0180 
    BMI .loopFirstFourPalettes 
    LDY.W #$01A0 

.loopLastFourPalettes:
    LDA.W ShadesOfWhite,X : STA.B [$00],Y 
    INY #2
    CPY.W #$01E0 
    BMI .loopLastFourPalettes 
    LDA.W $0DE6 
    CMP.W #$0014 
    BPL .return 
    INC A 
    STA.W $0DE6 

.return:
    PLP 
    RTS 


HandleDeathSequenceSuitExplosion:
    PHP 
    REP #$30 
    LDA.W $0DE2 
    DEC A 
    STA.W $0DE2 
    BEQ .timerExpired 
    BPL .notFinished 

.timerExpired:
    LDA.W $0DE4 
    INC A 
    STA.W $0DE4 
    CMP.W #$0009 
    BMI .lessThan9 
    LDA.W #$0015 : STA.W $0DE6 
    JSR.W HandleDeathSequenceWhiteOut 
    STZ.W $0DEC 
    LDA.W #$0001 
    BRA .return 


.lessThan9:
    LDA.W $0DEC 
    BEQ .lessThan2 
    LDA.W $0DE4 
    CMP.W #$0002 
    BMI .lessThan2 
    ASL A 
    TAX 
    LDA.W DeathSequenceSuitExplosionPaletteIndexTable_timer,X 
    AND.W #$00FF 
    STA.W $0DE2 
    BRA .notFinished 


.lessThan2:
    LDA.W $0DE4 
    ASL A 
    TAX 
    LDA.W DeathSequenceSuitExplosionPaletteIndexTable_timer,X 
    AND.W #$00FF 
    STA.W $0DE2 
    LDA.W DeathSequenceSuitExplosionPaletteIndexTable_index,X 
    AND.W #$00FF 
    ASL A 
    TAX 
    JSR.W WriteDeathAnimationSpritePalettes 

.notFinished:
    JSL.L DrawSamusSuitExploding 
    LDA.W #$0000 

.return:
    PLP 
    RTS 


SamusDeathSequencePointers_Source:
    dw $8400,$8800,$8C00,$9000,$8000 

SamusDeathSequencePointers_Destination:
    dw $6200,$6400,$6600,$6800,$6000 

SamusDeathSequencePalettePointers_Suit_power:
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

SamusDeathSequencePalettePointers_Suit_varia:
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

SamusDeathSequencePalettePointers_Suit_gravity:
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

DeathSequenceSuitExplosionPaletteIndexTable:
;        _____ Timer
;       |    _ Palette table index (for SamusDeathSequencePalettePointers_Suit_power and SamusDeathSequencePalettePointers_Suitless)
;       |   |
  .timer
    db $15 
  .index
    db     $00 
    db $06,$02
    db $03,$03
    db $04,$04
    db $05,$05
    db $05,$06
    db $06,$07
    db $06,$08
    db $50,$09

ShadesOfWhite:
    dw $0421,$0C63,$14A5,$1CE7,$2529,$2D6B,$35AD,$4210 
    dw $4A52,$4E73,$5294,$56B5,$5AD6,$5EF7,$6318,$6739 
    dw $6B5A,$6F7B,$739C,$77BD,$7BDE,$7FFF 

CancelGrappleBeamIfInIncompatiblePose:
    LDA.W $0A1F 
    AND.W #$00FF 
    TAX 
    LDA.W .poses,X 
    AND.W #$00FF 
    BEQ .grappleAllowed 

.cancelGrapple:
    LDA.W $0D32 
    CMP.W #GrappleBeamFunction_Inactive 
    BEQ .return 
    LDA.W #GrappleBeamFunction_HitNothing_Cancel : STA.W $0D32 

.return:
    RTS 


.grappleAllowed:
    LDA.W $0D32 
    CMP.W #GrappleBeamFunction_Inactive 
    BEQ .return 
    CMP.W #GrappleBeamFunction_Connected_LockedInPlace 
    BPL .return 
    LDA.W $0A1C 
    ASL #3
    TAX 
    LDA.L PoseDefinitions_directionShotsFired,X 
    AND.W #$00FF 
    BIT.W #$00F0 
    BNE .cancelGrapple 
    CMP.W $0D34 
    BNE + 
    RTS 


  + LDA.W $0CF6 
    BEQ .cancelGrapple 
    LDA.W #$0007 
    JSL.L QueueSound_Lib1_Max6 
    LDA.W #GrappleBeamFunction_Fire_GotoCancel : STA.W $0D32 
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

RTS_9BB8D4:
    RTS 

    LDA.W $0A1C 
    ASL #3
    TAX 
    LDA.L PoseDefinitions_directionShotsFired,X 
    AND.W #$00FF 
    BIT.W #$00F0 
    BNE .return 
    CMP.W $0D34 
    BEQ .return 
    STA.W $0D34 

.return:
    RTS 


CheckIfGrappleIsConnectedToBlock:
    STZ.W $0D22 
    STZ.W $0D24 
    JSL.L BlockGrappleReaction 
    BCC .returnNotConnected 
    LDA.W #$0001 : STA.W $0A64 
    SEC 
    RTS 


.returnNotConnected:
    CLC 
    RTS 


ProcessEnemyGrappleBeamCollisionResult:
    ASL A 
    TAX 
    JMP.W (.pointers,X) 


.pointers:
    dw CLCRTS_9BB91A 
    dw ReturnZero_SECRTS_9BB91C 
    dw CLCRTS_9BB921 
    dw ReturnOne_SECRTS_9BB923 
    dw ReturnZero_SECRTS_9BB928 
    dw ReturnZero_SECRTS_9BB92D 
    dw ProcessEnemyGrappleBeamCollisionResult_HurtSamus 

CLCRTS_9BB91A:
    CLC 
    RTS 


ReturnZero_SECRTS_9BB91C:
    LDA.W #$0000 
    SEC 
    RTS 


CLCRTS_9BB921:
    CLC 
    RTS 


ReturnOne_SECRTS_9BB923:
    LDA.W #$0001 
    SEC 
    RTS 


ReturnZero_SECRTS_9BB928:
    LDA.W #$0000 
    SEC 
    RTS 


ReturnZero_SECRTS_9BB92D:
    LDA.W #$0000 
    SEC 
    RTS 


ProcessEnemyGrappleBeamCollisionResult_HurtSamus:
    LDX.B $12 
    LDA.L $A00006,X : STA.B $12 
    LDA.W $09A2 
    BIT.W #$0020 
    BNE .gravitySuit 
    LSR A 
    BCC .suitless 
    LSR.B $12 

.suitless:
    LDA.B $12 
    BRA .damageSamus 


.gravitySuit:
    LSR.B $12 
    LSR.B $12 
    LDA.B $12 

.damageSamus:
    JSL.L Deal_A_Damage_to_Samus 
    LDA.W #$0060 : STA.W $18A8 
    LDA.W #$0005 : STA.W $18AA 
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingLeft 
    STZ.W $0A54 
    BRA .returnOneCarrySet 


.facingLeft:
    LDA.W #$0001 : STA.W $0A54 

.returnOneCarrySet:
    LDA.W #$0001 
    SEC 
    RTS 


HandleConnectingGrapple:
    LDA.W $0A1F 
    AND.W #$00FF 
    CMP.W #$001A 
    BNE .notGrabbedByDraygon 
    LDA.W #GrappleBeamFunction_Connected_LockedInPlace : STA.W $0D32 
    STZ.W $0D00 
    RTS 


.notGrabbedByDraygon:
    LDA.W $0D34 
    ASL #2
    TAX 
    LDA.W $0B2E 
    BNE .movingVertically 
    LDA.W $0B2C 
    BNE .movingVertically 
    LDA.W $0A1F 
    AND.W #$00FF 
    CMP.W #$0005 
    BEQ .crouching 
    LDA.W ConnectingToGrappleBlockPointerTable_Default_next,X : STA.W $0D32 
    LDA.W ConnectingToGrappleBlockPointerTable_Default_function,X : STA.W $0D82 
    JMP.W ($0D82) 


.crouching:
    LDA.W ConnectingToGrappleBlockPointerTable_Crouching_next,X : STA.W $0D32 
    LDA.W ConnectingToGrappleBlockPointerTable_Crouching_function,X : STA.W $0D82 
    JMP.W ($0D82) 


.movingVertically:
    LDA.W ConnectingToGrappleBlockPointerTable_MovingVertically_next,X : STA.W $0D32 
    LDA.W ConnectingToGrappleBlockPointerTable_MovingVertically_function,X : STA.W $0D82 
    JMP.W ($0D82) 


HandleConnectingGrapple_SwingingClockwise:
    LDA.W #$00B2 : STA.W $0A2A 
    JMP.W HandleConnectingGrapple_Swinging 


HandleConnectingGrapple_SwingingAntiClockwise:
    LDA.W #$00B3 : STA.W $0A2A 
    BRA HandleConnectingGrapple_Swinging 


HandleConnectingGrapple_Standing_AimingRight:
    LDA.W #$00A8 : STA.W $0A2A 
    JMP.W HandleConnectingGrapple_StuckInPlace 


HandleConnectingGrapple_Standing_AimingDownRight:
    LDA.W #$00AA : STA.W $0A2A 
    JMP.W HandleConnectingGrapple_StuckInPlace 


HandleConnectingGrapple_Standing_AimingDownLeft:
    LDA.W #$00AB : STA.W $0A2A 
    JMP.W HandleConnectingGrapple_StuckInPlace 


HandleConnectingGrapple_Standing_AimingLeft:
    LDA.W #$00A9 : STA.W $0A2A 
    JMP.W HandleConnectingGrapple_StuckInPlace 


HandleConnectingGrapple_Crouching_AimingRight:
    LDA.W #$00B4 : STA.W $0A2A 
    JMP.W HandleConnectingGrapple_StuckInPlace 


HandleConnectingGrapple_Crouching_AimingDownRight:
    LDA.W #$00B6 : STA.W $0A2A 
    JMP.W HandleConnectingGrapple_StuckInPlace 


HandleConnectingGrapple_Crouching_AimingDownLeft:
    LDA.W #$00B7 : STA.W $0A2A 
    JMP.W HandleConnectingGrapple_StuckInPlace 


HandleConnectingGrapple_Crouching_AimingLeft:
    LDA.W #$00B5 : STA.W $0A2A 
    BRA HandleConnectingGrapple_StuckInPlace 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_HandleConnectingGrapple_InAir_AimingRight_9BBA31:
    LDA.W #$00AC : STA.W $0A2A 
    BRA HandleConnectingGrapple_StuckInPlace 


UNUSED_HandleConnectingGrapple_InAir_AimingDownRight_9BBA39:
    LDA.W #$00B0 : STA.W $0A2A 
    BRA HandleConnectingGrapple_StuckInPlace 


UNUSED_HandleConnectingGrapple_InAir_AimingDown_FaceR_9BBA41:
    LDA.W #$00AE : STA.W $0A2A 
    BRA HandleConnectingGrapple_StuckInPlace 


UNUSED_HandleConnectingGrapple_InAir_AimingDown_FaceL_9BBA49:
    LDA.W #$00AF : STA.W $0A2A 
    BRA HandleConnectingGrapple_StuckInPlace 


UNUSED_HandleConnectingGrapple_InAir_AimingDownLeft_9BBA51:
    LDA.W #$00B1 : STA.W $0A2A 
    BRA HandleConnectingGrapple_StuckInPlace 


UNUSED_HandleConnectingGrapple_InAir_AimingLeft_9BBA59:
    LDA.W #$00AD : STA.W $0A2A 
    BRA HandleConnectingGrapple_StuckInPlace 
endif ; !FEATURE_KEEP_UNREFERENCED


HandleConnectingGrapple_Swinging:
    LDA.W #$0009 : STA.W $0A30 
    LDA.W $0AF6 
    SEC 
    SBC.W $0D08 
    STA.B $12 
    LDA.W $0AFA 
    SEC 
    SBC.W $0D0C 
    STA.B $14 
    JSL.L CalculateAngleOf_12_14_Offset 
    XBA 
    STA.W $0CFA 
    STA.W $0CFC 
    STZ.W $0D00 
    LDA.W $0CFE 
    CMP.W #$0040 
    BMI .lessThan40 
    SEC 
    SBC.W #$0018 
    STA.W $0CFE 

.lessThan40:
    JSL.L UpdateGrappleBeamStartPositionDuringGrappleSwinging 
    RTS 


HandleConnectingGrapple_StuckInPlace:
    LDA.W #$000A : STA.W $0A30 
    LDA.W $0AF6 
    SEC 
    SBC.W $0D08 
    STA.B $12 
    LDA.W $0AFA 
    SEC 
    SBC.W $0D0C 
    STA.B $14 
    JSL.L CalculateAngleOf_12_14_Offset 
    XBA 
    STA.W $0CFA 
    STA.W $0CFC 
    STZ.W $0D00 
    LDA.W $0CFE 
    CMP.W #$0040 
    BMI .lessThan40 
    SEC 
    SBC.W #$0018 
    STA.W $0CFE 

.lessThan40:
    JSL.L UpdateGrappleBeamStartPositionDuringGrappleSwinging 
    RTS 


HandleSpecialGrappleBeamAngles:
    LDX.W #$0046 

.loop:
    LDA.W $0CFA 
    CMP.W GrappleBeamSpecialAngles_angle,X 
    BEQ .specialAngle 
    TXA 
    SEC 
    SBC.W #$000A 
    TAX 
    BPL .loop 
    CLC 
    RTS 


.specialAngle:
    LDA.W GrappleBeamSpecialAngles_pose,X : STA.W $0A2A 
    LDA.W GrappleBeamSpecialAngles_XOffset,X 
    CLC 
    ADC.W $0D08 
    STA.W $0AF6 
    LDA.W GrappleBeamSpecialAngles_YOffset,X 
    CLC 
    ADC.W $0D0C 
    STA.W $0AFA 
    LDA.W GrappleBeamSpecialAngles_grappleFunction,X : STA.W $0D32 
    STZ.W $0A30 
    STZ.W $0CF8 
    LDA.W $0AF6 
    SEC 
    SBC.W $0B10 
    BMI .checkNegativeX 
    CMP.W #$000D 
    BMI + 
    LDA.W $0AF6 
    SEC 
    SBC.W #$000C 
    STA.W $0B10 
    BRA + 


.checkNegativeX:
    CMP.W #$FFF4 
    BPL + 
    LDA.W $0AF6 
    CLC 
    ADC.W #$000C 
    STA.W $0B10 

  + LDA.W $0AFA 
    SEC 
    SBC.W $0B14 
    BMI .checkNegativeY 
    CMP.W #$000D 
    BMI .returnCarrySet 
    LDA.W $0AFA 
    SEC 
    SBC.W #$000C 
    STA.W $0B14 
    BRA .returnCarrySet 


.checkNegativeY:
    CMP.W #$FFF4 
    BPL .returnCarrySet 
    LDA.W $0AFA 
    CLC 
    ADC.W #$000C 
    STA.W $0B14 

.returnCarrySet:
    SEC 
    RTS 


HandleGrappleDpadInput:
    LDA.B $8F 
    BIT.W #$0800 
    BNE .decreaseLength 
    BIT.W #$0400 
    BNE .increaseLength 

.gotoAdjustLengthEnd:
    BRA .adjustLengthEnd 


.fullyLengthened:
    LDA.W #$0040 : STA.W $0CFE 
    BRA .adjustLengthEnd 


.increaseLength:
    LDA.W $0CFE 
    CMP.W #$0040 
    BPL .fullyLengthened 
    LDA.W #$0002 : STA.W $0D00 
    BRA .adjustLengthEnd 


.decreaseLength:
    LDA.W $0CFE 
    BEQ .gotoAdjustLengthEnd 
    LDA.W #$0002 
    EOR.W #$FFFF 
    INC A 
    STA.W $0D00 

.adjustLengthEnd:
    LDA.W $0CFA 
    AND.W #$FF00 
    CMP.W #$4000 
    BMI .resetAccel 
    CMP.W #$C000 
    BPL .resetAccel 
    LDA.B $8B 
    BIT.W #$0200 
    BNE .left 
    BIT.W #$0100 
    BNE .right 

.resetAccel:
    STZ.W $0D2A 
    RTS 


.right:
    LDA.W $0CFA 
    AND.W #$FF00 
    CMP.W #$8000 
    BNE .checkLiquidPhysics 
    LDA.W $0D26 
    BNE .checkLiquidPhysics 
    LDA.W #$FF00 : STA.W $0D26 

.checkLiquidPhysics:
    LDA.W $0CF4 
    BEQ .minusC 
    BIT.W #$0001 
    BEQ .minusC 
    LDA.W GrappleSwingConstants_AccelerationDueToButtonInput 
    LSR A 
    EOR.W #$FFFF 
    INC A 
    STA.W $0D2A 
    RTS 


.minusC:
    LDA.W GrappleSwingConstants_AccelerationDueToButtonInput 
    EOR.W #$FFFF 
    INC A 
    STA.W $0D2A 
    RTS 


.left:
    LDA.W $0CFA 
    AND.W #$FF00 
    CMP.W #$8000 
    BNE ..accellerate 
    LDA.W $0D26 
    BNE ..accellerate 
    LDA.W #$0100 : STA.W $0D26 

..accellerate:
    LDA.W $0CF4 
    BEQ ..plusC 
    BIT.W #$0001 
    BEQ ..plusC 
    LDA.W GrappleSwingConstants_AccelerationDueToButtonInput 
    LSR A 
    STA.W $0D2A 
    RTS 


..plusC:
    LDA.W GrappleSwingConstants_AccelerationDueToButtonInput : STA.W $0D2A 
    RTS 


DetermineGrappleSwingAngularAccelerationDueToAngleOfSwing:
    LDA.W $0CFA 
    AND.W #$C000 
    CMP.W #$C000 
    BEQ .gotoUpLeft 
    BIT.W #$8000 
    BNE .downLeft 
    BIT.W #$4000 
    BNE .downRight 
    LDA.W GrappleSwingConstants_Deceleration 
    LSR #2
    STA.W $0D2C 
    LDA.W $0CF4 
    BEQ + 
    BIT.W #$0001 
    BEQ + 
    LDA.W GrappleSwingConstants_AccelerationDueToAngleOfSwing 
    LSR #3
    STA.W $0D28 
    RTS 


  + LDA.W GrappleSwingConstants_AccelerationDueToAngleOfSwing 
    LSR #2
    STA.W $0D28 
    RTS 


.gotoUpLeft:
    JMP.W .upLeft 


.downRight:
    LDA.W GrappleSwingConstants_Deceleration : STA.W $0D2C 
    LDA.W $0CF4 
    BEQ + 
    BIT.W #$0001 
    BEQ + 
    LDA.W GrappleSwingConstants_AccelerationDueToAngleOfSwing 
    LSR A 
    STA.W $0D28 
    RTS 


  + LDA.W GrappleSwingConstants_AccelerationDueToAngleOfSwing : STA.W $0D28 
    RTS 


.downLeft:
    LDA.W $0CFA 
    AND.W #$FF00 
    CMP.W #$8000 
    BEQ .straightDown 
    LDA.W GrappleSwingConstants_Deceleration 
    EOR.W #$FFFF 
    INC A 
    STA.W $0D2C 
    LDA.W $0CF4 
    BEQ + 
    BIT.W #$0001 
    BEQ + 
    LDA.W GrappleSwingConstants_AccelerationDueToAngleOfSwing 
    LSR A 
    EOR.W #$FFFF 
    INC A 
    STA.W $0D28 
    RTS 


  + LDA.W GrappleSwingConstants_AccelerationDueToAngleOfSwing 
    EOR.W #$FFFF 
    INC A 
    STA.W $0D28 
    RTS 


.straightDown:
    STZ.W $0D28 
    STZ.W $0D2C 
    LDA.W $0D26 
    BPL + 
    DEC A 
    EOR.W #$FFFF 

  + XBA 
    AND.W #$00FF 
    CMP.W #$0001 
    BMI .resetAngularVelocity 
    RTS 


.resetAngularVelocity:
    STZ.W $0D26 
    RTS 


.upLeft:
    LDA.W GrappleSwingConstants_Deceleration 
    LSR #2
    EOR.W #$FFFF 
    INC A 
    STA.W $0D2C 
    LDA.W $0CF4 
    BEQ .minus6 
    BIT.W #$0001 
    BEQ .minus6 
    LDA.W GrappleSwingConstants_AccelerationDueToAngleOfSwing 
    LSR #3
    EOR.W #$FFFF 
    INC A 
    STA.W $0D28 
    RTS 


.minus6:
    LDA.W GrappleSwingConstants_AccelerationDueToAngleOfSwing 
    LSR #2
    EOR.W #$FFFF 
    INC A 
    STA.W $0D28 
    RTS 


UpdateGrappleSwingAngularVelocity:
    LDA.W $0D26 
    CLC 
    ADC.W $0D28 
    CLC 
    ADC.W $0D2A 
    STA.W $0D26 
    LDA.W $0CFA 
    EOR.W $0D26 
    BPL .notRising 
    LDA.W $0D26 
    CLC 
    ADC.W $0D2C 
    STA.W $0D26 

.notRising:
    LDA.W $0D26 
    BPL .positiveAngularVelocity 
    EOR.W #$FFFF 
    INC A 
    CMP.W GrappleSwingConstants_AbsoluteAngularVelocity 
    BCC .return 
    LDA.W GrappleSwingConstants_AbsoluteAngularVelocity 
    EOR.W #$FFFF 
    INC A 
    STA.W $0D26 
    RTS 


.positiveAngularVelocity:
    CMP.W GrappleSwingConstants_AbsoluteAngularVelocity 
    BCC .return 
    LDA.W GrappleSwingConstants_AbsoluteAngularVelocity : STA.W $0D26 

.return:
    RTS 


HandleGrappleKick:
    LDA.W $0D30 
    BEQ .return 
    LDA.B $8F 
    BIT.W $09B4 
    BEQ .return 
    LDA.W $0D26 
    BNE .nonZeroAngularVelocity 
    STZ.W $0D2E 

.return:
    RTS 


.nonZeroAngularVelocity:
    BMI .antiClockwise 
    LDA.W $0CF4 
    BEQ .notLiquidPhysics 
    BIT.W #$0001 
    BEQ .notLiquidPhysics 
    LDA.W GrappleSwingConstants_ExtraAngularVelocity_GrappleKick 
    LSR A 
    STA.W $0D2E 
    RTS 


.notLiquidPhysics:
    LDA.W GrappleSwingConstants_ExtraAngularVelocity_GrappleKick : STA.W $0D2E 
    RTS 


.antiClockwise:
    LDA.W $0CF4 
    BEQ ..notLiquidPhysics 
    BIT.W #$0001 
    BEQ ..notLiquidPhysics 
    LDA.W GrappleSwingConstants_ExtraAngularVelocity_GrappleKick 
    LSR A 
    EOR.W #$FFFF 
    INC A 
    STA.W $0D2E 
    RTS 


..notLiquidPhysics:
    LDA.W GrappleSwingConstants_ExtraAngularVelocity_GrappleKick 
    EOR.W #$FFFF 
    INC A 
    STA.W $0D2E 
    RTS 


SetSamusAnimationFrameAndPositionDuringGrappleSwinging:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W $0D26 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + CMP.W #$0040 
    BMI .slowGrapple 
    LDA.W #$0001 : STA.W $0CF8 
    BRA .setSwingingAnimationFrame 


.slowGrapple:
    STZ.W $0CF8 
    LDA.W $0CFA 
    AND.W #$FF00 
    CMP.W #$8000 
    BNE .setSwingingAnimationFrame 
    LDA.W $0A96 
    CMP.W #$0040 
    BPL .straightDown 
    LDA.W #$0008 : STA.W $0A94 
    LDA.W #$0040 : STA.W $0A96 

.straightDown:
    LDA.W $0CFD 
    AND.W #$00FF 
    TAX 
    LDA.W GrappleSwingSamusXYOffsets,X 
    AND.W #$00FF 
    BRA .merge 


.setSwingingAnimationFrame:
    LDA.W #$000F : STA.W $0A94 
    LDA.W $0CFD 
    AND.W #$00FF 
    TAX 
    LDA.W GrappleSwingSamusXYOffsets,X 
    AND.W #$00FF 
    STA.W $0A96 

.merge:
    ASL A 
    TAX 
    LDA.W $0D2E 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + AND.W #$FF00 
    CMP.W #$0100 
    BNE .notGrappleKicking 
    LDA.W $0A96 
    CMP.W #$0040 
    BMI .grappleKicking 
    LDA.W #$0010 

.grappleKicking:
    CLC 
    ADC.W #$0020 
    STA.W $0A96 

.notGrappleKicking:
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .right 
    LDA.W GrappleSwingSamusXYOffsets_Right-1,X 
    AND.W #$FF00 
    XBA 
    BPL + 
    ORA.W #$FF00 

  + CLC 
    ADC.W $0D16 
    STA.W $0AF6 
    LDA.W GrappleSwingSamusXYOffsets_Right,X 
    AND.W #$FF00 
    XBA 
    BPL + 
    ORA.W #$FF00 

  + CLC 
    ADC.W $0D18 
    STA.W $0AFA 
    LDA.W $0D16 : STA.W $0D1A 
    LDA.W $0D18 : STA.W $0D1C 
    JSR.W ClampScrollingSpeed 
    PLB 
    PLP 
    RTL 


.right:
    LDA.W GrappleSwingSamusXYOffsets_Left-1,X 
    AND.W #$FF00 
    XBA 
    BPL + 
    ORA.W #$FF00 

  + CLC 
    ADC.W $0D16 
    STA.W $0AF6 
    LDA.W GrappleSwingSamusXYOffsets_Left,X 
    AND.W #$FF00 
    XBA 
    BPL + 
    ORA.W #$FF00 

  + CLC 
    ADC.W $0D18 
    STA.W $0AFA 
    LDA.W $0D16 : STA.W $0D1A 
    LDA.W $0D18 : STA.W $0D1C 
    JSR.W ClampScrollingSpeed 
    PLB 
    PLP 
    RTL 


ClampScrollingSpeed:
    LDA.W $0AF6 
    SEC 
    SBC.W $0B10 
    BMI + 
    CMP.W #$000D 
    BMI .previousY 
    LDA.W $0AF6 
    SEC 
    SBC.W #$000C 
    STA.W $0B10 
    BRA .previousY 


  + CMP.W #$FFF4 
    BPL .previousY 
    LDA.W $0AF6 
    CLC 
    ADC.W #$000C 
    STA.W $0B10 

.previousY:
    LDA.W $0AFA 
    SEC 
    SBC.W $0B14 
    BMI + 
    CMP.W #$000D 
    BMI .return 
    LDA.W $0AFA 
    SEC 
    SBC.W #$000C 
    STA.W $0B14 
    BRA .return 


  + CMP.W #$FFF4 
    BPL .return 
    LDA.W $0AFA 
    CLC 
    ADC.W #$000C 
    STA.W $0B14 

.return:
    RTS 


SetSamusAnimationFrameAndPositionForConnectingGrapple_Stuck:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W $0D34 
    ASL A 
    TAX 
    LDA.W $0D16 
    SEC 
    SBC.W GrappleBeamFireOffsets_NotRunning_OriginX,X 
    STA.W $0AF6 
    CLC 
    ADC.W GrappleBeamFireOffsets_NotRunning_FlareX,X 
    STA.W $0D1A 
    LDA.W $0D18 
    SEC 
    SBC.W GrappleBeamFireOffsets_NotRunning_OriginY,X 
    STA.W $0AFA 
    CLC 
    ADC.W GrappleBeamFireOffsets_NotRunning_FlareY,X 
    STA.W $0D1C 
    PLB 
    PLP 
    RTL 


UpdateGrappleBeamStartPositionDuringGrappleFire:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W $0A1C 
    ASL #3
    TAX 
    LDA.L PoseDefinitions_YOffset,X 
    AND.W #$00FF 
    STA.B $16 
    LDA.W $0D34 
    ASL A 
    TAX 
    LDA.W $0A1C 
    CMP.W #$0049 
    BEQ .moonwalking 
    CMP.W #$004A 
    BEQ .moonwalking 
    LDA.W $0A1F 
    AND.W #$00FF 
    CMP.W #$0001 
    BEQ .running 

.moonwalking:
    LDA.W $0AF6 
    PHA 
    CLC 
    ADC.W GrappleBeamFireOffsets_NotRunning_OriginX,X 
    STA.W $0D16 
    PLA 
    CLC 
    ADC.W GrappleBeamFireOffsets_NotRunning_FlareX,X 
    STA.W $0D1A 
    LDA.W $0AFA 
    SEC 
    SBC.B $16 
    PHA 
    CLC 
    ADC.W GrappleBeamFireOffsets_NotRunning_OriginY,X 
    STA.W $0D18 
    PLA 
    CLC 
    ADC.W GrappleBeamFireOffsets_NotRunning_FlareY,X 
    STA.W $0D1C 
    BRA .return 


.running:
    LDA.W $0AF6 
    PHA 
    CLC 
    ADC.W GrappleBeamFireOffsets_Running_OriginX,X 
    STA.W $0D16 
    PLA 
    CLC 
    ADC.W GrappleBeamFireOffsets_Running_FlareX,X 
    STA.W $0D1A 
    LDA.W $0AFA 
    SEC 
    SBC.B $16 
    PHA 
    CLC 
    ADC.W GrappleBeamFireOffsets_Running_OriginY,X 
    STA.W $0D18 
    PLA 
    CLC 
    ADC.W GrappleBeamFireOffsets_Running_FlareY,X 
    STA.W $0D1C 

.return:
    PLB 
    PLP 
    RTL 


UpdateGrappleBeamTiles_IncrementFlareCounter:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    JSR.W UpdateGrappleBeamTiles 
    LDA.W $0CD0 
    CMP.W #$0078 
    BPL .return 
    INC A 
    STA.W $0CD0 

.return:
    PLB 
    PLP 
    RTL 


UpdateGrappleBeamTiles:
    LDA.W $0D3E 
    DEC A 
    STA.W $0D3E 
    BPL .timerNotExpired 
    LDA.W #$0005 : STA.W $0D3E 
    LDA.W $0D40 
    CLC 
    ADC.W #$0200 
    STA.W $0D40 
    CMP.W GrappleBeamStartTilesBeginEndPointers_1 
    BMI .timerNotExpired 
    LDA.W GrappleBeamStartTilesBeginEndPointers_0 : STA.W $0D40 

.timerNotExpired:
    LDX.W $0330 
    LDA.W #$0020 : STA.B $D0,X 
    INX #2
    LDA.W $0D40 : STA.B $D0,X 
    INX #2
    SEP #$20 
    LDA.B #$9A : STA.B $D0,X 
    REP #$20 
    INX 
    LDA.W #$6200 : STA.B $D0,X 
    INX #2
    STX.W $0330 
    LDA.W $0CFA 
    AND.W #$FF00 
    XBA 
    LSR A 
    AND.W #$00FE 
    TAY 
    LDX.W $0330 
    LDA.W #$0080 : STA.B $D0,X 
    INX #2
    LDA.W GrappleBeamTilesPointers,Y : STA.B $D0,X 
    INX #2
    SEP #$20 
    LDA.B #$9A : STA.B $D0,X 
    REP #$20 
    INX 
    LDA.W #$6210 : STA.B $D0,X 
    INX #2
    STX.W $0330 
    RTS 


HandleGrappleBeamFlare:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W $0CD0 
    BNE .nonZeroCounter 
    PLB 
    PLP 
    RTL 


.nonZeroCounter:
    CMP.W #$0001 
    BNE .greaterThan1 
    LDA.W #$0010 : STA.W $0CD6 
    LDA.W #$0003 : STA.W $0CDC 

.greaterThan1:
    LDA.W $0CDC 
    DEC A 
    STA.W $0CDC 
    BPL .positive 
    LDA.W $0CD6 
    INC A 
    STA.W $0CD6 
    TAX 
    LDA.L FlareAnimationDelays_MainFlare,X 
    AND.W #$00FF 
    CMP.W #$00FE 
    BEQ .frameFE 
    BRA .setAnimationTimer 


.frameFE:
    INX 
    LDA.L FlareAnimationDelays_MainFlare,X 
    AND.W #$00FF 
    STA.B $12 
    LDA.W $0CD6 
    SEC 
    SBC.B $12 
    STA.W $0CD6 
    TAX 

.setAnimationTimer:
    LDA.L FlareAnimationDelays_MainFlare,X 
    AND.W #$00FF 
    STA.W $0CDC 

.positive:
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingLeft 
    LDA.L FlareSpritemapTable_IndexOffsets_facingRight 
    CLC 
    ADC.W $0CD6 
    STA.B $16 
    BRA + 


.facingLeft:
    LDA.L FlareSpritemapTable_IndexOffsets_facingLeft 
    CLC 
    ADC.W $0CD6 
    STA.B $16 

  + LDA.W $0D1A 
    SEC 
    SBC.W $0911 
    STA.B $14 
    LDA.W $0D1C 
    SEC 
    SBC.W $0915 
    STA.B $12 
    AND.W #$FF00 
    BNE + 
    LDA.B $16 
    JSL.L AddSpritemapFrom_93A1A1_TableToOAM 
    BRA .return 


  + LDA.B $16 
    JSL.L RTL_818AB7 

.return:
    PLB 
    PLP 
    RTL 

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
GrappleBeamFireVelocityTable_X: 
; Grapple beam extension X velocity * 100h (must be multiple of 4)
    dw $0000,$087C,$0BF4,$087C,$0000,$0000,$F784,$F40C,$F784,$0000

GrappleBeamFireVelocityTable_Y: 
; Grapple beam extension X velocity * 100h (must be multiple of 4)
    dw $F40C,$F784,$0000,$087C,$0BF4,$0BF4,$087C,$0000,$F784,$F40C

if !FEATURE_KEEP_UNREFERENCED
UNUSED_9BC103:
    db $80 
endif ; !FEATURE_KEEP_UNREFERENCED

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

GrappleSwingSamusXYOffsets_Left:
    db $00,$F1, $07,$F2, $0C,$F5, $12,$F6, $16,$FA, $1A,$02, $1D,$05, $1F,$0A 
    db $1F,$11, $1E,$16, $1B,$1B, $1A,$1F, $15,$26, $10,$29, $10,$2C, $08,$2E 
    db $00,$2F, $F9,$2E, $F4,$2B, $EE,$2A, $EA,$26, $E6,$1E, $E3,$1B, $E1,$16 
    db $E1,$0F, $E2,$0A, $E5,$05, $E6,$01, $EB,$FA, $F0,$F7, $F0,$F4, $F8,$F2 

GrappleSwingSamusXYOffsets_Right:
    db $00,$F2, $09,$F3, $10,$F6, $12,$F8, $15,$FB, $1A,$02, $1C,$06, $1E,$0A 
    db $1E,$10, $1E,$17, $1B,$1C, $1A,$21, $15,$25, $10,$29, $0B,$2B, $05,$2D 
    db $00,$2E, $F7,$2D, $F0,$2A, $EE,$28, $EB,$25, $E6,$1E, $E4,$1A, $E2,$16 
    db $E1,$0F, $E2,$09, $E5,$04, $E6,$FF, $EB,$FB, $F0,$F7, $F5,$F5, $FB,$F3 

GrappleBeamStartTilesBeginEndPointers_0:
    dw Tiles_GrappleBeam_Horizontal_Beam 

GrappleBeamStartTilesBeginEndPointers_1:
    dw Tiles_GrappleBeam_Diagonal_Beam 

GrappleBeamTilesPointers:
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

; Indexed by [direction grapple is fired] * 4.
ConnectingToGrappleBlockPointerTable_Default:
  .next ; Next grapple beam function
    dw GrappleBeamFunction_Connected_Swinging 
  .function ; Function to execute
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
  .next
    dw GrappleBeamFunction_Connected_Swinging 
  .function
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
  .next
    dw GrappleBeamFunction_Connected_Swinging 
  .function
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


GrappleBeamSpecialAngles:
;        __________________________ Angle. Unit pi/8000h radians
;       |      ____________________ Samus pose
;       |     |      ______________ X offset
;       |     |     |      ________ Y offset
;       |     |     |     |
  .angle 
    dw $D680                                                             
  .pose 
    dw       $00B6                                                             
  .XOffset 
    dw             $FFE2                                                             
  .YOffset 
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
UNUSED_9BC48E:
    db $20,$3A 
endif ; !FEATURE_KEEP_UNREFERENCED

GrappleBeamHandler:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W $0CF6 
    BEQ + 
    DEC A 
    STA.W $0CF6 

  + LDA.W $0A64 
    AND.W #$FFFE 
    STA.W $0A64 
    JSR.W CancelGrappleBeamIfInIncompatiblePose 
    PEA.W .manualReturn-1 
    JMP.W ($0D32) 


.manualReturn:
    LDA.W $0D32 
    CMP.W #GrappleBeamFunction_Inactive 
    BEQ .clearLiquidPhysics 
    CMP.W #GrappleBeamFunction_HitNothing_Cancel 
    BPL .clearLiquidPhysics 
    LDA.W $0A74 
    BIT.W #$0004 
    BNE .clearLiquidPhysics 
    LDA.W $196E 
    BEQ .clearLiquidPhysics 
    JSL.L Get_Samus_BottomTop_Boundary 
    LDA.W $195E 
    BMI .clearLiquidPhysics 
    CMP.B $12 
    BPL .clearLiquidPhysics 
    LDA.W $0CF4 
    ORA.W #$0001 
    STA.W $0CF4 
    PLB 
    PLP 
    RTL 


.clearLiquidPhysics:
    LDA.W $0CF4 
    AND.W #$FFFE 
    STA.W $0CF4 
    PLB 
    PLP 
    RTL 


GrappleBeamFunction_Inactive:
    LDA.B $8F 
    BIT.W $09B2 
    BNE GrappleBeamFunction_Fire_GotoCancel 
    LDA.W $0E00 
    BIT.W $09B2 
    BNE GrappleBeamFunction_Fire_GotoCancel 
    LDA.W $0CD0 
    BEQ .return 
    STZ.W $0CD0 
    STZ.W $0CD6 
    STZ.W $0CD8 
    STZ.W $0CDA 
    STZ.W $0CDC 
    STZ.W $0CDE 
    STZ.W $0CE0 
    JSL.L LoadSamusSuitPalette 

.return:
    RTS 


GrappleBeamFunction_Fire_GotoCancel:
    LDA.W $0A1C 
    CMP.W #$00F0 
    BEQ .draygon 
    CMP.W #$00BE 
    BEQ .draygon 
    ASL #3
    TAX 
    LDA.L PoseDefinitions_YOffset,X 
    AND.W #$00FF 
    STA.B $16 
    LDA.L PoseDefinitions_directionShotsFired,X 
    AND.W #$00FF 
    BIT.W #$00F0 
    BEQ .fire 

.cancel:
    LDA.W #GrappleBeamFunction_HitNothing_Cancel : STA.W $0D32 
    RTS 


.draygon:
    JSR.W GetDirectionGrappleIsFiredWhenHeldByDraygon 
    BCC .cancel 

.fire:
    STA.W $0D34 
    ASL A 
    TAX 
    LDA.W GrappleBeamFireVelocityTable_X,X : STA.W $0D22 
    LDA.W GrappleBeamFireVelocityTable_Y,X : STA.W $0D24 
    LDA.W GrappleBeamFireAngles,X : STA.W $0CFA 
    STA.W $0CFC 
    LDA.W #$000A : STA.W $0CF6 
    LDA.W $0A1C 
    CMP.W #$0049 
    BEQ .moonwalkingNotRunning 
    CMP.W #$004A 
    BEQ .moonwalkingNotRunning 
    LDA.W $0A1F 
    AND.W #$00FF 
    CMP.W #$0001 
    BEQ .running 

.moonwalkingNotRunning:
    LDA.W GrappleBeamFireOffsets_NotRunning_OriginX,X : STA.W $0D02 
    LDA.W GrappleBeamFireOffsets_NotRunning_OriginY,X 
    SEC 
    SBC.B $16 
    STA.W $0D04 
    LDA.W $0AF6 
    PHA 
    CLC 
    ADC.W GrappleBeamFireOffsets_NotRunning_OriginX,X 
    STA.W $0D08 
    STA.W $0D16 
    PLA 
    CLC 
    ADC.W GrappleBeamFireOffsets_NotRunning_FlareX,X 
    STA.W $0D1A 
    LDA.W $0AFA 
    SEC 
    SBC.B $16 
    PHA 
    CLC 
    ADC.W GrappleBeamFireOffsets_NotRunning_OriginY,X 
    STA.W $0D0C 
    STA.W $0D18 
    PLA 
    CLC 
    ADC.W GrappleBeamFireOffsets_NotRunning_FlareY,X 
    STA.W $0D1C 
    BRA .merge 


.running:
    LDA.W GrappleBeamFireOffsets_Running_OriginX,X : STA.W $0D02 
    LDA.W GrappleBeamFireOffsets_Running_OriginY,X 
    SEC 
    SBC.B $16 
    STA.W $0D04 
    LDA.W $0AF6 
    PHA 
    CLC 
    ADC.W GrappleBeamFireOffsets_Running_OriginX,X 
    STA.W $0D08 
    STA.W $0D16 
    PLA 
    CLC 
    ADC.W GrappleBeamFireOffsets_Running_FlareX,X 
    STA.W $0D1A 
    LDA.W $0AFA 
    SEC 
    SBC.B $16 
    PHA 
    CLC 
    ADC.W GrappleBeamFireOffsets_Running_OriginY,X 
    STA.W $0D0C 
    STA.W $0D18 
    PLA 
    CLC 
    ADC.W GrappleBeamFireOffsets_Running_FlareY,X 
    STA.W $0D1C 

.merge:
    STZ.W $0D06 
    STZ.W $0D0A 
    STZ.W $0D0E 
    STZ.W $0D10 
    STZ.W $0D12 
    STZ.W $0D14 
    STZ.W $0CF4 
    LDA.W #$000C : STA.W $0D00 
    STZ.W $0CFE 
    STZ.W $0D26 
    STZ.W $0D28 
    STZ.W $0D2A 
    STZ.W $0D2C 
    STZ.W $0D2E 
    STZ.W $0D30 
    STZ.W $0D1E 
    STZ.W $0D20 
    LDA.W #$0002 : STA.W $0D3A 
    STZ.W $0D3C 
    LDA.W #$0005 : STA.W $0D3E 
    LDA.W GrappleBeamStartTilesBeginEndPointers_0 : STA.W $0D40 
    STZ.W $0D82 
    STZ.W $0D84 
    STZ.W $0D86 
    STZ.W $0D88 
    STZ.W $0D8A 
    STZ.W $0D8C 
    STZ.W $0D8E 
    STZ.W $0D90 
    STZ.W $0D38 
    STZ.W $0D36 
    STZ.W $0CF8 
    JSL.L InitializeGrappleSegmentAnimations 
    LDA.W #SamusDrawingHandler_FiringGrappleBeam : STA.W $0A5C 
    STZ.W $0A9E 
    LDA.W #$0002 
    JSL.L Load_Beam_Palette_External 
    LDA.W #$7F91 : STA.L $7EC1BE 
    LDA.W #GrappleBeamFunction_Firing : STA.W $0D32 
    LDA.W #$0005 
    JSL.L QueueSound_Lib1_Max1 
    LDA.W #$0001 : STA.W $0CD0 
    STZ.W $0DC0 
    LDA.W $0A58 
    CMP.W #SamusMovementHandler_ReleasedFromGrappleSwing 
    BNE .return 
    LDA.W #SamusMovementHandler_Normal : STA.W $0A58 

.return:
    RTS 


GetDirectionGrappleIsFiredWhenHeldByDraygon:
    CMP.W #$00BE 
    BEQ facingLeft 
    LDA.W #$0006 : STA.B $16 
    LDA.B $8B 
    BIT.W #$0100 
    BEQ .right 
    BIT.W #$0400 
    BNE .downRight 
    BIT.W #$0800 
    BNE .upRight 

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


facingLeft:
    LDA.W #$0006 : STA.B $16 
    LDA.B $8B 
    BIT.W #$0200 
    BEQ .left 
    BIT.W #$0400 
    BNE .downLeft 
    BIT.W #$0800 
    BNE .upLeft 

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
    CLC 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


GrappleBeamFunction_Firing:
    LDA.B $8B 
    BIT.W $09B2 
    BNE .firing 

.cancel:
    LDA.W #GrappleBeamFunction_HitNothing_Cancel : STA.W $0D32 
    RTS 


.firing:
    JSR.W RTS_9BB8D4 
    LDA.W $0CFE 
    CLC 
    ADC.W $0D00 
    STA.W $0CFE 
    CMP.W #$0080 
    BMI .enemyCollisionCheck 

.gotoCancel:
    BRA .cancel ; >.<


.enemyCollisionCheck:
    JSL.L EnemyGrappleBeamCollisionDetection 
    JSR.W ProcessEnemyGrappleBeamCollisionResult 
    BCC .blockCollisionCheck 
    TAY 
    BNE .gotoCancel 
    BRA .connected 


.blockCollisionCheck:
    JSL.L GrappleBeamBlockCollisionDetection 
    BCC .return 
    BVC .gotoCancel 

.connected:
    LDA.W #$0006 
    JSL.L QueueSound_Lib1_Max6 
    JSR.W HandleConnectingGrapple 
    LDA.W #$0008 
    EOR.W #$FFFF 
    INC A 
    STA.W $0D00 
    LDA.W $0A64 
    ORA.W #$0001 
    STA.W $0A64 

.return:
    RTS 


UNUSED_GrappleBeamFunction_Unfiring_9BC759:
    LDA.B $8B 
    BIT.W $09B2 
    BNE .firing 

.cancel:
    LDA.W #GrappleBeamFunction_HitNothing_Cancel : STA.W $0D32 
    RTS 


.firing:
    JSR.W RTS_9BB8D4 
    LDA.W $0CFE 
    SEC 
    SBC.W $0D00 
    STA.W $0CFE 
    CMP.W #$000D 
    BMI .cancel 
    JSL.L GrappleBeamBlockCollisionDetection 
    RTS 


GrappleBeamFunction_Connected_LockedInPlace:
    LDA.B $8B 
    BIT.W $09B2 
    BNE .firing 

.cancel:
    LDA.W #GrappleBeamFunction_HitNothing_Cancel : STA.W $0D32 
    RTS 


.firing:
    JSL.L EnemyGrappleBeamCollisionDetection 
    TAY 
    BNE .returnCarryClear 
    JSR.W CheckIfGrappleIsConnectedToBlock 
    BCC .cancel 

.returnCarryClear:
    JSL.L CLCRTL_94AF0B 
    RTS 


GrappleBeamFunction_Connected_Swinging:
    LDA.B $8B 
    BIT.W $09B2 
    BNE .firing 

.cancel:
    LDA.W $0D26 
    BNE .propelSamus 
    LDA.W $0CFA 
    CMP.W #$8000 
    BNE .propelSamus 
    LDA.W #GrappleBeamFunction_Dropped : STA.W $0D32 
    RTS 


.propelSamus:
    JSR.W PropelSamusFromGrappleSwing 
    LDA.W #GrappleBeamFunction_ReleasedFromSwing : STA.W $0D32 
    LDA.W #SamusMovementHandler_ReleasedFromGrappleSwing : STA.W $0A58 
    RTS 


.firing:
    JSR.W HandleGrappleDpadInput 
    LDA.W $0D00 
    BEQ .handleSwinging 
    JSL.L HandleGrappleBeamLengthChange 

.handleSwinging:
    JSR.W DetermineGrappleSwingAngularAccelerationDueToAngleOfSwing 
    JSR.W UpdateGrappleSwingAngularVelocity 
    JSR.W HandleGrappleKick 
    JSL.L HandleGrappleBeamSwingingMovement 
    LDA.W $0D36 
    BPL .enemyCollision 
    JSR.W HandleSpecialGrappleBeamAngles 
    BCC .enemyCollision 
    JSL.L CLCRTL_94AF0B 
    RTS 


.enemyCollision:
    JSL.L EnemyGrappleBeamCollisionDetection 
    TAY 
    BEQ .blockCollision 
    LDA.W $0CF4 
    ORA.W #$8000 
    STA.W $0CF4 
    BRA + 


.blockCollision:
    JSR.W CheckIfGrappleIsConnectedToBlock 
    BCC .cancel 

  + JSL.L UpdateGrappleBeamStartPositionDuringGrappleSwinging 
    JSL.L CLCRTL_94AF0B 
    JSL.L SetSamusAnimationFrameAndPositionDuringGrappleSwinging 
    RTS 


GrappleBeamFunction_WallGrab:
    LDA.B $8B 
    BIT.W $09B2 
    BNE .firing 

.cancel:
    LDA.W #$001E : STA.W $0A9E 
    LDA.W #GrappleBeamFunction_WallGrabRelease : STA.W $0D32 
    RTS 


.firing:
    JSR.W CheckIfGrappleIsConnectedToBlock 
    BCC .cancel 
    JSL.L CLCRTL_94AF0B 
    RTS 


GrappleBeamFunction_WallGrabRelease:
    LDA.W $0A9E 
    DEC A 
    STA.W $0A9E 
    BPL .timerNotExpired 
    LDA.W #GrappleBeamFunction_Dropped : STA.W $0D32 
    RTS 


.timerNotExpired:
    LDA.W #$0010 : STA.B $12 
    STZ.B $14 
    JSL.L Grapple_WallJump_Check 
    BCC .return 
    LDA.W #GrappleBeamFunction_WallJumping : STA.W $0D32 

.return:
    RTS 


GrappleBeamFunction_HitNothing_Cancel:
    LDA.W #$0007 
    JSL.L QueueSound 
    LDA.W $0A1F 
    AND.W #$00FF 
    CMP.W #$0016 
    BNE .notGrappling 
    JSL.L HandleTransitionTableLookupFailure 
    BRA + 


.notGrappling:
    LDA.W #$001C 
    JSL.L Run_Samus_Command 

  + STZ.W $0D1E 
    STZ.W $0D20 
    STZ.W $0D34 
    STZ.W $0D36 
    STZ.W $0A9E 
    STZ.W $0CF8 
    STZ.W $0CF6 
    STZ.W $0CF4 
    STZ.W $0CD0 
    STZ.W $0CD6 
    STZ.W $0CD8 
    STZ.W $0CDA 
    STZ.W $0CDC 
    STZ.W $0CDE 
    STZ.W $0CE0 
    LDA.W $09A6 
    JSL.L Load_Beam_Palette_External 
    LDA.W #GrappleBeamFunction_Inactive : STA.W $0D32 
    LDA.W #SamusDrawingHandler_Default : STA.W $0A5C 
    JSL.L PostGrappleCollisionDetection 
    LDA.W $0A04 
    BEQ .return 
    STZ.W $09D2 
    STZ.W $0A04 

.return:
    RTS 


GrappleBeamFunction_Dropped:
    LDA.W #$0007 
    JSL.L QueueSound 
    LDA.W $0A1C 
    CMP.W #$00B2 
    BEQ .clockwise 
    CMP.W #$00B3 
    BEQ .antiClockwise 
    BRA .notSwinging 


.cancel:
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .antiClockwise 

.clockwise:
    LDA.W #$0001 : STA.W $0A2C 
    BRA .merge 


.antiClockwise:
    LDA.W #$0002 : STA.W $0A2C 
    BRA .merge 


.notSwinging:
    LDA.W $0B00 
    CMP.W #$0011 
    BMI .crouching 
    LDA.W $0A1C 
    ASL #3
    TAX 
    LDA.L PoseDefinitions_directionShotsFired,X 
    AND.W #$00FF 
    TAX 
    BIT.W #$00F0 
    BNE .cancel 
    LDA.W .standingPoses,X 
    AND.W #$00FF 
    STA.W $0A2C 
    BRA .merge 


.crouching:
    LDA.W $0A1C 
    ASL #3
    TAX 
    LDA.L PoseDefinitions_directionShotsFired,X 
    AND.W #$00FF 
    TAX 
    BIT.W #$00F0 
    BNE .checkDirection 
    LDA.W .crouchingPoses,X 
    AND.W #$00FF 
    STA.W $0A2C 
    BRA .merge 


.checkDirection:
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingLeft 
    LDA.W #$0027 : STA.W $0A2C 
    BRA .merge 


.facingLeft:
    LDA.W #$0028 : STA.W $0A2C 

.merge:
    STZ.W $0A32 
    LDA.W #$0001 : STA.W $0DC6 
    STZ.W $0B46 
    STZ.W $0B48 
    STZ.W $0B2C 
    STZ.W $0B2E 
    STZ.W $0D1E 
    STZ.W $0D20 
    STZ.W $0D34 
    STZ.W $0D36 
    STZ.W $0A9E 
    STZ.W $0CF8 
    STZ.W $0CF6 
    STZ.W $0CF4 
    STZ.W $0CD0 
    STZ.W $0CD6 
    STZ.W $0CD8 
    STZ.W $0CDA 
    STZ.W $0CDC 
    STZ.W $0CDE 
    STZ.W $0CE0 
    LDA.W $09A6 
    JSL.L Load_Beam_Palette_External 
    LDA.W #GrappleBeamFunction_Inactive : STA.W $0D32 
    LDA.W #SamusDrawingHandler_Default : STA.W $0A5C 
    JSL.L PostGrappleCollisionDetection 
    LDA.W $0A04 
    BEQ .return 
    STZ.W $09D2 
    STZ.W $0A04 

.return:
    RTS 


.standingPoses:
    db $03,$05,$01,$07,$01,$02,$08,$02,$06,$04 

.crouchingPoses:
    db $85,$71,$27,$73,$27,$28,$74,$28,$72,$86 

GrappleBeamFunction_WallJumping:
    LDA.W #$0007 
    JSL.L QueueSound 
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0008 
    BEQ .right 
    LDA.W #$0083 : STA.W $0A2C 
    BRA + 


.right:
    LDA.W #$0084 : STA.W $0A2C 

  + LDA.W #$0006 : STA.W $0A32 
    STZ.W $0B4A 
    STZ.W $0DCE 
    STZ.W $0B22 
    STZ.W $0B1A 
    STZ.W $0B2A 
    STZ.W $0B2C 
    STZ.W $0B2E 
    STZ.W $0B36 
    STZ.W $0B38 
    STZ.W $0B46 
    STZ.W $0B48 
    STZ.W $0D1E 
    STZ.W $0D20 
    STZ.W $0D34 
    STZ.W $0D36 
    STZ.W $0A9E 
    STZ.W $0CF8 
    STZ.W $0CF6 
    STZ.W $0CF4 
    STZ.W $0CD0 
    STZ.W $0CD6 
    STZ.W $0CD8 
    STZ.W $0CDA 
    STZ.W $0CDC 
    STZ.W $0CDE 
    STZ.W $0CE0 
    LDA.W $09A6 
    JSL.L Load_Beam_Palette_External 
    LDA.W #GrappleBeamFunction_Inactive : STA.W $0D32 
    LDA.W #SamusDrawingHandler_Default : STA.W $0A5C 
    JSL.L PostGrappleCollisionDetection 
    LDA.W $0A04 
    BEQ .return 
    STZ.W $09D2 
    STZ.W $0A04 

.return:
    RTS 


PropelSamusFromGrappleSwing:
    LDA.W $0D26 
    BMI .negativeVelocity 
    JMP.W .positive 


.negativeVelocity:
    EOR.W #$FFFF 
    INC A 
    ASL A 
    TAY 
    LDA.W $0CFA 
    XBA 
    AND.W #$00FF 
    ASL A 
    TAX 
    LDA.L SineCosineTables_8bitSine_SignExtended,X 
    BMI .negativeAngle 
    PHY 
    JSL.L A_Y_16bit_UnsignedMultiplication 
    PLY 
    LDA.W $05F1 : STA.W $0B2C 
    LDA.W $05F3 : STA.W $0B2E 
    LDA.W #$0001 : STA.W $0B36 
    BRA .decelerating 


.negativeAngle:
    EOR.W #$FFFF 
    INC A 
    PHY 
    JSL.L A_Y_16bit_UnsignedMultiplication 
    PLY 
    LDA.W $05F1 : STA.W $0B2C 
    LDA.W $05F3 : STA.W $0B2E 
    LDA.W #$0002 : STA.W $0B36 

.decelerating:
    LDA.W #$0002 : STA.W $0B4A 
    TYA 
    LSR A 
    XBA 
    AND.W #$00FF 
    STA.B $12 
    ASL A 
    CLC 
    ADC.B $12 
    STA.B $12 
    LDA.W #$0040 
    SEC 
    SBC.B $12 
    STA.B $12 
    LDA.W $0CFA 
    XBA 
    AND.W #$00FF 
    SEC 
    SBC.B $12 
    AND.W #$00FF 
    ASL A 
    TAX 
    LDA.L SineCosineTables_8bitSine_SignExtended,X 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + JSL.L A_Y_16bit_UnsignedMultiplication 
    LDA.W $05F1 : STA.W $0B48 
    LDA.W $05F3 : STA.W $0B46 
    RTS 


.positive:
    ASL A 
    TAY 
    LDA.W $0CFA 
    XBA 
    AND.W #$00FF 
    ASL A 
    TAX 
    LDA.L SineCosineTables_8bitSine_SignExtended,X 
    BPL + 
    EOR.W #$FFFF 
    INC A 
    PHY 
    JSL.L A_Y_16bit_UnsignedMultiplication 
    PLY 
    LDA.W $05F1 : STA.W $0B2C 
    LDA.W $05F3 : STA.W $0B2E 
    LDA.W #$0001 : STA.W $0B36 
    BRA ..decelerating 


  + PHY 
    JSL.L A_Y_16bit_UnsignedMultiplication 
    PLY 
    LDA.W $05F1 : STA.W $0B2C 
    LDA.W $05F3 : STA.W $0B2E 
    LDA.W #$0002 : STA.W $0B36 

..decelerating:
    LDA.W #$0002 : STA.W $0B4A 
    TYA 
    LSR A 
    XBA 
    AND.W #$00FF 
    STA.B $12 
    ASL A 
    CLC 
    ADC.B $12 
    STA.B $12 
    LDA.W #$0040 
    SEC 
    SBC.B $12 
    STA.B $12 
    LDA.W $0CFA 
    XBA 
    AND.W #$00FF 
    SEC 
    SBC.B $12 
    AND.W #$00FF 
    ASL A 
    TAX 
    LDA.L SineCosineTables_8bitSine_SignExtended,X 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + JSL.L A_Y_16bit_UnsignedMultiplication 
    LDA.W $05F1 : STA.W $0B48 
    LDA.W $05F3 : STA.W $0B46 
    RTS 


GrappleBeamFunction_ReleasedFromSwing:
    LDA.W #$0007 
    JSL.L QueueSound 
    LDA.W $0D26 
    BPL .facingLeft 
    LDA.W #$0051 : STA.W $0A2C 
    BRA + 


.facingLeft:
    LDA.W #$0052 : STA.W $0A2C 

  + LDA.W #$0007 : STA.W $0A32 
    STZ.W $0D1E 
    STZ.W $0D20 
    STZ.W $0D34 
    STZ.W $0D36 
    STZ.W $0A9E 
    STZ.W $0CF8 
    STZ.W $0CF6 
    STZ.W $0CF4 
    STZ.W $0CD0 
    STZ.W $0CD6 
    STZ.W $0CD8 
    STZ.W $0CDA 
    STZ.W $0CDC 
    STZ.W $0CDE 
    STZ.W $0CE0 
    LDA.W $09A6 
    JSL.L Load_Beam_Palette_External 
    LDA.W #GrappleBeamFunction_Inactive : STA.W $0D32 
    LDA.W #SamusDrawingHandler_Default : STA.W $0A5C 
    JSL.L PostGrappleCollisionDetection 
    LDA.W $0A04 
    BEQ .return 
    STZ.W $09D2 
    STZ.W $0A04 

.return:
    RTS 


Freespace_Bank9B_CBFB: 
; $1405 bytes


warnpc $9BE000
ORG $9BE000

SamusTiles_Top_Set8_Entry0:
incbin "../data/SamusTiles_Top_Set8_Entry0.bin" ; $20 bytes

SamusTiles_Top_Set8_Entry1:
incbin "../data/SamusTiles_Top_Set8_Entry1.bin" ; $20 bytes

SamusTiles_Top_Set8_Entry2:
incbin "../data/SamusTiles_Top_Set8_Entry2.bin" ; $120 bytes

SamusTiles_Top_Set8_Entry3:
incbin "../data/SamusTiles_Top_Set8_Entry3.bin" ; $E0 bytes

SamusTiles_Top_Set8_Entry4:
incbin "../data/SamusTiles_Top_Set8_Entry4.bin" ; $160 bytes

SamusTiles_Top_Set8_Entry5:
incbin "../data/SamusTiles_Top_Set8_Entry5.bin" ; $1E0 bytes

SamusTiles_Top_Set8_Entry6:
incbin "../data/SamusTiles_Top_Set8_Entry6.bin" ; $100 bytes

SamusTiles_Top_Set8_Entry7:
incbin "../data/SamusTiles_Top_Set8_Entry7.bin" ; $140 bytes

SamusTiles_Top_Set8_Entry8:
incbin "../data/SamusTiles_Top_Set8_Entry8.bin" ; $160 bytes

SamusTiles_Top_Set8_Entry9:
incbin "../data/SamusTiles_Top_Set8_Entry9.bin" ; $E0 bytes

SamusTiles_Bottom_Set8_Entry0:
incbin "../data/SamusTiles_Bottom_Set8_Entry0.bin" ; $200 bytes

SamusTiles_Bottom_Set8_Entry1:
incbin "../data/SamusTiles_Bottom_Set8_Entry1.bin" ; $200 bytes

SamusTiles_Bottom_Set8_Entry2:
incbin "../data/SamusTiles_Bottom_Set8_Entry2.bin" ; $20 bytes

SamusTiles_Top_Set9_Entry0:
incbin "../data/SamusTiles_Top_Set9_Entry0.bin" ; $C0 bytes

SamusTiles_Top_Set9_Entry1:
incbin "../data/SamusTiles_Top_Set9_Entry1.bin" ; $C0 bytes

SamusTiles_Top_Set9_Entry2:
incbin "../data/SamusTiles_Top_Set9_Entry2.bin" ; $E0 bytes

SamusTiles_Top_Set9_Entry3:
incbin "../data/SamusTiles_Top_Set9_Entry3.bin" ; $100 bytes

SamusTiles_Top_Set9_Entry4:
incbin "../data/SamusTiles_Top_Set9_Entry4.bin" ; $C0 bytes

SamusTiles_Top_Set9_Entry5:
incbin "../data/SamusTiles_Top_Set9_Entry5.bin" ; $E0 bytes

SamusTiles_Top_Set9_Entry6:
incbin "../data/SamusTiles_Top_Set9_Entry6.bin" ; $100 bytes

SamusTiles_Top_Set9_Entry7:
incbin "../data/SamusTiles_Top_Set9_Entry7.bin" ; $100 bytes

SamusTiles_Top_Set9_Entry8:
incbin "../data/SamusTiles_Top_Set9_Entry8.bin" ; $120 bytes

SamusTiles_Top_Set9_Entry9:
incbin "../data/SamusTiles_Top_Set9_Entry9.bin" ; $120 bytes

SamusTiles_Top_Set9_EntryA:
incbin "../data/SamusTiles_Top_Set9_EntryA.bin" ; $100 bytes

SamusTiles_Top_Set9_EntryB:
incbin "../data/SamusTiles_Top_Set9_EntryB.bin" ; $140 bytes

SamusTiles_Top_Set9_EntryC:
incbin "../data/SamusTiles_Top_Set9_EntryC.bin" ; $E0 bytes

SamusTiles_Top_Set9_EntryD:
incbin "../data/SamusTiles_Top_Set9_EntryD.bin" ; $140 bytes

SamusTiles_Top_Set9_EntryE:
incbin "../data/SamusTiles_Top_Set9_EntryE.bin" ; $C0 bytes

SamusTiles_Top_Set9_EntryF:
incbin "../data/SamusTiles_Top_Set9_EntryF.bin" ; $100 bytes

Freespace_Bank9B_FDA0: 
; $260 bytes
