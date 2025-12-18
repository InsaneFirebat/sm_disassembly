
; Grapple, Samus graphics

org $9B8000


;;; $8000: Tiles - Samus death sequence ;;;
Tiles_SamusDeathSequence:
incbin "../data/Tiles_SamusDeathSequence.bin" ; $1400 bytes


;;; $9400: Samus palettes ;;;
SamusPalettes_PowerSuit:
    dw $3800,$0108,$03BD,$1405,$3BE0,$21A8,$579F,$4AD2                   ;9B9400;
    dw $3A4E,$00BB,$02B5,$016B,$0252,$1104,$0074,$000D                   ;9B9410;

SamusPalettes_DeathSequence_YellowFlash:
    dw $03FF,$03FF,$03FF,$03FF,$03FF,$03FF,$03FF,$03FF                   ;9B9420;
    dw $03FF,$03FF,$03FF,$03FF,$03FF,$03FF,$03FF,$03FF                   ;9B9430;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusPalettes_9B9440:
    dw $3800,$02FF,$0217,$0150,$0089,$00BB,$3A9F,$2A19                   ;9B9440;
    dw $1DB4,$114F,$090B,$3BE0,$033F,$021B,$010E,$0074                   ;9B9450;

UNUSED_SamusPalettes_9B9460:
    dw $3800,$1B1F,$1A78,$19D3,$192D,$155B,$46DF,$3A7A                   ;9B9460;
    dw $2E16,$25D2,$1D8E,$5FE0,$13BF,$129B,$0192,$00F8                   ;9B9470;

UNUSED_SamusPalettes_9B9480:
    dw $3800,$3B5F,$3AFA,$3A77,$3A13,$21BB,$573F,$4EFB                   ;9B9480;
    dw $4AB9,$4276,$3E54,$6FE8,$13FF,$231B,$0216,$017C                   ;9B9490;

UNUSED_SamusPalettes_9B94A0:
    dw $3800,$5B9F,$5B7C,$5B3B,$5AF8,$365B,$6B7F,$677D                   ;9B94A0;
    dw $635B,$5F3A,$5B19,$7FF4,$53FF,$339F,$333F,$2A9F                   ;9B94B0;

UNUSED_SamusPalettes_9B94C0:
    dw $3800,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;9B94C0;
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;9B94D0;

UNUSED_SamusPalettes_9B94E0:
    dw $7D00,$7D00,$7D00,$7D00,$7D00,$7D00,$7D00,$7D00                   ;9B94E0;
    dw $7D00,$7D00,$7D00,$7D00,$7D00,$7D00,$7D00,$7D00                   ;9B94F0;

UNUSED_SamusPalettes_9B9500:
; Used by unused routine UNUSED_SetSamusPaletteToSolidWhite_91DD4C, test palette perhaps
    dw $3800,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;9B9500;
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;9B9510;
endif ; !FEATURE_KEEP_UNREFERENCED

SamusPalettes_VariaSuit:
    dw $0000,$0108,$02FF,$1405,$3BE0,$21A8,$579F,$4AD2                   ;9B9520;
    dw $3A4E,$00BB,$01BE,$008E,$0252,$1104,$0074,$000D                   ;9B9530;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusPalettes_9B9540:
    dw $14E0,$00CE,$421F,$1405,$3BE0,$21A8,$579F,$4AD2                   ;9B9540;
    dw $3A4E,$00BB,$5914,$30AA,$0216,$1104,$0074,$000D                   ;9B9550;

UNUSED_SamusPalettes_9B9560:
    dw $2003,$28CE,$6E1F,$3C05,$63E0,$49A8,$7F9F,$72D2                   ;9B9560;
    dw $624E,$28BB,$7D14,$58AA,$2A16,$3904,$2874,$280D                   ;9B9570;

UNUSED_SamusPalettes_9B9580:
    dw $2003,$516E,$7EBF,$64A5,$7FE0,$7248,$7FFF,$7F72                   ;9B9580;
    dw $7EEE,$555B,$7DB4,$7D4A,$52B6,$61A4,$5114,$50AD                   ;9B9590;

UNUSED_SamusPalettes_9B95A0:
    dw $0000,$52AE,$7FFF,$65E5,$7FE0,$7388,$7FFF,$7FF2                   ;9B95A0;
    dw $7FEE,$569B,$7EF4,$7E8A,$53F6,$62E4,$5254,$51ED                   ;9B95B0;

UNUSED_SamusPalettes_9B95C0:
    dw $3800,$00CE,$421F,$1405,$3BE0,$21A8,$579F,$4AD2                   ;9B95C0;
    dw $3A4E,$00BB,$5914,$30AA,$0216,$1104,$0074,$000D                   ;9B95D0;

UNUSED_SamusPalettes_9B95E0:
    dw $3800,$1618,$575F,$294F,$4FEA,$36F2,$6BFF,$5FFC                   ;9B95E0;
    dw $4798,$15FF,$6E5E,$45F4,$175F,$264E,$15BE,$1557                   ;9B95F0;

UNUSED_SamusPalettes_9B9600:
    dw $3800,$02DE,$43FF,$1615,$3BF0,$23B8,$57FF,$4BFF                   ;9B9600;
    dw $3BFE,$02BF,$5B1F,$32BA,$03FF,$1314,$027F,$021D                   ;9B9610;

UNUSED_SamusPalettes_9B9620:
    dw $3800,$2BFF,$6BFF,$3F5F,$63FA,$4BFF,$7FFF,$73FF                   ;9B9620;
    dw $63FF,$2BFF,$7FFF,$5BFF,$2BFF,$3BFE,$2BBF,$2B5F                   ;9B9630;

UNUSED_SamusPalettes_9B9640:
    dw $3800,$00CE,$421F,$1405,$3BE0,$21A8,$579F,$4AD2                   ;9B9640;
    dw $3A4E,$00BB,$5914,$30AA,$0216,$1104,$0074,$000D                   ;9B9650;

UNUSED_SamusPalettes_9B9660:
    dw $3800,$020E,$435F,$1545,$43E0,$22E8,$57FF,$4BF2                   ;9B9660;
    dw $3B8E,$01FB,$5A54,$31EA,$0356,$1244,$01B4,$014D                   ;9B9670;

UNUSED_SamusPalettes_9B9680:
    dw $3800,$034E,$43FF,$1685,$4FE0,$23E8,$57FF,$4BF2                   ;9B9680;
    dw $3BEE,$033B,$5B94,$332A,$03F6,$1384,$02F4,$028D                   ;9B9690;

UNUSED_SamusPalettes_9B96A0:
    dw $3800,$2BEE,$6BFF,$3FC5,$63E0,$4BE8,$7FFF,$73F2                   ;9B96A0;
    dw $63EE,$2BFB,$7FF4,$5BEA,$2BF6,$3BE4,$2BF4,$2BED                   ;9B96B0;
endif ; !FEATURE_KEEP_UNREFERENCED

SamusPalettes_CrystalFlash_0:
; Crystal flash Samus. Colours 0..9 = Samus colours, Ah..Fh = bubble colours
; These two parts are loaded independently / asynchronously
    dw $3800,$4210,$4210,$4210,$4210,$4210,$4210,$4210                   ;9B96C0;
    dw $4210,$4210                                                       ;9B96D0;

SamusPalettes_CrystalFlash_0_bubble:
    dw $7FFF,$7BDF,$77BF,$6F7F,$6B5F,$673F                               ;9B96D4;

SamusPalettes_CrystalFlash_1:
    dw $3800,$4E73,$4E73,$4E73,$4E73,$4E73,$4E73,$4E73                   ;9B96E0;
    dw $4E73,$4E73                                                       ;9B96F0;

SamusPalettes_CrystalFlash_1_bubble:
    dw $673F,$7FFF,$7BDF,$77BF,$6F7F,$6B5F                               ;9B96F4;

SamusPalettes_CrystalFlash_2:
    dw $3800,$5EF7,$5EF7,$5EF7,$5EF7,$5EF7,$5EF7,$5EF7                   ;9B9700;
    dw $5EF7,$5EF7                                                       ;9B9710;

SamusPalettes_CrystalFlash_2_bubble:
    dw $6B5F,$673F,$7FFF,$7BDF,$77BF,$6F7F                               ;9B9714;

SamusPalettes_CrystalFlash_3:
    dw $3800,$6F7B,$6F7B,$6F7B,$6F7B,$6F7B,$6F7B,$6F7B                   ;9B9720;
    dw $6F7B,$6F7B                                                       ;9B9730;

SamusPalettes_CrystalFlash_3_bubble:
    dw $6F7F,$6B5F,$673F,$7FFF,$7BDF,$77BF                               ;9B9734;

SamusPalettes_CrystalFlash_4:
    dw $3800,$5EF7,$5EF7,$5EF7,$5EF7,$5EF7,$5EF7,$5EF7                   ;9B9740;
    dw $5EF7,$5EF7                                                       ;9B9750;

SamusPalettes_CrystalFlash_4_bubble:
    dw $77BF,$6F7F,$6B5F,$673F,$7FFF,$7BDF                               ;9B9754;

SamusPalettes_CrystalFlash_5:
    dw $3800,$4E73,$4E73,$4E73,$4E73,$4E73,$4E73,$4E73                   ;9B9760;
    dw $4E73,$4E73                                                       ;9B9770;

SamusPalettes_CrystalFlash_5_bubble:
    dw $7FFF,$77BF,$6F7F,$6B5F,$673F,$7FFF                               ;9B9774;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusPalettes_9B9780:
    dw $0000,$00CE,$421F,$1405,$3BE0,$21A8,$579F,$4AD2                   ;9B9780;
    dw $3A4E,$00BB,$5914,$30AA,$0216,$1104,$0074,$000D                   ;9B9790;

UNUSED_SamusPalettes_9B97A0:
    dw $0000,$21D6,$56BF,$28AA,$4FE5,$364D,$63BF,$5B36                   ;9B97A0;
    dw $52D4,$155C,$65B8,$454F,$16B9,$25A9,$1518,$14B2                   ;9B97B0;

UNUSED_SamusPalettes_9B97C0:
    dw $0000,$2E39,$6B5F,$4170,$67EB,$4F13,$73DF,$6F9B                   ;9B97C0;
    dw $6779,$2E1E,$727B,$5E15,$2F5C,$3E6F,$2DDB,$2D78                   ;9B97D0;

UNUSED_SamusPalettes_9B97E0:
    dw $0000,$42DE,$7FFF,$5615,$7BF0,$63B8,$7FFF,$7FFF                   ;9B97E0;
    dw $7BFE,$42BF,$7F1F,$72BA,$43FF,$5314,$427F,$421D                   ;9B97F0;
endif ; !FEATURE_KEEP_UNREFERENCED

SamusPalettes_GravitySuit:
    dw $3800,$0108,$421F,$1405,$3BE0,$21A8,$579F,$4AD2                   ;9B9800;
    dw $3A4E,$00BB,$5914,$30AA,$0274,$1104,$0074,$000D                   ;9B9810;

SamusPalettes_PowerSuit_DeathSequence_BeamCharging_0:
; Power suit - death sequence (eight frames) / beam charging (first four frames)
    dw $0000,$0108,$03BD,$1405,$3BE0,$21A8,$579F,$4AD2                   ;9B9820;
    dw $3A4E,$00BB,$02B5,$016B,$0252,$1104,$0074,$000D                   ;9B9830;

SamusPalettes_PowerSuit_DeathSequence_BeamCharging_1:
    dw $0C63,$0D4A,$0FBD,$2068,$43E3,$29EA,$5B9F,$4EF3                   ;9B9840;
    dw $4270,$0D1B,$0ED6,$0DAD,$0E73,$1D47,$0CD5,$0C6F                   ;9B9850;

SamusPalettes_PowerSuit_DeathSequence_BeamCharging_2:
    dw $1CE7,$1DAD,$1FBD,$2CEB,$4BE7,$362D,$5F9F,$5715                   ;9B9860;
    dw $4AB2,$1D7C,$1EF7,$1E10,$1EB5,$29AA,$1D56,$1CF1                   ;9B9870;

SamusPalettes_PowerSuit_DeathSequence_BeamCharging_3:
    dw $2D6B,$2E10,$2FBD,$396E,$53EB,$4270,$63BF,$5B36                   ;9B9880;
    dw $52D4,$2DDC,$2F18,$2E52,$2ED6,$3A0E,$2DB8,$2D73                   ;9B9890;

SamusPalettes_PowerSuit_DeathSequence_4:
    dw $3DEF,$3E73,$3FDE,$49F2,$5BEF,$4ED3,$6BBF,$6358                   ;9B98A0;
    dw $5B16,$3E5D,$3F5A,$3EB5,$3F18,$4671,$3E39,$3DF6                   ;9B98B0;

SamusPalettes_PowerSuit_DeathSequence_5:
    dw $4E73,$4ED6,$4FDE,$5675,$63F3,$5B16,$6FBF,$6B7A                   ;9B98C0;
    dw $6358,$4EBD,$4F7B,$4EF7,$4F5A,$52D4,$4E9A,$4E78                   ;9B98D0;

SamusPalettes_PowerSuit_DeathSequence_6:
    dw $5EF7,$5F39,$5FDE,$62F8,$6BF7,$6759,$73DF,$6F9B                   ;9B98E0;
    dw $6B7A,$5F1E,$5F9C,$5F5A,$5F7B,$6338,$5F1C,$5EFA                   ;9B98F0;

SamusPalettes_PowerSuit_DeathSequence_7:
    dw $6F7B,$6F9C,$6FDE,$6F7B,$73FB,$739C,$77DF,$77BD                   ;9B9900;
    dw $73BC,$6F7E,$6FBD,$6F9C,$6FBD,$6F9B,$6F7D,$6F7C                   ;9B9910;

SamusPalettes_VariaSuit_DeathSequence_BeamCharging_0:
; Varia suit - death sequence (eight frames) / beam charging (first four frames)
    dw $0000,$0108,$02FF,$1405,$3BE0,$21A8,$579F,$4AD2                   ;9B9920;
    dw $3A4E,$00BB,$01BE,$008E,$0252,$1104,$0074,$000D                   ;9B9930;

SamusPalettes_VariaSuit_DeathSequence_BeamCharging_1:
    dw $0C63,$0D4A,$0F1F,$2068,$43E3,$29EA,$5B9F,$4EF3                   ;9B9940;
    dw $4270,$0D1B,$0DFE,$0CF0,$0E73,$1D47,$0CD5,$0C6F                   ;9B9950;

SamusPalettes_VariaSuit_DeathSequence_BeamCharging_2:
    dw $1CE7,$1DAD,$1F3F,$2CEB,$4BE7,$362D,$5F9F,$5715                   ;9B9960;
    dw $4AB2,$1D7C,$1E3E,$1D52,$1EB5,$29AA,$1D56,$1CF1                   ;9B9970;

SamusPalettes_VariaSuit_DeathSequence_BeamCharging_3:
    dw $2D6B,$2E10,$2F5F,$396E,$53EB,$4270,$63BF,$5B36                   ;9B9980;
    dw $52D4,$2DDC,$2E7E,$2DD4,$2ED6,$3A0E,$2DB8,$2D73                   ;9B9990;

SamusPalettes_VariaSuit_DeathSequence_4:
    dw $3DEF,$3E73,$3F7F,$49F2,$5BEF,$4ED3,$6BBF,$6358                   ;9B99A0;
    dw $5B16,$3E5D,$3EDE,$3E36,$3F18,$4671,$3E39,$3DF6                   ;9B99B0;

SamusPalettes_VariaSuit_DeathSequence_5:
    dw $4E73,$4ED6,$4F9F,$5675,$63F3,$5B16,$6FBF,$6B7A                   ;9B99C0;
    dw $6358,$4EBD,$4F1E,$4E98,$4F5A,$52D4,$4E9A,$4E78                   ;9B99D0;

SamusPalettes_VariaSuit_DeathSequence_6:
    dw $5EF7,$5F39,$5FBF,$62F8,$6BF7,$6759,$73DF,$6F9B                   ;9B99E0;
    dw $6B7A,$5F1E,$5F5E,$5F1A,$5F7B,$6338,$5F1C,$5EFA                   ;9B99F0;

SamusPalettes_VariaSuit_DeathSequence_7:
    dw $6F7B,$6F9C,$6FDF,$6F7B,$73FB,$739C,$77DF,$77BD                   ;9B9A00;
    dw $73BC,$6F7E,$6F9E,$6F7C,$6FBD,$6F9B,$6F7D,$6F7C                   ;9B9A10;

SamusPalettes_GravitySuit_DeathSequence_BeamCharging_0:
; Gravity suit - death sequence (eight frames) / beam charging (first four frames)
    dw $14E0,$00CE,$421F,$1405,$3BE0,$21A8,$579F,$4AD2                   ;9B9A20;
    dw $3A4E,$00BB,$5914,$30AA,$0216,$1104,$0074,$000D                   ;9B9A30;

SamusPalettes_GravitySuit_DeathSequence_BeamCharging_1:
    dw $2143,$0D30,$463F,$2068,$43E3,$29EA,$5B9F,$4EF3                   ;9B9A40;
    dw $4270,$0D1B,$5D55,$390C,$0E37,$1D47,$0CD5,$0C6F                   ;9B9A50;

SamusPalettes_GravitySuit_DeathSequence_BeamCharging_2:
    dw $2DA7,$1D92,$4E7F,$2CEB,$4BE7,$362D,$5F9F,$5715                   ;9B9A60;
    dw $4AB2,$1D7C,$61B6,$416F,$1E78,$29AA,$1D56,$1CF1                   ;9B9A70;

SamusPalettes_GravitySuit_DeathSequence_BeamCharging_3:
    dw $3A0B,$2DF4,$56BF,$396E,$53EB,$4270,$63BF,$5B36                   ;9B9A80;
    dw $52D4,$2DDC,$6618,$4DD1,$2EB9,$3A0E,$2DB8,$2D73                   ;9B9A90;

SamusPalettes_GravitySuit_DeathSequence_4:
    dw $4A6F,$3E56,$5EFF,$49F2,$5BEF,$4ED3,$6BBF,$6358                   ;9B9AA0;
    dw $5B16,$3E5D,$6A79,$5654,$3EFA,$4671,$3E39,$3DF6                   ;9B9AB0;

SamusPalettes_GravitySuit_DeathSequence_5:
    dw $56D3,$4EB8,$673F,$5675,$63F3,$5B16,$6FBF,$6B7A                   ;9B9AC0;
    dw $6358,$4EBD,$6EDA,$5EB7,$4F3B,$52D4,$4E9A,$4E78                   ;9B9AD0;

SamusPalettes_GravitySuit_DeathSequence_6:
    dw $6337,$5F1A,$6F7F,$62F8,$6BF7,$6759,$73DF,$6F9B                   ;9B9AE0;
    dw $6B7A,$5F1E,$733C,$6B19,$5F7C,$6338,$5F1C,$5EFA                   ;9B9AF0;

SamusPalettes_GravitySuit_DeathSequence_7:
    dw $6F9B,$6F7C,$77BF,$6F7B,$73FB,$739C,$77DF,$77BD                   ;9B9B00;
    dw $73BC,$6F7E,$779D,$737C,$6FBD,$6F9B,$6F7D,$6F7C                   ;9B9B10;

SamusPalettes_PowerSuit_SpeedBoosting_BabyMetroidDrain_0:
; SamusPalettes_PowerSuit_SpeedBoosting_BabyMetroidDrain_3 also used for metroid drain blue
    dw $0000,$0108,$03BD,$1405,$3BE0,$21A8,$579F,$4AD2                   ;9B9B20;
    dw $3A4E,$00BB,$02B5,$016B,$0252,$1104,$0074,$000D                   ;9B9B30;

SamusPalettes_PowerSuit_SpeedBoosting_BabyMetroidDrain_1:
    dw $2003,$28CE,$37BD,$3C05,$63E0,$49A8,$7F9F,$72D2                   ;9B9B40;
    dw $624E,$28BB,$36B5,$356B,$2A16,$3904,$2874,$280D                   ;9B9B50;

SamusPalettes_PowerSuit_SpeedBoosting_BabyMetroidDrain_2:
    dw $2003,$516E,$4BBD,$64A5,$7FE0,$7248,$7FFF,$7F72                   ;9B9B60;
    dw $7EEE,$555B,$4AB5,$496B,$52B6,$61A4,$5114,$50AD                   ;9B9B70;

SamusPalettes_PowerSuit_SpeedBoosting_BabyMetroidDrain_3:
    dw $0000,$52AE,$5FBD,$65E5,$7FE0,$7388,$7FFF,$7FF2                   ;9B9B80;
    dw $7FEE,$569B,$5F55,$5E0B,$53F6,$62E4,$5254,$51ED                   ;9B9B90;

SamusPalettes_PowerSuit_SpeedBoosterShine_0:
    dw $0000,$0108,$03BD,$1405,$3BE0,$21A8,$579F,$4AD2                   ;9B9BA0;
    dw $3A4E,$00BB,$02B5,$016B,$0252,$1104,$0074,$000D                   ;9B9BB0;

SamusPalettes_PowerSuit_SpeedBoosterShine_1:
    dw $0000,$1DAD,$1FBD,$2CEB,$4BE7,$362D,$5F9F,$5715                   ;9B9BC0;
    dw $4AB2,$1D7C,$1EF7,$1E10,$1EB5,$29AA,$1D56,$1CF1                   ;9B9BD0;

SamusPalettes_PowerSuit_SpeedBoosterShine_2:
    dw $0000,$3E73,$3FDE,$49F2,$5BEF,$4ED3,$6BBF,$6358                   ;9B9BE0;
    dw $5B16,$3E5D,$3F5A,$3EB5,$3F18,$4671,$3E39,$3DF6                   ;9B9BF0;

SamusPalettes_PowerSuit_SpeedBoosterShine_3:
    dw $0000,$5F39,$5FDE,$62F8,$6BF7,$6759,$73DF,$6F9B                   ;9B9C00;
    dw $6B7A,$5F1E,$5F9C,$5F5A,$5F7B,$6338,$5F1C,$5EFA                   ;9B9C10;

SamusPalettes_PowerSuit_Shinespark_PseudoScrewAttack_0:
; SamusPalettes_PowerSuit_Shinespark_PseudoScrewAttack_3 also used for power suit pseudo screw attack
    dw $3800,$0108,$03BD,$1405,$3BE0,$21A8,$579F,$4AD2                   ;9B9C20;
    dw $3A4E,$00BB,$02B5,$016B,$0252,$1104,$0074,$000D                   ;9B9C30;

SamusPalettes_PowerSuit_Shinespark_PseudoScrewAttack_1:
    dw $3800,$01AD,$03FF,$294F,$4FEA,$36F2,$6BFF,$5FFC                   ;9B9C40;
    dw $4798,$017C,$0318,$0210,$02B5,$264E,$15BE,$1557                   ;9B9C50;

SamusPalettes_PowerSuit_Shinespark_PseudoScrewAttack_2:
    dw $3800,$0273,$17FF,$1615,$3BF0,$23B8,$57FF,$4BFF                   ;9B9C60;
    dw $3BFE,$025D,$037B,$02B5,$0318,$1314,$027F,$021D                   ;9B9C70;

SamusPalettes_PowerSuit_Shinespark_PseudoScrewAttack_3:
    dw $3800,$0339,$23FF,$3F5F,$63FA,$4BFF,$7FFF,$73FF                   ;9B9C80;
    dw $63FF,$031E,$03DE,$035A,$037B,$3BFE,$2BBF,$2B5F                   ;9B9C90;

SamusPalettes_PowerSuit_ScrewAttack_0:
    dw $3800,$0108,$03BD,$1405,$3BE0,$21A8,$579F,$4AD2                   ;9B9CA0;
    dw $3A4E,$00BB,$02B5,$016B,$0252,$1104,$0074,$000D                   ;9B9CB0;

SamusPalettes_PowerSuit_ScrewAttack_1:
    dw $3800,$01A8,$03F8,$1545,$43E0,$22E8,$57FF,$4BF2                   ;9B9CC0;
    dw $3B8E,$01FB,$0355,$020B,$0356,$1244,$01B4,$014D                   ;9B9CD0;

SamusPalettes_PowerSuit_ScrewAttack_2:
    dw $3800,$0248,$03F3,$1685,$4FE0,$23E8,$57FF,$4BF2                   ;9B9CE0;
    dw $3BEE,$033B,$03F5,$02AB,$03F6,$1384,$02F4,$028D                   ;9B9CF0;

SamusPalettes_PowerSuit_ScrewAttack_3:
    dw $3800,$02E8,$03EE,$3FC5,$63E0,$4BE8,$7FFF,$73F2                   ;9B9D00;
    dw $63EE,$2BFB,$03F0,$034B,$2BF6,$3BE4,$2BF4,$2BED                   ;9B9D10;

SamusPalettes_VariaSuit_SpeedBoosting_BabyMetroidDrain_0:
; SamusPalettes_VariaSuit_SpeedBoosting_BabyMetroidDrain_3 also used for metroid drain blue
    dw $0000,$0108,$02FF,$1405,$3BE0,$21A8,$579F,$4AD2                   ;9B9D20;
    dw $3A4E,$00BB,$01BE,$008E,$0252,$1104,$0074,$000D                   ;9B9D30;

SamusPalettes_VariaSuit_SpeedBoosting_BabyMetroidDrain_1:
    dw $2003,$2908,$2AFF,$3C05,$63E0,$49A8,$7F9F,$72D2                   ;9B9D40;
    dw $624E,$28BB,$29BE,$288E,$2A4D,$3904,$2874,$280D                   ;9B9D50;

SamusPalettes_VariaSuit_SpeedBoosting_BabyMetroidDrain_2:
    dw $2003,$5108,$52FF,$64A5,$7FE0,$7248,$7FFF,$7F72                   ;9B9D60;
    dw $7EEE,$555B,$51BE,$508E,$3E4D,$61A4,$5114,$50AD                   ;9B9D70;

SamusPalettes_VariaSuit_SpeedBoosting_BabyMetroidDrain_3:
    dw $0000,$79A8,$7B9F,$65E5,$7FE0,$7388,$7FFF,$7FF2                   ;9B9D80;
    dw $7FEE,$569B,$765E,$752E,$524D,$62E4,$5254,$51ED                   ;9B9D90;

SamusPalettes_VariaSuit_SpeedBoosterShine_0:
    dw $0000,$0108,$02FF,$1405,$3BE0,$21A8,$579F,$4AD2                   ;9B9DA0;
    dw $3A4E,$00BB,$01BE,$008E,$0252,$1104,$0074,$000D                   ;9B9DB0;

SamusPalettes_VariaSuit_SpeedBoosterShine_1:
    dw $0000,$1DAD,$1F3F,$2CEB,$4BE7,$362D,$5F9F,$5715                   ;9B9DC0;
    dw $4AB2,$1D7C,$1E3E,$1D52,$1EB5,$29AA,$1D56,$1CF1                   ;9B9DD0;

SamusPalettes_VariaSuit_SpeedBoosterShine_2:
    dw $0000,$3E73,$3F7F,$49F2,$5BEF,$4ED3,$6BBF,$6358                   ;9B9DE0;
    dw $5B16,$3E5D,$3EDE,$3E36,$3F18,$4671,$3E39,$3DF6                   ;9B9DF0;

SamusPalettes_VariaSuit_SpeedBoosterShine_3:
    dw $0000,$5F39,$5FBF,$62F8,$6BF7,$6759,$73DF,$6F9B                   ;9B9E00;
    dw $6B7A,$5F1E,$5F5E,$5F1A,$5F7B,$6338,$5F1C,$5EFA                   ;9B9E10;

SamusPalettes_VariaSuit_Shinespark_PseudoScrewAttack_0:
; SamusPalettes_VariaSuit_Shinespark_PseudoScrewAttack_3 also used for varia suit pseudo screw attack
    dw $3800,$0108,$02FF,$1405,$3BE0,$21A8,$579F,$4AD2                   ;9B9E20;
    dw $3A4E,$00BB,$01BE,$008E,$0252,$1104,$0074,$000D                   ;9B9E30;

SamusPalettes_VariaSuit_Shinespark_PseudoScrewAttack_1:
    dw $3800,$01AD,$039F,$294F,$4FEA,$36F2,$6BFF,$5FFC                   ;9B9E40;
    dw $4798,$15FF,$025E,$0133,$02F7,$264E,$15BE,$1557                   ;9B9E50;

SamusPalettes_VariaSuit_Shinespark_PseudoScrewAttack_2:
    dw $3800,$0252,$03FF,$1615,$3BF0,$23B8,$57FF,$4BFF                   ;9B9E60;
    dw $3BFE,$02BF,$02FE,$01D8,$039C,$1314,$027F,$021D                   ;9B9E70;

SamusPalettes_VariaSuit_Shinespark_PseudoScrewAttack_3:
    dw $3800,$02F7,$17FF,$3F5F,$63FA,$4BFF,$7FFF,$73FF                   ;9B9E80;
    dw $63FF,$2BFF,$039E,$027D,$03FF,$3BFE,$2BBF,$2B5F                   ;9B9E90;

SamusPalettes_VariaSuit_ScrewAttack_0:
    dw $3800,$0108,$02FF,$1405,$3BE0,$21A8,$579F,$4AD2                   ;9B9EA0;
    dw $3A4E,$00BB,$01BE,$008E,$0252,$1104,$0074,$000D                   ;9B9EB0;

SamusPalettes_VariaSuit_ScrewAttack_1:
    dw $3800,$01A8,$039F,$1545,$43E0,$22E8,$57FF,$4BF2                   ;9B9EC0;
    dw $3B8E,$01FB,$025E,$012E,$02F2,$1244,$01B4,$014D                   ;9B9ED0;

SamusPalettes_VariaSuit_ScrewAttack_2:
    dw $3800,$0248,$039A,$1685,$4FE0,$23E8,$57FF,$4BF2                   ;9B9EE0;
    dw $3BEE,$033B,$02FE,$01CE,$0392,$1384,$02F4,$028D                   ;9B9EF0;

SamusPalettes_VariaSuit_ScrewAttack_3:
    dw $3800,$02E8,$0394,$3FC5,$63E0,$4BE8,$7FFF,$73F2                   ;9B9F00;
    dw $63EE,$2BFB,$039E,$026E,$03F2,$3BE4,$2BF4,$2BED                   ;9B9F10;

SamusPalettes_GravitySuit_SpeedBoosting_BabyMetroidDrain_0:
; SamusPalettes_GravitySuit_SpeedBoosting_BabyMetroidDrain_3 also used for metroid drain blue
    dw $14E0,$00CE,$421F,$1405,$3BE0,$21A8,$579F,$4AD2                   ;9B9F20;
    dw $3A4E,$00BB,$5914,$30AA,$0216,$1104,$0074,$000D                   ;9B9F30;

SamusPalettes_GravitySuit_SpeedBoosting_BabyMetroidDrain_1:
    dw $2003,$28CE,$6E1F,$3C05,$63E0,$49A8,$7F9F,$72D2                   ;9B9F40;
    dw $624E,$28BB,$7D14,$58AA,$2A16,$3904,$2874,$280D                   ;9B9F50;

SamusPalettes_GravitySuit_SpeedBoosting_BabyMetroidDrain_2:
    dw $2003,$516E,$7EBF,$64A5,$7FE0,$7248,$7FFF,$7F72                   ;9B9F60;
    dw $7EEE,$555B,$7DB4,$7D4A,$52B6,$61A4,$5114,$50AD                   ;9B9F70;

SamusPalettes_GravitySuit_SpeedBoosting_BabyMetroidDrain_3:
    dw $0000,$52AE,$7FFF,$65E5,$7FE0,$7388,$7FFF,$7FF2                   ;9B9F80;
    dw $7FEE,$569B,$7EF4,$7E8A,$53F6,$62E4,$5254,$51ED                   ;9B9F90;

SamusPalettes_GravitySuit_SpeedBoosterShine_0:
    dw $0000,$00CE,$421F,$1405,$3BE0,$21A8,$579F,$4AD2                   ;9B9FA0;
    dw $3A4E,$00BB,$5914,$30AA,$0216,$1104,$0074,$000D                   ;9B9FB0;

SamusPalettes_GravitySuit_SpeedBoosterShine_1:
    dw $0000,$1D92,$4E7F,$2CEB,$4BE7,$362D,$5F9F,$5715                   ;9B9FC0;
    dw $4AB2,$1D7C,$61B6,$416F,$1E78,$29AA,$1D56,$1CF1                   ;9B9FD0;

SamusPalettes_GravitySuit_SpeedBoosterShine_2:
    dw $0000,$3E56,$5EFF,$49F2,$5BEF,$4ED3,$6BBF,$6358                   ;9B9FE0;
    dw $5B16,$3E5D,$6A79,$5654,$3EFA,$4671,$3E39,$3DF6                   ;9B9FF0;

SamusPalettes_GravitySuit_SpeedBoosterShine_3:
    dw $0000,$5F1A,$6F7F,$62F8,$6BF7,$6759,$73DF,$6F9B                   ;9BA000;
    dw $6B7A,$5F1E,$733C,$6B19,$5F7C,$6338,$5F1C,$5EFA                   ;9BA010;

SamusPalettes_GravitySuit_Shinespark_0:
; SamusPalettes_GravitySuit_Shinespark_3 also used for gravity suit pseudo screw attack
    dw $3800,$00CE,$421F,$1405,$3BE0,$21A8,$579F,$4AD2                   ;9BA020;
    dw $3A4E,$00BB,$5914,$30AA,$0216,$1104,$0074,$000D                   ;9BA030;

SamusPalettes_GravitySuit_Shinespark_1:
    dw $3800,$1618,$575F,$294F,$4FEA,$36F2,$6BFF,$5FFC                   ;9BA040;
    dw $4798,$15FF,$6E5E,$45F4,$175F,$264E,$15BE,$1557                   ;9BA050;

SamusPalettes_GravitySuit_Shinespark_2:
    dw $3800,$02DE,$43FF,$1615,$3BF0,$23B8,$57FF,$4BFF                   ;9BA060;
    dw $3BFE,$02BF,$5B1F,$32BA,$03FF,$1314,$027F,$021D                   ;9BA070;

SamusPalettes_GravitySuit_Shinespark_3:
    dw $3800,$2BFF,$6BFF,$3F5F,$63FA,$4BFF,$7FFF,$73FF                   ;9BA080;
    dw $63FF,$2BFF,$7FFF,$5BFF,$2BFF,$3BFE,$2BBF,$2B5F                   ;9BA090;

SamusPalettes_GravitySuit_ScrewAttack_0:
    dw $3800,$00CE,$421F,$1405,$3BE0,$21A8,$579F,$4AD2                   ;9BA0A0;
    dw $3A4E,$00BB,$5914,$30AA,$0216,$1104,$0074,$000D                   ;9BA0B0;

SamusPalettes_GravitySuit_ScrewAttack_1:
    dw $3800,$020E,$435F,$1545,$43E0,$22E8,$57FF,$4BF2                   ;9BA0C0;
    dw $3B8E,$01FB,$5A54,$31EA,$0356,$1244,$01B4,$014D                   ;9BA0D0;

SamusPalettes_GravitySuit_ScrewAttack_2:
    dw $3800,$034E,$43FF,$1685,$4FE0,$23E8,$57FF,$4BF2                   ;9BA0E0;
    dw $3BEE,$033B,$5B94,$332A,$03F6,$1384,$02F4,$028D                   ;9BA0F0;

SamusPalettes_GravitySuit_ScrewAttack_3:
    dw $3800,$2BEE,$6BFF,$3FC5,$63E0,$4BE8,$7FFF,$73F2                   ;9BA100;
    dw $63EE,$2BFB,$7FF4,$5BEA,$2BF6,$3BE4,$2BF4,$2BED                   ;9BA110;

SamusPalettes_DeathSequence_SuitlessSamus_0:
    dw $21A8,$02FF,$0217,$0150,$0089,$7FFF,$3A9F,$2A19                   ;9BA120;
    dw $1DB4,$114F,$090B,$4E73,$4210,$318C,$2108,$1084                   ;9BA130;

SamusPalettes_DeathSequence_SuitlessSamus_1:
    dw $29EA,$0F1F,$0E38,$0D91,$0CEB,$7FFF,$42BF,$3239                   ;9BA140;
    dw $29F5,$1D91,$154D,$5294,$4631,$39CE,$294A,$1CE7                   ;9BA150;

SamusPalettes_DeathSequence_SuitlessSamus_2:
    dw $362D,$1F3F,$1E79,$1DF3,$1D4E,$7FFF,$4ADF,$3E7A                   ;9BA160;
    dw $3636,$29F3,$25B0,$5AD6,$4E73,$4210,$35AD,$294A                   ;9BA170;

SamusPalettes_DeathSequence_SuitlessSamus_3:
    dw $4270,$2F5F,$2EBA,$2E35,$2DD1,$7FFF,$531F,$46BB                   ;9BA180;
    dw $4278,$3A35,$3212,$5EF7,$56B5,$4E73,$4210,$39CE                   ;9BA190;

SamusPalettes_DeathSequence_SuitlessSamus_4:
    dw $4ED3,$3F7F,$3EFB,$3E97,$3E34,$7FFF,$5B3F,$52FC                   ;9BA1A0;
    dw $4ED9,$4697,$4275,$6739,$5EF7,$56B5,$4E73,$4631                   ;9BA1B0;

SamusPalettes_DeathSequence_SuitlessSamus_5:
    dw $5B16,$4F9F,$4F3C,$4EF9,$4E96,$7FFF,$635F,$5F3C                   ;9BA1C0;
    dw $5B1A,$52F9,$52D7,$6B5A,$6739,$5EF7,$5AD6,$5294                   ;9BA1D0;

SamusPalettes_DeathSequence_SuitlessSamus_6:
    dw $6759,$5FBF,$5F7D,$5F3B,$5F19,$7FFF,$6B9F,$677D                   ;9BA1E0;
    dw $675C,$633B,$5F3A,$739C,$6F7B,$6B5A,$6739,$6318                   ;9BA1F0;

SamusPalettes_DeathSequence_SuitlessSamus_7:
    dw $739C,$6FDF,$6FBE,$6F9D,$6F7C,$7FFF,$73BF,$73BE                   ;9BA200;
    dw $739D,$6F9D,$6F9C,$77BD,$77BD,$739C,$739C,$6F7B                   ;9BA210;

SamusPalettes_DeathSequence_SuitlessSamus_8:
    dw $77BD,$77BD,$77BD,$77BD,$77BD,$77BD,$77BD,$77BD                   ;9BA220;
    dw $77BD,$77BD,$77BD,$77BD,$77BD,$77BD,$77BD,$77BD                   ;9BA230;

SamusPalettes_HyperBeam_0:
    dw $0000,$2119,$319E,$1096,$35BF,$1CF9,$319E,$2D7D                   ;9BA240;
    dw $295B,$253B,$211A,$18D7,$211A,$14B7,$18D8,$1096                   ;9BA250;

SamusPalettes_HyperBeam_1:
    dw $0000,$1639,$2ABE,$09B6,$2EDF,$1619,$2ABE,$26BD                   ;9BA260;
    dw $1E7B,$1E5B,$1A3A,$0DF7,$1A3A,$0DD7,$11F8,$09B6                   ;9BA270;

SamusPalettes_HyperBeam_2:
    dw $0000,$0F39,$23DE,$02D6,$23FF,$0B39,$23DE,$1FBD                   ;9BA280;
    dw $177B,$137B,$135A,$06F7,$135A,$02F7,$0B18,$02D6                   ;9BA290;

SamusPalettes_HyperBeam_3:
    dw $0000,$0F2F,$23D3,$02CB,$23F4,$0B2E,$23D3,$1FB2                   ;9BA2A0;
    dw $1771,$1370,$134F,$06ED,$134F,$02EC,$0B0D,$02CB                   ;9BA2B0;

SamusPalettes_HyperBeam_4:
    dw $0000,$0F23,$23C8,$02C0,$23E8,$0B22,$23C8,$1FA7                   ;9BA2C0;
    dw $1765,$1364,$1344,$06E1,$1344,$02E0,$0B02,$02C0                   ;9BA2D0;

SamusPalettes_HyperBeam_5:
    dw $0000,$3284,$4329,$2221,$4749,$2E83,$4329,$4308                   ;9BA2E0;
    dw $3AC6,$36C5,$32A5,$2A42,$32A5,$2641,$2A63,$2221                   ;9BA2F0;

SamusPalettes_HyperBeam_6:
    dw $0400,$51E5,$6289,$4181,$66AA,$4DE4,$6289,$5E68                   ;9BA300;
    dw $5A27,$5626,$5205,$49A3,$5205,$45A2,$49C3,$4181                   ;9BA310;

SamusPalettes_HyperBeam_7:
    dw $0000,$554D,$69D2,$48CA,$69F2,$512C,$69D2,$65B1                   ;9BA320;
    dw $5D8F,$596E,$594E,$4D0B,$594E,$48EA,$510C,$48CA                   ;9BA330;

SamusPalettes_HyperBeam_8:
    dw $7FFF,$5876,$691A,$4812,$6D1B,$5455,$691A,$68FA                   ;9BA340;
    dw $60B8,$5C97,$5896,$5034,$5896,$4C13,$5054,$4812                   ;9BA350;

SamusPalettes_HyperBeam_9:
    dw $3800,$3CB8,$4D5D,$2C55,$517D,$38B7,$4D5D,$493C                   ;9BA360;
    dw $44FA,$40F9,$3CD9,$3476,$3CD9,$3075,$3497,$2C55                   ;9BA370;

SamusPalettes_HurtFlash:
    dw $0000,$6739,$6F9C,$5EF7,$7BFF,$6739,$77BD,$6F9C                   ;9BA380;
    dw $6B7B,$6B7B,$6B7B,$5F18,$6B7B,$5F18,$6739,$5F18                   ;9BA390;

SamusPalettes_Intro:
; Intro Samus (greyscale)
    dw $3800,$2DAD,$52D6,$1084,$77FF,$2DAD,$677B,$52D6                   ;9BA3A0;
    dw $4252,$4252,$4252,$1908,$4252,$1908,$2DAD,$1908                   ;9BA3B0;

SamusPalettes_Visor:                                                     ;9BA3C0;
    dw $3BE0,$5FF0,$7FFF ; Palette transition when x-ray is widening
    dw $43FF,$2F5A,$1AB5 ; Full x-ray beam, or in room with layer blending configuration = 28h/2Ah (with colour math backdrop)


;;; $A3CC: Set projectile trail position ;;;
SetProjectileTrailPosition:
;; Parameters:
;;     X: Projectile index
;;     Y: Projectile trail index
    PHP                                                                  ;9BA3CC;
    PHB                                                                  ;9BA3CD;
    PHK                                                                  ;9BA3CE;
    PLB                                                                  ;9BA3CF;
    REP #$30                                                             ;9BA3D0;
    JSL.L Get_ProjectileTrailFrame                                       ;9BA3D2;
    LDA.W CeresStatus                                                    ;9BA3D6;
    BPL .notRotatingRoom                                                 ;9BA3D9;
    JSL.L Calculate_ProjectilePosition_InRotatingElevatorRoom            ;9BA3DB;
    LDA.B DP_Temp12                                                      ;9BA3DF;
    PHA                                                                  ;9BA3E1;
    LDA.B DP_Temp14                                                      ;9BA3E2;
    CLC                                                                  ;9BA3E4;
    ADC.W Layer1XPosition                                                ;9BA3E5;
    STA.B DP_Temp12                                                      ;9BA3E8;
    PLA                                                                  ;9BA3EA;
    CLC                                                                  ;9BA3EB;
    ADC.W Layer1YPosition                                                ;9BA3EC;
    STA.B DP_Temp14                                                      ;9BA3EF;
    BRA +                                                                ;9BA3F1;

  .notRotatingRoom:
    LDA.W SamusProjectile_XPositions,X                                   ;9BA3F3;
    STA.B DP_Temp12                                                      ;9BA3F6;
    LDA.W SamusProjectile_YPositions,X                                   ;9BA3F8;
    STA.B DP_Temp14                                                      ;9BA3FB;

+   PHY                                                                  ;9BA3FD;
    LDA.W SamusProjectile_Types,X                                        ;9BA3FE;
    BIT.W #$0020                                                         ;9BA401;
    BNE .SBATrail                                                        ;9BA404;
    BIT.W #$0010                                                         ;9BA406;
    BNE .getOffset                                                       ;9BA409;
    AND.W #$000F                                                         ;9BA40B;
    ASL                                                                  ;9BA40E;
    TAY                                                                  ;9BA40F;
    LDA.W SamusProjectile_Directions,X                                   ;9BA410;
    AND.W #$000F                                                         ;9BA413;
    ASL                                                                  ;9BA416;
    CLC                                                                  ;9BA417;
    ADC.W BeamTrailOffsets_uncharged,Y                                   ;9BA418;
    BRA .merge                                                           ;9BA41B;

  .getOffset:
    AND.W #$000F                                                         ;9BA41D;
    ASL                                                                  ;9BA420;
    TAY                                                                  ;9BA421;
    LDA.W SamusProjectile_Directions,X                                   ;9BA422;
    AND.W #$000F                                                         ;9BA425;
    ASL                                                                  ;9BA428;
    CLC                                                                  ;9BA429;
    ADC.W BeamTrailOffsets_charged,Y                                     ;9BA42A;
    BRA .merge                                                           ;9BA42D;

  .SBATrail:
    AND.W #$000F                                                         ;9BA42F;
    ASL                                                                  ;9BA432;
    TAY                                                                  ;9BA433;
    LDA.W SamusProjectile_Directions,X                                   ;9BA434;
    AND.W #$000F                                                         ;9BA437;
    ASL                                                                  ;9BA43A;
    CLC                                                                  ;9BA43B;
    ADC.W BeamTrailOffsets_spazerSBA,Y                                   ;9BA43C;

  .merge:
    TAY                                                                  ;9BA43F;
    LDA.B DP_Temp16                                                      ;9BA440;
    ASL                                                                  ;9BA442;
    ASL                                                                  ;9BA443;
    CLC                                                                  ;9BA444;
    ADC.W $0000,Y                                                        ;9BA445;
    TAY                                                                  ;9BA448;
    PLX                                                                  ;9BA449;
    LDA.W $0000,Y                                                        ;9BA44A;
    XBA                                                                  ;9BA44D;
    BMI .leftYHighByte                                                   ;9BA44E;
    AND.W #$00FF                                                         ;9BA450;
    BRA +                                                                ;9BA453;

  .leftYHighByte:
    ORA.W #$FF00                                                         ;9BA455;

+   CLC                                                                  ;9BA458;
    ADC.B DP_Temp14                                                      ;9BA459;
    SEC                                                                  ;9BA45B;
    SBC.W #$0004                                                         ;9BA45C;
    STA.L ProjectileTrail_LeftYPosition,X                                ;9BA45F;
    DEY                                                                  ;9BA463;
    LDA.W $0000,Y                                                        ;9BA464;
    XBA                                                                  ;9BA467;
    BMI .leftXHighByte                                                   ;9BA468;
    AND.W #$00FF                                                         ;9BA46A;
    BRA +                                                                ;9BA46D;

  .leftXHighByte:
    ORA.W #$FF00                                                         ;9BA46F;

+   CLC                                                                  ;9BA472;
    ADC.B DP_Temp12                                                      ;9BA473;
    SEC                                                                  ;9BA475;
    SBC.W #$0004                                                         ;9BA476;
    STA.L ProjectileTrail_LeftXPosition,X                                ;9BA479;
    INY                                                                  ;9BA47D;
    LDA.W $0002,Y                                                        ;9BA47E;
    XBA                                                                  ;9BA481;
    BMI .rightYHighByte                                                  ;9BA482;
    AND.W #$00FF                                                         ;9BA484;
    BRA +                                                                ;9BA487;

  .rightYHighByte:
    ORA.W #$FF00                                                         ;9BA489;

+   CLC                                                                  ;9BA48C;
    ADC.B DP_Temp14                                                      ;9BA48D;
    SEC                                                                  ;9BA48F;
    SBC.W #$0004                                                         ;9BA490;
    STA.L ProjectileTrail_RightYPosition,X                               ;9BA493;
    LDA.W $0001,Y                                                        ;9BA497;
    XBA                                                                  ;9BA49A;
    BMI .rightXHighByte                                                  ;9BA49B;
    AND.W #$00FF                                                         ;9BA49D;
    BRA +                                                                ;9BA4A0;

  .rightXHighByte:
    ORA.W #$FF00                                                         ;9BA4A2;

+   CLC                                                                  ;9BA4A5;
    ADC.B DP_Temp12                                                      ;9BA4A6;
    SEC                                                                  ;9BA4A8;
    SBC.W #$0004                                                         ;9BA4A9;
    STA.L ProjectileTrail_RightXPosition,X                               ;9BA4AC;
    PLB                                                                  ;9BA4B0;
    PLP                                                                  ;9BA4B1;
    RTL                                                                  ;9BA4B2;


;;; $A4B3..B3A6: Beam trail offsets ;;;
BeamTrailOffsets_uncharged:
    dw UnchargedBeamTrails_Default                                       ;9BA4B3;
    dw UnchargedBeamTrails_Wave_WaveIce                                  ;9BA4B5;
    dw UnchargedBeamTrails_Default                                       ;9BA4B7;
    dw UnchargedBeamTrails_Wave_WaveIce                                  ;9BA4B9;
    dw UnchargedBeamTrails_Default                                       ;9BA4BB;
    dw UnchargedBeamTrails_Default                                       ;9BA4BD;
    dw UnchargedBeamTrails_IceSpazer                                     ;9BA4BF;
    dw UnchargedBeamTrails_WaveIceSpazer                                 ;9BA4C1;
    dw UnchargedBeamTrails_Default                                       ;9BA4C3;
    dw UnchargedBeamTrails_Default                                       ;9BA4C5;
    dw UnchargedBeamTrails_IcePlasma                                     ;9BA4C7;
    dw UnchargedBeamTrails_WaveIcePlasma                                 ;9BA4C9;

BeamTrailOffsets_charged:
    dw ChargedBeamTrails_Default                                         ;9BA4CB;
    dw ChargedBeamTrails_Wave_WaveIce                                    ;9BA4CD;
    dw ChargedBeamTrails_Default                                         ;9BA4CF;
    dw ChargedBeamTrails_Wave_WaveIce                                    ;9BA4D1;
    dw ChargedBeamTrails_Default                                         ;9BA4D3;
    dw ChargedBeamTrails_Default                                         ;9BA4D5;
    dw ChargedBeamTrails_IceSpazer                                       ;9BA4D7;
    dw ChargedBeamTrails_WaveIceSpazer                                   ;9BA4D9;
    dw ChargedBeamTrails_Default                                         ;9BA4DB;
    dw ChargedBeamTrails_Default                                         ;9BA4DD;
    dw ChargedBeamTrails_IcePlasma                                       ;9BA4DF;
    dw ChargedBeamTrails_WaveIcePlasma                                   ;9BA4E1;

BeamTrailOffsets_spazerSBA:
    dw $0000                                                             ;9BA4E3;
    dw $0000                                                             ;9BA4E5;
    dw $0000                                                             ;9BA4E7;
    dw $0000                                                             ;9BA4E9;
    dw UNSUED_SpazerSBATrail_Spazer_IceSpazer_9BB37B                     ;9BA4EB;
    dw SpazerSBATrail_WaveSpazer                                         ;9BA4ED;
    dw UNSUED_SpazerSBATrail_Spazer_IceSpazer_9BB37B                     ;9BA4EF;
    dw $0000                                                             ;9BA4F1;
    dw $0000                                                             ;9BA4F3;
    dw $0000                                                             ;9BA4F5;


;;; $A4F7: Uncharged beams ;;;
UnchargedBeamTrails_Wave_WaveIce:
    dw UnchargedBeamTrails_Wave_WaveIce_0                                ;9BA4F7;
    dw UnchargedBeamTrails_Wave_WaveIce_2                                ;9BA4F9;
    dw UnchargedBeamTrails_Wave_WaveIce_1                                ;9BA4FB;
    dw UnchargedBeamTrails_Wave_WaveIce_3                                ;9BA4FD;
    dw UnchargedBeamTrails_Wave_WaveIce_0                                ;9BA4FF;
    dw UnchargedBeamTrails_Wave_WaveIce_0                                ;9BA501;
    dw UnchargedBeamTrails_Wave_WaveIce_2                                ;9BA503;
    dw UnchargedBeamTrails_Wave_WaveIce_1                                ;9BA505;
    dw UnchargedBeamTrails_Wave_WaveIce_3                                ;9BA507;
    dw UnchargedBeamTrails_Wave_WaveIce_0                                ;9BA509;

UnchargedBeamTrails_Default:
    dw UnchargedBeamTrails_Default_0                                     ;9BA50B;
    dw UnchargedBeamTrails_Default_0                                     ;9BA50D;
    dw UnchargedBeamTrails_Default_0                                     ;9BA50F;
    dw UnchargedBeamTrails_Default_0                                     ;9BA511;
    dw UnchargedBeamTrails_Default_0                                     ;9BA513;
    dw UnchargedBeamTrails_Default_0                                     ;9BA515;
    dw UnchargedBeamTrails_Default_0                                     ;9BA517;
    dw UnchargedBeamTrails_Default_0                                     ;9BA519;
    dw UnchargedBeamTrails_Default_0                                     ;9BA51B;
    dw UnchargedBeamTrails_Default_0                                     ;9BA51D;

UnchargedBeamTrails_IceSpazer:
    dw UnchargedBeamTrails_IceSpazer_0                                   ;9BA51F;
    dw UnchargedBeamTrails_IceSpazer_2                                   ;9BA521;
    dw UnchargedBeamTrails_IceSpazer_3                                   ;9BA523;
    dw UnchargedBeamTrails_IceSpazer_4                                   ;9BA525;
    dw UnchargedBeamTrails_IceSpazer_1                                   ;9BA527;
    dw UnchargedBeamTrails_IceSpazer_1                                   ;9BA529;
    dw UnchargedBeamTrails_IceSpazer_5                                   ;9BA52B;
    dw UnchargedBeamTrails_IceSpazer_6                                   ;9BA52D;
    dw UnchargedBeamTrails_IceSpazer_7                                   ;9BA52F;
    dw UnchargedBeamTrails_IceSpazer_0                                   ;9BA531;

UnchargedBeamTrails_WaveIceSpazer:
    dw UnchargedBeamTrails_WaveIceSpazer_0                               ;9BA533;
    dw UnchargedBeamTrails_WaveIceSpazer_1                               ;9BA535;
    dw UnchargedBeamTrails_WaveIceSpazer_2                               ;9BA537;
    dw UnchargedBeamTrails_WaveIceSpazer_3                               ;9BA539;
    dw UnchargedBeamTrails_WaveIceSpazer_4                               ;9BA53B;
    dw UnchargedBeamTrails_WaveIceSpazer_4                               ;9BA53D;
    dw UnchargedBeamTrails_WaveIceSpazer_5                               ;9BA53F;
    dw UnchargedBeamTrails_WaveIceSpazer_6                               ;9BA541;
    dw UnchargedBeamTrails_WaveIceSpazer_7                               ;9BA543;
    dw UnchargedBeamTrails_WaveIceSpazer_0                               ;9BA545;

UnchargedBeamTrails_IcePlasma:
    dw UnchargedBeamTrails_IcePlasma_0                                   ;9BA547;
    dw UnchargedBeamTrails_IcePlasma_1                                   ;9BA549;
    dw UnchargedBeamTrails_IcePlasma_2                                   ;9BA54B;
    dw UnchargedBeamTrails_IcePlasma_3                                   ;9BA54D;
    dw UnchargedBeamTrails_IcePlasma_4                                   ;9BA54F;
    dw UnchargedBeamTrails_IcePlasma_4                                   ;9BA551;
    dw UnchargedBeamTrails_IcePlasma_5                                   ;9BA553;
    dw UnchargedBeamTrails_IcePlasma_6                                   ;9BA555;
    dw UnchargedBeamTrails_IcePlasma_7                                   ;9BA557;
    dw UnchargedBeamTrails_IcePlasma_0                                   ;9BA559;

UnchargedBeamTrails_WaveIcePlasma:
    dw UnchargedBeamTrails_WaveIcePlasma_0                               ;9BA55B;
    dw UnchargedBeamTrails_WaveIcePlasma_1                               ;9BA55D;
    dw UnchargedBeamTrails_WaveIcePlasma_2                               ;9BA55F;
    dw UnchargedBeamTrails_WaveIcePlasma_3                               ;9BA561;
    dw UnchargedBeamTrails_WaveIcePlasma_4                               ;9BA563;
    dw UnchargedBeamTrails_WaveIcePlasma_4                               ;9BA565;
    dw UnchargedBeamTrails_WaveIcePlasma_5                               ;9BA567;
    dw UnchargedBeamTrails_WaveIcePlasma_6                               ;9BA569;
    dw UnchargedBeamTrails_WaveIcePlasma_7                               ;9BA56B;
    dw UnchargedBeamTrails_WaveIcePlasma_0                               ;9BA56D;

; Format:
;     x,y,X,Y
;     x: Left trail X offset
;     y: Left trail Y offset
;     X: Right trail X offset
;     Y: Right trail Y offset

; Indexed by [[projectile instruction pointer] - 2] * 4
UnchargedBeamTrails_Default_0:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;9BA56F;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;9BA57F;

UnchargedBeamTrails_Wave_WaveIce_0:
    db $00,$00,$00,$00,$08,$00,$00,$00,$0C,$00,$00,$00,$10,$00,$00,$00   ;9BA58F;
    db $14,$00,$00,$00,$10,$00,$00,$00,$0C,$00,$00,$00,$08,$00,$00,$00   ;9BA59F;
    db $00,$00,$00,$00,$F8,$00,$00,$00,$F4,$00,$00,$00,$F0,$00,$00,$00   ;9BA5AF;
    db $EC,$00,$00,$00,$F0,$00,$00,$00,$F4,$00,$00,$00,$F8,$00,$00,$00   ;9BA5BF;

UnchargedBeamTrails_Wave_WaveIce_1:
    db $00,$00,$00,$00,$00,$F8,$00,$00,$00,$F4,$00,$00,$00,$F0,$00,$00   ;9BA5CF;
    db $00,$EC,$00,$00,$00,$F0,$00,$00,$00,$F4,$00,$00,$00,$F8,$00,$00   ;9BA5DF;
    db $00,$00,$00,$00,$00,$08,$00,$00,$00,$0C,$00,$00,$00,$10,$00,$00   ;9BA5EF;
    db $00,$14,$00,$00,$00,$10,$00,$00,$00,$0C,$00,$00,$00,$08,$00,$00   ;9BA5FF;

UnchargedBeamTrails_Wave_WaveIce_2:
    db $00,$00,$00,$00,$FC,$FC,$00,$00,$F8,$F8,$00,$00,$F6,$F6,$00,$00   ;9BA60F;
    db $F4,$F4,$00,$00,$F6,$F6,$00,$00,$F8,$F8,$00,$00,$FC,$FC,$00,$00   ;9BA61F;
    db $00,$00,$00,$00,$04,$04,$00,$00,$08,$08,$00,$00,$0A,$0A,$00,$00   ;9BA62F;
    db $0C,$0C,$00,$00,$0A,$0A,$00,$00,$08,$08,$00,$00,$04,$04,$00,$00   ;9BA63F;

UnchargedBeamTrails_Wave_WaveIce_3:
    db $00,$00,$00,$00,$04,$FC,$00,$00,$08,$F8,$00,$00,$0A,$F6,$00,$00   ;9BA64F;
    db $0C,$F4,$00,$00,$0A,$F6,$00,$00,$08,$F8,$00,$00,$04,$FC,$00,$00   ;9BA65F;
    db $00,$00,$00,$00,$FC,$04,$00,$00,$F8,$08,$00,$00,$F6,$0A,$00,$00   ;9BA66F;
    db $F4,$0C,$00,$00,$F6,$0A,$00,$00,$F8,$08,$00,$00,$FC,$04,$00,$00   ;9BA67F;

UnchargedBeamTrails_IceSpazer_0:
    db $00,$00,$00,$00,$F8,$08,$08,$08,$F0,$08,$10,$08                   ;9BA68F;

UnchargedBeamTrails_IceSpazer_1:
    db $00,$00,$00,$00,$F8,$F8,$08,$F8,$F0,$F8,$10,$F8                   ;9BA69B;

UnchargedBeamTrails_IceSpazer_2:
    db $F8,$08,$F8,$08,$F2,$02,$FE,$0E,$EC,$FC,$02,$14                   ;9BA6A7;

UnchargedBeamTrails_IceSpazer_3:
    db $F8,$00,$F8,$00,$F8,$F8,$F8,$08,$F8,$F0,$F8,$10                   ;9BA6B3;

UnchargedBeamTrails_IceSpazer_4:
    db $F8,$F8,$F8,$F8,$FE,$F0,$F0,$FE,$04,$EC,$EC,$04                   ;9BA6BF;

UnchargedBeamTrails_IceSpazer_5:
    db $08,$F8,$08,$F8,$0E,$FE,$02,$F2,$14,$04,$FE,$EC                   ;9BA6CB;

UnchargedBeamTrails_IceSpazer_6:
    db $08,$00,$08,$00,$08,$08,$08,$F8,$08,$10,$08,$F0                   ;9BA6D7;

UnchargedBeamTrails_IceSpazer_7:
    db $08,$08,$08,$08,$02,$10,$10,$02,$FC,$14,$14,$FC                   ;9BA6E3;

UnchargedBeamTrails_WaveIceSpazer_0:
    db $00,$00,$00,$00,$FC,$08,$04,$08,$F8,$08,$08,$08,$F4,$08,$0C,$08   ;9BA6EF;
    db $F0,$08,$10,$08,$F0,$08,$10,$08,$F0,$08,$10,$08,$F4,$08,$0C,$08   ;9BA6FF;
    db $F8,$08,$08,$08,$FC,$08,$04,$08                                   ;9BA70F;

UnchargedBeamTrails_WaveIceSpazer_1:
    db $00,$00,$00,$00,$F4,$06,$FA,$0C,$F2,$02,$FE,$0E,$F0,$00,$00,$10   ;9BA717;
    db $EE,$FE,$02,$12,$EC,$FC,$02,$14,$EE,$FE,$02,$12,$F0,$00,$00,$10   ;9BA727;
    db $F2,$02,$FE,$0E,$F4,$06,$FA,$0C                                   ;9BA737;

UnchargedBeamTrails_WaveIceSpazer_2:
    db $00,$00,$00,$00,$F8,$FC,$F8,$04,$F8,$F8,$F8,$08,$F8,$F4,$F8,$0C   ;9BA73F;
    db $F8,$F0,$F8,$10,$F8,$F0,$F8,$10,$F8,$F0,$F8,$10,$F8,$F4,$F8,$0C   ;9BA74F;
    db $F8,$F8,$F8,$08,$F8,$FC,$F8,$04                                   ;9BA75F;

UnchargedBeamTrails_WaveIceSpazer_3:
    db $00,$00,$00,$00,$F4,$FA,$FA,$F4,$FE,$F0,$F0,$FE,$F0,$00,$00,$F0   ;9BA767;
    db $EE,$02,$02,$EE,$04,$EC,$EC,$04,$EE,$02,$02,$EE,$F0,$00,$00,$F0   ;9BA777;
    db $FE,$F0,$F0,$FE,$F4,$FA,$FA,$F4                                   ;9BA787;

UnchargedBeamTrails_WaveIceSpazer_4:
    db $00,$00,$00,$00,$FC,$F8,$04,$F8,$F8,$F8,$08,$F8,$F4,$F8,$0C,$F8   ;9BA78F;
    db $F0,$F8,$10,$F8,$F0,$F8,$10,$F8,$F0,$F8,$10,$F8,$F4,$F8,$0C,$F8   ;9BA79F;
    db $F8,$F8,$08,$F8,$FC,$F8,$04,$F8                                   ;9BA7AF;

UnchargedBeamTrails_WaveIceSpazer_5:
    db $00,$00,$00,$00,$02,$F2,$0E,$FE,$00,$F0,$10,$00,$FE,$EE,$12,$02   ;9BA7B7;
    db $FE,$EC,$14,$04,$FE,$EC,$14,$04,$FE,$EC,$14,$04,$FE,$EE,$12,$02   ;9BA7C7;
    db $00,$F0,$10,$00,$02,$F2,$0E,$FE                                   ;9BA7D7;

UnchargedBeamTrails_WaveIceSpazer_6:
    db $00,$00,$00,$00,$08,$FC,$08,$04,$08,$F8,$08,$08,$08,$F4,$08,$0C   ;9BA7DF;
    db $08,$F0,$08,$10,$08,$F0,$08,$10,$08,$F0,$08,$10,$08,$F4,$08,$0C   ;9BA7EF;
    db $08,$F8,$08,$08,$08,$FC,$08,$04                                   ;9BA7FF;

UnchargedBeamTrails_WaveIceSpazer_7:
    db $00,$00,$00,$00,$06,$0A,$0A,$06,$02,$10,$10,$02,$00,$10,$10,$00   ;9BA807;
    db $FE,$12,$12,$FE,$FC,$14,$14,$FC,$FE,$12,$12,$FE,$00,$10,$10,$00   ;9BA817;
    db $02,$10,$10,$02,$06,$0A,$0A,$06                                   ;9BA827;

UnchargedBeamTrails_IcePlasma_0:
    db $00,$00,$00,$00,$00,$10,$00,$10                                   ;9BA82F;

UnchargedBeamTrails_IcePlasma_1:
    db $00,$00,$00,$00,$F4,$0C,$F4,$0C                                   ;9BA837;

UnchargedBeamTrails_IcePlasma_2:
    db $00,$00,$00,$00,$F0,$00,$F0,$00                                   ;9BA83F;

UnchargedBeamTrails_IcePlasma_3:
    db $00,$00,$00,$00,$F4,$F4,$F4,$F4                                   ;9BA847;

UnchargedBeamTrails_IcePlasma_4:
    db $00,$00,$00,$00,$00,$F0,$00,$F0                                   ;9BA84F;

UnchargedBeamTrails_IcePlasma_5:
    db $00,$00,$00,$00,$0C,$F4,$0C,$F4                                   ;9BA857;

UnchargedBeamTrails_IcePlasma_6:
    db $00,$00,$00,$00,$10,$00,$10,$00                                   ;9BA85F;

UnchargedBeamTrails_IcePlasma_7:
    db $00,$00,$00,$00,$0C,$0C,$0C,$0C                                   ;9BA867;

UnchargedBeamTrails_WaveIcePlasma_0:
    db $00,$00,$00,$00,$00,$10,$00,$10,$F8,$10,$08,$10,$F0,$10,$10,$10   ;9BA86F;
    db $F0,$10,$10,$10,$F0,$10,$10,$10,$F0,$10,$10,$10,$F0,$10,$10,$10   ;9BA87F;
    db $F8,$10,$08,$10                                                   ;9BA88F;

UnchargedBeamTrails_WaveIcePlasma_1:
    db $00,$00,$00,$00,$F4,$0C,$F4,$0C,$EC,$08,$F8,$12,$E8,$02,$FE,$14   ;9BA893;
    db $E8,$00,$00,$18,$E8,$00,$00,$18,$E8,$00,$00,$18,$E8,$02,$FE,$14   ;9BA8A3;
    db $EC,$08,$F8,$12                                                   ;9BA8B3;

UnchargedBeamTrails_WaveIcePlasma_2:
    db $00,$00,$00,$00,$F0,$00,$F0,$00,$F0,$F8,$F0,$08,$F0,$F4,$F0,$0C   ;9BA8B7;
    db $F0,$F0,$F0,$10,$F0,$F0,$F0,$10,$F0,$F0,$F0,$10,$F0,$F4,$F0,$0C   ;9BA8C7;
    db $F0,$F8,$F0,$08                                                   ;9BA8D7;

UnchargedBeamTrails_WaveIcePlasma_3:
    db $00,$00,$00,$00,$F4,$F4,$F4,$F4,$EE,$FA,$FA,$EE,$EC,$FE,$FE,$EC   ;9BA8DB;
    db $E8,$00,$00,$E8,$E8,$00,$00,$E8,$E8,$00,$00,$E8,$EC,$FE,$FE,$EC   ;9BA8EB;
    db $EE,$FA,$FA,$EE                                                   ;9BA8FB;

UnchargedBeamTrails_WaveIcePlasma_4:
    db $00,$00,$00,$00,$00,$F0,$00,$F0,$F8,$F0,$08,$F0,$F0,$F0,$10,$F0   ;9BA8FF;
    db $F0,$F0,$10,$F0,$F0,$F0,$10,$F0,$F0,$F0,$10,$F0,$F0,$F0,$10,$F0   ;9BA90F;
    db $F8,$F0,$08,$F0                                                   ;9BA91F;

UnchargedBeamTrails_WaveIcePlasma_5:
    db $00,$00,$00,$00,$0C,$F4,$0C,$F4,$14,$F8,$08,$EE,$18,$FE,$02,$EC   ;9BA923;
    db $18,$00,$00,$E8,$18,$00,$00,$E8,$18,$00,$00,$E8,$18,$FE,$02,$EC   ;9BA933;
    db $14,$F8,$08,$EE                                                   ;9BA943;

UnchargedBeamTrails_WaveIcePlasma_6:
    db $00,$00,$00,$00,$10,$00,$10,$00,$10,$F8,$10,$08,$10,$F4,$10,$0C   ;9BA947;
    db $10,$F0,$10,$10,$10,$F0,$10,$10,$10,$F0,$10,$10,$10,$F4,$10,$0C   ;9BA957;
    db $10,$F8,$10,$08                                                   ;9BA967;

UnchargedBeamTrails_WaveIcePlasma_7:
    db $00,$00,$00,$00,$0C,$0C,$0C,$0C,$12,$06,$06,$12,$14,$02,$02,$14   ;9BA96B;
    db $18,$00,$00,$18,$18,$00,$00,$18,$18,$00,$00,$18,$14,$02,$02,$14   ;9BA97B;
    db $12,$06,$06,$12                                                   ;9BA98B;


;;; $A98F: Charged beams ;;;
ChargedBeamTrails_Default:
    dw ChargedBeamTrails_Default_0                                       ;9BA98F; Up, facing right
    dw ChargedBeamTrails_Default_0                                       ;9BA991; Up-right
    dw ChargedBeamTrails_Default_0                                       ;9BA993; Right
    dw ChargedBeamTrails_Default_0                                       ;9BA995; Down-right
    dw ChargedBeamTrails_Default_0                                       ;9BA997; Down, facing right
    dw ChargedBeamTrails_Default_0                                       ;9BA999; Down, facing left
    dw ChargedBeamTrails_Default_0                                       ;9BA99B; Down-left
    dw ChargedBeamTrails_Default_0                                       ;9BA99D; Left
    dw ChargedBeamTrails_Default_0                                       ;9BA99F; Up-left
    dw ChargedBeamTrails_Default_0                                       ;9BA9A1; Up, facing left

ChargedBeamTrails_Wave_WaveIce:
    dw ChargedBeamTrails_Wave_WaveIce_0                                  ;9BA9A3; Up, facing right
    dw ChargedBeamTrails_Wave_WaveIce_2                                  ;9BA9A5; Up-right
    dw ChargedBeamTrails_Wave_WaveIce_1                                  ;9BA9A7; Right
    dw ChargedBeamTrails_Wave_WaveIce_3                                  ;9BA9A9; Down-right
    dw ChargedBeamTrails_Wave_WaveIce_0                                  ;9BA9AB; Down, facing right
    dw ChargedBeamTrails_Wave_WaveIce_0                                  ;9BA9AD; Down, facing left
    dw ChargedBeamTrails_Wave_WaveIce_2                                  ;9BA9AF; Down-left
    dw ChargedBeamTrails_Wave_WaveIce_1                                  ;9BA9B1; Left
    dw ChargedBeamTrails_Wave_WaveIce_3                                  ;9BA9B3; Up-left
    dw ChargedBeamTrails_Wave_WaveIce_0                                  ;9BA9B5; Up, facing left

ChargedBeamTrails_IceSpazer:
    dw ChargedBeamTrails_IceSpazer_0                                     ;9BA9B7; Up, facing right
    dw ChargedBeamTrails_IceSpazer_1                                     ;9BA9B9; Up-right
    dw ChargedBeamTrails_IceSpazer_2                                     ;9BA9BB; Right
    dw ChargedBeamTrails_IceSpazer_3                                     ;9BA9BD; Down-right
    dw ChargedBeamTrails_IceSpazer_4                                     ;9BA9BF; Down, facing right
    dw ChargedBeamTrails_IceSpazer_4                                     ;9BA9C1; Down, facing left
    dw ChargedBeamTrails_IceSpazer_5                                     ;9BA9C3; Down-left
    dw ChargedBeamTrails_IceSpazer_6                                     ;9BA9C5; Left
    dw ChargedBeamTrails_IceSpazer_7                                     ;9BA9C7; Up-left
    dw ChargedBeamTrails_IceSpazer_0                                     ;9BA9C9; Up, facing left

ChargedBeamTrails_WaveIceSpazer:
    dw ChargedBeamTrails_WaveIceSpazer_0                                 ;9BA9CB; Up, facing right
    dw ChargedBeamTrails_WaveIceSpazer_1                                 ;9BA9CD; Up-right
    dw ChargedBeamTrails_WaveIceSpazer_2                                 ;9BA9CF; Right
    dw ChargedBeamTrails_WaveIceSpazer_3                                 ;9BA9D1; Down-right
    dw ChargedBeamTrails_WaveIceSpazer_4                                 ;9BA9D3; Down, facing right
    dw ChargedBeamTrails_WaveIceSpazer_4                                 ;9BA9D5; Down, facing left
    dw ChargedBeamTrails_WaveIceSpazer_5                                 ;9BA9D7; Down-left
    dw ChargedBeamTrails_WaveIceSpazer_6                                 ;9BA9D9; Left
    dw ChargedBeamTrails_WaveIceSpazer_7                                 ;9BA9DB; Up-left
    dw ChargedBeamTrails_WaveIceSpazer_0                                 ;9BA9DD; Up, facing left

ChargedBeamTrails_IcePlasma:
    dw ChargedBeamTrails_IcePlasma_0                                     ;9BA9DF; Up, facing right
    dw ChargedBeamTrails_IcePlasma_1                                     ;9BA9E1; Up-right
    dw ChargedBeamTrails_IcePlasma_2                                     ;9BA9E3; Right
    dw ChargedBeamTrails_IcePlasma_3                                     ;9BA9E5; Down-right
    dw ChargedBeamTrails_IcePlasma_4                                     ;9BA9E7; Down, facing right
    dw ChargedBeamTrails_IcePlasma_4                                     ;9BA9E9; Down, facing left
    dw ChargedBeamTrails_IcePlasma_5                                     ;9BA9EB; Down-left
    dw ChargedBeamTrails_IcePlasma_6                                     ;9BA9ED; Left
    dw ChargedBeamTrails_IcePlasma_7                                     ;9BA9EF; Up-left
    dw ChargedBeamTrails_IcePlasma_0                                     ;9BA9F1; Up, facing left

ChargedBeamTrails_WaveIcePlasma:
    dw ChargedBeamTrails_WaveIcePlasma_0                                 ;9BA9F3; Up, facing right
    dw ChargedBeamTrails_WaveIcePlasma_1                                 ;9BA9F5; Up-right
    dw ChargedBeamTrails_WaveIcePlasma_2                                 ;9BA9F7; Right
    dw ChargedBeamTrails_WaveIcePlasma_3                                 ;9BA9F9; Down-right
    dw ChargedBeamTrails_WaveIcePlasma_4                                 ;9BA9FB; Down, facing right
    dw ChargedBeamTrails_WaveIcePlasma_4                                 ;9BA9FD; Down, facing left
    dw ChargedBeamTrails_WaveIcePlasma_5                                 ;9BA9FF; Down-left
    dw ChargedBeamTrails_WaveIcePlasma_6                                 ;9BAA01; Left
    dw ChargedBeamTrails_WaveIcePlasma_7                                 ;9BAA03; Up-left
    dw ChargedBeamTrails_WaveIcePlasma_0                                 ;9BAA05; Up, facing left

; Format:
;     x,y,X,Y
;     x: Left trail X offset
;     y: Left trail Y offset
;     X: Right trail X offset
;     Y: Right trail Y offset

; Indexed by [[projectile instruction pointer] - 2] * 4

ChargedBeamTrails_Default_0:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;9BAA07;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;9BAA17;

ChargedBeamTrails_Wave_WaveIce_0:
    db $00,$00,$00,$00,$00,$00,$00,$00,$F8,$00,$08,$00,$F8,$00,$08,$00   ;9BAA27;
    db $F4,$00,$0C,$00,$F4,$00,$0C,$00,$F0,$00,$10,$00,$F0,$00,$10,$00   ;9BAA37;
    db $F0,$00,$10,$00,$F0,$00,$10,$00,$F0,$00,$10,$00,$F0,$00,$10,$00   ;9BAA47;
    db $F4,$00,$0C,$00,$F4,$00,$0C,$00,$F8,$00,$08,$00,$F8,$00,$08,$00   ;9BAA57;

ChargedBeamTrails_Wave_WaveIce_1:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$F8,$00,$08,$00,$F8,$00,$08   ;9BAA67;
    db $00,$F4,$00,$0C,$00,$F4,$00,$0C,$00,$F0,$00,$10,$00,$F0,$00,$10   ;9BAA77;
    db $00,$F0,$00,$10,$00,$F0,$00,$10,$00,$F0,$00,$10,$00,$F0,$00,$10   ;9BAA87;
    db $00,$F4,$00,$0C,$00,$F4,$00,$0C,$00,$F8,$00,$08,$00,$F8,$00,$08   ;9BAA97;

ChargedBeamTrails_Wave_WaveIce_2:
    db $00,$00,$00,$00,$00,$00,$00,$00,$FC,$FC,$04,$04,$FC,$FC,$04,$04   ;9BAAA7;
    db $F8,$F8,$08,$08,$F8,$F8,$08,$08,$F8,$F8,$08,$08,$F8,$F8,$08,$08   ;9BAAB7;
    db $F6,$F6,$0A,$0A,$F6,$F6,$0A,$0A,$F8,$F8,$08,$08,$F8,$F8,$08,$08   ;9BAAC7;
    db $F8,$F8,$08,$08,$F8,$F8,$08,$08,$FC,$FC,$04,$04,$FC,$FC,$04,$04   ;9BAAD7;

ChargedBeamTrails_Wave_WaveIce_3:
    db $00,$00,$00,$00,$00,$00,$00,$00,$FC,$04,$04,$FC,$FC,$04,$04,$FC   ;9BAAE7;
    db $F8,$08,$08,$F8,$F8,$08,$08,$F8,$F8,$08,$08,$F8,$F8,$08,$08,$F8   ;9BAAF7;
    db $F6,$0A,$0A,$F6,$F6,$0A,$0A,$F6,$F8,$08,$08,$F8,$F8,$08,$08,$F8   ;9BAB07;
    db $F8,$08,$08,$F8,$F8,$08,$08,$F8,$FC,$04,$04,$FC,$FC,$04,$04,$FC   ;9BAB17;

ChargedBeamTrails_IceSpazer_0:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$08,$00,$08,$00,$08,$00,$08   ;9BAB27;
    db $00,$10,$00,$10,$00,$10,$00,$10,$F8,$10,$08,$10,$F8,$10,$08,$10   ;9BAB37;
    db $F0,$10,$10,$10,$F0,$10,$10,$10                                   ;9BAB47;

ChargedBeamTrails_IceSpazer_1:
    db $00,$00,$00,$00,$00,$00,$00,$00,$F8,$08,$F8,$08,$F8,$08,$F8,$08   ;9BAB4F;
    db $F4,$0C,$F4,$0C,$F4,$0C,$F4,$0C,$F0,$08,$F8,$10,$F0,$08,$F8,$10   ;9BAB5F;
    db $E8,$00,$00,$18,$E8,$00,$00,$18                                   ;9BAB6F;

ChargedBeamTrails_IceSpazer_2:
    db $00,$00,$00,$00,$00,$00,$00,$00,$F8,$08,$F8,$08,$F8,$08,$F8,$08   ;9BAB77;
    db $F0,$00,$F0,$00,$F0,$00,$F0,$00,$F0,$F8,$F0,$08,$F0,$F8,$F0,$08   ;9BAB87;
    db $F0,$F0,$F0,$10,$F0,$F0,$F0,$10                                   ;9BAB97;

ChargedBeamTrails_IceSpazer_3:
    db $00,$00,$00,$00,$00,$00,$00,$00,$F8,$F8,$F8,$F8,$F8,$F8,$F8,$F8   ;9BAB9F;
    db $F4,$F4,$F4,$F4,$F4,$F4,$F4,$F4,$F0,$F8,$F8,$F0,$F0,$F8,$F8,$F0   ;9BABAF;
    db $E8,$00,$00,$E8,$E8,$00,$00,$E8                                   ;9BABBF;

ChargedBeamTrails_IceSpazer_4:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$F8,$00,$F8,$00,$F8,$00,$F8   ;9BABC7;
    db $00,$F0,$00,$F0,$00,$F0,$00,$F0,$F8,$F0,$08,$F0,$F8,$F0,$08,$F0   ;9BABD7;
    db $F0,$F0,$10,$F0,$F0,$F0,$10,$F0                                   ;9BABE7;

ChargedBeamTrails_IceSpazer_5:
    db $00,$00,$00,$00,$00,$00,$00,$00,$08,$F8,$08,$F8,$08,$F8,$08,$F8   ;9BABEF;
    db $0C,$F4,$0C,$F4,$0C,$F4,$0C,$F4,$10,$F8,$08,$F0,$10,$F8,$08,$F0   ;9BABFF;
    db $18,$00,$00,$E8,$18,$00,$00,$E8                                   ;9BAC0F;

ChargedBeamTrails_IceSpazer_6:
    db $00,$00,$00,$00,$00,$00,$00,$00,$08,$00,$08,$00,$08,$00,$08,$00   ;9BAC17;
    db $10,$00,$10,$00,$10,$00,$10,$00,$10,$F8,$10,$08,$10,$F8,$10,$08   ;9BAC27;
    db $10,$F0,$10,$10,$10,$F0,$10,$10                                   ;9BAC37;

ChargedBeamTrails_IceSpazer_7:
    db $00,$00,$00,$00,$00,$00,$00,$00,$08,$08,$08,$08,$08,$08,$08,$08   ;9BAC3F;
    db $0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C,$10,$08,$08,$10,$10,$08,$08,$10   ;9BAC4F;
    db $18,$00,$00,$18,$18,$00,$00,$18                                   ;9BAC5F;

ChargedBeamTrails_WaveIceSpazer_0:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$08,$00,$08,$00,$08,$00,$08   ;9BAC67;
    db $00,$10,$00,$10,$00,$10,$00,$10,$FC,$10,$04,$10,$FC,$10,$04,$10   ;9BAC77;
    db $F8,$10,$08,$10,$F8,$10,$08,$10,$F4,$10,$0C,$10,$F4,$10,$0C,$10   ;9BAC87;
    db $F0,$10,$10,$10,$F0,$10,$10,$10,$F0,$10,$10,$10,$F0,$10,$10,$10   ;9BAC97;
    db $F0,$10,$10,$10,$F0,$10,$10,$10,$F4,$10,$0C,$10,$F4,$10,$0C,$10   ;9BACA7;
    db $F8,$10,$08,$10,$F8,$10,$08,$10,$FC,$10,$04,$10,$FC,$10,$04,$10   ;9BACB7;

ChargedBeamTrails_WaveIceSpazer_1:
    db $00,$00,$00,$00,$00,$00,$00,$00,$F8,$08,$F8,$08,$F8,$08,$F8,$08   ;9BACC7;
    db $F4,$0C,$F4,$0C,$F4,$0C,$F4,$0C,$F0,$08,$F8,$10,$F0,$08,$F8,$10   ;9BACD7;
    db $F0,$08,$F8,$10,$F0,$08,$F8,$10,$F0,$08,$F8,$10,$F0,$08,$F8,$10   ;9BACE7;
    db $E8,$00,$00,$18,$E8,$00,$00,$18,$E8,$00,$00,$18,$E8,$00,$00,$18   ;9BACF7;
    db $E8,$00,$00,$18,$E8,$00,$00,$18,$F0,$08,$F8,$10,$F0,$08,$F8,$10   ;9BAD07;
    db $F0,$08,$F8,$10,$F0,$08,$F8,$10,$F0,$08,$F8,$10,$F0,$08,$F8,$10   ;9BAD17;

ChargedBeamTrails_WaveIceSpazer_2:
    db $00,$00,$00,$00,$00,$00,$00,$00,$F8,$00,$F8,$00,$F8,$00,$F8,$00   ;9BAD27;
    db $F0,$00,$F0,$00,$F0,$00,$F0,$00,$F0,$FC,$F0,$04,$F0,$FC,$F0,$04   ;9BAD37;
    db $F0,$F8,$F0,$08,$F0,$F8,$F0,$08,$F0,$F4,$F0,$0C,$F0,$F4,$F0,$0C   ;9BAD47;
    db $F0,$F0,$F0,$10,$F0,$F0,$F0,$10,$F0,$F0,$F0,$10,$F0,$F0,$F0,$10   ;9BAD57;
    db $F0,$F0,$F0,$10,$F0,$F0,$F0,$10,$F0,$F4,$F0,$0C,$F0,$F4,$F0,$0C   ;9BAD67;
    db $F0,$F8,$F0,$08,$F0,$F8,$F0,$08,$F0,$FC,$F0,$04,$F0,$FC,$F0,$04   ;9BAD77;

ChargedBeamTrails_WaveIceSpazer_3:
    db $00,$00,$00,$00,$00,$00,$00,$00,$F8,$F8,$F8,$F8,$F8,$F8,$F8,$F8   ;9BAD87;
    db $F4,$F4,$F4,$F4,$F4,$F4,$F4,$F4,$F0,$F8,$F8,$F0,$F0,$F8,$F8,$F0   ;9BAD97;
    db $F0,$F8,$F8,$F0,$F0,$F8,$F8,$F0,$EC,$FC,$FC,$EC,$EC,$FC,$FC,$EC   ;9BADA7;
    db $E8,$00,$00,$E8,$E8,$00,$00,$E8,$E8,$00,$00,$E8,$E8,$00,$00,$E8   ;9BADB7;
    db $E8,$00,$00,$E8,$E8,$00,$00,$E8,$EC,$FC,$FC,$EC,$EC,$FC,$FC,$EC   ;9BADC7;
    db $F0,$F8,$F8,$F0,$F0,$F8,$F8,$F0,$F0,$F8,$F8,$F0,$F0,$F8,$F8,$F0   ;9BADD7;

ChargedBeamTrails_WaveIceSpazer_4:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$F8,$00,$F8,$00,$F8,$00,$F8   ;9BADE7;
    db $00,$F0,$00,$F0,$00,$F0,$00,$F0,$FC,$F0,$04,$F0,$FC,$F0,$04,$F0   ;9BADF7;
    db $F8,$F0,$08,$F0,$F8,$F0,$08,$F0,$F4,$F0,$0C,$F0,$F4,$F0,$0C,$F0   ;9BAE07;
    db $F0,$F0,$10,$F0,$F0,$F0,$10,$F0,$F0,$F0,$10,$F0,$F0,$F0,$10,$F0   ;9BAE17;
    db $F0,$F0,$10,$F0,$F0,$F0,$10,$F0,$F4,$F0,$0C,$F0,$F4,$F0,$0C,$F0   ;9BAE27;
    db $F8,$F0,$08,$F0,$F8,$F0,$08,$F0,$FC,$F0,$04,$F0,$FC,$F0,$04,$F0   ;9BAE37;

ChargedBeamTrails_WaveIceSpazer_5:
    db $00,$00,$00,$00,$00,$00,$00,$00,$08,$F8,$08,$F8,$08,$F8,$08,$F8   ;9BAE47;
    db $0C,$F4,$0C,$F4,$0C,$F4,$0C,$F4,$08,$F0,$10,$F8,$08,$F0,$10,$F8   ;9BAE57;
    db $08,$F0,$10,$F8,$08,$F0,$10,$F8,$04,$EC,$14,$FC,$04,$EC,$14,$FC   ;9BAE67;
    db $00,$E8,$18,$00,$00,$E8,$18,$00,$00,$E8,$18,$00,$00,$E8,$18,$00   ;9BAE77;
    db $00,$E8,$18,$00,$00,$E8,$18,$00,$04,$EC,$14,$FC,$04,$EC,$14,$FC   ;9BAE87;
    db $08,$F0,$10,$F8,$08,$F0,$10,$F8,$08,$F0,$10,$F8,$08,$F0,$10,$F8   ;9BAE97;

ChargedBeamTrails_WaveIceSpazer_6:
    db $00,$00,$00,$00,$00,$00,$00,$00,$08,$00,$08,$00,$08,$00,$08,$00   ;9BAEA7;
    db $10,$00,$10,$00,$10,$00,$10,$00,$10,$FC,$10,$04,$10,$FC,$10,$04   ;9BAEB7;
    db $10,$F8,$10,$08,$10,$F8,$10,$08,$10,$F4,$10,$0C,$10,$F4,$10,$0C   ;9BAEC7;
    db $10,$F0,$10,$10,$10,$F0,$10,$10,$10,$F0,$10,$10,$10,$F0,$10,$10   ;9BAED7;
    db $10,$F0,$10,$10,$10,$F0,$10,$10,$10,$F4,$10,$0C,$10,$F4,$10,$0C   ;9BAEE7;
    db $10,$F8,$10,$08,$10,$F8,$10,$08,$10,$FC,$10,$04,$10,$FC,$10,$04   ;9BAEF7;

ChargedBeamTrails_WaveIceSpazer_7:
    db $00,$00,$00,$00,$00,$00,$00,$00,$08,$08,$08,$08,$08,$08,$08,$08   ;9BAF07;
    db $0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C,$08,$10,$10,$08,$08,$10,$10,$08   ;9BAF17;
    db $08,$10,$10,$08,$08,$10,$10,$08,$04,$14,$14,$04,$04,$14,$14,$04   ;9BAF27;
    db $00,$18,$18,$00,$00,$18,$18,$00,$00,$18,$18,$00,$00,$18,$18,$00   ;9BAF37;
    db $00,$18,$18,$00,$00,$18,$18,$00,$04,$14,$14,$04,$04,$14,$14,$04   ;9BAF47;
    db $08,$10,$10,$08,$08,$10,$10,$08,$08,$10,$10,$08,$08,$10,$10,$08   ;9BAF57;

ChargedBeamTrails_IcePlasma_0:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$0C,$00,$0C,$00,$0C,$00,$0C   ;9BAF67;
    db $00,$18,$00,$18,$00,$18,$00,$18,$00,$1C,$00,$1C,$00,$1C,$00,$1C   ;9BAF77;

ChargedBeamTrails_IcePlasma_1:
    db $00,$00,$00,$00,$00,$00,$00,$00,$F8,$08,$F8,$08,$F8,$08,$F8,$08   ;9BAF87;
    db $F0,$10,$F0,$10,$F0,$10,$F0,$10,$E8,$18,$E8,$18,$E8,$18,$E8,$18   ;9BAF97;

ChargedBeamTrails_IcePlasma_2:
    db $00,$00,$00,$00,$00,$00,$00,$00,$F4,$00,$F4,$00,$F4,$00,$F4,$00   ;9BAFA7;
    db $E8,$00,$E8,$00,$E8,$00,$E8,$00,$E4,$00,$E4,$00,$E4,$00,$E4,$00   ;9BAFB7;

ChargedBeamTrails_IcePlasma_3:
    db $00,$00,$00,$00,$00,$00,$00,$00,$F8,$F8,$F8,$F8,$F8,$F8,$F8,$F8   ;9BAFC7;
    db $F0,$F0,$F0,$F0,$F0,$F0,$F0,$F0,$E8,$E8,$E8,$E8,$E8,$E8,$E8,$E8   ;9BAFD7;

ChargedBeamTrails_IcePlasma_4:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$F4,$00,$F4,$00,$F4,$00,$F4   ;9BAFE7;
    db $00,$E8,$00,$E8,$00,$E8,$00,$E8,$00,$E4,$00,$E4,$00,$E4,$00,$E4   ;9BAFF7;

ChargedBeamTrails_IcePlasma_5:
    db $00,$00,$00,$00,$00,$00,$00,$00,$08,$F8,$08,$F8,$08,$F8,$08,$F8   ;9BB007;
    db $10,$F0,$10,$F0,$10,$F0,$10,$F0,$18,$E8,$18,$E8,$18,$E8,$18,$E8   ;9BB017;

ChargedBeamTrails_IcePlasma_6:
    db $00,$00,$00,$00,$00,$00,$00,$00,$0C,$00,$0C,$00,$0C,$00,$0C,$00   ;9BB027;
    db $18,$00,$18,$00,$18,$00,$18,$00,$1C,$00,$1C,$00,$1C,$00,$1C,$00   ;9BB037;

ChargedBeamTrails_IcePlasma_7:
    db $00,$00,$00,$00,$00,$00,$00,$00,$08,$08,$08,$08,$08,$08,$08,$08   ;9BB047;
    db $10,$10,$10,$10,$10,$10,$10,$10,$18,$18,$18,$18,$18,$18,$18,$18   ;9BB057;

ChargedBeamTrails_WaveIcePlasma_0:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$0C,$00,$0C,$00,$0C,$00,$0C   ;9BB067;
    db $00,$18,$00,$18,$00,$18,$00,$18,$00,$1C,$00,$1C,$00,$1C,$00,$1C   ;9BB077;
    db $F8,$1C,$08,$1C,$F8,$1C,$08,$1C,$F4,$1C,$0C,$1C,$F4,$1C,$0C,$1C   ;9BB087;
    db $F0,$1C,$10,$1C,$F0,$1C,$10,$1C,$F0,$1C,$10,$1C,$F0,$1C,$10,$1C   ;9BB097;
    db $F0,$1C,$10,$1C,$F0,$1C,$10,$1C,$F4,$1C,$0C,$1C,$F4,$1C,$0C,$1C   ;9BB0A7;
    db $F8,$1C,$08,$1C,$F8,$1C,$08,$1C                                   ;9BB0B7;

ChargedBeamTrails_WaveIcePlasma_1:
    db $00,$00,$00,$00,$00,$00,$00,$00,$F8,$08,$F8,$08,$F8,$08,$F8,$08   ;9BB0BF;
    db $F0,$10,$F0,$10,$F0,$10,$F0,$10,$EC,$14,$EC,$14,$EC,$14,$EC,$14   ;9BB0CF;
    db $E4,$0C,$F0,$18,$E4,$0C,$F0,$18,$E0,$0C,$F4,$1C,$E0,$0C,$F4,$1C   ;9BB0DF;
    db $E0,$08,$F8,$20,$E0,$08,$F8,$20,$E0,$08,$F8,$20,$E0,$08,$F8,$20   ;9BB0EF;
    db $E0,$08,$F8,$20,$E0,$08,$F8,$20,$E0,$0C,$F4,$1C,$E0,$0C,$F4,$1C   ;9BB0FF;
    db $E4,$0C,$F0,$18,$E4,$0C,$F0,$18                                   ;9BB10F;

ChargedBeamTrails_WaveIcePlasma_2:
    db $00,$00,$00,$00,$00,$00,$00,$00,$F4,$00,$F4,$00,$F4,$00,$F4,$00   ;9BB117;
    db $E8,$00,$E8,$00,$E8,$00,$E8,$00,$E4,$00,$E4,$00,$E4,$00,$E4,$00   ;9BB127;
    db $E4,$F8,$E4,$08,$E4,$F8,$E4,$08,$E4,$F4,$E4,$0C,$E4,$F4,$E4,$0C   ;9BB137;
    db $E4,$F0,$E4,$10,$E4,$F0,$E4,$10,$E4,$F0,$E4,$10,$E4,$F0,$E4,$10   ;9BB147;
    db $E4,$F0,$E4,$10,$E4,$F0,$E4,$10,$E4,$F4,$E4,$0C,$E4,$F4,$E4,$0C   ;9BB157;
    db $E4,$F8,$E4,$08,$E4,$F8,$E4,$08                                   ;9BB167;

ChargedBeamTrails_WaveIcePlasma_3:
    db $00,$00,$00,$00,$00,$00,$00,$00,$F8,$F8,$F8,$F8,$F8,$F8,$F8,$F8   ;9BB16F;
    db $F0,$F0,$F0,$F0,$F0,$F0,$F0,$F0,$EC,$EC,$EC,$EC,$EC,$EC,$EC,$EC   ;9BB17F;
    db $E8,$F0,$F0,$E8,$E8,$F0,$F0,$E8,$E0,$F4,$F4,$E0,$E0,$F4,$F4,$E0   ;9BB18F;
    db $E0,$F8,$F8,$E0,$E0,$F8,$F8,$E0,$E0,$F8,$F8,$E0,$E0,$F8,$F8,$E0   ;9BB19F;
    db $E0,$F8,$F8,$E0,$E0,$F8,$F8,$E0,$E0,$F4,$F4,$E0,$E0,$F4,$F4,$E0   ;9BB1AF;
    db $E8,$F0,$F0,$E8,$E8,$F0,$F0,$E8                                   ;9BB1BF;

ChargedBeamTrails_WaveIcePlasma_4:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$F4,$00,$F4,$00,$F4,$00,$F4   ;9BB1C7;
    db $00,$E8,$00,$E8,$00,$E8,$00,$E8,$00,$E4,$00,$E4,$00,$E4,$00,$E4   ;9BB1D7;
    db $F8,$E4,$08,$E4,$F8,$E4,$08,$E4,$F4,$E4,$0C,$E4,$F4,$E4,$0C,$E4   ;9BB1E7;
    db $F0,$E4,$10,$E4,$F0,$E4,$10,$E4,$F0,$E4,$10,$E4,$F0,$E4,$10,$E4   ;9BB1F7;
    db $F0,$E4,$10,$E4,$F0,$E4,$10,$E4,$F4,$E4,$0C,$E4,$F4,$E4,$0C,$E4   ;9BB207;
    db $F8,$E4,$08,$E4,$F8,$E4,$08,$E4                                   ;9BB217;

ChargedBeamTrails_WaveIcePlasma_5:
    db $00,$00,$00,$00,$00,$00,$00,$00,$08,$F8,$08,$F8,$08,$F8,$08,$F8   ;9BB21F;
    db $10,$F0,$10,$F0,$10,$F0,$10,$F0,$14,$EC,$14,$EC,$14,$EC,$14,$EC   ;9BB22F;
    db $1C,$F4,$10,$E8,$1C,$F4,$10,$E8,$20,$F4,$0C,$E4,$20,$F4,$0C,$E4   ;9BB23F;
    db $20,$F8,$08,$E0,$20,$F8,$08,$E0,$20,$F8,$08,$E0,$20,$F8,$08,$E0   ;9BB24F;
    db $20,$F8,$08,$E0,$20,$F8,$08,$E0,$20,$F4,$0C,$E4,$20,$F4,$0C,$E4   ;9BB25F;
    db $1C,$F4,$10,$E8,$1C,$F4,$10,$E8                                   ;9BB26F;

ChargedBeamTrails_WaveIcePlasma_6:
    db $00,$00,$00,$00,$00,$00,$00,$00,$0C,$00,$0C,$00,$0C,$00,$0C,$00   ;9BB277;
    db $18,$00,$18,$00,$18,$00,$18,$00,$1C,$00,$1C,$00,$1C,$00,$1C,$00   ;9BB287;
    db $1C,$F8,$1C,$08,$1C,$F8,$1C,$08,$1C,$F4,$1C,$0C,$1C,$F4,$1C,$0C   ;9BB297;
    db $1C,$F0,$1C,$10,$1C,$F0,$1C,$10,$1C,$F0,$1C,$10,$1C,$F0,$1C,$10   ;9BB2A7;
    db $1C,$F0,$1C,$10,$1C,$F0,$1C,$10,$1C,$F4,$1C,$0C,$1C,$F4,$1C,$0C   ;9BB2B7;
    db $1C,$F8,$1C,$08,$1C,$F8,$1C,$08                                   ;9BB2C7;

ChargedBeamTrails_WaveIcePlasma_7:
    db $00,$00,$00,$00,$00,$00,$00,$00,$08,$08,$08,$08,$08,$08,$08,$08   ;9BB2CF;
    db $10,$10,$10,$10,$10,$10,$10,$10,$14,$14,$14,$14,$14,$14,$14,$14   ;9BB2DF;
    db $18,$10,$10,$18,$18,$10,$10,$18,$20,$0C,$0C,$20,$20,$0C,$0C,$20   ;9BB2EF;
    db $20,$08,$08,$20,$20,$08,$08,$20,$20,$08,$08,$20,$20,$08,$08,$20   ;9BB2FF;
    db $20,$08,$08,$20,$20,$08,$08,$20,$20,$0C,$0C,$20,$20,$0C,$0C,$20   ;9BB30F;
    db $18,$10,$10,$18,$18,$10,$10,$18                                   ;9BB31F;


;;; $B327: Spazer SBA trail ;;;
SpazerSBATrail_WaveSpazer:
    dw SpazerSBATrail_WaveSpazer_0                                       ;9BB327; Up, facing right
    dw SpazerSBATrail_WaveSpazer_1                                       ;9BB329; Up-right
    dw SpazerSBATrail_WaveSpazer_2                                       ;9BB32B; Right
    dw SpazerSBATrail_WaveSpazer_3                                       ;9BB32D; Down-right
    dw SpazerSBATrail_WaveSpazer_0                                       ;9BB32F; Down, facing right
    dw SpazerSBATrail_WaveSpazer_0                                       ;9BB331; Down, facing left
    dw SpazerSBATrail_WaveSpazer_1                                       ;9BB333; Down-left
    dw SpazerSBATrail_WaveSpazer_2                                       ;9BB335; Left
    dw SpazerSBATrail_WaveSpazer_3                                       ;9BB337; Up-left
    dw SpazerSBATrail_WaveSpazer_0                                       ;9BB339; Up, facing left

; Format:
;     x,y,X,Y
;     x: Left trail X offset
;     y: Left trail Y offset
;     X: Right trail X offset
;     Y: Right trail Y offset

; Indexed by [[projectile instruction pointer] - 2] * 4
SpazerSBATrail_WaveSpazer_0:
    db $00,$00,$00,$00, $10,$00,$F0,$00, $00,$00,$00,$00, $F0,$00,$10,$00 ;9BB33B;

SpazerSBATrail_WaveSpazer_1:
    db $00,$00,$00,$00, $F6,$F6,$0A,$0A, $00,$00,$00,$00, $0A,$0A,$F6,$F6 ;9BB34B;

SpazerSBATrail_WaveSpazer_2:
    db $00,$00,$00,$00, $00,$F0,$00,$10, $00,$00,$00,$00, $00,$10,$00,$F0 ;9BB35B;

SpazerSBATrail_WaveSpazer_3:
    db $00,$00,$00,$00, $0A,$F6,$F6,$0A, $00,$00,$00,$00, $F6,$0A,$0A,$F6 ;9BB36B;

UNSUED_SpazerSBATrail_Spazer_IceSpazer_9BB37B:
    dw UNSUED_SpazerSBATrail_Spazer_IceSpazer_0_9BB38F                   ;9BB37B;
    dw UNSUED_SpazerSBATrail_Spazer_IceSpazer_0_9BB38F                   ;9BB37D;
    dw UNSUED_SpazerSBATrail_Spazer_IceSpazer_0_9BB38F                   ;9BB37F;
    dw UNSUED_SpazerSBATrail_Spazer_IceSpazer_0_9BB38F                   ;9BB381;
    dw UNSUED_SpazerSBATrail_Spazer_IceSpazer_1_9BB39B                   ;9BB383;
    dw UNSUED_SpazerSBATrail_Spazer_IceSpazer_1_9BB39B                   ;9BB385;
    dw UNSUED_SpazerSBATrail_Spazer_IceSpazer_0_9BB38F                   ;9BB387;
    dw UNSUED_SpazerSBATrail_Spazer_IceSpazer_0_9BB38F                   ;9BB389;
    dw UNSUED_SpazerSBATrail_Spazer_IceSpazer_0_9BB38F                   ;9BB38B;
    dw UNSUED_SpazerSBATrail_Spazer_IceSpazer_0_9BB38F                   ;9BB38D;

UNSUED_SpazerSBATrail_Spazer_IceSpazer_0_9BB38F:
    db $00,$00,$00,$00, $F8,$08,$08,$08, $F0,$08,$10,$08                 ;9BB38F;

UNSUED_SpazerSBATrail_Spazer_IceSpazer_1_9BB39B:
    db $00,$00,$00,$00, $F8,$F8,$08,$F8, $F0,$F8,$10,$F8                 ;9BB39B;


;;; $B3A7: Set Samus death sequence pose ;;;
SetSamusDeathSequencePose:
    PHP                                                                  ;9BB3A7;
    PHB                                                                  ;9BB3A8;
    PHK                                                                  ;9BB3A9;
    PLB                                                                  ;9BB3AA;
    REP #$30                                                             ;9BB3AB;
    LDA.W MovementType                                                   ;9BB3AD;
    AND.W #$00FF                                                         ;9BB3B0;
    PHA                                                                  ;9BB3B3;
    CMP.W #$0003                                                         ;9BB3B4;
    BNE .noSpinJumpSFX                                                   ;9BB3B7;
    LDA.W #$0032                                                         ;9BB3B9;
    JSL.L QueueSound_Lib1_Max6                                           ;9BB3BC;

  .noSpinJumpSFX:
    PLA                                                                  ;9BB3C0;
    TAX                                                                  ;9BB3C1;
    LDA.W .animationFrames,X                                             ;9BB3C2;
    AND.W #$00FF                                                         ;9BB3C5;
    PHA                                                                  ;9BB3C8;
    LDA.W PoseXDirection                                                 ;9BB3C9;
    AND.W #$00FF                                                         ;9BB3CC;
    CMP.W #$0004                                                         ;9BB3CF;
    BEQ .facingLeft                                                      ;9BB3D2;
    LDA.W #$00D7                                                         ;9BB3D4;
    STA.W Pose                                                           ;9BB3D7;
    BRA .initPose                                                        ;9BB3DA;

  .facingLeft:
    LDA.W #$00D8                                                         ;9BB3DC;
    STA.W Pose                                                           ;9BB3DF;

  .initPose:
    JSL.L InitializeSamusPose_1                                          ;9BB3E2;
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged                        ;9BB3E6;
    LDA.W PreviousPose                                                   ;9BB3EA;
    STA.W LastDifferentPose                                              ;9BB3ED;
    LDA.W PreviousPoseXDirection                                         ;9BB3F0;
    STA.W LastDifferentPoseXDirection                                    ;9BB3F3;
    LDA.W Pose                                                           ;9BB3F6;
    STA.W PreviousPose                                                   ;9BB3F9;
    LDA.W PoseXDirection                                                 ;9BB3FC;
    STA.W PreviousPoseXDirection                                         ;9BB3FF;
    STZ.W NewPoseSamusAnimationFrame                                     ;9BB402;
    PLA                                                                  ;9BB405;
    STA.W SamusAnimationFrame                                            ;9BB406;
    LDA.W SamusXPosition                                                 ;9BB409;
    SEC                                                                  ;9BB40C;
    SBC.W Layer1XPosition                                                ;9BB40D;
    STA.W SamusXPosition                                                 ;9BB410;
    LDA.W SamusYPosition                                                 ;9BB413;
    SEC                                                                  ;9BB416;
    SBC.W Layer1YPosition                                                ;9BB417;
    STA.W SamusYPosition                                                 ;9BB41A;
    PLB                                                                  ;9BB41D;
    PLP                                                                  ;9BB41E;
    RTL                                                                  ;9BB41F;

  .animationFrames:                                                      ;9BB420;
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
    JSL.L Draw_Samus_Starting_Death_Animation                            ;9BB43C;
    RTL                                                                  ;9BB440;


;;; $B441: Handle death animation flashing ;;;
Handle_Death_Animation_Flashing:
;; Returns:
;;     A: 1 if flashing has ended, 0 otherwise
    PHP                                                                  ;9BB441;
    PHB                                                                  ;9BB442;
    PHK                                                                  ;9BB443;
    PLB                                                                  ;9BB444;
    REP #$30                                                             ;9BB445;
    LDA.W DeathAnimation_Counter                                         ;9BB447;
    CMP.W #$0004                                                         ;9BB44A;
    BPL .timerGreaterThan3                                               ;9BB44D;
    ASL                                                                  ;9BB44F;
    TAY                                                                  ;9BB450;
    JSR.W QueueTransferOfSegmentOfSamusDeathSequenceToVRAM               ;9BB451;

  .timerGreaterThan3:
    LDA.W DeathAnimation_Counter                                         ;9BB454;
    INC                                                                  ;9BB457;
    STA.W DeathAnimation_Counter                                         ;9BB458;
    CMP.W #$003C                                                         ;9BB45B;
    BPL .end                                                             ;9BB45E;
    LDA.W DeathAnimation_Timer                                           ;9BB460;
    DEC                                                                  ;9BB463; >.<
    STA.W DeathAnimation_Timer                                           ;9BB464;
    BEQ .timerExpired                                                    ;9BB467;
    BPL .returnFlashing                                                  ;9BB469;

  .timerExpired:
    LDA.W DeathAnimation_Index                                           ;9BB46B;
    BEQ .zeroIndex                                                       ;9BB46E;
    LDA.W #$0000                                                         ;9BB470;
    STA.W DeathAnimation_Index                                           ;9BB473;
    LDA.W #$0003                                                         ;9BB476;
    STA.W DeathAnimation_Timer                                           ;9BB479;
    BRA +                                                                ;9BB47C;

  .zeroIndex:
    LDA.W #$0001                                                         ;9BB47E;
    STA.W DeathAnimation_Index                                           ;9BB481;
    LDA.W #$0001                                                         ;9BB484;
    STA.W DeathAnimation_Timer                                           ;9BB487;

+   LDA.W DeathAnimation_Index                                           ;9BB48A;
    ASL                                                                  ;9BB48D;
    TAX                                                                  ;9BB48E;
    JSR.W WriteDeathAnimationSpritePalettes                              ;9BB48F;

  .returnFlashing:
    LDA.W #$0000                                                         ;9BB492;
    PLB                                                                  ;9BB495;
    PLP                                                                  ;9BB496;
    RTL                                                                  ;9BB497;

  .end:
    JSR.W FinishDeathAnimationFlashing                                   ;9BB498;
if !DEBUG
    LDA.B DP_Controller2Input                                            ;9BB49B;
    AND.W #$00B0                                                         ;9BB49D;
    CMP.W #$00B0                                                         ;9BB4A0;
    BNE .debug                                                           ;9BB4A3;
    LDA.W #$0001                                                         ;9BB4A5;
    STA.W DebugDeathAnimationFlag                                        ;9BB4A8;
    BRA .returnFlashingEnded                                             ;9BB4AB;

  .debug:
    STZ.W DebugDeathAnimationFlag                                        ;9BB4AD;
endif

  .returnFlashingEnded:
    LDA.W #$0001                                                         ;9BB4B0;
    PLB                                                                  ;9BB4B3;
    PLP                                                                  ;9BB4B4;
    RTL                                                                  ;9BB4B5;


;;; $B4B6: Finish death animation flashing ;;;
FinishDeathAnimationFlashing:
; Writes the first frame of beam charging palette for Samus to end the last yellow frame, I guess(?)
; Also writes background colours (in preparation?) for the fade-to-white(?)
    PHP                                                                  ;9BB4B6;
    REP #$30                                                             ;9BB4B7;
    LDY.W SuitPaletteIndex                                               ;9BB4B9;
    LDA.W .suitPalettes,Y                                                ;9BB4BC;
    TAX                                                                  ;9BB4BF;
    LDA.W $0000,X                                                        ;9BB4C0;
    TAX                                                                  ;9BB4C3;
    PHB                                                                  ;9BB4C4;
    PEA.W SamusPalettes_PowerSuit>>8&$FF00                               ;9BB4C5;
    PLB                                                                  ;9BB4C8;
    PLB                                                                  ;9BB4C9;
    LDA.W $0000,X                                                        ;9BB4CA;
    STA.L Palettes_SpriteP4C0                                            ;9BB4CD;
    LDA.W $0002,X                                                        ;9BB4D1;
    STA.L Palettes_SpriteP4C1                                            ;9BB4D4;
    LDA.W $0004,X                                                        ;9BB4D8;
    STA.L Palettes_SpriteP4C2                                            ;9BB4DB;
    LDA.W $0006,X                                                        ;9BB4DF;
    STA.L Palettes_SpriteP4C3                                            ;9BB4E2;
    LDA.W $0008,X                                                        ;9BB4E6;
    STA.L Palettes_SpriteP4C4                                            ;9BB4E9;
    LDA.W $000A,X                                                        ;9BB4ED;
    STA.L Palettes_SpriteP4C5                                            ;9BB4F0;
    LDA.W $000C,X                                                        ;9BB4F4;
    STA.L Palettes_SpriteP4C6                                            ;9BB4F7;
    LDA.W $000E,X                                                        ;9BB4FB;
    STA.L Palettes_SpriteP4C7                                            ;9BB4FE;
    LDA.W $0010,X                                                        ;9BB502;
    STA.L Palettes_SpriteP4C8                                            ;9BB505;
    LDA.W $0012,X                                                        ;9BB509;
    STA.L Palettes_SpriteP4C9                                            ;9BB50C;
    LDA.W $0014,X                                                        ;9BB510;
    STA.L Palettes_SpriteP4CA                                            ;9BB513;
    LDA.W $0016,X                                                        ;9BB517;
    STA.L Palettes_SpriteP4CB                                            ;9BB51A;
    LDA.W $0018,X                                                        ;9BB51E;
    STA.L Palettes_SpriteP4CC                                            ;9BB521;
    LDA.W $001A,X                                                        ;9BB525;
    STA.L Palettes_SpriteP4CD                                            ;9BB528;
    LDA.W $001C,X                                                        ;9BB52C;
    STA.L Palettes_SpriteP4CE                                            ;9BB52F;
    LDA.W $001E,X                                                        ;9BB533;
    STA.L Palettes_SpriteP4CF                                            ;9BB536;
    LDX.W #SamusPalettes_DeathSequence_SuitlessSamus_0                   ;9BB53A;
    LDA.W $0000,X                                                        ;9BB53D;
    STA.L Palettes_SpriteP7                                              ;9BB540;
    LDA.W $0002,X                                                        ;9BB544;
    STA.L Palettes_SpriteP7+2                                            ;9BB547;
    LDA.W $0004,X                                                        ;9BB54B;
    STA.L Palettes_SpriteP7+4                                            ;9BB54E;
    LDA.W $0006,X                                                        ;9BB552;
    STA.L Palettes_SpriteP7+6                                            ;9BB555;
    LDA.W $0008,X                                                        ;9BB559;
    STA.L Palettes_SpriteP7+8                                            ;9BB55C;
    LDA.W $000A,X                                                        ;9BB560;
    STA.L Palettes_SpriteP7+$A                                           ;9BB563;
    LDA.W $000C,X                                                        ;9BB567;
    STA.L Palettes_SpriteP7+$C                                           ;9BB56A;
    LDA.W $000E,X                                                        ;9BB56E;
    STA.L Palettes_SpriteP7+$E                                           ;9BB571;
    LDA.W $0010,X                                                        ;9BB575;
    STA.L Palettes_SpriteP7+$10                                          ;9BB578;
    LDA.W $0012,X                                                        ;9BB57C;
    STA.L Palettes_SpriteP7+$12                                          ;9BB57F;
    LDA.W $0014,X                                                        ;9BB583;
    STA.L Palettes_SpriteP7+$14                                          ;9BB586;
    LDA.W $0016,X                                                        ;9BB58A;
    STA.L Palettes_SpriteP7+$16                                          ;9BB58D;
    LDA.W $0018,X                                                        ;9BB591;
    STA.L Palettes_SpriteP7+$18                                          ;9BB594;
    LDA.W $001A,X                                                        ;9BB598;
    STA.L Palettes_SpriteP7+$1A                                          ;9BB59B;
    LDA.W $001C,X                                                        ;9BB59F;
    STA.L Palettes_SpriteP7+$1C                                          ;9BB5A2;
    LDA.W $001E,X                                                        ;9BB5A6;
    STA.L Palettes_SpriteP7+$1E                                          ;9BB5A9;
    PLB                                                                  ;9BB5AD;
    LDY.W #$0008                                                         ;9BB5AE;
    JSR.W QueueTransferOfSegmentOfSamusDeathSequenceToVRAM               ;9BB5B1;
    LDA.W DeathSequenceSuitExplosionPaletteIndexTable_timer              ;9BB5B4;
    AND.W #$00FF                                                         ;9BB5B7;
    STA.W DeathAnimation_Timer                                           ;9BB5BA;
    STZ.W DeathAnimation_Index                                           ;9BB5BD;
    STZ.W DeathAnimation_Counter                                         ;9BB5C0;
    JSR.W HandleDeathSequenceSuitExplosion                               ;9BB5C3;
    PLP                                                                  ;9BB5C6;
    RTS                                                                  ;9BB5C7;

  .suitPalettes:
    dw SamusDeathSequencePalettePointers_Suit_power                      ;9BB5C8;
    dw SamusDeathSequencePalettePointers_Suit_varia                      ;9BB5CA;
    dw SamusDeathSequencePalettePointers_Suit_gravity                    ;9BB5CC;


;;; $B5CE: Write death animation sprite palettes ;;;
WriteDeathAnimationSpritePalettes:
;; Parameters:
;;     X: Death animation palette table index
    PHP                                                                  ;9BB5CE;
    REP #$30                                                             ;9BB5CF;
    LDY.W SuitPaletteIndex                                               ;9BB5D1;
    LDA.W .suitPalettes,Y                                                ;9BB5D4;
    STA.B DP_Temp14                                                      ;9BB5D7;
    LDA.W SamusDeathSequencePalettePointers_Suitless,X                   ;9BB5D9;
    STA.B DP_Temp12                                                      ;9BB5DC;
    TXA                                                                  ;9BB5DE;
    CLC                                                                  ;9BB5DF;
    ADC.B DP_Temp14                                                      ;9BB5E0;
    TAX                                                                  ;9BB5E2;
    LDA.W $0000,X                                                        ;9BB5E3;
    TAX                                                                  ;9BB5E6;
    PHB                                                                  ;9BB5E7;
    PEA.W SamusPalettes_PowerSuit>>8&$FF00                               ;9BB5E8;
    PLB                                                                  ;9BB5EB;
    PLB                                                                  ;9BB5EC;
    LDA.W $0000,X                                                        ;9BB5ED;
    STA.L Palettes_SpriteP4C0                                            ;9BB5F0;
    LDA.W $0002,X                                                        ;9BB5F4;
    STA.L Palettes_SpriteP4C1                                            ;9BB5F7;
    LDA.W $0004,X                                                        ;9BB5FB;
    STA.L Palettes_SpriteP4C2                                            ;9BB5FE;
    LDA.W $0006,X                                                        ;9BB602;
    STA.L Palettes_SpriteP4C3                                            ;9BB605;
    LDA.W $0008,X                                                        ;9BB609;
    STA.L Palettes_SpriteP4C4                                            ;9BB60C;
    LDA.W $000A,X                                                        ;9BB610;
    STA.L Palettes_SpriteP4C5                                            ;9BB613;
    LDA.W $000C,X                                                        ;9BB617;
    STA.L Palettes_SpriteP4C6                                            ;9BB61A;
    LDA.W $000E,X                                                        ;9BB61E;
    STA.L Palettes_SpriteP4C7                                            ;9BB621;
    LDA.W $0010,X                                                        ;9BB625;
    STA.L Palettes_SpriteP4C8                                            ;9BB628;
    LDA.W $0012,X                                                        ;9BB62C;
    STA.L Palettes_SpriteP4C9                                            ;9BB62F;
    LDA.W $0014,X                                                        ;9BB633;
    STA.L Palettes_SpriteP4CA                                            ;9BB636;
    LDA.W $0016,X                                                        ;9BB63A;
    STA.L Palettes_SpriteP4CB                                            ;9BB63D;
    LDA.W $0018,X                                                        ;9BB641;
    STA.L Palettes_SpriteP4CC                                            ;9BB644;
    LDA.W $001A,X                                                        ;9BB648;
    STA.L Palettes_SpriteP4CD                                            ;9BB64B;
    LDA.W $001C,X                                                        ;9BB64F;
    STA.L Palettes_SpriteP4CE                                            ;9BB652;
    LDA.W $001E,X                                                        ;9BB656;
    STA.L Palettes_SpriteP4CF                                            ;9BB659;
    LDX.B DP_Temp12                                                      ;9BB65D;
    LDA.W $0000,X                                                        ;9BB65F;
    STA.L Palettes_SpriteP7                                              ;9BB662;
    LDA.W $0002,X                                                        ;9BB666;
    STA.L Palettes_SpriteP7+2                                            ;9BB669;
    LDA.W $0004,X                                                        ;9BB66D;
    STA.L Palettes_SpriteP7+4                                            ;9BB670;
    LDA.W $0006,X                                                        ;9BB674;
    STA.L Palettes_SpriteP7+6                                            ;9BB677;
    LDA.W $0008,X                                                        ;9BB67B;
    STA.L Palettes_SpriteP7+8                                            ;9BB67E;
    LDA.W $000A,X                                                        ;9BB682;
    STA.L Palettes_SpriteP7+$A                                           ;9BB685;
    LDA.W $000C,X                                                        ;9BB689;
    STA.L Palettes_SpriteP7+$C                                           ;9BB68C;
    LDA.W $000E,X                                                        ;9BB690;
    STA.L Palettes_SpriteP7+$E                                           ;9BB693;
    LDA.W $0010,X                                                        ;9BB697;
    STA.L Palettes_SpriteP7+$10                                          ;9BB69A;
    LDA.W $0012,X                                                        ;9BB69E;
    STA.L Palettes_SpriteP7+$12                                          ;9BB6A1;
    LDA.W $0014,X                                                        ;9BB6A5;
    STA.L Palettes_SpriteP7+$14                                          ;9BB6A8;
    LDA.W $0016,X                                                        ;9BB6AC;
    STA.L Palettes_SpriteP7+$16                                          ;9BB6AF;
    LDA.W $0018,X                                                        ;9BB6B3;
    STA.L Palettes_SpriteP7+$18                                          ;9BB6B6;
    LDA.W $001A,X                                                        ;9BB6BA;
    STA.L Palettes_SpriteP7+$1A                                          ;9BB6BD;
    LDA.W $001C,X                                                        ;9BB6C1;
    STA.L Palettes_SpriteP7+$1C                                          ;9BB6C4;
    LDA.W $001E,X                                                        ;9BB6C8;
    STA.L Palettes_SpriteP7+$1E                                          ;9BB6CB;
    PLB                                                                  ;9BB6CF;
    PLP                                                                  ;9BB6D0;
    RTS                                                                  ;9BB6D1;

  .suitPalettes:
    dw SamusDeathSequencePalettePointers_Suit_power                      ;9BB6D2;
    dw SamusDeathSequencePalettePointers_Suit_varia                      ;9BB6D4;
    dw SamusDeathSequencePalettePointers_Suit_gravity                    ;9BB6D6;


;;; $B6D8: Queue transfer of segment of Samus death sequence to VRAM ;;;
QueueTransferOfSegmentOfSamusDeathSequenceToVRAM:
;; Parameters:
;;     Y: Samus death sequence segment index
    PHP                                                                  ;9BB6D8;
    REP #$30                                                             ;9BB6D9;
    LDX.W VRAMWriteStack                                                 ;9BB6DB;
    LDA.W #$0400                                                         ;9BB6DE;
    STA.B VRAMWrite.size,X                                               ;9BB6E1;
    INX                                                                  ;9BB6E3;
    INX                                                                  ;9BB6E4;
    LDA.W SamusDeathSequencePointers_Source,Y                            ;9BB6E5;
    STA.B VRAMWrite.size,X                                               ;9BB6E8;
    INX                                                                  ;9BB6EA;
    INX                                                                  ;9BB6EB;
    SEP #$20                                                             ;9BB6EC;
    LDA.B #SamusDeathSequencePointers_Destination>>16                    ;9BB6EE;
    STA.B VRAMWrite.size,X                                               ;9BB6F0;
    REP #$20                                                             ;9BB6F2;
    INX                                                                  ;9BB6F4;
    LDA.W SamusDeathSequencePointers_Destination,Y                       ;9BB6F5;
    STA.B VRAMWrite.size,X                                               ;9BB6F8;
    INX                                                                  ;9BB6FA;
    INX                                                                  ;9BB6FB;
    STX.W VRAMWriteStack                                                 ;9BB6FC;
    PLP                                                                  ;9BB6FF;
    RTS                                                                  ;9BB700;


;;; $B701: Handle death sequence suit explosion white out ;;;
Handle_DeathSequence_SuitExplosionWhiteOut:
;; Returns:
;;     A: 1 if finished, 0 otherwise
    PHP                                                                  ;9BB701;
    PHB                                                                  ;9BB702;
    PHK                                                                  ;9BB703;
    PLB                                                                  ;9BB704;
    REP #$30                                                             ;9BB705;
    JSR.W HandleDeathSequenceWhiteOut                                    ;9BB707;
    JSR.W HandleDeathSequenceSuitExplosion                               ;9BB70A;
    PLB                                                                  ;9BB70D;
    PLP                                                                  ;9BB70E;
    RTL                                                                  ;9BB70F;


;;; $B710: Handle death sequence white out ;;;
HandleDeathSequenceWhiteOut:
    PHP                                                                  ;9BB710;
    REP #$30                                                             ;9BB711;
    LDA.W #Palettes>>8&$FF00                                             ;9BB713;
    STA.B DP_Temp01                                                      ;9BB716;
if !DEBUG
    LDA.W DebugDeathAnimationFlag                                        ;9BB718;
    BNE .return                                                          ;9BB71B;
endif
    LDA.W DeathAnimation_Index                                           ;9BB71D;
    BEQ .return                                                          ;9BB720;
    LDA.W DeathAnimation_Counter                                         ;9BB722;
    ASL                                                                  ;9BB725;
    TAX                                                                  ;9BB726;
    LDA.W #Palettes                                                      ;9BB727;
    STA.B DP_Temp00                                                      ;9BB72A;
    LDY.W #$0000                                                         ;9BB72C;

  .loopFirstFourPalettes:
    LDA.W ShadesOfWhite,X                                                ;9BB72F;
    STA.B [DP_Temp00],Y                                                  ;9BB732;
    INY                                                                  ;9BB734;
    INY                                                                  ;9BB735;
    CPY.W #$0180                                                         ;9BB736;
    BMI .loopFirstFourPalettes                                           ;9BB739;
    LDY.W #$01A0                                                         ;9BB73B;

  .loopLastFourPalettes:
    LDA.W ShadesOfWhite,X                                                ;9BB73E;
    STA.B [DP_Temp00],Y                                                  ;9BB741;
    INY                                                                  ;9BB743;
    INY                                                                  ;9BB744;
    CPY.W #$01E0                                                         ;9BB745;
    BMI .loopLastFourPalettes                                            ;9BB748;
    LDA.W DeathAnimation_Counter                                         ;9BB74A;
    CMP.W #$0014                                                         ;9BB74D;
    BPL .return                                                          ;9BB750;
    INC                                                                  ;9BB752;
    STA.W DeathAnimation_Counter                                         ;9BB753;

  .return:
    PLP                                                                  ;9BB756;
    RTS                                                                  ;9BB757;


;;; $B758: Handle death sequence suit explosion ;;;
HandleDeathSequenceSuitExplosion:
;; Returns:
;;     A: 1 if suit explosion has ended, 0 otherwise
    PHP                                                                  ;9BB758;
    REP #$30                                                             ;9BB759;
    LDA.W DeathAnimation_Timer                                           ;9BB75B;
    DEC                                                                  ;9BB75E;
    STA.W DeathAnimation_Timer                                           ;9BB75F;
    BEQ .timerExpired                                                    ;9BB762;
    BPL .notFinished                                                     ;9BB764;

  .timerExpired:
    LDA.W DeathAnimation_Index                                           ;9BB766;
    INC                                                                  ;9BB769;
    STA.W DeathAnimation_Index                                           ;9BB76A;
    CMP.W #$0009                                                         ;9BB76D;
    BMI .lessThan9                                                       ;9BB770;
    LDA.W #$0015                                                         ;9BB772;
    STA.W DeathAnimation_Counter                                         ;9BB775;
    JSR.W HandleDeathSequenceWhiteOut                                    ;9BB778;
    STZ.W DebugDeathAnimationFlag                                        ;9BB77B;
    LDA.W #$0001                                                         ;9BB77E;
    BRA .return                                                          ;9BB781;

  .lessThan9:
    LDA.W DebugDeathAnimationFlag                                        ;9BB783;
    BEQ .lessThan2                                                       ;9BB786;
    LDA.W DeathAnimation_Index                                           ;9BB788;
    CMP.W #$0002                                                         ;9BB78B;
    BMI .lessThan2                                                       ;9BB78E;
    ASL                                                                  ;9BB790;
    TAX                                                                  ;9BB791;
    LDA.W DeathSequenceSuitExplosionPaletteIndexTable_timer,X            ;9BB792;
    AND.W #$00FF                                                         ;9BB795;
    STA.W DeathAnimation_Timer                                           ;9BB798;
    BRA .notFinished                                                     ;9BB79B;

  .lessThan2:
    LDA.W DeathAnimation_Index                                           ;9BB79D;
    ASL                                                                  ;9BB7A0;
    TAX                                                                  ;9BB7A1;
    LDA.W DeathSequenceSuitExplosionPaletteIndexTable_timer,X            ;9BB7A2;
    AND.W #$00FF                                                         ;9BB7A5;
    STA.W DeathAnimation_Timer                                           ;9BB7A8;
    LDA.W DeathSequenceSuitExplosionPaletteIndexTable_index,X            ;9BB7AB;
    AND.W #$00FF                                                         ;9BB7AE;
    ASL                                                                  ;9BB7B1;
    TAX                                                                  ;9BB7B2;
    JSR.W WriteDeathAnimationSpritePalettes                              ;9BB7B3;

  .notFinished:
    JSL.L DrawSamusSuitExploding                                         ;9BB7B6;
    LDA.W #$0000                                                         ;9BB7BA;

  .return:
    PLP                                                                  ;9BB7BD;
    RTS                                                                  ;9BB7BE;


;;; $B7BF: Samus death sequence segment source pointers ;;;
SamusDeathSequencePointers_Source:
    dw $8400,$8800,$8C00,$9000,$8000                                     ;9BB7BF;


;;; $B7C9: Samus death sequence segment destination pointers ;;;
SamusDeathSequencePointers_Destination:
    dw $6200,$6400,$6600,$6800,$6000                                     ;9BB7C9;


;;; $B7D3: Death sequence palette pointers - suit ;;;
SamusDeathSequencePalettePointers_Suit:
  .power:
    dw SamusPalettes_PowerSuit_DeathSequence_BeamCharging_0              ;9BB7D3;
    dw SamusPalettes_DeathSequence_YellowFlash                           ;9BB7D5;
    dw SamusPalettes_PowerSuit_DeathSequence_BeamCharging_1              ;9BB7D7;
    dw SamusPalettes_PowerSuit_DeathSequence_BeamCharging_2              ;9BB7D9;
    dw SamusPalettes_PowerSuit_DeathSequence_BeamCharging_3              ;9BB7DB;
    dw SamusPalettes_PowerSuit_DeathSequence_4                           ;9BB7DD;
    dw SamusPalettes_PowerSuit_DeathSequence_5                           ;9BB7DF;
    dw SamusPalettes_PowerSuit_DeathSequence_6                           ;9BB7E1;
    dw SamusPalettes_PowerSuit_DeathSequence_7                           ;9BB7E3;
    dw SamusPalettes_DeathSequence_SuitlessSamus_8                       ;9BB7E5;

  .varia:
    dw SamusPalettes_VariaSuit_DeathSequence_BeamCharging_0              ;9BB7E7;
    dw SamusPalettes_DeathSequence_YellowFlash                           ;9BB7E9;
    dw SamusPalettes_VariaSuit_DeathSequence_BeamCharging_1              ;9BB7EB;
    dw SamusPalettes_VariaSuit_DeathSequence_BeamCharging_2              ;9BB7ED;
    dw SamusPalettes_VariaSuit_DeathSequence_BeamCharging_3              ;9BB7EF;
    dw SamusPalettes_VariaSuit_DeathSequence_4                           ;9BB7F1;
    dw SamusPalettes_VariaSuit_DeathSequence_5                           ;9BB7F3;
    dw SamusPalettes_VariaSuit_DeathSequence_6                           ;9BB7F5;
    dw SamusPalettes_VariaSuit_DeathSequence_7                           ;9BB7F7;
    dw SamusPalettes_DeathSequence_SuitlessSamus_8                       ;9BB7F9;

  .gravity:
    dw SamusPalettes_GravitySuit_DeathSequence_BeamCharging_0            ;9BB7FB;
    dw SamusPalettes_DeathSequence_YellowFlash                           ;9BB7FD;
    dw SamusPalettes_GravitySuit_DeathSequence_BeamCharging_1            ;9BB7FF;
    dw SamusPalettes_GravitySuit_DeathSequence_BeamCharging_2            ;9BB801;
    dw SamusPalettes_GravitySuit_DeathSequence_BeamCharging_3            ;9BB803;
    dw SamusPalettes_GravitySuit_DeathSequence_4                         ;9BB805;
    dw SamusPalettes_GravitySuit_DeathSequence_5                         ;9BB807;
    dw SamusPalettes_GravitySuit_DeathSequence_6                         ;9BB809;
    dw SamusPalettes_GravitySuit_DeathSequence_7                         ;9BB80B;
    dw SamusPalettes_DeathSequence_SuitlessSamus_8                       ;9BB80D;


;;; $B80F: Death sequence palette pointers - suitless Samus ;;;
SamusDeathSequencePalettePointers_Suitless:
    dw SamusPalettes_DeathSequence_SuitlessSamus_0                       ;9BB80F;
    dw SamusPalettes_DeathSequence_SuitlessSamus_0                       ;9BB811;
    dw SamusPalettes_DeathSequence_SuitlessSamus_1                       ;9BB813;
    dw SamusPalettes_DeathSequence_SuitlessSamus_2                       ;9BB815;
    dw SamusPalettes_DeathSequence_SuitlessSamus_3                       ;9BB817;
    dw SamusPalettes_DeathSequence_SuitlessSamus_4                       ;9BB819;
    dw SamusPalettes_DeathSequence_SuitlessSamus_5                       ;9BB81B;
    dw SamusPalettes_DeathSequence_SuitlessSamus_6                       ;9BB81D;
    dw SamusPalettes_DeathSequence_SuitlessSamus_7                       ;9BB81F;
    dw SamusPalettes_DeathSequence_SuitlessSamus_8                       ;9BB821;


;;; $B823: Death sequence suit explosion palette index table ;;;
DeathSequenceSuitExplosionPaletteIndexTable:
; Used by HandleDeathSequenceSuitExplosion
;        _____ Timer
;       |    _ Palette table index (for SamusDeathSequencePalettePointers_Suit_power and SamusDeathSequencePalettePointers_Suitless)
;       |   |
  .timer:
    db $15                                                               ;9BB823;
  .index:
    db     $00                                                           ;9BB824;
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
    dw $0421,$0C63,$14A5,$1CE7,$2529,$2D6B,$35AD,$4210                   ;9BB835;
    dw $4A52,$4E73,$5294,$56B5,$5AD6,$5EF7,$6318,$6739                   ;9BB845;
    dw $6B5A,$6F7B,$739C,$77BD,$7BDE,$7FFF                               ;9BB855;


;;; $B861: Cancel grapple beam if in incompatible pose ;;;
CancelGrappleBeamIfInIncompatiblePose:
    LDA.W MovementType                                                   ;9BB861;
    AND.W #$00FF                                                         ;9BB864;
    TAX                                                                  ;9BB867;
    LDA.W .poses,X                                                       ;9BB868;
    AND.W #$00FF                                                         ;9BB86B;
    BEQ .grappleAllowed                                                  ;9BB86E;

  .cancelGrapple:
    LDA.W GrappleBeam_Function                                           ;9BB870;
    CMP.W #GrappleBeamFunction_Inactive                                  ;9BB873;
    BEQ .return                                                          ;9BB876;
    LDA.W #GrappleBeamFunction_HitNothing_Cancel                         ;9BB878;
    STA.W GrappleBeam_Function                                           ;9BB87B;

  .return:
    RTS                                                                  ;9BB87E;

  .grappleAllowed:
    LDA.W GrappleBeam_Function                                           ;9BB87F;
    CMP.W #GrappleBeamFunction_Inactive                                  ;9BB882;
    BEQ .return                                                          ;9BB885;
    CMP.W #GrappleBeamFunction_Connected_LockedInPlace                   ;9BB887;
    BPL .return                                                          ;9BB88A;
    LDA.W Pose                                                           ;9BB88C;
    ASL                                                                  ;9BB88F;
    ASL                                                                  ;9BB890;
    ASL                                                                  ;9BB891;
    TAX                                                                  ;9BB892;
    LDA.L PoseDefinitions_directionShotsFired,X                          ;9BB893;
    AND.W #$00FF                                                         ;9BB897;
    BIT.W #$00F0                                                         ;9BB89A;
    BNE .cancelGrapple                                                   ;9BB89D;
    CMP.W GrappleBeam_DirectionFired                                     ;9BB89F;
    BNE +                                                                ;9BB8A2;
    RTS                                                                  ;9BB8A4;

+   LDA.W GrappleBeam_PoseChangeAutoFireTimer                            ;9BB8A5;
    BEQ .cancelGrapple                                                   ;9BB8A8;
    LDA.W #$0007                                                         ;9BB8AA;
    JSL.L QueueSound_Lib1_Max6                                           ;9BB8AD;
    LDA.W #GrappleBeamFunction_Fire_GotoCancel                           ;9BB8B1;
    STA.W GrappleBeam_Function                                           ;9BB8B4;
    RTS                                                                  ;9BB8B7;

  .poses:                                                                ;9BB8B8;
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
    RTS                                                                  ;9BB8D4;

; Load direction grapple is fired from pose definitions
    LDA.W Pose                                                           ;9BB8D5;
    ASL                                                                  ;9BB8D8;
    ASL                                                                  ;9BB8D9;
    ASL                                                                  ;9BB8DA;
    TAX                                                                  ;9BB8DB;
    LDA.L PoseDefinitions_directionShotsFired,X                          ;9BB8DC;
    AND.W #$00FF                                                         ;9BB8E0;
    BIT.W #$00F0                                                         ;9BB8E3;
    BNE .return                                                          ;9BB8E6;
    CMP.W GrappleBeam_DirectionFired                                     ;9BB8E8;
    BEQ .return                                                          ;9BB8EB;
    STA.W GrappleBeam_DirectionFired                                     ;9BB8ED;

  .return:
    RTS                                                                  ;9BB8F0;


;;; $B8F1: Check if grapple is connected to block ;;;
CheckIfGrappleIsConnectedToBlock:
;; Returns:
;;     Carry: Set if grapple is connected, clear otherwise
    STZ.W GrappleBeam_ExtensionXSubVelocity                              ;9BB8F1;
    STZ.W GrappleBeam_ExtensionYSubVelocity                              ;9BB8F4;
    JSL.L BlockGrappleReaction                                           ;9BB8F7;
    BCC .returnNotConnected                                              ;9BB8FB;
    LDA.W #$0001                                                         ;9BB8FD;
    STA.W GrappleConnectedFlags                                          ;9BB900;
    SEC                                                                  ;9BB903;
    RTS                                                                  ;9BB904;

  .returnNotConnected:
    CLC                                                                  ;9BB905;
    RTS                                                                  ;9BB906;


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
    ASL                                                                  ;9BB907;
    TAX                                                                  ;9BB908;
    JMP.W (.pointers,X)                                                  ;9BB909;

  .pointers:
    dw CLCRTS_9BB91A                                                     ;9BB90C;
    dw ReturnZero_SECRTS_9BB91C                                          ;9BB90E;
    dw CLCRTS_9BB921                                                     ;9BB910;
    dw ReturnOne_SECRTS_9BB923                                           ;9BB912;
    dw ReturnZero_SECRTS_9BB928                                          ;9BB914;
    dw ReturnZero_SECRTS_9BB92D                                          ;9BB916;
    dw ProcessEnemyGrappleBeamCollisionResult_HurtSamus                  ;9BB918;


;;; $B91A: Process enemy / grapple beam collision result - grapple reaction index = 0 (default) - clear carry ;;;
CLCRTS_9BB91A:
    CLC                                                                  ;9BB91A;
    RTS                                                                  ;9BB91B;


;;; $B91C: Process enemy / grapple beam collision result - grapple reaction index = 1 (Samus latches on) - set carry, A = 0 ;;;
ReturnZero_SECRTS_9BB91C:
    LDA.W #$0000                                                         ;9BB91C;
    SEC                                                                  ;9BB91F;
    RTS                                                                  ;9BB920;


;;; $B921: Process enemy / grapple beam collision result - grapple reaction index = 2 (kill enemy) - clear carry ;;;
CLCRTS_9BB921:
    CLC                                                                  ;9BB921;
    RTS                                                                  ;9BB922;


;;; $B923: Process enemy / grapple beam collision result - grapple reaction index = 3 (cancel grapple beam) - set carry, A = 1 ;;;
ReturnOne_SECRTS_9BB923:
    LDA.W #$0001                                                         ;9BB923;
    SEC                                                                  ;9BB926;
    RTS                                                                  ;9BB927;


;;; $B928: Process enemy / grapple beam collision result - grapple reaction index = 4 (Samus latches on - no invincibility) - set carry, A = 0 ;;;
ReturnZero_SECRTS_9BB928:
    LDA.W #$0000                                                         ;9BB928;
    SEC                                                                  ;9BB92B;
    RTS                                                                  ;9BB92C;


;;; $B92D: Process enemy / grapple beam collision result - grapple reaction index = 5 (Samus latches on - paralyse enemy) - set carry, A = 0 ;;;
ReturnZero_SECRTS_9BB92D:
    LDA.W #$0000                                                         ;9BB92D;
    SEC                                                                  ;9BB930;
    RTS                                                                  ;9BB931;


;;; $B932: Process enemy / grapple beam collision result - grapple reaction index = 6 (hurt Samus) - hurt Samus, set carry, A = 1 ;;;
ProcessEnemyGrappleBeamCollisionResult_HurtSamus:
    LDX.B DP_Temp12                                                      ;9BB932;
    LDA.L EnemyHeaders_damage,X                                          ;9BB934;
    STA.B DP_Temp12                                                      ;9BB938;
    LDA.W EquippedItems                                                  ;9BB93A;
    BIT.W #$0020                                                         ;9BB93D;
    BNE .gravitySuit                                                     ;9BB940;
    LSR                                                                  ;9BB942;
    BCC .suitless                                                        ;9BB943;
    LSR.B DP_Temp12                                                      ;9BB945;

  .suitless:
    LDA.B DP_Temp12                                                      ;9BB947;
    BRA .damageSamus                                                     ;9BB949;

  .gravitySuit:
    LSR.B DP_Temp12                                                      ;9BB94B;
    LSR.B DP_Temp12                                                      ;9BB94D;
    LDA.B DP_Temp12                                                      ;9BB94F;

  .damageSamus:
    JSL.L Deal_A_Damage_to_Samus                                         ;9BB951;
    LDA.W #$0060                                                         ;9BB955;
    STA.W SamusInvincibilityTimer                                        ;9BB958;
    LDA.W #$0005                                                         ;9BB95B;
    STA.W SamusKnockbackTimer                                            ;9BB95E;
    LDA.W PoseXDirection                                                 ;9BB961;
    AND.W #$00FF                                                         ;9BB964;
    CMP.W #$0004                                                         ;9BB967;
    BEQ .facingLeft                                                      ;9BB96A;
    STZ.W KnockbackXDirection                                            ;9BB96C;
    BRA .returnOneCarrySet                                               ;9BB96F;

  .facingLeft:
    LDA.W #$0001                                                         ;9BB971;
    STA.W KnockbackXDirection                                            ;9BB974;

  .returnOneCarrySet:
    LDA.W #$0001                                                         ;9BB977;
    SEC                                                                  ;9BB97A;
    RTS                                                                  ;9BB97B;


;;; $B97C: Handle connecting grapple ;;;
HandleConnectingGrapple:
    LDA.W MovementType                                                   ;9BB97C;
    AND.W #$00FF                                                         ;9BB97F;
    CMP.W #$001A                                                         ;9BB982;
    BNE .notGrabbedByDraygon                                             ;9BB985;
    LDA.W #GrappleBeamFunction_Connected_LockedInPlace                   ;9BB987;
    STA.W GrappleBeam_Function                                           ;9BB98A;
    STZ.W GrappleBeam_LengthDelta                                        ;9BB98D;
    RTS                                                                  ;9BB990;

  .notGrabbedByDraygon:
    LDA.W GrappleBeam_DirectionFired                                     ;9BB991;
    ASL                                                                  ;9BB994;
    ASL                                                                  ;9BB995;
    TAX                                                                  ;9BB996;
    LDA.W SamusYSpeed                                                    ;9BB997;
    BNE .movingVertically                                                ;9BB99A;
    LDA.W SamusYSubSpeed                                                 ;9BB99C;
    BNE .movingVertically                                                ;9BB99F;
    LDA.W MovementType                                                   ;9BB9A1;
    AND.W #$00FF                                                         ;9BB9A4;
    CMP.W #$0005                                                         ;9BB9A7;
    BEQ .crouching                                                       ;9BB9AA;
    LDA.W ConnectingToGrappleBlockPointerTable_Default_next,X            ;9BB9AC;
    STA.W GrappleBeam_Function                                           ;9BB9AF;
    LDA.W ConnectingToGrappleBlockPointerTable_Default_function,X        ;9BB9B2;
    STA.W GrappleCollision_JumpAddress                                   ;9BB9B5;
    JMP.W (GrappleCollision_JumpAddress)                                 ;9BB9B8;

  .crouching:
    LDA.W ConnectingToGrappleBlockPointerTable_Crouching_next,X          ;9BB9BB;
    STA.W GrappleBeam_Function                                           ;9BB9BE;
    LDA.W ConnectingToGrappleBlockPointerTable_Crouching_function,X      ;9BB9C1;
    STA.W GrappleCollision_JumpAddress                                   ;9BB9C4;
    JMP.W (GrappleCollision_JumpAddress)                                 ;9BB9C7;

  .movingVertically:
    LDA.W ConnectingToGrappleBlockPointerTable_MovingVertically_next,X   ;9BB9CA;
    STA.W GrappleBeam_Function                                           ;9BB9CD;
    LDA.W ConnectingToGrappleBlockPointerTable_MovingVertically_function,X ;9BB9D0;
    STA.W GrappleCollision_JumpAddress                                   ;9BB9D3;
    JMP.W (GrappleCollision_JumpAddress)                                 ;9BB9D6;


;;; $B9D9: Handle connecting grapple - swinging clockwise ;;;
HandleConnectingGrapple_SwingingClockwise:
    LDA.W #$00B2                                                         ;9BB9D9;
    STA.W SpecialProspectivePose                                         ;9BB9DC;
    JMP.W HandleConnectingGrapple_Swinging                               ;9BB9DF;


;;; $B9E2: Handle connecting grapple - swinging anticlockwise ;;;
HandleConnectingGrapple_SwingingAntiClockwise:
    LDA.W #$00B3                                                         ;9BB9E2;
    STA.W SpecialProspectivePose                                         ;9BB9E5;
    BRA HandleConnectingGrapple_Swinging                                 ;9BB9E8;


;;; $B9EA: Handle connecting grapple - standing - aiming right ;;;
HandleConnectingGrapple_Standing_AimingRight:
    LDA.W #$00A8                                                         ;9BB9EA;
    STA.W SpecialProspectivePose                                         ;9BB9ED;
    JMP.W HandleConnectingGrapple_StuckInPlace                           ;9BB9F0;


;;; $B9F3: Handle connecting grapple - standing - aiming down-right ;;;
HandleConnectingGrapple_Standing_AimingDownRight:
    LDA.W #$00AA                                                         ;9BB9F3;
    STA.W SpecialProspectivePose                                         ;9BB9F6;
    JMP.W HandleConnectingGrapple_StuckInPlace                           ;9BB9F9;


;;; $B9FC: Handle connecting grapple - standing - aiming down-left ;;;
HandleConnectingGrapple_Standing_AimingDownLeft:
    LDA.W #$00AB                                                         ;9BB9FC;
    STA.W SpecialProspectivePose                                         ;9BB9FF;
    JMP.W HandleConnectingGrapple_StuckInPlace                           ;9BBA02;


;;; $BA05: Handle connecting grapple - standing - aiming left ;;;
HandleConnectingGrapple_Standing_AimingLeft:
    LDA.W #$00A9                                                         ;9BBA05;
    STA.W SpecialProspectivePose                                         ;9BBA08;
    JMP.W HandleConnectingGrapple_StuckInPlace                           ;9BBA0B;


;;; $BA0E: Handle connecting grapple - crouching - aiming right ;;;
HandleConnectingGrapple_Crouching_AimingRight:
    LDA.W #$00B4                                                         ;9BBA0E;
    STA.W SpecialProspectivePose                                         ;9BBA11;
    JMP.W HandleConnectingGrapple_StuckInPlace                           ;9BBA14;


;;; $BA17: Handle connecting grapple - crouching - aiming down-right ;;;
HandleConnectingGrapple_Crouching_AimingDownRight:
    LDA.W #$00B6                                                         ;9BBA17;
    STA.W SpecialProspectivePose                                         ;9BBA1A;
    JMP.W HandleConnectingGrapple_StuckInPlace                           ;9BBA1D;


;;; $BA20: Handle connecting grapple - crouching - aiming down-left ;;;
HandleConnectingGrapple_Crouching_AimingDownLeft:
    LDA.W #$00B7                                                         ;9BBA20;
    STA.W SpecialProspectivePose                                         ;9BBA23;
    JMP.W HandleConnectingGrapple_StuckInPlace                           ;9BBA26;


;;; $BA29: Handle connecting grapple - crouching - aiming left ;;;
HandleConnectingGrapple_Crouching_AimingLeft:
    LDA.W #$00B5                                                         ;9BBA29;
    STA.W SpecialProspectivePose                                         ;9BBA2C;
    BRA HandleConnectingGrapple_StuckInPlace                             ;9BBA2F;


if !FEATURE_KEEP_UNREFERENCED
;;; $BA31: Unused. Handle connecting grapple - in air - aiming right ;;;
UNUSED_HandleConnectingGrapple_InAir_AimingRight_9BBA31:
    LDA.W #$00AC                                                         ;9BBA31;
    STA.W SpecialProspectivePose                                         ;9BBA34;
    BRA HandleConnectingGrapple_StuckInPlace                             ;9BBA37;


;;; $BA39: Unused. Handle connecting grapple - in air - aiming down-right ;;;
UNUSED_HandleConnectingGrapple_InAir_AimingDownRight_9BBA39:
    LDA.W #$00B0                                                         ;9BBA39;
    STA.W SpecialProspectivePose                                         ;9BBA3C;
    BRA HandleConnectingGrapple_StuckInPlace                             ;9BBA3F;


;;; $BA41: Unused. Handle connecting grapple - in air - aiming down, facing right ;;;
UNUSED_HandleConnectingGrapple_InAir_AimingDown_FaceR_9BBA41:
    LDA.W #$00AE                                                         ;9BBA41;
    STA.W SpecialProspectivePose                                         ;9BBA44;
    BRA HandleConnectingGrapple_StuckInPlace                             ;9BBA47;


;;; $BA49: Unused. Handle connecting grapple - in air - aiming down, facing left ;;;
UNUSED_HandleConnectingGrapple_InAir_AimingDown_FaceL_9BBA49:
    LDA.W #$00AF                                                         ;9BBA49;
    STA.W SpecialProspectivePose                                         ;9BBA4C;
    BRA HandleConnectingGrapple_StuckInPlace                             ;9BBA4F;


;;; $BA51: Unused. Handle connecting grapple - in air - aiming down-left ;;;
UNUSED_HandleConnectingGrapple_InAir_AimingDownLeft_9BBA51:
    LDA.W #$00B1                                                         ;9BBA51;
    STA.W SpecialProspectivePose                                         ;9BBA54;
    BRA HandleConnectingGrapple_StuckInPlace                             ;9BBA57;


;;; $BA59: Unused. Handle connecting grapple - in air - aiming left ;;;
UNUSED_HandleConnectingGrapple_InAir_AimingLeft_9BBA59:
    LDA.W #$00AD                                                         ;9BBA59;
    STA.W SpecialProspectivePose                                         ;9BBA5C;
    BRA HandleConnectingGrapple_StuckInPlace                             ;9BBA5F;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $BA61: Handle connecting grapple - swinging ;;;
HandleConnectingGrapple_Swinging:
    LDA.W #$0009                                                         ;9BBA61;
    STA.W SpecialProspectivePoseChangeCommand                            ;9BBA64;
    LDA.W SamusXPosition                                                 ;9BBA67;
    SEC                                                                  ;9BBA6A;
    SBC.W GrappleBeam_EndXPosition                                       ;9BBA6B;
    STA.B DP_Temp12                                                      ;9BBA6E;
    LDA.W SamusYPosition                                                 ;9BBA70;
    SEC                                                                  ;9BBA73;
    SBC.W GrappleBeam_EndYPosition                                       ;9BBA74;
    STA.B DP_Temp14                                                      ;9BBA77;
    JSL.L CalculateAngleOf_12_14_Offset                                  ;9BBA79;
    XBA                                                                  ;9BBA7D;
    STA.W GrappleBeam_EndAngle                                           ;9BBA7E;
    STA.W GrappleBeam_EndAngleMirror                                     ;9BBA81;
    STZ.W GrappleBeam_LengthDelta                                        ;9BBA84;
    LDA.W GrappleBeam_Length                                             ;9BBA87;
    CMP.W #$0040                                                         ;9BBA8A;
    BMI .lessThan40                                                      ;9BBA8D;
    SEC                                                                  ;9BBA8F;
    SBC.W #$0018                                                         ;9BBA90;
    STA.W GrappleBeam_Length                                             ;9BBA93;

  .lessThan40:
    JSL.L UpdateGrappleBeamStartPositionDuringGrappleSwinging            ;9BBA96;
    RTS                                                                  ;9BBA9A;


;;; $BA9B: Handle connecting grapple - stuck in place ;;;
HandleConnectingGrapple_StuckInPlace:
    LDA.W #$000A                                                         ;9BBA9B;
    STA.W SpecialProspectivePoseChangeCommand                            ;9BBA9E;
    LDA.W SamusXPosition                                                 ;9BBAA1;
    SEC                                                                  ;9BBAA4;
    SBC.W GrappleBeam_EndXPosition                                       ;9BBAA5;
    STA.B DP_Temp12                                                      ;9BBAA8;
    LDA.W SamusYPosition                                                 ;9BBAAA;
    SEC                                                                  ;9BBAAD;
    SBC.W GrappleBeam_EndYPosition                                       ;9BBAAE;
    STA.B DP_Temp14                                                      ;9BBAB1;
    JSL.L CalculateAngleOf_12_14_Offset                                  ;9BBAB3;
    XBA                                                                  ;9BBAB7;
    STA.W GrappleBeam_EndAngle                                           ;9BBAB8;
    STA.W GrappleBeam_EndAngleMirror                                     ;9BBABB;
    STZ.W GrappleBeam_LengthDelta                                        ;9BBABE;
    LDA.W GrappleBeam_Length                                             ;9BBAC1;
    CMP.W #$0040                                                         ;9BBAC4;
    BMI .lessThan40                                                      ;9BBAC7;
    SEC                                                                  ;9BBAC9;
    SBC.W #$0018                                                         ;9BBACA;
    STA.W GrappleBeam_Length                                             ;9BBACD;

  .lessThan40:
    JSL.L UpdateGrappleBeamStartPositionDuringGrappleSwinging            ;9BBAD0;
    RTS                                                                  ;9BBAD4;


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
    LDX.W #$0046                                                         ;9BBAD5;

  .loop:
    LDA.W GrappleBeam_EndAngle                                           ;9BBAD8;
    CMP.W GrappleBeamSpecialAngles_angle,X                               ;9BBADB;
    BEQ .specialAngle                                                    ;9BBADE;
    TXA                                                                  ;9BBAE0;
    SEC                                                                  ;9BBAE1;
    SBC.W #$000A                                                         ;9BBAE2;
    TAX                                                                  ;9BBAE5;
    BPL .loop                                                            ;9BBAE6;
    CLC                                                                  ;9BBAE8;
    RTS                                                                  ;9BBAE9;

  .specialAngle:
    LDA.W GrappleBeamSpecialAngles_pose,X                                ;9BBAEA;
    STA.W SpecialProspectivePose                                         ;9BBAED;
    LDA.W GrappleBeamSpecialAngles_XOffset,X                             ;9BBAF0;
    CLC                                                                  ;9BBAF3;
    ADC.W GrappleBeam_EndXPosition                                       ;9BBAF4;
    STA.W SamusXPosition                                                 ;9BBAF7;
    LDA.W GrappleBeamSpecialAngles_YOffset,X                             ;9BBAFA;
    CLC                                                                  ;9BBAFD;
    ADC.W GrappleBeam_EndYPosition                                       ;9BBAFE;
    STA.W SamusYPosition                                                 ;9BBB01;
    LDA.W GrappleBeamSpecialAngles_grappleFunction,X                     ;9BBB04;
    STA.W GrappleBeam_Function                                           ;9BBB07;
    STZ.W SpecialProspectivePoseChangeCommand                            ;9BBB0A;
    STZ.W GrappleBeam_SlowScrollingFlag                                  ;9BBB0D;
    LDA.W SamusXPosition                                                 ;9BBB10;
    SEC                                                                  ;9BBB13;
    SBC.W SamusPreviousXPosition                                         ;9BBB14;
    BMI .checkNegativeX                                                  ;9BBB17;
    CMP.W #$000D                                                         ;9BBB19;
    BMI +                                                                ;9BBB1C;
    LDA.W SamusXPosition                                                 ;9BBB1E;
    SEC                                                                  ;9BBB21;
    SBC.W #$000C                                                         ;9BBB22;
    STA.W SamusPreviousXPosition                                         ;9BBB25;
    BRA +                                                                ;9BBB28;

  .checkNegativeX:
    CMP.W #$FFF4                                                         ;9BBB2A;
    BPL +                                                                ;9BBB2D;
    LDA.W SamusXPosition                                                 ;9BBB2F;
    CLC                                                                  ;9BBB32;
    ADC.W #$000C                                                         ;9BBB33;
    STA.W SamusPreviousXPosition                                         ;9BBB36;

+   LDA.W SamusYPosition                                                 ;9BBB39;
    SEC                                                                  ;9BBB3C;
    SBC.W SamusPreviousYPosition                                         ;9BBB3D;
    BMI .checkNegativeY                                                  ;9BBB40;
    CMP.W #$000D                                                         ;9BBB42;
    BMI .returnCarrySet                                                  ;9BBB45;
    LDA.W SamusYPosition                                                 ;9BBB47;
    SEC                                                                  ;9BBB4A;
    SBC.W #$000C                                                         ;9BBB4B;
    STA.W SamusPreviousYPosition                                         ;9BBB4E;
    BRA .returnCarrySet                                                  ;9BBB51;

  .checkNegativeY:
    CMP.W #$FFF4                                                         ;9BBB53;
    BPL .returnCarrySet                                                  ;9BBB56;
    LDA.W SamusYPosition                                                 ;9BBB58;
    CLC                                                                  ;9BBB5B;
    ADC.W #$000C                                                         ;9BBB5C;
    STA.W SamusPreviousYPosition                                         ;9BBB5F;

  .returnCarrySet:
    SEC                                                                  ;9BBB62;
    RTS                                                                  ;9BBB63;


;;; $BB64: Handle grapple d-pad input ;;;
HandleGrappleDpadInput:
    LDA.B DP_Controller1New                                              ;9BBB64;
    BIT.W #$0800                                                         ;9BBB66;
    BNE .decreaseLength                                                  ;9BBB69;
    BIT.W #$0400                                                         ;9BBB6B;
    BNE .increaseLength                                                  ;9BBB6E;

  .gotoAdjustLengthEnd:
    BRA .adjustLengthEnd                                                 ;9BBB70;

  .fullyLengthened:
    LDA.W #$0040                                                         ;9BBB72;
    STA.W GrappleBeam_Length                                             ;9BBB75;
    BRA .adjustLengthEnd                                                 ;9BBB78;

  .increaseLength:
    LDA.W GrappleBeam_Length                                             ;9BBB7A;
    CMP.W #$0040                                                         ;9BBB7D;
    BPL .fullyLengthened                                                 ;9BBB80;
    LDA.W #$0002                                                         ;9BBB82;
    STA.W GrappleBeam_LengthDelta                                        ;9BBB85;
    BRA .adjustLengthEnd                                                 ;9BBB88;

  .decreaseLength:
    LDA.W GrappleBeam_Length                                             ;9BBB8A;
    BEQ .gotoAdjustLengthEnd                                             ;9BBB8D;
    LDA.W #$0002                                                         ;9BBB8F;
    EOR.W #$FFFF                                                         ;9BBB92;
    INC                                                                  ;9BBB95;
    STA.W GrappleBeam_LengthDelta                                        ;9BBB96;

  .adjustLengthEnd:
    LDA.W GrappleBeam_EndAngle                                           ;9BBB99;
    AND.W #$FF00                                                         ;9BBB9C;
    CMP.W #$4000                                                         ;9BBB9F;
    BMI .resetAccel                                                      ;9BBBA2;
    CMP.W #$C000                                                         ;9BBBA4;
    BPL .resetAccel                                                      ;9BBBA7;
    LDA.B DP_Controller1Input                                            ;9BBBA9;
    BIT.W #$0200                                                         ;9BBBAB;
    BNE .left                                                            ;9BBBAE;
    BIT.W #$0100                                                         ;9BBBB0;
    BNE .right                                                           ;9BBBB3;

  .resetAccel:
    STZ.W GrappleBeam_SwingAngularAccelerationDueToButtonInput           ;9BBBB5;
    RTS                                                                  ;9BBBB8;

  .right:
    LDA.W GrappleBeam_EndAngle                                           ;9BBBB9;
    AND.W #$FF00                                                         ;9BBBBC;
    CMP.W #$8000                                                         ;9BBBBF;
    BNE .checkLiquidPhysics                                              ;9BBBC2;
    LDA.W GrappleBeam_SwingAngularVelocity                               ;9BBBC4;
    BNE .checkLiquidPhysics                                              ;9BBBC7;
    LDA.W #$FF00                                                         ;9BBBC9;
    STA.W GrappleBeam_SwingAngularVelocity                               ;9BBBCC;

  .checkLiquidPhysics:
    LDA.W GrappleBeam_Flags                                              ;9BBBCF;
    BEQ .minusC                                                          ;9BBBD2;
    BIT.W #$0001                                                         ;9BBBD4;
    BEQ .minusC                                                          ;9BBBD7;
    LDA.W GrappleSwingConstants_AccelerationDueToButtonInput             ;9BBBD9;
    LSR                                                                  ;9BBBDC;
    EOR.W #$FFFF                                                         ;9BBBDD;
    INC                                                                  ;9BBBE0;
    STA.W GrappleBeam_SwingAngularAccelerationDueToButtonInput           ;9BBBE1;
    RTS                                                                  ;9BBBE4;

  .minusC:
    LDA.W GrappleSwingConstants_AccelerationDueToButtonInput             ;9BBBE5;
    EOR.W #$FFFF                                                         ;9BBBE8;
    INC                                                                  ;9BBBEB;
    STA.W GrappleBeam_SwingAngularAccelerationDueToButtonInput           ;9BBBEC;
    RTS                                                                  ;9BBBEF;

  .left:
    LDA.W GrappleBeam_EndAngle                                           ;9BBBF0;
    AND.W #$FF00                                                         ;9BBBF3;
    CMP.W #$8000                                                         ;9BBBF6;
    BNE ..accellerate                                                    ;9BBBF9;
    LDA.W GrappleBeam_SwingAngularVelocity                               ;9BBBFB;
    BNE ..accellerate                                                    ;9BBBFE;
    LDA.W #$0100                                                         ;9BBC00;
    STA.W GrappleBeam_SwingAngularVelocity                               ;9BBC03;

  ..accellerate:
    LDA.W GrappleBeam_Flags                                              ;9BBC06;
    BEQ ..plusC                                                          ;9BBC09;
    BIT.W #$0001                                                         ;9BBC0B;
    BEQ ..plusC                                                          ;9BBC0E;
    LDA.W GrappleSwingConstants_AccelerationDueToButtonInput             ;9BBC10;
    LSR                                                                  ;9BBC13;
    STA.W GrappleBeam_SwingAngularAccelerationDueToButtonInput           ;9BBC14;
    RTS                                                                  ;9BBC17;

  ..plusC:
    LDA.W GrappleSwingConstants_AccelerationDueToButtonInput             ;9BBC18;
    STA.W GrappleBeam_SwingAngularAccelerationDueToButtonInput           ;9BBC1B;
    RTS                                                                  ;9BBC1E;


;;; $BC1F: Determine grapple swing angular acceleration due to angle of swing ;;;
DetermineGrappleSwingAngularAccelerationDueToAngleOfSwing:
    LDA.W GrappleBeam_EndAngle                                           ;9BBC1F;
    AND.W #$C000                                                         ;9BBC22;
    CMP.W #$C000                                                         ;9BBC25;
    BEQ .gotoUpLeft                                                      ;9BBC28;
    BIT.W #$8000                                                         ;9BBC2A;
    BNE .downLeft                                                        ;9BBC2D;
    BIT.W #$4000                                                         ;9BBC2F;
    BNE .downRight                                                       ;9BBC32;
    LDA.W GrappleSwingConstants_Deceleration                             ;9BBC34;
    LSR                                                                  ;9BBC37;
    LSR                                                                  ;9BBC38;
    STA.W GrappleBeam_SwingAngularDeceleration                           ;9BBC39;
    LDA.W GrappleBeam_Flags                                              ;9BBC3C;
    BEQ +                                                                ;9BBC3F;
    BIT.W #$0001                                                         ;9BBC41;
    BEQ +                                                                ;9BBC44;
    LDA.W GrappleSwingConstants_AccelerationDueToAngleOfSwing            ;9BBC46;
    LSR                                                                  ;9BBC49;
    LSR                                                                  ;9BBC4A;
    LSR                                                                  ;9BBC4B;
    STA.W GrappleBeam_SwingAngularAccelerationDueToAngleOfSwing          ;9BBC4C;
    RTS                                                                  ;9BBC4F;

; Up right
+   LDA.W GrappleSwingConstants_AccelerationDueToAngleOfSwing            ;9BBC50;
    LSR                                                                  ;9BBC53;
    LSR                                                                  ;9BBC54;
    STA.W GrappleBeam_SwingAngularAccelerationDueToAngleOfSwing          ;9BBC55;
    RTS                                                                  ;9BBC58;

  .gotoUpLeft:
    JMP.W .upLeft                                                        ;9BBC59;

  .downRight:
    LDA.W GrappleSwingConstants_Deceleration                             ;9BBC5C;
    STA.W GrappleBeam_SwingAngularDeceleration                           ;9BBC5F;
    LDA.W GrappleBeam_Flags                                              ;9BBC62;
    BEQ +                                                                ;9BBC65;
    BIT.W #$0001                                                         ;9BBC67;
    BEQ +                                                                ;9BBC6A;
    LDA.W GrappleSwingConstants_AccelerationDueToAngleOfSwing            ;9BBC6C;
    LSR                                                                  ;9BBC6F;
    STA.W GrappleBeam_SwingAngularAccelerationDueToAngleOfSwing          ;9BBC70;
    RTS                                                                  ;9BBC73;

+   LDA.W GrappleSwingConstants_AccelerationDueToAngleOfSwing            ;9BBC74;
    STA.W GrappleBeam_SwingAngularAccelerationDueToAngleOfSwing          ;9BBC77;
    RTS                                                                  ;9BBC7A;

  .downLeft:
    LDA.W GrappleBeam_EndAngle                                           ;9BBC7B;
    AND.W #$FF00                                                         ;9BBC7E;
    CMP.W #$8000                                                         ;9BBC81;
    BEQ .straightDown                                                    ;9BBC84;
    LDA.W GrappleSwingConstants_Deceleration                             ;9BBC86;
    EOR.W #$FFFF                                                         ;9BBC89;
    INC                                                                  ;9BBC8C;
    STA.W GrappleBeam_SwingAngularDeceleration                           ;9BBC8D;
    LDA.W GrappleBeam_Flags                                              ;9BBC90;
    BEQ +                                                                ;9BBC93;
    BIT.W #$0001                                                         ;9BBC95;
    BEQ +                                                                ;9BBC98;
    LDA.W GrappleSwingConstants_AccelerationDueToAngleOfSwing            ;9BBC9A;
    LSR                                                                  ;9BBC9D;
    EOR.W #$FFFF                                                         ;9BBC9E;
    INC                                                                  ;9BBCA1;
    STA.W GrappleBeam_SwingAngularAccelerationDueToAngleOfSwing          ;9BBCA2;
    RTS                                                                  ;9BBCA5;

+   LDA.W GrappleSwingConstants_AccelerationDueToAngleOfSwing            ;9BBCA6;
    EOR.W #$FFFF                                                         ;9BBCA9;
    INC                                                                  ;9BBCAC;
    STA.W GrappleBeam_SwingAngularAccelerationDueToAngleOfSwing          ;9BBCAD;
    RTS                                                                  ;9BBCB0;

  .straightDown:
    STZ.W GrappleBeam_SwingAngularAccelerationDueToAngleOfSwing          ;9BBCB1;
    STZ.W GrappleBeam_SwingAngularDeceleration                           ;9BBCB4;
    LDA.W GrappleBeam_SwingAngularVelocity                               ;9BBCB7;
    BPL +                                                                ;9BBCBA;
    DEC                                                                  ;9BBCBC;
    EOR.W #$FFFF                                                         ;9BBCBD;

+   XBA                                                                  ;9BBCC0;
    AND.W #$00FF                                                         ;9BBCC1;
    CMP.W #$0001                                                         ;9BBCC4;
    BMI .resetAngularVelocity                                            ;9BBCC7;
    RTS                                                                  ;9BBCC9;

  .resetAngularVelocity:
    STZ.W GrappleBeam_SwingAngularVelocity                               ;9BBCCA;
    RTS                                                                  ;9BBCCD;

  .upLeft:
    LDA.W GrappleSwingConstants_Deceleration                             ;9BBCCE;
    LSR                                                                  ;9BBCD1;
    LSR                                                                  ;9BBCD2;
    EOR.W #$FFFF                                                         ;9BBCD3;
    INC                                                                  ;9BBCD6;
    STA.W GrappleBeam_SwingAngularDeceleration                           ;9BBCD7;
    LDA.W GrappleBeam_Flags                                              ;9BBCDA;
    BEQ .minus6                                                          ;9BBCDD;
    BIT.W #$0001                                                         ;9BBCDF;
    BEQ .minus6                                                          ;9BBCE2;
    LDA.W GrappleSwingConstants_AccelerationDueToAngleOfSwing            ;9BBCE4;
    LSR                                                                  ;9BBCE7;
    LSR                                                                  ;9BBCE8;
    LSR                                                                  ;9BBCE9;
    EOR.W #$FFFF                                                         ;9BBCEA;
    INC                                                                  ;9BBCED;
    STA.W GrappleBeam_SwingAngularAccelerationDueToAngleOfSwing          ;9BBCEE;
    RTS                                                                  ;9BBCF1;

  .minus6:
    LDA.W GrappleSwingConstants_AccelerationDueToAngleOfSwing            ;9BBCF2;
    LSR                                                                  ;9BBCF5;
    LSR                                                                  ;9BBCF6;
    EOR.W #$FFFF                                                         ;9BBCF7;
    INC                                                                  ;9BBCFA;
    STA.W GrappleBeam_SwingAngularAccelerationDueToAngleOfSwing          ;9BBCFB;
    RTS                                                                  ;9BBCFE;


;;; $BCFF: Update grapple swing angular velocity ;;;
UpdateGrappleSwingAngularVelocity:
    LDA.W GrappleBeam_SwingAngularVelocity                               ;9BBCFF;
    CLC                                                                  ;9BBD02;
    ADC.W GrappleBeam_SwingAngularAccelerationDueToAngleOfSwing          ;9BBD03;
    CLC                                                                  ;9BBD06;
    ADC.W GrappleBeam_SwingAngularAccelerationDueToButtonInput           ;9BBD07;
    STA.W GrappleBeam_SwingAngularVelocity                               ;9BBD0A;
    LDA.W GrappleBeam_EndAngle                                           ;9BBD0D;
    EOR.W GrappleBeam_SwingAngularVelocity                               ;9BBD10;
    BPL .notRising                                                       ;9BBD13;
    LDA.W GrappleBeam_SwingAngularVelocity                               ;9BBD15;
    CLC                                                                  ;9BBD18;
    ADC.W GrappleBeam_SwingAngularDeceleration                           ;9BBD19;
    STA.W GrappleBeam_SwingAngularVelocity                               ;9BBD1C;

  .notRising:
    LDA.W GrappleBeam_SwingAngularVelocity                               ;9BBD1F;
    BPL .positiveAngularVelocity                                         ;9BBD22;
    EOR.W #$FFFF                                                         ;9BBD24;
    INC                                                                  ;9BBD27;
    CMP.W GrappleSwingConstants_AbsoluteAngularVelocity                  ;9BBD28;
    BCC .return                                                          ;9BBD2B;
    LDA.W GrappleSwingConstants_AbsoluteAngularVelocity                  ;9BBD2D;
    EOR.W #$FFFF                                                         ;9BBD30;
    INC                                                                  ;9BBD33;
    STA.W GrappleBeam_SwingAngularVelocity                               ;9BBD34;
    RTS                                                                  ;9BBD37;

  .positiveAngularVelocity:
    CMP.W GrappleSwingConstants_AbsoluteAngularVelocity                  ;9BBD38;
    BCC .return                                                          ;9BBD3B;
    LDA.W GrappleSwingConstants_AbsoluteAngularVelocity                  ;9BBD3D;
    STA.W GrappleBeam_SwingAngularVelocity                               ;9BBD40;

  .return:
    RTS                                                                  ;9BBD43;


;;; $BD44: Handle grapple kick ;;;
HandleGrappleKick:
    LDA.W GrappleBeam_KickCooldownTimer                                  ;9BBD44;
    BEQ .return                                                          ;9BBD47;
    LDA.B DP_Controller1New                                              ;9BBD49;
    BIT.W JumpBinding                                                    ;9BBD4B;
    BEQ .return                                                          ;9BBD4E;
    LDA.W GrappleBeam_SwingAngularVelocity                               ;9BBD50;
    BNE .nonZeroAngularVelocity                                          ;9BBD53;
    STZ.W GrappleBeam_ExtraSwingAngularVelocity                          ;9BBD55;

  .return:
    RTS                                                                  ;9BBD58;

  .nonZeroAngularVelocity:
    BMI .antiClockwise                                                   ;9BBD59;
    LDA.W GrappleBeam_Flags                                              ;9BBD5B;
    BEQ .notLiquidPhysics                                                ;9BBD5E;
    BIT.W #$0001                                                         ;9BBD60;
    BEQ .notLiquidPhysics                                                ;9BBD63;
    LDA.W GrappleSwingConstants_ExtraAngularVelocity_GrappleKick         ;9BBD65;
    LSR                                                                  ;9BBD68;
    STA.W GrappleBeam_ExtraSwingAngularVelocity                          ;9BBD69;
    RTS                                                                  ;9BBD6C;

  .notLiquidPhysics:
    LDA.W GrappleSwingConstants_ExtraAngularVelocity_GrappleKick         ;9BBD6D;
    STA.W GrappleBeam_ExtraSwingAngularVelocity                          ;9BBD70;
    RTS                                                                  ;9BBD73;

  .antiClockwise:
    LDA.W GrappleBeam_Flags                                              ;9BBD74;
    BEQ ..notLiquidPhysics                                               ;9BBD77;
    BIT.W #$0001                                                         ;9BBD79;
    BEQ ..notLiquidPhysics                                               ;9BBD7C;
    LDA.W GrappleSwingConstants_ExtraAngularVelocity_GrappleKick         ;9BBD7E;
    LSR                                                                  ;9BBD81;
    EOR.W #$FFFF                                                         ;9BBD82;
    INC                                                                  ;9BBD85;
    STA.W GrappleBeam_ExtraSwingAngularVelocity                          ;9BBD86;
    RTS                                                                  ;9BBD89;

  ..notLiquidPhysics:
    LDA.W GrappleSwingConstants_ExtraAngularVelocity_GrappleKick         ;9BBD8A;
    EOR.W #$FFFF                                                         ;9BBD8D;
    INC                                                                  ;9BBD90;
    STA.W GrappleBeam_ExtraSwingAngularVelocity                          ;9BBD91;
    RTS                                                                  ;9BBD94;


;;; $BD95: Set Samus animation frame and position during grapple swinging ;;;
SetSamusAnimationFrameAndPositionDuringGrappleSwinging:
    PHP                                                                  ;9BBD95;
    PHB                                                                  ;9BBD96;
    PHK                                                                  ;9BBD97;
    PLB                                                                  ;9BBD98;
    REP #$30                                                             ;9BBD99;
    LDA.W GrappleBeam_SwingAngularVelocity                               ;9BBD9B;
    BPL +                                                                ;9BBD9E;
    EOR.W #$FFFF                                                         ;9BBDA0;
    INC                                                                  ;9BBDA3;

+   CMP.W #$0040                                                         ;9BBDA4;
    BMI .slowGrapple                                                     ;9BBDA7;
    LDA.W #$0001                                                         ;9BBDA9;
    STA.W GrappleBeam_SlowScrollingFlag                                  ;9BBDAC;
    BRA .setSwingingAnimationFrame                                       ;9BBDAF;

  .slowGrapple:
    STZ.W GrappleBeam_SlowScrollingFlag                                  ;9BBDB1;
    LDA.W GrappleBeam_EndAngle                                           ;9BBDB4;
    AND.W #$FF00                                                         ;9BBDB7;
    CMP.W #$8000                                                         ;9BBDBA;
    BNE .setSwingingAnimationFrame                                       ;9BBDBD;
    LDA.W SamusAnimationFrame                                            ;9BBDBF;
    CMP.W #$0040                                                         ;9BBDC2;
    BPL .straightDown                                                    ;9BBDC5;
    LDA.W #$0008                                                         ;9BBDC7;
    STA.W SamusAnimationFrameTimer                                       ;9BBDCA;
    LDA.W #$0040                                                         ;9BBDCD;
    STA.W SamusAnimationFrame                                            ;9BBDD0;

  .straightDown:
    LDA.W GrappleBeam_EndAngleMirror+1                                   ;9BBDD3;
    AND.W #$00FF                                                         ;9BBDD6;
    TAX                                                                  ;9BBDD9;
    LDA.W GrappleSwingSamusXYOffsets,X                                   ;9BBDDA;
    AND.W #$00FF                                                         ;9BBDDD;
    BRA .merge                                                           ;9BBDE0;

  .setSwingingAnimationFrame:
    LDA.W #$000F                                                         ;9BBDE2;
    STA.W SamusAnimationFrameTimer                                       ;9BBDE5;
    LDA.W GrappleBeam_EndAngleMirror+1                                   ;9BBDE8;
    AND.W #$00FF                                                         ;9BBDEB;
    TAX                                                                  ;9BBDEE;
    LDA.W GrappleSwingSamusXYOffsets,X                                   ;9BBDEF;
    AND.W #$00FF                                                         ;9BBDF2;
    STA.W SamusAnimationFrame                                            ;9BBDF5;

  .merge:
    ASL                                                                  ;9BBDF8;
    TAX                                                                  ;9BBDF9;
    LDA.W GrappleBeam_ExtraSwingAngularVelocity                          ;9BBDFA;
    BPL +                                                                ;9BBDFD;
    EOR.W #$FFFF                                                         ;9BBDFF;
    INC                                                                  ;9BBE02;

+   AND.W #$FF00                                                         ;9BBE03;
    CMP.W #$0100                                                         ;9BBE06;
    BNE .notGrappleKicking                                               ;9BBE09;
    LDA.W SamusAnimationFrame                                            ;9BBE0B;
    CMP.W #$0040                                                         ;9BBE0E;
    BMI .grappleKicking                                                  ;9BBE11;
    LDA.W #$0010                                                         ;9BBE13;

  .grappleKicking:
    CLC                                                                  ;9BBE16;
    ADC.W #$0020                                                         ;9BBE17;
    STA.W SamusAnimationFrame                                            ;9BBE1A;

  .notGrappleKicking:
    LDA.W PoseXDirection                                                 ;9BBE1D;
    AND.W #$00FF                                                         ;9BBE20;
    CMP.W #$0004                                                         ;9BBE23;
    BEQ .right                                                           ;9BBE26;
    LDA.W GrappleSwingSamusXYOffsets_Right-1,X                           ;9BBE28;
    AND.W #$FF00                                                         ;9BBE2B;
    XBA                                                                  ;9BBE2E;
    BPL +                                                                ;9BBE2F;
    ORA.W #$FF00                                                         ;9BBE31;

+   CLC                                                                  ;9BBE34;
    ADC.W GrappleBeam_StartXPosition                                     ;9BBE35;
    STA.W SamusXPosition                                                 ;9BBE38;
    LDA.W GrappleSwingSamusXYOffsets_Right,X                             ;9BBE3B;
    AND.W #$FF00                                                         ;9BBE3E;
    XBA                                                                  ;9BBE41;
    BPL +                                                                ;9BBE42;
    ORA.W #$FF00                                                         ;9BBE44;

+   CLC                                                                  ;9BBE47;
    ADC.W GrappleBeam_StartYPosition                                     ;9BBE48;
    STA.W SamusYPosition                                                 ;9BBE4B;
    LDA.W GrappleBeam_StartXPosition                                     ;9BBE4E;
    STA.W GrappleBeam_FlareXPosition                                     ;9BBE51;
    LDA.W GrappleBeam_StartYPosition                                     ;9BBE54;
    STA.W GrappleBeam_FlareYPosition                                     ;9BBE57;
    JSR.W ClampScrollingSpeed                                            ;9BBE5A;
    PLB                                                                  ;9BBE5D;
    PLP                                                                  ;9BBE5E;
    RTL                                                                  ;9BBE5F;

  .right:
    LDA.W GrappleSwingSamusXYOffsets_Left-1,X                            ;9BBE60;
    AND.W #$FF00                                                         ;9BBE63;
    XBA                                                                  ;9BBE66;
    BPL +                                                                ;9BBE67;
    ORA.W #$FF00                                                         ;9BBE69;

+   CLC                                                                  ;9BBE6C;
    ADC.W GrappleBeam_StartXPosition                                     ;9BBE6D;
    STA.W SamusXPosition                                                 ;9BBE70;
    LDA.W GrappleSwingSamusXYOffsets_Left,X                              ;9BBE73;
    AND.W #$FF00                                                         ;9BBE76;
    XBA                                                                  ;9BBE79;
    BPL +                                                                ;9BBE7A;
    ORA.W #$FF00                                                         ;9BBE7C;

+   CLC                                                                  ;9BBE7F;
    ADC.W GrappleBeam_StartYPosition                                     ;9BBE80;
    STA.W SamusYPosition                                                 ;9BBE83;
    LDA.W GrappleBeam_StartXPosition                                     ;9BBE86;
    STA.W GrappleBeam_FlareXPosition                                     ;9BBE89;
    LDA.W GrappleBeam_StartYPosition                                     ;9BBE8C;
    STA.W GrappleBeam_FlareYPosition                                     ;9BBE8F;
    JSR.W ClampScrollingSpeed                                            ;9BBE92;
    PLB                                                                  ;9BBE95;
    PLP                                                                  ;9BBE96;
    RTL                                                                  ;9BBE97;


;;; $BE98: Clamp scrolling speed ;;;
ClampScrollingSpeed:
    LDA.W SamusXPosition                                                 ;9BBE98;
    SEC                                                                  ;9BBE9B;
    SBC.W SamusPreviousXPosition                                         ;9BBE9C;
    BMI +                                                                ;9BBE9F;
    CMP.W #$000D                                                         ;9BBEA1;
    BMI .previousY                                                       ;9BBEA4;
    LDA.W SamusXPosition                                                 ;9BBEA6;
    SEC                                                                  ;9BBEA9;
    SBC.W #$000C                                                         ;9BBEAA;
    STA.W SamusPreviousXPosition                                         ;9BBEAD;
    BRA .previousY                                                       ;9BBEB0;

+   CMP.W #$FFF4                                                         ;9BBEB2;
    BPL .previousY                                                       ;9BBEB5;
    LDA.W SamusXPosition                                                 ;9BBEB7;
    CLC                                                                  ;9BBEBA;
    ADC.W #$000C                                                         ;9BBEBB;
    STA.W SamusPreviousXPosition                                         ;9BBEBE;

  .previousY:
    LDA.W SamusYPosition                                                 ;9BBEC1;
    SEC                                                                  ;9BBEC4;
    SBC.W SamusPreviousYPosition                                         ;9BBEC5;
    BMI +                                                                ;9BBEC8;
    CMP.W #$000D                                                         ;9BBECA;
    BMI .return                                                          ;9BBECD;
    LDA.W SamusYPosition                                                 ;9BBECF;
    SEC                                                                  ;9BBED2;
    SBC.W #$000C                                                         ;9BBED3;
    STA.W SamusPreviousYPosition                                         ;9BBED6;
    BRA .return                                                          ;9BBED9;

+   CMP.W #$FFF4                                                         ;9BBEDB;
    BPL .return                                                          ;9BBEDE;
    LDA.W SamusYPosition                                                 ;9BBEE0;
    CLC                                                                  ;9BBEE3;
    ADC.W #$000C                                                         ;9BBEE4;
    STA.W SamusPreviousYPosition                                         ;9BBEE7;

  .return:
    RTS                                                                  ;9BBEEA;


;;; $BEEB: Set Samus animation frame and position for connecting grapple stuck in place ;;;
SetSamusAnimationFrameAndPositionForConnectingGrapple_Stuck:
    PHP                                                                  ;9BBEEB;
    PHB                                                                  ;9BBEEC;
    PHK                                                                  ;9BBEED;
    PLB                                                                  ;9BBEEE;
    REP #$30                                                             ;9BBEEF;
    LDA.W GrappleBeam_DirectionFired                                     ;9BBEF1;
    ASL                                                                  ;9BBEF4;
    TAX                                                                  ;9BBEF5;
    LDA.W GrappleBeam_StartXPosition                                     ;9BBEF6;
    SEC                                                                  ;9BBEF9;
    SBC.W GrappleBeamFireOffsets_NotRunning_OriginX,X                    ;9BBEFA;
    STA.W SamusXPosition                                                 ;9BBEFD;
    CLC                                                                  ;9BBF00;
    ADC.W GrappleBeamFireOffsets_NotRunning_FlareX,X                     ;9BBF01;
    STA.W GrappleBeam_FlareXPosition                                     ;9BBF04;
    LDA.W GrappleBeam_StartYPosition                                     ;9BBF07;
    SEC                                                                  ;9BBF0A;
    SBC.W GrappleBeamFireOffsets_NotRunning_OriginY,X                    ;9BBF0B;
    STA.W SamusYPosition                                                 ;9BBF0E;
    CLC                                                                  ;9BBF11;
    ADC.W GrappleBeamFireOffsets_NotRunning_FlareY,X                     ;9BBF12;
    STA.W GrappleBeam_FlareYPosition                                     ;9BBF15;
    PLB                                                                  ;9BBF18;
    PLP                                                                  ;9BBF19;
    RTL                                                                  ;9BBF1A;


;;; $BF1B: Update grapple beam start position during grapple fire ;;;
UpdateGrappleBeamStartPositionDuringGrappleFire:
    PHP                                                                  ;9BBF1B;
    PHB                                                                  ;9BBF1C;
    PHK                                                                  ;9BBF1D;
    PLB                                                                  ;9BBF1E;
    REP #$30                                                             ;9BBF1F;
    LDA.W Pose                                                           ;9BBF21;
    ASL                                                                  ;9BBF24;
    ASL                                                                  ;9BBF25;
    ASL                                                                  ;9BBF26;
    TAX                                                                  ;9BBF27;
    LDA.L PoseDefinitions_YOffset,X                                      ;9BBF28;
    AND.W #$00FF                                                         ;9BBF2C;
    STA.B DP_Temp16                                                      ;9BBF2F;
    LDA.W GrappleBeam_DirectionFired                                     ;9BBF31;
    ASL                                                                  ;9BBF34;
    TAX                                                                  ;9BBF35;
    LDA.W Pose                                                           ;9BBF36;
    CMP.W #$0049                                                         ;9BBF39;
    BEQ .moonwalking                                                     ;9BBF3C;
    CMP.W #$004A                                                         ;9BBF3E;
    BEQ .moonwalking                                                     ;9BBF41;
    LDA.W MovementType                                                   ;9BBF43;
    AND.W #$00FF                                                         ;9BBF46;
    CMP.W #$0001                                                         ;9BBF49;
    BEQ .running                                                         ;9BBF4C;

  .moonwalking:
    LDA.W SamusXPosition                                                 ;9BBF4E;
    PHA                                                                  ;9BBF51;
    CLC                                                                  ;9BBF52;
    ADC.W GrappleBeamFireOffsets_NotRunning_OriginX,X                    ;9BBF53;
    STA.W GrappleBeam_StartXPosition                                     ;9BBF56;
    PLA                                                                  ;9BBF59;
    CLC                                                                  ;9BBF5A;
    ADC.W GrappleBeamFireOffsets_NotRunning_FlareX,X                     ;9BBF5B;
    STA.W GrappleBeam_FlareXPosition                                     ;9BBF5E;
    LDA.W SamusYPosition                                                 ;9BBF61;
    SEC                                                                  ;9BBF64;
    SBC.B DP_Temp16                                                      ;9BBF65;
    PHA                                                                  ;9BBF67;
    CLC                                                                  ;9BBF68;
    ADC.W GrappleBeamFireOffsets_NotRunning_OriginY,X                    ;9BBF69;
    STA.W GrappleBeam_StartYPosition                                     ;9BBF6C;
    PLA                                                                  ;9BBF6F;
    CLC                                                                  ;9BBF70;
    ADC.W GrappleBeamFireOffsets_NotRunning_FlareY,X                     ;9BBF71;
    STA.W GrappleBeam_FlareYPosition                                     ;9BBF74;
    BRA .return                                                          ;9BBF77;

  .running:
    LDA.W SamusXPosition                                                 ;9BBF79;
    PHA                                                                  ;9BBF7C;
    CLC                                                                  ;9BBF7D;
    ADC.W GrappleBeamFireOffsets_Running_OriginX,X                       ;9BBF7E;
    STA.W GrappleBeam_StartXPosition                                     ;9BBF81;
    PLA                                                                  ;9BBF84;
    CLC                                                                  ;9BBF85;
    ADC.W GrappleBeamFireOffsets_Running_FlareX,X                        ;9BBF86;
    STA.W GrappleBeam_FlareXPosition                                     ;9BBF89;
    LDA.W SamusYPosition                                                 ;9BBF8C;
    SEC                                                                  ;9BBF8F;
    SBC.B DP_Temp16                                                      ;9BBF90;
    PHA                                                                  ;9BBF92;
    CLC                                                                  ;9BBF93;
    ADC.W GrappleBeamFireOffsets_Running_OriginY,X                       ;9BBF94;
    STA.W GrappleBeam_StartYPosition                                     ;9BBF97;
    PLA                                                                  ;9BBF9A;
    CLC                                                                  ;9BBF9B;
    ADC.W GrappleBeamFireOffsets_Running_FlareY,X                        ;9BBF9C;
    STA.W GrappleBeam_FlareYPosition                                     ;9BBF9F;

  .return:
    PLB                                                                  ;9BBFA2;
    PLP                                                                  ;9BBFA3;
    RTL                                                                  ;9BBFA4;


;;; $BFA5: Update grapple beam tiles and increment flare counter ;;;
UpdateGrappleBeamTiles_IncrementFlareCounter:
    PHP                                                                  ;9BBFA5;
    PHB                                                                  ;9BBFA6;
    PHK                                                                  ;9BBFA7;
    PLB                                                                  ;9BBFA8;
    REP #$30                                                             ;9BBFA9;
    JSR.W UpdateGrappleBeamTiles                                         ;9BBFAB;
    LDA.W SamusProjectile_FlareCounter                                   ;9BBFAE;
    CMP.W #$0078                                                         ;9BBFB1;
    BPL .return                                                          ;9BBFB4;
    INC                                                                  ;9BBFB6;
    STA.W SamusProjectile_FlareCounter                                   ;9BBFB7;

  .return:
    PLB                                                                  ;9BBFBA;
    PLP                                                                  ;9BBFBB;
    RTL                                                                  ;9BBFBC;


;;; $BFBD: Update grapple beam tiles ;;;
UpdateGrappleBeamTiles:
    LDA.W GrappleBeam_StartAnimationTimer                                ;9BBFBD;
    DEC                                                                  ;9BBFC0;
    STA.W GrappleBeam_StartAnimationTimer                                ;9BBFC1;
    BPL .timerNotExpired                                                 ;9BBFC4;
    LDA.W #$0005*!FPS                                                    ;9BBFC6;
    STA.W GrappleBeam_StartAnimationTimer                                ;9BBFC9;
    LDA.W GrappleBeam_StartAnimationTilePointer                          ;9BBFCC;
    CLC                                                                  ;9BBFCF;
    ADC.W #$0200                                                         ;9BBFD0;
    STA.W GrappleBeam_StartAnimationTilePointer                          ;9BBFD3;
    CMP.W GrappleBeamStartTilesBeginEndPointers_1                        ;9BBFD6;
    BMI .timerNotExpired                                                 ;9BBFD9;
    LDA.W GrappleBeamStartTilesBeginEndPointers_0                        ;9BBFDB;
    STA.W GrappleBeam_StartAnimationTilePointer                          ;9BBFDE;

  .timerNotExpired:
    LDX.W VRAMWriteStack                                                 ;9BBFE1;
    LDA.W #$0020                                                         ;9BBFE4;
    STA.B VRAMWrite.size,X                                               ;9BBFE7;
    INX                                                                  ;9BBFE9;
    INX                                                                  ;9BBFEA;
    LDA.W GrappleBeam_StartAnimationTilePointer                          ;9BBFEB;
    STA.B VRAMWrite.size,X                                               ;9BBFEE;
    INX                                                                  ;9BBFF0;
    INX                                                                  ;9BBFF1;
    SEP #$20                                                             ;9BBFF2;
    LDA.B #Tiles_GrappleBeam_Horizontal_Beam>>16                         ;9BBFF4;
    STA.B VRAMWrite.size,X                                               ;9BBFF6;
    REP #$20                                                             ;9BBFF8;
    INX                                                                  ;9BBFFA;
    LDA.W #$6200                                                         ;9BBFFB;
    STA.B VRAMWrite.size,X                                               ;9BBFFE;
    INX                                                                  ;9BC000;
    INX                                                                  ;9BC001;
    STX.W VRAMWriteStack                                                 ;9BC002;
    LDA.W GrappleBeam_EndAngle                                           ;9BC005;
    AND.W #$FF00                                                         ;9BC008;
    XBA                                                                  ;9BC00B;
    LSR                                                                  ;9BC00C;
    AND.W #$00FE                                                         ;9BC00D;
    TAY                                                                  ;9BC010;
    LDX.W VRAMWriteStack                                                 ;9BC011;
    LDA.W #$0080                                                         ;9BC014;
    STA.B VRAMWrite.size,X                                               ;9BC017;
    INX                                                                  ;9BC019;
    INX                                                                  ;9BC01A;
    LDA.W GrappleBeamTilesPointers,Y                                     ;9BC01B;
    STA.B VRAMWrite.size,X                                               ;9BC01E;
    INX                                                                  ;9BC020;
    INX                                                                  ;9BC021;
    SEP #$20                                                             ;9BC022;
    LDA.B #Tiles_GrappleBeam_Horizontal_Beam>>16                         ;9BC024;
    STA.B VRAMWrite.size,X                                               ;9BC026;
    REP #$20                                                             ;9BC028;
    INX                                                                  ;9BC02A;
    LDA.W #$6210                                                         ;9BC02B;
    STA.B VRAMWrite.size,X                                               ;9BC02E;
    INX                                                                  ;9BC030;
    INX                                                                  ;9BC031;
    STX.W VRAMWriteStack                                                 ;9BC032;
    RTS                                                                  ;9BC035;


;;; $C036: Handle grapple beam flare ;;;
HandleGrappleBeamFlare:
    PHP                                                                  ;9BC036;
    PHB                                                                  ;9BC037;
    PHK                                                                  ;9BC038;
    PLB                                                                  ;9BC039;
    REP #$30                                                             ;9BC03A;
    LDA.W SamusProjectile_FlareCounter                                   ;9BC03C;
    BNE .nonZeroCounter                                                  ;9BC03F;
    PLB                                                                  ;9BC041;
    PLP                                                                  ;9BC042;
    RTL                                                                  ;9BC043;

  .nonZeroCounter:
    CMP.W #$0001                                                         ;9BC044;
    BNE .greaterThan1                                                    ;9BC047;
    LDA.W #$0010                                                         ;9BC049;
    STA.W SamusProjectile_FlareAnimationFrame                            ;9BC04C;
    LDA.W #$0003                                                         ;9BC04F;
    STA.W SamusProjectile_FlareAnimationTimer                            ;9BC052;

  .greaterThan1:
    LDA.W SamusProjectile_FlareAnimationTimer                            ;9BC055;
    DEC                                                                  ;9BC058;
    STA.W SamusProjectile_FlareAnimationTimer                            ;9BC059;
    BPL .positive                                                        ;9BC05C;
    LDA.W SamusProjectile_FlareAnimationFrame                            ;9BC05E;
    INC                                                                  ;9BC061;
    STA.W SamusProjectile_FlareAnimationFrame                            ;9BC062;
    TAX                                                                  ;9BC065;
    LDA.L FlareAnimationDelays_MainFlare,X                               ;9BC066;
    AND.W #$00FF                                                         ;9BC06A;
    CMP.W #$00FE                                                         ;9BC06D;
    BEQ .frameFE                                                         ;9BC070;
    BRA .setAnimationTimer                                               ;9BC072;

  .frameFE:
    INX                                                                  ;9BC074;
    LDA.L FlareAnimationDelays_MainFlare,X                               ;9BC075;
    AND.W #$00FF                                                         ;9BC079;
    STA.B DP_Temp12                                                      ;9BC07C;
    LDA.W SamusProjectile_FlareAnimationFrame                            ;9BC07E;
    SEC                                                                  ;9BC081;
    SBC.B DP_Temp12                                                      ;9BC082;
    STA.W SamusProjectile_FlareAnimationFrame                            ;9BC084;
    TAX                                                                  ;9BC087;

  .setAnimationTimer:
    LDA.L FlareAnimationDelays_MainFlare,X                               ;9BC088;
    AND.W #$00FF                                                         ;9BC08C;
    STA.W SamusProjectile_FlareAnimationTimer                            ;9BC08F;

  .positive:
    LDA.W PoseXDirection                                                 ;9BC092;
    AND.W #$00FF                                                         ;9BC095;
    CMP.W #$0004                                                         ;9BC098;
    BEQ .facingLeft                                                      ;9BC09B;
    LDA.L FlareSpritemapTable_IndexOffsets_facingRight                   ;9BC09D;
    CLC                                                                  ;9BC0A1;
    ADC.W SamusProjectile_FlareAnimationFrame                            ;9BC0A2;
    STA.B DP_Temp16                                                      ;9BC0A5;
    BRA +                                                                ;9BC0A7;

  .facingLeft:
    LDA.L FlareSpritemapTable_IndexOffsets_facingLeft                    ;9BC0A9;
    CLC                                                                  ;9BC0AD;
    ADC.W SamusProjectile_FlareAnimationFrame                            ;9BC0AE;
    STA.B DP_Temp16                                                      ;9BC0B1;

+   LDA.W GrappleBeam_FlareXPosition                                     ;9BC0B3;
    SEC                                                                  ;9BC0B6;
    SBC.W Layer1XPosition                                                ;9BC0B7;
    STA.B DP_Temp14                                                      ;9BC0BA;
    LDA.W GrappleBeam_FlareYPosition                                     ;9BC0BC;
    SEC                                                                  ;9BC0BF;
    SBC.W Layer1YPosition                                                ;9BC0C0;
    STA.B DP_Temp12                                                      ;9BC0C3;
    AND.W #$FF00                                                         ;9BC0C5;
    BNE +                                                                ;9BC0C8;
    LDA.B DP_Temp16                                                      ;9BC0CA;
    JSL.L AddSpritemapFrom_93A1A1_TableToOAM                             ;9BC0CC;
    BRA .return                                                          ;9BC0D0;

+   LDA.B DP_Temp16                                                      ;9BC0D2;
    JSL.L RTL_818AB7                                                     ;9BC0D4;

  .return:
    PLB                                                                  ;9BC0D8;
    PLP                                                                  ;9BC0D9;
    RTL                                                                  ;9BC0DA;


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
  .X:                                                                    ;9BC0DB;
; Grapple beam extension X velocity * 100h (must be multiple of 4)
    dw $0000,$087C,$0BF4,$087C,$0000,$0000,$F784,$F40C,$F784,$0000

  .Y:                                                                    ;9BC0EF;
; Grapple beam extension X velocity * 100h (must be multiple of 4)
    dw $F40C,$F784,$0000,$087C,$0BF4,$0BF4,$087C,$0000,$F784,$F40C


if !FEATURE_KEEP_UNREFERENCED
;;; $C103: Unused ;;;
UNUSED_9BC103:
    db $80                                                               ;9BC103;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C104: Grapple beam fire angles ;;;
GrappleBeamFireAngles:                                                   ;9BC104;
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
    dw $0018*!SPF                                                        ;9BC118;

GrappleSwingConstants_AccelerationDueToButtonInput:
; Grapple swing Samus base acceleration due to button input
    dw $000C*!SPF                                                        ;9BC11A;

GrappleSwingConstants_Deceleration:
; Grapple swing Samus base deceleration
    dw $0005*!SPF                                                        ;9BC11C;

GrappleSwingConstants_AbsoluteAngularVelocity:
; Absolute grapple swing angular velocity
    dw $0480*!SPF                                                        ;9BC11E;

GrappleSwingConstants_ExtraAngularVelocity_GrappleKick:
; Extra grapple swing angular velocity (for grapple kick)
    dw $0300*!SPF                                                        ;9BC120;


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
GrappleBeamFireOffsets_NotRunning_OriginX:                               ;9BC122;
    dw $0002,$000A,$0002,$000A,$0003,$FFFC,$FFF6,$FFFE,$FFF6,$FFFE

GrappleBeamFireOffsets_NotRunning_OriginY:                               ;9BC136;
    dw $FFF0,$FFF4,$0002,$0000,$0006,$0006,$0000,$0002,$FFF4,$FFF0

GrappleBeamFireOffsets_NotRunning_FlareX:                                ;9BC14A;
    dw $0002,$0012,$000F,$0011,$0003,$FFFC,$FFEF,$FFF1,$FFEE,$FFFE

GrappleBeamFireOffsets_NotRunning_FlareY:                                ;9BC15E;
    dw $FFE4,$FFED,$0001,$0006,$0011,$0011,$0006,$0001,$FFEC,$FFE4

GrappleBeamFireOffsets_Running_OriginX:                                  ;9BC172;
    dw $0002,$000A,$0002,$000A,$0003,$FFFC,$FFF6,$FFFE,$FFF6,$FFFE

GrappleBeamFireOffsets_Running_OriginY:                                  ;9BC186;
    dw $FFF0,$FFF4,$FFFE,$0000,$0006,$0006,$0000,$FFFE,$FFF4,$FFF0

GrappleBeamFireOffsets_Running_FlareX:                                   ;9BC19A;
    dw $0002,$0013,$0014,$0012,$0003,$FFFC,$FFEE,$FFEC,$FFED,$FFFE

GrappleBeamFireOffsets_Running_FlareY:                                   ;9BC1AE;
    dw $FFE0,$FFEA,$FFFD,$0006,$0019,$0019,$0006,$FFFD,$FFEC,$FFE0


;;; $C1C2: Grapple swing Samus X/Y offsets ;;;
GrappleSwingSamusXYOffsets:
; Indices into $C2C2/C302 tables. Indexed by [grapple beam end angle] / 100h
    db $00,$00,$00,$00,$01,$01,$01,$01,$01,$01,$01,$01,$02,$02,$02,$02   ;9BC1C2;
    db $02,$02,$02,$02,$03,$03,$03,$03,$03,$03,$03,$03,$04,$04,$04,$04   ;9BC1D2;
    db $04,$04,$04,$04,$05,$05,$05,$05,$05,$05,$05,$05,$06,$06,$06,$06   ;9BC1E2;
    db $06,$06,$06,$06,$07,$07,$07,$07,$07,$07,$07,$07,$08,$08,$08,$08   ;9BC1F2;
    db $08,$08,$08,$08,$09,$09,$09,$09,$09,$09,$09,$09,$0A,$0A,$0A,$0A   ;9BC202;
    db $0A,$0A,$0A,$0A,$0B,$0B,$0B,$0B,$0B,$0B,$0B,$0B,$0C,$0C,$0C,$0C   ;9BC212;
    db $0C,$0C,$0C,$0C,$0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D,$0E,$0E,$0E,$0E   ;9BC222;
    db $0E,$0E,$0E,$0E,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$10,$10,$10,$10   ;9BC232;
    db $10,$10,$10,$10,$11,$11,$11,$11,$11,$11,$11,$11,$12,$12,$12,$12   ;9BC242;
    db $12,$12,$12,$12,$13,$13,$13,$13,$13,$13,$13,$13,$14,$14,$14,$14   ;9BC252;
    db $14,$14,$14,$14,$15,$15,$15,$15,$15,$15,$15,$15,$16,$16,$16,$16   ;9BC262;
    db $16,$16,$16,$16,$17,$17,$17,$17,$17,$17,$17,$17,$18,$18,$18,$18   ;9BC272;
    db $18,$18,$18,$18,$19,$19,$19,$19,$19,$19,$19,$19,$1A,$1A,$1A,$1A   ;9BC282;
    db $1A,$1A,$1A,$1A,$1B,$1B,$1B,$1B,$1B,$1B,$1B,$1B,$1C,$1C,$1C,$1C   ;9BC292;
    db $1C,$1C,$1C,$1C,$1D,$1D,$1D,$1D,$1D,$1D,$1D,$1D,$1E,$1E,$1E,$1E   ;9BC2A2;
    db $1E,$1E,$1E,$1E,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$00,$00,$00,$00   ;9BC2B2;

; X/Y offsets of Samus from grapple beam start position
GrappleSwingSamusXYOffsets_Left:
; Swinging left
    db $00,$F1, $07,$F2, $0C,$F5, $12,$F6, $16,$FA, $1A,$02, $1D,$05, $1F,$0A ;9BC2C2;
    db $1F,$11, $1E,$16, $1B,$1B, $1A,$1F, $15,$26, $10,$29, $10,$2C, $08,$2E ;9BC2D2;
    db $00,$2F, $F9,$2E, $F4,$2B, $EE,$2A, $EA,$26, $E6,$1E, $E3,$1B, $E1,$16 ;9BC2E2;
    db $E1,$0F, $E2,$0A, $E5,$05, $E6,$01, $EB,$FA, $F0,$F7, $F0,$F4, $F8,$F2 ;9BC2F2;

GrappleSwingSamusXYOffsets_Right:
; Swinging right
    db $00,$F2, $09,$F3, $10,$F6, $12,$F8, $15,$FB, $1A,$02, $1C,$06, $1E,$0A ;9BC302;
    db $1E,$10, $1E,$17, $1B,$1C, $1A,$21, $15,$25, $10,$29, $0B,$2B, $05,$2D ;9BC312;
    db $00,$2E, $F7,$2D, $F0,$2A, $EE,$28, $EB,$25, $E6,$1E, $E4,$1A, $E2,$16 ;9BC322;
    db $E1,$0F, $E2,$09, $E5,$04, $E6,$FF, $EB,$FB, $F0,$F7, $F5,$F5, $FB,$F3 ;9BC332;


;;; $C342: Grapple beam start tiles begin/end pointers ;;;
; Bank $9A
GrappleBeamStartTilesBeginEndPointers_0:
    dw Tiles_GrappleBeam_Horizontal_Beam                                 ;9BC342;

GrappleBeamStartTilesBeginEndPointers_1:
    dw Tiles_GrappleBeam_Diagonal_Beam                                   ;9BC344;


;;; $C346: Grapple beam tiles pointers ;;;
GrappleBeamTilesPointers:
; Bank $9A
    dw Tiles_GrappleBeam_Vertical_Beam+$20                               ;9BC346;
    dw Tiles_GrappleBeam_Vertical_Beam+$20                               ;9BC348;
    dw Tiles_GrappleBeam_Vertical_Beam+$20                               ;9BC34A;
    dw Tiles_GrappleBeam_Diagonal_Beam+$20                               ;9BC34C;
    dw Tiles_GrappleBeam_Diagonal_Beam+$20                               ;9BC34E;
    dw Tiles_GrappleBeam_Diagonal_Beam+$20                               ;9BC350;
    dw Tiles_GrappleBeam_Diagonal_Beam+$20                               ;9BC352;
    dw Tiles_GrappleBeam_Diagonal_Beam+$20                               ;9BC354;
    dw Tiles_GrappleBeam_Diagonal_Beam+$20                               ;9BC356;
    dw Tiles_GrappleBeam_Diagonal_Beam+$20                               ;9BC358;
    dw Tiles_GrappleBeam_Diagonal_Beam+$20                               ;9BC35A;
    dw Tiles_GrappleBeam_Horizontal_Beam+$20                             ;9BC35C;
    dw Tiles_GrappleBeam_Horizontal_Beam+$20                             ;9BC35E;
    dw Tiles_GrappleBeam_Horizontal_Beam+$20                             ;9BC360;
    dw Tiles_GrappleBeam_Horizontal_Beam+$20                             ;9BC362;
    dw Tiles_GrappleBeam_Horizontal_Beam+$20                             ;9BC364;
    dw Tiles_GrappleBeam_Horizontal_Beam+$20                             ;9BC366;
    dw Tiles_GrappleBeam_Horizontal_Beam+$20                             ;9BC368;
    dw Tiles_GrappleBeam_Horizontal_Beam+$20                             ;9BC36A;
    dw Tiles_GrappleBeam_Horizontal_Beam+$20                             ;9BC36C;
    dw Tiles_GrappleBeam_Horizontal_Beam+$20                             ;9BC36E;
    dw Tiles_GrappleBeam_Diagonal_Beam+$20                               ;9BC370;
    dw Tiles_GrappleBeam_Diagonal_Beam+$20                               ;9BC372;
    dw Tiles_GrappleBeam_Diagonal_Beam+$20                               ;9BC374;
    dw Tiles_GrappleBeam_Diagonal_Beam+$20                               ;9BC376;
    dw Tiles_GrappleBeam_Diagonal_Beam+$20                               ;9BC378;
    dw Tiles_GrappleBeam_Diagonal_Beam+$20                               ;9BC37A;
    dw Tiles_GrappleBeam_Diagonal_Beam+$20                               ;9BC37C;
    dw Tiles_GrappleBeam_Diagonal_Beam+$20                               ;9BC37E;
    dw Tiles_GrappleBeam_Vertical_Beam+$20                               ;9BC380;
    dw Tiles_GrappleBeam_Vertical_Beam+$20                               ;9BC382;
    dw Tiles_GrappleBeam_Vertical_Beam+$20                               ;9BC384;
    dw Tiles_GrappleBeam_Vertical_Beam+$20                               ;9BC386;
    dw Tiles_GrappleBeam_Vertical_Beam+$20                               ;9BC388;
    dw Tiles_GrappleBeam_Vertical_Beam+$20                               ;9BC38A;
    dw Tiles_GrappleBeam_Diagonal_Beam+$20                               ;9BC38C;
    dw Tiles_GrappleBeam_Diagonal_Beam+$20                               ;9BC38E;
    dw Tiles_GrappleBeam_Diagonal_Beam+$20                               ;9BC390;
    dw Tiles_GrappleBeam_Diagonal_Beam+$20                               ;9BC392;
    dw Tiles_GrappleBeam_Diagonal_Beam+$20                               ;9BC394;
    dw Tiles_GrappleBeam_Diagonal_Beam+$20                               ;9BC396;
    dw Tiles_GrappleBeam_Diagonal_Beam+$20                               ;9BC398;
    dw Tiles_GrappleBeam_Diagonal_Beam+$20                               ;9BC39A;
    dw Tiles_GrappleBeam_Horizontal_Beam+$20                             ;9BC39C;
    dw Tiles_GrappleBeam_Horizontal_Beam+$20                             ;9BC39E;
    dw Tiles_GrappleBeam_Horizontal_Beam+$20                             ;9BC3A0;
    dw Tiles_GrappleBeam_Horizontal_Beam+$20                             ;9BC3A2;
    dw Tiles_GrappleBeam_Horizontal_Beam+$20                             ;9BC3A4;
    dw Tiles_GrappleBeam_Horizontal_Beam+$20                             ;9BC3A6;
    dw Tiles_GrappleBeam_Horizontal_Beam+$20                             ;9BC3A8;
    dw Tiles_GrappleBeam_Horizontal_Beam+$20                             ;9BC3AA;
    dw Tiles_GrappleBeam_Horizontal_Beam+$20                             ;9BC3AC;
    dw Tiles_GrappleBeam_Horizontal_Beam+$20                             ;9BC3AE;
    dw Tiles_GrappleBeam_Diagonal_Beam+$20                               ;9BC3B0;
    dw Tiles_GrappleBeam_Diagonal_Beam+$20                               ;9BC3B2;
    dw Tiles_GrappleBeam_Diagonal_Beam+$20                               ;9BC3B4;
    dw Tiles_GrappleBeam_Diagonal_Beam+$20                               ;9BC3B6;
    dw Tiles_GrappleBeam_Diagonal_Beam+$20                               ;9BC3B8;
    dw Tiles_GrappleBeam_Diagonal_Beam+$20                               ;9BC3BA;
    dw Tiles_GrappleBeam_Diagonal_Beam+$20                               ;9BC3BC;
    dw Tiles_GrappleBeam_Diagonal_Beam+$20                               ;9BC3BE;
    dw Tiles_GrappleBeam_Vertical_Beam+$20                               ;9BC3C0;
    dw Tiles_GrappleBeam_Vertical_Beam+$20                               ;9BC3C2;
    dw Tiles_GrappleBeam_Vertical_Beam+$20                               ;9BC3C4;


;;; $C3C6: Connecting to grapple block pointer table ;;;
ConnectingToGrappleBlockPointerTable_Default:
; Indexed by [direction grapple is fired] * 4.
; Next grapple beam functions:
;     $C77E: Connected - locked in place
;     $C79D: Connected - swinging
  .next: ; Next grapple beam function
    dw GrappleBeamFunction_Connected_Swinging                            ;9BC3C6;
  .function: ; Function to execute
    dw HandleConnectingGrapple_SwingingClockwise                         ;9BC3C8;
    dw GrappleBeamFunction_Connected_Swinging                            ;9BC3CA;
    dw HandleConnectingGrapple_SwingingClockwise                         ;9BC3CC;
    dw GrappleBeamFunction_Connected_LockedInPlace                       ;9BC3CE;
    dw HandleConnectingGrapple_Standing_AimingRight                      ;9BC3D0;
    dw GrappleBeamFunction_Connected_LockedInPlace                       ;9BC3D2;
    dw HandleConnectingGrapple_Standing_AimingDownRight                  ;9BC3D4;
    dw GrappleBeamFunction_Connected_LockedInPlace                       ;9BC3D6;
    dw HandleConnectingGrapple_Standing_AimingDownLeft                   ;9BC3D8;
    dw GrappleBeamFunction_Connected_LockedInPlace                       ;9BC3DA;
    dw HandleConnectingGrapple_Standing_AimingDownLeft                   ;9BC3DC;
    dw GrappleBeamFunction_Connected_LockedInPlace                       ;9BC3DE;
    dw HandleConnectingGrapple_Standing_AimingDownLeft                   ;9BC3E0;
    dw GrappleBeamFunction_Connected_LockedInPlace                       ;9BC3E2;
    dw HandleConnectingGrapple_Standing_AimingLeft                       ;9BC3E4;
    dw GrappleBeamFunction_Connected_Swinging                            ;9BC3E6;
    dw HandleConnectingGrapple_SwingingAntiClockwise                     ;9BC3E8;
    dw GrappleBeamFunction_Connected_Swinging                            ;9BC3EA;
    dw HandleConnectingGrapple_SwingingAntiClockwise                     ;9BC3EC;

ConnectingToGrappleBlockPointerTable_MovingVertically:
  .next:
    dw GrappleBeamFunction_Connected_Swinging                            ;9BC3EE;
  .function:
    dw HandleConnectingGrapple_SwingingClockwise                         ;9BC3F0;
    dw GrappleBeamFunction_Connected_Swinging                            ;9BC3F2;
    dw HandleConnectingGrapple_SwingingClockwise                         ;9BC3F4;
    dw GrappleBeamFunction_Connected_Swinging                            ;9BC3F6;
    dw HandleConnectingGrapple_SwingingClockwise                         ;9BC3F8;
    dw GrappleBeamFunction_Connected_Swinging                            ;9BC3FA;
    dw HandleConnectingGrapple_SwingingClockwise                         ;9BC3FC;
    dw GrappleBeamFunction_Connected_Swinging                            ;9BC3FE;
    dw HandleConnectingGrapple_SwingingClockwise                         ;9BC400;
    dw GrappleBeamFunction_Connected_Swinging                            ;9BC402;
    dw HandleConnectingGrapple_SwingingAntiClockwise                     ;9BC404;
    dw GrappleBeamFunction_Connected_Swinging                            ;9BC406;
    dw HandleConnectingGrapple_SwingingAntiClockwise                     ;9BC408;
    dw GrappleBeamFunction_Connected_Swinging                            ;9BC40A;
    dw HandleConnectingGrapple_SwingingAntiClockwise                     ;9BC40C;
    dw GrappleBeamFunction_Connected_Swinging                            ;9BC40E;
    dw HandleConnectingGrapple_SwingingAntiClockwise                     ;9BC410;
    dw GrappleBeamFunction_Connected_Swinging                            ;9BC412;
    dw HandleConnectingGrapple_SwingingAntiClockwise                     ;9BC414;

ConnectingToGrappleBlockPointerTable_Crouching:
  .next:
    dw GrappleBeamFunction_Connected_Swinging                            ;9BC416;
  .function:
    dw HandleConnectingGrapple_SwingingClockwise                         ;9BC418;
    dw GrappleBeamFunction_Connected_Swinging                            ;9BC41A;
    dw HandleConnectingGrapple_SwingingClockwise                         ;9BC41C;
    dw GrappleBeamFunction_Connected_LockedInPlace                       ;9BC41E;
    dw HandleConnectingGrapple_Crouching_AimingRight                     ;9BC420;
    dw GrappleBeamFunction_Connected_LockedInPlace                       ;9BC422;
    dw HandleConnectingGrapple_Crouching_AimingDownRight                 ;9BC424;
    dw GrappleBeamFunction_Connected_LockedInPlace                       ;9BC426;
    dw HandleConnectingGrapple_Standing_AimingDownLeft                   ;9BC428;
    dw GrappleBeamFunction_Connected_LockedInPlace                       ;9BC42A;
    dw HandleConnectingGrapple_Standing_AimingDownLeft                   ;9BC42C;
    dw GrappleBeamFunction_Connected_LockedInPlace                       ;9BC42E;
    dw HandleConnectingGrapple_Crouching_AimingDownLeft                  ;9BC430;
    dw GrappleBeamFunction_Connected_LockedInPlace                       ;9BC432;
    dw HandleConnectingGrapple_Crouching_AimingLeft                      ;9BC434;
    dw GrappleBeamFunction_Connected_Swinging                            ;9BC436;
    dw HandleConnectingGrapple_SwingingAntiClockwise                     ;9BC438;
    dw GrappleBeamFunction_Connected_Swinging                            ;9BC43A;
    dw HandleConnectingGrapple_SwingingAntiClockwise                     ;9BC43C;


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
  .angle:                                                                ;9BC43E;
    dw $D680
  .pose:                                                                 ;9BC440;
    dw       $00B6
  .XOffset:                                                              ;9BC442;
    dw             $FFE2
  .YOffset:                                                              ;9BC444;
    dw                   $FFE8
  .grappleFunction:                                                      ;9BC446;
    dw GrappleBeamFunction_Connected_LockedInPlace
    dw $2A80,$00B7,$001E,$FFE8                                           ;9BC448;
    dw GrappleBeamFunction_Connected_LockedInPlace                       ;9BC450;
    dw $B380,$00B6,$FFE4,$FFF8                                           ;9BC452;
    dw GrappleBeamFunction_Connected_LockedInPlace                       ;9BC45A;
    dw $4D80,$00B7,$001C,$FFF8                                           ;9BC45C;
    dw GrappleBeamFunction_Connected_LockedInPlace                       ;9BC464;
    dw $6A80,$00B9,$0018,$0010                                           ;9BC466;
    dw GrappleBeamFunction_WallGrab                                      ;9BC46E;
    dw $9680,$00B8,$FFE8,$0010                                           ;9BC470;
    dw GrappleBeamFunction_WallGrab                                      ;9BC478;
    dw $7380,$00B8,$FFF8,$0010                                           ;9BC47A;
    dw GrappleBeamFunction_WallGrab                                      ;9BC482;
    dw $8D80,$00B9,$0008,$0010                                           ;9BC484;
    dw GrappleBeamFunction_WallGrab                                      ;9BC48C;


if !FEATURE_KEEP_UNREFERENCED
;;; $C48E: Unused ;;;
UNUSED_9BC48E:
    db $20,$3A                                                           ;9BC48E;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C490: Grapple beam handler ;;;
GrappleBeamHandler:
    PHP                                                                  ;9BC490;
    PHB                                                                  ;9BC491;
    PHK                                                                  ;9BC492;
    PLB                                                                  ;9BC493;
    REP #$30                                                             ;9BC494;
    LDA.W GrappleBeam_PoseChangeAutoFireTimer                            ;9BC496;
    BEQ +                                                                ;9BC499;
    DEC                                                                  ;9BC49B;
    STA.W GrappleBeam_PoseChangeAutoFireTimer                            ;9BC49C;

+   LDA.W GrappleConnectedFlags                                          ;9BC49F;
    AND.W #$FFFE                                                         ;9BC4A2;
    STA.W GrappleConnectedFlags                                          ;9BC4A5;
    JSR.W CancelGrappleBeamIfInIncompatiblePose                          ;9BC4A8;
    PEA.W .manualReturn-1                                                ;9BC4AB;
    JMP.W (GrappleBeam_Function)                                         ;9BC4AE;

  .manualReturn:
    LDA.W GrappleBeam_Function                                           ;9BC4B1;
    CMP.W #GrappleBeamFunction_Inactive                                  ;9BC4B4;
    BEQ .clearLiquidPhysics                                              ;9BC4B7;
    CMP.W #GrappleBeamFunction_HitNothing_Cancel                         ;9BC4B9;
    BPL .clearLiquidPhysics                                              ;9BC4BC;
    LDA.W SuitPaletteIndex                                               ;9BC4BE;
    BIT.W #$0004                                                         ;9BC4C1;
    BNE .clearLiquidPhysics                                              ;9BC4C4;
    LDA.W FX_Type                                                        ;9BC4C6;
    BEQ .clearLiquidPhysics                                              ;9BC4C9;
    JSL.L Get_Samus_BottomTop_Boundary                                   ;9BC4CB;
    LDA.W FX_YPosition                                                   ;9BC4CF;
    BMI .clearLiquidPhysics                                              ;9BC4D2;
    CMP.B DP_Temp12                                                      ;9BC4D4;
    BPL .clearLiquidPhysics                                              ;9BC4D6;
    LDA.W GrappleBeam_Flags                                              ;9BC4D8;
    ORA.W #$0001                                                         ;9BC4DB;
    STA.W GrappleBeam_Flags                                              ;9BC4DE;
    PLB                                                                  ;9BC4E1;
    PLP                                                                  ;9BC4E2;
    RTL                                                                  ;9BC4E3;

  .clearLiquidPhysics:
    LDA.W GrappleBeam_Flags                                              ;9BC4E4;
    AND.W #$FFFE                                                         ;9BC4E7;
    STA.W GrappleBeam_Flags                                              ;9BC4EA;
    PLB                                                                  ;9BC4ED;
    PLP                                                                  ;9BC4EE;
    RTL                                                                  ;9BC4EF;


;;; $C4F0: Grapple beam function - inactive ;;;
GrappleBeamFunction_Inactive:
    LDA.B DP_Controller1New                                              ;9BC4F0;
    BIT.W ShotBinding                                                    ;9BC4F2;
    BNE GrappleBeamFunction_Fire_GotoCancel                              ;9BC4F5;
    LDA.W PreviousController1NewDrawing                                  ;9BC4F7;
    BIT.W ShotBinding                                                    ;9BC4FA;
    BNE GrappleBeamFunction_Fire_GotoCancel                              ;9BC4FD;
    LDA.W SamusProjectile_FlareCounter                                   ;9BC4FF;
    BEQ .return                                                          ;9BC502;
    STZ.W SamusProjectile_FlareCounter                                   ;9BC504;
    STZ.W SamusProjectile_FlareAnimationFrame                            ;9BC507;
    STZ.W SamusProjectile_FlareSlowSparksAnimationFrame0CD8              ;9BC50A;
    STZ.W SamusProjectile_FlareFastSparksAnimationFrame0CDA              ;9BC50D;
    STZ.W SamusProjectile_FlareAnimationTimer                            ;9BC510;
    STZ.W SamusProjectile_FlareSlowSparksAnimationFrame0CDE              ;9BC513;
    STZ.W SamusProjectile_FlareFastSparksAnimationFrame0CE0              ;9BC516;
    JSL.L LoadSamusSuitPalette                                           ;9BC519;

  .return:
    RTS                                                                  ;9BC51D;


;;; $C51E: Grapple beam function - fire / go to cancel ;;;
GrappleBeamFunction_Fire_GotoCancel:
; Act as if fire was just pressed. This is often used to *cancel* the beam during no-fire conditions
    LDA.W Pose                                                           ;9BC51E;
    CMP.W #$00F0                                                         ;9BC521;
    BEQ .draygon                                                         ;9BC524;
    CMP.W #$00BE                                                         ;9BC526;
    BEQ .draygon                                                         ;9BC529;
    ASL                                                                  ;9BC52B;
    ASL                                                                  ;9BC52C;
    ASL                                                                  ;9BC52D;
    TAX                                                                  ;9BC52E;
    LDA.L PoseDefinitions_YOffset,X                                      ;9BC52F;
    AND.W #$00FF                                                         ;9BC533;
    STA.B DP_Temp16                                                      ;9BC536;
    LDA.L PoseDefinitions_directionShotsFired,X                          ;9BC538;
    AND.W #$00FF                                                         ;9BC53C;
    BIT.W #$00F0                                                         ;9BC53F;
    BEQ .fire                                                            ;9BC542;

  .cancel:
    LDA.W #GrappleBeamFunction_HitNothing_Cancel                         ;9BC544;
    STA.W GrappleBeam_Function                                           ;9BC547;
    RTS                                                                  ;9BC54A;

  .draygon:
    JSR.W GetDirectionGrappleIsFiredWhenHeldByDraygon                    ;9BC54B;
    BCC .cancel                                                          ;9BC54E;

  .fire:
    STA.W GrappleBeam_DirectionFired                                     ;9BC550;
    ASL                                                                  ;9BC553;
    TAX                                                                  ;9BC554;
    LDA.W GrappleBeamFireVelocityTable_X,X                               ;9BC555;
    STA.W GrappleBeam_ExtensionXSubVelocity                              ;9BC558;
    LDA.W GrappleBeamFireVelocityTable_Y,X                               ;9BC55B;
    STA.W GrappleBeam_ExtensionYSubVelocity                              ;9BC55E;
    LDA.W GrappleBeamFireAngles,X                                        ;9BC561;
    STA.W GrappleBeam_EndAngle                                           ;9BC564;
    STA.W GrappleBeam_EndAngleMirror                                     ;9BC567;
    LDA.W #$000A                                                         ;9BC56A;
    STA.W GrappleBeam_PoseChangeAutoFireTimer                            ;9BC56D;
    LDA.W Pose                                                           ;9BC570;
    CMP.W #$0049                                                         ;9BC573;
    BEQ .moonwalkingNotRunning                                           ;9BC576;
    CMP.W #$004A                                                         ;9BC578;
    BEQ .moonwalkingNotRunning                                           ;9BC57B;
    LDA.W MovementType                                                   ;9BC57D;
    AND.W #$00FF                                                         ;9BC580;
    CMP.W #$0001                                                         ;9BC583;
    BEQ .running                                                         ;9BC586;

  .moonwalkingNotRunning:
; Samus is moonwalking or not running
    LDA.W GrappleBeamFireOffsets_NotRunning_OriginX,X                    ;9BC588;
    STA.W GrappleBeam_OriginXOffset                                      ;9BC58B;
    LDA.W GrappleBeamFireOffsets_NotRunning_OriginY,X                    ;9BC58E;
    SEC                                                                  ;9BC591;
    SBC.B DP_Temp16                                                      ;9BC592;
    STA.W GrappleBeam_OriginYOffset                                      ;9BC594;
    LDA.W SamusXPosition                                                 ;9BC597;
    PHA                                                                  ;9BC59A;
    CLC                                                                  ;9BC59B;
    ADC.W GrappleBeamFireOffsets_NotRunning_OriginX,X                    ;9BC59C;
    STA.W GrappleBeam_EndXPosition                                       ;9BC59F;
    STA.W GrappleBeam_StartXPosition                                     ;9BC5A2;
    PLA                                                                  ;9BC5A5;
    CLC                                                                  ;9BC5A6;
    ADC.W GrappleBeamFireOffsets_NotRunning_FlareX,X                     ;9BC5A7;
    STA.W GrappleBeam_FlareXPosition                                     ;9BC5AA;
    LDA.W SamusYPosition                                                 ;9BC5AD;
    SEC                                                                  ;9BC5B0;
    SBC.B DP_Temp16                                                      ;9BC5B1;
    PHA                                                                  ;9BC5B3;
    CLC                                                                  ;9BC5B4;
    ADC.W GrappleBeamFireOffsets_NotRunning_OriginY,X                    ;9BC5B5;
    STA.W GrappleBeam_EndYPosition                                       ;9BC5B8;
    STA.W GrappleBeam_StartYPosition                                     ;9BC5BB;
    PLA                                                                  ;9BC5BE;
    CLC                                                                  ;9BC5BF;
    ADC.W GrappleBeamFireOffsets_NotRunning_FlareY,X                     ;9BC5C0;
    STA.W GrappleBeam_FlareYPosition                                     ;9BC5C3;
    BRA .merge                                                           ;9BC5C6;

  .running:
    LDA.W GrappleBeamFireOffsets_Running_OriginX,X                       ;9BC5C8;
    STA.W GrappleBeam_OriginXOffset                                      ;9BC5CB;
    LDA.W GrappleBeamFireOffsets_Running_OriginY,X                       ;9BC5CE;
    SEC                                                                  ;9BC5D1;
    SBC.B DP_Temp16                                                      ;9BC5D2;
    STA.W GrappleBeam_OriginYOffset                                      ;9BC5D4;
    LDA.W SamusXPosition                                                 ;9BC5D7;
    PHA                                                                  ;9BC5DA;
    CLC                                                                  ;9BC5DB;
    ADC.W GrappleBeamFireOffsets_Running_OriginX,X                       ;9BC5DC;
    STA.W GrappleBeam_EndXPosition                                       ;9BC5DF;
    STA.W GrappleBeam_StartXPosition                                     ;9BC5E2;
    PLA                                                                  ;9BC5E5;
    CLC                                                                  ;9BC5E6;
    ADC.W GrappleBeamFireOffsets_Running_FlareX,X                        ;9BC5E7;
    STA.W GrappleBeam_FlareXPosition                                     ;9BC5EA;
    LDA.W SamusYPosition                                                 ;9BC5ED;
    SEC                                                                  ;9BC5F0;
    SBC.B DP_Temp16                                                      ;9BC5F1;
    PHA                                                                  ;9BC5F3;
    CLC                                                                  ;9BC5F4;
    ADC.W GrappleBeamFireOffsets_Running_OriginY,X                       ;9BC5F5;
    STA.W GrappleBeam_EndYPosition                                       ;9BC5F8;
    STA.W GrappleBeam_StartYPosition                                     ;9BC5FB;
    PLA                                                                  ;9BC5FE;
    CLC                                                                  ;9BC5FF;
    ADC.W GrappleBeamFireOffsets_Running_FlareY,X                        ;9BC600;
    STA.W GrappleBeam_FlareYPosition                                     ;9BC603;

  .merge:
    STZ.W GrappleBeam_EndXSubPosition                                    ;9BC606;
    STZ.W GrappleBeam_EndYSubPosition                                    ;9BC609;
    STZ.W GrappleBeam_EndXSubOffset                                      ;9BC60C;
    STZ.W GrappleBeam_EndXOffset                                         ;9BC60F;
    STZ.W GrappleBeam_EndYSubOffset                                      ;9BC612;
    STZ.W GrappleBeam_EndYOffset                                         ;9BC615;
    STZ.W GrappleBeam_Flags                                              ;9BC618;
    LDA.W #$000C                                                         ;9BC61B;
    STA.W GrappleBeam_LengthDelta                                        ;9BC61E;
    STZ.W GrappleBeam_Length                                             ;9BC621;
    STZ.W GrappleBeam_SwingAngularVelocity                               ;9BC624;
    STZ.W GrappleBeam_SwingAngularAccelerationDueToAngleOfSwing          ;9BC627;
    STZ.W GrappleBeam_SwingAngularAccelerationDueToButtonInput           ;9BC62A;
    STZ.W GrappleBeam_SwingAngularDeceleration                           ;9BC62D;
    STZ.W GrappleBeam_ExtraSwingAngularVelocity                          ;9BC630;
    STZ.W GrappleBeam_KickCooldownTimer                                  ;9BC633;
    STZ.W GrappleBeam_neverRead0D1E                                      ;9BC636;
    STZ.W GrappleBeam_neverRead0D20                                      ;9BC639;
    LDA.W #$0002                                                         ;9BC63C;
    STA.W GrappleBeam_NeverRead0D3A                                      ;9BC63F;
    STZ.W GrappleBeam_NeverRead0D3C                                      ;9BC642;
    LDA.W #$0005*!FPS                                                    ;9BC645;
    STA.W GrappleBeam_StartAnimationTimer                                ;9BC648;
    LDA.W GrappleBeamStartTilesBeginEndPointers_0                        ;9BC64B;
    STA.W GrappleBeam_StartAnimationTilePointer                          ;9BC64E;
    STZ.W GrappleCollision_XQuarterSubVelocity                           ;9BC651;
    STZ.W GrappleCollision_XQuarterVelocity                              ;9BC654;
    STZ.W GrappleCollision_YQuarterSubVelocity                           ;9BC657;
    STZ.W GrappleCollision_YQuarterVelocity                              ;9BC65A;
    STZ.W GrappleCollision_LoopCounter                                   ;9BC65D;
    STZ.W GrappleCollision_TargetLength                                  ;9BC660;
    STZ.W GrappleCollision_SamusFrontBoundaryOffset                      ;9BC663;
    STZ.W GrappleCollision_XPosition                                     ;9BC666;
    STZ.W GrappleBeam_FailedSwingMovementCounter                         ;9BC669;
    STZ.W GrappleBeam_SpecialAngleHandlingFlag                           ;9BC66C;
    STZ.W GrappleBeam_SlowScrollingFlag                                  ;9BC66F;
    JSL.L InitializeGrappleSegmentAnimations                             ;9BC672;
    LDA.W #SamusDrawingHandler_FiringGrappleBeam                         ;9BC676;
    STA.W DrawingHandler                                                 ;9BC679;
    STZ.W GrappleWalljumpTimer                                           ;9BC67C;
    LDA.W #$0002                                                         ;9BC67F;
    JSL.L Load_Beam_Palette_External                                     ;9BC682;
    LDA.W #$7F91                                                         ;9BC686;
    STA.L Palettes_SpriteP5+$1E                                          ;9BC689;
    LDA.W #GrappleBeamFunction_Firing                                    ;9BC68D;
    STA.W GrappleBeam_Function                                           ;9BC690;
    LDA.W #$0005                                                         ;9BC693;
    JSL.L QueueSound_Lib1_Max1                                           ;9BC696;
    LDA.W #$0001                                                         ;9BC69A;
    STA.W SamusProjectile_FlareCounter                                   ;9BC69D;
    STZ.W ResumeChargingBeamSFXFlag                                      ;9BC6A0;
    LDA.W MovementHandler                                                ;9BC6A3;
    CMP.W #SamusMovementHandler_ReleasedFromGrappleSwing                 ;9BC6A6;
    BNE .return                                                          ;9BC6A9;
    LDA.W #SamusMovementHandler_Normal                                   ;9BC6AB;
    STA.W MovementHandler                                                ;9BC6AE;

  .return:
    RTS                                                                  ;9BC6B1;


;;; $C6B2: A = direction grapple is fired when held by Draygon ;;;
GetDirectionGrappleIsFiredWhenHeldByDraygon:
;; Parameters:
;;     A: Samus pose
;; Returns:
;;     Carry: Set
;;     A: Direction grapple is fired
;;     $16: 6. Y offset of Samus projectile origin

; Gets directions for Samus aiming when held by Draygon
    CMP.W #$00BE                                                         ;9BC6B2;
    BEQ .facingLeft                                                      ;9BC6B5;
    LDA.W #$0006                                                         ;9BC6B7;
    STA.B DP_Temp16                                                      ;9BC6BA;
    LDA.B DP_Controller1Input                                            ;9BC6BC;
    BIT.W #$0100                                                         ;9BC6BE;
    BEQ .right                                                           ;9BC6C1;
    BIT.W #$0400                                                         ;9BC6C3;
    BNE .downRight                                                       ;9BC6C6;
    BIT.W #$0800                                                         ;9BC6C8;
    BNE .upRight                                                         ;9BC6CB;

  .right:
    LDA.W #$0002                                                         ;9BC6CD;
    SEC                                                                  ;9BC6D0;
    RTS                                                                  ;9BC6D1;

  .upRight:
    LDA.W #$0001                                                         ;9BC6D2;
    SEC                                                                  ;9BC6D5;
    RTS                                                                  ;9BC6D6;

  .downRight:
    LDA.W #$0003                                                         ;9BC6D7;
    SEC                                                                  ;9BC6DA;
    RTS                                                                  ;9BC6DB;

  .facingLeft:
    LDA.W #$0006                                                         ;9BC6DC;
    STA.B DP_Temp16                                                      ;9BC6DF;
    LDA.B DP_Controller1Input                                            ;9BC6E1;
    BIT.W #$0200                                                         ;9BC6E3;
    BEQ .left                                                            ;9BC6E6;
    BIT.W #$0400                                                         ;9BC6E8;
    BNE .downLeft                                                        ;9BC6EB;
    BIT.W #$0800                                                         ;9BC6ED;
    BNE .upLeft                                                          ;9BC6F0;

  .left:
    LDA.W #$0007                                                         ;9BC6F2;
    SEC                                                                  ;9BC6F5;
    RTS                                                                  ;9BC6F6;

  .upLeft:
    LDA.W #$0008                                                         ;9BC6F7;
    SEC                                                                  ;9BC6FA;
    RTS                                                                  ;9BC6FB;

  .downLeft:
    LDA.W #$0006                                                         ;9BC6FC;
    SEC                                                                  ;9BC6FF;
    RTS                                                                  ;9BC700;


if !FEATURE_KEEP_UNREFERENCED
UNUSED_CLCRTS_9B7C01:
; Nothing points here
    CLC                                                                  ;9BC701;
    RTS                                                                  ;9BC702;
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C703: Grapple beam function - firing ;;;
GrappleBeamFunction_Firing:
    LDA.B DP_Controller1Input                                            ;9BC703;
    BIT.W ShotBinding                                                    ;9BC705;
    BNE .firing                                                          ;9BC708;

  .cancel:
    LDA.W #GrappleBeamFunction_HitNothing_Cancel                         ;9BC70A;
    STA.W GrappleBeam_Function                                           ;9BC70D;
    RTS                                                                  ;9BC710;

  .firing:
    JSR.W RTS_9BB8D4                                                     ;9BC711;
    LDA.W GrappleBeam_Length                                             ;9BC714;
    CLC                                                                  ;9BC717;
    ADC.W GrappleBeam_LengthDelta                                        ;9BC718;
    STA.W GrappleBeam_Length                                             ;9BC71B;
    CMP.W #$0080                                                         ;9BC71E;
    BMI .enemyCollisionCheck                                             ;9BC721;

  .gotoCancel:
    BRA .cancel                                                          ;9BC723; >.<

  .enemyCollisionCheck:
    JSL.L EnemyGrappleBeamCollisionDetection                             ;9BC725;
    JSR.W ProcessEnemyGrappleBeamCollisionResult                         ;9BC729;
    BCC .blockCollisionCheck                                             ;9BC72C;
    TAY                                                                  ;9BC72E;
    BNE .gotoCancel                                                      ;9BC72F;
    BRA .connected                                                       ;9BC731;

  .blockCollisionCheck:
    JSL.L GrappleBeamBlockCollisionDetection                             ;9BC733;
    BCC .return                                                          ;9BC737;
    BVC .gotoCancel                                                      ;9BC739;

  .connected:
    LDA.W #$0006                                                         ;9BC73B;
    JSL.L QueueSound_Lib1_Max6                                           ;9BC73E;
    JSR.W HandleConnectingGrapple                                        ;9BC742;
    LDA.W #$0008                                                         ;9BC745;
    EOR.W #$FFFF                                                         ;9BC748;
    INC                                                                  ;9BC74B;
    STA.W GrappleBeam_LengthDelta                                        ;9BC74C;
    LDA.W GrappleConnectedFlags                                          ;9BC74F;
    ORA.W #$0001                                                         ;9BC752;
    STA.W GrappleConnectedFlags                                          ;9BC755;

  .return:
    RTS                                                                  ;9BC758;


;;; $C759: Unused. Grapple beam function - unfiring ;;;
UNUSED_GrappleBeamFunction_Unfiring_9BC759:
    LDA.B DP_Controller1Input                                            ;9BC759;
    BIT.W ShotBinding                                                    ;9BC75B;
    BNE .firing                                                          ;9BC75E;

  .cancel:
    LDA.W #GrappleBeamFunction_HitNothing_Cancel                         ;9BC760;
    STA.W GrappleBeam_Function                                           ;9BC763;
    RTS                                                                  ;9BC766;

  .firing:
    JSR.W RTS_9BB8D4                                                     ;9BC767;
    LDA.W GrappleBeam_Length                                             ;9BC76A;
    SEC                                                                  ;9BC76D;
    SBC.W GrappleBeam_LengthDelta                                        ;9BC76E;
    STA.W GrappleBeam_Length                                             ;9BC771;
    CMP.W #$000D                                                         ;9BC774;
    BMI .cancel                                                          ;9BC777;
    JSL.L GrappleBeamBlockCollisionDetection                             ;9BC779;
    RTS                                                                  ;9BC77D;


;;; $C77E: Grapple beam function - connected - locked in place ;;;
GrappleBeamFunction_Connected_LockedInPlace:
    LDA.B DP_Controller1Input                                            ;9BC77E;
    BIT.W ShotBinding                                                    ;9BC780;
    BNE .firing                                                          ;9BC783;

  .cancel:
    LDA.W #GrappleBeamFunction_HitNothing_Cancel                         ;9BC785;
    STA.W GrappleBeam_Function                                           ;9BC788;
    RTS                                                                  ;9BC78B;

  .firing:
    JSL.L EnemyGrappleBeamCollisionDetection                             ;9BC78C;
    TAY                                                                  ;9BC790;
    BNE .returnCarryClear                                                ;9BC791;
    JSR.W CheckIfGrappleIsConnectedToBlock                               ;9BC793;
    BCC .cancel                                                          ;9BC796;

  .returnCarryClear:
    JSL.L CLCRTL_94AF0B                                                  ;9BC798;
    RTS                                                                  ;9BC79C;


;;; $C79D: Grapple beam function - connected - swinging ;;;
GrappleBeamFunction_Connected_Swinging:
    LDA.B DP_Controller1Input                                            ;9BC79D;
    BIT.W ShotBinding                                                    ;9BC79F;
    BNE .firing                                                          ;9BC7A2;

  .cancel:
    LDA.W GrappleBeam_SwingAngularVelocity                               ;9BC7A4;
    BNE .propelSamus                                                     ;9BC7A7;
    LDA.W GrappleBeam_EndAngle                                           ;9BC7A9;
    CMP.W #$8000                                                         ;9BC7AC;
    BNE .propelSamus                                                     ;9BC7AF;
    LDA.W #GrappleBeamFunction_Dropped                                   ;9BC7B1;
    STA.W GrappleBeam_Function                                           ;9BC7B4;
    RTS                                                                  ;9BC7B7;

  .propelSamus:
    JSR.W PropelSamusFromGrappleSwing                                    ;9BC7B8;
    LDA.W #GrappleBeamFunction_ReleasedFromSwing                         ;9BC7BB;
    STA.W GrappleBeam_Function                                           ;9BC7BE;
    LDA.W #SamusMovementHandler_ReleasedFromGrappleSwing                 ;9BC7C1;
    STA.W MovementHandler                                                ;9BC7C4;
    RTS                                                                  ;9BC7C7;

  .firing:
    JSR.W HandleGrappleDpadInput                                         ;9BC7C8;
    LDA.W GrappleBeam_LengthDelta                                        ;9BC7CB;
    BEQ .handleSwinging                                                  ;9BC7CE;
    JSL.L HandleGrappleBeamLengthChange                                  ;9BC7D0;

  .handleSwinging:
    JSR.W DetermineGrappleSwingAngularAccelerationDueToAngleOfSwing      ;9BC7D4;
    JSR.W UpdateGrappleSwingAngularVelocity                              ;9BC7D7;
    JSR.W HandleGrappleKick                                              ;9BC7DA;
    JSL.L HandleGrappleBeamSwingingMovement                              ;9BC7DD;
    LDA.W GrappleBeam_SpecialAngleHandlingFlag                           ;9BC7E1;
    BPL .enemyCollision                                                  ;9BC7E4;
    JSR.W HandleSpecialGrappleBeamAngles                                 ;9BC7E6;
    BCC .enemyCollision                                                  ;9BC7E9;
    JSL.L CLCRTL_94AF0B                                                  ;9BC7EB;
    RTS                                                                  ;9BC7EF;

  .enemyCollision:
    JSL.L EnemyGrappleBeamCollisionDetection                             ;9BC7F0;
    TAY                                                                  ;9BC7F4;
    BEQ .blockCollision                                                  ;9BC7F5;
    LDA.W GrappleBeam_Flags                                              ;9BC7F7;
    ORA.W #$8000                                                         ;9BC7FA;
    STA.W GrappleBeam_Flags                                              ;9BC7FD;
    BRA +                                                                ;9BC800;

  .blockCollision:
    JSR.W CheckIfGrappleIsConnectedToBlock                               ;9BC802;
    BCC .cancel                                                          ;9BC805;

+   JSL.L UpdateGrappleBeamStartPositionDuringGrappleSwinging            ;9BC807;
    JSL.L CLCRTL_94AF0B                                                  ;9BC80B;
    JSL.L SetSamusAnimationFrameAndPositionDuringGrappleSwinging         ;9BC80F;
    RTS                                                                  ;9BC813;


;;; $C814: Grapple beam function - wallgrab ;;;
GrappleBeamFunction_WallGrab:
    LDA.B DP_Controller1Input                                            ;9BC814;
    BIT.W ShotBinding                                                    ;9BC816;
    BNE .firing                                                          ;9BC819;

  .cancel:
    LDA.W #$001E                                                         ;9BC81B;
    STA.W GrappleWalljumpTimer                                           ;9BC81E;
    LDA.W #GrappleBeamFunction_WallGrabRelease                           ;9BC821;
    STA.W GrappleBeam_Function                                           ;9BC824;
    RTS                                                                  ;9BC827;

  .firing:
    JSR.W CheckIfGrappleIsConnectedToBlock                               ;9BC828;
    BCC .cancel                                                          ;9BC82B;
    JSL.L CLCRTL_94AF0B                                                  ;9BC82D;
    RTS                                                                  ;9BC831;


;;; $C832: Grapple beam function - wallgrab release ;;;
GrappleBeamFunction_WallGrabRelease:
    LDA.W GrappleWalljumpTimer                                           ;9BC832;
    DEC                                                                  ;9BC835;
    STA.W GrappleWalljumpTimer                                           ;9BC836;
    BPL .timerNotExpired                                                 ;9BC839;
    LDA.W #GrappleBeamFunction_Dropped                                   ;9BC83B;
    STA.W GrappleBeam_Function                                           ;9BC83E;
    RTS                                                                  ;9BC841;

  .timerNotExpired:
    LDA.W #$0010                                                         ;9BC842;
    STA.B DP_Temp12                                                      ;9BC845;
    STZ.B DP_Temp14                                                      ;9BC847;
    JSL.L Grapple_WallJump_Check                                         ;9BC849;
    BCC .return                                                          ;9BC84D;
    LDA.W #GrappleBeamFunction_WallJumping                               ;9BC84F;
    STA.W GrappleBeam_Function                                           ;9BC852;

  .return:
    RTS                                                                  ;9BC855;


;;; $C856: Grapple beam function - hit nothing / cancel ;;;
GrappleBeamFunction_HitNothing_Cancel:
    LDA.W #$0007                                                         ;9BC856;
    JSL.L QueueSound                                                     ;9BC859;
    LDA.W MovementType                                                   ;9BC85D;
    AND.W #$00FF                                                         ;9BC860;
    CMP.W #$0016                                                         ;9BC863;
    BNE .notGrappling                                                    ;9BC866;
    JSL.L HandleTransitionTableLookupFailure                             ;9BC868;
    BRA +                                                                ;9BC86C;

  .notGrappling:
    LDA.W #$001C                                                         ;9BC86E;
    JSL.L Run_Samus_Command                                              ;9BC871;

+   STZ.W GrappleBeam_neverRead0D1E                                      ;9BC875;
    STZ.W GrappleBeam_neverRead0D20                                      ;9BC878;
    STZ.W GrappleBeam_DirectionFired                                     ;9BC87B;
    STZ.W GrappleBeam_SpecialAngleHandlingFlag                           ;9BC87E;
    STZ.W GrappleWalljumpTimer                                           ;9BC881;
    STZ.W GrappleBeam_SlowScrollingFlag                                  ;9BC884;
    STZ.W GrappleBeam_PoseChangeAutoFireTimer                            ;9BC887;
    STZ.W GrappleBeam_Flags                                              ;9BC88A;
    STZ.W SamusProjectile_FlareCounter                                   ;9BC88D;
    STZ.W SamusProjectile_FlareAnimationFrame                            ;9BC890;
    STZ.W SamusProjectile_FlareSlowSparksAnimationFrame0CD8              ;9BC893;
    STZ.W SamusProjectile_FlareFastSparksAnimationFrame0CDA              ;9BC896;
    STZ.W SamusProjectile_FlareAnimationTimer                            ;9BC899;
    STZ.W SamusProjectile_FlareSlowSparksAnimationFrame0CDE              ;9BC89C;
    STZ.W SamusProjectile_FlareFastSparksAnimationFrame0CE0              ;9BC89F;
    LDA.W EquippedBeams                                                  ;9BC8A2;
    JSL.L Load_Beam_Palette_External                                     ;9BC8A5;
    LDA.W #GrappleBeamFunction_Inactive                                  ;9BC8A9;
    STA.W GrappleBeam_Function                                           ;9BC8AC;
    LDA.W #SamusDrawingHandler_Default                                   ;9BC8AF;
    STA.W DrawingHandler                                                 ;9BC8B2;
    JSL.L PostGrappleCollisionDetection                                  ;9BC8B5;
    LDA.W AutoCancelHUDItemIndex                                         ;9BC8B9;
    BEQ .return                                                          ;9BC8BC;
    STZ.W SelectedHUDItem                                                ;9BC8BE;
    STZ.W AutoCancelHUDItemIndex                                         ;9BC8C1;

  .return:
    RTS                                                                  ;9BC8C4;


;;; $C8C5: Grapple beam function - dropped ;;;
GrappleBeamFunction_Dropped:
; Dropped down from swinging with no momentum or missed grapple walljump
    LDA.W #$0007                                                         ;9BC8C5;
    JSL.L QueueSound                                                     ;9BC8C8;
    LDA.W Pose                                                           ;9BC8CC;
    CMP.W #$00B2                                                         ;9BC8CF;
    BEQ .clockwise                                                       ;9BC8D2;
    CMP.W #$00B3                                                         ;9BC8D4;
    BEQ .antiClockwise                                                   ;9BC8D7;
    BRA .notSwinging                                                     ;9BC8D9;

  .cancel:
    LDA.W PoseXDirection                                                 ;9BC8DB;
    AND.W #$00FF                                                         ;9BC8DE;
    CMP.W #$0004                                                         ;9BC8E1;
    BEQ .antiClockwise                                                   ;9BC8E4;

  .clockwise:
    LDA.W #$0001                                                         ;9BC8E6;
    STA.W SuperSpecialProspectivePose                                    ;9BC8E9;
    BRA .merge                                                           ;9BC8EC;

  .antiClockwise:
    LDA.W #$0002                                                         ;9BC8EE;
    STA.W SuperSpecialProspectivePose                                    ;9BC8F1;
    BRA .merge                                                           ;9BC8F4;

  .notSwinging:
    LDA.W SamusYRadius                                                   ;9BC8F6;
    CMP.W #$0011                                                         ;9BC8F9;
    BMI .crouching                                                       ;9BC8FC;
    LDA.W Pose                                                           ;9BC8FE;
    ASL                                                                  ;9BC901;
    ASL                                                                  ;9BC902;
    ASL                                                                  ;9BC903;
    TAX                                                                  ;9BC904;
    LDA.L PoseDefinitions_directionShotsFired,X                          ;9BC905;
    AND.W #$00FF                                                         ;9BC909;
    TAX                                                                  ;9BC90C;
    BIT.W #$00F0                                                         ;9BC90D;
    BNE .cancel                                                          ;9BC910;
    LDA.W .standingPoses,X                                               ;9BC912;
    AND.W #$00FF                                                         ;9BC915;
    STA.W SuperSpecialProspectivePose                                    ;9BC918;
    BRA .merge                                                           ;9BC91B;

  .crouching:
    LDA.W Pose                                                           ;9BC91D;
    ASL                                                                  ;9BC920;
    ASL                                                                  ;9BC921;
    ASL                                                                  ;9BC922;
    TAX                                                                  ;9BC923;
    LDA.L PoseDefinitions_directionShotsFired,X                          ;9BC924;
    AND.W #$00FF                                                         ;9BC928;
    TAX                                                                  ;9BC92B;
    BIT.W #$00F0                                                         ;9BC92C;
    BNE .checkDirection                                                  ;9BC92F;
    LDA.W .crouchingPoses,X                                              ;9BC931;
    AND.W #$00FF                                                         ;9BC934;
    STA.W SuperSpecialProspectivePose                                    ;9BC937;
    BRA .merge                                                           ;9BC93A;

  .checkDirection:
    LDA.W PoseXDirection                                                 ;9BC93C;
    AND.W #$00FF                                                         ;9BC93F;
    CMP.W #$0004                                                         ;9BC942;
    BEQ .facingLeft                                                      ;9BC945;
    LDA.W #$0027                                                         ;9BC947;
    STA.W SuperSpecialProspectivePose                                    ;9BC94A;
    BRA .merge                                                           ;9BC94D;

  .facingLeft:
    LDA.W #$0028                                                         ;9BC94F;
    STA.W SuperSpecialProspectivePose                                    ;9BC952;

  .merge:
    STZ.W SuperSpecialProspectivePoseChangeCommand                       ;9BC955;
    LDA.W #$0001                                                         ;9BC958;
    STA.W SamusSolidVerticalCollisionResult                              ;9BC95B;
    STZ.W SamusXBaseSpeed                                                ;9BC95E;
    STZ.W SamusXBaseSubSpeed                                             ;9BC961;
    STZ.W SamusYSubSpeed                                                 ;9BC964;
    STZ.W SamusYSpeed                                                    ;9BC967;
    STZ.W GrappleBeam_neverRead0D1E                                      ;9BC96A;
    STZ.W GrappleBeam_neverRead0D20                                      ;9BC96D;
    STZ.W GrappleBeam_DirectionFired                                     ;9BC970;
    STZ.W GrappleBeam_SpecialAngleHandlingFlag                           ;9BC973;
    STZ.W GrappleWalljumpTimer                                           ;9BC976;
    STZ.W GrappleBeam_SlowScrollingFlag                                  ;9BC979;
    STZ.W GrappleBeam_PoseChangeAutoFireTimer                            ;9BC97C;
    STZ.W GrappleBeam_Flags                                              ;9BC97F;
    STZ.W SamusProjectile_FlareCounter                                   ;9BC982;
    STZ.W SamusProjectile_FlareAnimationFrame                            ;9BC985;
    STZ.W SamusProjectile_FlareSlowSparksAnimationFrame0CD8              ;9BC988;
    STZ.W SamusProjectile_FlareFastSparksAnimationFrame0CDA              ;9BC98B;
    STZ.W SamusProjectile_FlareAnimationTimer                            ;9BC98E;
    STZ.W SamusProjectile_FlareSlowSparksAnimationFrame0CDE              ;9BC991;
    STZ.W SamusProjectile_FlareFastSparksAnimationFrame0CE0              ;9BC994;
    LDA.W EquippedBeams                                                  ;9BC997;
    JSL.L Load_Beam_Palette_External                                     ;9BC99A;
    LDA.W #GrappleBeamFunction_Inactive                                  ;9BC99E;
    STA.W GrappleBeam_Function                                           ;9BC9A1;
    LDA.W #SamusDrawingHandler_Default                                   ;9BC9A4;
    STA.W DrawingHandler                                                 ;9BC9A7;
    JSL.L PostGrappleCollisionDetection                                  ;9BC9AA;
    LDA.W AutoCancelHUDItemIndex                                         ;9BC9AE;
    BEQ .return                                                          ;9BC9B1;
    STZ.W SelectedHUDItem                                                ;9BC9B3;
    STZ.W AutoCancelHUDItemIndex                                         ;9BC9B6;

  .return:
    RTS                                                                  ;9BC9B9;

  .standingPoses:
    db $03,$05,$01,$07,$01,$02,$08,$02,$06,$04                           ;9BC9BA;

  .crouchingPoses:
    db $85,$71,$27,$73,$27,$28,$74,$28,$72,$86                           ;9BC9C4;


;;; $C9CE: Grapple beam function - wall jumping ;;;
GrappleBeamFunction_WallJumping:
    LDA.W #$0007                                                         ;9BC9CE;
    JSL.L QueueSound                                                     ;9BC9D1;
    LDA.W PoseXDirection                                                 ;9BC9D5;
    AND.W #$00FF                                                         ;9BC9D8;
    CMP.W #$0008                                                         ;9BC9DB;
    BEQ .right                                                           ;9BC9DE;
    LDA.W #$0083                                                         ;9BC9E0;
    STA.W SuperSpecialProspectivePose                                    ;9BC9E3;
    BRA +                                                                ;9BC9E6;

  .right:
    LDA.W #$0084                                                         ;9BC9E8;
    STA.W SuperSpecialProspectivePose                                    ;9BC9EB;

+   LDA.W #$0006                                                         ;9BC9EE;
    STA.W SuperSpecialProspectivePoseChangeCommand                       ;9BC9F1;
    STZ.W SamusXAccelerationMode                                         ;9BC9F4;
    STZ.W SamusXSpeedKilledDueToCollisionFlag                            ;9BC9F7;
    STZ.W SamusIsFallingFlag                                             ;9BC9FA;
    STZ.W neverRead0B1A                                                  ;9BC9FD;
    STZ.W neverRead0B2A                                                  ;9BCA00;
    STZ.W SamusYSubSpeed                                                 ;9BCA03;
    STZ.W SamusYSpeed                                                    ;9BCA06;
    STZ.W SamusYDirection                                                ;9BCA09;
    STZ.W neverRead0B38                                                  ;9BCA0C;
    STZ.W SamusXBaseSpeed                                                ;9BCA0F;
    STZ.W SamusXBaseSubSpeed                                             ;9BCA12;
    STZ.W GrappleBeam_neverRead0D1E                                      ;9BCA15;
    STZ.W GrappleBeam_neverRead0D20                                      ;9BCA18;
    STZ.W GrappleBeam_DirectionFired                                     ;9BCA1B;
    STZ.W GrappleBeam_SpecialAngleHandlingFlag                           ;9BCA1E;
    STZ.W GrappleWalljumpTimer                                           ;9BCA21;
    STZ.W GrappleBeam_SlowScrollingFlag                                  ;9BCA24;
    STZ.W GrappleBeam_PoseChangeAutoFireTimer                            ;9BCA27;
    STZ.W GrappleBeam_Flags                                              ;9BCA2A;
    STZ.W SamusProjectile_FlareCounter                                   ;9BCA2D;
    STZ.W SamusProjectile_FlareAnimationFrame                            ;9BCA30;
    STZ.W SamusProjectile_FlareSlowSparksAnimationFrame0CD8              ;9BCA33;
    STZ.W SamusProjectile_FlareFastSparksAnimationFrame0CDA              ;9BCA36;
    STZ.W SamusProjectile_FlareAnimationTimer                            ;9BCA39;
    STZ.W SamusProjectile_FlareSlowSparksAnimationFrame0CDE              ;9BCA3C;
    STZ.W SamusProjectile_FlareFastSparksAnimationFrame0CE0              ;9BCA3F;
    LDA.W EquippedBeams                                                  ;9BCA42;
    JSL.L Load_Beam_Palette_External                                     ;9BCA45;
    LDA.W #GrappleBeamFunction_Inactive                                  ;9BCA49;
    STA.W GrappleBeam_Function                                           ;9BCA4C;
    LDA.W #SamusDrawingHandler_Default                                   ;9BCA4F;
    STA.W DrawingHandler                                                 ;9BCA52;
    JSL.L PostGrappleCollisionDetection                                  ;9BCA55;
    LDA.W AutoCancelHUDItemIndex                                         ;9BCA59;
    BEQ .return                                                          ;9BCA5C;
    STZ.W SelectedHUDItem                                                ;9BCA5E;
    STZ.W AutoCancelHUDItemIndex                                         ;9BCA61;

  .return:
    RTS                                                                  ;9BCA64;


;;; $CA65: Propel Samus from grapple swing ;;;
PropelSamusFromGrappleSwing:
; Note the extra angular velocity due to grapple kick isn't included in this calculation, which feels like an oversight to me
    LDA.W GrappleBeam_SwingAngularVelocity                               ;9BCA65;
    BMI .negativeVelocity                                                ;9BCA68;
    JMP.W .positive                                                      ;9BCA6A;

  .negativeVelocity:
    EOR.W #$FFFF                                                         ;9BCA6D;
    INC                                                                  ;9BCA70;
    ASL                                                                  ;9BCA71;
    TAY                                                                  ;9BCA72;
    LDA.W GrappleBeam_EndAngle                                           ;9BCA73;
    XBA                                                                  ;9BCA76;
    AND.W #$00FF                                                         ;9BCA77;
    ASL                                                                  ;9BCA7A;
    TAX                                                                  ;9BCA7B;
    LDA.L SineCosineTables_8bitSine_SignExtended,X                       ;9BCA7C;
    BMI .negativeAngle                                                   ;9BCA80;
    PHY                                                                  ;9BCA82;
    JSL.L A_Y_16bit_UnsignedMultiplication                               ;9BCA83;
    PLY                                                                  ;9BCA87;
    LDA.W MultiplicationResult                                           ;9BCA88;
    STA.W SamusYSubSpeed                                                 ;9BCA8B;
    LDA.W MultiplicationResult+2                                         ;9BCA8E;
    STA.W SamusYSpeed                                                    ;9BCA91;
    LDA.W #$0001                                                         ;9BCA94;
    STA.W SamusYDirection                                                ;9BCA97;
    BRA .decelerating                                                    ;9BCA9A;

  .negativeAngle:
    EOR.W #$FFFF                                                         ;9BCA9C;
    INC                                                                  ;9BCA9F;
    PHY                                                                  ;9BCAA0;
    JSL.L A_Y_16bit_UnsignedMultiplication                               ;9BCAA1;
    PLY                                                                  ;9BCAA5;
    LDA.W MultiplicationResult                                           ;9BCAA6;
    STA.W SamusYSubSpeed                                                 ;9BCAA9;
    LDA.W MultiplicationResult+2                                         ;9BCAAC;
    STA.W SamusYSpeed                                                    ;9BCAAF;
    LDA.W #$0002                                                         ;9BCAB2;
    STA.W SamusYDirection                                                ;9BCAB5;

  .decelerating:
    LDA.W #$0002                                                         ;9BCAB8;
    STA.W SamusXAccelerationMode                                         ;9BCABB;
    TYA                                                                  ;9BCABE;
    LSR                                                                  ;9BCABF;
    XBA                                                                  ;9BCAC0;
    AND.W #$00FF                                                         ;9BCAC1;
    STA.B DP_Temp12                                                      ;9BCAC4;
    ASL                                                                  ;9BCAC6;
    CLC                                                                  ;9BCAC7;
    ADC.B DP_Temp12                                                      ;9BCAC8;
    STA.B DP_Temp12                                                      ;9BCACA;
    LDA.W #$0040                                                         ;9BCACC;
    SEC                                                                  ;9BCACF;
    SBC.B DP_Temp12                                                      ;9BCAD0;
    STA.B DP_Temp12                                                      ;9BCAD2;
    LDA.W GrappleBeam_EndAngle                                           ;9BCAD4;
    XBA                                                                  ;9BCAD7;
    AND.W #$00FF                                                         ;9BCAD8;
    SEC                                                                  ;9BCADB;
    SBC.B DP_Temp12                                                      ;9BCADC;
    AND.W #$00FF                                                         ;9BCADE;
    ASL                                                                  ;9BCAE1;
    TAX                                                                  ;9BCAE2;
    LDA.L SineCosineTables_8bitSine_SignExtended,X                       ;9BCAE3;
    BPL +                                                                ;9BCAE7;
    EOR.W #$FFFF                                                         ;9BCAE9;
    INC                                                                  ;9BCAEC;

+   JSL.L A_Y_16bit_UnsignedMultiplication                               ;9BCAED;
    LDA.W MultiplicationResult                                           ;9BCAF1;
    STA.W SamusXBaseSubSpeed                                             ;9BCAF4;
    LDA.W MultiplicationResult+2                                         ;9BCAF7;
    STA.W SamusXBaseSpeed                                                ;9BCAFA;
    RTS                                                                  ;9BCAFD;

  .positive:
    ASL                                                                  ;9BCAFE;
    TAY                                                                  ;9BCAFF;
    LDA.W GrappleBeam_EndAngle                                           ;9BCB00;
    XBA                                                                  ;9BCB03;
    AND.W #$00FF                                                         ;9BCB04;
    ASL                                                                  ;9BCB07;
    TAX                                                                  ;9BCB08;
    LDA.L SineCosineTables_8bitSine_SignExtended,X                       ;9BCB09;
    BPL +                                                                ;9BCB0D;
    EOR.W #$FFFF                                                         ;9BCB0F;
    INC                                                                  ;9BCB12;
    PHY                                                                  ;9BCB13;
    JSL.L A_Y_16bit_UnsignedMultiplication                               ;9BCB14;
    PLY                                                                  ;9BCB18;
    LDA.W MultiplicationResult                                           ;9BCB19;
    STA.W SamusYSubSpeed                                                 ;9BCB1C;
    LDA.W MultiplicationResult+2                                         ;9BCB1F;
    STA.W SamusYSpeed                                                    ;9BCB22;
    LDA.W #$0001                                                         ;9BCB25;
    STA.W SamusYDirection                                                ;9BCB28;
    BRA ..decelerating                                                   ;9BCB2B;

+   PHY                                                                  ;9BCB2D;
    JSL.L A_Y_16bit_UnsignedMultiplication                               ;9BCB2E;
    PLY                                                                  ;9BCB32;
    LDA.W MultiplicationResult                                           ;9BCB33;
    STA.W SamusYSubSpeed                                                 ;9BCB36;
    LDA.W MultiplicationResult+2                                         ;9BCB39;
    STA.W SamusYSpeed                                                    ;9BCB3C;
    LDA.W #$0002                                                         ;9BCB3F;
    STA.W SamusYDirection                                                ;9BCB42;

  ..decelerating:
    LDA.W #$0002                                                         ;9BCB45;
    STA.W SamusXAccelerationMode                                         ;9BCB48;
    TYA                                                                  ;9BCB4B;
    LSR                                                                  ;9BCB4C;
    XBA                                                                  ;9BCB4D;
    AND.W #$00FF                                                         ;9BCB4E;
    STA.B DP_Temp12                                                      ;9BCB51;
    ASL                                                                  ;9BCB53;
    CLC                                                                  ;9BCB54;
    ADC.B DP_Temp12                                                      ;9BCB55;
    STA.B DP_Temp12                                                      ;9BCB57;
    LDA.W #$0040                                                         ;9BCB59;
    SEC                                                                  ;9BCB5C;
    SBC.B DP_Temp12                                                      ;9BCB5D;
    STA.B DP_Temp12                                                      ;9BCB5F;
    LDA.W GrappleBeam_EndAngle                                           ;9BCB61;
    XBA                                                                  ;9BCB64;
    AND.W #$00FF                                                         ;9BCB65;
    SEC                                                                  ;9BCB68;
    SBC.B DP_Temp12                                                      ;9BCB69;
    AND.W #$00FF                                                         ;9BCB6B;
    ASL                                                                  ;9BCB6E;
    TAX                                                                  ;9BCB6F;
    LDA.L SineCosineTables_8bitSine_SignExtended,X                       ;9BCB70;
    BPL +                                                                ;9BCB74;
    EOR.W #$FFFF                                                         ;9BCB76;
    INC                                                                  ;9BCB79;

+   JSL.L A_Y_16bit_UnsignedMultiplication                               ;9BCB7A;
    LDA.W MultiplicationResult                                           ;9BCB7E;
    STA.W SamusXBaseSubSpeed                                             ;9BCB81;
    LDA.W MultiplicationResult+2                                         ;9BCB84;
    STA.W SamusXBaseSpeed                                                ;9BCB87;
    RTS                                                                  ;9BCB8A;


;;; $CB8B: Grapple beam function - released from swing ;;;
GrappleBeamFunction_ReleasedFromSwing:
    LDA.W #$0007                                                         ;9BCB8B;
    JSL.L QueueSound                                                     ;9BCB8E;
    LDA.W GrappleBeam_SwingAngularVelocity                               ;9BCB92;
    BPL .facingLeft                                                      ;9BCB95;
    LDA.W #$0051                                                         ;9BCB97;
    STA.W SuperSpecialProspectivePose                                    ;9BCB9A;
    BRA +                                                                ;9BCB9D;

  .facingLeft:
    LDA.W #$0052                                                         ;9BCB9F;
    STA.W SuperSpecialProspectivePose                                    ;9BCBA2;

+   LDA.W #$0007                                                         ;9BCBA5;
    STA.W SuperSpecialProspectivePoseChangeCommand                       ;9BCBA8;
    STZ.W GrappleBeam_neverRead0D1E                                      ;9BCBAB;
    STZ.W GrappleBeam_neverRead0D20                                      ;9BCBAE;
    STZ.W GrappleBeam_DirectionFired                                     ;9BCBB1;
    STZ.W GrappleBeam_SpecialAngleHandlingFlag                           ;9BCBB4;
    STZ.W GrappleWalljumpTimer                                           ;9BCBB7;
    STZ.W GrappleBeam_SlowScrollingFlag                                  ;9BCBBA;
    STZ.W GrappleBeam_PoseChangeAutoFireTimer                            ;9BCBBD;
    STZ.W GrappleBeam_Flags                                              ;9BCBC0;
    STZ.W SamusProjectile_FlareCounter                                   ;9BCBC3;
    STZ.W SamusProjectile_FlareAnimationFrame                            ;9BCBC6;
    STZ.W SamusProjectile_FlareSlowSparksAnimationFrame0CD8              ;9BCBC9;
    STZ.W SamusProjectile_FlareFastSparksAnimationFrame0CDA              ;9BCBCC;
    STZ.W SamusProjectile_FlareAnimationTimer                            ;9BCBCF;
    STZ.W SamusProjectile_FlareSlowSparksAnimationFrame0CDE              ;9BCBD2;
    STZ.W SamusProjectile_FlareFastSparksAnimationFrame0CE0              ;9BCBD5;
    LDA.W EquippedBeams                                                  ;9BCBD8;
    JSL.L Load_Beam_Palette_External                                     ;9BCBDB;
    LDA.W #GrappleBeamFunction_Inactive                                  ;9BCBDF;
    STA.W GrappleBeam_Function                                           ;9BCBE2;
    LDA.W #SamusDrawingHandler_Default                                   ;9BCBE5;
    STA.W DrawingHandler                                                 ;9BCBE8;
    JSL.L PostGrappleCollisionDetection                                  ;9BCBEB;
    LDA.W AutoCancelHUDItemIndex                                         ;9BCBEF;
    BEQ .return                                                          ;9BCBF2;
    STZ.W SelectedHUDItem                                                ;9BCBF4;
    STZ.W AutoCancelHUDItemIndex                                         ;9BCBF7;

  .return:
    RTS                                                                  ;9BCBFA;


Freespace_Bank9B_CBFB:                                                   ;9BCBFB;
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


Freespace_Bank9B_FDA0:                                                   ;9BFDA0;
; $260 bytes
