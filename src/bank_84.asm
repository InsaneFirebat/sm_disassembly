
org $848000


GoldenTorizo_HealthBasedPalette_Handling:
    PHX 
    PHY 
    PHB 
    PHK 
    PLB 
    XBA 
    AND.W #$0078 
    BIT.W #$0040 
    BEQ + 
    LDA.W #$0038 

  + ASL #2
    ORA.W #$001E 
    TAY 
    LDX.W #$001E 

.loop:
    LDA.W .palette2,Y : STA.L $7EC140,X 
    LDA.W .palette1,Y : STA.L $7EC120,X 
    DEY #2
    DEX #2
    BPL .loop 
    PLB 
    PLY 
    PLX 
    RTL 


.palette1: 
    dw $1000,$56BA,$41B2,$1447,$0403,$4E15,$3570,$24CB,$1868,$6F7F,$51F8,$410E,$031F,$01DA,$00F5,$0C63 ; 0..7FFh
    dw $1000,$56DB,$39D3,$1047,$0403,$4636,$2D91,$20EC,$1489,$6F9B,$5215,$3D2C,$133B,$0DF6,$0CF2,$0C63 ; 800h..FFFh
    dw $1000,$52FB,$31F4,$1067,$0402,$3E76,$25B2,$192D,$10A9,$6F96,$5251,$396A,$2756,$1A13,$190F,$0863 ; 1000h..17FFh
    dw $1000,$531C,$2A15,$0C67,$0402,$3697,$1DD3,$154E,$0CCA,$6FB2,$526E,$3588,$3772,$262F,$250C,$0863 ; 1800h..1FFFh
    dw $1000,$4F5C,$1E56,$0888,$0001,$2EB8,$1A13,$116F,$0CEB,$73AD,$4EAA,$35A6,$4B8D,$364B,$3509,$0443 ; 2000h..27FFh
    dw $1000,$4F7D,$1677,$0488,$0001,$26D9,$1234,$0D90,$090C,$73C9,$4EC7,$31C4,$5BA9,$4267,$4106,$0443 ; 2800h..2FFFh
    dw $1000,$4B9D,$0E98,$04A8,$0000,$1F19,$0A55,$05D1,$052C,$73C4,$4F03,$2E02,$6FC4,$4E84,$4D23,$0043 ; 3000h..37FFh
    dw $0000,$4BBE,$06B9,$00A8,$0000,$173A,$0276,$01F2,$014D,$73E0,$4F20,$2A20,$7FE0,$5AA0,$5920,$0043 ; 3800h+

.palette2: 
    dw $1000,$4215,$2D0D,$0002,$0000,$3970,$20CB,$0C26,$0403,$463A,$28B3,$1809,$6F7F,$51FD,$4113,$0C63 ; 0..7FFh
    dw $1000,$4236,$252E,$0002,$0000,$3191,$1CEC,$0C47,$0424,$4656,$28D0,$1428,$6F7B,$51F9,$40F0,$0C63 ; 800h..FFFh
    dw $1000,$3E56,$214F,$0002,$0000,$29D1,$190D,$0888,$0424,$4693,$290E,$1046,$6F76,$4DF5,$40EE,$0842 ; 1000h..17FFh
    dw $1000,$3E77,$1970,$0002,$0000,$21F2,$152E,$08A9,$0445,$46AF,$292B,$0C65,$6F72,$4DF1,$40CB,$0842 ; 1800h..1FFFh
    dw $1000,$3AB7,$15B1,$0003,$0000,$1A13,$0D6E,$04CA,$0066,$4ACB,$2568,$0C84,$6B4D,$4A0C,$44C8,$0421 ; 2000h..27FFh
    dw $1000,$3AD8,$0DD2,$0003,$0000,$1234,$098F,$04EB,$0087,$4AE7,$2585,$08A3,$6B49,$4A08,$44A5,$0421 ; 2800h..2FFFh
    dw $1000,$36F8,$09F3,$0003,$0000,$0A74,$05B0,$012C,$0087,$4B24,$25C3,$04C1,$6B44,$4604,$44A3,$0000 ; 3000h..37FFh
    dw $1000,$3719,$0214,$0003,$0000,$0295,$01D1,$014D,$00A8,$4B40,$25E0,$00E0,$6B40,$4600,$4480,$0000 ; 3800h+

Load_Room_PLM_Graphics:
    PHP 
    PHB 
    REP #$30 
    PHK 
    PLB 
    STZ.W $1C2D 
    LDX.W #$0000 

.loop:
    PHX 
    LDY.W $1C2F,X 
    JSR.W Instruction_PLM_LoadItemPLMGFX 
    PLX 
    INX #2
    CPX.W #$0008 
    BNE .loop 
    PLB 
    PLP 
    RTL 


Clear_Sounds_When_Going_Through_Door:
    LDA.W #$001D 
    JSL.L Run_Samus_Command 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Clear_SpinJumpSound_GoingThroughDoor_848258:
    LDA.W $0A1E 
    AND.W #$FF00 
    CMP.W #$0300 
    BEQ .playSound 
    CMP.W #$1400 
    BNE .return 

.playSound:
    LDA.W #$0032 
    JSL.L QueueSound 

.return:
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


Play_SpinJumpSound_if_SpinJumping:
    LDA.W #$001C 
    JSL.L Run_Samus_Command 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Play_Resumed_SpinJumpSound_848278:
    LDA.W $0A1E 
    AND.W #$FF00 
    CMP.W #$0300 
    BEQ .playSound 
    CMP.W #$1400 
    BNE .return 

.playSound:
    LDA.W #$0030 
    JSL.L QueueSound 

.return:
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


Calculate_PLM_Block_Coordinates:
    LDA.W $1C87,X 
    LSR A 
    STA.W $4204 
    SEP #$20 
    LDA.W $07A5 : STA.W $4206 
    REP #$20 
    NOP #6
    LDA.W $4214 : STA.W $1C2B 
    LDA.W $4216 : STA.W $1C29 
    RTL 


Write_Level_Data_Block_Type_and_BTS:
    PHX 
    STA.B $12 
    SEP #$20 
    LDA.L $7F0003,X 
    AND.B #$0F 
    ORA.B $13 
    STA.L $7F0003,X 
    REP #$20 
    TXA 
    LSR A 
    TAX 
    SEP #$20 
    LDA.B $12 : STA.L $7F6402,X 
    REP #$20 
    PLX 
    RTS 


Write_Row_of_Level_Data_Block_and_BTS:
    PHX 
    PHY 
    LDY.W #$0001 
    LDA.B ($05,S),Y : STA.B $12 
    INY #2
    LDA.B ($05,S),Y : STA.B $14 
    INY #2
    LDA.B ($05,S),Y : STA.B $16 
    LDA.B $05,S : CLC : ADC.W #$0006 : STA.B $05,S 
    LDA.W $1C87,X 
    TAX 
    LSR A 
    PHA 
    LDA.B $12 
    LDY.B $16 

.loopLevelData:
    STA.L $7F0002,X 
    INX #2
    DEY 
    BNE .loopLevelData 
    SEP #$20 
    PLX 
    LDA.B $14 
    LDY.B $16 

.loopBTS:
    STA.L $7F6402,X 
    INX 
    DEY 
    BNE .loopBTS 
    REP #$20 
    PLY 
    PLX 
    RTS 


Load_Item_and_Room_Special_Xray_Blocks:
    PHP 
    PHB 
    REP #$30 
    PHX 
    PHY 
    PHK 
    PLB 
    LDX.W #$004E 

.loopPLM:
    LDA.W $1C37,X 
    CMP.W #PreInstruction_PLM_GotoLinkInstructionIfTriggered 
    BCC .next 
    PHX 
    LDA.W $1DC7,X 
    BMI .next 
    JSL.L BitIndexToByteIndexAndBitmask 
    LDA.L $7ED870,X 
    PLX 
    AND.W $05E7 
    BNE .next 
    PHX 
    JSL.L Calculate_PLM_Block_Coordinates 
    LDA.L $7EDF0C,X 
    TAY 
    LDX.W .InstructionPointers,Y 
    LDA.W $0002,X 
    AND.W #$0FFF 
    LDX.W $1C29 
    LDY.W $1C2B 
    JSL.L LoadBlockToXrayBG2Tilemap 
    PLX 

.next:
    DEX #2
    BPL .loopPLM 
    LDX.W $07BB 
    LDA.L $8F0010,X 
    BEQ .return 
    TAX 

.loopRoomVar:
    LDA.L $8F0000,X 
    BEQ .return 
    AND.W #$00FF 
    STA.B $12 
    LDA.L $8F0001,X : AND.W #$00FF : STA.B $14 
    PHX 
    LDA.L $8F0002,X 
    LDX.B $12 
    LDY.B $14 
    JSL.L LoadBlockToXrayBG2Tilemap 
    PLX 
    TXA 
    CLC : ADC.W #$0004 : TAX 
    JMP.W .loopRoomVar 


.return:
    PLY 
    PLX 
    PLB 
    PLP 
    RTL 


.InstructionPointers:
    dw DrawInst_DrawItemFrame0_0 
    dw DrawInst_DrawItemFrame0_1 
    dw DrawInst_DrawItemFrame0_2 
    dw DrawInst_DrawItemFrame0_3 
    dw DrawInst_EnergyTank_0 
    dw DrawInst_MissileTank_1 
    dw DrawInst_SuperMissileTank_1 
    dw DrawInst_PowerBombTank_0 

Enable_PLMs:
    PHP 
    REP #$20 
    LDA.W #$8000 
    TSB.W $1C23 
    PLP 
    RTL 


Disable_PLMs:
    PHP 
    REP #$20 
    LDA.W #$8000 
    TRB.W $1C23 
    PLP 
    RTL 


Clear_PLMs:
    PHP 
    REP #$30 
    PHX 
    LDX.W #$004E 

.loop:
    STZ.W $1C37,X 
    DEX #2
    BPL .loop 
    STZ.W $1C2D 
    PLX 
    PLP 
    RTL 


Spawn_Hardcoded_PLM:
    PHB 
    PHY 
    PHX 
    PHK 
    PLB 
    LDY.W #$004E 

.loop:
    LDA.W $1C37,Y 
    BEQ .found 
    DEY #2
    BPL .loop 
    LDA.B $06,S : CLC : ADC.W #$0004 : STA.B $06,S 
    PLX 
    PLY 
    PLB 
    SEC 
    RTL 


.found:
    SEP #$20 
    LDA.B $08,S 
    PHA 
    PLB 
    TYX 
    LDY.W #$0002 
    LDA.B ($06,S),Y : STA.W $4202 
    LDA.W $07A5 : STA.W $4203 
    LDY.W #$0001 
    LDA.B ($06,S),Y 
    REP #$20 
    AND.W #$00FF 
    CLC : ADC.W $4216 : ASL A 
    STA.W $1C87,X 
    LDY.W #$0003 
    LDA.B ($06,S),Y 
    TXY 
    TAX 
    LDA.B $06,S : CLC : ADC.W #$0004 : STA.B $06,S 
    PHK 
    PLB 
    TXA 
    STA.W $1C37,Y 
    TYX 
    TAY 
    LDA.W #$0000 : STA.W $1DC7,X 
    STA.L $7EDF0C,X 
    LDA.W #RTS_848469 : STA.W $1CD7,X 
    LDA.W $0002,Y : STA.W $1D27,X 
    LDA.W #$0001 : STA.L $7EDE1C,X 
    LDA.W #InstList_PLM_DefaultPLMDrawInstruction : STA.L $7EDE6C,X 
    STZ.W $1D77,X 
    STX.W $1C27 
    TYX 
    LDY.W $1C27 
    JSR.W ($0000,X) 
    PLX 
    PLY 
    PLB 
    CLC 
    RTL 


RTS_848469:
    RTS 


Spawn_Room_PLM:
    PHP 
    PHB 
    PHY 
    PHX 
    PHK 
    PLB 
    LDY.W #$004E 

.loop:
    LDA.W $1C37,Y 
    BEQ .found 
    DEY #2
    BPL .loop 
    PLX 
    PLY 
    PLB 
    PLP 
    SEC 
    RTL 


.found:
    SEP #$20 
    LDA.L $8F0003,X : STA.W $4202 
    LDA.W $07A5 : STA.W $4203 
    LDA.L $8F0002,X 
    REP #$20 
    AND.W #$00FF 
    CLC : ADC.W $4216 : ASL A 
    STA.W $1C87,Y 
    LDA.L $8F0004,X : STA.W $1DC7,Y 
    LDA.L $8F0000,X : STA.W $1C37,Y 
    TYX 
    TAY 
    LDA.W #$0000 : STA.L $7EDF0C,X 
    LDA.W #RTS_8484E6 : STA.W $1CD7,X 
    LDA.W $0002,Y : STA.W $1D27,X 
    LDA.W #$0001 : STA.L $7EDE1C,X 
    LDA.W #InstList_PLM_DefaultPLMDrawInstruction : STA.L $7EDE6C,X 
    STZ.W $1D77,X 
    STX.W $1C27 
    TYX 
    LDY.W $1C27 
    JSR.W ($0000,X) 
    PLX 
    PLY 
    PLB 
    PLP 
    CLC 
    RTL 


RTS_8484E6:
    RTS 


Spawn_PLM_to_CurrentBlockIndex:
    PHB 
    PHY 
    PHX 
    PHK 
    PLB 
    TAY 
    LDX.W #$004E 

.loop:
    LDA.W $1C37,X 
    BEQ .found 
    DEX #2
    BPL .loop 
    PLX 
    PLY 
    PLB 
    RTL 


.found:
    LDA.W $0DC4 
    ASL A 
    STA.W $1C87,X 
    TYA 
    STA.W $1C37,X 
    LDA.W #RTS_84853D : STA.W $1CD7,X 
    LDA.W $0002,Y : STA.W $1D27,X 
    LDA.W #$0001 : STA.L $7EDE1C,X 
    LDA.W #InstList_PLM_DefaultPLMDrawInstruction : STA.L $7EDE6C,X 
    LDA.W #$0000 : STA.W $1D77,X 
    STA.W $1DC7,X 
    STA.L $7EDF0C,X 
    STX.W $1C27 
    TYX 
    LDY.W $1C27 
    JSR.W ($0000,X) 
    PLX 
    PLY 
    PLB 
    RTL 


RTS_84853D:
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spawn_Enemy_PLM_84853E:
    PHB 
    PHY 
    PHX 
    PHK 
    PLB 
    TXY 
    PHA 
    LDX.W #$004E 

.loop:
    LDA.W $1C37,X 
    BEQ .found 
    DEX #2
    BPL .loop 
    PLA 
    PLX 
    PLY 
    PLB 
    RTL 


.found:
    LDA.W $0F7E,Y 
    LSR #4
    SEP #$20 
    STA.W $4202 
    LDA.W $07A5 : STA.W $4203 
    REP #$20 
    LDA.W $0F7A,Y 
    LSR #4
    CLC : ADC.W $4216 : ASL A 
    STA.W $1C87,X 
    PLA 
    STA.W $1C37,X 
    TAY 
    LDA.W #RTS_8485B3 : STA.W $1CD7,X 
    LDA.W $0002,Y : STA.W $1D27,X 
    LDA.W #$0001 : STA.L $7EDE1C,X 
    LDA.W #InstList_PLM_DefaultPLMDrawInstruction : STA.L $7EDE6C,X 
    LDA.W #$0000 : STA.W $1D77,X 
    STA.W $1DC7,X 
    STA.L $7EDF0C,X 
    STX.W $1C27 
    TYX 
    LDY.W $1C27 
    JSR.W ($0000,X) 
    PLX 
    PLY 
    PLB 
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


RTS_8485B3:
    RTS 


PLM_Handler:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    BIT.W $1C23 
    BPL .return 
    STZ.W $1C25 
    LDX.W #$004E 

.loop:
    STX.W $1C27 
    LDA.W $1C37,X 
    BEQ .next 
    JSR.W Process_PLM 
    LDX.W $1C27 

.next:
    DEX #2
    BPL .loop 

.return:
    PLB 
    PLP 
    RTL 


Process_PLM:
    JSR.W ($1CD7,X) 
    LDX.W $1C27 
    LDA.L $7EDE1C,X 
    DEC A 
    STA.L $7EDE1C,X 
    BNE .return 
    LDY.W $1D27,X 

.loop:
    LDA.W $0000,Y 
    BPL .nonZeroTimer 
    STA.B $12 
    INY #2
    PEA.W .loop-1 
    JMP.W ($0012) ; Execute ASM Instruction


.nonZeroTimer:
    STA.L $7EDE1C,X 
    LDA.W $0002,Y : STA.L $7EDE6C,X 
    TYA 
    CLC : ADC.W #$0004 : STA.W $1D27,X 
    JSR.W Process_PLM_Draw_Instruction 
    LDX.W $1C27 
    JSL.L Calculate_PLM_Block_Coordinates 
    JSR.W DrawPLM_HardCoded 

.return:
    RTS 


Process_PLM_Draw_Instruction:
    LDA.L $7EDE6C,X 
    TAY 
    LDA.W $1C87,X : STA.B $12 
    TAX 

.loopDrawEntry:
    LDA.W $0000,Y 
    BMI .column 
    AND.W #$00FF 
    STA.B $16 
    INY #2
    .loopRow:
    LDA.W $0000,Y : STA.L $7F0002,X 
    INY #2
    INX #2
    DEC.B $16 
    BNE .loopRow 
    JMP.W .next 


.column:
    AND.W #$00FF 
    STA.B $16 
    INY #2
    .loopColumn:
    LDA.W $0000,Y : STA.L $7F0002,X 
    INY #2
    TXA 
    CLC : ADC.W $07A5 : ADC.W $07A5 : TAX 
    DEC.B $16 
    BNE .loopColumn 

.next:
    LDA.W $0000,Y 
    BNE + 
    RTS 


  + DEY 
    LDA.W $0000,Y 
    XBA 
    BPL .positive 
    ORA.W #$FF00 
    BRA + 


.positive:
    AND.W #$00FF 

  + ASL A 
    CLC : ADC.B $12 : STA.B $14 
    LDA.W $0001,Y 
    XBA 
    BPL + 
    ORA.W #$FF00 
    EOR.W #$FFFF 
    INC A 
    TAX 
    LDA.W #$0000 

  - SEC : SBC.W $07A5 : DEX 
    BNE - 
    BRA .setX 


  + AND.W #$00FF 
    BEQ .setX 
    TAX 
    LDA.W #$0000 

  - CLC : ADC.W $07A5 : DEX 
    BNE - 

.setX:
    ASL A 
    CLC : ADC.B $14 : TAX 
    INY #3
    JMP.W .loopDrawEntry 


Instruction_PLM_Sleep:
    DEY #2
    TYA 
    STA.W $1D27,X 
    PLA 
    RTS 


Instruction_PLM_Delete:
    STZ.W $1C37,X 
    PLA 
    RTS 


Instruction_PLM_PreInstruction_inY:
    LDA.W $0000,Y : STA.W $1CD7,X 
    INY #2
    RTS 


Instruction_PLM_ClearPreInstruction:
    LDA.W #RTS_8486D0 : STA.W $1CD7,X 

RTS_8486D0:
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_PLM_CallFuctionInY_8486D1:
    LDA.W $0000,Y : STA.B $12 
    LDA.W $0001,Y : STA.B $13 
    PHY 
    JSL.L UNUSED_Instruction_PLM_CallFuctionInY_withA_8486E8 
    PLY 
    LDX.W $1C27 
    INY #3
    RTS 


UNUSED_Instruction_PLM_CallFuctionInY_withA_8486E8:
    JML.W [$0012] 

    LDA.W $0000,Y : STA.B $12 
    LDA.W $0001,Y : STA.B $13 
    LDA.W $0003,Y 
    PHY 
    JSL.L .externalFunction 
    PLY 
    LDX.W $1C27 
    TYA 
    CLC : ADC.W #$0005 : TAY 
    RTS 


.externalFunction:
    JML.W [$0012] 
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_PLM_CallFunctionInY:
    LDA.W $0000,Y : STA.B $12 
    LDA.W $0001,Y : STA.B $13 
    PHX 
    PHY 
    JSL.L .externalFunction 
    PLY 
    PLX 
    INY #3
    RTS 


.externalFunction:
    JML.W [$0012] 


Instruction_PLM_GotoY:
    LDA.W $0000,Y 
    TAY 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_PLM_GotoY_PlusMinusY_848729:
    STY.B $12 
    DEY 
    LDA.W $0000,Y 
    XBA 
    BMI .negative 
    AND.W #$00FF 
    BRA + 


.negative:
    ORA.W #$FF00 

  + CLC : ADC.B $12 : TAY 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_PLM_DecrementTimer_GotoYIfNonZero:
    DEC.W $1D77,X 
    BNE Instruction_PLM_GotoY 
    INY #2
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_PLM_DecrementTimer_GotoYIfNonZero_848747:
    DEC.W $1D77,X 
    BNE UNUSED_Instruction_PLM_GotoY_PlusMinusY_848729 
    INY 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_PLM_TimerEqualsY_8Bit:
    SEP #$20 
    LDA.W $0000,Y : STA.W $1D77,X 
    REP #$20 
    INY 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_PLM_TimerEqualsY_16Bit_84875A:
    LDA.W $0000,Y : STA.W $1D77,X 
    INY #2
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


RTS_848763:
    RTS 


Instruction_PLM_LoadItemPLMGFX:
    LDA.W $1C2D : STA.L $7EDF0C,X 
    TAX 
    INC #2
    AND.W #$0006 
    STA.W $1C2D 
    LDA.W .VRAMAddresses,X : STA.B $12 
    LDA.W .tileTableIndices,X : STA.B $14 
    LDA.W .startingTileNumbers,X : STA.B $16 
    TYA 
    STA.W $1C2F,X 
    LDX.W $0330 
    LDA.W #$0100 : STA.B $D0,X 
    LDA.W $0000,Y : STA.B $D2,X 
    LDA.W #$0089 : STA.B $D4,X 
    LDA.B $12 : STA.B $D5,X 
    TXA 
    CLC : ADC.W #$0007 : STA.W $0330 
    INY #2
    LDX.B $14 
    TXA 
    CLC : ADC.W #$0010 : STA.B $18 

.loop:
    LDA.W $0000,Y 
    AND.W #$00FF 
    XBA 
    ASL #2
    CLC : ADC.B $16 : STA.L $7EA000,X 
    INC.B $16 
    INY 
    INX #2
    CPX.B $18 
    BNE .loop 
    LDX.W $1C27 
    RTS 

.VRAMAddresses:
    dw $3E00,$3E80,$3F00,$3F80 
.tileTableIndices:
    dw $0470,$0480,$0490,$04A0 
.startingTileNumbers:
    dw $03E0,$03E8,$03F0,$03F8 


Instruction_PLM_TransferBytesToVRAM:
    LDX.W $0330 
    LDA.W $0000,Y : STA.B $D0,X 
    LDA.W $0002,Y : STA.B $D2,X 
    LDA.W $0003,Y : STA.B $D3,X 
    LDA.W $0005,Y : STA.B $D5,X 
    TXA 
    CLC : ADC.W #$0007 : STA.W $0330 
    TYA 
    CLC : ADC.W #$0007 : TAY 
    LDX.W $1C27 
    RTS 


Instruction_PLM_GotoY_ifBossBitsSet:
    LDA.W $0000,Y 
    INY 
    AND.W #$00FF 
    JSL.L CheckIfBossBitsForCurrentAreaMatchAnyBitsInA 
    BCC + 
    JMP.W Instruction_PLM_GotoY 


  + INY #2
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_PLM_SetBossBits_848821:
    LDA.W $0000,Y 
    AND.W #$00FF 
    JSL.L SetBossBitsInAForCurrentArea 
    INY 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_PLM_GotoY_ifEventIsSet:
    LDA.W $0000,Y 
    INY #2
    JSL.L CheckIfEvent_inA_HasHappened 
    BCC .return 
    JMP.W Instruction_PLM_GotoY 


.return:
    INY #2
    RTS 


Instruction_PLM_SetTheEvent:
    LDA.W $0000,Y 
    JSL.L MarkEvent_inA 
    INY #2
    RTS 


Instruction_PLM_GotoY_ifRoomArg_ChozoBlockDestroyed:
    PHX 
    LDA.W $1DC7,X 
    BMI .pullX 
    JSL.L BitIndexToByteIndexAndBitmask 
    LDA.L $7ED830,X 
    PLX 
    AND.W $05E7 
    BEQ .return 
    JMP.W Instruction_PLM_GotoY 


.return:
    INY #2
    RTS 


.pullX:
    PLX 
    BRA .return 


Instruction_PLM_SetRoomArg_ChozoBlockDestroyed:
    PHX 
    LDA.W $1DC7,X 
    BMI .return 
    JSL.L BitIndexToByteIndexAndBitmask 
    LDA.L $7ED830,X : ORA.W $05E7 : STA.L $7ED830,X 

.return:
    PLX 
    RTS 


Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected:
    PHX 
    LDA.W $1DC7,X 
    BMI .pullX 
    JSL.L BitIndexToByteIndexAndBitmask 
    LDA.L $7ED870,X 
    PLX 
    AND.W $05E7 
    BEQ .return 
    JMP.W Instruction_PLM_GotoY 


.return:
    INY #2
    RTS 


.pullX:
    PLX 
    BRA .return 


Instruction_PLM_SetRoomArg_ItemCollected:
    PHX 
    LDA.W $1DC7,X 
    BMI .return 
    JSL.L BitIndexToByteIndexAndBitmask 
    LDA.L $7ED870,X : ORA.W $05E7 : STA.L $7ED870,X 

.return:
    PLX 
    RTS 


Instruction_PLM_PickUpBeam_DisplayMessageBox:
    LDA.W $0000,Y : ORA.W $09A8 : STA.W $09A8 
    LDA.W $0000,Y : ORA.W $09A6 : STA.W $09A6 
    LDA.W $0000,Y 
    ASL A 
    AND.W #$0008 
    TRB.W $09A6 
    LDA.W $0000,Y 
    LSR A 
    AND.W #$0004 
    TRB.W $09A6 
    PHX 
    PHY 
    JSL.L Update_Beam_Tiles_and_Palette 
    PLY 
    PLX 
    LDA.W #$0168 
    JSL.L Play_Room_Music_Track_After_A_Frames 
    LDA.W $0002,Y 
    AND.W #$00FF 
    JSL.L MessageBox_Routine 
    INY #3
    RTS 


Instruction_PLM_PickUpEquipment_DisplayMessageBox:
    LDA.W $09A2 : ORA.W $0000,Y : STA.W $09A2 
    LDA.W $09A4 : ORA.W $0000,Y : STA.W $09A4 
    LDA.W #$0168 
    JSL.L Play_Room_Music_Track_After_A_Frames 
    LDA.W $0002,Y 
    AND.W #$00FF 
    JSL.L MessageBox_Routine 
    INY #3
    RTS 


Inst_PLM_PickUpEquipment_AddGrappleHUD_DisplayMessageBox:
    LDA.W $09A2 : ORA.W $0000,Y : STA.W $09A2 
    LDA.W $09A4 : ORA.W $0000,Y : STA.W $09A4 
    JSL.L AddGrappleToHUDTilemap 
    LDA.W #$0168 
    JSL.L Play_Room_Music_Track_After_A_Frames 
    LDA.W #$0005 
    JSL.L MessageBox_Routine 
    INY #2
    RTS 


Inst_PLM_PickUpEquipment_AddXrayToHUD_DisplayMessageBox:
    LDA.W $09A2 : ORA.W $0000,Y : STA.W $09A2 
    LDA.W $09A4 : ORA.W $0000,Y : STA.W $09A4 
    JSL.L AddXrayToHUDTilemap 
    LDA.W #$0168 
    JSL.L Play_Room_Music_Track_After_A_Frames 
    LDA.W #$0006 
    JSL.L MessageBox_Routine 
    INY #2
    RTS 


Instruction_PLM_CollectHealth_EnergyTank:
    LDA.W $09C4 : CLC : ADC.W $0000,Y : STA.W $09C4 
    STA.W $09C2 
    LDA.W #$0168 
    JSL.L Play_Room_Music_Track_After_A_Frames 
    LDA.W #$0001 
    JSL.L MessageBox_Routine 
    INY #2
    RTS 


Instruction_PLM_CollectHealth_ReserveTank:
    LDA.W $09D4 : CLC : ADC.W $0000,Y : STA.W $09D4 
    LDA.W $09C0 
    BNE .playMusic 
    INC.W $09C0 

.playMusic:
    LDA.W #$0168 
    JSL.L Play_Room_Music_Track_After_A_Frames 
    LDA.W #$0019 
    JSL.L MessageBox_Routine 
    INY #2
    RTS 


Instruction_PLM_CollectAmmo_MissileTank:
    LDA.W $09C8 : CLC : ADC.W $0000,Y : STA.W $09C8 
    LDA.W $09C6 : CLC : ADC.W $0000,Y : STA.W $09C6 
    JSL.L AddMissilesToHUDTilemap 
    LDA.W #$0168 
    JSL.L Play_Room_Music_Track_After_A_Frames 
    LDA.W #$0002 
    JSL.L MessageBox_Routine 
    INY #2
    RTS 


Instruction_PLM_CollectAmmo_SuperMissileTank:
    LDA.W $09CC : CLC : ADC.W $0000,Y : STA.W $09CC 
    LDA.W $09CA : CLC : ADC.W $0000,Y : STA.W $09CA 
    JSL.L AddSuperMissilesToHUDTilemap 
    LDA.W #$0168 
    JSL.L Play_Room_Music_Track_After_A_Frames 
    LDA.W #$0003 
    JSL.L MessageBox_Routine 
    INY #2
    RTS 


Instruction_PLM_CollectAmmo_PowerBombTank:
    LDA.W $09D0 : CLC : ADC.W $0000,Y : STA.W $09D0 
    LDA.W $09CE : CLC : ADC.W $0000,Y : STA.W $09CE 
    JSL.L AddPowerBombsToHUDTilemap 
    LDA.W #$0168 
    JSL.L Play_Room_Music_Track_After_A_Frames 
    LDA.W #$0004 
    JSL.L MessageBox_Routine 
    INY #2
    RTS 


Instruction_PLM_LinkInstruction_Y:
    LDA.W $0000,Y : STA.L $7EDEBC,X 
    INY #2
    RTS 


Instruction_PLM_Call_Y:
    TYA 
    INC #2
    STA.L $7EDEBC,X 
    LDA.W $0000,Y 
    TAY 
    RTS 


Instruction_PLM_Return:
    LDA.L $7EDEBC,X 
    TAY 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_PLM_WaitUntil_Enemy0_IsDead_848A40:
    LDA.W $0F86 
    AND.W #$0200 
    BNE .return 
    LDA.W $0F78 
    CMP.W #EnemyHeaders_Respawn 
    BEQ .return 
    PLA 
    LDA.W #$0001 : STA.L $7EDE1C,X 

.return:
    RTS 


UNUSED_Instruction_PLM_WaitUntil_Enemy0_IsDead_848A59:
    LDA.W $0FC6 
    AND.W #$0200 
    BNE .return 
    LDA.W $0FB8 
    CMP.W #EnemyHeaders_Respawn 
    BEQ .return 
    PLA 
    LDA.W #$0001 : STA.L $7EDE1C,X 

.return:
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_PLM_GotoY_ifRoomArg_DoorIsSet:
    PHX 
    LDA.W $1DC7,X 
    BMI .pullX 
    JSL.L BitIndexToByteIndexAndBitmask 
    LDA.L $7ED8B0,X 
    PLX 
    AND.W $05E7 
    BEQ .return 
    LDA.W $0000,Y 
    TAY 
    RTS 


.return:
    INY #2
    RTS 


.pullX:
    PLX 
    BRA .return 


Instruction_PLM_IncDoorHit_SetRoomArgDoor_GotoY:
    LDA.L $7EDF0C,X 
    INC A 
    STA.L $7EDF0C,X 
    SEP #$20 
    CMP.W $0000,Y 
    REP #$20 
    BCS .carrySet 
    INY #3
    .return:
    RTS 

.carrySet:
    PHX 
    LDA.W $1DC7,X 
    BMI .setMSB 
    JSL.L BitIndexToByteIndexAndBitmask 
    LDA.L $7ED8B0,X : ORA.W $05E7 : STA.L $7ED8B0,X 

.setMSB:
    PLX 
    ORA.W #$8000 
    STA.W $1DC7,X 
    LDA.W #.return : STA.W $1CD7,X 
    INY 
    JMP.W Instruction_PLM_GotoY 


Instruction_PLM_IncRoomArg_RoomArgFFFF_GotoY:
    SEP #$20 
    LDA.W $1DC7,X 
    INC A 
    CMP.W $0000,Y 
    REP #$20 
    BCS .FFFF 
    STA.W $1DC7,X 
    INY #3
    .return
    RTS 


.FFFF:
    LDA.W #$FFFF : STA.W $1DC7,X 
    LDA.W #.return : STA.W $1CD7,X 
    INY 
    JMP.W Instruction_PLM_GotoY 


Instruction_PLM_PLMBTS_Y:
    PHX 
    LDA.W $1C87,X 
    LSR A 
    TAX 
    SEP #$20 
    LDA.W $0000,Y : STA.L $7F6402,X 
    REP #$20 
    PLX 
    INY 
    RTS 


Instruction_PLM_DrawPLMBlock_Clone:
    REP #$20 
    PHX 
    PHY 
    TXY 
    LDX.W $1C87,Y 
    LDA.W $1E17,Y : STA.L $7F0002,X 
    JMP.W Instruction_PLM_DrawPLMBlock_draw 


Instruction_PLM_DrawPLMBlock:
    REP #$20 
    PHX 
    PHY 
    TXY 
    LDX.W $1C87,Y 
    LDA.W $1E17,Y : STA.L $7F0002,X 

Instruction_PLM_DrawPLMBlock_draw:
    STA.W $1E69 
    LDA.W #$0001 : STA.W $1E67 
    STZ.W $1E6B 
    PLY 
    PLX 
    LDA.W #$0001 : STA.L $7EDE1C,X 
    LDA.W #$1E67 : STA.L $7EDE6C,X 
    TYA 
    STA.W $1D27,X 
    JSR.W Process_PLM_Draw_Instruction 
    LDX.W $1C27 
    JSL.L Calculate_PLM_Block_Coordinates 
    JSR.W DrawPLM_HardCoded 
    PLA 
    RTS 


Instruction_PLM_ProcessAirScrollUpdate:
    PHB 
    PHX 
    PHY 
    STZ.W $1E17,X 
    LDY.W $1DC7,X 
    PEA.W $8F00 
    PLB 
    PLB 
    LDA.W #$0000 
    SEP #$20 

.loop:
    LDA.W $0000,Y 
    BMI .specialAir 
    TAX 
    LDA.W $0001,Y : STA.L $7ECD20,X 
    INY #2
    BRA .loop 


.specialAir:
    REP #$20 
    PLY 
    PLX 
    PLB 
    PHX 
    LDA.W $1C87,X 
    TAX 
    LDA.L $7F0002,X 
    AND.W #$0FFF 
    ORA.W #$3000 
    STA.L $7F0002,X 
    PLX 
    RTS 


Instruction_PLM_ProcessSolidScrollUpdate:
    PHB 
    PHX 
    PHY 
    STZ.W $1E17,X 
    LDY.W $1DC7,X 
    PEA.W $8F00 
    PLB 
    PLB 
    LDA.W #$0000 
    SEP #$20 

.loop:
    LDA.W $0000,Y 
    BMI .specialBlock 
    TAX 
    LDA.W $0001,Y : STA.L $7ECD20,X 
    INY #2
    BRA .loop 


.specialBlock:
    REP #$20 
    PLY 
    PLX 
    PLB 
    PHX 
    LDA.W $1C87,X 
    TAX 
    LDA.L $7F0002,X 
    AND.W #$0FFF 
    ORA.W #$B000 
    STA.L $7F0002,X 
    PLX 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_PLM_QueueMusicTrack_Y_848BD1:
    LDA.W $0000,Y 
    AND.W #$00FF 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    INY 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_PLM_ClearMusicQueue_QueueMusicTrack:
    PHX 
    LDX.W #$000E 

.loop:
    STZ.W $0619,X 
    STZ.W $0629,X 
    DEX #2
    BPL .loop 
    PLX 
    LDA.W $0639 : STA.W $063B 
    LDA.W #$0000 : STA.W $063F 
    STA.W $063D 
    LDA.W $0000,Y 
    AND.W #$00FF 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    INY 
    RTS 


Instruction_PLM_QueueSound_Y_Lib1_Max6:
    LDA.W $0000,Y 
    JSL.L QueueSound_Lib1_Max6 
    INY 
    RTS 


Instruction_PLM_QueueSound_Y_Lib2_Max6:
    LDA.W $0000,Y 
    JSL.L QueueSound_Lib2_Max6 
    INY 
    RTS 


Instruction_PLM_QueueSound_Y_Lib3_Max6:
    LDA.W $0000,Y 
    JSL.L QueueSound_Lib3_Max6 
    INY 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_PLM_QueueSound_Y_Lib1_Max15_848C22:
    LDA.W $0000,Y 
    JSL.L QueueSound 
    INY 
    RTS 


UNUSED_Instruction_PLM_QueueSound_Y_Lib2_Max15_848C2B:
    LDA.W $0000,Y 
    JSL.L QueueSound_Lib2_Max15 
    INY 
    RTS 


UNUSED_Instruction_PLM_QueueSound_Y_Lib3_Max15_848C34:
    LDA.W $0000,Y 
    JSL.L QueueSound_Lib3_Max15 
    INY 
    RTS 


UNUSED_Instruction_PLM_QueueSound_Y_Lib1_Max3_848C3D:
    LDA.W $0000,Y 
    JSL.L QueueSound_Lib1_Max3 
    INY 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_PLM_QueueSound_Y_Lib2_Max3:
    LDA.W $0000,Y 
    JSL.L QueueSound_Lib2_Max3 
    INY 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_PLM_QueueSound_Y_Lib3_Max3_848C4F:
    LDA.W $0000,Y 
    JSL.L QueueSound_Lib3_Max3 
    INY 
    RTS 


UNUSED_Instruction_PLM_QueueSound_Y_Lib1_Max9_848C58:
    LDA.W $0000,Y 
    JSL.L QueueSound_Lib1_Max9 
    INY 
    RTS 


UNUSED_Instruction_PLM_QueueSound_Y_Lib2_Max9_848C61:
    LDA.W $0000,Y 
    JSL.L QueueSound_Lib2_Max9 
    INY 
    RTS 


UNUSED_Instruction_PLM_QueueSound_Y_Lib3_Max9_848C6A:
    LDA.W $0000,Y 
    JSL.L QueueSound_Lib3_Max9 
    INY 
    RTS 


UNUSED_Instruction_PLM_QueueSound_Y_Lib1_Max1_848C73:
    LDA.W $0000,Y 
    JSL.L QueueSound_Lib1_Max1 
    INY 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_PLM_QueueSound_Y_Lib2_Max1:
    LDA.W $0000,Y 
    JSL.L QueueSound_Lib2_Max1 
    INY 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_PLM_QueueSound_Y_Lib3_Max1_848C85:
    LDA.W $0000,Y 
    JSL.L QueueSound_Lib3_Max1 
    INY 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


RTS_848C8E:
    RTS 


Instruction_PLM_Activate_MapStation:
    PHX 
    PHY 
    LDX.W $079F 
    LDA.L $7ED908,X : ORA.W #$00FF : STA.L $7ED908,X 
    LDA.W #$0014 
    JSL.L MessageBox_Routine 
    LDA.W #$0001 : STA.W $0789 
    PLY 
    PLX 
    RTS 


Instruction_PLM_Activate_EnergyStation:
    PHX 
    PHY 
    LDA.W $09C4 
    CMP.W $09C2 
    BEQ .unlockSamus 
    LDA.W #$0015 
    JSL.L MessageBox_Routine 
    LDA.W $09C4 : STA.W $09C2 

.unlockSamus:
    LDA.W #$0001 
    JSL.L Run_Samus_Command 
    PLY 
    PLX 
    RTS 


Instruction_PLM_Activate_MissileStation:
    PHX 
    PHY 
    LDA.W $09C8 
    CMP.W $09C6 
    BEQ .unlockSamus 
    LDA.W #$0016 
    JSL.L MessageBox_Routine 
    LDA.W $09C8 : STA.W $09C6 

.unlockSamus:
    LDA.W #$0001 
    JSL.L Run_Samus_Command 
    PLY 
    PLX 
    RTS 


Instruction_PLM_GotoY_or_ActivateSaveStation:
    PHX 
    PHY 
    LDA.W #$0017 
    JSL.L MessageBox_Routine 
    CMP.W #$0002 
    BEQ .gotoY 
    LDX.W $1C27 
    LDY.W #EnemyProjectile_SaveStationElectricity 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W $1DC7,X : AND.W #$0007 : STA.W $078B 
    JSL.L BitIndexToByteIndexAndBitmask 
    LDA.W $079F 
    ASL A 
    TAX 
    LDA.L $7ED8F8,X : ORA.W $05E7 : STA.L $7ED8F8,X 
    LDA.W $0952 
    JSL.L SaveToSRAM 
    PLY 
    PLX 
    INY #2
    RTS 


.gotoY:
    PLY 
    PLX 
    LDA.W $0000,Y 
    TAY 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_PLM_ResumeMusicIn6Seconds_848D39:
    LDA.W #$0168 
    JSL.L Play_Room_Music_Track_After_A_Frames 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_PLM_GotoY_ifSamusIsWithin_YColumnsRowsOfPLM:
    JSL.L Calculate_PLM_Block_Coordinates 
    LDA.W $0AF6 
    LSR #4
    SEC : SBC.W $1C29 : BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEP #$20 
    CMP.W $0000,Y 
    REP #$20 
    BEQ + 
    BCS .tooFar 

  + LDA.W $0AFA 
    LSR #4
    SEC : SBC.W $1C2B : BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEP #$20 
    CMP.W $0001,Y 
    REP #$20 
    BEQ .gotoY 
    BCS .tooFar 

.gotoY:
    LDA.W $0002,Y 
    TAY 
    RTS 


.tooFar:
    TYA 
    CLC : ADC.W #$0004 : TAY 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_PLM_MovePLMDown1Block_848D89:
    LDA.W $1C87,X : CLC : ADC.W $07A5 : ADC.W $07A5 : STA.W $1C87,X 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


RTS_848D97:
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_PLM_DefaultPLM_848D98:
    dw $1000,InstList_PLM_DefaultPLMDrawInstruction 
    dw Instruction_PLM_GotoY 
    dw UNUSED_InstList_PLM_DefaultPLM_848D98 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_PLM_DefaultPLMDrawInstruction:
; Note that this is an invalid draw instruction
; Used by instruction list $8D98: Unused. Default PLM instruction list
    dw $0180,$0000,$0000 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_DrawPLM_Custom_DrawInstPointer_TilemapBaseAddr_848DA6:
    JSR.W DrawPLM 
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


DrawPLM_HardCoded:
    REP #$30 
    LDA.W #$5000 : STA.B $09 
    LDA.W #$53E0 : STA.B $0C 
    LDA.L $7EDE6C,X 
    TAY 

DrawPLM:
    LDA.W $1C29 : STA.B $1E 
    LDA.W $1C2B : STA.B $20 

.loopDrawEntry:
    LDA.W $0915 
    LSR #4
    STA.B $1A 
    CLC : ADC.W #$000F : CMP.B $20 
    BPL + 
    RTS 


  + LDA.W $0000,Y 
    BPL .horizontal 
    JMP.W .vertical 


.horizontal:
    AND.W #$7FFF 
    STA.B $14 
    STZ.B $1C 
    LDA.B $20 
    CMP.B $1A 
    BMI .return8E2F 
    STA.B $1A 
    STZ.B $12 
    LDA.B $1E : STA.B $18 
    LDA.W $0911 : CLC : ADC.W #$000F : LSR #4
    DEC A 
    STA.B $16 
    SEC : SBC.B $1E : BMI + 
    BEQ + 
    STA.B $12 
    LDA.B $14 : CLC : ADC.B $1E : CMP.B $16 
    BEQ .return8E2F 
    BMI .return8E2F 
    LDA.B $14 
    LDA.B $14 ; >_<
    SEC : SBC.B $12 : STA.B $14 
    LDA.B $16 : STA.B $18 

  + LDA.B $16 : CLC : ADC.W #$0011 : STA.B $16 
    CMP.B $1E 
    BPL + 

.return8E2F:
    RTS 


  + LDA.B $18 : CLC : ADC.B $14 : DEC A 
    SEC : SBC.B $16 : STA.B $16 
    BMI + 
    LDA.B $14 : SEC : SBC.B $16 : STA.B $14 
    BEQ .return8E2F 

  + PHX 
    LDX.W $0330 
    CPX.W #$01E0 
    BMI + 

.pullXreturn:
    PLX 

.return8E50:
    RTS 


  + LDA.W #$0200 : SEC : SBC.W $1C25 : LSR #3
    CMP.B $14 
    BMI .pullXreturn 
    LDA.B $1A 
    AND.W #$000F 
    ORA.W #$4000 
    STA.W $4202 
    LDA.B $18 
    AND.W #$001F 
    CMP.W #$0010 
    BCS .greaterThan10h 
    ASL A 
    CLC : ADC.B $09 : ADC.W $4216 : PHA 
    LDA.W $091D 
    AND.W #$0100 
    BEQ + 
    PLA 
    CLC : ADC.W #$0400 : PHA 
    BRA + 


.greaterThan10h:
    ASL A 
    CLC : ADC.B $0C : ADC.W $4216 : PHA 
    LDA.W $091D 
    AND.W #$0100 
    BEQ + 
    PLA 
    SEC : SBC.W #$0400 : PHA 

  + LDA.B $14 
    ASL A 
    STA.B $1E 
    PLA 
    PHA 
    AND.W #$001F 
    STA.B $22 
    CLC : ADC.B $1E : DEC A 
    AND.W #$FFE0 
    BNE + 
    JMP.W .horizOneScreen 


  + CPX.W #$00E4 
    BPL .return8F2C 
    LDA.W #$0020 : SEC : SBC.B $22 : BMI .return8F2C 
    ASL A 
    STA.B $D0,X 
    STA.B $DE,X 
    PLA 
    STA.B $D5,X 
    AND.W #$FFE0 
    EOR.W #$0400 
    STA.B $DC,X 
    LDA.B $DC,X : CLC : ADC.W #$0020 : STA.B $EA,X 
    LDA.B $D5,X : CLC : ADC.W #$0020 : STA.B $E3,X 
    LDA.B $14 
    ASL #2
    STA.B $1E 
    SEC : SBC.B $D0,X : STA.B $D7,X 
    STA.B $E5,X 
    LDA.W #$C6C8 ; $7E
    CLC : ADC.W $1C25 : STA.B $D2,X 
    STA.B $00 
    CLC : ADC.B $D0,X : STA.B $D9,X 
    CLC : ADC.B $D7,X : STA.B $E0,X 
    STA.B $06 
    CLC : ADC.B $DE,X : STA.B $E7,X 
    SEP #$20 
    LDA.B #$7E : STA.B $D4,X 
    STA.B $02 
    STA.B $DB,X 
    STA.B $08 
    STA.B $E2,X 
    STA.B $E9,X 
    REP #$20 
    TXA 
    CLC : ADC.W #$001C : STA.W $0330 
    BRA .horizAddToVRAMWriteTableEnd 


.return8F2C:
    PLA 
    PLX 
    RTS 


.horizOneScreen:
    PLA 
    JSR.W PartiallySetupVRAMWriteTableEntries_SingleScrnPLMDrawTilemap 
    LDA.B $D5,X : CLC : ADC.W #$0020 : STA.B $DC,X 
    TXA 
    CLC : ADC.W #$000E : STA.W $0330 

.horizAddToVRAMWriteTableEnd:
    LDA.B $12 
    ASL A 
    STA.B $12 
    INY #2
    TYA 
    CLC : ADC.B $12 : STA.B $03 
    LDY.W #$0000 

.loopHorizBlock:
    LDA.B ($03) : STA.B $1E 
    AND.W #$03FF 
    ASL #3
    TAX 
    LDA.B $1E 
    AND.W #$0C00 
    BNE .horizCopyBlockWithFlip 
    LDA.L $7EA000,X : STA.B [$00],Y 
    LDA.L $7EA004,X : STA.B [$06],Y 
    INY #2
    LDA.L $7EA002,X : STA.B [$00],Y 
    LDA.L $7EA006,X : STA.B [$06],Y 
    BRA .horizNextBlock 


.horizCopyBlockWithFlip:
    CMP.W #$0400 
    BNE .horizCopyBlockWithVertFlip 
    LDA.L $7EA002,X : EOR.W #$4000 : STA.B [$00],Y 
    LDA.L $7EA006,X : EOR.W #$4000 : STA.B [$06],Y 
    INY #2
    LDA.L $7EA000,X : EOR.W #$4000 : STA.B [$00],Y 
    LDA.L $7EA004,X : EOR.W #$4000 : STA.B [$06],Y 

.horizNextBlock:
    INY #2
    INC.B $03 
    INC.B $03 
    LDA.W $1C25 : CLC : ADC.W #$0008 : STA.W $1C25 
    CMP.W #$0200 
    BPL .return8FC8 
    DEC.B $14 
    BNE .loopHorizBlock 
    JMP.W .nextDrawEntry 


.return8FC8:
    PLX 
    RTS 


.horizCopyBlockWithVertFlip:
    CMP.W #$0800 
    BNE .horizCopyBlockWithBothFlips 
    LDA.L $7EA004,X : EOR.W #$8000 : STA.B [$00],Y 
    LDA.L $7EA000,X : EOR.W #$8000 : STA.B [$06],Y 
    INY #2
    LDA.L $7EA006,X : EOR.W #$8000 : STA.B [$00],Y 
    LDA.L $7EA002,X : EOR.W #$8000 : STA.B [$06],Y 
    BRA .horizNextBlock 


.horizCopyBlockWithBothFlips:
    LDA.L $7EA006,X : EOR.W #$C000 : STA.B [$00],Y 
    LDA.L $7EA002,X : EOR.W #$C000 : STA.B [$06],Y 
    INY #2
    LDA.L $7EA004,X : EOR.W #$C000 : STA.B [$00],Y 
    LDA.L $7EA000,X : EOR.W #$C000 : STA.B [$06],Y 
    BRA .horizNextBlock 


.vertical:
    AND.W #$7FFF 
    STA.B $14 
    LDA.W $0911 
    LSR #4
    CMP.B $1E 
    BEQ + 
    BPL .return903B 

  + CLC : ADC.W #$0011 : CMP.B $1E 
    BEQ .return903B 
    BPL + 

.return903B:
    RTS 


  + LDA.B $1E : STA.B $18 
    STZ.B $12 
    LDA.B $1A : CLC : ADC.W #$0010 : STA.B $16 
    LDA.B $1A : SEC : SBC.B $20 : BMI .drawBlockGreaterThanScreenBlock 
    STA.B $12 
    LDA.B $14 : CLC : ADC.B $20 : CMP.B $1A 
    BMI .return903B 
    LDA.B $14 : SEC : SBC.B $12 : STA.B $14 

.crash:
    BMI .crash 
    BNE + 
    RTS 


.drawBlockGreaterThanScreenBlock:
    LDA.B $20 : STA.B $1A 

  + LDA.B $1A : CLC : ADC.B $14 : SEC : SBC.B $16 : STA.B $16 
    BMI + 
    LDA.B $14 : SEC : SBC.B $16 : STA.B $14 
    BEQ .return903B 
    BMI .return908C 

  + PHX 
    LDX.W $0330 
    CPX.W #$00F0 
    BMI + 

.return908C:
    PLX 
    RTS 


  + LDA.W #$0200 : SEC : SBC.W $1C25 : LSR #3
    CMP.B $14 
    BMI .return908C 
    LDA.W #$8000 : STA.B $1C 
    JSR.W Calculate_PLMDrawTilemap_VRAMDestination 
    LDA.B $D5,X 
    INC A 
    STA.B $DC,X 
    TXA 
    CLC : ADC.W #$000E : STA.W $0330 
    LDA.B $12 
    ASL A 
    STA.B $12 
    INY #2
    TYA 
    CLC : ADC.B $12 : STA.B $03 
    LDY.W #$0000 

.loopVertBlock:
    LDA.B ($03) : STA.B $1E 
    AND.W #$03FF 
    ASL #3
    TAX 
    LDA.B $1E 
    AND.W #$0C00 
    BNE .vertCopyBlockWithFlip 
    LDA.L $7EA000,X : STA.B [$00],Y 
    LDA.L $7EA002,X : STA.B [$06],Y 
    INY #2
    LDA.L $7EA004,X : STA.B [$00],Y 
    LDA.L $7EA006,X : STA.B [$06],Y 
    JMP.W .vertNextBlock 


.vertCopyBlockWithFlip:
    CMP.W #$0400 
    BNE .vertCopyBlockWithVertFlip 
    LDA.L $7EA002,X : EOR.W #$4000 : STA.B [$00],Y 
    LDA.L $7EA000,X : EOR.W #$4000 : STA.B [$06],Y 
    INY #2
    LDA.L $7EA006,X : EOR.W #$4000 : STA.B [$00],Y 
    LDA.L $7EA004,X : EOR.W #$4000 : STA.B [$06],Y 
    BRA .vertNextBlock 


.vertCopyBlockWithVertFlip:
    CMP.W #$0800 
    BNE .vertCopyBlockWithBothFlips 
    LDA.L $7EA004,X : EOR.W #$8000 : STA.B [$00],Y 
    LDA.L $7EA006,X : EOR.W #$8000 : STA.B [$06],Y 
    INY #2
    LDA.L $7EA000,X : EOR.W #$8000 : STA.B [$00],Y 
    LDA.L $7EA002,X : EOR.W #$8000 : STA.B [$06],Y 
    BRA .vertNextBlock 


.vertCopyBlockWithBothFlips:
    LDA.L $7EA006,X : EOR.W #$C000 : STA.B [$00],Y 
    LDA.L $7EA004,X : EOR.W #$C000 : STA.B [$06],Y 
    INY #2
    LDA.L $7EA002,X : EOR.W #$C000 : STA.B [$00],Y 
    LDA.L $7EA000,X : EOR.W #$C000 : STA.B [$06],Y 

.vertNextBlock:
    INY #2
    INC.B $03 
    INC.B $03 
    LDA.W $1C25 : CLC : ADC.W #$0008 : STA.W $1C25 
    CMP.W #$0200 
    BPL .return918C 
    DEC.B $14 
    BEQ .nextDrawEntry 
    JMP.W .loopVertBlock 


.return918C:
    PLX 
    RTS 


.nextDrawEntry:
    PLX 
    LDY.B $03 
    LDA.B $16 
    BMI + 
    ASL A 
    CLC : ADC.B $03 : TAY 

  + LDA.W $0000,Y 
    BNE + 
    RTS 


  + AND.W #$00FF 
    BIT.W #$0080 
    BNE + 
    CLC : ADC.W $1C29 : STA.B $1E 
    BRA .incY 


  + ORA.W #$FF00 
    CLC : ADC.W $1C29 : STA.B $1E 

.incY:
    INY 
    LDA.W $0000,Y 
    AND.W #$00FF 
    BIT.W #$0080 
    BNE .setHighByte 
    CLC : ADC.W $1C2B : STA.B $20 
    INY 
    JMP.W .loopDrawEntry 


.setHighByte:
    ORA.W #$FF00 
    CLC : ADC.W $1C2B : STA.B $20 
    INY 
    JMP.W .loopDrawEntry 


Calculate_PLMDrawTilemap_VRAMDestination:
    LDA.B $1A 
    AND.W #$000F 
    ORA.W #$4000 
    STA.W $4202 
    LDA.B $18 
    AND.W #$001F 
    CMP.W #$0010 
    BCS .greaterThanF 
    ASL A 
    CLC : ADC.B $09 : ADC.W $4216 : PHA 
    LDA.W $091D 
    AND.W #$0100 
    BEQ .fallthrough 
    PLA 
    CLC : ADC.W #$0400 : PHA 
    BRA .fallthrough 


.greaterThanF:
    ASL A 
    CLC : ADC.B $0C : ADC.W $4216 : PHA 
    LDA.W $091D 
    AND.W #$0100 
    BEQ .fallthrough 
    PLA 
    SEC : SBC.W #$0400 : PHA 

.fallthrough:
    PLA 

PartiallySetupVRAMWriteTableEntries_SingleScrnPLMDrawTilemap:
    ORA.B $1C 
    STA.B $D5,X 
    LDA.B $14 
    ASL #2
    STA.B $D0,X 
    STA.B $D7,X 
    LDA.W #$C6C8 ; $7E
    CLC : ADC.W $1C25 : STA.B $D2,X 
    STA.B $00 
    CLC : ADC.B $D0,X : STA.B $D9,X 
    STA.B $06 
    SEP #$20 
    LDA.B #$7E : STA.B $D4,X 
    STA.B $DB,X 
    STA.B $02 
    STA.B $08 
    REP #$20 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
DrawInst_UnusedBlueBrinstarFaceBlock:
    dw $0001,$817E 
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED

DrawInst_CrateriaMainStreetEscape:
    dw $0002,$00FF,$00FF 
    dw $0000

DrawInst_CrittersEscapeBlock_0:
    dw $8003,$8053,$8053,$8053 
    dw $0000

DrawInst_CrittersEscapeBlock_1:
    dw $8003,$8054,$8054,$8054 
    dw $0000

DrawInst_CrittersEscapeBlock_2:
    dw $8003,$8055,$8055,$8055 
    dw $0000

DrawInst_CrittersEscapeBlock_3:
    dw $8003,$80FF,$80FF,$80FF 
    dw $0000

DrawInst_OldTourianEscapeShaftBlocks:
    dw $8003,$00FF,$00FF,$00FF 
    db $01,$00 
    dw $8003,$00FF,$00FF,$00FF 
    dw $0000

DrawInst_CrumbleAccessToTourianElevator_0:
    dw $0004,$00FF,$00FF,$00FF,$00FF 
    dw $0000

DrawInst_CrumbleAccessToTourianElevator_1:
    dw $0004,$0053,$0053,$0053,$0053 
    dw $0000

DrawInst_CrumbleAccessToTourianElevator_2:
    dw $0004,$0054,$0054,$0054,$0054 
    dw $0000

DrawInst_CrumbleAccessToTourianElevator_3:
    dw $0004,$0055,$0055,$0055,$0055 
    dw $0000

DrawInst_ClearAccessToTourianElevator:
    dw $0004,$00FF,$00FF,$00FF,$00FF 
    db $00,$01 
    dw $0004,$00FF,$00FF,$00FF,$00FF 
    db $00,$02 
    dw $0004,$00FF,$00FF,$00FF,$00FF 
    db $00,$03 
    dw $0004,$00FF,$00FF,$00FF,$00FF 
    db $00,$04 
    dw $0004,$00FF,$00FF,$00FF,$00FF 
    db $00,$05 
    dw $0004,$00FF,$00FF,$00FF,$00FF 
    dw $0000

DrawInst_ClearBotwoonWall:
    dw $8009,$00FF,$00FF,$00FF,$00FF,$00FF,$00FF,$00FF 
    dw $00FF,$00FF
    dw $0000 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_DrawInst_849325:
    dw $8009,$8053,$8053,$8053,$8053,$8053,$8053,$8053 
    dw $8053,$8053
    dw $0000 

UNUSED_DrawInst_84933B:
    dw $8009,$8054,$8054,$8054,$8054,$8054,$8054,$8054 
    dw $8054,$8054
    dw $0000 

UNUSED_DrawInst_849351:
    dw $8009,$0055,$0055,$0055,$0055,$0055,$0055,$0055 
    dw $0055,$0055
    dw $0000 
endif ; !FEATURE_KEEP_UNREFERENCED

DrawInst_CrumbleKraidCeiling_CrumbleKraidSpikes_Elevatube:
    dw $0001,$8180
    dw $0000 

DrawInst_CrumbleKraidCeiling_CrumbleKraidSpikes_0:
    dw $0001,$8181
    dw $0000 

DrawInst_CrumbleKraidCeiling_CrumbleKraidSpikes_1:
    dw $0001,$0182
    dw $0000 

UNUSED_DrawInst_SetKraidCeilingBlockToBackground1_849379:
    dw $0001,$013C
    dw $0000 

DrawInst_SetKraidCeilingBlockToBackground2:
    dw $0001,$0131
    dw $0000 

DrawInst_SetKraidCeilingBlockToBackground3:
    dw $0001,$0130
    dw $0000 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_DrawInst_84938B:
    dw $0001,$011C
    dw $0000 
endif ; !FEATURE_KEEP_UNREFERENCED

DrawInst_CrumbleKraidSpikeBlocks_0:
    dw $0001,$0111
    dw $0000 

DrawInst_CrumbleKraidSpikeBlocks_1:
    dw $0001,$0110
    dw $0000 

DrawInst_ClearKraidCeiling:
    dw $000F,$013C,$0131,$0130,$0131,$0130,$0131,$0130 
    dw $0131,$0130,$0131,$0130,$0131,$0130,$0131,$0130 
    dw $0000 

DrawInst_ClearKraidSpikeBlocks:
    dw $0016,$0111,$0110,$0111,$0110,$0111,$0110,$0111 
    dw $0110,$0111,$0110,$0111,$0110,$0111,$0110,$0111 
    dw $0110,$0111,$0110,$0111,$0110,$0111,$0110 
    dw $0000

DrawInst_DrawPhantoonsDoorDuringBossFight:
    dw $8004,$95C1,$95E1,$9DE1,$9DC1 
    db $01,$00 
    dw $8004,$C5C0,$D5E0,$DDE0,$DDC0 
    dw $0000

DrawInst_RestorePhantoonsDoorDuringBossFight:
    dw $8004,$9440,$9460,$9C60,$9C40 
    dw $0000

DrawInst_ClearSporeSpawnCeiling:
    dw $0002,$00FF,$00FF 
    db $00,$01 
    dw $0002,$00FF,$00FF 
    dw $0000

DrawInst_CrumbleSporeSpawnCeiling_0:
    dw $0002,$0053,$0053 
    db $00,$01 
    dw $0002,$0053,$0053 
    dw $0000

DrawInst_CrumbleSporeSpawnCeiling_1:
    dw $0002,$0054,$0054 
    db $00,$01 
    dw $0002,$0054,$0054 
    dw $0000

DrawInst_CrumbleSporeSpawnCeiling_2:
    dw $0002,$0055,$0055 
    db $00,$01 
    dw $0002,$0055,$0055 
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_DrawInst_849453:
    dw $8002,$00FF,$12FB 
    db $00,$FE 
    dw $8002,$1AFB,$00FF 
    dw $0000

UNUSED_DrawInst_849463:
    dw $8002,$80FF,$82FB 
    db $00,$FE 
    dw $8002,$8AFB,$80FF 
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED

DrawInst_EscapeRoom1Gate_0:
    dw $8004,$80FF,$80FF,$80FF,$80FF 
    dw $0000

DrawInst_EscapeRoom1Gate_1:
    dw $8004,$830F,$80FF,$80FF,$830F 
    dw $0000

DrawInst_EscapeRoom1Gate_2:
    dw $8004,$830F,$8AE8,$82E8,$830F 
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_DrawInst_849497:
    dw $0001,$00FF 
    dw $0000

UNUSED_DrawInst_84949D:
    dw $0001,$80FF 
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED

DrawInst_FillMotherBrainsWall:
    dw $8002,$8340,$830F 
    db $00,$FF 
    dw $8001,$8B0F 
    dw $0000

DrawInst_MotherBrainsRoomEscapeDoor:
    dw $8004,$9222,$D1AF,$D1D0,$D220 
    db $01,$00 
    dw $8004,$0223,$01EB,$01D0,$0221 
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_DrawInst_8494C9:
    dw $000D,$8044,$8044,$8044,$8044,$8044,$8044,$8044 
    dw $8044,$8044,$8044,$8044,$8044,$8044 
    dw $0000

UNUSED_DrawInst_8494E7:
    dw $000D,$8044,$8044,$8044,$8044,$8044,$8044,$8044 
    dw $8044,$8044,$8044,$8044,$8044,$8044 
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED

DrawInst_MotherBrainsBackgroundRow2:
    dw $000D,$1241,$1242,$12FC,$12FC,$12FC,$1243,$1244 
    dw $12FC,$1245,$1642,$1241,$1241,$1246 
    dw $0000

DrawInst_MotherBrainsBackgroundRow3:
    dw $000D,$09EF,$01B2,$01E5,$01E5,$01E6,$01E5,$01E5 
    dw $01E5,$01E5,$05B2,$09EF,$09EF,$01B2 
    dw $0000

DrawInst_MotherBrainsBackgroundRow4:
    dw $000D,$01B1,$01D2,$01C6,$01C7,$00FF,$0206,$0207 
    dw $00FF,$01A6,$09CA,$060C,$05B1,$0A09 
    dw $0000

DrawInst_MotherBrainsBackgroundRow5:
    dw $000D,$01D1,$01F2,$01A4,$01E7,$01A4,$0226,$0227 
    dw $01A5,$01A4,$020D,$0E09,$01B1,$01AB 
    dw $0000

DrawInst_MotherBrainsBackgroundRow6:
    dw $000D,$01B1,$0212,$01C4,$01C9,$01C4,$0206,$0207 
    dw $01C5,$01C4,$0628,$01AC,$01EC,$01EC 
    dw $0000

DrawInst_MotherBrainsBackgroundRow7:
    dw $000D,$01B1,$0A0C,$05CA,$0DC7,$01AA,$01A8,$01A8 
    dw $01A8,$01A8,$0628,$01AB,$01CD,$01CD 
    dw $0000

DrawInst_MotherBrainsBackgroundRow8:
    dw $000D,$01D1,$01D0,$05EA,$00FF,$00FF,$0206,$0207 
    dw $00FF,$01A7,$0A0D,$0609,$01EB,$01D0 
    dw $0000

DrawInst_MotherBrainsBackgroundRow9:
    dw $000D,$01EB,$01EB,$05EA,$00FF,$00FF,$0206,$0207 
    dw $00FF,$01A6,$00FF,$0A2C,$0609,$01AE 
    dw $0000

DrawInst_MotherBrainsBackgroundRowA:
    dw $000D,$01EC,$01AF,$05EA,$05C7,$05C6,$0206,$0207 
    dw $01A8,$01A6,$01A8,$01A8,$05D2,$01AE 
    dw $0000

DrawInst_MotherBrainsBackgroundRowB:
    dw $000D,$01AC,$01AF,$01B2,$05E7,$01E5,$0226,$0227 
    dw $01E5,$01A6,$01E6,$01E5,$05B2,$01CD 
    dw $0000

DrawInst_MotherBrainsBackgroundRowC:
    dw $000D,$060C,$01EF,$01B2,$01E5,$01E6,$01E5,$01E5 
    dw $01E6,$01E5,$01E5,$01E5,$05B2,$01EF 
    dw $0000

DrawInst_MotherBrainsBackgroundRowD:
    dw $000D,$1248,$1249,$124A,$124B,$1339,$124C,$124D 
    dw $1339,$124E,$1339,$1339,$124F,$1249 
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_DrawInst_94966D:
    dw $000D,$8319,$8319,$8319,$8319,$8319,$8319,$8319 
    dw $8319,$8319,$8319,$8319,$8319,$8319 
    dw $0000

UNUSED_DrawInst_94968B:
    dw $000D,$8044,$8044,$8044,$8044,$8044,$8044,$8044 
    dw $8044,$8044,$8044,$8044,$8044,$8044 
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED

DrawInst_ClearCeilingBlockInMotherBrainsRoom:
    dw $8002,$12FC,$00FF 
    dw $0000

DrawInst_ClearCeilingTubeInMotherBrainsRoom:
    dw $8005,$12FC,$00FF,$00FF,$00FF,$00FF 
    dw $0000

DrawInst_ClearMotherBrainsBottomMiddleSideTube:
    dw $8004,$00FF,$00FF,$00FF,$1339 
    dw $0000

DrawInst_ClearMotherBrainsBottomMiddleTubes:
    dw $8007,$00FF,$00FF,$00FF,$00FF,$00FF,$00FF,$1339 
    db $01,$00 
    dw $8007,$00FF,$00FF,$00FF,$00FF,$00FF,$00FF,$1339 
    dw $0000 

DrawInst_ClearMotherBrainsBottomLeftTube:
    dw $8005,$00FF,$00FF,$00FF,$00FF,$1339 
    db $01,$00 
    dw $0001,$00FF 
    dw $0000

DrawInst_ClearMotherBrainsBottomRightTube:
    dw $8005,$00FF,$00FF,$00FF,$00FF,$1339 
    db $FF,$00 
    dw $0001,$00FF 
    dw $0000

DrawInst_MotherBrainsGlass_0:
    dw $0001,$C6C0 
    dw $0000

DrawInst_MotherBrainsGlass_1:
    dw $8004,$C2C7,$D2C9,$DAC9,$5AC7 
    db $FF,$01 
    dw $8002,$D2C8,$DAC8 
    dw $0000

DrawInst_MotherBrainsGlass_2:
    dw $8004,$C2C7,$D2CB,$DACB,$5AC7 
    db $FF,$01 
    dw $8002,$D2CA,$DACA 
    dw $0000

DrawInst_MotherBrainsGlass_3:
    dw $8003,$C2C7,$02CC,$0ACC 
    dw $0000

DrawInst_MotherBrainsGlass_4:
    dw $0001,$C2C7 
    db $FD,$00 
    dw $8004,$82CD,$86C9,$8EC9,$8ACD 
    db $FE,$01 
    dw $8002,$86C8,$8EC8 
    dw $0000

DrawInst_MotherBrainsGlass_5:
    dw $0001,$C2C7 
    db $FD,$01 
    dw $8003,$86CB,$8ECB,$8ACD 
    db $FE,$01 
    dw $8002,$86CA,$8ECA 
    dw $0000

DrawInst_MotherBrainsGlass_6:
    dw $0001,$C2C7 
    db $FD,$01 
    dw $8002,$06CC,$0ECC 
    dw $0000

DrawInst_MotherBrainsGlass_7:
    dw $8004,$C2CE,$02CF,$0ACF,$5ACE 
    db $FD,$00 
    dw $8004,$86CE,$06CF,$0ECF,$8ECE 
    db $FE,$01 
    dw $8002,$D6D0,$DED0 
    db $FF,$01 
    dw $8002,$D2D0,$DAD0 
    dw $0000

DrawInst_MotherBrainsGlass_8:
    dw $8004,$C2CE,$00FF,$00FF,$5ACE 
    db $FD,$00 
    dw $8004,$86CE,$00FF,$00FF,$8ECE 
    db $FE,$00 
    dw $8004,$52C2,$D2C3,$DAC3,$D2C4 
    db $FF,$00 
    dw $8004,$56C2,$D6C3,$DEC3,$D6C4 
    dw $0000

DrawInst_MotherBrainsGlass_9:
    dw $8004,$00FF,$00FF,$00FF,$00FF 
    db $FD,$00 
    dw $8004,$00FF,$00FF,$00FF,$00FF 
    db $FE,$00 
    dw $8004,$02D2,$02D3,$0AD3,$02D4 
    db $FF,$00 
    dw $8004,$06D2,$06D3,$0ED3,$06D4 
    dw $0000

UNUSED_DrawInst_849817:
    dw $8004,$00FF,$00FF,$00FF,$00FF,$00FD,$8004,$00FF 
    dw $00FF,$00FF,$00FF,$00FE,$8004,$00FF,$00FF,$00FF 
    dw $00FF,$00FF,$8004,$00FF,$00FF,$00FF,$00FF 
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_DrawInst_849847:
    dw $8004,$00FF,$00FF,$00FF,$00FF,$00FF,$8004,$0172 
    dw $0173,$0173,$0172,$00FE,$8004,$0172,$0173,$0173 
    dw $0172,$00FD,$8004,$00FF,$00FF,$00FF,$00FF 
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED

DrawInst_BombTorizosCrumblingChozo_0:
    dw $0002,$8065,$8066 
    db $FF,$00 
    dw $0001,$8064 
    db $00,$FF 
    dw $0002,$8045,$8046 
    db $FF,$01 
    dw $0003,$8047,$8048,$8049 
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_DrawInst_849897:
    dw $0001,$0001,$0000 
endif ; !FEATURE_KEEP_UNREFERENCED

DrawInst_BombTorizosCrumblingChozo_1:
    dw $0002,$00FF,$00FF,$00FE,$0002,$00FF,$00FF,$01FE 
    dw $0004,$00FF,$00FF,$00FF,$00FF,$FEFE,$0004,$00FF 
    dw $00FF,$00FF,$00FF,$FFFE,$0004,$00FF,$00FF,$00FF 
    dw $00FF 
    dw $0000

DrawInst_NoobTube_0:
    dw $0001,$C540 
    dw $0000

DrawInst_NoobTube_1:
    dw $0001,$8540 
    dw $0000

DrawInst_NoobTube_2:
    dw $0001,$8141 
    dw $0000

DrawInst_NoobTube_3:
    dw $000C,$8141,$00FF,$00FF,$00FF,$00FF,$00FF,$00FF 
    dw $00FF,$00FF,$00FF,$00FF,$8541 
    db $00,$01 
    dw $000C,$0322,$00FF,$00FF,$00FF,$00FF,$00FF,$00FF 
    dw $00FF,$00FF,$00FF,$00FF,$0722 
    db $00,$02 
    dw $000C,$0323,$00FF,$00FF,$00FF,$00FF,$00FF,$00FF 
    dw $00FF,$00FF,$00FF,$00FF,$0723 
    db $00,$03 
    dw $000C,$0B23,$00FF,$00FF,$00FF,$00FF,$00FF,$00FF 
    dw $00FF,$00FF,$00FF,$00FF,$0F23 
    dw $0000

DrawInst_NoobTube_4:
    dw $0001,$0141 
    db $00,$04 
    dw $000C,$0B22,$00FF,$00FF,$00FF,$00FF,$00FF,$00FF 
    dw $00FF,$00FF,$00FF,$00FF,$0F22 
    db $00,$05 
    dw $000C,$814E,$814F,$00FF,$00FF,$00FF,$00FF,$00FF 
    dw $00FF,$00FF,$00FF,$854F,$854E 
    dw $0000

DrawInst_NoobTube_5:
    dw $000C,$8141,$00FF,$00FF,$00FF,$00FF,$00FF,$00FF 
    dw $00FF,$00FF,$00FF,$00FF,$8541 
    db $00,$01 
    dw $000C,$0322,$00FF,$00FF,$00FF,$00FF,$00FF,$00FF 
    dw $00FF,$00FF,$00FF,$00FF,$0722 
    db $00,$02 
    dw $000C,$0323,$00FF,$00FF,$00FF,$00FF,$00FF,$00FF 
    dw $00FF,$00FF,$00FF,$00FF,$0723 
    dw $0000

DrawInst_NoobTube_6:
    dw $0001,$0141 
    db $00,$03 
    dw $000C,$0B23,$00FF,$00FF,$00FF,$00FF,$00FF,$00FF 
    dw $00FF,$00FF,$00FF,$00FF,$0F23 
    db $00,$04 
    dw $000C,$0B22,$00FF,$00FF,$00FF,$00FF,$00FF,$00FF 
    dw $00FF,$00FF,$00FF,$00FF,$0F22 
    db $00,$05 
    dw $000C,$814E,$814F,$00FF,$00FF,$00FF,$00FF,$00FF 
    dw $00FF,$00FF,$00FF,$854F,$854E 
    dw $0000

DrawInst_SaveStation_0:
    dw $0002,$B859,$8C59 
    db $00,$FF 
    dw $0002,$005B,$045B 
    db $00,$FE 
    dw $0002,$005B,$045B 
    db $00,$FD 
    dw $0002,$005B,$045B 
    db $00,$FC 
    dw $0002,$005B,$045B 
    db $00,$FB 
    dw $0002,$8059,$8459 
    dw $0000

DrawInst_SaveStation_1:
    dw $0002,$8859,$8C59 
    db $00,$FF 
    dw $0002,$005B,$045B 
    db $00,$FE 
    dw $0002,$005B,$045B 
    db $00,$FD 
    dw $0002,$005B,$045B 
    db $00,$FC 
    dw $0002,$005B,$045B 
    db $00,$FB 
    dw $0002,$8059,$8459 
    dw $0000

DrawInst_SaveStation_2:
    dw $0002,$885A,$8C5A 
    db $00,$FF 
    dw $0002,$005C,$045C 
    db $00,$FE 
    dw $0002,$005C,$045C 
    db $00,$FD 
    dw $0002,$005C,$045C 
    db $00,$FC 
    dw $0002,$005C,$045C 
    db $00,$FB 
    dw $0002,$805A,$845A 
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_DrawInst_Draw13BlankAirTiles_849ACF:
    dw $000D,$00FF,$00FF,$00FF,$00FF,$00FF,$00FF,$00FF 
    dw $00FF,$00FF,$00FF,$00FF,$00FF,$00FF 
    dw $0000

UNUSED_DrawInst_Draw13BlankSolidTiles_849AED:
    dw $000D,$80FF,$80FF,$80FF,$80FF,$80FF,$80FF,$80FF 
    dw $80FF,$80FF,$80FF,$80FF,$80FF,$80FF 
    dw $0000

UNUSED_DrawInst_LowerNorfair2x2ChozoShotBlock_849B0B:
    dw $0002,$C64A,$524A 
    db $00,$01 
    dw $0002,$D66A,$D26A 
    dw $0000

UNUSED_DrawInst_LowerNorfair2x2ChozoShotBlock_849B1B:
    dw $0002,$8053,$8053 
    db $00,$01 
    dw $0002,$8053,$8053 
    dw $0000

UNUSED_DrawInst_LowerNorfair2x2ChozoShotBlock_849B2B:
    dw $0002,$8054,$8054 
    db $00,$01 
    dw $0002,$8054,$8054 
    dw $0000

UNUSED_DrawInst_LowerNorfair2x2ChozoShotBlock_849B3B:
    dw $0002,$0055,$0055 
    db $00,$01 
    dw $0002,$0055,$0055 
    dw $0000

UNUSED_DrawInst_LowerNorfair2x2ChozoShotBlock_849B4B:
    dw $0002,$00FF,$00FF 
    db $00,$01 
    dw $0002,$00FF,$00FF 
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED

DrawInst_ClearCrocomiresBridge:
    dw $000A,$0080,$0080,$0080,$0080,$0080,$0080,$0080 
    dw $0080,$0080,$0080 
    dw $0000

DrawInst_CrumbleABlockOfCrocomiresBridge:
    dw $0001,$810B 
    dw $0000

DrawInst_ClearABlockOfCrocomiresBridge:
    dw $0001,$0080 
    dw $0000

DrawInst_ClearCrocomireInvisibleWall_0:
    dw $8008,$0080,$0107,$0127,$0107,$0127,$0147,$0080 
    dw $0080 
    db $01,$00 
    dw $8008,$0080,$0108,$0128,$0108,$0128,$0148,$0080 
    dw $0080 
    db $02,$00 
    dw $8008,$0080,$0109,$0129,$0109,$0129,$0149,$0080 
    dw $0080 
    dw $0000

DrawInst_ClearCrocomireInvisibleWall_1:
    dw $8008,$8080,$8107,$8127,$8107,$8127,$8147,$8080 
    dw $8080 
    db $01,$00 
    dw $8008,$8080,$8108,$8128,$8108,$8128,$8148,$8080 
    dw $8080 
    db $02,$00 
    dw $8008,$8080,$8109,$8129,$8109,$8129,$8149,$8080 
    dw $8080 
    dw $0000

DrawInst_EyeDoorEyeFacingLeft_0:
    dw $8004,$84AA,$84CC,$8CCC,$8CAA 
    dw $0000

DrawInst_EyeDoorEyeFacingLeft_1:
    dw $8002,$84CC,$8CCC 
    dw $0000

DrawInst_EyeDoorEyeFacingLeft_2:
    dw $8002,$84CB,$8CCB 
    dw $0000

DrawInst_EyeDoorEyeFacingLeft_3:
    dw $8002,$C4CA,$DCCA 
    dw $0000

DrawInst_EyeDoorEyeFacingLeft_4:
    dw $8002,$84CD,$8CCD 
    dw $0000

DrawInst_EyeDoorEyeFacingLeft_5:
    dw $8002,$84CA,$8CCA 
    dw $0000

DrawInst_EyeDoorFacingLeft_0:
    dw $0001,$A4AA 
    dw $0000

DrawInst_EyeDoorFacingLeft_1:
    dw $0001,$A4AB 
    dw $0000

DrawInst_EyeDoorFacingLeft_2:
    dw $0001,$A4AC 
    dw $0000

DrawInst_EyeDoorBottomFacingLeft_0:
    dw $0001,$ACAA 
    dw $0000

DrawInst_EyeDoorBottomFacingLeft_1:
    dw $0001,$ACAB 
    dw $0000

DrawInst_EyeDoorBottomFacingLeft_2:
    dw $0001,$ACAC 
    dw $0000

DrawInst_EyeDoorEyeFacingRight_0:
    dw $8004,$80AA,$80CC,$88CC,$88AA 
    dw $0000

DrawInst_EyeDoorEyeFacingRight_1:
    dw $8002,$80CC,$88CC 
    dw $0000

DrawInst_EyeDoorEyeFacingRight_2:
    dw $8002,$80CB,$88CB 
    dw $0000

DrawInst_EyeDoorEyeFacingRight_3:
    dw $8002,$C0CA,$D8CA 
    dw $0000

DrawInst_EyeDoorEyeFacingRight_4:
    dw $8002,$80CD,$88CD 
    dw $0000

DrawInst_EyeDoorEyeFacingRight_5:
    dw $8002,$80CA,$88CA 
    dw $0000

DrawInst_EyeDoorFacingRight_0:
    dw $0001,$A0AA 
    dw $0000

DrawInst_EyeDoorFacingRight_1:
    dw $0001,$A0AB 
    dw $0000

DrawInst_EyeDoorFacingRight_2:
    dw $0001,$A0AC 
    dw $0000

DrawInst_EyeDoorBottomFacingRight_0:
    dw $0001,$A8AA 
    dw $0000

DrawInst_EyeDoorBottomFacingRight_1:
    dw $0001,$A8AB 
    dw $0000

DrawInst_EyeDoorBottomFacingRight_2:
    dw $0001,$A8AC 
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_DrawInst_AlternateLowerNorfairChozoHand_849CA7:
    dw $0001,$C0FF 
    dw $0000

UNUSED_DrawInst_849CAD:
    dw $0001,$8053 
    dw $0000

UNUSED_DrawInst_849CB3:
    dw $0001,$8054 
    dw $0000

UNUSED_DrawInst_849CB9:
    dw $0001,$0055 
    dw $0000

UNUSED_DrawInst_AlternateLowerNorfairChozoHand_849CBF:
    dw $0001,$00FF 
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED

DrawInst_ClearSlopeAccessForWreckedShipChozo:
    dw $000E,$012B,$012B,$012B,$012B,$012B,$012B,$012B 
    dw $012B,$012B,$012B,$012B,$012B,$012B,$112B 
    db $00,$05 
    dw $0009,$0111,$0111,$0111,$0111,$0111,$019B,$0129 
    dw $0129,$1129 
    db $05,$06 
    dw $0002,$01BB,$0129 
    db $05,$07 
    dw $0001,$01BB 
    db $05,$08 
    dw $0001,$11BB 
    dw $0000

DrawInst_BlockSlopeAccessForWreckedShipChozo:
    dw $000E,$A12B,$A12B,$A12B,$A12B,$A12B,$A12B,$A12B 
    dw $A12B,$A12B,$A12B,$A12B,$A12B,$A12B,$812B 
    db $00,$05 
    dw $0009,$8111,$8111,$8111,$8111,$8111,$819B,$8129 
    dw $8129,$8129 
    db $05,$06 
    dw $0002,$81BB,$8129 
    db $05,$07 
    dw $0001,$81BB 
    db $05,$08 
    dw $0001,$81BB 
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_DrawInst_WreckedShip3x4ChozoBombBlock_0_849D59:
    dw $8004,$C171,$D171,$D171,$D171 
    db $FF,$00 
    dw $8004,$8102,$8102,$8102,$8102 
    db $FE,$00 
    dw $8004,$8560,$8560,$8560,$8560 
    dw $0000

UNUSED_DrawInst_WreckedShip3x4ChozoBombBlock_1_849D7D:
    dw $8004,$8053,$8053,$8053,$8053 
    db $FF,$00 
    dw $8004,$8053,$8053,$8053,$8053 
    db $FE,$00 
    dw $8004,$8053,$8053,$8053,$8053 
    dw $0000

UNUSED_DrawInst_WreckedShip3x4ChozoBombBlock_2_849DA1:
    dw $8004,$0054,$0054,$0054,$0054 
    db $FF,$00 
    dw $8004,$0054,$0054,$0054,$0054 
    db $FE,$00 
    dw $8004,$0054,$0054,$0054,$0054 
    dw $0000

UNUSED_DrawInst_WreckedShip3x4ChozoBombBlock_3_849DC5:
    dw $8004,$8055,$8055,$8055,$8055 
    db $FF,$00 
    dw $8004,$8055,$8055,$8055,$8055 
    db $FE,$00 
    dw $8004,$8055,$8055,$8055,$8055 
    dw $0000

UNUSED_DrawInst_WreckedShip3x4ChozoBombBlock_4_849DE9:
    dw $8004,$00FF,$00FF,$00FF,$00FF 
    db $FF,$00 
    dw $8004,$D0FF,$D0FF,$D0FF,$30FF 
    db $FE,$00 
    dw $8004,$D0FF,$D0FF,$D0FF,$30FF 
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED

DrawInst_BrinstarFloorPlant_0:
    dw $0002,$35A1,$85A0 
    db $FE,$00 
    dw $0002,$81A0,$51A1 
    db $FE,$FF 
    dw $0004,$2180,$2181,$2581,$2580 
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_DrawInst_849E29:
    dw $0002,$05A1,$85A0 
    db $FE,$00 
    dw $0002,$81A0,$01A1 
    db $FE,$FF 
    dw $0004,$2180,$2181,$2581,$2580 
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED

DrawInst_BrinstarFloorPlant_1:
    dw $0002,$05A3,$85A2 
    db $FE,$00 
    dw $0002,$81A2,$01A3 
    db $FE,$FF 
    dw $0004,$2182,$2183,$2583,$2582 
    dw $0000

DrawInst_BrinstarFloorPlant_2:
    dw $0002,$05A5,$85A4 
    db $FE,$00 
    dw $0002,$81A4,$01A5 
    db $FE,$FF 
    dw $0004,$2184,$2185,$2585,$2584 
    dw $0000

DrawInst_BrinstarFloorPlant_3:
    dw $0002,$05A7,$85A6 
    db $FE,$00 
    dw $0002,$81A6,$01A7 
    db $FE,$FF 
    dw $0004,$2186,$2187,$2587,$2586 
    dw $0000

DrawInst_BrinstarCeilingPlant_0:
    dw $0002,$3DA1,$8DA0 
    db $FE,$00 
    dw $0002,$89A0,$59A1 
    db $FE,$01 
    dw $0004,$2980,$2981,$2D81,$2D80 
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_DrawInst_849EB5:
    dw $0002,$0DA1,$8DA0 
    db $FE,$00 
    dw $0002,$89A0,$09A1 
    db $FE,$01 
    dw $0004,$2980,$2981,$2D81,$2D80 
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED

DrawInst_BrinstarCeilingPlant_1:
    dw $0002,$0DA3,$8DA2 
    db $FE,$00 
    dw $0002,$89A2,$09A3 
    db $FE,$01 
    dw $0004,$2982,$2983,$2D83,$2D82 
    dw $0000

DrawInst_BrinstarCeilingPlant_2:
    dw $0002,$0DA5,$8DA4 
    db $FE,$00 
    dw $0002,$89A4,$09A5 
    db $FE,$01 
    dw $0004,$2984,$2985,$2D85,$2D84 
    dw $0000

DrawInst_BrinstarCeilingPlant_3:
    dw $0002,$0DA7,$8DA6 
    db $FE,$00 
    dw $0002,$89A6,$09A7 
    db $FE,$01 
    dw $0004,$2986,$2987,$2D87,$2D86 
    dw $0000

DrawInst_MapStation_0:
    dw $0001,$810C 
    db $FF,$00 
    dw $0001,$810B 
    dw $0000

DrawInst_MapStation_1:
    dw $0001,$812C 
    db $FF,$00 
    dw $0001,$812B 
    dw $0000

DrawInst_MapStation_2:
    dw $0001,$814C 
    db $FF,$00 
    dw $0001,$814B 
    dw $0000

DrawInst_MapStationRightAccess_0:
    dw $0001,$8128 
    db $FD,$00 
    dw $0001,$8528 
    dw $0000

DrawInst_MapStationRightAccess_1:
    dw $0001,$8129 
    dw $0000

DrawInst_MapStationLeftAccess_0:
    dw $0001,$8528 
    db $03,$00 
    dw $0001,$8128 
    dw $0000

DrawInst_MapStationLeftAccess_1:
    dw $0001,$8529 
    dw $0000

DrawInst_EnergyStation_0:
    dw $0001,$80C4 
    db $00,$FF 
    dw $0001,$10A4 
    dw $0000

DrawInst_EnergyStation_1:
    dw $0001,$80C5 
    db $00,$FF 
    dw $0001,$10A5 
    dw $0000

DrawInst_EnergyStation_2:
    dw $0001,$80C6 
    db $00,$FF 
    dw $0001,$10A6 
    dw $0000

DrawInst_MissileStation_0:
    dw $0001,$80C7 
    db $00,$FF 
    dw $0001,$10A7 
    dw $0000

DrawInst_MissileStation_1:
    dw $0001,$80C8 
    db $00,$FF 
    dw $0001,$10A8 
    dw $0000

DrawInst_MissileStation_2:
    dw $0001,$80C9 
    db $00,$FF 
    dw $0001,$10A9 
    dw $0000

DrawInst_EnergyMissileStationRightAccess_0:
    dw $0001,$B4C3 
    dw $0000

DrawInst_EnergyMissileStationRightAccess_1:
    dw $0001,$84C1 
    dw $0000

DrawInst_EnergyMissileStationLeftAccess_0:
    dw $0001,$B0C3 
    dw $0000

DrawInst_EnergyMissileStationLeftAccess_1:
    dw $0001,$80C1 
    dw $0000

DrawInst_DraygonCannonShieldRight_0:
    dw $0002,$C514,$0513 
    db $00,$01 
    dw $0002,$D534,$0533 
    dw $0000

DrawInst_DraygonCannonShieldRight_1:
    dw $0002,$C516,$0515 
    db $00,$01 
    dw $0002,$D536,$0535 
    dw $0000

UNUSED_DrawInst_DraygonCannonShieldDownRight_0_849FED:
    dw $0002,$C510,$550F 
    db $00,$01 
    dw $0002,$D530,$D52F 
    dw $0000

UNUSED_DrawInst_DraygonCannonShieldDownRight_1_849FFD:
    dw $0002,$C512,$5511 
    db $00,$01 
    dw $0002,$D532,$D531 
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_DrawInst_DraygonCannonShieldUpRight_0_84A00D:
    dw $0002,$CD30,$5D2F 
    db $00,$01 
    dw $0002,$DD10,$DD0F 
    dw $0000

UNUSED_DrawInst_DraygonCannonShieldUpRight_1_84A01D:
    dw $0002,$CD32,$5D31 
    db $00,$01 
    dw $0002,$DD12,$DD11 
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED

DrawInst_DraygonCannonRight_0:
    dw $0002,$A580,$00FF 
    db $00,$01 
    dw $0002,$A5A0,$00FF 
    dw $0000

DrawInst_DraygonCannonRight_1:
    dw $0002,$A581,$00FF 
    db $00,$01 
    dw $0002,$A5A1,$00FF 
    dw $0000

DrawInst_DraygonCannonRight_2:
    dw $0002,$A582,$00FF 
    db $00,$01 
    dw $0002,$A5A2,$00FF 
    dw $0000

DrawInst_DraygonCannonRight_3:
    dw $0002,$A583,$00FF 
    db $00,$01 
    dw $0002,$A5A3,$00FF 
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_DrawInst_DraygonCannonDownRight_0_84A06D:
    dw $0002,$A5A5,$A5A4 
    db $00,$01 
    dw $0002,$A5C5,$05C4 
    dw $0000

UNUSED_DrawInst_DraygonCannonDownRight_1_84A07D:
    dw $0002,$A5A7,$A5A6 
    db $00,$01 
    dw $0002,$A5C7,$05C6 
    dw $0000

UNUSED_DrawInst_DraygonCannonDownRight_2_84A08D:
    dw $0002,$A5A9,$A5A8 
    db $00,$01 
    dw $0002,$A5C9,$05C8 
    dw $0000

UNUSED_DrawInst_DraygonCannonDownRight_3_84A09D:
    dw $0002,$A5AB,$A5AA 
    db $00,$01 
    dw $0002,$A5CB,$05CA 
    dw $0000

UNUSED_DrawInst_DraygonCannonUpRight_0_84A0AD:
    dw $0002,$ADC5,$0DC4 
    db $00,$01 
    dw $0002,$ADA5,$ADA4 
    dw $0000

UNUSED_DrawInst_DraygonCannonUpRight_1_84A0BD:
    dw $0002,$ADC7,$0DC6 
    db $00,$01 
    dw $0002,$ADA7,$ADA6 
    dw $0000

UNUSED_DrawInst_DraygonCannonUpRight_2_84A0CD:
    dw $0002,$ADC9,$0DC8 
    db $00,$01 
    dw $0002,$ADA9,$ADA8 
    dw $0000

UNUSED_DrawInst_DraygonCannonUpRight_3_84A0DD:
    dw $0002,$ADCB,$0DCA 
    db $00,$01 
    dw $0002,$ADAB,$ADAA 
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED

DrawInst_DraygonCannonShieldLeft_0:
    dw $0001,$C114 
    db $FF,$00 
    dw $0001,$0113 
    db $FF,$01 
    dw $0002,$0133,$D134 
    dw $0000

DrawInst_DraygonCannonShieldLeft_1:
    dw $0001,$C116 
    db $FF,$00 
    dw $0001,$0115 
    db $FF,$01 
    dw $0002,$0135,$D136 
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_DrawInst_DraygonCannonShieldDownLeft_0_84A115:
    dw $0001,$C110 
    db $FF,$00 
    dw $0001,$510F 
    db $FF,$01 
    dw $0002,$D12F,$D130 
    dw $0000

UNUSED_DrawInst_DraygonCannonShieldDownLeft_1_84A129:
    dw $0001,$C112 
    db $FF,$00 
    dw $0001,$5111 
    db $FF,$01 
    dw $0002,$D131,$D132 
    dw $0000

UNUSED_DrawInst_DraygonCannonShieldUpLeft_0_84A13D:
    dw $0001,$C930 
    db $FF,$00 
    dw $0001,$592F 
    db $FF,$01 
    dw $0002,$D90F,$D910 
    dw $0000

UNUSED_DrawInst_DraygonCannonShieldUpLeft_1_84A151:
    dw $0001,$C932 
    db $FF,$00 
    dw $0001,$5931 
    db $FF,$01 
    dw $0002,$D911,$D912 
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED

DrawInst_DraygonCannonLeft_0:
    dw $0001,$A180 
    db $FF,$00 
    dw $0001,$00FF 
    db $FF,$01 
    dw $0002,$00FF,$A1A0 
    dw $0000

DrawInst_DraygonCannonLeft_1:
    dw $0001,$A181 
    db $FF,$00 
    dw $0001,$00FF 
    db $FF,$01 
    dw $0002,$00FF,$A1A1 
    dw $0000

DrawInst_DraygonCannonLeft_2:
    dw $0001,$A182 
    db $FF,$00 
    dw $0001,$00FF 
    db $FF,$01 
    dw $0002,$00FF,$A1A2 
    dw $0000

DrawInst_DraygonCannonLeft_3:
    dw $0001,$A183 
    db $FF,$00 
    dw $0001,$00FF 
    db $FF,$01 
    dw $0002,$00FF,$A1A3 
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_DrawInst_DraygonCannonDownLeft_0_84A1B5:
    dw $0001,$A1A5 
    db $FF,$00 
    dw $0001,$A1A4 
    db $FF,$01 
    dw $0002,$01C4,$A1C5 
    dw $0000

UNUSED_DrawInst_DraygonCannonDownLeft_1_84A1C9:
    dw $0001,$A1A7 
    db $FF,$00 
    dw $0001,$A1A6 
    db $FF,$01 
    dw $0002,$01C6,$A1C7 
    dw $0000

UNUSED_DrawInst_DraygonCannonDownLeft_2_84A1DD:
    dw $0001,$A1A9 
    db $FF,$00 
    dw $0001,$A1A8 
    db $FF,$01 
    dw $0002,$01C8,$A1C9 
    dw $0000

UNUSED_DrawInst_DraygonCannonDownLeft_3_84A1F1:
    dw $0001,$A1AB 
    db $FF,$00 
    dw $0001,$A1AA 
    db $FF,$01 
    dw $0002,$01CA,$A1CB 
    dw $0000

UNUSED_DrawInst_DraygonCannonUpLeft_0_84A205:
    dw $0001,$A9C5 
    db $FF,$00 
    dw $0001,$09C4 
    db $FF,$01 
    dw $0002,$A9A4,$A9A5 
    dw $0000

UNUSED_DrawInst_DraygonCannonUpLeft_1_84A219:
    dw $0001,$A9C7 
    db $FF,$00 
    dw $0001,$09C6 
    db $FF,$01 
    dw $0002,$A9A6,$A9A7 
    dw $0000

UNUSED_DrawInst_DraygonCannonUpLeft_2_84A22D:
    dw $0001,$A9C9 
    db $FF,$00 
    dw $0001,$09C8 
    db $FF,$01 
    dw $0002,$A9A8,$A9A9 
    dw $0000

UNUSED_DrawInst_DraygonCannonUpLeft_3_84A241:
    dw $0001,$A9CB 
    db $FF,$00 
    dw $0001,$09CA 
    db $FF,$01 
    dw $0002,$A9AA,$A9AB 
    dw $0000

UNUSED_DrawInst_84A255:
    dw $8002,$2330,$2350 
    dw $0000

UNUSED_DrawInst_84A25D:
    dw $8002,$2331,$2351 
    dw $0000

UNUSED_DrawInst_84A265:
    dw $8002,$2332,$2352 
    dw $0000

UNUSED_DrawInst_84A26D:
    dw $8002,$2333,$2353 
    dw $0000

UNUSED_DrawInst_84A275:
    dw $8002,$2330,$2350 
    db $FF,$00 
    dw $8002,$2330,$2350 
    dw $0000

UNUSED_DrawInst_84A285:
    dw $8002,$2331,$2351 
    db $FF,$00 
    dw $8002,$2331,$2351 
    dw $0000

UNUSED_DrawInst_84A295:
    dw $8002,$2332,$2352 
    db $FF,$00 
    dw $8002,$2332,$2352 
    dw $0000

UNUSED_DrawInst_84A2A5:
    dw $8002,$2333,$2353 
    db $FF,$00 
    dw $8002,$2333,$2353 
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED

DrawInst_ItemChozoOrb:
    dw $0001,$00FF 
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_DrawInst_84A2BB:
    dw $0001,$805D 
    dw $0000

UNUSED_DrawInst_84A2C1:
    dw $0001,$805E 
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED

DrawInst_ItemOrb_0:
    dw $0001,$C072 
    dw $0000

DrawInst_ItemOrb_1:
    dw $0001,$C073 
    dw $0000

DrawInst_ItemOrb_2:
    dw $0001,$C074 
    dw $0000

DrawInst_ItemOrbBurst:
    dw $0001,$8075 
    dw $0000

DrawInst_EnergyTank_0:
    dw $0001,$B04A 
    dw $0000

DrawInst_EnergyTank_1:
    dw $0001,$B04B 
    dw $0000

DrawInst_MissileTank_0:
    dw $0001,$B04C 
    dw $0000

DrawInst_MissileTank_1:
    dw $0001,$B04D 
    dw $0000

DrawInst_SuperMissileTank_0:
    dw $0001,$B04E 
    dw $0000

DrawInst_SuperMissileTank_1:
    dw $0001,$B04F 
    dw $0000

DrawInst_PowerBombTank_0:
    dw $0001,$B050 
    dw $0000

DrawInst_PowerBombTank_1:
    dw $0001,$B051 
    dw $0000

DrawInst_DrawItemFrame0_0:
    dw $0001,$B08E 
    dw $0000

DrawInst_DrawItemFrame1_0:
    dw $0001,$B08F 
    dw $0000

DrawInst_DrawItemFrame0_1:
    dw $0001,$B090 
    dw $0000

DrawInst_DrawItemFrame1_1:
    dw $0001,$B091 
    dw $0000

DrawInst_DrawItemFrame0_2:
    dw $0001,$B092 
    dw $0000

DrawInst_DrawItemFrame1_2:
    dw $0001,$B093 
    dw $0000

DrawInst_DrawItemFrame0_3:
    dw $0001,$B094 
    dw $0000

DrawInst_DrawItemFrame1_3:
    dw $0001,$B095 
    dw $0000

DrawInst_84A33F:
    dw $0001,$8052 
    dw $0000

DrawInst_Respawn1x1_0:
    dw $0001,$0053 
    dw $0000

DrawInst_Respawn1x1_1:
    dw $0001,$0054 
    dw $0000

DrawInst_Respawn1x1_2:
    dw $0001,$0055 
    dw $0000

DrawInst_Respawn1x1_3:
    dw $0001,$00FF 
    dw $0000

DrawInst_Respawn2x1_0:
    dw $0002,$0053,$0053 
    dw $0000

DrawInst_Respawn2x1_1:
    dw $0002,$0054,$0054 
    dw $0000

DrawInst_Respawn2x1_2:
    dw $0002,$0055,$0055 
    dw $0000

DrawInst_Respawn2x1_3:
    dw $0002,$00FF,$00FF 
    dw $0000

DrawInst_Respawn1x2_0:
    dw $8002,$0053,$0053 
    dw $0000

DrawInst_Respawn1x2_1:
    dw $8002,$0054,$0054 
    dw $0000

DrawInst_Respawn1x2_2:
    dw $8002,$0055,$0055 
    dw $0000

DrawInst_Respawn1x2_3:
    dw $8002,$00FF,$00FF 
    dw $0000

DrawInst_Respawn2x2_0:
    dw $0002,$0053,$0053 
    db $00,$01 
    dw $0002,$0053,$0053 
    dw $0000

DrawInst_Respawn2x2_1:
    dw $0002,$0054,$0054 
    db $00,$01 
    dw $0002,$0054,$0054 
    dw $0000

DrawInst_Respawn2x2_2:
    dw $0002,$0055,$0055 
    db $00,$01 
    dw $0002,$0055,$0055 
    dw $0000

DrawInst_Respawn2x2_3:
    dw $0002,$00FF,$00FF 
    db $00,$01 
    dw $0002,$00FF,$00FF 
    dw $0000

DrawInst_ItemShotBlock_0:
    dw $0001,$8053 
    dw $0000

DrawInst_ItemShotBlock_1:
    dw $0001,$8054 
    dw $0000

DrawInst_ItemShotBlock_2:
    dw $0001,$8055 
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_DrawInst_84A3EF:
    dw $0001,$80FF 
    dw $0000

UNUSED_DrawInst_84A3F5:
    dw $0002,$8053,$8053 
    dw $0000

UNUSED_DrawInst_84A3FD:
    dw $0002,$8054,$8054 
    dw $0000

UNUSED_DrawInst_84A405:
    dw $0002,$8055,$8055 
    dw $0000

UNUSED_DrawInst_84A40D:
    dw $0002,$80FF,$80FF 
    dw $0000

UNUSED_DrawInst_84A415:
    dw $8002,$8053,$8053 
    dw $0000

UNUSED_DrawInst_84A41D:
    dw $8002,$8054,$8054 
    dw $0000

UNUSED_DrawInst_84A425:
    dw $8002,$8055,$8055 
    dw $0000

UNUSED_DrawInst_84A42D:
    dw $8002,$80FF,$80FF 
    dw $0000

UNUSED_DrawInst_84A435:
    dw $0002,$8053,$8053 
    db $00,$01 
    dw $0002,$8053,$8053 
    dw $0000

UNUSED_DrawInst_84A445:
    dw $0002,$8054,$8054 
    db $00,$01 
    dw $0002,$8054,$8054 
    dw $0000

UNUSED_DrawInst_84A455:
    dw $0002,$8055,$8055 
    db $00,$01 
    dw $0002,$8055,$8055 
    dw $0000

UNUSED_DrawInst_84A465:
    dw $0002,$80FF,$80FF 
    db $00,$01 
    dw $0002,$80FF,$80FF 
    dw $0000

UNUSED_DrawInst_1x1ShotBlock_84A475:
    dw $0001,$C052 
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED

DrawInst_2x1RespawningShotBlock:
    dw $0002,$C096,$5097 
    dw $0000

DrawInst_1x2RespawningShotBlock:
    dw $8002,$C098,$D0B8 
    dw $0000

DrawInst_2x2RespawningShotBlock:
    dw $0002,$C099,$509A 
    db $00,$01 
    dw $0002,$D0B9,$D0BA 
    dw $0000

DrawInst_1x1RespawningCrumbleBlock:
    dw $0001,$B0BC 
    dw $0000

DrawInst_2x1RespawningCrumbleBlock:
    dw $0002,$B0BC,$50BC 
    dw $0000

DrawInst_1x2RespawningCrumbleBlock:
    dw $8002,$B0BC,$D0BC 
    dw $0000

DrawInst_2x2RespawningCrumbleBlock:
    dw $0002,$B0BC,$50BC 
    db $00,$01 
    dw $0002,$D0BC,$D0BC 
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_DrawInst_84A4C1:
    dw $0001,$F058 
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED

DrawInst_2x1RespawningBombBlock:
    dw $0002,$F058,$5058 
    dw $0000

DrawInst_1x2RespawningBombBlock:
    dw $8002,$F058,$D058 
    dw $0000

DrawInst_2x2RespawningBombBlock:
    dw $0002,$F058,$5058 
    db $00,$01 
    dw $0002,$D058,$D058 
    dw $0000

UNUSED_DrawInst_PowerBombBlockBombed_84A4E7:
    dw $0001,$C057 
    dw $0000

UNUSED_DrawInst_SuperMissileBlockBombed_84A4ED:
    dw $0001,$C09F 
    dw $0000

DrawInst_BombReactionSpeedBlock:
    dw $0001,$B0B6 
    dw $0000

DrawInst_BreakableGrappleBlock_0:
    dw $0001,$E0B7 
    dw $0000

DrawInst_BreakableGrappleBlock_1:
    dw $0001,$0053 
    dw $0000

DrawInst_BreakableGrappleBlock_2:
    dw $0001,$0054 
    dw $0000

DrawInst_BreakableGrappleBlock_3:
    dw $0001,$0055 
    dw $0000

DrawInst_BreakableGrappleBlock_4:
    dw $0001,$00FF 
    dw $0000

DrawInst_DownwardsGateOpen:
    dw $8005,$C0D6,$00FF,$00FF,$00FF,$00FF 
    dw $0000

DrawInst_DownwardsGateOpenClosed_0:
    dw $8005,$C0D7,$C0FF,$00FF,$00FF,$00FF 
    dw $0000

DrawInst_DownwardsGateOpenClosed_1:
    dw $8005,$C0D7,$C0FF,$C0FF,$00FF,$00FF 
    dw $0000

DrawInst_DownwardsGateOpenClosed_2:
    dw $8005,$C0D7,$C0FF,$C0FF,$C0FF,$00FF 
    dw $0000

DrawInst_DownwardsGateOpenClosed_3:
    dw $8005,$C0D7,$C0FF,$C0FF,$C0FF,$C0FF 
    dw $0000

DrawInst_DownwardsGateClosed:
    dw $8005,$C0D6,$C0FF,$C0FF,$C0FF,$C0FF 
    dw $0000

DrawInst_UpwardsGateOpen:
    dw $8001,$C0D6,$FC00,$8004,$00FF,$00FF,$00FF,$00FF 
    dw $0000 

DrawInst_UpwardsGateOpenClosed_0:
    dw $8001,$C0D7 
    db $00,$FC 
    dw $8004,$00FF,$00FF,$00FF,$80FF 
    dw $0000

DrawInst_UpwardsGateOpenClosed_1:
    dw $8001,$C0D7 
    db $00,$FC 
    dw $8004,$00FF,$00FF,$C0FF,$C0FF 
    dw $0000

DrawInst_UpwardsGateOpenClosed_2:
    dw $8001,$C0D7 
    db $00,$FC 
    dw $8004,$00FF,$C0FF,$C0FF,$C0FF 
    dw $0000

DrawInst_UpwardsGateOpenClosed_3:
    dw $8001,$C0D7 
    db $00,$FC 
    dw $8004,$C0FF,$C0FF,$C0FF,$C0FF 
    dw $0000

DrawInst_UpwardsGateClosed:
    dw $8001,$C0D6 
    db $00,$FC 
    dw $8004,$C0FF,$C0FF,$C0FF,$C0FF 
    dw $0000

DrawInst_GateShotblockDownwardsBlueLeft:
    dw $0001,$80D6 
    db $FF,$00 
    dw $0001,$C0DB 
    dw $0000

DrawInst_GateShotblockDownwardsBlueRight:
    dw $0002,$80D6,$C4DB 
    dw $0000

DrawInst_GateShotblockDownwardsRedLeft:
    dw $0001,$80D6 
    db $FF,$00 
    dw $0001,$C0DA 
    dw $0000

DrawInst_GateShotblockDownwardsRedRight:
    dw $0002,$80D6,$C4DA 
    dw $0000

DrawInst_GateShotblockDownwardsGreenLeft:
    dw $0001,$80D6 
    db $FF,$00 
    dw $0001,$C0D9 
    dw $0000

DrawInst_GateShotblockDownwardsGreenRight:
    dw $0002,$80D6,$C4D9 
    dw $0000

DrawInst_GateShotblockDownwardsYellowLeft:
    dw $0001,$80D6 
    db $FF,$00 
    dw $0001,$C0D8 
    dw $0000

DrawInst_GateShotblockDownwardsYellowRight:
    dw $0002,$80D6,$C4D8 
    dw $0000

DrawInst_GateShotblockUpwardsBlueLeft:
    dw $0001,$88D6 
    db $FF,$00 
    dw $0001,$C8DB 
    dw $0000

DrawInst_GateShotblockUpwardsBlueRight:
    dw $0002,$88D6,$CCDB 
    dw $0000

DrawInst_GateShotblockUpwardsRedLeft:
    dw $0001,$88D6 
    db $FF,$00 
    dw $0001,$C8DA 
    dw $0000

DrawInst_GateShotblockUpwardsRedRight:
    dw $0002,$88D6,$CCDA 
    dw $0000

DrawInst_GateShotblockUpwardsGreenLeft:
    dw $0001,$88D6 
    db $FF,$00 
    dw $0001,$C8D9 
    dw $0000

DrawInst_GateShotblockUpwardsGreenRight:
    dw $0002,$88D6,$CCD9 
    dw $0000

DrawInst_GateShotblockUpwardsYellowLeft:
    dw $0001,$88D6 
    db $FF,$00 
    dw $0001,$C8D8 
    dw $0000

DrawInst_GateShotblockUpwardsYellowRight:
    dw $0002,$88D6,$CCD8 
    dw $0000

DrawInst_DoorFacingLeft_A677:
    dw $8004,$0082,$00A2,$08A2,$0882 
    dw $0000

DrawInst_DoorFacingRight_A683:
    dw $8004,$0482,$04A2,$0CA2,$0C82 
    dw $0000

DrawInst_DoorFacingUp_A68F:
    dw $0004,$0484,$0483,$0083,$0084 
    dw $0000

DrawInst_DoorFacingDown_A69B:
    dw $0004,$0C84,$0C83,$0883,$0884 
    dw $0000

DrawInst_GreyDoorFacingLeft_0:
    dw $8004,$C0AE,$D0CE,$D8CE,$D8AE 
    dw $0000

DrawInst_GreyDoorFacingLeft_1:
    dw $8004,$80AF,$80CF,$88CF,$88AF 
    dw $0000

DrawInst_GreyDoorFacingLeft_2:
    dw $8004,$80B0,$80D0,$88D0,$88B0 
    dw $0000

DrawInst_GreyDoorFacingLeft_3:
    dw $8004,$80B1,$00D1,$08D1,$88B1 
    dw $0000

DrawInst_GreyDoorFacingRight_0:
    dw $8004,$C4AE,$D4CE,$DCCE,$DCAE 
    dw $0000

DrawInst_GreyDoorFacingRight_1:
    dw $8004,$84AF,$84CF,$8CCF,$8CAF 
    dw $0000

DrawInst_GreyDoorFacingRight_2:
    dw $8004,$84B0,$84D0,$8CD0,$8CB0 
    dw $0000

DrawInst_GreyDoorFacingRight_3:
    dw $8004,$84B1,$84D1,$8CD1,$8CB1 
    dw $0000

DrawInst_GreyDoorFacingUp_0:
    dw $0004,$C4B3,$54B2,$50B2,$50B3 
    dw $0000

DrawInst_GreyDoorFacingUp_1:
    dw $0004,$84D3,$84D2,$80D2,$80D3 
    dw $0000

DrawInst_GreyDoorFacingUp_2:
    dw $0004,$84B5,$84B4,$80B4,$80B5 
    dw $0000

DrawInst_GreyDoorFacingUp_3:
    dw $0004,$84D5,$84D4,$80D4,$80D5 
    dw $0000

DrawInst_GreyDoorFacingDown_0:
    dw $0004,$CCB3,$5CB2,$58B2,$58B3 
    dw $0000

DrawInst_GreyDoorFacingDown_1:
    dw $0004,$8CD3,$8CD2,$88D2,$88D3 
    dw $0000

DrawInst_GreyDoorFacingDown_2:
    dw $0004,$8CB5,$8CB4,$88B4,$88B5 
    dw $0000

DrawInst_GreyDoorFacingDown_3:
    dw $0004,$8CD5,$0CD4,$08D4,$88D5 
    dw $0000

DrawInst_YellowDoorFacingLeft_0:
    dw $8004,$C000,$D020,$D820,$D800 
    dw $0000

DrawInst_YellowDoorFacingLeft_1:
    dw $8004,$8001,$8021,$8821,$8801 
    dw $0000

DrawInst_YellowDoorFacingLeft_2:
    dw $8004,$8002,$8022,$8822,$8802 
    dw $0000

DrawInst_YellowDoorFacingLeft_3:
    dw $8004,$8003,$0023,$0823,$8803 
    dw $0000

DrawInst_YellowDoorFacingRight_0:
    dw $8004,$C400,$D420,$DC20,$DC00 
    dw $0000

DrawInst_YellowDoorFacingRight_1:
    dw $8004,$8401,$8421,$8C21,$8C01 
    dw $0000

DrawInst_YellowDoorFacingRight_2:
    dw $8004,$8402,$8422,$8C22,$8C02 
    dw $0000

DrawInst_YellowDoorFacingRight_3:
    dw $8004,$8403,$8423,$8C23,$8C03 
    dw $0000

DrawInst_YellowDoorFacingUp_0:
    dw $0004,$C411,$5410,$5010,$5011 
    dw $0000

DrawInst_YellowDoorFacingUp_1:
    dw $0004,$8431,$8430,$8030,$8031 
    dw $0000

DrawInst_YellowDoorFacingUp_2:
    dw $0004,$8413,$8412,$8012,$8013 
    dw $0000

DrawInst_YellowDoorFacingUp_3:
    dw $0004,$8433,$8432,$8032,$8033 
    dw $0000

DrawInst_YellowDoorFacingDown_0:
    dw $0004,$CC11,$5C10,$5810,$5811 
    dw $0000

DrawInst_YellowDoorFacingDown_1:
    dw $0004,$8C31,$8C30,$8830,$8831 
    dw $0000

DrawInst_YellowDoorFacingDown_2:
    dw $0004,$8C13,$8C12,$8812,$8813 
    dw $0000

DrawInst_YellowDoorFacingDown_3:
    dw $0004,$8C33,$0C32,$0832,$8833 
    dw $0000

DrawInst_GreenDoorFacingLeft_0:
    dw $8004,$C004,$D024,$D824,$D804 
    dw $0000

DrawInst_GreenDoorFacingLeft_1:
    dw $8004,$8005,$8025,$8825,$8805 
    dw $0000

DrawInst_GreenDoorFacingLeft_2:
    dw $8004,$8006,$8026,$8826,$8806 
    dw $0000

DrawInst_GreenDoorFacingLeft_3:
    dw $8004,$8007,$0027,$0827,$8807 
    dw $0000

DrawInst_GreenDoorFacingRight_0:
    dw $8004,$C404,$D424,$DC24,$DC04 
    dw $0000

DrawInst_GreenDoorFacingRight_1:
    dw $8004,$8405,$8425,$8C25,$8C05 
    dw $0000

DrawInst_GreenDoorFacingRight_2:
    dw $8004,$8406,$8426,$8C26,$8C06 
    dw $0000

DrawInst_GreenDoorFacingRight_3:
    dw $8004,$8407,$0427,$0C27,$8C07 
    dw $0000

DrawInst_GreenDoorFacingUp_0:
    dw $0004,$C415,$5414,$5014,$5015 
    dw $0000

DrawInst_GreenDoorFacingUp_1:
    dw $0004,$8435,$8434,$8034,$8035 
    dw $0000

DrawInst_GreenDoorFacingUp_2:
    dw $0004,$8417,$8416,$8016,$8017 
    dw $0000

DrawInst_GreenDoorFacingUp_3:
    dw $0004,$8437,$8436,$8036,$8037 
    dw $0000

DrawInst_GreenDoorFacingDown_0:
    dw $0004,$CC15,$5C14,$5814,$5815 
    dw $0000

DrawInst_GreenDoorFacingDown_1:
    dw $0004,$8C35,$8C34,$8834,$8835 
    dw $0000

DrawInst_GreenDoorFacingDown_2:
    dw $0004,$8C17,$8C16,$8816,$8817 
    dw $0000

DrawInst_GreenDoorFacingDown_3:
    dw $0004,$8C37,$8C36,$8836,$8837 
    dw $0000

DrawInst_RedDoorFacingLeft_0:
    dw $8004,$C008,$D028,$D828,$D808 
    dw $0000

DrawInst_RedDoorFacingLeft_1:
    dw $8004,$8009,$8029,$8829,$8809 
    dw $0000

DrawInst_RedDoorFacingLeft_2:
    dw $8004,$800A,$802A,$882A,$880A 
    dw $0000

DrawInst_RedDoorFacingLeft_3:
    dw $8004,$800B,$002B,$082B,$880B 
    dw $0000

DrawInst_RedDoorFacingRight_0:
    dw $8004,$C408,$D428,$DC28,$DC08 
    dw $0000

DrawInst_RedDoorFacingRight_1:
    dw $8004,$8409,$8429,$8C29,$8C09 
    dw $0000

DrawInst_RedDoorFacingRight_2:
    dw $8004,$840A,$842A,$8C2A,$8C0A 
    dw $0000

DrawInst_RedDoorFacingRight_3:
    dw $8004,$840B,$042B,$0C2B,$8C0B 
    dw $0000

DrawInst_RedDoorFacingUp_0:
    dw $0004,$C419,$5418,$5018,$5019 
    dw $0000

DrawInst_RedDoorFacingUp_1:
    dw $0004,$8439,$8438,$8038,$8039 
    dw $0000

DrawInst_RedDoorFacingUp_2:
    dw $0004,$841B,$841A,$801A,$801B 
    dw $0000

DrawInst_RedDoorFacingUp_3:
    dw $0004,$843B,$843A,$803A,$803B 
    dw $0000

DrawInst_RedDoorFacingDown_0:
    dw $0004,$CC19,$5C18,$5818,$5819 
    dw $0000

DrawInst_RedDoorFacingDown_1:
    dw $0004,$8C39,$8C38,$8838,$8839 
    dw $0000

DrawInst_RedDoorFacingDown_2:
    dw $0004,$8C1B,$8C1A,$881A,$881B 
    dw $0000

DrawInst_RedDoorFacingDown_3:
    dw $0004,$8C3B,$8C3A,$883A,$883B 
    dw $0000

DrawInst_EyeDoorEyeFacingLeft:
    dw $8004,$800C,$D02C,$D82C,$D80C 
    dw $0000

DrawInst_DoorFacingLeft_A9B3:
    dw $8004,$C00C,$D02C,$D82C,$D80C 
    dw $0000

DrawInst_BlueDoorFacingLeft_0:
    dw $8004,$800D,$802D,$882D,$880D 
    dw $0000

DrawInst_BlueDoorFacingLeft_1:
    dw $8004,$800E,$802E,$882E,$880E 
    dw $0000

DrawInst_BlueDoorFacingLeft_2:
    dw $8004,$800F,$002F,$082F,$880F 
    dw $0000

DrawInst_EyeDoorEyeFacingRight:
    dw $8004,$840C,$D42C,$DC2C,$DC0C 
    dw $0000

DrawInst_DoorFacingRight_A9EF:
    dw $8004,$C40C,$D42C,$DC2C,$DC0C 
    dw $0000

DrawInst_BlueDoorFacingRight_0:
    dw $8004,$840D,$842D,$8C2D,$8C0D 
    dw $0000

DrawInst_BlueDoorFacingRight_1:
    dw $8004,$840E,$842E,$8C2E,$8C0E 
    dw $0000

DrawInst_BlueDoorFacingRight_2:
    dw $8004,$840F,$042F,$0C2F,$8C0F 
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_DrawInst_84AA1F:
    dw $0004,$841D,$541C,$501C,$501D 
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED

DrawInst_DoorFacingUp_AA2B:
    dw $0004,$C41D,$541C,$501C,$501D 
    dw $0000

DrawInst_BlueDoorFacingUp_0:
    dw $0004,$843D,$843C,$803C,$803D 
    dw $0000

DrawInst_BlueDoorFacingUp_1:
    dw $0004,$841F,$841E,$801E,$801F 
    dw $0000

DrawInst_BlueDoorFacingUp_2:
    dw $0004,$843F,$843E,$803E,$803F 
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_DrawInst_84AA5B:
    dw $0004,$8C1D,$5C1C,$581C,$581D 
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED

DrawInst_DoorFacingDown_AA67:
    dw $0004,$CC1D,$5C1C,$581C,$581D 
    dw $0000

DrawInst_BlueDoorFacingDown_0:
    dw $0004,$8C3D,$8C3C,$883C,$883D 
    dw $0000

DrawInst_BlueDoorFacingDown_1:
    dw $0004,$8C1F,$8C1E,$881E,$881F 
    dw $0000

DrawInst_BlueDoorFacingDown_2:
    dw $0004,$8C3F,$8C3E,$883E,$883F 
    dw $0000

DrawInst_ElevatorPlatform_0:
    dw $0001,$8085 
    db $03,$00 
    dw $0001,$8485 
    db $00,$01 
    dw $0004,$8088,$8089,$8489,$8488 
    dw $0000

DrawInst_ElevatorPlatform_1:
    dw $0001,$8086 
    db $03,$00 
    dw $0001,$8486 
    db $00,$01 
    dw $0004,$808A,$808B,$848B,$848A 
    dw $0000

DrawInst_ElevatorPlatform_2:
    dw $0001,$8087 
    db $03,$00 
    dw $0001,$8487 
    db $00,$01 
    dw $0004,$808C,$808D,$848D,$848C 
    dw $0000


if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_PLM_DrawEmptyTile_84AADF:
    dw $0001,DrawInst_ItemChozoOrb 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_PLM_Delete:
    dw Instruction_PLM_Delete 

InstList_PLM_CrumbleAccessToTourianElevator_0:
    dw Instruction_PLM_TimerEqualsY_8Bit : db $06 

InstList_PLM_CrumbleAccessToTourianElevator_1:
    dw $0004,DrawInst_CrumbleAccessToTourianElevator_1 
    dw $0004,DrawInst_CrumbleAccessToTourianElevator_2 
    dw $0004,DrawInst_CrumbleAccessToTourianElevator_3 
    dw $0004,DrawInst_CrumbleAccessToTourianElevator_0 
    dw Instruction_PLM_MovePLMDown1Block_84AB00 
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero 
    dw InstList_PLM_CrumbleAccessToTourianElevator_1 
    dw Instruction_PLM_Delete 

Instruction_PLM_MovePLMDown1Block_84AB00:
    LDA.W $07A5 
    ASL A 
    CLC : ADC.W $1C87,X : STA.W $1C87,X 
    RTS 


InstList_PLM_ClearAccessToTourianElevator:
    dw $0001,DrawInst_ClearAccessToTourianElevator 
    dw Instruction_PLM_Delete 

InstList_PLM_CrumbleSporeSpawnCeiling:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6 : db $0A 
    dw $0004,DrawInst_CrumbleSporeSpawnCeiling_0 
    dw $0004,DrawInst_CrumbleSporeSpawnCeiling_1 
    dw $0004,DrawInst_CrumbleSporeSpawnCeiling_2 

InstList_PLM_ClearSporeSpawnCeiling:
    dw $0004,DrawInst_ClearSporeSpawnCeiling 
    dw Instruction_PLM_Delete 


RTS_84AB27:
    RTS 

Setup_CrumbleBotwoonWall_Wait40Frames:
    TYX 
    LDA.W #$0040 : STA.L $7EDE1C,X 
    RTS 


InstList_PLM_CrumbleBotwoonWall_0:
    dw Instruction_PLM_TimerEqualsY_8Bit : db $09 
    dw Instruction_PLM_Scroll_0_1_Blue 

InstList_PLM_CrumbleBotwoonWall_1:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6 : db $0A 
    dw $0004,DrawInst_Respawn1x1_0 
    dw $0004,DrawInst_Respawn1x1_1 
    dw $0004,DrawInst_Respawn1x1_2 
    dw $0004,DrawInst_Respawn1x1_3 
    dw Instruction_PLM_MovePLMDown1Block 
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero 
    dw InstList_PLM_CrumbleBotwoonWall_1 
    dw Instruction_PLM_Delete 


Instruction_PLM_Scroll_0_1_Blue:
    LDA.W #$0101 : STA.L $7ECD20 
    RTS 

Instruction_PLM_MovePLMDown1Block:
    LDA.W $1C87,X : CLC : ADC.W $07A5 : ADC.W $07A5 : STA.W $1C87,X 
    RTS 


InstList_PLM_ClearBotwoonWall:
    dw $0001,DrawInst_ClearBotwoonWall 
    dw Instruction_PLM_Delete 

InstList_PLM_CrumbleKraidCeilingBlockIntoBackground1:
    dw $0003,DrawInst_CrumbleKraidCeiling_CrumbleKraidSpikes_Elevatube 
    dw $0003,DrawInst_CrumbleKraidCeiling_CrumbleKraidSpikes_0 
    dw $0003,DrawInst_CrumbleKraidCeiling_CrumbleKraidSpikes_1 

InstList_PLM_SetKraidCeilingBlockToBackground1:
    dw $0003,UNUSED_DrawInst_SetKraidCeilingBlockToBackground1_849379 
    dw Instruction_PLM_Delete 

InstList_PLM_CrumbleKraidCeilingBlockIntoBackground2:
    dw $0003,DrawInst_CrumbleKraidCeiling_CrumbleKraidSpikes_Elevatube 
    dw $0003,DrawInst_CrumbleKraidCeiling_CrumbleKraidSpikes_0 
    dw $0003,DrawInst_CrumbleKraidCeiling_CrumbleKraidSpikes_1 

InstList_PLM_SetKraidCeilingBlockToBackground2:
    dw $0003,DrawInst_SetKraidCeilingBlockToBackground2 
    dw Instruction_PLM_Delete 

InstList_PLM_CrumbleKraidCeilingBlockIntoBackground3:
    dw $0003,DrawInst_CrumbleKraidCeiling_CrumbleKraidSpikes_Elevatube 
    dw $0003,DrawInst_CrumbleKraidCeiling_CrumbleKraidSpikes_0 
    dw $0003,DrawInst_CrumbleKraidCeiling_CrumbleKraidSpikes_1 

InstList_PLM_SetKraidCeilingBlockToBackground3:
    dw $0003,DrawInst_SetKraidCeilingBlockToBackground3 
    dw Instruction_PLM_Delete 

InstList_PLM_ClearKraidCeiling:
    dw $0001,DrawInst_ClearKraidCeiling 
    dw Instruction_PLM_Delete 

InstList_PLM_CrumbleKraidSpikeBlocks_0:
    dw Instruction_PLM_TimerEqualsY_8Bit : db $0B 

InstList_PLM_CrumbleKraidSpikeBlocks_1:
    dw $0003,DrawInst_CrumbleKraidCeiling_CrumbleKraidSpikes_Elevatube 
    dw $0003,DrawInst_CrumbleKraidCeiling_CrumbleKraidSpikes_0 
    dw $0003,DrawInst_CrumbleKraidCeiling_CrumbleKraidSpikes_1 
    dw $0003,DrawInst_CrumbleKraidSpikeBlocks_0 
    dw Instruction_PLM_MovePLMRight1Block 
    dw $0003,DrawInst_CrumbleKraidCeiling_CrumbleKraidSpikes_Elevatube 
    dw $0003,DrawInst_CrumbleKraidCeiling_CrumbleKraidSpikes_0 
    dw $0003,DrawInst_CrumbleKraidCeiling_CrumbleKraidSpikes_1 
    dw $0003,DrawInst_CrumbleKraidSpikeBlocks_1 
    dw Instruction_PLM_MovePLMRight1Block 
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero 
    dw InstList_PLM_CrumbleKraidSpikeBlocks_1 
    dw Instruction_PLM_Delete 


Instruction_PLM_MovePLMRight1Block:
    INC.W $1C87,X 
    INC.W $1C87,X 
    RTS 


InstList_PLM_ClearKraidSpikeBlocks:
    dw $0001,DrawInst_ClearKraidSpikeBlocks 
    dw Instruction_PLM_Delete 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_PLM_84ABE3:
    dw $0001,UNUSED_DrawInst_849453 
    dw Instruction_PLM_Delete 

UNUSED_InstList_PLM_84ABE9:
    dw $0001,UNUSED_DrawInst_849463 
    dw Instruction_PLM_Delete 

UNUSED_InstList_PLM_84ABEF_0:
    dw $0018,DrawInst_EscapeRoom1Gate_0 

UNUSED_InstList_PLM_84ABF3_1:
    dw $0001,DrawInst_EscapeRoom1Gate_2 
    dw Instruction_PLM_Delete 

UNUSED_InstList_PLM_84ABF9:
    dw $0001,UNUSED_DrawInst_849497 
    dw Instruction_PLM_Delete 

UNUSED_PLM_InstList_84ABFF:
    dw $0001,UNUSED_DrawInst_84949D 
    dw Instruction_PLM_Delete 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_PLM_FillMotherBrainsWall:
    dw $0001,DrawInst_FillMotherBrainsWall 
    dw Instruction_PLM_Delete 

InstList_PLM_MotherBrainsRoomEscapeDoor:
    dw $0001,DrawInst_MotherBrainsRoomEscapeDoor 
    dw Instruction_PLM_Delete 

InstList_PLM_MotherBrainsBackgroundRow2:
    dw $0001,DrawInst_MotherBrainsBackgroundRow2 
    dw Instruction_PLM_Delete 

InstList_PLM_MotherBrainsBackgroundRow3:
    dw $0001,DrawInst_MotherBrainsBackgroundRow3 
    dw Instruction_PLM_Delete 

InstList_PLM_MotherBrainsBackgroundRow4:
    dw $0001,DrawInst_MotherBrainsBackgroundRow4 
    dw Instruction_PLM_Delete 

InstList_PLM_MotherBrainsBackgroundRow5:
    dw $0001,DrawInst_MotherBrainsBackgroundRow5 
    dw Instruction_PLM_Delete 

InstList_PLM_MotherBrainsBackgroundRow6:
    dw $0001,DrawInst_MotherBrainsBackgroundRow6 
    dw Instruction_PLM_Delete 

InstList_PLM_MotherBrainsBackgroundRow7:
    dw $0001,DrawInst_MotherBrainsBackgroundRow7 
    dw Instruction_PLM_Delete 

InstList_PLM_MotherBrainsBackgroundRow8:
    dw $0001,DrawInst_MotherBrainsBackgroundRow8 
    dw Instruction_PLM_Delete 

InstList_PLM_MotherBrainsBackgroundRow9:
    dw $0001,DrawInst_MotherBrainsBackgroundRow9 
    dw Instruction_PLM_Delete 

InstList_PLM_MotherBrainsBackgroundRowA:
    dw $0001,DrawInst_MotherBrainsBackgroundRowA 
    dw Instruction_PLM_Delete 

InstList_PLM_MotherBrainsBackgroundRowB:
    dw $0001,DrawInst_MotherBrainsBackgroundRowB 
    dw Instruction_PLM_Delete 

InstList_PLM_MotherBrainsBackgroundRowC:
    dw $0001,DrawInst_MotherBrainsBackgroundRowC 
    dw Instruction_PLM_Delete 

InstList_PLM_MotherBrainsBackgroundRowD:
    dw $0001,DrawInst_MotherBrainsBackgroundRowD 
    dw Instruction_PLM_Delete 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_PLM_84AC59:
    dw $0001,UNUSED_DrawInst_94966D 
    dw Instruction_PLM_Delete 

UNUSED_InstList_PLM_84AC5F:
    dw $0001,UNUSED_DrawInst_94968B 
    dw Instruction_PLM_Delete 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_PLM_ClearCeilingBlockInMotherBrainsRoom:
    dw $0001,DrawInst_ClearCeilingBlockInMotherBrainsRoom 
    dw Instruction_PLM_Delete 

InstList_PLM_ClearCeilingTubeInMotherBrainsRoom:
    dw $0001,DrawInst_ClearCeilingTubeInMotherBrainsRoom 
    dw Instruction_PLM_Delete 

InstList_PLM_ClearMotherBrainsBottomMiddleSideTube:
    dw $0001,DrawInst_ClearMotherBrainsBottomMiddleSideTube 
    dw Instruction_PLM_Delete 

InstList_PLM_ClearMotherBrainsBottomMiddleTubes:
    dw $0001,DrawInst_ClearMotherBrainsBottomMiddleTubes 
    dw Instruction_PLM_Delete 

InstList_PLM_ClearMotherBrainsBottomLeftTube:
    dw $0001,DrawInst_ClearMotherBrainsBottomLeftTube 
    dw Instruction_PLM_Delete 

InstList_PLM_ClearMotherBrainsBottomRightTube:
    dw $0001,DrawInst_ClearMotherBrainsBottomRightTube 
    dw Instruction_PLM_Delete 

PreInst_PLM_PositionSamus_GiveAtLeast10FramesOfInvincibility:
    LDA.W $1E17,X : STA.W $0AF6 
    LDA.L $7EDF0C,X : STA.W $0AFA 
    LDA.W #$0010 
    TSB.W $18A8 
    RTS 


Instruction_PLM_Deal2DamageToSamus:
    LDA.W $0A4E : CLC : ADC.W #$0000 : STA.W $0A4E 
    LDA.W $0A50 : ADC.W #$0002 : STA.W $0A50 
    RTS 


Instruction_PLM_GiveSamus30FramesOfInvincibility:
    LDA.W #$0030 : STA.W $18A8 
    RTS 


InstList_PLM_BrinstarFloorPlant_0:
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInst_PLM_PositionSamus_GiveAtLeast10FramesOfInvincibility 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $04 

InstList_PLM_BrinstarFloorPlant_1:
    dw $0005,DrawInst_BrinstarFloorPlant_2 
    dw $0005,DrawInst_BrinstarFloorPlant_1 
    dw $0005,DrawInst_BrinstarFloorPlant_2 
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6 : db $31 
    dw Instruction_PLM_Deal2DamageToSamus 
    dw $0005,DrawInst_BrinstarFloorPlant_3 
    dw $0005,DrawInst_BrinstarFloorPlant_2 
    dw $0005,DrawInst_BrinstarFloorPlant_1 
    dw $0005,DrawInst_BrinstarFloorPlant_2 
    dw Instruction_PLM_Deal2DamageToSamus 
    dw $0005,DrawInst_BrinstarFloorPlant_3 
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero 
    dw InstList_PLM_BrinstarFloorPlant_1 
    dw Instruction_PLM_GiveSamus30FramesOfInvincibility 
    dw Instruction_PLM_ClearPreInstruction 
    dw $0060,DrawInst_BrinstarFloorPlant_3 
    dw $0001,DrawInst_BrinstarFloorPlant_0 
    dw Instruction_PLM_Delete 

InstList_PLM_BrinstarCeilingPlant_0:
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInst_PLM_PositionSamus_GiveAtLeast10FramesOfInvincibility 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $08 

InstList_PLM_BrinstarCeilingPlant_1:
    dw $0005,DrawInst_BrinstarCeilingPlant_2 
    dw $0005,DrawInst_BrinstarCeilingPlant_1 
    dw $0005,DrawInst_BrinstarCeilingPlant_2 
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6 : db $31 
    dw Instruction_PLM_Deal2DamageToSamus 
    dw $0005,DrawInst_BrinstarCeilingPlant_3 
    dw $0005,DrawInst_BrinstarCeilingPlant_2 
    dw $0005,DrawInst_BrinstarCeilingPlant_1 
    dw $0005,DrawInst_BrinstarCeilingPlant_2 
    dw Instruction_PLM_Deal2DamageToSamus 
    dw $0005,DrawInst_BrinstarCeilingPlant_3 
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero 
    dw InstList_PLM_BrinstarCeilingPlant_1 
    dw Instruction_PLM_GiveSamus30FramesOfInvincibility 
    dw Instruction_PLM_ClearPreInstruction 
    dw $0060,DrawInst_BrinstarCeilingPlant_3 
    dw $0001,DrawInst_BrinstarCeilingPlant_0 
    dw Instruction_PLM_Delete 

InstList_PLM_WreckedShipEntranceTreadmillFromWest_0:
    dw Instruction_PLM_GotoY_ifBossBitsSet : db $01 
    dw InstList_PLM_WreckedShipEntranceTreadmillFromWest_1 
    dw Instruction_PLM_Delete 

InstList_PLM_WreckedShipEntranceTreadmillFromWest_1:
    dw Instruction_PLM_Draw38TilesOfBlankRightwardsTreadmill 
    dw Instruction_PLM_Delete 

Instruction_PLM_Draw38TilesOfBlankRightwardsTreadmill:
    JSR.W Write_Row_of_Level_Data_Block_and_BTS 
    dw $30FF,$0008,$0038 
    RTS 


InstList_PLM_WreckedShipEntranceTreadmillFromEast_0:
    dw Instruction_PLM_GotoY_ifBossBitsSet : db $01 
    dw InstList_PLM_WreckedShipEntranceTreadmillFromEast_1 
    dw Instruction_PLM_Delete 

InstList_PLM_WreckedShipEntranceTreadmillFromEast_1:
    dw Instruction_PLM_Draw38TilesOfBlankLeftwardsTreadmill 
    dw Instruction_PLM_Delete 

Instruction_PLM_Draw38TilesOfBlankLeftwardsTreadmill:
    JSR.W Write_Row_of_Level_Data_Block_and_BTS 
    dw $30FF,$0009,$0038 
    RTS 


InstList_PLM_MapStation_0:
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_MapStation_2 

InstList_PLM_MapStation_1:
    dw $0006,DrawInst_MapStation_0 
    dw $0006,DrawInst_MapStation_1 
    dw $0006,DrawInst_MapStation_2 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_MapStation_1 

InstList_PLM_MapStation_2:
    dw $0002,DrawInst_MapStation_0 
    dw $0002,DrawInst_MapStation_1 
    dw $0002,DrawInst_MapStation_2 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_MapStation_2 

InstList_PLM_MapStationRightAccess:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6 : db $37 
    dw $0006,DrawInst_MapStationRightAccess_0 
    dw $0060,DrawInst_MapStationRightAccess_1 
    dw Instruction_PLM_Activate_MapStation 
    dw $0006,DrawInst_MapStationRightAccess_1 
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6 : db $38 
    dw $0006,DrawInst_MapStationRightAccess_1 
    dw $0006,DrawInst_MapStationRightAccess_0 
    dw Instruction_PLM_Delete 

InstList_PLM_MapStationLeftAccess:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6 : db $37 
    dw $0006,DrawInst_MapStationLeftAccess_0 
    dw $0060,DrawInst_MapStationLeftAccess_1 
    dw Instruction_PLM_Activate_MapStation 
    dw $0006,DrawInst_MapStationLeftAccess_1 
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6 : db $38 
    dw $0006,DrawInst_MapStationLeftAccess_1 
    dw $0006,DrawInst_MapStationLeftAccess_0 
    dw Instruction_PLM_Delete 

InstList_PLM_EnergyStation_0:
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_EnergyStation_2 

InstList_PLM_EnergyStation_1:
    dw $0006,DrawInst_EnergyStation_0 
    dw $0006,DrawInst_EnergyStation_1 
    dw $0006,DrawInst_EnergyStation_2 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_EnergyStation_1 

InstList_PLM_EnergyStation_2:
    dw Instruction_PLM_GotoY_EnableMovementIfSamusEnergyIsFull 
    dw InstList_PLM_EnergyStation_4 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $10 

InstList_PLM_EnergyStation_3:
    dw $0002,DrawInst_EnergyStation_0 
    dw $0002,DrawInst_EnergyStation_1 
    dw $0002,DrawInst_EnergyStation_2 
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero 
    dw InstList_PLM_EnergyStation_3 

InstList_PLM_EnergyStation_4:
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_EnergyStation_0 

InstList_PLM_EnergyStationRightAccess_0:
    dw Instruction_PLM_GotoY_EnableMovementIfSamusEnergyIsFull 
    dw InstList_PLM_EnergyStationRightAccess_1 
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6 : db $37 
    dw $0006,DrawInst_EnergyMissileStationRightAccess_0 
    dw $0060,DrawInst_EnergyMissileStationRightAccess_1 
    dw Instruction_PLM_Activate_EnergyStation 
    dw $0006,DrawInst_EnergyMissileStationRightAccess_1 
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6 : db $38 
    dw $0006,DrawInst_EnergyMissileStationRightAccess_1 
    dw $0006,DrawInst_EnergyMissileStationRightAccess_0 

InstList_PLM_EnergyStationRightAccess_1:
    dw Instruction_PLM_Delete 

InstList_PLM_EnergyStationLeftAccess_0:
    dw Instruction_PLM_GotoY_EnableMovementIfSamusEnergyIsFull 
    dw InstList_PLM_EnergyStationLeftAccess_1 
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6 : db $37 
    dw $0006,DrawInst_EnergyMissileStationLeftAccess_0 
    dw $0060,DrawInst_EnergyMissileStationLeftAccess_1 
    dw Instruction_PLM_Activate_EnergyStation 
    dw $0006,DrawInst_EnergyMissileStationLeftAccess_1 
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6 : db $38 
    dw $0006,DrawInst_EnergyMissileStationLeftAccess_1 
    dw $0006,DrawInst_EnergyMissileStationLeftAccess_0 

InstList_PLM_EnergyStationLeftAccess_1:
    dw Instruction_PLM_Delete 

Instruction_PLM_GotoY_EnableMovementIfSamusEnergyIsFull:
    LDA.W $09C4 
    CMP.W $09C2 
    BEQ .fullEnergy 
    INY #2
    RTS 


.fullEnergy:
    LDA.W #$0001 
    JSL.L Run_Samus_Command 
    LDA.W $0000,Y 
    TAY 
    RTS 


InstList_PLM_MissileStation_0:
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_MissileStation_2 

InstList_PLM_MissileStation_1:
    dw $0006,DrawInst_MissileStation_0 
    dw $0006,DrawInst_MissileStation_1 
    dw $0006,DrawInst_MissileStation_2 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_MissileStation_1 

InstList_PLM_MissileStation_2:
    dw Instruction_PLM_GotoY_EnableMovementIfSamusMissilesAreFull 
    dw InstList_PLM_MissileStation_4 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $10 

InstList_PLM_MissileStation_3:
    dw $0003,DrawInst_MissileStation_0 
    dw $0003,DrawInst_MissileStation_1 
    dw $0003,DrawInst_MissileStation_2 
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero 
    dw InstList_PLM_MissileStation_3 

InstList_PLM_MissileStation_4:
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_MissileStation_0 

InstList_PLM_MissileStationRightAccess_0:
    dw Instruction_PLM_GotoY_EnableMovementIfSamusMissilesAreFull 
    dw InstList_PLM_MissileStationRightAccess_1 
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6 : db $37 
    dw $0006,DrawInst_EnergyMissileStationRightAccess_0 
    dw $0060,DrawInst_EnergyMissileStationRightAccess_1 
    dw Instruction_PLM_Activate_MissileStation 
    dw $0006,DrawInst_EnergyMissileStationRightAccess_1 
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6 : db $38 
    dw $0006,DrawInst_EnergyMissileStationRightAccess_1 
    dw $0006,DrawInst_EnergyMissileStationRightAccess_0 

InstList_PLM_MissileStationRightAccess_1:
    dw Instruction_PLM_Delete 

InstList_PLM_MissileStationLeftAccess_0:
    dw Instruction_PLM_GotoY_EnableMovementIfSamusMissilesAreFull 
    dw InstList_PLM_MissileStationLeftAccess_1 
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6 : db $37 
    dw $0006,DrawInst_EnergyMissileStationLeftAccess_0 
    dw $0060,DrawInst_EnergyMissileStationLeftAccess_1 
    dw Instruction_PLM_Activate_MissileStation 
    dw $0006,DrawInst_EnergyMissileStationLeftAccess_1 
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6 : db $38 
    dw $0006,DrawInst_EnergyMissileStationLeftAccess_1 
    dw $0006,DrawInst_EnergyMissileStationLeftAccess_0 

InstList_PLM_MissileStationLeftAccess_1:
    dw Instruction_PLM_Delete 

Instruction_PLM_GotoY_EnableMovementIfSamusMissilesAreFull:
    LDA.W $09C8 
    CMP.W $09C6 
    BEQ .missilesFull 
    INY #2
    RTS 


.missilesFull:
    LDA.W #$0001 
    JSL.L Run_Samus_Command 
    LDA.W $0000,Y 
    TAY 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
InstList_PLM_Nothing_84AED6:
    dw Instruction_PLM_Delete 

InstList_PLM_Nothing_84AED8:
    dw $0010,UNUSED_DrawInst_84A255 
    dw $0010,UNUSED_DrawInst_84A25D 
    dw $0010,UNUSED_DrawInst_84A265 
    dw $0010,UNUSED_DrawInst_84A26D 
    dw $0012,UNUSED_DrawInst_84A255 
    dw $0012,UNUSED_DrawInst_84A25D 
    dw $0012,UNUSED_DrawInst_84A265 
    dw $0012,UNUSED_DrawInst_84A26D 
    dw $0014,UNUSED_DrawInst_84A255 
    dw $0014,UNUSED_DrawInst_84A25D 
    dw $0014,UNUSED_DrawInst_84A265 
    dw $0014,UNUSED_DrawInst_84A26D 
    dw $0012,UNUSED_DrawInst_84A255 
    dw $0012,UNUSED_DrawInst_84A25D 
    dw $0012,UNUSED_DrawInst_84A265 
    dw $0012,UNUSED_DrawInst_84A26D 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_Nothing_84AED8 

InstList_PLM_Nothing_84AF1C:
    dw Instruction_PLM_Delete 

InstList_PLM_Nothing_84AF1E:
    dw $0010,UNUSED_DrawInst_84A275 
    dw $0010,UNUSED_DrawInst_84A285 
    dw $0010,UNUSED_DrawInst_84A295 
    dw $0010,UNUSED_DrawInst_84A2A5 
    dw $0012,UNUSED_DrawInst_84A275 
    dw $0012,UNUSED_DrawInst_84A285 
    dw $0012,UNUSED_DrawInst_84A295 
    dw $0012,UNUSED_DrawInst_84A2A5 
    dw $0014,UNUSED_DrawInst_84A275 
    dw $0014,UNUSED_DrawInst_84A285 
    dw $0014,UNUSED_DrawInst_84A295 
    dw $0014,UNUSED_DrawInst_84A2A5 
    dw $0012,UNUSED_DrawInst_84A275 
    dw $0012,UNUSED_DrawInst_84A285 
    dw $0012,UNUSED_DrawInst_84A295 
    dw $0012,UNUSED_DrawInst_84A2A5 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_Nothing_84AF1E 
endif ; !FEATURE_KEEP_UNREFERENCED

DrawInst_Debug_ScrollPLM:
    dw $0001,$3074 
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_DrawInst_Debug_SolidScrollPLM_84AF68:
    dw $0001,$B074 
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED

DrawInst_Debug_LeftwardsExtension:
    dw $0001,$5011 
    dw $0000

DrawInst_Debug_RightwardsExtension:
    dw $0001,$5411 
    dw $0000

DrawInst_Debug_UpwardsExtension:
    dw $0001,$D800 
    dw $0000

DrawInst_Debug_DownwardsExtension:
    dw $0001,$D000 
    dw $0000

InstList_PLM_ScrollPLM_0:
    dw $0001,DrawInst_Debug_ScrollPLM 

InstList_PLM_ScrollPLM_1:
    dw Instruction_PLM_Sleep 
    dw Instruction_PLM_ProcessAirScrollUpdate 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_ScrollPLM_1 

if !FEATURE_KEEP_UNREFERENCED
InstList_PLM_SolidScrollPLM_0:
    dw $0001,UNUSED_DrawInst_Debug_SolidScrollPLM_84AF68 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_PLM_SolidScrollPLM_1:
    dw Instruction_PLM_Sleep 
    dw Instruction_PLM_ProcessSolidScrollUpdate 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_SolidScrollPLM_1 

InstList_PLM_Debug_LeftwardsExtension:
    dw $0001,DrawInst_Debug_LeftwardsExtension 
    dw Instruction_PLM_Delete 

InstList_PLM_Debug_RightwardsExtension:
    dw $0001,DrawInst_Debug_RightwardsExtension 
    dw Instruction_PLM_Delete 

InstList_PLM_Debug_UpwardsExtension:
    dw $0001,DrawInst_Debug_UpwardsExtension 
    dw Instruction_PLM_Delete 

InstList_PLM_Debug_DownwardsExtension:
    dw $0001,DrawInst_Debug_DownwardsExtension 
    dw Instruction_PLM_Delete 

InstList_PLM_ElevatorPlatform:
    dw $0004,DrawInst_ElevatorPlatform_0 
    dw $0004,DrawInst_ElevatorPlatform_1 
    dw $0004,DrawInst_ElevatorPlatform_2 
    dw $0004,DrawInst_ElevatorPlatform_1 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_ElevatorPlatform 

InstList_PLM_ClearCrocomiresBridge:
    dw $0001,DrawInst_ClearCrocomiresBridge 
    dw Instruction_PLM_Delete 

InstList_PLM_CrumbleABlockOfCrocomiresBridge:
    dw $0001,DrawInst_CrumbleABlockOfCrocomiresBridge 
    dw Instruction_PLM_Delete 

InstList_PLM_ClearABlockOfCrocomiresBridge:
    dw $0001,DrawInst_ClearABlockOfCrocomiresBridge 
    dw Instruction_PLM_Delete 

InstList_PLM_ClearCrocomiresInvisibleWall:
    dw $0001,DrawInst_ClearCrocomireInvisibleWall_0 
    dw Instruction_PLM_Delete 

InstList_PLM_CreateCrocomiresInvisibleWall:
    dw $0001,DrawInst_ClearCrocomireInvisibleWall_1 
    dw Instruction_PLM_Delete 

InstList_PLM_SaveStation_0:
    dw $0001,DrawInst_SaveStation_0 
    dw Instruction_PLM_Sleep 
    dw Instruction_PLM_GotoY_or_ActivateSaveStation 
    dw InstList_PLM_SaveStation_2 
    dw Instruction_PLM_PlaceSamusOnSaveStation 
    dw Instruction_PLM_QueueSound_Y_Lib1_Max6 : db $2E 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $15 

InstList_PLM_SaveStation_1:
    dw $0004,DrawInst_SaveStation_2 
    dw $0004,DrawInst_SaveStation_1 
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero 
    dw InstList_PLM_SaveStation_1 
    dw Instruction_PLM_DisplayGameSavedMessageBox 

InstList_PLM_SaveStation_2:
    dw Instruction_PLM_EnableMovement_SetSaveStationUsed 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_SaveStation_0 

Instruction_PLM_PlaceSamusOnSaveStation:
    LDA.W $0AF6 : CLC : ADC.W #$0008 : AND.W #$FFF0 
    STA.W $0AF6 
    PHX 
    PHY 
    JSL.L MakeSamusFaceForward 
    PLY 
    PLX 
    RTS 


Instruction_PLM_DisplayGameSavedMessageBox:
    PHX 
    PHY 
    LDA.W #$0018 
    JSL.L MessageBox_Routine 
    PLY 
    PLX 
    RTS 


Instruction_PLM_EnableMovement_SetSaveStationUsed:
    LDA.W #$0001 
    JSL.L Run_Samus_Command 
    LDA.W #$0001 : STA.W $1E75 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_PLM_Draw13BlankAirTiles_84B03E:
    dw $0001,UNUSED_DrawInst_Draw13BlankAirTiles_849ACF 
    dw Instruction_PLM_Delete 

UNUSED_InstList_PLM_Draw13BlankSolidTiles_84B044:
    dw $0001,UNUSED_DrawInst_Draw13BlankSolidTiles_849AED 
    dw Instruction_PLM_Delete 
endif ; !FEATURE_KEEP_UNREFERENCED

Setup_WreckedShipEntranceTreadmill:
    LDX.W $1C87,Y 
    LDA.W #$00FF 
    LDY.W #$0038 

.loop:
    STA.L $7F0002,X 
    INX #2
    DEY 
    BNE .loop 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_LoadFXEntry_CompletelyBroken_84B05D:
    PHB 
    PHA 
    PEA.W $8F00 
    PLB 
    PLB 
    ASL #4
    TAX 
    CMP.W $1968 
    BEQ .return 
    LDA.W $197C 
    BEQ .loadFXEntry 
    LDA.W $1978 
    BMI .loadFXEntry 
    TYA 
    CLC : ADC.W $07CD : TAX 
    CMP.W $0002,X 
    PLA 
    PLB 
    BCC .return 

.loadFXEntry:
    JSL.L Load_FX_Entry 

.return:
    CLC 
    RTS 


UNUSED_LoadFXEntry0IfPLMIsInLeftmostScreenColumn_84B08B:
    LDX.W $1C27 
    JSL.L Calculate_PLM_Block_Coordinates 
    LDA.W $0AF6 
    LSR #4
    CMP.W $1C29 
    BNE .return 
    LDA.W #$0000 
    JMP.W UNUSED_LoadFXEntry_CompletelyBroken_84B05D 


.return:
    CLC 
    RTS 


UNUSED_LoadFXEntry1IfPLMIsInLeftmostScreenColumn_84B0A6:
    LDX.W $1C27 
    JSL.L Calculate_PLM_Block_Coordinates 
    LDA.W $0AF6 
    LSR #4
    CMP.W $1C29 
    BNE .return 
    LDA.W #$0001 
    JMP.W UNUSED_LoadFXEntry_CompletelyBroken_84B05D 


.return:
    CLC 
    RTS 


UNUSED_LoadFXEntry2IfPLMIsInLeftmostScreenColumn_84B0C1:
    LDX.W $1C27 
    JSL.L Calculate_PLM_Block_Coordinates 
    LDA.W $0AF6 
    LSR #4
    CMP.W $1C29 
    BNE .return 
    LDA.W #$0002 
    JMP.W UNUSED_LoadFXEntry_CompletelyBroken_84B05D 


.return:
    CLC 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Setup_BrinstarFloorPlant:
    LDA.W $0AFA : CLC : ADC.W $0B00 : DEC A 
    AND.W #$000F 
    CMP.W #$000F 
    BEQ .deactivate 
    LDA.W #$0000 : STA.W $1C37,Y 
    CLC 
    RTS 


.deactivate:
    LDX.W $1C87,Y 
    LDA.L $7F0002,X : AND.W #$8FFF : STA.L $7F0002,X 
    TYX 
    LDA.W $0AF6 : STA.W $1E17,X 
    LDA.W $0AFA 
    DEC A 
    STA.L $7EDF0C,X 
    CLC 
    RTS 


Setup_BrinstarCeilingPlant:
    LDA.W $0AFA : SEC : SBC.W $0B00 : AND.W #$000F 
    BEQ .deactivate 
    LDA.W #$0000 : STA.W $1C37,Y 
    CLC 
    RTS 


.deactivate:
    LDX.W $1C87,Y 
    LDA.L $7F0002,X : AND.W #$8FFF : STA.L $7F0002,X 
    TYX 
    LDA.W $0AF6 : STA.W $1E17,X 
    LDA.W $0AFA 
    INC A 
    STA.L $7EDF0C,X 
    CLC 
    RTS 


ActivateStationIfSamusArmCannonLinedUp:
    LDX.W #$004E 

.loop:
    CMP.W $1C87,X 
    BEQ .found 
    DEX #2
    BPL .loop 
    BRA .delete 


.found:
    PHX 
    LDX.W $1C27 
    JSL.L Calculate_PLM_Block_Coordinates 
    PLX 
    LDA.W $1C2B 
    ASL #4
    ORA.W #$000B 
    CMP.W $0AFA 
    BNE .delete 
    LDA.L $7EDEBC,X : STA.W $1D27,X 
    LDA.W #$0001 : STA.L $7EDE1C,X 
    LDA.W #$0006 
    JSL.L Run_Samus_Command 
    SEC 
    RTS 


.delete:
    LDA.W #$0000 : STA.W $1C37,Y 
    SEC 
    RTS 


Setup_MapStation:
    LDX.W $1C87,Y 
    LDA.L $7F0002,X 
    AND.W #$0FFF 
    ORA.W #$8000 
    STA.L $7F0002,X 
    LDX.W $079F 
    LDA.L $7ED908,X 
    AND.W #$00FF 
    BNE .setInstruction 
    LDX.W $1C87,Y 
    INX #2
    LDA.W #$B047 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    LDX.W $1C87,Y 
    DEX #4
    LDA.W #$B048 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    RTS 


.setInstruction:
    LDA.W #InstList_PLM_MapStation_2 : STA.W $1D27,Y 
    RTS 


Setup_MapStationRightAccess:
    LDA.W $0B02 
    AND.W #$000F 
    BNE .connected 
    LDA.W $0A1C 
    CMP.W #$008A 
    BNE .connected 
    LDA.W $0A1E 
    AND.W #$0004 
    BEQ .connected 
    LDA.W $1C87,Y 
    DEC #2
    JMP.W ActivateStationIfSamusArmCannonLinedUp 


.connected:
    LDA.W #$0000 : STA.W $1C37,Y 
    SEC 
    RTS 


Setup_MapStationLeftAccess:
    LDA.W $0B02 
    AND.W #$000F 
    CMP.W #$0001 
    BNE .connected 
    LDA.W $0A1C 
    CMP.W #$0089 
    BNE .connected 
    LDA.W $0A1E 
    AND.W #$0008 
    BEQ .connected 
    LDA.W $1C87,Y 
    INC #4
    JMP.W ActivateStationIfSamusArmCannonLinedUp 


.connected:
    LDA.W #$0000 : STA.W $1C37,Y 
    SEC 
    RTS 


Setup_EnergyStation:
    LDX.W $1C87,Y 
    LDA.L $7F0002,X 
    AND.W #$0FFF 
    ORA.W #$8000 
    STA.L $7F0002,X 
    LDX.W $1C87,Y 
    INX #2
    LDA.W #$B049 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    LDX.W $1C87,Y 
    DEX #2
    LDA.W #$B04A 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    RTS 


Setup_MissileStation:
    LDX.W $1C87,Y 
    LDA.L $7F0002,X 
    AND.W #$0FFF 
    ORA.W #$8000 
    STA.L $7F0002,X 
    LDX.W $1C87,Y 
    INX #2
    LDA.W #$B04B 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    LDX.W $1C87,Y 
    DEX #2
    LDA.W #$B04C 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    RTS 


Setup_EnergyStationRightAccess:
    LDA.W $0B02 
    AND.W #$000F 
    BNE .connected 
    LDA.W $0A1C 
    CMP.W #$008A 
    BNE .connected 
    LDA.W $0A1E 
    AND.W #$0004 
    BEQ .connected 
    LDA.W $09C2 
    CMP.W $09C4 
    BEQ .connected 
    LDA.W $1C87,Y 
    DEC #2
    JMP.W ActivateStationIfSamusArmCannonLinedUp 


.connected:
    LDA.W #$0000 : STA.W $1C37,Y 
    SEC 
    RTS 


Setup_EnergyStationLeftAccess:
    LDA.W $0B02 
    AND.W #$000F 
    CMP.W #$0001 
    BNE .connected 
    LDA.W $0A1C 
    CMP.W #$0089 
    BNE .connected 
    LDA.W $0A1E 
    AND.W #$0008 
    BEQ .connected 
    LDA.W $09C2 
    CMP.W $09C4 
    BEQ .connected 
    LDA.W $1C87,Y 
    INC #2
    JMP.W ActivateStationIfSamusArmCannonLinedUp 


.connected:
    LDA.W #$0000 : STA.W $1C37,Y 
    SEC 
    RTS 


Setup_MissileStationRightAccess:
    LDA.W $0B02 
    AND.W #$000F 
    BNE .connected 
    LDA.W $0A1C 
    CMP.W #$008A 
    BNE .connected 
    LDA.W $0A1E 
    AND.W #$0004 
    BEQ .connected 
    LDA.W $09C6 
    CMP.W $09C8 
    BEQ .connected 
    LDA.W $1C87,Y 
    DEC #2
    JMP.W ActivateStationIfSamusArmCannonLinedUp 


.connected:
    LDA.W #$0000 : STA.W $1C37,Y 
    SEC 
    RTS 


Setup_MissileStationLeftAccess:
    LDA.W $0B02 
    AND.W #$000F 
    CMP.W #$0001 
    BNE .connected 
    LDA.W $0A1C 
    CMP.W #$0089 
    BNE .connected 
    LDA.W $0A1E 
    AND.W #$0008 
    BEQ .connected 
    LDA.W $09C6 
    CMP.W $09C8 
    BEQ .connected 
    LDA.W $1C87,Y 
    INC #2
    JMP.W ActivateStationIfSamusArmCannonLinedUp 


.connected:
    LDA.W #$0000 : STA.W $1C37,Y 
    SEC 
    RTS 


DeletePLM:
    LDA.W #$0000 : STA.W $1C37,Y 
    RTS 


Setup_RightwardsExtension:
    LDX.W $1C87,Y 
    LDA.W #$50FF 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    BRA DeletePLM 


Setup_LeftwardsExtension:
    LDX.W $1C87,Y 
    LDA.W #$5001 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    BRA DeletePLM 


Setup_DownwardsExtension:
    LDX.W $1C87,Y 
    LDA.W #$D0FF 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    BRA DeletePLM 


Setup_UpwardsExtension:
    LDX.W $1C87,Y 
    LDA.W #$D001 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    BRA DeletePLM 


Skip_Debug_DrawInstruction_for_ScrollPLM:
    LDA.W $1D27,Y : CLC : ADC.W #$0004 : STA.W $1D27,Y 
    RTS 


Setup_ScrollPLM:
    LDX.W $1C87,Y 
    LDA.W #$3046 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    LDA.W #$0000 : STA.W $1E17,Y 
    BRA Skip_Debug_DrawInstruction_for_ScrollPLM 


Setup_SolidScrollPLM:
    LDX.W $1C87,Y 
    LDA.W #$B046 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    LDA.W #$0000 : STA.W $1E17,Y 
    BRA Skip_Debug_DrawInstruction_for_ScrollPLM 


Setup_ScrollBlockTouchPLM:
    TYX 
    LDA.W $1C87,X 
    STZ.W $1C87,X 
    LDX.W #$004E 

.loop:
    CMP.W $1C87,X 
    BEQ .found 
    DEX #2
    BPL .loop 

.crash:
    BRA .crash 


.found:
    LDA.W $1E17,X 
    BMI .return 
    LDA.W #$8000 : STA.W $1E17,X 
    INC.W $1D27,X 
    INC.W $1D27,X 
    LDA.W #$0001 : STA.L $7EDE1C,X 

.return:
    RTS 


Setup_DeactivatePLM:
    LDX.W $1C87,Y 
    LDA.L $7F0002,X : AND.W #$8FFF : STA.L $7F0002,X ; fallthrough to RTS_84B3CF

RTS_84B3CF:
    RTS 


Setup_ClearCarry:
    CLC 
    RTS 


Setup_SetCarry:
    SEC 
    RTS 


Setup_EnemyBreakableBlock:
    LDX.W $1C87,Y 
    LDA.L $7F0002,X : AND.W #$0FFF : STA.L $7F0002,X 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Setup_TorizoDrool_84B3E3:
    LDY.W #UNUSED_EnemyProjectile_BombTorizo_86A977 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Setup_IcePhysics:
    LDA.W $0AFA : CLC : ADC.W $0B00 : DEC A 
    AND.W #$000F 
    CMP.W #$0007 
    BEQ .decel 
    CMP.W #$000F 
    BNE .return 

.decel:
    LDA.W #$0010 : STA.W $0B4C 

.return:
    CLC 
    RTS 


Setup_QuicksandSurface:
    STZ.W $0B3C 
    STZ.W $0B3E 
    STZ.W $0B40 
    STZ.W $0B44 
    STZ.W $0B42 
    LDA.W #$8000 
    TRB.W $0B48 
    STZ.W $0B46 
    LDY.W #$0000 
    LDA.W $09A2 
    BIT.W #$0020 
    BEQ + 
    LDY.W #$0002 

  + LDA.W $1E73 
    BNE InsideReaction_QuicksandSurface_SamusIsGrounded_return 
    LDA.W $0B36 
    AND.W #$0003 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    RTS 


.pointers:
    dw InsideReaction_QuicksandSurface_SamusIsGrounded 
    dw InsideReaction_QuicksandSurface_SamusIsMovingUp 
    dw InsideReaction_QuicksandSurface_SamusIsMovingDown 
    dw InsideReaction_QuicksandSurface_SamusIsGrounded 

InsideReaction_QuicksandSurface_SamusIsGrounded:
    STZ.W $0B2C 
    STZ.W $0B2E 
    STZ.W $0B5A 
    STZ.W $0B5C 
    LDA.W QuicksandSurface_InsideReaction_distanceOnGround,Y : STA.W $0B5B 

  .return
    RTS 


InsideReaction_QuicksandSurface_SamusIsMovingUp:
    LDA.W QuicksandSurface_InsideReaction_maxVelocity,Y 
    CMP.W $0B2D 
    BCS + 
    STZ.W $0B2C 
    STZ.W $0B2E 
    LDA.W QuicksandSurface_InsideReaction_maxVelocity,Y : STA.W $0B2D 

  + STZ.W $0B5A 
    STZ.W $0B5C 
    LDA.W QuicksandSurface_InsideReaction_distanceInAir,Y : STA.W $0B5B 
    RTS 


InsideReaction_QuicksandSurface_SamusIsMovingDown:
    STZ.W $0B5A 
    STZ.W $0B5C 
    LDA.W QuicksandSurface_InsideReaction_distanceInAir,Y : STA.W $0B5B 
    STZ.W $0AF4 
    RTS 


QuicksandSurface_InsideReaction:
;        _________ Without gravity suit
;       |      ___ With gravity suit
;       |     |
  .distanceInAir:
    dw $0200,$0200 
  .distanceOnGround:
    dw $0120,$0100 
  .maxVelocity:
    dw $0280,$0380 


Setup_Inside_SubmergingQuicksand:
    STZ.W $0AF4 
    LDA.W #$2000 : STA.W $0B5A 
    LDA.W #$0001 : STA.W $0B5C 
    CLC 
    RTS 


Setup_SandfallsSlow:
    LDA.W #$4000 : STA.W $0B5A 
    LDA.W #$0001 : STA.W $0B5C 
    CLC 
    RTS 


Setup_SandfallsFast:
    LDA.W #$C000 : STA.W $0B5A 
    LDA.W #$0001 : STA.W $0B5C 
    CLC 
    RTS 


Setup_QuicksandSurface_BTS85:
    LDA.W $0B02 
    AND.W #$0002 
    BNE .vertical 
    CLC 
    RTS 


.vertical:
    LDY.W #$0000 
    LDA.W $09A2 
    BIT.W #$0020 
    BEQ + 
    LDY.W #$0002 

  + LDX.B $12 
    LDA.B $14 : STA.B $12 
    STX.B $14 
    LDA.W $0B36 
    AND.W #$0003 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    LDX.B $12 
    LDA.B $14 : STA.B $12 
    STX.B $14 
    RTS 


.pointers:
    dw CollisionReaction_QuicksandSurface_SamusIsGrounded 
    dw ClearCarry_84B528 
    dw CollisionReaction_QuicksandSurface_SamusIsMovingDown 
    dw CollisionReaction_QuicksandSurface_SamusIsGrounded 

CollisionReaction_QuicksandSurface_SamusIsGrounded:
    LDA.W $0B02 
    AND.W #$000F 
    CMP.W #$0002 
    BEQ .noCollision 
    CMP.W #$0003 
    BEQ .up 
    BRA .noCollision 


.up:
    LDA.W $0A6E 
    CMP.W #$0001 
    BEQ CollisionReaction_QuicksandSurface_QuicksandSpeedBoosting 
    LDA.W QuicksandSurface_MaxSinkingSpeed,Y 
    CMP.B $13 
    BCS + 
    STA.B $13 

  + INC.W $1E71 

.noCollision:
    CLC 
    RTS 


ClearCarry_84B528:
    CLC 
    RTS 


CollisionReaction_QuicksandSurface_SamusIsMovingDown:
    LDA.W $0A6E 
    CMP.W #$0001 
    BEQ CollisionReaction_QuicksandSurface_QuicksandSpeedBoosting 
    INC.W $1E71 
    CLC 
    RTS 


CollisionReaction_QuicksandSurface_QuicksandSpeedBoosting:
    STZ.B $12 
    STZ.B $14 
    SEC 
    RTS 


QuicksandSurface_MaxSinkingSpeed:
;        _________ Without gravity suit
;       |      ___ With gravity suit
;       |     |
    dw $0030,$0030 

Setup_Collision_SubmergingQuicksand:
    STZ.W $0B2C 
    STZ.W $0B2E 
    STZ.W $0B32 
    STZ.W $0B34 
    CLC 
    RTS 


Setup_CollisionReaction_SandFalls:
    CLC 
    RTS 


Setup_ClearBabyMetroidInvisibleWall:
    LDX.W $1C87,Y 
    LDY.W #$000A 

.loop:
    LDA.L $7F0002,X : AND.W #$0FFF : STA.L $7F0002,X 
    TXA 
    CLC : ADC.W $07A5 : ADC.W $07A5 : TAX 
    DEY 
    BNE .loop 
    RTS 


CreateBabyMetroidInvisibleWall:
    LDX.W $1C87,Y 
    LDY.W #$000A 

.loop:
    LDA.L $7F0002,X 
    AND.W #$0FFF 
    ORA.W #$8000 
    STA.L $7F0002,X 
    TXA 
    CLC : ADC.W $07A5 : ADC.W $07A5 : TAX 
    DEY 
    BNE .loop 
    RTS 


Setup_CollisionReaction_SaveStationTrigger:
    LDA.W $0592 
    BNE .collisionReturn 
    LDA.W $0A1C 
    CMP.W #$0001 
    BEQ .standing 
    CMP.W #$0002 
    BNE .collisionReturn 

.standing:
    LDA.W $1E75 
    BNE .collisionReturn 
    LDA.W $0B02 
    AND.W #$000F 
    CMP.W #$0003 
    BNE .collisionReturn 
    TYX 
    JSL.L Calculate_PLM_Block_Coordinates 
    LDA.W $0AF6 : SEC : SBC.W #$0008 : LSR #4
    CMP.W $1C29 
    BNE .collisionReturn 
    TYX 
    LDA.W $1C87,X 
    STZ.W $1C87,X 
    STZ.W $1C37,X 
    LDX.W #$004E 

.loop:
    CMP.W $1C87,X 
    BEQ .found 
    DEX #2
    BPL .loop 
    SEC 
    RTS 


.found:
    INC.W $1D27,X 
    INC.W $1D27,X 
    LDA.W #$0001 : STA.L $7EDE1C,X 

.collisionReturn:
    SEC 
    RTS 


Setup_SaveStation:
    LDX.W $1C87,Y 
    LDA.W #$B04D 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    RTS 


Setup_MotherBrainsRoomEscapeDoor:
    LDX.W $1C87,Y 
    LDA.W #$9001 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    TXA 
    CLC : ADC.W $07A5 : ADC.W $07A5 : TAX 
    LDA.W #$D0FF 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    TXA 
    CLC : ADC.W $07A5 : ADC.W $07A5 : TAX 
    LDA.W #$D0FF 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    TXA 
    CLC : ADC.W $07A5 : ADC.W $07A5 : TAX 
    LDA.W #$D0FF 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    RTS 


PLMEntries_nothing:
    dw RTS_84B3CF 
    dw InstList_PLM_Delete 

PLMEntries_collisionReactionClearCarry:
    dw Setup_ClearCarry 
    dw InstList_PLM_Delete 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_PLMEntries_84B637:
    dw Setup_SetCarry 
    dw InstList_PLM_Delete 
endif ; !FEATURE_KEEP_UNREFERENCED

PLMEntries_rightwardsExtension:
    dw Setup_RightwardsExtension 
    dw InstList_PLM_Debug_RightwardsExtension 

PLMEntries_leftwardsExtension:
    dw Setup_LeftwardsExtension 
    dw InstList_PLM_Debug_LeftwardsExtension 

PLMEntries_downwardsExtension:
    dw Setup_DownwardsExtension 
    dw InstList_PLM_Debug_DownwardsExtension 

PLMEntries_upwardsExtension:
    dw Setup_UpwardsExtension 
    dw InstList_PLM_Debug_UpwardsExtension 

PLMEntries_wreckedShipEntranceTreadmillFromWest:
    dw Setup_WreckedShipEntranceTreadmill 
    dw InstList_PLM_WreckedShipEntranceTreadmillFromWest_0 

PLMEntries_wreckedShipEntranceTreadmillFromEast:
    dw Setup_WreckedShipEntranceTreadmill 
    dw InstList_PLM_WreckedShipEntranceTreadmillFromEast_0 

PLMEntries_insideReactionNothing_B653:
    dw RTS_84B3CF 
    dw InstList_PLM_Delete 

PLMEntries_insideReactionNothing_B657:
    dw RTS_84B3CF 
    dw InstList_PLM_Delete 

PLMEntries_insideReactionNothing_B65B:
    dw RTS_84B3CF 
    dw InstList_PLM_Delete 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_PLMEntries_84B65F:
    dw Setup_DeactivatePLM 
    dw UNUSED_InstList_PLM_84ABE3 

UNUSED_PLMEntries_84B663:
    dw Setup_DeactivatePLM 
    dw UNUSED_InstList_PLM_84ABE9 

UNUSED_PLMEntries_84B667:
    dw Setup_DeactivatePLM 
    dw UNUSED_InstList_PLM_84ABEF_0 

UNUSED_PLMEntries_84B66B:
    dw Setup_DeactivatePLM 
    dw UNUSED_InstList_PLM_84ABF9 

UNUSED_PLMEntries_84B66F:
    dw Setup_DeactivatePLM 
    dw UNUSED_PLM_InstList_84ABFF 
endif ; !FEATURE_KEEP_UNREFERENCED

PLMEntries_fillMotherBrainsWall:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_FillMotherBrainsWall 

PLMEntries_motherBrainsRoomEscapeDoor:
    dw Setup_MotherBrainsRoomEscapeDoor 
    dw InstList_PLM_MotherBrainsRoomEscapeDoor 

PLMEntries_motherBrainsBackgroundRow2:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_MotherBrainsBackgroundRow2 

PLMEntries_motherBrainsBackgroundRow3:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_MotherBrainsBackgroundRow3 

PLMEntries_motherBrainsBackgroundRow4:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_MotherBrainsBackgroundRow4 

PLMEntries_motherBrainsBackgroundRow5:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_MotherBrainsBackgroundRow5 

PLMEntries_motherBrainsBackgroundRow6:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_MotherBrainsBackgroundRow6 

PLMEntries_motherBrainsBackgroundRow7:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_MotherBrainsBackgroundRow7 

PLMEntries_motherBrainsBackgroundRow8:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_MotherBrainsBackgroundRow8 

PLMEntries_motherBrainsBackgroundRow9:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_MotherBrainsBackgroundRow9 

PLMEntries_motherBrainsBackgroundRowA:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_MotherBrainsBackgroundRowA 

PLMEntries_motherBrainsBackgroundRowB:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_MotherBrainsBackgroundRowB 

PLMEntries_motherBrainsBackgroundRowC:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_MotherBrainsBackgroundRowC 

PLMEntries_motherBrainsBackgroundRowD:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_MotherBrainsBackgroundRowD 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_PLMEntries_84B6AB:
    dw Setup_DeactivatePLM 
    dw UNUSED_InstList_PLM_84AC59 

UNUSED_PLMEntries_84B6AF:
    dw Setup_DeactivatePLM 
    dw UNUSED_InstList_PLM_84AC5F 
endif ; !FEATURE_KEEP_UNREFERENCED

PLMEntries_clearCeilingBlockInMotherBrainsRoom:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_ClearCeilingBlockInMotherBrainsRoom 

PLMEntries_clearCeilingTubeInMotherBrainsRoom:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_ClearCeilingTubeInMotherBrainsRoom 

PLMEntries_clearMotherBrainsBottomMiddleSideTube:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_ClearMotherBrainsBottomMiddleSideTube 

PLMEntries_clearMotherBrainsBottomMiddleTubes:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_ClearMotherBrainsBottomMiddleTubes 

PLMEntries_clearMotherBrainsBottomLeftTube:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_ClearMotherBrainsBottomLeftTube 

PLMEntries_clearMotherBrainsBottomRightTube:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_ClearMotherBrainsBottomRightTube 

PLMEntries_insideReactionBrinstarFloorPlant:
    dw Setup_BrinstarFloorPlant 
    dw InstList_PLM_BrinstarFloorPlant_0 

PLMEntries_insideReactionBrinstarCeilingPlant:
    dw Setup_BrinstarCeilingPlant 
    dw InstList_PLM_BrinstarCeilingPlant_0 

PLMEntries_mapStation:
    dw Setup_MapStation 
    dw InstList_PLM_MapStation_0 

PLMEntries_mapStationRightAccess:
    dw Setup_MapStationRightAccess 
    dw InstList_PLM_MapStationRightAccess 

PLMEntries_mapStationLeftAccess:
    dw Setup_MapStationLeftAccess 
    dw InstList_PLM_MapStationLeftAccess 

PLMEntries_energyStation:
    dw Setup_EnergyStation 
    dw InstList_PLM_EnergyStation_0 

PLMEntries_energyStationRightAccess:
    dw Setup_EnergyStationRightAccess 
    dw InstList_PLM_EnergyStationRightAccess_0 

PLMEntries_energyStationLeftAccess:
    dw Setup_EnergyStationLeftAccess 
    dw InstList_PLM_EnergyStationLeftAccess_0 

PLMEntries_missileStation:
    dw Setup_MissileStation 
    dw InstList_PLM_MissileStation_0 

PLMEntries_missileStationRightAccess:
    dw Setup_MissileStationRightAccess 
    dw InstList_PLM_MissileStationRightAccess_0 

PLMEntries_missileStationLeftAccess:
    dw Setup_MissileStationLeftAccess 
    dw InstList_PLM_MissileStationLeftAccess_0 

if !FEATURE_KEEP_UNREFERENCED
PLMEntries_nothing_84B6F7:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_Nothing_84AED6 

PLMEntries_nothing_84B6FB:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_Nothing_84AF1C 
endif ; !FEATURE_KEEP_UNREFERENCED

PLMEntries_scrollPLMTrigger:
    dw Setup_ScrollBlockTouchPLM 
    dw InstList_PLM_Delete 

PLMEntries_ScrollPLM:
    dw Setup_ScrollPLM 
    dw InstList_PLM_ScrollPLM_0 

if !FEATURE_KEEP_UNREFERENCED
PLMEntries_unusedSolidScrollPLM:
    dw Setup_SolidScrollPLM 
    dw InstList_PLM_SolidScrollPLM_0 
endif ; !FEATURE_KEEP_UNREFERENCED

PLMEntries_elevatorPlatform:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_ElevatorPlatform 

PLMEntries_insideReactionCrateria80:
    dw Setup_IcePhysics 
    dw InstList_PLM_Delete 

PLMEntries_insideReactionQuicksandSurface:
    dw Setup_QuicksandSurface 
    dw InstList_PLM_Delete 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_PLMEntries_84B717:
    dw Setup_QuicksandSurface 
    dw InstList_PLM_Delete 

UNUSED_PLMEntries_84B71B:
    dw Setup_QuicksandSurface 
    dw InstList_PLM_Delete 
endif ; !FEATURE_KEEP_UNREFERENCED

PLMEntries_insideReactionSubmergingQuicksand:
    dw Setup_Inside_SubmergingQuicksand 
    dw InstList_PLM_Delete 

PLMEntries_insideReactionSandFallsSlow:
    dw Setup_SandfallsSlow 
    dw InstList_PLM_Delete 

PLMEntries_insideReactionSandFallsFast:
    dw Setup_SandfallsFast 
    dw InstList_PLM_Delete 

PLMEntries_collisionReactionQuicksandSurface:
    dw Setup_QuicksandSurface_BTS85 
    dw InstList_PLM_Delete 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_PLMEntries_84B72F:
    dw Setup_QuicksandSurface_BTS85 
    dw InstList_PLM_Delete 

UNUSED_PLMEntries_84B733:
    dw Setup_QuicksandSurface_BTS85 
    dw InstList_PLM_Delete 
endif ; !FEATURE_KEEP_UNREFERENCED

PLMEntries_collisionReactionSubmergingQuicksand:
    dw Setup_Collision_SubmergingQuicksand 
    dw InstList_PLM_Delete 

PLMEntries_collisionReactionSandFallsSlow:
    dw Setup_CollisionReaction_SandFalls 
    dw InstList_PLM_Delete 

PLMEntries_collisionReactionSandFallsFast:
    dw Setup_CollisionReaction_SandFalls 
    dw InstList_PLM_Delete 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_PLMEntries_unusedTorizoDrool_84B743:
    dw UNUSED_Setup_TorizoDrool_84B3E3 
    dw InstList_PLM_Delete 
endif ; !FEATURE_KEEP_UNREFERENCED

PLMEntries_clearCrocomiresBridge:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_ClearCrocomiresBridge 

PLMEntries_crumbleABlockOfCrocomiresBridge:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_CrumbleABlockOfCrocomiresBridge 

PLMEntries_clearABlockOfCrocomiresBridge:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_ClearABlockOfCrocomiresBridge 

PLMEntries_clearCrocomireInvisibleWall:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_ClearCrocomiresInvisibleWall 

PLMEntries_createCrocomireInvisibleWall:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_CreateCrocomiresInvisibleWall 

if !FEATURE_KEEP_UNREFERENCED
PLMEntries_unusedDraw13BlankAirTiles:
    dw RTS_84B3CF 
    dw UNUSED_InstList_PLM_Draw13BlankAirTiles_84B03E 

PLMEntries_unusedDraw13BlankSolidTiles:
    dw RTS_84B3CF 
    dw UNUSED_InstList_PLM_Draw13BlankSolidTiles_84B044 
endif ; !FEATURE_KEEP_UNREFERENCED

PLMEntries_clearBabyMetroidInvisibleWall:
    dw Setup_ClearBabyMetroidInvisibleWall 
    dw InstList_PLM_Delete 

PLMEntries_createBabyMetroidInvisibleWall:
    dw CreateBabyMetroidInvisibleWall 
    dw InstList_PLM_Delete 

PLMEntries_saveStationTrigger:
    dw Setup_CollisionReaction_SaveStationTrigger 
    dw InstList_PLM_Delete 

PLMEntries_saveStation:
    dw Setup_SaveStation 
    dw InstList_PLM_SaveStation_0 

PLMEntries_crumbleAccessToTourianElevator:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_CrumbleAccessToTourianElevator_0 

PLMEntries_clearAccessToTourianElevator:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_ClearAccessToTourianElevator 

InstList_drawPhantoonsDoorDuringBossFight:
    dw $0001,DrawInst_DrawPhantoonsDoorDuringBossFight 
    dw Instruction_PLM_Delete 

PLMEntries_drawPhantoonsDoorDuringBossFight:
    dw Setup_DeactivatePLM 
    dw InstList_drawPhantoonsDoorDuringBossFight 

InstList_restorePhantoonsDoorDuringBossFight:
    dw $0001,DrawInst_RestorePhantoonsDoorDuringBossFight 
    dw Instruction_PLM_Delete 

PLMEntries_restorePhantoonsDoorDuringBossFight:
    dw Setup_DeactivatePLM 
    dw InstList_restorePhantoonsDoorDuringBossFight 

PLMEntries_crumbleSporeSpawnCeiling:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_CrumbleSporeSpawnCeiling 

PLMEntries_clearSporeSpawnCeiling:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_ClearSporeSpawnCeiling 

PLMEntries_clearBotwoonWall:
    dw RTS_84AB27 
    dw InstList_PLM_ClearBotwoonWall 

PLMEntries_crumbleBotwoonWall:
    dw Setup_CrumbleBotwoonWall_Wait40Frames 
    dw InstList_PLM_CrumbleBotwoonWall_0 

if !FEATURE_KEEP_UNREFERENCED
PLMEntries_unusedSetKraidCeilingBlockToBackground1:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_SetKraidCeilingBlockToBackground1 
endif ; !FEATURE_KEEP_UNREFERENCED

PLMEntries_crumbleKraidCeilingBlockIntoBackground1:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_CrumbleKraidCeilingBlockIntoBackground1 

PLMEntries_setKraidCeilingBlockToBackground2:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_SetKraidCeilingBlockToBackground2 

PLMEntries_crumbleKraidCeilingBlockIntoBackground2:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_CrumbleKraidCeilingBlockIntoBackground2 

PLMEntries_SetKraidCeilingBlockToBackground3:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_SetKraidCeilingBlockToBackground3 

PLMEntries_crumbleKraidCeilingBlockIntoBackground3:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_CrumbleKraidCeilingBlockIntoBackground3 

PLMEntries_clearKraidCeilingBlocks:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_ClearKraidCeiling 

PLMEntries_clearKraidSpikeBlocks:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_ClearKraidSpikeBlocks 

PLMEntries_crumbleKraidSpikeBlocks:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_CrumbleKraidSpikeBlocks_0 

Setup_EnableSoundsIn20Frames_F0FramesIfCeres:
    LDA.W $079F 
    CMP.W #$0006 
    BNE .ceres 
    LDA.W #$0020 
    BRA + 


.ceres:
    LDA.W #$00F0 

  + STA.W $1D77,Y 
    LDA.W #PreInstruction_PLM_DecTimer_EnableSounds_DeletePLMIfZero : STA.W $1CD7,Y 
    RTS 


PreInstruction_PLM_DecTimer_EnableSounds_DeletePLMIfZero:
    DEC.W $1D77,X 
    BNE .return 
    STZ.W $05F5 
    STZ.W $1C37,X 

.return:
    RTS 


InstList_PLM_EnableSoundsIn20Frames_F0FramesIfCeres:
    dw Instruction_PLM_Sleep 

PLMEntries_enableSoundsIn20Frames_F0FramesIfCeres:
    dw Setup_EnableSoundsIn20Frames_F0FramesIfCeres 
    dw InstList_PLM_EnableSoundsIn20Frames_F0FramesIfCeres 

PreInst_PLM_WakePLM_StartLavaquakeIfSpeedBoosterCollected:
    LDA.W $09A4 
    AND.W #$2000 
    BNE .collectedSpeedBooster 
    LDA.W #$FFFF : STA.W $197A 
    STZ.W $197C 
    STZ.W $1980 
    STZ.W $1840 
    STZ.W $1C37,X 
    RTS 


.collectedSpeedBooster:
    LDA.W $197A 
    BMI .deletePLM 
    LDA.W #$FF80 : STA.W $197C 
    LDA.W #$0001 : STA.L $7EDE1C,X 
    INC.W $1D27,X 
    INC.W $1D27,X 
    STZ.W $1D77,X 
    RTS 


.deletePLM:
    STZ.W $1C37,X 
    RTS 


PreInst_PLM_WakePLM_StartFXMotionIfSamusIsFarEnoughLeft:
    LDA.W #$0AE0 
    CMP.W $0AF6 
    BCC .return 
    LDA.W #$0001 : STA.W $1980 
    STA.L $7EDE1C,X 
    INC.W $1D27,X 
    INC.W $1D27,X 
    STZ.W $1D77,X 

.return:
    RTS 


PreInst_PLM_AdvanceLavaAsSamusMovesLeft_SetLavaquakeEvent:
    LDA.W $1D77,X 
    TAY 
    LDA.W .targetSamusXpos,Y 
    BMI .setLavaquake 
    CMP.W $0AF6 
    BCC .return 
    LDA.W .maxFXYpos,Y 
    CMP.W $1978 
    BCS + 
    STA.W $1978 

  + LDA.W .FXYVelocity,Y : STA.W $197C 
    TYA 
    CLC : ADC.W #$0006 : STA.W $1D77,X 

.return:
    RTS 


.setLavaquake:
    LDA.W #$0015 
    JSL.L MarkEvent_inA 
    RTS 

;        _______________ Target Samus X position
;       |      _________ Maximum FX Y position
;       |     |      ___ FX Y velocity
;       |     |     |
  .targetSamusXpos
    dw $072B 
  .maxFXYpos
    dw       $01BF 
  .FXYVelocity
    dw             $FF50 
    dw $050A,$0167,$FF20
    dw $0244,$0100,$FF20
    dw $8000

InstList_PLM_SpeedBoosterEscape:
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInst_PLM_WakePLM_StartLavaquakeIfSpeedBoosterCollected 
    dw Instruction_PLM_Sleep 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInst_PLM_WakePLM_StartFXMotionIfSamusIsFarEnoughLeft 
    dw Instruction_PLM_Sleep 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInst_PLM_AdvanceLavaAsSamusMovesLeft_SetLavaquakeEvent 
    dw Instruction_PLM_Sleep 

Setup_SpeedBoosterEscape:
    LDA.W #$0015 
    JSL.L CheckIfEvent_inA_HasHappened 
    BCC .return 
    LDA.W #$0000 : STA.W $1C37,Y 

.return:
    RTS 


PLMEntries_SpeedBoosterEscape:
    dw Setup_SpeedBoosterEscape 
    dw InstList_PLM_SpeedBoosterEscape 

PreInstruction_PLM_ShaktoolsRoom:
    LDA.W $0592 
    BEQ .powerBombNotActive 
    LDA.W #$0101 : STA.L $7ECD20 
    LDA.W #$0101 : STA.L $7ECD22 

.powerBombNotActive:
    LDA.W #$0348 
    CMP.W $0AF6 
    BCS .return 
    LDA.W #$000D 
    JSL.L MarkEvent_inA 
    STZ.W $1C37,X 

.return:
    RTS 


InstList_PLM_ShaktoolsRoom:
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_ShaktoolsRoom 
    dw Instruction_PLM_Sleep 

Setup_ShaktoolsRoom:
    LDA.W #$0001 : STA.L $7ECD20 
    LDA.W #$0000 : STA.L $7ECD22 
    RTS 


PLMEntries_shaktoolsRoom:
    dw Setup_ShaktoolsRoom 
    dw InstList_PLM_ShaktoolsRoom 

Setup_MaridiaElevatube:
    RTS 


InstList_PLM_MaridiaElevatube:
    dw $0010,DrawInst_CrumbleKraidCeiling_CrumbleKraidSpikes_Elevatube 
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6 : db $15 
    dw Instruction_PLM_Delete 

PLMEntries_maridiaElevatube:
    dw Setup_MaridiaElevatube 
    dw InstList_PLM_MaridiaElevatube 

WakePLMIfSamusIsBelowRightOfTarget:
    LDA.B $12 
    CMP.W $0AF6 
    BCS .return 
    LDA.B $14 
    CMP.W $0AFA 
    BCS .return 
    INC.W $1D27,X 
    INC.W $1D27,X 
    LDA.W #$0001 : STA.L $7EDE1C,X 

.return:
    RTS 


InstList_PLM_MakeOldTourianEscapeShaftFakeWallExplode:
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_MakeOldTourianEscapeShaftFakeWallExplode 
    dw Instruction_PLM_Sleep 
    dw Instruction_PLM_ClearPreInstruction 
    dw $0001,DrawInst_OldTourianEscapeShaftBlocks 
    dw Instruction_PLM_Delete 

PreInstruction_PLM_MakeOldTourianEscapeShaftFakeWallExplode:
    LDA.W #$00F0 : STA.B $12 
    LDA.W #$0820 : STA.B $14 
    JSR.W WakePLMIfSamusIsBelowRightOfTarget 
    BCS .return 
    PHY 
    LDY.W #EnemyProjectile_OldTourianEscapeShaftFakeWallExplosion 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    PLY 

.return:
    RTS 


InstList_PLM_RaiseAcidInEscapeBeforeOldTourianEscapeShaft:
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInst_PLM_RaiseAcidInEscapeRoomBeforeOldTourianEscapeShaft 
    dw Instruction_PLM_Sleep 
    dw Instruction_PLM_Delete 

PreInst_PLM_RaiseAcidInEscapeRoomBeforeOldTourianEscapeShaft:
    LDA.W #$00F0 : STA.B $12 
    LDA.W #$0540 : STA.B $14 
    JSR.W WakePLMIfSamusIsBelowRightOfTarget 
    BCS .return 
    LDA.W #$FF98 : STA.W $197C 
    LDA.W #$0010 : STA.W $1980 

.return:
    RTS 


PLMEntries_MakeOldTourianEscapeShaftFakeWallExplode:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_MakeOldTourianEscapeShaftFakeWallExplode 

PLMEntries_RaiseAcidInEscapeRoomBeforeOldTourianEscapeShaft:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_RaiseAcidInEscapeBeforeOldTourianEscapeShaft 

Setup_GateBlock:
    STZ.B $26 
    LDA.W #$FFFF : STA.B $28 
    RTS 


PLMEntries_gateBlock:
    dw Setup_GateBlock 
    dw InstList_PLM_Delete 

Setup_Reaction_CrittersEscapeBlock:
    LDX.W $0DDE 
    LDA.W $0C18,X 
    BNE .projectile 
    AND.W #$0F00 
    LDA.W #$0000 : STA.W $1C37,Y 
    RTS 


.projectile:
    LDX.W $1C87,Y 
    LDA.L $7F0002,X 
    AND.W #$F000 
    ORA.W #$009F 
    STA.W $1E17,Y 
    AND.W #$8FFF 
    STA.L $7F0002,X 
    RTS 


InstList_PLM_CrittersEscapeBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6 : db $0A 
    dw $0004,DrawInst_CrittersEscapeBlock_0 
    dw $0004,DrawInst_CrittersEscapeBlock_1 
    dw $0004,DrawInst_CrittersEscapeBlock_2 
    dw $0001,DrawInst_CrittersEscapeBlock_3 
    dw Instruction_PLM_SetCrittersEscapedEvent 
    dw Instruction_PLM_Delete 

Instruction_PLM_SetCrittersEscapedEvent:
    LDA.W #$000F 
    JSL.L MarkEvent_inA 
    RTS 


PLMEntries_Reaction_CrittersEscapeBlock:
    dw Setup_Reaction_CrittersEscapeBlock 
    dw InstList_PLM_CrittersEscapeBlock 

Setup_CrittersEscapeBlock:
    LDX.W $1C87,Y 
    LDA.W #$C04F 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    TXA 
    CLC : ADC.W $07A5 : ADC.W $07A5 : TAX 
    LDA.W #$D0FF 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    TXA 
    CLC : ADC.W $07A5 : ADC.W $07A5 : TAX 
    LDA.W #$D0FF 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    RTS 


PLMEntries_CrittersEscapeBlock:
    dw Setup_CrittersEscapeBlock 
    dw InstList_PLM_Delete 

Setup_TurnCeresElevatorDoorToSolidBlocksDuringEscape:
    LDX.W $1C87,Y 
    LDA.L $7F0002,X 
    AND.W #$0FFF 
    ORA.W #$8000 
    STA.L $7F0002,X 
    TXA 
    CLC : ADC.W $07A5 : ADC.W $07A5 : TAX 
    LDA.L $7F0002,X 
    AND.W #$0FFF 
    ORA.W #$8000 
    STA.L $7F0002,X 
    TXA 
    CLC : ADC.W $07A5 : ADC.W $07A5 : TAX 
    LDA.L $7F0002,X 
    AND.W #$0FFF 
    ORA.W #$8000 
    STA.L $7F0002,X 
    TXA 
    CLC : ADC.W $07A5 : ADC.W $07A5 : TAX 
    LDA.L $7F0002,X 
    AND.W #$0FFF 
    ORA.W #$8000 
    STA.L $7F0002,X 
    RTS 


PLMEntries_turnCeresElevatorDoorToSolidBlocksDuringEscape:
    dw Setup_TurnCeresElevatorDoorToSolidBlocksDuringEscape 
    dw InstList_PLM_Delete 

InstList_PLM_BombTorizoGreyDoor:
    dw $0002,DrawInst_DoorFacingRight_A683 
    dw Instruction_PLM_GotoYIfSamusDoesntHaveBombs 
    dw InstList_PLM_BombTorizoGreyDoor 
    dw $0028,DrawInst_DoorFacingRight_A683 
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $08 
    dw $0002,DrawInst_GreyDoorFacingRight_3 
    dw $0002,DrawInst_GreyDoorFacingRight_2 
    dw $0002,DrawInst_GreyDoorFacingRight_1 
    dw $0001,DrawInst_GreyDoorFacingRight_0 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_BombTorizoGreyDoor_0 

Instruction_PLM_GotoYIfSamusDoesntHaveBombs:
    LDA.W $09A4 
    BIT.W #$1000 
    BEQ .noBombs 
    INY #2
    RTS 


.noBombs:
    LDA.W $0000,Y 
    TAY 
    RTS 


InstList_PLM_BombTorizoGreyDoor_0:
    dw Instruction_PLM_GotoY_ifRoomArg_DoorIsSet 
    dw InstList_PLM_ClosedBlueDoorFacingLeft_41 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_BombTorizoGreyDoor_2 
    dw Instruction_PLM_SetGreyDoorPreInstruction 
    dw $0001,DrawInst_GreyDoorFacingRight_0 

InstList_PLM_BombTorizoGreyDoor_1:
    dw Instruction_PLM_Sleep 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_BombTorizoGreyDoor_1 

InstList_PLM_BombTorizoGreyDoor_2:
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_BombTorizoGreyDoor_4 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfShot 

InstList_PLM_BombTorizoGreyDoor_3:
    dw $0003,DrawInst_DoorFacingRight_A9EF 
    dw $0004,DrawInst_GreyDoorFacingRight_0 
    dw $0003,DrawInst_DoorFacingRight_A9EF 
    dw $0004,DrawInst_GreyDoorFacingRight_0 
    dw $0003,DrawInst_DoorFacingRight_A9EF 
    dw $0004,DrawInst_GreyDoorFacingRight_0 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_BombTorizoGreyDoor_3 

InstList_PLM_BombTorizoGreyDoor_4:
    dw Instruction_PLM_IncDoorHit_SetRoomArgDoor_GotoY : db $01 
    dw InstList_PLM_BombTorizoGreyDoor_5 

InstList_PLM_BombTorizoGreyDoor_5:
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $07 
    dw $0004,DrawInst_GreyDoorFacingRight_1 
    dw $0004,DrawInst_GreyDoorFacingRight_2 
    dw $0004,DrawInst_GreyDoorFacingRight_3 
    dw $0001,DrawInst_DoorFacingRight_A683 
    dw Instruction_PLM_Delete 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Setup_84BAD1:
    LDA.W $1DC8,Y 
    AND.W #$007C 
    LSR A 
    LDA.W #$0004 : STA.W $1E17,Y 
    LDA.W $1DC7,Y 
    AND.W #$83FF 
    ORA.W #$8000 
    STA.W $1DC7,Y 
    LDX.W $1C87,Y 
    LDA.W #$C044 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


PLMEntries_bombTorizoGreyDoor:
    dw Setup_GreyDoor 
    dw InstList_PLM_BombTorizoGreyDoor_0 
    dw InstList_PLM_BombTorizoGreyDoor 

Setup_WreckedShipAttic:
    SEP #$20 
    REP #$20 
    RTS 


InstList_PLM_WreckedShipAttic:
    dw Instruction_PLM_PreInstruction_inY 
    dw Setup_WreckedShipAttic 
    dw Instruction_PLM_Sleep 

PLMEntries_wreckedShipAttic:
    dw Setup_WreckedShipAttic 
    dw InstList_PLM_WreckedShipAttic 

Setup_ClearCrateriaMainstreetEscapePassageIfCrittersEscaped:
    LDA.W #$000F 
    JSL.L CheckIfEvent_inA_HasHappened 
    BCS .return 
    LDA.W #$0000 : STA.W $1C37,Y 

.return:
    RTS 


InstList_PLM_ClearCrateriaMainstreetEscPassageIfCrittersEsc:
    dw $0001,DrawInst_CrateriaMainStreetEscape 
    dw Instruction_PLM_MovePLMRight4Blocks 
    dw $0001,DrawInst_CrateriaMainStreetEscape 
    dw Instruction_PLM_Delete 

Instruction_PLM_MovePLMRight4Blocks:
    LDA.W $1C87,X : CLC : ADC.W #$0008 : STA.W $1C87,X 
    RTS 


PLMEntries_ClearCrateriaMainstreetEscapePassageIfCrittersEsc:
    dw Setup_ClearCrateriaMainstreetEscapePassageIfCrittersEscaped 
    dw InstList_PLM_ClearCrateriaMainstreetEscPassageIfCrittersEsc 

InstList_PLM_GateThatClosesDuringEscapeAfterMotherBrain_0:
    dw $0006,DrawInst_EscapeRoom1Gate_2 
    dw Instruction_PLM_Delete 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_84BB34:
    dw $0006,DrawInst_EscapeRoom1Gate_1 
    dw $005E,DrawInst_EscapeRoom1Gate_0 
    dw Instruction_PLM_Delete 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_PLM_GateThatClosesDuringEscapeAfterMotherBrain_1:
    dw $0002,DrawInst_EscapeRoom1Gate_0 
    dw $0002,DrawInst_EscapeRoom1Gate_1 
    dw $0002,DrawInst_EscapeRoom1Gate_2 
    dw Instruction_PLM_Delete 

PreInstruction_PLM_WakePLMIfTriggered:
    LDA.W $1D77,X 
    BEQ .return 
    INC.W $1D27,X 
    INC.W $1D27,X 
    LDA.W #$0001 : STA.L $7EDE1C,X 
    LDA.W #.return : STA.W $1CD7,X 

.return:
    RTS 


PreInst_PLM_WakePLMIfTriggeredOrSamusWithin4BlockColumnBelow:
    JSL.L Calculate_PLM_Block_Coordinates 
    LDA.W $0AF6 
    LSR #4
    CMP.W $1C29 
    BNE + 
    LDA.W $0AFA 
    LSR #4
    SEC : SBC.W $1C2B : CMP.W #$0005 
    BCC .triggered 

  + LDA.W $1D77,X 
    BEQ .return 

.triggered:
    INC.W $1D27,X 
    INC.W $1D27,X 
    LDA.W #$0001 : STA.L $7EDE1C,X 
    LDA.W #.return : STA.W $1CD7,X 

.return:
    RTS 


PreInst_PLM_WakePLMIfTriggeredOrSamusWithin4BlockColumnAbove:
    JSL.L Calculate_PLM_Block_Coordinates 
    LDA.W $0AF6 
    LSR #4
    CMP.W $1C29 
    BNE + 
    LDA.W $0AFA 
    LSR #4
    SEC : SBC.W $1C2B : CMP.W #$FFFC 
    BCS .triggered 

  + LDA.W $1D77,X 
    BEQ .return 

.triggered:
    INC.W $1D27,X 
    INC.W $1D27,X 
    LDA.W #$0001 : STA.L $7EDE1C,X 
    LDA.W #.return : STA.W $1CD7,X 

.return:
    RTS 


Instruction_PLM_ClearTrigger:
    STZ.W $1D77,X 
    RTS 


Instruction_PLM_SpawnEnemyProjectileY:
    PHX 
    PHY 
    LDA.W $0000,Y 
    TAY 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    PLY 
    PLX 
    INY #2
    RTS 


Instruction_PLM_WakeEnemyProjectileAtPLMsPosition:
    PHX 
    PHY 
    LDA.W $1C87,X 
    LDX.W #$0022 

.loop:
    CMP.W $1AFF,X 
    BEQ .found 
    DEX #2
    BPL .loop 
    db $00 ; BRK with no operand

.found:
    LDA.W #$0001 : STA.W $1B8F,X 
    INC.W $1B47,X 
    INC.W $1B47,X 
    PLY 
    PLX 
    INY #2
    RTS 


InstList_PLM_DownwardsOpenGate:
    dw $0001,DrawInst_DownwardsGateOpen 
    dw Instruction_PLM_ClearTrigger 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_WakePLMIfTriggered 
    dw Instruction_PLM_Sleep 
    dw $0010,DrawInst_DownwardsGateOpen 
    dw Instruction_PLM_SpawnEnemyProjectileY 
    dw EnemyProjectile_SpawnedDownwardsShotGate 
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $0E 
    dw $0010,DrawInst_DownwardsGateOpenClosed_0 
    dw $0010,DrawInst_DownwardsGateOpenClosed_1 
    dw $0010,DrawInst_DownwardsGateOpenClosed_2 
    dw $0018,DrawInst_DownwardsGateOpenClosed_3 

InstList_PLM_DownwardsClosedGate:
    dw $0001,DrawInst_DownwardsGateClosed 
    dw Instruction_PLM_ClearTrigger 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInst_PLM_WakePLMIfTriggeredOrSamusWithin4BlockColumnBelow 
    dw Instruction_PLM_Sleep 
    dw Instruction_PLM_WakeEnemyProjectileAtPLMsPosition,$E566 
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $0E 
    dw $0010,DrawInst_DownwardsGateOpenClosed_3 
    dw $0010,DrawInst_DownwardsGateOpenClosed_2 
    dw $0010,DrawInst_DownwardsGateOpenClosed_1 
    dw $0018,DrawInst_DownwardsGateOpenClosed_0 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_DownwardsOpenGate 

InstList_PLM_UpwardsOpenGate:
    dw $0008,DrawInst_UpwardsGateOpen 
    dw Instruction_PLM_ClearTrigger 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_WakePLMIfTriggered 
    dw Instruction_PLM_Sleep 
    dw $0010,DrawInst_UpwardsGateOpen 
    dw Instruction_PLM_SpawnEnemyProjectileY 
    dw EnemyProjectile_SpawnedUpwardsShotGate 
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $0E 
    dw $0010,DrawInst_UpwardsGateOpenClosed_0 
    dw $0010,DrawInst_UpwardsGateOpenClosed_1 
    dw $0010,DrawInst_UpwardsGateOpenClosed_2 
    dw $0010,DrawInst_UpwardsGateOpenClosed_3 

InstList_PLM_UpwardsClosedGate:
    dw $0008,DrawInst_UpwardsGateClosed 
    dw Instruction_PLM_ClearTrigger 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInst_PLM_WakePLMIfTriggeredOrSamusWithin4BlockColumnAbove 

InstList_PLM_UpwardsClosedGate_sleep:
    dw Instruction_PLM_Sleep 
    dw Instruction_PLM_WakeEnemyProjectileAtPLMsPosition,$E5B0 
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $0E 
    dw $0010,DrawInst_UpwardsGateOpenClosed_3 
    dw $0010,DrawInst_UpwardsGateOpenClosed_2 
    dw $0010,DrawInst_UpwardsGateOpenClosed_1 
    dw $0010,DrawInst_UpwardsGateOpenClosed_0 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_UpwardsOpenGate 

InstList_PLM_DownwardsGateShotblock_BlueLeft:
    dw $0001,DrawInst_GateShotblockDownwardsBlueLeft 
    dw Instruction_PLM_Delete 

InstList_PLM_DownwardsGateShotblock_BlueRight:
    dw $0001,DrawInst_GateShotblockDownwardsBlueRight 
    dw Instruction_PLM_Delete 

InstList_PLM_DownwardsGateShotblock_RedLeft:
    dw $0001,DrawInst_GateShotblockDownwardsRedLeft 
    dw Instruction_PLM_Delete 

InstList_PLM_DownwardsGateShotblock_RedRight:
    dw $0001,DrawInst_GateShotblockDownwardsRedRight 
    dw Instruction_PLM_Delete 

InstList_PLM_DownwardsGateShotblock_GreenLeft:
    dw $0001,DrawInst_GateShotblockDownwardsGreenLeft 
    dw Instruction_PLM_Delete 

InstList_PLM_DownwardsGateShotblock_GreenRight:
    dw $0001,DrawInst_GateShotblockDownwardsGreenRight 
    dw Instruction_PLM_Delete 

InstList_PLM_DownwardsGateShotblock_YellowLeft:
    dw $0001,DrawInst_GateShotblockDownwardsYellowLeft 
    dw Instruction_PLM_Delete 

InstList_PLM_DownwardsGateShotblock_YellowRight:
    dw $0001,DrawInst_GateShotblockDownwardsYellowRight 
    dw Instruction_PLM_Delete 

InstList_PLM_UpwardsGateShotblock_BlueLeft:
    dw $0001,DrawInst_GateShotblockUpwardsBlueLeft 
    dw Instruction_PLM_Delete 

InstList_PLM_UpwardsGateShotblock_BlueRight:
    dw $0001,DrawInst_GateShotblockUpwardsBlueRight 
    dw Instruction_PLM_Delete 

InstList_PLM_UpwardsGateShotblock_RedLeft:
    dw $0001,DrawInst_GateShotblockUpwardsRedLeft 
    dw Instruction_PLM_Delete 

InstList_PLM_UpwardsGateShotblock_RedRight:
    dw $0001,DrawInst_GateShotblockUpwardsRedRight 
    dw Instruction_PLM_Delete 

InstList_PLM_UpwardsGateShotblock_GreenLeft:
    dw $0001,DrawInst_GateShotblockUpwardsGreenLeft 
    dw Instruction_PLM_Delete 

InstList_PLM_UpwardsGateShotblock_GreenRight:
    dw $0001,DrawInst_GateShotblockUpwardsGreenRight 
    dw Instruction_PLM_Delete 

InstList_PLM_UpwardsGateShotblock_YellowLeft:
    dw $0001,DrawInst_GateShotblockUpwardsYellowLeft 
    dw Instruction_PLM_Delete 

InstList_PLM_UpwardsGateShotblock_YellowRight:
    dw $0001,DrawInst_GateShotblockUpwardsYellowRight 
    dw Instruction_PLM_Delete 

PreInstruction_PLM_GotoLinkInstructionIfShot:
    LDA.W $1D77,X 
    BEQ .return 
    STZ.W $1D77,X 
    LDA.L $7EDEBC,X : STA.W $1D27,X 
    LDA.W #$0001 : STA.L $7EDE1C,X 

.return:
    RTS 


PreInstruction_PLM_GotoLinkInstructionIfHitWithPowerBomb:
    LDA.W $1D77,X 
    BEQ .clearPLMShotStatus 
    AND.W #$0F00 
    CMP.W #$0300 
    BNE .playSFX 
    STZ.W $1D77,X 
    LDA.L $7EDEBC,X : STA.W $1D27,X 
    LDA.W #$0001 : STA.L $7EDE1C,X 
    RTS 


.playSFX:
    LDA.W #$0057 
    JSL.L QueueSound_Lib2_Max6 

.clearPLMShotStatus:
    STZ.W $1D77,X 
    RTS 


PreInstruction_PLM_GotoLinkInstructionIfShotWithAMissile:
    LDA.W $1D77,X 
    BEQ .clearPLMShotStatus 
    AND.W #$0F00 
    CMP.W #$0200 
    BEQ .super 
    CMP.W #$0100 
    BNE .dud 

.missile:
    STZ.W $1D77,X 
    LDA.L $7EDEBC,X : STA.W $1D27,X 
    LDA.W #$0001 : STA.L $7EDE1C,X 
    RTS 


.dud:
    LDA.W #$0057 
    JSL.L QueueSound_Lib2_Max6 

.clearPLMShotStatus:
    STZ.W $1D77,X 
    RTS 


.super:
    LDA.W #$0077 : STA.L $7EDF0C,X 
    BRA .missile 


PreInstruction_PLM_GotoLinkInstIfShotWithASuperMissile:
    LDA.W $1D77,X 
    BEQ .clearPLMShotStatus 
    AND.W #$0F00 
    CMP.W #$0200 
    BNE .playSFX 
    STZ.W $1D77,X 
    LDA.L $7EDEBC,X : STA.W $1D27,X 
    LDA.W #$0001 : STA.L $7EDE1C,X 
    RTS 


.playSFX:
    LDA.W #$0057 
    JSL.L QueueSound_Lib2_Max6 

.clearPLMShotStatus:
    STZ.W $1D77,X 
    RTS 


Goto_Link_Instruction:
    STZ.W $1D77,X 
    LDA.L $7EDEBC,X : STA.W $1D27,X 
    LDA.W #$0001 : STA.L $7EDE1C,X 
    RTS 


Play_Dud_Sound:
    LDA.W $1D77,X 
    BEQ .clearPLMShotStatus 
    LDA.W #$0057 
    JSL.L QueueSound_Lib2_Max6 

.clearPLMShotStatus:
    STZ.W $1D77,X 
    RTS 


PreInstruction_PLM_GotoLinkInstructionIfAreaBossDead:
    LDA.W #$0001 
    JSL.L CheckIfBossBitsForCurrentAreaMatchAnyBitsInA 
    BCC .playSFX 
    JMP.W Goto_Link_Instruction 


.playSFX:
    JMP.W Play_Dud_Sound 


PreInstruction_PLM_GotoLinkInstructionIfAreaMiniBossIsDead:
    LDA.W #$0002 
    JSL.L CheckIfBossBitsForCurrentAreaMatchAnyBitsInA 
    BCC .playSFX 
    JMP.W Goto_Link_Instruction 


.playSFX:
    JMP.W Play_Dud_Sound 


PreInstruction_PLM_GotoLinkInstructionIfAreaTorizoIsDead:
    LDA.W #$0004 
    JSL.L CheckIfBossBitsForCurrentAreaMatchAnyBitsInA 
    BCC .playSFX 
    JMP.W Goto_Link_Instruction 


.playSFX:
    JMP.W Play_Dud_Sound 


PreInst_PLM_GotoLinkInst_SetZebesAwakeEventIfEnemiesDead:
    PHY 
    PHX 
    LDA.W $0E50 
    CMP.W $0E52 
    BCC .playSFX 
    LDA.W #$0000 
    JSL.L MarkEvent_inA 
    PLX 
    PLY 
    JMP.W Goto_Link_Instruction 


.playSFX:
    PLX 
    PLY 
    JMP.W Play_Dud_Sound 


PreInstruction_PLM_PlayDudSound:
    JMP.W Play_Dud_Sound 


PreInst_PLM_GotoLinkInstIfTourianStatueFinishedProcessing:
    PHY 
    PHX 
    LDA.W $1E6D 
    BPL .playSFX 
    PLX 
    PLY 
    JMP.W Goto_Link_Instruction 


.playSFX:
    PLX 
    PLY 
    JMP.W Play_Dud_Sound 


PreInstruction_PLM_GotoLinkInstructionIfCrittersEscaped:
    LDA.W #$000F 
    JSL.L CheckIfEvent_inA_HasHappened 
    BCC .playSFX 
    JMP.W Goto_Link_Instruction 


.playSFX:
    JMP.W Play_Dud_Sound 


Instruction_PLM_SetGreyDoorPreInstruction:
    PHY 
    LDY.W $1E17,X 
    LDA.W .pointers,Y : STA.W $1CD7,X 
    PLY 
    RTS 


.pointers:
    dw PreInstruction_PLM_GotoLinkInstructionIfAreaBossDead 
    dw PreInstruction_PLM_GotoLinkInstructionIfAreaMiniBossIsDead 
    dw PreInstruction_PLM_GotoLinkInstructionIfAreaTorizoIsDead 
    dw PreInst_PLM_GotoLinkInst_SetZebesAwakeEventIfEnemiesDead 
    dw PreInstruction_PLM_PlayDudSound 
    dw PreInst_PLM_GotoLinkInstIfTourianStatueFinishedProcessing 
    dw PreInstruction_PLM_GotoLinkInstructionIfCrittersEscaped 

InstList_PLM_GreyDoorFacingLeft_0:
    dw $0002,DrawInst_DoorFacingLeft_A677 
    dw $0002,DrawInst_GreyDoorFacingLeft_3 
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $08 
    dw $0002,DrawInst_GreyDoorFacingLeft_2 
    dw $0002,DrawInst_GreyDoorFacingLeft_1 
    dw $0001,DrawInst_GreyDoorFacingLeft_0 

InstList_PLM_GreyDoorFacingLeft_1:
    dw Instruction_PLM_GotoY_ifRoomArg_DoorIsSet 
    dw InstList_PLM_ClosedBlueDoorFacingLeft_40 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_GreyDoorFacingLeft_3 
    dw Instruction_PLM_SetGreyDoorPreInstruction 
    dw $0001,DrawInst_GreyDoorFacingLeft_0 

InstList_PLM_GreyDoorFacingLeft_2:
    dw Instruction_PLM_Sleep 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_GreyDoorFacingLeft_2 

InstList_PLM_GreyDoorFacingLeft_3:
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_GreyDoorFacingLeft_5 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfShot 

InstList_PLM_GreyDoorFacingLeft_4:
    dw $0003,DrawInst_DoorFacingLeft_A9B3 
    dw $0004,DrawInst_GreyDoorFacingLeft_0 
    dw $0003,DrawInst_DoorFacingLeft_A9B3 
    dw $0004,DrawInst_GreyDoorFacingLeft_0 
    dw $0003,DrawInst_DoorFacingLeft_A9B3 
    dw $0004,DrawInst_GreyDoorFacingLeft_0 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_GreyDoorFacingLeft_4 

InstList_PLM_GreyDoorFacingLeft_5:
    dw Instruction_PLM_IncDoorHit_SetRoomArgDoor_GotoY : db $01 
    dw InstList_PLM_GreyDoorFacingLeft_6 

InstList_PLM_GreyDoorFacingLeft_6:
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $07 
    dw $0004,DrawInst_GreyDoorFacingLeft_1 
    dw $0004,DrawInst_GreyDoorFacingLeft_2 
    dw $0004,DrawInst_GreyDoorFacingLeft_3 
    dw $0001,DrawInst_DoorFacingLeft_A677 
    dw Instruction_PLM_Delete 

InstList_PLM_GreyDoorFacingRight_0:
    dw $0002,DrawInst_DoorFacingRight_A683 
    dw $0002,DrawInst_GreyDoorFacingRight_3 
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $08 
    dw $0002,DrawInst_GreyDoorFacingRight_2 
    dw $0002,DrawInst_GreyDoorFacingRight_1 
    dw $0001,DrawInst_GreyDoorFacingRight_0 

InstList_PLM_GreyDoorFacingRight_1:
    dw Instruction_PLM_GotoY_ifRoomArg_DoorIsSet 
    dw InstList_PLM_ClosedBlueDoorFacingLeft_41 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_GreyDoorFacingRight_3 
    dw Instruction_PLM_SetGreyDoorPreInstruction 
    dw $0001,DrawInst_GreyDoorFacingRight_0 

InstList_PLM_GreyDoorFacingRight_2:
    dw Instruction_PLM_Sleep 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_GreyDoorFacingRight_2 

InstList_PLM_GreyDoorFacingRight_3:
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_GreyDoorFacingRight_5 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfShot 

InstList_PLM_GreyDoorFacingRight_4:
    dw $0003,DrawInst_DoorFacingRight_A9EF 
    dw $0004,DrawInst_GreyDoorFacingRight_0 
    dw $0003,DrawInst_DoorFacingRight_A9EF 
    dw $0004,DrawInst_GreyDoorFacingRight_0 
    dw $0003,DrawInst_DoorFacingRight_A9EF 
    dw $0004,DrawInst_GreyDoorFacingRight_0 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_GreyDoorFacingRight_4 

InstList_PLM_GreyDoorFacingRight_5:
    dw Instruction_PLM_IncDoorHit_SetRoomArgDoor_GotoY : db $01 
    dw InstList_PLM_GreyDoorFacingRight_6 

InstList_PLM_GreyDoorFacingRight_6:
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $07 
    dw $0004,DrawInst_GreyDoorFacingRight_1 
    dw $0004,DrawInst_GreyDoorFacingRight_2 
    dw $0004,DrawInst_GreyDoorFacingRight_3 
    dw $0001,DrawInst_DoorFacingRight_A683 
    dw Instruction_PLM_Delete 

InstList_PLM_GreyDoorFacingUp_0:
    dw $0002,DrawInst_DoorFacingUp_A68F 
    dw $0002,DrawInst_GreyDoorFacingUp_3 
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $08 
    dw $0002,DrawInst_GreyDoorFacingUp_2 
    dw $0002,DrawInst_GreyDoorFacingUp_1 
    dw $0001,DrawInst_GreyDoorFacingUp_0 

InstList_PLM_GreyDoorFacingUp_1:
    dw Instruction_PLM_GotoY_ifRoomArg_DoorIsSet 
    dw InstList_PLM_ClosedBlueDoorFacingUp_42 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_GreyDoorFacingUp_3 
    dw Instruction_PLM_SetGreyDoorPreInstruction 
    dw $0001,DrawInst_GreyDoorFacingUp_0 

InstList_PLM_GreyDoorFacingUp_2:
    dw Instruction_PLM_Sleep 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_GreyDoorFacingUp_2 

InstList_PLM_GreyDoorFacingUp_3:
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_GreyDoorFacingUp_5 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfShot 

InstList_PLM_GreyDoorFacingUp_4:
    dw $0003,DrawInst_DoorFacingUp_AA2B 
    dw $0004,DrawInst_GreyDoorFacingUp_0 
    dw $0003,DrawInst_DoorFacingUp_AA2B 
    dw $0004,DrawInst_GreyDoorFacingUp_0 
    dw $0003,DrawInst_DoorFacingUp_AA2B 
    dw $0004,DrawInst_GreyDoorFacingUp_0 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_GreyDoorFacingUp_4 

InstList_PLM_GreyDoorFacingUp_5:
    dw Instruction_PLM_IncDoorHit_SetRoomArgDoor_GotoY : db $01 
    dw InstList_PLM_GreyDoorFacingUp_6 

InstList_PLM_GreyDoorFacingUp_6:
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $07 
    dw $0004,DrawInst_GreyDoorFacingUp_1 
    dw $0004,DrawInst_GreyDoorFacingUp_2 
    dw $0004,DrawInst_GreyDoorFacingUp_3 
    dw $0001,DrawInst_DoorFacingUp_A68F 
    dw Instruction_PLM_Delete 

InstList_PLM_GreyDoorFacingDown_0:
    dw $0002,DrawInst_DoorFacingDown_A69B 
    dw $0002,DrawInst_GreyDoorFacingDown_3 
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $08 
    dw $0002,DrawInst_GreyDoorFacingDown_2 
    dw $0002,DrawInst_GreyDoorFacingDown_1 
    dw $0001,DrawInst_GreyDoorFacingDown_0 

InstList_PLM_GreyDoorFacingDown_1:
    dw Instruction_PLM_GotoY_ifRoomArg_DoorIsSet 
    dw InstList_PLM_ClosedBlueDoorFacingUp_43 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_GreyDoorFacingDown_3 
    dw Instruction_PLM_SetGreyDoorPreInstruction 
    dw $0001,DrawInst_GreyDoorFacingDown_0 

InstList_PLM_GreyDoorFacingDown_2:
    dw Instruction_PLM_Sleep 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_GreyDoorFacingDown_2 

InstList_PLM_GreyDoorFacingDown_3:
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_GreyDoorFacingDown_5 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfShot 

InstList_PLM_GreyDoorFacingDown_4:
    dw $0003,DrawInst_DoorFacingDown_AA67 
    dw $0004,DrawInst_GreyDoorFacingDown_0 
    dw $0003,DrawInst_DoorFacingDown_AA67 
    dw $0004,DrawInst_GreyDoorFacingDown_0 
    dw $0003,DrawInst_DoorFacingDown_AA67 
    dw $0004,DrawInst_GreyDoorFacingDown_0 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_GreyDoorFacingDown_4 

InstList_PLM_GreyDoorFacingDown_5:
    dw Instruction_PLM_IncDoorHit_SetRoomArgDoor_GotoY : db $01 
    dw InstList_PLM_GreyDoorFacingDown_6 

InstList_PLM_GreyDoorFacingDown_6:
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $07 
    dw $0004,DrawInst_GreyDoorFacingDown_1 
    dw $0004,DrawInst_GreyDoorFacingDown_2 
    dw $0004,DrawInst_GreyDoorFacingDown_3 
    dw $0001,DrawInst_DoorFacingDown_A69B 
    dw Instruction_PLM_Delete 

InstList_PLM_YellowDoorFacingLeft_0:
    dw $0002,DrawInst_DoorFacingLeft_A677 
    dw $0002,DrawInst_YellowDoorFacingLeft_3 
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $08 
    dw $0002,DrawInst_YellowDoorFacingLeft_2 
    dw $0002,DrawInst_YellowDoorFacingLeft_1 
    dw $0001,DrawInst_YellowDoorFacingLeft_0 

InstList_PLM_YellowDoorFacingLeft_1:
    dw Instruction_PLM_GotoY_ifRoomArg_DoorIsSet 
    dw InstList_PLM_ClosedBlueDoorFacingLeft_40 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_YellowDoorFacingLeft_3 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfHitWithPowerBomb 
    dw $0001,DrawInst_YellowDoorFacingLeft_0 

InstList_PLM_YellowDoorFacingLeft_2:
    dw Instruction_PLM_Sleep 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_YellowDoorFacingLeft_2 

InstList_PLM_YellowDoorFacingLeft_3:
    dw Instruction_PLM_IncDoorHit_SetRoomArgDoor_GotoY : db $01 
    dw InstList_PLM_YellowDoorFacingLeft_4 
    dw $0003,DrawInst_DoorFacingLeft_A9B3 
    dw $0004,DrawInst_YellowDoorFacingLeft_0 
    dw $0003,DrawInst_DoorFacingLeft_A9B3 
    dw $0004,DrawInst_YellowDoorFacingLeft_0 
    dw $0003,DrawInst_DoorFacingLeft_A9B3 
    dw $0004,DrawInst_YellowDoorFacingLeft_0 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_YellowDoorFacingLeft_2 

InstList_PLM_YellowDoorFacingLeft_4:
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $07 
    dw $0004,DrawInst_YellowDoorFacingLeft_1 
    dw $0004,DrawInst_YellowDoorFacingLeft_2 
    dw $0004,DrawInst_YellowDoorFacingLeft_3 
    dw $005C,DrawInst_DoorFacingLeft_A677 
    dw Instruction_PLM_Delete 

InstList_PLM_YellowDoorFacingRight_0:
    dw $0002,DrawInst_DoorFacingRight_A683 
    dw $0002,DrawInst_YellowDoorFacingRight_3 
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $08 
    dw $0002,DrawInst_YellowDoorFacingRight_2 
    dw $0002,DrawInst_YellowDoorFacingRight_1 
    dw $0001,DrawInst_YellowDoorFacingRight_0 

InstList_PLM_YellowDoorFacingRight_1:
    dw Instruction_PLM_GotoY_ifRoomArg_DoorIsSet 
    dw InstList_PLM_ClosedBlueDoorFacingLeft_41 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_YellowDoorFacingRight_3 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfHitWithPowerBomb 
    dw $0001,DrawInst_YellowDoorFacingRight_0 

InstList_PLM_YellowDoorFacingRight_2:
    dw Instruction_PLM_Sleep 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_YellowDoorFacingRight_2 

InstList_PLM_YellowDoorFacingRight_3:
    dw Instruction_PLM_IncDoorHit_SetRoomArgDoor_GotoY : db $01 
    dw InstList_PLM_YellowDoorFacingRight_4 
    dw $0003,DrawInst_DoorFacingRight_A9EF 
    dw $0004,DrawInst_YellowDoorFacingRight_0 
    dw $0003,DrawInst_DoorFacingRight_A9EF 
    dw $0004,DrawInst_YellowDoorFacingRight_0 
    dw $0003,DrawInst_DoorFacingRight_A9EF 
    dw $0004,DrawInst_YellowDoorFacingRight_0 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_YellowDoorFacingRight_2 

InstList_PLM_YellowDoorFacingRight_4:
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $07 
    dw $0006,DrawInst_YellowDoorFacingRight_1 
    dw $0006,DrawInst_YellowDoorFacingRight_2 
    dw $0006,DrawInst_YellowDoorFacingRight_3 
    dw $0001,DrawInst_DoorFacingRight_A683 
    dw Instruction_PLM_Delete 

InstList_PLM_YellowDoorFacingUp_0:
    dw $0002,DrawInst_DoorFacingUp_A68F 
    dw $0002,DrawInst_YellowDoorFacingUp_3 
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $08 
    dw $0002,DrawInst_YellowDoorFacingUp_2 
    dw $0002,DrawInst_YellowDoorFacingUp_1 
    dw $0001,DrawInst_YellowDoorFacingUp_0 

InstList_PLM_YellowDoorFacingUp_1:
    dw Instruction_PLM_GotoY_ifRoomArg_DoorIsSet 
    dw InstList_PLM_ClosedBlueDoorFacingUp_42 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_YellowDoorFacingUp_3 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfHitWithPowerBomb 
    dw $0001,DrawInst_YellowDoorFacingUp_0 

InstList_PLM_YellowDoorFacingUp_2:
    dw Instruction_PLM_Sleep 

InstList_PLM_YellowDoorFacingUp_3:
    dw Instruction_PLM_IncDoorHit_SetRoomArgDoor_GotoY : db $01 
    dw InstList_PLM_YellowDoorFacingUp_4 
    dw $0003,DrawInst_DoorFacingUp_AA2B 
    dw $0004,DrawInst_YellowDoorFacingUp_0 
    dw $0003,DrawInst_DoorFacingUp_AA2B 
    dw $0004,DrawInst_YellowDoorFacingUp_0 
    dw $0003,DrawInst_DoorFacingUp_AA2B 
    dw $0004,DrawInst_YellowDoorFacingUp_0 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_YellowDoorFacingUp_2 

InstList_PLM_YellowDoorFacingUp_4:
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $07 
    dw $0006,DrawInst_YellowDoorFacingUp_1 
    dw $0006,DrawInst_YellowDoorFacingUp_2 
    dw $0006,DrawInst_YellowDoorFacingUp_3 
    dw $0001,DrawInst_DoorFacingUp_A68F 
    dw Instruction_PLM_Delete 

InstList_PLM_YellowDoorFacingDown_0:
    dw $0002,DrawInst_DoorFacingDown_A69B 
    dw $0002,DrawInst_YellowDoorFacingDown_3 
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $08 
    dw $0002,DrawInst_YellowDoorFacingDown_2 
    dw $0002,DrawInst_YellowDoorFacingDown_1 
    dw $0001,DrawInst_YellowDoorFacingDown_0 

InstList_PLM_YellowDoorFacingDown_1:
    dw Instruction_PLM_GotoY_ifRoomArg_DoorIsSet 
    dw InstList_PLM_ClosedBlueDoorFacingUp_43 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_YellowDoorFacingDown_3 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfHitWithPowerBomb 
    dw $0002,DrawInst_YellowDoorFacingDown_0 
    dw $0001,DrawInst_YellowDoorFacingDown_0 

InstList_PLM_YellowDoorFacingDown_2:
    dw Instruction_PLM_Sleep 

InstList_PLM_YellowDoorFacingDown_3:
    dw Instruction_PLM_IncDoorHit_SetRoomArgDoor_GotoY : db $01 
    dw InstList_PLM_YellowDoorFacingDown_4 
    dw $0003,DrawInst_DoorFacingDown_AA67 
    dw $0004,DrawInst_YellowDoorFacingDown_0 
    dw $0003,DrawInst_DoorFacingDown_AA67 
    dw $0004,DrawInst_YellowDoorFacingDown_0 
    dw $0003,DrawInst_DoorFacingDown_AA67 
    dw $0004,DrawInst_YellowDoorFacingDown_0 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_YellowDoorFacingDown_2 

InstList_PLM_YellowDoorFacingDown_4:
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $07 
    dw $0006,DrawInst_YellowDoorFacingDown_1 
    dw $0006,DrawInst_YellowDoorFacingDown_2 
    dw $0006,DrawInst_YellowDoorFacingDown_3 
    dw $0001,DrawInst_DoorFacingDown_A69B 
    dw Instruction_PLM_Delete 

InstList_PLM_GreenDoorFacingLeft_0:
    dw $0002,DrawInst_DoorFacingLeft_A677 
    dw $0002,DrawInst_GreenDoorFacingLeft_3 
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $08 
    dw $0002,DrawInst_GreenDoorFacingLeft_2 
    dw $0002,DrawInst_GreenDoorFacingLeft_1 
    dw $0001,DrawInst_GreenDoorFacingLeft_0 

InstList_PLM_GreenDoorFacingLeft_1:
    dw Instruction_PLM_GotoY_ifRoomArg_DoorIsSet 
    dw InstList_PLM_ClosedBlueDoorFacingLeft_40 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_GreenDoorFacingLeft_3 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstIfShotWithASuperMissile 
    dw $0001,DrawInst_GreenDoorFacingLeft_0 

InstList_PLM_GreenDoorFacingLeft_2:
    dw Instruction_PLM_Sleep 

InstList_PLM_GreenDoorFacingLeft_3:
    dw Instruction_PLM_IncDoorHit_SetRoomArgDoor_GotoY : db $01 
    dw InstList_PLM_GreenDoorFacingLeft_4 
    dw $0003,DrawInst_DoorFacingLeft_A9B3 
    dw $0004,DrawInst_GreenDoorFacingLeft_0 
    dw $0003,DrawInst_DoorFacingLeft_A9B3 
    dw $0004,DrawInst_GreenDoorFacingLeft_0 
    dw $0003,DrawInst_DoorFacingLeft_A9B3 
    dw $0004,DrawInst_GreenDoorFacingLeft_0 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_GreenDoorFacingLeft_2 

InstList_PLM_GreenDoorFacingLeft_4:
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $07 
    dw $0006,DrawInst_GreenDoorFacingLeft_1 
    dw $0006,DrawInst_GreenDoorFacingLeft_2 
    dw $0006,DrawInst_GreenDoorFacingLeft_3 
    dw $0001,DrawInst_DoorFacingLeft_A677 
    dw Instruction_PLM_Delete 

InstList_PLM_GreenDoorFacingRight_0:
    dw $0002,DrawInst_DoorFacingRight_A683 
    dw $0002,DrawInst_GreenDoorFacingRight_3 
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $08 
    dw $0002,DrawInst_GreenDoorFacingRight_2 
    dw $0002,DrawInst_GreenDoorFacingRight_1 
    dw $0001,DrawInst_GreenDoorFacingRight_0 

InstList_PLM_GreenDoorFacingRight_1:
    dw Instruction_PLM_GotoY_ifRoomArg_DoorIsSet 
    dw InstList_PLM_ClosedBlueDoorFacingLeft_41 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_GreenDoorFacingRight_3 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstIfShotWithASuperMissile 
    dw $0001,DrawInst_GreenDoorFacingRight_0 

InstList_PLM_GreenDoorFacingRight_2:
    dw Instruction_PLM_Sleep 

InstList_PLM_GreenDoorFacingRight_3:
    dw Instruction_PLM_IncDoorHit_SetRoomArgDoor_GotoY : db $01 
    dw InstList_PLM_GreenDoorFacingRight_4 
    dw $0003,DrawInst_DoorFacingRight_A9EF 
    dw $0004,DrawInst_GreenDoorFacingRight_0 
    dw $0003,DrawInst_DoorFacingRight_A9EF 
    dw $0004,DrawInst_GreenDoorFacingRight_0 
    dw $0003,DrawInst_DoorFacingRight_A9EF 
    dw $0004,DrawInst_GreenDoorFacingRight_0 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_GreenDoorFacingRight_2 

InstList_PLM_GreenDoorFacingRight_4:
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $07 
    dw $0006,DrawInst_GreenDoorFacingRight_1 
    dw $0006,DrawInst_GreenDoorFacingRight_2 
    dw $0006,DrawInst_GreenDoorFacingRight_3 
    dw $0001,DrawInst_DoorFacingRight_A683 
    dw Instruction_PLM_Delete 

InstList_PLM_GreenDoorFacingUp_0:
    dw $0002,DrawInst_DoorFacingUp_A68F 
    dw $0002,DrawInst_GreenDoorFacingUp_3 
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $08 
    dw $0002,DrawInst_GreenDoorFacingUp_2 
    dw $0002,DrawInst_GreenDoorFacingUp_1 
    dw $0001,DrawInst_GreenDoorFacingUp_0 

InstList_PLM_GreenDoorFacingUp_1:
    dw Instruction_PLM_GotoY_ifRoomArg_DoorIsSet 
    dw InstList_PLM_ClosedBlueDoorFacingUp_42 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_GreenDoorFacingUp_3 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstIfShotWithASuperMissile 
    dw $0001,DrawInst_GreenDoorFacingUp_0 

InstList_PLM_GreenDoorFacingUp_2:
    dw Instruction_PLM_Sleep 

InstList_PLM_GreenDoorFacingUp_3:
    dw Instruction_PLM_IncDoorHit_SetRoomArgDoor_GotoY : db $01 
    dw InstList_PLM_GreenDoorFacingUp_4 
    dw $0003,DrawInst_DoorFacingUp_AA2B 
    dw $0004,DrawInst_GreenDoorFacingUp_0 
    dw $0003,DrawInst_DoorFacingUp_AA2B 
    dw $0004,DrawInst_GreenDoorFacingUp_0 
    dw $0003,DrawInst_DoorFacingUp_AA2B 
    dw $0004,DrawInst_GreenDoorFacingUp_0 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_GreenDoorFacingUp_2 

InstList_PLM_GreenDoorFacingUp_4:
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $07 
    dw $0006,DrawInst_GreenDoorFacingUp_1 
    dw $0006,DrawInst_GreenDoorFacingUp_2 
    dw $0006,DrawInst_GreenDoorFacingUp_3 
    dw $0001,DrawInst_DoorFacingUp_A68F 
    dw Instruction_PLM_Delete 

InstList_PLM_GreenDoorFacingDown_0:
    dw $0002,DrawInst_DoorFacingDown_A69B 
    dw $0002,DrawInst_GreenDoorFacingDown_3 
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $08 
    dw $0002,DrawInst_GreenDoorFacingDown_2 
    dw $0002,DrawInst_GreenDoorFacingDown_1 
    dw $0001,DrawInst_GreenDoorFacingDown_0 

InstList_PLM_GreenDoorFacingDown_1:
    dw Instruction_PLM_GotoY_ifRoomArg_DoorIsSet 
    dw InstList_PLM_ClosedBlueDoorFacingUp_43 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_GreenDoorFacingDown_3 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstIfShotWithASuperMissile 
    dw $0001,DrawInst_GreenDoorFacingDown_0 

InstList_PLM_GreenDoorFacingDown_2:
    dw Instruction_PLM_Sleep 

InstList_PLM_GreenDoorFacingDown_3:
    dw Instruction_PLM_IncDoorHit_SetRoomArgDoor_GotoY : db $01 
    dw InstList_PLM_GreenDoorFacingDown_4 
    dw $0003,DrawInst_DoorFacingDown_AA67 
    dw $0004,DrawInst_GreenDoorFacingDown_0 
    dw $0003,DrawInst_DoorFacingDown_AA67 
    dw $0004,DrawInst_GreenDoorFacingDown_0 
    dw $0003,DrawInst_DoorFacingDown_AA67 
    dw $0004,DrawInst_GreenDoorFacingDown_0 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_GreenDoorFacingDown_2 

InstList_PLM_GreenDoorFacingDown_4:
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $07 
    dw $0006,DrawInst_GreenDoorFacingDown_1 
    dw $0006,DrawInst_GreenDoorFacingDown_2 
    dw $0006,DrawInst_GreenDoorFacingDown_3 
    dw $0001,DrawInst_DoorFacingDown_A69B 
    dw Instruction_PLM_Delete 

InstList_PLM_RedDoorFacingLeft_0:
    dw $0002,DrawInst_DoorFacingLeft_A677 
    dw $0002,DrawInst_RedDoorFacingLeft_3 
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $08 
    dw $0002,DrawInst_RedDoorFacingLeft_2 
    dw $0002,DrawInst_RedDoorFacingLeft_1 
    dw $0001,DrawInst_RedDoorFacingLeft_0 

InstList_PLM_RedDoorFacingLeft_1:
    dw Instruction_PLM_GotoY_ifRoomArg_DoorIsSet 
    dw InstList_PLM_ClosedBlueDoorFacingLeft_40 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_RedDoorFacingLeft_3 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfShotWithAMissile 
    dw $0001,DrawInst_RedDoorFacingLeft_0 

InstList_PLM_RedDoorFacingLeft_2:
    dw Instruction_PLM_Sleep 

InstList_PLM_RedDoorFacingLeft_3:
    dw Instruction_PLM_IncDoorHit_SetRoomArgDoor_GotoY : db $05 
    dw InstList_PLM_RedDoorFacingLeft_4 
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $09 
    dw $0003,DrawInst_DoorFacingLeft_A9B3 
    dw $0004,DrawInst_RedDoorFacingLeft_0 
    dw $0003,DrawInst_DoorFacingLeft_A9B3 
    dw $0004,DrawInst_RedDoorFacingLeft_0 
    dw $0003,DrawInst_DoorFacingLeft_A9B3 
    dw $0004,DrawInst_RedDoorFacingLeft_0 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_RedDoorFacingLeft_2 

InstList_PLM_RedDoorFacingLeft_4:
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $07 
    dw $0006,DrawInst_RedDoorFacingLeft_1 
    dw $0006,DrawInst_RedDoorFacingLeft_2 
    dw $0006,DrawInst_RedDoorFacingLeft_3 
    dw $0001,DrawInst_DoorFacingLeft_A677 
    dw Instruction_PLM_Delete 

InstList_PLM_RedDoorFacingRight_0:
    dw $0002,DrawInst_DoorFacingRight_A683 
    dw $0002,DrawInst_RedDoorFacingRight_3 
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $08 
    dw $0002,DrawInst_RedDoorFacingRight_2 
    dw $0002,DrawInst_RedDoorFacingRight_1 
    dw $0001,DrawInst_RedDoorFacingRight_0 

InstList_PLM_RedDoorFacingRight_1:
    dw Instruction_PLM_GotoY_ifRoomArg_DoorIsSet 
    dw InstList_PLM_ClosedBlueDoorFacingLeft_41 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_RedDoorFacingRight_3 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfShotWithAMissile 
    dw $0001,DrawInst_RedDoorFacingRight_0 

InstList_PLM_RedDoorFacingRight_2:
    dw Instruction_PLM_Sleep 

InstList_PLM_RedDoorFacingRight_3:
    dw Instruction_PLM_IncDoorHit_SetRoomArgDoor_GotoY : db $05 
    dw InstList_PLM_RedDoorFacingRight_4 
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $09 
    dw $0003,DrawInst_DoorFacingRight_A9EF 
    dw $0004,DrawInst_RedDoorFacingRight_0 
    dw $0003,DrawInst_DoorFacingRight_A9EF 
    dw $0004,DrawInst_RedDoorFacingRight_0 
    dw $0003,DrawInst_DoorFacingRight_A9EF 
    dw $0004,DrawInst_RedDoorFacingRight_0 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_RedDoorFacingRight_2 

InstList_PLM_RedDoorFacingRight_4:
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $07 
    dw $0006,DrawInst_RedDoorFacingRight_1 
    dw $0006,DrawInst_RedDoorFacingRight_2 
    dw $0006,DrawInst_RedDoorFacingRight_3 
    dw $0001,DrawInst_DoorFacingRight_A683 
    dw Instruction_PLM_Delete 

InstList_PLM_RedDoorFacingUp_0:
    dw $0002,DrawInst_DoorFacingUp_A68F 
    dw $0002,DrawInst_RedDoorFacingUp_3 
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $08 
    dw $0002,DrawInst_RedDoorFacingUp_2 
    dw $0002,DrawInst_RedDoorFacingUp_1 
    dw $0001,DrawInst_RedDoorFacingUp_0 

InstList_PLM_RedDoorFacingUp_1:
    dw Instruction_PLM_GotoY_ifRoomArg_DoorIsSet 
    dw InstList_PLM_ClosedBlueDoorFacingUp_42 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_RedDoorFacingUp_3 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfShotWithAMissile 
    dw $0001,DrawInst_RedDoorFacingUp_0 

InstList_PLM_RedDoorFacingUp_2:
    dw Instruction_PLM_Sleep 

InstList_PLM_RedDoorFacingUp_3:
    dw Instruction_PLM_IncDoorHit_SetRoomArgDoor_GotoY : db $05 
    dw InstList_PLM_RedDoorFacingUp_4 
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $09 
    dw $0003,DrawInst_DoorFacingUp_AA2B 
    dw $0004,DrawInst_RedDoorFacingUp_0 
    dw $0003,DrawInst_DoorFacingUp_AA2B 
    dw $0004,DrawInst_RedDoorFacingUp_0 
    dw $0003,DrawInst_DoorFacingUp_AA2B 
    dw $0004,DrawInst_RedDoorFacingUp_0 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_RedDoorFacingUp_2 

InstList_PLM_RedDoorFacingUp_4:
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $07 
    dw $0006,DrawInst_RedDoorFacingUp_1 
    dw $0006,DrawInst_RedDoorFacingUp_2 
    dw $0006,DrawInst_RedDoorFacingUp_3 
    dw $0001,DrawInst_DoorFacingUp_A68F 
    dw Instruction_PLM_Delete 

InstList_PLM_RedDoorFacingDown_0:
    dw $0002,DrawInst_DoorFacingDown_A69B 
    dw $0002,DrawInst_RedDoorFacingDown_3 
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $08 
    dw $0002,DrawInst_RedDoorFacingDown_2 
    dw $0002,DrawInst_RedDoorFacingDown_1 
    dw $0001,DrawInst_RedDoorFacingDown_0 

InstList_PLM_RedDoorFacingDown_1:
    dw Instruction_PLM_GotoY_ifRoomArg_DoorIsSet 
    dw InstList_PLM_ClosedBlueDoorFacingUp_43 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_RedDoorFacingDown_3 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfShotWithAMissile 
    dw $0001,DrawInst_RedDoorFacingDown_0 

InstList_PLM_RedDoorFacingDown_2:
    dw Instruction_PLM_Sleep 

InstList_PLM_RedDoorFacingDown_3:
    dw Instruction_PLM_IncDoorHit_SetRoomArgDoor_GotoY : db $05 
    dw InstList_PLM_RedDoorFacingDown_4 
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $09 
    dw $0003,DrawInst_DoorFacingDown_AA67 
    dw $0004,DrawInst_RedDoorFacingDown_0 
    dw $0003,DrawInst_DoorFacingDown_AA67 
    dw $0004,DrawInst_RedDoorFacingDown_0 
    dw $0003,DrawInst_DoorFacingDown_AA67 
    dw $0004,DrawInst_RedDoorFacingDown_0 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_RedDoorFacingDown_2 

InstList_PLM_RedDoorFacingDown_4:
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $07 
    dw $0006,DrawInst_RedDoorFacingDown_1 
    dw $0006,DrawInst_RedDoorFacingDown_2 
    dw $0006,DrawInst_RedDoorFacingDown_3 
    dw $0001,DrawInst_DoorFacingDown_A69B 
    dw Instruction_PLM_Delete 

InstList_PLM_BlueDoorFacingLeftOpened_40:
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $07 
    dw $0006,DrawInst_BlueDoorFacingLeft_0 
    dw $0006,DrawInst_BlueDoorFacingLeft_1 
    dw $0006,DrawInst_BlueDoorFacingLeft_2 
    dw $005E,DrawInst_DoorFacingLeft_A677 
    dw Instruction_PLM_Delete 

InstList_PLM_BlueDoorFacingLeftClosed:
    dw $0002,DrawInst_DoorFacingLeft_A677 
    dw $0002,DrawInst_BlueDoorFacingLeft_2 
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $08 
    dw $0002,DrawInst_BlueDoorFacingLeft_1 
    dw $0002,DrawInst_BlueDoorFacingLeft_0 

InstList_PLM_ClosedBlueDoorFacingLeft_40:
    dw Instruction_PLM_PLMBTS_Y : db $40 
    dw $0001,DrawInst_DoorFacingLeft_A9B3 
    dw Instruction_PLM_Delete 

InstList_PLM_BlueDoorFacingLeftOpened_41:
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $07 
    dw $0006,DrawInst_BlueDoorFacingRight_0 
    dw $0006,DrawInst_BlueDoorFacingRight_1 
    dw $0006,DrawInst_BlueDoorFacingRight_2 
    dw $005E,DrawInst_DoorFacingRight_A683 
    dw Instruction_PLM_Delete 

InstList_PLM_BlueDoorFacingRightClosed:
    dw $0002,DrawInst_DoorFacingRight_A683 
    dw $0002,DrawInst_BlueDoorFacingRight_2 
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $08 
    dw $0002,DrawInst_BlueDoorFacingRight_1 
    dw $0002,DrawInst_BlueDoorFacingRight_0 

InstList_PLM_ClosedBlueDoorFacingLeft_41:
    dw Instruction_PLM_PLMBTS_Y : db $41 
    dw $0001,DrawInst_DoorFacingRight_A9EF 
    dw Instruction_PLM_Delete 

InstList_PLM_BlueDoorFacingUpOpened_42:
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $07 
    dw $0006,DrawInst_BlueDoorFacingUp_0 
    dw $0006,DrawInst_BlueDoorFacingUp_1 
    dw $0006,DrawInst_BlueDoorFacingUp_2 
    dw $005E,DrawInst_DoorFacingUp_A68F 
    dw Instruction_PLM_Delete 

InstList_PLM_BlueDoorFacingUpClosed_42:
    dw $0002,DrawInst_DoorFacingUp_A68F 
    dw $0002,DrawInst_BlueDoorFacingUp_2 
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $08 
    dw $0002,DrawInst_BlueDoorFacingUp_1 
    dw $0002,DrawInst_BlueDoorFacingUp_0 

InstList_PLM_ClosedBlueDoorFacingUp_42:
    dw Instruction_PLM_PLMBTS_Y : db $42 
    dw $0001,DrawInst_DoorFacingUp_AA2B 
    dw Instruction_PLM_Delete 

InstList_PLM_BlueDoorFacingUpOpened_43:
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $07 
    dw $0006,DrawInst_BlueDoorFacingDown_0 
    dw $0006,DrawInst_BlueDoorFacingDown_1 
    dw $0006,DrawInst_BlueDoorFacingDown_2 
    dw $005E,DrawInst_DoorFacingDown_A69B 
    dw Instruction_PLM_Delete 

InstList_PLM_BlueDoorFacingUpClosed_43:
    dw $0002,DrawInst_DoorFacingDown_A69B 
    dw $0002,DrawInst_BlueDoorFacingDown_2 
    dw Instruction_PLM_QueueSound_Y_Lib3_Max6 : db $08 
    dw $0002,DrawInst_BlueDoorFacingDown_1 
    dw $0002,DrawInst_BlueDoorFacingDown_0 

InstList_PLM_ClosedBlueDoorFacingUp_43:
    dw Instruction_PLM_PLMBTS_Y : db $43 
    dw $0001,DrawInst_DoorFacingDown_AA67 
    dw Instruction_PLM_Delete 

Setup_LeftGreenGateTrigger:
    LDX.W $0DDE 
    LDA.W $0C18,X 
    AND.W #$0FFF 
    CMP.W #$0200 
    BNE .playSFX 
    JMP.W TriggerPLMOfBlockToTheRight 


.playSFX:
    LDA.W #$0057 
    JSL.L QueueSound_Lib2_Max6 
    LDA.W #$0000 : STA.W $1C37,Y 
    RTS 


Setup_RightGreenGateTrigger:
    LDX.W $0DDE 
    LDA.W $0C18,X 
    AND.W #$0FFF 
    CMP.W #$0200 
    BNE .playSFX 
    JMP.W TriggerPLMOfBlockToTheLeft 


.playSFX:
    LDA.W #$0057 
    JSL.L QueueSound_Lib2_Max6 
    LDA.W #$0000 : STA.W $1C37,Y 
    RTS 


Setup_LeftRedGateTrigger:
    LDX.W $0DDE 
    LDA.W $0C18,X 
    AND.W #$0FFF 
    CMP.W #$0100 
    BEQ .triggerPLM 
    CMP.W #$0200 
    BNE .playSFX 

.triggerPLM:
    JMP.W TriggerPLMOfBlockToTheRight 


.playSFX:
    LDA.W #$0057 
    JSL.L QueueSound_Lib2_Max6 
    LDA.W #$0000 : STA.W $1C37,Y 
    RTS 


Setup_RightRedGateTrigger:
    LDX.W $0DDE 
    LDA.W $0C18,X 
    AND.W #$0FFF 
    CMP.W #$0100 
    BEQ .triggerPLM 
    CMP.W #$0200 
    BNE .playSFX 

.triggerPLM:
    JMP.W TriggerPLMOfBlockToTheLeft 


.playSFX:
    LDA.W #$0057 
    JSL.L QueueSound_Lib2_Max6 
    LDA.W #$0000 : STA.W $1C37,Y 
    RTS 


Setup_LeftYellowGateTrigger:
    LDX.W $0DDE 
    LDA.W $0C18,X 
    AND.W #$0FFF 
    CMP.W #$0300 
    BNE .playSFX 
    JMP.W TriggerPLMOfBlockToTheRight 


.playSFX:
    LDA.W #$0057 
    JSL.L QueueSound_Lib2_Max6 
    LDA.W #$0000 : STA.W $1C37,Y 

RightYellowGateTrigger:
    LDX.W $0DDE 
    LDA.W $0C18,X 
    AND.W #$0FFF 
    CMP.W #$0300 
    BNE .playSFX 
    JMP.W TriggerPLMOfBlockToTheLeft 


.playSFX:
    LDA.W #$0057 
    JSL.L QueueSound_Lib2_Max6 
    LDA.W #$0000 : STA.W $1C37,Y 
    RTS 


Setup_LeftBlueGateTrigger:
    LDX.W $0DDE 
    LDA.W $0C18,X 
    AND.W #$0FFF 
    CMP.W #$0300 
    BEQ .deletePLM 
    JMP.W TriggerPLMOfBlockToTheRight 


.deletePLM:
    LDA.W #$0000 : STA.W $1C37,Y 

Setup_RightBlueGateTrigger:
    LDX.W $0DDE 
    LDA.W $0C18,X 
    AND.W #$0FFF 
    CMP.W #$0300 
    BEQ .deletePLM 
    JMP.W TriggerPLMOfBlockToTheLeft 


.deletePLM:
    LDA.W #$0000 : STA.W $1C37,Y 
    RTS 


TriggerPLMOfBlockToTheRight:
    LDA.W $1C87,Y 
    INC #2
    JMP.W TriggerPLMAtBlockIndex_A 


TriggerPLMOfBlockToTheLeft:
    LDA.W $1C87,Y 
    DEC #2
    TriggerPLMAtBlockIndex_A:
    LDX.W #$004E 

.loop:
    CMP.W $1C87,X 
    BEQ .found 
    DEX #2
    BPL .loop 
    BRA .return 


.found:
    LDA.W $1D77,X 
    BNE .return 
    INC.W $1D77,X 

.return:
    LDA.W #$0000 : STA.W $1C37,Y 
    SEC 
    RTS 


Give5BlockColumnBelowPLM_BTS10:
    LDA.W $1C87,Y 
    LSR A 
    TAX 
    JSR.W PLM_BTS10_MovePLMDownARow 
    JSR.W PLM_BTS10_MovePLMDownARow 
    JSR.W PLM_BTS10_MovePLMDownARow 
    JSR.W PLM_BTS10_MovePLMDownARow 
    JSR.W PLM_BTS10_MovePLMDownARow 
    RTS 


PLM_BTS10_MovePLMDownARow:
    LDA.L $7F6402,X 
    AND.W #$FF00 
    ORA.W #$0010 
    STA.L $7F6402,X 
    TXA 
    CLC : ADC.W $07A5 : TAX 
    RTS 


Give5BlockColumnAbovePLM_BTS10:
    LDA.W $1C87,Y 
    LSR A 
    TAX 
    JSR.W PLM_BTS10_MovePLMUpARow 
    JSR.W PLM_BTS10_MovePLMUpARow 
    JSR.W PLM_BTS10_MovePLMUpARow 
    JSR.W PLM_BTS10_MovePLMUpARow 
    JSR.W PLM_BTS10_MovePLMUpARow 
    RTS 


PLM_BTS10_MovePLMUpARow:
    LDA.L $7F6402,X 
    AND.W #$FF00 
    ORA.W #$0010 
    STA.L $7F6402,X 
    TXA 
    SEC : SBC.W $07A5 : TAX 
    RTS 


Setup_DownwardsClosedGate:
    PHY 
    LDY.W #EnemyProjectile_DownwardsShotGateInitiallyClosed 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    PLY 
    JSR.W Give5BlockColumnBelowPLM_BTS10 
    RTS 


Setup_UpwardsClosedGate:
    PHY 
    LDY.W #EnemyProjectile_UpwardsShotGateInitiallyClosed 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    PLY 
    JSR.W Give5BlockColumnAbovePLM_BTS10 
    RTS 


Setup_DownwardsOpenGate:
    JSR.W Give5BlockColumnBelowPLM_BTS10 
    RTS 


Setup_UpwardsOpenGate:
    JSR.W Give5BlockColumnAbovePLM_BTS10 
    RTS 


Setup_DownwardsGateShotblock:
    LDX.W $1DC7,Y 
    LDA.W .instListPointers,X : STA.W $1D27,Y 
    LDX.W $1DC7,Y 
    LDA.W .leftBlock,X 
    BEQ .noRoomArg 
    LDX.W $1C87,Y 
    DEX #2
    JSR.W Write_Level_Data_Block_Type_and_BTS 

.noRoomArg:
    LDX.W $1DC7,Y 
    LDA.W .rightBlock,X 
    BEQ .return 
    LDX.W $1C87,Y 
    INX #2
    JSR.W Write_Level_Data_Block_Type_and_BTS 

.return:
    RTS 


.instListPointers:
    dw InstList_PLM_DownwardsGateShotblock_BlueLeft 
    dw InstList_PLM_DownwardsGateShotblock_BlueRight 
    dw InstList_PLM_DownwardsGateShotblock_RedLeft 
    dw InstList_PLM_DownwardsGateShotblock_RedRight 
    dw InstList_PLM_DownwardsGateShotblock_GreenLeft 
    dw InstList_PLM_DownwardsGateShotblock_GreenRight 
    dw InstList_PLM_DownwardsGateShotblock_YellowLeft 
    dw InstList_PLM_DownwardsGateShotblock_YellowRight 
;        _____________________________________________ 0: Blue left
;       |      _______________________________________ 2: Blue right
;       |     |      _________________________________ 4: Red left
;       |     |     |      ___________________________ 6: Red right
;       |     |     |     |      _____________________ 8: Green left
;       |     |     |     |     |      _______________ Ah: Green right
;       |     |     |     |     |     |      _________ Ch: Yellow left
;       |     |     |     |     |     |     |      ___ Eh: Yellow right
;       |     |     |     |     |     |     |     |
.leftBlock:
    dw $C046,$0000,$C048,$0000,$C04A,$0000,$C04C,$0000 
.rightBlock:
    dw $0000,$C047,$0000,$C049,$0000,$C04B,$0000,$C04D 

Setup_UpwardsGateShotblock:
    LDX.W $1DC7,Y 
    LDA.W .instListPointers,X : STA.W $1D27,Y 
    LDX.W $1DC7,Y 
    LDA.W .leftBlock,X 
    BEQ .noRoomArg 
    LDX.W $1C87,Y 
    DEX #2
    JSR.W Write_Level_Data_Block_Type_and_BTS 

.noRoomArg:
    LDX.W $1DC7,Y 
    LDA.W .rightBlock,X 
    BEQ .return 
    LDX.W $1C87,Y 
    INX #2
    JSR.W Write_Level_Data_Block_Type_and_BTS 

.return:
    RTS 


.instListPointers:
    dw InstList_PLM_UpwardsGateShotblock_BlueLeft 
    dw InstList_PLM_UpwardsGateShotblock_BlueRight 
    dw InstList_PLM_UpwardsGateShotblock_RedLeft 
    dw InstList_PLM_UpwardsGateShotblock_RedRight 
    dw InstList_PLM_UpwardsGateShotblock_GreenLeft 
    dw InstList_PLM_UpwardsGateShotblock_GreenRight 
    dw InstList_PLM_UpwardsGateShotblock_YellowLeft 
    dw InstList_PLM_UpwardsGateShotblock_YellowRight 
;        _____________________________________________ 0: Blue left
;       |      _______________________________________ 2: Blue right
;       |     |      _________________________________ 4: Red left
;       |     |     |      ___________________________ 6: Red right
;       |     |     |     |      _____________________ 8: Green left
;       |     |     |     |     |      _______________ Ah: Green right
;       |     |     |     |     |     |      _________ Ch: Yellow left
;       |     |     |     |     |     |     |      ___ Eh: Yellow right
;       |     |     |     |     |     |     |     |
.leftBlock:
    dw $C046,$0000,$C048,$0000,$C04A,$0000,$C04C,$0000 
.rightBlock:
    dw $0000,$C047,$0000,$C049,$0000,$C04B,$0000,$C04D 

Setup_GreyDoor:
    LDA.W $1DC8,Y 
    AND.W #$007C 
    LSR A 
    STA.W $1E17,Y 
    LDA.W $1DC7,Y : AND.W #$83FF : STA.W $1DC7,Y 
    LDX.W $1C87,Y 
    LDA.W #$C044 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    RTS 


Setup_ColoredDoor:
    LDX.W $1C87,Y 
    LDA.W #$C044 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    RTS 


Setup_BlueDoor:
    LDX.W $0DDE 
    LDA.W $0C18,X 
    AND.W #$0F00 
    CMP.W #$0300 
    BNE .notPowerBomb 
    LDA.W #$0000 : STA.W $1C37,Y 
    RTS 


.notPowerBomb:
    LDX.W $1C87,Y 
    LDA.L $7F0002,X 
    AND.W #$0FFF 
    ORA.W #$8000 
    STA.L $7F0002,X 
    RTS 


Setup_GenericShotTriggerForAPLM:
    TYX 
    LDA.W $1C87,X 
    STZ.W $1C87,X 
    LDX.W #$004E 

.loop:
    CMP.W $1C87,X 
    BEQ .found 
    DEX #2
    BPL .loop 
    RTS 


.found:
    LDY.W $0DDE 
    LDA.W $0C18,Y 
    AND.W #$1FFF 
    ORA.W #$8000 
    STA.W $1D77,X 
    RTS 


PLMEntries_leftGreenGateTrigger:
    dw Setup_LeftGreenGateTrigger 
    dw InstList_PLM_Delete 

PLMEntries_rightGreenGateTrigger:
    dw Setup_RightGreenGateTrigger 
    dw InstList_PLM_Delete 

PLMEntries_leftRedGateTrigger:
    dw Setup_LeftRedGateTrigger 
    dw InstList_PLM_Delete 

PLMEntries_rightRedGateTrigger:
    dw Setup_RightRedGateTrigger 
    dw InstList_PLM_Delete 

PLMEntries_leftBlueGateTrigger:
    dw Setup_LeftBlueGateTrigger 
    dw InstList_PLM_Delete 

PLMEntries_rightBlueGateTrigger:
    dw Setup_RightBlueGateTrigger 
    dw InstList_PLM_Delete 

PLMEntries_leftYellowGateTrigger:
    dw Setup_LeftYellowGateTrigger 
    dw InstList_PLM_Delete 

PLMEntries_rightYellowGateTrigger:
    dw RightYellowGateTrigger 
    dw InstList_PLM_Delete 

PLMEntries_downwardsOpenGate:
    dw Setup_DownwardsOpenGate 
    dw InstList_PLM_DownwardsOpenGate 

PLMEntries_downwardsClosedGate:
    dw Setup_DownwardsClosedGate 
    dw InstList_PLM_DownwardsClosedGate 

PLMEntries_upwardsOpenGate:
    dw Setup_UpwardsOpenGate 
    dw InstList_PLM_UpwardsOpenGate 

PLMEntries_upwardsClosedGate:
    dw Setup_UpwardsClosedGate 
    dw InstList_PLM_UpwardsClosedGate 

PLMEntries_downwardsGateShotblock:
    dw Setup_DownwardsGateShotblock 
    dw InstList_PLM_DownwardsGateShotblock_BlueLeft 

PLMEntries_upwardsGateShotblock:
    dw Setup_UpwardsGateShotblock 
    dw InstList_PLM_UpwardsGateShotblock_BlueLeft 

PLMEntries_genericShotTriggerForAPLM:
    dw Setup_GenericShotTriggerForAPLM 
    dw InstList_PLM_Delete 

PLMEntries_greyDoorFacingLeft:
    dw Setup_GreyDoor 
    dw InstList_PLM_GreyDoorFacingLeft_1 
    dw InstList_PLM_GreyDoorFacingLeft_0 

PLMEntries_greyDoorFacingRight:
    dw Setup_GreyDoor 
    dw InstList_PLM_GreyDoorFacingRight_1 
    dw InstList_PLM_GreyDoorFacingRight_0 

PLMEntries_greyDoorFacingUp:
    dw Setup_GreyDoor 
    dw InstList_PLM_GreyDoorFacingUp_1 
    dw InstList_PLM_GreyDoorFacingUp_0 

PLMEntries_greyDoorFacingDown:
    dw Setup_GreyDoor 
    dw InstList_PLM_GreyDoorFacingDown_1 
    dw InstList_PLM_GreyDoorFacingDown_0 

PLMEntries_yellowDoorFacingLeft:
    dw Setup_ColoredDoor 
    dw InstList_PLM_YellowDoorFacingLeft_1 
    dw InstList_PLM_YellowDoorFacingLeft_0 

PLMEntries_yellowDoorFacingRIght:
    dw Setup_ColoredDoor 
    dw InstList_PLM_YellowDoorFacingRight_1 
    dw InstList_PLM_YellowDoorFacingRight_0 

PLMEntries_yellowDoorFacingUp:
    dw Setup_ColoredDoor 
    dw InstList_PLM_YellowDoorFacingUp_1 
    dw InstList_PLM_YellowDoorFacingUp_0 

PLMEntries_yellowDoorFacingDown:
    dw Setup_ColoredDoor 
    dw InstList_PLM_YellowDoorFacingDown_1 
    dw InstList_PLM_YellowDoorFacingDown_0 

PLMEntries_greenDoorFacingLeft:
    dw Setup_ColoredDoor 
    dw InstList_PLM_GreenDoorFacingLeft_1 
    dw InstList_PLM_GreenDoorFacingLeft_0 

PLMEntries_greenDoorFacingRight:
    dw Setup_ColoredDoor 
    dw InstList_PLM_GreenDoorFacingRight_1 
    dw InstList_PLM_GreenDoorFacingRight_0 

PLMEntries_greenDoorFacingUp:
    dw Setup_ColoredDoor 
    dw InstList_PLM_GreenDoorFacingUp_1 
    dw InstList_PLM_GreenDoorFacingUp_0 

PLMEntries_greenDoorFacingDown:
    dw Setup_ColoredDoor 
    dw InstList_PLM_GreenDoorFacingDown_1 
    dw InstList_PLM_GreenDoorFacingDown_0 

PLMEntries_redDoorFacingLeft:
    dw Setup_ColoredDoor 
    dw InstList_PLM_RedDoorFacingLeft_1 
    dw InstList_PLM_RedDoorFacingLeft_0 

PLMEntries_redDoorFacingRight:
    dw Setup_ColoredDoor 
    dw InstList_PLM_RedDoorFacingRight_1 
    dw InstList_PLM_RedDoorFacingRight_0 

PLMEntries_redDoorFacingUp:
    dw Setup_ColoredDoor 
    dw InstList_PLM_RedDoorFacingUp_1 
    dw InstList_PLM_RedDoorFacingUp_0 

PLMEntries_redDoorFacingDown:
    dw Setup_ColoredDoor 
    dw InstList_PLM_RedDoorFacingDown_1 
    dw InstList_PLM_RedDoorFacingDown_0 

PLMEntries_blueDoorFacingLeft:
    dw Setup_BlueDoor 
    dw InstList_PLM_BlueDoorFacingLeftOpened_40 
    dw InstList_PLM_BlueDoorFacingLeftClosed 

PLMEntries_blueDoorFacingRight:
    dw Setup_BlueDoor 
    dw InstList_PLM_BlueDoorFacingLeftOpened_41 
    dw InstList_PLM_BlueDoorFacingRightClosed 

PLMEntries_blueDoorFacingUp:
    dw Setup_BlueDoor 
    dw InstList_PLM_BlueDoorFacingUpOpened_42 
    dw InstList_PLM_BlueDoorFacingUpClosed_42 

PLMEntries_blueDoorFacingDown:
    dw Setup_BlueDoor 
    dw InstList_PLM_BlueDoorFacingUpOpened_43 
    dw InstList_PLM_BlueDoorFacingUpClosed_43 

PLMEntries_blueDoorClosingFacingLeft:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_BlueDoorFacingLeftClosed 

PLMEntries_blueDoorClosingFacingRight:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_BlueDoorFacingRightClosed 

PLMEntries_blueDoorClosingFacingUp:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_BlueDoorFacingUpClosed_42 

PLMEntries_blueDoorClosingFacingDown:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_BlueDoorFacingUpClosed_43 

PLMEntries_gateThatClosesInEscapeRoom1:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_GateThatClosesDuringEscapeAfterMotherBrain_0 
    dw InstList_PLM_GateThatClosesDuringEscapeAfterMotherBrain_1 

PLMEntries_gateThatClosesInEscapeRoom1_PLM:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_GateThatClosesDuringEscapeAfterMotherBrain_1 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_PLM_Draws1x1ShotBlock_84C8D4:
    dw $0001,UNUSED_DrawInst_1x1ShotBlock_84A475 
    dw Instruction_PLM_Delete 

UNUSED_InstList_PLM_Draws1x2ShotBlock_84C8DA:
    dw $0001,DrawInst_2x1RespawningShotBlock 
    dw Instruction_PLM_Delete 

UNUSED_InstList_PLM_Draws2x1ShotBlock_84C8E0:
    dw $0001,DrawInst_1x2RespawningShotBlock 
    dw Instruction_PLM_Delete 

UNUSED_InstList_PLM_Draws2x2ShotBlock_84C8E6:
    dw $0001,DrawInst_2x2RespawningShotBlock 
    dw Instruction_PLM_Delete 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_BombReaction_PLM_1x1RespawningCrumbleBlock:
    dw $0001,DrawInst_1x1RespawningCrumbleBlock 
    dw Instruction_PLM_Delete 

InstList_BombReaction_PLM_2x1RespawningCrumbleBlock:
    dw $0001,DrawInst_2x1RespawningCrumbleBlock 
    dw Instruction_PLM_Delete 

InstList_BombReaction_PLM_1x2RespawningCrumbleBlock:
    dw $0001,DrawInst_1x2RespawningCrumbleBlock 
    dw Instruction_PLM_Delete 

InstList_BombReaction_PLM_2x2RespawningCrumbleBlock:
    dw $0001,DrawInst_2x2RespawningCrumbleBlock 
    dw Instruction_PLM_Delete 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_PLM_84C904:
    dw $0001,UNUSED_DrawInst_84A4C1 
    dw Instruction_PLM_Delete 

UNUSED_InstList_PLM_84C90A:
    dw $0001,DrawInst_2x1RespawningBombBlock 
    dw Instruction_PLM_Delete 

UNUSED_InstList_PLM_84C910:
    dw $0001,DrawInst_1x2RespawningBombBlock 
    dw Instruction_PLM_Delete 

UNUSED_InstList_PLM_84C916:
    dw $0001,DrawInst_2x2RespawningBombBlock 
    dw Instruction_PLM_Delete 
endif ; !FEATURE_KEEP_UNREFERENCED

UNUSED_InstList_PLM_PowerBombBlockBombed_84C91C:
    dw $0001,UNUSED_DrawInst_PowerBombBlockBombed_84A4E7 
    dw Instruction_PLM_Delete 

UNUSED_InstList_PLM_SuperMissileBlockBombed_84C922:
    dw $0001,UNUSED_DrawInst_SuperMissileBlockBombed_84A4ED 
    dw Instruction_PLM_Delete 

InstList_PLM_BombReaction_SpeedBlock:
    dw $0001,DrawInst_BombReactionSpeedBlock 
    dw Instruction_PLM_Delete 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_PLM_84C92E:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6 : db $06 
    dw $0004,DrawInst_Respawn1x1_0 
    dw $0004,DrawInst_Respawn1x1_1 
    dw $0004,DrawInst_Respawn1x1_2 
    dw $0180,DrawInst_Respawn1x1_3 
    dw $0004,DrawInst_Respawn1x1_2 
    dw $0004,DrawInst_Respawn1x1_1 
    dw $0004,DrawInst_Respawn1x1_0 
    dw Instruction_PLM_DrawPLMBlock 
    dw Instruction_PLM_Delete 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_PLM_RespawningSpeedBlock_SlowerCrumbleAnimation:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1 : db $06 
    dw $0002,DrawInst_Respawn1x1_0 
    dw $0002,DrawInst_Respawn1x1_1 
    dw $0002,DrawInst_Respawn1x1_2 
    dw $0030,DrawInst_Respawn1x1_3 
    dw $0004,DrawInst_Respawn1x1_2 
    dw $0004,DrawInst_Respawn1x1_1 
    dw $0004,DrawInst_Respawn1x1_0 
    dw Instruction_PLM_DrawPLMBlock 
    dw Instruction_PLM_Delete 

InstList_PLM_RespawningSpeedBoostBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1 : db $06 
    dw $0001,DrawInst_Respawn1x1_0 
    dw $0001,DrawInst_Respawn1x1_1 
    dw $0001,DrawInst_Respawn1x1_2 
    dw $0030,DrawInst_Respawn1x1_3 
    dw $0004,DrawInst_Respawn1x1_2 
    dw $0004,DrawInst_Respawn1x1_1 
    dw $0004,DrawInst_Respawn1x1_0 
    dw Instruction_PLM_DrawPLMBlock 
    dw Instruction_PLM_Delete 

InstList_PLM_RespawningSpeedBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1 : db $06  
    dw $0001,DrawInst_Respawn1x1_0 
    dw $0001,DrawInst_Respawn1x1_1 
    dw $0001,DrawInst_Respawn1x1_2 
    dw $0030,DrawInst_Respawn1x1_3 
    dw $0004,DrawInst_Respawn1x1_2 
    dw $0004,DrawInst_Respawn1x1_1 
    dw $0004,DrawInst_Respawn1x1_0 
    dw Instruction_PLM_DrawPLMBlock_Clone 
    dw Instruction_PLM_Delete 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_PLM_84C9BA:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6 : db $06 
    dw $0004,DrawInst_Respawn1x1_0 
    dw $0004,DrawInst_Respawn1x1_1 
    dw $0004,DrawInst_Respawn1x1_2 
    dw $0001,DrawInst_Respawn1x1_3 
    dw Instruction_PLM_Delete 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_PLM_SpeedBlockSlowerCrumbleAnimation:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1 : db $06 
    dw $0002,DrawInst_Respawn1x1_0 
    dw $0002,DrawInst_Respawn1x1_1 
    dw $0002,DrawInst_Respawn1x1_2 
    dw $0001,DrawInst_Respawn1x1_3 
    dw Instruction_PLM_Delete 

InstList_PLM_SpeedBoostBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1 : db $06 
    dw $0001,DrawInst_Respawn1x1_0 
    dw $0001,DrawInst_Respawn1x1_1 
    dw $0001,DrawInst_Respawn1x1_2 
    dw $0001,DrawInst_Respawn1x1_3 
    dw Instruction_PLM_Delete 

InstList_PLM_1x1RespawningCrumbleBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1 : db $0A 
    dw $0008,DrawInst_Respawn1x1_0 
    dw $0006,DrawInst_Respawn1x1_1 
    dw $0004,DrawInst_Respawn1x1_2 
    dw $0010,DrawInst_Respawn1x1_3 
    dw $0004,DrawInst_Respawn1x1_2 
    dw $0004,DrawInst_Respawn1x1_1 
    dw $0004,DrawInst_Respawn1x1_0 
    dw Instruction_PLM_DrawPLMBlock 
    dw Instruction_PLM_Delete 

InstList_PLM_2x1RespawningCrumbleBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1 : db $0A 
    dw $0004,DrawInst_Respawn2x1_0 
    dw $0004,DrawInst_Respawn2x1_1 
    dw $0004,DrawInst_Respawn2x1_2 
    dw $0010,DrawInst_Respawn2x1_3 
    dw $0004,DrawInst_Respawn2x1_2 
    dw $0004,DrawInst_Respawn2x1_1 
    dw $0004,DrawInst_Respawn2x1_0 
    dw $0001,DrawInst_2x1RespawningCrumbleBlock 
    dw Instruction_PLM_Delete 

InstList_PLM_1x2RespawningCrumbleBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1 : db $0A 
    dw $0004,DrawInst_Respawn1x2_0 
    dw $0004,DrawInst_Respawn1x2_1 
    dw $0004,DrawInst_Respawn1x2_2 
    dw $0020,DrawInst_Respawn1x2_3 
    dw $0004,DrawInst_Respawn1x2_2 
    dw $0004,DrawInst_Respawn1x2_1 
    dw $0004,DrawInst_Respawn1x2_0 
    dw $0001,DrawInst_1x2RespawningCrumbleBlock 
    dw Instruction_PLM_Delete 

InstList_PLM_2x2RespawningCrumbleBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1 : db $0A 
    dw $0004,DrawInst_Respawn2x2_0 
    dw $0004,DrawInst_Respawn2x2_1 
    dw $0004,DrawInst_Respawn2x2_2 
    dw $0020,DrawInst_Respawn2x2_3 
    dw $0004,DrawInst_Respawn2x2_2 
    dw $0004,DrawInst_Respawn2x2_1 
    dw $0004,DrawInst_Respawn2x2_0 
    dw $0001,DrawInst_2x2RespawningCrumbleBlock 
    dw Instruction_PLM_Delete 

InstList_PLM_1x1CrumbleBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1 : db $0A 
    dw $0004,DrawInst_Respawn1x1_0 
    dw $0004,DrawInst_Respawn1x1_1 
    dw $0004,DrawInst_Respawn1x1_2 
    dw $0001,DrawInst_Respawn1x1_3 
    dw Instruction_PLM_Delete 

InstList_PLM_2x1CrumbleBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1 : db $0A 
    dw $0004,DrawInst_Respawn2x1_0 
    dw $0004,DrawInst_Respawn2x1_1 
    dw $0004,DrawInst_Respawn2x1_2 
    dw $0001,DrawInst_Respawn2x1_3 
    dw Instruction_PLM_Delete 

InstList_PLM_1x2CrumbleBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1 : db $0A 
    dw $0004,DrawInst_Respawn1x2_0 
    dw $0004,DrawInst_Respawn1x2_1 
    dw $0004,DrawInst_Respawn1x2_2 
    dw $0001,DrawInst_Respawn1x2_3 
    dw Instruction_PLM_Delete 

InstList_PLM_2x2CrumbleBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1 : db $0A 
    dw $0004,DrawInst_Respawn2x2_0 
    dw $0004,DrawInst_Respawn2x2_1 
    dw $0004,DrawInst_Respawn2x2_2 
    dw $0001,DrawInst_Respawn2x2_3 
    dw Instruction_PLM_Delete 

InstList_PLM_1x1RespawningShotBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1 : db $0A 
    dw $0004,DrawInst_Respawn1x1_0 
    dw $0004,DrawInst_Respawn1x1_1 
    dw $0004,DrawInst_Respawn1x1_2 
    dw $0180,DrawInst_Respawn1x1_3 
    dw $0004,DrawInst_Respawn1x1_2 
    dw $0004,DrawInst_Respawn1x1_1 
    dw $0004,DrawInst_Respawn1x1_0 
    dw Instruction_PLM_DrawPLMBlock 
    dw Instruction_PLM_Delete 

InstList_PLM_2x1RespawningShotBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1 : db $0A 
    dw $0004,DrawInst_Respawn2x1_0 
    dw $0004,DrawInst_Respawn2x1_1 
    dw $0004,DrawInst_Respawn2x1_2 
    dw $0180,DrawInst_Respawn2x1_3 
    dw $0004,DrawInst_Respawn2x1_2 
    dw $0004,DrawInst_Respawn2x1_1 
    dw $0004,DrawInst_Respawn2x1_0 
    dw $0001,DrawInst_2x1RespawningShotBlock 
    dw Instruction_PLM_Delete 

InstList_PLM_1x2RespawningShotBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1 : db $0A 
    dw $0004,DrawInst_Respawn1x2_0 
    dw $0004,DrawInst_Respawn1x2_1 
    dw $0004,DrawInst_Respawn1x2_2 
    dw $0180,DrawInst_Respawn1x2_3 
    dw $0004,DrawInst_Respawn1x2_2 
    dw $0004,DrawInst_Respawn1x2_1 
    dw $0004,DrawInst_Respawn1x2_0 
    dw $0001,DrawInst_1x2RespawningShotBlock 
    dw Instruction_PLM_Delete 

InstList_PLM_2x2RespawningShotBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1 : db $0A 
    dw $0004,DrawInst_Respawn2x2_0 
    dw $0004,DrawInst_Respawn2x2_1 
    dw $0004,DrawInst_Respawn2x2_2 
    dw $0180,DrawInst_Respawn2x2_3 
    dw $0004,DrawInst_Respawn2x2_2 
    dw $0004,DrawInst_Respawn2x2_1 
    dw $0004,DrawInst_Respawn2x2_0 
    dw $0001,DrawInst_2x2RespawningShotBlock 
    dw Instruction_PLM_Delete 

InstList_PLM_RespawningSuperMissileBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6 : db $0A 
    dw $0004,DrawInst_Respawn1x1_0 
    dw $0004,DrawInst_Respawn1x1_1 
    dw $0004,DrawInst_Respawn1x1_2 
    dw $0180,DrawInst_Respawn1x1_3 
    dw $0004,DrawInst_Respawn1x1_2 
    dw $0004,DrawInst_Respawn1x1_1 
    dw $0004,DrawInst_Respawn1x1_0 
    dw Instruction_PLM_DrawPLMBlock 
    dw Instruction_PLM_Delete 

InstList_PLM_RespawningPowerBombBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1 : db $0A 
    dw $0004,DrawInst_Respawn1x1_0 
    dw $0004,DrawInst_Respawn1x1_1 
    dw $0004,DrawInst_Respawn1x1_2 
    dw $0180,DrawInst_Respawn1x1_3 
    dw $0004,DrawInst_Respawn1x1_2 
    dw $0004,DrawInst_Respawn1x1_1 
    dw $0004,DrawInst_Respawn1x1_0 
    dw Instruction_PLM_DrawPLMBlock 
    dw Instruction_PLM_Delete 

InstList_PLM_1x1ShotBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1 : db $0A 
    dw $0004,DrawInst_Respawn1x1_0 
    dw $0004,DrawInst_Respawn1x1_1 
    dw $0004,DrawInst_Respawn1x1_2 
    dw $0001,DrawInst_Respawn1x1_3 
    dw Instruction_PLM_Delete 

InstList_PLM_2x1ShotBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1 : db $0A 
    dw $0004,DrawInst_Respawn2x1_0 
    dw $0004,DrawInst_Respawn2x1_1 
    dw $0004,DrawInst_Respawn2x1_2 
    dw $0001,DrawInst_Respawn2x1_3 
    dw Instruction_PLM_Delete 

InstList_PLM_1x2ShotBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1 : db $0A 
    dw $0004,DrawInst_Respawn1x2_0 
    dw $0004,DrawInst_Respawn1x2_1 
    dw $0004,DrawInst_Respawn1x2_2 
    dw $0001,DrawInst_Respawn1x2_3 
    dw Instruction_PLM_Delete 

InstList_PLM_2x2ShotBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1 : db $0A 
    dw $0004,DrawInst_Respawn2x2_0 
    dw $0004,DrawInst_Respawn2x2_1 
    dw $0004,DrawInst_Respawn2x2_2 
    dw $0001,DrawInst_Respawn2x2_3 
    dw Instruction_PLM_Delete 

InstList_PLM_SuperMissileBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6 : db $0A 
    dw $0004,DrawInst_Respawn1x1_0 
    dw $0004,DrawInst_Respawn1x1_1 
    dw $0004,DrawInst_Respawn1x1_2 
    dw $0001,DrawInst_Respawn1x1_3 
    dw Instruction_PLM_Delete 

InstList_PLM_PowerBombBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max1 : db $0A 
    dw $0003,DrawInst_Respawn1x1_0 
    dw $0002,DrawInst_Respawn1x1_1 
    dw $0001,DrawInst_Respawn1x1_2 
    dw $0001,DrawInst_Respawn1x1_3 
    dw Instruction_PLM_Delete 

InstList_PLM_CollisionReaction_1x1RespawningBombBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3 : db $06 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_1x1RespawningBombBlock 

InstList_PLM_Reaction_1x1RespawningBombBlock_0:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3 : db $0A 

InstList_PLM_1x1RespawningBombBlock:
    dw $0004,DrawInst_Respawn1x1_0 
    dw $0004,DrawInst_Respawn1x1_1 
    dw $0004,DrawInst_Respawn1x1_2 
    dw $0180,DrawInst_Respawn1x1_3 
    dw $0004,DrawInst_Respawn1x1_2 
    dw $0004,DrawInst_Respawn1x1_1 
    dw $0004,DrawInst_Respawn1x1_0 
    dw Instruction_PLM_DrawPLMBlock 
    dw Instruction_PLM_Delete 

InstList_PLM_Collision_2x1RespawningBombBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3 : db $06 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_2x1RespawningBombBlock 

InstList_PLM_Reaction_2x1RespawningBombBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3 : db $0A 

InstList_PLM_2x1RespawningBombBlock:
    dw $0004,DrawInst_Respawn2x1_0 
    dw $0004,DrawInst_Respawn2x1_1 
    dw $0004,DrawInst_Respawn2x1_2 
    dw $0180,DrawInst_Respawn2x1_3 
    dw $0004,DrawInst_Respawn2x1_2 
    dw $0004,DrawInst_Respawn2x1_1 
    dw $0004,DrawInst_Respawn2x1_0 
    dw $0001,DrawInst_2x1RespawningBombBlock 
    dw Instruction_PLM_Delete 

InstList_PLM_Collision_1x2RespawningBombBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3 : db $06 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_1x2RespawningBombBlock 

InstList_PLM_Reaction_1x2RespawningBombBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3 : db $0A 

InstList_PLM_1x2RespawningBombBlock:
    dw $0004,DrawInst_Respawn1x2_0 
    dw $0004,DrawInst_Respawn1x2_1 
    dw $0004,DrawInst_Respawn1x2_2 
    dw $0180,DrawInst_Respawn1x2_3 
    dw $0004,DrawInst_Respawn1x2_2 
    dw $0004,DrawInst_Respawn1x2_1 
    dw $0004,DrawInst_Respawn1x2_0 
    dw $0001,DrawInst_1x2RespawningBombBlock 
    dw Instruction_PLM_Delete 

InstList_PLM_Collision_2x2RespawningBombBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3 : db $06 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_2x2RespawningBombBlock 

InstList_PLM_Reaction_2x2RespawningBombBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3 : db $0A 

InstList_PLM_2x2RespawningBombBlock:
    dw $0004,DrawInst_Respawn2x2_0 
    dw $0004,DrawInst_Respawn2x2_1 
    dw $0004,DrawInst_Respawn2x2_2 
    dw $0180,DrawInst_Respawn2x2_3 
    dw $0004,DrawInst_Respawn2x2_2 
    dw $0004,DrawInst_Respawn2x2_1 
    dw $0004,DrawInst_Respawn2x2_0 
    dw $0001,DrawInst_2x2RespawningBombBlock 
    dw Instruction_PLM_Delete 

InstList_PLM_Collision_1x1RespawningBombBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3 : db $06 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_1x1BombBlock 

InstList_PLM_Reaction_1x1RespawningBombBlock_4:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3 : db $0A 

InstList_PLM_1x1BombBlock:
    dw $0004,DrawInst_Respawn1x1_0 
    dw $0004,DrawInst_Respawn1x1_1 
    dw $0004,DrawInst_Respawn1x1_2 
    dw $0001,DrawInst_Respawn1x1_3 
    dw Instruction_PLM_Delete 

InstList_PLM_Collision_2x1BombBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3 : db $06 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_2x1BombBlock 

InstList_PLM_Reaction_2x1BombBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3 : db $0A 

InstList_PLM_2x1BombBlock:
    dw $0004,DrawInst_Respawn2x1_0 
    dw $0004,DrawInst_Respawn2x1_1 
    dw $0004,DrawInst_Respawn2x1_2 
    dw $0001,DrawInst_Respawn2x1_3 
    dw Instruction_PLM_Delete 

InstList_PLM_Collision_1x2BombBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3 : db $06 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_1x2BombBlock 

InstList_PLM_Reaction_1x2BombBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3 : db $0A 

InstList_PLM_1x2BombBlock:
    dw $0004,DrawInst_Respawn1x2_0 
    dw $0004,DrawInst_Respawn1x2_1 
    dw $0004,DrawInst_Respawn1x2_2 
    dw $0001,DrawInst_Respawn1x2_3 
    dw Instruction_PLM_Delete 

InstList_PLM_Collision_2x2BombBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3 : db $06 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_2x2BombBlock 

InstList_PLM_Reaction_2x2BombBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3 : db $0A 

InstList_PLM_2x2BombBlock:
    dw $0004,DrawInst_Respawn2x2_0 
    dw $0004,DrawInst_Respawn2x2_1 
    dw $0004,DrawInst_Respawn2x2_2 
    dw $0001,DrawInst_Respawn2x2_3 
    dw Instruction_PLM_Delete 

InstList_PLM_EnemyBreakableBlock:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max3 : db $0A 
    dw $0004,DrawInst_Respawn1x1_0 
    dw $0004,DrawInst_Respawn1x1_1 
    dw $0004,DrawInst_Respawn1x1_2 
    dw $0001,DrawInst_Respawn1x1_3 
    dw Instruction_PLM_Delete 

InstList_PLM_GrappleBlock:
    dw Instruction_PLM_Delete 

InstList_PLM_RespawningBreakableGrappleBlock:
    dw $00F0,DrawInst_BreakableGrappleBlock_0 
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6 : db $0A 
    dw $0004,DrawInst_BreakableGrappleBlock_1 
    dw $0004,DrawInst_BreakableGrappleBlock_2 
    dw $0004,DrawInst_BreakableGrappleBlock_3 
    dw $0006,DrawInst_BreakableGrappleBlock_4 
    dw $0004,DrawInst_BreakableGrappleBlock_3 
    dw $0004,DrawInst_BreakableGrappleBlock_2 
    dw $0004,DrawInst_BreakableGrappleBlock_1 
    dw Instruction_SetPLMBTSTo1 
    dw Instruction_PLM_DrawPLMBlock 
    dw Instruction_PLM_Delete 

Instruction_SetPLMBTSTo1:
    PHX 
    LDA.W $1C87,X 
    LSR A 
    TAX 
    LDA.L $7F6402,X 
    AND.W #$FF00 
    ORA.W #$0001 
    STA.L $7F6402,X 
    PLX 
    RTS 


InstList_PLM_BreakableGrappleBlock:
    dw $0078,DrawInst_BreakableGrappleBlock_0 
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6 : db $0A 
    dw $0004,DrawInst_BreakableGrappleBlock_1 
    dw $0004,DrawInst_BreakableGrappleBlock_2 
    dw $0004,DrawInst_BreakableGrappleBlock_3 
    dw $0001,DrawInst_BreakableGrappleBlock_4 
    dw Instruction_PLM_Delete 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Setup_84CDC2:
    LDA.W $0A1C 
    CMP.W #$0081 
    BEQ .screwAttacking 
    CMP.W #$0082 
    BNE .deletePLM 

.screwAttacking:
    LDX.W $1C87,Y 
    LDA.L $7F0002,X : STA.W $1E17,Y 
    AND.W #$0FFF 
    STA.L $7F0002,X 
    CLC 
    RTS 


.deletePLM:
    LDA.W #$0000 : STA.W $1C37,Y 
    SEC 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Setup_Collision_RespawningSpeedBoostBlock:
    LDA.W $0B3E 
    AND.W #$0F00 
    CMP.W #$0400 
    BEQ .speed 
    LDA.W $0A1C 
    CMP.W #$00C9 
    BEQ .speed 
    CMP.W #$00CA 
    BEQ .speed 
    CMP.W #$00CB 
    BEQ .speed 
    CMP.W #$00CC 
    BEQ .speed 
    CMP.W #$00CD 
    BEQ .speed 
    CMP.W #$00CE 
    BEQ .speed 
    LDA.W #$0000 : STA.W $1C37,Y 
    SEC 
    RTS 


.speed:
    LDX.W $1C87,Y 
    LDA.L $7F0002,X 
    AND.W #$F000 
    ORA.W #$00B6 
    STA.W $1E17,Y 
    AND.W #$0FFF 
    STA.L $7F0002,X 
    CLC 
    RTS 


Setup_Collision_RespawningCrumbleBlock:
    LDA.W $0B02 
    AND.W #$000F 
    CMP.W #$0003 
    BNE .deletePLM 
    LDX.W $1C87,Y 
    LDA.L $7F0002,X 
    AND.W #$F000 
    ORA.W #$00BC 
    STA.W $1E17,Y 
    AND.W #$8FFF 
    STA.L $7F0002,X 
    TYX 
    LDA.W #$0004 : STA.L $7EDE1C,X 
    SEC 
    RTS 


.deletePLM:
    LDA.W #$0000 : STA.W $1C37,Y 
    SEC 
    RTS 


Setup_Reaction_RespawningShotBlock:
    LDX.W $1C87,Y 
    LDA.L $7F0002,X 
    AND.W #$F000 
    ORA.W #$0052 
    STA.W $1E17,Y 
    AND.W #$8FFF 
    STA.L $7F0002,X 
    RTS 


Setup_Collision_RespawningBombBlock:
    LDA.W $0B3E 
    AND.W #$0F00 
    CMP.W #$0400 
    BEQ .screwOrSpeed 
    LDA.W $0A1C 
    CMP.W #$0081 
    BEQ .screwOrSpeed 
    CMP.W #$0082 
    BEQ .screwOrSpeed 
    CMP.W #$00C9 
    BEQ .screwOrSpeed 
    CMP.W #$00CA 
    BEQ .screwOrSpeed 
    CMP.W #$00CB 
    BEQ .screwOrSpeed 
    CMP.W #$00CC 
    BEQ .screwOrSpeed 
    CMP.W #$00CD 
    BEQ .screwOrSpeed 
    CMP.W #$00CE 
    BEQ .screwOrSpeed 
    LDA.W #$0000 : STA.W $1C37,Y 
    SEC 
    RTS 


.screwOrSpeed:
    LDX.W $1C87,Y 
    LDA.L $7F0002,X 
    AND.W #$F000 
    ORA.W #$0058 
    STA.W $1E17,Y 
    AND.W #$0FFF 
    STA.L $7F0002,X 
    CLC 
    RTS 


Setup_Reaction_RespawningBombBlock:
    LDX.W $0DDE 
    LDA.W $0C18,X 
    AND.W #$0F00 
    CMP.W #$0500 
    BEQ .bomb 
    CMP.W #$0300 
    BEQ .powerBomb 
    LDA.W #$0000 : STA.W $1C37,Y 
    RTS 


.powerBomb:
    LDX.W $1C87,Y 
    LDA.L $7F0002,X 
    AND.W #$F000 
    ORA.W #$0058 
    STA.W $1E17,Y 
    AND.W #$8FFF 
    STA.L $7F0002,X 
    RTS 


.bomb:
    LDA.W $1D27,Y : CLC : ADC.W #$0003 : STA.W $1D27,Y 
    LDX.W $1C87,Y 
    LDA.L $7F0002,X 
    AND.W #$F000 
    ORA.W #$0058 
    STA.W $1E17,Y 
    AND.W #$8FFF 
    STA.L $7F0002,X 
    RTS 


Setup_Reaction_RespawningPowerBombBlock:
    LDX.W $0DDE 
    LDA.W $0C18,X 
    AND.W #$0F00 
    CMP.W #$0500 
    BEQ .bomb 
    CMP.W #$0300 
    BEQ .powerBomb 
    LDA.W #$0000 : STA.W $1C37,Y 
    RTS 


.powerBomb:
    LDX.W $1C87,Y 
    LDA.L $7F0002,X 
    AND.W #$F000 
    ORA.W #$0057 
    STA.W $1E17,Y 
    AND.W #$8FFF 
    STA.L $7F0002,X 
    RTS 


.bomb:
    LDA.W #UNUSED_InstList_PLM_PowerBombBlockBombed_84C91C : STA.W $1D27,Y 
    RTS 


Setup_Reaction_SuperMissileBlock:
    LDX.W $0DDE 
    LDA.W $0C18,X 
    AND.W #$0F00 
    CMP.W #$0500 
    BEQ .bomb 
    CMP.W #$0200 
    BEQ .superMissile 
    LDA.W #$0000 : STA.W $1C37,Y 
    RTS 


.superMissile:
    LDX.W $1C87,Y 
    LDA.L $7F0002,X 
    AND.W #$F000 
    ORA.W #$009F 
    STA.W $1E17,Y 
    AND.W #$8FFF 
    STA.L $7F0002,X 
    RTS 


.bomb:
    LDA.W #UNUSED_InstList_PLM_SuperMissileBlockBombed_84C922 : STA.W $1D27,Y 
    RTS 


Setup_Reaction_SpeedCrumbleBlock:
    LDX.W $0DDE 
    LDA.W $0C18,X 
    AND.W #$0F00 
    CMP.W #$0500 
    BEQ .return 
    LDA.W #$0000 : STA.W $1C37,Y 

.return:
    RTS 


Setup_RespawningBreakableGrappleBlock:
    LDX.W $1C87,Y 
    LDA.L $7F0002,X : STA.W $1E17,Y 
    TXA 
    LSR A 
    TAX 
    LDA.L $7F6402,X : AND.W #$FF00 : STA.L $7F6402,X 

Setup_GenericGrappleBlock_SetOverflow:
    SEP #$40 
    SEC 
    RTS 


Setup_GenericGrappleBlock_ResetOverflow:
    REP #$40 
    SEC 
    RTS 


Setup_DraygonsBrokenTurret:
    LDA.W $0A4E : CLC : ADC.W #$0000 : STA.W $0A4E 
    LDA.W $0A50 : ADC.W #$0001 : STA.W $0A50 
    SEP #$40 
    SEC 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_PLMEntries_Draws1x1ShotBlock_84CFEC:
    dw Setup_Reaction_SpeedCrumbleBlock 
    dw UNUSED_InstList_PLM_Draws1x1ShotBlock_84C8D4 

UNUSED_PLMEntries_Draws1x2ShotBlock_84CFF0:
    dw Setup_Reaction_SpeedCrumbleBlock 
    dw UNUSED_InstList_PLM_Draws1x2ShotBlock_84C8DA 

UNUSED_PLMEntries_Draws2x1ShotBlock_84CFF4:
    dw Setup_Reaction_SpeedCrumbleBlock 
    dw UNUSED_InstList_PLM_Draws2x1ShotBlock_84C8E0 

UNUSED_PLMEntries_Draws2x2ShotBlock_84CFF8:
    dw Setup_Reaction_SpeedCrumbleBlock 
    dw UNUSED_InstList_PLM_Draws2x2ShotBlock_84C8E6 
endif ; !FEATURE_KEEP_UNREFERENCED

PLMEntries_1x1RespawningCrumbleBlock:
    dw Setup_Reaction_SpeedCrumbleBlock 
    dw InstList_BombReaction_PLM_1x1RespawningCrumbleBlock 

PLMEntries_2x1RespawningCrumbleBlock:
    dw Setup_Reaction_SpeedCrumbleBlock 
    dw InstList_BombReaction_PLM_2x1RespawningCrumbleBlock 

PLMEntries_1x2RespawningCrumbleBlock:
    dw Setup_Reaction_SpeedCrumbleBlock 
    dw InstList_BombReaction_PLM_1x2RespawningCrumbleBlock 

PLMEntries_2x2RespawningCrumbleBlock:
    dw Setup_Reaction_SpeedCrumbleBlock 
    dw InstList_BombReaction_PLM_2x2RespawningCrumbleBlock 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_PLMEntries_84D00C:
    dw Setup_Reaction_SpeedCrumbleBlock 
    dw UNUSED_InstList_PLM_84C904 

UNUSED_PLMEntries_84D010:
    dw Setup_Reaction_SpeedCrumbleBlock 
    dw UNUSED_InstList_PLM_84C90A 

UNUSED_PLMEntries_84D014:
    dw Setup_Reaction_SpeedCrumbleBlock 
    dw UNUSED_InstList_PLM_84C910 

UNUSED_PLMEntries_84D018:
    dw Setup_Reaction_SpeedCrumbleBlock 
    dw UNUSED_InstList_PLM_84C916 

UNUSED_PLMEntries_84D01C:
    dw Setup_Reaction_SpeedCrumbleBlock 
    dw UNUSED_InstList_PLM_PowerBombBlockBombed_84C91C 

UNUSED_PLMEntries_84D020:
    dw Setup_Reaction_SpeedCrumbleBlock 
    dw UNUSED_InstList_PLM_SuperMissileBlockBombed_84C922 
endif ; !FEATURE_KEEP_UNREFERENCED

PLMEntries_BombReaction_SpeedBoostBlock:
    dw Setup_Reaction_SpeedCrumbleBlock 
    dw InstList_PLM_BombReaction_SpeedBlock 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_PLMEntries_84D028:
    dw UNUSED_Setup_84CDC2 
    dw UNUSED_InstList_PLM_84C92E 

UNUSED_PLMEntries_84D02C:
    dw UNUSED_Setup_84CDC2 
    dw UNUSED_InstList_PLM_84C9BA 
endif ; !FEATURE_KEEP_UNREFERENCED

PLMEntries_Collision_BTS82:
    dw Setup_Collision_RespawningSpeedBoostBlock 
    dw InstList_PLM_RespawningSpeedBlock_SlowerCrumbleAnimation 

PLMEntries_Collision_BTS83:
    dw Setup_Collision_RespawningSpeedBoostBlock 
    dw InstList_PLM_SpeedBlockSlowerCrumbleAnimation 

PLMEntries_Collision_RespawningSpeedBoostBlock:
    dw Setup_Collision_RespawningSpeedBoostBlock 
    dw InstList_PLM_RespawningSpeedBoostBlock 

PLMEntries_Collision_DachoraRespawningSpeedBoostBlock:
    dw Setup_Collision_RespawningSpeedBoostBlock 
    dw InstList_PLM_RespawningSpeedBlock 

PLMEntries_Collision_SpeedBoostBlock:
    dw Setup_Collision_RespawningSpeedBoostBlock 
    dw InstList_PLM_SpeedBoostBlock 

PLMEntries_Collision_1x1RespawningCrumbleBlock:
    dw Setup_Collision_RespawningCrumbleBlock 
    dw InstList_PLM_1x1RespawningCrumbleBlock 

PLMEntries_Collision_2x1RespawningCrumbleBlock:
    dw Setup_Collision_RespawningCrumbleBlock 
    dw InstList_PLM_2x1RespawningCrumbleBlock 

PLMEntries_Collision_1x2RespawningCrumbleBlock:
    dw Setup_Collision_RespawningCrumbleBlock 
    dw InstList_PLM_1x2RespawningCrumbleBlock 

PLMEntries_Collision_2x2RespawningCrumbleBlock:
    dw Setup_Collision_RespawningCrumbleBlock 
    dw InstList_PLM_2x2RespawningCrumbleBlock 

PLMEntries_Collision_1x1CrumbleBlock:
    dw Setup_Collision_RespawningCrumbleBlock 
    dw InstList_PLM_1x1CrumbleBlock 

PLMEntries_Collision_2x1CrumbleBlock:
    dw Setup_Collision_RespawningCrumbleBlock 
    dw InstList_PLM_2x1CrumbleBlock 

PLMEntries_Collision_1x2CrumbleBlock:
    dw Setup_Collision_RespawningCrumbleBlock 
    dw InstList_PLM_1x2CrumbleBlock 

PLMEntries_Collision_2x2CrumbleBlock:
    dw Setup_Collision_RespawningCrumbleBlock 
    dw InstList_PLM_2x2CrumbleBlock 

PLMEntries_Reaction_1x1RespawningShotBlock:
    dw Setup_Reaction_RespawningShotBlock 
    dw InstList_PLM_1x1RespawningShotBlock 

PLMEntries_Reaction_2x1RespawningShotBlock:
    dw Setup_Reaction_RespawningShotBlock 
    dw InstList_PLM_2x1RespawningShotBlock 

PLMEntries_Reaction_1x2RespawningShotBlock:
    dw Setup_Reaction_RespawningShotBlock 
    dw InstList_PLM_1x2RespawningShotBlock 

PLMEntries_Reaction_2x2RespawningShotBlock:
    dw Setup_Reaction_RespawningShotBlock 
    dw InstList_PLM_2x2RespawningShotBlock 

PLMEntries_Reaction_1x1ShotBlock:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_1x1ShotBlock 

PLMEntries_Reaction_2x1ShotBlock:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_2x1ShotBlock 

PLMEntries_Reaction_1x2ShotBlock:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_1x2ShotBlock 

PLMEntries_Reaction_2x2ShotBlock:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_2x2ShotBlock 

PLMEntries_Reaction_RespawningPowerBombBlock:
    dw Setup_Reaction_RespawningPowerBombBlock 
    dw InstList_PLM_RespawningPowerBombBlock 

PLMEntries_Reaction_PowerBombBlock:
    dw Setup_Reaction_RespawningPowerBombBlock 
    dw InstList_PLM_PowerBombBlock 

PLMEntries_Reaction_RespawningSuperMissileBlock:
    dw Setup_Reaction_SuperMissileBlock 
    dw InstList_PLM_RespawningSuperMissileBlock 

PLMEntries_Reaction_SuperMissileBlock:
    dw Setup_Reaction_SuperMissileBlock 
    dw InstList_PLM_SuperMissileBlock 

PLMEntries_EnemyBreakableBlock:
    dw Setup_EnemyBreakableBlock 
    dw InstList_PLM_EnemyBreakableBlock 

PLMEntries_Collision_1x1RespawningBombBlock:
    dw Setup_Collision_RespawningBombBlock 
    dw InstList_PLM_CollisionReaction_1x1RespawningBombBlock 

PLMEntries_Collision_2x1RespawningBombBlock:
    dw Setup_Collision_RespawningBombBlock 
    dw InstList_PLM_Collision_2x1RespawningBombBlock 

PLMEntries_Collision_1x2RespawningBombBlock:
    dw Setup_Collision_RespawningBombBlock 
    dw InstList_PLM_Collision_1x2RespawningBombBlock 

PLMEntries_Collision_2x2RespawningBombBlock:
    dw Setup_Collision_RespawningBombBlock 
    dw InstList_PLM_Collision_2x2RespawningBombBlock 

PLMEntries_Collision_1x1BombBlock:
    dw Setup_Collision_RespawningBombBlock 
    dw InstList_PLM_Collision_1x1RespawningBombBlock 

PLMEntries_Collision_2x1BombBlock:
    dw Setup_Collision_RespawningBombBlock 
    dw InstList_PLM_Collision_2x1BombBlock 

PLMEntries_Collision_1x2BombBlock:
    dw Setup_Collision_RespawningBombBlock 
    dw InstList_PLM_Collision_1x2BombBlock 

PLMEntries_Collision_2x2BombBlock:
    dw Setup_Collision_RespawningBombBlock 
    dw InstList_PLM_Collision_2x2BombBlock 

PLMEntries_Reaction_1x1RespawningBombBlock:
    dw Setup_Reaction_RespawningBombBlock 
    dw InstList_PLM_Reaction_1x1RespawningBombBlock_0 

PLMEntries_Reaction_2x1RespawningBombBlock:
    dw Setup_Reaction_RespawningBombBlock 
    dw InstList_PLM_Reaction_2x1RespawningBombBlock 

PLMEntries_Reaction_1x2RespawningBombBlock:
    dw Setup_Reaction_RespawningBombBlock 
    dw InstList_PLM_Reaction_1x2RespawningBombBlock 

PLMEntries_Reaction_2x2RespawningBombBlock:
    dw Setup_Reaction_RespawningBombBlock 
    dw InstList_PLM_Reaction_2x2RespawningBombBlock 

PLMEntries_Reaction_1x1BombBlock:
    dw Setup_Reaction_RespawningBombBlock 
    dw InstList_PLM_Reaction_1x1RespawningBombBlock_4 

PLMEntries_Reaction_2x1BombBlock:
    dw Setup_Reaction_RespawningBombBlock 
    dw InstList_PLM_Reaction_2x1BombBlock 

PLMEntries_Reaction_1x2BombBlock:
    dw Setup_Reaction_RespawningBombBlock 
    dw InstList_PLM_Reaction_1x2BombBlock 

PLMEntries_Reaction_2x2BombBlock:
    dw Setup_Reaction_RespawningBombBlock 
    dw InstList_PLM_Reaction_2x2BombBlock 

PLMEntries_Grappled_GrappleBlock:
    dw Setup_GenericGrappleBlock_SetOverflow 
    dw InstList_PLM_GrappleBlock 

PLMEntries_Grappled_RespawningBreakableGrappleBlock:
    dw Setup_RespawningBreakableGrappleBlock 
    dw InstList_PLM_RespawningBreakableGrappleBlock 

PLMEntries_Grappled_BreakableGrappleBlock:
    dw Setup_RespawningBreakableGrappleBlock 
    dw InstList_PLM_BreakableGrappleBlock 

PLMEntries_Grappled_GenericSpikeBlock:
    dw Setup_GenericGrappleBlock_ResetOverflow 
    dw InstList_PLM_GrappleBlock 

PLMEntries_Grappled_DraygonsBrokenTurret:
    dw Setup_DraygonsBrokenTurret 
    dw InstList_PLM_GrappleBlock 

if !FEATURE_KEEP_UNREFERENCED
InstList_PLM_UnusedBlueBrinstarFaceBlock:
    dw $0001,DrawInst_UnusedBlueBrinstarFaceBlock 
    dw Instruction_PLM_Delete 

PLMEntries_UnusedBlueBrinstarFaceBlock:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_UnusedBlueBrinstarFaceBlock 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_PLM_CrumbleLowerNorfairChozoRoomPlug:
    dw $0004,DrawInst_Respawn1x1_0 
    dw $0004,DrawInst_Respawn1x1_1 
    dw $0004,DrawInst_Respawn1x1_2 
    dw $0001,DrawInst_Respawn1x1_3 
    dw Instruction_PLM_Delete 

Setup_CrumbleLowerNorfairChozoRoomPlug:
    LDX.W $1C87,Y 
    AND.W #$0FFF 
    STA.L $7F0002,X 
    RTS 


PLMEntries_CrumbleLowerNorfairChozoRoomPlug:
    dw Setup_CrumbleLowerNorfairChozoRoomPlug 
    dw InstList_PLM_CrumbleLowerNorfairChozoRoomPlug 

if !FEATURE_KEEP_UNREFERENCED
Setup_UnusedShotBlock:
    LDX.W $1C87,Y 
    LDA.W #$C000 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    RTS 


InstList_PLM_UnusedShotBlock:
    dw $0004,DrawInst_84A33F 
    dw Instruction_PLM_Delete 

PLMEntries_UnusedShotBlock:
    dw Setup_UnusedShotBlock 
    dw InstList_PLM_UnusedShotBlock 

Setup_UnusedGrappleBlock:
    LDX.W $1C87,Y 
    LDA.W #$E000 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    RTS 


InstList_PLM_UnusedGrappleBlock:
    dw $0001,DrawInst_BreakableGrappleBlock_0 
    dw Instruction_PLM_Delete 

PLMEntries_UnusedGrappleBlock:
    dw Setup_UnusedGrappleBlock 
    dw InstList_PLM_UnusedGrappleBlock 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_PLM_LowerNorfairChozoHand_0:
    dw Instruction_PLM_GotoY_ifEventIsSet 
    dw $000C,InstList_PLM_LowerNorfairChozoHand_1 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_DeletePLM_SpawnTriggerBlockIf_4_8_IsBlankAir 
    dw Instruction_PLM_Sleep 
    dw Instruction_PLM_Delete 

InstList_PLM_LowerNorfairChozoHand_1:
    dw Instruction_PLM_FXBaseYPosition_2D2 
    dw $0001,DrawInst_ItemChozoOrb 
    dw Instruction_PLM_Delete 

Instruction_PLM_FXBaseYPosition_2D2:
    LDA.W #$02D2 : STA.W $1978 
    RTS 


PreInstruction_DeletePLM_SpawnTriggerBlockIf_4_8_IsBlankAir:
    PHX 
    SEP #$20 
    LDA.B #$08 : STA.W $4202 
    LDA.W $07A5 : STA.W $4203 
    LDA.B #$04 
    REP #$20 
    AND.W #$00FF 
    CLC : ADC.W $4216 : ASL A 
    TAX 
    LDA.L $7F0002,X 
    CMP.W #$00FF 
    BNE .return 
    LDA.W #$B083 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    LDX.W $1C27 
    STZ.W $1C37,X 

.return:
    PLX 
    RTS 


RTS_84D18E:
    RTS 


Setup_Reaction_LowerNorfairChozoHandTrigger:
    LDA.W $09A4 
    AND.W #$0200 
    BEQ .return 
    LDA.W $0B02 
    AND.W #$000F 
    CMP.W #$0003 
    BNE .return 
    LDA.W $0A1C 
    CMP.W #$001D 
    BEQ .react 
    CMP.W #$0079 
    BEQ .react 
    CMP.W #$007A 
    BNE .return 

.react:
    LDA.W #$000C 
    JSL.L MarkEvent_inA 
    LDA.W #$0001 : STA.W $0FB4 
    LDX.W $1C87,Y 
    LDA.L $7F0002,X : AND.W #$0FFF : STA.L $7F0002,X 
    LDA.W #$0000 
    JSL.L Run_Samus_Command 
    JSL.L Spawn_Hardcoded_PLM 
    db $0C,$1D 
    dw PLMEntries_CrumbleLowerNorfairChozoRoomPlug 

.return:
    LDA.W #$0000 : STA.W $1C37,Y 
    SEC 
    RTS 


PreInstruction_PLM_IncrementPLMRoomArgIfShotByMissile:
    LDA.W $1D77,X 
    BEQ .return 
    AND.W #$0F00 
    CMP.W #$0200 
    BEQ .incRoomArg 
    CMP.W #$0100 
    BNE .return 

.incRoomArg:
    STZ.W $1D77,X 
    INC.W $1DC7,X 

.return:
    STZ.W $1D77,X 
    RTS 


InstList_PLM_MotherBrainsGlass_0:
    dw Instruction_PLM_GotoY_ifBossBitsSet 
    db $01 : dw InstList_PLM_UnusedMotherBrainsGlass_AreaBossDead 
    dw Instruction_PLM_GotoY_ifEventIsSet 
    dw $0002,InstList_PLM_UnusedMotherBrainsGlass_NoGlassState 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_IncrementPLMRoomArgIfShotByMissile 

InstList_PLM_MotherBrainsGlass_1:
    dw $0001,DrawInst_MotherBrainsGlass_0 
    dw Instruction_PLM_GotoY_IfRoomArgGreaterThanY 
    dw $0002,InstList_PLM_MotherBrainsGlass_1 

InstList_PLM_MotherBrainsGlass_2:
    dw $0001,DrawInst_MotherBrainsGlass_1 
    dw Instruction_PLM_GotoY_IfRoomArgGreaterThanY 
    dw $0004,InstList_PLM_MotherBrainsGlass_2 

InstList_PLM_MotherBrainsGlass_3:
    dw $0001,DrawInst_MotherBrainsGlass_2 
    dw Instruction_PLM_GotoY_IfRoomArgGreaterThanY 
    dw $0006,InstList_PLM_MotherBrainsGlass_3 
    dw Inst_PLM_Spawn4MotherBrainsGlassShatteringShardsWithArgs 
    dw $0000,$0000,$0000,$0000 
    dw $0004,DrawInst_MotherBrainsGlass_3 
    dw Inst_PLM_Spawn4MotherBrainsGlassShatteringShardsWithArgs 
    dw $0000,$0000,$0000,$0000 

InstList_PLM_MotherBrainsGlass_4:
    dw $0001,DrawInst_MotherBrainsGlass_3 
    dw Instruction_PLM_GotoY_IfRoomArgGreaterThanY 
    dw $0008,InstList_PLM_MotherBrainsGlass_4 

InstList_PLM_MotherBrainsGlass_5:
    dw $0001,DrawInst_MotherBrainsGlass_4 
    dw Instruction_PLM_GotoY_IfRoomArgGreaterThanY 
    dw $000A,InstList_PLM_MotherBrainsGlass_5 

InstList_PLM_MotherBrainsGlass_6:
    dw $0001,DrawInst_MotherBrainsGlass_5 
    dw Instruction_PLM_GotoY_IfRoomArgGreaterThanY 
    dw $000C,InstList_PLM_MotherBrainsGlass_6 
    dw Inst_PLM_Spawn4MotherBrainsGlassShatteringShardsWithArgs 
    dw $0002,$0002,$0002,$0002 
    dw $0004,DrawInst_MotherBrainsGlass_6 
    dw Inst_PLM_Spawn4MotherBrainsGlassShatteringShardsWithArgs 
    dw $0002,$0002,$0002,$0002 

InstList_PLM_MotherBrainsGlass_7:
    dw $0001,DrawInst_MotherBrainsGlass_6 
    dw Instruction_PLM_GotoY_IfRoomArgGreaterThanY 
    dw $000E,InstList_PLM_MotherBrainsGlass_7 
    dw Inst_PLM_Spawn4MotherBrainsGlassShatteringShardsWithArgs 
    dw $0000,$0000,$0002,$0002 
    dw $0004,DrawInst_MotherBrainsGlass_7 
    dw Inst_PLM_Spawn4MotherBrainsGlassShatteringShardsWithArgs 
    dw $0004,$0004,$0004,$0004 

InstList_PLM_MotherBrainsGlass_8:
    dw $0001,DrawInst_MotherBrainsGlass_7 
    dw Instruction_PLM_GotoY_IfRoomArgGreaterThanY 
    dw $0010,InstList_PLM_MotherBrainsGlass_8 
    dw Inst_PLM_Spawn4MotherBrainsGlassShatteringShardsWithArgs 
    dw $0002,$0002,$0004,$0004 
    dw $0004,DrawInst_MotherBrainsGlass_8 
    dw Inst_PLM_Spawn4MotherBrainsGlassShatteringShardsWithArgs 
    dw $0002,$0002,$0004,$0004 

InstList_PLM_MotherBrainsGlass_9:
    dw $0001,DrawInst_MotherBrainsGlass_8 
    dw Instruction_PLM_GotoY_IfRoomArgGreaterThanY 
    dw $0012,InstList_PLM_MotherBrainsGlass_9 
    dw Inst_PLM_Spawn4MotherBrainsGlassShatteringShardsWithArgs 
    dw $0002,$0002,$0004,$0004 
    dw $0004,DrawInst_MotherBrainsGlass_9 
    dw Inst_PLM_Spawn4MotherBrainsGlassShatteringShardsWithArgs 
    dw $0002,$0002,$0004,$0004 
    dw $0030,DrawInst_MotherBrainsGlass_9 
    dw Instruction_PLM_SetTheEvent,$0002 
    dw Instruction_PLM_Delete 

InstList_PLM_UnusedMotherBrainsGlass_AreaBossDead:
    dw $0001,UNUSED_DrawInst_849817 
    dw Instruction_PLM_Delete 

InstList_PLM_UnusedMotherBrainsGlass_NoGlassState:
    dw $0001,DrawInst_MotherBrainsGlass_9 
    dw Instruction_PLM_Delete 

Instruction_PLM_GotoY_IfRoomArgGreaterThanY:
    LDA.W $1DC7,X 
    CMP.W $0000,Y 
    BCS .next 
    LDA.W $0002,Y 
    TAY 
    RTS 


.next:
    INY #4
    RTS 


Inst_PLM_Spawn4MotherBrainsGlassShatteringShardsWithArgs:
    LDA.W #$002E 
    JSL.L QueueSound_Lib3_Max15 
    LDA.W $0000,Y 
    JSR.W Spawn4MotherBrainsGlassShatteringShardsWithArgA 
    LDA.W $0002,Y 
    JSR.W Spawn4MotherBrainsGlassShatteringShardsWithArgA 
    LDA.W $0004,Y 
    JSR.W Spawn4MotherBrainsGlassShatteringShardsWithArgA 
    LDA.W $0006,Y 
    JSR.W Spawn4MotherBrainsGlassShatteringShardsWithArgA 
    TYA 
    CLC : ADC.W #$0008 : TAY 
    RTS 


Spawn4MotherBrainsGlassShatteringShardsWithArgA:
    PHY 
    LDY.W #EnemyProjectile_MotherBrainGlassShattering_Shard 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    PLY 
    RTS 


PreInstruction_PLM_WakePLMIfSamusHasBombs:
    LDA.W $09A4 
    AND.W #$1000 
    BEQ .return 
    LDA.W #$0001 : STA.L $7EDE1C,X 
    INC.W $1D27,X 
    INC.W $1D27,X 
    LDA.W #.return : STA.W $1CD7,X 

.return:
    RTS 


Instruction_PLM_SpawnBombTorizoStatueBreakingWIthArgY:
    PHX 
    PHY 
    LDA.W $0000,Y 
    LDY.W #EnemyProjectile_BombTorizoStatueBreaking 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    PLY 
    PLX 
    INY #2
    RTS 


InstList_PLM_BombTorizosCrumblingChozo:
    dw $0001,DrawInst_BombTorizosCrumblingChozo_0 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_WakePLMIfSamusHasBombs 
    dw Instruction_PLM_Sleep 
    dw $0078,DrawInst_BombTorizosCrumblingChozo_0 
    dw Instruction_PLM_TransferBytesToVRAM 
    dw $0400 : dl Tiles_BombTorizosCrumblingChozo : dw $6E00 
    dw $0060,DrawInst_BombTorizosCrumblingChozo_0 
    dw Instruction_PLM_SpawnBombTorizoStatueBreakingWIthArgY,$0000 
    dw $0030,DrawInst_BombTorizosCrumblingChozo_0 
    dw Instruction_PLM_SpawnBombTorizoStatueBreakingWIthArgY,$0002 
    dw $000F,DrawInst_BombTorizosCrumblingChozo_0 
    dw Instruction_PLM_SpawnBombTorizoStatueBreakingWIthArgY,$0004 
    dw $000E,DrawInst_BombTorizosCrumblingChozo_0 
    dw Instruction_PLM_SpawnBombTorizoStatueBreakingWIthArgY,$0006 
    dw $000D,DrawInst_BombTorizosCrumblingChozo_0 
    dw Instruction_PLM_SpawnBombTorizoStatueBreakingWIthArgY,$0008 
    dw $000C,DrawInst_BombTorizosCrumblingChozo_0 
    dw Instruction_PLM_SpawnBombTorizoStatueBreakingWIthArgY,$000A 
    dw $000B,DrawInst_BombTorizosCrumblingChozo_0 
    dw Instruction_PLM_SpawnBombTorizoStatueBreakingWIthArgY,$000C 
    dw $000A,DrawInst_BombTorizosCrumblingChozo_0 
    dw Instruction_PLM_SpawnBombTorizoStatueBreakingWIthArgY,$000E 
    dw $0001,DrawInst_BombTorizosCrumblingChozo_1 
    dw Instruction_PLM_QueueSong1MusicTrack 
    dw Instruction_PLM_Delete 

Instruction_PLM_QueueSong1MusicTrack:
    LDA.W #$0006 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    RTS 


InstList_PLM_ClearSlopeAccessForWreckedShipChozo:
    dw $0001,DrawInst_ClearSlopeAccessForWreckedShipChozo 
    dw Instruction_PLM_TransformWreckedShipChozosSpikesIntoSlopes 
    dw Instruction_PLM_Delete 

Instruction_PLM_TransformWreckedShipChozosSpikesIntoSlopes:
    PHX 
    LDX.W #$1608 
    LDA.W #$1012 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    LDX.W #$160A 
    LDA.W #$1013 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    PLX 
    RTS 


InstList_PLM_BlockSlopeAccessForWreckedShipChozo:
    dw $0001,DrawInst_BlockSlopeAccessForWreckedShipChozo 
    dw Instruction_PLM_RevertWreckedShipChozosSlopesIntoSpikes 
    dw Instruction_PLM_Delete 

Instruction_PLM_RevertWreckedShipChozosSlopesIntoSpikes:
    PHX 
    LDX.W #$1608 
    LDA.W #$A000 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    LDX.W #$160A 
    LDA.W #$A000 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    PLX 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_PreInst_PLM_GotoToLinkInstructionIfBombed_84D409:
    LDA.W $1D77,X 
    AND.W #$0F00 
    CMP.W #$0500 
    BNE .clearShotStatus 
    LDA.L $7EDEBC,X : STA.W $1D27,X 
    LDA.W #$0001 : STA.L $7EDE1C,X 

.clearShotStatus:
    STZ.W $1D77,X 
    RTS 


UNUSED_InstList_PLM_WreckedShip3x4ChozoBombBlock_84D426:
    dw Instruction_PLM_GotoY_ifRoomArg_ChozoBlockDestroyed 
    dw UNUSED_InstList_PLM_WreckedShip3x4ChozoBombBlock_84D448 
    dw Instruction_PLM_LinkInstruction_Y 
    dw UNUSED_InstList_PLM_WreckedShip3x4ChozoBombBlock_84D43A 
    dw Instruction_PLM_PreInstruction_inY 
    dw UNUSED_PreInst_PLM_GotoToLinkInstructionIfBombed_84D409 

UNUSED_InstList_PLM_WreckedShip3x4ChozoBombBlock_84D432:
    dw $0077,UNUSED_DrawInst_WreckedShip3x4ChozoBombBlock_0_849D59 
    dw Instruction_PLM_GotoY 
    dw UNUSED_InstList_PLM_WreckedShip3x4ChozoBombBlock_84D432 

UNUSED_InstList_PLM_WreckedShip3x4ChozoBombBlock_84D43A:
    dw Instruction_PLM_SetRoomArg_ChozoBlockDestroyed 
    dw $0004,UNUSED_DrawInst_WreckedShip3x4ChozoBombBlock_1_849D7D 
    dw $0004,UNUSED_DrawInst_WreckedShip3x4ChozoBombBlock_2_849DA1 
    dw $0004,UNUSED_DrawInst_WreckedShip3x4ChozoBombBlock_3_849DC5 

UNUSED_InstList_PLM_WreckedShip3x4ChozoBombBlock_84D448:
    dw $0004,UNUSED_DrawInst_WreckedShip3x4ChozoBombBlock_4_849DE9 
    dw Instruction_PLM_Delete 

UNUSED_InstList_PLM_AlternateLowerNorfairChozoHand_84D44E:
    dw Instruction_PLM_GotoY_ifEventIsSet 
    dw $000C,UNUSED_InstList_PLM_AlternateLowerNorfairChozoHand_84D46E 
    dw Instruction_PLM_LinkInstruction_Y 
    dw UNUSED_InstList_PLM_AlternateLowerNorfairChozoHand_84D462 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfHitWithPowerBomb 
    dw $0001,UNUSED_DrawInst_AlternateLowerNorfairChozoHand_849CA7 
    dw Instruction_PLM_Sleep 

UNUSED_InstList_PLM_AlternateLowerNorfairChozoHand_84D462:
    dw $0001,UNUSED_DrawInst_AlternateLowerNorfairChozoHand_849CBF 
    dw UNUSED_Instruction_PLM_DrainAcidLake_84D476 
    dw Instruction_PLM_SetTheEvent,$000C 
    dw Instruction_PLM_Delete 

UNUSED_InstList_PLM_AlternateLowerNorfairChozoHand_84D46E:
    dw UNUSED_Instruction_PLM_FXBaseYPosition_2D2_84D489 
    dw $0001,UNUSED_DrawInst_AlternateLowerNorfairChozoHand_849CBF 
    dw Instruction_PLM_Delete 

UNUSED_Instruction_PLM_DrainAcidLake_84D476:
    LDA.W #$02D2 : STA.W $197A 
    LDA.W #$0070 : STA.W $197C 
    LDA.W #$0020 : STA.W $1980 
    RTS 


UNUSED_Instruction_PLM_FXBaseYPosition_2D2_84D489:
    LDA.W #$02D2 : STA.W $1978 
    RTS 


InstList_PLM_UnusedLowerNorfair2x2ChozoShotBlock_84D490:
    dw Instruction_PLM_GotoY_ifRoomArg_ChozoBlockDestroyed 
    dw InstList_PLM_UnusedLowerNorfair2x2ChozoShotBlock_84D4B8 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_UnusedLowerNorfair2x2ChozoShotBlock_84D4A2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfShot 
    dw $0001,UNUSED_DrawInst_LowerNorfair2x2ChozoShotBlock_849B0B 
    dw Instruction_PLM_Sleep 

InstList_PLM_UnusedLowerNorfair2x2ChozoShotBlock_84D4A2:
    dw $0004,UNUSED_DrawInst_LowerNorfair2x2ChozoShotBlock_849B1B 
    dw $0004,UNUSED_DrawInst_LowerNorfair2x2ChozoShotBlock_849B2B 
    dw $0004,UNUSED_DrawInst_LowerNorfair2x2ChozoShotBlock_849B3B 
    dw $0001,UNUSED_DrawInst_LowerNorfair2x2ChozoShotBlock_849B4B 
    dw Instruction_PLM_SetRoomArg_ChozoBlockDestroyed 
    dw RTS_84D4BE 
    dw Instruction_PLM_Delete 

InstList_PLM_UnusedLowerNorfair2x2ChozoShotBlock_84D4B8:
    dw $0001,UNUSED_DrawInst_LowerNorfair2x2ChozoShotBlock_849B4B 
    dw Instruction_PLM_Delete 
endif ; !FEATURE_KEEP_UNREFERENCED

RTS_84D4BE:
    RTS 


PreInstruction_PLM_WakePLMIf_A_B_X_Y_Left_Right:
    LDA.B $8F 
    AND.W #$C3C0 
    BEQ .return 
    LDA.W #$0001 : STA.L $7EDE1C,X 
    INC.W $1D27,X 
    INC.W $1D27,X 

.return:
    RTS 


InstList_PLM_NoobTube_0:
    dw Instruction_PLM_GotoY_ifEventIsSet 
    dw $000B,InstList_PLM_NoobTube_4 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_NoobTube_1 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfHitWithPowerBomb 
    dw $0001,DrawInst_NoobTube_0 
    dw Instruction_PLM_Sleep 

InstList_PLM_NoobTube_1:
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_NoobTube_2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_WakePLMIf_A_B_X_Y_Left_Right 
    dw Instruction_PLM_Sleep 

InstList_PLM_NoobTube_2:
    dw Instruction_PLM_ClearPreInstruction 
    dw Instruction_PLM_LockSamus 
    dw Instruction_PLM_SpawnNoobTubeCrackEnemyProjectile 
    dw $0030,DrawInst_NoobTube_1 
    dw $0001,DrawInst_NoobTube_5 
    dw $0001,DrawInst_NoobTube_6 
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6 : db $1A 
    dw Inst_PLM_SpawnANoobTubeShards_6NoobTubeReleasedAirBubbles 
    dw Instruction_PLM_TriggerNoobTubeEarthquake 
    dw $0060,DrawInst_NoobTube_2 
    dw Instruction_PLM_SetTheEvent,$000B 
    dw Instruction_PLM_EnableWaterPhysics 
    dw Instruction_PLM_UnlockSamus 
    dw Instruction_PLM_Delete 

InstList_PLM_NoobTube_3:
    dw $0001,DrawInst_NoobTube_3 
    dw $0001,DrawInst_NoobTube_4 

InstList_PLM_NoobTube_4:
    dw Instruction_PLM_EnableWaterPhysics 
    dw Instruction_PLM_Delete 

Instruction_PLM_EnableWaterPhysics:
    LDA.W #$0004 
    TRB.W $197E 
    RTS 


Instruction_PLM_SpawnNoobTubeCrackEnemyProjectile:
    PHY 
    LDY.W #EnemyProjectile_NoobTubeCrack 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    PLY 
    RTS 


Instruction_PLM_TriggerNoobTubeEarthquake:
    LDA.W #$000B : STA.W $183E 
    LDA.W #$0040 : STA.W $1840 
    RTS 


Inst_PLM_SpawnANoobTubeShards_6NoobTubeReleasedAirBubbles:
    PHY 
    LDA.W #$0000 
    LDY.W #EnemyProjectile_NoobTubeShard 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #$0002 
    LDY.W #EnemyProjectile_NoobTubeShard 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #$0004 
    LDY.W #EnemyProjectile_NoobTubeShard 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #$0006 
    LDY.W #EnemyProjectile_NoobTubeShard 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #$0008 
    LDY.W #EnemyProjectile_NoobTubeShard 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #$000A 
    LDY.W #EnemyProjectile_NoobTubeShard 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #$000C 
    LDY.W #EnemyProjectile_NoobTubeShard 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #$000E 
    LDY.W #EnemyProjectile_NoobTubeShard 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #$0010 
    LDY.W #EnemyProjectile_NoobTubeShard 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #$0012 
    LDY.W #EnemyProjectile_NoobTubeShard 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #$0000 
    LDY.W #EnemyProjectile_NoobTubeAirBubbles 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #$0002 
    LDY.W #EnemyProjectile_NoobTubeAirBubbles 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #$0004 
    LDY.W #EnemyProjectile_NoobTubeAirBubbles 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #$0006 
    LDY.W #EnemyProjectile_NoobTubeAirBubbles 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #$0008 
    LDY.W #EnemyProjectile_NoobTubeAirBubbles 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #$000A 
    LDY.W #EnemyProjectile_NoobTubeAirBubbles 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    PLY 
    RTS 


Instruction_PLM_LockSamus:
    LDA.W #$0000 
    JSL.L Run_Samus_Command 
    RTS 


Instruction_PLM_UnlockSamus:
    LDA.W #$0001 
    JSL.L Run_Samus_Command 
    RTS 


Setup_MotherBrainsGlass:
; A draw instruction changes the PLM block type to shot block, making this a generic shot trigger
    LDA.W #$0000 ;\
    STA.W $1DC7,Y ;} Clear PLM room argument (used as hit counter)
    LDX.W $1C87,Y ;\
    LDA.W #$8044 ;} Make PLM solid block with BTS 44h
    JSR.W Write_Level_Data_Block_Type_and_BTS ;/
    RTS 


Setup_BombTorizosCrumblingChozo:
    LDA.W #$0004 
    JSL.L CheckIfBossBitsForCurrentAreaMatchAnyBitsInA 
    BCC .return 
    LDA.W #$0000 : STA.W $1C37,Y 

.return:
    RTS 


Setup_WreckedShipChozoHand:
    LDX.W $1C87,Y 
    LDA.W #$B080 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    RTS 


Setup_Collision_WreckedShipChozoHandTrigger:
    LDA.W #$0001 
    JSL.L CheckIfBossBitsForCurrentAreaMatchAnyBitsInA 
    BCC .return 
    LDA.W $0B02 
    AND.W #$000F 
    CMP.W #$0003 
    BNE .return 
    LDA.W $0A1C 
    CMP.W #$001D 
    BEQ .trigger 
    CMP.W #$0079 
    BEQ .trigger 
    CMP.W #$007A 
    BNE .return 

.trigger:
    LDA.W #$0001 : STA.W $0FB4 
    LDA.W #$0202 : STA.L $7ECD27 
    LDA.W #$0101 : STA.L $7ECD2D 
    LDX.W $1C87,Y 
    LDA.L $7F0002,X : AND.W #$0FFF : STA.L $7F0002,X 
    LDA.W #$0000 
    JSL.L Run_Samus_Command 
    JSL.L Spawn_Hardcoded_PLM 
    db $17,$1D 
    dw PLMEntries_ClearSlopeAccessForWreckedShipChozo 

.return:
    LDA.W #$0000 : STA.W $1C37,Y 
    SEC 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
Setup_UnusedWreckedShip3x4ChozoBombBlock:
    LDX.W $1C87,Y 
    LDA.W #$0044 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    RTS 


Setup_UnusedAlternateLowerNorfairChozoHand:
    LDX.W $1C87,Y 
    LDA.W #$8044 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    RTS 


Setup_UnusedLowerNorfair2x2ChozoShotBlock:
    LDX.W $1C87,Y 
    LDA.W #$8044 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    LDX.W $1C87,Y 
    INX #2
    LDA.W #$50FF 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    LDA.W $1C87,Y : CLC : ADC.W $07A5 : ADC.W $07A5 : TAX 
    LDA.W #$D0FF 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    LDA.W $1C87,Y : CLC : ADC.W $07A5 : ADC.W $07A5 : TAX 
    INX #2
    LDA.W #$D0FF 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Setup_NoobTube:
    LDX.W $1C87,Y 
    LDA.W #$8044 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    RTS 


PLMEntries_LowerNorfairChozoHand:
    dw RTS_84D18E 
    dw InstList_PLM_LowerNorfairChozoHand_0 

PLMEntries_Collision_LowerNorfairChozoHandCheck:
    dw Setup_Reaction_LowerNorfairChozoHandTrigger 
    dw InstList_PLM_Delete 

PLMEntries_MotherBrainsGlass:
    dw Setup_MotherBrainsGlass 
    dw InstList_PLM_MotherBrainsGlass_0 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_PLMEntries_MotherBrainsGlass_AreaBossDead_84D6E2:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_UnusedMotherBrainsGlass_AreaBossDead 

UNUSED_PLMEntries_MotherBrainsGlass_NoGlassState_84D6E6:
    dw Setup_DeactivatePLM 
    dw InstList_PLM_UnusedMotherBrainsGlass_NoGlassState 
endif ; !FEATURE_KEEP_UNREFERENCED

PLMEntries_BombTorizosCrumblingChozo:
    dw Setup_BombTorizosCrumblingChozo 
    dw InstList_PLM_BombTorizosCrumblingChozo 

PLMEntries_WreckedShipChozoHand:
    dw Setup_WreckedShipChozoHand 
    dw InstList_PLM_Delete 

PLMEntries_Collision_WreckedShipChozoHandCheck:
    dw Setup_Collision_WreckedShipChozoHandTrigger 
    dw InstList_PLM_Delete 

RTS_84D6F6:
    RTS 


RTS_84D6F7:
    RTS 


PLMEntries_ClearSlopeAccessForWreckedShipChozo:
    dw RTS_84D6F6 
    dw InstList_PLM_ClearSlopeAccessForWreckedShipChozo 

PLMEntries_BlockSlopeAccessForWreckedShipChozo:
    dw RTS_84D6F7 
    dw InstList_PLM_BlockSlopeAccessForWreckedShipChozo 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_PLMEntries_WreckedShip3x4ChozoShotBlock_84D700:
    dw Setup_UnusedWreckedShip3x4ChozoBombBlock 
    dw UNUSED_InstList_PLM_WreckedShip3x4ChozoBombBlock_84D426 

UNUSED_PLMEntries_AltLowerNorfairChozoHand_84D704:
    dw Setup_UnusedAlternateLowerNorfairChozoHand 
    dw UNUSED_InstList_PLM_AlternateLowerNorfairChozoHand_84D44E 

UNUSED_PLMEntries_LowerNorfair2x2ChozoShotBlock_84D708:
    dw Setup_UnusedLowerNorfair2x2ChozoShotBlock 
    dw InstList_PLM_UnusedLowerNorfair2x2ChozoShotBlock_84D490 
endif ; !FEATURE_KEEP_UNREFERENCED

PLMEntries_NoobTube:
    dw Setup_NoobTube 
    dw InstList_PLM_NoobTube_0 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_PreInst_PLM_WakePLMIfSamusIsWithin4Blocks_84D710:
    JSL.L Calculate_PLM_Block_Coordinates 
    LDA.W $0AF6 
    LSR #4
    SEC : SBC.W $1C29 : BPL + 
    EOR.W #$FFFF 
    INC A 

  + CMP.W #$0004 
    BEQ + 
    BCS .return 

  + LDA.W $0AFA 
    LSR #4
    SEC : SBC.W $1C2B : BPL + 
    EOR.W #$FFFF 
    INC A 

  + CMP.W #$0004 
    BEQ + 
    BCS .return 

  + LDA.L $7EDEBC,X : STA.W $1D27,X 
    LDA.W #$0001 : STA.L $7EDE1C,X 

.return:
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


PreInstruction_PLM_WakePLMIfRoomArgDoorIsSet:
    TXY 
    LDA.W $1DC7,X 
    JSL.L BitIndexToByteIndexAndBitmask 
    LDA.L $7ED8B0,X 
    AND.W $05E7 
    BEQ .return 
    TYX 
    LDA.W #.return : STA.W $1CD7,X 
    LDA.L $7EDEBC,X : STA.W $1D27,X 
    LDA.W #$0001 : STA.L $7EDE1C,X 

.return:
    RTS 


Instruction_PLM_ShootEyeDoorProjectileWithEnemyProjArgY:
    LDA.W $0000,Y 
    PHY 
    LDY.W #EnemyProjectile_EyeDoorProjectile 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #$004C 
    JSL.L QueueSound_Lib2_Max6 
    PLY 
    INY #2
    RTS 


Instruction_PLM_SpawnEyeDoorSweatEnemyProjectileWithArgY:
    LDA.W $0000,Y 
    PHY 
    LDY.W #EnemyProjectile_EyeDoorSweat 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    PLY 
    INY #2
    RTS 


Instruction_PLM_Spawn2EyeDoorSmokeEnemyProjectiles:
    PHY 
    LDA.W #$030A 
    LDY.W #EnemyProjectile_MiscDustPLM 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #$030A 
    LDY.W #EnemyProjectile_MiscDustPLM 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    PLY 
    RTS 


Instruction_PLM_SpawnEyeDoorSweatDropProjectile:
    PHY 
    LDA.W #$000B 
    LDY.W #EnemyProjectile_MiscDustPLM 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    PLY 
    RTS 


Instruction_PLM_MovePLMUp1Row_MakeABlueDoorFacingRight:
    PHX 
    LDA.W $1C87,X : SEC : SBC.W $07A5 : SBC.W $07A5 : STA.W $1C87,X 
    TAX 
    LDA.W #$C041 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    BRA Create3BlockVerticalExtension 


Instruction_PLM_MovePLMUp1Row_MakeABlueDoorFacingLeft:
    PHX 
    LDA.W $1C87,X : SEC : SBC.W $07A5 : SBC.W $07A5 : STA.W $1C87,X 
    TAX 
    LDA.W #$C040 
    JSR.W Write_Level_Data_Block_Type_and_BTS 

Create3BlockVerticalExtension:
    TXA 
    CLC : ADC.W $07A5 : ADC.W $07A5 : TAX 
    LDA.W #$D0FF 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    TXA 
    CLC : ADC.W $07A5 : ADC.W $07A5 : TAX 
    LDA.W #$D0FE 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    TXA 
    CLC : ADC.W $07A5 : ADC.W $07A5 : TAX 
    LDA.W #$D0FD 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    PLX 
    RTS 


InstList_PLM_EyeDoorEyeFacingLeft_0:
    dw Instruction_PLM_GotoY_ifRoomArg_DoorIsSet 
    dw InstList_PLM_EyeDoorEyeFacingLeft_8 

InstList_PLM_EyeDoorEyeFacingLeft_1:
    dw $0004,DrawInst_EyeDoorEyeFacingLeft_1 
    dw Instruction_PLM_GotoY_ifSamusIsWithin_YColumnsRowsOfPLM 
    db $06,$04 : dw InstList_PLM_EyeDoorEyeFacingLeft_2 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_EyeDoorEyeFacingLeft_1 

InstList_PLM_EyeDoorEyeFacingLeft_2:
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_EyeDoorEyeFacingLeft_5 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfShotWithAMissile 
    dw $0008,DrawInst_EyeDoorEyeFacingLeft_2 

InstList_PLM_EyeDoorEyeFacingLeft_3:
    dw Instruction_PLM_GotoY_ifSamusIsWithin_YColumnsRowsOfPLM 
    db $01,$04 : dw InstList_PLM_EyeDoorEyeFacingLeft_4 
    dw $0040,DrawInst_EyeDoorEyeFacingLeft_3 
    dw Instruction_PLM_ShootEyeDoorProjectileWithEnemyProjArgY,$0000 
    dw $0020,DrawInst_EyeDoorEyeFacingLeft_3 
    dw Instruction_PLM_ShootEyeDoorProjectileWithEnemyProjArgY,$0000 
    dw $0020,DrawInst_EyeDoorEyeFacingLeft_3 
    dw Instruction_PLM_ShootEyeDoorProjectileWithEnemyProjArgY,$0000 
    dw $0040,DrawInst_EyeDoorEyeFacingLeft_3 
    dw $0006,DrawInst_EyeDoorEyeFacingLeft_2 
    dw $0030,DrawInst_EyeDoorEyeFacingLeft_1 
    dw $0030,DrawInst_EyeDoorEyeFacingLeft_1 
    dw $0006,DrawInst_EyeDoorEyeFacingLeft_2 
    dw Instruction_PLM_GotoY_ifSamusIsWithin_YColumnsRowsOfPLM 
    db $06,$04 : dw InstList_PLM_EyeDoorEyeFacingLeft_3 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_EyeDoorEyeFacingLeft_1 

InstList_PLM_EyeDoorEyeFacingLeft_4:
    dw $0004,DrawInst_EyeDoorEyeFacingLeft_1 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_EyeDoorEyeFacingLeft_3 

InstList_PLM_EyeDoorEyeFacingLeft_5:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6 : db $09 
    dw Instruction_PLM_Spawn2EyeDoorSmokeEnemyProjectiles 
    dw Instruction_PLM_Spawn2EyeDoorSmokeEnemyProjectiles 
    dw Instruction_PLM_IncDoorHit_SetRoomArgDoor_GotoY 
    db $03 : dw InstList_PLM_EyeDoorEyeFacingLeft_6 
    dw $0002,DrawInst_EyeDoorEyeFacingLeft_4 
    dw $0002,DrawInst_EyeDoorEyeFacingLeft_5 
    dw Instruction_PLM_Spawn2EyeDoorSmokeEnemyProjectiles 
    dw $0002,DrawInst_EyeDoorEyeFacingLeft_4 
    dw $0002,DrawInst_EyeDoorEyeFacingLeft_5 
    dw $0002,DrawInst_EyeDoorEyeFacingLeft_4 
    dw Instruction_PLM_Spawn2EyeDoorSmokeEnemyProjectiles 
    dw $0002,DrawInst_EyeDoorEyeFacingLeft_5 
    dw $0004,DrawInst_EyeDoorEyeFacingLeft_2 
    dw $0008,DrawInst_EyeDoorEyeFacingLeft_1 
    dw Instruction_PLM_SpawnEyeDoorSweatEnemyProjectileWithArgY,$0000 
    dw $0038,DrawInst_EyeDoorEyeFacingLeft_1 
    dw $0004,DrawInst_EyeDoorEyeFacingLeft_2 
    dw $0004,DrawInst_EyeDoorEyeFacingLeft_5 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_EyeDoorEyeFacingLeft_3 

InstList_PLM_EyeDoorEyeFacingLeft_6:
    dw Instruction_PLM_ClearPreInstruction 
    dw Instruction_PLM_SpawnEyeDoorSweatDropProjectile 
    dw Instruction_PLM_SpawnEyeDoorSweatDropProjectile 
    dw Instruction_PLM_Spawn2EyeDoorSmokeEnemyProjectiles 
    dw Instruction_PLM_Spawn2EyeDoorSmokeEnemyProjectiles 
    dw Instruction_PLM_MovePLMUp1Row_MakeABlueDoorFacingLeft 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $0A 

InstList_PLM_EyeDoorEyeFacingLeft_7:
    dw $0003,DrawInst_EyeDoorEyeFacingLeft_0 
    dw $0004,DrawInst_EyeDoorEyeFacingLeft 
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero 
    dw InstList_PLM_EyeDoorEyeFacingLeft_7 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_ClosedBlueDoorFacingLeft_40 

InstList_PLM_EyeDoorEyeFacingLeft_8:
    dw Instruction_PLM_MovePLMUp1Row_MakeABlueDoorFacingLeft 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_ClosedBlueDoorFacingLeft_40 

InstList_PLM_EyeDoorFacingLeft_0:
    dw Instruction_PLM_GotoY_ifRoomArg_DoorIsSet 
    dw InstList_PLM_EyeDoorFacingLeft_4 

InstList_PLM_EyeDoorFacingLeft_1:
    dw Instruction_PLM_GotoY_ifSamusIsWithin_YColumnsRowsOfPLM 
    db $06,$10 : dw InstList_PLM_EyeDoorFacingLeft_2 
    dw $0008,DrawInst_EyeDoorFacingLeft_0 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_EyeDoorFacingLeft_1 

InstList_PLM_EyeDoorFacingLeft_2:
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_EyeDoorFacingLeft_4 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_WakePLMIfRoomArgDoorIsSet 

InstList_PLM_EyeDoorFacingLeft_3:
    dw $0008,DrawInst_EyeDoorFacingLeft_0 
    dw $0008,DrawInst_EyeDoorFacingLeft_1 
    dw $0008,DrawInst_EyeDoorFacingLeft_2 
    dw $0008,DrawInst_EyeDoorFacingLeft_1 
    dw Instruction_PLM_GotoY_ifSamusIsWithin_YColumnsRowsOfPLM 
    db $06,$10 : dw InstList_PLM_EyeDoorFacingLeft_3 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_EyeDoorFacingLeft_1 

InstList_PLM_EyeDoorFacingLeft_4:
    dw Instruction_PLM_Delete 

InstList_PLM_EyeDoorBottomFacingLeft_0:
    dw Instruction_PLM_GotoY_ifRoomArg_DoorIsSet 
    dw InstList_PLM_EyeDoorBottomFacingLeft_4 

InstList_PLM_EyeDoorBottomFacingLeft_1:
    dw Instruction_PLM_GotoY_ifSamusIsWithin_YColumnsRowsOfPLM 
    db $06,$10 : dw InstList_PLM_EyeDoorBottomFacingLeft_2 
    dw $0008,DrawInst_EyeDoorBottomFacingLeft_0 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_EyeDoorBottomFacingLeft_1 

InstList_PLM_EyeDoorBottomFacingLeft_2:
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_EyeDoorBottomFacingLeft_4 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_WakePLMIfRoomArgDoorIsSet 

InstList_PLM_EyeDoorBottomFacingLeft_3:
    dw $0008,DrawInst_EyeDoorBottomFacingLeft_0 
    dw $0008,DrawInst_EyeDoorBottomFacingLeft_1 
    dw $0008,DrawInst_EyeDoorBottomFacingLeft_2 
    dw $0008,DrawInst_EyeDoorBottomFacingLeft_1 
    dw Instruction_PLM_GotoY_ifSamusIsWithin_YColumnsRowsOfPLM 
    db $06,$10 : dw InstList_PLM_EyeDoorBottomFacingLeft_3 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_EyeDoorBottomFacingLeft_1 

InstList_PLM_EyeDoorBottomFacingLeft_4:
    dw Instruction_PLM_Delete 

InstList_PLM_EyeDoorEyeFacingRight_0:
    dw Instruction_PLM_GotoY_ifRoomArg_DoorIsSet 
    dw InstList_PLM_EyeDoorEyeFacingRight_8 

InstList_PLM_EyeDoorEyeFacingRight_1:
    dw $0004,DrawInst_EyeDoorEyeFacingRight_1 
    dw Instruction_PLM_GotoY_ifSamusIsWithin_YColumnsRowsOfPLM 
    db $06,$04 : dw InstList_PLM_EyeDoorEyeFacingRight_2 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_EyeDoorEyeFacingRight_1 

InstList_PLM_EyeDoorEyeFacingRight_2:
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_EyeDoorEyeFacingRight_5 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfShotWithAMissile 
    dw $0008,DrawInst_EyeDoorEyeFacingRight_2 

InstList_PLM_EyeDoorEyeFacingRight_3:
    dw Instruction_PLM_GotoY_ifSamusIsWithin_YColumnsRowsOfPLM 
    db $01,$04 : dw InstList_PLM_EyeDoorEyeFacingRight_4 
    dw $0040,DrawInst_EyeDoorEyeFacingRight_3 
    dw Instruction_PLM_ShootEyeDoorProjectileWithEnemyProjArgY,$0014 
    dw $0020,DrawInst_EyeDoorEyeFacingRight_3 
    dw Instruction_PLM_ShootEyeDoorProjectileWithEnemyProjArgY,$0014 
    dw $0020,DrawInst_EyeDoorEyeFacingRight_3 
    dw Instruction_PLM_ShootEyeDoorProjectileWithEnemyProjArgY,$0014 
    dw $0040,DrawInst_EyeDoorEyeFacingRight_3 
    dw $0006,DrawInst_EyeDoorEyeFacingRight_2 
    dw $0030,DrawInst_EyeDoorEyeFacingRight_1 
    dw $0030,DrawInst_EyeDoorEyeFacingRight_1 
    dw $0006,DrawInst_EyeDoorEyeFacingRight_2 
    dw Instruction_PLM_GotoY_ifSamusIsWithin_YColumnsRowsOfPLM 
    db $06,$04 : dw InstList_PLM_EyeDoorEyeFacingRight_3 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_EyeDoorEyeFacingRight_1 

InstList_PLM_EyeDoorEyeFacingRight_4:
    dw $0004,DrawInst_EyeDoorEyeFacingRight_1 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_EyeDoorEyeFacingRight_3 

InstList_PLM_EyeDoorEyeFacingRight_5:
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6 : db $09 
    dw Instruction_PLM_Spawn2EyeDoorSmokeEnemyProjectiles 
    dw Instruction_PLM_Spawn2EyeDoorSmokeEnemyProjectiles 
    dw Instruction_PLM_IncDoorHit_SetRoomArgDoor_GotoY 
    db $03 : dw InstList_PLM_EyeDoorEyeFacingRight_6 
    dw $0002,DrawInst_EyeDoorEyeFacingRight_4 
    dw $0002,DrawInst_EyeDoorEyeFacingRight_5 
    dw Instruction_PLM_Spawn2EyeDoorSmokeEnemyProjectiles 
    dw $0002,DrawInst_EyeDoorEyeFacingRight_4 
    dw $0002,DrawInst_EyeDoorEyeFacingRight_5 
    dw $0002,DrawInst_EyeDoorEyeFacingRight_4 
    dw Instruction_PLM_Spawn2EyeDoorSmokeEnemyProjectiles 
    dw $0002,DrawInst_EyeDoorEyeFacingRight_5 
    dw $0004,DrawInst_EyeDoorEyeFacingRight_2 
    dw $0008,DrawInst_EyeDoorEyeFacingRight_1 
    dw Instruction_PLM_SpawnEyeDoorSweatEnemyProjectileWithArgY,$0004 
    dw $0038,DrawInst_EyeDoorEyeFacingRight_1 
    dw $0004,DrawInst_EyeDoorEyeFacingRight_2 
    dw $0004,DrawInst_EyeDoorEyeFacingRight_5 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_EyeDoorEyeFacingRight_3 

InstList_PLM_EyeDoorEyeFacingRight_6:
    dw Instruction_PLM_ClearPreInstruction 
    dw Instruction_PLM_SpawnEyeDoorSweatDropProjectile 
    dw Instruction_PLM_SpawnEyeDoorSweatDropProjectile 
    dw Instruction_PLM_Spawn2EyeDoorSmokeEnemyProjectiles 
    dw Instruction_PLM_Spawn2EyeDoorSmokeEnemyProjectiles 
    dw Instruction_PLM_MovePLMUp1Row_MakeABlueDoorFacingRight 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $0A 

InstList_PLM_EyeDoorEyeFacingRight_7:
    dw $0003,DrawInst_EyeDoorEyeFacingRight_0 
    dw $0004,DrawInst_EyeDoorEyeFacingRight 
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero 
    dw InstList_PLM_EyeDoorEyeFacingRight_7 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_ClosedBlueDoorFacingLeft_41 

InstList_PLM_EyeDoorEyeFacingRight_8:
    dw Instruction_PLM_MovePLMUp1Row_MakeABlueDoorFacingRight 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_ClosedBlueDoorFacingLeft_41 

InstList_PLM_EyeDoorFacingRight_0:
    dw Instruction_PLM_GotoY_ifRoomArg_DoorIsSet 
    dw InstList_PLM_EyeDoorFacingRight_4 

InstList_PLM_EyeDoorFacingRight_1:
    dw Instruction_PLM_GotoY_ifSamusIsWithin_YColumnsRowsOfPLM 
    db $06,$10 : dw InstList_PLM_EyeDoorFacingRight_2 
    dw $0008,DrawInst_EyeDoorFacingRight_0 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_EyeDoorFacingRight_1 

InstList_PLM_EyeDoorFacingRight_2:
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_EyeDoorFacingRight_4 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_WakePLMIfRoomArgDoorIsSet 

InstList_PLM_EyeDoorFacingRight_3:
    dw $0006,DrawInst_EyeDoorFacingRight_0 
    dw $0006,DrawInst_EyeDoorFacingRight_1 
    dw $0006,DrawInst_EyeDoorFacingRight_2 
    dw $0006,DrawInst_EyeDoorFacingRight_1 
    dw Instruction_PLM_GotoY_ifSamusIsWithin_YColumnsRowsOfPLM 
    db $06,$10 : dw InstList_PLM_EyeDoorFacingRight_3 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_EyeDoorFacingRight_1 

InstList_PLM_EyeDoorFacingRight_4:
    dw Instruction_PLM_Delete 

InstList_PLM_EyeDoorBottomFacingRight_0:
    dw Instruction_PLM_GotoY_ifRoomArg_DoorIsSet 
    dw InstList_PLM_EyeDoorBottomFacingRight_4 

InstList_PLM_EyeDoorBottomFacingRight_1:
    dw Instruction_PLM_GotoY_ifSamusIsWithin_YColumnsRowsOfPLM 
    db $06,$10 : dw InstList_PLM_EyeDoorBottomFacingRight_2 
    dw $0008,DrawInst_EyeDoorBottomFacingRight_0 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_EyeDoorBottomFacingRight_1 

InstList_PLM_EyeDoorBottomFacingRight_2:
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_EyeDoorBottomFacingRight_4 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_WakePLMIfRoomArgDoorIsSet 

InstList_PLM_EyeDoorBottomFacingRight_3:
    dw $0006,DrawInst_EyeDoorBottomFacingRight_0 
    dw $0006,DrawInst_EyeDoorBottomFacingRight_1 
    dw $0006,DrawInst_EyeDoorBottomFacingRight_2 
    dw $0006,DrawInst_EyeDoorBottomFacingRight_1 
    dw Instruction_PLM_GotoY_ifSamusIsWithin_YColumnsRowsOfPLM 
    db $06,$10 : dw InstList_PLM_EyeDoorBottomFacingRight_3 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_EyeDoorBottomFacingRight_1 

InstList_PLM_EyeDoorBottomFacingRight_4:
    dw Instruction_PLM_Delete 

Setup_EyeDoorEye:
    PHY 
    LDA.W $1DC7,Y 
    JSL.L BitIndexToByteIndexAndBitmask 
    LDA.L $7ED8B0,X 
    PLY 
    AND.W $05E7 
    BNE .return 
    LDX.W $1C87,Y 
    LDA.W #$C044 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    LDA.W $1C87,Y : CLC : ADC.W $07A5 : ADC.W $07A5 : TAX 
    LDA.W #$D0FF 
    JSR.W Write_Level_Data_Block_Type_and_BTS 

.return:
    RTS 


Setup_EyeDoor:
    PHY 
    LDA.W $1DC7,Y 
    JSL.L BitIndexToByteIndexAndBitmask 
    LDA.L $7ED8B0,X 
    PLY 
    AND.W $05E7 
    BNE .return 
    LDX.W $1C87,Y 
    LDA.W #$A000 
    JSR.W Write_Level_Data_Block_Type_and_BTS 

.return:
    RTS 


RTS_84DAD5:
    RTS 


RTS_84DAD6:
    RTS 


RTS_84DAD7:
    RTS 


RTS_84DAD8:
    RTS 


RTS_84DAD9:
    RTS 


RTS_84DADA:
    RTS 


RTS_84DADB:
    RTS 


RTS_84DADC:
    RTS 


RTS_84DADD:
    RTS 


PreInst_PLM_SetMetroidsClearedStateWhenRequired_RoomArg12:
    LDA.W $0E50 
    CMP.W $0E52 
    BCC .return 
    LDA.W #$0010 
    JSL.L MarkEvent_inA 

.return:
    RTS 


PreInst_PLM_SetMetroidsClearedStateWhenRequired_RoomArg14:
    LDA.W $0E50 
    CMP.W $0E52 
    BCC .return 
    LDA.W #$0011 
    JSL.L MarkEvent_inA 

.return:
    RTS 


PreInst_PLM_SetMetroidsClearedStateWhenRequired_RoomArg16:
    LDA.W $0E50 
    CMP.W $0E52 
    BCC .return 
    LDA.W #$0012 
    JSL.L MarkEvent_inA 

.return:
    RTS 


PreInst_PLM_SetMetroidsClearedStateWhenRequired_RoomArg18:
    LDA.W $0E50 
    CMP.W $0E52 
    BCC .return 
    LDA.W #$0013 
    JSL.L MarkEvent_inA 

.return:
    RTS 


PreInstruction_PLM_SetsMetroidsClearedStatesWhenRequired:
    LDX.W $1DC7,Y 
    LDA.W .pointers,X : STA.W $1CD7,Y 
    RTS 


.pointers:
    dw RTS_84DAD5 
    dw RTS_84DAD6 
    dw RTS_84DAD7 
    dw RTS_84DAD8 
    dw RTS_84DAD9 
    dw RTS_84DADA 
    dw RTS_84DADB 
    dw RTS_84DADC 
    dw RTS_84DADD 
    dw PreInst_PLM_SetMetroidsClearedStateWhenRequired_RoomArg12 
    dw PreInst_PLM_SetMetroidsClearedStateWhenRequired_RoomArg14 
    dw PreInst_PLM_SetMetroidsClearedStateWhenRequired_RoomArg16 
    dw PreInst_PLM_SetMetroidsClearedStateWhenRequired_RoomArg18 

InstList_PLM_SetsMetroidsClearedStatesWhenRequired:
    dw Instruction_PLM_Sleep 

PLMEntries_SetsMetroidsClearedStatesWhenRequired:
    dw PreInstruction_PLM_SetsMetroidsClearedStatesWhenRequired 
    dw InstList_PLM_SetsMetroidsClearedStatesWhenRequired 

PLMEntries_EyeDoorEyeFacingRight:
    dw Setup_EyeDoorEye 
    dw InstList_PLM_EyeDoorEyeFacingRight_0 

PLMEntries_EyeDoorFacingRIght:
    dw Setup_EyeDoor 
    dw InstList_PLM_EyeDoorFacingRight_0 
    dw InstList_PLM_Delete 

PLMEntries_EyeDoorBottomFacingRight:
    dw Setup_EyeDoor 
    dw InstList_PLM_EyeDoorBottomFacingRight_0 

PLMEntries_EyeDoorEyeFacingLeft:
    dw Setup_EyeDoorEye 
    dw InstList_PLM_EyeDoorEyeFacingLeft_0 

PLMEntries_EyeDoorFacingLeft:
    dw Setup_EyeDoor 
    dw InstList_PLM_EyeDoorFacingLeft_0 
    dw InstList_PLM_Delete 

PLMEntries_EyeDoorBottomFacingLeft:
    dw Setup_EyeDoor 
    dw InstList_PLM_EyeDoorBottomFacingLeft_0 

PreInst_PLM_GotoLinkInstructionIfShotWithAMissile_Draygon:
    LDA.W $1D77,X 
    AND.W #$0F00 
    CMP.W #$0200 
    BEQ .super 
    CMP.W #$0100 
    BNE .return 

.missile:
    STZ.W $1D77,X 
    LDA.L $7EDEBC,X : STA.W $1D27,X 
    LDA.W #$0001 : STA.L $7EDE1C,X 

.return:
    RTS 


.super:
    LDA.W #$0077 : STA.W $1DC7,X 
    BRA .missile 


Instruction_PLM_DamageDraygonTurret:
    PHX 
    LDA.W $1E17,X 
    TAX 
    LDA.W #$0001 : STA.L $7E0000,X 
    PLX 
    LDA.W $1C87,X 
    TAX 
    LDA.W #$A003 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    TXA 
    CLC : ADC.W $07A5 : ADC.W $07A5 : TAX 
    LDA.W #$A003 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    LDX.W $1C27 
    RTS 


Instruction_PLM_DamageDraygonTurretFacingDownRight:
    PHX 
    LDA.W $1E17,X 
    TAX 
    LDA.W #$0001 : STA.L $7E0000,X 
    PLX 
    LDA.W $1C87,X 
    TAX 
    LDA.W #$A003 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    INX #2
    LDA.W #$A003 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    LDX.W $1C27 
    LDA.W $1C87,X : CLC : ADC.W $07A5 : ADC.W $07A5 : TAX 
    LDA.W #$A003 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    INX #2
    LDA.W #$0000 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    LDX.W $1C27 
    RTS 


Instruction_PLM_DamageDraygonTurretFacingUpRight:
    PHX 
    LDA.W $1E17,X 
    TAX 
    LDA.W #$0001 : STA.L $7E0000,X 
    PLX 
    LDA.W $1C87,X 
    TAX 
    LDA.W #$A003 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    INX #2
    LDA.W #$0000 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    LDX.W $1C27 
    LDA.W $1C87,X : CLC : ADC.W $07A5 : ADC.W $07A5 : TAX 
    LDA.W #$A003 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    INX #2
    LDA.W #$A003 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    LDX.W $1C27 
    RTS 


Instruction_PLM_DamageDraygonTurret_duplicate:
    PHX 
    LDA.W $1E17,X 
    TAX 
    LDA.W #$0001 : STA.L $7E0000,X 
    PLX 
    LDA.W $1C87,X 
    TAX 
    LDA.W #$A003 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    TXA 
    CLC : ADC.W $07A5 : ADC.W $07A5 : TAX 
    LDA.W #$A003 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    LDX.W $1C27 
    RTS 


Instruction_PLM_DamageDraygonTurretFacingDownLeft:
    PHX 
    LDA.W $1E17,X 
    TAX 
    LDA.W #$0001 : STA.L $7E0000,X 
    PLX 
    LDA.W $1C87,X 
    TAX 
    LDA.W #$A003 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    DEX #2
    LDA.W #$A003 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    LDX.W $1C27 
    LDA.W $1C87,X : CLC : ADC.W $07A5 : ADC.W $07A5 : TAX 
    LDA.W #$A003 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    DEX #2
    LDA.W #$0000 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    LDX.W $1C27 
    RTS 


Instruction_PLM_DamageDraygonTurretFacingUpLeft:
    PHX 
    LDA.W $1E17,X 
    TAX 
    LDA.W #$0001 : STA.L $7E0000,X 
    PLX 
    LDA.W $1C87,X 
    TAX 
    LDA.W #$A003 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    DEX #2
    LDA.W #$0000 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    LDX.W $1C27 
    LDA.W $1C87,X : CLC : ADC.W $07A5 : ADC.W $07A5 : TAX 
    LDA.W #$A003 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    DEX #2
    LDA.W #$A003 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    LDX.W $1C27 
    RTS 


InstList_PLM_DraygonCannonWithShieldFacingRight_0:
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_DraygonCannonWithShieldFacingRight_2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInst_PLM_GotoLinkInstructionIfShotWithAMissile_Draygon 

InstList_PLM_DraygonCannonWithShieldFacingRight_1:
    dw $0008,DrawInst_DraygonCannonShieldRight_0 
    dw Instruction_PLM_Sleep 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_DraygonCannonWithShieldFacingRight_1 

InstList_PLM_DraygonCannonWithShieldFacingRight_2:
    dw Instruction_PLM_IncRoomArg_RoomArgFFFF_GotoY 
    db $03 : dw InstList_PLM_DraygonCannonFacingRight_0 
    dw $0003,DrawInst_DraygonCannonShieldRight_0 
    dw $0004,DrawInst_DraygonCannonShieldRight_1 
    dw $0003,DrawInst_DraygonCannonShieldRight_0 
    dw $0004,DrawInst_DraygonCannonShieldRight_1 
    dw $0003,DrawInst_DraygonCannonShieldRight_0 
    dw $0004,DrawInst_DraygonCannonShieldRight_1 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_DraygonCannonWithShieldFacingRight_1 

InstList_PLM_DraygonCannonFacingRight_0:
    dw Instruction_PLM_DamageDraygonTurret 

InstList_PLM_DraygonCannonFacingRight_1:
    dw $0006,DrawInst_DraygonCannonRight_0 
    dw $0006,DrawInst_DraygonCannonRight_1 
    dw $0006,DrawInst_DraygonCannonRight_2 
    dw $0006,DrawInst_DraygonCannonRight_3 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_DraygonCannonFacingRight_1 

InstList_PLM_DraygonCannonWithShieldFacingDownRight_0:
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_DraygonCannonWithShieldFacingDownRight_2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInst_PLM_GotoLinkInstructionIfShotWithAMissile_Draygon 

InstList_PLM_DraygonCannonWithShieldFacingDownRight_1:
    dw $0008,UNUSED_DrawInst_DraygonCannonShieldDownRight_0_849FED 
    dw Instruction_PLM_Sleep 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_DraygonCannonWithShieldFacingDownRight_1 

InstList_PLM_DraygonCannonWithShieldFacingDownRight_2:
    dw Instruction_PLM_IncRoomArg_RoomArgFFFF_GotoY 
    db $03 : dw UNUSED_InstList_PLM_DraygonCannonFacingDownRight_0 
    dw $0003,UNUSED_DrawInst_DraygonCannonShieldDownRight_0_849FED 
    dw $0004,UNUSED_DrawInst_DraygonCannonShieldDownRight_1_849FFD 
    dw $0003,UNUSED_DrawInst_DraygonCannonShieldDownRight_0_849FED 
    dw $0004,UNUSED_DrawInst_DraygonCannonShieldDownRight_1_849FFD 
    dw $0003,UNUSED_DrawInst_DraygonCannonShieldDownRight_0_849FED 
    dw $0004,UNUSED_DrawInst_DraygonCannonShieldDownRight_1_849FFD 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_DraygonCannonWithShieldFacingDownRight_1 

UNUSED_InstList_PLM_DraygonCannonFacingDownRight_0:
    dw Instruction_PLM_DamageDraygonTurretFacingDownRight 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_PLM_DraygonCannonFacingDownRight_1:
    dw $0006,UNUSED_DrawInst_DraygonCannonDownRight_0_84A06D 
    dw $0006,UNUSED_DrawInst_DraygonCannonDownRight_1_84A07D 
    dw $0006,UNUSED_DrawInst_DraygonCannonDownRight_2_84A08D 
    dw $0006,UNUSED_DrawInst_DraygonCannonDownRight_3_84A09D 
    dw Instruction_PLM_GotoY 
    dw UNUSED_InstList_PLM_DraygonCannonFacingDownRight_1 

UNUSED_InstList_DraygonCannonWithShieldFacingUpRight_84DD70:
    dw Instruction_PLM_LinkInstruction_Y 
    dw UNUSED_InstList_DraygonCannonWithShieldFacingUpRight_84DD82 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInst_PLM_GotoLinkInstructionIfShotWithAMissile_Draygon 

UNUSED_InstList_DraygonCannonWithShieldFacingUpRight_84DD78:
    dw $0008,UNUSED_DrawInst_DraygonCannonShieldUpRight_0_84A00D 
    dw Instruction_PLM_Sleep 
    dw Instruction_PLM_GotoY 
    dw UNUSED_InstList_DraygonCannonWithShieldFacingUpRight_84DD78 

UNUSED_InstList_DraygonCannonWithShieldFacingUpRight_84DD82:
    dw Instruction_PLM_IncRoomArg_RoomArgFFFF_GotoY 
    db $03 : dw UNUSED_InstList_PLM_DraygonCannonFacingUpRight_84DDA3 
    dw $0003,UNUSED_DrawInst_DraygonCannonShieldUpRight_0_84A00D 
    dw $0004,UNUSED_DrawInst_DraygonCannonShieldUpRight_1_84A01D 
    dw $0003,UNUSED_DrawInst_DraygonCannonShieldUpRight_0_84A00D 
    dw $0004,UNUSED_DrawInst_DraygonCannonShieldUpRight_1_84A01D 
    dw $0003,UNUSED_DrawInst_DraygonCannonShieldUpRight_0_84A00D 
    dw $0004,UNUSED_DrawInst_DraygonCannonShieldUpRight_1_84A01D 
    dw Instruction_PLM_GotoY 
    dw UNUSED_InstList_DraygonCannonWithShieldFacingUpRight_84DD78 

UNUSED_InstList_PLM_DraygonCannonFacingUpRight_84DDA3:
    dw Instruction_PLM_DamageDraygonTurretFacingUpRight 

UNUSED_InstList_PLM_DraygonCannonFacingUpRight_84DDA5:
    dw $0006,UNUSED_DrawInst_DraygonCannonUpRight_0_84A0AD 
    dw $0006,UNUSED_DrawInst_DraygonCannonUpRight_1_84A0BD 
    dw $0006,UNUSED_DrawInst_DraygonCannonUpRight_2_84A0CD 
    dw $0006,UNUSED_DrawInst_DraygonCannonUpRight_3_84A0DD 
    dw Instruction_PLM_GotoY 
    dw UNUSED_InstList_PLM_DraygonCannonFacingUpRight_84DDA5 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_PLM_DraygonCannonWithShieldFacingLeft_0:
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_DraygonCannonWithShieldFacingLeft_2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInst_PLM_GotoLinkInstructionIfShotWithAMissile_Draygon 

InstList_PLM_DraygonCannonWithShieldFacingLeft_1:
    dw $0008,DrawInst_DraygonCannonShieldLeft_0 
    dw Instruction_PLM_Sleep 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_DraygonCannonWithShieldFacingLeft_1 

InstList_PLM_DraygonCannonWithShieldFacingLeft_2:
    dw Instruction_PLM_IncRoomArg_RoomArgFFFF_GotoY 
    db $03 : dw InstList_PLM_DraygonCannonFacingLeft_0 
    dw $0003,DrawInst_DraygonCannonShieldLeft_0 
    dw $0004,DrawInst_DraygonCannonShieldLeft_1 
    dw $0003,DrawInst_DraygonCannonShieldLeft_0 
    dw $0004,DrawInst_DraygonCannonShieldLeft_1 
    dw $0003,DrawInst_DraygonCannonShieldLeft_0 
    dw $0004,DrawInst_DraygonCannonShieldLeft_1 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_DraygonCannonWithShieldFacingLeft_1 

InstList_PLM_DraygonCannonFacingLeft_0:
    dw Instruction_PLM_DamageDraygonTurret_duplicate 

InstList_PLM_DraygonCannonFacingLeft_1:
    dw $0006,DrawInst_DraygonCannonLeft_0 
    dw $0006,DrawInst_DraygonCannonLeft_1 
    dw $0006,DrawInst_DraygonCannonLeft_2 
    dw $0006,DrawInst_DraygonCannonLeft_3 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_DraygonCannonFacingLeft_1 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_DraygonCannonWithShieldFacingDownLeft_84DE02:
    dw Instruction_PLM_LinkInstruction_Y 
    dw UNUSED_InstList_DraygonCannonWithShieldFacingDownLeft_84DE14 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInst_PLM_GotoLinkInstructionIfShotWithAMissile_Draygon 

UNUSED_InstList_DraygonCannonWithShieldFacingDownLeft_84DE0A:
    dw $0008,UNUSED_DrawInst_DraygonCannonShieldDownLeft_0_84A115 
    dw Instruction_PLM_Sleep 
    dw Instruction_PLM_GotoY 
    dw UNUSED_InstList_DraygonCannonWithShieldFacingDownLeft_84DE0A 

UNUSED_InstList_DraygonCannonWithShieldFacingDownLeft_84DE14:
    dw Instruction_PLM_IncRoomArg_RoomArgFFFF_GotoY 
    db $03 : dw UNUSED_InstList_PLM_DraygonCannonFacingDownLeft_84DE35 
    dw $0003,UNUSED_DrawInst_DraygonCannonShieldDownLeft_0_84A115 
    dw $0004,UNUSED_DrawInst_DraygonCannonShieldDownLeft_1_84A129 
    dw $0003,UNUSED_DrawInst_DraygonCannonShieldDownLeft_0_84A115 
    dw $0004,UNUSED_DrawInst_DraygonCannonShieldDownLeft_1_84A129 
    dw $0003,UNUSED_DrawInst_DraygonCannonShieldDownLeft_0_84A115 
    dw $0004,UNUSED_DrawInst_DraygonCannonShieldDownLeft_1_84A129 
    dw Instruction_PLM_GotoY 
    dw UNUSED_InstList_DraygonCannonWithShieldFacingDownLeft_84DE0A 

UNUSED_InstList_PLM_DraygonCannonFacingDownLeft_84DE35:
    dw Instruction_PLM_DamageDraygonTurretFacingDownLeft 

UNUSED_InstList_PLM_DraygonCannonFacingDownLeft_84DE37:
    dw $0006,UNUSED_DrawInst_DraygonCannonDownLeft_0_84A1B5 
    dw $0006,UNUSED_DrawInst_DraygonCannonDownLeft_1_84A1C9 
    dw $0006,UNUSED_DrawInst_DraygonCannonDownLeft_2_84A1DD 
    dw $0006,UNUSED_DrawInst_DraygonCannonDownLeft_3_84A1F1 
    dw Instruction_PLM_GotoY 
    dw UNUSED_InstList_PLM_DraygonCannonFacingDownLeft_84DE37 

UNUSED_InstList_DraygonCannonWithShieldFacingUpLeft_84DE4B:
    dw Instruction_PLM_LinkInstruction_Y 
    dw UNUSED_InstList_DraygonCannonWithShieldFacingUpLeft_84DE5D 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInst_PLM_GotoLinkInstructionIfShotWithAMissile_Draygon 

UNUSED_InstList_DraygonCannonWithShieldFacingUpLeft_84DE53:
    dw $0008,UNUSED_DrawInst_DraygonCannonShieldUpLeft_0_84A13D 
    dw Instruction_PLM_Sleep 
    dw Instruction_PLM_GotoY 
    dw UNUSED_InstList_DraygonCannonWithShieldFacingUpLeft_84DE53 

UNUSED_InstList_DraygonCannonWithShieldFacingUpLeft_84DE5D:
    dw Instruction_PLM_IncRoomArg_RoomArgFFFF_GotoY 
    db $03 : dw UNUSED_InstList_PLM_DraygonCannonFacingUpLeft_84DE7E 
    dw $0003,UNUSED_DrawInst_DraygonCannonShieldUpLeft_0_84A13D 
    dw $0004,UNUSED_DrawInst_DraygonCannonShieldUpLeft_1_84A151 
    dw $0003,UNUSED_DrawInst_DraygonCannonShieldUpLeft_0_84A13D 
    dw $0004,UNUSED_DrawInst_DraygonCannonShieldUpLeft_1_84A151 
    dw $0003,UNUSED_DrawInst_DraygonCannonShieldUpLeft_0_84A13D 
    dw $0004,UNUSED_DrawInst_DraygonCannonShieldUpLeft_1_84A151 
    dw Instruction_PLM_GotoY 
    dw UNUSED_InstList_DraygonCannonWithShieldFacingUpLeft_84DE53 

UNUSED_InstList_PLM_DraygonCannonFacingUpLeft_84DE7E:
    dw Instruction_PLM_DamageDraygonTurretFacingUpLeft 

UNUSED_InstList_PLM_DraygonCannonFacingUpLeft_84DE80:
    dw $0006,UNUSED_DrawInst_DraygonCannonUpLeft_0_84A205 
    dw $0006,UNUSED_DrawInst_DraygonCannonUpLeft_1_84A219 
    dw $0006,UNUSED_DrawInst_DraygonCannonUpLeft_2_84A22D 
    dw $0006,UNUSED_DrawInst_DraygonCannonUpLeft_3_84A241 
    dw Instruction_PLM_GotoY 
    dw UNUSED_InstList_PLM_DraygonCannonFacingUpLeft_84DE80 
endif ; !FEATURE_KEEP_UNREFERENCED

Setup_DraygonCannonWithShieldFacingRight:
    LDA.W $1DC7,Y : STA.W $1E17,Y 
    LDA.W #$0000 : STA.W $1DC7,Y 
    LDX.W $1C87,Y 
    LDA.W #$C044 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    TXA 
    CLC : ADC.W $07A5 : ADC.W $07A5 : TAX 
    LDA.W #$D0FF 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Setup_DraygonCannonWithShieldFacingDownUpRight_84DEB9:
    LDA.W $1DC7,Y : STA.W $1E17,Y 
    LDA.W #$0000 : STA.W $1DC7,Y 
    LDX.W $1C87,Y 
    LDA.W #$C044 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    INX #2
    LDA.W #$50FF 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    LDA.W $1C87,Y : CLC : ADC.W $07A5 : ADC.W $07A5 : TAX 
    LDA.W #$D0FF 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    INX #2
    LDA.W #$D0FF 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Setup_DraygonCannonWithShieldFacingLeft:
    LDA.W $1DC7,Y : STA.W $1E17,Y 
    LDA.W #$0000 : STA.W $1DC7,Y 
    LDX.W $1C87,Y 
    LDA.W #$C044 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    TXA 
    CLC : ADC.W $07A5 : ADC.W $07A5 : TAX 
    LDA.W #$D0FF 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Setup_DraygonCannonWithShieldFacingDownUpLeft_84DF15:
    LDA.W $1DC7,Y : STA.W $1E17,Y 
    LDA.W #$0000 : STA.W $1DC7,Y 
    LDX.W $1C87,Y 
    LDA.W #$C044 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    DEX #2
    LDA.W #$5001 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    LDA.W $1C87,Y : CLC : ADC.W $07A5 : ADC.W $07A5 : TAX 
    LDA.W #$D0FF 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    DEX #2
    LDA.W #$D0FF 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Setup_DraygonCannon:
    LDA.W $1DC7,Y : STA.W $1E17,Y 
    LDA.W #$0003 : STA.W $1DC7,Y 
    RTS 


PLMEntries_DraygonCannonWithShieldFacingRight:
    dw Setup_DraygonCannonWithShieldFacingRight 
    dw InstList_PLM_DraygonCannonWithShieldFacingRight_0 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_PLMEntries_DraygonCannonShieldFacingDownRight_84DF5D:
    dw UNUSED_Setup_DraygonCannonWithShieldFacingDownUpRight_84DEB9 
    dw InstList_PLM_DraygonCannonWithShieldFacingDownRight_0 

UNUSED_PLMEntries_DraygonCannonShieldFacingUpRight_84DF61:
    dw UNUSED_Setup_DraygonCannonWithShieldFacingDownUpRight_84DEB9 
    dw UNUSED_InstList_DraygonCannonWithShieldFacingUpRight_84DD70 
endif ; !FEATURE_KEEP_UNREFERENCED

PLMEntries_DraygonCannonFacingRight:
    dw Setup_DraygonCannon 
    dw InstList_PLM_DraygonCannonFacingRight_0 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_PLMEntries_DraygonCannonFacingDownRight_84DF69:
    dw Setup_DraygonCannon 
    dw UNUSED_InstList_PLM_DraygonCannonFacingDownRight_0 

UNUSED_PLMEntries_DraygonCannonFacingUpRight_84DF6D:
    dw Setup_DraygonCannon 
    dw UNUSED_InstList_PLM_DraygonCannonFacingUpRight_84DDA3 
endif ; !FEATURE_KEEP_UNREFERENCED

PLMEntries_DraygonCannonWithShieldFacingLeft:
    dw Setup_DraygonCannonWithShieldFacingLeft 
    dw InstList_PLM_DraygonCannonWithShieldFacingLeft_0 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_PLMEntries_DraygonCannonShieldFacingDownLeft_84DF75:
    dw UNUSED_Setup_DraygonCannonWithShieldFacingDownUpLeft_84DF15 
    dw UNUSED_InstList_DraygonCannonWithShieldFacingDownLeft_84DE02 

UNUSED_PLMEntries_DraygonCannonWithShieldFacingUpLeft_84DF79:
    dw UNUSED_Setup_DraygonCannonWithShieldFacingDownUpLeft_84DF15 
    dw UNUSED_InstList_DraygonCannonWithShieldFacingUpLeft_84DE4B 
endif ; !FEATURE_KEEP_UNREFERENCED

PLMEntries_DraygonCannonFacingLeft:
    dw Setup_DraygonCannon 
    dw InstList_PLM_DraygonCannonFacingLeft_0 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_PLMEntries_DraygonCannonFacingDownLeft_84DF81:
    dw Setup_DraygonCannon 
    dw UNUSED_InstList_PLM_DraygonCannonFacingDownLeft_84DE35 

UNUSED_PLMEntries_DraygonCannonFacingUpLeft_84DF85:
    dw Setup_DraygonCannon 
    dw UNUSED_InstList_PLM_DraygonCannonFacingUpLeft_84DE7E 
endif ; !FEATURE_KEEP_UNREFERENCED

PreInstruction_PLM_GotoLinkInstructionIfTriggered:
    LDA.W $1D77,X 
    AND.W #$00FF 
    CMP.W #$00FF 
    BNE .return 
    LDA.W #.return : STA.W $1CD7,X 
    LDA.L $7EDEBC,X : STA.W $1D27,X 
    LDA.W #$0001 : STA.L $7EDE1C,X 

.return:
    RTS 


InstList_PLM_EmptyItem:
    dw $0001,DrawInst_ItemChozoOrb 
    dw Instruction_PLM_Delete 

InstList_PLM_ItemOrb_0:
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 

InstList_PLM_ItemOrb_1:
    dw $0014,DrawInst_ItemOrb_0 
    dw $000A,DrawInst_ItemOrb_1 
    dw $0014,DrawInst_ItemOrb_2 
    dw $000A,DrawInst_ItemOrb_1 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_ItemOrb_1 

InstList_PLM_Callable_ItemOrbBurst:
    dw Instruction_PLM_ClearPreInstruction 
    dw $0003,DrawInst_ItemChozoOrb 
    dw $0003,DrawInst_ItemOrbBurst 
    dw $0003,DrawInst_ItemChozoOrb 
    dw Instruction_PLM_Return 

InstList_PLM_Callable_EmptyItemOrb_0:
    dw Instruction_PLM_ClearPreInstruction 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $16 

InstList_PLM_Callable_EmptyItemOrb_1:
    dw $0008,DrawInst_ItemChozoOrb 
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero 
    dw InstList_PLM_Callable_EmptyItemOrb_1 
    dw Instruction_PLM_Return 

PreInstruction_PLM_WakePLMIfTriggered_WithDeadCodePBCheck:
    LDA.W $1D77,X 
    CMP.W #$0300 
    BEQ .return 
    AND.W #$00FF 
    CMP.W #$00FF 
    BNE .return 
    STZ.W $1D77,X 
    INC.W $1D27,X 
    INC.W $1D27,X 
    LDA.W #$0001 : STA.L $7EDE1C,X 

.return:
    RTS 


InstList_PLM_Callable_ItemShotBlock:
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_WakePLMIfTriggered_WithDeadCodePBCheck 
    dw Instruction_PLM_Sleep 
    dw Instruction_PLM_ClearPreInstruction 
    dw Instruction_PLM_QueueSound_Y_Lib2_Max6 : db $0A 
    dw $0004,DrawInst_ItemShotBlock_0 
    dw $0004,DrawInst_ItemShotBlock_1 
    dw $0004,DrawInst_ItemShotBlock_2 
    dw Instruction_PLM_Return 

InstList_PLM_Callable_ItemShotBlockReconcealing:
    dw Instruction_PLM_ClearPreInstruction 
    dw $0004,DrawInst_ItemShotBlock_2 
    dw $0004,DrawInst_ItemShotBlock_1 
    dw $0004,DrawInst_ItemShotBlock_0 
    dw Instruction_PLM_DrawPLMBlock_Clone 
    dw Instruction_PLM_Return 

InstList_PLM_Callable_EmptyItemShotBlockReconcealing_0:
    dw Instruction_PLM_ClearPreInstruction 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $16 

InstList_PLM_Callable_EmptyItemShotBlockReconcealing_1:
    dw $0008,DrawInst_ItemChozoOrb 
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero 
    dw InstList_PLM_Callable_EmptyItemShotBlockReconcealing_1 
    dw $0004,DrawInst_Respawn1x1_2 
    dw $0004,DrawInst_Respawn1x1_1 
    dw $0004,DrawInst_Respawn1x1_0 
    dw Instruction_PLM_DrawPLMBlock_Clone 
    dw Instruction_PLM_Return 

Instruction_PLM_DrawItemFrame0:
    PHY 
    LDA.L $7EDF0C,X 
    TAY 
    LDA.W .drawInsts,Y : STA.L $7EDE6C,X 
    PLY 
    BRA DrawPLM_Wait4Frames 


.drawInsts:
    dw DrawInst_DrawItemFrame0_0 
    dw DrawInst_DrawItemFrame0_1 
    dw DrawInst_DrawItemFrame0_2 
    dw DrawInst_DrawItemFrame0_3 

Instruction_PLM_DrawItemFrame1:
    PHY 
    LDA.L $7EDF0C,X 
    TAY 
    LDA.W .drawInsts,Y : STA.L $7EDE6C,X 
    PLY 
    BRA DrawPLM_Wait4Frames 


.drawInsts:
    dw DrawInst_DrawItemFrame1_0 
    dw DrawInst_DrawItemFrame1_1 
    dw DrawInst_DrawItemFrame1_2 
    dw DrawInst_DrawItemFrame1_3 

DrawPLM_Wait4Frames:
    LDA.W #$0004 : STA.L $7EDE1C,X 
    TYA 
    STA.W $1D27,X 
    JSR.W Process_PLM_Draw_Instruction 
    LDX.W $1C27 
    JSL.L Calculate_PLM_Block_Coordinates 
    JSR.W DrawPLM_HardCoded 
    PLA 
    RTS 


InstList_PLM_EnergyTank_0:
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_EnergyTank_3 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_EnergyTank_2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 

InstList_PLM_EnergyTank_1:
    dw $0004,DrawInst_EnergyTank_0 
    dw $0004,DrawInst_EnergyTank_1 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_EnergyTank_1 

InstList_PLM_EnergyTank_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_CollectHealth_EnergyTank,$0064 

InstList_PLM_EnergyTank_3:
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_EmptyItem 

InstList_PLM_MissileTank_0:
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_MissileTank_3 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_MissileTank_2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 

InstList_PLM_MissileTank_1:
    dw $0004,DrawInst_MissileTank_0 
    dw $0004,DrawInst_MissileTank_1 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_MissileTank_1 

InstList_PLM_MissileTank_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_CollectAmmo_MissileTank,$0005 

InstList_PLM_MissileTank_3:
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_EmptyItem 

InstList_PLM_SuperMissileTank_0:
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_SuperMissileTank_3 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_SuperMissileTank_2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 

InstList_PLM_SuperMissileTank_1:
    dw $0004,DrawInst_SuperMissileTank_0 
    dw $0004,DrawInst_SuperMissileTank_1 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_SuperMissileTank_1 

InstList_PLM_SuperMissileTank_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_CollectAmmo_SuperMissileTank,$0005 

InstList_PLM_SuperMissileTank_3:
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_EmptyItem 

InstList_PLM_PowerBombTank_0:
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_PowerBombTank_3 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_PowerBombTank_2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 

InstList_PLM_PowerBombTank_1:
    dw $0004,DrawInst_PowerBombTank_0 
    dw $0004,DrawInst_PowerBombTank_1 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_PowerBombTank_1 

InstList_PLM_PowerBombTank_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_CollectAmmo_PowerBombTank,$0005 

InstList_PLM_PowerBombTank_3:
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_EmptyItem 

InstList_PLM_Bombs_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_Bombs : db $00,$00,$00,$00,$00,$00,$00,$00 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_Bombs_3 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_Bombs_2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 

InstList_PLM_Bombs_1:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_Bombs_1 

InstList_PLM_Bombs_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox,$1000 : db $13 

InstList_PLM_Bombs_3:
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_EmptyItem 

InstList_PLM_ChargeBeam_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_ChargeBeam : db $00,$00,$00,$00,$00,$00,$00,$00 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_ChargeBeam_3 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_ChargeBeam_2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 

InstList_PLM_ChargeBeam_1:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_ChargeBeam_1 

InstList_PLM_ChargeBeam_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_PickUpBeam_DisplayMessageBox,$1000 : db $0E 

InstList_PLM_ChargeBeam_3:
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_EmptyItem 

InstList_PLM_IceBeam_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_IceBeam : db $00,$03,$00,$00,$00,$03,$00,$00 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_IceBeam_3 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_IceBeam_2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 

InstList_PLM_IceBeam_1:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_IceBeam_1 

InstList_PLM_IceBeam_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_PickUpBeam_DisplayMessageBox,$0002 : db $0F 

InstList_PLM_IceBeam_3:
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_EmptyItem 

InstList_PLM_HiJumpBoots_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_HiJumpBoots : db $00,$00,$00,$00,$00,$00,$00,$00 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_HiJumpBoots_3 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_HiJumpBoots_2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 

InstList_PLM_HiJumpBoots_1:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_HiJumpBoots_1 

InstList_PLM_HiJumpBoots_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox,$0100 : db $0B 

InstList_PLM_HiJumpBoots_3:
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_EmptyItem 

InstList_PLM_SpeedBooster_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_SpeedBooster : db $00,$00,$00,$00,$00,$00,$00,$00 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_SpeedBooster_3 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_SpeedBooster_2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 

InstList_PLM_SpeedBooster_1:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_SpeedBooster_1 

InstList_PLM_SpeedBooster_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox,$2000 : db $0D 

InstList_PLM_SpeedBooster_3:
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_EmptyItem 

InstList_PLM_WaveBeam_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_WaveBeam : db $00,$02,$00,$00,$00,$02,$00,$00 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_WaveBeam_3 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_WaveBeam_2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 

InstList_PLM_WaveBeam_1:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_WaveBeam_1 

InstList_PLM_WaveBeam_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_PickUpBeam_DisplayMessageBox,$0001 : db $10 

InstList_PLM_WaveBeam_3:
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_EmptyItem 

InstList_PLM_Spazer_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_Spazer : db $00,$00,$00,$00,$00,$00,$00,$00 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_Spazer_3 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_Spazer_2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 

InstList_PLM_Spazer_1:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_Spazer_1 

InstList_PLM_Spazer_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_PickUpBeam_DisplayMessageBox,$0004 : db $11 

InstList_PLM_Spazer_3:
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_EmptyItem 

InstList_PLM_SpringBall_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_SpringBall : db $00,$00,$00,$00,$00,$00,$00,$00 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_SpringBall_3 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_SpringBall_2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 

InstList_PLM_SpringBall_1:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_SpringBall_1 

InstList_PLM_SpringBall_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox,$0002 : db $08 

InstList_PLM_SpringBall_3:
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_EmptyItem 

Instruction_PLM_ClearChargeBeamCounter:
    STZ.W $0CD0 
    RTS 


InstList_PLM_VariaSuit_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_VariaSuit : db $00,$00,$00,$00,$00,$00,$00,$00 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_VariaSuit_3 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_VariaSuit_2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 

InstList_PLM_VariaSuit_1:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_VariaSuit_1 

InstList_PLM_VariaSuit_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_ClearChargeBeamCounter 
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox,$0001 : db $07 
    dw Instruction_PLM_CallFunctionInY 
    dl VariaSuit_Pickup 

InstList_PLM_VariaSuit_3:
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_EmptyItem 

InstList_PLM_GravitySuit_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_GravitySuit : db $00,$00,$00,$00,$00,$00,$00,$00 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_GravitySuit_3 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_GravitySuit_2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 

InstList_PLM_GravitySuit_1:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_GravitySuit_1 

InstList_PLM_GravitySuit_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_ClearChargeBeamCounter 
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox,$0020 : db $1A 
    dw Instruction_PLM_CallFunctionInY 
    dl GravitySuit_Pickup 

InstList_PLM_GravitySuit_3:
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_EmptyItem 

InstList_PLM_XrayScope_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_XrayScope : db $01,$01,$00,$00,$03,$03,$00,$00 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_XrayScope_3 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_XrayScope_2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 

InstList_PLM_XrayScope_1:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_XrayScope_1 

InstList_PLM_XrayScope_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Inst_PLM_PickUpEquipment_AddXrayToHUD_DisplayMessageBox,$8000 

InstList_PLM_XrayScope_3:
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_EmptyItem 

InstList_PLM_PlasmaBeam_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_PlasmaBeam : db $00,$01,$00,$00,$00,$01,$00,$00 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_PlasmaBeam_3 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_PlasmaBeam_2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 

InstList_PLM_PlasmaBeam_1:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_PlasmaBeam_1 

InstList_PLM_PlasmaBeam_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_PickUpBeam_DisplayMessageBox,$0008 : db $12 

InstList_PLM_PlasmaBeam_3:
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_EmptyItem 

InstList_PLM_GrappleBeam_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_GrappleBeam : db $00,$00,$00,$00,$00,$00,$00,$00 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_GrappleBeam_3 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_GrappleBeam_2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 

InstList_PLM_GrappleBeam_1:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_GrappleBeam_1 

InstList_PLM_GrappleBeam_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Inst_PLM_PickUpEquipment_AddGrappleHUD_DisplayMessageBox,$4000 

InstList_PLM_GrappleBeam_3:
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_EmptyItem 

InstList_PLM_SpaceJump_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_SpaceJump : db $00,$00,$00,$00,$00,$00,$00,$00 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_SpaceJump_3 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_SpaceJump_2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 

InstList_PLM_SpaceJump_1:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_SpaceJump_1 

InstList_PLM_SpaceJump_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox,$0200 : db $0C 

InstList_PLM_SpaceJump_3:
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_EmptyItem 

InstList_PLM_ScrewAttack_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_ScrewAttack : db $00,$00,$00,$00,$00,$00,$00,$00 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_ScrewAttack_3 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_ScrewAttack_2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 

InstList_PLM_ScrewAttack_1:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_ScrewAttack_1 

InstList_PLM_ScrewAttack_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox,$0008 : db $0A 

InstList_PLM_ScrewAttack_3:
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_EmptyItem 

InstList_PLM_MorphBall_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_MorphBall : db $00,$00,$00,$00,$00,$00,$00,$00 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_MorphBall_3 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_MorphBall_2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 

InstList_PLM_MorphBall_1:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_MorphBall_1 

InstList_PLM_MorphBall_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox,$0004 : db $09 

InstList_PLM_MorphBall_3:
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_EmptyItem 

InstList_PLM_ReserveTank_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_ReserveTank : db $00,$00,$00,$00,$00,$00,$00,$00 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_ReserveTank_3 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_ReserveTank_2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 

InstList_PLM_ReserveTank_1:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_ReserveTank_1 

InstList_PLM_ReserveTank_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_CollectHealth_ReserveTank,$0064 

InstList_PLM_ReserveTank_3:
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_EmptyItem 

InstList_PLM_EnergyTankChozoOrb_0:
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_EnergyTankChozoOrb_3 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_ItemOrb_0 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemOrbBurst 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_EnergyTankChozoOrb_2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $16 

InstList_PLM_EnergyTankChozoOrb_1:
    dw $0004,DrawInst_EnergyTank_0 
    dw $0004,DrawInst_EnergyTank_1 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_EnergyTankChozoOrb_1 

InstList_PLM_EnergyTankChozoOrb_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_CollectHealth_EnergyTank,$0064 

InstList_PLM_EnergyTankChozoOrb_3:
    dw $0001,DrawInst_ItemChozoOrb 
    dw Instruction_PLM_Delete 

InstList_PLM_MissileTankChozoOrb_0:
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_MissileTankChozoOrb_3 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_ItemOrb_0 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemOrbBurst 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_MissileTankChozoOrb_2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $16 

InstList_PLM_MissileTankChozoOrb_1:
    dw $0004,DrawInst_MissileTank_0 
    dw $0004,DrawInst_MissileTank_1 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_MissileTankChozoOrb_1 

InstList_PLM_MissileTankChozoOrb_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_CollectAmmo_MissileTank,$0005 

InstList_PLM_MissileTankChozoOrb_3:
    dw $0001,DrawInst_ItemChozoOrb 
    dw Instruction_PLM_Delete 

InstList_PLM_SuperMissileTankChozoOrb_0:
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_SuperMissileTankChozoOrb_3 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_ItemOrb_0 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemOrbBurst 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_SuperMissileTankChozoOrb_2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $16 

InstList_PLM_SuperMissileTankChozoOrb_1:
    dw $0004,DrawInst_SuperMissileTank_0 
    dw $0004,DrawInst_SuperMissileTank_1 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_SuperMissileTankChozoOrb_1 

InstList_PLM_SuperMissileTankChozoOrb_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_CollectAmmo_SuperMissileTank,$0005 

InstList_PLM_SuperMissileTankChozoOrb_3:
    dw $0001,DrawInst_ItemChozoOrb 
    dw Instruction_PLM_Delete 

InstList_PLM_PowerBombTankChozoOrb_0:
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_PowerBombTankChozoOrb_3 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_ItemOrb_0 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemOrbBurst 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_PowerBombTankChozoOrb_2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $16 

InstList_PLM_PowerBombTankChozoOrb_1:
    dw $0004,DrawInst_PowerBombTank_0 
    dw $0004,DrawInst_PowerBombTank_1 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_PowerBombTankChozoOrb_1 

InstList_PLM_PowerBombTankChozoOrb_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_CollectAmmo_PowerBombTank,$0005 

InstList_PLM_PowerBombTankChozoOrb_3:
    dw $0001,DrawInst_ItemChozoOrb 
    dw Instruction_PLM_Delete 

InstList_PLM_BombsChozoOrb_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_Bombs : db $00,$00,$00,$00,$00,$00,$00,$00 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_BombsChozoOrb_3 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_ItemOrb_0 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemOrbBurst 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_BombsChozoOrb_2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $16 

InstList_PLM_BombsChozoOrb_1:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_BombsChozoOrb_1 

InstList_PLM_BombsChozoOrb_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox,$1000 : db $13 

InstList_PLM_BombsChozoOrb_3:
    dw $0001,DrawInst_ItemChozoOrb 
    dw Instruction_PLM_Delete 

InstList_PLM_ChargeBeamChozoOrb_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_ChargeBeam : db $00,$00,$00,$00,$00,$00,$00,$00 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_ChargeBeamChozoOrb_3 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_ItemOrb_0 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemOrbBurst 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_ChargeBeamChozoOrb_2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $16 

InstList_PLM_ChargeBeamChozoOrb_1:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_ChargeBeamChozoOrb_1 

InstList_PLM_ChargeBeamChozoOrb_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_PickUpBeam_DisplayMessageBox,$1000 : db $0E 

InstList_PLM_ChargeBeamChozoOrb_3:
    dw $0001,DrawInst_ItemChozoOrb 
    dw Instruction_PLM_Delete 

InstList_PLM_IceBeamChozoOrb_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_IceBeam : db $00,$03,$00,$00,$00,$03,$00,$00 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_IceBeamChozoOrb_3 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_ItemOrb_0 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemOrbBurst 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_IceBeamChozoOrb_2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $16 

InstList_PLM_IceBeamChozoOrb_1:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_IceBeamChozoOrb_1 

InstList_PLM_IceBeamChozoOrb_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_PickUpBeam_DisplayMessageBox,$0002 : db $0F 

InstList_PLM_IceBeamChozoOrb_3:
    dw $0001,DrawInst_ItemChozoOrb 
    dw Instruction_PLM_Delete 

InstList_PLM_HiJumpBootsChozoOrb_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_HiJumpBoots : db $00,$00,$00,$00,$00,$00,$00,$00 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_HiJumpBootsChozoOrb_3 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_ItemOrb_0 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemOrbBurst 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_HiJumpBootsChozoOrb_2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $16 

InstList_PLM_HiJumpBootsChozoOrb_1:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_HiJumpBootsChozoOrb_1 

InstList_PLM_HiJumpBootsChozoOrb_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox,$0100 : db $0B 

InstList_PLM_HiJumpBootsChozoOrb_3:
    dw $0001,DrawInst_ItemChozoOrb 
    dw Instruction_PLM_Delete 

InstList_PLM_SpeedBoosterChozoOrb_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_SpeedBooster : db $00,$00,$00,$00,$00,$00,$00,$00 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_SpeedBoosterChozoOrb_4 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_ItemOrb_0 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemOrbBurst 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_SpeedBoosterChozoOrb_2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $16 

InstList_PLM_SpeedBoosterChozoOrb_1:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_SpeedBoosterChozoOrb_1 

InstList_PLM_SpeedBoosterChozoOrb_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox,$2000 : db $0D 

InstList_PLM_SpeedBoosterChozoOrb_3:
    dw Instruction_PLM_FXYVelocity_FFE0 

InstList_PLM_SpeedBoosterChozoOrb_4:
    dw $0001,DrawInst_ItemChozoOrb 
    dw Instruction_PLM_Delete 

Instruction_PLM_FXYVelocity_FFE0:
    LDA.W #$FFE0 : STA.W $197C 
    RTS 


InstList_PLM_WaveBeamChozoOrb_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_WaveBeam : db $00,$02,$00,$00,$00,$02,$00,$00 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_WaveBeamChozoOrb_3 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_ItemOrb_0 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemOrbBurst 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_WaveBeamChozoOrb_2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $16 

InstList_PLM_WaveBeamChozoOrb_1:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_WaveBeamChozoOrb_1 

InstList_PLM_WaveBeamChozoOrb_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_PickUpBeam_DisplayMessageBox,$0001 : db $10 

InstList_PLM_WaveBeamChozoOrb_3:
    dw $0001,DrawInst_ItemChozoOrb 
    dw Instruction_PLM_Delete 

InstList_PLM_SpazerChozoOrb_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_Spazer : db $00,$00,$00,$00,$00,$00,$00,$00 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_SpazerChozoOrb_3 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_ItemOrb_0 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemOrbBurst 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_SpazerChozoOrb_2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $16 

InstList_PLM_SpazerChozoOrb_1:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_SpazerChozoOrb_1 

InstList_PLM_SpazerChozoOrb_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_PickUpBeam_DisplayMessageBox,$0004 : db $11 

InstList_PLM_SpazerChozoOrb_3:
    dw $0001,DrawInst_ItemChozoOrb 
    dw Instruction_PLM_Delete 

InstList_PLM_SpringBallChozoOrb_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_SpringBall : db $00,$00,$00,$00,$00,$00,$00,$00 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_SpringBallChozoOrb_3 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_ItemOrb_0 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemOrbBurst 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_SpringBallChozoOrb_2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $16 

InstList_PLM_SpringBallChozoOrb_1:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_SpringBallChozoOrb_1 

InstList_PLM_SpringBallChozoOrb_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox,$0002 : db $08 

InstList_PLM_SpringBallChozoOrb_3:
    dw $0001,DrawInst_ItemChozoOrb 
    dw Instruction_PLM_Delete 

InstList_PLM_VariaSuitChozoOrb_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_VariaSuit : db $00,$00,$00,$00,$00,$00,$00,$00 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_VariaSuitChozoOrb_3 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_ItemOrb_0 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemOrbBurst 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_VariaSuitChozoOrb_2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $16 

InstList_PLM_VariaSuitChozoOrb_1:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_VariaSuitChozoOrb_1 

InstList_PLM_VariaSuitChozoOrb_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_ClearChargeBeamCounter 
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox,$0001 : db $07 
    dw Instruction_PLM_CallFunctionInY 
    dl VariaSuit_Pickup 

InstList_PLM_VariaSuitChozoOrb_3:
    dw $0001,DrawInst_ItemChozoOrb 
    dw Instruction_PLM_Delete 

InstList_PLM_GravitySuitChozoOrb_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_GravitySuit : db $00,$00,$00,$00,$00,$00,$00,$00 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_GravitySuitChozoOrb_3 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_ItemOrb_0 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemOrbBurst 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_GravitySuitChozoOrb_2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $16 

InstList_PLM_GravitySuitChozoOrb_1:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_GravitySuitChozoOrb_1 

InstList_PLM_GravitySuitChozoOrb_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_ClearChargeBeamCounter 
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox,$0020 : db $1A 
    dw Instruction_PLM_CallFunctionInY 
    dl GravitySuit_Pickup 

InstList_PLM_GravitySuitChozoOrb_3:
    dw $0001,DrawInst_ItemChozoOrb 
    dw Instruction_PLM_Delete 

InstList_PLM_XrayScopeChozoOrb_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_XrayScope : db $01,$01,$00,$00,$03,$03,$00,$00 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_XrayScopeChozoOrb_3 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_ItemOrb_0 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemOrbBurst 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_XrayScopeChozoOrb_2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $16 

InstList_PLM_XrayScopeChozoOrb_1:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_XrayScopeChozoOrb_1 

InstList_PLM_XrayScopeChozoOrb_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Inst_PLM_PickUpEquipment_AddXrayToHUD_DisplayMessageBox,$8000 

InstList_PLM_XrayScopeChozoOrb_3:
    dw $0001,DrawInst_ItemChozoOrb 
    dw Instruction_PLM_Delete 

InstList_PLM_PlasmaBeamChozoOrb_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_PlasmaBeam : db $00,$01,$00,$00,$00,$01,$00,$00 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_PlasmaBeamChozoOrb_3 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_ItemOrb_0 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemOrbBurst 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_PlasmaBeamChozoOrb_2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $16 

InstList_PLM_PlasmaBeamChozoOrb_1:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_PlasmaBeamChozoOrb_1 

InstList_PLM_PlasmaBeamChozoOrb_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_PickUpBeam_DisplayMessageBox,$0008 : db $12 

InstList_PLM_PlasmaBeamChozoOrb_3:
    dw $0001,DrawInst_ItemChozoOrb 
    dw Instruction_PLM_Delete 

InstList_PLM_GrappleBeamChozoOrb_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_GrappleBeam : db $00,$00,$00,$00,$00,$00,$00,$00 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_GrappleBeamChozoOrb_3 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_ItemOrb_0 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemOrbBurst 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_GrappleBeamChozoOrb_2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $16 

InstList_PLM_GrappleBeamChozoOrb_1:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_GrappleBeamChozoOrb_1 

InstList_PLM_GrappleBeamChozoOrb_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Inst_PLM_PickUpEquipment_AddGrappleHUD_DisplayMessageBox,$4000 

InstList_PLM_GrappleBeamChozoOrb_3:
    dw $0001,DrawInst_ItemChozoOrb 
    dw Instruction_PLM_Delete 

InstList_PLM_SpaceJumpChozoOrb_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_SpaceJump : db $00,$00,$00,$00,$00,$00,$00,$00 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_SpaceJumpChozoOrb_3 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_ItemOrb_0 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemOrbBurst 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_SpaceJumpChozoOrb_2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $16 

InstList_PLM_SpaceJumpChozoOrb_1:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_SpaceJumpChozoOrb_1 

InstList_PLM_SpaceJumpChozoOrb_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox,$0200 : db $0C 

InstList_PLM_SpaceJumpChozoOrb_3:
    dw $0001,DrawInst_ItemChozoOrb 
    dw Instruction_PLM_Delete 

InstList_PLM_ScrewAttackChozoOrb_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_ScrewAttack : db $00,$00,$00,$00,$00,$00,$00,$00 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_ScrewAttackChozoOrb_3 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_ItemOrb_0 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemOrbBurst 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_ScrewAttackChozoOrb_2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $16 

InstList_PLM_ScrewAttackChozoOrb_1:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_ScrewAttackChozoOrb_1 

InstList_PLM_ScrewAttackChozoOrb_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox,$0008 : db $0A 

InstList_PLM_ScrewAttackChozoOrb_3:
    dw $0001,DrawInst_ItemChozoOrb 
    dw Instruction_PLM_Delete 

InstList_PLM_MorphBallChozoOrb_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_MorphBall : db $00,$00,$00,$00,$00,$00,$00,$00 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_MorphBallChozoOrb_3 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_ItemOrb_0 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemOrbBurst 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_MorphBallChozoOrb_2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $16 

InstList_PLM_MorphBallChozoOrb_1:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_MorphBallChozoOrb_1 

InstList_PLM_MorphBallChozoOrb_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox,$0002 : db $09 

InstList_PLM_MorphBallChozoOrb_3:
    dw $0001,DrawInst_ItemChozoOrb 
    dw Instruction_PLM_Delete 

InstList_PLM_ReserveTankChozoOrb_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_ReserveTank : db $00,$00,$00,$00,$00,$00,$00,$00 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_ReserveTankChozoOrb_3 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_ItemOrb_0 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemOrbBurst 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_ReserveTankChozoOrb_2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $16 

InstList_PLM_ReserveTankChozoOrb_1:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_ReserveTankChozoOrb_1 

InstList_PLM_ReserveTankChozoOrb_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_CollectHealth_ReserveTank,$0064 

InstList_PLM_ReserveTankChozoOrb_3:
    dw $0001,DrawInst_ItemChozoOrb 
    dw Instruction_PLM_Delete 

InstList_PLM_EnergyTankShotBlock_0:
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemShotBlock 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_EnergyTankShotBlock_3 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_EnergyTankShotBlock_2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $16 

InstList_PLM_EnergyTankShotBlock_1:
    dw $0004,DrawInst_EnergyTank_0 
    dw $0004,DrawInst_EnergyTank_1 
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero 
    dw InstList_PLM_EnergyTankShotBlock_1 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemShotBlockReconcealing 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_EnergyTankShotBlock_0 

InstList_PLM_EnergyTankShotBlock_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_CollectHealth_EnergyTank,$0064 

InstList_PLM_EnergyTankShotBlock_3:
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_EmptyItemShotBlockReconcealing_0 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_EnergyTankShotBlock_0 

InstList_PLM_MissileTankShotBlock_0:
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemShotBlock 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_MissileTankShotBlock_3 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_MissileTankShotBlock_2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $16 

InstList_PLM_MissileTankShotBlock_1:
    dw $0004,DrawInst_MissileTank_0 
    dw $0004,DrawInst_MissileTank_1 
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero 
    dw InstList_PLM_MissileTankShotBlock_1 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemShotBlockReconcealing 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_MissileTankShotBlock_0 

InstList_PLM_MissileTankShotBlock_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_CollectAmmo_MissileTank,$0005 

InstList_PLM_MissileTankShotBlock_3:
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_EmptyItemShotBlockReconcealing_0 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_MissileTankShotBlock_0 

InstList_PLM_SuperMissileTankShotBlock_0:
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemShotBlock 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_SuperMissileTankShotBlock_3 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_SuperMissileTankShotBlock_2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $16 

InstList_PLM_SuperMissileTankShotBlock_1:
    dw $0004,DrawInst_SuperMissileTank_0 
    dw $0004,DrawInst_SuperMissileTank_1 
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero 
    dw InstList_PLM_SuperMissileTankShotBlock_1 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemShotBlockReconcealing 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_SuperMissileTankShotBlock_0 

InstList_PLM_SuperMissileTankShotBlock_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_CollectAmmo_SuperMissileTank,$0005 

InstList_PLM_SuperMissileTankShotBlock_3:
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_EmptyItemShotBlockReconcealing_0 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_SuperMissileTankShotBlock_0 

InstList_PLM_PowerBombTankShotBlock_0:
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemShotBlock 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_PowerBombTankShotBlock_3 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_PowerBombTankShotBlock_2 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $16 

InstList_PLM_PowerBombTankShotBlock_1:
    dw $0004,DrawInst_PowerBombTank_0 
    dw $0004,DrawInst_PowerBombTank_1 
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero 
    dw InstList_PLM_PowerBombTankShotBlock_1 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemShotBlockReconcealing 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_PowerBombTankShotBlock_0 

InstList_PLM_PowerBombTankShotBlock_2:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_CollectAmmo_PowerBombTank,$0005 

InstList_PLM_PowerBombTankShotBlock_3:
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_EmptyItemShotBlockReconcealing_0 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_PowerBombTankShotBlock_0 

InstList_PLM_BombsShotBlock_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_Bombs : db $00,$00,$00,$00,$00,$00,$00,$00 

InstList_PLM_BombsShotBlock_1:
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemShotBlock 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_BombsShotBlock_4 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_BombsShotBlock_3 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $16 

InstList_PLM_BombsShotBlock_2:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero 
    dw InstList_PLM_BombsShotBlock_2 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemShotBlockReconcealing 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_BombsShotBlock_1 

InstList_PLM_BombsShotBlock_3:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox,$1000 : db $13 

InstList_PLM_BombsShotBlock_4:
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_EmptyItemShotBlockReconcealing_0 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_BombsShotBlock_1 

InstList_PLM_ChargeBeamShotBlock_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_ChargeBeam : db $00,$00,$00,$00,$00,$00,$00,$00 

InstList_PLM_ChargeBeamShotBlock_1:
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemShotBlock 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_ChargeBeamShotBlock_4 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_ChargeBeamShotBlock_3 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $16 

InstList_PLM_ChargeBeamShotBlock_2:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero 
    dw InstList_PLM_ChargeBeamShotBlock_2 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemShotBlockReconcealing 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_ChargeBeamShotBlock_1 

InstList_PLM_ChargeBeamShotBlock_3:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_PickUpBeam_DisplayMessageBox,$1000 : db $0E 

InstList_PLM_ChargeBeamShotBlock_4:
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_EmptyItemShotBlockReconcealing_0 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_ChargeBeamShotBlock_1 

InstList_PLM_IceBeamShotBlock_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_IceBeam : db $00,$03,$00,$00,$00,$03,$00,$00 

InstList_PLM_IceBeamShotBlock_1:
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemShotBlock 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_IceBeamShotBlock_4 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_IceBeamShotBlock_3 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $16 

InstList_PLM_IceBeamShotBlock_2:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero 
    dw InstList_PLM_IceBeamShotBlock_2 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemShotBlockReconcealing 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_IceBeamShotBlock_1 

InstList_PLM_IceBeamShotBlock_3:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_PickUpBeam_DisplayMessageBox,$0002 : db $0F 

InstList_PLM_IceBeamShotBlock_4:
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_EmptyItemShotBlockReconcealing_0 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_IceBeamShotBlock_1 

InstList_PLM_HiJumpBootsShotBlock_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_HiJumpBoots : db $00,$00,$00,$00,$00,$00,$00,$00 

InstList_PLM_HiJumpBootsShotBlock_1:
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemShotBlock 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_HiJumpBootsShotBlock_4 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_HiJumpBootsShotBlock_3 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $16 

InstList_PLM_HiJumpBootsShotBlock_2:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero 
    dw InstList_PLM_HiJumpBootsShotBlock_2 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemShotBlockReconcealing 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_HiJumpBootsShotBlock_1 

InstList_PLM_HiJumpBootsShotBlock_3:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox,$0100 : db $0B 

InstList_PLM_HiJumpBootsShotBlock_4:
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_EmptyItemShotBlockReconcealing_0 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_HiJumpBootsShotBlock_1 

InstList_PLM_SpeedBoosterShotBlock_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_SpeedBooster : db $00,$00,$00,$00,$00,$00,$00,$00 

InstList_PLM_SpeedBoosterShotBlock_1:
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemShotBlock 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_SpeedBoosterShotBlock_4 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_SpeedBoosterShotBlock_3 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $16 

InstList_PLM_SpeedBoosterShotBlock_2:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero 
    dw InstList_PLM_SpeedBoosterShotBlock_2 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemShotBlockReconcealing 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_SpeedBoosterShotBlock_1 

InstList_PLM_SpeedBoosterShotBlock_3:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox,$2000 : db $0D 

InstList_PLM_SpeedBoosterShotBlock_4:
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_EmptyItemShotBlockReconcealing_0 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_SpeedBoosterShotBlock_1 

InstList_PLM_WaveBeamShotBlock_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_WaveBeam : db $00,$02,$00,$00,$00,$02,$00,$00 

InstList_PLM_WaveBeamShotBlock_1:
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemShotBlock 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_WaveBeamShotBlock_4 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_WaveBeamShotBlock_3 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $16 

InstList_PLM_WaveBeamShotBlock_2:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero 
    dw InstList_PLM_WaveBeamShotBlock_2 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemShotBlockReconcealing 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_WaveBeamShotBlock_1 

InstList_PLM_WaveBeamShotBlock_3:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_PickUpBeam_DisplayMessageBox,$0001 : db $10 

InstList_PLM_WaveBeamShotBlock_4:
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_EmptyItemShotBlockReconcealing_0 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_WaveBeamShotBlock_1 

InstList_PLM_SpazerShotBlock_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_Spazer : db $00,$00,$00,$00,$00,$00,$00,$00 

InstList_PLM_SpazerShotBlock_1:
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemShotBlock 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_SpazerShotBlock_4 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_SpazerShotBlock_3 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $16 

InstList_PLM_SpazerShotBlock_2:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero 
    dw InstList_PLM_SpazerShotBlock_2 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemShotBlockReconcealing 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_SpazerShotBlock_1 

InstList_PLM_SpazerShotBlock_3:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_PickUpBeam_DisplayMessageBox,$0004 : db $11 

InstList_PLM_SpazerShotBlock_4:
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_EmptyItemShotBlockReconcealing_0 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_SpazerShotBlock_1 

InstList_PLM_SpringBallShotBlock_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_SpringBall : db $00,$00,$00,$00,$00,$00,$00,$00 

InstList_PLM_SpringBallShotBlock_1:
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemShotBlock 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_SpringBallShotBlock_4 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_SpringBallShotBlock_3 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $16 

InstList_PLM_SpringBallShotBlock_2:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero 
    dw InstList_PLM_SpringBallShotBlock_2 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemShotBlockReconcealing 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_SpringBallShotBlock_1 

InstList_PLM_SpringBallShotBlock_3:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox,$0002 : db $08 

InstList_PLM_SpringBallShotBlock_4:
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_EmptyItemShotBlockReconcealing_0 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_SpringBallShotBlock_1 

InstList_PLM_VariaSuitShotBlock_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_VariaSuit : db $00,$00,$00,$00,$00,$00,$00,$00 

InstList_PLM_VariaSuitShotBlock_1:
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemShotBlock 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_VariaSuitShotBlock_4 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_VariaSuitShotBlock_3 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $16 

InstList_PLM_VariaSuitShotBlock_2:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero 
    dw InstList_PLM_VariaSuitShotBlock_2 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemShotBlockReconcealing 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_VariaSuitShotBlock_1 

InstList_PLM_VariaSuitShotBlock_3:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_ClearChargeBeamCounter 
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox,$0001 : db $07 
    dw Instruction_PLM_CallFunctionInY 
    dl VariaSuit_Pickup 

InstList_PLM_VariaSuitShotBlock_4:
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_EmptyItemShotBlockReconcealing_0 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_VariaSuitShotBlock_1 

InstList_PLM_GravitySuitShotBlock_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_GravitySuit : db $00,$00,$00,$00,$00,$00,$00,$00 

InstList_PLM_GravitySuitShotBlock_1:
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemShotBlock 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_GravitySuitShotBlock_4 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_GravitySuitShotBlock_3 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $16 

InstList_PLM_GravitySuitShotBlock_2:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero 
    dw InstList_PLM_GravitySuitShotBlock_2 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemShotBlockReconcealing 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_GravitySuitShotBlock_1 

InstList_PLM_GravitySuitShotBlock_3:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_ClearChargeBeamCounter 
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox,$0020 : db $1A 
    dw Instruction_PLM_CallFunctionInY 
    dl GravitySuit_Pickup 

InstList_PLM_GravitySuitShotBlock_4:
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_EmptyItemShotBlockReconcealing_0 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_GravitySuitShotBlock_1 

InstList_PLM_XrayScopeShotBlock_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_XrayScope : db $01,$01,$00,$00,$03,$03,$00,$00 

InstList_PLM_XrayScopeShotBlock_1:
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemShotBlock 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_XrayScopeShotBlock_4 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_XrayScopeShotBlock_3 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $16 

InstList_PLM_XrayScopeShotBlock_2:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero 
    dw InstList_PLM_XrayScopeShotBlock_2 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemShotBlockReconcealing 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_XrayScopeShotBlock_1 

InstList_PLM_XrayScopeShotBlock_3:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Inst_PLM_PickUpEquipment_AddXrayToHUD_DisplayMessageBox,$8000 

InstList_PLM_XrayScopeShotBlock_4:
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_EmptyItemShotBlockReconcealing_0 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_XrayScopeShotBlock_1 

InstList_PLM_PlasmaBeamShotBlock_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_PlasmaBeam : db $00,$01,$00,$00,$00,$01,$00,$00 

InstList_PLM_PlasmaBeamShotBlock_1:
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemShotBlock 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_PlasmaBeamShotBlock_4 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_PlasmaBeamShotBlock_3 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $16 

InstList_PLM_PlasmaBeamShotBlock_2:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero 
    dw InstList_PLM_PlasmaBeamShotBlock_2 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemShotBlockReconcealing 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_PlasmaBeamShotBlock_1 

InstList_PLM_PlasmaBeamShotBlock_3:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_PickUpBeam_DisplayMessageBox,$0008 : db $12 

InstList_PLM_PlasmaBeamShotBlock_4:
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_EmptyItemShotBlockReconcealing_0 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_PlasmaBeamShotBlock_1 

InstList_PLM_GrappleBeamShotBlock_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_GrappleBeam : db $00,$00,$00,$00,$00,$00,$00,$00 

InstList_PLM_GrappleBeamShotBlock_1:
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemShotBlock 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_GrappleBeamShotBlock_4 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_GrappleBeamShotBlock_3 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $16 

InstList_PLM_GrappleBeamShotBlock_2:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero 
    dw InstList_PLM_GrappleBeamShotBlock_2 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemShotBlockReconcealing 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_GrappleBeamShotBlock_1 

InstList_PLM_GrappleBeamShotBlock_3:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Inst_PLM_PickUpEquipment_AddGrappleHUD_DisplayMessageBox,$4000 

InstList_PLM_GrappleBeamShotBlock_4:
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_EmptyItemShotBlockReconcealing_0 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_GrappleBeamShotBlock_1 

InstList_PLM_SpaceJumpShotBlock_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_SpaceJump : db $00,$00,$00,$00,$00,$00,$00,$00 

InstList_PLM_SpaceJumpShotBlock_1:
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemShotBlock 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_SpaceJumpShotBlock_4 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_SpaceJumpShotBlock_3 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $16 

InstList_PLM_SpaceJumpShotBlock_2:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero 
    dw InstList_PLM_SpaceJumpShotBlock_2 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemShotBlockReconcealing 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_SpaceJumpShotBlock_1 

InstList_PLM_SpaceJumpShotBlock_3:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox,$0200 : db $0C 

InstList_PLM_SpaceJumpShotBlock_4:
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_EmptyItemShotBlockReconcealing_0 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_SpaceJumpShotBlock_1 

InstList_PLM_ScrewAttackShotBlock_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_ScrewAttack : db $00,$00,$00,$00,$00,$00,$00,$00 

InstList_PLM_ScrewAttackShotBlock_1:
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemShotBlock 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_ScrewAttackShotBlock_4 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_ScrewAttackShotBlock_3 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $16 

InstList_PLM_ScrewAttackShotBlock_2:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero 
    dw InstList_PLM_ScrewAttackShotBlock_2 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemShotBlockReconcealing 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_ScrewAttackShotBlock_1 

InstList_PLM_ScrewAttackShotBlock_3:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox,$0008 : db $0A 

InstList_PLM_ScrewAttackShotBlock_4:
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_EmptyItemShotBlockReconcealing_0 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_ScrewAttackShotBlock_1 

InstList_PLM_MorphBallShotBlock_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_MorphBall : db $00,$00,$00,$00,$00,$00,$00,$00 

InstList_PLM_MorphBallShotBlock_1:
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemShotBlock 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_MorphBallShotBlock_4 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_MorphBallShotBlock_3 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $16 

InstList_PLM_MorphBallShotBlock_2:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero 
    dw InstList_PLM_MorphBallShotBlock_2 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemShotBlockReconcealing 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_MorphBallShotBlock_1 

InstList_PLM_MorphBallShotBlock_3:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_PickUpEquipment_DisplayMessageBox,$0002 : db $09 

InstList_PLM_MorphBallShotBlock_4:
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_EmptyItemShotBlockReconcealing_0 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_MorphBallShotBlock_1 

InstList_PLM_ReserveTankShotBlock_0:
    dw Instruction_PLM_LoadItemPLMGFX 
    dw ItemPLMGFX_ReserveTank : db $00,$00,$00,$00,$00,$00,$00,$00 

InstList_PLM_ReserveTankShotBlock_1:
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemShotBlock 
    dw Instruction_PLM_GotoY_ifRoomArg_ItemIsCollected 
    dw InstList_PLM_ReserveTankShotBlock_4 
    dw Instruction_PLM_LinkInstruction_Y 
    dw InstList_PLM_ReserveTankShotBlock_3 
    dw Instruction_PLM_PreInstruction_inY 
    dw PreInstruction_PLM_GotoLinkInstructionIfTriggered 
    dw Instruction_PLM_TimerEqualsY_8Bit : db $16 

InstList_PLM_ReserveTankShotBlock_2:
    dw Instruction_PLM_DrawItemFrame0 
    dw Instruction_PLM_DrawItemFrame1 
    dw Instruction_PLM_DecrementTimer_GotoYIfNonZero 
    dw InstList_PLM_ReserveTankShotBlock_2 
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_ItemShotBlockReconcealing 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_ReserveTankShotBlock_1 

InstList_PLM_ReserveTankShotBlock_3:
    dw Instruction_PLM_SetRoomArg_ItemCollected 
    dw Instruction_PLM_ClearMusicQueue_QueueMusicTrack : db $02 
    dw Instruction_PLM_CollectHealth_ReserveTank,$0064 

InstList_PLM_ReserveTankShotBlock_4:
    dw Instruction_PLM_Call_Y 
    dw InstList_PLM_Callable_EmptyItemShotBlockReconcealing_0 
    dw Instruction_PLM_GotoY 
    dw InstList_PLM_ReserveTankShotBlock_1 

Setup_EnergyTank:
    LDA.W #$0008 
    BRA SetPLMItemGFXIndex_DoAbilitySetup 


Setup_MissileTank:
    LDA.W #$000A 
    BRA SetPLMItemGFXIndex_DoAbilitySetup 


Setup_SuperMissileTank:
    LDA.W #$000C 
    BRA SetPLMItemGFXIndex_DoAbilitySetup 


Setup_PowerBombTank:
    LDA.W #$000E 

SetPLMItemGFXIndex_DoAbilitySetup:
    TYX 
    STA.L $7EDF0C,X 

Setup_Ability:
    LDX.W $1C87,Y 
    LDA.W #$0045 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    LDA.L $7ED91A 
    INC A 
    STA.L $7ED91A 
    RTS 


Setup_EnergyTankShotBlock:
    LDA.W #$0008 
    BRA SetPLMItemGFXINdex_DoAbilityShotBlockSetup 


SetupMissileTankShotBlock:
    LDA.W #$000A 
    BRA SetPLMItemGFXINdex_DoAbilityShotBlockSetup 


Setup_SuperMissileTankShotBlock:
    LDA.W #$000C 
    BRA SetPLMItemGFXINdex_DoAbilityShotBlockSetup 


Setup_PowerBombTankShotBlock:
    LDA.W #$000E 

SetPLMItemGFXINdex_DoAbilityShotBlockSetup:
    TYX 
    STA.L $7EDF0C,X 

Setup_AbilityShotBlock:
    LDX.W $1C87,Y 
    LDA.W #$C045 
    JSR.W Write_Level_Data_Block_Type_and_BTS 
    LDX.W $1C87,Y 
    LDA.L $7F0002,X : STA.W $1E17,Y 
    LDA.L $7ED91A 
    INC A 
    STA.L $7ED91A 
    RTS 


Setup_ItemCollisionDetection:
    LDA.W $0A78 
    BNE .delete 
    TYX 
    LDA.W $1C87,X 
    STZ.W $1C87,X 
    LDX.W #$004E 

.loop:
    CMP.W $1C87,X 
    BEQ .found 
    DEX #2
    BPL .loop 
    db $00 ; BRK with no operand

.found:
    LDA.W #$00FF : STA.W $1D77,X 
    CLC 
    RTS 


.delete:
    LDA.W #$0000 : STA.W $1C37,Y 
    RTS 


PLMEntries_ItemCollisionDetection:
    dw Setup_ItemCollisionDetection 
    dw InstList_PLM_Delete 

PLMEntries_EnergyTank:
    dw Setup_EnergyTank 
    dw InstList_PLM_EnergyTank_0 

PLMEntries_MissileTank:
    dw Setup_MissileTank 
    dw InstList_PLM_MissileTank_0 

PLMEntries_SuperMissileTank:
    dw Setup_SuperMissileTank 
    dw InstList_PLM_SuperMissileTank_0 

PLMEntries_PowerBombTank:
    dw Setup_PowerBombTank 
    dw InstList_PLM_PowerBombTank_0 

PLMEntries_Bombs:
    dw Setup_Ability 
    dw InstList_PLM_Bombs_0 

PLMEntries_ChargeBeam:
    dw Setup_Ability 
    dw InstList_PLM_ChargeBeam_0 

PLMEntries_IceBeam:
    dw Setup_Ability 
    dw InstList_PLM_IceBeam_0 

PLMEntries_HiJumpBoots:
    dw Setup_Ability 
    dw InstList_PLM_HiJumpBoots_0 

PLMEntries_SpeedBooster:
    dw Setup_Ability 
    dw InstList_PLM_SpeedBooster_0 

PLMEntries_WaveBeam:
    dw Setup_Ability 
    dw InstList_PLM_WaveBeam_0 

PLMEntries_Spazer:
    dw Setup_Ability 
    dw InstList_PLM_Spazer_0 

PLMEntries_SpringBall:
    dw Setup_Ability 
    dw InstList_PLM_SpringBall_0 

PLMEntries_VariaSuit:
    dw Setup_Ability 
    dw InstList_PLM_VariaSuit_0 

PLMEntries_GravitySuit:
    dw Setup_Ability 
    dw InstList_PLM_GravitySuit_0 

PLMEntries_XrayScope:
    dw Setup_Ability 
    dw InstList_PLM_XrayScope_0 

PLMEntries_PlasmaBeam:
    dw Setup_Ability 
    dw InstList_PLM_PlasmaBeam_0 

PLMEntries_GrappleBeam:
    dw Setup_Ability 
    dw InstList_PLM_GrappleBeam_0 

PLMEntries_SpaceJump:
    dw Setup_Ability 
    dw InstList_PLM_SpaceJump_0 

PLMEntries_ScrewAttack:
    dw Setup_Ability 
    dw InstList_PLM_ScrewAttack_0 

PLMEntries_MorphBall:
    dw Setup_Ability 
    dw InstList_PLM_MorphBall_0 

PLMEntries_ReserveTank:
    dw Setup_Ability 
    dw InstList_PLM_ReserveTank_0 

PLMEntries_EnergyTankChozoOrb:
    dw Setup_EnergyTank 
    dw InstList_PLM_EnergyTankChozoOrb_0 

PLMEntries_MissileTankChozoOrb:
    dw Setup_MissileTank 
    dw InstList_PLM_MissileTankChozoOrb_0 

PLMEntries_SuperMissileTankChozoOrb:
    dw Setup_SuperMissileTank 
    dw InstList_PLM_SuperMissileTankChozoOrb_0 

PLMEntries_PowerBombTankChozoOrb:
    dw Setup_PowerBombTank 
    dw InstList_PLM_PowerBombTankChozoOrb_0 

PLMEntries_BombsChozoOrb:
    dw Setup_Ability 
    dw InstList_PLM_BombsChozoOrb_0 

PLMEntries_ChargeBeamChozoOrb:
    dw Setup_Ability 
    dw InstList_PLM_ChargeBeamChozoOrb_0 

PLMEntries_IceBeamChozoOrb:
    dw Setup_Ability 
    dw InstList_PLM_IceBeamChozoOrb_0 

PLMEntries_HiJumpBootsChozoOrb:
    dw Setup_Ability 
    dw InstList_PLM_HiJumpBootsChozoOrb_0 

PLMEntries_SpeedBoosterChozoOrb:
    dw Setup_Ability 
    dw InstList_PLM_SpeedBoosterChozoOrb_0 

PLMEntries_WaveBeamChozoOrb:
    dw Setup_Ability 
    dw InstList_PLM_WaveBeamChozoOrb_0 

PLMEntries_SpazerChozoOrb:
    dw Setup_Ability 
    dw InstList_PLM_SpazerChozoOrb_0 

PLMEntries_SpringBallChozoOrb:
    dw Setup_Ability 
    dw InstList_PLM_SpringBallChozoOrb_0 

PLMEntries_VariaSuitChozoOrb:
    dw Setup_Ability 
    dw InstList_PLM_VariaSuitChozoOrb_0 

PLMEntries_GravitySuitChozoOrb:
    dw Setup_Ability 
    dw InstList_PLM_GravitySuitChozoOrb_0 

PLMEntries_XrayScopeChozoOrb:
    dw Setup_Ability 
    dw InstList_PLM_XrayScopeChozoOrb_0 

PLMEntries_PlasmaBeamChozoOrb:
    dw Setup_Ability 
    dw InstList_PLM_PlasmaBeamChozoOrb_0 

PLMEntries_GrappleBeamChozoOrb:
    dw Setup_Ability 
    dw InstList_PLM_GrappleBeamChozoOrb_0 

PLMEntries_SpaceJumpChozoOrb:
    dw Setup_Ability 
    dw InstList_PLM_SpaceJumpChozoOrb_0 

PLMEntries_ScrewAttackChozoOrb:
    dw Setup_Ability 
    dw InstList_PLM_ScrewAttackChozoOrb_0 

PLMEntries_MorphBallChozoOrb:
    dw Setup_Ability 
    dw InstList_PLM_MorphBallChozoOrb_0 

PLMEntries_ReserveTankChozoOrb:
    dw Setup_Ability 
    dw InstList_PLM_ReserveTankChozoOrb_0 

PLMEntries_EnergyTankShotBlock:
    dw Setup_EnergyTankShotBlock 
    dw InstList_PLM_EnergyTankShotBlock_0 

PLMEntries_MissileTankShotBlock:
    dw SetupMissileTankShotBlock 
    dw InstList_PLM_MissileTankShotBlock_0 

PLMEntries_SuperMissileTankShotBlock:
    dw Setup_SuperMissileTankShotBlock 
    dw InstList_PLM_SuperMissileTankShotBlock_0 

PLMEntries_PowerBombTankShotBlock:
    dw Setup_PowerBombTankShotBlock 
    dw InstList_PLM_PowerBombTankShotBlock_0 

PLMEntries_BombsShotBlock:
    dw Setup_AbilityShotBlock 
    dw InstList_PLM_BombsShotBlock_0 

PLMEntries_ChargeBeamShotBlock:
    dw Setup_AbilityShotBlock 
    dw InstList_PLM_ChargeBeamShotBlock_0 

PLMEntries_IceBeamShotBlock:
    dw Setup_AbilityShotBlock 
    dw InstList_PLM_IceBeamShotBlock_0 

PLMEntries_HiJumpBootsShotBlock:
    dw Setup_AbilityShotBlock 
    dw InstList_PLM_HiJumpBootsShotBlock_0 

PLMEntries_SpeedBoosterShotBlock:
    dw Setup_AbilityShotBlock 
    dw InstList_PLM_SpeedBoosterShotBlock_0 

PLMEntries_WaveBeamShotBlock:
    dw Setup_AbilityShotBlock 
    dw InstList_PLM_WaveBeamShotBlock_0 

PLMEntries_SpazerShotBlock:
    dw Setup_AbilityShotBlock 
    dw InstList_PLM_SpazerShotBlock_0 

PLMEntries_SpringBallShotBlock:
    dw Setup_AbilityShotBlock 
    dw InstList_PLM_SpringBallShotBlock_0 

PLMEntries_VariaSuitShotBlock:
    dw Setup_AbilityShotBlock 
    dw InstList_PLM_VariaSuitShotBlock_0 

PLMEntries_GravitySuitShotBlock:
    dw Setup_AbilityShotBlock 
    dw InstList_PLM_GravitySuitShotBlock_0 

PLMEntries_XrayScopeShotBlock:
    dw Setup_AbilityShotBlock 
    dw InstList_PLM_XrayScopeShotBlock_0 

PLMEntries_PlasmaBeamShotBlock:
    dw Setup_AbilityShotBlock 
    dw InstList_PLM_PlasmaBeamShotBlock_0 

PLMEntries_GrappleBeamShotBlock:
    dw Setup_AbilityShotBlock 
    dw InstList_PLM_GrappleBeamShotBlock_0 

PLMEntries_SpaceJumpShotBlock:
    dw Setup_AbilityShotBlock 
    dw InstList_PLM_SpaceJumpShotBlock_0 

PLMEntries_ScrewAttackShotBlock:
    dw Setup_AbilityShotBlock 
    dw InstList_PLM_ScrewAttackShotBlock_0 

PLMEntries_MorphBallShotBlock:
    dw Setup_AbilityShotBlock 
    dw InstList_PLM_MorphBallShotBlock_0 

PLMEntries_ReserveTankShotBlock:
    dw Setup_AbilityShotBlock 
    dw InstList_PLM_ReserveTankShotBlock_0 

Freespace_Bank84_EFD3: 
; $102D bytes
