
org $928000


Set_SamusTilesDefinitions_ForCurrentAnimation:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W $0A96 
    ASL #2
    STA.B $12 
    INC #2
    STA.B $14 
    LDA.W $0A1C 
    ASL A 
    TAX 
    LDA.W SamusTilesAnimation_AnimationDefinitionPointers,X 
    CLC : ADC.B $12 
    TAX 
    LDA.W $0000,X 
    AND.W #$00FF 
    STA.B $16 
    ASL A 
    TAY 
    INX 
    LDA.W $0000,X 
    AND.W #$00FF 
    STA.W $0B24 
    ASL #3
    SEC : SBC.W $0B24 
    STA.B $12 
    LDA.W SamusTopHalfTilesAnimation_TilesDefinitionPointers,Y 
    CLC : ADC.B $12 
    STA.W $071F 
    SEP #$20 
    LDA.B #$01 : STA.W $071D 
    REP #$20 
    LDA.W $0A1C 
    ASL A 
    TAX 
    LDA.W SamusTilesAnimation_AnimationDefinitionPointers,X 
    CLC : ADC.B $14 
    TAX 
    LDA.W $0000,X 
    AND.W #$00FF 
    CMP.W #$00FF 
    BEQ .return 
    ASL A 
    TAY 
    INX 
    LDA.W $0000,X 
    AND.W #$00FF 
    STA.W $0B26 
    ASL #3
    SEC : SBC.W $0B26 
    STA.B $14 
    LDA.W SamusBottomHalfTilesAnimation_TilesDefinitionPointers,Y 
    CLC : ADC.B $14 
    STA.W $0721 
    SEP #$20 
    LDA.B #$01 : STA.W $071E 
    REP #$20 

.return:
    PLB 
    PLP 
    RTL 


SamusSpritemapTable:
    dw UNUSED_Debug_SamusSpritemap_0_9290ED 
    dw UNUSED_Debug_SamusSpritemap_1_9290F4 
    dw SamusSpritemaps_9A6F 
    dw $0000 
    dw SamusSpritemaps_A13A 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A169 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A18E 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A13A 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A169 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A18E 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A13A 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A169 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A18E 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A13A 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A169 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A18E 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A13A 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A169 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A18E 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A13A 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A169 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A18E 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A13A 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A169 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A18E 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A13A 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A169 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A18E 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A13A 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A169 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A18E 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A13A 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A169 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A18E 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A13A 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A169 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A18E 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A13A 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A169 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A18E 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A13A 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A169 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A18E 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A1C7 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A214 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A23E 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A272 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A2AB 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A23E 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A272 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A2AB 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_AE44 
    dw $0000 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_B24E 
    dw SamusSpritemaps_9976 
    dw $0000 
    dw SamusSpritemaps_A13A 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A169 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A18E 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A13A 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A169 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A18E 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A13A 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A169 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A18E 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A13A 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A169 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A18E 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A13A 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A169 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A18E 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A13A 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A169 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A18E 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A13A 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A169 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A18E 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A13A 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A169 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A18E 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A13A 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A169 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A18E 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A13A 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A169 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A18E 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A13A 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A169 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A18E 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A13A 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A169 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A18E 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A13A 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A169 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A18E 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A1C7 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A214 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A23E 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A272 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A2AB 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A23E 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A272 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_A2AB 
    dw SamusSpritemaps_A12C 
    dw SamusSpritemaps_AE6E 
    dw $0000 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusSpritemaps_B26E 
    dw SamusTileViewer_SamusTopHalf 
    dw SamusTileViewer_SamusBottomHalf 
    dw SamusTileViewer_Beam 
    dw SamusTileViewer_GrappleBeam 
    dw SamusSpritemaps_AtmosphericGraphics_Bubbles_0 
    dw SamusSpritemaps_AtmosphericGraphics_Bubbles_1 
    dw SamusSpritemaps_AtmosphericGraphics_Bubbles_2 
    dw SamusSpritemaps_AtmosphericGraphics_Bubbles_3 
    dw SamusSpritemaps_AtmosphericGraphics_Bubbles_4 
    dw SamusSpritemaps_AtmosphericGraphics_Bubbles_5 
    dw SamusSpritemaps_AtmosphericGraphics_Bubbles_6 
    dw SamusSpritemaps_AtmosphericGraphics_Bubbles_7 
    dw SamusSpritemaps_AtmosphericGraphics_Bubbles_8 
    dw SamusSpritemaps_AtmosphericGraphics_DivingSplash_0 
    dw SamusSpritemaps_AtmosphericGraphics_DivingSplash_1 
    dw SamusSpritemaps_AtmosphericGraphics_DivingSplash_2 
    dw SamusSpritemaps_AtmosphericGraphics_DivingSplash_3 
    dw SamusSpritemaps_AtmosphericGraphics_DivingSplash_4 
    dw SamusSpritemaps_AtmosphericGraphics_DivingSplash_5 
    dw SamusSpritemaps_AtmosphericGraphics_DivingSplash_6 
    dw SamusSpritemaps_AtmosphericGraphics_DivingSplash_7 
    dw SamusSpritemaps_AtmosphericGraphics_DivingSplash_8 
    dw SamusSpritemaps_9657 
    dw SamusSpritemaps_9657 
    dw SamusSpritemaps_A072 
    dw SamusSpritemaps_A088 
    dw SamusSpritemaps_A09E 
    dw SamusSpritemaps_A088 
    dw $0000 
    dw SamusSpritemaps_A072 
    dw SamusSpritemaps_A088 
    dw SamusSpritemaps_A0F6 
    dw SamusSpritemaps_A088 
    dw SamusSpritemaps_A0B4 
    dw SamusSpritemaps_A0CA 
    dw SamusSpritemaps_A0E0 
    dw SamusSpritemaps_A0CA 
    dw $0000 
    dw SamusSpritemaps_A0B4 
    dw SamusSpritemaps_A0CA 
    dw SamusSpritemaps_A111 
    dw SamusSpritemaps_A0CA 
    dw SamusSpritemaps_9657 
    dw SamusSpritemaps_97B1 
    dw SamusSpritemaps_97FF 
    dw SamusSpritemaps_97C7 
    dw SamusSpritemaps_981A 
    dw SamusSpritemaps_97B1 
    dw SamusSpritemaps_97B1 
    dw SamusSpritemaps_97C7 
    dw SamusSpritemaps_97C7 
    dw SamusSpritemaps_9745 
    dw SamusSpritemaps_9745 
    dw SamusSpritemaps_9760 
    dw SamusSpritemaps_9760 
    dw SamusSpritemaps_9B6F 
    dw SamusSpritemaps_9BAE 
    dw SamusSpritemaps_9B80 
    dw SamusSpritemaps_9BBF 
    dw SamusSpritemaps_9BAE 
    dw SamusSpritemaps_9B6F 
    dw SamusSpritemaps_9BAE 
    dw SamusSpritemaps_9BBF 
    dw SamusSpritemaps_9B80 
    dw SamusSpritemaps_9BBF 
    dw SamusSpritemaps_9C26 
    dw SamusSpritemaps_9C0B 
    dw SamusSpritemaps_977B 
    dw SamusSpritemaps_9C41 
    dw SamusSpritemaps_9C5C 
    dw SamusSpritemaps_9C92 
    dw SamusSpritemaps_9C77 
    dw SamusSpritemaps_9796 
    dw SamusSpritemaps_9CAD 
    dw SamusSpritemaps_9CC8 
    dw SamusSpritemaps_97FF 
    dw SamusSpritemaps_97FF 
    dw SamusSpritemaps_981A 
    dw SamusSpritemaps_981A 
    dw SamusSpritemaps_977B 
    dw SamusSpritemaps_977B 
    dw SamusSpritemaps_9796 
    dw SamusSpritemaps_9796 
    dw SamusSpritemaps_9796 
    dw SamusSpritemaps_9E48 
    dw SamusSpritemaps_9E48 
    dw SamusSpritemaps_9796 
    dw SamusSpritemaps_9E48 
    dw SamusSpritemaps_9E48 
    dw SamusSpritemaps_977B 
    dw SamusSpritemaps_9E2D 
    dw SamusSpritemaps_9E2D 
    dw SamusSpritemaps_977B 
    dw SamusSpritemaps_9E2D 
    dw SamusSpritemaps_9E2D 
    dw SamusSpritemaps_9872 
    dw SamusSpritemaps_9CFE 
    dw SamusSpritemaps_9CFE 
    dw SamusSpritemaps_9872 
    dw SamusSpritemaps_9CFE 
    dw SamusSpritemaps_9CFE 
    dw SamusSpritemaps_9857 
    dw SamusSpritemaps_9CE3 
    dw SamusSpritemaps_9CE3 
    dw SamusSpritemaps_9857 
    dw SamusSpritemaps_9CE3 
    dw SamusSpritemaps_9CE3 
    dw SamusSpritemaps_9725 
    dw SamusSpritemaps_9BEB 
    dw SamusSpritemaps_9BEB 
    dw SamusSpritemaps_9725 
    dw SamusSpritemaps_9BEB 
    dw SamusSpritemaps_9BEB 
    dw SamusSpritemaps_9705 
    dw SamusSpritemaps_9BCB 
    dw SamusSpritemaps_9BCB 
    dw SamusSpritemaps_9705 
    dw SamusSpritemaps_9BCB 
    dw SamusSpritemaps_9BCB 
    dw SamusSpritemaps_9657 
    dw SamusSpritemaps_9A3F 
    dw SamusSpritemaps_966F 
    dw SamusSpritemaps_9680 
    dw SamusSpritemaps_9663 
    dw SamusSpritemaps_9657 
    dw SamusSpritemaps_9A4B 
    dw SamusSpritemaps_969D 
    dw SamusSpritemaps_9835 
    dw SamusSpritemaps_9691 
    dw SamusSpritemaps_96AE 
    dw SamusSpritemaps_9A57 
    dw SamusSpritemaps_96C6 
    dw SamusSpritemaps_96D7 
    dw SamusSpritemaps_96BA 
    dw SamusSpritemaps_96AE 
    dw SamusSpritemaps_9A63 
    dw SamusSpritemaps_96F4 
    dw SamusSpritemaps_9846 
    dw SamusSpritemaps_96E8 
    dw SamusSpritemaps_A2D0 
    dw SamusSpritemaps_A440 
    dw SamusSpritemaps_A2F2 
    dw SamusSpritemaps_A308 
    dw SamusSpritemaps_A2E1 
    dw SamusSpritemaps_A2D0 
    dw SamusSpritemaps_A323 
    dw SamusSpritemaps_A334 
    dw SamusSpritemaps_A400 
    dw SamusSpritemaps_A323 
    dw SamusSpritemaps_A34A 
    dw SamusSpritemaps_A451 
    dw SamusSpritemaps_A3A0 
    dw SamusSpritemaps_A380 
    dw SamusSpritemaps_A365 
    dw SamusSpritemaps_A34A 
    dw SamusSpritemaps_A3C0 
    dw SamusSpritemaps_A41B 
    dw SamusSpritemaps_A3DB 
    dw SamusSpritemaps_A3C0 
    dw SamusSpritemaps_97FF 
    dw SamusSpritemaps_97FF 
    dw SamusSpritemaps_9CAD 
    dw SamusSpritemaps_9E9E 
    dw SamusSpritemaps_9CAD 
    dw SamusSpritemaps_97FF 
    dw SamusSpritemaps_97FF 
    dw SamusSpritemaps_9CAD 
    dw SamusSpritemaps_9E9E 
    dw SamusSpritemaps_9CAD 
    dw SamusSpritemaps_981A 
    dw SamusSpritemaps_981A 
    dw SamusSpritemaps_9CC8 
    dw SamusSpritemaps_9EB9 
    dw SamusSpritemaps_9CC8 
    dw SamusSpritemaps_981A 
    dw SamusSpritemaps_981A 
    dw SamusSpritemaps_9CC8 
    dw SamusSpritemaps_9EB9 
    dw SamusSpritemaps_9CC8 
    dw SamusSpritemaps_9857 
    dw SamusSpritemaps_9857 
    dw SamusSpritemaps_9CE3 
    dw SamusSpritemaps_9DB2 
    dw SamusSpritemaps_9CE3 
    dw SamusSpritemaps_9857 
    dw SamusSpritemaps_9857 
    dw SamusSpritemaps_9CE3 
    dw SamusSpritemaps_9DB2 
    dw SamusSpritemaps_9CE3 
    dw SamusSpritemaps_9872 
    dw SamusSpritemaps_9872 
    dw SamusSpritemaps_9CFE 
    dw SamusSpritemaps_9DCD 
    dw SamusSpritemaps_9CFE 
    dw SamusSpritemaps_9872 
    dw SamusSpritemaps_9872 
    dw SamusSpritemaps_9CFE 
    dw SamusSpritemaps_9DCD 
    dw SamusSpritemaps_9CFE 
    dw SamusSpritemaps_9705 
    dw SamusSpritemaps_9705 
    dw SamusSpritemaps_9BCB 
    dw SamusSpritemaps_9DED 
    dw SamusSpritemaps_9BCB 
    dw SamusSpritemaps_9705 
    dw SamusSpritemaps_9705 
    dw SamusSpritemaps_9BCB 
    dw SamusSpritemaps_9DED 
    dw SamusSpritemaps_9BCB 
    dw SamusSpritemaps_9725 
    dw SamusSpritemaps_9725 
    dw SamusSpritemaps_9BEB 
    dw SamusSpritemaps_9E0D 
    dw SamusSpritemaps_9BEB 
    dw SamusSpritemaps_9725 
    dw SamusSpritemaps_9725 
    dw SamusSpritemaps_9BEB 
    dw SamusSpritemaps_9E0D 
    dw SamusSpritemaps_9BEB 
    dw SamusSpritemaps_97EE 
    dw SamusSpritemaps_97EE 
    dw SamusSpritemaps_9C92 
    dw SamusSpritemaps_9E83 
    dw SamusSpritemaps_9C92 
    dw SamusSpritemaps_97EE 
    dw SamusSpritemaps_97EE 
    dw SamusSpritemaps_9C92 
    dw SamusSpritemaps_9E83 
    dw SamusSpritemaps_9C92 
    dw SamusSpritemaps_97DD 
    dw SamusSpritemaps_97DD 
    dw SamusSpritemaps_9C77 
    dw SamusSpritemaps_9E63 
    dw SamusSpritemaps_9C77 
    dw SamusSpritemaps_97DD 
    dw SamusSpritemaps_97DD 
    dw SamusSpritemaps_9C77 
    dw SamusSpritemaps_9E63 
    dw SamusSpritemaps_9C77 
    dw SamusSpritemaps_9705 
    dw SamusSpritemaps_9B17 
    dw SamusSpritemaps_9725 
    dw SamusSpritemaps_9B2D 
    dw SamusSpritemaps_977B 
    dw SamusSpritemaps_977B 
    dw SamusSpritemaps_9796 
    dw SamusSpritemaps_9796 
    dw SamusSpritemaps_97B1 
    dw SamusSpritemaps_97FF 
    dw SamusSpritemaps_97C7 
    dw SamusSpritemaps_981A 
    dw SamusSpritemaps_9857 
    dw SamusSpritemaps_9857 
    dw SamusSpritemaps_9872 
    dw SamusSpritemaps_9872 
    dw SamusSpritemaps_9705 
    dw SamusSpritemaps_9705 
    dw SamusSpritemaps_9725 
    dw SamusSpritemaps_9725 
    dw SamusSpritemaps_977B 
    dw SamusSpritemaps_977B 
    dw SamusSpritemaps_9796 
    dw SamusSpritemaps_9796 
    dw SamusSpritemaps_9B6F 
    dw SamusSpritemaps_9B80 
    dw SamusSpritemaps_9691 
    dw SamusSpritemaps_969D 
    dw SamusSpritemaps_9691 
    dw SamusSpritemaps_9657 
    dw SamusSpritemaps_9663 
    dw SamusSpritemaps_97DD 
    dw SamusSpritemaps_96E8 
    dw SamusSpritemaps_96F4 
    dw SamusSpritemaps_96E8 
    dw SamusSpritemaps_96AE 
    dw SamusSpritemaps_96BA 
    dw SamusSpritemaps_97EE 
    dw SamusSpritemaps_9BBF 
    dw SamusSpritemaps_9BBF 
    dw SamusSpritemaps_BB94 
    dw SamusSpritemaps_BB88 
    dw SamusSpritemaps_BB72 
    dw SamusSpritemaps_BB66 
    dw SamusSpritemaps_BB50 
    dw SamusSpritemaps_BB44 
    dw SamusSpritemaps_BB2E 
    dw SamusSpritemaps_9EB9 
    dw SamusSpritemaps_9BAE 
    dw SamusSpritemaps_9BAE 
    dw SamusSpritemaps_BDD9 
    dw SamusSpritemaps_BDCD 
    dw SamusSpritemaps_BDB7 
    dw SamusSpritemaps_BDAB 
    dw SamusSpritemaps_BD95 
    dw SamusSpritemaps_BD89 
    dw SamusSpritemaps_BD73 
    dw SamusSpritemaps_9E83 
    dw SamusSpritemaps_9A93 
    dw SamusSpritemaps_9A1F 
    dw SamusSpritemaps_9AAE 
    dw SamusSpritemaps_99FF 
    dw SamusSpritemaps_9A7B 
    dw SamusSpritemaps_BD67 
    dw SamusSpritemaps_BD73 
    dw SamusSpritemaps_BD89 
    dw SamusSpritemaps_BD95 
    dw SamusSpritemaps_BDAB 
    dw SamusSpritemaps_BDB7 
    dw SamusSpritemaps_BDCD 
    dw SamusSpritemaps_BDD9 
    dw SamusSpritemaps_9A87 
    dw SamusSpritemaps_BB22 
    dw SamusSpritemaps_BB2E 
    dw SamusSpritemaps_BB44 
    dw SamusSpritemaps_BB50 
    dw SamusSpritemaps_BB66 
    dw SamusSpritemaps_BB72 
    dw SamusSpritemaps_BB88 
    dw SamusSpritemaps_BB94 
    dw SamusSpritemaps_9A7B 
    dw SamusSpritemaps_9BAE 
    dw $0000 
    dw SamusSpritemaps_BD67 
    dw SamusSpritemaps_BD73 
    dw SamusSpritemaps_BD89 
    dw SamusSpritemaps_BD95 
    dw SamusSpritemaps_BDAB 
    dw SamusSpritemaps_BDB7 
    dw SamusSpritemaps_BDCD 
    dw SamusSpritemaps_BDD9 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_BEBF 
    dw SamusSpritemaps_BEBF 
    dw SamusSpritemaps_BEBF 
    dw SamusSpritemaps_BEBF 
    dw SamusSpritemaps_BEBF 
    dw SamusSpritemaps_BEBF 
    dw SamusSpritemaps_BEBF 
    dw SamusSpritemaps_BEBF 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_BDEF 
    dw SamusSpritemaps_BDEF 
    dw SamusSpritemaps_BDEF 
    dw SamusSpritemaps_BEBF 
    dw SamusSpritemaps_BEBF 
    dw SamusSpritemaps_BEBF 
    dw SamusSpritemaps_BE23 
    dw SamusSpritemaps_BE23 
    dw SamusSpritemaps_BE23 
    dw SamusSpritemaps_BEBF 
    dw SamusSpritemaps_BEBF 
    dw SamusSpritemaps_BEBF 
    dw SamusSpritemaps_BE5C 
    dw SamusSpritemaps_BE5C 
    dw SamusSpritemaps_BE5C 
    dw SamusSpritemaps_BEBF 
    dw SamusSpritemaps_BEBF 
    dw SamusSpritemaps_BEBF 
    dw SamusSpritemaps_BE95 
    dw SamusSpritemaps_BE95 
    dw SamusSpritemaps_BE95 
    dw SamusSpritemaps_BEBF 
    dw SamusSpritemaps_BEBF 
    dw SamusSpritemaps_BEBF 
    dw SamusSpritemaps_9A87 
    dw SamusSpritemaps_9BBF 
    dw $0000 
    dw SamusSpritemaps_BB22 
    dw SamusSpritemaps_BB2E 
    dw SamusSpritemaps_BB44 
    dw SamusSpritemaps_BB50 
    dw SamusSpritemaps_BB66 
    dw SamusSpritemaps_BB72 
    dw SamusSpritemaps_BB88 
    dw SamusSpritemaps_BB94 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_BC7A 
    dw SamusSpritemaps_BC7A 
    dw SamusSpritemaps_BC7A 
    dw SamusSpritemaps_BC7A 
    dw SamusSpritemaps_BC7A 
    dw SamusSpritemaps_BC7A 
    dw SamusSpritemaps_BC7A 
    dw SamusSpritemaps_BC7A 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_BBAA 
    dw SamusSpritemaps_BBAA 
    dw SamusSpritemaps_BBAA 
    dw SamusSpritemaps_BC7A 
    dw SamusSpritemaps_BC7A 
    dw SamusSpritemaps_BC7A 
    dw SamusSpritemaps_BBDE 
    dw SamusSpritemaps_BBDE 
    dw SamusSpritemaps_BBDE 
    dw SamusSpritemaps_BC7A 
    dw SamusSpritemaps_BC7A 
    dw SamusSpritemaps_BC7A 
    dw SamusSpritemaps_BC17 
    dw SamusSpritemaps_BC17 
    dw SamusSpritemaps_BC17 
    dw SamusSpritemaps_BC7A 
    dw SamusSpritemaps_BC7A 
    dw SamusSpritemaps_BC7A 
    dw SamusSpritemaps_BC50 
    dw SamusSpritemaps_BC50 
    dw SamusSpritemaps_BC50 
    dw SamusSpritemaps_BC7A 
    dw SamusSpritemaps_BC7A 
    dw SamusSpritemaps_BC7A 
    dw SamusSpritemaps_98AD 
    dw SamusSpritemaps_98AD 
    dw SamusSpritemaps_9892 
    dw SamusSpritemaps_9892 
    dw SamusSpritemaps_9892 
    dw SamusSpritemaps_98AD 
    dw SamusSpritemaps_9928 
    dw SamusSpritemaps_9928 
    dw SamusSpritemaps_9976 
    dw SamusSpritemaps_9912 
    dw SamusSpritemaps_9912 
    dw SamusSpritemaps_996F 
    dw SamusSpritemaps_9998 
    dw SamusSpritemaps_99CE 
    dw SamusSpritemaps_9982 
    dw SamusSpritemaps_99AE 
    dw SamusSpritemaps_9A1F 
    dw SamusSpritemaps_99FF 
    dw SamusSpritemaps_9B2D 
    dw SamusSpritemaps_9B17 
    dw SamusSpritemaps_A96B 
    dw SamusSpritemaps_A955 
    dw SamusSpritemaps_A944 
    dw SamusSpritemaps_A933 
    dw SamusSpritemaps_A922 
    dw SamusSpritemaps_A911 
    dw SamusSpritemaps_A900 
    dw SamusSpritemaps_A8EA 
    dw SamusSpritemaps_A8D4 
    dw SamusSpritemaps_A584 
    dw SamusSpritemaps_A573 
    dw SamusSpritemaps_A562 
    dw SamusSpritemaps_A551 
    dw SamusSpritemaps_A540 
    dw SamusSpritemaps_A52F 
    dw SamusSpritemaps_A519 
    dw SamusSpritemaps_A503 
    dw SamusSpritemaps_A4ED 
    dw SamusSpritemaps_A4DC 
    dw SamusSpritemaps_A4CB 
    dw SamusSpritemaps_A4BA 
    dw SamusSpritemaps_A4A9 
    dw SamusSpritemaps_A498 
    dw SamusSpritemaps_A482 
    dw SamusSpritemaps_A46C 
    dw SamusSpritemaps_A9EC 
    dw SamusSpritemaps_A9DB 
    dw SamusSpritemaps_A9CA 
    dw SamusSpritemaps_A9B9 
    dw SamusSpritemaps_A9A8 
    dw SamusSpritemaps_A997 
    dw SamusSpritemaps_A981 
    dw SamusSpritemaps_A96B 
    dw SamusSpritemaps_A955 
    dw SamusSpritemaps_A944 
    dw SamusSpritemaps_A933 
    dw SamusSpritemaps_A922 
    dw SamusSpritemaps_A911 
    dw SamusSpritemaps_A900 
    dw SamusSpritemaps_A8EA 
    dw SamusSpritemaps_A8D4 
    dw SamusSpritemaps_A584 
    dw SamusSpritemaps_A573 
    dw SamusSpritemaps_A562 
    dw SamusSpritemaps_A551 
    dw SamusSpritemaps_A540 
    dw SamusSpritemaps_A52F 
    dw SamusSpritemaps_A519 
    dw SamusSpritemaps_A503 
    dw SamusSpritemaps_A4ED 
    dw SamusSpritemaps_A4DC 
    dw SamusSpritemaps_A4CB 
    dw SamusSpritemaps_A4BA 
    dw SamusSpritemaps_A4A9 
    dw SamusSpritemaps_A498 
    dw SamusSpritemaps_A482 
    dw SamusSpritemaps_A46C 
    dw SamusSpritemaps_A9EC 
    dw SamusSpritemaps_A9DB 
    dw SamusSpritemaps_A9CA 
    dw SamusSpritemaps_A9B9 
    dw SamusSpritemaps_A9A8 
    dw SamusSpritemaps_A997 
    dw SamusSpritemaps_A981 
    dw SamusSpritemaps_A503 
    dw SamusSpritemaps_A503 
    dw SamusSpritemaps_AB8B 
    dw SamusSpritemaps_ABB5 
    dw SamusSpritemaps_ABDF 
    dw SamusSpritemaps_AC0E 
    dw SamusSpritemaps_AC42 
    dw SamusSpritemaps_AC76 
    dw SamusSpritemaps_ACAA 
    dw SamusSpritemaps_ACDE 
    dw SamusSpritemaps_A5B0 
    dw SamusSpritemaps_A5DA 
    dw SamusSpritemaps_A604 
    dw SamusSpritemaps_A638 
    dw SamusSpritemaps_A66C 
    dw SamusSpritemaps_A69B 
    dw SamusSpritemaps_A6CA 
    dw SamusSpritemaps_A6F9 
    dw SamusSpritemaps_A723 
    dw SamusSpritemaps_A74D 
    dw SamusSpritemaps_A777 
    dw SamusSpritemaps_A7A6 
    dw SamusSpritemaps_A7DA 
    dw SamusSpritemaps_A80E 
    dw SamusSpritemaps_A842 
    dw SamusSpritemaps_A876 
    dw SamusSpritemaps_AA18 
    dw SamusSpritemaps_AA42 
    dw SamusSpritemaps_AA6C 
    dw SamusSpritemaps_AAA0 
    dw SamusSpritemaps_AAD4 
    dw SamusSpritemaps_AB03 
    dw SamusSpritemaps_AB32 
    dw SamusSpritemaps_AB61 
    dw SamusSpritemaps_AB8B 
    dw SamusSpritemaps_ABB5 
    dw SamusSpritemaps_ABDF 
    dw SamusSpritemaps_AC0E 
    dw SamusSpritemaps_AC42 
    dw SamusSpritemaps_AC76 
    dw SamusSpritemaps_ACAA 
    dw SamusSpritemaps_ACDE 
    dw SamusSpritemaps_A5B0 
    dw SamusSpritemaps_A5DA 
    dw SamusSpritemaps_A604 
    dw SamusSpritemaps_A638 
    dw SamusSpritemaps_A66C 
    dw SamusSpritemaps_A69B 
    dw SamusSpritemaps_A6CA 
    dw SamusSpritemaps_A6F9 
    dw SamusSpritemaps_A723 
    dw SamusSpritemaps_A74D 
    dw SamusSpritemaps_A777 
    dw SamusSpritemaps_A7A6 
    dw SamusSpritemaps_A7DA 
    dw SamusSpritemaps_A80E 
    dw SamusSpritemaps_A842 
    dw SamusSpritemaps_A876 
    dw SamusSpritemaps_AA18 
    dw SamusSpritemaps_AA42 
    dw SamusSpritemaps_AA6C 
    dw SamusSpritemaps_AAA0 
    dw SamusSpritemaps_AAD4 
    dw SamusSpritemaps_AB03 
    dw SamusSpritemaps_AB32 
    dw SamusSpritemaps_AB61 
    dw SamusSpritemaps_A723 
    dw SamusSpritemaps_A723 
    dw SamusSpritemaps_9BAE 
    dw SamusSpritemaps_9E63 
    dw SamusSpritemaps_9E83 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_9E63 
    dw SamusSpritemaps_9BAE 
    dw SamusSpritemaps_9BBF 
    dw SamusSpritemaps_9E9E 
    dw SamusSpritemaps_9EB9 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_9E9E 
    dw SamusSpritemaps_9BBF 
    dw SamusSpritemaps_977B 
    dw SamusSpritemaps_977B 
    dw SamusSpritemaps_977B 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_977B 
    dw SamusSpritemaps_977B 
    dw SamusSpritemaps_9796 
    dw SamusSpritemaps_9796 
    dw SamusSpritemaps_9796 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_9796 
    dw SamusSpritemaps_9796 
    dw SamusSpritemaps_97B1 
    dw SamusSpritemaps_97FF 
    dw SamusSpritemaps_97FF 
    dw SamusSpritemaps_97C7 
    dw SamusSpritemaps_981A 
    dw SamusSpritemaps_981A 
    dw SamusSpritemaps_9705 
    dw SamusSpritemaps_9B17 
    dw SamusSpritemaps_9725 
    dw SamusSpritemaps_9B2D 
    dw SamusSpritemaps_9857 
    dw SamusSpritemaps_9857 
    dw SamusSpritemaps_9857 
    dw SamusSpritemaps_9872 
    dw SamusSpritemaps_9872 
    dw SamusSpritemaps_9872 
    dw SamusSpritemaps_9705 
    dw SamusSpritemaps_9705 
    dw SamusSpritemaps_9705 
    dw SamusSpritemaps_9725 
    dw SamusSpritemaps_9725 
    dw SamusSpritemaps_9725 
    dw SamusSpritemaps_97B1 
    dw SamusSpritemaps_97C7 
    dw SamusSpritemaps_9745 
    dw SamusSpritemaps_9760 
    dw SamusSpritemaps_97B1 
    dw SamusSpritemaps_97FF 
    dw SamusSpritemaps_97C7 
    dw SamusSpritemaps_981A 
    dw SamusSpritemaps_A072 
    dw SamusSpritemaps_A088 
    dw SamusSpritemaps_A09E 
    dw SamusSpritemaps_A088 
    dw $0000 
    dw SamusSpritemaps_A072 
    dw SamusSpritemaps_A088 
    dw SamusSpritemaps_A0F6 
    dw SamusSpritemaps_A088 
    dw SamusSpritemaps_A0B4 
    dw SamusSpritemaps_A0CA 
    dw SamusSpritemaps_A0E0 
    dw SamusSpritemaps_A0CA 
    dw $0000 
    dw SamusSpritemaps_A0B4 
    dw SamusSpritemaps_A0CA 
    dw SamusSpritemaps_A111 
    dw SamusSpritemaps_A0CA 
    dw SamusSpritemaps_977B 
    dw SamusSpritemaps_9796 
    dw SamusSpritemaps_BCDD 
    dw SamusSpritemaps_BCCC 
    dw SamusSpritemaps_BCB1 
    dw SamusSpritemaps_BCA0 
    dw SamusSpritemaps_BCCC 
    dw SamusSpritemaps_BCDD 
    dw SamusSpritemaps_BCA0 
    dw SamusSpritemaps_BCB1 
    dw SamusSpritemaps_977B 
    dw SamusSpritemaps_BCDD 
    dw SamusSpritemaps_BCCC 
    dw SamusSpritemaps_9796 
    dw SamusSpritemaps_BCB1 
    dw SamusSpritemaps_BCA0 
    dw SamusSpritemaps_BCCC 
    dw SamusSpritemaps_BCDD 
    dw SamusSpritemaps_977B 
    dw SamusSpritemaps_BCA0 
    dw SamusSpritemaps_BCB1 
    dw SamusSpritemaps_9796 
    dw SamusSpritemaps_9998 
    dw SamusSpritemaps_99E9 
    dw SamusSpritemaps_9982 
    dw SamusSpritemaps_9982 
    dw SamusSpritemaps_99E9 
    dw SamusSpritemaps_9998 
    dw SamusSpritemaps_99CE 
    dw SamusSpritemaps_993E 
    dw SamusSpritemaps_99AE 
    dw SamusSpritemaps_99AE 
    dw SamusSpritemaps_993E 
    dw SamusSpritemaps_99CE 
    dw SamusSpritemaps_9AF7 
    dw SamusSpritemaps_9954 
    dw SamusSpritemaps_9AD7 
    dw SamusSpritemaps_9AD7 
    dw SamusSpritemaps_9954 
    dw SamusSpritemaps_9AF7 
    dw SamusSpritemaps_9BAE 
    dw SamusSpritemaps_9857 
    dw SamusSpritemaps_977B 
    dw SamusSpritemaps_9705 
    dw SamusSpritemaps_9BBF 
    dw SamusSpritemaps_9872 
    dw SamusSpritemaps_9796 
    dw SamusSpritemaps_9725 
    dw SamusSpritemaps_9663 
    dw SamusSpritemaps_966F 
    dw SamusSpritemaps_9657 
    dw SamusSpritemaps_9691 
    dw SamusSpritemaps_969D 
    dw SamusSpritemaps_9657 
    dw SamusSpritemaps_96BA 
    dw SamusSpritemaps_96C6 
    dw SamusSpritemaps_96AE 
    dw SamusSpritemaps_96E8 
    dw SamusSpritemaps_96F4 
    dw SamusSpritemaps_96AE 
    dw SamusSpritemaps_9A93 
    dw SamusSpritemaps_9AAE 
    dw SamusSpritemaps_9A93 
    dw SamusSpritemaps_9AAE 
    dw SamusSpritemaps_BCCC 
    dw SamusSpritemaps_BCDD 
    dw SamusSpritemaps_C207 
    dw SamusSpritemaps_BCDD 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_C207 
    dw SamusSpritemaps_C22C 
    dw SamusSpritemaps_C251 
    dw SamusSpritemaps_C22C 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_BCDD 
    dw SamusSpritemaps_BCDD 
    dw SamusSpritemaps_977B 
    dw SamusSpritemaps_BCA0 
    dw SamusSpritemaps_BCB1 
    dw SamusSpritemaps_C198 
    dw SamusSpritemaps_BCB1 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_C198 
    dw SamusSpritemaps_C1BD 
    dw SamusSpritemaps_C1E2 
    dw SamusSpritemaps_C1BD 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_BCB1 
    dw SamusSpritemaps_BCB1 
    dw SamusSpritemaps_9796 
    dw SamusSpritemaps_BAB3 
    dw SamusSpritemaps_BCCC 
    dw SamusSpritemaps_BCDD 
    dw SamusSpritemaps_977B 
    dw SamusSpritemaps_98AD 
    dw SamusSpritemaps_98AD 
    dw SamusSpritemaps_BB16 
    dw SamusSpritemaps_BCA0 
    dw SamusSpritemaps_BCB1 
    dw SamusSpritemaps_9796 
    dw SamusSpritemaps_9892 
    dw SamusSpritemaps_9892 
    dw SamusSpritemaps_BAB3 
    dw SamusSpritemaps_BCCC 
    dw SamusSpritemaps_BCDD 
    dw SamusSpritemaps_98AD 
    dw SamusSpritemaps_98AD 
    dw SamusSpritemaps_98AD 
    dw SamusSpritemaps_98AD 
    dw SamusSpritemaps_98AD 
    dw SamusSpritemaps_9F34 
    dw SamusSpritemaps_9F59 
    dw SamusSpritemaps_9F7E 
    dw SamusSpritemaps_9F59 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_977B 
    dw SamusSpritemaps_BCA0 
    dw SamusSpritemaps_BCB1 
    dw SamusSpritemaps_9892 
    dw SamusSpritemaps_9892 
    dw SamusSpritemaps_9892 
    dw SamusSpritemaps_9892 
    dw SamusSpritemaps_9892 
    dw SamusSpritemaps_9EF4 
    dw SamusSpritemaps_9ED4 
    dw SamusSpritemaps_9EF4 
    dw SamusSpritemaps_9F14 
    dw SamusSpritemaps_9EF4 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_9EF4 
    dw SamusSpritemaps_9FC3 
    dw SamusSpritemaps_9BA2 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_9EF4 
    dw SamusSpritemaps_9FC3 
    dw SamusSpritemaps_9BA2 
    dw SamusSpritemaps_9FC3 
    dw SamusSpritemaps_9EF4 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_9ED4 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_9ED4 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_A003 
    dw SamusSpritemaps_A028 
    dw SamusSpritemaps_A04D 
    dw SamusSpritemaps_A028 
    dw $0000 
    dw SamusSpritemaps_977B 
    dw SamusSpritemaps_9FA3 
    dw SamusSpritemaps_9FC3 
    dw SamusSpritemaps_9FE3 
    dw SamusSpritemaps_9FC3 
    dw $0000 
    dw SamusSpritemaps_9796 
    dw SamusSpritemaps_AD3C 
    dw SamusSpritemaps_AD3C 
    dw SamusSpritemaps_ADBB 
    dw SamusSpritemaps_AE98 
    dw SamusSpritemaps_AEA9 
    dw SamusSpritemaps_AE98 
    dw $0000 
    dw SamusSpritemaps_ADBB 
    dw SamusSpritemaps_AE98 
    dw SamusSpritemaps_AEA9 
    dw SamusSpritemaps_AE98 
    dw SamusSpritemaps_B340 
    dw SamusSpritemaps_AEBA 
    dw SamusSpritemaps_AFA1 
    dw SamusSpritemaps_AEBA 
    dw $0000 
    dw SamusSpritemaps_B340 
    dw SamusSpritemaps_AEBA 
    dw SamusSpritemaps_AFA1 
    dw SamusSpritemaps_AEBA 
    dw SamusSpritemaps_ADBB 
    dw SamusSpritemaps_ADBB 
    dw SamusSpritemaps_B340 
    dw SamusSpritemaps_B340 
    dw SamusSpritemaps_B295 
    dw SamusSpritemaps_B295 
    dw SamusSpritemaps_B2AB 
    dw SamusSpritemaps_B2AB 
    dw SamusSpritemaps_AD3C 
    dw SamusSpritemaps_B021 
    dw SamusSpritemaps_ADBB 
    dw SamusSpritemaps_B037 
    dw SamusSpritemaps_B340 
    dw SamusSpritemaps_B1C8 
    dw SamusSpritemaps_B021 
    dw SamusSpritemaps_ADBB 
    dw SamusSpritemaps_B1E3 
    dw SamusSpritemaps_B037 
    dw SamusSpritemaps_B340 
    dw SamusSpritemaps_ADBB 
    dw SamusSpritemaps_ADBB 
    dw SamusSpritemaps_ADBB 
    dw SamusSpritemaps_ADBB 
    dw SamusSpritemaps_ADBB 
    dw SamusSpritemaps_B340 
    dw SamusSpritemaps_B340 
    dw SamusSpritemaps_B340 
    dw SamusSpritemaps_B340 
    dw SamusSpritemaps_B340 
    dw SamusSpritemaps_B351 
    dw SamusSpritemaps_B351 
    dw SamusSpritemaps_B351 
    dw SamusSpritemaps_B351 
    dw SamusSpritemaps_B351 
    dw SamusSpritemaps_ADCC 
    dw SamusSpritemaps_ADCC 
    dw SamusSpritemaps_ADCC 
    dw SamusSpritemaps_ADCC 
    dw SamusSpritemaps_ADCC 
    dw SamusSpritemaps_AD3C 
    dw SamusSpritemaps_ADD8 
    dw SamusSpritemaps_AD48 
    dw SamusSpritemaps_ADEE 
    dw SamusSpritemaps_AD63 
    dw SamusSpritemaps_AD79 
    dw SamusSpritemaps_AE0E 
    dw SamusSpritemaps_AD85 
    dw SamusSpritemaps_AE24 
    dw SamusSpritemaps_ADA5 
    dw SamusSpritemaps_B2C1 
    dw SamusSpritemaps_B35D 
    dw SamusSpritemaps_B2CD 
    dw SamusSpritemaps_B373 
    dw SamusSpritemaps_B2E8 
    dw SamusSpritemaps_B2FE 
    dw SamusSpritemaps_B393 
    dw SamusSpritemaps_B30A 
    dw SamusSpritemaps_B3A9 
    dw SamusSpritemaps_B32A 
    dw SamusSpritemaps_B3ED 
    dw SamusSpritemaps_B403 
    dw SamusSpritemaps_B184 
    dw SamusSpritemaps_B3C9 
    dw SamusSpritemaps_B40F 
    dw SamusSpritemaps_B195 
    dw SamusSpritemaps_AFF3 
    dw SamusSpritemaps_B009 
    dw SamusSpritemaps_B1A6 
    dw SamusSpritemaps_AFCA 
    dw SamusSpritemaps_B015 
    dw SamusSpritemaps_B1B7 
    dw SamusSpritemaps_B08D 
    dw SamusSpritemaps_B104 
    dw SamusSpritemaps_B09E 
    dw SamusSpritemaps_B124 
    dw SamusSpritemaps_B08D 
    dw SamusSpritemaps_B1C8 
    dw SamusSpritemaps_B09E 
    dw SamusSpritemaps_B1E3 
    dw SamusSpritemaps_B08D 
    dw SamusSpritemaps_AEF7 
    dw SamusSpritemaps_B09E 
    dw SamusSpritemaps_AF08 
    dw SamusSpritemaps_B08D 
    dw SamusSpritemaps_B1C8 
    dw SamusSpritemaps_B09E 
    dw SamusSpritemaps_B1E3 
    dw SamusSpritemaps_B08D 
    dw SamusSpritemaps_AEF7 
    dw SamusSpritemaps_B09E 
    dw SamusSpritemaps_AF08 
    dw SamusSpritemaps_B08D 
    dw SamusSpritemaps_B1C8 
    dw SamusSpritemaps_B09E 
    dw SamusSpritemaps_B1E3 
    dw SamusSpritemaps_B021 
    dw SamusSpritemaps_B037 
    dw SamusSpritemaps_AD79 
    dw SamusSpritemaps_B0C7 
    dw SamusSpritemaps_B04D 
    dw SamusSpritemaps_B04D 
    dw SamusSpritemaps_B08D 
    dw SamusSpritemaps_B0AF 
    dw SamusSpritemaps_B2FE 
    dw SamusSpritemaps_B0E2 
    dw SamusSpritemaps_B06D 
    dw SamusSpritemaps_B06D 
    dw SamusSpritemaps_B09E 
    dw SamusSpritemaps_B0BB 
    dw SamusSpritemaps_AECB 
    dw SamusSpritemaps_B09E 
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_B1E3 
    dw SamusSpritemaps_AEE1 
    dw SamusSpritemaps_B08D 
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_B1C8 
    dw SamusSpritemaps_B184 
    dw SamusSpritemaps_AF69 
    dw SamusSpritemaps_B195 
    dw SamusSpritemaps_AF5D 
    dw SamusSpritemaps_B144 
    dw SamusSpritemaps_BB22 
    dw SamusSpritemaps_BB2E 
    dw SamusSpritemaps_BB44 
    dw SamusSpritemaps_BB50 
    dw SamusSpritemaps_BB66 
    dw SamusSpritemaps_BB72 
    dw SamusSpritemaps_BB88 
    dw SamusSpritemaps_BB94 
    dw SamusSpritemaps_B169 
    dw SamusSpritemaps_BD67 
    dw SamusSpritemaps_BD73 
    dw SamusSpritemaps_BD89 
    dw SamusSpritemaps_BD95 
    dw SamusSpritemaps_BDAB 
    dw SamusSpritemaps_BDB7 
    dw SamusSpritemaps_BDCD 
    dw SamusSpritemaps_BDD9 
    dw SamusSpritemaps_B144 
    dw SamusSpritemaps_B1C8 
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_C458 
    dw SamusSpritemaps_C46E 
    dw SamusSpritemaps_C4A2 
    dw SamusSpritemaps_C4B8 
    dw SamusSpritemaps_C4EC 
    dw SamusSpritemaps_C502 
    dw SamusSpritemaps_C536 
    dw SamusSpritemaps_C54C 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_C458 
    dw SamusSpritemaps_C46E 
    dw SamusSpritemaps_C4A2 
    dw SamusSpritemaps_C4B8 
    dw SamusSpritemaps_C4EC 
    dw SamusSpritemaps_C502 
    dw SamusSpritemaps_C536 
    dw SamusSpritemaps_C54C 
    dw SamusSpritemaps_C458 
    dw SamusSpritemaps_C46E 
    dw SamusSpritemaps_C4A2 
    dw SamusSpritemaps_C4B8 
    dw SamusSpritemaps_C4EC 
    dw SamusSpritemaps_C502 
    dw SamusSpritemaps_C536 
    dw SamusSpritemaps_C54C 
    dw SamusSpritemaps_C458 
    dw SamusSpritemaps_C46E 
    dw SamusSpritemaps_C4A2 
    dw SamusSpritemaps_C4B8 
    dw SamusSpritemaps_C4EC 
    dw SamusSpritemaps_C502 
    dw SamusSpritemaps_C536 
    dw SamusSpritemaps_C54C 
    dw SamusSpritemaps_B169 
    dw SamusSpritemaps_B1E3 
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_C330 
    dw SamusSpritemaps_C346 
    dw SamusSpritemaps_C37A 
    dw SamusSpritemaps_C390 
    dw SamusSpritemaps_C3C4 
    dw SamusSpritemaps_C3DA 
    dw SamusSpritemaps_C40E 
    dw SamusSpritemaps_C424 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_C330 
    dw SamusSpritemaps_C346 
    dw SamusSpritemaps_C37A 
    dw SamusSpritemaps_C390 
    dw SamusSpritemaps_C3C4 
    dw SamusSpritemaps_C3DA 
    dw SamusSpritemaps_C40E 
    dw SamusSpritemaps_C424 
    dw SamusSpritemaps_C330 
    dw SamusSpritemaps_C346 
    dw SamusSpritemaps_C37A 
    dw SamusSpritemaps_C390 
    dw SamusSpritemaps_C3C4 
    dw SamusSpritemaps_C3DA 
    dw SamusSpritemaps_C40E 
    dw SamusSpritemaps_C424 
    dw SamusSpritemaps_C330 
    dw SamusSpritemaps_C346 
    dw SamusSpritemaps_C37A 
    dw SamusSpritemaps_C390 
    dw SamusSpritemaps_C3C4 
    dw SamusSpritemaps_C3DA 
    dw SamusSpritemaps_C40E 
    dw SamusSpritemaps_C424 
    dw SamusSpritemaps_B0AF 
    dw SamusSpritemaps_B1FE 
    dw SamusSpritemaps_B0BB 
    dw SamusSpritemaps_B214 
    dw SamusSpritemaps_AF69 
    dw SamusSpritemaps_AF5D 
    dw SamusSpritemaps_B63F 
    dw SamusSpritemaps_B624 
    dw SamusSpritemaps_B60E 
    dw SamusSpritemaps_B5FD 
    dw SamusSpritemaps_B5FD 
    dw SamusSpritemaps_B5DD 
    dw SamusSpritemaps_B5DD 
    dw SamusSpritemaps_B5CC 
    dw SamusSpritemaps_B5CC 
    dw SamusSpritemaps_B5CC 
    dw SamusSpritemaps_B4E6 
    dw SamusSpritemaps_B4E6 
    dw SamusSpritemaps_B4D0 
    dw SamusSpritemaps_B4D0 
    dw SamusSpritemaps_B4BA 
    dw SamusSpritemaps_B4A9 
    dw SamusSpritemaps_B48E 
    dw SamusSpritemaps_B473 
    dw SamusSpritemaps_B45D 
    dw SamusSpritemaps_B44C 
    dw SamusSpritemaps_B44C 
    dw SamusSpritemaps_B42C 
    dw SamusSpritemaps_B42C 
    dw SamusSpritemaps_B41B 
    dw SamusSpritemaps_B41B 
    dw SamusSpritemaps_B41B 
    dw SamusSpritemaps_B697 
    dw SamusSpritemaps_B697 
    dw SamusSpritemaps_B681 
    dw SamusSpritemaps_B681 
    dw SamusSpritemaps_B66B 
    dw SamusSpritemaps_B65A 
    dw SamusSpritemaps_B72B 
    dw SamusSpritemaps_B715 
    dw SamusSpritemaps_B709 
    dw SamusSpritemaps_B6FD 
    dw SamusSpritemaps_B6FD 
    dw SamusSpritemaps_B6E7 
    dw SamusSpritemaps_B6E7 
    dw SamusSpritemaps_B6DB 
    dw SamusSpritemaps_B6DB 
    dw SamusSpritemaps_B6DB 
    dw SamusSpritemaps_B5B4 
    dw SamusSpritemaps_B5B4 
    dw SamusSpritemaps_B59E 
    dw SamusSpritemaps_B59E 
    dw SamusSpritemaps_B592 
    dw SamusSpritemaps_B586 
    dw SamusSpritemaps_B57A 
    dw SamusSpritemaps_B564 
    dw SamusSpritemaps_B558 
    dw SamusSpritemaps_B54C 
    dw SamusSpritemaps_B54C 
    dw SamusSpritemaps_B536 
    dw SamusSpritemaps_B536 
    dw SamusSpritemaps_B52A 
    dw SamusSpritemaps_B52A 
    dw SamusSpritemaps_B52A 
    dw SamusSpritemaps_B74F 
    dw SamusSpritemaps_B74F 
    dw SamusSpritemaps_B743 
    dw SamusSpritemaps_B743 
    dw SamusSpritemaps_B737 
    dw SamusSpritemaps_B72B 
    dw SamusSpritemaps_B512 
    dw SamusSpritemaps_B51E 
    dw SamusSpritemaps_B98B 
    dw SamusSpritemaps_B9A6 
    dw SamusSpritemaps_B9B7 
    dw SamusSpritemaps_B9CD 
    dw SamusSpritemaps_B9CD 
    dw SamusSpritemaps_B9E3 
    dw SamusSpritemaps_B9E3 
    dw SamusSpritemaps_B767 
    dw SamusSpritemaps_B767 
    dw SamusSpritemaps_B767 
    dw SamusSpritemaps_B778 
    dw SamusSpritemaps_B778 
    dw SamusSpritemaps_B798 
    dw SamusSpritemaps_B798 
    dw SamusSpritemaps_B7A9 
    dw SamusSpritemaps_B7BF 
    dw SamusSpritemaps_B7DA 
    dw SamusSpritemaps_B7F5 
    dw SamusSpritemaps_B806 
    dw SamusSpritemaps_B81C 
    dw SamusSpritemaps_B81C 
    dw SamusSpritemaps_B832 
    dw SamusSpritemaps_B832 
    dw SamusSpritemaps_B918 
    dw SamusSpritemaps_B918 
    dw SamusSpritemaps_B918 
    dw SamusSpritemaps_B929 
    dw SamusSpritemaps_B929 
    dw SamusSpritemaps_B949 
    dw SamusSpritemaps_B949 
    dw SamusSpritemaps_B95A 
    dw SamusSpritemaps_B970 
    dw SamusSpritemaps_BA77 
    dw SamusSpritemaps_BA83 
    dw SamusSpritemaps_BA8F 
    dw SamusSpritemaps_BA9B 
    dw SamusSpritemaps_BA9B 
    dw SamusSpritemaps_BAA7 
    dw SamusSpritemaps_BAA7 
    dw SamusSpritemaps_B876 
    dw SamusSpritemaps_B876 
    dw SamusSpritemaps_B876 
    dw SamusSpritemaps_B882 
    dw SamusSpritemaps_B882 
    dw SamusSpritemaps_B898 
    dw SamusSpritemaps_B898 
    dw SamusSpritemaps_B8A4 
    dw SamusSpritemaps_B8B0 
    dw SamusSpritemaps_B8C6 
    dw SamusSpritemaps_B8D2 
    dw SamusSpritemaps_B8DE 
    dw SamusSpritemaps_B8EA 
    dw SamusSpritemaps_B8EA 
    dw SamusSpritemaps_B900 
    dw SamusSpritemaps_B900 
    dw SamusSpritemaps_BA27 
    dw SamusSpritemaps_BA27 
    dw SamusSpritemaps_BA27 
    dw SamusSpritemaps_BA33 
    dw SamusSpritemaps_BA33 
    dw SamusSpritemaps_BA49 
    dw SamusSpritemaps_BA49 
    dw SamusSpritemaps_BA55 
    dw SamusSpritemaps_BA61 
    dw SamusSpritemaps_B85E 
    dw SamusSpritemaps_B86A 
    dw SamusSpritemaps_B08D 
    dw SamusSpritemaps_B0AF 
    dw SamusSpritemaps_B0AF 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_B08D 
    dw SamusSpritemaps_B1C8 
    dw SamusSpritemaps_B09E 
    dw SamusSpritemaps_B0BB 
    dw SamusSpritemaps_B0BB 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_B09E 
    dw SamusSpritemaps_B1E3 
    dw SamusSpritemaps_B08D 
    dw SamusSpritemaps_B104 
    dw SamusSpritemaps_B09E 
    dw SamusSpritemaps_B124 
    dw SamusSpritemaps_B08D 
    dw SamusSpritemaps_B0AF 
    dw SamusSpritemaps_B1C8 
    dw SamusSpritemaps_B09E 
    dw SamusSpritemaps_B0BB 
    dw SamusSpritemaps_B1E3 
    dw SamusSpritemaps_B08D 
    dw SamusSpritemaps_B0AF 
    dw SamusSpritemaps_B1C8 
    dw SamusSpritemaps_B09E 
    dw SamusSpritemaps_B0BB 
    dw SamusSpritemaps_B1E3 
    dw SamusSpritemaps_B08D 
    dw SamusSpritemaps_B0AF 
    dw SamusSpritemaps_B1C8 
    dw SamusSpritemaps_B09E 
    dw SamusSpritemaps_B0BB 
    dw SamusSpritemaps_B1E3 
    dw SamusSpritemaps_B351 
    dw SamusSpritemaps_B351 
    dw SamusSpritemaps_B351 
    dw SamusSpritemaps_B351 
    dw $0000 
    dw SamusSpritemaps_B351 
    dw SamusSpritemaps_B351 
    dw SamusSpritemaps_B351 
    dw SamusSpritemaps_B351 
    dw SamusSpritemaps_ADCC 
    dw SamusSpritemaps_ADCC 
    dw SamusSpritemaps_ADCC 
    dw SamusSpritemaps_ADCC 
    dw $0000 
    dw SamusSpritemaps_ADCC 
    dw SamusSpritemaps_ADCC 
    dw SamusSpritemaps_ADCC 
    dw SamusSpritemaps_ADCC 
    dw SamusSpritemaps_B351 
    dw SamusSpritemaps_ADCC 
    dw SamusSpritemaps_B351 
    dw SamusSpritemaps_ADCC 
    dw SamusSpritemaps_B351 
    dw SamusSpritemaps_B351 
    dw SamusSpritemaps_ADCC 
    dw SamusSpritemaps_ADCC 
    dw SamusSpritemaps_B021 
    dw SamusSpritemaps_B037 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_B021 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_B021 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_B021 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_B021 
    dw SamusSpritemaps_AF2A 
    dw SamusSpritemaps_AFE0 
    dw SamusSpritemaps_AF19 
    dw SamusSpritemaps_AF19 
    dw SamusSpritemaps_AFE0 
    dw SamusSpritemaps_AF2A 
    dw SamusSpritemaps_AF4C 
    dw SamusSpritemaps_AFEC 
    dw SamusSpritemaps_AF3B 
    dw SamusSpritemaps_AF3B 
    dw SamusSpritemaps_AFEC 
    dw SamusSpritemaps_AF4C 
    dw SamusSpritemaps_AF4C 
    dw SamusSpritemaps_AFEC 
    dw SamusSpritemaps_AF3B 
    dw SamusSpritemaps_AF3B 
    dw SamusSpritemaps_AFEC 
    dw SamusSpritemaps_AF4C 
    dw SamusSpritemaps_B1FE 
    dw SamusSpritemaps_B214 
    dw SamusSpritemaps_B0AF 
    dw SamusSpritemaps_B1FE 
    dw SamusSpritemaps_B1C8 
    dw SamusSpritemaps_B0AF 
    dw SamusSpritemaps_B0C7 
    dw SamusSpritemaps_B04D 
    dw SamusSpritemaps_B0BB 
    dw SamusSpritemaps_B214 
    dw SamusSpritemaps_B1E3 
    dw SamusSpritemaps_B0BB 
    dw SamusSpritemaps_B0E2 
    dw SamusSpritemaps_B06D 
    dw SamusSpritemaps_AF75 
    dw SamusSpritemaps_AF8B 
    dw SamusSpritemaps_AF75 
    dw SamusSpritemaps_AF8B 
    dw SamusSpritemaps_C276 
    dw SamusSpritemaps_C28C 
    dw SamusSpritemaps_C2DE 
    dw SamusSpritemaps_C2DE 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_C2DE 
    dw SamusSpritemaps_C2DE 
    dw SamusSpritemaps_C2DE 
    dw SamusSpritemaps_C2DE 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_C28C 
    dw SamusSpritemaps_C276 
    dw SamusSpritemaps_B021 
    dw SamusSpritemaps_C276 
    dw SamusSpritemaps_C28C 
    dw SamusSpritemaps_C2DE 
    dw SamusSpritemaps_C2DE 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_C2DE 
    dw SamusSpritemaps_C2DE 
    dw SamusSpritemaps_C2DE 
    dw SamusSpritemaps_C2DE 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_C28C 
    dw SamusSpritemaps_C276 
    dw SamusSpritemaps_B037 
    dw $0000 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_B021 
    dw SamusSpritemaps_B0AF 
    dw SamusSpritemaps_B1FE 
    dw $0000 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_B037 
    dw SamusSpritemaps_B0BB 
    dw SamusSpritemaps_B214 
    dw $0000 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_B0AF 
    dw SamusSpritemaps_B0AF 
    dw SamusSpritemaps_B0AF 
    dw SamusSpritemaps_B0AF 
    dw SamusSpritemaps_B0AF 
    dw SamusSpritemaps_B242 
    dw SamusSpritemaps_B242 
    dw SamusSpritemaps_B242 
    dw SamusSpritemaps_B242 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_B021 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_B0BB 
    dw SamusSpritemaps_B0BB 
    dw SamusSpritemaps_B0BB 
    dw SamusSpritemaps_B0BB 
    dw SamusSpritemaps_B0BB 
    dw SamusSpritemaps_B037 
    dw SamusSpritemaps_B236 
    dw SamusSpritemaps_B236 
    dw SamusSpritemaps_B236 
    dw SamusSpritemaps_B236 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_B1E3 
    dw SamusSpritemaps_B037 
    dw SamusSpritemaps_B2AB 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_B1E3 
    dw SamusSpritemaps_B037 
    dw SamusSpritemaps_B2AB 
    dw SamusSpritemaps_B037 
    dw SamusSpritemaps_B1E3 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_B236 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_B236 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_B242 
    dw SamusSpritemaps_B242 
    dw SamusSpritemaps_B242 
    dw SamusSpritemaps_B242 
    dw $0000 
    dw SamusSpritemaps_B021 
    dw SamusSpritemaps_B236 
    dw SamusSpritemaps_B236 
    dw SamusSpritemaps_B236 
    dw SamusSpritemaps_B236 
    dw $0000 
    dw SamusSpritemaps_B037 
    dw SamusSpritemaps_BAB3 
    dw SamusSpritemaps_BAE3 
    dw SamusSpritemaps_BABF 
    dw SamusSpritemaps_BAFE 
    dw SamusSpritemaps_BACB 
    dw SamusSpritemaps_BB0A 
    dw SamusSpritemaps_BAD7 
    dw SamusSpritemaps_BB16 
    dw $0000 
    dw SamusSpritemaps_BC88 
    dw SamusSpritemaps_BB16 
    dw SamusSpritemaps_BAD7 
    dw SamusSpritemaps_BB0A 
    dw SamusSpritemaps_BACB 
    dw SamusSpritemaps_BAFE 
    dw SamusSpritemaps_BABF 
    dw SamusSpritemaps_BAE3 
    dw SamusSpritemaps_BAB3 
    dw $0000 
    dw SamusSpritemaps_BC88 
    dw SamusSpritemaps_BAB3 
    dw SamusSpritemaps_BAE3 
    dw SamusSpritemaps_BABF 
    dw SamusSpritemaps_BAFE 
    dw SamusSpritemaps_BACB 
    dw SamusSpritemaps_BB0A 
    dw SamusSpritemaps_BAD7 
    dw SamusSpritemaps_BB16 
    dw $0000 
    dw SamusSpritemaps_BC88 
    dw SamusSpritemaps_BB16 
    dw SamusSpritemaps_BAD7 
    dw SamusSpritemaps_BB0A 
    dw SamusSpritemaps_BACB 
    dw SamusSpritemaps_BAFE 
    dw SamusSpritemaps_BABF 
    dw SamusSpritemaps_BAE3 
    dw SamusSpritemaps_BAB3 
    dw $0000 
    dw SamusSpritemaps_BC88 
    dw SamusSpritemaps_BAB3 
    dw SamusSpritemaps_BAE3 
    dw SamusSpritemaps_BABF 
    dw SamusSpritemaps_BAFE 
    dw SamusSpritemaps_BACB 
    dw SamusSpritemaps_BB0A 
    dw SamusSpritemaps_BAD7 
    dw SamusSpritemaps_BB16 
    dw $0000 
    dw SamusSpritemaps_BC88 
    dw SamusSpritemaps_BB16 
    dw SamusSpritemaps_BAD7 
    dw SamusSpritemaps_BB0A 
    dw SamusSpritemaps_BACB 
    dw SamusSpritemaps_BAFE 
    dw SamusSpritemaps_BABF 
    dw SamusSpritemaps_BAE3 
    dw SamusSpritemaps_BAB3 
    dw $0000 
    dw SamusSpritemaps_BC88 
    dw SamusSpritemaps_9BAE 
    dw SamusSpritemaps_BD67 
    dw SamusSpritemaps_BD73 
    dw SamusSpritemaps_BD89 
    dw SamusSpritemaps_BD95 
    dw SamusSpritemaps_BDAB 
    dw SamusSpritemaps_BDB7 
    dw SamusSpritemaps_BDCD 
    dw SamusSpritemaps_BDD9 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_9B43 
    dw SamusSpritemaps_B1C8 
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_AFB2 
    dw SamusSpritemaps_9BBF 
    dw SamusSpritemaps_BB22 
    dw SamusSpritemaps_BB2E 
    dw SamusSpritemaps_BB44 
    dw SamusSpritemaps_BB50 
    dw SamusSpritemaps_BB66 
    dw SamusSpritemaps_BB72 
    dw SamusSpritemaps_BB88 
    dw SamusSpritemaps_BB94 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_9B59 
    dw SamusSpritemaps_B1E3 
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_AFBE 
    dw SamusSpritemaps_9BAE 
    dw SamusSpritemaps_BEBF 
    dw SamusSpritemaps_BEBF 
    dw SamusSpritemaps_BEBF 
    dw SamusSpritemaps_BEBF 
    dw SamusSpritemaps_BEBF 
    dw SamusSpritemaps_BEBF 
    dw SamusSpritemaps_BEBF 
    dw SamusSpritemaps_BEBF 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_9B43 
    dw SamusSpritemaps_B1C8 
    dw SamusSpritemaps_C458 
    dw SamusSpritemaps_C46E 
    dw SamusSpritemaps_C4A2 
    dw SamusSpritemaps_C4B8 
    dw SamusSpritemaps_C4EC 
    dw SamusSpritemaps_C502 
    dw SamusSpritemaps_C536 
    dw SamusSpritemaps_C54C 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_AFB2 
    dw SamusSpritemaps_9BBF 
    dw SamusSpritemaps_BC7A 
    dw SamusSpritemaps_BC7A 
    dw SamusSpritemaps_BC7A 
    dw SamusSpritemaps_BC7A 
    dw SamusSpritemaps_BC7A 
    dw SamusSpritemaps_BC7A 
    dw SamusSpritemaps_BC7A 
    dw SamusSpritemaps_BC7A 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_9B59 
    dw SamusSpritemaps_B1E3 
    dw SamusSpritemaps_C330 
    dw SamusSpritemaps_C346 
    dw SamusSpritemaps_C37A 
    dw SamusSpritemaps_C390 
    dw SamusSpritemaps_C3C4 
    dw SamusSpritemaps_C3DA 
    dw SamusSpritemaps_C40E 
    dw SamusSpritemaps_C424 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_AFBE 
    dw SamusSpritemaps_9BAE 
    dw SamusSpritemaps_BDEF 
    dw SamusSpritemaps_BDEF 
    dw SamusSpritemaps_BDEF 
    dw SamusSpritemaps_BEBF 
    dw SamusSpritemaps_BEBF 
    dw SamusSpritemaps_BEBF 
    dw SamusSpritemaps_BE23 
    dw SamusSpritemaps_BE23 
    dw SamusSpritemaps_BE23 
    dw SamusSpritemaps_BEBF 
    dw SamusSpritemaps_BEBF 
    dw SamusSpritemaps_BEBF 
    dw SamusSpritemaps_BE5C 
    dw SamusSpritemaps_BE5C 
    dw SamusSpritemaps_BE5C 
    dw SamusSpritemaps_BEBF 
    dw SamusSpritemaps_BEBF 
    dw SamusSpritemaps_BEBF 
    dw SamusSpritemaps_BE95 
    dw SamusSpritemaps_BE95 
    dw SamusSpritemaps_BE95 
    dw SamusSpritemaps_BEBF 
    dw SamusSpritemaps_BEBF 
    dw SamusSpritemaps_BEBF 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_9B43 
    dw SamusSpritemaps_B1C8 
    dw SamusSpritemaps_C458 
    dw SamusSpritemaps_C46E 
    dw SamusSpritemaps_C4A2 
    dw SamusSpritemaps_C4B8 
    dw SamusSpritemaps_C4EC 
    dw SamusSpritemaps_C502 
    dw SamusSpritemaps_C536 
    dw SamusSpritemaps_C54C 
    dw SamusSpritemaps_C458 
    dw SamusSpritemaps_C46E 
    dw SamusSpritemaps_C4A2 
    dw SamusSpritemaps_C4B8 
    dw SamusSpritemaps_C4EC 
    dw SamusSpritemaps_C502 
    dw SamusSpritemaps_C536 
    dw SamusSpritemaps_C54C 
    dw SamusSpritemaps_C458 
    dw SamusSpritemaps_C46E 
    dw SamusSpritemaps_C4A2 
    dw SamusSpritemaps_C4B8 
    dw SamusSpritemaps_C4EC 
    dw SamusSpritemaps_C502 
    dw SamusSpritemaps_C536 
    dw SamusSpritemaps_C54C 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_AFB2 
    dw SamusSpritemaps_9BBF 
    dw SamusSpritemaps_BBAA 
    dw SamusSpritemaps_BBAA 
    dw SamusSpritemaps_BBAA 
    dw SamusSpritemaps_BC7A 
    dw SamusSpritemaps_BC7A 
    dw SamusSpritemaps_BC7A 
    dw SamusSpritemaps_BBDE 
    dw SamusSpritemaps_BBDE 
    dw SamusSpritemaps_BBDE 
    dw SamusSpritemaps_BC7A 
    dw SamusSpritemaps_BC7A 
    dw SamusSpritemaps_BC7A 
    dw SamusSpritemaps_BC17 
    dw SamusSpritemaps_BC17 
    dw SamusSpritemaps_BC17 
    dw SamusSpritemaps_BC7A 
    dw SamusSpritemaps_BC7A 
    dw SamusSpritemaps_BC7A 
    dw SamusSpritemaps_BC50 
    dw SamusSpritemaps_BC50 
    dw SamusSpritemaps_BC50 
    dw SamusSpritemaps_BC7A 
    dw SamusSpritemaps_BC7A 
    dw SamusSpritemaps_BC7A 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_9B59 
    dw SamusSpritemaps_B1E3 
    dw SamusSpritemaps_C330 
    dw SamusSpritemaps_C346 
    dw SamusSpritemaps_C37A 
    dw SamusSpritemaps_C390 
    dw SamusSpritemaps_C3C4 
    dw SamusSpritemaps_C3DA 
    dw SamusSpritemaps_C40E 
    dw SamusSpritemaps_C424 
    dw SamusSpritemaps_C330 
    dw SamusSpritemaps_C346 
    dw SamusSpritemaps_C37A 
    dw SamusSpritemaps_C390 
    dw SamusSpritemaps_C3C4 
    dw SamusSpritemaps_C3DA 
    dw SamusSpritemaps_C40E 
    dw SamusSpritemaps_C424 
    dw SamusSpritemaps_C330 
    dw SamusSpritemaps_C346 
    dw SamusSpritemaps_C37A 
    dw SamusSpritemaps_C390 
    dw SamusSpritemaps_C3C4 
    dw SamusSpritemaps_C3DA 
    dw SamusSpritemaps_C40E 
    dw SamusSpritemaps_C424 
    dw $0000 
    dw $0000 
    dw SamusSpritemaps_AFBE 
    dw SamusSpritemaps_C8B7 
    dw SamusSpritemaps_C8E6 
    dw SamusSpritemaps_C956 
    dw SamusSpritemaps_C9DA 
    dw SamusSpritemaps_CA54 
    dw SamusSpritemaps_CAD3 
    dw SamusSpritemaps_CB52 
    dw SamusSpritemaps_CB7C 
    dw SamusSpritemaps_CBB5 
    dw SamusSpritemaps_C580 
    dw SamusSpritemaps_C5AF 
    dw SamusSpritemaps_C61F 
    dw SamusSpritemaps_C6A3 
    dw SamusSpritemaps_C71D 
    dw SamusSpritemaps_C79C 
    dw SamusSpritemaps_C81B 
    dw SamusSpritemaps_C845 
    dw SamusSpritemaps_C87E 
    dw SamusSpritemaps_C162 
    dw SamusSpritemaps_C17D 

UNUSED_Debug_SamusSpritemap_0_9290ED:
    dw $0001,$01FC 
    db $FC 
    dw $315A 

UNUSED_Debug_SamusSpritemap_1_9290F4:
    dw $0019,$0039 
    db $E8 
    dw $3136,$0031 
    db $E8 
    dw $3144,$0029 
    db $E8 
    dw $3131,$0021 
    db $E8 
    dw $3134,$0019 
    db $E8 
    dw $3133,$0010 
    db $08 
    dw $314B,$0008 
    db $08 
    dw $313D,$0000 
    db $08 
    dw $313E,$01F8 
    db $08 
    dw $3138,$01F0 
    db $08 
    dw $3143,$01E8 
    db $08 
    dw $313F,$01E0 
    db $08 
    dw $313E,$0010 
    db $F8 
    dw $314A,$0008 
    db $F8 
    dw $313D,$0000 
    db $F8 
    dw $313E,$01F8 
    db $F8 
    dw $3138,$01F0 
    db $F8 
    dw $3143,$01E8 
    db $F8 
    dw $313F,$01E0 
    db $F8 
    dw $313E,$0008 
    db $E8 
    dw $313B,$0000 
    db $E8 
    dw $3130,$01F8 
    db $E8 
    dw $3144,$01F0 
    db $E8 
    dw $3142,$01E8 
    db $E8 
    dw $3138,$01E0 
    db $E8 
    dw $3145 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_929173:
    dw $0001,$0000 
    db $00 
    dw $3A5F 
endif ; !FEATURE_KEEP_UNREFERENCED

SamusTileViewer_SamusTopHalf:
    dw $0010,$0018 
    db $00 
    dw $3817,$0010 
    db $00 
    dw $3816,$0008 
    db $00 
    dw $3815,$0000 
    db $00 
    dw $3814,$01F8 
    db $00 
    dw $3813,$01F0 
    db $00 
    dw $3812,$01E8 
    db $00 
    dw $3811,$01E0 
    db $00 
    dw $3810,$0018 
    db $F8 
    dw $3807,$0010 
    db $F8 
    dw $3806,$0008 
    db $F8 
    dw $3805,$0000 
    db $F8 
    dw $3804,$01F8 
    db $F8 
    dw $3803,$01F0 
    db $F8 
    dw $3802,$01E8 
    db $F8 
    dw $3801,$01E0 
    db $F8 
    dw $3800 

SamusTileViewer_SamusBottomHalf:
    dw $0010,$0018 
    db $00 
    dw $381F,$0010 
    db $00 
    dw $381E,$0008 
    db $00 
    dw $381D,$0000 
    db $00 
    dw $381C,$01F8 
    db $00 
    dw $381B,$01F0 
    db $00 
    dw $381A,$01E8 
    db $00 
    dw $3819,$01E0 
    db $00 
    dw $3818,$0018 
    db $F8 
    dw $380F,$0010 
    db $F8 
    dw $380E,$0008 
    db $F8 
    dw $380D,$0000 
    db $F8 
    dw $380C,$01F8 
    db $F8 
    dw $380B,$01F0 
    db $F8 
    dw $380A,$01E8 
    db $F8 
    dw $3809,$01E0 
    db $F8 
    dw $3808 

SamusTileViewer_Beam:
    dw $0008,$0018 
    db $00 
    dw $3C37,$0010 
    db $00 
    dw $3C36,$0008 
    db $00 
    dw $3C35,$0000 
    db $00 
    dw $3C34,$01F8 
    db $00 
    dw $3C33,$01F0 
    db $00 
    dw $3C32,$01E8 
    db $00 
    dw $3C31,$01E0 
    db $00 
    dw $3C30 

SamusTileViewer_GrappleBeam:
    dw $0005,$0000 
    db $00 
    dw $3A24,$01F8 
    db $00 
    dw $3A23,$01F0 
    db $00 
    dw $3A22,$01E8 
    db $00 
    dw $3A21,$01E0 
    db $00 
    dw $3A20 

SamusSpritemapTableIndices_TopHalf:
    dw $0002,$019A,$01A3,$01AD,$01AF,$01B1,$01B3,$01B5 
    dw $01B7,$01F9,$0203,$020D,$0217,$0221,$022B,$0235 
    dw $023F,$0249,$0253,$0275,$0277,$0279,$027B,$0271 
    dw $0273,$074C,$0764,$077C,$0794,$0710,$0724,$072E 
    dw $074C,$074C,$074C,$074C,$074C,$0419,$041C,$03F1 
    dw $03FA,$03B7,$03BE,$03D3,$03D6,$03D9,$03DB,$0419 
    dw $041C,$0710,$0710,$074C,$074C,$0403,$0404,$0405 
    dw $0407,$074C,$074C,$0403,$0404,$0409,$040B,$0710 
    dw $0710,$071A,$074C,$0419,$041C,$025D,$0267,$019A 
    dw $01A3,$01D5,$01DB,$0289,$028A,$028B,$0291,$0297 
    dw $02A1,$0285,$0287,$031F,$0321,$01CD,$01CF,$01B1 
    dw $01B3,$01B5,$01B7,$032F,$0330,$0331,$0331,$0331 
    dw $0332,$0333,$0375,$02AB,$02AD,$02AF,$02B8,$03C5 
    dw $03CC,$027D,$027F,$0281,$0283,$03DD,$03E0,$03E3 
    dw $03E6,$03E9,$03EA,$03EB,$03EC,$01E1,$01E7,$01ED 
    dw $01F3,$0738,$0742,$0738,$0742,$0738,$0742,$0738 
    dw $0742,$07AC,$07E4,$02C1,$02F0,$03ED,$03EF,$0419 
    dw $041C,$019A,$01A3,$041F,$0422,$0425,$0428,$041F 
    dw $0422,$0425,$0428,$041F,$0422,$0425,$0428,$041F 
    dw $0422,$0425,$0428,$00C2,$041F,$0422,$041F,$0422 
    dw $041F,$0422,$041F,$0422,$01B9,$01BB,$01BD,$01C0 
    dw $019A,$01A3,$01B5,$01B7,$0275,$0277,$0271,$0273 
    dw $0281,$0283,$0333,$0375,$03F1,$03FA,$03EB,$03EC 
    dw $032F,$0330,$042F,$0430,$0431,$0432,$0439,$0419 
    dw $041C,$041F,$0422,$0425,$0428,$071A,$0419,$028B 
    dw $0291,$043F,$0440,$082E,$082F,$0441,$0442,$01B1 
    dw $01B3,$01B5,$01B7,$0443,$0452,$01C3,$01C8,$0461 
    dw $0467,$01C3,$01C8,$040D,$0410,$0413,$0416,$071A 
    dw $01CD,$01CF,$01B1,$01B3,$01B5,$01B7,$01D1,$01D3 
    dw $046D,$047C,$049C,$04A2,$042B,$042C,$042D,$042E 
    dw $0433,$01CD,$01CF,$01B1,$01B3,$01B5,$01B7,$01CD 
    dw $01CF,$01B1,$01B3,$01B5,$01B7 

SamusSpritemapTableIndices_BottomHalf:
    dw $0062,$04AA,$04B3,$04C0,$04C2,$04C0,$04C2,$04C0 
    dw $04C2,$04E3,$04ED,$04E3,$04ED,$04E3,$04ED,$04E3 
    dw $04ED,$04E3,$04ED,$0507,$0509,$050B,$050D,$0503 
    dw $0505,$0758,$0770,$0788,$07A0,$0710,$0724,$072E 
    dw $074C,$074C,$074C,$074C,$074C,$0687,$068A,$065F 
    dw $0668,$063B,$0642,$064D,$0650,$0649,$064B,$068D 
    dw $0690,$0710,$0710,$074C,$074C,$0679,$067A,$0405 
    dw $0407,$074C,$074C,$0679,$067A,$0409,$040B,$0710 
    dw $0710,$071A,$074C,$068D,$0690,$04E3,$04ED,$04AA 
    dw $04B3,$04F7,$04FD,$051B,$051C,$051D,$0523,$0529 
    dw $0533,$050F,$0511,$05B1,$05B3,$051B,$051C,$051B 
    dw $051C,$051B,$051C,$05B5,$05B6,$05B7,$05B7,$05B7 
    dw $05B7,$05B7,$05F9,$053D,$053F,$0541,$054A,$063B 
    dw $0642,$0513,$0515,$0517,$0519,$0653,$0656,$0659 
    dw $065C,$0671,$0672,$0673,$0674,$04F7,$04FD,$04F7 
    dw $04FD,$0738,$0742,$0738,$0742,$0738,$0742,$0738 
    dw $0742,$07C8,$0800,$0553,$0582,$0675,$0677,$068D 
    dw $0696,$04AA,$04B3,$0687,$068A,$0687,$068A,$068D 
    dw $0690,$068D,$0690,$068D,$0696,$068D,$0696,$068D 
    dw $0690,$068D,$0690,$0122,$0687,$068A,$068D,$0690 
    dw $068D,$0696,$068D,$0690,$04C5,$04C7,$04C9,$04CC 
    dw $04AA,$04B3,$04C0,$04C2,$0507,$0509,$0503,$0505 
    dw $0517,$0519,$05B7,$05F9,$065F,$0668,$0673,$0674 
    dw $05B5,$05B6,$069A,$069A,$069A,$069A,$06A1,$0687 
    dw $068A,$0687,$068A,$0687,$068A,$071A,$0687,$051D 
    dw $0523,$06A7,$06A8,$082E,$082F,$06A9,$06AA,$04C0 
    dw $04C2,$04C0,$04C2,$06AB,$06BA,$04CF,$04D4,$06C9 
    dw $06CF,$04D9,$04DE,$067D,$0680,$0681,$0684,$071A 
    dw $04C5,$04C7,$04C5,$04C7,$04C5,$04C7,$04C5,$04C7 
    dw $06D5,$06E4,$0704,$070A,$0699,$0699,$0699,$0699 
    dw $069B,$0679,$067A,$0679,$067A,$0679,$067A,$0679 
    dw $067A,$0679,$067A,$0679,$067A 

SamusSpritemaps_9657:
    dw $0002,$C3FB 
    db $F8 
    dw $2800,$C3FB 
    db $F0 
    dw $2802 

SamusSpritemaps_9663:
    dw $0002,$C3FB 
    db $F7 
    dw $2800,$C3FB 
    db $EF 
    dw $2802 

SamusSpritemaps_966F:
    dw $0003,$C3FF 
    db $F7 
    dw $2800,$0007 
    db $EF 
    dw $2804,$C3F7 
    db $EF 
    dw $2802 

SamusSpritemaps_9680:
    dw $0003,$0008 
    db $EE 
    dw $2804,$C200 
    db $F6 
    dw $2800,$C3F8 
    db $EE 
    dw $2802 

SamusSpritemaps_9691:
    dw $0002,$C3F9 
    db $F7 
    dw $2800,$C3F9 
    db $EF 
    dw $2802 

SamusSpritemaps_969D:
    dw $0003,$C3FE 
    db $EF 
    dw $2800,$C3F6 
    db $F7 
    dw $2802,$C3F6 
    db $EF 
    dw $2804 

SamusSpritemaps_96AE:
    dw $0002,$C3F5 
    db $F8 
    dw $2800,$C3F5 
    db $F0 
    dw $2802 

SamusSpritemaps_96BA:
    dw $0002,$C3F5 
    db $F7 
    dw $2800,$C3F5 
    db $EF 
    dw $2802 

SamusSpritemaps_96C6:
    dw $0003,$C3F1 
    db $F7 
    dw $2800,$C3F9 
    db $EF 
    dw $2802,$C3F1 
    db $EF 
    dw $2804 

SamusSpritemaps_96D7:
    dw $0003,$C3F0 
    db $F6 
    dw $2800,$C3F0 
    db $EE 
    dw $2802,$C3F8 
    db $EE 
    dw $2804 

SamusSpritemaps_96E8:
    dw $0002,$C3F7 
    db $F7 
    dw $2800,$C3F7 
    db $EF 
    dw $2802 

SamusSpritemaps_96F4:
    dw $0003,$C3FA 
    db $F7 
    dw $2800,$0002 
    db $EF 
    dw $2804,$C3F2 
    db $EF 
    dw $2802 

SamusSpritemaps_9705:
    dw $0006,$01FD 
    db $FB 
    dw $2802,$0005 
    db $F3 
    dw $2803,$01FD 
    db $F3 
    dw $2804,$000B 
    db $01 
    dw $2805,$0007 
    db $FD 
    dw $2806,$C3FA 
    db $F0 
    dw $2800 

SamusSpritemaps_9725:
    dw $0006,$01ED 
    db $01 
    dw $6802,$01F1 
    db $FD 
    dw $6803,$01FC 
    db $FB 
    dw $2804,$01F4 
    db $F3 
    dw $2805,$01FC 
    db $F3 
    dw $2806,$C3F6 
    db $F0 
    dw $2800 

SamusSpritemaps_9745:
    dw $0005,$0006 
    db $01 
    dw $2804,$C3FE 
    db $F1 
    dw $2800,$C3F6 
    db $F1 
    dw $2802,$000D 
    db $03 
    dw $2805,$0009 
    db $FF 
    dw $2806 

SamusSpritemaps_9760:
    dw $0005,$01EF 
    db $FF 
    dw $6804,$01F0 
    db $01 
    dw $2805,$C3F0 
    db $F1 
    dw $2800,$01EB 
    db $03 
    dw $6806,$C3F8 
    db $F1 
    dw $2802 

SamusSpritemaps_977B:
    dw $0005,$0001 
    db $00 
    dw $2802,$01F9 
    db $00 
    dw $2803,$C3F9 
    db $F0 
    dw $2800,$000A 
    db $FD 
    dw $2804,$0002 
    db $FD 
    dw $2805 

SamusSpritemaps_9796:
    dw $0005,$01FF 
    db $00 
    dw $2802,$01F7 
    db $00 
    dw $2803,$C3F7 
    db $F0 
    dw $2800,$01EE 
    db $FD 
    dw $6804,$01F6 
    db $FD 
    dw $6805 

SamusSpritemaps_97B1:
    dw $0004,$000A,$04EE 
    db $68 
    dw $C3FF,$00F1 
    db $28 
    dw $000E,$05EA 
    db $68 
    dw $C3F7,$02F1 
    db $28 

SamusSpritemaps_97C7:
    dw $0004,$01EA 
    db $E9 
    dw $2804,$C3F1 
    db $F1 
    dw $2800,$01EE 
    db $ED 
    dw $2805,$C3F9 
    db $F1 
    dw $2802 

SamusSpritemaps_97DD:
    dw $0003,$C3FF 
    db $F8 
    dw $2800,$0007 
    db $F0 
    dw $2804,$C3F7 
    db $F0 
    dw $2802 

SamusSpritemaps_97EE:
    dw $0003,$C3F1 
    db $F8 
    dw $2800,$C3F9 
    db $F0 
    dw $2802,$C3F1 
    db $F0 
    dw $2804 

SamusSpritemaps_97FF:
    dw $0005,$01F9 
    db $F9 
    dw $2802,$01F9 
    db $F1 
    dw $2803,$01FE 
    db $E1 
    dw $2804,$01FE 
    db $E9 
    dw $2805,$C3F9 
    db $F1 
    dw $2800 

SamusSpritemaps_981A:
    dw $0005,$01FF 
    db $F9 
    dw $2802,$01FF 
    db $F1 
    dw $2803,$01FA 
    db $E1 
    dw $6804,$C3F7 
    db $F1 
    dw $2800,$01FA 
    db $E9 
    dw $6805 

SamusSpritemaps_9835:
    dw $0003,$C3FF 
    db $EE 
    dw $2800,$01F7 
    db $FE 
    dw $2804,$C3F7 
    db $EE 
    dw $2802 

SamusSpritemaps_9846:
    dw $0003,$C3F1 
    db $EE 
    dw $2800,$0001 
    db $FE 
    dw $2804,$C3F9 
    db $EE 
    dw $2802 

SamusSpritemaps_9857:
    dw $0005,$000C 
    db $EA 
    dw $6802,$01FD 
    db $F8 
    dw $2803,$01FD 
    db $F0 
    dw $2804,$0008 
    db $EE 
    dw $6805,$C3FB 
    db $F0 
    dw $2800 

SamusSpritemaps_9872:
    dw $0006,$01FB 
    db $FB 
    dw $2802,$01FB 
    db $F3 
    dw $2803,$01F3 
    db $F3 
    dw $2804,$01EC 
    db $EA 
    dw $2805,$01F0 
    db $EE 
    dw $2806,$C3F5 
    db $F0 
    dw $2800 

SamusSpritemaps_9892:
    dw $0005,$01F7 
    db $F1 
    dw $6806,$01F3 
    db $F5 
    dw $6807,$C3F3 
    db $F0 
    dw $2800,$C3FB 
    db $E8 
    dw $2802,$C3FB 
    db $F0 
    dw $2804 

SamusSpritemaps_98AD:
    dw $0005,$0004 
    db $F4 
    dw $6806,$0000 
    db $F8 
    dw $6807,$C3F5 
    db $E8 
    dw $6800,$C3FD 
    db $F0 
    dw $6802,$C3F5 
    db $F0 
    dw $6804 

SamusSpritemaps_98C8:
    dw $0007,$01F5 
    db $F3 
    dw $2802,$01FD 
    db $F3 
    dw $2803,$01E7 
    db $FB 
    dw $6804,$C3F6 
    db $F0 
    dw $2800,$01EF 
    db $FB 
    dw $6805,$01FE 
    db $00 
    dw $2806,$01F6 
    db $00 
    dw $2807 

SamusSpritemaps_98ED:
    dw $0007,$01FD 
    db $FB 
    dw $2802,$0004 
    db $F3 
    dw $2803,$01FC 
    db $F3 
    dw $2804,$0011 
    db $FB 
    dw $2805,$0002 
    db $00 
    dw $2806,$C3FA 
    db $F0 
    dw $2800,$0009 
    db $FB 
    dw $2807 

SamusSpritemaps_9912:
    dw $0004,$C3F9 
    db $F8 
    dw $2800,$C3F9 
    db $F0 
    dw $2802,$000A 
    db $FE 
    dw $2804,$0002 
    db $FE 
    dw $2805 

SamusSpritemaps_9928:
    dw $0004,$C3F7 
    db $F8 
    dw $2800,$C3F7 
    db $F0 
    dw $2802,$01EE 
    db $FE 
    dw $6804,$01F6 
    db $FE 
    dw $6805 

SamusSpritemaps_993E:
    dw $0004,$01F4 
    db $E8 
    dw $2806,$C3FC 
    db $E8 
    dw $2800,$C3FC 
    db $F0 
    dw $2802,$C3F4 
    db $F0 
    dw $2804 

SamusSpritemaps_9954:
    dw $0005,$01F4 
    db $00 
    dw $2806,$0004 
    db $F8 
    dw $2807,$C3FC 
    db $E8 
    dw $2800,$C3F4 
    db $E8 
    dw $2802,$C3F4 
    db $F0 
    dw $2804 

SamusSpritemaps_996F:
    dw $0001,$01F8 
    db $F8 
    dw $2C00 

SamusSpritemaps_9976:
    dw $0002,$C3FF 
    db $F0 
    dw $6800,$C3F0 
    db $F0 
    dw $2800 

SamusSpritemaps_9982:
    dw $0004,$0004 
    db $E8 
    dw $2804,$01FC 
    db $E8 
    dw $2805,$C3FC 
    db $F0 
    dw $2800,$C3F4 
    db $F0 
    dw $2802 

SamusSpritemaps_9998:
    dw $0004,$01F5 
    db $E8 
    dw $6804,$01FD 
    db $E8 
    dw $6805,$C3F2 
    db $F0 
    dw $2800,$C3FA 
    db $F0 
    dw $2802 

SamusSpritemaps_99AE:
    dw $0006,$01F3 
    db $E8 
    dw $2802,$0003 
    db $E8 
    dw $2803,$01FB 
    db $E8 
    dw $2804,$0003 
    db $F8 
    dw $2805,$0003 
    db $F0 
    dw $2806,$C3F3 
    db $F0 
    dw $2800 

SamusSpritemaps_99CE:
    dw $0005,$0004 
    db $E8 
    dw $2802,$01FC 
    db $E8 
    dw $2803,$01F4 
    db $F8 
    dw $2804,$01F4 
    db $F0 
    dw $2805,$C3FC 
    db $F0 
    dw $2800 

SamusSpritemaps_99E9:
    dw $0004,$0004 
    db $E8 
    dw $2806,$C3F4 
    db $E8 
    dw $2800,$C3F4 
    db $F0 
    dw $2802,$C3FC 
    db $F0 
    dw $2804 

SamusSpritemaps_99FF:
    dw $0006,$01E2 
    db $F4 
    dw $6804,$01EA 
    db $F4 
    dw $6805,$C3EC 
    db $F0 
    dw $2800,$0004 
    db $08 
    dw $2806,$0004 
    db $00 
    dw $2807,$C3FC 
    db $F0 
    dw $2802 

SamusSpritemaps_9A1F:
    dw $0006,$0015 
    db $F4 
    dw $2804,$000D 
    db $F4 
    dw $2805,$01F4 
    db $08 
    dw $2806,$01F4 
    db $00 
    dw $2807,$C204 
    db $F0 
    dw $2800,$C3F4 
    db $F0 
    dw $2802 

SamusSpritemaps_9A3F:
    dw $0002,$C3FA 
    db $F8 
    dw $2800,$C3FA 
    db $F0 
    dw $2802 

SamusSpritemaps_9A4B:
    dw $0002,$C3F8 
    db $F8 
    dw $2800,$C3F8 
    db $F0 
    dw $2802 

SamusSpritemaps_9A57:
    dw $0002,$C3F6 
    db $F8 
    dw $2800,$C3F6 
    db $F0 
    dw $2802 

SamusSpritemaps_9A63:
    dw $0002,$C3F8 
    db $F8 
    dw $2800,$C3F8 
    db $F0 
    dw $2802 

SamusSpritemaps_9A6F:
    dw $0002,$C3FC 
    db $F0 
    dw $2800,$C3F4 
    db $F0 
    dw $2802 

SamusSpritemaps_9A7B:
    dw $0002,$C3FC 
    db $F0 
    dw $2800,$C204 
    db $F0 
    dw $2802 

SamusSpritemaps_9A87:
    dw $0002,$C3F4 
    db $F0 
    dw $6800,$C3EC 
    db $F0 
    dw $6802 

SamusSpritemaps_9A93:
    dw $0005,$01ED 
    db $F8 
    dw $6806,$01F1 
    db $F4 
    dw $6807,$C200 
    db $F8 
    dw $6800,$C3F0 
    db $F0 
    dw $6802,$C200 
    db $F0 
    dw $6804 

SamusSpritemaps_9AAE:
    dw $0005,$01F6 
    db $FC 
    dw $6806,$01F2 
    db $00 
    dw $6807,$C3F0 
    db $F8 
    dw $2800,$C200 
    db $F0 
    dw $2802,$C3F0 
    db $F0 
    dw $2804 

SamusSpritemaps_9AC9:
    dw $0001,$01F8 
    db $F8 
    dw $3800 

SamusSpritemaps_9AD0:
    dw $0001,$01F8 
    db $F8 
    dw $3800 

SamusSpritemaps_9AD7:
    dw $0006,$01F8 
    db $00 
    dw $2802,$0004 
    db $E8 
    dw $2803,$01FC 
    db $E8 
    dw $2804,$0004 
    db $F8 
    dw $2805,$0004 
    db $F0 
    dw $2806,$C3F4 
    db $F0 
    dw $2800 

SamusSpritemaps_9AF7:
    dw $0006,$01F7 
    db $00 
    dw $2802,$01F6 
    db $E8 
    dw $6803,$01FE 
    db $E8 
    dw $6804,$01F3 
    db $F8 
    dw $2805,$01F3 
    db $F0 
    dw $2806,$C3FB 
    db $F0 
    dw $2800 

SamusSpritemaps_9B17:
    dw $0004,$01FF 
    db $05 
    dw $E804,$01FF 
    db $0D 
    dw $E805,$C3F8 
    db $F0 
    dw $2800,$C3F8 
    db $F8 
    dw $2802 

SamusSpritemaps_9B2D:
    dw $0004,$01F8 
    db $05 
    dw $A804,$01F8 
    db $0D 
    dw $A805,$C3F8 
    db $F0 
    dw $2800,$C3F8 
    db $F8 
    dw $2802 

SamusSpritemaps_9B43:
    dw $0004,$C3F4 
    db $F0 
    dw $2800,$000C 
    db $08 
    dw $2804,$000C 
    db $00 
    dw $2805,$C204 
    db $F0 
    dw $2802 

SamusSpritemaps_9B59:
    dw $0004,$C3FC 
    db $F0 
    dw $2800,$01EC 
    db $08 
    dw $2804,$01EC 
    db $00 
    dw $2805,$C3EC 
    db $F0 
    dw $2802 

SamusSpritemaps_9B6F:
    dw $0003,$0001 
    db $FE 
    dw $2802,$01F9 
    db $FE 
    dw $2803,$C3F7 
    db $F0 
    dw $2800 

SamusSpritemaps_9B80:
    dw $0002,$C3F9 
    db $F8 
    dw $2800,$C3F9 
    db $F0 
    dw $2802 

SamusSpritemaps_9B8C:
    dw $0004,$01FE 
    db $03 
    dw $2804,$01FA 
    db $FF 
    dw $2805,$C3F7 
    db $F8 
    dw $2800,$C3F7 
    db $F0 
    dw $2802 

SamusSpritemaps_9BA2:
    dw $0002,$C3F9 
    db $F8 
    dw $2800,$C3F9 
    db $F0 
    dw $2802 

SamusSpritemaps_9BAE:
    dw $0003,$01FB 
    db $00 
    dw $2802,$01F7 
    db $FC 
    dw $2803,$C3F7 
    db $F0 
    dw $2800 

SamusSpritemaps_9BBF:
    dw $0002,$C3F9 
    db $F8 
    dw $2800,$C3F9 
    db $F0 
    dw $2802 

SamusSpritemaps_9BCB:
    dw $0006,$01FD 
    db $F9 
    dw $2802,$0005 
    db $F1 
    dw $2803,$01FD 
    db $F1 
    dw $2804,$000B 
    db $00 
    dw $2805,$0007 
    db $FC 
    dw $2806,$C3FA 
    db $EF 
    dw $2800 

SamusSpritemaps_9BEB:
    dw $0006,$01F1 
    db $FC 
    dw $6802,$01ED 
    db $00 
    dw $6803,$01FC 
    db $F9 
    dw $2804,$01F4 
    db $F1 
    dw $2805,$01FC 
    db $F1 
    dw $2806,$C3F6 
    db $EF 
    dw $2800 

SamusSpritemaps_9C0B:
    dw $0005,$01F9 
    db $F0 
    dw $6802,$0001 
    db $F0 
    dw $6803,$C3F9 
    db $F8 
    dw $2800,$000A 
    db $FD 
    dw $2804,$0002 
    db $FD 
    dw $2805 

SamusSpritemaps_9C26:
    dw $0005,$01F9 
    db $F0 
    dw $6802,$0001 
    db $F0 
    dw $6803,$C3F9 
    db $F8 
    dw $2800,$000A 
    db $FD 
    dw $2804,$0002 
    db $FD 
    dw $2805 

SamusSpritemaps_9C41:
    dw $0005,$01F9 
    db $F0 
    dw $6802,$0001 
    db $F0 
    dw $6803,$C3F9 
    db $F8 
    dw $2800,$000A 
    db $FD 
    dw $2804,$0002 
    db $FD 
    dw $2805 

SamusSpritemaps_9C5C:
    dw $0005,$01F9 
    db $F0 
    dw $6802,$0001 
    db $F0 
    dw $6803,$C3F9 
    db $F8 
    dw $2800,$000A 
    db $FD 
    dw $2804,$0002 
    db $FD 
    dw $2805 

SamusSpritemaps_9C77:
    dw $0005,$01F7 
    db $F0 
    dw $2802,$01FF 
    db $F0 
    dw $2803,$C3F7 
    db $F8 
    dw $2800,$01EE 
    db $FD 
    dw $6804,$01F6 
    db $FD 
    dw $6805 

SamusSpritemaps_9C92:
    dw $0005,$01F7 
    db $F0 
    dw $2802,$01FF 
    db $F0 
    dw $2803,$C3F7 
    db $F8 
    dw $2800,$01EE 
    db $FD 
    dw $6804,$01F6 
    db $FD 
    dw $6805 

SamusSpritemaps_9CAD:
    dw $0005,$01FF 
    db $F0 
    dw $2802,$01F7 
    db $F0 
    dw $2803,$C3F7 
    db $F8 
    dw $2800,$01EE 
    db $FD 
    dw $6804,$01F6 
    db $FD 
    dw $6805 

SamusSpritemaps_9CC8:
    dw $0005,$01FF 
    db $F0 
    dw $2802,$01F7 
    db $F0 
    dw $2803,$C3F7 
    db $F8 
    dw $2800,$01EE 
    db $FD 
    dw $6804,$01F6 
    db $FD 
    dw $6805 

SamusSpritemaps_9CE3:
    dw $0005,$000C 
    db $E9 
    dw $6802,$01FD 
    db $F6 
    dw $2803,$01FD 
    db $EE 
    dw $2804,$0008 
    db $ED 
    dw $6805,$C3FB 
    db $EF 
    dw $2800 

SamusSpritemaps_9CFE:
    dw $0006,$01FB 
    db $F9 
    dw $2802,$01FB 
    db $F1 
    dw $2803,$01F3 
    db $F1 
    dw $2804,$01EC 
    db $E9 
    dw $2805,$01F0 
    db $ED 
    dw $2806,$C3F5 
    db $EF 
    dw $2800 

SamusSpritemaps_9D1E:
    dw $0007,$01F5 
    db $F1 
    dw $2802,$01FD 
    db $F1 
    dw $2803,$01E7 
    db $FA 
    dw $6804,$C3F6 
    db $EF 
    dw $2800,$01EF 
    db $FA 
    dw $6805,$01FE 
    db $FF 
    dw $2806,$01F6 
    db $FF 
    dw $2807 

SamusSpritemaps_9D43:
    dw $0007,$01FC 
    db $F9 
    dw $2802,$0004 
    db $F1 
    dw $2803,$01FC 
    db $F1 
    dw $2804,$0011 
    db $FA 
    dw $2805,$0002 
    db $FF 
    dw $2806,$C3FA 
    db $EF 
    dw $2800,$0009 
    db $FA 
    dw $2807 

SamusSpritemaps_9D68:
    dw $0007,$01F5 
    db $F1 
    dw $2802,$01FD 
    db $F1 
    dw $2803,$01E7 
    db $F9 
    dw $6804,$C3F6 
    db $EE 
    dw $2800,$01EF 
    db $F9 
    dw $6805,$01FE 
    db $FE 
    dw $2806,$01F6 
    db $FE 
    dw $2807 

SamusSpritemaps_9D8D:
    dw $0007,$01FC 
    db $F9 
    dw $2802,$0004 
    db $F1 
    dw $2803,$01FC 
    db $F1 
    dw $2804,$0011 
    db $F9 
    dw $2805,$0002 
    db $FE 
    dw $2806,$C3FA 
    db $EE 
    dw $2800,$0009 
    db $F9 
    dw $2807 

SamusSpritemaps_9DB2:
    dw $0005,$000C 
    db $E8 
    dw $6802,$01FD 
    db $F6 
    dw $2803,$01FD 
    db $EE 
    dw $2804,$0008 
    db $EC 
    dw $6805,$C3FB 
    db $EE 
    dw $2800 

SamusSpritemaps_9DCD:
    dw $0006,$01FB 
    db $F9 
    dw $2802,$01FB 
    db $F1 
    dw $2803,$01F3 
    db $F1 
    dw $2804,$01EC 
    db $E8 
    dw $2805,$01F0 
    db $EC 
    dw $2806,$C3F5 
    db $EE 
    dw $2800 

SamusSpritemaps_9DED:
    dw $0006,$01FD 
    db $F9 
    dw $2802,$0005 
    db $F1 
    dw $2803,$01FD 
    db $F1 
    dw $2804,$000B 
    db $FF 
    dw $2805,$0007 
    db $FB 
    dw $2806,$C3FA 
    db $EE 
    dw $2800 

SamusSpritemaps_9E0D:
    dw $0006,$01F1 
    db $FB 
    dw $6802,$01FC 
    db $F9 
    dw $2803,$01F4 
    db $F1 
    dw $2804,$01FC 
    db $F1 
    dw $2805,$01ED 
    db $FF 
    dw $6806,$C3F6 
    db $EE 
    dw $2800 

SamusSpritemaps_9E2D:
    dw $0005,$0001 
    db $FF 
    dw $2802,$01F9 
    db $FF 
    dw $2803,$C3F9 
    db $EF 
    dw $2800,$000A 
    db $FC 
    dw $2804,$0002 
    db $FC 
    dw $2805 

SamusSpritemaps_9E48:
    dw $0005,$01FF 
    db $FF 
    dw $2802,$01F7 
    db $FF 
    dw $2803,$C3F7 
    db $EF 
    dw $2800,$01EE 
    db $FC 
    dw $6804,$01F6 
    db $FC 
    dw $6805 

SamusSpritemaps_9E63:
    dw $0006,$0005 
    db $F7 
    dw $2802,$01FD 
    db $F7 
    dw $2803,$01F9 
    db $F5 
    dw $2804,$01F9 
    db $F7 
    dw $6805,$01F9 
    db $EF 
    dw $6806,$C3FA 
    db $F0 
    dw $6800 

SamusSpritemaps_9E83:
    dw $0005,$0005 
    db $EF 
    dw $2802,$01FD 
    db $EF 
    dw $2803,$01F9 
    db $F6 
    dw $6804,$01F9 
    db $EE 
    dw $6805,$C3FA 
    db $F0 
    dw $6800 

SamusSpritemaps_9E9E:
    dw $0005,$01FD 
    db $F6 
    dw $2802,$01F5 
    db $F6 
    dw $2803,$01FE 
    db $F7 
    dw $2804,$01FE 
    db $EF 
    dw $2805,$C3F6 
    db $F0 
    dw $2800 

SamusSpritemaps_9EB9:
    dw $0005,$01F9 
    db $F0 
    dw $2802,$01F1 
    db $F0 
    dw $2803,$01FE 
    db $F6 
    dw $2804,$01FE 
    db $EE 
    dw $2805,$C3F6 
    db $F0 
    dw $2800 

SamusSpritemaps_9ED4:
    dw $0006,$01FE 
    db $F4 
    dw $2802,$01F6 
    db $F4 
    dw $2803,$01F2 
    db $02 
    dw $2804,$01FA 
    db $02 
    dw $2805,$01FA 
    db $FA 
    dw $2806,$C3F6 
    db $F2 
    dw $2800 

SamusSpritemaps_9EF4:
    dw $0006,$01FD 
    db $F5 
    dw $2802,$01F5 
    db $F5 
    dw $2803,$01F3 
    db $03 
    dw $2804,$01FB 
    db $03 
    dw $2805,$01FB 
    db $FB 
    dw $2806,$C3F6 
    db $F3 
    dw $2800 

SamusSpritemaps_9F14:
    dw $0006,$01FC 
    db $F6 
    dw $2802,$01F4 
    db $F6 
    dw $2803,$01F4 
    db $04 
    dw $2804,$01FC 
    db $04 
    dw $2805,$01FC 
    db $FC 
    dw $2806,$C3F6 
    db $F4 
    dw $2800 

SamusSpritemaps_9F34:
    dw $0007,$0000 
    db $00 
    dw $2802,$0004 
    db $04 
    dw $2803,$01FE 
    db $02 
    dw $6804,$01FA 
    db $F4 
    dw $6805,$0002 
    db $F4 
    dw $6806,$01FE 
    db $FA 
    dw $6807,$C3FA 
    db $F2 
    dw $6800 

SamusSpritemaps_9F59:
    dw $0007,$01FF 
    db $01 
    dw $2802,$0003 
    db $05 
    dw $2803,$01FB 
    db $F5 
    dw $6804,$0003 
    db $F5 
    dw $6805,$01FD 
    db $03 
    dw $6806,$01FD 
    db $FB 
    dw $6807,$C3FA 
    db $F3 
    dw $6800 

SamusSpritemaps_9F7E:
    dw $0007,$01FE 
    db $02 
    dw $2802,$0002 
    db $06 
    dw $2803,$01FC 
    db $F6 
    dw $6804,$0004 
    db $F6 
    dw $6805,$01FC 
    db $04 
    dw $6806,$01FC 
    db $FC 
    dw $6807,$C3FA 
    db $F4 
    dw $6800 

SamusSpritemaps_9FA3:
    dw $0006,$01FE 
    db $F4 
    dw $2802,$01F6 
    db $F4 
    dw $2803,$01F2 
    db $02 
    dw $2804,$01FA 
    db $02 
    dw $2805,$01FA 
    db $FA 
    dw $2806,$C3F6 
    db $F2 
    dw $2800 

SamusSpritemaps_9FC3:
    dw $0006,$01FD 
    db $F5 
    dw $2802,$01F5 
    db $F5 
    dw $2803,$01F3 
    db $03 
    dw $2804,$01FB 
    db $03 
    dw $2805,$01FB 
    db $FB 
    dw $2806,$C3F6 
    db $F3 
    dw $2800 

SamusSpritemaps_9FE3:
    dw $0006,$01FC 
    db $F6 
    dw $2802,$01F4 
    db $F6 
    dw $2803,$01F4 
    db $04 
    dw $2804,$01FC 
    db $04 
    dw $2805,$01FC 
    db $FC 
    dw $2806,$C3F6 
    db $F4 
    dw $2800 

SamusSpritemaps_A003:
    dw $0007,$0000 
    db $00 
    dw $2802,$0004 
    db $04 
    dw $2803,$01FA 
    db $F4 
    dw $6804,$0002 
    db $F4 
    dw $6805,$01FE 
    db $02 
    dw $6806,$01FE 
    db $FA 
    dw $6807,$C3FA 
    db $F2 
    dw $6800 

SamusSpritemaps_A028:
    dw $0007,$01FF 
    db $01 
    dw $2802,$0003 
    db $05 
    dw $2803,$01FB 
    db $F5 
    dw $6804,$0003 
    db $F5 
    dw $6805,$01FD 
    db $03 
    dw $6806,$01FD 
    db $FB 
    dw $6807,$C3FA 
    db $F3 
    dw $6800 

SamusSpritemaps_A04D:
    dw $0007,$01FE 
    db $02 
    dw $2802,$0002 
    db $06 
    dw $2803,$01FC 
    db $F6 
    dw $6804,$0004 
    db $F6 
    dw $6805,$01FC 
    db $04 
    dw $6806,$01FC 
    db $FC 
    dw $6807,$C3FA 
    db $F4 
    dw $6800 

SamusSpritemaps_A072:
    dw $0004,$C3F9 
    db $F8 
    dw $2800,$C3F9 
    db $F0 
    dw $2802,$000A 
    db $FD 
    dw $2804,$0002 
    db $FD 
    dw $2805 

SamusSpritemaps_A088:
    dw $0004,$C3F9 
    db $F8 
    dw $2800,$C3F9 
    db $F0 
    dw $2802,$000A 
    db $FD 
    dw $2804,$0002 
    db $FD 
    dw $2805 

SamusSpritemaps_A09E:
    dw $0004,$C3F9 
    db $F8 
    dw $2800,$C3F9 
    db $F0 
    dw $2802,$000A 
    db $FD 
    dw $2804,$0002 
    db $FD 
    dw $2805 

SamusSpritemaps_A0B4:
    dw $0004,$C3F7 
    db $F8 
    dw $2800,$C3F7 
    db $F0 
    dw $2802,$01EE 
    db $FD 
    dw $6804,$01F6 
    db $FD 
    dw $6805 

SamusSpritemaps_A0CA:
    dw $0004,$C3F7 
    db $F8 
    dw $2800,$C3F7 
    db $F0 
    dw $2802,$01EE 
    db $FD 
    dw $6804,$01F6 
    db $FD 
    dw $6805 

SamusSpritemaps_A0E0:
    dw $0004,$C3F7 
    db $F8 
    dw $2800,$C3F7 
    db $F0 
    dw $2802,$01EE 
    db $FD 
    dw $6804,$01F6 
    db $FD 
    dw $6805 

SamusSpritemaps_A0F6:
    dw $0005,$0001 
    db $00 
    dw $2802,$01F9 
    db $00 
    dw $2803,$C3F9 
    db $F0 
    dw $2800,$000A 
    db $FD 
    dw $2804,$0002 
    db $FD 
    dw $2805 

SamusSpritemaps_A111:
    dw $0005,$01FF 
    db $00 
    dw $2802,$01F7 
    db $00 
    dw $2803,$C3F7 
    db $F0 
    dw $2800,$01EE 
    db $FD 
    dw $6804,$01F6 
    db $FD 
    dw $6805 

SamusSpritemaps_A12C:
    dw $0001,$01F8 
    db $F8 
    dw $3000 

SamusSpritemaps_A133:
    dw $0001,$01F8 
    db $F8 
    dw $3800 

SamusSpritemaps_A13A:
    dw $0009,$0004 
    db $10 
    dw $3800,$0004 
    db $08 
    dw $3801,$01FC 
    db $08 
    dw $3802,$01FC 
    db $00 
    dw $3803,$01FC 
    db $F8 
    dw $3804,$0004 
    db $F0 
    dw $3805,$01FC 
    db $F0 
    dw $3806,$01F4 
    db $F0 
    dw $3807,$01F4 
    db $E8 
    dw $3810 

SamusSpritemaps_A169:
    dw $0007,$0004 
    db $00 
    dw $3800,$01FC 
    db $00 
    dw $3801,$01F4 
    db $00 
    dw $3802,$0004 
    db $F8 
    dw $3803,$01FC 
    db $F8 
    dw $3804,$01F4 
    db $F8 
    dw $3805,$01F4 
    db $F0 
    dw $3806 

SamusSpritemaps_A18E:
    dw $000B,$01FC 
    db $10 
    dw $3800,$01F4 
    db $10 
    dw $3801,$01FC 
    db $08 
    dw $3802,$01F4 
    db $08 
    dw $3803,$0004 
    db $00 
    dw $3804,$01FC 
    db $00 
    dw $3805,$0004 
    db $F8 
    dw $3806,$01FC 
    db $F8 
    dw $3807,$01FC 
    db $F0 
    dw $3810,$0004 
    db $E8 
    dw $3811,$01FC 
    db $E8 
    dw $3812 

SamusSpritemaps_A1C7:
    dw $000F,$01FC 
    db $10 
    dw $3800,$01F4 
    db $10 
    dw $3801,$01FC 
    db $08 
    dw $3802,$01F4 
    db $08 
    dw $3803,$0004 
    db $00 
    dw $3804,$01FC 
    db $00 
    dw $3805,$01F4 
    db $00 
    dw $3806,$0004 
    db $F8 
    dw $3807,$01FC 
    db $F8 
    dw $3810,$01F4 
    db $F8 
    dw $3811,$0004 
    db $F0 
    dw $3812,$01FC 
    db $F0 
    dw $3813,$01F4 
    db $F0 
    dw $3814,$0004 
    db $E8 
    dw $3815,$01FC 
    db $E8 
    dw $3816 

SamusSpritemaps_A214:
    dw $0008,$01FC 
    db $10 
    dw $3800,$01FC 
    db $08 
    dw $3801,$01FC 
    db $00 
    dw $3802,$0004 
    db $F8 
    dw $3803,$01F4 
    db $F8 
    dw $3804,$0004 
    db $F0 
    dw $3805,$01F4 
    db $F0 
    dw $3806,$0004 
    db $E8 
    dw $3807 

SamusSpritemaps_A23E:
    dw $000A,$01FC 
    db $10 
    dw $3800,$0004 
    db $08 
    dw $3801,$01FC 
    db $08 
    dw $3802,$0004 
    db $00 
    dw $3803,$01FC 
    db $00 
    dw $3804,$0004 
    db $F0 
    dw $3805,$01FC 
    db $F0 
    dw $3806,$01F4 
    db $F0 
    dw $3807,$0004 
    db $E8 
    dw $3810,$01FC 
    db $E8 
    dw $3811 

SamusSpritemaps_A272:
    dw $000B,$01F4 
    db $10 
    dw $3800,$0004 
    db $08 
    dw $3801,$01FC 
    db $08 
    dw $3802,$01F4 
    db $08 
    dw $3803,$0004 
    db $00 
    dw $3804,$01FC 
    db $00 
    dw $3805,$01F4 
    db $00 
    dw $3806,$01F4 
    db $F0 
    dw $3807,$0004 
    db $E8 
    dw $3810,$01FC 
    db $E8 
    dw $3811,$01F4 
    db $E8 
    dw $3812 

SamusSpritemaps_A2AB:
    dw $0007,$0004 
    db $08 
    dw $3800,$01F4 
    db $08 
    dw $3801,$01F4 
    db $00 
    dw $3802,$0004 
    db $F8 
    dw $3803,$0004 
    db $E8 
    dw $3804,$01FC 
    db $E8 
    dw $3805,$01F4 
    db $E8 
    dw $3806 

SamusSpritemaps_A2D0:
    dw $0003,$0011 
    db $FA 
    dw $2802,$0009 
    db $FA 
    dw $2803,$C3FA 
    db $F0 
    dw $2800 

SamusSpritemaps_A2E1:
    dw $0003,$0011 
    db $F9 
    dw $2802,$0009 
    db $F9 
    dw $2803,$C3FA 
    db $EF 
    dw $2800 

SamusSpritemaps_A2F2:
    dw $0004,$0011 
    db $F9 
    dw $2802,$0009 
    db $F9 
    dw $2803,$0007 
    db $F7 
    dw $2804,$C3F7 
    db $EF 
    dw $2800 

SamusSpritemaps_A308:
    dw $0005,$0011 
    db $F8 
    dw $2802,$0009 
    db $F8 
    dw $2803,$0005 
    db $EE 
    dw $2804,$0005 
    db $F6 
    dw $2805,$C3F5 
    db $EE 
    dw $2800 

SamusSpritemaps_A323:
    dw $0003,$0011 
    db $F9 
    dw $2802,$0009 
    db $F9 
    dw $2803,$C3FA 
    db $EF 
    dw $2800 

SamusSpritemaps_A334:
    dw $0004,$0011 
    db $F9 
    dw $2802,$0009 
    db $F9 
    dw $2803,$000A 
    db $F7 
    dw $2804,$C3FA 
    db $EF 
    dw $2800 

SamusSpritemaps_A34A:
    dw $0005,$01EF 
    db $FA 
    dw $6802,$01E7 
    db $FA 
    dw $6803,$01FE 
    db $00 
    dw $2804,$01F6 
    db $00 
    dw $2805,$C3F6 
    db $F0 
    dw $2800 

SamusSpritemaps_A365:
    dw $0005,$01EF 
    db $F9 
    dw $6802,$01E7 
    db $F9 
    dw $6803,$01FE 
    db $FF 
    dw $2804,$01F6 
    db $FF 
    dw $2805,$C3F6 
    db $EF 
    dw $2800 

SamusSpritemaps_A380:
    dw $0006,$01EE 
    db $F7 
    dw $2802,$01FE 
    db $FF 
    dw $2803,$01F6 
    db $FF 
    dw $2804,$C3F6 
    db $EF 
    dw $2800,$01EF 
    db $F9 
    dw $6805,$01E7 
    db $F9 
    dw $6806 

SamusSpritemaps_A3A0:
    dw $0006,$01EE 
    db $F6 
    dw $2802,$01EF 
    db $F8 
    dw $6803,$01E7 
    db $F8 
    dw $6804,$01FE 
    db $FE 
    dw $2805,$01F6 
    db $FE 
    dw $2806,$C3F6 
    db $EE 
    dw $2800 

SamusSpritemaps_A3C0:
    dw $0005,$01EF 
    db $F9 
    dw $6802,$01E7 
    db $F9 
    dw $6803,$01FE 
    db $FF 
    dw $2804,$01F6 
    db $FF 
    dw $2805,$C3F6 
    db $EF 
    dw $2800 

SamusSpritemaps_A3DB:
    dw $0007,$01EF 
    db $F9 
    dw $6802,$01E7 
    db $F9 
    dw $6803,$0006 
    db $FF 
    dw $2804,$01FE 
    db $FF 
    dw $2805,$01F6 
    db $F7 
    dw $2806,$01F6 
    db $EF 
    dw $2807,$C3FE 
    db $EF 
    dw $2800 

SamusSpritemaps_A400:
    dw $0005,$0011 
    db $F8 
    dw $2802,$0009 
    db $F8 
    dw $2803,$000A 
    db $F6 
    dw $2804,$000A 
    db $EE 
    dw $2805,$C3FA 
    db $EE 
    dw $2800 

SamusSpritemaps_A41B:
    dw $0007,$01EF 
    db $F8 
    dw $6802,$01E7 
    db $F8 
    dw $6803,$0006 
    db $FE 
    dw $2804,$01FE 
    db $FE 
    dw $2805,$01F6 
    db $F6 
    dw $2806,$01F6 
    db $EE 
    dw $2807,$C3FE 
    db $EE 
    dw $2800 

SamusSpritemaps_A440:
    dw $0003,$0011 
    db $FA 
    dw $2802,$0009 
    db $FA 
    dw $2803,$C3FA 
    db $F0 
    dw $2800 

SamusSpritemaps_A451:
    dw $0005,$01EF 
    db $FA 
    dw $6802,$01E7 
    db $FA 
    dw $6803,$01FE 
    db $00 
    dw $2804,$01F6 
    db $00 
    dw $2805,$C3F6 
    db $F0 
    dw $2800 

SamusSpritemaps_A46C:
    dw $0004,$001C 
    db $FD 
    dw $2804,$0014 
    db $FD 
    dw $2805,$C205 
    db $F6 
    dw $2800,$C200 
    db $F8 
    dw $2802 

SamusSpritemaps_A482:
    dw $0004,$001B 
    db $F7 
    dw $2804,$0013 
    db $F7 
    dw $2805,$C204 
    db $F4 
    dw $2800,$C3FF 
    db $F6 
    dw $2802 

SamusSpritemaps_A498:
    dw $0003,$C210 
    db $F1 
    dw $2800,$C204 
    db $F3 
    dw $2802,$C3FF 
    db $F5 
    dw $2804 

SamusSpritemaps_A4A9:
    dw $0003,$C202 
    db $EF 
    dw $2800,$C20E 
    db $ED 
    dw $2802,$C3FF 
    db $F2 
    dw $2804 

SamusSpritemaps_A4BA:
    dw $0003,$C20C 
    db $E5 
    dw $2800,$C202 
    db $EF 
    dw $2802,$C3FF 
    db $F2 
    dw $2804 

SamusSpritemaps_A4CB:
    dw $0003,$C209 
    db $E5 
    dw $2800,$C201 
    db $EF 
    dw $2802,$C3FF 
    db $F2 
    dw $2804 

SamusSpritemaps_A4DC:
    dw $0003,$C207 
    db $E3 
    dw $2800,$C201 
    db $ED 
    dw $2802,$C3FE 
    db $F1 
    dw $2804 

SamusSpritemaps_A4ED:
    dw $0004,$0004 
    db $E6 
    dw $2804,$0004 
    db $DE 
    dw $2805,$C3FD 
    db $EC 
    dw $2800,$C3FB 
    db $F0 
    dw $2802 

SamusSpritemaps_A503:
    dw $0004,$01FD 
    db $E5 
    dw $2804,$01FD 
    db $DD 
    dw $2805,$C3F6 
    db $EC 
    dw $2800,$C3F8 
    db $F0 
    dw $2802 

SamusSpritemaps_A519:
    dw $0004,$01F8 
    db $E6 
    dw $6804,$01F8 
    db $DE 
    dw $6805,$C3F3 
    db $EC 
    dw $2800,$C3F7 
    db $F0 
    dw $2802 

SamusSpritemaps_A52F:
    dw $0003,$C3EE 
    db $E2 
    dw $6800,$C3F3 
    db $ED 
    dw $2802,$C3F5 
    db $F1 
    dw $2804 

SamusSpritemaps_A540:
    dw $0003,$C3E8 
    db $E4 
    dw $6800,$C3F0 
    db $EF 
    dw $2802,$C3F2 
    db $F2 
    dw $2804 

SamusSpritemaps_A551:
    dw $0003,$C3E3 
    db $E5 
    dw $6800,$C3EE 
    db $EF 
    dw $2802,$C3F2 
    db $F2 
    dw $2804 

SamusSpritemaps_A562:
    dw $0003,$C3E0 
    db $E9 
    dw $6800,$C3EB 
    db $F2 
    dw $2802,$C3F1 
    db $F3 
    dw $2804 

SamusSpritemaps_A573:
    dw $0003,$C3E0 
    db $EF 
    dw $6800,$C3EB 
    db $F4 
    dw $2802,$C3F1 
    db $F3 
    dw $2804 

SamusSpritemaps_A584:
    dw $0004,$01DD 
    db $F7 
    dw $6804,$01E5 
    db $F7 
    dw $6805,$C3EB 
    db $F9 
    dw $2800,$C3F0 
    db $F7 
    dw $2802 

SamusSpritemaps_A59A:
    dw $0004,$01DC 
    db $FC 
    dw $6804,$01E4 
    db $FC 
    dw $6805,$C3EB 
    db $F9 
    dw $2800,$C3F0 
    db $F8 
    dw $2802 

SamusSpritemaps_A5B0:
    dw $0008,$0001 
    db $FB 
    dw $2804,$0001 
    db $F3 
    dw $2805,$C3F1 
    db $F3 
    dw $2800,$C3F0 
    db $F8 
    dw $6802,$01DC 
    db $FC 
    dw $6806,$01E4 
    db $FC 
    dw $6807,$01EB 
    db $02 
    dw $2814,$01EB 
    db $FA 
    dw $2815 

SamusSpritemaps_A5DA:
    dw $0008,$01DC 
    db $F8 
    dw $6804,$01E4 
    db $F8 
    dw $6805,$0001 
    db $FA 
    dw $2806,$0001 
    db $F2 
    dw $2807,$C3F1 
    db $F2 
    dw $2800,$C3F0 
    db $F7 
    dw $6802,$01EB 
    db $00 
    dw $2814,$01EB 
    db $F8 
    dw $2815 

SamusSpritemaps_A604:
    dw $000A,$0005 
    db $FA 
    dw $2804,$0005 
    db $F2 
    dw $2805,$C3F5 
    db $F2 
    dw $2800,$C3F1 
    db $F5 
    dw $6802,$01E0 
    db $F8 
    dw $6806,$01E8 
    db $F8 
    dw $6807,$01E0 
    db $F0 
    dw $6814,$01E8 
    db $F0 
    dw $6815,$01EB 
    db $FD 
    dw $2816,$01EB 
    db $F5 
    dw $2817 

SamusSpritemaps_A638:
    dw $000A,$0005 
    db $F9 
    dw $2804,$0005 
    db $F1 
    dw $2805,$C3F5 
    db $F1 
    dw $2800,$C3F1 
    db $F4 
    dw $6802,$01E0 
    db $F5 
    dw $6806,$01E8 
    db $F5 
    dw $6807,$01E0 
    db $ED 
    dw $6814,$01E8 
    db $ED 
    dw $6815,$01EB 
    db $FB 
    dw $2816,$01EB 
    db $F3 
    dw $2817 

SamusSpritemaps_A66C:
    dw $0009,$01FD 
    db $FE 
    dw $2804,$C3F5 
    db $EE 
    dw $2800,$C3F0 
    db $F2 
    dw $6802,$01E2 
    db $EC 
    dw $6805,$01EA 
    db $EC 
    dw $6806,$01E2 
    db $E4 
    dw $6807,$01EA 
    db $E4 
    dw $6814,$01F4 
    db $EE 
    dw $2815,$01EC 
    db $EE 
    dw $2816 

SamusSpritemaps_A69B:
    dw $0009,$01FE 
    db $FE 
    dw $2804,$C3F6 
    db $EE 
    dw $2800,$C3F2 
    db $F1 
    dw $6802,$01F6 
    db $ED 
    dw $2805,$01EE 
    db $ED 
    dw $2806,$01ED 
    db $EB 
    dw $6807,$01E5 
    db $EB 
    dw $6814,$01E5 
    db $E3 
    dw $6815,$01ED 
    db $E3 
    dw $6816 

SamusSpritemaps_A6CA:
    dw $0009,$01E9 
    db $E9 
    dw $6804,$01FE 
    db $FE 
    dw $2805,$C3F6 
    db $EE 
    dw $2800,$C3F2 
    db $F1 
    dw $6802,$01F1 
    db $E9 
    dw $6806,$01E9 
    db $E1 
    dw $6807,$01F1 
    db $E1 
    dw $6814,$01F6 
    db $EC 
    dw $2815,$01EE 
    db $EC 
    dw $2816 

SamusSpritemaps_A6F9:
    dw $0008,$0000 
    db $02 
    dw $2804,$01F8 
    db $02 
    dw $2805,$C3F8 
    db $F2 
    dw $2800,$C3F6 
    db $F0 
    dw $6802,$01F8 
    db $EB 
    dw $2806,$01F0 
    db $EB 
    dw $2807,$01F5 
    db $E5 
    dw $6814,$01F5 
    db $DD 
    dw $6815 

SamusSpritemaps_A723:
    dw $0008,$01FF 
    db $03 
    dw $2804,$01F7 
    db $03 
    dw $2805,$C3F7 
    db $F3 
    dw $2800,$C3F9 
    db $F1 
    dw $6802,$01FC 
    db $E4 
    dw $2806,$01FC 
    db $DC 
    dw $2807,$01FD 
    db $EB 
    dw $2814,$01F5 
    db $EB 
    dw $2815 

SamusSpritemaps_A74D:
    dw $0008,$01FF 
    db $01 
    dw $2804,$01F7 
    db $01 
    dw $2805,$C3F7 
    db $F1 
    dw $2800,$C3FA 
    db $F0 
    dw $6802,$0002 
    db $E5 
    dw $2806,$0002 
    db $DD 
    dw $2807,$0003 
    db $EB 
    dw $2814,$01FB 
    db $EB 
    dw $2815 

SamusSpritemaps_A777:
    dw $0009,$000B 
    db $E8 
    dw $2804,$01F1 
    db $FC 
    dw $2805,$C3F9 
    db $F4 
    dw $2800,$C3FB 
    db $F0 
    dw $6802,$0003 
    db $E8 
    dw $2806,$000B 
    db $E0 
    dw $2807,$0003 
    db $E0 
    dw $2814,$0005 
    db $EB 
    dw $2815,$01FD 
    db $EB 
    dw $2816 

SamusSpritemaps_A7A6:
    dw $000A,$0010 
    db $EA 
    dw $2804,$0008 
    db $EA 
    dw $2805,$0010 
    db $E2 
    dw $2806,$0008 
    db $E2 
    dw $2807,$01F1 
    db $FD 
    dw $2814,$01F1 
    db $F5 
    dw $2815,$C3F9 
    db $F5 
    dw $2800,$C3FD 
    db $F2 
    dw $6802,$0008 
    db $ED 
    dw $2816,$0000 
    db $ED 
    dw $2817 

SamusSpritemaps_A7DA:
    dw $000A,$01F1 
    db $FD 
    dw $2804,$01F1 
    db $F5 
    dw $2805,$C3F9 
    db $F5 
    dw $2800,$C3FD 
    db $F2 
    dw $6802,$0013 
    db $EC 
    dw $2806,$000B 
    db $EC 
    dw $2807,$0013 
    db $E4 
    dw $2814,$000B 
    db $E4 
    dw $2815,$0009 
    db $EE 
    dw $2816,$0001 
    db $EE 
    dw $2817 

SamusSpritemaps_A80E:
    dw $000A,$01F4 
    db $FC 
    dw $2804,$01F4 
    db $F4 
    dw $2805,$C3FC 
    db $F4 
    dw $2800,$C3FE 
    db $F4 
    dw $6802,$0016 
    db $F3 
    dw $2806,$000E 
    db $F3 
    dw $2807,$0016 
    db $EB 
    dw $2814,$000E 
    db $EB 
    dw $2815,$000A 
    db $F6 
    dw $2816,$000A 
    db $EE 
    dw $2817 

SamusSpritemaps_A842:
    dw $000A,$01F4 
    db $FC 
    dw $2804,$01F4 
    db $F4 
    dw $2805,$C3FC 
    db $F4 
    dw $2800,$C3FE 
    db $F4 
    dw $6802,$0017 
    db $F7 
    dw $2806,$000F 
    db $F7 
    dw $2807,$0017 
    db $EF 
    dw $2814,$000F 
    db $EF 
    dw $2815,$000B 
    db $F8 
    dw $2816,$000B 
    db $F0 
    dw $2817 

SamusSpritemaps_A876:
    dw $0009,$C3FE 
    db $F3 
    dw $2800,$01F6 
    db $FB 
    dw $2804,$01F6 
    db $F3 
    dw $2805,$01F6 
    db $EB 
    dw $2806,$C3FF 
    db $F7 
    dw $6802,$000E 
    db $FA 
    dw $2807,$000E 
    db $F9 
    dw $A814,$001C 
    db $F7 
    dw $2815,$0014 
    db $F7 
    dw $2816 

SamusSpritemaps_A8A5:
    dw $0009,$C3FE 
    db $F4 
    dw $2800,$01F6 
    db $FC 
    dw $2804,$01F6 
    db $F4 
    dw $2805,$01F6 
    db $EC 
    dw $2806,$C3FF 
    db $F8 
    dw $6802,$001C 
    db $FC 
    dw $2807,$0014 
    db $FC 
    dw $2814,$000E 
    db $FD 
    dw $2815,$000E 
    db $F5 
    dw $2816 

SamusSpritemaps_A8D4:
    dw $0004,$01DC 
    db $FB 
    dw $E804,$01E4 
    db $FB 
    dw $E805,$C3EB 
    db $FA 
    dw $E800,$C3F0 
    db $F8 
    dw $E802 

SamusSpritemaps_A8EA:
    dw $0004,$01DD 
    db $01 
    dw $E804,$01E5 
    db $01 
    dw $E805,$C3EC 
    db $FC 
    dw $E800,$C3F1 
    db $FA 
    dw $E802 

SamusSpritemaps_A900:
    dw $0003,$C3E0 
    db $FF 
    dw $E800,$C3EC 
    db $FD 
    dw $E802,$C3F1 
    db $FB 
    dw $E804 

SamusSpritemaps_A911:
    dw $0003,$C3EE 
    db $01 
    dw $E800,$C3E2 
    db $03 
    dw $E802,$C3F1 
    db $FE 
    dw $E804 

SamusSpritemaps_A922:
    dw $0003,$C3E4 
    db $0B 
    dw $E800,$C3EE 
    db $01 
    dw $E802,$C3F1 
    db $FE 
    dw $E804 

SamusSpritemaps_A933:
    dw $0003,$C3E7 
    db $0B 
    dw $E800,$C3EF 
    db $01 
    dw $E802,$C3F1 
    db $FE 
    dw $E804 

SamusSpritemaps_A944:
    dw $0003,$C3E9 
    db $0D 
    dw $E800,$C3EF 
    db $03 
    dw $E802,$C3F2 
    db $FF 
    dw $E804 

SamusSpritemaps_A955:
    dw $0004,$01F4 
    db $12 
    dw $E804,$01F4 
    db $1A 
    dw $E805,$C3F3 
    db $04 
    dw $E800,$C3F5 
    db $00 
    dw $E802 

SamusSpritemaps_A96B:
    dw $0004,$01FB 
    db $13 
    dw $E804,$01FB 
    db $1B 
    dw $E805,$C3FA 
    db $04 
    dw $E800,$C3F8 
    db $00 
    dw $E802 

SamusSpritemaps_A981:
    dw $0004,$0000 
    db $12 
    dw $A804,$0000 
    db $1A 
    dw $A805,$C3FD 
    db $04 
    dw $E800,$C3F9 
    db $00 
    dw $E802 

SamusSpritemaps_A997:
    dw $0003,$C202 
    db $0E 
    dw $A800,$C3FD 
    db $03 
    dw $E802,$C3FB 
    db $FF 
    dw $E804 

SamusSpritemaps_A9A8:
    dw $0003,$C208 
    db $0C 
    dw $A800,$C200 
    db $01 
    dw $E802,$C3FE 
    db $FE 
    dw $E804 

SamusSpritemaps_A9B9:
    dw $0003,$C20D 
    db $0B 
    dw $A800,$C202 
    db $01 
    dw $E802,$C3FE 
    db $FE 
    dw $E804 

SamusSpritemaps_A9CA:
    dw $0003,$C210 
    db $07 
    dw $A800,$C205 
    db $FE 
    dw $E802,$C3FF 
    db $FD 
    dw $E804 

SamusSpritemaps_A9DB:
    dw $0003,$C210 
    db $01 
    dw $A800,$C205 
    db $FC 
    dw $E802,$C3FF 
    db $FD 
    dw $E804 

SamusSpritemaps_A9EC:
    dw $0004,$001B 
    db $01 
    dw $A804,$0013 
    db $01 
    dw $A805,$C205 
    db $F7 
    dw $E800,$C200 
    db $F9 
    dw $E802 

SamusSpritemaps_AA02:
    dw $0004,$001C 
    db $FC 
    dw $A804,$0014 
    db $FC 
    dw $A805,$C205 
    db $F7 
    dw $E800,$C200 
    db $F8 
    dw $E802 

SamusSpritemaps_AA18:
    dw $0008,$01F7 
    db $FD 
    dw $E804,$01F7 
    db $05 
    dw $E805,$C3FF 
    db $FD 
    dw $E800,$C200 
    db $F8 
    dw $A802,$001C 
    db $FC 
    dw $A806,$0014 
    db $FC 
    dw $A807,$000D 
    db $F6 
    dw $E814,$000D 
    db $FE 
    dw $E815 

SamusSpritemaps_AA42:
    dw $0008,$001C 
    db $00 
    dw $A804,$0014 
    db $00 
    dw $A805,$01F7 
    db $FE 
    dw $E806,$01F7 
    db $06 
    dw $E807,$C3FF 
    db $FE 
    dw $E800,$C200 
    db $F9 
    dw $A802,$000D 
    db $F8 
    dw $E814,$000D 
    db $00 
    dw $E815 

SamusSpritemaps_AA6C:
    dw $000A,$01F3 
    db $FE 
    dw $E804,$01F3 
    db $06 
    dw $E805,$C3FB 
    db $FE 
    dw $E800,$C3FF 
    db $FB 
    dw $A802,$0018 
    db $00 
    dw $A806,$0010 
    db $00 
    dw $A807,$0018 
    db $08 
    dw $A814,$0010 
    db $08 
    dw $A815,$000D 
    db $FB 
    dw $E816,$000D 
    db $03 
    dw $E817 

SamusSpritemaps_AAA0:
    dw $000A,$01F3 
    db $FF 
    dw $E804,$01F3 
    db $07 
    dw $E805,$C3FB 
    db $FF 
    dw $E800,$C3FF 
    db $FC 
    dw $A802,$0018 
    db $03 
    dw $A806,$0010 
    db $03 
    dw $A807,$0018 
    db $0B 
    dw $A814,$0010 
    db $0B 
    dw $A815,$000D 
    db $FD 
    dw $E816,$000D 
    db $05 
    dw $E817 

SamusSpritemaps_AAD4:
    dw $0009,$01FB 
    db $FA 
    dw $E804,$C3FB 
    db $02 
    dw $E800,$C200 
    db $FE 
    dw $A802,$0016 
    db $0C 
    dw $A805,$000E 
    db $0C 
    dw $A806,$0016 
    db $14 
    dw $A807,$000E 
    db $14 
    dw $A814,$0004 
    db $0A 
    dw $E815,$000C 
    db $0A 
    dw $E816 

SamusSpritemaps_AB03:
    dw $0009,$01FA 
    db $FA 
    dw $E804,$C3FA 
    db $02 
    dw $E800,$C3FE 
    db $FF 
    dw $A802,$0002 
    db $0B 
    dw $E805,$000A 
    db $0B 
    dw $E806,$000B 
    db $0D 
    dw $A807,$0013 
    db $0D 
    dw $A814,$0013 
    db $15 
    dw $A815,$000B 
    db $15 
    dw $A816 

SamusSpritemaps_AB32:
    dw $0009,$000F 
    db $0F 
    dw $A804,$01FA 
    db $FA 
    dw $E805,$C3FA 
    db $02 
    dw $E800,$C3FE 
    db $FF 
    dw $A802,$0007 
    db $0F 
    dw $A806,$000F 
    db $17 
    dw $A807,$0007 
    db $17 
    dw $A814,$0002 
    db $0C 
    dw $E815,$000A 
    db $0C 
    dw $E816 

SamusSpritemaps_AB61:
    dw $0008,$01F8 
    db $F6 
    dw $E804,$0000 
    db $F6 
    dw $E805,$C3F8 
    db $FE 
    dw $E800,$C3FA 
    db $00 
    dw $A802,$0000 
    db $0D 
    dw $E806,$0008 
    db $0D 
    dw $E807,$0003 
    db $13 
    dw $A814,$0003 
    db $1B 
    dw $A815 

SamusSpritemaps_AB8B:
    dw $0008,$01F9 
    db $F5 
    dw $E804,$0001 
    db $F5 
    dw $E805,$C3F9 
    db $FD 
    dw $E800,$C3F7 
    db $FF 
    dw $A802,$01FC 
    db $14 
    dw $E806,$01FC 
    db $1C 
    dw $E807,$01FB 
    db $0D 
    dw $E814,$0003 
    db $0D 
    dw $E815 

SamusSpritemaps_ABB5:
    dw $0008,$01F9 
    db $F7 
    dw $E804,$0001 
    db $F7 
    dw $E805,$C3F9 
    db $FF 
    dw $E800,$C3F6 
    db $00 
    dw $A802,$01F6 
    db $13 
    dw $E806,$01F6 
    db $1B 
    dw $E807,$01F5 
    db $0D 
    dw $E814,$01FD 
    db $0D 
    dw $E815 

SamusSpritemaps_ABDF:
    dw $0009,$01ED 
    db $10 
    dw $E804,$0007 
    db $FC 
    dw $E805,$C3F7 
    db $FC 
    dw $E800,$C3F5 
    db $00 
    dw $A802,$01F5 
    db $10 
    dw $E806,$01ED 
    db $18 
    dw $E807,$01F5 
    db $18 
    dw $E814,$01F3 
    db $0D 
    dw $E815,$01FB 
    db $0D 
    dw $E816 

SamusSpritemaps_AC0E:
    dw $000A,$01E8 
    db $0E 
    dw $E804,$01F0 
    db $0E 
    dw $E805,$01E8 
    db $16 
    dw $E806,$01F0 
    db $16 
    dw $E807,$0007 
    db $FB 
    dw $E814,$0007 
    db $03 
    dw $E815,$C3F7 
    db $FB 
    dw $E800,$C3F3 
    db $FE 
    dw $A802,$01F0 
    db $0B 
    dw $E816,$01F8 
    db $0B 
    dw $E817 

SamusSpritemaps_AC42:
    dw $000A,$0007 
    db $FB 
    dw $E804,$0007 
    db $03 
    dw $E805,$C3F7 
    db $FB 
    dw $E800,$C3F3 
    db $FE 
    dw $A802,$01E5 
    db $0C 
    dw $E806,$01ED 
    db $0C 
    dw $E807,$01E5 
    db $14 
    dw $E814,$01ED 
    db $14 
    dw $E815,$01EF 
    db $0A 
    dw $E816,$01F7 
    db $0A 
    dw $E817 

SamusSpritemaps_AC76:
    dw $000A,$0004 
    db $FC 
    dw $E804,$0004 
    db $04 
    dw $E805,$C3F4 
    db $FC 
    dw $E800,$C3F2 
    db $FC 
    dw $A802,$01E2 
    db $05 
    dw $E806,$01EA 
    db $05 
    dw $E807,$01E2 
    db $0D 
    dw $E814,$01EA 
    db $0D 
    dw $E815,$01EE 
    db $02 
    dw $E816,$01EE 
    db $0A 
    dw $E817 

SamusSpritemaps_ACAA:
    dw $000A,$0004 
    db $FC 
    dw $E804,$0004 
    db $04 
    dw $E805,$C3F4 
    db $FC 
    dw $E800,$C3F2 
    db $FC 
    dw $A802,$01E1 
    db $01 
    dw $E806,$01E9 
    db $01 
    dw $E807,$01E1 
    db $09 
    dw $E814,$01E9 
    db $09 
    dw $E815,$01ED 
    db $00 
    dw $E816,$01ED 
    db $08 
    dw $E817 

SamusSpritemaps_ACDE:
    dw $0009,$C3F2 
    db $FD 
    dw $E800,$0002 
    db $FD 
    dw $E804,$0002 
    db $05 
    dw $E805,$0002 
    db $0D 
    dw $E806,$C3F1 
    db $F9 
    dw $A802,$01EA 
    db $FE 
    dw $E807,$01EA 
    db $FF 
    dw $6814,$01DC 
    db $01 
    dw $E815,$01E4 
    db $01 
    dw $E816 

SamusSpritemaps_AD0D:
    dw $0009,$C3F2 
    db $FC 
    dw $E800,$0002 
    db $FC 
    dw $E804,$0002 
    db $04 
    dw $E805,$0002 
    db $0C 
    dw $E806,$C3F1 
    db $F8 
    dw $A802,$01DC 
    db $FC 
    dw $E807,$01E4 
    db $FC 
    dw $E814,$01EA 
    db $FB 
    dw $E815,$01EA 
    db $03 
    dw $E816 

SamusSpritemaps_AD3C:
    dw $0002,$C3F8 
    db $10 
    dw $2808,$C3F8 
    db $00 
    dw $280A 

SamusSpritemaps_AD48:
    dw $0005,$C3F3 
    db $07 
    dw $2808,$C3FB 
    db $FF 
    dw $280A,$01EB 
    db $0F 
    dw $280C,$01F3 
    db $17 
    dw $280D,$0003 
    db $0F 
    dw $280E 

SamusSpritemaps_AD63:
    dw $0004,$C3F0 
    db $FF 
    dw $2808,$C200 
    db $0F 
    dw $280A,$C3F8 
    db $FF 
    dw $280C,$0008 
    db $07 
    dw $280E 

SamusSpritemaps_AD79:
    dw $0002,$C3F7 
    db $10 
    dw $2808,$C3F7 
    db $00 
    dw $280A 

SamusSpritemaps_AD85:
    dw $0006,$C3F3 
    db $07 
    dw $2808,$C3FB 
    db $FF 
    dw $280A,$01F3 
    db $FF 
    dw $280C,$01EB 
    db $0F 
    dw $280D,$01F3 
    db $17 
    dw $280E,$0003 
    db $0F 
    dw $280F 

SamusSpritemaps_ADA5:
    dw $0004,$C3EF 
    db $FF 
    dw $2808,$C3FF 
    db $0F 
    dw $280A,$C3F7 
    db $FF 
    dw $280C,$01F7 
    db $0F 
    dw $280E 

SamusSpritemaps_ADBB:
    dw $0003,$C3F1 
    db $10 
    dw $2808,$C3F9 
    db $10 
    dw $280A,$C3F9 
    db $00 
    dw $280C 

SamusSpritemaps_ADCC:
    dw $0002,$C3EF 
    db $00 
    dw $2808,$C3F7 
    db $00 
    dw $280A 

SamusSpritemaps_ADD8:
    dw $0004,$C3FB 
    db $00 
    dw $2808,$C3F3 
    db $10 
    dw $280A,$01F3 
    db $08 
    dw $280C,$0003 
    db $10 
    dw $280D 

SamusSpritemaps_ADEE:
    dw $0006,$C3FF 
    db $06 
    dw $2808,$C3F7 
    db $FE 
    dw $280A,$000F 
    db $0F 
    dw $280C,$01EF 
    db $0E 
    dw $280D,$01EF 
    db $06 
    dw $280E,$0007 
    db $16 
    dw $280F 

SamusSpritemaps_AE0E:
    dw $0004,$01FB 
    db $18 
    dw $280C,$C3FB 
    db $00 
    dw $2808,$C3F3 
    db $08 
    dw $280A,$01F3 
    db $18 
    dw $280D 

SamusSpritemaps_AE24:
    dw $0006,$C3FE 
    db $06 
    dw $2808,$C3F6 
    db $FE 
    dw $280A,$000E 
    db $0F 
    dw $280C,$0006 
    db $16 
    dw $280D,$01EE 
    db $0E 
    dw $280E,$01EE 
    db $06 
    dw $280F 

SamusSpritemaps_AE44:
    dw $0008,$01F0 
    db $08 
    dw $280C,$01F0 
    db $00 
    dw $280D,$01F4 
    db $18 
    dw $280E,$01F4 
    db $10 
    dw $280F,$01F4 
    db $08 
    dw $281C,$01F4 
    db $00 
    dw $281D,$C3FC 
    db $10 
    dw $2808,$C3FC 
    db $00 
    dw $280A 

SamusSpritemaps_AE6E:
    dw $0008,$01F0 
    db $08 
    dw $280C,$01F0 
    db $00 
    dw $280D,$01F4 
    db $18 
    dw $280E,$01F4 
    db $10 
    dw $280F,$01F4 
    db $08 
    dw $281C,$01F4 
    db $00 
    dw $281D,$C3FC 
    db $10 
    dw $2808,$C3FC 
    db $00 
    dw $280A 

SamusSpritemaps_AE98:
    dw $0003,$C3F1 
    db $10 
    dw $2808,$C3F9 
    db $10 
    dw $280A,$C3F9 
    db $00 
    dw $280C 

SamusSpritemaps_AEA9:
    dw $0003,$C3F1 
    db $10 
    dw $2808,$C3F9 
    db $10 
    dw $280A,$C3F9 
    db $00 
    dw $280C 

SamusSpritemaps_AEBA:
    dw $0003,$C3FF 
    db $10 
    dw $6808,$C3F7 
    db $10 
    dw $680A,$C3F7 
    db $00 
    dw $680C 

SamusSpritemaps_AECB:
    dw $0004,$01FB 
    db $0F 
    dw $280A,$01F3 
    db $0F 
    dw $280B,$01EB 
    db $0F 
    dw $280C,$C3F3 
    db $FF 
    dw $2808 

SamusSpritemaps_AEE1:
    dw $0004,$01FD 
    db $0F 
    dw $780A,$0005 
    db $0F 
    dw $680B,$000D 
    db $0F 
    dw $680C,$C3FD 
    db $FF 
    dw $6808 

SamusSpritemaps_AEF7:
    dw $0003,$C3FE 
    db $08 
    dw $2808,$C3F6 
    db $00 
    dw $280A,$0006 
    db $00 
    dw $280C 

SamusSpritemaps_AF08:
    dw $0003,$C3F2 
    db $08 
    dw $6808,$C3FA 
    db $00 
    dw $680A,$01F2 
    db $00 
    dw $680C 

SamusSpritemaps_AF19:
    dw $0003,$01F6 
    db $10 
    dw $680C,$C3FE 
    db $10 
    dw $6808,$C3F6 
    db $00 
    dw $680A 

SamusSpritemaps_AF2A:
    dw $0003,$0002 
    db $10 
    dw $280C,$C3F2 
    db $10 
    dw $2808,$C3FA 
    db $00 
    dw $280A 

SamusSpritemaps_AF3B:
    dw $0003,$01F1 
    db $08 
    dw $280A,$01F1 
    db $00 
    dw $280B,$C3F9 
    db $00 
    dw $2808 

SamusSpritemaps_AF4C:
    dw $0003,$0007 
    db $08 
    dw $680A,$0007 
    db $00 
    dw $680B,$C3F7 
    db $00 
    dw $6808 

SamusSpritemaps_AF5D:
    dw $0002,$C3EC 
    db $00 
    dw $2808,$C3F4 
    db $00 
    dw $280A 

SamusSpritemaps_AF69:
    dw $0002,$C204 
    db $00 
    dw $2808,$C3FC 
    db $00 
    dw $280A 

SamusSpritemaps_AF75:
    dw $0004,$01E8 
    db $10 
    dw $680C,$01E8 
    db $08 
    dw $680D,$C3F0 
    db $00 
    dw $6808,$C200 
    db $00 
    dw $680A 

SamusSpritemaps_AF8B:
    dw $0004,$0010 
    db $10 
    dw $280C,$0010 
    db $08 
    dw $280D,$C200 
    db $00 
    dw $2808,$C3F0 
    db $00 
    dw $280A 

SamusSpritemaps_AFA1:
    dw $0003,$C3FF 
    db $10 
    dw $6808,$C3F7 
    db $10 
    dw $680A,$C3F7 
    db $00 
    dw $680C 

SamusSpritemaps_AFB2:
    dw $0002,$C3F4 
    db $00 
    dw $2808,$C3FC 
    db $00 
    dw $280A 

SamusSpritemaps_AFBE:
    dw $0002,$C3FC 
    db $00 
    dw $2808,$C3F4 
    db $00 
    dw $280A 

SamusSpritemaps_AFCA:
    dw $0004,$01F0 
    db $18 
    dw $680C,$01F0 
    db $10 
    dw $680D,$C3F8 
    db $10 
    dw $6808,$C3F8 
    db $00 
    dw $680A 

SamusSpritemaps_AFE0:
    dw $0002,$C3F8 
    db $00 
    dw $2808,$C3F8 
    db $10 
    dw $280A 

SamusSpritemaps_AFEC:
    dw $0001,$C3F9 
    db $00 
    dw $2808 

SamusSpritemaps_AFF3:
    dw $0004,$01F2 
    db $18 
    dw $280C,$01F2 
    db $10 
    dw $280D,$C3FA 
    db $10 
    dw $2808,$C3FA 
    db $00 
    dw $280A 

SamusSpritemaps_B009:
    dw $0002,$C3FA 
    db $0F 
    dw $6808,$C3FA 
    db $FF 
    dw $680A 

SamusSpritemaps_B015:
    dw $0002,$C3FA 
    db $0F 
    dw $6808,$C3FA 
    db $FF 
    dw $680A 

SamusSpritemaps_B021:
    dw $0004,$01F2 
    db $15 
    dw $280C,$01F2 
    db $0D 
    dw $280D,$C3FA 
    db $0D 
    dw $2808,$C3FA 
    db $FD 
    dw $280A 

SamusSpritemaps_B037:
    dw $0004,$0006 
    db $15 
    dw $680C,$0006 
    db $0D 
    dw $680D,$C3F6 
    db $0D 
    dw $6808,$C3F6 
    db $FD 
    dw $680A 

SamusSpritemaps_B04D:
    dw $0006,$0008 
    db $10 
    dw $280A,$0008 
    db $08 
    dw $280B,$0000 
    db $10 
    dw $280C,$01F8 
    db $10 
    dw $280D,$0008 
    db $00 
    dw $280E,$C3F8 
    db $00 
    dw $2808 

SamusSpritemaps_B06D:
    dw $0006,$01F0 
    db $10 
    dw $680A,$01F0 
    db $08 
    dw $680B,$01F8 
    db $10 
    dw $680C,$0000 
    db $10 
    dw $680D,$01F0 
    db $00 
    dw $680E,$C3F8 
    db $00 
    dw $6808 

SamusSpritemaps_B08D:
    dw $0003,$0009 
    db $02 
    dw $680C,$C3F9 
    db $08 
    dw $6808,$C3F9 
    db $00 
    dw $680A 

SamusSpritemaps_B09E:
    dw $0003,$01EF 
    db $02 
    dw $280C,$C3F7 
    db $08 
    dw $2808,$C3F7 
    db $00 
    dw $280A 

SamusSpritemaps_B0AF:
    dw $0002,$C3FC 
    db $10 
    dw $6808,$C3FC 
    db $00 
    dw $680A 

SamusSpritemaps_B0BB:
    dw $0002,$C3F4 
    db $10 
    dw $2808,$C3F4 
    db $00 
    dw $280A 

SamusSpritemaps_B0C7:
    dw $0005,$0004 
    db $0F 
    dw $280A,$01F4 
    db $10 
    dw $280B,$01FC 
    db $17 
    dw $280C,$01FC 
    db $0F 
    dw $280D,$C3FC 
    db $FF 
    dw $2808 

SamusSpritemaps_B0E2:
    dw $0005,$01F4 
    db $0F 
    dw $680A,$0004 
    db $10 
    dw $680B,$01FC 
    db $17 
    dw $680C,$01FC 
    db $0F 
    dw $680D,$C3F4 
    db $FF 
    dw $6808 

SamusSpritemaps_B0FD:
    dw $0001,$01F8 
    db $F8 
    dw $2C08 

SamusSpritemaps_B104:
    dw $0006,$01FA 
    db $10 
    dw $680A,$0002 
    db $10 
    dw $680B,$01F2 
    db $10 
    dw $680C,$01F2 
    db $08 
    dw $680D,$01F2 
    db $00 
    dw $680E,$C3FA 
    db $00 
    dw $6808 

SamusSpritemaps_B124:
    dw $0006,$01FE 
    db $10 
    dw $280A,$01F6 
    db $10 
    dw $280B,$0006 
    db $10 
    dw $280C,$0006 
    db $08 
    dw $280D,$0006 
    db $00 
    dw $280E,$C3F6 
    db $00 
    dw $2808 

SamusSpritemaps_B144:
    dw $0007,$000C 
    db $01 
    dw $280A,$0004 
    db $02 
    dw $280B,$01FC 
    db $10 
    dw $280C,$01F4 
    db $10 
    dw $280D,$01F4 
    db $08 
    dw $280E,$000C 
    db $00 
    dw $280F,$C3FC 
    db $00 
    dw $2808 

SamusSpritemaps_B169:
    dw $0005,$01FC 
    db $10 
    dw $680A,$0004 
    db $10 
    dw $680B,$0004 
    db $08 
    dw $680C,$01EC 
    db $00 
    dw $680D,$C3F4 
    db $00 
    dw $6808 

SamusSpritemaps_B184:
    dw $0003,$C3F8 
    db $0F 
    dw $2808,$0008 
    db $0F 
    dw $280C,$C3F8 
    db $FF 
    dw $280A 

SamusSpritemaps_B195:
    dw $0003,$C3F8 
    db $0F 
    dw $2808,$0008 
    db $0F 
    dw $280C,$C3F8 
    db $FF 
    dw $280A 

SamusSpritemaps_B1A6:
    dw $0003,$C3F8 
    db $0F 
    dw $6808,$01F0 
    db $0F 
    dw $680C,$C3F8 
    db $FF 
    dw $680A 

SamusSpritemaps_B1B7:
    dw $0003,$C3F8 
    db $0F 
    dw $6808,$01F0 
    db $0F 
    dw $680C,$C3F8 
    db $FF 
    dw $680A 

SamusSpritemaps_B1C8:
    dw $0005,$01F6 
    db $10 
    dw $680C,$01F6 
    db $08 
    dw $680D,$01F6 
    db $00 
    dw $680E,$C3FE 
    db $08 
    dw $6808,$C3FE 
    db $00 
    dw $680A 

SamusSpritemaps_B1E3:
    dw $0005,$0002 
    db $10 
    dw $280C,$0002 
    db $08 
    dw $280D,$0002 
    db $00 
    dw $280E,$C3F2 
    db $08 
    dw $2808,$C3F2 
    db $00 
    dw $280A 

SamusSpritemaps_B1FE:
    dw $0004,$C3FD 
    db $08 
    dw $6808,$01F8 
    db $18 
    dw $680C,$01F5 
    db $10 
    dw $680D,$C3FD 
    db $00 
    dw $680A 

SamusSpritemaps_B214:
    dw $0004,$C3F3 
    db $08 
    dw $2808,$0000 
    db $18 
    dw $280C,$0003 
    db $10 
    dw $280D,$C3F3 
    db $00 
    dw $280A 

SamusSpritemaps_B22A:
    dw $0002,$C3FA 
    db $10 
    dw $6808,$C3FA 
    db $00 
    dw $680A 

SamusSpritemaps_B236:
    dw $0002,$0004 
    db $08 
    dw $280A,$C3F4 
    db $00 
    dw $2808 

SamusSpritemaps_B242:
    dw $0002,$01F4 
    db $08 
    dw $680A,$C3FC 
    db $00 
    dw $6808 

SamusSpritemaps_B24E:
    dw $0006,$C3F1 
    db $08 
    dw $7808,$C200 
    db $08 
    dw $3808,$C3F0 
    db $F8 
    dw $380A,$C200 
    db $F8 
    dw $380C,$C3F1 
    db $E8 
    dw $780E,$C200 
    db $E8 
    dw $380E 

SamusSpritemaps_B26E:
    dw $0006,$C3F1 
    db $08 
    dw $7808,$C3F1 
    db $E8 
    dw $780A,$C3F0 
    db $F8 
    dw $380C,$C200 
    db $08 
    dw $3808,$C200 
    db $F8 
    dw $380E,$C200 
    db $E8 
    dw $380A 

SamusSpritemaps_B28E:
    dw $0001,$01F8 
    db $F8 
    dw $3008 

SamusSpritemaps_B295:
    dw $0004,$01F1 
    db $18 
    dw $280C,$01F1 
    db $10 
    dw $280D,$C3F9 
    db $10 
    dw $2808,$C3F9 
    db $00 
    dw $280A 

SamusSpritemaps_B2AB:
    dw $0004,$0007 
    db $18 
    dw $680C,$0007 
    db $10 
    dw $680D,$C3F7 
    db $10 
    dw $6808,$C3F7 
    db $00 
    dw $680A 

SamusSpritemaps_B2C1:
    dw $0002,$C3F8 
    db $10 
    dw $6808,$C3F8 
    db $00 
    dw $680A 

SamusSpritemaps_B2CD:
    dw $0005,$C3FD 
    db $07 
    dw $6808,$C3F5 
    db $FF 
    dw $680A,$000D 
    db $0F 
    dw $680C,$0005 
    db $17 
    dw $680D,$01F5 
    db $0F 
    dw $680E 

SamusSpritemaps_B2E8:
    dw $0004,$C200 
    db $FF 
    dw $6808,$C3F0 
    db $0F 
    dw $680A,$C3F8 
    db $FF 
    dw $680C,$01F0 
    db $07 
    dw $680E 

SamusSpritemaps_B2FE:
    dw $0002,$C3F9 
    db $10 
    dw $6808,$C3F9 
    db $00 
    dw $680A 

SamusSpritemaps_B30A:
    dw $0006,$C3FD 
    db $07 
    dw $6808,$C3F5 
    db $FF 
    dw $680A,$0005 
    db $FF 
    dw $680C,$000D 
    db $0F 
    dw $680D,$0005 
    db $17 
    dw $680E,$01F5 
    db $0F 
    dw $680F 

SamusSpritemaps_B32A:
    dw $0004,$C201 
    db $FF 
    dw $6808,$C3F1 
    db $0F 
    dw $680A,$C3F9 
    db $FF 
    dw $680C,$0001 
    db $0F 
    dw $680E 

SamusSpritemaps_B340:
    dw $0003,$C3FF 
    db $10 
    dw $6808,$C3F7 
    db $10 
    dw $680A,$C3F7 
    db $00 
    dw $680C 

SamusSpritemaps_B351:
    dw $0002,$C201 
    db $00 
    dw $6808,$C3F9 
    db $00 
    dw $680A 

SamusSpritemaps_B35D:
    dw $0004,$C3F5 
    db $00 
    dw $6808,$C3FD 
    db $10 
    dw $680A,$0005 
    db $08 
    dw $680C,$01F5 
    db $10 
    dw $680D 

SamusSpritemaps_B373:
    dw $0006,$C3F1 
    db $06 
    dw $6808,$C3F9 
    db $FE 
    dw $680A,$01E9 
    db $0F 
    dw $680C,$0009 
    db $0E 
    dw $680D,$0009 
    db $06 
    dw $680E,$01F1 
    db $16 
    dw $680F 

SamusSpritemaps_B393:
    dw $0004,$01FD 
    db $18 
    dw $680C,$C3F5 
    db $00 
    dw $6808,$C3FD 
    db $08 
    dw $680A,$0005 
    db $18 
    dw $680D 

SamusSpritemaps_B3A9:
    dw $0006,$C3F2 
    db $06 
    dw $6808,$C3FA 
    db $FE 
    dw $680A,$01EA 
    db $0F 
    dw $680C,$01F2 
    db $16 
    dw $680D,$000A 
    db $0E 
    dw $680E,$000A 
    db $06 
    dw $680F 

SamusSpritemaps_B3C9:
    dw $0004,$0008 
    db $18 
    dw $280C,$0008 
    db $10 
    dw $280D,$C3F8 
    db $10 
    dw $2808,$C3F8 
    db $00 
    dw $280A 

SamusSpritemaps_B3DF:
    dw $0001,$01F8 
    db $F8 
    dw $3C08 

SamusSpritemaps_B3E6:
    dw $0001,$01F8 
    db $F8 
    dw $3C08 

SamusSpritemaps_B3ED:
    dw $0004,$0006 
    db $18 
    dw $680C,$0006 
    db $10 
    dw $680D,$C3F6 
    db $10 
    dw $6808,$C3F6 
    db $00 
    dw $680A 

SamusSpritemaps_B403:
    dw $0002,$C3F6 
    db $0F 
    dw $2808,$C3F6 
    db $FF 
    dw $280A 

SamusSpritemaps_B40F:
    dw $0002,$C3F6 
    db $0F 
    dw $2808,$C3F6 
    db $FF 
    dw $280A 

SamusSpritemaps_B41B:
    dw $0003,$01E8 
    db $04 
    dw $280A,$01E8 
    db $FC 
    dw $280B,$C3F0 
    db $FC 
    dw $2808 

SamusSpritemaps_B42C:
    dw $0006,$01E9 
    db $0D 
    dw $280A,$01E9 
    db $05 
    dw $280B,$01E9 
    db $FD 
    dw $280C,$01F9 
    db $0D 
    dw $280D,$01F1 
    db $0D 
    dw $280E,$C3F1 
    db $FD 
    dw $2808 

SamusSpritemaps_B44C:
    dw $0003,$C3E9 
    db $07 
    dw $2808,$01E9 
    db $FF 
    dw $280C,$C3F1 
    db $FF 
    dw $280A 

SamusSpritemaps_B45D:
    dw $0004,$01F8 
    db $10 
    dw $280A,$01F0 
    db $10 
    dw $280B,$01F0 
    db $08 
    dw $280C,$C3F8 
    db $00 
    dw $2808 

SamusSpritemaps_B473:
    dw $0005,$0003 
    db $10 
    dw $280A,$01FB 
    db $10 
    dw $280B,$01F3 
    db $10 
    dw $280C,$01F3 
    db $08 
    dw $280D,$C3FB 
    db $00 
    dw $2808 

SamusSpritemaps_B48E:
    dw $0005,$01F5 
    db $08 
    dw $280A,$0005 
    db $10 
    dw $280B,$01FD 
    db $10 
    dw $280C,$01F5 
    db $10 
    dw $280D,$C3FD 
    db $00 
    dw $2808 

SamusSpritemaps_B4A9:
    dw $0003,$0005 
    db $10 
    dw $280A,$01FD 
    db $10 
    dw $280B,$C3FD 
    db $00 
    dw $2808 

SamusSpritemaps_B4BA:
    dw $0004,$000F 
    db $0F 
    dw $280A,$0007 
    db $0F 
    dw $280B,$01FF 
    db $FF 
    dw $280C,$C207 
    db $FF 
    dw $2808 

SamusSpritemaps_B4D0:
    dw $0004,$0007 
    db $0B 
    dw $280A,$000F 
    db $0B 
    dw $280B,$000F 
    db $03 
    dw $280C,$C3FF 
    db $FB 
    dw $2808 

SamusSpritemaps_B4E6:
    dw $0005,$0008 
    db $08 
    dw $280A,$0010 
    db $F8 
    dw $280B,$0010 
    db $08 
    dw $280C,$0010 
    db $00 
    dw $280D,$C200 
    db $F8 
    dw $2808 

SamusSpritemaps_B501:
    dw $0003,$0010 
    db $08 
    dw $200C,$C210 
    db $F8 
    dw $2808,$C200 
    db $F8 
    dw $280A 

SamusSpritemaps_B512:
    dw $0002,$C3F8 
    db $10 
    dw $2808,$C3F8 
    db $00 
    dw $280A 

SamusSpritemaps_B51E:
    dw $0002,$C3F8 
    db $10 
    dw $2808,$C3F8 
    db $00 
    dw $280A 

SamusSpritemaps_B52A:
    dw $0002,$C3F0 
    db $F9 
    dw $2808,$C3E0 
    db $F9 
    dw $280A 

SamusSpritemaps_B536:
    dw $0004,$01E1 
    db $0F 
    dw $280A,$01E1 
    db $07 
    dw $280B,$01F9 
    db $FF 
    dw $280C,$C3E9 
    db $FF 
    dw $2808 

SamusSpritemaps_B54C:
    dw $0002,$C3E9 
    db $07 
    dw $2808,$C3F1 
    db $FF 
    dw $280A 

SamusSpritemaps_B558:
    dw $0002,$C3EB 
    db $0F 
    dw $2808,$C3F3 
    db $FF 
    dw $280A 

SamusSpritemaps_B564:
    dw $0004,$01F3 
    db $07 
    dw $280A,$C3F3 
    db $0F 
    dw $2808,$01FB 
    db $07 
    dw $280B,$01FB 
    db $FF 
    dw $280C 

SamusSpritemaps_B57A:
    dw $0002,$C3F9 
    db $10 
    dw $2808,$C3F9 
    db $00 
    dw $280A 

SamusSpritemaps_B586:
    dw $0002,$C3FD 
    db $0E 
    dw $2808,$C3FD 
    db $FE 
    dw $280A 

SamusSpritemaps_B592:
    dw $0002,$C207 
    db $0F 
    dw $2808,$C3FF 
    db $FF 
    dw $280A 

SamusSpritemaps_B59E:
    dw $0004,$0018 
    db $10 
    dw $280C,$0018 
    db $08 
    dw $280D,$C208 
    db $08 
    dw $2808,$C200 
    db $00 
    dw $280A 

SamusSpritemaps_B5B4:
    dw $0002,$C20F 
    db $04 
    dw $2808,$C3FF 
    db $FC 
    dw $280A 

SamusSpritemaps_B5C0:
    dw $0002,$C200 
    db $F8 
    dw $E808,$C210 
    db $F8 
    dw $E80A 

SamusSpritemaps_B5CC:
    dw $0003,$0010 
    db $F4 
    dw $E80A,$0010 
    db $FC 
    dw $E80B,$C200 
    db $F4 
    dw $E808 

SamusSpritemaps_B5DD:
    dw $0006,$000F 
    db $EB 
    dw $E80A,$000F 
    db $F3 
    dw $E80B,$000F 
    db $FB 
    dw $E80C,$01FF 
    db $EB 
    dw $E80D,$0007 
    db $EB 
    dw $E80E,$C3FF 
    db $F3 
    dw $E808 

SamusSpritemaps_B5FD:
    dw $0003,$C207 
    db $E9 
    dw $E808,$000F 
    db $F9 
    dw $E80C,$C3FF 
    db $F1 
    dw $E80A 

SamusSpritemaps_B60E:
    dw $0004,$0000 
    db $E8 
    dw $E80A,$0008 
    db $E8 
    dw $E80B,$0008 
    db $F0 
    dw $E80C,$C3F8 
    db $F0 
    dw $E808 

SamusSpritemaps_B624:
    dw $0005,$01F5 
    db $E8 
    dw $E80A,$01FD 
    db $E8 
    dw $E80B,$0005 
    db $E8 
    dw $E80C,$0005 
    db $F0 
    dw $E80D,$C3F5 
    db $F0 
    dw $E808 

SamusSpritemaps_B63F:
    dw $0005,$0003 
    db $F0 
    dw $E80A,$01F3 
    db $E8 
    dw $E80B,$01FB 
    db $E8 
    dw $E80C,$0003 
    db $E8 
    dw $E80D,$C3F3 
    db $F0 
    dw $E808 

SamusSpritemaps_B65A:
    dw $0003,$01F3 
    db $E8 
    dw $E80A,$01FB 
    db $E8 
    dw $E80B,$C3F3 
    db $F0 
    dw $E808 

SamusSpritemaps_B66B:
    dw $0004,$01E9 
    db $E9 
    dw $E80A,$01F1 
    db $E9 
    dw $E80B,$01F9 
    db $F9 
    dw $E80C,$C3E9 
    db $F1 
    dw $E808 

SamusSpritemaps_B681:
    dw $0004,$01F1 
    db $ED 
    dw $E80A,$01E9 
    db $ED 
    dw $E80B,$01E9 
    db $F5 
    dw $E80C,$C3F1 
    db $F5 
    dw $E808 

SamusSpritemaps_B697:
    dw $0005,$01F0 
    db $F0 
    dw $E80A,$01E8 
    db $00 
    dw $E80B,$01E8 
    db $F0 
    dw $E80C,$01E8 
    db $F8 
    dw $E80D,$C3F0 
    db $F8 
    dw $E808 

SamusSpritemaps_B6B2:
    dw $0003,$01E8 
    db $F0 
    dw $E80C,$C3E0 
    db $F8 
    dw $E808,$C3F0 
    db $F8 
    dw $E80A 

SamusSpritemaps_B6C3:
    dw $0002,$C3F8 
    db $E0 
    dw $E808,$C3F8 
    db $F0 
    dw $E80A 

SamusSpritemaps_B6CF:
    dw $0002,$C3F8 
    db $E0 
    dw $E808,$C3F8 
    db $F0 
    dw $E80A 

SamusSpritemaps_B6DB:
    dw $0002,$C200 
    db $F7 
    dw $E808,$C210 
    db $F7 
    dw $E80A 

SamusSpritemaps_B6E7:
    dw $0004,$0017 
    db $E9 
    dw $E80A,$0017 
    db $F1 
    dw $E80B,$01FF 
    db $F9 
    dw $E80C,$C207 
    db $F1 
    dw $E808 

SamusSpritemaps_B6FD:
    dw $0002,$C207 
    db $E9 
    dw $E808,$C3FF 
    db $F1 
    dw $E80A 

SamusSpritemaps_B709:
    dw $0002,$C205 
    db $E1 
    dw $E808,$C3FD 
    db $F1 
    dw $E80A 

SamusSpritemaps_B715:
    dw $0004,$0005 
    db $F1 
    dw $E80A,$C3FD 
    db $E1 
    dw $E808,$01FD 
    db $F1 
    dw $E80B,$01FD 
    db $F9 
    dw $E80C 

SamusSpritemaps_B72B:
    dw $0002,$C3F7 
    db $E0 
    dw $E808,$C3F7 
    db $F0 
    dw $E80A 

SamusSpritemaps_B737:
    dw $0002,$C3F3 
    db $E2 
    dw $E808,$C3F3 
    db $F2 
    dw $E80A 

SamusSpritemaps_B743:
    dw $0002,$C3E9 
    db $E1 
    dw $E808,$C3F1 
    db $F1 
    dw $E80A 

SamusSpritemaps_B74F:
    dw $0002,$C3E1 
    db $EC 
    dw $E808,$C3F1 
    db $F4 
    dw $E80A 

SamusSpritemaps_B75B:
    dw $0002,$C3F0 
    db $F8 
    dw $2808,$C3E0 
    db $F8 
    dw $280A 

SamusSpritemaps_B767:
    dw $0003,$0010 
    db $04 
    dw $680A,$0010 
    db $FC 
    dw $680B,$C200 
    db $FC 
    dw $6808 

SamusSpritemaps_B778:
    dw $0006,$000F 
    db $0D 
    dw $680A,$000F 
    db $05 
    dw $680B,$000F 
    db $FD 
    dw $680C,$01FF 
    db $0D 
    dw $680D,$0007 
    db $0D 
    dw $680E,$C3FF 
    db $FD 
    dw $6808 

SamusSpritemaps_B798:
    dw $0003,$C207 
    db $07 
    dw $6808,$000F 
    db $FF 
    dw $680C,$C3FF 
    db $FF 
    dw $680A 

SamusSpritemaps_B7A9:
    dw $0004,$0000 
    db $10 
    dw $680A,$0008 
    db $10 
    dw $680B,$0008 
    db $08 
    dw $680C,$C3F8 
    db $00 
    dw $6808 

SamusSpritemaps_B7BF:
    dw $0005,$01F5 
    db $10 
    dw $680A,$01FD 
    db $10 
    dw $680B,$0005 
    db $10 
    dw $680C,$0005 
    db $08 
    dw $680D,$C3F5 
    db $00 
    dw $6808 

SamusSpritemaps_B7DA:
    dw $0005,$0003 
    db $08 
    dw $680A,$01F3 
    db $10 
    dw $680B,$01FB 
    db $10 
    dw $680C,$0003 
    db $10 
    dw $680D,$C3F3 
    db $00 
    dw $6808 

SamusSpritemaps_B7F5:
    dw $0003,$01F3 
    db $10 
    dw $680A,$01FB 
    db $10 
    dw $680B,$C3F3 
    db $00 
    dw $6808 

SamusSpritemaps_B806:
    dw $0004,$01E9 
    db $0F 
    dw $680A,$01F1 
    db $0F 
    dw $680B,$01F9 
    db $FF 
    dw $680C,$C3E9 
    db $FF 
    dw $6808 

SamusSpritemaps_B81C:
    dw $0004,$01F1 
    db $0B 
    dw $680A,$01E9 
    db $0B 
    dw $680B,$01E9 
    db $03 
    dw $680C,$C3F1 
    db $FB 
    dw $6808 

SamusSpritemaps_B832:
    dw $0005,$01F0 
    db $08 
    dw $680A,$01E8 
    db $F8 
    dw $680B,$01E8 
    db $08 
    dw $680C,$01E8 
    db $00 
    dw $680D,$C3F0 
    db $F8 
    dw $6808 

SamusSpritemaps_B84D:
    dw $0003,$01E8 
    db $08 
    dw $600C,$C3E0 
    db $F8 
    dw $6808,$C3F0 
    db $F8 
    dw $680A 

SamusSpritemaps_B85E:
    dw $0002,$C3F8 
    db $10 
    dw $6808,$C3F8 
    db $00 
    dw $680A 

SamusSpritemaps_B86A:
    dw $0002,$C3F8 
    db $10 
    dw $6808,$C3F8 
    db $00 
    dw $680A 

SamusSpritemaps_B876:
    dw $0002,$C200 
    db $F9 
    dw $6808,$C210 
    db $F9 
    dw $680A 

SamusSpritemaps_B882:
    dw $0004,$0017 
    db $0F 
    dw $680A,$0017 
    db $07 
    dw $680B,$01FF 
    db $FF 
    dw $680C,$C207 
    db $FF 
    dw $6808 

SamusSpritemaps_B898:
    dw $0002,$C207 
    db $07 
    dw $6808,$C3FF 
    db $FF 
    dw $680A 

SamusSpritemaps_B8A4:
    dw $0002,$C205 
    db $0F 
    dw $6808,$C3FD 
    db $FF 
    dw $680A 

SamusSpritemaps_B8B0:
    dw $0004,$0005 
    db $07 
    dw $680A,$C3FD 
    db $0F 
    dw $6808,$01FD 
    db $07 
    dw $680B,$01FD 
    db $FF 
    dw $680C 

SamusSpritemaps_B8C6:
    dw $0002,$C3F7 
    db $10 
    dw $6808,$C3F7 
    db $00 
    dw $680A 

SamusSpritemaps_B8D2:
    dw $0002,$C3F3 
    db $0E 
    dw $6808,$C3F3 
    db $FE 
    dw $680A 

SamusSpritemaps_B8DE:
    dw $0002,$C3E9 
    db $0F 
    dw $6808,$C3F1 
    db $FF 
    dw $680A 

SamusSpritemaps_B8EA:
    dw $0004,$01E0 
    db $10 
    dw $680C,$01E0 
    db $08 
    dw $680D,$C3E8 
    db $08 
    dw $6808,$C3F0 
    db $00 
    dw $680A 

SamusSpritemaps_B900:
    dw $0002,$C3E1 
    db $04 
    dw $6808,$C3F1 
    db $FC 
    dw $680A 

SamusSpritemaps_B90C:
    dw $0002,$C3F0 
    db $F8 
    dw $A808,$C3E0 
    db $F8 
    dw $A80A 

SamusSpritemaps_B918:
    dw $0003,$01E8 
    db $F4 
    dw $A80A,$01E8 
    db $FC 
    dw $A80B,$C3F0 
    db $F4 
    dw $A808 

SamusSpritemaps_B929:
    dw $0006,$01E9 
    db $EB 
    dw $A80A,$01E9 
    db $F3 
    dw $A80B,$01E9 
    db $FB 
    dw $A80C,$01F9 
    db $EB 
    dw $A80D,$01F1 
    db $EB 
    dw $A80E,$C3F1 
    db $F3 
    dw $A808 

SamusSpritemaps_B949:
    dw $0003,$C3E9 
    db $E9 
    dw $A808,$01E9 
    db $F9 
    dw $A80C,$C3F1 
    db $F1 
    dw $A80A 

SamusSpritemaps_B95A:
    dw $0004,$01F8 
    db $E8 
    dw $A80A,$01F0 
    db $E8 
    dw $A80B,$01F0 
    db $F0 
    dw $A80C,$C3F8 
    db $F0 
    dw $A808 

SamusSpritemaps_B970:
    dw $0005,$0003 
    db $E8 
    dw $A80A,$01FB 
    db $E8 
    dw $A80B,$01F3 
    db $E8 
    dw $A80C,$01F3 
    db $F0 
    dw $A80D,$C3FB 
    db $F0 
    dw $A808 

SamusSpritemaps_B98B:
    dw $0005,$01F5 
    db $F0 
    dw $A80A,$0005 
    db $E8 
    dw $A80B,$01FD 
    db $E8 
    dw $A80C,$01F5 
    db $E8 
    dw $A80D,$C3FD 
    db $F0 
    dw $A808 

SamusSpritemaps_B9A6:
    dw $0003,$0005 
    db $E8 
    dw $A80A,$01FD 
    db $E8 
    dw $A80B,$C3FD 
    db $F0 
    dw $A808 

SamusSpritemaps_B9B7:
    dw $0004,$000F 
    db $E9 
    dw $A80A,$0007 
    db $E9 
    dw $A80B,$01FF 
    db $F9 
    dw $A80C,$C207 
    db $F1 
    dw $A808 

SamusSpritemaps_B9CD:
    dw $0004,$0007 
    db $ED 
    dw $A80A,$000F 
    db $ED 
    dw $A80B,$000F 
    db $F5 
    dw $A80C,$C3FF 
    db $F5 
    dw $A808 

SamusSpritemaps_B9E3:
    dw $0005,$0008 
    db $F0 
    dw $A80A,$0010 
    db $00 
    dw $A80B,$0010 
    db $F0 
    dw $A80C,$0010 
    db $F8 
    dw $A80D,$C200 
    db $F8 
    dw $A808 

SamusSpritemaps_B9FE:
    dw $0003,$0010 
    db $F0 
    dw $A80C,$C210 
    db $F8 
    dw $A808,$C200 
    db $F8 
    dw $A80A 

SamusSpritemaps_BA0F:
    dw $0002,$C3F8 
    db $E0 
    dw $A808,$C3F8 
    db $F0 
    dw $A80A 

SamusSpritemaps_BA1B:
    dw $0002,$C3F8 
    db $E0 
    dw $A808,$C3F8 
    db $F0 
    dw $A80A 

SamusSpritemaps_BA27:
    dw $0002,$C3F0 
    db $F7 
    dw $A808,$C3E0 
    db $F7 
    dw $A80A 

SamusSpritemaps_BA33:
    dw $0004,$01E1 
    db $E9 
    dw $A80A,$01E1 
    db $F1 
    dw $A80B,$01F9 
    db $F9 
    dw $A80C,$C3E9 
    db $F1 
    dw $A808 

SamusSpritemaps_BA49:
    dw $0002,$C3E9 
    db $E9 
    dw $A808,$C3F1 
    db $F1 
    dw $A80A 

SamusSpritemaps_BA55:
    dw $0002,$C3EB 
    db $E1 
    dw $A808,$C3F3 
    db $F1 
    dw $A80A 

SamusSpritemaps_BA61:
    dw $0004,$01F3 
    db $F1 
    dw $A80A,$C3F3 
    db $E1 
    dw $A808,$01FB 
    db $F1 
    dw $A80B,$01FB 
    db $F9 
    dw $A80C 

SamusSpritemaps_BA77:
    dw $0002,$C3F9 
    db $E0 
    dw $A808,$C3F9 
    db $F0 
    dw $A80A 

SamusSpritemaps_BA83:
    dw $0002,$C3FD 
    db $E2 
    dw $A808,$C3FD 
    db $F2 
    dw $A80A 

SamusSpritemaps_BA8F:
    dw $0002,$C207 
    db $E1 
    dw $A808,$C3FF 
    db $F1 
    dw $A80A 

SamusSpritemaps_BA9B:
    dw $0002,$C20F 
    db $EC 
    dw $A808,$C3FF 
    db $F4 
    dw $A80A 

SamusSpritemaps_BAA7:
    dw $0002,$C200 
    db $F8 
    dw $6808,$C210 
    db $F8 
    dw $680A 

SamusSpritemaps_BAB3:
    dw $0002,$01F8 
    db $F8 
    dw $2802,$C3F8 
    db $F8 
    dw $2800 

SamusSpritemaps_BABF:
    dw $0002,$01F8 
    db $F8 
    dw $2802,$C3F8 
    db $F8 
    dw $6800 

SamusSpritemaps_BACB:
    dw $0002,$01F8 
    db $F8 
    dw $2802,$C3F8 
    db $F8 
    dw $E800 

SamusSpritemaps_BAD7:
    dw $0002,$01F8 
    db $F8 
    dw $2802,$C3F8 
    db $F8 
    dw $A800 

SamusSpritemaps_BAE3:
    dw $0005,$01F8 
    db $F8 
    dw $2800,$0000 
    db $FF 
    dw $2801,$01F8 
    db $FF 
    dw $2802,$0000 
    db $F7 
    dw $2803,$01F8 
    db $F7 
    dw $2804 

SamusSpritemaps_BAFE:
    dw $0002,$01F8 
    db $F8 
    dw $2802,$C3F8 
    db $F9 
    dw $2800 

SamusSpritemaps_BB0A:
    dw $0002,$01F8 
    db $F8 
    dw $2802,$C3F8 
    db $F7 
    dw $A800 

SamusSpritemaps_BB16:
    dw $0002,$01F8 
    db $F8 
    dw $2802,$C3F8 
    db $F9 
    dw $6800 

SamusSpritemaps_BB22:
    dw $0002,$C3F8 
    db $00 
    dw $2800,$C3F8 
    db $F0 
    dw $2802 

SamusSpritemaps_BB2E:
    dw $0004,$C200 
    db $F1 
    dw $2800,$C3F0 
    db $01 
    dw $2802,$C200 
    db $01 
    dw $2804,$C3F0 
    db $F1 
    dw $2806 

SamusSpritemaps_BB44:
    dw $0002,$C200 
    db $F8 
    dw $2800,$C3F0 
    db $F8 
    dw $2802 

SamusSpritemaps_BB50:
    dw $0004,$C201 
    db $01 
    dw $E800,$C3F1 
    db $F1 
    dw $E802,$C3F1 
    db $01 
    dw $E804,$C201 
    db $F1 
    dw $E806 

SamusSpritemaps_BB66:
    dw $0002,$C3F8 
    db $F0 
    dw $E800,$C3F8 
    db $00 
    dw $E802 

SamusSpritemaps_BB72:
    dw $0004,$C3F1 
    db $FF 
    dw $E800,$C201 
    db $EF 
    dw $E802,$C201 
    db $FF 
    dw $E804,$C3F1 
    db $EF 
    dw $E806 

SamusSpritemaps_BB88:
    dw $0002,$C3F0 
    db $F8 
    dw $E800,$C200 
    db $F8 
    dw $E802 

SamusSpritemaps_BB94:
    dw $0004,$C3EF 
    db $EE 
    dw $2800,$C3FF 
    db $FE 
    dw $2802,$C3EF 
    db $FE 
    dw $2804,$C3FF 
    db $EE 
    dw $2806 

SamusSpritemaps_BBAA:
    dw $000A,$01F8 
    db $0A 
    dw $2800,$01F0 
    db $0A 
    dw $2801,$000A 
    db $00 
    dw $2802,$01EE 
    db $00 
    dw $2803,$000A 
    db $F6 
    dw $2804,$01EE 
    db $F8 
    dw $2805,$000A 
    db $EE 
    dw $2806,$0000 
    db $EE 
    dw $2807,$01F8 
    db $EE 
    dw $2810,$01EE 
    db $F0 
    dw $2811 

SamusSpritemaps_BBDE:
    dw $000B,$0000 
    db $08 
    dw $2800,$01F8 
    db $08 
    dw $2801,$01F0 
    db $08 
    dw $2802,$0008 
    db $00 
    dw $2803,$01F0 
    db $00 
    dw $2804,$0008 
    db $F8 
    dw $2805,$01F0 
    db $F6 
    dw $2806,$0008 
    db $F0 
    dw $2807,$0000 
    db $F0 
    dw $2810,$01F8 
    db $EE 
    dw $2811,$01F0 
    db $EE 
    dw $2812 

SamusSpritemaps_BC17:
    dw $000B,$000A 
    db $08 
    dw $2800,$0002 
    db $08 
    dw $2801,$01F8 
    db $08 
    dw $2802,$01F0 
    db $08 
    dw $2803,$000A 
    db $00 
    dw $2804,$01EE 
    db $00 
    dw $2805,$000A 
    db $F6 
    dw $2806,$01EE 
    db $F8 
    dw $2807,$000A 
    db $EE 
    dw $2810,$01F8 
    db $EE 
    dw $2811,$01F0 
    db $EE 
    dw $2812 

SamusSpritemaps_BC50:
    dw $0008,$0008 
    db $08 
    dw $2800,$0000 
    db $08 
    dw $2801,$01F8 
    db $08 
    dw $2802,$01F0 
    db $08 
    dw $2803,$0008 
    db $00 
    dw $2804,$0008 
    db $F0 
    dw $2805,$0000 
    db $F0 
    dw $2806,$01F0 
    db $F0 
    dw $2807 

SamusSpritemaps_BC7A:
    dw $0001,$01F8 
    db $F8 
    dw $1000 

SamusSpritemaps_BC81:
    dw $0001,$01F8 
    db $F8 
    dw $3800 

SamusSpritemaps_BC88:
    dw $0002,$0007 
    db $FC 
    dw $2802,$C3F7 
    db $F9 
    dw $2800 

SamusSpritemaps_BC94:
    dw $0002,$01FD 
    db $07 
    dw $2802,$C3F8 
    db $F7 
    dw $2800 

SamusSpritemaps_BCA0:
    dw $0003,$0000 
    db $05 
    dw $2802,$01F8 
    db $05 
    dw $2803,$C3F8 
    db $F5 
    dw $2800 

SamusSpritemaps_BCB1:
    dw $0005,$0000 
    db $0A 
    dw $2802,$01F8 
    db $0A 
    dw $2803,$0000 
    db $02 
    dw $2804,$01F8 
    db $02 
    dw $2805,$C3F8 
    db $F2 
    dw $2800 

SamusSpritemaps_BCCC:
    dw $0003,$01F8 
    db $05 
    dw $6802,$0000 
    db $05 
    dw $6803,$C3F8 
    db $F5 
    dw $6800 

SamusSpritemaps_BCDD:
    dw $0005,$01F8 
    db $0A 
    dw $6802,$0000 
    db $0A 
    dw $6803,$01F8 
    db $02 
    dw $6804,$0000 
    db $02 
    dw $6805,$C3F8 
    db $F2 
    dw $6800 

SamusSpritemaps_BCF8:
    dw $0002,$01F8 
    db $F8 
    dw $6802,$C3F8 
    db $F8 
    dw $6800 

SamusSpritemaps_BD04:
    dw $0002,$01F8 
    db $F8 
    dw $6802,$C3F8 
    db $F8 
    dw $2800 

SamusSpritemaps_BD10:
    dw $0002,$01F8 
    db $F8 
    dw $6802,$C3F8 
    db $F8 
    dw $A800 

SamusSpritemaps_BD1C:
    dw $0002,$01F8 
    db $F8 
    dw $6802,$C3F8 
    db $F8 
    dw $E800 

SamusSpritemaps_BD28:
    dw $0005,$01F8 
    db $F8 
    dw $6800,$01F8 
    db $FF 
    dw $6801,$0000 
    db $FF 
    dw $6802,$01F8 
    db $F7 
    dw $6803,$0000 
    db $F7 
    dw $6804 

SamusSpritemaps_BD43:
    dw $0002,$01F8 
    db $F8 
    dw $6802,$C3F8 
    db $F9 
    dw $6800 

SamusSpritemaps_BD4F:
    dw $0002,$01F8 
    db $F8 
    dw $6802,$C3F8 
    db $F7 
    dw $E800 

SamusSpritemaps_BD5B:
    dw $0002,$01F8 
    db $F8 
    dw $6802,$C3F8 
    db $F9 
    dw $2800 

SamusSpritemaps_BD67:
    dw $0002,$C3F8 
    db $00 
    dw $6800,$C3F8 
    db $F0 
    dw $6802 

SamusSpritemaps_BD73:
    dw $0004,$C3F0 
    db $F1 
    dw $6800,$C200 
    db $01 
    dw $6802,$C3F0 
    db $01 
    dw $6804,$C200 
    db $F1 
    dw $6806 

SamusSpritemaps_BD89:
    dw $0002,$C3F0 
    db $F8 
    dw $6800,$C200 
    db $F8 
    dw $6802 

SamusSpritemaps_BD95:
    dw $0004,$C3EF 
    db $01 
    dw $A800,$C3FF 
    db $F1 
    dw $A802,$C3FF 
    db $01 
    dw $A804,$C3EF 
    db $F1 
    dw $A806 

SamusSpritemaps_BDAB:
    dw $0002,$C3F8 
    db $F0 
    dw $A800,$C3F8 
    db $00 
    dw $A802 

SamusSpritemaps_BDB7:
    dw $0004,$C3FF 
    db $FF 
    dw $A800,$C3EF 
    db $EF 
    dw $A802,$C3EF 
    db $FF 
    dw $A804,$C3FF 
    db $EF 
    dw $A806 

SamusSpritemaps_BDCD:
    dw $0002,$C200 
    db $F8 
    dw $A800,$C3F0 
    db $F8 
    dw $A802 

SamusSpritemaps_BDD9:
    dw $0004,$C201 
    db $EE 
    dw $6800,$C3F1 
    db $FE 
    dw $6802,$C201 
    db $FE 
    dw $6804,$C3F1 
    db $EE 
    dw $6806 

SamusSpritemaps_BDEF:
    dw $000A,$0000 
    db $0A 
    dw $6800,$0008 
    db $0A 
    dw $6801,$01EE 
    db $00 
    dw $6802,$000A 
    db $00 
    dw $6803,$01EE 
    db $F6 
    dw $6804,$000A 
    db $F8 
    dw $6805,$01EE 
    db $EE 
    dw $6806,$01F8 
    db $EE 
    dw $6807,$0000 
    db $EE 
    dw $6810,$000A 
    db $F0 
    dw $6811 

SamusSpritemaps_BE23:
    dw $000B,$01F8 
    db $08 
    dw $6800,$0000 
    db $08 
    dw $6801,$0008 
    db $08 
    dw $6802,$01F0 
    db $00 
    dw $6803,$0008 
    db $00 
    dw $6804,$01F0 
    db $F8 
    dw $6805,$0008 
    db $F6 
    dw $6806,$01F0 
    db $F0 
    dw $6807,$01F8 
    db $F0 
    dw $6810,$0000 
    db $EE 
    dw $6811,$0008 
    db $EE 
    dw $6812 

SamusSpritemaps_BE5C:
    dw $000B,$01EE 
    db $08 
    dw $6800,$01F6 
    db $08 
    dw $6801,$0000 
    db $08 
    dw $6802,$0008 
    db $08 
    dw $6803,$01EE 
    db $00 
    dw $6804,$000A 
    db $00 
    dw $6805,$01EE 
    db $F6 
    dw $6806,$000A 
    db $F8 
    dw $6807,$01EE 
    db $EE 
    dw $6810,$0000 
    db $EE 
    dw $6811,$0008 
    db $EE 
    dw $6812 

SamusSpritemaps_BE95:
    dw $0008,$01F0 
    db $08 
    dw $6800,$01F8 
    db $08 
    dw $6801,$0000 
    db $08 
    dw $6802,$0008 
    db $08 
    dw $6803,$01F0 
    db $00 
    dw $6804,$01F0 
    db $F0 
    dw $6805,$01F8 
    db $F0 
    dw $6806,$0008 
    db $F0 
    dw $6807 

SamusSpritemaps_BEBF:
    dw $0001,$01F8 
    db $F8 
    dw $3000 

SamusSpritemaps_BEC6:
    dw $0002,$C200 
    db $00 
    dw $E808,$C3F0 
    db $F0 
    dw $2808 

SamusSpritemaps_BED2:
    dw $0004,$C3F0 
    db $F0 
    dw $2808,$C200 
    db $F0 
    dw $680A,$C200 
    db $00 
    dw $E808,$C3F0 
    db $00 
    dw $A80A 

SamusSpritemaps_BEE8:
    dw $0002,$C3F0 
    db $00 
    dw $E808,$C200 
    db $F0 
    dw $2808 

SamusSpritemaps_BEF4:
    dw $0004,$C200 
    db $00 
    dw $6808,$C3F0 
    db $F0 
    dw $A808,$C3F0 
    db $00 
    dw $A80A,$C200 
    db $F0 
    dw $680A 

SamusSpritemaps_BF0A:
    dw $0002,$C200 
    db $00 
    dw $E808,$C3F0 
    db $F0 
    dw $2808 

SamusSpritemaps_BF16:
    dw $0004,$C200 
    db $F0 
    dw $6808,$C3F0 
    db $00 
    dw $A808,$C3F0 
    db $F0 
    dw $280A,$C200 
    db $00 
    dw $E80A 

SamusSpritemaps_BF2C:
    dw $0002,$C3F0 
    db $00 
    dw $E808,$C200 
    db $F0 
    dw $2808 

SamusSpritemaps_BF38:
    dw $0004,$C3F0 
    db $00 
    dw $A808,$C200 
    db $F0 
    dw $6808,$C200 
    db $00 
    dw $680A,$C3F0 
    db $F0 
    dw $A80A 

SamusSpritemaps_BF4E:
    dw $0004,$C200 
    db $00 
    dw $E808,$C3F0 
    db $F0 
    dw $2808,$C3F0 
    db $00 
    dw $A808,$C200 
    db $F0 
    dw $6808 

SamusSpritemaps_BF64:
    dw $0004,$C3F0 
    db $00 
    dw $A808,$C200 
    db $F0 
    dw $6808,$C200 
    db $00 
    dw $E80A,$C3F0 
    db $F0 
    dw $280A 

SamusSpritemaps_BF7A:
    dw $0004,$C3F0 
    db $00 
    dw $A808,$C200 
    db $F0 
    dw $6808,$C200 
    db $00 
    dw $E808,$C3F0 
    db $F0 
    dw $2808 

SamusSpritemaps_BF90:
    dw $0004,$C200 
    db $00 
    dw $E808,$C3F0 
    db $F0 
    dw $2808,$C200 
    db $F0 
    dw $680A,$C3F0 
    db $00 
    dw $A80A 

SamusSpritemaps_BFA6:
    dw $0004,$C200 
    db $00 
    dw $E808,$C3F0 
    db $F0 
    dw $2808,$C200 
    db $F0 
    dw $6808,$C3F0 
    db $00 
    dw $A808 

SamusSpritemaps_BFBC:
    dw $0004,$C200 
    db $F0 
    dw $6808,$C3F0 
    db $00 
    dw $A808,$C200 
    db $00 
    dw $E80A,$C3F0 
    db $F0 
    dw $280A 

SamusSpritemaps_BFD2:
    dw $0004,$C3F0 
    db $00 
    dw $A808,$C200 
    db $F0 
    dw $6808,$C3F0 
    db $F0 
    dw $2808,$C200 
    db $00 
    dw $E808 

SamusSpritemaps_BFE8:
    dw $0004,$C200 
    db $00 
    dw $E808,$C3F0 
    db $F0 
    dw $2808,$C200 
    db $F0 
    dw $680A,$C3F0 
    db $00 
    dw $A80A 

SamusSpritemaps_BFFE:
    dw $0004,$C3F0 
    db $F0 
    dw $2808,$C200 
    db $00 
    dw $E808,$C3F0 
    db $00 
    dw $A80A,$C200 
    db $F0 
    dw $680A 

SamusSpritemaps_C014:
    dw $0002,$C3F0 
    db $00 
    dw $A808,$C200 
    db $F0 
    dw $6808 

SamusSpritemaps_C020:
    dw $0004,$C200 
    db $F0 
    dw $6808,$C3F0 
    db $F0 
    dw $280A,$C3F0 
    db $00 
    dw $A808,$C200 
    db $00 
    dw $E80A 

SamusSpritemaps_C036:
    dw $0002,$C200 
    db $00 
    dw $A808,$C3F0 
    db $F0 
    dw $6808 

SamusSpritemaps_C042:
    dw $0004,$C3F0 
    db $00 
    dw $2808,$C200 
    db $F0 
    dw $E808,$C200 
    db $00 
    dw $E80A,$C3F0 
    db $F0 
    dw $280A 

SamusSpritemaps_C058:
    dw $0002,$C3F0 
    db $00 
    dw $A808,$C200 
    db $F0 
    dw $6808 

SamusSpritemaps_C064:
    dw $0004,$C3F0 
    db $F0 
    dw $2808,$C200 
    db $00 
    dw $E808,$C200 
    db $F0 
    dw $680A,$C3F0 
    db $00 
    dw $A80A 

SamusSpritemaps_C07A:
    dw $0002,$C200 
    db $00 
    dw $A808,$C3F0 
    db $F0 
    dw $6808 

SamusSpritemaps_C086:
    dw $0004,$C200 
    db $00 
    dw $E808,$C3F0 
    db $F0 
    dw $2808,$C3F0 
    db $00 
    dw $280A,$C200 
    db $F0 
    dw $E80A 

SamusSpritemaps_C09C:
    dw $0004,$C3F0 
    db $00 
    dw $A808,$C200 
    db $F0 
    dw $6808,$C200 
    db $00 
    dw $E808,$C3F0 
    db $F0 
    dw $2808 

SamusSpritemaps_C0B2:
    dw $0004,$C200 
    db $00 
    dw $E808,$C3F0 
    db $F0 
    dw $2808,$C3F0 
    db $00 
    dw $A80A,$C200 
    db $F0 
    dw $680A 

SamusSpritemaps_C0C8:
    dw $0004,$C200 
    db $00 
    dw $E808,$C3F0 
    db $F0 
    dw $2808,$C3F0 
    db $00 
    dw $A808,$C200 
    db $F0 
    dw $6808 

SamusSpritemaps_C0DE:
    dw $0004,$C3F0 
    db $00 
    dw $A808,$C200 
    db $F0 
    dw $6808,$C3F0 
    db $F0 
    dw $280A,$C200 
    db $00 
    dw $E80A 

SamusSpritemaps_C0F4:
    dw $0004,$C3F0 
    db $00 
    dw $A808,$C200 
    db $F0 
    dw $6808,$C3F0 
    db $F0 
    dw $2808,$C200 
    db $00 
    dw $E808 

SamusSpritemaps_C10A:
    dw $0004,$C3F0 
    db $F0 
    dw $2808,$C200 
    db $00 
    dw $E808,$C3F0 
    db $00 
    dw $A80A,$C200 
    db $F0 
    dw $680A 

SamusSpritemaps_C120:
    dw $0004,$C200 
    db $00 
    dw $E808,$C3F0 
    db $F0 
    dw $2808,$C200 
    db $F0 
    dw $6808,$C3F0 
    db $00 
    dw $A808 

SamusSpritemaps_C136:
    dw $0004,$C3F0 
    db $00 
    dw $A808,$C200 
    db $F0 
    dw $6808,$C3F0 
    db $F0 
    dw $280A,$C200 
    db $00 
    dw $E80A 

SamusSpritemaps_C14C:
    dw $0004,$C3F0 
    db $F0 
    dw $2808,$C200 
    db $00 
    dw $E808,$C3F0 
    db $00 
    dw $A80A,$C200 
    db $F0 
    dw $680A 

SamusSpritemaps_C162:
    dw $0005,$0000 
    db $F8 
    dw $2806,$01F8 
    db $F8 
    dw $2807,$C3F8 
    db $08 
    dw $6800,$C3F8 
    db $F8 
    dw $6802,$C3F8 
    db $E8 
    dw $2804 

SamusSpritemaps_C17D:
    dw $0005,$0000 
    db $F8 
    dw $2806,$01F8 
    db $F8 
    dw $2807,$C3F8 
    db $08 
    dw $2800,$C3F8 
    db $F8 
    dw $2802,$C3F8 
    db $E8 
    dw $2804 

SamusSpritemaps_C198:
    dw $0007,$C3F8 
    db $EC 
    dw $2C00,$0000 
    db $0C 
    dw $2C02,$01F8 
    db $0C 
    dw $2C03,$0000 
    db $04 
    dw $2C04,$01F8 
    db $04 
    dw $2C05,$0000 
    db $FC 
    dw $2C06,$01F8 
    db $FC 
    dw $2C07 

SamusSpritemaps_C1BD:
    dw $0007,$C3F8 
    db $EB 
    dw $2C00,$0000 
    db $0B 
    dw $2C02,$01F8 
    db $0B 
    dw $2C03,$0000 
    db $03 
    dw $2C04,$01F8 
    db $03 
    dw $2C05,$0000 
    db $FB 
    dw $2C06,$01F8 
    db $FB 
    dw $2C07 

SamusSpritemaps_C1E2:
    dw $0007,$C3F8 
    db $EA 
    dw $2C00,$0000 
    db $0A 
    dw $2C02,$01F8 
    db $0A 
    dw $2C03,$0000 
    db $02 
    dw $2C04,$01F8 
    db $02 
    dw $2C05,$0000 
    db $FA 
    dw $2C06,$01F8 
    db $FA 
    dw $2C07 

SamusSpritemaps_C207:
    dw $0007,$C3F8 
    db $EC 
    dw $6C00,$01F8 
    db $0C 
    dw $6C02,$0000 
    db $0C 
    dw $6C03,$01F8 
    db $04 
    dw $6C04,$0000 
    db $04 
    dw $6C05,$01F8 
    db $FC 
    dw $6C06,$0000 
    db $FC 
    dw $6C07 

SamusSpritemaps_C22C:
    dw $0007,$C3F8 
    db $EB 
    dw $6C00,$01F8 
    db $0B 
    dw $6C02,$0000 
    db $0B 
    dw $6C03,$01F8 
    db $03 
    dw $6C04,$0000 
    db $03 
    dw $6C05,$01F8 
    db $FB 
    dw $6C06,$0000 
    db $FB 
    dw $6C07 

SamusSpritemaps_C251:
    dw $0007,$C3F8 
    db $EA 
    dw $6C00,$01F8 
    db $0A 
    dw $6C02,$0000 
    db $0A 
    dw $6C03,$01F8 
    db $02 
    dw $6C04,$0000 
    db $02 
    dw $6C05,$01F8 
    db $FA 
    dw $6C06,$0000 
    db $FA 
    dw $6C07 

SamusSpritemaps_C276:
    dw $0004,$C200 
    db $00 
    dw $FC08,$C3F0 
    db $00 
    dw $BC08,$C200 
    db $F0 
    dw $7C08,$C3F0 
    db $F0 
    dw $3C08 

SamusSpritemaps_C28C:
    dw $0010,$C200 
    db $00 
    dw $FC08,$C210 
    db $00 
    dw $FC0A,$C200 
    db $10 
    dw $FC0C,$C210 
    db $10 
    dw $FC0E,$C3F0 
    db $00 
    dw $BC08,$C3E0 
    db $00 
    dw $BC0A,$C3F0 
    db $10 
    dw $BC0C,$C3E0 
    db $10 
    dw $BC0E,$C200 
    db $F0 
    dw $7C08,$C210 
    db $F0 
    dw $7C0A,$C200 
    db $E0 
    dw $7C0C,$C210 
    db $E0 
    dw $7C0E,$C3E0 
    db $E0 
    dw $3C0E,$C3E0 
    db $F0 
    dw $3C0A,$C3F0 
    db $E0 
    dw $3C0C,$C3F0 
    db $F0 
    dw $3C08 

SamusSpritemaps_C2DE:
    dw $0010,$C200 
    db $00 
    dw $FC08,$C210 
    db $00 
    dw $FC0A,$C200 
    db $10 
    dw $FC0C,$C210 
    db $10 
    dw $FC0E,$C3F0 
    db $00 
    dw $BC08,$C3E0 
    db $00 
    dw $BC0A,$C3F0 
    db $10 
    dw $BC0C,$C3E0 
    db $10 
    dw $BC0E,$C200 
    db $F0 
    dw $7C08,$C210 
    db $F0 
    dw $7C0A,$C200 
    db $E0 
    dw $7C0C,$C210 
    db $E0 
    dw $7C0E,$C3F0 
    db $F0 
    dw $3C08,$C3E0 
    db $F0 
    dw $3C0A,$C3F0 
    db $E0 
    dw $3C0C,$C3E0 
    db $E0 
    dw $3C0E 

SamusSpritemaps_C330:
    dw $0004,$C200 
    db $F0 
    dw $2808,$C3F0 
    db $00 
    dw $280A,$C3F8 
    db $00 
    dw $280C,$C3F8 
    db $F0 
    dw $280E 

SamusSpritemaps_C346:
    dw $000A,$C201 
    db $04 
    dw $2808,$C3F1 
    db $F4 
    dw $280A,$01F9 
    db $0C 
    dw $280C,$01F1 
    db $EC 
    dw $280D,$0001 
    db $EC 
    dw $280E,$01F9 
    db $EC 
    dw $280F,$0009 
    db $FC 
    dw $281C,$0001 
    db $FC 
    dw $281D,$0001 
    db $F4 
    dw $281E,$01F9 
    db $04 
    dw $281F 

SamusSpritemaps_C37A:
    dw $0004,$C200 
    db $00 
    dw $2808,$C3F0 
    db $F0 
    dw $280A,$C3F0 
    db $F8 
    dw $280C,$C200 
    db $F8 
    dw $280E 

SamusSpritemaps_C390:
    dw $000A,$01FC 
    db $F0 
    dw $E80C,$01F4 
    db $F8 
    dw $E80D,$01FC 
    db $F8 
    dw $E80E,$0004 
    db $00 
    dw $E80F,$000C 
    db $00 
    dw $E81C,$01EC 
    db $F8 
    dw $E81D,$01EC 
    db $00 
    dw $E81E,$01EC 
    db $08 
    dw $E81F,$C3F4 
    db $00 
    dw $E808,$C204 
    db $F0 
    dw $E80A 

SamusSpritemaps_C3C4:
    dw $0004,$C3F0 
    db $00 
    dw $E808,$C200 
    db $F0 
    dw $E80A,$C3F8 
    db $F0 
    dw $E80C,$C3F8 
    db $00 
    dw $E80E 

SamusSpritemaps_C3DA:
    dw $000A,$01F0 
    db $FC 
    dw $E80C,$01F8 
    db $FC 
    dw $E80D,$01F8 
    db $04 
    dw $E80E,$0008 
    db $0C 
    dw $E80F,$0000 
    db $EC 
    dw $E81C,$0000 
    db $F4 
    dw $E81D,$01F8 
    db $0C 
    dw $E81E,$0000 
    db $0C 
    dw $E81F,$C3F0 
    db $EC 
    dw $E808,$C200 
    db $FC 
    dw $E80A 

SamusSpritemaps_C40E:
    dw $0004,$C3F0 
    db $F0 
    dw $E808,$C200 
    db $00 
    dw $E80A,$C200 
    db $F8 
    dw $E80C,$C3F0 
    db $F8 
    dw $E80E 

SamusSpritemaps_C424:
    dw $000A,$01FC 
    db $00 
    dw $280C,$01FC 
    db $08 
    dw $280D,$0004 
    db $00 
    dw $280E,$01F4 
    db $F8 
    dw $280F,$01EC 
    db $F8 
    dw $281C,$000C 
    db $00 
    dw $281D,$000C 
    db $F8 
    dw $281E,$000C 
    db $F0 
    dw $281F,$C3FC 
    db $F0 
    dw $2808,$C3EC 
    db $00 
    dw $280A 

SamusSpritemaps_C458:
    dw $0004,$C3F0 
    db $F0 
    dw $6808,$C200 
    db $00 
    dw $680A,$C3F8 
    db $00 
    dw $680C,$C3F8 
    db $F0 
    dw $680E 

SamusSpritemaps_C46E:
    dw $000A,$C3EF 
    db $04 
    dw $6808,$C3FF 
    db $F4 
    dw $680A,$01FF 
    db $0C 
    dw $680C,$0007 
    db $EC 
    dw $680D,$01F7 
    db $EC 
    dw $680E,$01FF 
    db $EC 
    dw $680F,$01EF 
    db $FC 
    dw $681C,$01F7 
    db $FC 
    dw $681D,$01F7 
    db $F4 
    dw $681E,$01FF 
    db $04 
    dw $681F 

SamusSpritemaps_C4A2:
    dw $0004,$C3F0 
    db $00 
    dw $6808,$C200 
    db $F0 
    dw $680A,$C200 
    db $F8 
    dw $680C,$C3F0 
    db $F8 
    dw $680E 

SamusSpritemaps_C4B8:
    dw $000A,$01FC 
    db $F0 
    dw $A80C,$0004 
    db $F8 
    dw $A80D,$01FC 
    db $F8 
    dw $A80E,$01F4 
    db $00 
    dw $A80F,$01EC 
    db $00 
    dw $A81C,$000C 
    db $F8 
    dw $A81D,$000C 
    db $00 
    dw $A81E,$000C 
    db $08 
    dw $A81F,$C3FC 
    db $00 
    dw $A808,$C3EC 
    db $F0 
    dw $A80A 

SamusSpritemaps_C4EC:
    dw $0004,$C200 
    db $00 
    dw $A808,$C3F0 
    db $F0 
    dw $A80A,$C3F8 
    db $F0 
    dw $A80C,$C3F8 
    db $00 
    dw $A80E 

SamusSpritemaps_C502:
    dw $000A,$0008 
    db $FC 
    dw $A80C,$0000 
    db $FC 
    dw $A80D,$0000 
    db $04 
    dw $A80E,$01F0 
    db $0C 
    dw $A80F,$01F8 
    db $EC 
    dw $A81C,$01F8 
    db $F4 
    dw $A81D,$0000 
    db $0C 
    dw $A81E,$01F8 
    db $0C 
    dw $A81F,$C200 
    db $EC 
    dw $A808,$C3F0 
    db $FC 
    dw $A80A 

SamusSpritemaps_C536:
    dw $0004,$C200 
    db $F0 
    dw $A808,$C3F0 
    db $00 
    dw $A80A,$C3F0 
    db $F8 
    dw $A80C,$C200 
    db $F8 
    dw $A80E 

SamusSpritemaps_C54C:
    dw $000A,$01FC 
    db $00 
    dw $680C,$01FC 
    db $08 
    dw $680D,$01F4 
    db $00 
    dw $680E,$0004 
    db $F8 
    dw $680F,$000C 
    db $F8 
    dw $681C,$01EC 
    db $00 
    dw $681D,$01EC 
    db $F8 
    dw $681E,$01EC 
    db $F0 
    dw $681F,$C3F4 
    db $F0 
    dw $6808,$C204 
    db $00 
    dw $680A 

SamusSpritemaps_C580:
    dw $0009,$0000 
    db $10 
    dw $2841,$01F8 
    db $10 
    dw $2840,$0008 
    db $10 
    dw $2842,$0008 
    db $08 
    dw $2832,$0008 
    db $00 
    dw $2822,$0008 
    db $F8 
    dw $2812,$0008 
    db $F0 
    dw $2802,$C3F8 
    db $00 
    dw $2820,$C3F8 
    db $F0 
    dw $2800 

SamusSpritemaps_C5AF:
    dw $0016,$01FD 
    db $F0 
    dw $281F,$0003 
    db $F6 
    dw $280F,$01FB 
    db $F9 
    dw $280F,$01F7 
    db $F7 
    dw $285F,$0007 
    db $0B 
    dw $284E,$01FF 
    db $0F 
    dw $285F,$01F7 
    db $F2 
    dw $287F,$01F9 
    db $EF 
    dw $286C,$01F9 
    db $EC 
    dw $282F,$01FD 
    db $E9 
    dw $281F,$0006 
    db $F2 
    dw $2808,$01F9 
    db $05 
    dw $2858,$0002 
    db $FD 
    dw $2838,$0001 
    db $06 
    dw $284B,$01F8 
    db $0A 
    dw $2E43,$01F8 
    db $02 
    dw $2E33,$01F8 
    db $FA 
    dw $2E23,$01F8 
    db $F2 
    dw $2E13,$01F8 
    db $EA 
    dw $2E03,$C200 
    db $0A 
    dw $2E44,$C200 
    db $FA 
    dw $2E24,$C200 
    db $EA 
    dw $2E04 

SamusSpritemaps_C61F:
    dw $001A,$0003 
    db $E7 
    dw $281F,$0001 
    db $11 
    dw $284F,$01FF 
    db $0A 
    dw $284E,$01F9 
    db $07 
    dw $2883,$0000 
    db $04 
    dw $2883,$0006 
    db $F0 
    dw $2883,$000C 
    db $EB 
    dw $2808,$0007 
    db $07 
    dw $6858,$01F7 
    db $FF 
    dw $284B,$01F3 
    db $F6 
    dw $2838,$01F3 
    db $EE 
    dw $287F,$01F6 
    db $E9 
    dw $286C,$01FB 
    db $E7 
    dw $282F,$01F8 
    db $F1 
    dw $283F,$01F5 
    db $07 
    dw $2893,$01F8 
    db $0E 
    dw $2873,$0006 
    db $0F 
    dw $2883,$0009 
    db $01 
    dw $284F,$0008 
    db $F8 
    dw $285F,$0008 
    db $10 
    dw $2E68,$0000 
    db $10 
    dw $2E67,$0008 
    db $F0 
    dw $2E28,$0008 
    db $E8 
    dw $2E18,$C3F8 
    db $E0 
    dw $2E06,$C3F8 
    db $00 
    dw $2E46,$C3F8 
    db $F0 
    dw $2E26 

SamusSpritemaps_C6A3:
    dw $0018,$000B 
    db $DD 
    dw $283F,$0001 
    db $17 
    dw $284F,$01F7 
    db $E0 
    dw $282F,$01F1 
    db $E1 
    dw $286C,$000F 
    db $E6 
    dw $281F,$01EE 
    db $FA 
    dw $286F,$01ED 
    db $F2 
    dw $284E,$01EE 
    db $07 
    dw $2893,$01F1 
    db $10 
    dw $2873,$000D 
    db $10 
    dw $2883,$000C 
    db $02 
    dw $286F,$0010 
    db $FB 
    dw $284F,$000A 
    db $F1 
    dw $285F,$01ED 
    db $E8 
    dw $287F,$01F3 
    db $ED 
    dw $283F,$0008 
    db $FA 
    dw $2E3B,$0008 
    db $F2 
    dw $2E2B,$0008 
    db $12 
    dw $2E6B,$0000 
    db $12 
    dw $2E6A,$0008 
    db $EA 
    dw $2E1B,$0008 
    db $E2 
    dw $2E0B,$C3F8 
    db $02 
    dw $2E49,$C3F8 
    db $F2 
    dw $2E29,$C3F8 
    db $E2 
    dw $2E09 

SamusSpritemaps_C71D:
    dw $0019,$000C 
    db $D8 
    dw $283F,$0003 
    db $1E 
    dw $284F,$01F3 
    db $DA 
    dw $282F,$01E9 
    db $DE 
    dw $286C,$0011 
    db $15 
    dw $2883,$0014 
    db $04 
    dw $286F,$0015 
    db $F2 
    dw $285F,$0012 
    db $E1 
    dw $281F,$01E5 
    db $FE 
    dw $286F,$01E3 
    db $EA 
    dw $287F,$0018 
    db $FC 
    dw $284F,$01F0 
    db $14 
    dw $2873,$01E8 
    db $0C 
    dw $2893,$01E8 
    db $F4 
    dw $284E,$01F0 
    db $EC 
    dw $283F,$0000 
    db $14 
    dw $2E6D,$0008 
    db $14 
    dw $2E6E,$0008 
    db $0C 
    dw $2E5E,$0008 
    db $FC 
    dw $2E3E,$0008 
    db $F4 
    dw $2E2E,$0008 
    db $EC 
    dw $2E1E,$0008 
    db $E4 
    dw $2E0E,$C3F8 
    db $04 
    dw $2E4C,$C3F8 
    db $F4 
    dw $2E2C,$C3F8 
    db $E4 
    dw $2E0C 

SamusSpritemaps_C79C:
    dw $0019,$01DD 
    db $E1 
    dw $287F,$01E0 
    db $DC 
    dw $287F,$0003 
    db $25 
    dw $2873,$01EA 
    db $D3 
    dw $282F,$001D 
    db $FB 
    dw $2873,$01DF 
    db $FF 
    dw $6883,$0019 
    db $08 
    dw $286F,$01E2 
    db $12 
    dw $2893,$01EF 
    db $19 
    dw $2873,$0013 
    db $19 
    dw $2883,$0018 
    db $F0 
    dw $285F,$01D9 
    db $ED 
    dw $287F,$01E4 
    db $F4 
    dw $284E,$0018 
    db $DC 
    dw $281F,$01E8 
    db $EC 
    dw $683F,$0000 
    db $14 
    dw $2E74,$0000 
    db $0C 
    dw $2E64,$01F8 
    db $0C 
    dw $2E63,$0008 
    db $FC 
    dw $2E82,$0008 
    db $EC 
    dw $2E62,$0008 
    db $E4 
    dw $2E52,$0000 
    db $E4 
    dw $2E51,$01F8 
    db $E4 
    dw $2E50,$C3F8 
    db $FC 
    dw $2E80,$C3F8 
    db $EC 
    dw $2E60 

SamusSpritemaps_C81B:
    dw $0008,$000E 
    db $F4 
    dw $2E9C,$000E 
    db $EC 
    dw $2E8C,$01FE 
    db $14 
    dw $2E99,$C3F6 
    db $04 
    dw $2E78,$01F6 
    db $FC 
    dw $2E94,$01F6 
    db $F4 
    dw $2E84,$C3FE 
    db $F4 
    dw $2E85,$C3FE 
    db $E4 
    dw $2E65 

SamusSpritemaps_C845:
    dw $000B,$01F6 
    db $F4 
    dw $2E98,$0006 
    db $FC 
    dw $2E96,$01FE 
    db $FC 
    dw $2E95,$0006 
    db $E4 
    dw $2E7B,$01FE 
    db $E4 
    dw $2E7A,$000E 
    db $F4 
    dw $2E9C,$000E 
    db $EC 
    dw $2E8C,$C3FE 
    db $EC 
    dw $2E8A,$01FE 
    db $14 
    dw $2E99,$C3F6 
    db $04 
    dw $2E78,$01F6 
    db $FC 
    dw $2E94 

SamusSpritemaps_C87E:
    dw $000B,$01FE 
    db $FC 
    dw $2E95,$0006 
    db $FC 
    dw $2E96,$01F6 
    db $F4 
    dw $2E7C,$0006 
    db $E4 
    dw $2E7E,$01FE 
    db $E4 
    dw $2E7D,$000E 
    db $F4 
    dw $2E9F,$000E 
    db $EC 
    dw $2E8F,$C3FE 
    db $EC 
    dw $2E8D,$01FE 
    db $14 
    dw $2E99,$C3F6 
    db $04 
    dw $2E78,$01F6 
    db $FC 
    dw $2E94 

SamusSpritemaps_C8B7:
    dw $0009,$01F8 
    db $10 
    dw $6841,$0000 
    db $10 
    dw $6840,$01F0 
    db $10 
    dw $6842,$01F0 
    db $08 
    dw $6832,$01F0 
    db $00 
    dw $6822,$01F0 
    db $F8 
    dw $6812,$01F0 
    db $F0 
    dw $6802,$C3F8 
    db $00 
    dw $6820,$C3F8 
    db $F0 
    dw $6800 

SamusSpritemaps_C8E6:
    dw $0016,$01FB 
    db $F0 
    dw $681F,$01F5 
    db $F6 
    dw $680F,$01FD 
    db $F9 
    dw $680F,$0001 
    db $F7 
    dw $685F,$01F1 
    db $0B 
    dw $684E,$01F9 
    db $0F 
    dw $685F,$0001 
    db $F2 
    dw $687F,$01FF 
    db $EF 
    dw $686C,$01FF 
    db $EC 
    dw $682F,$01FB 
    db $E9 
    dw $681F,$01F2 
    db $F2 
    dw $6808,$01FF 
    db $05 
    dw $6858,$01F6 
    db $FD 
    dw $6838,$01F7 
    db $06 
    dw $684B,$0000 
    db $0A 
    dw $6E43,$0000 
    db $02 
    dw $6E33,$0000 
    db $FA 
    dw $6E23,$0000 
    db $F2 
    dw $6E13,$0000 
    db $EA 
    dw $6E03,$C3F0 
    db $0A 
    dw $6E44,$C3F0 
    db $FA 
    dw $6E24,$C3F0 
    db $EA 
    dw $6E04 

SamusSpritemaps_C956:
    dw $001A,$01F5 
    db $E7 
    dw $681F,$01F7 
    db $11 
    dw $684F,$01F9 
    db $0A 
    dw $684E,$01FF 
    db $07 
    dw $6883,$01F8 
    db $04 
    dw $6883,$01F2 
    db $F0 
    dw $6883,$01EC 
    db $EB 
    dw $6808,$01F1 
    db $07 
    dw $2858,$0001 
    db $FF 
    dw $684B,$0005 
    db $F6 
    dw $6838,$0005 
    db $EE 
    dw $687F,$0002 
    db $E9 
    dw $686C,$01FD 
    db $E7 
    dw $682F,$0000 
    db $F1 
    dw $683F,$0003 
    db $07 
    dw $6893,$0000 
    db $0E 
    dw $6873,$01F2 
    db $0F 
    dw $6883,$01EF 
    db $01 
    dw $684F,$01F0 
    db $F8 
    dw $685F,$01F0 
    db $10 
    dw $6E68,$01F8 
    db $10 
    dw $6E67,$01F0 
    db $F0 
    dw $6E28,$01F0 
    db $E8 
    dw $6E18,$C3F8 
    db $E0 
    dw $6E06,$C3F8 
    db $00 
    dw $6E46,$C3F8 
    db $F0 
    dw $6E26 

SamusSpritemaps_C9DA:
    dw $0018,$01ED 
    db $DD 
    dw $683F,$01F7 
    db $17 
    dw $684F,$0001 
    db $E0 
    dw $682F,$0007 
    db $E1 
    dw $686C,$01E9 
    db $E6 
    dw $681F,$000A 
    db $FA 
    dw $686F,$000B 
    db $F2 
    dw $684E,$000A 
    db $07 
    dw $6893,$0007 
    db $10 
    dw $6873,$01EB 
    db $10 
    dw $6883,$01EC 
    db $02 
    dw $686F,$01E8 
    db $FB 
    dw $684F,$01EE 
    db $F1 
    dw $685F,$000B 
    db $E8 
    dw $687F,$0005 
    db $ED 
    dw $683F,$01F0 
    db $FA 
    dw $6E3B,$01F0 
    db $F2 
    dw $6E2B,$01F0 
    db $12 
    dw $6E6B,$01F8 
    db $12 
    dw $6E6A,$01F0 
    db $EA 
    dw $6E1B,$01F0 
    db $E2 
    dw $6E0B,$C3F8 
    db $02 
    dw $6E49,$C3F8 
    db $F2 
    dw $6E29,$C3F8 
    db $E2 
    dw $6E09 

SamusSpritemaps_CA54:
    dw $0019,$01EC 
    db $D8 
    dw $683F,$01F5 
    db $1E 
    dw $684F,$0005 
    db $DA 
    dw $682F,$000F 
    db $DE 
    dw $686C,$01E7 
    db $15 
    dw $6883,$01E4 
    db $04 
    dw $686F,$01E3 
    db $F2 
    dw $685F,$01E6 
    db $E1 
    dw $681F,$0013 
    db $FE 
    dw $686F,$0015 
    db $EA 
    dw $687F,$01E0 
    db $FC 
    dw $684F,$0008 
    db $14 
    dw $6873,$0010 
    db $0C 
    dw $6893,$0010 
    db $F4 
    dw $684E,$0008 
    db $EC 
    dw $683F,$01F8 
    db $14 
    dw $6E6D,$01F0 
    db $14 
    dw $6E6E,$01F0 
    db $0C 
    dw $6E5E,$01F0 
    db $FC 
    dw $6E3E,$01F0 
    db $F4 
    dw $6E2E,$01F0 
    db $EC 
    dw $6E1E,$01F0 
    db $E4 
    dw $6E0E,$C3F8 
    db $04 
    dw $6E4C,$C3F8 
    db $F4 
    dw $6E2C,$C3F8 
    db $E4 
    dw $6E0C 

SamusSpritemaps_CAD3:
    dw $0019,$001B 
    db $E1 
    dw $687F,$0018 
    db $DC 
    dw $687F,$01F5 
    db $25 
    dw $6873,$000E 
    db $D3 
    dw $682F,$01DB 
    db $FB 
    dw $6873,$0019 
    db $FF 
    dw $2883,$01DF 
    db $08 
    dw $686F,$0016 
    db $12 
    dw $6893,$0009 
    db $19 
    dw $6873,$01E5 
    db $19 
    dw $6883,$01E0 
    db $F0 
    dw $685F,$001F 
    db $ED 
    dw $687F,$0014 
    db $F4 
    dw $684E,$01E0 
    db $DC 
    dw $681F,$0010 
    db $EC 
    dw $283F,$01F8 
    db $14 
    dw $6E74,$01F8 
    db $0C 
    dw $6E64,$0000 
    db $0C 
    dw $6E63,$01F0 
    db $FC 
    dw $6E82,$01F0 
    db $EC 
    dw $6E62,$01F0 
    db $E4 
    dw $6E52,$01F8 
    db $E4 
    dw $6E51,$0000 
    db $E4 
    dw $6E50,$C3F8 
    db $FC 
    dw $6E80,$C3F8 
    db $EC 
    dw $6E60 

SamusSpritemaps_CB52:
    dw $0008,$01EA 
    db $F4 
    dw $6E9C,$01EA 
    db $EC 
    dw $6E8C,$01FA 
    db $14 
    dw $6E99,$C3FA 
    db $04 
    dw $6E78,$0002 
    db $FC 
    dw $6E94,$0002 
    db $F4 
    dw $6E84,$C3F2 
    db $F4 
    dw $6E85,$C3F2 
    db $E4 
    dw $6E65 

SamusSpritemaps_CB7C:
    dw $000B,$0002 
    db $F4 
    dw $6E98,$01F2 
    db $FC 
    dw $6E96,$01FA 
    db $FC 
    dw $6E95,$01F2 
    db $E4 
    dw $6E7B,$01FA 
    db $E4 
    dw $6E7A,$01EA 
    db $F4 
    dw $6E9C,$01EA 
    db $EC 
    dw $6E8C,$C3F2 
    db $EC 
    dw $6E8A,$01FA 
    db $14 
    dw $6E99,$C3FA 
    db $04 
    dw $6E78,$0002 
    db $FC 
    dw $6E94 

SamusSpritemaps_CBB5:
    dw $000B,$01FA 
    db $FC 
    dw $6E95,$01F2 
    db $FC 
    dw $6E96,$0002 
    db $F4 
    dw $6E7C,$01F2 
    db $E4 
    dw $6E7E,$01FA 
    db $E4 
    dw $6E7D,$01EA 
    db $F4 
    dw $6E9F,$01EA 
    db $EC 
    dw $6E8F,$C3F2 
    db $EC 
    dw $6E8D,$01FA 
    db $14 
    dw $6E99,$C3FA 
    db $04 
    dw $6E78,$0002 
    db $FC 
    dw $6E94 

SamusTopTiles_Set0_CBEE:
    dl SamusTiles_Top_Set0_Entry0 
    dw $0080,$0080 

SamusTopTiles_Set0_CBF5:
    dl SamusTiles_Top_Set0_Entry1 
    dw $0080,$0080 

SamusTopTiles_Set0_CBFC:
    dl SamusTiles_Top_Set0_Entry2 
    dw $00A0,$0080 

SamusTopTiles_Set0_CC03:
    dl SamusTiles_Top_Set0_Entry3 
    dw $00A0,$0080 

SamusTopTiles_Set0_CC0A:
    dl SamusTiles_Top_Set0_Entry4 
    dw $0080,$0080 

SamusTopTiles_Set0_CC11:
    dl SamusTiles_Top_Set0_Entry5 
    dw $00C0,$00C0 

SamusTopTiles_Set0_CC18:
    dl SamusTiles_Top_Set0_Entry6 
    dw $0080,$0080 

SamusTopTiles_Set0_CC1F:
    dl SamusTiles_Top_Set0_Entry7 
    dw $0080,$0080 

SamusTopTiles_Set0_CC26:
    dl SamusTiles_Top_Set0_Entry8 
    dw $00C0,$00C0 

SamusTopTiles_Set0_CC2D:
    dl SamusTiles_Top_Set0_Entry9 
    dw $00C0,$00C0 

SamusTopTiles_Set0_CC34:
    dl SamusTiles_Top_Set0_EntryA 
    dw $0080,$0080 

SamusTopTiles_Set0_CC3B:
    dl SamusTiles_Top_Set0_EntryB 
    dw $00A0,$0080 

SamusTopTiles_Set0_CC42:
    dl SamusTiles_Top_Set0_EntryC 
    dw $00E0,$0040 

SamusTopTiles_Set0_CC49:
    dl SamusTiles_Top_Set0_EntryD 
    dw $00E0,$0040 

SamusTopTiles_Set0_CC50:
    dl SamusTiles_Top_Set0_EntryE 
    dw $00E0,$0080 

SamusTopTiles_Set0_CC57:
    dl SamusTiles_Top_Set0_EntryF 
    dw $00E0,$0080 

SamusTopTiles_Set0_CC5E:
    dl SamusTiles_Top_Set0_Entry10 
    dw $00C0,$0040 

SamusTopTiles_Set0_CC65:
    dl SamusTiles_Top_Set0_Entry11 
    dw $00C0,$0040 

SamusTopTiles_Set0_CC6C:
    dl SamusTiles_Top_Set0_Entry12 
    dw $00C0,$0080 

SamusTopTiles_Set0_CC73:
    dl SamusTiles_Top_Set0_Entry13 
    dw $00C0,$0080 

SamusTopTiles_Set0_CC7A:
    dl SamusTiles_Top_Set0_Entry14 
    dw $00A0,$0080 

SamusTopTiles_Set0_CC81:
    dl SamusTiles_Top_Set0_Entry15 
    dw $00C0,$00C0 

SamusTopTiles_Set0_CC88:
    dl SamusTiles_Top_Set0_Entry16 
    dw $00C0,$0040 

SamusTopTiles_Set0_CC8F:
    dl SamusTiles_Top_Set0_Entry17 
    dw $00C0,$0040 

SamusTopTiles_Set0_CC96:
    dl SamusTiles_Top_Set0_Entry18 
    dw $00A0,$0080 

SamusTopTiles_Set0_CC9D:
    dl SamusTiles_Top_Set0_Entry19 
    dw $00A0,$0080 

SamusTopTiles_Set0_CCA4:
    dl SamusTiles_Top_Set0_Entry1A 
    dw $00C0,$0040 

SamusTopTiles_Set0_CCAB:
    dl SamusTiles_Top_Set0_Entry1B 
    dw $00E0,$0040 

SamusTopTiles_Set0_CCB2:
    dl SamusTiles_Top_Set0_Entry1C 
    dw $0100,$00C0 

SamusTopTiles_Set0_CCB9:
    dl SamusTiles_Top_Set0_Entry1D 
    dw $0100,$00C0 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusTopTiles_Set0_92CCC0:
    dl SamusTiles_Top_Set0_Entry1E 
    dw $0100,$0040 

UNUSED_SamusTopTiles_Set0_92CCC7:
    dl SamusTiles_Top_Set0_Entry1F 
    dw $0100,$0040 
endif ; !FEATURE_KEEP_UNREFERENCED

UNUSED_SamusTopTiles_Set1_92CCCE:
    dl SamusTiles_Top_Set1_Entry0 
    dw $00C0,$0080 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusTopTiles_Set1_92CCD5:
    dl SamusTiles_Top_Set1_Entry1 
    dw $00C0,$0080 
endif ; !FEATURE_KEEP_UNREFERENCED

SamusTopTiles_Set1_CCDC:
    dl SamusTiles_Top_Set1_Entry2 
    dw $00E0,$00C0 

SamusTopTiles_Set1_CCE3:
    dl SamusTiles_Top_Set1_Entry3 
    dw $0100,$00C0 

SamusTopTiles_Set1_CCEA:
    dl SamusTiles_Top_Set1_Entry4 
    dw $0020,$0000 

SamusTopTiles_Set1_CCF1:
    dl SamusTiles_Top_Set1_Entry5 
    dw $0040,$0040 

SamusTopTiles_Set1_CCF8:
    dl SamusTiles_Top_Set1_Entry6 
    dw $00C0,$0080 

SamusTopTiles_Set1_CCFF:
    dl SamusTiles_Top_Set1_Entry7 
    dw $00C0,$0080 

SamusTopTiles_Set1_CD06:
    dl SamusTiles_Top_Set1_Entry8 
    dw $00E0,$0040 

SamusTopTiles_Set1_CD0D:
    dl SamusTiles_Top_Set1_Entry9 
    dw $00C0,$0040 

SamusTopTiles_Set1_CD14:
    dl SamusTiles_Top_Set1_EntryA 
    dw $00E0,$00C0 

SamusTopTiles_Set1_CD1B:
    dl SamusTiles_Top_Set1_EntryB 
    dw $0100,$0080 

SamusTopTiles_Set1_CD22:
    dl SamusTiles_Top_Set1_EntryC 
    dw $0100,$0080 

SamusTopTiles_Set1_CD29:
    dl SamusTiles_Top_Set1_EntryD 
    dw $0080,$0080 

SamusTopTiles_Set1_CD30:
    dl SamusTiles_Top_Set1_EntryE 
    dw $0080,$0080 

SamusTopTiles_Set1_CD37:
    dl SamusTiles_Top_Set1_EntryF 
    dw $0080,$0080 

SamusTopTiles_Set1_CD3E:
    dl SamusTiles_Top_Set1_Entry10 
    dw $0080,$0080 

SamusTopTiles_Set1_CD45:
    dl SamusTiles_Top_Set1_Entry11 
    dw $0080,$0080 

SamusTopTiles_Set1_CD4C:
    dl SamusTiles_Top_Set1_Entry12 
    dw $0080,$0080 

SamusTopTiles_Set1_CD53:
    dl SamusTiles_Top_Set1_Entry13 
    dw $0080,$0080 

SamusTopTiles_Set1_CD5A:
    dl SamusTiles_Top_Set1_Entry14 
    dw $0100,$00C0 

SamusTopTiles_Set1_CD61:
    dl SamusTiles_Top_Set1_Entry15 
    dw $0100,$00C0 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusTopTiles_Set1_92CD68:
    dl SamusTiles_Top_Set1_Entry16 
    dw $0020,$0000 

UNUSED_SamusTopTiles_Set1_92CD6F:
    dl SamusTiles_Top_Set1_Entry17 
    dw $0020,$0000 
endif ; !FEATURE_KEEP_UNREFERENCED

SamusTopTiles_Set1_CD76:
    dl SamusTiles_Top_Set1_Entry18 
    dw $00E0,$0040 

SamusTopTiles_Set1_CD7D:
    dl SamusTiles_Top_Set1_Entry19 
    dw $00E0,$0040 

SamusTopTiles_Set1_CD84:
    dl SamusTiles_Top_Set1_Entry1A 
    dw $00C0,$0080 

SamusTopTiles_Set1_CD8B:
    dl SamusTiles_Top_Set1_Entry1B 
    dw $00C0,$0080 

SamusTopTiles_Set1_CD92:
    dl SamusTiles_Top_Set1_Entry1C 
    dw $00C0,$0080 

SamusTopTiles_Set1_CD99:
    dl SamusTiles_Top_Set1_Entry1D 
    dw $00C0,$0080 

SamusTopTiles_Set2_CDA0:
    dl SamusTiles_Top_Set2_Entry0 
    dw $0080,$0040 

SamusTopTiles_Set2_CDA7:
    dl SamusTiles_Top_Set2_Entry1 
    dw $0080,$0080 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusTopTiles_Set2_92CDAE:
    dl SamusTiles_Top_Set2_Entry2 
    dw $00C0,$0080 
endif ; !FEATURE_KEEP_UNREFERENCED

SamusTopTiles_Set2_CDB5:
    dl SamusTiles_Top_Set2_Entry3 
    dw $0080,$0080 

SamusTopTiles_Set2_CDBC:
    dl SamusTiles_Top_Set2_Entry4 
    dw $0080,$0040 

SamusTopTiles_Set2_CDC3:
    dl SamusTiles_Top_Set2_Entry5 
    dw $0080,$0080 

SamusTopTiles_Set2_CDCA:
    dl SamusTiles_Top_Set2_Entry6 
    dw $00E0,$0040 

SamusTopTiles_Set2_CDD1:
    dl SamusTiles_Top_Set2_Entry7 
    dw $00E0,$0040 

SamusTopTiles_Set2_CDD8:
    dl SamusTiles_Top_Set2_Entry8 
    dw $00C0,$0040 

SamusTopTiles_Set2_CDDF:
    dl SamusTiles_Top_Set2_Entry9 
    dw $00C0,$0040 

SamusTopTiles_Set2_CDE6:
    dl SamusTiles_Top_Set2_EntryA 
    dw $00C0,$0040 

SamusTopTiles_Set2_CDED:
    dl SamusTiles_Top_Set2_EntryB 
    dw $00C0,$0040 

SamusTopTiles_Set2_CDF4:
    dl SamusTiles_Top_Set2_EntryC 
    dw $00C0,$0040 

SamusTopTiles_Set2_CDFB:
    dl SamusTiles_Top_Set2_EntryD 
    dw $00C0,$0040 

SamusTopTiles_Set2_CE02:
    dl SamusTiles_Top_Set2_EntryE 
    dw $00C0,$0040 

SamusTopTiles_Set2_CE09:
    dl SamusTiles_Top_Set2_EntryF 
    dw $00C0,$0040 

SamusTopTiles_Set2_CE10:
    dl SamusTiles_Top_Set2_Entry10 
    dw $00C0,$0040 

SamusTopTiles_Set2_CE17:
    dl SamusTiles_Top_Set2_Entry11 
    dw $00E0,$0040 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusTopTiles_Set2_92CE1E:
    dl SamusTiles_Top_Set2_Entry12 
    dw $0100,$0040 

UNUSED_SamusTopTiles_Set2_92CE25:
    dl SamusTiles_Top_Set2_Entry13 
    dw $0100,$0040 

UNUSED_SamusTopTiles_Set2_92CE2C:
    dl SamusTiles_Top_Set2_Entry14 
    dw $0100,$0040 

UNUSED_SamusTopTiles_Set2_92CE33:
    dl SamusTiles_Top_Set2_Entry15 
    dw $0100,$0040 
endif ; !FEATURE_KEEP_UNREFERENCED

SamusTopTiles_Set2_CE3A:
    dl SamusTiles_Top_Set2_Entry16 
    dw $00C0,$0040 

SamusTopTiles_Set2_CE41:
    dl SamusTiles_Top_Set2_Entry17 
    dw $00E0,$0040 

SamusTopTiles_Set2_CE48:
    dl SamusTiles_Top_Set2_Entry18 
    dw $00E0,$0040 

SamusTopTiles_Set2_CE4F:
    dl SamusTiles_Top_Set2_Entry19 
    dw $00E0,$0040 

SamusTopTiles_Set2_CE56:
    dl SamusTiles_Top_Set2_Entry1A 
    dw $00C0,$0040 

SamusTopTiles_Set2_CE5D:
    dl SamusTiles_Top_Set2_Entry1B 
    dw $00C0,$0040 

SamusTopTiles_Set2_CE64:
    dl SamusTiles_Top_Set2_Entry1C 
    dw $00E0,$0040 

SamusTopTiles_Set2_CE6B:
    dl SamusTiles_Top_Set2_Entry1D 
    dw $00C0,$0040 

SamusTopTiles_Set2_CE72:
    dl SamusTiles_Top_Set2_Entry1E 
    dw $00C0,$0040 

SamusTopTiles_Set2_CE79:
    dl SamusTiles_Top_Set2_Entry1F 
    dw $00C0,$0040 

SamusTopTiles_Set3_CE80:
    dl SamusTiles_Top_Set3_Entry0 
    dw $00C0,$0080 

SamusTopTiles_Set3_CE87:
    dl SamusTiles_Top_Set3_Entry1 
    dw $00C0,$0080 

SamusTopTiles_Set3_CE8E:
    dl SamusTiles_Top_Set3_Entry2 
    dw $00C0,$00C0 

SamusTopTiles_Set3_CE95:
    dl SamusTiles_Top_Set3_Entry3 
    dw $00C0,$00C0 

SamusTopTiles_Set3_CE9C:
    dl SamusTiles_Top_Set3_Entry4 
    dw $00C0,$00C0 

SamusTopTiles_Set3_CEA3:
    dl SamusTiles_Top_Set3_Entry5 
    dw $00C0,$00C0 

SamusTopTiles_Set3_CEAA:
    dl SamusTiles_Top_Set3_Entry6 
    dw $00C0,$00C0 

SamusTopTiles_Set3_CEB1:
    dl SamusTiles_Top_Set3_Entry7 
    dw $00C0,$0080 

SamusTopTiles_Set3_CEB8:
    dl SamusTiles_Top_Set3_Entry8 
    dw $00C0,$0080 

SamusTopTiles_Set3_CEBF:
    dl SamusTiles_Top_Set3_Entry9 
    dw $00C0,$0080 

SamusTopTiles_Set3_CEC6:
    dl SamusTiles_Top_Set3_EntryA 
    dw $00C0,$00C0 

SamusTopTiles_Set3_CECD:
    dl SamusTiles_Top_Set3_EntryB 
    dw $00C0,$00C0 

SamusTopTiles_Set3_CED4:
    dl SamusTiles_Top_Set3_EntryC 
    dw $00C0,$00C0 

SamusTopTiles_Set3_CEDB:
    dl SamusTiles_Top_Set3_EntryD 
    dw $00C0,$00C0 

SamusTopTiles_Set3_CEE2:
    dl SamusTiles_Top_Set3_EntryE 
    dw $00C0,$00C0 

SamusTopTiles_Set3_CEE9:
    dl SamusTiles_Top_Set3_EntryF 
    dw $00C0,$0080 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusTopTiles_Set3_92CEF0:
    dl SamusTiles_Top_Set3_Entry10 
    dw $00C0,$0080 
endif ; !FEATURE_KEEP_UNREFERENCED

SamusTopTiles_Set4_CEF7:
    dl SamusTiles_Top_Set4_Entry0 
    dw $0100,$00C0 

SamusTopTiles_Set4_CEFE:
    dl SamusTiles_Top_Set4_Entry1 
    dw $0100,$00C0 

SamusTopTiles_Set4_CF05:
    dl SamusTiles_Top_Set4_Entry2 
    dw $0100,$0100 

SamusTopTiles_Set4_CF0C:
    dl SamusTiles_Top_Set4_Entry3 
    dw $0100,$0100 

SamusTopTiles_Set4_CF13:
    dl SamusTiles_Top_Set4_Entry4 
    dw $0100,$00E0 

SamusTopTiles_Set4_CF1A:
    dl SamusTiles_Top_Set4_Entry5 
    dw $0100,$00E0 

SamusTopTiles_Set4_CF21:
    dl SamusTiles_Top_Set4_Entry6 
    dw $0100,$00E0 

SamusTopTiles_Set4_CF28:
    dl SamusTiles_Top_Set4_Entry7 
    dw $0100,$00C0 

SamusTopTiles_Set4_CF2F:
    dl SamusTiles_Top_Set4_Entry8 
    dw $0100,$00C0 

SamusTopTiles_Set4_CF36:
    dl SamusTiles_Top_Set4_Entry9 
    dw $0100,$00C0 

SamusTopTiles_Set4_CF3D:
    dl SamusTiles_Top_Set4_EntryA 
    dw $0100,$00E0 

SamusTopTiles_Set4_CF44:
    dl SamusTiles_Top_Set4_EntryB 
    dw $0100,$0100 

SamusTopTiles_Set4_CF4B:
    dl SamusTiles_Top_Set4_EntryC 
    dw $0100,$0100 

SamusTopTiles_Set4_CF52:
    dl SamusTiles_Top_Set4_EntryD 
    dw $0100,$0100 

SamusTopTiles_Set4_CF59:
    dl SamusTiles_Top_Set4_EntryE 
    dw $0100,$0100 

SamusTopTiles_Set4_CF60:
    dl SamusTiles_Top_Set4_EntryF 
    dw $0100,$00E0 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusTopTiles_Set4_92CF67:
    dl SamusTiles_Top_Set4_Entry10 
    dw $0100,$00E0 
endif ; !FEATURE_KEEP_UNREFERENCED

SamusTopTiles_Set5_CF6E:
    dl SamusTiles_Top_Set5_Entry0 
    dw $00C0,$0080 

SamusTopTiles_Set5_CF75:
    dl SamusTiles_Top_Set5_Entry1 
    dw $00C0,$0080 

SamusTopTiles_Set5_CF7C:
    dl SamusTiles_Top_Set5_Entry2 
    dw $00C0,$00C0 

SamusTopTiles_Set5_CF83:
    dl SamusTiles_Top_Set5_Entry3 
    dw $00C0,$00C0 

SamusTopTiles_Set5_CF8A:
    dl SamusTiles_Top_Set5_Entry4 
    dw $00C0,$00C0 

SamusTopTiles_Set5_CF91:
    dl SamusTiles_Top_Set5_Entry5 
    dw $00C0,$00C0 

SamusTopTiles_Set5_CF98:
    dl SamusTiles_Top_Set5_Entry6 
    dw $00C0,$00C0 

SamusTopTiles_Set5_CF9F:
    dl SamusTiles_Top_Set5_Entry7 
    dw $00C0,$0080 

SamusTopTiles_Set5_CFA6:
    dl SamusTiles_Top_Set5_Entry8 
    dw $00C0,$0080 

SamusTopTiles_Set5_CFAD:
    dl SamusTiles_Top_Set5_Entry9 
    dw $00C0,$0080 

SamusTopTiles_Set5_CFB4:
    dl SamusTiles_Top_Set5_EntryA 
    dw $00C0,$00C0 

SamusTopTiles_Set5_CFBB:
    dl SamusTiles_Top_Set5_EntryB 
    dw $00C0,$00C0 

SamusTopTiles_Set5_CFC2:
    dl SamusTiles_Top_Set5_EntryC 
    dw $00C0,$00C0 

SamusTopTiles_Set5_CFC9:
    dl SamusTiles_Top_Set5_EntryD 
    dw $00C0,$00C0 

SamusTopTiles_Set5_CFD0:
    dl SamusTiles_Top_Set5_EntryE 
    dw $00C0,$00C0 

SamusTopTiles_Set5_CFD7:
    dl SamusTiles_Top_Set5_EntryF 
    dw $00C0,$0080 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusTopTiles_Set5_92CFDE:
    dl SamusTiles_Top_Set5_Entry10 
    dw $00C0,$0080 
endif ; !FEATURE_KEEP_UNREFERENCED

SamusTopTiles_Set6_CFE5:
    dl SamusTiles_Top_Set6_Entry0 
    dw $0100,$00C0 

SamusTopTiles_Set6_CFEC:
    dl SamusTiles_Top_Set6_Entry1 
    dw $0100,$00C0 

SamusTopTiles_Set6_CFF3:
    dl SamusTiles_Top_Set6_Entry2 
    dw $0100,$0100 

SamusTopTiles_Set6_CFFA:
    dl SamusTiles_Top_Set6_Entry3 
    dw $0100,$0100 

SamusTopTiles_Set6_D001:
    dl SamusTiles_Top_Set6_Entry4 
    dw $0100,$00E0 

SamusTopTiles_Set6_D008:
    dl SamusTiles_Top_Set6_Entry5 
    dw $0100,$00E0 

SamusTopTiles_Set6_D00F:
    dl SamusTiles_Top_Set6_Entry6 
    dw $0100,$00E0 

SamusTopTiles_Set6_D016:
    dl SamusTiles_Top_Set6_Entry7 
    dw $0100,$00C0 

SamusTopTiles_Set6_D01D:
    dl SamusTiles_Top_Set6_Entry8 
    dw $0100,$00C0 

SamusTopTiles_Set6_D024:
    dl SamusTiles_Top_Set6_Entry9 
    dw $0100,$00C0 

SamusTopTiles_Set6_D02B:
    dl SamusTiles_Top_Set6_EntryA 
    dw $0100,$00E0 

SamusTopTiles_Set6_D032:
    dl SamusTiles_Top_Set6_EntryB 
    dw $0100,$0100 

SamusTopTiles_Set6_D039:
    dl SamusTiles_Top_Set6_EntryC 
    dw $0100,$0100 

SamusTopTiles_Set6_D040:
    dl SamusTiles_Top_Set6_EntryD 
    dw $0100,$0100 

SamusTopTiles_Set6_D047:
    dl SamusTiles_Top_Set6_EntryE 
    dw $0100,$0100 

SamusTopTiles_Set6_D04E:
    dl SamusTiles_Top_Set6_EntryF 
    dw $0100,$00E0 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusTopTiles_Set6_92D055:
    dl SamusTiles_Top_Set6_Entry10 
    dw $0100,$00E0 
endif ; !FEATURE_KEEP_UNREFERENCED

SamusTopTiles_Set7_D05C:
    dl SamusTiles_Top_Set7_Entry0 
    dw $00E0,$0040 

SamusTopTiles_Set7_D063:
    dl SamusTiles_Top_Set7_Entry1 
    dw $00E0,$0040 

SamusTopTiles_Set7_D06A:
    dl SamusTiles_Top_Set7_Entry2 
    dw $00E0,$0040 

SamusTopTiles_Set7_D071:
    dl SamusTiles_Top_Set7_Entry3 
    dw $0100,$0040 

SamusTopTiles_Set7_D078:
    dl SamusTiles_Top_Set7_Entry4 
    dw $0100,$0040 

SamusTopTiles_Set7_D07F:
    dl SamusTiles_Top_Set7_Entry5 
    dw $0100,$0040 

SamusTopTiles_Set7_D086:
    dl SamusTiles_Top_Set7_Entry6 
    dw $00E0,$0040 

SamusTopTiles_Set7_D08D:
    dl SamusTiles_Top_Set7_Entry7 
    dw $00E0,$0040 

SamusTopTiles_Set7_D094:
    dl SamusTiles_Top_Set7_Entry8 
    dw $00E0,$0040 

SamusTopTiles_Set7_D09B:
    dl SamusTiles_Top_Set7_Entry9 
    dw $0100,$0040 

SamusTopTiles_Set7_D0A2:
    dl SamusTiles_Top_Set7_EntryA 
    dw $0100,$0040 

SamusTopTiles_Set7_D0A9:
    dl SamusTiles_Top_Set7_EntryB 
    dw $0100,$0040 

SamusTopTiles_Set7_D0B0:
    dl SamusTiles_Top_Set7_EntryC 
    dw $00C0,$0080 

SamusTopTiles_Set7_D0B7:
    dl SamusTiles_Top_Set7_EntryD 
    dw $00C0,$0080 

SamusTopTiles_Set7_D0BE:
    dl SamusTiles_Top_Set7_EntryE 
    dw $00C0,$0080 

SamusTopTiles_Set7_D0C5:
    dl SamusTiles_Top_Set7_EntryF 
    dw $00C0,$0080 

SamusTopTiles_Set7_D0CC:
    dl SamusTiles_Top_Set7_Entry10 
    dw $00C0,$0080 

SamusTopTiles_Set7_D0D3:
    dl SamusTiles_Top_Set7_Entry11 
    dw $00C0,$0080 

SamusTopTiles_Set7_D0DA:
    dl SamusTiles_Top_Set7_Entry12 
    dw $00C0,$0040 

SamusTopTiles_Set7_D0E1:
    dl SamusTiles_Top_Set7_Entry13 
    dw $00C0,$0040 

SamusTopTiles_Set8_D0E8:
    dl SamusTiles_Top_Set8_Entry0 
    dw $0020,$0000 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusTopTiles_Set8_92D0EF:
    dl SamusTiles_Top_Set8_Entry1 
    dw $0020,$0000 
endif ; !FEATURE_KEEP_UNREFERENCED

SamusTopTiles_Set8_D0F6:
    dl SamusTiles_Top_Set8_Entry2 
    dw $0100,$0020 

SamusTopTiles_Set8_D0FD:
    dl SamusTiles_Top_Set8_Entry3 
    dw $00E0,$0000 

SamusTopTiles_Set8_D104:
    dl SamusTiles_Top_Set8_Entry4 
    dw $0100,$0060 

SamusTopTiles_Set8_D10B:
    dl SamusTiles_Top_Set8_Entry5 
    dw $0100,$00E0 

SamusTopTiles_Set8_D112:
    dl SamusTiles_Top_Set8_Entry6 
    dw $0100,$0000 

SamusTopTiles_Set8_D119:
    dl SamusTiles_Top_Set8_Entry7 
    dw $0100,$0040 

SamusTopTiles_Set8_D120:
    dl SamusTiles_Top_Set8_Entry8 
    dw $0100,$0060 

SamusTopTiles_Set8_D127:
    dl SamusTiles_Top_Set8_Entry9 
    dw $00E0,$0000 

SamusTopTiles_Set9_D12E:
    dl SamusTiles_Top_Set9_Entry0 
    dw $0080,$0040 

SamusTopTiles_Set9_D135:
    dl SamusTiles_Top_Set9_Entry1 
    dw $0080,$0040 

SamusTopTiles_Set9_D13C:
    dl SamusTiles_Top_Set9_Entry2 
    dw $00A0,$0040 

SamusTopTiles_Set9_D143:
    dl SamusTiles_Top_Set9_Entry3 
    dw $00C0,$0040 

SamusTopTiles_Set9_D14A:
    dl SamusTiles_Top_Set9_Entry4 
    dw $0080,$0040 

SamusTopTiles_Set9_D151:
    dl SamusTiles_Top_Set9_Entry5 
    dw $00A0,$0040 

SamusTopTiles_Set9_D158:
    dl SamusTiles_Top_Set9_Entry6 
    dw $00C0,$0040 

SamusTopTiles_Set9_D15F:
    dl SamusTiles_Top_Set9_Entry7 
    dw $00C0,$0040 

SamusTopTiles_Set9_D166:
    dl SamusTiles_Top_Set9_Entry8 
    dw $00E0,$0040 

SamusTopTiles_Set9_D16D:
    dl SamusTiles_Top_Set9_Entry9 
    dw $00E0,$0040 

SamusTopTiles_Set9_D174:
    dl SamusTiles_Top_Set9_EntryA 
    dw $00C0,$0040 

SamusTopTiles_Set9_D17B:
    dl SamusTiles_Top_Set9_EntryB 
    dw $0100,$0040 

SamusTopTiles_Set9_D182:
    dl SamusTiles_Top_Set9_EntryC 
    dw $00C0,$0040 

SamusTopTiles_Set9_D189:
    dl SamusTiles_Top_Set9_EntryD 
    dw $0100,$0040 

SamusTopTiles_Set9_D190:
    dl SamusTiles_Top_Set9_EntryE 
    dw $0080,$0040 

SamusTopTiles_Set9_D197:
    dl SamusTiles_Top_Set9_EntryF 
    dw $00C0,$0040 

SamusBottomTiles_Set0_D19E:
    dl SamusTiles_Bottom_Set0_Entry0 
    dw $0080,$0080 

SamusBottomTiles_Set0_D1A5:
    dl SamusTiles_Bottom_Set0_Entry1 
    dw $00E0,$0080 

SamusBottomTiles_Set0_D1AC:
    dl SamusTiles_Bottom_Set0_Entry2 
    dw $00E0,$00C0 

SamusBottomTiles_Set0_D1B3:
    dl SamusTiles_Bottom_Set0_Entry3 
    dw $0080,$0080 

SamusBottomTiles_Set0_D1BA:
    dl SamusTiles_Bottom_Set0_Entry4 
    dw $0100,$0080 

SamusBottomTiles_Set0_D1C1:
    dl SamusTiles_Bottom_Set0_Entry5 
    dw $00E0,$00C0 

SamusBottomTiles_Set0_D1C8:
    dl SamusTiles_Bottom_Set0_Entry6 
    dw $00C0,$00C0 

SamusBottomTiles_Set0_D1CF:
    dl SamusTiles_Bottom_Set0_Entry7 
    dw $0080,$0080 

SamusBottomTiles_Set0_D1D6:
    dl SamusTiles_Bottom_Set0_Entry8 
    dw $00C0,$0080 

SamusBottomTiles_Set0_D1DD:
    dl SamusTiles_Bottom_Set0_Entry9 
    dw $0100,$0080 

SamusBottomTiles_Set0_D1E4:
    dl SamusTiles_Bottom_Set0_EntryA 
    dw $00C0,$0080 

SamusBottomTiles_Set0_D1EB:
    dl SamusTiles_Bottom_Set0_EntryB 
    dw $0100,$0080 

SamusBottomTiles_Set0_D1F2:
    dl SamusTiles_Bottom_Set0_EntryC 
    dw $0100,$00C0 

SamusBottomTiles_Set0_D1F9:
    dl SamusTiles_Bottom_Set0_EntryD 
    dw $0100,$00C0 

SamusBottomTiles_Set0_D200:
    dl SamusTiles_Bottom_Set0_EntryE 
    dw $00C0,$00C0 

SamusBottomTiles_Set0_D207:
    dl SamusTiles_Bottom_Set0_EntryF 
    dw $00C0,$00C0 

SamusBottomTiles_Set0_D20E:
    dl SamusTiles_Bottom_Set0_Entry10 
    dw $00C0,$00C0 

SamusBottomTiles_Set0_D215:
    dl SamusTiles_Bottom_Set0_Entry11 
    dw $00A0,$0040 

SamusBottomTiles_Set0_D21C:
    dl SamusTiles_Bottom_Set0_Entry12 
    dw $00A0,$0040 

SamusBottomTiles_Set0_D223:
    dl SamusTiles_Bottom_Set0_Entry13 
    dw $00A0,$0080 

SamusBottomTiles_Set0_D22A:
    dl SamusTiles_Bottom_Set0_Entry14 
    dw $00A0,$0080 

SamusBottomTiles_Set0_D231:
    dl SamusTiles_Bottom_Set0_Entry15 
    dw $00A0,$0080 

SamusBottomTiles_Set0_D238:
    dl SamusTiles_Bottom_Set0_Entry16 
    dw $00A0,$0080 

SamusBottomTiles_Set0_D23F:
    dl SamusTiles_Bottom_Set0_Entry17 
    dw $0080,$0040 

SamusBottomTiles_Set0_D246:
    dl SamusTiles_Bottom_Set0_Entry18 
    dw $0080,$0040 

SamusBottomTiles_Set0_D24D:
    dl SamusTiles_Bottom_Set0_Entry19 
    dw $0080,$0080 

SamusBottomTiles_Set0_D254:
    dl SamusTiles_Bottom_Set0_Entry1A 
    dw $0080,$0080 

SamusBottomTiles_Set0_D25B:
    dl SamusTiles_Bottom_Set0_Entry1B 
    dw $00C0,$0080 

SamusBottomTiles_Set0_D262:
    dl SamusTiles_Bottom_Set0_Entry1C 
    dw $00C0,$0080 

SamusBottomTiles_Set0_D269:
    dl SamusTiles_Bottom_Set0_Entry1D 
    dw $00C0,$00C0 

SamusBottomTiles_Set0_D270:
    dl SamusTiles_Bottom_Set0_Entry1E 
    dw $0080,$0080 

SamusBottomTiles_Set0_D277:
    dl SamusTiles_Bottom_Set0_Entry1F 
    dw $0080,$0080 

SamusBottomTiles_Set1_D27E:
    dl SamusTiles_Bottom_Set1_Entry0 
    dw $00C0,$0080 

SamusBottomTiles_Set1_D285:
    dl SamusTiles_Bottom_Set1_Entry1 
    dw $0080,$0080 

SamusBottomTiles_Set1_D28C:
    dl SamusTiles_Bottom_Set1_Entry2 
    dw $0040,$0040 

SamusBottomTiles_Set1_D293:
    dl SamusTiles_Bottom_Set1_Entry3 
    dw $00C0,$0080 

SamusBottomTiles_Set1_D29A:
    dl SamusTiles_Bottom_Set1_Entry4 
    dw $0080,$0080 

SamusBottomTiles_Set1_D2A1:
    dl SamusTiles_Bottom_Set1_Entry5 
    dw $0080,$0080 

SamusBottomTiles_Set1_D2A8:
    dl SamusTiles_Bottom_Set1_Entry6 
    dw $00C0,$0080 

SamusBottomTiles_Set1_D2AF:
    dl SamusTiles_Bottom_Set1_Entry7 
    dw $00C0,$0080 

SamusBottomTiles_Set1_D2B6:
    dl SamusTiles_Bottom_Set1_Entry8 
    dw $00E0,$0040 

SamusBottomTiles_Set1_D2BD:
    dl SamusTiles_Bottom_Set1_Entry9 
    dw $00E0,$0040 

SamusBottomTiles_Set1_D2C4:
    dl SamusTiles_Bottom_Set1_EntryA 
    dw $00A0,$0080 

SamusBottomTiles_Set1_D2CB:
    dl SamusTiles_Bottom_Set1_EntryB 
    dw $00A0,$0080 

SamusBottomTiles_Set1_D2D2:
    dl SamusTiles_Bottom_Set1_EntryC 
    dw $0080,$0080 

SamusBottomTiles_Set1_D2D9:
    dl SamusTiles_Bottom_Set1_EntryD 
    dw $0080,$0080 

SamusBottomTiles_Set1_D2E0:
    dl SamusTiles_Bottom_Set1_EntryE 
    dw $00C0,$0040 

SamusBottomTiles_Set1_D2E7:
    dl SamusTiles_Bottom_Set1_EntryF 
    dw $00C0,$0040 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusBottomTiles_Set1_92D2EE:
    dl SamusTiles_Bottom_Set1_Entry10 
    dw $0020,$0000 
endif ; !FEATURE_KEEP_UNREFERENCED

SamusBottomTiles_Set1_D2F5:
    dl SamusTiles_Bottom_Set1_Entry11 
    dw $00E0,$0040 

SamusBottomTiles_Set1_D2FC:
    dl SamusTiles_Bottom_Set1_Entry12 
    dw $00E0,$0040 

SamusBottomTiles_Set1_D303:
    dl SamusTiles_Bottom_Set1_Entry13 
    dw $0100,$0040 

SamusBottomTiles_Set1_D30A:
    dl SamusTiles_Bottom_Set1_Entry14 
    dw $00C0,$0040 

SamusBottomTiles_Set1_D311:
    dl SamusTiles_Bottom_Set1_Entry15 
    dw $00A0,$0080 

SamusBottomTiles_Set1_D318:
    dl SamusTiles_Bottom_Set1_Entry16 
    dw $00A0,$0080 

SamusBottomTiles_Set1_D31F:
    dl SamusTiles_Bottom_Set1_Entry17 
    dw $00A0,$0080 

SamusBottomTiles_Set1_D326:
    dl SamusTiles_Bottom_Set1_Entry18 
    dw $00A0,$0080 

SamusBottomTiles_Set1_D32D:
    dl SamusTiles_Bottom_Set1_Entry19 
    dw $00E0,$0080 

SamusBottomTiles_Set1_D334:
    dl SamusTiles_Bottom_Set1_Entry1A 
    dw $00E0,$0080 

SamusBottomTiles_Set1_D33B:
    dl SamusTiles_Bottom_Set1_Entry1B 
    dw $00C0,$0080 

SamusBottomTiles_Set1_D342:
    dl SamusTiles_Bottom_Set1_Entry1C 
    dw $00C0,$0080 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusBottomTiles_Set1_92D349:
    dl SamusTiles_Bottom_Set1_Entry1D 
    dw $0080,$0080 
endif ; !FEATURE_KEEP_UNREFERENCED

SamusBottomTiles_Set1_D350:
    dl SamusTiles_Bottom_Set1_Entry1E 
    dw $0060,$0040 

SamusBottomTiles_Set1_D357:
    dl SamusTiles_Bottom_Set1_Entry1F 
    dw $0060,$0040 

SamusBottomTiles_Set2_D35E:
    dl SamusTiles_Bottom_Set2_Entry0 
    dw $0080,$0040 

SamusBottomTiles_Set2_D365:
    dl SamusTiles_Bottom_Set2_Entry1 
    dw $00E0,$0040 

SamusBottomTiles_Set2_D36C:
    dl SamusTiles_Bottom_Set2_Entry2 
    dw $00A0,$0080 

SamusBottomTiles_Set2_D373:
    dl SamusTiles_Bottom_Set2_Entry3 
    dw $00A0,$0040 

SamusBottomTiles_Set2_D37A:
    dl SamusTiles_Bottom_Set2_Entry4 
    dw $00C0,$0040 

SamusBottomTiles_Set2_D381:
    dl SamusTiles_Bottom_Set2_Entry5 
    dw $00C0,$0040 

SamusBottomTiles_Set2_D388:
    dl SamusTiles_Bottom_Set2_Entry6 
    dw $0080,$0040 

SamusBottomTiles_Set2_D38F:
    dl SamusTiles_Bottom_Set2_Entry7 
    dw $00A0,$0040 

SamusBottomTiles_Set2_D396:
    dl SamusTiles_Bottom_Set2_Entry8 
    dw $00A0,$0040 

SamusBottomTiles_Set2_D39D:
    dl SamusTiles_Bottom_Set2_Entry9 
    dw $00C0,$0040 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusBottomTiles_Set2_92D3A4:
    dl SamusTiles_Bottom_Set2_EntryA 
    dw $00A0,$0080 
endif ; !FEATURE_KEEP_UNREFERENCED

SamusBottomTiles_Set2_D3AB:
    dl SamusTiles_Bottom_Set2_EntryB 
    dw $0080,$0080 

SamusBottomTiles_Set2_D3B2:
    dl SamusTiles_Bottom_Set2_EntryC 
    dw $0080,$0080 

SamusBottomTiles_Set2_D3B9:
    dl SamusTiles_Bottom_Set2_EntryD 
    dw $0080,$0080 

SamusBottomTiles_Set2_D3C0:
    dl SamusTiles_Bottom_Set2_EntryE 
    dw $00A0,$0040 

SamusBottomTiles_Set2_D3C7:
    dl SamusTiles_Bottom_Set2_EntryF 
    dw $0080,$0080 

SamusBottomTiles_Set2_D3CE:
    dl SamusTiles_Bottom_Set2_Entry10 
    dw $0080,$0080 

SamusBottomTiles_Set2_D3D5:
    dl SamusTiles_Bottom_Set2_Entry11 
    dw $00A0,$0040 

SamusBottomTiles_Set2_D3DC:
    dl SamusTiles_Bottom_Set2_Entry12 
    dw $0080,$0080 

SamusBottomTiles_Set2_D3E3:
    dl SamusTiles_Bottom_Set2_Entry13 
    dw $0080,$0080 

SamusBottomTiles_Set2_D3EA:
    dl SamusTiles_Bottom_Set2_Entry14 
    dw $0080,$0080 

SamusBottomTiles_Set2_D3F1:
    dl SamusTiles_Bottom_Set2_Entry15 
    dw $00C0,$0080 

SamusBottomTiles_Set2_D3F8:
    dl SamusTiles_Bottom_Set2_Entry16 
    dw $0080,$0080 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusBottomTiles_Set2_92D3FF:
    dl SamusTiles_Bottom_Set2_Entry17 
    dw $0080,$0080 
endif ; !FEATURE_KEEP_UNREFERENCED

SamusBottomTiles_Set4_D406:
    dl SamusTiles_Bottom_Set4_Entry0 
    dw $0080,$0040 

SamusBottomTiles_Set4_D40D:
    dl SamusTiles_Bottom_Set4_Entry1 
    dw $00E0,$0040 

SamusBottomTiles_Set4_D414:
    dl SamusTiles_Bottom_Set4_Entry2 
    dw $00A0,$0080 

SamusBottomTiles_Set4_D41B:
    dl SamusTiles_Bottom_Set4_Entry3 
    dw $00A0,$0040 

SamusBottomTiles_Set4_D422:
    dl SamusTiles_Bottom_Set4_Entry4 
    dw $00C0,$0040 

SamusBottomTiles_Set4_D429:
    dl SamusTiles_Bottom_Set4_Entry5 
    dw $00C0,$0040 

SamusBottomTiles_Set4_D430:
    dl SamusTiles_Bottom_Set4_Entry6 
    dw $0080,$0040 

SamusBottomTiles_Set4_D437:
    dl SamusTiles_Bottom_Set4_Entry7 
    dw $00A0,$0040 

SamusBottomTiles_Set4_D43E:
    dl SamusTiles_Bottom_Set4_Entry8 
    dw $00A0,$0040 

SamusBottomTiles_Set4_D445:
    dl SamusTiles_Bottom_Set4_Entry9 
    dw $00C0,$0040 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusBottomTiles_Set4_92D44C:
    dl SamusTiles_Bottom_Set4_EntryA 
    dw $00A0,$0080 

UNUSED_SamusBottomTiles_Set4_92D453:
    dl SamusTiles_Bottom_Set4_EntryB 
    dw $0080,$0080 

UNUSED_SamusBottomTiles_Set4_92D45A:
    dl SamusTiles_Bottom_Set4_EntryC 
    dw $0080,$0080 
endif ; !FEATURE_KEEP_UNREFERENCED

SamusBottomTiles_Set4_D461:
    dl SamusTiles_Bottom_Set4_EntryD 
    dw $0080,$0080 

SamusBottomTiles_Set4_D468:
    dl SamusTiles_Bottom_Set4_EntryE 
    dw $00A0,$0040 

SamusBottomTiles_Set4_D46F:
    dl SamusTiles_Bottom_Set4_EntryF 
    dw $0080,$0080 

SamusBottomTiles_Set4_D476:
    dl SamusTiles_Bottom_Set4_Entry10 
    dw $0080,$0080 

SamusBottomTiles_Set4_D47D:
    dl SamusTiles_Bottom_Set4_Entry11 
    dw $00A0,$0040 

SamusBottomTiles_Set4_D484:
    dl SamusTiles_Bottom_Set4_Entry12 
    dw $0080,$0080 

SamusBottomTiles_Set4_D48B:
    dl SamusTiles_Bottom_Set4_Entry13 
    dw $0080,$0080 

SamusBottomTiles_Set4_D492:
    dl SamusTiles_Bottom_Set4_Entry14 
    dw $0080,$0080 

SamusBottomTiles_Set4_D499:
    dl SamusTiles_Bottom_Set4_Entry15 
    dw $0080,$0080 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusBottomTiles_Set4_92D4A0:
    dl SamusTiles_Bottom_Set4_Entry16 
    dw $0080,$0080 
endif ; !FEATURE_KEEP_UNREFERENCED

SamusBottomTiles_Set5_D4A7:
    dl SamusTiles_Bottom_Set5_Entry0 
    dw $0080,$0040 

SamusBottomTiles_Set5_D4AE:
    dl SamusTiles_Bottom_Set5_Entry1 
    dw $00E0,$0040 

SamusBottomTiles_Set5_D4B5:
    dl SamusTiles_Bottom_Set5_Entry2 
    dw $00A0,$0080 

SamusBottomTiles_Set5_D4BC:
    dl SamusTiles_Bottom_Set5_Entry3 
    dw $00A0,$0040 

SamusBottomTiles_Set5_D4C3:
    dl SamusTiles_Bottom_Set5_Entry4 
    dw $00C0,$0040 

SamusBottomTiles_Set5_D4CA:
    dl SamusTiles_Bottom_Set5_Entry5 
    dw $00C0,$0040 

SamusBottomTiles_Set5_D4D1:
    dl SamusTiles_Bottom_Set5_Entry6 
    dw $0080,$0040 

SamusBottomTiles_Set5_D4D8:
    dl SamusTiles_Bottom_Set5_Entry7 
    dw $00A0,$0040 

SamusBottomTiles_Set5_D4DF:
    dl SamusTiles_Bottom_Set5_Entry8 
    dw $00A0,$0040 

SamusBottomTiles_Set5_D4E6:
    dl SamusTiles_Bottom_Set5_Entry9 
    dw $00C0,$0040 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusBottomTiles_Set5_92D4ED:
    dl SamusTiles_Bottom_Set5_EntryA 
    dw $00A0,$0080 
endif ; !FEATURE_KEEP_UNREFERENCED

SamusBottomTiles_Set5_D4F4:
    dl SamusTiles_Bottom_Set5_EntryB 
    dw $0080,$0080 

SamusBottomTiles_Set5_D4FB:
    dl SamusTiles_Bottom_Set5_EntryC 
    dw $0080,$0080 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusBottomTiles_Set5_92D502:
    dl SamusTiles_Bottom_Set5_EntryD 
    dw $0080,$0080 
endif ; !FEATURE_KEEP_UNREFERENCED

SamusBottomTiles_Set5_D509:
    dl SamusTiles_Bottom_Set5_EntryE 
    dw $00A0,$0040 

SamusBottomTiles_Set5_D510:
    dl SamusTiles_Bottom_Set5_EntryF 
    dw $0080,$0080 

SamusBottomTiles_Set5_D517:
    dl SamusTiles_Bottom_Set5_Entry10 
    dw $0080,$0080 

SamusBottomTiles_Set5_D51E:
    dl SamusTiles_Bottom_Set5_Entry11 
    dw $00A0,$0040 

SamusBottomTiles_Set5_D525:
    dl SamusTiles_Bottom_Set5_Entry12 
    dw $0080,$0080 

SamusBottomTiles_Set5_D52C:
    dl SamusTiles_Bottom_Set5_Entry13 
    dw $0080,$0080 

SamusBottomTiles_Set5_D533:
    dl SamusTiles_Bottom_Set5_Entry14 
    dw $0080,$0080 

SamusBottomTiles_Set5_D53A:
    dl SamusTiles_Bottom_Set5_Entry15 
    dw $00C0,$0080 

SamusBottomTiles_Set5_D541:
    dl SamusTiles_Bottom_Set5_Entry16 
    dw $0080,$0080 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusBottomTiles_Set5_92D548:
    dl SamusTiles_Bottom_Set5_Entry17 
    dw $0080,$0080 
endif ; !FEATURE_KEEP_UNREFERENCED

SamusBottomTiles_Set6_D54F:
    dl SamusTiles_Bottom_Set6_Entry0 
    dw $0080,$0040 

SamusBottomTiles_Set6_D556:
    dl SamusTiles_Bottom_Set6_Entry1 
    dw $00E0,$0040 

SamusBottomTiles_Set6_D55D:
    dl SamusTiles_Bottom_Set6_Entry2 
    dw $00A0,$0080 

SamusBottomTiles_Set6_D564:
    dl SamusTiles_Bottom_Set6_Entry3 
    dw $00A0,$0040 

SamusBottomTiles_Set6_D56B:
    dl SamusTiles_Bottom_Set6_Entry4 
    dw $00C0,$0040 

SamusBottomTiles_Set6_D572:
    dl SamusTiles_Bottom_Set6_Entry5 
    dw $00C0,$0040 

SamusBottomTiles_Set6_D579:
    dl SamusTiles_Bottom_Set6_Entry6 
    dw $0080,$0040 

SamusBottomTiles_Set6_D580:
    dl SamusTiles_Bottom_Set6_Entry7 
    dw $00A0,$0040 

SamusBottomTiles_Set6_D587:
    dl SamusTiles_Bottom_Set6_Entry8 
    dw $00A0,$0040 

SamusBottomTiles_Set6_D58E:
    dl SamusTiles_Bottom_Set6_Entry9 
    dw $00C0,$0040 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusBottomTiles_Set6_92D595:
    dl SamusTiles_Bottom_Set6_EntryA 
    dw $00A0,$0080 

UNUSED_SamusBottomTiles_Set6_92D59C:
    dl SamusTiles_Bottom_Set6_EntryB 
    dw $0080,$0080 

UNUSED_SamusBottomTiles_Set6_92D5A3:
    dl SamusTiles_Bottom_Set6_EntryC 
    dw $0080,$0080 
endif ; !FEATURE_KEEP_UNREFERENCED

SamusBottomTiles_Set6_D5AA:
    dl SamusTiles_Bottom_Set6_EntryD 
    dw $0080,$0080 

SamusBottomTiles_Set6_D5B1:
    dl SamusTiles_Bottom_Set6_EntryE 
    dw $00A0,$0040 

SamusBottomTiles_Set6_D5B8:
    dl SamusTiles_Bottom_Set6_EntryF 
    dw $0080,$0080 

SamusBottomTiles_Set6_D5BF:
    dl SamusTiles_Bottom_Set6_Entry10 
    dw $0080,$0080 

SamusBottomTiles_Set6_D5C6:
    dl SamusTiles_Bottom_Set6_Entry11 
    dw $00A0,$0040 

SamusBottomTiles_Set6_D5CD:
    dl SamusTiles_Bottom_Set6_Entry12 
    dw $0080,$0080 

SamusBottomTiles_Set6_D5D4:
    dl SamusTiles_Bottom_Set6_Entry13 
    dw $0080,$0080 

SamusBottomTiles_Set6_D5DB:
    dl SamusTiles_Bottom_Set6_Entry14 
    dw $0080,$0080 

SamusBottomTiles_Set6_D5E2:
    dl SamusTiles_Bottom_Set6_Entry15 
    dw $0080,$0080 

SamusBottomTiles_Set6_D5E9:
    dl SamusTiles_Bottom_Set6_Entry16 
    dw $0080,$0080 

SamusBottomTiles_Set8_D5F0:
    dl SamusTiles_Bottom_Set8_Entry0 
    dw $0100,$0100 

SamusBottomTiles_Set8_D5F7:
    dl SamusTiles_Bottom_Set8_Entry1 
    dw $0100,$0100 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusBottomTiles_Set8_92D5FE:
    dl SamusTiles_Bottom_Set8_Entry2 
    dw $0020,$0000 
endif ; !FEATURE_KEEP_UNREFERENCED

SamusBottomTiles_SetA_D605:
    dl SamusTiles_Bottom_SetA_Entry0 
    dw $00C0,$0080 

SamusBottomTiles_SetA_D60C:
    dl SamusTiles_Bottom_SetA_Entry1 
    dw $00C0,$0080 

SamusTopTiles_SetA_D613:
    dl SamusTiles_Top_SetA_Entry0 
    dw $0060,$0040 

SamusTopTiles_SetA_D61A:
    dl SamusTiles_Top_SetA_Entry1 
    dw $0060,$0040 

SamusTopTiles_SetA_D621:
    dl SamusTiles_Top_SetA_Entry2 
    dw $0060,$0040 

SamusTopTiles_SetA_D628:
    dl SamusTiles_Top_SetA_Entry3 
    dw $0060,$0040 

SamusTopTiles_SetA_D62F:
    dl SamusTiles_Top_SetA_Entry4 
    dw $00A0,$0000 

SamusTopTiles_SetA_D636:
    dl SamusTiles_Top_SetA_Entry5 
    dw $0060,$0040 

SamusTopTiles_SetA_D63D:
    dl SamusTiles_Top_SetA_Entry6 
    dw $0060,$0040 

SamusTopTiles_SetA_D644:
    dl SamusTiles_Top_SetA_Entry7 
    dw $0060,$0040 

SamusTopTiles_SetA_D64B:
    dl SamusTiles_Top_SetA_Entry8 
    dw $0080,$0080 

SamusTopTiles_SetA_D652:
    dl SamusTiles_Top_SetA_Entry9 
    dw $0100,$0100 

SamusTopTiles_SetA_D659:
    dl SamusTiles_Top_SetA_EntryA 
    dw $0080,$0080 

SamusTopTiles_SetA_D660:
    dl SamusTiles_Top_SetA_EntryB 
    dw $0100,$0100 

SamusTopTiles_SetA_D667:
    dl SamusTiles_Top_SetA_EntryC 
    dw $0080,$0080 

SamusTopTiles_SetA_D66E:
    dl SamusTiles_Top_SetA_EntryD 
    dw $0100,$0100 

SamusTopTiles_SetA_D675:
    dl SamusTiles_Top_SetA_EntryE 
    dw $0080,$0080 

SamusTopTiles_SetA_D67C:
    dl SamusTiles_Top_SetA_EntryF 
    dw $0100,$0100 

SamusTopTiles_SetA_D683:
    dl SamusTiles_Top_SetA_Entry10 
    dw $0100,$0040 

SamusTopTiles_SetA_D68A:
    dl SamusTiles_Top_SetA_Entry11 
    dw $0100,$0060 

SamusTopTiles_SetA_D691:
    dl SamusTiles_Top_SetA_Entry12 
    dw $0100,$0060 

SamusTopTiles_SetA_D698:
    dl SamusTiles_Top_SetA_Entry13 
    dw $0100,$0000 

SamusTopTiles_SetA_D69F:
    dl SamusTiles_Top_SetA_Entry14 
    dw $0020,$0000 

UNUSED_SamusTopTiles_SetB_92D6A6:
    dl SamusTiles_Top_SetB_Entry0 
    dw $0020,$0000 

SamusTopTiles_SetB_D6AD:
    dl SamusTiles_Top_SetB_Entry1 
    dw $0060,$0040 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusTopTiles_SetB_92D6B4:
    dl SamusTiles_Top_SetB_Entry2 
    dw $0060,$0040 
endif ; !FEATURE_KEEP_UNREFERENCED

SamusTopTiles_SetB_D6BB:
    dl SamusTiles_Top_SetB_Entry3 
    dw $0080,$0040 

SamusTopTiles_SetB_D6C2:
    dl SamusTiles_Top_SetB_Entry4 
    dw $00C0,$0040 

SamusTopTiles_SetB_D6C9:
    dl SamusTiles_Top_SetB_Entry5 
    dw $0080,$0040 

SamusTopTiles_SetB_D6D0:
    dl SamusTiles_Top_SetB_Entry6 
    dw $00C0,$0040 

UNUSED_SamusBottomTiles_Set3_92D6D7:
    dl UNUSED_SamusTiles_Bottom_Set3_Entry0_9EE9C0 
    dw $0040,$0040 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusBottomTiles_Set3_92D6DE:
    dl UNUSED_SamusTiles_Bottom_Set3_Entry1_9EEA40 
    dw $0080,$0080 

UNUSED_SamusBottomTiles_Set3_92D6E5:
    dl UNUSED_SamusTiles_Bottom_Set3_Entry2_9EEB40 
    dw $0040,$0040 

UNUSED_SamusBottomTiles_Set3_92D6EC:
    dl UNUSED_SamusTiles_Bottom_Set3_Entry3_9EEBC0 
    dw $0080,$0080 

UNUSED_SamusBottomTiles_Set3_92D6F3:
    dl UNUSED_SamusTiles_Bottom_Set3_Entry4_9EECC0 
    dw $0040,$0040 

UNUSED_SamusBottomTiles_Set3_92D6FA:
    dl UNUSED_SamusTiles_Bottom_Set3_Entry5_9EED40 
    dw $0080,$0080 

UNUSED_SamusBottomTiles_Set3_92D701:
    dl UNUSED_SamusTiles_Bottom_Set3_Entry6_9EEE40 
    dw $0040,$0040 

UNUSED_SamusBottomTiles_Set3_92D708:
    dl UNUSED_SamusTiles_Bottom_Set3_Entry7_9EEEC0 
    dw $0080,$0080 

UNUSED_SamusBottomTiles_Set3_92D70F:
    dl UNUSED_SamusTiles_Bottom_Set3_Entry8_9EEFC0 
    dw $0040,$0040 

UNUSED_SamusBottomTiles_Set3_92D716:
    dl UNUSED_SamusTiles_Bottom_Set3_Entry9_9EF040 
    dw $0080,$0080 

UNUSED_SamusBottomTiles_Set3_92D71D:
    dl UNUSED_SamusTiles_Bottom_Set3_EntryA_9EF140 
    dw $0040,$0040 

UNUSED_SamusBottomTiles_Set3_92D724:
    dl UNUSED_SamusTiles_Bottom_Set3_EntryB_9EF1C0 
    dw $0080,$0080 

UNUSED_SamusBottomTiles_Set3_92D72B:
    dl UNUSED_SamusTiles_Bottom_Set3_EntryC_9EF2C0 
    dw $0040,$0040 

UNUSED_SamusBottomTiles_Set3_92D732:
    dl UNUSED_SamusTiles_Bottom_Set3_EntryD_9EF340 
    dw $0080,$0080 

UNUSED_SamusBottomTiles_Set3_92D739:
    dl UNUSED_SamusTiles_Bottom_Set3_EntryE_9EF440 
    dw $0040,$0040 

UNUSED_SamusBottomTiles_Set3_92D740:
    dl UNUSED_SamusTiles_Bottom_Set3_EntryF_9EF4C0 
    dw $0080,$0080 

UNUSED_SamusBottomTiles_Set3_92D747:
    dl UNUSED_SamusTiles_Bottom_Set3_Entry10_9EF5C0 
    dw $0080,$0080 
endif ; !FEATURE_KEEP_UNREFERENCED

SamusTopTiles_SetC_D74E:
    dl SamusTiles_Top_SetC_Entry0 
    dw $0100,$00C0 

SamusTopTiles_SetC_D755:
    dl SamusTiles_Top_SetC_Entry1 
    dw $0100,$00C0 

SamusTopTiles_SetC_D75C:
    dl SamusTiles_Top_SetC_Entry2 
    dw $0100,$0040 

SamusTopTiles_SetC_D763:
    dl SamusTiles_Top_SetC_Entry3 
    dw $0100,$0040 

SamusTopTiles_SetC_D76A:
    dl SamusTiles_Top_SetC_Entry4 
    dw $0100,$0040 

SamusTopTiles_SetC_D771:
    dl SamusTiles_Top_SetC_Entry5 
    dw $0100,$0040 

SamusTopTiles_SetC_D778:
    dl SamusTiles_Top_SetC_Entry6 
    dw $0100,$0040 

SamusTopTiles_SetC_D77F:
    dl SamusTiles_Top_SetC_Entry7 
    dw $0100,$0040 

SamusBottomTiles_Set7_D786:
    dl SamusTiles_Bottom_Set7_Entry0 
    dw $0040,$0040 

SamusBottomTiles_Set7_D78D:
    dl SamusTiles_Bottom_Set7_Entry1 
    dw $0100,$0100 

SamusBottomTiles_Set7_D794:
    dl SamusTiles_Bottom_Set7_Entry2 
    dw $0100,$0100 

SamusBottomTiles_Set9_D79B:
    dl SamusTiles_Bottom_Set9_Entry0 
    dw $0100,$0100 

SamusBottomTiles_Set9_D7A2:
    dl SamusTiles_Bottom_Set9_Entry1 
    dw $0100,$0100 

SamusBottomTiles_Set9_D7A9:
    dl SamusTiles_Bottom_Set9_Entry2 
    dw $0100,$0100 

SamusBottomTiles_Set9_D7B0:
    dl SamusTiles_Bottom_Set9_Entry3 
    dw $0100,$0100 

SamusBottomTiles_Set9_D7B7:
    dl SamusTiles_Bottom_Set9_Entry4 
    dw $0100,$0100 

SamusBottomTiles_Set9_D7BE:
    dl SamusTiles_Bottom_Set9_Entry5 
    dw $0100,$0100 

SamusBottomTiles_Set9_D7C5:
    dl SamusTiles_Bottom_Set9_Entry6 
    dw $0100,$0100 

SamusBottomTiles_Set9_D7CC:
    dl SamusTiles_Bottom_Set9_Entry7 
    dw $0100,$0100 

SamusSpritemaps_AtmosphericGraphics_Bubbles_0:
    dw $0002,$01FC 
    db $FE 
    dw $3A25,$01FD 
    db $FC 
    dw $3A43 

SamusSpritemaps_AtmosphericGraphics_Bubbles_1:
    dw $0003,$01FF 
    db $FA 
    dw $3A43,$01FB 
    db $F8 
    dw $BA25,$01FC 
    db $FD 
    dw $3A25 

SamusSpritemaps_AtmosphericGraphics_Bubbles_2:
    dw $0003,$01FA 
    db $F6 
    dw $3A43,$0000 
    db $F8 
    dw $3A25,$01FD 
    db $FB 
    dw $3A25 

SamusSpritemaps_AtmosphericGraphics_Bubbles_3:
    dw $0003,$0000 
    db $F7 
    dw $3A43,$01FC 
    db $FA 
    dw $3A43,$01FA 
    db $F3 
    dw $3A43 

SamusSpritemaps_AtmosphericGraphics_Bubbles_4:
    dw $0003,$0000 
    db $F3 
    dw $3A40,$01FA 
    db $F1 
    dw $3A40,$01FC 
    db $F8 
    dw $3A43 

SamusSpritemaps_AtmosphericGraphics_Bubbles_5:
    dw $0003,$0001 
    db $F1 
    dw $3A40,$01FC 
    db $F6 
    dw $3A40,$01FA 
    db $EF 
    dw $3A40 

SamusSpritemaps_AtmosphericGraphics_Bubbles_6:
    dw $0003,$0001 
    db $EF 
    dw $7A40,$01FC 
    db $F4 
    dw $3A40,$01F9 
    db $EC 
    dw $3A40 

SamusSpritemaps_AtmosphericGraphics_Bubbles_7:
    dw $0002,$0002 
    db $EC 
    dw $7A40,$01FC 
    db $F0 
    dw $3A40 

SamusSpritemaps_AtmosphericGraphics_Bubbles_8:
    dw $0001,$01FC 
    db $EC 
    dw $BA40 

SamusSpritemaps_AtmosphericGraphics_DivingSplash_0:
    dw $0003,$C3F8 
    db $00 
    dw $3A9A,$0004 
    db $F8 
    dw $3A5E,$01F4 
    db $F8 
    dw $3A5E 

SamusSpritemaps_AtmosphericGraphics_DivingSplash_1:
    dw $0003,$C3F8 
    db $04 
    dw $7A9A,$0002 
    db $F8 
    dw $3ABA,$01F6 
    db $F8 
    dw $3ABA 

SamusSpritemaps_AtmosphericGraphics_DivingSplash_2:
    dw $0005,$C3F8 
    db $04 
    dw $BA9A,$0000 
    db $F4 
    dw $3ABA,$01F8 
    db $F3 
    dw $3ABA,$0000 
    db $F8 
    dw $3ACA,$01F8 
    db $F8 
    dw $3ACA 

SamusSpritemaps_AtmosphericGraphics_DivingSplash_3:
    dw $0005,$C3F8 
    db $03 
    dw $3A9C,$0000 
    db $F8 
    dw $3ACA,$0000 
    db $F0 
    dw $3ABA,$01F8 
    db $F8 
    dw $3ACA,$01F8 
    db $F0 
    dw $3ABA 

SamusSpritemaps_AtmosphericGraphics_DivingSplash_4:
    dw $0007,$C3F8 
    db $01 
    dw $BA9C,$0000 
    db $F2 
    dw $3ABA,$01F8 
    db $F1 
    dw $3ABA,$0000 
    db $EB 
    dw $3AC7,$01F8 
    db $EC 
    dw $3AC7,$0000 
    db $F8 
    dw $3ACA,$01F8 
    db $F8 
    dw $3ACA 

SamusSpritemaps_AtmosphericGraphics_DivingSplash_5:
    dw $0005,$C3F8 
    db $00 
    dw $7A9C,$0000 
    db $EE 
    dw $3AC7,$01F8 
    db $F0 
    dw $3AC7,$0001 
    db $F9 
    dw $3ABA,$01F7 
    db $F8 
    dw $3ABA 

SamusSpritemaps_AtmosphericGraphics_DivingSplash_6:
    dw $0004,$01F8 
    db $F2 
    dw $3AC7,$0000 
    db $F2 
    dw $3AC7,$0002 
    db $F8 
    dw $3A5E,$01F6 
    db $F9 
    dw $3A5E 

SamusSpritemaps_AtmosphericGraphics_DivingSplash_7:
    dw $0002,$0000 
    db $F6 
    dw $3AC7,$01F8 
    db $F6 
    dw $3AC7 

SamusSpritemaps_AtmosphericGraphics_DivingSplash_8:
    dw $0002,$0000 
    db $FC 
    dw $3AC7,$01F8 
    db $FA 
    dw $3AC7 

SamusTopHalfTilesAnimation_TilesDefinitionPointers:
    dw SamusTopTiles_Set0_CBEE 
    dw UNUSED_SamusTopTiles_Set1_92CCCE 
    dw SamusTopTiles_Set2_CDA0 
    dw SamusTopTiles_Set3_CE80 
    dw SamusTopTiles_Set4_CEF7 
    dw SamusTopTiles_Set5_CF6E 
    dw SamusTopTiles_Set6_CFE5 
    dw SamusTopTiles_Set7_D05C 
    dw SamusTopTiles_Set8_D0E8 
    dw SamusTopTiles_Set9_D12E 
    dw SamusTopTiles_SetA_D613 
    dw UNUSED_SamusTopTiles_SetB_92D6A6 
    dw SamusTopTiles_SetC_D74E 

SamusBottomHalfTilesAnimation_TilesDefinitionPointers:
    dw SamusBottomTiles_Set0_D19E 
    dw SamusBottomTiles_Set1_D27E 
    dw SamusBottomTiles_Set2_D35E 
    dw UNUSED_SamusBottomTiles_Set3_92D6D7 
    dw SamusBottomTiles_Set4_D406 
    dw SamusBottomTiles_Set5_D4A7 
    dw SamusBottomTiles_Set6_D54F 
    dw SamusBottomTiles_Set7_D786 
    dw SamusBottomTiles_Set8_D5F0 
    dw SamusBottomTiles_Set9_D79B 
    dw SamusBottomTiles_SetA_D605 

SamusTilesAnimation_AnimationDefinitionPointers:
    dw SamusTilesAnimation_AnimationDefinitions_EA24 
    dw SamusTilesAnimation_AnimationDefinitions_DB48 
    dw SamusTilesAnimation_AnimationDefinitions_DB6C 
    dw SamusTilesAnimation_AnimationDefinitions_E018 
    dw SamusTilesAnimation_AnimationDefinitions_E020 
    dw SamusTilesAnimation_AnimationDefinitions_E028 
    dw SamusTilesAnimation_AnimationDefinitions_E02C 
    dw SamusTilesAnimation_AnimationDefinitions_E030 
    dw SamusTilesAnimation_AnimationDefinitions_E034 
    dw SamusTilesAnimation_AnimationDefinitions_DC48 
    dw SamusTilesAnimation_AnimationDefinitions_DC70 
    dw SamusTilesAnimation_AnimationDefinitions_DC98 
    dw SamusTilesAnimation_AnimationDefinitions_DCC0 
    dw SamusTilesAnimation_AnimationDefinitions_DF28 
    dw SamusTilesAnimation_AnimationDefinitions_DF50 
    dw SamusTilesAnimation_AnimationDefinitions_DF78 
    dw SamusTilesAnimation_AnimationDefinitions_DFA0 
    dw SamusTilesAnimation_AnimationDefinitions_DFC8 
    dw SamusTilesAnimation_AnimationDefinitions_DFF0 
    dw SamusTilesAnimation_AnimationDefinitions_DD28 
    dw SamusTilesAnimation_AnimationDefinitions_DD30 
    dw SamusTilesAnimation_AnimationDefinitions_DD38 
    dw SamusTilesAnimation_AnimationDefinitions_DD40 
    dw SamusTilesAnimation_AnimationDefinitions_DD18 
    dw SamusTilesAnimation_AnimationDefinitions_DD20 
    dw SamusTilesAnimation_AnimationDefinitions_E5F8 
    dw SamusTilesAnimation_AnimationDefinitions_E628 
    dw SamusTilesAnimation_AnimationDefinitions_E658 
    dw SamusTilesAnimation_AnimationDefinitions_E688 
    dw SamusTilesAnimation_AnimationDefinitions_E508 
    dw SamusTilesAnimation_AnimationDefinitions_E558 
    dw SamusTilesAnimation_AnimationDefinitions_E580 
    dw SamusTilesAnimation_AnimationDefinitions_E5F8 
    dw SamusTilesAnimation_AnimationDefinitions_E5F8 
    dw SamusTilesAnimation_AnimationDefinitions_E5F8 
    dw SamusTilesAnimation_AnimationDefinitions_E5F8 
    dw SamusTilesAnimation_AnimationDefinitions_E5F8 
    dw SamusTilesAnimation_AnimationDefinitions_E798 
    dw SamusTilesAnimation_AnimationDefinitions_E7A4 
    dw SamusTilesAnimation_AnimationDefinitions_DE18 
    dw SamusTilesAnimation_AnimationDefinitions_DE3C 
    dw SamusTilesAnimation_AnimationDefinitions_DE60 
    dw SamusTilesAnimation_AnimationDefinitions_DE7C 
    dw SamusTilesAnimation_AnimationDefinitions_DE98 
    dw SamusTilesAnimation_AnimationDefinitions_DEA4 
    dw SamusTilesAnimation_AnimationDefinitions_DEB0 
    dw SamusTilesAnimation_AnimationDefinitions_DEB8 
    dw SamusTilesAnimation_AnimationDefinitions_E7E0 
    dw SamusTilesAnimation_AnimationDefinitions_E7EC 
    dw SamusTilesAnimation_AnimationDefinitions_E508 
    dw SamusTilesAnimation_AnimationDefinitions_E508 
    dw SamusTilesAnimation_AnimationDefinitions_E5F8 
    dw SamusTilesAnimation_AnimationDefinitions_E5F8 
    dw SamusTilesAnimation_AnimationDefinitions_E4B0 
    dw SamusTilesAnimation_AnimationDefinitions_E4B4 
    dw SamusTilesAnimation_AnimationDefinitions_E4B8 
    dw SamusTilesAnimation_AnimationDefinitions_E4C0 
    dw SamusTilesAnimation_AnimationDefinitions_E5F8 
    dw SamusTilesAnimation_AnimationDefinitions_E5F8 
    dw SamusTilesAnimation_AnimationDefinitions_E4B0 
    dw SamusTilesAnimation_AnimationDefinitions_E4B4 
    dw SamusTilesAnimation_AnimationDefinitions_E4C8 
    dw SamusTilesAnimation_AnimationDefinitions_E4D0 
    dw SamusTilesAnimation_AnimationDefinitions_E508 
    dw SamusTilesAnimation_AnimationDefinitions_E508 
    dw SamusTilesAnimation_AnimationDefinitions_E530 
    dw SamusTilesAnimation_AnimationDefinitions_E5F8 
    dw SamusTilesAnimation_AnimationDefinitions_E7E0 
    dw SamusTilesAnimation_AnimationDefinitions_E7EC 
    dw SamusTilesAnimation_AnimationDefinitions_E048 
    dw SamusTilesAnimation_AnimationDefinitions_E048 
    dw SamusTilesAnimation_AnimationDefinitions_DB48 
    dw SamusTilesAnimation_AnimationDefinitions_DB6C 
    dw SamusTilesAnimation_AnimationDefinitions_DCE8 
    dw SamusTilesAnimation_AnimationDefinitions_DD00 
    dw SamusTilesAnimation_AnimationDefinitions_DD78 
    dw SamusTilesAnimation_AnimationDefinitions_DD7C 
    dw SamusTilesAnimation_AnimationDefinitions_DD98 
    dw SamusTilesAnimation_AnimationDefinitions_DDB0 
    dw SamusTilesAnimation_AnimationDefinitions_DDC8 
    dw SamusTilesAnimation_AnimationDefinitions_DDF0 
    dw SamusTilesAnimation_AnimationDefinitions_DD48 
    dw SamusTilesAnimation_AnimationDefinitions_DD50 
    dw SamusTilesAnimation_AnimationDefinitions_E038 
    dw SamusTilesAnimation_AnimationDefinitions_E040 
    dw SamusTilesAnimation_AnimationDefinitions_DD80 
    dw SamusTilesAnimation_AnimationDefinitions_DD84 
    dw SamusTilesAnimation_AnimationDefinitions_DD88 
    dw SamusTilesAnimation_AnimationDefinitions_DD8C 
    dw SamusTilesAnimation_AnimationDefinitions_DD90 
    dw SamusTilesAnimation_AnimationDefinitions_DD94 
    dw SamusTilesAnimation_AnimationDefinitions_E048 
    dw SamusTilesAnimation_AnimationDefinitions_E04C 
    dw SamusTilesAnimation_AnimationDefinitions_E050 
    dw SamusTilesAnimation_AnimationDefinitions_E050 
    dw SamusTilesAnimation_AnimationDefinitions_E050 
    dw SamusTilesAnimation_AnimationDefinitions_E050 
    dw SamusTilesAnimation_AnimationDefinitions_E050 
    dw SamusTilesAnimation_AnimationDefinitions_E158 
    dw UNUSED_SamusTilesAnimation_AnimationDefinitions_92E260 
    dw UNUSED_SamusTilesAnimation_AnimationDefinitions_92E268 
    dw UNUSED_SamusTilesAnimation_AnimationDefinitions_92E270 
    dw UNUSED_SamusTilesAnimation_AnimationDefinitions_92E294 
    dw SamusTilesAnimation_AnimationDefinitions_DEC0 
    dw SamusTilesAnimation_AnimationDefinitions_DEDC 
    dw SamusTilesAnimation_AnimationDefinitions_DD58 
    dw SamusTilesAnimation_AnimationDefinitions_DD60 
    dw SamusTilesAnimation_AnimationDefinitions_DD68 
    dw SamusTilesAnimation_AnimationDefinitions_DD70 
    dw SamusTilesAnimation_AnimationDefinitions_DEF8 
    dw SamusTilesAnimation_AnimationDefinitions_DF04 
    dw SamusTilesAnimation_AnimationDefinitions_DF10 
    dw SamusTilesAnimation_AnimationDefinitions_DF1C 
    dw SamusTilesAnimation_AnimationDefinitions_E430 
    dw SamusTilesAnimation_AnimationDefinitions_E434 
    dw SamusTilesAnimation_AnimationDefinitions_E438 
    dw SamusTilesAnimation_AnimationDefinitions_E43C 
    dw SamusTilesAnimation_AnimationDefinitions_E450 
    dw SamusTilesAnimation_AnimationDefinitions_E468 
    dw SamusTilesAnimation_AnimationDefinitions_E480 
    dw SamusTilesAnimation_AnimationDefinitions_E498 
    dw SamusTilesAnimation_AnimationDefinitions_E5A8 
    dw SamusTilesAnimation_AnimationDefinitions_E5D0 
    dw SamusTilesAnimation_AnimationDefinitions_E5A8 
    dw SamusTilesAnimation_AnimationDefinitions_E5D0 
    dw SamusTilesAnimation_AnimationDefinitions_E5A8 
    dw SamusTilesAnimation_AnimationDefinitions_E5D0 
    dw SamusTilesAnimation_AnimationDefinitions_E5A8 
    dw SamusTilesAnimation_AnimationDefinitions_E5D0 
    dw SamusTilesAnimation_AnimationDefinitions_E6B8 
    dw SamusTilesAnimation_AnimationDefinitions_E728 
    dw SamusTilesAnimation_AnimationDefinitions_E2B8 
    dw SamusTilesAnimation_AnimationDefinitions_E374 
    dw SamusTilesAnimation_AnimationDefinitions_E440 
    dw SamusTilesAnimation_AnimationDefinitions_E448 
    dw SamusTilesAnimation_AnimationDefinitions_E7E0 
    dw SamusTilesAnimation_AnimationDefinitions_E7EC 
    dw SamusTilesAnimation_AnimationDefinitions_DB48 
    dw SamusTilesAnimation_AnimationDefinitions_DB6C 
    dw SamusTilesAnimation_AnimationDefinitions_E7B0 
    dw SamusTilesAnimation_AnimationDefinitions_E7BC 
    dw SamusTilesAnimation_AnimationDefinitions_E7C8 
    dw SamusTilesAnimation_AnimationDefinitions_E7D4 
    dw SamusTilesAnimation_AnimationDefinitions_E7F8 
    dw SamusTilesAnimation_AnimationDefinitions_E804 
    dw SamusTilesAnimation_AnimationDefinitions_E810 
    dw SamusTilesAnimation_AnimationDefinitions_E81C 
    dw SamusTilesAnimation_AnimationDefinitions_E7F8 
    dw SamusTilesAnimation_AnimationDefinitions_E804 
    dw SamusTilesAnimation_AnimationDefinitions_E810 
    dw SamusTilesAnimation_AnimationDefinitions_E81C 
    dw SamusTilesAnimation_AnimationDefinitions_E7F8 
    dw SamusTilesAnimation_AnimationDefinitions_E804 
    dw SamusTilesAnimation_AnimationDefinitions_E810 
    dw SamusTilesAnimation_AnimationDefinitions_E81C 
    dw SamusTilesAnimation_AnimationDefinitions_EBA4 
    dw SamusTilesAnimation_AnimationDefinitions_E7B0 
    dw SamusTilesAnimation_AnimationDefinitions_E7BC 
    dw SamusTilesAnimation_AnimationDefinitions_E7F8 
    dw SamusTilesAnimation_AnimationDefinitions_E804 
    dw SamusTilesAnimation_AnimationDefinitions_E7F8 
    dw SamusTilesAnimation_AnimationDefinitions_E804 
    dw SamusTilesAnimation_AnimationDefinitions_E7F8 
    dw SamusTilesAnimation_AnimationDefinitions_E804 
    dw SamusTilesAnimation_AnimationDefinitions_DB90 
    dw SamusTilesAnimation_AnimationDefinitions_DB98 
    dw SamusTilesAnimation_AnimationDefinitions_DBA0 
    dw SamusTilesAnimation_AnimationDefinitions_DBAC 
    dw SamusTilesAnimation_AnimationDefinitions_DB48 
    dw SamusTilesAnimation_AnimationDefinitions_DB6C 
    dw SamusTilesAnimation_AnimationDefinitions_E030 
    dw SamusTilesAnimation_AnimationDefinitions_E034 
    dw SamusTilesAnimation_AnimationDefinitions_DD28 
    dw SamusTilesAnimation_AnimationDefinitions_DD30 
    dw SamusTilesAnimation_AnimationDefinitions_DD18 
    dw SamusTilesAnimation_AnimationDefinitions_DD20 
    dw SamusTilesAnimation_AnimationDefinitions_DD68 
    dw SamusTilesAnimation_AnimationDefinitions_DD70 
    dw SamusTilesAnimation_AnimationDefinitions_E050 
    dw SamusTilesAnimation_AnimationDefinitions_E158 
    dw SamusTilesAnimation_AnimationDefinitions_DE18 
    dw SamusTilesAnimation_AnimationDefinitions_DE3C 
    dw SamusTilesAnimation_AnimationDefinitions_E438 
    dw SamusTilesAnimation_AnimationDefinitions_E43C 
    dw SamusTilesAnimation_AnimationDefinitions_E048 
    dw SamusTilesAnimation_AnimationDefinitions_E04C 
    dw SamusTilesAnimation_AnimationDefinitions_E838 
    dw SamusTilesAnimation_AnimationDefinitions_E83C 
    dw SamusTilesAnimation_AnimationDefinitions_E840 
    dw SamusTilesAnimation_AnimationDefinitions_E844 
    dw SamusTilesAnimation_AnimationDefinitions_E860 
    dw SamusTilesAnimation_AnimationDefinitions_E798 
    dw SamusTilesAnimation_AnimationDefinitions_E7A4 
    dw SamusTilesAnimation_AnimationDefinitions_E7B0 
    dw SamusTilesAnimation_AnimationDefinitions_E7BC 
    dw SamusTilesAnimation_AnimationDefinitions_E7C8 
    dw SamusTilesAnimation_AnimationDefinitions_E7D4 
    dw SamusTilesAnimation_AnimationDefinitions_E530 
    dw SamusTilesAnimation_AnimationDefinitions_E798 
    dw SamusTilesAnimation_AnimationDefinitions_DD98 
    dw SamusTilesAnimation_AnimationDefinitions_DDB0 
    dw SamusTilesAnimation_AnimationDefinitions_E880 
    dw SamusTilesAnimation_AnimationDefinitions_E884 
    dw SamusTilesAnimation_AnimationDefinitions_E878 
    dw SamusTilesAnimation_AnimationDefinitions_E87C 
    dw SamusTilesAnimation_AnimationDefinitions_E888 
    dw SamusTilesAnimation_AnimationDefinitions_E88C 
    dw SamusTilesAnimation_AnimationDefinitions_E028 
    dw SamusTilesAnimation_AnimationDefinitions_E02C 
    dw SamusTilesAnimation_AnimationDefinitions_E030 
    dw SamusTilesAnimation_AnimationDefinitions_E034 
    dw SamusTilesAnimation_AnimationDefinitions_E890 
    dw SamusTilesAnimation_AnimationDefinitions_E8CC 
    dw SamusTilesAnimation_AnimationDefinitions_DBF8 
    dw SamusTilesAnimation_AnimationDefinitions_DC0C 
    dw SamusTilesAnimation_AnimationDefinitions_E908 
    dw SamusTilesAnimation_AnimationDefinitions_E920 
    dw SamusTilesAnimation_AnimationDefinitions_DC20 
    dw SamusTilesAnimation_AnimationDefinitions_DC34 
    dw UNUSED_SamusTilesAnimation_AnimationDefinitions_92E4D8 
    dw UNUSED_SamusTilesAnimation_AnimationDefinitions_92E4E4 
    dw UNUSED_SamusTilesAnimation_AnimationDefinitions_92E4F0 
    dw UNUSED_SamusTilesAnimation_AnimationDefinitions_92E4FC 
    dw SamusTilesAnimation_AnimationDefinitions_E530 
    dw SamusTilesAnimation_AnimationDefinitions_DBB8 
    dw SamusTilesAnimation_AnimationDefinitions_DBC0 
    dw SamusTilesAnimation_AnimationDefinitions_DBC8 
    dw SamusTilesAnimation_AnimationDefinitions_DBD0 
    dw SamusTilesAnimation_AnimationDefinitions_DBD8 
    dw SamusTilesAnimation_AnimationDefinitions_DBE0 
    dw SamusTilesAnimation_AnimationDefinitions_DBE8 
    dw SamusTilesAnimation_AnimationDefinitions_DBF0 
    dw SamusTilesAnimation_AnimationDefinitions_E938 
    dw SamusTilesAnimation_AnimationDefinitions_E974 
    dw SamusTilesAnimation_AnimationDefinitions_E9F4 
    dw SamusTilesAnimation_AnimationDefinitions_EA0C 
    dw SamusTilesAnimation_AnimationDefinitions_E828 
    dw SamusTilesAnimation_AnimationDefinitions_E82C 
    dw SamusTilesAnimation_AnimationDefinitions_E830 
    dw SamusTilesAnimation_AnimationDefinitions_E834 
    dw SamusTilesAnimation_AnimationDefinitions_E848 
    dw SamusTilesAnimation_AnimationDefinitions_DD80 
    dw SamusTilesAnimation_AnimationDefinitions_DD84 
    dw SamusTilesAnimation_AnimationDefinitions_DD88 
    dw SamusTilesAnimation_AnimationDefinitions_DD8C 
    dw SamusTilesAnimation_AnimationDefinitions_DD90 
    dw SamusTilesAnimation_AnimationDefinitions_DD94 
    dw SamusTilesAnimation_AnimationDefinitions_DD80 
    dw SamusTilesAnimation_AnimationDefinitions_DD84 
    dw SamusTilesAnimation_AnimationDefinitions_DD88 
    dw SamusTilesAnimation_AnimationDefinitions_DD8C 
    dw SamusTilesAnimation_AnimationDefinitions_DD90 
    dw SamusTilesAnimation_AnimationDefinitions_DD94 

SamusTilesAnimation_AnimationDefinitions_DB48:
    db $07,$0C,$00,$06,$07,$0D,$00,$0E,$07,$0E,$00,$0F,$07,$0D,$00,$0E 
    db $00,$00,$00,$00,$07,$0C,$00,$06,$07,$0D,$00,$0E,$07,$12,$00,$0F 
    db $07,$0D,$00,$0E 

SamusTilesAnimation_AnimationDefinitions_DB6C:
    db $07,$0F,$00,$06,$07,$10,$00,$10,$07,$11,$00,$1D,$07,$10,$00,$10 
    db $00,$00,$00,$00,$07,$0F,$00,$06,$07,$10,$00,$10,$07,$13,$00,$1D 
    db $07,$10,$00,$10 

SamusTilesAnimation_AnimationDefinitions_DB90:
    db $02,$00,$01,$06,$02,$04,$00,$06 

SamusTilesAnimation_AnimationDefinitions_DB98:
    db $02,$01,$01,$07,$02,$05,$00,$06 

SamusTilesAnimation_AnimationDefinitions_DBA0:
    db $02,$04,$01,$19,$02,$00,$01,$06,$02,$04,$00,$06 

SamusTilesAnimation_AnimationDefinitions_DBAC:
    db $02,$05,$01,$1A,$02,$01,$01,$07,$02,$05,$00,$06 

SamusTilesAnimation_AnimationDefinitions_DBB8:
    db $00,$16,$01,$06,$00,$16,$00,$06 

SamusTilesAnimation_AnimationDefinitions_DBC0:
    db $00,$17,$01,$07,$00,$17,$00,$06 

SamusTilesAnimation_AnimationDefinitions_DBC8:
    db $00,$12,$01,$06,$00,$12,$00,$06 

SamusTilesAnimation_AnimationDefinitions_DBD0:
    db $00,$13,$01,$07,$00,$13,$00,$06 

SamusTilesAnimation_AnimationDefinitions_DBD8:
    db $00,$0E,$01,$06,$00,$0E,$00,$06 

SamusTilesAnimation_AnimationDefinitions_DBE0:
    db $00,$0F,$01,$07,$00,$0F,$00,$06 

SamusTilesAnimation_AnimationDefinitions_DBE8:
    db $00,$10,$01,$06,$00,$10,$00,$06 

SamusTilesAnimation_AnimationDefinitions_DBF0:
    db $00,$11,$01,$07,$00,$11,$00,$06 

SamusTilesAnimation_AnimationDefinitions_DBF8:
    db $02,$09,$00,$06,$02,$08,$00,$06,$00,$10,$00,$06,$02,$0A,$00,$06 
    db $02,$0B,$00,$06 

SamusTilesAnimation_AnimationDefinitions_DC0C:
    db $02,$0D,$00,$06,$02,$0C,$00,$06,$00,$11,$00,$06,$02,$0E,$00,$06 
    db $02,$0F,$00,$06 

SamusTilesAnimation_AnimationDefinitions_DC20:
    db $02,$09,$00,$07,$02,$08,$00,$07,$00,$10,$00,$07,$02,$0A,$00,$07 
    db $02,$0B,$00,$07 

SamusTilesAnimation_AnimationDefinitions_DC34:
    db $02,$0D,$00,$07,$02,$0C,$00,$07,$00,$11,$00,$07,$02,$0E,$00,$07 
    db $02,$0F,$00,$07 

SamusTilesAnimation_AnimationDefinitions_DC48:
    db $00,$00,$00,$00,$01,$0D,$00,$08,$00,$02,$00,$01,$00,$03,$00,$09 
    db $00,$01,$00,$02,$00,$00,$00,$03,$01,$0E,$00,$0A,$00,$05,$00,$04 
    db $00,$18,$00,$0B,$00,$04,$00,$05 

SamusTilesAnimation_AnimationDefinitions_DC70:
    db $00,$06,$00,$00,$01,$0F,$00,$08,$00,$08,$00,$01,$00,$09,$00,$09 
    db $00,$07,$00,$02,$00,$06,$00,$03,$01,$10,$00,$0A,$00,$0B,$00,$04 
    db $00,$19,$00,$0B,$00,$0A,$00,$05 

SamusTilesAnimation_AnimationDefinitions_DC98:
    db $09,$00,$00,$00,$09,$0E,$00,$08,$09,$02,$00,$01,$09,$03,$00,$09 
    db $09,$01,$00,$02,$09,$00,$00,$03,$09,$04,$00,$0A,$09,$05,$00,$04 
    db $09,$0C,$00,$0B,$09,$04,$00,$05 

SamusTilesAnimation_AnimationDefinitions_DCC0:
    db $09,$06,$00,$00,$09,$0F,$00,$08,$09,$09,$00,$01,$09,$08,$00,$09 
    db $09,$07,$00,$02,$09,$06,$00,$03,$09,$0A,$00,$0A,$09,$0D,$00,$04 
    db $09,$0B,$00,$0B,$09,$0A,$00,$05 

SamusTilesAnimation_AnimationDefinitions_DCE8:
    db $00,$11,$01,$03,$02,$1B,$01,$04,$02,$1B,$01,$15,$00,$11,$01,$00 
    db $02,$1B,$01,$05,$02,$1B,$01,$16 

SamusTilesAnimation_AnimationDefinitions_DD00:
    db $00,$10,$01,$03,$02,$1A,$01,$04,$02,$1A,$01,$17,$00,$10,$01,$00 
    db $02,$1A,$01,$05,$02,$1A,$01,$18 

SamusTilesAnimation_AnimationDefinitions_DD18:
    db $00,$0C,$01,$0A,$01,$1A,$01,$11 

SamusTilesAnimation_AnimationDefinitions_DD20:
    db $00,$0D,$01,$0B,$01,$1B,$01,$12 

SamusTilesAnimation_AnimationDefinitions_DD28:
    db $00,$10,$01,$0A,$00,$10,$01,$19 

SamusTilesAnimation_AnimationDefinitions_DD30:
    db $00,$11,$01,$0B,$00,$11,$01,$1A 

SamusTilesAnimation_AnimationDefinitions_DD38:
    db $00,$12,$01,$0A,$00,$16,$00,$13 

SamusTilesAnimation_AnimationDefinitions_DD40:
    db $00,$13,$01,$0B,$00,$17,$00,$14 

SamusTilesAnimation_AnimationDefinitions_DD48:
    db $00,$10,$01,$0A,$00,$10,$01,$19 

SamusTilesAnimation_AnimationDefinitions_DD50:
    db $00,$11,$01,$0B,$00,$11,$01,$1A 

SamusTilesAnimation_AnimationDefinitions_DD58:
    db $00,$1A,$01,$0A,$00,$1A,$00,$13 

SamusTilesAnimation_AnimationDefinitions_DD60:
    db $00,$1B,$01,$0B,$00,$1B,$00,$14 

SamusTilesAnimation_AnimationDefinitions_DD68:
    db $00,$0C,$01,$0A,$00,$0C,$01,$19 

SamusTilesAnimation_AnimationDefinitions_DD70:
    db $00,$0D,$01,$0B,$00,$0D,$01,$1A 

SamusTilesAnimation_AnimationDefinitions_DD78:
    db $02,$00,$01,$06 

SamusTilesAnimation_AnimationDefinitions_DD7C:
    db $02,$01,$01,$07 

SamusTilesAnimation_AnimationDefinitions_DD80:
    db $00,$16,$01,$06 

SamusTilesAnimation_AnimationDefinitions_DD84:
    db $00,$17,$01,$07 

SamusTilesAnimation_AnimationDefinitions_DD88:
    db $00,$12,$01,$06 

SamusTilesAnimation_AnimationDefinitions_DD8C:
    db $00,$13,$01,$07 

SamusTilesAnimation_AnimationDefinitions_DD90:
    db $00,$0E,$01,$06 

SamusTilesAnimation_AnimationDefinitions_DD94:
    db $00,$0F,$01,$07 

SamusTilesAnimation_AnimationDefinitions_DD98:
    db $00,$04,$00,$03,$00,$05,$01,$0E,$00,$04,$01,$08,$00,$00,$01,$08 
    db $00,$01,$01,$0A,$00,$14,$01,$0C 

SamusTilesAnimation_AnimationDefinitions_DDB0:
    db $00,$0A,$00,$03,$00,$0B,$01,$0F,$00,$0A,$01,$09,$00,$06,$01,$09 
    db $00,$07,$01,$0B,$00,$15,$01,$0D 

SamusTilesAnimation_AnimationDefinitions_DDC8:
    db $02,$05,$00,$11,$02,$05,$01,$0B,$0A,$0F,$00,$00,$0A,$0E,$00,$00 
    db $0A,$0D,$00,$00,$0A,$0C,$00,$00,$0A,$0B,$00,$00,$0A,$0A,$00,$00 
    db $0A,$09,$00,$00,$02,$1F,$01,$1A 

SamusTilesAnimation_AnimationDefinitions_DDF0:
    db $02,$04,$00,$12,$02,$04,$01,$0A,$0A,$0F,$00,$00,$0A,$0E,$00,$00 
    db $0A,$0D,$00,$00,$0A,$0C,$00,$00,$0A,$0B,$00,$00,$0A,$0A,$00,$00 
    db $0A,$09,$00,$00,$02,$1D,$01,$19 

SamusTilesAnimation_AnimationDefinitions_DE18:
    db $07,$0C,$00,$07,$07,$0D,$00,$07,$07,$0E,$00,$07,$07,$0D,$00,$07 
    db $00,$00,$00,$00,$07,$0C,$00,$07,$07,$0D,$00,$07,$07,$12,$00,$07 
    db $07,$0D,$00,$07 

SamusTilesAnimation_AnimationDefinitions_DE3C:
    db $07,$0F,$00,$07,$07,$10,$00,$07,$07,$11,$00,$07,$07,$10,$00,$07 
    db $00,$00,$00,$00,$07,$0F,$00,$07,$07,$10,$00,$07,$07,$13,$00,$07 
    db $07,$10,$00,$07 

SamusTilesAnimation_AnimationDefinitions_DE60:
    db $02,$04,$01,$0A,$02,$1C,$01,$0C,$02,$1D,$01,$0C,$00,$00,$00,$00 
    db $00,$00,$00,$00,$02,$1C,$01,$0A,$02,$04,$01,$19 

SamusTilesAnimation_AnimationDefinitions_DE7C:
    db $02,$05,$01,$0B,$02,$1E,$01,$0D,$02,$1F,$01,$0D,$00,$00,$00,$00 
    db $00,$00,$00,$00,$02,$1E,$01,$0B,$02,$05,$01,$1A 

SamusTilesAnimation_AnimationDefinitions_DE98:
    db $00,$12,$01,$0A,$00,$16,$01,$0C,$00,$16,$01,$19 

SamusTilesAnimation_AnimationDefinitions_DEA4:
    db $00,$13,$01,$0B,$00,$17,$01,$0D,$00,$17,$01,$1A 

SamusTilesAnimation_AnimationDefinitions_DEB0:
    db $00,$0C,$01,$0A,$01,$1A,$01,$11 

SamusTilesAnimation_AnimationDefinitions_DEB8:
    db $00,$0D,$01,$0B,$01,$1B,$01,$12 

SamusTilesAnimation_AnimationDefinitions_DEC0:
    db $00,$10,$01,$0A,$00,$10,$01,$0C,$00,$10,$01,$0C,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$10,$01,$0A,$00,$10,$01,$19 

SamusTilesAnimation_AnimationDefinitions_DEDC:
    db $00,$11,$01,$0B,$00,$11,$01,$0D,$00,$11,$01,$0D,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$11,$01,$0B,$00,$11,$01,$1A 

SamusTilesAnimation_AnimationDefinitions_DEF8:
    db $00,$1A,$01,$0A,$00,$1A,$01,$0C,$00,$1A,$01,$19 

SamusTilesAnimation_AnimationDefinitions_DF04:
    db $00,$1B,$01,$0B,$00,$1B,$01,$0D,$00,$1B,$01,$1A 

SamusTilesAnimation_AnimationDefinitions_DF10:
    db $00,$0C,$01,$0A,$00,$0C,$01,$0C,$00,$0C,$01,$19 

SamusTilesAnimation_AnimationDefinitions_DF1C:
    db $00,$0D,$01,$0B,$00,$0D,$01,$0D,$00,$0D,$01,$1A 

SamusTilesAnimation_AnimationDefinitions_DF28:
    db $00,$16,$00,$00,$00,$16,$00,$08,$02,$0E,$00,$01,$02,$1E,$00,$09 
    db $02,$0E,$00,$02,$00,$16,$00,$03,$00,$16,$00,$0A,$02,$0E,$00,$04 
    db $02,$1E,$00,$0B,$02,$0E,$00,$05 

SamusTilesAnimation_AnimationDefinitions_DF50:
    db $00,$17,$00,$00,$00,$17,$00,$08,$02,$0F,$00,$01,$02,$1F,$00,$09 
    db $02,$0F,$00,$02,$00,$17,$00,$03,$00,$17,$00,$0A,$02,$0F,$00,$04 
    db $02,$1F,$00,$0B,$02,$0F,$00,$05 

SamusTilesAnimation_AnimationDefinitions_DF78:
    db $00,$1A,$00,$00,$00,$1A,$00,$08,$02,$10,$00,$01,$02,$16,$00,$09 
    db $02,$10,$00,$02,$00,$1A,$00,$03,$00,$1A,$00,$0A,$02,$10,$00,$04 
    db $02,$16,$00,$0B,$02,$10,$00,$05 

SamusTilesAnimation_AnimationDefinitions_DFA0:
    db $00,$1B,$00,$00,$00,$1B,$00,$08,$02,$11,$00,$01,$02,$17,$00,$09 
    db $02,$11,$00,$02,$00,$1B,$00,$03,$00,$1B,$00,$0A,$02,$11,$00,$04 
    db $02,$17,$00,$0B,$02,$11,$00,$05 

SamusTilesAnimation_AnimationDefinitions_DFC8:
    db $00,$0C,$00,$00,$00,$0C,$00,$08,$02,$06,$00,$01,$02,$18,$00,$09 
    db $02,$06,$00,$02,$00,$0C,$00,$03,$00,$0C,$00,$0A,$02,$06,$00,$04 
    db $02,$18,$00,$0B,$02,$06,$00,$05 

SamusTilesAnimation_AnimationDefinitions_DFF0:
    db $00,$0D,$00,$00,$00,$0D,$00,$08,$02,$07,$00,$01,$02,$19,$00,$09 
    db $02,$07,$00,$02,$00,$0D,$00,$03,$00,$0D,$00,$0A,$02,$07,$00,$04 
    db $02,$19,$00,$0B,$02,$07,$00,$05 

SamusTilesAnimation_AnimationDefinitions_E018:
    db $00,$12,$0A,$00,$00,$16,$0A,$00 

SamusTilesAnimation_AnimationDefinitions_E020:
    db $00,$13,$0A,$01,$00,$17,$0A,$01 

SamusTilesAnimation_AnimationDefinitions_E028:
    db $00,$12,$0A,$00 

SamusTilesAnimation_AnimationDefinitions_E02C:
    db $00,$13,$0A,$01 

SamusTilesAnimation_AnimationDefinitions_E030:
    db $00,$0E,$0A,$00 

SamusTilesAnimation_AnimationDefinitions_E034:
    db $00,$0F,$0A,$01 

SamusTilesAnimation_AnimationDefinitions_E038:
    db $00,$1D,$01,$0C,$00,$1D,$01,$1B 

SamusTilesAnimation_AnimationDefinitions_E040:
    db $00,$1C,$01,$0D,$00,$1C,$01,$1C 

SamusTilesAnimation_AnimationDefinitions_E048:
    db $01,$0C,$00,$1A 

SamusTilesAnimation_AnimationDefinitions_E04C:
    db $01,$0B,$00,$19 

SamusTilesAnimation_AnimationDefinitions_E050:
    db $05,$08,$04,$05,$05,$07,$04,$04,$05,$06,$04,$03,$05,$05,$04,$02 
    db $05,$04,$04,$02,$05,$03,$04,$01,$05,$02,$04,$01,$05,$01,$04,$00 
    db $05,$00,$04,$00,$03,$0F,$04,$00,$03,$0E,$02,$09,$03,$0D,$02,$09 
    db $03,$0C,$02,$08,$03,$0B,$02,$08,$03,$0A,$02,$07,$03,$09,$02,$06 
    db $03,$08,$02,$05,$03,$07,$02,$04,$03,$06,$02,$03,$03,$05,$02,$02 
    db $03,$04,$02,$02,$03,$03,$02,$01,$03,$02,$02,$01,$03,$01,$02,$00 
    db $03,$00,$02,$00,$05,$0F,$02,$00,$05,$0E,$04,$09,$05,$0D,$04,$09 
    db $05,$0C,$04,$08,$05,$0B,$04,$08,$05,$0A,$04,$07,$05,$09,$04,$06 
    db $05,$08,$04,$12,$05,$07,$04,$11,$05,$06,$04,$10,$05,$05,$04,$0F 
    db $05,$04,$04,$0F,$05,$03,$04,$0E,$05,$02,$04,$0E,$05,$01,$04,$0D 
    db $05,$00,$04,$0D,$03,$0F,$04,$0D,$03,$0E,$02,$16,$03,$0D,$02,$16 
    db $03,$0C,$02,$15,$03,$0B,$02,$15,$03,$0A,$02,$14,$03,$09,$02,$13 
    db $03,$08,$02,$12,$03,$07,$02,$11,$03,$06,$02,$10,$03,$05,$02,$0F 
    db $03,$04,$02,$0F,$03,$03,$02,$0E,$03,$02,$02,$0E,$03,$01,$02,$0D 
    db $03,$00,$02,$0D,$05,$0F,$02,$0D,$05,$0E,$04,$15,$05,$0D,$04,$15 
    db $05,$0C,$04,$14,$05,$0B,$04,$14,$05,$0A,$04,$13,$05,$09,$04,$12 
    db $03,$08,$02,$0B,$03,$08,$02,$0C 

SamusTilesAnimation_AnimationDefinitions_E158:
    db $06,$08,$06,$05,$06,$09,$06,$06,$06,$0A,$06,$07,$06,$0B,$06,$08 
    db $06,$0C,$06,$08,$06,$0D,$06,$09,$06,$0E,$06,$09,$06,$0F,$05,$00 
    db $04,$00,$05,$00,$04,$01,$05,$00,$04,$02,$05,$01,$04,$03,$05,$01 
    db $04,$04,$05,$02,$04,$05,$05,$02,$04,$06,$05,$03,$04,$07,$05,$04 
    db $04,$08,$05,$05,$04,$09,$05,$06,$04,$0A,$05,$07,$04,$0B,$05,$08 
    db $04,$0C,$05,$08,$04,$0D,$05,$09,$04,$0E,$05,$09,$04,$0F,$06,$00 
    db $06,$00,$06,$00,$06,$01,$06,$00,$06,$02,$06,$01,$06,$03,$06,$01 
    db $06,$04,$06,$02,$06,$05,$06,$02,$06,$06,$06,$03,$06,$07,$06,$04 
    db $06,$08,$06,$12,$06,$09,$06,$13,$06,$0A,$06,$14,$06,$0B,$06,$15 
    db $06,$0C,$06,$15,$06,$0D,$06,$16,$06,$0E,$06,$16,$06,$0F,$05,$0D 
    db $04,$00,$05,$0D,$04,$01,$05,$0D,$04,$02,$05,$0E,$04,$03,$05,$0E 
    db $04,$04,$05,$0F,$04,$05,$05,$0F,$04,$06,$05,$10,$04,$07,$05,$11 
    db $04,$08,$05,$12,$04,$09,$05,$13,$04,$0A,$05,$14,$04,$0B,$05,$15 
    db $04,$0C,$05,$15,$04,$0D,$05,$16,$04,$0E,$05,$16,$04,$0F,$06,$0D 
    db $06,$00,$06,$0D,$06,$01,$06,$0D,$06,$02,$06,$0E,$06,$03,$06,$0E 
    db $06,$04,$06,$0F,$06,$05,$06,$0F,$06,$06,$06,$10,$06,$07,$06,$11 
    db $04,$08,$05,$0B,$04,$08,$05,$0C 

UNUSED_SamusTilesAnimation_AnimationDefinitions_92E260:
    db $01,$14,$01,$15,$01,$0C,$00,$1A 

UNUSED_SamusTilesAnimation_AnimationDefinitions_92E268:
    db $01,$15,$01,$16,$01,$0B,$00,$19 

UNUSED_SamusTilesAnimation_AnimationDefinitions_92E270:
    db $01,$12,$01,$13,$0A,$10,$00,$00,$0A,$11,$00,$00,$0A,$12,$00,$00 
    db $0A,$13,$00,$00,$0A,$14,$00,$00,$0A,$15,$00,$00,$0A,$16,$00,$00 
    db $0A,$17,$00,$00 

UNUSED_SamusTilesAnimation_AnimationDefinitions_92E294:
    db $01,$13,$01,$14,$0A,$10,$00,$00,$0A,$11,$00,$00,$0A,$12,$00,$00 
    db $0A,$13,$00,$00,$0A,$14,$00,$00,$0A,$15,$00,$00,$0A,$16,$00,$00 
    db $0A,$17,$00,$00 

SamusTilesAnimation_AnimationDefinitions_E2B8:
    db $01,$12,$01,$13,$02,$04,$01,$19,$00,$00,$00,$00,$0A,$08,$00,$00 
    db $0A,$09,$00,$00,$0A,$0A,$00,$00,$0A,$0B,$00,$00,$0A,$0C,$00,$00 
    db $0A,$0D,$00,$00,$0A,$0E,$00,$00,$0A,$0F,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$0A,$14,$09,$00,$0A,$14,$09,$01,$0A,$14,$09,$02 
    db $0A,$14,$09,$03,$0A,$14,$09,$04,$0A,$14,$09,$05,$0A,$14,$09,$06 
    db $0A,$14,$09,$07,$00,$00,$00,$00,$00,$00,$00,$00,$0A,$10,$09,$00 
    db $0A,$10,$09,$01,$0A,$10,$09,$02,$0A,$14,$09,$03,$0A,$14,$09,$04 
    db $0A,$14,$09,$05,$0A,$11,$09,$06,$0A,$11,$09,$07,$0A,$11,$09,$00 
    db $0A,$14,$09,$01,$0A,$14,$09,$02,$0A,$14,$09,$03,$0A,$12,$09,$04 
    db $0A,$12,$09,$05,$0A,$12,$09,$06,$0A,$14,$09,$07,$0A,$14,$09,$00 
    db $0A,$14,$09,$01,$0A,$13,$09,$02,$0A,$13,$09,$03,$0A,$13,$09,$04 
    db $0A,$14,$09,$05,$0A,$14,$09,$06,$0A,$14,$09,$07 

SamusTilesAnimation_AnimationDefinitions_E374:
    db $01,$13,$01,$14,$02,$05,$01,$1A,$00,$00,$00,$00,$0A,$08,$00,$00 
    db $0A,$09,$00,$00,$0A,$0A,$00,$00,$0A,$0B,$00,$00,$0A,$0C,$00,$00 
    db $0A,$0D,$00,$00,$0A,$0E,$00,$00,$0A,$0F,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$0A,$14,$09,$00,$0A,$14,$09,$01,$0A,$14,$09,$02 
    db $0A,$14,$09,$03,$0A,$14,$09,$04,$0A,$14,$09,$05,$0A,$14,$09,$06 
    db $0A,$14,$09,$07,$00,$00,$00,$00,$00,$00,$00,$00,$0A,$10,$09,$00 
    db $0A,$10,$09,$01,$0A,$10,$09,$02,$0A,$14,$09,$03,$0A,$14,$09,$04 
    db $0A,$14,$09,$05,$0A,$11,$09,$06,$0A,$11,$09,$07,$0A,$11,$09,$00 
    db $0A,$14,$09,$01,$0A,$14,$09,$02,$0A,$14,$09,$03,$0A,$12,$09,$04 
    db $0A,$12,$09,$05,$0A,$12,$09,$06,$0A,$14,$09,$07,$0A,$14,$09,$00 
    db $0A,$14,$09,$01,$0A,$13,$09,$02,$0A,$13,$09,$03,$0A,$13,$09,$04 
    db $0A,$14,$09,$05,$0A,$14,$09,$06,$0A,$14,$09,$07 

SamusTilesAnimation_AnimationDefinitions_E430:
    db $00,$12,$00,$07 

SamusTilesAnimation_AnimationDefinitions_E434:
    db $00,$13,$00,$07 

SamusTilesAnimation_AnimationDefinitions_E438:
    db $00,$0E,$00,$07 

SamusTilesAnimation_AnimationDefinitions_E43C:
    db $00,$0F,$00,$07 

SamusTilesAnimation_AnimationDefinitions_E440:
    db $00,$12,$00,$07,$00,$16,$00,$07 

SamusTilesAnimation_AnimationDefinitions_E448:
    db $00,$13,$00,$07,$00,$17,$00,$07 

SamusTilesAnimation_AnimationDefinitions_E450:
    db $00,$1B,$01,$03,$02,$11,$01,$04,$02,$11,$01,$17,$00,$1B,$01,$00 
    db $02,$11,$01,$05,$02,$11,$01,$18 

SamusTilesAnimation_AnimationDefinitions_E468:
    db $00,$1A,$01,$03,$02,$10,$01,$04,$02,$10,$01,$17,$00,$1A,$01,$00 
    db $02,$10,$01,$05,$02,$10,$01,$18 

SamusTilesAnimation_AnimationDefinitions_E480:
    db $00,$0D,$01,$03,$02,$07,$01,$04,$02,$07,$01,$17,$00,$0D,$01,$00 
    db $02,$07,$01,$05,$02,$07,$01,$18 

SamusTilesAnimation_AnimationDefinitions_E498:
    db $00,$0C,$01,$03,$02,$06,$01,$04,$02,$06,$01,$17,$00,$0C,$01,$00 
    db $02,$06,$01,$05,$02,$06,$01,$18 

SamusTilesAnimation_AnimationDefinitions_E4B0:
    db $00,$10,$01,$06 

SamusTilesAnimation_AnimationDefinitions_E4B4:
    db $00,$11,$01,$07 

SamusTilesAnimation_AnimationDefinitions_E4B8:
    db $0B,$06,$00,$00,$0B,$05,$00,$00 

SamusTilesAnimation_AnimationDefinitions_E4C0:
    db $0B,$04,$00,$00,$0B,$03,$00,$00 

SamusTilesAnimation_AnimationDefinitions_E4C8:
    db $0B,$05,$00,$00,$0B,$06,$00,$00 

SamusTilesAnimation_AnimationDefinitions_E4D0:
    db $0B,$03,$00,$00,$0B,$04,$00,$00 

UNUSED_SamusTilesAnimation_AnimationDefinitions_92E4D8:
    db $00,$10,$01,$06,$0B,$06,$00,$00,$0B,$05,$00,$00 

UNUSED_SamusTilesAnimation_AnimationDefinitions_92E4E4:
    db $00,$11,$01,$06,$0B,$04,$00,$00,$0B,$03,$00,$00 

UNUSED_SamusTilesAnimation_AnimationDefinitions_92E4F0:
    db $0B,$05,$00,$00,$0B,$06,$00,$00,$00,$10,$01,$06 

UNUSED_SamusTilesAnimation_AnimationDefinitions_92E4FC:
    db $0B,$03,$00,$00,$0B,$04,$00,$00,$00,$11,$01,$06 

SamusTilesAnimation_AnimationDefinitions_E508:
    db $0A,$00,$00,$00,$0A,$04,$00,$00,$0A,$01,$00,$00,$0A,$05,$00,$00 
    db $0A,$02,$00,$00,$0A,$06,$00,$00,$0A,$03,$00,$00,$0A,$07,$00,$00 
    db $00,$00,$00,$00,$0B,$01,$00,$00 

SamusTilesAnimation_AnimationDefinitions_E530:
    db $0A,$07,$00,$00,$0A,$03,$00,$00,$0A,$06,$00,$00,$0A,$02,$00,$00 
    db $0A,$05,$00,$00,$0A,$01,$00,$00,$0A,$04,$00,$00,$0A,$00,$00,$00 
    db $00,$00,$00,$00,$0B,$01,$00,$00 

SamusTilesAnimation_AnimationDefinitions_E558:
    db $0A,$00,$00,$00,$0A,$04,$00,$00,$0A,$01,$00,$00,$0A,$05,$00,$00 
    db $0A,$02,$00,$00,$0A,$06,$00,$00,$0A,$03,$00,$00,$0A,$07,$00,$00 
    db $00,$00,$00,$00,$0B,$01,$00,$00 

SamusTilesAnimation_AnimationDefinitions_E580:
    db $0A,$07,$00,$00,$0A,$03,$00,$00,$0A,$06,$00,$00,$0A,$02,$00,$00 
    db $0A,$05,$00,$00,$0A,$01,$00,$00,$0A,$04,$00,$00,$0A,$00,$00,$00 
    db $00,$00,$00,$00,$0B,$01,$00,$00 

SamusTilesAnimation_AnimationDefinitions_E5A8:
    db $0A,$00,$00,$00,$0A,$04,$00,$00,$0A,$01,$00,$00,$0A,$05,$00,$00 
    db $0A,$02,$00,$00,$0A,$06,$00,$00,$0A,$03,$00,$00,$0A,$07,$00,$00 
    db $00,$00,$00,$00,$0B,$01,$00,$00 

SamusTilesAnimation_AnimationDefinitions_E5D0:
    db $0A,$07,$00,$00,$0A,$03,$00,$00,$0A,$06,$00,$00,$0A,$02,$00,$00 
    db $0A,$05,$00,$00,$0A,$01,$00,$00,$0A,$04,$00,$00,$0A,$00,$00,$00 
    db $00,$00,$00,$00,$0B,$01,$00,$00 

SamusTilesAnimation_AnimationDefinitions_E5F8:
    db $02,$04,$01,$19,$0A,$08,$00,$00,$0A,$09,$00,$00,$0A,$0A,$00,$00 
    db $0A,$0B,$00,$00,$0A,$0C,$00,$00,$0A,$0D,$00,$00,$0A,$0E,$00,$00 
    db $0A,$0F,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$1C,$00,$1E 

SamusTilesAnimation_AnimationDefinitions_E628:
    db $02,$05,$01,$1A,$0A,$08,$00,$00,$0A,$09,$00,$00,$0A,$0A,$00,$00 
    db $0A,$0B,$00,$00,$0A,$0C,$00,$00,$0A,$0D,$00,$00,$0A,$0E,$00,$00 
    db $0A,$0F,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$1D,$00,$1F 

SamusTilesAnimation_AnimationDefinitions_E658:
    db $02,$04,$01,$19,$0A,$14,$09,$00,$0A,$14,$09,$01,$0A,$14,$09,$02 
    db $0A,$14,$09,$03,$0A,$14,$09,$04,$0A,$14,$09,$05,$0A,$14,$09,$06 
    db $0A,$14,$09,$07,$00,$00,$00,$00,$00,$00,$00,$00,$01,$1C,$00,$1E 

SamusTilesAnimation_AnimationDefinitions_E688:
    db $02,$05,$01,$1A,$0A,$14,$09,$00,$0A,$14,$09,$01,$0A,$14,$09,$02 
    db $0A,$14,$09,$03,$0A,$14,$09,$04,$0A,$14,$09,$05,$0A,$14,$09,$06 
    db $0A,$14,$09,$07,$00,$00,$00,$00,$00,$00,$00,$00,$01,$1D,$00,$1F 

SamusTilesAnimation_AnimationDefinitions_E6B8:
    db $02,$04,$01,$19,$0A,$10,$09,$00,$0A,$10,$09,$01,$0A,$10,$09,$02 
    db $0A,$14,$09,$03,$0A,$14,$09,$04,$0A,$14,$09,$05,$0A,$11,$09,$06 
    db $0A,$11,$09,$07,$0A,$11,$09,$00,$0A,$14,$09,$01,$0A,$14,$09,$02 
    db $0A,$14,$09,$03,$0A,$12,$09,$04,$0A,$12,$09,$05,$0A,$12,$09,$06 
    db $0A,$14,$09,$07,$0A,$14,$09,$00,$0A,$14,$09,$01,$0A,$13,$09,$02 
    db $0A,$13,$09,$03,$0A,$13,$09,$04,$0A,$14,$09,$05,$0A,$14,$09,$06 
    db $0A,$14,$09,$07,$00,$00,$00,$00,$00,$00,$00,$00,$01,$1C,$00,$1E 

SamusTilesAnimation_AnimationDefinitions_E728:
    db $02,$05,$01,$1A,$0A,$10,$09,$00,$0A,$10,$09,$01,$0A,$10,$09,$02 
    db $0A,$14,$09,$03,$0A,$14,$09,$04,$0A,$14,$09,$05,$0A,$11,$09,$06 
    db $0A,$11,$09,$07,$0A,$11,$09,$00,$0A,$14,$09,$01,$0A,$14,$09,$02 
    db $0A,$14,$09,$03,$0A,$12,$09,$04,$0A,$12,$09,$05,$0A,$12,$09,$06 
    db $0A,$14,$09,$07,$0A,$14,$09,$00,$0A,$14,$09,$01,$0A,$13,$09,$02 
    db $0A,$13,$09,$03,$0A,$13,$09,$04,$0A,$14,$09,$05,$0A,$14,$09,$06 
    db $0A,$14,$09,$07,$00,$00,$00,$00,$00,$00,$00,$00,$01,$1D,$00,$1F 

SamusTilesAnimation_AnimationDefinitions_E798:
    db $01,$07,$00,$16,$01,$0A,$01,$01,$01,$06,$00,$15 

SamusTilesAnimation_AnimationDefinitions_E7A4:
    db $01,$06,$00,$15,$01,$0A,$01,$01,$01,$07,$00,$16 

SamusTilesAnimation_AnimationDefinitions_E7B0:
    db $01,$09,$00,$16,$01,$02,$01,$01,$01,$08,$00,$15 

SamusTilesAnimation_AnimationDefinitions_E7BC:
    db $01,$08,$00,$15,$01,$02,$01,$01,$01,$09,$00,$16 

SamusTilesAnimation_AnimationDefinitions_E7C8:
    db $01,$19,$00,$16,$01,$03,$01,$01,$01,$18,$00,$15 

SamusTilesAnimation_AnimationDefinitions_E7D4:
    db $01,$18,$00,$15,$01,$03,$01,$01,$01,$19,$00,$16 

SamusTilesAnimation_AnimationDefinitions_E7E0:
    db $01,$07,$00,$18,$01,$0A,$01,$02,$01,$06,$00,$17 

SamusTilesAnimation_AnimationDefinitions_E7EC:
    db $01,$06,$00,$17,$01,$0A,$01,$02,$01,$07,$00,$18 

SamusTilesAnimation_AnimationDefinitions_E7F8:
    db $01,$09,$00,$18,$01,$02,$01,$02,$01,$08,$00,$17 

SamusTilesAnimation_AnimationDefinitions_E804:
    db $01,$08,$00,$17,$01,$02,$01,$02,$01,$09,$00,$18 

SamusTilesAnimation_AnimationDefinitions_E810:
    db $01,$19,$00,$18,$01,$03,$01,$02,$01,$18,$00,$17 

SamusTilesAnimation_AnimationDefinitions_E81C:
    db $01,$18,$00,$17,$01,$03,$01,$02,$01,$19,$00,$18 

SamusTilesAnimation_AnimationDefinitions_E828:
    db $02,$04,$01,$1B 

SamusTilesAnimation_AnimationDefinitions_E82C:
    db $00,$1A,$01,$1B 

SamusTilesAnimation_AnimationDefinitions_E830:
    db $00,$10,$01,$1B 

SamusTilesAnimation_AnimationDefinitions_E834:
    db $00,$0C,$01,$1B 

SamusTilesAnimation_AnimationDefinitions_E838:
    db $02,$05,$01,$1C 

SamusTilesAnimation_AnimationDefinitions_E83C:
    db $00,$1B,$01,$1C 

SamusTilesAnimation_AnimationDefinitions_E840:
    db $00,$11,$01,$1C 

SamusTilesAnimation_AnimationDefinitions_E844:
    db $00,$0D,$01,$1C 

SamusTilesAnimation_AnimationDefinitions_E848:
    db $00,$01,$01,$0C,$00,$02,$01,$1B,$00,$00,$01,$19,$00,$04,$01,$0C 
    db $00,$05,$01,$0E,$00,$00,$01,$08 

SamusTilesAnimation_AnimationDefinitions_E860:
    db $00,$07,$01,$0D,$00,$08,$01,$1C,$00,$06,$01,$1A,$00,$0A,$01,$0D 
    db $00,$0B,$01,$0F,$00,$06,$01,$09 

SamusTilesAnimation_AnimationDefinitions_E878:
    db $0C,$00,$00,$00 

SamusTilesAnimation_AnimationDefinitions_E87C:
    db $0C,$01,$00,$00 

SamusTilesAnimation_AnimationDefinitions_E880:
    db $01,$14,$00,$1B 

SamusTilesAnimation_AnimationDefinitions_E884:
    db $01,$15,$00,$1C 

SamusTilesAnimation_AnimationDefinitions_E888:
    db $01,$14,$00,$1B 

SamusTilesAnimation_AnimationDefinitions_E88C:
    db $01,$15,$00,$1C 

SamusTilesAnimation_AnimationDefinitions_E890:
    db $0B,$05,$07,$00,$0B,$06,$07,$01,$0C,$05,$07,$02,$0B,$06,$07,$02 
    db $00,$00,$00,$00,$00,$00,$00,$00,$0C,$05,$07,$02,$0C,$06,$07,$02 
    db $0C,$07,$07,$02,$0C,$06,$07,$02,$00,$00,$00,$00,$00,$00,$00,$00 
    db $0B,$06,$07,$01,$0B,$06,$07,$00,$00,$10,$01,$06 

SamusTilesAnimation_AnimationDefinitions_E8CC:
    db $0B,$03,$07,$00,$0B,$04,$07,$01,$0C,$02,$07,$02,$0B,$04,$07,$02 
    db $00,$00,$00,$00,$00,$00,$00,$00,$0C,$02,$07,$02,$0C,$03,$07,$02 
    db $0C,$04,$07,$02,$0C,$03,$07,$02,$00,$00,$00,$00,$00,$00,$00,$00 
    db $0B,$04,$07,$01,$0B,$04,$07,$00,$00,$11,$01,$07 

SamusTilesAnimation_AnimationDefinitions_E908:
    db $0A,$00,$01,$06,$0B,$05,$01,$06,$0B,$06,$01,$06,$00,$10,$01,$06 
    db $00,$1D,$01,$0C,$00,$1D,$01,$1B 

SamusTilesAnimation_AnimationDefinitions_E920:
    db $0A,$1F,$01,$06,$0B,$03,$01,$06,$0B,$04,$01,$06,$00,$11,$01,$07 
    db $00,$1C,$01,$0D,$00,$1C,$01,$1C 

SamusTilesAnimation_AnimationDefinitions_E938:
    db $0A,$00,$01,$06,$0B,$05,$01,$06,$0B,$06,$01,$06,$00,$1D,$01,$0C 
    db $00,$1D,$01,$0C,$00,$1D,$01,$0C,$00,$1D,$01,$0C,$00,$1D,$01,$0C 
    db $07,$03,$01,$1F,$07,$04,$01,$1F,$07,$05,$01,$1F,$07,$04,$01,$1F 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$10,$01,$06 

SamusTilesAnimation_AnimationDefinitions_E974:
    db $0B,$03,$01,$06,$0B,$04,$01,$06,$00,$1C,$01,$0D,$00,$1C,$01,$0D 
    db $00,$1C,$01,$0D,$00,$1C,$01,$0D,$00,$1C,$01,$0D,$07,$01,$01,$07 
    db $07,$00,$01,$1E,$07,$01,$01,$1E,$07,$02,$01,$1E,$07,$01,$01,$1E 
    db $00,$00,$00,$00,$00,$00,$00,$00,$07,$01,$01,$1A,$07,$07,$01,$07 
    db $02,$03,$0A,$01,$00,$00,$00,$00,$00,$00,$00,$00,$07,$01,$01,$1A 
    db $07,$07,$01,$07,$02,$03,$0A,$01,$07,$07,$01,$07,$07,$01,$01,$1A 
    db $00,$00,$00,$00,$00,$00,$00,$00,$07,$00,$01,$1E,$00,$00,$00,$00 
    db $00,$00,$00,$00,$07,$00,$01,$1E,$00,$00,$00,$00,$00,$00,$00,$00 

SamusTilesAnimation_AnimationDefinitions_E9F4:
    db $07,$09,$01,$1F,$07,$0A,$01,$1F,$07,$0B,$01,$1F,$07,$0A,$01,$1F 
    db $00,$00,$00,$00,$00,$10,$01,$06 

SamusTilesAnimation_AnimationDefinitions_EA0C:
    db $07,$06,$01,$1E,$07,$07,$01,$1E,$07,$08,$01,$1E,$07,$07,$01,$1E 
    db $00,$00,$00,$00,$00,$11,$01,$07 

SamusTilesAnimation_AnimationDefinitions_EA24:
    db $01,$11,$00,$0C,$00,$00,$00,$00,$08,$02,$08,$00,$08,$00,$08,$00 
    db $08,$03,$08,$00,$08,$00,$08,$00,$08,$04,$08,$00,$08,$00,$08,$00 
    db $08,$02,$08,$00,$08,$00,$08,$00,$08,$03,$08,$00,$08,$00,$08,$00 
    db $08,$04,$08,$00,$08,$00,$08,$00,$08,$02,$08,$00,$08,$00,$08,$00 
    db $08,$03,$08,$00,$08,$00,$08,$00,$08,$04,$08,$00,$08,$00,$08,$00 
    db $08,$02,$08,$00,$08,$00,$08,$00,$08,$03,$08,$00,$08,$00,$08,$00 
    db $08,$04,$08,$00,$08,$00,$08,$00,$08,$02,$08,$00,$08,$00,$08,$00 
    db $08,$03,$08,$00,$08,$00,$08,$00,$08,$04,$08,$00,$08,$00,$08,$00 
    db $08,$02,$08,$00,$08,$00,$08,$00,$08,$03,$08,$00,$08,$00,$08,$00 
    db $08,$04,$08,$00,$08,$00,$08,$00,$08,$02,$08,$00,$08,$00,$08,$00 
    db $08,$03,$08,$00,$08,$00,$08,$00,$08,$04,$08,$00,$08,$00,$08,$00 
    db $08,$02,$08,$00,$08,$00,$08,$00,$08,$03,$08,$00,$08,$00,$08,$00 
    db $08,$04,$08,$00,$08,$00,$08,$00,$08,$02,$08,$00,$08,$00,$08,$00 
    db $08,$03,$08,$00,$08,$00,$08,$00,$08,$04,$08,$00,$08,$00,$08,$00 
    db $08,$02,$08,$00,$08,$00,$08,$00,$08,$03,$08,$00,$08,$00,$08,$00 
    db $08,$04,$08,$00,$08,$00,$08,$00,$08,$02,$08,$00,$08,$00,$08,$00 
    db $08,$03,$08,$00,$08,$00,$08,$00,$08,$04,$08,$00,$08,$00,$08,$00 
    db $08,$02,$08,$00,$08,$00,$08,$00,$08,$03,$08,$00,$08,$00,$08,$00 
    db $08,$04,$08,$00,$08,$00,$08,$00,$08,$02,$08,$00,$08,$00,$08,$00 
    db $08,$03,$08,$00,$08,$00,$08,$00,$08,$04,$08,$00,$08,$00,$08,$00 
    db $08,$05,$08,$00,$08,$00,$08,$00,$08,$06,$08,$00,$08,$00,$08,$00 
    db $08,$07,$08,$00,$08,$00,$08,$00,$08,$08,$08,$00,$08,$00,$08,$00 
    db $08,$09,$08,$00,$08,$00,$08,$00,$08,$07,$08,$00,$08,$00,$08,$00 
    db $08,$08,$08,$00,$08,$00,$08,$00,$08,$09,$08,$00,$08,$00,$08,$00 

SamusTilesAnimation_AnimationDefinitions_EBA4:
    db $01,$05,$00,$0D,$00,$00,$00,$00,$08,$02,$08,$01,$08,$00,$08,$01 
    db $08,$03,$08,$01,$08,$00,$08,$01,$08,$04,$08,$01,$08,$00,$08,$01 
    db $08,$02,$08,$01,$08,$00,$08,$01,$08,$03,$08,$01,$08,$00,$08,$01 
    db $08,$04,$08,$01,$08,$00,$08,$01,$08,$02,$08,$01,$08,$00,$08,$01 
    db $08,$03,$08,$01,$08,$00,$08,$01,$08,$04,$08,$01,$08,$00,$08,$01 
    db $08,$02,$08,$01,$08,$00,$08,$01,$08,$03,$08,$01,$08,$00,$08,$01 
    db $08,$04,$08,$01,$08,$00,$08,$01,$08,$02,$08,$01,$08,$00,$08,$01 
    db $08,$03,$08,$01,$08,$00,$08,$01,$08,$04,$08,$01,$08,$00,$08,$01 
    db $08,$02,$08,$01,$08,$00,$08,$01,$08,$03,$08,$01,$08,$00,$08,$01 
    db $08,$04,$08,$01,$08,$00,$08,$01,$08,$02,$08,$01,$08,$00,$08,$01 
    db $08,$03,$08,$01,$08,$00,$08,$01,$08,$04,$08,$01,$08,$00,$08,$01 
    db $08,$02,$08,$01,$08,$00,$08,$01,$08,$03,$08,$01,$08,$00,$08,$01 
    db $08,$04,$08,$01,$08,$00,$08,$01,$08,$02,$08,$01,$08,$00,$08,$01 
    db $08,$03,$08,$01,$08,$00,$08,$01,$08,$04,$08,$01,$08,$00,$08,$01 
    db $08,$02,$08,$01,$08,$00,$08,$01,$08,$03,$08,$01,$08,$00,$08,$01 
    db $08,$04,$08,$01,$08,$00,$08,$01,$08,$02,$08,$01,$08,$00,$08,$01 
    db $08,$03,$08,$01,$08,$00,$08,$01,$08,$04,$08,$01,$08,$00,$08,$01 
    db $08,$02,$08,$01,$08,$00,$08,$01,$08,$03,$08,$01,$08,$00,$08,$01 
    db $08,$04,$08,$01,$08,$00,$08,$01,$08,$02,$08,$01,$08,$00,$08,$01 
    db $08,$03,$08,$01,$08,$00,$08,$01,$08,$04,$08,$01,$08,$00,$08,$01 
    db $08,$05,$08,$01,$08,$00,$08,$01,$08,$06,$08,$01,$08,$00,$08,$01 
    db $08,$07,$08,$01,$08,$00,$08,$01,$08,$08,$08,$01,$08,$00,$08,$01 
    db $08,$09,$08,$01,$08,$00,$08,$01,$08,$07,$08,$01,$08,$00,$08,$01 
    db $08,$08,$08,$01,$08,$00,$08,$01,$08,$09,$08,$01,$08,$00,$08,$01 

PlaySamusFanfare:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W $0DEC 
    BNE .nonZero 
    LDA.W #$0001 
    LDY.W #$000E 
    JSL.L QueueMusicDataOrTrack_YFrameDelay 
    BRA .not5 


.nonZero:
    CMP.W #$0005 
    BNE .not5 
    LDA.W #$0168 
    JSL.L Play_Room_Music_Track_After_A_Frames 
    BRA .not5 


.not5:
    LDA.W $0DEC 
    INC A 
    CMP.W #$0168 
    BPL .greaterThanEqualTo168 
    STA.W $0DEC 
    BRA .return 


.greaterThanEqualTo168:
    LDA.W $0A20 : STA.W $0A24 
    LDA.W $0A22 : STA.W $0A26 
    LDA.W $0A1C : STA.W $0A20 
    LDA.W $0A1E : STA.W $0A22 
    STZ.W $0DEC 
    PLB 
    PLP 
    SEC 
    RTL 


.return:
    PLB 
    PLP 
    CLC 
    RTL 


Debug_SamusTileViewer:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W #$0182 
    LDX.W #$0040 
    LDY.W #$0040 
    JSL.L AddSamusSpritemapToOAM 
    LDA.W #$0182 
    INC A 
    LDX.W #$00C0 
    LDY.W #$0040 
    JSL.L AddSamusSpritemapToOAM 
    LDA.W #$0182 
    INC #2
    LDX.W #$0080 
    LDY.W #$0060 
    JSL.L AddSamusSpritemapToOAM 
    LDA.W #$0182 
    CLC : ADC.W #$0003 
    LDX.W #$0080 
    LDY.W #$0050 
    JSL.L AddSamusSpritemapToOAM 
    PLB 
    PLP 
    RTL 


DrawSamusSuitExploding:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingLeft 
    LDA.W #$081C 
    CLC : ADC.W $0DE4 
    STA.B $12 
    BRA + 


.facingLeft:
    LDA.W #$0825 
    CLC : ADC.W $0DE4 
    STA.B $12 

  + LDA.W $0AF6 
    TAX 
    LDA.W $0AFA 
    TAY 
    LDA.B $12 
    JSL.L AddSamusSpritemapToOAM 
    PLB 
    PLP 
    RTL 


Freespace_Bank92_EDF4: 
; $120C bytes
