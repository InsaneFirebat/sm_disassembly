
org $8B8000


Setup_PPU_TitleSequence:
    PHP 
    SEP #$30 
    LDA.B #$80 
    STA.W $2100 
    STA.B $51 
    LDA.B #$03 
    STA.W $2101 
    STA.B $52 
    LDA.B #$07 
    STA.W $2105 
    STA.B $55 
    LDA.B #$80 
    STA.W $211A 
    STA.B $5F 
    LDA.B #$00 
    STA.B $58 
    STA.W $2107 
    STZ.B $59 
    STZ.W $2108 
    STZ.B $5A 
    STZ.W $2109 
    STZ.B $5C 
    STZ.W $210A 
    STZ.B $5D 
    STZ.W $210B 
    STZ.B $5E 
    STZ.W $210C 
    LDA.B #$10 
    STA.W $212C 
    STA.B $69 
    STZ.W $212D 
    STZ.B $6B 
    STZ.W $212E 
    STZ.B $6C 
    STZ.W $2115 
    STZ.W $2130 
    STZ.B $6E 
    STZ.W $2131 
    STZ.B $71 
    LDA.B #$E0 
    STA.W $2132 
    LDA.B #$00 
    STA.W $2133 
    STA.B $77 
    REP #$30 
    LDA.W #$0000 
    LDX.W #$3000 
    LDY.W #$07FE 
    JSL.L WriteYBytesOfATo_7E0000_X_16bit 
    STZ.W $0590 
    STZ.W $099E 
    STZ.W $0723 
    STZ.W $0725 
    STZ.W $0729 
    STZ.W $072B 
    STZ.W $072D 
    STZ.W $072F 
    STZ.W $0731 
    STZ.W $073D 
    STZ.W $073F 
    STZ.W $0741 
    STZ.W $0743 
    STZ.W $0745 
    STZ.W $0751 
    STZ.W $0753 
    STZ.W $0755 
    STZ.W $0757 
    STZ.W $0759 
    STZ.W $09D6 
    STZ.W $09D8 
    STZ.W $198D 
    LDA.W #$0100 
    STA.W $198F 
    STZ.W $1991 
    STZ.W $1993 
    STZ.W $1995 
    STZ.W $1997 
    STZ.W $1999 
    STZ.W $199B 
    STZ.W $199D 
    STZ.W $199F 
    PLP 
    RTS 


Setup_PPU_Intro:
    PHP 
    SEP #$30 
    LDA.B #$80 
    STA.W $2100 
    STA.B $51 
    LDA.B #$03 
    STA.W $2101 
    STA.B $52 
    LDA.B #$09 
    STA.W $2105 
    STA.B $55 
    LDA.B #$00 
    STA.W $211A 
    STA.B $5F 
    LDA.B #$50 
    STA.B $58 
    STA.W $2107 
    LDA.B #$48 
    STA.B $59 
    STA.W $2108 
    LDA.B #$4C 
    STA.B $5A 
    STA.W $2109 
    STZ.B $5C 
    STZ.W $210A 
    STZ.B $5D 
    STZ.W $210B 
    LDA.B #$04 
    STA.B $5E 
    STA.W $210C 
    LDA.B #$04 
    STA.W $212C 
    STA.B $69 
    STZ.W $212D 
    STZ.B $6B 
    STZ.W $212E 
    STZ.B $6C 
    STZ.W $2115 
    STZ.W $2130 
    STZ.B $6E 
    STZ.W $2131 
    STZ.B $71 
    LDA.B #$E0 
    STA.W $2132 
    LDA.B #$00 
    STA.W $2133 
    STA.B $77 
    STZ.B $6F 
    STZ.B $72 
    LDA.B #$20 
    STA.B $74 
    LDA.B #$40 
    STA.B $75 
    LDA.B #$80 
    STA.B $76 
    STZ.B $57 
    REP #$30 
    LDA.W #$002F 
    LDX.W #$3000 
    LDY.W #$07FE 
    JSL.L WriteYBytesOfATo_7E0000_X_16bit 
    STZ.W $0590 
    STZ.W $198D 
    LDA.W #$0100 
    STA.W $198F 
    STZ.W $1991 
    STZ.W $1993 
    STZ.W $1995 
    STZ.W $1997 
    STZ.W $1999 
    STZ.W $199B 
    STZ.W $199D 
    STZ.W $199F 
    STZ.W $1982 
    STZ.B $B5 
    STZ.B $B7 
    STZ.B $B9 
    STZ.B $BB 
    PLP 
    RTS 


Setup_PPU_CeresCutscene:
    PHP 
    SEP #$30 
    LDA.B #$80 
    STA.W $2100 
    STA.B $51 
    LDA.B #$03 
    STA.W $2101 
    STA.B $52 
    LDA.B #$07 
    STA.W $2105 
    STA.B $55 
    LDA.B #$80 
    STA.W $211A 
    STA.B $5F 
    LDA.B #$00 
    STA.B $58 
    STA.W $2107 
    STZ.B $59 
    STZ.W $2108 
    STZ.B $5A 
    STZ.W $2109 
    STZ.B $5C 
    STZ.W $210A 
    STZ.B $5D 
    STZ.W $210B 
    STZ.B $5E 
    STZ.W $210C 
    LDA.B #$11 
    STA.W $212C 
    STA.B $69 
    LDA.B #$00 
    STA.W $212D 
    STA.B $6B 
    STZ.W $212E 
    STZ.B $6C 
    STZ.W $2115 
    STZ.W $2130 
    STZ.B $6E 
    STZ.W $2131 
    STZ.B $71 
    LDA.B #$E0 
    STA.W $2132 
    STZ.B $6F 
    STZ.B $72 
    LDA.B #$20 
    STA.B $74 
    LDA.B #$40 
    STA.B $75 
    LDA.B #$80 
    STA.B $76 
    STZ.B $57 
    REP #$30 
    STZ.W $1991 
    STZ.W $1993 
    STZ.W $1995 
    STZ.W $1997 
    STZ.W $1999 
    STZ.W $199B 
    STZ.W $199D 
    STZ.W $199F 
    STZ.W $1982 
    PLP 
    RTS 


Setup_PPU_SamusGoesToZebesCutscene:
    PHP 
    SEP #$30 
    LDA.B #$80 
    STA.W $2100 
    STA.B $51 
    LDA.B #$03 
    STA.W $2101 
    STA.B $52 
    LDA.B #$01 
    STA.W $2105 
    STA.B $55 
    LDA.B #$00 
    STA.W $211A 
    STA.B $5F 
    LDA.B #$5C 
    STA.B $58 
    STA.W $2107 
    STZ.B $59 
    STZ.W $2108 
    STZ.B $5A 
    STZ.W $2109 
    STZ.B $5C 
    STZ.W $210A 
    LDA.B #$06 
    STA.B $5D 
    STA.W $210B 
    STZ.B $5E 
    STZ.W $210C 
    LDA.B #$11 
    STA.W $212C 
    STA.B $69 
    STZ.W $212D 
    STZ.B $6B 
    STZ.B $60 
    STZ.B $61 
    STZ.B $62 
    STZ.B $6C 
    STZ.B $6D 
    STZ.B $6F 
    STZ.B $72 
    REP #$30 
    STZ.B $B1 
    STZ.B $B3 
    PLP 
    RTS 


Setup_PPU_ZebesDestruction:
    PHP 
    SEP #$30 
    LDA.B #$80 
    STA.W $2100 
    STA.B $51 
    LDA.B #$A3 
    STA.W $2101 
    STA.B $52 
    LDA.B #$07 
    STA.W $2105 
    STA.B $55 
    LDA.B #$00 
    STA.W $211A 
    STA.B $5F 
    LDA.B #$00 
    STA.B $58 
    STA.W $2107 
    STZ.B $59 
    STZ.W $2108 
    STZ.B $5A 
    STZ.W $2109 
    STZ.B $5C 
    STZ.W $210A 
    STZ.B $5D 
    STZ.W $210B 
    STZ.B $5E 
    STZ.W $210C 
    LDA.B #$11 
    STA.W $212C 
    STA.B $69 
    STZ.W $212D 
    STZ.B $6B 
    STZ.W $212E 
    STZ.B $6C 
    STZ.W $2115 
    STZ.W $2130 
    STZ.B $6E 
    STZ.W $2131 
    STZ.B $71 
    STZ.B $6F 
    STZ.B $72 
    LDA.B #$E0 
    STA.W $2132 
    LDA.B #$00 
    STA.W $2133 
    STA.B $77 
    LDA.B #$20 
    STA.B $74 
    LDA.B #$40 
    STA.B $75 
    LDA.B #$80 
    STA.B $76 
    REP #$30 
    STZ.W $0590 
    STZ.W $0723 
    STZ.W $0725 
    STZ.W $198D 
    LDA.W #$0100 
    STA.W $198F 
    STZ.W $1991 
    STZ.W $1993 
    STZ.W $1995 
    STZ.W $1997 
    STZ.W $1999 
    STZ.W $199B 
    STZ.W $199D 
    STZ.W $199F 
    PLP 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Setup_PPU_ZebesDestructionSpaceView_8B833A:
    PHP 
    SEP #$30 
    LDA.B #$80 
    STA.W $2100 
    STA.B $51 
    LDA.B #$02 
    STA.W $2101 
    STA.B $52 
    LDA.B #$01 
    STA.W $2105 
    STA.B $55 
    STZ.W $211A 
    STZ.B $5F 
    LDA.B #$70 
    STA.B $58 
    STA.W $2107 
    LDA.B #$78 
    STA.B $59 
    STA.W $2108 
    STZ.B $5A 
    STZ.W $2109 
    STZ.B $5C 
    STZ.W $210A 
    LDA.B #$44 
    STA.B $5D 
    STA.W $210B 
    STZ.B $5E 
    STZ.W $210C 
    LDA.B #$10 
    STA.W $212C 
    STA.B $69 
    STZ.W $212D 
    STZ.B $6B 
    STZ.W $212E 
    STZ.B $6C 
    STZ.W $2115 
    STZ.W $2130 
    STZ.B $6E 
    STZ.W $2131 
    STZ.B $71 
    LDA.B #$E0 
    STA.W $2132 
    STZ.B $6F 
    STZ.B $72 
    LDA.B #$20 
    STA.B $74 
    LDA.B #$40 
    STA.B $75 
    LDA.B #$80 
    STA.B $76 
    STZ.B $57 
    REP #$30 
    STZ.W $1991 
    STZ.W $1993 
    STZ.W $1995 
    STZ.W $1997 
    STZ.W $1999 
    STZ.W $199B 
    STZ.W $199D 
    STZ.W $199F 
    STZ.W $1982 
    STZ.B $B5 
    STZ.B $B7 
    PLP 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Setup_PPU_Credits:
    PHP 
    SEP #$30 
    LDA.B #$80 
    STA.W $2100 
    STA.B $51 
    LDA.B #$00 
    STA.W $2101 
    STA.B $52 
    LDA.B #$01 
    STA.W $2105 
    STA.B $55 
    LDA.B #$00 
    STA.W $211A 
    STA.B $5F 
    LDA.B #$48 
    STA.B $58 
    STA.W $2107 
    LDA.B #$4C 
    STA.B $59 
    STA.W $2108 
    LDA.B #$24 
    STA.B $5A 
    STA.W $2109 
    STZ.B $5C 
    STZ.W $210A 
    LDA.B #$54 
    STA.B $5D 
    STA.W $210B 
    LDA.B #$02 
    STA.B $5E 
    STA.W $210C 
    LDA.B #$01 
    STA.W $212C 
    STA.B $69 
    STZ.W $212D 
    STZ.B $6B 
    STZ.B $60 
    STZ.B $61 
    STZ.B $62 
    STZ.B $6C 
    STZ.B $6D 
    STZ.B $6F 
    STZ.B $72 
    LDA.B #$20 
    STA.B $74 
    LDA.B #$40 
    STA.B $75 
    LDA.B #$80 
    STA.B $76 
    REP #$30 
    STZ.W $0590 
    LDA.W #$0100 
    STA.W $211B 
    STA.B $78 
    STZ.W $211C 
    STZ.B $7A 
    STZ.W $211D 
    STZ.B $7C 
    STA.W $211E 
    STA.B $7E 
    LDA.W #$0080 
    STA.W $211F 
    STA.B $80 
    STA.W $2120 
    STA.B $82 
    STZ.W $198D 
    LDA.W #$0001 
    STA.W $198F 
    STZ.B $B1 
    STZ.B $B3 
    STZ.B $B5 
    STZ.B $B7 
    STZ.W $1991 
    STZ.W $1993 
    STZ.W $1995 
    STZ.W $1997 
    PLP 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_ModifyMode7TransformAndBG1PosWithController_8B8488:
    PHP 
    REP #$30 
    LDA.B $8B 
    BIT.W #$0200 
    BEQ .checkRight 
    LDA.W $1993 
    CLC 
    ADC.W #$0002 
    STA.W $1993 

.checkRight:
    LDA.B $8B 
    BIT.W #$0100 
    BEQ .checkUp 
    LDA.W $1993 
    SEC 
    SBC.W #$0002 
    STA.W $1993 

.checkUp:
    LDA.B $8B 
    BIT.W #$0800 
    BEQ .checkDown 
    LDA.W $1997 
    CLC 
    ADC.W #$0002 
    STA.W $1997 

.checkDown:
    LDA.B $8B 
    BIT.W #$0400 
    BEQ .checkLR 
    LDA.W $1997 
    SEC 
    SBC.W #$0002 
    STA.W $1997 

.checkLR:
    LDA.B $8B 
    BIT.W #$0010 
    BNE .pressingR 
    BIT.W #$0020 
    BEQ .checkB 
    LDA.W $198D 
    DEC A 
    AND.W #$00FF 
    STA.W $198D 
    BRA .checkB 


.pressingR:
    LDA.W $198D 
    INC A 
    AND.W #$00FF 
    STA.W $198D 

.checkB:
    LDA.B $8B 
    BIT.W #$8000 
    BNE .zoomOut 
    BIT.W #$0040 
    BNE .zoomIn 
    PLP 
    RTS 


.zoomOut:
    LDA.W $198F 
    CMP.W #$7000 
    BPL .return 
    INC A 
    STA.W $198F 
    BRA .return 


.zoomIn:
    LDA.W $198F 
    BEQ .return 
    DEC A 
    STA.W $198F 

.return:
    PLP 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


HandleMode7TransformMatrixAndBG1Position_NoRotation:
    PHP 
    REP #$30 
    LDA.W $198F 
    STA.B $78 
    STA.B $7E 
    STZ.B $7A 
    STZ.B $7C 
    LDA.W $1993 
    STA.B $B1 
    LDA.W $1997 
    STA.B $B3 
    PLP 
    RTS 


HandleMode7TransformMatrixAndBG1Position:
    PHP 
    REP #$30 
    LDA.W $198D 
    CLC 
    ADC.W #$0040 
    AND.W #$00FF 
    ASL A 
    TAX 
    LDA.L SineCosineTables_8bitSine_SignExtended,X 
    STA.B $26 
    LDA.W $198F 
    STA.B $28 
    JSR.W Multiplication_16bitSigned_8B858F 
    SEP #$20 
    LDA.B $2A 
    XBA 
    LDA.B $2D 
    REP #$20 
    STA.B $78 
    STA.B $7E 
    LDA.W $198D 
    AND.W #$00FF 
    ASL A 
    TAX 
    LDA.L SineCosineTables_8bitSine_SignExtended,X 
    STA.B $26 
    LDA.W $198F 
    STA.B $28 
    JSR.W Multiplication_16bitSigned_8B858F 
    SEP #$20 
    LDA.B $2A 
    XBA 
    LDA.B $2D 
    REP #$20 
    STA.B $7A 
    EOR.W #$FFFF 
    INC A 
    STA.B $7C 
    LDA.W $1993 
    STA.B $B1 
    LDA.W $1997 
    STA.B $B3 
    PLP 
    RTS 


Multiplication_16bitSigned_8B858F:
    PHP 
    REP #$30 
    LDA.B $26 
    BPL .leftPositive 
    EOR.W #$FFFF 
    INC A 
    STA.B $26 
    LDA.B $28 
    BMI + 
    JSR.W Multiplication_16bitUnsigned_8B85EE 
    LDA.B $2C 
    EOR.W #$FFFF 
    CLC 
    ADC.W #$0001 
    STA.B $2C 
    LDA.B $2A 
    EOR.W #$FFFF 
    ADC.W #$0000 
    STA.B $2A 
    PLP 
    RTS 


  + EOR.W #$FFFF 
    INC A 
    STA.B $28 
    JSR.W Multiplication_16bitUnsigned_8B85EE 
    PLP 
    RTS 


.leftPositiveRightNegative:
    EOR.W #$FFFF 
    INC A 
    STA.B $28 
    JSR.W Multiplication_16bitUnsigned_8B85EE 
    LDA.B $2C 
    EOR.W #$FFFF 
    CLC 
    ADC.W #$0001 
    STA.B $2C 
    LDA.B $2A 
    EOR.W #$FFFF 
    ADC.W #$0000 
    STA.B $2A 
    PLP 
    RTS 


.leftPositive:
    LDA.B $28 
    BMI .leftPositiveRightNegative 
    JSR.W Multiplication_16bitUnsigned_8B85EE 
    PLP 
    RTS 


Multiplication_16bitUnsigned_8B85EE:
    PHP 
    SEP #$30 
    LDA.B $26 
    STA.W $4202 
    LDA.B $28 
    STA.W $4203 
    NOP 
    NOP 
    NOP 
    LDA.W $4216 
    STA.B $2C 
    LDA.W $4217 
    STA.B $2D 
    LDA.B $27 
    STA.W $4202 
    LDA.B $28 
    STA.W $4203 
    NOP 
    NOP 
    NOP 
    LDA.W $4216 
    STA.B $2E 
    LDA.W $4217 
    STA.B $2F 
    LDA.B $26 
    STA.W $4202 
    LDA.B $29 
    STA.W $4203 
    NOP 
    NOP 
    NOP 
    LDA.W $4216 
    STA.B $30 
    LDA.W $4217 
    STA.B $31 
    LDA.B $27 
    STA.W $4202 
    LDA.B $29 
    STA.W $4203 
    NOP 
    NOP 
    NOP 
    REP #$20 
    LDA.W $4216 
    STA.B $2A 
    LDA.B $2E 
    CLC 
    ADC.B $30 
    STA.B $2E 
    SEP #$20 
    LDA.B $2E 
    CLC 
    ADC.B $2D 
    STA.B $2D 
    LDA.B $2F 
    ADC.B $2A 
    STA.B $2A 
    BCC .return 
    INC.B $2B 

.return:
    PLP 
    RTS 


Handle_Fading_In_from_Bank8B:
    JSL.L HandleFadingIn 
    RTS 


Activate_TileSequence_BlueLight:
    PHP 
    SEP #$20 
    STZ.B $6F 
    LDA.B #$81 
    STA.B $72 
    LDA.B #$38 
    STA.B $74 
    LDA.B #$58 
    STA.B $75 
    LDA.B #$80 
    STA.B $76 
    PLP 
    RTS 


Deactivate_TileSequence_BlueLight:
    PHP 
    SEP #$20 
    STZ.B $6F 
    STZ.B $72 
    LDA.B #$20 
    STA.B $74 
    LDA.B #$40 
    STA.B $75 
    LDA.B #$80 
    STA.B $76 
    PLP 
    RTS 


Debug_DisplayVersionInfo:
    RTS 

    PHP 
    REP #$30 
    LDX.W $0590 
    LDY.W #$0000 

.loopVersionString:
    LDA.W .versionStringOAMEntryXpos,Y 
    AND.W #$00FF 
    STA.W $0370,X 
    LDA.W #$00CC 
    STA.W $0371,X 
    PHY 
    LDA.W Debug_VersionString,Y 
    AND.W #$00FF 
    BEQ .done 
    CMP.W #$002E 
    BEQ .decimalPoint 
    SEC 
    SBC.W #$0030 
    ASL A 
    TAY 
    LDA.W .versionStringOAMEntryTileNumbersAttributes,Y 
    STA.W $0372,X 
    BRA .next 


.decimalPoint:
    LDA.W #$39F3 
    STA.W $0372,X 

.next:
    PLY 
    TXA 
    CLC 
    ADC.W #$0004 
    TAX 
    INY 
    BRA .loopVersionString 


.done:
    PLY 
    STX.W $0590 
    LDA.L DebugConst_DisableAudio 
    BEQ .versionNumber 
    LDA.W #$00B4 
    STA.W $0370,X 
    LDA.W #$00C4 
    STA.W $0371,X 
    LDA.W #$39E2 
    STA.W $0372,X 
    TXA 
    CLC 
    ADC.W #$0004 
    TAX 

.versionNumber:
    LDA.L ROM_HEADER_version&$00FFFF 
    PHA 
    AND.W #$000F 
    ASL A 
    STA.B $12 
    PLA 
    AND.W #$00F0 
    LSR #3
    TAY 
    LDA.W #$00E8 
    STA.W $0370,X 
    LDA.W #$00CC 
    STA.W $0371,X 
    LDA.W .versionStringOAMEntryTileNumbersAttributes,Y 
    STA.W $0372,X 
    LDA.W #$00F0 
    STA.W $0374,X 
    LDA.W #$00CC 
    STA.W $0375,X 
    LDY.B $12 
    LDA.W .versionStringOAMEntryTileNumbersAttributes,Y 
    STA.W $0376,X 
    TXA 
    CLC 
    ADC.W #$0008 
    TAX 
    LDY.W #$0000 

.loopVer:
    LDA.W .VerOAMEntryXpos,Y 
    STA.W $0370,X 
    LDA.W #$00CC 
    STA.W $0371,X 
    LDA.W .VerOAMEntryTileNumbersAttributes,Y 
    STA.W $0372,X 
    TXA 
    CLC 
    ADC.W #$0004 
    TAX 
    INY 
    INY 
    CPY.W #$0006 
    BMI .loopVer 
    STX.W $0590 
    PLP 
    RTS 


.versionStringOAMEntryXpos:
    db $80,$88,$90,$98,$A0,$A8,$B0,$B8,$C0,$C8,$D0,$D8,$E0,$E8,$F0,$F8 

.VerOAMEntryXpos:
    dw $0074,$006C,$0064 

.VerOAMEntryTileNumbersAttributes:
    dw $31F2,$31F1,$31F0 

.versionStringOAMEntryTileNumbersAttributes:
; '0123456789ABCDEF'
    dw $39F4,$39F5,$39F6,$39F7,$39F8,$39F9,$39FA,$39FB 
    dw $39FC,$39FD,$39D0,$39D1,$39D2,$39D3,$39D4,$39D5 

CinematicBGObjects_Update32x30CinematicBGTilemap:
    PHP 
    REP #$30 
    LDA.B $55 
    AND.W #$00FF 
    CMP.W #$0007 
    BEQ .return 
    LDX.W $0330 
    LDA.W #$0780 
    STA.B $D0,X 
    INX 
    INX 
    LDA.W #$3000 
    STA.B $D0,X 
    INX 
    INX 
    SEP #$20 
    LDA.B #$7E 
    STA.B $D0,X 
    REP #$20 
    INX 
    LDA.W $19F5 
    STA.B $D0,X 
    INX 
    INX 
    STX.W $0330 

.return:
    PLP 
    RTS 


CinematicBGObjects_UpdateSamusEyesTilemap:
    PHP 
    REP #$30 
    LDA.B $55 
    AND.W #$00FF 
    CMP.W #$0007 
    BEQ .return 
    LDX.W $0330 
    LDA.W #$0080 
    STA.B $D0,X 
    INX 
    INX 
    LDA.W #$3B40 
    STA.B $D0,X 
    INX 
    INX 
    SEP #$20 
    LDA.B #$7E 
    STA.B $D0,X 
    REP #$20 
    INX 
    LDA.W #$49A0 
    STA.B $D0,X 
    INX 
    INX 
    STX.W $0330 

.return:
    PLP 
    RTS 


CinematicBGObjects_Update32x32CinematicBGTilemap:
    PHP 
    REP #$30 
    LDA.B $55 
    AND.W #$00FF 
    CMP.W #$0007 
    BEQ .return 
    LDX.W $0330 
    LDA.W #$0800 
    STA.B $D0,X 
    INX 
    INX 
    LDA.W #$3000 
    STA.B $D0,X 
    INX 
    INX 
    SEP #$20 
    LDA.B #$7E 
    STA.B $D0,X 
    REP #$20 
    INX 
    LDA.W $19F5 
    STA.B $D0,X 
    INX 
    INX 
    STX.W $0330 

.return:
    PLP 
    RTS 


CinematicBGObjects_ProcessIndirectInstruction:
    PHP 
    REP #$30 
    PHX 
    PHY 
    LDY.W $19B5,X 
    LDA.W $0000,Y 
    STA.B $1C 
    JMP.W ($001C) 


IndirectInstructionFunction_Nothing:
    PLY 
    PLX 
    PLP 
    RTS 


IndirectInstructionFunction_DrawTextCharacter:
    LDA.W $1BA1 
    BNE .toggleFlag 
    LDA.W #$0001 
    STA.W $1BA1 
    BRA .drawText 


.toggleFlag:
    STZ.W $1BA1 

.drawText:
    JSR.W Spawn_TextGlowObject 
    PHY 
    LDY.W $19CD,X 
    LDX.W #$001E 
    LDA.W $0006,Y 
    BMI .pointer 
    LDA.W $0008,Y 
    AND.W #$00FF 
    ASL #3
    STA.W $1A7D,X 
    LDA.W $0009,Y 
    AND.W #$00FF 
    ASL #3
    SEC 
    SBC.W #$0008 
    STA.W $1A9D,X 
    BRA .merge 


.pointer:
    LDA.W #$0008 
    STA.W $1A7D,X 
    LDA.W $0003,Y 
    AND.W #$00FF 
    INC A 
    INC A 
    ASL #3
    SEC 
    SBC.W #$0008 
    STA.W $1A9D,X 

.merge:
    LDA.W $0004,Y 
    CMP.W #IndirectInstructions_IntroText_Space 
    BEQ .fallthrough 
    LDA.W $1BA1 
    BEQ .fallthrough 
    LDA.W #$000D 
    JSL.L QueueSound_Lib3_Max6 

.fallthrough:
    PLY 

IndirectInstructionFunction_DrawTextToTilemap:
    JSR.W CinematicBGObjects_X_16_TilemapOffsetForTile_12_13 
    LDA.W $0002,Y 
    AND.W #$00FF 
    STA.W $0012 
    STA.W $0018 
    LDA.W $0003,Y 
    AND.W #$00FF 
    STA.W $0014 

.loop:
    LDA.W $0004,Y 
    STA.L $7E3000,X 
    INY 
    INY 
    INX 
    INX 
    DEC.W $0012 
    BEQ + 
    BRA .loop 


  + LDA.W $0018 
    STA.W $0012 
    DEC.W $0014 
    BEQ .return 
    LDA.W $0016 
    CLC 
    ADC.W #$0040 
    STA.W $0016 
    TAX 
    BRA .loop 


.return:
    PLY 
    PLX 
    PLP 
    RTS 


IndirectInstructionFunction_DrawSamusEyesToTilemap:
    JSR.W CinematicBGObjects_X_16_TilemapOffsetForTile_12_13 
    LDA.W $0002,Y 
    AND.W #$00FF 
    STA.W $0012 
    STA.W $0018 
    LDA.W $0003,Y 
    AND.W #$00FF 
    STA.W $0014 

.loops:
    LDA.W $0004,Y 
    STA.L $7E3800,X 
    INY 
    INY 
    INX 
    INX 
    DEC.W $0012 
    BEQ + 
    BRA .loops 


  + LDA.W $0018 
    STA.W $0012 
    DEC.W $0014 
    BEQ .return 
    LDA.W $0016 
    CLC 
    ADC.W #$0040 
    STA.W $0016 
    TAX 
    BRA .loops 


.return:
    PLY 
    PLX 
    PLP 
    RTS 


CinematicBGObjects_X_16_TilemapOffsetForTile_12_13:
    LDA.W $0012 
    AND.W #$00FF 
    ASL A 
    STA.W $0014 
    SEP #$20 
    LDA.B #$40 
    STA.W $4202 
    LDA.W $0013 
    STA.W $4203 
    NOP 
    NOP 
    NOP 
    REP #$20 
    LDA.W $4216 
    CLC 
    ADC.W $0014 
    STA.W $0016 
    TAX 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_CinematicBGObjects_IndirectInstructionFunction_8B896B:
    JSR.W UNUSED_CinematicBGObjects_Mode7TilemapOffsetForTile_8B8A2C 
    LDA.W $0002,Y 
    AND.W #$00FF 
    STA.W $0012 
    LDA.W $0003,Y 
    AND.W #$00FF 
    STA.W $0014 
    TYA 
    CLC 
    ADC.W #$0004 
    TAY 
    LDX.W $0334 

.loop:
    LDA.W #$0080 
    STA.W $02D0,X 
    TYA 
    STA.W $02D1,X 
    LDA.W #$008B 
    STA.W $02D3,X 
    LDA.W $0012 
    STA.W $02D4,X 
    LDA.W $0016 
    STA.W $02D6,X 
    LDA.W #$0000 
    STA.W $02D8,X 
    TXA 
    CLC 
    ADC.W #$0009 
    TAX 
    TYA 
    CLC 
    ADC.W $0012 
    TAY 
    LDA.W $0016 
    CLC 
    ADC.W #$0080 
    STA.W $0016 
    DEC.W $0014 
    BEQ .return 
    BRA .loop 


.return:
    STX.W $0334 
    PLY 
    PLX 
    PLP 
    RTS 


UNUSED_CinematicBGObjects_IndirectInstructionFunction_8B89CF:
    JSR.W UNUSED_CinematicBGObjects_Mode7TilemapOffsetForTile_8B8A2C 
    LDA.W $0002,Y 
    AND.W #$00FF 
    STA.W $0012 
    LDA.W $0003,Y 
    AND.W #$00FF 
    STA.W $0014 
    TYA 
    CLC 
    ADC.W #$0004 
    TAY 
    LDX.W $0334 

.loop:
    LDA.W #$0080 
    STA.W $02D0,X 
    TYA 
    STA.W $02D1,X 
    LDA.W #$008B 
    STA.W $02D3,X 
    LDA.W $0014 
    STA.W $02D4,X 
    LDA.W $0016 
    STA.W $02D6,X 
    LDA.W #$0002 
    STA.W $02D8,X 
    TXA 
    CLC 
    ADC.W #$0009 
    TAX 
    TYA 
    CLC 
    ADC.W $0014 
    TAY 
    INC.W $0016 
    DEC.W $0012 
    BEQ .return 
    BRA .loop 


.return:
    STX.W $0334 
    PLY 
    PLX 
    PLP 
    RTS 


UNUSED_CinematicBGObjects_Mode7TilemapOffsetForTile_8B8A2C:
    LDA.W $0012 
    AND.W #$00FF 
    STA.W $0014 
    SEP #$20 
    LDA.B #$80 
    STA.W $4202 
    LDA.W $0013 
    STA.W $4203 
    NOP 
    NOP 
    NOP 
    REP #$20 
    LDA.W $4216 
    CLC 
    ADC.W $0014 
    STA.W $0016 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Calculate_SamusPosition_InRotatingElevatorRoom:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W $0AF6 
    SEC 
    SBC.B $80 
    STA.B $22 
    LDA.B $82 
    SEC 
    SBC.W $0AFA 
    STA.B $24 
    LDA.B $22 
    STA.B $26 
    LDA.B $78 
    STA.B $28 
    JSR.W Multiplication_16bitSigned_8B858F 
    SEP #$20 
    LDA.B $2A 
    XBA 
    LDA.B $2D 
    REP #$20 
    STA.B $1A 
    LDA.B $7A 
    STA.B $26 
    LDA.B $24 
    STA.B $28 
    JSR.W Multiplication_16bitSigned_8B858F 
    SEP #$20 
    LDA.B $2A 
    XBA 
    LDA.B $2D 
    REP #$20 
    CLC 
    ADC.B $1A 
    STA.B $1A 
    LDA.B $80 
    CLC 
    ADC.B $1A 
    STA.W $0AF6 
    LDA.B $7C 
    STA.B $26 
    LDA.B $22 
    STA.B $28 
    JSR.W Multiplication_16bitSigned_8B858F 
    SEP #$20 
    LDA.B $2A 
    XBA 
    LDA.B $2D 
    REP #$20 
    STA.B $1A 
    LDA.B $78 
    STA.B $26 
    LDA.B $24 
    STA.B $28 
    JSR.W Multiplication_16bitSigned_8B858F 
    SEP #$20 
    LDA.B $2A 
    XBA 
    LDA.B $2D 
    REP #$20 
    CLC 
    ADC.B $1A 
    STA.B $1A 
    LDA.B $82 
    SEC 
    SBC.B $1A 
    STA.W $0AFA 
    PLB 
    PLP 
    RTL 


Calculate_ProjectilePosition_InRotatingElevatorRoom:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W $0B64,X 
    SEC 
    SBC.B $80 
    STA.B $22 
    LDA.B $82 
    SEC 
    SBC.W $0B78,X 
    STA.B $24 
    LDA.B $22 
    STA.B $26 
    LDA.B $78 
    STA.B $28 
    JSR.W Multiplication_16bitSigned_8B858F 
    SEP #$20 
    LDA.B $2A 
    XBA 
    LDA.B $2D 
    REP #$20 
    STA.B $1A 
    LDA.B $7A 
    STA.B $26 
    LDA.B $24 
    STA.B $28 
    JSR.W Multiplication_16bitSigned_8B858F 
    SEP #$20 
    LDA.B $2A 
    XBA 
    LDA.B $2D 
    REP #$20 
    CLC 
    ADC.B $1A 
    STA.B $1A 
    LDA.B $80 
    CLC 
    ADC.B $1A 
    SEC 
    SBC.W $0911 
    STA.B $14 
    LDA.B $7C 
    STA.B $26 
    LDA.B $22 
    STA.B $28 
    JSR.W Multiplication_16bitSigned_8B858F 
    SEP #$20 
    LDA.B $2A 
    XBA 
    LDA.B $2D 
    REP #$20 
    STA.B $1A 
    LDA.B $78 
    STA.B $26 
    LDA.B $24 
    STA.B $28 
    JSR.W Multiplication_16bitSigned_8B858F 
    SEP #$20 
    LDA.B $2A 
    XBA 
    LDA.B $2D 
    REP #$20 
    CLC 
    ADC.B $1A 
    STA.B $1A 
    LDA.B $82 
    SEC 
    SBC.B $1A 
    SEC 
    SBC.W $0915 
    STA.B $12 
    PLB 
    PLP 
    RTL 


Calculate_CeresSteamPosition_InRotatingElevatorRoom:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.B $12 
    SEC 
    SBC.B $80 
    STA.B $22 
    LDA.B $82 
    SEC 
    SBC.B $14 
    STA.B $24 
    LDA.B $22 
    STA.B $26 
    LDA.B $78 
    STA.B $28 
    JSR.W Multiplication_16bitSigned_8B858F 
    SEP #$20 
    LDA.B $2A 
    XBA 
    LDA.B $2D 
    REP #$20 
    STA.B $1A 
    LDA.B $7A 
    STA.B $26 
    LDA.B $24 
    STA.B $28 
    JSR.W Multiplication_16bitSigned_8B858F 
    SEP #$20 
    LDA.B $2A 
    XBA 
    LDA.B $2D 
    REP #$20 
    CLC 
    ADC.B $1A 
    STA.B $1A 
    LDA.B $80 
    CLC 
    ADC.B $1A 
    STA.B $12 
    LDA.B $7C 
    STA.B $26 
    LDA.B $22 
    STA.B $28 
    JSR.W Multiplication_16bitSigned_8B858F 
    SEP #$20 
    LDA.B $2A 
    XBA 
    LDA.B $2D 
    REP #$20 
    STA.B $1A 
    LDA.B $78 
    STA.B $26 
    LDA.B $24 
    STA.B $28 
    JSR.W Multiplication_16bitSigned_8B858F 
    SEP #$20 
    LDA.B $2A 
    XBA 
    LDA.B $2D 
    REP #$20 
    CLC 
    ADC.B $1A 
    STA.B $1A 
    LDA.B $82 
    SEC 
    SBC.B $1A 
    STA.B $14 
    PLB 
    PLP 
    RTL 


PaletteCrossFading_CopyCurrentPalettesToFadingPalettes:
    PHP 
    PHB 
    SEP #$30 
    LDA.B #$7F 
    PHA 
    PLB 
    REP #$30 
    LDY.W #$0100 
    LDX.W #$0000 

.loop:
    LDA.L $7EC000,X 
    STA.L $7E2200,X 
    INX 
    INX 
    DEY 
    BNE .loop 
    PLB 
    PLP 
    RTS 


PaletteCrossFading_DecomposePaletteDataForFading:
    PHP 
    PHB 
    SEP #$30 
    LDA.B #$7F 
    PHA 
    PLB 
    REP #$30 
    LDX.W #$0000 
    LDY.W #$0100 

.loop:
    LDA.L $7E2200,X 
    STA.B $12 
    AND.W #$001F 
    XBA 
    STA.L $7E2400,X 
    XBA 
    ASL #3
    STA.L $7E2A00,X 
    LDA.B $12 
    AND.W #$03E0 
    ASL #3
    STA.L $7E2600,X 
    XBA 
    ASL #3
    STA.L $7E2C00,X 
    LDA.B $12 
    AND.W #$7C00 
    LSR #2
    STA.L $7E2800,X 
    XBA 
    ASL #3
    STA.L $7E2E00,X 
    INX 
    INX 
    DEY 
    BNE .loop 
    PLB 
    PLP 
    RTS 


PaletteCrossFading_ClearYColorsStartingFromColorIndexX:
    PHP 
    PHB 
    SEP #$20 
    LDA.B #$7F 
    PHA 
    PLB 
    REP #$30 

.loop:
    LDA.W #$0000 
    STA.L $7E2200,X 
    STA.L $7E2400,X 
    STA.L $7E2600,X 
    STA.L $7E2800,X 
    INX 
    INX 
    DEY 
    BNE .loop 
    PLB 
    PLP 
    RTS 


PaletteCrossFading_FadeOutYColorsStartingFromColorIndexX:
    PHP 

.loop:
    LDA.L $7E2400,X 
    SEC 
    SBC.L $7E2A00,X 
    STA.L $7E2400,X 
    LDA.L $7E2600,X 
    SEC 
    SBC.L $7E2C00,X 
    STA.L $7E2600,X 
    LDA.L $7E2800,X 
    SEC 
    SBC.L $7E2E00,X 
    STA.L $7E2800,X 
    INX 
    INX 
    DEY 
    BNE .loop 
    PLP 
    RTS 


PaletteCrossFading_FadeInYColorsStartingFromColorIndexX:
    PHP 

.loop:
    LDA.L $7E2400,X 
    CLC 
    ADC.L $7E2A00,X 
    AND.W #$1FFF 
    STA.L $7E2400,X 
    LDA.L $7E2600,X 
    CLC 
    ADC.L $7E2C00,X 
    AND.W #$1FFF 
    STA.L $7E2600,X 
    LDA.L $7E2800,X 
    CLC 
    ADC.L $7E2E00,X 
    AND.W #$1FFF 
    STA.L $7E2800,X 
    INX 
    INX 
    DEY 
    BNE .loop 
    PLP 
    RTS 


PaletteCrossFading_ComposeFadingPalettes:
    PHP 
    LDX.W #$0000 
    LDY.W #$0100 

.loop:
    LDA.L $7E2400,X 
    XBA 
    AND.W #$001F 
    STA.B $12 
    LDA.L $7E2600,X 
    LSR #3
    AND.W #$03E0 
    ORA.B $12 
    STA.B $12 
    LDA.L $7E2800,X 
    ASL #2
    AND.W #$7C00 
    ORA.B $12 
    STA.L $7E2000,X 
    STA.L $7EC000,X 
    INX 
    INX 
    DEY 
    BNE .loop 
    PLP 
    RTS 


LoadJapanTextIntroTiles:
    PHP 
    REP #$30 
    PHX 
    LDA.W $0000,Y 
    TAX 
    LDA.W $0002,Y 
    STA.B $12 

.loop:
    LDA.W $0004,Y 
    STA.B $16 
    PHY 
    LDA.W #$A000 
    CLC 
    ADC.B $16 
    TAY 
    PHB 
    PEA.W $7F00 
    PLB 
    PLB 
    LDA.W $0000,Y 
    STA.L $7E4000,X 
    LDA.W $0002,Y 
    STA.L $7E4002,X 
    LDA.W $0004,Y 
    STA.L $7E4004,X 
    LDA.W $0006,Y 
    STA.L $7E4006,X 
    LDA.W $0008,Y 
    STA.L $7E4008,X 
    LDA.W $000A,Y 
    STA.L $7E400A,X 
    LDA.W $000C,Y 
    STA.L $7E400C,X 
    LDA.W $000E,Y 
    STA.L $7E400E,X 
    PLB 
    PLY 
    LDA.W $0006,Y 
    STA.B $16 
    TXA 
    CLC 
    ADC.W #$0300 
    TAX 
    PHY 
    LDA.W #$A000 
    CLC 
    ADC.B $16 
    TAY 
    PHB 
    PEA.W $7F00 
    PLB 
    PLB 
    LDA.W $0000,Y 
    STA.L $7E4000,X 
    LDA.W $0002,Y 
    STA.L $7E4002,X 
    LDA.W $0004,Y 
    STA.L $7E4004,X 
    LDA.W $0006,Y 
    STA.L $7E4006,X 
    LDA.W $0008,Y 
    STA.L $7E4008,X 
    LDA.W $000A,Y 
    STA.L $7E400A,X 
    LDA.W $000C,Y 
    STA.L $7E400C,X 
    LDA.W $000E,Y 
    STA.L $7E400E,X 
    PLB 
    PLY 
    TXA 
    SEC 
    SBC.W #$02F0 
    TAX 
    TYA 
    CLC 
    ADC.W #$0004 
    TAY 
    DEC.B $12 
    BEQ .return 
    JMP.W .loop 


.return:
    PLX 
    PLP 
    RTS 


TransferJapanTextTilesToVRAM:
    PHX 
    LDX.W $0330 
    LDA.W #$0600 
    STA.B $D0,X 
    INX 
    INX 
    LDA.W #$4000 
    STA.B $D0,X 
    INX 
    INX 
    SEP #$20 
    LDA.B #$7E 
    STA.B $D0,X 
    REP #$20 
    INX 
    LDA.W #$4180 
    STA.B $D0,X 
    INX 
    INX 
    STX.W $0330 
    PLX 
    RTS 


HandleSamusDuringIntro:
    LDA.W $1A57 
    BEQ .return 
    JSL.L SamusCurrentStateHandler 
    JSL.L SamusNewStateHandler 
    LDA.W $18A8 
    BEQ .handleKnockback 
    DEC A 
    STA.W $18A8 

.handleKnockback:
    LDA.W $18AA 
    BEQ .return 
    DEC A 
    STA.W $18AA 

.return:
    RTS 


DrawIntroSprites:
    LDA.W $1A57 
    BEQ .noSamus 
    BMI .samusPriority 
    JSR.W Draw_CinematicSpriteObjects_IntroTitleSequence 
    JSL.L DrawSamusAndProjectiles 
    JSL.L DrawProjectiles 
    BRA .return 


.samusPriority:
    JSL.L DrawSamusAndProjectiles 
    JSL.L DrawProjectiles 
    JSR.W Draw_CinematicSpriteObjects_IntroTitleSequence 
    BRA .return 


.noSamus:
    JSR.W Draw_CinematicSpriteObjects_IntroTitleSequence 

.return:
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_CalculateXYComponentsOfRadiusAAngleY_8B8E52:
    PHP 
    REP #$30 
    PHX 
    STA.B $18 
    TYA 
    STA.B $1A 
    CMP.W #$0080 
    BPL + 
    ASL A 
    TAX 
    JSR.W UNUSED_Math_8B8EA3 
    BRA .storeXComponent 


  + SEC 
    SBC.W #$0080 
    AND.W #$00FF 
    ASL A 
    TAX 
    JSR.W UNUSED_Math_8B8EA3 
    EOR.W #$FFFF 
    INC A 

.storeXComponent:
    STA.B $14 
    LDA.B $1A 
    SEC 
    SBC.W #$0040 
    AND.W #$00FF 
    CMP.W #$0080 
    BPL + 
    ASL A 
    TAX 
    JSR.W UNUSED_Math_8B8EA3 
    BRA .storeYComponent 


  + SEC 
    SBC.W #$0080 
    AND.W #$00FF 
    ASL A 
    TAX 
    JSR.W UNUSED_Math_8B8EA3 
    EOR.W #$FFFF 
    INC A 

.storeYComponent:
    STA.B $16 
    PLX 
    PLP 
    RTS 


UNUSED_Math_8B8EA3:
    SEP #$20 
    LDA.L SineCosineTables_8bitSine_SignExtended,X 
    STA.W $4202 
    LDA.B $18 
    STA.W $4203 
    NOP 
    NOP 
    NOP 
    REP #$20 
    LDA.W $4216 
    XBA 
    AND.W #$00FF 
    STA.B $12 
    SEP #$20 
    LDA.L SineCosineTables_8bitSine_SignExtended+1,X 
    STA.W $4202 
    LDA.B $18 
    STA.W $4203 
    NOP 
    NOP 
    NOP 
    REP #$20 
    LDA.W $4216 
    CLC 
    ADC.B $12 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


MoveUnusedSpritesOffScreen:
    PHP 
    REP #$30 
    LDA.W $0590 
    CMP.W #$0200 
    BPL .return 
    LSR #2
    PHA 
    AND.W #$0007 
    ASL A 
    TAY 
    PLA 
    LSR #2
    TAX 
    LDA.W $0570,X 
    ORA.W .Xpos,Y 
    STA.W $0570,X 
    CPX.W #$001E 
    BPL .setXpos 
    INX 
    INX 

.loop:
    LDA.W #$5555 
    STA.W $0570,X 
    INX 
    INX 
    CPX.W #$0020 
    BMI .loop 

.setXpos:
    LDA.W $0590 
    LSR A 
    STA.B $12 
    LSR A 
    ADC.B $12 
    CLC 
    ADC.W #.moveAllSprites 
    STA.B $12 
    LDA.W #$0080 
    SEP #$30 
    JMP.W ($0012) 


.return:
    PLP 
    RTS 


.Xpos: 
    dw $5555 ; Sprites 0..7 high X position bits
    dw $5554 ; Sprites 1..7 high X position bits
    dw $5550 ; Sprites 2..7 high X position bits
    dw $5540 ; Sprites 3..7 high X position bits
    dw $5500 ; Sprites 4..7 high X position bits
    dw $5400 ; Sprites 5..7 high X position bits
    dw $5000 ; Sprites 6..7 high X position bits
    dw $4000 ; Sprites 7 high X position bit

.moveAllSprites:
    STA.W $0370 
    STA.W $0374 
    STA.W $0378 
    STA.W $037C 
    STA.W $0380 
    STA.W $0384 
    STA.W $0388 
    STA.W $038C 
    STA.W $0390 
    STA.W $0394 
    STA.W $0398 
    STA.W $039C 
    STA.W $03A0 
    STA.W $03A4 
    STA.W $03A8 
    STA.W $03AC 
    STA.W $03B0 
    STA.W $03B4 
    STA.W $03B8 
    STA.W $03BC 
    STA.W $03C0 
    STA.W $03C4 
    STA.W $03C8 
    STA.W $03CC 
    STA.W $03D0 
    STA.W $03D4 
    STA.W $03D8 
    STA.W $03DC 
    STA.W $03E0 
    STA.W $03E4 
    STA.W $03E8 
    STA.W $03EC 
    STA.W $03F0 
    STA.W $03F4 
    STA.W $03F8 
    STA.W $03FC 
    STA.W $0400 
    STA.W $0404 
    STA.W $0408 
    STA.W $040C 
    STA.W $0410 
    STA.W $0414 
    STA.W $0418 
    STA.W $041C 
    STA.W $0420 
    STA.W $0424 
    STA.W $0428 
    STA.W $042C 
    STA.W $0430 
    STA.W $0434 
    STA.W $0438 
    STA.W $043C 
    STA.W $0440 
    STA.W $0444 
    STA.W $0448 
    STA.W $044C 
    STA.W $0450 
    STA.W $0454 
    STA.W $0458 
    STA.W $045C 
    STA.W $0460 
    STA.W $0464 
    STA.W $0468 
    STA.W $046C 
    STA.W $0470 
    STA.W $0474 
    STA.W $0478 
    STA.W $047C 
    STA.W $0480 
    STA.W $0484 
    STA.W $0488 
    STA.W $048C 
    STA.W $0490 
    STA.W $0494 
    STA.W $0498 
    STA.W $049C 
    STA.W $04A0 
    STA.W $04A4 
    STA.W $04A8 
    STA.W $04AC 
    STA.W $04B0 
    STA.W $04B4 
    STA.W $04B8 
    STA.W $04BC 
    STA.W $04C0 
    STA.W $04C4 
    STA.W $04C8 
    STA.W $04CC 
    STA.W $04D0 
    STA.W $04D4 
    STA.W $04D8 
    STA.W $04DC 
    STA.W $04E0 
    STA.W $04E4 
    STA.W $04E8 
    STA.W $04EC 
    STA.W $04F0 
    STA.W $04F4 
    STA.W $04F8 
    STA.W $04FC 
    STA.W $0500 
    STA.W $0504 
    STA.W $0508 
    STA.W $050C 
    STA.W $0510 
    STA.W $0514 
    STA.W $0518 
    STA.W $051C 
    STA.W $0520 
    STA.W $0524 
    STA.W $0528 
    STA.W $052C 
    STA.W $0530 
    STA.W $0534 
    STA.W $0538 
    STA.W $053C 
    STA.W $0540 
    STA.W $0544 
    STA.W $0548 
    STA.W $054C 
    STA.W $0550 
    STA.W $0554 
    STA.W $0558 
    STA.W $055C 
    STA.W $0560 
    STA.W $0564 
    STA.W $0568 
    STA.W $056C 
    PLP 
    RTS 


AdvanceFastScreenFadeOut:
    PHP 
    SEP #$30 
    LDA.B $51 
    AND.B #$0F 
    BEQ .return 
    SEC 
    SBC.W $0725 
    BEQ .forcedBlank 
    BMI .forcedBlank 
    STA.B $51 
    PLP 
    CLC 
    RTS 


.forcedBlank:
    LDA.B #$80 
    STA.B $51 

.return:
    PLP 
    SEC 
    RTS 


AdvanceSlowScreenFadeOut:
    PHP 
    SEP #$30 
    DEC.W $0723 
    BEQ .checkBrightness 
    BPL .returnFading 

.checkBrightness:
    LDA.B $51 
    AND.B #$0F 
    BEQ .done 
    DEC A 
    BEQ .zeroBrightness 
    STA.B $51 
    LDA.W $0725 
    STA.W $0723 

.returnFading:
    PLP 
    CLC 
    RTS 


.zeroBrightness:
    LDA.B #$80 
    STA.B $51 
    STZ.W $0723 
    STZ.W $0725 

.done:
    PLP 
    SEC 
    RTS 


AdvanceFastScreenFadeIn:
    PHP 
    SEP #$30 
    LDA.B $51 
    CLC 
    ADC.W $0725 
    AND.B #$1F 
    CMP.B #$0F 
    BPL .disableForcedBlank 
    STA.B $51 
    PLP 
    CLC 
    RTS 


.disableForcedBlank:
    LDA.B #$0F 
    STA.B $51 
    PLP 
    SEC 
    RTS 


AdvanceSlowScreenFadeIn:
    PHP 
    SEP #$30 
    DEC.W $0723 
    BEQ .checkBrightness 
    BPL .fading 

.checkBrightness:
    LDA.B $51 
    INC A 
    AND.B #$1F 
    CMP.B #$0F 
    BPL .maxBrightness 
    STA.B $51 
    LDA.W $0725 
    STA.W $0723 

.fading:
    PLP 
    CLC 
    RTS 


.maxBrightness:
    LDA.B #$0F 
    STA.B $51 
    STZ.W $0723 
    STZ.W $0725 
    PLP 
    SEC 
    RTS 


Initialise_IO_Registers_and_Display_Nintendo_Logo:
    PHP 
    PHB 
    PHK 
    PLB 
    SEP #$30 
    LDA.B #$8F 
    STA.W $2100 
    STA.B $51 
    REP #$30 
    STZ.W $0590 
    JSL.L ClearHighOAM 
    JSL.L Finalise_OAM 
    STZ.W $071D 
    STZ.W $071F 
    STZ.W $0721 
    SEP #$20 
    LDA.B #$01 
    STA.W $4200 
    STA.B $84 
    STZ.W $4201 
    STZ.W $4202 
    STZ.W $4203 
    STZ.W $4204 
    STZ.W $4205 
    STZ.W $4206 
    STZ.W $4207 
    STZ.W $4208 
    STZ.W $4209 
    STZ.W $420A 
    STZ.W $420B 
    STZ.W $420C 
    STZ.B $85 
    LDA.B #$01 
    STA.W $420D 
    STA.B $86 
    LDA.B #$03 
    STA.W $2101 
    STA.B $52 
    STZ.W $2102 
    STZ.B $53 
    LDA.B #$80 
    STA.W $2103 
    STA.B $54 
    STZ.W $2104 
    STZ.W $2104 
    LDA.B #$01 
    STA.W $2105 
    STA.B $55 
    STZ.W $2106 
    STZ.B $57 
    STZ.W $2107 
    STZ.B $58 
    STZ.W $2108 
    STZ.B $59 
    STZ.W $2109 
    STZ.B $5A 
    STZ.W $210A 
    STZ.B $5C 
    STZ.W $210B 
    STZ.B $5D 
    STZ.W $210C 
    STZ.B $5E 
    STZ.W $210D 
    STZ.W $210D 
    STZ.W $210E 
    STZ.W $210E 
    STZ.W $210F 
    STZ.W $210F 
    STZ.W $2110 
    STZ.W $2110 
    STZ.W $2111 
    STZ.W $2111 
    STZ.W $2112 
    STZ.W $2112 
    STZ.W $2113 
    STZ.W $2113 
    STZ.W $2114 
    STZ.W $2114 
    STZ.W $2115 
    STZ.W $211A 
    STZ.B $5F 
    STZ.W $211B 
    STZ.W $211C 
    STZ.W $211D 
    STZ.W $211E 
    STZ.W $211F 
    STZ.W $2120 
    STZ.W $2123 
    STZ.B $60 
    STZ.W $2124 
    STZ.B $61 
    STZ.W $2125 
    STZ.B $62 
    STZ.W $2126 
    STZ.B $63 
    STZ.W $2127 
    STZ.B $64 
    STZ.W $2128 
    STZ.B $65 
    STZ.W $2129 
    STZ.B $66 
    STZ.W $212A 
    STZ.B $67 
    STZ.W $212B 
    STZ.B $68 
    LDA.B #$10 
    STA.W $212C 
    STA.B $69 
    STZ.W $212E 
    STZ.B $6C 
    STZ.W $212D 
    STZ.B $6B 
    STZ.W $212F 
    STZ.B $6D 
    STZ.W $2130 
    STZ.B $6E 
    STZ.W $2131 
    STZ.B $71 
    LDA.B #$E0 
    STA.W $2132 
    LDA.B #$20 
    STA.B $74 
    LDA.B #$40 
    STA.B $75 
    LDA.B #$80 
    STA.B $76 
    LDA.B #$00 
    STA.W $2133 
    STA.B $77 
    REP #$20 
    LDA.W #Tiles_Title_Sprite>>8&$FF00 
    STA.B $48 
    LDA.W #Tiles_Title_Sprite 
    STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7F5000 
    SEP #$30 
    LDA.B #$00 
    STA.W $2116 
    LDA.B #$60 
    STA.W $2117 
    LDA.B #$80 
    STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl $7F5000 
    dw $4000 
    LDA.B #$02 
    STA.W $420B 
    LDA.B #$80 
    STA.B $51 
    REP #$30 
    LDX.W #$0000 

.loop:
    LDA.L Palettes_TitleScreen,X 
    STA.L $7EC000,X 
    INX 
    INX 
    CPX.W #$0200 
    BMI .loop 
    JSL.L EnableNMI 
    LDA.W #$0001 
    STA.W $0723 
    STA.W $0725 

.fadeIn:
    JSL.L ClearHighOAM 
    STZ.W $0590 
    JSR.W AddNintendoBootLogoSpritemapToOAM 
    JSR.W AdvanceFastScreenFadeIn 
    BCS .maxBrightness 
    JSL.L Finalise_OAM 
    JSL.L WaitForNMI 
    BRA .fadeIn 


.maxBrightness:
    JSL.L Finalise_OAM 
    JSL.L WaitForNMI 
    LDA.W #$0078 
    STA.W $0DE2 

.loopNintendoLogo:
    JSL.L ClearHighOAM 
    STZ.W $0590 
    JSR.W AddNintendoBootLogoSpritemapToOAM 
    DEC.W $0DE2 
    BEQ .timerExpired 
    JSL.L Finalise_OAM 
    JSL.L WaitForNMI 
    BRA .loopNintendoLogo 


.timerExpired:
    JSL.L Finalise_OAM 
    JSL.L WaitForNMI 
    LDA.W #$0001 
    STA.W $0723 
    STA.W $0725 

.loopFadeOut:
    JSL.L ClearHighOAM 
    STZ.W $0590 
    JSR.W AddNintendoBootLogoSpritemapToOAM 
    JSR.W AdvanceFastScreenFadeOut 
    BCS .zeroBrightness 
    JSL.L Finalise_OAM 
    JSL.L WaitForNMI 
    BRA .loopFadeOut 


.zeroBrightness:
    JSL.L Finalise_OAM 
    JSL.L WaitForNMI 
    SEP #$30 
    LDA.B #$8F 
    STA.W $2100 
    STA.B $51 
    REP #$30 
    PLB 
    PLP 
    RTL 


AddNintendoBootLogoSpritemapToOAM:
    PHP 
    REP #$30 
    PHB 
    PEA.W TitleSequenceSpritemaps_NintendoBootLogo>>8&$FF00 
    PLB 
    PLB 
    LDY.W #TitleSequenceSpritemaps_NintendoBootLogo 
    STZ.B $16 
    LDA.W #$0080 
    STA.B $14 
    LDA.W #$0070 
    STA.B $12 
    JSL.L AddSpritemapToOAM 
    PLB 
    PLP 
    RTS 


Spawn_CinematicSpriteObject_Y:
    PHP 
    REP #$30 
    PHX 
    STA.W $1B9D 
    TYX 
    LDY.W #$001E 

.loop:
    LDA.W $1B1D,Y 
    BEQ SpawnCinematicSpriteObject_XToIndexY 
    DEY 
    DEY 
    BPL .loop 
    PLX 
    PLP 
    SEC 
    RTS 


Spawn_CinematicSpriteObject_YToIndex12:
    PHP 
    REP #$30 
    PHX 
    STA.W $1B9D 
    TYX 
    LDY.B $12 

SpawnCinematicSpriteObject_XToIndexY:
    REP #$30 
    LDA.W $0002,X 
    STA.W $1B3D,Y 
    LDA.W $0004,X 
    STA.W $1B1D,Y 
    LDA.W #$0001 
    STA.W $1B5D,Y 
    LDA.W #$0000 
    STA.W $1A5D,Y 
    LDA.W #$0000 
    STA.W $1B7D,Y 
    STA.W $1ADD,Y 
    STA.W $1AFD,Y 
    JSR.W ($0000,X) 
    PLX 
    PLP 
    CLC 
    RTS 


RTS_8B93D9:
    RTS 


Clear_CinematicSpriteObjects:
    PHP 
    REP #$30 
    LDX.W #$001E 
    LDA.W #$0000 

.loop:
    STA.W $1B1D,X 
    STA.W $1A5D,X 
    DEX 
    DEX 
    BPL .loop 
    PLP 
    RTS 


Handle_CinematicSpriteObjects:
    PHP 
    REP #$30 
    LDX.W #$001E 

.loop:
    STX.W $1A59 
    LDA.W $1B1D,X 
    BEQ .next 
    JSR.W Process_CinematicSpriteObjects_InstList 
    LDX.W $1A59 

.next:
    DEX 
    DEX 
    BPL .loop 
    PLP 
    RTS 


Process_CinematicSpriteObjects_InstList:
    JSR.W ($1B3D,X) 
    LDX.W $1A59 
    DEC.W $1B5D,X 
    BNE .return 
    LDY.W $1B1D,X 

.loop:
    LDA.W $0000,Y 
    BPL + 
    STA.B $12 
    INY 
    INY 
    PEA.W .loop-1 
    JMP.W ($0012) 


  + STA.W $1B5D,X 
    LDA.W $0002,Y 
    STA.W $1A5D,X 
    TYA 
    CLC 
    ADC.W #$0004 
    STA.W $1B1D,X 

.return:
    RTS 


CinematicSpriteObject_Instruction_Delete:
    REP #$30 
    STZ.W $1A5D,X 
    STZ.W $1B1D,X 
    PLA 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_CinematicSpriteObject_Instruction_Sleep_8B9442:
    REP #$30 
    DEY 
    DEY 
    TYA 
    STA.W $1B1D,X 
    PLA 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


CinematicSpriteObject_Instruction_PreInstructionY:
    REP #$30 
    LDA.W $0000,Y 
    STA.W $1B3D,X 
    INY 
    INY 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_CinematicSpriteObject_Inst_ClearPreInstruction_8B9457:
    REP #$30 
    LDA.W #.return 
    STA.W $1B3D,X 

  .return
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


CinematicSpriteObject_Inst_CallExternalFunctionY_8B9460:
    REP #$30 
    LDA.W $0000,Y 
    STA.W $0012 
    LDA.W $0001,Y 
    STA.W $0013 
    PHY 
    JSL.L .externalFunction 
    PLY 
    LDX.W $1A59 
    INY 
    INY 
    INY 
    RTS 


.externalFunction:
    JML.W [$0012] 


CinematicSpriteObject_Inst_CallExternalFunctionYWithA_8B947E:
    REP #$30 
    LDA.W $0000,Y 
    STA.W $0012 
    LDA.W $0001,Y 
    STA.W $0013 
    LDA.W $0003,Y 
    PHY 
    JSL.L .externalFunction 
    PLY 
    LDX.W $1A59 
    TYA 
    CLC 
    ADC.W #$0005 
    TAY 
    RTS 


.externalFunction:
    JML.W [$0012] 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_CinematicSpriteObject_Inst_GotoY_8B94A2:
    REP #$30 
    STY.W $0012 
    DEY 
    LDA.W $0000,Y 
    XBA 
    BMI .highByte 
    AND.W #$00FF 
    BRA + 


.highByte:
    ORA.W #$FF00 

  + CLC 
    ADC.W $0012 
    TAY 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


CinematicSpriteObject_Instruction_GotoY:
    REP #$30 
    LDA.W $0000,Y 
    TAY 
    RTS 


CinematicSpriteObject_Inst_DecrementTimer_GotoYIfNonZero:
    REP #$30 
    DEC.W $1B7D,X 
    BNE CinematicSpriteObject_Instruction_GotoY 
    INY 
    INY 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_CinematicSpriteObject_Inst_DecTimer_GotoY_8B94CD:
    REP #$30 
    DEC.W $1B7D,X 
    BNE UNUSED_CinematicSpriteObject_Inst_GotoY_8B94A2 
    INY 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


CinematicSpriteObject_Instruction_TimerInY:
    REP #$30 
    LDA.W $0000,Y 
    STA.W $1B7D,X 
    INY 
    INY 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_REP30RTS_8B94E1:
    REP #$30 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Spawn_Mode7Objects:
    PHP 
    REP #$30 
    PHX 
    STA.W $19B3 
    TYX 
    LDY.W #$0002 

.loop:
    LDA.W $19A1,Y 
    BEQ .spawn 
    DEY 
    DEY 
    BPL .loop 
    PLX 
    PLP 
    SEC 
    RTS 


.spawn:
    REP #$30 
    LDA.W $0002,X 
    STA.W $19A5,Y 
    LDA.W $0004,X 
    STA.W $19A1,Y 
    LDA.W #$0001 
    STA.W $19A9,Y 
    LDA.W #$0000 
    STA.W $19AD,Y 
    JSR.W ($0000,X) 
    PLX 
    PLP 
    CLC 
    RTS 


Handle_Mode7Objects:
    PHP 
    REP #$30 
    LDX.W #$0002 

.loop:
    STX.W $19B1 
    LDA.W $19A1,X 
    BEQ .next 
    JSR.W Process_Mode7Objects_InstList 
    LDX.W $19B1 

.next:
    DEX 
    DEX 
    BPL .loop 
    PLP 
    RTS 


Process_Mode7Objects_InstList:
    JSR.W ($19A5,X) 
    LDX.W $19B1 
    DEC.W $19A9,X 
    BNE .return 
    LDY.W $19A1,X 

.loop:
    LDA.W $0000,Y 
    BPL .timer 
    STA.B $12 
    INY 
    INY 
    PEA.W .loop-1 
    JMP.W ($0012) 


.timer:
    STA.W $19A9,X 
    PHY 
    PHX 
    LDX.W $0002,Y 
    JSL.L QueueMode7Transfers 
    PLX 
    PLY 
    TYA 
    CLC 
    ADC.W #$0004 
    STA.W $19A1,X 

.return:
    RTS 


Mode7Objects_Instruction_Delete:
    REP #$30 
    STZ.W $19A1,X 
    PLA 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Mode7Objects_Instruction_PreInstructionY_8B9572:
    REP #$30 
    LDA.W $0000,Y 
    STA.W $19A5,X 
    INY 
    INY 
    RTS 


UNUSED_Mode7Objects_Instruction_ClearPreInstruction_8B957D:
    REP #$30 
    LDA.W #.return 
    STA.W $19A5,X 

  .return
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Mode7Objects_Instruction_GotoY:
    REP #$30 
    LDA.W $0000,Y 
    TAY 
    RTS 


Mode7Objects_Instruction_DecrementTimer_GotoYIfNonZero:
    REP #$30 
    DEC.W $19AD,X 
    BNE Mode7Objects_Instruction_GotoY 
    INY 
    INY 
    RTS 


Mode7Objects_Instruction_TimerInY:
    REP #$30 
    LDA.W $0000,Y 
    STA.W $19AD,X 
    INY 
    INY 
    RTS 


Enable_CinematicBGObjects:
    PHP 
    REP #$30 
    LDA.W #$8000 
    TSB.W $19F1 
    PLP 
    RTL 


Disable_CinematicBGObjects:
    PHP 
    REP #$30 
    LDA.W #$8000 
    TRB.W $19F1 
    PLP 
    RTL 


Enable_CinematicBGTilemap_Updates:
    PHP 
    REP #$30 
    LDA.W #$8000 
    TSB.W $19F3 
    PLP 
    RTL 


Disable_CinematicBGTilemap_Updates:
    PHP 
    REP #$30 
    LDA.W #$8000 
    TRB.W $19F3 
    PLP 
    RTL 


Clear_CinematicBGObjects_CinematicBGTilemap:
    PHP 
    REP #$30 
    PHX 
    LDX.W #$07FE 

.loopTilemap:
    STA.L $7E3000,X 
    DEX 
    DEX 
    BPL .loopTilemap 
    LDX.W #$0006 

.loopObjects:
    STZ.W $19B5,X 
    STZ.W $19CD,X 
    DEX 
    DEX 
    BPL .loopObjects 
    STZ.W $1BA1 
    PLX 
    PLP 
    RTL 


Spawn_CinematicBGObject:
    PHP 
    REP #$30 
    PHX 
    STA.W $19F5 
    TYX 
    LDY.W #$0006 

.loop:
    LDA.W $19CD,Y 
    BEQ .spawn 
    DEY 
    DEY 
    BPL .loop 
    PLX 
    PLP 
    SEC 
    RTS 


.spawn:
    REP #$30 
    LDA.W $0002,X 
    STA.W $19D5,Y 
    LDA.W $0004,X 
    STA.W $19CD,Y 
    LDA.W #$0001 
    STA.W $19DD,Y 
    LDA.W #$0000 
    STA.W $19B5,Y 
    LDA.W #$0000 
    STA.W $19E5,Y 
    JSR.W ($0000,X) 
    PLX 
    PLP 
    CLC 
    RTS 


Handle_CinematicBGObjects:
    PHP 
    REP #$30 
    BIT.W $19F1 
    BPL .return 
    LDX.W #$0006 

.loop:
    STX.W $19ED 
    LDA.W $19CD,X 
    BEQ .next 
    JSR.W Process_CinematicBGObject_InstList 
    LDX.W $19ED 

.next:
    DEX 
    DEX 
    BPL .loop 
    BIT.W $19F3 
    BPL .updateEyes 
    JSR.W CinematicBGObjects_Update32x30CinematicBGTilemap 

.updateEyes:
    JSR.W CinematicBGObjects_UpdateSamusEyesTilemap 

.return:
    PLP 
    RTS 


Process_CinematicBGObject_InstList:
    JSR.W ($19D5,X) 
    PHB 
    PEA.W $8C00 
    PLB 
    PLB 
    LDX.W $19ED 
    DEC.W $19DD,X 
    BNE .return 
    LDY.W $19CD,X 

.loop:
    LDA.W $0000,Y 
    BPL .timer 
    STA.B $12 
    INY 
    INY 
    PEA.W .loop-1 
    JMP.W ($0012) 


.timer:
    STA.W $19DD,X 
    LDA.W $0002,Y 
    STA.W $0012 
    LDA.W $0004,Y 
    STA.W $19B5,X 
    JSR.W CinematicBGObjects_ProcessIndirectInstruction 
    TYA 
    CLC 
    ADC.W #$0006 
    STA.W $19CD,X 

.return:
    PLB 
    RTS 


CinematicBGObject_Instruction_Delete:
    REP #$30 
    STZ.W $19B5,X 
    STZ.W $19CD,X 
    PLA 
    PLB 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_CinematicBGObject_Instruction_Sleep_8B96A3:
    REP #$30 
    DEY 
    DEY 
    TYA 
    STA.W $19CD,X 
    PLA 
    PLB 
    RTS 


UNUSED_CinematicBGObject_Instruction_PreInstructionY_8B96AE:
    REP #$30 
    LDA.W $0000,Y 
    STA.W $19D5,X 
    INY 
    INY 
    RTS 


UNUSED_CinematicBGObject_Inst_ClearPreInstruction_8B96B9:
    REP #$30 
    LDA.W #.return 
    STA.W $19D5,X 

  .return
    RTS 


UNUSED_CinematicBGObjects_Inst_CallExternalFunction_8B96C2:
    REP #$30 
    LDA.W $0000,Y 
    STA.W $0012 
    LDA.W $0001,Y 
    STA.W $0013 
    PHY 
    JSL.L .externalFunction 
    PLY 
    LDX.W $19ED 
    INY 
    INY 
    INY 
    RTS 


.externalFunction:
    JML.W [$0012] 


UNUSED_CinematicBGObjects_Inst_CallExternalFunction_8B96E0:
    REP #$30 
    LDA.W $0000,Y 
    STA.W $0012 
    LDA.W $0001,Y 
    STA.W $0013 
    LDA.W $0003,Y 
    PHY 
    JSL.L .externalFunction 
    PLY 
    LDX.W $19ED 
    TYA 
    CLC 
    ADC.W #$0005 
    TAY 
    RTS 


.externalFunction:
    JML.W [$0012] 


UNUSED_CinematicBGObjects_Inst_GotoY_8B9704:
    REP #$30 
    STY.W $0012 
    DEY 
    LDA.W $0000,Y 
    XBA 
    BMI .highByte 
    AND.W #$00FF 
    BRA + 


.highByte:
    ORA.W #$FF00 

  + CLC 
    ADC.W $0012 
    TAY 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


CinematicBGObject_Instruction_GotoY:
    REP #$30 
    LDA.W $0000,Y 
    TAY 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_CinematicBGObjects_Inst_DecrementTimer_GotoY_8B9724:
    REP #$30 
    DEC.W $19E5,X 
    BNE CinematicBGObject_Instruction_GotoY 
    INY 
    INY 
    RTS 


UNUSED_CinematicBGObjects_Inst_DecrementTimer_GotoY_8B972F:
    REP #$30 
    DEC.W $19E5,X 
    BNE UNUSED_CinematicBGObjects_Inst_GotoY_8B9704 
    INY 
    RTS 


UNUSED_CinematicBGObjects_Inst_TimerInY_8B9738:
    REP #$30 
    LDA.W $0000,Y 
    STA.W $19E5,X 
    INY 
    INY 
    RTS 


UNUSED_REP30RTS_8B9743:
    REP #$30 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Draw_CinematicSpriteObjects_IntroTitleSequence:
    PHP 
    REP #$30 
    PHB 
    LDX.W #$001E 

.loop:
    LDA.W $1A5D,X 
    BEQ .next 
    PEA.W $8C00 
    PLB 
    PLB 
    LDY.W $1A5D,X 
    LDA.W $1ABD,X 
    STA.B $16 
    LDA.W $1A7D,X 
    SEC 
    SBC.W $0911 
    STA.B $14 
    LDA.W $1A9D,X 
    SEC 
    SBC.W $0915 
    STA.B $12 
    BIT.W #$FF00 
    BNE + 
    CLC 
    ADC.W #$0080 
    CMP.W #$01FF 
    BCS .next 
    JSL.L AddSpritemapToOAM 
    BRA .next 


  + CLC 
    ADC.W #$0080 
    CMP.W #$01FF 
    BCS .next 
    JSL.L AddSpritemapToOAM_Offscreen 

.next:
    DEX 
    DEX 
    BPL .loop 
    PLB 
    PLP 
    RTS 


Draw_CinematicSpriteObjects_EndingCredits:
    PHP 
    REP #$30 
    PHB 
    LDX.W #$001E 

.loop:
    LDA.W $1A5D,X 
    BEQ .next 
    PEA.W $8C00 
    PLB 
    PLB 
    LDY.W $1A5D,X 
    LDA.W $1ABD,X 
    STA.B $16 
    LDA.W $1A7D,X 
    SEC 
    SBC.W $0911 
    STA.B $14 
    LDA.W $1A9D,X 
    SEC 
    SBC.W $0915 
    STA.B $12 
    BIT.W #$FF00 
    BNE + 
    CLC 
    ADC.W #$0080 
    CMP.W #$01FF 
    BCS .next 
    JSL.L AddSpritemapToOAM 
    BRA .next 


  + CLC 
    ADC.W #$0080 
    CMP.W #$01FF 
    BCS .next 
    JSL.L AddSpritemapToOAM_Offscreen 

.next:
    DEX 
    DEX 
    BPL .loop 
    PLB 
    LDA.W $1F51 
    CMP.W #CinematicFunc_Ending_ZebesDestruction2_CrossFade_FadingIn 
    BPL .return 
    JSR.W MoveUnusedSpritesOffScreen 

.return:
    PLP 
    RTS 


Spawn_TextGlowObject:
    PHX 
    LDX.W #$000E 

.loop:
    LDA.W $19F7,X 
    BEQ .spawn 
    DEX 
    DEX 
    BPL .loop 
    PLX 
    RTS 


.spawn:
    TYA 
    STA.W $19F7,X 
    LDA.W #$0001 
    STA.W $1A07,X 
    LDA.B $12 
    AND.W #$00FF 
    STA.W $1A17,X 
    LDA.B $13 
    AND.W #$00FF 
    STA.W $1A27,X 
    LDA.W #$0000 
    STA.W $1A37,X 
    PLX 
    RTS 


Handle_TextGlowObject:
    PHP 
    REP #$30 
    PHB 
    PEA.W $8C00 
    PLB 
    PLB 
    LDX.W #$000E 

.loop:
    STX.W $1A47 
    LDA.W $19F7,X 
    BEQ .next 
    JSR.W Process_TextGlowObject 
    LDX.W $1A47 

.next:
    DEX 
    DEX 
    BPL .loop 
    PLB 
    PLP 
    RTS 


Process_TextGlowObject:
    LDX.W $1A47 
    DEC.W $1A07,X 
    BEQ + 
    RTS 


  + LDA.W $1A37,X 
    STA.B $1C 
    LDY.W $19F7,X 
    LDA.W $1A17,X 
    AND.W #$00FF 
    ASL A 
    STA.W $0014 
    SEP #$20 
    LDA.B #$40 
    STA.W $4202 
    LDA.W $1A27,X 
    STA.W $4203 
    NOP 
    NOP 
    NOP 
    REP #$20 
    LDA.W $4216 
    CLC 
    ADC.W $0014 
    STA.W $0016 
    TAX 
    LDA.W $0002,Y 
    AND.W #$00FF 
    STA.W $0012 
    STA.W $0018 
    LDA.W $0003,Y 
    AND.W #$00FF 
    STA.W $0014 

.loop:
    LDA.L $7E3000,X 
    AND.W #$E3FF 
    ORA.B $1C 
    STA.L $7E3000,X 
    INY 
    INY 
    INX 
    INX 
    DEC.W $0012 
    BEQ + 
    BRA .loop 


  + LDA.W $0018 
    STA.W $0012 
    DEC.W $0014 
    BEQ + 
    LDA.W $0016 
    CLC 
    ADC.W #$0040 
    STA.W $0016 
    TAX 
    BRA .loop 


  + LDX.W $1A47 
    LDA.W $1A37,X 
    CMP.W #$0C00 
    BEQ .return 
    CLC 
    ADC.W #$0400 
    STA.W $1A37,X 
    LDA.W #$0005 
    STA.W $1A07,X 
    RTS 


.return:
    STZ.W $19F7,X 
    RTS 


Enable_CreditsObject:
    PHP 
    REP #$30 
    LDA.W #$8000 
    TSB.W $19FF 
    PLP 
    RTS 


Disable_CreditsObject:
    PHP 
    REP #$30 
    LDA.W #$8000 
    TRB.W $19FF 
    PLP 
    RTS 


Clear_CreditsObject_CinematicBGTilemapInA:
    PHP 
    REP #$30 
    PHX 
    LDX.W #$07FE 

.loop:
    STA.L $7E3000,X 
    DEX 
    DEX 
    BPL .loop 
    LDA.W #$0000 
    STA.W $1A01 
    STZ.W $19F7 
    STZ.W $19F9 
    STZ.W $19FB 
    STZ.W $19FD 
    LDA.W #$4800 
    STA.W $19F5 
    STZ.W $1A03 
    STZ.W $1991 
    STZ.W $1993 
    STZ.W $1995 
    STZ.W $1997 
    PLX 
    PLP 
    RTS 


Spawn_CreditsObject:
    PHP 
    REP #$30 
    PHX 
    TYX 
    LDA.W $0002,X 
    STA.W $19FD 
    LDA.W $0004,X 
    STA.W $19F7 
    LDA.W #$0001 
    STA.W $19F9 
    LDA.W #$0000 
    STA.W $19FB 
    JSR.W ($0000,X) 
    PLX 
    PLP 
    RTS 


Handle_CreditsObject:
    PHP 
    REP #$30 
    BIT.W $19FF 
    BPL .return 
    LDA.W $19F7 
    BEQ .updateTilemap 
    JSR.W Process_CreditsObject_InstList 

.updateTilemap:
    JSR.W CinematicBGObjects_Update32x32CinematicBGTilemap 

.return:
    PLP 
    RTS 


Process_CreditsObject_InstList:
    LDX.W #$0000 
    JSR.W ($19FD,X) 
    PHB 
    PEA.W $8C00 
    PLB 
    PLB 
    LDA.W $1995 
    CLC 
    ADC.W #$8000 
    STA.W $1995 
    LDA.W $1997 
    ADC.W #$0000 
    STA.W $1997 
    SEC 
    SBC.W $1A03 
    CMP.W #$0008 
    BMI .return 
    LDA.W $1997 
    STA.W $1A03 
    LDY.W $19F7 

.loop:
    LDA.W $0000,Y 
    BPL .copyRow 
    STA.B $12 
    INY 
    INY 
    PEA.W .loop-1 
    JMP.W ($0012) 


.copyRow:
    JSR.W Copy_CreditsRow_ToCinematicBGTilemap 
    LDA.W $1A01 
    INC A 
    AND.W #$001F 
    STA.W $1A01 
    TYA 
    CLC 
    ADC.W #$0004 
    STA.W $19F7 

.return:
    PLB 
    RTS 


Copy_CreditsRow_ToCinematicBGTilemap:
    PHP 
    REP #$30 
    LDA.W #$7F00 
    STA.B $01 
    STZ.B $00 
    PHY 
    SEP #$20 
    LDA.B #$40 
    STA.W $4202 
    LDA.W $1A01 
    STA.W $4203 
    NOP 
    NOP 
    NOP 
    REP #$20 
    LDA.W $4216 
    TAX 
    LDA.W #$001F 
    STA.W $0014 
    LDA.W $0002,Y 
    TAY 

.loop:
    LDA.B [$00],Y 
    STA.L $7E3000,X 
    INX 
    INX 
    INY 
    INY 
    DEC.W $0014 
    BPL .loop 
    PLY 
    PLP 
    RTS 


Instruction_CreditsObject_Delete:
    REP #$30 
    STZ.W $19F7 
    PLA 
    PLB 
    RTS 


Instruction_CreditsObject_GotoY:
    REP #$30 
    LDA.W $0000,Y 
    TAY 
    RTS 


Instruction_CreditsObject_DecrementTimer_GotoYIfNonZero:
    REP #$30 
    DEC.W $19FB 
    BNE Instruction_CreditsObject_GotoY 
    INY 
    INY 
    RTS 


Instruction_CreditsObject_TimerInY:
    REP #$30 
    LDA.W $0000,Y 
    STA.W $19FB 
    INY 
    INY 
    RTS 


GameState1_TitleSequence:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    PEA.W .manualReturn-1 
    JMP.W ($1F51) 


.manualReturn:
    JSR.W Handle_CinematicSpriteObjects 
    JSR.W Handle_Mode7Objects 
    JSL.L PaletteFXObject_Handler 
    JSR.W Draw_CinematicSpriteObjects_IntroTitleSequence 
    JSR.W SkipToTitleScreenCheck 
    JSR.W SkipToTitleScreenHandler 
    JSR.W HandleMode7TransformMatrixAndBG1Position_NoRotation 
    PLB 
    PLP 
    RTL 


RTS_8B9A47:
    RTS 


SkipToTitleScreenCheck:
    LDA.W $1F51 
    CMP.W #RTS_8B9F28 
    BPL .return 
    LDA.B $8F 
    BIT.W #$9080 
    BEQ .return 
    LDA.W $1A53 
    BNE .return 
    LDA.W #$0001 
    STA.W $1A53 
    STZ.W $0723 
    LDA.W #$0002 
    STA.W $0725 

.return:
    RTS 


SkipToTitleScreenHandler:
    PHP 
    REP #$30 
    LDA.W $1A53 
    BEQ .return 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 

.return:
    PLP 
    RTS 


.pointers:
    dw $0000 
    dw SkipToTitleScreenHandler_1_FadeOut 
    dw SkipToTitleScreenHandler_2_PrepareTitleScreen 
    dw SkipToTitleScreenHandler_3_FadeIn 

SkipToTitleScreenHandler_1_FadeOut:
    JSR.W AdvanceFastScreenFadeOut 
    BCC .return 
    LDA.W #$0002 
    STA.W $1A53 
    LDA.W #RTS_8B9F28 
    STA.W $1F51 
    LDA.W #$0006 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 

.return:
    RTS 


SkipToTitleScreenHandler_2_PrepareTitleScreen:
    JSR.W Clear_CinematicSpriteObjects 
    LDY.W #CinematicSpriteObjectDefinitions_TitleSequence_SuperMetroidLogoImmediate 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDY.W #CinematicSpriteObjectDefinitions_TitleSequence_NintendoCopyrightImmediate 
    JSR.W Spawn_CinematicSpriteObject_Y 
    STZ.W $0723 
    LDA.W #$0002 
    STA.W $0725 
    LDA.W #$0100 
    STA.W $198F 
    STZ.W $1993 
    STZ.W $1991 
    STZ.W $1997 
    STZ.W $1995 
    STZ.W $199B 
    STZ.W $1999 
    STZ.W $199F 
    STZ.W $199D 
    LDA.W #$0003 
    STA.W $1A53 
    LDX.W #$0100 

.loop:
    LDA.L Palettes_TitleScreen,X 
    STA.L $7EC000,X 
    INX 
    INX 
    CPX.W #$0200 
    BMI .loop 
    LDA.W #$7FFF 
    STA.L $7EC192 
    LDA.W #$7D80 
    STA.L $7EC194 
    JSL.L Clear_PaletteFXObjects 
    LDY.W #PaletteFXObjects_TitleScreenBabyMetroidTubeLight 
    JSL.L Spawn_PaletteFXObject 
    LDY.W #PaletteFXObjects_TitleScreenFlickeringDisplays 
    JSL.L Spawn_PaletteFXObject 
    JSR.W Deactivate_TileSequence_BlueLight 
    SEP #$20 
    LDA.B #$11 
    STA.B $69 
    REP #$20 
    JSL.L Spawn_TitleSequenceGradient_HDMAObjects 
    RTS 


InitFunction_CinematicSpriteObject_SuperMetroidLogoImmediate:
    LDA.W #$0080 
    STA.W $1A7D,Y 
    LDA.W #$0030 
    STA.W $1A9D,Y 
    LDA.W #$0400 
    STA.W $1ABD,Y 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
InitFunction_CinematicSpriteObject_UnusedNintendoBootLogoImm:
    LDA.W #$0080 
    STA.W $1A7D,Y 
    LDA.W #$0051 
    STA.W $1A9D,Y 
    LDA.W #$0000 
    STA.W $1ABD,Y 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


InitFunc_CinematicSpriteObject_NintendoCopyrightImmediate:
    LDA.W #$0080 
    STA.W $1A7D,Y 
    LDA.W #$00C4 
    STA.W $1A9D,Y 
    LDA.W #$0800 
    STA.W $1ABD,Y 
    RTS 


SkipToTitleScreenHandler_3_FadeIn:
    JSR.W AdvanceFastScreenFadeIn 
    BCC .return 
    STZ.W $1A53 
    LDA.W #$0384 
    STA.W $1F53 
    LDA.W #CinematicFunction_TitleScreen 
    STA.W $1F51 

.return:
    RTS 


CinematicFunction_LoadTitleSequence:
    JSL.L Load_Title_Sequence_Graphics 
    LDA.W #$FF03 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    LDA.W #RTS_8B9A47 
    STA.W $1F51 
    LDY.W #CinematicSpriteObjectDefinitions_TitleSequence_1994ScrollingText 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDA.W #$0005 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    RTS 


Load_Title_Sequence_Graphics:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    JSR.W Setup_PPU_TitleSequence 
    STZ.B $AB 
    STZ.B $A7 
    LDX.W #$0000 

.loopTitleScreenPalette:
    LDA.L Palettes_TitleScreen,X 
    STA.L $7EC000,X 
    INX 
    INX 
    CPX.W #$0200 
    BMI .loopTitleScreenPalette 
    LDA.W #Tiles_Title_Background_Mode7>>8&$FF00 
    STA.B $48 
    LDA.W #Tiles_Title_Background_Mode7 
    STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7F0000 
    LDA.W #Title_Mode7_Tilemap>>8&$FF00 
    STA.B $48 
    LDA.W #Title_Mode7_Tilemap 
    STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7F4000 
    LDA.W #Tiles_Title_Sprite>>8&$FF00 
    STA.B $48 
    LDA.W #Tiles_Title_Sprite 
    STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7F5000 
    LDA.W #Tiles_Baby_Metroid_Mode7>>8&$FF00 
    STA.B $48 
    LDA.W #Tiles_Baby_Metroid_Mode7 
    STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7F9000 
    SEP #$30 
    LDA.B #$00 
    STA.W $2116 
    LDA.B #$00 
    STA.W $2117 
    LDA.B #$80 
    STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$00,$19 
    dl $7F0000 
    dw $4000 
    LDA.B #$02 
    STA.W $420B 
    REP #$10 
    STZ.W $2115 
    STZ.W $2116 
    STZ.W $2117 
    LDX.W #$4000 
    LDA.B #$FF 

.loop:
    STA.W $2118 
    DEX 
    BNE .loop 
    SEP #$10 
    LDA.B #$00 
    STA.W $2116 
    LDA.B #$00 
    STA.W $2117 
    LDA.B #$00 
    STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$00,$18 
    dl $7F4000 
    dw $1000 
    LDA.B #$02 
    STA.W $420B 
    LDA.B #$00 
    STA.W $2116 
    LDA.B #$60 
    STA.W $2117 
    LDA.B #$80 
    STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl $7F5000 
    dw $4000 
    LDA.B #$02 
    STA.W $420B 
    REP #$30 
    LDA.W #$0100 
    STA.W $211B 
    STA.B $78 
    STZ.W $211C 
    STZ.B $7A 
    STZ.W $211D 
    STZ.B $7C 
    STA.W $211E 
    STA.B $7E 
    LDA.W #$0080 
    STA.W $211F 
    STA.B $80 
    STA.W $2120 
    STA.B $82 
    JSL.L EnableNMI 
    LDA.W #$0001 
    STA.W $0723 
    STA.W $0725 
    JSL.L Enable_HDMAObjects 
    JSL.L Enable_PaletteFXObjects 
    LDA.W #$0000 
    STA.W $1982 
    LDY.W #PaletteFXObjects_TitleScreenBabyMetroidTubeLight 
    JSL.L Spawn_PaletteFXObject 
    LDY.W #PaletteFXObjects_TitleScreenFlickeringDisplays 
    JSL.L Spawn_PaletteFXObject 
    LDY.W #Mode7Object_TitleSequenceBabyMetroid 
    JSR.W Spawn_Mode7Objects 
    PLB 
    PLP 
    RTL 


InitFunc_CinematicSpriteObject_1994ScrollingText:
    LDA.W #$0081 
    STA.W $1A7D,Y 
    LDA.W #$0070 
    STA.W $1A9D,Y 
    LDA.W #$0200 
    STA.W $1ABD,Y 
    RTS 


PreInstruction_CinematicSpriteObject_1994ScrollingText:
    SEP #$20 
    LDA.B #$0F 
    STA.B $51 
    REP #$20 
    LDA.W #RTS_8B93D9 
    STA.W $1B3D,X 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_REP20RTS_8B9CDE:
    REP #$20 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_TriggerTitleSequenceScene0:
    SEP #$20 
    LDA.B #$11 
    STA.B $69 
    REP #$20 
    LDA.W #CinematicFunction_TitleSequenceScene0_PanningLeft_Lower 
    STA.W $1F51 
    LDA.W #$0048 
    STA.W $198F 
    LDA.W #$013B 
    STA.W $1993 
    STZ.W $1991 
    LDA.W #$00E1 
    STA.W $1997 
    STZ.W $1995 
    LDA.W #$FFFE 
    STA.W $199B 
    LDA.W #$8000 
    STA.W $1999 
    JSR.W Activate_TileSequence_BlueLight 
    RTS 


CinematicFunction_TitleSequenceScene0_PanningLeft_Lower:
    LDA.W $1991 
    CLC 
    ADC.W $1999 
    STA.W $1991 
    LDA.W $1993 
    ADC.W $199B 
    STA.W $1993 
    CMP.W #$FFF9 
    BPL .titleScreenCheck 
    SEP #$20 
    LDA.B #$10 
    STA.B $69 
    REP #$20 
    LDA.W #RTS_8B9A47 
    STA.W $1F51 
    LDY.W #CinematicSpriteObjectDefinitions_TitleSequence_NintendoScrollingText 
    JSR.W Spawn_CinematicSpriteObject_Y 
    JSR.W Deactivate_TileSequence_BlueLight 

.titleScreenCheck:
    JSR.W SkipToTitleScreenCheck 
    RTS 


InitFunc_CinematicSpriteObject_NintendoScrollingText:
    LDA.W #$0081 
    STA.W $1A7D,Y 
    LDA.W #$0070 
    STA.W $1A9D,Y 
    LDA.W #$0200 
    STA.W $1ABD,Y 
    RTS 


Instruction_TriggerTitleSequenceScene1:
    SEP #$20 
    LDA.B #$11 
    STA.B $69 
    REP #$20 
    LDA.W #CinematicFunction_TitleSequenceScene1_PanningLeft_Upper 
    STA.W $1F51 
    LDA.W #$0060 
    STA.W $198F 
    LDA.W #$002C 
    STA.W $1993 
    STZ.W $1991 
    LDA.W #$FF65 
    STA.W $1997 
    STZ.W $1995 
    LDA.W #$FFFE 
    STA.W $199B 
    LDA.W #$8000 
    STA.W $1999 
    RTS 


CinematicFunction_TitleSequenceScene1_PanningLeft_Upper:
    LDA.W $1991 
    CLC 
    ADC.W $1999 
    STA.W $1991 
    LDA.W $1993 
    ADC.W $199B 
    STA.W $1993 
    CMP.W #$FF50 
    BPL .titleScreenCheck 
    SEP #$20 
    LDA.B #$10 
    STA.B $69 
    REP #$20 
    LDA.W #RTS_8B9A47 
    STA.W $1F51 
    LDY.W #CinematicSpriteObjectDefinitions_TitleSequence_PresentsScrollingText 
    JSR.W Spawn_CinematicSpriteObject_Y 
    JSR.W Deactivate_TileSequence_BlueLight 

.titleScreenCheck:
    JSR.W SkipToTitleScreenCheck 
    RTS 


InitFunc_CinematicSpriteObject_PresentsScrollingText:
    LDA.W #$0081 
    STA.W $1A7D,Y 
    LDA.W #$0070 
    STA.W $1A9D,Y 
    LDA.W #$0200 
    STA.W $1ABD,Y 
    RTS 


Instruction_TriggerTitleSequenceScene2:
    SEP #$20 
    LDA.B #$11 
    STA.B $69 
    REP #$20 
    LDA.W #CinematicFunction_TitleSequenceScene2_PanningDown 
    STA.W $1F51 
    LDA.W #$0060 
    STA.W $198F 
    LDA.W #$FF4F 
    STA.W $1993 
    STZ.W $1991 
    LDA.W #$FF60 
    STA.W $1997 
    STZ.W $1995 
    STZ.W $199B 
    STZ.W $1999 
    LDA.W #$0001 
    STA.W $199F 
    LDA.W #$8000 
    STA.W $199D 
    JSR.W Activate_TileSequence_BlueLight 
    RTS 


CinematicFunction_TitleSequenceScene2_PanningDown:
    LDA.W $1995 
    CLC 
    ADC.W $199D 
    STA.W $1995 
    LDA.W $1997 
    ADC.W $199F 
    STA.W $1997 
    CMP.W #$00A3 
    BMI .titleScreenCheck 
    SEP #$20 
    LDA.B #$10 
    STA.B $69 
    REP #$20 
    LDA.W #RTS_8B9A47 
    STA.W $1F51 
    LDY.W #CinematicSpriteObjectDefinitions_TitleSequence_Metroid3ScrollingText 
    JSR.W Spawn_CinematicSpriteObject_Y 
    JSR.W Deactivate_TileSequence_BlueLight 

.titleScreenCheck:
    JSR.W SkipToTitleScreenCheck 
    RTS 


InitFunc_CinematicSpriteObject_Metroid3ScrollingText:
    LDA.W #$0081 
    STA.W $1A7D,Y 
    LDA.W #$0070 
    STA.W $1A9D,Y 
    LDA.W #$0200 
    STA.W $1ABD,Y 
    RTS 


Instruction_TriggerTitleSequenceScene3:
    SEP #$20 
    LDA.B #$11 
    STA.B $69 
    REP #$20 
    LDA.W #CinematicFunction_TitleSequenceScene3_ZoomingOut 
    STA.W $1F51 
    LDA.W #$0043 
    STA.W $198F 
    STZ.W $1993 
    STZ.W $1991 
    STZ.W $1997 
    STZ.W $1995 
    STZ.W $199B 
    STZ.W $1999 
    STZ.W $199F 
    STZ.W $199D 
    PHY 
    JSL.L Spawn_TitleSequenceGradient_HDMAObjects 
    PLY 
    RTS 


CinematicFunction_TitleSequenceScene3_ZoomingOut:
    LDA.W $05B6 
    BIT.W #$0001 
    BNE .return 
    LDA.W $198F 
    CMP.W #$0100 
    BPL .finish 
    INC A 
    STA.W $198F 

.return:
    RTS 


.finish:
    LDA.W #$0100 
    STA.W $198F 
    LDA.W #RTS_8B9F28 
    STA.W $1F51 
    LDY.W #CinematicSpriteObjectDefinitions_TitleSequence_SuperMetroidTitleLogo_FadeIn 
    JSR.W Spawn_CinematicSpriteObject_Y 
    RTS 


InitFunc_CinematicSpriteObject_SuperMetroidTitleLogo_FadeIn:
    LDA.W #$0080 
    STA.W $1A7D,Y 
    LDA.W #$0030 
    STA.W $1A9D,Y 
    LDA.W #$0400 
    STA.W $1ABD,Y 
    LDY.W #PaletteFXObjects_FadeInSuperMetroidTitleLogo 
    JSL.L Spawn_PaletteFXObject 
    RTS 


Instruction_FadeInNintendoCopyright:
    PHY 
    LDY.W #CinematicSpriteObjectDefinitions_TitleSequence_NintendoCopyright_FadeIn 
    JSR.W Spawn_CinematicSpriteObject_Y 
    PLY 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
InitFunc_CinematicSpriteObject_UnusedNintendoBootLogo_FadeIn:
    LDA.W #$0080 
    STA.W $1A7D,Y 
    LDA.W #$0051 
    STA.W $1A9D,Y 
    LDA.W #$0200 
    STA.W $1ABD,Y 
    LDY.W #PaletteFXObjects_FadeInNintendoBootLogoForUnusedCode 
    JSL.L Spawn_PaletteFXObject 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_UsePalette0_FadeInNintendoCopyright:
    LDA.W #$0000 
    STA.W $1ABD,X 
    PHY 
    LDY.W #CinematicSpriteObjectDefinitions_TitleSequence_NintendoCopyright_FadeIn 
    JSR.W Spawn_CinematicSpriteObject_Y 
    PLY 
    RTS 


InitFunc_CinematicSpriteObject_NintendoCopyright_FadeIn:
    LDA.W #$0080 
    STA.W $1A7D,Y 
    LDA.W #$00C4 
    STA.W $1A9D,Y 
    LDA.W #$0800 
    STA.W $1ABD,Y 
    LDY.W #PaletteFXObjects_FadeInNintendoCopyright 
    JSL.L Spawn_PaletteFXObject 
    RTS 


Instruction_StartDemoCountdown:
    PHY 
    LDA.W #$0384 
    STA.W $1F53 
    LDA.W #CinematicFunction_TitleScreen 
    STA.W $1F51 
    PLY 
    RTS 


RTS_8B9F28:
    RTS 


CinematicFunction_TitleScreen:
    DEC.W $1F53 
    BEQ .demo 
    BPL .notDemo 

.demo:
    LDA.W #CinematicFunction_TransitionToDemos 
    STA.W $1F51 
    BRA .transition 


.notDemo:
    LDA.B $8F 
    BIT.W #$9080 
    BEQ .merge 
    LDA.W #CinematicFunction_TransitionToFileSelectMenu 
    STA.W $1F51 

.transition:
    LDA.W #$0002 
    STA.W $0723 
    STA.W $0725 

.merge:
    JSR.W Debug_DisplayVersionInfo 
    RTS 


CinematicFunction_TransitionToFileSelectMenu:
    JSR.W Debug_DisplayVersionInfo 
    JSR.W AdvanceSlowScreenFadeOut 
    BCC .return 
    JSL.L EnableNMI 
    SEP #$20 
    LDA.B #$01 
    STA.B $55 
    REP #$20 
    STZ.W $0723 
    STZ.W $0725 
    STZ.B $B5 
    STZ.B $B9 
    STZ.B $B7 
    STZ.B $BB 
    STZ.W $198D 
    LDA.W #CinematicFunction_LoadTitleSequence 
    STA.W $1F51 
    JSL.L Disable_PaletteFXObjects 
    JSL.L Clear_PaletteFXObjects 
    LDA.W #$1C1F 
    DEC A 
    DEC A 
    SEC 
    SBC.W #$198D 
    TAX 

.loopClearNonGameplayRAM:
    STZ.W $198D,X 
    DEX 
    DEX 
    BPL .loopClearNonGameplayRAM 
    LDX.W #$01FE 
    LDA.W #$0000 

.loopClearGradient:
    STA.L $7E9800,X 
    DEX 
    DEX 
    BPL .loopClearGradient 
    LDA.W #$0004 
    STA.W $0998 
    STZ.W $0DE2 

.return:
    RTS 


CinematicFunction_TransitionToDemos:
    JSR.W Debug_DisplayVersionInfo 
    JSR.W AdvanceSlowScreenFadeOut 
    BCC .return 
    JSL.L EnableNMI 
    SEP #$20 
    LDA.B #$01 
    STA.B $55 
    REP #$20 
    STZ.W $0723 
    STZ.W $0725 
    STZ.B $B5 
    STZ.B $B9 
    STZ.B $B7 
    STZ.B $BB 
    STZ.W $198D 
    LDA.W #CinematicFunction_LoadTitleSequence 
    STA.W $1F51 
    JSL.L Disable_PaletteFXObjects 
    JSL.L Clear_PaletteFXObjects 
    LDA.W #$1C1F 
    DEC A 
    DEC A 
    SEC 
    SBC.W #$198D 
    TAX 

.loopClearNonGameplayRAM:
    STZ.W $198D,X 
    DEX 
    DEX 
    BPL .loopClearNonGameplayRAM 
    LDX.W #$01FE 
    LDA.W #$0000 

.loopClearGradient:
    STA.L $7E9800,X 
    DEX 
    DEX 
    BPL .loopClearGradient 
    LDA.W #$0028 
    STA.W $0998 
    STZ.W $1F57 

.return:
    RTS 


Configure_TitleScreen_GradientHDMATable:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W $198F 
    AND.W #$00F0 
    LSR #3
    TAX 
    LDA.L TitleSequenceHDMATables,X 
    TAY 
    PHB 
    PEA.W $8C00 
    PLB 
    PLB 
    LDX.W #$0000 

.loop:
    LDA.W $0000,Y 
    STA.L $7E9800,X 
    BEQ .return 
    INY 
    INY 
    INX 
    INX 
    BRA .loop 


.return:
    PLB 
    PLB 
    PLP 
    RTL 


RTL_8BA03B:
    RTL 


RTL_8BA03C:
    RTL 


InstList_CinematicSpriteObject_1994ScrollingText:
    dw $003C,$0000 
    dw $0008,TitleSequenceSpritemaps_1 
    dw $0008,TitleSequenceSpritemaps_19 
    dw $0008,TitleSequenceSpritemaps_199 
    dw $002D,TitleSequenceSpritemaps_1994 
    dw Instruction_TriggerTitleSequenceScene0 
    dw CinematicSpriteObject_Instruction_Delete 

InstList_CinematicSpriteObject_NintendoScrollingText:
    dw $0008,TitleSequenceSpritemaps_N 
    dw $0008,TitleSequenceSpritemaps_NI 
    dw $0008,TitleSequenceSpritemaps_NIN 
    dw $0008,TitleSequenceSpritemaps_NINT 
    dw $0008,TitleSequenceSpritemaps_NINTE 
    dw $0008,TitleSequenceSpritemaps_NINTEN 
    dw $0008,TitleSequenceSpritemaps_NINTEND 
    dw $002D,TitleSequenceSpritemaps_NINTENDO 
    dw Instruction_TriggerTitleSequenceScene1 
    dw CinematicSpriteObject_Instruction_Delete 

InstList_CinematicSpriteObject_PresentsScrollingText:
    dw $0008,TitleSequenceSpritemaps_P 
    dw $0008,TitleSequenceSpritemaps_PR 
    dw $0008,TitleSequenceSpritemaps_PRE 
    dw $0008,TitleSequenceSpritemaps_PRES 
    dw $0008,TitleSequenceSpritemaps_PRESE 
    dw $0008,TitleSequenceSpritemaps_PRESEN 
    dw $0008,TitleSequenceSpritemaps_PRESENT 
    dw $002D,TitleSequenceSpritemaps_PRESENTS 
    dw Instruction_TriggerTitleSequenceScene2 
    dw CinematicSpriteObject_Instruction_Delete 

InstList_CinematicSpriteObject_Metroid3ScrollingText:
    dw $0008,TitleSequenceSpritemaps_M 
    dw $0008,TitleSequenceSpritemaps_ME 
    dw $0008,TitleSequenceSpritemaps_MET 
    dw $0008,TitleSequenceSpritemaps_METR 
    dw $0008,TitleSequenceSpritemaps_METRO 
    dw $0008,TitleSequenceSpritemaps_METROI 
    dw $0008,TitleSequenceSpritemaps_METROID 
    dw $0008,TitleSequenceSpritemaps_METROID_ 
    dw $0078,TitleSequenceSpritemaps_METROID3 
    dw Instruction_TriggerTitleSequenceScene3 
    dw CinematicSpriteObject_Instruction_Delete 

InstList_CinematicSpriteObject_SuperMetroidTitleLogo_FadeIn:
    dw $0020,TitleSequenceSpritemaps_SuperMetroidTitleLogo 
    dw Instruction_FadeInNintendoCopyright 

InstList_CinematicSpriteObject_SuperMetroidTitleLogo_Immediate:
    dw $0001,TitleSequenceSpritemaps_SuperMetroidTitleLogo 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObject_SuperMetroidTitleLogo_Immediate 

if !FEATURE_KEEP_UNREFERENCED
InstList_CinematicSpriteObject_UnusedNintendoBootLogo_FadeIn:
    dw $0020,TitleSequenceSpritemaps_NintendoBootLogo 
    dw Instruction_UsePalette0_FadeInNintendoCopyright 

InstList_CinematicSpriteObject_UnusedNintendoBootLogo_Immediate:
    dw $0001,TitleSequenceSpritemaps_NintendoBootLogo 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObject_UnusedNintendoBootLogo_Immediate 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_CinematicSpriteObject_NintendoCopyright_FadeIn:
    dw $0020,TitleSequenceSpritemaps_NintendoCopyright 
    dw Instruction_StartDemoCountdown 

InstList_CinematicSpriteObject_NintendoCopyright_Immediate:
    dw $0001,TitleSequenceSpritemaps_NintendoCopyright 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObject_NintendoCopyright_Immediate 

CinematicSpriteObjectDefinitions_TitleSequence:
  .1994ScrollingText
    dw InitFunc_CinematicSpriteObject_1994ScrollingText 
    dw PreInstruction_CinematicSpriteObject_1994ScrollingText 
    dw InstList_CinematicSpriteObject_1994ScrollingText 
  .NintendoScrollingText
    dw InitFunc_CinematicSpriteObject_NintendoScrollingText 
    dw RTS_8B93D9 
    dw InstList_CinematicSpriteObject_NintendoScrollingText 
  .PresentsScrollingText
    dw InitFunc_CinematicSpriteObject_PresentsScrollingText 
    dw RTS_8B93D9 
    dw InstList_CinematicSpriteObject_PresentsScrollingText 
  .Metroid3ScrollingText
    dw InitFunc_CinematicSpriteObject_Metroid3ScrollingText 
    dw RTS_8B93D9 
    dw InstList_CinematicSpriteObject_Metroid3ScrollingText 
  .SuperMetroidTitleLogo_FadeIn
    dw InitFunc_CinematicSpriteObject_SuperMetroidTitleLogo_FadeIn 
    dw RTS_8B93D9 
    dw InstList_CinematicSpriteObject_SuperMetroidTitleLogo_FadeIn 
if !FEATURE_KEEP_UNREFERENCED
  .UnusedNintendoBootLogo_FadeIn
    dw InitFunc_CinematicSpriteObject_UnusedNintendoBootLogo_FadeIn 
    dw RTS_8B93D9 
    dw InstList_CinematicSpriteObject_UnusedNintendoBootLogo_FadeIn 
endif ; !FEATURE_KEEP_UNREFERENCED
  .NintendoCopyright_FadeIn
    dw InitFunc_CinematicSpriteObject_NintendoCopyright_FadeIn 
    dw RTS_8B93D9 
    dw InstList_CinematicSpriteObject_NintendoCopyright_FadeIn 
  .SuperMetroidLogoImmediate
    dw InitFunction_CinematicSpriteObject_SuperMetroidLogoImmediate 
    dw RTS_8B93D9 
    dw InstList_CinematicSpriteObject_SuperMetroidTitleLogo_Immediate 
if !FEATURE_KEEP_UNREFERENCED
  .UnusedNintendoBootLogoImm
    dw InitFunction_CinematicSpriteObject_UnusedNintendoBootLogoImm 
    dw RTS_8B93D9 
    dw InstList_CinematicSpriteObject_UnusedNintendoBootLogo_Immediate 
endif ; !FEATURE_KEEP_UNREFERENCED
  .NintendoCopyrightImmediate
    dw InitFunc_CinematicSpriteObject_NintendoCopyrightImmediate 
    dw RTS_8B93D9 
    dw InstList_CinematicSpriteObject_NintendoCopyright_Immediate 

Mode7Object_InstList_TitleSequenceBabyMetroid_0:
    dw Instruction_LoadBabyMetroid_Colors0 
    dw Mode7Objects_Instruction_TimerInY,$0002 

Mode7Object_InstList_TitleSequenceBabyMetroid_1:
    dw $000A,Mode7TransferData_TitleSequenceBabyMetroid_0 
    dw $000A,Mode7TransferData_TitleSequenceBabyMetroid_1 
    dw $000A,Mode7TransferData_TitleSequenceBabyMetroid_2 
    dw $000A,Mode7TransferData_TitleSequenceBabyMetroid_1 
    dw Mode7Objects_Instruction_DecrementTimer_GotoYIfNonZero 
    dw Mode7Object_InstList_TitleSequenceBabyMetroid_1 
    dw Instruction_PlayBabyMetroid_Cry1 
    dw Instruction_LoadBabyMetroid_Colors1 
    dw $0006,Mode7TransferData_TitleSequenceBabyMetroid_0 
    dw Instruction_LoadBabyMetroid_Colors2 
    dw $0005,Mode7TransferData_TitleSequenceBabyMetroid_1 
    dw Instruction_LoadBabyMetroid_Colors3 
    dw $0004,Mode7TransferData_TitleSequenceBabyMetroid_2 
    dw Instruction_LoadBabyMetroid_Colors2 
    dw $0003,Mode7TransferData_TitleSequenceBabyMetroid_1 
    dw Instruction_LoadBabyMetroid_Colors1 
    dw $0002,Mode7TransferData_TitleSequenceBabyMetroid_0 
    dw Instruction_LoadBabyMetroid_Colors2 
    dw $0003,Mode7TransferData_TitleSequenceBabyMetroid_1 
    dw Instruction_LoadBabyMetroid_Colors3 
    dw $0004,Mode7TransferData_TitleSequenceBabyMetroid_2 
    dw Instruction_LoadBabyMetroid_Colors2 
    dw $0005,Mode7TransferData_TitleSequenceBabyMetroid_1 
    dw Instruction_LoadBabyMetroid_Colors1 
    dw $0006,Mode7TransferData_TitleSequenceBabyMetroid_0 
    dw Instruction_LoadBabyMetroid_Colors2 
    dw $0007,Mode7TransferData_TitleSequenceBabyMetroid_1 
    dw Instruction_LoadBabyMetroid_Colors3 
    dw $0008,Mode7TransferData_TitleSequenceBabyMetroid_2 
    dw Instruction_LoadBabyMetroid_Colors2 
    dw $0009,Mode7TransferData_TitleSequenceBabyMetroid_1 
    dw Instruction_LoadBabyMetroid_Colors0 
    dw Mode7Objects_Instruction_TimerInY,$0004 

Mode7Object_InstList_TitleSequenceBabyMetroid_2:
    dw $000A,Mode7TransferData_TitleSequenceBabyMetroid_0 
    dw $000A,Mode7TransferData_TitleSequenceBabyMetroid_1 
    dw $000A,Mode7TransferData_TitleSequenceBabyMetroid_2 
    dw $000A,Mode7TransferData_TitleSequenceBabyMetroid_1 
    dw Mode7Objects_Instruction_DecrementTimer_GotoYIfNonZero 
    dw Mode7Object_InstList_TitleSequenceBabyMetroid_2 
    dw Instruction_PlayBabyMetroid_Cry2 
    dw Instruction_LoadBabyMetroid_Colors1 
    dw $0006,Mode7TransferData_TitleSequenceBabyMetroid_0 
    dw Instruction_LoadBabyMetroid_Colors2 
    dw $0005,Mode7TransferData_TitleSequenceBabyMetroid_1 
    dw Instruction_LoadBabyMetroid_Colors3 
    dw $0004,Mode7TransferData_TitleSequenceBabyMetroid_2 
    dw Instruction_LoadBabyMetroid_Colors2 
    dw $0003,Mode7TransferData_TitleSequenceBabyMetroid_1 
    dw Instruction_LoadBabyMetroid_Colors1 
    dw $0002,Mode7TransferData_TitleSequenceBabyMetroid_0 
    dw Instruction_LoadBabyMetroid_Colors2 
    dw $0003,Mode7TransferData_TitleSequenceBabyMetroid_1 
    dw Instruction_LoadBabyMetroid_Colors3 
    dw $0004,Mode7TransferData_TitleSequenceBabyMetroid_2 
    dw Instruction_LoadBabyMetroid_Colors2 
    dw $0005,Mode7TransferData_TitleSequenceBabyMetroid_1 
    dw Instruction_LoadBabyMetroid_Colors1 
    dw $0006,Mode7TransferData_TitleSequenceBabyMetroid_0 
    dw Instruction_LoadBabyMetroid_Colors2 
    dw $0007,Mode7TransferData_TitleSequenceBabyMetroid_1 
    dw Instruction_LoadBabyMetroid_Colors3 
    dw $0008,Mode7TransferData_TitleSequenceBabyMetroid_2 
    dw Instruction_LoadBabyMetroid_Colors2 
    dw $0009,Mode7TransferData_TitleSequenceBabyMetroid_1 
    dw Instruction_LoadBabyMetroid_Colors0 
    dw Mode7Objects_Instruction_TimerInY 
    dw $0003 

Mode7Object_InstList_TitleSequenceBabyMetroid_3:
    dw $000A,Mode7TransferData_TitleSequenceBabyMetroid_0 
    dw $000A,Mode7TransferData_TitleSequenceBabyMetroid_1 
    dw $000A,Mode7TransferData_TitleSequenceBabyMetroid_2 
    dw $000A,Mode7TransferData_TitleSequenceBabyMetroid_1 
    dw Mode7Objects_Instruction_DecrementTimer_GotoYIfNonZero 
    dw Mode7Object_InstList_TitleSequenceBabyMetroid_3 
    dw Instruction_PlayBabyMetroid_Cry3 
    dw Instruction_LoadBabyMetroid_Colors1 
    dw $0006,Mode7TransferData_TitleSequenceBabyMetroid_0 
    dw Instruction_LoadBabyMetroid_Colors2 
    dw $0005,Mode7TransferData_TitleSequenceBabyMetroid_1 
    dw Instruction_LoadBabyMetroid_Colors3 
    dw $0004,Mode7TransferData_TitleSequenceBabyMetroid_2 
    dw Instruction_LoadBabyMetroid_Colors2 
    dw $0003,Mode7TransferData_TitleSequenceBabyMetroid_1 
    dw Instruction_LoadBabyMetroid_Colors1 
    dw $0002,Mode7TransferData_TitleSequenceBabyMetroid_0 
    dw Instruction_LoadBabyMetroid_Colors2 
    dw $0003,Mode7TransferData_TitleSequenceBabyMetroid_1 
    dw Instruction_LoadBabyMetroid_Colors3 
    dw $0004,Mode7TransferData_TitleSequenceBabyMetroid_2 
    dw Instruction_LoadBabyMetroid_Colors2 
    dw $0005,Mode7TransferData_TitleSequenceBabyMetroid_1 
    dw Instruction_LoadBabyMetroid_Colors1 
    dw $0006,Mode7TransferData_TitleSequenceBabyMetroid_0 
    dw Instruction_LoadBabyMetroid_Colors2 
    dw $0007,Mode7TransferData_TitleSequenceBabyMetroid_1 
    dw Instruction_LoadBabyMetroid_Colors3 
    dw $0008,Mode7TransferData_TitleSequenceBabyMetroid_2 
    dw Instruction_LoadBabyMetroid_Colors2 
    dw $0009,Mode7TransferData_TitleSequenceBabyMetroid_1 
    dw Mode7Objects_Instruction_GotoY 
    dw Mode7Object_InstList_TitleSequenceBabyMetroid_0 

Instruction_PlayBabyMetroid_Cry1:
    LDA.W #$0023 
    JSL.L QueueSound_Lib3_Max6 
    RTS 


Instruction_PlayBabyMetroid_Cry2:
    LDA.W #$0026 
    JSL.L QueueSound_Lib3_Max6 
    RTS 


Instruction_PlayBabyMetroid_Cry3:
    LDA.W #$0027 
    JSL.L QueueSound_Lib3_Max6 
    RTS 


Instruction_LoadBabyMetroid_Colors0:
    PHX 
    LDX.W #$001E 

.loop:
    LDA.W TitleSequenceBabyMetroid_Colors_0,X 
    STA.L $7EC060,X 
    DEX 
    DEX 
    BPL .loop 
    PLX 
    RTS 


Instruction_LoadBabyMetroid_Colors1:
    PHX 
    LDX.W #$001E 

.loop:
    LDA.W TitleSequenceBabyMetroid_Colors_1,X 
    STA.L $7EC060,X 
    DEX 
    DEX 
    BPL .loop 
    PLX 
    RTS 


Instruction_LoadBabyMetroid_Colors2:
    PHX 
    LDX.W #$001E 

.loop:
    LDA.W TitleSequenceBabyMetroid_Colors_2,X 
    STA.L $7EC060,X 
    DEX 
    DEX 
    BPL .loop 
    PLX 
    RTS 


Instruction_LoadBabyMetroid_Colors3:
    PHX 
    LDX.W #$001E 

.loop:
    LDA.W TitleSequenceBabyMetroid_Colors_3,X 
    STA.L $7EC060,X 
    DEX 
    DEX 
    BPL .loop 
    PLX 
    RTS 


; Game over baby metroid palettes are in bank $82
TitleSequenceBabyMetroid_Colors_0:
    db $00,$10,$F5,$6B,$41,$2E,$A1,$2D,$01,$2D,$5F,$5E,$3F,$18,$14,$10 
    db $0A,$08,$04,$04,$9F,$4F,$D8,$3E,$12,$2E,$70,$6F,$FF,$7F,$E0,$5E 

TitleSequenceBabyMetroid_Colors_1:
    db $00,$38,$F5,$6B,$E1,$06,$41,$06,$A1,$05,$5F,$5E,$3F,$18,$14,$10 
    db $0A,$08,$04,$04,$9F,$4F,$D8,$3E,$12,$2E,$70,$6F,$FF,$7F,$E0,$5E 

TitleSequenceBabyMetroid_Colors_2:
    db $00,$38,$F8,$77,$44,$13,$A4,$12,$04,$12,$BF,$6A,$9F,$24,$77,$1C 
    db $6D,$14,$67,$10,$FF,$5B,$38,$4B,$72,$3A,$D3,$7B,$FF,$7F,$43,$6B 

TitleSequenceBabyMetroid_Colors_3:
    db $00,$38,$FB,$7F,$A7,$1F,$07,$1F,$67,$1E,$1F,$77,$FF,$30,$DA,$28 
    db $D0,$20,$CA,$1C,$FF,$67,$9B,$57,$D5,$46,$D6,$7B,$FF,$7F,$A6,$77 

Mode7TransferData_TitleSequenceBabyMetroid_0:
    db $C0 ; Control. C0h = write to VRAM tiles
    dl $7F9000 ; Source address
    dw $0100,$3800 ; Size, Destination address (VRAM)
    db $80,$00 ; VRAM address increment mode

Mode7TransferData_TitleSequenceBabyMetroid_1:
    db $C0 ; Control. C0h = write to VRAM tiles
    dl $7F9100 ; Source address
    dw $0100,$3800 ; Size, Destination address (VRAM)
    db $80,$00 ; VRAM address increment mode

Mode7TransferData_TitleSequenceBabyMetroid_2:
    db $C0 ; Control. C0h = write to VRAM tiles
    dl $7F9200 ; Source address
    dw $0100,$3800 ; Size, Destination address (VRAM)
    db $80,$00 ; VRAM address increment mode

Mode7Object_TitleSequenceBabyMetroid:
    dw RTS_8B93D9 
    dw RTS_8B93D9 
    dw Mode7Object_InstList_TitleSequenceBabyMetroid_0 

GameState_1E_22_25_Intro_CeresGoesBoom_SamusGoesToZebes_8B:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    PEA.W .manualReturn-1 
    JMP.W ($1F51) 


.manualReturn:
    LDA.W $1B9F 
    BMI + 
    INC A 
    STA.W $1B9F 

  + INC.W $1A51 
    JSR.W HandleSamusDuringIntro 
    JSR.W Handle_CinematicSpriteObjects 
    JSR.W Handle_Mode7Objects 
    JSR.W Handle_CinematicBGObjects 
    JSR.W Handle_TextGlowObject 
    JSL.L PaletteFXObject_Handler 
    JSR.W DrawIntroSprites 
    JSR.W HandleMode7TransformMatrixAndBG1Position 
    PLB 
    PLP 
    RTL 


RTS_8BA38F:
    RTS 


RTS_8BA390:
    RTS 


CinematicFunction_Nothing:
    JSR.W RTS_BackgroundFLickeringEffect 
    RTS 


CinematicFunction_Intro_Initial:
    JSR.W Setup_PPU_Intro 
    STZ.B $AB 
    STZ.B $A7 
    STZ.W $079F 
    LDA.W #$0010 
    STA.W $07A5 
    STA.W $07A7 
    JSL.L InitializeSamus 
    JSL.L Update_Beam_Tiles_and_Palette 
    LDA.W #$0384 
    STA.W $09C8 
    STA.W $09C6 
    STZ.W $1A57 
    LDA.W #SamusDrawingHandler_Default 
    STA.W $0A5C 
    JSR.W Reset_Button_Assignments_to_Default 
    STZ.W $18A8 
    STZ.W $18AA 
    LDA.W #$1C1F 
    DEC A 
    DEC A 
    SEC 
    SBC.W #$198D 
    TAX 

.loopClearNonGameplayRAM:
    STZ.W $198D,X 
    DEX 
    DEX 
    BPL .loopClearNonGameplayRAM 
    LDX.W #$0000 

.loopPalettes:
    LDA.L Palettes_Intro,X 
    STA.L $7EC000,X 
    INX 
    INX 
    CPX.W #$0200 
    BMI .loopPalettes 
    LDA.W #Tiles_Intro_BG1_BG2>>8&$FF00 
    STA.B $48 
    LDA.W #Tiles_Intro_BG1_BG2 
    STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7F0000 
    LDA.W #Tiles_Font1_BG3>>8&$FF00 
    STA.B $48 
    LDA.W #Tiles_Font1_BG3 
    STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7F8000 
    LDA.W #Intro_BG2_SamusHead_Tilemap>>8&$FF00 
    STA.B $48 
    LDA.W #Intro_BG2_SamusHead_Tilemap 
    STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7F9000 
    LDA.W #Intro_BG1_MotherBrainsRoom_Tilemap>>8&$FF00 
    STA.B $48 
    LDA.W #Intro_BG1_MotherBrainsRoom_Tilemap 
    STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7F9800 
    LDA.W #Tiles_Intro_Sprite>>8&$FF00 
    STA.B $48 
    LDA.W #Tiles_Intro_Sprite 
    STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7FB800 
    LDA.W #Intro_BG3_TheLastMetroidIsInCaptivity_Tilemap>>8&$FF00 
    STA.B $48 
    LDA.W #Intro_BG3_TheLastMetroidIsInCaptivity_Tilemap 
    STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7FE000 
    SEP #$30 
    LDA.B #$00 
    STA.W $2116 
    LDA.B #$00 
    STA.W $2117 
    LDA.B #$80 
    STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl $7F0000 
    dw $8000 
    LDA.B #$02 
    STA.W $420B 
    LDA.B #$00 
    STA.W $2116 
    LDA.B #$40 
    STA.W $2117 
    LDA.B #$80 
    STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl $7F8000 
    dw $0900 
    LDA.B #$02 
    STA.W $420B 
    LDA.B #$00 
    STA.W $2116 
    LDA.B #$48 
    STA.W $2117 
    LDA.B #$80 
    STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl $7F9000 
    dw $0800 
    LDA.B #$02 
    STA.W $420B 
    LDA.B #$00 
    STA.W $2116 
    LDA.B #$4C 
    STA.W $2117 
    LDA.B #$80 
    STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl $7FE000 
    dw $0800 
    LDA.B #$02 
    STA.W $420B 
    LDA.B #$00 
    STA.W $2116 
    LDA.B #$50 
    STA.W $2117 
    LDA.B #$80 
    STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl $7F9800 
    dw $2000 
    LDA.B #$02 
    STA.W $420B 
    LDA.B #$00 
    STA.W $2116 
    LDA.B #$60 
    STA.W $2117 
    LDA.B #$80 
    STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl Tiles_Standard_Sprite_0 
    dw $2000 
    LDA.B #$02 
    STA.W $420B 
    LDA.B #$00 
    STA.W $2116 
    LDA.B #$6E 
    STA.W $2117 
    LDA.B #$80 
    STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl $7FB800 
    dw $2400 
    LDA.B #$02 
    STA.W $420B 
    REP #$30 
    LDA.W #Tiles_Font2_BG3>>8&$FF00 
    STA.B $48 
    LDA.W #Tiles_Font2_BG3 
    STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7FA000 
    JSL.L EnableNMI 
    LDA.W #$0003 
    STA.W $0723 
    STA.W $0725 
    JSL.L Enable_HDMAObjects 
    JSL.L Clear_PaletteFXObjects 
    JSL.L Enable_PaletteFXObjects 
    STZ.W $078D 
    STZ.W $0911 
    STZ.W $0915 
    STZ.W $1BA3 
    LDX.W #$07FE 

.loopSamusHead:
    LDA.L $7F9000,X 
    STA.L $7E3800,X 
    DEX 
    DEX 
    BPL .loopSamusHead 
    LDX.W #$00FE 

.loopJapanText:
    LDA.L InitialIntroJapanTextTilemap,X 
    STA.L $7E3000,X 
    DEX 
    DEX 
    BPL .loopJapanText 
    LDA.W #$FFFF 
    STA.W $1B9F 
    LDA.W #CinematicFunction_Intro_WaitForMusicQueue_FadeIn 
    STA.W $1F51 
    LDA.W #$0000 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    LDA.W #$FF3F 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    RTS 


CinematicFunction_Intro_WaitForMusicQueue_FadeIn:
    JSL.L CheckIfMusicIsQueued 
    BCS .return 
    LDA.W #CinematicFunction_Intro_HandleDrawingInitialJapanText_Wait60f 
    STA.W $1F51 
    LDA.W #$0002 
    STA.W $0723 
    STA.W $0725 

.return:
    RTS 


CinematicFunction_Intro_HandleDrawingInitialJapanText_Wait60f:
    JSR.W AdvanceSlowScreenFadeIn 
    BCC .return 
    LDA.W #CinematicFunction_Intro_PlayTheLastMetroidMusicFor200Frames 
    STA.W $1F51 
    LDA.W #$003C 
    STA.W $1A49 
    LDA.W $09E2 
    BEQ .return 
    LDX.W $0330 
    LDA.W #$0100 
    STA.B $D0,X 
    INX 
    INX 
    LDA.W #$3000 
    STA.B $D0,X 
    INX 
    INX 
    SEP #$20 
    LDA.B #$7E 
    STA.B $D0,X 
    REP #$20 
    INX 
    LDA.W #$4EE0 
    STA.B $D0,X 
    INX 
    INX 
    STX.W $0330 

.return:
    RTS 


CinematicFunction_Intro_PlayTheLastMetroidMusicFor200Frames:
    DEC.W $1A49 
    BEQ .timerExpired 
    BPL .return 

.timerExpired:
    LDA.W #CinematicFunction_Intro_PlayGalaxyIsAtPeaceMusic 
    STA.W $1F51 
    LDA.W #$00C8 
    STA.W $1A49 
    LDA.W #$0005 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 

.return:
    RTS 


CinematicFunction_Intro_PlayGalaxyIsAtPeaceMusic:
    DEC.W $1A49 
    BEQ .timerExpired 
    BPL .return 

.timerExpired:
    LDA.W #$0000 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    LDA.W #$FF42 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    LDA.W #$0005 
    LDY.W #$000E 
    JSL.L QueueMusicDataOrTrack_YFrameDelay 
    LDA.W #CinematicFunction_Intro_WaitForMusicQueue_WaitFor240Frames 
    STA.W $1F51 

.return:
    RTS 


CinematicFunction_Intro_WaitForMusicQueue_WaitFor240Frames:
    JSL.L CheckIfMusicIsQueued 
    BCS .return 
    LDA.W #CinematicFunction_Intro_FadeOut 
    STA.W $1F51 
    LDA.W #$00F0 
    STA.W $1A49 

.return:
    RTS 


CinematicFunction_Intro_FadeOut:
    DEC.W $1A49 
    BEQ .timerExpired 
    BPL .return 

.timerExpired:
    LDA.W #CinematicFunction_Intro_WaitForFadeOut 
    STA.W $1F51 
    LDA.W #$0002 
    STA.W $0723 
    STA.W $0725 

.return:
    RTS 


CinematicFunction_Intro_WaitForFadeOut:
    JSR.W AdvanceSlowScreenFadeOut 
    BCC .return 
    LDA.W #CinematicFunction_Intro_SetupIntroTextPage1 
    STA.W $1F51 

.return:
    RTS 


CinematicFunction_Intro_SetupIntroTextPage1:
    REP #$30 
    JSR.W BlankOut_JapanText_Tiles 
    SEP #$30 
    LDA.B #$80 
    STA.W $2116 
    LDA.B #$41 
    STA.W $2117 
    LDA.B #$80 
    STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl $7E4000 
    dw $0600 
    LDA.B #$02 
    STA.W $420B 
    LDA.B #$16 
    STA.W $212C 
    STA.B $69 
    REP #$30 
    LDA.W #$002F 
    JSL.L Clear_CinematicBGObjects_CinematicBGTilemap 
    JSL.L Enable_CinematicBGObjects 
    JSL.L Enable_CinematicBGTilemap_Updates 
    LDA.W #$4C00 
    STA.W $19F5 
    LDX.W #$00FE 
    LDA.W #$3C29 

.loopTopBottomMargins:
    STA.L $7E3000,X 
    STA.L $7E3700,X 
    DEX 
    DEX 
    BPL .loopTopBottomMargins 
    LDX.W #$0600 
    LDY.W #$0000 

.loopJapanTextTilemap:
    LDA.W .IntroJapanTextTilemap,Y 
    STA.L $7E3000,X 
    INY 
    INY 
    INX 
    INX 
    CPX.W #$0700 
    BMI .loopJapanTextTilemap 
    LDA.W #$1C29 
    STA.L $7E371E 
    STA.L $7E3720 
    LDY.W #CinematicSpriteObjectDefinitions_IntroTextCaret 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDA.W #$007F 
    STA.W $1A49 
    LDY.W #CinematicSpriteObjectDefinitions_SamusBlinking 
    LDA.W #$4C00 
    JSR.W Spawn_CinematicBGObject 
    LDA.W #$0008 
    STA.W $1997 
    STA.B $B7 
    STA.B $BB 
    JSR.W Clear_EnglishText_Tilemap 
    JSR.W RestIntroTextCaret 
    LDA.W #$0000 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    LDA.W #$FF36 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    LDA.W #$0005 
    LDY.W #$000E 
    JSL.L QueueMusicDataOrTrack_YFrameDelay 
    LDA.W #CineFunc_Intro_WaitForMusicQueue_FadeIn_SpawnIntroTextPage1 
    STA.W $1F51 
    RTS 


.IntroJapanTextTilemap:
    dw $3C29,$3C29,$3C29,$3C29,$3030,$3031,$3032,$3033 
    dw $3034,$3035,$3036,$3037,$3038,$3039,$303A,$303B 
    dw $303C,$303D,$303E,$303F,$3040,$3041,$3042,$3043 
    dw $3044,$3045,$3046,$3047,$3C29,$3C29,$3C29,$3C29 
    dw $3C29,$3C29,$3C29,$3C29,$3060,$3061,$3062,$3063 
    dw $3064,$3065,$3066,$3067,$3068,$3069,$306A,$306B 
    dw $306C,$306D,$306E,$306F,$3070,$3071,$3072,$3073 
    dw $3074,$3075,$3076,$3077,$3C29,$3C29,$3C29,$3C29 
    dw $3C29,$3C29,$3C29,$3C29,$3048,$3049,$304A,$304B 
    dw $304C,$304D,$304E,$304F,$3050,$3051,$3052,$3053 
    dw $3054,$3055,$3056,$3057,$3058,$3059,$305A,$305B 
    dw $305C,$305D,$305E,$305F,$3C29,$3C29,$3C29,$3C29 
    dw $3C29,$3C29,$3C29,$3C29,$3078,$3079,$307A,$307B 
    dw $307C,$307D,$307E,$307F,$3080,$3081,$3082,$3083 
    dw $3084,$3085,$3086,$3087,$3088,$3089,$308A,$308B 
    dw $308C,$308D,$308E,$308F,$3C29,$3C29,$3C29,$3C29 

CineFunc_Intro_WaitForMusicQueue_FadeIn_SpawnIntroTextPage1:
    JSL.L CheckIfMusicIsQueued 
    BCS .return 
    LDA.W #CinematicFunction_Intro_WaitForFadeIn 
    STA.W $1F51 
    LDA.W #$0002 
    STA.W $0723 
    STA.W $0725 
    LDY.W #CinematicSpriteObjectDefinitions_IntroTextPage1 
    LDA.W #$4C00 
    JSR.W Spawn_CinematicBGObject 

.return:
    RTS 


CinematicFunction_Intro_WaitForFadeIn:
    JSR.W AdvanceSlowScreenFadeIn 
    BCC .return 
    LDA.W #CinematicFunction_Nothing 
    STA.W $1F51 

.return:
    RTS 


Clear_EnglishText_Tilemap:
    PHX 
    LDX.W #$0100 
    LDA.W #$002F 

.loop:
    STA.L $7E3000,X 
    INX 
    INX 
    CPX.W #$0600 
    BMI .loop 
    PLX 
    RTS 


BlankOut_JapanText_Tiles:
    PHP 
    REP #$30 
    PHX 
    PHY 
    LDX.W #$0000 

.loop:
    LDA.L $7F8290 
    STA.L $7E4000,X 
    LDA.L $7F8292 
    STA.L $7E4002,X 
    LDA.L $7F8294 
    STA.L $7E4004,X 
    LDA.L $7F8296 
    STA.L $7E4006,X 
    LDA.L $7F8298 
    STA.L $7E4008,X 
    LDA.L $7F829A 
    STA.L $7E400A,X 
    LDA.L $7F829C 
    STA.L $7E400C,X 
    LDA.L $7F829E 
    STA.L $7E400E,X 
    TXA 
    CLC 
    ADC.W #$0010 
    TAX 
    CPX.W #$0600 
    BMI .loop 
    PLY 
    PLX 
    PLP 
    RTS 


InitFunction_CinematicSpriteObject_IntroTextCaret:
    LDA.W #$0008 
    STA.W $1A7D,Y 
    LDA.W #$0018 
    STA.W $1A9D,Y 
    LDA.W #$0C00 
    STA.W $1ABD,Y 
    RTS 


RTS_8BA8D4:
    RTS 


InitFunction_CinematicSpriteObject_MetroidEgg:
    LDA.W #$0070 
    STA.W $1A7D,Y 
    LDA.W #$009B 
    STA.W $1A9D,Y 
    LDA.W #$0E00 
    STA.W $1ABD,Y 
    RTS 


PreInstruction_CinematicSpriteObject_MetroidEgg:
    LDA.W $0AF6 
    CMP.W #$00A9 
    BPL .return 
    LDA.W #$0001 
    STA.W $1B5D,X 
    LDA.W #InstList_MetroidEggHatching_0 
    STA.W $1B1D,X 
    LDA.W #RTS_8B93D9 
    STA.W $1B3D,X 

.return:
    RTS 


PreInstruction_MetroidEgg_DeleteAfterCrossFade:
    LDA.W $1A4B 
    BNE .return 
    LDA.W #$0001 
    STA.W $1B5D,X 
    LDA.W #InstList_CinematicSpriteObject_Delete 
    STA.W $1B1D,X 
    STZ.W $1A57 

.return:
    RTS 


Instruction_SpawnMetroidEggParticles:
    PHY 
    LDA.W #$0000 
    LDY.W #CinematicSpriteObjectDefinitions_MetroidEggParticle1 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDA.W #$0001 
    LDY.W #CinematicSpriteObjectDefinitions_MetroidEggParticle2 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDA.W #$0002 
    LDY.W #CinematicSpriteObjectDefinitions_MetroidEggParticle3 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDA.W #$0003 
    LDY.W #CinematicSpriteObjectDefinitions_MetroidEggParticle4 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDA.W #$0004 
    LDY.W #CinematicSpriteObjectDefinitions_MetroidEggParticle5 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDA.W #$0005 
    LDY.W #CinematicSpriteObjectDefinitions_MetroidEggParticle6 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDA.W #$000B 
    JSL.L QueueSound_Lib2_Max6 
    PLY 
    RTS 


InitFunction_CinematicSpriteObject_MetroidEggParticles:
    LDA.W $1B9D 
    STA.W $1B7D,Y 
    ASL #2
    TAX 
    LDA.W .Xposition,X 
    CLC 
    ADC.W #$0010 
    STA.W $1A7D,Y 
    LDA.W .Yposition,X 
    CLC 
    ADC.W #$003B 
    STA.W $1A9D,Y 
    LDA.W #$0E00 
    STA.W $1ABD,Y 
    RTS 

;        _________ X position - 10h
;       |      ___ Y position - 3Bh
;       |     |
.Xposition:
    dw $005C 
.Yposition:
    dw       $0058 
    dw $0063,$0058
    dw $0059,$005D
    dw $0060,$005B
    dw $0066,$005E
    dw $0063,$0060


PreInstruction_CinematicSpriteObject_MetroidEggParticle:
    LDA.W $1B7D,X 
    AND.W #$00FF 
    ASL #2
    TAY 
    LDA.W $1ADD,X 
    CLC 
    ADC.W .Xvelocities+2,Y 
    STA.W $1ADD,X 
    LDA.W $1A7D,X 
    ADC.W .Xvelocities,Y 
    STA.W $1A7D,X 
    LDA.W $1B7D,X 
    XBA 
    AND.W #$00FF 
    ASL #2
    TAY 
    LDA.W $1AFD,X 
    CLC 
    ADC.W .Yvelocities+2,Y 
    STA.W $1AFD,X 
    LDA.W $1A9D,X 
    ADC.W .Yvelocities,Y 
    STA.W $1A9D,X 
    CMP.W #$00A8 
    BMI .lessThanA8 
    LDA.W #$0001 
    STA.W $1B5D,X 
    LDA.W #InstList_CinematicSpriteObject_Delete 
    STA.W $1B1D,X 
    RTS 


.lessThanA8:
    LDA.W $1B7D,X 
    CLC 
    ADC.W #$0100 
    STA.W $1B7D,X 
    RTS 


.Xvelocities:
; Indexed by [cinematic sprite object index] * 4
    dw $FFFF,$4000, $0000,$4000, $FFFF,$8000, $FFFF,$2000 
    dw $0000,$8000, $0000,$2000 

.Yvelocities:
; Indexed by [cinematic sprite object index] * 4
    dw $FFFE,$0000, $FFFE,$C000, $FFFE,$A000, $FFFE,$8000 
    dw $FFFE,$6000, $FFFE,$4000, $FFFE,$2000, $FFFF,$0000 
    dw $FFFF,$C000, $FFFF,$A000, $FFFF,$8000, $FFFF,$6000 
    dw $FFFF,$4000, $FFFF,$2000, $0000,$0000, $0000,$2000 
    dw $0000,$4000, $0000,$6000, $0000,$8000, $0000,$A000 
    dw $0000,$C000, $0000,$E000, $0001,$0000, $0001,$2000 
    dw $0001,$4000, $0001,$6000, $0001,$8000, $0001,$A000 
    dw $0001,$C000, $0001,$E000, $0002,$0000, $0002,$2000 
    dw $0002,$4000, $0002,$6000, $0002,$8000, $0002,$A000 
    dw $0002,$C000, $0002,$E000 


InitFunction_CinematicSpriteObject_MetroidEggSlimeDrops:
    LDA.W $1B9D 
    STA.W $1B7D,Y 
    LDA.W $1A97 
    STA.W $1A7D,Y 
    LDA.W $1AB7 
    STA.W $1A9D,Y 
    LDA.W #$0E00 
    STA.W $1ABD,Y 
    RTS 


PreInstruction_CinematicSpriteObject_MetroidEggSlimeDrops:
    LDA.W $1B7D,X 
    AND.W #$00FF 
    ASL #2
    TAY 
    LDA.W $1ADD,X 
    CLC 
    ADC.W .Xvelocities+2,Y 
    STA.W $1ADD,X 
    LDA.W $1A7D,X 
    ADC.W .Xvelocities,Y 
    STA.W $1A7D,X 
    LDA.W $1B7D,X 
    BIT.W #$0001 
    BNE .nonZero 
    XBA 
    AND.W #$00FF 
    ASL #2
    TAY 
    LDA.W $1AFD,X 
    CLC 
    ADC.W .YvelocitiesEven+2,Y 
    STA.W $1AFD,X 
    LDA.W $1A9D,X 
    ADC.W .YvelocitiesEven,Y 
    STA.W $1A9D,X 
    CMP.W #$00A8 
    BMI .notHitGround 
    BRA + 


.nonZero:
    XBA 
    AND.W #$00FF 
    ASL #2
    TAY 
    LDA.W $1AFD,X 
    CLC 
    ADC.W .YvelocitiesOdd+2,Y 
    STA.W $1AFD,X 
    LDA.W $1A9D,X 
    ADC.W .YvelocitiesOdd,Y 
    STA.W $1A9D,X 
    CMP.W #$00A8 
    BMI .notHitGround 

  + LDA.W #$0001 
    STA.W $1B5D,X 
    LDA.W #InstList_MetroidEggParticle_HitGround 
    STA.W $1B1D,X 
    LDA.W #RTS_8B93D9 
    STA.W $1B3D,X 
    RTS 


.notHitGround:
    LDA.W $1B7D,X 
    CLC 
    ADC.W #$0100 
    STA.W $1B7D,X 
    RTS 


.Xvelocities:
; Indexed by [cinematic sprite object index] * 4
    dw $FFFF,$0000, $FFFF,$8000, $0001,$0000, $0000,$8000 
    dw $FFFF,$8000 

.YvelocitiesOdd:
; for odd index slime drops. Indexed by [cinematic sprite object counter] * 4
    dw $FFFE,$0000, $FFFE,$C000, $FFFE,$A000, $FFFE,$8000 
    dw $FFFE,$6000, $FFFE,$4000, $FFFE,$2000, $FFFF,$0000 
    dw $FFFF,$C000, $FFFF,$A000, $FFFF,$8000, $FFFF,$6000 
    dw $FFFF,$4000, $FFFF,$2000, $0000,$0000, $0000,$2000 
    dw $0000,$4000, $0000,$6000, $0000,$8000, $0000,$A000 
    dw $0000,$C000, $0000,$E000, $0001,$0000, $0001,$2000 
    dw $0001,$4000, $0001,$6000, $0001,$8000, $0001,$A000 
    dw $0001,$C000, $0001,$E000, $0002,$0000, $0002,$2000 
    dw $0002,$4000, $0002,$6000, $0002,$8000, $0002,$A000 
    dw $0002,$C000, $0002,$E000, $0003,$0000, $0003,$2000 
    dw $0003,$4000, $0003,$6000, $0003,$8000, $0003,$A000 
    dw $0003,$C000, $0003,$E000, $0004,$0000, $0004,$2000 
    dw $0004,$4000, $0004,$6000, $0004,$8000, $0004,$A000 
    dw $0004,$C000, $0004,$E000, $0005,$0000, $0005,$2000 
    dw $0005,$4000, $0005,$6000, $0005,$8000, $0005,$A000 
    dw $0005,$C000, $0005,$E000 

.YvelocitiesEven:
;  for even index slime drops. Indexed by [cinematic sprite object counter] * 4
    dw $FFFD,$0000, $FFFD,$C000, $FFFD,$A000, $FFFD,$8000 
    dw $FFFD,$6000, $FFFD,$4000, $FFFD,$2000, $FFFE,$0000 
    dw $FFFE,$C000, $FFFE,$A000, $FFFE,$8000, $FFFE,$6000 
    dw $FFFE,$4000, $FFFE,$2000, $FFFF,$0000, $FFFF,$C000 
    dw $FFFF,$A000, $FFFF,$8000, $FFFF,$6000, $FFFF,$4000 
    dw $FFFF,$2000, $0000,$0000, $0000,$2000, $0000,$4000 
    dw $0000,$6000, $0000,$8000, $0000,$A000, $0000,$C000 
    dw $0000,$E000, $0001,$0000, $0001,$2000, $0001,$4000 
    dw $0001,$6000, $0001,$8000, $0001,$A000, $0001,$C000 
    dw $0001,$E000, $0002,$0000, $0002,$2000, $0002,$4000 
    dw $0002,$6000, $0002,$8000, $0002,$A000, $0002,$C000 
    dw $0002,$E000, $0003,$0000, $0003,$2000, $0003,$4000 
    dw $0003,$6000, $0003,$8000, $0003,$A000, $0003,$C000 
    dw $0003,$E000, $0004,$0000, $0004,$2000, $0004,$4000 
    dw $0004,$6000, $0004,$8000, $0004,$A000, $0004,$C000 
    dw $0004,$E000, $0005,$0000, $0005,$2000, $0005,$4000 
    dw $0005,$6000, $0005,$8000, $0005,$A000, $0005,$C000 
    dw $0005,$E000 

InitFunction_CinematicSpriteObject_BabyMetroidBeingDelivered:
    LDA.W #$0054 
    STA.W $1A7D,Y 
    LDA.W #$008B 
    STA.W $1A9D,Y 
    LDA.W #$0C00 
    STA.W $1ABD,Y 
    RTS 


PreInst_CinematicSpriteObject_BabyMetroidBeingDelivered:
    LDA.W $1A4B 
    BNE .crossFading 
    LDA.W #$0001 
    STA.W $1B5D,X 
    LDA.W #InstList_CinematicSpriteObject_Delete 
    STA.W $1B1D,X 
    RTS 


.crossFading:
    LDA.W $1A49 
    BIT.W #$0003 
    BNE .return 
    LDA.W $1993 
    BEQ .return 
    DEC A 
    STA.W $1993 
    LDA.W $1A7D,X 
    INC A 
    STA.W $1A7D,X 

.return:
    RTS 


InitFunction_CinematicSpriteObject_BabyMetroidBeingExamined:
    LDA.W #$0070 
    STA.W $1A7D,Y 
    LDA.W #$006F 
    STA.W $1A9D,Y 
    LDA.W #$0C00 
    STA.W $1ABD,Y 
    RTS 


PreInst_CinematicSpriteObject_BabyMetroidBeingExamined:
    LDA.W $1A4B 
    BNE .crossFading 
    LDA.W #$0001 
    STA.W $1B5D,X 
    LDA.W #InstList_CinematicSpriteObject_Delete 
    STA.W $1B1D,X 
    RTS 


.crossFading:
    LDA.W $1A49 
    BIT.W #$0003 
    BNE .return 
    LDA.W $1997 
    CMP.W #$0008 
    BPL .return 
    INC A 
    STA.W $1997 
    LDA.W $1A9D,X 
    DEC A 
    STA.W $1A9D,X 

.return:
    RTS 


Instruction_SetCaretToBlink:
    LDA.W #InstList_IntroTextCaret_Blink 
    STA.W $1B3B 
    LDA.W #$0001 
    STA.W $1B7B 
    RTS 


PlaceIntroTextCaretOffScreen:
    LDA.W #$0008 
    STA.W $1A9B 
    LDA.W #$00F8 
    STA.W $1ABB 
    RTS 


RestIntroTextCaret:
    LDA.W #$0008 
    STA.W $1A9B 
    LDA.W #$0018 
    STA.W $1ABB 
    LDA.W #InstList_CinematicSpriteObject_IntroTextCaret 
    STA.W $1B3B 
    LDA.W #$0001 
    STA.W $1B7B 
    RTS 


InitFunc_CinematicSpriteObject_IntroJapanTextNextPageArrow:
    LDA.W #$0080 
    STA.W $1A7D,Y 
    LDA.W #$00D8 
    STA.W $1A9D,Y 
    LDA.W #$0C00 
    STA.W $1ABD,Y 
    RTS 


PreInst_CinematicSpriteObject_IntroJapanTextNextPageArrow:
    LDA.W $1BA3 
    CMP.W #$003B 
    BNE + 
    LDA.W #$0001 
    STA.W $1B5D,X 
    LDA.W #InstList_IntroJapanTextNextPageArrow_Blink 
    STA.W $1B1D,X 

  + LDA.W $1A4B 
    CMP.W #$007F 
    BNE .return 
    LDA.W #$0001 
    STA.W $1B5D,X 
    LDA.W #InstList_CinematicSpriteObject_Delete 
    STA.W $1B1D,X 

.return:
    RTS 


Instruction_HandleCreatingJapanText_Page1:
    STZ.W $1BA1 
    LDA.W $09E2 
    BEQ .return 
    PHB 
    PEA.W $8B00 
    PLB 
    PLB 
    PHY 
    LDY.W #Mode7Objects_IntroJapanText_Page1 
    JSR.W Spawn_Mode7Objects 
    PLY 
    PLB 

.return:
    RTS 


Instruction_SpawnBlinkingMarkers_WaitForInput_Page1:
    JSR.W Instruction_SetCaretToBlink 
    LDA.W $09E2 
    BEQ .waitForInput 
    PHB 
    PEA.W $8B00 
    PLB 
    PLB 
    PHY 
    LDY.W #CinematicSpriteObjectDefinitions_IntroJapanTextNextPageArrow 
    JSR.W Spawn_CinematicSpriteObject_Y 
    PLY 
    PLB 

.waitForInput:
    LDA.W #CinematicFunction_Intro_WaitForInput_SetupMotherBrainFight 
    STA.W $1F51 
    RTS 


Instruction_HandleCreatingJapanText_Page2:
    STZ.W $1BA1 
    LDA.W $09E2 
    BEQ .return 
    PHB 
    PEA.W $8B00 
    PLB 
    PLB 
    PHY 
    LDY.W #Mode7Objects_IntroJapanText_Page2_Subpage1 
    JSR.W Spawn_Mode7Objects 
    PLY 
    PLB 

.return:
    RTS 


Instruction_SpawnBlinkingMarkers_WaitForInput_Page2:
    JSR.W Instruction_SetCaretToBlink 
    LDA.W $09E2 
    BEQ .noJapanText 
    PHB 
    PEA.W $8B00 
    PLB 
    PLB 
    PHY 
    LDY.W #CinematicSpriteObjectDefinitions_IntroJapanTextNextPageArrow 
    JSR.W Spawn_CinematicSpriteObject_Y 
    PLY 
    PHY 
    LDY.W #Mode7Objects_IntroJapanText_Page2_Subpage2 
    JSR.W Spawn_Mode7Objects 
    PLY 
    PLB 
    RTS 


.noJapanText:
    LDA.W #CinematicFunc_Intro_WaitForInput_SetupBabyMetroidDiscovery 
    STA.W $1F51 
    RTS 


CinematicFunction_Intro_WaitForInput_SetupMotherBrainFight:
    LDA.W $1BA3 
    BEQ .timerExpired 
    DEC A 
    STA.W $1BA3 
    RTS 


.timerExpired:
    LDA.B $8F 
    BNE .newInputs 
    RTS 


.newInputs:
    SEP #$20 
    LDA.B #$50 
    STA.B $58 
    REP #$20 
    LDA.W #$0002 
    STA.W $0A1C 
    JSL.L InitializeSamusPose_1 
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged 
    LDA.W $0A20 
    STA.W $0A24 
    LDA.W $0A22 
    STA.W $0A26 
    LDA.W $0A1C 
    STA.W $0A20 
    LDA.W $0A1E 
    STA.W $0A22 
    LDA.W #$009B 
    STA.W $0AF6 
    STA.W $0B10 
    LDA.W #$0073 
    STA.W $0AFA 
    STA.W $0B14 
    STZ.W $1993 
    LDA.W #$007F 
    STA.W $1A4B 
    LDY.W #CinematicSpriteObjectDefinitions_IntroMotherBrain 
    STZ.B $12 
    JSR.W Spawn_CinematicSpriteObject_YToIndex12 
    LDY.W #CinematicSpriteObjectDefinitions_RinkaSpawner 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDX.W #$0000 

.loopLevelData:
    LDA.L LevelData_OldMotherBrainRoomFromCutscene,X 
    STA.L $7F0002,X 
    INX 
    INX 
    CPX.W #$01C0 
    BMI .loopLevelData 
    LDX.W #$0000 
    LDA.W #$0000 

.loopBTS:
    STA.L $7F6402,X 
    INX 
    INX 
    CPX.W #$0200 
    BMI .loopBTS 
    LDA.W #$0001 
    STA.W $09D2 
    LDA.W #SamusCurrentStateHandler_Demo 
    STA.W $0A42 
    LDA.W #SamusNewStateHandler_IntroDemo 
    STA.W $0A44 
    JSL.L Clear_DemoInput_RAM 
    JSL.L Enable_DemoInput 
    LDY.W #DemoInputObjects_Intro_OldMotherBrainFight 
    JSL.L Load_DemoInputObject 
    LDA.W #$FFFF 
    STA.W $1A57 
    JMP.W Setup_Intro_CrossFade_Into_SamusGameplay 

    RTS 


CinematicFunc_Intro_WaitForInput_SetupBabyMetroidDiscovery:
    LDA.W $1BA3 
    BEQ .timerExpired 
    DEC A 
    STA.W $1BA3 
    RTS 


.timerExpired:
    LDA.B $8F 
    BNE .newInputs 
    RTS 


.newInputs:
    SEP #$20 
    LDA.B #$54 
    STA.B $58 
    REP #$20 
    LDA.W #$0020 
    STA.W $07A5 
    LDA.W #$0010 
    STA.W $07A7 
    LDA.W #$0002 
    STA.W $0A1C 
    JSL.L InitializeSamusPose_1 
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged 
    LDA.W $0A20 
    STA.W $0A24 
    LDA.W $0A22 
    STA.W $0A26 
    LDA.W $0A1C 
    STA.W $0A20 
    LDA.W $0A1E 
    STA.W $0A22 
    LDA.W #$0178 
    STA.W $0AF6 
    STA.W $0B10 
    LDA.W #$0093 
    STA.W $0AFA 
    STA.W $0B14 
    STZ.W $1993 
    LDA.W #$007F 
    STA.W $1A4B 
    LDY.W #CinematicSpriteObjectDefinitions_MetroidEgg 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDY.W #CinematicSpriteObjectDefinitions_ConfusedBabyMetroid 
    JSR.W Spawn_CinematicSpriteObject_Y 
    STZ.W $1B9F 
    LDX.W #$0000 

.loopLevelData:
    LDA.L LevelData_RoomWithBabyMetroidHatchingFromCutscene,X 
    STA.L $7F0002,X 
    INX 
    INX 
    CPX.W #$0300 
    BMI .loopLevelData 
    STZ.W $09D2 
    LDA.W #SamusCurrentStateHandler_Demo 
    STA.W $0A42 
    LDA.W #SamusNewStateHandler_IntroDemo 
    STA.W $0A44 
    JSL.L Clear_DemoInput_RAM 
    JSL.L Enable_DemoInput 
    LDY.W #DemoInputObjects_Intro_BabyMetroidDiscovery 
    JSL.L Load_DemoInputObject 
    LDA.W #$0001 
    STA.W $1A57 
    BRA Setup_Intro_CrossFade_Into_SamusGameplay 

    RTS 


Setup_Intro_CrossFade_Into_SamusGameplay:
    SEP #$20 
    LDA.B #$06 
    STA.B $69 
    LDA.B #$11 
    STA.B $6B 
    LDA.B #$02 
    STA.B $6F 
    STZ.B $72 
    JSL.L SpawnIntroCutsceneCrossFade_HDMAObject 
    REP #$20 
    JSR.W PlaceIntroTextCaretOffScreen 
    LDA.W #CinematicFunction_Intro_CrossFadeToSamusGameplay 
    STA.W $1F51 
    LDX.W #$0000 

.loopPalettes:
    LDA.L Palettes_Intro,X 
    STA.L $7E2200,X 
    INX 
    INX 
    CPX.W #$0200 
    BMI .loopPalettes 
    JSR.W PaletteCrossFading_DecomposePaletteDataForFading 
    LDX.W #$0028 
    LDY.W #$0003 
    JSR.W PaletteCrossFading_ClearYColorsStartingFromColorIndexX 
    LDX.W #$00E0 
    LDY.W #$0010 
    JSR.W PaletteCrossFading_ClearYColorsStartingFromColorIndexX 
    LDX.W #$0180 
    LDY.W #$0020 
    JSR.W PaletteCrossFading_ClearYColorsStartingFromColorIndexX 
    LDX.W #$01E0 
    LDY.W #$0010 
    JSR.W PaletteCrossFading_ClearYColorsStartingFromColorIndexX 
    JSR.W PaletteCrossFading_ComposeFadingPalettes 
    RTS 


Instruction_HandleCreatingJapanText_Page3:
    STZ.W $1BA1 
    LDA.W $09E2 
    BEQ .return 
    PHB 
    PEA.W $8B00 
    PLB 
    PLB 
    PHY 
    LDY.W #Mode7Objects_IntroJapanText_Page3_Subpage1 
    JSR.W Spawn_Mode7Objects 
    PLY 
    PLB 

.return:
    RTS 


Instruction_SpawnBlinkingMarkers_WaitForInput_Page3:
    JSR.W Instruction_SetCaretToBlink 
    LDA.W $09E2 
    BEQ .waitForInput 
    PHB 
    PEA.W $8B00 
    PLB 
    PLB 
    PHY 
    LDY.W #CinematicSpriteObjectDefinitions_IntroJapanTextNextPageArrow 
    JSR.W Spawn_CinematicSpriteObject_Y 
    PLY 
    PHY 
    LDY.W #Mode7Objects_IntroJapanText_Page3_Subpage2 
    JSR.W Spawn_Mode7Objects 
    PLY 
    PLB 
    RTS 


.waitForInput:
    LDA.W #CinematicFunc_Intro_WaitForInput_SetupBabyMetroidDelivery 
    STA.W $1F51 
    RTS 


Instruction_HandleCreatingJapanText_Page4:
    STZ.W $1BA1 
    LDA.W $09E2 
    BEQ .return 
    PHB 
    PEA.W $8B00 
    PLB 
    PLB 
    PHY 
    LDY.W #Mode7Objects_IntroJapanText_Page4_Subpage1 
    JSR.W Spawn_Mode7Objects 
    PLY 
    PLB 

.return:
    RTS 


Instruction_SpawnBlinkingMarkers_WaitForInput_Page4:
    JSR.W Instruction_SetCaretToBlink 
    LDA.W $09E2 
    BEQ .waitForInput 
    PHB 
    PEA.W $8B00 
    PLB 
    PLB 
    PHY 
    LDY.W #CinematicSpriteObjectDefinitions_IntroJapanTextNextPageArrow 
    JSR.W Spawn_CinematicSpriteObject_Y 
    PLY 
    PHY 
    LDY.W #Mode7Objects_IntroJapanText_Page4_Subpage2 
    JSR.W Spawn_Mode7Objects 
    PLY 
    PLB 
    RTS 


.waitForInput:
    LDA.W #CinematicFunc_Intro_WaitForInput_SetupBabyMetroidExamined 
    STA.W $1F51 
    RTS 


CinematicFunc_Intro_WaitForInput_SetupBabyMetroidDelivery:
    LDA.W $1BA3 
    BEQ .timerExpired 
    DEC A 
    STA.W $1BA3 
    RTS 


.timerExpired:
    LDA.B $8F 
    BEQ .return 
    SEP #$20 
    LDA.B #$58 
    STA.B $58 
    REP #$20 
    LDA.W #$0020 
    STA.W $1993 
    LDA.W #$0008 
    STA.W $1997 
    LDA.W #$007F 
    STA.W $1A4B 
    LDY.W #CinematicSpriteObjectDefinitions_BabyMetroidBeingDelivered 
    JSR.W Spawn_CinematicSpriteObject_Y 
    BRA SetupIntroCrossFadeIntoScientistCutscene 


.return:
    RTS 


CinematicFunc_Intro_WaitForInput_SetupBabyMetroidExamined:
    LDA.W $1BA3 
    BEQ .timerExpired 
    DEC A 
    STA.W $1BA3 
    RTS 


.timerExpired:
    LDA.B $8F 
    BEQ .return 
    SEP #$20 
    LDA.B #$5C 
    STA.B $58 
    REP #$20 
    STZ.W $1993 
    LDA.W #$FFE8 
    STA.W $1997 
    LDA.W #$007F 
    STA.W $1A4B 
    LDY.W #CinematicSpriteObjectDefinitions_BabyMetroidBeingExamined 
    JSR.W Spawn_CinematicSpriteObject_Y 
    BRA SetupIntroCrossFadeIntoScientistCutscene 


.return:
    RTS 


SetupIntroCrossFadeIntoScientistCutscene:
    SEP #$20 
    LDA.B #$06 
    STA.B $69 
    LDA.B #$11 
    STA.B $6B 
    LDA.B #$02 
    STA.B $6F 
    STZ.B $72 
    JSL.L SpawnIntroCutsceneCrossFade_HDMAObject 
    REP #$20 
    JSR.W PlaceIntroTextCaretOffScreen 
    LDA.W #CinematicFunction_Intro_CrossFadeToScientistCutscene 
    STA.W $1F51 
    LDX.W #$0000 

.loop:
    LDA.L Palettes_Intro,X 
    STA.L $7E2200,X 
    INX 
    INX 
    CPX.W #$0200 
    BMI .loop 
    JSR.W PaletteCrossFading_DecomposePaletteDataForFading 
    LDX.W #$0040 
    LDY.W #$0010 
    JSR.W PaletteCrossFading_ClearYColorsStartingFromColorIndexX 
    LDX.W #$01C0 
    LDY.W #$0009 
    JSR.W PaletteCrossFading_ClearYColorsStartingFromColorIndexX 
    JSR.W PaletteCrossFading_ComposeFadingPalettes 
    RTS 


Instruction_HandleCreatingJapanText_Page5:
    STZ.W $1BA1 
    LDA.W $09E2 
    BEQ .return 
    PHB 
    PEA.W $8B00 
    PLB 
    PLB 
    PHY 
    LDY.W #Mode7Objects_IntroJaanText_Page5_Subpage1 
    JSR.W Spawn_Mode7Objects 
    PLY 
    PLB 

.return:
    RTS 


Instruction_SpawnBlinkingMarkers_WaitForInput_Page5:
    JSR.W Instruction_SetCaretToBlink 
    LDA.W $09E2 
    BEQ .waitForInput 
    PHB 
    PEA.W $8B00 
    PLB 
    PLB 
    PHY 
    LDY.W #CinematicSpriteObjectDefinitions_IntroJapanTextNextPageArrow 
    JSR.W Spawn_CinematicSpriteObject_Y 
    PLY 
    PHY 
    LDY.W #Mode7Objects_IntroJapanText_Page5_Subpage2 
    JSR.W Spawn_Mode7Objects 
    PLY 
    PLB 
    RTS 


.waitForInput:
    LDA.W #CinematicFunction_Intro_WaitForInput_ClearText 
    STA.W $1F51 
    RTS 


CinematicFunction_Intro_WaitForInput_ClearText:
    JSR.W RTS_BackgroundFLickeringEffect 
    LDA.W $1BA3 
    BEQ .timerExpired 
    DEC A 
    STA.W $1BA3 
    RTS 


.timerExpired:
    LDA.B $8F 
    BEQ .return 
    LDA.W #$007F 
    STA.W $1A4B 
    LDA.W $09E2 
    BEQ CinematicFunction_Intro_Page6 
    LDA.W #CinematicFunction_Intro_Page6 
    STA.W $1F51 
    JSL.L Disable_CinematicBGTilemap_Updates 
    JSR.W BlankOut_JapanText_Tiles 
    JSR.W TransferJapanTextTilesToVRAM 

.return:
    RTS 


CinematicFunction_Intro_Page6:
    JSL.L Enable_CinematicBGTilemap_Updates 
    JSR.W Clear_EnglishText_Tilemap 
    LDY.W #CinematicSpriteObjectDefinitions_IntroTextPage6 
    LDA.W #$4C00 
    JSR.W Spawn_CinematicBGObject 
    LDA.W #RTS_8BA390 
    STA.W $1F51 
    JSR.W RestIntroTextCaret 
    LDA.W #$0000 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    RTS 


Instruction_HandleCreatingJapanText_Page6:
    STZ.W $1BA1 
    LDA.W $09E2 
    BEQ .return 
    PHB 
    PEA.W $8B00 
    PLB 
    PLB 
    PHY 
    LDY.W #Mode7Objects_IntroJapanText_Page6 
    JSR.W Spawn_Mode7Objects 
    PLY 
    PLB 

.return:
    RTS 


Instruction_FinishIntro:
    LDA.W #CinematicFunction_Intro_Finish 
    STA.W $1F51 
    LDA.W #$0001 
    STA.W $0723 
    STA.W $0725 
    RTS 


CinematicFunction_Intro_CrossFadeToSamusGameplay:
    LDA.W $1A49 
    BIT.W #$0003 
    BNE .decTimer 
    LDX.W #$0000 
    LDY.W #$0014 
    JSR.W PaletteCrossFading_FadeOutYColorsStartingFromColorIndexX 
    LDX.W #$0060 
    LDY.W #$0010 
    JSR.W PaletteCrossFading_FadeOutYColorsStartingFromColorIndexX 
    LDX.W #$01D2 
    LDY.W #$0006 
    JSR.W PaletteCrossFading_FadeOutYColorsStartingFromColorIndexX 
    LDX.W #$0028 
    LDY.W #$0003 
    JSR.W PaletteCrossFading_FadeInYColorsStartingFromColorIndexX 
    LDX.W #$00E0 
    LDY.W #$0010 
    JSR.W PaletteCrossFading_FadeInYColorsStartingFromColorIndexX 
    LDX.W #$0180 
    LDY.W #$0020 
    JSR.W PaletteCrossFading_FadeInYColorsStartingFromColorIndexX 
    LDX.W #$01E0 
    LDY.W #$0010 
    JSR.W PaletteCrossFading_FadeInYColorsStartingFromColorIndexX 
    JSR.W PaletteCrossFading_ComposeFadingPalettes 

.decTimer:
    DEC.W $1A49 
    BPL .return 
    SEP #$20 
    LDA.B #$15 
    STA.B $69 
    STZ.B $6B 
    STZ.B $6F 
    REP #$20 
    LDX.W #$0100 
    LDA.W #$002F 

.loop:
    STA.L $7E3000,X 
    INX 
    INX 
    CPX.W #$0600 
    BMI .loop 
    JSR.W BlankOut_JapanText_Tiles 
    LDA.W #CinematicFunction_Nothing 
    STA.W $1F51 
    LDA.W $1A57 
    BPL .return 
    LDY.W #PaletteFXObjects_OldMotherBrainFightBackgroundLights 
    JSL.L Spawn_PaletteFXObject 

.return:
    RTS 


CinematicFunction_Intro_CrossFadeToScientistCutscene:
    LDA.W $1A49 
    BIT.W #$0003 
    BNE .decTimer 
    LDX.W #$0000 
    LDY.W #$0014 
    JSR.W PaletteCrossFading_FadeOutYColorsStartingFromColorIndexX 
    LDX.W #$0060 
    LDY.W #$0010 
    JSR.W PaletteCrossFading_FadeOutYColorsStartingFromColorIndexX 
    LDX.W #$01D2 
    LDY.W #$0006 
    JSR.W PaletteCrossFading_FadeOutYColorsStartingFromColorIndexX 
    LDX.W #$0040 
    LDY.W #$0010 
    JSR.W PaletteCrossFading_FadeInYColorsStartingFromColorIndexX 
    LDX.W #$01C0 
    LDY.W #$0009 
    JSR.W PaletteCrossFading_FadeInYColorsStartingFromColorIndexX 
    JSR.W PaletteCrossFading_ComposeFadingPalettes 

.decTimer:
    DEC.W $1A49 
    BPL .return 
    SEP #$20 
    LDA.B #$15 
    STA.B $69 
    STZ.B $6B 
    STZ.B $6F 
    REP #$20 
    LDX.W #$0100 
    LDA.W #$002F 

.loopEnglishText:
    STA.L $7E3000,X 
    INX 
    INX 
    CPX.W #$0600 
    BMI .loopEnglishText 
    JSR.W BlankOut_JapanText_Tiles 
    LDA.W #CinematicFunction_Nothing 
    STA.W $1F51 

.return:
    RTS 


Instruction_StartIntroPage2:
    LDA.W #CinematicFunction_Intro_Page2 
    STA.W $1F51 
    BRA ClearJapanTextTiles_DisableCinematicBGTilemapUpdates 


Instruction_StartIntroPage3:
    LDA.W #CinematicFunction_Intro_Page3 
    STA.W $1F51 
    BRA ClearJapanTextTiles_DisableCinematicBGTilemapUpdates 


Instruction_StartIntroPage4:
    LDA.W #CinematicFunction_Intro_Page4 
    STA.W $1F51 
    BRA ClearJapanTextTiles_DisableCinematicBGTilemapUpdates 


Instruction_StartIntroPage5:
    LDA.W #CinematicFunction_Intro_Page5 
    STA.W $1F51 

ClearJapanTextTiles_DisableCinematicBGTilemapUpdates:
    JSL.L Disable_CinematicBGTilemap_Updates 
    JSR.W BlankOut_JapanText_Tiles 
    JSR.W TransferJapanTextTilesToVRAM 
    RTS 


CinematicFunction_Intro_Page2:
    LDY.W #CinematicSpriteObjectDefinitions_IntroTextPage2 
    LDA.W #$4C00 
    JSR.W Spawn_CinematicBGObject 
    LDA.W #CinematicFunction_Intro_CrossFadeFromSamusGameplay 
    STA.W $1F51 
    BRA Setup_Intro_CrossFade_Into_Text 


CinematicFunction_Intro_Page3:
    LDY.W #CinematicSpriteObjectDefinitions_IntroTextPage3 
    LDA.W #$4C00 
    JSR.W Spawn_CinematicBGObject 
    LDA.W #CinematicFunction_Intro_CrossFadeFromSamusGameplay 
    STA.W $1F51 
    BRA Setup_Intro_CrossFade_Into_Text 


CinematicFunction_Intro_Page4:
    LDY.W #CinematicSpriteObjectDefinitions_IntroTextPage4 
    LDA.W #$4C00 
    JSR.W Spawn_CinematicBGObject 
    LDA.W #CinematicFunction_Intro_CrossFadeFromScientistCutscene 
    STA.W $1F51 
    BRA Setup_Intro_CrossFade_Into_Text 


CinematicFunction_Intro_Page5:
    LDY.W #CinematicSpriteObjectDefinitions_IntroTextPage5 
    LDA.W #$4C00 
    JSR.W Spawn_CinematicBGObject 
    LDA.W #CinematicFunction_Intro_CrossFadeFromScientistCutscene 
    STA.W $1F51 

Setup_Intro_CrossFade_Into_Text:
    SEP #$20 
    LDA.B #$06 
    STA.B $69 
    LDA.B #$11 
    STA.B $6B 
    LDA.B #$02 
    STA.B $6F 
    STZ.B $72 
    REP #$20 
    LDX.W #$0000 

.loopPalettes:
    LDA.L Palettes_Intro,X 
    STA.L $7E2200,X 
    INX 
    INX 
    CPX.W #$0200 
    BMI .loopPalettes 
    JSR.W PaletteCrossFading_DecomposePaletteDataForFading 
    LDX.W #$0000 
    LDY.W #$0010 
    JSR.W PaletteCrossFading_ClearYColorsStartingFromColorIndexX 
    LDX.W #$0060 
    LDY.W #$0010 
    JSR.W PaletteCrossFading_ClearYColorsStartingFromColorIndexX 
    LDX.W #$01D2 
    LDY.W #$0006 
    JSR.W PaletteCrossFading_ClearYColorsStartingFromColorIndexX 
    JSR.W PaletteCrossFading_ComposeFadingPalettes 
    LDA.W #$007F 
    STA.W $1A49 
    JSL.L Enable_CinematicBGTilemap_Updates 
    JSR.W RestIntroTextCaret 
    RTS 


CinematicFunction_Intro_CrossFadeFromSamusGameplay:
    LDA.W $1A4B 
    BIT.W #$0003 
    BNE .decTimer 
    LDX.W #$0000 
    LDY.W #$0010 
    JSR.W PaletteCrossFading_FadeInYColorsStartingFromColorIndexX 
    LDX.W #$0060 
    LDY.W #$0010 
    JSR.W PaletteCrossFading_FadeInYColorsStartingFromColorIndexX 
    LDX.W #$01D2 
    LDY.W #$0006 
    JSR.W PaletteCrossFading_FadeInYColorsStartingFromColorIndexX 
    LDX.W #$0028 
    LDY.W #$0003 
    JSR.W PaletteCrossFading_FadeOutYColorsStartingFromColorIndexX 
    LDX.W #$00E0 
    LDY.W #$0010 
    JSR.W PaletteCrossFading_FadeOutYColorsStartingFromColorIndexX 
    LDX.W #$0180 
    LDY.W #$0020 
    JSR.W PaletteCrossFading_FadeOutYColorsStartingFromColorIndexX 
    LDX.W #$01E0 
    LDY.W #$0010 
    JSR.W PaletteCrossFading_FadeOutYColorsStartingFromColorIndexX 
    JSR.W PaletteCrossFading_ComposeFadingPalettes 

.decTimer:
    DEC.W $1A4B 
    BPL .return 
    SEP #$20 
    LDA.B #$16 
    STA.B $69 
    STZ.B $6B 
    STZ.B $6F 
    STZ.B $72 
    REP #$20 
    LDA.W #CinematicFunction_Nothing 
    STA.W $1F51 

.return:
    RTS 


CinematicFunction_Intro_CrossFadeFromScientistCutscene:
    LDA.W $1A4B 
    BIT.W #$0003 
    BNE .decTimer 
    LDX.W #$0000 
    LDY.W #$0010 
    JSR.W PaletteCrossFading_FadeInYColorsStartingFromColorIndexX 
    LDX.W #$0060 
    LDY.W #$0010 
    JSR.W PaletteCrossFading_FadeInYColorsStartingFromColorIndexX 
    LDX.W #$01D2 
    LDY.W #$0006 
    JSR.W PaletteCrossFading_FadeInYColorsStartingFromColorIndexX 
    LDX.W #$0040 
    LDY.W #$0010 
    JSR.W PaletteCrossFading_FadeOutYColorsStartingFromColorIndexX 
    LDX.W #$01C0 
    LDY.W #$0009 
    JSR.W PaletteCrossFading_FadeOutYColorsStartingFromColorIndexX 
    JSR.W PaletteCrossFading_ComposeFadingPalettes 

.decTimer:
    DEC.W $1A4B 
    BPL .return 
    SEP #$20 
    LDA.B #$16 
    STA.B $69 
    STZ.B $6B 
    STZ.B $6F 
    STZ.B $72 
    REP #$20 
    LDX.W #$0000 

.loopPalettes:
    LDA.L Palettes_Intro_CrossFade,X 
    STA.L $7EC1C0,X 
    INX 
    INX 
    CPX.W #$000E 
    BMI .loopPalettes 
    LDA.W #CinematicFunction_Nothing 
    STA.W $1F51 

.return:
    RTS 


PreInstruction_CinematicBGObject_SamusBlinking:
    LDA.W $1F51 
    CMP.W #CinematicFunction_Intro_Page6 
    BEQ .notPage6 
    CMP.W #RTS_8BA390 
    BNE .return 

.notPage6:
    LDA.W #CinematicBGObjectInstLists_SamusBlinkingPage6 
    STA.W $19CD,X 
    LDA.W #$0001 
    STA.W $19DD,X 
    LDA.W #RTS_8B93D9 
    STA.W $19D5,X 

.return:
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_CinematicBGObject_8BB4DC:
    LDA.W $1B3B 
    CMP.W #InstList_IntroTextCaret_Blink 
    BMI .return 
    LDA.W #$0001 
    STA.W $19DD,X 

.return:
    RTS 


UNUSED_Instruction_LoadIntroJapanText_NonExistent:
    PHY 
    JSL.L Disable_CinematicBGTilemap_Updates 
    LDA.L Palettes_Intro_nonExistentIntroText1 
    STA.L $7EC022 
    LDA.L Palettes_Intro_nonExistentIntroText2 
    STA.L $7EC024 
    LDA.L Palettes_Intro_nonExistentIntroText3 
    STA.L $7EC026 
    LDY.W #InstList_Mode7Object_Page1 
    JSR.W LoadJapanTextIntroTiles 
    LDY.W #InstList_Mode7Object_Page1 
    JSR.W LoadJapanTextIntroTiles 
    JSR.W TransferJapanTextTilesToVRAM 
    PLY 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_EnableCinematicBGTilemapUpdates:
    JSL.L Enable_CinematicBGTilemap_Updates 
    RTS 


Instruction_LoadIntroJapanTextPage1:
    PHY 
    JSL.L Disable_CinematicBGTilemap_Updates 
    LDA.L Palettes_Intro_nonExistentIntroText1 
    STA.L $7EC022 
    LDA.L Palettes_Intro_nonExistentIntroText2 
    STA.L $7EC024 
    LDA.L Palettes_Intro_nonExistentIntroText3 
    STA.L $7EC026 
    JSR.W BlankOut_JapanText_Tiles 
    LDY.W #IntroJapanTextData_Page1_TopLine 
    JSR.W LoadJapanTextIntroTiles 
    LDY.W #IntroJapanTextData_Page1_BottomLine 
    JSR.W LoadJapanTextIntroTiles 
    JSR.W TransferJapanTextTilesToVRAM 
    PLY 
    RTS 


Instruction_EnableCinematicBGTilemapUpdates_duplicate:
    JSL.L Enable_CinematicBGTilemap_Updates 
    RTS 


Instruction_LoadIntroJapanTextPage2_Subpage1:
    PHY 
    JSL.L Disable_CinematicBGTilemap_Updates 
    LDA.L Palettes_Intro_nonExistentIntroText1 
    STA.L $7EC022 
    LDA.L Palettes_Intro_nonExistentIntroText2 
    STA.L $7EC024 
    LDA.L Palettes_Intro_nonExistentIntroText3 
    STA.L $7EC026 
    JSR.W BlankOut_JapanText_Tiles 
    LDY.W #IntroJapanTextData_Page2_Subpage1_TopLine 
    JSR.W LoadJapanTextIntroTiles 
    LDY.W #IntroJapanTextData_Page2_Subpage1_BottomLine 
    JSR.W LoadJapanTextIntroTiles 
    JSR.W TransferJapanTextTilesToVRAM 
    PLY 
    RTS 


Instruction_LoadIntroJapanTextPage2_Subpage2:
    LDA.B $8F 
    BEQ .return 
    LDA.W #InstList_EnableCinematicBGTilemapUpdates_Page2DoneInput 
    STA.W $19A1,X 
    LDA.W #$0001 
    STA.W $19A9,X 
    LDA.W #RTS_8B93D9 
    STA.W $19A5,X 
    JSL.L Disable_CinematicBGTilemap_Updates 
    JSR.W BlankOut_JapanText_Tiles 
    LDY.W #IntroJapanTextData_Page2_Subpage2_TopLine 
    JSR.W LoadJapanTextIntroTiles 
    LDY.W #IntroJapanTextData_Page2_Subpage2_BottomLine 
    JSR.W LoadJapanTextIntroTiles 
    JSR.W TransferJapanTextTilesToVRAM 
    LDA.W #$003C 
    STA.W $1BA3 

.return:
    RTS 


Instruction_EnableCinematicBGTilemapUpdates_Page2DoneInput:
    JSL.L Enable_CinematicBGTilemap_Updates 
    LDA.W #CinematicFunc_Intro_WaitForInput_SetupBabyMetroidDiscovery 
    STA.W $1F51 
    RTS 


Instruction_LoadIntroJapanTextPage3_Subpage1:
    PHY 
    JSL.L Disable_CinematicBGTilemap_Updates 
    LDA.L Palettes_Intro_nonExistentIntroText1 
    STA.L $7EC022 
    LDA.L Palettes_Intro_nonExistentIntroText2 
    STA.L $7EC024 
    LDA.L Palettes_Intro_nonExistentIntroText3 
    STA.L $7EC026 
    JSR.W BlankOut_JapanText_Tiles 
    LDY.W #IntroJapanTextData_Page3_Subpage1 
    JSR.W LoadJapanTextIntroTiles 
    JSR.W TransferJapanTextTilesToVRAM 
    PLY 
    RTS 


PreInstruction_LoadIntroJapanTextPage3_Subpage2:
    LDA.B $8F 
    BEQ .return 
    LDA.W #InstList_EnableCinematicBGTilemapUpdates_Page3DoneInput 
    STA.W $19A1,X 
    LDA.W #$0001 
    STA.W $19A9,X 
    LDA.W #RTS_8B93D9 
    STA.W $19A5,X 
    JSL.L Disable_CinematicBGTilemap_Updates 
    JSR.W BlankOut_JapanText_Tiles 
    LDY.W #IntroJapanTextData_Page3_Subpage2 
    JSR.W LoadJapanTextIntroTiles 
    JSR.W TransferJapanTextTilesToVRAM 
    LDA.W #$003C 
    STA.W $1BA3 

.return:
    RTS 


Instruction_EnableCinematicBGTilemapUpdates_Page3DoneInput:
    JSL.L Enable_CinematicBGTilemap_Updates 
    LDA.W #CinematicFunc_Intro_WaitForInput_SetupBabyMetroidDelivery 
    STA.W $1F51 
    RTS 


Instruction_LoadIntroJapanTextPage4_Subpage1:
    PHY 
    JSL.L Disable_CinematicBGTilemap_Updates 
    LDA.L Palettes_Intro_nonExistentIntroText1 
    STA.L $7EC022 
    LDA.L Palettes_Intro_nonExistentIntroText2 
    STA.L $7EC024 
    LDA.L Palettes_Intro_nonExistentIntroText3 
    STA.L $7EC026 
    JSR.W BlankOut_JapanText_Tiles 
    LDY.W #IntroJapanTextData_Page4_Subpage1_TopLine 
    JSR.W LoadJapanTextIntroTiles 
    LDY.W #IntroJapanTextData_Page4_Subpage1_BottomLine 
    JSR.W LoadJapanTextIntroTiles 
    JSR.W TransferJapanTextTilesToVRAM 
    PLY 
    RTS 


PreInstruction_LoadIntroJapanTextPage4_Subpage2:
    LDA.B $8F 
    BEQ .return 
    LDA.W #InstList_EnableCinematicBGTilemapUpdates_Page4DoneInput 
    STA.W $19A1,X 
    LDA.W #$0001 
    STA.W $19A9,X 
    LDA.W #RTS_8B93D9 
    STA.W $19A5,X 
    JSL.L Disable_CinematicBGTilemap_Updates 
    JSR.W BlankOut_JapanText_Tiles 
    LDY.W #IntroJapanTextData_Page4_Subpage2_TopLine 
    JSR.W LoadJapanTextIntroTiles 
    LDY.W #IntroJapanTextData_Page4_Subpage2_BottomLine 
    JSR.W LoadJapanTextIntroTiles 
    JSR.W TransferJapanTextTilesToVRAM 
    LDA.W #$003C 
    STA.W $1BA3 

.return:
    RTS 


Instruction_EnableCinematicBGTilemapUpdates_Page4DoneInput:
    JSL.L Enable_CinematicBGTilemap_Updates 
    LDA.W #CinematicFunc_Intro_WaitForInput_SetupBabyMetroidExamined 
    STA.W $1F51 
    RTS 


Instruction_LoadIntroJapanTextPage5_Subpage1:
    PHY 
    JSL.L Disable_CinematicBGTilemap_Updates 
    LDA.L Palettes_Intro_nonExistentIntroText1 
    STA.L $7EC022 
    LDA.L Palettes_Intro_nonExistentIntroText2 
    STA.L $7EC024 
    LDA.L Palettes_Intro_nonExistentIntroText3 
    STA.L $7EC026 
    JSR.W BlankOut_JapanText_Tiles 
    LDY.W #IntroJapanTextData_Page5_Subpage1 
    JSR.W LoadJapanTextIntroTiles 
    JSR.W TransferJapanTextTilesToVRAM 
    PLY 
    RTS 


PreInstruction_LoadIntroJapanTextPage5_Subpage2:
    LDA.B $8F 
    BEQ .return 
    LDA.W #InstList_EnableCinematicBGTilemapUpdates_Page5DoneInput 
    STA.W $19A1,X 
    LDA.W #$0001 
    STA.W $19A9,X 
    LDA.W #RTS_8B93D9 
    STA.W $19A5,X 
    JSL.L Disable_CinematicBGTilemap_Updates 
    JSR.W BlankOut_JapanText_Tiles 
    LDY.W #IntroJapanTextData_Page5_Subpage2 
    JSR.W LoadJapanTextIntroTiles 
    JSR.W TransferJapanTextTilesToVRAM 
    LDA.W #$003C 
    STA.W $1BA3 

.return:
    RTS 


Instruction_EnableCinematicBGTilemapUpdates_Page5DoneInput:
    JSL.L Enable_CinematicBGTilemap_Updates 
    LDA.W #CinematicFunction_Intro_WaitForInput_ClearText 
    STA.W $1F51 
    RTS 


Instruction_LoadIntroJapanTextPage6:
    PHY 
    JSL.L Disable_CinematicBGTilemap_Updates 
    JSR.W BlankOut_JapanText_Tiles 
    LDY.W #IntroJapanTextData_Page6 
    JSR.W LoadJapanTextIntroTiles 
    JSR.W TransferJapanTextTilesToVRAM 
    PLY 
    RTS 


Instruction_EnableCinematicBGTilemapUpdates_duplicate_again:
    JSL.L Enable_CinematicBGTilemap_Updates 
    RTS 


RTS_BackgroundFLickeringEffect:
    RTS 

    LDA.W $05B6 
    BIT.W #$0001 
    BEQ .enableBG2 
    SEP #$20 
    LDA.B $69 
    AND.B #$FD 
    STA.B $69 
    REP #$20 
    RTS 


.enableBG2:
    SEP #$20 
    LDA.B $69 
    ORA.B #$02 
    STA.B $69 
    REP #$20 
    RTS 


CinematicFunction_Intro_Finish:
    JSL.L HandleFadingOut 
    SEP #$20 
    LDA.B $51 
    CMP.B #$80 
    BNE .return 
    JSL.L EnableNMI 
    REP #$20 
    STZ.W $0723 
    STZ.W $0725 
    STZ.B $B5 
    STZ.B $B9 
    STZ.B $B7 
    STZ.B $BB 
    STZ.W $198D 
    LDA.W #$1C1F 
    DEC A 
    DEC A 
    SEC 
    SBC.W #$198D 
    TAX 

.loop:
    STZ.W $198D,X 
    DEX 
    DEX 
    BPL .loop 
    LDA.W #CinematicFunction_FlyToCeres_Initial 
    STA.W $1F51 
    JSR.W Recover_Previous_Button_Assignments 
    STZ.W $09C8 
    STZ.W $09C6 

.return:
    RTS 


InitFunction_CinematicSpriteObject_IntroMotherBrain:
    LDA.W #$0038 
    STA.W $1A7D,Y 
    LDA.W #$006F 
    STA.W $1A9D,Y 
    LDA.W #$0E00 
    STA.W $1ABD,Y 
    RTS 


PreInstruction_CinematicSpriteObject_IntroMotherBrain:
    JSR.W IntroMotherBrain_HurtFlashHandling 
    LDY.W #$0008 

.loop:
    LDA.W $0C18,Y 
    AND.W #$0FFF 
    CMP.W #$0100 
    BEQ .missile 
    DEY 
    DEY 
    BPL .loop 
    RTS 


.missile:
    LDA.W $0B64,Y 
    CMP.W #$0054 
    BPL .return 
    PHX 
    TYX 
    JSL.L Kill_Projectile 
    PLX 
    LDA.W #$0008 
    STA.W $1ADD,X 
    LDA.W $1B7D,X 
    INC A 
    STA.W $1B7D,X 
    CMP.W #$0004 
    BNE .return 
    STZ.W $1B7D,X 
    LDA.W #PreInstruction_IntroMotherBrain_Exploding 
    STA.W $1B3D,X 
    LDA.W #$0000 
    LDY.W #CinematicSpriteObjectDefs_IntroMotherBrainExplosion_Small 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDA.W #$0001 
    LDY.W #CinematicSpriteObjectDefs_IntroMotherBrainExplosion_Small 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDA.W #$0002 
    LDY.W #CinematicSpriteObjectDefs_IntroMotherBrainExplosion_Small 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDA.W #$0000 
    LDY.W #CinematicSpriteObjectDefs_IntroMotherBrainExplosion_Big 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDA.W #$0001 
    LDY.W #CinematicSpriteObjectDefs_IntroMotherBrainExplosion_Big 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDA.W #$0002 
    LDY.W #CinematicSpriteObjectDefs_IntroMotherBrainExplosion_Big 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDA.W #$0003 
    LDY.W #CinematicSpriteObjectDefs_IntroMotherBrainExplosion_Big 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDA.W #$0004 
    LDY.W #CinematicSpriteObjectDefs_IntroMotherBrainExplosion_Big 
    JSR.W Spawn_CinematicSpriteObject_Y 

.return:
    RTS 


PreInstruction_IntroMotherBrain_Exploding:
    JSR.W IntroMotherBrain_HurtFlashHandling 
    JSR.W IntroMotherBrain_ScreenShaking 
    LDA.W $1B7D,X 
    INC A 
    STA.W $1B7D,X 
    CMP.W #$0080 
    BMI .return 
    LDA.W #$0001 
    STA.W $1B5D,X 
    LDA.W #InstList_IntroMotherBrain_StartPage2_0 
    STA.W $1B1D,X 

.return:
    RTS 


PreInstruction_IntroMotherBrain_CrossFading:
    JSR.W IntroMotherBrain_ScreenShaking 
    LDA.W $1A4B 
    BNE .return 
    LDA.W #$0001 
    STA.W $1B5D,X 
    LDA.W #InstList_CinematicSpriteObject_Delete 
    STA.W $1B1D,X 
    STZ.W $1A57 

.return:
    RTS 


IntroMotherBrain_HurtFlashHandling:
    LDA.W $1ADD,X 
    BEQ .return 
    BIT.W #$0001 
    BNE + 
    PHX 
    LDX.W #$001E 
    LDA.W #$7FFF 

.loopWhitePalette:
    STA.L $7EC1E0,X 
    DEX 
    DEX 
    BPL .loopWhitePalette 
    PLX 
    BRA .decFlashTimer 


  + PHX 
    LDX.W #$001E 

.loopPalette:
    LDA.L Palettes_Intro_MotherBrain,X 
    STA.L $7EC1E0,X 
    DEX 
    DEX 
    BPL .loopPalette 
    PLX 

.decFlashTimer:
    DEC.W $1ADD,X 

.return:
    RTS 


IntroMotherBrain_ScreenShaking:
    LDA.W $1A51 
    BIT.W #$0001 
    BNE .subtract4 
    LDA.W $1997 
    CLC 
    ADC.W #$0004 
    STA.W $1997 
    BRA .return 


.subtract4:
    LDA.W $1997 
    SEC 
    SBC.W #$0004 
    STA.W $1997 

.return:
    RTS 


InitFunction_CinematicSpriteObject_IntroRinka:
    LDA.W $1B9D 
    STA.W $1B7D,Y 
    ASL A 
    TAX 
    LDA.W .Xposition,X 
    STA.W $1A7D,Y 
    LDA.W .Yposition,X 
    SEC 
    SBC.W #$0008 
    STA.W $1A9D,Y 
    LDA.W #$0E00 
    STA.W $1ABD,Y 
    RTS 


.Xposition:
    db $70,$00,$C0,$00,$80,$00,$E8,$00 

.Yposition:
    db $50,$00,$40,$00,$38,$00,$58,$00 

Instruction_StartMoving_IntroRinka:
    LDA.W $1B7D,X 
    BNE .missesSamus 
    LDA.W #PreInstruction_IntroRinka_Moving_HitsSamus 
    STA.W $1B3D,X 
    RTS 


.missesSamus:
    LDA.W #PreInstruction_IntroRinka_Moving_MissesSamus 
    STA.W $1B3D,X 
    RTS 


PreInstruction_IntroRinka_Moving_HitsSamus:
    LDA.W $1ADD,X 
    CLC 
    ADC.W #$8000 
    STA.W $1ADD,X 
    LDA.W $1A7D,X 
    ADC.W #$0000 
    STA.W $1A7D,X 
    LDA.W $1AFD,X 
    CLC 
    ADC.W #$8000 
    STA.W $1AFD,X 
    LDA.W $1A9D,X 
    ADC.W #$0000 
    STA.W $1A9D,X 
    LDA.W $0AF6 
    SEC 
    SBC.W #$0005 
    STA.B $12 
    LDA.W $1A7D,X 
    CLC 
    ADC.W #$0008 
    CMP.B $12 
    BMI .exploding 
    LDA.W #$000B 
    STA.W $18A8 
    LDA.W #$000B 
    STA.W $18AA 
    LDA.W #$0001 
    STA.W $0A54 
    BRA .delete 


.exploding:
    LDA.W $1B3D 
    CMP.W #PreInstruction_IntroMotherBrain_Exploding 
    BNE .return 

.delete:
    LDA.W #$0001 
    STA.W $1B5D,X 
    LDA.W #InstList_CinematicSpriteObject_Delete 
    STA.W $1B1D,X 

.return:
    RTS 


PreInstruction_IntroRinka_Moving_MissesSamus:
    LDA.W $1B7D,X 
    ASL A 
    TAY 
    LDA.W $1ADD,X 
    CLC 
    ADC.W #$8000 
    STA.W $1ADD,X 
    LDA.W $1A7D,X 
    ADC.W .Xvelocities,Y 
    STA.W $1A7D,X 
    LDA.W $1AFD,X 
    CLC 
    ADC.W #$8000 
    STA.W $1AFD,X 
    LDA.W $1A9D,X 
    ADC.W #$0000 
    STA.W $1A9D,X 
    CMP.W #$0010 
    BMI .delete 
    CMP.W #$00D0 
    BPL .delete 
    LDA.W $1B3D 
    CMP.W #PreInstruction_IntroMotherBrain_Exploding 
    BNE .return 

.delete:
    LDA.W #$0001 
    STA.W $1B5D,X 
    LDA.W #InstList_CinematicSpriteObject_Delete 
    STA.W $1B1D,X 

.return:
    RTS 


.Xvelocities:
    dw $0000,$FFFF,$0000,$FFFF 

InitFunc_CinematicSpriteObject_IntroMotherBrainExplosion_Big:
    LDA.W $1B9D 
    STA.W $1B7D,Y 
    ASL A 
    TAX 
    LDA.W #$0038 
    CLC 
    ADC.W .Xposition,X 
    STA.W $1A7D,Y 
    LDA.W #$006F 
    CLC 
    ADC.W .Yposition,X 
    STA.W $1A9D,Y 
    LDA.W .instructionTimer,X 
    STA.W $1B5D,Y 
    LDA.W #$0A00 
    STA.W $1ABD,Y 
    RTS 


.Xposition:
    dw $0000,$0010,$FFF0,$FFF8,$0008 

.Yposition:
    dw $0000,$FFF0,$0008,$FFF0,$0008 

.instructionTimer:
    dw $0001,$0010,$0020,$0030,$0040 

InitFunc_CineSpriteObject_IntroMotherBrainExplosion_Small:
    LDA.W $1B9D 
    STA.W $1B7D,Y 
    ASL A 
    TAX 
    LDA.W #$0038 
    CLC 
    ADC.W .Xposition,X 
    STA.W $1A7D,Y 
    LDA.W #$006F 
    CLC 
    ADC.W .Yposition,X 
    STA.W $1A9D,Y 
    LDA.W .instructionTimer,X 
    STA.W $1B5D,Y 
    LDA.W #$0A00 
    STA.W $1ABD,Y 
    RTS 


.Xposition:
    db $10,$00,$F0,$FF,$F0,$FF 

.Yposition:
    db $00,$00,$04,$00,$F8,$FF 

.instructionTimer:
    db $01,$00,$08,$00,$10,$00 

PreInst_CinematicSpriteObject_IntroMotherBrainExplosion:
    LDA.W $1A4B 
    BNE .return 
    LDA.W #$0001 
    STA.W $1B5D,X 
    LDA.W #InstList_CinematicSpriteObject_Delete 
    STA.W $1B1D,X 

.return:
    RTS 


Instruction_Spawn_IntroRinkas_0_1:
    PHY 
    LDA.W #$0000 
    LDY.W #CinematicSpriteObjectDefinitions_IntroRinka 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDA.W #$0001 
    LDY.W #CinematicSpriteObjectDefinitions_IntroRinka 
    JSR.W Spawn_CinematicSpriteObject_Y 
    PLY 
    RTS 


Instruction_Spawn_IntroRinkas_2_3:
    PHY 
    LDA.W #$0002 
    LDY.W #CinematicSpriteObjectDefinitions_IntroRinka 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDA.W #$0003 
    LDY.W #CinematicSpriteObjectDefinitions_IntroRinka 
    JSR.W Spawn_CinematicSpriteObject_Y 
    PLY 
    RTS 


InitFunction_CinematicSpriteObject_ConfusedBabyMetroid:
    LDA.W #$0070 
    STA.W $1A7D,Y 
    LDA.W #$009B 
    STA.W $1A9D,Y 
    LDA.W #$0E00 
    STA.W $1ABD,Y 
    RTS 


PreInstruction_CinematicSpriteObject_ConfusedBabyMetroid:
    LDA.W $1B1F,X 
    CMP.W #InstList_MetroidEggHatching_2 
    BMI .return 
    LDA.W #PreInstruction_ConfusedBabyMetroid_Hatched 
    STA.W $1B3D,X 
    STZ.W $1A4D 
    STZ.W $1A4F 

.return:
    RTS 


PreInstruction_ConfusedBabyMetroid_Hatched:
    LDA.W $1A9D,X 
    CMP.W #$0091 
    BNE + 
    LDA.W #$0000 
    LDY.W #CinematicSpriteObjectDefinitions_MetroidEggSlimeDrops 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDA.W #$0001 
    LDY.W #CinematicSpriteObjectDefinitions_MetroidEggSlimeDrops 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDA.W #$0002 
    LDY.W #CinematicSpriteObjectDefinitions_MetroidEggSlimeDrops 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDA.W #$0003 
    LDY.W #CinematicSpriteObjectDefinitions_MetroidEggSlimeDrops 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDA.W #$0023 
    JSL.L QueueSound_Lib3_Max6 

  + LDA.W $0AFA 
    SEC 
    SBC.W #$0020 
    CMP.W $1A9D,X 
    BMI + 
    LDA.W $1A4F 
    CMP.W #$0220 
    BPL .setYVelocity 
    CLC 
    ADC.W #$0020 
    STA.W $1A4F 
    BRA .setYVelocity 


  + LDA.W $1A4F 
    CMP.W #$FDE1 
    BMI .setYVelocity 
    SEC 
    SBC.W #$0020 
    STA.W $1A4F 

.setYVelocity:
    LDA.W $1A4F 
    XBA 
    PHA 
    AND.W #$FF00 
    STA.B $14 
    PLA 
    AND.W #$00FF 
    BIT.W #$0080 
    BEQ + 
    ORA.W #$FF00 

  + STA.B $12 
    LDA.W $1AFD,X 
    CLC 
    ADC.B $14 
    STA.W $1AFD,X 
    LDA.W $1A9D,X 
    ADC.B $12 
    STA.W $1A9D,X 
    LDA.W $1A4F 
    BMI .return 
    LDA.W #$0080 
    STA.W $1A4D 
    LDA.W #PreInstruction_ConfusedBabyMetroid_Idling 
    STA.W $1B3D,X 

.return:
    RTS 


PreInstruction_ConfusedBabyMetroid_Idling:
    DEC.W $1A4D 
    BEQ .timerExpired 
    BPL .return 

.timerExpired:
    LDA.W #PreInstruction_ConfusedBabyMetroid_Dancing 
    STA.W $1B3D,X 
    STZ.W $1A4D 
    STZ.W $1A4F 
    STZ.W $1B7D,X 

.return:
    RTS 


PreInstruction_ConfusedBabyMetroid_Dancing:
    LDA.W $1A4B 
    BNE .timerExpired 
    LDA.W #$0001 
    STA.W $1B5D,X 
    LDA.W #InstList_CinematicSpriteObject_Delete 
    STA.W $1B1D,X 
    STZ.W $1A57 
    RTS 


.timerExpired:
    LDA.W $1B7D,X 
    CMP.W #$0080 
    BPL + 
    INC A 
    STA.W $1B7D,X 
    BIT.W #$003F 
    BNE + 
    LDA.W #$0023 
    JSL.L QueueSound_Lib3_Max6 

  + LDA.W $0AF6 
    CMP.W $1A7D,X 
    BMI .checkXposition 
    LDA.W $1A4D 
    CMP.W #$0280 
    BPL + 
    CLC 
    ADC.W #$0020 
    STA.W $1A4D 
    BRA + 


.checkXposition:
    LDA.W $1A4D 
    CMP.W #$FD81 
    BMI + 
    SEC 
    SBC.W #$0020 
    STA.W $1A4D 

  + LDA.W $1A4D 
    XBA 
    PHA 
    AND.W #$FF00 
    STA.B $14 
    PLA 
    AND.W #$00FF 
    BIT.W #$0080 
    BEQ + 
    ORA.W #$FF00 

  + STA.B $12 
    BPL .positive 
    LDA.W #$0001 
    STA.W $1A57 
    BRA .setXposition 


.positive:
    LDA.W #$FFFF 
    STA.W $1A57 

.setXposition:
    LDA.W $1ADD,X 
    CLC 
    ADC.B $14 
    STA.W $1ADD,X 
    LDA.W $1A7D,X 
    ADC.B $12 
    STA.W $1A7D,X 
    LDA.W $0AFA 
    SEC 
    SBC.W #$0008 
    CMP.W $1A9D,X 
    BMI .checkY 
    LDA.W $1A4F 
    CMP.W #$0220 
    BPL .setYvelocity 
    CLC 
    ADC.W #$0020 
    STA.W $1A4F 
    BRA .setYvelocity 


.checkY:
    LDA.W $1A4F 
    CMP.W #$FDE1 
    BMI .setYvelocity 
    SEC 
    SBC.W #$0020 
    STA.W $1A4F 

.setYvelocity:
    LDA.W $1A4F 
    XBA 
    PHA 
    AND.W #$FF00 
    STA.B $14 
    PLA 
    AND.W #$00FF 
    BIT.W #$0080 
    BEQ .setYposition 
    ORA.W #$FF00 

.setYposition:
    STA.B $12 
    LDA.W $1AFD,X 
    CLC 
    ADC.B $14 
    STA.W $1AFD,X 
    LDA.W $1A9D,X 
    ADC.B $12 
    STA.W $1A9D,X 
    RTS 


Reset_Button_Assignments_to_Default:
    LDA.W #$0800 
    STA.W $09AA 
    LDA.W #$0400 
    STA.W $09AC 
    LDA.W #$0200 
    STA.W $09AE 
    LDA.W #$0100 
    STA.W $09B0 
    LDA.W $09B2 
    STA.W $0D82 
    LDA.W $09B4 
    STA.W $0D84 
    LDA.W $09B6 
    STA.W $0D86 
    LDA.W $09B8 
    STA.W $0D88 
    LDA.W $09BA 
    STA.W $0D8A 
    LDA.W $09BC 
    STA.W $0D8C 
    LDA.W $09BE 
    STA.W $0D8E 
    LDA.W #$0040 
    STA.W $09B2 
    LDA.W #$0080 
    STA.W $09B4 
    LDA.W #$8000 
    STA.W $09B6 
    LDA.W #$4000 
    STA.W $09B8 
    LDA.W #$2000 
    STA.W $09BA 
    LDA.W #$0020 
    STA.W $09BC 
    LDA.W #$0010 
    STA.W $09BE 
    RTS 


Recover_Previous_Button_Assignments:
    LDA.W $0D82 
    STA.W $09B2 
    LDA.W $0D84 
    STA.W $09B4 
    LDA.W $0D86 
    STA.W $09B6 
    LDA.W $0D88 
    STA.W $09B8 
    LDA.W $0D8A 
    STA.W $09BA 
    LDA.W $0D8C 
    STA.W $09BC 
    LDA.W $0D8E 
    STA.W $09BE 
    RTS 


CinematicFunction_FlyToCeres_Initial:
    JSR.W Setup_PPU_CeresCutscene 
    JSR.W Clear_CinematicSpriteObjects 
    STZ.B $AB 
    STZ.B $A7 
    LDX.W #$0000 

.loopPalettes:
    LDA.L Palettes_SpaceGunshipCeres,X 
    STA.L $7EC000,X 
    INX 
    INX 
    CPX.W #$0200 
    BMI .loopPalettes 
    LDA.W #Tiles_Gunship_Ceres_Mode7>>8&$FF00 
    STA.B $48 
    LDA.W #Tiles_Gunship_Ceres_Mode7 
    STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7F0000 
    LDA.W #Gunship_Ceres_Tilemap>>8&$FF00 
    STA.B $48 
    LDA.W #Gunship_Ceres_Tilemap 
    STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7F4000 
    LDA.W #Tiles_Space_Ceres>>8&$FF00 
    STA.B $48 
    LDA.W #Tiles_Space_Ceres 
    STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7F5000 
    SEP #$30 
    LDA.B #$00 
    STA.W $2116 
    LDA.B #$00 
    STA.W $2117 
    LDA.B #$80 
    STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$00,$19 
    dl $7F0000 
    dw $4000 
    LDA.B #$02 
    STA.W $420B 
    REP #$10 
    STZ.W $2115 
    STZ.W $2116 
    STZ.W $2117 
    LDX.W #$4000 
    LDA.B #$8C 

.loop:
    STA.W $2118 
    DEX 
    BNE .loop 
    SEP #$10 
    LDA.B #$00 
    STA.W $2116 
    LDA.B #$00 
    STA.W $2117 
    LDA.B #$00 
    STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$00,$18 
    dl $7F4000 
    dw $0300 
    LDA.B #$02 
    STA.W $420B 
    LDA.B #$00 
    STA.W $2116 
    LDA.B #$60 
    STA.W $2117 
    LDA.B #$80 
    STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl $7F5000 
    dw $4000 
    LDA.B #$02 
    STA.W $420B 
    REP #$30 
    LDA.W #$0100 
    STA.W $211B 
    STA.B $78 
    STZ.W $211C 
    STZ.B $7A 
    STZ.W $211D 
    STZ.B $7C 
    STA.W $211E 
    STA.B $7E 
    LDA.W #$0038 
    STA.W $211F 
    STA.B $80 
    LDA.W #$0018 
    STA.W $2120 
    STA.B $82 
    LDA.W #$FFB8 
    STA.W $1993 
    LDA.W #$FF98 
    STA.W $1997 
    LDA.W #$00E0 
    STA.W $198D 
    LDA.W #$0200 
    STA.W $198F 
    JSL.L Clear_PaletteFXObjects 
    JSL.L Enable_PaletteFXObjects 
    LDA.W #$0000 
    JSL.L Clear_CinematicBGObjects_CinematicBGTilemap 
    LDA.W #$5C00 
    STA.W $19F5 
    JSL.L EnableNMI 
    LDY.W #CinematicSpriteObjectDefinitions_CeresStars 
    LDA.W #$0000 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDA.W #CinematicFunction_FlyToCeres_WaitForMusicQueue_EnableDisplay 
    STA.W $1F51 
    LDA.W #$FF2D 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    LDA.W #$0005 
    LDY.W #$000E 
    JSL.L QueueMusicDataOrTrack_YFrameDelay 
    RTS 


CinematicFunction_FlyToCeres_WaitForMusicQueue_EnableDisplay:
    JSL.L CheckIfMusicIsQueued 
    BCS .return 
    SEP #$20 
    LDA.B #$0F 
    STA.B $51 
    REP #$20 
    LDA.W #CinematicFunction_FlyToCeres_FlyingIntoCamera 
    STA.W $1F51 

.return:
    RTS 


CinematicFunction_FlyToCeres_FlyingIntoCamera:
    LDA.W $198F 
    CMP.W #$0020 
    BMI .zoomLessThan20 
    SEC 
    SBC.W #$0010 
    STA.W $198F 
    RTS 


.zoomLessThan20:
    SEP #$20 
    STZ.B $6F 
    LDA.B #$31 
    STA.B $72 
    LDA.B #$3F 
    STA.B $74 
    LDA.B #$5F 
    STA.B $75 
    LDA.B #$9F 
    STA.B $76 
    REP #$20 
    JSR.W Clear_CinematicSpriteObjects 
    LDX.W #.transferData 
    JSL.L QueueMode7Transfers 
    LDA.W #$FFE0 
    STA.W $1993 
    LDA.W #$FF80 
    STA.W $1997 
    LDA.W #$0020 
    STA.W $198D 
    LDY.W #CinematicSpriteObjectDefs_CeresExplosionLargeAsteroids 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDY.W #CinematicSpriteObjectDefinitions_CeresUnderAttack 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDY.W #CinematicSpriteObjectDefinitions_CeresSmallAsteroids 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDY.W #CinematicSpriteObjectDefinitions_CeresPurpleSpaceVortex 
    LDA.W #$0001 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDY.W #CinematicSpriteObjectDefinitions_CeresStars 
    LDA.W #$0001 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDA.W #CinematicFunction_FlyToCeres_FlyingIntoCeres 
    STA.W $1F51 
    LDY.W #PaletteFXObjects_CutsceneGunshipEngineFlicker 
    JSL.L Spawn_PaletteFXObject 
    LDY.W #PaletteFXObjects_CutsceneCeresNavigationLights_SpriteCeres 
    JSL.L Spawn_PaletteFXObject 
    RTS 


.transferData:
    db $80 ; Control. 80h = write to VRAM tilemap
    dl $7F4300 ; Source address
    dw $0300,$0000 ; Size, Destination address (VRAM)
    db $00, $00 ; VRAM address increment mode

InitFunction_CinematicSpriteObject_CeresStars:
    LDA.W $1B9D 
    BNE .nonZero 
    LDA.W #$FC00 
    STA.W $1B7D,Y 
    LDA.W #$0070 
    STA.W $1A7D,Y 
    LDA.W #$0057 
    STA.W $1A9D,Y 
    LDA.W #$0800 
    STA.W $1ABD,Y 
    RTS 


.nonZero:
    LDA.W #PreInstruction_CinematicSpriteObject_CeresPurpleSpaceVortex 
    STA.W $1B3D,Y 
    LDA.W #$FFE0 
    STA.W $1A7D,Y 
    LDA.W #$0057 
    STA.W $1A9D,Y 
    LDA.W #$0800 
    STA.W $1ABD,Y 
    RTS 


PreInstruction_CinematicSpriteObject_CeresStars:
    LDA.W $1F51 
    CMP.W #CinematicFunction_FlyToCeres_FlyingIntoCamera 
    BEQ .flyingIntoCamera 
    RTS 


.flyingIntoCamera:
    LDA.W $1B7D,X 
    CLC 
    ADC.W #$0080 
    STA.W $1B7D,X 
    XBA 
    PHA 
    AND.W #$FF00 
    STA.B $14 
    PLA 
    AND.W #$00FF 
    BIT.W #$0080 
    BEQ + 
    ORA.W #$FF00 

  + STA.B $12 
    LDA.W $1AFD,X 
    CLC 
    ADC.B $14 
    STA.W $1AFD,X 
    LDA.W $1A9D,X 
    ADC.B $12 
    STA.W $1A9D,X 
    LDA.W $1ADD,X 
    CLC 
    ADC.B $14 
    STA.W $1ADD,X 
    LDA.W $1A7D,X 
    ADC.B $12 
    STA.W $1A7D,X 
    LDA.W $1991 
    CLC 
    ADC.B $14 
    STA.W $1991 
    LDA.W $1993 
    ADC.B $12 
    STA.W $1993 
    LDA.W $1995 
    CLC 
    ADC.B $14 
    STA.W $1995 
    LDA.W $1997 
    ADC.B $12 
    STA.W $1997 
    RTS 


InitFunc_CinematicSpriteObject_CeresExplosionLargeAsteroids:
    LDA.W #$0050 
    STA.W $1A7D,Y 
    LDA.W #$009F 
    STA.W $1A9D,Y 
    LDA.W #$0800 
    STA.W $1ABD,Y 
    RTS 


PreInst_CinematicSpriteObject_CeresExplosionLargeAsteroids:
    LDA.W $1ADD,X 
    CLC 
    ADC.W #$4000 
    STA.W $1ADD,X 
    LDA.W $1A7D,X 
    ADC.W #$0000 
    AND.W #$01FF 
    STA.W $1A7D,X 
    RTS 


InitFunction_CinematicSpriteObject_CeresUnderAttack:
    LDA.W #$0074 
    STA.W $1A7D,Y 
    LDA.W #$00A0 
    STA.W $1A9D,Y 
    LDA.W #$0C00 
    STA.W $1ABD,Y 
    RTS 


PreInstruction_CinematicSpriteObject_CeresUnderAttack:
    LDA.W $1ADD,X 
    CLC 
    ADC.W #$1000 
    STA.W $1ADD,X 
    LDA.W $1A7D,X 
    ADC.W #$0000 
    AND.W #$01FF 
    STA.W $1A7D,X 
    RTS 


InitFunction_CinematicSpriteObject_CeresSmallAsteroid:
    LDA.W #$0080 
    STA.W $1A7D,Y 
    LDA.W #$0060 
    STA.W $1A9D,Y 
    LDA.W #$0800 
    STA.W $1ABD,Y 
    RTS 


PreInstruction_CinematicSpriteObject_CeresSmallAsteroid:
    LDA.W $1ADD,X 
    CLC 
    ADC.W #$0800 
    STA.W $1ADD,X 
    LDA.W $1A7D,X 
    ADC.W #$0000 
    AND.W #$01FF 
    STA.W $1A7D,X 
    RTS 


InitFunction_CinematicSpriteObject_CeresPurpleSpaceVortex:
    LDA.W $1B9D 
    BNE .nonZero 
    LDA.W #$0070 
    STA.W $1A7D,Y 
    LDA.W #RTS_8BBFD9 
    STA.W $1B3D,Y 
    BRA + 


.nonZero:
    LDA.W #$00E0 
    STA.W $1A7D,Y 

  + LDA.W #$0057 
    STA.W $1A9D,Y 
    LDA.W #$0800 
    STA.W $1ABD,Y 
    RTS 


PreInstruction_CinematicSpriteObject_CeresPurpleSpaceVortex:
    LDA.W $1ADD,X 
    SEC 
    SBC.W #$2000 
    STA.W $1ADD,X 
    LDA.W $1A7D,X 
    SBC.W #$0000 
    STA.W $1A7D,X 

RTS_8BBFD9:
    RTS 


CinematicFunction_FlyToCeres_FlyingIntoCeres:
    SEP #$20 
    LDA.B $74 
    SEC 
    SBC.B #$01 
    STA.B $74 
    CMP.B #$20 
    BPL .color1 
    LDA.B #$20 
    STA.B $74 

.color1:
    LDA.B $75 
    SEC 
    SBC.B #$01 
    STA.B $75 
    CMP.B #$40 
    BPL .color2 
    LDA.B #$40 
    STA.B $75 

.color2:
    LDA.B $76 
    SEC 
    SBC.B #$01 
    STA.B $76 
    CMP.B #$80 
    BPL .zoomLessThanC00 
    LDA.B #$80 
    STA.B $76 

.zoomLessThanC00:
    REP #$20 
    LDA.W $1991 
    SEC 
    SBC.W #$2000 
    STA.W $1991 
    LDA.W $1993 
    SBC.W #$0000 
    STA.W $1993 
    LDA.W $198F 
    CMP.W #$0C00 
    BPL .zoomLessThan2000 
    CLC 
    ADC.W #$0010 
    STA.W $198F 
    RTS 


.zoomLessThan2000:
    LDA.W $198F 
    CMP.W #$2000 
    BPL + 
    CLC 
    ADC.W #$0020 
    STA.W $198F 
    RTS 


  + SEP #$20 
    LDA.B #$11 
    STA.B $69 
    LDA.B #$01 
    STA.B $55 
    LDA.B #$00 
    STA.B $5F 
    LDA.B #$5C 
    STA.B $58 
    LDA.B #$06 
    STA.B $5D 
    REP #$20 
    LDA.W #$0100 
    STA.W $198F 
    STZ.W $198D 
    STZ.W $1991 
    STZ.W $1993 
    STZ.W $1995 
    STZ.W $1997 
    JSL.L Enable_CinematicBGObjects 
    JSL.L Enable_CinematicBGTilemap_Updates 
    LDY.W #CinematicSpriteObjectDefinitions_SpaceColony 
    LDA.W #$5C00 
    JSR.W Spawn_CinematicBGObject 
    LDA.W #RTS_8BA38F 
    STA.W $1F51 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_InitFunc_CinematicSpriteObject_SpaceColonyText_8BC083:
    LDA.W #$007C 
    STA.W $1A7D,Y 
    LDA.W #$00BA 
    STA.W $1A9D,Y 
    LDA.W #$0000 
    STA.W $1ABD,Y 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_SkipNextInstructionIfEnglishText:
    LDA.W $09E2 
    BNE .return 
    TYA 
    CLC 
    ADC.W #$0006 
    TAY 

.return:
    RTS 


Instruction_FinishFlyToCeres:
    LDA.W #CinematicFunction_FlyToCeres_Finish 
    STA.W $1F51 
    LDA.W #$0001 
    STA.W $0723 
    STA.W $0725 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_InitFunc_CineSpriteObject_SpaceColonyJapanText_8BC0B2:
    LDA.W #$007C 
    STA.W $1A7D,Y 
    LDA.W #$00CC 
    STA.W $1A9D,Y 
    LDA.W #$0000 
    STA.W $1ABD,Y 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


CinematicFunction_FlyToCeres_Finish:
    JSL.L HandleFadingOut 
    SEP #$20 
    LDA.B $51 
    CMP.B #$80 
    BNE .return 
    JSL.L EnableNMI 
    REP #$20 
    STZ.W $0723 
    STZ.W $0725 
    STZ.B $B5 
    STZ.B $B9 
    STZ.B $B7 
    STZ.B $BB 
    STZ.W $198D 
    LDA.W #$1C1F 
    DEC A 
    DEC A 
    SEC 
    SBC.W #$198D 
    TAX 

.loop:
    STZ.W $198D,X 
    DEX 
    DEX 
    BPL .loop 
    LDA.W #CinematicFunction_FlyToCeres_StartGameAtCeres 
    STA.W $1F51 

.return:
    RTS 


CinematicFunction_FlyToCeres_StartGameAtCeres:
    LDA.W #$001F 
    STA.L $7ED914 
    STA.W $0998 
    LDA.W #$0006 
    STA.W $079F 
    STZ.W $078B 
    LDA.W $0952 
    JSL.L SaveToSRAM 
    RTS 


CinematicFunction_CeresGoesBoom_Initial:
    LDX.W #$0008 

.wait:
    JSL.L WaitForNMI 
    DEX 
    BPL .wait 
    JSR.W Setup_PPU_CeresCutscene 
    LDA.W #$1C1F 
    DEC A 
    DEC A 
    SEC 
    SBC.W #$198D 
    TAX 

.loop:
    STZ.W $198D,X 
    DEX 
    DEX 
    BPL .loop 
    STZ.W $078D 
    STZ.W $0911 
    STZ.W $0915 
    LDX.W #$0000 

.loopPalettes:
    LDA.L Palettes_SpaceGunshipCeres,X 
    STA.L $7EC000,X 
    INX 
    INX 
    CPX.W #$0200 
    BMI .loopPalettes 
    LDA.W #Tiles_Gunship_Ceres_Mode7>>8&$FF00 
    STA.B $48 
    LDA.W #Tiles_Gunship_Ceres_Mode7 
    STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7F0000 
    LDA.W #Gunship_Ceres_Tilemap>>8&$FF00 
    STA.B $48 
    LDA.W #Gunship_Ceres_Tilemap 
    STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7F4000 
    LDA.W #Tiles_Space_Ceres>>8&$FF00 
    STA.B $48 
    LDA.W #Tiles_Space_Ceres 
    STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7F5000 
    SEP #$30 
    LDA.B #$00 
    STA.W $2116 
    LDA.B #$00 
    STA.W $2117 
    LDA.B #$80 
    STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$00,$19 
    dl $7F0000 
    dw $4000 
    LDA.B #$02 
    STA.W $420B 
    REP #$10 
    STZ.W $2115 
    STZ.W $2116 
    STZ.W $2117 
    LDX.W #$4000 
    LDA.B #$8C 

.loopVRAM:
    STA.W $2118 
    DEX 
    BNE .loopVRAM 
    SEP #$10 
    LDA.B #$00 
    STA.W $2116 
    LDA.B #$00 
    STA.W $2117 
    LDA.B #$00 
    STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$00,$18 
    dl $7F4600 
    dw $0600 
    LDA.B #$02 
    STA.W $420B 
    LDA.B #$00 
    STA.W $2116 
    LDA.B #$60 
    STA.W $2117 
    LDA.B #$80 
    STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl $7F5000 
    dw $4000 
    LDA.B #$02 
    STA.W $420B 
    LDA.B #$00 
    STA.W $2116 
    LDA.B #$60 
    STA.W $2117 
    LDA.B #$80 
    STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl Tiles_Standard_Sprite_0 
    dw $1A00 
    LDA.B #$02 
    STA.W $420B 
    REP #$30 
    LDA.W #$0100 
    STA.W $211B 
    STA.B $78 
    STZ.W $211C 
    STZ.B $7A 
    STZ.W $211D 
    STZ.B $7C 
    STA.W $211E 
    STA.B $7E 
    LDA.W #$0034 
    STA.W $211F 
    STA.B $80 
    LDA.W #$0030 
    STA.W $2120 
    STA.B $82 
    LDA.W #$FFD4 
    STA.W $1993 
    LDA.W #$FF90 
    STA.W $1997 
    STZ.W $198D 
    LDA.W #$0100 
    STA.W $198F 
    JSL.L Disable_HDMAObjects 
    JSL.L Wait_End_VBlank_Clear_HDMA 
    JSL.L Clear_PaletteFXObjects 
    JSL.L Enable_PaletteFXObjects 
    LDA.W #$002F 
    JSL.L Clear_CinematicBGObjects_CinematicBGTilemap 
    LDA.W #$0000 
    STA.W $19F5 
    LDY.W #CinematicSpriteObjectDefs_CeresUnderAttackLargeAsteroids 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDY.W #CinematicSpriteObjectDefinitions_CeresSmallAsteroids 
    LDA.W #$0002 
    STA.B $12 
    JSR.W Spawn_CinematicSpriteObject_YToIndex12 
    LDY.W #CinematicSpriteObjectDefinitions_CeresPurpleSpaceVortex 
    STZ.B $12 
    LDA.W #$0000 
    JSR.W Spawn_CinematicSpriteObject_YToIndex12 
    LDY.W #CinematicSpriteObjectDefinitions_CeresExplosionSpawner 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDY.W #PaletteFXObjects_CutsceneCeresNavigationLights_BGCeres 
    JSL.L Spawn_PaletteFXObject 
    JSL.L EnableNMI 
    LDA.W #$0001 
    STA.W $0723 
    STA.W $0725 
    LDA.W #CinematicFunction_CeresGoesBoom_WaitForMusicQueue 
    STA.W $1F51 
    LDA.W #$0000 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    LDA.W #$FF2D 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    LDA.W $0998 
    CMP.W #$0025 
    BNE .notState25 
    LDA.W #$0008 
    LDY.W #$000E 
    JSL.L QueueMusicDataOrTrack_YFrameDelay 
    RTS 


.notState25:
    LDA.W #$0007 
    LDY.W #$000E 
    JSL.L QueueMusicDataOrTrack_YFrameDelay 
    RTS 


CinematicFunction_CeresGoesBoom_WaitForMusicQueue:
    JSL.L CheckIfMusicIsQueued 
    BCS .return 
    LDA.W #CinematicFunction_CeresGoesBoom_SmallCeresExplosion_FadingIn 
    STA.W $1F51 

.return:
    RTS 


CinematicFunction_CeresGoesBoom_SmallCeresExplosion_FadingIn:
    LDA.W $1995 
    CLC 
    ADC.W #$1000 
    STA.W $1995 
    LDA.W $1997 
    ADC.W #$0000 
    STA.W $1997 
    LDA.W $1991 
    SEC 
    SBC.W #$4000 
    STA.W $1991 
    LDA.W $1993 
    SBC.W #$0000 
    STA.W $1993 
    LDA.W $198F 
    CLC 
    ADC.W #$0001 
    STA.W $198F 
    JSL.L HandleFadingIn 
    SEP #$20 
    LDA.B $51 
    CMP.B #$0F 
    BNE .return 
    REP #$20 
    STZ.W $0723 
    STZ.W $0725 
    LDA.W #CinematicFunction_CeresGoesBoom_CeresExplosions 
    STA.W $1F51 
    LDA.W #$0001 
    STA.W $1A49 
    STZ.W $1A4B 

.return:
    RTS 


CinematicFunction_CeresGoesBoom_CeresExplosions:
    LDA.W $1995 
    CLC 
    ADC.W #$1000 
    STA.W $1995 
    LDA.W $1997 
    ADC.W #$0000 
    STA.W $1997 
    LDA.W $1991 
    SEC 
    SBC.W #$4000 
    STA.W $1991 
    LDA.W $1993 
    SBC.W #$0000 
    STA.W $1993 
    LDA.W $198F 
    CMP.W #$0280 
    BPL + 
    CLC 
    ADC.W #$0001 
    STA.W $198F 
    RTS 


  + LDA.W $1993 
    EOR.W #$FFFF 
    INC A 
    CLC 
    ADC.B $80 
    STA.W $0CE2 
    LDA.W $1997 
    EOR.W #$FFFF 
    INC A 
    CLC 
    ADC.B $82 
    STA.W $0CE4 
    PHX 
    PHY 
    PHP 
    PHB 
    JSL.L Enable_HDMAObjects 
    JSL.L Spawn_PowerBombExplosion 
    PLB 
    PLP 
    PLY 
    PLX 
    SEP #$20 
    LDA.B #$10 
    STA.B $6F 
    LDA.B #$37 
    STA.B $72 
    REP #$20 
    LDA.W #$0300 
    STA.W $198F 
    LDA.W #$0000 
    LDY.W #CinematicSpriteObjectDefinitions_CeresFinalExplosion 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDA.W $0998 
    CMP.W #$0025 
    BNE .notState25 
    LDX.W #.mode7TransferData_clearCeresUpperHalf 
    JSL.L QueueMode7Transfers 
    BRA .clearCeresLowerHalf 


.notState25:
    LDX.W #.mode7TransferData_frontOfGunship 
    JSL.L QueueMode7Transfers 

.clearCeresLowerHalf:
    LDX.W #.mode7TransferData_clearCeresLowerHalf 
    JSL.L QueueMode7Transfers 
    LDA.W #CinematicFunction_CeresGoesBoom_GunshipFlyingAway 
    STA.W $1F51 
    RTS 


.mode7TransferData_frontOfGunship:
    db $80 ; Control. 80h = write to VRAM tilemap
    dl $7F4000 ; Source address
    dw $0300,$0000 ; Size, Destination address (VRAM)
    db $00, $00 ; VRAM address increment mode

.mode7TransferData_clearCeresLowerHalf:
    db $80 ; Control. 80h = write to VRAM tilemap
    dl $7F4C00 ; Source address
    dw $0300,$0300 ; Size, Destination address (VRAM)
    db $00, $00 ; VRAM address increment mode

.mode7TransferData_clearCeresUpperHalf:
    db $80 ; Control. 80h = write to VRAM tilemap
    dl $7F4C00 ; Source address
    dw $0300,$0000 ; Size, Destination address (VRAM)
    db $00, $00 ; VRAM address increment mode

Instruction_SpawnCeresExplosions1:
    PHY 
    LDA.W #$0000 
    LDY.W #CinematicSpriteObjectDefinitions_CeresExplosion1 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDA.W #$0001 
    LDY.W #CinematicSpriteObjectDefinitions_CeresExplosion1 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDA.W #$0002 
    LDY.W #CinematicSpriteObjectDefinitions_CeresExplosion1 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDA.W #$0003 
    LDY.W #CinematicSpriteObjectDefinitions_CeresExplosion1 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDA.W #$0004 
    LDY.W #CinematicSpriteObjectDefinitions_CeresExplosion1 
    JSR.W Spawn_CinematicSpriteObject_Y 
    PLY 
    RTS 


InitFunction_CinematicSpriteObject_CeresExplosion1:
    LDA.W $1B9D 
    STA.W $1B7D,Y 
    ASL A 
    TAX 
    LDA.W .timer,X 
    STA.W $1B5D,Y 
    LDA.W $1993 
    EOR.W #$FFFF 
    INC A 
    CLC 
    ADC.B $80 
    CLC 
    ADC.W .Xoffset,X 
    STA.W $1A7D,Y 
    LDA.W $1997 
    EOR.W #$FFFF 
    INC A 
    CLC 
    ADC.B $82 
    CLC 
    ADC.W .Yoffset,X 
    STA.W $1A9D,Y 
    LDA.W #$0A00 
    STA.W $1ABD,Y 
    RTS 

.timer:
    dw $0001,$0010,$0020,$0030,$0040 
.Xoffset:
    dw $0010,$FFF0,$0010,$FFF0,$0000 
.Yoffset:
    dw $FFF0,$0010,$0010,$FFF0,$0000 


PreInst_CeresExplosionSpawner_SpawnExplosion2EveryCFrames:
    LDA.W $1F51 
    CMP.W #CinematicFunction_CeresGoesBoom_GunshipFlyingAway 
    BNE .notGunshipFlyingAway 
    LDA.W #RTS_8B93D9 
    STA.W $1B3D,X 
    RTS 


.notGunshipFlyingAway:
    DEC.W $1A49 
    BEQ .spawn 
    BPL .return 

.spawn:
    LDA.W $1A4B 
    LDY.W #CinematicSpriteObjectDefinitions_CeresExplosion2 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDA.W #$000C 
    STA.W $1A49 
    LDA.W $1A4B 
    INC A 
    AND.W #$0007 
    STA.W $1A4B 

.return:
    RTS 


InitFunction_CinematicSpriteObject_CeresExplosion2:
    LDA.W $1B9D 
    STA.W $1B7D,Y 
    ASL #2
    TAX 
    LDA.W $1993 
    EOR.W #$FFFF 
    INC A 
    CLC 
    ADC.B $80 
    CLC 
    ADC.W .Xoffset,X 
    STA.W $1A7D,Y 
    LDA.W $1997 
    EOR.W #$FFFF 
    INC A 
    CLC 
    ADC.B $82 
    CLC 
    ADC.W .Yoffset,X 
    STA.W $1A9D,Y 
    LDA.W #$0A00 
    STA.W $1ABD,Y 
    RTS 

  .Xoffset
    dw $000E 
  .Yoffset
    dw       $FFF8 
    dw $0008,$000C
    dw $FFF0,$000C
    dw $FFF8,$FFF2
    dw $0000,$0000
    dw $0010,$000E
    dw $FFF4,$0004
    dw $FFF8,$FFF0


RTS_8BC50B:
    RTS 


Instruction_SpawnCeresExplosions3:
    PHY 
    LDA.W #$0000 
    LDY.W #CinematicSpriteObjectDefinitions_CeresExplosion3 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDA.W #$0001 
    LDY.W #CinematicSpriteObjectDefinitions_CeresExplosion3 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDA.W #$0002 
    LDY.W #CinematicSpriteObjectDefinitions_CeresExplosion3 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDA.W #$0003 
    LDY.W #CinematicSpriteObjectDefinitions_CeresExplosion3 
    JSR.W Spawn_CinematicSpriteObject_Y 
    PLY 
    RTS 


InitFunction_CinematicSpriteObject_CeresExplosion3:
    LDA.W $1B9D 
    STA.W $1B7D,Y 
    ASL A 
    TAX 
    LDA.W .timer,X 
    STA.W $1B5D,Y 
    LDA.W $1993 
    EOR.W #$FFFF 
    INC A 
    CLC 
    ADC.B $80 
    CLC 
    ADC.W .Xoffset,X 
    STA.W $1A7D,Y 
    LDA.W $1997 
    EOR.W #$FFFF 
    INC A 
    CLC 
    ADC.B $82 
    CLC 
    ADC.W .Yoffset,X 
    STA.W $1A9D,Y 
    LDA.W #$0A00 
    STA.W $1ABD,Y 
    RTS 

  .timer
    dw $0001,$0004,$0008,$0010 
  .Xoffset
    dw $0008,$000C,$FFF8,$FFF4 
  .Yoffset
    dw $FFFC,$0008,$FFF6,$000C 


PreInstruction_CinematicSpriteObject_CeresExplosion:
    LDA.W $1AFD,X 
    SEC 
    SBC.W #$1000 
    STA.W $1AFD,X 
    LDA.W $1A9D,X 
    SBC.W #$0000 
    STA.W $1A9D,X 
    LDA.W $1ADD,X 
    CLC 
    ADC.W #$4000 
    STA.W $1ADD,X 
    LDA.W $1A7D,X 
    ADC.W #$0000 
    STA.W $1A7D,X 
    RTS 


InitFunction_CinematicSpriteObject_CeresFinalExplosion:
    LDA.W $1993 
    EOR.W #$FFFF 
    INC A 
    CLC 
    ADC.B $80 
    STA.W $1A7D,Y 
    LDA.W $1997 
    EOR.W #$FFFF 
    INC A 
    CLC 
    ADC.B $82 
    STA.W $1A9D,Y 
    LDA.W #$0A00 
    STA.W $1ABD,Y 
    RTS 


CinematicFunction_CeresGoesBoom_GunshipFlyingAway:
    SEP #$20 
    LDA.B #$10 
    STA.B $6F 
    LDA.B #$37 
    STA.B $72 
    REP #$20 
    LDA.W $1991 
    CLC 
    ADC.W #$0000 
    STA.W $1991 
    LDA.W $1993 
    ADC.W #$0002 
    STA.W $1993 
    LDA.W $198D 
    DEC A 
    AND.W #$00FF 
    STA.W $198D 
    LDA.W $198F 
    CMP.W #$0010 
    BMI .zoomLessThan10 
    SEC 
    SBC.W #$0010 
    STA.W $198F 
    RTS 


.zoomLessThan10:
    LDA.W #CinematicFunction_CeresGoesBoom_WaitC0Frames 
    STA.W $1F51 
    LDA.W #$00C0 
    STA.W $1A49 
    RTS 


CinematicFunction_CeresGoesBoom_WaitC0Frames:
    DEC.W $1A49 
    BEQ .timerExpired 
    BPL .return 

.timerExpired:
    LDA.W #$0001 
    STA.W $0723 
    STA.W $0725 
    LDA.W #CinematicFunction_CeresGoesBoom_FadeOut 
    STA.W $1F51 

.return:
    RTS 


CinematicFunction_CeresGoesBoom_FadeOut:
    JSL.L HandleFadingOut 
    SEP #$20 
    LDA.B $51 
    CMP.B #$80 
    BNE .return 
    JSL.L EnableNMI 
    REP #$20 
    STZ.W $0723 
    STZ.W $0725 
    LDA.W $0998 
    CMP.W #$0025 
    BEQ .gameState25 
    LDA.W #CinematicFunction_FlyToZebes_Initial 
    STA.W $1F51 
    RTS 


.gameState25:
    LDA.W #$0000 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    STZ.W $09D2 
    STZ.W $0A04 
    STZ.W $18A8 
    STZ.W $18AA 
    JSL.L Wait_End_VBlank_Clear_HDMA 
    JSL.L DisableHVCounterInterrupts 
    STZ.W $1982 
    SEP #$20 
    STZ.B $6E 
    STZ.B $71 
    LDA.B #$10 
    STA.B $69 
    STZ.B $6B 
    STZ.B $6C 
    STZ.B $6D 
    LDA.B #$09 
    STA.B $55 
    REP #$20 
    STZ.W $0DE2 
    STZ.W $0727 
    LDX.W #$00FE 

.loop:
    STZ.W $1A8D,X 
    DEX 
    DEX 
    BPL .loop 
    LDA.W #$0019 
    STA.W $0998 

.return:
    RTS 


CinematicFunction_FlyToZebes_Initial:
    JSR.W Setup_PPU_SamusGoesToZebesCutscene 
    LDA.W #$1C1F 
    DEC A 
    DEC A 
    SEC 
    SBC.W #$198D 
    TAX 

.loop:
    STZ.W $198D,X 
    DEX 
    DEX 
    BPL .loop 
    LDA.W #Zebes_Tilemap>>8&$FF00 
    STA.B $48 
    LDA.W #Zebes_Tilemap 
    STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7F9000 
    LDA.W #Tiles_Zebes>>8&$FF00 
    STA.B $48 
    LDA.W #Tiles_Zebes 
    STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7F5000 
    SEP #$30 
    LDA.B #$00 
    STA.W $2116 
    LDA.B #$00 
    STA.W $2117 
    LDA.B #$00 
    STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$00,$18 
    dl $7F4300 
    dw $0300 
    LDA.B #$02 
    STA.W $420B 
    LDA.B #$00 
    STA.W $2116 
    LDA.B #$5C 
    STA.W $2117 
    LDA.B #$80 
    STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl $7F9000 
    dw $0800 
    LDA.B #$02 
    STA.W $420B 
    LDA.B #$00 
    STA.W $2116 
    LDA.B #$60 
    STA.W $2117 
    LDA.B #$80 
    STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl $7F5000 
    dw $4000 
    LDA.B #$02 
    STA.W $420B 
    REP #$30 
    LDA.W #$0100 
    STA.W $211B 
    STA.B $78 
    STZ.W $211C 
    STZ.B $7A 
    STZ.W $211D 
    STZ.B $7C 
    STA.W $211E 
    STA.B $7E 
    LDA.W #$0038 
    STA.W $211F 
    STA.B $80 
    LDA.W #$0018 
    STA.W $2120 
    STA.B $82 
    STZ.W $1993 
    STZ.W $1997 
    STZ.W $198D 
    LDA.W #$0100 
    STA.W $198F 
    JSL.L Disable_HDMAObjects 
    JSL.L Wait_End_VBlank_Clear_HDMA 
    JSL.L Clear_PaletteFXObjects 
    JSL.L Enable_PaletteFXObjects 
    SEP #$20 
    LDA.B #$81 
    STA.B $57 
    REP #$20 
    LDY.W #PaletteFXObjects_CutsceneGunshipEngineFlicker 
    JSL.L Spawn_PaletteFXObject 
    LDA.W #CinematicFunction_FlyToZebes_FadingIn 
    STA.W $1F51 
    JSL.L EnableNMI 
    LDA.W #$0001 
    STA.W $0723 
    STA.W $0725 
    RTS 


CinematicFunction_FlyToZebes_FadingIn:
    LDA.W $1A51 
    BIT.W #$0003 
    BNE .fadeIn 
    SEP #$20 
    LDA.B $57 
    SEC 
    SBC.B #$10 
    STA.B $57 
    REP #$20 

.fadeIn:
    JSL.L HandleFadingIn 
    SEP #$20 
    LDA.B $51 
    CMP.B #$0F 
    BNE .return 
    REP #$20 
    STZ.W $0723 
    STZ.W $0725 
    LDA.W #CinematicFunction_FlyToZebes_MosaicTransition 
    STA.W $1F51 

.return:
    RTS 


CinematicFunction_FlyToZebes_MosaicTransition:
    LDA.W $1A51 
    BIT.W #$0003 
    BNE .return 
    SEP #$20 
    LDA.B $57 
    SEC 
    SBC.B #$10 
    STA.B $57 
    BIT.B #$F0 
    BEQ .nonZeroMosaicBlockSize 
    REP #$20 
    RTS 


.nonZeroMosaicBlockSize:
    SEP #$20 
    LDA.B #$07 
    STA.B $55 
    LDA.B #$80 
    STA.B $5F 
    LDA.B #$00 
    STA.B $58 
    STZ.B $5D 
    LDA.B #$11 
    STA.B $69 
    REP #$20 
    LDA.W #$0080 
    STA.W $1993 
    LDA.W #$FF98 
    STA.W $1997 
    LDA.W #$0020 
    STA.W $198D 
    LDA.W #$0100 
    STA.W $198F 
    LDY.W #CinematicSpriteObjectDefinitions_Zebes 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDY.W #CinematicSpriteObjectDefinitions_ZebesStars2 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDY.W #CinematicSpriteObjectDefinitions_ZebesStars3 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDY.W #CinematicSpriteObjectDefinitions_ZebesStars4 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDY.W #CinematicSpriteObjectDefinitions_ZebesStars5 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDY.W #CinematicSpriteObjectDefinitions_PlanetZebesText 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDA.W #RTS_8BA38F 
    STA.W $1F51 

.return:
    RTS 


InitFunction_CinematicSpriteObject_Zebes:
    LDA.W #$0088 
    STA.W $1A7D,Y 
    LDA.W #$006F 
    STA.W $1A9D,Y 
    LDA.W #$0E00 
    STA.W $1ABD,Y 
    RTS 


PreInstruction_CinematicSpriteObject_Zebes:
    LDA.W $1F51 
    CMP.W #RTS_8BCADE 
    BNE .return 
    LDA.W #PreInstruction_Zebes_SlideSceneAway 
    STA.W $1B3D,X 

.return:
    RTS 


PreInstruction_Zebes_SlideSceneAway:
    LDA.W $1B7D,X 
    CLC 
    ADC.W #$0040 
    STA.W $1B7D,X 
    XBA 
    PHA 
    AND.W #$FF00 
    STA.B $14 
    PLA 
    AND.W #$00FF 
    STA.B $12 
    LDA.W $1AFD,X 
    SEC 
    SBC.B $14 
    STA.W $1AFD,X 
    LDA.W $1A9D,X 
    SBC.B $12 
    STA.W $1A9D,X 
    CMP.W #$FF80 
    BPL .return 
    LDA.W #$0001 
    STA.W $1B5D,X 
    LDA.W #InstList_CinematicSpriteObject_Delete 
    STA.W $1B1D,X 

.return:
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_InitFunction_CinematicSpriteObject_ZebesStars1_8BC897:
    LDA.W #$0080 
    STA.W $1A7D,Y 
    LDA.W #$007F 
    STA.W $1A9D,Y 
    LDA.W #$0800 
    STA.W $1ABD,Y 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


PreInstruction_CinematicSpriteObject_ZebesStars5:
    LDA.W $1F51 
    CMP.W #RTS_8BCADE 
    BNE .return 
    LDA.W #PreInstruction_ZebesStars5_SlideSceneAway 
    STA.W $1B3D,X 

.return:
    RTS 


PreInstruction_ZebesStars5_SlideSceneAway:
    LDA.W $1B7D,X 
    CLC 
    ADC.W #$0020 
    STA.W $1B7D,X 
    XBA 
    PHA 
    AND.W #$FF00 
    STA.B $14 
    PLA 
    AND.W #$00FF 
    STA.B $12 
    LDA.W $1AFD,X 
    SEC 
    SBC.B $14 
    STA.W $1AFD,X 
    LDA.W $1A9D,X 
    SBC.B $12 
    STA.W $1A9D,X 
    CMP.W #$FF80 
    BPL .return 
    LDA.W #$0001 
    STA.W $1B5D,X 
    LDA.W #InstList_CinematicSpriteObject_Delete 
    STA.W $1B1D,X 
    LDA.W #CinematicFunction_FlyToZebes_LoadGameData 
    STA.W $1F51 

.return:
    RTS 


PreInstruction_CinematicSpriteObject_ZebesStars_2_3_4:
    LDA.W $1F51 
    CMP.W #RTS_8BCADE 
    BNE .return 
    LDA.W #PreInstruction_ZebesStars_2_3_4_SlideSceneAway 
    STA.W $1B3D,X 

.return:
    RTS 


PreInstruction_ZebesStars_2_3_4_SlideSceneAway:
    LDA.W $1B7D,X 
    CLC 
    ADC.W #$0020 
    STA.W $1B7D,X 
    XBA 
    PHA 
    AND.W #$FF00 
    STA.B $14 
    PLA 
    AND.W #$00FF 
    STA.B $12 
    LDA.W $1AFD,X 
    SEC 
    SBC.B $14 
    STA.W $1AFD,X 
    LDA.W $1A9D,X 
    SBC.B $12 
    STA.W $1A9D,X 
    CMP.W #$FF80 
    BPL .return 
    LDA.W #$0001 
    STA.W $1B5D,X 
    LDA.W #InstList_CinematicSpriteObject_Delete 
    STA.W $1B1D,X 

.return:
    RTS 


InitFunction_CinematicSpriteObject_ZebesStars2:
    NOP ; >_<
    LDA.W #$0030 
    STA.W $1A7D,Y 
    LDA.W #$002F 
    STA.W $1A9D,Y 
    LDA.W #$0800 
    STA.W $1ABD,Y 
    RTS 


InitFunction_CinematicSpriteObject_ZebesStars3:
    NOP ; >_<
    LDA.W #$00D0 
    STA.W $1A7D,Y 
    LDA.W #$002F 
    STA.W $1A9D,Y 
    LDA.W #$0800 
    STA.W $1ABD,Y 
    RTS 


InitFunction_CinematicSpriteObject_ZebesStars4:
    NOP ; >_<
    LDA.W #$0030 
    STA.W $1A7D,Y 
    LDA.W #$00CF 
    STA.W $1A9D,Y 
    LDA.W #$0800 
    STA.W $1ABD,Y 
    RTS 


InitFunction_CinematicSpriteObject_ZebesStars5:
    NOP ; >_<
    LDA.W #$00D0 
    STA.W $1A7D,Y 
    LDA.W #$00CF 
    STA.W $1A9D,Y 
    LDA.W #$0800 
    STA.W $1ABD,Y 
    RTS 


InitFunction_CinematicSpriteObject_PlanetZebesText:
    LDA.W #$0080 
    STA.W $1A7D,Y 
    LDA.W #$00BA 
    STA.W $1A9D,Y 
    LDA.W #$0000 
    STA.W $1ABD,Y 
    RTS 


Instruction_FadeInPlanetZebesText:
    PHY 
    LDY.W #PaletteFXObjects_FadeInPlanetZebesText 
    JSL.L Spawn_PaletteFXObject 
    PLY 
    RTS 


Instruction_SpawnPlanetZebesJapanTextIfNeeded:
    LDA.W $09E2 
    BEQ .return 
    PHY 
    LDY.W #CinematicSpriteObjectDefinitions_PlanetZebesJapanText 
    JSR.W Spawn_CinematicSpriteObject_Y 
    PLY 

.return:
    RTS 


Instruction_FadeOutPlanetZebesText:
    PHY 
    LDY.W #PaletteFXObjects_FadeOutPlanetZebesText 
    JSL.L Spawn_PaletteFXObject 
    PLY 
    RTS 


Instruction_StartFlyingToZebes:
    LDA.W #$003E 
    STA.W $1993 
    LDA.W #$FF90 
    STA.W $1997 
    LDA.W #$0020 
    STA.W $198D 
    LDA.W #$0010 
    STA.W $198F 
    LDA.W #CinematicFunction_FlyToZebes_FlyingToZebes_DriftingRight 
    STA.W $1F51 
    RTS 


InitFunction_CinematicSpriteObject_PlanetZebesJapanText:
    LDA.W #$0080 
    STA.W $1A7D,Y 
    LDA.W #$00CC 
    STA.W $1A9D,Y 
    LDA.W #$0000 
    STA.W $1ABD,Y 
    RTS 


CinematicFunction_FlyToZebes_FlyingToZebes_DriftingRight:
    LDA.W $1995 
    CLC 
    ADC.W #$2000 
    STA.W $1995 
    LDA.W $1997 
    ADC.W #$0000 
    STA.W $1997 
    LDA.W $1991 
    SEC 
    SBC.W #$8000 
    STA.W $1991 
    LDA.W $1993 
    SBC.W #$0000 
    STA.W $1993 
    LDA.W $198F 
    CMP.W #$0480 
    BPL .zoomLessThan480 
    CLC 
    ADC.W #$0004 
    STA.W $198F 
    RTS 


.zoomLessThan480:
    LDA.W #CinematicFunction_FlyToZebes_FlyingToZebes_TurningLeft 
    STA.W $1F51 
    RTS 


CinematicFunction_FlyToZebes_FlyingToZebes_TurningLeft:
    LDA.W $1995 
    CLC 
    ADC.W #$2000 
    STA.W $1995 
    LDA.W $1997 
    ADC.W #$0000 
    STA.W $1997 
    LDA.W $1991 
    SEC 
    SBC.W #$8000 
    STA.W $1991 
    LDA.W $1993 
    SBC.W #$0000 
    STA.W $1993 
    CMP.W #$FF80 
    BMI .finished 
    LDA.W $198F 
    CLC 
    ADC.W #$0010 
    STA.W $198F 
    LDA.W $198D 
    CMP.W #$00E0 
    BEQ .return 
    SEC 
    SBC.W #$0001 
    AND.W #$00FF 
    STA.W $198D 

.return:
    RTS 


.finished:
    LDA.W #CinematicFunction_FlyToZebes_FlyingToZebes_DriftingLeft 
    STA.W $1F51 
    RTS 


CinematicFunction_FlyToZebes_FlyingToZebes_DriftingLeft:
    LDA.W $1995 
    CLC 
    ADC.W #$2000 
    STA.W $1995 
    LDA.W $1997 
    ADC.W #$0000 
    STA.W $1997 
    LDA.W $1991 
    CLC 
    ADC.W #$2000 
    STA.W $1991 
    LDA.W $1993 
    ADC.W #$0000 
    STA.W $1993 
    LDA.W $198F 
    CMP.W #$2000 
    BPL .zoomLessThan2000 
    CLC 
    ADC.W #$0020 
    STA.W $198F 
    RTS 


.zoomLessThan2000:
    SEP #$20 
    LDA.B #$10 
    STA.B $69 
    REP #$20 
    LDA.W #CinematicFunction_FlyToZebes_HoldOnSceneFor40Frames 
    STA.W $1F51 
    LDA.W #$0040 
    STA.W $1A49 
    RTS 


CinematicFunction_FlyToZebes_HoldOnSceneFor40Frames:
    DEC.W $1A49 
    BEQ .timerExpired 
    BPL .return 

.timerExpired:
    LDA.W #RTS_8BCADE 
    STA.W $1F51 

.return:
    RTS 


RTS_8BCADE:
    RTS 


CinematicFunction_FlyToZebes_LoadGameData:
    SEP #$20 
    LDA.B #$80 
    STA.B $51 
    REP #$20 
    LDA.W #$1C1F 
    DEC A 
    DEC A 
    SEC 
    SBC.W #$198D 
    TAX 

.loop:
    STZ.W $198D,X 
    DEX 
    DEX 
    BPL .loop 
    LDA.W #$0006 
    STA.W $0998 
    LDA.W $09C4 
    STA.W $09C2 
    RTS 


InstList_CinematicSpriteObject_IntroMotherBrain:
    dw $0010,IntroCeresExplosionSpritemaps_MotherBrainFrame1 
    dw $0010,IntroCeresExplosionSpritemaps_MotherBrainFrame2 
    dw $0010,IntroCeresExplosionSpritemaps_MotherBrainFrame3 
    dw $0010,IntroCeresExplosionSpritemaps_MotherBrainFrame2 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObject_IntroMotherBrain 

InstList_IntroMotherBrain_StartPage2_0:
    dw Instruction_StartIntroPage2 
    dw CinematicSpriteObject_Instruction_PreInstructionY 
    dw PreInstruction_IntroMotherBrain_CrossFading 

InstList_IntroMotherBrain_StartPage2_1:
    dw $0010,IntroCeresExplosionSpritemaps_MotherBrainFrame1 
    dw $0010,IntroCeresExplosionSpritemaps_MotherBrainFrame2 
    dw $0010,IntroCeresExplosionSpritemaps_MotherBrainFrame3 
    dw $0010,IntroCeresExplosionSpritemaps_MotherBrainFrame2 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_IntroMotherBrain_StartPage2_1 

InstList_CinematicSpriteObject_MetroidEgg:
    dw $0005,IntroCeresExplosionSpritemaps_MetroidEggHatchingFrame1 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObject_MetroidEgg 

InstList_MetroidEggHatching_0:
    dw $0020,IntroCeresExplosionSpritemaps_MetroidEggHatchingFrame1 
    dw CinematicSpriteObject_Instruction_TimerInY,$0004 

InstList_MetroidEggHatching_1:
    dw $0005,IntroCeresExplosionSpritemaps_MetroidEggHatchingFrame1 
    dw $0005,IntroCeresExplosionSpritemaps_MetroidEggHatchingFrame2 
    dw $0005,IntroCeresExplosionSpritemaps_MetroidEggHatchingFrame1 
    dw $0005,IntroCeresExplosionSpritemaps_MetroidEggHatchingFrame3 
    dw CinematicSpriteObject_Inst_DecrementTimer_GotoYIfNonZero 
    dw InstList_MetroidEggHatching_1 
    dw $000A,IntroCeresExplosionSpritemaps_MetroidEggHatchingFrame1 
    dw $000A,IntroCeresExplosionSpritemaps_MetroidEggHatchingFrame4 
    dw $000A,IntroCeresExplosionSpritemaps_MetroidEggHatchingFrame5 
    dw $000A,IntroCeresExplosionSpritemaps_MetroidEggHatchingFrame6 
    dw $000A,IntroCeresExplosionSpritemaps_MetroidEggHatchingFrame7 
    dw $000A,IntroCeresExplosionSpritemaps_MetroidEggHatchingFrame8 
    dw $0050,IntroCeresExplosionSpritemaps_MetroidEggHatchingFrame9 
    dw Instruction_SpawnMetroidEggParticles 
    dw $000A,IntroCeresExplosionSpritemaps_MetroidEggHatchedFrame1 

InstList_MetroidEggHatching_2:
    dw $000A,IntroCeresExplosionSpritemaps_MetroidEggHatchedFrame2 
    dw $000A,IntroCeresExplosionSpritemaps_MetroidEggHatchedFrame3 
    dw $000A,IntroCeresExplosionSpritemaps_MetroidEggHatchedFrame4 
    dw $000A,IntroCeresExplosionSpritemaps_MetroidEggHatchedFrame5 
    dw $000A,IntroCeresExplosionSpritemaps_MetroidEggHatchedFrame6 
    dw $0140,IntroCeresExplosionSpritemaps_MetroidEggHatchedFrame7 
    dw Instruction_StartIntroPage3 
    dw CinematicSpriteObject_Instruction_PreInstructionY 
    dw PreInstruction_MetroidEgg_DeleteAfterCrossFade 

InstList_MetroidEggHatching_3:
    dw $0050,IntroCeresExplosionSpritemaps_MetroidEggHatchedFrame7 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_MetroidEggHatching_3 

InstList_CinematicSpriteObject_BabyMetroidBeingDelivered_0:
    dw CinematicSpriteObject_Instruction_TimerInY,$000A 

InstList_CinematicSpriteObject_BabyMetroidBeingDelivered_1:
    dw $000A,IntroCeresExplosionSpritemaps_BabyMetroidDeliveredFrame1 
    dw $000A,IntroCeresExplosionSpritemaps_BabyMetroidDeliveredFrame2 
    dw $000A,IntroCeresExplosionSpritemaps_BabyMetroidDeliveredFrame3 
    dw $000A,IntroCeresExplosionSpritemaps_BabyMetroidDeliveredFrame2 
    dw CinematicSpriteObject_Inst_DecrementTimer_GotoYIfNonZero 
    dw InstList_CinematicSpriteObject_BabyMetroidBeingDelivered_1 
    dw Instruction_StartIntroPage4 

InstList_CinematicSpriteObject_BabyMetroidBeingDelivered_2:
    dw $000A,IntroCeresExplosionSpritemaps_BabyMetroidDeliveredFrame1 
    dw $000A,IntroCeresExplosionSpritemaps_BabyMetroidDeliveredFrame2 
    dw $000A,IntroCeresExplosionSpritemaps_BabyMetroidDeliveredFrame3 
    dw $000A,IntroCeresExplosionSpritemaps_BabyMetroidDeliveredFrame2 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObject_BabyMetroidBeingDelivered_2 

InstList_CinematicSpriteObject_BabyMetroidBeingExamined_0:
    dw CinematicSpriteObject_Instruction_TimerInY,$000A 

InstList_CinematicSpriteObject_BabyMetroidBeingExamined_1:
    dw $000A,IntroCeresExplosionSpritemaps_BabyMetroidExaminedFrame1 
    dw $000A,IntroCeresExplosionSpritemaps_BabyMetroidExaminedFrame2 
    dw $000A,IntroCeresExplosionSpritemaps_BabyMetroidExaminedFrame3 
    dw $000A,IntroCeresExplosionSpritemaps_BabyMetroidExaminedFrame2 
    dw CinematicSpriteObject_Inst_DecrementTimer_GotoYIfNonZero 
    dw InstList_CinematicSpriteObject_BabyMetroidBeingExamined_1 
    dw Instruction_StartIntroPage5 

InstList_CinematicSpriteObject_BabyMetroidBeingExamined_2:
    dw $000A,IntroCeresExplosionSpritemaps_BabyMetroidExaminedFrame1 
    dw $000A,IntroCeresExplosionSpritemaps_BabyMetroidExaminedFrame2 
    dw $000A,IntroCeresExplosionSpritemaps_BabyMetroidExaminedFrame3 
    dw $000A,IntroCeresExplosionSpritemaps_BabyMetroidExaminedFrame2 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObject_BabyMetroidBeingExamined_2 

InstList_CinematicSpriteObject_IntroTextCaret:
    dw $0005,IntroCeresExplosionSpritemaps_BlinkingTypewriterBlock 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObject_IntroTextCaret 

InstList_IntroTextCaret_Blink:
    dw $0005,IntroCeresExplosionSpritemaps_BlinkingTypewriterBlock 
    dw $0005,$0000 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_IntroTextCaret_Blink 

InstList_CinematicSpriteObject_IntroJapanTextNextPageArrow:
    dw $000A,IntroCeresExplosionSpritemaps_JapanTextNextPageArrowFrame1 
    dw $000A,IntroCeresExplosionSpritemaps_JapanTextNextPageArrowFrame2 
    dw $000A,IntroCeresExplosionSpritemaps_JapanTextNextPageArrowFrame3 
    dw $000A,IntroCeresExplosionSpritemaps_JapanTextNextPageArrowFrame2 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObject_IntroJapanTextNextPageArrow 

InstList_IntroJapanTextNextPageArrow_Blink:
    dw $003C,$0000 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObject_IntroJapanTextNextPageArrow 

InstList_CinematicSpriteObject_ConfusedBabyMetroid:
    dw $000A,IntroCeresExplosionSpritemaps_ConfusedBabyMetroidFrame1 
    dw $000A,IntroCeresExplosionSpritemaps_ConfusedBabyMetroidFrame2 
    dw $000A,IntroCeresExplosionSpritemaps_ConfusedBabyMetroidFrame3 
    dw $000A,IntroCeresExplosionSpritemaps_ConfusedBabyMetroidFrame2 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObject_ConfusedBabyMetroid 

InstList_CinematicSpriteObject_CeresUnderAttackLargeAsteroid:
    dw $000A,SpaceSpritemaps_CeresUnderAttackLargeAsteroids 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObject_CeresUnderAttackLargeAsteroid 

InstList_CinematicSpriteObject_CeresUnderAttack:
    dw $000A,SpaceSpritemaps_CeresUnderAttack 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObject_CeresUnderAttack 

InstList_CinematicSpriteObject_CeresSmallAsteroids:
    dw $000A,SpaceSpritemaps_CeresSmallAsteroids 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObject_CeresSmallAsteroids 

InstList_CinematicSpriteObject_CeresPurpleSpaceVortext:
    dw $0001,SpaceSpritemaps_CeresPurpleVortexFrame1 
    dw $0001,SpaceSpritemaps_CeresPurpleVortexFrame2 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObject_CeresPurpleSpaceVortext 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_CinematicSpriteObject_SpaceColonyText_8BCC63:
; CinematicSpriteObjectDefinitions_SpaceColony is used instead
    dw $0100,$0000 
    dw $000A,UNUSED_SpaceSpritemaps_S_8C92AA 
    dw $000A,UNUSED_SpaceSpritemaps_SP_8C92B1 
    dw $000A,UNUSED_SpaceSpritemaps_SPA_8C92BD 
    dw $000A,UNUSED_SpaceSpritemaps_SPAC_8C92CE 
    dw $000A,UNUSED_SpaceSpritemaps_SPACE_8C92E4 
    dw $000A,UNUSED_SpaceSpritemaps_SPACEC_8C92FF 
    dw $000A,UNUSED_SpaceSpritemaps_SPACECO_8C931F 
    dw $000A,UNUSED_SpaceSpritemaps_SPACECOL_8C9344 
    dw $000A,UNUSED_SpaceSpritemaps_SPACECOLO_9C936E 
    dw $000A,UNUSED_SpaceSpritemaps_SPACECOLON_8C939D 
    dw $000A,UNUSED_SpaceSpritemaps_SPACECOLONY_8C921F 
    dw Instruction_SkipNextInstructionIfEnglishText 
    dw $0080,UNUSED_SpaceSpritemaps_SPACECOLONY_8C921F 
    dw Instruction_FinishFlyToCeres 

UNUSED_InstList_CinematicSpriteObject_SpaceColonyText_8BCC9B:
    dw $0001,UNUSED_SpaceSpritemaps_SPACECOLONY_8C921F 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw UNUSED_InstList_CinematicSpriteObject_SpaceColonyText_8BCC9B 

UNUSED_InstList_CineSpriteObject_SpaceColonyJapanText_8BCCA3:
    dw $000A,UNUSED_SpaceSpritemaps_JapanText_SPACECOLONY_8C9258 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw UNUSED_InstList_CineSpriteObject_SpaceColonyJapanText_8BCCA3 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_CinematicSpriteObject_Zebes:
    dw $000A,SpaceSpritemaps_Zebes 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObject_Zebes 

if !FEATURE_KEEP_UNREFERENCED
InstList_CinematicSpriteObject_ZebesStars1:
    dw $000A,UNUSED_SpaceSpritemaps_ZebesStars1_8C96CB 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObject_ZebesStars1 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_CinematicSpriteObject_PlanetZebesText:
    dw $0040,$0000 
    dw Instruction_FadeInPlanetZebesText 
    dw $0020,SpaceSpritemaps_PlanetZebes 
    dw Instruction_SpawnPlanetZebesJapanTextIfNeeded 
    dw $00C0,SpaceSpritemaps_PlanetZebes 
    dw Instruction_FadeOutPlanetZebesText 
    dw $0060,SpaceSpritemaps_PlanetZebes 
    dw Instruction_StartFlyingToZebes 
    dw CinematicSpriteObject_Instruction_Delete 

InstList_CinematicSpriteObject_PlanetZebesJapanText:
    dw $00C0,SpaceSpritemaps_JapanText_PlanetZebes 
    dw CinematicSpriteObject_Instruction_Delete 

InstList_CinematicSpriteObject_CeresExplosion1:
    dw $0003,SpaceSpritemaps_IntroMotherBrainExplosionSmallFrame1 
    dw $0003,SpaceSpritemaps_IntroMotherBrainExplosionSmallFrame2 
    dw $0003,SpaceSpritemaps_IntroMotherBrainExplosionSmallFrame3 
    dw $0003,SpaceSpritemaps_IntroMotherBrainExplosionSmallFrame4 
    dw $0003,SpaceSpritemaps_IntroMotherBrainExplosionSmallFrame5 
    dw $0003,SpaceSpritemaps_IntroMotherBrainExplosionSmallFrame6 
    dw CinematicSpriteObject_Instruction_Delete 

InstList_CinematicSpriteObject_CeresExplosion2_0:
    dw CinematicSpriteObject_Instruction_TimerInY,$0006 

InstList_CinematicSpriteObject_CeresExplosion2_1:
    dw $0003,SpaceSpritemaps_IntroMotherBrainExplosionSmallFrame1 
    dw $0003,SpaceSpritemaps_IntroMotherBrainExplosionSmallFrame2 
    dw $0003,SpaceSpritemaps_IntroMotherBrainExplosionSmallFrame3 
    dw $0003,SpaceSpritemaps_IntroMotherBrainExplosionSmallFrame4 
    dw $0003,SpaceSpritemaps_IntroMotherBrainExplosionSmallFrame5 
    dw $0003,SpaceSpritemaps_IntroMotherBrainExplosionSmallFrame6 
    dw $0010,$0000 
    dw CinematicSpriteObject_Inst_DecrementTimer_GotoYIfNonZero 
    dw InstList_CinematicSpriteObject_CeresExplosion2_1 
    dw CinematicSpriteObject_Instruction_Delete 

InstList_CinematicSpriteObject_CeresExplosion3_0:
    dw CinematicSpriteObject_Instruction_TimerInY,$0007 

InstList_CinematicSpriteObject_CeresExplosion3_1:
    dw $0005,SpaceSpritemaps_CeresExplosionFrame1 
    dw $0005,SpaceSpritemaps_CeresExplosionFrame2 
    dw $0005,SpaceSpritemaps_CeresExplosionFrame3 
    dw $0005,SpaceSpritemaps_CeresExplosionFrame4 
    dw $0008,$0000 
    dw CinematicSpriteObject_Inst_DecrementTimer_GotoYIfNonZero 
    dw InstList_CinematicSpriteObject_CeresExplosion3_1 
    dw CinematicSpriteObject_Instruction_Delete 

InstList_CinematicSpriteObject_MetroidEggParticle1:
    dw $0001,IntroCeresExplosionSpritemaps_MetroidEggsParticle1 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObject_MetroidEggParticle1 

InstList_CinematicSpriteObject_MetroidEggParticle2:
    dw $0001,IntroCeresExplosionSpritemaps_MetroidEggsParticle2 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObject_MetroidEggParticle2 

InstList_CinematicSpriteObject_MetroidEggParticle3:
    dw $0001,IntroCeresExplosionSpritemaps_MetroidEggsParticle3 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObject_MetroidEggParticle3 

InstList_CinematicSpriteObject_MetroidEggParticle4:
    dw $0001,IntroCeresExplosionSpritemaps_MetroidEggsParticle4 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObject_MetroidEggParticle4 

InstList_CinematicSpriteObject_MetroidEggParticle5:
    dw $0001,IntroCeresExplosionSpritemaps_MetroidEggsParticle5 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObject_MetroidEggParticle5 

InstList_CinematicSpriteObject_MetroidEggParticle6:
    dw $0001,IntroCeresExplosionSpritemaps_MetroidEggsParticle6 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObject_MetroidEggParticle6 

InstList_CinematicSpriteObject_MetroidEggSlimeDrops:
    dw $0001,IntroCeresExplosionSpritemaps_MetroidEggsSlimeDropsFrame1 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObject_MetroidEggSlimeDrops 

InstList_MetroidEggParticle_HitGround:
    dw $000A,IntroCeresExplosionSpritemaps_MetroidEggsSlimeDropsFrame2 
    dw $000A,IntroCeresExplosionSpritemaps_MetroidEggsSlimeDropsFrame3 
    dw $000A,IntroCeresExplosionSpritemaps_MetroidEggsSlimeDropsFrame4 
    dw $000A,IntroCeresExplosionSpritemaps_MetroidEggsSlimeDropsFrame5 
    dw CinematicSpriteObject_Instruction_Delete 

InstList_CinematicSpriteObject_ZebesStars2:
    dw $000A,SpaceSpritemaps_ZebesStars2 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObject_ZebesStars2 

InstList_CinematicSpriteObject_ZebesStars3:
    dw $000A,SpaceSpritemaps_ZebesStars3 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObject_ZebesStars3 

InstList_CinematicSpriteObject_ZebesStars4:
    dw $000A,SpaceSpritemaps_ZebesStars4 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObject_ZebesStars4 

InstList_CinematicSpriteObject_ZebesStars5:
    dw $000A,SpaceSpritemaps_ZebesStars5 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObject_ZebesStars5 

InstList_CinematicSpriteObject_CeresStars:
    dw $000A,SpaceSpritemaps_CeresStars 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObject_CeresStars 

InstList_CinematicSpriteObject_IntroMotherBrainExplosion_Big:
    dw $0006,SpaceSpritemaps_IntroMotherBrainExplosionBigFrame1 
    dw $0006,SpaceSpritemaps_IntroMotherBrainExplosionBigFrame2 
    dw $0006,SpaceSpritemaps_IntroMotherBrainExplosionBigFrame3 
    dw $0006,SpaceSpritemaps_IntroMotherBrainExplosionBigFrame4 
    dw $0006,SpaceSpritemaps_IntroMotherBrainExplosionBigFrame5 
    dw $0006,SpaceSpritemaps_IntroMotherBrainExplosionBigFrame6 
    dw $0010,$0000 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObject_IntroMotherBrainExplosion_Big 

InstList_CineSpriteObject_IntroMotherBrainExplosion_Small:
    dw $0003,SpaceSpritemaps_IntroMotherBrainExplosionSmallFrame1 
    dw $0003,SpaceSpritemaps_IntroMotherBrainExplosionSmallFrame2 
    dw $0003,SpaceSpritemaps_IntroMotherBrainExplosionSmallFrame3 
    dw $0003,SpaceSpritemaps_IntroMotherBrainExplosionSmallFrame4 
    dw $0003,SpaceSpritemaps_IntroMotherBrainExplosionSmallFrame5 
    dw $0003,SpaceSpritemaps_IntroMotherBrainExplosionSmallFrame6 
    dw $0010,$0000 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CineSpriteObject_IntroMotherBrainExplosion_Small 

InstList_CinematicSpriteObject_IntroRinka_0:
    dw $000A,IntroCeresExplosionSpritemaps_RinkaFrame1 
    dw $000A,IntroCeresExplosionSpritemaps_RinkaFrame2 
    dw $000A,IntroCeresExplosionSpritemaps_RinkaFrame3 
    dw Instruction_StartMoving_IntroRinka 

InstList_CinematicSpriteObject_IntroRinka_1:
    dw $000A,IntroCeresExplosionSpritemaps_RinkaFrame2 
    dw $000A,IntroCeresExplosionSpritemaps_RinkaFrame1 
    dw $000A,IntroCeresExplosionSpritemaps_RinkaFrame2 
    dw $000A,IntroCeresExplosionSpritemaps_RinkaFrame3 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObject_IntroRinka_1 

InstList_CinematicSpriteObject_RinkaSpawner:
    dw $004A,$0000 
    dw Instruction_Spawn_IntroRinkas_0_1 
    dw $0080,$0000 
    dw Instruction_Spawn_IntroRinkas_2_3 
    dw CinematicSpriteObject_Instruction_Delete 

InstList_CinematicSpriteObject_CeresFinalExplosion:
    dw $0005,SpaceSpritemaps_CeresFinalExplosionFrame1 
    dw $0005,SpaceSpritemaps_CeresFinalExplosionFrame2 
    dw $0005,SpaceSpritemaps_CeresFinalExplosionFrame3 
    dw $0005,SpaceSpritemaps_CeresFinalExplosionFrame4 
    dw $0005,SpaceSpritemaps_CeresFinalExplosionFrame5 
    dw $0005,SpaceSpritemaps_CeresFinalExplosionFrame6 
    dw CinematicSpriteObject_Instruction_Delete 

InstList_CinematicSpriteObject_CeresExplosionSpawner:
    dw $0080,$0000 
    dw Instruction_SpawnCeresExplosions1 
    dw $0050,$0000 
    dw CinematicSpriteObject_Instruction_PreInstructionY 
    dw PreInst_CeresExplosionSpawner_SpawnExplosion2EveryCFrames 
    dw $0040,$0000 
    dw Instruction_SpawnCeresExplosions3 
    dw CinematicSpriteObject_Instruction_Delete 

InstList_CinematicSpriteObject_CeresExplosionLargeAsteroids:
    dw $000A,SpaceSpritemaps_CeresExplosionLargeAsteroids 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObject_CeresExplosionLargeAsteroids 

InstList_CinematicSpriteObject_Delete:
    dw CinematicSpriteObject_Instruction_Delete 

CinematicSpriteObjectDefinitions_IntroMotherBrain:
    dw InitFunction_CinematicSpriteObject_IntroMotherBrain 
    dw PreInstruction_CinematicSpriteObject_IntroMotherBrain 
    dw InstList_CinematicSpriteObject_IntroMotherBrain 

CinematicSpriteObjectDefinitions_MetroidEgg:
    dw InitFunction_CinematicSpriteObject_MetroidEgg 
    dw PreInstruction_CinematicSpriteObject_MetroidEgg 
    dw InstList_CinematicSpriteObject_MetroidEgg 

CinematicSpriteObjectDefinitions_BabyMetroidBeingDelivered:
    dw InitFunction_CinematicSpriteObject_BabyMetroidBeingDelivered 
    dw PreInst_CinematicSpriteObject_BabyMetroidBeingDelivered 
    dw InstList_CinematicSpriteObject_BabyMetroidBeingDelivered_0 

CinematicSpriteObjectDefinitions_BabyMetroidBeingExamined:
    dw InitFunction_CinematicSpriteObject_BabyMetroidBeingExamined 
    dw PreInst_CinematicSpriteObject_BabyMetroidBeingExamined 
    dw InstList_CinematicSpriteObject_BabyMetroidBeingExamined_0 

CinematicSpriteObjectDefinitions_IntroTextCaret:
    dw InitFunction_CinematicSpriteObject_IntroTextCaret 
    dw RTS_8BA8D4 
    dw InstList_CinematicSpriteObject_IntroTextCaret 

CinematicSpriteObjectDefinitions_IntroJapanTextNextPageArrow:
    dw InitFunc_CinematicSpriteObject_IntroJapanTextNextPageArrow 
    dw PreInst_CinematicSpriteObject_IntroJapanTextNextPageArrow 
    dw InstList_CinematicSpriteObject_IntroJapanTextNextPageArrow 

CinematicSpriteObjectDefinitions_ConfusedBabyMetroid:
    dw InitFunction_CinematicSpriteObject_ConfusedBabyMetroid 
    dw PreInstruction_CinematicSpriteObject_ConfusedBabyMetroid 
    dw InstList_CinematicSpriteObject_ConfusedBabyMetroid 

CinematicSpriteObjectDefs_CeresUnderAttackLargeAsteroids:
    dw InitFunc_CinematicSpriteObject_CeresExplosionLargeAsteroids 
    dw PreInst_CinematicSpriteObject_CeresExplosionLargeAsteroids 
    dw InstList_CinematicSpriteObject_CeresUnderAttackLargeAsteroid 

CinematicSpriteObjectDefinitions_CeresUnderAttack:
    dw InitFunction_CinematicSpriteObject_CeresUnderAttack 
    dw PreInstruction_CinematicSpriteObject_CeresUnderAttack 
    dw InstList_CinematicSpriteObject_CeresUnderAttack 

CinematicSpriteObjectDefinitions_CeresSmallAsteroids:
    dw InitFunction_CinematicSpriteObject_CeresSmallAsteroid 
    dw PreInstruction_CinematicSpriteObject_CeresSmallAsteroid 
    dw InstList_CinematicSpriteObject_CeresSmallAsteroids 

CinematicSpriteObjectDefinitions_CeresPurpleSpaceVortex:
    dw InitFunction_CinematicSpriteObject_CeresPurpleSpaceVortex 
    dw PreInstruction_CinematicSpriteObject_CeresPurpleSpaceVortex 
    dw InstList_CinematicSpriteObject_CeresPurpleSpaceVortext 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_CinematicSpriteObjectDefs_SpaceColonyText_8BCE97:
    dw UNUSED_InitFunc_CinematicSpriteObject_SpaceColonyText_8BC083 
    dw RTS_8B93D9 
    dw UNUSED_InstList_CinematicSpriteObject_SpaceColonyText_8BCC63 

UNUSED_CinematicSpriteObjectDefs_SpaceColonyJapanText_8BCE9D:
    dw UNUSED_InitFunc_CineSpriteObject_SpaceColonyJapanText_8BC0B2 
    dw RTS_8B93D9 
    dw UNUSED_InstList_CineSpriteObject_SpaceColonyJapanText_8BCCA3 
endif ; !FEATURE_KEEP_UNREFERENCED

CinematicSpriteObjectDefinitions_Zebes:
    dw InitFunction_CinematicSpriteObject_Zebes 
    dw PreInstruction_CinematicSpriteObject_Zebes 
    dw InstList_CinematicSpriteObject_Zebes 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_CinematicSpriteObjectDefinitions_ZebesStars1_8BCEA9:
    dw UNUSED_InitFunction_CinematicSpriteObject_ZebesStars1_8BC897 
    dw PreInstruction_CinematicSpriteObject_ZebesStars5 
    dw InstList_CinematicSpriteObject_ZebesStars1 
endif ; !FEATURE_KEEP_UNREFERENCED

CinematicSpriteObjectDefinitions_PlanetZebesText:
    dw InitFunction_CinematicSpriteObject_PlanetZebesText 
    dw RTS_8B93D9 
    dw InstList_CinematicSpriteObject_PlanetZebesText 

CinematicSpriteObjectDefinitions_PlanetZebesJapanText:
    dw InitFunction_CinematicSpriteObject_PlanetZebesJapanText 
    dw RTS_8B93D9 
    dw InstList_CinematicSpriteObject_PlanetZebesJapanText 

CinematicSpriteObjectDefinitions_CeresExplosion1:
    dw InitFunction_CinematicSpriteObject_CeresExplosion1 
    dw PreInstruction_CinematicSpriteObject_CeresExplosion 
    dw InstList_CinematicSpriteObject_CeresExplosion1 

CinematicSpriteObjectDefinitions_CeresExplosion2:
    dw InitFunction_CinematicSpriteObject_CeresExplosion2 
    dw PreInstruction_CinematicSpriteObject_CeresExplosion 
    dw InstList_CinematicSpriteObject_CeresExplosion2_0 

CinematicSpriteObjectDefinitions_CeresExplosion3:
    dw InitFunction_CinematicSpriteObject_CeresExplosion3 
    dw PreInstruction_CinematicSpriteObject_CeresExplosion 
    dw InstList_CinematicSpriteObject_CeresExplosion3_0 

CinematicSpriteObjectDefinitions_MetroidEggParticle1:
    dw InitFunction_CinematicSpriteObject_MetroidEggParticles 
    dw PreInstruction_CinematicSpriteObject_MetroidEggParticle 
    dw InstList_CinematicSpriteObject_MetroidEggParticle1 

CinematicSpriteObjectDefinitions_MetroidEggParticle2:
    dw InitFunction_CinematicSpriteObject_MetroidEggParticles 
    dw PreInstruction_CinematicSpriteObject_MetroidEggParticle 
    dw InstList_CinematicSpriteObject_MetroidEggParticle2 

CinematicSpriteObjectDefinitions_MetroidEggParticle3:
    dw InitFunction_CinematicSpriteObject_MetroidEggParticles 
    dw PreInstruction_CinematicSpriteObject_MetroidEggParticle 
    dw InstList_CinematicSpriteObject_MetroidEggParticle3 

CinematicSpriteObjectDefinitions_MetroidEggParticle4:
    dw InitFunction_CinematicSpriteObject_MetroidEggParticles 
    dw PreInstruction_CinematicSpriteObject_MetroidEggParticle 
    dw InstList_CinematicSpriteObject_MetroidEggParticle4 

CinematicSpriteObjectDefinitions_MetroidEggParticle5:
    dw InitFunction_CinematicSpriteObject_MetroidEggParticles 
    dw PreInstruction_CinematicSpriteObject_MetroidEggParticle 
    dw InstList_CinematicSpriteObject_MetroidEggParticle5 

CinematicSpriteObjectDefinitions_MetroidEggParticle6:
    dw InitFunction_CinematicSpriteObject_MetroidEggParticles 
    dw PreInstruction_CinematicSpriteObject_MetroidEggParticle 
    dw InstList_CinematicSpriteObject_MetroidEggParticle6 

CinematicSpriteObjectDefinitions_MetroidEggSlimeDrops:
    dw InitFunction_CinematicSpriteObject_MetroidEggSlimeDrops 
    dw PreInstruction_CinematicSpriteObject_MetroidEggSlimeDrops 
    dw InstList_CinematicSpriteObject_MetroidEggSlimeDrops 

CinematicSpriteObjectDefinitions_ZebesStars2:
    dw InitFunction_CinematicSpriteObject_ZebesStars2 
    dw PreInstruction_CinematicSpriteObject_ZebesStars_2_3_4 
    dw InstList_CinematicSpriteObject_ZebesStars2 

CinematicSpriteObjectDefinitions_ZebesStars3:
    dw InitFunction_CinematicSpriteObject_ZebesStars3 
    dw PreInstruction_CinematicSpriteObject_ZebesStars_2_3_4 
    dw InstList_CinematicSpriteObject_ZebesStars3 

CinematicSpriteObjectDefinitions_ZebesStars4:
    dw InitFunction_CinematicSpriteObject_ZebesStars4 
    dw PreInstruction_CinematicSpriteObject_ZebesStars_2_3_4 
    dw InstList_CinematicSpriteObject_ZebesStars4 

CinematicSpriteObjectDefinitions_ZebesStars5:
    dw InitFunction_CinematicSpriteObject_ZebesStars5 
    dw PreInstruction_CinematicSpriteObject_ZebesStars5 
    dw InstList_CinematicSpriteObject_ZebesStars5 

CinematicSpriteObjectDefinitions_CeresStars:
    dw InitFunction_CinematicSpriteObject_CeresStars 
    dw PreInstruction_CinematicSpriteObject_CeresStars 
    dw InstList_CinematicSpriteObject_CeresStars 

CinematicSpriteObjectDefs_IntroMotherBrainExplosion_Big:
    dw InitFunc_CinematicSpriteObject_IntroMotherBrainExplosion_Big 
    dw PreInst_CinematicSpriteObject_IntroMotherBrainExplosion 
    dw InstList_CinematicSpriteObject_IntroMotherBrainExplosion_Big 

CinematicSpriteObjectDefs_IntroMotherBrainExplosion_Small:
    dw InitFunc_CineSpriteObject_IntroMotherBrainExplosion_Small 
    dw PreInst_CinematicSpriteObject_IntroMotherBrainExplosion 
    dw InstList_CineSpriteObject_IntroMotherBrainExplosion_Small 

CinematicSpriteObjectDefinitions_IntroRinka:
    dw InitFunction_CinematicSpriteObject_IntroRinka 
    dw RTS_8B93D9 
    dw InstList_CinematicSpriteObject_IntroRinka_0 

CinematicSpriteObjectDefinitions_RinkaSpawner:
    dw RTS_8B93D9 
    dw RTS_8B93D9 
    dw InstList_CinematicSpriteObject_RinkaSpawner 

CinematicSpriteObjectDefinitions_CeresFinalExplosion:
    dw InitFunction_CinematicSpriteObject_CeresFinalExplosion 
    dw PreInstruction_CinematicSpriteObject_CeresExplosion 
    dw InstList_CinematicSpriteObject_CeresFinalExplosion 

CinematicSpriteObjectDefinitions_CeresExplosionSpawner:
    dw RTS_8B93D9 
    dw RTS_8B93D9 
    dw InstList_CinematicSpriteObject_CeresExplosionSpawner 

CinematicSpriteObjectDefs_CeresExplosionLargeAsteroids:
    dw InitFunc_CinematicSpriteObject_CeresExplosionLargeAsteroids 
    dw PreInst_CinematicSpriteObject_CeresExplosionLargeAsteroids 
    dw InstList_CinematicSpriteObject_CeresExplosionLargeAsteroids 

CinematicSpriteObjectDefinitions_IntroTextPage1:
    dw RTS_8B93D9 
    dw RTS_8B93D9 
    dw CinematicBGObjectInstLists_IntroTextPage1 

CinematicSpriteObjectDefinitions_IntroTextPage2:
    dw RTS_8B93D9 
    dw RTS_8B93D9 
    dw CinematicBGObjectInstLists_IntroTextPage2 

CinematicSpriteObjectDefinitions_IntroTextPage3:
    dw RTS_8B93D9 
    dw RTS_8B93D9 
    dw CinematicBGObjectInstLists_IntroTextPage3 

CinematicSpriteObjectDefinitions_IntroTextPage4:
    dw RTS_8B93D9 
    dw RTS_8B93D9 
    dw CinematicBGObjectInstLists_IntroTextPage4 

CinematicSpriteObjectDefinitions_IntroTextPage5:
    dw RTS_8B93D9 
    dw RTS_8B93D9 
    dw CinematicBGObjectInstLists_IntroTextPage5 

CinematicSpriteObjectDefinitions_IntroTextPage6:
    dw RTS_8B93D9 
    dw RTS_8B93D9 
    dw CinematicBGObjectInstLists_IntroTextPage6 

CinematicSpriteObjectDefinitions_SamusBlinking:
    dw RTS_8B93D9 
    dw PreInstruction_CinematicBGObject_SamusBlinking 
    dw CinematicBGObjectInstLists_SamusBlinking 

CinematicSpriteObjectDefinitions_SpaceColony:
    dw RTS_8B93D9 
    dw RTS_8B93D9 
    dw CinematicBGObjectInstLists_SpaceColony 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_CinematicSpriteObjectDefs_IntroTextPage1_8BCF6F:
    dw RTS_8B93D9 
    dw RTS_8B93D9 
    dw CinematicBGObjectInstLists_IntroTextPage1 
endif ; !FEATURE_KEEP_UNREFERENCED


; Format:
;     dddd,nnnn
;     tttt,bbbb
;     tttt,bbbb
;     ...
; where
;     d: Japanese text tiles destination offset ($7E:4000 + d)
;     n: Number of characters
;     t: Top Japanese text tiles source offset ($7F:A000 + t)
;     b: Bottom Japanese text tiles source offset ($7F:A000 + b)
IntroJapanTextData_Page1_TopLine: 
; 私が メトロイドの存在を知ったのは (I learnt of the metroids' existence)
    dw $0040,$0011
    dw $0A60,$0B60
    dw $04E0,$0150
    dw $0EF0,$0EF0
    dw $0E00,$0F00
    dw $0E10,$0F10
    dw $0E20,$0F20
    dw $0E30,$0F30
    dw $0F70,$0F10
    dw $0280,$0380
    dw $0C70,$0D70
    dw $0C80,$0D80
    dw $04C0,$05C0
    dw $08E0,$09E0
    dw $0EF0,$0760
    dw $00F0,$01F0
    dw $0280,$0380
    dw $0290,$0390

IntroJapanTextData_Page1_BottomLine: 
; 惑星ゼーベスでの戦いの時だった (it was during the battle on planet Zebes)
    dw $01C0,$000F
    dw $0680,$0780
    dw $0690,$0790
    dw $0E80,$0F80
    dw $0650,$0750
    dw $0E40,$0F40
    dw $0E60,$0F60
    dw $04F0,$0320
    dw $0280,$0380
    dw $08F0,$09F0
    dw $0010,$0110
    dw $0280,$0380
    dw $0C90,$0D90
    dw $05E0,$01F0
    dw $0EF0,$0760
    dw $00F0,$01F0

IntroJapanTextData_Page2_Subpage1_TopLine: 
; その後 私は惑星ＳＲ３８８へ メトロイドを (after that, I, to planet SR388, with the metroid)
    dw $0020,$0015
    dw $00E0,$01E0
    dw $0280,$0380
    dw $0A20,$0B20
    dw $0EF0,$0EF0
    dw $0A60,$0B60
    dw $0290,$0390
    dw $0680,$0780
    dw $0690,$0790
    dw $0660,$07E0
    dw $0670,$0770
    dw $06E0,$07E0
    dw $06F0,$07F0
    dw $06F0,$07F0
    dw $02C0,$03C0
    dw $0EF0,$0EF0
    dw $0E00,$0F00
    dw $0E10,$0F10
    dw $0E20,$0F20
    dw $0E30,$0F30
    dw $0F70,$0F10
    dw $04C0,$05C0

IntroJapanTextData_Page2_Subpage1_BottomLine: 
; 壊滅させるために向った (headed there to destroy it)
    dw $01A0,$000B
    dw $0A30,$0B30
    dw $0A40,$0B40
    dw $00A0,$01A0
    dw $00D0,$01D0
    dw $0480,$0580
    dw $00F0,$01F0
    dw $0410,$0510
    dw $0250,$0350
    dw $0A50,$0B50
    dw $0EF0,$0760
    dw $00F0,$01F0

IntroJapanTextData_Page2_Subpage2_TopLine: 
; そこで 唯一の生き残りであるベビーメトロイド (there, the only baby metroid left alive)
    dw $0010,$0016
    dw $00E0,$01E0
    dw $0090,$0190
    dw $04F0,$0320
    dw $0EF0,$0EF0
    dw $0A70,$0B70
    dw $0A80,$0B80
    dw $0280,$0380
    dw $0A90,$0B90
    dw $0060,$0160
    dw $0AA0,$0BA0
    dw $0470,$0570
    dw $04F0,$0320
    dw $0000,$0100
    dw $0480,$0580
    dw $0E40,$0F40
    dw $0E50,$0F50
    dw $0650,$0750
    dw $0E00,$0F00
    dw $0E10,$0F10
    dw $0E20,$0F20
    dw $0E30,$0F30
    dw $0F70,$0F10

IntroJapanTextData_Page2_Subpage2_BottomLine: 
; を捕獲した (I captured)
    dw $0190,$0005
    dw $04C0,$05C0
    dw $06A0,$07A0
    dw $06B0,$07B0
    dw $00B0,$01B0
    dw $00F0,$01F0

IntroJapanTextData_Page3_Subpage1: 
; 正確にはベビーメトロイドがついて来たと言うべきだ (rather, I should say the metroid followed me)
    dw $0000,$0018
    dw $06C0,$07C0
    dw $06D0,$07D0
    dw $0250,$0350
    dw $0290,$0390
    dw $0E40,$0F40
    dw $0E50,$0F50
    dw $0650,$0750
    dw $0E00,$0F00
    dw $0E10,$0F10
    dw $0E20,$0F20
    dw $0E30,$0F30
    dw $0F70,$0F10
    dw $04E0,$0150
    dw $0210,$0310
    dw $0010,$0110
    dw $0220,$0320
    dw $0A00,$0B00
    dw $00F0,$01F0
    dw $0230,$0330
    dw $0A10,$0B10
    dw $0020,$0120
    dw $0E40,$0F40
    dw $0060,$0160
    dw $05E0,$01F0

IntroJapanTextData_Page3_Subpage2: 
; 生まれてすぐ目に入った私を母親だと思った様だ (when it was born, it seemed to think that I, whom it immediately noticed, was its mother)
    dw $0010,$0016
    dw $0A90,$0B90
    dw $02E0,$03E0
    dw $0490,$0590
    dw $0220,$0320
    dw $00C0,$01C0
    dw $05F0,$0170
    dw $0AD0,$0BD0
    dw $0250,$0350
    dw $0CB0,$0DB0
    dw $0EF0,$0760
    dw $00F0,$01F0
    dw $0A60,$0B60
    dw $04C0,$05C0
    dw $08A0,$09A0
    dw $08B0,$09B0
    dw $05E0,$01F0
    dw $0230,$0330
    dw $08C0,$09C0
    dw $0EF0,$0760
    dw $00F0,$01F0
    dw $0C50,$0D50
    dw $05E0,$01F0

IntroJapanTextData_Page4_Subpage1_TopLine: 
; そのベビーメトロイドを私はスペースコロニーの (I went to a space colony with this baby metroid)
    dw $0010,$0016
    dw $00E0,$01E0
    dw $0280,$0380
    dw $0E40,$0F40
    dw $0E50,$0F50
    dw $0650,$0750
    dw $0E00,$0F00
    dw $0E10,$0F10
    dw $0E20,$0F20
    dw $0E30,$0F30
    dw $0F70,$0F10
    dw $04C0,$05C0
    dw $0A60,$0B60
    dw $0290,$0390
    dw $0E60,$0F60
    dw $0E70,$0F40
    dw $0650,$0750
    dw $0E60,$0F60
    dw $0E90,$0F90
    dw $0E20,$0F20
    dw $0EA0,$0FA0
    dw $0650,$0750
    dw $0280,$0380

IntroJapanTextData_Page4_Subpage1_BottomLine: 
; 宇宙科学アカデミーへと持ち込んだ (the Space Science Academy)
    dw $0190,$0010
    dw $0CE0,$0DE0
    dw $0CF0,$0DF0
    dw $0C20,$0D20
    dw $0C30,$0D30
    dw $0610,$0710
    dw $0620,$0720
    dw $0630,$0730
    dw $0640,$0740
    dw $0650,$0750
    dw $02C0,$03C0
    dw $0230,$0330
    dw $0C60,$0D60
    dw $0200,$0300
    dw $08D0,$09D0
    dw $04D0,$05D0
    dw $05E0,$01F0

IntroJapanTextData_Page4_Subpage2_TopLine: 
; メトロイドの優れた特性を宇宙の未来に (with the metroid's amazing special powers, for the future of space)
    dw $0030,$0012
    dw $0E00,$0F00
    dw $0E10,$0F10
    dw $0E20,$0F20
    dw $0E30,$0F30
    dw $0F70,$0F10
    dw $0280,$0380
    dw $0AB0,$0BB0
    dw $0490,$0590
    dw $00F0,$01F0
    dw $0CC0,$0DC0
    dw $0CD0,$0DD0
    dw $04C0,$05C0
    dw $0CE0,$0DE0
    dw $0CF0,$0DF0
    dw $0280,$0380
    dw $0CA0,$0DA0
    dw $0A00,$0B00
    dw $0250,$0350

IntroJapanTextData_Page4_Subpage2_BottomLine: 
; 役立たせるために・・・ (in order to harness it...)
    dw $01B0,$000B
    dw $0800,$0900
    dw $0810,$0910
    dw $00F0,$01F0
    dw $00D0,$01D0
    dw $0480,$0580
    dw $00F0,$01F0
    dw $0410,$0510
    dw $0250,$0350
    dw $0EF0,$0600
    dw $0EF0,$0600
    dw $0EF0,$0600

IntroJapanTextData_Page5_Subpage1: 
; 研究は順調に進みつつあった (research was continuing smoothly)
    dw $0050,$000D
    dw $0860,$0960
    dw $0870,$0970
    dw $0290,$0390
    dw $0840,$0940
    dw $0850,$0950
    dw $0250,$0350
    dw $0C40,$0D40
    dw $02F0,$03F0
    dw $0210,$0310
    dw $0210,$0310
    dw $0000,$0100
    dw $0EF0,$0760
    dw $00F0,$01F0

IntroJapanTextData_Page5_Subpage2: 
; そんなある日スペースコロニーから突然連絡が入った (one day I got a sudden transmission from the space colony)
    dw $0000,$0018
    dw $00E0,$01E0
    dw $04D0,$05D0
    dw $0240,$0340
    dw $0000,$0100
    dw $0480,$0580
    dw $0AC0,$0BC0
    dw $0E60,$0F60
    dw $0E70,$0F40
    dw $0650,$0750
    dw $0E60,$0F60
    dw $0E90,$0F90
    dw $0E20,$0F20
    dw $0EA0,$0FA0
    dw $0650,$0750
    dw $0050,$0150
    dw $0460,$0560
    dw $0880,$0980
    dw $0890,$0990
    dw $0820,$0920
    dw $0830,$0930
    dw $04E0,$0150
    dw $0CB0,$0DB0
    dw $0EF0,$0760
    dw $00F0,$01F0

IntroJapanTextData_Page6: 
; 非常事態だ (it's an emergency)
    dw $0090,$0005
    dw $0AE0,$0BE0
    dw $0AF0,$0BF0
    dw $0C00,$0D00
    dw $0C10,$0D10
    dw $05E0,$01F0

InstList_Mode7Object_Page1:
    dw Instruction_LoadIntroJapanTextPage1 
    dw $0001,Mode7_Transfer_Data 
    dw Instruction_EnableCinematicBGTilemapUpdates_duplicate 
    dw Mode7Objects_Instruction_Delete 

InstList_Mode7Object_Page2_Subpage1:
    dw Instruction_LoadIntroJapanTextPage2_Subpage1 
    dw $0001,Mode7_Transfer_Data 
    dw Instruction_EnableCinematicBGTilemapUpdates_duplicate 
    dw Mode7Objects_Instruction_Delete 

InstList_Mode7Object_Page2_Subpage2:
    dw $0001,Mode7_Transfer_Data 
    dw Mode7Objects_Instruction_GotoY 
    dw InstList_Mode7Object_Page2_Subpage2 

InstList_EnableCinematicBGTilemapUpdates_Page2DoneInput:
    dw Instruction_EnableCinematicBGTilemapUpdates_Page2DoneInput 
    dw Mode7Objects_Instruction_Delete 

InstList_Mode7Object_Page3_Subpage1:
    dw Instruction_LoadIntroJapanTextPage3_Subpage1 
    dw $0001,Mode7_Transfer_Data 
    dw Instruction_EnableCinematicBGTilemapUpdates_duplicate 
    dw Mode7Objects_Instruction_Delete 

InstList_Mode7Object_Page3_Subpage2:
    dw $0001,Mode7_Transfer_Data 
    dw Mode7Objects_Instruction_GotoY 
    dw InstList_Mode7Object_Page3_Subpage2 

InstList_EnableCinematicBGTilemapUpdates_Page3DoneInput:
    dw Instruction_EnableCinematicBGTilemapUpdates_Page3DoneInput 
    dw Mode7Objects_Instruction_Delete 

InstList_Mode7Object_Page4_Subpage1:
    dw Instruction_LoadIntroJapanTextPage4_Subpage1 
    dw $0001,Mode7_Transfer_Data 
    dw Instruction_EnableCinematicBGTilemapUpdates_duplicate 
    dw Mode7Objects_Instruction_Delete 

InstList_Mode7Object_Page4_Subpage2:
    dw $0001,Mode7_Transfer_Data 
    dw Mode7Objects_Instruction_GotoY 
    dw InstList_Mode7Object_Page4_Subpage2 

InstList_EnableCinematicBGTilemapUpdates_Page4DoneInput:
    dw Instruction_EnableCinematicBGTilemapUpdates_Page4DoneInput 
    dw Mode7Objects_Instruction_Delete 

InstList_Mode7Object_Page5_Subpage1:
    dw Instruction_LoadIntroJapanTextPage5_Subpage1 
    dw $0001,Mode7_Transfer_Data 
    dw Instruction_EnableCinematicBGTilemapUpdates_duplicate 
    dw Mode7Objects_Instruction_Delete 

InstList_Mode7Object_Page5_Subpage2:
    dw $0001,Mode7_Transfer_Data 
    dw Mode7Objects_Instruction_GotoY 
    dw InstList_Mode7Object_Page5_Subpage2 

InstList_EnableCinematicBGTilemapUpdates_Page5DoneInput:
    dw Instruction_EnableCinematicBGTilemapUpdates_Page5DoneInput 
    dw Mode7Objects_Instruction_Delete 

InstList_Mode7Object_Page6:
    dw Instruction_LoadIntroJapanTextPage6 
    dw $0001,Mode7_Transfer_Data 
    dw Instruction_EnableCinematicBGTilemapUpdates_duplicate_again 
    dw Mode7Objects_Instruction_Delete 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_Mode7Object_D43D_8BD3F5:
    dw UNUSED_Instruction_LoadIntroJapanText_NonExistent 
    dw $0001,Mode7_Transfer_Data 
    dw Instruction_EnableCinematicBGTilemapUpdates 
    dw Mode7Objects_Instruction_Delete 
endif ; !FEATURE_KEEP_UNREFERENCED

Mode7_Transfer_Data:
    db $00,$00 

Mode7Objects_IntroJapanText_Page1:
    dw RTS_8B93D9 
    dw RTS_8B93D9 
    dw InstList_Mode7Object_Page1 

Mode7Objects_IntroJapanText_Page2_Subpage1:
    dw RTS_8B93D9 
    dw RTS_8B93D9 
    dw InstList_Mode7Object_Page2_Subpage1 

Mode7Objects_IntroJapanText_Page2_Subpage2:
    dw RTS_8B93D9 
    dw Instruction_LoadIntroJapanTextPage2_Subpage2 
    dw InstList_Mode7Object_Page2_Subpage2 

Mode7Objects_IntroJapanText_Page3_Subpage1:
    dw RTS_8B93D9 
    dw RTS_8B93D9 
    dw InstList_Mode7Object_Page3_Subpage1 

Mode7Objects_IntroJapanText_Page3_Subpage2:
    dw RTS_8B93D9 
    dw PreInstruction_LoadIntroJapanTextPage3_Subpage2 
    dw InstList_Mode7Object_Page3_Subpage2 

Mode7Objects_IntroJapanText_Page4_Subpage1:
    dw RTS_8B93D9 
    dw RTS_8B93D9 
    dw InstList_Mode7Object_Page4_Subpage1 

Mode7Objects_IntroJapanText_Page4_Subpage2:
    dw RTS_8B93D9 
    dw PreInstruction_LoadIntroJapanTextPage4_Subpage2 
    dw InstList_Mode7Object_Page4_Subpage2 

Mode7Objects_IntroJaanText_Page5_Subpage1:
    dw RTS_8B93D9 
    dw RTS_8B93D9 
    dw InstList_Mode7Object_Page5_Subpage1 

Mode7Objects_IntroJapanText_Page5_Subpage2:
    dw RTS_8B93D9 
    dw PreInstruction_LoadIntroJapanTextPage5_Subpage2 
    dw InstList_Mode7Object_Page5_Subpage2 

Mode7Objects_IntroJapanText_Page6:
    dw RTS_8B93D9 
    dw RTS_8B93D9 
    dw InstList_Mode7Object_Page6 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Mode7Objects_8BD43D:
    dw RTS_8B93D9 
    dw RTS_8B93D9 
    dw UNUSED_InstList_Mode7Object_D43D_8BD3F5 
endif ; !FEATURE_KEEP_UNREFERENCED

GameState27_EndingAndCredits:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    PEA.W .manualReturn-1 
    JMP.W ($1F51) 


.manualReturn:
    LDA.W $1B9F 
    BMI .zeroTimer 
    INC A 
    STA.W $1B9F 

.zeroTimer:
    INC.W $1A51 
    JSR.W Handle_CinematicSpriteObjects 
    JSR.W HandleFinalScreen_CinematicBGObjects 
    JSR.W Handle_CreditsObject 
    JSL.L PaletteFXObject_Handler 
    JSR.W Draw_CinematicSpriteObjects_EndingCredits 
    JSR.W Handle_ShootingStars 
    JSR.W HandleMode7TransformMatrixAndBG1Position 
    PLB 
    PLP 
    RTL 


HandleFinalScreen_CinematicBGObjects:
    LDA.W $1F51 
    CMP.W #CinematicFunction_PostCredits_FadeFromWhite 
    BMI .return 
    JSR.W Handle_CinematicBGObjects 

.return:
    RTS 


CinematicFunction_Ending_Setup:
    STZ.B $AB 
    STZ.B $A7 
    LDX.W #$0008 

.wait8Frames:
    JSL.L WaitForNMI 
    DEX 
    BPL .wait8Frames 
    JSR.W Setup_PPU_ZebesDestruction 
    LDA.W #$1C1F 
    DEC A 
    DEC A 
    SEC 
    SBC.W #$198D 
    TAX 

.loopClearRAM:
    STZ.W $198D,X 
    DEX 
    DEX 
    BPL .loopClearRAM 
    LDX.W #$0000 

.loopPalettes:
    LDA.L Palettes_CloudSpritesInZebesExplosionScene,X 
    STA.L $7EC000,X 
    INX 
    INX 
    CPX.W #$0200 
    BMI .loopPalettes 
    LDA.W #Tiles_Zebes_Being_Zoomed_Out_during_Zebes_Explosion_Mode7>>8&$FF00 
    STA.B $48 
    LDA.W #Tiles_Zebes_Being_Zoomed_Out_during_Zebes_Explosion_Mode7 
    STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7F0000 
    LDA.W #Tiles_Yellow_Clouds_during_Zebes_Explosion>>8&$FF00 
    STA.B $48 
    LDA.W #Tiles_Yellow_Clouds_during_Zebes_Explosion 
    STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7F4000 
    LDA.W #InterleavedTilesTilemap_ZebesBeingZoomedOutExplosion_Mode7>>8&$FF00 
    STA.B $48 
    LDA.W #InterleavedTilesTilemap_ZebesBeingZoomedOutExplosion_Mode7 
    STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7F8000 
    SEP #$30 
    LDA.B #$00 
    STA.W $2116 
    LDA.B #$00 
    STA.W $2117 
    LDA.B #$80 
    STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl $7F8000 
    dw $4000 
    LDA.B #$02 
    STA.W $420B 
    LDA.B #$00 
    STA.W $2116 
    LDA.B #$20 
    STA.W $2117 
    LDA.B #$80 
    STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl $7F8000 
    dw $4000 
    LDA.B #$02 
    STA.W $420B 
    LDA.B #$00 
    STA.W $2116 
    LDA.B #$60 
    STA.W $2117 
    LDA.B #$80 
    STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl $7F4000 
    dw $4000 
    LDA.B #$02 
    STA.W $420B 
    LDA.B #$00 
    STA.W $2116 
    LDA.B #$00 
    STA.W $2117 
    LDA.B #$80 
    STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$00,$19 
    dl $7F0000 
    dw $4000 
    LDA.B #$02 
    STA.W $420B 
    REP #$30 
    LDA.W #Tiles_Zebes_Explosion>>8&$FF00 
    STA.B $48 
    LDA.W #Tiles_Zebes_Explosion 
    STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7F8000 
    LDA.W #Tiles_Gunship_Ceres_Mode7>>8&$FF00 
    STA.B $48 
    LDA.W #Tiles_Gunship_Ceres_Mode7 
    STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7F0000 
    LDA.W #Gunship_Ceres_Tilemap>>8&$FF00 
    STA.B $48 
    LDA.W #Gunship_Ceres_Tilemap 
    STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7F4000 
    LDX.W #$0300 
    LDA.W #$8C8C 

.loopTilemap:
    STA.L $7F4000,X 
    INX 
    INX 
    CPX.W #$4000 
    BMI .loopTilemap 
    LDA.W #Wide_Part_of_Zebes_Explosion_Tilemap>>8&$FF00 
    STA.B $48 
    LDA.W #Wide_Part_of_Zebes_Explosion_Tilemap 
    STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7FE000 
    LDA.W #Concentric_Wide_Part_of_Zebes_Explosion_Tilemap>>8&$FF00 
    STA.B $48 
    LDA.W #Concentric_Wide_Part_of_Zebes_Explosion_Tilemap 
    STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7FE800 
    LDA.W #Eclipse_of_Zebes_during_Explosion_Tilemap>>8&$FF00 
    STA.B $48 
    LDA.W #Eclipse_of_Zebes_during_Explosion_Tilemap 
    STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7FF000 
    LDA.W #Blank_BG2_Tilemap>>8&$FF00 
    STA.B $48 
    LDA.W #Blank_BG2_Tilemap 
    STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7FF800 
    LDA.W #Tiles_Font3_Background>>8&$FF00 
    STA.B $48 
    LDA.W #Tiles_Font3_Background 
    STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7EA000 
    LDA.W #InterleavedTilesTilemap_GreyCloudsDuringZebesExplosion_Mode7>>8&$FF00 
    STA.B $48 
    LDA.W #InterleavedTilesTilemap_GreyCloudsDuringZebesExplosion_Mode7 
    STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7E2000 
    LDA.W #InterleavedTilesTilemap_BigZebesDuringZebesExplosion_Mode7>>8&$FF00 
    STA.B $48 
    LDA.W #InterleavedTilesTilemap_BigZebesDuringZebesExplosion_Mode7 
    STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7E6000 
    LDA.W #$0100 
    STA.W $211B 
    STA.B $78 
    STZ.W $211C 
    STZ.B $7A 
    STZ.W $211D 
    STZ.B $7C 
    STA.W $211E 
    STA.B $7E 
    LDA.W #$0080 
    STA.W $211F 
    STA.B $80 
    STA.W $2120 
    STA.B $82 
    LDA.W #$0020 
    STA.W $198D 
    LDA.W #$0040 
    STA.W $198F 
    LDA.W #$0000 
    STA.W $1993 
    STA.W $1997 
    STZ.W $078D 
    STZ.W $0911 
    STZ.W $0915 
    JSL.L Clear_PaletteFXObjects 
    JSL.L Enable_PaletteFXObjects 
    JSL.L EnableNMI 
    STZ.W $1A05 
    SEP #$20 
    LDA.B #$11 
    STA.B $69 
    LDA.B #$01 
    STA.B $6B 
    LDA.B #$02 
    STA.B $6F 
    LDA.B #$11 
    STA.B $72 
    REP #$20 
    LDA.W #$0000 
    LDY.W #CinematicSpriteObjectDefinitions_Right 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDA.W #$0000 
    LDY.W #CinematicSpriteObjectDefinitions_Left 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDA.W #$0001 
    LDY.W #CinematicSpriteObjectDefinitions_Right 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDA.W #$0001 
    LDY.W #CinematicSpriteObjectDefinitions_Left 
    JSR.W Spawn_CinematicSpriteObject_Y 
    STZ.W $0723 
    LDA.W #$0002 
    STA.W $0725 
    LDA.W #CinematicFunction_Ending_WaitForMusicToChange 
    STA.W $1F51 
    LDA.W #$0000 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    LDA.W #$FF33 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    LDA.W #$0005 
    LDY.W #$000E 
    JSL.L QueueMusicDataOrTrack_YFrameDelay 
    RTS 


CinematicFunction_Ending_WaitForMusicToChange:
    JSL.L CheckIfMusicIsQueued 
    BCS .return 
    LDY.W #PaletteFXObjects_ExplodingZebesLava 
    JSL.L Spawn_PaletteFXObject 
    LDY.W #PaletteFXObjects_FadeOutExplodingZebesCrust 
    JSL.L Spawn_PaletteFXObject 
    LDA.W #CinematicFunc_Ending_ZebesDestruction0_CloudsOnSide_FadingIn 
    STA.W $1F51 

.return:
    RTS 


CinematicFunc_Ending_ZebesDestruction0_CloudsOnSide_FadingIn:
    JSR.W CinematicFunction_Ending_ZebesDestruction0_CloudsOnSide 
    JSR.W AdvanceFastScreenFadeIn 
    BCC .return 
    LDA.W #CinematicFunction_Ending_ZebesDestruction0_CloudsOnSide 
    STA.W $1F51 

.return:
    RTS 


CinematicFunction_Ending_ZebesDestruction0_CloudsOnSide:
    LDA.W $1A51 
    BIT.W #$0001 
    BNE .zoomOut 
    LDA.W $198D 
    SEC 
    SBC.W #$0001 
    AND.W #$00FF 
    STA.W $198D 

.zoomOut:
    LDA.W $198F 
    CLC 
    ADC.W #$0002 
    STA.W $198F 
    CMP.W #$0180 
    BMI .return 
    JSR.W AdvanceFastScreenFadeOut 
    BCC .return 
    LDA.W #CineFunc_Ending_ZebesDestruction1_CloudsOnTopBottom_Setup 
    STA.W $1F51 

.return:
    RTS 


CineFunc_Ending_ZebesDestruction1_CloudsOnTopBottom_Setup:
    SEP #$30 
    LDA.B #$00 
    STA.W $2116 
    LDA.B #$00 
    STA.W $2117 
    LDA.B #$80 
    STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl $7E2000 
    dw $4000 
    LDA.B #$02 
    STA.W $420B 
    LDA.B #$00 
    STA.W $2116 
    LDA.B #$20 
    STA.W $2117 
    LDA.B #$80 
    STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl $7E2000 
    dw $4000 
    LDA.B #$02 
    STA.W $420B 
    REP #$30 
    LDA.W #Tiles_Grey_Clouds_during_Zebes_Explosion_Mode7>>8&$FF00 
    STA.B $48 
    LDA.W #Tiles_Grey_Clouds_during_Zebes_Explosion_Mode7 
    STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7E2000 
    SEP #$30 
    LDA.B #$00 
    STA.W $2116 
    LDA.B #$00 
    STA.W $2117 
    LDA.B #$80 
    STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$00,$19 
    dl $7E2000 
    dw $4000 
    LDA.B #$02 
    STA.W $420B 
    REP #$30 
    JSL.L Clear_PaletteFXObjects 
    JSR.W Clear_CinematicSpriteObjects 
    LDY.W #PaletteFXObjects_FadeOutExplodingZebesGreyClouds 
    JSL.L Spawn_PaletteFXObject 
    LDA.W #$0000 
    LDY.W #CinematicSpriteObjectDefinitions_YellowClouds_Top_TopHalf 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDA.W #$0000 
    LDY.W #CinematicSpriteObjectDefinitions_Top_BottomHalf 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDA.W #$0000 
    LDY.W #CinematicSpriteObjectDefinitions_Bottom_TopHalf 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDA.W #$0000 
    LDY.W #CinematicSpriteObjectDefinitions_Bottom_BottomHalf 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDA.W #$0020 
    STA.W $198D 
    LDA.W #$0040 
    STA.W $198F 
    LDA.W #$0000 
    STA.W $1993 
    STA.W $1997 
    LDA.W #CineFunc_Ending_ZebesDestruction1_CloudsOnTopBottom_FadingIn 
    STA.W $1F51 
    RTS 


CineFunc_Ending_ZebesDestruction1_CloudsOnTopBottom_FadingIn:
    JSR.W CinematicFunction_Ending_ZebesDestruction1_CloudsOnTopBottom 
    JSR.W AdvanceFastScreenFadeIn 
    BCC .return 
    LDA.W #CinematicFunction_Ending_ZebesDestruction1_CloudsOnTopBottom 
    STA.W $1F51 

.return:
    RTS 


CinematicFunction_Ending_ZebesDestruction1_CloudsOnTopBottom:
    LDA.W $1A51 
    BIT.W #$0001 
    BNE + 
    LDA.W $198D 
    SEC 
    SBC.W #$0001 
    AND.W #$00FF 
    STA.W $198D 

  + LDA.W $198F 
    CLC 
    ADC.W #$0003 
    STA.W $198F 
    CMP.W #$0180 
    BMI .return 
    JSR.W AdvanceFastScreenFadeOut 
    BCC .return 
    LDA.W #CinematicFunc_Ending_ZebesDestruction2_CrossFade_Setup 
    STA.W $1F51 

.return:
    RTS 


CinematicFunc_Ending_ZebesDestruction2_CrossFade_Setup:
    SEP #$30 
    LDA.B #$00 
    STA.W $2116 
    LDA.B #$00 
    STA.W $2117 
    LDA.B #$80 
    STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl $7E6000 
    dw $4000 
    LDA.B #$02 
    STA.W $420B 
    LDA.B #$00 
    STA.W $2116 
    LDA.B #$20 
    STA.W $2117 
    LDA.B #$80 
    STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl $7E6000 
    dw $4000 
    LDA.B #$02 
    STA.W $420B 
    REP #$30 
    LDA.W #Tiles_Big_Zebes_during_Zebes_Explosion>>8&$FF00 
    STA.B $48 
    LDA.W #Tiles_Big_Zebes_during_Zebes_Explosion 
    STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7E6000 
    SEP #$30 
    LDA.B #$00 
    STA.W $2116 
    LDA.B #$00 
    STA.W $2117 
    LDA.B #$80 
    STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$00,$19 
    dl $7E6000 
    dw $4000 
    LDA.B #$02 
    STA.W $420B 
    LDA.B #$00 
    STA.W $2116 
    LDA.B #$40 
    STA.W $2117 
    LDA.B #$80 
    STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl $7F8000 
    dw $6000 
    LDA.B #$02 
    STA.W $420B 
    LDA.B #$00 
    STA.W $2116 
    LDA.B #$70 
    STA.W $2117 
    LDA.B #$80 
    STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl $7FE000 
    dw $0800 
    LDA.B #$02 
    STA.W $420B 
    LDA.B #$00 
    STA.W $2116 
    LDA.B #$74 
    STA.W $2117 
    LDA.B #$80 
    STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl $7FE800 
    dw $0800 
    LDA.B #$02 
    STA.W $420B 
    LDA.B #$00 
    STA.W $2116 
    LDA.B #$78 
    STA.W $2117 
    LDA.B #$80 
    STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl $7FF000 
    dw $0800 
    LDA.B #$02 
    STA.W $420B 
    LDA.B #$00 
    STA.W $2116 
    LDA.B #$7C 
    STA.W $2117 
    LDA.B #$80 
    STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl $7FF800 
    dw $0800 
    LDA.B #$02 
    STA.W $420B 
    LDA.B #$00 
    STA.W $2116 
    LDA.B #$50 
    STA.W $2117 
    LDA.B #$80 
    STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl $7EA000 
    dw $1000 
    LDA.B #$02 
    STA.W $420B 
    LDA.B #$02 
    STA.B $52 
    REP #$30 
    JSL.L Clear_PaletteFXObjects 
    JSR.W Clear_CinematicSpriteObjects 
    LDX.W #$0100 

.loopPalettes:
    LDA.L Palettes_ZebesExplosionScene,X 
    STA.L $7EC000,X 
    INX 
    INX 
    CPX.W #$0200 
    BMI .loopPalettes 
    LDY.W #CinematicSpriteObjectDefinitions_ExplodingZebes_Zebes 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDY.W #CinematicSpriteObjectDefinitions_ExplodingZebes_Lava 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDY.W #CinematicSpriteObjectDefinitions_ExplodingZebes_PurpleGlow 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDY.W #CinematicSpriteObjectDefinitions_ExplodingZebes_Stars 
    JSR.W Spawn_CinematicSpriteObject_Y 
    STZ.W $198D 
    LDA.W #$0040 
    STA.W $198F 
    LDA.W #$0100 
    STA.B $78 
    STZ.B $7A 
    STZ.B $7C 
    STA.B $7E 
    LDA.W #$0080 
    STA.B $80 
    STA.B $82 
    STZ.W $1993 
    STZ.W $1997 
    SEP #$20 
    LDA.B #$01 
    STA.B $69 
    LDA.B #$10 
    STA.B $6B 
    LDA.B #$02 
    STA.B $6F 
    LDA.B #$21 
    STA.B $72 
    REP #$20 
    JSR.W PaletteCrossFading_CopyCurrentPalettesToFadingPalettes 
    JSR.W PaletteCrossFading_DecomposePaletteDataForFading 
    LDX.W #$01A0 
    LDY.W #$0010 
    JSR.W PaletteCrossFading_ClearYColorsStartingFromColorIndexX 
    LDX.W #$01E0 
    LDY.W #$0010 
    JSR.W PaletteCrossFading_ClearYColorsStartingFromColorIndexX 
    JSR.W PaletteCrossFading_ComposeFadingPalettes 
    LDA.W #$003F 
    STA.W $1A49 
    LDA.W #CinematicFunc_Ending_ZebesDestruction2_CrossFade_FadingIn 
    STA.W $1F51 
    RTS 


CinematicFunc_Ending_ZebesDestruction2_CrossFade_FadingIn:
    JSR.W CinematicFunction_Ending_ZebesDestruction2_CrossFade 
    JSR.W AdvanceFastScreenFadeIn 
    BCC .return 
    LDA.W #$0002 
    STA.W $0723 
    STA.W $0725 
    LDA.W #CinematicFunction_Ending_ZebesDestruction2_CrossFade 
    STA.W $1F51 

.return:
    RTS 


CinematicFunction_Ending_ZebesDestruction2_CrossFade:
    LDA.W $198F 
    CLC 
    ADC.W #$0004 
    STA.W $198F 
    LDA.W $1A49 
    BIT.W #$0001 
    BNE .decTimer 
    LDX.W #$00E0 
    LDY.W #$0010 
    JSR.W PaletteCrossFading_FadeOutYColorsStartingFromColorIndexX 
    LDX.W #$01A0 
    LDY.W #$0010 
    JSR.W PaletteCrossFading_FadeInYColorsStartingFromColorIndexX 
    LDX.W #$01E0 
    LDY.W #$0010 
    JSR.W PaletteCrossFading_FadeInYColorsStartingFromColorIndexX 
    JSR.W PaletteCrossFading_ComposeFadingPalettes 

.decTimer:
    DEC.W $1A49 
    BMI .setupLoop 
    JMP.W .return 


.setupLoop:
    LDX.W #$0000 

.loopPalettes:
    LDA.L Palettes_ZebesExplosionScene,X 
    STA.L $7EC000,X 
    INX 
    INX 
    CPX.W #$0100 
    BMI .loopPalettes 
    SEP #$20 
    STZ.B $5F 
    LDA.B #$70 
    STA.B $58 
    LDA.B #$78 
    STA.B $59 
    STZ.B $5A 
    STZ.B $5C 
    LDA.B #$44 
    STA.B $5D 
    STZ.B $5E 
    LDA.B #$10 
    STA.B $69 
    STZ.B $6B 
    STZ.B $6C 
    STZ.B $6D 
    STZ.B $6E 
    STZ.B $71 
    STZ.B $6F 
    STZ.B $72 
    LDA.B #$E0 
    STA.W $2132 
    LDA.B #$20 
    STA.B $74 
    LDA.B #$40 
    STA.B $75 
    LDA.B #$80 
    STA.B $76 
    STZ.B $57 
    REP #$20 
    STZ.W $1991 
    STZ.W $1993 
    STZ.W $1995 
    STZ.W $1997 
    STZ.W $1999 
    STZ.W $199B 
    STZ.W $199D 
    STZ.W $199F 
    STZ.W $1982 
    STZ.B $B5 
    STZ.B $B7 
    STZ.W $0723 
    LDA.W #$0002 
    STA.W $0725 
    LDA.W #CinematicFunc_Ending_SpaceView_LoadGunshipBG 
    STA.W $1F51 
    STZ.W $1A49 

.return:
    RTS 


CinematicFunc_Ending_SpaceView_LoadGunshipBG:
    LDA.W $1A49 
    CMP.W #$0008 
    BPL .timerGreaterThan7 
    ASL A 
    TAX 
    LDY.W $0334 
    LDA.W #$00C0 
    STA.W $02D0,Y 
    LDA.W .sourceAddresses,X 
    STA.W $02D1,Y 
    LDA.W #$007F 
    STA.W $02D3,Y 
    LDA.W #$0800 
    STA.W $02D4,Y 
    LDA.W .destinationAddresses,X 
    STA.W $02D6,Y 
    LDA.W #$0080 
    STA.W $02D8,Y 
    TYA 
    CLC 
    ADC.W #$0009 
    STA.W $0334 
    BRA + 


.timerGreaterThan7:
    ASL A 
    TAX 
    LDY.W $0334 
    LDA.W #$0080 
    STA.W $02D0,Y 
    LDA.W .sourceAddresses,X 
    STA.W $02D1,Y 
    LDA.W #$007F 
    STA.W $02D3,Y 
    LDA.W #$0800 
    STA.W $02D4,Y 
    LDA.W .destinationAddresses,X 
    STA.W $02D6,Y 
    LDA.W #$0000 
    STA.W $02D8,Y 
    TYA 
    CLC 
    ADC.W #$0009 
    STA.W $0334 

  + LDA.W $1A49 
    INC A 
    STA.W $1A49 
    CMP.W #$0010 
    BMI .return 
    SEP #$20 
    LDA.B #$01 
    STA.B $55 
    REP #$20 
    STZ.W $1A49 
    LDA.W #RTS_8BDB9D 
    STA.W $1F51 

.return:
    RTS 

.sourceAddresses:                                                        
    dw $0000,$0800,$1000,$1800,$2000,$2800,$3000,$3800 ; Tiles source addresses (bank $7F)
    dw $4000,$4800,$5000,$5800,$6000,$6800,$7000,$7800 ; Tilemap source addresses (bank $7F)
.destinationAddresses:
    dw $0000,$0800,$1000,$1800,$2000,$2800,$3000,$3800 ; Tiles destination addresses (VRAM)
    dw $0000,$0800,$1000,$1800,$2000,$2800,$3000,$3800 ; Tilemap destination addresses (VRAM)


RTS_8BDB9D:
    RTS 


CinematicFunc_Ending_SpaceView_ChangeMusic:
    DEC.W $1A49 
    BEQ .changeMusic 
    BPL .return 

.changeMusic:
    LDA.W #$0000 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    LDA.W #$FF3C 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    LDA.W #$0005 
    LDY.W #$000E 
    JSL.L QueueMusicDataOrTrack_YFrameDelay 
    LDA.W #CinematicFunc_Ending_SpaceView_GunshipEmergence_Setup 
    STA.W $1F51 

.return:
    RTS 


CinematicFunc_Ending_SpaceView_GunshipEmergence_Setup:
    JSL.L CheckIfMusicIsQueued 
    BCC .noMusicQueued 
    RTS 


.noMusicQueued:
    SEP #$20 
    LDA.B #$07 
    STA.B $55 
    LDA.B #$80 
    STA.B $5F 
    LDA.B #$11 
    STA.B $69 
    STZ.B $6B 
    STZ.B $6F 
    LDA.B #$30 
    STA.B $72 
    LDA.B #$3F 
    STA.B $74 
    LDA.B #$5F 
    STA.B $75 
    LDA.B #$9F 
    STA.B $76 
    LDA.B #$00 
    STA.B $58 
    LDA.B #$00 
    STA.B $5D 
    REP #$20 
    LDA.W #$0000 
    STA.L $7EC000 
    STA.L $7EC020 
    STA.L $7EC100 
    LDY.W #PaletteFXObjects_ZebesExplosionPlanetAfterglow 
    JSL.L Spawn_PaletteFXObject 
    LDY.W #PaletteFXObjects_GunshipEmergineFromZebesExplosion 
    JSL.L Spawn_PaletteFXObject 
    LDA.W #$0038 
    STA.B $80 
    LDA.W #$0018 
    STA.B $82 
    LDA.W #$FFB8 
    STA.W $1993 
    LDA.W #$FF98 
    STA.W $1997 
    LDA.W #$0C00 
    STA.W $198F 
    LDA.W #$FF90 
    STA.W $198D 
    LDA.W #$0001 
    STA.W $1A49 
    LDA.W #$00C0 
    STA.W $1A4B 
    STZ.W $1A4D 
    LDA.W #CinematicFunc_Ending_SpaceView_GunshipEmergence_SpinningFast 
    STA.W $1F51 
    RTS 


FadeOut_ZebesExplosion_AfterGlow:
    PHP 
    REP #$30 
    DEC.W $1A49 
    BEQ .timerExpired 
    BPL .return 

.timerExpired:
    SEP #$20 
    LDA.B $74 
    SEC 
    SBC.B #$01 
    STA.B $74 
    CMP.B #$20 
    BPL + 
    LDA.B #$20 
    STA.B $74 

  + LDA.B $75 
    SEC 
    SBC.B #$01 
    STA.B $75 
    CMP.B #$40 
    BPL + 
    LDA.B #$40 
    STA.B $75 

  + LDA.B $76 
    SEC 
    SBC.B #$01 
    STA.B $76 
    CMP.B #$80 
    BPL .checkColors 
    LDA.B #$80 
    STA.B $76 

.checkColors:
    LDA.B $74 
    CMP.B #$20 
    BNE .setTimer 
    LDA.B $75 
    CMP.B #$40 
    BNE .setTimer 
    LDA.B $76 
    CMP.B #$80 
    BNE .setTimer 
    STZ.B $6F 
    STZ.B $72 

.setTimer:
    REP #$20 
    LDA.W #$0008 
    STA.W $1A49 

.return:
    PLP 
    RTS 


CinematicFunc_Ending_SpaceView_GunshipEmergence_SpinningFast:
    LDA.W $1A4B 
    BEQ .fadeOutAfterGlow 
    DEC A 
    STA.W $1A4B 
    BRA .timerExpired 


.fadeOutAfterGlow:
    JSR.W FadeOut_ZebesExplosion_AfterGlow 

.timerExpired:
    LDA.W $198D 
    SEC 
    SBC.W #$0004 
    AND.W #$00FF 
    STA.W $198D 
    LDA.W $1A4D 
    ASL #2
    TAX 
    LDA.W $1991 
    CLC 
    ADC.W .shakingXVelocities+2,X 
    STA.W $1991 
    LDA.W $1993 
    ADC.W .shakingXVelocities,X 
    STA.W $1993 
    LDA.W $1A4D 
    INC A 
    AND.W #$000F 
    STA.W $1A4D 
    LDA.W $198F 
    SEC 
    SBC.W #$0008 
    STA.W $198F 
    CMP.W #$05B0 
    BPL .return 
    LDA.W #$0001 
    STA.W $1A4B 
    STZ.W $1A4D 
    LDA.W #CinematicFunc_Ending_SpaceView_GunshipEmergence_SpinningSlow 
    STA.W $1F51 

.return:
    RTS 


.shakingXVelocities:
    dw $0000,$8000, $0000,$8000, $0000,$8000, $0000,$8000 
    dw $FFFF,$8000, $FFFF,$8000, $0000,$8000, $0000,$8000 
    dw $0000,$8000, $0000,$8000, $FFFF,$8000, $FFFF,$8000 
    dw $0000,$8000, $0000,$8000, $FFFF,$8000, $FFFF,$8000 

CinematicFunc_Ending_SpaceView_GunshipEmergence_SpinningSlow:
    JSR.W FadeOut_ZebesExplosion_AfterGlow 
    LDA.W $198D 
    CMP.W #$00E0 
    BEQ .notE0 
    SEC 
    SBC.W #$0001 
    AND.W #$00FF 
    STA.W $198D 

.notE0:
    LDA.W $1A4D 
    ASL #2
    TAX 
    LDA.W $1991 
    CLC 
    ADC.W .shakingXVelocities+2,X 
    STA.W $1991 
    LDA.W $1993 
    ADC.W .shakingXVelocities,X 
    STA.W $1993 
    LDA.W $1A4D 
    INC A 
    AND.W #$0007 
    STA.W $1A4D 
    LDA.W $198F 
    SEC 
    SBC.W #$0002 
    STA.W $198F 
    CMP.W #$04A0 
    BPL .return 
    LDA.W #CinematicFunc_Ending_SpaceView_GunshipEmergence_FlyToCamera 
    STA.W $1F51 
    LDA.W #$8000 
    STA.W $1A4D 
    STZ.W $1A4B 
    LDA.W #$000F 
    JSL.L CheckIfEvent_inA_HasHappened 
    BCC .return 
    LDY.W #CinematicSpriteObjectDefinitions_CrittersEscape 
    LDA.W #$0004 
    STA.B $12 
    JSR.W Spawn_CinematicSpriteObject_YToIndex12 

.return:
    RTS 


.shakingXVelocities:
    db $01,$00,$00,$00,$01,$00,$00,$00,$01,$00,$00,$00,$FF,$FF,$00,$00 
    db $FF,$FF,$00,$00,$01,$00,$00,$00,$01,$00,$00,$00,$FF,$FF,$00,$00 

CinematicFunc_Ending_SpaceView_GunshipEmergence_FlyToCamera:
    JSR.W FadeOut_ZebesExplosion_AfterGlow 
    LDA.W $1A4D 
    SEC 
    SBC.W #$0100 
    STA.W $1A4D 
    LDA.W $1A4B 
    SBC.W #$0000 
    STA.W $1A4B 
    LDA.W $1991 
    CLC 
    ADC.W $1A4D 
    STA.W $1991 
    LDA.W $1993 
    ADC.W $1A4B 
    STA.W $1993 
    LDA.W $198F 
    CMP.W #$0180 
    BPL + 
    LDA.W $1A51 
    BIT.W #$0003 
    BNE + 
    LDA.W $198D 
    CMP.W #$0010 
    BEQ + 
    CLC 
    ADC.W #$0002 
    AND.W #$00FF 
    STA.W $198D 

  + LDA.W $198F 
    CMP.W #$0020 
    BMI .zoomLessThan20 
    SEC 
    SBC.W #$0004 
    STA.W $198F 
    RTS 


.zoomLessThan20:
    LDY.W #CinematicSpriteObjectDefinitions_TheOperationWas 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDA.W #RTS_8BDE63 
    STA.W $1F51 
    LDX.W #$001E 

.loopPalette:
    LDA.W .greyGunshipPalette,X 
    STA.L $7EC0A0,X 
    DEX 
    DEX 
    BPL .loopPalette 
    RTS 

.greyGunshipPalette:
    dw $0000,$6F7B,$4A52,$1CE7,$0000,$5AD6,$4A52,$35AD 
    dw $2529,$7FFF,$56B5,$294A,$4210,$2D6B,$18C6,$7FFF 


RTS_8BDE63:
    RTS 


CinematicFunction_Ending_SpaceView_GunshipEmergence_Credits:
    LDA.W #$0001 
    STA.W $0725 
    JSR.W AdvanceFastScreenFadeOut 
    BCC .return 
    JSL.L EnableNMI 
    STZ.W $0723 
    STZ.W $0725 
    LDA.W #CinematicFunction_Credits_Setup 
    STA.W $1F51 

.return:
    RTS 


CinematicFunction_Credits_Setup:
    JSR.W Setup_PPU_Credits 
    JSR.W Clear_CinematicSpriteObjects 
    JSL.L Clear_PaletteFXObjects 
    LDX.W #$0000 

.loopPalettes:
    LDA.L Palettes_Credits,X 
    STA.L $7EC000,X 
    INX 
    INX 
    CPX.W #$0100 
    BMI .loopPalettes 
    LDA.W #Tiles_Samus_Waiting_for_Credits_to_End>>8&$FF00 
    STA.B $48 
    LDA.W #Tiles_Samus_Waiting_for_Credits_to_End 
    STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7F0000 
    LDA.W #Tiles_PostCredits_SuitlessSamus>>8&$FF00 
    STA.B $48 
    LDA.W #Tiles_PostCredits_SuitlessSamus 
    STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7E2000 
    LDA.W #Tiles_PostCredits_Samus_Shooting_the_Screen>>8&$FF00 
    STA.B $48 
    LDA.W #Tiles_PostCredits_Samus_Shooting_the_Screen 
    STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7E6000 
    LDA.W #Tiles_Font3_Background>>8&$FF00 
    STA.B $48 
    LDA.W #Tiles_Font3_Background 
    STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7FC000 
    LDA.W #Samus_Waiting_for_Credits_to_End_Tilemap>>8&$FF00 
    STA.B $48 
    LDA.W #Samus_Waiting_for_Credits_to_End_Tilemap 
    STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7FE000 
    LDA.W #InterleavedTilesTilemapPostCreditsSamusBeamMode7>>8&$FF00 
    STA.B $48 
    LDA.W #InterleavedTilesTilemapPostCreditsSamusBeamMode7 
    STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7F4000 
    LDA.W #Tiles_PostCredits_Samus_Transformation_Effect>>8&$FF00 
    STA.B $48 
    LDA.W #Tiles_PostCredits_Samus_Transformation_Effect 
    STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7FE800 
    LDA.W #PostCredits_Samus_Transformation_Effect_Tilemap>>8&$FF00 
    STA.B $48 
    LDA.W #PostCredits_Samus_Transformation_Effect_Tilemap 
    STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7FF000 
    SEP #$30 
    LDA.B #$00 
    STA.W $2116 
    LDA.B #$20 
    STA.W $2117 
    LDA.B #$80 
    STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl $7FE800 
    dw $0100 
    LDA.B #$02 
    STA.W $420B 
    LDA.B #$00 
    STA.W $2116 
    LDA.B #$24 
    STA.W $2117 
    LDA.B #$80 
    STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl $7FF000 
    dw $0800 
    LDA.B #$02 
    STA.W $420B 
    LDA.B #$00 
    STA.W $2116 
    LDA.B #$40 
    STA.W $2117 
    LDA.B #$80 
    STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl $7FC000 
    dw $1000 
    LDA.B #$02 
    STA.W $420B 
    LDA.B #$00 
    STA.W $2116 
    LDA.B #$60 
    STA.W $2117 
    LDA.B #$80 
    STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl $7E6000 
    dw $4000 
    LDA.B #$02 
    STA.W $420B 
    LDA.B #$00 
    STA.W $2116 
    LDA.B #$50 
    STA.W $2117 
    LDA.B #$80 
    STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl $7F0000 
    dw $2000 
    LDA.B #$02 
    STA.W $420B 
    LDA.B #$00 
    STA.W $2116 
    LDA.B #$4C 
    STA.W $2117 
    LDA.B #$80 
    STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl $7FE000 
    dw $0800 
    LDA.B #$02 
    STA.W $420B 
    REP #$30 
    LDA.W #Tiles_PostCredits_SuperMetroid_Icon>>8&$FF00 
    STA.B $48 
    LDA.W #Tiles_PostCredits_SuperMetroid_Icon 
    STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7E6000 
    LDA.W #PostCredits_SuperMetroid_Icon_Tilemap>>8&$FF00 
    STA.B $48 
    LDA.W #PostCredits_SuperMetroid_Icon_Tilemap 
    STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7E8000 
    LDA.W $09E0 
    CMP.W #$0003 
    BPL .gameTimeOver3 
    SEP #$30 
    LDA.B #$00 
    STA.W $2116 
    LDA.B #$00 
    STA.W $2117 
    LDA.B #$80 
    STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl $7E2000 
    dw $4000 
    LDA.B #$02 
    STA.W $420B 
    BRA + 


.gameTimeOver3:
    SEP #$30 
    LDA.B #$00 
    STA.W $2116 
    LDA.B #$00 
    STA.W $2117 
    LDA.B #$80 
    STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl $7F0000 
    dw $4000 
    LDA.B #$02 
    STA.W $420B 

  + REP #$30 
    LDA.W #$0100 
    STA.W $211B 
    STA.B $78 
    STZ.W $211C 
    STZ.B $7A 
    STZ.W $211D 
    STZ.B $7C 
    STA.W $211E 
    STA.B $7E 
    LDA.W #$0068 
    STA.W $211F 
    STA.B $80 
    LDA.W #$0070 
    STA.W $2120 
    STA.B $82 
    LDA.W #$FFF8 
    STA.W $1993 
    LDA.W #$FFE8 
    STA.W $1997 
    STZ.W $198D 
    LDA.W #$0900 
    STA.W $198F 
    JSL.L EnableNMI 
    SEP #$20 
    LDA.B #$0F 
    STA.B $51 
    REP #$20 
    STZ.W $0911 
    STZ.W $0915 
    JSL.L Enable_HDMAObjects 
    LDX.W #$01FE 
    LDA.W #$0000 

.loop:
    STA.L $7E9800,X 
    DEX 
    DEX 
    BPL .loop 
    JSR.W Initialize_ShootingStars 
    LDA.W #Credits_Tilemap>>8&$FF00 
    STA.B $48 
    LDA.W #Credits_Tilemap 
    STA.B $47 
    JSL.L Decompression_HardcodedDestination 
    dl $7F0000 
    LDA.W #$007F 
    JSL.L Clear_CinematicBGObjects_CinematicBGTilemap 
    LDA.W #$007F 
    JSR.W Clear_CreditsObject_CinematicBGTilemapInA 
    JSR.W Enable_CreditsObject 
    LDA.W #$0003 
    STA.W $0723 
    STA.W $0725 
    LDY.W #CreditsObjectDefinition 
    JSR.W Spawn_CreditsObject 
    LDA.W #RTS_8BDB9D 
    STA.W $1F51 
    RTS 


CinematicFunction_PostCredits_BlankScreen:
    DEC.W $1A49 
    BEQ .timerExpired 
    BPL .return 

.timerExpired:
    LDA.W #CinematicFunction_PostCredits_FadeInShootingStars 
    STA.W $1F51 
    LDA.W #$0078 
    STA.W $1A49 
    SEP #$20 
    LDA.B #$10 
    STA.B $69 
    REP #$20 

.return:
    RTS 


CinematicFunction_PostCredits_FadeInShootingStars:
    JSL.L HandleFadingIn 
    SEP #$20 
    LDA.B $51 
    CMP.B #$0F 
    BEQ .fadedIn 
    REP #$20 
    RTS 


.fadedIn:
    SEP #$20 
    LDA.B #$02 
    STA.B $69 
    LDA.B #$10 
    STA.B $6B 
    LDA.B #$02 
    STA.B $6F 
    LDA.B #$22 
    STA.B $72 
    REP #$20 
    STZ.W $0723 
    STZ.W $0725 
    JSR.W PaletteCrossFading_CopyCurrentPalettesToFadingPalettes 
    JSR.W PaletteCrossFading_DecomposePaletteDataForFading 
    LDX.W #$0040 
    LDY.W #$0010 
    JSR.W PaletteCrossFading_ClearYColorsStartingFromColorIndexX 
    JSR.W PaletteCrossFading_ComposeFadingPalettes 
    LDA.W #$0020 
    STA.W $1A49 
    LDA.W #CinematicFunction_PostCredits_FadeInSamus 
    STA.W $1F51 
    RTS 


CinematicFunction_PostCredits_FadeInSamus:
    LDX.W #$0040 
    LDY.W #$0010 
    JSR.W PaletteCrossFading_FadeInYColorsStartingFromColorIndexX 
    JSR.W PaletteCrossFading_ComposeFadingPalettes 
    DEC.W $1A49 
    BEQ .timerExpired 
    BPL .return 

.timerExpired:
    SEP #$20 
    LDA.B #$12 
    STA.B $69 
    LDA.B #$04 
    STA.B $6B 
    LDA.B #$02 
    STA.B $6F 
    LDA.B #$02 
    STA.B $72 
    REP #$20 
    LDA.W #$00B4 
    STA.W $1A49 
    LDA.W #CinematicFunction_PostCredits_WavySamus 
    STA.W $1F51 
    JSL.L Spawn_WavySamus_HDMAObject 

.return:
    RTS 


CinematicFunction_PostCredits_WavySamus:
    LDA.B $BB 
    CLC 
    ADC.W #$0002 
    STA.B $BB 
    DEC.W $1A49 
    BEQ .timerExpired 
    BPL .return 

.timerExpired:
    LDX.W #$0000 

.loopTilemap:
    LDA.L Tilemap_PostCredits_DeeRForCe,X 
    STA.L $7E3240,X 
    INX 
    INX 
    CPX.W #$0240 
    BMI .loopTilemap 
    JSR.W CinematicBGObjects_Update32x32CinematicBGTilemap 
    SEP #$20 
    LDA.B #$01 
    STA.B $69 
    STZ.B $6B 
    STZ.B $6F 
    STZ.B $72 
    REP #$20 
    LDA.W #$00B4 
    STA.W $1A49 
    LDA.W #CinematicFunction_PostCredits_DeerForce 
    STA.W $1F51 
    STZ.W $0D9C 

.return:
    RTS 


CinematicFunction_PostCredits_DeerForce:
    DEC.W $1A49 
    BEQ .decTimer 
    JMP.W .return 


.decTimer:
    LDA.W #$007F 
    STA.W $1A49 
    LDA.W $09E0 
    CMP.W #$0003 
    BMI .bestEnding 
    CMP.W #$000A 
    BMI .mediocreEnding 
    LDY.W #CinematicSpriteObjectDefs_SuitedSamus_Idle_Head_Helmet 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDY.W #CinematicSpriteObjectDefinitions_SuitedSamus_Idle_Body 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDA.W #CinematicFunction_PostCredits_IdleSamus1 
    STA.W $1F51 
    SEP #$20 
    LDA.B #$10 
    STA.B $69 
    STZ.B $6B 
    STZ.B $6F 
    STZ.B $72 
    REP #$20 
    BRA .return 


.mediocreEnding:
    JSR.W PaletteCrossFading_CopyCurrentPalettesToFadingPalettes 
    JSR.W PaletteCrossFading_DecomposePaletteDataForFading 
    LDY.W #CinematicSpriteObjectDefinitions_SuitedSamus_Idle_Head 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDY.W #CinematicSpriteObjectDefinitions_SuitedSamus_Idle_Body 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDX.W #$01C0 
    LDY.W #$0010 
    JSR.W PaletteCrossFading_ClearYColorsStartingFromColorIndexX 
    BRA .notWorstEnding 


.bestEnding:
    JSR.W PaletteCrossFading_CopyCurrentPalettesToFadingPalettes 
    JSR.W PaletteCrossFading_DecomposePaletteDataForFading 
    LDY.W #CinematicSpriteObjectDefinitions_SuitlessSamus_Idle 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDY.W #CinematicSpriteObjectDefinitions_SuitlessSamus_Idle_Legs 
    JSR.W Spawn_CinematicSpriteObject_Y 

.notWorstEnding:
    LDX.W #$01A0 
    LDY.W #$0010 
    JSR.W PaletteCrossFading_ClearYColorsStartingFromColorIndexX 
    JSR.W PaletteCrossFading_ComposeFadingPalettes 
    SEP #$20 
    LDA.B #$02 
    STA.B $69 
    LDA.B #$10 
    STA.B $6B 
    LDA.B #$02 
    STA.B $6F 
    LDA.B #$22 
    STA.B $72 
    REP #$20 
    LDA.W #CinematicFunc_PostCredits_IdleSamus_1_CrossFadeOutSamusSuit 
    STA.W $1F51 

.return:
    RTS 


CinematicFunc_PostCredits_IdleSamus_1_CrossFadeOutSamusSuit:
    LDA.W $1A49 
    BIT.W #$0003 
    BNE CinematicFunction_PostCredits_IdleSamus1 
    LDX.W #$0040 
    LDY.W #$0010 
    JSR.W PaletteCrossFading_FadeOutYColorsStartingFromColorIndexX 
    LDA.W $09E0 
    CMP.W #$0003 
    BMI .lessThan3 
    LDX.W #$01C0 
    LDY.W #$0010 
    JSR.W PaletteCrossFading_FadeInYColorsStartingFromColorIndexX 

.lessThan3:
    LDX.W #$01A0 
    LDY.W #$0010 
    JSR.W PaletteCrossFading_FadeInYColorsStartingFromColorIndexX 
    JSR.W PaletteCrossFading_ComposeFadingPalettes ; fallthrough to CinematicFunction_PostCredits_IdleSamus1

CinematicFunction_PostCredits_IdleSamus1:
    LDA.W $1A49 
    DEC A 
    STA.W $1A49 
    CMP.W #$0041 
    BPL .return 
    LDX.W #$023E 
    LDA.W #$007F 

.loopTilemap9:
    STA.L $7E3240,X 
    DEX 
    DEX 
    BPL .loopTilemap9 
    LDX.W #$0000 

.loopTilemapC:
    LDA.L Tilemap_PostCredits_1994Nintendo,X 
    STA.L $7E3300,X 
    INX 
    INX 
    CPX.W #$0080 
    BMI .loopTilemapC 
    JSR.W CinematicBGObjects_Update32x32CinematicBGTilemap 
    SEP #$20 
    LDA.B #$01 
    STA.B $69 
    STZ.B $6B 
    STZ.B $6F 
    STZ.B $72 
    REP #$20 
    LDA.W #$00B4 
    STA.W $1A4B 
    LDA.W #CinematicFunction_PostCredits_1994Nintendo 
    STA.W $1F51 

.return:
    RTS 


CinematicFunction_PostCredits_1994Nintendo:
    DEC.W $1A4B 
    BEQ .timerExpired 
    BPL .return 

.timerExpired:
    LDA.W $09E0 
    CMP.W #$0003 
    BMI .gameTimeOver10 
    CMP.W #$000A 
    BMI .gameTimeOver10 
    LDA.W #CinematicFunction_PostCredits_IdleSamus2 
    STA.W $1F51 
    BRA .return 


.gameTimeOver10:
    SEP #$20 
    LDA.B #$02 
    STA.B $69 
    LDA.B #$10 
    STA.B $6B 
    LDA.B #$02 
    STA.B $6F 
    LDA.B #$22 
    STA.B $72 
    REP #$20 
    LDA.W #CinematicFunc_PostCredits_IdleSamus2_CrossFadeOutSamusSuit 
    STA.W $1F51 

.return:
    RTS 


CinematicFunc_PostCredits_IdleSamus2_CrossFadeOutSamusSuit:
    LDA.W $1A49 
    BIT.W #$0003 
    BNE CinematicFunction_PostCredits_IdleSamus2 
    LDX.W #$0040 
    LDY.W #$0010 
    JSR.W PaletteCrossFading_FadeOutYColorsStartingFromColorIndexX 
    LDA.W $09E0 
    CMP.W #$0003 
    BMI .gameTimeUnder3 
    LDX.W #$01C0 
    LDY.W #$0010 
    JSR.W PaletteCrossFading_FadeInYColorsStartingFromColorIndexX 

.gameTimeUnder3:
    LDX.W #$01A0 
    LDY.W #$0010 
    JSR.W PaletteCrossFading_FadeInYColorsStartingFromColorIndexX 
    JSR.W PaletteCrossFading_ComposeFadingPalettes 

CinematicFunction_PostCredits_IdleSamus2:
    DEC.W $1A49 
    BPL .return 
    SEP #$20 
    LDA.B #$10 
    STA.B $69 
    STZ.B $6B 
    STZ.B $6F 
    STZ.B $72 
    LDA.B #$07 
    STA.B $55 
    LDA.B #$80 
    STA.B $5F 
    LDA.B #$00 
    STA.B $58 
    STZ.B $5D 
    REP #$20 
    LDA.W #RTS_8BDB9D 
    STA.W $1F51 
    STZ.W $1A4D 
    LDA.W $09E0 
    CMP.W #$0003 
    BMI .bestEnding 
    CMP.W #$000A 
    BMI .mediocreEnding 
    LDY.W #CinematicSpriteObjectDefinitions_ThumbsUp_Head_Helmet 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDY.W #CinematicSpriteObjectDefinitions_ThumbsUp_Arm 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDY.W #CinematicSpriteObjectDefinitions_ThumbsUp_Body 
    JSR.W Spawn_CinematicSpriteObject_Y 
    BRA .return 


.mediocreEnding:
    LDY.W #CinematicSpriteObjectDefinitions_ThumbsUp_Head 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDY.W #CinematicSpriteObjectDefinitions_ThumbsUp_Arm 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDY.W #CinematicSpriteObjectDefinitions_ThumbsUp_Body 
    JSR.W Spawn_CinematicSpriteObject_Y 
    BRA .return 


.bestEnding:
    LDY.W #CinematicSpriteObjectDefs_SuitlessSamus_LettingHairDown 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDY.W #CinematicSpriteObjectDefs_SuitlessSamus_LettingHairDown_Legs 
    JSR.W Spawn_CinematicSpriteObject_Y 

.return:
    RTS 


CinematicFunction_PostCredits_SamusShootsScreen:
    LDA.W $1A4D 
    BEQ .timerExpired 
    DEC A 
    STA.W $1A4D 
    LDX.W #$0180 
    LDY.W #$0010 
    JSR.W PaletteCrossFading_FadeOutYColorsStartingFromColorIndexX 
    LDA.W $1A49 
    BEQ .timerExpired 
    JSR.W PaletteCrossFading_ComposeFadingPalettes 

.timerExpired:
    LDA.W $1A49 
    BEQ .transitionPalette 
    DEC A 
    STA.W $1A49 
    BRA + 


.transitionPalette:
    JSR.W TransitionSamusPaletteToBlack 

  + LDA.W $198D 
    SEC 
    SBC.W #$0008 
    AND.W #$00FF 
    STA.W $198D 
    LDA.W $198F 
    SEC 
    SBC.W #$0040 
    STA.W $198F 
    CMP.W #$0018 
    BMI .zoomGreaterThan18 
    RTS 


.zoomGreaterThan18:
    LDA.W #$0018 
    STA.W $198F 
    LDA.W #CinematicFunction_PostCredits_FadeToWhite 
    STA.W $1F51 
    LDA.W #$00B4 
    STA.W $1A49 
    STZ.W $1A4D 
    RTS 


TransitionSamusPaletteToBlack:
    LDA.W $1A4F 
    BEQ .return 
    DEC A 
    STA.W $1A4F 
    LDX.W #$01E0 
    LDY.W #$0010 
    JSR.W PaletteCrossFading_FadeOutYColorsStartingFromColorIndexX 
    JSR.W PaletteCrossFading_ComposeFadingPalettes 

.return:
    RTS 


TransferPostCreditsSuperMetroidIconToVRAM:
    LDA.W $1A4F 
    BNE .return 
    LDA.W $1A4D 
    CMP.W #$0006 
    BMI .loading 

.return:
    RTS 


.loading:
    ASL #3
    TAY 
    LDX.W $0330 
    LDA.W .size,Y 
    STA.B $D0,X 
    INX 
    INX 
    LDA.W .source,Y 
    STA.B $D0,X 
    INX 
    INX 
    SEP #$20 
    LDA.W .source+2,Y 
    STA.B $D0,X 
    REP #$20 
    INX 
    LDA.W .destination,Y 
    STA.B $D0,X 
    INX 
    INX 
    STX.W $0330 
    INC.W $1A4D 
    RTS 


  .size
    dw $0400 ; Item percentage Japanese text
  .source
    dl $7FD000 
    db $00 
  .destination
    dw $4800 
    dw $0800 ; Super Metroid icon tiles
    dl $7E6000 
    db $00 
    dw $6000 
    dw $0800 
    dl $7E6800 
    db $00 
    dw $6400 
    dw $0800 
    dl $7E7000 
    db $00 
    dw $6800 
    dw $0800 
    dl $7E7800 
    db $00 
    dw $6C00 
    dw $0800 ; Super Metroid icon tilemap
    dl $7E8000 
    db $00 
    dw $5400 

CinematicFunction_PostCredits_FadeToWhite:
    JSR.W TransitionSamusPaletteToBlack 
    JSR.W TransferPostCreditsSuperMetroidIconToVRAM 
    DEC.W $1A49 
    BEQ .timerExpired 
    RTS 


.timerExpired:
    SEP #$20 
    LDA.B #$01 
    STA.B $55 
    LDA.B #$11 
    STA.B $69 
    STZ.B $6B 
    STZ.B $6F 
    LDA.B #$31 
    STA.B $72 
    LDA.B #$3F 
    STA.B $74 
    LDA.B #$5F 
    STA.B $75 
    LDA.B #$9F 
    STA.B $76 
    STZ.B $5F 
    LDA.B #$4E 
    STA.B $58 
    LDA.B #$54 
    STA.B $5D 
    REP #$20 
    LDX.W #$0180 

.loopPalettes:
    LDA.L Palettes_PostCredits,X 
    STA.L $7EC000,X 
    INX 
    INX 
    CPX.W #$01A0 
    BMI .loopPalettes 
    STZ.W $1993 
    STZ.W $1997 
    LDA.W #CinematicFunction_PostCredits_FadeFromWhite 
    STA.W $1F51 
    LDA.W #$0020 
    STA.W $1A49 
    JSL.L Enable_CinematicBGObjects 
    JSL.L Enable_CinematicBGTilemap_Updates 
    LDA.W #$4C00 
    STA.W $19F5 
    LDX.W #$007E 
    LDA.W #$007F 

.loopTilemap:
    STA.L $7E3300,X 
    DEX 
    DEX 
    BPL .loopTilemap 
    JSR.W CinematicBGObjects_Update32x32CinematicBGTilemap 
    RTS 


CinematicFunction_PostCredits_FadeFromWhite:
    SEP #$20 
    LDA.B $74 
    SEC 
    SBC.B #$01 
    STA.B $74 
    CMP.B #$20 
    BPL + 
    LDA.B #$20 
    STA.B $74 

  + LDA.B $75 
    SEC 
    SBC.B #$01 
    STA.B $75 
    CMP.B #$40 
    BPL + 
    LDA.B #$40 
    STA.B $75 

  + LDA.B $76 
    SEC 
    SBC.B #$01 
    STA.B $76 
    CMP.B #$80 
    BPL + 
    LDA.B #$80 
    STA.B $76 

  + REP #$20 
    DEC.W $1A49 
    BEQ .timerExpired 
    BPL .return 

.timerExpired:
    LDA.W #RTS_8BE7BA 
    STA.W $1F51 
    LDA.W #$5000 
    STA.W $19F5 
    JSR.W CinematicBGObjects_Update32x32CinematicBGTilemap 
    LDA.W #$0100 
    STA.W $0911 
    STA.W $0915 
    LDY.W #CinematicSpriteObjectDefinitions_SuperMetroidIcon_S_TopHalf 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDY.W #CinematicSpriteObjectDefs_SuperMetroidIcon_S_BottomHalf 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDY.W #CinematicSpriteObjectDefs_SuperMetroidIcon_Circle_TopHalf 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDY.W #CinematicSpriteObjectDefs_SuperMetroidIcon_Circle_BottomHalf 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDX.W #$001E 
    LDA.W #$0000 

.loopBGPalette:
    STA.L $7EC020,X 
    DEX 
    DEX 
    BPL .loopBGPalette 
    LDX.W #$001E 

.loopSpirtePalette:
    LDA.L Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_0,X 
    STA.L $7EC1E0,X 
    DEX 
    DEX 
    BPL .loopSpirtePalette 

.return:
    RTS 


CinematicFunction_PostCredits_GreyOutSuperMetroidIcon:
    PHX 
    PHY 
    PHB 
    LDA.W $1A49 
    ASL #2
    TAX 
    LDA.W .spritePalette,X 
    PHA 
    LDA.W .BGPalette,X 
    TAY 
    PEA.W $8C00 
    PLB 
    PLB 
    LDX.W #$001E 

.loopBGPalette:
    LDA.W $0000,Y 
    STA.L $7EC020,X 
    DEY 
    DEY 
    DEX 
    DEX 
    BPL .loopBGPalette 
    PLY 
    LDX.W #$001E 

.loopSpritePalette:
    LDA.W $0000,Y 
    STA.L $7EC1E0,X 
    DEY 
    DEY 
    DEX 
    DEX 
    BPL .loopSpritePalette 
    LDA.W $1A49 
    INC A 
    STA.W $1A49 
    CMP.W #$0010 
    BMI .return 
    LDA.W #RTS_8BE7BA 
    STA.W $1F51 
    JSR.W Clear_CinematicSpriteObjects 
    PLB 
    LDY.W #CinematicBGObjectDefinitions_PostCredits_ItemPercentage 
    LDA.W #$4C00 
    JSR.W Spawn_CinematicBGObject 
    PLY 
    PLX 
    RTS 


.return:
    PLB 
    PLY 
    PLX 
    RTS 

; Pointers to (the last colour of) increasingly grey palettes
  .BGPalette
    dw Palettes_EndingSuperMetroidIconFadingToGrey_BG_10 ; These pointers read the list backwards :(
  .spritePalette
    dw Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_1 
    dw Palettes_EndingSuperMetroidIconFadingToGrey_BG_F 
    dw Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_2 
    dw Palettes_EndingSuperMetroidIconFadingToGrey_BG_E 
    dw Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_3 
    dw Palettes_EndingSuperMetroidIconFadingToGrey_BG_D 
    dw Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_4 
    dw Palettes_EndingSuperMetroidIconFadingToGrey_BG_C 
    dw Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_5 
    dw Palettes_EndingSuperMetroidIconFadingToGrey_BG_B 
    dw Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_6 
    dw Palettes_EndingSuperMetroidIconFadingToGrey_BG_A 
    dw Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_7 
    dw Palettes_EndingSuperMetroidIconFadingToGrey_BG_9 
    dw Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_8 
    dw Palettes_EndingSuperMetroidIconFadingToGrey_BG_8 
    dw Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_9 
    dw Palettes_EndingSuperMetroidIconFadingToGrey_BG_7 
    dw Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_A 
    dw Palettes_EndingSuperMetroidIconFadingToGrey_BG_6 
    dw Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_B 
    dw Palettes_EndingSuperMetroidIconFadingToGrey_BG_5 
    dw Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_C 
    dw Palettes_EndingSuperMetroidIconFadingToGrey_BG_4 
    dw Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_D 
    dw Palettes_EndingSuperMetroidIconFadingToGrey_BG_3 
    dw Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_E 
    dw Palettes_EndingSuperMetroidIconFadingToGrey_BG_2 
    dw Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_F 
    dw Palettes_EndingSuperMetroidIconFadingToGrey_BG_1 
    dw Palettes_EndingSuperMetroidIconFadingToGrey_Sprite_10 

Instruction_DrawItemPercentageCount:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    PHX 
    PHY 
    LDX.W #$0008 
    STZ.B $12 

.loopTanks:
    LDA.W .tankValuesEnergy,X 
    TAY 
    LDA.W $0000,Y 
    STA.W $4204 
    SEP #$20 
    LDA.W .tankValuesEnergyDivisor,X 
    STA.W $4206 
    NOP 
    NOP 
    NOP 
    NOP 
    NOP 
    NOP 
    NOP 
    REP #$20 
    LDA.W $4214 
    CLC 
    ADC.B $12 
    STA.B $12 
    DEX 
    DEX 
    BPL .loopTanks 
    LDX.W #$0014 

.loopItems:
    LDA.W $09A4 
    BIT.W .itemBits,X 
    BEQ .nextItem 
    INC.B $12 

.nextItem:
    DEX 
    DEX 
    BPL .loopItems 
    LDX.W #$0008 

.loopBeams:
    LDA.W $09A8 
    BIT.W .beamBits,X 
    BEQ .nextBeam 
    INC.B $12 

.nextBeam:
    DEX 
    DEX 
    BPL .loopBeams 
    LDA.B $12 
    STA.W $4204 
    SEP #$20 
    LDA.B #$0A 
    STA.W $4206 
    NOP 
    NOP 
    NOP 
    NOP 
    NOP 
    NOP 
    NOP 
    REP #$20 
    LDA.W $4214 
    STA.W $4204 
    LDA.W $4216 
    STA.B $16 
    SEP #$20 
    LDA.B #$0A 
    STA.W $4206 
    NOP 
    NOP 
    NOP 
    NOP 
    NOP 
    NOP 
    NOP 
    REP #$20 
    LDA.W $4214 
    STA.B $12 
    LDA.W $4216 
    STA.B $14 
    LDA.B $12 
    BEQ + 
    ASL #2
    TAY 
    LDA.W TilemapValuesForDecimalDigits_topHalf,Y 
    STA.L $7E339C 
    LDA.W TilemapValuesForDecimalDigits_bottomHalf,Y 
    STA.L $7E33DC 

  + LDA.B $14 
    BNE + 
    LDA.B $12 
    BEQ .unitsOnly 
    LDA.B $14 

  + ASL #2
    TAY 
    LDA.W TilemapValuesForDecimalDigits_topHalf,Y 
    STA.L $7E339E 
    LDA.W TilemapValuesForDecimalDigits_bottomHalf,Y 
    STA.L $7E33DE 

.unitsOnly:
    LDA.B $16 
    ASL #2
    TAY 
    LDA.W TilemapValuesForDecimalDigits_topHalf,Y 
    STA.L $7E33A0 
    LDA.W TilemapValuesForDecimalDigits_bottomHalf,Y 
    STA.L $7E33E0 
    LDA.W #$386A 
    STA.L $7E33A2 
    LDA.W #$387A 
    STA.L $7E33E2 
    PLY 
    PLX 
    PLB 
    PLP 
    RTS 


.tankValuesEnergy:
    dw $09C4 
.tankValuesReserve:
    dw $09D4 
.tankValuesMissiles:
    dw $09C8 
.tankValuesSuperMissiles:
    dw $09CC 
.tankValuesPowerBombs:
    dw $09D0 

.tankValuesEnergyDivisor:
    dw $0064 
.tankValuesReserveDivisor:
    dw $0064 
.tankValuesMissilesDivisor:
    dw $0005 
.tankValuesSuperMissilesDivisor:
    dw $0005 
.tankValuesPowerBombsDivisor:
    dw $0005 

.itemBits:
    dw $0001,$0020,$0004,$1000,$0002,$0008,$0100,$0200 
    dw $2000,$4000,$8000 

.beamBits:
    dw $0001,$0002,$0004,$0008,$1000 


TilemapValuesForDecimalDigits:
  .topHalf
    dw $3860 
  .bottomHalf 
    dw       $3870 ; 0
    dw $3861,$3871 ; 1
    dw $3862,$3872 ; 2
    dw $3863,$3873 ; 3
    dw $3864,$3874 ; 4
    dw $3865,$3875 ; 5
    dw $3866,$3876 ; 6
    dw $3867,$3877 ; 7
    dw $3868,$3878 ; 8
    dw $3869,$3879 ; 9

Instruction_DrawItemPercentageJapanText:
    PHX 
    LDA.W $09E2 
    BEQ .return 
    LDX.W #$007E 

.loop:
    LDA.L Tilemap_PostCredits_ItemPercentageJapanText,X 
    STA.L $7E35C0,X 
    DEX 
    DEX 
    BPL .loop 

.return:
    PLX 
    RTS 


Instruction_ClearItemPercentageJapanText:
    PHX 
    LDX.W #$007E 
    LDA.W #$007F 

.loop:
    STA.L $7E35C0,X 
    DEX 
    DEX 
    BPL .loop 
    LDA.W #CinematicFunction_PostCredits_ScrollItemPercentageDown 
    STA.W $1F51 
    PLX 
    RTS 


CinematicFunction_PostCredits_ScrollItemPercentageDown:
    LDA.W $1997 
    SEC 
    SBC.W #$0002 
    STA.W $1997 
    CMP.W #$FFB1 
    BPL .return 
    LDY.W #CinematicBGObjectDefinitions_PostCredits_SeeYouNextMission 
    LDA.W #$4C00 
    JSR.W Spawn_CinematicBGObject 
    LDA.W #RTS_8BE7BA 
    STA.W $1F51 
    JSL.L Write_supermetroid_ToSRAM 

.return:
    RTS 


RTS_8BE7BA:
    RTS 


Initialize_ShootingStars:
    PHP 
    REP #$30 
    LDY.W #$0E0C 
    LDX.W #$0000 
    STX.B $12 

.loop:
    PHX 
    TXA 
    STA.W $0000,Y 
    ASL #3
    TAX 
    LDA.W #$0000 
    STA.W $000C,Y 
    STA.W $000E,Y 
    LDA.W ShootingStar_Table_delay,X 
    BEQ .zero 
    STA.W $000A,Y 
    LDA.W $0000,Y 
    ORA.W #$8000 
    STA.W $0000,Y 
    BRA + 


.zero:
    LDA.W #$0020 
    STA.W $000A,Y 

  + PLX 
    LDA.W #$0080 
    STA.W $0002,Y 
    STA.W $0006,Y 
    LDA.W #$0000 
    STA.W $0004,Y 
    STA.W $0008,Y 
    TYA 
    CLC 
    ADC.W #$0010 
    TAY 
    INX 
    CPX.W #$0028 
    BMI .loop 
    PLP 
    RTS 


Handle_ShootingStars:
    PHP 
    REP #$30 
    LDA.W $1A05 
    BNE .loopSetup 
    PLP 
    RTS 


.loopSetup:
    LDA.W #$0028 
    STA.B $16 
    LDY.W #$0E0C 
    BRA .loopProcess 


.delay:
    LDA.W $000A,Y 
    DEC A 
    STA.W $000A,Y 
    BPL .gotoNextProcess 
    LDA.W #$0020 
    STA.W $000A,Y 
    LDA.W $0000,Y 
    AND.W #$00FF 
    STA.W $0000,Y 

.gotoNextProcess:
    JMP.W .nextProcess 


.loopProcess:
    LDA.W $0000,Y 
    BMI .delay 
    PHA 
    AND.W #$FF00 
    CMP.W #$0400 
    BMI .lessThan4 
    PLA 
    AND.W #$00FF 
    ASL #3
    TAX 
    LDA.W $000C,Y 
    CLC 
    ADC.W ShootingStar_Table_Xaccel,X 
    CLC 
    ADC.W ShootingStar_Table_Xaccel,X 
    STA.W $000C,Y 
    LDA.W $000E,Y 
    CLC 
    ADC.W ShootingStar_Table_Yaccel,X 
    CLC 
    ADC.W ShootingStar_Table_Yaccel,X 
    STA.W $000E,Y 
    BRA + 


.lessThan4:
    PLA 
    AND.W #$00FF 
    ASL #3
    TAX 
    LDA.W $000C,Y 
    CLC 
    ADC.W ShootingStar_Table_Xaccel,X 
    STA.W $000C,Y 
    LDA.W $000E,Y 
    CLC 
    ADC.W ShootingStar_Table_Yaccel,X 
    STA.W $000E,Y 

  + LDA.W $000C,Y 
    PHA 
    XBA 
    AND.W #$00FF 
    BIT.W #$0080 
    BEQ + 
    ORA.W #$FF00 

  + STA.B $12 
    PLA 
    XBA 
    AND.W #$FF00 
    STA.B $14 
    LDA.W $0004,Y 
    CLC 
    ADC.B $14 
    STA.W $0004,Y 
    LDA.W $0002,Y 
    ADC.B $12 
    STA.W $0002,Y 
    LDA.W $000E,Y 
    PHA 
    XBA 
    AND.W #$00FF 
    BIT.W #$0080 
    BEQ + 
    ORA.W #$FF00 

  + STA.B $12 
    PLA 
    XBA 
    AND.W #$FF00 
    STA.B $14 
    LDA.W $0008,Y 
    CLC 
    ADC.B $14 
    STA.W $0008,Y 
    LDA.W $0006,Y 
    ADC.B $12 
    STA.W $0006,Y 

.nextProcess:
    TYA 
    CLC 
    ADC.W #$0010 
    TAY 
    DEC.B $16 
    BEQ .loopDrawSetup 
    JMP.W .loopProcess 


.loopDrawSetup:
    LDA.W #$0028 
    STA.B $16 
    LDX.W $0590 
    LDY.W #$0E0C 

.loopDraw:
    LDA.W $0000,Y 
    BMI .nextDraw 
    LDA.W $0002,Y 
    BIT.W #$FF00 
    BNE .offScreen 
    SEC 
    SBC.W #$0004 
    BIT.W #$FF00 
    BNE .offScreen 
    STA.W $0370,X 
    LDA.W $0006,Y 
    BIT.W #$FF00 
    BNE .offScreen 
    SEC 
    SBC.W #$0004 
    BIT.W #$FF00 
    BNE .offScreen 
    STA.W $0371,X 
    LDA.W $000A,Y 
    DEC A 
    STA.W $000A,Y 
    BEQ .timerExpired 
    BPL .nonZero 

.timerExpired:
    PHX 
    LDA.W $0000,Y 
    PHA 
    AND.W #$00FF 
    ASL #3
    TAX 
    LDA.W ShootingStar_Table_timer,X 
    STA.W $000A,Y 
    PLA 
    CLC 
    ADC.W #$0200 
    STA.W $0000,Y 
    PLX 

.nonZero:
    LDA.W $0000,Y 
    BIT.W #$FF00 
    BEQ .nextDraw 
    PHY 
    XBA 
    AND.W #$00FF 
    TAY 
    LDA.W .tilemapValues,Y 
    STA.W $0372,X 
    PLY 
    TXA 
    CLC 
    ADC.W #$0004 
    TAX 

.nextDraw:
    TYA 
    CLC 
    ADC.W #$0010 
    TAY 
    DEC.B $16 
    BEQ .return 
    JMP.W .loopDraw 


.return:
    STX.W $0590 
    PLP 
    RTS 


.offScreen:
    LDA.W #$0020 
    STA.W $000A,Y 
    LDA.W #$0080 
    STA.W $0002,Y 
    STA.W $0006,Y 
    LDA.W #$0000 
    STA.W $0004,Y 
    STA.W $0008,Y 
    STA.W $000C,Y 
    STA.W $000E,Y 
    LDA.W $0000,Y 
    AND.W #$00FF 
    STA.W $0000,Y 
    JMP.W .nextDraw 


.tilemapValues:
; Tile number and attributes, indexed by animation frame
    dw $0000,$09F0,$09F1,$09F2,$09F3,$09F3,$09F3,$09F3 
    dw $09F3,$09F3,$09F3,$09F3,$09F3,$09F3,$09F3,$09F3 
    dw $09F3,$09F3,$09F3,$09F3 

ShootingStar_Table_Xaccel:
    db $10,$00 

ShootingStar_Table_Yaccel:
    db $F0,$FF 

ShootingStar_Table_timer:
    db $06,$00 

ShootingStar_Table_delay:
    db $08,$00,$0C,$00,$FF,$FF,$06,$00,$00,$00,$0D,$00,$F6,$FF,$06,$00 
    db $06,$00,$08,$00,$F0,$FF,$06,$00,$00,$00,$02,$00,$F2,$FF,$06,$00 
    db $08,$00,$10,$00,$F8,$FF,$06,$00,$00,$00,$02,$00,$FF,$FF,$00,$0F 
    db $00,$00,$01,$00,$FE,$FF,$00,$0F,$00,$00,$00,$00,$FD,$FF,$00,$0F 
    db $00,$00,$02,$00,$FB,$FF,$20,$00,$04,$00,$0F,$00,$10,$00,$06,$00 
    db $08,$00,$02,$00,$09,$00,$08,$00,$00,$00,$0C,$00,$08,$00,$06,$00 
    db $00,$00,$10,$00,$04,$00,$06,$00,$08,$00,$08,$00,$0C,$00,$08,$00 
    db $00,$00,$02,$00,$08,$00,$08,$00,$00,$00,$02,$00,$04,$00,$00,$0F 
    db $00,$00,$02,$00,$01,$00,$00,$0F,$00,$00,$F3,$FF,$0D,$00,$04,$00 
    db $08,$00,$F2,$FF,$08,$00,$04,$00,$00,$00,$F9,$FF,$0E,$00,$06,$00 
    db $00,$00,$FB,$FF,$10,$00,$04,$00,$08,$00,$FC,$FF,$05,$00,$20,$00 
    db $00,$00,$FE,$FF,$03,$00,$00,$0F,$00,$00,$FE,$FF,$04,$00,$00,$0F 
    db $00,$00,$FD,$FF,$01,$00,$00,$0F,$00,$00,$F4,$FF,$02,$00,$04,$00 
    db $00,$00,$FA,$FF,$05,$00,$20,$00,$00,$00,$FD,$FF,$08,$00,$20,$00 
    db $00,$00,$F2,$FF,$F7,$FF,$04,$00,$08,$00,$F8,$FF,$F4,$FF,$04,$00 
    db $00,$00,$FA,$FF,$F2,$FF,$06,$00,$00,$00,$F4,$FF,$F0,$FF,$04,$00 
    db $08,$00,$F8,$FF,$FC,$FF,$20,$00,$00,$00,$FD,$FF,$FA,$FF,$20,$00 
    db $00,$00,$F9,$FF,$F8,$FF,$20,$00,$00,$00,$FE,$FF,$FD,$FF,$00,$0F 
    db $00,$00,$FC,$FF,$FC,$FF,$00,$0F,$00,$00,$F8,$FF,$FE,$FF,$00,$0F 
    db $00,$00,$F8,$FF,$FC,$FF,$00,$0F,$00,$00 

InstList_CinematicSpriteObjects_ExplodingZebes_Zebes_0:
    dw CinematicSpriteObject_Instruction_TimerInY,$0005 

InstList_CinematicSpriteObjects_ExplodingZebes_Zebes_1:
    dw $000D,EndingSequenceSpritemaps_ExplodingPlanetZebesFrame1 
    dw $000D,EndingSequenceSpritemaps_ExplodingPlanetZebesFrame2 
    dw $000D,EndingSequenceSpritemaps_ExplodingPlanetZebesFrame3 
    dw $000D,EndingSequenceSpritemaps_ExplodingPlanetZebesFrame4 
    dw CinematicSpriteObject_Inst_DecrementTimer_GotoYIfNonZero 
    dw InstList_CinematicSpriteObjects_ExplodingZebes_Zebes_1 
    dw Instruction_FadeOutZoomedOutExplodingZebes 
    dw $0020,EndingSequenceSpritemaps_ExplodingPlanetZebesFrame5 
    dw $0020,EndingSequenceSpritemaps_ExplodingPlanetZebesFrame6 
    dw $0020,EndingSequenceSpritemaps_ExplodingPlanetZebesFrame7 
    dw $0020,EndingSequenceSpritemaps_ExplodingPlanetZebesFrame8 
    dw Instruction_CineSpriteObjectSpawnZebesExplosionSilhouette 
    dw CinematicSpriteObject_Instruction_Delete 

InstList_CinematicSpriteObjects_ExplodingZebes_PurpleGlow:
    dw $0010,EndingSequenceSpritemaps_ExplodingPlanetZebesGlow 
    dw $0010,EndingSequenceSpritemaps_ZebesSupernovaPart1 
    dw $0010,EndingSequenceSpritemaps_ZebesSupernovaPart2 
    dw $0010,EndingSequenceSpritemaps_ZebesSupernovaPart1 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObjects_ExplodingZebes_PurpleGlow 

InstList_CinematicSpriteObjects_ExplodingZebes_Stars:
    dw $0010,EndingSequenceSpritemaps_ZebesBoomStarryBackground 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObjects_ExplodingZebes_Stars 

InstList_CinematicSpriteObjects_ExplodingZebes_Lava_0:
    dw $009C,$0000 

InstList_CinematicSpriteObjects_ExplodingZebes_Lava_1:
    dw $000A,EndingSequenceSpritemaps_ExplodingPlanetZebesCoreFrame1 
    dw $000A,EndingSequenceSpritemaps_ExplodingPlanetZebesCoreFrame2 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObjects_ExplodingZebes_Lava_1 

InstList_CinematicSpriteObjects_ExplodingZebes_Silhouette:
    dw $0008,EndingSequenceSpritemaps_ZebesSupernovaPart3 
    dw Instruction_CinematicSpriteObject_StartZebesExplosion 
    dw CinematicSpriteObject_Instruction_Delete 

InstList_CinematicSpriteObjects_ExplodingZebes_Stars_Right:
    dw $0090,EndingSequenceSpritemaps_ZebesBoomStarryBackground 
    dw Instruction_ZebesExplosionFinale 
    dw $014C,EndingSequenceSpritemaps_ZebesBoomStarryBackground 
    dw Instruction_EndZebesExplosion 
    dw CinematicSpriteObject_Instruction_PreInstructionY 
    dw Instruction_CinematicSpriteObject_ZebesExplosion_Stars_Left 

InstList_CinematicSpriteObjects_ExplodingZebes_Stars_Left:
    dw $0010,EndingSequenceSpritemaps_ZebesBoomStarryBackground 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObjects_ExplodingZebes_Stars_Left 

InstList_CinematicSpriteObjects_ExplodingZebes_AfterGlow:
    dw $0010,EndingSequenceSpritemaps_ZebesSupernovaPart4 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObjects_ExplodingZebes_AfterGlow 

InstList_CinematicSpriteObjects_TheOperationWas_0:
    dw $0008,EndingSequenceSpritemaps_T 
    dw $0008,EndingSequenceSpritemaps_TH 
    dw $000F,EndingSequenceSpritemaps_THE 
    dw $0008,EndingSequenceSpritemaps_THEO 
    dw $0008,EndingSequenceSpritemaps_THEOP 
    dw $0008,EndingSequenceSpritemaps_THEOPE 
    dw $0008,EndingSequenceSpritemaps_THEOPER 
    dw $0008,EndingSequenceSpritemaps_THEOPERA 
    dw $0008,EndingSequenceSpritemaps_THEOPERAT 
    dw $0008,EndingSequenceSpritemaps_THEOPERATI 
    dw $0008,EndingSequenceSpritemaps_THEOPERATIO 
    dw $000F,EndingSequenceSpritemaps_THEOPERATION 
    dw $0008,EndingSequenceSpritemaps_THEOPERATIONW 
    dw $0008,EndingSequenceSpritemaps_THEOPERATIONWA 
    dw $000F,EndingSequenceSpritemaps_THEOPERATIONWAS 
    dw Instruction_CinematicSpriteObject_SpawnCompletedSuccessfully 

InstList_CinematicSpriteObjects_TheOperationWas_1:
    dw $000F,EndingSequenceSpritemaps_THEOPERATIONWAS 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObjects_TheOperationWas_1 

InstList_CinematicSpriteObjects_CompletedSuccessfully_0:
    dw $0008,EndingSequenceSpritemaps_C_ompleted 
    dw $0008,EndingSequenceSpritemaps_CO 
    dw $0008,EndingSequenceSpritemaps_COM 
    dw $0008,EndingSequenceSpritemaps_COMP 
    dw $0008,EndingSequenceSpritemaps_COMPL 
    dw $0008,EndingSequenceSpritemaps_COMPLE 
    dw $0008,EndingSequenceSpritemaps_COMPLET 
    dw $0008,EndingSequenceSpritemaps_COMPLETE 
    dw $000F,EndingSequenceSpritemaps_COMPLETED 
    dw $0008,EndingSequenceSpritemaps_COMPLETEDS 
    dw $0008,EndingSequenceSpritemaps_COMPLETEDSU 
    dw $0008,EndingSequenceSpritemaps_COMPLETEDSUC 
    dw $0008,EndingSequenceSpritemaps_COMPLETEDSUCC 
    dw $0008,EndingSequenceSpritemaps_COMPLETEDSUCCE 
    dw $0008,EndingSequenceSpritemaps_COMPLETEDSUCCES 
    dw $0008,EndingSequenceSpritemaps_COMPLETEDSUCCESS 
    dw $0008,EndingSequenceSpritemaps_COMPLETEDSUCCESSF 
    dw $0008,EndingSequenceSpritemaps_COMPLETEDSUCCESSFU 
    dw $0008,EndingSequenceSpritemaps_COMPLETEDSUCCESSFUL 
    dw $0008,EndingSequenceSpritemaps_COMPLETEDSUCCESSFULL 
    dw $000F,EndingSequenceSpritemaps_COMPLETEDSUCCESSFULLY 
    dw Instruction_CinematicSpriteObject_SpawnClearTime 

InstList_CinematicSpriteObjects_CompletedSuccessfully_1:
    dw $0008,EndingSequenceSpritemaps_COMPLETEDSUCCESSFULLY 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObjects_CompletedSuccessfully_1 

InstList_CinematicSpriteObjects_ClearTime_0:
    dw $0008,EndingSequenceSpritemaps_C_lear 
    dw $0008,EndingSequenceSpritemaps_CL 
    dw $0008,EndingSequenceSpritemaps_CLE 
    dw $0008,EndingSequenceSpritemaps_CLEA 
    dw $000F,EndingSequenceSpritemaps_CLEAR 
    dw $0008,EndingSequenceSpritemaps_CLEART 
    dw $0008,EndingSequenceSpritemaps_CLEARTI 
    dw $0008,EndingSequenceSpritemaps_CLEARTIM 
    dw $000F,EndingSequenceSpritemaps_CLEARTIME 
    dw Instruction_CineSpriteObject_SpawnClearTime_Hours_TensDigit 
    dw $0008,EndingSequenceSpritemaps_CLEARTIME 
    dw Instruction_CineSpriteObject_SpawnClearTime_Hours_OnesDigit 
    dw $0008,EndingSequenceSpritemaps_CLEARTIME 
    dw Instruction_CinematicSpriteObject_SpawnClearTime_Colon 
    dw $0008,EndingSequenceSpritemaps_CLEARTIME 
    dw Inst_CineSpriteObject_SpawnClearTime_Minutes_TensDigit 
    dw $0008,EndingSequenceSpritemaps_CLEARTIME 
    dw Inst_CineSpriteObject_SpawnClearTime_Minutes_OnesDigit 
    dw $0080,EndingSequenceSpritemaps_CLEARTIME 
    dw Instruction_CinematicSpriteObject_TransitionToCredits 

InstList_CinematicSpriteObjects_ClearTime_1:
    dw $000F,EndingSequenceSpritemaps_CLEARTIME 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObjects_ClearTime_1 

InstList_ClearTimeDigit_0:
    dw $0008,EndingSequenceSpritemaps_0 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_ClearTimeDigit_0 

InstList_ClearTimeDigit_1:
    dw $0008,EndingSequenceSpritemaps_1 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_ClearTimeDigit_1 

InstList_ClearTimeDigit_2:
    dw $0008,EndingSequenceSpritemaps_2 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_ClearTimeDigit_2 

InstList_ClearTimeDigit_3:
    dw $0008,EndingSequenceSpritemaps_3 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_ClearTimeDigit_3 

InstList_ClearTimeDigit_4:
    dw $0008,EndingSequenceSpritemaps_4 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_ClearTimeDigit_4 

InstList_ClearTimeDigit_5:
    dw $0008,EndingSequenceSpritemaps_5 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_ClearTimeDigit_5 

InstList_ClearTimeDigit_6:
    dw $0008,EndingSequenceSpritemaps_6 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_ClearTimeDigit_6 

InstList_ClearTimeDigit_7:
    dw $0008,EndingSequenceSpritemaps_7 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_ClearTimeDigit_7 

InstList_ClearTimeDigit_8:
    dw $0008,EndingSequenceSpritemaps_8 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_ClearTimeDigit_8 

InstList_ClearTimeDigit_9:
    dw $0008,EndingSequenceSpritemaps_9 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_ClearTimeDigit_9 

InstList_CinematicSpriteObject_ClearTime_Colon:
    dw $0008,EndingSequenceSpritemaps_Colon 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObject_ClearTime_Colon 

InstList_CinematicSpriteObject_CrittersEscape:
    dw $0001,EndingSequenceSpritemaps_CrittersEscapePodFrame1 
    dw $0001,EndingSequenceSpritemaps_CrittersEscapePodFrame2 
    dw $0001,EndingSequenceSpritemaps_CrittersEscapePodFrame3 
    dw $0001,EndingSequenceSpritemaps_CrittersEscapePodFrame4 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObject_CrittersEscape 

InstList_CinematicSpriteObject_YellowClouds_Top_TopHalf:
    dw $0001,EndingSequenceSpritemaps_EndingCutsceneTopCloudsPattern 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObject_YellowClouds_Top_TopHalf 

InstList_CinematicSpriteObject_YellowClouds_Top_BottomHalf:
    dw $0001,EndingSequenceSpritemaps_EndingCutsceneTopCloudsEdge 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObject_YellowClouds_Top_BottomHalf 

InstList_CinematicSpriteObject_YellowClouds_Bottom_TopHalf:
    dw $0001,EndingSequenceSpritemaps_EndingCutsceneBottomCloudsEdge 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObject_YellowClouds_Bottom_TopHalf 

InstList_CineSpriteObject_YellowClouds_Bottom_BottomHalf:
    dw $0001,EndingSequenceSpritemaps_EndingCutsceneBottomCloudsPattern 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CineSpriteObject_YellowClouds_Bottom_BottomHalf 

InstList_CinematicSpriteObject_YellowClouds_Right:
    dw $0001,EndingSequenceSpritemaps_EndingCutsceneRightClouds 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObject_YellowClouds_Right 

InstList_CinematicSpriteObject_YellowClouds_Left:
    dw $0001,EndingSequenceSpritemaps_EndingCutsceneLeftClouds 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObject_YellowClouds_Left 

InstList_CinematicSpriteObject_SuitlessSamus_Idle:
    dw $0080,EndingSequenceSpritemaps_SuitlessSamusStandingArmsStraight 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObject_SuitlessSamus_Idle 

InstList_CinematicSpriteObject_SuitlessSamus_Idle_Legs:
    dw $0080,EndingSequenceSpritemaps_SuitlessSamusLowerBody 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObject_SuitlessSamus_Idle_Legs 

InstList_CinematicSpriteObject_SuitlessSamus_LettingHairDown:
    dw $005A,EndingSequenceSpritemaps_SuitlessSamusStandingArmsStraight 
    dw $0008,EndingSequenceSpritemaps_SuitlessSamusOpeningHairFrame1 
    dw $000A,EndingSequenceSpritemaps_SuitlessSamusOpeningHairFrame2 
    dw $000A,EndingSequenceSpritemaps_SuitlessSamusOpeningHairFrame3 
    dw $0020,EndingSequenceSpritemaps_SuitlessSamusOpeningHairFrame4 
    dw $000A,EndingSequenceSpritemaps_SuitlessSamusOpeningHairFrame5 
    dw $0009,EndingSequenceSpritemaps_SuitlessSamusOpeningHairFrame6 
    dw $0010,EndingSequenceSpritemaps_SuitlessSamusOpeningHairFrame7 
    dw $000A,EndingSequenceSpritemaps_SuitlessSamusOpeningHairFrame8 
    dw $0030,EndingSequenceSpritemaps_SuitlessSamusStanding 
    dw Instruction_CinematicSpriteObject_SpawnSuitlessSamusJump 
    dw CinematicSpriteObject_Instruction_Delete 

InstList_CineSpriteObject_SuitlessSamus_LettingHairDown_Legs:
    dw $005A,EndingSequenceSpritemaps_SuitlessSamusLowerBody 
    dw $0008,EndingSequenceSpritemaps_SuitlessSamusLowerBody 
    dw $000A,EndingSequenceSpritemaps_SuitlessSamusLowerBody 
    dw $000A,EndingSequenceSpritemaps_SuitlessSamusLowerBody 
    dw $0020,EndingSequenceSpritemaps_SuitlessSamusLowerBody 
    dw $000A,EndingSequenceSpritemaps_SuitlessSamusLowerBody 
    dw $0009,EndingSequenceSpritemaps_SuitlessSamusLowerBody 
    dw $0010,EndingSequenceSpritemaps_SuitlessSamusLowerBody 
    dw $000A,EndingSequenceSpritemaps_SuitlessSamusLowerBody 
    dw CinematicSpriteObject_Instruction_Delete 

InstList_CinematicSpriteObject_SuitlessSamus_Jump_0:
    dw $0030,EndingSequenceSpritemaps_SuitlessSamusStanding 
    dw $000A,EndingSequenceSpritemaps_SuitlessSamusPreparingToJump 
    dw Instruction_CinematicSpriteObject_MakeEndingSamusJump 
    dw CinematicSpriteObject_Instruction_PreInstructionY 
    dw Inst_CineSpriteObject_SpawnSuitlessSamus_LettingHairDown 

InstList_CinematicSpriteObject_SuitlessSamus_Jump_1:
    dw $0030,EndingSequenceSpritemaps_SuitlessSamusJumping 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObject_SuitlessSamus_Jump_1 

InstList_Samus_Jump_Falling:
    dw $000A,EndingSequenceSpritemaps_SamusFalling 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_Samus_Jump_Falling 

InstList_Samus_Jump_Landed:
    dw $000A,EndingSequenceSpritemaps_SamusLanding 
    dw $0010,EndingSequenceSpritemaps_SamusLanded 
    dw $0030,EndingSequenceSpritemaps_SamusShooting 
    dw Instruction_CinematicSpriteObject_SamusShootsScreen 
    dw $0080,EndingSequenceSpritemaps_SamusShooting 
    dw CinematicSpriteObject_Instruction_Delete 

InstList_CinematicSpriteObject_SuitedSamus_Idle_Body:
    dw $000A,EndingSequenceSpritemaps_LargeSamusFromEndingStanding 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObject_SuitedSamus_Idle_Body 

InstList_CinematicSpriteObject_SuitedSamus_Idle_Head_Helmet:
    dw $000A,EndingSequenceSpritemaps_SamusHeadWithHelmetFromEnding 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObject_SuitedSamus_Idle_Head_Helmet 

InstList_CinematicSpriteObject_SuitedSamus_Head:
    dw $000A,EndingSequenceSpritemaps_SamusHeadFromEndingFrame1 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObject_SuitedSamus_Head 

InstList_CinematicSpriteObject_SuitedSamus_ThumbsUp_Body:
    dw $0040,EndingSequenceSpritemaps_LargeSamusFromEndingStanding 
    dw $0108,EndingSequenceSpritemaps_HeadlessArmlessSuitedSamus 
    dw CinematicSpriteObject_Instruction_Delete 

InstList_CinematicSpriteObject_SuitedSamus_ThumbsUp_Arm:
    dw $0040,$0000 
    dw $0008,EndingSequenceSpritemaps_SamusArmFromEndingFrame1 
    dw $0008,EndingSequenceSpritemaps_SamusArmFromEndingFrame2 
    dw $0005,EndingSequenceSpritemaps_SamusArmFromEndingFrame3 
    dw $0004,EndingSequenceSpritemaps_SamusArmFromEndingFrame4 
    dw $0003,EndingSequenceSpritemaps_SamusArmFromEndingFrame5 
    dw $0020,EndingSequenceSpritemaps_SamusArmFromEndingFrame6 
    dw $0008,EndingSequenceSpritemaps_SamusArmFromEndingFrame7 
    dw $0040,EndingSequenceSpritemaps_SamusArmFromEndingFrame8 
    dw $0005,EndingSequenceSpritemaps_SamusArmFromEndingFrame6 
    dw $0005,EndingSequenceSpritemaps_SamusArmFromEndingFrame5 
    dw $0005,EndingSequenceSpritemaps_SamusArmFromEndingFrame4 
    dw $0005,EndingSequenceSpritemaps_SamusArmFromEndingFrame3 
    dw $0070,EndingSequenceSpritemaps_SamusArmFromEndingFrame2 
    dw Instruction_CinematicSpriteObject_SpawnSuitedSamusJump 
    dw CinematicSpriteObject_Instruction_Delete 

InstList_CineSpriteObject_SuitedSamus_ThumbsUp_Head_Helmet:
    dw $0148,EndingSequenceSpritemaps_SamusHeadWithHelmetFromEnding 
    dw CinematicSpriteObject_Instruction_Delete 

InstList_CinematicSpriteObject_SuitedSamus_ThumbsUp_Head:
    dw $0080,EndingSequenceSpritemaps_SamusHeadFromEndingFrame1 
    dw $0005,EndingSequenceSpritemaps_SamusHeadFromEndingFrame2 
    dw $0005,EndingSequenceSpritemaps_SamusHeadFromEndingFrame3 
    dw $00BE,EndingSequenceSpritemaps_SamusHeadFromEndingFrame4 
    dw CinematicSpriteObject_Instruction_Delete 

InstList_CinematicSpriteObject_SuitedSamus_Jump_Body_0:
    dw Instruction_CineSpriteObject_PositionSuitedHeadToPrepareJump 
    dw $000A,EndingSequenceSpritemaps_LargeSamusFromEndingPreparingToJump 
    dw Instruction_CinematicSpriteObject_PositionSamusHeadToJump 
    dw Instruction_CinematicSpriteObject_MakeEndingSamusJump 
    dw CinematicSpriteObject_Instruction_PreInstructionY 
    dw Inst_CineSpriteObject_SpawnSuitlessSamus_LettingHairDown 

InstList_CinematicSpriteObject_SuitedSamus_Jump_Body_1:
    dw $0005,EndingSequenceSpritemaps_LargeSamusFromEndingJumping 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObject_SuitedSamus_Jump_Body_1 

InstList_CineSpriteObject_SuitedSamus_Jump_Head_Helmet_0:
    dw $000A,EndingSequenceSpritemaps_LargeSamusHelmetFromEndingFrame1 
    dw CinematicSpriteObject_Instruction_PreInstructionY 
    dw PreInst_CinematicSpriteObject_SuitedSamus_Jump_Head_Jumping 

InstList_CineSpriteObject_SuitedSamus_Jump_Head_Helmet_1:
    dw $0005,EndingSequenceSpritemaps_LargeSamusHelmetFromEndingFrame2 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CineSpriteObject_SuitedSamus_Jump_Head_Helmet_1 

InstList_CinematicSpriteObject_SuitedSamus_Jump_Head_0:
    dw $000A,EndingSequenceSpritemaps_JumpingSamusHeadFromEnding 
    dw CinematicSpriteObject_Instruction_PreInstructionY 
    dw PreInst_CinematicSpriteObject_SuitedSamus_Jump_Head_Jumping 

InstList_CinematicSpriteObject_SuitedSamus_Jump_Head_1:
    dw $0005,EndingSequenceSpritemaps_JumpingSamusHeadFromEnding 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObject_SuitedSamus_Jump_Head_1 

InstList_CinematicSpriteObject_SuperMetroidIcon_S_TopHalf:
    dw $000A,EndingSequenceSpritemaps_ScrewAttackSymbolUpperPart 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObject_SuperMetroidIcon_S_TopHalf 

InstList_CinematicSpriteObject_SuperMetroidIcon_S_BottomHalf:
    dw $000A,EndingSequenceSpritemaps_ScrewAttackSymbolLowerPart 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CinematicSpriteObject_SuperMetroidIcon_S_BottomHalf 

InstList_CineSpriteObject_SuperMetroidIcon_Circle_TopHalf_0:
    dw $0060,$0000 
    dw $0005,EndingSequenceSpritemaps_ScrewAttackSymbolRightWrapFrame1 
    dw $0005,EndingSequenceSpritemaps_ScrewAttackSymbolRightWrapFrame2 
    dw $0040,EndingSequenceSpritemaps_ScrewAttackSymbolRightWrapFrame3 
    dw Instruction_GreyOutSuperMetroidIcon 

InstList_CineSpriteObject_SuperMetroidIcon_Circle_TopHalf_1:
    dw $0005,EndingSequenceSpritemaps_ScrewAttackSymbolRightWrapFrame3 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CineSpriteObject_SuperMetroidIcon_Circle_TopHalf_1 

InstList_CineSpriteObject_SuperMetroidIcon_Circle_BotHalf_0:
    dw $0060,$0000 
    dw $0005,EndingSequenceSpritemaps_ScrewAttackSymbolLeftWrapFrame1 
    dw $0005,EndingSequenceSpritemaps_ScrewAttackSymbolLeftWrapFrame2 

InstList_CineSpriteObject_SuperMetroidIcon_Circle_BotHalf_1:
    dw $0005,EndingSequenceSpritemaps_ScrewAttackSymbolLeftWrapFrame3 
    dw CinematicSpriteObject_Instruction_GotoY 
    dw InstList_CineSpriteObject_SuperMetroidIcon_Circle_BotHalf_1 

InstList_CinematicSpriteObject_Delete_duplicate:
    dw CinematicSpriteObject_Instruction_Delete 

CinematicSpriteObjectDefinitions_ExplodingZebes_Zebes:
    dw InitFunction_CinematicSpriteObject_ExplodingZebes_Palette7 
    dw RTS_8B93D9 
    dw InstList_CinematicSpriteObjects_ExplodingZebes_Zebes_0 

CinematicSpriteObjectDefinitions_ExplodingZebes_PurpleGlow:
    dw InitFunction_CinematicSpriteObject_ExplodingZebes_Palette7 
    dw PreInst_CineSpriteObj_ExplodingZebes_PurpleGlow_Stars_Lava 
    dw InstList_CinematicSpriteObjects_ExplodingZebes_PurpleGlow 

CinematicSpriteObjectDefinitions_ExplodingZebes_Stars:
    dw InitFunction_CinematicSpriteObject_ExplodingZebes_Palette7 
    dw PreInst_CineSpriteObj_ExplodingZebes_PurpleGlow_Stars_Lava 
    dw InstList_CinematicSpriteObjects_ExplodingZebes_Stars 

CinematicSpriteObjectDefinitions_ExplodingZebes_Lava:
    dw InitFunction_CinematicSpriteObject_ExplodingZebes_Palette5 
    dw PreInst_CineSpriteObj_ExplodingZebes_PurpleGlow_Stars_Lava 
    dw InstList_CinematicSpriteObjects_ExplodingZebes_Lava_0 

CinematicSpriteObjectDefinitions_ZebesExplosion_Silhouette:
    dw InitFunction_CinematicSpriteObject_ExplodingZebes_Palette5 
    dw RTS_8B93D9 
    dw InstList_CinematicSpriteObjects_ExplodingZebes_Silhouette 

CinematicSpriteObjectDefinitions_ZebesExplosion_Stars_Right:
    dw InitFunction_CinematicSpriteObject_ExplodingZebes_Palette7 
    dw RTS_8B93D9 
    dw InstList_CinematicSpriteObjects_ExplodingZebes_Stars_Right 

CinematicSpriteObjectDefinitions_ZebesExplosion_AfterGlow:
    dw InitFunction_CinematicSpriteObject_ZebesExplosion_AfterGlow 
    dw PreInstruction_CineSpriteObject_ZebesExplosion_AfterGlow 
    dw InstList_CinematicSpriteObjects_ExplodingZebes_AfterGlow 

CinematicSpriteObjectDefinitions_TheOperationWas:
    dw InitFunc_CineSpriteObj_TheOperationWasCompletedSuccessfully 
    dw PreInstruction_CinematicSpriteObject_Text 
    dw InstList_CinematicSpriteObjects_TheOperationWas_0 

CinematicSpriteObjectDefinitions_CompletedSuccessfully:
    dw InitFunc_CineSpriteObj_TheOperationWasCompletedSuccessfully 
    dw PreInstruction_CinematicSpriteObject_Text 
    dw InstList_CinematicSpriteObjects_CompletedSuccessfully_0 

CinematicSpriteObjectDefinitions_YellowClouds_Top_TopHalf:
    dw InitFunction_CinematicSpriteObject_YellowClouds_Top_TopHalf 
    dw PreInstruction_CinematicSpriteObject_YellowClouds_Top 
    dw InstList_CinematicSpriteObject_YellowClouds_Top_TopHalf 

CinematicSpriteObjectDefinitions_Top_BottomHalf:
    dw InitFunction_CineSpriteObject_YellowClouds_Top_BottomHalf 
    dw PreInstruction_CinematicSpriteObject_YellowClouds_Top 
    dw InstList_CinematicSpriteObject_YellowClouds_Top_BottomHalf 

CinematicSpriteObjectDefinitions_Bottom_TopHalf:
    dw InitFunction_CineSpriteObject_YellowClouds_Bottom_TopHalf 
    dw PreInstruction_CinematicSpriteObject_YellowClouds_Bottom 
    dw InstList_CinematicSpriteObject_YellowClouds_Bottom_TopHalf 

CinematicSpriteObjectDefinitions_Bottom_BottomHalf:
    dw InitFunction_CineSpriteObject_YellowClouds_Bottom_BottomHalf 
    dw PreInstruction_CinematicSpriteObject_YellowClouds_Bottom 
    dw InstList_CineSpriteObject_YellowClouds_Bottom_BottomHalf 

CinematicSpriteObjectDefinitions_Right:
    dw InitFunction_CinematicSpriteObject_YellowClouds_Right 
    dw PreInstruction_CinematicSpriteObject_YellowClouds_Right 
    dw InstList_CinematicSpriteObject_YellowClouds_Right 

CinematicSpriteObjectDefinitions_Left:
    dw InitFunction_CinematicSpriteObject_YellowClouds_Left 
    dw PreInstruction_CinematicSpriteObject_YellowClouds_Left 
    dw InstList_CinematicSpriteObject_YellowClouds_Left 

CinematicSpriteObjectDefinitions_ZebesExplosion_Stars_Left:
    dw InitFunction_CinematicSpriteObject_ZebesExplosion_Stars_Left 
    dw Instruction_CinematicSpriteObject_ZebesExplosion_Stars_Left 
    dw InstList_CinematicSpriteObjects_ExplodingZebes_Stars_Left 

CinematicSpriteObjectDefinitions_ClearTime:
    dw InitFunction_CinematicSpriteObject_ClearTime 
    dw PreInstruction_CinematicSpriteObject_Text 
    dw InstList_CinematicSpriteObjects_ClearTime_0 

CinematicSpriteObjectDefinitions_ClearTime_Hours_TensDigit:
    dw InitFunction_CinematicSpriteObject_ClearTime_Hours_TensDigit 
    dw PreInstruction_CinematicSpriteObject_Text 
    dw InstList_ClearTimeDigit_0 

CinematicSpriteObjectDefinitions_ClearTime_Hours_OnesDigit:
    dw InitFunction_CinematicSpriteObject_ClearTime_Hours_OnesDigit 
    dw PreInstruction_CinematicSpriteObject_Text 
    dw InstList_ClearTimeDigit_0 

CinematicSpriteObjectDefinitions_ClearTime_Colon:
    dw InitFunction_CinematicSpriteObject_ClearTime_Colon 
    dw PreInstruction_CinematicSpriteObject_Text 
    dw InstList_CinematicSpriteObject_ClearTime_Colon 

CinematicSpriteObjectDefinitions_ClearTime_Minutes_TensDigit:
    dw InitFunction_CineSpriteObject_ClearTime_Minutes_TensDigit 
    dw PreInstruction_CinematicSpriteObject_Text 
    dw InstList_ClearTimeDigit_0 

CinematicSpriteObjectDefinitions_ClearTime_Minutes_OnesDigit:
    dw InitFunction_CineSpriteObject_ClearTime_Minutes_OnesDigit 
    dw PreInstruction_CinematicSpriteObject_Text 
    dw InstList_ClearTimeDigit_0 

CinematicSpriteObjectDefinitions_CrittersEscape:
    dw InitFunction_CinematicSpriteObject_CrittersEscape 
    dw PreInstruction_CinematicSpriteObject_CrittersEscape 
    dw InstList_CinematicSpriteObject_CrittersEscape 

CinematicSpriteObjectDefinitions_SuitlessSamus_Idle:
    dw InitFunction_CinematicSpriteObject_SuitlessSamus 
    dw PreInstruction_CinematicSpriteObject_Samus_Idle 
    dw InstList_CinematicSpriteObject_SuitlessSamus_Idle 

CinematicSpriteObjectDefinitions_SuitlessSamus_Idle_Legs:
    dw InitFunction_CinematicSpriteObject_SuitlessSamus 
    dw PreInstruction_CinematicSpriteObject_Samus_Idle 
    dw InstList_CinematicSpriteObject_SuitlessSamus_Idle_Legs 

CinematicSpriteObjectDefs_SuitlessSamus_LettingHairDown:
    dw InitFunction_CinematicSpriteObject_SuitlessSamus 
    dw RTS_8BF51C 
    dw InstList_CinematicSpriteObject_SuitlessSamus_LettingHairDown 

CinematicSpriteObjectDefs_SuitlessSamus_LettingHairDown_Legs:
    dw InitFunction_CinematicSpriteObject_SuitlessSamus 
    dw RTS_8B93D9 
    dw InstList_CineSpriteObject_SuitlessSamus_LettingHairDown_Legs 

CinematicSpriteObjectDefinitions_SuitlessSamus_Jump:
    dw InitFunction_CinematicSpriteObject_SuitlessSamus 
    dw RTS_8B93D9 
    dw InstList_CinematicSpriteObject_SuitlessSamus_Jump_0 

CinematicSpriteObjectDefinitions_SuitedSamus_Idle_Body:
    dw InitFunction_CinematicSpriteObject_SuitedSamus_Body_Arm 
    dw PreInstruction_CinematicSpriteObject_Samus_Idle 
    dw InstList_CinematicSpriteObject_SuitedSamus_Idle_Body 

CinematicSpriteObjectDefs_SuitedSamus_Idle_Head_Helmet:
    dw InitFunction_CinematicSpriteObject_SuitedSamus_Head_Helmet 
    dw PreInstruction_CinematicSpriteObject_Samus_Idle 
    dw InstList_CinematicSpriteObject_SuitedSamus_Idle_Head_Helmet 

CinematicSpriteObjectDefinitions_SuitedSamus_Idle_Head:
    dw InitFunction_CinematicSpriteObject_SuitedSamus_Head 
    dw PreInstruction_CinematicSpriteObject_Samus_Idle 
    dw InstList_CinematicSpriteObject_SuitedSamus_Head 

CinematicSpriteObjectDefinitions_ThumbsUp_Body:
    dw InitFunction_CinematicSpriteObject_SuitedSamus_Body_Arm 
    dw RTS_8B93D9 
    dw InstList_CinematicSpriteObject_SuitedSamus_ThumbsUp_Body 

CinematicSpriteObjectDefinitions_ThumbsUp_Arm:
    dw InitFunction_CinematicSpriteObject_SuitedSamus_Body_Arm 
    dw RTS_8B93D9 
    dw InstList_CinematicSpriteObject_SuitedSamus_ThumbsUp_Arm 

CinematicSpriteObjectDefinitions_ThumbsUp_Head_Helmet:
    dw InitFunction_CinematicSpriteObject_SuitedSamus_Head_Helmet 
    dw RTS_8B93D9 
    dw InstList_CineSpriteObject_SuitedSamus_ThumbsUp_Head_Helmet 

CinematicSpriteObjectDefinitions_ThumbsUp_Head:
    dw InitFunction_CinematicSpriteObject_SuitedSamus_Head 
    dw RTS_8B93D9 
    dw InstList_CinematicSpriteObject_SuitedSamus_ThumbsUp_Head 

CinematicSpriteObjectDefinitions_Jump_Body:
    dw InitFunction_CinematicSpriteObject_SuitedSamus_Body_Arm 
    dw RTS_8B93D9 
    dw InstList_CinematicSpriteObject_SuitedSamus_Jump_Body_0 

CinematicSpriteObjectDefinitions_Jump_Head_Helmet:
    dw InitFunction_CinematicSpriteObject_SuitedSamus_Head_Helmet 
    dw RTS_8B93D9 
    dw InstList_CineSpriteObject_SuitedSamus_Jump_Head_Helmet_0 

CinematicSpriteObjectDefinitions_Jump_Head:
    dw InitFunction_CinematicSpriteObject_SuitedSamus_Head 
    dw RTS_8B93D9 
    dw InstList_CinematicSpriteObject_SuitedSamus_Jump_Head_0 

CinematicSpriteObjectDefinitions_SuperMetroidIcon_S_TopHalf:
    dw InitFunction_CineSpriteObject_SuperMetroidIcon_S_TopHalf 
    dw PreInstruction_CineSpriteObject_SuperMetroidIcon_S_TopHalf 
    dw InstList_CinematicSpriteObject_SuperMetroidIcon_S_TopHalf 

CinematicSpriteObjectDefs_SuperMetroidIcon_S_BottomHalf:
    dw InitFunction_CineSpriteObject_SuperMetroidIcon_S_BottomHalf 
    dw Instruction_CineSpriteObject_SuperMetroidIcon_S_BottomHalf 
    dw InstList_CinematicSpriteObject_SuperMetroidIcon_S_BottomHalf 

CinematicSpriteObjectDefs_SuperMetroidIcon_Circle_TopHalf:
    dw InitFunc_CineSpriteObject_SuperMetroidIcon_Circle_TopHalf 
    dw RTS_8B93D9 
    dw InstList_CineSpriteObject_SuperMetroidIcon_Circle_TopHalf_0 

CinematicSpriteObjectDefs_SuperMetroidIcon_Circle_BottomHalf:
    dw InitFunc_CineSpriteObject_SuperMetroidIcon_Circle_BottomHalf 
    dw RTS_8B93D9 
    dw InstList_CineSpriteObject_SuperMetroidIcon_Circle_BotHalf_0 

InitFunction_CinematicSpriteObject_CrittersEscape:
    LDA.W #$0080 
    STA.W $1A9D,Y 
    LDA.W #$0080 
    STA.W $1A7D,Y 
    LDA.W #$0E00 
    STA.W $1ABD,Y 
    LDA.W #$0104 
    STA.W $1B7D,Y 
    RTS 


PreInstruction_CinematicSpriteObject_CrittersEscape:
    LDA.W $1AFD,X 
    CLC 
    ADC.W #$0080 
    STA.W $1AFD,X 
    LDA.W $1A9D,X 
    ADC.W #$0000 
    STA.W $1A9D,X 
    LDA.W $1ADD,X 
    CLC 
    ADC.W #$0000 
    STA.W $1ADD,X 
    LDA.W $1A7D,X 
    ADC.W #$0001 
    STA.W $1A7D,X 
    CMP.W #$0110 
    BMI .return 
    LDA.W #$0001 
    STA.W $1B5D,X 
    LDA.W #InstList_CinematicSpriteObject_Delete_duplicate 
    STA.W $1B1D,X 

.return:
    RTS 


InitFunction_CinematicSpriteObject_ExplodingZebes_Palette7:
    LDA.W #$0080 
    STA.W $1A7D,Y 

CommonInit_ExplodingZebes_Palette7:
    LDA.W #$0080 
    STA.W $1A9D,Y 
    LDA.W #$0E00 
    STA.W $1ABD,Y 
    RTS 


InitFunction_CinematicSpriteObject_ZebesExplosion_Stars_Left:
    LDA.W #$FF80 
    STA.W $1A7D,Y 
    BRA CommonInit_ExplodingZebes_Palette7 


InitFunction_CinematicSpriteObject_ExplodingZebes_Palette5:
    LDA.W #$0080 
    STA.W $1A7D,Y 
    LDA.W #$0080 
    STA.W $1A9D,Y 
    LDA.W #$0A00 
    STA.W $1ABD,Y 
    RTS 


InitFunction_CinematicSpriteObject_ZebesExplosion_AfterGlow:
    LDA.W #$0080 
    STA.W $1A7D,Y 
    LDA.W #$0080 
    STA.W $1A9D,Y 
    LDA.W #$0C00 
    STA.W $1ABD,Y 
    RTS 


InitFunc_CineSpriteObj_TheOperationWasCompletedSuccessfully:
    LDA.W #$0080 
    STA.W $1A7D,Y 
    LDA.W #$0060 
    STA.W $1A9D,Y 
    LDA.W #$0400 
    STA.W $1ABD,Y 
    RTS 


InitFunction_CinematicSpriteObject_ClearTime:
    LDA.W #$0080 
    STA.W $1A7D,Y 
    LDA.W #$00A0 
    STA.W $1A9D,Y 
    LDA.W #$0200 
    STA.W $1ABD,Y 
    RTS 


CommonInit_ClearTime:
    LDA.W #$00A0 
    STA.W $1A9D,Y 
    LDA.W #$0000 
    STA.W $1ABD,Y 
    RTS 


InitFunction_CinematicSpriteObject_ClearTime_Hours_TensDigit:
    LDA.W $0DEC 
    JSR.W CinematicSpriteObject_InstListPointer_PlusA_Times8 
    LDA.W #$009C 
    STA.W $1A7D,Y 
    JMP.W CommonInit_ClearTime 


InitFunction_CinematicSpriteObject_ClearTime_Hours_OnesDigit:
    LDA.W $0DEE 
    JSR.W CinematicSpriteObject_InstListPointer_PlusA_Times8 
    LDA.W #$00A4 
    STA.W $1A7D,Y 
    JMP.W CommonInit_ClearTime 


InitFunction_CinematicSpriteObject_ClearTime_Colon:
    LDA.W #$00AC 
    STA.W $1A7D,Y 
    JMP.W CommonInit_ClearTime 


InitFunction_CineSpriteObject_ClearTime_Minutes_TensDigit:
    LDA.W $0DF0 
    JSR.W CinematicSpriteObject_InstListPointer_PlusA_Times8 
    LDA.W #$00B4 
    STA.W $1A7D,Y 
    JMP.W CommonInit_ClearTime 


InitFunction_CineSpriteObject_ClearTime_Minutes_OnesDigit:
    LDA.W $0DF2 
    JSR.W CinematicSpriteObject_InstListPointer_PlusA_Times8 
    LDA.W #$00BC 
    STA.W $1A7D,Y 
    JMP.W CommonInit_ClearTime 


CinematicSpriteObject_InstListPointer_PlusA_Times8:
    ASL #3
    STA.B $12 
    LDA.W $1B1D,Y 
    CLC 
    ADC.B $12 
    STA.W $1B1D,Y 
    RTS 


InitFunction_CinematicSpriteObject_YellowClouds_Top_TopHalf:
    LDA.W #$FFA0 
    STA.W $1A9D,Y 

CommonInit_YellowClouds_TopBottom:
    LDA.W $1B9D 
    BEQ .noInitParam 
    LDA.W #$0180 
    STA.W $1A7D,Y 
    LDA.W #$0A00 
    STA.W $1ABD,Y 
    LDA.W $1B1D,Y 
    CLC 
    ADC.W #$0004 
    STA.W $1B1D,Y 
    RTS 


.noInitParam:
    LDA.W #$0080 
    STA.W $1A7D,Y 
    LDA.W #$0A00 
    STA.W $1ABD,Y 
    RTS 


InitFunction_CineSpriteObject_YellowClouds_Top_BottomHalf:
    LDA.W #$FFE0 
    STA.W $1A9D,Y 
    BRA CommonInit_YellowClouds_TopBottom 


InitFunction_CineSpriteObject_YellowClouds_Bottom_TopHalf:
    LDA.W #$0120 
    STA.W $1A9D,Y 
    BRA CommonInit_YellowClouds_TopBottom 


InitFunction_CineSpriteObject_YellowClouds_Bottom_BottomHalf:
    LDA.W #$0160 
    STA.W $1A9D,Y 
    BRA CommonInit_YellowClouds_TopBottom 


InitFunction_CinematicSpriteObject_YellowClouds_Right:
    LDA.W #$0140 
    STA.W $1A7D,Y 
    LDA.W $1B9D 
    BEQ .noInitParam 
    LDA.W #$01C0 
    STA.W $1A9D,Y 
    LDA.W #$0A00 
    STA.W $1ABD,Y 
    RTS 


.noInitParam:
    LDA.W #$00C0 
    STA.W $1A9D,Y 
    LDA.W #$0A00 
    STA.W $1ABD,Y 
    RTS 


InitFunction_CinematicSpriteObject_YellowClouds_Left:
    LDA.W #$FFC0 
    STA.W $1A7D,Y 
    LDA.W $1B9D 
    BEQ .noInitParam 
    LDA.W #$FF40 
    STA.W $1A9D,Y 
    LDA.W #$0A00 
    STA.W $1ABD,Y 
    RTS 


.noInitParam:
    LDA.W #$0040 
    STA.W $1A9D,Y 
    LDA.W #$0A00 
    STA.W $1ABD,Y 
    RTS 


InitFunction_CinematicSpriteObject_SuitlessSamus:
    LDA.W #$0078 
    STA.W $1A7D,Y 
    LDA.W #$0088 
    STA.W $1A9D,Y 
    LDA.W #$0A00 
    STA.W $1ABD,Y 
    RTS 


InitFunction_CinematicSpriteObject_SuitedSamus_Body_Arm:
    LDA.W #$0078 
    STA.W $1A7D,Y 
    LDA.W #$0098 
    STA.W $1A9D,Y 
    LDA.W #$0C00 
    STA.W $1ABD,Y 
    RTS 


InitFunction_CinematicSpriteObject_SuitedSamus_Head_Helmet:
    LDA.W #$007C 
    STA.W $1A7D,Y 
    LDA.W #$006C 
    STA.W $1A9D,Y 
    LDA.W #$0C00 
    STA.W $1ABD,Y 
    RTS 


InitFunction_CinematicSpriteObject_SuitedSamus_Head:
    LDA.W #$0079 
    STA.W $1A7D,Y 
    LDA.W #$006B 
    STA.W $1A9D,Y 
    LDA.W #$0A00 
    STA.W $1ABD,Y 
    RTS 


InitFunction_CineSpriteObject_SuperMetroidIcon_S_TopHalf:
    LDA.W #$0212 
    STA.W $1A7D,Y 
    LDA.W #$00E7 
    STA.W $1A9D,Y 
    LDA.W #$0E00 
    STA.W $1ABD,Y 
    LDA.W #$0008 
    STA.W $1B7D,Y 
    RTS 


InitFunction_CineSpriteObject_SuperMetroidIcon_S_BottomHalf:
    LDA.W #$00F6 
    STA.W $1A7D,Y 
    LDA.W #$0207 
    STA.W $1A9D,Y 
    LDA.W #$0E00 
    STA.W $1ABD,Y 
    LDA.W #$0008 
    STA.W $1B7D,Y 
    RTS 


InitFunc_CineSpriteObject_SuperMetroidIcon_Circle_TopHalf:
    LDA.W #$0181 
    STA.W $1A7D,Y 
    LDA.W #$016E 
    STA.W $1A9D,Y 
    LDA.W #$0E00 
    STA.W $1ABD,Y 
    RTS 


InitFunc_CineSpriteObject_SuperMetroidIcon_Circle_BottomHalf:
    LDA.W #$0187 
    STA.W $1A7D,Y 
    LDA.W #$0180 
    STA.W $1A9D,Y 
    LDA.W #$0E00 
    STA.W $1ABD,Y 
    RTS 


PreInstruction_CineSpriteObject_SuperMetroidIcon_S_TopHalf:
    LDA.W $1A9D,X 
    CLC 
    ADC.W $1B7D,X 
    STA.W $1A9D,X 
    LDA.W $1A7D,X 
    SEC 
    SBC.W $1B7D,X 
    STA.W $1A7D,X 
    CMP.W #$018B 
    BPL + 
    LDA.W #$018A 
    STA.W $1A7D,X 
    LDA.W #$016F 
    STA.W $1A9D,X 
    LDA.W #RTS_8B93D9 
    STA.W $1B3D,X 
    PHY 
    LDY.W #PaletteFXObjects_PostCreditsSuperMetroidIcon 
    JSL.L Spawn_PaletteFXObject 
    PLY 
    RTS 


  + LDA.W $1B7D,X 
    CLC 
    ADC.W #$0002 
    STA.W $1B7D,X 
    RTS 


Instruction_CineSpriteObject_SuperMetroidIcon_S_BottomHalf:
    LDA.W $1A9D,X 
    SEC 
    SBC.W $1B7D,X 
    STA.W $1A9D,X 
    LDA.W $1A7D,X 
    CLC 
    ADC.W $1B7D,X 
    STA.W $1A7D,X 
    CMP.W #$017E 
    BMI + 
    LDA.W #$017E 
    STA.W $1A7D,X 
    LDA.W #$017F 
    STA.W $1A9D,X 
    LDA.W #RTS_8B93D9 
    STA.W $1B3D,X 
    RTS 


  + LDA.W $1B7D,X 
    CLC 
    ADC.W #$0002 
    STA.W $1B7D,X 
    RTS 


Instruction_GreyOutSuperMetroidIcon:
    SEP #$20 
    LDA.B #$03 
    STA.B $69 
    LDA.B #$10 
    STA.B $6B 
    LDA.B #$02 
    STA.B $6F 
    LDA.B #$22 
    STA.B $72 
    LDA.B #$64 
    STA.B $5D 
    LDA.B #$54 
    STA.B $59 
    REP #$20 
    STZ.W $1A49 
    LDA.W #CinematicFunction_PostCredits_GreyOutSuperMetroidIcon 
    STA.W $1F51 
    RTS 


Instruction_FadeOutZoomedOutExplodingZebes:
    PHY 
    LDY.W #PaletteFXObjects_FadeOutZoomedOutExplodingZebes 
    JSL.L Spawn_PaletteFXObject 
    LDA.W #$0001 
    STA.L $7EC1FC 
    PLY 
    RTS 


Instruction_CineSpriteObjectSpawnZebesExplosionSilhouette:
    PHY 
    LDY.W #CinematicSpriteObjectDefinitions_ZebesExplosion_Silhouette 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDA.W #$7FFF 
    STA.L $7EC000 
    PLY 
    RTS 


PreInst_CineSpriteObj_ExplodingZebes_PurpleGlow_Stars_Lava:
    LDA.W $1B3B 
    BNE .return 
    LDA.W #$0001 
    STA.W $1B5D,X 
    LDA.W #InstList_CinematicSpriteObject_Delete_duplicate 
    STA.W $1B1D,X 

.return:
    RTS 


Instruction_CinematicSpriteObject_StartZebesExplosion:
    PHY 
    SEP #$20 
    LDA.B #$11 
    STA.B $69 
    LDA.B #$02 
    STA.B $6B 
    LDA.B #$02 
    STA.B $6F 
    LDA.B #$11 
    STA.B $72 
    LDA.B #$7C 
    STA.B $59 
    REP #$20 
    LDY.W #CinematicSpriteObjectDefinitions_ZebesExplosion_Stars_Right 
    STZ.B $12 
    JSR.W Spawn_CinematicSpriteObject_YToIndex12 
    LDY.W #CinematicSpriteObjectDefinitions_ZebesExplosion_Stars_Left 
    LDA.W #$0002 
    STA.B $12 
    JSR.W Spawn_CinematicSpriteObject_YToIndex12 
    LDY.W #PaletteFXObjects_WidePartOfZebesExplosion_Foreground 
    JSL.L Spawn_PaletteFXObject 
    LDY.W #PaletteFXObjects_WhiteOutSpaceDuringZebesExplosion 
    JSL.L Spawn_PaletteFXObject 
    LDY.W #PaletteFXObjects_WidePartOfZebesExplosion_Background 
    JSL.L Spawn_PaletteFXObject 
    PLY 
    RTS 


Instruction_ZebesExplosionFinale:
    PHY 
    SEP #$20 
    LDA.B #$03 
    STA.B $69 
    LDA.B #$12 
    STA.B $6B 
    LDA.B #$02 
    STA.B $6F 
    LDA.B #$33 
    STA.B $72 
    LDA.B #$74 
    STA.B $58 
    LDA.B #$78 
    STA.B $59 
    REP #$20 
    LDY.W #PaletteFXObjects_ZebesExplosionFinale 
    JSL.L Spawn_PaletteFXObject 
    LDY.W #CinematicSpriteObjectDefinitions_ZebesExplosion_AfterGlow 
    LDA.W #$0006 
    STA.B $12 
    JSR.W Spawn_CinematicSpriteObject_YToIndex12 
    PLY 
    RTS 


Instruction_EndZebesExplosion:
    PHY 
    SEP #$20 
    STZ.B $69 
    STZ.B $6B 
    REP #$20 
    LDA.W #$7FFF 
    STA.L $7EC000 
    STA.L $7EC100 
    PHX 
    LDX.W #$001E 

.loop:
    STA.L $7EC020,X 
    DEX 
    DEX 
    BPL .loop 
    PLX 
    LDA.W #CinematicFunc_Ending_SpaceView_ChangeMusic 
    STA.W $1F51 
    LDA.W #$0078 
    STA.W $1A49 
    PLY 
    RTS 


Instruction_CinematicSpriteObject_ZebesExplosion_Stars_Left:
    LDA.W $1F51 
    CMP.W #CinematicFunc_Ending_SpaceView_GunshipEmergence_SpinningFast 
    BNE .return 
    LDA.W #PreInst_CineSpriteObject_ZebesExplosion_Stars_Left_Moving 
    STA.W $1B3D,X 
    LDA.W #$4000 
    STA.W $1AFD,X 
    LDA.W #$0000 
    STA.W $1B7D,X 

.return:
    RTS 


PreInst_CineSpriteObject_ZebesExplosion_Stars_Left_Moving:
    LDA.W $1AFD,X 
    CLC 
    ADC.W #$FFE0 
    STA.W $1AFD,X 
    LDA.W $1B7D,X 
    ADC.W #$FFFF 
    STA.W $1B7D,X 
    LDA.W $1ADD,X 
    CLC 
    ADC.W $1AFD,X 
    STA.W $1ADD,X 
    LDA.W $1A7D,X 
    ADC.W $1B7D,X 
    STA.W $1A7D,X ; fallthrough to PreInstruction_CineSpriteObject_ZebesExplosion_AfterGlow

PreInstruction_CineSpriteObject_ZebesExplosion_AfterGlow:
    LDA.W $1F51 
    CMP.W #RTS_8BDE63 
    BNE .return 
    LDA.W #$0001 
    STA.W $1B5D,X 
    LDA.W #InstList_CinematicSpriteObject_Delete_duplicate 
    STA.W $1B1D,X 

.return:
    RTS 


Instruction_CinematicSpriteObject_SpawnCompletedSuccessfully:
    PHY 
    LDY.W #CinematicSpriteObjectDefinitions_CompletedSuccessfully 
    JSR.W Spawn_CinematicSpriteObject_Y 
    PLY 
    RTS 


PreInstruction_CinematicSpriteObject_Text:
    LDA.W $1F51 
    CMP.W #CinematicFunction_Credits_Setup 
    BNE .return 
    LDA.W #$0001 
    STA.W $1B5D,X 
    LDA.W #InstList_CinematicSpriteObject_Delete_duplicate 
    STA.W $1B1D,X 

.return:
    RTS 


Instruction_CinematicSpriteObject_SpawnClearTime:
    PHY 
    LDY.W #CinematicSpriteObjectDefinitions_ClearTime 
    JSR.W Spawn_CinematicSpriteObject_Y 
    LDA.W $09E0 
    STA.W $4204 
    SEP #$20 
    LDA.B #$0A 
    STA.W $4206 
    NOP 
    NOP 
    NOP 
    NOP 
    NOP 
    NOP 
    NOP 
    REP #$20 
    LDA.W $4214 
    STA.W $0DEC 
    LDA.W $4216 
    STA.W $0DEE 
    LDA.W $09DE 
    STA.W $4204 
    SEP #$20 
    LDA.B #$0A 
    STA.W $4206 
    NOP 
    NOP 
    NOP 
    NOP 
    NOP 
    NOP 
    NOP 
    REP #$20 
    LDA.W $4214 
    STA.W $0DF0 
    LDA.W $4216 
    STA.W $0DF2 
    PLY 
    RTS 


Instruction_CineSpriteObject_SpawnClearTime_Hours_TensDigit:
    PHY 
    LDY.W #CinematicSpriteObjectDefinitions_ClearTime_Hours_TensDigit 
    JSR.W Spawn_CinematicSpriteObject_Y 
    PLY 
    RTS 


Instruction_CineSpriteObject_SpawnClearTime_Hours_OnesDigit:
    PHY 
    LDY.W #CinematicSpriteObjectDefinitions_ClearTime_Hours_OnesDigit 
    JSR.W Spawn_CinematicSpriteObject_Y 
    PLY 
    RTS 


Instruction_CinematicSpriteObject_SpawnClearTime_Colon:
    PHY 
    LDY.W #CinematicSpriteObjectDefinitions_ClearTime_Colon 
    JSR.W Spawn_CinematicSpriteObject_Y 
    PLY 
    RTS 


Inst_CineSpriteObject_SpawnClearTime_Minutes_TensDigit:
    PHY 
    LDY.W #CinematicSpriteObjectDefinitions_ClearTime_Minutes_TensDigit 
    JSR.W Spawn_CinematicSpriteObject_Y 
    PLY 
    RTS 


Inst_CineSpriteObject_SpawnClearTime_Minutes_OnesDigit:
    PHY 
    LDY.W #CinematicSpriteObjectDefinitions_ClearTime_Minutes_OnesDigit 
    JSR.W Spawn_CinematicSpriteObject_Y 
    PLY 
    RTS 


Instruction_CinematicSpriteObject_TransitionToCredits:
    STZ.W $0723 
    STZ.W $0725 
    LDA.W #CinematicFunction_Ending_SpaceView_GunshipEmergence_Credits 
    STA.W $1F51 
    RTS 


PreInstruction_CinematicSpriteObject_YellowClouds_Top:
    LDA.W $198F 
    CMP.W #$00B0 
    BPL .return 
    LDA.W #PreInstruction_CinematicSpriteObject_YellowClouds_Top_Moving 
    STA.W $1B3D,X 

.return:
    RTS 


PreInstruction_CinematicSpriteObject_YellowClouds_Top_Moving:
    LDA.W $1AFD,X 
    CLC 
    ADC.W #$0000 
    STA.W $1AFD,X 
    LDA.W $1A9D,X 
    ADC.W #$0001 
    STA.W $1A9D,X 
    RTS 


PreInstruction_CinematicSpriteObject_YellowClouds_Bottom:
    LDA.W $198F 
    CMP.W #$00B0 
    BPL .return 
    LDA.W #PreInstruction_CineSpriteObject_YellowClouds_Bottom_Moving 
    STA.W $1B3D,X 

.return:
    RTS 


PreInstruction_CineSpriteObject_YellowClouds_Bottom_Moving:
    LDA.W $1AFD,X 
    SEC 
    SBC.W #$0000 
    STA.W $1AFD,X 
    LDA.W $1A9D,X 
    SBC.W #$0001 
    STA.W $1A9D,X 
    RTS 


PreInstruction_CinematicSpriteObject_YellowClouds_Right:
    LDA.W $198F 
    CMP.W #$0060 
    BMI .return 
    LDA.W #PreInstruction_CineSpriteObject_YellowClouds_Right_Moving 
    STA.W $1B3D,X 

.return:
    RTS 


PreInstruction_CineSpriteObject_YellowClouds_Right_Moving:
    LDA.W $1AFD,X 
    SEC 
    SBC.W #$0000 
    STA.W $1AFD,X 
    LDA.W $1A9D,X 
    SBC.W #$0002 
    STA.W $1A9D,X 
    LDA.W $1ADD,X 
    SEC 
    SBC.W #$0000 
    STA.W $1ADD,X 
    LDA.W $1A7D,X 
    SBC.W #$0001 
    STA.W $1A7D,X 
    RTS 


PreInstruction_CinematicSpriteObject_YellowClouds_Left:
    LDA.W $198F 
    CMP.W #$0060 
    BMI .return 
    LDA.W #PreInstruction_CineSpriteObject_YellowClouds_Left_Moving 
    STA.W $1B3D,X 

.return:
    RTS 


PreInstruction_CineSpriteObject_YellowClouds_Left_Moving:
    LDA.W $1AFD,X 
    CLC 
    ADC.W #$0000 
    STA.W $1AFD,X 
    LDA.W $1A9D,X 
    ADC.W #$0002 
    STA.W $1A9D,X 
    LDA.W $1ADD,X 
    CLC 
    ADC.W #$0000 
    STA.W $1ADD,X 
    LDA.W $1A7D,X 
    ADC.W #$0001 
    STA.W $1A7D,X 
    RTS 


PreInstruction_CinematicSpriteObject_Samus_Idle:
    LDA.W $1F51 
    CMP.W #RTS_8BDB9D 
    BNE .return 
    LDA.W #$0001 
    STA.W $1B5D,X 
    LDA.W #InstList_CinematicSpriteObject_Delete_duplicate 
    STA.W $1B1D,X 

.return:
    RTS 


RTS_8BF51C:
    RTS 


Instruction_CinematicSpriteObject_SpawnSuitlessSamusJump:
    PHY 
    LDY.W #CinematicSpriteObjectDefinitions_SuitlessSamus_Jump 
    STZ.B $12 
    JSR.W Spawn_CinematicSpriteObject_YToIndex12 
    PLY 
    RTS 


Inst_CineSpriteObject_SpawnSuitlessSamus_LettingHairDown:
    JSR.W MoveJumpingEndingSamus 
    LDA.W $1A9D,X 
    CMP.W #$FFB0 
    BPL .return 
    SEP #$20 
    LDA.B #$03 
    STA.B $52 
    REP #$20 
    LDA.W #$0001 
    STA.W $1B5D,X 
    LDA.W #InstList_Samus_Jump_Falling 
    STA.W $1B1D,X 
    LDA.W #PreInstruction_CinematicSpriteObject_Samus_Jump_Falling 
    STA.W $1B3D,X 
    LDA.W #$0C00 
    STA.W $1ABD,X 

.return:
    RTS 


Instruction_CinematicSpriteObject_SpawnSuitedSamusJump:
    PHY 
    LDA.W $09E0 
    CMP.W #$000A 
    BMI .gameTimeUnder10 
    LDY.W #CinematicSpriteObjectDefinitions_Jump_Head_Helmet 
    LDA.W #$0002 
    STA.B $12 
    JSR.W Spawn_CinematicSpriteObject_YToIndex12 
    BRA + 


.gameTimeUnder10:
    LDY.W #CinematicSpriteObjectDefinitions_Jump_Head 
    LDA.W #$0002 
    STA.B $12 
    JSR.W Spawn_CinematicSpriteObject_YToIndex12 

  + LDY.W #CinematicSpriteObjectDefinitions_Jump_Body 
    STZ.B $12 
    JSR.W Spawn_CinematicSpriteObject_YToIndex12 
    PLY 
    RTS 


PreInst_CinematicSpriteObject_SuitedSamus_Jump_Head_Jumping:
    JSR.W MoveJumpingEndingSamus 
    LDA.W $1A9D,X 
    CMP.W #$FFB0 
    BPL .return 
    LDA.W #$0001 
    STA.W $1B5D,X 
    LDA.W #InstList_CinematicSpriteObject_Delete_duplicate 
    STA.W $1B1D,X 

.return:
    RTS 


Instruction_CineSpriteObject_PositionSuitedHeadToPrepareJump:
    LDA.W $09E0 
    CMP.W #$000A 
    BMI .gameTimeUnder10 
    LDA.W #$0076 
    STA.W $1A7F,X 
    LDA.W #$0078 
    STA.W $1A9F,X 
    BRA .return 


.gameTimeUnder10:
    LDA.W #$0078 
    STA.W $1A7F,X 
    LDA.W #$0078 
    STA.W $1A9F,X 

.return:
    RTS 


Instruction_CinematicSpriteObject_PositionSamusHeadToJump:
    LDA.W $09E0 
    CMP.W #$000A 
    BMI .gameTimeUnder10 
    LDA.W #$0078 
    STA.W $1A7F,X 
    LDA.W #$0072 
    STA.W $1A9F,X 
    BRA .return 


.gameTimeUnder10:
    LDA.W #$0079 
    STA.W $1A7F,X 
    LDA.W #$0074 
    STA.W $1A9F,X 

.return:
    RTS 


PreInstruction_CinematicSpriteObject_Samus_Jump_Falling:
    JSR.W TransferPostCreditsSamusBeamToVRAM 
    JSR.W MoveJumpingEndingSamus 
    LDA.W $1A9D,X 
    CMP.W #$0088 
    BMI .return 
    LDA.W #$0088 
    STA.W $1A9D,X 
    LDA.W #$0001 
    STA.W $1B5D,X 
    LDA.W #InstList_Samus_Jump_Landed 
    STA.W $1B1D,X 
    LDA.W #RTS_8B93D9 
    STA.W $1B3D,X 

.return:
    RTS 


Instruction_CinematicSpriteObject_SamusShootsScreen:
    PHX 
    PHY 
    LDA.W #$0E00 
    STA.W $1ABD,X 
    LDA.W #CinematicFunction_PostCredits_SamusShootsScreen 
    STA.W $1F51 
    SEP #$20 
    LDA.B #$11 
    STA.B $69 
    LDA.B #$10 
    STA.B $6B 
    LDA.B #$02 
    STA.B $6F 
    LDA.B #$81 
    STA.B $72 
    REP #$20 
    LDA.W #$FFFC 
    STA.W $1993 
    LDA.W #$FFF8 
    STA.W $1997 
    LDA.W #$0010 
    STA.W $1A49 
    LDA.W #$0020 
    STA.W $1A4D 
    STA.W $1A4F 
    JSR.W PaletteCrossFading_CopyCurrentPalettesToFadingPalettes 
    JSR.W PaletteCrossFading_DecomposePaletteDataForFading 
    LDA.W #$0022 
    JSL.L QueueSound 
    PLY 
    PLX 
    RTS 


Instruction_CinematicSpriteObject_MakeEndingSamusJump:
    STZ.W $0B2C 
    LDA.W #$FFF0 
    STA.W $0B2E 
    RTS 


MoveJumpingEndingSamus:
    LDA.W $0B2C 
    CLC 
    ADC.W #$3800 
    STA.W $0B2C 
    LDA.W $0B2E 
    ADC.W #$0000 
    STA.W $0B2E 
    LDA.W $1AFD,X 
    CLC 
    ADC.W $0B2C 
    STA.W $1AFD,X 
    LDA.W $1A9D,X 
    ADC.W $0B2E 
    STA.W $1A9D,X 
    RTS 


TransferPostCreditsSamusBeamToVRAM:
    PHX 
    PHY 
    LDA.W $1A4D 
    CMP.W #$0010 
    BPL .return 
    ASL A 
    TAY 
    LDX.W $0330 
    LDA.W #$0800 
    STA.B $D0,X 
    INX 
    INX 
    LDA.W .sourceAddresses,Y 
    STA.B $D0,X 
    INX 
    INX 
    SEP #$20 
    LDA.B #$7F 
    STA.B $D0,X 
    REP #$20 
    INX 
    LDA.W .VRAMAddresses,Y 
    STA.B $D0,X 
    INX 
    INX 
    STX.W $0330 
    INC.W $1A4D 

.return:
    PLY 
    PLX 
    RTS 


.sourceAddresses:
    db $00,$40,$00,$48,$00,$50,$00,$58,$00,$60,$00,$68,$00,$70,$00,$78 
    db $00,$80,$00,$88,$00,$90,$00,$98,$00,$A0,$00,$A8,$00,$B0,$00,$B8 

.VRAMAddresses:
    db $00,$00,$00,$04,$00,$08,$00,$0C,$00,$10,$00,$14,$00,$18,$00,$1C 
    db $00,$20,$00,$24,$00,$28,$00,$2C,$00,$30,$00,$34,$00,$38,$00,$3C 

CreditsObjectDefinition:
    dw RTS_8B93D9 
    dw RTS_8B93D9 
    dw InstList_Credits_Start 

Instruction_EndCredits:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    PHX 
    PHY 
    JSR.W Disable_CreditsObject 
    LDX.W #$0008 

.loop:
    LDA.L Palettes_PostCredits,X 
    STA.L $7EC000,X 
    INX 
    INX 
    CPX.W #$0200 
    BMI .loop 
    SEP #$20 
    STZ.B $69 
    LDA.B #$80 
    STA.B $51 
    REP #$20 
    STZ.W $0723 
    STZ.W $0725 
    STZ.W $1995 
    STZ.W $1997 
    LDA.W #$0001 
    STA.W $1A05 
    LDA.W #CinematicFunction_PostCredits_BlankScreen 
    STA.W $1F51 
    LDA.W #$003C 
    STA.W $1A49 
    PLY 
    PLX 
    PLB 
    PLP 
    RTS 


CinematicBGObjectDefinitions_PostCredits_SeeYouNextMission:
    dw RTS_8B93D9 
    dw RTS_8B93D9 
    dw CinematicBGObjectInstLists_Ending_SeeYouNextMission 

CinematicBGObjectDefinitions_PostCredits_ItemPercentage:
    dw RTS_8B93D9 
    dw RTS_8B93D9 
    dw CinematicBGObjectInstLists_Ending_ItemPercentage 

Debug_VersionString:
; '02.02.21.30'
    db $30,$32,$2E,$30,$32,$2E,$32,$31,$2E,$33,$30,$00 

Freespace_Bank8B_F760: 
; $8A0 bytes
